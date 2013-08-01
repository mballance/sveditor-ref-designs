/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_01.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=1234"
.ident "Fri Nov 21 16:06:03 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_01.s,v 1.3 2007/07/27 21:45:31 drp Exp $"
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
	set	0x9,	%g1
	set	0x8,	%g2
	set	0x3,	%g3
	set	0x0,	%g4
	set	0xD,	%g5
	set	0xF,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xA,	%i1
	set	-0x1,	%i2
	set	-0x3,	%i3
	set	-0x0,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x741FD612,	%l0
	set	0x150D1EE3,	%l1
	set	0x33C5F95B,	%l2
	set	0x0824F6B4,	%l3
	set	0x071A2858,	%l4
	set	0x450B8AFB,	%l5
	set	0x72C81A65,	%l6
	!# Output registers
	set	-0x102A,	%o0
	set	-0x1EEA,	%o1
	set	-0x0D07,	%o2
	set	-0x000E,	%o3
	set	0x0E15,	%o4
	set	0x10D0,	%o5
	set	0x1D7F,	%o6
	set	0x1FFE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	tvc	%xcc,	0x4
	call	loop_1
	edge32l	%l5,	%o3,	%l0
	fmovduge	%fcc0,	%f22,	%f8
	fmovsle	%fcc3,	%f3,	%f29
loop_1:
	xnorcc	%i7,	0x0960,	%o4
	call	loop_2
	orncc	%g2,	0x0E85,	%g5
	smulcc	%g1,	0x0D7A,	%g6
	fmovdule	%fcc3,	%f16,	%f6
loop_2:
	fnot2	%f30,	%f26
	call	loop_3
	call	loop_4
	call	loop_5
	fmovdpos	%icc,	%f2,	%f6
loop_3:
	fbg	%fcc1,	loop_6
loop_4:
	call	loop_7
loop_5:
	tvs	%xcc,	0x5
	fmovdneg	%xcc,	%f24,	%f4
loop_6:
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f30
loop_7:
	ldsw	[%l7 + 0x10],	%g7
	nop
	setx loop_8, %l0, %l1
	jmpl %l1, %i3
	call	loop_9
	call	loop_10
	movrgz	%l1,	%i4,	%o7
loop_8:
	fandnot2	%f30,	%f0,	%f20
loop_9:
	call	loop_11
loop_10:
	fmovrdne	%o0,	%f8,	%f14
	rd	%asi,	%o1
	tsubcctv	%l2,	0x0F3E,	%o2
loop_11:
	movre	%l4,	0x178,	%i5
	movneg	%xcc,	0x112,	%l3
	fpsub32	%f20,	%f16,	%f0
	fmovrde	%g3,	%f4,	%f28
	call	loop_12
	fmul8x16	%f26,	%f12,	%f2
	sll	%i6,	%i0,	%i1
	lduw	[%l7 + 0x68],	%l6
loop_12:
	for	%f16,	%f26,	%f8
	fmul8x16al	%f26,	%f27,	%f26
	call	loop_13
	movrne	%o6,	0x142,	%i2
	call	loop_14
	call	loop_15
loop_13:
	call	loop_16
	fnegs	%f24,	%f7
loop_14:
	fmovdcs	%icc,	%f4,	%f26
loop_15:
	fsrc2	%f16,	%f0
loop_16:
	fmovrde	%o5,	%f0,	%f14
	fandnot1s	%f27,	%f30,	%f31
	membar	0x1D
	call	loop_17
	nop
	setx	0xAE2C13008415BFFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f26
	fors	%f18,	%f10,	%f8
	fmovdn	%xcc,	%f22,	%f30
loop_17:
	fmovdle	%fcc3,	%f20,	%f22
	movrgez	%l5,	%o3,	%l0
	call	loop_18
	pdist	%f28,	%f16,	%f28
	orncc	%g4,	0x0977,	%i7
	nop
	fitos	%f29,	%f5
loop_18:
	movgu	%xcc,	%g2,	%g5
	fbu	%fcc3,	loop_19
	fmovsue	%fcc1,	%f24,	%f1
	array8	%o4,	%g1,	%g7
	fmovdpos	%xcc,	%f24,	%f24
loop_19:
	call	loop_20
	call	loop_21
	brnz,a,pn	%g6,	loop_22
	call	loop_23
loop_20:
	te	%xcc,	0x1
loop_21:
	fmovsvs	%icc,	%f20,	%f6
loop_22:
	movvs	%icc,	0x003,	%l1
loop_23:
	fmovda	%fcc3,	%f0,	%f20
	call	loop_24
	call	loop_25
	edge8ln	%i4,	%o7,	%o0
	and	%i3,	%l2,	%o2
loop_24:
	call	loop_26
loop_25:
	call	loop_27
	edge32n	%l4,	%i5,	%o1
	subcc	%l3,	%i6,	%i0
loop_26:
	ldx	[%l7 + 0x10],	%g3
loop_27:
	ldd	[%l7 + 0x78],	%i0
	fmovsul	%fcc3,	%f29,	%f27
	call	loop_28
	fmovrdgez	%o6,	%f20,	%f2
	fmovrsgez	%i2,	%f10,	%f24
	movvc	%xcc,	%l6,	%l5
loop_28:
	nop
	setx	loop_29,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnor	%f8,	%f26,	%f24
	fnegd	%f2,	%f22
	call	loop_30
loop_29:
	fmovspos	%xcc,	%f1,	%f24
	fcmps	%fcc1,	%f9,	%f24
	bcs	%xcc,	loop_31
loop_30:
	rdpr	%wstate,	%o3
	call	loop_32
	andn	%o5,	%g4,	%i7
loop_31:
	wr	%l0,	0x1C3D,	%y
	bmask	%g2,	%o4,	%g5
loop_32:
	fmovdne	%fcc2,	%f30,	%f6
	fmuld8ulx16	%f26,	%f19,	%f0
	std	%f22,	[%l7 + 0x70]
	brz,a	%g7,	loop_33
	fpsub16	%f26,	%f24,	%f30
	call	loop_34
	nop
	setx	0x12D6D997,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x599E50F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f6,	%f31
loop_33:
	fcmpeq32	%f16,	%f18,	%g6
	fbn,a	%fcc2,	loop_35
loop_34:
	fmovrde	%l1,	%f2,	%f10
	movl	%fcc2,	%g1,	%i4
	fpsub16s	%f15,	%f11,	%f1
loop_35:
	nop
	setx	0xBFAD5A87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xAC1549B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f8,	%f13
	fmovsle	%fcc3,	%f27,	%f9
	nop
	set	0x44, %o3
	ldub	[%l7 + %o3],	%o0
	siam	0x4
	fands	%f5,	%f14,	%f5
	fpack32	%f26,	%f22,	%f18
	movpos	%xcc,	%o7,	%i3
	call	loop_36
	call	loop_37
	fones	%f22
	membar	0x01
loop_36:
	array8	%o2,	%l2,	%l4
loop_37:
	rdhpr	%htba,	%o1
	movvs	%icc,	0x400,	%i5
	call	loop_38
	mulscc	%l3,	0x14B6,	%i0
	call	loop_39
	tneg	%xcc,	0x2
loop_38:
	bmask	%g3,	%i6,	%o6
	fcmped	%fcc0,	%f6,	%f24
loop_39:
	fba	%fcc1,	loop_40
	fone	%f4
	fmovdule	%fcc0,	%f16,	%f10
	taddcctv	%i2,	0x1FD0,	%l6
loop_40:
	fmovsvc	%icc,	%f26,	%f4
	call	loop_41
	call	loop_42
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_43
loop_41:
	call	loop_44
loop_42:
	fmovdpos	%icc,	%f8,	%f30
	popc	%o5,	%l5
loop_43:
	fcmped	%fcc0,	%f10,	%f8
loop_44:
	te	%icc,	0x5
	fsrc1	%f22,	%f2
	nop
	setx	0xE235DA1EB135DE2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f2
	call	loop_45
	bshuffle	%f6,	%f20,	%f18
	xorcc	%g4,	0x17C4,	%i7
	fcmpeq32	%f4,	%f16,	%g2
loop_45:
	fcmpgt32	%f28,	%f2,	%o4
	brgz,pt	%g5,	loop_46
	tle	%xcc,	0x6
	call	loop_47
	movre	%l0,	0x08B,	%g6
loop_46:
	call	loop_48
	call	loop_49
loop_47:
	umul	%g7,	0x0B94,	%l1
	call	loop_50
loop_48:
	edge8n	%i4,	%o0,	%o7
loop_49:
	brlz,a	%g1,	loop_51
	fba,a,pt	%fcc1,	loop_52
loop_50:
	add	%i3,	0x06E9,	%o2
	fmovrslz	%l2,	%f0,	%f17
loop_51:
	fmovduge	%fcc3,	%f14,	%f30
loop_52:
	tcs	%xcc,	0x0
	fmovslg	%fcc2,	%f13,	%f17
	brgz,pn	%l4,	loop_53
	alignaddrl	%i5,	%o1,	%l3
	fmul8x16au	%f31,	%f29,	%f2
	tpos	%xcc,	0x4
loop_53:
	ldub	[%l7 + 0x7A],	%i0
	smulcc	%i6,	%g3,	%o6
	fcmpgt16	%f10,	%f26,	%i2
	membar	0x5C
	fmovdcc	%xcc,	%f4,	%f16
	fbne,a,pn	%fcc1,	loop_54
	nop
	fitos	%f19,	%f15
	edge32n	%l6,	%i1,	%o5
	faligndata	%f16,	%f0,	%f22
loop_54:
	fpackfix	%f2,	%f23
	call	loop_55
	tcc	%icc,	0x1
	fbn,a,pt	%fcc2,	loop_56
	fcmple32	%f26,	%f26,	%l5
loop_55:
	fpack16	%f26,	%f28
	fxnors	%f20,	%f30,	%f20
loop_56:
	rd	%tick_cmpr,	%g4
	fble,pn	%fcc2,	loop_57
	movleu	%xcc,	%i7,	%o3
	fcmple32	%f28,	%f2,	%g2
	nop
	setx	0x303A8473,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x0CF00ECA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f2,	%f24
