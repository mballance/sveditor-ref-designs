/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_04.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12342"
.ident "Mon Dec  8 19:22:26 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_04.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0xB,	%g2
	set	0xF,	%g3
	set	0x7,	%g4
	set	0xE,	%g5
	set	0x8,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x7,	%i1
	set	-0x5,	%i2
	set	-0xA,	%i3
	set	-0xD,	%i4
	set	-0x1,	%i5
	set	-0x9,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x51510414,	%l0
	set	0x04287787,	%l1
	set	0x665F5336,	%l2
	set	0x1A2B9569,	%l3
	set	0x34A52CD6,	%l4
	set	0x470E86FE,	%l5
	set	0x4A387D60,	%l6
	!# Output registers
	set	0x17E2,	%o0
	set	0x0AFC,	%o1
	set	-0x09F5,	%o2
	set	0x0A00,	%o3
	set	-0x05EE,	%o4
	set	-0x1632,	%o5
	set	-0x11D5,	%o6
	set	-0x053E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	call	loop_1
	fpack16	%f8,	%f25
	call	loop_2
	rd	%tick_cmpr,	%o5
loop_1:
	nop
	setx	loop_3,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%i0,	%i5,	%g3
loop_2:
	call	loop_4
	fnegd	%f4,	%f18
loop_3:
	fmovsu	%fcc0,	%f5,	%f21
	fcmped	%fcc0,	%f0,	%f26
loop_4:
	call	loop_5
	call	loop_6
	fsrc2	%f12,	%f30
	fpadd16	%f24,	%f20,	%f22
loop_5:
	fnegs	%f9,	%f0
loop_6:
	call	loop_7
	movule	%fcc2,	0x3B4,	%i2
	call	loop_8
	fmovsu	%fcc1,	%f5,	%f1
loop_7:
	call	loop_9
	call	loop_10
loop_8:
	fmovsle	%icc,	%f30,	%f22
	nop
	fitos	%f2,	%f1
	fstox	%f1,	%f30
loop_9:
	fpsub16	%f6,	%f30,	%f26
loop_10:
	movn	%fcc2,	0x191,	%o4
	fmovrde	%o0,	%f18,	%f0
	fcmpgt32	%f6,	%f24,	%l1
	nop
	setx	0x03C5,	%l0,	%g1
	sdivcc	%l5,	%g1,	%l3
	call	loop_11
	fmovslg	%fcc0,	%f8,	%f19
	movrlz	%g6,	%g7,	%i4
	call	loop_12
loop_11:
	tneg	%icc,	0x7
	fmovsle	%xcc,	%f19,	%f10
	fmovdge	%fcc2,	%f12,	%f18
loop_12:
	call	loop_13
	movcc	%icc,	0x0AC,	%g2
	popc	%i1,	%o3
	fmovrse	%l2,	%f10,	%f17
loop_13:
	ld	[%l7 + 0x40],	%f7
	fmovsle	%fcc0,	%f5,	%f15
	fmul8x16	%f3,	%f18,	%f22
	call	loop_14
	tleu	%icc,	0x3
	movue	%fcc2,	%o2,	%o7
	call	loop_15
loop_14:
	call	loop_16
	srlx	%o1,	0x16,	%l4
	fmovrdlz	%o6,	%f18,	%f22
loop_15:
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%f12
loop_16:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	fitos	%f7,	%f19
	fstod	%f19,	%f6
	call	loop_17
	smulcc	%i3,	0x1751,	%l6
	mulscc	%g5,	0x0399,	%l0
	call	loop_18
loop_17:
	call	loop_19
	rdhpr	%ver,	%i6
	fpsub32s	%f17,	%f29,	%f9
loop_18:
	fmovdleu	%xcc,	%f6,	%f2
loop_19:
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_20
	call	loop_21
	fpackfix	%f28,	%f7
	movul	%fcc2,	0x311,	%o5
loop_20:
	fmovdle	%xcc,	%f20,	%f22
loop_21:
	fsrc1s	%f7,	%f12
	call	loop_22
	nop
	fitos	%f1,	%f29
	fstod	%f29,	%f14
	movgu	%xcc,	%g3,	%i2
	fbule,pn	%fcc0,	loop_23
loop_22:
	fmul8x16	%f5,	%f0,	%f18
	fmul8sux16	%f0,	%f0,	%f10
	fbg,a	%fcc3,	loop_24
loop_23:
	nop
	set	0x2A, %l0
	ldsh	[%l7 + %l0],	%i5
	edge16l	%o4,	%o0,	%l5
	fmovse	%fcc1,	%f6,	%f8
loop_24:
	fxnors	%f9,	%f18,	%f9
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdu	%fcc1,	%f2,	%f6
	array8	%g1,	%l3,	%g6
	sllx	%l1,	0x1C,	%g7
	xor	%i4,	0x0D64,	%i1
	call	loop_25
	bvs,a	%icc,	loop_26
	edge16l	%o3,	%l2,	%g2
	call	loop_27
loop_25:
	movne	%icc,	%o7,	%o1
loop_26:
	call	loop_28
	or	%o2,	%l4,	%o6
loop_27:
	fnor	%f22,	%f26,	%f28
	call	loop_29
loop_28:
	bshuffle	%f2,	%f20,	%f10
	ldstub	[%l7 + 0x31],	%i7
	nop
	setx	0xE436C289,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f22
loop_29:
	sllx	%i3,	%g4,	%g5
	set	0x68, %i4
	stda	%l0,	[%l7 + %i4] 0x10
	movvs	%xcc,	0x633,	%l6
	alignaddr	%i0,	%i6,	%o5
	movgu	%icc,	%g3,	%i2
	tcs	%icc,	0x6
	fba	%fcc2,	loop_30
	fmovdne	%xcc,	%f8,	%f16
	fmuld8ulx16	%f8,	%f3,	%f30
	sll	%o4,	%i5,	%o0
loop_30:
	fornot1	%f10,	%f26,	%f10
	fmovrdne	%g1,	%f6,	%f2
	call	loop_31
	faligndata	%f30,	%f14,	%f24
	fmovdul	%fcc1,	%f20,	%f22
	call	loop_32
loop_31:
	fmovsneg	%icc,	%f0,	%f5
	call	loop_33
	movle	%xcc,	0x60A,	%l5
loop_32:
	call	loop_34
	nop
	fitos	%f11,	%f0
	fstox	%f0,	%f22
loop_33:
	fmovslg	%fcc1,	%f21,	%f0
	fmovrsne	%l3,	%f5,	%f11
loop_34:
	for	%f28,	%f16,	%f6
	umulcc	%l1,	%g7,	%i4
	call	loop_35
	subccc	%i1,	%g6,	%o3
	fmul8x16al	%f24,	%f14,	%f12
	bvc	%icc,	loop_36
loop_35:
	call	loop_37
	call	loop_38
	fpsub16	%f6,	%f18,	%f30
loop_36:
	rd	%y,	%l2
loop_37:
	fmovsvs	%xcc,	%f14,	%f6
loop_38:
	sth	%g2,	[%l7 + 0x12]
	fmovrsne	%o1,	%f16,	%f22
	set	0x54, %g3
	stwa	%o2,	[%l7 + %g3] 0x11
	call	loop_39
	lduh	[%l7 + 0x52],	%l4
	tn	%xcc,	0x7
	xnorcc	%o6,	0x0D74,	%o7
loop_39:
	edge16	%i3,	%g4,	%i7
	fcmpd	%fcc0,	%f28,	%f2
	fbule	%fcc3,	loop_40
	call	loop_41
	call	loop_42
	nop
	set	0x30, %o7
	stx	%g5,	[%l7 + %o7]
loop_40:
	add	%l0,	0x1F31,	%i0
loop_41:
	fmovrdgez	%i6,	%f16,	%f20
loop_42:
	fmovdvs	%icc,	%f20,	%f14
	rd	%asi,	%l6
	fornot2	%f8,	%f30,	%f22
	call	loop_43
	call	loop_44
	fmovrde	%g3,	%f4,	%f20
	call	loop_45
loop_43:
	call	loop_46
loop_44:
	umulcc	%o5,	%o4,	%i5
	edge8n	%o0,	%i2,	%g1
loop_45:
	call	loop_47
loop_46:
	tpos	%icc,	0x1
	call	loop_48
	fmovsue	%fcc2,	%f4,	%f27
loop_47:
	tcs	%icc,	0x6
	wrpr	%l5,	%l1,	%tick
loop_48:
	xnorcc	%l3,	0x0894,	%i4
	movleu	%xcc,	0x6B3,	%g7
	fcmple16	%f8,	%f16,	%i1
	ta	%icc,	0x1
	call	loop_49
	call	loop_50
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f30
	tsubcctv	%g6,	0x16A8,	%o3
loop_49:
	fbne,pn	%fcc1,	loop_51
loop_50:
	fmovrde	%g2,	%f14,	%f4
	array8	%l2,	%o2,	%o1
	edge32n	%l4,	%o7,	%i3
loop_51:
	fcmpgt16	%f0,	%f24,	%g4
	fnegs	%f28,	%f24
	fpack32	%f26,	%f12,	%f10
	movuge	%fcc1,	%i7,	%o6
	sir	0x08C9
	call	loop_52
	movn	%xcc,	%g5,	%l0
	fsrc1s	%f7,	%f2
	movvs	%xcc,	0x7C9,	%i6
loop_52:
	fmovrdgez	%l6,	%f12,	%f16
	call	loop_53
	fmul8x16au	%f11,	%f17,	%f30
	tl	%icc,	0x7
	call	loop_54
loop_53:
	orn	%g3,	%i0,	%o4
	movrlz	%o5,	0x369,	%o0
	fmovda	%icc,	%f2,	%f24
loop_54:
	movcs	%icc,	%i5,	%g1
	fmul8x16	%f9,	%f20,	%f8
	fnot1s	%f17,	%f30
	call	loop_55
	movg	%fcc0,	%l5,	%i2
	tleu	%xcc,	0x7
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xe2,	%l2
loop_55:
	nop
	setx	0x0976,	%l0,	%g7
	udivx	%i4,	%g7,	%l1
	orncc	%g6,	%i1,	%g2
	call	loop_56
	fmovdg	%icc,	%f0,	%f10
	fble	%fcc1,	loop_57
	siam	0x0
loop_56:
	siam	0x1
	fpack32	%f16,	%f24,	%f14
loop_57:
	tsubcc	%o3,	%o2,	%o1
	call	loop_58
	fbul,pt	%fcc2,	loop_59
	tvc	%xcc,	0x0
	fcmpgt32	%f6,	%f30,	%l2
loop_58:
	tge	%icc,	0x5
loop_59:
	xor	%o7,	0x0AC7,	%i3
	call	loop_60
	fnegs	%f19,	%f9
	flushw
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f24
loop_60:
	fmovduge	%fcc2,	%f22,	%f12
	fmovdne	%fcc3,	%f22,	%f20
	fcmple32	%f26,	%f30,	%g4
	fnegs	%f28,	%f23
	mulx	%l4,	%o6,	%g5
	fnors	%f7,	%f8,	%f25
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x19,	 1
	nop
	fitod	%f2,	%f20
	fdtos	%f20,	%f4
	or	%i7,	0x1A37,	%l6
	ldsw	[%l7 + 0x3C],	%i6
	call	loop_61
	fmovsgu	%xcc,	%f5,	%f4
	fmul8sux16	%f22,	%f8,	%f26
	fornot2s	%f28,	%f12,	%f0
loop_61:
	taddcctv	%i0,	%g3,	%o5
	nop
	set	0x48, %g5
	lduw	[%l7 + %g5],	%o0
	call	loop_62
	rd	%y,	%o4
	ba,pt	%xcc,	loop_63
	call	loop_64
loop_62:
	fmovdue	%fcc3,	%f16,	%f16
	call	loop_65
loop_63:
	call	loop_66
loop_64:
	movvc	%xcc,	0x691,	%g1
	smul	%l5,	%i2,	%i5
loop_65:
	movrlz	%l3,	%g7,	%i4
loop_66:
	subc	%l1,	%i1,	%g2
	fcmpd	%fcc1,	%f12,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fandnot1s	%f2,	%f1,	%f8
	wrpr	%g6,	%l2,	%tick
	tcs	%xcc,	0x0
	brgz,a,pt	%o7,	loop_67
	call	loop_68
	subc	%i3,	%o1,	%l4
	subccc	%o6,	0x0F97,	%g4
loop_67:
	call	loop_69
loop_68:
	fbu,a	%fcc1,	loop_70
	tvc	%xcc,	0x7
	add	%l0,	0x1D26,	%g5
loop_69:
	movug	%fcc0,	%l6,	%i7
loop_70:
	fone	%f30
	nop
	setx	0x41DE56F64BC9526F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA348C9AC783C7C53,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f30,	%f8
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x18,	 3
	fmovsul	%fcc1,	%f21,	%f25
	orncc	%i0,	%o5,	%g3
	addc	%o4,	0x12D2,	%o0
	fmovrdlz	%l5,	%f0,	%f6
	brgez,a	%g1,	loop_71
	fbul	%fcc0,	loop_72
	call	loop_73
	bge,pt	%icc,	loop_74
loop_71:
	fmuld8ulx16	%f30,	%f20,	%f18
loop_72:
	tle	%xcc,	0x6
loop_73:
	fmovdn	%xcc,	%f22,	%f22
loop_74:
	nop
	setx	0xAA313AC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f14
	tvc	%icc,	0x5
	call	loop_75
	call	loop_76
	fnegd	%f14,	%f8
	fmovsg	%fcc0,	%f24,	%f15
loop_75:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34D, 	%hsys_tick_cmpr
loop_76:
	call	loop_77
	wrpr	%i2,	0x06FB,	%cwp
	fmovrdlez	%g7,	%f24,	%f10
	call	loop_78
loop_77:
	fmovsn	%xcc,	%f26,	%f3
	call	loop_79
	nop
	setx loop_80, %l0, %l1
	jmpl %l1, %l3
loop_78:
	fmovsu	%fcc1,	%f15,	%f11
	edge8ln	%l1,	%i4,	%g2
loop_79:
	call	loop_81
loop_80:
	popc	%i1,	%o3
	edge16ln	%o2,	%g6,	%l2
	fmovdvs	%icc,	%f8,	%f16
loop_81:
	call	loop_82
	srl	%i3,	0x14,	%o1
	umul	%o7,	0x1911,	%o6
	fcmple16	%f22,	%f2,	%l4
loop_82:
	array8	%l0,	%g4,	%g5
	call	loop_83
	brgz,a	%i7,	loop_84
	tn	%icc,	0x3
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x11,	 1
loop_83:
	call	loop_85
loop_84:
	fnors	%f23,	%f30,	%f10
	movge	%fcc1,	%i0,	%i6
	fpmerge	%f8,	%f20,	%f4
loop_85:
	pdist	%f16,	%f2,	%f8
	call	loop_86
	fmovdn	%xcc,	%f0,	%f2
	movge	%xcc,	0x316,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_86:
	call	loop_87
	fxor	%f0,	%f22,	%f18
	call	loop_88
	addcc	%o0,	%g1,	%i5
loop_87:
	sethi	0x0369,	%l5
	fandnot1	%f16,	%f8,	%f10
loop_88:
	call	loop_89
	movul	%fcc3,	0x499,	%i2
	call	loop_90
	call	loop_91
loop_89:
	fcmpne16	%f26,	%f20,	%l3
	xnorcc	%g7,	%l1,	%i4
loop_90:
	call	loop_92
loop_91:
	alignaddr	%g2,	%i1,	%o2
	sub	%o3,	0x0890,	%g6
	fpadd32	%f22,	%f22,	%f16
loop_92:
	movue	%fcc2,	0x4EF,	%i3
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsule	%fcc1,	%f28,	%f10
	tcs	%icc,	0x7
	call	loop_93
	fmovsge	%icc,	%f22,	%f10
	fmovso	%fcc2,	%f31,	%f31
	edge32ln	%l2,	%o1,	%o6
loop_93:
	fmul8ulx16	%f8,	%f28,	%f24
	fsrc1	%f14,	%f2
	fmovdvc	%xcc,	%f16,	%f24
	call	loop_94
	fmovrdlez	%l4,	%f12,	%f6
	movvs	%icc,	0x3A3,	%l0
	fmovsne	%fcc0,	%f25,	%f10
loop_94:
	fmovsue	%fcc3,	%f16,	%f21
	call	loop_95
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsug	%fcc2,	%f27,	%f23
	fmovsue	%fcc3,	%f2,	%f23
loop_95:
	nop
	setx	0x04B1,	%l0,	%g5
	sdivcc	%o7,	%g5,	%g4
	call	loop_96
	fbl	%fcc0,	loop_97
	sllx	%i7,	0x0B,	%l6
	call	loop_98
loop_96:
	be,a,pn	%icc,	loop_99
loop_97:
	movvc	%icc,	%i0,	%g3
	call	loop_100
loop_98:
	flush	%l7 + 0x1C
loop_99:
	fbuge,a,pn	%fcc0,	loop_101
	call	loop_102
loop_100:
	tvs	%icc,	0x7
	fnor	%f22,	%f22,	%f4
loop_101:
	edge8	%o4,	%o5,	%i6
loop_102:
	fands	%f14,	%f27,	%f14
	fornot2	%f12,	%f8,	%f16
	fmovsge	%xcc,	%f31,	%f24
	rd	%fprs,	%g1
	call	loop_103
	fmovsle	%fcc0,	%f18,	%f31
	fzeros	%f18
	edge16n	%o0,	%l5,	%i2
loop_103:
	edge8l	%l3,	%i5,	%l1
	call	loop_104
	call	loop_105
	fornot2	%f0,	%f4,	%f10
	call	loop_106
loop_104:
	call	loop_107
loop_105:
	movrgz	%i4,	%g2,	%i1
	addc	%o2,	0x1B7D,	%g7
loop_106:
	fones	%f21
loop_107:
	fpadd16	%f0,	%f30,	%f12
	fpsub32s	%f1,	%f13,	%f17
	call	loop_108
	fmovrsne	%o3,	%f0,	%f10
	mova	%xcc,	0x092,	%i3
	call	loop_109
loop_108:
	fnegs	%f28,	%f26
	bshuffle	%f16,	%f6,	%f18
	movpos	%xcc,	%g6,	%o1
loop_109:
	call	loop_110
	xnorcc	%o6,	0x0D71,	%l4
	bmask	%l0,	%l2,	%g5
	fxors	%f3,	%f19,	%f21
loop_110:
	fmovsn	%fcc0,	%f20,	%f13
	fsrc1s	%f5,	%f2
	rdpr	%otherwin,	%o7
	edge32ln	%g4,	%i7,	%l6
	wr 	%g0, 	0x5, 	%fprs
	fpadd16s	%f23,	%f15,	%f13
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%o5
	tsubcctv	%i6,	0x1925,	%o4
	call	loop_111
	fnegd	%f14,	%f0
	call	loop_112
	bneg,pn	%xcc,	loop_113
loop_111:
	bneg,pt	%icc,	loop_114
	movg	%icc,	%g1,	%o0
loop_112:
	fcmpes	%fcc0,	%f3,	%f28
loop_113:
	fabsd	%f8,	%f14
loop_114:
	call	loop_115
	call	loop_116
	fmovrdlz	%i2,	%f16,	%f6
	fmovdul	%fcc3,	%f8,	%f4
loop_115:
	fpsub16	%f0,	%f26,	%f6
loop_116:
	movcc	%icc,	0x461,	%l3
	call	loop_117
	brlez,a	%i5,	loop_118
	call	loop_119
	nop
	setx	0x5EF05D85E84DC6B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFA9AD973C8FD4346,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f20
loop_117:
	fnor	%f8,	%f14,	%f12
loop_118:
	fmovrde	%l5,	%f26,	%f0
loop_119:
	fmovdue	%fcc0,	%f30,	%f18
	fmovdlg	%fcc1,	%f28,	%f20
	call	loop_120
	fmovsvs	%xcc,	%f18,	%f7
	fcmps	%fcc2,	%f4,	%f24
	fpadd16s	%f6,	%f1,	%f17
loop_120:
	call	loop_121
	movle	%icc,	0x097,	%i4
	fcmple32	%f16,	%f2,	%l1
	tvc	%icc,	0x4
loop_121:
	rdpr	%canrestore,	%g2
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f18
	fpadd16	%f14,	%f12,	%f4
	fbg,a	%fcc0,	loop_122
	movuge	%fcc1,	%i1,	%o2
	fmovrslez	%g7,	%f3,	%f11
	fmuld8ulx16	%f20,	%f26,	%f24
loop_122:
	nop
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	bcc,a	%icc,	loop_123
	fbule,a	%fcc1,	loop_124
	fpsub32	%f18,	%f20,	%f12
	movl	%icc,	%o3,	%g6
loop_123:
	fmovrdlez	%i3,	%f22,	%f24
loop_124:
	fmovdleu	%icc,	%f8,	%f14
	call	loop_125
	fnegd	%f14,	%f0
	ldd	[%l7 + 0x58],	%f22
	fbule,pt	%fcc0,	loop_126
loop_125:
	ldx	[%l7 + 0x58],	%o6
	call	loop_127
	call	loop_128
loop_126:
	ba,pt	%xcc,	loop_129
	movvs	%icc,	%l4,	%o1
loop_127:
	fmovsuge	%fcc1,	%f22,	%f5
loop_128:
	rdpr	%tba,	%l0
loop_129:
	fmovda	%xcc,	%f20,	%f22
	call	loop_130
	call	loop_131
	call	loop_132
	fors	%f12,	%f26,	%f31
loop_130:
	popc	0x1958,	%g5
loop_131:
	xor	%o7,	0x0F09,	%l2
loop_132:
	fones	%f16
	edge32n	%g4,	%i7,	%l6
	fmovrse	%g3,	%f30,	%f5
	fcmped	%fcc0,	%f14,	%f2
	call	loop_133
	fandnot1	%f12,	%f4,	%f18
	mulx	%i0,	%i6,	%o4
	addccc	%o5,	0x04C0,	%g1
loop_133:
	fnot1s	%f3,	%f7
	nop
	set	0x7E, %g7
	sth	%i2,	[%l7 + %g7]
	fpadd32s	%f20,	%f25,	%f17
	nop
	setx	0x330231CEEC185A5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x18BC2491,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f6,	%f10
	fzero	%f14
	call	loop_134
	add	%l3,	%o0,	%i5
	call	loop_135
	movcc	%icc,	0x1DD,	%l5
loop_134:
	movrne	%l1,	%g2,	%i1
	fbuge,a,pt	%fcc2,	loop_136
loop_135:
	call	loop_137
	add	%o2,	%g7,	%o3
	call	loop_138
loop_136:
	sdivcc	%g6,	0x1053,	%i4
loop_137:
	addccc	%i3,	0x1541,	%l4
	wrpr 	%g0, 	0x0, 	%gl
loop_138:
	call	loop_139
	fmovrdgz	%g5,	%f20,	%f6
	fandnot2s	%f28,	%f17,	%f31
	or	%o7,	%l0,	%g4
loop_139:
	lduh	[%l7 + 0x30],	%l2
	movul	%fcc3,	%l6,	%i7
	rdpr	%canrestore,	%g3
	call	loop_140
loop_140:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 24
!	Type a   	: 20
!	Type x   	: 9
!	Type cti   	: 140
!	Type f   	: 172
!	Type i   	: 135
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
	set	0x0,	%g1
	set	0x0,	%g2
	set	0xD,	%g3
	set	0x3,	%g4
	set	0xF,	%g5
	set	0x1,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xF,	%i1
	set	-0x9,	%i2
	set	-0xA,	%i3
	set	-0x3,	%i4
	set	-0x0,	%i5
	set	-0x4,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x20F3076A,	%l0
	set	0x4059898B,	%l1
	set	0x1F6DD3BC,	%l2
	set	0x1FA42C80,	%l3
	set	0x35132BFD,	%l4
	set	0x3AD3BE74,	%l5
	set	0x713C3010,	%l6
	!# Output registers
	set	0x19A0,	%o0
	set	0x189B,	%o1
	set	-0x08F1,	%o2
	set	-0x08AE,	%o3
	set	-0x02D8,	%o4
	set	0x1498,	%o5
	set	-0x17AE,	%o6
	set	0x042C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	call	loop_141
	call	loop_142
	ba,a,pt	%xcc,	loop_143
	rd	%asi,	%i0
