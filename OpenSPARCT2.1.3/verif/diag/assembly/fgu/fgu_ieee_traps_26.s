/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_26.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=5447901"
.ident "Mon Dec  8 19:57:51 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_26.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x2,	%g2
	set	0xB,	%g3
	set	0xC,	%g4
	set	0xD,	%g5
	set	0xE,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x3,	%i1
	set	-0x2,	%i2
	set	-0xC,	%i3
	set	-0x9,	%i4
	set	-0xA,	%i5
	set	-0x0,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x557498A8,	%l0
	set	0x6A387834,	%l1
	set	0x00F595CE,	%l2
	set	0x6546392A,	%l3
	set	0x13B30913,	%l4
	set	0x41D2A8E0,	%l5
	set	0x2FAD1DF7,	%l6
	!# Output registers
	set	-0x1B43,	%o0
	set	0x10B1,	%o1
	set	0x0E8E,	%o2
	set	-0x1B24,	%o3
	set	-0x095E,	%o4
	set	-0x0C0C,	%o5
	set	0x19CD,	%o6
	set	0x10E1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	fmovdn	%fcc2,	%f6,	%f22
	movpos	%icc,	0x2BC,	%i5
	nop
	fitod	%f12,	%f28
	call	loop_1
	edge8n	%g4,	%l2,	%g6
	fmovrdlez	%o1,	%f16,	%f16
	fmovsug	%fcc0,	%f7,	%f24
loop_1:
	fnot2	%f20,	%f22
	fandnot1	%f8,	%f16,	%f6
	call	loop_2
	edge32n	%l5,	%i3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAC7, 	%hsys_tick_cmpr
	fmovsne	%fcc0,	%f22,	%f1
loop_2:
	movgu	%xcc,	%l3,	%g5
	fmovsg	%icc,	%f18,	%f28
	nop
	setx	0x56C9DD5FC6F0ABFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2E81B12C36A4932C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f10,	%f0
	xor	%i4,	%g3,	%g1
	fbg,a	%fcc0,	loop_3
	or	%l4,	0x148E,	%i7
	fsrc2s	%f12,	%f17
	addcc	%o6,	0x1B8F,	%o5
loop_3:
	fpadd16	%f10,	%f10,	%f26
	edge8l	%g2,	%l6,	%o4
	fabsd	%f16,	%f24
	tleu	%xcc,	0x4
	nop
	setx	0x08DDDA69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xC642B74A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f28,	%f24
	call	loop_4
	call	loop_5
	fpsub16s	%f29,	%f5,	%f22
	movl	%fcc1,	%o0,	%i2
loop_4:
	or	%i6,	%g7,	%i1
loop_5:
	popc	0x196B,	%o3
	subcc	%i0,	0x1E35,	%o2
	call	loop_6
	movne	%fcc2,	%i5,	%o7
	nop
	setx	0x56D8F113FEF4D669,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE46873D3DD9BA9A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f8,	%f26
	fmovso	%fcc2,	%f14,	%f2
loop_6:
	fabsd	%f14,	%f24
	call	loop_7
	stx	%fsr,	[%l7 + 0x78]
	rdhpr	%hsys_tick_cmpr,	%g4
	fexpand	%f27,	%f2
loop_7:
	mulscc	%l2,	0x1180,	%g6
	call	loop_8
	call	loop_9
	wrpr	%l5,	0x1377,	%cwp
	nop
	setx	loop_10,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004200001405,	%l0,	%l1
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
loop_8:
	wrpr	%o1,	%l0,	%pil
loop_9:
	call	loop_11
	ta	%xcc,	0x6
loop_10:
	fand	%f30,	%f6,	%f18
	fmovdo	%fcc3,	%f4,	%f6
loop_11:
	call	loop_12
	subccc	%l1,	%l3,	%i3
	nop
	setx	0xBCB1B567917057C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	bge	%xcc,	loop_13
loop_12:
	fnands	%f26,	%f14,	%f24
	tleu	%icc,	0x3
	fmovdule	%fcc0,	%f10,	%f2
loop_13:
	xnor	%g5,	0x11D7,	%i4
	orncc	%g3,	%g1,	%i7
	fnand	%f14,	%f2,	%f12
	sub	%o6,	0x0D19,	%o5
	add	%g2,	0x04B0,	%l4
	call	loop_14
	fmul8ulx16	%f16,	%f28,	%f10
	fmovslg	%fcc0,	%f3,	%f10
	edge32	%l6,	%o4,	%i2
loop_14:
	call	loop_15
	orncc	%i6,	0x099F,	%g7
	addc	%i1,	0x046E,	%o0
	fmovda	%icc,	%f8,	%f18
loop_15:
	nop
	setx	0x4A20A606F1D93BB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x57607C5D01F5B67B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f0,	%f10
	fpsub32	%f0,	%f12,	%f0
	fpsub32s	%f26,	%f28,	%f18
	tcc	%xcc,	0x3
	call	loop_16
	subc	%o3,	0x070A,	%i0
	mulx	%i5,	%o7,	%o2
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f27
loop_16:
	edge8ln	%g4,	%l2,	%l5
	alignaddr	%o1,	%l0,	%l1
	fmovduge	%fcc2,	%f6,	%f4
	bneg	%icc,	loop_17
	call	loop_18
	movrgz	%l3,	%g6,	%g5
	srlx	%i3,	%g3,	%g1
loop_17:
	smulcc	%i4,	0x1CFF,	%i7
loop_18:
	fmovdl	%fcc1,	%f20,	%f12
	call	loop_19
	call	loop_20
	movvs	%icc,	0x3F6,	%o5
	fmovrdlz	%o6,	%f8,	%f22
loop_19:
	xnor	%g2,	%l6,	%o4
loop_20:
	umulcc	%i2,	0x1DED,	%i6
	bvc,pt	%icc,	loop_21
	tvc	%xcc,	0x2
	rdpr	%cleanwin,	%g7
	call	loop_22
loop_21:
	fcmpgt32	%f8,	%f20,	%i1
	nop
	fitos	%f29,	%f26
	fcmple16	%f22,	%f12,	%o0
loop_22:
	fmovdcc	%icc,	%f16,	%f16
	fmul8x16au	%f21,	%f6,	%f4
	tcc	%icc,	0x0
	brlez	%o3,	loop_23
	edge8l	%l4,	%i5,	%i0
	call	loop_24
	rdpr	%otherwin,	%o7
loop_23:
	fsrc2s	%f17,	%f25
	fornot1s	%f27,	%f27,	%f28
loop_24:
	fmovdle	%fcc1,	%f30,	%f12
	rdhpr	%hpstate,	%o2
	mulx	%g4,	0x08C6,	%l5
	brlez,a,pt	%o1,	loop_25
	fbo,a,pt	%fcc0,	loop_26
	brz	%l2,	loop_27
	mulx	%l0,	0x0318,	%l3
loop_25:
	fbn,pt	%fcc0,	loop_28
loop_26:
	rd	%ccr,	%g6
loop_27:
	call	loop_29
	fmovdul	%fcc2,	%f20,	%f24
loop_28:
	fbug	%fcc2,	loop_30
	call	loop_31
loop_29:
	ldx	[%l7 + 0x18],	%g5
	nop
	setx	0xB46E7A5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f20
loop_30:
	smul	%l1,	0x0A84,	%g3
loop_31:
	call	loop_32
	wr	%i3,	0x076E,	%y
	rdhpr	%hintp,	%i4
	tvc	%icc,	0x1
loop_32:
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f2
	sdivcc	%i7,	0x0B9A,	%o5
	tneg	%icc,	0x3
	fmovdul	%fcc3,	%f12,	%f26
	fmovsa	%icc,	%f30,	%f20
	fands	%f13,	%f13,	%f31
	movre	%g1,	%o6,	%l6
	fones	%f2
	popc	0x1A6C,	%o4
	bcs,a	%icc,	loop_33
	orncc	%g2,	%i2,	%i6
	call	loop_34
	bmask	%i1,	%g7,	%o3
loop_33:
	call	loop_35
	ldsb	[%l7 + 0x55],	%o0
loop_34:
	fmul8sux16	%f10,	%f28,	%f20
	rdhpr	%hintp,	%l4
loop_35:
	call	loop_36
	movrne	%i5,	%i0,	%o7
	brgez,a	%g4,	loop_37
	nop
	setx	0xDDBDD116D5A49370,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x7E357EC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f28,	%f14
loop_36:
	call	loop_38
	edge16l	%l5,	%o1,	%o2
loop_37:
	call	loop_39
	call	loop_40
loop_38:
	fmovrdlz	%l0,	%f12,	%f14
	smulcc	%l2,	0x011F,	%g6
loop_39:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g5
loop_40:
	call	loop_41
	movcs	%icc,	0x00A,	%l1
	call	loop_42
	taddcc	%g3,	0x1479,	%i3
loop_41:
	call	loop_43
	wrpr	%l3,	%i4,	%tick
loop_42:
	te	%icc,	0x6
	call	loop_44
loop_43:
	ldd	[%l7 + 0x20],	%f22
	fone	%f6
	fxnors	%f9,	%f3,	%f17
loop_44:
	rd	%softint,	%o5
	tleu	%xcc,	0x3
	fcmpd	%fcc3,	%f0,	%f20
	tge	%icc,	0x4
	call	loop_45
	brlz,a	%i7,	loop_46
	call	loop_47
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%o6
loop_45:
	call	loop_48
loop_46:
	edge8n	%l6,	%g1,	%o4
loop_47:
	call	loop_49
	call	loop_50
loop_48:
	call	loop_51
	fmovda	%fcc1,	%f24,	%f12
loop_49:
	fpsub16s	%f15,	%f27,	%f20
loop_50:
	fzeros	%f12
loop_51:
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	call	loop_52
	smul	%i2,	0x198C,	%g2
	tcs	%xcc,	0x7
	subcc	%i6,	%i1,	%o3
loop_52:
	subcc	%o0,	0x193C,	%g7
	fcmple32	%f16,	%f14,	%l4
	movcs	%xcc,	%i0,	%o7
	fand	%f26,	%f14,	%f6
	fmovrsne	%g4,	%f3,	%f27
	fcmpgt16	%f4,	%f14,	%i5
	fmovdu	%fcc1,	%f16,	%f2
	st	%f31,	[%l7 + 0x6C]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 10
