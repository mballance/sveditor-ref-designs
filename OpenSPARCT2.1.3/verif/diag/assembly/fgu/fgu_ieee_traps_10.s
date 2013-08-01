/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_10.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=54321"
.ident "Mon Dec  8 19:25:17 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_10.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x0,	%g1
	set	0x7,	%g2
	set	0x8,	%g3
	set	0xE,	%g4
	set	0xD,	%g5
	set	0xD,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xF,	%i1
	set	-0xB,	%i2
	set	-0xF,	%i3
	set	-0x6,	%i4
	set	-0x6,	%i5
	set	-0x0,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x0AF25D6D,	%l0
	set	0x24B16097,	%l1
	set	0x14E84117,	%l2
	set	0x1ADA1964,	%l3
	set	0x15ADAA92,	%l4
	set	0x4B17680B,	%l5
	set	0x650CE103,	%l6
	!# Output registers
	set	-0x03A5,	%o0
	set	-0x08FF,	%o1
	set	0x0732,	%o2
	set	0x045B,	%o3
	set	0x1D32,	%o4
	set	-0x1A8F,	%o5
	set	0x0D19,	%o6
	set	-0x0885,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	fmul8sux16	%f22,	%f14,	%f8
	mova	%fcc0,	0x706,	%g7
	fmovduge	%fcc3,	%f24,	%f20
	fmovsul	%fcc1,	%f23,	%f12
	fornot2s	%f24,	%f27,	%f6
	nop
	fitos	%f8,	%f18
	fstoi	%f18,	%f8
	call	loop_1
	rdhpr	%hpstate,	%o1
	call	loop_2
	call	loop_3
loop_1:
	fmovdleu	%xcc,	%f0,	%f6
	fmovrsne	%o0,	%f11,	%f3
loop_2:
	nop
	fitos	%f27,	%f28
loop_3:
	fcmpgt32	%f26,	%f4,	%l0
	fsrc1s	%f31,	%f1
	fmovrsgz	%i3,	%f31,	%f13
	movvs	%icc,	%l1,	%l5
	call	loop_4
	call	loop_5
	tcc	%xcc,	0x6
	ba	%xcc,	loop_6
loop_4:
	wrpr	%o2,	%l3,	%pil
loop_5:
	orncc	%i0,	0x121C,	%g1
	fbule,a,pt	%fcc0,	loop_7
loop_6:
	fcmple16	%f24,	%f26,	%i6
	rdhpr	%hsys_tick_cmpr,	%g2
	fble,a	%fcc2,	loop_8
loop_7:
	call	loop_9
	mulscc	%i2,	%i7,	%o6
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f16
loop_8:
	fxnors	%f26,	%f21,	%f28
loop_9:
	call	loop_10
	subcc	%o7,	%i1,	%l2
	movo	%fcc0,	%o5,	%o3
	wrpr	%g3,	%g5,	%pil
loop_10:
	stbar
	fmovrdne	%g6,	%f24,	%f6
	xnorcc	%l4,	%i4,	%o4
	fornot1s	%f18,	%f22,	%f0
	mova	%icc,	%l6,	%g4
	ble,a	%xcc,	loop_11
	movrlez	%i5,	0x047,	%g7
	fors	%f7,	%f0,	%f5
	movrgz	%o0,	%l0,	%i3
loop_11:
	fblg	%fcc1,	loop_12
	fmovdgu	%xcc,	%f14,	%f6
	fmovdule	%fcc3,	%f16,	%f10
	movlg	%fcc2,	%o1,	%l1
loop_12:
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%l5
	fnors	%f27,	%f20,	%f13
	movcs	%icc,	0x36A,	%l3
	array32	%o2,	%i0,	%g1
	fmovdpos	%xcc,	%f0,	%f18
	nop
	set	0x7C, %l0
	swap	[%l7 + %l0],	%g2
	umulcc	%i6,	0x0B5B,	%i7
	call	loop_13
	move	%fcc2,	%o6,	%i2
	call	loop_14
	array8	%o7,	%l2,	%i1
loop_13:
	call	loop_15
	call	loop_16
loop_14:
	rdpr	%cwp,	%o5
	edge16l	%o3,	%g3,	%g5
loop_15:
	movn	%fcc2,	0x1EE,	%l4
loop_16:
	call	loop_17
	sethi	0x055F,	%g6
	orn	%i4,	0x0FB4,	%o4
	call	loop_18
loop_17:
	brlez,a	%l6,	loop_19
	call	loop_20
	movne	%fcc1,	%g4,	%i5
loop_18:
	call	loop_21
loop_19:
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%g7
loop_20:
	andncc	%l0,	0x0192,	%o0
	fmovde	%icc,	%f4,	%f6
loop_21:
	fmovsle	%xcc,	%f7,	%f27
	call	loop_22
	movl	%icc,	0x042,	%i3
	nop
	fitos	%f14,	%f17
	fstod	%f17,	%f22
	fcmpes	%fcc3,	%f9,	%f13
loop_22:
	bmask	%l1,	%o1,	%l5
	call	loop_23
	call	loop_24
	fmovdl	%fcc2,	%f4,	%f28
	edge8ln	%l3,	%o2,	%g1
loop_23:
	fcmpes	%fcc3,	%f0,	%f3
loop_24:
	fmovdneg	%xcc,	%f4,	%f20
	ldsw	[%l7 + 0x38],	%i0
	wr 	%g0, 	0x4, 	%fprs
	fmul8x16	%f1,	%f26,	%f6
	call	loop_25
	fmovdle	%fcc2,	%f14,	%f2
	nop
	setx	0x654B81EA54E4676B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF1FA7243A91BDF81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f16,	%f12
	fbul,a	%fcc1,	loop_26
loop_25:
	call	loop_27
	call	loop_28
	fbo,a	%fcc3,	loop_29
loop_26:
	sdivcc	%i6,	0x1B24,	%i7
loop_27:
	fmovdl	%fcc1,	%f0,	%f0
loop_28:
	nop
	setx	0xDE1D8C23,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC0386399,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f14,	%f0
loop_29:
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f24
	fxtos	%f24,	%f12
	and	%i2,	%o6,	%o7
	call	loop_30
	fmovrsne	%i1,	%f1,	%f12
	ldsw	[%l7 + 0x6C],	%l2
	call	loop_31
loop_30:
	call	loop_32
	ble,pn	%icc,	loop_33
	rdpr	%pil,	%o3
loop_31:
	fmovsvs	%icc,	%f13,	%f24
loop_32:
	fmovsule	%fcc0,	%f7,	%f10
loop_33:
	call	loop_34
	nop
	fitos	%f7,	%f16
	fstod	%f16,	%f24
	call	loop_35
	tleu	%xcc,	0x0
loop_34:
	fcmpes	%fcc2,	%f22,	%f18
	call	loop_36
loop_35:
	call	loop_37
	call	loop_38
	fone	%f2
loop_36:
	call	loop_39
loop_37:
	movgu	%xcc,	%o5,	%g5
loop_38:
	fpsub16s	%f9,	%f31,	%f20
	call	loop_40
loop_39:
	xnor	%g3,	0x066B,	%g6
	fmovrsgz	%l4,	%f15,	%f14
	fcmpeq32	%f20,	%f16,	%o4
loop_40:
	edge8ln	%i4,	%g4,	%i5
	fpack16	%f6,	%f21
	call	loop_41
	ld	[%l7 + 0x54],	%f29
	fpmerge	%f15,	%f27,	%f20
	fmovdge	%fcc1,	%f20,	%f28
loop_41:
	orcc	%l6,	0x1A5B,	%g7
	faligndata	%f2,	%f22,	%f18
	edge16ln	%l0,	%o0,	%l1
	rdpr	%cansave,	%o1
	array32	%l5,	%i3,	%o2
	fors	%f14,	%f21,	%f8
	udivcc	%g1,	0x020A,	%l3
	fmovsneg	%xcc,	%f13,	%f16
	fmovduge	%fcc3,	%f30,	%f28
	bl,a	%xcc,	loop_42
	subcc	%i0,	%i6,	%g2
	call	loop_43
	bneg,a	%xcc,	loop_44
loop_42:
	fmovrslz	%i7,	%f4,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x691, 	%sys_tick_cmpr
loop_43:
	call	loop_45
loop_44:
	fmovdo	%fcc2,	%f2,	%f26
	movre	%i1,	0x2CA,	%o6
	flushw
loop_45:
	and	%o3,	%o5,	%g5
	call	loop_46
	fpadd32s	%f24,	%f25,	%f30
	fmovdl	%icc,	%f22,	%f26
	movcc	%xcc,	%l2,	%g6
loop_46:
	movue	%fcc0,	%l4,	%o4
	movcc	%xcc,	0x508,	%i4
	fmul8x16au	%f9,	%f27,	%f12
	tsubcctv	%g3,	0x015B,	%g4
	call	loop_47
	call	loop_48
	call	loop_49
	call	loop_50
loop_47:
	call	loop_51
loop_48:
	fmovsu	%fcc1,	%f23,	%f30
loop_49:
	call	loop_52
loop_50:
	edge32ln	%i5,	%g7,	%l6
loop_51:
	fcmpne32	%f0,	%f2,	%l0
	fmovse	%fcc0,	%f10,	%f11
loop_52:
	fmovrsgez	%l1,	%f13,	%f9
	xorcc	%o0,	%o1,	%l5
	call	loop_53
	subc	%o2,	0x0192,	%g1
	fmovdgu	%xcc,	%f4,	%f20
	fpsub32	%f12,	%f12,	%f0
loop_53:
	bgu,pn	%icc,	loop_54
	call	loop_55
	xorcc	%l3,	0x1F2B,	%i0
	edge32n	%i6,	%i3,	%i7
loop_54:
	fandnot2	%f14,	%f14,	%f22
loop_55:
	fba,a,pn	%fcc3,	loop_56
	fmovsul	%fcc1,	%f22,	%f7
	call	loop_57
	fcmpgt32	%f2,	%f30,	%i2
loop_56:
	pdist	%f6,	%f8,	%f8
	wrpr	%g2,	%i1,	%cwp
loop_57:
	tsubcc	%o6,	%o3,	%o5
	sdivx	%o7,	0x0A00,	%l2
	tsubcctv	%g6,	0x0FED,	%g5
	fmovsne	%fcc1,	%f24,	%f22
	call	loop_58
	edge16	%l4,	%o4,	%g3
	edge16n	%g4,	%i4,	%i5
	fornot1s	%f13,	%f2,	%f3
loop_58:
	fexpand	%f6,	%f2
	smul	%g7,	0x0421,	%l6
	rdhpr	%hsys_tick_cmpr,	%l1
	wr	%g0,	0xe2,	%asi
	stwa	%o0,	[%l7 + 0x1C] %asi
	membar	#Sync
	call	loop_59
	fpadd16s	%f28,	%f22,	%f0
	edge32l	%l0,	%o1,	%l5
	edge32n	%g1,	%l3,	%i0
loop_59:
	fcmpd	%fcc1,	%f28,	%f30
	nop
	set	0x38, %g2
	ldstub	[%l7 + %g2],	%o2
	call	loop_60
	tvs	%icc,	0x1
	fmovdug	%fcc1,	%f14,	%f26
	call	loop_61
loop_60:
	movule	%fcc1,	%i3,	%i6
	movle	%xcc,	%i2,	%i7
	wrpr	%g2,	0x0053,	%cwp
loop_61:
	call	loop_62
	call	loop_63
	call	loop_64
	rd	%pc,	%i1
loop_62:
	call	loop_65
loop_63:
	call	loop_66
loop_64:
	ldsh	[%l7 + 0x08],	%o3
	nop
	setx	0x371530E6665C4330,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f18
loop_65:
	membar	0x53
loop_66:
	or	%o5,	0x0F87,	%o7
	ldd	[%l7 + 0x20],	%f2
	fsrc1	%f28,	%f28
	wr	%o6,	%l2,	%pic
	tsubcctv	%g6,	%l4,	%o4
	edge8l	%g3,	%g5,	%i4
	edge16ln	%i5,	%g7,	%l6
	fors	%f12,	%f12,	%f17
	fble,a	%fcc1,	loop_67
	fmovdle	%icc,	%f12,	%f0
	movcs	%xcc,	%l1,	%o0
	nop
	setx	0x10C8,	%l0,	%o1
	sdivcc	%l0,	%o1,	%l5
loop_67:
	movuge	%fcc2,	%g4,	%l3
	call	loop_68
	sethi	0x0314,	%i0
	fmovsn	%fcc0,	%f29,	%f13
	orcc	%g1,	%i3,	%i6
loop_68:
	fmovda	%xcc,	%f12,	%f24
	movneg	%icc,	0x110,	%o2
	nop
	setx	0xE854EB9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC9C56AEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f9,	%f16
	call	loop_69
	sdivx	%i2,	0x0837,	%g2
	call	loop_70
	call	loop_71
loop_69:
	fmovspos	%xcc,	%f31,	%f12
	bmask	%i1,	%i7,	%o3
loop_70:
	fmovrdlz	%o7,	%f6,	%f2
loop_71:
	call	loop_72
	movre	%o5,	%o6,	%g6
	set	0x56, %o4
	ldsba	[%l7 + %o4] 0x10,	%l4
loop_72:
	fmovsvs	%xcc,	%f10,	%f3
	bvs	%icc,	loop_73
	call	loop_74
	call	loop_75
	fmovs	%f17,	%f10
loop_73:
	sethi	0x1D04,	%o4
loop_74:
	tle	%icc,	0x2
loop_75:
	fmovd	%f28,	%f14
	xnorcc	%g3,	%g5,	%l2
	fmovdcs	%icc,	%f22,	%f6
	movlg	%fcc1,	0x12D,	%i5
	siam	0x0
	set	0x5B, %l1
	lduba	[%l7 + %l1] 0x80,	%g7
	fcmpgt16	%f8,	%f16,	%i4
	xnor	%l6,	0x03F1,	%l1
	call	loop_76
	call	loop_77
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f0
	fxtod	%f0,	%f14
	srax	%l0,	%o0,	%l5
loop_76:
	call	loop_78
loop_77:
	umul	%g4,	0x10E2,	%o1
	srl	%l3,	0x19,	%i0
	brz,a,pt	%g1,	loop_79
loop_78:
	nop
	setx	0xCDA1A084272A8170,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	call	loop_80
	fandnot2s	%f1,	%f26,	%f6
loop_79:
	fmovsle	%fcc3,	%f13,	%f29
	fsrc2s	%f2,	%f2
loop_80:
	fmovsue	%fcc2,	%f29,	%f10
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 1
	call	loop_81
	fnegd	%f6,	%f0
	call	loop_82
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f10
loop_81:
	bneg	%icc,	loop_83
	fabss	%f5,	%f24
loop_82:
	call	loop_84
	bg,pt	%icc,	loop_85
loop_83:
	nop
	fitos	%f13,	%f15
	fmovs	%f2,	%f3
loop_84:
	call	loop_86
loop_85:
	movue	%fcc2,	0x22B,	%i3
	fpadd32s	%f5,	%f10,	%f15
	bcc	%icc,	loop_87
loop_86:
	fexpand	%f29,	%f22
	call	loop_88
	call	loop_89
loop_87:
	call	loop_90
	call	loop_91
loop_88:
	xnorcc	%i6,	0x0A07,	%i2
loop_89:
	bleu,pt	%icc,	loop_92
loop_90:
	tpos	%icc,	0x2
loop_91:
	tl	%xcc,	0x2
	fmul8x16al	%f9,	%f29,	%f6
loop_92:
	nop
	fitod	%f6,	%f26
	fdtos	%f26,	%f18
	fba,a	%fcc2,	loop_93
	fpsub32s	%f13,	%f25,	%f20
	fmovdo	%fcc1,	%f14,	%f4
	call	loop_94
loop_93:
	call	loop_95
	call	loop_96
	st	%f8,	[%l7 + 0x20]
loop_94:
	edge8n	%o2,	%g2,	%i1
loop_95:
	edge8ln	%o3,	%o7,	%i7
loop_96:
	call	loop_97
	movule	%fcc1,	%o5,	%o6
	wr	%g6,	0x1005,	%y
	tvc	%xcc,	0x1
loop_97:
	tl	%xcc,	0x2
	addccc	%o4,	%l4,	%g3
	addc	%g5,	%i5,	%l2
	fands	%f5,	%f5,	%f7
	fcmps	%fcc3,	%f15,	%f1
	call	loop_98
	bcs,pn	%xcc,	loop_99
	call	loop_100
	tn	%xcc,	0x2
loop_98:
	fmovsul	%fcc0,	%f27,	%f10
loop_99:
	bgu	%icc,	loop_101
loop_100:
	call	loop_102
	edge32n	%i4,	%g7,	%l6
	fmovdo	%fcc3,	%f26,	%f16
loop_101:
	fpackfix	%f6,	%f26
loop_102:
	bg,a	%xcc,	loop_103
	bneg,a,pt	%icc,	loop_104
	fmovd	%f0,	%f30
	fbul,a	%fcc1,	loop_105
loop_103:
	fmovse	%fcc1,	%f26,	%f26
loop_104:
	nop
	setx loop_106, %l0, %l1
	jmpl %l1, %l0
	bgu	%icc,	loop_107
loop_105:
	call	loop_108
	tsubcc	%l1,	%o0,	%g4
loop_106:
	fsrc2	%f10,	%f18
loop_107:
	tpos	%xcc,	0x4
loop_108:
	fmovdg	%icc,	%f2,	%f20
	call	loop_109
	nop
	setx	0x4224A14DDCF91AD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xC4F988E6C4B88637,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f24,	%f18
	rdhpr	%hpstate,	%l5
	wrpr 	%g0, 	0x2, 	%gl
loop_109:
	fmuld8sux16	%f27,	%f31,	%f26
	nop
	setx	0x23733039D910E08E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7EE918CF2563AE28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f30,	%f2
	sub	%g1,	%l3,	%i3
	mulscc	%i2,	%i6,	%o2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i1,	%g2
	fbuge,pn	%fcc1,	loop_110
	call	loop_111
	fmovsue	%fcc0,	%f0,	%f1
	rdpr	%pil,	%o3
loop_110:
	call	loop_112
loop_111:
	rd	%softint,	%i7
	rd	%asi,	%o7
	nop
	setx	0xCB86A426,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5E221714,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f20,	%f23
loop_112:
	rdpr	%cleanwin,	%o5
	call	loop_113
	fnot1	%f24,	%f10
	fmovrdlez	%g6,	%f8,	%f16
	rdpr	%tl,	%o4
loop_113:
	nop
	wr	%g0,	0x22,	%asi
	stha	%l4,	[%l7 + 0x0C] %asi
	membar	#Sync
	fmovdcc	%xcc,	%f26,	%f12
	movrlz	%g3,	%g5,	%o6
	call	loop_114
	call	loop_115
	call	loop_116
	call	loop_117
loop_114:
	movpos	%xcc,	0x4DD,	%l2
loop_115:
	call	loop_118
loop_116:
	call	loop_119
loop_117:
	fmovdneg	%icc,	%f6,	%f8
	fmovrse	%i5,	%f19,	%f17
loop_118:
	call	loop_120
loop_119:
	fmovrse	%g7,	%f19,	%f9
	tsubcctv	%l6,	0x06B7,	%i4
	call	loop_121
loop_120:
	nop
	setx	0x1ED6,	%l0,	%o0
	udiv	%l1,	%o0,	%l0
	movgu	%icc,	%g4,	%o1
	nop
	set	0x1C, %g1
	ldsw	[%l7 + %g1],	%i0
loop_121:
	addcc	%g1,	0x1B2F,	%l5
	movle	%fcc0,	%l3,	%i2
	call	loop_122
	bn	%xcc,	loop_123
	call	loop_124
	fexpand	%f25,	%f28
loop_122:
	call	loop_125
loop_123:
	call	loop_126
loop_124:
	popc	0x148D,	%i6
	fpadd32s	%f8,	%f14,	%f18
loop_125:
	fnands	%f9,	%f19,	%f24
loop_126:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x19] %asi,	%i3
	call	loop_127
	edge16	%o2,	%g2,	%o3
	movvc	%icc,	0x372,	%i1
	tpos	%xcc,	0x2
loop_127:
	rdpr	%cwp,	%o7
	fmovdu	%fcc0,	%f22,	%f8
	fpack32	%f8,	%f6,	%f8
	call	loop_128
	call	loop_129
	fmovdge	%icc,	%f30,	%f26
	movul	%fcc2,	%i7,	%o5
loop_128:
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f0
loop_129:
	fbe,a,pt	%fcc2,	loop_130
	fmovdneg	%icc,	%f8,	%f14
	fmovsg	%fcc2,	%f23,	%f6
	andcc	%o4,	0x0806,	%l4
loop_130:
	call	loop_131
	call	loop_132
	tneg	%xcc,	0x3
	xorcc	%g6,	0x0321,	%g3
loop_131:
	fsrc1	%f4,	%f2
loop_132:
	tvs	%icc,	0x6
	call	loop_133
	tg	%icc,	0x0
	movvc	%icc,	%o6,	%l2
	mulx	%g5,	0x10D2,	%i5
loop_133:
	call	loop_134
	rd	%softint,	%l6
	smulcc	%g7,	%l1,	%o0
	fornot2s	%f29,	%f16,	%f4
loop_134:
	call	loop_135
	wr	%l0,	%g4,	%clear_softint
	movg	%icc,	0x54C,	%o1
	fandnot1	%f20,	%f8,	%f10
loop_135:
	call	loop_136
	call	loop_137
	fmovdl	%fcc0,	%f28,	%f28
	edge16n	%i0,	%i4,	%g1
loop_136:
	fmovrslez	%l3,	%f27,	%f7
loop_137:
	call	loop_138
	call	loop_139
	fmul8x16al	%f5,	%f24,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_138:
	fmuld8sux16	%f7,	%f16,	%f12
loop_139:
	fmovrdne	%l5,	%f10,	%f12
	call	loop_140
	fmovrsgez	%i3,	%f14,	%f28
	fcmpes	%fcc0,	%f4,	%f2
	fsrc1	%f6,	%f24
loop_140:
	fbl,pn	%fcc0,	loop_141
	fmovdpos	%icc,	%f4,	%f24
	edge32ln	%o2,	%o3,	%i1
	fand	%f4,	%f18,	%f20
loop_141:
	tleu	%icc,	0x3
	fxnor	%f12,	%f14,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flush	%l7 + 0x70

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDA, 	%hsys_tick_cmpr
	mulx	%o7,	%o4,	%l4
	fpadd16	%f6,	%f4,	%f4
	rd	%softint,	%g3
	call	loop_142
	call	loop_143
	fcmps	%fcc0,	%f3,	%f16
	fcmpd	%fcc0,	%f12,	%f4
loop_142:
	fors	%f11,	%f29,	%f26
loop_143:
	fmovde	%xcc,	%f8,	%f8
	call	loop_144
	ta	%icc,	0x4
	fmovslg	%fcc1,	%f1,	%f8
	rdpr	%tl,	%g6
loop_144:
	nop
	setx	loop_145,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_146
	call	loop_147
	popc	0x137F,	%l2
loop_145:
	fcmple16	%f12,	%f28,	%o6
loop_146:
	rdpr	%tba,	%g5
loop_147:
	faligndata	%f20,	%f6,	%f14
	call	loop_148
	fpsub16s	%f12,	%f21,	%f2
	tl	%icc,	0x6
	fmovsge	%fcc2,	%f3,	%f7
loop_148:
	tcs	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l6
	call	loop_149
	call	loop_150
	andcc	%i5,	0x1EB3,	%g7
	xnor	%l1,	%o0,	%l0
loop_149:
	nop
	setx	0xF2B8A2D5D81A1533,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f22
loop_150:
	nop
	fitos	%f11,	%f30
	fstod	%f30,	%f22
	movue	%fcc1,	%o1,	%g4
	bge,pn	%icc,	loop_151
	call	loop_152
loop_151:
	nop

