/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_07.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=7575814724"
.ident "Thu Dec 11 11:47:10 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_07.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x5,	%g1
	set	0x4,	%g2
	set	0x1,	%g3
	set	0x6,	%g4
	set	0x9,	%g5
	set	0x5,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0xB,	%i2
	set	-0xA,	%i3
	set	-0xE,	%i4
	set	-0x5,	%i5
	set	-0xB,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x68ED57CA,	%l0
	set	0x266423E4,	%l1
	set	0x1C093E66,	%l2
	set	0x564A057D,	%l3
	set	0x54321BFC,	%l4
	set	0x668E8788,	%l5
	set	0x40BEAADB,	%l6
	!# Output registers
	set	-0x1961,	%o0
	set	-0x11E5,	%o1
	set	0x04BF,	%o2
	set	0x01D7,	%o3
	set	0x1F96,	%o4
	set	0x1247,	%o5
	set	0x13CA,	%o6
	set	-0x0017,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	call	loop_1
	fornot2	%f30,	%f18,	%f24
	nop
	setx	0xF5A646D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xF1DE309F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f23,	%f18
	tvs	%icc,	0x3
loop_1:
	fabss	%f2,	%f0
	call	loop_2
	nop
	setx	0xD97C2FBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x5F207773,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f19,	%f22
	fmovrslz	%i5,	%f19,	%f15
	fmovda	%xcc,	%f0,	%f12
loop_2:
	call	loop_3
	or	%i1,	%i2,	%l0
	fmovsge	%fcc1,	%f25,	%f11
	array8	%i7,	%l5,	%o1
loop_3:
	call	loop_4
	edge16	%o4,	%g4,	%g2
	fmovdo	%fcc0,	%f18,	%f2
	bmask	%l6,	%i3,	%l4
loop_4:
	movpos	%icc,	%g1,	%i6
	fble,pt	%fcc1,	loop_5
	nop
	setx	0x27AE0F7A24B5F048,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	rdpr	%cansave,	%g7
	call	loop_6
loop_5:
	udivcc	%o7,	%o0,	%o6
	fpadd32	%f18,	%f30,	%f20
	nop
	set	0x20, %i0
	stx	%g3,	[%l7 + %i0]
loop_6:
	call	loop_7
	call	loop_8
	tsubcc	%o3,	0x14A7,	%g6
	fzeros	%f21
loop_7:
	ldsh	[%l7 + 0x34],	%i4
loop_8:
	call	loop_9
	movleu	%icc,	0x637,	%i0
	te	%xcc,	0x5
	call	loop_10
loop_9:
	brgz,pn	%o2,	loop_11
	fpack32	%f16,	%f0,	%f12
	fcmpd	%fcc1,	%f12,	%f26
loop_10:
	movrne	%l3,	%g5,	%o5
loop_11:
	mulscc	%l2,	%i5,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6A8, 	%hsys_tick_cmpr
	tgu	%xcc,	0x7
	stbar
	array16	%l1,	%l5,	%i7
	fmul8x16al	%f19,	%f26,	%f4
	fmuld8sux16	%f8,	%f24,	%f2
	call	loop_12
	orcc	%o4,	%g4,	%o1
	tge	%xcc,	0x5
	fmovsul	%fcc1,	%f4,	%f18
loop_12:
	fmovslg	%fcc0,	%f26,	%f13
	rdpr	%cansave,	%l6
	alignaddrl	%i3,	%g2,	%g1
	wrpr	%l4,	%i6,	%tick
	nop
	fitos	%f0,	%f13
	call	loop_13
	fmovdleu	%icc,	%f10,	%f2
	call	loop_14
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f19
loop_13:
	movgu	%icc,	0x3EA,	%o7
	fands	%f5,	%f4,	%f28
loop_14:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_15
	movneg	%icc,	0x2DC,	%o6
	fmovsa	%xcc,	%f17,	%f1
	call	loop_16
loop_15:
	call	loop_17
	fmovrse	%o0,	%f5,	%f9
	fcmpeq32	%f16,	%f12,	%g3
loop_16:
	ldsh	[%l7 + 0x22],	%o3
loop_17:
	call	loop_18
	xnor	%g6,	%i4,	%i0
	call	loop_19
	call	loop_20
loop_18:
	fmovrdgez	%l3,	%f8,	%f8
	sethi	0x1FA5,	%o2
loop_19:
	call	loop_21
loop_20:
	fornot2s	%f29,	%f16,	%f15
	call	loop_22
	fornot2s	%f3,	%f9,	%f16
loop_21:
	fandnot2	%f6,	%f30,	%f28
	call	loop_23
loop_22:
	ldd	[%l7 + 0x70],	%f20
	membar	0x52
	nop
	setx	0xCEDB799C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xD4061DCE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f31,	%f31
loop_23:
	addcc	%o5,	%g5,	%l2
	nop
	fitos	%f8,	%f3
	fstox	%f3,	%f22
	fxtos	%f22,	%f22
	fxnor	%f2,	%f14,	%f8
	rdhpr	%hpstate,	%i1
	call	loop_24
	edge32l	%i2,	%i5,	%l0
	fpadd32	%f24,	%f6,	%f26
	call	loop_25
loop_24:
	srax	%l1,	%i7,	%o4
	edge8ln	%l5,	%o1,	%g4
	call	loop_26
loop_25:
	movvs	%xcc,	0x0C2,	%i3
	call	loop_27
	call	loop_28
loop_26:
	call	loop_29
	fmovdle	%icc,	%f14,	%f14
loop_27:
	fcmpgt32	%f0,	%f12,	%g2
loop_28:
	call	loop_30
loop_29:
	brlez,a,pn	%l6,	loop_31
	fandnot1s	%f25,	%f12,	%f28
	fnor	%f30,	%f26,	%f24
loop_30:
	fmovdug	%fcc3,	%f14,	%f8
loop_31:
	call	loop_32
	fpsub16	%f16,	%f30,	%f4
	movrlz	%g1,	%l4,	%o7
	call	loop_33
loop_32:
	tneg	%xcc,	0x4
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f10
	rdpr	%gl,	%g7
loop_33:
	fbo,a	%fcc1,	loop_34
	call	loop_35
	orncc	%o6,	%i6,	%g3
	fcmpne16	%f10,	%f26,	%o3
loop_34:
	array16	%o0,	%i4,	%g6
loop_35:
	tcs	%xcc,	0x3
	fmovrdgez	%i0,	%f26,	%f20
	call	loop_36
	movrne	%o2,	%o5,	%l3
	movu	%fcc0,	%l2,	%g5
	call	loop_37
loop_36:
	nop
	fitos	%f0,	%f17
	fstod	%f17,	%f14
	fcmpeq16	%f26,	%f20,	%i2
	fnors	%f18,	%f30,	%f5
loop_37:
	array32	%i5,	%i1,	%l0
	fmovrse	%l1,	%f29,	%f23
	bge,a,pt	%icc,	loop_38
	edge8n	%o4,	%l5,	%i7
	fmovsg	%fcc1,	%f1,	%f22
	movle	%icc,	0x34F,	%o1
loop_38:
	call	loop_39
	call	loop_40
	movre	%g4,	0x3BE,	%g2
	rdpr	%pil,	%l6
loop_39:
	fpack32	%f20,	%f8,	%f4
loop_40:
	call	loop_41
	srlx	%g1,	%l4,	%o7
	fpack32	%f8,	%f24,	%f20
	call	loop_42
loop_41:
	fnot2	%f10,	%f10
	fmovsa	%icc,	%f31,	%f18
	movu	%fcc0,	0x518,	%i3
loop_42:
	call	loop_43
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f24
	bshuffle	%f12,	%f6,	%f8
	tpos	%xcc,	0x0
loop_43:
	edge8	%o6,	%g7,	%i6
	call	loop_44
	edge8n	%o3,	%o0,	%i4
	subc	%g6,	%g3,	%i0
	tne	%icc,	0x6
loop_44:
	nop
	fitos	%f3,	%f31
	fstoi	%f31,	%f10
	fmovrdne	%o2,	%f24,	%f14
	edge8n	%l3,	%o5,	%l2
	fmovrslez	%g5,	%f23,	%f18
	fnands	%f11,	%f11,	%f4
	fmovda	%fcc3,	%f0,	%f12
	fcmple16	%f4,	%f18,	%i5
	movvc	%xcc,	%i2,	%l0
	nop
	fitod	%f8,	%f20
	sir	0x1E35
	fmovdge	%fcc1,	%f8,	%f20
	call	loop_45
	call	loop_46
	fmovd	%f20,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_45:
	sll	%l1,	%i7,	%o1
loop_46:
	fnegd	%f8,	%f10
	xor	%l5,	%g2,	%g4
	fcmpne16	%f20,	%f10,	%g1
	call	loop_47
	call	loop_48
	fbl,pn	%fcc3,	loop_49
	fmovsl	%fcc0,	%f8,	%f5
loop_47:
	call	loop_50
loop_48:
	andncc	%l6,	0x0315,	%l4
loop_49:
	bmask	%i3,	%o6,	%o7
	call	loop_51
loop_50:
	umulcc	%i6,	0x1BEB,	%o3
	call	loop_52
	call	loop_53
loop_51:
	fbn	%fcc1,	loop_54
	smulcc	%o0,	%i4,	%g6
loop_52:
	wrpr	%g7,	%i0,	%pil
loop_53:
	nop
	set	0x72, %l2
	lduha	[%l7 + %l2] 0x10,	%g3
loop_54:
	add	%o2,	0x02B4,	%o5
	call	loop_55
	fors	%f12,	%f26,	%f8
	fmovsg	%icc,	%f23,	%f18
	call	loop_56
loop_55:
	call	loop_57
	call	loop_58
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%l2
loop_56:
	edge32l	%g5,	%i5,	%l2
loop_57:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l0
loop_58:
	fmovsleu	%icc,	%f19,	%f25
	fmovdne	%xcc,	%f28,	%f30
	call	loop_59
	call	loop_60
	subccc	%i2,	0x0B62,	%o4
	ba,pn	%icc,	loop_61
loop_59:
	flush	%l7 + 0x64
loop_60:
	movue	%fcc3,	0x6B1,	%l1
	call	loop_62
loop_61:
	popc	0x1966,	%i7
	call	loop_63
	fmovdlg	%fcc0,	%f14,	%f4
loop_62:
	call	loop_64
	call	loop_65
loop_63:
	nop
	set	0x40, %g2
	std	%f30,	[%l7 + %g2]
	subc	%i1,	%l5,	%o1
loop_64:
	fmovdu	%fcc2,	%f4,	%f8
loop_65:
	call	loop_66
	call	loop_67
	fmul8ulx16	%f28,	%f22,	%f18
	alignaddr	%g2,	%g4,	%g1
loop_66:
	brgez,pt	%l6,	loop_68
loop_67:
	call	loop_69
	wr	%i3,	0x08B3,	%ccr
	call	loop_70
loop_68:
	fcmpgt32	%f2,	%f8,	%l4
loop_69:
	call	loop_71
	bge,a	%xcc,	loop_72
loop_70:
	xorcc	%o7,	%i6,	%o3
	sdivx	%o6,	%o0,	%g6
loop_71:
	fmovdcc	%icc,	%f18,	%f20
loop_72:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x805, 	%hsys_tick_cmpr
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f21
	fnegs	%f14,	%f30
	fpadd32	%f8,	%f16,	%f0
	fcmpes	%fcc1,	%f22,	%f3
	fmovda	%icc,	%f26,	%f4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i0
	fmovrdne	%o2,	%f0,	%f6
	call	loop_73
	nop
	set	0x38, %i2
	stx	%o5,	[%l7 + %i2]
	movrgez	%g3,	%g5,	%l3
	array32	%l2,	%l0,	%i2
loop_73:
	fzero	%f22
	array16	%o4,	%l1,	%i5
	add	%i7,	%i1,	%o1
	array16	%g2,	%l5,	%g1
	siam	0x6
	xorcc	%g4,	0x09FB,	%l6
	call	loop_74
	call	loop_75
	edge16n	%l4,	%i3,	%i6
	fandnot1s	%f30,	%f27,	%f13
loop_74:
	call	loop_76
loop_75:
	fone	%f12
	fmovdul	%fcc1,	%f4,	%f2
	call	loop_77
loop_76:
	wr	%o3,	%o7,	%pic
	call	loop_78
	swap	[%l7 + 0x08],	%o6
loop_77:
	array16	%g6,	%o0,	%i4
	tg	%icc,	0x7
loop_78:
	mulx	%i0,	0x1873,	%g7
	st	%f28,	[%l7 + 0x6C]
	andn	%o2,	%g3,	%g5
	movue	%fcc1,	%l3,	%o5
	array16	%l0,	%i2,	%l2
	call	loop_79
	orn	%l1,	%o4,	%i5
	fbue,pt	%fcc3,	loop_80
	call	loop_81
loop_79:
	rdhpr	%htba,	%i1
	call	loop_82
loop_80:
	flushw
loop_81:
	call	loop_83
	andcc	%o1,	0x0A3D,	%g2
loop_82:
	fzeros	%f15
	fmovsuge	%fcc2,	%f19,	%f28
loop_83:
	fsrc1s	%f13,	%f2
	wr	%l5,	0x05C3,	%clear_softint
	alignaddrl	%i7,	%g1,	%l6
	call	loop_84
	rd	%fprs,	%l4
	call	loop_85
	fcmpes	%fcc3,	%f17,	%f3
loop_84:
	stx	%g4,	[%l7 + 0x18]
	call	loop_86
loop_85:
	fcmpd	%fcc3,	%f14,	%f8
	call	loop_87
	movl	%fcc0,	%i3,	%i6
loop_86:
	call	loop_88
	fands	%f20,	%f31,	%f13
loop_87:
	fmovsule	%fcc1,	%f21,	%f19
	rdpr	%canrestore,	%o7
loop_88:
	fornot2s	%f26,	%f24,	%f9
	smulcc	%o6,	%g6,	%o0
	flushw
	call	loop_89
	fbg,a	%fcc2,	loop_90
	bl,a,pn	%xcc,	loop_91
	popc	%o3,	%i0
loop_89:
	alignaddr	%i4,	%o2,	%g7
loop_90:
	call	loop_92
loop_91:
	rdpr	%cleanwin,	%g5
	tle	%xcc,	0x3
	fpadd32	%f16,	%f28,	%f10
loop_92:
	sdivcc	%g3,	%o5,	%l0
	call	loop_93
	fmovdgu	%icc,	%f14,	%f28
	nop
	set	0x30, %l5
	stw	%l3,	[%l7 + %l5]
	fmovde	%xcc,	%f10,	%f18
loop_93:
	movo	%fcc0,	%l2,	%i2
	call	loop_94
	movrgez	%l1,	%o4,	%i1
	edge16	%o1,	%g2,	%i5
	fmovrde	%l5,	%f16,	%f10
loop_94:
	edge8n	%i7,	%l6,	%g1
	bvc,a	%xcc,	loop_95
	bcs	%xcc,	loop_96
	rdhpr	%hpstate,	%l4
	addcc	%g4,	%i3,	%i6
loop_95:
	fzeros	%f8
loop_96:
	call	loop_97
	call	loop_98
	call	loop_99
	call	loop_100
loop_97:
	fexpand	%f21,	%f26
loop_98:
	call	loop_101
loop_99:
	call	loop_102
loop_100:
	fmovslg	%fcc3,	%f10,	%f11
	call	loop_103
loop_101:
	call	loop_104
loop_102:
	call	loop_105
	array32	%o7,	%o6,	%g6
loop_103:
	fmovrsgz	%o3,	%f26,	%f16
loop_104:
	call	loop_106
loop_105:
	tcc	%icc,	0x3
	movvc	%xcc,	%o0,	%i0
	set	0x5C, %i6
	stwa	%o2,	[%l7 + %i6] 0x11
loop_106:
	fands	%f22,	%f17,	%f26
	xnor	%i4,	0x1AD8,	%g5
	nop
	setx	0xCCBF2549EED19877,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2EBF0A6F163D1DA7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f24,	%f20
	fpadd32s	%f16,	%f29,	%f8
	fmovda	%icc,	%f8,	%f12
	movrlez	%g3,	%o5,	%l0
	rdpr	%cansave,	%l3
	call	loop_107
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f6
	fmovdvc	%icc,	%f8,	%f6
	call	loop_108
loop_107:
	wrpr	%g7,	%l2,	%tick
	sdiv	%l1,	0x00,	%o4
	tcs	%xcc,	0x7
loop_108:
	call	loop_109
	edge8l	%i1,	%o1,	%g2
	fmovsu	%fcc2,	%f26,	%f21
	wrpr	%i2,	%i5,	%cwp
loop_109:
	fcmped	%fcc2,	%f28,	%f14
	tsubcc	%i7,	%l5,	%l6
	movo	%fcc3,	0x750,	%l4
	edge8ln	%g1,	%i3,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x440, 	%hsys_tick_cmpr
	call	loop_110
	fcmpgt16	%f10,	%f18,	%o7
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f8
	call	loop_111
loop_110:
	fmovdn	%icc,	%f22,	%f20
	call	loop_112
	fmovsn	%fcc0,	%f28,	%f20
loop_111:
	call	loop_113
	call	loop_114
loop_112:
	fmovrslz	%o6,	%f0,	%f13
	nop
	setx	0xDD7E5403A96C44A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f8
loop_113:
	call	loop_115
loop_114:
	call	loop_116
	array16	%g6,	%o0,	%i0
	fmovsgu	%icc,	%f31,	%f30
loop_115:
	movg	%xcc,	%o3,	%i4
loop_116:
	andn	%o2,	0x18EF,	%g5
	addcc	%g3,	%o5,	%l0
	fnand	%f14,	%f10,	%f12
	call	loop_117
	fors	%f25,	%f14,	%f29
	fmovde	%xcc,	%f12,	%f4
	fnot2	%f24,	%f14
loop_117:
	fmovrsne	%g7,	%f27,	%f17
	wr	%l3,	%l2,	%clear_softint
	call	loop_118
	tcs	%icc,	0x1
	call	loop_119
	srax	%l1,	0x06,	%o4
loop_118:
	call	loop_120
	subcc	%o1,	0x17F4,	%g2
loop_119:
	movleu	%icc,	0x463,	%i2
	call	loop_121
loop_120:
	call	loop_122
	call	loop_123
	andncc	%i5,	0x1DCD,	%i7
loop_121:
	call	loop_124
loop_122:
	fpsub16	%f20,	%f6,	%f4
loop_123:
	fmovsug	%fcc2,	%f26,	%f25
	movlg	%fcc2,	0x250,	%i1
loop_124:
	fpsub16	%f2,	%f16,	%f14
	or	%l6,	0x14C7,	%l4
	fmovrslez	%g1,	%f10,	%f2
	fnand	%f18,	%f14,	%f16
	xnor	%l5,	0x0A64,	%i3
	fors	%f5,	%f7,	%f15
	fmul8x16al	%f31,	%f17,	%f4
	edge16n	%g4,	%o7,	%o6
	sdiv	%i6,	0x00,	%o0
	xnor	%i0,	0x1EB5,	%g6
	fpadd32	%f30,	%f8,	%f22
	bne,a,pn	%icc,	loop_125
	call	loop_126
	nop
	setx	loop_127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021200001406,	%l0,	%l1
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
	call	loop_128
loop_125:
	edge32ln	%o3,	%o2,	%g5
loop_126:
	wrpr	%i4,	%g3,	%cwp
loop_127:
	nop
	set	0x12, %g6
	ldsh	[%l7 + %g6],	%l0
loop_128:
	st	%f8,	[%l7 + 0x78]
	movrlz	%o5,	%g7,	%l2
	tvc	%xcc,	0x4
	te	%icc,	0x1
	tne	%icc,	0x5
	fpsub16	%f16,	%f8,	%f16
	fmovdcs	%icc,	%f24,	%f2
	fmovsn	%icc,	%f12,	%f1
	fpackfix	%f10,	%f15
	tsubcc	%l3,	%l1,	%o4
	rdpr	%wstate,	%o1
	call	loop_129
	addcc	%i2,	0x1DD3,	%g2
	sdivx	%i7,	%i5,	%i1
	fnors	%f2,	%f21,	%f12
loop_129:
	fmovdl	%icc,	%f18,	%f0
	tvs	%xcc,	0x5
	fmovrsne	%l6,	%f0,	%f10
	bge,a,pn	%icc,	loop_130
	tl	%icc,	0x6
	set	0x78, %o4
	stda	%g0,	[%l7 + %o4] 0xeb
	membar	#Sync
loop_130:
	nop
	set	0x20, %l6
	swapa	[%l7 + %l6] 0x10,	%l4
	fbuge,pt	%fcc1,	loop_131
	for	%f2,	%f14,	%f26
	call	loop_132
	fnot2s	%f6,	%f18
loop_131:
	fors	%f31,	%f22,	%f28
	fornot2s	%f28,	%f26,	%f27
loop_132:
	fsrc2s	%f26,	%f18
	tg	%icc,	0x6
	fzeros	%f17
	subc	%l5,	0x0137,	%i3
	fmovsleu	%icc,	%f22,	%f7
	bmask	%g4,	%o7,	%o6
	fmovdue	%fcc3,	%f26,	%f2
	fcmpgt16	%f28,	%f2,	%o0
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x66] %asi,	%i0
	movrne	%g6,	%o3,	%o2
	edge8n	%i6,	%g5,	%g3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i4
	movul	%fcc0,	0x50D,	%o5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	addcc	%g7,	0x10E7,	%l2
	tge	%icc,	0x5
	call	loop_133
	or	%l3,	0x0910,	%l1
	movleu	%icc,	%o4,	%l0
	sra	%o1,	0x06,	%i2
loop_133:
	tl	%icc,	0x2
	alignaddr	%i7,	%i5,	%g2
	fmovsneg	%xcc,	%f1,	%f11
	fmovrdgz	%l6,	%f2,	%f26
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f8
	set	0x1A, %o1
	ldstuba	[%l7 + %o1] 0x11,	%i1
	fmovsn	%xcc,	%f27,	%f3
	nop
	setx	0xD6B3A830,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f10
	fmovs	%f12,	%f12
	bleu	%xcc,	loop_134
	movul	%fcc1,	%g1,	%l4
	fsrc2	%f20,	%f14
	fsrc2	%f0,	%f24
loop_134:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i3
	fand	%f6,	%f6,	%f12
	call	loop_135
	edge8ln	%g4,	%o7,	%l5
	fmovsg	%icc,	%f1,	%f13
	call	loop_136
loop_135:
	fpack16	%f20,	%f26
	fmovdlg	%fcc1,	%f10,	%f20
	fmovrslz	%o0,	%f4,	%f8
loop_136:
	fmovda	%xcc,	%f18,	%f2
	tvc	%xcc,	0x3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 26
!	Type a   	: 26
!	Type x   	: 10
!	Type cti   	: 136
!	Type f   	: 157
!	Type i   	: 145
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
	set	0xE,	%g1
	set	0xF,	%g2
	set	0x0,	%g3
	set	0x5,	%g4
	set	0xD,	%g5
	set	0xB,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x7,	%i1
	set	-0x2,	%i2
	set	-0xD,	%i3
	set	-0x6,	%i4
	set	-0xA,	%i5
	set	-0x8,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x31266BB1,	%l0
	set	0x3A44CD45,	%l1
	set	0x24F4A5D3,	%l2
	set	0x0F9CD96F,	%l3
	set	0x365CD60E,	%l4
	set	0x2E9E6CD8,	%l5
	set	0x787300A4,	%l6
	!# Output registers
	set	-0x0A4C,	%o0
	set	-0x1DB0,	%o1
	set	-0x1042,	%o2
	set	0x1EC4,	%o3
	set	-0x1BFD,	%o4
	set	0x02FD,	%o5
	set	-0x13BF,	%o6
	set	-0x0A27,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	tvc	%icc,	0x6
	fsrc2s	%f11,	%f27
	tcs	%icc,	0x4
	bpos,a,pt	%xcc,	loop_137
	rdhpr	%hintp,	%i0
	movrgz	%o6,	0x288,	%g6
	call	loop_138