!	Type a   	: 13
!	Type x   	: 1
!	Type cti   	: 52
!	Type f   	: 61
!	Type i   	: 63
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
	set	0xA,	%g1
	set	0x2,	%g2
	set	0xD,	%g3
	set	0xE,	%g4
	set	0x8,	%g5
	set	0xE,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x8,	%i1
	set	-0x8,	%i2
	set	-0x9,	%i3
	set	-0x2,	%i4
	set	-0xE,	%i5
	set	-0x8,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x3CFD7F45,	%l0
	set	0x2B5EB154,	%l1
	set	0x378F899B,	%l2
	set	0x0F88503F,	%l3
	set	0x2C61FA52,	%l4
	set	0x44069228,	%l5
	set	0x42137511,	%l6
	!# Output registers
	set	-0x1385,	%o0
	set	0x0596,	%o1
	set	-0x0EE5,	%o2
	set	-0x0446,	%o3
	set	0x119A,	%o4
	set	0x04B7,	%o5
	set	0x1803,	%o6
	set	-0x0622,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	rdpr	%tl,	%l5
	call	loop_53
	nop
	set	0x21, %l3
	stb	%o1,	[%l7 + %l3]
	orn	%o2,	0x0842,	%l0
	andn	%g6,	0x08AF,	%l2
loop_53:
	sth	%l1,	[%l7 + 0x12]
	movul	%fcc1,	%g5,	%g3
	call	loop_54
	fbuge,a,pt	%fcc1,	loop_55
	alignaddrl	%l3,	%i4,	%o5
	srlx	%i7,	0x1E,	%i3
loop_54:
	movneg	%icc,	0x76B,	%o6
loop_55:
	bshuffle	%f8,	%f2,	%f26
	fmovs	%f12,	%f23
	fmul8ulx16	%f16,	%f0,	%f30
	tsubcctv	%g1,	0x005D,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC42, 	%sys_tick_cmpr
	movrne	%o4,	%i6,	%i1
	edge16	%g2,	%o3,	%g7
	call	loop_56
	fbu,a	%fcc1,	loop_57
	call	loop_58
	stw	%l4,	[%l7 + 0x64]
loop_56:
	call	loop_59
loop_57:
	call	loop_60
loop_58:
	call	loop_61
	call	loop_62
loop_59:
	subc	%o0,	%o7,	%g4
loop_60:
	fxors	%f7,	%f28,	%f11
loop_61:
	call	loop_63
loop_62:
	fnands	%f29,	%f8,	%f21
	edge16l	%i5,	%i0,	%l5
	mova	%fcc1,	%o1,	%o2
loop_63:
	call	loop_64
	call	loop_65
	fcmpne16	%f0,	%f24,	%g6
	movne	%fcc0,	%l0,	%l2
loop_64:
	fcmped	%fcc0,	%f20,	%f26
loop_65:
	xnorcc	%l1,	%g3,	%l3
	call	loop_66
	fcmpes	%fcc0,	%f14,	%f27
	fors	%f13,	%f30,	%f28
	rd	%softint,	%i4
loop_66:
	fmovsue	%fcc0,	%f6,	%f0
	call	loop_67
	fmovsule	%fcc3,	%f16,	%f14
	sir	0x1B6B
	fmovdge	%icc,	%f22,	%f2
loop_67:
	call	loop_68
	fabsd	%f4,	%f0
	popc	%o5,	%i7
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f7
loop_68:
	tle	%xcc,	0x0
	addc	%g5,	0x12A2,	%o6
	nop
	setx	loop_69,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021400001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rd	%pc,	%g1
	subcc	%i3,	0x1C73,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_69:
	udiv	%i1,	0x17A8,	%l6
	call	loop_70
	fcmpgt32	%f10,	%f0,	%g2
	call	loop_71
	fone	%f16
loop_70:
	nop
	fitod	%f24,	%f22
	fmovdlg	%fcc1,	%f2,	%f24
loop_71:
	tn	%icc,	0x1
	smulcc	%o3,	0x0C1A,	%l4
	stbar
	call	loop_72
	call	loop_73
	call	loop_74
	rdpr	%gl,	%g7
loop_72:
	tcs	%xcc,	0x3
loop_73:
	call	loop_75
loop_74:
	call	loop_76
	movrgez	%o0,	0x363,	%g4
	fmovrde	%o7,	%f2,	%f24
loop_75:
	bcs,a	%xcc,	loop_77
loop_76:
	fnegs	%f5,	%f11
	tpos	%icc,	0x1
	movcc	%xcc,	%i0,	%l5
loop_77:
	call	loop_78
	fmovdn	%fcc0,	%f4,	%f28
	fmovsu	%fcc3,	%f19,	%f27
	call	loop_79
loop_78:
	call	loop_80
	movrgez	%i5,	%o1,	%g6
	rdpr	%canrestore,	%o2
loop_79:
	nop
	set	0x14, %i3
	stwa	%l0,	[%l7 + %i3] 0x88
loop_80:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA5E, 	%hsys_tick_cmpr
	call	loop_81
	fbe	%fcc0,	loop_82
	movo	%fcc0,	%l3,	%l2
	brlz,a	%o5,	loop_83
loop_81:
	tgu	%xcc,	0x2
loop_82:
	fnands	%f3,	%f12,	%f24
	prefetch	[%l7 + 0x64],	 4
loop_83:
	fbule,a	%fcc0,	loop_84
	call	loop_85
	be,pt	%xcc,	loop_86
	call	loop_87
loop_84:
	fandnot2s	%f3,	%f7,	%f12
loop_85:
	nop
	setx	0xCD3CE7E9F0D6253C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_86:
	call	loop_88
loop_87:
	fmovdu	%fcc2,	%f8,	%f6
	fmul8x16au	%f5,	%f24,	%f26
	tsubcc	%i4,	0x13D6,	%g5
loop_88:
	wrpr	%o6,	0x067D,	%pil
	fcmpgt16	%f8,	%f18,	%g1
	brlz	%i7,	loop_89
	edge16ln	%i2,	%i3,	%o4
	wrpr	%i1,	%l6,	%cwp
	edge32l	%g2,	%o3,	%l4
loop_89:
	brnz,pt	%i6,	loop_90
	movvc	%icc,	%g7,	%g4
	movl	%fcc2,	%o7,	%i0
	call	loop_91
loop_90:
	tsubcc	%l5,	0x0EAD,	%o0
	call	loop_92
	fbg,pt	%fcc2,	loop_93
loop_91:
	wr	%i5,	%g6,	%softint
	fpmerge	%f27,	%f7,	%f20
loop_92:
	fmovdug	%fcc2,	%f2,	%f24
loop_93:
	edge32l	%o2,	%l0,	%o1
	tn	%icc,	0x3
	array16	%l1,	%g3,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCCA, 	%sys_tick_cmpr
	edge16n	%g5,	%o6,	%i4
	tn	%icc,	0x6
	movrgez	%i7,	0x393,	%g1
	fnot1s	%f11,	%f12
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i2
	call	loop_94
	call	loop_95
	call	loop_96
	movu	%fcc2,	0x1DF,	%i3
loop_94:
	nop
	set	0x5C, %g3
	prefetch	[%l7 + %g3],	 0
loop_95:
	call	loop_97
loop_96:
	call	loop_98
	call	loop_99
	fmul8x16al	%f17,	%f0,	%f26
loop_97:
	call	loop_100
loop_98:
	call	loop_101
loop_99:
	tsubcc	%i1,	0x1135,	%l6
	call	loop_102
loop_100:
	fmovdlg	%fcc3,	%f18,	%f14
loop_101:
	call	loop_103
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_102:
	movle	%xcc,	%g2,	%o3
	call	loop_104
loop_103:
	fbule,a,pn	%fcc1,	loop_105
	fmovsvc	%icc,	%f9,	%f24
	fmovdvc	%icc,	%f26,	%f12
loop_104:
	taddcc	%l4,	%o4,	%i6
loop_105:
	fcmple16	%f12,	%f12,	%g4
	call	loop_106
	call	loop_107
	fmovsu	%fcc2,	%f7,	%f4
	fmovrsgz	%o7,	%f16,	%f26
loop_106:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_107:
	addcc	%i0,	%l5,	%o0
	nop
	setx	0x0BBDDAA3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x3BD23173,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f21,	%f26
	call	loop_108
	movne	%xcc,	%i5,	%g6
	fornot1s	%f10,	%f3,	%f1
	fmovscc	%xcc,	%f13,	%f30
loop_108:
	nop
	set	0x24, %o7
	lduwa	[%l7 + %o7] 0x04,	%o2
	call	loop_109
	fmovdle	%xcc,	%f14,	%f14
	call	loop_110
	fcmpeq16	%f16,	%f22,	%l0
loop_109:
	call	loop_111
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_110:
	fcmps	%fcc2,	%f30,	%f18
	call	loop_112
loop_111:
	fmovdge	%icc,	%f4,	%f28
	fsrc2s	%f2,	%f0
	fones	%f10
loop_112:
	call	loop_113
	nop
	setx	0xC469B2E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xFB210B37,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f29,	%f23
	fpadd16s	%f15,	%f25,	%f3
	wr	%g7,	0x08F3,	%sys_tick
loop_113:
	andcc	%o1,	%g3,	%l3
	rdhpr	%hsys_tick_cmpr,	%o5
	ba	%icc,	loop_114
	call	loop_115
	call	loop_116
	fcmpd	%fcc0,	%f26,	%f18
loop_114:
	fmovsg	%fcc1,	%f12,	%f30
loop_115:
	movrne	%l1,	0x2EC,	%g5
loop_116:
	fnegs	%f3,	%f19
	call	loop_117
	nop
	setx	0x1A887B22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	fmovsleu	%xcc,	%f0,	%f14
	wr	%g0,	0x89,	%asi
	stwa	%o6,	[%l7 + 0x18] %asi
loop_117:
	fcmple32	%f14,	%f20,	%i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 12
!	Type a   	: 14
!	Type x   	: 4
!	Type cti   	: 65
!	Type f   	: 53
!	Type i   	: 52
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
	set	0x5,	%g2
	set	0xC,	%g3
	set	0x3,	%g4
	set	0x6,	%g5
	set	0x2,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x3,	%i1
	set	-0xF,	%i2
	set	-0x8,	%i3
	set	-0xD,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x04F0A577,	%l0
	set	0x0A712EBE,	%l1
	set	0x4CD0990A,	%l2
	set	0x39B50DF1,	%l3
	set	0x0AC3F5C0,	%l4
	set	0x1A4E6D1D,	%l5
	set	0x3CF24EBB,	%l6
	!# Output registers
	set	0x18F2,	%o0
	set	-0x090F,	%o1
	set	-0x07BB,	%o2
	set	0x13BD,	%o3
	set	0x0FCA,	%o4
	set	-0x1C95,	%o5
	set	-0x1806,	%o6
	set	0x1549,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	rdhpr	%hintp,	%i7
	call	loop_118
	nop
	set	0x58, %i7
	std	%f10,	[%l7 + %i7]
	nop
	fitod	%f23,	%f8
	xor	%g1,	%i2,	%l2