loop_152:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 22
!	Type a   	: 31
!	Type x   	: 7
!	Type cti   	: 152
!	Type f   	: 157
!	Type i   	: 131
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
	set	0xC,	%g2
	set	0xD,	%g3
	set	0x2,	%g4
	set	0xB,	%g5
	set	0xB,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x5,	%i1
	set	-0xB,	%i2
	set	-0x4,	%i3
	set	-0xE,	%i4
	set	-0x0,	%i5
	set	-0x5,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x16D54E24,	%l0
	set	0x264F3394,	%l1
	set	0x65B3E8B0,	%l2
	set	0x45C697CD,	%l3
	set	0x6974AC58,	%l4
	set	0x6963D31A,	%l5
	set	0x2311DF17,	%l6
	!# Output registers
	set	0x1400,	%o0
	set	-0x191A,	%o1
	set	0x08FE,	%o2
	set	-0x12E0,	%o3
	set	-0x105D,	%o4
	set	-0x1A3E,	%o5
	set	-0x09F3,	%o6
	set	-0x0B94,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	tg	%icc,	0x0
	call	loop_153
	call	loop_154
	nop
	setx	0x1BEB,	%l0,	%g1
	sdivcc	%i4,	%g1,	%l3
	movrlez	%i0,	0x10F,	%i2
loop_153:
	nop
	wr	%g0,	0xe2,	%asi
	stxa	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
loop_154:
	movvc	%xcc,	%i3,	%l5
	fmovsuge	%fcc2,	%f29,	%f16
	rdpr	%tba,	%o3
	fmovso	%fcc2,	%f17,	%f14
	call	loop_155
	rdhpr	%ver,	%o2
	call	loop_156
	brlz,a,pt	%g2,	loop_157
loop_155:
	ldsw	[%l7 + 0x14],	%i7
	alignaddr	%i1,	%o5,	%o7
loop_156:
	call	loop_158
loop_157:
	fmovdne	%xcc,	%f16,	%f6
	fsrc2s	%f21,	%f8
	fornot1s	%f7,	%f31,	%f3
loop_158:
	fmovdug	%fcc2,	%f12,	%f6
	fmovde	%icc,	%f26,	%f8
	call	loop_159
	fmovsl	%xcc,	%f21,	%f18
	call	loop_160
	bgu	%xcc,	loop_161
loop_159:
	fsrc2	%f0,	%f22
	rd	%fprs,	%o4
loop_160:
	fmovduge	%fcc2,	%f14,	%f6
loop_161:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l4,	%g6
	fmovse	%xcc,	%f17,	%f22
	call	loop_162
	fors	%f14,	%f5,	%f20
	fmovrdlz	%l2,	%f26,	%f2
	movue	%fcc1,	%o6,	%g3
loop_162:
	fmovdlg	%fcc2,	%f0,	%f8
	movul	%fcc1,	%l6,	%g5
	call	loop_163
	fbue,a,pt	%fcc2,	loop_164
	mulx	%g7,	0x0F4A,	%l1
	call	loop_165
loop_163:
	fpadd32	%f8,	%f8,	%f28
loop_164:
	brgz,pn	%i5,	loop_166
	bneg,a,pt	%icc,	loop_167
loop_165:
	fmovsne	%xcc,	%f5,	%f11
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_166:
	nop
	set	0x38, %o2
	stda	%l0,	[%l7 + %o2] 0x0c
loop_167:
	bvs	%icc,	loop_168
	call	loop_169
	call	loop_170
	mulx	%o1,	%g4,	%o0
loop_168:
	fmovsne	%icc,	%f0,	%f6
loop_169:
	umulcc	%i4,	%g1,	%i0
loop_170:
	fmovsl	%fcc1,	%f22,	%f30
	call	loop_171
	fmovdg	%fcc0,	%f24,	%f14
	edge32ln	%i2,	%i6,	%i3
	call	loop_172
loop_171:
	fcmpgt32	%f12,	%f30,	%l5
	movo	%fcc0,	0x504,	%o3
	rd	%sys_tick_cmpr,	%l3
loop_172:
	call	loop_173
	call	loop_174
	subc	%g2,	0x1248,	%i7
	mulx	%o2,	%i1,	%o7
loop_173:
	nop
	set	0x40, %g5
	stw	%o5,	[%l7 + %g5]
loop_174:
	fnot1	%f4,	%f10
	fmovrdlz	%o4,	%f20,	%f16
	fmul8sux16	%f24,	%f20,	%f4
	flush	%l7 + 0x68
	fmovdl	%fcc2,	%f8,	%f2
	fmul8sux16	%f24,	%f30,	%f0
	nop
	setx	0x8C4C86276528F2E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x741B594A103210B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f22,	%f4
	movlg	%fcc0,	0x618,	%l4
	call	loop_175
	orcc	%l2,	%o6,	%g3
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%i6
	call	loop_176
loop_175:
	fmovdug	%fcc3,	%f12,	%f18
	fones	%f27
	fnand	%f26,	%f26,	%f22
loop_176:
	movug	%fcc2,	%g5,	%g7
	fmuld8sux16	%f17,	%f7,	%f12
	fabsd	%f22,	%f20
	call	loop_177
	call	loop_178
	stbar
	call	loop_179
loop_177:
	edge32l	%g6,	%i5,	%l1
loop_178:
	movrgz	%l0,	0x0A5,	%g4
	fmovda	%fcc2,	%f8,	%f8
loop_179:
	tne	%icc,	0x6
	fmovsl	%fcc1,	%f5,	%f10
	rdhpr	%ver,	%o0
	sdivcc	%o1,	0x0F0E,	%g1
	membar	0x16
	call	loop_180
	fmovdge	%fcc3,	%f16,	%f22
	movuge	%fcc3,	%i4,	%i0
	call	loop_181
loop_180:
	fbne	%fcc0,	loop_182
	sll	%i2,	0x1B,	%i6
	call	loop_183
loop_181:
	call	loop_184
loop_182:
	bcs,a	%xcc,	loop_185
	mova	%xcc,	%i3,	%l5
loop_183:
	fmovrdgz	%o3,	%f4,	%f22
loop_184:
	movrlz	%g2,	%i7,	%o2
loop_185:
	movre	%i1,	%l3,	%o7
	fmovdcs	%xcc,	%f30,	%f18
	sir	0x0CAC
	movrgz	%o5,	0x0F5,	%o4
	call	loop_186
	movuge	%fcc2,	0x4C4,	%l4
	fbo,a,pn	%fcc2,	loop_187
	or	%o6,	%g3,	%l2
loop_186:
	call	loop_188
	call	loop_189
loop_187:
	fpadd16s	%f31,	%f30,	%f12
	call	loop_190
loop_188:
	ta	%xcc,	0x6
loop_189:
	addcc	%g5,	%g7,	%l6
	call	loop_191
loop_190:
	membar	0x6B
	movvs	%xcc,	0x4A5,	%i5
	call	loop_192
loop_191:
	rd	%tick_cmpr,	%g6
	smulcc	%l1,	0x0864,	%l0
	call	loop_193
loop_192:
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f10
	movg	%icc,	%g4,	%o1
	edge32	%g1,	%i4,	%o0
loop_193:
	fmovspos	%icc,	%f30,	%f7
	movre	%i2,	0x1FC,	%i0
	sub	%i6,	0x000F,	%l5
	call	loop_194
	call	loop_195
	call	loop_196
	tleu	%xcc,	0x7
loop_194:
	nop
	set	0x64, %o3
	prefetch	[%l7 + %o3],	 4
loop_195:
	edge32ln	%o3,	%g2,	%i3
loop_196:
	edge16l	%o2,	%i1,	%i7
	call	loop_197
	call	loop_198
	fornot1	%f24,	%f22,	%f10
	call	loop_199
loop_197:
	fornot2s	%f21,	%f1,	%f4
loop_198:
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_200
loop_199:
	fcmpne32	%f30,	%f0,	%o5
	call	loop_201
	nop
	setx	0xE052F19AC6B83E40,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_200:
	fcmple16	%f12,	%f2,	%l4
	call	loop_202
loop_201:
	movrlz	%o6,	%o4,	%l2
	nop
	fitos	%f2,	%f30
	fstod	%f30,	%f20
	call	loop_203
loop_202:
	subccc	%g3,	%g5,	%g7
	udiv	%i5,	0x181E,	%l6
	fmovspos	%icc,	%f18,	%f31
loop_203:
	sra	%g6,	0x17,	%l0
	fpadd32	%f22,	%f0,	%f14
	andcc	%g4,	0x1C17,	%l1
	call	loop_204
	call	loop_205
	movl	%xcc,	%o1,	%i4
	call	loop_206
loop_204:
	bvs,a	%icc,	loop_207
loop_205:
	tpos	%xcc,	0x7
	fnand	%f0,	%f18,	%f0
loop_206:
	ta	%icc,	0x7
loop_207:
	fbo,pn	%fcc1,	loop_208
	orncc	%o0,	0x07C9,	%i2
	call	loop_209
	tvc	%xcc,	0x6
loop_208:
	taddcc	%i0,	%g1,	%l5
	call	loop_210
loop_209:
	call	loop_211
	movu	%fcc3,	0x3D1,	%i6
	call	loop_212
loop_210:
	call	loop_213
loop_211:
	fabss	%f17,	%f14
	umul	%g2,	0x08E7,	%o3
loop_212:
	call	loop_214
loop_213:
	fone	%f26
	nop
	setx	0x6302F2FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xF0B3E80B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f10,	%f22
	nop
	setx	0xA5599E3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x7F471490,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f18,	%f25
loop_214:
	fmovrdne	%i3,	%f2,	%f26
	movul	%fcc0,	0x542,	%i1
	for	%f30,	%f2,	%f28
	faligndata	%f14,	%f24,	%f24
	call	loop_215
	movge	%fcc2,	0x2BA,	%i7
	nop
	setx	0x3E4005B749B9FD55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4831F5095C6DADEB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f16,	%f14
	subcc	%l3,	%o7,	%o5
loop_215:
	call	loop_216
	call	loop_217
	tg	%xcc,	0x1
	fmovdleu	%xcc,	%f30,	%f28
loop_216:
	nop
	set	0x48, %l4
	stxa	%o2,	[%l7 + %l4] 0x27
	membar	#Sync
loop_217:
	call	loop_218
	edge16ln	%o6,	%l4,	%l2
	movrgz	%g3,	%o4,	%g7
	movg	%xcc,	%i5,	%g5
loop_218:
	subccc	%l6,	%l0,	%g4
	call	loop_219
	fpack16	%f18,	%f2
	call	loop_220
	fpack16	%f2,	%f13
loop_219:
	tcs	%icc,	0x0
	call	loop_221
loop_220:
	nop
	fitos	%f8,	%f13
	fstoi	%f13,	%f24
	call	loop_222
	rdhpr	%hintp,	%l1
loop_221:
	fnot1s	%f20,	%f28
	call	loop_223
loop_222:
	call	loop_224
	fpsub32	%f24,	%f8,	%f16
	fmovdule	%fcc0,	%f14,	%f18
loop_223:
	fandnot2s	%f20,	%f16,	%f10
loop_224:
	fmuld8sux16	%f11,	%f10,	%f24
	and	%o1,	0x0E0D,	%g6
	tg	%xcc,	0x5
	call	loop_225
	nop
	setx	0x1A6F2098DD7529A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB3E98F0AB5DC0EAB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f28,	%f6
	fbn,pn	%fcc3,	loop_226
	call	loop_227
loop_225:
	tsubcctv	%o0,	%i2,	%i4
	popc	0x102D,	%g1
loop_226:
	wr	%i0,	0x010C,	%y
loop_227:
	nop
	setx	0xA02C787F7CFFBF65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x61B76A652F074FBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f22
	nop
	setx	0x0018,	%l0,	%g2
	sdivx	%l5,	%g2,	%o3
	call	loop_228
	andn	%i6,	%i3,	%i1
	sllx	%l3,	%i7,	%o5
	call	loop_229
loop_228:
	fmovsa	%fcc1,	%f21,	%f31
	fandnot1s	%f27,	%f6,	%f11
	rdpr	%pil,	%o7
loop_229:
	movue	%fcc2,	0x0D9,	%o6
	fmovsa	%xcc,	%f11,	%f10
	fmovs	%f11,	%f24
	nop
	setx	0x8006481B0389DDC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8AEAD0E87CD254BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f8
	call	loop_230
	call	loop_231
	nop
	setx	0x6DC1413,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	movvs	%icc,	%o2,	%l2
loop_230:
	fmovrse	%l4,	%f16,	%f26
loop_231:
	fmovrsgez	%o4,	%f16,	%f24
	rdpr	%cwp,	%g7
	fpadd32s	%f16,	%f10,	%f17
	bl,pt	%icc,	loop_232
	call	loop_233
	edge8n	%g3,	%g5,	%l6
	call	loop_234
loop_232:
	call	loop_235
loop_233:
	fmovdg	%icc,	%f28,	%f4
	brnz	%l0,	loop_236
loop_234:
	nop
	setx	0xA34B20B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x8F0312D9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f5,	%f17
loop_235:
	sllx	%g4,	0x05,	%i5
	fpadd32	%f10,	%f26,	%f6
loop_236:
	srl	%o1,	%l1,	%o0
	fcmpeq32	%f12,	%f12,	%i2
	call	loop_237
	nop
	set	0x78, %i3
	prefetch	[%l7 + %i3],	 2
	fmovrslez	%g6,	%f12,	%f24
	xorcc	%g1,	0x0294,	%i0
loop_237:
	nop
	setx	0x3048B6C6E8A1859E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD2D236C3043D78B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f6,	%f0
	call	loop_238
	ble,pn	%icc,	loop_239
	call	loop_240
	rdpr	%cansave,	%l5
loop_238:
	fmovd	%f6,	%f28
loop_239:
	fxors	%f3,	%f18,	%f16
loop_240:
	fbul	%fcc2,	loop_241
	edge8	%g2,	%i4,	%o3
	call	loop_242
	fnors	%f5,	%f7,	%f26
loop_241:
	call	loop_243
	tleu	%icc,	0x1
loop_242:
	call	loop_244
	bne	%xcc,	loop_245
loop_243:
	bneg,a,pn	%icc,	loop_246
	fmovdvc	%xcc,	%f24,	%f8
loop_244:
	nop
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
loop_245:
	fbug,pt	%fcc1,	loop_247
loop_246:
	fmovde	%fcc0,	%f8,	%f2
	call	loop_248
	fandnot1	%f22,	%f12,	%f22
loop_247:
	rd	%sys_tick_cmpr,	%i1
	fmovsule	%fcc0,	%f0,	%f8
loop_248:
	call	loop_249
	fmovsul	%fcc2,	%f31,	%f31
	fmovsle	%xcc,	%f16,	%f30
	fmovdvs	%icc,	%f0,	%f28
loop_249:
	andn	%i6,	%i7,	%l3
	srax	%o5,	0x07,	%o7
	movrlz	%o6,	0x396,	%o2
	edge32	%l4,	%o4,	%l2
	fpadd16	%f2,	%f14,	%f22
	udivcc	%g7,	0x0EE3,	%g3
	fbo,a	%fcc1,	loop_250
	fmovdn	%icc,	%f24,	%f4
	call	loop_251
	call	loop_252
loop_250:
	fsrc2s	%f8,	%f19
	fnot2s	%f22,	%f12
loop_251:
	fmovrdne	%l6,	%f24,	%f4
loop_252:
	call	loop_253
	wr	%g5,	0x12C9,	%y
	call	loop_254
	fmovrdlz	%l0,	%f14,	%f8
loop_253:
	fmovdg	%fcc0,	%f6,	%f22
	movuge	%fcc2,	%i5,	%g4
loop_254:
	siam	0x6
	rdhpr	%hintp,	%l1
	fmovsl	%fcc1,	%f25,	%f23
	fmovslg	%fcc0,	%f5,	%f1
	call	loop_255
	fmovse	%icc,	%f0,	%f14
	nop
	setx	0xC42978F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xAA12107B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f23,	%f31
	brz,pn	%o1,	loop_256
loop_255:
	taddcc	%o0,	0x071F,	%i2
	set	0x4C, %g7
	lduwa	[%l7 + %g7] 0x89,	%g6
loop_256:
	call	loop_257
	fbl,a,pt	%fcc3,	loop_258
	fmovdgu	%xcc,	%f28,	%f14
	fmovduge	%fcc2,	%f12,	%f22
loop_257:
	call	loop_259
loop_258:
	tvs	%xcc,	0x1
	call	loop_260
	rd	%softint,	%i0
loop_259:
	call	loop_261
	call	loop_262
loop_260:
	call	loop_263
	edge32l	%l5,	%g1,	%g2
loop_261:
	call	loop_264
loop_262:
	call	loop_265
loop_263:
	rdpr	%cleanwin,	%o3
	edge8n	%i4,	%i3,	%i6
loop_264:
	fmul8sux16	%f0,	%f22,	%f0
loop_265:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i1,	%i7
	call	loop_266
	fpmerge	%f13,	%f23,	%f4
	call	loop_267
	call	loop_268
loop_266:
	wrpr	%l3,	0x0F9F,	%pil
	movl	%fcc0,	0x65D,	%o5
loop_267:
	call	loop_269
loop_268:
	rdpr	%cwp,	%o6
	sethi	0x0A1A,	%o2
	fmovdl	%fcc0,	%f12,	%f28
loop_269:
	fmovse	%xcc,	%f4,	%f9
	fmovdne	%xcc,	%f26,	%f28
	call	loop_270
	movvc	%xcc,	0x38A,	%o7
	call	loop_271
	fnot1	%f10,	%f24
loop_270:
	fmovdu	%fcc3,	%f24,	%f22
	fmovdge	%xcc,	%f26,	%f30
loop_271:
	call	loop_272
	fmul8sux16	%f22,	%f0,	%f2
	call	loop_273
	fxnor	%f2,	%f2,	%f14
loop_272:
	call	loop_274
	movle	%fcc0,	%o4,	%l4
loop_273:
	rd	%pc,	%l2
	subccc	%g7,	%l6,	%g5
loop_274:
	call	loop_275
	movne	%xcc,	0x1F9,	%g3
	call	loop_276
	wrpr	%l0,	%i5,	%cwp
loop_275:
	fmovse	%fcc1,	%f14,	%f10
	call	loop_277
loop_276:
	movug	%fcc0,	0x27F,	%l1
	and	%g4,	%o1,	%i2
	call	loop_278
loop_277:
	fabss	%f27,	%f13
	fcmpgt32	%f18,	%f6,	%g6
	tgu	%xcc,	0x2
loop_278:
	std	%i0,	[%l7 + 0x40]
	addcc	%o0,	0x11FD,	%l5
	fmovrslz	%g1,	%f19,	%f27
	or	%o3,	%i4,	%g2
	call	loop_279
	nop
	setx	0xD9A34EB2EC1F815A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	umulcc	%i3,	0x0764,	%i1
	edge32	%i6,	%l3,	%o5
loop_279:
	bvs	%xcc,	loop_280
	edge16ln	%i7,	%o2,	%o7
	addccc	%o4,	0x124C,	%l4
	call	loop_281
loop_280:
	fmovrdgez	%o6,	%f8,	%f22
	array16	%l2,	%l6,	%g7
	movuge	%fcc0,	0x51F,	%g3
loop_281:
	ble,a	%icc,	loop_282
	call	loop_283
	mulx	%l0,	%g5,	%i5
	call	loop_284
loop_282:
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%g4
loop_283:
	call	loop_285
	call	loop_286
loop_284:
	fmovsvs	%icc,	%f25,	%f1
	be	%icc,	loop_287
loop_285:
	nop
	setx	0x07DB56A28B7845ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x868101F8CD152CB4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f20
loop_286:
	fble,a,pn	%fcc3,	loop_288
	fmovsne	%icc,	%f16,	%f19
loop_287:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movu	%fcc2,	%l1,	%o1
loop_288:
	fmovsleu	%icc,	%f22,	%f21
	alignaddr	%g6,	%i2,	%o0
	call	loop_289
	brgz,a,pn	%l5,	loop_290
	ba	%icc,	loop_291
	call	loop_292
loop_289:
	call	loop_293
loop_290:
	call	loop_294
loop_291:
	fmovdge	%icc,	%f10,	%f24
loop_292:
	movn	%fcc1,	0x13A,	%g1
loop_293:
	fmovdug	%fcc2,	%f4,	%f26
loop_294:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x17] %asi,	%i0
	edge16ln	%i4,	%o3,	%i3
	call	loop_295
	wrpr	%i1,	0x0662,	%pil
	addcc	%i6,	0x030E,	%g2
	fmovsn	%fcc3,	%f3,	%f23
loop_295:
	fmovdn	%icc,	%f0,	%f24
	call	loop_296
	nop
	set	0x16, %l5
	sth	%o5,	[%l7 + %l5]
	srlx	%i7,	0x0F,	%l3
	call	loop_297
loop_296:
	nop
	setx	0x08C3EB96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f2
	fnor	%f30,	%f22,	%f22
	fbue,pn	%fcc1,	loop_298
loop_297:
	call	loop_299
	fmovrdlz	%o2,	%f26,	%f2
	call	loop_300
loop_298:
	fmovsneg	%xcc,	%f10,	%f10
loop_299:
	rd	%tick_cmpr,	%o4
	fmovdne	%icc,	%f6,	%f22
loop_300:
	nop
	setx	0xB167D867,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xB8EA982F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f29,	%f13
	call	loop_301
	call	loop_302
	call	loop_303
	movue	%fcc3,	%l4,	%o7
loop_301:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_302:
	call	loop_304
loop_303:
	fnot2	%f20,	%f2
	call	loop_305
	call	loop_306
loop_304:
	call	loop_307
	call	loop_308
loop_305:
	movu	%fcc0,	0x496,	%l6
loop_306:
	fmovrdgez	%o6,	%f26,	%f0
loop_307:
	edge8	%g7,	%g3,	%l0
loop_308:
	call	loop_309
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpsub16	%f4,	%f0,	%f26
	nop
	setx	0x3FC3B930B1449547,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f16
loop_309:
	movvc	%xcc,	0x57A,	%i5
	call	loop_310
	call	loop_311
	movcs	%xcc,	0x49E,	%g4
	tge	%xcc,	0x4
loop_310:
	st	%f19,	[%l7 + 0x50]
loop_311:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC77, 	%hsys_tick_cmpr
	nop
	fitod	%f0,	%f8
	fdtoi	%f8,	%f26
	fmovsl	%fcc3,	%f11,	%f12
	fsrc2s	%f22,	%f14
	call	loop_312
	smul	%o1,	0x02B1,	%g6
	call	loop_313
	sir	0x1F90
loop_312:
	fcmps	%fcc2,	%f26,	%f25
	fmovse	%icc,	%f25,	%f12
loop_313:
	te	%icc,	0x6
	fnot1	%f18,	%f20
	call	loop_314
	call	loop_315
	call	loop_316
	call	loop_317
loop_314:
	fand	%f18,	%f4,	%f22
loop_315:
	movul	%fcc1,	0x423,	%i2
loop_316:
	call	loop_318
loop_317:
	call	loop_319
	nop
	setx	0x237EEF19,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xD16CCF98,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f1,	%f14
	fmul8x16al	%f17,	%f9,	%f30
loop_318:
	movg	%fcc2,	%l1,	%o0
loop_319:
	call	loop_320
	fbug,pn	%fcc2,	loop_321
	andn	%l5,	%g1,	%i0
	movge	%fcc1,	0x635,	%o3
loop_320:
	nop