loop_137:
	call	loop_139
	movlg	%fcc1,	%o2,	%o3
	nop
	fitos	%f6,	%f18
	fstoi	%f18,	%f26
loop_138:
	fcmpd	%fcc3,	%f14,	%f20
loop_139:
	fmovdule	%fcc1,	%f22,	%f28
	alignaddr	%i6,	%g3,	%g5
	call	loop_140
	brlz,a,pt	%o5,	loop_141
	fmovslg	%fcc1,	%f9,	%f7
	orn	%i4,	%g7,	%l3
loop_140:
	mulscc	%l1,	%l2,	%l0
loop_141:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%o1
	movl	%fcc2,	%i2,	%i7
	fmovrsgez	%o4,	%f16,	%f4
	movvc	%xcc,	0x4E5,	%g2
	edge16ln	%i5,	%i1,	%l6
	fmovsug	%fcc2,	%f7,	%f25
	call	loop_142
	fpadd32s	%f25,	%f31,	%f12
	fbug	%fcc1,	loop_143
	call	loop_144
loop_142:
	call	loop_145
	wrpr 	%g0, 	0x3, 	%gl
loop_143:
	fbe,a,pt	%fcc0,	loop_146
loop_144:
	fpsub16s	%f16,	%f14,	%f1
loop_145:
	for	%f14,	%f14,	%f20
	for	%f6,	%f26,	%f12
loop_146:
	call	loop_147
	addcc	%l4,	0x1812,	%g4
	nop
	fitos	%f1,	%f21
	fstod	%f21,	%f22
	call	loop_148
loop_147:
	st	%fsr,	[%l7 + 0x48]
	call	loop_149
	fmovdul	%fcc1,	%f0,	%f12
loop_148:
	sll	%o7,	0x1E,	%o0
	wr	%l5,	0x1D68,	%ccr
loop_149:
	nop
	set	0x1C, %o0
	stb	%o6,	[%l7 + %o0]
	fpackfix	%f18,	%f17
	addccc	%i0,	%g6,	%o3
	wr	%g0,	0x10,	%asi
	stba	%i6,	[%l7 + 0x58] %asi
	rdhpr	%hintp,	%o2
	fmovdn	%icc,	%f28,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_150
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014100001406,	%l0,	%l1
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
	movge	%icc,	0x14A,	%o5
	fxors	%f8,	%f10,	%f20
loop_150:
	brlez	%i4,	loop_152
loop_151:
	andn	%g7,	%l1,	%l2
	fmovdvs	%icc,	%f24,	%f22
	movue	%fcc2,	%l0,	%l3
loop_152:
	fmovrdlz	%o1,	%f8,	%f22
	call	loop_153
	call	loop_154
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%i2
	fmovrde	%i7,	%f8,	%f0
loop_153:
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%g2
loop_154:
	call	loop_155
	fmovdpos	%icc,	%f28,	%f26
	brgz,a,pt	%o4,	loop_156
	wrpr	%i5,	%i1,	%cwp
loop_155:
	array16	%l6,	%i3,	%g1
	movcs	%icc,	%g4,	%l4
loop_156:
	nop
	setx loop_157, %l0, %l1
	jmpl %l1, %o7
	rdpr	%pil,	%o0
	movneg	%xcc,	%l5,	%o6
	nop
	fitod	%f10,	%f24
	fdtox	%f24,	%f16
loop_157:
	rdpr	%tl,	%g6
	fcmped	%fcc0,	%f0,	%f16
	fmul8x16au	%f14,	%f30,	%f26
	nop
	fitod	%f16,	%f8
	nop
	fitos	%f9,	%f19
	fstox	%f19,	%f26
	fxtos	%f26,	%f31
	call	loop_158
	ld	[%l7 + 0x08],	%f14
	wrpr	%i0,	%i6,	%tick
	nop
	setx	0x1E83EFA652397608,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f2
loop_158:
	rd	%softint,	%o3
	call	loop_159
	fbne,a,pt	%fcc0,	loop_160
	call	loop_161
	movpos	%xcc,	0x115,	%o2
loop_159:
	mulx	%g3,	%g5,	%o5
loop_160:
	fmul8x16au	%f18,	%f24,	%f20
loop_161:
	call	loop_162
	ldx	[%l7 + 0x50],	%g7
	fmovde	%fcc1,	%f18,	%f0
	tcs	%xcc,	0x5
loop_162:
	movule	%fcc1,	%i4,	%l2
	movug	%fcc3,	%l0,	%l1
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f1
	membar	0x29
	movule	%fcc0,	0x3F9,	%o1
	movge	%xcc,	0x0EC,	%i2
	call	loop_163
	call	loop_164
	fmuld8ulx16	%f10,	%f30,	%f12
	bshuffle	%f30,	%f16,	%f8
loop_163:
	orcc	%i7,	%l3,	%o4
loop_164:
	call	loop_165
	call	loop_166
	movgu	%xcc,	%g2,	%i1
	fnand	%f6,	%f28,	%f6
loop_165:
	fsrc2	%f0,	%f14
loop_166:
	nop
	setx	0xE42D2AFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x9FD62ADB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f3,	%f6
	andn	%i5,	%l6,	%i3
	call	loop_167
	ble,a	%xcc,	loop_168
	fandnot1s	%f4,	%f20,	%f10
	fbe,a,pt	%fcc2,	loop_169
loop_167:
	fmovda	%xcc,	%f0,	%f6
loop_168:
	movvc	%xcc,	0x124,	%g4
	call	loop_170
loop_169:
	fmovdgu	%xcc,	%f16,	%f14
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x5D] %asi,	%g1
loop_170:
	fmovrdlez	%o7,	%f18,	%f10
	wr	%g0,	0xeb,	%asi
	stba	%l4,	[%l7 + 0x56] %asi
	membar	#Sync
	fornot2	%f24,	%f8,	%f6
	fmovrse	%l5,	%f5,	%f3
	call	loop_171
	rdhpr	%hsys_tick_cmpr,	%o6
	call	loop_172
	addccc	%g6,	%i0,	%i6
loop_171:
	fmovsge	%xcc,	%f2,	%f21
	tvs	%xcc,	0x7
loop_172:
	call	loop_173
	fmovrsgz	%o3,	%f20,	%f11
	call	loop_174
	fbule,pn	%fcc0,	loop_175
loop_173:
	fmovdleu	%icc,	%f24,	%f28
	call	loop_176
loop_174:
	call	loop_177
loop_175:
	edge16	%o2,	%o0,	%g5
	fbl,a	%fcc2,	loop_178
loop_176:
	tgu	%icc,	0x5
loop_177:
	array16	%g3,	%o5,	%g7
	tcc	%icc,	0x6
loop_178:
	nop
	set	0x24, %i7
	sta	%f6,	[%l7 + %i7] 0x19
	ba,a	%xcc,	loop_179
	edge16ln	%l2,	%l0,	%i4
	edge32	%l1,	%o1,	%i7
	fxnor	%f30,	%f0,	%f20
loop_179:
	call	loop_180
	call	loop_181
	tvc	%xcc,	0x3
	fmovrslez	%l3,	%f16,	%f10
loop_180:
	call	loop_182
loop_181:
	addc	%i2,	%g2,	%o4
	nop
	set	0x18, %o7
	swap	[%l7 + %o7],	%i5
	fmovrslz	%i1,	%f31,	%f13
loop_182:
	edge16	%l6,	%i3,	%g4
	call	loop_183
	rdhpr	%hpstate,	%o7
	movgu	%icc,	%g1,	%l5
	fpsub16s	%f4,	%f18,	%f15
loop_183:
	fmovslg	%fcc2,	%f10,	%f25
	call	loop_184
	tle	%xcc,	0x1
	movne	%icc,	%l4,	%g6
	call	loop_185
loop_184:
	fbe,pt	%fcc2,	loop_186
	call	loop_187
	fcmpgt16	%f26,	%f22,	%o6
loop_185:
	call	loop_188
loop_186:
	wrpr	%i0,	0x0E2C,	%tick
loop_187:
	faligndata	%f18,	%f2,	%f8
	fbuge	%fcc1,	loop_189
loop_188:
	call	loop_190
	call	loop_191
	call	loop_192
loop_189:
	call	loop_193
loop_190:
	call	loop_194
loop_191:
	call	loop_195
loop_192:
	call	loop_196
loop_193:
	faligndata	%f14,	%f10,	%f4
loop_194:
	fmovdleu	%xcc,	%f4,	%f30
loop_195:
	bcc,a,pn	%icc,	loop_197
loop_196:
	st	%fsr,	[%l7 + 0x48]
	nop
	fitod	%f2,	%f2
	fdtoi	%f2,	%f8
	call	loop_198
loop_197:
	fcmpgt16	%f2,	%f14,	%o3
	fand	%f0,	%f0,	%f4
	movre	%o2,	0x195,	%o0
loop_198:
	membar	0x64
	fbne,a	%fcc3,	loop_199
	subc	%i6,	%g3,	%o5
	wrpr	%g5,	0x0F6F,	%tick
	wr	%l2,	%g7,	%softint
loop_199:
	fnot2s	%f10,	%f3
	taddcctv	%l0,	0x1EA9,	%l1
	call	loop_200
	fornot1s	%f24,	%f12,	%f20
	call	loop_201
	bmask	%i4,	%o1,	%i7
loop_200:
	fnot1	%f10,	%f12
	tpos	%xcc,	0x1
loop_201:
	fandnot2	%f2,	%f30,	%f12
	call	loop_202
	call	loop_203
	movcc	%xcc,	%l3,	%i2
	nop
	fitod	%f8,	%f28
	fdtox	%f28,	%f28
loop_202:
	nop
	setx	0xF272AF6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x0DDF697F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f20,	%f25
loop_203:
	xor	%o4,	0x0B04,	%g2
	fands	%f24,	%f13,	%f20
	call	loop_204
	fnegd	%f8,	%f12
	fand	%f10,	%f4,	%f22
	sdivcc	%i5,	0x00,	%i1
loop_204:
	brgez,a	%l6,	loop_205
	call	loop_206
	tge	%icc,	0x4
	fmovdvc	%icc,	%f6,	%f30
loop_205:
	fornot2	%f16,	%f8,	%f12
loop_206:
	call	loop_207
	subcc	%g4,	0x1DA2,	%o7
	mulscc	%g1,	0x006E,	%l5
	for	%f28,	%f16,	%f12
loop_207:
	call	loop_208
	call	loop_209
	call	loop_210
	call	loop_211
loop_208:
	sll	%l4,	%g6,	%i3
loop_209:
	ta	%xcc,	0x4
loop_210:
	wr	%i0,	0x09DC,	%softint
loop_211:
	smul	%o6,	%o2,	%o0
	call	loop_212
	fpsub16s	%f20,	%f28,	%f6
	fmovscs	%xcc,	%f31,	%f11
	fnands	%f17,	%f10,	%f28
loop_212:
	movge	%fcc2,	%i6,	%o3
	sllx	%o5,	0x07,	%g3
	fmovsge	%fcc3,	%f16,	%f19
	call	loop_213
	edge32	%l2,	%g5,	%g7
	call	loop_214
	bvc,a	%icc,	loop_215
loop_213:
	flush	%l7 + 0x08
	call	loop_216
loop_214:
	movlg	%fcc1,	%l0,	%i4
loop_215:
	call	loop_217
	fmovrdne	%o1,	%f30,	%f26
loop_216:
	call	loop_218
	fsrc2	%f4,	%f16
loop_217:
	fandnot2	%f30,	%f16,	%f4
	call	loop_219
loop_218:
	call	loop_220
	call	loop_221
	fmovdn	%xcc,	%f8,	%f6
loop_219:
	rdpr	%cleanwin,	%l1
loop_220:
	fpadd32	%f2,	%f28,	%f20
loop_221:
	fcmpes	%fcc3,	%f21,	%f18
	umul	%l3,	0x0FA2,	%i7
	mulscc	%i2,	%g2,	%o4
	edge32n	%i5,	%l6,	%g4
	srax	%i1,	%g1,	%l5
	tcc	%icc,	0x3
	fsrc2s	%f18,	%f14
	umulcc	%l4,	0x0BB0,	%g6
	call	loop_222
	call	loop_223
	fcmple32	%f12,	%f24,	%i3
	fabsd	%f28,	%f22
loop_222:
	movue	%fcc2,	0x425,	%i0
loop_223:
	flushw
	call	loop_224
	fmovdg	%fcc0,	%f14,	%f30
	fmovdgu	%icc,	%f12,	%f26
	nop
	fitos	%f8,	%f3
	fstod	%f3,	%f18
loop_224:
	nop
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x27,	%o6
	rdpr	%cleanwin,	%o7
	fmovrdgez	%o2,	%f8,	%f2
	movvs	%xcc,	%o0,	%o3
	tne	%icc,	0x3
	sllx	%i6,	0x0F,	%o5
	udiv	%g3,	0x00,	%g5
	movge	%fcc3,	%g7,	%l2
	wr	%i4,	%l0,	%y
	rdpr	%gl,	%o1
	edge16n	%l1,	%i7,	%i2
	call	loop_225
	sllx	%g2,	%o4,	%l3
	fpack16	%f10,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5CD, 	%tick_cmpr
loop_225:
	movule	%fcc2,	0x539,	%i1
	nop
	setx loop_226, %l0, %l1
	jmpl %l1, %g1
	movcc	%xcc,	0x61F,	%g4
	sdivx	%l4,	0x00,	%l5
	fbn,pn	%fcc2,	loop_227
loop_226:
	fpadd32	%f10,	%f22,	%f14
	bvc	%icc,	loop_228
	fnot2	%f12,	%f10
loop_227:
	rdpr	%cleanwin,	%g6
	brlz,a	%i3,	loop_229
loop_228:
	call	loop_230
	wr	%i0,	%o6,	%softint
	movre	%o2,	0x0D0,	%o0
loop_229:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_230:
	mulscc	%i6,	0x11D4,	%o5
	edge8n	%g3,	%g5,	%g7
	call	loop_231
	fpsub32s	%f10,	%f23,	%f7
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc2
loop_231:
	ble,a,pn	%icc,	loop_232
	call	loop_233
	array16	%l2,	%o7,	%i4
	fmuld8sux16	%f30,	%f3,	%f10
loop_232:
	fmovrdgz	%l0,	%f20,	%f18
loop_233:
	movn	%icc,	0x2D0,	%o1
	fpsub32s	%f2,	%f26,	%f9
	fmovsug	%fcc2,	%f20,	%f9
	movgu	%xcc,	%i7,	%i2
	fmovrdgez	%g2,	%f22,	%f2
	call	loop_234
	fmovdu	%fcc2,	%f26,	%f4
	call	loop_235
	movvc	%icc,	%l1,	%o4
loop_234:
	tl	%icc,	0x5
	call	loop_236
loop_235:
	nop
	set	0x11, %i5
	stb	%i5,	[%l7 + %i5]
	andn	%l6,	0x03B3,	%l3
	sdivx	%i1,	0x00,	%g1
loop_236:
	alignaddrl	%l4,	%g4,	%g6
	movl	%fcc2,	%l5,	%i0
	movneg	%icc,	%o6,	%i3
	call	loop_237
	umulcc	%o2,	%o0,	%o3
	fmovdo	%fcc1,	%f24,	%f22
	fxnors	%f27,	%f27,	%f4
loop_237:
	call	loop_238
	fandnot2s	%f3,	%f23,	%f0
	wrpr	%o5,	%i6,	%tick
	fmovdu	%fcc0,	%f24,	%f14
loop_238:
	nop
	setx	0x36D2C96AEFC3A8BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7A900363E544BB43,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f4,	%f2
	call	loop_239
	flush	%l7 + 0x40
	wr	%g3,	%g7,	%sys_tick
	addc	%g5,	%l2,	%o7
loop_239:
	bge	%icc,	loop_240
	fcmple16	%f4,	%f28,	%l0
	ldd	[%l7 + 0x40],	%f24
	bne,a	%icc,	loop_241
loop_240:
	stb	%o1,	[%l7 + 0x28]
	fbe,pt	%fcc3,	loop_242
	call	loop_243
loop_241:
	call	loop_244
	sth	%i7,	[%l7 + 0x30]
loop_242:
	addcc	%i4,	0x19A4,	%g2
loop_243:
	movu	%fcc1,	%l1,	%i2
loop_244:
	fmovsl	%fcc0,	%f30,	%f16
	call	loop_245
	call	loop_246
	edge16	%i5,	%l6,	%l3
	fmovdne	%fcc0,	%f26,	%f16
loop_245:
	faligndata	%f30,	%f12,	%f18
loop_246:
	fmul8ulx16	%f28,	%f16,	%f20
	call	loop_247
	call	loop_248
	call	loop_249
	nop
	setx	0x0160A16BC740775C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8FCDACCC3B4E3793,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f20,	%f22
loop_247:
	bgu	%xcc,	loop_250
loop_248:
	brz	%o4,	loop_251
loop_249:
	call	loop_252
	call	loop_253
loop_250:
	smulcc	%i1,	%g1,	%g4
loop_251:
	bcs,a,pn	%icc,	loop_254
loop_252:
	fnands	%f5,	%f3,	%f28
loop_253:
	call	loop_255
	movrgez	%g6,	%l5,	%i0
loop_254:
	nop
	fitos	%f13,	%f23
	fstox	%f23,	%f0
	fmovsue	%fcc0,	%f10,	%f21
loop_255:
	bmask	%l4,	%i3,	%o2
	call	loop_256
	edge16ln	%o6,	%o3,	%o5
	fmovdgu	%xcc,	%f16,	%f24
	call	loop_257
loop_256:
	srlx	%o0,	0x1F,	%g3
	nop
	fitos	%f1,	%f20
	fstoi	%f20,	%f9
	rd	%ccr,	%g7
loop_257:
	fmovdul	%fcc1,	%f28,	%f0
	fpadd16s	%f5,	%f21,	%f20
	call	loop_258
	bvc,a	%xcc,	loop_259
	fzeros	%f19
	call	loop_260
loop_258:
	call	loop_261
loop_259:
	addccc	%i6,	0x13CF,	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%o7
loop_260:
	nop
	setx	0x1F3AC9ED381F02D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7411D714C6614D82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f2,	%f22
loop_261:
	call	loop_262
	brlez,a	%l0,	loop_263
	nop
	setx	0xDA8A8871E8357B0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	edge16n	%o1,	%i7,	%g2
loop_262:
	mulx	%i4,	0x0785,	%i2
loop_263:
	call	loop_264
	fnor	%f6,	%f24,	%f10
	nop
	setx	0xEE3CF12E40BC8A9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5099A2095E21B199,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f30
	fblg,a	%fcc1,	loop_265
loop_264:
	bshuffle	%f28,	%f6,	%f28
	call	loop_266
	fmovscs	%xcc,	%f10,	%f3
loop_265:
	edge32ln	%i5,	%l6,	%l3
	tn	%xcc,	0x4
loop_266:
	udiv	%o4,	0x00,	%i1
	addc	%l1,	0x1EB2,	%g1
	movcs	%xcc,	%g4,	%l5
	fornot2s	%f6,	%f9,	%f15
	call	loop_267
	nop
	setx	0x0A2BC3F96C31A40A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7CFC1C83BAA02521,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f22
	nop
	setx	0x6D51CE7E38EDF7E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	edge32l	%i0,	%g6,	%l4
loop_267:
	fblg,pt	%fcc1,	loop_268
	brlz,pn	%o2,	loop_269
	fmovdgu	%xcc,	%f2,	%f16
	sll	%o6,	0x1B,	%o3
loop_268:
	fandnot1s	%f17,	%f28,	%f2
loop_269:
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f18
	fxtos	%f18,	%f16
	call	loop_270
	call	loop_271
	fmul8ulx16	%f0,	%f30,	%f16
	call	loop_272
loop_270:
	fcmpd	%fcc3,	%f28,	%f16
loop_271:
	xorcc	%i3,	0x0DBA,	%o0
	tle	%icc,	0x3
loop_272:
	fornot2	%f26,	%f14,	%f24
	movne	%icc,	0x09E,	%o5
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f4
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f10
	call	loop_273
	call	loop_274
	fmovrdlz	%g3,	%f4,	%f18
	call	loop_275
loop_273:
	call	loop_276
loop_274:
	call	loop_277
	call	loop_278
loop_275:
	call	loop_279
loop_276:
	srlx	%i6,	0x1B,	%g7
loop_277:
	call	loop_280
loop_278:
	fnors	%f1,	%f17,	%f20
loop_279:
	call	loop_281
	ta	%xcc,	0x1
loop_280:
	udivcc	%l2,	%g5,	%l0
	popc	%o7,	%o1
loop_281:
	fcmpes	%fcc2,	%f25,	%f26
	fbge	%fcc0,	loop_282
	call	loop_283
	fmovsuge	%fcc3,	%f8,	%f25
	call	loop_284
loop_282:
	brlez,pt	%i7,	loop_285
loop_283:
	edge32ln	%i4,	%g2,	%i5
	tge	%icc,	0x3
loop_284:
	mulx	%i2,	%l6,	%l3
loop_285:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmpne32	%f22,	%f8,	%i1
	flush	%l7 + 0x18
	nop
	setx	loop_286,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022200001406,	%l0,	%l1
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
	ba,pt	%icc,	loop_287
	call	loop_288
	fornot1	%f18,	%f28,	%f24
loop_286:
	tpos	%icc,	0x4
loop_287:
	nop
	set	0x28, %l4
	stda	%o4,	[%l7 + %l4] 0x11
loop_288:
	movul	%fcc1,	%g1,	%g4
	fpackfix	%f28,	%f14
	fpsub32	%f30,	%f24,	%f14
	call	loop_289
	xorcc	%l5,	0x1CD7,	%l1
	movneg	%xcc,	0x1E5,	%g6
	fmovdcc	%icc,	%f28,	%f14
loop_289:
	nop
	fitos	%f6,	%f8
	fstod	%f8,	%f14
	orcc	%l4,	%i0,	%o6
	ble,a	%xcc,	loop_290
	fmul8ulx16	%f24,	%f18,	%f12
	bleu,a,pn	%xcc,	loop_291
	call	loop_292
loop_290:
	nop
	setx	0x5D81AD98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x7C5257C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f19,	%f20
	call	loop_293
loop_291:
	fxnor	%f22,	%f14,	%f14
loop_292:
	fnegs	%f8,	%f16
	edge8l	%o3,	%i3,	%o0
loop_293:
	fone	%f30
	ld	[%l7 + 0x0C],	%f22
	wr	%g0,	0x2a,	%asi
	stda	%o4,	[%l7 + 0x18] %asi
	membar	#Sync
	edge8n	%o2,	%g3,	%g7
	rd	%y,	%i6
	rdpr	%gl,	%l2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 28
!	Type a   	: 29
!	Type x   	: 10
!	Type cti   	: 157
!	Type f   	: 143
!	Type i   	: 133
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
	set	0xF,	%g2
	set	0x1,	%g3
	set	0x3,	%g4
	set	0xF,	%g5
	set	0x0,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xF,	%i1
	set	-0x4,	%i2
	set	-0x9,	%i3
	set	-0x6,	%i4
	set	-0xC,	%i5
	set	-0x4,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x22BA9F7C,	%l0
	set	0x135B4F30,	%l1
	set	0x579246C3,	%l2
	set	0x38D599C3,	%l3
	set	0x10ED6B15,	%l4
	set	0x5CDD5FBD,	%l5
	set	0x21E3340E,	%l6
	!# Output registers
	set	0x1E40,	%o0
	set	0x1513,	%o1
	set	0x1837,	%o2
	set	0x0181,	%o3
	set	-0x1DCA,	%o4
	set	0x1AF0,	%o5
	set	-0x0757,	%o6
	set	0x1E2C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f10
	edge32n	%l0,	%o7,	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00E, 	%hsys_tick_cmpr
	fmovsu	%fcc2,	%f19,	%f4
	fornot1	%f26,	%f18,	%f18
	subccc	%g2,	0x1B94,	%i4
	fsrc2s	%f13,	%f8
	fcmpd	%fcc2,	%f24,	%f0
	fsrc2	%f0,	%f0
	fcmpeq16	%f22,	%f30,	%i2
	rd	%ccr,	%i5
	fbl,a	%fcc0,	loop_294
	mova	%fcc2,	0x680,	%l6
	call	loop_295
	orncc	%l3,	0x16A5,	%o4
