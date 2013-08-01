/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_siam_traps_21.s
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
.ident "Mon Dec  8 19:51:05 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_siam_traps_21.s,v 1.4 2007/07/27 21:45:32 drp Exp $"
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
	siam	0x4
	edge32l	%l5,	%o3,	%l0
	siam	0x0
	siam	0x4
	siam	0x0
	siam	0x1
	siam	0x6
	siam	0x5
	orncc	%i2,	0x0E85,	%g6
	smulcc	%g1,	0x0D7A,	%i6
	movrlez	%o6,	%g3,	%l1
	nop
	setx	0x8235415133403864,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	siam	0x3
	siam	0x0
	siam	0x1
	orncc	%l4,	0x0782,	%l3
	movu	%fcc2,	0x5AF,	%g4
	siam	0x7
	movule	%fcc2,	%g2,	%o2
	siam	0x5
	siam	0x7
	movvs	%xcc,	0x2F2,	%i0
	siam	0x1
	siam	0x1
	movneg	%xcc,	%i3,	%o7
	movule	%fcc2,	%o5,	%i1
	alignaddr	%l6,	%o1,	%i5
	siam	0x2
	siam	0x4
	movleu	%xcc,	0x1FC,	%i4
	array32	%o4,	%g5,	%i7
	siam	0x2
	movul	%fcc0,	0x344,	%o0
	siam	0x4
	movn	%fcc1,	0x756,	%l2
	siam	0x4
	bne,a,pn	%xcc,	loop_1
	edge16ln	%l5,	%g7,	%l0
	siam	0x4
	umul	%o3,	%i2,	%g1
loop_1:
	or	%i6,	%o6,	%g3
	siam	0x7
	tn	%icc,	0x0
	siam	0x6
	siam	0x0
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xea,	%g6
	siam	0x5
	siam	0x6
	movne	%icc,	%l4,	%l1
	set	0x3C, %g4
	ldswa	[%l7 + %g4] 0x89,	%g4
	umulcc	%l3,	%g2,	%o2
	movle	%fcc2,	0x160,	%i3
	xnorcc	%o7,	0x08D4,	%i0
	siam	0x4
	tcs	%icc,	0x2
	addcc	%o5,	%l6,	%i1
	bmask	%i5,	%o1,	%i4
	siam	0x4
	movlg	%fcc3,	%o4,	%g5
	siam	0x1
	siam	0x7
	xorcc	%i7,	%o0,	%l2
	taddcc	%g7,	%l5,	%o3
	set	0x60, %o7
	stba	%l0,	[%l7 + %o7] 0x2f
	membar	#Sync
	nop
	setx	0x0A1D,	%l0,	%i2
	sdivcc	%g1,	%i2,	%o6
	siam	0x6
	tpos	%icc,	0x0
	siam	0x3
	edge32ln	%i6,	%g3,	%g6
	siam	0x7
	nop
	set	0x18, %l4
	lduh	[%l7 + %l4],	%l4
	siam	0x7
	siam	0x4
	siam	0x1
	movvs	%icc,	0x003,	%l1
	movuge	%fcc1,	%l3,	%g4
	siam	0x5
	siam	0x3
	edge8ln	%o2,	%i3,	%o7
	and	%i0,	%g2,	%o5
	siam	0x3
	siam	0x6
	edge32n	%i1,	%i5,	%o1
	subcc	%l6,	%o4,	%i4
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%i7
	nop
	set	0x78, %i6
	flush	%l7 + %i6
	umulcc	%o0,	%g5,	%g7
	siam	0x6
	xnorcc	%l5,	%l2,	%o3
	fbn,a	%fcc0,	loop_2
	siam	0x4
	siam	0x3
	sll	%g1,	%l0,	%o6
loop_2:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%i6
	siam	0x6
	sir	0x013A
	smulcc	%i2,	0x0949,	%g6
	siam	0x4
	edge8ln	%g3,	%l4,	%l3
	andncc	%l1,	0x0A1E,	%o2
	move	%xcc,	%i3,	%g4
	siam	0x0
	bmask	%i0,	%o7,	%o5
	be,a	%xcc,	loop_3
	move	%fcc3,	%i1,	%g2
	siam	0x7
	siam	0x0
loop_3:
	tsubcc	%o1,	%l6,	%o4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	siam	0x7
	tl	%xcc,	0x4
	flushw
	siam	0x4
	bg,pt	%xcc,	loop_4
	nop
	setx	0x10C2,	%l0,	%i4
	sdiv	%i5,	%i4,	%i7
	sll	%g5,	0x01,	%o0
	orn	%l5,	0x0778,	%g7
loop_4:
	siam	0x6
	siam	0x0
	siam	0x5
	call	loop_5
	siam	0x1
	membar	0x6A
	andcc	%o3,	0x193B,	%l2
loop_5:
	andncc	%l0,	0x1214,	%g1
	siam	0x5
	tle	%xcc,	0x6
	ldd	[%l7 + 0x58],	%f8
	siam	0x5
	movcc	%xcc,	%o6,	%i2
	siam	0x4
	siam	0x3
	mulscc	%g6,	0x14B6,	%g3
	siam	0x0
	tneg	%xcc,	0x2
	bmask	%l4,	%i6,	%l3
	edge8n	%l1,	%i3,	%o2
	siam	0x4
	siam	0x0
	siam	0x1
	siam	0x0
	siam	0x6
	tsubcc	%g4,	%o7,	%o5
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%i0
	tn	%xcc,	0x2
	movge	%fcc0,	0x5D8,	%g2
	siam	0x6
	siam	0x5
	xor	%i0,	0x09F9,	%o1
	popc	%o4,	%l6
	siam	0x1
	siam	0x7
	siam	0x7
	siam	0x0
	bvs,a,pt	%icc,	loop_6
	movpos	%xcc,	%i4,	%i7
	sdivcc	%i5,	0x0F6E,	%o0
	tle	%icc,	0x1
loop_6:
	movneg	%xcc,	0x760,	%g5
	tneg	%icc,	0x4
	siam	0x3
	and	%g7,	%l5,	%o3
	siam	0x2
	ba,a,pt	%xcc,	loop_7
	mulscc	%l2,	0x0707,	%g1
	movpos	%icc,	%l0,	%i2
	bvc,pn	%xcc,	loop_8
loop_7:
	siam	0x1
	fba,pt	%fcc1,	loop_9
	bl,a	%icc,	loop_10
loop_8:
	siam	0x5
	bpos,a,pn	%icc,	loop_11
loop_9:
	movrlz	%g6,	%o6,	%l4
loop_10:
	tvc	%icc,	0x4
	tvs	%xcc,	0x1
loop_11:
	siam	0x3
	siam	0x6
	siam	0x6
	siam	0x7
	siam	0x7
	membar	0x53
	st	%fsr,	[%l7 + 0x24]
	smulcc	%i6,	%g3,	%l3
	fbue,a	%fcc0,	loop_12
	membar	0x5C
	and	%i3,	0x118E,	%l1
	mulscc	%g4,	%o2,	%o5
loop_12:
	movcc	%icc,	0x614,	%i1
	siam	0x2
	sethi	0x00EC,	%o7
	bne,a	%icc,	loop_13
	movrgz	%i0,	%o1,	%g2
	set	0x08, %g3
	stda	%i6,	[%l7 + %g3] 0x22
	membar	#Sync
loop_13:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 13
!	Type x   	: 6
!	Type cti   	: 13
!	Type f   	: 80
!	Type i   	: 88
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
	set	0x1,	%g2
	set	0x7,	%g3
	set	0x6,	%g4
	set	0xD,	%g5
	set	0xD,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x7,	%i1
	set	-0x2,	%i2
	set	-0xD,	%i3
	set	-0xE,	%i4
	set	-0xB,	%i5
	set	-0x7,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x5175F673,	%l0
	set	0x7EC05BEF,	%l1
	set	0x6A992E6C,	%l2
	set	0x31391331,	%l3
	set	0x10CCB3FD,	%l4
	set	0x7614D3AC,	%l5
	set	0x4B998D20,	%l6
	!# Output registers
	set	-0x1B6A,	%o0
	set	-0x10A0,	%o1
	set	-0x1DB0,	%o2
	set	-0x014F,	%o3
	set	-0x1436,	%o4
	set	-0x125A,	%o5
	set	0x183F,	%o6
	set	0x17CD,	%o7
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

	siam	0x5
	brgz,pn	%o4,	loop_14
	array32	%i7,	%i5,	%o0
	srlx	%g5,	0x19,	%g7
	movre	%i4,	0x06A,	%o3
