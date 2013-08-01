/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_02.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=4512349"
.ident "Thu Dec 11 11:41:56 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_02.s,v 1.4 2007/07/27 21:45:30 drp Exp $"
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
	set	0x3,	%g2
	set	0x5,	%g3
	set	0xA,	%g4
	set	0x7,	%g5
	set	0x6,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x9,	%i1
	set	-0xA,	%i2
	set	-0x2,	%i3
	set	-0x4,	%i4
	set	-0x4,	%i5
	set	-0x6,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x764512C8,	%l0
	set	0x3EFE518D,	%l1
	set	0x13DCDD79,	%l2
	set	0x539490BE,	%l3
	set	0x73109D97,	%l4
	set	0x6FB6A4F4,	%l5
	set	0x0A65272B,	%l6
	!# Output registers
	set	0x0F6B,	%o0
	set	0x0A51,	%o1
	set	0x0CCE,	%o2
	set	0x0AD8,	%o3
	set	-0x03A2,	%o4
	set	0x082F,	%o5
	set	-0x1E5A,	%o6
	set	0x157B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f6
	call	loop_1
	rd	%y,	%i1
	call	loop_2
	ble,a,pn	%icc,	loop_3
loop_1:
	fmovscs	%icc,	%f28,	%f17
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f30
	fxtos	%f30,	%f7
loop_2:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x22,	%g2
loop_3:
	fcmple32	%f24,	%f2,	%o6
	fcmpne32	%f8,	%f20,	%o0
	edge8	%g3,	%i0,	%o2
	tge	%xcc,	0x7
	addccc	%l5,	%o7,	%l4
	edge32ln	%i2,	%o3,	%i5
	fandnot2	%f0,	%f12,	%f2
	fmovdpos	%icc,	%f22,	%f2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%l0
	call	loop_4
	bneg,a	%icc,	loop_5
	fxors	%f22,	%f6,	%f12
	call	loop_6
loop_4:
	nop
	setx	0x0B43CF73E7E40B11,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xD058A9AB1A99B817,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f10,	%f26
loop_5:
	fmovsgu	%icc,	%f0,	%f18
	call	loop_7
loop_6:
	call	loop_8
	fmovrslez	%g7,	%f21,	%f28
	call	loop_9
loop_7:
	udivcc	%o1,	0x00,	%l2
loop_8:
	call	loop_10
	fabsd	%f4,	%f10
loop_9:
	rd	%y,	%l6
	edge8ln	%g6,	%i7,	%i4
loop_10:
	tneg	%icc,	0x4
	call	loop_11
	tge	%xcc,	0x4
	edge8ln	%g5,	%o5,	%i3
	add	%o4,	%g4,	%l3
loop_11:
	brlz	%g1,	loop_12
	edge16l	%l1,	%i1,	%g2
	fornot1s	%f18,	%f29,	%f18
	call	loop_13
loop_12:
	call	loop_14
	sdivx	%o6,	%i6,	%g3
	fpackfix	%f28,	%f25
loop_13:
	fpsub32	%f16,	%f14,	%f12
loop_14:
	fmovdg	%xcc,	%f12,	%f10
	fmovse	%xcc,	%f4,	%f18
	fmovrse	%i0,	%f26,	%f26
	call	loop_15
	call	loop_16
	ta	%xcc,	0x3
	call	loop_17
loop_15:
	tg	%xcc,	0x4
loop_16:
	and	%o2,	%l5,	%o0
	call	loop_18
loop_17:
	call	loop_19
	call	loop_20
	edge32ln	%l4,	%i2,	%o3
loop_18:
	call	loop_21
loop_19:
	call	loop_22
loop_20:
	call	loop_23
	flushw
loop_21:
	call	loop_24
loop_22:
	fnand	%f16,	%f12,	%f30
loop_23:
	call	loop_25
	orcc	%o7,	0x06C7,	%l0
loop_24:
	andcc	%g7,	0x1616,	%i5
	call	loop_26
loop_25:
	subccc	%l2,	%l6,	%o1
	xnor	%i7,	0x0A1F,	%g6
	call	loop_27
loop_26:
	call	loop_28
	fand	%f22,	%f16,	%f26
	call	loop_29
loop_27:
	nop
	fitos	%f5,	%f6
	fstox	%f6,	%f28
loop_28:
	nop
	setx	0x842B7D5B16076CD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1843393A61A4E323,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f28,	%f22
	call	loop_30
loop_29:
	ba	%icc,	loop_31
	call	loop_32
	fmovsleu	%xcc,	%f18,	%f14
loop_30:
	call	loop_33
loop_31:
	movrgz	%i4,	0x029,	%g5
loop_32:
	tvc	%icc,	0x3
	xorcc	%o5,	%o4,	%i3
loop_33:
	fcmpgt16	%f30,	%f14,	%g4
	fmovsu	%fcc0,	%f6,	%f0
	array8	%l3,	%g1,	%i1
	edge32l	%g2,	%l1,	%i6
	set	0x44, %o5
	sta	%f17,	[%l7 + %o5] 0x88
	fnand	%f6,	%f26,	%f16
	tgu	%icc,	0x2
	movvs	%xcc,	%o6,	%g3
	fcmpeq32	%f14,	%f8,	%o2
	ble	%xcc,	loop_34
	edge8l	%i0,	%l5,	%l4
	call	loop_35
	fexpand	%f20,	%f18
loop_34:
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	fcmpne32	%f24,	%f28,	%i2
loop_35:
	call	loop_36
	call	loop_37
	movrgz	%o0,	0x027,	%o7
	wr	%l0,	%g7,	%clear_softint
loop_36:
	bn	%xcc,	loop_38
loop_37:
	call	loop_39
	fmovdne	%fcc3,	%f6,	%f20
	call	loop_40
loop_38:
	fpack16	%f20,	%f16
loop_39:
	wr	%i5,	0x0E3C,	%sys_tick
	movgu	%icc,	0x408,	%o3
loop_40:
	fmovsneg	%xcc,	%f3,	%f22
	fpsub16s	%f14,	%f9,	%f17
	wr	%g0,	0x27,	%asi
	stha	%l2,	[%l7 + 0x48] %asi
	membar	#Sync
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tleu	%xcc,	0x5
	bvs,pn	%xcc,	loop_41
	movug	%fcc3,	0x76B,	%o1
	movneg	%icc,	%l6,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%i4
loop_41:
	movuge	%fcc0,	0x7F5,	%o5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g5
	andn	%o4,	0x1799,	%g4
	call	loop_42
	movrgz	%l3,	%i3,	%i1
	fmovdue	%fcc3,	%f6,	%f14
	array16	%g2,	%l1,	%i6
loop_42:
	addcc	%o6,	0x1285,	%g1
	smulcc	%g3,	%o2,	%i0
	sdivcc	%l4,	0x00,	%i2
	srlx	%l5,	%o0,	%l0
	call	loop_43
	fbo,a,pt	%fcc1,	loop_44
	fors	%f20,	%f9,	%f18
	call	loop_45
loop_43:
	membar	0x1D
loop_44:
	call	loop_46
	movg	%xcc,	0x34A,	%g7
loop_45:
	fmul8x16al	%f12,	%f30,	%f8
	fpsub32s	%f29,	%f5,	%f12
loop_46:
	call	loop_47
	call	loop_48
	bmask	%i5,	%o3,	%l2
	fmul8sux16	%f4,	%f14,	%f14
loop_47:
	call	loop_49
loop_48:
	call	loop_50
	fcmple16	%f10,	%f6,	%o1
	rdhpr	%hintp,	%o7
loop_49:
	sra	%l6,	0x0E,	%i7
loop_50:
	brz,a,pn	%g6,	loop_51
	addcc	%o5,	0x1C9F,	%i4
	fnot2	%f0,	%f18
	fmovdge	%xcc,	%f28,	%f4
loop_51:
	fmovspos	%xcc,	%f27,	%f15
	sethi	0x007C,	%o4
	fpadd32	%f22,	%f4,	%f16
	call	loop_52
	fmovdpos	%icc,	%f30,	%f22
	srl	%g4,	0x02,	%g5
	bcc	%xcc,	loop_53
loop_52:
	ba,a,pn	%xcc,	loop_54
	fornot2s	%f19,	%f12,	%f4
	fands	%f4,	%f31,	%f5
loop_53:
	fmovrdne	%i3,	%f14,	%f2
loop_54:
	andncc	%i1,	%g2,	%l1
	tvs	%xcc,	0x2
	call	loop_55
	fpadd16s	%f23,	%f15,	%f26
	movuge	%fcc3,	%l3,	%i6
	fsrc2	%f18,	%f24
loop_55:
	fnot1	%f0,	%f24
	fmovrslez	%g1,	%f13,	%f19
	call	loop_56
	fmovdu	%fcc0,	%f4,	%f26
	brnz,pn	%o6,	loop_57
	brgez,pn	%g3,	loop_58
loop_56:
	fornot2	%f22,	%f20,	%f26
	fmovdg	%fcc1,	%f16,	%f14
loop_57:
	call	loop_59
loop_58:
	movgu	%xcc,	%i0,	%o2
	movrlz	%l4,	0x2DE,	%i2
	call	loop_60
loop_59:
	nop
	setx	0xB2EF4775,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fpackfix	%f6,	%f2
	fmovsn	%fcc0,	%f21,	%f27
loop_60:
	fsrc1s	%f10,	%f30
	call	loop_61
	call	loop_62
	addc	%l5,	%o0,	%g7
	call	loop_63
loop_61:
	sdivx	%l0,	0x00,	%o3
loop_62:
	call	loop_64
	bcc,a,pn	%icc,	loop_65
loop_63:
	fmovsgu	%icc,	%f11,	%f0
	fmovdpos	%icc,	%f6,	%f26
loop_64:
	call	loop_66
loop_65:
	call	loop_67
	edge8l	%i5,	%l2,	%o1
	call	loop_68
loop_66:
	for	%f30,	%f16,	%f12
loop_67:
	bn,pt	%icc,	loop_69
	tne	%icc,	0x6
loop_68:
	nop
	fitos	%f20,	%f13
	call	loop_70
loop_69:
	call	loop_71
	fcmped	%fcc0,	%f14,	%f2
	fmovsule	%fcc0,	%f30,	%f7
loop_70:
	fmovdvs	%icc,	%f4,	%f2
loop_71:
	rdpr	%canrestore,	%l6
	udiv	%o7,	0x00,	%i7
	tn	%icc,	0x4
	fmovrse	%g6,	%f12,	%f15
	call	loop_72
	call	loop_73
	fornot2s	%f13,	%f13,	%f21
	andncc	%o5,	0x1FBC,	%i4
loop_72:
	faligndata	%f28,	%f6,	%f30
loop_73:
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_74
	call	loop_75
	call	loop_76
	fabss	%f30,	%f21
loop_74:
	call	loop_77
loop_75:
	call	loop_78
loop_76:
	movneg	%icc,	0x5B8,	%g5
	fbl,a	%fcc3,	loop_79
loop_77:
	add	%o4,	0x0F8D,	%i1
loop_78:
	flushw
	fmovdo	%fcc1,	%f28,	%f30
loop_79:
	prefetch	[%l7 + 0x78],	 1
	edge8	%i3,	%g2,	%l1
	rdpr	%cleanwin,	%i6
	fmovrse	%g1,	%f21,	%f30
	edge32l	%o6,	%l3,	%g3
	srax	%i0,	%o2,	%i2
	te	%xcc,	0x2
	fones	%f28
	call	loop_80
	fnors	%f21,	%f30,	%f9
	rdpr	%gl,	%l5
	bne,pn	%xcc,	loop_81
loop_80:
	call	loop_82
	call	loop_83
	call	loop_84
loop_81:
	fmovsge	%xcc,	%f17,	%f4
loop_82:
	fmovsneg	%icc,	%f22,	%f8
loop_83:
	fbl	%fcc2,	loop_85
loop_84:
	fmovdgu	%xcc,	%f0,	%f10
	mova	%xcc,	%o0,	%g7
	edge16	%l0,	%l4,	%o3
loop_85:
	fmovsul	%fcc0,	%f0,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movre	%l2,	%o1,	%l6
	fcmped	%fcc0,	%f0,	%f8
	fxnor	%f22,	%f2,	%f28
	fnot2	%f16,	%f8
	fcmps	%fcc3,	%f29,	%f15
	call	loop_86
	movrgez	%o7,	0x0B4,	%i7
	fmovsue	%fcc1,	%f29,	%f11
	fmovdvc	%icc,	%f26,	%f18
loop_86:
	wrpr	%i5,	%o5,	%tick
	call	loop_87
	call	loop_88
	srl	%g6,	%g4,	%g5
	fmovsne	%xcc,	%f25,	%f11
loop_87:
	movrne	%o4,	0x001,	%i4
loop_88:
	call	loop_89
	fmovdo	%fcc2,	%f20,	%f4
	rd	%tick_cmpr,	%i1
	xor	%g2,	0x0476,	%l1
loop_89:
	wrpr	%i6,	0x1D80,	%tick
	fmovrdgez	%i3,	%f20,	%f8
	tpos	%xcc,	0x4
	fmovsuge	%fcc0,	%f7,	%f24
	nop
	set	0x18, %g3
	stx	%g1,	[%l7 + %g3]
	call	loop_90
	rdhpr	%hsys_tick_cmpr,	%l3
	fmovsue	%fcc2,	%f25,	%f5
	brz	%o6,	loop_91
loop_90:
	smul	%g3,	0x0531,	%i0
	call	loop_92
	smul	%i2,	0x0A1A,	%o2
loop_91:
	fbo,a,pn	%fcc2,	loop_93
	call	loop_94
loop_92:
	rd	%sys_tick_cmpr,	%o0
	flushw
loop_93:
	membar	0x28
loop_94:
	call	loop_95
	movu	%fcc1,	%l5,	%l0
	call	loop_96
	fmovsule	%fcc1,	%f30,	%f9
loop_95:
	call	loop_97
	call	loop_98
loop_96:
	fpack32	%f18,	%f22,	%f20
	nop
	setx	0xCBC558A5DBC00269,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x2D80A79C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f14,	%f4
loop_97:
	fnot2	%f28,	%f28
loop_98:
	nop
	setx	0xF433BEEB36D66BA9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC49AAE396AF40FA4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f14,	%f10
	call	loop_99
	fexpand	%f12,	%f8
	fpadd32	%f30,	%f24,	%f28
	call	loop_100
loop_99:
	rdhpr	%hpstate,	%l4
	fnors	%f5,	%f25,	%f24
	call	loop_101
loop_100:
	call	loop_102
	nop
	setx	loop_103,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022400001403,	%l0,	%l1
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
	alignaddr	%o3,	%g7,	%l2
loop_101:
	smul	%l6,	0x176B,	%o1
loop_102:
	call	loop_104
loop_103:
	fcmpeq16	%f4,	%f4,	%i7
	mova	%xcc,	0x2B0,	%o7
	call	loop_105
loop_104:
	mulscc	%o5,	%i5,	%g6
	mova	%icc,	0x5FD,	%g4
	nop
	setx	0x12258B2D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f17
loop_105:
	bvc,a	%icc,	loop_106
	call	loop_107
	fmul8sux16	%f12,	%f20,	%f24
	call	loop_108
loop_106:
	fbule,pn	%fcc1,	loop_109
loop_107:
	alignaddr	%o4,	%i4,	%g5
	fbe	%fcc3,	loop_110
loop_108:
	subccc	%g2,	%i1,	%l1
loop_109:
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	call	loop_111
loop_110:
	pdist	%f20,	%f2,	%f6
	call	loop_112
	sra	%i3,	%i6,	%l3
loop_111:
	fnegs	%f18,	%f19
	fmovscs	%xcc,	%f18,	%f21
loop_112:
	nop
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x11,	%g1
	fors	%f19,	%f17,	%f31
	movne	%icc,	%g3,	%o6
	call	loop_113
	array32	%i2,	%i0,	%o2
	tn	%icc,	0x7
	fmovse	%fcc2,	%f10,	%f0
loop_113:
	call	loop_114
	addccc	%o0,	%l0,	%l4
	set	0x62, %o7
	lduha	[%l7 + %o7] 0x0c,	%l5
loop_114:
	fbo	%fcc1,	loop_115
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmpeq16	%f10,	%f28,	%o3
	fmovrdlz	%l2,	%f10,	%f0
loop_115:
	addc	%l6,	%g7,	%o1
	fandnot2s	%f25,	%f10,	%f30
	sdiv	%o7,	%o5,	%i7
	fnand	%f0,	%f4,	%f18
	call	loop_116
	tl	%icc,	0x3
	edge8n	%i5,	%g6,	%g4
	fmovde	%fcc0,	%f18,	%f12
loop_116:
	call	loop_117
	fmovd	%f20,	%f28
	movvc	%xcc,	0x7DA,	%o4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_117:
	nop
	setx	0x4726A9D3557AECBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x65D5D713AE6F2CFC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f28,	%f20
	call	loop_118
	rdhpr	%ver,	%g5
	call	loop_119
	orcc	%i4,	0x13E2,	%g2
loop_118:
	bge,a	%xcc,	loop_120
	rdpr	%otherwin,	%l1
loop_119:
	fmovdl	%icc,	%f18,	%f22
	xnor	%i1,	%i3,	%i6
loop_120:
	fpackfix	%f18,	%f8
	wr	%g1,	0x15FB,	%sys_tick
	movle	%fcc1,	%l3,	%o6
	fmul8x16	%f29,	%f10,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_121
	call	loop_122
	array8	%i0,	%o2,	%g3
	call	loop_123
loop_121:
	andncc	%o0,	%l4,	%l5
loop_122:
	movrgez	%l0,	%o3,	%l6
	edge8n	%g7,	%l2,	%o7
loop_123:
	st	%f4,	[%l7 + 0x24]
	call	loop_124
	call	loop_125
	popc	%o1,	%o5
	brgez,pt	%i7,	loop_126
loop_124:
	lduh	[%l7 + 0x60],	%g6
loop_125:
	nop
	fitos	%f2,	%f1
	fstox	%f1,	%f30
	fxtos	%f30,	%f7
	call	loop_127
loop_126:
	fmovrdgez	%g4,	%f22,	%f2
	fmovsu	%fcc3,	%f21,	%f13
	call	loop_128
loop_127:
	call	loop_129
	movrlez	%o4,	%i5,	%i4
	rdpr	%tl,	%g5
loop_128:
	call	loop_130
loop_129:
	call	loop_131
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	set	0x0C, %o6
	ldswa	[%l7 + %o6] 0x19,	%g2
loop_130:
	call	loop_132
loop_131:
	tsubcc	%i1,	0x1086,	%l1
	tl	%icc,	0x6
	fmul8ulx16	%f28,	%f22,	%f26
loop_132:
	movle	%fcc2,	0x1CD,	%i3
	call	loop_133
	fzero	%f0
	edge8	%i6,	%g1,	%l3
	nop
	setx	0x7939B7FDF299BD59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6B5936686BD1A3DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f18,	%f6
loop_133:
	fcmped	%fcc3,	%f8,	%f22
	taddcc	%i2,	0x05DA,	%i0
	wrpr	%o6,	0x1C5A,	%cwp
	fnand	%f18,	%f2,	%f14
	set	0x74, %l5
	ldsha	[%l7 + %l5] 0x18,	%o2
	fmovdcs	%icc,	%f10,	%f24
	mulscc	%o0,	%g3,	%l4
	fcmped	%fcc3,	%f18,	%f28
	rdhpr	%ver,	%l0
	fcmpne16	%f4,	%f8,	%o3
	rdpr	%wstate,	%l6
	tg	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x5C] %asi,	%f27
	sir	0x06DD

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E3, 	%hsys_tick_cmpr
	xnorcc	%g7,	%o1,	%o5
	movrlez	%i7,	0x3D3,	%g6
	taddcc	%g4,	0x1D11,	%o7
	movne	%fcc1,	0x6FB,	%i5
	fone	%f24
	call	loop_134
	call	loop_135
	fcmped	%fcc0,	%f12,	%f8
	wr	%o4,	%i4,	%softint
loop_134:
	fmuld8sux16	%f0,	%f26,	%f30
loop_135:
	fsrc2s	%f18,	%f24
	brnz,a,pn	%g5,	loop_136
	call	loop_137
	movvs	%xcc,	0x70F,	%i1
	fmovspos	%xcc,	%f26,	%f28
loop_136:
	fzeros	%f11
loop_137:
	call	loop_138
	movle	%fcc2,	%g2,	%l1
	subccc	%i6,	%i3,	%l3
	fbule,a,pt	%fcc2,	loop_139
loop_138:
	movl	%fcc3,	0x2E1,	%g1
	call	loop_140
	nop
	setx	0x56D6E5AFE73A3ACF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x47DD805DDAFAE7C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f30,	%f16
loop_139:
	movne	%fcc3,	%i0,	%i2
	call	loop_141
loop_140:
	call	loop_142
	call	loop_143
	call	loop_144
loop_141:
	add	%o6,	%o2,	%o0
loop_142:
	fmovduge	%fcc1,	%f16,	%f10
loop_143:
	call	loop_145
loop_144:
	call	loop_146
	orncc	%g3,	0x1250,	%l0
	nop
	setx	0x59AFB937,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xF1D2FA87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f20,	%f9
loop_145:
	call	loop_147
loop_146:
	call	loop_148
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%o2
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f24
	fxtod	%f24,	%f18
loop_147:
	nop
	setx loop_149, %l0, %l1
	jmpl %l1, %l4
loop_148:
	fmovsle	%fcc2,	%f31,	%f16
	rd	%fprs,	%l5
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f10
loop_149:
	fpmerge	%f5,	%f31,	%f28
	call	loop_150
	flushw
	nop
	setx	0x6A70C13DD0732AFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF7BD7C02ABA01826,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f30,	%f6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l2
loop_150:
	call	loop_151
	fcmped	%fcc1,	%f22,	%f8
	rdhpr	%hpstate,	%g7
	fnor	%f2,	%f8,	%f6
loop_151:
	fmovse	%fcc1,	%f10,	%f10
	nop
	setx	0x23DA9B54A524F8C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	call	loop_152
	movrne	%l6,	%o1,	%i7
	faligndata	%f28,	%f26,	%f30
	orncc	%g6,	0x1456,	%o5
loop_152:
	tneg	%icc,	0x4
	call	loop_153
	alignaddrl	%o7,	%i5,	%o4
	fmovsvs	%icc,	%f9,	%f0
	alignaddrl	%i4,	%g4,	%g5
loop_153:
	fbug,a	%fcc2,	loop_154
	call	loop_155
	fandnot2s	%f9,	%f4,	%f3
	sll	%i1,	%g2,	%i6
loop_154:
	call	loop_156
loop_155:
	movrlez	%l1,	%l3,	%i3
	fpadd32s	%f18,	%f28,	%f8
loop_156:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 22
!	Type a   	: 27
!	Type x   	: 12
!	Type cti   	: 156
!	Type f   	: 144
!	Type i   	: 139
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
	set	0x5,	%g1
	set	0xA,	%g2
	set	0x4,	%g3
	set	0x5,	%g4
	set	0x3,	%g5
	set	0xD,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xC,	%i1
	set	-0x4,	%i2
	set	-0xC,	%i3
	set	-0xA,	%i4
	set	-0x1,	%i5
	set	-0x6,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x04B27630,	%l0
	set	0x23FE74B5,	%l1
	set	0x331D9239,	%l2
	set	0x4AF23643,	%l3
	set	0x4AB1ECC7,	%l4
	set	0x5B597E21,	%l5
	set	0x300C65AA,	%l6
	!# Output registers
	set	0x0647,	%o0
	set	0x0F76,	%o1
	set	-0x0C8A,	%o2
	set	-0x0E03,	%o3
	set	-0x148C,	%o4
	set	-0x0C02,	%o5
	set	-0x056E,	%o6
	set	-0x1899,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	srlx	%g1,	0x1D,	%i2
	srl	%i0,	%o2,	%o0
	call	loop_157
	stbar
	call	loop_158
	call	loop_159
