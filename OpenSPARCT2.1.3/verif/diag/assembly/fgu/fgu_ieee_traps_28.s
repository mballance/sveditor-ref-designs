/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_28.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=9012411"
.ident "Mon Dec  8 19:58:26 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_28.s,v 1.4 2007/07/27 21:45:32 drp Exp $"
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
	set	0xE,	%g2
	set	0x0,	%g3
	set	0x8,	%g4
	set	0x1,	%g5
	set	0x8,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xC,	%i1
	set	-0x6,	%i2
	set	-0x6,	%i3
	set	-0x4,	%i4
	set	-0xE,	%i5
	set	-0xC,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x107E6E3A,	%l0
	set	0x26A7F856,	%l1
	set	0x64FC94ED,	%l2
	set	0x3D166723,	%l3
	set	0x4C1149EB,	%l4
	set	0x4C1DD22F,	%l5
	set	0x04E426D0,	%l6
	!# Output registers
	set	0x0C42,	%o0
	set	0x151B,	%o1
	set	-0x159C,	%o2
	set	0x124E,	%o3
	set	-0x0AD9,	%o4
	set	0x1944,	%o5
	set	-0x1E4E,	%o6
	set	-0x1CEF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	bge	%xcc,	loop_1
	nop
	setx	0x7803D21B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x86D23434,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f31,	%f17
	fmovrde	%i3,	%f14,	%f16
	call	loop_2
loop_1:
	nop
	set	0x2C, %l1
	ldsw	[%l7 + %l1],	%i2
	nop
	setx	0xCFBD63CA01E94DA9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x76378EE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f30,	%f8
	xnor	%o5,	%i5,	%l3
loop_2:
	fmovda	%icc,	%f26,	%f22
	fpadd16s	%f14,	%f28,	%f25
	call	loop_3
	fmovdlg	%fcc3,	%f26,	%f28
	movul	%fcc3,	0x51F,	%o6
	call	loop_4
loop_3:
	fand	%f18,	%f20,	%f24
	movrgz	%i7,	%g6,	%g1
	umulcc	%l6,	0x0CCE,	%g7
loop_4:
	call	loop_5
	call	loop_6
	st	%fsr,	[%l7 + 0x74]
	call	loop_7
loop_5:
	sir	0x0727
loop_6:
	movcc	%icc,	%g5,	%o2
	lduh	[%l7 + 0x78],	%i0
loop_7:
	call	loop_8
	call	loop_9
	rdhpr	%ver,	%o3
	umulcc	%l5,	%l0,	%i1
loop_8:
	movrlez	%i6,	%o4,	%l2
loop_9:
	rdpr	%wstate,	%g2
	sll	%o0,	0x0F,	%i4
	nop
	setx	0x8C1D95C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f27
	fmovsul	%fcc1,	%f23,	%f13
	nop
	set	0x4F, %i5
	ldsb	[%l7 + %i5],	%l4
	pdist	%f28,	%f20,	%f22
	sdivx	%g3,	0x18F5,	%g4
	fmovduge	%fcc0,	%f26,	%f4
	bshuffle	%f24,	%f26,	%f18
	call	loop_10
	call	loop_11
	call	loop_12
	fmovsge	%fcc2,	%f17,	%f5
loop_10:
	call	loop_13
loop_11:
	fmovda	%icc,	%f6,	%f6
loop_12:
	movne	%xcc,	0x581,	%l1
	rdhpr	%hsys_tick_cmpr,	%o7
loop_13:
	subcc	%i3,	%o1,	%o5
	faligndata	%f0,	%f26,	%f20
	nop
	setx	0x1441,	%l0,	%i5
	sdiv	%i2,	%i5,	%o6
	call	loop_14
	fnot1s	%f4,	%f20
	nop
	setx	0xBFEFFE555D102FF6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f28
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%l2
loop_14:
	rdpr	%tba,	%i7
	fmovdue	%fcc0,	%f4,	%f2
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f2
	call	loop_15
	movlg	%fcc3,	0x079,	%g6
	edge8n	%l6,	%g1,	%g5
	ta	%xcc,	0x5
loop_15:
	fbug,a	%fcc1,	loop_16
	edge8	%g7,	%o2,	%o3
	movvc	%icc,	%i0,	%l0
	fmovdlg	%fcc2,	%f18,	%f28
loop_16:
	fmovdle	%fcc0,	%f30,	%f12
	call	loop_17
	sllx	%l5,	%i1,	%i6
	call	loop_18
	andncc	%o4,	%g2,	%o0
loop_17:
	call	loop_19
	fmovda	%fcc1,	%f4,	%f12
loop_18:
	call	loop_20
	nop
	fitos	%f14,	%f20
loop_19:
	sdiv	%l2,	0x0F12,	%l4
	call	loop_21
loop_20:
	call	loop_22
	call	loop_23
	call	loop_24
loop_21:
	fcmpne16	%f12,	%f12,	%i4
loop_22:
	fmovscc	%icc,	%f27,	%f17
loop_23:
	umul	%g3,	0x024E,	%l1
loop_24:
	movuge	%fcc0,	%o7,	%g4
	movl	%fcc1,	%i3,	%o1
	movcs	%icc,	0x579,	%o5
	call	loop_25
	fmul8x16al	%f5,	%f21,	%f8
	rd	%asi,	%i2
	call	loop_26
loop_25:
	fmovsl	%fcc1,	%f14,	%f3
	movcc	%xcc,	0x47E,	%i5
	array16	%o6,	%l3,	%i7
loop_26:
	call	loop_27
	movuge	%fcc2,	%l6,	%g1
	call	loop_28
	fcmpeq32	%f22,	%f8,	%g6
loop_27:
	fpadd32	%f18,	%f6,	%f30
	add	%g5,	%o2,	%g7
loop_28:
	fmovdul	%fcc3,	%f20,	%f14
	fmovscc	%icc,	%f22,	%f10
	movule	%fcc3,	0x72D,	%o3
	fmovrse	%i0,	%f5,	%f29
	ld	[%l7 + 0x44],	%f17
	call	loop_29
	call	loop_30
	fmovdu	%fcc2,	%f10,	%f18
	fnors	%f8,	%f29,	%f14
loop_29:
	fbule	%fcc2,	loop_31
loop_30:
	fmovd	%f30,	%f0
	subcc	%l0,	0x038A,	%l5
	fand	%f16,	%f10,	%f16
loop_31:
	rdhpr	%hsys_tick_cmpr,	%i6
	andcc	%i1,	0x0D9F,	%g2
	fmovdul	%fcc1,	%f22,	%f24
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o0
	fsrc1	%f28,	%f24
	call	loop_32
	call	loop_33
	fmovs	%f12,	%f8
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f16
loop_32:
	for	%f8,	%f6,	%f30
loop_33:
	call	loop_34
	rd	%sys_tick_cmpr,	%o4
	fmovrdgz	%l4,	%f26,	%f28
	sdivx	%i4,	0x1E23,	%g3
loop_34:
	fcmped	%fcc2,	%f4,	%f30
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%l2
	call	loop_35
	subc	%l1,	%g4,	%i3
	edge32l	%o1,	%o7,	%o5
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x04,	 3
loop_35:
	fmovdue	%fcc3,	%f4,	%f18
	call	loop_36
	fnot2	%f2,	%f18
	call	loop_37
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f14
loop_36:
	stbar
	fba,a,pn	%fcc3,	loop_38
loop_37:
	call	loop_39
	nop
	setx	0x933E04E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9EBA1023,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f11,	%f25
	fornot2	%f16,	%f18,	%f30
loop_38:
	fmovdl	%fcc2,	%f12,	%f16
loop_39:
	movrlz	%i2,	0x14C,	%o6
	nop
	fitos	%f11,	%f13
	fstox	%f13,	%f30
	fxtos	%f30,	%f31
	movo	%fcc2,	0x28E,	%i7
	wr	%g0,	0x0c,	%asi
	sta	%f19,	[%l7 + 0x10] %asi
	movleu	%icc,	0x5F1,	%l6
	rd	%fprs,	%g1
	call	loop_40
	wr	%g6,	0x1004,	%clear_softint
	tg	%icc,	0x2
	call	loop_41
loop_40:
	bn,a	%icc,	loop_42
	fmuld8sux16	%f5,	%f3,	%f28
	or	%l3,	%g5,	%o2
loop_41:
	fsrc1s	%f27,	%f14
loop_42:
	fble,a,pt	%fcc0,	loop_43
	fmovsn	%xcc,	%f2,	%f16
	and	%g7,	%o3,	%i0
	fmovsne	%xcc,	%f16,	%f12
loop_43:
	fcmple16	%f22,	%f14,	%l0
	call	loop_44
	fmovsue	%fcc0,	%f6,	%f28
	fzeros	%f22
	fpadd16s	%f0,	%f24,	%f3
loop_44:
	fmovd	%f6,	%f4
	call	loop_45
	sethi	0x0ED9,	%l5
	fpadd16	%f16,	%f20,	%f14
	call	loop_46
loop_45:
	te	%icc,	0x7
	movuge	%fcc0,	%i6,	%g2
	xor	%o0,	0x1241,	%i1
loop_46:
	nop
	set	0x32, %o7
	lduh	[%l7 + %o7],	%o4
	call	loop_47
	fmovso	%fcc0,	%f27,	%f27
	mulscc	%i4,	0x090B,	%g3
	call	loop_48
loop_47:
	fmovsvc	%xcc,	%f6,	%f19
	call	loop_49
	flush	%l7 + 0x10
loop_48:
	or	%l4,	0x054D,	%l2
	pdist	%f24,	%f12,	%f0
loop_49:
	ldx	[%l7 + 0x18],	%g4
	fmovdg	%xcc,	%f22,	%f6
	fnor	%f14,	%f18,	%f4
	array8	%i3,	%l1,	%o7
	xnor	%o5,	0x1C59,	%i5
	fmuld8ulx16	%f14,	%f21,	%f20
	brnz	%i2,	loop_50
	call	loop_51
	tpos	%xcc,	0x1
	call	loop_52
loop_50:
	nop
	setx	0xE47AC1D42C57AD95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f24
loop_51:
	fmovdul	%fcc1,	%f16,	%f10
	fxnor	%f30,	%f14,	%f0
loop_52:
	fmovsg	%icc,	%f23,	%f24
	call	loop_53
	tcc	%icc,	0x2