loop_14:
	edge8l	%l5,	%g1,	%l2
	edge8l	%l0,	%i2,	%g6
	siam	0x2
	fblg	%fcc3,	loop_15
	siam	0x2
	siam	0x5
	siam	0x6
loop_15:
	tvc	%icc,	0x3
	srl	%o6,	%i6,	%l4
	siam	0x5
	nop
	setx	0x1FF5,	%l0,	%i3
	sdivcc	%g3,	%i3,	%l3
	siam	0x3
	siam	0x4
	siam	0x5
	siam	0x0
	xnorcc	%g4,	0x171B,	%l1
	siam	0x2
	siam	0x4
	siam	0x1
	siam	0x6
	movvc	%xcc,	0x292,	%o5
	movule	%fcc2,	0x1F9,	%o2
	array16	%i1,	%o7,	%o1
	movle	%icc,	%g2,	%l6
	siam	0x6
	sethi	0x060B,	%o4
	fbne	%fcc1,	loop_16
	brlz	%i7,	loop_17
	ld	[%l7 + 0x10],	%f28
	siam	0x7
loop_16:
	nop
	setx	0x09E7,	%l0,	%i0
	udiv	%i5,	%i0,	%o0
loop_17:
	tsubcctv	%g7,	%i4,	%o3
	sra	%l5,	0x15,	%g1
	siam	0x2
	siam	0x6
	siam	0x6
	set	0x0D, %o3
	stba	%g5,	[%l7 + %o3] 0x18
	siam	0x6
	set	0x0C, %g7
	lda	[%l7 + %g7] 0x18,	%f4
	popc	0x04A4,	%l0
	siam	0x5
	stx	%l2,	[%l7 + 0x60]
	siam	0x7
	tvs	%icc,	0x0
	xor	%i2,	0x1E2F,	%o6
	movg	%xcc,	0x4EE,	%i6
	siam	0x1
	movne	%fcc2,	0x498,	%g6
	siam	0x0
	mulscc	%g3,	%l4,	%i3
	movleu	%icc,	%l3,	%g4
	siam	0x3
	sir	0x0AA2
	taddcc	%l1,	%o5,	%o2
	alignaddr	%i1,	%o7,	%o1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%l6
	siam	0x6
	siam	0x4
	siam	0x6
	movl	%fcc3,	%o4,	%i7
	siam	0x4
	call	loop_18
	andcc	%g2,	0x1DC4,	%i5
	siam	0x1
	set	0x1C, %i7
	lda	[%l7 + %i7] 0x81,	%f22
loop_18:
	siam	0x6
	edge8ln	%i0,	%o0,	%g7
	ba,a,pt	%xcc,	loop_19
	siam	0x6
	siam	0x1
	subcc	%o3,	%i4,	%g1
loop_19:
	siam	0x0
	edge8ln	%g5,	%l0,	%l2
	fbule,a,pt	%fcc2,	loop_20
	nop
	set	0x28, %o5
	ldsw	[%l7 + %o5],	%l5
	siam	0x0
	sir	0x0C3B
loop_20:
	siam	0x3
	siam	0x6
	edge16n	%i2,	%i6,	%g6
	tge	%xcc,	0x5
	siam	0x6
	movcs	%icc,	0x701,	%o6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x18,	%l4,	%i3
	siam	0x2
	andn	%l3,	0x09F9,	%g3
	mulscc	%g4,	0x18FC,	%l1
	udiv	%o5,	0x05C5,	%o2
	nop
	setx	0x0961,	%l0,	%o7
	udivcc	%i1,	%o7,	%o1
	udivcc	%l6,	0x11BB,	%i7
	movl	%icc,	%o4,	%g2
	smul	%i5,	%i0,	%g7
	udivcc	%o3,	0x067D,	%o0
	nop
	setx	0x0A32,	%l0,	%g5
	sdivcc	%g1,	%g5,	%i4
	tgu	%icc,	0x5
	xorcc	%l0,	%l5,	%i2
	tleu	%icc,	0x6
	siam	0x1
	lduw	[%l7 + 0x6C],	%l2
	movrlz	%i6,	0x201,	%o6
	xnor	%g6,	0x139E,	%i3
	siam	0x6
	movl	%fcc1,	%l3,	%g3
	edge32ln	%l4,	%g4,	%l1
	xor	%o2,	0x094A,	%o5
	siam	0x2
	siam	0x2
	siam	0x1
	siam	0x4
	siam	0x0
	movlg	%fcc2,	%o7,	%o1
	tsubcc	%i1,	%i7,	%o4
	srax	%g2,	%i5,	%i0
	tvc	%xcc,	0x5
	siam	0x1
	siam	0x3
	and	%g7,	0x03FB,	%o3
	membar	0x76
	tsubcctv	%l6,	0x08A0,	%o0
	siam	0x7
	siam	0x1
	subccc	%g5,	0x1924,	%g1
	siam	0x5
	siam	0x3
	siam	0x6
	fbn,a,pn	%fcc3,	loop_21
	tleu	%xcc,	0x0
	fbge,a,pt	%fcc3,	loop_22
	tcc	%icc,	0x7
loop_21:
	siam	0x6
	wr	%g0,	0x27,	%asi
	stwa	%l0,	[%l7 + 0x38] %asi
	membar	#Sync
loop_22:
	bcs,pn	%xcc,	loop_23
	stbar
	movrlz	%l5,	0x37F,	%i4
	movo	%fcc2,	%l2,	%i2
loop_23:
	movleu	%xcc,	%o6,	%g6
	set	0x34, %i4
	ldsha	[%l7 + %i4] 0x11,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%l3
	fbge	%fcc1,	loop_24
	swap	[%l7 + 0x20],	%g3
	siam	0x6
	move	%fcc3,	%l4,	%g4
loop_24:
	movneg	%xcc,	%o2,	%o5
	siam	0x7
	fbug,pt	%fcc0,	loop_25
	array32	%o7,	%o1,	%i1
	addcc	%l1,	%o4,	%g2
	siam	0x3
loop_25:
	siam	0x5
	siam	0x5
	flushw
	taddcctv	%i5,	%i0,	%i7
	set	0x4C, %o4
	ldswa	[%l7 + %o4] 0x0c,	%g7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32ln	%l6,	%o3,	%g5
	siam	0x4
	bg,a	%xcc,	loop_26
	srax	%o0,	%l0,	%g1
	siam	0x6
	fblg,pt	%fcc2,	loop_27
loop_26:
	siam	0x1
	siam	0x3
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_27:
	orncc	%i4,	0x192F,	%l5
	edge16	%l2,	%o6,	%g6
	siam	0x0
	movrne	%i6,	0x191,	%i3
	srax	%i2,	%g3,	%l4
	siam	0x6
	siam	0x7
	movlg	%fcc2,	0x524,	%l3
	wr	%g0,	0xeb,	%asi
	stwa	%g4,	[%l7 + 0x5C] %asi
	membar	#Sync
	xnorcc	%o2,	%o7,	%o5
	siam	0x3
	call	loop_28
	brgez,pt	%o1,	loop_29
	edge32	%i1,	%o4,	%g2
	addcc	%i5,	%l1,	%i0
loop_28:
	ba,a,pt	%icc,	loop_30
loop_29:
	siam	0x2
	subc	%i7,	0x08D8,	%l6
	array32	%o3,	%g7,	%g5
loop_30:
	bneg,pn	%icc,	loop_31
	siam	0x5
loop_31:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 17
!	Type x   	: 11
!	Type cti   	: 18
!	Type f   	: 69
!	Type i   	: 85
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
	set	0x0,	%g1
	set	0xC,	%g2
	set	0x2,	%g3
	set	0x2,	%g4
	set	0x4,	%g5
	set	0x9,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0x9,	%i2
	set	-0xA,	%i3
	set	-0x0,	%i4
	set	-0x1,	%i5
	set	-0xF,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x1D165AC8,	%l0
	set	0x7CF15BEF,	%l1
	set	0x4FD69807,	%l2
	set	0x50286738,	%l3
	set	0x2CF22337,	%l4
	set	0x29734A62,	%l5
	set	0x3717B3D8,	%l6
	!# Output registers
	set	-0x1936,	%o0
	set	-0x0189,	%o1
	set	-0x0ABC,	%o2
	set	0x165C,	%o3
	set	0x1AF3,	%o4
	set	-0x1059,	%o5
	set	0x03F7,	%o6
	set	-0x0C0D,	%o7
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

	siam	0x1
	orncc	%l0,	0x1244,	%o0
	movge	%xcc,	0x77F,	%i4
	siam	0x5
	siam	0x3
	siam	0x0
	movgu	%xcc,	%l5,	%l2
	siam	0x6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x30] %asi,	%o6
	sdivcc	%g1,	0x17CA,	%i6
	siam	0x6
	siam	0x6
	siam	0x7
	array32	%g6,	%i2,	%g3
	edge16l	%i3,	%l4,	%l3
	siam	0x1
	siam	0x6
	ba,a,pn	%icc,	loop_32
	siam	0x4
	tleu	%xcc,	0x0
	array32	%g4,	%o7,	%o2