loop_141:
	fpmerge	%f26,	%f17,	%f12
loop_142:
	call	loop_144
loop_143:
	stbar
	fabsd	%f8,	%f26
	set	0x30, %o5
	lda	[%l7 + %o5] 0x10,	%f15
loop_144:
	movrgz	%i6,	%o5,	%g1
	ldstub	[%l7 + 0x49],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movle	%fcc3,	0x2A2,	%l3
	bleu,a	%icc,	loop_145
	edge32	%o0,	%i5,	%l1
	fmul8ulx16	%f16,	%f30,	%f4
	fmovrde	%g2,	%f2,	%f26
loop_145:
	call	loop_146
	fxor	%f2,	%f16,	%f28
	fmovrdlez	%l5,	%f18,	%f4
	fmovsu	%fcc1,	%f1,	%f19
loop_146:
	fcmpd	%fcc3,	%f30,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xor	%o3,	0x0AB4,	%g6
	fcmple32	%f14,	%f22,	%i4
	tsubcctv	%o2,	0x1590,	%i3
	and	%l4,	0x078E,	%o1
	call	loop_147
	rdpr	%tl,	%o6
	edge16	%g5,	%l0,	%o7
	call	loop_148
loop_147:
	wrpr	%g4,	%l6,	%cwp
	stbar
	call	loop_149
loop_148:
	addcc	%l2,	0x1F84,	%i7
	fmovdge	%fcc2,	%f20,	%f6
	movule	%fcc0,	%g3,	%i0
loop_149:
	call	loop_150
	call	loop_151
	sir	0x1CF4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_150:
	tpos	%xcc,	0x4
loop_151:
	fmovdge	%fcc3,	%f28,	%f30
	fmovsg	%fcc0,	%f14,	%f5
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f26
	call	loop_152
	call	loop_153
	call	loop_154
	brlz,a,pn	%o4,	loop_155
loop_152:
	umul	%i2,	%l3,	%o0
loop_153:
	mova	%fcc2,	%i5,	%l1
loop_154:
	fmovde	%fcc3,	%f4,	%f16
loop_155:
	movneg	%xcc,	0x79A,	%o5
	srlx	%g2,	0x1B,	%l5
	call	loop_156
	nop
	fitos	%f13,	%f22
	fstod	%f22,	%f24
	edge16n	%g7,	%o3,	%g6
	movul	%fcc3,	0x6B0,	%i4
loop_156:
	fzero	%f16
	nop
	set	0x08, %l6
	ldsw	[%l7 + %l6],	%o2
	bne,a	%xcc,	loop_157
	smulcc	%i3,	0x175D,	%l4
	nop
	fitos	%f4,	%f4
	fstoi	%f4,	%f1
	rdpr	%otherwin,	%o1
loop_157:
	brlez,a	%i1,	loop_158
	call	loop_159
	call	loop_160
	andcc	%o6,	%l0,	%o7
loop_158:
	call	loop_161
loop_159:
	tneg	%xcc,	0x0
loop_160:
	edge16l	%g4,	%g5,	%l6
	call	loop_162
loop_161:
	call	loop_163
	fnot1	%f14,	%f14
	call	loop_164
loop_162:
	fmovsneg	%icc,	%f1,	%f10
loop_163:
	call	loop_165
	call	loop_166
loop_164:
	call	loop_167
	fsrc2	%f2,	%f2
loop_165:
	rd	%asi,	%i7
loop_166:
	call	loop_168
loop_167:
	call	loop_169
	call	loop_170
	sllx	%l2,	0x0E,	%i0
loop_168:
	nop
	setx	0x3D256911,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f11
loop_169:
	call	loop_171
loop_170:
	rd	%sys_tick_cmpr,	%i6
	call	loop_172
	tge	%xcc,	0x0
loop_171:
	movcs	%icc,	0x21E,	%g1
	call	loop_173
loop_172:
	xnor	%o4,	%i2,	%l3
	fpadd16s	%f16,	%f22,	%f0
	fzero	%f10
loop_173:
	sethi	0x1272,	%o0
	call	loop_174
	movrlez	%i5,	0x2A3,	%g3
	fsrc1	%f22,	%f4
	call	loop_175
loop_174:
	fmovrdgz	%l1,	%f2,	%f20
	fcmple16	%f26,	%f10,	%g2
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f24
loop_175:
	movrne	%l5,	%o5,	%g7
	fmovdne	%fcc0,	%f12,	%f4
	call	loop_176
	lduw	[%l7 + 0x74],	%g6
	srax	%o3,	%o2,	%i3
	movn	%icc,	%l4,	%o1
loop_176:
	fmovda	%fcc1,	%f18,	%f16
	fmovdvs	%xcc,	%f12,	%f24
	call	loop_177
	call	loop_178
	addc	%i1,	%o6,	%i4
	rd	%y,	%l0
loop_177:
	call	loop_179
loop_178:
	brlez	%g4,	loop_180
	rdpr	%tl,	%o7
	edge32	%l6,	%g5,	%l2
loop_179:
	fzeros	%f16
loop_180:
	call	loop_181
	brgez,a	%i7,	loop_182
	fmovdl	%icc,	%f18,	%f16
	call	loop_183
loop_181:
	edge32ln	%i6,	%i0,	%o4
loop_182:
	fsrc2s	%f30,	%f11
	fsrc1	%f6,	%f6
loop_183:
	call	loop_184
	popc	0x0382,	%g1
	movgu	%icc,	0x20A,	%l3
	umul	%o0,	%i5,	%i2
loop_184:
	call	loop_185
	call	loop_186
	fmovsvs	%icc,	%f23,	%f21
	call	loop_187
loop_185:
	call	loop_188
loop_186:
	call	loop_189
	call	loop_190
loop_187:
	fnot2s	%f16,	%f9
loop_188:
	call	loop_191
loop_189:
	call	loop_192
loop_190:
	sllx	%l1,	0x03,	%g2
	mova	%fcc2,	%g3,	%o5
loop_191:
	call	loop_193
loop_192:
	fmovsleu	%xcc,	%f14,	%f14
	fmuld8sux16	%f22,	%f0,	%f0
	fmovdvs	%xcc,	%f10,	%f22
loop_193:
	call	loop_194
	edge8n	%g7,	%l5,	%o3
	call	loop_195
	movle	%icc,	0x249,	%o2
loop_194:
	tleu	%icc,	0x7
	call	loop_196
loop_195:
	nop
	set	0x26, %o3
	ldsh	[%l7 + %o3],	%g6
	fmovd	%f14,	%f18
	bgu	%icc,	loop_197
loop_196:
	fpsub16	%f6,	%f16,	%f4
	call	loop_198
	st	%f28,	[%l7 + 0x64]
loop_197:
	nop
	setx	0x0778,	%l0,	%i3
	sdivx	%l4,	%i3,	%i1
	fbne,a	%fcc0,	loop_199
loop_198:
	movo	%fcc1,	%o6,	%o1
	brz	%l0,	loop_200
	xnor	%g4,	0x0175,	%o7
loop_199:
	fcmpne32	%f12,	%f6,	%l6
	wr 	%g0, 	0x4, 	%fprs
loop_200:
	nop
	setx	0xAC8CCCC7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f0
	call	loop_201
	call	loop_202
	xnorcc	%g5,	%l2,	%i7
	srl	%i6,	%o4,	%g1
loop_201:
	call	loop_203
loop_202:
	call	loop_204
	wr	%i0,	%l3,	%pic
	fbul,a,pt	%fcc2,	loop_205
loop_203:
	nop
	set	0x48, %o4
	std	%f26,	[%l7 + %o4]
loop_204:
	movgu	%xcc,	0x4AA,	%o0
	movlg	%fcc3,	0x069,	%i2
loop_205:
	edge8ln	%l1,	%g2,	%i5
	sll	%o5,	%g3,	%g7
	set	0x50, %i1
	lduwa	[%l7 + %i1] 0x04,	%l5
	ble,pn	%icc,	loop_206
	fmovdug	%fcc1,	%f8,	%f4
	call	loop_207
	edge32ln	%o2,	%o3,	%l4
loop_206:
	fmovrdne	%g6,	%f10,	%f30
	call	loop_208
loop_207:
	fmovrdlez	%i3,	%f22,	%f14
	movuge	%fcc3,	0x735,	%o6
	fmovrslz	%o1,	%f25,	%f23
loop_208:
	call	loop_209
	edge8n	%i1,	%l0,	%g4
	nop
	setx	0xBF9FEAE4CCBD931A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2E59E93C298E4B0B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f24,	%f6
	call	loop_210
loop_209:
	call	loop_211
	ldsh	[%l7 + 0x44],	%l6
	fmovsul	%fcc3,	%f4,	%f18
loop_210:
	call	loop_212
loop_211:
	call	loop_213
	call	loop_214
	movcc	%xcc,	%i4,	%g5
loop_212:
	fnor	%f12,	%f20,	%f26
loop_213:
	call	loop_215
loop_214:
	call	loop_216
	fmovdcs	%icc,	%f28,	%f6
	alignaddr	%l2,	%i7,	%i6
loop_215:
	movn	%xcc,	0x450,	%o4
loop_216:
	subcc	%g1,	0x0D19,	%i0
	be	%xcc,	loop_217
	smul	%o7,	%o0,	%l3
	wr	%l1,	0x1532,	%set_softint
	srax	%i2,	%i5,	%o5
loop_217:
	fmovdcc	%xcc,	%f30,	%f6
	fnot2s	%f6,	%f25
	rd	%pc,	%g2
	fornot1	%f12,	%f4,	%f16
	call	loop_218
	bshuffle	%f16,	%f16,	%f22
	fcmpgt32	%f14,	%f14,	%g3
	call	loop_219
loop_218:
	wr	%g7,	%o2,	%sys_tick
	nop
	setx	0xE914C38D320F08F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	call	loop_220
loop_219:
	mulx	%o3,	%l4,	%l5
	tn	%xcc,	0x5
	movul	%fcc1,	0x4D0,	%g6
loop_220:
	call	loop_221
	call	loop_222
	call	loop_223
	subcc	%i3,	%o1,	%o6
loop_221:
	movle	%icc,	0x7B6,	%i1
loop_222:
	fmovsle	%fcc1,	%f27,	%f10
loop_223:
	movge	%fcc3,	%l0,	%l6
	tl	%icc,	0x4
	fnands	%f0,	%f10,	%f29
	xor	%g4,	%i4,	%l2
	fmovdlg	%fcc3,	%f14,	%f8
	srax	%i7,	0x0E,	%g5
	rdpr	%pil,	%i6
	sub	%g1,	0x19B2,	%i0
	call	loop_224
	fmovdcc	%xcc,	%f24,	%f20
	fandnot2s	%f21,	%f5,	%f21
	edge32	%o7,	%o0,	%l3
loop_224:
	nop
	set	0x60, %i3
	std	%l0,	[%l7 + %i3]
	udiv	%i2,	0x0C39,	%o4
	bvc,a,pt	%xcc,	loop_225
	nop
	fitos	%f3,	%f30
	fstod	%f30,	%f20
	call	loop_226
	call	loop_227
loop_225:
	call	loop_228
	fmovrdgez	%i5,	%f22,	%f14
loop_226:
	brnz	%g2,	loop_229
loop_227:
	fsrc1	%f14,	%f22
loop_228:
	fcmple16	%f22,	%f24,	%g3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_229:
	call	loop_230
	array16	%o5,	%g7,	%o3
	edge32l	%o2,	%l5,	%g6
	fpack32	%f12,	%f4,	%f26
loop_230:
	sub	%l4,	%o1,	%o6
	movuge	%fcc0,	0x39C,	%i1
	srl	%i3,	0x16,	%l0
	fmovsneg	%xcc,	%f15,	%f17
	srlx	%g4,	%l6,	%l2
	stx	%i4,	[%l7 + 0x70]
	tleu	%xcc,	0x7
	bvs,a	%xcc,	loop_231
	fpackfix	%f0,	%f20
	movcc	%icc,	%g5,	%i6
	call	loop_232
loop_231:
	nop
	setx	0xBB57971FEAF163AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x5901157999B3DF6F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f28,	%f10
	fnors	%f29,	%f22,	%f3
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x11,	 4
loop_232:
	be,a,pt	%xcc,	loop_233
	call	loop_234
	fmovrde	%g1,	%f24,	%f12
	call	loop_235
loop_233:
	call	loop_236
loop_234:
	call	loop_237
	fmovd	%f2,	%f10
loop_235:
	fsrc2	%f22,	%f30
loop_236:
	flushw
loop_237:
	call	loop_238
	call	loop_239
	fmovsvc	%icc,	%f22,	%f11
	edge32	%o7,	%o0,	%l3
loop_238:
	fornot2s	%f8,	%f14,	%f13
loop_239:
	rdpr	%cleanwin,	%i0
	tvc	%xcc,	0x6
	tsubcc	%i2,	%o4,	%l1
	umul	%g2,	%i5,	%o5
	membar	0x0C
	set	0x51, %l3
	ldsba	[%l7 + %l3] 0x10,	%g7
	xnorcc	%o3,	0x1DA1,	%o2
	fcmpgt32	%f18,	%f26,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6E9, 	%hsys_tick_cmpr
	xnor	%l4,	%o6,	%i1
	fba	%fcc2,	loop_240
	mulx	%i3,	%l0,	%o1
	fmovslg	%fcc2,	%f2,	%f22
	call	loop_241
loop_240:
	taddcctv	%g4,	%l2,	%l6
	call	loop_242
	addccc	%g5,	%i6,	%i7
loop_241:
	edge16n	%i4,	%o7,	%o0
	call	loop_243
loop_242:
	nop
	setx	0xDC50FAF04246FABE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x0FC5FB8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f8,	%f0
	rdpr	%wstate,	%g1
	fmovrslz	%i0,	%f2,	%f6
loop_243:
	fmovrsgz	%l3,	%f27,	%f9
	movpos	%icc,	0x1F4,	%o4
	call	loop_244
	tle	%xcc,	0x6
	umulcc	%i2,	%l1,	%g2
	fmovdcc	%icc,	%f14,	%f10
loop_244:
	wr	%i5,	%o5,	%softint
	fexpand	%f19,	%f0
	addc	%g7,	%o2,	%g3
	sdivx	%o3,	0x1DDA,	%g6
	udivx	%l5,	0x124F,	%l4
	call	loop_245
	fmovsn	%fcc3,	%f22,	%f20
	movne	%fcc0,	%i1,	%o6
	fmovsgu	%xcc,	%f15,	%f0
loop_245:
	movrne	%i3,	0x3DD,	%l0
	call	loop_246
	fba	%fcc0,	loop_247
	orncc	%g4,	0x0ED5,	%l2
	fzeros	%f15
loop_246:
	bg	%icc,	loop_248
loop_247:
	call	loop_249
	brgz,pn	%l6,	loop_250
	call	loop_251
loop_248:
	call	loop_252
loop_249:
	fbge,a,pt	%fcc2,	loop_253
loop_250:
	mova	%fcc0,	0x2DF,	%o1
loop_251:
	fmovdvs	%xcc,	%f12,	%f2
loop_252:
	brgez,a,pn	%g5,	loop_254
loop_253:
	fsrc1	%f14,	%f20
	call	loop_255
	call	loop_256
loop_254:
	call	loop_257
	bmask	%i7,	%i6,	%o7
loop_255:
	fbge,pn	%fcc1,	loop_258
loop_256:
	fcmpgt16	%f16,	%f12,	%i4
loop_257:
	fmovsule	%fcc2,	%f11,	%f27
	subcc	%o0,	%g1,	%l3
loop_258:
	subcc	%o4,	%i0,	%i2
	call	loop_259
	movrne	%l1,	0x19F,	%i5
	nop
	setx	loop_260,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014200001403,	%l0,	%l1
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
	fmuld8sux16	%f15,	%f10,	%f20
loop_259:
	sethi	0x000D,	%g2
	orn	%o5,	%o2,	%g7
loop_260:
	fmovdu	%fcc3,	%f2,	%f28
	call	loop_261
	nop
	set	0x7C, %i6
	swap	[%l7 + %i6],	%g3
	call	loop_262
	orncc	%o3,	0x0C2B,	%l5
loop_261:
	mulscc	%l4,	%g6,	%o6
	fmovda	%xcc,	%f28,	%f20
loop_262:
	nop
	setx	0xB8AA37BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	rd	%fprs,	%i1
	bneg,a	%icc,	loop_263
	ld	[%l7 + 0x1C],	%f4
	edge8	%i3,	%g4,	%l0
	call	loop_264
loop_263:
	call	loop_265
	fnot1	%f20,	%f26
	fmovsu	%fcc0,	%f13,	%f12
loop_264:
	fmovsug	%fcc1,	%f7,	%f17
loop_265:
	fmovsneg	%icc,	%f25,	%f1
	fmovs	%f10,	%f0
	call	loop_266
	fmovsul	%fcc3,	%f0,	%f5
	sub	%l2,	0x0DFF,	%l6
	call	loop_267
loop_266:
	fabss	%f2,	%f13
	call	loop_268
	xnorcc	%g5,	0x0A13,	%i7
loop_267:
	call	loop_269
	fmovsn	%icc,	%f5,	%f9
loop_268:
	call	loop_270
	xnorcc	%i6,	0x11BC,	%o7
loop_269:
	nop
	set	0x60, %l5
	stw	%o1,	[%l7 + %l5]
	edge8ln	%o0,	%i4,	%g1
loop_270:
	fcmpd	%fcc3,	%f0,	%f16
	rdhpr	%ver,	%o4
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x88
	fabss	%f13,	%f25
	bvc	%icc,	loop_271
	call	loop_272
	call	loop_273
	tvs	%icc,	0x6
loop_271:
	alignaddrl	%i0,	%i2,	%l3
loop_272:
	fmovdgu	%xcc,	%f8,	%f0
loop_273:
	tne	%xcc,	0x6
	bshuffle	%f16,	%f8,	%f20
	taddcc	%i5,	0x05A5,	%g2
	call	loop_274
	call	loop_275
	call	loop_276
	fmovsuge	%fcc3,	%f21,	%f16
loop_274:
	call	loop_277
loop_275:
	fzeros	%f24
loop_276:
	fpadd32	%f12,	%f20,	%f6
	call	loop_278
loop_277:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fnot2s	%f12,	%f21
	fmovde	%fcc2,	%f10,	%f26
loop_278:
	movleu	%icc,	0x384,	%o5
	nop
	setx	0x3FD5CDA7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x30996423,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f0,	%f20
	call	loop_279
	sdivcc	%l1,	0x0163,	%g7
	call	loop_280
	call	loop_281
loop_279:
	fsrc1s	%f31,	%f8
	call	loop_282
loop_280:
	nop
	setx	0x5ED7B3D4BAC7CBC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x23BFA9048E17C414,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f16,	%f16
loop_281:
	be	%icc,	loop_283
	fpsub32	%f26,	%f28,	%f22
loop_282:
	fandnot1	%f12,	%f12,	%f4
	rdpr	%pil,	%o2
loop_283:
	call	loop_284
	call	loop_285
	call	loop_286
	srl	%g3,	0x17,	%o3
loop_284:
	te	%xcc,	0x3
loop_285:
	rdpr	%wstate,	%l5
loop_286:
	call	loop_287
	fmovdcs	%icc,	%f0,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE80, 	%hsys_tick_cmpr
	fmovdleu	%icc,	%f26,	%f26
loop_287:
	fzero	%f14
	call	loop_288
	fmovde	%fcc1,	%f6,	%f30
	call	loop_289
	fmovrdlez	%o6,	%f18,	%f20
loop_288:
	rdpr	%cansave,	%i1
	fcmpgt16	%f16,	%f24,	%i3
loop_289:
	wrpr 	%g0, 	0x1, 	%gl
	fmovdue	%fcc2,	%f4,	%f6
	wrpr	%g6,	%l2,	%cwp
	nop
	fitos	%f6,	%f17
	fstox	%f17,	%f18
	fxtos	%f18,	%f21
	edge8	%l0,	%g5,	%i7
	fmovsa	%fcc3,	%f5,	%f17
	call	loop_290
	call	loop_291
	pdist	%f28,	%f0,	%f30
	call	loop_292
loop_290:
	fornot2s	%f9,	%f31,	%f7
loop_291:
	fandnot1	%f10,	%f20,	%f12
	fmovrslz	%i6,	%f4,	%f20
loop_292:
	fsrc2s	%f31,	%f24
	popc	%o7,	%l6
	subcc	%o1,	0x02A2,	%i4
	ldd	[%l7 + 0x10],	%o0
	tle	%xcc,	0x7
	wrpr	%o4,	%i0,	%cwp
	call	loop_293
	fnors	%f30,	%f27,	%f1
	bvs	%xcc,	loop_294
	call	loop_295
loop_293:
	fpackfix	%f22,	%f1
	edge32	%i2,	%l3,	%i5
loop_294:
	call	loop_296
loop_295:
	nop
	setx	0xC17A4458264F8895,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x355DE4F19323F316,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f14,	%f16
	call	loop_297
	te	%icc,	0x3
loop_296:
	flush	%l7 + 0x08
	taddcc	%g1,	0x07C3,	%g2
loop_297:
	fmovs	%f31,	%f9
	fmovrdgz	%l1,	%f4,	%f12
	fmovsleu	%xcc,	%f7,	%f4
	movue	%fcc1,	%o5,	%o2
	wr	%g0,	0x88,	%asi
	stba	%g7,	[%l7 + 0x77] %asi
	fmovdn	%fcc3,	%f26,	%f2
	fmovrdne	%g3,	%f28,	%f26
	nop
	setx	0xA0407B52,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x6C46ECF5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f28,	%f9
	tvc	%xcc,	0x0
	faligndata	%f4,	%f0,	%f0
	call	loop_298
	nop
	set	0x40, %l1
	std	%f8,	[%l7 + %l1]
	fmovrsgz	%o3,	%f23,	%f16
	movrgz	%l4,	%o6,	%l5
loop_298:
	te	%xcc,	0x3
	fmovrdlez	%i3,	%f14,	%f18
	taddcc	%i1,	0x019C,	%g4
	call	loop_299
	call	loop_300
	xnor	%l2,	%g6,	%g5
	nop
	setx	0x0FE2,	%l0,	%i6
	udivcc	%i7,	%i6,	%l0
loop_299:
	rdpr	%otherwin,	%l6
loop_300:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 26
!	Type a   	: 31
!	Type x   	: 6
!	Type cti   	: 160
!	Type f   	: 139
!	Type i   	: 138
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
	set	0x3,	%g1
	set	0x9,	%g2
	set	0x1,	%g3
	set	0x9,	%g4
	set	0x9,	%g5
	set	0x0,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x0,	%i1
	set	-0xA,	%i2
	set	-0x0,	%i3
	set	-0x7,	%i4
	set	-0x6,	%i5
	set	-0x7,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x06C091DB,	%l0
	set	0x0D951454,	%l1
	set	0x66424A9F,	%l2
	set	0x635322B6,	%l3
	set	0x787B77A3,	%l4
	set	0x039004B5,	%l5
	set	0x5FE93C81,	%l6
	!# Output registers
	set	-0x06B0,	%o0
	set	-0x038E,	%o1
	set	0x0502,	%o2
	set	0x1641,	%o3
	set	-0x1857,	%o4
	set	0x101C,	%o5
	set	-0x0887,	%o6
	set	0x0CC4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	st	%f25,	[%l7 + 0x1C]
	fmovdleu	%xcc,	%f28,	%f30
	call	loop_301
	nop
	set	0x38, %o6
	std	%o6,	[%l7 + %o6]
	fandnot2	%f12,	%f0,	%f4
	set	0x1F, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i4
loop_301:
	call	loop_302
	smul	%o1,	%o0,	%i0
	movrne	%o4,	0x312,	%i2
	fcmpgt32	%f28,	%f30,	%l3