loop_57:
	sllx	%o4,	0x11,	%g5
	fnot1s	%f24,	%f6
	fmovrdlz	%g6,	%f26,	%f18
	movne	%xcc,	%l0,	%g7
	for	%f10,	%f2,	%f12
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 7
!	Type a   	: 6
!	Type cti   	: 57
!	Type f   	: 77
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
	set	0x1,	%g1
	set	0xB,	%g2
	set	0xB,	%g3
	set	0x9,	%g4
	set	0x3,	%g5
	set	0x8,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x8,	%i1
	set	-0xC,	%i2
	set	-0x3,	%i3
	set	-0x6,	%i4
	set	-0x6,	%i5
	set	-0x1,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x2369D27E,	%l0
	set	0x34EF8C7F,	%l1
	set	0x6C5FB213,	%l2
	set	0x6A354D6B,	%l3
	set	0x29BF34DE,	%l4
	set	0x05D9A193,	%l5
	set	0x222724CF,	%l6
	!# Output registers
	set	0x17C1,	%o0
	set	-0x00EC,	%o1
	set	0x0D8F,	%o2
	set	-0x181A,	%o3
	set	0x1C18,	%o4
	set	0x1E75,	%o5
	set	-0x1E7F,	%o6
	set	0x16DD,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	nop
	setx	0x1FD2,	%l0,	%i4
	sdivcc	%l1,	%i4,	%o7
	call	loop_58
	call	loop_59
	call	loop_60
	fmovsn	%fcc2,	%f19,	%f7
loop_58:
	call	loop_61
loop_59:
	rd	%ccr,	%o0
loop_60:
	movlg	%fcc3,	0x0EE,	%g1
	call	loop_62
loop_61:
	movvc	%xcc,	0x292,	%o2
	fcmpd	%fcc2,	%f0,	%f6
	set	0x58, %i1
	sta	%f18,	[%l7 + %i1] 0x10
loop_62:
	movle	%icc,	%i3,	%l4
	be	%xcc,	loop_63
	call	loop_64
	or	%i5,	0x1910,	%o1
	fmovsn	%xcc,	%f2,	%f3
loop_63:
	fmovdvs	%xcc,	%f6,	%f8
loop_64:
	tl	%xcc,	0x7
	fcmpeq32	%f30,	%f20,	%l3
	srlx	%i0,	%i6,	%g3
	tvs	%xcc,	0x3
	call	loop_65
	call	loop_66
	call	loop_67
	call	loop_68
loop_65:
	movrne	%l2,	%i2,	%l6
loop_66:
	fand	%f0,	%f0,	%f0
loop_67:
	call	loop_69
loop_68:
	fmovrdne	%i1,	%f10,	%f8
	call	loop_70
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f12
loop_69:
	fmovsule	%fcc0,	%f19,	%f14
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%o5
loop_70:
	movgu	%xcc,	0x6AF,	%o6
	fornot2	%f20,	%f12,	%f6
	sir	0x1507
	fnand	%f18,	%f28,	%f24
	edge8n	%g4,	%i7,	%l5
	fmovsue	%fcc1,	%f11,	%f20
	call	loop_71
	stx	%o3,	[%l7 + 0x30]
	sir	0x0AA2
	taddcc	%g2,	%o4,	%g6
loop_71:
	alignaddr	%l0,	%g7,	%g5
	set	0x20, %o5
	ldswa	[%l7 + %o5] 0x88,	%i4
	fmovrdgez	%o7,	%f28,	%f2
	fmovso	%fcc0,	%f14,	%f27
	movl	%fcc3,	%o0,	%l1
	call	loop_72
	fpmerge	%f23,	%f10,	%f22
	call	loop_73
	nop
	set	0x10, %o7
	stx	%o2,	[%l7 + %o7]
loop_72:
	call	loop_74
	call	loop_75
loop_73:
	ldd	[%l7 + 0x08],	%i2
	call	loop_76
loop_74:
	fornot1	%f8,	%f4,	%f6
loop_75:
	fcmpgt32	%f30,	%f26,	%g1
	movvc	%icc,	%i5,	%o1
loop_76:
	call	loop_77
	tn	%icc,	0x6
	call	loop_78
	fnor	%f10,	%f0,	%f2
loop_77:
	sdivx	%l4,	0x1C38,	%l3
	call	loop_79
loop_78:
	sll	%i0,	0x14,	%g3
	call	loop_80
	edge16n	%l2,	%i2,	%i6
loop_79:
	fcmpes	%fcc3,	%f21,	%f16
	xorcc	%l6,	%i1,	%o5
loop_80:
	and	%g4,	0x162C,	%i7
	and	%o6,	0x0967,	%l5
	fandnot2s	%f6,	%f26,	%f10
	call	loop_81
	array8	%o3,	%g2,	%o4
	udivcc	%l0,	0x16EE,	%g7
	tn	%xcc,	0x6
loop_81:
	fbg,pt	%fcc2,	loop_82
	orcc	%g6,	%i4,	%o7
	fbn	%fcc2,	loop_83
	fnot2	%f8,	%f30
loop_82:
	movgu	%icc,	%g5,	%o0
	fmovrse	%o2,	%f23,	%f16
loop_83:
	call	loop_84
	xorcc	%l1,	%i3,	%g1
	fmovduge	%fcc1,	%f26,	%f20
	fmul8sux16	%f20,	%f0,	%f4
loop_84:
	call	loop_85
	fone	%f16
	xorcc	%o1,	%l4,	%i5
	call	loop_86
loop_85:
	fsrc1s	%f31,	%f15
	edge32	%i0,	%g3,	%l3
	te	%icc,	0x1
loop_86:
	fmovs	%f12,	%f9
	alignaddr	%l2,	%i2,	%l6
	array8	%i6,	%i1,	%g4
	set	0x08, %g5
	stxa	%i7,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	setx	0xF56FA45E8882697B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f18
	tsubcc	%o5,	%o6,	%o3
	srax	%g2,	%l5,	%l0
	tvc	%xcc,	0x5
	call	loop_87
	fone	%f12
	and	%o4,	0x03FB,	%g7
	membar	0x76
loop_87:
	fmul8x16au	%f8,	%f11,	%f8
	call	loop_88
	fornot1s	%f7,	%f4,	%f27
	sllx	%i4,	%g6,	%o7
	move	%icc,	0x332,	%g5
loop_88:
	call	loop_89
	wrpr	%o0,	%o2,	%cwp
	fmovsl	%fcc0,	%f17,	%f21
	fbe,pn	%fcc2,	loop_90
loop_89:
	popc	0x18AB,	%i3
	set	0x25, %g7
	ldstuba	[%l7 + %g7] 0x18,	%g1
loop_90:
	fmul8x16al	%f28,	%f11,	%f26
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o1
	brnz	%l4,	loop_91
	fpsub16	%f18,	%f2,	%f6
	call	loop_92
	call	loop_93
loop_91:
	rdhpr	%htba,	%i5
	call	loop_94
loop_92:
	fmovdn	%xcc,	%f16,	%f20
loop_93:
	fmuld8ulx16	%f9,	%f0,	%f26
	call	loop_95
loop_94:
	add	%l1,	%i0,	%l3
	fmovrsne	%g3,	%f26,	%f30
	fandnot1	%f24,	%f26,	%f10
loop_95:
	umulcc	%l2,	0x1726,	%i2
	call	loop_96
	movle	%fcc0,	%l6,	%i1
	fornot2s	%f19,	%f11,	%f12
	xnorcc	%i6,	%g4,	%i7
loop_96:
	fpackfix	%f18,	%f12
	taddcctv	%o5,	%o3,	%o6
	ld	[%l7 + 0x0C],	%f26
	fbule	%fcc2,	loop_97
	call	loop_98
	call	loop_99
	call	loop_100
loop_97:
	fandnot1	%f24,	%f24,	%f18
loop_98:
	rdhpr	%hintp,	%g2
loop_99:
	bl	%icc,	loop_101
loop_100:
	fsrc1s	%f5,	%f26
	call	loop_102
	tvc	%xcc,	0x7
loop_101:
	nop
	setx	0x9D7B740F809BCD62,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f30
	orncc	%l0,	0x192F,	%o4
loop_102:
	edge16	%g7,	%l5,	%g6
	call	loop_103
	movrne	%o7,	0x191,	%g5
	srax	%i4,	%o0,	%o2
	call	loop_104
loop_103:
	call	loop_105
	movlg	%fcc2,	0x524,	%g1
	call	loop_106
loop_104:
	call	loop_107
loop_105:
	call	loop_108
	fmul8x16au	%f3,	%f11,	%f14
loop_106:
	fmovdul	%fcc1,	%f26,	%f18
loop_107:
	andcc	%i3,	%l4,	%o1
loop_108:
	fbu	%fcc2,	loop_109
	fand	%f26,	%f14,	%f2
	call	loop_110
	call	loop_111
loop_109:
	rdpr	%gl,	%i5
	nop
	setx	0xF40D9C3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x80BD1101,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f13,	%f21
loop_110:
	tg	%icc,	0x2
loop_111:
	call	loop_112
	call	loop_113
	fmovdg	%icc,	%f4,	%f8
	taddcc	%l1,	%l3,	%i0
loop_112:
	andn	%l2,	0x0872,	%g3
loop_113:
	fnands	%f19,	%f20,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF86, 	%hsys_tick_cmpr
	fexpand	%f2,	%f24
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x58] %asi,	%l6
	fand	%f6,	%f2,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE12, 	%hsys_tick_cmpr
	fmovsg	%fcc2,	%f19,	%f1
	nop
	fitos	%f10,	%f21
	fstod	%f21,	%f0
	movn	%fcc0,	%i6,	%i7
	nop
	setx	0xD137A5D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x63411BF2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f5,	%f1
	movgu	%xcc,	%o5,	%o6
	call	loop_114
	nop
	set	0x7A, %g3
	stb	%g2,	[%l7 + %g3]
	mulscc	%o3,	%l0,	%g7
	edge32	%l5,	%o4,	%o7
loop_114:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 13
!	Type a   	: 7
!	Type x   	: 7
!	Type cti   	: 57
!	Type f   	: 54
!	Type i   	: 62
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
	set	0x1,	%g1
	set	0x3,	%g2
	set	0x2,	%g3
	set	0xD,	%g4
	set	0xB,	%g5
	set	0x4,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0xB,	%i1
	set	-0x9,	%i2
	set	-0xD,	%i3
	set	-0xC,	%i4
	set	-0x2,	%i5
	set	-0x2,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x743B66E2,	%l0
	set	0x7E5C0BCA,	%l1
	set	0x2F489306,	%l2
	set	0x64416DAB,	%l3
	set	0x61C8C0E3,	%l4
	set	0x0FC211D6,	%l5
	set	0x762457E3,	%l6
	!# Output registers
	set	-0x06C3,	%o0
	set	0x110E,	%o1
	set	0x1418,	%o2
	set	-0x1B53,	%o3
	set	0x1FC5,	%o4
	set	-0x1C01,	%o5
	set	-0x1454,	%o6
	set	-0x1D6E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	call	loop_115
	fmovso	%fcc2,	%f20,	%f3
	set	0x40, %g1
	stda	%g4,	[%l7 + %g1] 0x80