loop_53:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 16
!	Type a   	: 9
!	Type x   	: 3
!	Type cti   	: 53
!	Type f   	: 68
!	Type i   	: 51
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
	set	0x4,	%g1
	set	0x3,	%g2
	set	0x6,	%g3
	set	0xF,	%g4
	set	0xE,	%g5
	set	0x3,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xC,	%i1
	set	-0x5,	%i2
	set	-0xA,	%i3
	set	-0x4,	%i4
	set	-0x5,	%i5
	set	-0xA,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x5463AD1C,	%l0
	set	0x2F6CE6A2,	%l1
	set	0x4CD27772,	%l2
	set	0x2E6F1DD6,	%l3
	set	0x73ABE07B,	%l4
	set	0x0D046374,	%l5
	set	0x6A249113,	%l6
	!# Output registers
	set	-0x195C,	%o0
	set	-0x119F,	%o1
	set	0x102C,	%o2
	set	0x1464,	%o3
	set	0x0749,	%o4
	set	-0x053A,	%o5
	set	0x0056,	%o6
	set	-0x0965,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	nop
	fitod	%f10,	%f20
	fdtox	%f20,	%f28
	bn,pt	%icc,	loop_54
	brgz	%o6,	loop_55
	fmovso	%fcc1,	%f26,	%f11
	call	loop_56
loop_54:
	tvs	%xcc,	0x1
loop_55:
	wr	%o1,	0x1463,	%sys_tick
	call	loop_57
loop_56:
	call	loop_58
	alignaddrl	%l6,	%i7,	%g6
	bn,pt	%xcc,	loop_59
loop_57:
	fpsub16	%f14,	%f26,	%f24
loop_58:
	andncc	%g1,	%l3,	%o2
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%g4
loop_59:
	tl	%icc,	0x3
	alignaddrl	%g7,	%o3,	%i0
	nop
	set	0x30, %i1
	sth	%l0,	[%l7 + %i1]
	call	loop_60
	call	loop_61
	fmovs	%f23,	%f18
	popc	%i6,	%g2
loop_60:
	nop
	setx loop_62, %l0, %l1
	jmpl %l1, %l5
loop_61:
	call	loop_63
	movneg	%xcc,	%o0,	%i1
	taddcc	%i4,	%o4,	%g3
loop_62:
	call	loop_64
loop_63:
	nop
	setx	loop_65,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011200001400,	%l0,	%l1
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
	fmovdcc	%icc,	%f2,	%f6
	nop
	fitos	%f12,	%f13
	fstod	%f13,	%f16
loop_64:
	nop
	setx	0x0A29,	%l0,	%l4
	sdivx	%l2,	%l4,	%i3
loop_65:
	ta	%xcc,	0x5
	call	loop_66
	movu	%fcc3,	%l1,	%o7
	movre	%o5,	%g4,	%i5
	call	loop_67
loop_66:
	call	loop_68
	call	loop_69
	edge32n	%i2,	%o1,	%o6
loop_67:
	orcc	%l6,	%g6,	%g1
loop_68:
	call	loop_70
loop_69:
	nop
	setx	loop_71,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024200001406,	%l0,	%l1
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
	tle	%icc,	0x6
	call	loop_72
loop_70:
	nop
	setx	0x16D38CB0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f2
loop_71:
	call	loop_73
	call	loop_74
loop_72:
	xnorcc	%i7,	%l3,	%o2
	nop
	setx	0xAECDC8D008716143,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8C7EAAD726898810,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f6,	%f28
loop_73:
	for	%f26,	%f20,	%f8
loop_74:
	bpos,a	%icc,	loop_75
	fnors	%f9,	%f28,	%f2
	fmovsneg	%icc,	%f20,	%f30
	edge32l	%g7,	%o3,	%i0
loop_75:
	fmul8x16au	%f23,	%f16,	%f8
	fpsub16s	%f26,	%f6,	%f1
	fmovdvs	%xcc,	%f12,	%f22
	tge	%xcc,	0x1
	call	loop_76
	fmovrdgz	%g5,	%f2,	%f24
	tvs	%xcc,	0x4
	fmovdne	%fcc2,	%f4,	%f12
loop_76:
	call	loop_77
	call	loop_78
	popc	0x0354,	%l0
	nop
	setx	0x0E7E,	%l0,	%l5
	udiv	%i6,	%l5,	%o0
loop_77:
	fmovrse	%i1,	%f21,	%f16
loop_78:
	nop
	setx	0xA695F7890FE7224E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbuge,pt	%fcc0,	loop_79
	fcmpne16	%f12,	%f28,	%g2
	sub	%i4,	0x0813,	%g3
	call	loop_80
loop_79:
	call	loop_81
	call	loop_82
	call	loop_83
loop_80:
	ta	%icc,	0x5
loop_81:
	fnot1	%f22,	%f28
loop_82:
	fmovsne	%fcc3,	%f26,	%f12
loop_83:
	orn	%l2,	%o4,	%l4
	movleu	%icc,	0x6C2,	%i3
	movge	%xcc,	%o7,	%l1
	call	loop_84
	nop
	set	0x1A, %l4
	sth	%o5,	[%l7 + %l4]
	rd	%pc,	%i5
	fmovsue	%fcc1,	%f1,	%f12
loop_84:
	bl,a	%xcc,	loop_85
	call	loop_86
	edge32l	%i2,	%o1,	%o6
	rd	%pc,	%g4
loop_85:
	fsrc2	%f10,	%f4
loop_86:
	membar	0x0E
	fmovspos	%xcc,	%f29,	%f31
	fmovsul	%fcc1,	%f7,	%f4
	fmovsleu	%icc,	%f28,	%f7
	set	0x70, %i3
	stha	%l6,	[%l7 + %i3] 0x2f
	membar	#Sync
	tl	%xcc,	0x6
	movvs	%xcc,	%g6,	%i7
	call	loop_87
	call	loop_88
	call	loop_89
	stbar
loop_87:
	call	loop_90
loop_88:
	tsubcctv	%l3,	0x1ABD,	%o2
loop_89:
	call	loop_91
	call	loop_92
loop_90:
	call	loop_93
	taddcctv	%g1,	%g7,	%i0
loop_91:
	fcmpgt32	%f6,	%f6,	%o3
loop_92:
	call	loop_94
loop_93:
	nop
	fitod	%f4,	%f24
	fdtox	%f24,	%f4
	fmovrsne	%l0,	%f7,	%f26
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i6
loop_94:
	call	loop_95
	movcc	%icc,	0x70B,	%l5
	tcc	%icc,	0x1
	call	loop_96
loop_95:
	ble,a,pt	%icc,	loop_97
	movn	%xcc,	0x416,	%o0
	fornot2	%f0,	%f8,	%f0
loop_96:
	call	loop_98
loop_97:
	fsrc1s	%f30,	%f6
	fmul8x16	%f3,	%f14,	%f4
	movug	%fcc3,	%i1,	%g2
loop_98:
	call	loop_99
	call	loop_100
	nop
	set	0x18, %g1
	ldsw	[%l7 + %g1],	%g5
	call	loop_101
loop_99:
	fsrc2	%f0,	%f30
loop_100:
	call	loop_102
	call	loop_103
loop_101:
	call	loop_104
	fsrc2s	%f22,	%f26
loop_102:
	for	%f4,	%f18,	%f8
loop_103:
	fmovdvs	%icc,	%f28,	%f12
loop_104:
	faligndata	%f30,	%f30,	%f22
	movcc	%icc,	0x428,	%i4
	call	loop_105
	bshuffle	%f30,	%f4,	%f22
	fcmpne16	%f16,	%f22,	%g3
	brgez	%o4,	loop_106
loop_105:
	movre	%l4,	0x1E7,	%l2
	bleu	%xcc,	loop_107
	fmovdule	%fcc3,	%f24,	%f14
loop_106:
	call	loop_108
	umulcc	%o7,	0x15B5,	%i3
loop_107:
	fmovdvs	%xcc,	%f12,	%f30
	rdhpr	%hsys_tick_cmpr,	%o5
loop_108:
	call	loop_109
	wr	%i5,	%l1,	%y
	edge16l	%i2,	%o6,	%o1
	wrpr	%l6,	%g6,	%tick
loop_109:
	call	loop_110
	nop
	fitos	%f13,	%f3
	fstoi	%f3,	%f11
	set	0x20, %l5
	sta	%f29,	[%l7 + %l5] 0x04
loop_110:
	nop
	setx loop_111, %l0, %l1
	jmpl %l1, %g4
	brnz	%i7,	loop_112
	fmul8x16au	%f13,	%f18,	%f24
	call	loop_113
loop_111:
	wrpr 	%g0, 	0x3, 	%gl
loop_112:
	call	loop_114
	movn	%fcc0,	0x376,	%g1
loop_113:
	call	loop_115
	tne	%xcc,	0x2
loop_114:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	andn	%g7,	%i0,	%l3
loop_115:
	call	loop_116
	fmovrsgez	%l0,	%f1,	%f0
	call	loop_117
	edge8	%i6,	%l5,	%o0
loop_116:
	srlx	%o3,	%i1,	%g5
	call	loop_118
loop_117:
	fbule,a,pn	%fcc2,	loop_119
	stbar
	fmovrsgz	%g2,	%f1,	%f13
loop_118:
	call	loop_120
loop_119:
	call	loop_121
	call	loop_122
	fmovrsgez	%i4,	%f8,	%f14
loop_120:
	call	loop_123
loop_121:
	fmovrdgez	%o4,	%f0,	%f8
loop_122:
	tsubcc	%l4,	%g3,	%l2
	fmovsge	%fcc2,	%f18,	%f2
loop_123:
	fandnot2s	%f11,	%f20,	%f16
	subccc	%o7,	%o5,	%i5
	mova	%xcc,	%i3,	%l1
	call	loop_124
	rdpr	%wstate,	%i2
	andcc	%o1,	%o6,	%g6
	fmovdu	%fcc2,	%f8,	%f6
loop_124:
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 1
	call	loop_125
	fmovde	%icc,	%f0,	%f6
	nop
	fitos	%f2,	%f9
	fstox	%f9,	%f10
	fmovrdlz	%g4,	%f12,	%f22
loop_125:
	fmovspos	%xcc,	%f5,	%f12
	orncc	%i7,	0x08C1,	%o2
	call	loop_126
	fmovda	%icc,	%f22,	%f18