loop_294:
	edge16ln	%g1,	%i1,	%l5
	edge8	%l1,	%g4,	%l4
loop_295:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i0
	call	loop_296
	fcmpeq32	%f14,	%f30,	%g6
	movre	%o6,	0x1D3,	%o3
	nop
	setx	0x0F45159E37711C93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f18
loop_296:
	call	loop_297
	fmovsug	%fcc0,	%f29,	%f2
	nop
	set	0x1C, %l3
	ldsw	[%l7 + %l3],	%o0
	fpack32	%f0,	%f28,	%f8
loop_297:
	udivcc	%i3,	0x00,	%o5
	fnot1	%f12,	%f22
	edge32n	%o2,	%g7,	%i6
	call	loop_298
	call	loop_299
	movo	%fcc3,	0x791,	%g3
	call	loop_300
loop_298:
	fnand	%f12,	%f14,	%f14
loop_299:
	fmovdcs	%xcc,	%f18,	%f30
	fmovslg	%fcc1,	%f30,	%f27
loop_300:
	andcc	%l2,	%o7,	%l0
	call	loop_301
	fmovrdgez	%i7,	%f10,	%f22
	siam	0x1
	subccc	%o1,	%g5,	%g2
loop_301:
	movvc	%icc,	0x7C1,	%i2
	call	loop_302
	call	loop_303
	call	loop_304
	xorcc	%i4,	0x1DE6,	%i5
loop_302:
	ldub	[%l7 + 0x42],	%l3
loop_303:
	fmovrslz	%o4,	%f23,	%f2
loop_304:
	call	loop_305
	call	loop_306
	mulx	%g1,	0x103B,	%i1
	call	loop_307
loop_305:
	call	loop_308
loop_306:
	call	loop_309
	rd	%pc,	%l5
loop_307:
	movrgz	%l6,	0x083,	%l1
loop_308:
	fmovsleu	%xcc,	%f27,	%f24
loop_309:
	fmovdleu	%xcc,	%f24,	%f28
	sdivx	%l4,	%i0,	%g6
	bgu	%icc,	loop_310
	brgz,a	%g4,	loop_311
	call	loop_312
	call	loop_313
loop_310:
	te	%xcc,	0x7
loop_311:
	nop
	setx	0x8AEB60A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xB3DFB18C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f7,	%f7
loop_312:
	edge8n	%o3,	%o6,	%o0
loop_313:
	call	loop_314
	tvs	%xcc,	0x2
	ldsw	[%l7 + 0x40],	%o5
	call	loop_315
loop_314:
	call	loop_316
	call	loop_317
	call	loop_318
loop_315:
	call	loop_319
loop_316:
	bshuffle	%f8,	%f28,	%f30
loop_317:
	fand	%f24,	%f4,	%f18
loop_318:
	popc	%o2,	%i3
loop_319:
	call	loop_320
	fpsub32s	%f0,	%f0,	%f29
	bl,a,pn	%xcc,	loop_321
	fornot2s	%f13,	%f2,	%f31
loop_320:
	wrpr	%g7,	%g3,	%cwp
	fcmps	%fcc0,	%f14,	%f25
loop_321:
	fbge	%fcc0,	loop_322
	rd	%ccr,	%l2
	tneg	%xcc,	0x6
	call	loop_323
loop_322:
	call	loop_324
	fmovdule	%fcc2,	%f30,	%f6
	movuge	%fcc2,	%o7,	%i6
loop_323:
	brz,a,pt	%l0,	loop_325
loop_324:
	call	loop_326
	call	loop_327
	call	loop_328
loop_325:
	fmovsule	%fcc1,	%f10,	%f25
loop_326:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBEE, 	%hsys_tick_cmpr
loop_327:
	smul	%o1,	0x097B,	%g2
loop_328:
	call	loop_329
	call	loop_330
	fpsub16	%f4,	%f16,	%f8
	fmovscs	%icc,	%f4,	%f10
loop_329:
	movge	%xcc,	%i4,	%i5
loop_330:
	call	loop_331
	subccc	%l3,	0x1EAC,	%i2
	fmovsul	%fcc3,	%f26,	%f3
	call	loop_332
loop_331:
	fand	%f4,	%f16,	%f28
	fmovrsgez	%g1,	%f7,	%f11
	fpsub16s	%f24,	%f13,	%f9
loop_332:
	rd	%tick_cmpr,	%i1
	call	loop_333
	sdivx	%o4,	0x00,	%l6
	membar	0x2C
	call	loop_334
loop_333:
	add	%l1,	0x1E1E,	%l5
	ldsw	[%l7 + 0x30],	%l4
	call	loop_335
loop_334:
	fmovdul	%fcc1,	%f4,	%f28
	fnor	%f28,	%f8,	%f10
	tpos	%xcc,	0x3
loop_335:
	mulx	%g6,	%i0,	%o3
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%o6
	movneg	%icc,	%o0,	%o5
	call	loop_336
	edge16n	%g4,	%i3,	%o2
	rd	%sys_tick_cmpr,	%g3
	mova	%fcc3,	0x7E9,	%g7
loop_336:
	fmovsu	%fcc1,	%f7,	%f22
	fmovslg	%fcc3,	%f16,	%f11
	edge16	%o7,	%l2,	%i6
	set	0x70, %l0
	ldswa	[%l7 + %l0] 0x80,	%i7
	fbu,a	%fcc0,	loop_337
	smul	%l0,	0x0A38,	%g5
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f20
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f14
loop_337:
	brnz,a,pt	%o1,	loop_338
	brgez,pt	%g2,	loop_339
	call	loop_340
	fpack32	%f4,	%f4,	%f20
loop_338:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_339:
	call	loop_341
loop_340:
	fmovsue	%fcc0,	%f10,	%f2
	nop
	set	0x0B, %g3
	ldstub	[%l7 + %g3],	%i5
	array8	%l3,	%i4,	%i2
loop_341:
	call	loop_342
	xnor	%i1,	0x008B,	%o4
	or	%g1,	%l6,	%l5
	fbg	%fcc0,	loop_343
loop_342:
	rd	%softint,	%l4
	fpackfix	%f8,	%f2
	call	loop_344
loop_343:
	membar	0x67
	call	loop_345
	fxors	%f21,	%f27,	%f13
loop_344:
	edge32	%l1,	%g6,	%o3
	fabss	%f8,	%f9
loop_345:
	edge16l	%o6,	%i0,	%o0
	fcmpd	%fcc1,	%f8,	%f2
	fsrc2	%f8,	%f10
	fmovsgu	%icc,	%f19,	%f28
	fmovdue	%fcc2,	%f30,	%f6
	rdpr	%gl,	%o5
	fmovdu	%fcc3,	%f14,	%f20
	tcc	%icc,	0x7
	call	loop_346
	nop
	set	0x2B, %o6
	ldub	[%l7 + %o6],	%i3
	srlx	%g4,	%o2,	%g7
	wrpr	%o7,	%g3,	%tick
loop_346:
	tpos	%icc,	0x2
	call	loop_347
	fnand	%f2,	%f18,	%f14
	fand	%f12,	%f8,	%f0
	fabss	%f10,	%f3
loop_347:
	fmovrdlez	%l2,	%f8,	%f30
	call	loop_348
	nop
	set	0x70, %i4
	flush	%l7 + %i4
	call	loop_349
	call	loop_350
loop_348:
	call	loop_351
	call	loop_352
loop_349:
	tleu	%icc,	0x0
loop_350:
	movne	%fcc3,	0x4FA,	%i6
loop_351:
	fand	%f8,	%f8,	%f12
loop_352:
	movle	%fcc2,	0x4B0,	%l0
	fxnor	%f6,	%f20,	%f28
	edge32n	%i7,	%o1,	%g2
	movpos	%xcc,	0x0D3,	%g5
	add	%l3,	%i5,	%i4
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f2
	call	loop_353
	fpadd16	%f2,	%f22,	%f16
	edge32	%i2,	%i1,	%g1
	fandnot2s	%f22,	%f27,	%f8
loop_353:
	call	loop_354
	call	loop_355
	call	loop_356
	call	loop_357
loop_354:
	fmovrslz	%o4,	%f1,	%f7
loop_355:
	fmovrslez	%l6,	%f14,	%f27
loop_356:
	movue	%fcc0,	%l4,	%l1
loop_357:
	fcmpes	%fcc1,	%f8,	%f7
	fpack16	%f2,	%f14
	movrne	%g6,	%o3,	%l5
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f16
	fxtos	%f16,	%f2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%i0
	fandnot2s	%f12,	%f10,	%f0
	bvs,pn	%icc,	loop_358
	fmovdvc	%xcc,	%f14,	%f28
	subccc	%o6,	0x1F3A,	%o0
	bne,a,pn	%xcc,	loop_359
loop_358:
	call	loop_360
	fmovsle	%xcc,	%f0,	%f28
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_359:
	fmovdo	%fcc1,	%f22,	%f4
loop_360:
	srlx	%i3,	%o5,	%o2
	tcc	%xcc,	0x0
	nop
	setx	0xF52716E44C97F401,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f30
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x6D] %asi,	%g4
	fmovsu	%fcc2,	%f4,	%f11
	rd	%y,	%g7
	sethi	0x125F,	%o7
	fzeros	%f6
	bvs,a,pn	%xcc,	loop_361
	call	loop_362
	udiv	%l2,	%g3,	%i6
	tvc	%xcc,	0x4
loop_361:
	wr	%l0,	%o1,	%ccr
loop_362:
	fmovdug	%fcc1,	%f30,	%f28
	tsubcctv	%i7,	%g2,	%g5
	fsrc2s	%f24,	%f8
	popc	0x032F,	%i5
	call	loop_363
	std	%i4,	[%l7 + 0x58]
	edge16n	%i2,	%i1,	%l3
	fmovdule	%fcc1,	%f2,	%f6
loop_363:
	mova	%fcc0,	%g1,	%o4
	brgez,pt	%l4,	loop_364
	udivcc	%l6,	%l1,	%g6
	rdhpr	%hpstate,	%o3
	andcc	%i0,	%l5,	%o0
loop_364:
	taddcc	%o6,	0x1073,	%i3
	edge32n	%o2,	%g4,	%o5
	movvc	%icc,	0x21B,	%o7
	call	loop_365
	bvc,a	%xcc,	loop_366
	te	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_365:
	call	loop_367
loop_366:
	call	loop_368
	tneg	%xcc,	0x6
	fcmpeq16	%f30,	%f10,	%g3
loop_367:
	call	loop_369
loop_368:
	call	loop_370
	fmul8x16au	%f6,	%f0,	%f10
	fmovse	%xcc,	%f12,	%f7
loop_369:
	call	loop_371
loop_370:
	fmovsneg	%xcc,	%f1,	%f20
	call	loop_372
	nop
	setx	0xD76C2B4BCE204D3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB56EC328892328F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f12,	%f0
loop_371:
	srl	%i6,	%l0,	%o1
	subccc	%g7,	0x1621,	%i7
loop_372:
	movu	%fcc1,	%g5,	%i5
	std	%f2,	[%l7 + 0x50]
	rdhpr	%htba,	%i4
	umulcc	%i2,	%g2,	%l3
	call	loop_373
	call	loop_374
	udivcc	%i1,	%o4,	%g1
	set	0x56, %g4
	lduba	[%l7 + %g4] 0x19,	%l4
loop_373:
	sir	0x1E1C
loop_374:
	fcmple16	%f24,	%f30,	%l1
	brlz,pt	%g6,	loop_375
	ldub	[%l7 + 0x45],	%o3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f10
loop_375:
	fmovdpos	%xcc,	%f12,	%f4
	fmovsule	%fcc3,	%f21,	%f20
	fmovsu	%fcc2,	%f25,	%f10
	orn	%l6,	0x0A00,	%i0
	call	loop_376
	rdhpr	%hsys_tick_cmpr,	%o0
	fabss	%f12,	%f25
	fnors	%f24,	%f1,	%f0
loop_376:
	rd	%sys_tick_cmpr,	%l5
	bneg,pt	%xcc,	loop_377
	nop
	setx	0xCF7A8B8CE2949E97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x08B3A45F9B7C943D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f28,	%f10
	fmul8x16	%f11,	%f12,	%f6
	set	0x18, %g1
	lduwa	[%l7 + %g1] 0x11,	%i3
loop_377:
	movn	%fcc0,	%o2,	%o6
	brgz,a,pt	%o5,	loop_378
	call	loop_379
	tsubcc	%g4,	0x1671,	%o7
	call	loop_380
loop_378:
	call	loop_381
loop_379:
	call	loop_382
	subcc	%g3,	%i6,	%l0
loop_380:
	call	loop_383
loop_381:
	call	loop_384
loop_382:
	fmovde	%fcc0,	%f10,	%f2
	andncc	%o1,	%g7,	%l2
loop_383:
	fpack32	%f12,	%f8,	%f24
loop_384:
	call	loop_385
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%g5
	wr	%g0,	0xeb,	%asi
	stda	%i6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_385:
	fmovdule	%fcc2,	%f28,	%f2
	fmovdvs	%icc,	%f6,	%f12
	call	loop_386
	fpsub32	%f10,	%f6,	%f18
	fba,pt	%fcc3,	loop_387
	fpadd32s	%f26,	%f18,	%f25
loop_386:
	flushw
	alignaddrl	%i5,	%i2,	%g2
loop_387:
	nop
	setx	0x05D00F5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x46C26836,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f7,	%f4
	fmovrslz	%i4,	%f7,	%f16
	call	loop_388
	tpos	%icc,	0x3
	call	loop_389
	fmovdlg	%fcc2,	%f30,	%f4
loop_388:
	fmul8x16al	%f10,	%f21,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_389:
	subc	%o4,	%i1,	%l4
	call	loop_390
	brnz,a	%l1,	loop_391
	call	loop_392
	orncc	%g6,	0x0709,	%g1
loop_390:
	brgez	%l6,	loop_393
loop_391:
	fbe,a,pt	%fcc1,	loop_394
loop_392:
	nop
	setx	0xC36587B93209C82F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9F35DF3A86074E8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f4,	%f28
	fmovdneg	%xcc,	%f2,	%f30
loop_393:
	wr	%i0,	0x13EF,	%y
loop_394:
	taddcctv	%o3,	%l5,	%o0
	call	loop_395
	edge16ln	%o2,	%o6,	%o5
	fpadd16	%f30,	%f28,	%f20
	fmuld8ulx16	%f11,	%f4,	%f16
loop_395:
	movo	%fcc3,	%g4,	%o7
	movo	%fcc2,	0x5FB,	%g3
	call	loop_396
	call	loop_397
	rdhpr	%ver,	%i3
	edge8l	%i6,	%o1,	%g7
loop_396:
	add	%l0,	%g5,	%l2
loop_397:
	call	loop_398
	fpsub32	%f6,	%f28,	%f24
	call	loop_399
	fmovsu	%fcc0,	%f9,	%f22
loop_398:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_400
loop_399:
	array32	%i7,	%i2,	%g2
	taddcc	%i4,	0x14A3,	%l3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_400:
	fpsub16s	%f15,	%f23,	%f4
	call	loop_401
	fnand	%f20,	%f20,	%f30
	fone	%f10
	fmovsvs	%xcc,	%f5,	%f2
loop_401:
	fnand	%f28,	%f24,	%f14
	mulscc	%o4,	0x1A65,	%i5
	call	loop_402
	fmuld8sux16	%f30,	%f0,	%f0
	fones	%f4
	rdhpr	%hsys_tick_cmpr,	%i1
loop_402:
	fmovrsne	%l4,	%f22,	%f28
	nop
	setx	0x4F5A7372,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xE0A889B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f0,	%f30
	nop
	setx	0xA04A6A4263995E18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE3BA7F9E544DB91F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f2,	%f2
	orcc	%g6,	0x19B9,	%l1
	nop
	setx	0x537D658A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x83D4E091,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f22,	%f22
	fmovduge	%fcc3,	%f16,	%f14
	call	loop_403
	fpadd16s	%f26,	%f14,	%f31
	bgu,a	%xcc,	loop_404
	fnand	%f30,	%f18,	%f30
loop_403:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%g1,	[%l7 + 0x10] %asi
	membar	#Sync
loop_404:
	movcc	%icc,	0x51B,	%i0
	bvc,a,pt	%icc,	loop_405
	call	loop_406
	xorcc	%o3,	0x0BD1,	%l6
	call	loop_407
loop_405:
	fmovde	%icc,	%f30,	%f12
loop_406:
	andcc	%o0,	%l5,	%o6
	fmovdue	%fcc3,	%f10,	%f8
loop_407:
	bn	%icc,	loop_408
	call	loop_409
	edge16l	%o5,	%o2,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCED, 	%tick_cmpr
loop_408:
	movule	%fcc3,	%i3,	%i6
loop_409:
	fnand	%f28,	%f28,	%f14
	call	loop_410
	addcc	%o1,	0x1F62,	%g4
	wr	%l0,	0x0988,	%clear_softint
	addc	%g5,	0x0A19,	%l2
loop_410:
	fcmpeq32	%f28,	%f22,	%i7
	call	loop_411
	fpsub16s	%f21,	%f13,	%f31
	fmovsug	%fcc1,	%f17,	%f11
	wrpr	%i2,	0x0CD8,	%pil
loop_411:
	call	loop_412
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f26
	call	loop_413
	movcc	%xcc,	0x4DD,	%g7
loop_412:
	movrne	%g2,	%i4,	%o4
	movle	%icc,	0x21F,	%i5
loop_413:
	fmovrdgez	%i1,	%f22,	%f18
	fxnor	%f0,	%f28,	%f8
	rd	%fprs,	%l4
	call	loop_414
	call	loop_415
	movn	%fcc3,	%g6,	%l1
	fmovrsgez	%g1,	%f29,	%f21
loop_414:
	fmovse	%fcc1,	%f7,	%f1
loop_415:
	nop
	fitos	%f6,	%f23
	fstoi	%f23,	%f17
	call	loop_416
	fmovse	%xcc,	%f19,	%f16
	call	loop_417
	rdpr	%canrestore,	%i0
loop_416:
	srax	%o3,	%l3,	%l6
	fmovda	%fcc1,	%f20,	%f4
loop_417:
	fmovda	%fcc2,	%f18,	%f10
	tsubcc	%o0,	%o6,	%o5
	call	loop_418
	call	loop_419
	bshuffle	%f26,	%f18,	%f26
	call	loop_420
loop_418:
	andcc	%o2,	0x1B9B,	%l5
loop_419:
	fxor	%f18,	%f20,	%f10
	movne	%fcc0,	0x1CC,	%o7
loop_420:
	fmovsa	%icc,	%f22,	%f15
	call	loop_421
	call	loop_422
	rdhpr	%htba,	%i3
	call	loop_423
loop_421:
	nop
	fitos	%f10,	%f23
	fstox	%f23,	%f30
	fxtos	%f30,	%f15
loop_422:
	nop
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
loop_423:
	bcc	%icc,	loop_424
	movvs	%xcc,	%g3,	%i6
	fmovslg	%fcc0,	%f23,	%f11
	fmovsvc	%icc,	%f18,	%f22
loop_424:
	tcs	%icc,	0x2
	fsrc1s	%f14,	%f30
	fmovsle	%fcc1,	%f26,	%f24
	fxors	%f28,	%f9,	%f25
	fmul8sux16	%f24,	%f6,	%f6
	fmovdug	%fcc1,	%f4,	%f18
	call	loop_425
	fmovrde	%g4,	%f18,	%f26
	movle	%fcc1,	0x74F,	%o1
	call	loop_426
loop_425:
	fmovdu	%fcc1,	%f12,	%f20
	array16	%l0,	%l2,	%g5
	srax	%i2,	%g7,	%i7
loop_426:
	call	loop_427
	nop
	setx	0xA2254E12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF99F3AFD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f13,	%f2
	ba,a	%icc,	loop_428
	fnot1s	%f15,	%f8
loop_427:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32ln	%i4,	%g2,	%i5
loop_428:
	tle	%xcc,	0x7
	ta	%icc,	0x1
	call	loop_429
	call	loop_430
	rdhpr	%htba,	%i1
	nop
	setx	0xA243A2B2B75C2E29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA19E130B4A37D8AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f20,	%f28
loop_429:
	fcmps	%fcc2,	%f24,	%f23
loop_430:
	fmovscc	%xcc,	%f2,	%f22
	xorcc	%o4,	0x1EB8,	%g6
	call	loop_431
	sllx	%l1,	0x1C,	%l4
	fmuld8ulx16	%f29,	%f12,	%f12
	call	loop_432
loop_431:
	popc	%i0,	%g1
	orn	%o3,	%l6,	%o0
	fsrc2	%f30,	%f20
loop_432:
	fpadd32s	%f7,	%f25,	%f23
	fmovrsgz	%l3,	%f10,	%f23
	fmovrdlez	%o6,	%f20,	%f12
	nop
	setx	0x76B9841B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x610161A3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f8,	%f20
	sdivx	%o5,	%o2,	%l5
	rd	%ccr,	%i3
	call	loop_433
	movleu	%icc,	0x62A,	%g3
	fmovsge	%fcc2,	%f15,	%f6
	fmovsvs	%xcc,	%f4,	%f12
loop_433:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bgu,a	%xcc,	loop_434
	fmovsgu	%xcc,	%f12,	%f2
	fmovdlg	%fcc3,	%f30,	%f8
	orcc	%i6,	%o7,	%g4
loop_434:
	fmovrdgez	%o1,	%f12,	%f18
	movrgz	%l2,	0x343,	%g5
	for	%f26,	%f2,	%f18
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 23
!	Type a   	: 30
!	Type x   	: 11
!	Type cti   	: 141
!	Type f   	: 162
!	Type i   	: 133
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
	set	0xB,	%g1
	set	0x1,	%g2
	set	0x1,	%g3
	set	0x9,	%g4
	set	0xD,	%g5
	set	0x7,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xA,	%i1
	set	-0xB,	%i2
	set	-0xA,	%i3
	set	-0xA,	%i4
	set	-0x8,	%i5
	set	-0xD,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x738B8F44,	%l0
	set	0x593849D2,	%l1
	set	0x153E317E,	%l2
	set	0x0E8E73C6,	%l3
	set	0x6AA22668,	%l4
	set	0x6B819FDF,	%l5
	set	0x0FBBEA7E,	%l6
	!# Output registers
	set	0x01B7,	%o0
	set	-0x175A,	%o1
	set	-0x0942,	%o2
	set	-0x0366,	%o3
	set	-0x0860,	%o4
	set	0x1DAA,	%o5
	set	-0x0D01,	%o6
	set	0x1A37,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	taddcctv	%l0,	%i2,	%g7
	call	loop_435
	xorcc	%i7,	0x0C21,	%i4
	movge	%xcc,	%g2,	%i1
	call	loop_436
loop_435:
	fxor	%f20,	%f14,	%f6
	call	loop_437
	movgu	%xcc,	0x580,	%i5
loop_436:
	fnot2	%f30,	%f22
	taddcc	%g6,	0x021E,	%o4
loop_437:
	brlz,pn	%l4,	loop_438
	call	loop_439
	fmul8x16au	%f15,	%f17,	%f24
	fmovsgu	%icc,	%f22,	%f21
loop_438:
	call	loop_440
loop_439:
	call	loop_441
	call	loop_442
	nop
	setx	loop_443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004200001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_440:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_441:
	call	loop_444
loop_442:
	fmovdue	%fcc3,	%f22,	%f16