loop_157:
	call	loop_160
	fmovsa	%fcc1,	%f11,	%f6
loop_158:
	fbule	%fcc1,	loop_161
loop_159:
	move	%xcc,	%g3,	%l0
loop_160:
	sll	%o3,	%o6,	%l4
	fmovdul	%fcc1,	%f8,	%f6
loop_161:
	movuge	%fcc3,	%l5,	%l2
	tcc	%icc,	0x6
	fmovsue	%fcc1,	%f12,	%f3
	nop
	setx	0xB5884B21,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xE03A1411,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f4,	%f31
	wrpr	%g7,	0x0A01,	%cwp
	nop
	setx	0x52E7E8CA356A4ED6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x88FDD778,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f20,	%f22
	fbne,a	%fcc3,	loop_162
	call	loop_163
	movul	%fcc3,	%o1,	%i7
	mova	%icc,	%l6,	%o5
loop_162:
	fnand	%f30,	%f18,	%f26
loop_163:
	wrpr 	%g0, 	0x2, 	%gl
	tne	%icc,	0x3
	fmovd	%f24,	%f24
	call	loop_164
	fcmple16	%f2,	%f16,	%o7
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 3
	tsubcc	%i5,	%i4,	%g4
loop_164:
	fpadd32s	%f3,	%f22,	%f19
	call	loop_165
	smulcc	%o4,	0x00F2,	%i1
	call	loop_166
	fexpand	%f28,	%f18
loop_165:
	sdivx	%g2,	0x00,	%i6
	array16	%g5,	%l3,	%i3
loop_166:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsle	%icc,	%f9,	%f21
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l1,	%g1
	call	loop_167
	call	loop_168
	fexpand	%f18,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD8B, 	%hsys_tick_cmpr
loop_167:
	sra	%i2,	0x01,	%g3
loop_168:
	fmovsvs	%icc,	%f29,	%f24
	call	loop_169
	call	loop_170
	fmovrsne	%o0,	%f18,	%f1
	fmovsne	%fcc2,	%f22,	%f13
loop_169:
	movvs	%xcc,	%o3,	%o6
loop_170:
	call	loop_171
	call	loop_172
	movul	%fcc3,	0x46F,	%l0
	fmovdcc	%icc,	%f6,	%f20
loop_171:
	membar	0x18
loop_172:
	call	loop_173
	wrpr	%l4,	0x05FF,	%tick
	nop
	setx	0xAB8BFDF2C25FA2CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7ED15AD3F367CA70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f6
	fpadd32	%f18,	%f16,	%f4
loop_173:
	fnor	%f4,	%f14,	%f28
	call	loop_174
	edge32	%l2,	%g7,	%o1
	call	loop_175
	fmul8sux16	%f26,	%f2,	%f20
loop_174:
	call	loop_176
	call	loop_177
loop_175:
	call	loop_178
	rdpr	%otherwin,	%i7
loop_176:
	tsubcctv	%l6,	%o5,	%g6
loop_177:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB4, 	%hsys_tick_cmpr
loop_178:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_179
	call	loop_180
	fmovde	%xcc,	%f6,	%f18
	fmovrdne	%i4,	%f10,	%f30
loop_179:
	bmask	%g4,	%o4,	%i5
loop_180:
	tsubcc	%g2,	0x193A,	%i1
	fands	%f16,	%f27,	%f4
	fcmple16	%f18,	%f4,	%g5
	fand	%f26,	%f8,	%f14
	tneg	%icc,	0x2
	call	loop_181
	fmovdu	%fcc0,	%f12,	%f20
	rdpr	%cwp,	%l3
	wr	%g0,	0x18,	%asi
	stha	%i6,	[%l7 + 0x46] %asi
loop_181:
	movrne	%l1,	0x2DD,	%g1
	call	loop_182
	call	loop_183
	fpmerge	%f28,	%f28,	%f0
	fmovsne	%fcc3,	%f15,	%f23
loop_182:
	fba,a,pn	%fcc0,	loop_184
loop_183:
	rd	%asi,	%i3
	movge	%xcc,	0x50C,	%i0
	call	loop_185
loop_184:
	call	loop_186
	for	%f14,	%f28,	%f18
	fcmple32	%f18,	%f10,	%o2
loop_185:
	smulcc	%g3,	%i2,	%o3
loop_186:
	fmovsgu	%icc,	%f0,	%f7
	call	loop_187
	sir	0x1324
	rdpr	%canrestore,	%o0
	bneg,a	%xcc,	loop_188
loop_187:
	movue	%fcc0,	%l0,	%l4
	fpadd32	%f6,	%f16,	%f30
	call	loop_189
loop_188:
	call	loop_190
	call	loop_191
	fxor	%f28,	%f30,	%f22
loop_189:
	nop
	setx	loop_192,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014200001401,	%l0,	%l1
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
loop_190:
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%o6
loop_191:
	edge16n	%l2,	%g7,	%i7
	bneg	%xcc,	loop_193
loop_192:
	call	loop_194
	fcmpne32	%f2,	%f2,	%l6
	fnegs	%f25,	%f14
loop_193:
	call	loop_195
loop_194:
	call	loop_196
	fpsub32	%f24,	%f14,	%f8
	fsrc1	%f26,	%f8
loop_195:
	call	loop_197
loop_196:
	fmovrsgez	%o5,	%f14,	%f31
	fmovso	%fcc2,	%f21,	%f11
	call	loop_198
loop_197:
	edge32ln	%g6,	%l5,	%o1
	edge32ln	%i4,	%g4,	%o7
	call	loop_199
loop_198:
	call	loop_200
	movo	%fcc0,	0x15D,	%i5
	call	loop_201
loop_199:
	call	loop_202
loop_200:
	st	%f24,	[%l7 + 0x18]
	sdivcc	%g2,	0x00,	%i1
loop_201:
	edge8l	%g5,	%l3,	%i6
loop_202:
	call	loop_203
	fnot1s	%f15,	%f17
	bgu	%icc,	loop_204
	rd	%ccr,	%o4
loop_203:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%g1
loop_204:
	mulx	%i0,	0x178C,	%o2
	call	loop_205
	tleu	%xcc,	0x5
	wrpr	%i3,	%g3,	%pil
	st	%fsr,	[%l7 + 0x24]
loop_205:
	nop
	set	0x08, %o4
	std	%f16,	[%l7 + %o4]
	rd	%sys_tick_cmpr,	%o3
	fmovdg	%xcc,	%f26,	%f0
	fmovsu	%fcc1,	%f8,	%f6
	sdivcc	%o0,	0x00,	%i2
	fmul8x16au	%f8,	%f19,	%f22
	fmovdgu	%icc,	%f4,	%f20
	call	loop_206
	call	loop_207
	call	loop_208
	call	loop_209
loop_206:
	fmovdpos	%xcc,	%f28,	%f24
loop_207:
	ba,pn	%icc,	loop_210
loop_208:
	array16	%l4,	%o6,	%l0
loop_209:
	brgez,pn	%l2,	loop_211
	orncc	%g7,	%i7,	%l6
loop_210:
	call	loop_212
	fexpand	%f17,	%f4
loop_211:
	call	loop_213
	fmovdpos	%icc,	%f0,	%f28
loop_212:
	ldd	[%l7 + 0x10],	%f12
	call	loop_214
loop_213:
	sll	%g6,	%o5,	%o1
	call	loop_215
	movne	%fcc1,	%l5,	%i4
loop_214:
	fpadd16	%f2,	%f20,	%f4
	add	%o7,	0x065C,	%g4
loop_215:
	fand	%f4,	%f20,	%f22
	call	loop_216
	fmovdpos	%icc,	%f14,	%f20
	fbuge,a,pn	%fcc1,	loop_217
	fmovdle	%fcc1,	%f12,	%f18
loop_216:
	fmovdvc	%icc,	%f10,	%f14
	call	loop_218
loop_217:
	or	%g2,	%i1,	%g5
	movl	%fcc3,	%l3,	%i5
	call	loop_219
loop_218:
	fnors	%f31,	%f26,	%f27
	ldstub	[%l7 + 0x44],	%i6
	bpos,pn	%icc,	loop_220
loop_219:
	call	loop_221
	rdhpr	%ver,	%o4
	call	loop_222
loop_220:
	nop
	setx	0xFFBC53A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f17
loop_221:
	wr	%l1,	0x1110,	%ccr
	call	loop_223
loop_222:
	fmovsneg	%icc,	%f5,	%f20
	wr	%g1,	0x1D90,	%clear_softint
	call	loop_224
loop_223:
	fbue,pn	%fcc1,	loop_225
	fmovsl	%fcc0,	%f13,	%f6
	array32	%o2,	%i3,	%g3
loop_224:
	tsubcctv	%o3,	0x17FA,	%o0
loop_225:
	srlx	%i0,	0x15,	%i2
	fmovsg	%fcc3,	%f28,	%f15
	call	loop_226
	fpackfix	%f30,	%f7
	rdpr	%cwp,	%l4
	fcmps	%fcc2,	%f0,	%f23
loop_226:
	fmovdl	%xcc,	%f0,	%f20
	fnot1s	%f24,	%f22
	edge8l	%o6,	%l2,	%l0
	fsrc2	%f22,	%f18
	fmovrslez	%i7,	%f27,	%f15
	call	loop_227
	xor	%g7,	%l6,	%o5
	smul	%g6,	%l5,	%o1
	ld	[%l7 + 0x40],	%f14
loop_227:
	fcmple32	%f22,	%f8,	%i4
	tvc	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCF0, 	%hsys_tick_cmpr
	fmovsue	%fcc3,	%f10,	%f20
	fpsub16s	%f16,	%f18,	%f4
	fmovduge	%fcc3,	%f26,	%f28
	st	%f23,	[%l7 + 0x34]
	fcmpgt16	%f8,	%f16,	%g2
	fmul8ulx16	%f8,	%f14,	%f6
	edge8ln	%g5,	%i1,	%i5
	edge32n	%i6,	%l3,	%l1
	membar	0x2C
	sir	0x12F1
	fabsd	%f24,	%f8
	call	loop_228
	movuge	%fcc0,	%g1,	%o2
	xnor	%i3,	0x1B0D,	%o4
	ta	%xcc,	0x7
loop_228:
	fmovse	%icc,	%f8,	%f14
	movrlez	%g3,	%o0,	%i0
	fcmpgt32	%f10,	%f0,	%i2
	wrpr 	%g0, 	0x1, 	%gl
	fmovrslez	%l4,	%f24,	%f15
	rd	%y,	%l2
	tsubcc	%o6,	%l0,	%i7
	call	loop_229
	addcc	%g7,	%l6,	%g6
	for	%f6,	%f14,	%f24
	fbue,pt	%fcc0,	loop_230
loop_229:
	addcc	%o5,	0x18E4,	%l5
	edge32n	%i4,	%o1,	%o7
	call	loop_231
loop_230:
	subc	%g2,	%g5,	%g4
	addccc	%i5,	%i6,	%l3
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f2
loop_231:
	rdpr	%canrestore,	%l1
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f26
	fpsub16s	%f27,	%f29,	%f17
	fbge,a,pn	%fcc2,	loop_232
	tge	%xcc,	0x3
	tl	%xcc,	0x0
	rd	%tick_cmpr,	%i1
loop_232:
	edge32l	%o2,	%i3,	%o4
	call	loop_233
	xorcc	%g3,	0x1A15,	%g1
	call	loop_234
	fmovrdlz	%i0,	%f8,	%f14
loop_233:
	call	loop_235
	edge32l	%i2,	%o0,	%o3
loop_234:
	fsrc1	%f8,	%f28
	fpadd16s	%f17,	%f2,	%f17
loop_235:
	call	loop_236
	call	loop_237
	fbug,a	%fcc2,	loop_238
	movgu	%icc,	0x4C6,	%l4
loop_236:
	call	loop_239
loop_237:
	udivx	%o6,	0x00,	%l0
loop_238:
	wrpr	%l2,	0x1899,	%cwp
	sir	0x1F44
loop_239:
	call	loop_240
	movvc	%xcc,	%i7,	%g7
	call	loop_241
	udivx	%l6,	0x00,	%o5
loop_240:
	rdhpr	%hpstate,	%g6
	rdhpr	%ver,	%l5
loop_241:
	orn	%i4,	%o7,	%o1
	fpack32	%f14,	%f24,	%f12
	fnot1	%f18,	%f0
	sdiv	%g5,	0x00,	%g2
	fxnors	%f29,	%f1,	%f6
	ldsb	[%l7 + 0x54],	%g4
	call	loop_242
	fnot2s	%f13,	%f13
	movleu	%xcc,	0x79B,	%i5
	te	%icc,	0x1
loop_242:
	fmovsleu	%xcc,	%f4,	%f8
	fmovsge	%icc,	%f10,	%f26
	call	loop_243
	movpos	%xcc,	0x494,	%l3
	fcmps	%fcc1,	%f4,	%f31
	nop
	fitos	%f0,	%f6
	fstod	%f6,	%f12
loop_243:
	fmovdle	%icc,	%f20,	%f2
	set	0x8, %i4
	stxa	%l1,	[%g0 + %i4] 0x20
	flushw
	tl	%xcc,	0x4
	te	%icc,	0x5
	movvc	%icc,	%i6,	%o2
	faligndata	%f2,	%f4,	%f20
	tpos	%icc,	0x0
	brlz	%i1,	loop_244
	fmovsg	%fcc2,	%f19,	%f11
	call	loop_245
	fmovdug	%fcc3,	%f30,	%f26
loop_244:
	call	loop_246
	call	loop_247
loop_245:
	fabss	%f16,	%f15
	orncc	%i3,	%g3,	%g1
loop_246:
	add	%i0,	%o4,	%i2
loop_247:
	be,a	%icc,	loop_248
	fxnors	%f7,	%f4,	%f10
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%o3
	fmovrse	%o0,	%f6,	%f25
loop_248:
	rd	%softint,	%l4
	array32	%o6,	%l2,	%i7
	call	loop_249
	fandnot2	%f6,	%f14,	%f22
	fba,pn	%fcc1,	loop_250
	call	loop_251
loop_249:
	call	loop_252
	fmovrse	%g7,	%f27,	%f13
loop_250:
	fmovdul	%fcc0,	%f4,	%f8
loop_251:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f23,	[%l7 + 0x68] %asi
loop_252:
	fandnot2s	%f29,	%f8,	%f2
	fones	%f4
	call	loop_253
	movule	%fcc3,	0x3FA,	%l6
	edge16l	%l0,	%o5,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9CE, 	%hsys_tick_cmpr
loop_253:
	fmovsn	%icc,	%f23,	%f0
	fexpand	%f3,	%f24
	call	loop_254
	fcmple32	%f10,	%f4,	%o7
	nop
	set	0x78, %g7
	std	%g4,	[%l7 + %g7]
	nop
	setx	loop_255,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022200001400,	%l0,	%l1
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
loop_254:
	edge32	%g2,	%o1,	%g4
	addccc	%i5,	0x038A,	%l3
	rd	%tick_cmpr,	%l1
loop_255:
	call	loop_256
	call	loop_257
	call	loop_258
	edge8n	%o2,	%i6,	%i1
loop_256:
	fmovdn	%icc,	%f18,	%f24
loop_257:
	fxor	%f22,	%f0,	%f30
loop_258:
	fxor	%f2,	%f20,	%f12
	call	loop_259
	movul	%fcc3,	%i3,	%g1
	st	%fsr,	[%l7 + 0x5C]
	call	loop_260
loop_259:
	tvs	%xcc,	0x3
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x04,	%i0
loop_260:
	call	loop_261
	udivx	%g3,	0x00,	%o4
	fexpand	%f9,	%f18
	nop
	setx	0xEE01B6F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f21
loop_261:
	fnors	%f8,	%f9,	%f10
	fsrc2s	%f27,	%f10
	for	%f4,	%f26,	%f30
	st	%f22,	[%l7 + 0x24]
	edge32	%i2,	%o0,	%l4
	edge8n	%o6,	%l2,	%i7
	call	loop_262
	fmovduge	%fcc3,	%f8,	%f12
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xcd
loop_262:
	call	loop_263
	fmovsg	%fcc1,	%f2,	%f15
	fpadd16s	%f7,	%f25,	%f12
	call	loop_264
loop_263:
	addcc	%o3,	0x15B8,	%l6
	rdhpr	%htba,	%l0
	flushw
loop_264:
	umulcc	%o5,	%l5,	%g6
	fmovdgu	%icc,	%f18,	%f14
	call	loop_265
	mulx	%i4,	0x0B40,	%g7
	fmovscs	%xcc,	%f24,	%f14
	call	loop_266
loop_265:
	nop
	fitod	%f6,	%f0
	fdtoi	%f0,	%f21
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x28] %asi,	%f18
loop_266:
	srlx	%o7,	%g5,	%o1
	fpsub32	%f28,	%f18,	%f26
	movvc	%xcc,	%g4,	%i5
	movrgz	%l3,	%g2,	%l1
	fpsub16	%f4,	%f4,	%f12
	movule	%fcc0,	0x026,	%i6
	subccc	%i1,	0x086E,	%o2
	ldx	[%l7 + 0x10],	%i3
	call	loop_267
	fmuld8ulx16	%f12,	%f17,	%f10
	fmovdcc	%icc,	%f24,	%f20
	fmovrde	%g1,	%f16,	%f4
loop_267:
	fmovdleu	%icc,	%f30,	%f8
	movneg	%icc,	%i0,	%g3
	fpsub32s	%f1,	%f18,	%f18
	tl	%icc,	0x3
	tl	%icc,	0x1
	smul	%i2,	%o4,	%l4
	fones	%f18
	movul	%fcc1,	%o6,	%l2
	fnands	%f5,	%f10,	%f5
	mulscc	%o0,	%o3,	%i7
	sllx	%l6,	%o5,	%l0
	bmask	%g6,	%i4,	%l5
	addccc	%g7,	%o7,	%o1
	bvc	%icc,	loop_268
	ble	%xcc,	loop_269
	call	loop_270
	call	loop_271
loop_268:
	movn	%fcc0,	0x36A,	%g5
loop_269:
	fbuge,a	%fcc0,	loop_272
loop_270:
	call	loop_273
loop_271:
	fmovdle	%fcc1,	%f22,	%f18
	fmovsul	%fcc0,	%f0,	%f1
loop_272:
	smulcc	%i5,	%l3,	%g2
loop_273:
	sra	%l1,	0x0C,	%i6
	fmuld8ulx16	%f18,	%f1,	%f12
	array32	%i1,	%o2,	%i3
	rd	%ccr,	%g4
	call	loop_274
	udiv	%g1,	0x00,	%g3
	call	loop_275
	rdpr	%pil,	%i0
loop_274:
	call	loop_276
	movge	%icc,	%o4,	%i2
loop_275:
	edge32n	%l4,	%o6,	%l2
	call	loop_277
loop_276:
	movug	%fcc1,	0x410,	%o3
	call	loop_278
	mulscc	%o0,	0x154C,	%l6
loop_277:
	subcc	%i7,	%l0,	%g6
	fmovdcs	%icc,	%f22,	%f26
loop_278:
	nop
	set	0x3D, %o0
	ldub	[%l7 + %o0],	%o5
	call	loop_279
	fmovse	%fcc0,	%f3,	%f18
	call	loop_280
	tvc	%xcc,	0x5
loop_279:
	fmuld8ulx16	%f6,	%f3,	%f16
	sdivcc	%i4,	%g7,	%o7
loop_280:
	call	loop_281
	rd	%tick_cmpr,	%l5
	rd	%tick_cmpr,	%o1
	fandnot1	%f6,	%f24,	%f26
loop_281:
	movvc	%xcc,	0x2F5,	%i5
	sdivcc	%g5,	0x00,	%l3
	bl	%xcc,	loop_282
	call	loop_283
	xnor	%g2,	%l1,	%i1
	fmovsle	%icc,	%f12,	%f29
loop_282:
	andcc	%i6,	%o2,	%i3
loop_283:
	fsrc2	%f30,	%f14
	movgu	%icc,	%g1,	%g3
	movue	%fcc0,	0x7D9,	%i0
	tne	%icc,	0x1
	set	0x64, %l2
	stwa	%o4,	[%l7 + %l2] 0x81
	subcc	%i2,	0x1F43,	%g4
	sir	0x0C15
	andncc	%l4,	%l2,	%o6
	andn	%o0,	0x061F,	%l6
	fmovdn	%fcc3,	%f24,	%f0
	call	loop_284
	fmovsge	%fcc3,	%f2,	%f16
	faligndata	%f20,	%f22,	%f0
	fmovsule	%fcc0,	%f27,	%f28
loop_284:
	nop
	wr	%g0,	0x22,	%asi
	stha	%i7,	[%l7 + 0x52] %asi
	membar	#Sync
	nop
	setx	0x88A43A58FF35BB0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x9783C73C97EEC7CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f12,	%f26
	fmovrdgez	%l0,	%f6,	%f16
	fmovdu	%fcc0,	%f2,	%f16
	fmovdgu	%icc,	%f20,	%f6
	subccc	%o3,	0x1854,	%g6
	fmovsu	%fcc2,	%f3,	%f9
	call	loop_285
	edge8l	%o5,	%i4,	%o7
	call	loop_286
	movlg	%fcc0,	%g7,	%o1
loop_285:
	fpadd16	%f20,	%f22,	%f16
	call	loop_287
loop_286:
	alignaddr	%i5,	%l5,	%l3
	fbug,pt	%fcc2,	loop_288
	rdpr	%gl,	%g2
loop_287:
	call	loop_289
	wr	%l1,	0x0754,	%ccr
loop_288:
	call	loop_290
	fsrc1	%f24,	%f10
loop_289:
	movule	%fcc1,	%g5,	%i1
	call	loop_291
loop_290:
	call	loop_292
	nop
	set	0x0D, %i3
	ldstub	[%l7 + %i3],	%i6
	fxnor	%f0,	%f26,	%f12
loop_291:
	nop

loop_292:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 29
!	Type a   	: 34
!	Type x   	: 10
!	Type cti   	: 136
!	Type f   	: 146
!	Type i   	: 145
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
	set	0x6,	%g1
	set	0x4,	%g2
	set	0xB,	%g3
	set	0x9,	%g4
	set	0x0,	%g5
	set	0x2,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x5,	%i1
	set	-0x9,	%i2
	set	-0xA,	%i3
	set	-0x5,	%i4
	set	-0xC,	%i5
	set	-0x9,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x468A47E9,	%l0
	set	0x421FE096,	%l1
	set	0x30628EC0,	%l2
	set	0x08AB93D1,	%l3
	set	0x7F7086EE,	%l4
	set	0x4CE3982F,	%l5
	set	0x7FEC0044,	%l6
	!# Output registers
	set	0x1A82,	%o0
	set	-0x0098,	%o1
	set	-0x06A7,	%o2
	set	0x17D0,	%o3
	set	-0x0959,	%o4
	set	0x1BEB,	%o5
	set	0x0082,	%o6
	set	0x026C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	rd	%softint,	%o2
	movule	%fcc0,	0x19E,	%i3
	movcc	%xcc,	0x5E5,	%g3
	fmovdule	%fcc0,	%f16,	%f0
	fornot1s	%f30,	%f27,	%f17
	fmovslg	%fcc2,	%f4,	%f11
	call	loop_293
	movrgez	%g1,	0x2CB,	%o4
	call	loop_294
	call	loop_295