loop_115:
	tneg	%icc,	0x3
	fmovslg	%fcc1,	%f24,	%f22
	fmovdvs	%icc,	%f28,	%f12
	fmovsgu	%xcc,	%f23,	%f6
	call	loop_116
	fmovsa	%fcc1,	%f31,	%f14
	tleu	%xcc,	0x7
	call	loop_117
loop_116:
	stx	%g6,	[%l7 + 0x38]
	fabsd	%f18,	%f24
	movl	%fcc0,	%i4,	%o2
loop_117:
	movlg	%fcc2,	0x3C8,	%g1
	call	loop_118
	call	loop_119
	fmovsule	%fcc1,	%f12,	%f26
	fzero	%f22
loop_118:
	nop
	set	0x47, %o0
	ldstuba	[%l7 + %o0] 0x11,	%o0
loop_119:
	wrpr	%i3,	%l4,	%cwp
	addcc	%i5,	%l1,	%o1
	bmask	%l3,	%i0,	%g3
	call	loop_120
	call	loop_121
	mulscc	%i2,	0x048E,	%l2
	fmovdge	%icc,	%f16,	%f30
loop_120:
	std	%i0,	[%l7 + 0x70]
loop_121:
	tn	%xcc,	0x0
	fmovrde	%l6,	%f20,	%f26
	call	loop_122
	fmovsu	%fcc1,	%f27,	%f2
	movug	%fcc2,	0x555,	%i6
	movuge	%fcc2,	%g4,	%i7
loop_122:
	fmovsue	%fcc2,	%f25,	%f23
	fabsd	%f20,	%f28
	call	loop_123
	subc	%o6,	0x01D1,	%o5
	sra	%g2,	%o3,	%l0
	tneg	%icc,	0x0
loop_123:
	umulcc	%l5,	0x03F3,	%g7
	rdpr	%tl,	%o4
	call	loop_124
	orcc	%o7,	0x05E7,	%g6
	fmovsvc	%xcc,	%f26,	%f18
	fcmple32	%f4,	%f10,	%g5
loop_124:
	fbug,pn	%fcc0,	loop_125
	call	loop_126
	or	%i4,	0x1A5D,	%g1
	movlg	%fcc0,	%o2,	%o0
loop_125:
	call	loop_127
loop_126:
	nop
	setx	loop_128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_129
	movgu	%xcc,	0x738,	%l4
loop_127:
	call	loop_130
loop_128:
	call	loop_131
loop_129:
	movre	%i5,	%i3,	%l1
	fones	%f0
loop_130:
	sllx	%l3,	%i0,	%g3
loop_131:
	fcmpeq32	%f28,	%f16,	%o1
	tgu	%xcc,	0x0
	rdhpr	%hpstate,	%l2
	sub	%i2,	0x044E,	%l6
	tsubcctv	%i6,	0x08A1,	%i1
	fblg,a,pn	%fcc2,	loop_132
	movrgz	%g4,	0x03E,	%o6
	nop
	fitos	%f10,	%f27
	brlz,pt	%o5,	loop_133
loop_132:
	nop
	setx	0x1D81A94789A115B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	tpos	%icc,	0x3
	fands	%f29,	%f29,	%f12
loop_133:
	fsrc1	%f14,	%f20
	sll	%g2,	0x19,	%i7
	call	loop_134
	fpack16	%f2,	%f18
	call	loop_135
	edge32ln	%l0,	%l5,	%o3
loop_134:
	call	loop_136
	wr	%g7,	0x176C,	%pic
loop_135:
	call	loop_137
	movg	%fcc2,	0x766,	%o7
loop_136:
	call	loop_138
	call	loop_139
loop_137:
	call	loop_140
	bmask	%o4,	%g5,	%i4
loop_138:
	call	loop_141
loop_139:
	siam	0x0
loop_140:
	fzero	%f10
	call	loop_142
loop_141:
	call	loop_143
	call	loop_144
	fands	%f21,	%f3,	%f12
loop_142:
	movne	%xcc,	%g1,	%g6
loop_143:
	fmovdo	%fcc3,	%f24,	%f30
loop_144:
	nop
	setx	0xFF3B7171,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	taddcc	%o0,	%l4,	%o2
	nop
	setx loop_145, %l0, %l1
	jmpl %l1, %i3
	call	loop_146
	sir	0x1FB2
	nop
	fitos	%f6,	%f9
	fstod	%f9,	%f30
loop_145:
	nop
	setx	0xF2BED02021284901,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f4
loop_146:
	wr	%l1,	0x1309,	%clear_softint
	fxor	%f16,	%f10,	%f10
	call	loop_147
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f10
	fxtos	%f10,	%f29
	call	loop_148
	nop
	setx	0x7D8AEE0B49662472,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xFC03398C6DBF9BE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f16,	%f26
loop_147:
	fsrc2s	%f2,	%f12
	movue	%fcc2,	0x619,	%i5
loop_148:
	nop
	set	0x7C, %l3
	prefetch	[%l7 + %l3],	 1
	call	loop_149
	mova	%xcc,	0x5DA,	%l3
	xor	%i0,	0x1F15,	%o1
	movul	%fcc3,	0x364,	%g3
loop_149:
	fsrc1	%f2,	%f30
	fzero	%f2
	movrgz	%l2,	%l6,	%i6
	call	loop_150
	tcs	%icc,	0x0
	sethi	0x0D00,	%i2
	call	loop_151
loop_150:
	wr	%g4,	%i1,	%sys_tick
	bvc	%xcc,	loop_152
	call	loop_153
loop_151:
	bvs,pn	%xcc,	loop_154
	tg	%xcc,	0x1
loop_152:
	movrgz	%o6,	0x110,	%o5
loop_153:
	sth	%i7,	[%l7 + 0x3C]
loop_154:
	fmovsle	%xcc,	%f16,	%f8
	call	loop_155
	or	%l0,	0x0939,	%l5
	call	loop_156
	andn	%g2,	%g7,	%o7
loop_155:
	fmovsue	%fcc2,	%f29,	%f2
	tvs	%icc,	0x1
loop_156:
	fmovrde	%o3,	%f8,	%f20
	movlg	%fcc1,	0x328,	%o4
	fnegd	%f12,	%f18
	fmovso	%fcc3,	%f22,	%f25
	fandnot1s	%f4,	%f30,	%f0
	edge16l	%i4,	%g5,	%g6
	bshuffle	%f8,	%f4,	%f2
	edge8n	%o0,	%g1,	%l4
	call	loop_157
	call	loop_158
	tne	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_157:
	nop
	setx	0x60E4AA7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x44670F20,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f10,	%f19
loop_158:
	call	loop_159
	fba	%fcc2,	loop_160
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f14
	call	loop_161
loop_159:
	call	loop_162
loop_160:
	wrpr	%l1,	%i5,	%cwp
	mova	%icc,	%l3,	%i3
loop_161:
	nop
	set	0x60, %o6
	stx	%i0,	[%l7 + %o6]
loop_162:
	call	loop_163
	nop
	fitos	%f12,	%f13
	fstox	%f13,	%f4
	fmovdn	%xcc,	%f30,	%f20
	call	loop_164
loop_163:
	membar	0x61
	fcmple16	%f0,	%f16,	%o1
	tne	%icc,	0x7
loop_164:
	call	loop_165
	wr	%l2,	%g3,	%ccr
	set	0x0F, %g6
	ldstuba	[%l7 + %g6] 0x0c,	%l6
loop_165:
	fmovrde	%i2,	%f8,	%f0
	call	loop_166
	fmovrsne	%i6,	%f28,	%f8
	fmuld8sux16	%f10,	%f6,	%f18
	call	loop_167
loop_166:
	call	loop_168
	call	loop_169
	call	loop_170
loop_167:
	call	loop_171
loop_168:
	call	loop_172
loop_169:
	fbul	%fcc1,	loop_173
loop_170:
	mova	%fcc2,	0x7F5,	%i1
loop_171:
	movneg	%icc,	%g4,	%o5
loop_172:
	subc	%o6,	%l0,	%i7
loop_173:
	fmovscc	%xcc,	%f10,	%f28
	call	loop_174
	fmovdleu	%icc,	%f14,	%f0
	movrgez	%l5,	0x3C9,	%g7
	call	loop_175
loop_174:
	fpsub16s	%f1,	%f1,	%f29
	array8	%o7,	%o3,	%g2
	nop
	setx	0x11B3,	%l0,	%o4
	sdivcc	%i4,	%o4,	%g6
loop_175:
	brlez,a	%g5,	loop_176
	bvs	%icc,	loop_177
	movge	%xcc,	0x234,	%g1
	movo	%fcc0,	0x694,	%o0
loop_176:
	orn	%l4,	0x0362,	%o2
loop_177:
	call	loop_178
	fmovrsgz	%i5,	%f13,	%f15
	fcmple16	%f6,	%f4,	%l1
	fmovdleu	%icc,	%f12,	%f24
loop_178:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 10
!	Type a   	: 9
!	Type x   	: 3
!	Type cti   	: 64
!	Type f   	: 54
!	Type i   	: 60
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
	set	0x9,	%g1
	set	0xC,	%g2
	set	0xB,	%g3
	set	0x3,	%g4
	set	0x7,	%g5
	set	0x6,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x9,	%i1
	set	-0xE,	%i2
	set	-0x4,	%i3
	set	-0xC,	%i4
	set	-0x7,	%i5
	set	-0x5,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x0DB5C399,	%l0
	set	0x0581EE83,	%l1
	set	0x5E7DA941,	%l2
	set	0x2A69B54D,	%l3
	set	0x70E289A4,	%l4
	set	0x0ED843D1,	%l5
	set	0x0B7F2E94,	%l6
	!# Output registers
	set	0x0F42,	%o0
	set	0x1636,	%o1
	set	-0x153B,	%o2
	set	0x07E3,	%o3
	set	0x1E3D,	%o4
	set	-0x154D,	%o5
	set	-0x05D5,	%o6
	set	-0x132A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	fmul8x16au	%f29,	%f2,	%f14
	nop
	fitos	%f18,	%f9
	movrlez	%i3,	%l3,	%o1
	fmul8sux16	%f28,	%f4,	%f16
	call	loop_179
	fones	%f29
	tpos	%icc,	0x2
	call	loop_180