loop_302:
	fornot2s	%f17,	%f18,	%f14
	call	loop_303
	fmovsa	%fcc3,	%f8,	%f21
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x1C] %asi,	%f6
loop_303:
	nop
	set	0x0F, %o0
	stba	%g1,	[%l7 + %o0] 0x88
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%i5
	call	loop_304
	call	loop_305
	fmovsge	%fcc3,	%f10,	%f22
	movge	%xcc,	%l1,	%o5
loop_304:
	fble,a	%fcc2,	loop_306
loop_305:
	fmovrsgz	%o2,	%f29,	%f30
	and	%g7,	%o3,	%l4
	fbne,pn	%fcc2,	loop_307
loop_306:
	fxnors	%f3,	%f18,	%f3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	array8	%g3,	%l5,	%i3
loop_307:
	call	loop_308
	nop
	setx	0xFD639B38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f0
	fpmerge	%f11,	%f0,	%f6
	call	loop_309
loop_308:
	fmovrdne	%o6,	%f18,	%f4
	call	loop_310
	bn,a,pn	%xcc,	loop_311
loop_309:
	fnot2	%f28,	%f20
	xor	%g4,	0x12C3,	%i1
loop_310:
	faligndata	%f18,	%f22,	%f30
loop_311:
	nop
	set	0x50, %o1
	lda	[%l7 + %o1] 0x81,	%f23
	rd	%pc,	%g6
	faligndata	%f28,	%f16,	%f8
	call	loop_312
	fmovrsne	%l2,	%f16,	%f29
	fxnor	%f24,	%f8,	%f16
	tn	%icc,	0x3
loop_312:
	call	loop_313
	nop
	fitos	%f10,	%f17
	fstox	%f17,	%f20
	fxtos	%f20,	%f20
	fcmped	%fcc3,	%f14,	%f22
	fbg	%fcc2,	loop_314
loop_313:
	fpadd16s	%f6,	%f14,	%f31
	movug	%fcc1,	%g5,	%i6
	call	loop_315
loop_314:
	fmovdne	%xcc,	%f16,	%f24
	fnot2s	%f24,	%f23
	call	loop_316
loop_315:
	call	loop_317
	call	loop_318
	xnor	%l0,	0x0ADB,	%i7
loop_316:
	orn	%l6,	0x04AF,	%i4
loop_317:
	nop
	setx	0x0B96176106241D05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4751555D71CC13CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f16,	%f6
loop_318:
	fcmpeq16	%f12,	%f0,	%o1
	popc	0x1BB3,	%o0
	call	loop_319
	fmuld8sux16	%f16,	%f8,	%f16
	fmul8x16au	%f29,	%f10,	%f2
	fnors	%f24,	%f22,	%f0
loop_319:
	fsrc2	%f26,	%f26
	movrgz	%o7,	%o4,	%i2
	tcs	%xcc,	0x2
	rd	%y,	%i0
	fsrc2s	%f25,	%f3
	fmovsne	%xcc,	%f15,	%f7
	sethi	0x05E6,	%l3
	sir	0x1DBD
	movuge	%fcc3,	0x24C,	%g1
	fmovrslez	%g2,	%f23,	%f26
	edge16n	%i5,	%o5,	%l1
	call	loop_320
	call	loop_321
	srl	%g7,	%o2,	%l4
	set	0x63, %l0
	stba	%o3,	[%l7 + %l0] 0x11
loop_320:
	and	%g3,	0x0D0E,	%l5
loop_321:
	nop
	set	0x33, %g6
	ldstuba	[%l7 + %g6] 0x19,	%i3
	fmul8sux16	%f6,	%f0,	%f16
	nop
	fitos	%f7,	%f5
	fstoi	%f5,	%f28
	call	loop_322
	nop
	setx	0x54B746DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f30
	call	loop_323
	fnot1s	%f15,	%f15
loop_322:
	rd	%tick_cmpr,	%o6
	fand	%f30,	%f6,	%f10
loop_323:
	fones	%f27
	edge32n	%g4,	%g6,	%l2
	tsubcc	%i1,	0x08AD,	%i6
	fmovrde	%l0,	%f24,	%f24
	call	loop_324
	movl	%icc,	0x529,	%i7
	fornot2	%f2,	%f0,	%f26
	fmovdneg	%icc,	%f24,	%f14
loop_324:
	fpadd16	%f22,	%f24,	%f8
	fcmple16	%f18,	%f2,	%l6
	sllx	%i4,	%g5,	%o0
	fpack32	%f16,	%f0,	%f0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%o7
	call	loop_325
	movge	%icc,	0x69C,	%i2
	fmovde	%fcc2,	%f2,	%f24
	andncc	%i0,	0x0DB9,	%l3
loop_325:
	fbge,a	%fcc1,	loop_326
	be	%icc,	loop_327
	tle	%xcc,	0x0
	fpackfix	%f6,	%f22
loop_326:
	edge8l	%g1,	%o4,	%i5
loop_327:
	fsrc1	%f24,	%f14
	call	loop_328
	sllx	%g2,	%l1,	%g7
	call	loop_329
	call	loop_330
loop_328:
	move	%icc,	%o2,	%o5
	tcs	%icc,	0x6
loop_329:
	movn	%fcc0,	%l4,	%o3
loop_330:
	fmovdg	%fcc0,	%f8,	%f0
	call	loop_331
	call	loop_332
	subc	%g3,	0x0FB5,	%i3
	fsrc1s	%f7,	%f5
loop_331:
	call	loop_333
loop_332:
	fcmped	%fcc0,	%f12,	%f14
	call	loop_334
	call	loop_335
loop_333:
	call	loop_336
	call	loop_337
loop_334:
	call	loop_338
loop_335:
	flushw
loop_336:
	fpack16	%f30,	%f31
loop_337:
	call	loop_339
loop_338:
	call	loop_340
	call	loop_341
	fabsd	%f10,	%f26
loop_339:
	tpos	%icc,	0x3
loop_340:
	or	%l5,	%g4,	%o6
loop_341:
	wr	%g6,	%i1,	%pic
	call	loop_342
	nop
	set	0x7C, %i4
	lduh	[%l7 + %i4],	%l2
	movn	%fcc3,	0x59B,	%l0
	call	loop_343
loop_342:
	ldstub	[%l7 + 0x59],	%i6
	call	loop_344
	mulx	%l6,	%i4,	%i7
loop_343:
	fpsub32s	%f11,	%f30,	%f18
	fpackfix	%f22,	%f0
loop_344:
	call	loop_345
	call	loop_346
	fmovdle	%xcc,	%f16,	%f24
	stbar
loop_345:
	nop
	setx	0x798A5571,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x404366B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f16,	%f2
loop_346:
	fmovdvc	%xcc,	%f6,	%f8
	umul	%g5,	%o0,	%o7
	fandnot2s	%f4,	%f16,	%f27
	fmovda	%fcc1,	%f28,	%f0
	call	loop_347
	fpsub32s	%f27,	%f24,	%f24
	call	loop_348
	fmovdcc	%xcc,	%f12,	%f6
loop_347:
	movo	%fcc2,	0x7C4,	%i2
	edge32	%o1,	%l3,	%g1
loop_348:
	tn	%icc,	0x5
	fmovd	%f14,	%f16
	call	loop_349
	fands	%f3,	%f20,	%f31
	rdhpr	%hsys_tick_cmpr,	%o4
	rdhpr	%ver,	%i5
loop_349:
	call	loop_350
	nop
	fitos	%f14,	%f23
	fstod	%f23,	%f20
	wr	%i0,	%l1,	%pic
	nop
	setx	0x80E17B81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xA6D033B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f19,	%f5
loop_350:
	array16	%g7,	%g2,	%o5
	fmovsle	%xcc,	%f18,	%f30
	call	loop_351
	call	loop_352
	tleu	%icc,	0x0
	movg	%xcc,	%o2,	%o3
loop_351:
	fmovscs	%xcc,	%f25,	%f25
loop_352:
	call	loop_353
	fmovsa	%fcc2,	%f21,	%f24
	nop
	setx	0x12AF,	%l0,	%i3
	udivcc	%g3,	%i3,	%l4
	call	loop_354
loop_353:
	call	loop_355
	call	loop_356
	fmovscc	%xcc,	%f11,	%f13
loop_354:
	rd	%softint,	%g4
loop_355:
	movrgez	%o6,	0x23D,	%l5
loop_356:
	xorcc	%g6,	0x061C,	%i1
	call	loop_357
	edge32ln	%l0,	%i6,	%l2
	movug	%fcc3,	%l6,	%i4
	movvs	%icc,	0x7E6,	%i7
loop_357:
	sethi	0x026F,	%o0
	andncc	%o7,	%g5,	%o1
	fmovde	%xcc,	%f30,	%f26
	call	loop_358
	fsrc1	%f12,	%f26
	call	loop_359
	movne	%fcc1,	%i2,	%l3
loop_358:
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f28
	xnor	%o4,	0x1994,	%g1
loop_359:
	mova	%xcc,	0x55E,	%i0
	nop
	setx	0xC13EC1EA233E507D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x21990AC83184D383,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f8
	add	%l1,	%g7,	%g2
	edge32n	%o5,	%i5,	%o3
	edge32ln	%g3,	%i3,	%l4
	fmovde	%xcc,	%f4,	%f18
	fpadd32s	%f1,	%f11,	%f1
	taddcc	%o2,	%g4,	%l5
	fmovsle	%fcc3,	%f3,	%f31
	call	loop_360
	fmovse	%xcc,	%f12,	%f31
	call	loop_361
	fmovsge	%icc,	%f13,	%f15
loop_360:
	call	loop_362
	movcc	%icc,	%g6,	%i1
loop_361:
	call	loop_363
	fmovrsgz	%l0,	%f15,	%f30
loop_362:
	fmovsug	%fcc2,	%f22,	%f30
	call	loop_364
loop_363:
	move	%fcc0,	0x02E,	%i6
	fnot1	%f24,	%f2
	tvc	%icc,	0x2
loop_364:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%l6
	call	loop_365
	fcmped	%fcc1,	%f16,	%f4
	call	loop_366
	call	loop_367
loop_365:
	fmovscs	%icc,	%f14,	%f18
	fcmpes	%fcc2,	%f25,	%f5
loop_366:
	fmul8sux16	%f28,	%f0,	%f22
loop_367:
	fnot2s	%f1,	%f1
	call	loop_368
	fmovsne	%fcc2,	%f28,	%f15
	call	loop_369
	call	loop_370
loop_368:
	st	%f2,	[%l7 + 0x58]
	call	loop_371
loop_369:
	edge16n	%o6,	%i7,	%o0
loop_370:
	srl	%i4,	0x1A,	%o7
	movle	%fcc2,	%o1,	%i2
loop_371:
	fandnot1s	%f4,	%f1,	%f16
	call	loop_372
	sdivx	%g5,	0x1DDB,	%o4
	fand	%f22,	%f28,	%f16
	fmovduge	%fcc1,	%f28,	%f4
loop_372:
	nop
	setx	0x333ABABA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f20
	movu	%fcc1,	0x6AB,	%l3
	movn	%fcc1,	%g1,	%l1
	fzero	%f30
	call	loop_373
	call	loop_374
	movle	%fcc3,	0x1BD,	%i0
	call	loop_375
loop_373:
	for	%f16,	%f24,	%f30
loop_374:
	edge8n	%g2,	%g7,	%i5
	sllx	%o5,	0x1F,	%o3
loop_375:
	call	loop_376
	call	loop_377
	fmovso	%fcc1,	%f28,	%f2
	fpack32	%f6,	%f8,	%f24
loop_376:
	addc	%g3,	%i3,	%l4
loop_377:
	st	%f0,	[%l7 + 0x18]
	movge	%xcc,	0x61D,	%g4
	call	loop_378
	taddcc	%l5,	0x1156,	%o2
	call	loop_379
	call	loop_380
loop_378:
	call	loop_381
	fmovrdlz	%g6,	%f30,	%f18
loop_379:
	fmovs	%f22,	%f13
loop_380:
	movug	%fcc0,	%l0,	%i6
loop_381:
	call	loop_382
	movne	%xcc,	0x40D,	%i1
	call	loop_383
	udivcc	%l2,	0x1BD4,	%l6
loop_382:
	fble	%fcc2,	loop_384
	fcmps	%fcc3,	%f5,	%f5
loop_383:
	movrgez	%i7,	0x38A,	%o6
	call	loop_385
loop_384:
	call	loop_386
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sra	%i4,	%o7,	%o0
loop_385:
	brz,a	%i2,	loop_387
loop_386:
	fbue,a	%fcc3,	loop_388
	fmovscc	%xcc,	%f3,	%f2
	wr	%g5,	%o1,	%y
loop_387:
	fpadd16s	%f19,	%f23,	%f10
loop_388:
	fnands	%f6,	%f15,	%f31
	call	loop_389
	wrpr	%o4,	0x00D4,	%cwp
	fsrc1s	%f4,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x356, 	%hsys_tick_cmpr
loop_389:
	fmovda	%fcc0,	%f22,	%f22
	set	0x3E, %g3
	stha	%l1,	[%l7 + %g3] 0xe2
	membar	#Sync
	call	loop_390
	edge8ln	%g1,	%i0,	%g7
	call	loop_391
	wr	%g2,	0x0291,	%y
loop_390:
	call	loop_392
	nop
	setx	0x187A,	%l0,	%o3
	sdivcc	%o5,	%o3,	%i5
loop_391:
	call	loop_393
	nop
	set	0x38, %o2
	lduw	[%l7 + %o2],	%i3
loop_392:
	nop
	setx	0xAC34CF8E327B485F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5B480657BAD5CD7F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f14,	%f14
	call	loop_394
loop_393:
	fpadd16	%f0,	%f8,	%f30
	alignaddrl	%g3,	%l4,	%g4
	call	loop_395
loop_394:
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f18
	nop
	setx	0x1EC0,	%l0,	%g6
	udivx	%l5,	%g6,	%l0
	nop
	setx	0x16B6EE43,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x853DD80F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f0,	%f12
loop_395:
	te	%icc,	0x1
	fmovsa	%xcc,	%f29,	%f20
	tneg	%icc,	0x3
	andcc	%i6,	0x0B15,	%o2
	call	loop_396
	fones	%f10
	edge32l	%i1,	%l2,	%l6
	fmovdule	%fcc2,	%f16,	%f16
loop_396:
	fnot1s	%f12,	%f29
	xnorcc	%o6,	0x1C1A,	%i4
	sdivcc	%i7,	0x0807,	%o7
	call	loop_397
	addccc	%o0,	%g5,	%i2
	fmovda	%fcc0,	%f12,	%f16
	call	loop_398
loop_397:
	call	loop_399
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsvc	%xcc,	%f22,	%f8
loop_398:
	nop
	setx	0x9585BA86351CD407,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xCF27DD6B85922577,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f28
loop_399:
	call	loop_400
	call	loop_401
	edge8n	%o4,	%l3,	%o1
	movo	%fcc3,	0x044,	%g1
loop_400:
	fcmpes	%fcc2,	%f27,	%f16
loop_401:
	fcmpeq16	%f6,	%f18,	%l1
	mova	%fcc1,	%g7,	%i0
	xnorcc	%g2,	0x1F5E,	%o3
	or	%i5,	0x1962,	%i3
	edge8l	%o5,	%g3,	%l4
	wrpr	%g4,	%l5,	%cwp
	tcc	%xcc,	0x1
	call	loop_402
	call	loop_403
	fmovdge	%fcc0,	%f28,	%f4
	call	loop_404
loop_402:
	fexpand	%f10,	%f10
loop_403:
	movrlez	%g6,	0x3E7,	%i6
	mulx	%o2,	0x1AC2,	%l0
loop_404:
	call	loop_405
	sethi	0x1392,	%i1
	fmovrslz	%l6,	%f8,	%f30
	rd	%softint,	%o6
loop_405:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x11,	%i4,	%i7
	call	loop_406
	fpsub16	%f26,	%f26,	%f2
	fnors	%f21,	%f13,	%f30
	edge8n	%o7,	%l2,	%o0
loop_406:
	orcc	%g5,	%i2,	%l3
	nop
	setx	0x0D473DEFC09C2E76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3A362DB0DDEB5C91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f14,	%f10
	tgu	%icc,	0x5
	call	loop_407
	subccc	%o4,	%g1,	%o1
	tsubcctv	%g7,	0x0B06,	%l1
	call	loop_408
loop_407:
	call	loop_409
	movrgez	%g2,	%o3,	%i0
	sir	0x1CBA
loop_408:
	tpos	%xcc,	0x0
loop_409:
	fbug,a	%fcc3,	loop_410
	fmovdcs	%xcc,	%f8,	%f6
	movne	%icc,	0x6ED,	%i3
	tvs	%icc,	0x3
loop_410:
	fornot2	%f28,	%f12,	%f26
	call	loop_411
	wr	%o5,	%g3,	%clear_softint
	rdpr	%pil,	%l4
	brgz,pn	%g4,	loop_412
loop_411:
	fbule,a	%fcc3,	loop_413
	fcmpne32	%f16,	%f30,	%l5
	ble	%xcc,	loop_414
loop_412:
	fmovdu	%fcc1,	%f24,	%f30
loop_413:
	fbn,pn	%fcc2,	loop_415
	tle	%xcc,	0x7
loop_414:
	srax	%i5,	%g6,	%i6
	movleu	%icc,	%l0,	%i1
loop_415:
	bcs	%xcc,	loop_416
	fnors	%f16,	%f10,	%f18
	tg	%xcc,	0x3
	fmovsue	%fcc2,	%f6,	%f20
loop_416:
	movrgez	%l6,	0x014,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	te	%icc,	0x1
	movleu	%xcc,	%i7,	%l2
	fmovrdlz	%o7,	%f16,	%f0
	call	loop_417
	call	loop_418
	call	loop_419
	call	loop_420
loop_417:
	movuge	%fcc1,	0x0E4,	%o0
loop_418:
	nop
	setx	0x5997A2F315B5A6D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE49541E9106404AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f24,	%f16
loop_419:
	movne	%fcc1,	0x03F,	%i2
loop_420:
	call	loop_421
	call	loop_422
	call	loop_423
	call	loop_424
loop_421:
	call	loop_425
loop_422:
	call	loop_426
loop_423:
	call	loop_427
loop_424:
	call	loop_428
loop_425:
	fpsub32s	%f4,	%f0,	%f11
loop_426:
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f16
loop_427:
	call	loop_429
loop_428:
	call	loop_430
	bmask	%g5,	%l3,	%o4
	wr 	%g0, 	0x7, 	%fprs
loop_429:
	sllx	%o1,	%l1,	%g2
loop_430:
	call	loop_431
	call	loop_432
	tcc	%icc,	0x2
	fmovdvc	%xcc,	%f4,	%f0
loop_431:
	call	loop_433
loop_432:
	fmovrsgez	%g7,	%f28,	%f17
	fmovdgu	%icc,	%f6,	%f4
	nop
	setx	0x1A8E,	%l0,	%o3
	sdivcc	%i0,	%o3,	%o5
loop_433:
	call	loop_434
	call	loop_435
	bleu,pn	%xcc,	loop_436
	be,a	%icc,	loop_437
loop_434:
	fmovdue	%fcc1,	%f16,	%f8
loop_435:
	fandnot2s	%f11,	%f9,	%f2
loop_436:
	call	loop_438
loop_437:
	call	loop_439
	nop
	fitos	%f2,	%f10
	fstod	%f10,	%f6
	call	loop_440
loop_438:
	movl	%fcc2,	0x2E6,	%i3
loop_439:
	fbug,a,pn	%fcc2,	loop_441
	xnorcc	%g3,	0x1169,	%l4
loop_440:
	movo	%fcc0,	%g4,	%l5
	mulx	%i5,	0x1FE7,	%i6
loop_441:
	rd	%fprs,	%l0
	fmovsug	%fcc0,	%f0,	%f3
	faligndata	%f6,	%f8,	%f24
	sdivx	%g6,	0x1688,	%i1
	umul	%l6,	%o2,	%i4
	fbl,a,pn	%fcc0,	loop_442
	wr	%o6,	0x02A2,	%sys_tick
	fmovda	%fcc1,	%f14,	%f24
	call	loop_443
loop_442:
	wr	%l2,	%i7,	%sys_tick
	fmovdul	%fcc3,	%f24,	%f30
	nop
	setx	0x01B65430,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f0
loop_443:
	fmovdgu	%xcc,	%f8,	%f0
	ldd	[%l7 + 0x60],	%o0
	call	loop_444
	bpos,pt	%xcc,	loop_445
	fmovdo	%fcc0,	%f18,	%f12
	edge16l	%i2,	%o7,	%g5
loop_444:
	fmovspos	%icc,	%f14,	%f5
loop_445:
	movcc	%xcc,	%l3,	%o4
	nop
	fitos	%f4,	%f7
	fstoi	%f7,	%f3
	movcs	%xcc,	%o1,	%g1
	and	%l1,	0x0FED,	%g2
	call	loop_446
	wrpr	%g7,	0x140C,	%tick
	call	loop_447
	wrpr	%o3,	%i0,	%pil
loop_446:
	call	loop_448
	nop
	setx	0x747F596B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x02CEC96A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f12,	%f7
loop_447:
	mulx	%o5,	%i3,	%l4
	call	loop_449
loop_448:
	call	loop_450
	movlg	%fcc2,	0x08E,	%g4
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_449:
	call	loop_451
loop_450:
	bpos,a,pt	%xcc,	loop_452
	call	loop_453
	nop
	setx	0x0021C735ED026B0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f30
loop_451:
	orncc	%l5,	%i5,	%i6
loop_452:
	call	loop_454
loop_453:
	fmovduge	%fcc3,	%f10,	%f2
	call	loop_455
	edge32	%g3,	%l0,	%i1
loop_454:
	nop

loop_455:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 21
!	Type a   	: 23
!	Type x   	: 12
!	Type cti   	: 155
!	Type f   	: 148
!	Type i   	: 141
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
	set	0x2,	%g1
	set	0x0,	%g2
	set	0x2,	%g3
	set	0x1,	%g4
	set	0x1,	%g5
	set	0x7,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x2,	%i1
	set	-0x3,	%i2
	set	-0xD,	%i3
	set	-0xB,	%i4
	set	-0x2,	%i5
	set	-0x0,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x08BE47E8,	%l0
	set	0x16F5C7B5,	%l1
	set	0x5630405C,	%l2
	set	0x7542971C,	%l3
	set	0x619C504E,	%l4
	set	0x5074118A,	%l5
	set	0x59719EC4,	%l6
	!# Output registers
	set	0x0203,	%o0
	set	0x0BBF,	%o1
	set	0x1EAD,	%o2
	set	-0x1EF4,	%o3
	set	-0x0BA3,	%o4
	set	0x03A0,	%o5
	set	0x1EE1,	%o6
	set	-0x1DFF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	nop
	set	0x48, %i0
	std	%g6,	[%l7 + %i0]
	fcmple16	%f6,	%f14,	%o2
	rdhpr	%ver,	%i4
	nop
	set	0x78, %o7
	sth	%l6,	[%l7 + %o7]
	movul	%fcc1,	0x2A4,	%l2
	rd	%sys_tick_cmpr,	%i7
	rdpr	%wstate,	%o0
	call	loop_456
	call	loop_457
	rdhpr	%hpstate,	%o6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_456:
	wrpr	%i2,	%g5,	%tick
loop_457:
	rdhpr	%ver,	%o7
	fsrc2s	%f23,	%f30
	call	loop_458
	call	loop_459
	movpos	%icc,	0x126,	%l3
	pdist	%f26,	%f10,	%f22
loop_458:
	rd	%pc,	%o4
loop_459:
	nop
	set	0x7C, %g5
	lduh	[%l7 + %g5],	%o1
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f28
	fxtod	%f28,	%f24
	fmovd	%f6,	%f12
	fmul8x16au	%f3,	%f3,	%f10
	call	loop_460
	taddcctv	%g1,	%l1,	%g7
	edge16	%o3,	%g2,	%o5
	popc	0x0D35,	%i0