loop_126:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 11
!	Type a   	: 8
!	Type x   	: 3
!	Type cti   	: 73
!	Type f   	: 54
!	Type i   	: 51
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
	set	0x8,	%g1
	set	0xC,	%g2
	set	0x9,	%g3
	set	0x2,	%g4
	set	0x3,	%g5
	set	0xE,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x8,	%i1
	set	-0x9,	%i2
	set	-0xD,	%i3
	set	-0x6,	%i4
	set	-0x8,	%i5
	set	-0xE,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x65AE7B10,	%l0
	set	0x090BF18A,	%l1
	set	0x697987A8,	%l2
	set	0x1B91A4F2,	%l3
	set	0x14F6DC2D,	%l4
	set	0x48435157,	%l5
	set	0x7D3DC2C4,	%l6
	!# Output registers
	set	-0x126F,	%o0
	set	-0x0071,	%o1
	set	-0x170A,	%o2
	set	0x00F2,	%o3
	set	-0x048C,	%o4
	set	0x0B8D,	%o5
	set	-0x19BB,	%o6
	set	-0x0489,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	fands	%f18,	%f12,	%f13
	edge16	%g1,	%g7,	%i0
	call	loop_127
	fpackfix	%f18,	%f0
	fmovdvs	%xcc,	%f28,	%f26
	call	loop_128
loop_127:
	rd	%asi,	%l3
	fmovsne	%icc,	%f18,	%f7
	call	loop_129
loop_128:
	bneg,a,pt	%xcc,	loop_130
	fand	%f4,	%f10,	%f26
	subcc	%l0,	0x0705,	%l6
loop_129:
	fone	%f30
loop_130:
	nop
	fitod	%f4,	%f30
	fdtos	%f30,	%f15
	nop
	setx	0xB437392AAF610C52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xECAD77BB88D889E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f30,	%f26
	tneg	%icc,	0x5
	fxnors	%f21,	%f12,	%f13
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f28
	membar	0x2F
	fmul8x16al	%f1,	%f2,	%f12
	popc	0x050E,	%l5
	fmul8sux16	%f14,	%f6,	%f12
	wr	%g0,	0x27,	%asi
	stda	%o0,	[%l7 + 0x60] %asi
	membar	#Sync
	movrlez	%i6,	%o3,	%g5
	call	loop_131
	fmovspos	%xcc,	%f10,	%f4
	fmovdue	%fcc2,	%f12,	%f28
	fmovsn	%fcc3,	%f2,	%f7
loop_131:
	fcmpes	%fcc1,	%f26,	%f15
	tl	%xcc,	0x3
	fmovdneg	%xcc,	%f4,	%f30
	smul	%i1,	0x07E3,	%i4
	fmovrde	%g2,	%f6,	%f14
	fpadd16s	%f29,	%f31,	%f10
	call	loop_132
	call	loop_133
	rd	%softint,	%o4
	fmovdo	%fcc1,	%f26,	%f0
loop_132:
	srl	%l4,	0x08,	%l2
loop_133:
	rdpr	%tl,	%g3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x24] %asi,	%o7
	set	0x76, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i5
	xor	%o5,	%i3,	%l1
	tcs	%xcc,	0x6
	movl	%icc,	%i2,	%o6
	movu	%fcc1,	0x514,	%o1
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f16
	faligndata	%f24,	%f16,	%f4
	nop
	setx	0x1417,	%l0,	%i7
	udiv	%g4,	%i7,	%o2
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f6
	call	loop_134
	ldsh	[%l7 + 0x74],	%g6
	nop
	setx	0xA07DC7C5A0D73EF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8FB4BB10B02D49BD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f18,	%f22
	add	%g7,	%i0,	%g1
loop_134:
	fmovsug	%fcc2,	%f15,	%f23
	fbl,a,pt	%fcc2,	loop_135
	fmovrslz	%l0,	%f9,	%f26
	set	0x2C, %g6
	stwa	%l6,	[%l7 + %g6] 0xea
	membar	#Sync
loop_135:
	fcmpes	%fcc1,	%f30,	%f10
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_136
	brnz	%l5,	loop_137
	movne	%icc,	%l3,	%i6
	ldx	[%l7 + 0x18],	%o3
loop_136:
	movu	%fcc3,	0x578,	%o0
loop_137:
	nop
	setx	0x1911,	%l0,	%i4
	sdivx	%g5,	%i4,	%g2
	fmovdneg	%icc,	%f2,	%f22
	bvs,a	%icc,	loop_138
	andcc	%o4,	0x00D7,	%i1
	fpmerge	%f17,	%f31,	%f18
	fmovrdgez	%l2,	%f20,	%f12
loop_138:
	sll	%g3,	0x15,	%o7
	call	loop_139
	fmovdcc	%icc,	%f0,	%f8
	fornot2	%f22,	%f24,	%f8
	tpos	%xcc,	0x1
loop_139:
	call	loop_140
	wrpr	%i5,	%l4,	%pil
	sdivcc	%i3,	0x0663,	%l1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd2
loop_140:
	fmovduge	%fcc0,	%f28,	%f28
	fmovsu	%fcc0,	%f15,	%f16
	call	loop_141
	call	loop_142
	bvs,pn	%icc,	loop_143
	nop
	fitos	%f5,	%f24
	fstoi	%f24,	%f20
loop_141:
	wr	%i2,	%o6,	%clear_softint
loop_142:
	fsrc1	%f24,	%f8
loop_143:
	fcmpd	%fcc0,	%f16,	%f4
	call	loop_144
	fmovdvc	%icc,	%f2,	%f30
	faligndata	%f16,	%f0,	%f14
	movrgez	%o1,	0x013,	%g4
loop_144:
	nop
	set	0x39, %i0
	ldsb	[%l7 + %i0],	%i7
	ta	%icc,	0x6
	fors	%f12,	%f26,	%f12
	tgu	%xcc,	0x1
	movn	%fcc1,	%o5,	%o2
	fmovde	%xcc,	%f0,	%f6
	brgz	%g7,	loop_145
	move	%fcc3,	%i0,	%g6
	call	loop_146
	xnorcc	%g1,	%l6,	%l5
loop_145:
	fmovrdlz	%l0,	%f28,	%f20
	call	loop_147
loop_146:
	movgu	%xcc,	%i6,	%l3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_147:
	nop
	setx	0xFC230525,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xB4FDD8EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f31,	%f13
	alignaddr	%o3,	%o0,	%i4
	movvs	%icc,	0x2A9,	%g2
	movn	%fcc1,	%o4,	%i1
	fnot1s	%f31,	%f3
	wrpr	%g5,	0x1004,	%pil
	array8	%g3,	%l2,	%o7
	call	loop_148
	ta	%xcc,	0x7
	call	loop_149
	fmovrdgz	%i5,	%f2,	%f6
loop_148:
	fbo,pn	%fcc1,	loop_150
	call	loop_151
loop_149:
	call	loop_152
	call	loop_153
loop_150:
	subcc	%l4,	%l1,	%i2
loop_151:
	nop
	set	0x08, %i7
	stx	%i3,	[%l7 + %i7]
loop_152:
	call	loop_154
loop_153:
	nop
	fitos	%f11,	%f11
	fstox	%f11,	%f28
	fpsub16	%f24,	%f4,	%f28
	array32	%o6,	%o1,	%g4
loop_154:
	fpadd32s	%f27,	%f27,	%f1
	nop
	setx	0x80B7A4538B8C1886,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fand	%f16,	%f10,	%f22
	fsrc1	%f12,	%f14
	nop
	set	0x18, %l3
	sth	%i7,	[%l7 + %l3]
	siam	0x3
	fnot2s	%f4,	%f24
	tl	%icc,	0x2
	wrpr	%o2,	0x1400,	%tick
	fbn,pt	%fcc2,	loop_155
	call	loop_156
	movrgz	%o5,	0x259,	%g7
	orn	%i0,	0x1B09,	%g6
loop_155:
	fnands	%f24,	%f13,	%f4
loop_156:
	call	loop_157
	movue	%fcc0,	0x2AD,	%l6
	fexpand	%f14,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3FE, 	%hsys_tick_cmpr
loop_157:
	fnot1	%f22,	%f6
	call	loop_158
	movcs	%xcc,	0x6F5,	%i6
	call	loop_159
	call	loop_160
loop_158:
	call	loop_161
	call	loop_162
loop_159:
	fabss	%f23,	%f25
loop_160:
	movlg	%fcc3,	0x562,	%l3
loop_161:
	edge32n	%l0,	%o0,	%i4
loop_162:
	call	loop_163
	edge16	%g2,	%o4,	%o3
	call	loop_164
	nop
	setx	0x040C,	%l0,	%g5
	udivcc	%i1,	%g5,	%l2
loop_163:
	fmovdcs	%xcc,	%f6,	%f20
	subccc	%o7,	0x151B,	%i5
loop_164:
	bcc,a,pt	%xcc,	loop_165
	movue	%fcc0,	0x31E,	%g3
	fxnor	%f0,	%f20,	%f6
	fmul8ulx16	%f20,	%f30,	%f18
loop_165:
	fpackfix	%f10,	%f25
	fnot2	%f26,	%f16
	rd	%tick_cmpr,	%l1
	call	loop_166
	orcc	%i2,	%l4,	%o6
	call	loop_167
	fsrc2	%f20,	%f18
loop_166:
	fpsub16	%f30,	%f18,	%f12
	fmul8ulx16	%f2,	%f8,	%f2
loop_167:
	tneg	%icc,	0x5
	fmovse	%icc,	%f19,	%f22
	edge8n	%o1,	%i3,	%i7
	movvc	%icc,	%o2,	%g4
	fmul8x16au	%f13,	%f1,	%f20
	fsrc2s	%f0,	%f23
	rdhpr	%hpstate,	%g7
	fmovdl	%fcc1,	%f10,	%f4
	call	loop_168
	bpos	%xcc,	loop_169
	fsrc2s	%f23,	%f16
	fpmerge	%f0,	%f19,	%f12
loop_168:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x69C, 	%sys_tick_cmpr
loop_169:
	alignaddrl	%o5,	%l5,	%g1
	nop
	fitos	%f0,	%f31
	fstod	%f31,	%f30
	fmovrsgz	%l6,	%f20,	%f23
	fmovsa	%icc,	%f28,	%f0
	movug	%fcc1,	%l3,	%i6
	rd	%pc,	%o0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 12
!	Type a   	: 12
!	Type x   	: 6
!	Type cti   	: 43
!	Type f   	: 73
!	Type i   	: 54
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
	set	0x7,	%g2
	set	0x2,	%g3
	set	0x6,	%g4
	set	0x1,	%g5
	set	0xC,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x1,	%i1
	set	-0x4,	%i2
	set	-0x0,	%i3
	set	-0xA,	%i4
	set	-0x5,	%i5
	set	-0xD,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x497DD69D,	%l0
	set	0x2B74CB58,	%l1
	set	0x386EF758,	%l2
	set	0x107FA2C7,	%l3
	set	0x732ECE4A,	%l4
	set	0x0DDAB64C,	%l5
	set	0x2D0EA7D0,	%l6
	!# Output registers
	set	0x1008,	%o0
	set	-0x174D,	%o1
	set	0x0454,	%o2
	set	0x1603,	%o3
	set	-0x1643,	%o4
	set	-0x18A0,	%o5
	set	0x1901,	%o6
	set	-0x06A4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	sir	0x13B9
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f24
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xca
	popc	%i4,	%l0
	call	loop_170
	call	loop_171
	tvs	%icc,	0x7
	call	loop_172