loop_179:
	nop
	set	0x16, %g2
	lduh	[%l7 + %g2],	%i0
	movug	%fcc0,	0x557,	%l2
	fpadd16s	%f14,	%f27,	%f22
loop_180:
	fmovde	%xcc,	%f20,	%f8
	ldub	[%l7 + 0x2C],	%l6
	call	loop_181
	nop
	setx	0x49C204D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f26
	fzeros	%f14
	xnor	%g3,	0x0621,	%i6
loop_181:
	call	loop_182
	array16	%i1,	%g4,	%o5
	call	loop_183
	sethi	0x1732,	%o6
loop_182:
	call	loop_184
	call	loop_185
loop_183:
	bshuffle	%f18,	%f20,	%f24
	call	loop_186
loop_184:
	add	%l0,	0x1F67,	%i2
loop_185:
	andncc	%i7,	%g7,	%l5
	ldd	[%l7 + 0x60],	%f30
loop_186:
	edge8	%o3,	%g2,	%o7
	fmul8ulx16	%f2,	%f24,	%f4
	tsubcc	%o4,	0x1014,	%g6
	call	loop_187
	call	loop_188
	bne,a	%icc,	loop_189
	fmul8ulx16	%f4,	%f18,	%f20
loop_187:
	fmovslg	%fcc0,	%f27,	%f22
loop_188:
	smulcc	%g5,	%g1,	%o0
loop_189:
	alignaddrl	%l4,	%o2,	%i4
	orn	%i5,	%l1,	%i3
	set	0x58, %l0
	stxa	%l3,	[%l7 + %l0] 0xeb
	membar	#Sync
	bleu	%icc,	loop_190
	stw	%o1,	[%l7 + 0x78]
	wrpr	%l2,	0x06DA,	%pil
	fandnot1s	%f19,	%f24,	%f20
loop_190:
	call	loop_191
	call	loop_192
	fbue,a	%fcc2,	loop_193
	fsrc1	%f22,	%f30
loop_191:
	bcs,a,pn	%xcc,	loop_194
loop_192:
	call	loop_195
loop_193:
	fmovsle	%fcc2,	%f24,	%f29
	ldd	[%l7 + 0x08],	%f12
loop_194:
	bshuffle	%f28,	%f2,	%f6
loop_195:
	movg	%fcc1,	%i0,	%g3
	fmovdu	%fcc0,	%f28,	%f18
	fones	%f3
	call	loop_196
	udivx	%l6,	0x07E4,	%i6
	andn	%g4,	%o5,	%o6
	call	loop_197
loop_196:
	fmovscc	%xcc,	%f31,	%f28
	add	%l0,	0x10D2,	%i1
	fmovrde	%i7,	%f6,	%f30
loop_197:
	array8	%g7,	%l5,	%o3
	umul	%i2,	%o7,	%g2
	fbo	%fcc1,	loop_198
	fxnor	%f12,	%f26,	%f16
	fmul8sux16	%f14,	%f8,	%f24
	call	loop_199
loop_198:
	swap	[%l7 + 0x68],	%o4
	fornot2s	%f9,	%f25,	%f11
	nop
	setx	0x88A799EF19084078,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_199:
	call	loop_200
	call	loop_201
	call	loop_202
	call	loop_203
loop_200:
	brnz,a	%g5,	loop_204
loop_201:
	call	loop_205
loop_202:
	tvc	%icc,	0x5
loop_203:
	fone	%f28
loop_204:
	fexpand	%f25,	%f22
loop_205:
	tg	%icc,	0x6
	udivcc	%g1,	0x0C1D,	%g6
	fmul8x16	%f28,	%f2,	%f0
	fmovsa	%fcc1,	%f3,	%f25
	fsrc1	%f14,	%f6
	tvs	%xcc,	0x1
	nop
	set	0x78, %l1
	stx	%o0,	[%l7 + %l1]
	fmuld8sux16	%f29,	%f19,	%f2
	fors	%f23,	%f20,	%f20
	ba	%xcc,	loop_206
	fones	%f15
	movge	%xcc,	%l4,	%i4
	set	0x6C, %l5
	lduwa	[%l7 + %l5] 0x04,	%i5
loop_206:
	fmovdge	%fcc1,	%f16,	%f10
	call	loop_207
	fbu,a	%fcc0,	loop_208
	edge32	%l1,	%o2,	%l3
	fmul8sux16	%f8,	%f26,	%f10
loop_207:
	fmovslg	%fcc0,	%f2,	%f3
loop_208:
	call	loop_209
	srax	%i3,	%l2,	%o1
	fmovdneg	%xcc,	%f4,	%f0
	movul	%fcc1,	0x1DC,	%i0
loop_209:
	tpos	%icc,	0x7
	call	loop_210
	edge32ln	%g3,	%l6,	%g4
	call	loop_211
	rdpr	%canrestore,	%o5
loop_210:
	call	loop_212
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_211:
	fand	%f2,	%f18,	%f6
	nop
	setx	0x471DE354,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC5D6E191,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f18,	%f26
loop_212:
	fexpand	%f27,	%f8
	fmovrdne	%o6,	%f8,	%f2
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f4
	array8	%i6,	%l0,	%i1
	bshuffle	%f24,	%f24,	%f6
	call	loop_213
	srax	%i7,	0x18,	%g7
	sethi	0x09F3,	%o3
	nop
	setx	0x17148C3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f19
loop_213:
	call	loop_214
	bcc	%xcc,	loop_215
	fbul,a	%fcc2,	loop_216
	membar	0x12
loop_214:
	addccc	%i2,	%o7,	%g2
loop_215:
	bshuffle	%f18,	%f16,	%f28
loop_216:
	call	loop_217
	bvc,a	%xcc,	loop_218
	fmul8ulx16	%f16,	%f2,	%f24
	rdpr	%otherwin,	%o4
loop_217:
	call	loop_219
loop_218:
	fmovrsne	%l5,	%f23,	%f12
	fmovsl	%fcc3,	%f12,	%f22
	addcc	%g5,	%g1,	%o0
loop_219:
	call	loop_220
	call	loop_221
	fmovdvc	%xcc,	%f24,	%f28
	wrpr	%l4,	0x0696,	%cwp
loop_220:
	movu	%fcc0,	0x71B,	%i4
loop_221:
	call	loop_222
	fbu,a,pn	%fcc1,	loop_223
	call	loop_224
	edge16n	%i5,	%g6,	%l1
loop_222:
	fcmpes	%fcc2,	%f22,	%f16
loop_223:
	fnegd	%f4,	%f30
loop_224:
	bmask	%l3,	%i3,	%l2
	call	loop_225
	call	loop_226
	call	loop_227
	fnegd	%f16,	%f16
loop_225:
	fbule,pn	%fcc1,	loop_228
loop_226:
	call	loop_229
loop_227:
	fpack16	%f20,	%f24
	tg	%icc,	0x5
loop_228:
	fandnot2s	%f7,	%f13,	%f24
loop_229:
	call	loop_230
	fmovdul	%fcc3,	%f2,	%f8
	array8	%o1,	%o2,	%i0
	call	loop_231
loop_230:
	fcmple32	%f30,	%f20,	%g3
	call	loop_232
	call	loop_233
loop_231:
	call	loop_234
	alignaddr	%l6,	%g4,	%o5
loop_232:
	rd	%softint,	%i6
loop_233:
	alignaddrl	%o6,	%i1,	%i7
loop_234:
	call	loop_235
	umulcc	%l0,	0x1E86,	%g7
	call	loop_236
	st	%f30,	[%l7 + 0x38]
loop_235:
	nop
	set	0x1C, %o4
	swap	[%l7 + %o4],	%o3
	call	loop_237
loop_236:
	flushw
	call	loop_238
	wrpr	%o7,	0x0FA7,	%cwp
loop_237:
	or	%i2,	0x0EB8,	%g2
	tne	%xcc,	0x0
loop_238:
	add	%o4,	%g5,	%l5
	bge,pt	%xcc,	loop_239
	fbo,a,pt	%fcc0,	loop_240
	fpadd32	%f20,	%f20,	%f0
	tpos	%xcc,	0x7
loop_239:
	call	loop_241
loop_240:
	tge	%icc,	0x1
	tle	%xcc,	0x7
	taddcc	%o0,	%l4,	%g1
loop_241:
	fmovse	%icc,	%f25,	%f12
	movu	%fcc3,	%i4,	%i5
	wr	%g6,	0x091B,	%clear_softint
	fcmpeq16	%f30,	%f10,	%l3
	fsrc2	%f2,	%f2
	movg	%icc,	0x265,	%l1
	mulscc	%i3,	%l2,	%o2
	movcc	%xcc,	%i0,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%l6,	%g4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 13
!	Type a   	: 7
!	Type x   	: 3
!	Type cti   	: 63
!	Type f   	: 58
!	Type i   	: 56
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
	set	0x0,	%g1
	set	0xA,	%g2
	set	0x5,	%g3
	set	0x1,	%g4
	set	0x8,	%g5
	set	0x5,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x1,	%i1
	set	-0x1,	%i2
	set	-0x3,	%i3
	set	-0x9,	%i4
	set	-0xE,	%i5
	set	-0x8,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x39BF1978,	%l0
	set	0x5693548C,	%l1
	set	0x7B7D2054,	%l2
	set	0x6D4E45E7,	%l3
	set	0x5665DC49,	%l4
	set	0x2FCE5B37,	%l5
	set	0x163022E6,	%l6
	!# Output registers
	set	-0x04E9,	%o0
	set	-0x0751,	%o1
	set	-0x1245,	%o2
	set	-0x002D,	%o3
	set	-0x0054,	%o4
	set	-0x0209,	%o5
	set	-0x1F32,	%o6
	set	-0x1434,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	bneg	%xcc,	loop_242
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f16
	set	0x3F, %o2
	lduba	[%l7 + %o2] 0x04,	%g3
loop_242:
	call	loop_243
	edge16ln	%o5,	%i6,	%o6
	set	0x7C, %i4
	ldsba	[%l7 + %i4] 0x89,	%i7
loop_243:
	nop
	setx	0xC70ACBFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x9F8130C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f22,	%f28
	fandnot2s	%f29,	%f2,	%f25
	call	loop_244
	taddcctv	%l0,	0x1FB4,	%i1
	call	loop_245
	rdpr	%tl,	%o3