loop_460:
	fmovdneg	%icc,	%f4,	%f6
	call	loop_461
	call	loop_462
	movrgz	%l4,	0x228,	%g4
	fmovdug	%fcc1,	%f2,	%f10
loop_461:
	call	loop_463
loop_462:
	call	loop_464
	sra	%l5,	0x11,	%i3
	sll	%i5,	%i6,	%g3
loop_463:
	call	loop_465
loop_464:
	fmovdl	%fcc2,	%f10,	%f22
	fmovdl	%xcc,	%f28,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_465:
	call	loop_466
	fpack16	%f2,	%f17
	tge	%icc,	0x2
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x04,	%o2
loop_466:
	fmovdo	%fcc2,	%f8,	%f18
	fmovrsne	%i4,	%f11,	%f30
	fmul8x16al	%f15,	%f28,	%f8
	pdist	%f10,	%f20,	%f14
	call	loop_467
	call	loop_468
	taddcc	%l6,	%l2,	%i7
	call	loop_469
loop_467:
	fmovdcc	%xcc,	%f2,	%f26
loop_468:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x66] %asi,	%g6
loop_469:
	popc	%o0,	%i2
	movrgz	%g5,	%o6,	%o7
	nop
	setx	0x1D36,	%l0,	%o1
	udivcc	%o4,	%o1,	%g1
	call	loop_470
	fmovrslez	%l1,	%f6,	%f23
	sir	0x169B
	edge32	%g7,	%l3,	%o3
loop_470:
	call	loop_471
	movpos	%icc,	%o5,	%i0
	movrlz	%l4,	%g2,	%g4
	orcc	%l5,	0x15E1,	%i3
loop_471:
	bshuffle	%f26,	%f20,	%f6
	rdpr	%otherwin,	%i5
	fone	%f10
	call	loop_472
	call	loop_473
	fpsub16s	%f14,	%f6,	%f22
	call	loop_474
loop_472:
	wr	%i6,	0x0B5D,	%pic
loop_473:
	tl	%icc,	0x4
	call	loop_475
loop_474:
	fpadd32	%f30,	%f2,	%f26
	tge	%xcc,	0x5
	fmovscs	%xcc,	%f24,	%f5
loop_475:
	subcc	%l0,	0x1BFA,	%g3
	wrpr	%i1,	%o2,	%tick
	bcs,a,pt	%icc,	loop_476
	fpack16	%f28,	%f3
	edge16	%i4,	%l2,	%i7
	fnot1	%f4,	%f20
loop_476:
	fmovdlg	%fcc3,	%f22,	%f20
	tg	%xcc,	0x3
	fmovdvs	%icc,	%f28,	%f26
	call	loop_477
	call	loop_478
	fmovsg	%fcc2,	%f22,	%f31
	wrpr 	%g0, 	0x0, 	%gl
loop_477:
	mova	%xcc,	0x481,	%i2
loop_478:
	fbue,a	%fcc2,	loop_479
	brlz,pt	%g5,	loop_480
	edge16n	%l6,	%o7,	%o4
	bmask	%o6,	%g1,	%o1
loop_479:
	fmovdge	%xcc,	%f4,	%f20
loop_480:
	call	loop_481
	fmovrdgz	%g7,	%f0,	%f12
	ta	%icc,	0x7
	rdpr	%otherwin,	%l1
loop_481:
	call	loop_482
	fpadd16	%f8,	%f28,	%f18
	or	%l3,	0x1E4E,	%o5
	nop
	setx	0x0718,	%l0,	%o3
	sdivcc	%i0,	%o3,	%g2
loop_482:
	sir	0x002F
	edge32	%l4,	%g4,	%l5
	fabsd	%f24,	%f6
	bpos,pn	%icc,	loop_483
	tl	%icc,	0x2
	call	loop_484
	call	loop_485
loop_483:
	fandnot2s	%f1,	%f23,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6BE, 	%sys_tick_cmpr
loop_484:
	fpadd16s	%f14,	%f28,	%f7
loop_485:
	call	loop_486
	fcmpd	%fcc0,	%f6,	%f12
	call	loop_487
	fcmpne16	%f24,	%f2,	%i6
loop_486:
	call	loop_488
	sdiv	%i3,	0x0C9B,	%g3
loop_487:
	sub	%i1,	%l0,	%o2
	rdpr	%tba,	%i4
loop_488:
	call	loop_489
	fmul8x16al	%f25,	%f20,	%f18
	call	loop_490
	nop
	fitos	%f7,	%f15
	fstox	%f15,	%f4
loop_489:
	flushw
	call	loop_491
loop_490:
	fnegd	%f18,	%f18
	fandnot2	%f24,	%f16,	%f14
	call	loop_492
loop_491:
	fabss	%f25,	%f13
	movug	%fcc2,	0x6B8,	%l2
	nop
	setx	0xB9C97AC23DE23293,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x37AD5E486FBF7119,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f0,	%f4
loop_492:
	fble	%fcc3,	loop_493
	rd	%sys_tick_cmpr,	%i7
	sll	%g6,	0x15,	%i2
	fmovdug	%fcc1,	%f16,	%f22
loop_493:
	movule	%fcc2,	0x2E7,	%o0
	call	loop_494
	call	loop_495
	call	loop_496
	call	loop_497
loop_494:
	fabsd	%f22,	%f26
loop_495:
	andcc	%g5,	0x1773,	%o7
loop_496:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f12
loop_497:
	fcmped	%fcc0,	%f0,	%f30
	lduh	[%l7 + 0x0C],	%o4
	call	loop_498
	smul	%l6,	%g1,	%o1
	call	loop_499
	fba	%fcc1,	loop_500
loop_498:
	ta	%xcc,	0x7
	tsubcc	%o6,	0x0065,	%g7
loop_499:
	call	loop_501
loop_500:
	call	loop_502
	wrpr 	%g0, 	0x2, 	%gl
	fxnor	%f20,	%f18,	%f30
loop_501:
	movvs	%icc,	0x664,	%o5
loop_502:
	sethi	0x041E,	%l1
	call	loop_503
	fbg	%fcc3,	loop_504
	nop
	set	0x28, %l2
	stx	%o3,	[%l7 + %l2]
	call	loop_505
loop_503:
	movug	%fcc2,	%i0,	%g2
loop_504:
	call	loop_506
	call	loop_507
loop_505:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f14
	fbne,a,pn	%fcc0,	loop_508
loop_506:
	xor	%g4,	0x123F,	%l5
loop_507:
	call	loop_509
	call	loop_510
loop_508:
	fmovdpos	%xcc,	%f28,	%f0
	fbne,a,pn	%fcc3,	loop_511
loop_509:
	fmovrdlz	%i5,	%f10,	%f0
loop_510:
	wrpr	%i6,	%i3,	%pil
	nop
	setx	0x05E8,	%l0,	%i1
	sdivcc	%g3,	%i1,	%l0
loop_511:
	movvc	%xcc,	%l4,	%o2
	call	loop_512
	fmovrde	%l2,	%f30,	%f2
	swap	[%l7 + 0x38],	%i7
	fand	%f8,	%f4,	%f10
loop_512:
	call	loop_513
	call	loop_514
	movvc	%icc,	0x0C1,	%i4
	orcc	%i2,	0x15D1,	%g6
loop_513:
	movrlez	%o0,	%g5,	%o7
loop_514:
	rdpr	%cleanwin,	%l6
	movl	%fcc0,	0x429,	%g1
	fbuge,pt	%fcc3,	loop_515
	rdhpr	%hintp,	%o1
	fmul8x16	%f18,	%f26,	%f30
	call	loop_516
loop_515:
	call	loop_517
	fbl,pn	%fcc0,	loop_518
	tl	%xcc,	0x1
loop_516:
	rdpr	%pil,	%o4
loop_517:
	rd	%pc,	%o6
loop_518:
	tg	%xcc,	0x4
	call	loop_519
	fmovduge	%fcc0,	%f16,	%f6
	fcmple16	%f10,	%f26,	%l3
	andcc	%o5,	0x04E1,	%l1
loop_519:
	call	loop_520
	rdhpr	%htba,	%g7
	fpack16	%f6,	%f28
	tneg	%xcc,	0x5
loop_520:
	movrgez	%i0,	%o3,	%g4
	call	loop_521
	alignaddr	%g2,	%i5,	%l5
	addc	%i3,	%i6,	%i1
	subccc	%g3,	%l0,	%l4
loop_521:
	fbe,pn	%fcc0,	loop_522
	fcmple16	%f22,	%f26,	%o2
	nop
	setx	0xB5722DE581E91B9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x491D275DA18FFBD9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f18,	%f6
	call	loop_523
loop_522:
	wr 	%g0, 	0x7, 	%fprs
	edge32ln	%i4,	%i2,	%g6
	fcmpgt16	%f6,	%f0,	%o0
loop_523:
	wrpr	%g5,	0x06A3,	%tick
	fmuld8sux16	%f25,	%f28,	%f24
	call	loop_524
	movvc	%icc,	%o7,	%l6
	call	loop_525
	fmovrse	%l2,	%f20,	%f3
loop_524:
	call	loop_526
	fmovdcs	%icc,	%f0,	%f6
loop_525:
	fmovsule	%fcc3,	%f4,	%f4
	call	loop_527
loop_526:
	rdhpr	%ver,	%o1
	nop
	set	0x5A, %g1
	ldsh	[%l7 + %g1],	%o4
	nop
	setx	0x64F547D9F4C8573F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x65354D9755E685DF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f24,	%f2
loop_527:
	call	loop_528
	call	loop_529
	call	loop_530
	fandnot1	%f4,	%f24,	%f8
loop_528:
	tn	%icc,	0x7
loop_529:
	fmovdvs	%icc,	%f20,	%f26
loop_530:
	call	loop_531
	array8	%o6,	%g1,	%o5
	subc	%l3,	%g7,	%i0
	edge32ln	%l1,	%o3,	%g2
loop_531:
	call	loop_532
	umulcc	%i5,	0x0222,	%l5
	fmovdneg	%xcc,	%f16,	%f18
	call	loop_533
loop_532:
	nop
	setx	0xBAD2BAF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x0DA91618,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f12,	%f26
	tneg	%icc,	0x5
	wrpr	%g4,	0x0C31,	%tick
loop_533:
	fnot1	%f14,	%f20
	call	loop_534
	tne	%icc,	0x4
	fandnot1	%f10,	%f14,	%f14
	fmovrslez	%i6,	%f24,	%f12
loop_534:
	fmovslg	%fcc0,	%f26,	%f25
	wrpr	%i1,	%i3,	%cwp
	call	loop_535
	call	loop_536
	nop
	set	0x5C, %g7
	swap	[%l7 + %g7],	%l0
	call	loop_537
loop_535:
	xnorcc	%g3,	0x10D5,	%o2
loop_536:
	call	loop_538
	fmovduge	%fcc1,	%f4,	%f10
loop_537:
	edge16l	%i7,	%i4,	%l4
	tl	%xcc,	0x5
loop_538:
	call	loop_539
	movrgz	%i2,	%o0,	%g5
	fornot1s	%f16,	%f2,	%f21
	movrlez	%o7,	0x010,	%g6
loop_539:
	fcmple16	%f24,	%f16,	%l2
	edge16	%o1,	%l6,	%o6
	call	loop_540
	fandnot1	%f22,	%f0,	%f2
	fmovsa	%fcc3,	%f4,	%f3
	fands	%f0,	%f7,	%f14
loop_540:
	fcmpne16	%f26,	%f14,	%o4
	call	loop_541
	fxnor	%f10,	%f14,	%f28
	bn,pt	%xcc,	loop_542
	nop
	set	0x77, %g2
	ldstub	[%l7 + %g2],	%o5
loop_541:
	srax	%l3,	%g7,	%g1
	fsrc1	%f6,	%f24
loop_542:
	fmovdo	%fcc1,	%f18,	%f20
	xorcc	%i0,	%l1,	%o3
	fmovsge	%icc,	%f15,	%f26
	call	loop_543
	mulx	%i5,	%g2,	%l5
	fnot1s	%f13,	%f13
	rdpr	%cleanwin,	%g4
loop_543:
	mulx	%i6,	0x1607,	%i1
	taddcctv	%l0,	0x0D5E,	%g3
	std	%f24,	[%l7 + 0x20]
	fxor	%f24,	%f10,	%f16
	call	loop_544
	bvc,pn	%icc,	loop_545
	rd	%ccr,	%o2
	call	loop_546
loop_544:
	call	loop_547
loop_545:
	be,a,pt	%icc,	loop_548
	call	loop_549
loop_546:
	membar	0x11
loop_547:
	call	loop_550
loop_548:
	popc	0x158F,	%i7
loop_549:
	st	%f17,	[%l7 + 0x10]
	fmovsne	%fcc3,	%f22,	%f28
loop_550:
	call	loop_551
	fmovrdlz	%i3,	%f22,	%f6
	fmovrse	%l4,	%f0,	%f9
	movu	%fcc2,	0x4F8,	%i4
loop_551:
	call	loop_552
	brlz,a	%i2,	loop_553
	call	loop_554
	fmovsug	%fcc1,	%f25,	%f18
loop_552:
	call	loop_555
loop_553:
	movlg	%fcc3,	%o0,	%o7
loop_554:
	call	loop_556
	call	loop_557
loop_555:
	movpos	%xcc,	%g6,	%l2
	fbug,pn	%fcc1,	loop_558
loop_556:
	edge8l	%o1,	%g5,	%l6
loop_557:
	xorcc	%o4,	%o5,	%o6
	call	loop_559
loop_558:
	fnot2	%f26,	%f12
	call	loop_560
	call	loop_561
loop_559:
	fzeros	%f24
	call	loop_562
loop_560:
	movue	%fcc0,	0x7E7,	%g7
loop_561:
	call	loop_563
	srlx	%l3,	0x1E,	%i0
loop_562:
	nop
	setx	0xDEF28A72DF9A38E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x28E60F5D2C7C0471,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f4,	%f24
	set	0x66, %o5
	stha	%l1,	[%l7 + %o5] 0x0c
loop_563:
	call	loop_564
	call	loop_565
	call	loop_566
	nop
	setx	0xD0DCE009C70F1A64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA5156A389D5102AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f10,	%f14
loop_564:
	fmovdue	%fcc0,	%f30,	%f2
loop_565:
	for	%f26,	%f20,	%f24
loop_566:
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f4
	call	loop_567
	call	loop_568
	movrgz	%g1,	0x259,	%i5
	fmovsa	%xcc,	%f11,	%f27
loop_567:
	std	%o2,	[%l7 + 0x68]
loop_568:
	alignaddr	%g2,	%l5,	%i6
	call	loop_569
	mulx	%g4,	0x0341,	%i1
	movneg	%xcc,	%g3,	%o2
	call	loop_570
loop_569:
	bshuffle	%f8,	%f18,	%f26
	wrpr	%l0,	0x0E1E,	%cwp
	tne	%icc,	0x1
loop_570:
	fpsub32	%f16,	%f22,	%f12
	addc	%i7,	%l4,	%i3
	fmovsu	%fcc1,	%f29,	%f7
	fmovdo	%fcc0,	%f6,	%f8
	edge8l	%i4,	%o0,	%i2
	fmovrdlez	%g6,	%f6,	%f0
	call	loop_571
	call	loop_572
	smulcc	%o7,	0x0D9D,	%o1
	call	loop_573
loop_571:
	array16	%g5,	%l2,	%o4
loop_572:
	call	loop_574
	bne	%icc,	loop_575
loop_573:
	fand	%f4,	%f0,	%f2
	fornot2s	%f20,	%f19,	%f10
loop_574:
	nop
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x2e,	%o4
loop_575:
	movleu	%icc,	0x4E6,	%l6
	fmovsneg	%xcc,	%f28,	%f4
	fmovs	%f8,	%f17
	fbg	%fcc3,	loop_576
	fmovdcc	%xcc,	%f0,	%f4
	nop
	set	0x0C, %o3
	flush	%l7 + %o3
	xnorcc	%g7,	%l3,	%o6
loop_576:
	fone	%f22
	call	loop_577
	call	loop_578
	xnorcc	%l1,	0x112E,	%g1
	call	loop_579
loop_577:
	edge16	%i5,	%o3,	%g2
loop_578:
	fmovsu	%fcc1,	%f26,	%f15
	fmovsleu	%icc,	%f14,	%f28
loop_579:
	fbe,a	%fcc3,	loop_580
	bneg	%icc,	loop_581
	fmul8x16au	%f25,	%f7,	%f26
	call	loop_582
loop_580:
	fandnot2	%f26,	%f12,	%f12
loop_581:
	fandnot1s	%f24,	%f13,	%f4
	fpsub32s	%f9,	%f2,	%f18
loop_582:
	fmovdn	%fcc3,	%f26,	%f10
	nop
	setx	0x09C50C7BAA638A12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	tvs	%xcc,	0x0
	call	loop_583
	subcc	%l5,	%i0,	%i6
	call	loop_584
	popc	0x0F21,	%g4
loop_583:
	fmovdg	%fcc0,	%f28,	%f30
	fbug	%fcc3,	loop_585
loop_584:
	call	loop_586
	call	loop_587
	call	loop_588
loop_585:
	call	loop_589
loop_586:
	fmovscc	%xcc,	%f6,	%f25
loop_587:
	fone	%f14
loop_588:
	nop
	setx	0x025299D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x5AFDE392,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f3,	%f10
loop_589:
	and	%g3,	%o2,	%i1
	movuge	%fcc3,	%l0,	%i7
	fmovsg	%fcc3,	%f20,	%f17
	call	loop_590
	taddcctv	%l4,	%i4,	%o0
	fmovso	%fcc2,	%f29,	%f3
	fmovdl	%fcc3,	%f26,	%f20
loop_590:
	call	loop_591
	rd	%sys_tick_cmpr,	%i2
	movrlz	%g6,	%o7,	%o1
	andncc	%i3,	0x03CB,	%g5
loop_591:
	call	loop_592
	movue	%fcc0,	%l2,	%o5
	call	loop_593
	bvs,pt	%icc,	loop_594
loop_592:
	umul	%o4,	%g7,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD7B, 	%hsys_tick_cmpr
loop_593:
	movuge	%fcc0,	%g1,	%i5
loop_594:
	bn,pt	%xcc,	loop_595
	movl	%xcc,	0x5C5,	%o3
	subcc	%g2,	0x014E,	%l1
	udiv	%i0,	0x0081,	%l5
loop_595:
	call	loop_596
	call	loop_597
	udivcc	%g4,	0x1EB3,	%i6
	call	loop_598
loop_596:
	call	loop_599
loop_597:
	fmovdvc	%icc,	%f6,	%f0
	call	loop_600
loop_598:
	fmovrdgez	%o2,	%f24,	%f10
loop_599:
	edge8	%g3,	%i1,	%l0
	rdhpr	%ver,	%l4
loop_600:
	call	loop_601
	smulcc	%i7,	0x0EEC,	%i4
	wrpr	%o0,	%g6,	%cwp
	fcmpes	%fcc1,	%f16,	%f11
loop_601:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%o7
	mulx	%i3,	%g5,	%o1
	fmovde	%icc,	%f12,	%f14
	wrpr	%l2,	0x010D,	%tick
	movle	%fcc3,	0x505,	%o4
	fmovsa	%fcc3,	%f24,	%f22
	nop
	setx	0xD7895A907391ED79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movl	%icc,	%l3,	%l6
	array8	%o6,	%o5,	%g1
	call	loop_602
	bg,a	%icc,	loop_603
	edge32	%i5,	%o3,	%g2
	movge	%fcc3,	%i0,	%l1
loop_602:
	wrpr	%l5,	%i6,	%pil
loop_603:
	call	loop_604
	movo	%fcc3,	0x03A,	%g4
	bn,a,pn	%icc,	loop_605
	call	loop_606
loop_604:
	fnor	%f22,	%f8,	%f24
	call	loop_607
loop_605:
	fmovdg	%icc,	%f30,	%f22
loop_606:
	wr	%o2,	%g3,	%pic
	fornot1s	%f28,	%f2,	%f24
loop_607:
	call	loop_608
	fandnot1s	%f0,	%f13,	%f11
	call	loop_609
	fabss	%f15,	%f12
loop_608:
	call	loop_610
	sethi	0x13F0,	%i1
loop_609:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%l4,	[%l7 + 0x60] %asi
loop_610:
	nop
	fitod	%f2,	%f22
	fdtox	%f22,	%f10
	fnor	%f10,	%f30,	%f4
	array16	%l0,	%i7,	%o0
	fbule	%fcc0,	loop_611
	fnegd	%f10,	%f20
	fmovsa	%fcc3,	%f6,	%f12
	fmovdule	%fcc3,	%f6,	%f2
loop_611:
	bne,a,pn	%xcc,	loop_612
	call	loop_613
	fmovd	%f30,	%f22
	call	loop_614
loop_612:
	fblg,a	%fcc0,	loop_615
loop_613:
	nop
	set	0x40, %i2
	lduh	[%l7 + %i2],	%i4
	nop
	setx	0x01B8,	%l0,	%o7
	udivx	%i2,	%o7,	%i3
loop_614:
	fcmped	%fcc1,	%f20,	%f10
loop_615:
	fmovsgu	%xcc,	%f6,	%f9
	fmovdn	%icc,	%f10,	%f4
	tsubcctv	%g5,	0x0B54,	%g6
	call	loop_616
	fors	%f4,	%f21,	%f5
loop_616:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 20
!	Type a   	: 39
!	Type x   	: 6
!	Type cti   	: 161
!	Type f   	: 143
!	Type i   	: 131
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
	set	0x1,	%g1
	set	0xB,	%g2
	set	0xF,	%g3
	set	0xF,	%g4
	set	0x1,	%g5
	set	0x3,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xE,	%i1
	set	-0x3,	%i2
	set	-0x0,	%i3
	set	-0x4,	%i4
	set	-0x1,	%i5
	set	-0xB,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x441322A2,	%l0
	set	0x325DB860,	%l1
	set	0x4D9D4B85,	%l2
	set	0x7959E35B,	%l3
	set	0x7B724C4A,	%l4
	set	0x50B33F89,	%l5
	set	0x6D379B8B,	%l6
	!# Output registers
	set	0x1186,	%o0
	set	0x1183,	%o1
	set	-0x0FAE,	%o2
	set	-0x067F,	%o3
	set	0x016D,	%o4
	set	0x02EC,	%o5
	set	-0x08F4,	%o6
	set	0x1461,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	taddcc	%o1,	0x05AF,	%o4
	movneg	%xcc,	0x475,	%g7
	rd	%pc,	%l3
	fble	%fcc3,	loop_617
	subcc	%l2,	0x15AC,	%l6
	call	loop_618
	call	loop_619
loop_617:
	call	loop_620
	call	loop_621
loop_618:
	fandnot1s	%f16,	%f24,	%f20
loop_619:
	edge32n	%o6,	%g1,	%o5
loop_620:
	fbo,a,pn	%fcc0,	loop_622
loop_621:
	movre	%i5,	%o3,	%i0
	nop
	set	0x10, %i1
	std	%f26,	[%l7 + %i1]
	fnegd	%f10,	%f28
loop_622:
	call	loop_623
	tn	%xcc,	0x3
	fpadd16	%f10,	%f26,	%f4
	nop
	set	0x11, %i3
	ldstub	[%l7 + %i3],	%l1
loop_623:
	movuge	%fcc3,	%g2,	%i6
	edge32	%g4,	%o2,	%l5
	wrpr	%g3,	%i1,	%pil
	fsrc1	%f14,	%f14
	fmovrdne	%l4,	%f0,	%f28
	fmovrdlez	%l0,	%f24,	%f28
	fnot2s	%f2,	%f9
	nop
	setx	0x5C300782,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x4054859B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f28,	%f21
	fbn,a,pt	%fcc0,	loop_624
	edge16l	%o0,	%i7,	%i4
	fmovse	%fcc1,	%f28,	%f2
	rd	%fprs,	%o7
loop_624:
	call	loop_625
	movn	%xcc,	%i2,	%i3
	call	loop_626
	call	loop_627