loop_32:
	siam	0x1
	tle	%xcc,	0x1
	movpos	%icc,	0x339,	%o5
	siam	0x3
	siam	0x3
	brlz,a	%o1,	loop_33
	edge16	%i1,	%o4,	%g2
	brz	%l1,	loop_34
	siam	0x2
loop_33:
	sra	%i0,	0x1F,	%i5
	tleu	%xcc,	0x7
loop_34:
	siam	0x2
	ld	[%l7 + 0x4C],	%f15
	te	%xcc,	0x6
	movl	%fcc0,	%l6,	%o3
	movlg	%fcc2,	0x3C8,	%g7
	siam	0x1
	siam	0x7
	bvc,a,pn	%xcc,	loop_35
	siam	0x5
	bvs	%xcc,	loop_36
	siam	0x1
loop_35:
	siam	0x7
	ta	%xcc,	0x0
loop_36:
	siam	0x4
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%g5
	andncc	%i7,	%o0,	%i4
	siam	0x1
	nop
	set	0x78, %o0
	stx	%l0,	[%l7 + %o0]
	bgu,pn	%icc,	loop_37
	be,a	%icc,	loop_38
	edge8	%l5,	%o6,	%l2
	siam	0x1
loop_37:
	sll	%g1,	%g6,	%i2
loop_38:
	siam	0x2
	tge	%xcc,	0x2
	edge8n	%g3,	%i3,	%l4
	be	%xcc,	loop_39
	udivcc	%l3,	0x05D7,	%g4
	subc	%o7,	0x01D1,	%o2
	sra	%i6,	%o5,	%i1
loop_39:
	tneg	%icc,	0x0
	umulcc	%o1,	0x03F3,	%g2
	siam	0x0
	andncc	%l1,	0x05F1,	%o4
	orn	%i0,	%l6,	%o3
	fbg,pt	%fcc1,	loop_40
	siam	0x4
	flush	%l7 + 0x30
	siam	0x0
loop_40:
	siam	0x7
	siam	0x6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x5
	siam	0x1
	sll	%g7,	0x09,	%g5
	subccc	%i7,	0x1F99,	%i5
	tle	%icc,	0x3
	movrlez	%o0,	%i4,	%l5
	edge16n	%o6,	%l0,	%g1
	tn	%icc,	0x5
	stbar
	nop
	set	0x4C, %o1
	swap	[%l7 + %o1],	%l2
	brnz,a	%i2,	loop_41
	siam	0x1
	siam	0x7
	ba	%xcc,	loop_42
loop_41:
	nop
	setx loop_43, %l0, %l1
	jmpl %l1, %g3
	siam	0x0
	orcc	%g6,	%l4,	%i3
loop_42:
	nop
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xcd
loop_43:
	siam	0x7
	siam	0x5
	siam	0x7
	brnz,pt	%l3,	loop_44
	subccc	%o7,	0x0D19,	%o2
	fbo,a	%fcc1,	loop_45
	siam	0x2
loop_44:
	siam	0x2
	alignaddr	%g4,	%o5,	%i6
loop_45:
	andcc	%o1,	%i1,	%l1
	bcc,a	%icc,	loop_46
	siam	0x1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x0
loop_46:
	movg	%fcc2,	0x766,	%o4
	siam	0x4
	siam	0x5
	siam	0x2
	bmask	%g2,	%i0,	%l6
	siam	0x1
	andn	%g7,	0x0FBA,	%g5
	siam	0x4
	add	%o3,	0x0EF3,	%i5
	siam	0x4
	movleu	%icc,	%o0,	%i7
	tcc	%icc,	0x2
	xorcc	%l5,	%o6,	%l0
	siam	0x0
	siam	0x5
	edge16n	%g1,	%l2,	%i2
	bvs,a,pt	%xcc,	loop_47
	tl	%xcc,	0x7
	andncc	%g3,	0x07AA,	%i4
	siam	0x3
loop_47:
	subcc	%l4,	%i3,	%g6
	siam	0x2
	siam	0x4
	siam	0x0
	siam	0x1
	sethi	0x11FB,	%o7
	movlg	%fcc0,	0x624,	%o2
	bg	%xcc,	loop_48
	sub	%g4,	%l3,	%i6
	siam	0x4
	edge8l	%o5,	%o1,	%i1
loop_48:
	tvs	%icc,	0x7
	ldx	[%l7 + 0x68],	%o4
	siam	0x0
	siam	0x7
	orncc	%l1,	0x1B3C,	%g2
	movue	%fcc2,	0x0B1,	%i0
	sir	0x014E
	siam	0x7
	siam	0x0
	flushw
	siam	0x4
	siam	0x2
	edge16n	%g7,	%l6,	%o3
	siam	0x0
	siam	0x0
	subc	%i5,	%o0,	%g5
	movrgz	%i7,	0x110,	%o6
	stx	%fsr,	[%l7 + 0x78]
	siam	0x0
	sethi	0x08B3,	%l5
	siam	0x0
	tvs	%icc,	0x2
	addccc	%l0,	0x0F59,	%l2
	st	%fsr,	[%l7 + 0x18]
	siam	0x6
	tsubcctv	%i2,	%g1,	%g3
	siam	0x2
	siam	0x2
	fbn,a,pn	%fcc3,	loop_49
	edge16	%i4,	%i3,	%g6
	tle	%xcc,	0x3
	tvc	%xcc,	0x6
loop_49:
	siam	0x6
	udivx	%l4,	0x0359,	%o7
	std	%g4,	[%l7 + 0x68]
	set	0x40, %l3
	stha	%l3,	[%l7 + %l3] 0xea
	membar	#Sync
	tne	%xcc,	0x3
	siam	0x5
	add	%i6,	%o5,	%o1
	movleu	%icc,	0x565,	%o2
	siam	0x7
	sdivx	%i1,	0x1F34,	%o4
	siam	0x6
	siam	0x1
	movneg	%icc,	0x030,	%l1
	membar	0x5C
	bvc,a	%xcc,	loop_50
	edge8n	%i0,	%g2,	%g7
	ldsw	[%l7 + 0x54],	%l6
	edge8ln	%i5,	%o3,	%o0
loop_50:
	movlg	%fcc3,	%g5,	%i7
	siam	0x6
	movrne	%o6,	0x038,	%l5
	siam	0x5
	movne	%fcc3,	0x291,	%l0
	siam	0x0
	siam	0x4
	movpos	%xcc,	%i2,	%g1
	siam	0x1
	fbe,a	%fcc2,	loop_51
loop_51:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 14
!	Type cti   	: 20
!	Type x   	: 3
!	Type f   	: 79
!	Type i   	: 84
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
	set	0xE,	%g2
	set	0x4,	%g3
	set	0xD,	%g4
	set	0xA,	%g5
	set	0xE,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x9,	%i1
	set	-0x9,	%i2
	set	-0x3,	%i3
	set	-0x6,	%i4
	set	-0x4,	%i5
	set	-0xA,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x2767527B,	%l0
	set	0x0B1A9E99,	%l1
	set	0x548E2701,	%l2
	set	0x7C392080,	%l3
	set	0x45B21112,	%l4
	set	0x25C4AA7C,	%l5
	set	0x25F95F7F,	%l6
	!# Output registers
	set	0x12A7,	%o0
	set	-0x0C3E,	%o1
	set	0x1A33,	%o2
	set	0x08D6,	%o3
	set	0x0EDA,	%o4
	set	-0x0E23,	%o5
	set	0x1D42,	%o6
	set	0x0333,	%o7
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

	siam	0x6
	sir	0x0BFB
	siam	0x7
	siam	0x5
	membar	0x43
	siam	0x3
	siam	0x1
	siam	0x5
	siam	0x7
	bn,a,pn	%xcc,	loop_52
	siam	0x4
	or	%g3,	0x18CF,	%i4
	sll	%i3,	0x13,	%l2
loop_52:
	std	%l4,	[%l7 + 0x20]
	andncc	%o7,	%g6,	%g4
	siam	0x1
	movo	%fcc0,	0x694,	%i6
	orn	%l3,	0x0362,	%o5
	siam	0x6
	siam	0x6
	fble,pt	%fcc0,	loop_53
	siam	0x2
	siam	0x4
	movug	%fcc1,	0x714,	%o1