loop_170:
	fornot1	%f6,	%f18,	%f24
loop_171:
	addc	%g2,	0x04B1,	%o3
	fmovsul	%fcc2,	%f24,	%f11
loop_172:
	call	loop_173
	call	loop_174
	subc	%o4,	%g5,	%i1
	stx	%fsr,	[%l7 + 0x78]
loop_173:
	fmovrsgez	%o7,	%f25,	%f24
loop_174:
	edge8n	%i5,	%g3,	%l1
	fmovsle	%xcc,	%f16,	%f24
	movu	%fcc1,	0x45C,	%l2
	nop
	setx	0x32F81419,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x11F89CD2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f10,	%f31
	edge32ln	%i2,	%o6,	%o1
	call	loop_175
	smulcc	%i3,	0x017C,	%i7
	tvc	%icc,	0x7
	fmovspos	%icc,	%f21,	%f30
loop_175:
	call	loop_176
	wrpr	%l4,	0x1C82,	%tick
	stx	%o2,	[%l7 + 0x48]
	call	loop_177
loop_176:
	call	loop_178
	fmovrsgez	%g7,	%f1,	%f26
	movule	%fcc2,	0x12A,	%g4
loop_177:
	tvc	%xcc,	0x1
loop_178:
	fmovdvs	%xcc,	%f6,	%f18
	orn	%i0,	%o5,	%l5
	fmovdu	%fcc1,	%f8,	%f12
	subcc	%g1,	%l6,	%g6
	fmovdleu	%xcc,	%f20,	%f18
	call	loop_179
	call	loop_180
	call	loop_181
	fxnors	%f9,	%f2,	%f29
loop_179:
	call	loop_182
loop_180:
	fabsd	%f4,	%f26
loop_181:
	fmovdne	%icc,	%f26,	%f8
	edge8n	%i6,	%o0,	%l3
loop_182:
	call	loop_183
	fsrc2	%f12,	%f20
	ldx	[%l7 + 0x50],	%i4
	call	loop_184
loop_183:
	tg	%icc,	0x0
	fmul8x16al	%f4,	%f20,	%f28
	movuge	%fcc3,	%l0,	%g2
loop_184:
	call	loop_185
	movre	%o3,	%o4,	%g5
	nop
	setx	0x2D93B675,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	call	loop_186
loop_185:
	call	loop_187
	st	%fsr,	[%l7 + 0x64]
	call	loop_188
loop_186:
	srlx	%i1,	0x1D,	%o7
loop_187:
	rd	%ccr,	%g3
	call	loop_189
loop_188:
	call	loop_190
	fmovdneg	%icc,	%f12,	%f6
	alignaddr	%i5,	%l1,	%i2
loop_189:
	fbn	%fcc2,	loop_191
loop_190:
	fcmpgt16	%f26,	%f20,	%l2
	rd	%fprs,	%o6
	fnot2s	%f19,	%f1
loop_191:
	fmul8ulx16	%f22,	%f2,	%f22
	call	loop_192
	taddcctv	%o1,	0x07C5,	%i7
	call	loop_193
	rd	%fprs,	%i3
loop_192:
	call	loop_194
	srlx	%o2,	%g7,	%g4
loop_193:
	fmovsue	%fcc1,	%f29,	%f16
	call	loop_195
loop_194:
	fmovduge	%fcc1,	%f28,	%f4
	fpadd16s	%f13,	%f1,	%f12
	call	loop_196
loop_195:
	fble,a,pt	%fcc0,	loop_197
	call	loop_198
	fands	%f20,	%f15,	%f10
loop_196:
	fornot1s	%f29,	%f1,	%f30
loop_197:
	call	loop_199
loop_198:
	fmovs	%f30,	%f13
	fcmpes	%fcc0,	%f25,	%f7
	call	loop_200
loop_199:
	call	loop_201
	fands	%f17,	%f24,	%f6
	fone	%f0
loop_200:
	edge16	%i0,	%l4,	%o5
loop_201:
	movne	%fcc3,	%l5,	%g1
	fmovspos	%icc,	%f30,	%f21
	movneg	%icc,	%l6,	%i6
	fpadd32	%f16,	%f14,	%f10
	call	loop_202
	fbe	%fcc0,	loop_203
	array16	%o0,	%l3,	%i4
	fnand	%f20,	%f12,	%f24
loop_202:
	call	loop_204
loop_203:
	array32	%g6,	%l0,	%g2
	brgez,a	%o3,	loop_205
	nop
	setx	0xCD3852B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC7D2CF55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f30,	%f22
loop_204:
	call	loop_206
	fpsub16s	%f23,	%f25,	%f13
loop_205:
	call	loop_207
	call	loop_208
loop_206:
	fmovdgu	%xcc,	%f0,	%f2
	add	%g5,	0x058E,	%o4
loop_207:
	fmul8x16	%f14,	%f26,	%f22
loop_208:
	fzero	%f8
	membar	0x53
	rdhpr	%hsys_tick_cmpr,	%i1
	nop
	setx	0xB9319947F2E8EF86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2E0480485B5B7D9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f26,	%f10
	call	loop_209
	sub	%g3,	0x0C8D,	%i5
	call	loop_210
	movlg	%fcc2,	0x493,	%l1
loop_209:
	movleu	%xcc,	%i2,	%o7
	call	loop_211
loop_210:
	fcmpeq16	%f0,	%f14,	%o6
	st	%fsr,	[%l7 + 0x74]
	movule	%fcc0,	0x6EA,	%o1
loop_211:
	lduw	[%l7 + 0x5C],	%i7
	pdist	%f10,	%f30,	%f16
	bcc,pn	%xcc,	loop_212
	fmovscc	%xcc,	%f23,	%f25
	fmovsle	%xcc,	%f27,	%f26
	tne	%xcc,	0x2
loop_212:
	nop
	setx	0x12B1,	%l0,	%o2
	udivx	%i3,	%o2,	%l2
	fsrc1s	%f14,	%f1
	fmul8x16au	%f17,	%f4,	%f26
	call	loop_213
	bcc,pt	%xcc,	loop_214
	sra	%g4,	0x10,	%g7
	call	loop_215
loop_213:
	call	loop_216
loop_214:
	bvs	%xcc,	loop_217
	fmovdg	%icc,	%f4,	%f24
loop_215:
	ldstub	[%l7 + 0x4D],	%l4
loop_216:
	fmovdule	%fcc1,	%f6,	%f22
loop_217:
	call	loop_218
	fmul8ulx16	%f14,	%f10,	%f16
	call	loop_219
	movpos	%icc,	%o5,	%l5
loop_218:
	edge16n	%g1,	%i0,	%l6
	fcmpes	%fcc1,	%f21,	%f20
loop_219:
	fsrc2s	%f2,	%f31
	rd	%sys_tick_cmpr,	%i6
	call	loop_220
	edge16n	%o0,	%i4,	%l3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	subcc	%g6,	%l0,	%o3
loop_220:
	fmovdleu	%xcc,	%f28,	%f20
	fmovsneg	%icc,	%f27,	%f25
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f28
	addcc	%g5,	%g2,	%o4
	call	loop_221
	fxnor	%f14,	%f12,	%f14
	edge16ln	%g3,	%i5,	%i1
	wr	%l1,	0x037D,	%ccr
loop_221:
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%i2
	call	loop_222
	nop
	setx	0x1F55,	%l0,	%o1
	sdiv	%o6,	%o1,	%o7
	call	loop_223
	sll	%i3,	%o2,	%i7
loop_222:
	call	loop_224
	brlz,a	%g4,	loop_225
loop_223:
	add	%l2,	%l4,	%g7
	call	loop_226
loop_224:
	call	loop_227
loop_225:
	call	loop_228
	fnands	%f18,	%f30,	%f7
loop_226:
	fmovd	%f10,	%f28
loop_227:
	nop
	set	0x38, %o4
	ldswa	[%l7 + %o4] 0x80,	%o5
loop_228:
	addccc	%l5,	%i0,	%l6
	siam	0x4
	bg,a,pt	%icc,	loop_229
	call	loop_230
	fmovdcs	%xcc,	%f28,	%f28
	sllx	%g1,	%i6,	%i4
loop_229:
	fmovsu	%fcc2,	%f7,	%f0
loop_230:
	fmovdle	%fcc0,	%f26,	%f8
	fmovsuge	%fcc1,	%f17,	%f23
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_231
	fmovsg	%fcc2,	%f25,	%f11
	movule	%fcc2,	0x2D1,	%o0
	call	loop_232
loop_231:
	call	loop_233
	fcmpeq16	%f6,	%f2,	%g6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l3,	%o3
loop_232:
	fornot2s	%f23,	%f4,	%f7
loop_233:
	call	loop_234
loop_234:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 12
!	Type a   	: 7
!	Type cti   	: 65
!	Type x   	: 3
!	Type f   	: 63
!	Type i   	: 50
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
	set	0x8,	%g2
	set	0x4,	%g3
	set	0x1,	%g4
	set	0x1,	%g5
	set	0x8,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xB,	%i1
	set	-0x7,	%i2
	set	-0x6,	%i3
	set	-0x6,	%i4
	set	-0xE,	%i5
	set	-0x2,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x4BBA0FBA,	%l0
	set	0x22255DED,	%l1
	set	0x134DDB31,	%l2
	set	0x521A8910,	%l3
	set	0x64A1ED14,	%l4
	set	0x675A7C6B,	%l5
	set	0x0B5EDE79,	%l6
	!# Output registers
	set	-0x147D,	%o0
	set	0x1B5C,	%o1
	set	0x13D6,	%o2
	set	-0x07A3,	%o3
	set	0x1B22,	%o4
	set	-0x0486,	%o5
	set	-0x0533,	%o6
	set	-0x16A0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	fmul8ulx16	%f6,	%f6,	%f12
	call	loop_235
	call	loop_236
	movlg	%fcc0,	%g5,	%g2
	for	%f0,	%f6,	%f8
loop_235:
	fmovdg	%fcc1,	%f22,	%f26
loop_236:
	movrlz	%l0,	%g3,	%o4
	tpos	%xcc,	0x5
	fmovscs	%xcc,	%f9,	%f22
	call	loop_237
	call	loop_238
	fmovrdlez	%i5,	%f12,	%f18
	call	loop_239