loop_321:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 22
!	Type a   	: 25
!	Type x   	: 8
!	Type cti   	: 169
!	Type f   	: 146
!	Type i   	: 130
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
	set	0x7,	%g2
	set	0x0,	%g3
	set	0xB,	%g4
	set	0x6,	%g5
	set	0xB,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xF,	%i1
	set	-0x3,	%i2
	set	-0x2,	%i3
	set	-0x9,	%i4
	set	-0x5,	%i5
	set	-0x4,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x057B9A1A,	%l0
	set	0x6C34AD91,	%l1
	set	0x405C015A,	%l2
	set	0x436AB7ED,	%l3
	set	0x523E7A5C,	%l4
	set	0x65A3F7A4,	%l5
	set	0x1D3EE39F,	%l6
	!# Output registers
	set	0x0007,	%o0
	set	-0x0697,	%o1
	set	-0x108F,	%o2
	set	-0x1D7F,	%o3
	set	0x107B,	%o4
	set	0x1009,	%o5
	set	-0x1E96,	%o6
	set	-0x15C5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	call	loop_322
	or	%i3,	0x07D1,	%i4
	subccc	%i1,	%i6,	%o5
	movlg	%fcc1,	%g2,	%l3
loop_322:
	call	loop_323
	move	%fcc2,	%o2,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF2F, 	%hsys_tick_cmpr
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x45] %asi,	%l4
loop_323:
	fmovdne	%fcc1,	%f30,	%f12
	call	loop_324
	call	loop_325
	fabsd	%f14,	%f24
	movre	%l2,	%o6,	%g7
loop_324:
	nop
	setx	0x1EEB,	%l0,	%g3
	udiv	%l6,	%g3,	%i5
loop_325:
	edge8n	%g4,	%g5,	%l0
	call	loop_326
	nop
	fitos	%f5,	%f27
	fstox	%f27,	%f18
	fxtos	%f18,	%f20
	call	loop_327
	call	loop_328
loop_326:
	fmovrdne	%o1,	%f18,	%f10
	fbe,pt	%fcc0,	loop_329
loop_327:
	fbuge,a	%fcc1,	loop_330
loop_328:
	edge8	%g6,	%i2,	%o0
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f18
loop_329:
	bg,a,pn	%icc,	loop_331
loop_330:
	fxor	%f26,	%f4,	%f10
	call	loop_332
	call	loop_333
loop_331:
	fmovdvs	%xcc,	%f28,	%f20
	edge32ln	%l1,	%g1,	%i0
loop_332:
	fmovdo	%fcc2,	%f14,	%f12
loop_333:
	call	loop_334
	move	%icc,	0x134,	%l5
	call	loop_335
	call	loop_336
loop_334:
	andn	%i3,	%o3,	%i1
	fmovde	%icc,	%f20,	%f4
loop_335:
	movgu	%icc,	%i4,	%i6
loop_336:
	fmovse	%icc,	%f14,	%f10
	xnor	%g2,	0x0CFA,	%o5
	nop
	setx	0x3161EB1ACB423DE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x9EE7FC75AA717EAF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f2,	%f24
	fzeros	%f29
	tpos	%icc,	0x6
	taddcctv	%o2,	%l3,	%o4
	call	loop_337
	sub	%o7,	%l4,	%i7
	tneg	%xcc,	0x5
	nop
	fitos	%f0,	%f12
	fstod	%f12,	%f10
loop_337:
	rdhpr	%hsys_tick_cmpr,	%l2
	set	0x6C, %l3
	swapa	[%l7 + %l3] 0x89,	%o6
	fmul8ulx16	%f2,	%f0,	%f4
	call	loop_338
	nop
	setx	loop_339,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034200001402,	%l0,	%l1
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
	call	loop_340
	call	loop_341
loop_338:
	call	loop_342
loop_339:
	fones	%f19
loop_340:
	tsubcc	%l6,	%g7,	%i5
loop_341:
	movue	%fcc0,	%g4,	%g5
loop_342:
	ble,pn	%xcc,	loop_343
	mulx	%l0,	%g3,	%g6
	movule	%fcc0,	%o1,	%o0
	sra	%l1,	0x0B,	%i2
loop_343:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%l5
	call	loop_344
	nop
	setx	0x304E3D53,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xCE97B454,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f22,	%f6
	nop
	setx	0xF794EC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	smulcc	%g1,	0x150A,	%o3
loop_344:
	fmovdl	%fcc0,	%f4,	%f12
	call	loop_345
	edge32l	%i3,	%i4,	%i1
	tge	%icc,	0x0
	call	loop_346
loop_345:
	movvs	%xcc,	%g2,	%i6
	fmuld8ulx16	%f29,	%f30,	%f10
	fcmpeq32	%f2,	%f8,	%o2
loop_346:
	or	%l3,	0x09C5,	%o5
	call	loop_347
	mulscc	%o4,	0x18B2,	%l4
	call	loop_348
	array16	%i7,	%l2,	%o7
loop_347:
	mulx	%l6,	%g7,	%i5
	smul	%g4,	0x1699,	%g5
loop_348:
	wr	%o6,	0x0158,	%pic
	sdiv	%l0,	0x1093,	%g6
	call	loop_349
	call	loop_350
	movl	%icc,	%g3,	%o1
	wrpr	%o0,	%l1,	%tick
loop_349:
	mulx	%i0,	0x0EEB,	%i2
loop_350:
	tpos	%xcc,	0x4
	fcmple16	%f10,	%f22,	%l5
	call	loop_351
	call	loop_352
	call	loop_353
	call	loop_354
loop_351:
	call	loop_355
loop_352:
	fmovdpos	%xcc,	%f20,	%f12
loop_353:
	tn	%icc,	0x6
loop_354:
	taddcc	%g1,	%o3,	%i3
loop_355:
	call	loop_356
	fnegs	%f15,	%f3
	fmovrdlz	%i1,	%f12,	%f2
	tcc	%xcc,	0x5
loop_356:
	call	loop_357
	movge	%fcc1,	%g2,	%i6
	fmovdu	%fcc0,	%f20,	%f22
	call	loop_358
loop_357:
	edge32l	%o2,	%l3,	%i4
	movg	%icc,	0x699,	%o4
	movu	%fcc0,	%o5,	%l4
loop_358:
	sir	0x1104
	smul	%l2,	0x1D89,	%i7
	call	loop_359
	call	loop_360
	movrlez	%o7,	0x1F3,	%l6
	fpadd16s	%f9,	%f20,	%f18
loop_359:
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f31
loop_360:
	fandnot2s	%f19,	%f27,	%f12
	fsrc1s	%f13,	%f28
	alignaddr	%g7,	%i5,	%g5
	call	loop_361
	fxnor	%f0,	%f4,	%f2
	call	loop_362
	call	loop_363
loop_361:
	edge16ln	%o6,	%g4,	%g6
	edge8ln	%l0,	%o1,	%g3
loop_362:
	call	loop_364
loop_363:
	call	loop_365
	for	%f16,	%f20,	%f14
	movrlz	%l1,	0x252,	%i0
loop_364:
	call	loop_366
loop_365:
	fpsub16	%f14,	%f26,	%f30
	fpsub32s	%f22,	%f22,	%f16
	set	0x1C, %i6
	ldsha	[%l7 + %i6] 0x80,	%o0
loop_366:
	nop
	set	0x24, %l2
	sta	%f10,	[%l7 + %l2] 0x18
	ldsb	[%l7 + 0x52],	%i2
	call	loop_367
	call	loop_368
	call	loop_369
	movcc	%icc,	0x251,	%g1
loop_367:
	fnot2s	%f25,	%f7
loop_368:
	sllx	%o3,	%i3,	%l5
loop_369:
	ldstub	[%l7 + 0x73],	%i1
	sir	0x12E6
	xnorcc	%g2,	%o2,	%i6
	call	loop_370
	membar	0x7E
	fnegs	%f29,	%f24
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f26
loop_370:
	fpadd16s	%f29,	%f31,	%f23
	taddcctv	%i4,	%l3,	%o4
	call	loop_371
	or	%l4,	0x10A5,	%l2
	call	loop_372
	bn,pn	%icc,	loop_373
loop_371:
	fpack16	%f14,	%f26
	wr	%i7,	0x12D5,	%pic
loop_372:
	fzero	%f22
loop_373:
	fmovdug	%fcc2,	%f22,	%f24
	movcs	%icc,	0x3DD,	%o5
	fmovsue	%fcc0,	%f12,	%f23
	st	%f5,	[%l7 + 0x18]
	bn	%icc,	loop_374
	orn	%l6,	%o7,	%g7
	call	loop_375
	fsrc1	%f30,	%f10
loop_374:
	or	%g5,	0x04FC,	%o6
	movcs	%xcc,	%i5,	%g4
loop_375:
	movl	%fcc2,	0x4B1,	%g6
	bcs,pt	%icc,	loop_376
	call	loop_377
	movlg	%fcc2,	0x1A9,	%l0
	fmovscc	%xcc,	%f12,	%f18
loop_376:
	sllx	%o1,	%l1,	%i0
loop_377:
	udiv	%o0,	0x0B65,	%g3
	array32	%g1,	%o3,	%i2
	tsubcctv	%l5,	%i1,	%g2
	bmask	%o2,	%i3,	%i6
	call	loop_378
	alignaddr	%l3,	%o4,	%l4
	rdhpr	%hintp,	%l2
	movre	%i4,	0x1B6,	%i7
loop_378:
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f10
	fmovscc	%icc,	%f15,	%f29
	srlx	%o5,	0x14,	%l6
	tvc	%xcc,	0x4
	fmovrslz	%g7,	%f23,	%f25
	nop
	set	0x68, %o1
	prefetch	[%l7 + %o1],	 0
	fmovdn	%xcc,	%f8,	%f2
	call	loop_379
	fcmpne16	%f26,	%f12,	%g5
	call	loop_380
	fbl,a	%fcc2,	loop_381
loop_379:
	fand	%f22,	%f14,	%f6
	fmovdneg	%xcc,	%f26,	%f20
loop_380:
	fmovdl	%fcc0,	%f24,	%f16
loop_381:
	taddcc	%o6,	%o7,	%i5
	nop
	set	0x78, %i7
	stw	%g6,	[%l7 + %i7]
	fnand	%f18,	%f20,	%f0
	edge8n	%g4,	%o1,	%l1
	movle	%fcc2,	%i0,	%o0
	fmul8x16al	%f25,	%f23,	%f0
	fmovdle	%fcc1,	%f6,	%f20
	edge8	%g3,	%g1,	%l0
	fmovsne	%fcc0,	%f14,	%f6
	fmovdn	%icc,	%f2,	%f28
	edge16	%i2,	%l5,	%i1
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%g2
	fnot1s	%f4,	%f28
	call	loop_382
	fpsub16	%f0,	%f14,	%f2
	fcmple16	%f2,	%f14,	%o3
	nop
	setx	0xA3F8C2A58B9DAFAF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f2
loop_382:
	call	loop_383
	fmovrsgz	%o2,	%f25,	%f22
	fcmpd	%fcc0,	%f26,	%f6
	udiv	%i3,	0x1E14,	%i6
loop_383:
	bvs,pn	%xcc,	loop_384
	call	loop_385
	movl	%fcc0,	0x735,	%l3
	subccc	%o4,	%l2,	%i4
loop_384:
	tleu	%icc,	0x5
loop_385:
	call	loop_386
	movul	%fcc1,	0x248,	%l4
	tle	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 2
loop_386:
	call	loop_387
	movle	%xcc,	%l6,	%i7
	edge32ln	%g7,	%o6,	%g5
	call	loop_388
loop_387:
	srax	%o7,	0x11,	%g6
	alignaddr	%i5,	%o1,	%g4
	andcc	%i0,	0x07D5,	%o0
loop_388:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0C] %asi,	%l1
	call	loop_389
	fmovdgu	%icc,	%f10,	%f4
	fmovrdgez	%g3,	%f0,	%f8
	fnot2s	%f1,	%f25
loop_389:
	andn	%l0,	%i2,	%g1
	and	%l5,	0x17CB,	%i1
	tpos	%xcc,	0x7
	rd	%softint,	%g2
	fmovdneg	%xcc,	%f12,	%f6
	fcmple32	%f12,	%f10,	%o2
	addccc	%i3,	%o3,	%i6
	siam	0x5
	tsubcc	%o4,	%l2,	%l3
	movlg	%fcc3,	0x27D,	%i4
	fmovsu	%fcc0,	%f4,	%f16
	bgu,a	%icc,	loop_390
	fzeros	%f12
	call	loop_391
	sir	0x1205
loop_390:
	tne	%icc,	0x4
	movvc	%icc,	0x0DE,	%l4
loop_391:
	bpos,a,pt	%xcc,	loop_392
	fands	%f19,	%f5,	%f30
	bn,pt	%xcc,	loop_393
	tne	%icc,	0x0
loop_392:
	call	loop_394
	mulx	%o5,	0x0D30,	%i7
loop_393:
	call	loop_395
	fornot1s	%f25,	%f3,	%f17
loop_394:
	fcmped	%fcc1,	%f20,	%f6
	call	loop_396
loop_395:
	fandnot2	%f0,	%f22,	%f8
	call	loop_397
	nop
	set	0x2B, %i2
	ldub	[%l7 + %i2],	%g7
loop_396:
	call	loop_398
	call	loop_399
loop_397:
	fxor	%f14,	%f28,	%f12
	brgz,a	%o6,	loop_400
loop_398:
	call	loop_401
loop_399:
	membar	0x31
	movne	%fcc0,	0x26A,	%l6
loop_400:
	nop
	fitos	%f13,	%f3
	fstox	%f3,	%f24
loop_401:
	call	loop_402
	call	loop_403
	tsubcctv	%o7,	0x18FE,	%g5
	fandnot1	%f24,	%f24,	%f6
loop_402:
	fands	%f12,	%f26,	%f30
loop_403:
	nop
	set	0x0C, %o5
	lda	[%l7 + %o5] 0x81,	%f4
	nop
	setx	loop_404,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x5
	fble,pt	%fcc0,	loop_405
	call	loop_406
loop_404:
	call	loop_407
	fmovsleu	%xcc,	%f2,	%f13
loop_405:
	add	%g6,	0x00F5,	%i5
loop_406:
	fmovdo	%fcc2,	%f2,	%f4
loop_407:
	fmovde	%xcc,	%f6,	%f8
	edge32	%g4,	%o1,	%i0
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f12
	fpadd16	%f24,	%f30,	%f20
	call	loop_408
	movuge	%fcc2,	0x20A,	%o0
	call	loop_409
	call	loop_410
loop_408:
	fpsub32	%f20,	%f18,	%f18
	fones	%f5
loop_409:
	call	loop_411
loop_410:
	tcc	%xcc,	0x1
	fmovrsgez	%g3,	%f10,	%f7
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%l0
loop_411:
	call	loop_412
	fmovrsne	%i2,	%f22,	%f30
	call	loop_413
	fbuge,pn	%fcc2,	loop_414
loop_412:
	call	loop_415
	fpsub32s	%f22,	%f20,	%f17
loop_413:
	array16	%g1,	%l0,	%i1
loop_414:
	movre	%g2,	0x2BE,	%o2
loop_415:
	tcs	%icc,	0x6
	andcc	%l5,	0x107F,	%o3
	fcmpd	%fcc2,	%f6,	%f26
	fmovscc	%icc,	%f25,	%f27
	call	loop_416
	edge32	%i3,	%i6,	%o4
	call	loop_417
	orn	%l3,	0x0CAD,	%l2
loop_416:
	fpackfix	%f30,	%f26
	st	%f18,	[%l7 + 0x28]
loop_417:
	call	loop_418
	fmul8ulx16	%f0,	%f6,	%f20
	call	loop_419
	fbg,a	%fcc0,	loop_420
loop_418:
	udivcc	%l4,	0x1F45,	%i4
	nop
	setx loop_421, %l0, %l1
	jmpl %l1, %i7
loop_419:
	fbe,a	%fcc1,	loop_422
loop_420:
	call	loop_423
	fmovsne	%xcc,	%f17,	%f5
loop_421:
	alignaddr	%o5,	%g7,	%l6
loop_422:
	subcc	%o6,	0x0F4C,	%g5
loop_423:
	fmovscs	%xcc,	%f20,	%f4
	fnot2s	%f9,	%f3
	call	loop_424
	bcc,a	%icc,	loop_425
	fmovdlg	%fcc1,	%f8,	%f18
	call	loop_426
loop_424:
	brnz	%o7,	loop_427
loop_425:
	movl	%xcc,	0x09F,	%g6
	call	loop_428
loop_426:
	call	loop_429
loop_427:
	fpadd32s	%f22,	%f17,	%f7
	fpadd16s	%f4,	%f24,	%f26
loop_428:
	xnorcc	%i5,	%g4,	%o1
loop_429:
	fmovde	%xcc,	%f16,	%f16
	fpackfix	%f10,	%f3
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%i0
	orncc	%o0,	0x0503,	%g3
	fmovdlg	%fcc0,	%f2,	%f10
	fones	%f11
	call	loop_430
	fmovde	%fcc3,	%f22,	%f2
	be,pn	%xcc,	loop_431
	or	%i2,	%g1,	%l0
loop_430:
	call	loop_432
	fpadd16	%f22,	%f24,	%f26
loop_431:
	fmovdg	%xcc,	%f8,	%f26
	movrne	%l1,	%i1,	%o2
loop_432:
	membar	0x4C
	call	loop_433
	mova	%xcc,	0x6C5,	%g2
	nop
	setx	0x988174F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xAA86838A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f13,	%f14
	taddcc	%l5,	0x00CB,	%i3
loop_433:
	fmovdue	%fcc3,	%f4,	%f20
	lduh	[%l7 + 0x60],	%o3
	fba,a	%fcc0,	loop_434
	wr	%o4,	0x158F,	%softint
	call	loop_435
	wrpr	%i6,	0x1DD7,	%cwp
loop_434:
	movrlez	%l3,	0x346,	%l4
	fmovdu	%fcc0,	%f18,	%f10
loop_435:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x0C] %asi,	%i4
	call	loop_436
	movl	%fcc0,	0x4AD,	%l2
	call	loop_437
	nop
	set	0x7C, %o6
	stw	%i7,	[%l7 + %o6]
loop_436:
	addccc	%o5,	0x0782,	%g7
	popc	%o6,	%g5
loop_437:
	edge16l	%o7,	%l6,	%g6
	rdpr	%cleanwin,	%g4
	xnorcc	%o1,	0x0EF4,	%i0
	call	loop_438
	tleu	%xcc,	0x6
	nop
	set	0x4E, %g3
	sth	%i5,	[%l7 + %g3]
	brgz,a,pn	%o0,	loop_439
loop_438:
	call	loop_440
	call	loop_441
	call	loop_442
loop_439:
	call	loop_443
loop_440:
	call	loop_444
loop_441:
	mulscc	%i2,	0x1DC6,	%g1
loop_442:
	xnorcc	%g3,	0x19F2,	%l1
loop_443:
	call	loop_445
loop_444:
	array32	%l0,	%o2,	%g2
	srl	%i1,	0x12,	%l5
	orcc	%i3,	0x19CF,	%o3
loop_445:
	movule	%fcc0,	0x0A3,	%o4
	fabsd	%f20,	%f10
	nop
	fitos	%f3,	%f23
	fstox	%f23,	%f26
	edge32l	%i6,	%l4,	%i4
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f14
	stbar
	srl	%l3,	%i7,	%l2
	fmovsule	%fcc1,	%f25,	%f18
	call	loop_446
	fpadd16s	%f13,	%f31,	%f14
	fcmpes	%fcc1,	%f29,	%f0
	call	loop_447
loop_446:
	sir	0x1215
	fcmped	%fcc3,	%f2,	%f24
	set	0x10, %o0
	lda	[%l7 + %o0] 0x89,	%f31
loop_447:
	call	loop_448
	call	loop_449
	fpadd16	%f8,	%f26,	%f16
	call	loop_450
loop_448:
	nop
	setx	0x4A90DA28A193A586,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x61D70C88DFFB375A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f18
loop_449:
	call	loop_451
	call	loop_452
loop_450:
	fpsub32s	%f28,	%f10,	%f0
	fmovsneg	%icc,	%f31,	%f12
loop_451:
	movue	%fcc1,	0x647,	%g7
loop_452:
	call	loop_453
	nop
	setx	0x4A992C6E6D772300,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3C3408809DC5B3CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f26,	%f2
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o5
loop_453:
	call	loop_454
	movlg	%fcc3,	%g5,	%o7
	call	loop_455
	call	loop_456
loop_454:
	tcs	%icc,	0x3
	call	loop_457
loop_455:
	nop
	setx	0x092D,	%l0,	%l6
	sdivx	%o6,	%l6,	%g6
loop_456:
	fnegs	%f4,	%f8
	fmovdlg	%fcc3,	%f10,	%f28
loop_457:
	call	loop_458
	fbg,a,pt	%fcc1,	loop_459
	call	loop_460
	brgz,pt	%o1,	loop_461
loop_458:
	fxnors	%f17,	%f1,	%f14
loop_459:
	call	loop_462
loop_460:
	call	loop_463
loop_461:
	fpsub16s	%f31,	%f10,	%f8
	fornot1s	%f21,	%f30,	%f4
loop_462:
	call	loop_464
loop_463:
	wr	%g4,	%i5,	%ccr
	call	loop_465
	fmovrslz	%i0,	%f1,	%f31
loop_464:
	fandnot2	%f26,	%f6,	%f26
	alignaddrl	%i2,	%g1,	%o0
loop_465:
	fnands	%f11,	%f17,	%f23
	call	loop_466
	fabsd	%f8,	%f12
	fmovrslez	%g3,	%f4,	%f20
	nop
	fitos	%f19,	%f11
loop_466:
	nop
	setx	0x1975B77004F323A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x28805446DE4D1EF7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f14,	%f20
	fmovdue	%fcc0,	%f4,	%f28
	call	loop_467
	fmovsne	%fcc3,	%f14,	%f4
	call	loop_468
	orcc	%l0,	0x1751,	%l1
loop_467:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x08] %asi,	%f24
loop_468:
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f16
	fxtos	%f16,	%f0
	fand	%f26,	%f26,	%f2
	fandnot2s	%f2,	%f19,	%f17
	wr	%o2,	%i1,	%sys_tick
	rdpr	%canrestore,	%l5
	fmovdcc	%xcc,	%f16,	%f26
	sth	%i3,	[%l7 + 0x42]
	movge	%fcc3,	%g2,	%o3
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x80,	 1
	fbge,pn	%fcc2,	loop_469
	call	loop_470
	movu	%fcc0,	%i6,	%l4
	fmovrsne	%l3,	%f30,	%f23
loop_469:
	nop
	fitos	%f12,	%f7
	fstox	%f7,	%f14
	fxtos	%f14,	%f11
loop_470:
	call	loop_471
	array8	%i4,	%l2,	%g7
	call	loop_472
	smulcc	%i7,	%o5,	%g5
loop_471:
	fornot2s	%f15,	%f1,	%f8
	call	loop_473
loop_472:
	call	loop_474
	nop
	fitos	%f8,	%f14
	fstoi	%f14,	%f24
	call	loop_475
loop_473:
	fpsub32	%f26,	%f6,	%f6
loop_474:
	nop

loop_475:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 29
!	Type a   	: 13
!	Type x   	: 13
!	Type cti   	: 154
!	Type f   	: 142
!	Type i   	: 149
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
	set	0xD,	%g1
	set	0x2,	%g2
	set	0xA,	%g3
	set	0xF,	%g4
	set	0xD,	%g5
	set	0xB,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xF,	%i1
	set	-0x3,	%i2
	set	-0x9,	%i3
	set	-0x7,	%i4
	set	-0x8,	%i5
	set	-0x6,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x4DBB5E02,	%l0
	set	0x19FF0668,	%l1
	set	0x1F4CC0F7,	%l2
	set	0x5EEB46C5,	%l3
	set	0x0F525384,	%l4
	set	0x38AB4FAD,	%l5
	set	0x21175AE8,	%l6
	!# Output registers
	set	0x18EC,	%o0
	set	-0x0768,	%o1
	set	-0x018E,	%o2
	set	0x0AC5,	%o3
	set	-0x0CD2,	%o4
	set	0x0FB0,	%o5
	set	0x1C96,	%o6
	set	0x18A8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	fmul8x16	%f0,	%f12,	%f16
	fmovdleu	%icc,	%f16,	%f26
	call	loop_476
	fmovdcc	%xcc,	%f2,	%f26
	addccc	%o7,	0x1BDD,	%l6
	call	loop_477