loop_625:
	fcmped	%fcc1,	%f2,	%f24
	fnors	%f16,	%f20,	%f10
loop_626:
	call	loop_628
loop_627:
	call	loop_629
	fmovsue	%fcc1,	%f9,	%f13
	edge16l	%g6,	%g5,	%o4
loop_628:
	movpos	%icc,	0x634,	%o1
loop_629:
	call	loop_630
	call	loop_631
	call	loop_632
	subcc	%g7,	%l3,	%l6
loop_630:
	call	loop_633
loop_631:
	fmovdge	%fcc3,	%f30,	%f20
loop_632:
	call	loop_634
	ba,a	%xcc,	loop_635
loop_633:
	movpos	%icc,	%o6,	%l2
	fmul8ulx16	%f12,	%f0,	%f18
loop_634:
	movuge	%fcc1,	0x54B,	%o5
loop_635:
	fpsub16	%f18,	%f0,	%f12
	fsrc1s	%f21,	%f16
	call	loop_636
	fbne	%fcc2,	loop_637
	tn	%xcc,	0x6
	fcmpne16	%f2,	%f8,	%g1
loop_636:
	fzero	%f4
loop_637:
	and	%o3,	0x0578,	%i0
	udivx	%l1,	0x16FF,	%g2
	addc	%i5,	0x064D,	%i6
	call	loop_638
	nop
	fitod	%f0,	%f20
	fdtoi	%f20,	%f28
	call	loop_639
	fpsub32	%f26,	%f0,	%f16
loop_638:
	pdist	%f16,	%f18,	%f18
	fbuge,a,pn	%fcc0,	loop_640
loop_639:
	fcmple16	%f0,	%f30,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	fitos	%f0,	%f13
	fstoi	%f13,	%f31
loop_640:
	call	loop_641
	rdhpr	%hsys_tick_cmpr,	%i1
	call	loop_642
	fble	%fcc2,	loop_643
loop_641:
	fmovdcs	%xcc,	%f26,	%f22
	call	loop_644
loop_642:
	call	loop_645
loop_643:
	call	loop_646
	fbu	%fcc3,	loop_647
loop_644:
	fmovslg	%fcc2,	%f30,	%f31
loop_645:
	call	loop_648
loop_646:
	nop
	fitos	%f4,	%f22
	fstod	%f22,	%f30
loop_647:
	bvs,pt	%xcc,	loop_649
	fmovrdgz	%l4,	%f30,	%f22
loop_648:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x833, 	%hsys_tick_cmpr
	movuge	%fcc1,	%l0,	%o0
loop_649:
	call	loop_650
	fmovspos	%icc,	%f6,	%f15
	fbn	%fcc1,	loop_651
	call	loop_652
loop_650:
	wrpr	%i4,	0x0DB2,	%pil
	srlx	%i7,	0x02,	%i2
loop_651:
	call	loop_653
loop_652:
	fors	%f22,	%f18,	%f5
	call	loop_654
	fpsub16	%f26,	%f6,	%f4
loop_653:
	fmovdge	%xcc,	%f30,	%f20
	fmovda	%fcc2,	%f2,	%f8
loop_654:
	movge	%xcc,	%o7,	%i3
	fsrc1	%f18,	%f28
	nop
	setx	0x69F615F30A9895F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xA9E4702A2B11A249,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f18,	%f0
	call	loop_655
	st	%f16,	[%l7 + 0x58]
	nop
	setx	loop_656,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014400001405,	%l0,	%l1
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
	mova	%fcc2,	0x24B,	%g5
loop_655:
	fornot2	%f4,	%f26,	%f22
	tleu	%xcc,	0x5
loop_656:
	call	loop_657
	ld	[%l7 + 0x0C],	%f22
	fmul8x16	%f12,	%f14,	%f12
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x11
loop_657:
	nop
	fitos	%f30,	%f7
	nop
	setx	0x53C0BDD94D1554D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x0DBB5AF44E3BEC37,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f0
	call	loop_658
	fmul8ulx16	%f8,	%f20,	%f16
	call	loop_659
	siam	0x2
loop_658:
	call	loop_660
	call	loop_661
loop_659:
	call	loop_662
	call	loop_663
loop_660:
	fmul8x16al	%f4,	%f11,	%f0
loop_661:
	call	loop_664
loop_662:
	mulscc	%g6,	0x0114,	%o1
loop_663:
	siam	0x3
	sethi	0x18CF,	%o4
loop_664:
	nop
	setx	0x6B6B22AFF723186F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x251EC50743BB8F6F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f30,	%f4
	fpadd16	%f22,	%f10,	%f10
	movu	%fcc0,	0x087,	%l3
	siam	0x0
	call	loop_665
	rdhpr	%hsys_tick_cmpr,	%g7
	nop
	setx	0x50088FD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x60FF21F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f0,	%f0
	call	loop_666
loop_665:
	call	loop_667
	fmovdul	%fcc2,	%f8,	%f16
	movul	%fcc1,	0x4A2,	%l6
loop_666:
	fmovse	%fcc1,	%f6,	%f26
loop_667:
	fxors	%f12,	%f12,	%f12
	fsrc1	%f16,	%f24
	nop
	setx	0x2DE3C561,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x4AB81682,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f15,	%f6
	fnors	%f11,	%f20,	%f17
	fmovdleu	%xcc,	%f20,	%f30
	call	loop_668
	call	loop_669
	movul	%fcc0,	%l2,	%o5
	bvs,a,pn	%icc,	loop_670
loop_668:
	fmovscs	%icc,	%f6,	%f8
loop_669:
	fmovdn	%fcc0,	%f28,	%f20
	fcmpd	%fcc3,	%f18,	%f0
loop_670:
	fsrc1	%f12,	%f0
	wr	%g0,	0x89,	%asi
	stwa	%o6,	[%l7 + 0x78] %asi
	call	loop_671
	call	loop_672
	call	loop_673
	call	loop_674
loop_671:
	nop
	fitod	%f0,	%f24
	fdtox	%f24,	%f14
loop_672:
	fmovdge	%fcc3,	%f8,	%f4
loop_673:
	xor	%g1,	0x0AEE,	%o3
loop_674:
	call	loop_675
	call	loop_676
	fornot1	%f4,	%f2,	%f18
	call	loop_677
loop_675:
	xnorcc	%i0,	%g2,	%l1
loop_676:
	fmovse	%icc,	%f24,	%f21
	fpadd16s	%f28,	%f12,	%f3
loop_677:
	fpackfix	%f12,	%f11
	and	%i5,	0x039E,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%y,	%l5
	call	loop_678
	movge	%xcc,	0x77D,	%g3
	fbue,a	%fcc3,	loop_679
	bmask	%i1,	%l4,	%g4
loop_678:
	tn	%icc,	0x6
	fcmpeq32	%f30,	%f16,	%o0
loop_679:
	call	loop_680
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitos	%f30,	%f29
	call	loop_681
loop_680:
	movlg	%fcc1,	%l0,	%i7
	add	%i4,	0x1608,	%o7
	call	loop_682
loop_681:
	sll	%i3,	%g5,	%i2
	fornot1	%f4,	%f28,	%f10
	bvs,a	%xcc,	loop_683
loop_682:
	fmovsvc	%icc,	%f21,	%f31
	wr	%o1,	%o4,	%sys_tick
	edge32	%g6,	%g7,	%l6
loop_683:
	call	loop_684
	rdhpr	%ver,	%l3
	call	loop_685
	fmovsug	%fcc2,	%f5,	%f24
loop_684:
	fpadd32	%f16,	%f0,	%f2
	wr	%g0,	0xe2,	%asi
	stba	%l2,	[%l7 + 0x0D] %asi
	membar	#Sync
loop_685:
	xor	%o5,	0x0823,	%o6
	fmovrsne	%o3,	%f19,	%f23
	fmovsl	%fcc2,	%f0,	%f2
	call	loop_686
	call	loop_687
	fmovsue	%fcc3,	%f8,	%f4
	bgu,pt	%xcc,	loop_688
loop_686:
	tg	%xcc,	0x3
loop_687:
	call	loop_689
	call	loop_690
loop_688:
	fmovsug	%fcc2,	%f20,	%f12
	fmovrde	%i0,	%f10,	%f10
loop_689:
	edge32n	%g1,	%l1,	%i5
loop_690:
	brnz	%g2,	loop_691
	fxnors	%f18,	%f26,	%f18
	fbl	%fcc0,	loop_692
	call	loop_693
loop_691:
	call	loop_694
	addc	%i6,	%l5,	%g3
loop_692:
	movuge	%fcc3,	%i1,	%o2
loop_693:
	fpadd32	%f0,	%f12,	%f20
loop_694:
	call	loop_695
	fmovdcs	%xcc,	%f24,	%f2
	fmovspos	%icc,	%f10,	%f8
	movleu	%icc,	0x637,	%l4
loop_695:
	call	loop_696
	fornot1s	%f9,	%f27,	%f23
	fornot1s	%f19,	%f17,	%f10
	st	%f6,	[%l7 + 0x64]
loop_696:
	pdist	%f28,	%f28,	%f18
	movcs	%xcc,	0x12C,	%o0
	fmovduge	%fcc1,	%f28,	%f20
	call	loop_697
	call	loop_698
	srax	%l0,	0x05,	%g4
	call	loop_699
loop_697:
	subc	%i7,	%i4,	%i3
loop_698:
	movl	%icc,	%g5,	%o7
	fnegs	%f13,	%f22
loop_699:
	edge32n	%o1,	%o4,	%i2
	call	loop_700
	fnand	%f30,	%f30,	%f0
	wrpr	%g7,	0x1456,	%tick
	wr	%g6,	0x1F0D,	%softint
loop_700:
	fmovdcs	%icc,	%f18,	%f30
	popc	0x1EF8,	%l6
	call	loop_701
	bn,a	%xcc,	loop_702
	tn	%icc,	0x0
	fnors	%f24,	%f5,	%f14
loop_701:
	call	loop_703
loop_702:
	call	loop_704
	call	loop_705
	pdist	%f18,	%f2,	%f16
loop_703:
	call	loop_706
loop_704:
	fbe,a,pt	%fcc0,	loop_707
loop_705:
	call	loop_708
	bge,a	%icc,	loop_709
loop_706:
	fpsub16s	%f0,	%f6,	%f13
loop_707:
	tn	%icc,	0x1
loop_708:
	fmovscc	%icc,	%f16,	%f14
loop_709:
	call	loop_710
	call	loop_711
	nop
	setx	loop_712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032100001407,	%l0,	%l1
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
	movvc	%xcc,	%l3,	%l2
loop_710:
	bn,a	%xcc,	loop_713
loop_711:
	call	loop_714
loop_712:
	call	loop_715
	brlz	%o5,	loop_716
loop_713:
	nop
	setx	0x1E7E,	%l0,	%i0
	sdivcc	%o3,	%i0,	%o6
loop_714:
	call	loop_717
loop_715:
	call	loop_718
loop_716:
	call	loop_719
	brgez,a	%g1,	loop_720
loop_717:
	smul	%i5,	0x18A7,	%l1
loop_718:
	ta	%icc,	0x3
loop_719:
	call	loop_721
loop_720:
	fmovsu	%fcc0,	%f15,	%f31
	nop
	setx	0xDEA5BF7D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f17
	wrpr	%i6,	0x1EBD,	%tick
loop_721:
	fnand	%f30,	%f10,	%f12
	for	%f8,	%f0,	%f28
	edge16	%g2,	%g3,	%l5
	udiv	%i1,	0x0C8B,	%l4
	call	loop_722
	fors	%f30,	%f2,	%f14
	fmovdne	%fcc3,	%f6,	%f24
	call	loop_723
loop_722:
	call	loop_724
	array32	%o2,	%o0,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_723:
	call	loop_725
loop_724:
	lduw	[%l7 + 0x44],	%i4
	movre	%i3,	%l0,	%o7
	call	loop_726
loop_725:
	fcmpgt32	%f10,	%f6,	%g5
	xnorcc	%o1,	0x113E,	%i2
	fandnot1	%f12,	%f18,	%f16
loop_726:
	movrgez	%g7,	0x205,	%o4
	nop
	fitos	%f9,	%f13
	fstox	%f13,	%f6
	orcc	%g6,	%l6,	%l2
	fmovsne	%fcc0,	%f13,	%f5
	fmovrslz	%o5,	%f19,	%f14
	call	loop_727
	tge	%xcc,	0x5
	nop
	fitos	%f10,	%f17
	fstoi	%f17,	%f2
	fbne	%fcc0,	loop_728
loop_727:
	call	loop_729
	smulcc	%l3,	0x121F,	%o3
	bcs,a,pn	%icc,	loop_730
loop_728:
	andcc	%o6,	0x0E8F,	%i0
loop_729:
	call	loop_731
	call	loop_732
loop_730:
	call	loop_733
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f6
loop_731:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x22] %asi,	%i5
loop_732:
	fsrc1s	%f30,	%f30
loop_733:
	sub	%g1,	0x0C58,	%i6
	call	loop_734
	fmul8sux16	%f12,	%f24,	%f8
	movo	%fcc2,	0x0DD,	%l1
	fmovsvc	%xcc,	%f25,	%f2
loop_734:
	fmovrdne	%g2,	%f4,	%f18
	set	0x46, %o4
	lduha	[%l7 + %o4] 0x18,	%l5
	nop
	set	0x40, %l5
	std	%i0,	[%l7 + %l5]
	edge16	%g3,	%l4,	%o0
	edge16n	%g4,	%i7,	%i4
	fpadd32s	%f27,	%f26,	%f8
	call	loop_735
	nop
	setx	0x13E4,	%l1,	%l0
	sdivcc	%o2,	%l0,	%o7
	fpadd32	%f4,	%f14,	%f18
	xor	%g5,	0x1A89,	%o1
loop_735:
	fzeros	%f20
	fnot1	%f30,	%f4
	fmovdlg	%fcc3,	%f20,	%f10
	addc	%i2,	%g7,	%o4
	fmovsu	%fcc1,	%f30,	%f13
	fbge,a,pt	%fcc2,	loop_736
	fmovso	%fcc0,	%f16,	%f4
	nop
	setx	0x0F8997B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x311113F4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f18,	%f31
	nop
	setx	loop_737,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001400001406,	%l0,	%l1
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
loop_736:
	fmovse	%xcc,	%f26,	%f10
	fmovspos	%icc,	%f30,	%f7
	std	%i2,	[%l7 + 0x58]
loop_737:
	popc	%g6,	%l6
	fmovdleu	%icc,	%f16,	%f6
	set	0x1E, %i5
	ldsha	[%l7 + %i5] 0x0c,	%l2
	nop
	setx	0x7D983723,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xB35BA704,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f8,	%f24
	wr	%o5,	%l3,	%y
	fpadd32	%f18,	%f18,	%f8
	movu	%fcc2,	%o3,	%o6
	call	loop_738
	fmovsule	%fcc0,	%f31,	%f7
	faligndata	%f30,	%f2,	%f4
	fcmpd	%fcc2,	%f22,	%f22
loop_738:
	subccc	%i0,	0x07CF,	%i5
	fmovsneg	%xcc,	%f0,	%f10
	alignaddrl	%i6,	%g1,	%l1
	fabsd	%f4,	%f18
	fmovdleu	%icc,	%f22,	%f28
	fbug	%fcc3,	loop_739
	movule	%fcc2,	0x48A,	%l5
	fmovsg	%fcc2,	%f12,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_739:
	movne	%fcc3,	0x03B,	%g3
	fmovscc	%icc,	%f6,	%f3
	wrpr	%l4,	%g2,	%pil
	flushw
	call	loop_740
	fcmpeq32	%f0,	%f10,	%g4
	call	loop_741
	movleu	%xcc,	0x279,	%o0
loop_740:
	sll	%i7,	0x15,	%i4
	call	loop_742
loop_741:
	movrlez	%o2,	0x3B6,	%l0
	fbl,pt	%fcc2,	loop_743
	ta	%icc,	0x3
loop_742:
	fpsub16s	%f23,	%f24,	%f7
	call	loop_744
loop_743:
	nop
	setx	0xBABE659EB5E0AF1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x53014BFCDC52E447,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f16
	rd	%y,	%g5
	subc	%o1,	%o7,	%i2
loop_744:
	call	loop_745
	call	loop_746
	call	loop_747
	fmul8ulx16	%f4,	%f10,	%f8
loop_745:
	fsrc2	%f16,	%f18
loop_746:
	fmovsuge	%fcc2,	%f31,	%f18
loop_747:
	nop
	setx	0x0EC95952,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x885E99E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f20,	%f24
	edge16n	%o4,	%i3,	%g6
	addcc	%l6,	0x19EA,	%l2
	call	loop_748
	call	loop_749
	fands	%f31,	%f17,	%f8
	fmovsle	%fcc0,	%f30,	%f20
loop_748:
	nop
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x80,	%o5
loop_749:
	movleu	%icc,	%l3,	%g7
	nop
	setx	0x07E2,	%l0,	%o6
	udivx	%o3,	%o6,	%i0
	fmovse	%icc,	%f26,	%f3
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	udivx	%i6,	0x1255,	%l5
	fornot2	%f4,	%f12,	%f0
	umul	%i1,	0x06FE,	%g3
	fmovdue	%fcc0,	%f18,	%f24
	mulx	%l1,	0x17F8,	%g2
	bmask	%l4,	%o0,	%g4
	rdhpr	%hintp,	%i7
	call	loop_750
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbge	%fcc3,	loop_751
	tgu	%xcc,	0x2
loop_750:
	addc	%o2,	%i4,	%l0
	fcmple32	%f4,	%f8,	%o1
loop_751:
	rdpr	%tba,	%o7
	fone	%f22
	fmovdue	%fcc2,	%f24,	%f2
	tvc	%icc,	0x6
	nop
	setx	0x55300A22BCF277C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	call	loop_752
	fmul8x16al	%f2,	%f12,	%f2
	call	loop_753
	call	loop_754
loop_752:
	stb	%i2,	[%l7 + 0x5C]
	udivx	%o4,	0x1E51,	%i3
loop_753:
	movne	%xcc,	%g5,	%l6
loop_754:
	orncc	%g6,	0x185A,	%o5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	call	loop_755
	fandnot1	%f26,	%f20,	%f12
	bleu,a,pt	%xcc,	loop_756
	edge32ln	%l2,	%g7,	%o3
loop_755:
	nop
	set	0x72, %o6
	ldstub	[%l7 + %o6],	%l3
	call	loop_757
loop_756:
	tsubcctv	%i0,	0x0EA7,	%o6
	fmovdo	%fcc3,	%f0,	%f22
	orcc	%g1,	%i6,	%l5
loop_757:
	fpsub16s	%f0,	%f14,	%f24
	tcs	%icc,	0x0
	stbar
	call	loop_758
	nop
	fitos	%f9,	%f19
	fstoi	%f19,	%f20
	fmovdug	%fcc3,	%f30,	%f30
	tcs	%icc,	0x6
loop_758:
	fmovsvs	%xcc,	%f13,	%f8
	fcmple16	%f2,	%f10,	%i1
	fmovdpos	%icc,	%f16,	%f2
	fmovsul	%fcc2,	%f15,	%f19
	udiv	%i5,	0x1F17,	%g3
	fbug,a	%fcc3,	loop_759
	call	loop_760
	sdivx	%g2,	0x065F,	%l4
	addc	%o0,	0x1D52,	%g4
loop_759:
	fmovsneg	%icc,	%f29,	%f23
loop_760:
	fandnot1s	%f12,	%f14,	%f13
	tne	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%o2,	0x15D9,	%i4
	sllx	%l0,	0x16,	%o1
	call	loop_761
	xorcc	%o7,	%i2,	%o4
	movleu	%icc,	0x040,	%l1
	fxor	%f0,	%f16,	%f4
loop_761:
	edge32n	%g5,	%l6,	%g6
	fpack32	%f20,	%f14,	%f20
	nop
	setx	0x1A53,	%l0,	%i3
	udivx	%o5,	%i3,	%l2
	tn	%icc,	0x7
	call	loop_762
	rdpr	%pil,	%g7
	tvs	%icc,	0x0
	movleu	%xcc,	0x43F,	%o3
loop_762:
	xnorcc	%i0,	%o6,	%l3
	call	loop_763
	tgu	%xcc,	0x6
	nop
	setx	0x10DC,	%l0,	%i6
	udivcc	%g1,	%i6,	%l5
	call	loop_764
loop_763:
	nop
	setx	0xAFA40F9030F5FFC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f14
	nop
	setx	0x9DFA37D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x602B1C93,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f30,	%f10
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f6
loop_764:
	edge32ln	%i1,	%g3,	%g2
	fcmple16	%f28,	%f16,	%l4
	fmovdug	%fcc1,	%f4,	%f12
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x54] %asi,	%f27
	movvs	%xcc,	%o0,	%i5
	mulscc	%i7,	%g4,	%o2
	faligndata	%f10,	%f22,	%f16
	andncc	%i4,	%o1,	%l0
	call	loop_765
	rdhpr	%htba,	%i2
	edge32l	%o7,	%l1,	%g5
	fxnor	%f30,	%f30,	%f14
loop_765:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x7F6C928C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x04D7DCC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f26,	%f18
	call	loop_766
loop_766:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 22
!	Type a   	: 26
!	Type x   	: 9
!	Type cti   	: 150
!	Type f   	: 164
!	Type i   	: 129
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
	set	0x1,	%g2
	set	0x3,	%g3
	set	0x3,	%g4
	set	0x3,	%g5
	set	0xD,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xE,	%i1
	set	-0x7,	%i2
	set	-0x9,	%i3
	set	-0xF,	%i4
	set	-0x8,	%i5
	set	-0x6,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x169FFBF3,	%l0
	set	0x50383FAD,	%l1
	set	0x07283A32,	%l2
	set	0x1E0B2A0C,	%l3
	set	0x34028A79,	%l4
	set	0x7321FA08,	%l5
	set	0x68578544,	%l6
	!# Output registers
	set	0x1BCC,	%o0
	set	0x1169,	%o1
	set	0x0AAF,	%o2
	set	0x1E93,	%o3
	set	-0x0ACC,	%o4
	set	-0x0AAB,	%o5
	set	0x136A,	%o6
	set	0x0C37,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	call	loop_767
	movlg	%fcc3,	0x16C,	%l6
	set	0x6E, %g4
	ldsba	[%l7 + %g4] 0x81,	%g6
loop_767:
	movlg	%fcc3,	0x768,	%o4
	tsubcc	%o5,	0x184A,	%l2
	tsubcc	%i3,	%o3,	%g7
	call	loop_768
	fexpand	%f20,	%f24
	call	loop_769
	wrpr	%o6,	0x057A,	%cwp
loop_768:
	call	loop_770
	fcmpgt16	%f28,	%f12,	%i0
loop_769:
	nop
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x04
loop_770:
	andncc	%g1,	0x196E,	%l3
	call	loop_771
	call	loop_772
	call	loop_773
	ld	[%l7 + 0x54],	%f26
loop_771:
	fmovrde	%l5,	%f2,	%f26
loop_772:
	nop
	set	0x76, %o1
	sth	%i1,	[%l7 + %o1]
loop_773:
	brgez,pt	%g3,	loop_774
	fpack16	%f14,	%f14
	rdpr	%cwp,	%i6
	fnot2	%f16,	%f16
loop_774:
	tn	%xcc,	0x2
	fmovdule	%fcc2,	%f0,	%f6
	fors	%f2,	%f22,	%f20
	fnand	%f24,	%f10,	%f24
	nop
	setx	0x148C9AA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f19
	call	loop_775
	call	loop_776
	fmovsu	%fcc0,	%f20,	%f25
	fmovsn	%fcc3,	%f8,	%f7
loop_775:
	call	loop_777
loop_776:
	call	loop_778
	fmovdul	%fcc3,	%f14,	%f18
	call	loop_779
loop_777:
	call	loop_780
loop_778:
	fors	%f22,	%f5,	%f8
	fmovd	%f4,	%f18
loop_779:
	call	loop_781