loop_237:
	call	loop_240
loop_238:
	membar	0x4D
	call	loop_241
loop_239:
	fba,a,pn	%fcc3,	loop_242
loop_240:
	call	loop_243
	fmovsvc	%icc,	%f15,	%f14
loop_241:
	fmovdgu	%xcc,	%f24,	%f0
loop_242:
	call	loop_244
loop_243:
	call	loop_245
	fmul8x16al	%f28,	%f4,	%f28
	call	loop_246
loop_244:
	brlz,a	%l1,	loop_247
loop_245:
	wrpr	%i2,	%o6,	%cwp
	movrgz	%i1,	0x3F3,	%o1
loop_246:
	alignaddr	%i3,	%o2,	%o7
loop_247:
	bcc,a	%xcc,	loop_248
	movvc	%icc,	%g4,	%i7
	fzero	%f12
	nop
	setx	0x1A42,	%l0,	%g7
	udivx	%l4,	%g7,	%o5
loop_248:
	fnands	%f0,	%f12,	%f23
	fbne,a,pt	%fcc1,	loop_249
	fsrc1	%f30,	%f14
	tpos	%icc,	0x6
	call	loop_250
loop_249:
	fand	%f6,	%f4,	%f2
	srax	%l5,	%l2,	%i0
	call	loop_251
loop_250:
	movul	%fcc2,	%g1,	%l6
	call	loop_252
	call	loop_253
loop_251:
	fmovsug	%fcc3,	%f18,	%f28
	movne	%xcc,	%i6,	%i4
loop_252:
	fpackfix	%f26,	%f6
loop_253:
	fnot1	%f2,	%f6
	call	loop_254
	fmovrde	%g6,	%f22,	%f0
	call	loop_255
	or	%l3,	0x1543,	%o3
loop_254:
	fmovsa	%xcc,	%f23,	%f14
	call	loop_256
loop_255:
	fpack16	%f8,	%f8
	fmovscs	%xcc,	%f21,	%f22
	nop
	setx	0x5E8950E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x3500CB7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f7,	%f17
loop_256:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEE5, 	%hsys_tick_cmpr
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rdhpr	%hintp,	%o0
	mulx	%l0,	0x106C,	%g2
	fornot1	%f18,	%f22,	%f18
	edge16l	%o4,	%i5,	%g3
	brnz,a,pn	%l1,	loop_257
	call	loop_258
	fnegd	%f26,	%f8
	call	loop_259
loop_257:
	call	loop_260
loop_258:
	sir	0x18EC
	fmovsge	%fcc3,	%f6,	%f25
loop_259:
	sethi	0x1239,	%o6
loop_260:
	srax	%i2,	%o1,	%i1
	bpos	%icc,	loop_261
	brlez,a	%o2,	loop_262
	nop
	setx	0x0A72,	%l0,	%g4
	udivcc	%o7,	%g4,	%i7
	rdpr	%tl,	%i3
loop_261:
	fmovse	%fcc1,	%f7,	%f30
loop_262:
	movn	%fcc2,	%g7,	%l4
	wr	%g0,	0x04,	%asi
	stha	%l5,	[%l7 + 0x5C] %asi
	tvs	%icc,	0x7
	call	loop_263
	fnegd	%f12,	%f2
	bn,a	%xcc,	loop_264
	addccc	%l2,	%i0,	%g1
loop_263:
	call	loop_265
	call	loop_266
loop_264:
	fmovrsne	%l6,	%f11,	%f7
	nop
	setx	0xA69D82B3324DD609,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA4F97F67D71F2367,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f16,	%f4
loop_265:
	nop
	fitos	%f6,	%f7
	fstoi	%f7,	%f11
loop_266:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0
	call	loop_267
	call	loop_268
	srax	%o5,	%g6,	%l3
	call	loop_269
loop_267:
	nop
	setx	0xFA7D58F6694C93EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_268:
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%i4
	call	loop_270
loop_269:
	pdist	%f30,	%f8,	%f26
	fmovrdgz	%g5,	%f28,	%f26
	fmovrslz	%o0,	%f23,	%f8
loop_270:
	fmovsvc	%xcc,	%f1,	%f21
	tgu	%icc,	0x0
	call	loop_271
	fmovdn	%fcc0,	%f20,	%f14
	call	loop_272
	wrpr	%o3,	%l0,	%pil
loop_271:
	tne	%xcc,	0x1
	fcmpes	%fcc1,	%f30,	%f7
loop_272:
	fabsd	%f4,	%f20
	fand	%f18,	%f10,	%f30
	and	%o4,	0x1AD2,	%i5
	fcmpgt16	%f0,	%f2,	%g3
	rd	%y,	%g2
	movlg	%fcc1,	%o6,	%i2
	bcc,a	%xcc,	loop_273
	fsrc1s	%f6,	%f5
	call	loop_274
	call	loop_275
loop_273:
	array8	%l1,	%o1,	%i1
	edge8	%o2,	%o7,	%g4
loop_274:
	rdhpr	%hpstate,	%i3
loop_275:
	call	loop_276
	fpadd32	%f20,	%f24,	%f6
	nop
	setx	0x3E5B97B00D0115F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF3625A815E95394B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f24,	%f30
	fmovsle	%fcc3,	%f25,	%f24
loop_276:
	nop
	setx	0x1B84,	%l0,	%l4
	udivcc	%g7,	%l4,	%l5
	brgez	%i7,	loop_277
	fmovdge	%fcc1,	%f14,	%f14
	fmovdg	%fcc1,	%f8,	%f14
	fmovsleu	%icc,	%f25,	%f24
loop_277:
	tgu	%xcc,	0x4
	fpmerge	%f22,	%f18,	%f14
	fmovde	%icc,	%f8,	%f2
	fbn,a,pn	%fcc0,	loop_278
	movue	%fcc1,	%l2,	%g1
	call	loop_279
	fornot2	%f28,	%f0,	%f12
loop_278:
	fmuld8sux16	%f25,	%f5,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x047, 	%hsys_tick_cmpr
loop_279:
	fmovsvs	%xcc,	%f14,	%f4
	rdpr	%gl,	%i0
	wr	%o5,	0x1A24,	%sys_tick
	call	loop_280
	nop
	set	0x58, %l2
	lduw	[%l7 + %l2],	%g6
	movu	%fcc3,	0x7E0,	%i6
	nop
	setx	0x6EE0CC075458E6BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x31F9901B805730EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f14,	%f6
loop_280:
	andncc	%l3,	%g5,	%o0
	call	loop_281
	nop
	setx	0x8D778244BCA71855,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	for	%f8,	%f12,	%f2
	call	loop_282
loop_281:
	call	loop_283
	fbu,a	%fcc3,	loop_284
	for	%f8,	%f0,	%f30
loop_282:
	edge32l	%i4,	%o3,	%o4
loop_283:
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f5
loop_284:
	fbne,pt	%fcc2,	loop_285
	call	loop_286
	orn	%i5,	%g3,	%g2
	call	loop_287
loop_285:
	subc	%l0,	0x1798,	%i2
loop_286:
	rd	%tick_cmpr,	%l1
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%o6
loop_287:
	call	loop_288
	siam	0x4
	wr 	%g0, 	0x6, 	%fprs
	array8	%o2,	%o7,	%g4
loop_288:
	movne	%fcc0,	0x28E,	%g7
	rdpr	%tl,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovspos	%xcc,	%f24,	%f10
	call	loop_289
	rdhpr	%ver,	%i3
	movgu	%icc,	0x110,	%l2
	fmovscs	%xcc,	%f30,	%f13
loop_289:
	srl	%g1,	%i7,	%i0
	call	loop_290
	movvs	%icc,	0x1F9,	%o5
	call	loop_291
	call	loop_292
loop_290:
	movug	%fcc3,	%g6,	%i6
	movrne	%l3,	0x00D,	%g5
loop_291:
	wrpr	%l6,	%i4,	%pil
loop_292:
	fmovde	%xcc,	%f14,	%f26
	addcc	%o3,	0x1591,	%o0
	call	loop_293
	call	loop_294
	fsrc1	%f30,	%f2
	tg	%icc,	0x7
loop_293:
	movg	%fcc0,	%o4,	%g3
loop_294:
	taddcctv	%i5,	%g2,	%l0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l1
	te	%icc,	0x7
	sll	%o6,	0x0B,	%i2
	nop
	set	0x1C, %g3
	prefetch	[%l7 + %g3],	 1
	brz	%o1,	loop_295
	nop
	setx	0x0924,	%l0,	%o7
	udivcc	%i1,	%o7,	%g4
	orncc	%o2,	0x1481,	%l4
loop_295:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 9
!	Type a   	: 16
!	Type x   	: 3
!	Type cti   	: 61
!	Type f   	: 58
!	Type i   	: 53
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
	set	0xB,	%g1
	set	0x0,	%g2
	set	0x5,	%g3
	set	0xA,	%g4
	set	0x2,	%g5
	set	0x9,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xE,	%i1
	set	-0x1,	%i2
	set	-0x8,	%i3
	set	-0xD,	%i4
	set	-0x7,	%i5
	set	-0xE,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x5698E2CE,	%l0
	set	0x4F434F79,	%l1
	set	0x037EFBC4,	%l2
	set	0x588FAC80,	%l3
	set	0x3B18C1AB,	%l4
	set	0x737A04B1,	%l5
	set	0x5C11A30A,	%l6
	!# Output registers
	set	0x1DB5,	%o0
	set	-0x1CF8,	%o1
	set	0x1AA3,	%o2
	set	-0x1D66,	%o3
	set	-0x19ED,	%o4
	set	0x172E,	%o5
	set	0x0FF0,	%o6
	set	0x0AF5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	fpsub32	%f22,	%f8,	%f28
	nop
	setx	0xF39C1E2FAA8D1E78,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD52D2F7A6C289B30,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f0,	%f4
	nop
	setx	0x60947F74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x1AF1F619,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f22,	%f2
	call	loop_296
	fmovdle	%fcc2,	%f26,	%f30
	movrlz	%g7,	%i3,	%l5
	call	loop_297
loop_296:
	fpadd32s	%f1,	%f26,	%f28
	bpos,a	%xcc,	loop_298
	fcmpgt16	%f4,	%f18,	%l2
loop_297:
	fbg,a	%fcc3,	loop_299
	fpadd16s	%f15,	%f28,	%f23
loop_298:
	call	loop_300
	fcmpgt16	%f6,	%f20,	%g1
loop_299:
	wrpr	%i7,	%o5,	%tick
	fmovsvs	%xcc,	%f19,	%f7