loop_443:
	tvc	%xcc,	0x5
	fmovdpos	%xcc,	%f8,	%f10
loop_444:
	fxnors	%f6,	%f13,	%f20
	fpack32	%f10,	%f2,	%f4
	call	loop_445
	fcmple16	%f2,	%f24,	%i0
	ble,pn	%xcc,	loop_446
	fnor	%f0,	%f6,	%f28
loop_445:
	rd	%y,	%l1
	wr	%o3,	%l6,	%ccr
loop_446:
	ba,a	%icc,	loop_447
	call	loop_448
	udiv	%o0,	%l3,	%o6
	fornot1s	%f7,	%f2,	%f16
loop_447:
	fcmpne32	%f14,	%f18,	%o5
loop_448:
	tl	%icc,	0x4
	fmovdle	%fcc3,	%f14,	%f16
	ba,a	%xcc,	loop_449
	rdpr	%pil,	%g1
	call	loop_450
	call	loop_451
loop_449:
	call	loop_452
	call	loop_453
loop_450:
	fxors	%f3,	%f10,	%f5
loop_451:
	fmovsle	%icc,	%f30,	%f3
loop_452:
	call	loop_454
loop_453:
	movu	%fcc2,	0x120,	%o2
	sdivcc	%l5,	%i3,	%i6
	fcmpeq32	%f30,	%f16,	%o7
loop_454:
	fmovdgu	%icc,	%f8,	%f12
	movvs	%icc,	0x7DF,	%g4
	movule	%fcc2,	%g3,	%o1
	fpsub16	%f4,	%f24,	%f18
	wr	%g0,	0x2b,	%asi
	stba	%g5,	[%l7 + 0x6B] %asi
	membar	#Sync
	call	loop_455
	call	loop_456
	fmovdle	%xcc,	%f8,	%f20
	fmovdu	%fcc1,	%f30,	%f26
loop_455:
	tvc	%icc,	0x2
loop_456:
	bneg,a	%icc,	loop_457
	fmovde	%xcc,	%f22,	%f8
	fmovdneg	%xcc,	%f2,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x73B, 	%hsys_tick_cmpr
loop_457:
	and	%l0,	%g7,	%i7
	udivcc	%i2,	%i4,	%i1
	srl	%g2,	0x0A,	%i5
	rdpr	%gl,	%g6
	call	loop_458
	call	loop_459
	nop
	setx loop_460, %l0, %l1
	jmpl %l1, %o4
	tgu	%icc,	0x1
loop_458:
	nop
	setx	0x54CFB1F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x6BB3E306,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f23,	%f9
loop_459:
	call	loop_461
loop_460:
	nop
	setx	0x56E9A79F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f5
	call	loop_462
	fmovdpos	%icc,	%f8,	%f0
loop_461:
	fnot2s	%f1,	%f22
	fnegd	%f8,	%f30
loop_462:
	fmovdleu	%icc,	%f8,	%f24
	call	loop_463
	fand	%f16,	%f10,	%f20
	fands	%f20,	%f8,	%f29
	fornot1s	%f10,	%f25,	%f8
loop_463:
	fmovda	%icc,	%f26,	%f24
	array32	%i0,	%l4,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x823, 	%hsys_tick_cmpr
	call	loop_464
	edge16	%o0,	%o6,	%o5
	call	loop_465
	bge	%icc,	loop_466
loop_464:
	edge16	%l3,	%o2,	%g1
	nop
	fitos	%f8,	%f24
	fstox	%f24,	%f24
loop_465:
	fmovdl	%icc,	%f16,	%f10
loop_466:
	call	loop_467
	fmovrde	%l5,	%f28,	%f10
	call	loop_468
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f24
loop_467:
	call	loop_469
	edge32ln	%i6,	%i3,	%o7
loop_468:
	fcmpeq32	%f4,	%f22,	%g4
	movgu	%icc,	0x3B1,	%g3
loop_469:
	nop
	set	0x6C, %g7
	lda	[%l7 + %g7] 0x18,	%f31
	fbug,a,pn	%fcc1,	loop_470
	rd	%softint,	%o1
	and	%l2,	%l0,	%g5
	edge32n	%i7,	%g7,	%i2
loop_470:
	nop
	setx	0x519246EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xE1656C87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f27,	%f16
	umul	%i4,	0x1517,	%g2
	orn	%i5,	%g6,	%i1
	fornot2	%f20,	%f16,	%f4
	call	loop_471
	movpos	%icc,	%o4,	%i0
	call	loop_472
	rd	%ccr,	%o3
loop_471:
	call	loop_473
	fand	%f14,	%f22,	%f2
loop_472:
	call	loop_474
	fandnot2	%f18,	%f8,	%f2
loop_473:
	fcmps	%fcc0,	%f3,	%f15
	call	loop_475
loop_474:
	rd	%tick_cmpr,	%l4
	call	loop_476
	tpos	%xcc,	0x4
loop_475:
	st	%f7,	[%l7 + 0x78]
	fmovsvc	%xcc,	%f13,	%f23
loop_476:
	wrpr 	%g0, 	0x2, 	%gl
	bcs,a,pt	%icc,	loop_477
	movrlz	%o0,	%o6,	%o5
	fmovdule	%fcc2,	%f12,	%f0
	fnot1s	%f31,	%f19
loop_477:
	fxnor	%f20,	%f18,	%f6
	rd	%ccr,	%l6
	sdivx	%o2,	0x00,	%g1
	xorcc	%l5,	%i6,	%l3
	tleu	%xcc,	0x2
	fmovdug	%fcc2,	%f18,	%f10
	call	loop_478
	orcc	%i3,	0x0977,	%o7
	movvc	%icc,	0x33F,	%g4
	fmovsule	%fcc0,	%f5,	%f14
loop_478:
	fcmpes	%fcc0,	%f31,	%f2
	call	loop_479
	mova	%fcc1,	0x6D0,	%g3
	tneg	%xcc,	0x5
	nop
	set	0x0C, %g2
	stb	%l2,	[%l7 + %g2]
loop_479:
	rd	%sys_tick_cmpr,	%l0
	fmovsgu	%icc,	%f2,	%f4
	nop
	fitos	%f0,	%f19
	fbuge	%fcc0,	loop_480
	alignaddr	%o1,	%i7,	%g5
	call	loop_481
	movvc	%xcc,	%i2,	%i4
loop_480:
	nop
	fitod	%f6,	%f8
	fdtoi	%f8,	%f20
	call	loop_482
loop_481:
	wrpr	%g2,	0x099A,	%tick
	call	loop_483
	tcc	%icc,	0x5
loop_482:
	call	loop_484
	call	loop_485
loop_483:
	movgu	%icc,	%g7,	%g6
	fandnot2s	%f11,	%f9,	%f30
loop_484:
	call	loop_486
loop_485:
	movgu	%icc,	%i1,	%o4
	call	loop_487
	call	loop_488
loop_486:
	call	loop_489
	fpsub32s	%f18,	%f12,	%f9
loop_487:
	sdivcc	%i0,	%o3,	%i5
loop_488:
	fmovdo	%fcc3,	%f26,	%f6
loop_489:
	nop
	fitos	%f7,	%f5
	fstod	%f5,	%f14
	fmovsne	%icc,	%f15,	%f30
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f2
	fmovsn	%xcc,	%f21,	%f21
	fbe,pn	%fcc3,	loop_490
	nop
	setx	0xCAEF65A2B6C9699D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1C5BB529F8BBCF39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f10
	fmovdn	%xcc,	%f2,	%f0
	call	loop_491
loop_490:
	movcc	%icc,	%l4,	%o0
	fbul,a,pn	%fcc1,	loop_492
	bleu	%icc,	loop_493
loop_491:
	fmovdge	%fcc1,	%f6,	%f30
	movneg	%xcc,	0x52A,	%o6
loop_492:
	call	loop_494
loop_493:
	call	loop_495
	call	loop_496
	edge32l	%l1,	%l6,	%o5
loop_494:
	fandnot1	%f14,	%f26,	%f14
loop_495:
	call	loop_497
loop_496:
	nop
	setx	0x4B3F6F8DE4208F77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEB56E9B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f6,	%f12
	rdhpr	%htba,	%o2
	movvs	%icc,	0x467,	%l5
loop_497:
	fnands	%f16,	%f19,	%f2
	faligndata	%f30,	%f30,	%f18
	call	loop_498
	fnot1s	%f0,	%f12
	call	loop_499
	fpadd32s	%f3,	%f31,	%f0
loop_498:
	fandnot1	%f16,	%f24,	%f24
	fnand	%f28,	%f4,	%f0
loop_499:
	fand	%f6,	%f20,	%f30
	fnot2s	%f24,	%f29
	udivx	%i6,	0x00,	%l3
	tpos	%xcc,	0x2
	addc	%i3,	0x1D5A,	%g1
	fmovrdgz	%g4,	%f8,	%f12
	call	loop_500
	membar	0x59
	movle	%fcc2,	0x78B,	%g3
	rd	%fprs,	%l2
loop_500:
	fmul8sux16	%f2,	%f30,	%f0
	rdpr	%cwp,	%o7
	fmovsule	%fcc2,	%f26,	%f5
	nop
	setx	0x85DAA44AAB4C91E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	sdivx	%l0,	%i7,	%g5
	fnands	%f22,	%f28,	%f11
	call	loop_501
	call	loop_502
	movrgz	%i2,	%o1,	%g2
	fmovdcs	%xcc,	%f28,	%f8
loop_501:
	fmovrdlez	%g7,	%f0,	%f22
loop_502:
	call	loop_503
	nop
	setx	0x1F815855187393E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x35FE52E2C230EE75,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f0,	%f10
	fmovd	%f28,	%f6
	rdpr	%cleanwin,	%g6
loop_503:
	edge16l	%i1,	%i4,	%o4
	rdhpr	%hsys_tick_cmpr,	%i0
	bvc,a,pt	%xcc,	loop_504
	nop
	setx	0x75F6690A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f19
	call	loop_505
	fpsub32	%f20,	%f8,	%f12
loop_504:
	call	loop_506
	edge32l	%o3,	%l4,	%o0
loop_505:
	fble,pn	%fcc0,	loop_507
	call	loop_508
loop_506:
	orn	%o6,	0x0F09,	%i5
	tg	%xcc,	0x6
loop_507:
	nop
	set	0x18, %g5
	stwa	%l1,	[%l7 + %g5] 0x04
loop_508:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_509
	fmovdn	%fcc0,	%f22,	%f18
	call	loop_510
	fcmpne16	%f4,	%f30,	%l6
loop_509:
	sdivcc	%o5,	%l5,	%i6
	fmovdvc	%icc,	%f24,	%f6
loop_510:
	call	loop_511
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f2
	fxtos	%f2,	%f6
	mova	%fcc3,	0x1BE,	%l3
	fmul8x16al	%f27,	%f0,	%f8
loop_511:
	nop
	fitod	%f8,	%f18
	fsrc1s	%f19,	%f0
	flushw
	tpos	%xcc,	0x2
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x11,	 1
	move	%xcc,	%g1,	%g4
	call	loop_512
	fpadd32s	%f6,	%f22,	%f4
	fors	%f14,	%f10,	%f6
	call	loop_513
loop_512:
	xorcc	%g3,	0x068B,	%l2
	alignaddrl	%o7,	%o2,	%l0
	sll	%i7,	%i2,	%g5
loop_513:
	fmovscc	%icc,	%f5,	%f27
	fabss	%f24,	%f10
	call	loop_514
	tsubcctv	%o1,	0x05D1,	%g2
	brz,pn	%g7,	loop_515
	fcmpeq16	%f14,	%f22,	%i1
loop_514:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_516
loop_515:
	fmovdue	%fcc2,	%f22,	%f12
	fcmpne32	%f18,	%f4,	%i4
	call	loop_517
loop_516:
	srax	%o3,	0x15,	%i0
	set	0x50, %l5
	stha	%l4,	[%l7 + %l5] 0xe2
	membar	#Sync
loop_517:
	smul	%o0,	%o6,	%l1
	edge8	%l6,	%i5,	%l5
	array8	%i6,	%o5,	%l3
	fpadd32	%f20,	%f20,	%f10
	call	loop_518
	fnot1s	%f15,	%f10
	nop
	setx	0x8F721EAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC3801851,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f23,	%f23
	call	loop_519
loop_518:
	fmovdl	%icc,	%f2,	%f20
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i3
loop_519:
	bl,a	%xcc,	loop_520
	call	loop_521
	subcc	%g1,	%g3,	%l2
	call	loop_522
loop_520:
	fmovrslez	%o7,	%f17,	%f20
loop_521:
	smulcc	%o2,	%l0,	%g4
	call	loop_523
loop_522:
	call	loop_524
	fmovslg	%fcc1,	%f5,	%f3
	fmovrslez	%i2,	%f4,	%f27
loop_523:
	call	loop_525
loop_524:
	fcmpd	%fcc1,	%f26,	%f20
	faligndata	%f20,	%f12,	%f4
	call	loop_526
loop_525:
	call	loop_527
	fmovdg	%icc,	%f16,	%f4
	nop
	setx	loop_528,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_526:
	movneg	%xcc,	0x307,	%g5
loop_527:
	call	loop_529
	call	loop_530
loop_528:
	fmovdule	%fcc3,	%f30,	%f10
	addcc	%i7,	0x1474,	%g2
loop_529:
	move	%icc,	0x395,	%g7
loop_530:
	faligndata	%f6,	%f26,	%f10
	rd	%pc,	%i1
	edge8	%o1,	%g6,	%o4
	fxnors	%f18,	%f30,	%f3
	movug	%fcc3,	0x27C,	%i4
	edge8n	%i0,	%o3,	%o0
	nop
	set	0x70, %i6
	ldsw	[%l7 + %i6],	%l4
	call	loop_531
	fmovscs	%icc,	%f10,	%f17
	movrgz	%o6,	0x2CF,	%l6
	call	loop_532
loop_531:
	nop
	set	0x0C, %g6
	swap	[%l7 + %g6],	%i5
	call	loop_533
	movg	%fcc3,	0x00F,	%l5
loop_532:
	sethi	0x1847,	%l1
	fornot1s	%f8,	%f27,	%f8
loop_533:
	tgu	%icc,	0x0
	call	loop_534
	add	%i6,	0x0E0F,	%l3
	tsubcctv	%i3,	0x1096,	%o5
	rdpr	%otherwin,	%g3
loop_534:
	call	loop_535
	fxnor	%f20,	%f22,	%f8
	call	loop_536
	addc	%g1,	%o7,	%l2
loop_535:
	call	loop_537
	fand	%f30,	%f28,	%f20
loop_536:
	bl,a,pn	%xcc,	loop_538
	st	%f9,	[%l7 + 0x24]
loop_537:
	fandnot1	%f20,	%f8,	%f6
	nop
	setx	0xDD8F052A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xFF91EDA1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f30,	%f3
loop_538:
	movrgez	%l0,	0x2DB,	%g4
	array32	%o2,	%i2,	%g5
	call	loop_539
	nop
	setx	0x65982B66,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x46D43CF1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f12,	%f4
	call	loop_540
	call	loop_541
loop_539:
	call	loop_542
	nop
	fitos	%f7,	%f13
	fstod	%f13,	%f22
loop_540:
	fcmpes	%fcc3,	%f27,	%f17
loop_541:
	call	loop_543
loop_542:
	fbu,pn	%fcc3,	loop_544
	andncc	%g2,	%g7,	%i7
	nop
	setx	0xE0E9717058494618,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f2
loop_543:
	edge8	%o1,	%g6,	%o4
loop_544:
	fmovdpos	%icc,	%f24,	%f14
	udivx	%i1,	0x00,	%i4
	fcmpes	%fcc1,	%f19,	%f22
	fmovduge	%fcc2,	%f24,	%f0
	rdpr	%cwp,	%o3
	call	loop_545
	andn	%i0,	%l4,	%o6
	set	0x74, %l6
	stha	%l6,	[%l7 + %l6] 0x80
loop_545:
	call	loop_546
	fpackfix	%f6,	%f31
	array32	%i5,	%o0,	%l1
	andcc	%l5,	%i6,	%i3
loop_546:
	nop
	set	0x50, %o4
	ldstuba	[%l7 + %o4] 0x04,	%l3
	fmovde	%icc,	%f0,	%f12
	fmovsl	%fcc2,	%f8,	%f18
	smul	%g3,	0x1B7E,	%o5
	call	loop_547
	fba,a	%fcc1,	loop_548
	brgz,a	%g1,	loop_549
	fsrc2s	%f10,	%f1
loop_547:
	fcmpeq32	%f10,	%f10,	%o7
loop_548:
	fpsub32s	%f7,	%f8,	%f3
loop_549:
	tleu	%xcc,	0x2
	te	%xcc,	0x5
	tpos	%xcc,	0x7
	movvs	%icc,	%l2,	%g4
	call	loop_550
	orncc	%l0,	0x10CE,	%i2
	movge	%icc,	%o2,	%g5
	wrpr	%g2,	0x1D12,	%pil
loop_550:
	nop
	setx	loop_551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034100001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsa	%fcc3,	%f17,	%f15
	nop
	setx	0xD394D9B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB9BEB430,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f1,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_551:
	call	loop_552
	call	loop_553
	call	loop_554
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f24
loop_552:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_553:
	bcc	%xcc,	loop_555
loop_554:
	call	loop_556
	fmuld8sux16	%f10,	%f2,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x958, 	%hsys_tick_cmpr
loop_555:
	orcc	%i1,	0x169A,	%o3
loop_556:
	wrpr	%i4,	0x0F5E,	%cwp
	call	loop_557
	stx	%l4,	[%l7 + 0x70]
	set	0x2C, %i3
	lduwa	[%l7 + %i3] 0x19,	%o6
loop_557:
	fmovdo	%fcc1,	%f6,	%f22
	fmovspos	%xcc,	%f7,	%f14
	mova	%xcc,	0x3C6,	%i0
	or	%l6,	0x16C6,	%i5
	call	loop_558
	fcmpne32	%f26,	%f22,	%l1
	tg	%xcc,	0x4
	call	loop_559
loop_558:
	call	loop_560
	fmovrde	%l5,	%f4,	%f22
	rdpr	%otherwin,	%o0
loop_559:
	call	loop_561
loop_560:
	fmovsvs	%icc,	%f29,	%f20
	addccc	%i3,	0x04E9,	%l3
	fmovsa	%icc,	%f16,	%f22
loop_561:
	movl	%fcc3,	%g3,	%i6
	rdhpr	%htba,	%g1
	fmovs	%f30,	%f14
	movvs	%icc,	0x5FB,	%o7
	mulscc	%l2,	%g4,	%o5
	call	loop_562
	nop
	setx	loop_563,	%l0,	%l1
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
	movcc	%xcc,	0x7A2,	%i2
	call	loop_564
loop_562:
	umul	%o2,	0x161B,	%g5
loop_563:
	call	loop_565
	fmovdneg	%icc,	%f8,	%f8
loop_564:
	fnot2	%f4,	%f16
	call	loop_566
loop_565:
	movne	%xcc,	%l0,	%g2
	lduw	[%l7 + 0x3C],	%o1
	andn	%i7,	%g6,	%g7
loop_566:
	fpadd32s	%f26,	%f20,	%f29
	fors	%f12,	%f6,	%f15
	call	loop_567
	andncc	%o4,	%i1,	%o3
	movleu	%icc,	0x785,	%i4
	subccc	%o6,	%l4,	%l6
loop_567:
	fcmpgt16	%f10,	%f8,	%i5
	nop
	setx	0x6461A38F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f11
	call	loop_568
	sdivx	%l1,	%l5,	%o0
	call	loop_569
	brgez,a	%i0,	loop_570
loop_568:
	call	loop_571
	edge8	%l3,	%i3,	%i6
loop_569:
	umulcc	%g3,	0x0DE6,	%g1
loop_570:
	call	loop_572
loop_571:
	fmovsne	%fcc3,	%f22,	%f31
	edge16	%l2,	%o7,	%o5
	fnegd	%f24,	%f0
loop_572:
	wrpr	%i2,	0x0ED4,	%tick
	umulcc	%g4,	%o2,	%l0
	movuge	%fcc1,	%g2,	%o1
	srlx	%i7,	0x0A,	%g5
	call	loop_573
	sdivcc	%g7,	0x00,	%g6
	wrpr	%o4,	%i1,	%cwp
	call	loop_574
loop_573:
	and	%o3,	%i4,	%l4
	be,a,pt	%xcc,	loop_575
	fpsub16s	%f19,	%f25,	%f14
loop_574:
	call	loop_576
	edge32	%o6,	%l6,	%l1
loop_575:
	call	loop_577
	bleu	%icc,	loop_578
loop_576:
	tcc	%xcc,	0x6
	bge,a,pn	%xcc,	loop_579
loop_577:
	fmovsneg	%icc,	%f10,	%f26
loop_578:
	faligndata	%f20,	%f0,	%f20
	fmovrse	%l5,	%f11,	%f25
loop_579:
	fnot2	%f10,	%f30
	fnor	%f8,	%f4,	%f22
	nop
	setx	0xCE7F13A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2259BFFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f7,	%f1
	call	loop_580
	call	loop_581
	call	loop_582
	call	loop_583
loop_580:
	array16	%o0,	%i5,	%i0
loop_581:
	bl	%icc,	loop_584
loop_582:
	nop
	setx	0xBE8E99DDFCA7D77D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBA8F9196E7A62B20,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f24,	%f28
loop_583:
	movn	%xcc,	%l3,	%i6
	call	loop_585
loop_584:
	fmovdue	%fcc3,	%f6,	%f8
	umul	%i3,	0x1346,	%g3
	tcc	%xcc,	0x6
loop_585:
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f1
	wrpr	%l2,	%g1,	%tick
	call	loop_586
	fmovdne	%xcc,	%f8,	%f30
loop_586:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 19
!	Type a   	: 32
!	Type x   	: 9
!	Type cti   	: 152
!	Type f   	: 156
!	Type i   	: 132
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
	set	0x7,	%g1
	set	0xD,	%g2
	set	0xE,	%g3
	set	0x7,	%g4
	set	0x5,	%g5
	set	0xF,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xC,	%i1
	set	-0x2,	%i2
	set	-0x8,	%i3
	set	-0xC,	%i4
	set	-0xE,	%i5
	set	-0x6,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x7C5DEDB0,	%l0
	set	0x735CBAE6,	%l1
	set	0x258C02B7,	%l2
	set	0x1BCAEDA7,	%l3
	set	0x0EB1C413,	%l4
	set	0x5F092059,	%l5
	set	0x58F6F1B6,	%l6
	!# Output registers
	set	-0x0A64,	%o0
	set	0x0999,	%o1
	set	0x1CE5,	%o2
	set	0x1B2F,	%o3
	set	0x02F4,	%o4
	set	-0x02D2,	%o5
	set	0x160E,	%o6
	set	-0x0A7C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	bl,pt	%xcc,	loop_587
	alignaddr	%o5,	%i2,	%g4
	fandnot1	%f16,	%f30,	%f14
	fmovdue	%fcc0,	%f30,	%f24
loop_587:
	nop
	fitos	%f14,	%f26
	fstoi	%f26,	%f6
	fsrc2s	%f0,	%f8
	call	loop_588
	fmovsgu	%xcc,	%f5,	%f14
	tn	%icc,	0x3
	call	loop_589
loop_588:
	fnor	%f6,	%f6,	%f0
	call	loop_590
	call	loop_591
loop_589:
	call	loop_592
	fxors	%f22,	%f5,	%f25
loop_590:
	fandnot2	%f20,	%f30,	%f8
loop_591:
	fmovduge	%fcc3,	%f4,	%f10
loop_592:
	tcs	%xcc,	0x7
	array32	%o7,	%l0,	%g2
	fpadd32	%f20,	%f24,	%f4
	fpack16	%f4,	%f27
	smulcc	%o1,	0x073B,	%i7
	fzero	%f18
	sir	0x0C07
	nop
	setx loop_593, %l0, %l1
	jmpl %l1, %g5
	nop
	setx	0x69B2A494,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xEF5C6B1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f25,	%f11
	movpos	%icc,	0x4EE,	%g7
	movge	%icc,	%g6,	%o2