loop_53:
	andncc	%o2,	0x0A8C,	%o4
	and	%i1,	%l1,	%g2
	movgu	%xcc,	%g7,	%l6
	siam	0x6
	siam	0x3
	smul	%i5,	0x07E3,	%o3
	fbo,a,pt	%fcc2,	loop_54
	bmask	%i0,	%o0,	%g5
	popc	%o6,	%l5
	movrlez	%l0,	%i7,	%i2
loop_54:
	fba,pn	%fcc0,	loop_55
	siam	0x7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x3
loop_55:
	bl,a,pt	%icc,	loop_56
	siam	0x1
	siam	0x1
	bg,a	%xcc,	loop_57
loop_56:
	siam	0x7
	edge32	%g1,	%g3,	%i3
	subccc	%l2,	0x012A,	%i4
loop_57:
	siam	0x6
	movcc	%icc,	0x6A1,	%o7
	siam	0x4
	siam	0x0
	array16	%l4,	%g6,	%i6
	siam	0x4
	sethi	0x1732,	%g4
	siam	0x5
	siam	0x3
	bcs	%xcc,	loop_58
	edge32n	%o5,	%l3,	%o1
	movre	%o2,	%i1,	%o4
	taddcctv	%l1,	0x1E54,	%g7
loop_58:
	siam	0x2
	siam	0x6
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x81,	 3
	edge32	%i5,	%o3,	%g2
	nop
	set	0x21, %i5
	ldub	[%l7 + %i5],	%i0
	siam	0x2
	siam	0x3
	tn	%icc,	0x4
	tvs	%icc,	0x0
	movg	%icc,	%o0,	%g5
	nop
	setx	0xF08272939D30257C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	flushw
	orn	%o6,	%l0,	%l5
	wr	%g0,	0xeb,	%asi
	stxa	%i2,	[%l7 + 0x58] %asi
	membar	#Sync
	siam	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i7
	siam	0x4
	siam	0x4
	siam	0x6
	siam	0x7
	edge8	%g1,	%g3,	%l2
	fbe	%fcc0,	loop_59
	siam	0x0
	flushw
	movrgez	%i3,	%o7,	%i4
loop_59:
	siam	0x3
	nop
	setx	0x714A76DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	xnorcc	%l4,	%g6,	%g4
	bcs,pt	%icc,	loop_60
	siam	0x3
	siam	0x7
	fbuge	%fcc1,	loop_61
loop_60:
	movpos	%xcc,	0x652,	%o5
	udivx	%i6,	0x07E4,	%o1
	andn	%o2,	%l3,	%o4
loop_61:
	siam	0x1
	bgu	%xcc,	loop_62
	add	%i1,	0x10D2,	%l1
	edge32	%g7,	%i5,	%o3
	array8	%l6,	%g2,	%o0
loop_62:
	umul	%g5,	%o6,	%i0
	siam	0x7
	siam	0x4
	siam	0x4
	fba,a,pn	%fcc3,	loop_63
	lduh	[%l7 + 0x36],	%l0
	sethi	0x0D2A,	%i2
	siam	0x2
loop_63:
	st	%fsr,	[%l7 + 0x30]
	swap	[%l7 + 0x50],	%l5
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 4
	tgu	%icc,	0x0
	siam	0x6
	nop
	setx loop_64, %l0, %l1
	jmpl %l1, %g1
	siam	0x7
	nop
	set	0x48, %l0
	ldsh	[%l7 + %l0],	%g3
	membar	0x37
loop_64:
	tle	%xcc,	0x6
	siam	0x7
	movre	%l2,	0x120,	%i3
	bpos,a,pt	%xcc,	loop_65
	siam	0x0
	siam	0x0
	siam	0x7
loop_65:
	ba,pt	%xcc,	loop_66
	add	%o7,	%i7,	%l4
	siam	0x2
	addcc	%g6,	0x03E2,	%i4
loop_66:
	subccc	%o5,	%g4,	%o1
	fbu	%fcc1,	loop_67
	fbuge,a,pt	%fcc3,	loop_68
	fbge,a,pt	%fcc2,	loop_69
	array16	%o2,	%l3,	%o4
loop_67:
	movuge	%fcc3,	0x3F6,	%i6
loop_68:
	bge	%xcc,	loop_70
loop_69:
	siam	0x2
	movrgez	%i1,	0x067,	%l1
	siam	0x2
loop_70:
	andcc	%g7,	0x1483,	%o3
	siam	0x1
	siam	0x6
	siam	0x2
	tpos	%icc,	0x7
	siam	0x3
	edge32ln	%i5,	%l6,	%g2
	siam	0x4
	siam	0x3
	siam	0x2
	alignaddrl	%o0,	%o6,	%g5
	siam	0x1
	siam	0x6
	tcc	%icc,	0x5
	siam	0x5
	movg	%fcc0,	%l0,	%i0
	sub	%i2,	%g1,	%g3
	bcs	%icc,	loop_71
	siam	0x2
	srax	%l5,	0x18,	%i3
	sethi	0x09F3,	%o7
loop_71:
	fbn	%fcc2,	loop_72
	siam	0x7
	siam	0x5
	siam	0x1
loop_72:
	nop
	setx	0x0E13,	%l0,	%l2
	sdivx	%i7,	%l2,	%g6
	siam	0x6
	siam	0x4
	siam	0x6
	bpos,a,pt	%icc,	loop_73
	siam	0x2
	movgu	%xcc,	0x468,	%i4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_73:
	alignaddrl	%l4,	%g4,	%o5
	popc	%o2,	%o1
	movcs	%xcc,	0x608,	%l3
	siam	0x5
	sdiv	%o4,	0x080A,	%i6
	ba	%xcc,	loop_74
	movl	%xcc,	0x2E3,	%i1
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
loop_74:
	siam	0x2
	siam	0x7
	siam	0x1
	fbn,pn	%fcc3,	loop_75
	edge16n	%l1,	%o3,	%i5
	siam	0x5
	brlz,a,pt	%l6,	loop_76
loop_75:
	bmask	%g2,	%o0,	%g5
	nop
	set	0x56, %l6
	ldstub	[%l7 + %l6],	%l0
	sir	0x0922
loop_76:
	movue	%fcc2,	0x458,	%o6
	siam	0x5
	sdiv	%i2,	0x1C1B,	%g1
	fbl	%fcc3,	loop_77
	movrgez	%g3,	%l5,	%i3
	siam	0x0
	st	%f19,	[%l7 + 0x3C]
loop_77:
	tsubcctv	%i0,	%o7,	%l2
	sdiv	%g6,	0x0DC6,	%i7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 15
!	Type x   	: 4
!	Type cti   	: 26
!	Type f   	: 78
!	Type i   	: 77
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
	set	0xA,	%g1
	set	0x8,	%g2
	set	0x6,	%g3
	set	0xF,	%g4
	set	0xA,	%g5
	set	0x7,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x2,	%i1
	set	-0xC,	%i2
	set	-0x2,	%i3
	set	-0x4,	%i4
	set	-0x9,	%i5
	set	-0x2,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x0FEBB093,	%l0
	set	0x61C9C8C2,	%l1
	set	0x7E672984,	%l2
	set	0x40D95741,	%l3
	set	0x5255560D,	%l4
	set	0x783ED651,	%l5
	set	0x609583A5,	%l6
	!# Output registers
	set	0x08BF,	%o0
	set	0x1503,	%o1
	set	-0x1A05,	%o2
	set	-0x0033,	%o3
	set	-0x1E86,	%o4
	set	-0x1E1C,	%o5
	set	0x06E9,	%o6
	set	-0x1764,	%o7
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

	movn	%icc,	%i4,	%l4
	siam	0x7
	flushw
	siam	0x2
	siam	0x7
	fblg	%fcc3,	loop_78
	siam	0x7
	mulx	%g4,	%o2,	%o5
	siam	0x6
loop_78:
	brlez,a,pn	%l3,	loop_79
	array8	%o1,	%i6,	%i1
	fba	%fcc0,	loop_80
	tpos	%xcc,	0x7
loop_79:
	siam	0x3
	tge	%icc,	0x1
loop_80:
	tle	%xcc,	0x7
	taddcc	%o4,	%g7,	%l1
	tgu	%xcc,	0x1
	siam	0x7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x2
	movvs	%icc,	%o3,	%l6
	addc	%i5,	%o0,	%g5
	siam	0x6
	flushw
	siam	0x1
	siam	0x6
	mulx	%g2,	%o6,	%i2
	nop
	setx	loop_81,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021400001407,	%l0,	%l1
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
	siam	0x5
	fbuge,pt	%fcc2,	loop_82
	movcs	%icc,	0x1CF,	%g1