loop_118:
	call	loop_119
	call	loop_120
	fxnors	%f15,	%f29,	%f20
	nop
	setx	0xDAF5E12D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xE270D3C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f19,	%f1
loop_119:
	popc	%i3,	%i1
loop_120:
	nop
	setx	loop_121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012200001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%xcc,	0x3
	lduw	[%l7 + 0x10],	%g2
	call	loop_122
loop_121:
	call	loop_123
	fpack16	%f26,	%f12
	call	loop_124
loop_122:
	nop
	setx	0x26294FEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xE2625461,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f20,	%f16
loop_123:
	fmovsleu	%icc,	%f11,	%f30
	call	loop_125
loop_124:
	call	loop_126
	call	loop_127
	fandnot2s	%f19,	%f23,	%f19
loop_125:
	call	loop_128
loop_126:
	call	loop_129
loop_127:
	fmuld8sux16	%f30,	%f29,	%f4
	call	loop_130
loop_128:
	edge32ln	%o3,	%l6,	%l4
loop_129:
	smulcc	%i6,	0x0AC9,	%g4
	fmovse	%icc,	%f19,	%f9
loop_130:
	fmovrdlez	%o7,	%f12,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_131
	call	loop_132
	fmovdn	%fcc0,	%f16,	%f16
	fmovda	%fcc2,	%f6,	%f12
loop_131:
	bshuffle	%f4,	%f6,	%f20
loop_132:
	udiv	%l5,	0x0CFD,	%i0
	fmovdpos	%icc,	%f24,	%f6
	subccc	%o0,	%g6,	%i5
	bpos,a,pt	%xcc,	loop_133
	fcmple32	%f28,	%f22,	%l0
	call	loop_134
	movuge	%fcc1,	%g7,	%o1
loop_133:
	movul	%fcc0,	0x66B,	%g3
	call	loop_135
loop_134:
	nop
	setx	0x96A5B4E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f24
	fmovsul	%fcc0,	%f6,	%f31

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18B, 	%hsys_tick_cmpr
loop_135:
	fcmpd	%fcc1,	%f0,	%f28
	fmul8x16al	%f30,	%f10,	%f26
	rd	%tick_cmpr,	%o5
	call	loop_136
	fornot1s	%f22,	%f17,	%f19
	call	loop_137
	fnands	%f18,	%f2,	%f17
loop_136:
	call	loop_138
	fmovscc	%icc,	%f29,	%f0
loop_137:
	tg	%xcc,	0x7
	fmovrdlz	%l3,	%f10,	%f14
loop_138:
	bg	%xcc,	loop_139
	fcmpgt32	%f6,	%f6,	%l1
	call	loop_140
	fcmple32	%f28,	%f30,	%o6
loop_139:
	bleu,a	%icc,	loop_141
	bcs,a,pn	%xcc,	loop_142
loop_140:
	bge,a	%icc,	loop_143
	call	loop_144
loop_141:
	fbue,a	%fcc1,	loop_145
loop_142:
	fmovrdlez	%i4,	%f24,	%f30
loop_143:
	mova	%icc,	0x085,	%g5
loop_144:
	fmul8ulx16	%f30,	%f10,	%f12
loop_145:
	fmovdg	%fcc2,	%f4,	%f20
	fcmpd	%fcc1,	%f12,	%f24
	call	loop_146
	fexpand	%f30,	%f16
	call	loop_147
	movuge	%fcc2,	%g1,	%i2
loop_146:
	call	loop_148
	call	loop_149
loop_147:
	fmovde	%xcc,	%f6,	%f14
	call	loop_150
loop_148:
	tl	%icc,	0x2
loop_149:
	fsrc1	%f8,	%f0
	call	loop_151
loop_150:
	call	loop_152
	fpadd16s	%f27,	%f8,	%f28
	xor	%l2,	0x14CD,	%i7
loop_151:
	call	loop_153
loop_152:
	sll	%i3,	%g2,	%o3
	call	loop_154
	call	loop_155
loop_153:
	edge32	%l6,	%i1,	%i6
	tvc	%icc,	0x6
loop_154:
	call	loop_156
loop_155:
	siam	0x5
	tcs	%icc,	0x0
	call	loop_157
loop_156:
	movl	%xcc,	%l4,	%g4
	addcc	%o4,	%o7,	%i0
	fmovdl	%icc,	%f2,	%f2
loop_157:
	ldsb	[%l7 + 0x64],	%o0
	nop
	setx	0xD36F3CC29DD6D30A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f30
	call	loop_158
	call	loop_159
	nop
	set	0x5C, %g5
	sth	%g6,	[%l7 + %g5]
	fmovsg	%icc,	%f7,	%f14
loop_158:
	udivx	%i5,	0x03C9,	%l0
loop_159:
	fmovs	%f26,	%f14
	fmovdue	%fcc2,	%f4,	%f2
	fmovdn	%fcc3,	%f12,	%f30
	call	loop_160
	call	loop_161
	subccc	%l5,	0x1DC8,	%g7
	wr 	%g0, 	0x5, 	%fprs
loop_160:
	fmovdcc	%icc,	%f8,	%f20
loop_161:
	fmuld8sux16	%f26,	%f28,	%f16
	call	loop_162
	movre	%o1,	0x249,	%o5
	nop
	set	0x5A, %o5
	sth	%l3,	[%l7 + %o5]
	call	loop_163
loop_162:
	movrgez	%l1,	0x02B,	%i4
	call	loop_164
	fmul8x16au	%f0,	%f28,	%f18
loop_163:
	fcmpgt16	%f8,	%f24,	%g5
	rd	%tick_cmpr,	%g1
loop_164:
	tn	%icc,	0x1
	fmovdo	%fcc1,	%f16,	%f26
	rdhpr	%hintp,	%i2
	fone	%f12
	call	loop_165
	fmovsle	%fcc3,	%f16,	%f16
	fnand	%f30,	%f0,	%f0
	fcmpgt32	%f28,	%f20,	%l2
loop_165:
	rd	%pc,	%i7
	or	%o6,	%g2,	%i3
	call	loop_166
	call	loop_167
	move	%xcc,	%l6,	%i1
	call	loop_168
loop_166:
	fsrc2s	%f18,	%f26
loop_167:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x28] %asi,	%o3
loop_168:
	call	loop_169
	call	loop_170
	call	loop_171
	nop
	setx	0xCB96DF7B7BBB5FB9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x5B9FAF1E2E6EC5A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f12,	%f16
loop_169:
	fmovsleu	%xcc,	%f4,	%f6
loop_170:
	nop
	fitos	%f3,	%f14
	fstoi	%f14,	%f1
loop_171:
	movpos	%xcc,	0x763,	%i6
	nop
	setx	0xB62640C1DD11DA71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x26AE0DF7A9662CA2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f24,	%f2
	call	loop_172
	fpack32	%f6,	%f14,	%f10
	wrpr	%l4,	0x0930,	%cwp
	nop
	fitod	%f2,	%f24
	fdtos	%f24,	%f22
loop_172:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g4
	movu	%fcc1,	0x622,	%o7
	fmul8sux16	%f4,	%f14,	%f22
	array16	%o0,	%g6,	%i0
	call	loop_173
	fpmerge	%f19,	%f17,	%f30
	nop
	setx	0x2F838B7AD60C68C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x153D1B0B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f20,	%f2
	rd	%y,	%l0
loop_173:
	fpsub32	%f24,	%f0,	%f28
	nop
	setx	0x12AF,	%l0,	%g7
	sdiv	%i5,	%g7,	%l5
	ta	%xcc,	0x4
	brlez	%g3,	loop_174
	call	loop_175
	umulcc	%o1,	0x1B03,	%o2
	movrne	%l3,	%l1,	%o5
loop_174:
	movlg	%fcc2,	%i4,	%g1
loop_175:
	edge32l	%g5,	%i2,	%l2
	call	loop_176
	rd	%pc,	%o6
	movrgz	%i7,	%g2,	%l6
	call	loop_177
loop_176:
	fcmpne16	%f2,	%f12,	%i1
	fmovsvc	%icc,	%f14,	%f22
	fmovdle	%fcc0,	%f18,	%f14
loop_177:
	fmovs	%f21,	%f8
	rdpr	%tl,	%o3
	rdhpr	%htba,	%i3
	edge8	%l4,	%o4,	%i6
	nop
	setx	0xC5A561A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xC3A245A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f24,	%f17
	call	loop_178
	fnegs	%f20,	%f10
	fcmpne32	%f18,	%f4,	%o7
	call	loop_179
loop_178:
	orn	%g4,	%g6,	%i0
	xnorcc	%o0,	%l0,	%g7
	call	loop_180
loop_179:
	subc	%i5,	%l5,	%o1
	set	0x50, %o3
	ldsha	[%l7 + %o3] 0x18,	%o2
loop_180:
	call	loop_181
	fandnot2	%f26,	%f2,	%f16
	rdpr	%tl,	%g3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l1,	%l3
loop_181:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 9
!	Type a   	: 14
!	Type x   	: 4
!	Type cti   	: 64
!	Type f   	: 68
!	Type i   	: 41
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
	set	0x7,	%g2
	set	0x6,	%g3
	set	0x9,	%g4
	set	0xE,	%g5
	set	0xF,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x2,	%i1
	set	-0xE,	%i2
	set	-0x1,	%i3
	set	-0x9,	%i4
	set	-0xE,	%i5
	set	-0x2,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x1800A53B,	%l0
	set	0x12F4FE6F,	%l1
	set	0x2C04863C,	%l2
	set	0x622E5E90,	%l3
	set	0x156B1241,	%l4
	set	0x2C24BF42,	%l5
	set	0x1D50E749,	%l6
	!# Output registers
	set	-0x1C9C,	%o0
	set	0x1EEF,	%o1
	set	0x0C86,	%o2
	set	-0x0016,	%o3
	set	0x17E1,	%o4
	set	0x069C,	%o5
	set	0x10DF,	%o6
	set	-0x18C6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	call	loop_182
	alignaddr	%i4,	%o5,	%g5
	edge32n	%i2,	%g1,	%l2
	call	loop_183
loop_182:
	fmovrde	%i7,	%f8,	%f18
	fpadd32	%f28,	%f14,	%f22
	bpos,a,pt	%icc,	loop_184