loop_244:
	fand	%f0,	%f0,	%f2
	nop
	setx	0x39111DB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xAD1CE153,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f3,	%f28
loop_245:
	fmovsvs	%icc,	%f11,	%f20
	call	loop_246
	call	loop_247
	sethi	0x0475,	%g7
	call	loop_248
loop_246:
	call	loop_249
loop_247:
	fnor	%f0,	%f20,	%f16
	sdivx	%o7,	0x165D,	%i2
loop_248:
	fpsub32s	%f15,	%f0,	%f12
loop_249:
	fcmpeq32	%f14,	%f6,	%g2
	fandnot2s	%f21,	%f24,	%f2
	call	loop_250
	call	loop_251
	fmovdlg	%fcc0,	%f24,	%f22
	tn	%xcc,	0x2
loop_250:
	fmul8x16al	%f18,	%f22,	%f0
loop_251:
	call	loop_252
	fmovrdlz	%g5,	%f16,	%f14
	subcc	%o4,	0x06B6,	%o0
	call	loop_253
loop_252:
	movge	%fcc1,	0x735,	%l4
	fsrc2s	%f11,	%f25
	sra	%g1,	%i4,	%l5
loop_253:
	call	loop_254
	call	loop_255
	movrne	%i5,	%l3,	%g6
	fbul	%fcc3,	loop_256
loop_254:
	sethi	0x057D,	%i3
loop_255:
	tg	%icc,	0x6
	xor	%l1,	0x01D9,	%o2
loop_256:
	call	loop_257
	call	loop_258
	fmovsl	%fcc0,	%f9,	%f12
	fpadd16s	%f26,	%f5,	%f14
loop_257:
	call	loop_259
loop_258:
	fpsub16	%f8,	%f2,	%f20
	bmask	%l2,	%i0,	%l6
	fmovso	%fcc0,	%f26,	%f23
loop_259:
	call	loop_260
	fcmpne16	%f0,	%f6,	%o1
	fmovdvs	%xcc,	%f16,	%f4
	wrpr	%g4,	%g3,	%cwp
loop_260:
	bcs	%icc,	loop_261
	movrgez	%o5,	%i6,	%i7
	taddcctv	%l0,	0x0C6D,	%i1
	array8	%o6,	%o3,	%g7
loop_261:
	edge8n	%i2,	%g2,	%o7
	fandnot2	%f16,	%f2,	%f20
	movne	%fcc3,	0x263,	%g5
	call	loop_262
	call	loop_263
	call	loop_264
	fbul,a	%fcc0,	loop_265
loop_262:
	nop
	set	0x08, %o1
	stx	%o0,	[%l7 + %o1]
loop_263:
	call	loop_266
loop_264:
	call	loop_267
loop_265:
	nop
	setx	0xB23D8496,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD261B269,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f10,	%f3
	fmovdl	%fcc3,	%f10,	%f8
loop_266:
	fpackfix	%f0,	%f16
loop_267:
	fnors	%f3,	%f17,	%f6
	call	loop_268
	call	loop_269
	fmul8ulx16	%f22,	%f10,	%f28
	rdpr	%tl,	%l4
loop_268:
	fornot2s	%f20,	%f24,	%f13
loop_269:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_270
	subccc	%i4,	%g1,	%i5
	sdivx	%l3,	0x172D,	%l5
	xnor	%g6,	%i3,	%o2
loop_270:
	tvs	%xcc,	0x3
	call	loop_271
	smulcc	%l1,	0x1894,	%i0
	sllx	%l6,	%l2,	%g4
	tvc	%xcc,	0x0
loop_271:
	umulcc	%o1,	0x113F,	%g3
	call	loop_272
	call	loop_273
	fone	%f2
	fsrc1s	%f29,	%f31
loop_272:
	fnand	%f10,	%f18,	%f22
loop_273:
	fmovrdlez	%o5,	%f12,	%f8
	call	loop_274
	edge16	%i6,	%l0,	%i1
	movne	%fcc1,	%i7,	%o6
	fcmpd	%fcc1,	%f12,	%f12
loop_274:
	fornot1	%f2,	%f28,	%f12
	pdist	%f20,	%f30,	%f26
	fpadd16	%f26,	%f16,	%f30
	fmovsa	%icc,	%f0,	%f24
	brgez,pt	%g7,	loop_275
	fmuld8sux16	%f26,	%f31,	%f14
	fones	%f31
	fmul8sux16	%f14,	%f10,	%f24
loop_275:
	rdhpr	%hsys_tick_cmpr,	%i2
	movgu	%xcc,	0x2F8,	%o3
	fxors	%f21,	%f15,	%f6
	call	loop_276
	movpos	%icc,	0x344,	%o7
	call	loop_277
	sub	%g5,	%o0,	%g2
loop_276:
	fnegd	%f0,	%f10
	call	loop_278
loop_277:
	rdpr	%otherwin,	%l4
	rdpr	%cansave,	%i4
	tge	%icc,	0x1
loop_278:
	bcs,a,pn	%xcc,	loop_279
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_280
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f10
loop_279:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF22, 	%hsys_tick_cmpr
	st	%f28,	[%l7 + 0x38]
loop_280:
	udiv	%i5,	0x0CFC,	%l3
	subc	%g6,	0x141D,	%l5
	fbul,a	%fcc1,	loop_281
	smul	%i3,	%o2,	%l1
	nop
	setx	0xDB41D001A6D7EE84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE9D7E199F28DF49A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f8,	%f6
	call	loop_282
loop_281:
	udivcc	%i0,	0x04EB,	%l2
	nop
	set	0x7C, %i5
	stw	%l6,	[%l7 + %i5]
	fpsub32	%f4,	%f26,	%f30
loop_282:
	fpsub32s	%f25,	%f23,	%f30
	call	loop_283
	call	loop_284
	rdhpr	%ver,	%g4
	call	loop_285
loop_283:
	call	loop_286
loop_284:
	ld	[%l7 + 0x20],	%f11
	nop
	set	0x10, %g4
	stx	%o1,	[%l7 + %g4]
loop_285:
	bvc,a	%icc,	loop_287
loop_286:
	fmovdvc	%icc,	%f22,	%f6
	fornot2	%f28,	%f2,	%f12
	ta	%icc,	0x1
loop_287:
	call	loop_288
	fmovrslez	%o5,	%f30,	%f29
	wrpr 	%g0, 	0x3, 	%gl
	fbug,pt	%fcc0,	loop_289
loop_288:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	array8	%l0,	%g3,	%i1
	call	loop_290
loop_289:
	srax	%i7,	%g7,	%i2
	nop
	setx	0x789240F42C387FB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFE08E0927C1625EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f4,	%f6
	rd	%tick_cmpr,	%o6
loop_290:
	nop
	set	0x30, %l4
	ldxa	[%g0 + %l4] 0x58,	%o7
	fandnot2	%f2,	%f20,	%f30
	movug	%fcc2,	0x723,	%g5
	stx	%o3,	[%l7 + 0x10]
	andncc	%g2,	0x1A5B,	%l4
	fpack16	%f14,	%f28
	ldub	[%l7 + 0x48],	%o0
	brlez,pt	%g1,	loop_291
	fmovsvs	%xcc,	%f1,	%f19
	movo	%fcc0,	%o4,	%i5
	call	loop_292
loop_291:
	fornot2	%f26,	%f22,	%f8
	st	%f22,	[%l7 + 0x48]
	call	loop_293
loop_292:
	call	loop_294
	tge	%icc,	0x7
	fmovdle	%fcc2,	%f12,	%f22
loop_293:
	umulcc	%i4,	%l3,	%g6
loop_294:
	rdpr	%wstate,	%l5
	call	loop_295
	call	loop_296
	fbe,pn	%fcc0,	loop_297
	call	loop_298
loop_295:
	rd	%ccr,	%i3
loop_296:
	movo	%fcc2,	%l1,	%o2
loop_297:
	call	loop_299
loop_298:
	nop
	fitod	%f2,	%f20
	fdtoi	%f20,	%f9
	call	loop_300
	call	loop_301
loop_299:
	tle	%icc,	0x5
	call	loop_302
loop_300:
	call	loop_303
loop_301:
	call	loop_304
	fbuge,a	%fcc2,	loop_305
loop_302:
	fmovda	%fcc1,	%f10,	%f20
loop_303:
	fpadd16s	%f5,	%f0,	%f25
loop_304:
	fmovdue	%fcc3,	%f24,	%f26
loop_305:
	call	loop_306
	st	%f7,	[%l7 + 0x0C]
	call	loop_307
loop_306:
	nop

loop_307:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 12
!	Type a   	: 13
!	Type x   	: 3
!	Type cti   	: 66
!	Type f   	: 58
!	Type i   	: 48
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
	set	0xA,	%g2
	set	0xA,	%g3
	set	0x4,	%g4
	set	0x2,	%g5
	set	0x7,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xE,	%i1
	set	-0xF,	%i2
	set	-0xB,	%i3
	set	-0x3,	%i4
	set	-0x9,	%i5
	set	-0xE,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x0A86DC3A,	%l0
	set	0x54F716FE,	%l1
	set	0x6E05C782,	%l2
	set	0x54E5DBA1,	%l3
	set	0x11C6A5F0,	%l4
	set	0x483673DF,	%l5
	set	0x035CDCC9,	%l6
	!# Output registers
	set	0x08EA,	%o0
	set	-0x1542,	%o1
	set	-0x0848,	%o2
	set	-0x1027,	%o3
	set	0x111B,	%o4
	set	-0x194A,	%o5
	set	-0x19E0,	%o6
	set	-0x020D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	call	loop_308
	movge	%xcc,	%l2,	%i0
	nop
	setx	0x1D41,	%l0,	%l6
	udivcc	%g4,	%l6,	%o1
	movvc	%xcc,	0x086,	%i6
loop_308:
	call	loop_309
	call	loop_310
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f8
	edge8l	%l0,	%o5,	%g3
loop_309:
	array32	%i7,	%i1,	%i2
loop_310:
	call	loop_311
	array16	%g7,	%o7,	%o6
	wr	%o3,	0x02E7,	%y
	fmovscs	%icc,	%f21,	%f19
loop_311:
	nop
	set	0x38, %i3
	stha	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	call	loop_312
	fmovsvc	%xcc,	%f31,	%f15
	sir	0x073C
	call	loop_313