loop_81:
	nop
	setx	loop_83,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034100001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	siam	0x7
loop_82:
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%g2
	te	%icc,	0x2
loop_83:
	siam	0x3
	siam	0x1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x26] %asi,	%l0
	movrlez	%l5,	0x26F,	%i0
	edge16n	%o7,	%l2,	%g6
	siam	0x1
	tsubcctv	%i7,	0x07C1,	%i4
	tcc	%xcc,	0x7
	movvc	%xcc,	0x072,	%i3
	siam	0x6
	movge	%fcc2,	%l4,	%o2
	andcc	%o5,	%l3,	%o1
	siam	0x0
	siam	0x2
	siam	0x4
	siam	0x0
	nop
	set	0x08, %o2
	stx	%i6,	[%l7 + %o2]
	nop
	setx loop_84, %l0, %l1
	jmpl %l1, %i1
	movcc	%xcc,	0x2E9,	%o4
	nop
	set	0x1E, %l2
	lduh	[%l7 + %l2],	%g7
	movlg	%fcc2,	%g4,	%l1
loop_84:
	edge8l	%o3,	%l6,	%o0
	alignaddrl	%i5,	%g5,	%o6
	movge	%xcc,	0x68A,	%g2
	sethi	0x1017,	%i2
	set	0x38, %l5
	stda	%g0,	[%l7 + %l5] 0x2f
	membar	#Sync
	siam	0x5
	nop
	setx	0x15E1,	%l0,	%g3
	udivx	%l0,	%g3,	%l5
	array16	%o7,	%l2,	%i0
	tsubcc	%g6,	0x1870,	%i7
	tn	%xcc,	0x2
	siam	0x4
	ldx	[%l7 + 0x20],	%i3
	mova	%icc,	%i4,	%l4
	edge16ln	%o2,	%l3,	%o5
	siam	0x2
	movge	%fcc1,	0x735,	%i6
	siam	0x2
	nop
	set	0x68, %i2
	stx	%fsr,	[%l7 + %i2]
	movn	%icc,	0x60E,	%i1
	siam	0x2
	siam	0x6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x6A] %asi,	%o1
	srlx	%o4,	%g7,	%g4
	addcc	%o3,	%l1,	%o0
	xor	%i5,	0x01D9,	%l6
	siam	0x2
	nop
	set	0x5C, %o6
	ldstub	[%l7 + %o6],	%g5
	movug	%fcc0,	0x331,	%g2
	siam	0x1
	edge16	%i2,	%g1,	%o6
	andncc	%l0,	%g3,	%o7
	edge16	%l2,	%i0,	%g6
	siam	0x5
	siam	0x3
	bvs,a,pn	%xcc,	loop_85
	siam	0x4
	movre	%l5,	%i7,	%i3
	siam	0x6
loop_85:
	movrgez	%l4,	%i4,	%o2
	siam	0x1
	siam	0x3
	siam	0x7
	sethi	0x0E06,	%o5
	std	%f0,	[%l7 + 0x70]
	tpos	%xcc,	0x0
	movle	%icc,	%l3,	%i1
	siam	0x6
	siam	0x5
	movleu	%icc,	%i6,	%o1
	bgu,a,pt	%icc,	loop_86
	siam	0x1
	edge8	%g7,	%o4,	%o3
	movge	%fcc1,	0x34A,	%l1
loop_86:
	siam	0x2
	siam	0x6
	fbul,a	%fcc0,	loop_87
	siam	0x1
	siam	0x1
	siam	0x5
loop_87:
	movre	%o0,	0x159,	%i5
	siam	0x3
	nop
	setx	0x0407,	%l0,	%g5
	udivx	%g4,	%g5,	%g2
	siam	0x2
	siam	0x0
	subccc	%l6,	%g1,	%i2
	sdivx	%l0,	0x172D,	%g3
	xnor	%o7,	%o6,	%l2
	tvs	%xcc,	0x3
	siam	0x4
	smulcc	%i0,	0x1894,	%l5
	sllx	%i7,	%i3,	%l4
	tvc	%xcc,	0x0
	umulcc	%g6,	0x113F,	%i4
	siam	0x6
	siam	0x2
	tvc	%icc,	0x0
	movle	%xcc,	%o2,	%l3
	orncc	%o5,	0x1315,	%i1
	siam	0x3
	mulx	%o1,	%i6,	%g7
	siam	0x7
	siam	0x5
	tcc	%xcc,	0x5
	siam	0x6
	siam	0x7
	movcs	%xcc,	%o4,	%o3
	bcc	%xcc,	loop_88
	bne,pt	%xcc,	loop_89
	siam	0x6
	siam	0x1
loop_88:
	alignaddrl	%o0,	%l1,	%g4
loop_89:
	movl	%xcc,	0x3CF,	%g5
	siam	0x6
	set	0x40, %g4
	swapa	[%l7 + %g4] 0x81,	%g2
	addc	%l6,	0x15B6,	%g1
	brz,pn	%i5,	loop_90
	siam	0x3
	andncc	%l0,	%i2,	%g3
	sub	%o7,	%o6,	%i0
loop_90:
	edge32ln	%l2,	%l5,	%i3
	edge32n	%l4,	%g6,	%i7
	siam	0x2
	siam	0x6
	movvc	%icc,	0x33D,	%o2
	siam	0x6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x1
	tcc	%icc,	0x2
	siam	0x3
	smulcc	%i4,	0x0B8C,	%o5
	siam	0x7
	siam	0x3
	subc	%l3,	0x141D,	%o1
	siam	0x1
	siam	0x7
	nop
	set	0x40, %i0
	std	%i6,	[%l7 + %i0]
	siam	0x3
	siam	0x0
	nop
	setx	0x0BE6,	%l0,	%i1
	udiv	%g7,	%i1,	%o3
	siam	0x0
	sub	%o4,	0x03F3,	%l1
	flushw
	xnor	%o0,	%g4,	%g2
	siam	0x1
	fbge,a	%fcc3,	loop_91
	nop
	setx	0x1E29CBB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movg	%xcc,	%g5,	%g1
	siam	0x0
loop_91:
	movvs	%icc,	0x753,	%i5
	siam	0x3
	siam	0x1
	te	%xcc,	0x0
	siam	0x3
	siam	0x1
	tpos	%icc,	0x6
	edge16n	%l6,	%l0,	%i2
	siam	0x6
	siam	0x4
	siam	0x2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 13
!	Type x   	: 4
!	Type cti   	: 14
!	Type f   	: 80
!	Type i   	: 89
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
	set	0xD,	%g1
	set	0xF,	%g2
	set	0xC,	%g3
	set	0xC,	%g4
	set	0x4,	%g5
	set	0x7,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x8,	%i1
	set	-0x2,	%i2
	set	-0x4,	%i3
	set	-0x3,	%i4
	set	-0x2,	%i5
	set	-0xB,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x02A4B6C0,	%l0
	set	0x30F1F9C4,	%l1
	set	0x585ADDFA,	%l2
	set	0x19322758,	%l3
	set	0x4823D7C1,	%l4
	set	0x77780BFD,	%l5
	set	0x61D40055,	%l6
	!# Output registers
	set	0x1146,	%o0
	set	0x118A,	%o1
	set	0x020E,	%o2
	set	0x1F13,	%o3
	set	-0x1CDA,	%o4
	set	-0x11ED,	%o5
	set	-0x1C8D,	%o6
	set	-0x1E0E,	%o7
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

	edge32n	%o7,	%o6,	%i0
	siam	0x1
	alignaddr	%l2,	%l5,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%g6
	siam	0x5
	and	%g3,	%o2,	%i7
	siam	0x7
	fbl,a	%fcc1,	loop_92
	sra	%o5,	0x09,	%l3
	tcc	%xcc,	0x1
	edge8n	%i4,	%i6,	%g7
loop_92:
	siam	0x6
	siam	0x0
	siam	0x4
	movl	%icc,	%o1,	%i1
	siam	0x7
	fbule,a,pn	%fcc0,	loop_93
	tsubcc	%o4,	0x0EFC,	%o3
	fbuge,pn	%fcc0,	loop_94
	siam	0x2
loop_93:
	edge32l	%o0,	%g4,	%g2
	sdivcc	%l1,	0x1F7D,	%g5