loop_183:
	fbe	%fcc1,	loop_185
	fpack32	%f14,	%f22,	%f0
	fmovrdlz	%g2,	%f22,	%f4
loop_184:
	fmovsu	%fcc3,	%f15,	%f12
loop_185:
	call	loop_186
	sra	%l6,	%i1,	%o6
	call	loop_187
	call	loop_188
loop_186:
	call	loop_189
	edge16	%i3,	%o3,	%l4
loop_187:
	edge16n	%o4,	%o7,	%g4
loop_188:
	fornot1	%f16,	%f16,	%f12
loop_189:
	bleu,a,pn	%icc,	loop_190
	call	loop_191
	call	loop_192
	call	loop_193
loop_190:
	fcmpeq32	%f10,	%f24,	%i6
loop_191:
	tvs	%xcc,	0x7
loop_192:
	fmovscc	%xcc,	%f7,	%f28
loop_193:
	wr	%g6,	0x06B8,	%set_softint
	edge16ln	%o0,	%i0,	%g7
	srlx	%l0,	%i5,	%o1
	brlez,a	%l5,	loop_194
	movle	%fcc2,	%o2,	%g3
	fmovsuge	%fcc3,	%f4,	%f9
	fxors	%f16,	%f14,	%f2
loop_194:
	xnorcc	%l3,	0x1920,	%i4
	movrgez	%l1,	%g5,	%i2
	xnor	%o5,	0x1872,	%g1
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f10
	call	loop_195
	pdist	%f16,	%f28,	%f10
	rdpr	%tba,	%i7
	fmul8sux16	%f30,	%f0,	%f4
loop_195:
	call	loop_196
	fnors	%f2,	%f22,	%f29
	andncc	%g2,	%l2,	%l6
	movne	%icc,	0x4B4,	%i1
loop_196:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	mova	%fcc3,	%i3,	%o6
	fmovdo	%fcc1,	%f2,	%f0
	srl	%o3,	0x00,	%l4
	fandnot1	%f20,	%f6,	%f12
	sub	%o7,	0x0304,	%o4
	fmovs	%f1,	%f24
	nop
	set	0x40, %l1
	stw	%i6,	[%l7 + %l1]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcc	%xcc,	0x6
	fmovs	%f16,	%f25
	fbo,a	%fcc1,	loop_197
	fpsub16s	%f9,	%f22,	%f2
	call	loop_198
	movleu	%xcc,	0x6CC,	%o0
loop_197:
	movu	%fcc0,	0x7A7,	%g6
	call	loop_199
loop_198:
	fcmpd	%fcc3,	%f18,	%f4
	call	loop_200
	nop
	set	0x44, %l2
	prefetch	[%l7 + %l2],	 4
loop_199:
	call	loop_201
	nop
	set	0x78, %i2
	lduw	[%l7 + %i2],	%i0
loop_200:
	fmovsvs	%icc,	%f7,	%f9
	call	loop_202
loop_201:
	edge16l	%l0,	%i5,	%o1
	fnands	%f22,	%f1,	%f1
	call	loop_203
loop_202:
	fmovduge	%fcc3,	%f12,	%f2
	call	loop_204
	call	loop_205
loop_203:
	call	loop_206
	array8	%l5,	%g7,	%o2
loop_204:
	nop
	setx	0x890B701B235CB019,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC60CE051788A7E0B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f0,	%f12
loop_205:
	brz,a,pn	%l3,	loop_207
loop_206:
	fpsub16s	%f29,	%f2,	%f14
	rd	%asi,	%i4
	fandnot2s	%f24,	%f20,	%f10
loop_207:
	bg,a	%xcc,	loop_208
	fmovsge	%fcc2,	%f5,	%f27
	call	loop_209
	call	loop_210
loop_208:
	call	loop_211
	te	%xcc,	0x7
loop_209:
	call	loop_212
loop_210:
	tneg	%xcc,	0x5
loop_211:
	addc	%g3,	0x18DA,	%g5
	call	loop_213
loop_212:
	fmovsleu	%icc,	%f28,	%f21
	tsubcctv	%l1,	0x14C5,	%i2
	call	loop_214
loop_213:
	call	loop_215
	subccc	%o5,	%i7,	%g2
	call	loop_216
loop_214:
	edge32l	%g1,	%l6,	%l2
loop_215:
	membar	0x50
	fmovsne	%xcc,	%f17,	%f8
loop_216:
	fnands	%f24,	%f29,	%f16
	movvc	%icc,	0x155,	%i3
	nop
	set	0x38, %l4
	stx	%fsr,	[%l7 + %l4]
	call	loop_217
	call	loop_218
	sub	%o6,	0x1369,	%o3
	fmovdvc	%icc,	%f14,	%f0
loop_217:
	addccc	%l4,	%i1,	%o7
loop_218:
	fmovsg	%xcc,	%f28,	%f27
	call	loop_219
	bge,a,pt	%xcc,	loop_220
	sub	%i6,	%g4,	%o4
	call	loop_221
loop_219:
	fnegd	%f4,	%f26
loop_220:
	fmovrde	%o0,	%f24,	%f2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x1C] %asi,	%f4
loop_221:
	movcs	%icc,	%i0,	%g6
	call	loop_222
	fmovdcc	%xcc,	%f26,	%f18
	call	loop_223
	ble	%xcc,	loop_224
loop_222:
	call	loop_225
	call	loop_226
loop_223:
	tne	%xcc,	0x7
loop_224:
	edge32ln	%l0,	%i5,	%l5
loop_225:
	call	loop_227
loop_226:
	wrpr	%o1,	%g7,	%tick
	call	loop_228
	edge16l	%l3,	%o2,	%g3
loop_227:
	call	loop_229
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f24
	fxtos	%f24,	%f22
loop_228:
	sra	%g5,	0x1F,	%l1
	edge32ln	%i4,	%o5,	%i2
loop_229:
	call	loop_230
	call	loop_231
	rdhpr	%hsys_tick_cmpr,	%g2
	rdhpr	%htba,	%g1
loop_230:
	sdivx	%l6,	0x1CCE,	%l2
loop_231:
	nop
	setx	0x6FBF3D62C150C094,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x419278B1C49AE531,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f0,	%f20
	call	loop_232
	movlg	%fcc0,	%i3,	%i7
	call	loop_233
	call	loop_234
loop_232:
	fcmpgt16	%f20,	%f6,	%o3
	fxors	%f21,	%f15,	%f27
loop_233:
	fnot2s	%f6,	%f29
loop_234:
	bvs,a	%icc,	loop_235
	fmovse	%fcc3,	%f12,	%f30
	fnor	%f4,	%f20,	%f14
	sra	%o6,	%i1,	%l4
loop_235:
	movule	%fcc1,	%i6,	%o7
	move	%icc,	%o4,	%o0
	nop
	set	0x18, %i1
	std	%f26,	[%l7 + %i1]
	fnot1	%f24,	%f2
	rd	%fprs,	%i0
	call	loop_236
	movug	%fcc2,	0x06B,	%g6
	fpsub32	%f8,	%f12,	%f16
	fnor	%f0,	%f22,	%f16
loop_236:
	tneg	%icc,	0x0
	call	loop_237
	fmul8ulx16	%f14,	%f28,	%f28
	call	loop_238
	edge16n	%g4,	%i5,	%l0
loop_237:
	fone	%f20
	bleu,a	%icc,	loop_239
loop_238:
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f3
	udiv	%l5,	0x121F,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o1,	%l3
loop_239:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x19,	%o2,	%g3
	wr	%g0,	0x04,	%asi
	stda	%l0,	[%l7 + 0x70] %asi
	call	loop_240
	srax	%g5,	%o5,	%i4
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x22,	%i2
loop_240:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g2
	call	loop_241
	wr	%g1,	0x00EF,	%y
	call	loop_242
	edge16	%l2,	%l6,	%i7
loop_241:
	sllx	%o3,	0x02,	%i3
	rdpr	%cansave,	%i1
loop_242:
	fcmpeq32	%f6,	%f24,	%l4
	fbo,pt	%fcc2,	loop_243
	fmovsle	%icc,	%f1,	%f7
	fmul8x16	%f3,	%f28,	%f14
	movrlz	%o6,	%o7,	%o4
loop_243:
	call	loop_244
	fmovsul	%fcc3,	%f7,	%f6
	call	loop_245
	fxnor	%f12,	%f10,	%f2
loop_244:
	fmovdleu	%icc,	%f22,	%f12
	fmuld8sux16	%f9,	%f13,	%f22
loop_245:
	wr	%i6,	0x17EE,	%sys_tick
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 11
!	Type a   	: 11
!	Type x   	: 6
!	Type cti   	: 64
!	Type f   	: 55
!	Type i   	: 53
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
	set	0x2,	%g1
	set	0x7,	%g2
	set	0x0,	%g3
	set	0x6,	%g4
	set	0x3,	%g5
	set	0x6,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x3,	%i1
	set	-0x1,	%i2
	set	-0x5,	%i3
	set	-0x4,	%i4
	set	-0xA,	%i5
	set	-0x3,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x3870AF8F,	%l0
	set	0x2BBFDC06,	%l1
	set	0x12F214ED,	%l2
	set	0x0A0467B0,	%l3
	set	0x3A3DC0C2,	%l4
	set	0x5BCE9762,	%l5
	set	0x51E677C6,	%l6
	!# Output registers
	set	-0x1471,	%o0
	set	0x0045,	%o1
	set	0x0FD0,	%o2
	set	-0x012E,	%o3
	set	0x1AA0,	%o4
	set	-0x0B09,	%o5
	set	-0x0B7E,	%o6
	set	-0x0450,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	call	loop_246
	fmovdle	%xcc,	%f10,	%f6
	movuge	%fcc3,	0x09C,	%o0
	bpos,a	%xcc,	loop_247
loop_246:
	tne	%xcc,	0x3
	wrpr	%i0,	0x0F03,	%pil
	rdhpr	%ver,	%g6
loop_247:
	bg,a,pt	%xcc,	loop_248
	or	%g4,	0x18BB,	%i5
	nop
	setx	0xB8C234EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	rdpr	%canrestore,	%l0
loop_248:
	fpsub16s	%f5,	%f14,	%f19
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g6
	fmovdpos	%icc,	%f16,	%f24
	fmovd	%f22,	%f10
	call	loop_249
	call	loop_250
	tleu	%xcc,	0x6
	call	loop_251
loop_249:
	nop
	set	0x20, %l5
	lduh	[%l7 + %l5],	%o1