loop_293:
	array8	%i0,	%i2,	%g4
	call	loop_296
loop_294:
	fmovdgu	%xcc,	%f6,	%f18
loop_295:
	fmovspos	%icc,	%f30,	%f27
	tneg	%xcc,	0x1
loop_296:
	fmovdne	%icc,	%f10,	%f22
	call	loop_297
	nop
	setx	0x86718CD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x09D64AEC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f8,	%f13
	movleu	%icc,	%l4,	%l2
	call	loop_298
loop_297:
	call	loop_299
	taddcctv	%o6,	0x14F7,	%o0
	call	loop_300
loop_298:
	fmovdneg	%icc,	%f30,	%f22
loop_299:
	call	loop_301
	fmovrse	%i7,	%f21,	%f28
loop_300:
	call	loop_302
	fmovscs	%icc,	%f3,	%f7
loop_301:
	popc	%l6,	%l0
	call	loop_303
loop_302:
	stbar
	call	loop_304
	call	loop_305
loop_303:
	call	loop_306
	call	loop_307
loop_304:
	fsrc1	%f10,	%f10
loop_305:
	sdivx	%g6,	%o3,	%o5
loop_306:
	nop
	setx	0x78A1C9C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f25
loop_307:
	fabsd	%f20,	%f22
	edge16ln	%o7,	%i4,	%g7
	nop
	setx	0x39F1DF84429F083F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x7C95A6B1A5B903F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f22,	%f22
	fxnors	%f26,	%f4,	%f19
	wrpr	%o1,	0x14A3,	%cwp
	smul	%i5,	%l3,	%l5
	fmovdu	%fcc3,	%f8,	%f0
	bvs	%icc,	loop_308
	call	loop_309
	sdivx	%g2,	0x00,	%l1
	call	loop_310
loop_308:
	fcmped	%fcc0,	%f30,	%f6
loop_309:
	tsubcc	%g5,	0x1942,	%i6
	movge	%xcc,	0x465,	%o2
loop_310:
	fpack16	%f10,	%f20
	rdpr	%pil,	%i1
	nop
	setx	loop_311,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031100001405,	%l0,	%l1
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
	fnot2s	%f17,	%f27
	sllx	%g3,	0x12,	%i3
	call	loop_312
loop_311:
	movvc	%icc,	%g1,	%o4
	movo	%fcc1,	%i0,	%g4
	nop
	setx	0xAD0EEF74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x6D3311DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f23,	%f19
loop_312:
	call	loop_313
	call	loop_314
	andn	%i2,	0x1E84,	%l2
	call	loop_315
loop_313:
	fmovdne	%fcc3,	%f8,	%f12
loop_314:
	movo	%fcc1,	%o6,	%o0
	call	loop_316
loop_315:
	rdpr	%pil,	%i7
	nop
	set	0x5E, %g4
	lduh	[%l7 + %g4],	%l6
	call	loop_317
loop_316:
	call	loop_318
	fmovdl	%fcc0,	%f28,	%f30
	call	loop_319
loop_317:
	fnot2s	%f24,	%f25
loop_318:
	call	loop_320
	fcmpgt32	%f20,	%f22,	%l4
loop_319:
	tle	%xcc,	0x3
	bne,a	%xcc,	loop_321
loop_320:
	call	loop_322
	fmovsn	%icc,	%f4,	%f20
	call	loop_323
loop_321:
	movcc	%icc,	0x43D,	%g6
loop_322:
	nop
	setx	0xDD869800D7BB7D1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x9ACFA156A4445C0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f14,	%f16
	call	loop_324
loop_323:
	call	loop_325
	ble,a,pn	%icc,	loop_326
	fcmpgt32	%f26,	%f30,	%o3
loop_324:
	fnors	%f18,	%f3,	%f8
loop_325:
	fbe,a	%fcc0,	loop_327
loop_326:
	te	%xcc,	0x7
	ldd	[%l7 + 0x68],	%f16
	fmovdle	%icc,	%f18,	%f4
loop_327:
	fcmpgt32	%f18,	%f8,	%l0
	movn	%fcc2,	0x600,	%o5
	fpackfix	%f0,	%f30
	movug	%fcc0,	0x11E,	%i4
	fmovsn	%fcc3,	%f10,	%f14
	call	loop_328
	tge	%icc,	0x1
	mulscc	%o7,	%g7,	%o1
	subcc	%l3,	%l5,	%i5
loop_328:
	mulx	%l1,	%g5,	%g2
	fmovsug	%fcc0,	%f1,	%f9
	rdpr	%canrestore,	%o2
	array8	%i6,	%i1,	%i3
	srlx	%g3,	%g1,	%o4
	swap	[%l7 + 0x18],	%g4
	call	loop_329
	for	%f16,	%f24,	%f6
	call	loop_330
	orcc	%i0,	0x1D68,	%l2
loop_329:
	call	loop_331
	brz,a,pt	%i2,	loop_332
loop_330:
	call	loop_333
	fbul,pn	%fcc0,	loop_334
loop_331:
	fcmpeq32	%f20,	%f26,	%o0
loop_332:
	rd	%ccr,	%i7
loop_333:
	call	loop_335
loop_334:
	call	loop_336
	fmovsgu	%xcc,	%f27,	%f17
	fsrc2s	%f21,	%f1
loop_335:
	call	loop_337
loop_336:
	rdhpr	%hpstate,	%l6
	call	loop_338
	call	loop_339
loop_337:
	rdhpr	%ver,	%l4
	subc	%g6,	0x1302,	%o3
loop_338:
	movleu	%icc,	0x3E3,	%l0
loop_339:
	edge16n	%o6,	%i4,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA62, 	%tick_cmpr
	call	loop_340
	fmovso	%fcc1,	%f20,	%f7
	call	loop_341
	fmovd	%f10,	%f20
loop_340:
	taddcctv	%g7,	%o1,	%l3
	call	loop_342
loop_341:
	faligndata	%f0,	%f10,	%f4
	tvs	%icc,	0x7
	fnegs	%f29,	%f9
loop_342:
	call	loop_343
	tneg	%xcc,	0x5
	tcs	%icc,	0x1
	wrpr	%l5,	0x1ADA,	%tick
loop_343:
	call	loop_344
	fnot1	%f28,	%f2
	orcc	%i5,	%g5,	%l1
	tge	%xcc,	0x3
loop_344:
	fmovslg	%fcc3,	%f17,	%f24
	call	loop_345
	fpmerge	%f24,	%f4,	%f24
	call	loop_346
	movcs	%icc,	0x587,	%o2
loop_345:
	nop
	setx	0x38AE7152,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x24318F03,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f29,	%f3
	fmovdl	%fcc1,	%f28,	%f16
loop_346:
	fornot2	%f16,	%f26,	%f8
	fexpand	%f14,	%f22
	call	loop_347
	addcc	%i6,	%g2,	%i3
	call	loop_348
	sdiv	%g3,	%g1,	%o4
loop_347:
	call	loop_349
	movre	%i1,	%i0,	%g4
loop_348:
	call	loop_350
	fnot1	%f16,	%f10
loop_349:
	call	loop_351
	ta	%xcc,	0x2
loop_350:
	sdivx	%l2,	%i2,	%o0
	st	%fsr,	[%l7 + 0x78]
loop_351:
	xnorcc	%l6,	%i7,	%g6
	fzero	%f14
	ba,a,pn	%xcc,	loop_352
	fnot1	%f20,	%f30
	movvc	%icc,	0x1D3,	%o3
	call	loop_353
loop_352:
	call	loop_354
	nop
	fitos	%f5,	%f23
	fstoi	%f23,	%f4
	movue	%fcc1,	%l0,	%l4
loop_353:
	call	loop_355
loop_354:
	fcmpeq16	%f12,	%f28,	%o6
	call	loop_356
	bcs,a,pt	%xcc,	loop_357
loop_355:
	call	loop_358
	fmovdge	%xcc,	%f28,	%f14
loop_356:
	and	%i4,	%o7,	%g7
loop_357:
	fsrc2s	%f17,	%f23
loop_358:
	andcc	%o1,	%o5,	%l5
	movre	%l3,	0x22A,	%g5
	movrne	%i5,	0x189,	%l1
	nop
	fitos	%f2,	%f21
	array16	%o2,	%i6,	%i3
	udivcc	%g2,	%g3,	%g1
	call	loop_359
	call	loop_360
	brlez,a,pt	%o4,	loop_361
	fbo,pn	%fcc0,	loop_362
loop_359:
	st	%fsr,	[%l7 + 0x3C]
loop_360:
	nop
	fitos	%f4,	%f12
	fstod	%f12,	%f10
loop_361:
	tl	%xcc,	0x7
loop_362:
	call	loop_363
	nop
	setx	loop_364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021100001402,	%l0,	%l1
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
	wr	%i1,	%i0,	%softint
	fpadd32	%f22,	%f10,	%f10
loop_363:
	addc	%l2,	0x0241,	%g4
loop_364:
	fornot1s	%f7,	%f23,	%f11
	call	loop_365
	fbule,a	%fcc0,	loop_366
	call	loop_367
	fandnot1s	%f30,	%f7,	%f23
loop_365:
	call	loop_368
loop_366:
	movrgez	%i2,	0x333,	%l6
loop_367:
	call	loop_369
	call	loop_370
loop_368:
	call	loop_371
	fors	%f10,	%f29,	%f14
loop_369:
	rdpr	%otherwin,	%o0
loop_370:
	fbl,pt	%fcc2,	loop_372
loop_371:
	tpos	%icc,	0x7
	bvc	%icc,	loop_373
	udivcc	%i7,	%g6,	%l0
loop_372:
	edge16ln	%l4,	%o6,	%o3
	fmovscc	%icc,	%f30,	%f11
loop_373:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f15,	[%l7 + 0x6C] %asi
	fexpand	%f7,	%f0
	sdivcc	%i4,	%g7,	%o7
	fexpand	%f6,	%f18
	fcmpgt16	%f30,	%f30,	%o5
	xor	%o1,	%l5,	%g5
	movre	%l3,	%i5,	%o2
	call	loop_374
	fnegd	%f16,	%f10
	movul	%fcc0,	%l1,	%i6
	call	loop_375
loop_374:
	movpos	%icc,	0x56F,	%g2
	fmovsu	%fcc3,	%f25,	%f1
	call	loop_376
loop_375:
	call	loop_377
	call	loop_378
	fnand	%f2,	%f22,	%f12
loop_376:
	bpos,pn	%icc,	loop_379
loop_377:
	edge8	%g3,	%g1,	%i3
loop_378:
	and	%o4,	0x1AE5,	%i0
	prefetch	[%l7 + 0x30],	 0
loop_379:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i1
	fmovsge	%fcc3,	%f27,	%f24
	call	loop_380
	call	loop_381
	popc	0x0707,	%g4
	xorcc	%i2,	%l6,	%l2
loop_380:
	tle	%xcc,	0x7
loop_381:
	wr	%o0,	0x1D82,	%set_softint
	sir	0x1CA8
	add	%i7,	0x07F8,	%l0
	st	%fsr,	[%l7 + 0x10]
	nop
	setx	0x5223D71E395FDA5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xCD10F84C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f4,	%f18
	fcmple16	%f26,	%f16,	%l4
	andn	%g6,	%o3,	%o6
	call	loop_382
	rd	%fprs,	%g7
	andncc	%i4,	%o7,	%o5
	fbo,a,pt	%fcc0,	loop_383
loop_382:
	fmovsl	%fcc0,	%f10,	%f7
	tgu	%icc,	0x7
	call	loop_384
loop_383:
	movneg	%xcc,	0x256,	%l5
	edge8	%g5,	%l3,	%o1
	call	loop_385
loop_384:
	movvs	%xcc,	%o2,	%l1
	sdivcc	%i6,	0x00,	%i5
	edge8l	%g3,	%g2,	%i3
loop_385:
	call	loop_386
	fmovdlg	%fcc0,	%f14,	%f22
	movle	%fcc0,	0x728,	%g1
	mulscc	%o4,	0x0F62,	%i0
loop_386:
	wrpr	%g4,	0x01ED,	%cwp
	call	loop_387
	tvs	%xcc,	0x4
	bshuffle	%f0,	%f4,	%f30
	fornot2s	%f25,	%f10,	%f9
loop_387:
	call	loop_388
	fmovdne	%xcc,	%f18,	%f2
	mova	%fcc2,	%i2,	%l6
	udivcc	%i1,	0x00,	%l2
loop_388:
	fmovscs	%xcc,	%f8,	%f6
	call	loop_389
	rd	%ccr,	%o0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_390
loop_389:
	fzero	%f12
	flushw
	nop
	setx	0x0694B53D13C35DC7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD3461236,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f22,	%f28
loop_390:
	tvc	%icc,	0x1
	fmovdn	%fcc3,	%f4,	%f18
	call	loop_391
	fmovsvs	%xcc,	%f30,	%f6
	fmovsleu	%icc,	%f14,	%f24
	nop
	setx loop_392, %l0, %l1
	jmpl %l1, %i7
loop_391:
	fxnor	%f4,	%f8,	%f8
	call	loop_393
	movrgez	%l0,	%g6,	%o3
loop_392:
	subc	%l4,	%g7,	%o6
	srlx	%o7,	%o5,	%i4
loop_393:
	wr	%l5,	%g5,	%pic
	addcc	%o1,	%o2,	%l3
	brlz,a,pn	%i6,	loop_394
	movg	%xcc,	%i5,	%l1
	movg	%fcc0,	%g3,	%i3
	udivx	%g2,	0x00,	%g1
loop_394:
	brlez	%i0,	loop_395
	fors	%f22,	%f2,	%f22
	sdiv	%g4,	0x00,	%o4
	nop
	setx	0xF5076D49080616A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x746CF039FF9DB28A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f18,	%f4
loop_395:
	fornot2	%f28,	%f2,	%f18
	call	loop_396
	fmul8sux16	%f12,	%f2,	%f10
	call	loop_397
	nop
	setx	0x9CABAC52,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xB3992891,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f16,	%f3
loop_396:
	call	loop_398
	call	loop_399
loop_397:
	fpadd32s	%f17,	%f22,	%f21
	call	loop_400
loop_398:
	edge16l	%i2,	%i1,	%l2
loop_399:
	fmovslg	%fcc2,	%f16,	%f21
	fmovsleu	%icc,	%f7,	%f3
loop_400:
	call	loop_401
	call	loop_402
	bgu,a,pt	%icc,	loop_403
	call	loop_404
loop_401:
	tle	%xcc,	0x6
loop_402:
	call	loop_405
loop_403:
	fmovspos	%xcc,	%f12,	%f20
loop_404:
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_406
loop_405:
	fmovsvc	%xcc,	%f25,	%f29
	edge8l	%l0,	%g6,	%o3
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f22
loop_406:
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f4
	fxtos	%f4,	%f7
	fpsub16	%f14,	%f28,	%f6
	tpos	%icc,	0x0
	srl	%l4,	%g7,	%o6
	nop
	setx	0x7E00A57B7C7D18AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x0575E90429AC63E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f18,	%f20
	bg,pt	%xcc,	loop_407
	call	loop_408
	call	loop_409
	movne	%icc,	0x7DA,	%o7
loop_407:
	fmovd	%f20,	%f4
loop_408:
	sdivx	%o5,	%l6,	%l5
loop_409:
	fmovdo	%fcc2,	%f28,	%f18
	fmovdcc	%icc,	%f2,	%f26
	rdpr	%tba,	%g5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_410
	call	loop_411
	fmul8x16au	%f31,	%f2,	%f8
	udivcc	%i4,	0x00,	%o1
loop_410:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D9, 	%hsys_tick_cmpr
loop_411:
	call	loop_412
	sethi	0x0DE3,	%o2
	call	loop_413
	movlg	%fcc1,	%i6,	%i5
loop_412:
	fsrc1s	%f16,	%f10
	mulscc	%l1,	%i3,	%g2
loop_413:
	fmovse	%xcc,	%f5,	%f11
	taddcc	%g1,	%i0,	%g3
	call	loop_414
	fcmps	%fcc3,	%f28,	%f17
	fmovsn	%fcc2,	%f26,	%f20
	fsrc1	%f24,	%f28
loop_414:
	call	loop_415
	fmovdl	%fcc0,	%f4,	%f6
	or	%g4,	0x1EC0,	%o4
	fors	%f2,	%f28,	%f25
loop_415:
	tsubcctv	%i2,	%i1,	%l2
	movrlez	%o0,	0x020,	%i7
	edge16l	%g6,	%o3,	%l0
	call	loop_416
	call	loop_417
	fmovdcs	%xcc,	%f20,	%f18
	call	loop_418
loop_416:
	fblg,a	%fcc1,	loop_419
loop_417:
	call	loop_420
	umulcc	%g7,	0x0B9F,	%o6
loop_418:
	flushw
loop_419:
	fbn	%fcc1,	loop_421
loop_420:
	edge16	%l4,	%o7,	%l6
	xnorcc	%l5,	0x00D6,	%o5
	movre	%g5,	%o1,	%l3
loop_421:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_422
	call	loop_423
	stbar
	call	loop_424
loop_422:
	fandnot1	%f26,	%f20,	%f0
loop_423:
	mulx	%i6,	0x1951,	%l1
	edge16l	%i5,	%g2,	%i3
loop_424:
	nop
	set	0x4E, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i0
	rdpr	%cwp,	%g1
	sra	%g3,	0x15,	%g4
	call	loop_425
	call	loop_426
	call	loop_427
	nop
	fitos	%f5,	%f27
	fstox	%f27,	%f14
	fxtos	%f14,	%f30
loop_425:
	fmovsul	%fcc2,	%f3,	%f16
loop_426:
	call	loop_428
loop_427:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsle	%fcc0,	%f24,	%f22
	wr	%i2,	0x1365,	%sys_tick
loop_428:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%o4,	[%l7 + 0x51] %asi
	membar	#Sync
	call	loop_429
	bg	%icc,	loop_430
	call	loop_431
	fzeros	%f22
loop_429:
	tleu	%xcc,	0x0
loop_430:
	fmovdge	%fcc1,	%f22,	%f16
loop_431:
	fmovsl	%icc,	%f0,	%f8
	fsrc1s	%f10,	%f23
	edge32l	%l2,	%i1,	%o0
	fmovscc	%xcc,	%f22,	%f6
	wrpr	%g6,	0x1B05,	%tick
	call	loop_432
	call	loop_433
	edge32l	%i7,	%l0,	%o3
	membar	0x57
loop_432:
	call	loop_434
loop_433:
	srlx	%g7,	%o6,	%o7
	call	loop_435
	fpadd32s	%f25,	%f19,	%f12
loop_434:
	fcmpgt16	%f26,	%f6,	%l6
	fones	%f27
loop_435:
	fmovduge	%fcc2,	%f30,	%f6
	call	loop_436
	call	loop_437
	call	loop_438
	ldsw	[%l7 + 0x40],	%l4
loop_436:
	fmovsn	%xcc,	%f11,	%f0
loop_437:
	orn	%o5,	0x06F2,	%l5
loop_438:
	call	loop_439
	movne	%fcc3,	%g5,	%o1
	fpsub32	%f16,	%f14,	%f16
	fblg,pn	%fcc0,	loop_440
loop_439:
	bmask	%l3,	%o2,	%i4
	andn	%i6,	0x1A0F,	%l1
	call	loop_441
loop_440:
	call	loop_442
	fmovdle	%xcc,	%f28,	%f8
	fpack32	%f26,	%f6,	%f6
loop_441:
	fmovduge	%fcc1,	%f4,	%f26
loop_442:
	fcmpes	%fcc3,	%f25,	%f4
	fmuld8sux16	%f4,	%f13,	%f14
	wrpr	%i5,	%g2,	%cwp
	rdhpr	%hintp,	%i3
	fmovrslez	%g1,	%f22,	%f26
	tsubcctv	%i0,	%g3,	%i2
	fbl	%fcc0,	loop_443
	call	loop_444
	movpos	%icc,	0x2A3,	%o4
	bge,pn	%icc,	loop_445
loop_443:
	fcmpgt32	%f26,	%f30,	%g4
loop_444:
	call	loop_446
	call	loop_447
loop_445:
	xorcc	%l2,	0x0796,	%i1
	fsrc2	%f16,	%f28
loop_446:
	fmovdul	%fcc3,	%f30,	%f26
loop_447:
	call	loop_448
	or	%o0,	0x1551,	%i7
	call	loop_449
	movue	%fcc2,	%g6,	%l0
loop_448:
	fand	%f26,	%f20,	%f24
	fmovduge	%fcc1,	%f8,	%f6
loop_449:
	srl	%g7,	0x18,	%o3
	tpos	%icc,	0x2
	bl	%icc,	loop_450
	call	loop_451
	movgu	%xcc,	%o7,	%o6
	rdpr	%canrestore,	%l6
loop_450:
	call	loop_452
loop_451:
	fornot1	%f0,	%f28,	%f8
	call	loop_453
	fmovrdlz	%o5,	%f24,	%f30
loop_452:
	sdiv	%l5,	0x00,	%g5
	std	%f22,	[%l7 + 0x70]
loop_453:
	call	loop_454
	addcc	%l4,	%l3,	%o1
	call	loop_455
	bge,pn	%icc,	loop_456
loop_454:
	rdpr	%cwp,	%o2
	wrpr	%i6,	0x1FD9,	%tick
loop_455:
	call	loop_457
loop_456:
	fmul8ulx16	%f4,	%f8,	%f30
	or	%i4,	0x0DDC,	%l1
	call	loop_458
loop_457:
	and	%i5,	%i3,	%g1
	ba,a	%xcc,	loop_459
	fandnot1	%f12,	%f22,	%f18
loop_458:
	fmovrse	%g2,	%f29,	%f24
	set	, %i1
loop_459:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 15
!	Type a   	: 29
!	Type x   	: 5
!	Type cti   	: 167
!	Type f   	: 140
!	Type i   	: 144
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
	set	0x9,	%g2
	set	0x7,	%g3
	set	0xF,	%g4
	set	0xC,	%g5
	set	0x0,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x3,	%i1
	set	-0x3,	%i2
	set	-0xB,	%i3
	set	-0x9,	%i4
	set	-0xE,	%i5
	set	-0x4,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x433CAFF4,	%l0
	set	0x5AADEE8C,	%l1
	set	0x4B5E18A8,	%l2
	set	0x24F41FA8,	%l3
	set	0x6512BDAC,	%l4
	set	0x4A5736B0,	%l5
	set	0x44482712,	%l6
	!# Output registers
	set	0x1E41,	%o0
	set	0x0EE6,	%o1
	set	0x01CA,	%o2
	set	-0x00F6,	%o3
	set	0x1DC8,	%o4
	set	0x06D3,	%o5
	set	0x086D,	%o6
	set	0x1915,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	set	0x3C, %l4
	ldsba	[%l7 + %l4] 0x18,	%g3
	sethi	0x039E,	%i2
	edge16ln	%i0,	%o4,	%l2
	nop
	fitos	%f14,	%f15
	fstox	%f15,	%f10
	fxtos	%f10,	%f2
	fpsub16s	%f14,	%f25,	%f21
	fpadd16s	%f27,	%f23,	%f13
	fmovd	%f20,	%f8
	rd	%softint,	%g4
	movuge	%fcc1,	0x72C,	%i1
	fmovsle	%fcc2,	%f30,	%f16
	movg	%fcc0,	0x3D9,	%o0
	fabss	%f22,	%f23
	movug	%fcc1,	%g6,	%l0
	tneg	%xcc,	0x7
	fabss	%f7,	%f5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsgu	%xcc,	%f24,	%f1
	bcc,a	%icc,	loop_460
	call	loop_461
	fnot2s	%f26,	%f26
	call	loop_462