loop_94:
	ldsh	[%l7 + 0x24],	%i5
	siam	0x4
	popc	0x1EAA,	%l6
	add	%l0,	0x0675,	%i2
	sir	0x18D3
	xorcc	%g1,	0x0129,	%o6
	tg	%icc,	0x2
	siam	0x5
	array16	%i0,	%l2,	%o7
	siam	0x6
	srl	%i3,	0x07,	%l4
	siam	0x0
	siam	0x4
	movrgz	%l5,	0x1CA,	%g6
	movl	%icc,	%o2,	%g3
	addc	%o5,	0x0BE2,	%i7
	siam	0x6
	siam	0x1
	siam	0x0
	edge8	%i4,	%i6,	%l3
	siam	0x0
	be,a	%icc,	loop_95
	siam	0x0
	edge16l	%o1,	%g7,	%o4
	ta	%icc,	0x2
loop_95:
	sdiv	%o3,	0x01F1,	%o0
	siam	0x2
	siam	0x1
	ta	%icc,	0x6
	popc	%i1,	%g2
	edge8l	%l1,	%g5,	%i5
	array32	%l6,	%l0,	%i2
	siam	0x6
	set	0x74, %o7
	stwa	%g1,	[%l7 + %o7] 0xea
	membar	#Sync
	movgu	%icc,	%g4,	%i0
	siam	0x5
	movcc	%icc,	0x5AF,	%o6
	siam	0x1
	siam	0x6
	tcc	%xcc,	0x3
	sir	0x073C
	siam	0x7
	bgu,pt	%xcc,	loop_96
	ld	[%l7 + 0x58],	%f30
	siam	0x0
	tle	%xcc,	0x4
loop_96:
	siam	0x2
	edge32n	%l2,	%o7,	%i3
	siam	0x2
	siam	0x4
	sll	%l4,	%l5,	%o2
	siam	0x2
	siam	0x7
	siam	0x1
	siam	0x0
	or	%g6,	%o5,	%g3
	siam	0x4
	siam	0x3
	siam	0x2
	siam	0x2
	siam	0x5
	alignaddrl	%i7,	%i6,	%i4
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x80,	 2
	alignaddr	%g7,	%o4,	%o3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x7
	nop
	setx	0x18FB,	%l0,	%i1
	sdivcc	%l3,	%i1,	%o0
	siam	0x3
	fbne,a,pt	%fcc2,	loop_97
	bmask	%l1,	%g2,	%g5
	tsubcc	%i5,	%l6,	%l0
	siam	0x6
loop_97:
	mova	%icc,	0x141,	%g1
	siam	0x5
	edge16	%i2,	%g4,	%i0
	nop
	setx	0x05CA,	%l0,	%o7
	sdivcc	%o6,	%o7,	%l2
	fbne,a	%fcc0,	loop_98
	siam	0x7
	bneg,pt	%xcc,	loop_99
	srlx	%l4,	%l5,	%o2
loop_98:
	siam	0x6
	siam	0x1
loop_99:
	siam	0x3
	siam	0x5
	bge	%xcc,	loop_100
	siam	0x6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x78] %asi,	%g6
loop_100:
	siam	0x4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o5,	%g3
	fbl,a	%fcc1,	loop_101
	siam	0x2
	edge32ln	%i7,	%i6,	%i4
	fbuge,pt	%fcc2,	loop_102
loop_101:
	bpos,a,pn	%xcc,	loop_103
	tpos	%icc,	0x5
	subcc	%i3,	%g7,	%o1
loop_102:
	siam	0x1
loop_103:
	movrne	%o4,	0x111,	%l3
	ldx	[%l7 + 0x68],	%i1
	fbul	%fcc2,	loop_104
	array32	%o0,	%l1,	%g2
	fbule	%fcc0,	loop_105
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%o3
loop_104:
	array16	%i5,	%g5,	%l0
	ld	[%l7 + 0x68],	%f24
loop_105:
	brlez,a	%l6,	loop_106
	mulscc	%g1,	0x1AA4,	%i2
	siam	0x2
	move	%icc,	0x79F,	%i0
loop_106:
	siam	0x7
	tsubcctv	%g4,	%o6,	%l2
	tg	%xcc,	0x6
	siam	0x0
	subcc	%o7,	0x072A,	%l5
	movo	%fcc2,	0x471,	%o2
	siam	0x5
	sethi	0x107D,	%l4
	array8	%o5,	%g6,	%g3
	siam	0x3
	siam	0x2
	movre	%i7,	%i4,	%i6
	srl	%g7,	%i3,	%o1
	xorcc	%o4,	%l3,	%i1
	siam	0x3
	siam	0x5
	fbn,a,pt	%fcc1,	loop_107
	nop
	setx	loop_108,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001100001407,	%l0,	%l1
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
	udiv	%o0,	0x0C49,	%g2
	edge8n	%o3,	%l1,	%g5
loop_107:
	edge32ln	%l0,	%i5,	%l6
loop_108:
	bge,pt	%icc,	loop_109
	siam	0x6
	siam	0x0
	siam	0x2
loop_109:
	srax	%g1,	%i0,	%i2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x64] %asi,	%o6
	siam	0x3
	mova	%icc,	%g4,	%l2
	stx	%l5,	[%l7 + 0x68]
	smulcc	%o2,	0x1844,	%o7
	movge	%fcc2,	0x50B,	%l4
	siam	0x1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%g6
	lduw	[%l7 + 0x2C],	%i7
	alignaddrl	%g3,	%i6,	%i4
	srax	%g7,	%i3,	%o4
	siam	0x5
	siam	0x4
	tleu	%xcc,	0x0
	or	%o1,	0x04F6,	%l3
	movgu	%icc,	0x158,	%i1
	set	0x58, %i6
	stwa	%o0,	[%l7 + %i6] 0x80
	edge16	%o3,	%l1,	%g5
	bleu,a,pn	%icc,	loop_110
	movrgz	%g2,	%i5,	%l6
	sth	%l0,	[%l7 + 0x70]
	siam	0x5
loop_110:
	siam	0x6
	edge8ln	%g1,	%i0,	%i2
	fbe,a	%fcc2,	loop_111
	movrgz	%o6,	%l2,	%g4
	siam	0x1
	edge16n	%o2,	%l5,	%o7
loop_111:
	siam	0x1
	edge16n	%l4,	%g6,	%i7
	movvs	%icc,	0x493,	%o5
	and	%i6,	0x0B1C,	%g3
	siam	0x4
	movuge	%fcc0,	0x231,	%i4
	fbl,pn	%fcc2,	loop_112
loop_112:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 16
!	Type cti   	: 21
!	Type x   	: 8
!	Type f   	: 71
!	Type i   	: 84
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
	set	0x2,	%g1
	set	0x3,	%g2
	set	0x0,	%g3
	set	0x0,	%g4
	set	0x4,	%g5
	set	0x7,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xA,	%i1
	set	-0x1,	%i2
	set	-0x5,	%i3
	set	-0x5,	%i4
	set	-0xB,	%i5
	set	-0x5,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x3E86528A,	%l0
	set	0x502BDE1E,	%l1
	set	0x05082E98,	%l2
	set	0x6E5FB707,	%l3
	set	0x7658068E,	%l4
	set	0x2C6B47C6,	%l5
	set	0x423AADD5,	%l6
	!# Output registers
	set	0x0AA5,	%o0
	set	0x1131,	%o1
	set	0x0152,	%o2
	set	0x1E4A,	%o3
	set	0x1D9F,	%o4
	set	-0x0CA7,	%o5
	set	-0x080A,	%o6
	set	-0x1F4F,	%o7
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

	siam	0x2
	siam	0x6
	movo	%fcc0,	%g7,	%i3
	movleu	%icc,	%o4,	%o1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x27,	%l2
	fbo,pn	%fcc3,	loop_113
	fbge,a	%fcc1,	loop_114
	siam	0x4
	edge32ln	%i1,	%o3,	%o0
loop_113:
	nop
	set	0x7C, %o3
	stwa	%l1,	[%l7 + %o3] 0xe3
	membar	#Sync
loop_114:
	siam	0x4
	subccc	%g2,	0x1AD9,	%i5
	st	%f2,	[%l7 + 0x54]
	addccc	%l6,	0x0BEC,	%g5
	bn,a	%xcc,	loop_115
	siam	0x5
	siam	0x0
	siam	0x1
loop_115:
	bl,pt	%icc,	loop_116
	bcc,a,pn	%icc,	loop_117
	siam	0x1
	bpos	%xcc,	loop_118
loop_116:
	tvs	%xcc,	0x7