loop_250:
	call	loop_252
	fmovdug	%fcc2,	%f24,	%f16
loop_251:
	bcs,a	%icc,	loop_253
	brz	%l5,	loop_254
loop_252:
	array32	%o2,	%l3,	%g3
	call	loop_255
loop_253:
	wr	%g5,	%o5,	%sys_tick
loop_254:
	fmovrsgez	%l1,	%f4,	%f29
	ta	%icc,	0x0
loop_255:
	sethi	0x1614,	%i2
	call	loop_256
	fbe,a,pn	%fcc0,	loop_257
	fmovsle	%xcc,	%f28,	%f6
	fmovdlg	%fcc1,	%f14,	%f6
loop_256:
	fcmpgt32	%f18,	%f8,	%g2
loop_257:
	call	loop_258
	srax	%g1,	0x12,	%l2
	fpadd16s	%f20,	%f6,	%f27
	set	0x40, %o4
	stwa	%l6,	[%l7 + %o4] 0xeb
	membar	#Sync
loop_258:
	wrpr	%i7,	%o3,	%pil
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f28
	fpadd16s	%f18,	%f22,	%f15
	call	loop_259
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdpos	%icc,	%f6,	%f12
	wr	%i4,	0x18F5,	%set_softint
loop_259:
	nop
	set	0x68, %g4
	std	%i2,	[%l7 + %g4]
	tneg	%icc,	0x7
	bleu,a	%xcc,	loop_260
	wrpr	%i1,	%l4,	%cwp
	fmul8x16au	%f5,	%f4,	%f10
	edge16l	%o7,	%o4,	%i6
loop_260:
	fmovsl	%xcc,	%f23,	%f14
	call	loop_261
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_262
	call	loop_263
loop_261:
	fpsub16	%f18,	%f26,	%f20
	fornot1s	%f17,	%f1,	%f10
loop_262:
	fnor	%f8,	%f20,	%f2
loop_263:
	movrgz	%o0,	%g4,	%g6
	call	loop_264
	fabss	%f3,	%f8
	fmovrsgz	%l0,	%f19,	%f22
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 3
loop_264:
	fcmpgt32	%f2,	%f8,	%i5
	fbn,a,pt	%fcc2,	loop_265
	call	loop_266
	call	loop_267
	call	loop_268
loop_265:
	call	loop_269
loop_266:
	call	loop_270
loop_267:
	array32	%o1,	%l5,	%l3
loop_268:
	call	loop_271
loop_269:
	call	loop_272
loop_270:
	call	loop_273
	call	loop_274
loop_271:
	call	loop_275
loop_272:
	call	loop_276
loop_273:
	flushw
loop_274:
	mulx	%g3,	%g5,	%o2
loop_275:
	fbug	%fcc2,	loop_277
loop_276:
	fmul8x16au	%f7,	%f17,	%f16
	ble,pn	%xcc,	loop_278
	call	loop_279
loop_277:
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f12
	subccc	%l1,	%i2,	%g2
loop_278:
	tvc	%xcc,	0x3
loop_279:
	fmovduge	%fcc0,	%f22,	%f30
	call	loop_280
	andncc	%g1,	0x0A3F,	%l2
	fnand	%f8,	%f4,	%f22
	call	loop_281
loop_280:
	fxnors	%f30,	%f23,	%f24
	wrpr	%l6,	0x12FF,	%pil
	fmovsug	%fcc1,	%f26,	%f5
loop_281:
	sll	%i7,	%o5,	%o3
	movrgez	%i4,	0x039,	%i1
	nop
	set	0x6C, %o6
	stb	%i3,	[%l7 + %o6]
	fmul8x16au	%f26,	%f4,	%f16
	srl	%l4,	%o4,	%i6
	bvc,a	%xcc,	loop_282
	fbule,a,pn	%fcc1,	loop_283
	swap	[%l7 + 0x54],	%o7
	fmovsue	%fcc3,	%f20,	%f0
loop_282:
	subccc	%i0,	0x18DD,	%o6
loop_283:
	movgu	%xcc,	0x17B,	%o0
	fpadd16s	%f7,	%f31,	%f11
	fcmple32	%f0,	%f26,	%g4
	and	%l0,	0x132B,	%g6
	smul	%g7,	0x121C,	%i5
	prefetch	[%l7 + 0x24],	 1
	bge,a,pn	%xcc,	loop_284
	fmovduge	%fcc0,	%f18,	%f18
	fone	%f22
	fcmple16	%f18,	%f30,	%o1
loop_284:
	fabss	%f11,	%f15
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l5
	edge8l	%g3,	%l3,	%g5
	fmovsle	%fcc3,	%f9,	%f2
	fcmpeq32	%f20,	%f14,	%o2
	call	loop_285
	fmovs	%f19,	%f25
	bneg,a	%icc,	loop_286
	call	loop_287
loop_285:
	tcs	%icc,	0x5
	andn	%i2,	%g2,	%g1
loop_286:
	nop
	fitos	%f23,	%f0
loop_287:
	movuge	%fcc1,	0x2AA,	%l2
	bge,a,pt	%icc,	loop_288
	fcmpeq32	%f8,	%f16,	%l6
	bne,a	%icc,	loop_289
	fsrc1	%f20,	%f8
loop_288:
	fmovrsgz	%i7,	%f20,	%f21
	fba,pt	%fcc2,	loop_290
loop_289:
	call	loop_291
	call	loop_292
	movn	%icc,	0x3B4,	%o5
loop_290:
	movrgz	%o3,	%i4,	%l1
loop_291:
	fmovdlg	%fcc3,	%f28,	%f14
loop_292:
	fmovdo	%fcc1,	%f20,	%f16
	tle	%icc,	0x5
	wr 	%g0, 	0x7, 	%fprs
	tl	%xcc,	0x3
	fcmpeq16	%f14,	%f28,	%i1
	ldub	[%l7 + 0x36],	%o4
	call	loop_293
	fmovrslez	%o7,	%f22,	%f13
	call	loop_294
	call	loop_295
loop_293:
	nop
	set	0x20, %g6
	stx	%i0,	[%l7 + %g6]
	fands	%f20,	%f25,	%f16
loop_294:
	nop
	fitos	%f29,	%f13
loop_295:
	fcmpgt32	%f6,	%f4,	%i6
	fones	%f20
	fcmple16	%f26,	%f28,	%o0
	orcc	%o6,	%g4,	%g6
	movcc	%xcc,	0x30D,	%g7
	fsrc1	%f6,	%f24
	call	loop_296
	call	loop_297
	nop
	set	0x58, %l0
	std	%f30,	[%l7 + %l0]
	array8	%l0,	%o1,	%i5
loop_296:
	tleu	%icc,	0x2
loop_297:
	rdpr	%tl,	%l5
	rdpr	%tba,	%l3
	fmovsvc	%xcc,	%f20,	%f27
	call	loop_298
	call	loop_299
	fmul8x16	%f7,	%f12,	%f18
	wr	%g3,	0x0AAF,	%sys_tick
loop_298:
	fmovsul	%fcc0,	%f11,	%f19
loop_299:
	nop
	setx	0x53CE45B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x61232FE3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f19,	%f28
	sll	%g5,	0x0D,	%i2
	rd	%pc,	%o2
	movcc	%icc,	0x2F9,	%g1
	call	loop_300
	call	loop_301
	call	loop_302
	call	loop_303
loop_300:
	call	loop_304
loop_301:
	call	loop_305
loop_302:
	call	loop_306
loop_303:
	call	loop_307
loop_304:
	sir	0x145B
loop_305:
	fmovrse	%g2,	%f5,	%f7
loop_306:
	rdhpr	%hpstate,	%l2
loop_307:
	nop
	setx loop_308, %l0, %l1
	jmpl %l1, %l6
	movle	%icc,	0x143,	%o5
	movuge	%fcc3,	%o3,	%i7
	wr	%i4,	%i3,	%ccr
loop_308:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x62B, 	%hsys_tick_cmpr
	call	loop_309
	call	loop_310
	movrgez	%l1,	0x07D,	%i1
	fpack32	%f30,	%f16,	%f24
loop_309:
	nop

loop_310:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 13
!	Type a   	: 17
!	Type x   	: 3
!	Type cti   	: 65
!	Type f   	: 58
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
	set	0xD,	%g1
	set	0x2,	%g2
	set	0x5,	%g3
	set	0x9,	%g4
	set	0xD,	%g5
	set	0xF,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xF,	%i1
	set	-0xC,	%i2
	set	-0x8,	%i3
	set	-0xB,	%i4
	set	-0x1,	%i5
	set	-0x3,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x29DF13DF,	%l0
	set	0x52C098AC,	%l1
	set	0x7FCA28F9,	%l2
	set	0x1C201124,	%l3
	set	0x192D7ADD,	%l4
	set	0x060346AF,	%l5
	set	0x1B1AD7BB,	%l6
	!# Output registers
	set	0x0365,	%o0
	set	0x0093,	%o1
	set	-0x073C,	%o2
	set	0x1FDB,	%o3
	set	0x187F,	%o4
	set	-0x1D77,	%o5
	set	0x078C,	%o6
	set	-0x1BEE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	fmovdge	%xcc,	%f10,	%f2
	edge8l	%o7,	%i0,	%o4
	edge32n	%o0,	%i6,	%g4
	set	0x30, %o1
	lduwa	[%l7 + %o1] 0x81,	%g6
	rdpr	%tba,	%o6
	rdpr	%wstate,	%g7
	fmovrslez	%o1,	%f10,	%f14
	call	loop_311
	fnot1s	%f5,	%f11
	call	loop_312
	fpackfix	%f18,	%f0
loop_311:
	stbar
	fcmpne16	%f0,	%f30,	%l0
loop_312:
	nop
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x27,	%l4
	udivcc	%l3,	0x1A1D,	%i5
	udiv	%g5,	0x1C70,	%i2
	fpmerge	%f7,	%f25,	%f18
	call	loop_313
	fbe,a	%fcc0,	loop_314
	fcmpgt32	%f2,	%f22,	%o2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_313:
	call	loop_315
loop_314:
	movvc	%xcc,	0x4C7,	%g3
	fandnot1s	%f7,	%f24,	%f22
	alignaddrl	%g1,	%g2,	%l6
loop_315:
	call	loop_316
	call	loop_317
	call	loop_318
	call	loop_319
loop_316:
	fmovdule	%fcc0,	%f8,	%f20
loop_317:
	call	loop_320
loop_318:
	smul	%o5,	%l2,	%o3
loop_319:
	fones	%f3
	fnot1	%f14,	%f20