loop_780:
	fxor	%f24,	%f22,	%f16
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_781:
	xnorcc	%l4,	%o0,	%i5
	fpackfix	%f22,	%f4
	sll	%i7,	%g2,	%o2
	rdpr	%pil,	%i4
	call	loop_782
	call	loop_783
	call	loop_784
	call	loop_785
loop_782:
	move	%fcc0,	%g4,	%l0
loop_783:
	rdpr	%otherwin,	%o1
loop_784:
	fbg	%fcc3,	loop_786
loop_785:
	ldub	[%l7 + 0x70],	%o7
	fmovsuge	%fcc0,	%f19,	%f16
	call	loop_787
loop_786:
	call	loop_788
	fmovdneg	%xcc,	%f2,	%f6
	call	loop_789
loop_787:
	call	loop_790
loop_788:
	orcc	%l1,	%i2,	%g5
	fmovsvs	%icc,	%f18,	%f7
loop_789:
	call	loop_791
loop_790:
	fcmpeq16	%f4,	%f0,	%g6
	fmovrdlz	%l6,	%f24,	%f18
	nop
	fitos	%f2,	%f22
	fstod	%f22,	%f4
loop_791:
	movrgez	%o5,	%l2,	%o4
	te	%xcc,	0x5
	rdhpr	%ver,	%o3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x10] %asi,	%i3
	call	loop_792
	fandnot2	%f12,	%f30,	%f30
	movg	%xcc,	%g7,	%i0
	fnot1	%f28,	%f8
loop_792:
	fcmpgt32	%f14,	%f0,	%g1
	tne	%icc,	0x2
	call	loop_793
	movre	%o6,	0x3EE,	%l3
	movu	%fcc3,	%i1,	%l5
	call	loop_794
loop_793:
	bneg,a,pn	%icc,	loop_795
	fsrc1	%f28,	%f26
	call	loop_796
loop_794:
	bg,a,pn	%xcc,	loop_797
loop_795:
	call	loop_798
	call	loop_799
loop_796:
	subcc	%g3,	0x0598,	%i6
loop_797:
	fmul8x16al	%f23,	%f7,	%f20
loop_798:
	siam	0x0
loop_799:
	call	loop_800
	fmovdlg	%fcc0,	%f12,	%f22
	call	loop_801
	edge16	%o0,	%l4,	%i5
loop_800:
	fmovdpos	%xcc,	%f12,	%f14
	fcmpes	%fcc1,	%f24,	%f18
loop_801:
	call	loop_802
	call	loop_803
	fmovrsgez	%i7,	%f9,	%f16
	tvs	%xcc,	0x1
loop_802:
	rdhpr	%hpstate,	%o2
loop_803:
	fornot2s	%f14,	%f24,	%f10
	fornot1s	%f14,	%f4,	%f19
	movl	%fcc2,	0x207,	%g2
	call	loop_804
	fnegd	%f26,	%f2
	set	0x1A, %o0
	ldsha	[%l7 + %o0] 0x88,	%g4
loop_804:
	fcmpes	%fcc3,	%f28,	%f13
	call	loop_805
	call	loop_806
	call	loop_807
	call	loop_808
loop_805:
	call	loop_809
loop_806:
	movgu	%icc,	0x368,	%l0
loop_807:
	call	loop_810
loop_808:
	call	loop_811
loop_809:
	movue	%fcc3,	0x700,	%i4
	bshuffle	%f12,	%f12,	%f16
loop_810:
	addc	%o1,	0x0A52,	%l1
loop_811:
	nop
	setx	0x13DB,	%l0,	%g5
	sdivx	%i2,	%g5,	%o7
	fbul,a	%fcc1,	loop_812
	call	loop_813
	bg	%icc,	loop_814
	fmovrslez	%g6,	%f7,	%f15
loop_812:
	call	loop_815
loop_813:
	fmovsu	%fcc3,	%f28,	%f18
loop_814:
	add	%l6,	0x00F6,	%o5
	call	loop_816
loop_815:
	brlz,a,pn	%l2,	loop_817
	movpos	%icc,	%o4,	%i3
	sir	0x10ED
loop_816:
	tcc	%xcc,	0x4
loop_817:
	sub	%g7,	%i0,	%g1
	call	loop_818
	fmovspos	%xcc,	%f7,	%f28
	ldd	[%l7 + 0x68],	%f8
	call	loop_819
loop_818:
	wrpr	%o3,	%l3,	%cwp
	fabsd	%f10,	%f30
	ba,pn	%icc,	loop_820
loop_819:
	movrne	%i1,	0x11A,	%o6
	movcc	%icc,	0x531,	%l5
	movge	%xcc,	0x6C9,	%g3
loop_820:
	tvs	%icc,	0x7
	call	loop_821
	fmovdcc	%xcc,	%f30,	%f30
	andn	%o0,	%l4,	%i6
	wr	%g0,	0x04,	%asi
	sta	%f13,	[%l7 + 0x6C] %asi
loop_821:
	call	loop_822
	fxors	%f6,	%f5,	%f24
	fcmpgt16	%f18,	%f26,	%i7
	fmovrslz	%o2,	%f9,	%f22
loop_822:
	call	loop_823
	edge8ln	%i5,	%g4,	%g2
	call	loop_824
	fmovrdne	%i4,	%f4,	%f6
loop_823:
	srl	%l0,	0x04,	%l1
	call	loop_825
loop_824:
	call	loop_826
	call	loop_827
	fbl,a	%fcc1,	loop_828
loop_825:
	call	loop_829
loop_826:
	bgu,a,pn	%icc,	loop_830
loop_827:
	edge32l	%o1,	%i2,	%g5
loop_828:
	pdist	%f10,	%f14,	%f2
loop_829:
	fmovsgu	%icc,	%f17,	%f16
loop_830:
	fmovrslz	%g6,	%f16,	%f0
	fpadd32s	%f29,	%f6,	%f0
	wrpr	%o7,	%l6,	%pil
	tvs	%xcc,	0x1
	tgu	%xcc,	0x1
	fandnot1	%f26,	%f28,	%f4
	alignaddr	%o5,	%l2,	%o4
	edge16ln	%g7,	%i0,	%g1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmpeq16	%f4,	%f8,	%o3
	tge	%xcc,	0x5
	nop
	set	0x20, %g6
	std	%f18,	[%l7 + %g6]
	set	0x26, %l0
	stha	%l3,	[%l7 + %l0] 0x89
	call	loop_831
	fmovdo	%fcc2,	%f18,	%f16
	movo	%fcc1,	0x276,	%i1
	fmul8x16al	%f17,	%f23,	%f22
loop_831:
	sll	%i3,	0x04,	%l5
	call	loop_832
	fands	%f15,	%f3,	%f5
	fmovrse	%g3,	%f14,	%f21
	wr	%o6,	0x0097,	%clear_softint
loop_832:
	fnot2s	%f26,	%f8
	nop
	setx	0x1FF5,	%l0,	%i6
	udivcc	%l4,	%i6,	%i7
	ldsb	[%l7 + 0x5A],	%o2
	nop
	setx	0xD93905972261F23F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xABB43B42DF527089,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f24,	%f16
	fmovdne	%icc,	%f10,	%f4
	call	loop_833
	call	loop_834
	bvs,pt	%icc,	loop_835
	nop
	set	0x48, %i4
	stx	%i5,	[%l7 + %i4]
loop_833:
	mulx	%o0,	%g2,	%g4
loop_834:
	fmovsn	%xcc,	%f26,	%f8
loop_835:
	fmovrdgz	%l0,	%f10,	%f16
	call	loop_836
	call	loop_837
	fmul8x16au	%f19,	%f0,	%f0
	ld	[%l7 + 0x74],	%f22
loop_836:
	call	loop_838
loop_837:
	movleu	%xcc,	%i4,	%l1
	call	loop_839
	rdpr	%cwp,	%i2
loop_838:
	call	loop_840
	fmovsuge	%fcc3,	%f17,	%f24
loop_839:
	wrpr 	%g0, 	0x3, 	%gl
	nop
	setx	0x206B2C2A33D6257E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_840:
	bmask	%g6,	%g5,	%o7
	tsubcctv	%l6,	%o5,	%l2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x08] %asi,	%g7
	fmovdcc	%icc,	%f4,	%f4
	xorcc	%o4,	0x1F95,	%g1
	fmovdneg	%xcc,	%f20,	%f12
	call	loop_841
	wrpr	%o3,	%l3,	%pil
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f6
loop_841:
	fcmpeq32	%f28,	%f12,	%i0
	call	loop_842
	mulx	%i1,	0x0734,	%l5
	andcc	%i3,	0x027A,	%g3
	fbge,a,pt	%fcc1,	loop_843
loop_842:
	call	loop_844
	fmul8x16au	%f28,	%f9,	%f30
	sir	0x0664
loop_843:
	call	loop_845
loop_844:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f4
	rdpr	%wstate,	%o6
	fnot2s	%f17,	%f18
loop_845:
	call	loop_846
	movgu	%xcc,	0x0D9,	%i6
	fabsd	%f8,	%f2
	call	loop_847
loop_846:
	fnegd	%f26,	%f22
	taddcctv	%l4,	0x1F6B,	%i7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_847:
	rdpr	%otherwin,	%o2
	movu	%fcc3,	0x3B8,	%i5
	tleu	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x14] %asi,	%f28
	fpadd32	%f20,	%f30,	%f18
	call	loop_848
	call	loop_849
	umulcc	%g2,	0x103C,	%o0
	call	loop_850
loop_848:
	movg	%xcc,	%l0,	%g4
loop_849:
	ble,a	%icc,	loop_851
	movue	%fcc0,	0x30B,	%l1
loop_850:
	sll	%i2,	%i4,	%o1
	call	loop_852
loop_851:
	fnand	%f2,	%f2,	%f6
	fmovdneg	%xcc,	%f12,	%f16
	nop
	setx	loop_853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022400001404,	%l0,	%l1
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
loop_852:
	movge	%fcc2,	%g6,	%g5
	call	loop_854
	fcmpd	%fcc1,	%f22,	%f20
loop_853:
	mulscc	%o7,	%l6,	%l2
	fmovsn	%icc,	%f17,	%f16
loop_854:
	call	loop_855
	call	loop_856
	orncc	%o5,	0x1A8A,	%o4
	array8	%g1,	%o3,	%g7
loop_855:
	orn	%l3,	0x1809,	%i0
loop_856:
	subcc	%i1,	0x03C8,	%i3
	nop
	fitos	%f3,	%f10
	fstod	%f10,	%f28
	subcc	%l5,	%g3,	%i6
	fmovsvc	%icc,	%f31,	%f17
	fmovdgu	%icc,	%f22,	%f4
	fmovsul	%fcc2,	%f0,	%f18
	call	loop_857
	nop
	setx	loop_858,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024200001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_859
	fmovdleu	%icc,	%f10,	%f12
loop_857:
	fmul8x16al	%f16,	%f22,	%f2
loop_858:
	call	loop_860
loop_859:
	call	loop_861
	call	loop_862
	nop
	fitos	%f11,	%f9
	fstox	%f9,	%f12
loop_860:
	fmovdl	%xcc,	%f26,	%f22
loop_861:
	tne	%icc,	0x4
loop_862:
	fmovsg	%xcc,	%f25,	%f28
	call	loop_863
	addcc	%l4,	0x0EA6,	%i7
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fones	%f15
loop_863:
	call	loop_864
	call	loop_865
	call	loop_866
	addcc	%o2,	%o6,	%i5
loop_864:
	call	loop_867
loop_865:
	movule	%fcc3,	%o0,	%l0
loop_866:
	be,a	%icc,	loop_868
	bleu,a,pn	%icc,	loop_869
loop_867:
	tge	%icc,	0x7
	fone	%f12
loop_868:
	call	loop_870
loop_869:
	rd	%sys_tick_cmpr,	%g4
	rd	%ccr,	%l1
	xnorcc	%g2,	%i2,	%i4
loop_870:
	nop
	setx	0x2D4A293DD4D273AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x2B62E5D3E11069D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f20,	%f4
	bcc	%xcc,	loop_871
	fpadd32	%f0,	%f14,	%f18
	fpmerge	%f8,	%f1,	%f16
	brgez,pn	%o1,	loop_872
loop_871:
	udiv	%g5,	0x12FC,	%o7
	bvs	%xcc,	loop_873
	wrpr 	%g0, 	0x1, 	%gl
loop_872:
	tgu	%icc,	0x0
	fmovdule	%fcc0,	%f0,	%f12
loop_873:
	xnor	%g6,	0x1C09,	%o4
	call	loop_874
	rd	%softint,	%g1
	fxnor	%f20,	%f14,	%f0
	call	loop_875
loop_874:
	wrpr 	%g0, 	0x0, 	%gl
	andcc	%l3,	%i0,	%o3
	movgu	%xcc,	0x6E2,	%i3
loop_875:
	subcc	%l5,	%i1,	%g3
	fnegd	%f20,	%f24
	fpsub16	%f6,	%f24,	%f2
	call	loop_876
	te	%icc,	0x6
	fmuld8sux16	%f0,	%f20,	%f12
	sra	%l4,	0x0C,	%i7
loop_876:
	call	loop_877
	fbg,a,pn	%fcc2,	loop_878
	fmovrsne	%i6,	%f20,	%f20
	call	loop_879
loop_877:
	call	loop_880
loop_878:
	rd	%fprs,	%o2
	call	loop_881
loop_879:
	fcmpeq32	%f26,	%f2,	%i5
loop_880:
	edge8l	%o6,	%l0,	%g4
	fmovs	%f24,	%f29
loop_881:
	wrpr	%l1,	0x1AB6,	%cwp
	wr	%o0,	0x0485,	%set_softint
	fmovdug	%fcc3,	%f0,	%f30
	nop
	setx	loop_882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014400001406,	%l0,	%l1
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
	fmovdvc	%xcc,	%f18,	%f4
	movle	%fcc2,	%i2,	%i4
	movgu	%xcc,	0x09C,	%g2
loop_882:
	fnot1	%f4,	%f22
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 2
	fcmpgt32	%f8,	%f24,	%g5
	call	loop_883
	xorcc	%o7,	%l2,	%l6
	fmovdcc	%xcc,	%f8,	%f28
	andn	%o4,	0x1DA5,	%g1
loop_883:
	fandnot2s	%f18,	%f20,	%f14
	fmovsg	%fcc1,	%f15,	%f18
	call	loop_884
	fmovscc	%icc,	%f24,	%f11
	nop
	setx	0x10D3,	%l0,	%o5
	udiv	%g6,	%o5,	%g7
	call	loop_885
loop_884:
	wr	%l3,	%o3,	%y
	fmovrdgez	%i0,	%f2,	%f24
	orn	%i3,	%l5,	%i1
loop_885:
	call	loop_886
	call	loop_887
	edge8ln	%g3,	%i7,	%l4
	call	loop_888
loop_886:
	call	loop_889
loop_887:
	edge8n	%o2,	%i6,	%i5
	tcc	%icc,	0x5
loop_888:
	fmovdvs	%xcc,	%f24,	%f4
loop_889:
	call	loop_890
	fcmpeq32	%f30,	%f0,	%l0
	call	loop_891
	orcc	%o6,	%l1,	%o0
loop_890:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0C] %asi,	%i2
loop_891:
	fpadd32s	%f10,	%f17,	%f17
	fnot1	%f28,	%f16
	call	loop_892
	call	loop_893
	edge16	%g4,	%i4,	%g2
	fnegs	%f7,	%f25
loop_892:
	fmovrde	%g5,	%f4,	%f8
loop_893:
	call	loop_894
	fmovslg	%fcc1,	%f13,	%f13
	rdpr	%tl,	%o1
	membar	0x7D
loop_894:
	fornot2s	%f30,	%f11,	%f26
	fnot1	%f12,	%f12
	alignaddrl	%l2,	%o7,	%l6
	sll	%o4,	0x0C,	%g1
	movcc	%icc,	0x58F,	%g6
	fmovdug	%fcc1,	%f28,	%f22
	ldsb	[%l7 + 0x41],	%g7
	nop
	fitod	%f22,	%f26
	movl	%fcc3,	0x321,	%o5
	movue	%fcc1,	0x52E,	%o3
	fmovsvs	%xcc,	%f10,	%f2
	call	loop_895
	andncc	%i0,	%i3,	%l3
	call	loop_896
	nop
	setx	0x19AF,	%l0,	%g3
	udivx	%i1,	%g3,	%i7
loop_895:
	call	loop_897
	movvs	%icc,	0x06E,	%l5
loop_896:
	call	loop_898
	call	loop_899
loop_897:
	movvc	%xcc,	0x5DA,	%o2
	fnegd	%f24,	%f22
loop_898:
	fmovdvs	%icc,	%f8,	%f8
loop_899:
	nop
	set	0x4C, %i0
	stha	%i6,	[%l7 + %i0] 0x10
	taddcc	%i5,	%l4,	%l0
	nop
	set	0x34, %o7
	swap	[%l7 + %o7],	%o6
	rdpr	%tl,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpes	%fcc3,	%f27,	%f12
	nop
	setx	0x0FB8,	%l0,	%i4
	udivcc	%g4,	%i4,	%g2
	fcmple32	%f28,	%f30,	%g5
	fmovdlg	%fcc2,	%f6,	%f20
	nop
	set	0x20, %g3
	sth	%o1,	[%l7 + %g3]
	fpmerge	%f1,	%f12,	%f4
	call	loop_900
	call	loop_901
	array8	%l2,	%i2,	%o7
	call	loop_902
loop_900:
	movcc	%icc,	%l6,	%o4
loop_901:
	call	loop_903
	nop
	set	0x50, %g5
	std	%f8,	[%l7 + %g5]
loop_902:
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f8
	call	loop_904
loop_903:
	call	loop_905
	movuge	%fcc0,	%g6,	%g7
	fmovrslz	%g1,	%f17,	%f26
loop_904:
	taddcc	%o5,	0x1812,	%o3
loop_905:
	bl	%xcc,	loop_906
	call	loop_907
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f10
	fmovdu	%fcc1,	%f18,	%f24
loop_906:
	fmovscc	%icc,	%f20,	%f29
loop_907:
	call	loop_908
	fmovso	%fcc1,	%f11,	%f21
	fpmerge	%f9,	%f14,	%f12
	mova	%fcc0,	%i0,	%i3
loop_908:
	alignaddrl	%l3,	%g3,	%i1
	srl	%i7,	0x05,	%l5
	fpsub32	%f24,	%f30,	%f10
	fsrc1	%f24,	%f6
	fpsub32s	%f18,	%f15,	%f1
	fcmple16	%f12,	%f6,	%i6
	fblg,pt	%fcc2,	loop_909
	edge32n	%o2,	%i5,	%l0
	call	loop_910
	fnegs	%f29,	%f26
loop_909:
	fzeros	%f18
	call	loop_911
loop_910:
	rd	%pc,	%l4
	rdpr	%cleanwin,	%o0
	call	loop_912
loop_911:
	movu	%fcc0,	0x141,	%l1
	tl	%icc,	0x0
	nop
	fitos	%f12,	%f8
	fstod	%f8,	%f8
loop_912:
	fmovrsgez	%g4,	%f29,	%f1
	brgz,a,pt	%i4,	loop_913
	nop
	setx	0x4221EC8018601133,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xDA12AD2B92FDD454,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f24,	%f4
	wrpr 	%g0, 	0x1, 	%gl
	tge	%xcc,	0x2
loop_913:
	fmovdul	%fcc1,	%f10,	%f14
	call	loop_914
	call	loop_915
	ldd	[%l7 + 0x38],	%f14
	call	loop_916
loop_914:
	tneg	%xcc,	0x5
loop_915:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpes	%fcc2,	%f9,	%f4
loop_916:
	andn	%o1,	0x1DFE,	%l2
	tcc	%xcc,	0x4
	sir	0x13EC
	call	loop_917
	umulcc	%g5,	%o7,	%l6
	call	loop_918
	call	loop_919
loop_917:
	nop
	setx	0x07B1,	%l0,	%g6
	sdivx	%o4,	%g6,	%g7
	fmovda	%fcc0,	%f24,	%f12
loop_918:
	xnor	%g1,	%o5,	%i2
loop_919:
	call	loop_920
	fmovrsne	%o3,	%f30,	%f14
	tcs	%xcc,	0x6
	fbl,a	%fcc2,	loop_921
loop_920:
	taddcctv	%i0,	0x195C,	%l3
	fmovdleu	%icc,	%f30,	%f2
loop_921:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 27
!	Type a   	: 30
!	Type x   	: 12
!	Type cti   	: 155
!	Type f   	: 146
!	Type i   	: 130
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
	set	0x5,	%g1
	set	0xD,	%g2
	set	0x0,	%g3
	set	0xF,	%g4
	set	0xA,	%g5
	set	0x3,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x7,	%i1
	set	-0x6,	%i2
	set	-0xA,	%i3
	set	-0x5,	%i4
	set	-0xD,	%i5
	set	-0x2,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x75E5CAA0,	%l0
	set	0x31391F4B,	%l1
	set	0x21015F49,	%l2
	set	0x774D02C2,	%l3
	set	0x761DD364,	%l4
	set	0x27FACB0F,	%l5
	set	0x189B27A0,	%l6
	!# Output registers
	set	-0x0E80,	%o0
	set	0x0C56,	%o1
	set	-0x12BC,	%o2
	set	-0x0A2C,	%o3
	set	-0x1401,	%o4
	set	-0x165F,	%o5
	set	-0x19E1,	%o6
	set	-0x10E1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	fmovsl	%icc,	%f13,	%f9
	fmovsuge	%fcc1,	%f14,	%f28
	nop
	setx	loop_922,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014400001402,	%l0,	%l1
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
	call	loop_923
	fmovdgu	%xcc,	%f20,	%f20
	fmovsn	%xcc,	%f30,	%f16
loop_922:
	fblg,a,pt	%fcc3,	loop_924
loop_923:
	prefetch	[%l7 + 0x78],	 0
	call	loop_925
	ba	%xcc,	loop_926
loop_924:
	fnegd	%f16,	%f28
	call	loop_927
loop_925:
	call	loop_928
loop_926:
	fbge,a,pn	%fcc3,	loop_929
	fnot1	%f24,	%f10
loop_927:
	xorcc	%i3,	%i1,	%g3
loop_928:
	fsrc1	%f0,	%f24
loop_929:
	brz,a,pt	%l5,	loop_930
	fmovrdgz	%i7,	%f8,	%f6
	rdpr	%tba,	%i6
	call	loop_931
loop_930:
	popc	%i5,	%l0
	fandnot2	%f0,	%f16,	%f4
	call	loop_932
loop_931:
	smulcc	%o2,	%o0,	%l1
	fpack32	%f22,	%f0,	%f24
	array32	%g4,	%l4,	%i4
loop_932:
	fmovrslez	%g2,	%f17,	%f9
	fxor	%f28,	%f6,	%f4
	xnor	%o1,	%l2,	%g5
	std	%o6,	[%l7 + 0x10]
	edge16	%o7,	%l6,	%g6
	ldd	[%l7 + 0x28],	%f2
	fmovsneg	%xcc,	%f11,	%f28
	call	loop_933
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitos	%f10,	%f7
	fstox	%f7,	%f2
	fxtos	%f2,	%f6
	fnot2s	%f25,	%f18
loop_933:
	call	loop_934
	fmovdug	%fcc1,	%f2,	%f6
	fpadd32s	%f14,	%f4,	%f14
	mova	%icc,	%o4,	%g7
loop_934:
	fmovdlg	%fcc2,	%f22,	%f28
	call	loop_935
	bl,pn	%xcc,	loop_936
	fmovdule	%fcc3,	%f6,	%f14
	wr	%g0,	0xeb,	%asi
	stba	%g1,	[%l7 + 0x53] %asi
	membar	#Sync
loop_935:
	sethi	0x12E7,	%o5