loop_300:
	call	loop_301
	fmovdue	%fcc0,	%f22,	%f18
	stb	%g6,	[%l7 + 0x64]
	fone	%f6
loop_301:
	mulx	%i0,	%l3,	%g5
	ldsw	[%l7 + 0x70],	%i6
	nop
	setx	0xC43EA513,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x69905FD1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f9,	%f12
	call	loop_302
	subcc	%i4,	%l6,	%o0
	call	loop_303
	orcc	%o3,	0x1579,	%o4
loop_302:
	subcc	%i5,	0x1BBC,	%g3
	rd	%pc,	%l0
loop_303:
	fnand	%f10,	%f28,	%f8
	call	loop_304
	sllx	%g2,	%l1,	%i2
	fmovdn	%icc,	%f30,	%f0
	call	loop_305
loop_304:
	call	loop_306
	fsrc2s	%f4,	%f25
	wrpr	%o6,	0x0B4C,	%cwp
loop_305:
	call	loop_307
loop_306:
	for	%f20,	%f6,	%f22
	fmovdl	%xcc,	%f2,	%f18
	movneg	%icc,	%i1,	%o7
loop_307:
	call	loop_308
	fpack32	%f28,	%f22,	%f22
	call	loop_309
	movrne	%o1,	0x24F,	%g4
loop_308:
	nop
	setx	0x430C81CDB4975894,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFA2FDE3539D02D1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f24,	%f16
	wrpr	%o2,	0x0E4D,	%tick
loop_309:
	wrpr	%l4,	%g7,	%cwp
	fnor	%f16,	%f2,	%f30
	fmovsvc	%xcc,	%f29,	%f2
	nop
	set	0x78, %o6
	ldsb	[%l7 + %o6],	%l5
	call	loop_310
	fmovsneg	%icc,	%f28,	%f30
	fmovrslez	%i3,	%f21,	%f3
	call	loop_311
loop_310:
	call	loop_312
	fmovda	%fcc3,	%f12,	%f10
	tvc	%xcc,	0x4
loop_311:
	fone	%f18
loop_312:
	call	loop_313
	rd	%fprs,	%g1
	fabss	%f23,	%f6
	call	loop_314
loop_313:
	fmul8ulx16	%f16,	%f20,	%f6
	wrpr	%l2,	%o5,	%pil
	call	loop_315
loop_314:
	nop
	set	0x52, %l6
	ldsb	[%l7 + %l6],	%g6
	fnot1s	%f27,	%f26
	fmovsuge	%fcc2,	%f8,	%f19
loop_315:
	movn	%fcc1,	%i0,	%i7
	ld	[%l7 + 0x10],	%f22
	fmovda	%icc,	%f6,	%f10
	call	loop_316
	fmovrdgz	%l3,	%f6,	%f16
	fpsub32	%f18,	%f22,	%f20
	call	loop_317
loop_316:
	bvc,pn	%xcc,	loop_318
	call	loop_319
	ble,a,pt	%icc,	loop_320
loop_317:
	sra	%g5,	0x06,	%i4
loop_318:
	xnor	%i6,	%o0,	%o3
loop_319:
	wrpr	%o4,	0x197C,	%tick
loop_320:
	call	loop_321
	call	loop_322
	call	loop_323
	brlz,a,pn	%i5,	loop_324
loop_321:
	fmovdule	%fcc2,	%f26,	%f18
loop_322:
	rdhpr	%hpstate,	%g3
loop_323:
	tgu	%icc,	0x4
loop_324:
	call	loop_325
	addcc	%l0,	0x0BA5,	%g2
	subcc	%l1,	0x1B76,	%l6
	fsrc1	%f8,	%f0
loop_325:
	rdpr	%wstate,	%o6
	call	loop_326
	fmovdue	%fcc3,	%f14,	%f6
	tgu	%xcc,	0x3
	call	loop_327
loop_326:
	nop
	set	0x30, %l1
	stw	%i2,	[%l7 + %l1]
	movre	%o7,	%i1,	%g4
	movuge	%fcc2,	0x294,	%o2
loop_327:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x71F, 	%hsys_tick_cmpr
	fbuge	%fcc2,	loop_328
	call	loop_329
	nop
	setx	loop_330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002100001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%l5,	%g7,	%i3
loop_328:
	bcc	%xcc,	loop_331
loop_329:
	fmovsleu	%xcc,	%f7,	%f21
loop_330:
	call	loop_332
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f8
loop_331:
	fba,pn	%fcc1,	loop_333
	fabss	%f3,	%f22
loop_332:
	fpadd32s	%f0,	%f30,	%f9
	fcmple32	%f16,	%f2,	%l2
loop_333:
	fmovdgu	%xcc,	%f8,	%f6
	call	loop_334
	call	loop_335
	rdhpr	%htba,	%g1
	fmovsgu	%xcc,	%f15,	%f30
loop_334:
	array16	%g6,	%i0,	%o5
loop_335:
	call	loop_336
	xnorcc	%i7,	0x145A,	%g5
	fmovsl	%fcc1,	%f8,	%f8
	call	loop_337
loop_336:
	fmovsa	%fcc2,	%f19,	%f16
	addccc	%i4,	%i6,	%o0
	call	loop_338
loop_337:
	siam	0x0
	call	loop_339
	rdpr	%pil,	%o3
loop_338:
	fpsub32	%f2,	%f12,	%f26
	call	loop_340
loop_339:
	fmovsneg	%xcc,	%f13,	%f4
	call	loop_341
	xor	%o4,	%l3,	%i5
loop_340:
	nop
	set	0x7B, %i5
	ldstub	[%l7 + %i5],	%l0
	fmovsleu	%icc,	%f6,	%f24
loop_341:
	call	loop_342
	fmovso	%fcc1,	%f12,	%f17
	fmovdpos	%icc,	%f14,	%f4
	subccc	%g3,	0x17A4,	%l1
loop_342:
	array8	%g2,	%o6,	%l6
	array8	%o7,	%i2,	%i1
	nop
	setx	0x537D3204,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	call	loop_343
	fmovse	%icc,	%f16,	%f6
	smulcc	%o2,	0x1BFC,	%g4
	brz,a	%o1,	loop_344
loop_343:
	fmul8ulx16	%f14,	%f12,	%f10
	call	loop_345
	fmovdl	%fcc3,	%f0,	%f6
loop_344:
	call	loop_346
	edge32ln	%l4,	%g7,	%i3
loop_345:
	fpsub32	%f2,	%f14,	%f12
	stx	%fsr,	[%l7 + 0x48]
loop_346:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x18,	%l2,	%g1
	call	loop_347
	rd	%sys_tick_cmpr,	%g6
	rd	%tick_cmpr,	%l5
	faligndata	%f6,	%f12,	%f4
loop_347:
	rdpr	%cansave,	%o5
	tcc	%xcc,	0x1
	call	loop_348
	fmovsvc	%icc,	%f23,	%f31
	nop
	set	0x34, %o0
	flush	%l7 + %o0
	rdpr	%wstate,	%i7
loop_348:
	andcc	%i0,	0x1E97,	%g5
	wrpr	%i4,	0x115D,	%cwp
	fmovdvc	%xcc,	%f14,	%f30
	edge16ln	%i6,	%o3,	%o0
	fmovrdgz	%o4,	%f22,	%f10
	bmask	%l3,	%i5,	%g3
	fmovse	%fcc3,	%f20,	%f29
	prefetch	[%l7 + 0x1C],	 1
	call	loop_349
	movn	%icc,	%l0,	%l1
	wr	%o6,	%g2,	%sys_tick
	call	loop_350
loop_349:
	subc	%l6,	0x0428,	%i2
	call	loop_351
	ldsb	[%l7 + 0x2F],	%o7
loop_350:
	call	loop_352
	faligndata	%f24,	%f14,	%f14
loop_351:
	fmovdleu	%icc,	%f30,	%f26
	call	loop_353
loop_352:
	tgu	%xcc,	0x5
	call	loop_354
	call	loop_355
loop_353:
	ld	[%l7 + 0x74],	%f5
	movue	%fcc0,	%o2,	%g4
loop_354:
	call	loop_356
loop_355:
	call	loop_357
	flush	%l7 + 0x58
	call	loop_358
loop_356:
	call	loop_359
loop_357:
	edge16ln	%i1,	%l4,	%o1
	call	loop_360
loop_358:
	siam	0x0
loop_359:
	tg	%xcc,	0x6
loop_360:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 15
!	Type a   	: 19
!	Type x   	: 1
!	Type cti   	: 65
!	Type f   	: 62
!	Type i   	: 38
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
	set	0xE,	%g1
	set	0xA,	%g2
	set	0xE,	%g3
	set	0xA,	%g4
	set	0x6,	%g5
	set	0xD,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xD,	%i1
	set	-0x2,	%i2
	set	-0xD,	%i3
	set	-0xD,	%i4
	set	-0x6,	%i5
	set	-0xE,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x5014EE78,	%l0
	set	0x3E9E6412,	%l1
	set	0x437E9D05,	%l2
	set	0x3E29F3AA,	%l3
	set	0x284FF185,	%l4
	set	0x37A8DC83,	%l5
	set	0x4EA6233E,	%l6
	!# Output registers
	set	-0x006C,	%o0
	set	0x0D93,	%o1
	set	0x13C0,	%o2
	set	0x1E68,	%o3
	set	-0x1EE7,	%o4
	set	0x10D7,	%o5
	set	-0x08E3,	%o6
	set	-0x07A3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	tvs	%icc,	0x2
	fandnot2s	%f19,	%f10,	%f15
	edge32l	%i3,	%l2,	%g1
	brgez,pn	%g7,	loop_361
	fornot1	%f12,	%f6,	%f30
	for	%f22,	%f6,	%f26
	fsrc2s	%f23,	%f30
loop_361:
	call	loop_362
	call	loop_363
	call	loop_364
	wrpr	%l5,	0x1FC2,	%pil
loop_362:
	te	%xcc,	0x4
loop_363:
	fmovdug	%fcc2,	%f16,	%f26
loop_364:
	fmovrdlz	%o5,	%f6,	%f28
	fbug,a,pt	%fcc2,	loop_365
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%g6
	fmovde	%xcc,	%f12,	%f10
	bcc	%icc,	loop_366
loop_365:
	call	loop_367
	bneg,a	%icc,	loop_368
	tg	%xcc,	0x2
loop_366:
	call	loop_369
loop_367:
	call	loop_370
loop_368:
	call	loop_371
	movul	%fcc2,	0x73C,	%i0
loop_369:
	call	loop_372
loop_370:
	fpackfix	%f2,	%f18
loop_371:
	fmovde	%fcc1,	%f20,	%f2
	call	loop_373