loop_320:
	fmovsue	%fcc1,	%f25,	%f3
	call	loop_321
	movlg	%fcc0,	0x045,	%i7
	tcc	%xcc,	0x2
	fnot2s	%f26,	%f2
loop_321:
	movleu	%icc,	0x73A,	%i4
	call	loop_322
	fornot1	%f6,	%f24,	%f6
	movl	%fcc3,	0x41D,	%l4
	andncc	%i3,	0x1450,	%l1
loop_322:
	fmovrdlz	%o7,	%f6,	%f16
	fnands	%f1,	%f24,	%f4
	andncc	%i1,	0x1904,	%o4
	movvs	%icc,	0x69E,	%i0
	movule	%fcc2,	0x0E8,	%i6
	edge16	%g4,	%o0,	%o6
	fmovrsgz	%g6,	%f22,	%f15
	fpmerge	%f16,	%f20,	%f30
	nop
	setx	0x0771,	%l0,	%o1
	udivcc	%g7,	%o1,	%l0
	array16	%l5,	%l3,	%i5
	call	loop_323
	call	loop_324
	fmovsle	%fcc3,	%f1,	%f14
	wr	%i2,	0x1671,	%softint
loop_323:
	fpadd32s	%f15,	%f30,	%f20
loop_324:
	subccc	%o2,	0x04A6,	%g3
	taddcc	%g1,	%g5,	%g2
	fcmpne32	%f20,	%f28,	%l6
	call	loop_325
	call	loop_326
	addc	%l2,	%o5,	%i7
	sir	0x1BC2
loop_325:
	call	loop_327
loop_326:
	call	loop_328
	call	loop_329
	call	loop_330
loop_327:
	movrlz	%o3,	%i4,	%l4
loop_328:
	call	loop_331
loop_329:
	fbge,a	%fcc0,	loop_332
loop_330:
	fmovrdgez	%l1,	%f10,	%f28
	call	loop_333
loop_331:
	call	loop_334
loop_332:
	orncc	%i3,	%o7,	%o4
	tleu	%xcc,	0x6
loop_333:
	call	loop_335
loop_334:
	wr	%i0,	0x15E9,	%sys_tick
	call	loop_336
	bg	%icc,	loop_337
loop_335:
	fmovdle	%icc,	%f12,	%f24
	movl	%fcc0,	0x09C,	%i6
loop_336:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_337:
	call	loop_338
	fmovdleu	%xcc,	%f2,	%f16
	call	loop_339
	fandnot2	%f0,	%f2,	%f8
loop_338:
	call	loop_340
	fmovdul	%fcc3,	%f30,	%f22
loop_339:
	add	%g4,	%o0,	%i1
	call	loop_341
loop_340:
	taddcc	%g6,	%g7,	%o6
	fcmpgt32	%f8,	%f2,	%l0
	fsrc2	%f30,	%f28
loop_341:
	fmovrslz	%l5,	%f17,	%f25
	stw	%o1,	[%l7 + 0x0C]
	fcmped	%fcc3,	%f28,	%f18
	fcmped	%fcc1,	%f0,	%f18
	call	loop_342
	nop
	setx	0xCEAC0B5EC6446EBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	call	loop_343
	fnand	%f20,	%f12,	%f0
loop_342:
	ldd	[%l7 + 0x28],	%l2
	flushw
loop_343:
	fmovsge	%fcc2,	%f1,	%f3
	andcc	%i2,	0x157B,	%i5
	array8	%o2,	%g3,	%g1
	movpos	%icc,	%g5,	%l6
	fmuld8sux16	%f9,	%f9,	%f26
	call	loop_344
	fmovsl	%fcc1,	%f9,	%f21
	addcc	%g2,	%l2,	%i7
	mulscc	%o3,	0x19AB,	%o5
loop_344:
	call	loop_345
	fmovdue	%fcc2,	%f10,	%f26
	fcmpeq32	%f0,	%f24,	%i4
	fmovse	%fcc3,	%f4,	%f21
loop_345:
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f12
	fxtos	%f12,	%f22
	brnz,pn	%l4,	loop_346
	wrpr	%i3,	%o7,	%cwp
	add	%o4,	0x1830,	%i0
	movu	%fcc3,	%l1,	%i6
loop_346:
	call	loop_347
	sethi	0x0E3B,	%o0
	call	loop_348
	call	loop_349
loop_347:
	subc	%i1,	%g6,	%g7
	orn	%o6,	0x1FCC,	%g4
loop_348:
	call	loop_350
loop_349:
	call	loop_351
	edge16	%l5,	%o1,	%l0
	ld	[%l7 + 0x08],	%f13
loop_350:
	fandnot2	%f24,	%f4,	%f16
loop_351:
	bvs,a,pt	%icc,	loop_352
	for	%f10,	%f16,	%f28
	movcc	%xcc,	%l3,	%i2
	rd	%y,	%i5
loop_352:
	call	loop_353
	fpsub32s	%f13,	%f19,	%f11
	fble,a,pn	%fcc1,	loop_354
	fmovrsne	%g3,	%f27,	%f23
loop_353:
	call	loop_355
	fornot2	%f28,	%f14,	%f2
loop_354:
	fornot2	%f14,	%f24,	%f2
	call	loop_356
loop_355:
	edge32ln	%g1,	%o2,	%l6
	addc	%g2,	%l2,	%g5
	fmovsu	%fcc3,	%f16,	%f19
loop_356:
	andn	%o3,	0x0FFD,	%o5
	nop
	setx	0x97021558,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	wr	%i4,	0x1E81,	%ccr
	srlx	%i7,	0x1B,	%l4
	movne	%fcc0,	0x4BA,	%i3
	fands	%f27,	%f27,	%f30
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0
	addcc	%i0,	0x0B5D,	%o4
	brnz	%l1,	loop_357
	fnand	%f16,	%f10,	%f6
	fpmerge	%f8,	%f23,	%f20
	fmovrdlz	%o0,	%f14,	%f8
loop_357:
	call	loop_358
	call	loop_359
	fornot1	%f8,	%f4,	%f18
	call	loop_360
loop_358:
	call	loop_361
loop_359:
	fbe,a	%fcc2,	loop_362
	for	%f14,	%f20,	%f16
loop_360:
	fmovdlg	%fcc1,	%f30,	%f8
loop_361:
	rdpr	%cansave,	%i1
loop_362:
	nop
	setx	0xF38055BE4F5CFC85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x561ECD95A2A97D11,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f24
	taddcctv	%g6,	0x10E8,	%i6
	tcs	%icc,	0x2
	edge16n	%o6,	%g4,	%l5
	addc	%o1,	%l0,	%g7
	fbu,a	%fcc3,	loop_363
	st	%f27,	[%l7 + 0x30]
	stw	%l3,	[%l7 + 0x5C]
	fmovsl	%icc,	%f19,	%f14
loop_363:
	tn	%xcc,	0x0
	rdpr	%tba,	%i5
	edge8	%g3,	%g1,	%o2
	wr	%l6,	0x1B00,	%clear_softint
	rdpr	%tl,	%g2
	call	loop_364
	nop
	setx	loop_365,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014400001404,	%l0,	%l1
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
	fandnot1s	%f13,	%f22,	%f15
	brnz	%i2,	loop_366
loop_364:
	sll	%g5,	0x06,	%l2
loop_365:
	call	loop_367
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f17
loop_366:
	nop
	setx	0xFD9A70F6B2CE5058,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x12B08D1F1E582377,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f18,	%f20
	fbge	%fcc3,	loop_368
loop_367:
	wr 	%g0, 	0x4, 	%fprs
	edge32n	%i7,	%o3,	%i3
	call	loop_369
loop_368:
	nop

loop_369:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 11
!	Type a   	: 12
!	Type cti   	: 59
!	Type x   	: 3
!	Type f   	: 58
!	Type i   	: 57
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
	set	0xF,	%g2
	set	0x3,	%g3
	set	0xE,	%g4
	set	0xC,	%g5
	set	0x9,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xF,	%i1
	set	-0xC,	%i2
	set	-0x8,	%i3
	set	-0xE,	%i4
	set	-0x0,	%i5
	set	-0x1,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x588699C1,	%l0
	set	0x5EA636C3,	%l1
	set	0x7EA38A5D,	%l2
	set	0x4ADC7AA2,	%l3
	set	0x6E6C74C4,	%l4
	set	0x326F9DC0,	%l5
	set	0x72A7D313,	%l6
	!# Output registers
	set	0x1CD3,	%o0
	set	-0x1164,	%o1
	set	-0x167E,	%o2
	set	0x13D6,	%o3
	set	0x1D52,	%o4
	set	0x086F,	%o5
	set	0x1CFB,	%o6
	set	0x0485,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	rdhpr	%htba,	%l4
	fbule,a,pn	%fcc0,	loop_370
	call	loop_371
	edge32ln	%o7,	%i0,	%l1
	srlx	%o4,	0x1D,	%i1
loop_370:
	call	loop_372
loop_371:
	swap	[%l7 + 0x44],	%g6
	udiv	%i6,	0x0DC5,	%o0
	rd	%y,	%o6
loop_372:
	call	loop_373
	fmovdu	%fcc3,	%f14,	%f24
	wrpr	%l5,	0x1BE9,	%cwp
	tne	%xcc,	0x1
loop_373:
	edge16ln	%g4,	%l0,	%o1
	or	%l3,	%i5,	%g7
	sub	%g1,	0x0A39,	%o2
	flushw
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f12
	fxtos	%f12,	%f25
	tvs	%icc,	0x7
	fxnor	%f20,	%f0,	%f10
	call	loop_374
	subcc	%l6,	0x0D7F,	%g2
	tneg	%icc,	0x5
	fpsub16s	%f27,	%f20,	%f31
loop_374:
	fnot2	%f28,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0xAFF9F64D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA95DD951,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f3,	%f21
	call	loop_375
	edge8l	%g3,	%i2,	%g5
	fmovdl	%fcc2,	%f14,	%f0
	nop
	set	0x76, %g2
	ldstub	[%l7 + %g2],	%o5
loop_375:
	fmuld8ulx16	%f8,	%f9,	%f18
	wrpr	%l2,	0x1632,	%cwp
	fpackfix	%f14,	%f2
	fandnot1	%f22,	%f16,	%f12
	std	%i4,	[%l7 + 0x28]
	fabsd	%f22,	%f24
	sll	%o3,	%i3,	%i7
	rd	%sys_tick_cmpr,	%o7
	call	loop_376
	call	loop_377
	tvc	%icc,	0x1
	fmovsge	%fcc1,	%f6,	%f2