loop_460:
	brz,a	%g7,	loop_463
loop_461:
	wr	%i7,	%o7,	%clear_softint
	fmovsue	%fcc1,	%f9,	%f23
loop_462:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_463:
	call	loop_464
	fpack32	%f4,	%f28,	%f24
	nop
	fitod	%f11,	%f4
	movug	%fcc2,	0x1A9,	%o6
loop_464:
	fcmpeq16	%f2,	%f0,	%o5
	tcc	%icc,	0x6
	fpackfix	%f2,	%f26
	call	loop_465
	fmovdcs	%icc,	%f16,	%f24
	call	loop_466
	movre	%l6,	0x2F2,	%g5
loop_465:
	flushw
	movn	%fcc2,	%l4,	%l3
loop_466:
	sra	%l5,	0x04,	%o1
	call	loop_467
	call	loop_468
	fandnot2	%f22,	%f6,	%f6
	edge16l	%o2,	%i6,	%l1
loop_467:
	rdhpr	%hintp,	%i5
loop_468:
	call	loop_469
	call	loop_470
	fmovse	%fcc0,	%f7,	%f18
	fmovslg	%fcc3,	%f5,	%f27
loop_469:
	ldstub	[%l7 + 0x46],	%i4
loop_470:
	fpack16	%f14,	%f13
	nop
	setx	0xB2B74445A5559182,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f18
	rdpr	%tba,	%g1
	wr	%g2,	0x05DA,	%ccr
	rdpr	%tba,	%g3
	call	loop_471
	call	loop_472
	call	loop_473
	wr	%i3,	%i0,	%y
loop_471:
	call	loop_474
loop_472:
	fmovscc	%icc,	%f9,	%f26
loop_473:
	fbule,pt	%fcc3,	loop_475
	movu	%fcc3,	%o4,	%i2
loop_474:
	bshuffle	%f10,	%f10,	%f14
	nop
	setx	0x6D4B471143855516,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x089502E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f24,	%f20
loop_475:
	call	loop_476
	fpackfix	%f20,	%f3
	movrlz	%l2,	0x04F,	%i1
	call	loop_477
loop_476:
	subcc	%o0,	%g6,	%l0
	fcmpne16	%f10,	%f10,	%g4
	call	loop_478
loop_477:
	movule	%fcc0,	%i7,	%o7
	call	loop_479
	andncc	%g7,	0x1CA5,	%o3
loop_478:
	call	loop_480
	movlg	%fcc3,	%o5,	%o6
loop_479:
	nop
	fitos	%f24,	%f9
	call	loop_481
loop_480:
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f18
	fxtos	%f18,	%f24
	nop
	set	0x28, %i5
	stx	%g5,	[%l7 + %i5]
	fmovrdgez	%l6,	%f26,	%f28
loop_481:
	call	loop_482
	call	loop_483
	bge	%icc,	loop_484
	fnot2	%f0,	%f14
loop_482:
	call	loop_485
loop_483:
	st	%fsr,	[%l7 + 0x5C]
loop_484:
	ba,a	%icc,	loop_486
	movue	%fcc0,	%l3,	%l5
loop_485:
	nop
	set	0x7A, %g6
	sth	%l4,	[%l7 + %g6]
	tgu	%xcc,	0x7
loop_486:
	fbul,a,pt	%fcc1,	loop_487
	fmovscs	%xcc,	%f3,	%f20
	udiv	%o2,	0x00,	%o1
	call	loop_488
loop_487:
	rd	%sys_tick_cmpr,	%i6
	tle	%xcc,	0x6
	smul	%i5,	0x05D8,	%l1
loop_488:
	taddcctv	%g1,	%i4,	%g2
	fmovrdlz	%g3,	%f22,	%f2
	fmovda	%fcc3,	%f10,	%f2
	move	%xcc,	0x0B4,	%i0
	call	loop_489
	call	loop_490
	wr	%i3,	0x1F43,	%clear_softint
	ldub	[%l7 + 0x74],	%i2
loop_489:
	call	loop_491
loop_490:
	fmovdo	%fcc3,	%f14,	%f18
	tcs	%xcc,	0x1
	mulx	%l2,	%i1,	%o4
loop_491:
	rdpr	%gl,	%g6
	movre	%l0,	0x194,	%g4
	tpos	%icc,	0x2
	array32	%i7,	%o0,	%g7
	fexpand	%f24,	%f12
	set	0x13, %o2
	stba	%o7,	[%l7 + %o2] 0xe2
	membar	#Sync
	bge,a,pt	%xcc,	loop_492
	edge8n	%o5,	%o3,	%o6
	fpsub16s	%f28,	%f6,	%f9
	array8	%l6,	%l3,	%l5
loop_492:
	wr	%g5,	0x1641,	%set_softint

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x616, 	%hsys_tick_cmpr
	call	loop_493
	call	loop_494
	umul	%i6,	0x1C51,	%o2
	bshuffle	%f12,	%f12,	%f18
loop_493:
	movneg	%icc,	%i5,	%g1
loop_494:
	smul	%i4,	%l1,	%g2
	fsrc1s	%f11,	%f7
	ta	%icc,	0x2
	fmovdul	%fcc1,	%f20,	%f16
	fbl	%fcc0,	loop_495
	call	loop_496
	taddcc	%i0,	%i3,	%i2
	fmovsneg	%icc,	%f25,	%f22
loop_495:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_496:
	std	%f10,	[%l7 + 0x50]
	call	loop_497
	sdivx	%g3,	%l2,	%i1
	call	loop_498
	fmuld8sux16	%f22,	%f9,	%f18
loop_497:
	array8	%o4,	%g6,	%g4
	call	loop_499
loop_498:
	movuge	%fcc2,	%i7,	%o0
	tn	%xcc,	0x0
	fpsub32s	%f30,	%f14,	%f22
loop_499:
	call	loop_500
	fpsub32s	%f25,	%f19,	%f26
	fbue,a,pt	%fcc3,	loop_501
	movrgez	%l0,	%o7,	%o5
loop_500:
	fmovsue	%fcc3,	%f19,	%f8
	fmuld8ulx16	%f1,	%f14,	%f6
loop_501:
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%o3
	bne	%xcc,	loop_502
	call	loop_503
	array8	%o6,	%g7,	%l6
	addc	%l3,	0x105D,	%l5
loop_502:
	andncc	%l4,	0x1158,	%o1
loop_503:
	fmovsvc	%xcc,	%f27,	%f18
	udivx	%g5,	%i6,	%o2
	call	loop_504
	fnands	%f23,	%f10,	%f17
	nop
	setx	0xEA39E884F9EB0447,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f0
	fcmpne16	%f20,	%f26,	%g1
loop_504:
	call	loop_505
	fpsub16	%f30,	%f14,	%f16
	bvs,pn	%icc,	loop_506
	movgu	%xcc,	%i5,	%l1
loop_505:
	call	loop_507
	edge32n	%g2,	%i4,	%i3
loop_506:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_508
loop_507:
	te	%icc,	0x2
	call	loop_509
	fmovsa	%xcc,	%f3,	%f19
loop_508:
	bgu,a	%xcc,	loop_510
	fand	%f18,	%f26,	%f18
loop_509:
	call	loop_511
	fmovsleu	%icc,	%f24,	%f29
loop_510:
	call	loop_512
	fmovs	%f11,	%f27
loop_511:
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f26
	movvc	%xcc,	%g3,	%l2
loop_512:
	fblg,pt	%fcc1,	loop_513
	fmovslg	%fcc1,	%f9,	%f21
	edge8l	%i0,	%o4,	%i1
	sllx	%g4,	0x0E,	%g6
loop_513:
	udiv	%o0,	0x00,	%i7
	fexpand	%f28,	%f26
	bne	%xcc,	loop_514
	tle	%icc,	0x0
	call	loop_515
	movn	%fcc1,	%l0,	%o5
loop_514:
	call	loop_516
	fmovrde	%o3,	%f2,	%f12
loop_515:
	call	loop_517
	nop
	setx	0xE21BCC16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f18
loop_516:
	fpsub32s	%f30,	%f10,	%f25
	call	loop_518
loop_517:
	call	loop_519
	call	loop_520
	fmovrdlz	%o7,	%f10,	%f6
loop_518:
	movvc	%icc,	%o6,	%l6
loop_519:
	bshuffle	%f10,	%f0,	%f12
loop_520:
	call	loop_521
	edge16	%l3,	%l5,	%l4
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_522
loop_521:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsgu	%icc,	%f12,	%f29
	call	loop_523
loop_522:
	ta	%xcc,	0x7
	call	loop_524
	call	loop_525
loop_523:
	stw	%o1,	[%l7 + 0x60]
	fmuld8sux16	%f29,	%f3,	%f20
loop_524:
	edge32ln	%g7,	%i6,	%o2
loop_525:
	call	loop_526
	fmovrsgez	%g1,	%f26,	%f1
	fmovdul	%fcc2,	%f8,	%f8
	fmovrsne	%i5,	%f21,	%f21
loop_526:
	fandnot1	%f12,	%f28,	%f12
	movg	%icc,	%g5,	%l1
	fcmpes	%fcc2,	%f7,	%f31
	tl	%icc,	0x4
	fmovsue	%fcc1,	%f28,	%f4
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%g2
	fcmple32	%f28,	%f0,	%i3
	call	loop_527
	movleu	%icc,	0x0FB,	%i2
	fcmple32	%f26,	%f24,	%i4
	fmovsul	%fcc1,	%f2,	%f0
loop_527:
	fcmpes	%fcc1,	%f29,	%f25
	umul	%l2,	%i0,	%g3
	te	%xcc,	0x0
	tsubcc	%i1,	%o4,	%g4
	movrlz	%g6,	%o0,	%i7
	tcs	%xcc,	0x5
	fxnor	%f28,	%f16,	%f28
	subccc	%o5,	%l0,	%o3
	fpack16	%f26,	%f13
	fmovsne	%xcc,	%f1,	%f19
	call	loop_528
	movleu	%icc,	0x5A7,	%o7
	call	loop_529
	fpsub16	%f16,	%f4,	%f0
loop_528:
	xnor	%l6,	%o6,	%l5
	bvc,a,pt	%icc,	loop_530
loop_529:
	fabss	%f20,	%f22
	fcmpes	%fcc0,	%f29,	%f20
	fcmpeq32	%f10,	%f8,	%l4
loop_530:
	orncc	%l3,	0x151D,	%o1
	fmovrslez	%i6,	%f30,	%f24
	fpsub32s	%f1,	%f1,	%f17
	fmovsne	%xcc,	%f17,	%f10
	fmovso	%fcc0,	%f19,	%f6
	call	loop_531
	call	loop_532
	move	%fcc3,	0x5E8,	%o2
	fmovrse	%g1,	%f16,	%f21
loop_531:
	call	loop_533
loop_532:
	movuge	%fcc2,	%g7,	%i5
	tl	%xcc,	0x6
	fone	%f2
loop_533:
	fmovdl	%xcc,	%f6,	%f10
	fnor	%f22,	%f24,	%f14
	call	loop_534
	fornot1s	%f8,	%f13,	%f31
	fmovslg	%fcc2,	%f7,	%f19
	or	%g5,	0x10B4,	%g2
loop_534:
	fexpand	%f2,	%f22
	fpadd16	%f16,	%f16,	%f10
	ba	%xcc,	loop_535
	fmovdcc	%xcc,	%f22,	%f22
	call	loop_536
	call	loop_537
loop_535:
	call	loop_538
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_536:
	call	loop_539
loop_537:
	rdhpr	%ver,	%i3
loop_538:
	subcc	%i2,	0x12F3,	%i4
	smul	%l1,	0x1278,	%l2
loop_539:
	call	loop_540
	movuge	%fcc1,	%g3,	%i1
	fmovrdlez	%o4,	%f28,	%f8
	fbg,a	%fcc2,	loop_541
loop_540:
	call	loop_542
	call	loop_543
	srl	%i0,	0x00,	%g6
loop_541:
	fand	%f18,	%f24,	%f16
loop_542:
	call	loop_544
loop_543:
	call	loop_545
	fmovdneg	%icc,	%f2,	%f8
	fxnors	%f25,	%f15,	%f4
loop_544:
	call	loop_546
loop_545:
	call	loop_547
	edge16l	%o0,	%g4,	%o5
	sll	%l0,	0x05,	%i7
loop_546:
	taddcctv	%o7,	0x19DA,	%l6
loop_547:
	wr	%o6,	%l5,	%y
	sllx	%l4,	0x19,	%l3
	call	loop_548
	call	loop_549
	rdpr	%cwp,	%o3
	call	loop_550
loop_548:
	edge16n	%i6,	%o2,	%g1
loop_549:
	call	loop_551
	call	loop_552
loop_550:
	fmovdug	%fcc0,	%f18,	%f8
	fmovsge	%icc,	%f1,	%f5
loop_551:
	fmul8sux16	%f24,	%f16,	%f10
loop_552:
	rdpr	%cleanwin,	%o1
	call	loop_553
	call	loop_554
	call	loop_555
	fmovsg	%xcc,	%f14,	%f2
loop_553:
	fmovdn	%xcc,	%f12,	%f8
loop_554:
	rd	%pc,	%g7
loop_555:
	srax	%g5,	%g2,	%i3
	mulx	%i5,	%i4,	%i2
	fblg,pn	%fcc0,	loop_556
	tn	%xcc,	0x2
	rdpr	%cwp,	%l1
	fmovrde	%l2,	%f10,	%f2
loop_556:
	call	loop_557
	fmovsgu	%xcc,	%f1,	%f3
	edge8l	%g3,	%i1,	%o4
	brnz,a	%g6,	loop_558
loop_557:
	bneg,a,pt	%icc,	loop_559
	call	loop_560
	bvc,a,pn	%icc,	loop_561
loop_558:
	andn	%i0,	0x1173,	%o0
loop_559:
	rdpr	%canrestore,	%o5
loop_560:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_561:
	nop
	setx	0x7F1AF42F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xC69882E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f20,	%f25
	for	%f8,	%f2,	%f28
	call	loop_562
	bl,a	%xcc,	loop_563
	popc	%g4,	%l0
	tleu	%xcc,	0x6
loop_562:
	edge16	%i7,	%o7,	%l6
loop_563:
	tpos	%xcc,	0x7
	fxnor	%f6,	%f16,	%f12
	fpack16	%f30,	%f29
	edge8ln	%o6,	%l4,	%l3
	nop
	setx	0x92302B3D63DCB8A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8F10F8BA5104C197,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f0,	%f10
	fmovdgu	%xcc,	%f22,	%f24
	brlz,a,pt	%o3,	loop_564
	xorcc	%l5,	%i6,	%o2
	fmovsle	%fcc3,	%f3,	%f16
	fexpand	%f8,	%f12
loop_564:
	fmuld8ulx16	%f13,	%f10,	%f18
	fmovrdlez	%g1,	%f4,	%f18
	move	%fcc2,	0x2F7,	%o1
	call	loop_565
	fnands	%f24,	%f27,	%f2
	add	%g5,	%g2,	%i3
	movpos	%icc,	0x117,	%g7
loop_565:
	fandnot1	%f24,	%f2,	%f30
	edge8l	%i4,	%i5,	%l1
	fmovdue	%fcc0,	%f8,	%f14
	brlz,pt	%i2,	loop_566
	movlg	%fcc0,	0x1FD,	%g3
	call	loop_567
	sethi	0x053C,	%i1
loop_566:
	call	loop_568
	subccc	%o4,	%g6,	%i0
loop_567:
	call	loop_569
	nop
	setx	0x19A20B8945C1458B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9A10C102F439636A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f0,	%f30
loop_568:
	call	loop_570
	call	loop_571
loop_569:
	call	loop_572
	call	loop_573
loop_570:
	fmovrdgez	%o0,	%f0,	%f26
loop_571:
	call	loop_574
loop_572:
	srl	%o5,	0x1D,	%l2
loop_573:
	rd	%ccr,	%l0
	bl	%xcc,	loop_575
loop_574:
	fsrc2	%f28,	%f6
	call	loop_576
	xnorcc	%g4,	%o7,	%i7
loop_575:
	nop
	fitod	%f0,	%f30
	fdtos	%f30,	%f18
	fmul8ulx16	%f2,	%f30,	%f10
loop_576:
	call	loop_577
	pdist	%f18,	%f18,	%f4
	call	loop_578
	fcmpd	%fcc3,	%f20,	%f24
loop_577:
	movneg	%icc,	0x427,	%o6
	call	loop_579
loop_578:
	fmovdlg	%fcc1,	%f20,	%f14
	fornot2	%f30,	%f22,	%f12
	call	loop_580
loop_579:
	call	loop_581
	edge8n	%l4,	%l6,	%o3
	tpos	%icc,	0x7
loop_580:
	sra	%l5,	0x17,	%i6
loop_581:
	fmovrslz	%l3,	%f16,	%f28
	call	loop_582
	fmovrslez	%g1,	%f0,	%f23
	call	loop_583
	fmovrse	%o2,	%f29,	%f31
loop_582:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fnot2	%f24,	%f0
loop_583:
	call	loop_584
	movule	%fcc1,	%o1,	%g5
	sra	%i3,	%g2,	%i4
	call	loop_585
loop_584:
	call	loop_586
	fxnors	%f6,	%f31,	%f6
	rdhpr	%hsys_tick_cmpr,	%g7
loop_585:
	fmovdneg	%xcc,	%f28,	%f10
loop_586:
	call	loop_587
	sdiv	%i5,	0x00,	%i2
	fmovda	%fcc2,	%f6,	%f14
	popc	0x0B14,	%l1
loop_587:
	fnegs	%f19,	%f1
	fmovsa	%fcc0,	%f31,	%f5
	fnegs	%f16,	%f14
	call	loop_588
	movvs	%icc,	%g3,	%o4
	fcmpgt16	%f26,	%f2,	%i1
	fbue	%fcc0,	loop_589
loop_588:
	call	loop_590
	sir	0x0EBE
	nop
	setx	0x0B822A3F61490AAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x2EB74133117A69C3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f0,	%f22
loop_589:
	call	loop_591
loop_590:
	call	loop_592
	sdivx	%g6,	%i0,	%o0
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%l2
loop_591:
	fpack16	%f0,	%f25
loop_592:
	fmovsne	%icc,	%f11,	%f7
	call	loop_593
	umul	%o5,	%g4,	%o7
	call	loop_594
	call	loop_595
loop_593:
	fpadd32	%f2,	%f18,	%f26
	call	loop_596
loop_594:
	fcmpne16	%f30,	%f10,	%l0
loop_595:
	edge32	%i7,	%o6,	%l4
	fpadd32	%f10,	%f2,	%f6
loop_596:
	movrgez	%l6,	%l5,	%o3
	call	loop_597
	call	loop_598
	call	loop_599
	edge8l	%l3,	%g1,	%i6
loop_597:
	call	loop_600
loop_598:
	movpos	%icc,	0x73F,	%o2
loop_599:
	brgz,a,pt	%g5,	loop_601
	fnegs	%f18,	%f17
loop_600:
	call	loop_602
	nop
	setx	0x230024BDCBD07C0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f16
loop_601:
	nop
	fitos	%f13,	%f14
	fstod	%f14,	%f10
	movn	%fcc3,	%o1,	%g2
loop_602:
	bne,a	%icc,	loop_603
	fpsub16s	%f21,	%f16,	%f28
	nop
	setx	0xB56E673B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xE93539B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f25,	%f5
	xnorcc	%i4,	%i3,	%g7
loop_603:
	call	loop_604
	call	loop_605
	sir	0x0F34
	nop
	fitos	%f0,	%f6
	fstoi	%f6,	%f12
loop_604:
	tleu	%icc,	0x4
loop_605:
	call	loop_606
	xor	%i2,	%l1,	%i5
	siam	0x7
	call	loop_607
loop_606:
	fmovdn	%fcc3,	%f30,	%f28
	fmovdpos	%xcc,	%f14,	%f10
	tgu	%xcc,	0x4
loop_607:
	fmovsgu	%icc,	%f3,	%f23
	call	loop_608
	rd	%sys_tick_cmpr,	%g3
	call	loop_609
	call	loop_610
loop_608:
	rdhpr	%hsys_tick_cmpr,	%o4
	call	loop_611
loop_609:
	tleu	%icc,	0x1
loop_610:
	fpack32	%f16,	%f0,	%f6
	call	loop_612
loop_611:
	call	loop_613
	sethi	0x0C5B,	%i1
	sll	%g6,	0x05,	%i0
loop_612:
	fexpand	%f14,	%f2
loop_613:
	rd	%y,	%o0
	udiv	%l2,	%g4,	%o5
	fsrc2s	%f7,	%f22
	xor	%o7,	0x111D,	%i7
	fmovsneg	%xcc,	%f21,	%f14
	call	loop_614
	call	loop_615
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f12
	fmovsu	%fcc1,	%f27,	%f0
loop_614:
	taddcc	%o6,	%l0,	%l4
loop_615:
	array16	%l6,	%l5,	%o3
	call	loop_616
	fmovdvc	%xcc,	%f18,	%f22
	sll	%g1,	%l3,	%o2
	fpsub16s	%f31,	%f19,	%f11
loop_616:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 12
!	Type a   	: 26
!	Type cti   	: 157
!	Type x   	: 2
!	Type f   	: 161
!	Type i   	: 142
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
	set	0xF,	%g1
	set	0x3,	%g2
	set	0x7,	%g3
	set	0x6,	%g4
	set	0xE,	%g5
	set	0xE,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x9,	%i1
	set	-0x7,	%i2
	set	-0x3,	%i3
	set	-0x3,	%i4
	set	-0xE,	%i5
	set	-0x6,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x1ADC1885,	%l0
	set	0x49FE3934,	%l1
	set	0x235AA76E,	%l2
	set	0x4511D423,	%l3
	set	0x5560640A,	%l4
	set	0x06010A6A,	%l5
	set	0x727EFB3A,	%l6
	!# Output registers
	set	0x1D44,	%o0
	set	-0x062F,	%o1
	set	-0x19C7,	%o2
	set	0x0DB4,	%o3
	set	0x09BF,	%o4
	set	-0x189B,	%o5
	set	0x04C5,	%o6
	set	0x1E98,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	call	loop_617
	fmovd	%f26,	%f14
	xnorcc	%i6,	0x15FB,	%o1
	call	loop_618
loop_617:
	movul	%fcc1,	%g2,	%i4
	call	loop_619
	array16	%i3,	%g7,	%g5
loop_618:
	fcmpgt16	%f10,	%f26,	%i2
	fmovrsgez	%i5,	%f14,	%f13
loop_619:
	call	loop_620
	tcc	%icc,	0x1
	udiv	%g3,	%l1,	%i1
	tgu	%icc,	0x7
loop_620:
	call	loop_621
	fmovrdgez	%o4,	%f4,	%f24
	movo	%fcc2,	%i0,	%o0
	movu	%fcc2,	%l2,	%g4
loop_621:
	fmovdue	%fcc0,	%f0,	%f0
	taddcc	%g6,	%o5,	%o7
	edge8ln	%i7,	%l0,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l6,	%l4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbg,pt	%fcc0,	loop_622
	fmovdge	%fcc2,	%f2,	%f18
	pdist	%f2,	%f2,	%f28
	fandnot1	%f6,	%f6,	%f22
loop_622:
	movo	%fcc3,	%l5,	%o3
	call	loop_623
	orn	%g1,	%l3,	%o2
	call	loop_624
	wrpr	%i6,	%g2,	%tick
loop_623:
	fmovsa	%fcc1,	%f24,	%f29
	call	loop_625