loop_312:
	fmovscc	%xcc,	%f1,	%f12
	nop
	setx	0x1AD8,	%l0,	%o0
	sdivx	%l4,	%o0,	%g1
	fmovdg	%xcc,	%f22,	%f18
loop_313:
	call	loop_314
	nop
	fitos	%f5,	%f12
	call	loop_315
	call	loop_316
loop_314:
	fone	%f30
	bvc,a	%xcc,	loop_317
loop_315:
	fmovrdgez	%o4,	%f6,	%f30
loop_316:
	call	loop_318
	alignaddr	%g5,	%i4,	%l3
loop_317:
	movlg	%fcc3,	%i5,	%g6
	bmask	%l5,	%l1,	%i3
loop_318:
	call	loop_319
	call	loop_320
	nop
	set	0x2D, %i6
	ldsb	[%l7 + %i6],	%o2
	fpackfix	%f16,	%f27
loop_319:
	fmovsleu	%icc,	%f20,	%f18
loop_320:
	tne	%xcc,	0x1
	fmovspos	%xcc,	%f19,	%f30
	wrpr 	%g0, 	0x2, 	%gl
	fornot1s	%f20,	%f17,	%f12
	bgu	%icc,	loop_321
	call	loop_322
	fmovsle	%fcc0,	%f1,	%f30
	bne,pn	%icc,	loop_323
loop_321:
	movlg	%fcc3,	%l6,	%i0
loop_322:
	call	loop_324
	call	loop_325
loop_323:
	call	loop_326
	rd	%softint,	%o1
loop_324:
	nop
	setx	0x8CBB80AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x6967DA14,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f17,	%f31
loop_325:
	movpos	%xcc,	0x6DA,	%i6
loop_326:
	fsrc1	%f26,	%f12
	tl	%xcc,	0x6
	fpadd32s	%f23,	%f17,	%f8
	edge16	%l0,	%g3,	%i7
	brgez,a	%i1,	loop_327
	fcmpgt16	%f16,	%f16,	%o5
	fmovdg	%fcc1,	%f24,	%f14
	call	loop_328
loop_327:
	nop
	setx	0xB3A1F2256A9EC5F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xF732D3E784FF12CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f14,	%f18
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc2
loop_328:
	and	%i2,	0x1AC7,	%g7
	call	loop_329
	edge32ln	%o7,	%o6,	%o3
	fnand	%f26,	%f14,	%f14
	fmovdcc	%xcc,	%f12,	%f10
loop_329:
	flushw
	fxors	%f23,	%f27,	%f23
	call	loop_330
	call	loop_331
	array32	%g2,	%o0,	%g1
	call	loop_332
loop_330:
	andn	%o4,	0x1727,	%g5
loop_331:
	fnands	%f1,	%f15,	%f24
	fble,a,pt	%fcc2,	loop_333
loop_332:
	movleu	%icc,	0x113,	%l4
	fabsd	%f8,	%f30
	rdpr	%tl,	%l3
loop_333:
	tsubcctv	%i5,	%i4,	%g6
	call	loop_334
	fpackfix	%f8,	%f10
	bvs	%xcc,	loop_335
	bcc,pn	%icc,	loop_336
loop_334:
	tgu	%xcc,	0x0
	fmovdue	%fcc0,	%f18,	%f28
loop_335:
	udivx	%l5,	0x060A,	%l1
loop_336:
	fxnors	%f24,	%f12,	%f7
	call	loop_337
	call	loop_338
	call	loop_339
	sethi	0x107D,	%i3
loop_337:
	array8	%o2,	%g4,	%l2
loop_338:
	call	loop_340
loop_339:
	fbuge,a,pn	%fcc1,	loop_341
	edge8ln	%l6,	%o1,	%i6
	movge	%fcc1,	%l0,	%g3
loop_340:
	fmovsa	%fcc0,	%f8,	%f23
loop_341:
	fmovsg	%xcc,	%f22,	%f17
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	call	loop_342
	call	loop_343
	edge8n	%i1,	%i0,	%i2
	edge32ln	%g7,	%o5,	%o7
loop_342:
	fmovdcc	%xcc,	%f10,	%f0
loop_343:
	fcmps	%fcc3,	%f25,	%f21
	fcmped	%fcc0,	%f4,	%f26
	membar	0x66
	tcs	%icc,	0x5
	rdpr	%tl,	%o3
	edge32ln	%g2,	%o6,	%g1
	mova	%icc,	%o4,	%g5
	set	0x4C, %i7
	lda	[%l7 + %i7] 0x10,	%f20
	call	loop_344
	subc	%o0,	0x13DD,	%l3
	call	loop_345
	call	loop_346
loop_344:
	call	loop_347
	nop
	setx	0x319F6E81907CBF57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB91941F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f4,	%f10
loop_345:
	call	loop_348
loop_346:
	fmovsu	%fcc2,	%f26,	%f25
loop_347:
	fmovdpos	%xcc,	%f26,	%f4
	fzeros	%f7
loop_348:
	fmovdu	%fcc2,	%f22,	%f16
	call	loop_349
	call	loop_350
	nop
	setx	0x5A92BE22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f7
	fmovsleu	%icc,	%f16,	%f20
loop_349:
	tle	%icc,	0x4
loop_350:
	fcmped	%fcc3,	%f10,	%f14
	call	loop_351
	fmovsle	%xcc,	%f22,	%f27
	mova	%fcc0,	%l4,	%i4
	tneg	%icc,	0x5
loop_351:
	call	loop_352
	edge8ln	%g6,	%i5,	%l1
	fmovdge	%fcc3,	%f16,	%f0
	nop
	fitos	%f12,	%f21
	fstoi	%f21,	%f13
loop_352:
	fabss	%f7,	%f6
	edge16n	%l5,	%i3,	%o2
	fmovdle	%fcc2,	%f20,	%f28
	wrpr	%l2,	%g4,	%pil
	fmovde	%xcc,	%f16,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0x066C3F2EF25A4A37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF0456DF5AB044B72,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f4,	%f8
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%o1
	call	loop_353
	call	loop_354
	nop
	setx	0xA6FBCF09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9CCABD66,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f11,	%f22
	tsubcc	%l0,	0x140A,	%i6
loop_353:
	ldsb	[%l7 + 0x0D],	%i7
loop_354:
	subccc	%i1,	0x0B1A,	%i0
	fmovsug	%fcc2,	%f10,	%f25
	tcs	%xcc,	0x7
	edge32l	%i2,	%g3,	%g7
	movpos	%xcc,	0x730,	%o5
	wrpr	%o7,	0x1977,	%cwp
	fmovscs	%icc,	%f26,	%f18
	fbul	%fcc1,	loop_355
	call	loop_356
	umul	%o3,	%o6,	%g1
	tleu	%icc,	0x3
loop_355:
	fmul8sux16	%f22,	%f10,	%f28
loop_356:
	movcc	%icc,	%g2,	%g5
	fmovs	%f2,	%f16
	wr	%o4,	%l3,	%y
	call	loop_357
	rdpr	%tba,	%o0
	wrpr	%l4,	0x1FF8,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_357:
	smul	%l1,	0x1566,	%l5
	call	loop_358
	call	loop_359
	fmovrsgez	%i4,	%f15,	%f7
	movlg	%fcc0,	0x25F,	%o2
loop_358:
	fpack16	%f20,	%f5
loop_359:
	fmovrslz	%i3,	%f18,	%f17
	tvs	%xcc,	0x7
	call	loop_360
	movug	%fcc2,	%g4,	%l6
	edge32n	%o1,	%l2,	%i6
	fmovdleu	%xcc,	%f4,	%f28
loop_360:
	call	loop_361
	call	loop_362
	sdiv	%l0,	0x064B,	%i7
	xor	%i1,	0x18A3,	%i2
loop_361:
	rdpr	%canrestore,	%g3
loop_362:
	movule	%fcc1,	0x339,	%g7
	call	loop_363
	call	loop_364
	fbul	%fcc2,	loop_365
	call	loop_366
loop_363:
	call	loop_367
loop_364:
	nop
	setx	0xE4FD7695A7D46C5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f10
loop_365:
	mulscc	%o5,	%o7,	%i0
loop_366:
	nop

loop_367:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 7
!	Type a   	: 13
!	Type x   	: 5
!	Type cti   	: 60
!	Type f   	: 57
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
	set	0x8,	%g1
	set	0x9,	%g2
	set	0x3,	%g3
	set	0x0,	%g4
	set	0xA,	%g5
	set	0xF,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0x0,	%i2
	set	-0xB,	%i3
	set	-0x4,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x2634ADB2,	%l0
	set	0x17DA14BD,	%l1
	set	0x644886F5,	%l2
	set	0x3D7BFA05,	%l3
	set	0x4CC6A466,	%l4
	set	0x79550249,	%l5
	set	0x2E18A94F,	%l6
	!# Output registers
	set	0x1984,	%o0
	set	-0x1371,	%o1
	set	-0x0EC6,	%o2
	set	-0x096D,	%o3
	set	-0x12FE,	%o4
	set	0x1B19,	%o5
	set	0x02CE,	%o6
	set	0x0D45,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	fnot1s	%f21,	%f1
	fmovso	%fcc3,	%f1,	%f17
	call	loop_368
	rdpr	%canrestore,	%o6
	fmul8x16	%f23,	%f28,	%f0
	fnands	%f17,	%f25,	%f1
loop_368:
	ldx	[%l7 + 0x18],	%o3
	movlg	%fcc0,	%g1,	%g2
	movrlz	%g5,	0x359,	%l3
	movn	%fcc0,	%o0,	%o4
	orncc	%l4,	%g6,	%i5
	array8	%l5,	%l1,	%i4
	fpackfix	%f12,	%f17
	sth	%o2,	[%l7 + 0x0A]
	nop
	fitod	%f0,	%f2
	movrlz	%i3,	%g4,	%l6
	tleu	%xcc,	0x2
	movleu	%icc,	0x05E,	%o1
	fbug	%fcc3,	loop_369
	xnor	%i6,	%l2,	%i7
	call	loop_370
	nop
	setx	0x584DEBB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x7CCE3CCD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f6,	%f18
loop_369:
	fornot1	%f0,	%f12,	%f14
	fmovdle	%icc,	%f26,	%f16
loop_370:
	mova	%icc,	%i1,	%i2
	tge	%xcc,	0x5
	st	%f24,	[%l7 + 0x30]
	fbug,pn	%fcc0,	loop_371
	flushw
	call	loop_372
	srax	%l0,	0x07,	%g7