loop_936:
	fpack32	%f6,	%f28,	%f10
	siam	0x0
	andn	%i2,	%i0,	%o3
	fsrc1	%f0,	%f24
	nop
	fitos	%f29,	%f13
	rd	%pc,	%i3
	tn	%xcc,	0x2
	nop
	setx	0x10C4,	%l0,	%g3
	udivx	%i1,	%g3,	%l3
	fmovsa	%fcc2,	%f17,	%f0
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x0c,	%i7
	set	0x74, %l4
	ldsha	[%l7 + %l4] 0x0c,	%l5
	bcs,a,pn	%xcc,	loop_937
	rdpr	%tba,	%i6
	fcmple16	%f4,	%f28,	%l0
	call	loop_938
loop_937:
	sub	%i5,	%o2,	%o0
	fmovrse	%l1,	%f25,	%f13
	fmovsl	%xcc,	%f27,	%f20
loop_938:
	call	loop_939
	fcmpd	%fcc3,	%f6,	%f6
	nop
	setx	0x0F7F,	%l0,	%l4
	sdiv	%g4,	%l4,	%g2
	call	loop_940
loop_939:
	mulx	%o1,	0x0F18,	%i4
	array8	%l2,	%g5,	%o7
	fmovsu	%fcc1,	%f13,	%f28
loop_940:
	fmul8sux16	%f8,	%f12,	%f28
	nop
	setx	0xE6B5140CF9C4F021,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f10
	rdhpr	%hsys_tick_cmpr,	%l6
	fmuld8sux16	%f10,	%f1,	%f20
	rdhpr	%ver,	%o6
	addc	%g6,	0x149F,	%o4
	call	loop_941
	call	loop_942
	fmovdleu	%icc,	%f2,	%f16
	call	loop_943
loop_941:
	movl	%fcc3,	0x3C8,	%g1
loop_942:
	fba,pn	%fcc1,	loop_944
	or	%o5,	%i2,	%g7
loop_943:
	fornot2s	%f19,	%f12,	%f2
	call	loop_945
loop_944:
	ta	%xcc,	0x4
	call	loop_946
	movrne	%o3,	0x129,	%i0
loop_945:
	call	loop_947
	addcc	%i3,	%i1,	%l3
loop_946:
	movul	%fcc3,	%i7,	%l5
	fcmpgt32	%f8,	%f10,	%g3
loop_947:
	fmovscc	%xcc,	%f19,	%f8
	call	loop_948
	call	loop_949
	fors	%f24,	%f10,	%f20
	tvc	%xcc,	0x4
loop_948:
	array16	%l0,	%i6,	%i5
loop_949:
	movu	%fcc0,	%o2,	%o0
	call	loop_950
	call	loop_951
	alignaddrl	%g4,	%l4,	%l1
	call	loop_952
loop_950:
	be,a	%xcc,	loop_953
loop_951:
	fmovsneg	%xcc,	%f0,	%f27
	fmovrdgez	%g2,	%f16,	%f0
loop_952:
	fmovscs	%icc,	%f21,	%f18
loop_953:
	faligndata	%f6,	%f20,	%f8
	fandnot2	%f30,	%f6,	%f2
	nop
	setx	0x12B5,	%l0,	%o1
	udivx	%i4,	%o1,	%l2
	tge	%icc,	0x6
	bvs,pn	%xcc,	loop_954
	nop
	setx	0x2AC2DAFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	taddcctv	%o7,	%g5,	%l6
	nop
	setx	0x4DB53E9B8760FC5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_954:
	rd	%softint,	%g6
	movu	%fcc0,	%o4,	%g1
	flush	%l7 + 0x64
	tleu	%icc,	0x6
	edge16l	%o6,	%o5,	%g7
	srl	%i2,	%i0,	%o3
	movue	%fcc3,	0x3ED,	%i1
	array16	%i3,	%l3,	%i7
	fmovs	%f19,	%f13
	mulx	%l5,	0x03B3,	%l0
	fpsub32s	%f24,	%f1,	%f12
	mova	%icc,	%g3,	%i6
	call	loop_955
	fornot1	%f20,	%f16,	%f26
	bgu,pn	%icc,	loop_956
	call	loop_957
loop_955:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	move	%xcc,	0x413,	%i5
loop_956:
	call	loop_958
loop_957:
	call	loop_959
	fxor	%f22,	%f2,	%f22
	fmovdul	%fcc0,	%f20,	%f4
loop_958:
	call	loop_960
loop_959:
	call	loop_961
	tl	%xcc,	0x6
	andcc	%o2,	%o0,	%g4
loop_960:
	fmovdl	%icc,	%f6,	%f30
loop_961:
	fsrc2s	%f17,	%f21
	call	loop_962
	fcmpgt16	%f26,	%f28,	%l4
	set	0x0C, %g7
	lduba	[%l7 + %g7] 0x88,	%l1
loop_962:
	call	loop_963
	call	loop_964
	nop
	setx	0x1FB3,	%l0,	%g2
	sdivcc	%i4,	%g2,	%l2
	fornot2	%f20,	%f26,	%f8
loop_963:
	bmask	%o1,	%g5,	%l6
loop_964:
	nop
	setx	0x688A6CCD22603BA5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x4F41896C8B8CCF27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f30,	%f26
	tn	%icc,	0x4
	call	loop_965
	call	loop_966
	fcmpne16	%f0,	%f10,	%g6
	call	loop_967
loop_965:
	movgu	%xcc,	0x05F,	%o7
loop_966:
	andncc	%o4,	%g1,	%o5
	tsubcc	%g7,	%i2,	%i0
loop_967:
	call	loop_968
	call	loop_969
	fsrc1	%f14,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE73, 	%sys_tick_cmpr
loop_968:
	fands	%f23,	%f22,	%f21
loop_969:
	or	%o6,	0x1DDE,	%i3
	call	loop_970
	movo	%fcc1,	%i1,	%l3
	call	loop_971
	te	%icc,	0x6
loop_970:
	fandnot2	%f8,	%f8,	%f22
	st	%f19,	[%l7 + 0x50]
loop_971:
	movne	%fcc0,	0x220,	%i7
	sethi	0x067D,	%l5
	call	loop_972
	srax	%l0,	%g3,	%i5
	fbul,pn	%fcc0,	loop_973
	call	loop_974
loop_972:
	rdhpr	%ver,	%o2
	ldd	[%l7 + 0x18],	%i6
loop_973:
	call	loop_975
loop_974:
	fcmped	%fcc0,	%f14,	%f12
	sllx	%g4,	0x0C,	%o0
	tsubcc	%l4,	%i4,	%l1
loop_975:
	fmovsneg	%icc,	%f30,	%f9
	mulscc	%l2,	%o1,	%g2
	fnor	%f22,	%f30,	%f12
	fnands	%f27,	%f8,	%f30
	fmovrdgez	%l6,	%f26,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x64F, 	%tick_cmpr
	call	loop_976
	fpack16	%f30,	%f1
	te	%icc,	0x3
	movvs	%xcc,	0x237,	%g5
loop_976:
	subc	%o7,	0x0927,	%g1
	xorcc	%o4,	%o5,	%i2
	movgu	%icc,	0x144,	%i0
	ta	%icc,	0x4
	fmul8x16au	%f31,	%f8,	%f24
	nop
	set	0x24, %g1
	lduh	[%l7 + %g1],	%o3
	rdpr	%cansave,	%g7
	sethi	0x0F02,	%o6
	fmul8x16al	%f9,	%f14,	%f16
	wrpr 	%g0, 	0x0, 	%gl
	udivx	%i7,	0x1DF1,	%l5
	fzero	%f28
	call	loop_977
	tg	%icc,	0x6
	srl	%l3,	%g3,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_977:
	fexpand	%f18,	%f18
	call	loop_978
	xnor	%g4,	%o0,	%i6
	movvc	%xcc,	%i4,	%l4
	fmul8sux16	%f0,	%f28,	%f26
loop_978:
	fcmpgt32	%f6,	%f16,	%l1
	fpack32	%f4,	%f30,	%f26
	call	loop_979
	bmask	%l2,	%o1,	%g2
	fornot1s	%f28,	%f29,	%f19
	fbo,a,pn	%fcc2,	loop_980
loop_979:
	fmuld8sux16	%f20,	%f27,	%f26
	array32	%g6,	%l6,	%o7
	nop
	set	0x28, %o5
	std	%g4,	[%l7 + %o5]
loop_980:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o4,	[%l7 + 0x38] %asi
	fpsub32	%f24,	%f14,	%f26
	fcmped	%fcc2,	%f28,	%f10
	call	loop_981
	call	loop_982
	fmovsl	%fcc0,	%f17,	%f25
	fnands	%f25,	%f10,	%f2
loop_981:
	fmovdgu	%icc,	%f8,	%f4
loop_982:
	call	loop_983
	fandnot1s	%f7,	%f20,	%f23
	fmovsn	%icc,	%f23,	%f12
	tsubcctv	%o5,	%i2,	%g1
loop_983:
	tge	%xcc,	0x0
	call	loop_984
	fmovdvc	%icc,	%f20,	%f0
	taddcctv	%o3,	0x1250,	%i0
	wr	%g7,	0x0F3C,	%softint
loop_984:
	call	loop_985
	call	loop_986
	bleu,pt	%xcc,	loop_987
	tvs	%xcc,	0x6
loop_985:
	ble,a	%xcc,	loop_988
loop_986:
	fbl,a	%fcc3,	loop_989
loop_987:
	call	loop_990
	sra	%i1,	0x1B,	%i3
loop_988:
	movre	%i7,	%l5,	%o6
loop_989:
	edge8	%g3,	%l0,	%l3
loop_990:
	wrpr	%o2,	%i5,	%tick
	set	0x2B, %l6
	ldsba	[%l7 + %l6] 0x81,	%g4
	smulcc	%i6,	%i4,	%o0
	call	loop_991
	nop
	setx	0x94A9E64A6EAA8687,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f6
	call	loop_992
	call	loop_993
loop_991:
	orncc	%l4,	%l1,	%l2
	call	loop_994
loop_992:
	sll	%o1,	%g6,	%l6
loop_993:
	nop
	fitos	%f9,	%f12
	fstox	%f12,	%f14
	call	loop_995
loop_994:
	fnor	%f4,	%f10,	%f6
	call	loop_996
	array32	%g2,	%o7,	%g5
loop_995:
	bn,a	%icc,	loop_997
	fnands	%f21,	%f29,	%f0
loop_996:
	edge16n	%o5,	%i2,	%g1
	nop
	setx	0xABB55E6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xACF4BE71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f15,	%f26
loop_997:
	call	loop_998
	tl	%icc,	0x5
	call	loop_999
	rdpr	%wstate,	%o3
loop_998:
	ble,a	%xcc,	loop_1000
	movrgz	%o4,	0x00B,	%i0
loop_999:
	fandnot2s	%f12,	%f23,	%f26
	edge32l	%g7,	%i3,	%i1
loop_1000:
	call	loop_1001
	orcc	%l5,	0x11FC,	%i7
	call	loop_1002
	fbge,pt	%fcc1,	loop_1003
loop_1001:
	call	loop_1004
	fmovdg	%fcc2,	%f30,	%f26
loop_1002:
	stb	%g3,	[%l7 + 0x6E]
loop_1003:
	rdhpr	%hsys_tick_cmpr,	%o6
loop_1004:
	call	loop_1005
	call	loop_1006
	movu	%fcc3,	%l3,	%o2
	fmovsuge	%fcc1,	%f3,	%f25
loop_1005:
	fcmpes	%fcc2,	%f26,	%f24
loop_1006:
	movre	%l0,	%i5,	%i6
	fsrc2	%f14,	%f2
	udiv	%g4,	0x1CB4,	%o0
	call	loop_1007
	sdivcc	%i4,	0x101E,	%l1
	fmovdne	%xcc,	%f10,	%f2
	fand	%f8,	%f18,	%f24
loop_1007:
	call	loop_1008
	call	loop_1009
	mulx	%l4,	%o1,	%g6
	movrgz	%l6,	%l2,	%g2
loop_1008:
	fcmpeq16	%f24,	%f10,	%g5
loop_1009:
	nop
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x10,	%o7
	smul	%i2,	0x1A49,	%o5
	nop
	setx	0x70D08664,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xFDD25B03,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f1,	%f21
	call	loop_1010
	call	loop_1011
	alignaddr	%o3,	%o4,	%i0
	fmul8ulx16	%f14,	%f30,	%f28
loop_1010:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g7
loop_1011:
	fnot2	%f12,	%f18
	call	loop_1012
	addcc	%g1,	%i1,	%l5
	fcmpgt32	%f28,	%f6,	%i3
	call	loop_1013
loop_1012:
	nop
	setx	0x601314A789F3A50F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f26
	tvs	%xcc,	0x2
	rdhpr	%ver,	%g3
loop_1013:
	call	loop_1014
	sll	%o6,	%i7,	%o2
	rdpr	%gl,	%l3
	swap	[%l7 + 0x3C],	%l0
loop_1014:
	call	loop_1015
	fmovdule	%fcc1,	%f10,	%f12
	call	loop_1016
	movne	%fcc1,	%i6,	%i5
loop_1015:
	smul	%g4,	%o0,	%i4
	fmovscc	%icc,	%f17,	%f23
loop_1016:
	sllx	%l1,	%o1,	%g6
	movre	%l6,	%l2,	%l4
	call	loop_1017
	rd	%y,	%g5
	rdpr	%otherwin,	%o7
	edge32	%g2,	%o5,	%o3
loop_1017:
	fbne,a,pn	%fcc1,	loop_1018
	rdhpr	%htba,	%i2
	fnot1	%f14,	%f12
	wr	%i0,	0x0E75,	%set_softint
loop_1018:
	call	loop_1019
	nop
	fitos	%f3,	%f0
	fblg,pt	%fcc0,	loop_1020
	fmovsleu	%xcc,	%f21,	%f14
loop_1019:
	rd	%pc,	%g7
	sllx	%g1,	%o4,	%i1
loop_1020:
	call	loop_1021
	rd	%ccr,	%i3
	popc	0x0A9F,	%g3
	nop
	setx	0x62527451,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f21
loop_1021:
	call	loop_1022
	nop
	setx	loop_1023,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022400001407,	%l0,	%l1
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
	setx	0x45879CB495E6CEF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	move	%xcc,	0x64D,	%o6
loop_1022:
	udivx	%i7,	0x008F,	%l5
loop_1023:
	rdhpr	%htba,	%l3
	movcs	%xcc,	0x726,	%o2
	array16	%i6,	%l0,	%g4
	fsrc1	%f4,	%f22
	addccc	%o0,	0x1D06,	%i4
	movug	%fcc2,	0x5BB,	%i5
	edge16ln	%o1,	%g6,	%l6
	xorcc	%l1,	0x0DC3,	%l4
	call	loop_1024
	brlz,a	%l2,	loop_1025
	rdhpr	%htba,	%o7
	or	%g2,	%o5,	%g5
loop_1024:
	fmovrdgz	%o3,	%f0,	%f8
loop_1025:
	nop
	setx	0xF79E5F3034CBE78C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4B68DC06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f16,	%f14
	set	0x10, %i2
	stda	%i0,	[%l7 + %i2] 0x81
	nop
	fitos	%f4,	%f5
	fstox	%f5,	%f12
	edge32l	%g7,	%g1,	%o4
	andncc	%i1,	%i2,	%i3
	rdpr	%tba,	%g3
	ble,a	%icc,	loop_1026
	addc	%i7,	0x0136,	%o6
	tleu	%icc,	0x7
	fand	%f22,	%f18,	%f2
loop_1026:
	fmovsneg	%icc,	%f30,	%f22
	fmovdgu	%xcc,	%f26,	%f22
	fnor	%f14,	%f12,	%f20
	tleu	%icc,	0x0
	set	0x74, %o3
	lda	[%l7 + %o3] 0x10,	%f3
	andn	%l5,	%l3,	%i6
	call	loop_1027
	call	loop_1028
	fmovdneg	%xcc,	%f8,	%f0
	call	loop_1029
loop_1027:
	fmovdvs	%icc,	%f24,	%f24
loop_1028:
	call	loop_1030
	movu	%fcc2,	0x1E4,	%o2
loop_1029:
	call	loop_1031
	xor	%l0,	0x1497,	%g4
loop_1030:
	fands	%f26,	%f14,	%f22
	call	loop_1032
loop_1031:
	edge8n	%i4,	%i5,	%o1
	bneg,a,pt	%xcc,	loop_1033
	nop
	setx	0x0C08,	%l0,	%g6
	udiv	%o0,	%g6,	%l1
loop_1032:
	call	loop_1034
	edge8	%l6,	%l2,	%o7
loop_1033:
	orn	%l4,	0x088E,	%g2
	fmovscc	%icc,	%f6,	%f19
loop_1034:
	call	loop_1035
	tsubcc	%g5,	0x02C2,	%o3
	movu	%fcc1,	0x0E4,	%i0
	wr	%g0,	0x88,	%asi
	stba	%o5,	[%l7 + 0x6B] %asi
loop_1035:
	fmovdul	%fcc2,	%f12,	%f20
	movrne	%g7,	0x0EC,	%g1
	edge16ln	%i1,	%i2,	%i3
	fnot1s	%f26,	%f1
	call	loop_1036
	call	loop_1037
	call	loop_1038
	call	loop_1039
loop_1036:
	sub	%o4,	0x11DF,	%i7
loop_1037:
	call	loop_1040
loop_1038:
	fors	%f1,	%f25,	%f8
loop_1039:
	call	loop_1041
	mova	%xcc,	0x7A0,	%g3
loop_1040:
	fpadd16	%f30,	%f26,	%f22
	fcmps	%fcc2,	%f18,	%f19
loop_1041:
	sllx	%l5,	%o6,	%l3
	call	loop_1042
	call	loop_1043
	fmovda	%fcc2,	%f28,	%f28
	orcc	%i6,	0x0C22,	%o2
loop_1042:
	nop
	set	0x70, %i1
	ldsw	[%l7 + %i1],	%l0
loop_1043:
	fxor	%f26,	%f8,	%f28
	call	loop_1044
	bcc,pt	%xcc,	loop_1045
	nop
	fitos	%f7,	%f16
	fstod	%f16,	%f28
	fmovdleu	%icc,	%f6,	%f10
loop_1044:
	fmovdo	%fcc0,	%f10,	%f0
loop_1045:
	fors	%f29,	%f22,	%f11
	edge8l	%g4,	%i4,	%i5
	fnegs	%f13,	%f6
	call	loop_1046
	call	loop_1047
	fnot2	%f26,	%f0
	rdhpr	%ver,	%o0
loop_1046:
	call	loop_1048
loop_1047:
	nop
	setx	0x60B0D469,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xB03024C0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f2,	%f8
	wr 	%g0, 	0x6, 	%fprs
	wr	%l1,	0x106D,	%ccr
loop_1048:
	rdpr	%pil,	%g6
	bmask	%l2,	%o7,	%l6
	fmovsue	%fcc1,	%f10,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movvs	%xcc,	0x1FC,	%o3
	fmovdpos	%xcc,	%f18,	%f18
	call	loop_1049
	addc	%i0,	%o5,	%g5
	brgz,a	%g7,	loop_1050
	fmul8ulx16	%f26,	%f2,	%f8
loop_1049:
	brlez	%g1,	loop_1051
	bshuffle	%f26,	%f0,	%f2
loop_1050:
	bvs,a,pt	%icc,	loop_1052
	fmovdgu	%xcc,	%f6,	%f12
loop_1051:
	call	loop_1053
	xorcc	%i2,	%i3,	%o4
loop_1052:
	fornot2s	%f18,	%f9,	%f29
	call	loop_1054
loop_1053:
	popc	%i7,	%i1
	set	0x7C, %i3
	lduwa	[%l7 + %i3] 0x11,	%l5
loop_1054:
	fpmerge	%f8,	%f14,	%f14
	fsrc1s	%f13,	%f12
	movg	%fcc3,	0x5CD,	%o6
	fmovdg	%xcc,	%f30,	%f26
	movneg	%xcc,	%l3,	%g3
	tgu	%xcc,	0x0
	taddcctv	%i6,	0x1D6F,	%l0
	bvc	%xcc,	loop_1055
	call	loop_1056
	call	loop_1057
	rdhpr	%hsys_tick_cmpr,	%g4
loop_1055:
	fmovdpos	%xcc,	%f0,	%f16
loop_1056:
	call	loop_1058
loop_1057:
	call	loop_1059
	fnands	%f16,	%f14,	%f14
	fmovsule	%fcc0,	%f11,	%f16
loop_1058:
	call	loop_1060
loop_1059:
	nop
	set	0x4B, %i7
	ldsb	[%l7 + %i7],	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x196, 	%sys_tick_cmpr
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f9
loop_1060:
	flushw
	call	loop_1061
loop_1061:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 27
!	Type a   	: 34
!	Type x   	: 12
!	Type cti   	: 140
!	Type f   	: 142
!	Type i   	: 145
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
	set	0xE,	%g1
	set	0xC,	%g2
	set	0xF,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0x7,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x6,	%i1
	set	-0x6,	%i2
	set	-0x0,	%i3
	set	-0x8,	%i4
	set	-0x3,	%i5
	set	-0xB,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x7064B5FC,	%l0
	set	0x3C37058A,	%l1
	set	0x19B35008,	%l2
	set	0x1BAFED26,	%l3
	set	0x4CB7C837,	%l4
	set	0x25449DAD,	%l5
	set	0x29BB64A4,	%l6
	!# Output registers
	set	0x16A2,	%o0
	set	0x0CC1,	%o1
	set	-0x10BB,	%o2
	set	0x059E,	%o3
	set	-0x1B8E,	%o4
	set	-0x0827,	%o5
	set	0x0247,	%o6
	set	-0x076E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE99C5FF74AA03C)
	INIT_TH_FP_REG(%l7,%f2,0x4233B93BF8B64885)
	INIT_TH_FP_REG(%l7,%f4,0xF859BB27D68C57E7)
	INIT_TH_FP_REG(%l7,%f6,0xDFC053E150430F25)
	INIT_TH_FP_REG(%l7,%f8,0x1C7BF85619D18190)
	INIT_TH_FP_REG(%l7,%f10,0x789464429CF89485)
	INIT_TH_FP_REG(%l7,%f12,0x5D5762E7BF3EC55E)
	INIT_TH_FP_REG(%l7,%f14,0x0E48C3171409ED2D)
	INIT_TH_FP_REG(%l7,%f16,0x5854DA7D58576671)
	INIT_TH_FP_REG(%l7,%f18,0x1E1EC4B39D72B98A)
	INIT_TH_FP_REG(%l7,%f20,0xBA2EC29704A66FD1)
	INIT_TH_FP_REG(%l7,%f22,0x7DB11C5C2A6F0242)
	INIT_TH_FP_REG(%l7,%f24,0xD07ABFCDE10A6276)
	INIT_TH_FP_REG(%l7,%f26,0xB1058E28848D9338)
	INIT_TH_FP_REG(%l7,%f28,0xE7DA62FFF510F551)
	INIT_TH_FP_REG(%l7,%f30,0xBF85F7D63DE7DCCE)

	!# Execute Main Diag ..

	mova	%icc,	%o1,	%l1
	xnorcc	%i5,	%l2,	%g6
	tleu	%xcc,	0x7
	fbug	%fcc3,	loop_1062
	fpack32	%f16,	%f30,	%f16
	nop
	set	0x50, %o4
	lduw	[%l7 + %o4],	%o7
	fmul8x16	%f4,	%f10,	%f26
loop_1062:
	movule	%fcc0,	0x551,	%g2
	sdivcc	%l6,	0x1702,	%l4
	call	loop_1063
	fcmpgt32	%f28,	%f30,	%i0
	fbo,a	%fcc1,	loop_1064
	call	loop_1065
loop_1063:
	movul	%fcc3,	0x46F,	%o5
	alignaddrl	%g5,	%g7,	%g1
loop_1064:
	fmovdleu	%icc,	%f28,	%f14
loop_1065:
	fpadd32	%f8,	%f18,	%f26
	rdhpr	%hintp,	%i2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpackfix	%f26,	%f3
	fnor	%f6,	%f30,	%f6
	edge16n	%o3,	%o4,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB1, 	%hsys_tick_cmpr
	tvc	%icc,	0x0
	fandnot1s	%f26,	%f1,	%f3
	brlez	%l5,	loop_1066
	call	loop_1067
	fmovse	%fcc2,	%f5,	%f10
	fxnors	%f23,	%f9,	%f8