loop_117:
	nop
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x19,	%l0
loop_118:
	udiv	%g1,	0x1995,	%i0
	movue	%fcc0,	%i2,	%o6
	movule	%fcc0,	%l2,	%o2
	siam	0x5
	siam	0x2
	sra	%l5,	%o7,	%g4
	tg	%icc,	0x7
	movn	%xcc,	0x120,	%l4
	siam	0x1
	addccc	%g6,	%i7,	%i6
	alignaddrl	%o5,	%i4,	%g3
	siam	0x1
	siam	0x5
	tl	%icc,	0x6
	movul	%fcc2,	0x45A,	%g7
	nop
	set	0x78, %g7
	ldsh	[%l7 + %g7],	%o4
	siam	0x5
	siam	0x1
	movvs	%icc,	0x603,	%o1
	umulcc	%l3,	%i3,	%o3
	srl	%o0,	0x15,	%l1
	subc	%i1,	0x02E0,	%g2
	edge8l	%l6,	%i5,	%l0
	siam	0x1
	siam	0x0
	orn	%g5,	0x116C,	%g1
	tle	%xcc,	0x2
	siam	0x4
	fbul,pt	%fcc1,	loop_119
	be,a	%icc,	loop_120
	siam	0x3
	fbuge,pt	%fcc3,	loop_121
loop_119:
	ta	%icc,	0x6
loop_120:
	edge16ln	%i0,	%i2,	%l2
	siam	0x0
loop_121:
	siam	0x7
	flushw
	siam	0x3
	siam	0x6
	brlez,a	%o6,	loop_122
	movlg	%fcc1,	0x0DE,	%l5
	movrgez	%o7,	0x193,	%o2
	tleu	%icc,	0x5
loop_122:
	siam	0x2
	mulscc	%g4,	0x1AD5,	%g6
	st	%fsr,	[%l7 + 0x64]
	srax	%i7,	%l4,	%i6
	siam	0x5
	siam	0x1
	siam	0x3
	siam	0x2
	siam	0x4
	mova	%icc,	%o5,	%i4
	tge	%xcc,	0x5
	st	%f24,	[%l7 + 0x30]
	siam	0x4
	movrgez	%g3,	%g7,	%o4
	siam	0x3
	tg	%xcc,	0x1
	siam	0x0
	lduh	[%l7 + 0x5A],	%l3
	nop
	set	0x10, %i7
	ldsh	[%l7 + %i7],	%i3
	siam	0x3
	array32	%o3,	%o0,	%l1
	stbar
	movrlz	%o1,	0x074,	%i1
	tge	%xcc,	0x7
	siam	0x7
	movule	%fcc0,	0x418,	%g2
	tsubcctv	%l6,	0x0901,	%i5
	edge8n	%g5,	%l0,	%i0
	siam	0x1
	movne	%fcc2,	0x640,	%i2
	tneg	%icc,	0x1
	mova	%fcc3,	0x294,	%g1
	std	%f16,	[%l7 + 0x08]
	fbg,pt	%fcc1,	loop_123
	movrlz	%o6,	0x0AD,	%l5
	xor	%o7,	0x0457,	%o2
	siam	0x7
loop_123:
	sra	%l2,	%g4,	%i7
	wr	%g0,	0x04,	%asi
	stda	%g6,	[%l7 + 0x60] %asi
	siam	0x1
	siam	0x1
	siam	0x7
	ldx	[%l7 + 0x78],	%l4
	sll	%o5,	0x13,	%i6
	bl,pt	%xcc,	loop_124
	sethi	0x152A,	%g3
	siam	0x5
	membar	0x73
loop_124:
	edge8n	%i4,	%g7,	%o4
	umul	%l3,	%o3,	%o0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	siam	0x3
	siam	0x5
	siam	0x1
	siam	0x5
	movrlz	%l1,	0x3A9,	%o1
	brgez,a	%i3,	loop_125
	siam	0x7
	movvc	%xcc,	0x0B5,	%g2
	wr	%g0,	0x20,	%asi
	stxa	%i1,	[%g0 + 0x38] %asi
loop_125:
	siam	0x0
	siam	0x6
	movleu	%icc,	%i5,	%g5
	brgez,pt	%l6,	loop_126
	siam	0x0
	movcs	%icc,	%l0,	%i0
	sub	%g1,	%i2,	%o6
loop_126:
	siam	0x6
	siam	0x4
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%l5
	siam	0x3
	siam	0x2
	siam	0x7
	addc	%o2,	%l2,	%o7
	siam	0x6
	edge32	%i7,	%g4,	%l4
	fbge,pt	%fcc2,	loop_127
	siam	0x3
	movlg	%fcc3,	0x767,	%o5
	subc	%g6,	%g3,	%i6
loop_127:
	array32	%g7,	%o4,	%l3
	siam	0x7
	edge8ln	%o3,	%i4,	%o0
	tl	%icc,	0x7
	bcc,pn	%xcc,	loop_128
	siam	0x2
	movrlz	%l1,	%i3,	%g2
	srl	%o1,	%i1,	%g5
loop_128:
	st	%f1,	[%l7 + 0x38]
	nop
	setx	0x0671,	%l0,	%l6
	sdivcc	%i5,	%l6,	%i0
	andcc	%l0,	0x0322,	%i2
	siam	0x1
	siam	0x7
	siam	0x2
	srlx	%o6,	0x0B,	%l5
	set	0x58, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o2
	tgu	%icc,	0x7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x68, %o5
	stwa	%g1,	[%l7 + %o5] 0x2b
	membar	#Sync
	siam	0x0
	smul	%l2,	0x134C,	%i7
	udivcc	%g4,	0x1255,	%l4
	fbn,a	%fcc3,	loop_129
	siam	0x3
	bmask	%o7,	%g6,	%o5
	movleu	%icc,	%i6,	%g7
loop_129:
	siam	0x3
	movvs	%xcc,	%o4,	%l3
	tvs	%icc,	0x0
	flushw
	siam	0x3
	wr	%g0,	0x11,	%asi
	stwa	%o3,	[%l7 + 0x6C] %asi
	siam	0x2
	bne,pn	%icc,	loop_130
	subc	%i4,	0x1EFC,	%g3
	siam	0x7
	siam	0x0
loop_130:
	addcc	%l1,	0x0366,	%i3
	movcc	%xcc,	0x68D,	%o0
	siam	0x4
	siam	0x5
	movl	%xcc,	0x4C1,	%o1
	siam	0x4
	andn	%g2,	0x005F,	%i1
	siam	0x3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 19
!	Type cti   	: 18
!	Type x   	: 8
!	Type f   	: 71
!	Type i   	: 84
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
	set	0xD,	%g2
	set	0x7,	%g3
	set	0xD,	%g4
	set	0x8,	%g5
	set	0x0,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x4,	%i1
	set	-0xA,	%i2
	set	-0x1,	%i3
	set	-0x8,	%i4
	set	-0xF,	%i5
	set	-0xB,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x7B2FE57F,	%l0
	set	0x0CF95C1B,	%l1
	set	0x51EE7B71,	%l2
	set	0x72C4168E,	%l3
	set	0x1AF307F1,	%l4
	set	0x71D6C9FD,	%l5
	set	0x353A638C,	%l6
	!# Output registers
	set	0x13FC,	%o0
	set	-0x0A2A,	%o1
	set	0x077B,	%o2
	set	0x0CB9,	%o3
	set	-0x08C9,	%o4
	set	-0x1E86,	%o5
	set	0x1F31,	%o6
	set	-0x179B,	%o7
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

	siam	0x3
	siam	0x0
	array8	%g5,	%l6,	%i5
	siam	0x6
	siam	0x4
	subc	%l0,	%i2,	%o6
	siam	0x4
	siam	0x3
	siam	0x0
	siam	0x6
	udivcc	%l5,	0x00A3,	%o2
	siam	0x2
	siam	0x1
	bpos,pt	%icc,	loop_131
	movcc	%icc,	%i0,	%l2
	orcc	%i7,	0x1077,	%g4
	edge16	%g1,	%l4,	%g6
loop_131:
	nop
	setx	0x00F2,	%l0,	%i6
	udivcc	%o7,	%i6,	%g7
	tsubcctv	%o4,	0x1C35,	%o5
	bl,pn	%icc,	loop_132
	siam	0x1
	orn	%o3,	%l3,	%g3
	siam	0x6
loop_132:
	siam	0x7
	siam	0x5
	movgu	%xcc,	%l1,	%i3
	siam	0x6
	siam	0x7
	nop
	setx	loop_133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x001400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	siam	0x7
	ba,a	%xcc,	loop_134
	movl	%fcc1,	%i4,	%o0