loop_593:
	call	loop_594
	alignaddr	%i1,	%o4,	%o3
	movneg	%icc,	0x2C5,	%i4
	call	loop_595
loop_594:
	call	loop_596
	fpack16	%f14,	%f23
	wrpr 	%g0, 	0x3, 	%gl
loop_595:
	call	loop_597
loop_596:
	call	loop_598
	fmovrdgz	%l4,	%f20,	%f16
	st	%fsr,	[%l7 + 0x54]
loop_597:
	call	loop_599
loop_598:
	fmovdu	%fcc3,	%f12,	%f6
	ldub	[%l7 + 0x53],	%l1
	wr	%g0,	0x23,	%asi
	stba	%l6,	[%l7 + 0x13] %asi
	membar	#Sync
loop_599:
	call	loop_600
	call	loop_601
	call	loop_602
	call	loop_603
loop_600:
	call	loop_604
loop_601:
	fmovrse	%o0,	%f31,	%f0
loop_602:
	fpadd32s	%f30,	%f5,	%f4
loop_603:
	alignaddr	%l5,	%i5,	%l3
loop_604:
	array8	%i6,	%i0,	%i3
	brgz	%g3,	loop_605
	fxnors	%f7,	%f1,	%f10
	bmask	%l2,	%g1,	%o5
	fpsub32	%f14,	%f20,	%f12
loop_605:
	sdiv	%i2,	0x00,	%g4
	fmovdlg	%fcc3,	%f10,	%f28
	wrpr	%l0,	0x10B6,	%pil
	srlx	%o7,	0x13,	%g2
	call	loop_606
	nop
	set	0x40, %o1
	ldsh	[%l7 + %o1],	%o1
	movule	%fcc2,	0x5FD,	%g5
	fnands	%f6,	%f1,	%f11
loop_606:
	andn	%i7,	%g6,	%o2
	bn	%icc,	loop_607
	fpsub32	%f24,	%f6,	%f6
	call	loop_608
	nop
	fitos	%f1,	%f1
	fstox	%f1,	%f0
	fxtos	%f0,	%f20
loop_607:
	mulscc	%i1,	0x1AED,	%o4
	fmovslg	%fcc2,	%f15,	%f3
loop_608:
	nop
	set	0x28, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o3
	movl	%fcc0,	%i4,	%g7
	call	loop_609
	sllx	%l4,	%o6,	%l6
	call	loop_610
	andcc	%l1,	0x1830,	%o0
loop_609:
	fmul8x16al	%f29,	%f13,	%f0
	nop
	fitod	%f2,	%f24
	fdtox	%f24,	%f0
loop_610:
	call	loop_611
	call	loop_612
	tcs	%xcc,	0x5
	array16	%i5,	%l5,	%i6
loop_611:
	sdiv	%i0,	0x00,	%l3
loop_612:
	movlg	%fcc0,	%g3,	%i3
	fones	%f14
	sub	%g1,	%o5,	%i2
	be,pn	%xcc,	loop_613
	call	loop_614
	tg	%xcc,	0x2
	xorcc	%l2,	%g4,	%o7
loop_613:
	fmovsle	%fcc2,	%f23,	%f19
loop_614:
	fcmpes	%fcc3,	%f0,	%f31
	fmovs	%f3,	%f15
	fmovrsgez	%g2,	%f14,	%f25
	call	loop_615
	fornot2s	%f0,	%f1,	%f13
	call	loop_616
	addcc	%l0,	0x03DB,	%o1
loop_615:
	fandnot2s	%f6,	%f25,	%f27
	call	loop_617
loop_616:
	movg	%icc,	0x0CF,	%g5
	subcc	%g6,	%o2,	%i7
	sra	%i1,	%o4,	%o3
loop_617:
	fmovsuge	%fcc1,	%f18,	%f13
	rdhpr	%htba,	%g7
	edge32ln	%l4,	%o6,	%i4
	rd	%pc,	%l1
	call	loop_618
	movo	%fcc0,	%o0,	%l6
	tge	%icc,	0x0
	orcc	%i5,	0x0B40,	%l5
loop_618:
	fmovrdne	%i0,	%f2,	%f16
	call	loop_619
	sdivx	%i6,	%l3,	%i3
	call	loop_620
	rd	%sys_tick_cmpr,	%g3
loop_619:
	call	loop_621
	nop
	setx	0x4FFA28A15D5EF461,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5F384DFC09BCEF1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f10
loop_620:
	fmovdu	%fcc0,	%f12,	%f12
	bmask	%o5,	%i2,	%g1
loop_621:
	fornot2s	%f28,	%f24,	%f12
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%g4
	call	loop_622
	fmovrslz	%o7,	%f24,	%f13
	rd	%softint,	%l2
	nop
	setx	0xC2C4EEF00F7B84A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x1F2E655A950F3C3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f14,	%f8
loop_622:
	movrlez	%g2,	0x10E,	%l0
	call	loop_623
	call	loop_624
	fmovdg	%fcc3,	%f28,	%f10
	bvc	%xcc,	loop_625
loop_623:
	tvc	%xcc,	0x5
loop_624:
	fmovdcs	%xcc,	%f4,	%f28
	set	0x56, %i7
	lduha	[%l7 + %i7] 0x80,	%g5
loop_625:
	edge16l	%o1,	%o2,	%i7
	rdpr	%wstate,	%i1
	nop
	fitos	%f8,	%f16
	fstod	%f16,	%f26
	fmovdleu	%xcc,	%f2,	%f26
	tsubcctv	%g6,	0x1872,	%o3
	call	loop_626
	call	loop_627
	wr	%o4,	%l4,	%clear_softint
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f10
loop_626:
	fbul	%fcc2,	loop_628
loop_627:
	subccc	%g7,	%o6,	%i4
	fnot1	%f16,	%f8
	sdivx	%o0,	%l1,	%i5
loop_628:
	fmovsneg	%icc,	%f22,	%f11
	call	loop_629
	tvs	%icc,	0x0
	call	loop_630
	alignaddr	%l6,	%l5,	%i6
loop_629:
	fornot2	%f6,	%f4,	%f26
	alignaddrl	%i0,	%l3,	%i3
loop_630:
	array8	%g3,	%i2,	%g1
	movo	%fcc0,	%g4,	%o5
	orncc	%l2,	%o7,	%g2
	call	loop_631
	for	%f8,	%f14,	%f24
	tgu	%icc,	0x7
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f6
loop_631:
	edge32l	%g5,	%l0,	%o1
	fmovdneg	%xcc,	%f0,	%f8
	ba,pt	%icc,	loop_632
	fmovsneg	%icc,	%f12,	%f3
	call	loop_633
	add	%i7,	%o2,	%i1
loop_632:
	rdhpr	%hintp,	%g6
	fmovdge	%fcc2,	%f30,	%f0
loop_633:
	sllx	%o3,	0x04,	%o4
	movneg	%xcc,	0x2F8,	%g7
	fmovdcc	%icc,	%f8,	%f6
	fcmpne32	%f0,	%f8,	%l4
	fpack16	%f0,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdule	%fcc2,	%f8,	%f16
	call	loop_634
	fmovsvs	%xcc,	%f23,	%f24
	fmovrdgez	%i4,	%f22,	%f14
	movne	%icc,	0x444,	%l1
loop_634:
	nop
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x11,	%i5
	flushw
	call	loop_635
	call	loop_636
	nop
	fitod	%f12,	%f26
	fnor	%f12,	%f30,	%f16
loop_635:
	fmovscc	%icc,	%f4,	%f12
loop_636:
	call	loop_637
	sllx	%l6,	%i6,	%i0
	fmovsvc	%xcc,	%f6,	%f29
	call	loop_638
loop_637:
	fmul8x16au	%f24,	%f14,	%f16
	rd	%softint,	%l3
	edge16ln	%l5,	%g3,	%i2
loop_638:
	sub	%i3,	0x09C8,	%g4
	tsubcctv	%o5,	0x12D6,	%l2
	fmovdug	%fcc3,	%f8,	%f30
	call	loop_639
	fpsub32	%f22,	%f6,	%f10
	fnot1s	%f5,	%f3
	fmovdneg	%icc,	%f0,	%f20
loop_639:
	movuge	%fcc1,	%g1,	%o7
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f9
	fandnot2s	%f6,	%f2,	%f8
	edge16	%g2,	%g5,	%l0
	fmul8sux16	%f6,	%f0,	%f24
	set	0x3c8, %l1
!!	ldxa	[%g0 + %l1] 0x40,	%o1
	bmask	%o2,	%i7,	%g6
	call	loop_640
	bmask	%o3,	%i1,	%g7
	fbg,pt	%fcc1,	loop_641
	bvs	%xcc,	loop_642
loop_640:
	call	loop_643
	call	loop_644
loop_641:
	or	%o4,	%o6,	%o0
loop_642:
	fmuld8ulx16	%f1,	%f28,	%f24
loop_643:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_644:
	movcc	%xcc,	%i5,	%l4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsuge	%fcc2,	%f20,	%f17
	tsubcc	%i6,	%l6,	%l3
	tcc	%xcc,	0x3
	fzeros	%f31
	fnor	%f28,	%f30,	%f22
	tne	%icc,	0x5
	fxors	%f20,	%f4,	%f23
	movule	%fcc2,	0x685,	%l5
	tvs	%icc,	0x4
	call	loop_645
	fmovdneg	%xcc,	%f30,	%f26
	fpadd32	%f28,	%f0,	%f26
	tg	%icc,	0x7
loop_645:
	fbo,pn	%fcc3,	loop_646
	call	loop_647
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f0
	call	loop_648
loop_646:
	nop
	fitos	%f14,	%f28
	fstoi	%f28,	%f10
loop_647:
	call	loop_649
	movleu	%icc,	%g3,	%i0
loop_648:
	fbge,a	%fcc2,	loop_650
	subcc	%i3,	0x1A34,	%g4
loop_649:
	call	loop_651
	subccc	%o5,	%l2,	%g1
loop_650:
	fmovdcc	%xcc,	%f22,	%f30
	call	loop_652
loop_651:
	call	loop_653
	call	loop_654
	movrne	%i2,	0x332,	%o7
loop_652:
	fcmpeq16	%f24,	%f8,	%g2
loop_653:
	call	loop_655
loop_654:
	edge8ln	%l0,	%g5,	%o1
	rd	%softint,	%i7
	movrlez	%o2,	0x138,	%o3
loop_655:
	sir	0x0B50
	call	loop_656
	edge32ln	%i1,	%g6,	%g7
	fbue	%fcc2,	loop_657
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_656:
	fmovdleu	%xcc,	%f12,	%f12
	te	%xcc,	0x3
loop_657:
	rdhpr	%hpstate,	%o4
	fbe,a	%fcc2,	loop_658
	fmovdge	%fcc0,	%f0,	%f16
	fmovsne	%xcc,	%f11,	%f15
	fxors	%f22,	%f14,	%f8
loop_658:
	movne	%fcc1,	%o0,	%o6
	rdpr	%tba,	%l1
	alignaddr	%i4,	%l4,	%i6
	fandnot1s	%f31,	%f30,	%f4
	edge8	%l6,	%l3,	%i5
	call	loop_659
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f0
	fxtos	%f0,	%f11
	mulx	%g3,	0x15C2,	%i0
	wrpr 	%g0, 	0x1, 	%gl
loop_659:
	wr	%l5,	0x048C,	%pic
	call	loop_660
	call	loop_661
	srlx	%o5,	0x11,	%l2
	tcs	%xcc,	0x6
loop_660:
	fornot1s	%f16,	%f5,	%f14
loop_661:
	fzeros	%f20
	srax	%g1,	%g4,	%o7
	lduw	[%l7 + 0x38],	%i2
	fmovrdne	%l0,	%f16,	%f0
	brlez,pt	%g2,	loop_662
	fabss	%f22,	%f6
	call	loop_663
	fmovsleu	%icc,	%f6,	%f3
loop_662:
	fcmpgt16	%f18,	%f6,	%o1
	fnegs	%f31,	%f6
loop_663:
	nop
	set	0x67, %i5
	ldstub	[%l7 + %i5],	%g5
	fcmpeq16	%f22,	%f24,	%i7
	alignaddrl	%o2,	%o3,	%g6
	ldsb	[%l7 + 0x68],	%g7
	call	loop_664
	bshuffle	%f0,	%f4,	%f12
	movo	%fcc3,	%o4,	%i1
	fmul8x16	%f13,	%f22,	%f28
loop_664:
	sll	%o0,	%o6,	%l1
	tneg	%xcc,	0x7
	wr 	%g0, 	0x7, 	%fprs
	edge8n	%l4,	%i6,	%l6
	fornot1s	%f29,	%f26,	%f12
	movrgez	%l3,	%i5,	%i0
	call	loop_665
	call	loop_666
	fmovdule	%fcc3,	%f12,	%f22
	movrlz	%i3,	0x3BC,	%l5
loop_665:
	movpos	%xcc,	0x452,	%g3
loop_666:
	call	loop_667
	fmovrdlz	%o5,	%f12,	%f2
	brlez,a	%l2,	loop_668
	fmovde	%fcc3,	%f2,	%f26
loop_667:
	fmovrde	%g1,	%f26,	%f24
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_668:
	edge32	%g4,	%i2,	%o7
	call	loop_669
	siam	0x3
	bpos	%icc,	loop_670
	edge16l	%l0,	%g2,	%o1
loop_669:
	fpackfix	%f2,	%f18
	call	loop_671
loop_670:
	tcc	%icc,	0x1
	subc	%i7,	%g5,	%o2
	fcmpes	%fcc3,	%f14,	%f15
loop_671:
	bmask	%g6,	%o3,	%o4
	fmovsg	%icc,	%f30,	%f25
	umul	%g7,	%i1,	%o0
	fands	%f25,	%f23,	%f0
	call	loop_672
	movu	%fcc1,	0x4C7,	%o6
	call	loop_673
	movrgz	%l1,	0x2AF,	%l4
loop_672:
	fpack32	%f24,	%f16,	%f26
	rdhpr	%ver,	%i4
loop_673:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f4
	membar	0x3C
	bpos	%xcc,	loop_674
	te	%icc,	0x0
	movrgz	%l6,	%l3,	%i6
	movpos	%icc,	%i5,	%i3
loop_674:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_675
	fmovsule	%fcc0,	%f17,	%f14
	call	loop_676
	fones	%f0
loop_675:
	fones	%f9
	fmovsa	%fcc1,	%f24,	%f3
loop_676:
	sra	%l5,	0x15,	%g3
	fmul8x16	%f8,	%f12,	%f28
	call	loop_677
	fandnot1	%f8,	%f20,	%f0
	call	loop_678
	call	loop_679
loop_677:
	orncc	%i0,	%l2,	%o5
	fnot2	%f26,	%f22
loop_678:
	movo	%fcc2,	0x122,	%g1
loop_679:
	call	loop_680
	call	loop_681
	call	loop_682
	alignaddr	%i2,	%o7,	%l0
loop_680:
	movpos	%icc,	%g4,	%o1
loop_681:
	wrpr 	%g0, 	0x2, 	%gl
loop_682:
	ta	%xcc,	0x0
	ldx	[%l7 + 0x30],	%g5
	edge32n	%i7,	%g6,	%o2
	fmovsuge	%fcc2,	%f7,	%f4
	fpsub16s	%f17,	%f3,	%f4
	call	loop_683
	fpadd16s	%f5,	%f10,	%f19
	orn	%o4,	%o3,	%g7
	movne	%fcc2,	0x44D,	%i1
loop_683:
	fmovsgu	%xcc,	%f8,	%f28
	array8	%o0,	%l1,	%l4
	bshuffle	%f2,	%f30,	%f30
	be	%icc,	loop_684
	fpsub16s	%f17,	%f27,	%f18
	nop
	setx	0x185D0674D67DB2F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f26
	call	loop_685
loop_684:
	sll	%i4,	%o6,	%l3
	call	loop_686
	ta	%icc,	0x6
loop_685:
	nop
	fitos	%f2,	%f10
	fstod	%f10,	%f22
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x78] %asi
loop_686:
	xorcc	%l6,	0x1BB9,	%i5
	fexpand	%f13,	%f2
	rdpr	%pil,	%i3
	call	loop_687
	edge16n	%l5,	%i6,	%g3
	edge32n	%i0,	%o5,	%l2
	call	loop_688
loop_687:
	fornot1	%f16,	%f26,	%f4
	fmovdcs	%xcc,	%f0,	%f18
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf0
	membar	#Sync
loop_688:
	call	loop_689
	fpadd32	%f22,	%f14,	%f4
	call	loop_690
	edge16n	%g1,	%i2,	%l0
loop_689:
	rd	%tick_cmpr,	%g4
	fxnor	%f12,	%f22,	%f14
loop_690:
	call	loop_691
	edge16ln	%o1,	%o7,	%g2
	fpack16	%f14,	%f2
	andncc	%i7,	%g6,	%o2
loop_691:
	and	%o4,	%g5,	%g7
	fornot1	%f4,	%f12,	%f6
	edge32n	%i1,	%o0,	%l1
	fmovdlg	%fcc2,	%f18,	%f10
	and	%l4,	0x1F19,	%i4
	fornot2	%f4,	%f18,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8FB, 	%tick_cmpr
	fmovdg	%fcc0,	%f30,	%f4
	call	loop_692
	fnot2	%f30,	%f20
	tsubcc	%o6,	%l3,	%l6
	fmovsuge	%fcc2,	%f22,	%f17
loop_692:
	movvc	%xcc,	0x786,	%i5
	fpack32	%f6,	%f14,	%f22
	call	loop_693
	movneg	%xcc,	0x116,	%l5
	fornot2s	%f17,	%f28,	%f21
	rd	%tick_cmpr,	%i3
loop_693:
	movrne	%g3,	%i6,	%o5
	fmovdlg	%fcc2,	%f26,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE17, 	%hsys_tick_cmpr
	call	loop_694
	wr 	%g0, 	0x6, 	%fprs
	movrne	%l0,	0x3C1,	%g4
	bl,a,pn	%icc,	loop_695
loop_694:
	wrpr	%o7,	0x1EA0,	%cwp
	call	loop_696
	call	loop_697
loop_695:
	call	loop_698
	fmovdue	%fcc2,	%f18,	%f6
loop_696:
	fmovsgu	%xcc,	%f31,	%f0
loop_697:
	fmovdcs	%xcc,	%f18,	%f10
loop_698:
	edge8l	%o1,	%g2,	%g6
	movre	%i7,	0x0E6,	%o4
	nop
	setx	0x567033CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xA12640B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f14,	%f27
	andncc	%o2,	0x1E73,	%g5
	fmovrdlez	%i1,	%f26,	%f16
	call	loop_699
	rd	%y,	%o0
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f4
	call	loop_700
loop_699:
	movcc	%icc,	%g7,	%l4
	fxor	%f0,	%f0,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_700:
	call	loop_701
	call	loop_702
	fcmpne16	%f10,	%f4,	%o6
	fxor	%f12,	%f20,	%f30
loop_701:
	tl	%xcc,	0x7
loop_702:
	tl	%xcc,	0x2
	fnands	%f29,	%f29,	%f14
	fmovdvc	%icc,	%f22,	%f20
	call	loop_703
	call	loop_704
	call	loop_705
	fmovdvc	%xcc,	%f14,	%f2
loop_703:
	rdhpr	%htba,	%l3
loop_704:
	nop
	fitos	%f8,	%f17
	fstoi	%f17,	%f30
loop_705:
	movul	%fcc1,	0x541,	%l1
	call	loop_706
	tcc	%xcc,	0x4
	andn	%l6,	0x0356,	%i5
	movcs	%icc,	0x769,	%l5
loop_706:
	nop
	wr	%g0,	0x22,	%asi
	stha	%i3,	[%l7 + 0x3E] %asi
	membar	#Sync
	brgz,pn	%i6,	loop_707
	srax	%g3,	0x1D,	%o5
	fors	%f15,	%f1,	%f22
	fmovdule	%fcc2,	%f24,	%f20
loop_707:
	call	loop_708
	call	loop_709
	fmovrdgz	%i0,	%f8,	%f30
	fcmpeq16	%f8,	%f12,	%g1
loop_708:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_709:
	flushw
	call	loop_710
	rd	%asi,	%i2
	fmovrdgz	%l2,	%f0,	%f16
	fnegs	%f24,	%f1
loop_710:
	call	loop_711
	flushw
	call	loop_712
	fnot2s	%f11,	%f13
loop_711:
	fbo,a	%fcc0,	loop_713
	tle	%xcc,	0x6
loop_712:
	movgu	%icc,	0x33E,	%g4
	fbule	%fcc3,	loop_714
loop_713:
	nop

loop_714:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 16
!	Type a   	: 31
!	Type x   	: 9
!	Type cti   	: 128
!	Type f   	: 161
!	Type i   	: 155
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
	set	0x8,	%g2
	set	0x5,	%g3
	set	0x1,	%g4
	set	0x5,	%g5
	set	0xB,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x9,	%i1
	set	-0x7,	%i2
	set	-0xB,	%i3
	set	-0x4,	%i4
	set	-0xC,	%i5
	set	-0xF,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x5FC8934E,	%l0
	set	0x709EB3A0,	%l1
	set	0x7B7F558F,	%l2
	set	0x4D1B0F9F,	%l3
	set	0x3B2E86FE,	%l4
	set	0x1BE9B413,	%l5
	set	0x649F9DAD,	%l6
	!# Output registers
	set	0x02D3,	%o0
	set	0x0DB5,	%o1
	set	-0x1133,	%o2
	set	0x1184,	%o3
	set	-0x024D,	%o4
	set	-0x0758,	%o5
	set	-0x14B0,	%o6
	set	-0x1178,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	nop
	setx loop_715, %l0, %l1
	jmpl %l1, %o7
	st	%f17,	[%l7 + 0x0C]
	movlg	%fcc0,	0x4D1,	%l0
	set	0x27, %o2
	stba	%g2,	[%l7 + %o2] 0xe3
	membar	#Sync
loop_715:
	call	loop_716
	fba	%fcc0,	loop_717
	be,a	%icc,	loop_718
	srlx	%o1,	%g6,	%o4
loop_716:
	call	loop_719
loop_717:
	fnands	%f25,	%f24,	%f17
loop_718:
	and	%i7,	0x1A6B,	%o2
	fmovdul	%fcc1,	%f26,	%f16
loop_719:
	stb	%i1,	[%l7 + 0x35]
	st	%f12,	[%l7 + 0x7C]
	smulcc	%g5,	0x00AE,	%g7
	wrpr 	%g0, 	0x3, 	%gl
	movle	%fcc3,	0x3C2,	%i4
	fmovscc	%icc,	%f6,	%f12
	sdiv	%l4,	%o6,	%l3
	rd	%pc,	%l1
	fmovdle	%icc,	%f28,	%f12
	call	loop_720
	fabsd	%f18,	%f6
	call	loop_721
	call	loop_722
loop_720:
	rdpr	%cleanwin,	%l6
	nop
	set	0x70, %l3
	stx	%i5,	[%l7 + %l3]
loop_721:
	wrpr	%o3,	%i3,	%tick
loop_722:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3B] %asi,	%i6
	call	loop_723
	fmovsvc	%icc,	%f11,	%f22
	sllx	%g3,	0x0E,	%l5
	call	loop_724
loop_723:
	fmovsge	%fcc3,	%f9,	%f19
	wrpr 	%g0, 	0x1, 	%gl
	ldstub	[%l7 + 0x0B],	%i0
loop_724:
	call	loop_725
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f6
	movu	%fcc3,	%g1,	%l2
	call	loop_726
loop_725:
	andcc	%i2,	%o7,	%g4
	fpmerge	%f24,	%f23,	%f28
	fmuld8ulx16	%f23,	%f0,	%f10