loop_476:
	call	loop_478
	xorcc	%o6,	%g6,	%g4
	call	loop_479
loop_477:
	call	loop_480
loop_478:
	call	loop_481
	fandnot1	%f28,	%f26,	%f20
loop_479:
	fmovdue	%fcc1,	%f20,	%f20
loop_480:
	nop
	set	0x18, %i1
	std	%f22,	[%l7 + %i1]
loop_481:
	bvs	%icc,	loop_482
	call	loop_483
	call	loop_484
	mulx	%i5,	0x0DA2,	%o1
loop_482:
	siam	0x4
loop_483:
	rdhpr	%htba,	%i2
loop_484:
	nop
	setx	0xCB02A7CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xEF57920F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f30,	%f21
	movug	%fcc2,	0x200,	%i0
	ble,a	%xcc,	loop_485
	rd	%softint,	%o0
	move	%fcc0,	0x0D1,	%g3
	fnands	%f13,	%f2,	%f26
loop_485:
	fcmped	%fcc1,	%f30,	%f30
	call	loop_486
	xorcc	%g1,	%l0,	%o2
	call	loop_487
	call	loop_488
loop_486:
	call	loop_489
	nop
	fitos	%f12,	%f31
	fstox	%f31,	%f28
loop_487:
	call	loop_490
loop_488:
	array16	%l1,	%i1,	%l5
loop_489:
	bgu,a	%xcc,	loop_491
	fmovrsgez	%g2,	%f22,	%f0
loop_490:
	xnorcc	%i3,	0x0984,	%o4
	fmovde	%xcc,	%f14,	%f28
loop_491:
	call	loop_492
	fmovs	%f5,	%f9
	faligndata	%f24,	%f18,	%f18
	tvs	%icc,	0x5
loop_492:
	movleu	%xcc,	%o3,	%l4
	lduw	[%l7 + 0x34],	%i6
	fnegs	%f19,	%f15
	sllx	%l3,	0x1C,	%l2
	nop
	setx	0x535B2495C79F6FF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xB7C7C12F85734C07,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f14,	%f2
	srlx	%g7,	0x1B,	%i7
	movul	%fcc1,	%i4,	%o5
	srl	%o7,	%g5,	%o6
	fsrc2	%f0,	%f12
	srl	%l6,	%g6,	%i5
	fmovrsgez	%g4,	%f26,	%f26
	nop
	setx	0x6917DDC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x8FD0B8DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f16,	%f7
	wrpr	%o1,	0x15C3,	%pil
	call	loop_493
	movgu	%xcc,	%i0,	%o0
	call	loop_494
	call	loop_495
loop_493:
	call	loop_496
	addccc	%g3,	%g1,	%i2
loop_494:
	call	loop_497
loop_495:
	swap	[%l7 + 0x6C],	%o2
loop_496:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x68] %asi,	%f28
loop_497:
	call	loop_498
	fmovsul	%fcc2,	%f26,	%f6
	call	loop_499
	fpsub16s	%f7,	%f21,	%f23
loop_498:
	rdhpr	%hsys_tick_cmpr,	%l0
	array8	%l1,	%i1,	%g2
loop_499:
	rd	%fprs,	%i3
	call	loop_500
	call	loop_501
	brnz,a	%o4,	loop_502
	tvs	%xcc,	0x2
loop_500:
	andncc	%o3,	%l4,	%i6
loop_501:
	fmovdge	%fcc1,	%f6,	%f26
loop_502:
	call	loop_503
	rdhpr	%htba,	%l5
	movlg	%fcc1,	0x200,	%l2
	call	loop_504
loop_503:
	add	%g7,	0x1E18,	%l3
	fmovsule	%fcc1,	%f10,	%f20
	fornot1	%f30,	%f10,	%f18
loop_504:
	call	loop_505
	call	loop_506
	call	loop_507
	fones	%f31
loop_505:
	wr	%i4,	%i7,	%y
loop_506:
	call	loop_508
loop_507:
	wr	%o7,	0x06F7,	%set_softint
	sub	%g5,	0x06E2,	%o6
	sir	0x116F
loop_508:
	call	loop_509
	bpos,pn	%xcc,	loop_510
	stbar
	sdivcc	%o5,	0x0524,	%g6
loop_509:
	tneg	%icc,	0x1
loop_510:
	nop
	fitos	%f8,	%f7
	fstod	%f7,	%f22
	edge8ln	%l6,	%g4,	%i5
	fmovsule	%fcc1,	%f6,	%f21
	fmovd	%f4,	%f20
	fmovdcs	%icc,	%f12,	%f0
	fmovrdgez	%i0,	%f18,	%f4
	fcmpd	%fcc0,	%f6,	%f0
	set	0x44, %l0
	ldsha	[%l7 + %l0] 0x80,	%o0
	bn,a	%xcc,	loop_511
	tvc	%xcc,	0x1
	umul	%o1,	%g3,	%i2
	call	loop_512
loop_511:
	call	loop_513
	rdhpr	%hintp,	%g1
	array32	%l0,	%l1,	%o2
loop_512:
	fmovdvs	%xcc,	%f4,	%f14
loop_513:
	fmovdge	%fcc2,	%f2,	%f2
	call	loop_514
	rdhpr	%htba,	%i1
	sdivcc	%g2,	0x0302,	%i3
	movrgez	%o3,	0x391,	%l4
loop_514:
	fmovrsne	%o4,	%f24,	%f22
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xdb
	fbul,a	%fcc2,	loop_515
	subccc	%l5,	%i6,	%l2
	edge32ln	%l3,	%i4,	%g7
	call	loop_516
loop_515:
	call	loop_517
	fsrc2s	%f24,	%f17
	fnors	%f29,	%f12,	%f6
loop_516:
	call	loop_518
loop_517:
	call	loop_519
	call	loop_520
	movrne	%i7,	%g5,	%o7
loop_518:
	fzero	%f6
loop_519:
	edge8n	%o6,	%o5,	%g6
loop_520:
	stb	%l6,	[%l7 + 0x15]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xABD, 	%sys_tick_cmpr
	fmovrslez	%i5,	%f16,	%f2
	movue	%fcc1,	0x036,	%i0
	fpsub32s	%f0,	%f4,	%f29
	call	loop_521
	taddcc	%o0,	%o1,	%g3
	membar	0x29
	fnors	%f17,	%f6,	%f18
loop_521:
	fandnot2s	%f6,	%f4,	%f8
	call	loop_522
	tcs	%icc,	0x6
	call	loop_523
	movrlez	%i2,	%g1,	%l0
loop_522:
	wr	%o2,	%l1,	%clear_softint
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f24
loop_523:
	movcc	%icc,	%g2,	%i1
	fpackfix	%f4,	%f5
	andcc	%o3,	0x0212,	%i3
	tn	%xcc,	0x0
	call	loop_524
	stw	%o4,	[%l7 + 0x24]
	fbn,a	%fcc1,	loop_525
	movne	%xcc,	0x1E6,	%l5
loop_524:
	array32	%i6,	%l4,	%l2
	fmovdn	%fcc3,	%f26,	%f14
loop_525:
	call	loop_526
	fnot2	%f16,	%f30
	nop
	fitos	%f5,	%f8
	fstod	%f8,	%f12
	call	loop_527
loop_526:
	call	loop_528
	call	loop_529
	taddcc	%l3,	0x0E1A,	%i4
loop_527:
	movne	%fcc0,	0x588,	%g7
loop_528:
	fcmpeq32	%f14,	%f6,	%i7
loop_529:
	movo	%fcc0,	%g5,	%o6
	set	0x20, %g2
	stxa	%o5,	[%l7 + %g2] 0x0c
	wr 	%g0, 	0x6, 	%fprs
	call	loop_530
	call	loop_531
	ldub	[%l7 + 0x60],	%l6
	call	loop_532
loop_530:
	fcmpgt16	%f20,	%f20,	%i5
loop_531:
	call	loop_533
	fmovdge	%fcc2,	%f8,	%f30
loop_532:
	fmovsneg	%xcc,	%f0,	%f27
	movo	%fcc1,	0x592,	%i0
loop_533:
	call	loop_534
	call	loop_535
	call	loop_536
	call	loop_537
loop_534:
	bcc,pn	%icc,	loop_538
loop_535:
	fmovd	%f28,	%f4
loop_536:
	rdpr	%cwp,	%g4
loop_537:
	bmask	%o1,	%g3,	%o0
loop_538:
	edge32	%g1,	%l0,	%o2
	fpadd16	%f30,	%f14,	%f26
	tcc	%icc,	0x2
	fsrc1	%f6,	%f8
	tge	%xcc,	0x5
	subccc	%i2,	%l1,	%i1
	addccc	%o3,	0x19E2,	%g2
	add	%i3,	%l5,	%i6
	sll	%o4,	%l2,	%l4
	bge	%icc,	loop_539
	nop
	setx	0xC6BA0165,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xAE01BF28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f13,	%f11
	call	loop_540
	wrpr 	%g0, 	0x1, 	%gl
loop_539:
	call	loop_541
	call	loop_542
loop_540:
	fnot1s	%f27,	%f7
	fcmple32	%f26,	%f28,	%i7
loop_541:
	call	loop_543
loop_542:
	call	loop_544
	call	loop_545
	fcmpgt32	%f4,	%f24,	%l3
loop_543:
	subc	%g5,	%o6,	%o5
loop_544:
	subcc	%o7,	0x1CCF,	%g6
loop_545:
	tcs	%xcc,	0x2
	fabss	%f0,	%f28
	fnor	%f16,	%f22,	%f2
	fnands	%f20,	%f21,	%f25
	brgez	%i5,	loop_546
	fmul8ulx16	%f18,	%f22,	%f10
	fsrc2	%f16,	%f18
	fmovdue	%fcc3,	%f18,	%f20
loop_546:
	rdpr	%tl,	%i0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	fitos	%f11,	%f29
	srax	%l6,	%g4,	%g3
	call	loop_547
	fnands	%f20,	%f24,	%f2
	fornot2	%f8,	%f14,	%f30
	nop
	fitos	%f3,	%f27
	fstoi	%f27,	%f11
loop_547:
	call	loop_548
	subc	%o1,	%o0,	%l0
	tvc	%xcc,	0x2
	wrpr	%o2,	%g1,	%tick
loop_548:
	fmovsug	%fcc2,	%f3,	%f0
	tg	%xcc,	0x1
	tsubcc	%i2,	%l1,	%i1
	fnot2s	%f1,	%f21
	subcc	%g2,	%o3,	%l5
	fbo,a	%fcc3,	loop_549
	movvs	%xcc,	0x269,	%i3
	nop
	setx	0xFA2A35845F2ADE5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD8704DACC0EEBFA8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f6
	lduw	[%l7 + 0x64],	%o4
loop_549:
	nop
	setx	0xDECFBE52,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xD4FAFE2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f1,	%f31
	te	%xcc,	0x7
	alignaddrl	%i6,	%l4,	%l2
	tle	%xcc,	0x1
	call	loop_550
	fmovsn	%xcc,	%f11,	%f0
	call	loop_551
	fornot2s	%f17,	%f19,	%f13
loop_550:
	call	loop_552
	andn	%i4,	%i7,	%g7
loop_551:
	xnor	%l3,	%o6,	%o5
	fpsub16	%f18,	%f10,	%f2
loop_552:
	edge32l	%o7,	%g6,	%i5
	nop
	setx	0x6E129087,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f0
	wrpr	%g5,	%i0,	%cwp
	call	loop_553
	fmovrde	%g4,	%f10,	%f16
	siam	0x2
	call	loop_554
loop_553:
	fmul8ulx16	%f28,	%f10,	%f26
	fmovsleu	%icc,	%f6,	%f27
	fors	%f3,	%f20,	%f24
loop_554:
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f4
	call	loop_555
	call	loop_556
	movuge	%fcc3,	0x252,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x3E8, 	%hsys_tick_cmpr
loop_555:
	ble,a	%xcc,	loop_557
loop_556:
	edge16	%l0,	%l6,	%g1
	array16	%i2,	%o2,	%l1
	mova	%fcc2,	%i1,	%o3
loop_557:
	fcmpes	%fcc1,	%f13,	%f0
	fpadd16s	%f18,	%f17,	%f18
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%l4
	popc	%i3,	%g2
	fmovsg	%fcc0,	%f12,	%f10
	movrne	%o4,	%i6,	%l2
	flushw
	call	loop_558
	array16	%l4,	%i7,	%g7
	popc	0x0B62,	%i4
	movule	%fcc3,	%o6,	%o5
loop_558:
	andcc	%l3,	%g6,	%o7
	or	%i5,	%i0,	%g5
	call	loop_559
	call	loop_560
	alignaddrl	%g3,	%o1,	%o0
	call	loop_561
loop_559:
	pdist	%f24,	%f2,	%f10
loop_560:
	call	loop_562
	call	loop_563
loop_561:
	tpos	%xcc,	0x3
	tsubcc	%l0,	0x0767,	%g4
loop_562:
	wr	%l6,	%g1,	%y
loop_563:
	fmovsgu	%icc,	%f24,	%f14
	fpackfix	%f0,	%f10
	fbug,a	%fcc2,	loop_564
	call	loop_565
	nop
	setx	0x8A15D30A4AB10837,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4EF106F3B78BD661,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f22,	%f18
	rd	%fprs,	%o2
loop_564:
	fxnor	%f18,	%f10,	%f10
loop_565:
	umulcc	%l1,	%i1,	%o3
	fmovda	%xcc,	%f24,	%f24
	nop
	setx	0x096B,	%l0,	%i3
	udiv	%i2,	%i3,	%g2
	nop
	setx	0x0C207E780F5CE14B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE6CBF0F587EC176C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f2,	%f12
	movleu	%icc,	%o4,	%i6
	call	loop_566
	addc	%l5,	0x1B80,	%l2
	call	loop_567
	fbul,pn	%fcc0,	loop_568
loop_566:
	call	loop_569
	wr	%l4,	0x0110,	%pic
loop_567:
	fnot2	%f6,	%f22
loop_568:
	wrpr	%i7,	0x1A66,	%pil
loop_569:
	fornot1s	%f18,	%f17,	%f29
	call	loop_570
	fmovsvs	%xcc,	%f6,	%f21
	fbe,pn	%fcc2,	loop_571
	wrpr	%i4,	0x1CB4,	%tick
loop_570:
	bge	%icc,	loop_572
	wrpr	%g7,	0x0A46,	%tick
loop_571:
	fmul8x16au	%f9,	%f24,	%f4
	fmovsvc	%xcc,	%f10,	%f25
loop_572:
	edge32	%o6,	%o5,	%g6
	fmovdul	%fcc2,	%f10,	%f10
	movvc	%xcc,	0x1BE,	%l3
	nop
	fitod	%f2,	%f18
	fdtos	%f18,	%f31
	call	loop_573
	call	loop_574
	ta	%xcc,	0x4
	fcmpes	%fcc2,	%f15,	%f20
loop_573:
	fpsub32s	%f25,	%f26,	%f11
loop_574:
	call	loop_575
	rdhpr	%hintp,	%i5
	movo	%fcc0,	0x31E,	%i0
	fmul8sux16	%f4,	%f24,	%f18
loop_575:
	ld	[%l7 + 0x10],	%f2
	fpsub16s	%f31,	%f1,	%f31
	smul	%o7,	0x10FD,	%g3
	fmovsleu	%icc,	%f31,	%f6
	fmul8sux16	%f20,	%f20,	%f12
	movug	%fcc1,	0x047,	%o1
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f20
	movl	%fcc0,	0x3FB,	%g5
	movo	%fcc2,	0x6F2,	%l0
	fone	%f28
	tleu	%icc,	0x7
	ldsw	[%l7 + 0x58],	%o0
	rdhpr	%hpstate,	%g4
	call	loop_576
	fmovsle	%xcc,	%f10,	%f5
	add	%l6,	%g1,	%o2
	fmovdneg	%icc,	%f18,	%f0
loop_576:
	wrpr	%i1,	%l1,	%cwp
	movue	%fcc3,	0x5D0,	%o3
	sra	%i2,	%g2,	%i3
	call	loop_577
	nop
	setx	0x064D,	%l0,	%l5
	sdivcc	%o4,	%l5,	%i6
	call	loop_578
	nop
	setx	0xA88FA717E800F4FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE1161C2F067D3DF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f0,	%f28
loop_577:
	fandnot1s	%f6,	%f0,	%f13
	fpadd32	%f14,	%f12,	%f18
loop_578:
	fnand	%f8,	%f2,	%f8
	addcc	%l4,	%l2,	%i7
	call	loop_579
	call	loop_580
	fmul8x16au	%f23,	%f7,	%f18
	call	loop_581
loop_579:
	fmovdue	%fcc0,	%f22,	%f24
loop_580:
	fpackfix	%f26,	%f14
	tgu	%xcc,	0x1
loop_581:
	addc	%g7,	0x1F17,	%o6
	fmovdl	%fcc2,	%f12,	%f28
	call	loop_582
	nop
	fitod	%f16,	%f28
	brlez,a,pn	%o5,	loop_583
	fnot1s	%f23,	%f30
loop_582:
	fmovdule	%fcc3,	%f8,	%f30
	faligndata	%f2,	%f6,	%f4
loop_583:
	call	loop_584
	call	loop_585
	srlx	%i4,	0x1B,	%g6
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f2
loop_584:
	tleu	%xcc,	0x7
loop_585:
	call	loop_586
	andncc	%l3,	0x1067,	%i0
	fzeros	%f7
	call	loop_587
loop_586:
	fmovsleu	%xcc,	%f4,	%f23
	fmovdgu	%icc,	%f0,	%f0
	rd	%pc,	%i5
loop_587:
	call	loop_588
	fmovsne	%icc,	%f28,	%f5
	fmovsge	%fcc0,	%f1,	%f26
	fnot1s	%f1,	%f29
loop_588:
	fmovrsne	%g3,	%f16,	%f7
	fmovsul	%fcc3,	%f5,	%f0
	umul	%o1,	%o7,	%l0
	nop
	setx	0xA5DEABA9515E8B8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCDB151E16A1A7891,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f28,	%f20
	ba,a	%icc,	loop_589
	fmul8x16	%f6,	%f12,	%f10
	fmovrdlez	%g5,	%f14,	%f10
	call	loop_590
loop_589:
	siam	0x6
	nop
	setx	0x8E44283CCBAD8715,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fandnot1	%f14,	%f6,	%f12
loop_590:
	call	loop_591
	call	loop_592
	call	loop_593
	call	loop_594
loop_591:
	movrgz	%g4,	%o0,	%l6
loop_592:
	fnors	%f19,	%f5,	%f9
loop_593:
	call	loop_595
loop_594:
	rdpr	%pil,	%g1
	call	loop_596
	call	loop_597
loop_595:
	xnor	%o2,	0x1C61,	%l1
	rd	%ccr,	%o3
loop_596:
	tgu	%xcc,	0x6
loop_597:
	tsubcc	%i2,	%g2,	%i3
	fcmpd	%fcc3,	%f24,	%f8
	fabss	%f9,	%f25
	wrpr	%i1,	0x1559,	%pil
	fpsub16s	%f19,	%f22,	%f23
	call	loop_598
	movre	%o4,	0x25E,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x796, 	%sys_tick_cmpr
	array32	%l2,	%i7,	%g7
loop_598:
	fxnors	%f13,	%f9,	%f31
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x60] %asi,	%o5
	fmovdule	%fcc0,	%f18,	%f10
	nop
	setx	0x342FC178,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f31
	fnot1s	%f18,	%f0
	udivcc	%o6,	0x19FE,	%g6
	edge8n	%l3,	%i0,	%i5
	fmovdn	%fcc0,	%f10,	%f2
	movpos	%icc,	0x579,	%g3
	call	loop_599
	addcc	%i4,	0x0743,	%o1
	fcmps	%fcc2,	%f22,	%f21
	fands	%f14,	%f14,	%f3
loop_599:
	tsubcc	%o7,	%g5,	%g4
	call	loop_600
	movl	%fcc3,	%o0,	%l0
	tn	%icc,	0x4
	fnors	%f16,	%f16,	%f21
loop_600:
	nop
	setx	0x1202,	%l0,	%o2
	sdivcc	%g1,	%o2,	%l1
	nop
	setx	0xADF5E51B5858A4E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x7EECEADA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f28,	%f10
	nop
	setx	0xEE12CB52,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xC231FB46,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f7,	%f5
	fmovrde	%l6,	%f28,	%f16
	call	loop_601
	fandnot1	%f10,	%f6,	%f26
	movcc	%icc,	%i2,	%g2
	nop
	fitod	%f10,	%f2
	fdtoi	%f2,	%f23
loop_601:
	fcmpd	%fcc2,	%f22,	%f2
	orncc	%o3,	%i3,	%o4
	fbge	%fcc3,	loop_602
	fmuld8sux16	%f4,	%f21,	%f4
	ldsh	[%l7 + 0x6E],	%i1
	call	loop_603
loop_602:
	rd	%sys_tick_cmpr,	%l5
	fcmpd	%fcc3,	%f30,	%f0
	tneg	%icc,	0x3
loop_603:
	call	loop_604
	tvc	%icc,	0x7
	call	loop_605
	wrpr	%i6,	0x18C3,	%cwp
loop_604:
	bl,a,pn	%xcc,	loop_606
	nop
	setx	0x0A15,	%l0,	%i7
	udivcc	%l4,	%i7,	%l2
loop_605:
	call	loop_607
	edge32l	%g7,	%o6,	%o5
loop_606:
	call	loop_608
	fpack32	%f8,	%f30,	%f24
loop_607:
	call	loop_609
	movrgz	%g6,	0x10A,	%l3
loop_608:
	fmovsgu	%xcc,	%f31,	%f16
	brgz,pt	%i5,	loop_610
loop_609:
	orncc	%i0,	%i4,	%o1
	fornot1s	%f1,	%f11,	%f28
	nop
	setx	0x1B47,	%l0,	%o7
	sdivx	%g3,	%o7,	%g5
loop_610:
	taddcc	%o0,	0x0A75,	%g4
	fsrc1s	%f19,	%f8
	set	0x16, %g1
	ldstuba	[%l7 + %g1] 0x10,	%l0
	fand	%f30,	%f22,	%f20
	fbu	%fcc1,	loop_611
	call	loop_612
	fmovse	%xcc,	%f20,	%f0
	nop
	fitos	%f3,	%f25
	fstoi	%f25,	%f22
loop_611:
	call	loop_613
loop_612:
	fnand	%f2,	%f18,	%f20
	call	loop_614
	call	loop_615
loop_613:
	nop

loop_614:
	nop

loop_615:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 20
!	Type a   	: 35
!	Type x   	: 6
!	Type cti   	: 140
!	Type f   	: 161
!	Type i   	: 138
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
	set	0x4,	%g2
	set	0x2,	%g3
	set	0xD,	%g4
	set	0xF,	%g5
	set	0x5,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xE,	%i1
	set	-0x8,	%i2
	set	-0x9,	%i3
	set	-0x6,	%i4
	set	-0x9,	%i5
	set	-0x2,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x2F031965,	%l0
	set	0x5962FCAD,	%l1
	set	0x14DD9390,	%l2
	set	0x744198D3,	%l3
	set	0x4730AC8E,	%l4
	set	0x0A52F68F,	%l5
	set	0x696CA5B1,	%l6
	!# Output registers
	set	0x00C1,	%o0
	set	0x0ECF,	%o1
	set	0x1D31,	%o2
	set	-0x1696,	%o3
	set	0x042D,	%o4
	set	-0x0E86,	%o5
	set	0x16A0,	%o6
	set	0x19D6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	movg	%xcc,	0x6F1,	%g1
	call	loop_616
	alignaddr	%l1,	%l6,	%i2
	fnot1	%f8,	%f8
	call	loop_617