loop_376:
	call	loop_378
loop_377:
	orcc	%l4,	0x1353,	%l1
	call	loop_379
	call	loop_380
loop_378:
	movleu	%icc,	%i0,	%i1
	ld	[%l7 + 0x48],	%f14
loop_379:
	lduw	[%l7 + 0x20],	%o4
loop_380:
	fmovdlg	%fcc2,	%f0,	%f18
	popc	%i6,	%g6
	orncc	%o0,	0x1109,	%l5
	siam	0x0
	movug	%fcc3,	%g4,	%o6
	wrpr	%l0,	0x0F8C,	%tick
	fmovrslz	%o1,	%f23,	%f9
	fnand	%f16,	%f8,	%f24
	call	loop_381
	add	%l3,	0x0303,	%i5
	call	loop_382
	call	loop_383
loop_381:
	fandnot1	%f0,	%f6,	%f12
	brgez,a,pt	%g1,	loop_384
loop_382:
	fmovsvc	%icc,	%f24,	%f14
loop_383:
	nop
	set	0x0B, %g1
	ldsb	[%l7 + %g1],	%o2
	tcc	%xcc,	0x3
loop_384:
	call	loop_385
	mova	%fcc3,	0x05E,	%l6
	nop
	setx	0x4C28498C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC870BD9D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f14,	%f31
	andn	%g2,	0x0B63,	%g7
loop_385:
	call	loop_386
	fcmpgt32	%f12,	%f0,	%g3
	fmovrdlez	%i2,	%f20,	%f18
	call	loop_387
loop_386:
	edge32n	%g5,	%o5,	%i4
	nop
	setx	0xE4531844,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	tneg	%xcc,	0x1
loop_387:
	fpsub32	%f28,	%f30,	%f8
	call	loop_388
	call	loop_389
	call	loop_390
	sethi	0x1163,	%l2
loop_388:
	ble,pn	%xcc,	loop_391
loop_389:
	rdpr	%canrestore,	%i3
loop_390:
	tleu	%icc,	0x0
	fmovsg	%fcc3,	%f28,	%f14
loop_391:
	movlg	%fcc1,	%i7,	%o7
	movrlz	%l4,	%l1,	%o3
	call	loop_392
	call	loop_393
	movn	%fcc2,	0x161,	%i1
	fbue	%fcc0,	loop_394
loop_392:
	call	loop_395
loop_393:
	bl	%icc,	loop_396
	nop
	setx	0x80A15285,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x42776954,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f24,	%f9
loop_394:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_395:
	nop
	set	0x60, %i5
	ldsb	[%l7 + %i5],	%i0
loop_396:
	fand	%f22,	%f28,	%f4
	fornot2	%f16,	%f12,	%f20
	fbne,a	%fcc3,	loop_397
	fcmpne16	%f14,	%f8,	%i6
	call	loop_398
	nop
	set	0x48, %o0
	swap	[%l7 + %o0],	%o4
loop_397:
	nop
	set	0x64, %g7
	prefetch	[%l7 + %g7],	 4
	tneg	%icc,	0x0
loop_398:
	fsrc1	%f14,	%f24
	nop
	fitod	%f8,	%f20
	fmovspos	%icc,	%f20,	%f7
	fbule,a,pn	%fcc2,	loop_399
	movpos	%xcc,	%g6,	%o0
	fmovsule	%fcc0,	%f21,	%f19
	fmovsule	%fcc1,	%f8,	%f13
loop_399:
	alignaddr	%l5,	%g4,	%l0
	nop
	setx	0x1969,	%l0,	%o6
	udivx	%o1,	%o6,	%i5
	fands	%f23,	%f31,	%f26
	nop
	set	0x18, %i4
	std	%f0,	[%l7 + %i4]
	fmovdge	%fcc0,	%f10,	%f16
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%g1
	call	loop_400
	call	loop_401
	call	loop_402
	wrpr	%o2,	0x0178,	%tick
loop_400:
	movrgz	%l3,	0x18B,	%g2
loop_401:
	fmovsleu	%icc,	%f14,	%f20
loop_402:
	movo	%fcc0,	0x408,	%g7
	fmovdlg	%fcc1,	%f24,	%f26
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovdcs	%icc,	%f22,	%f18
	call	loop_403
	udivcc	%g3,	0x184B,	%l6
	call	loop_404
	fnors	%f11,	%f19,	%f21
loop_403:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslz	%i2,	%f0,	%f18
loop_404:
	call	loop_405
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tg	%xcc,	0x5
	call	loop_406
loop_405:
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f14
	tn	%xcc,	0x2
	rdhpr	%htba,	%o5
loop_406:
	movpos	%xcc,	%i4,	%i3
	umul	%i7,	%o7,	%l2
	srax	%l4,	%o3,	%l1
	bshuffle	%f14,	%f30,	%f18
	fmovsu	%fcc1,	%f23,	%f6
	call	loop_407
	call	loop_408
	alignaddr	%i1,	%i6,	%i0
	nop
	setx	0xA2A867123EB46FF6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x372C840B9C33A245,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f4,	%f26
loop_407:
	fmovdpos	%xcc,	%f24,	%f14
loop_408:
	fmovsge	%icc,	%f9,	%f5
	nop
	set	0x10, %l3
	std	%f4,	[%l7 + %l3]
	bn,a,pt	%xcc,	loop_409
	andn	%g6,	0x1042,	%o4
	fnands	%f5,	%f24,	%f26
	rdpr	%otherwin,	%l5
loop_409:
	nop
	fitos	%f26,	%f28
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f10
	sdivcc	%g4,	0x0D0C,	%o0
	edge8	%o1,	%o6,	%l0
	ta	%xcc,	0x0
	call	loop_410
	fpsub16	%f26,	%f26,	%f2
	fmovd	%f12,	%f18
	call	loop_411
loop_410:
	fmovdcc	%icc,	%f28,	%f24
	call	loop_412
	mova	%fcc0,	0x6D1,	%g1
loop_411:
	call	loop_413
	movle	%fcc3,	0x787,	%o2
loop_412:
	call	loop_414
	fmovsvc	%xcc,	%f31,	%f15
loop_413:
	fmovrsgz	%i5,	%f7,	%f3
	fbu,a,pt	%fcc3,	loop_415
loop_414:
	call	loop_416
	call	loop_417
	fmovspos	%xcc,	%f20,	%f25
loop_415:
	call	loop_418
loop_416:
	call	loop_419
loop_417:
	call	loop_420
	fpadd32	%f10,	%f20,	%f4
loop_418:
	movcs	%xcc,	%l3,	%g2
loop_419:
	brgez,pt	%g7,	loop_421
loop_420:
	nop
	set	0x7C, %g3
	lduw	[%l7 + %g3],	%l6
	fmovso	%fcc3,	%f26,	%f27
	wr	%g5,	%g3,	%set_softint
loop_421:
	call	loop_422
	call	loop_423
	bcc	%icc,	loop_424
	fmovdle	%xcc,	%f28,	%f2
loop_422:
	subcc	%i2,	%i4,	%i3
loop_423:
	fnot2	%f28,	%f16
loop_424:
	subccc	%i7,	0x1BE5,	%o7
	fpsub32	%f16,	%f28,	%f0
	fmovso	%fcc2,	%f30,	%f25
	tleu	%xcc,	0x2
	wr	%g0,	0x0c,	%asi
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 15
!	Type a   	: 12
!	Type x   	: 2
!	Type cti   	: 55
!	Type f   	: 60
!	Type i   	: 56
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
	set	0x5,	%g2
	set	0xE,	%g3
	set	0x6,	%g4
	set	0xD,	%g5
	set	0xE,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x0,	%i1
	set	-0x1,	%i2
	set	-0x6,	%i3
	set	-0x7,	%i4
	set	-0x3,	%i5
	set	-0x7,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x582EC853,	%l0
	set	0x5A58038C,	%l1
	set	0x37E85305,	%l2
	set	0x35EB32FA,	%l3
	set	0x707382E4,	%l4
	set	0x624B9396,	%l5
	set	0x4E572518,	%l6
	!# Output registers
	set	0x123B,	%o0
	set	0x1CE5,	%o1
	set	-0x0F94,	%o2
	set	-0x1C5E,	%o3
	set	-0x0DA9,	%o4
	set	0x03BB,	%o5
	set	-0x1892,	%o6
	set	0x09B5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xF063B075A8F0F458)
	INIT_TH_FP_REG(%l7,%f2,0x2E7B2D6035E07F8E)
	INIT_TH_FP_REG(%l7,%f4,0xE30CFB067B91539F)
	INIT_TH_FP_REG(%l7,%f6,0x465DE29463B66B70)
	INIT_TH_FP_REG(%l7,%f8,0xCE3D718FA844F8CB)
	INIT_TH_FP_REG(%l7,%f10,0x27346FB2FA2FC61E)
	INIT_TH_FP_REG(%l7,%f12,0x9575CD4D9A7933CC)
	INIT_TH_FP_REG(%l7,%f14,0x8925C9A4E54868E6)
	INIT_TH_FP_REG(%l7,%f16,0x61084BD9F496EA43)
	INIT_TH_FP_REG(%l7,%f18,0xFD17F7FB06C484ED)
	INIT_TH_FP_REG(%l7,%f20,0x3DE651B4E2D1EDF1)
	INIT_TH_FP_REG(%l7,%f22,0x552545A8241187A2)
	INIT_TH_FP_REG(%l7,%f24,0x180BDC0B3E88BC44)
	INIT_TH_FP_REG(%l7,%f26,0x94902F6708518215)
	INIT_TH_FP_REG(%l7,%f28,0xE5B5D8C79BD51CCF)
	INIT_TH_FP_REG(%l7,%f30,0x44C2ECFBAC8D24A2)

	!# Execute Main Diag ..

	call	loop_425
	fmovrslez	%l2,	%f2,	%f1
	st	%f26,	[%l7 + 0x7C]
	rd	%softint,	%o5
loop_425:
	nop
	setx	loop_426,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmps	%fcc1,	%f5,	%f7
	smulcc	%o3,	%l1,	%l4
	fornot2	%f12,	%f14,	%f22
loop_426:
	fmovrsgz	%i6,	%f26,	%f20
	call	loop_427
	call	loop_428
	fbn,a	%fcc1,	loop_429
	fmovsg	%fcc2,	%f9,	%f31
loop_427:
	fmul8sux16	%f8,	%f20,	%f28
loop_428:
	movul	%fcc0,	0x0E0,	%i1