loop_726:
	call	loop_727
	call	loop_728
	call	loop_729
	fmovrsgez	%l0,	%f17,	%f3
loop_727:
	fcmpne16	%f8,	%f30,	%o1
loop_728:
	brz,pn	%g2,	loop_730
loop_729:
	fnegs	%f11,	%f16
	fandnot1	%f4,	%f22,	%f4
	bshuffle	%f22,	%f14,	%f28
loop_730:
	tn	%xcc,	0x6
	fmovse	%xcc,	%f10,	%f13
	fnands	%f21,	%f25,	%f5
	movrlez	%g6,	0x008,	%o4
	fpadd32	%f10,	%f12,	%f14
	fpadd32	%f30,	%f0,	%f20
	tg	%icc,	0x3
	call	loop_731
	fmovsl	%fcc0,	%f27,	%f31
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 2
	tleu	%xcc,	0x7
loop_731:
	tg	%icc,	0x0
	call	loop_732
	fsrc2s	%f13,	%f29
	fbule	%fcc1,	loop_733
	call	loop_734
loop_732:
	call	loop_735
	bn	%xcc,	loop_736
loop_733:
	fmovsneg	%xcc,	%f2,	%f26
loop_734:
	call	loop_737
loop_735:
	call	loop_738
loop_736:
	movpos	%xcc,	0x24F,	%i7
	srlx	%o2,	0x06,	%g5
loop_737:
	call	loop_739
loop_738:
	call	loop_740
	edge32	%g7,	%i1,	%o0
	addc	%l4,	%i4,	%l3
loop_739:
	udiv	%o6,	0x00,	%l1
loop_740:
	alignaddrl	%i5,	%o3,	%i3
	fpack16	%f28,	%f6
	fnand	%f26,	%f12,	%f12
	call	loop_741
	fpsub16	%f8,	%f28,	%f28
	call	loop_742
	smul	%l6,	0x0909,	%i6
loop_741:
	movul	%fcc1,	%g3,	%o5
	edge8	%i0,	%l5,	%l2
loop_742:
	edge16	%g1,	%i2,	%o7
	edge32n	%l0,	%o1,	%g4
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f6
	nop
	setx	0x65D2DE6F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x4131010A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f20,	%f2
	xor	%g2,	0x06A0,	%g6
	call	loop_743
	fcmpd	%fcc1,	%f10,	%f8
	nop
	setx	0xA9D2F711DA73C259,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x802D9D1766B0F6E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f4,	%f30
	fmovs	%f5,	%f6
loop_743:
	fabss	%f10,	%f13
	call	loop_744
	fmovrdne	%o4,	%f2,	%f18
	stbar
	call	loop_745
loop_744:
	nop
	setx	loop_746,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_747
	nop
	set	0x39, %l0
	ldstub	[%l7 + %l0],	%o2
loop_745:
	fmovrsgez	%g5,	%f13,	%f15
loop_746:
	fpadd16	%f20,	%f14,	%f20
loop_747:
	fmovsvc	%xcc,	%f30,	%f8
	set	0x17, %g3
	stba	%i7,	[%l7 + %g3] 0x04
	fmovrsgz	%g7,	%f13,	%f7
	smul	%i1,	%o0,	%i4
	fnot2	%f28,	%f14
	fmovslg	%fcc1,	%f5,	%f21
	fornot1	%f24,	%f0,	%f0
	edge16ln	%l4,	%l3,	%l1
	fbl	%fcc2,	loop_748
	fcmpd	%fcc3,	%f30,	%f10
	call	loop_749
	call	loop_750
loop_748:
	nop
	setx	0x987F605A8604EB83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0800C57C7E39214A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f24,	%f26
	call	loop_751
loop_749:
	udivx	%i5,	%o3,	%i3
loop_750:
	call	loop_752
	fmovsl	%icc,	%f19,	%f23
loop_751:
	fmovrse	%l6,	%f23,	%f9
	call	loop_753
loop_752:
	fabsd	%f24,	%f2
	brgz,a,pn	%o6,	loop_754
	call	loop_755
loop_753:
	rdhpr	%htba,	%i6
	nop
	setx loop_756, %l0, %l1
	jmpl %l1, %o5
loop_754:
	fmovdn	%fcc0,	%f20,	%f28
loop_755:
	call	loop_757
	fmovdule	%fcc2,	%f8,	%f16
loop_756:
	rdhpr	%ver,	%g3
	edge32ln	%l5,	%i0,	%l2
loop_757:
	nop
	set	0x40, %o6
	ldub	[%l7 + %o6],	%i2
	fmovdpos	%xcc,	%f20,	%f18
	fmovscs	%xcc,	%f5,	%f3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wrpr	%g1,	0x0750,	%cwp
	fmovrde	%l0,	%f6,	%f16
	call	loop_758
	call	loop_759
	call	loop_760
	call	loop_761
loop_758:
	fbu,pn	%fcc2,	loop_762
loop_759:
	alignaddrl	%o1,	%o7,	%g4
loop_760:
	edge16n	%g6,	%g2,	%o2
loop_761:
	fabsd	%f18,	%f2
loop_762:
	nop
	setx	0x930ED6CEFC02A26B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fnot2s	%f4,	%f14
	fnor	%f26,	%f8,	%f30
	addcc	%g5,	%o4,	%g7
	call	loop_763
	movgu	%xcc,	0x4FC,	%i1
	ta	%xcc,	0x7
	call	loop_764
loop_763:
	fmovdu	%fcc2,	%f30,	%f22
	fcmpeq16	%f28,	%f14,	%i7
	and	%o0,	0x06F9,	%l4
loop_764:
	wrpr	%l3,	%l1,	%tick
	fpack32	%f10,	%f8,	%f24
	addccc	%i4,	%i5,	%o3
	fmuld8ulx16	%f21,	%f22,	%f28
	call	loop_765
	fpadd32	%f6,	%f14,	%f20
	wr	%l6,	%i3,	%set_softint
	fmovsl	%xcc,	%f27,	%f19
loop_765:
	call	loop_766
	umul	%i6,	0x082E,	%o5
	call	loop_767
	call	loop_768
loop_766:
	fmovspos	%xcc,	%f6,	%f26
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f0
loop_767:
	call	loop_769
loop_768:
	mulscc	%g3,	%o6,	%i0
	movleu	%icc,	%l5,	%l2
	fnot2	%f0,	%f30
loop_769:
	brz	%i2,	loop_770
	nop
	setx	0x679F37623374CA5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xB975978165F45BE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f14,	%f14
	fmovsvc	%icc,	%f8,	%f2
	tneg	%icc,	0x6
loop_770:
	fornot1s	%f28,	%f11,	%f5
	fpackfix	%f30,	%f16
	call	loop_771
	fmovdn	%icc,	%f22,	%f26
	movrlez	%g1,	%l0,	%o1
	movvc	%icc,	0x37E,	%o7
loop_771:
	call	loop_772
	fabss	%f16,	%f0
	fmovdue	%fcc1,	%f14,	%f20
	bneg	%icc,	loop_773
loop_772:
	fnot2	%f26,	%f0
	fmovdvc	%xcc,	%f28,	%f26
	fmul8sux16	%f6,	%f2,	%f22
loop_773:
	bvs	%xcc,	loop_774
	fmovsle	%fcc3,	%f15,	%f23
	nop
	setx	loop_775,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_776
loop_774:
	call	loop_777
	nop
	fitos	%f9,	%f11
loop_775:
	movul	%fcc2,	0x7F7,	%g6
loop_776:
	nop
	setx loop_778, %l0, %l1
	jmpl %l1, %g4
loop_777:
	movcs	%icc,	0x38B,	%g2
	fnor	%f6,	%f4,	%f14
	rdpr	%tba,	%o2
loop_778:
	bg	%xcc,	loop_779
	tn	%xcc,	0x1
	set	0x08, %i4
	ldswa	[%l7 + %i4] 0x19,	%o4
loop_779:
	fnot1s	%f1,	%f29
	bmask	%g5,	%i1,	%g7
	call	loop_780
	call	loop_781
	call	loop_782
	rdpr	%otherwin,	%i7
loop_780:
	fbule	%fcc3,	loop_783
loop_781:
	fmovrslez	%o0,	%f5,	%f30
loop_782:
	fpmerge	%f20,	%f27,	%f2
	call	loop_784
loop_783:
	fbuge,a,pt	%fcc2,	loop_785
	addcc	%l4,	%l1,	%l3
	call	loop_786
loop_784:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_785:
	call	loop_787
	move	%fcc2,	%i5,	%o3
loop_786:
	fmovrdne	%i4,	%f30,	%f24
	fcmpgt16	%f8,	%f6,	%l6
loop_787:
	fmovdo	%fcc1,	%f12,	%f4
	andn	%i6,	%i3,	%o5
	call	loop_788
	fmovda	%icc,	%f12,	%f0
	fone	%f6
	and	%g3,	%o6,	%l5
loop_788:
	bshuffle	%f16,	%f0,	%f4
	fpadd32	%f26,	%f2,	%f24
	fcmple32	%f22,	%f8,	%l2
	flush	%l7 + 0x08
	call	loop_789
	fmovsneg	%icc,	%f23,	%f7
	call	loop_790
	fmovrse	%i0,	%f17,	%f24
loop_789:
	call	loop_791
	fpack32	%f6,	%f16,	%f22
loop_790:
	fmovscs	%xcc,	%f3,	%f31
	call	loop_792
loop_791:
	fbge,a,pn	%fcc1,	loop_793
	fsrc1s	%f14,	%f7
	fpsub16	%f30,	%f14,	%f14
loop_792:
	call	loop_794
loop_793:
	addc	%i2,	0x0B7D,	%g1
	nop
	fitos	%f4,	%f3
	fstod	%f3,	%f26
	edge16l	%l0,	%o7,	%g6
loop_794:
	movgu	%xcc,	0x3BA,	%o1
	bvc,a,pn	%icc,	loop_795
	movn	%icc,	%g2,	%g4
	fcmple32	%f10,	%f4,	%o4
	call	loop_796
loop_795:
	call	loop_797
	fcmpeq16	%f24,	%f4,	%g5
	call	loop_798
loop_796:
	te	%icc,	0x3
loop_797:
	ble,pn	%icc,	loop_799
	fands	%f19,	%f29,	%f1
loop_798:
	call	loop_800
	fbue,pt	%fcc2,	loop_801
loop_799:
	fcmpne16	%f16,	%f6,	%i1
	fmovrslz	%g7,	%f22,	%f23
loop_800:
	fmovrsgz	%i7,	%f17,	%f21
loop_801:
	movlg	%fcc3,	%o0,	%l4
	movgu	%xcc,	0x5B7,	%o2
	alignaddr	%l1,	%i5,	%l3
	movcc	%icc,	%i4,	%o3
	nop
	setx	0xA1646321FF8FA9D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x85825B1B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f18,	%f10
	fmovdneg	%xcc,	%f26,	%f6
	fmovdvs	%icc,	%f4,	%f8
	call	loop_802
	nop
	setx	0x1C29EBAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x79797115,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f18,	%f8
	nop
	fitos	%f3,	%f25
	tpos	%xcc,	0x2
loop_802:
	call	loop_803
	tneg	%icc,	0x1
	call	loop_804
	fmovrdlz	%i6,	%f10,	%f14
loop_803:
	fmovduge	%fcc0,	%f24,	%f12
	call	loop_805
loop_804:
	fnegd	%f24,	%f28
	tle	%icc,	0x3
	rdpr	%pil,	%l6
loop_805:
	call	loop_806
	call	loop_807
	movg	%fcc1,	0x2F2,	%i3
	fnegs	%f6,	%f22
loop_806:
	smulcc	%g3,	0x0971,	%o6
loop_807:
	call	loop_808
	fpack16	%f24,	%f8
	set	0x78, %g4
	sta	%f11,	[%l7 + %g4] 0x19
loop_808:
	fmovdvc	%xcc,	%f10,	%f0
	sllx	%l5,	%l2,	%i0
	movvc	%icc,	0x64C,	%o5
	movrlez	%g1,	0x263,	%i2
	wr 	%g0, 	0x4, 	%fprs

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge32n	%o1,	%o7,	%g4
	fandnot2	%f22,	%f14,	%f8
	call	loop_809
	nop
	fitos	%f11,	%f6
	fstod	%f6,	%f2
	edge8n	%g2,	%g5,	%i1
	rdpr	%otherwin,	%g7
loop_809:
	call	loop_810
	fnor	%f10,	%f10,	%f10
	call	loop_811
	tsubcctv	%i7,	0x1B36,	%o4
loop_810:
	tpos	%icc,	0x1
	fpsub32s	%f9,	%f23,	%f12
loop_811:
	fmovsle	%fcc3,	%f19,	%f11
	fmovrsgez	%o0,	%f2,	%f8
	ta	%xcc,	0x6
	fmovrsgz	%o2,	%f1,	%f27
	rd	%ccr,	%l1
	fpadd16	%f12,	%f16,	%f14
	ba,a	%xcc,	loop_812
	call	loop_813
	call	loop_814
	call	loop_815
loop_812:
	rdhpr	%hintp,	%i5
loop_813:
	orcc	%l3,	0x098D,	%l4
loop_814:
	pdist	%f28,	%f8,	%f30
loop_815:
	fmovsue	%fcc3,	%f7,	%f19
	call	loop_816
	sllx	%i4,	0x12,	%o3
	fnot2s	%f16,	%f10
	movcs	%xcc,	0x5F5,	%i6
loop_816:
	call	loop_817
	wrpr	%l6,	%i3,	%pil
	array16	%o6,	%g3,	%l2
	fzeros	%f21
loop_817:
	call	loop_818
	call	loop_819
	movrne	%l5,	0x02D,	%o5
	fmovrdgz	%g1,	%f24,	%f6
loop_818:
	nop
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x19,	%f0
loop_819:
	smul	%i0,	%i2,	%g6
	sll	%l0,	0x1C,	%o7
	sethi	0x11B6,	%g4
	nop
	setx	0xDDAB5C4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f19
	call	loop_820
	call	loop_821
	fmovsvs	%icc,	%f14,	%f16
	call	loop_822
loop_820:
	call	loop_823
loop_821:
	call	loop_824
	movrlz	%g2,	%g5,	%i1
loop_822:
	call	loop_825
loop_823:
	edge16ln	%g7,	%i7,	%o1
loop_824:
	fmovsuge	%fcc1,	%f2,	%f8
	fmovdcc	%xcc,	%f12,	%f30
loop_825:
	fmovdvc	%xcc,	%f28,	%f2
	fmovdn	%icc,	%f12,	%f0
	sethi	0x0003,	%o0
	fba	%fcc1,	loop_826
	call	loop_827
	fands	%f18,	%f5,	%f31
	call	loop_828
loop_826:
	nop
	setx	0xAD8BD092BAD3E002,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xFE2484BD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f8,	%f28
loop_827:
	fmovrde	%o4,	%f10,	%f28
	te	%xcc,	0x2
loop_828:
	srax	%o2,	0x03,	%i5
	edge32	%l1,	%l4,	%l3
	call	loop_829
	fxnors	%f20,	%f23,	%f15
	fsrc1s	%f17,	%f25
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f2
loop_829:
	membar	0x6E
	fbl	%fcc0,	loop_830
	fbuge,pn	%fcc0,	loop_831
	movl	%fcc0,	%o3,	%i4
	call	loop_832
loop_830:
	call	loop_833
loop_831:
	addcc	%i6,	%l6,	%i3
	rdhpr	%hpstate,	%g3
loop_832:
	fnegs	%f16,	%f18
loop_833:
	call	loop_834
	fcmpgt16	%f12,	%f26,	%o6
	call	loop_835
	fmovsue	%fcc2,	%f4,	%f7
loop_834:
	nop
	setx	0xB5C355DDB56D36C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF3D23930,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f12,	%f8
	fnand	%f24,	%f12,	%f10
loop_835:
	nop
	setx	0xBC0190CF346F6F80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8FC428AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f6,	%f6
	fmovsu	%fcc1,	%f17,	%f10
	tsubcctv	%l5,	%o5,	%g1
	rdhpr	%htba,	%l2
	wrpr	%i0,	0x00C0,	%pil
	fornot2	%f30,	%f30,	%f28
	alignaddrl	%g6,	%l0,	%o7
	fpack32	%f6,	%f28,	%f10
	movle	%icc,	%g4,	%g2
	call	loop_836
	call	loop_837
	movneg	%icc,	%g5,	%i2
	call	loop_838
loop_836:
	call	loop_839
loop_837:
	nop
	fitos	%f14,	%f9
	fstox	%f9,	%f4
	set	0x11, %o5
	ldstuba	[%l7 + %o5] 0x19,	%g7
loop_838:
	nop
	setx	0x9841433C6FAE36BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x99192FDED23B2CD7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f0
loop_839:
	call	loop_840
	call	loop_841
	call	loop_842
	nop
	set	0x30, %i0
	std	%i0,	[%l7 + %i0]
loop_840:
	fcmpne32	%f18,	%f24,	%o1
loop_841:
	fmovsug	%fcc3,	%f11,	%f12
loop_842:
	call	loop_843
	fmovscc	%icc,	%f22,	%f4
	flushw
	fnegs	%f11,	%f28
loop_843:
	call	loop_844
	bshuffle	%f28,	%f22,	%f22
	nop
	setx	0x3F009826A14470C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x60A672E2699B3FF0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f16,	%f18
	call	loop_845
loop_844:
	call	loop_846
	nop
	setx	0xD2F8DF6C4D52B365,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x59D8A3BF20DFB76C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f24,	%f18
	rdpr	%tl,	%i7
loop_845:
	call	loop_847
loop_846:
	fmovsu	%fcc0,	%f10,	%f6
	call	loop_848
	orn	%o0,	%o4,	%o2
loop_847:
	fmovspos	%icc,	%f23,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x757, 	%hsys_tick_cmpr
loop_848:
	fmovsge	%fcc0,	%f12,	%f29
	fandnot1	%f16,	%f4,	%f30
	movcs	%xcc,	%l3,	%o3
	movuge	%fcc1,	%l1,	%i4
	alignaddr	%i6,	%i3,	%g3
	fmovsgu	%icc,	%f4,	%f6
	call	loop_849
	nop
	setx	0xD64638518C5671CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE96D4BFAAA7BD0FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f8,	%f20
	call	loop_850
	call	loop_851
loop_849:
	call	loop_852
	for	%f4,	%f10,	%f22
loop_850:
	fpsub32s	%f0,	%f4,	%f10
loop_851:
	edge16n	%o6,	%l6,	%l5
loop_852:
	movug	%fcc0,	0x7A1,	%g1
	sethi	0x0F1E,	%l2
	bmask	%i0,	%o5,	%g6
	nop
	set	0x4C, %l2
	sth	%o7,	[%l7 + %l2]
	call	loop_853
	call	loop_854
	call	loop_855
	subcc	%l0,	0x06B4,	%g2
loop_853:
	call	loop_856
loop_854:
	stx	%g4,	[%l7 + 0x28]
loop_855:
	srax	%g5,	0x0D,	%g7
	call	loop_857
loop_856:
	fble,a,pt	%fcc1,	loop_858
	call	loop_859
	fpadd16	%f18,	%f22,	%f10
loop_857:
	nop
	set	0x2C, %g7
	flush	%l7 + %g7
loop_858:
	alignaddr	%i1,	%i2,	%o1
loop_859:
	fmovsvc	%xcc,	%f11,	%f28
	fmovrslez	%i7,	%f9,	%f22
	fpack16	%f10,	%f11
	brlez,a	%o4,	loop_860
	nop
	setx	0x133CE21A713D3D09,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x529A3204ED9F55F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f28,	%f8
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f16
	fxtod	%f16,	%f14
	movgu	%xcc,	0x484,	%o2
loop_860:
	fnegd	%f6,	%f22
	call	loop_861
	membar	0x2D
	movue	%fcc0,	0x7F3,	%o0
	fcmpes	%fcc0,	%f12,	%f21
loop_861:
	fzero	%f18
	edge32n	%l4,	%l3,	%i5
	movneg	%xcc,	%l1,	%i4
	rdhpr	%ver,	%o3
	orn	%i3,	0x17A9,	%g3
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%o6
	fmovrse	%i6,	%f13,	%f6
	fnors	%f1,	%f6,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x75A, 	%hsys_tick_cmpr
	rdhpr	%ver,	%g1
	subc	%l2,	0x1A6D,	%i0
	fmovslg	%fcc1,	%f12,	%f1
	call	loop_862
	brgez,a,pt	%o5,	loop_863
	call	loop_864
	movrlz	%l6,	%g6,	%o7
loop_862:
	popc	0x0698,	%g2
loop_863:
	fandnot1	%f10,	%f16,	%f8
loop_864:
	call	loop_865
	fmovsl	%icc,	%f2,	%f26
	call	loop_866
loop_865:
	nop

loop_866:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 23
!	Type a   	: 27
!	Type x   	: 7
!	Type cti   	: 152
!	Type f   	: 174
!	Type i   	: 117
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
	set	0x5,	%g2
	set	0x8,	%g3
	set	0x3,	%g4
	set	0x1,	%g5
	set	0x2,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x0,	%i1
	set	-0x2,	%i2
	set	-0x8,	%i3
	set	-0xB,	%i4
	set	-0x2,	%i5
	set	-0x0,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x129025CF,	%l0
	set	0x3B195C57,	%l1
	set	0x3114DF09,	%l2
	set	0x78EE8992,	%l3
	set	0x5E225189,	%l4
	set	0x3BB131E0,	%l5
	set	0x2D76A76B,	%l6
	!# Output registers
	set	-0x0F03,	%o0
	set	-0x06E9,	%o1
	set	-0x04BC,	%o2
	set	0x0297,	%o3
	set	-0x1F82,	%o4
	set	0x06DA,	%o5
	set	-0x02B1,	%o6
	set	0x02A3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..


	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x633, 	%hsys_tick_cmpr
	fandnot1s	%f30,	%f14,	%f12
	fbu,a,pt	%fcc3,	loop_867
	subc	%l0,	%g7,	%i2
	fpackfix	%f30,	%f15
	edge32	%o1,	%i1,	%i7
loop_867:
	call	loop_868
	fpsub32	%f20,	%f2,	%f6
	call	loop_869
	call	loop_870
loop_868:
	call	loop_871
	call	loop_872
loop_869:
	tsubcctv	%o2,	%o0,	%o4
loop_870:
	call	loop_873
loop_871:
	subc	%l4,	0x00DB,	%l3
loop_872:
	subccc	%l1,	0x0880,	%i4
	ble,pn	%icc,	loop_874
loop_873:
	fbu,a,pt	%fcc3,	loop_875
	call	loop_876
	call	loop_877
loop_874:
	rdpr	%gl,	%i5
loop_875:
	tgu	%icc,	0x6
loop_876:
	fxors	%f9,	%f21,	%f5
loop_877:
	add	%o3,	0x1B0D,	%i3
	call	loop_878
	fcmple16	%f8,	%f20,	%g3
	or	%o6,	%i6,	%g1
	fmovdvs	%icc,	%f4,	%f10
loop_878:
	call	loop_879
	call	loop_880
	movrgez	%l2,	0x349,	%i0
	subc	%l5,	0x09A0,	%l6
loop_879:
	nop
	set	0x5C, %i2
	stba	%g6,	[%l7 + %i2] 0x19
loop_880:
	xnorcc	%o5,	0x19D2,	%g2
	call	loop_881
	xor	%g4,	0x1329,	%g5
	fmul8ulx16	%f18,	%f30,	%f10
	sdivx	%o7,	%g7,	%l0
loop_881:
	fmovdleu	%icc,	%f28,	%f4
	tl	%icc,	0x4
	fmovdul	%fcc2,	%f26,	%f8
	nop
	fitos	%f8,	%f20
	be	%icc,	loop_882
	fxnor	%f14,	%f14,	%f28
	call	loop_883
	call	loop_884