loop_616:
	orncc	%g2,	%o2,	%i3
	fpadd32	%f28,	%f4,	%f24
	call	loop_618
loop_617:
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f3
	wr 	%g0, 	0x6, 	%fprs
	tcs	%icc,	0x6
loop_618:
	umulcc	%o3,	0x0AD7,	%l5
	call	loop_619
	andcc	%i6,	%l4,	%i7
	edge16n	%l2,	%i1,	%o6
	fmovsu	%fcc1,	%f20,	%f22
loop_619:
	call	loop_620
	fornot1	%f30,	%f8,	%f28
	sir	0x0896
	call	loop_621
loop_620:
	fmovs	%f18,	%f0
	subcc	%o5,	0x168C,	%g6
	call	loop_622
loop_621:
	fmovsule	%fcc3,	%f6,	%f22
	call	loop_623
	wr	%l3,	0x1C10,	%sys_tick
loop_622:
	nop
	setx	0xAB13A50EFB002D3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f2
	fbug,a	%fcc2,	loop_624
loop_623:
	stbar
	call	loop_625
	bcs,pt	%xcc,	loop_626
loop_624:
	wr	%g7,	0x01A0,	%pic
	call	loop_627
loop_625:
	nop
	setx	0x0E80,	%l0,	%i0
	udivx	%i5,	%i0,	%o1
loop_626:
	call	loop_628
	rdhpr	%hsys_tick_cmpr,	%i4
loop_627:
	fmovsuge	%fcc3,	%f3,	%f22
	tsubcc	%g3,	0x0B4D,	%g5
loop_628:
	call	loop_629
	call	loop_630
	fcmpne16	%f2,	%f0,	%o7
	sir	0x1AC5
loop_629:
	call	loop_631
loop_630:
	edge32n	%o0,	%l0,	%g4
	xnor	%g1,	0x01F6,	%l6
	fmovdule	%fcc1,	%f0,	%f6
loop_631:
	call	loop_632
	fmovslg	%fcc1,	%f14,	%f24
	nop
	setx	0x193064745A2BD090,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x9DFC828D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f16,	%f30
	tsubcctv	%i2,	%g2,	%l1
loop_632:
	array8	%i3,	%o2,	%o3
	fmovdue	%fcc2,	%f16,	%f16
	rd	%tick_cmpr,	%l5
	bgu,a	%xcc,	loop_633
	call	loop_634
	tvc	%icc,	0x0
	mulscc	%i6,	0x0784,	%o4
loop_633:
	std	%f0,	[%l7 + 0x40]
loop_634:
	siam	0x0
	call	loop_635
	fornot2s	%f16,	%f4,	%f4
	call	loop_636
	fabsd	%f20,	%f16
loop_635:
	fmovspos	%xcc,	%f26,	%f24
	rdpr	%cansave,	%l4
loop_636:
	edge8n	%l2,	%i7,	%o6
	wr	%o5,	%i1,	%y
	nop
	setx	0xD3A2F741F983EE7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xAA4A45699FD5A4FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f18,	%f20
	wr	%g0,	0x81,	%asi
	stwa	%g6,	[%l7 + 0x64] %asi
	andncc	%l3,	0x06CC,	%g7
	fmovrsgz	%i0,	%f4,	%f1
	fmul8sux16	%f18,	%f30,	%f20
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x19,	%o0
	movul	%fcc2,	%i5,	%i4
	fpack16	%f22,	%f9
	fnor	%f12,	%f16,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movule	%fcc3,	0x4AA,	%g3
	movl	%fcc0,	0x7D8,	%o7
	ble,pn	%xcc,	loop_637
	popc	%o0,	%g4
	fmovdl	%fcc1,	%f20,	%f12
	ldd	[%l7 + 0x28],	%f14
loop_637:
	call	loop_638
	call	loop_639
	wrpr	%l0,	%g1,	%tick
	bl,pt	%xcc,	loop_640
loop_638:
	call	loop_641
loop_639:
	fmovdle	%icc,	%f24,	%f24
	fmovdvs	%icc,	%f20,	%f6
loop_640:
	movle	%fcc1,	%l6,	%g2
loop_641:
	nop
	set	0x10, %g4
	stb	%i2,	[%l7 + %g4]
	tpos	%xcc,	0x4
	movre	%l1,	%i3,	%o2
	call	loop_642
	smul	%o3,	%l5,	%i6
	fones	%f13
	call	loop_643
loop_642:
	movul	%fcc1,	%l4,	%o4
	rd	%fprs,	%i7
	fcmpne32	%f24,	%f24,	%o6
loop_643:
	orn	%l2,	0x0B0B,	%o5
	bshuffle	%f8,	%f26,	%f30
	edge32l	%i1,	%g6,	%g7
	popc	%l3,	%i0
	fmovdo	%fcc1,	%f24,	%f24
	call	loop_644
	call	loop_645
	movl	%xcc,	0x68E,	%o1
	call	loop_646
loop_644:
	call	loop_647
loop_645:
	stbar
	bne,pt	%icc,	loop_648
loop_646:
	fmovrdgz	%i5,	%f28,	%f28
loop_647:
	call	loop_649
	move	%icc,	0x394,	%i4
loop_648:
	movvc	%xcc,	%g3,	%g5
	fxor	%f8,	%f18,	%f8
loop_649:
	movpos	%xcc,	0x655,	%o7
	movrlez	%g4,	0x319,	%o0
	fpadd16	%f20,	%f12,	%f26
	nop
	setx	0x048C,	%l0,	%l6
	sdivx	%g1,	%l6,	%g2
	wrpr	%l0,	0x19D6,	%tick
	fmovsue	%fcc0,	%f11,	%f4
	sll	%l1,	%i3,	%o2
	movvc	%icc,	%i2,	%l5
	call	loop_650
	nop
	setx	0xCDDD01D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tne	%icc,	0x2
	call	loop_651
loop_650:
	be,a	%xcc,	loop_652
	fbo	%fcc2,	loop_653
	ba,a,pt	%xcc,	loop_654
loop_651:
	wr	%i6,	%l4,	%y
loop_652:
	subccc	%o3,	0x1E37,	%o4
loop_653:
	rdhpr	%ver,	%i7
loop_654:
	rdhpr	%htba,	%o6
	umulcc	%l2,	0x040E,	%o5
	orcc	%i1,	%g7,	%l3
	ldub	[%l7 + 0x5E],	%i0
	call	loop_655
	call	loop_656
	alignaddr	%o1,	%i5,	%g6
	fpack32	%f22,	%f12,	%f14
loop_655:
	call	loop_657
loop_656:
	nop
	set	0x26, %o3
	lduh	[%l7 + %o3],	%g3
	rd	%pc,	%g5
	call	loop_658
loop_657:
	srl	%o7,	0x0F,	%g4
	fmovsa	%fcc2,	%f0,	%f21
	nop
	setx loop_659, %l0, %l1
	jmpl %l1, %o0
loop_658:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_660
	call	loop_661
loop_659:
	rdhpr	%hsys_tick_cmpr,	%i4
	ldstub	[%l7 + 0x23],	%g1
loop_660:
	fmovs	%f5,	%f1
loop_661:
	wrpr	%g2,	%l6,	%cwp
	fxnors	%f31,	%f21,	%f23
	fxors	%f16,	%f23,	%f11
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x39] %asi,	%l1
	fnor	%f2,	%f12,	%f22
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_662
	rd	%asi,	%i3
	call	loop_663
	call	loop_664
loop_662:
	alignaddr	%l0,	%i2,	%l5
	fmovdcs	%xcc,	%f8,	%f24
loop_663:
	call	loop_665
loop_664:
	fmovdg	%icc,	%f14,	%f30
	call	loop_666
	fors	%f21,	%f22,	%f19
loop_665:
	fzeros	%f26
	call	loop_667
loop_666:
	fmovrsne	%i6,	%f24,	%f9
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	alignaddrl	%o2,	%l4,	%o3
loop_667:
	sir	0x0DF2
	fmovdle	%fcc2,	%f30,	%f8
	pdist	%f4,	%f28,	%f24
	call	loop_668
	nop
	setx	0x7EAD79A3EFE09C1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmul8sux16	%f14,	%f20,	%f28
	alignaddrl	%o4,	%i7,	%l2
loop_668:
	nop
	set	0x34, %l4
	ldsha	[%l7 + %l4] 0x81,	%o5
	bmask	%o6,	%g7,	%i1
	tne	%icc,	0x0
	call	loop_669
	fcmpes	%fcc0,	%f27,	%f3
	call	loop_670
	edge8	%l3,	%i0,	%i5
loop_669:
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f8
	movrlez	%o1,	0x344,	%g6
loop_670:
	nop
	set	0x24, %g5
	lda	[%l7 + %g5] 0x81,	%f2
	edge8l	%g3,	%g5,	%o7
	brlez	%o0,	loop_671
	fmovdl	%xcc,	%f24,	%f4
	nop
	setx	0x7068B769AE4ED5DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x6064C59F1D127142,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f30,	%f28
	bvc,a	%icc,	loop_672
loop_671:
	sir	0x1964
	fmovsge	%fcc3,	%f25,	%f18
	array8	%g4,	%g1,	%i4
loop_672:
	bshuffle	%f18,	%f26,	%f4
	fbu,a,pt	%fcc1,	loop_673
	movue	%fcc2,	0x08B,	%l6
	fmovrdlez	%g2,	%f10,	%f24
	wr	%i3,	%l0,	%ccr
loop_673:
	call	loop_674
	orncc	%l1,	0x144B,	%i2
	stw	%i6,	[%l7 + 0x38]
	tle	%icc,	0x0
loop_674:
	array32	%o2,	%l4,	%l5
	fabsd	%f0,	%f14
	call	loop_675
	call	loop_676
	fmovdne	%xcc,	%f22,	%f0
	edge16l	%o3,	%i7,	%o4
loop_675:
	call	loop_677
loop_676:
	fbg,a	%fcc1,	loop_678
	call	loop_679
	call	loop_680
loop_677:
	fmovsne	%icc,	%f20,	%f25
loop_678:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_679:
	nop
	setx	0xCF48C48837F8A1BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f12
loop_680:
	tneg	%icc,	0x1
	call	loop_681
	call	loop_682
	call	loop_683
	tl	%icc,	0x0
loop_681:
	call	loop_684
loop_682:
	call	loop_685
loop_683:
	tvs	%icc,	0x7
	fsrc1	%f8,	%f12
loop_684:
	fsrc2s	%f26,	%f19
loop_685:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x18] %asi,	%f28
	call	loop_686
	fpack16	%f8,	%f9
	call	loop_687
	for	%f28,	%f20,	%f14
loop_686:
	alignaddrl	%l2,	%o5,	%o6
	brnz,a,pt	%g7,	loop_688
loop_687:
	fmovdleu	%xcc,	%f6,	%f22
	call	loop_689
	call	loop_690
loop_688:
	fmovdo	%fcc0,	%f16,	%f10
	fpack16	%f22,	%f9
loop_689:
	tsubcc	%l3,	%i1,	%i5
loop_690:
	nop
	fitod	%f27,	%f10
	fmovdpos	%icc,	%f4,	%f28
	movvc	%icc,	%o1,	%g6
	mova	%fcc3,	0x138,	%i0
	fcmps	%fcc0,	%f19,	%f0
	call	loop_691
	call	loop_692
	call	loop_693
	fandnot1s	%f6,	%f17,	%f30
loop_691:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCD, 	%hsys_tick_cmpr
loop_692:
	edge16ln	%o7,	%g3,	%g4
loop_693:
	call	loop_694
	edge16	%g1,	%o0,	%l6
	orncc	%i4,	0x03AC,	%g2
	fmovdn	%fcc0,	%f2,	%f14
loop_694:
	lduh	[%l7 + 0x62],	%l0
	rdpr	%wstate,	%l1
	tg	%xcc,	0x0
	pdist	%f26,	%f18,	%f14
	call	loop_695
	mulx	%i2,	0x0928,	%i3
	fbge	%fcc2,	loop_696
	fmovrde	%o2,	%f6,	%f16
loop_695:
	andncc	%l4,	%l5,	%o3
	nop
	setx	0xE78463BF7F904090,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x7BEC369D31EC6DAC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f24,	%f12
loop_696:
	ldub	[%l7 + 0x0E],	%i7
	ld	[%l7 + 0x30],	%f15
	fmovdneg	%xcc,	%f6,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_697
	bleu,pt	%icc,	loop_698
	bpos,pn	%xcc,	loop_699
	nop
	set	0x72, %g7
	ldstub	[%l7 + %g7],	%o5
loop_697:
	call	loop_700
loop_698:
	rd	%asi,	%o6
loop_699:
	call	loop_701
	fmovsg	%xcc,	%f0,	%f14
loop_700:
	fmovdule	%fcc2,	%f0,	%f20
	fcmpgt32	%f26,	%f24,	%g7
loop_701:
	call	loop_702
	nop
	fitos	%f12,	%f29
	fstox	%f29,	%f26
	fxtos	%f26,	%f23
	fmul8sux16	%f14,	%f2,	%f2
	faligndata	%f20,	%f0,	%f4
loop_702:
	fmovdgu	%icc,	%f28,	%f26
	fmovsle	%fcc2,	%f27,	%f6
	edge16n	%l3,	%i1,	%l2
	addc	%i5,	0x0233,	%g6
	call	loop_703
	fexpand	%f30,	%f22
	wrpr	%o1,	0x05B6,	%cwp
	bn	%icc,	loop_704
loop_703:
	edge32l	%g5,	%o7,	%i0
	fmovde	%fcc0,	%f20,	%f6
	faligndata	%f10,	%f22,	%f22
loop_704:
	rd	%ccr,	%g3
	call	loop_705
	call	loop_706
	fmovsleu	%xcc,	%f0,	%f23
	call	loop_707
loop_705:
	fmovdneg	%icc,	%f26,	%f16
loop_706:
	call	loop_708
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_707:
	fmovdle	%xcc,	%f20,	%f24
	faligndata	%f4,	%f22,	%f22
loop_708:
	tsubcctv	%g4,	0x0B7E,	%g1
	movcc	%icc,	%l6,	%o0
	wr	%i4,	%l0,	%ccr
	rd	%asi,	%g2
	orn	%i2,	%i3,	%l1
	nop
	setx	loop_709,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022100001401,	%l0,	%l1
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
	call	loop_710
	movrlez	%o2,	0x062,	%l4
	fbn,a	%fcc1,	loop_711
loop_709:
	call	loop_712
loop_710:
	taddcc	%o3,	%i7,	%i6
	call	loop_713
loop_711:
	movrlez	%o4,	%l5,	%o6
loop_712:
	movcs	%xcc,	0x5BB,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_713:
	call	loop_714
	call	loop_715
	call	loop_716
	fpadd16	%f0,	%f26,	%f20
loop_714:
	array32	%l2,	%o5,	%i5
loop_715:
	fnand	%f22,	%f14,	%f20
loop_716:
	smulcc	%g6,	0x053A,	%g5
	set	0x20, %i3
	stxa	%o1,	[%g0 + %i3] 0x4f
	nop
	set	0x53, %l5
	ldsb	[%l7 + %l5],	%o7
	rdpr	%cansave,	%g3
	fbge,a,pt	%fcc0,	loop_717
	fcmpeq32	%f8,	%f28,	%g4
	call	loop_718
	fmovrslez	%g1,	%f17,	%f28
loop_717:
	tgu	%xcc,	0x7
	movre	%i0,	0x071,	%o0
loop_718:
	fmovdlg	%fcc3,	%f22,	%f22
	fsrc2s	%f0,	%f9
	call	loop_719
	fbne,pn	%fcc3,	loop_720
	call	loop_721
	call	loop_722
loop_719:
	sll	%i4,	0x00,	%l6
loop_720:
	call	loop_723
loop_721:
	fmovsge	%fcc2,	%f1,	%f4
loop_722:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%l0
loop_723:
	bne	%xcc,	loop_724
	rd	%softint,	%i2
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f26
	fxtod	%f26,	%f4
	call	loop_725
loop_724:
	nop
	fitos	%f12,	%f19
	fstox	%f19,	%f8
	bcs	%xcc,	loop_726
	fmovspos	%xcc,	%f16,	%f4
loop_725:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15D, 	%hsys_tick_cmpr
	wr	%g0,	0xda,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_726:
	fmovdcs	%icc,	%f2,	%f14
	call	loop_727
	call	loop_728
	fxor	%f6,	%f10,	%f30
	call	loop_729
loop_727:
	taddcctv	%l1,	%i3,	%o2
loop_728:
	nop
	setx	0x0F34,	%l0,	%o3
	udivcc	%l4,	%o3,	%i7
	nop
	setx	0x76D68F97,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
loop_729:
	call	loop_730
	fzero	%f2
	fmovde	%xcc,	%f30,	%f10
	fone	%f8
loop_730:
	edge32ln	%o4,	%i6,	%l5
	bgu,a,pt	%xcc,	loop_731
	siam	0x1
	tneg	%icc,	0x6
	fexpand	%f2,	%f14
loop_731:
	fexpand	%f26,	%f22
	call	loop_732
	sllx	%o6,	%g7,	%i1
	fmovdg	%fcc3,	%f6,	%f10
	srlx	%l3,	0x1A,	%l2
loop_732:
	fpack32	%f14,	%f26,	%f8
	movrne	%i5,	0x123,	%g6
	fcmpgt16	%f6,	%f12,	%o5
	fxnors	%f23,	%f28,	%f6
	call	loop_733
	call	loop_734
	sethi	0x0C31,	%o1
	wrpr	%o7,	%g3,	%pil
loop_733:
	fmovso	%fcc2,	%f9,	%f17
loop_734:
	call	loop_735
	movneg	%icc,	%g5,	%g4
	nop
	setx	0x0F0D,	%l0,	%o0
	sdiv	%i0,	%o0,	%i4
	tvs	%xcc,	0x1
loop_735:
	nop
	setx	0x1510,	%l0,	%l6
	udivx	%g1,	%l6,	%l0
	call	loop_736
	array8	%g2,	%i2,	%l1
	call	loop_737
	fbn	%fcc3,	loop_738
loop_736:
	fblg,a	%fcc2,	loop_739
	fsrc2	%f0,	%f8
loop_737:
	fpadd32s	%f28,	%f30,	%f1
loop_738:
	fmovsle	%fcc3,	%f0,	%f28
loop_739:
	fbne,a,pt	%fcc2,	loop_740
	fmovscs	%icc,	%f23,	%f14
	nop
	setx	0x3691C6849BE4B33E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f8
	call	loop_741
loop_740:
	st	%f26,	[%l7 + 0x24]
	tcs	%icc,	0x1
	fpadd16	%f14,	%f20,	%f28
loop_741:
	fmul8x16al	%f24,	%f13,	%f18
	call	loop_742
	edge32	%o2,	%i3,	%o3
	call	loop_743
	call	loop_744
loop_742:
	rdhpr	%hintp,	%l4
	srlx	%i7,	0x16,	%i6
loop_743:
	edge16l	%l5,	%o4,	%g7
loop_744:
	fmovdo	%fcc2,	%f10,	%f30
	bleu,a,pn	%xcc,	loop_745
	call	loop_746
	fbn,pt	%fcc3,	loop_747
	fmul8x16au	%f4,	%f8,	%f0
loop_745:
	nop
	setx	0xA84747463FA2AA0B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3D4283F46F77916F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f24,	%f12
loop_746:
	call	loop_748
loop_747:
	fmul8x16	%f24,	%f16,	%f20
	fmovsge	%fcc0,	%f1,	%f22
	wr	%o6,	0x0ADB,	%y
loop_748:
	call	loop_749
	fbne,pt	%fcc1,	loop_750
	fmovso	%fcc3,	%f20,	%f16
	fxnor	%f8,	%f20,	%f4
loop_749:
	taddcc	%l3,	%l2,	%i5
loop_750:
	movuge	%fcc0,	0x1E8,	%g6
	fone	%f6
	xnorcc	%i1,	%o1,	%o7
	fbe,a	%fcc0,	loop_751
	fcmpne32	%f2,	%f24,	%g3
	tgu	%xcc,	0x6
	sra	%o5,	0x18,	%g5
loop_751:
	fmovdge	%xcc,	%f10,	%f30
	addc	%g4,	0x0BE1,	%i0
	pdist	%f0,	%f2,	%f22
	call	loop_752
	fpsub32	%f6,	%f24,	%f18
	umulcc	%o0,	0x0E65,	%g1
	fandnot1	%f12,	%f6,	%f16
loop_752:
	rd	%y,	%l6
	fmovspos	%xcc,	%f28,	%f31
	srax	%l0,	0x1F,	%g2
	tsubcctv	%i4,	0x0D6B,	%l1
	call	loop_753
	smulcc	%o2,	0x0EBC,	%i3
	call	loop_754
	fpadd16s	%f1,	%f24,	%f22
loop_753:
	fcmpeq32	%f2,	%f12,	%o3
	call	loop_755
loop_754:
	call	loop_756
	call	loop_757
	movn	%fcc3,	%i2,	%l4
loop_755:
	stb	%i6,	[%l7 + 0x2D]
loop_756:
	nop
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x11,	%l4
loop_757:
	fexpand	%f4,	%f12
	array32	%o4,	%i7,	%o6
	call	loop_758
	fbule	%fcc1,	loop_759
	fcmpeq16	%f26,	%f4,	%l3
	bne,a	%xcc,	loop_760
loop_758:
	mova	%fcc3,	0x581,	%g7
loop_759:
	bl,a	%xcc,	loop_761
	call	loop_762
loop_760:
	srl	%l2,	%i5,	%g6
	call	loop_763
loop_761:
	call	loop_764
loop_762:
	movneg	%xcc,	%i1,	%o1
	fmovsl	%icc,	%f25,	%f7
loop_763:
	fmovdpos	%xcc,	%f0,	%f4
loop_764:
	movue	%fcc2,	0x6AF,	%o7
	call	loop_765
	fmovdge	%fcc3,	%f18,	%f30
	movle	%fcc0,	0x5F6,	%g3
	movcc	%xcc,	0x0C8,	%g5
loop_765:
	call	loop_766
	call	loop_767
	fmovsne	%icc,	%f20,	%f10
	fabsd	%f28,	%f30
loop_766:
	nop

loop_767:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 30
!	Type a   	: 35
!	Type x   	: 11
!	Type cti   	: 152
!	Type f   	: 143
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
	set	0x6,	%g1
	set	0xA,	%g2
	set	0x9,	%g3
	set	0xE,	%g4
	set	0x9,	%g5
	set	0x8,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x0,	%i1
	set	-0x6,	%i2
	set	-0x0,	%i3
	set	-0x6,	%i4
	set	-0x9,	%i5
	set	-0x4,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x7FE9618B,	%l0
	set	0x0965FC04,	%l1
	set	0x4C4F7608,	%l2
	set	0x6BFE28E8,	%l3
	set	0x7319F4CF,	%l4
	set	0x55ADA4C2,	%l5
	set	0x37B93DFC,	%l6
	!# Output registers
	set	0x0390,	%o0
	set	0x16AE,	%o1
	set	-0x0D53,	%o2
	set	-0x0628,	%o3
	set	-0x1338,	%o4
	set	-0x08DA,	%o5
	set	-0x030C,	%o6
	set	-0x15DA,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	ta	%xcc,	0x1
	call	loop_768
	fcmpgt16	%f22,	%f2,	%g4
	edge8	%i0,	%o0,	%g1
	sdiv	%l6,	0x044F,	%o5
loop_768:
	fabss	%f20,	%f1
	fmovscs	%xcc,	%f18,	%f21
	call	loop_769
	fmovdo	%fcc2,	%f20,	%f24
	movrlez	%g2,	0x16A,	%l0
	tpos	%icc,	0x1
loop_769:
	wrpr	%i4,	0x08F5,	%tick
	movlg	%fcc0,	%l1,	%o2
	call	loop_770
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f4
	fxtod	%f4,	%f16
	orn	%i3,	0x08FC,	%i2
	fmovsg	%fcc0,	%f22,	%f10