loop_624:
	call	loop_626
	call	loop_627
	fcmpeq32	%f14,	%f12,	%o1
loop_625:
	array32	%i4,	%i3,	%g7
loop_626:
	call	loop_628
loop_627:
	fmovrsgz	%g5,	%f3,	%f7
	wr	%i5,	0x01CD,	%ccr
	udivcc	%g3,	0x00,	%i2
loop_628:
	fcmpgt16	%f20,	%f30,	%i1
	call	loop_629
	fnegs	%f26,	%f9
	call	loop_630
	call	loop_631
loop_629:
	wr 	%g0, 	0x7, 	%fprs
	udivx	%i0,	%o0,	%l1
loop_630:
	rd	%tick_cmpr,	%g4
loop_631:
	fandnot2s	%f22,	%f11,	%f14
	ldstub	[%l7 + 0x51],	%g6
	edge16ln	%l2,	%o7,	%o5
	bleu	%xcc,	loop_632
	wrpr 	%g0, 	0x0, 	%gl
	movle	%fcc0,	%o6,	%l6
	edge16ln	%l4,	%l5,	%g1
loop_632:
	movle	%xcc,	%o3,	%o2
	fmul8x16al	%f7,	%f0,	%f2
	fmovsvs	%icc,	%f1,	%f6
	call	loop_633
	fmovsl	%xcc,	%f15,	%f18
	popc	0x0967,	%i6
	movpos	%xcc,	0x039,	%l3
loop_633:
	call	loop_634
	fmul8x16au	%f16,	%f2,	%f2
	tvc	%xcc,	0x2
	call	loop_635
loop_634:
	call	loop_636
	fmovslg	%fcc1,	%f15,	%f27
	array16	%g2,	%o1,	%i4
loop_635:
	sll	%g7,	0x19,	%i3
loop_636:
	tne	%icc,	0x7
	movl	%xcc,	%g5,	%i5
	te	%icc,	0x6
	fone	%f6
	call	loop_637
	fmovrde	%g3,	%f8,	%f0
	edge8	%i1,	%i2,	%i0
	fbue,a,pn	%fcc2,	loop_638
loop_637:
	movrlez	%o4,	0x09C,	%o0
	tcc	%icc,	0x1
	edge16n	%g4,	%g6,	%l1
loop_638:
	rdhpr	%htba,	%l2
	wr	%o7,	0x0E38,	%set_softint
	fandnot2	%f2,	%f12,	%f2
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_639
	movue	%fcc3,	0x3EC,	%l0
	nop
	setx	0x85B8B7A49691F400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f12
	call	loop_640
loop_639:
	ldx	[%l7 + 0x08],	%i7
	fpack16	%f26,	%f1
	call	loop_641
loop_640:
	bmask	%o6,	%l4,	%l5
	fmovdule	%fcc3,	%f14,	%f12
	fbu,a,pn	%fcc3,	loop_642
loop_641:
	fcmpes	%fcc2,	%f5,	%f4
	movug	%fcc2,	%g1,	%o3
	fmovdu	%fcc1,	%f12,	%f22
loop_642:
	fmovsg	%icc,	%f15,	%f26
	taddcc	%o2,	0x0487,	%i6
	nop
	setx	0xCBB416A8BFF941C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC4C27FE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f14,	%f20
	bg,a,pn	%icc,	loop_643
	fmovsvc	%xcc,	%f23,	%f29
	fmovsgu	%icc,	%f4,	%f7
	call	loop_644
loop_643:
	call	loop_645
	tsubcc	%l6,	%l3,	%o1
	nop
	setx	0xE2CD3BA8E906248A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x63B8629D8BFB883B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f26,	%f12
loop_644:
	fmovdvc	%xcc,	%f4,	%f4
loop_645:
	fbul,pt	%fcc0,	loop_646
	lduh	[%l7 + 0x46],	%g2
	xnor	%i4,	%i3,	%g5
	tcs	%icc,	0x7
loop_646:
	xorcc	%i5,	%g3,	%i1
	edge16ln	%i2,	%i0,	%o4
	andn	%o0,	0x05DA,	%g7
	fmovrsgz	%g6,	%f26,	%f1
	call	loop_647
	fone	%f4
	rd	%ccr,	%l1
	fmovduge	%fcc2,	%f22,	%f6
loop_647:
	call	loop_648
	call	loop_649
	fabss	%f25,	%f30
	call	loop_650
loop_648:
	fmovrsne	%g4,	%f7,	%f17
loop_649:
	fmovsle	%fcc0,	%f30,	%f19
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%f14
loop_650:
	fmovsule	%fcc2,	%f21,	%f17
	call	loop_651
	srax	%l2,	0x0E,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i7
loop_651:
	fmovrdgez	%l0,	%f4,	%f0
	umulcc	%l4,	%l5,	%o6
	lduw	[%l7 + 0x4C],	%g1
	fcmpes	%fcc1,	%f28,	%f22
	add	%o3,	0x1BBA,	%i6
	fmovrdlz	%l6,	%f28,	%f12
	sdivx	%o2,	0x00,	%l3
	rdpr	%pil,	%o1
	tle	%xcc,	0x5
	rd	%pc,	%i4
	te	%icc,	0x3
	call	loop_652
	fmovsleu	%xcc,	%f25,	%f26
	fmovdcs	%icc,	%f4,	%f4
	call	loop_653
loop_652:
	fmovdleu	%icc,	%f30,	%f28
	fmovdn	%xcc,	%f14,	%f18
	tcs	%xcc,	0x2
loop_653:
	mulx	%g2,	0x19BA,	%i3
	fmovse	%icc,	%f3,	%f14
	call	loop_654
	sll	%i5,	0x04,	%g3
	udiv	%i1,	0x00,	%g5
	call	loop_655
loop_654:
	nop
	set	0x6E, %g3
	lduh	[%l7 + %g3],	%i0
	movu	%fcc1,	0x39C,	%o4
	umul	%i2,	%o0,	%g6
loop_655:
	smulcc	%l1,	0x077C,	%g7
	addccc	%l2,	%g4,	%o5
	call	loop_656
	movo	%fcc0,	%i7,	%l0
	fmovs	%f3,	%f29
	fzeros	%f3
loop_656:
	stx	%l4,	[%l7 + 0x08]
	fmovdn	%fcc1,	%f26,	%f2
	edge16l	%l5,	%o6,	%g1
	fmovsn	%fcc2,	%f9,	%f7
	fbne,pt	%fcc0,	loop_657
	alignaddr	%o3,	%o7,	%i6
	movcs	%icc,	%l6,	%l3
	fmuld8ulx16	%f10,	%f22,	%f22
loop_657:
	sllx	%o1,	0x01,	%o2
	movcs	%xcc,	0x151,	%g2
	fexpand	%f19,	%f6
	call	loop_658
	fmovsa	%fcc0,	%f7,	%f24
	nop
	fitos	%f22,	%f22
	mova	%fcc0,	0x300,	%i4
loop_658:
	call	loop_659
	wr	%i3,	0x0744,	%sys_tick
	ldd	[%l7 + 0x48],	%f24
	movgu	%xcc,	%i5,	%i1
loop_659:
	fmovso	%fcc2,	%f5,	%f30
	wr	%g0,	0x04,	%asi
	sta	%f1,	[%l7 + 0x70] %asi
	orncc	%g3,	%i0,	%g5
	call	loop_660
	taddcctv	%i2,	0x0BCA,	%o4
	call	loop_661
	tcc	%icc,	0x6
loop_660:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlz	%l1,	%f22,	%f6
loop_661:
	wr	%l2,	%g7,	%sys_tick
	fcmps	%fcc3,	%f14,	%f19
	fnegs	%f18,	%f5
	fcmpgt16	%f2,	%f20,	%g4
	call	loop_662
	fmuld8ulx16	%f4,	%f15,	%f28
	call	loop_663
	call	loop_664
loop_662:
	fpadd32s	%f1,	%f18,	%f15
	fbne	%fcc2,	loop_665
loop_663:
	fones	%f19
loop_664:
	fpmerge	%f13,	%f3,	%f14
	call	loop_666
loop_665:
	nop
	fitos	%f11,	%f25
	fstod	%f25,	%f4
	fmovspos	%xcc,	%f26,	%f28
	call	loop_667
loop_666:
	fpack16	%f10,	%f14
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x0c,	%f0
loop_667:
	call	loop_668
	subc	%o5,	0x1D09,	%l0
	call	loop_669
	fmovslg	%fcc2,	%f31,	%f21
loop_668:
	fmovsul	%fcc3,	%f29,	%f27
	call	loop_670
loop_669:
	call	loop_671
	movrlz	%l4,	%l5,	%o6
	call	loop_672
loop_670:
	bleu,a,pn	%icc,	loop_673
loop_671:
	call	loop_674
	fzeros	%f12
loop_672:
	fmovsug	%fcc1,	%f17,	%f7
loop_673:
	ble,a	%icc,	loop_675
loop_674:
	edge8n	%i7,	%o3,	%g1
	stx	%o7,	[%l7 + 0x50]
	srlx	%i6,	%l6,	%o1
loop_675:
	fmuld8ulx16	%f22,	%f8,	%f0
	wr 	%g0, 	0x7, 	%fprs
	taddcc	%g2,	0x1C32,	%i4
	set	0x20, %l3
	stda	%i4,	[%l7 + %l3] 0x11
	fsrc1s	%f28,	%f8
	tpos	%xcc,	0x2
	call	loop_676
	call	loop_677
	fmul8x16au	%f7,	%f11,	%f6
	umulcc	%i1,	0x1D8B,	%g3
loop_676:
	fmovsule	%fcc0,	%f9,	%f12
loop_677:
	nop
	setx	0x14A4A04865DF6069,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f26
	edge8n	%i3,	%g5,	%i2
	movgu	%xcc,	%o4,	%i0
	rdhpr	%hsys_tick_cmpr,	%o0
	fones	%f25
	udivx	%g6,	0x00,	%l1
	movcs	%icc,	0x3A1,	%l2
	fands	%f24,	%f10,	%f22
	call	loop_678
	movrgz	%g4,	0x384,	%g7
	rdhpr	%hintp,	%o5
	tne	%icc,	0x2
loop_678:
	tle	%xcc,	0x1
	fabss	%f8,	%f3
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f30
	ldsb	[%l7 + 0x39],	%l0
	edge32n	%l5,	%o6,	%l4
	movg	%fcc2,	%i7,	%o3
	call	loop_679
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f22
	nop
	set	0x10, %l5
	ldsh	[%l7 + %l5],	%g1
	call	loop_680
loop_679:
	call	loop_681
	call	loop_682
	fmovsl	%fcc3,	%f29,	%f2
loop_680:
	call	loop_683
loop_681:
	fmovslg	%fcc2,	%f31,	%f10
loop_682:
	call	loop_684
	fornot2	%f20,	%f18,	%f28
loop_683:
	fmovdvc	%xcc,	%f22,	%f12
	fpack32	%f10,	%f0,	%f26
loop_684:
	fpadd16	%f2,	%f30,	%f8
	tleu	%xcc,	0x1
	call	loop_685
	movuge	%fcc1,	%o7,	%l6
	movuge	%fcc3,	%i6,	%o1
	fnot2s	%f14,	%f1
loop_685:
	call	loop_686
	call	loop_687
	nop
	fitod	%f18,	%f18
	tl	%xcc,	0x6
loop_686:
	umulcc	%o2,	%l3,	%i4
loop_687:
	orncc	%g2,	0x0383,	%i1
	fmovda	%icc,	%f26,	%f28
	wr	%g3,	%i3,	%pic
	alignaddr	%g5,	%i5,	%i2
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f6
	fornot2s	%f21,	%f28,	%f19
	call	loop_688
	call	loop_689
	sllx	%o4,	0x1C,	%i0
	subc	%g6,	0x11FB,	%l1
loop_688:
	sub	%l2,	%g4,	%o0
loop_689:
	fmovsule	%fcc2,	%f17,	%f26
	call	loop_690
	fcmpeq16	%f8,	%f16,	%o5
	wr	%l0,	%l5,	%pic
	wrpr	%g7,	0x1495,	%cwp
loop_690:
	nop
	fitos	%f6,	%f0
	fstoi	%f0,	%f29
	fnors	%f11,	%f15,	%f20
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%o6
	movrne	%i7,	0x1E3,	%o3
	fmovd	%f16,	%f30
	call	loop_691
	movgu	%xcc,	0x4EE,	%g1
	fornot1	%f16,	%f28,	%f26
	fmovsleu	%xcc,	%f25,	%f11
loop_691:
	movuge	%fcc3,	0x6C8,	%l4
	andcc	%o7,	%i6,	%o1
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	subccc	%o2,	%l6,	%i4
	fmovdleu	%icc,	%f4,	%f14
	movrne	%g2,	0x1FF,	%l3
	move	%icc,	%g3,	%i3
	sdiv	%g5,	%i1,	%i2
	movn	%icc,	0x2BB,	%o4
	call	loop_692
	call	loop_693
	call	loop_694
	fbge,a	%fcc0,	loop_695
loop_692:
	call	loop_696
loop_693:
	fba,pn	%fcc2,	loop_697
loop_694:
	fmovdo	%fcc1,	%f30,	%f26
loop_695:
	st	%f8,	[%l7 + 0x10]
loop_696:
	te	%xcc,	0x3
loop_697:
	call	loop_698
	fmovsle	%icc,	%f4,	%f16
	fmovdne	%icc,	%f16,	%f22
	edge32n	%i5,	%g6,	%l1
loop_698:
	call	loop_699
	fmovsvc	%icc,	%f10,	%f27
	fexpand	%f28,	%f8
	sdiv	%i0,	0x00,	%l2
loop_699:
	call	loop_700
	call	loop_701
	edge8n	%o0,	%o5,	%g4
	fmovsg	%xcc,	%f20,	%f23
loop_700:
	fcmpes	%fcc3,	%f12,	%f28
loop_701:
	call	loop_702
	nop
	set	0x20, %o7
	std	%f8,	[%l7 + %o7]
	udiv	%l5,	0x00,	%g7
	wr	%g0,	0x18,	%asi
	stda	%l0,	[%l7 + 0x08] %asi
loop_702:
	wrpr	%o6,	%i7,	%pil
	call	loop_703
	call	loop_704
	fandnot1s	%f3,	%f1,	%f27
	fmovdpos	%icc,	%f10,	%f4
loop_703:
	fbo,a,pn	%fcc3,	loop_705
loop_704:
	call	loop_706
	tle	%xcc,	0x6
	call	loop_707
loop_705:
	fmovse	%fcc0,	%f25,	%f19
loop_706:
	fmovdue	%fcc0,	%f26,	%f12
	movcc	%xcc,	0x20E,	%g1
loop_707:
	fornot1s	%f19,	%f5,	%f30
	call	loop_708
	fpadd32	%f20,	%f6,	%f2
	fmovdvc	%icc,	%f10,	%f30
	tn	%icc,	0x7
loop_708:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l4
	flush	%l7 + 0x10
	fmul8x16au	%f23,	%f25,	%f28
	fnand	%f6,	%f30,	%f4
	fmovsue	%fcc3,	%f10,	%f3
	call	loop_709
	call	loop_710
	call	loop_711
	fmovdvc	%icc,	%f4,	%f26
loop_709:
	call	loop_712
loop_710:
	call	loop_713
loop_711:
	bge,a,pt	%xcc,	loop_714
	call	loop_715
loop_712:
	call	loop_716
loop_713:
	call	loop_717
loop_714:
	call	loop_718
loop_715:
	rdpr	%otherwin,	%o3
loop_716:
	call	loop_719
loop_717:
	nop
	fitos	%f11,	%f26
loop_718:
	fmovrdlz	%i6,	%f18,	%f2
	fsrc1s	%f8,	%f19
loop_719:
	movuge	%fcc2,	0x42B,	%o7
	edge16	%o1,	%l6,	%o2
	fmovrdgz	%g2,	%f2,	%f28
	fsrc1	%f16,	%f30
	call	loop_720
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 0
	fnot1s	%f8,	%f10
	fmovda	%icc,	%f22,	%f14
loop_720:
	call	loop_721
	fmovdl	%xcc,	%f12,	%f10
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x28] %asi,	%f11
loop_721:
	call	loop_722
	sra	%i4,	%g3,	%i3
	movlg	%fcc1,	0x67B,	%g5
	bmask	%l3,	%i2,	%i1
loop_722:
	ldsb	[%l7 + 0x1F],	%i5
	call	loop_723
	movre	%g6,	0x1E7,	%l1
	fmovrdgez	%i0,	%f16,	%f18
	fcmpd	%fcc0,	%f2,	%f16
loop_723:
	fmovde	%xcc,	%f26,	%f6
	call	loop_724
	fornot2s	%f25,	%f14,	%f30
	call	loop_725
	call	loop_726
loop_724:
	call	loop_727
	call	loop_728
loop_725:
	fmovdule	%fcc0,	%f26,	%f8
loop_726:
	sdiv	%o4,	0x00,	%l2
loop_727:
	fmovse	%fcc0,	%f2,	%f28
loop_728:
	call	loop_729
	movo	%fcc2,	%o5,	%o0
	call	loop_730
	fpadd16	%f4,	%f4,	%f18
loop_729:
	udivcc	%l5,	0x00,	%g7
	call	loop_731
loop_730:
	ld	[%l7 + 0x68],	%f29
	fmovscs	%xcc,	%f14,	%f31
	fmovse	%xcc,	%f27,	%f20
loop_731:
	bneg	%icc,	loop_732
	ta	%xcc,	0x1
	movn	%xcc,	0x57E,	%g4
	fmovda	%fcc0,	%f12,	%f22
loop_732:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_733
	xnorcc	%i7,	%g1,	%l4
	ta	%icc,	0x4
	fmovrdlz	%i6,	%f4,	%f16
loop_733:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_734
	call	loop_735
	rdhpr	%hintp,	%o3
	xorcc	%o1,	0x14DF,	%l6
loop_734:
	fmovrdgez	%o7,	%f20,	%f24
loop_735:
	call	loop_736
	edge32ln	%o2,	%i4,	%g3
	fxnors	%f22,	%f19,	%f18
	fmovrsgz	%i3,	%f20,	%f6
loop_736:
	movule	%fcc3,	0x294,	%g5
	fbue,pn	%fcc0,	loop_737
	fmovrdgz	%l3,	%f26,	%f4
	call	loop_738
	call	loop_739
loop_737:
	call	loop_740
	fmovso	%fcc0,	%f24,	%f26
loop_738:
	subccc	%g2,	0x0783,	%i1
loop_739:
	bshuffle	%f6,	%f6,	%f0
loop_740:
	fmovd	%f12,	%f22
	call	loop_741
	fones	%f31
	fmovdneg	%icc,	%f8,	%f4
	subcc	%i2,	0x0728,	%g6
loop_741:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f19
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movgu	%icc,	0x196,	%l1
	tvs	%xcc,	0x2
	fandnot2s	%f25,	%f22,	%f15
	nop
	setx	0xD2509B7DCE7D64C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	call	loop_742
	addccc	%i5,	0x0610,	%i0
	be,pn	%xcc,	loop_743
	brlz,a,pt	%l2,	loop_744
loop_742:
	siam	0x6
	call	loop_745
loop_743:
	edge32l	%o4,	%o0,	%l5
loop_744:
	fzeros	%f27
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_745:
	bvs,a,pt	%icc,	loop_746
	fmovda	%icc,	%f18,	%f14
	call	loop_747
	tgu	%xcc,	0x6
loop_746:
	call	loop_748
	edge16l	%g7,	%o5,	%g4
loop_747:
	call	loop_749
	for	%f2,	%f24,	%f28
loop_748:
	call	loop_750
	ba	%icc,	loop_751
loop_749:
	fmovsul	%fcc3,	%f5,	%f9
	edge32l	%l0,	%o6,	%g1
loop_750:
	call	loop_752
loop_751:
	subcc	%i7,	%i6,	%o3
	fmovdl	%fcc1,	%f8,	%f28
	nop
	setx	0x8C7EB5F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
loop_752:
	alignaddrl	%o1,	%l4,	%o7
	fnot2	%f10,	%f4
	fmovsa	%fcc2,	%f13,	%f6
	movcs	%icc,	0x468,	%l6
	call	loop_753
loop_753:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 32
!	Type a   	: 24
!	Type x   	: 11
!	Type cti   	: 137
!	Type f   	: 155
!	Type i   	: 141
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
	set	0x3,	%g2
	set	0x4,	%g3
	set	0xE,	%g4
	set	0x2,	%g5
	set	0x6,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x5,	%i1
	set	-0xD,	%i2
	set	-0x2,	%i3
	set	-0x7,	%i4
	set	-0x7,	%i5
	set	-0xC,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x761626A6,	%l0
	set	0x3C4EF730,	%l1
	set	0x41D81AB2,	%l2
	set	0x4D2F7342,	%l3
	set	0x38B4F91C,	%l4
	set	0x24C9285E,	%l5
	set	0x390D0320,	%l6
	!# Output registers
	set	-0x1C8B,	%o0
	set	0x07F6,	%o1
	set	-0x0B5D,	%o2
	set	-0x1F7D,	%o3
	set	0x1CEC,	%o4
	set	-0x07C4,	%o5
	set	0x1DA9,	%o6
	set	0x1187,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	call	loop_754
	fors	%f2,	%f6,	%f24
	subc	%i4,	0x0CE4,	%g3
	fcmpd	%fcc1,	%f4,	%f30
loop_754:
	be	%xcc,	loop_755
	fxors	%f8,	%f24,	%f4
	call	loop_756
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%o2
loop_755:
	wr	%i3,	%l3,	%softint
	call	loop_757
loop_756:
	call	loop_758
	call	loop_759
	srlx	%g5,	0x19,	%i1
loop_757:
	tne	%xcc,	0x7
loop_758:
	call	loop_760
loop_759:
	fnot2s	%f27,	%f16
	rdhpr	%hintp,	%i2
	brz	%g6,	loop_761
loop_760:
	nop
	fitod	%f19,	%f6
	call	loop_762
	addcc	%g2,	0x1086,	%l1
loop_761:
	call	loop_763
	call	loop_764
loop_762:
	fpsub16s	%f17,	%f22,	%f14
	fnot1s	%f9,	%f0
loop_763:
	fmul8x16au	%f8,	%f16,	%f12
loop_764:
	fmovsneg	%icc,	%f10,	%f1
	movue	%fcc2,	%i0,	%i5
	call	loop_765
	or	%o4,	%l2,	%l5
	fmovdu	%fcc0,	%f2,	%f20
	set	0x68, %i4
	sta	%f13,	[%l7 + %i4] 0x80
loop_765:
	call	loop_766
	fpadd16	%f28,	%f28,	%f30
	fnot1s	%f29,	%f10
	call	loop_767
loop_766:
	fbne,pn	%fcc1,	loop_768
	xnorcc	%o0,	0x18DC,	%g7
	call	loop_769
loop_767:
	fcmpeq32	%f10,	%f14,	%o5
loop_768:
	sdivx	%l0,	%g4,	%g1
	call	loop_770
loop_769:
	fmovsleu	%xcc,	%f2,	%f6
	fcmpeq32	%f12,	%f2,	%i7
	brgez,a,pn	%o6,	loop_771
loop_770:
	movu	%fcc2,	%i6,	%o1
	call	loop_772
	udivcc	%l4,	%o7,	%o3
loop_771:
	fmovdcc	%icc,	%f14,	%f2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_772:
	subc	%i4,	%g3,	%o2
	mova	%fcc1,	%i3,	%l6
	orcc	%l3,	%g5,	%i1
	call	loop_773
	call	loop_774
	call	loop_775
	call	loop_776