loop_882:
	st	%f30,	[%l7 + 0x38]
	fmuld8sux16	%f17,	%f31,	%f0
loop_883:
	fors	%f7,	%f29,	%f4
loop_884:
	movleu	%icc,	0x171,	%o1
	call	loop_885
	sethi	0x162B,	%i1
	xnor	%i2,	0x03F0,	%o2
	movue	%fcc3,	0x7AD,	%o0
loop_885:
	fmul8sux16	%f30,	%f20,	%f20
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x08] %asi,	%o4
	sllx	%l4,	%i7,	%l3
	edge16	%l1,	%i5,	%i4
	tneg	%xcc,	0x3
	ldub	[%l7 + 0x45],	%o3
	bshuffle	%f20,	%f8,	%f12
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f26
	call	loop_886
	sdivcc	%i3,	0x00,	%g3
	rd	%asi,	%i6
	call	loop_887
loop_886:
	call	loop_888
	fnegd	%f16,	%f10
	fmovdo	%fcc3,	%f0,	%f4
loop_887:
	flushw
loop_888:
	call	loop_889
	movge	%xcc,	%o6,	%g1
	call	loop_890
	fmovdgu	%xcc,	%f18,	%f18
loop_889:
	call	loop_891
	call	loop_892
loop_890:
	sll	%l2,	0x0A,	%l5
	edge32ln	%i0,	%g6,	%o5
loop_891:
	nop
	setx	0x1EE97655CF587080,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9AC7E5D0667FB00E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f4,	%f16
loop_892:
	subc	%g2,	0x15BF,	%l6
	call	loop_893
	tcc	%xcc,	0x6
	nop
	setx	0x01FF4681,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x046D06F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f29,	%f25
	smulcc	%g4,	%o7,	%g5
loop_893:
	taddcctv	%g7,	0x07CC,	%o1
	nop
	setx	0x2E9BAD38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f4
	smulcc	%l0,	%i1,	%i2
	movvs	%xcc,	%o2,	%o4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o0
	call	loop_894
	nop
	fitod	%f7,	%f28
	call	loop_895
	andn	%i7,	%l3,	%l1
loop_894:
	fornot2	%f18,	%f16,	%f8
	call	loop_896
loop_895:
	call	loop_897
	call	loop_898
	fbue	%fcc2,	loop_899
loop_896:
	tle	%icc,	0x4
loop_897:
	fmovdvs	%xcc,	%f12,	%f26
loop_898:
	orn	%i5,	0x0E10,	%i4
loop_899:
	movrlz	%o3,	0x12C,	%i3
	call	loop_900
	call	loop_901
	fmul8x16au	%f7,	%f13,	%f2
	fand	%f14,	%f18,	%f26
loop_900:
	rdhpr	%hpstate,	%l4
loop_901:
	call	loop_902
	call	loop_903
	fandnot1	%f14,	%f10,	%f8
	movle	%xcc,	0x17A,	%i6
loop_902:
	tle	%icc,	0x1
loop_903:
	call	loop_904
	fmovsn	%fcc3,	%f5,	%f31
	call	loop_905
	nop
	setx	loop_906,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x014200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_904:
	tleu	%xcc,	0x4
	fmovdle	%fcc1,	%f30,	%f14
loop_905:
	call	loop_907
loop_906:
	fmovsle	%fcc0,	%f11,	%f9
	movgu	%icc,	0x2DD,	%g3
	fmovrslez	%g1,	%f17,	%f21
loop_907:
	tsubcc	%o6,	0x0880,	%l2
	edge16n	%l5,	%g6,	%i0
	call	loop_908
	fnegs	%f0,	%f23
	nop
	setx	0x87AE24A2C277AC92,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f18
	call	loop_909
loop_908:
	call	loop_910
	call	loop_911
	fmovslg	%fcc0,	%f9,	%f8
loop_909:
	fornot1	%f22,	%f22,	%f10
loop_910:
	movul	%fcc1,	0x44A,	%o5
loop_911:
	nop
	setx	0x6755752FDA08070D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x345884F00DD9ECD0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f4,	%f26
	call	loop_912
	wr	%l6,	%g2,	%set_softint
	ldstub	[%l7 + 0x7E],	%g4
	call	loop_913
loop_912:
	std	%f10,	[%l7 + 0x08]
	call	loop_914
	bpos,pt	%xcc,	loop_915
loop_913:
	fmovrsne	%g5,	%f20,	%f14
	st	%fsr,	[%l7 + 0x7C]
loop_914:
	fmovrdne	%o7,	%f24,	%f18
loop_915:
	subcc	%g7,	0x106C,	%l0
	bvc,pt	%icc,	loop_916
	lduh	[%l7 + 0x5C],	%o1
	call	loop_917
	andn	%i1,	%i2,	%o4
loop_916:
	fbl,a	%fcc2,	loop_918
	fmuld8ulx16	%f31,	%f8,	%f4
loop_917:
	fmovduge	%fcc0,	%f16,	%f24
	fpsub32	%f2,	%f30,	%f28
loop_918:
	movpos	%xcc,	%o0,	%o2
	wrpr	%i7,	0x1783,	%tick
	rdhpr	%hsys_tick_cmpr,	%l3
	andcc	%l1,	%i4,	%o3
	nop
	set	0x20, %g2
	ldub	[%l7 + %g2],	%i3
	nop
	set	0x14, %i6
	lduw	[%l7 + %i6],	%l4
	fbu	%fcc1,	loop_919
	addcc	%i5,	0x09E7,	%i6
	movul	%fcc2,	0x12B,	%g3
	call	loop_920
loop_919:
	call	loop_921
	call	loop_922
	fmovrsgz	%g1,	%f2,	%f13
loop_920:
	call	loop_923
loop_921:
	fmovsne	%fcc2,	%f4,	%f25
loop_922:
	call	loop_924
	edge16	%l2,	%o6,	%g6
loop_923:
	call	loop_925
	call	loop_926
loop_924:
	wrpr	%i0,	%l5,	%cwp
	nop
	setx	0xF256C162,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xBD68D8DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f3,	%f11
loop_925:
	fxors	%f16,	%f19,	%f18
loop_926:
	fmuld8ulx16	%f6,	%f9,	%f30
	fmovdvs	%xcc,	%f4,	%f6
	brnz	%l6,	loop_927
	fmovsgu	%icc,	%f29,	%f1
	rdpr	%pil,	%o5
	movule	%fcc1,	0x430,	%g4
loop_927:
	nop
	fitos	%f6,	%f5
	nop
	setx	0x421BB9F2CF9C2FCA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBCF19C5DF9DB1EB4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f22,	%f14
	te	%xcc,	0x5
	alignaddrl	%g2,	%g5,	%g7
	nop
	setx	0x0F6D87C841817347,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xBF8C2C27DBFD7FC8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f2,	%f12
	call	loop_928
	movvc	%xcc,	0x5FC,	%l0
	siam	0x2
	fcmpgt32	%f26,	%f0,	%o1
loop_928:
	nop
	fitod	%f26,	%f12
	edge8l	%o7,	%i1,	%o4
	wrpr 	%g0, 	0x2, 	%gl
	nop
	setx	loop_929,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024200001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_930
	fpack16	%f16,	%f24
	movrlz	%o2,	%i2,	%l3
loop_929:
	nop
	setx	0xAE1AA4A9D6149D26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f2
loop_930:
	ta	%icc,	0x1
	call	loop_931
	rdhpr	%ver,	%l1
	tcc	%icc,	0x3
	fmovsne	%icc,	%f10,	%f16
loop_931:
	alignaddrl	%i7,	%i4,	%o3
	wrpr	%i3,	0x1512,	%cwp
	wrpr	%l4,	%i5,	%pil
	fbo,a	%fcc1,	loop_932
	fmovsul	%fcc1,	%f21,	%f31
	rd	%sys_tick_cmpr,	%g3
	call	loop_933
loop_932:
	srlx	%g1,	0x1A,	%l2
	fbl	%fcc2,	loop_934
	movgu	%xcc,	%o6,	%i6
loop_933:
	rdpr	%wstate,	%g6
	movl	%fcc1,	%i0,	%l6
loop_934:
	st	%fsr,	[%l7 + 0x14]
	tcs	%xcc,	0x1
	movrlz	%o5,	%l5,	%g4
	smulcc	%g5,	0x0DE7,	%g2
	wr	%g7,	%o1,	%clear_softint
	nop
	setx	loop_935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%fcc3,	%f30,	%f5
	call	loop_936
	fmovrsgz	%o7,	%f11,	%f2
loop_935:
	taddcc	%l0,	%i1,	%o0
	call	loop_937
loop_936:
	fpack32	%f22,	%f0,	%f2
	srlx	%o2,	0x0F,	%i2
	fmovscs	%xcc,	%f7,	%f18
loop_937:
	membar	0x69
	fpackfix	%f10,	%f3
	fmovdul	%fcc0,	%f18,	%f24
	call	loop_938
	subcc	%l3,	%o4,	%i7
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f21
	nop
	setx	0x15CC283E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD012A946,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f20,	%f2
loop_938:
	call	loop_939
	nop
	set	0x28, %g6
	lduw	[%l7 + %g6],	%l1
	nop
	fitos	%f3,	%f16
	fmovrdlz	%i4,	%f8,	%f10
loop_939:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wrpr	%i3,	%o3,	%cwp
	call	loop_940
	movneg	%icc,	%l4,	%g3
	srl	%i5,	%l2,	%o6
	movrlez	%g1,	%g6,	%i0
loop_940:
	fmovsl	%xcc,	%f23,	%f22
	tg	%icc,	0x3
	movleu	%icc,	0x474,	%l6
	fmovdule	%fcc0,	%f12,	%f20
	fba,a	%fcc0,	loop_941
	call	loop_942
	call	loop_943
	alignaddrl	%i6,	%o5,	%g4
loop_941:
	call	loop_944
loop_942:
	fmuld8ulx16	%f5,	%f25,	%f30
loop_943:
	call	loop_945
	wr	%g5,	0x1635,	%clear_softint
loop_944:
	movue	%fcc3,	%l5,	%g7
	brlz,a,pn	%g2,	loop_946
loop_945:
	fcmpne16	%f22,	%f28,	%o1
	xnorcc	%o7,	%i1,	%o0
	std	%l0,	[%l7 + 0x50]
loop_946:
	call	loop_947
	orncc	%i2,	0x1B24,	%o2
	bmask	%l3,	%i7,	%l1
	call	loop_948
loop_947:
	movn	%icc,	0x2F3,	%o4
	call	loop_949
	fmovda	%fcc2,	%f28,	%f2
loop_948:
	fmul8x16au	%f13,	%f8,	%f4
	movrgez	%i4,	%i3,	%o3
loop_949:
	call	loop_950
	movre	%l4,	%i5,	%g3
	movo	%fcc1,	%l2,	%o6
	fcmple32	%f24,	%f24,	%g1
loop_950:
	st	%fsr,	[%l7 + 0x74]
	taddcc	%i0,	%g6,	%l6
	call	loop_951
	fxnors	%f8,	%f2,	%f7
	fornot1s	%f20,	%f0,	%f17
	call	loop_952
loop_951:
	fmovrdne	%i6,	%f6,	%f30
	edge8n	%o5,	%g5,	%g4
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f26
loop_952:
	fmovsneg	%icc,	%f6,	%f31
	andncc	%l5,	0x0D55,	%g7
	call	loop_953
	edge8l	%o1,	%o7,	%g2
	fmovdl	%xcc,	%f2,	%f26
	xnor	%i1,	0x0008,	%o0
loop_953:
	call	loop_954
	fmovrse	%i2,	%f15,	%f11
	call	loop_955
	call	loop_956
loop_954:
	call	loop_957
	fmovdcs	%icc,	%f20,	%f16
loop_955:
	fone	%f30
loop_956:
	fpsub32s	%f31,	%f18,	%f6
loop_957:
	call	loop_958
	sll	%o2,	%l3,	%i7
	call	loop_959
	edge8l	%l0,	%l1,	%o4
loop_958:
	movul	%fcc2,	%i3,	%i4
	call	loop_960
loop_959:
	fmovsne	%fcc0,	%f27,	%f18
	call	loop_961
	stx	%fsr,	[%l7 + 0x70]
loop_960:
	fmovdo	%fcc1,	%f28,	%f2
	smul	%o3,	%l4,	%g3
loop_961:
	call	loop_962
	addccc	%l2,	0x060B,	%i5
	subc	%g1,	0x0622,	%i0
	fmovdleu	%xcc,	%f24,	%f6
loop_962:
	ta	%icc,	0x4
	fpadd32	%f12,	%f6,	%f6
	nop
	fitod	%f15,	%f20
	call	loop_963
	call	loop_964
	bpos,a,pt	%xcc,	loop_965
	fmovsle	%fcc2,	%f28,	%f6
loop_963:
	call	loop_966
loop_964:
	mova	%fcc3,	%g6,	%o6
loop_965:
	brz,a	%l6,	loop_967
	rdhpr	%hpstate,	%o5
loop_966:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x78] %asi,	%i6
loop_967:
	fmovsneg	%icc,	%f11,	%f18
	fmovdvs	%xcc,	%f12,	%f4
	fmovrde	%g5,	%f10,	%f0
	edge8ln	%l5,	%g7,	%o1
	st	%fsr,	[%l7 + 0x54]
	movcs	%xcc,	%g4,	%o7
	call	loop_968
	fmovdle	%fcc0,	%f30,	%f10
	set	0x34, %l5
	stwa	%g2,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_968:
	movrlz	%o0,	0x241,	%i2
	call	loop_969
	fandnot1s	%f8,	%f18,	%f13
	wr	%g0,	0x21,	%asi
	stxa	%o2,	[%g0 + 0x108] %asi
loop_969:
	udiv	%i1,	%i7,	%l0
	fornot2s	%f20,	%f14,	%f28
	tvs	%icc,	0x7
	nop
	fitos	%f7,	%f1
	fstod	%f1,	%f26
	umul	%l1,	0x0839,	%o4
	call	loop_970
	ld	[%l7 + 0x60],	%f30
	tvc	%icc,	0x6
	lduw	[%l7 + 0x48],	%i3
loop_970:
	fcmpeq16	%f10,	%f8,	%i4
	fexpand	%f23,	%f26
	call	loop_971
	call	loop_972
	call	loop_973
	sir	0x0782
loop_971:
	fmovsleu	%xcc,	%f10,	%f29
loop_972:
	movgu	%xcc,	%l3,	%l4
loop_973:
	call	loop_974
	fmovsvc	%icc,	%f26,	%f29
	call	loop_975
	fnot1s	%f28,	%f26
loop_974:
	fmovso	%fcc1,	%f8,	%f1
	movrne	%g3,	0x39B,	%o3
loop_975:
	fmovsa	%xcc,	%f0,	%f2
	call	loop_976
	wrpr	%i5,	%l2,	%cwp
	call	loop_977
	nop
	setx	0x67956BE3277A772E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x7B675F479C05609D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f26
loop_976:
	call	loop_978
	fmovsu	%fcc0,	%f14,	%f23
loop_977:
	std	%i0,	[%l7 + 0x18]
	mova	%xcc,	0x704,	%g1
loop_978:
	addc	%g6,	0x1B8D,	%o6
	rd	%softint,	%o5
	wrpr	%l6,	0x0619,	%pil
	call	loop_979
	fcmped	%fcc0,	%f24,	%f28
	andn	%g5,	0x161F,	%i6
	fmovso	%fcc2,	%f15,	%f1
loop_979:
	call	loop_980
	tle	%icc,	0x7
	set	0x78, %l6
	ldswa	[%l7 + %l6] 0x19,	%l5
loop_980:
	call	loop_981
	fmovsul	%fcc1,	%f30,	%f6
	udivx	%o1,	0x00,	%g7
	movo	%fcc1,	%o7,	%g4
loop_981:
	umulcc	%o0,	0x0382,	%g2
	call	loop_982
	orcc	%i2,	%i1,	%i7
	fmovsul	%fcc1,	%f10,	%f12
	srax	%o2,	%l0,	%o4
loop_982:
	call	loop_983
	call	loop_984
	fpadd32s	%f12,	%f13,	%f28
	fmovsue	%fcc3,	%f19,	%f0
loop_983:
	fabsd	%f0,	%f16
loop_984:
	rdhpr	%hsys_tick_cmpr,	%l1
	nop
	setx	0x13FEBCF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f11
	fcmpgt32	%f12,	%f30,	%i3
	call	loop_985
	fabsd	%f24,	%f20
	fexpand	%f22,	%f2
	nop
	setx	0x92DD25B814A70B4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x55D832B2B508764A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f16,	%f4
loop_985:
	movle	%fcc3,	%i4,	%l4
	tsubcctv	%g3,	0x1215,	%o3
	fmovsg	%fcc0,	%f0,	%f14
	tneg	%xcc,	0x5
	call	loop_986
	edge32ln	%i5,	%l2,	%l3
	edge16ln	%i0,	%g1,	%o6
	fpack16	%f0,	%f23
loop_986:
	call	loop_987
	bg,a	%xcc,	loop_988
	fmovrdne	%g6,	%f20,	%f4
	fxor	%f8,	%f16,	%f22
loop_987:
	nop
	set	0x30, %o4
	lduh	[%l7 + %o4],	%l6
loop_988:
	array32	%o5,	%g5,	%i6
	fmovsle	%fcc1,	%f22,	%f2
	alignaddr	%o1,	%g7,	%l5
	call	loop_989
	fcmpeq32	%f8,	%f30,	%g4
	call	loop_990
	alignaddrl	%o0,	%o7,	%i2
loop_989:
	movle	%xcc,	0x03A,	%g2
	call	loop_991
loop_990:
	movu	%fcc2,	0x529,	%i1
	fbuge,a	%fcc1,	loop_992
	call	loop_993
loop_991:
	call	loop_994
	fmovsvc	%icc,	%f4,	%f15
loop_992:
	mulscc	%o2,	%i7,	%o4
loop_993:
	fzero	%f4
loop_994:
	movrlz	%l0,	0x168,	%i3
	movre	%l1,	%i4,	%l4
	and	%o3,	%g3,	%i5
	call	loop_995
	fcmpd	%fcc3,	%f12,	%f2
	fmovrdlz	%l3,	%f22,	%f10
	movne	%icc,	0x753,	%l2
loop_995:
	brlez,a	%g1,	loop_996
	for	%f8,	%f28,	%f28
	call	loop_997
	call	loop_998
loop_996:
	call	loop_999
	call	loop_1000
loop_997:
	fmovrsgz	%i0,	%f23,	%f10
loop_998:
	fmovscs	%icc,	%f7,	%f28
loop_999:
	rdhpr	%hsys_tick_cmpr,	%o6
loop_1000:
	tl	%icc,	0x6
	tneg	%icc,	0x6
	nop
	setx	0xD684D4024A27D42E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBC2456C740141861,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f22,	%f12
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l6
	nop
	setx	0x969C48713CCDFD58,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x972AAE6E250EB75C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f28,	%f0
	movne	%xcc,	%o5,	%g5
	bge	%icc,	loop_1001
	fornot2	%f16,	%f30,	%f0
	edge8	%i6,	%g6,	%g7
	edge16n	%l5,	%g4,	%o1
loop_1001:
	fcmpes	%fcc1,	%f14,	%f31
	call	loop_1002
	call	loop_1003
	fpadd16s	%f23,	%f17,	%f14
	xnorcc	%o0,	0x03E9,	%o7
loop_1002:
	andcc	%i2,	%g2,	%i1
loop_1003:
	edge8l	%i7,	%o4,	%o2
	call	loop_1004
	call	loop_1005
	addccc	%l0,	0x17F6,	%l1
	andncc	%i4,	%l4,	%i3
loop_1004:
	call	loop_1006
loop_1005:
	call	loop_1007
	call	loop_1008
	call	loop_1009
loop_1006:
	fpadd32s	%f7,	%f0,	%f19
loop_1007:
	call	loop_1010
loop_1008:
	movrgz	%o3,	%g3,	%i5
loop_1009:
	fmovda	%icc,	%f10,	%f18
	fmovsule	%fcc1,	%f29,	%f25
loop_1010:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x74] %asi,	%f17
	call	loop_1011
	subc	%l3,	%g1,	%i0
	call	loop_1012
	fandnot2	%f30,	%f4,	%f18
loop_1011:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x2C] %asi,	%l2
loop_1012:
	fnot2	%f24,	%f6
	for	%f14,	%f14,	%f26
	call	loop_1013
	call	loop_1014
	movcc	%xcc,	0x2D7,	%o6
	movgu	%xcc,	0x2C1,	%l6
loop_1013:
	nop

loop_1014:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 29
!	Type a   	: 24
!	Type x   	: 11
!	Type cti   	: 148
!	Type f   	: 144
!	Type i   	: 144
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
	set	0x9,	%g2
	set	0x0,	%g3
	set	0xD,	%g4
	set	0x7,	%g5
	set	0xA,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xF,	%i1
	set	-0xA,	%i2
	set	-0xF,	%i3
	set	-0x0,	%i4
	set	-0xE,	%i5
	set	-0x0,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x4447CF7A,	%l0
	set	0x7D93556A,	%l1
	set	0x6D33CDC5,	%l2
	set	0x67030EE6,	%l3
	set	0x26E2F1D7,	%l4
	set	0x2EE7A3BD,	%l5
	set	0x1D315125,	%l6
	!# Output registers
	set	-0x18BA,	%o0
	set	0x0581,	%o1
	set	0x01DD,	%o2
	set	-0x1C93,	%o3
	set	-0x1E61,	%o4
	set	-0x0D07,	%o5
	set	-0x137C,	%o6
	set	-0x09B2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xDA50506ABD2BB036)
	INIT_TH_FP_REG(%l7,%f2,0x792A050FBCA215A0)
	INIT_TH_FP_REG(%l7,%f4,0x0162AACECE20AD18)
	INIT_TH_FP_REG(%l7,%f6,0x102F3897B1CE1A5F)
	INIT_TH_FP_REG(%l7,%f8,0x47073A55A209D5A3)
	INIT_TH_FP_REG(%l7,%f10,0xACD082396EAE2256)
	INIT_TH_FP_REG(%l7,%f12,0x4D431C520C95AAD5)
	INIT_TH_FP_REG(%l7,%f14,0x1376787DDCE473D7)
	INIT_TH_FP_REG(%l7,%f16,0xD57CF3EC25ACB40C)
	INIT_TH_FP_REG(%l7,%f18,0x6823E7FF5CE4AD5A)
	INIT_TH_FP_REG(%l7,%f20,0x48FFA6EB5C8F228F)
	INIT_TH_FP_REG(%l7,%f22,0xADDC816BF55609C8)
	INIT_TH_FP_REG(%l7,%f24,0x5225E484B22D5D42)
	INIT_TH_FP_REG(%l7,%f26,0x270612237CB062B5)
	INIT_TH_FP_REG(%l7,%f28,0xE988718226D79120)
	INIT_TH_FP_REG(%l7,%f30,0x23B969B81BA6CDF5)

	!# Execute Main Diag ..

	fmovdule	%fcc0,	%f12,	%f24
	orncc	%o5,	%g5,	%i6
	call	loop_1015
	fones	%f7
	movue	%fcc0,	%g7,	%l5
	fcmpeq16	%f2,	%f18,	%g4
loop_1015:
	fbul,pn	%fcc1,	loop_1016
	nop
	setx	loop_1017,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032100001402,	%l0,	%l1
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
	edge16	%g6,	%o0,	%o1
	fmovs	%f5,	%f1
loop_1016:
	fnot2	%f18,	%f18
loop_1017:
	nop
	setx	0x5CE3E7E224C9B43F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xE0C614AC7101C6B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f28,	%f28
	nop
	setx	0x3FBFC517,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xAD91095A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f19,	%f12
	movre	%i2,	%g2,	%i1
	call	loop_1018
	rdhpr	%hintp,	%i7
	fxnor	%f2,	%f14,	%f30
	andn	%o4,	0x0A90,	%o2