loop_770:
	call	loop_771
	tcs	%icc,	0x5
	fnot1s	%f15,	%f12
	call	loop_772
loop_771:
	fmovsuge	%fcc2,	%f0,	%f14
	call	loop_773
	fpackfix	%f22,	%f5
loop_772:
	nop
	setx	0x0BEF,	%l0,	%i6
	udiv	%l4,	%i6,	%o3
	bl,pn	%icc,	loop_774
loop_773:
	call	loop_775
	brgz	%l5,	loop_776
	call	loop_777
loop_774:
	fpadd16	%f2,	%f10,	%f2
loop_775:
	wrpr 	%g0, 	0x2, 	%gl
loop_776:
	fzero	%f14
loop_777:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x50] %asi,	%o6
	edge16l	%l3,	%g7,	%l2
	fmovrsgez	%i5,	%f13,	%f11
	fmovdne	%fcc1,	%f10,	%f26
	fmovsne	%icc,	%f21,	%f29
	call	loop_778
	movleu	%icc,	0x7F3,	%i7
	movge	%fcc3,	%g6,	%o1
	fcmpeq32	%f26,	%f4,	%i1
loop_778:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f4
	fxtod	%f4,	%f30
	fornot1	%f24,	%f0,	%f12
	nop
	setx	loop_779,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032200001404,	%l0,	%l1
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
	brnz,a,pn	%g3,	loop_780
	movul	%fcc2,	0x284,	%g5
	call	loop_781
loop_779:
	fzero	%f18
loop_780:
	fmovdug	%fcc3,	%f0,	%f12
	fcmped	%fcc0,	%f20,	%f16
loop_781:
	fmovdn	%icc,	%f28,	%f2
	call	loop_782
	call	loop_783
	fcmpne32	%f12,	%f24,	%g4
	rdpr	%otherwin,	%o7
loop_782:
	call	loop_784
loop_783:
	movule	%fcc2,	0x39B,	%i0
	xnor	%g1,	%l6,	%o5
	fmovsa	%fcc2,	%f18,	%f31
loop_784:
	sll	%g2,	0x0B,	%o0
	movrgz	%i4,	0x3A0,	%l0
	movg	%fcc0,	%o2,	%i3
	rd	%y,	%i2
	subc	%l4,	0x0220,	%l1
	call	loop_785
	andcc	%i6,	0x131A,	%l5
	call	loop_786
	fmovd	%f26,	%f20
loop_785:
	call	loop_787
	wrpr 	%g0, 	0x2, 	%gl
loop_786:
	fpadd16s	%f15,	%f12,	%f25
	edge16	%o3,	%o6,	%g7
loop_787:
	fmovsgu	%icc,	%f17,	%f31
	movuge	%fcc1,	%l3,	%i5
	movo	%fcc1,	%l2,	%g6
	nop
	setx	0x6E9B3D35ADCD250E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA640DE1EE2790B37,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f28
	call	loop_788
	tge	%icc,	0x3
	call	loop_789
	rdpr	%pil,	%o1
loop_788:
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f31
	andcc	%i7,	0x129D,	%i1
loop_789:
	rdhpr	%hintp,	%g5
	fand	%f16,	%f0,	%f0
	call	loop_790
	call	loop_791
	fcmped	%fcc0,	%f24,	%f22
	fmovrdne	%g3,	%f12,	%f28
loop_790:
	fmovsul	%fcc3,	%f13,	%f18
loop_791:
	call	loop_792
	fmovdcc	%icc,	%f14,	%f18
	call	loop_793
	fcmpgt16	%f30,	%f12,	%o7
loop_792:
	fmovde	%fcc2,	%f4,	%f16
	udiv	%i0,	0x1824,	%g1
loop_793:
	fmovsa	%fcc1,	%f23,	%f0
	fnegd	%f26,	%f24
	call	loop_794
	call	loop_795
	call	loop_796
	smul	%l6,	%g4,	%g2
loop_794:
	call	loop_797
loop_795:
	rdhpr	%hsys_tick_cmpr,	%o5
loop_796:
	call	loop_798
	call	loop_799
loop_797:
	call	loop_800
	fmul8ulx16	%f6,	%f0,	%f22
loop_798:
	fcmpne32	%f6,	%f0,	%o0
loop_799:
	tg	%icc,	0x7
loop_800:
	call	loop_801
	fba,pt	%fcc2,	loop_802
	movneg	%icc,	0x5EF,	%i4
	movcc	%icc,	0x680,	%o2
loop_801:
	fnot2s	%f5,	%f2
loop_802:
	call	loop_803
	call	loop_804
	fmovrsgz	%l0,	%f24,	%f11
	call	loop_805
loop_803:
	fnors	%f30,	%f28,	%f10
loop_804:
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%i2
	srl	%i3,	%l1,	%l4
loop_805:
	fornot2s	%f21,	%f11,	%f5
	call	loop_806
	wr	%l5,	%i6,	%pic
	fbl	%fcc2,	loop_807
	fpsub32s	%f14,	%f10,	%f19
loop_806:
	rdhpr	%hpstate,	%o4
	fmuld8sux16	%f30,	%f2,	%f10
loop_807:
	fmovrsgez	%o3,	%f10,	%f23
	array8	%g7,	%l3,	%o6
	call	loop_808
	nop
	setx	0x1A29,	%l0,	%l2
	sdivcc	%i5,	%l2,	%g6
	fmovd	%f28,	%f30
	fmovdlg	%fcc2,	%f20,	%f18
loop_808:
	call	loop_809
	call	loop_810
	rdpr	%cwp,	%o1
	fxnor	%f4,	%f28,	%f14
loop_809:
	call	loop_811
loop_810:
	fxnors	%f18,	%f12,	%f17
	fcmple16	%f10,	%f14,	%i7
	call	loop_812
loop_811:
	tleu	%icc,	0x4
	call	loop_813
	rdpr	%cleanwin,	%g5
loop_812:
	fabsd	%f30,	%f24
	call	loop_814
loop_813:
	nop
	setx	0x8556D7A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xB2DDCD30,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f28,	%f27
	call	loop_815
	call	loop_816
loop_814:
	brlez,a,pt	%g3,	loop_817
	ldsb	[%l7 + 0x73],	%o7
loop_815:
	call	loop_818
loop_816:
	subcc	%i0,	0x134E,	%g1
loop_817:
	nop
	setx	loop_819,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x014400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_820
loop_818:
	nop
	setx	0xF7CEC0B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f30
	fmovduge	%fcc3,	%f28,	%f20
loop_819:
	call	loop_821
loop_820:
	nop
	fitos	%f0,	%f1
	fstox	%f1,	%f0
	fxtos	%f0,	%f26
	movrlez	%l6,	%g4,	%g2
	call	loop_822
loop_821:
	srlx	%o5,	%i1,	%o0
	nop
	set	0x08, %l2
	ldstub	[%l7 + %l2],	%o2
	call	loop_823
loop_822:
	call	loop_824
	call	loop_825
	subccc	%l0,	%i2,	%i3
loop_823:
	taddcc	%i4,	0x1A86,	%l1
loop_824:
	or	%l4,	0x13B4,	%i6
loop_825:
	nop
	setx	0x66E4469B68B4A8DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x8213C657FF6F3192,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f4,	%f12
	be,a	%xcc,	loop_826
	fzero	%f24
	movn	%xcc,	0x437,	%o4
	rd	%asi,	%l5
loop_826:
	andcc	%g7,	%l3,	%o3
	call	loop_827
	fpadd32s	%f14,	%f0,	%f29
	tcs	%icc,	0x7
	rdpr	%gl,	%o6
loop_827:
	call	loop_828
	call	loop_829
	nop
	setx	0x83FC8CA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xF555499B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f18,	%f14
	tpos	%icc,	0x0
loop_828:
	andcc	%l2,	%g6,	%o1
loop_829:
	nop
	fitod	%f0,	%f30
	fdtoi	%f30,	%f6
	sdivcc	%i7,	0x144C,	%g5
	call	loop_830
	wr	%i5,	0x1E74,	%clear_softint
	call	loop_831
	call	loop_832
loop_830:
	movneg	%icc,	0x2D7,	%g3
	tvc	%icc,	0x1
loop_831:
	movle	%xcc,	%i0,	%o7
loop_832:
	fnegd	%f8,	%f24
	movcs	%xcc,	0x2A3,	%g1
	fpsub16s	%f29,	%f7,	%f25
	fmovduge	%fcc2,	%f10,	%f20
	subccc	%l6,	0x17DC,	%g2
	fpackfix	%f2,	%f12
	movcs	%xcc,	0x2D5,	%o5
	fmovdle	%fcc2,	%f8,	%f26
	fble,a	%fcc3,	loop_833
	call	loop_834
	subc	%i1,	%o0,	%g4
	call	loop_835
loop_833:
	call	loop_836
loop_834:
	edge32ln	%l0,	%i2,	%o2
	umulcc	%i3,	0x14B7,	%l1
loop_835:
	movneg	%icc,	0x2FC,	%i4
loop_836:
	fmovrsgez	%l4,	%f19,	%f7
	call	loop_837
	movg	%fcc2,	%o4,	%l5
	rdpr	%cwp,	%g7
	movrgez	%i6,	%l3,	%o3
loop_837:
	call	loop_838
	rd	%tick_cmpr,	%o6
	fpsub16	%f0,	%f2,	%f12
	smulcc	%g6,	0x1939,	%o1
loop_838:
	nop
	setx	0xC8CA0038752412CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f0
	fnot1	%f0,	%f0
	smulcc	%i7,	0x0A83,	%g5
	call	loop_839
	fmovdge	%xcc,	%f0,	%f2
	fcmpgt32	%f2,	%f10,	%l2
	fmovd	%f2,	%f16
loop_839:
	call	loop_840
	fmovrdlez	%i5,	%f18,	%f12
	call	loop_841
	movle	%fcc3,	%i0,	%g3
loop_840:
	fmovso	%fcc0,	%f27,	%f31
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_841:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x34] %asi,	%o7
	add	%l6,	0x1305,	%g1
	srl	%g2,	%o5,	%o0
	fabss	%f15,	%f29
	srax	%i1,	0x12,	%l0
	taddcc	%i2,	%g4,	%o2
	call	loop_842
	call	loop_843
	ble,a	%xcc,	loop_844
	membar	0x10
loop_842:
	call	loop_845
loop_843:
	call	loop_846
loop_844:
	rdpr	%tba,	%l1
	addcc	%i4,	%l4,	%o4
loop_845:
	edge8n	%l5,	%g7,	%i3
loop_846:
	fnot1s	%f22,	%f28
	nop
	setx	0xC8193CAB24DA82B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x0F46542E2FBD3D40,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f18,	%f4
	call	loop_847
	fmovduge	%fcc2,	%f26,	%f10
	set	0x30, %o1
	ldxa	[%l7 + %o1] 0x19,	%i6
loop_847:
	rd	%ccr,	%o3
	std	%f4,	[%l7 + 0x40]
	bpos,pt	%xcc,	loop_848
	tn	%xcc,	0x3
	sethi	0x1B44,	%l3
	fmovrsgez	%g6,	%f28,	%f4
loop_848:
	call	loop_849
	edge32n	%o1,	%i7,	%g5
	call	loop_850
	bshuffle	%f14,	%f18,	%f28
loop_849:
	edge8	%l2,	%o6,	%i5
	wr	%i0,	%g3,	%pic
loop_850:
	fnands	%f5,	%f16,	%f25
	call	loop_851
	fmovda	%fcc3,	%f12,	%f28
	srax	%o7,	0x1D,	%l6
	alignaddr	%g2,	%o5,	%o0
loop_851:
	call	loop_852
	fabsd	%f26,	%f2
	call	loop_853
	fmovsa	%fcc1,	%f19,	%f0
loop_852:
	call	loop_854
	fmovsue	%fcc2,	%f4,	%f21
loop_853:
	call	loop_855
	fmovdvc	%xcc,	%f6,	%f10
loop_854:
	fmovscs	%xcc,	%f6,	%f22
	call	loop_856
loop_855:
	xnor	%i1,	0x089B,	%l0
	array8	%g1,	%g4,	%i2
	movcc	%xcc,	0x06F,	%l1
loop_856:
	xor	%i4,	%o2,	%l4
	movneg	%icc,	0x6A3,	%o4
	fmovrsne	%g7,	%f13,	%f20
	fmovsue	%fcc1,	%f27,	%f9
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f4
	fnors	%f30,	%f7,	%f20
	movo	%fcc2,	%i3,	%i6
	call	loop_857
	call	loop_858
	fmovdlg	%fcc0,	%f28,	%f10
	sra	%l5,	0x0D,	%l3
loop_857:
	edge8l	%o3,	%o1,	%g6
loop_858:
	call	loop_859
	nop
	set	0x7C, %i7
	flush	%l7 + %i7
	array8	%i7,	%g5,	%l2
	fzeros	%f18
loop_859:
	mova	%fcc0,	%i5,	%i0
	call	loop_860
	fsrc2	%f2,	%f14
	call	loop_861
	smul	%g3,	%o7,	%l6
loop_860:
	fmovsa	%xcc,	%f23,	%f28
	fpadd32	%f6,	%f14,	%f26
loop_861:
	call	loop_862
	smulcc	%g2,	%o6,	%o0
	call	loop_863
	call	loop_864
loop_862:
	movge	%fcc3,	0x6CE,	%o5
	bmask	%l0,	%g1,	%i1
loop_863:
	bgu	%xcc,	loop_865
loop_864:
	fmovsleu	%xcc,	%f29,	%f28
	call	loop_866
	call	loop_867
loop_865:
	call	loop_868
	subc	%i2,	%l1,	%i4
loop_866:
	movl	%fcc3,	%g4,	%l4
loop_867:
	xorcc	%o4,	%g7,	%i3
loop_868:
	nop
	set	0x5E, %o7
	sth	%i6,	[%l7 + %o7]
	call	loop_869
	call	loop_870
	call	loop_871
	movrlez	%o2,	%l5,	%o3
loop_869:
	fmovdle	%xcc,	%f14,	%f6
loop_870:
	call	loop_872
loop_871:
	fmovda	%fcc2,	%f18,	%f10
	call	loop_873
	call	loop_874
loop_872:
	call	loop_875
	call	loop_876
loop_873:
	fandnot1	%f20,	%f8,	%f4
loop_874:
	call	loop_877
loop_875:
	rdpr	%tl,	%l3
loop_876:
	call	loop_878
	fmovdul	%fcc2,	%f8,	%f2
loop_877:
	xnorcc	%o1,	%g6,	%g5
	fbu,a,pt	%fcc1,	loop_879
loop_878:
	call	loop_880
	nop
	set	0x6E, %i6
	sth	%l2,	[%l7 + %i6]
	call	loop_881
loop_879:
	alignaddr	%i7,	%i0,	%g3
loop_880:
	srlx	%o7,	0x1B,	%l6
	nop
	setx	0x1ACDEF71F9084020,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4B2D3CD7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f24,	%f20
loop_881:
	movge	%xcc,	%g2,	%i5
	fmovd	%f22,	%f14
	siam	0x0
	edge32n	%o6,	%o5,	%o0
	fxor	%f18,	%f28,	%f6
	fcmpne16	%f30,	%f8,	%l0
	ldsb	[%l7 + 0x6C],	%g1
	fnor	%f10,	%f16,	%f0
	edge32n	%i2,	%l1,	%i1
	movcc	%icc,	0x5B2,	%g4
	nop
	setx	0xBC1A9F55AE10E670,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6C9CF06E43C4D409,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f8,	%f14
	call	loop_882
	andncc	%i4,	%o4,	%g7
	movul	%fcc0,	0x583,	%i3
	fbue,pt	%fcc2,	loop_883
loop_882:
	fcmple32	%f12,	%f24,	%i6
	call	loop_884
	call	loop_885
loop_883:
	fmovdlg	%fcc0,	%f22,	%f16
	fmovdcs	%xcc,	%f6,	%f28
loop_884:
	call	loop_886
loop_885:
	call	loop_887
	rdpr	%cleanwin,	%l4
	tle	%xcc,	0x4
loop_886:
	fnands	%f27,	%f9,	%f16
loop_887:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f25
	subc	%o2,	0x1C87,	%o3
	siam	0x3
	call	loop_888
	wr	%l5,	0x17B6,	%sys_tick
	nop
	setx	0x78AC63B83B647407,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4ADDB9C54A6D7317,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f24,	%f0
	fnot1s	%f24,	%f25
loop_888:
	call	loop_889
	nop
	setx	0xF0506F95DFF062CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0AA83CF7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f14,	%f26
	rdhpr	%hintp,	%o1
	call	loop_890
loop_889:
	membar	0x5E
	ta	%icc,	0x6
	movvs	%xcc,	%g6,	%l3
loop_890:
	fnegd	%f26,	%f10
	rd	%ccr,	%l2
	movlg	%fcc3,	0x6BA,	%i7
	subccc	%g5,	0x0D8F,	%i0
	array32	%o7,	%g3,	%g2
	fmovdl	%fcc3,	%f8,	%f22
	set	0x7E, %o5
	stha	%i5,	[%l7 + %o5] 0x23
	membar	#Sync
	ble,a,pn	%xcc,	loop_891
	fmovdpos	%icc,	%f2,	%f14
	fmovsug	%fcc3,	%f10,	%f8
	fands	%f4,	%f21,	%f28
loop_891:
	call	loop_892
	umulcc	%o6,	%o5,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovscs	%xcc,	%f15,	%f25
loop_892:
	call	loop_893
	sra	%g1,	0x02,	%i2
	fnand	%f4,	%f0,	%f0
	rd	%softint,	%l1
loop_893:
	nop
	setx	0x17F358BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xCE875830,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f14,	%f5
	call	loop_894
	fmovsule	%fcc1,	%f22,	%f5
	stbar
	lduh	[%l7 + 0x3E],	%i1
loop_894:
	sra	%g4,	%i4,	%o4
	movn	%fcc3,	%l6,	%g7
	call	loop_895
	call	loop_896
	tcs	%xcc,	0x1
	ble	%xcc,	loop_897
loop_895:
	sethi	0x0DD6,	%i3
loop_896:
	call	loop_898
	fmovdvc	%xcc,	%f28,	%f0
loop_897:
	tgu	%xcc,	0x5
	fone	%f28
loop_898:
	fmovsvc	%xcc,	%f3,	%f24
	call	loop_899
	fcmpeq16	%f30,	%f4,	%l4
	fmovsge	%xcc,	%f1,	%f17
	movrlz	%i6,	0x0E2,	%o3
loop_899:
	siam	0x2
	wrpr 	%g0, 	0x1, 	%gl
	fmul8x16al	%f19,	%f13,	%f12
	nop
	set	0x10, %i0
	flush	%l7 + %i0
	rd	%ccr,	%l5
	fabsd	%f0,	%f2
	fmovde	%icc,	%f2,	%f12
	fmovspos	%xcc,	%f20,	%f18
	call	loop_900
	movne	%fcc3,	%g6,	%l3
	fandnot1s	%f0,	%f16,	%f4
	sub	%i7,	0x1266,	%g5
loop_900:
	nop
	fitod	%f18,	%f24
	te	%xcc,	0x3
	movu	%fcc3,	%l2,	%o7
	call	loop_901
	fand	%f18,	%f6,	%f8
	fmul8x16au	%f25,	%f27,	%f6
	fands	%f8,	%f21,	%f14
loop_901:
	tleu	%icc,	0x6
	subcc	%g3,	%i0,	%i5
	edge32l	%o6,	%o5,	%g2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	xor	%l0,	0x02AD,	%g1
	for	%f26,	%f24,	%f18
	fmovso	%fcc1,	%f16,	%f5
	mulscc	%l1,	%i1,	%g4
	fbl	%fcc0,	loop_902
	fmovdvs	%icc,	%f18,	%f18
	addccc	%i2,	0x1ECD,	%i4
	call	loop_903
loop_902:
	srl	%l6,	0x00,	%g7
	fcmps	%fcc0,	%f31,	%f0
	fpsub32s	%f15,	%f21,	%f12
loop_903:
	movrne	%i3,	%l4,	%o4
	nop
	set	0x38, %i2
	std	%f12,	[%l7 + %i2]
	call	loop_904
	ble	%xcc,	loop_905
	call	loop_906
	fxor	%f14,	%f30,	%f12
loop_904:
	fmovscc	%icc,	%f21,	%f1
loop_905:
	fsrc1s	%f5,	%f18
loop_906:
	fxnor	%f30,	%f28,	%f26
	fmovsleu	%xcc,	%f23,	%f25
	call	loop_907
	call	loop_908
	call	loop_909
	fmovsle	%fcc1,	%f7,	%f20
loop_907:
	fmovdvc	%xcc,	%f2,	%f0
loop_908:
	nop
	wr	%g0,	0xeb,	%asi
	stwa	%o3,	[%l7 + 0x50] %asi
	membar	#Sync
loop_909:
	fornot1s	%f7,	%f27,	%f3
	call	loop_910
	movle	%fcc3,	0x2D9,	%i6
	fmovsug	%fcc3,	%f7,	%f14
	ta	%xcc,	0x6
loop_910:
	array16	%o2,	%l5,	%o1
	fzero	%f24
	brlez,a,pn	%g6,	loop_911
	call	loop_912
	call	loop_913
	call	loop_914
loop_911:
	call	loop_915
loop_912:
	call	loop_916
loop_913:
	sir	0x06F8
loop_914:
	tleu	%icc,	0x6
loop_915:
	fmovdn	%fcc1,	%f2,	%f26
loop_916:
	rdhpr	%ver,	%l3
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f6
	fxtos	%f6,	%f16
	call	loop_917
	pdist	%f22,	%f4,	%f6
loop_917:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 19
!	Type a   	: 30
!	Type x   	: 7
!	Type cti   	: 150
!	Type f   	: 159
!	Type i   	: 135
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
	set	0xC,	%g1
	set	0x8,	%g2
	set	0x6,	%g3
	set	0xE,	%g4
	set	0x3,	%g5
	set	0xD,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x4,	%i1
	set	-0xA,	%i2
	set	-0xC,	%i3
	set	-0xA,	%i4
	set	-0xF,	%i5
	set	-0xA,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x7CE02B19,	%l0
	set	0x64603782,	%l1
	set	0x43C01EC0,	%l2
	set	0x31E9711E,	%l3
	set	0x4D09E26D,	%l4
	set	0x2D528FBD,	%l5
	set	0x33CD7657,	%l6
	!# Output registers
	set	0x04F0,	%o0
	set	-0x02A1,	%o1
	set	-0x09B1,	%o2
	set	0x049B,	%o3
	set	0x128C,	%o4
	set	0x0C73,	%o5
	set	-0x0B65,	%o6
	set	0x0410,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	fornot2	%f16,	%f28,	%f2
	fmovde	%fcc3,	%f28,	%f4
	call	loop_918
	nop
	setx	0xC7067C2D36A868DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f8
	fmovsul	%fcc0,	%f5,	%f31
	movvc	%xcc,	0x6B5,	%g5
loop_918:
	call	loop_919
	nop
	setx	0x4B7C4943,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x05ECD8D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f20,	%f23
	fornot1	%f10,	%f6,	%f26
	fmovscc	%icc,	%f18,	%f19
loop_919:
	sdivx	%l2,	0x1AF9,	%o7
	for	%f16,	%f26,	%f28
	call	loop_920
	mulscc	%i7,	0x12EC,	%g3
	call	loop_921
	edge32	%i0,	%i5,	%o6
loop_920:
	xor	%g2,	%o0,	%o5
	mulscc	%l0,	%g1,	%i1
loop_921:
	fmovdcs	%xcc,	%f28,	%f6
	edge8n	%l1,	%g4,	%i2
	udivcc	%i4,	0x087F,	%g7
	fcmpeq16	%f16,	%f24,	%l6
	nop
	setx	0x58FF56A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	rd	%softint,	%l4
	ldstub	[%l7 + 0x0E],	%o4
	call	loop_922
	call	loop_923
	movpos	%icc,	0x2A2,	%i3
	call	loop_924