loop_429:
	movgu	%xcc,	%g6,	%o4
	call	loop_430
	fmovsa	%icc,	%f11,	%f22
	faligndata	%f10,	%f26,	%f16
	fpadd16	%f20,	%f20,	%f16
loop_430:
	te	%icc,	0x7
	fabsd	%f22,	%f22
	fones	%f13
	fxor	%f18,	%f12,	%f14
	sir	0x04FC
	fmovsa	%icc,	%f3,	%f18
	fble,a	%fcc1,	loop_431
	call	loop_432
	call	loop_433
	subcc	%l5,	%i0,	%g4
loop_431:
	call	loop_434
loop_432:
	fcmpgt16	%f12,	%f18,	%o1
loop_433:
	wr	%o6,	%l0,	%sys_tick
	call	loop_435
loop_434:
	call	loop_436
	fcmpgt32	%f2,	%f16,	%g1
	call	loop_437
loop_435:
	addccc	%o2,	0x05A3,	%i5
loop_436:
	call	loop_438
	fpmerge	%f15,	%f0,	%f18
loop_437:
	and	%o0,	0x13EA,	%g2
	fnegd	%f8,	%f8
loop_438:
	rdhpr	%htba,	%g7
	fmovdl	%fcc0,	%f8,	%f16
	fors	%f4,	%f18,	%f5
	srlx	%l3,	0x1B,	%l6
	nop
	fitod	%f12,	%f26
	fmovrde	%g3,	%f0,	%f20
	membar	0x10
	fcmpgt32	%f20,	%f18,	%g5
	rdhpr	%htba,	%i4
	rdhpr	%hsys_tick_cmpr,	%i3
	fmul8x16al	%f8,	%f20,	%f6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i7
	fbge,pt	%fcc1,	loop_439
	fcmpeq32	%f6,	%f2,	%o7
	orcc	%l2,	0x12AE,	%o5
	call	loop_440
loop_439:
	nop
	setx	0xB7A4B45F2848C46A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF92DC3BCF6DD49F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f20,	%f14
	movcc	%xcc,	0x7E8,	%o3
	fmul8sux16	%f20,	%f16,	%f12
loop_440:
	movrgez	%i2,	0x0AB,	%l1
	sub	%i6,	0x03E5,	%i1
	call	loop_441
	edge32n	%l4,	%o4,	%l5
	call	loop_442
	call	loop_443
loop_441:
	srax	%i0,	%g6,	%g4
	set	0x4C, %i3
	lduwa	[%l7 + %i3] 0x81,	%o1
loop_442:
	umul	%o6,	0x0396,	%l0
loop_443:
	fmovrslez	%g1,	%f14,	%f25
	call	loop_444
	nop
	fitos	%f5,	%f9
	fstox	%f9,	%f18
	fxtos	%f18,	%f4
	fmovrslz	%i5,	%f11,	%f21
	call	loop_445
loop_444:
	movvc	%icc,	%o0,	%o2
	fmovsge	%icc,	%f27,	%f8
	rdhpr	%htba,	%g2
loop_445:
	tn	%icc,	0x5
	call	loop_446
	array16	%g7,	%l3,	%l6
	tgu	%icc,	0x7
	fmovrslez	%g3,	%f9,	%f28
loop_446:
	brgz,a	%i4,	loop_447
	bg	%icc,	loop_448
	subcc	%g5,	%i3,	%i7
	bneg	%icc,	loop_449
loop_447:
	fpadd16	%f8,	%f8,	%f24
loop_448:
	nop
	setx	0x29CE56F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x64D0F131,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f13,	%f30
	set	0x18, %i7
	stda	%o6,	[%l7 + %i7] 0x10
loop_449:
	fpsub16	%f30,	%f8,	%f0
	fmul8x16	%f29,	%f30,	%f10
	srlx	%o5,	0x0E,	%o3
	call	loop_450
	fbuge,a,pt	%fcc1,	loop_451
	fmovrsgz	%i2,	%f13,	%f0
	call	loop_452
loop_450:
	stbar
loop_451:
	for	%f2,	%f14,	%f14
	fmovsvs	%xcc,	%f3,	%f30
loop_452:
	fnot1s	%f28,	%f10
	call	loop_453
	bn	%xcc,	loop_454
	st	%fsr,	[%l7 + 0x64]
	call	loop_455
loop_453:
	call	loop_456
loop_454:
	fmovrdlez	%l1,	%f12,	%f16
	rdpr	%cansave,	%l2
loop_455:
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%i6
loop_456:
	fmovdl	%fcc2,	%f8,	%f26
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x4E] %asi,	%i1
	prefetch	[%l7 + 0x10],	 2
	fbo,a,pn	%fcc2,	loop_457
	tle	%xcc,	0x3
	rd	%fprs,	%l4
	fmovscs	%xcc,	%f4,	%f1
loop_457:
	fmovdle	%fcc1,	%f6,	%f4
	bcc	%icc,	loop_458
	call	loop_459
	call	loop_460
	nop
	fitos	%f3,	%f10
	fstox	%f10,	%f26
loop_458:
	nop
	setx	0x883BFEEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC83AFD08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f17,	%f1
loop_459:
	fmovsvs	%xcc,	%f27,	%f23
loop_460:
	fexpand	%f1,	%f22
	nop
	setx	0xA370AF8BCA3D50EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f22
	nop
	fitos	%f0,	%f24
	fstox	%f24,	%f4
	fmovsne	%xcc,	%f7,	%f7
	taddcc	%l5,	%o4,	%i0
	or	%g6,	0x1318,	%g4
	movne	%fcc1,	%o6,	%l0
	nop
	setx	0x3DDE41E2DB1F239D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x07D8918E9F691643,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f14,	%f22
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o1
	xorcc	%i5,	%o0,	%o2
	alignaddr	%g2,	%g1,	%g7
	rdpr	%cleanwin,	%l3
	tle	%xcc,	0x2
	fcmps	%fcc0,	%f29,	%f12
	call	loop_461
	array32	%l6,	%i4,	%g3
	taddcc	%i3,	%g5,	%o7
	fmul8x16al	%f14,	%f30,	%f12
loop_461:
	nop
	setx	0x68E654470E5ADC2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xCEF1BD5F231F1852,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f20,	%f20
	be,a	%icc,	loop_462
	call	loop_463
	movrne	%i7,	0x25C,	%o5
	addcc	%o3,	0x1DE9,	%i2
loop_462:
	rdhpr	%hintp,	%l1
loop_463:
	fnot1s	%f25,	%f8
	bneg,a,pt	%icc,	loop_464
	fmovsgu	%xcc,	%f13,	%f8
	tle	%xcc,	0x4
	be	%icc,	loop_465
loop_464:
	bmask	%l2,	%i1,	%l4
	fmovrslez	%i6,	%f3,	%f7
	call	loop_466
loop_465:
	fmovdcs	%xcc,	%f16,	%f14
	fmovdul	%fcc3,	%f2,	%f22
	alignaddr	%o4,	%i0,	%l5
loop_466:
	nop
	fitod	%f24,	%f20
	call	loop_467
	fmovdl	%fcc1,	%f24,	%f4
	bshuffle	%f2,	%f16,	%f8
	fbne,pt	%fcc1,	loop_468
loop_467:
	fmovdlg	%fcc2,	%f26,	%f2
	set	0x63, %o7
	lduba	[%l7 + %o7] 0x80,	%g4
loop_468:
	fmovdg	%fcc1,	%f18,	%f24
	udivx	%o6,	0x1F4D,	%g6
	movul	%fcc0,	0x272,	%l0
	fxnors	%f31,	%f24,	%f28
	te	%xcc,	0x6
	nop
	setx	0xE9F13354,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xD8C04BC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f27,	%f27
	fbul,pt	%fcc3,	loop_469
	call	loop_470
	call	loop_471
	fornot2s	%f26,	%f14,	%f3
loop_469:
	fpadd16	%f30,	%f18,	%f18
loop_470:
	ble,a	%icc,	loop_472
loop_471:
	call	loop_473
	movcc	%xcc,	0x52D,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5C6, 	%sys_tick_cmpr
loop_472:
	fmovduge	%fcc1,	%f4,	%f8
loop_473:
	call	loop_474
	wr	%o2,	%g2,	%ccr
	wrpr 	%g0, 	0x3, 	%gl
	movule	%fcc3,	0x2F8,	%g7
loop_474:
	fmul8x16au	%f8,	%f18,	%f16
	tcc	%xcc,	0x2
	call	loop_475
	call	loop_476
	sir	0x1A44
	fmovdcc	%icc,	%f10,	%f18
loop_475:
	fsrc1s	%f12,	%f28
loop_476:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 12
!	Type a   	: 13
!	Type x   	: 7
!	Type cti   	: 52
!	Type f   	: 72
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
.word 0x77D197C0
.word 0x1DB7C4F7
.word 0x03D08C1B
.word 0x5BFFDE2B
.word 0x4A77A923
.word 0x4CE28C34
.word 0x97581B1A
.word 0x5718ECD3
.word 0x51B53C72
.word 0x5CE9F3C2
.word 0xDF8832B1
.word 0x427EDDCE
.word 0x9C8D953C
.word 0xCEC2DC6B
.word 0x137329E6
.word 0x4972A706
.word 0xEB86FF63
.word 0x381F6E9D
.word 0x66DFFE4F
.word 0x9398FE4B
.word 0x9F61B2B2
.word 0xC7B6FA7D
.word 0x713C884A
.word 0x94C92E7E
.word 0xDBC55461
.word 0xE217B21A
.word 0x6C40E1E1
.word 0x0B512EFA
.word 0x77A61CF2
.word 0x54D12178
.word 0xFF56C7A5
.word 0xACEFD057
.word 0x6F527B1B
.word 0x05E84BB3
.word 0x0CF4DF08
.word 0xEBF9E9B0
.word 0xF7D4D7EF
.word 0x548A4029
.word 0x6034E22B
.word 0xB7F7F6C3
.word 0xFC1F1345
.word 0x9EC8ADD6
.word 0xB6297164
.word 0x65B46410
.word 0xEA4B4FCC
.word 0x54C66DFC
.word 0xE59869EA
.word 0x9E2312C7
.word 0x0F55D3CD
.word 0x6C9BC482
.word 0x7B3E47AD
.word 0x08317285
.word 0xE127F3C1
.word 0xE907D10E
.word 0x0EC56C2C
.word 0x6C2953F9
.word 0x1EE43D71
.word 0xF11CA47A
.word 0x9752BB19
.word 0xFCF185EA
.word 0x859533ED
.word 0xE55DF769
.word 0xC4A26F47
.word 0xD18DFD77
.end