loop_1018:
	call	loop_1019
	movneg	%xcc,	0x1E5,	%l0
	movre	%l1,	0x25F,	%i4
	rdpr	%cleanwin,	%o7
loop_1019:
	fornot1s	%f11,	%f0,	%f20
	fcmpeq32	%f4,	%f2,	%i3
	sir	0x1B30
	fmovsvc	%xcc,	%f0,	%f31
	fmovscc	%xcc,	%f6,	%f11
	rdpr	%gl,	%o3
	nop
	setx	0xC0A885D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f2
	call	loop_1020
	subc	%l4,	0x1109,	%i5
	fmovs	%f11,	%f8
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x80,	%l3
loop_1020:
	nop
	setx	0x924B454BB8E8BC29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x819BABBD6FB94B50,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f28,	%f30
	bgu	%icc,	loop_1021
	fmovrde	%g1,	%f26,	%f16
	sll	%g3,	0x0A,	%l2
	call	loop_1022
loop_1021:
	call	loop_1023
	fcmps	%fcc3,	%f31,	%f29
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%i0
loop_1022:
	nop
	set	0x08, %i1
	ldxa	[%l7 + %i1] 0x80,	%o6
loop_1023:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l6,	%o5
	movrlz	%i6,	0x317,	%g5
	sll	%g7,	%l5,	%g6
	call	loop_1024
	call	loop_1025
	rdpr	%cwp,	%o0
	rd	%tick_cmpr,	%o1
loop_1024:
	alignaddr	%i2,	%g2,	%g4
loop_1025:
	call	loop_1026
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f14
	tg	%icc,	0x2
	fmovsvs	%xcc,	%f18,	%f25
loop_1026:
	fmovdug	%fcc0,	%f14,	%f22
	call	loop_1027
	subcc	%i1,	%i7,	%o4
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f12
	array32	%l0,	%o2,	%l1
loop_1027:
	fmovsul	%fcc3,	%f9,	%f30
	sdiv	%o7,	%i4,	%i3
	call	loop_1028
	alignaddr	%o3,	%i5,	%l4
	call	loop_1029
	call	loop_1030
loop_1028:
	movgu	%icc,	%g1,	%l3
	call	loop_1031
loop_1029:
	call	loop_1032
loop_1030:
	fmovrsgez	%l2,	%f8,	%f24
	call	loop_1033
loop_1031:
	movrgez	%g3,	0x1FA,	%o6
loop_1032:
	edge32	%i0,	%o5,	%l6
	fmovdle	%icc,	%f6,	%f24
loop_1033:
	call	loop_1034
	call	loop_1035
	movneg	%icc,	0x1FE,	%i6
	movne	%xcc,	0x7C1,	%g5
loop_1034:
	rdpr	%pil,	%l5
loop_1035:
	fmul8ulx16	%f4,	%f22,	%f28
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x38] %asi,	%f28
	move	%fcc2,	%g6,	%g7
	call	loop_1036
	fnegd	%f4,	%f14
	movge	%icc,	%o1,	%o0
	fcmpeq16	%f0,	%f16,	%i2
loop_1036:
	tneg	%icc,	0x1
	xnorcc	%g2,	0x12DA,	%i1
	call	loop_1037
	bleu,pt	%icc,	loop_1038
	orcc	%i7,	%o4,	%l0
	call	loop_1039
loop_1037:
	subccc	%o2,	0x11DC,	%g4
loop_1038:
	call	loop_1040
	fzeros	%f14
loop_1039:
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f14
	taddcctv	%l1,	%o7,	%i4
loop_1040:
	call	loop_1041
	std	%i2,	[%l7 + 0x20]
	call	loop_1042
	call	loop_1043
loop_1041:
	nop
	fitos	%f2,	%f30
	fstod	%f30,	%f4
	wr	%g0,	0x10,	%asi
	stda	%i4,	[%l7 + 0x08] %asi
loop_1042:
	call	loop_1044
loop_1043:
	edge16	%l4,	%o3,	%g1
	xor	%l3,	0x06CE,	%l2
	call	loop_1045
loop_1044:
	orcc	%g3,	0x0B52,	%o6
	call	loop_1046
	ldx	[%l7 + 0x78],	%o5
loop_1045:
	call	loop_1047
	wrpr	%l6,	0x0C81,	%pil
loop_1046:
	rd	%ccr,	%i6
	edge32	%i0,	%l5,	%g5
loop_1047:
	fandnot1s	%f19,	%f27,	%f2
	fmovsul	%fcc0,	%f11,	%f5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	popc	0x0858,	%g7
	andcc	%g6,	%o0,	%o1
	movl	%icc,	%i2,	%g2
	fpsub32s	%f17,	%f21,	%f6
	udiv	%i7,	%o4,	%l0
	fble,a,pt	%fcc3,	loop_1048
	call	loop_1049
	array8	%i1,	%o2,	%l1
	add	%o7,	0x0EA7,	%i4
loop_1048:
	call	loop_1050
loop_1049:
	movrlez	%i3,	0x300,	%i5
	fmovsg	%fcc1,	%f29,	%f3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc2
loop_1050:
	call	loop_1051
	nop
	fitod	%f7,	%f18
	fmovsgu	%icc,	%f5,	%f8
	call	loop_1052
loop_1051:
	nop
	setx	0x7E2376B3500C47F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFC822DD0295BC14C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f22,	%f2
	nop
	fitod	%f20,	%f20
	call	loop_1053
loop_1052:
	movpos	%xcc,	%g4,	%l4
	fnot1	%f16,	%f10
	nop
	fitos	%f10,	%f27
	fstox	%f27,	%f18
loop_1053:
	call	loop_1054
	fabss	%f3,	%f18
	call	loop_1055
	fmovsvc	%xcc,	%f18,	%f23
loop_1054:
	bg	%xcc,	loop_1056
	bgu,pn	%xcc,	loop_1057
loop_1055:
	fmovsl	%fcc1,	%f0,	%f9
	fmovrdlez	%o3,	%f18,	%f6
loop_1056:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g1
loop_1057:
	call	loop_1058
	ld	[%l7 + 0x40],	%f5
	call	loop_1059
	call	loop_1060
loop_1058:
	fcmped	%fcc0,	%f6,	%f20
	nop
	set	0x58, %i7
	sth	%l2,	[%l7 + %i7]
loop_1059:
	fbge,a,pt	%fcc1,	loop_1061
loop_1060:
	edge8n	%g3,	%o6,	%l3
	sllx	%l6,	%i6,	%o5
	edge16ln	%i0,	%g5,	%g7
loop_1061:
	lduh	[%l7 + 0x28],	%l5
	fcmpes	%fcc0,	%f13,	%f9
	popc	%g6,	%o0
	fmovsne	%fcc3,	%f3,	%f10
	fexpand	%f11,	%f4
	sethi	0x138E,	%i2
	tpos	%icc,	0x4
	movl	%icc,	%g2,	%i7
	movrgez	%o4,	%l0,	%i1
	or	%o1,	0x0404,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x927, 	%hsys_tick_cmpr
	call	loop_1062
	nop
	set	0x68, %o7
	std	%f4,	[%l7 + %o7]
	call	loop_1063
	fmovdneg	%icc,	%f14,	%f6
loop_1062:
	xorcc	%o7,	%i3,	%i5
	call	loop_1064
loop_1063:
	wrpr 	%g0, 	0x1, 	%gl
	fcmpeq16	%f10,	%f16,	%l4
	movrne	%o3,	%g4,	%g1
loop_1064:
	nop
	setx	0xC5B3D205,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xDEA77C25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f22,	%f7
	edge32l	%l2,	%g3,	%o6
	fmovsl	%icc,	%f6,	%f2
	alignaddrl	%l3,	%l6,	%o5
	wr	%i6,	%g5,	%softint
	fornot1	%f22,	%f2,	%f12
	fmovdue	%fcc2,	%f10,	%f22
	fmul8ulx16	%f0,	%f22,	%f30
	movcc	%xcc,	0x3C9,	%i0
	srl	%g7,	%l5,	%g6
	nop
	fitos	%f10,	%f25
	fstox	%f25,	%f24
	subcc	%i2,	%g2,	%i7
	call	loop_1065
	fsrc2s	%f15,	%f14
	movl	%icc,	0x5A4,	%o0
	call	loop_1066
loop_1065:
	edge8ln	%o4,	%i1,	%l0
	fmovscs	%xcc,	%f18,	%f27
	call	loop_1067
loop_1066:
	call	loop_1068
	edge8ln	%o1,	%l1,	%o7
	fmovscs	%icc,	%f28,	%f25
loop_1067:
	fmovdvc	%xcc,	%f6,	%f28
loop_1068:
	subccc	%i3,	0x162A,	%i5
	rd	%fprs,	%o2
	edge8ln	%l4,	%o3,	%i4
	rdhpr	%htba,	%g1
	call	loop_1069
	udiv	%g4,	0x00,	%g3
	call	loop_1070
	fmovspos	%xcc,	%f26,	%f9
loop_1069:
	fexpand	%f11,	%f10
	fcmpgt16	%f0,	%f16,	%o6
loop_1070:
	nop
	setx	0x94353A1CD030CE51,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF4BB32794284F3D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f8,	%f8
	taddcc	%l3,	%l6,	%o5
	call	loop_1071
	fsrc2s	%f13,	%f7
	mulscc	%l2,	0x0F45,	%i6
	call	loop_1072
loop_1071:
	fsrc1	%f30,	%f12
	umulcc	%i0,	0x1B21,	%g5
	call	loop_1073
loop_1072:
	fmovdne	%xcc,	%f18,	%f10
	sethi	0x041A,	%l5
	call	loop_1074
loop_1073:
	rdhpr	%hintp,	%g7
	fmovsn	%fcc3,	%f0,	%f16
	fmovdcs	%icc,	%f22,	%f20
loop_1074:
	movrlez	%i2,	0x2D2,	%g2
	bmask	%i7,	%g6,	%o0
	fmovrdgz	%o4,	%f26,	%f10
	movul	%fcc1,	0x221,	%i1
	srl	%o1,	%l0,	%l1
	array16	%i3,	%o7,	%i5
	udiv	%l4,	0x00,	%o3
	fsrc2	%f18,	%f6
	wrpr	%o2,	0x03A9,	%pil
	xorcc	%g1,	%g4,	%g3
	fpsub32s	%f11,	%f6,	%f15
	fnot1	%f26,	%f24
	movrgez	%o6,	%l3,	%i4
	call	loop_1075
	fbn,a	%fcc2,	loop_1076
	fandnot2s	%f4,	%f23,	%f11
	andncc	%l6,	%o5,	%i6
loop_1075:
	call	loop_1077
loop_1076:
	and	%l2,	0x1C79,	%g5
	fxors	%f25,	%f14,	%f18
	call	loop_1078
loop_1077:
	fmovrsne	%i0,	%f10,	%f2
	call	loop_1079
	fpsub32s	%f5,	%f19,	%f13
loop_1078:
	movrne	%g7,	%l5,	%g2
	call	loop_1080
loop_1079:
	tpos	%xcc,	0x1
	bl	%icc,	loop_1081
	udivcc	%i7,	0x00,	%i2
loop_1080:
	fxnors	%f5,	%f15,	%f21
	nop
	setx	0x62AB8B6837EF64AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x026BE024E72A88CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f28,	%f18
loop_1081:
	movue	%fcc2,	%g6,	%o0
	call	loop_1082
	addccc	%i1,	0x071E,	%o4
	fexpand	%f27,	%f18
	nop
	setx	loop_1083,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032100001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1082:
	call	loop_1084
	xorcc	%l0,	%o1,	%i3
	call	loop_1085
loop_1083:
	fmovdneg	%icc,	%f30,	%f12
loop_1084:
	call	loop_1086
	call	loop_1087
loop_1085:
	call	loop_1088
	array8	%l1,	%o7,	%l4
loop_1086:
	call	loop_1089
loop_1087:
	call	loop_1090
loop_1088:
	fcmps	%fcc2,	%f18,	%f25
	fors	%f20,	%f21,	%f20
loop_1089:
	andn	%i5,	0x105D,	%o3
loop_1090:
	movgu	%icc,	0x5BA,	%o2
	tsubcc	%g1,	%g3,	%g4
	bmask	%l3,	%i4,	%o6
	andncc	%o5,	%i6,	%l2
	fmovrsgz	%g5,	%f18,	%f13
	fmovsul	%fcc0,	%f19,	%f11
	std	%i0,	[%l7 + 0x78]
	bleu,pt	%icc,	loop_1091
	fmovsug	%fcc0,	%f4,	%f7
	sllx	%g7,	0x09,	%l5
	fcmpes	%fcc2,	%f21,	%f2
loop_1091:
	edge32ln	%g2,	%l6,	%i2
	fmovsvs	%xcc,	%f10,	%f21
	bg,pt	%icc,	loop_1092
	fmovrsgz	%g6,	%f22,	%f27
	fmovse	%fcc0,	%f15,	%f20
	call	loop_1093
loop_1092:
	call	loop_1094
	call	loop_1095
	fmovslg	%fcc0,	%f4,	%f18
loop_1093:
	array32	%o0,	%i7,	%o4
loop_1094:
	fcmpd	%fcc3,	%f8,	%f18
loop_1095:
	st	%fsr,	[%l7 + 0x50]
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 4
	fnot1	%f20,	%f14
	call	loop_1096
	nop
	fitos	%f7,	%f8
	fstoi	%f8,	%f10
	set	0x78, %l1
	ldsha	[%l7 + %l1] 0x89,	%o1
loop_1096:
	call	loop_1097
	wrpr	%l0,	0x038F,	%cwp
	nop
	setx	0x803148F21F864D7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5A547B41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f30,	%f24
	tgu	%icc,	0x4
loop_1097:
	udiv	%i3,	0x00,	%o7
	tge	%icc,	0x6
	call	loop_1098
	fmovsvc	%icc,	%f28,	%f19
	rd	%y,	%l4
	fmovscc	%icc,	%f23,	%f20
loop_1098:
	fmovsl	%icc,	%f24,	%f9
	set	0x62, %l4
	ldsba	[%l7 + %l4] 0x89,	%l1
	rdhpr	%hsys_tick_cmpr,	%i5
	bvc,a,pt	%icc,	loop_1099
	tcc	%xcc,	0x4
	orcc	%o3,	%o2,	%g3
	fmovs	%f0,	%f2
loop_1099:
	call	loop_1100
	fmovsneg	%xcc,	%f12,	%f19
	call	loop_1101
	wrpr	%g4,	%l3,	%tick
loop_1100:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdlez	%o6,	%f22,	%f26
loop_1101:
	sdiv	%o5,	0x00,	%i4
	fornot2	%f24,	%f0,	%f16
	movu	%fcc2,	0x395,	%l2
	call	loop_1102
	fmovrslez	%g5,	%f28,	%f15
	call	loop_1103
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1102:
	fnot1s	%f5,	%f8
	fmul8x16	%f22,	%f30,	%f0
loop_1103:
	movg	%fcc3,	%i6,	%i0
	fmovrsgez	%g7,	%f25,	%f27
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f28
	fxtos	%f28,	%f28
	fornot1s	%f22,	%f14,	%f8
	bshuffle	%f20,	%f16,	%f2
	popc	%g2,	%l6
	movrlez	%i2,	%l5,	%o0
	fbul,a	%fcc0,	loop_1104
	call	loop_1105
	call	loop_1106
	call	loop_1107
loop_1104:
	call	loop_1108
loop_1105:
	fmovdge	%xcc,	%f8,	%f28
loop_1106:
	rdpr	%tba,	%g6
loop_1107:
	srl	%o4,	0x04,	%i1
loop_1108:
	edge32	%o1,	%l0,	%i7
	taddcc	%i3,	0x0995,	%o7
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%l4
	fpmerge	%f10,	%f9,	%f10
	fsrc2s	%f28,	%f28
	call	loop_1109
	nop
	setx	0xE51156723C789457,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	bg	%icc,	loop_1110
	call	loop_1111
loop_1109:
	sir	0x16CE
	addc	%i5,	%l1,	%o2
loop_1110:
	fmovdleu	%xcc,	%f30,	%f4
loop_1111:
	bl,pn	%xcc,	loop_1112
	prefetch	[%l7 + 0x74],	 4
	fornot2	%f8,	%f26,	%f0
	call	loop_1113
loop_1112:
	fmovrslez	%o3,	%f31,	%f1
	nop
	setx loop_1114, %l0, %l1
	jmpl %l1, %g3
	fmovsule	%fcc1,	%f24,	%f25
loop_1113:
	call	loop_1115
	st	%f31,	[%l7 + 0x7C]
loop_1114:
	tn	%icc,	0x2
	call	loop_1116
loop_1115:
	fandnot2	%f22,	%f26,	%f22
	call	loop_1117
	fnot2s	%f1,	%f3
loop_1116:
	nop
	fitos	%f4,	%f3
	fstod	%f3,	%f4
	ldd	[%l7 + 0x18],	%f30
loop_1117:
	call	loop_1118
	rd	%pc,	%l3
	fmul8sux16	%f10,	%f12,	%f12
	movneg	%icc,	0x75F,	%g4
loop_1118:
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f8
	fmovsn	%xcc,	%f18,	%f28
	sdivcc	%g1,	0x00,	%o6
	call	loop_1119
	rdhpr	%htba,	%i4
	call	loop_1120
	fnegd	%f8,	%f22
loop_1119:
	fbuge,a,pn	%fcc1,	loop_1121
	call	loop_1122
loop_1120:
	call	loop_1123
	call	loop_1124
loop_1121:
	movge	%icc,	%o5,	%g5
loop_1122:
	edge32ln	%l2,	%i0,	%g7
loop_1123:
	andcc	%g2,	%i6,	%i2
loop_1124:
	wr	%l6,	%l5,	%softint
	fmovdvc	%icc,	%f10,	%f8
	movug	%fcc2,	0x40C,	%g6
	wrpr 	%g0, 	0x1, 	%gl
	nop
	set	0x30, %o2
	stw	%o0,	[%l7 + %o2]
	fmovrde	%o1,	%f12,	%f2
	nop
	setx	0x597C4E8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xDDDD8C28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f7,	%f18
	movvc	%icc,	%i7,	%i3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdpos	%xcc,	%f30,	%f16
	rdhpr	%hpstate,	%o7
	nop
	setx	0x10C6B9F05919ED8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x784E2800,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f28,	%f6
	call	loop_1125
	bleu,a,pn	%icc,	loop_1126
	fmovdne	%fcc0,	%f28,	%f16
	fmovda	%icc,	%f28,	%f10
loop_1125:
	call	loop_1127
loop_1126:
	fbl,a	%fcc3,	loop_1128
	for	%f28,	%f6,	%f28
	bpos,a	%xcc,	loop_1129
loop_1127:
	fmovdle	%xcc,	%f10,	%f26
loop_1128:
	fmovrdgz	%l4,	%f0,	%f10
	fmovd	%f8,	%f4
loop_1129:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	membar	0x57
	call	loop_1130
	nop
	set	0x50, %o3
	ldstub	[%l7 + %o3],	%o3
	call	loop_1131
	movleu	%icc,	%l0,	%l3
loop_1130:
	ble,pt	%icc,	loop_1132
	flushw
loop_1131:
	nop
	setx	0xFE6C64A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	fmul8x16al	%f28,	%f27,	%f12
loop_1132:
	tvs	%icc,	0x0
	call	loop_1133
	call	loop_1134
	call	loop_1135
	taddcctv	%g3,	%g1,	%o6
loop_1133:
	fmovd	%f10,	%f4
loop_1134:
	call	loop_1136
loop_1135:
	fmovdge	%icc,	%f30,	%f0
	wr	%g4,	0x02D7,	%set_softint
	edge16l	%i4,	%g5,	%l2
loop_1136:
	fmovdne	%icc,	%f28,	%f22
	tcc	%icc,	0x5
	call	loop_1137
	nop
	setx	0x5D0D2473,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f25
	fcmpgt16	%f20,	%f16,	%o5
	call	loop_1138
loop_1137:
	srl	%i0,	%g7,	%i6
	edge32ln	%g2,	%i2,	%l5
	call	loop_1139
loop_1138:
	movue	%fcc1,	0x729,	%g6
	call	loop_1140
	call	loop_1141
loop_1139:
	movg	%icc,	0x048,	%o4
	tne	%xcc,	0x4
loop_1140:
	rdpr	%cwp,	%l6
loop_1141:
	andncc	%i1,	0x13A6,	%o1
	movpos	%xcc,	%o0,	%i3
	srl	%o7,	%i7,	%i5
	fmovdle	%xcc,	%f24,	%f24
	fbne,a	%fcc3,	loop_1142
	orcc	%l1,	0x1D47,	%o2
	call	loop_1143
	brgz,a	%o3,	loop_1144
loop_1142:
	tge	%xcc,	0x6
	fmovdn	%fcc1,	%f0,	%f18
loop_1143:
	call	loop_1145
loop_1144:
	fcmple32	%f4,	%f24,	%l4
	call	loop_1146
	call	loop_1147
loop_1145:
	fandnot2	%f8,	%f22,	%f20
	xnorcc	%l3,	0x18D9,	%g3
loop_1146:
	udivx	%l0,	%o6,	%g1
loop_1147:
	call	loop_1148
	call	loop_1149
	call	loop_1150
	rdpr	%otherwin,	%i4
loop_1148:
	fnot1s	%f8,	%f15
loop_1149:
	wrpr	%g4,	0x0677,	%pil
loop_1150:
	fbge,a,pt	%fcc0,	loop_1151
	fmovsuge	%fcc2,	%f30,	%f25
	fmovsvc	%xcc,	%f25,	%f14
	fmovse	%fcc2,	%f26,	%f30
loop_1151:
	nop
	setx	0x2882EF6034F01B56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x640D1956E171244A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f2,	%f30
	call	loop_1152
	movne	%xcc,	%g5,	%o5
	fmovspos	%icc,	%f24,	%f5
	fmovdue	%fcc0,	%f14,	%f10
loop_1152:
	fnor	%f6,	%f30,	%f14
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 28
!	Type a   	: 32
!	Type x   	: 11
!	Type cti   	: 138
!	Type f   	: 152
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
.word 0x275AEBC5
.word 0x942F58CF
.word 0x23A7D8DA
.word 0x1CEE328C
.word 0xEE165EA6
.word 0x1094868C
.word 0xD6E5A292
.word 0xF3856D97
.word 0xF41D19A3
.word 0x92494DA7
.word 0x9017288B
.word 0x19A9A8D1
.word 0x05D39FF5
.word 0x72AD276D
.word 0x4D82FF6C
.word 0xCEC7C76C
.word 0x9E7D9530
.word 0xCACE880D
.word 0xF2977B22
.word 0x8FFEE501
.word 0xB804682E
.word 0xF78C47E6
.word 0x92C32006
.word 0x8ED474E4
.word 0x16CD9EEB
.word 0x6253EED1
.word 0xE83E54C5
.word 0xFC3BE162
.word 0xBE3DEFD9
.word 0x1FBC640B
.word 0xF6959D8F
.word 0x097ED4E2
.word 0x85079DD8
.word 0x362CB183
.word 0x62670484
.word 0xF7B3856A
.word 0xFDAEC48A
.word 0x880B8C01
.word 0x4B35D5F2
.word 0x82BF6EDB
.word 0x73D02259
.word 0xF507C7B8
.word 0xF18A92DC
.word 0xCAD38CF8
.word 0x10A0FE37
.word 0x9B292346
.word 0xE99A19B3
.word 0x627BFF1F
.word 0x2385EE6D
.word 0x901F6D83
.word 0x410643CA
.word 0xD459245F
.word 0x7F1E40E9
.word 0x9D36466F
.word 0xCBBF7005
.word 0x2EF7C5D9
.word 0x210DA761
.word 0xB149146E
.word 0xB06216EC
.word 0x821C54FD
.word 0x5C628033
.word 0xDB607639
.word 0x763F1C35
.word 0xB5A4220F
.end