loop_922:
	umul	%o3,	0x00A6,	%o2
loop_923:
	fbn,pn	%fcc3,	loop_925
	movug	%fcc3,	%i6,	%l5
loop_924:
	xnorcc	%o1,	%l3,	%g5
	call	loop_926
loop_925:
	rdpr	%tba,	%g6
	call	loop_927
	call	loop_928
loop_926:
	fcmpgt32	%f30,	%f22,	%o7
	call	loop_929
loop_927:
	tge	%xcc,	0x2
loop_928:
	nop
	setx	0xA6305207B6A0FDEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xF2546355087F40E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f10,	%f0
	fsrc2	%f18,	%f28
loop_929:
	std	%f16,	[%l7 + 0x30]
	call	loop_930
	fnors	%f23,	%f12,	%f6
	call	loop_931
	call	loop_932
loop_930:
	fmovdue	%fcc0,	%f10,	%f18
	call	loop_933
loop_931:
	movg	%icc,	%i7,	%l2
loop_932:
	fmul8x16au	%f19,	%f17,	%f26
	fmovse	%fcc2,	%f13,	%f8
loop_933:
	tgu	%icc,	0x1
	move	%xcc,	0x099,	%g3
	xor	%i5,	0x0734,	%i0
	fpmerge	%f16,	%f27,	%f22
	call	loop_934
	subc	%g2,	%o0,	%o5
	mova	%xcc,	0x1B5,	%o6
	sll	%l0,	0x12,	%i1
loop_934:
	fmovsleu	%xcc,	%f6,	%f26
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_935
	rd	%softint,	%l1
	call	loop_936
	movrgz	%i2,	0x142,	%g7
loop_935:
	flushw
	call	loop_937
loop_936:
	call	loop_938
	movl	%fcc2,	%i4,	%l4
	call	loop_939
loop_937:
	call	loop_940
loop_938:
	fcmpd	%fcc1,	%f24,	%f10
	fpadd16	%f24,	%f2,	%f26
loop_939:
	call	loop_941
loop_940:
	tcs	%icc,	0x7
	call	loop_942
	fbne	%fcc3,	loop_943
loop_941:
	fmovdne	%fcc3,	%f24,	%f8
	fmovda	%fcc3,	%f4,	%f16
loop_942:
	call	loop_944
loop_943:
	nop
	setx	0xEE0C563B67FD9853,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x22782378,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f18,	%f10
	bl,a,pn	%icc,	loop_945
	fmovrslz	%o4,	%f1,	%f22
loop_944:
	array32	%l6,	%i3,	%o3
	wr	%i6,	%o2,	%sys_tick
loop_945:
	fbn,a,pn	%fcc2,	loop_946
	srax	%l5,	%l3,	%o1
	wr	%g5,	0x1D92,	%softint
	fpadd16s	%f4,	%f28,	%f29
loop_946:
	fmovsue	%fcc1,	%f8,	%f16
	fnand	%f6,	%f26,	%f16
	nop
	setx	0x7803B31B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f15
	rd	%y,	%g6
	siam	0x2
	andn	%i7,	0x08C1,	%l2
	movue	%fcc0,	0x2F1,	%o7
	edge32ln	%i5,	%i0,	%g2
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f18
	call	loop_947
	fpackfix	%f0,	%f24
	xorcc	%g3,	%o5,	%o0
	call	loop_948
loop_947:
	call	loop_949
	call	loop_950
	movue	%fcc1,	0x4BB,	%o6
loop_948:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_949:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x60] %asi,	%g4
loop_950:
	call	loop_951
	edge8	%l1,	%i2,	%g1
	tvs	%xcc,	0x6
	movu	%fcc1,	0x640,	%i4
loop_951:
	call	loop_952
	movneg	%icc,	0x3A6,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x663, 	%tick_cmpr
	fmovrse	%o4,	%f24,	%f8
loop_952:
	call	loop_953
	call	loop_954
	call	loop_955
	call	loop_956
loop_953:
	fbl,a	%fcc3,	loop_957
loop_954:
	movul	%fcc0,	0x5EC,	%o3
loop_955:
	xnorcc	%i3,	0x1838,	%o2
loop_956:
	fmovso	%fcc2,	%f9,	%f6
loop_957:
	tcc	%icc,	0x5
	nop
	setx loop_958, %l0, %l1
	jmpl %l1, %i6
	call	loop_959
	nop
	setx	0x113BB9E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fmovspos	%icc,	%f21,	%f22
loop_958:
	movne	%xcc,	%l5,	%l3
loop_959:
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f14
	call	loop_960
	movn	%icc,	%g5,	%o1
	sub	%i7,	%l2,	%g6
	xor	%o7,	0x1F38,	%i0
loop_960:
	call	loop_961
	addccc	%g2,	%g3,	%o5
	fmovsneg	%icc,	%f8,	%f30
	rdhpr	%htba,	%i5
loop_961:
	tvc	%icc,	0x2
	call	loop_962
	nop
	setx	0x4E371DD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xB2D31EBD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f21,	%f22
	fcmpne32	%f16,	%f18,	%o0
	wr	%o6,	%i1,	%ccr
loop_962:
	nop
	fitos	%f3,	%f16
	fba,a	%fcc1,	loop_963
	fsrc2	%f8,	%f8
	mulscc	%l0,	%l1,	%g4
	rdpr	%tba,	%i2
loop_963:
	fmuld8sux16	%f24,	%f20,	%f20
	fmovsn	%xcc,	%f1,	%f2
	fba,a	%fcc1,	loop_964
	or	%i4,	0x0C4C,	%g1
	swap	[%l7 + 0x4C],	%l4
	call	loop_965
loop_964:
	fmovrslz	%g7,	%f3,	%f16
	call	loop_966
	edge32l	%l6,	%o4,	%o3
loop_965:
	fba	%fcc0,	loop_967
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_966:
	rdpr	%tba,	%o2
	fmovs	%f24,	%f26
loop_967:
	fmovsge	%fcc2,	%f15,	%f11
	nop
	set	0x30, %o6
	stw	%i3,	[%l7 + %o6]
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x78, %g3
	ldsw	[%l7 + %g3],	%l5
	fsrc1s	%f0,	%f14
	call	loop_968
	nop
	setx	0x0958,	%l0,	%g5
	sdiv	%i6,	%g5,	%o1
	ld	[%l7 + 0x2C],	%f5
	fcmpeq32	%f2,	%f4,	%i7
loop_968:
	rdpr	%wstate,	%l2
	wr	%g0,	0xd9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	call	loop_969
	nop
	setx	0x4856A63,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fmovslg	%fcc2,	%f5,	%f29
	nop
	setx	0x1E47,	%l0,	%g6
	sdivx	%l3,	%g6,	%o7
loop_969:
	fbg,a	%fcc2,	loop_970
	fmovsvc	%icc,	%f17,	%f12
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd2
loop_970:
	subccc	%i0,	0x0077,	%g3
	call	loop_971
	call	loop_972
	fxnors	%f29,	%f8,	%f7
	brz,pn	%g2,	loop_973
loop_971:
	fmovdneg	%xcc,	%f18,	%f8
loop_972:
	tl	%xcc,	0x7
	brz,a,pn	%o5,	loop_974
loop_973:
	call	loop_975
	fmovrde	%i5,	%f0,	%f24
	call	loop_976
loop_974:
	call	loop_977
loop_975:
	call	loop_978
	nop
	setx loop_979, %l0, %l1
	jmpl %l1, %o6
loop_976:
	nop
	fitos	%f3,	%f14
	fstod	%f14,	%f26
loop_977:
	fmovdo	%fcc0,	%f28,	%f16
loop_978:
	sll	%i1,	0x14,	%o0
loop_979:
	nop
	set	0x78, %g6
	stxa	%l0,	[%l7 + %g6] 0x0c
	call	loop_980
	call	loop_981
	tle	%icc,	0x5
	call	loop_982
loop_980:
	edge16n	%l1,	%i2,	%i4
loop_981:
	fpmerge	%f10,	%f20,	%f26
	bneg,a,pt	%icc,	loop_983
loop_982:
	movcc	%xcc,	%g4,	%g1
	set	0x70, %i5
	sta	%f19,	[%l7 + %i5] 0x11
loop_983:
	fmovso	%fcc0,	%f16,	%f27
	bleu,a	%icc,	loop_984
	for	%f12,	%f12,	%f0
	call	loop_985
	fmovrslz	%g7,	%f22,	%f23
loop_984:
	fpack32	%f14,	%f14,	%f26
	fmovse	%icc,	%f8,	%f7
loop_985:
	nop
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x24,	%i6
	fmovsa	%xcc,	%f13,	%f0
	fmovdvs	%icc,	%f16,	%f6
	or	%o4,	%l4,	%o2
	call	loop_986
	fmovsle	%fcc1,	%f12,	%f24
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%o2
	sub	%i3,	%l5,	%g5
loop_986:
	edge32n	%i6,	%i7,	%o1
	alignaddr	%l3,	%g6,	%l2
	fcmpgt32	%f8,	%f10,	%i0
	rd	%tick_cmpr,	%o7
	fpsub16	%f16,	%f18,	%f2
	mulx	%g2,	%o5,	%i5
	mova	%icc,	0x317,	%o6
	bshuffle	%f14,	%f4,	%f20
	fcmpne32	%f28,	%f12,	%g3
	fmovdcs	%icc,	%f0,	%f10
	edge16n	%o0,	%l0,	%l1
	ta	%xcc,	0x5
	ldsw	[%l7 + 0x7C],	%i2
	fpadd32	%f18,	%f24,	%f0
	tge	%xcc,	0x7
	fmovdvc	%icc,	%f16,	%f2
	ba,a	%xcc,	loop_987
	call	loop_988
	bneg	%icc,	loop_989
	fbge,pt	%fcc1,	loop_990
loop_987:
	tgu	%xcc,	0x5
loop_988:
	fbe,a,pn	%fcc0,	loop_991
loop_989:
	fbne,pt	%fcc1,	loop_992
loop_990:
	bvs,a	%xcc,	loop_993
	call	loop_994
loop_991:
	call	loop_995
loop_992:
	move	%xcc,	0x324,	%i1
loop_993:
	call	loop_996
loop_994:
	call	loop_997
loop_995:
	call	loop_998
	nop
	setx	0x4A8ED177,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xE3BA995E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f21,	%f6
loop_996:
	edge8l	%i4,	%g4,	%g7
loop_997:
	call	loop_999
loop_998:
	fmovsul	%fcc1,	%f0,	%f1
	call	loop_1000
	edge32	%g1,	%o4,	%l4
loop_999:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x1A28A264,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x28A273B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f9,	%f18
loop_1000:
	st	%f10,	[%l7 + 0x50]
	srlx	%o2,	%o3,	%l6
	fmovdu	%fcc2,	%f18,	%f16
	nop
	fitos	%f14,	%f0
	fstoi	%f0,	%f29
	fnegd	%f12,	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l5,	%g5
	call	loop_1001
	fbg,a,pt	%fcc2,	loop_1002
	call	loop_1003
	call	loop_1004
loop_1001:
	call	loop_1005
loop_1002:
	tg	%icc,	0x0
loop_1003:
	call	loop_1006
loop_1004:
	fzero	%f0
loop_1005:
	faligndata	%f10,	%f2,	%f2
	fcmpes	%fcc1,	%f0,	%f29
loop_1006:
	edge16	%i6,	%i3,	%i7
	movre	%l3,	%g6,	%o1
	call	loop_1007
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f12
	call	loop_1008
	wrpr	%i0,	0x1EB8,	%tick
loop_1007:
	call	loop_1009
	call	loop_1010
loop_1008:
	mulx	%l2,	%g2,	%o7
	fmovrdgez	%o5,	%f6,	%f8
loop_1009:
	call	loop_1011
loop_1010:
	call	loop_1012
	call	loop_1013
	faligndata	%f10,	%f24,	%f20
loop_1011:
	call	loop_1014
loop_1012:
	tpos	%icc,	0x6
loop_1013:
	call	loop_1015
	call	loop_1016
loop_1014:
	call	loop_1017
	and	%o6,	0x08B9,	%i5
loop_1015:
	fcmps	%fcc0,	%f24,	%f12
loop_1016:
	nop
	fitos	%f5,	%f29
loop_1017:
	popc	0x1526,	%g3
	call	loop_1018
	tcs	%xcc,	0x4
	fmovdul	%fcc1,	%f22,	%f6
	fxnor	%f30,	%f20,	%f22
loop_1018:
	movcc	%icc,	%o0,	%l0
	tleu	%xcc,	0x5
	call	loop_1019
	call	loop_1020
	edge8n	%l1,	%i2,	%i4
	nop
	setx	0x087EC33D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x747DE47C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f3,	%f3
loop_1019:
	taddcc	%i1,	0x117E,	%g7
loop_1020:
	call	loop_1021
	call	loop_1022
	call	loop_1023
	call	loop_1024
loop_1021:
	fmovs	%f9,	%f28
loop_1022:
	call	loop_1025
loop_1023:
	nop
	setx	0x0A9B1AB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA434D321,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f18,	%f8
loop_1024:
	wrpr	%g4,	%o4,	%tick
	call	loop_1026
loop_1025:
	call	loop_1027
	fandnot1	%f6,	%f24,	%f10
	rd	%pc,	%g1
loop_1026:
	fors	%f10,	%f27,	%f28
loop_1027:
	movrlz	%o2,	%l4,	%o3
	call	loop_1028
	subc	%l6,	0x03BE,	%g5
	xnorcc	%i6,	0x04A2,	%i3
	fmovrdlz	%l5,	%f18,	%f12
loop_1028:
	nop
	set	0x18, %i1
	stwa	%i7,	[%l7 + %i1] 0x19
	fsrc1s	%f19,	%f13
	fcmps	%fcc1,	%f30,	%f12
	rdpr	%canrestore,	%g6
	movue	%fcc0,	0x213,	%l3
	fmovrdlz	%i0,	%f30,	%f0
	fpsub32s	%f5,	%f15,	%f25
	call	loop_1029
	popc	0x0D8E,	%l2
	array32	%o1,	%o7,	%o5
	call	loop_1030
loop_1029:
	edge16	%g2,	%o6,	%i5
	membar	0x3A
	call	loop_1031
loop_1030:
	fors	%f14,	%f7,	%f8
	call	loop_1032
	call	loop_1033
loop_1031:
	stw	%g3,	[%l7 + 0x74]
	and	%o0,	%l1,	%i2
loop_1032:
	movle	%fcc3,	%l0,	%i1
loop_1033:
	fbe,a	%fcc2,	loop_1034
	bshuffle	%f20,	%f20,	%f4
	mulx	%g7,	0x00FB,	%g4
	fmovdleu	%icc,	%f4,	%f26
loop_1034:
	fornot2	%f2,	%f2,	%f22
	wr	%o4,	%i4,	%sys_tick
	rdpr	%otherwin,	%g1
	call	loop_1035
	call	loop_1036
	movgu	%xcc,	0x0AD,	%o2
	tvs	%icc,	0x1
loop_1035:
	fcmps	%fcc1,	%f11,	%f21
loop_1036:
	wr 	%g0, 	0x7, 	%fprs
	fcmpne16	%f10,	%f2,	%l6
	call	loop_1037
	call	loop_1038
	fmovsg	%icc,	%f11,	%f2
	tg	%icc,	0x0
loop_1037:
	nop
	fitod	%f30,	%f12
loop_1038:
	call	loop_1039
	call	loop_1040
	call	loop_1041
	fandnot2s	%f0,	%f31,	%f13
loop_1039:
	call	loop_1042
loop_1040:
	fcmple16	%f30,	%f0,	%g5
loop_1041:
	umulcc	%l4,	%i3,	%i6
	call	loop_1043
loop_1042:
	nop
	setx	loop_1044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_1045
	call	loop_1046
loop_1043:
	call	loop_1047
loop_1044:
	taddcctv	%l5,	0x1C99,	%g6
loop_1045:
	nop
	setx	0x0B5C,	%l0,	%i0
	sdiv	%l3,	%i0,	%l2
loop_1046:
	call	loop_1048
loop_1047:
	call	loop_1049
	sub	%i7,	%o1,	%o5
	andn	%g2,	0x07E8,	%o7
loop_1048:
	fmovrslez	%o6,	%f7,	%f21
loop_1049:
	call	loop_1050
	call	loop_1051
	movvs	%icc,	%g3,	%o0
	edge8n	%i5,	%i2,	%l1
loop_1050:
	fmovslg	%fcc3,	%f28,	%f13
loop_1051:
	orcc	%l0,	0x0547,	%i1
	rdhpr	%hintp,	%g4
	call	loop_1052
	movpos	%xcc,	%g7,	%o4
	call	loop_1053
	fpack16	%f26,	%f0
loop_1052:
	mulx	%i4,	%o2,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x33B, 	%hsys_tick_cmpr
loop_1053:
	addc	%o3,	%l4,	%i3
	fzero	%f0
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f0
	fxtod	%f0,	%f20
	call	loop_1054
	movlg	%fcc2,	%g5,	%i6
	set	0x48, %g2
	ldswa	[%l7 + %g2] 0x18,	%l5
loop_1054:
	call	loop_1055
	fornot2	%f20,	%f6,	%f16
	movg	%fcc2,	0x7A4,	%l3
	be,a	%icc,	loop_1056
loop_1055:
	call	loop_1057
	bcc	%icc,	loop_1058
	tleu	%xcc,	0x1
loop_1056:
	call	loop_1059
loop_1057:
	fcmped	%fcc1,	%f12,	%f24
loop_1058:
	fmovsn	%xcc,	%f26,	%f1
	srlx	%g6,	%l2,	%i7
loop_1059:
	fmovsn	%icc,	%f24,	%f22
	wr	%i0,	%o1,	%softint
	call	loop_1060
	call	loop_1061
	orncc	%o5,	0x1303,	%o7
	call	loop_1062
loop_1060:
	fnegd	%f2,	%f20
loop_1061:
	call	loop_1063
	fbo,a,pt	%fcc0,	loop_1064
loop_1062:
	nop
	setx	0x96D1303E916A66A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmovsu	%fcc0,	%f0,	%f13
loop_1063:
	fba,a	%fcc3,	loop_1065
loop_1064:
	fmovrse	%g2,	%f26,	%f31
	rd	%sys_tick_cmpr,	%g3
	call	loop_1066
loop_1065:
	call	loop_1067
	call	loop_1068
	fmovsu	%fcc2,	%f23,	%f26
loop_1066:
	call	loop_1069
loop_1067:
	andn	%o6,	0x0DCE,	%i5
loop_1068:
	movue	%fcc1,	%i2,	%l1
	movcs	%icc,	%o0,	%i1
loop_1069:
	call	loop_1070
	ldd	[%l7 + 0x40],	%f4
	rd	%ccr,	%g4
	call	loop_1071
loop_1070:
	fnot2	%f8,	%f30
	call	loop_1072
	nop
	setx	0x1C2B,	%l0,	%o4
	sdivx	%g7,	%o4,	%l0
loop_1071:
	fexpand	%f27,	%f0
	fmovdcs	%icc,	%f18,	%f2
loop_1072:
	fandnot1s	%f21,	%f22,	%f17
	edge8	%o2,	%i4,	%g1
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%o3
	call	loop_1073
	fmovsle	%icc,	%f14,	%f22
	fors	%f20,	%f16,	%f23
	call	loop_1074
loop_1073:
	call	loop_1075
	fmovdl	%fcc1,	%f14,	%f10
	call	loop_1076
loop_1074:
	fmovsvs	%icc,	%f1,	%f29
loop_1075:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x1C] %asi,	%l6
loop_1076:
	fmovdgu	%icc,	%f12,	%f0
	fmovdgu	%icc,	%f20,	%f24
	be,a,pt	%icc,	loop_1077
	call	loop_1078
	bshuffle	%f16,	%f0,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1077:
	edge8ln	%g5,	%i6,	%l5
loop_1078:
	nop
	set	0x3C, %g1
	stw	%g6,	[%l7 + %g1]
	smulcc	%l3,	%l2,	%i7
	fnegs	%f30,	%f7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAEC, 	%hsys_tick_cmpr
	edge8n	%o7,	%i0,	%g2
	call	loop_1079
	movre	%g3,	0x30A,	%o6
	fmovdug	%fcc2,	%f6,	%f16
	fpmerge	%f24,	%f31,	%f24
loop_1079:
	call	loop_1080
	nop
	set	0x30, %l1
	flush	%l7 + %l1
	fornot1	%f4,	%f10,	%f2
	call	loop_1081
loop_1080:
	fmovdneg	%xcc,	%f2,	%f2
	fmovrde	%i2,	%f14,	%f6
	be,a,pt	%xcc,	loop_1082
loop_1081:
	st	%f7,	[%l7 + 0x1C]
	mulscc	%l1,	%i5,	%i1
	fmovrsgez	%g4,	%f0,	%f5
loop_1082:
	call	loop_1083
	edge8ln	%o0,	%o4,	%g7
	fmovrdne	%o2,	%f12,	%f14
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l0
loop_1083:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 30
!	Type a   	: 29
!	Type x   	: 11
!	Type cti   	: 166
!	Type f   	: 139
!	Type i   	: 125
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
	set	0xC,	%g1
	set	0xB,	%g2
	set	0xF,	%g3
	set	0x1,	%g4
	set	0xF,	%g5
	set	0x6,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0x6,	%i3
	set	-0xF,	%i4
	set	-0x3,	%i5
	set	-0xC,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x162345CA,	%l0
	set	0x1404050F,	%l1
	set	0x1E3D1048,	%l2
	set	0x1BCA5BDF,	%l3
	set	0x492DCE31,	%l4
	set	0x34A3C23C,	%l5
	set	0x12F5FBDC,	%l6
	!# Output registers
	set	-0x0A91,	%o0
	set	-0x0BE0,	%o1
	set	0x1681,	%o2
	set	-0x1F8C,	%o3
	set	-0x1580,	%o4
	set	0x01C6,	%o5
	set	0x0573,	%o6
	set	0x10D3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x05E59DF4CA83687D)
	INIT_TH_FP_REG(%l7,%f2,0x5D5C20A3F18A485C)
	INIT_TH_FP_REG(%l7,%f4,0xD0CC53AC0C3A9FC4)
	INIT_TH_FP_REG(%l7,%f6,0x4EECDBF1DF7762FD)
	INIT_TH_FP_REG(%l7,%f8,0x6EC930F21FC077BB)
	INIT_TH_FP_REG(%l7,%f10,0x635BC79D2FE71295)
	INIT_TH_FP_REG(%l7,%f12,0xF36D37E8F5DCF1AE)
	INIT_TH_FP_REG(%l7,%f14,0x54D2222C8394A1EA)
	INIT_TH_FP_REG(%l7,%f16,0xDA9A69D557D16335)
	INIT_TH_FP_REG(%l7,%f18,0x9AEFDFF1C193A977)
	INIT_TH_FP_REG(%l7,%f20,0xADCDB265941B3478)
	INIT_TH_FP_REG(%l7,%f22,0xA3032EBC4BAC9276)
	INIT_TH_FP_REG(%l7,%f24,0x0D1919CE58E448DE)
	INIT_TH_FP_REG(%l7,%f26,0xB8F53842DB8C7431)
	INIT_TH_FP_REG(%l7,%f28,0xA28DA1D56987DE68)
	INIT_TH_FP_REG(%l7,%f30,0x8C415987A5A66357)

	!# Execute Main Diag ..

	call	loop_1084
	call	loop_1085
	call	loop_1086
	ba	%xcc,	loop_1087
loop_1084:
	fmuld8sux16	%f25,	%f13,	%f6
loop_1085:
	movrgez	%g1,	%i4,	%o3
loop_1086:
	movrlz	%i3,	0x060,	%l4