loop_371:
	fmovdue	%fcc0,	%f22,	%f0
	call	loop_373
loop_372:
	wr	%o5,	0x172F,	%sys_tick
	srl	%g3,	%i0,	%o7
	fcmpne32	%f26,	%f12,	%o3
loop_373:
	faligndata	%f24,	%f16,	%f28
	call	loop_374
	movule	%fcc0,	0x418,	%g1
	tsubcctv	%o6,	0x0901,	%g5
	fcmped	%fcc3,	%f12,	%f8
loop_374:
	rdhpr	%hintp,	%l3
	fpsub32	%f20,	%f10,	%f24
	rdpr	%canrestore,	%g2
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f6
	call	loop_375
	call	loop_376
	call	loop_377
	rdhpr	%hsys_tick_cmpr,	%o4
loop_375:
	wr	%o0,	%g6,	%clear_softint
loop_376:
	nop
	set	0x58, %l6
	lduw	[%l7 + %l6],	%i5
loop_377:
	bgu,a	%xcc,	loop_378
	alignaddr	%l5,	%l1,	%i4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i3
loop_378:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	movug	%fcc0,	%o2,	%l6
	sll	%o1,	0x13,	%i6
	fmuld8ulx16	%f18,	%f14,	%f4
	call	loop_379
	call	loop_380
	fmovdug	%fcc2,	%f18,	%f28
	edge8n	%l2,	%i1,	%i7
loop_379:
	umul	%i2,	%g7,	%o5
loop_380:
	fmovscc	%xcc,	%f4,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_381
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f24
	std	%o6,	[%l7 + 0x60]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_381:
	edge16	%o6,	%g1,	%g5
	call	loop_382
	call	loop_383
	call	loop_384
	call	loop_385
loop_382:
	popc	%g2,	%l3
loop_383:
	call	loop_386
loop_384:
	rd	%pc,	%o0
loop_385:
	movrgez	%o4,	0x3BE,	%g6
	rdpr	%gl,	%i5
loop_386:
	fones	%f9
	rd	%ccr,	%l1
	tge	%icc,	0x6
	call	loop_387
	call	loop_388
	fcmpes	%fcc0,	%f15,	%f8
	rd	%sys_tick_cmpr,	%l5
loop_387:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA36, 	%hsys_tick_cmpr
loop_388:
	call	loop_389
	call	loop_390
	umulcc	%i4,	%i3,	%g4
	movgu	%xcc,	0x704,	%o2
loop_389:
	edge8l	%o1,	%l6,	%i6
loop_390:
	fmovdule	%fcc3,	%f12,	%f28
	array32	%l2,	%i7,	%i1
	call	loop_391
	fmovdul	%fcc2,	%f6,	%f30
	fcmpeq32	%f12,	%f28,	%i2
	call	loop_392
loop_391:
	movu	%fcc1,	0x286,	%o5
	edge8	%g7,	%i0,	%l0
	srl	%o7,	%g3,	%o3
loop_392:
	nop
	set	0x72, %i0
	ldsha	[%l7 + %i0] 0x04,	%o6
	fsrc1s	%f20,	%f14
	andcc	%g1,	0x0322,	%g5
	call	loop_393
	call	loop_394
	be,a,pn	%xcc,	loop_395
	call	loop_396
loop_393:
	call	loop_397
loop_394:
	fcmpne32	%f10,	%f28,	%g2
loop_395:
	nop
	setx	0x0BC5,	%l0,	%l3
	udiv	%o0,	%l3,	%g6
loop_396:
	fmovrdne	%i5,	%f26,	%f12
loop_397:
	call	loop_398
	orn	%l1,	%l5,	%o4
	edge32	%i4,	%l4,	%i3
	fcmpeq32	%f8,	%f22,	%o2
loop_398:
	bleu,a	%xcc,	loop_399
	srl	%o1,	0x19,	%g4
	fmovsue	%fcc2,	%f16,	%f7
	bneg,pn	%xcc,	loop_400
loop_399:
	or	%l6,	0x0EC8,	%l2
	flushw
	call	loop_401
loop_400:
	call	loop_402
	movrne	%i7,	0x28A,	%i6
	fmovdule	%fcc3,	%f2,	%f10
loop_401:
	nop
	fitos	%f3,	%f30
loop_402:
	andn	%i1,	%i2,	%g7
	call	loop_403
	ldub	[%l7 + 0x0D],	%i0
	movcc	%xcc,	0x68D,	%o5
	call	loop_404
loop_403:
	wr	%o7,	0x1BC7,	%clear_softint
	fandnot2	%f6,	%f12,	%f10
	movl	%fcc2,	0x017,	%l0
loop_404:
	call	loop_405
	orncc	%o3,	%g3,	%g1
	call	loop_406
	nop
	setx	0x03B3,	%l0,	%o6
	sdivcc	%g5,	%o6,	%o0
loop_405:
	rdpr	%otherwin,	%g2
	tsubcctv	%l3,	0x00FE,	%g6
loop_406:
	tge	%icc,	0x3
	fpackfix	%f10,	%f12
	movrne	%i5,	0x14E,	%l5
	movrgz	%o4,	0x24D,	%l1
	fpadd32	%f2,	%f26,	%f0
	array8	%i4,	%l4,	%o2
	call	loop_407
	nop
	fitod	%f19,	%f6
	for	%f26,	%f22,	%f30
	rdhpr	%hsys_tick_cmpr,	%o1
loop_407:
	edge16l	%g4,	%i3,	%l2
	smulcc	%i7,	%i6,	%l6
	fmovso	%fcc0,	%f23,	%f17
	fpadd16s	%f18,	%f14,	%f26
	fmovdcc	%xcc,	%f28,	%f8
	call	loop_408
	nop
	setx	0xFF711822F16B26D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movul	%fcc2,	%i1,	%g7
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_408:
	tne	%icc,	0x3
	fmul8x16au	%f10,	%f12,	%f28
	nop
	setx	0xCB252082,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xEC1C3941,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f31,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC53, 	%hsys_tick_cmpr
	call	loop_409
	fmovrslez	%i2,	%f29,	%f24
	bleu,pt	%xcc,	loop_410
	nop
	setx	0x1191,	%l0,	%o7
	sdivcc	%o5,	%o7,	%l0
loop_409:
	call	loop_411
	alignaddr	%o3,	%g3,	%g5
loop_410:
	fornot2s	%f16,	%f3,	%f15
	call	loop_412
loop_411:
	edge16ln	%o6,	%o0,	%g2
	fcmpne32	%f4,	%f2,	%l3
	fmovdul	%fcc0,	%f18,	%f2
loop_412:
	wrpr	%g1,	%i5,	%cwp
	call	loop_413
	fmovscs	%xcc,	%f30,	%f3
	subcc	%g6,	%o4,	%l5
	fnand	%f4,	%f22,	%f2
loop_413:
	call	loop_414
	call	loop_415
	fmovsa	%fcc1,	%f26,	%f27
	fmovso	%fcc1,	%f1,	%f15
loop_414:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l1
loop_415:
	movuge	%fcc3,	0x4D5,	%i4
	call	loop_416
	call	loop_417
	fnot2	%f20,	%f6
	movlg	%fcc0,	0x630,	%o2
loop_416:
	add	%l4,	%g4,	%o1
loop_417:
	call	loop_418
	movn	%xcc,	0x05F,	%l2
	call	loop_419
	call	loop_420
loop_418:
	nop

loop_419:
	nop

loop_420:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 12
!	Type a   	: 18
!	Type x   	: 5
!	Type cti   	: 53
!	Type f   	: 50
!	Type i   	: 62
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
	set	0x0,	%g3
	set	0x6,	%g4
	set	0xF,	%g5
	set	0x7,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x5,	%i1
	set	-0x6,	%i2
	set	-0x7,	%i3
	set	-0xF,	%i4
	set	-0x3,	%i5
	set	-0x0,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x3FB26977,	%l0
	set	0x1220E404,	%l1
	set	0x61985BBF,	%l2
	set	0x56E81A7C,	%l3
	set	0x309C415D,	%l4
	set	0x716B2CCC,	%l5
	set	0x308F125E,	%l6
	!# Output registers
	set	0x116A,	%o0
	set	-0x0885,	%o1
	set	0x0874,	%o2
	set	0x1F93,	%o3
	set	-0x0D4B,	%o4
	set	0x09BF,	%o5
	set	-0x027A,	%o6
	set	0x183E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDAA6DD55A5295CF)
	INIT_TH_FP_REG(%l7,%f2,0x4A34052A0704B7C4)
	INIT_TH_FP_REG(%l7,%f4,0x6ADCB8D1803A9F23)
	INIT_TH_FP_REG(%l7,%f6,0xB60F0ED94AA7B65F)
	INIT_TH_FP_REG(%l7,%f8,0x968F5AC36765DF1D)
	INIT_TH_FP_REG(%l7,%f10,0x6F1B644681110DCB)
	INIT_TH_FP_REG(%l7,%f12,0x36C734C9140C2E48)
	INIT_TH_FP_REG(%l7,%f14,0x29D915F5FC517B13)
	INIT_TH_FP_REG(%l7,%f16,0xBB400398FA3CC37D)
	INIT_TH_FP_REG(%l7,%f18,0x6B19673780E12A99)
	INIT_TH_FP_REG(%l7,%f20,0x5FF152440E494FF2)
	INIT_TH_FP_REG(%l7,%f22,0x646EE164E001DF2A)
	INIT_TH_FP_REG(%l7,%f24,0x2EE59B5257317A5D)
	INIT_TH_FP_REG(%l7,%f26,0x8AF2C1DC1450E4C8)
	INIT_TH_FP_REG(%l7,%f28,0x47D3CA205179E18E)
	INIT_TH_FP_REG(%l7,%f30,0x8D561E6837120468)

	!# Execute Main Diag ..

	call	loop_421
	fble,pn	%fcc2,	loop_422
	movrlez	%i7,	%i6,	%i3
	fpsub32	%f22,	%f18,	%f10
loop_421:
	addc	%i1,	%l6,	%i0
loop_422:
	fmovdvc	%icc,	%f0,	%f8
	movrlz	%g7,	0x140,	%o5
	fba,a,pn	%fcc3,	loop_423
	subcc	%i2,	%o7,	%o3
	fbug	%fcc0,	loop_424
	fpadd32s	%f5,	%f13,	%f19
loop_423:
	call	loop_425
	fmovrdgz	%g3,	%f26,	%f16