loop_773:
	call	loop_777
loop_774:
	taddcc	%i2,	%g6,	%g2
loop_775:
	fmovsneg	%xcc,	%f28,	%f13
loop_776:
	fmovsvc	%icc,	%f1,	%f4
loop_777:
	edge16	%l1,	%i5,	%o4
	movvs	%icc,	%i0,	%l5
	nop
	set	0x7E, %o1
	lduh	[%l7 + %o1],	%o0
	movvs	%xcc,	%l2,	%g7
	call	loop_778
	rdpr	%otherwin,	%l0
	call	loop_779
	rd	%softint,	%g4
loop_778:
	nop
	setx	0x7574C805,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA664DFA5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f3,	%f13
	fmovsug	%fcc3,	%f25,	%f19
loop_779:
	fblg,a,pn	%fcc2,	loop_780
	call	loop_781
	fmovdge	%fcc3,	%f8,	%f0
	edge16	%g1,	%o5,	%o6
loop_780:
	edge16	%i7,	%i6,	%l4
loop_781:
	fmovdneg	%xcc,	%f18,	%f12
	wr	%g0,	0x80,	%asi
	stwa	%o7,	[%l7 + 0x10] %asi
	edge32n	%o3,	%o1,	%g3
	tsubcctv	%i4,	%i3,	%o2
	fornot1	%f26,	%f4,	%f0
	fpack32	%f10,	%f18,	%f28
	fnot2	%f30,	%f8
	rdpr	%gl,	%l6
	nop
	setx	loop_782,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x002100001402,	%l0,	%l1
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
	call	loop_783
	fmovsgu	%icc,	%f24,	%f1
	movpos	%xcc,	0x6B0,	%g5
loop_782:
	fmovdug	%fcc0,	%f6,	%f22
loop_783:
	nop
	setx	0x9AEB1C78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f4
	siam	0x5
	fand	%f28,	%f24,	%f4
	call	loop_784
	nop
	setx	0x37871E9E61766E3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCEB813E373DFB655,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f16,	%f20
	movl	%icc,	0x72F,	%l3
	call	loop_785
loop_784:
	rd	%fprs,	%i2
	call	loop_786
	fones	%f16
loop_785:
	edge16n	%g6,	%g2,	%i1
	fmovsvs	%icc,	%f7,	%f25
loop_786:
	call	loop_787
	call	loop_788
	call	loop_789
	call	loop_790
loop_787:
	call	loop_791
loop_788:
	call	loop_792
loop_789:
	movg	%xcc,	%i5,	%l1
loop_790:
	rdpr	%gl,	%i0
loop_791:
	bshuffle	%f24,	%f6,	%f30
loop_792:
	movcc	%xcc,	0x41D,	%l5
	fmovrdgez	%o4,	%f8,	%f4
	fnors	%f9,	%f9,	%f7
	addc	%l2,	%o0,	%l0
	call	loop_793
	brlez	%g4,	loop_794
	std	%f10,	[%l7 + 0x60]
	bne,a	%icc,	loop_795
loop_793:
	nop
	setx loop_796, %l0, %l1
	jmpl %l1, %g7
loop_794:
	fmovdl	%fcc2,	%f2,	%f12
	brlez,a	%g1,	loop_797
loop_795:
	orncc	%o5,	0x0AB8,	%o6
loop_796:
	call	loop_798
	call	loop_799
loop_797:
	call	loop_800
	xor	%i7,	%i6,	%o7
loop_798:
	fornot2	%f22,	%f14,	%f14
loop_799:
	edge32ln	%o3,	%l4,	%g3
loop_800:
	nop
	setx	0x4F83700B3A2E768F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x73A89BD0A5E0E378,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f20
	umul	%o1,	0x0EE4,	%i4
	subcc	%o2,	%l6,	%g5
	movge	%icc,	%l3,	%i3
	call	loop_801
	pdist	%f20,	%f24,	%f10
	call	loop_802
	fmovsu	%fcc3,	%f23,	%f13
loop_801:
	fmovdlg	%fcc0,	%f28,	%f2
	movneg	%icc,	%i2,	%g2
loop_802:
	alignaddr	%g6,	%i5,	%l1
	fmul8x16au	%f12,	%f30,	%f30
	alignaddrl	%i1,	%i0,	%o4
	movue	%fcc3,	%l2,	%o0
	call	loop_803
	fcmped	%fcc3,	%f2,	%f16
	fmovdpos	%xcc,	%f12,	%f10
	tle	%icc,	0x4
loop_803:
	nop
	setx	0xBE1DA60488CE0D0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f10
	call	loop_804
	ta	%icc,	0x1
	nop
	setx	0x6A153F86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x8AE3CB49,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f6,	%f23
	fmovdneg	%icc,	%f14,	%f12
loop_804:
	rdpr	%otherwin,	%l5
	and	%l0,	%g7,	%g4
	call	loop_805
	srax	%o5,	0x0D,	%g1
	alignaddr	%o6,	%i7,	%o7
	call	loop_806
loop_805:
	call	loop_807
	edge8ln	%o3,	%l4,	%i6
	call	loop_808
loop_806:
	nop
	setx loop_809, %l0, %l1
	jmpl %l1, %g3
loop_807:
	fornot1	%f0,	%f12,	%f2
	call	loop_810
loop_808:
	tcc	%icc,	0x6
loop_809:
	fpack16	%f26,	%f7
	nop
	setx	0x37CE4E5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_810:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%o1
	brz,a,pn	%i4,	loop_811
	udiv	%o2,	0x00,	%g5
	movuge	%fcc0,	%l6,	%i3
	subccc	%i2,	%g2,	%l3
loop_811:
	fmovsge	%fcc0,	%f24,	%f23
	bcc,a,pn	%icc,	loop_812
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f10
	fmul8ulx16	%f2,	%f16,	%f20
	fpackfix	%f24,	%f1
loop_812:
	fzeros	%f17
	prefetch	[%l7 + 0x54],	 1
	movuge	%fcc1,	%g6,	%i5
	wrpr	%i1,	0x18EB,	%tick
	call	loop_813
	call	loop_814
	fxnors	%f21,	%f2,	%f9
	call	loop_815
loop_813:
	call	loop_816
loop_814:
	fmuld8sux16	%f25,	%f3,	%f14
	call	loop_817
loop_815:
	tg	%xcc,	0x1
loop_816:
	mulx	%i0,	%o4,	%l1
	rdpr	%tba,	%o0
loop_817:
	std	%l2,	[%l7 + 0x30]
	edge8n	%l5,	%l0,	%g7
	movre	%g4,	0x2ED,	%o5
	movpos	%xcc,	%o6,	%i7
	call	loop_818
	call	loop_819
	sll	%o7,	0x0B,	%g1
	tge	%icc,	0x7
loop_818:
	fmovdge	%fcc3,	%f18,	%f26
loop_819:
	fpsub16	%f24,	%f12,	%f28
	edge16ln	%l4,	%o3,	%g3
	call	loop_820
	rd	%fprs,	%i6
	fmovda	%fcc2,	%f22,	%f22
	call	loop_821
loop_820:
	call	loop_822
	rd	%ccr,	%i4
	ble	%xcc,	loop_823
loop_821:
	call	loop_824
loop_822:
	movuge	%fcc0,	%o2,	%o1
	edge8ln	%l6,	%i3,	%g5
loop_823:
	call	loop_825
loop_824:
	edge16l	%g2,	%l3,	%g6
	movgu	%xcc,	0x317,	%i5
	set	0x35, %i2
	ldsba	[%l7 + %i2] 0x11,	%i2
loop_825:
	wrpr 	%g0, 	0x3, 	%gl
	bg,a,pn	%icc,	loop_826
	movuge	%fcc3,	0x4D4,	%o4
	call	loop_827
	sdivcc	%l1,	0x00,	%l2
loop_826:
	fxnors	%f4,	%f19,	%f29
	subccc	%o0,	0x023C,	%l0
loop_827:
	movu	%fcc0,	%l5,	%g7
	call	loop_828
	call	loop_829
	nop
	setx	0xA4CB53B573004EE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovdlg	%fcc2,	%f28,	%f30
loop_828:
	call	loop_830
loop_829:
	movvs	%icc,	%g4,	%o5
	fcmpgt16	%f12,	%f30,	%i7
	call	loop_831
loop_830:
	call	loop_832
	nop
	set	0x68, %i0
	prefetch	[%l7 + %i0],	 2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_831:
	call	loop_833
loop_832:
	fmuld8ulx16	%f0,	%f1,	%f12
	fnot1s	%f13,	%f7
	call	loop_834
loop_833:
	tge	%xcc,	0x0
	call	loop_835
	call	loop_836
loop_834:
	edge8ln	%o7,	%g1,	%l4
	call	loop_837
loop_835:
	fmovrdlez	%o6,	%f22,	%f16
loop_836:
	fmovrse	%o3,	%f11,	%f18
	movuge	%fcc1,	%g3,	%i6
loop_837:
	bgu,a	%icc,	loop_838
	call	loop_839
	fcmpeq16	%f24,	%f24,	%o2
	flush	%l7 + 0x08
loop_838:
	fmovrse	%o1,	%f26,	%f2
loop_839:
	alignaddrl	%i4,	%i3,	%g5
	edge16l	%l6,	%l3,	%g6
	call	loop_840
	movue	%fcc3,	0x005,	%g2
	call	loop_841
	call	loop_842
loop_840:
	call	loop_843
	nop
	set	0x58, %l1
	stx	%i2,	[%l7 + %l1]
loop_841:
	fmuld8ulx16	%f13,	%f19,	%f2
loop_842:
	call	loop_844
loop_843:
	fbn	%fcc3,	loop_845
	call	loop_846
	call	loop_847
loop_844:
	taddcctv	%i0,	0x1C6B,	%i5
loop_845:
	bg,pt	%icc,	loop_848
loop_846:
	fmovdvs	%icc,	%f12,	%f24
loop_847:
	call	loop_849
	call	loop_850
loop_848:
	movlg	%fcc2,	%o4,	%l1
	fpadd32	%f24,	%f16,	%f6
loop_849:
	call	loop_851
loop_850:
	srax	%i1,	0x08,	%o0
	fone	%f20
	flushw
loop_851:
	fmovdu	%fcc0,	%f8,	%f20
	fmul8sux16	%f6,	%f16,	%f8
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%l0
	nop
	setx	0x72C19498,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x28B6E4A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f25,	%f5
	call	loop_852
	fpadd32	%f10,	%f14,	%f4
	alignaddrl	%l2,	%l5,	%g4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcb
loop_852:
	nop
	setx	0x695A1468DE0F396B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFD114A10547F9D8E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f24,	%f30
	fmovdneg	%xcc,	%f16,	%f4
	call	loop_853
	fmovscs	%xcc,	%f9,	%f3
	movrlz	%g7,	%i7,	%o5
	fmovrslez	%o7,	%f21,	%f19
loop_853:
	fmovsu	%fcc0,	%f4,	%f14
	alignaddrl	%l4,	%o6,	%o3
	wr	%g1,	0x12FD,	%softint
	edge8l	%g3,	%i6,	%o1
	wrpr 	%g0, 	0x3, 	%gl
	umulcc	%i3,	%o2,	%l6
	movrlz	%g5,	0x31B,	%l3
	fands	%f18,	%f10,	%f26
	orncc	%g2,	0x099A,	%g6
	brgez,a,pn	%i2,	loop_854
	call	loop_855
	nop
	setx	loop_856,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011400001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1	%f18,	%f16,	%f14
loop_854:
	fxors	%f29,	%f10,	%f20
loop_855:
	tle	%icc,	0x2
loop_856:
	call	loop_857
	fmovsule	%fcc2,	%f6,	%f13
	movrne	%i0,	%o4,	%l1
	fmovdgu	%xcc,	%f30,	%f30
loop_857:
	srl	%i1,	0x09,	%o0
	movg	%xcc,	0x245,	%l0
	nop
	set	0x40, %g4
	std	%f28,	[%l7 + %g4]
	movvs	%icc,	0x6A5,	%l2
	ble,pn	%xcc,	loop_858
	membar	0x72
	movrne	%i5,	%l5,	%g7
	call	loop_859
loop_858:
	call	loop_860
	movrlez	%g4,	0x1A7,	%i7
	nop
	setx	0xDDA978694AC054D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xFFBBA1D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f30,	%f20
loop_859:
	call	loop_861
loop_860:
	nop
	setx	0x47C9C46C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xA31C8ECA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f4,	%f26
	movge	%icc,	%o7,	%o5
	fpadd32	%f10,	%f6,	%f8
loop_861:
	te	%icc,	0x6
	fpmerge	%f11,	%f11,	%f18
	movleu	%xcc,	0x24D,	%l4
	fmovso	%fcc0,	%f21,	%f9
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	stx	%o3,	[%l7 + 0x68]
	bcc,pn	%icc,	loop_862
	bcs,a,pn	%icc,	loop_863
	fabsd	%f26,	%f28
	nop
	setx	0xEB13B17834B910F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x73C4586E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f4,	%f4
loop_862:
	call	loop_864
loop_863:
	fmovrse	%g1,	%f23,	%f25
	tle	%xcc,	0x7
	fones	%f8
loop_864:
	fand	%f0,	%f12,	%f2
	brlz,pn	%o6,	loop_865
	call	loop_866
	fcmps	%fcc0,	%f23,	%f12
	ble,a	%icc,	loop_867
loop_865:
	fcmpeq32	%f28,	%f20,	%i6
loop_866:
	rdhpr	%htba,	%g3
	rd	%tick_cmpr,	%i4
loop_867:
	tcs	%xcc,	0x4
	sethi	0x06BB,	%o1
	nop
	set	0x12, %i7
	lduh	[%l7 + %i7],	%i3
	fbn	%fcc2,	loop_868
	fandnot2s	%f3,	%f30,	%f2
	call	loop_869
	rdpr	%canrestore,	%o2
loop_868:
	fcmpne32	%f20,	%f4,	%g5
	movg	%fcc2,	0x39C,	%l6
loop_869:
	nop
	wr	%g0,	0x04,	%asi
	stha	%l3,	[%l7 + 0x78] %asi
	fornot1s	%f14,	%f9,	%f0
	fmovdpos	%icc,	%f22,	%f18
	call	loop_870
	fnand	%f20,	%f4,	%f20
	fmovdlg	%fcc2,	%f8,	%f24
	tn	%xcc,	0x3
loop_870:
	rd	%softint,	%g6
	fmovdl	%icc,	%f12,	%f6
	fmovdul	%fcc1,	%f26,	%f16
	array8	%i2,	%i0,	%g2
	fmovrsgz	%o4,	%f31,	%f1
	orn	%l1,	0x1205,	%o0
	fands	%f12,	%f27,	%f8
	bvc	%xcc,	loop_871
	fmovrdne	%l0,	%f4,	%f6
	movrgez	%i1,	%i5,	%l5
	sdiv	%g7,	%g4,	%l2
loop_871:
	rdpr	%wstate,	%o7
	call	loop_872
	call	loop_873
	edge8	%i7,	%l4,	%o5
	fmuld8ulx16	%f7,	%f18,	%f6
loop_872:
	call	loop_874
loop_873:
	ble,a,pt	%xcc,	loop_875
	fnand	%f14,	%f30,	%f28
	call	loop_876
loop_874:
	nop
	setx	0x39F8D3EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xDF166571,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f29,	%f26
loop_875:
	fmovdle	%xcc,	%f4,	%f16
	subcc	%g1,	0x0C78,	%o6
loop_876:
	fornot1s	%f17,	%f29,	%f19
	tvc	%icc,	0x6
	pdist	%f30,	%f10,	%f24
	edge32l	%i6,	%o3,	%i4
	call	loop_877
	call	loop_878
	call	loop_879
	fxor	%f18,	%f14,	%f30
loop_877:
	fmovscc	%icc,	%f14,	%f9
loop_878:
	movul	%fcc1,	0x3D7,	%o1
loop_879:
	call	loop_880
	array8	%g3,	%i3,	%g5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_881
loop_880:
	fmovsle	%fcc0,	%f17,	%f4
	call	loop_882
	add	%l6,	0x05C0,	%l3
loop_881:
	nop
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x81,	 3
loop_882:
	fcmpes	%fcc2,	%f7,	%f14
	wrpr 	%g0, 	0x3, 	%gl
	fmovdule	%fcc1,	%f8,	%f24
	xor	%o2,	0x04ED,	%g2
	fnot1s	%f11,	%f13
	movcs	%icc,	%o4,	%i0
	call	loop_883
	movl	%xcc,	0x5C1,	%o0
	array32	%l0,	%l1,	%i1
	edge8n	%i5,	%g7,	%g4
loop_883:
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	tsubcctv	%l5,	0x007F,	%o7
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f28
	call	loop_884
	call	loop_885
	fmovsvs	%icc,	%f12,	%f14
	fmovdne	%xcc,	%f12,	%f12
loop_884:
	wrpr	%l2,	%i7,	%tick
loop_885:
	call	loop_886
	sub	%l4,	%o5,	%g1
	fcmped	%fcc1,	%f28,	%f12
	tle	%xcc,	0x4
loop_886:
	fmuld8sux16	%f8,	%f17,	%f26
	call	loop_887
	membar	0x4A
	fmovsgu	%icc,	%f6,	%f0
	sir	0x01E9
loop_887:
	call	loop_888
	movo	%fcc3,	0x159,	%i6
	call	loop_889
	fornot1s	%f24,	%f3,	%f26
loop_888:
	call	loop_890
	call	loop_891
loop_889:
	call	loop_892
	call	loop_893
loop_890:
	fmovrslez	%o6,	%f8,	%f5
loop_891:
	call	loop_894
loop_892:
	fornot2	%f4,	%f18,	%f30
loop_893:
	tgu	%icc,	0x0
	orn	%o3,	0x10D6,	%o1
loop_894:
	call	loop_895
	call	loop_896
	call	loop_897
	nop
	set	0x31, %l4
	ldsb	[%l7 + %l4],	%g3
loop_895:
	ldd	[%l7 + 0x08],	%i2
loop_896:
	call	loop_898
loop_897:
	call	loop_899
	rdpr	%tl,	%i4
	fabsd	%f20,	%f4
loop_898:
	fbug,a,pt	%fcc0,	loop_900
loop_899:
	faligndata	%f8,	%f18,	%f24
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_901
loop_900:
	fmovdne	%fcc1,	%f8,	%f8
	nop
	setx	0x688D0D67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f19
	fabsd	%f24,	%f12
loop_901:
	movrlz	%g5,	%l3,	%g6
	fmovdg	%xcc,	%f26,	%f10
	st	%f7,	[%l7 + 0x50]
	bleu	%icc,	loop_902
	call	loop_903
	fmovdpos	%xcc,	%f22,	%f6
	call	loop_904
loop_902:
	ta	%xcc,	0x0
loop_903:
	movlg	%fcc1,	%l6,	%o2
	call	loop_905
loop_904:
	movge	%fcc0,	0x105,	%g2
	call	loop_906
	edge32ln	%o4,	%i0,	%i2
loop_905:
	flushw
	fandnot2s	%f29,	%f8,	%f14
loop_906:
	fmovs	%f28,	%f16
	set	0x76, %i5
	stha	%l0,	[%l7 + %i5] 0x81
	call	loop_907
	call	loop_908
	edge8ln	%o0,	%i1,	%i5
	call	loop_909
loop_907:
	mova	%fcc3,	%g7,	%g4
loop_908:
	edge32n	%l1,	%l5,	%l2
	edge8	%o7,	%i7,	%o5
loop_909:
	brgez,pt	%g1,	loop_910
	call	loop_911
	stx	%fsr,	[%l7 + 0x30]
	te	%icc,	0x6
loop_910:
	bl,pt	%icc,	loop_912
loop_911:
	subccc	%i6,	%o6,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_913
loop_912:
	movu	%fcc0,	0x0F2,	%o1
	fmovrslez	%i3,	%f27,	%f19
loop_913:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 28
!	Type a   	: 24
!	Type x   	: 8
!	Type cti   	: 160
!	Type f   	: 140
!	Type i   	: 140
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
	set	0xF,	%g2
	set	0x5,	%g3
	set	0xF,	%g4
	set	0x1,	%g5
	set	0xD,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x2,	%i1
	set	-0xB,	%i2
	set	-0x9,	%i3
	set	-0x8,	%i4
	set	-0xE,	%i5
	set	-0x9,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x47FD0F28,	%l0
	set	0x3BF4079F,	%l1
	set	0x39D89CFC,	%l2
	set	0x6643D60B,	%l3
	set	0x2D7B2FAF,	%l4
	set	0x21103168,	%l5
	set	0x1E27EF88,	%l6
	!# Output registers
	set	-0x038C,	%o0
	set	0x0A31,	%o1
	set	-0x07C0,	%o2
	set	0x1290,	%o3
	set	-0x1850,	%o4
	set	0x1AD6,	%o5
	set	-0x18D0,	%o6
	set	0x08F3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	fmovrsgz	%g3,	%f18,	%f17
	wrpr	%g5,	%i4,	%pil
	call	loop_914
	call	loop_915
	fmovdge	%fcc0,	%f0,	%f6
	brlz,a	%l3,	loop_916
loop_914:
	fmovsuge	%fcc1,	%f31,	%f15
loop_915:
	movcs	%xcc,	0x165,	%g6
	call	loop_917
loop_916:
	call	loop_918
	call	loop_919
	rdhpr	%hsys_tick_cmpr,	%l6
loop_917:
	nop
	setx	0x6B0D0CDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_918:
	call	loop_920
loop_919:
	nop
	setx	0xEFB9A0CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xCB4C9440,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f7,	%f3
	tvc	%xcc,	0x0
	fmovdgu	%icc,	%f20,	%f2
loop_920:
	call	loop_921
	bvc,a	%xcc,	loop_922
	nop
	setx	0xAF371358,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	fmovrdgz	%o2,	%f8,	%f22
loop_921:
	call	loop_923
loop_922:
	movleu	%icc,	%o4,	%g2
	tg	%icc,	0x5
	fpack16	%f12,	%f1
loop_923:
	nop
	set	0x3C, %o2
	ldsb	[%l7 + %o2],	%i2
	fsrc2	%f8,	%f0
	fmovduge	%fcc2,	%f20,	%f12
	movl	%xcc,	0x31A,	%l0
	bcs	%icc,	loop_924
	movul	%fcc1,	%o0,	%i0
	bg,a	%icc,	loop_925
	movul	%fcc3,	%i5,	%i1
loop_924:
	rd	%asi,	%g4
	movuge	%fcc0,	%l1,	%l5
loop_925:
	mulx	%g7,	0x0864,	%o7
	movrgez	%l2,	%i7,	%g1
	fmovsue	%fcc1,	%f31,	%f2
	srlx	%i6,	0x12,	%o5
	fmovdne	%fcc1,	%f0,	%f8
	edge32n	%o6,	%l4,	%o1
	fbn,pt	%fcc3,	loop_926
	call	loop_927
	edge8ln	%i3,	%o3,	%g3
	call	loop_928
loop_926:
	nop
	setx	0x2FE4CA651476759B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f30
loop_927:
	nop
	setx	0xFB493EC7D925F09B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fbo,pn	%fcc2,	loop_929
loop_928:
	fpmerge	%f30,	%f25,	%f4
	tcc	%icc,	0x6
	nop
	setx	loop_930,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004100001400,	%l0,	%l1
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
loop_929:
	movvs	%xcc,	%i4,	%l3
	call	loop_931
	fmovsa	%fcc1,	%f29,	%f18
loop_930:
	call	loop_932
	nop
	setx	0x3F347F34,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x77E8DEFB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f20,	%f27