loop_372:
	fmovdlg	%fcc3,	%f24,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x44, %l0
	stw	%i4,	[%l7 + %l0]
loop_373:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fpsub32s	%f12,	%f5,	%f2
	fmul8ulx16	%f6,	%f20,	%f22
	st	%f24,	[%l7 + 0x20]
	call	loop_374
	call	loop_375
	umul	%o0,	0x0F93,	%o4
	fbule	%fcc3,	loop_376
loop_374:
	fmovrsne	%l3,	%f19,	%f5
loop_375:
	pdist	%f16,	%f12,	%f18
	call	loop_377
loop_376:
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i6
	call	loop_378
	nop
	fitod	%f16,	%f0
loop_377:
	nop
	fitos	%f11,	%f18
	fstoi	%f18,	%f10
	call	loop_379
loop_378:
	fpadd32	%f28,	%f18,	%f18
	fbl	%fcc0,	loop_380
	fnot2	%f0,	%f18
loop_379:
	call	loop_381
	fpadd32s	%f0,	%f18,	%f15
loop_380:
	te	%xcc,	0x5
	fmovslg	%fcc0,	%f24,	%f12
loop_381:
	fmovdpos	%icc,	%f2,	%f28
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%i4
	nop
	set	0x71, %o7
	ldstub	[%l7 + %o7],	%g3
	fornot1s	%f1,	%f23,	%f13
	swap	[%l7 + 0x5C],	%l1
	call	loop_382
	tle	%xcc,	0x4
	rd	%fprs,	%o6
	fmuld8ulx16	%f3,	%f30,	%f10
loop_382:
	nop
	set	0x4C, %g4
	swapa	[%l7 + %g4] 0x80,	%l0
	call	loop_383
	tleu	%xcc,	0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%xcc,	0x2
loop_383:
	edge32l	%i2,	%g2,	%o2
	movrlez	%g4,	%o7,	%l4
	call	loop_384
	fmovdlg	%fcc3,	%f10,	%f0
	edge8	%o1,	%i1,	%l2
	fornot1s	%f22,	%f6,	%f5
loop_384:
	call	loop_385
	alignaddr	%g1,	%i3,	%g7
	orncc	%l5,	%g6,	%i0
	fmovrsgez	%g5,	%f0,	%f17
loop_385:
	call	loop_386
	call	loop_387
	bmask	%o5,	%i4,	%i7
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f6
loop_386:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC61, 	%tick_cmpr
loop_387:
	fornot2s	%f20,	%f9,	%f28
	fcmpgt32	%f6,	%f6,	%l3
	fbul,pt	%fcc3,	loop_388
	nop
	fitos	%f13,	%f11
	movre	%i6,	0x166,	%o4
	call	loop_389
loop_388:
	edge16l	%g3,	%l1,	%o6
	fandnot1	%f20,	%f4,	%f18
	sub	%i5,	%l0,	%l6
loop_389:
	fmovda	%xcc,	%f16,	%f10
	fmovdne	%icc,	%f20,	%f14
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i2,	%g2
	ta	%xcc,	0x3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x19,	%o2,	%o7
	umulcc	%g4,	0x1F90,	%o1
	fmovrde	%l4,	%f22,	%f10
	fmovsgu	%xcc,	%f8,	%f15
	call	loop_390
	fmuld8sux16	%f27,	%f29,	%f18
	movn	%fcc2,	0x6C0,	%l2
	fnot2s	%f23,	%f0
loop_390:
	fnot2s	%f7,	%f8
	movneg	%icc,	0x2BB,	%i1
	sllx	%g1,	0x16,	%i3
	call	loop_391
	fpack32	%f2,	%f6,	%f6
	fbne	%fcc1,	loop_392
	srlx	%l5,	%g6,	%g7
loop_391:
	call	loop_393
	fpsub32s	%f4,	%f27,	%f10
loop_392:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x85E, 	%hsys_tick_cmpr
	fmovslg	%fcc0,	%f2,	%f4
loop_393:
	fmovda	%fcc1,	%f8,	%f26
	call	loop_394
	fmovrdgez	%g5,	%f14,	%f10
	movle	%fcc3,	0x618,	%i7
	call	loop_395
loop_394:
	fmovdneg	%icc,	%f6,	%f16
	lduh	[%l7 + 0x7E],	%o0
	call	loop_396
loop_395:
	fmovdg	%icc,	%f12,	%f10
	srl	%i4,	%o3,	%l3
	call	loop_397
loop_396:
	fmovdn	%icc,	%f20,	%f4
	movl	%xcc,	%i6,	%o4
	tl	%icc,	0x1
loop_397:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x888, 	%tick_cmpr
	call	loop_398
	fmovdg	%xcc,	%f22,	%f24
	edge16n	%o6,	%l1,	%i5
	fmovda	%icc,	%f2,	%f24
loop_398:
	fnands	%f13,	%f30,	%f2
	call	loop_399
	fmovdue	%fcc2,	%f12,	%f8
	fnor	%f6,	%f0,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDE8, 	%hsys_tick_cmpr
loop_399:
	tvs	%icc,	0x7
	call	loop_400
	movrlz	%i2,	0x376,	%o2
	fmovdge	%xcc,	%f26,	%f6
	bvs,a	%icc,	loop_401
loop_400:
	movcc	%xcc,	0x2D0,	%g2
	fmovdul	%fcc2,	%f14,	%f12
	nop
	setx	loop_402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_401:
	fabss	%f2,	%f1
	call	loop_403
	call	loop_404
loop_402:
	popc	%o7,	%g4
	andncc	%l4,	%o1,	%i1
loop_403:
	fpackfix	%f4,	%f25
loop_404:
	fmovdvc	%xcc,	%f16,	%f18
	fmovsue	%fcc1,	%f21,	%f30
	call	loop_405
	nop
	setx	0x2027595489C2FFCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x7CF2A2C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f12,	%f28
	fmovdvs	%xcc,	%f2,	%f22
	fmovduge	%fcc1,	%f2,	%f16
loop_405:
	call	loop_406
	call	loop_407
	call	loop_408
	bcc,a,pt	%xcc,	loop_409
loop_406:
	movvc	%icc,	%l2,	%i3
loop_407:
	wr	%g1,	0x1F47,	%pic
loop_408:
	pdist	%f26,	%f26,	%f28
loop_409:
	prefetch	[%l7 + 0x64],	 1
	fmovsle	%fcc3,	%f30,	%f0
	set	0x37, %i1
	ldsba	[%l7 + %i1] 0x18,	%l5
	fpadd16	%f4,	%f20,	%f28
	call	loop_410
	movge	%icc,	%g7,	%g6
	edge16ln	%i0,	%o5,	%i7
	fmovdge	%fcc0,	%f2,	%f20
loop_410:
	wr	%g5,	0x1C8F,	%set_softint
	call	loop_411
	fnegd	%f6,	%f0
	call	loop_412
	call	loop_413
loop_411:
	call	loop_414
	call	loop_415
loop_412:
	tgu	%xcc,	0x3
loop_413:
	tl	%icc,	0x5
loop_414:
	call	loop_416
loop_415:
	fmovdul	%fcc1,	%f12,	%f8
	nop
	setx	0x1628,	%l0,	%o3
	sdivx	%i4,	%o3,	%o0
	call	loop_417
loop_416:
	fmovsleu	%icc,	%f4,	%f17
	fmovrslz	%l3,	%f20,	%f26
	nop
	setx	0xF4F02309,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x10C219A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f10,	%f11
loop_417:
	fmuld8sux16	%f28,	%f11,	%f0
	lduw	[%l7 + 0x34],	%o4
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i6
	bne,pt	%icc,	loop_418
loop_418:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 15
!	Type a   	: 11
!	Type x   	: 5
!	Type cti   	: 58
!	Type f   	: 70
!	Type i   	: 41
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
	set	0xA,	%g1
	set	0x0,	%g2
	set	0x3,	%g3
	set	0x7,	%g4
	set	0xA,	%g5
	set	0x7,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x2,	%i1
	set	-0xA,	%i2
	set	-0x6,	%i3
	set	-0x8,	%i4
	set	-0xA,	%i5
	set	-0xD,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x62C42B27,	%l0
	set	0x71A8F090,	%l1
	set	0x099D3373,	%l2
	set	0x6BE48A23,	%l3
	set	0x616D9335,	%l4
	set	0x1DCE0AB0,	%l5
	set	0x565E0A3F,	%l6
	!# Output registers
	set	0x035B,	%o0
	set	-0x0340,	%o1
	set	-0x0C29,	%o2
	set	-0x0955,	%o3
	set	0x13D1,	%o4
	set	-0x10CA,	%o5
	set	-0x06DA,	%o6
	set	-0x190C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x79ED3360074D6AF0)
	INIT_TH_FP_REG(%l7,%f2,0x0AD4A1C0B6663890)
	INIT_TH_FP_REG(%l7,%f4,0x1FE84343C96A4587)
	INIT_TH_FP_REG(%l7,%f6,0x418A83FF459E1A5E)
	INIT_TH_FP_REG(%l7,%f8,0x3C6B3B406DE81212)
	INIT_TH_FP_REG(%l7,%f10,0x8935503B086840FF)
	INIT_TH_FP_REG(%l7,%f12,0x3C37C4C4E6C732FF)
	INIT_TH_FP_REG(%l7,%f14,0x752AB53FAA85321F)
	INIT_TH_FP_REG(%l7,%f16,0x557E5CF168B3BCC0)
	INIT_TH_FP_REG(%l7,%f18,0xAFFC72734112DCE1)
	INIT_TH_FP_REG(%l7,%f20,0x898C043F68D7337A)
	INIT_TH_FP_REG(%l7,%f22,0xFAAF1D87E3D9E978)
	INIT_TH_FP_REG(%l7,%f24,0xD4429F787DF7AFC7)
	INIT_TH_FP_REG(%l7,%f26,0x00619A1817DE7B13)
	INIT_TH_FP_REG(%l7,%f28,0xD4418D5FCAA9422E)
	INIT_TH_FP_REG(%l7,%f30,0xAD5DBEBAFD42DE75)

	!# Execute Main Diag ..

	fmovdlg	%fcc0,	%f8,	%f14
	wr	%g3,	0x0230,	%clear_softint
	fmuld8ulx16	%f28,	%f30,	%f0
	sethi	0x18CE,	%o6
	movcc	%xcc,	0x22C,	%i5
	fpadd32s	%f24,	%f27,	%f2
	fmovrse	%l6,	%f23,	%f8
	fbule,a,pt	%fcc1,	loop_419
	nop
	setx	0xE954CD58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x72782208,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f19,	%f12
	fbo,pn	%fcc3,	loop_420
	fsrc1	%f16,	%f12