loop_133:
	siam	0x3
	fble,pt	%fcc1,	loop_135
loop_134:
	siam	0x6
	stw	%g2,	[%l7 + 0x58]
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_135:
	bgu	%xcc,	loop_136
	xorcc	%o1,	0x04F4,	%g5
	movpos	%icc,	0x25C,	%i1
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x18,	 1
loop_136:
	alignaddrl	%l0,	%i2,	%l6
	siam	0x0
	siam	0x2
	nop
	setx	0x1E13,	%l0,	%o2
	udivcc	%l5,	%o2,	%o6
	movvc	%icc,	0x332,	%i0
	siam	0x0
	fbuge,pt	%fcc3,	loop_137
	popc	0x1F25,	%l2
	tvs	%xcc,	0x4
	xnorcc	%g4,	%g1,	%i7
loop_137:
	siam	0x3
	siam	0x1
	siam	0x6
	siam	0x3
	brlz,a,pt	%l4,	loop_138
	siam	0x0
	siam	0x1
	siam	0x2
loop_138:
	taddcctv	%g6,	0x082B,	%o7
	siam	0x3
	siam	0x4
	siam	0x6
	edge8ln	%i6,	%g7,	%o5
	siam	0x7
	siam	0x6
	siam	0x4
	sethi	0x17A5,	%o4
	te	%xcc,	0x0
	addccc	%o3,	%g3,	%l3
	siam	0x5
	siam	0x4
	siam	0x2
	movrlz	%i3,	0x140,	%i4
	siam	0x3
	xnor	%o0,	%g2,	%l1
	subcc	%g5,	0x002D,	%o1
	ld	[%l7 + 0x40],	%f29
	siam	0x6
	tsubcc	%i1,	%l0,	%i5
	nop
	setx	loop_139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031100001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%l6,	%l5,	%i2
	siam	0x5
	tsubcc	%o2,	0x13F7,	%o6
loop_139:
	andn	%l2,	0x0C2B,	%i0
	fble,a,pt	%fcc1,	loop_140
	siam	0x0
	nop
	setx loop_141, %l0, %l1
	jmpl %l1, %g4
	lduw	[%l7 + 0x7C],	%g1
loop_140:
	brlz,a	%l4,	loop_142
	siam	0x7
loop_141:
	siam	0x5
	edge16n	%i7,	%o7,	%g6
loop_142:
	movre	%i6,	%o5,	%g7
	movne	%icc,	%o4,	%g3
	nop
	set	0x2C, %o1
	swap	[%l7 + %o1],	%o3
	siam	0x3
	nop
	setx loop_143, %l0, %l1
	jmpl %l1, %i3
	siam	0x7
	edge32ln	%i4,	%l3,	%g2
	taddcc	%o0,	%l1,	%o1
loop_143:
	siam	0x1
	xorcc	%g5,	%i1,	%l0
	siam	0x3
	st	%fsr,	[%l7 + 0x14]
	edge32	%i5,	%l6,	%i2
	te	%icc,	0x7
	movrne	%o2,	%o6,	%l5
	mulscc	%l2,	%g4,	%i0
	movpos	%xcc,	%l4,	%g1
	siam	0x0
	nop
	setx	0x41B0B9AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	ld	[%l7 + 0x4C],	%f1
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x2e,	%o6
	te	%icc,	0x3
	bleu,a	%icc,	loop_144
	siam	0x5
	sllx	%g6,	%i6,	%o5
	siam	0x2
loop_144:
	tvs	%xcc,	0x2
	siam	0x5
	movpos	%xcc,	%i7,	%g7
	tcc	%xcc,	0x1
	alignaddr	%g3,	%o3,	%i3
	std	%i4,	[%l7 + 0x28]
	ld	[%l7 + 0x64],	%f23
	brlz,a,pt	%o4,	loop_145
	and	%l3,	0x11F4,	%o0
	xnorcc	%g2,	0x0B27,	%l1
	movrlez	%o1,	%g5,	%l0
loop_145:
	siam	0x0
	mova	%xcc,	0x454,	%i5
	edge8l	%l6,	%i2,	%o2
	edge8	%i1,	%l5,	%l2
	add	%g4,	0x0250,	%o6
	nop
	setx	0x0D58,	%l0,	%g1
	udivx	%i0,	%g1,	%o7
	tsubcctv	%g6,	%l4,	%i6
	xnorcc	%i7,	%g7,	%g3
	siam	0x1
	bleu	%xcc,	loop_146
	siam	0x1
	edge32n	%o3,	%o5,	%i4
	nop
	setx	0x2E0AC738,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
loop_146:
	tle	%icc,	0x0
	array32	%o4,	%i3,	%l3
	alignaddrl	%g2,	%o0,	%o1
	movrlz	%l1,	0x399,	%g5
	bvc,a,pn	%icc,	loop_147
	siam	0x2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
loop_147:
	be,a	%xcc,	loop_148
	movue	%fcc0,	0x4E1,	%l0
	fbge,a	%fcc3,	loop_149
	movleu	%xcc,	%l6,	%o2
loop_148:
	sdivcc	%i1,	0x0595,	%l5
	siam	0x5
loop_149:
	umulcc	%i2,	0x19D7,	%l2
	orncc	%o6,	%i0,	%g4
	movle	%fcc1,	0x01E,	%o7
	movvc	%xcc,	0x316,	%g1
	movpos	%icc,	%l4,	%g6
	brlez	%i6,	loop_150
	movleu	%xcc,	0x1DE,	%g7
	siam	0x0
	siam	0x6
loop_150:
	siam	0x5
	siam	0x4
	brgez,a	%g3,	loop_151
	siam	0x0
	siam	0x4
	siam	0x7
loop_151:
	siam	0x6
	tvs	%xcc,	0x2
	srax	%o3,	0x1C,	%i7
	siam	0x6
	brnz,pt	%o5,	loop_152
	movle	%xcc,	%i4,	%o4
	siam	0x5
	addccc	%i3,	0x1854,	%g2
loop_152:
	fbule	%fcc1,	loop_153
	siam	0x4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_153:
	andn	%o0,	0x170C,	%o1
	siam	0x7
	movre	%l3,	0x075,	%g5
	tneg	%icc,	0x2
	siam	0x2
	tge	%icc,	0x0
	movug	%fcc0,	0x299,	%l1
	tgu	%icc,	0x6
	mova	%xcc,	0x48B,	%i5
	edge8	%l6,	%l0,	%o2
	movo	%fcc0,	%i1,	%l5
	srax	%l2,	%i2,	%o6
	tn	%icc,	0x5
	bl,a	%icc,	loop_154
loop_154:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 14
!	Type x   	: 4
!	Type cti   	: 24
!	Type f   	: 70
!	Type i   	: 88
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x9549A190
.word 0xA7F50A25
.word 0x139F6605
.word 0xFEDD69CF
.word 0x7437294E
.word 0x2FD2AA43
.word 0x83750DE4
.word 0x25BE83F3
.word 0x1811E0DE
.word 0xDC49C7DE
.word 0x9CC6E755
.word 0x51A17BBA
.word 0xAD1D0C52
.word 0x0B7F69E4
.word 0xF6E8B32C
.word 0x9323E262
.word 0xFB395369
.word 0xBD9D00A9
.word 0x69F6F298
.word 0x0A5EC3BD
.word 0x77C72659
.word 0x08CDECDD
.word 0x6E50B9F0
.word 0x981ED681
.word 0x87BC0742
.word 0x5B5B3C2C
.word 0xCB537FDD
.word 0x42AA77DC
.word 0x48FDE722
.word 0xC72C2223
.word 0x457332ED
.word 0x87F485AD
.word 0x8E0C8AEE
.word 0xD7EE5DB2
.word 0x3AF0FBE5
.word 0x7E3AD9A4
.word 0x37018EFE
.word 0xE2899ED9
.word 0x0B2CEC72
.word 0x99700961
.word 0xB3D0CEA7
.word 0x6C324F6D
.word 0x02BD9086
.word 0x6EF8AFE1
.word 0x6286DDFC
.word 0x7128EDA5
.word 0x66BCC183
.word 0x60A88FFE
.word 0x342607FD
.word 0x8957CF11
.word 0x3834451C
.word 0xACAE942E
.word 0xC8807BCB
.word 0x5C2CE788
.word 0xCD1874B6
.word 0xAE756617
.word 0x29539634
.word 0x8EFEA2D2
.word 0x5C166293
.word 0xD75F031C
.word 0xCB338818
.word 0x823C7006
.word 0xD29A690A
.word 0xF9495767
.end