loop_931:
	movge	%fcc3,	0x444,	%g5
	alignaddrl	%l6,	%o2,	%o4
loop_932:
	bcc,pn	%xcc,	loop_933
	popc	%g2,	%i2
	call	loop_934
	fbu	%fcc3,	loop_935
loop_933:
	movo	%fcc3,	%l0,	%g6
	call	loop_936
loop_934:
	ta	%xcc,	0x2
loop_935:
	movu	%fcc2,	0x1AB,	%o0
	movo	%fcc1,	0x0FE,	%i5
loop_936:
	fones	%f12
	call	loop_937
	fmovslg	%fcc0,	%f27,	%f9
	orn	%i0,	%g4,	%l1
	subc	%l5,	%g7,	%o7
loop_937:
	call	loop_938
	edge16n	%i1,	%i7,	%g1
	call	loop_939
	call	loop_940
loop_938:
	tcc	%icc,	0x1
	fxnors	%f17,	%f27,	%f24
loop_939:
	fbn,a	%fcc2,	loop_941
loop_940:
	call	loop_942
	call	loop_943
	st	%f20,	[%l7 + 0x18]
loop_941:
	xor	%i6,	%o5,	%o6
loop_942:
	movcc	%xcc,	%l4,	%l2
loop_943:
	edge8n	%o1,	%o3,	%g3
	call	loop_944
	nop
	setx	0xAF560A9361A2DC50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE27CBCE8720D8939,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f12,	%f4
	edge16l	%i3,	%l3,	%i4
	movuge	%fcc3,	%g5,	%l6
loop_944:
	call	loop_945
	call	loop_946
	fnegd	%f12,	%f18
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_945:
	edge8ln	%o4,	%g2,	%i2
loop_946:
	wr	%l0,	0x0152,	%y
	fble	%fcc0,	loop_947
	bcs,a	%xcc,	loop_948
	nop
	fitod	%f21,	%f16
	movge	%icc,	%g6,	%o2
loop_947:
	fmovse	%fcc1,	%f1,	%f22
loop_948:
	fmovsne	%xcc,	%f21,	%f30
	call	loop_949
	addc	%i5,	0x1519,	%o0
	fmul8x16al	%f11,	%f1,	%f30
	edge8l	%i0,	%g4,	%l5
loop_949:
	edge32	%g7,	%l1,	%i1
	rd	%ccr,	%o7
	fblg	%fcc2,	loop_950
	fcmpgt32	%f28,	%f18,	%g1
	fcmpes	%fcc3,	%f4,	%f8
	call	loop_951
loop_950:
	sub	%i7,	%o5,	%i6
	call	loop_952
	call	loop_953
loop_951:
	fbue	%fcc2,	loop_954
	fone	%f10
loop_952:
	call	loop_955
loop_953:
	nop
	setx	0x6DDA21769A3EC2F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x587DF2F5DF5C526A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f14,	%f4
loop_954:
	brz	%o6,	loop_956
	call	loop_957
loop_955:
	call	loop_958
	call	loop_959
loop_956:
	bge,pt	%icc,	loop_960
loop_957:
	srlx	%l4,	0x0D,	%l2
loop_958:
	fmovsuge	%fcc2,	%f26,	%f24
loop_959:
	bn,pt	%icc,	loop_961
loop_960:
	call	loop_962
	alignaddr	%o1,	%g3,	%o3
	call	loop_963
loop_961:
	nop
	setx	0xE4B3B09F5DA81F2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x38EBA7746C35349E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f6,	%f8
loop_962:
	call	loop_964
	call	loop_965
loop_963:
	fors	%f23,	%f8,	%f24
	fmovsge	%fcc1,	%f22,	%f15
loop_964:
	call	loop_966
loop_965:
	fmovduge	%fcc1,	%f8,	%f0
	wr	%i3,	%i4,	%clear_softint
	wr	%l3,	0x1FDD,	%y
loop_966:
	fmovdne	%fcc3,	%f0,	%f12
	call	loop_967
	call	loop_968
	fnegd	%f28,	%f30
	set	0x2F, %i6
	lduba	[%l7 + %i6] 0x18,	%l6
loop_967:
	fnors	%f5,	%f27,	%f6
loop_968:
	call	loop_969
	brgez,a,pn	%g5,	loop_970
	call	loop_971
	fzeros	%f0
loop_969:
	xor	%g2,	%i2,	%o4
loop_970:
	fbuge,a	%fcc2,	loop_972
loop_971:
	fpack32	%f12,	%f0,	%f28
	fcmpne32	%f28,	%f16,	%l0
	call	loop_973
loop_972:
	fcmpne32	%f14,	%f8,	%o2
	call	loop_974
	fpadd32	%f16,	%f22,	%f26
loop_973:
	call	loop_975
	movvs	%xcc,	%i5,	%o0
loop_974:
	nop
	setx	0x3436A4D0239F54AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f10
	movrlz	%i0,	0x16C,	%g6
loop_975:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%l5,	%i1,	%softint
	fmovdvc	%icc,	%f12,	%f0
	movg	%fcc1,	0x781,	%l1
	call	loop_976
	fmovdgu	%xcc,	%f20,	%f10
	fmovdle	%xcc,	%f28,	%f24
	call	loop_977
loop_976:
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f24
	nop
	fitod	%f12,	%f14
	fdtos	%f14,	%f25
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x10,	%g1,	%i7
loop_977:
	sdivcc	%o7,	%o5,	%i6
	xor	%o6,	0x17A2,	%l2
	call	loop_978
	call	loop_979
	nop
	set	0x37, %g6
	ldsb	[%l7 + %g6],	%l4
	subccc	%g3,	0x1D64,	%o1
loop_978:
	call	loop_980
loop_979:
	fzero	%f2
	call	loop_981
	fabsd	%f6,	%f2
loop_980:
	call	loop_982
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
loop_981:
	fxnors	%f0,	%f31,	%f24
	tpos	%xcc,	0x0
loop_982:
	fzero	%f22
	call	loop_983
	call	loop_984
	smulcc	%i3,	%o3,	%l3
	fble,a	%fcc1,	loop_985
loop_983:
	edge32	%i4,	%l6,	%g2
loop_984:
	movn	%xcc,	%i2,	%g5
	tcc	%xcc,	0x7
loop_985:
	fmovdvc	%icc,	%f0,	%f0
	fmovdu	%fcc1,	%f24,	%f8
	fmovda	%fcc2,	%f0,	%f26
	fmovdn	%xcc,	%f24,	%f6
	call	loop_986
	bg,a,pn	%xcc,	loop_987
	call	loop_988
	movrlez	%o4,	0x339,	%l0
loop_986:
	edge16n	%o2,	%o0,	%i0
loop_987:
	call	loop_989
loop_988:
	nop
	setx	loop_990,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012200001407,	%l0,	%l1
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
	call	loop_991
	fcmpne32	%f0,	%f22,	%i5
loop_989:
	call	loop_992
loop_990:
	taddcctv	%g4,	0x0ED7,	%g7
loop_991:
	fors	%f25,	%f1,	%f1
	xnorcc	%g6,	%i1,	%l1
loop_992:
	fpadd16	%f4,	%f4,	%f4
	fbg,pn	%fcc1,	loop_993
	fmovdule	%fcc3,	%f8,	%f28
	call	loop_994
	fone	%f20
loop_993:
	tle	%icc,	0x5
	call	loop_995
loop_994:
	tcc	%xcc,	0x6
	call	loop_996
	call	loop_997
loop_995:
	mulscc	%g1,	%i7,	%o7
	fcmped	%fcc3,	%f8,	%f6
loop_996:
	fmovsne	%fcc2,	%f5,	%f9
loop_997:
	fcmpne16	%f22,	%f10,	%o5
	call	loop_998
	fmovdgu	%xcc,	%f26,	%f4
	fmovsle	%fcc2,	%f14,	%f9
	nop
	setx	0x926D771A0E6087A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xDBBC8984FD7F4EDA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f24,	%f10
loop_998:
	call	loop_999
	fmovdlg	%fcc1,	%f0,	%f30
	call	loop_1000
	fmovdvs	%icc,	%f4,	%f10
loop_999:
	movn	%icc,	0x776,	%i6
	fand	%f12,	%f6,	%f28
loop_1000:
	xorcc	%o6,	%l5,	%l4
	call	loop_1001
	wrpr 	%g0, 	0x3, 	%gl
	edge16	%o1,	%l2,	%o3
	movvc	%icc,	%l3,	%i4
loop_1001:
	call	loop_1002
	fbl,a,pt	%fcc1,	loop_1003
	ldsh	[%l7 + 0x66],	%l6
	tpos	%icc,	0x0
loop_1002:
	fones	%f21
loop_1003:
	fmovsule	%fcc1,	%f22,	%f12
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%g2
	st	%f2,	[%l7 + 0x7C]
	fpsub16s	%f28,	%f9,	%f20
	nop
	fitos	%f23,	%f13
	fcmple32	%f20,	%f2,	%i2
	umulcc	%g5,	%o4,	%l0
	srax	%i3,	0x1E,	%o2
	fornot2	%f16,	%f8,	%f22
	call	loop_1004
	call	loop_1005
	brgz	%o0,	loop_1006
	subc	%i0,	%g4,	%g7
loop_1004:
	nop
	setx	0x1BBF7DA01DF22F05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x9D953480,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f2,	%f8
loop_1005:
	bne	%xcc,	loop_1007
loop_1006:
	fnands	%f2,	%f8,	%f26
	ble,pt	%icc,	loop_1008
	call	loop_1009
loop_1007:
	movpos	%xcc,	%i5,	%i1
	movne	%fcc1,	%l1,	%g6
loop_1008:
	call	loop_1010
loop_1009:
	udivx	%i7,	0x00,	%o7
	brgz	%o5,	loop_1011
	fandnot1s	%f16,	%f3,	%f25
loop_1010:
	ba,pt	%icc,	loop_1012
	fnot2	%f10,	%f18
loop_1011:
	call	loop_1013
	fmovsu	%fcc1,	%f0,	%f14
loop_1012:
	call	loop_1014
	movrgz	%g1,	%i6,	%o6
loop_1013:
	rdpr	%cansave,	%l5
	nop
	fitod	%f4,	%f0
	fdtoi	%f0,	%f17
loop_1014:
	alignaddr	%g3,	%o1,	%l4
	brlz,a,pt	%o3,	loop_1015
	call	loop_1016
	sdivx	%l3,	%l2,	%l6
	te	%icc,	0x7
loop_1015:
	fmovdug	%fcc3,	%f26,	%f8
loop_1016:
	edge32ln	%g2,	%i4,	%i2
	fexpand	%f18,	%f18
	call	loop_1017
	fmul8x16au	%f20,	%f6,	%f28
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f18
	popc	0x17F1,	%o4
loop_1017:
	fmovda	%xcc,	%f16,	%f6
	fmovrdgz	%g5,	%f4,	%f10
	fmovdgu	%icc,	%f18,	%f18
	tle	%xcc,	0x4
	call	loop_1018
	subccc	%i3,	0x0713,	%l0
	fors	%f18,	%f14,	%f10
	movl	%fcc0,	%o2,	%o0
loop_1018:
	fblg,pn	%fcc2,	loop_1019
	tpos	%icc,	0x5
	fxors	%f12,	%f6,	%f5
	brnz,a,pt	%g4,	loop_1020
loop_1019:
	call	loop_1021
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f23
	call	loop_1022
loop_1020:
	call	loop_1023
loop_1021:
	fcmpgt32	%f8,	%f2,	%i0
	sir	0x075E
loop_1022:
	faligndata	%f10,	%f28,	%f12
loop_1023:
	fmovrdne	%i5,	%f6,	%f22
	call	loop_1024
	udivcc	%i1,	0x00,	%g7
	call	loop_1025
	call	loop_1026
loop_1024:
	tgu	%icc,	0x4
	fbu,pn	%fcc1,	loop_1027
loop_1025:
	fpsub32	%f8,	%f10,	%f22
loop_1026:
	addccc	%l1,	%g6,	%o7
	wrpr	%i7,	0x1C5B,	%pil
loop_1027:
	edge8ln	%g1,	%i6,	%o6
	fsrc2s	%f10,	%f3
	fmovsl	%fcc3,	%f8,	%f22
	call	loop_1028
	subcc	%l5,	0x08B7,	%g3
	edge16l	%o5,	%o1,	%l4
	fmovrdne	%o3,	%f10,	%f0
loop_1028:
	fmovdue	%fcc1,	%f20,	%f20
	movge	%icc,	0x5F8,	%l3
	fpack16	%f26,	%f11
	fmovsge	%fcc3,	%f29,	%f24
	movul	%fcc2,	0x122,	%l2
	fpsub32s	%f23,	%f1,	%f10
	rd	%y,	%g2
	movo	%fcc1,	%l6,	%i4
	call	loop_1029
	xor	%o4,	0x1267,	%g5
	fsrc1	%f20,	%f30
	movre	%i2,	0x06F,	%i3
loop_1029:
	movule	%fcc3,	0x229,	%o2
	subccc	%l0,	%g4,	%i0
	brz,a	%o0,	loop_1030
	tcc	%icc,	0x5
	fpackfix	%f18,	%f25
	alignaddr	%i5,	%g7,	%l1
loop_1030:
	call	loop_1031
	movo	%fcc1,	%i1,	%g6
	call	loop_1032
	fbue	%fcc2,	loop_1033
loop_1031:
	call	loop_1034
	fmovde	%icc,	%f28,	%f2
loop_1032:
	call	loop_1035
loop_1033:
	brlz	%o7,	loop_1036
loop_1034:
	fcmpne32	%f12,	%f30,	%i7
	fpack16	%f24,	%f19
loop_1035:
	fmovsuge	%fcc1,	%f17,	%f23
loop_1036:
	fmovdu	%fcc1,	%f28,	%f26
	fmovsul	%fcc2,	%f7,	%f31
	fmovdge	%fcc1,	%f0,	%f8
	nop
	setx	0x691FCAB676CB2AB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2EB171956E63A41F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f22,	%f18
	movlg	%fcc0,	%g1,	%i6
	call	loop_1037
	movn	%fcc2,	0x670,	%o6
	rdpr	%tba,	%l5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x76] %asi,	%g3
loop_1037:
	tneg	%icc,	0x5
	movu	%fcc1,	%o1,	%l4
	edge16l	%o3,	%o5,	%l2
	call	loop_1038
	stbar
	ta	%icc,	0x3
	call	loop_1039
loop_1038:
	nop
	setx	0x5D33D9E6BA0C1789,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f20
	srax	%l3,	%l6,	%i4
	fmovrsgz	%o4,	%f2,	%f6
loop_1039:
	fsrc2s	%f27,	%f5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g2,	%g5
	fcmpne32	%f4,	%f18,	%i3
	call	loop_1040
	fmovdu	%fcc3,	%f24,	%f0
	call	loop_1041
	sir	0x15E2
loop_1040:
	nop
	fitos	%f7,	%f24
	fstod	%f24,	%f0
	call	loop_1042
loop_1041:
	fmovd	%f8,	%f16
	te	%xcc,	0x7
	call	loop_1043
loop_1042:
	call	loop_1044
	movlg	%fcc1,	%i2,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1043:
	fmovdcc	%icc,	%f16,	%f22
loop_1044:
	ldsh	[%l7 + 0x34],	%i0
	xor	%o0,	%g7,	%l1
	movge	%fcc0,	%i5,	%g6
	nop
	setx	0x177B588AC331EFB6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f6
	call	loop_1045
	fsrc1	%f20,	%f12
	tvc	%xcc,	0x2
	subcc	%o7,	%i1,	%g1
loop_1045:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x32] %asi,	%i7
	fornot1	%f22,	%f18,	%f10
	sdiv	%o6,	0x00,	%i6
	fmovrse	%l5,	%f11,	%f4
	fbe,a	%fcc3,	loop_1046
	xnor	%g3,	0x152C,	%l4
	call	loop_1047
	movle	%fcc0,	0x341,	%o3
loop_1046:
	movo	%fcc1,	%o5,	%o1
	fmovrsgz	%l2,	%f28,	%f10
loop_1047:
	membar	0x27
	fmovdneg	%icc,	%f6,	%f2
	fnot2s	%f8,	%f23
	fbe,a,pt	%fcc1,	loop_1048
	movrne	%l3,	0x351,	%l6
	fmul8x16	%f22,	%f28,	%f8
	fcmpd	%fcc2,	%f14,	%f2
loop_1048:
	movne	%fcc0,	%i4,	%o4
	movre	%g2,	%g5,	%i3
	call	loop_1049
	wr 	%g0, 	0x6, 	%fprs
	call	loop_1050
	nop
	set	0x41, %o5
	ldub	[%l7 + %o5],	%i2
loop_1049:
	fornot1	%f14,	%f0,	%f24
	fnor	%f24,	%f4,	%f4
loop_1050:
	fones	%f8
	tsubcc	%o2,	0x08C3,	%g4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x18,	%i0,	%g7
	call	loop_1051
	andn	%l1,	%o0,	%g6
	nop
	fitod	%f26,	%f18
	call	loop_1052
loop_1051:
	bg,a,pn	%xcc,	loop_1053
	fmul8ulx16	%f22,	%f8,	%f30
	call	loop_1054
loop_1052:
	call	loop_1055
loop_1053:
	array32	%o7,	%i5,	%g1
	fmovdge	%fcc2,	%f10,	%f16
loop_1054:
	rdpr	%pil,	%i7
loop_1055:
	fmovso	%fcc1,	%f8,	%f29
	wr	%i1,	0x14F1,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E9, 	%hsys_tick_cmpr
	wr	%g0,	0x2b,	%asi
	stha	%l5,	[%l7 + 0x1C] %asi
	membar	#Sync
	tvc	%icc,	0x5
	bcc	%xcc,	loop_1056
	fmovda	%icc,	%f30,	%f10
	fpackfix	%f0,	%f21
	edge8l	%l4,	%g3,	%o3
loop_1056:
	call	loop_1057
	call	loop_1058
	call	loop_1059
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f18
loop_1057:
	nop
	set	0x1C, %g3
	lduw	[%l7 + %g3],	%o5
loop_1058:
	fnegd	%f22,	%f30
loop_1059:
	rd	%y,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbuge,pn	%fcc0,	loop_1060
	movu	%fcc2,	%i4,	%l6
	nop
	set	0x4E, %l6
	ldsh	[%l7 + %l6],	%g2
	call	loop_1061
loop_1060:
	brnz,pn	%o4,	loop_1062
	call	loop_1063
	call	loop_1064
loop_1061:
	nop
	setx	0xF90EB9394AE7CB86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_1062:
	fpsub16s	%f12,	%f22,	%f19
loop_1063:
	fmovspos	%icc,	%f28,	%f20
loop_1064:
	fmovslg	%fcc1,	%f3,	%f13
	fcmpes	%fcc1,	%f7,	%f16
	sll	%g5,	%l0,	%i3
	fmuld8sux16	%f16,	%f22,	%f24
	fbul,pt	%fcc2,	loop_1065
	movuge	%fcc1,	0x0F4,	%i2
	edge32l	%o2,	%g4,	%g7
	fmovsul	%fcc3,	%f23,	%f6
loop_1065:
	fors	%f8,	%f7,	%f23
	fmovsule	%fcc3,	%f26,	%f12
	fmul8sux16	%f28,	%f22,	%f22
	nop
	setx	0x9BB2BEC1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xD85E1616,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f23,	%f12
	fmul8x16au	%f15,	%f14,	%f20
	movneg	%icc,	0x130,	%i0
	array16	%o0,	%l1,	%o7
	fmovsa	%xcc,	%f0,	%f21
	fcmpeq32	%f26,	%f0,	%i5
	call	loop_1066
	xnorcc	%g6,	0x1331,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rdpr	%tl,	%g1
loop_1066:
	bvs	%icc,	loop_1067
	nop
	setx	0xE29A9104991EDED9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5D36A6C2D952D1DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f2
	movcc	%xcc,	0x435,	%l5
	call	loop_1068
loop_1067:
	call	loop_1069
	fmovsvc	%xcc,	%f11,	%f14
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x81,	%l4
loop_1068:
	nop

loop_1069:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 25
!	Type a   	: 23
!	Type x   	: 10
!	Type cti   	: 156
!	Type f   	: 155
!	Type i   	: 131
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
	set	0x0,	%g1
	set	0xB,	%g2
	set	0xB,	%g3
	set	0x5,	%g4
	set	0x6,	%g5
	set	0xD,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x1,	%i1
	set	-0xE,	%i2
	set	-0x2,	%i3
	set	-0x5,	%i4
	set	-0x2,	%i5
	set	-0xF,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x6DBDC0CB,	%l0
	set	0x79CF2248,	%l1
	set	0x7B1D8268,	%l2
	set	0x0ED17616,	%l3
	set	0x542522BD,	%l4
	set	0x1FFB9A9C,	%l5
	set	0x709625B2,	%l6
	!# Output registers
	set	-0x1DA6,	%o0
	set	0x0794,	%o1
	set	-0x10B4,	%o2
	set	-0x167F,	%o3
	set	-0x06C9,	%o4
	set	-0x1A2E,	%o5
	set	-0x0A9E,	%o6
	set	-0x082E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x18F7A73CC4A99B63)
	INIT_TH_FP_REG(%l7,%f2,0x361AEE51F56566D1)
	INIT_TH_FP_REG(%l7,%f4,0xA7C8EAFDCF027092)
	INIT_TH_FP_REG(%l7,%f6,0x342EBE29CE0091B0)
	INIT_TH_FP_REG(%l7,%f8,0x9A2B0C7884449D21)
	INIT_TH_FP_REG(%l7,%f10,0x84D2915172AE9779)
	INIT_TH_FP_REG(%l7,%f12,0x19A4FAE54B5C68A2)
	INIT_TH_FP_REG(%l7,%f14,0xCFCEB855BBE650DE)
	INIT_TH_FP_REG(%l7,%f16,0xAA4C487E240B8918)
	INIT_TH_FP_REG(%l7,%f18,0xC294E652CA3F93DD)
	INIT_TH_FP_REG(%l7,%f20,0x6448BA9A38CE1F55)
	INIT_TH_FP_REG(%l7,%f22,0x1B54F936F78CA6B1)
	INIT_TH_FP_REG(%l7,%f24,0xB5FED4E5B9044C74)
	INIT_TH_FP_REG(%l7,%f26,0x31C7FBA5939DA4DE)
	INIT_TH_FP_REG(%l7,%f28,0xF519D70FD5D256E3)
	INIT_TH_FP_REG(%l7,%f30,0x8ADC1DD0FF7568E3)

	!# Execute Main Diag ..

	fmovsg	%icc,	%f21,	%f14
	nop
	setx	0xCDFD3F81BDB27E7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD282119C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f0,	%f16
	fxors	%f31,	%f24,	%f12
	movcc	%icc,	%o6,	%g3
	edge8ln	%o3,	%o5,	%l3
	movcc	%xcc,	0x029,	%l2
	wr	%o1,	%i4,	%sys_tick
	bmask	%l6,	%g2,	%g5
	call	loop_1070
	fpsub16	%f18,	%f6,	%f2
	rdpr	%tba,	%o4
	call	loop_1071
loop_1070:
	fmovsgu	%xcc,	%f9,	%f11
	call	loop_1072
	bl	%icc,	loop_1073
loop_1071:
	call	loop_1074
	rdpr	%tba,	%l0
loop_1072:
	fmovsug	%fcc0,	%f5,	%f7
loop_1073:
	call	loop_1075
loop_1074:
	fpadd32	%f0,	%f26,	%f22
	call	loop_1076
	call	loop_1077