loop_1066:
	addc	%o6,	%l3,	%i6
loop_1067:
	smulcc	%g3,	%l0,	%g4
	fbl	%fcc2,	loop_1068
	movcs	%icc,	0x6CB,	%i4
	alignaddrl	%o2,	%o0,	%l1
	fnegd	%f22,	%f16
loop_1068:
	call	loop_1069
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1070
	call	loop_1071
loop_1069:
	alignaddrl	%o1,	%i5,	%l2
	edge16n	%g6,	%o7,	%g2
loop_1070:
	rd	%y,	%l4
loop_1071:
	fexpand	%f13,	%f6
	movrlz	%i0,	0x1FE,	%o5
	movrlez	%l6,	%g7,	%g5
	fsrc1s	%f27,	%f26
	fands	%f23,	%f26,	%f15
	nop
	setx	0x164C,	%l0,	%o3
	udivcc	%i2,	%o3,	%g1
	fmovdle	%icc,	%f4,	%f30
	nop
	setx	0x9DA726EE156812EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	swap	[%l7 + 0x1C],	%o4
	fmovdue	%fcc0,	%f20,	%f30
	fmovsgu	%icc,	%f1,	%f7
	fnot1	%f30,	%f8
	fbn,a	%fcc2,	loop_1072
	edge16ln	%i7,	%i1,	%i3
	bge	%xcc,	loop_1073
	subcc	%o6,	%l3,	%i6
loop_1072:
	xnorcc	%g3,	0x0587,	%l5
	call	loop_1074
loop_1073:
	call	loop_1075
	nop
	setx	0x603DF4D1C1A26C59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	mulx	%l0,	%i4,	%g4
loop_1074:
	call	loop_1076
loop_1075:
	call	loop_1077
	edge32l	%o0,	%l1,	%o1
	wrpr	%i5,	0x1DEA,	%pil
loop_1076:
	call	loop_1078
loop_1077:
	wrpr	%o2,	0x0281,	%pil
	edge16ln	%g6,	%l2,	%g2
	call	loop_1079
loop_1078:
	wrpr	%l4,	0x178F,	%pil
	fmovrse	%i0,	%f19,	%f29
	tgu	%xcc,	0x2
loop_1079:
	array32	%o7,	%o5,	%g7
	fmovdule	%fcc0,	%f8,	%f18
	call	loop_1080
	fmovsug	%fcc0,	%f2,	%f14
	smulcc	%g5,	0x0532,	%l6
	tvc	%xcc,	0x0
loop_1080:
	bn,pn	%icc,	loop_1081
	rdpr	%cwp,	%o3
	orn	%g1,	0x1612,	%o4
	pdist	%f28,	%f24,	%f0
loop_1081:
	pdist	%f4,	%f6,	%f0
	lduh	[%l7 + 0x48],	%i7
	fmul8x16au	%f16,	%f25,	%f22
	fmovdgu	%icc,	%f16,	%f26
	fmovdul	%fcc1,	%f24,	%f8
	subc	%i2,	%i1,	%i3
	edge8l	%l3,	%i6,	%o6
	orn	%l5,	0x1805,	%l0
	tcs	%icc,	0x1
	call	loop_1082
	call	loop_1083
	call	loop_1084
	call	loop_1085
loop_1082:
	fnot1	%f14,	%f6
loop_1083:
	rdhpr	%ver,	%i4
loop_1084:
	tcc	%icc,	0x6
loop_1085:
	fandnot1	%f24,	%f28,	%f8
	alignaddrl	%g4,	%o0,	%l1
	tvc	%icc,	0x2
	call	loop_1086
	std	%o0,	[%l7 + 0x58]
	fmovdg	%fcc0,	%f18,	%f14
	popc	0x0265,	%i5
loop_1086:
	fbn,pn	%fcc1,	loop_1087
	ld	[%l7 + 0x70],	%f28
	call	loop_1088
	fxor	%f10,	%f30,	%f16
loop_1087:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%o2
loop_1088:
	call	loop_1089
	nop
	fitos	%f11,	%f24
	fstoi	%f24,	%f27
	call	loop_1090
	call	loop_1091
loop_1089:
	edge16ln	%g6,	%g2,	%l4
	andncc	%i0,	%l2,	%o5
loop_1090:
	fornot1	%f16,	%f2,	%f16
loop_1091:
	call	loop_1092
	call	loop_1093
	array8	%o7,	%g5,	%g7
	rdpr	%cansave,	%l6
loop_1092:
	movrgez	%o3,	%g1,	%o4
loop_1093:
	call	loop_1094
	call	loop_1095
	call	loop_1096
	nop
	setx	0x0A2B,	%l0,	%i1
	sdivx	%i2,	%i1,	%i3
loop_1094:
	movuge	%fcc1,	0x429,	%i7
loop_1095:
	bcs,a,pn	%xcc,	loop_1097
loop_1096:
	movlg	%fcc3,	0x538,	%l3
	nop
	setx	0xC6341575,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x21CC4253,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f30,	%f17
	movue	%fcc1,	0x4D9,	%o6
loop_1097:
	fnot2s	%f31,	%f18
	movre	%l5,	%i6,	%i4
	brlez,a,pt	%g4,	loop_1098
	fmovdvc	%icc,	%f16,	%f14
	bcc,pt	%xcc,	loop_1099
	rd	%tick_cmpr,	%l0
loop_1098:
	fmul8x16al	%f20,	%f4,	%f12
	call	loop_1100
loop_1099:
	sllx	%o0,	0x02,	%l1
	andncc	%i5,	0x12BF,	%o1
	rd	%ccr,	%o2
loop_1100:
	nop
	fitod	%f9,	%f28
	fmovsle	%icc,	%f17,	%f24
	xor	%g6,	0x147B,	%g3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	xnor	%l4,	0x0647,	%i0
	subc	%g2,	0x0317,	%l2
	nop
	setx	0x14DE,	%l0,	%g5
	sdivx	%o7,	%g5,	%o5
	set	0x58, %l5
	stxa	%l6,	[%l7 + %l5] 0x89
	or	%o3,	%g7,	%g1
	call	loop_1101
	fmovsule	%fcc1,	%f12,	%f25
	fpsub32s	%f14,	%f24,	%f7
	nop
	setx	loop_1102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022400001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1101:
	fornot2s	%f10,	%f2,	%f15
	fmovrdlez	%o4,	%f14,	%f26
	smulcc	%i2,	%i3,	%i1
loop_1102:
	movug	%fcc3,	%l3,	%i7
	fandnot1	%f16,	%f26,	%f2
	fpadd32s	%f28,	%f9,	%f30
	call	loop_1103
	fbl	%fcc1,	loop_1104
	call	loop_1105
	tne	%icc,	0x7
loop_1103:
	call	loop_1106
loop_1104:
	tl	%icc,	0x6
loop_1105:
	movleu	%xcc,	%o6,	%l5
	rd	%tick_cmpr,	%i4
loop_1106:
	fxnors	%f12,	%f10,	%f25
	call	loop_1107
	nop
	set	0x64, %i5
	lduw	[%l7 + %i5],	%i6
	fcmple16	%f10,	%f22,	%g4
	bge	%xcc,	loop_1108
loop_1107:
	call	loop_1109
	nop
	setx	0x601D7832,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x711A7331,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f13,	%f3
	call	loop_1110
loop_1108:
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f24
	fxtos	%f24,	%f13
loop_1109:
	fmovrsne	%o0,	%f20,	%f0
	movue	%fcc2,	%l1,	%i5
loop_1110:
	call	loop_1111
	tpos	%xcc,	0x1
	call	loop_1112
	wrpr 	%g0, 	0x2, 	%gl
loop_1111:
	fcmpeq32	%f12,	%f16,	%o2
	call	loop_1113
loop_1112:
	fmovse	%fcc2,	%f19,	%f28
	call	loop_1114
	fsrc2s	%f26,	%f4
loop_1113:
	call	loop_1115
	move	%xcc,	%g6,	%g3
loop_1114:
	call	loop_1116
	call	loop_1117
loop_1115:
	call	loop_1118
	fornot2s	%f29,	%f17,	%f22
loop_1116:
	umul	%l0,	0x192F,	%i0
loop_1117:
	fmovsleu	%xcc,	%f15,	%f31
loop_1118:
	move	%icc,	0x7DC,	%g2
	fornot2	%f14,	%f22,	%f2
	fmovsul	%fcc2,	%f13,	%f6
	wr	%g0,	0x2a,	%asi
	stwa	%l4,	[%l7 + 0x58] %asi
	membar	#Sync
	call	loop_1119
	movule	%fcc2,	0x14D,	%o7
	nop
	setx	0x0CA9,	%l0,	%l2
	udivx	%g5,	%l2,	%o5
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f21
loop_1119:
	call	loop_1120
	fmovde	%xcc,	%f6,	%f0
	fzero	%f6
	call	loop_1121
loop_1120:
	edge32l	%l6,	%o3,	%g1
	fsrc2	%f22,	%f10
	call	loop_1122
loop_1121:
	wrpr	%o4,	%g7,	%cwp
	call	loop_1123
	call	loop_1124
loop_1122:
	call	loop_1125
	edge32l	%i3,	%i1,	%i2
loop_1123:
	call	loop_1126
loop_1124:
	call	loop_1127
loop_1125:
	call	loop_1128
	rdhpr	%hintp,	%l3
loop_1126:
	fmovdpos	%icc,	%f30,	%f14
loop_1127:
	movrlez	%i7,	%o6,	%l5
loop_1128:
	rdhpr	%ver,	%i6
	call	loop_1129
	andncc	%i4,	%g4,	%o0
	movrne	%i5,	%l1,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC14, 	%hsys_tick_cmpr
loop_1129:
	subccc	%o1,	0x1892,	%g3
	rd	%ccr,	%i0
	wrpr	%l0,	%g2,	%pil
	call	loop_1130
	movvs	%icc,	%o7,	%g5
	movvs	%xcc,	0x5EE,	%l4
	fcmpne16	%f6,	%f2,	%l2
loop_1130:
	nop
	set	0x6C, %i6
	swapa	[%l7 + %i6] 0x04,	%o5
	edge16	%l6,	%g1,	%o3
	rdhpr	%hintp,	%g7
	call	loop_1131
	fzeros	%f26
	movuge	%fcc0,	0x654,	%o4
	rd	%sys_tick_cmpr,	%i3
loop_1131:
	fnor	%f0,	%f6,	%f0
	orn	%i2,	%i1,	%l3
	fcmpne32	%f14,	%f24,	%o6
	fcmpeq16	%f0,	%f18,	%i7
	movcc	%icc,	0x36E,	%i6
	fmovse	%xcc,	%f12,	%f9
	bl	%icc,	loop_1132
	movneg	%xcc,	0x79C,	%l5
	fmovscs	%icc,	%f11,	%f15
	movn	%fcc1,	0x138,	%i4
loop_1132:
	fmovsvc	%xcc,	%f26,	%f5
	call	loop_1133
	movge	%fcc2,	0x1FF,	%g4
	fbn,a,pt	%fcc2,	loop_1134
	bcc,a,pn	%xcc,	loop_1135
loop_1133:
	tl	%xcc,	0x0
	fnands	%f18,	%f14,	%f22
loop_1134:
	call	loop_1136
loop_1135:
	fmovsa	%icc,	%f0,	%f29
	fand	%f2,	%f28,	%f22
	movgu	%icc,	0x31D,	%i5
loop_1136:
	edge16ln	%o0,	%l1,	%g6
	fmul8x16au	%f13,	%f19,	%f6
	andncc	%o1,	%o2,	%i0
	call	loop_1137
	tcc	%icc,	0x0
	smul	%l0,	0x0D3C,	%g3
	fmovsg	%fcc3,	%f2,	%f28
loop_1137:
	fsrc2	%f0,	%f24
	fbuge,pt	%fcc2,	loop_1138
	brz,pn	%o7,	loop_1139
	tl	%icc,	0x6
	fbule,pt	%fcc1,	loop_1140
loop_1138:
	fxnor	%f28,	%f2,	%f16
loop_1139:
	call	loop_1141
	ta	%icc,	0x5
loop_1140:
	call	loop_1142
	faligndata	%f12,	%f24,	%f6
loop_1141:
	fmovduge	%fcc3,	%f8,	%f12
	nop
	set	0x70, %o6
	ldsh	[%l7 + %o6],	%g2
loop_1142:
	call	loop_1143
	call	loop_1144
	movl	%fcc1,	0x2D9,	%g5
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x47] %asi
loop_1143:
	fmovdug	%fcc3,	%f2,	%f20
loop_1144:
	rdpr	%wstate,	%o5
	call	loop_1145
	fsrc2	%f22,	%f18
	nop
	set	0x48, %g4
	sth	%l2,	[%l7 + %g4]
	fnand	%f12,	%f4,	%f6
loop_1145:
	orcc	%g1,	%l6,	%g7
	ba,a,pn	%icc,	loop_1146
	mulscc	%o3,	%o4,	%i2
	call	loop_1147
	fcmps	%fcc3,	%f31,	%f0
loop_1146:
	fbul	%fcc0,	loop_1148
	call	loop_1149
loop_1147:
	fmovrse	%i3,	%f10,	%f6
	call	loop_1150
loop_1148:
	fbe,a	%fcc1,	loop_1151
loop_1149:
	array32	%l3,	%i1,	%i7
	call	loop_1152
loop_1150:
	nop
	fitos	%f10,	%f29
	fstox	%f29,	%f22
	fxtos	%f22,	%f26
loop_1151:
	tsubcctv	%o6,	0x119A,	%l5
	fmovrse	%i6,	%f19,	%f25
loop_1152:
	nop
!!	wr	%g0,	0x40,	%asi
!!	ldxa	[%g0 + 0x318] %asi,	%g4
	call	loop_1153
	movgu	%icc,	0x67A,	%i5
	call	loop_1154
	call	loop_1155
loop_1153:
	and	%o0,	0x0893,	%l1
	bne	%icc,	loop_1156
loop_1154:
	fpsub32s	%f0,	%f3,	%f18
loop_1155:
	tle	%xcc,	0x0
	umulcc	%i4,	%g6,	%o1
loop_1156:
	te	%xcc,	0x6
	sra	%i0,	%l0,	%g3
	call	loop_1157
	call	loop_1158
	edge16n	%o2,	%o7,	%g2
	rdhpr	%ver,	%g5
loop_1157:
	movrgz	%l4,	%o5,	%l2
loop_1158:
	fmuld8ulx16	%f19,	%f31,	%f6
	fnors	%f4,	%f13,	%f29
	nop
	setx	0x453408F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xF04180CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f4,	%f5
	call	loop_1159
	fmovspos	%icc,	%f22,	%f21
	fbo,pn	%fcc0,	loop_1160
	fmovsule	%fcc2,	%f3,	%f8
loop_1159:
	fbe,a	%fcc0,	loop_1161
	xnorcc	%g1,	%l6,	%g7
loop_1160:
	fmuld8ulx16	%f2,	%f19,	%f2
	fbug,a,pn	%fcc3,	loop_1162
loop_1161:
	fmovdn	%fcc0,	%f8,	%f16
	fzero	%f10
	call	loop_1163
loop_1162:
	brgz,pn	%o4,	loop_1164
	tvc	%icc,	0x4
	sra	%o3,	%i2,	%i3
loop_1163:
	movle	%xcc,	%i1,	%l3
loop_1164:
	call	loop_1165
	fnands	%f22,	%f5,	%f27
	faligndata	%f12,	%f0,	%f18
	fmovsue	%fcc2,	%f31,	%f2
loop_1165:
	tge	%icc,	0x5
	tpos	%icc,	0x2
	addc	%i7,	%o6,	%i6
	call	loop_1166
	fpack32	%f22,	%f26,	%f10
	fmovdcc	%xcc,	%f18,	%f2
	wr	%l5,	%g4,	%clear_softint
loop_1166:
	fcmpgt32	%f14,	%f26,	%i5
	call	loop_1167
	fmovdvs	%xcc,	%f16,	%f16
	nop
	setx	0x8AD85C048815DE50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x4BED5C62BCFA746E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f12,	%f24
	movo	%fcc0,	%o0,	%i4
loop_1167:
	fmovsne	%xcc,	%f1,	%f15
	call	loop_1168
	rdpr	%cleanwin,	%l1
	andcc	%o1,	%g6,	%l0
	call	loop_1169
loop_1168:
	edge16l	%g3,	%o2,	%o7
	call	loop_1170
	fmovsvc	%xcc,	%f22,	%f19
loop_1169:
	call	loop_1171
	call	loop_1172
loop_1170:
	call	loop_1173
	wr	%g2,	%i0,	%sys_tick
loop_1171:
	fmovslg	%fcc2,	%f1,	%f27
loop_1172:
	tcc	%icc,	0x1
loop_1173:
	fmovdgu	%icc,	%f30,	%f4
	popc	0x03A9,	%l4
	fmuld8ulx16	%f30,	%f20,	%f20
	call	loop_1174
	fandnot2s	%f28,	%f19,	%f4
	bge,a	%icc,	loop_1175
	fmul8x16al	%f14,	%f10,	%f14
loop_1174:
	bne	%xcc,	loop_1176
	fcmpeq32	%f16,	%f30,	%g5
loop_1175:
	call	loop_1177
	movrlz	%l2,	0x272,	%g1
loop_1176:
	fabss	%f0,	%f24
	fcmpd	%fcc1,	%f10,	%f4
loop_1177:
	tne	%xcc,	0x3
	call	loop_1178
	rdhpr	%htba,	%o5
	siam	0x6
	fmovsuge	%fcc3,	%f22,	%f31
loop_1178:
	wrpr	%g7,	0x02BD,	%tick
	fmovsleu	%icc,	%f0,	%f18
	brgez,pn	%o4,	loop_1179
	rdpr	%tl,	%l6
	fandnot2s	%f17,	%f20,	%f6
	tneg	%xcc,	0x3
loop_1179:
	call	loop_1180
	call	loop_1181
	edge8n	%i2,	%o3,	%i1
	fmovslg	%fcc0,	%f13,	%f31
loop_1180:
	fmovsuge	%fcc0,	%f8,	%f4
loop_1181:
	fmovsul	%fcc1,	%f5,	%f29
	movre	%i3,	0x348,	%i7
	call	loop_1182
	rdpr	%otherwin,	%l3
	call	loop_1183
	edge8l	%i6,	%o6,	%l5
loop_1182:
	nop
	set	0x38, %l3
	ldswa	[%l7 + %l3] 0x89,	%g4
loop_1183:
	movpos	%icc,	0x5FB,	%i5
	tgu	%icc,	0x2
	edge32ln	%o0,	%l1,	%i4
	movule	%fcc2,	0x707,	%g6
	fpadd16s	%f29,	%f20,	%f23
	wrpr	%o1,	0x1BB7,	%tick
	call	loop_1184
	fmovdu	%fcc1,	%f20,	%f0
	fnot2s	%f22,	%f10
	call	loop_1185
loop_1184:
	rdhpr	%htba,	%l0
	sethi	0x116D,	%o2
	tl	%icc,	0x4
loop_1185:
	call	loop_1186
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpack32	%f10,	%f4,	%f28
	call	loop_1187
loop_1186:
	fbul,pt	%fcc1,	loop_1188
	wr	%g3,	0x11A7,	%softint
	fmul8ulx16	%f26,	%f2,	%f28
loop_1187:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o7
loop_1188:
	andn	%i0,	0x1823,	%l4
	srax	%g5,	0x1E,	%l2
	andncc	%g2,	%g1,	%o5
	set	0x38, %o1
	swapa	[%l7 + %o1] 0x18,	%o4
	call	loop_1189
	call	loop_1190
	mova	%fcc1,	0x5E5,	%g7
	call	loop_1191
loop_1189:
	fbge,a,pn	%fcc3,	loop_1192
loop_1190:
	call	loop_1193
	call	loop_1194
loop_1191:
	fmuld8ulx16	%f23,	%f11,	%f14
loop_1192:
	call	loop_1195
loop_1193:
	call	loop_1196
loop_1194:
	bg,a,pn	%icc,	loop_1197
	call	loop_1198
loop_1195:
	fmovsul	%fcc0,	%f31,	%f3
loop_1196:
	subc	%l6,	%i2,	%o3
loop_1197:
	bmask	%i3,	%i1,	%l3
loop_1198:
	call	loop_1199
	call	loop_1200
	ldsw	[%l7 + 0x5C],	%i7
	fmovsg	%fcc2,	%f1,	%f25
loop_1199:
	call	loop_1201
loop_1200:
	call	loop_1202
	tvc	%xcc,	0x5
	edge8l	%i6,	%l5,	%o6
loop_1201:
	fmovrdgez	%i5,	%f2,	%f10
loop_1202:
	tleu	%xcc,	0x5
	stw	%g4,	[%l7 + 0x7C]
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_1203
	srax	%i4,	0x1F,	%g6
	rdhpr	%hintp,	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x18,	%l0,	%g3
loop_1203:
	fmovdue	%fcc2,	%f0,	%f14
	tle	%xcc,	0x1
	fpack32	%f0,	%f2,	%f22
	set	0x64, %o0
	swapa	[%l7 + %o0] 0x0c,	%o7
	call	loop_1204
	mulscc	%o2,	0x04AE,	%l4
	edge32l	%i0,	%g5,	%l2
	orn	%g2,	0x092D,	%g1
loop_1204:
	fmovrslez	%o5,	%f17,	%f11
	fmuld8ulx16	%f9,	%f13,	%f6
	movrgez	%g7,	%o4,	%l6
	fandnot2s	%f17,	%f31,	%f15
	call	loop_1205
	sllx	%i2,	%o3,	%i3
	tl	%xcc,	0x0
	swap	[%l7 + 0x70],	%i1
loop_1205:
	edge8l	%i7,	%i6,	%l3
	movvs	%icc,	0x60E,	%l5
	fnegs	%f28,	%f29
	srl	%i5,	%g4,	%l1
	fmovscs	%xcc,	%f7,	%f26
	edge8n	%o6,	%o0,	%g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 24
!	Type a   	: 35
!	Type x   	: 11
!	Type cti   	: 144
!	Type f   	: 135
!	Type i   	: 151
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x11755375
.word 0xE620FDCF
.word 0x98723D14
.word 0x3AA3612C
.word 0xCACEB346
.word 0x76AEFBDA
.word 0xE49B169D
.word 0x3B99E362
.word 0x881EC2DB
.word 0x48138613
.word 0x6FDF077F
.word 0x3FC19B15
.word 0x19EC9844
.word 0x3202B361
.word 0x687AD20B
.word 0x6F614C8E
.word 0x4621C8F3
.word 0xFA73E5DE
.word 0x38FA775D
.word 0xDD7CB381
.word 0x9042FC0D
.word 0x2581200B
.word 0xD8B8EB95
.word 0x8AA38F48
.word 0xBC33A842
.word 0x8B5569DC
.word 0x8476A7A2
.word 0xDAF0374E
.word 0xC2A397F6
.word 0xD0655459
.word 0xA1DD1DDB
.word 0x2E5A0E01
.word 0x6F9C1722
.word 0xB6912477
.word 0x6F4D9BEE
.word 0x9FAFD03E
.word 0x1FF2E04D
.word 0xE1617EBC
.word 0x376FEEC4
.word 0x9C1E54E2
.word 0x29E1E83E
.word 0xC4A4F33B
.word 0x411CD301
.word 0x46CA24D8
.word 0x070685E7
.word 0x63DA621C
.word 0x6F975859
.word 0xF9586BAB
.word 0xA857C1B7
.word 0x915EAE6F
.word 0x27D3B6E6
.word 0xC1BC5A77
.word 0xC8BF0352
.word 0xF03FDF4F
.word 0x5D5A54EA
.word 0x5C4F2B5F
.word 0x262D27F6
.word 0xF8B6ED8C
.word 0xC68BE893
.word 0xC67EAD98
.word 0x4B8726FA
.word 0x30B0C339
.word 0xE52596F9
.word 0x58418B38
.end