loop_419:
	nop
	fitos	%f2,	%f4
	fstod	%f4,	%f0
	wr	%g0,	0x19,	%asi
	stha	%l1,	[%l7 + 0x10] %asi
loop_420:
	orn	%i2,	%l0,	%o2
	xor	%g2,	%g4,	%o7
	movug	%fcc0,	0x7D9,	%l4
	movule	%fcc1,	0x5B7,	%i1
	fcmple32	%f6,	%f24,	%o1
	set	0x50, %l4
	stda	%l2,	[%l7 + %l4] 0x10
	call	loop_421
	fnot2s	%f22,	%f24
	udiv	%g1,	0x19D3,	%i3
	xnor	%l5,	%g7,	%g6
loop_421:
	call	loop_422
	fmovdo	%fcc2,	%f14,	%f8
	fmovrdlez	%i0,	%f10,	%f4
	call	loop_423
loop_422:
	fmovso	%fcc3,	%f22,	%f20
	set	0x2E, %g1
	stha	%o5,	[%l7 + %g1] 0x2f
	membar	#Sync
loop_423:
	edge16	%i7,	%g5,	%i4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x7C] %asi,	%f15
	call	loop_424
	call	loop_425
	fcmpgt16	%f26,	%f18,	%o3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_424:
	fmovsvc	%xcc,	%f28,	%f28
loop_425:
	edge16n	%l3,	%o4,	%i6
	fmovdvs	%xcc,	%f2,	%f8
	fsrc1	%f28,	%f8
	call	loop_426
	edge16ln	%o0,	%g3,	%o6
	call	loop_427
	nop
	set	0x60, %l5
	swap	[%l7 + %l5],	%l6
loop_426:
	fmovrdgz	%i5,	%f18,	%f8
	call	loop_428
loop_427:
	fandnot2s	%f31,	%f26,	%f15
	call	loop_429
	fmovrslz	%l1,	%f16,	%f4
loop_428:
	fmovrdlz	%l0,	%f30,	%f24
	call	loop_430
loop_429:
	call	loop_431
	tn	%icc,	0x2
	movo	%fcc3,	0x50E,	%o2
loop_430:
	call	loop_432
loop_431:
	movrgz	%i2,	%g4,	%o7
	call	loop_433
	call	loop_434
loop_432:
	call	loop_435
	edge8n	%g2,	%i1,	%l4
loop_433:
	call	loop_436
loop_434:
	fsrc1s	%f13,	%f20
loop_435:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd3,	%f16
loop_436:
	fpsub16	%f16,	%f14,	%f0
	bne	%icc,	loop_437
	call	loop_438
	call	loop_439
	nop
	fitod	%f3,	%f6
loop_437:
	fsrc2	%f4,	%f28
loop_438:
	wr	%o1,	%g1,	%clear_softint
loop_439:
	ldd	[%l7 + 0x28],	%f0
	movo	%fcc2,	0x18B,	%l2
	fmovsuge	%fcc3,	%f15,	%f23
	fmovduge	%fcc0,	%f0,	%f24
	membar	0x75
	nop
	fitos	%f3,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f18
	call	loop_440
	rdhpr	%hintp,	%i3
	set	0x54, %o1
	swapa	[%l7 + %o1] 0x81,	%l5
loop_440:
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f4
	rd	%y,	%g7
	nop
	setx	0x135C,	%l0,	%g6
	udivcc	%i0,	%g6,	%o5
	set	0x5E, %g6
	lduha	[%l7 + %g6] 0x18,	%i7
	call	loop_441
	call	loop_442
	fands	%f23,	%f2,	%f22
	call	loop_443
loop_441:
	call	loop_444
loop_442:
	movrgz	%g5,	%i4,	%l3
	fsrc2s	%f9,	%f0
loop_443:
	movlg	%fcc2,	0x2FF,	%o4
loop_444:
	call	loop_445
	call	loop_446
	nop
	set	0x08, %o5
	ldub	[%l7 + %o5],	%o3
	fnot2s	%f14,	%f19
loop_445:
	rdhpr	%hpstate,	%i6
loop_446:
	fmovsneg	%icc,	%f20,	%f7
	rdhpr	%hintp,	%g3
	call	loop_447
	fors	%f29,	%f3,	%f26
	fbug,a	%fcc3,	loop_448
	call	loop_449
loop_447:
	fmovdo	%fcc2,	%f30,	%f2
	call	loop_450
loop_448:
	call	loop_451
loop_449:
	call	loop_452
	call	loop_453
loop_450:
	call	loop_454
loop_451:
	nop
	setx loop_455, %l0, %l1
	jmpl %l1, %o0
loop_452:
	stw	%l6,	[%l7 + 0x30]
loop_453:
	nop
	setx	0x89F86241B1219592,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x53BB69FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f16,	%f0
loop_454:
	edge8l	%o6,	%i5,	%l1
loop_455:
	call	loop_456
	movug	%fcc3,	0x450,	%l0
	fbuge,pn	%fcc1,	loop_457
	call	loop_458
loop_456:
	movleu	%icc,	0x643,	%o2
	call	loop_459
loop_457:
	nop
	setx loop_460, %l0, %l1
	jmpl %l1, %i2
loop_458:
	bcs	%xcc,	loop_461
	movcc	%xcc,	%o7,	%g4
loop_459:
	fpsub32s	%f7,	%f22,	%f2
loop_460:
	movle	%fcc3,	%g2,	%l4
loop_461:
	call	loop_462
	bmask	%o1,	%i1,	%g1
	fmovdvc	%icc,	%f14,	%f6
	ta	%icc,	0x7
loop_462:
	nop
	fitod	%f8,	%f2
	fdtoi	%f2,	%f31
	nop
	setx	0xB728DC6154FCF544,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC3DB673749555D3F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f8,	%f14
	movpos	%xcc,	0x27C,	%i3
	tpos	%xcc,	0x7
	membar	0x31
	membar	0x41
	tge	%xcc,	0x0
	fba,a	%fcc3,	loop_463
	rdpr	%tba,	%l5
	fmovsule	%fcc0,	%f12,	%f10
	call	loop_464
loop_463:
	alignaddr	%g7,	%l2,	%g6
	fmovsle	%icc,	%f20,	%f14
	sub	%o5,	0x0752,	%i0
loop_464:
	fmovdvs	%icc,	%f28,	%f0
	fpadd32	%f6,	%f22,	%f6
	array32	%g5,	%i7,	%l3
	call	loop_465
	call	loop_466
	tsubcctv	%i4,	0x00AD,	%o3
	lduw	[%l7 + 0x64],	%o4
loop_465:
	fmovdvc	%xcc,	%f0,	%f2
loop_466:
	call	loop_467
	edge32ln	%i6,	%o0,	%l6
	call	loop_468
	fpadd32s	%f17,	%f23,	%f29
loop_467:
	fpsub32	%f2,	%f10,	%f22
	call	loop_469
loop_468:
	subccc	%g3,	%o6,	%l1
	call	loop_470
	rd	%softint,	%i5
loop_469:
	nop
	setx	0x1811,	%l0,	%i2
	udivx	%o2,	%i2,	%l0
	edge8ln	%g4,	%g2,	%o7
loop_470:
	call	loop_471
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f16
	call	loop_472
	call	loop_473
loop_471:
	fcmpeq16	%f4,	%f20,	%l4
	call	loop_474
loop_472:
	subc	%i1,	0x1170,	%g1
loop_473:
	nop
	set	0x37, %i3
	ldub	[%l7 + %i3],	%i3
	call	loop_475
loop_474:
	call	loop_476
	fcmpne32	%f8,	%f26,	%o1
	array32	%l5,	%g7,	%l2
loop_475:
	fmul8sux16	%f28,	%f6,	%f26
loop_476:
	call	loop_477
	addc	%g6,	0x08CA,	%o5
	fcmped	%fcc3,	%f18,	%f0
	call	loop_478
loop_477:
	call	loop_479
	mova	%xcc,	0x1F4,	%i0
	fnand	%f22,	%f28,	%f2
loop_478:
	edge32	%i7,	%l3,	%g5
loop_479:
	call	loop_480
	call	loop_481
	call	loop_482
	call	loop_483
loop_480:
	edge8	%i4,	%o4,	%o3
loop_481:
	sir	0x1B7F
loop_482:
	rd	%y,	%i6
loop_483:
	call	loop_484
	fnot1	%f14,	%f14
	fmovslg	%fcc2,	%f17,	%f12
	fpadd32s	%f23,	%f19,	%f24
loop_484:
	fmovrde	%l6,	%f22,	%f24
	movne	%icc,	%g3,	%o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 13
!	Type a   	: 9
!	Type x   	: 7
!	Type cti   	: 66
!	Type f   	: 56
!	Type i   	: 49
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x9B508F71
.word 0x76C03702
.word 0x428D4A0F
.word 0x89AB2829
.word 0x0D00127B
.word 0xD52748CA
.word 0x193984CF
.word 0x85EC1237
.word 0xC59E79BB
.word 0xCBD35679
.word 0xB677E374
.word 0x18B6B917
.word 0x7CAE56AF
.word 0xEF46DCFD
.word 0x155814F1
.word 0x7F056855
.word 0x6F7CF476
.word 0x9233EE42
.word 0x748588CF
.word 0x28BF9A89
.word 0x7A9019F1
.word 0xD2723725
.word 0x7BC02175
.word 0x52F370C6
.word 0x6346FE45
.word 0x8E589E2E
.word 0x83D8DD57
.word 0xE4CC0D2C
.word 0x596D2A72
.word 0xD08AE1A8
.word 0x0C3465A5
.word 0x1850101D
.word 0x90E89996
.word 0xF2A605F8
.word 0xF2985DD6
.word 0x35FDB966
.word 0xF4DA65D2
.word 0x4D049836
.word 0xE87F4243
.word 0x0814A7EE
.word 0xE846DAB8
.word 0x65713E5A
.word 0x330C67D3
.word 0x4579A4AB
.word 0xAE6B66EA
.word 0xDAE87281
.word 0xC864A08E
.word 0x569D8B91
.word 0xEE8DF728
.word 0xC27A00A0
.word 0xDC44A468
.word 0xB84C716F
.word 0x2F127CF7
.word 0x4CDF8D80
.word 0x67C1B110
.word 0x41124287
.word 0x91814A7D
.word 0xADA666CA
.word 0xE92D0968
.word 0x7DD8E5AE
.word 0x5F9E6EB6
.word 0xB905AF99
.word 0xBC61D393
.word 0xB2E88DEE
.end