loop_1075:
	fmul8x16al	%f25,	%f1,	%f30
	call	loop_1078
loop_1076:
	array8	%i3,	%o2,	%i2
loop_1077:
	wr 	%g0, 	0x5, 	%fprs
	addc	%i0,	0x1F40,	%l1
loop_1078:
	nop
	wr	%g0,	0xda,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge8n	%o7,	%o0,	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x19,	%i7,	%i5
	fandnot2	%f26,	%f0,	%f0
	te	%icc,	0x7
	fbue,a,pn	%fcc1,	loop_1079
	fba	%fcc1,	loop_1080
	fmovsn	%icc,	%f4,	%f14
	call	loop_1081
loop_1079:
	nop
	setx	0x710B4EAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x5C429415,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f7,	%f23
loop_1080:
	nop
	set	0x6A, %l3
	stha	%i1,	[%l7 + %l3] 0x2a
	membar	#Sync
loop_1081:
	movle	%fcc0,	0x5E8,	%i6
	wr	%g1,	%l5,	%set_softint
	sir	0x0150
	fpsub16s	%f11,	%f11,	%f0
	call	loop_1082
	call	loop_1083
	movule	%fcc1,	%l4,	%g3
	tvc	%xcc,	0x5
loop_1082:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%o6
loop_1083:
	sdiv	%o5,	%l3,	%o1
	call	loop_1084
	stbar
	srax	%l2,	0x1F,	%i4
	fcmpne16	%f22,	%f20,	%g2
loop_1084:
	call	loop_1085
	fcmpne16	%f26,	%f6,	%l6
	fmul8ulx16	%f6,	%f24,	%f20
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f15
loop_1085:
	movl	%fcc1,	%o4,	%l0
	orn	%g5,	0x0DF0,	%o2
	call	loop_1086
	fmovdneg	%icc,	%f0,	%f18
	rd	%fprs,	%i2
	call	loop_1087
loop_1086:
	call	loop_1088
	call	loop_1089
	flushw
loop_1087:
	tvc	%icc,	0x0
loop_1088:
	fmovsu	%fcc2,	%f3,	%f2
loop_1089:
	call	loop_1090
	nop
	setx	0x16E03828,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xF337E8A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f2,	%f1
	fmovsge	%fcc1,	%f7,	%f4
	tleu	%icc,	0x0
loop_1090:
	fandnot1s	%f13,	%f21,	%f7
	call	loop_1091
	fcmpeq32	%f20,	%f16,	%i3
	call	loop_1092
	fmovrdne	%g7,	%f16,	%f0
loop_1091:
	call	loop_1093
	fmovrdlz	%i0,	%f18,	%f24
loop_1092:
	edge8	%l1,	%o7,	%o0
	andn	%g4,	%i7,	%g6
loop_1093:
	nop
	set	0x1C, %l5
	lduha	[%l7 + %l5] 0x0c,	%i1
	udivcc	%i5,	%i6,	%g1
	nop
	fitos	%f11,	%f1
	fstox	%f1,	%f16
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1094
	orncc	%l4,	0x175B,	%l5
	call	loop_1095
	call	loop_1096
loop_1094:
	call	loop_1097
	tl	%icc,	0x4
loop_1095:
	rd	%pc,	%g3
loop_1096:
	sir	0x0A97
loop_1097:
	call	loop_1098
	rdpr	%wstate,	%o3
	ldstub	[%l7 + 0x5B],	%o6
	movue	%fcc3,	%o5,	%l3
loop_1098:
	call	loop_1099
	call	loop_1100
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f24
	sir	0x02CE
loop_1099:
	sdivx	%o1,	%i4,	%g2
loop_1100:
	fpack16	%f18,	%f3
	fmovrsgz	%l6,	%f16,	%f26
	fpsub32s	%f20,	%f20,	%f4
	edge16ln	%o4,	%l2,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x31F, 	%hsys_tick_cmpr
	for	%f10,	%f26,	%f16
	fpadd32s	%f10,	%f30,	%f12
	smulcc	%l0,	%i3,	%g7
	call	loop_1101
	fpsub32	%f28,	%f14,	%f24
	call	loop_1102
	tvs	%xcc,	0x1
loop_1101:
	tpos	%icc,	0x2
	fmovsue	%fcc2,	%f26,	%f4
loop_1102:
	fabsd	%f0,	%f12
	call	loop_1103
	call	loop_1104
	fcmpgt32	%f30,	%f20,	%i2
	wr	%i0,	0x121E,	%pic
loop_1103:
	udivx	%o7,	%l1,	%g4
loop_1104:
	tcs	%xcc,	0x7
	andncc	%i7,	%o0,	%g6
	fmul8ulx16	%f0,	%f20,	%f28
	wrpr 	%g0, 	0x3, 	%gl
	tvc	%icc,	0x0
	fbule,a	%fcc0,	loop_1105
	fbge,a,pt	%fcc2,	loop_1106
	fmovdgu	%xcc,	%f4,	%f10
	fors	%f28,	%f17,	%f25
loop_1105:
	fmovsge	%icc,	%f27,	%f31
loop_1106:
	fmovsgu	%xcc,	%f27,	%f25
	nop
	setx	0xB6491340,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x79F451A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f15,	%f30
	fbe,a	%fcc2,	loop_1107
	call	loop_1108
	call	loop_1109
	movule	%fcc1,	0x026,	%i6
loop_1107:
	taddcc	%l4,	%g1,	%g3
loop_1108:
	fmovdleu	%xcc,	%f10,	%f22
loop_1109:
	udiv	%l5,	%o3,	%o5
	wrpr 	%g0, 	0x3, 	%gl
	membar	0x67
	call	loop_1110
	edge32ln	%l3,	%i4,	%g2
	movrlz	%l6,	%o1,	%o4
	be,a,pt	%icc,	loop_1111
loop_1110:
	call	loop_1112
	call	loop_1113
	srl	%g5,	%l2,	%o2
loop_1111:
	fmovdg	%fcc3,	%f8,	%f24
loop_1112:
	bl,a,pt	%xcc,	loop_1114
loop_1113:
	fmovdu	%fcc2,	%f22,	%f16
	nop
	setx	0xD652FC76EA3F1C37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x6309571AAEE9D2A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f28
	fbue	%fcc3,	loop_1115
loop_1114:
	call	loop_1116
	wrpr	%l0,	%i3,	%tick
	fabss	%f20,	%f12
loop_1115:
	fbule,a,pn	%fcc0,	loop_1117
loop_1116:
	call	loop_1118
	alignaddrl	%g7,	%i0,	%i2
	call	loop_1119
loop_1117:
	fmovdlg	%fcc0,	%f0,	%f24
loop_1118:
	movrlez	%o7,	%g4,	%l1
	fmovsu	%fcc0,	%f27,	%f28
loop_1119:
	bcc,a,pn	%xcc,	loop_1120
	or	%o0,	0x0142,	%i7
	umulcc	%i1,	0x1816,	%i5
	or	%i6,	%l4,	%g1
loop_1120:
	tpos	%xcc,	0x2
	fmovse	%icc,	%f2,	%f15
	xor	%g6,	%l5,	%g3
	or	%o5,	0x1B17,	%o3
	fpsub32s	%f12,	%f18,	%f31
	tleu	%xcc,	0x0
	rd	%fprs,	%l3
	fpsub32	%f10,	%f30,	%f28
	stw	%i4,	[%l7 + 0x5C]
	fnot1	%f16,	%f20
	fmovrdne	%g2,	%f16,	%f16
	call	loop_1121
	call	loop_1122
	xor	%o6,	%l6,	%o4
	membar	0x19
loop_1121:
	fones	%f9
loop_1122:
	wrpr 	%g0, 	0x2, 	%gl
	fmovdl	%fcc2,	%f26,	%f16
	movl	%fcc2,	0x0FA,	%l2
	orncc	%l0,	0x06D5,	%o2
	rdhpr	%htba,	%i3
	smulcc	%g7,	%i0,	%o7
	sir	0x1D5F
	call	loop_1123
	wr	%i2,	%l1,	%pic
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g4
loop_1123:
	call	loop_1124
	fmovdule	%fcc1,	%f28,	%f14
	nop
	fitos	%f4,	%f4
	fstod	%f4,	%f30
	call	loop_1125
loop_1124:
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f26
	fnot1	%f2,	%f20
	call	loop_1126
loop_1125:
	call	loop_1127
	call	loop_1128
	call	loop_1129
loop_1126:
	call	loop_1130
loop_1127:
	fxnor	%f22,	%f28,	%f30
loop_1128:
	call	loop_1131
loop_1129:
	fabss	%f19,	%f25
loop_1130:
	tne	%xcc,	0x6
	call	loop_1132
loop_1131:
	fabss	%f1,	%f21
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
loop_1132:
	call	loop_1133
	call	loop_1134
	call	loop_1135
	fmovdcc	%icc,	%f12,	%f14
loop_1133:
	be	%xcc,	loop_1136
loop_1134:
	flush	%l7 + 0x50
loop_1135:
	mulx	%i7,	%i5,	%i6
	call	loop_1137
loop_1136:
	fmovrdne	%l4,	%f6,	%f12
	nop
	fitod	%f24,	%f8
	call	loop_1138
loop_1137:
	smul	%i1,	0x10DF,	%g6
	call	loop_1139
	fmovdcs	%icc,	%f22,	%f18
loop_1138:
	nop
	fitod	%f2,	%f28
	fdtos	%f28,	%f7
	call	loop_1140
loop_1139:
	fmul8x16al	%f24,	%f18,	%f6
	nop
	setx	0xD461ECBC982931B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x258A0425073AA7F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f0,	%f28
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f4
loop_1140:
	or	%g1,	0x00DA,	%l5
	flushw
	subccc	%o5,	0x19C1,	%o3
	tcs	%xcc,	0x7
	rdpr	%cleanwin,	%g3
	call	loop_1141
	mulscc	%i4,	%g2,	%l3
	fmovsa	%fcc1,	%f4,	%f21
	call	loop_1142
loop_1141:
	call	loop_1143
	sdiv	%l6,	0x00,	%o6
	rdpr	%pil,	%o4
loop_1142:
	fmovdcc	%xcc,	%f20,	%f30
loop_1143:
	fbue,pn	%fcc2,	loop_1144
	fcmpne16	%f0,	%f26,	%o1
	fmovsleu	%icc,	%f23,	%f3
	wrpr	%g5,	%l0,	%pil
loop_1144:
	edge32ln	%o2,	%i3,	%l2
	fcmple32	%f20,	%f18,	%g7
	edge32	%i0,	%i2,	%l1
	call	loop_1145
	call	loop_1146
	movcs	%icc,	0x1D0,	%o7
	fone	%f8
loop_1145:
	brnz	%o0,	loop_1147
loop_1146:
	fmovsg	%icc,	%f20,	%f2
	fzeros	%f15
	fmul8x16	%f31,	%f24,	%f28
loop_1147:
	sra	%g4,	0x0E,	%i5
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f0
	movgu	%icc,	%i7,	%i6
	fnor	%f2,	%f8,	%f22
	fmovsneg	%icc,	%f8,	%f12
	tcs	%xcc,	0x2
	movo	%fcc1,	0x795,	%l4
	call	loop_1148
	srax	%i1,	0x0B,	%g1
	call	loop_1149
	fmovrslz	%g6,	%f0,	%f4
loop_1148:
	umulcc	%o5,	0x0525,	%o3
	call	loop_1150
loop_1149:
	fmovdpos	%xcc,	%f0,	%f12
	call	loop_1151
	call	loop_1152
loop_1150:
	sethi	0x19E1,	%g3
	edge8l	%l5,	%g2,	%l3
loop_1151:
	call	loop_1153
loop_1152:
	tsubcctv	%l6,	0x1596,	%i4
	movule	%fcc2,	0x2CF,	%o6
	fand	%f18,	%f6,	%f4
loop_1153:
	call	loop_1154
	call	loop_1155
	movug	%fcc3,	%o1,	%g5
	call	loop_1156
loop_1154:
	fabss	%f30,	%f13
loop_1155:
	fbuge	%fcc1,	loop_1157
	flushw
loop_1156:
	nop
	setx	0x7802EF5025BF72B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x06189281283ED887,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f24
	rd	%sys_tick_cmpr,	%l0
loop_1157:
	fbo	%fcc2,	loop_1158
	edge16n	%o4,	%i3,	%l2
	fmul8x16au	%f15,	%f3,	%f22
	xnorcc	%g7,	0x0D55,	%o2
loop_1158:
	fmovscs	%xcc,	%f0,	%f10
	nop
	setx	0x4FE299A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x36CC464F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f28,	%f10
	set	0x3A, %o6
	ldsha	[%l7 + %o6] 0x89,	%i2
	call	loop_1159
	rdhpr	%hsys_tick_cmpr,	%i0
	srlx	%l1,	%o0,	%o7
	call	loop_1160
loop_1159:
	ldub	[%l7 + 0x08],	%i5
	fmovscs	%icc,	%f29,	%f23
	fzero	%f10
loop_1160:
	nop
	fitod	%f10,	%f22
	call	loop_1161
	taddcctv	%i7,	%g4,	%i6
	fand	%f24,	%f10,	%f12
	call	loop_1162
loop_1161:
	fone	%f22
	call	loop_1163
	call	loop_1164
loop_1162:
	call	loop_1165
	call	loop_1166
loop_1163:
	nop
	fitos	%f10,	%f15
	fstod	%f15,	%f0
loop_1164:
	call	loop_1167
loop_1165:
	fandnot1s	%f18,	%f19,	%f25
loop_1166:
	tneg	%icc,	0x1
	fabsd	%f14,	%f26
loop_1167:
	wrpr	%l4,	0x0A8B,	%tick
	call	loop_1168
	fmovsneg	%xcc,	%f8,	%f21
	fmovdneg	%icc,	%f6,	%f26
	call	loop_1169
loop_1168:
	fmovsgu	%xcc,	%f20,	%f2
	fzeros	%f8
	movue	%fcc3,	0x03B,	%i1
loop_1169:
	sllx	%g1,	%o5,	%g6
	subcc	%g3,	%o3,	%g2
	bgu,pn	%icc,	loop_1170
	movn	%fcc0,	0x18E,	%l3
	ta	%xcc,	0x1
	fnot1	%f4,	%f2
loop_1170:
	alignaddr	%l6,	%i4,	%l5
	fnot2s	%f20,	%f0
	fpack16	%f16,	%f0
	fpsub32	%f12,	%f20,	%f10
	taddcctv	%o6,	%g5,	%o1
	sub	%l0,	%o4,	%l2
	orcc	%i3,	0x009D,	%g7
	call	loop_1171
	tg	%xcc,	0x0
	call	loop_1172
	fmovdgu	%xcc,	%f10,	%f0
loop_1171:
	fmovdle	%xcc,	%f28,	%f18
	call	loop_1173
loop_1172:
	call	loop_1174
	movl	%fcc1,	0x535,	%i2
	umul	%i0,	%l1,	%o0
loop_1173:
	call	loop_1175
loop_1174:
	call	loop_1176
	movrgez	%o2,	%o7,	%i7
	rdhpr	%htba,	%g4
loop_1175:
	call	loop_1177
loop_1176:
	fandnot2	%f26,	%f24,	%f28
	fmovrdgez	%i5,	%f20,	%f8
	fbo,a	%fcc3,	loop_1178
loop_1177:
	tsubcctv	%i6,	%i1,	%l4
	call	loop_1179
	xnor	%o5,	%g6,	%g3
loop_1178:
	fabss	%f15,	%f14
	bn,a,pn	%xcc,	loop_1180
loop_1179:
	st	%f13,	[%l7 + 0x68]
	taddcctv	%o3,	%g1,	%l3
	fmovsuge	%fcc3,	%f13,	%f15
loop_1180:
	call	loop_1181
	edge16l	%g2,	%l6,	%l5
	call	loop_1182
	call	loop_1183
loop_1181:
	call	loop_1184
	nop
	fitos	%f2,	%f21
	fstod	%f21,	%f26
loop_1182:
	call	loop_1185
loop_1183:
	call	loop_1186
loop_1184:
	fcmpeq32	%f16,	%f8,	%o6
	rd	%pc,	%i4
loop_1185:
	fors	%f9,	%f22,	%f23
loop_1186:
	rdpr	%pil,	%g5
	fbne,a,pt	%fcc2,	loop_1187
	rd	%softint,	%l0
	addccc	%o1,	0x1AFE,	%l2
	alignaddrl	%o4,	%g7,	%i2
loop_1187:
	tneg	%icc,	0x6
	fmovdpos	%icc,	%f8,	%f4
	bshuffle	%f10,	%f8,	%f12
	fmovsneg	%xcc,	%f16,	%f2
	ta	%icc,	0x7
	call	loop_1188
	movre	%i3,	%i0,	%l1
	bcs	%xcc,	loop_1189
	fbu,a	%fcc3,	loop_1190
loop_1188:
	movug	%fcc2,	0x3CD,	%o0
	movne	%fcc1,	0x5B2,	%o2
loop_1189:
	fzeros	%f9
loop_1190:
	fmovsul	%fcc2,	%f29,	%f0
	movpos	%icc,	0x65C,	%i7
	call	loop_1191
	fmovsn	%fcc1,	%f28,	%f19
	fmul8sux16	%f28,	%f16,	%f16
	fmovdgu	%icc,	%f2,	%f16
loop_1191:
	orncc	%g4,	0x13D3,	%i5
	move	%icc,	%i6,	%i1
	fmovso	%fcc1,	%f25,	%f22
	call	loop_1192
	call	loop_1193
	call	loop_1194
	bvc,a	%icc,	loop_1195
loop_1192:
	fnands	%f13,	%f20,	%f13
loop_1193:
	edge32l	%l4,	%o5,	%g6
loop_1194:
	movrgez	%g3,	%o3,	%g1
loop_1195:
	call	loop_1196
	fmovsu	%fcc2,	%f18,	%f3
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf8
	membar	#Sync
loop_1196:
	call	loop_1197
	fsrc2	%f30,	%f28
	call	loop_1198
	call	loop_1199
loop_1197:
	sth	%o7,	[%l7 + 0x50]
	fpsub32s	%f17,	%f16,	%f6
loop_1198:
	movpos	%xcc,	0x267,	%g2
loop_1199:
	fandnot2	%f8,	%f4,	%f12
	fmovs	%f5,	%f21
	call	loop_1200
	call	loop_1201
	bpos,a,pt	%xcc,	loop_1202
	andncc	%l3,	%l6,	%o6
loop_1200:
	nop
	fitos	%f10,	%f14
	fstod	%f14,	%f18
loop_1201:
	call	loop_1203
loop_1202:
	edge16ln	%l5,	%i4,	%g5
	call	loop_1204
	fmovdneg	%xcc,	%f28,	%f8
loop_1203:
	call	loop_1205
	mulx	%l0,	%o1,	%o4
loop_1204:
	fmovrdgz	%g7,	%f22,	%f6
	fmovrse	%l2,	%f23,	%f7
loop_1205:
	movue	%fcc3,	0x3C9,	%i2
	mulscc	%i0,	%l1,	%o0
	call	loop_1206
	fmovdul	%fcc3,	%f4,	%f0
	fmovrdlz	%i3,	%f6,	%f18
	edge8	%o2,	%i7,	%g4
loop_1206:
	fabss	%f15,	%f12
	tn	%icc,	0x4
	edge32	%i6,	%i1,	%l4
	sllx	%i5,	%g6,	%g3
	tsubcc	%o3,	%o5,	%g1
	tgu	%xcc,	0x0
	call	loop_1207
	subc	%o7,	%l3,	%l6
	fmovsvs	%xcc,	%f6,	%f2
	call	loop_1208
loop_1207:
	fmovdcc	%icc,	%f30,	%f14
	swap	[%l7 + 0x5C],	%o6
	fmovdpos	%icc,	%f22,	%f30
loop_1208:
	rd	%softint,	%l5
	fpackfix	%f4,	%f19
	call	loop_1209
	fmovdcc	%icc,	%f0,	%f16
	fsrc2	%f8,	%f24
	tcs	%xcc,	0x7
loop_1209:
	call	loop_1210
	nop
	set	0x3D, %g5
	ldstub	[%l7 + %g5],	%g2
	tge	%xcc,	0x7
	fmovsge	%fcc1,	%f1,	%f26
loop_1210:
	movre	%g5,	%l0,	%o1
	subccc	%o4,	0x1098,	%i4
	fornot2	%f20,	%f30,	%f6
	prefetch	[%l7 + 0x4C],	 4
	movu	%fcc0,	0x0ED,	%l2
	nop
	set	0x78, %o4
	flush	%l7 + %o4
	movo	%fcc2,	0x203,	%i2
	fxnors	%f3,	%f0,	%f16
	fmuld8sux16	%f11,	%f28,	%f2
	wr	%g7,	%l1,	%y
	fcmpne32	%f4,	%f20,	%i0
	nop
	fitos	%f3,	%f12
	fstox	%f12,	%f16
	fcmple16	%f2,	%f18,	%o0
	fmovdule	%fcc2,	%f14,	%f2
	nop
	setx	0x0883B3BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x2699E721,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f26,	%f4
	call	loop_1211
	udivx	%o2,	%i3,	%g4
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f4
	fxtod	%f4,	%f30
	fmovdge	%fcc2,	%f26,	%f6
loop_1211:
	call	loop_1212
	xor	%i7,	%i1,	%l4
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f3
	fmovsvc	%xcc,	%f9,	%f18
loop_1212:
	udiv	%i5,	0x00,	%g6
	call	loop_1213
	fba	%fcc0,	loop_1214
	call	loop_1215
	call	loop_1216
loop_1213:
	nop

loop_1214:
	nop

loop_1215:
	nop

loop_1216:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 20
!	Type a   	: 29
!	Type x   	: 9
!	Type cti   	: 147
!	Type f   	: 156
!	Type i   	: 139
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x6F4D1BD7
.word 0xD5CEB479
.word 0xB4A32BA1
.word 0x53977A41
.word 0x4C5C73CD
.word 0xACD0FF33
.word 0x2416C50E
.word 0x6F4F83DA
.word 0x22626110
.word 0xADAA94DC
.word 0xF69BED05
.word 0xF9DEAA99
.word 0x60FAD575
.word 0x2A0BC68E
.word 0xC7FD39E5
.word 0x72E02DEC
.word 0xE0BBC860
.word 0x46196080
.word 0x43203291
.word 0x009939E2
.word 0x322F4F78
.word 0x3B61FDA6
.word 0x362B5DA4
.word 0xDC4A0C0A
.word 0xAE67EA63
.word 0xA25B01BD
.word 0xC0FE211A
.word 0x5D4C7DDF
.word 0x1C554924
.word 0x1C2B388C
.word 0xE5BFA66E
.word 0x33C63C07
.word 0x8D76F63F
.word 0x461990FF
.word 0xE31C13AE
.word 0x4684759F
.word 0xAC9968EF
.word 0xF32C093B
.word 0x3F806BB9
.word 0x56381449
.word 0x99779D86
.word 0x80CDE5E7
.word 0xD657BCCC
.word 0x2D92B959
.word 0xBDE461F1
.word 0x9951DA78
.word 0x66A913BA
.word 0xA64401F9
.word 0xE2A4FFEB
.word 0x95E54CB9
.word 0x7771513C
.word 0x0812C910
.word 0x6E883D90
.word 0xC72BA848
.word 0x137695D5
.word 0x5DFB255F
.word 0xD6D634A3
.word 0x6D2E6CB6
.word 0x2022CBE6
.word 0xE7C1422B
.word 0x377D1815
.word 0xE2ABBC8F
.word 0x706EF05F
.word 0x206E7D1D
.end