loop_424:
	nop
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x89,	%g5
loop_425:
	wrpr 	%g0, 	0x3, 	%gl
	fmul8x16au	%f5,	%f19,	%f22
	siam	0x4
	fbe,a,pt	%fcc1,	loop_426
	fmovdle	%fcc1,	%f10,	%f0
	nop
	setx	0x751A7879,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC24182F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f17,	%f0
	call	loop_427
loop_426:
	fors	%f4,	%f16,	%f0
	call	loop_428
	call	loop_429
loop_427:
	edge16n	%o0,	%l3,	%g1
	movre	%g2,	%g6,	%i5
loop_428:
	movne	%icc,	%o4,	%l1
loop_429:
	nop
	set	0x2C, %i1
	swap	[%l7 + %i1],	%l5
	call	loop_430
	fmovdg	%icc,	%f2,	%f8
	popc	%i4,	%o2
	fandnot1s	%f29,	%f11,	%f23
loop_430:
	rdpr	%gl,	%g4
	call	loop_431
	mova	%icc,	%l4,	%o1
	fmovdg	%icc,	%f4,	%f26
	call	loop_432
loop_431:
	te	%icc,	0x7
	movrne	%i7,	%i6,	%i3
	mulscc	%l2,	%l6,	%i0
loop_432:
	movpos	%xcc,	%g7,	%i1
	call	loop_433
	nop
	setx	0xF56AFC45,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	call	loop_434
	fnot2	%f6,	%f18
loop_433:
	call	loop_435
	movn	%fcc2,	%i2,	%o5
loop_434:
	call	loop_436
	fcmple16	%f28,	%f26,	%o3
loop_435:
	rdpr	%tba,	%g3
	rdhpr	%hsys_tick_cmpr,	%g5
loop_436:
	call	loop_437
	fnand	%f30,	%f2,	%f16
	fmovrdne	%o7,	%f20,	%f18
	call	loop_438
loop_437:
	call	loop_439
	nop
	set	0x28, %o5
	std	%l0,	[%l7 + %o5]
	nop
	set	0x60, %o7
	stx	%o0,	[%l7 + %o7]
loop_438:
	fand	%f8,	%f12,	%f4
loop_439:
	fmovd	%f0,	%f22
	fpack32	%f4,	%f16,	%f22
	fors	%f22,	%f9,	%f11
	bvc,a	%xcc,	loop_440
	fandnot2	%f12,	%f20,	%f2
	fand	%f30,	%f20,	%f2
	fmovsue	%fcc3,	%f6,	%f28
loop_440:
	sll	%o6,	0x07,	%g1
	call	loop_441
	call	loop_442
	bshuffle	%f10,	%f16,	%f0
	call	loop_443
loop_441:
	fcmpgt32	%f0,	%f22,	%l3
loop_442:
	fzeros	%f4
	fmovdvs	%icc,	%f6,	%f0
loop_443:
	rd	%tick_cmpr,	%g6
	wr	%g2,	0x146D,	%ccr
	fcmpgt16	%f12,	%f0,	%i5
	fmovdl	%icc,	%f2,	%f4
	tg	%icc,	0x0
	fpackfix	%f10,	%f30
	bshuffle	%f24,	%f14,	%f6
	fpsub16	%f16,	%f28,	%f4
	fmovrde	%l1,	%f8,	%f14
	fmovdg	%fcc1,	%f18,	%f6
	mova	%icc,	%o4,	%i4
	edge16	%l5,	%o2,	%g4
	fandnot2	%f4,	%f18,	%f30
	fsrc1	%f28,	%f24
	ta	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x538, 	%sys_tick_cmpr
	call	loop_444
	be,a,pn	%icc,	loop_445
	fmovrdne	%i7,	%f0,	%f22
	bleu,a,pn	%xcc,	loop_446
loop_444:
	call	loop_447
loop_445:
	fblg,pt	%fcc2,	loop_448
	call	loop_449
loop_446:
	fsrc2	%f0,	%f14
loop_447:
	call	loop_450
loop_448:
	call	loop_451
loop_449:
	call	loop_452
	smul	%l4,	%i6,	%i3
loop_450:
	call	loop_453
loop_451:
	wr	%l6,	0x0298,	%ccr
loop_452:
	call	loop_454
	fmovdug	%fcc1,	%f22,	%f30
loop_453:
	rdhpr	%ver,	%l2
	fornot2	%f8,	%f26,	%f28
loop_454:
	fmovdul	%fcc3,	%f12,	%f2
	bcs	%xcc,	loop_455
	fmovsge	%icc,	%f26,	%f28
	movl	%fcc3,	%i0,	%i1
	udivcc	%i2,	0x0753,	%o5
loop_455:
	call	loop_456
	fmovdul	%fcc1,	%f12,	%f12
	nop
	setx loop_457, %l0, %l1
	jmpl %l1, %o3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_456:
	andn	%g7,	0x170C,	%g5
	wrpr	%o7,	0x1E44,	%pil
loop_457:
	fmovsge	%xcc,	%f28,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFA8, 	%hsys_tick_cmpr
	umulcc	%g3,	0x1492,	%o0
	call	loop_458
	tgu	%icc,	0x6
	fcmpgt16	%f20,	%f30,	%g1
	orn	%o6,	0x17FC,	%l3
loop_458:
	rdhpr	%hsys_tick_cmpr,	%g2
	rdhpr	%htba,	%g6
	alignaddrl	%l1,	%o4,	%i5
	stw	%l5,	[%l7 + 0x40]
	fpadd16s	%f17,	%f15,	%f18
	ldsh	[%l7 + 0x42],	%i4
	fmovdge	%xcc,	%f24,	%f14
	fmovdlg	%fcc1,	%f24,	%f16
	call	loop_459
	call	loop_460
	subcc	%o2,	0x0B33,	%g4
	fmovscs	%xcc,	%f18,	%f1
loop_459:
	call	loop_461
loop_460:
	fandnot1	%f22,	%f30,	%f20
	ta	%icc,	0x3
	call	loop_462
loop_461:
	fmovdl	%fcc0,	%f30,	%f8
	wr	%o1,	0x09A2,	%clear_softint
	fnot2s	%f19,	%f4
loop_462:
	taddcc	%l4,	0x05D9,	%i6
	fcmpes	%fcc0,	%f25,	%f8
	rd	%ccr,	%i3
	call	loop_463
	mulscc	%l6,	0x0FC7,	%l2
	call	loop_464
	taddcc	%i0,	0x1128,	%i7
loop_463:
	call	loop_465
	fbl,a,pn	%fcc2,	loop_466
loop_464:
	wr	%i1,	0x05F4,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_465:
	call	loop_467
loop_466:
	movgu	%icc,	0x00A,	%o5
	fpsub16	%f6,	%f28,	%f10
	call	loop_468
loop_467:
	fexpand	%f27,	%f4
	call	loop_469
	wr	%g7,	%o7,	%ccr
loop_468:
	tgu	%xcc,	0x1
	andn	%g5,	%g3,	%o0
loop_469:
	fpack32	%f8,	%f0,	%f8
	rdhpr	%hintp,	%g1
	rdhpr	%ver,	%o6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_470
	call	loop_471
	rd	%sys_tick_cmpr,	%l3
	fxors	%f19,	%f7,	%f19
loop_470:
	fmovrsne	%l0,	%f10,	%f6
loop_471:
	call	loop_472
	edge32	%g6,	%g2,	%l1
	call	loop_473
	fmovdle	%xcc,	%f24,	%f2
loop_472:
	call	loop_474
	fcmpeq32	%f2,	%f30,	%o4
loop_473:
	tge	%xcc,	0x1
	nop
	set	0x0C, %g5
	prefetch	[%l7 + %g5],	 2
loop_474:
	call	loop_475
	fmovsne	%xcc,	%f8,	%f14
	flushw
	movvs	%xcc,	%l5,	%i5
loop_475:
	movuge	%fcc0,	%o2,	%i4
	fsrc2	%f20,	%f4
	fmovrdlez	%o1,	%f22,	%f0
	fnor	%f16,	%f6,	%f10
	movrgz	%l4,	%g4,	%i6
	movo	%fcc2,	%i3,	%l2
	tsubcctv	%l6,	0x0769,	%i7
	call	loop_476
	movvs	%xcc,	%i0,	%i2
	faligndata	%f22,	%f14,	%f28
	call	loop_477
loop_476:
	call	loop_478
	call	loop_479
loop_477:
	nop

loop_478:
	nop

loop_479:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 8
!	Type a   	: 21
!	Type x   	: 1
!	Type cti   	: 59
!	Type f   	: 65
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
.word 0x338DA5F1
.word 0xBCB93AC1
.word 0x07940A61
.word 0x1941E5AD
.word 0xE5F93799
.word 0xF099897A
.word 0x515E6CAD
.word 0xD251A889
.word 0x5CD5933A
.word 0xAB6E310D
.word 0x2E0AC738
.word 0x1CFC535E
.word 0xA3F404CC
.word 0x4E85E0C2
.word 0xA27301F5
.word 0x4829D82C
.word 0x7A761C9D
.word 0x8891CE92
.word 0x5D5470D9
.word 0xACB8F0AB
.word 0x873214D7
.word 0xA59EF550
.word 0xBC02FBCF
.word 0xC914FA64
.word 0xE9C7ABAB
.word 0x969E3EE5
.word 0xF9B11CE5
.word 0xB3FCEAAC
.word 0xCD6A99B1
.word 0x60804DE7
.word 0xAD6CEDA4
.word 0xFCAF218B
.word 0x62C8EF98
.word 0x0C85B1CE
.word 0x2679479E
.word 0x5D49CEDF
.word 0x0EF2BB4B
.word 0xAD14D5E9
.word 0xDF65EF1F
.word 0xE3344F84
.word 0x3B3614E3
.word 0x5303C86F
.word 0x5E3DBFA7
.word 0x26105C03
.word 0x783CD291
.word 0x828C4330
.word 0x3031FF18
.word 0x902BA681
.word 0x3ACACA1A
.word 0x8C77345F
.word 0xD0962CB6
.word 0x9AFC4415
.word 0x6615D8C5
.word 0x3993C9D4
.word 0xD325E281
.word 0xAD7A33F3
.word 0xDAD1838A
.word 0x2526F13A
.word 0x7F8779AE
.word 0x38D8E1C5
.word 0xFFB17154
.word 0x80B2ECF8
.word 0xA5761261
.word 0xF21D8D3C
.end