loop_1087:
	ldsw	[%l7 + 0x0C],	%l6
	call	loop_1088
	edge32n	%g5,	%l5,	%i6
	addcc	%g6,	0x0318,	%l2
	rd	%sys_tick_cmpr,	%l3
loop_1088:
	movl	%fcc2,	0x018,	%o1
	call	loop_1089
	array8	%o5,	%i7,	%o7
	nop
	set	0x32, %o2
	ldub	[%l7 + %o2],	%i0
	fnand	%f30,	%f22,	%f6
loop_1089:
	call	loop_1090
	call	loop_1091
	sdivx	%g2,	0x152C,	%g3
	siam	0x5
loop_1090:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1091:
	swap	[%l7 + 0x1C],	%i5
	fandnot2s	%f16,	%f10,	%f27
	fcmpeq32	%f10,	%f20,	%l1
	tsubcc	%g4,	%i1,	%o0
	andn	%o4,	0x0696,	%g7
	fnands	%f5,	%f6,	%f16
	movuge	%fcc1,	%l0,	%g1
	edge8l	%i4,	%o3,	%i3
	bshuffle	%f26,	%f28,	%f2
	fnot2	%f16,	%f12
	call	loop_1092
	call	loop_1093
	bg	%xcc,	loop_1094
	st	%f10,	[%l7 + 0x7C]
loop_1092:
	fbue,a,pn	%fcc3,	loop_1095
loop_1093:
	edge32	%o2,	%l6,	%l4
loop_1094:
	tne	%icc,	0x7
	call	loop_1096
loop_1095:
	fmovdne	%fcc0,	%f0,	%f30
	fmovrse	%l5,	%f16,	%f9
	brnz,a,pt	%g5,	loop_1097
loop_1096:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movge	%icc,	%i6,	%l2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1097:
	nop
	set	0x10, %o3
	stda	%g6,	[%l7 + %o3] 0x10
	call	loop_1098
	call	loop_1099
	fornot2s	%f20,	%f18,	%f8
	movcc	%xcc,	%o1,	%o5
loop_1098:
	fexpand	%f17,	%f16
loop_1099:
	fmovdug	%fcc2,	%f10,	%f18
	call	loop_1100
	wr	%l3,	0x1FC3,	%y
	movug	%fcc0,	%i7,	%i0
	call	loop_1101
loop_1100:
	edge16ln	%g2,	%g3,	%i2
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x11,	 0
loop_1101:
	sub	%i5,	0x14D7,	%o6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fzero	%f0
	nop
	set	0x43, %g5
	ldub	[%l7 + %g5],	%l1
	set	0x14, %g7
	ldswa	[%l7 + %g7] 0x18,	%g4
	fones	%f4
	edge32ln	%o0,	%i1,	%o4
	fmovsneg	%xcc,	%f21,	%f14
	call	loop_1102
	sir	0x0867
	rd	%ccr,	%l0
	call	loop_1103
loop_1102:
	edge16n	%g7,	%i4,	%g1
	srlx	%o3,	0x0C,	%i3
	mova	%icc,	%o2,	%l4
loop_1103:
	fmovdlg	%fcc0,	%f20,	%f6
	fzeros	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f0
	fxtod	%f0,	%f0
	call	loop_1104
	rdhpr	%htba,	%l6
	orn	%g5,	%i6,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_1104:
	call	loop_1105
	fbe,a,pn	%fcc0,	loop_1106
	call	loop_1107
	call	loop_1108
loop_1105:
	call	loop_1109
loop_1106:
	andcc	%o1,	%l3,	%i7
loop_1107:
	fornot1	%f18,	%f12,	%f28
loop_1108:
	xnor	%i0,	%o5,	%g2
loop_1109:
	fmovdleu	%icc,	%f14,	%f10
	fmovsul	%fcc3,	%f10,	%f0
	fmovsvs	%icc,	%f16,	%f12
	call	loop_1110
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f10
	nop
	setx loop_1111, %l0, %l1
	jmpl %l1, %i2
	nop
	set	0x50, %g4
	std	%f4,	[%l7 + %g4]
loop_1110:
	and	%o7,	0x07B2,	%g3
	movleu	%icc,	0x247,	%o6
loop_1111:
	fmovda	%fcc2,	%f20,	%f22
	fmovsul	%fcc0,	%f26,	%f30
	movrlz	%l1,	0x344,	%i5
	fmovsgu	%xcc,	%f17,	%f23
	faligndata	%f2,	%f2,	%f14
	fnegd	%f2,	%f28
	call	loop_1112
	sra	%o0,	%i1,	%o4
	call	loop_1113
	fmovs	%f5,	%f31
loop_1112:
	call	loop_1114
	call	loop_1115
loop_1113:
	call	loop_1116
	call	loop_1117
loop_1114:
	bleu,a,pn	%icc,	loop_1118
loop_1115:
	fmovdne	%icc,	%f28,	%f8
loop_1116:
	tvs	%icc,	0x6
loop_1117:
	fandnot2	%f26,	%f0,	%f20
loop_1118:
	movle	%fcc3,	0x62D,	%g4
	mulscc	%g7,	0x0574,	%l0
	fmovdle	%xcc,	%f6,	%f12
	xorcc	%i4,	%g1,	%i3
	addc	%o3,	%l4,	%l5
	movrlez	%o2,	%g5,	%l6
	movn	%fcc2,	0x2FA,	%i6
	call	loop_1119
	movg	%icc,	0x4ED,	%l2
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1119:
	bvc,a,pt	%icc,	loop_1120
	nop
	setx	0x9BECC665E6AE821E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xB25015ED3F080B36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f22
	call	loop_1121
	call	loop_1122
loop_1120:
	bg,a	%xcc,	loop_1123
	call	loop_1124
loop_1121:
	sdivcc	%o1,	0x0FE7,	%g6
loop_1122:
	umulcc	%i7,	0x064F,	%l3
loop_1123:
	movvc	%xcc,	%i0,	%o5
loop_1124:
	call	loop_1125
	fpsub16	%f12,	%f20,	%f24
	umulcc	%g2,	%o7,	%g3
	call	loop_1126
loop_1125:
	call	loop_1127
	fpadd32	%f16,	%f4,	%f10
	call	loop_1128
loop_1126:
	call	loop_1129
loop_1127:
	brnz,a	%o6,	loop_1130
	alignaddrl	%i2,	%l1,	%i5
loop_1128:
	fandnot1	%f28,	%f24,	%f16
loop_1129:
	fmovrdgz	%o0,	%f2,	%f8
loop_1130:
	fmovdgu	%icc,	%f28,	%f20
	call	loop_1131
	fmovsl	%xcc,	%f17,	%f28
	call	loop_1132
	nop
	set	0x2C, %l6
	lduh	[%l7 + %l6],	%o4
loop_1131:
	movn	%icc,	0x353,	%i1
	call	loop_1133
loop_1132:
	call	loop_1134
	fmovdcc	%icc,	%f24,	%f8
	mova	%xcc,	0x3DB,	%g7
loop_1133:
	fone	%f8
loop_1134:
	call	loop_1135
	call	loop_1136
	call	loop_1137
	movrgz	%l0,	0x015,	%g4
loop_1135:
	call	loop_1138
loop_1136:
	call	loop_1139
loop_1137:
	fsrc1s	%f18,	%f14
	movg	%xcc,	%i4,	%g1
loop_1138:
	fpack16	%f2,	%f13
loop_1139:
	fpsub32s	%f18,	%f27,	%f17
	call	loop_1140
	array16	%i3,	%o3,	%l4
	fmovsle	%fcc2,	%f30,	%f4
	call	loop_1141
loop_1140:
	call	loop_1142
	srax	%o2,	0x0F,	%l5
	movcs	%icc,	%g5,	%l6
loop_1141:
	mulx	%i6,	%o1,	%g6
loop_1142:
	siam	0x2
	movn	%fcc3,	0x149,	%i7
	bmask	%l2,	%l3,	%i0
	call	loop_1143
	call	loop_1144
	call	loop_1145
	call	loop_1146
loop_1143:
	call	loop_1147
loop_1144:
	ta	%icc,	0x4
loop_1145:
	fpadd32s	%f5,	%f9,	%f6
loop_1146:
	nop
	set	0x54, %l3
	swap	[%l7 + %l3],	%g2
loop_1147:
	tcs	%xcc,	0x3
	fmovsu	%fcc3,	%f23,	%f2
	call	loop_1148
	call	loop_1149
	bvc,a	%xcc,	loop_1150
	udiv	%o5,	0x0DB7,	%o7
loop_1148:
	sdiv	%o6,	0x1305,	%i2
loop_1149:
	srlx	%g3,	%l1,	%o0
loop_1150:
	call	loop_1151
	call	loop_1152
	pdist	%f12,	%f2,	%f26
	orncc	%o4,	0x1C28,	%i5
loop_1151:
	bvc,a,pt	%xcc,	loop_1153
loop_1152:
	fmovs	%f16,	%f9
	fmovdpos	%xcc,	%f6,	%f24
	fmovspos	%xcc,	%f23,	%f4
loop_1153:
	edge8l	%i1,	%l0,	%g4
	fbule,a	%fcc2,	loop_1154
	call	loop_1155
	call	loop_1156
	call	loop_1157
loop_1154:
	fmovrdgez	%g7,	%f28,	%f16
loop_1155:
	fxors	%f21,	%f28,	%f27
loop_1156:
	fmovda	%xcc,	%f8,	%f28
loop_1157:
	fpack16	%f14,	%f11
	fcmpne32	%f8,	%f28,	%i4
	call	loop_1158
	call	loop_1159
	fpmerge	%f15,	%f17,	%f8
	fmul8x16au	%f9,	%f3,	%f12
loop_1158:
	tl	%icc,	0x1
loop_1159:
	stx	%i3,	[%l7 + 0x28]
	fmovdpos	%xcc,	%f10,	%f0
	fand	%f6,	%f2,	%f20
	call	loop_1160
	bneg	%icc,	loop_1161
	fmovdule	%fcc3,	%f28,	%f28
	sir	0x0A61
loop_1160:
	fpadd32s	%f1,	%f14,	%f30
loop_1161:
	call	loop_1162
	movleu	%xcc,	%g1,	%o3
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1162:
	fmul8sux16	%f6,	%f20,	%f20
	fmovdu	%fcc0,	%f14,	%f24
	fnand	%f24,	%f22,	%f6
	call	loop_1163
	wrpr	%o2,	%l4,	%tick
	call	loop_1164
	rd	%asi,	%g5
loop_1163:
	fandnot2	%f30,	%f4,	%f10
	fmovd	%f6,	%f24
loop_1164:
	call	loop_1165
	call	loop_1166
	fmovsvc	%xcc,	%f2,	%f26
	edge16ln	%l6,	%l5,	%o1
loop_1165:
	edge8n	%g6,	%i6,	%l2
loop_1166:
	nop
	set	0x0, %l5
	stxa	%l3,	[%g0 + %l5] 0x5f
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i7,	%i0
	fmovse	%fcc2,	%f16,	%f24
	movug	%fcc0,	0x235,	%o5
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f30
	movrlz	%o7,	%o6,	%i2
	srlx	%g3,	%g2,	%o0
	fbge,pt	%fcc3,	loop_1167
	bgu,a,pn	%xcc,	loop_1168
	call	loop_1169
	nop
	set	0x3C, %o1
	ldub	[%l7 + %o1],	%l1
loop_1167:
	call	loop_1170
loop_1168:
	fandnot2	%f16,	%f10,	%f4
loop_1169:
	movu	%fcc2,	0x0E0,	%i5
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f1
loop_1170:
	nop
	set	0x44, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i1
	fmovsule	%fcc2,	%f25,	%f20
	movrlez	%l0,	0x2E3,	%o4
	fxors	%f1,	%f6,	%f3
	rdhpr	%hintp,	%g4
	fmovdvs	%icc,	%f4,	%f14
	fmovduge	%fcc1,	%f2,	%f6
	sdivcc	%i4,	0x1B45,	%g7
	fcmpgt32	%f20,	%f12,	%i3
	call	loop_1171
	nop
	fitos	%f14,	%f30
	fstox	%f30,	%f2
	call	loop_1172
	nop
	set	0x19, %o7
	ldsb	[%l7 + %o7],	%g1
loop_1171:
	udivcc	%o3,	0x01CE,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD76, 	%hsys_tick_cmpr
loop_1172:
	xnorcc	%l5,	%o1,	%l4
	fmovdl	%fcc1,	%f18,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x6C4, 	%hsys_tick_cmpr
	fxnor	%f24,	%f12,	%f20
	call	loop_1173
	fmovde	%xcc,	%f26,	%f10
	fmovdne	%xcc,	%f6,	%f24
	wr	%l2,	%l3,	%y
loop_1173:
	call	loop_1174
	fabsd	%f22,	%f4
	fmovdue	%fcc0,	%f18,	%f28
	array16	%i7,	%i0,	%o5
loop_1174:
	fand	%f8,	%f6,	%f20
	or	%o7,	0x1B9E,	%o6
	wr	%i2,	%g6,	%softint
	call	loop_1175
	call	loop_1176
	call	loop_1177
	call	loop_1178
loop_1175:
	sllx	%g2,	%o0,	%g3
loop_1176:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1177:
	movpos	%xcc,	0x42C,	%i5
loop_1178:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x54] %asi,	%i1
	ba,a	%icc,	loop_1179
	wrpr 	%g0, 	0x3, 	%gl
	nop
	setx	0xD114B1C04A3EBCA4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE1266C6C9D71D690,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f24,	%f10
	orncc	%l0,	%g4,	%o4
loop_1179:
	sdivcc	%i4,	0x0CEA,	%g7
	call	loop_1180
	nop
	set	0x58, %i7
	stx	%g1,	[%l7 + %i7]
	movuge	%fcc0,	0x3B7,	%i3
	call	loop_1181
loop_1180:
	bcs	%xcc,	loop_1182
	fpsub16s	%f23,	%f8,	%f14
	fabss	%f2,	%f18
loop_1181:
	movue	%fcc2,	%o2,	%g5
loop_1182:
	call	loop_1183
	call	loop_1184
	tsubcctv	%o3,	%l5,	%l6
	fnot1s	%f0,	%f23
loop_1183:
	edge32	%l4,	%o1,	%i6
loop_1184:
	nop
	setx	0x368CC0FF684440CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB2966F06562E864A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f18,	%f18
	fmovrdgz	%l3,	%f18,	%f0
	call	loop_1185
	fnands	%f25,	%f22,	%f6
	call	loop_1186
	bcc,a	%icc,	loop_1187
loop_1185:
	edge16l	%l2,	%i0,	%o5
	rdpr	%wstate,	%o7
loop_1186:
	fzero	%f22
loop_1187:
	call	loop_1188
	edge32l	%i7,	%i2,	%g6
	fcmpgt16	%f28,	%f4,	%g2
	flushw
loop_1188:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc0
	call	loop_1189
	call	loop_1190
	call	loop_1191
	call	loop_1192
loop_1189:
	call	loop_1193
loop_1190:
	tpos	%icc,	0x3
loop_1191:
	nop
	setx	0x10DFBF67A14D7BFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f20
loop_1192:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%o6
loop_1193:
	nop
	set	0x6C, %i0
	ldswa	[%l7 + %i0] 0x89,	%o0
	fpadd16s	%f20,	%f5,	%f4
	movge	%xcc,	0x57B,	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1E, 	%hsys_tick_cmpr
	wrpr	%l1,	%i1,	%pil
	fsrc1s	%f16,	%f22
	movl	%icc,	0x15F,	%l0
	call	loop_1194
	call	loop_1195
	fmovd	%f10,	%f28
	sdivcc	%g4,	0x1AE8,	%o4
loop_1194:
	call	loop_1196
loop_1195:
	fmovrde	%i4,	%f16,	%f14
	ta	%xcc,	0x2
	call	loop_1197
loop_1196:
	call	loop_1198
	fcmpne16	%f10,	%f6,	%g1
	fcmpgt16	%f26,	%f30,	%g7
loop_1197:
	umul	%o2,	0x1F7B,	%g5
loop_1198:
	orn	%i3,	%o3,	%l6
	tcc	%icc,	0x5
	call	loop_1199
	fmovrsgz	%l4,	%f20,	%f2
	nop
	setx	0x5F0DCF1754619422,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE8423EE03CCDCD96,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f10,	%f28
	call	loop_1200
loop_1199:
	fmovdue	%fcc0,	%f18,	%f28
	fmovdl	%icc,	%f14,	%f4
	fcmple16	%f26,	%f28,	%l5
loop_1200:
	call	loop_1201
	call	loop_1202
	smul	%i6,	0x1009,	%l3
	call	loop_1203
loop_1201:
	array16	%l2,	%o1,	%i0
loop_1202:
	fcmpgt16	%f22,	%f8,	%o5
	call	loop_1204
loop_1203:
	fnor	%f14,	%f28,	%f24
	fmovdul	%fcc0,	%f28,	%f24
	fandnot2s	%f10,	%f21,	%f31
loop_1204:
	bpos,a,pt	%icc,	loop_1205
	fnot1s	%f19,	%f4
	fandnot2	%f28,	%f12,	%f28
	edge16ln	%o7,	%i7,	%i2
loop_1205:
	fmovduge	%fcc3,	%f16,	%f0
	nop
	setx loop_1206, %l0, %l1
	jmpl %l1, %g2
	fones	%f11
	nop
	set	0x28, %i6
	swap	[%l7 + %i6],	%g6
	subccc	%o6,	0x1C61,	%o0
loop_1206:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpadd16	%f26,	%f4,	%f18
	fzeros	%f11
	fornot2	%f0,	%f2,	%f10
	fornot1	%f10,	%f26,	%f20
	nop
	setx	0x70DF256EE3C4E211,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC477180E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f12,	%f18
	andncc	%i5,	0x05B0,	%g3
	call	loop_1207
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f26
	nop
	fitod	%f4,	%f30
	fdtos	%f30,	%f9
	and	%i1,	0x1D71,	%l0
loop_1207:
	movneg	%icc,	0x04C,	%l1
	fbul	%fcc1,	loop_1208
	call	loop_1209
	add	%g4,	0x1AB8,	%o4
	movul	%fcc3,	0x3A7,	%i4
loop_1208:
	fmovdgu	%xcc,	%f24,	%f0
loop_1209:
	edge8	%g1,	%o2,	%g5
	call	loop_1210
	fornot1s	%f15,	%f17,	%f9
	call	loop_1211
	call	loop_1212
loop_1210:
	call	loop_1213
	umul	%g7,	0x00CF,	%o3
loop_1211:
	stx	%i3,	[%l7 + 0x48]
loop_1212:
	xnor	%l4,	%l6,	%l5
loop_1213:
	movlg	%fcc1,	%l3,	%i6
	fmovdul	%fcc0,	%f6,	%f18
	fpmerge	%f20,	%f5,	%f24
	fands	%f12,	%f28,	%f25
	xor	%l2,	0x0B05,	%o1
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brnz,pn	%i0,	loop_1214
	tl	%icc,	0x2
	set	0x18, %i2
	lda	[%l7 + %i2] 0x11,	%f14
loop_1214:
	fpsub32s	%f18,	%f6,	%f26
	fmovdul	%fcc2,	%f2,	%f20
	fmovsg	%fcc0,	%f18,	%f8
	fcmpeq16	%f8,	%f22,	%o7
	call	loop_1215
	fnegs	%f10,	%f22
	call	loop_1216
	rd	%y,	%i7
loop_1215:
	nop
	setx	0x1865,	%l0,	%i2
	udivcc	%o5,	%i2,	%g6
	tcc	%xcc,	0x2
loop_1216:
	tvs	%icc,	0x0
	call	loop_1217
	call	loop_1218
	taddcc	%g2,	%o6,	%o0
	alignaddr	%g3,	%i5,	%l0
loop_1217:
	call	loop_1219
loop_1218:
	movrlez	%i1,	0x3A8,	%l1
	call	loop_1220
	nop
	setx	0xBDFDC7D22EC449D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5E2EF993110CE542,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f20,	%f2
loop_1219:
	call	loop_1221
	call	loop_1222
loop_1220:
	call	loop_1223
	rd	%asi,	%o4
loop_1221:
	call	loop_1224
loop_1222:
	fmovsul	%fcc2,	%f24,	%f3
loop_1223:
	movge	%fcc0,	0x774,	%i4
	call	loop_1225
loop_1224:
	call	loop_1226
	call	loop_1227
	tcs	%icc,	0x1
loop_1225:
	fmovrde	%g1,	%f26,	%f14
loop_1226:
	call	loop_1228
loop_1227:
	call	loop_1229
	fmovsule	%fcc3,	%f22,	%f8
	tgu	%icc,	0x3
loop_1228:
	tcc	%icc,	0x1
loop_1229:
	orn	%g4,	%o2,	%g5
	mova	%icc,	0x278,	%o3
	brlez	%i3,	loop_1230
	mova	%icc,	0x588,	%l4
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f22
	tcs	%xcc,	0x3
loop_1230:
	membar	0x1A
	fmovdgu	%icc,	%f8,	%f16
	call	loop_1231
	fzeros	%f24
	andcc	%g7,	%l5,	%l6
	fpack32	%f12,	%f24,	%f30
loop_1231:
	fmovdul	%fcc0,	%f30,	%f26
	sdivcc	%l3,	0x0C1E,	%i6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovrse	%o1,	%f4,	%f2
	brnz,pt	%l2,	loop_1232
	nop
	setx	loop_1233,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021100001404,	%l0,	%l1
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
	setx	loop_1234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021200001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule,a,pn	%fcc3,	loop_1235
loop_1232:
	fcmple16	%f14,	%f30,	%o7
loop_1233:
	fmovscc	%icc,	%f16,	%f22
loop_1234:
	fcmpne16	%f18,	%f8,	%i7
loop_1235:
	bvc,a,pt	%xcc,	loop_1236
	udiv	%o5,	0x189B,	%i2
	call	loop_1237
	fone	%f22
loop_1236:
	movleu	%icc,	%i0,	%g6
	ldstub	[%l7 + 0x1D],	%o6
loop_1237:
	wrpr	%o0,	%g3,	%cwp
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 31
!	Type a   	: 21
!	Type x   	: 15
!	Type cti   	: 154
!	Type f   	: 146
!	Type i   	: 133
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x1875D15C
.word 0xDC225763
.word 0x8C73E312
.word 0xF385803D
.word 0xCFE4B892
.word 0x727CC183
.word 0x2661D1D0
.word 0x6F375562
.word 0x51CC9010
.word 0x476EDD67
.word 0xC6693A7D
.word 0x019FDB4F
.word 0xF2452D07
.word 0x664DFD91
.word 0x44FE445B
.word 0xD53874B4
.word 0x8A0653E0
.word 0xC3487139
.word 0x18CA5040
.word 0xE3C4D7C6
.word 0x612AD78B
.word 0x8E4769B7
.word 0x903E00BB
.word 0xC1F2A871
.word 0x9B78B6B3
.word 0xD3290884
.word 0x4BDF2F50
.word 0x82CA590A
.word 0xE24A470E
.word 0xCA55EC1B
.word 0x05D15722
.word 0xC32ED71E
.word 0x9747E9BB
.word 0x0DD96F27
.word 0x24EFB2D6
.word 0xD38E6D1D
.word 0x48E84AAD
.word 0x33A3F88E
.word 0xD11802F1
.word 0xE479CEEC
.word 0x07C37543
.word 0xB86EE7DA
.word 0x12131954
.word 0x8DD27819
.word 0xBBF4F128
.word 0x52DE2DC4
.word 0xF415CC4D
.word 0x978320A9
.word 0xA8183AE9
.word 0x9017E03E
.word 0x2B8CB7C5
.word 0x881A3E2B
.word 0xDB8F1093
.word 0x5BEB1853
.word 0x56D8912F
.word 0xBA4E467F
.word 0xBC14BC72
.word 0xE3E03C3E
.word 0xCEDE1D3C
.word 0xFF6C0D8B
.word 0xD8F483C6
.word 0x2F253423
.word 0x2901D783
.word 0xABA34A86
.end
