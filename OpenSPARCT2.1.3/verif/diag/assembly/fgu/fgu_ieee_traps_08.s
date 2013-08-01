/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_08.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12566"
.ident "Mon Dec  8 19:24:13 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_08.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x4,	%g2
	set	0x0,	%g3
	set	0x1,	%g4
	set	0x5,	%g5
	set	0xE,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0xB,	%i1
	set	-0x0,	%i2
	set	-0x6,	%i3
	set	-0x4,	%i4
	set	-0xD,	%i5
	set	-0xF,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x7E10F6D1,	%l0
	set	0x15781FE4,	%l1
	set	0x4DA0A990,	%l2
	set	0x1CE277FA,	%l3
	set	0x3A8B1629,	%l4
	set	0x3CBAE113,	%l5
	set	0x10338BE8,	%l6
	!# Output registers
	set	0x1DCA,	%o0
	set	0x162A,	%o1
	set	-0x0E6F,	%o2
	set	-0x00DD,	%o3
	set	0x1E1D,	%o4
	set	-0x197C,	%o5
	set	0x0352,	%o6
	set	-0x19E5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	fmovrsgez	%i2,	%f21,	%f3
	call	loop_1
	call	loop_2
	call	loop_3
	edge16	%g5,	%o2,	%g3
loop_1:
	call	loop_4
loop_2:
	fxors	%f25,	%f23,	%f25
loop_3:
	subccc	%l3,	0x1718,	%i0
	fmovrsgz	%g6,	%f4,	%f23
loop_4:
	fmovdne	%icc,	%f8,	%f22
	wr	%o7,	%o1,	%ccr
	call	loop_5
	edge16	%l4,	%g7,	%g4
	fba,a,pt	%fcc0,	loop_6
	fcmpgt32	%f28,	%f12,	%i5
loop_5:
	fcmpeq32	%f20,	%f30,	%g2
	fmovsu	%fcc1,	%f30,	%f12
loop_6:
	bg	%icc,	loop_7
	fbule,a,pt	%fcc0,	loop_8
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f24
	fcmpeq32	%f24,	%f6,	%l6
loop_7:
	fsrc2	%f24,	%f26
loop_8:
	alignaddr	%l2,	%l1,	%i7
	st	%f10,	[%l7 + 0x2C]
	nop
	setx	loop_9,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x031200001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%i4,	%o4,	%i6
	call	loop_10
	movge	%fcc0,	%l0,	%o6
loop_9:
	fpadd16	%f4,	%f4,	%f6
	tpos	%icc,	0x6
loop_10:
	fmovsule	%fcc0,	%f13,	%f1
	movrlez	%i1,	%g1,	%i3
	call	loop_11
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tn	%icc,	0x3
	fabsd	%f22,	%f0
loop_11:
	call	loop_12
	fmovsa	%fcc3,	%f2,	%f14
	fxnors	%f26,	%f19,	%f22
	fmovdvc	%icc,	%f26,	%f12
loop_12:
	orn	%l5,	%o3,	%o0
	call	loop_13
	call	loop_14
	fpmerge	%f20,	%f29,	%f12
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f20
loop_13:
	movneg	%xcc,	%i2,	%g5
loop_14:
	fmovrdlez	%o2,	%f12,	%f10
	call	loop_15
	fcmpeq32	%f18,	%f12,	%o5
	movlg	%fcc1,	%g3,	%i0
	fpackfix	%f24,	%f23
loop_15:
	call	loop_16
	movrgz	%g6,	%l3,	%o1
	call	loop_17
	movrlez	%o7,	%g7,	%g4
loop_16:
	swap	[%l7 + 0x68],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x04D, 	%hsys_tick_cmpr
loop_17:
	smulcc	%l6,	%i5,	%l1
	fmovdu	%fcc1,	%f26,	%f2
	fmovscs	%icc,	%f26,	%f0
	fmovsa	%fcc3,	%f11,	%f29
	fcmpgt32	%f14,	%f14,	%i7
	fmovdcc	%xcc,	%f10,	%f12
	fmovdu	%fcc0,	%f0,	%f2
	nop
	setx	0x2C898698,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x34853B84,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f31,	%f13
	fcmped	%fcc2,	%f30,	%f10
	bn	%icc,	loop_18
	movle	%fcc2,	0x603,	%i4
	andn	%o4,	0x1943,	%i6
	call	loop_19
loop_18:
	call	loop_20
	nop
	setx	0x8D8A1D9377E419B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x31395A90,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f12,	%f28
	fnor	%f22,	%f20,	%f6
loop_19:
	bne,a	%icc,	loop_21
loop_20:
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f18
	fxtos	%f18,	%f11
	tcs	%xcc,	0x5
	ta	%icc,	0x1
loop_21:
	fpackfix	%f14,	%f26
	xnor	%l2,	%o6,	%l0
	bn,pt	%xcc,	loop_22
	edge32n	%g1,	%i3,	%i1
	fba,pt	%fcc2,	loop_23
	tpos	%xcc,	0x7
loop_22:
	call	loop_24
	call	loop_25
loop_23:
	wr	%o3,	0x18FE,	%softint
	xnorcc	%l5,	%o0,	%i2
loop_24:
	array32	%g5,	%o2,	%g3
loop_25:
	movcc	%xcc,	%i0,	%o5
	call	loop_26
	call	loop_27
	fpsub16s	%f16,	%f5,	%f24
	call	loop_28
loop_26:
	fmovs	%f20,	%f1
loop_27:
	fcmpeq16	%f10,	%f22,	%l3
	call	loop_29
loop_28:
	call	loop_30
	fbn,a	%fcc1,	loop_31
	fandnot2	%f6,	%f6,	%f24
loop_29:
	edge32	%g6,	%o7,	%g7
loop_30:
	call	loop_32
loop_31:
	fpackfix	%f28,	%f3
	call	loop_33
	movule	%fcc3,	%g4,	%l4
loop_32:
	fble,a	%fcc1,	loop_34
	tcs	%xcc,	0x0
loop_33:
	alignaddr	%o1,	%l6,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_34:
	tcs	%icc,	0x4
	smul	%i4,	0x1585,	%o4
	nop
	setx	loop_35,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032100001400,	%l0,	%l1
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
	xnorcc	%i7,	0x16AF,	%l2
	tvs	%icc,	0x3
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f14
loop_35:
	movgu	%xcc,	%o6,	%l0
	fbu,pn	%fcc0,	loop_36
	call	loop_37
	swap	[%l7 + 0x1C],	%i6
	fnot1	%f16,	%f22
loop_36:
	mova	%fcc1,	%i3,	%g1
loop_37:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f15,	[%l7 + 0x08] %asi
	fbg,a	%fcc1,	loop_38
	stbar
	fmovsule	%fcc3,	%f26,	%f30
	movrlez	%o3,	0x2BA,	%l5
loop_38:
	call	loop_39
	call	loop_40
	call	loop_41
	bvc	%icc,	loop_42
loop_39:
	wr	%i1,	%i2,	%clear_softint
loop_40:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_41:
	call	loop_43
loop_42:
	nop
	fitod	%f14,	%f24
	call	loop_44
	wr	%g5,	%o2,	%ccr
loop_43:
	fpsub32s	%f24,	%f15,	%f13
	taddcctv	%g3,	0x13CD,	%o0
loop_44:
	sethi	0x19A4,	%o5
	fmovduge	%fcc2,	%f0,	%f10
	orn	%l3,	%g6,	%o7
	call	loop_45
	rdhpr	%hsys_tick_cmpr,	%i0
	fors	%f16,	%f4,	%f20
	fmovrslz	%g4,	%f26,	%f18
loop_45:
	srl	%l4,	0x04,	%o1
	call	loop_46
	fone	%f16
	movg	%fcc1,	0x6A6,	%g7
	or	%l6,	%i5,	%g2
loop_46:
	call	loop_47
	call	loop_48
	fmovslg	%fcc2,	%f18,	%f24
	wr	%i4,	%l1,	%clear_softint
loop_47:
	rdpr	%cwp,	%o4
loop_48:
	bshuffle	%f4,	%f0,	%f20
	call	loop_49
	fmovsne	%xcc,	%f22,	%f30
	fbo,a	%fcc2,	loop_50
	call	loop_51
loop_49:
	call	loop_52
	fmovdpos	%xcc,	%f4,	%f28
loop_50:
	call	loop_53
loop_51:
	edge8ln	%i7,	%l2,	%o6
loop_52:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovduge	%fcc0,	%f2,	%f28
loop_53:
	bshuffle	%f18,	%f20,	%f20
	nop
	set	0x4C, %o0
	swap	[%l7 + %o0],	%i6
	call	loop_54
	call	loop_55
	call	loop_56
	fpack16	%f2,	%f0
loop_54:
	lduw	[%l7 + 0x50],	%o3
loop_55:
	mulx	%l5,	%g1,	%i2
loop_56:
	fabss	%f18,	%f8
	call	loop_57
	fmovdcc	%xcc,	%f24,	%f30
	fblg,pn	%fcc3,	loop_58
	for	%f2,	%f6,	%f26
loop_57:
	bneg,a,pt	%icc,	loop_59
	fmovs	%f8,	%f11
loop_58:
	subcc	%i1,	0x0F6F,	%g5
	movrne	%o2,	0x1B2,	%o0
loop_59:
	call	loop_60
	srlx	%o5,	0x1D,	%g3
	fmul8x16	%f9,	%f0,	%f30
	bne,a	%xcc,	loop_61
loop_60:
	edge32l	%g6,	%l3,	%i0
	fcmpne16	%f10,	%f28,	%o7
	brnz	%l4,	loop_62
loop_61:
	bg,pn	%xcc,	loop_63
	nop
	fitos	%f3,	%f21
	fstox	%f21,	%f8
	fxtos	%f8,	%f1
	call	loop_64
loop_62:
	brlz	%o1,	loop_65
loop_63:
	nop
	fitos	%f9,	%f8
	fstod	%f8,	%f4
	xor	%g4,	%l6,	%g7
loop_64:
	movgu	%icc,	0x503,	%i5
loop_65:
	call	loop_66
	call	loop_67
	fcmpes	%fcc1,	%f29,	%f3
	movcs	%xcc,	%g2,	%l1
loop_66:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_67:
	fnands	%f28,	%f31,	%f21
	fpsub32	%f10,	%f4,	%f24
	bl,pn	%xcc,	loop_68
	tle	%xcc,	0x6
	fmovsne	%icc,	%f13,	%f22
	set	0x44, %i3
	ldsha	[%l7 + %i3] 0x10,	%o4
loop_68:
	bn	%icc,	loop_69
	movl	%fcc0,	%i7,	%i4
	fands	%f31,	%f12,	%f2
	nop
	set	0x56, %i4
	ldstub	[%l7 + %i4],	%o6
loop_69:
	fpsub32	%f24,	%f18,	%f22
	call	loop_70
	rd	%ccr,	%l0
	call	loop_71
	call	loop_72
loop_70:
	movre	%l2,	%i6,	%o3
	call	loop_73
loop_71:
	fones	%f0
loop_72:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	udiv	%l5,	0x0661,	%i3
loop_73:
	tg	%icc,	0x6
	fpadd32s	%f11,	%f9,	%f10
	movvs	%xcc,	%i2,	%g1
	call	loop_74
	wr	%i1,	0x17EF,	%y
	bmask	%g5,	%o0,	%o5
	bgu,a	%icc,	loop_75
loop_74:
	call	loop_76
	fmovdneg	%xcc,	%f24,	%f6
	bgu,a,pn	%xcc,	loop_77
loop_75:
	sllx	%o2,	0x08,	%g3
loop_76:
	nop
	setx	0x7589359EBB9881ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f6
	call	loop_78
loop_77:
	fsrc1s	%f29,	%f11
	orncc	%l3,	0x06BC,	%g6
	nop
	setx	0x3D503E481EFD146E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f12
loop_78:
	fmovdule	%fcc3,	%f20,	%f26
	fbue,pn	%fcc3,	loop_79
	tsubcc	%i0,	0x1EFB,	%l4
	bneg	%xcc,	loop_80
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f6
loop_79:
	movuge	%fcc3,	0x7E9,	%o1
	bne,a,pn	%icc,	loop_81
loop_80:
	fbg	%fcc2,	loop_82
	call	loop_83
	ldd	[%l7 + 0x08],	%f8
loop_81:
	call	loop_84
loop_82:
	tpos	%icc,	0x7
loop_83:
	subc	%g4,	0x0FE0,	%l6
	fcmped	%fcc2,	%f18,	%f26
loop_84:
	call	loop_85
	wrpr	%g7,	%i5,	%tick
	set	0x60, %o2
	swapa	[%l7 + %o2] 0x18,	%o7
loop_85:
	movl	%icc,	%g2,	%o4
	fcmple16	%f10,	%f22,	%l1
	rdpr	%pil,	%i4
	subccc	%o6,	%i7,	%l2
	call	loop_86
	call	loop_87
	and	%l0,	0x0235,	%o3
	call	loop_88
loop_86:
	fmovdne	%xcc,	%f8,	%f24
loop_87:
	call	loop_89
	wr 	%g0, 	0x7, 	%fprs
loop_88:
	fxnor	%f20,	%f8,	%f26
	fmovsvs	%xcc,	%f10,	%f21
loop_89:
	array32	%l5,	%i3,	%i2
	fornot2	%f28,	%f4,	%f22
	call	loop_90
	nop
	setx	0xE7D2BB9061AF895E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE869BB15C1AD8786,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f8
	tge	%icc,	0x1
	popc	0x1FFC,	%g1
loop_90:
	call	loop_91
	movleu	%icc,	0x219,	%g5
	call	loop_92
	fmovdg	%xcc,	%f10,	%f26
loop_91:
	call	loop_93
	ld	[%l7 + 0x58],	%f25
loop_92:
	call	loop_94
	call	loop_95
loop_93:
	call	loop_96
	sdivcc	%i1,	0x1C5C,	%o5
loop_94:
	nop
	set	0x44, %l4
	ldsha	[%l7 + %l4] 0x80,	%o2
loop_95:
	fabss	%f25,	%f1
loop_96:
	brgez,a	%o0,	loop_97
	call	loop_98
	call	loop_99
	movvc	%icc,	0x676,	%g3
loop_97:
	tn	%icc,	0x0
loop_98:
	rd	%y,	%g6
loop_99:
	fxors	%f30,	%f5,	%f14
	fmovspos	%xcc,	%f13,	%f29
	call	loop_100
	tl	%icc,	0x2
	fcmpgt32	%f2,	%f16,	%l3
	fmovrsgz	%i0,	%f21,	%f27
loop_100:
	call	loop_101
	brlz,a,pt	%l4,	loop_102
	edge16ln	%g4,	%o1,	%g7
	movrne	%i5,	0x26E,	%o7
loop_101:
	fbn,a,pt	%fcc1,	loop_103
loop_102:
	nop
	setx	loop_104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032200001405,	%l0,	%l1
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
	fzeros	%f12
	fmovrslz	%g2,	%f13,	%f23
loop_103:
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f4
loop_104:
	call	loop_105
	call	loop_106
	call	loop_107
	faligndata	%f16,	%f30,	%f10
loop_105:
	ldsw	[%l7 + 0x74],	%o4
loop_106:
	call	loop_108
loop_107:
	add	%l6,	0x0D13,	%i4
	call	loop_109
	fmul8ulx16	%f12,	%f22,	%f0
loop_108:
	bne,pt	%icc,	loop_110
	movrlez	%o6,	0x1F7,	%i7
loop_109:
	movuge	%fcc3,	0x7E7,	%l1
	fandnot2s	%f18,	%f13,	%f31
loop_110:
	fmovsu	%fcc1,	%f21,	%f30
	fcmpeq32	%f10,	%f30,	%l2
	call	loop_111
	call	loop_112
	fmovdule	%fcc3,	%f2,	%f12
	movug	%fcc2,	0x003,	%o3
loop_111:
	call	loop_113
loop_112:
	fpsub32	%f14,	%f14,	%f12
	fmovdneg	%icc,	%f26,	%f10
	call	loop_114
loop_113:
	fcmped	%fcc2,	%f4,	%f26
	call	loop_115
	fnegd	%f6,	%f6
loop_114:
	tle	%icc,	0x6
	call	loop_116
loop_115:
	call	loop_117
	fnot2	%f26,	%f4
	alignaddrl	%i6,	%l5,	%i3
loop_116:
	nop
	setx loop_118, %l0, %l1
	jmpl %l1, %i2
loop_117:
	bge	%xcc,	loop_119
	rd	%ccr,	%l0
	fbe,a,pn	%fcc3,	loop_120
loop_118:
	and	%g5,	0x0016,	%g1
loop_119:
	wr	%i1,	%o5,	%y
	movu	%fcc0,	%o0,	%o2
loop_120:
	call	loop_121
	array8	%g6,	%g3,	%i0
	tneg	%xcc,	0x4
	umul	%l4,	0x0E78,	%l3
loop_121:
	wr	%o1,	0x0BBB,	%y
	fmovde	%fcc3,	%f18,	%f12
	set	0x20, %o5
	lduwa	[%l7 + %o5] 0x04,	%g7
	movule	%fcc0,	%g4,	%i5
	nop
	fitos	%f7,	%f14
	fstod	%f14,	%f18
	call	loop_122
	sra	%o7,	%g2,	%o4
	fcmpd	%fcc1,	%f28,	%f20
	wrpr 	%g0, 	0x2, 	%gl
loop_122:
	call	loop_123
	call	loop_124
	tsubcc	%i7,	0x17E9,	%o6
	rd	%fprs,	%l1
loop_123:
	nop
	setx	0x229D9FA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f27
loop_124:
	edge8l	%o3,	%l2,	%l5
	call	loop_125
	fbul,a	%fcc0,	loop_126
	movgu	%icc,	%i3,	%i6
	fmovsu	%fcc0,	%f21,	%f8
loop_125:
	nop
	setx	0x1BC6,	%l0,	%g5
	sdivx	%i2,	%g5,	%l0
loop_126:
	te	%icc,	0x1
	fsrc2s	%f27,	%f14
	fxnors	%f22,	%f0,	%f31
	fandnot2s	%f10,	%f31,	%f25
	movrne	%i1,	0x1C5,	%o5
	sdivx	%g1,	0x1A2F,	%o2
	sra	%o0,	%g3,	%i0
	fcmple16	%f6,	%f6,	%l4
	nop
	setx	0x1A2C,	%l0,	%o1
	udivx	%g6,	%o1,	%g7
	call	loop_127
	call	loop_128
	call	loop_129
	add	%g4,	0x172E,	%i5
loop_127:
	fmovsvs	%xcc,	%f17,	%f14
loop_128:
	mulx	%l3,	%g2,	%o4
loop_129:
	fnot1	%f26,	%f26
	call	loop_130
	mova	%fcc0,	0x338,	%o7
	call	loop_131
	call	loop_132
loop_130:
	xor	%i4,	0x17B5,	%l6
	call	loop_133
loop_131:
	fmovsu	%fcc1,	%f10,	%f14
loop_132:
	fmovrslez	%o6,	%f16,	%f9
	edge8ln	%l1,	%i7,	%l2
loop_133:
	nop
	set	0x70, %o6
	sta	%f4,	[%l7 + %o6] 0x81
	call	loop_134
	brz,pt	%l5,	loop_135
	sll	%o3,	0x0A,	%i3
	bmask	%i6,	%g5,	%l0
loop_134:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x366, 	%hsys_tick_cmpr
loop_135:
	fmovspos	%xcc,	%f24,	%f29
	call	loop_136
	fnands	%f5,	%f20,	%f25
	fcmpeq16	%f0,	%f22,	%g1
	fmovdne	%fcc2,	%f4,	%f10
loop_136:
	rdpr	%canrestore,	%o2
	alignaddr	%o5,	%g3,	%o0
	call	loop_137
	call	loop_138
	fpsub32	%f0,	%f8,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_137:
	call	loop_139
loop_138:
	call	loop_140
	call	loop_141
	fnegs	%f4,	%f26
loop_139:
	fmovdneg	%icc,	%f12,	%f18
loop_140:
	fbue,pn	%fcc0,	loop_142
loop_141:
	sdivx	%l4,	0x1BD6,	%o1
	fmovsl	%fcc2,	%f30,	%f23
	call	loop_143
loop_142:
	flushw
	edge16ln	%g4,	%i5,	%g7
	udivcc	%l3,	0x0885,	%g2
loop_143:
	fmovsue	%fcc3,	%f27,	%f27
	call	loop_144
	subcc	%o7,	%o4,	%i4
	movg	%fcc3,	0x719,	%o6
	call	loop_145
loop_144:
	fmuld8sux16	%f22,	%f23,	%f4
	rd	%fprs,	%l1
	call	loop_146
loop_145:
	movleu	%xcc,	0x00E,	%l6
	call	loop_147
	movo	%fcc2,	%i7,	%l2
loop_146:
	rd	%y,	%o3
	tsubcctv	%l5,	0x0F45,	%i6
loop_147:
	fcmped	%fcc2,	%f26,	%f26
	fmovdcc	%xcc,	%f0,	%f2
	movg	%xcc,	%i3,	%l0
	sll	%g5,	%i1,	%g1
	call	loop_148
	taddcctv	%i2,	0x0385,	%o5
	movne	%fcc2,	%g3,	%o0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x1C] %asi,	%i0
loop_148:
	nop
	fitos	%f13,	%f29
	fstod	%f29,	%f4
	call	loop_149
	add	%o2,	%l4,	%o1
	smul	%g6,	0x0678,	%i5
	alignaddr	%g7,	%g4,	%l3
loop_149:
	bshuffle	%f26,	%f12,	%f4
	fxors	%f18,	%f13,	%f5
	tgu	%icc,	0x3
	call	loop_150
	call	loop_151
	fbug,pt	%fcc2,	loop_152
	wrpr 	%g0, 	0x2, 	%gl
loop_150:
	movcs	%icc,	%i4,	%o6
loop_151:
	subccc	%l1,	%o4,	%l6
loop_152:
	array32	%i7,	%l2,	%o3
	call	loop_153
	movvc	%xcc,	%i6,	%l5
	bge,a	%icc,	loop_154
	fsrc1s	%f19,	%f23
loop_153:
	call	loop_155
	fcmpne16	%f20,	%f24,	%i3
loop_154:
	edge16l	%g5,	%i1,	%l0
	call	loop_156
loop_155:
	call	loop_157
	fmovdo	%fcc0,	%f8,	%f10
	fbue,a	%fcc1,	loop_158
loop_156:
	call	loop_159
loop_157:
	bshuffle	%f28,	%f4,	%f30
	call	loop_160
loop_158:
	call	loop_161
loop_159:
	nop
	set	0x29, %g4
	ldsb	[%l7 + %g4],	%g1
	wr 	%g0, 	0x7, 	%fprs
loop_160:
	nop
	set	0x60, %l5
	prefetch	[%l7 + %l5],	 3
loop_161:
	nop
	setx	0x3E44ACAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xB0804E00,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f10,	%f4
	tcc	%icc,	0x2
	fornot1s	%f1,	%f8,	%f7
	te	%xcc,	0x4
	nop
	setx	loop_162,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x014100001402,	%l0,	%l1
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
	fcmps	%fcc0,	%f30,	%f10
	rdhpr	%hintp,	%o5
	wrpr 	%g0, 	0x1, 	%gl
loop_162:
	fnors	%f20,	%f10,	%f1
	call	loop_163
	andn	%o0,	%i0,	%o2
	xnor	%l4,	0x0175,	%g6
	fmovrdlz	%i5,	%f16,	%f18
loop_163:
	nop
	setx	0x1B0A,	%l0,	%o1
	sdivx	%g7,	%o1,	%g4
	call	loop_164
	wr	%o7,	0x0BFE,	%clear_softint
	fpsub32s	%f21,	%f11,	%f1
loop_164:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 20
!	Type a   	: 31
!	Type x   	: 7
!	Type cti   	: 164
!	Type f   	: 140
!	Type i   	: 138
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
	set	0xE,	%g2
	set	0x0,	%g3
	set	0x9,	%g4
	set	0xF,	%g5
	set	0xF,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x9,	%i1
	set	-0x6,	%i2
	set	-0x0,	%i3
	set	-0x8,	%i4
	set	-0xD,	%i5
	set	-0x2,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x5B14AD99,	%l0
	set	0x3C1E0267,	%l1
	set	0x5FE44430,	%l2
	set	0x7B76F8B2,	%l3
	set	0x293CD9DA,	%l4
	set	0x66B9FFB8,	%l5
	set	0x3B79D9A3,	%l6
	!# Output registers
	set	0x0B99,	%o0
	set	0x1952,	%o1
	set	0x157A,	%o2
	set	0x16F4,	%o3
	set	-0x15F9,	%o4
	set	0x0867,	%o5
	set	0x03CF,	%o6
	set	-0x0D13,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	fsrc1	%f14,	%f2
	call	loop_165
	movre	%g2,	%i4,	%l3
	fexpand	%f23,	%f16
	edge8ln	%l1,	%o4,	%l6
loop_165:
	rdpr	%gl,	%i7
	fnot2s	%f11,	%f31
	tneg	%xcc,	0x7
	xor	%o6,	%o3,	%i6
	rd	%tick_cmpr,	%l5
	fmovdn	%xcc,	%f22,	%f12
	fzeros	%f2
	movgu	%icc,	%i3,	%l2
	fmovdneg	%icc,	%f24,	%f28
	call	loop_166
	fone	%f24
	call	loop_167
	fcmpne16	%f10,	%f16,	%g5
loop_166:
	fmovrdlz	%i1,	%f4,	%f10
	edge8	%l0,	%g1,	%o5
loop_167:
	call	loop_168
	movne	%xcc,	0x512,	%g3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%o0
loop_168:
	movvc	%xcc,	0x757,	%i0
	bgu	%xcc,	loop_169
	bn,a	%xcc,	loop_170
	fcmple16	%f30,	%f20,	%i2
	rd	%ccr,	%l4
loop_169:
	nop
	set	0x30, %g5
	sta	%f29,	[%l7 + %g5] 0x80
loop_170:
	fnot2s	%f20,	%f18
	call	loop_171
	fmovdo	%fcc2,	%f0,	%f16
	tg	%xcc,	0x1
	call	loop_172
loop_171:
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f26
	call	loop_173
	call	loop_174
loop_172:
	fornot2	%f14,	%f2,	%f22
	fmovrdlez	%g6,	%f4,	%f4
loop_173:
	sra	%o2,	0x1F,	%i5
loop_174:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	brz	%g7,	loop_175
	st	%f17,	[%l7 + 0x64]
	fcmpgt32	%f8,	%f8,	%g4
	tcs	%icc,	0x0
loop_175:
	fsrc2s	%f15,	%f3
	ta	%icc,	0x0
	fmovrdgez	%o7,	%f16,	%f18
	taddcctv	%g2,	0x1BEF,	%i4
	orn	%l3,	%l1,	%o4
	nop
	setx	0x23A17CE8AF0721EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x397BA42E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f20,	%f10
	fmovdo	%fcc3,	%f0,	%f30
	rdhpr	%hsys_tick_cmpr,	%l6
	fmovde	%xcc,	%f2,	%f16
	fpack32	%f12,	%f20,	%f24
	orcc	%o1,	%i7,	%o3
	call	loop_176
	call	loop_177
	bshuffle	%f14,	%f28,	%f2
	call	loop_178
loop_176:
	call	loop_179
loop_177:
	call	loop_180
	fmovsg	%icc,	%f20,	%f24
loop_178:
	tle	%icc,	0x4
loop_179:
	call	loop_181
loop_180:
	movcc	%xcc,	%o6,	%l5
	movneg	%xcc,	%i3,	%i6
	call	loop_182
loop_181:
	ld	[%l7 + 0x1C],	%f16
	fmovdneg	%icc,	%f28,	%f12
	srl	%g5,	0x02,	%l2
loop_182:
	tgu	%icc,	0x3
	rdhpr	%hpstate,	%i1
	fmovsa	%xcc,	%f4,	%f31
	movlg	%fcc3,	0x5CB,	%l0
	fexpand	%f29,	%f16
	fmovdvc	%icc,	%f28,	%f14
	fcmped	%fcc3,	%f30,	%f20
	fandnot1s	%f25,	%f5,	%f5
	ldsh	[%l7 + 0x0C],	%o5
	edge16ln	%g1,	%g3,	%o0
	fone	%f2
	rdpr	%wstate,	%i0
	bl,a,pt	%xcc,	loop_183
	movule	%fcc3,	%l4,	%i2
	fbug,a,pn	%fcc2,	loop_184
	fmovrslz	%o2,	%f7,	%f26
loop_183:
	fmovslg	%fcc1,	%f30,	%f3
	nop
	fitod	%f8,	%f14
loop_184:
	nop
	wr	%g0,	0xdb,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	call	loop_185
	rd	%ccr,	%i5
	edge8	%g7,	%g4,	%g6
	addc	%g2,	%o7,	%i4
loop_185:
	fone	%f2
	fblg	%fcc1,	loop_186
	nop
	setx	0xD8692F7F0A50B6F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x3166DD8076708388,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f28,	%f30
	bcc,a	%icc,	loop_187
	taddcctv	%l3,	0x0B28,	%o4
loop_186:
	fnegs	%f29,	%f3
	fmovdl	%fcc0,	%f4,	%f0
loop_187:
	call	loop_188
	call	loop_189
	call	loop_190
	call	loop_191
loop_188:
	wrpr	%l1,	0x08D1,	%tick
loop_189:
	fmovdne	%fcc3,	%f30,	%f18
loop_190:
	fmul8x16au	%f0,	%f28,	%f20
loop_191:
	nop
	set	0x55, %i1
	lduba	[%l7 + %i1] 0x19,	%l6
	call	loop_192
	srlx	%o1,	0x09,	%i7
	set	0x1C, %i7
	stwa	%o6,	[%l7 + %i7] 0x2f
	membar	#Sync
loop_192:
	call	loop_193
	movu	%fcc1,	%l5,	%i3
	smulcc	%o3,	%g5,	%l2
	bg	%icc,	loop_194
loop_193:
	fexpand	%f31,	%f4
	movpos	%xcc,	0x3CB,	%i1
	bcs,a,pt	%xcc,	loop_195
loop_194:
	tg	%xcc,	0x0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%o5
loop_195:
	wrpr	%g1,	0x0FEC,	%pil
	movl	%fcc3,	%l0,	%o0
	popc	0x1085,	%g3
	fmovslg	%fcc0,	%f6,	%f19
	call	loop_196
	addc	%i0,	%l4,	%i2
	xorcc	%i5,	%o2,	%g4
	call	loop_197
loop_196:
	call	loop_198
	fmovda	%fcc1,	%f24,	%f24
	lduw	[%l7 + 0x7C],	%g7
loop_197:
	nop
	set	0x54, %i2
	ldswa	[%l7 + %i2] 0x80,	%g2
loop_198:
	bleu,a,pn	%xcc,	loop_199
	call	loop_200
	call	loop_201
	call	loop_202
loop_199:
	fzeros	%f8
loop_200:
	call	loop_203
loop_201:
	call	loop_204
loop_202:
	subc	%g6,	0x1E67,	%o7
	fpsub16	%f12,	%f8,	%f24
loop_203:
	sra	%i4,	%l3,	%l1
loop_204:
	fmovdcc	%icc,	%f18,	%f28
	stx	%l6,	[%l7 + 0x10]
	alignaddr	%o4,	%o1,	%o6
	call	loop_205
	call	loop_206
	fpsub32	%f0,	%f30,	%f22
	sub	%l5,	0x05F4,	%i3
loop_205:
	taddcctv	%i7,	%g5,	%l2
loop_206:
	fmovrsne	%o3,	%f27,	%f11
	fmovdug	%fcc0,	%f14,	%f20
	call	loop_207
	fbul	%fcc1,	loop_208
	ld	[%l7 + 0x48],	%f13
	call	loop_209
loop_207:
	fbue,pt	%fcc0,	loop_210
loop_208:
	fmovsu	%fcc2,	%f7,	%f3
	edge8ln	%i1,	%o5,	%g1
loop_209:
	call	loop_211
loop_210:
	ta	%xcc,	0x4
	call	loop_212
	fbge,a,pt	%fcc1,	loop_213
loop_211:
	movuge	%fcc2,	%l0,	%o0
	call	loop_214
loop_212:
	sir	0x1B89
loop_213:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7C] %asi,	%g3
loop_214:
	fcmple16	%f18,	%f12,	%i0
	movrlz	%l4,	%i6,	%i2
	popc	%o2,	%g4
	fmul8ulx16	%f0,	%f12,	%f30
	rdhpr	%hintp,	%i5
	fnot2s	%f4,	%f15
	fcmped	%fcc3,	%f0,	%f4
	fmovdcc	%icc,	%f30,	%f4
	rd	%sys_tick_cmpr,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCF, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x38],	%f8
	fbue,a,pt	%fcc0,	loop_215
	call	loop_216
	or	%g6,	0x0743,	%i4
	nop
	setx	0x18F013EADEB34A09,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4679E10402BC5215,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f16,	%f4
loop_215:
	bne,pt	%xcc,	loop_217
loop_216:
	sir	0x099D
	movvs	%xcc,	0x09D,	%l3
	movn	%fcc0,	%l6,	%l1
loop_217:
	edge8ln	%o4,	%o6,	%l5
	subccc	%o1,	0x1F63,	%i3
	sub	%i7,	%g5,	%o3
	call	loop_218
	st	%f31,	[%l7 + 0x60]
	edge16ln	%i1,	%o5,	%l2
	fmovdn	%fcc2,	%f22,	%f24
loop_218:
	fmovdgu	%icc,	%f18,	%f12
	call	loop_219
	sra	%l0,	%g1,	%o0
	call	loop_220
	fmovslg	%fcc1,	%f17,	%f26
loop_219:
	fmovsule	%fcc3,	%f1,	%f1
	fmovrdgez	%i0,	%f24,	%f16
loop_220:
	wr 	%g0, 	0x6, 	%fprs
	call	loop_221
	call	loop_222
	call	loop_223
	edge16n	%i6,	%l4,	%o2
loop_221:
	nop
	setx	0x4CE39987E40C290C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x56E0D226E4986E3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f4,	%f16
loop_222:
	nop
	setx	0x35A3265F60B2D0A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_223:
	wr 	%g0, 	0x4, 	%fprs
	call	loop_224
	nop
	fitos	%f8,	%f21
	fstox	%f21,	%f16
	edge16n	%i5,	%g7,	%o7
	call	loop_225
loop_224:
	movcc	%xcc,	0x068,	%g6
	call	loop_226
	call	loop_227
loop_225:
	nop
	setx	loop_228,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001100001403,	%l0,	%l1
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
	setx	0xD7D47E96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x43DEFF76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f3,	%f6
loop_226:
	fnot1	%f0,	%f14
loop_227:
	fcmpgt16	%f8,	%f14,	%i4
loop_228:
	fxors	%f8,	%f29,	%f8
	call	loop_229
	edge32n	%l3,	%g2,	%l6
	fpsub32	%f14,	%f4,	%f20
	addc	%l1,	0x1644,	%o6
loop_229:
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f28
	fand	%f10,	%f4,	%f2
	tne	%xcc,	0x2
	wr	%g0,	0x2a,	%asi
	stha	%o4,	[%l7 + 0x32] %asi
	membar	#Sync
	call	loop_230
	ldd	[%l7 + 0x20],	%f8
	srax	%l5,	0x10,	%i3
	fpsub32	%f8,	%f24,	%f10
loop_230:
	call	loop_231
	fsrc1	%f10,	%f2
	array8	%o1,	%g5,	%i7
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x34] %asi,	%i1
loop_231:
	call	loop_232
	call	loop_233
	call	loop_234
	edge32n	%o3,	%o5,	%l2
loop_232:
	subc	%l0,	%o0,	%i0
loop_233:
	fcmple32	%f30,	%f20,	%g1
loop_234:
	call	loop_235
	for	%f10,	%f24,	%f22
	orn	%i6,	%l4,	%g3
	call	loop_236
loop_235:
	call	loop_237
	fnegs	%f23,	%f14
	xor	%o2,	%g4,	%i5
loop_236:
	srl	%i2,	%g7,	%o7
loop_237:
	mulx	%g6,	%l3,	%g2
	call	loop_238
	call	loop_239
	tsubcc	%i4,	0x0D57,	%l6
	movu	%fcc1,	%o6,	%o4
loop_238:
	array16	%l5,	%l1,	%i3
loop_239:
	call	loop_240
	call	loop_241
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fors	%f8,	%f22,	%f7
loop_240:
	call	loop_242
loop_241:
	nop
	set	0x1C, %i0
	lduw	[%l7 + %i0],	%o1
	call	loop_243
	call	loop_244
loop_242:
	sub	%g5,	0x0C3C,	%i1
	movlg	%fcc0,	0x67E,	%i7
loop_243:
	subcc	%o5,	0x190B,	%o3
loop_244:
	call	loop_245
	fmovda	%fcc3,	%f20,	%f30
	tle	%xcc,	0x2
	call	loop_246
loop_245:
	brnz,a,pn	%l2,	loop_247
	call	loop_248
	srlx	%o0,	%l0,	%g1
loop_246:
	brz,a,pt	%i6,	loop_249
loop_247:
	fmovrdlz	%l4,	%f28,	%f28
loop_248:
	call	loop_250
	fbl,pn	%fcc1,	loop_251
loop_249:
	nop
	setx	0xB56DEE6F023EB098,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x720B93B3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f28,	%f2
	rdpr	%canrestore,	%g3
loop_250:
	addc	%o2,	0x1B1B,	%i0
loop_251:
	call	loop_252
	rd	%asi,	%g4
	fsrc1s	%f6,	%f16
	tg	%icc,	0x3
loop_252:
	call	loop_253
	fmovdug	%fcc1,	%f24,	%f22
	call	loop_254
	fmovdneg	%xcc,	%f0,	%f2
loop_253:
	fandnot2s	%f20,	%f6,	%f3
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x80,	%i5
loop_254:
	call	loop_255
	nop
	fitos	%f10,	%f14
	fstox	%f14,	%f18
	smul	%g7,	0x0B1F,	%o7
	fnands	%f4,	%f10,	%f1
loop_255:
	faligndata	%f6,	%f22,	%f0
	subc	%g6,	%l3,	%g2
	fmovsug	%fcc3,	%f4,	%f12
	smulcc	%i4,	%i2,	%o6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 4
	fmovsn	%fcc0,	%f20,	%f31
	movcs	%xcc,	%o4,	%l5
	umul	%i3,	0x00E5,	%l1
	call	loop_256
	call	loop_257
	bshuffle	%f30,	%f18,	%f16
	set	0x54, %l1
	ldsha	[%l7 + %l1] 0x18,	%o1
loop_256:
	nop
	setx	0xAF258A6355E1E375,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE46644C3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f8,	%f0
loop_257:
	movvc	%icc,	%g5,	%i7
	tg	%xcc,	0x2
	fmovrse	%i1,	%f23,	%f22
	srl	%o5,	0x14,	%o3
	fnot1s	%f29,	%f5
	fpack16	%f8,	%f24
	bmask	%l2,	%o0,	%g1
	sdiv	%l0,	0x1132,	%l4
	fcmpes	%fcc1,	%f8,	%f15
	fpadd32	%f30,	%f28,	%f18
	rd	%softint,	%i6
	fpack32	%f2,	%f10,	%f28
	fcmpeq16	%f6,	%f28,	%g3
	call	loop_258
	fnor	%f14,	%f16,	%f10
	fmul8x16al	%f14,	%f22,	%f30
	rdhpr	%hintp,	%o2
loop_258:
	movrlz	%g4,	0x14A,	%i5
	be,a	%xcc,	loop_259
	siam	0x0
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f20
	nop
	setx	0x73F7DCAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xBCBFCA59,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f9,	%f14
loop_259:
	call	loop_260
	wr	%i0,	0x095D,	%y
	fnors	%f25,	%f30,	%f25
	fors	%f27,	%f12,	%f31
loop_260:
	call	loop_261
	andn	%o7,	%g7,	%l3
	fmovsg	%xcc,	%f2,	%f28
	srax	%g2,	%g6,	%i4
loop_261:
	call	loop_262
	fble,pn	%fcc1,	loop_263
	call	loop_264
	addcc	%i2,	%o6,	%l6
loop_262:
	add	%l5,	%i3,	%l1
loop_263:
	movo	%fcc0,	%o4,	%o1
loop_264:
	fmovdue	%fcc2,	%f0,	%f22
	fmovscc	%xcc,	%f19,	%f21
	fmovscs	%icc,	%f24,	%f7
	call	loop_265
	fmovsle	%fcc1,	%f22,	%f25
	call	loop_266
	fcmpeq32	%f18,	%f4,	%i7
loop_265:
	fmovdug	%fcc1,	%f30,	%f10
	fnot2s	%f15,	%f28
loop_266:
	nop
	set	0x41, %o4
	ldstub	[%l7 + %o4],	%i1
	fmovrde	%o5,	%f12,	%f22
	fmovdgu	%icc,	%f26,	%f30
	addcc	%g5,	%o3,	%o0
	fornot1	%f4,	%f26,	%f30
	tpos	%icc,	0x0
	call	loop_267
	call	loop_268
	call	loop_269
	taddcctv	%l2,	%g1,	%l4
loop_267:
	call	loop_270
loop_268:
	call	loop_271
loop_269:
	orncc	%l0,	0x0EA6,	%i6
	call	loop_272
loop_270:
	nop
	setx	0xE49BE88150E0EBB6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x10FCB99F98647902,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f20,	%f14
loop_271:
	call	loop_273
	fpsub32	%f22,	%f6,	%f2
loop_272:
	call	loop_274
	fxors	%f18,	%f11,	%f10
loop_273:
	call	loop_275
	call	loop_276
loop_274:
	bne,pt	%icc,	loop_277
	fmovda	%icc,	%f8,	%f16
loop_275:
	fone	%f16
loop_276:
	movneg	%xcc,	%o2,	%g4
loop_277:
	call	loop_278
	edge32l	%g3,	%i0,	%o7
	nop
	setx	loop_279,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021100001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1	%f28,	%f4,	%f22
loop_278:
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f19
	wrpr 	%g0, 	0x1, 	%gl
loop_279:
	fcmpgt32	%f8,	%f8,	%l3
	edge8l	%g7,	%g6,	%i4
	tleu	%xcc,	0x1
	sdiv	%g2,	0x1986,	%o6
	sethi	0x0FE1,	%i2
	fmovdvs	%xcc,	%f28,	%f12
	bcc	%icc,	loop_280
	edge32ln	%l5,	%i3,	%l1
	fmovsge	%fcc1,	%f25,	%f7
	call	loop_281
loop_280:
	call	loop_282
	fmul8sux16	%f12,	%f16,	%f14
	fmovdlg	%fcc2,	%f28,	%f6
loop_281:
	movneg	%xcc,	0x1C2,	%o4
loop_282:
	fmuld8ulx16	%f29,	%f17,	%f4
	fbg,a,pn	%fcc1,	loop_283
	edge32	%o1,	%i7,	%i1
	fcmpes	%fcc1,	%f13,	%f18
	movre	%l6,	0x3D7,	%g5
loop_283:
	call	loop_284
	movvc	%xcc,	%o3,	%o0
	nop
	set	0x0B, %g7
	ldsb	[%l7 + %g7],	%o5
	call	loop_285
loop_284:
	umulcc	%l2,	0x1C26,	%l4
	call	loop_286
	call	loop_287
loop_285:
	alignaddr	%g1,	%i6,	%o2
	fpadd16s	%f29,	%f5,	%f0
loop_286:
	call	loop_288
loop_287:
	fnot2	%f22,	%f2
	call	loop_289
	call	loop_290
loop_288:
	fexpand	%f29,	%f2
	edge16	%g4,	%l0,	%i0
loop_289:
	orcc	%g3,	0x038B,	%i5
loop_290:
	wrpr 	%g0, 	0x2, 	%gl
	movgu	%xcc,	0x677,	%g6
	bleu,a,pn	%icc,	loop_291
	fpadd16	%f4,	%f26,	%f22
	and	%i4,	%g2,	%g7
	call	loop_292
loop_291:
	call	loop_293
	fors	%f29,	%f23,	%f21
	fmovrsgz	%i2,	%f16,	%f27
loop_292:
	fsrc2s	%f29,	%f17
loop_293:
	tl	%xcc,	0x7
	movneg	%xcc,	0x030,	%l5
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f25
	rd	%y,	%i3
	movre	%o6,	0x2D2,	%l1
	set	0x68, %i6
	stba	%o4,	[%l7 + %i6] 0x80
	brgz,pn	%i7,	loop_294
	wrpr	%i1,	%l6,	%tick
	sll	%o1,	%g5,	%o3
	fmovrdgez	%o0,	%f0,	%f20
loop_294:
	srl	%o5,	%l2,	%l4
	taddcctv	%g1,	0x0E0E,	%o2
	call	loop_295
	nop
	fitos	%f8,	%f27
	smulcc	%i6,	0x146C,	%g4
	smulcc	%i0,	%g3,	%i5
loop_295:
	call	loop_296
	srax	%l3,	%o7,	%g6
	fmovs	%f30,	%f13
	fornot1	%f28,	%f6,	%f8
loop_296:
	fmovsl	%fcc2,	%f25,	%f3
	call	loop_297
	brlez,a	%l0,	loop_298
	fmovrsgz	%i4,	%f16,	%f27
	call	loop_299
loop_297:
	fnot2s	%f21,	%f11
loop_298:
	fors	%f1,	%f1,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x189, 	%hsys_tick_cmpr
loop_299:
	movleu	%xcc,	0x47B,	%i2
	call	loop_300
	call	loop_301
	call	loop_302
	tneg	%icc,	0x6
loop_300:
	call	loop_303
loop_301:
	call	loop_304
loop_302:
	movleu	%icc,	%l5,	%i3
	nop
	setx	0x39C6240B669DC2EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x6FE4CE4956F24D34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f16,	%f12
loop_303:
	fornot2s	%f21,	%f7,	%f1
loop_304:
	call	loop_305
	rd	%pc,	%l1
	fnot1	%f28,	%f2
	fmovrsgez	%o4,	%f19,	%f19
loop_305:
	fmovsn	%fcc1,	%f31,	%f22
	array32	%o6,	%i1,	%i7
	call	loop_306
	edge8l	%o1,	%g5,	%l6
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f30
	fmovsu	%fcc0,	%f17,	%f6
loop_306:
	fpsub32s	%f22,	%f23,	%f7
	nop
	fitos	%f14,	%f10
	fstod	%f10,	%f24
	fpack32	%f18,	%f12,	%f0
	alignaddr	%o0,	%o3,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbu,pt	%fcc1,	loop_307
	orn	%l4,	%o2,	%i6
	rdpr	%cansave,	%g4
loop_307:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 27
!	Type a   	: 27
!	Type x   	: 14
!	Type cti   	: 143
!	Type f   	: 155
!	Type i   	: 134
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
	set	0xF,	%g2
	set	0x6,	%g3
	set	0xE,	%g4
	set	0x4,	%g5
	set	0xA,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x4,	%i1
	set	-0x0,	%i2
	set	-0x8,	%i3
	set	-0x5,	%i4
	set	-0x5,	%i5
	set	-0xB,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x4B89A52A,	%l0
	set	0x4FC9B246,	%l1
	set	0x6C156636,	%l2
	set	0x146194DE,	%l3
	set	0x00B6AEDC,	%l4
	set	0x6969976D,	%l5
	set	0x544DFD52,	%l6
	!# Output registers
	set	-0x0B1B,	%o0
	set	0x0451,	%o1
	set	0x1E86,	%o2
	set	0x0284,	%o3
	set	0x19AF,	%o4
	set	-0x1940,	%o5
	set	-0x0D24,	%o6
	set	-0x0F8D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	bl,a,pn	%icc,	loop_308
	orcc	%i0,	%g1,	%i5
	call	loop_309
	fmovrdgz	%l3,	%f8,	%f28
loop_308:
	fabss	%f20,	%f23
	xnor	%g3,	0x16B3,	%o7
loop_309:
	fnot2s	%f5,	%f15
	fmovspos	%icc,	%f17,	%f16
	call	loop_310
	call	loop_311
	umul	%g6,	%l0,	%g7
	call	loop_312
loop_310:
	fmovsle	%icc,	%f6,	%f8
loop_311:
	call	loop_313
	call	loop_314
loop_312:
	fmovsa	%fcc2,	%f0,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_313:
	fmul8sux16	%f26,	%f8,	%f22
loop_314:
	call	loop_315
	fmovdlg	%fcc0,	%f22,	%f16
	call	loop_316
	fmovsu	%fcc0,	%f15,	%f14
loop_315:
	tpos	%xcc,	0x0
	call	loop_317
loop_316:
	movu	%fcc2,	0x7D9,	%i4
	call	loop_318
	fmovrde	%i2,	%f24,	%f18
loop_317:
	call	loop_319
	xor	%i3,	%l1,	%l5
loop_318:
	fmovde	%icc,	%f28,	%f2
	fmovso	%fcc1,	%f25,	%f0
loop_319:
	movneg	%xcc,	0x46B,	%o4
	ta	%icc,	0x2
	andcc	%i1,	0x0990,	%o6
	fbg	%fcc3,	loop_320
	movcc	%icc,	0x302,	%i7
	fmovse	%icc,	%f13,	%f15
	call	loop_321
loop_320:
	edge8l	%g5,	%o1,	%o0
	tgu	%icc,	0x5
	call	loop_322
loop_321:
	rdpr	%tba,	%l6
	wr	%o5,	0x180C,	%softint
	call	loop_323
loop_322:
	bge,a,pn	%xcc,	loop_324
	movg	%fcc2,	%l2,	%l4
	fcmps	%fcc0,	%f26,	%f23
loop_323:
	bmask	%o3,	%i6,	%o2
loop_324:
	fbne,a,pn	%fcc1,	loop_325
	call	loop_326
	nop
	fitos	%f12,	%f31
	fstoi	%f31,	%f23
	fsrc1s	%f20,	%f22
loop_325:
	call	loop_327
loop_326:
	call	loop_328
	fpadd16s	%f27,	%f23,	%f5
	call	loop_329
loop_327:
	fmovdneg	%icc,	%f14,	%f24
loop_328:
	rdhpr	%hsys_tick_cmpr,	%g4
	fone	%f20
loop_329:
	fnot1s	%f17,	%f23
	fabss	%f5,	%f5
	call	loop_330
	movrlz	%g1,	%i5,	%i0
	fbne,a	%fcc0,	loop_331
	tcc	%xcc,	0x4
loop_330:
	movge	%icc,	0x473,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_331:
	fand	%f20,	%f24,	%f16
	call	loop_332
	for	%f4,	%f10,	%f12
	membar	0x5D
	fmovdneg	%icc,	%f0,	%f0
loop_332:
	mulx	%o7,	%g6,	%l0
	and	%g7,	0x0E42,	%g2
	movre	%i2,	0x1EB,	%i4
	tneg	%icc,	0x4
	subccc	%i3,	0x1F59,	%l5
	fmovsne	%fcc2,	%f29,	%f22
	call	loop_333
	fmovscs	%icc,	%f25,	%f23
	call	loop_334
	call	loop_335
loop_333:
	call	loop_336
	nop
	fitos	%f5,	%f17
	fstod	%f17,	%f6
loop_334:
	fmovsn	%xcc,	%f28,	%f3
loop_335:
	tcs	%xcc,	0x1
loop_336:
	for	%f18,	%f22,	%f0
	movneg	%xcc,	0x69C,	%o4
	std	%f22,	[%l7 + 0x08]
	fornot2	%f8,	%f24,	%f8
	faligndata	%f0,	%f14,	%f30
	call	loop_337
	call	loop_338
	bne	%icc,	loop_339
	fcmpgt32	%f2,	%f26,	%i1
loop_337:
	call	loop_340
loop_338:
	movge	%icc,	%o6,	%i7
loop_339:
	call	loop_341
	tsubcc	%g5,	%o1,	%o0
loop_340:
	call	loop_342
	flushw
loop_341:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x47E, 	%hsys_tick_cmpr
	rd	%y,	%l2
loop_342:
	call	loop_343
	fmovsge	%fcc3,	%f0,	%f11
	array8	%l4,	%l6,	%o3
	mulscc	%i6,	%g4,	%g1
loop_343:
	andn	%o2,	%i0,	%l3
	fpsub32s	%f30,	%f9,	%f30
	movrlez	%i5,	0x199,	%g3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd9,	%f0
	call	loop_344
	call	loop_345
	movleu	%xcc,	0x61F,	%g6
	fzero	%f0
loop_344:
	nop
	set	0x5C, %g3
	ldswa	[%l7 + %g3] 0x81,	%o7
loop_345:
	subcc	%l0,	%g2,	%i2
	fandnot1s	%f1,	%f19,	%f30
	wr	%i4,	%g7,	%softint
	call	loop_346
	tl	%xcc,	0x7
	sllx	%i3,	%l5,	%i1
	call	loop_347
loop_346:
	call	loop_348
	fmovrdlz	%o6,	%f4,	%f6
	fsrc1	%f26,	%f8
loop_347:
	subc	%i7,	0x1420,	%o4
loop_348:
	fmovrdne	%g5,	%f30,	%f28
	taddcctv	%o0,	0x0D45,	%l1
	call	loop_349
	fmovd	%f24,	%f26
	call	loop_350
	fnegd	%f8,	%f30
loop_349:
	fbo	%fcc3,	loop_351
	for	%f2,	%f24,	%f10
loop_350:
	rdpr	%canrestore,	%o1
	bpos,a	%xcc,	loop_352
loop_351:
	movne	%fcc3,	%l2,	%l4
	fnot1s	%f19,	%f28
	srlx	%o5,	0x17,	%o3
loop_352:
	movlg	%fcc0,	%i6,	%l6
	call	loop_353
	taddcctv	%g4,	%g1,	%i0
	edge16ln	%l3,	%o2,	%g3
	call	loop_354
loop_353:
	call	loop_355
	rdhpr	%ver,	%i5
	call	loop_356
loop_354:
	call	loop_357
loop_355:
	umul	%g6,	0x0AC4,	%o7
	addc	%l0,	0x0104,	%g2
loop_356:
	tvc	%icc,	0x3
loop_357:
	rdhpr	%ver,	%i4
	call	loop_358
	fnegd	%f4,	%f6
	fornot1s	%f11,	%f0,	%f7
	rdpr	%wstate,	%i2
loop_358:
	brz,a	%g7,	loop_359
	nop
	setx	0xF6307DE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x2B63329D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f19,	%f21
	alignaddr	%l5,	%i1,	%i3
	fmovrslez	%i7,	%f20,	%f9
loop_359:
	call	loop_360
	fmovdug	%fcc1,	%f20,	%f24
	fmovrsgez	%o4,	%f18,	%f8
	fmovsne	%fcc2,	%f21,	%f21
loop_360:
	movrlez	%g5,	0x00D,	%o0
	fmovs	%f30,	%f28
	fxnors	%f28,	%f27,	%f10
	rd	%fprs,	%o6
	call	loop_361
	call	loop_362
	nop
	setx	0x1795,	%l0,	%l2
	udivx	%l1,	%l2,	%l4
	udivx	%o5,	0x1403,	%o1
loop_361:
	fpadd16	%f4,	%f6,	%f8
loop_362:
	call	loop_363
	call	loop_364
	nop
	fitos	%f29,	%f12
	edge8	%i6,	%o3,	%g4
loop_363:
	movcc	%xcc,	%g1,	%i0
loop_364:
	fmovduge	%fcc0,	%f24,	%f14
	set	0x11, %i5
	lduba	[%l7 + %i5] 0x11,	%l6
	rd	%tick_cmpr,	%o2
	fbg,pt	%fcc0,	loop_365
	fcmpne16	%f10,	%f14,	%l3
	fbl,a,pt	%fcc2,	loop_366
	edge16n	%i5,	%g3,	%o7
loop_365:
	pdist	%f8,	%f30,	%f4
	call	loop_367
loop_366:
	movrlz	%g6,	%g2,	%i4
	edge16n	%i2,	%l0,	%l5
	nop
	fitos	%f9,	%f2
	fstox	%f2,	%f26
loop_367:
	fmovdue	%fcc1,	%f20,	%f20
	rdhpr	%hintp,	%i1
	edge16n	%i3,	%g7,	%i7
	fmovsne	%fcc2,	%f17,	%f30
	rdhpr	%hsys_tick_cmpr,	%g5
	fbge	%fcc1,	loop_368
	call	loop_369
	xorcc	%o0,	0x05CB,	%o4
	fcmpne16	%f16,	%f20,	%o6
loop_368:
	call	loop_370
loop_369:
	call	loop_371
	call	loop_372
	call	loop_373
loop_370:
	fnot1s	%f4,	%f11
loop_371:
	fmul8sux16	%f2,	%f2,	%f4
loop_372:
	fmovsug	%fcc1,	%f11,	%f24
loop_373:
	movn	%xcc,	%l1,	%l4
	call	loop_374
	ble,pn	%xcc,	loop_375
	call	loop_376
	call	loop_377
loop_374:
	xnorcc	%l2,	0x00E8,	%o1
loop_375:
	edge32l	%o5,	%i6,	%g4
loop_376:
	nop
	setx	0x15431CBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x0CDF90DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f29,	%f19
loop_377:
	bcc	%icc,	loop_378
	movcc	%icc,	0x76C,	%g1
	te	%xcc,	0x3
	andn	%o3,	0x03A7,	%i0
loop_378:
	add	%l6,	%l3,	%i5
	movleu	%icc,	%o2,	%g3
	wr	%g0,	0x11,	%asi
	sta	%f4,	[%l7 + 0x60] %asi
	call	loop_379
	sdiv	%o7,	0x1DD1,	%g2
	call	loop_380
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f24
loop_379:
	call	loop_381
	call	loop_382
loop_380:
	nop
	fitos	%f2,	%f3
	mulscc	%i4,	0x08CA,	%i2
loop_381:
	fmovdvc	%xcc,	%f10,	%f0
loop_382:
	call	loop_383
	siam	0x2
	edge32n	%l0,	%g6,	%l5
	fmovsleu	%icc,	%f26,	%f20
loop_383:
	fnor	%f10,	%f18,	%f26
	call	loop_384
	edge8n	%i3,	%i1,	%g7
	call	loop_385
	fmovsul	%fcc0,	%f18,	%f10
loop_384:
	fmovdlg	%fcc1,	%f16,	%f12
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%i6
loop_385:
	xor	%o0,	0x1FE6,	%g5
	ldx	[%l7 + 0x10],	%o6
	fexpand	%f18,	%f16
	call	loop_386
	nop
	fitos	%f14,	%f27
	fstox	%f27,	%f24
	fxtos	%f24,	%f2
	call	loop_387
	addcc	%o4,	0x1EB3,	%l4
loop_386:
	smulcc	%l2,	0x13DC,	%o1
	movne	%fcc3,	%o5,	%l1
loop_387:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_388
	call	loop_389
	call	loop_390
	wrpr	%g4,	0x047C,	%pil
loop_388:
	call	loop_391
loop_389:
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f26
loop_390:
	tpos	%xcc,	0x3
	call	loop_392
loop_391:
	fnot2	%f10,	%f24
	call	loop_393
	fsrc1s	%f30,	%f16
loop_392:
	call	loop_394
	fbne,a,pn	%fcc1,	loop_395
loop_393:
	edge16ln	%g1,	%o3,	%i0
	umulcc	%l6,	%i6,	%i5
loop_394:
	nop
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
loop_395:
	call	loop_396
	fmovdlg	%fcc2,	%f14,	%f2
	movug	%fcc3,	0x2FE,	%g3
	nop
	setx	0x91542A1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xBD9EE7EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f5,	%f8
loop_396:
	call	loop_397
	call	loop_398
	call	loop_399
	fmovsul	%fcc1,	%f1,	%f14
loop_397:
	fmovdlg	%fcc2,	%f28,	%f0
loop_398:
	nop
	setx	0x331DC158,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x9E95E9BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f26,	%f20
loop_399:
	call	loop_400
	movlg	%fcc3,	%o7,	%g2
	nop
	fitod	%f2,	%f6
	fdtoi	%f6,	%f11
	nop
	setx loop_401, %l0, %l1
	jmpl %l1, %o2
loop_400:
	call	loop_402
	call	loop_403
	call	loop_404
loop_401:
	call	loop_405
loop_402:
	alignaddr	%i4,	%i2,	%l0
loop_403:
	edge8	%l5,	%i3,	%g6
loop_404:
	movcc	%icc,	0x719,	%i1
loop_405:
	movo	%fcc3,	%i7,	%o0
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f29
	call	loop_406
	call	loop_407
	tne	%xcc,	0x7
	fmovsul	%fcc0,	%f9,	%f28
loop_406:
	fnor	%f16,	%f26,	%f26
loop_407:
	bl	%icc,	loop_408
	fone	%f30
	popc	%g5,	%o6
	fones	%f10
loop_408:
	call	loop_409
	nop
	fitos	%f19,	%f26
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x188D,	%l0,	%o4
	udiv	%g7,	%o4,	%l4
loop_409:
	call	loop_410
	sll	%l2,	0x07,	%o5
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x18] %asi,	%o1
loop_410:
	subccc	%g4,	%g1,	%o3
	std	%i0,	[%l7 + 0x50]
	andn	%l1,	%i6,	%i5
	call	loop_411
	tleu	%icc,	0x1
	tpos	%icc,	0x5
	fble,pn	%fcc3,	loop_412
loop_411:
	tpos	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	array8	%l6,	%o7,	%g2
loop_412:
	lduw	[%l7 + 0x28],	%i4
	move	%fcc1,	0x13B,	%i2
	ld	[%l7 + 0x3C],	%f21
	wrpr	%l0,	%o2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC4D, 	%hsys_tick_cmpr
	call	loop_413
	nop
	setx	0x0490,	%l0,	%g6
	udivx	%l5,	%g6,	%i1
	fmovrsne	%i7,	%f11,	%f27
	sra	%g5,	0x00,	%o0
loop_413:
	nop
	setx loop_414, %l0, %l1
	jmpl %l1, %o6
	rdhpr	%hpstate,	%o4
	call	loop_415
	fcmpgt32	%f20,	%f12,	%l4
loop_414:
	fmovdue	%fcc3,	%f0,	%f28
	fbge,pt	%fcc0,	loop_416
loop_415:
	bne,a	%xcc,	loop_417
	array16	%g7,	%l2,	%o5
	for	%f8,	%f22,	%f16
loop_416:
	fmovsue	%fcc1,	%f20,	%f6
loop_417:
	movg	%icc,	0x39B,	%g4
	subcc	%g1,	%o1,	%i0
	call	loop_418
	call	loop_419
	call	loop_420
	fmovsug	%fcc0,	%f3,	%f0
loop_418:
	fmuld8sux16	%f26,	%f13,	%f12
loop_419:
	fba,a,pn	%fcc3,	loop_421
loop_420:
	srlx	%l1,	0x07,	%o3
	tcc	%icc,	0x2
	nop
	setx	0x1044,	%l0,	%i5
	sdivcc	%i6,	%i5,	%l3
loop_421:
	fpsub32s	%f11,	%f8,	%f7
	addcc	%g3,	0x00FD,	%l6
	fpsub32	%f22,	%f8,	%f16
	call	loop_422
	call	loop_423
	fba,a	%fcc1,	loop_424
	xorcc	%g2,	%o7,	%i4
loop_422:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_423:
	tcc	%xcc,	0x4
loop_424:
	fmovdl	%icc,	%f30,	%f6
	call	loop_425
	fandnot1	%f20,	%f16,	%f6
	fmovrdgz	%o2,	%f4,	%f18
	array16	%i3,	%i2,	%l5
loop_425:
	call	loop_426
	fblg	%fcc0,	loop_427
	sub	%i1,	0x02B1,	%g6
	fmul8sux16	%f12,	%f14,	%f6
loop_426:
	movrlz	%i7,	0x2E7,	%g5
loop_427:
	popc	0x16D5,	%o0
	call	loop_428
	fbul,a	%fcc0,	loop_429
	movlg	%fcc3,	%o6,	%o4
	call	loop_430
loop_428:
	faligndata	%f30,	%f6,	%f4
loop_429:
	tg	%xcc,	0x6
	tsubcctv	%g7,	0x0A5A,	%l4
loop_430:
	umulcc	%o5,	%g4,	%g1
	call	loop_431
	call	loop_432
	nop
	set	0x0E, %o7
	sth	%o1,	[%l7 + %o7]
	brlez,a	%i0,	loop_433
loop_431:
	fmovrdne	%l2,	%f30,	%f4
loop_432:
	call	loop_434
	call	loop_435
loop_433:
	call	loop_436
	fnands	%f28,	%f13,	%f15
loop_434:
	rdpr	%gl,	%l1
loop_435:
	call	loop_437
loop_436:
	xnorcc	%i6,	0x17C3,	%i5
	fmovdne	%fcc1,	%f14,	%f18
	te	%icc,	0x2
loop_437:
	fpadd32s	%f21,	%f16,	%f15
	call	loop_438
	smulcc	%o3,	%g3,	%l3
	call	loop_439
	fmovsn	%icc,	%f22,	%f30
loop_438:
	fbe,a,pn	%fcc3,	loop_440
	for	%f28,	%f8,	%f2
loop_439:
	call	loop_441
	fmuld8sux16	%f26,	%f31,	%f14
loop_440:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fsrc1	%f16,	%f6
loop_441:
	st	%f0,	[%l7 + 0x38]
	set	0x7E, %l0
	ldsha	[%l7 + %l0] 0x18,	%l6
	sub	%g2,	%o7,	%i4
	fmovsvc	%xcc,	%f9,	%f11
	nop
	fitos	%f5,	%f21
	fstox	%f21,	%f8
	fxtos	%f8,	%f12
	wr	%o2,	%i3,	%set_softint
	fmovscc	%icc,	%f18,	%f15
	fmovdul	%fcc0,	%f22,	%f0
	fnand	%f0,	%f24,	%f16
	fmovsleu	%icc,	%f19,	%f23
	orncc	%l0,	0x1FF4,	%l5
	array16	%i2,	%g6,	%i7
	call	loop_442
	srlx	%i1,	%g5,	%o6
	fcmpgt32	%f24,	%f12,	%o0
	fnand	%f28,	%f30,	%f26
loop_442:
	edge32ln	%o4,	%l4,	%g7
	wr	%g4,	%o5,	%softint
	call	loop_443
	tvc	%xcc,	0x1
	fnegs	%f5,	%f6
	edge32ln	%o1,	%i0,	%g1
loop_443:
	call	loop_444
	fmovso	%fcc2,	%f14,	%f21
	udivx	%l1,	0x1C48,	%l2
	mulx	%i5,	%o3,	%i6
loop_444:
	nop
	wr	%g0,	0x22,	%asi
	stha	%g3,	[%l7 + 0x3E] %asi
	membar	#Sync
	bmask	%l6,	%l3,	%o7
	call	loop_445
	add	%g2,	%i4,	%o2
	fmovslg	%fcc2,	%f22,	%f10
	call	loop_446
loop_445:
	addccc	%l0,	%i3,	%l5
	rdhpr	%ver,	%g6
	set	0x35, %o1
	lduba	[%l7 + %o1] 0x19,	%i7
loop_446:
	call	loop_447
	call	loop_448
	fbul,a,pt	%fcc2,	loop_449
	call	loop_450
loop_447:
	call	loop_451
loop_448:
	rd	%pc,	%i2
loop_449:
	umul	%g5,	0x17A4,	%i1
loop_450:
	fmovdn	%fcc3,	%f4,	%f28
loop_451:
	call	loop_452
	nop
	setx	0x06BDE29A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x5F64A219,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f2,	%f17
	subccc	%o0,	%o4,	%o6
	fsrc1	%f0,	%f30
loop_452:
	brz,a,pt	%l4,	loop_453
	ldx	[%l7 + 0x10],	%g4
	fmovdge	%icc,	%f6,	%f28
	umul	%o5,	%o1,	%g7
loop_453:
	call	loop_454
	tge	%icc,	0x3
	set	0x110, %l6
	stxa	%i0,	[%g0 + %l6] 0x52
loop_454:
	call	loop_455
	orncc	%g1,	0x1995,	%l1
	fmovdu	%fcc0,	%f16,	%f0
	rd	%ccr,	%i5
loop_455:
	call	loop_456
	fpadd32s	%f18,	%f19,	%f25
	call	loop_457
	fmovsuge	%fcc2,	%f8,	%f30
loop_456:
	rdpr	%gl,	%o3
	fxnors	%f7,	%f25,	%f30
loop_457:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_458
	addc	%g3,	%l2,	%l3
	call	loop_459
	tvc	%icc,	0x5
loop_458:
	call	loop_460
	call	loop_461
loop_459:
	call	loop_462
	orcc	%o7,	%g2,	%l6
loop_460:
	subcc	%o2,	0x198A,	%i4
loop_461:
	fxnor	%f30,	%f28,	%f22
loop_462:
	bvc,pt	%xcc,	loop_463
	xnorcc	%i3,	%l0,	%g6
	sir	0x0F5A
	edge16l	%i7,	%l5,	%g5
loop_463:
	te	%xcc,	0x2
	call	loop_464
	call	loop_465
	movrne	%i2,	0x31E,	%o0
	tsubcctv	%o4,	0x1CBC,	%i1
loop_464:
	bl	%icc,	loop_466
loop_465:
	rd	%y,	%l4
	call	loop_467
	or	%o6,	0x13D4,	%g4
loop_466:
	movuge	%fcc3,	0x0D3,	%o1
	fabsd	%f2,	%f26
loop_467:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 19
!	Type a   	: 31
!	Type x   	: 10
!	Type cti   	: 160
!	Type f   	: 133
!	Type i   	: 147
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
	set	0x0,	%g1
	set	0x3,	%g2
	set	0x8,	%g3
	set	0x1,	%g4
	set	0x6,	%g5
	set	0xB,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xF,	%i1
	set	-0xB,	%i2
	set	-0xC,	%i3
	set	-0x1,	%i4
	set	-0x8,	%i5
	set	-0xD,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x376B973A,	%l0
	set	0x5C721218,	%l1
	set	0x104CED22,	%l2
	set	0x328F1693,	%l3
	set	0x1BCF59ED,	%l4
	set	0x483C358D,	%l5
	set	0x75A41A13,	%l6
	!# Output registers
	set	-0x0A0E,	%o0
	set	-0x0EC2,	%o1
	set	-0x0EE5,	%o2
	set	-0x1688,	%o3
	set	-0x0C86,	%o4
	set	0x189F,	%o5
	set	0x1293,	%o6
	set	0x1968,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	call	loop_468
	movre	%o5,	%i0,	%g1
	call	loop_469
	tn	%xcc,	0x2
loop_468:
	fnors	%f29,	%f16,	%f20
	fmuld8sux16	%f31,	%f20,	%f24
loop_469:
	fcmped	%fcc2,	%f16,	%f6
	call	loop_470
	taddcctv	%g7,	%l1,	%o3
	call	loop_471
	fmovsleu	%xcc,	%f14,	%f29
loop_470:
	rdpr	%otherwin,	%i5
	fands	%f7,	%f9,	%f30
loop_471:
	movlg	%fcc1,	%i6,	%g3
	nop
	fitos	%f5,	%f5
	fstod	%f5,	%f18
	bl,a,pn	%xcc,	loop_472
	call	loop_473
	fmovse	%icc,	%f26,	%f10
	brlez,a	%l2,	loop_474
loop_472:
	nop
	setx	0x8BC17F82E0279919,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x38197AD80AA774B3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f28,	%f2
loop_473:
	nop
	fitos	%f7,	%f27
	smul	%o7,	%g2,	%l6
loop_474:
	call	loop_475
	rdhpr	%htba,	%l3
	nop
	setx	0x1A28,	%l0,	%o2
	udiv	%i4,	%o2,	%i3
	call	loop_476
loop_475:
	call	loop_477
	nop
	fitos	%f16,	%f8
	fornot1	%f14,	%f28,	%f22
loop_476:
	fone	%f10
loop_477:
	call	loop_478
	fmovrdlez	%g6,	%f6,	%f0
	set	0x360, %g6
!!	ldxa	[%g0 + %g6] 0x40,	%l0
loop_478:
	fxnor	%f24,	%f6,	%f6
	fcmpne32	%f14,	%f16,	%l5
	fmovrdgz	%g5,	%f22,	%f24
	rd	%ccr,	%i7
	call	loop_479
	fmovduge	%fcc1,	%f20,	%f16
	smulcc	%o0,	0x1E9C,	%i2
	nop
	fitod	%f4,	%f6
	fdtos	%f6,	%f29
loop_479:
	nop
	setx	0xE0978F57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xAEE103BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f10,	%f12
	call	loop_480
	movl	%xcc,	0x3F4,	%o4
	mova	%icc,	%i1,	%l4
	tpos	%xcc,	0x2
loop_480:
	addcc	%o6,	%o1,	%g4
	call	loop_481
	call	loop_482
	fmovsg	%fcc2,	%f13,	%f2
	rd	%softint,	%i0
loop_481:
	fmovda	%icc,	%f20,	%f30
loop_482:
	call	loop_483
	nop
	setx	0x778AEFC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x55576386,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f24,	%f27
	nop
	set	0x60, %o0
	std	%f30,	[%l7 + %o0]
	call	loop_484
loop_483:
	fornot1	%f28,	%f24,	%f4
	and	%o5,	0x0305,	%g7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd1,	%f16
loop_484:
	sdivcc	%g1,	0x0EA1,	%o3
	fsrc1s	%f19,	%f16
	call	loop_485
	call	loop_486
	subc	%l1,	0x0DAF,	%i5
	movrlz	%i6,	%l2,	%o7
loop_485:
	fornot2s	%f27,	%f29,	%f31
loop_486:
	movuge	%fcc0,	0x764,	%g3
	fbge,a,pt	%fcc3,	loop_487
	fmovsne	%icc,	%f20,	%f0
	smul	%g2,	0x0A26,	%l6
	fcmps	%fcc2,	%f7,	%f29
loop_487:
	andn	%l3,	0x01F6,	%o2
	wrpr 	%g0, 	0x1, 	%gl
	fmovsle	%xcc,	%f13,	%f25
	tpos	%xcc,	0x2
	fmovsule	%fcc1,	%f11,	%f4
	tl	%xcc,	0x1
	rdhpr	%hpstate,	%i4
	fzero	%f24
	wr	%g0,	0x21,	%asi
	stxa	%l5,	[%g0 + 0x8] %asi
	fpmerge	%f25,	%f22,	%f12
	fmovdl	%icc,	%f24,	%f22
	edge16n	%g5,	%l0,	%o0
	bshuffle	%f30,	%f4,	%f28
	call	loop_488
	nop
	setx	0xD77EF48C,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	call	loop_489
	srl	%i7,	%i2,	%i1
loop_488:
	call	loop_490
	call	loop_491
loop_489:
	flushw
	movrgz	%l4,	%o6,	%o4
loop_490:
	fabss	%f12,	%f23
loop_491:
	call	loop_492
	fmovsa	%xcc,	%f3,	%f6
	set	0x5C, %i4
	lduha	[%l7 + %i4] 0x0c,	%o1
loop_492:
	call	loop_493
	orn	%g4,	%i0,	%g7
	tsubcc	%g1,	%o5,	%l1
	nop
	setx	0x50DCF7EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_493:
	movg	%icc,	0x316,	%o3
	nop
	setx	loop_494,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001400001400,	%l0,	%l1
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
	call	loop_495
	call	loop_496
	call	loop_497
loop_494:
	call	loop_498
loop_495:
	call	loop_499
loop_496:
	nop
	fitos	%f12,	%f22
	fstoi	%f22,	%f25
loop_497:
	tleu	%xcc,	0x2
loop_498:
	fcmped	%fcc2,	%f16,	%f14
loop_499:
	call	loop_500
	fmovsge	%fcc0,	%f22,	%f0
	movu	%fcc3,	%i6,	%l2
	call	loop_501
loop_500:
	fandnot2	%f18,	%f16,	%f30
	sdivcc	%o7,	0x01D8,	%g3
	edge8ln	%g2,	%l6,	%i5
loop_501:
	fmuld8ulx16	%f9,	%f1,	%f2
	ta	%icc,	0x7
	tne	%xcc,	0x5
	tcc	%xcc,	0x3
	call	loop_502
	tl	%xcc,	0x1
	fmovrse	%o2,	%f6,	%f16
	fmovdpos	%xcc,	%f24,	%f22
loop_502:
	rdpr	%canrestore,	%l3
	call	loop_503
	movge	%icc,	0x304,	%i3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32	%i4,	%g6,	%l5
loop_503:
	fmovdcs	%icc,	%f28,	%f8
	call	loop_504
	std	%g4,	[%l7 + 0x40]
	call	loop_505
	call	loop_506
loop_504:
	nop
	fitos	%f31,	%f7
	call	loop_507
loop_505:
	fxnor	%f20,	%f6,	%f8
loop_506:
	fmovsuge	%fcc2,	%f3,	%f19
	fandnot2	%f22,	%f24,	%f22
loop_507:
	fmovdug	%fcc2,	%f20,	%f4
	call	loop_508
	fmovsue	%fcc2,	%f8,	%f3
	call	loop_509
	fcmped	%fcc3,	%f4,	%f6
loop_508:
	fmovdule	%fcc2,	%f8,	%f28
	call	loop_510
loop_509:
	fmovsneg	%icc,	%f14,	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_511
loop_510:
	fcmple32	%f8,	%f2,	%o0
	fsrc1	%f26,	%f16
	xnorcc	%i2,	%l4,	%o6
loop_511:
	fmovsvc	%xcc,	%f5,	%f20
	movvc	%icc,	%i1,	%o4
	call	loop_512
	call	loop_513
	rdhpr	%hsys_tick_cmpr,	%o1
	call	loop_514
loop_512:
	movre	%g4,	0x301,	%g7
loop_513:
	fnegd	%f8,	%f4
	fcmpd	%fcc2,	%f18,	%f6
loop_514:
	fbge,a	%fcc2,	loop_515
	call	loop_516
	fmovso	%fcc3,	%f12,	%f23
	ldd	[%l7 + 0x48],	%i0
loop_515:
	udiv	%o5,	0x13B3,	%g1
loop_516:
	rdpr	%cansave,	%l1
	fmul8x16	%f26,	%f10,	%f8
	tl	%xcc,	0x4
	fandnot2	%f20,	%f24,	%f28
	smul	%i6,	0x1619,	%o3
	edge8	%o7,	%l2,	%g2
	movu	%fcc1,	0x15D,	%g3
	fcmple32	%f28,	%f26,	%l6
	movvs	%icc,	%i5,	%o2
	sllx	%i3,	0x00,	%l3
	call	loop_517
	fmul8x16au	%f3,	%f23,	%f28
	movg	%fcc2,	0x48C,	%g6
	srlx	%i4,	%l5,	%g5
loop_517:
	nop
	fitos	%f3,	%f21
	fstox	%f21,	%f16
	fxtos	%f16,	%f9
	call	loop_518
	fornot1	%f0,	%f24,	%f8
	fmovdvs	%icc,	%f28,	%f16
	fbu,pn	%fcc2,	loop_519
loop_518:
	fcmpeq32	%f26,	%f28,	%i7
	call	loop_520
	fmuld8ulx16	%f2,	%f9,	%f10
loop_519:
	call	loop_521
	call	loop_522
loop_520:
	fmovde	%fcc1,	%f14,	%f20
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x11,	 3
loop_521:
	call	loop_523
loop_522:
	nop
	setx	0x993A48E55D4AE1F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f14
	stbar
	fbge,a	%fcc2,	loop_524
loop_523:
	movrgez	%l0,	%l4,	%i2
	fornot2	%f2,	%f8,	%f8
	call	loop_525
loop_524:
	call	loop_526
	fmovrsne	%o6,	%f0,	%f5
	call	loop_527
loop_525:
	xnorcc	%i1,	%o1,	%g4
loop_526:
	fmuld8ulx16	%f0,	%f16,	%f30
	fxnor	%f6,	%f0,	%f0
loop_527:
	call	loop_528
	call	loop_529
	srlx	%o4,	0x17,	%g7
	fcmpeq32	%f2,	%f20,	%o5
loop_528:
	call	loop_530
loop_529:
	fmovdcc	%xcc,	%f16,	%f10
	fbue,pt	%fcc3,	loop_531
	fxor	%f22,	%f20,	%f10
loop_530:
	rd	%asi,	%g1
	umulcc	%i0,	%i6,	%o3
loop_531:
	movre	%l1,	0x3F8,	%o7
	fmovsge	%xcc,	%f13,	%f30
	edge8n	%l2,	%g3,	%l6
	fcmple16	%f8,	%f22,	%g2
	nop
	setx	0xEDEEFEF018B50194,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f10
	tsubcc	%i5,	0x1528,	%o2
	call	loop_532
	tpos	%xcc,	0x2
	nop
	setx	0x29928B59,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x7F7DD4CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f20,	%f10
	nop
	set	0x3F, %g2
	ldub	[%l7 + %g2],	%i3
loop_532:
	nop
	set	0x78, %l4
	stda	%g6,	[%l7 + %l4] 0x11
	fmovsne	%fcc0,	%f20,	%f16
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x12] %asi,	%l3
	fpsub16	%f6,	%f14,	%f10
	nop
	setx	0x096C801E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA5803D9F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f18,	%f7
	call	loop_533
	ta	%icc,	0x2
	call	loop_534
	bpos	%icc,	loop_535
loop_533:
	call	loop_536
	nop
	setx	0xB4741DB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f14
loop_534:
	edge32ln	%l5,	%g5,	%i7
loop_535:
	call	loop_537
loop_536:
	call	loop_538
	fabss	%f27,	%f10
	call	loop_539
loop_537:
	wr	%o0,	%i4,	%set_softint
loop_538:
	fornot1s	%f27,	%f23,	%f12
	fxors	%f6,	%f19,	%f23
loop_539:
	edge16l	%l4,	%l0,	%o6
	fmovso	%fcc1,	%f8,	%f4
	ble	%xcc,	loop_540
	call	loop_541
	sll	%i2,	%o1,	%g4
	nop
	fitos	%f6,	%f6
loop_540:
	movrlz	%o4,	0x158,	%i1
loop_541:
	call	loop_542
	umulcc	%g7,	0x0555,	%g1
	edge32ln	%i0,	%i6,	%o3
	fbe,pt	%fcc3,	loop_543
loop_542:
	fbo	%fcc3,	loop_544
	call	loop_545
	call	loop_546
loop_543:
	fmovde	%icc,	%f24,	%f24
loop_544:
	call	loop_547
loop_545:
	fnegs	%f8,	%f27
loop_546:
	call	loop_548
	nop
	set	0x54, %o5
	lduh	[%l7 + %o5],	%l1
loop_547:
	fmovrdne	%o7,	%f10,	%f28
	fmovrsne	%l2,	%f10,	%f15
loop_548:
	call	loop_549
	call	loop_550
	call	loop_551
	rd	%ccr,	%o5
loop_549:
	fpack32	%f4,	%f20,	%f26
loop_550:
	alignaddrl	%l6,	%g2,	%i5
loop_551:
	alignaddrl	%g3,	%o2,	%g6
	alignaddr	%i3,	%l5,	%g5
	call	loop_552
	call	loop_553
	xorcc	%i7,	%l3,	%i4
	and	%l4,	0x0404,	%o0
loop_552:
	fmovdule	%fcc3,	%f2,	%f28
loop_553:
	tsubcc	%o6,	0x1C19,	%l0
	fnors	%f17,	%f25,	%f1
	fmovdul	%fcc1,	%f30,	%f26
	call	loop_554
	fmovsge	%xcc,	%f28,	%f8
	fmovdge	%icc,	%f8,	%f22
	call	loop_555
loop_554:
	wr	%i2,	%g4,	%sys_tick
	fnand	%f18,	%f20,	%f12
	fmovdvc	%xcc,	%f26,	%f2
loop_555:
	rdhpr	%hsys_tick_cmpr,	%o1
	fnegd	%f16,	%f22
	wrpr	%i1,	%o4,	%pil
	smulcc	%g1,	%g7,	%i0
	tn	%icc,	0x4
	fmovse	%icc,	%f13,	%f31
	call	loop_556
	call	loop_557
	bmask	%o3,	%i6,	%o7
	faligndata	%f26,	%f22,	%f10
loop_556:
	sir	0x0CB7
loop_557:
	fmovrslz	%l2,	%f28,	%f8
	call	loop_558
	call	loop_559
	srax	%l1,	0x00,	%l6
	set	0x08, %o6
	lduha	[%l7 + %o6] 0x0c,	%o5
loop_558:
	nop
	setx	0xBD6BD825,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x46C234F2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f24,	%f0
loop_559:
	call	loop_560
	movvs	%xcc,	0x5AE,	%g2
	fzeros	%f15
	call	loop_561
loop_560:
	movn	%icc,	0x01A,	%i5
	andn	%g3,	0x0216,	%o2
	call	loop_562
loop_561:
	call	loop_563
	wrpr 	%g0, 	0x1, 	%gl
	fmovdleu	%xcc,	%f14,	%f18
loop_562:
	fandnot1	%f24,	%f2,	%f18
loop_563:
	call	loop_564
	popc	0x1E6B,	%g6
	fbn,a	%fcc0,	loop_565
	fmovdu	%fcc2,	%f2,	%f18
loop_564:
	subc	%i7,	%g5,	%i4
	fmovsvc	%xcc,	%f19,	%f13
loop_565:
	ldd	[%l7 + 0x48],	%l2
	rd	%softint,	%o0
	add	%l4,	0x1208,	%o6
	fones	%f22
	fpackfix	%f10,	%f20
	call	loop_566
	tvc	%icc,	0x5
	tvc	%xcc,	0x2
	fmovsge	%xcc,	%f25,	%f6
loop_566:
	subc	%l0,	0x0BA8,	%g4
	fble,a,pn	%fcc3,	loop_567
	brgz,a	%o1,	loop_568
	call	loop_569
	call	loop_570
loop_567:
	nop
	set	0x62, %o2
	sth	%i2,	[%l7 + %o2]
loop_568:
	fornot1	%f30,	%f28,	%f26
loop_569:
	nop
	fitos	%f0,	%f30
	fstod	%f30,	%f24
loop_570:
	faligndata	%f0,	%f6,	%f16
	fmovdul	%fcc2,	%f6,	%f28
	sll	%o4,	%i1,	%g7
	fcmpd	%fcc1,	%f6,	%f8
	fmovsue	%fcc2,	%f14,	%f7
	movul	%fcc3,	0x7A7,	%i0
	fmovsa	%fcc0,	%f26,	%f12
	addcc	%g1,	%o3,	%o7
	fnors	%f19,	%f18,	%f2
	fmovrsgz	%l2,	%f27,	%f26
	movvc	%xcc,	%i6,	%l1
	nop
	fitos	%f14,	%f25
	fstoi	%f25,	%f30
	nop
	fitod	%f4,	%f10
	fcmpgt16	%f14,	%f0,	%l6
	call	loop_571
	fornot1	%f18,	%f24,	%f24
	call	loop_572
	xnor	%g2,	%i5,	%g3
loop_571:
	fbg,a	%fcc0,	loop_573
	for	%f0,	%f22,	%f30
loop_572:
	fors	%f17,	%f31,	%f3
	fmovdle	%xcc,	%f26,	%f30
loop_573:
	movul	%fcc0,	%o2,	%i3
	nop
	fitod	%f8,	%f14
	fdtoi	%f14,	%f0
	fmovsuge	%fcc2,	%f5,	%f24
	movlg	%fcc1,	0x05E,	%l5
	call	loop_574
	nop
	setx	0xFB5AF6C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f10
	movu	%fcc0,	%g6,	%i7
	call	loop_575
loop_574:
	nop
	setx	0x15C6BD3D49AE7A0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x1F6B80593D6FE5A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f10
	call	loop_576
	call	loop_577
loop_575:
	call	loop_578
	nop
	fitod	%f22,	%f28
loop_576:
	fsrc1	%f24,	%f24
loop_577:
	fornot2	%f26,	%f28,	%f6
loop_578:
	fxnors	%f16,	%f28,	%f26
	set	0x2C, %l5
	sta	%f20,	[%l7 + %l5] 0x18
	bgu	%xcc,	loop_579
	subccc	%o5,	0x06C9,	%g5
	call	loop_580
	fnot1s	%f24,	%f17
loop_579:
	fcmpgt16	%f28,	%f28,	%l3
	call	loop_581
loop_580:
	srax	%i4,	0x02,	%l4
	tg	%xcc,	0x6
	call	loop_582
loop_581:
	fmovsule	%fcc3,	%f5,	%f9
	sllx	%o0,	%l0,	%g4
	brz,a,pt	%o6,	loop_583
loop_582:
	nop
	setx	0xC6A6C10190366BDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f6
	popc	%i2,	%o4
	call	loop_584
loop_583:
	move	%fcc1,	%o1,	%i1
	std	%i0,	[%l7 + 0x38]
	fone	%f24
loop_584:
	wrpr	%g7,	0x05C2,	%tick
	brgez,pn	%o3,	loop_585
	fmovsuge	%fcc0,	%f4,	%f0
	call	loop_586
	rdpr	%cwp,	%g1
loop_585:
	fandnot2s	%f20,	%f23,	%f24
	sir	0x02BF
loop_586:
	nop
	setx	0xBC9172982C5AB1BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4348FD8786B0EB4E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f22,	%f4
	fbn	%fcc1,	loop_587
	call	loop_588
	call	loop_589
	nop
	setx	0xA2587BD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xD76E8876,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f25,	%f13
loop_587:
	udiv	%l2,	0x02FA,	%o7
loop_588:
	ldstub	[%l7 + 0x11],	%i6
loop_589:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sub	%g2,	%g3,	%i5
	fmovdue	%fcc0,	%f6,	%f30
	fmovdle	%xcc,	%f18,	%f10
	nop
	setx	0x4B3B92A073B1FF9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3F78CE74,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f14,	%f24
	tcc	%xcc,	0x7
	sub	%o2,	%l5,	%i3
	movo	%fcc2,	%i7,	%g6
	tn	%xcc,	0x7
	call	loop_590
	umulcc	%g5,	%l3,	%o5
	movl	%fcc3,	0x6C4,	%l4
	movo	%fcc3,	%i4,	%o0
loop_590:
	movue	%fcc0,	%l0,	%g4
	call	loop_591
	nop
	setx	0x6F399845,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fpsub32	%f26,	%f10,	%f18
	call	loop_592
loop_591:
	udiv	%i2,	0x146F,	%o6
	fmovdle	%fcc1,	%f18,	%f0
	rdpr	%wstate,	%o4
loop_592:
	fmovspos	%icc,	%f31,	%f3
	call	loop_593
	fmovdule	%fcc1,	%f22,	%f22
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_594
loop_593:
	movn	%fcc0,	0x127,	%o1
	edge16n	%i0,	%g7,	%i1
	wrpr 	%g0, 	0x3, 	%gl
loop_594:
	call	loop_595
	fmul8x16	%f1,	%f20,	%f22
	fmovsn	%fcc2,	%f16,	%f15
	fcmped	%fcc0,	%f4,	%f22
loop_595:
	sethi	0x0EB5,	%o7
	fnot2s	%f26,	%f5
	fone	%f22
	nop
	setx	loop_596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%g1,	%l6,	%i6
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f22
	fones	%f29
loop_596:
	fcmpeq16	%f20,	%f28,	%l1
	orn	%g2,	%g3,	%o2
	wrpr	%i5,	0x00B4,	%pil
	bcs	%xcc,	loop_597
	bcc,pt	%icc,	loop_598
	tsubcctv	%l5,	%i3,	%i7
	movvc	%xcc,	0x4D2,	%g6
loop_597:
	wrpr	%l3,	%o5,	%pil
loop_598:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l4
	fxnor	%f28,	%f22,	%f20
	fbul	%fcc0,	loop_599
	call	loop_600
	nop
	fitos	%f6,	%f4
	fstox	%f4,	%f12
	bneg	%xcc,	loop_601
loop_599:
	popc	0x1FF2,	%i4
loop_600:
	fzeros	%f9
	call	loop_602
loop_601:
	call	loop_603
	srax	%o0,	0x1E,	%l0
	bleu,a,pt	%xcc,	loop_604
loop_602:
	sdiv	%g4,	0x08AA,	%i2
loop_603:
	fmovrdgez	%o6,	%f28,	%f12
	call	loop_605
loop_604:
	call	loop_606
	movue	%fcc1,	%o4,	%o1
	call	loop_607
loop_605:
	nop
	setx	0x07A1,	%l0,	%g7
	sdivcc	%g5,	%g7,	%i0
loop_606:
	call	loop_608
	fsrc1s	%f2,	%f19
loop_607:
	rdpr	%cwp,	%o3
	rdpr	%cansave,	%i1
loop_608:
	bcs	%xcc,	loop_609
	srax	%o7,	%l2,	%l6
	andn	%g1,	0x1DFD,	%i6
	flush	%l7 + 0x64
loop_609:
	smul	%l1,	%g3,	%g2
	rdhpr	%ver,	%o2
	fnegd	%f22,	%f16
	nop
	setx	0x53ED167DE565148D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 25
!	Type a   	: 28
!	Type x   	: 10
!	Type cti   	: 142
!	Type f   	: 168
!	Type i   	: 127
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
	set	0xF,	%g2
	set	0xD,	%g3
	set	0xF,	%g4
	set	0x1,	%g5
	set	0x0,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x3,	%i1
	set	-0x6,	%i2
	set	-0x9,	%i3
	set	-0xC,	%i4
	set	-0xF,	%i5
	set	-0x3,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x15BE3946,	%l0
	set	0x1F1E2162,	%l1
	set	0x2CC2D836,	%l2
	set	0x20439192,	%l3
	set	0x0FE58D5F,	%l4
	set	0x3632456D,	%l5
	set	0x5BB283B8,	%l6
	!# Output registers
	set	0x063A,	%o0
	set	-0x1B15,	%o1
	set	0x06E9,	%o2
	set	-0x1271,	%o3
	set	-0x022C,	%o4
	set	0x0FC0,	%o5
	set	-0x1EB1,	%o6
	set	-0x05DC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	nop
	setx	0x059B,	%l0,	%l5
	udivcc	%i5,	%l5,	%i7
	st	%f16,	[%l7 + 0x50]
	call	loop_610
	call	loop_611
	call	loop_612
	umulcc	%i3,	0x08CD,	%l3
loop_610:
	edge8n	%o5,	%g6,	%i4
loop_611:
	array32	%l4,	%l0,	%o0
loop_612:
	nop
	setx	0x08E0,	%l0,	%o6
	sdiv	%g4,	%o6,	%o4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_613
	fmovsge	%xcc,	%f11,	%f21
	movue	%fcc1,	%o1,	%g5
	tneg	%icc,	0x3
loop_613:
	fcmpne32	%f0,	%f26,	%i2
	movleu	%xcc,	0x04F,	%i0
	call	loop_614
	fmovsug	%fcc3,	%f18,	%f6
	call	loop_615
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f13
loop_614:
	nop
	set	0x0A, %g4
	lduh	[%l7 + %g4],	%g7
	fnot2s	%f21,	%f12
loop_615:
	ldsw	[%l7 + 0x18],	%i1
	fbe	%fcc3,	loop_616
	movlg	%fcc2,	%o7,	%l2
	call	loop_617
	call	loop_618
loop_616:
	call	loop_619
	call	loop_620
loop_617:
	movl	%fcc3,	0x73A,	%l6
loop_618:
	movue	%fcc3,	0x23F,	%o3
loop_619:
	nop
	fitos	%f4,	%f29
	fstox	%f29,	%f4
	fxtos	%f4,	%f15
loop_620:
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f30
	fbe	%fcc2,	loop_621
	tg	%icc,	0x2
	call	loop_622
	call	loop_623
loop_621:
	fxnor	%f8,	%f18,	%f10
	movrlez	%i6,	%g1,	%g3
loop_622:
	call	loop_624
loop_623:
	call	loop_625
	fmovdul	%fcc1,	%f12,	%f28
	fxor	%f16,	%f0,	%f4
loop_624:
	ta	%xcc,	0x4
loop_625:
	nop
	set	0x10, %i1
	sta	%f26,	[%l7 + %i1] 0x0c
	xorcc	%l1,	%o2,	%g2
	nop
	setx	0xC631F34E03783FDA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f8
	ld	[%l7 + 0x68],	%f6
	call	loop_626
	ldstub	[%l7 + 0x70],	%l5
	alignaddr	%i7,	%i3,	%l3
	edge16n	%i5,	%g6,	%o5
loop_626:
	call	loop_627
	edge32n	%l4,	%l0,	%i4
	movuge	%fcc3,	0x198,	%g4
	fcmpne16	%f14,	%f18,	%o0
loop_627:
	swap	[%l7 + 0x68],	%o6
	fbo,a	%fcc1,	loop_628
	ldub	[%l7 + 0x44],	%o1
	call	loop_629
	nop
	set	0x12, %i7
	ldsb	[%l7 + %i7],	%o4
loop_628:
	call	loop_630
	tpos	%icc,	0x2
loop_629:
	call	loop_631
	nop
	fitos	%f10,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f31
loop_630:
	call	loop_632
	membar	0x4C
loop_631:
	fmovsl	%xcc,	%f9,	%f22
	fmovdge	%fcc3,	%f26,	%f6
loop_632:
	call	loop_633
	call	loop_634
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f14
	fxtod	%f14,	%f16
	orcc	%g5,	%i0,	%i2
loop_633:
	call	loop_635
loop_634:
	call	loop_636
	call	loop_637
	te	%xcc,	0x1
loop_635:
	edge8ln	%i1,	%g7,	%l2
loop_636:
	orn	%o7,	0x0575,	%o3
loop_637:
	xorcc	%l6,	0x1B78,	%i6
	call	loop_638
	fandnot1	%f18,	%f20,	%f2
	fmovdge	%fcc1,	%f8,	%f22
	taddcc	%g3,	%l1,	%o2
loop_638:
	call	loop_639
	call	loop_640
	nop
	set	0x44, %i2
	ldstub	[%l7 + %i2],	%g1
	nop
	fitos	%f11,	%f16
loop_639:
	fcmpne16	%f22,	%f8,	%g2
loop_640:
	movo	%fcc1,	%i7,	%i3
	fmovdn	%fcc0,	%f12,	%f0
	call	loop_641
	addccc	%l5,	%l3,	%i5
	ldd	[%l7 + 0x28],	%f16
	call	loop_642
loop_641:
	alignaddr	%o5,	%g6,	%l4
	movl	%xcc,	0x4B9,	%i4
	sub	%l0,	0x0F79,	%g4
loop_642:
	subc	%o0,	%o1,	%o4
	movu	%fcc1,	0x34E,	%g5
	call	loop_643
	xorcc	%o6,	%i2,	%i0
	add	%g7,	%l2,	%i1
	nop
	setx	0x003F82AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xBDC20F89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f23,	%f21
loop_643:
	fmul8sux16	%f14,	%f16,	%f26
	array8	%o7,	%o3,	%i6
	addc	%l6,	0x1AAE,	%l1
	call	loop_644
	fcmpd	%fcc0,	%f24,	%f10
	fcmpgt32	%f20,	%f14,	%g3
	fmovdlg	%fcc0,	%f30,	%f30
loop_644:
	tvs	%xcc,	0x7
	call	loop_645
	fmovsue	%fcc3,	%f23,	%f18
	nop
	set	0x70, %i0
	sth	%o2,	[%l7 + %i0]
	fmovslg	%fcc1,	%f24,	%f3
loop_645:
	call	loop_646
	and	%g1,	%i7,	%g2
	fands	%f28,	%f1,	%f2
	call	loop_647
loop_646:
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f22
	addccc	%l5,	0x1847,	%l3
	fmovdul	%fcc0,	%f10,	%f22
loop_647:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o5
	sra	%i5,	0x1D,	%g6
	te	%icc,	0x2
	bcs,pn	%icc,	loop_648
	rd	%ccr,	%i4
	call	loop_649
	wrpr	%l0,	0x1935,	%cwp
loop_648:
	fone	%f6
	call	loop_650
loop_649:
	call	loop_651
	pdist	%f22,	%f26,	%f0
	wr	%g0,	0xda,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_650:
	call	loop_652
loop_651:
	edge8	%l4,	%g4,	%o1
	fcmpeq32	%f2,	%f16,	%o4
	fmovrsne	%g5,	%f22,	%f6
loop_652:
	umulcc	%o6,	0x03A1,	%o0
	popc	0x05A6,	%i2
	fmovdcc	%icc,	%f8,	%f22
	call	loop_653
	call	loop_654
	call	loop_655
	fmovrdlz	%i0,	%f2,	%f28
loop_653:
	call	loop_656
loop_654:
	fcmpeq16	%f18,	%f8,	%l2
loop_655:
	fones	%f7
	fxnors	%f18,	%f9,	%f20
loop_656:
	call	loop_657
	call	loop_658
	movcc	%xcc,	%g7,	%i1
	fmovsule	%fcc1,	%f16,	%f14
loop_657:
	fmovsule	%fcc1,	%f21,	%f3
loop_658:
	movrgz	%o7,	0x0B6,	%o3
	taddcc	%i6,	0x1049,	%l6
	call	loop_659
	fbe,a	%fcc1,	loop_660
	fmovspos	%icc,	%f23,	%f12
	fors	%f17,	%f26,	%f17
loop_659:
	fmovdge	%fcc2,	%f22,	%f10
loop_660:
	call	loop_661
	call	loop_662
	andncc	%l1,	%g3,	%g1
	movvc	%icc,	%i7,	%o2
loop_661:
	call	loop_663
loop_662:
	alignaddrl	%l5,	%g2,	%i3
	nop
	setx	0x38083987,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x5610DE17,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f31,	%f16
	edge16	%o5,	%i5,	%g6
loop_663:
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f30
	fmovsne	%xcc,	%f20,	%f0
	edge16ln	%l3,	%l0,	%i4
	call	loop_664
	fandnot2	%f24,	%f10,	%f8
	sdivcc	%g4,	0x0A92,	%o1
	bge	%icc,	loop_665
loop_664:
	brgez	%l4,	loop_666
	srax	%g5,	%o6,	%o4
	fmovrsgez	%i2,	%f25,	%f1
loop_665:
	sethi	0x1F5A,	%o0
loop_666:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movle	%xcc,	0x56B,	%i0
	fmovsue	%fcc2,	%f15,	%f14
	fmovs	%f4,	%f17
	fbe	%fcc2,	loop_667
	edge8l	%l2,	%g7,	%o7
	array8	%o3,	%i1,	%i6
	tleu	%xcc,	0x5
loop_667:
	movue	%fcc3,	0x0BC,	%l6
	fnands	%f22,	%f23,	%f0
	wr	%g3,	%l1,	%softint
	taddcctv	%i7,	0x0CA9,	%g1
	fmovrsgez	%o2,	%f17,	%f3
	fmovrdlez	%l5,	%f22,	%f30
	nop
	setx	0x1660,	%l0,	%o5
	udiv	%g2,	%o5,	%i3
	fmovrse	%i5,	%f28,	%f22
	fbul,a,pn	%fcc1,	loop_668
	mova	%fcc3,	%l3,	%l0
	call	loop_669
	movgu	%icc,	0x02E,	%i4
loop_668:
	fpack16	%f20,	%f15
	nop
	setx	0x8C1D61F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x57A53A09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f11,	%f18
loop_669:
	movn	%icc,	%g4,	%o1
	call	loop_670
	call	loop_671
	call	loop_672
	tvc	%xcc,	0x2
loop_670:
	alignaddr	%g6,	%g5,	%l4
loop_671:
	fmovrsgez	%o6,	%f12,	%f4
loop_672:
	call	loop_673
	bg	%xcc,	loop_674
	tcs	%xcc,	0x5
	fmovrdgez	%i2,	%f24,	%f24
loop_673:
	fmovrdgz	%o0,	%f14,	%f0
loop_674:
	addccc	%i0,	0x14C5,	%o4
	udivcc	%l2,	0x1BA1,	%o7
	call	loop_675
	movcs	%xcc,	0x3DF,	%g7
	call	loop_676
	pdist	%f6,	%f22,	%f30
loop_675:
	call	loop_677
	edge8n	%o3,	%i1,	%i6
loop_676:
	edge16ln	%g3,	%l6,	%l1
	nop
	setx	loop_678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034200001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_677:
	call	loop_679
	fcmps	%fcc1,	%f15,	%f0
	call	loop_680
loop_678:
	pdist	%f16,	%f16,	%f28
loop_679:
	fcmpeq32	%f4,	%f12,	%i7
	fandnot2	%f28,	%f20,	%f30
loop_680:
	edge16ln	%g1,	%l5,	%o2
	fsrc1s	%f28,	%f4
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x38] %asi
	call	loop_681
	fmovsvs	%icc,	%f29,	%f8
	fandnot1s	%f20,	%f7,	%f30
	fmovsue	%fcc2,	%f26,	%f22
loop_681:
	and	%i3,	%o5,	%l3
	movge	%icc,	%i5,	%i4
	rdhpr	%hintp,	%l0
	fmovspos	%icc,	%f0,	%f2
	call	loop_682
	fpadd32s	%f2,	%f10,	%f29
	rd	%tick_cmpr,	%o1
	tge	%icc,	0x4
loop_682:
	call	loop_683
	rdpr	%otherwin,	%g4
	nop
	fitos	%f9,	%f20
	membar	0x27
loop_683:
	fmovsg	%icc,	%f13,	%f23
	call	loop_684
	fxor	%f28,	%f22,	%f24
	fmul8ulx16	%f28,	%f30,	%f20
	edge32ln	%g6,	%g5,	%o6
loop_684:
	call	loop_685
	srlx	%i2,	%o0,	%i0
	movule	%fcc0,	%l4,	%l2
	movn	%xcc,	0x418,	%o7
loop_685:
	call	loop_686
	call	loop_687
	edge8ln	%g7,	%o4,	%o3
	fble	%fcc0,	loop_688
loop_686:
	fxor	%f14,	%f2,	%f10
loop_687:
	fmul8ulx16	%f6,	%f10,	%f6
	fmovdge	%fcc3,	%f0,	%f20
loop_688:
	fmovsa	%fcc1,	%f21,	%f19
	call	loop_689
	call	loop_690
	or	%i1,	0x192A,	%i6
	fone	%f0
loop_689:
	fmovscs	%xcc,	%f31,	%f2
loop_690:
	addcc	%g3,	0x130D,	%l1
	taddcc	%l6,	0x1753,	%g1
	siam	0x3
	ldsh	[%l7 + 0x24],	%i7
	fnegs	%f19,	%f22
	nop
	setx	0x8AB935F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xCB333CE8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f31,	%f16
	call	loop_691
	fmovdcs	%icc,	%f26,	%f12
	fmovdul	%fcc1,	%f26,	%f6
	movvc	%xcc,	0x53C,	%o2
loop_691:
	call	loop_692
	call	loop_693
	fzero	%f26
	call	loop_694
loop_692:
	call	loop_695
loop_693:
	call	loop_696
	call	loop_697
loop_694:
	movg	%fcc0,	0x4C7,	%g2
loop_695:
	call	loop_698
loop_696:
	call	loop_699
loop_697:
	swap	[%l7 + 0x74],	%l5
	udivx	%i3,	0x12F3,	%l3
loop_698:
	nop
	setx	0x0053,	%l0,	%i4
	sdivx	%i5,	%i4,	%o5
loop_699:
	nop
	set	0x25, %l1
	ldub	[%l7 + %l1],	%o1
	orncc	%g4,	0x057C,	%l0
	call	loop_700
	fcmpeq16	%f18,	%f0,	%g6
	edge16n	%o6,	%i2,	%g5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_700:
	tpos	%xcc,	0x6
	call	loop_701
	membar	0x04
	nop
	setx	0x1930,	%l0,	%l4
	sdivx	%o0,	%l4,	%l2
	fbl	%fcc0,	loop_702
loop_701:
	fzero	%f30
	call	loop_703
	tpos	%icc,	0x0
loop_702:
	fors	%f18,	%f1,	%f20
	fmovrslez	%i0,	%f14,	%f13
loop_703:
	fnands	%f16,	%f28,	%f20
	call	loop_704
	call	loop_705
	sll	%o7,	0x08,	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_704:
	call	loop_706
loop_705:
	fbn,pn	%fcc1,	loop_707
	fmovdcc	%xcc,	%f20,	%f4
	fpadd32	%f26,	%f6,	%f12
loop_706:
	call	loop_708
loop_707:
	movul	%fcc3,	0x3BE,	%i1
	fsrc2s	%f18,	%f8
	call	loop_709
loop_708:
	movle	%icc,	0x43B,	%i6
	nop
	fitos	%f11,	%f17
	fstox	%f17,	%f12
	fxtos	%f12,	%f9
	nop
	setx	0x0FAF,	%l0,	%l1
	sdiv	%g3,	%l1,	%o3
loop_709:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0xAEEEFFBE9E8A03CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x86F703E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f8,	%f26
	fnegd	%f16,	%f8
	movo	%fcc3,	%l6,	%g2
	call	loop_710
	edge8n	%l5,	%o2,	%l3
	sdiv	%i5,	0x06CE,	%i4
	fblg	%fcc2,	loop_711
loop_710:
	nop
	setx	0x020A,	%l0,	%o1
	sdiv	%i3,	%o1,	%g4
	fnands	%f21,	%f21,	%f26
	nop
	setx	0x46140D1D1A88519B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3717ACB260C8DDAF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f24,	%f6
loop_711:
	xnorcc	%l0,	0x138A,	%g6
	call	loop_712
	call	loop_713
	call	loop_714
	nop
	setx	0xB6617AEBC432BA50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f16
loop_712:
	call	loop_715
loop_713:
	call	loop_716
loop_714:
	fmovspos	%icc,	%f11,	%f3
	call	loop_717
loop_715:
	fmul8x16al	%f18,	%f28,	%f6
loop_716:
	fmovsne	%icc,	%f1,	%f9
	fnors	%f1,	%f1,	%f14
loop_717:
	call	loop_718
	call	loop_719
	rdpr	%cansave,	%o6
	fpadd16	%f30,	%f24,	%f20
loop_718:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i2
loop_719:
	fmovsl	%xcc,	%f27,	%f25
	wr	%g0,	0x81,	%asi
	sta	%f28,	[%l7 + 0x70] %asi
	call	loop_720
	movle	%fcc2,	0x5D5,	%o5
	call	loop_721
	movrgz	%o0,	0x04F,	%g5
loop_720:
	fmovd	%f24,	%f14
	call	loop_722
loop_721:
	movn	%fcc0,	0x08C,	%l4
	nop
	set	0x78, %o3
	stx	%i0,	[%l7 + %o3]
	fmul8x16al	%f4,	%f28,	%f26
loop_722:
	rdhpr	%hintp,	%o7
	call	loop_723
	movrlz	%l2,	%g7,	%o4
	subcc	%i1,	0x1816,	%g3
	call	loop_724
loop_723:
	movgu	%icc,	0x43F,	%l1
	call	loop_725
	call	loop_726
loop_724:
	array8	%i6,	%o3,	%i7
	fmovsuge	%fcc2,	%f7,	%f28
loop_725:
	call	loop_727
loop_726:
	call	loop_728
	for	%f14,	%f18,	%f18
	fandnot2s	%f1,	%f26,	%f7
loop_727:
	fpadd16s	%f4,	%f2,	%f10
loop_728:
	taddcc	%l6,	0x03D2,	%g1
	call	loop_729
	stx	%g2,	[%l7 + 0x38]
	fmul8x16	%f2,	%f8,	%f12
	fexpand	%f7,	%f20
loop_729:
	fabsd	%f20,	%f18
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x20] %asi,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_730
	subcc	%i5,	%i4,	%i3
	fnot2s	%f17,	%f27
	fbul,pt	%fcc2,	loop_731
loop_730:
	edge32	%o2,	%g4,	%l0
	movue	%fcc3,	%o1,	%g6
	fmovsl	%fcc2,	%f0,	%f26
loop_731:
	bshuffle	%f8,	%f8,	%f12
	fmovdvs	%xcc,	%f8,	%f10
	call	loop_732
	rd	%pc,	%i2
	xnorcc	%o5,	%o0,	%o6
	fmovscc	%icc,	%f17,	%f7
loop_732:
	call	loop_733
	fmovsle	%fcc1,	%f27,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x406, 	%hsys_tick_cmpr
	bne,a	%xcc,	loop_734
loop_733:
	call	loop_735
	sll	%g5,	%o7,	%l2
	move	%xcc,	0x487,	%g7
loop_734:
	stx	%i0,	[%l7 + 0x70]
loop_735:
	nop
	setx	0x1715080D017B8BB2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x873D64A10C329740,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f4,	%f4
	alignaddr	%i1,	%o4,	%l1
	call	loop_736
	fcmped	%fcc3,	%f28,	%f18
	fmovsug	%fcc1,	%f14,	%f30
	call	loop_737
loop_736:
	rd	%tick_cmpr,	%g3
	call	loop_738
	call	loop_739
loop_737:
	nop
	setx	0xA36F2D08F97EC8C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x1AD1CEAD7873AEC0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f0,	%f30
	taddcc	%o3,	0x05CD,	%i7
loop_738:
	movleu	%xcc,	%l6,	%g1
loop_739:
	fmovdlg	%fcc2,	%f12,	%f28
	set	0x28, %g7
	stda	%i6,	[%l7 + %g7] 0x27
	membar	#Sync
	bleu	%icc,	loop_740
	call	loop_741
	fands	%f25,	%f19,	%f30
	rd	%asi,	%l5
loop_740:
	fpsub16s	%f18,	%f23,	%f25
loop_741:
	smulcc	%g2,	0x04C7,	%l3
	addc	%i4,	%i3,	%o2
	rd	%asi,	%i5
	bleu	%icc,	loop_742
	bl,pn	%xcc,	loop_743
	fnot1	%f22,	%f16
	fbu	%fcc3,	loop_744
loop_742:
	fblg	%fcc0,	loop_745
loop_743:
	fpack16	%f6,	%f24
	call	loop_746
loop_744:
	addc	%l0,	%g4,	%o1
loop_745:
	fmovsgu	%xcc,	%f21,	%f22
	fpsub16	%f22,	%f2,	%f16
loop_746:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F1, 	%hsys_tick_cmpr
	set	0x34, %o4
	sta	%f5,	[%l7 + %o4] 0x18
	fexpand	%f21,	%f18
	fmul8x16al	%f17,	%f7,	%f22
	call	loop_747
	bn	%icc,	loop_748
	udivx	%o5,	0x1C5D,	%o0
	fmovsl	%xcc,	%f24,	%f5
loop_747:
	rdpr	%cwp,	%o6
loop_748:
	tvs	%xcc,	0x3
	tne	%xcc,	0x7
	orncc	%g5,	%o7,	%l2
	te	%icc,	0x1
	nop
	fitos	%f2,	%f6
	fstod	%f6,	%f26
	tsubcc	%l4,	0x1047,	%g7
	rdpr	%pil,	%i0
	fnot1	%f30,	%f28
	nop
	fitos	%f4,	%f27
	fstod	%f27,	%f4
	call	loop_749
	wr	%o4,	0x0205,	%set_softint
	call	loop_750
	fmovsge	%fcc3,	%f28,	%f17
loop_749:
	array32	%i1,	%l1,	%o3
	fmovrsne	%g3,	%f14,	%f13
loop_750:
	fmovdug	%fcc0,	%f28,	%f28
	call	loop_751
	call	loop_752
	fmovsleu	%icc,	%f28,	%f11
	rdpr	%gl,	%l6
loop_751:
	nop
	setx loop_753, %l0, %l1
	jmpl %l1, %g1
loop_752:
	call	loop_754
	call	loop_755
	subcc	%i7,	0x177B,	%l5
loop_753:
	fandnot1	%f8,	%f30,	%f8
loop_754:
	rdhpr	%htba,	%i6
loop_755:
	nop
	setx	0x8A9866EA979AF98C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movlg	%fcc1,	%g2,	%l3
	call	loop_756
	call	loop_757
	fmul8x16au	%f1,	%f10,	%f20
	fmovsl	%fcc3,	%f3,	%f22
loop_756:
	call	loop_758
loop_757:
	movpos	%icc,	0x36E,	%i3
	fcmpne32	%f2,	%f26,	%o2
	addccc	%i4,	%i5,	%g4
loop_758:
	wrpr	%l0,	0x159B,	%pil
	call	loop_759
	fmovse	%xcc,	%f9,	%f28
	fmovso	%fcc3,	%f23,	%f24
loop_759:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 28
!	Type a   	: 23
!	Type x   	: 9
!	Type cti   	: 150
!	Type f   	: 149
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
	set	0x1,	%g1
	set	0x6,	%g2
	set	0x6,	%g3
	set	0x3,	%g4
	set	0x1,	%g5
	set	0x7,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x6,	%i1
	set	-0x0,	%i2
	set	-0x5,	%i3
	set	-0x6,	%i4
	set	-0xA,	%i5
	set	-0x2,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x5A8189E6,	%l0
	set	0x476279D8,	%l1
	set	0x187A9584,	%l2
	set	0x503722D9,	%l3
	set	0x40D77A4B,	%l4
	set	0x519A99F6,	%l5
	set	0x4294FFEB,	%l6
	!# Output registers
	set	-0x185C,	%o0
	set	0x1D67,	%o1
	set	0x11ED,	%o2
	set	-0x187B,	%o3
	set	0x1F69,	%o4
	set	0x0833,	%o5
	set	-0x13E2,	%o6
	set	0x0BFE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	call	loop_760
	movrgez	%g6,	%i2,	%o5
	movle	%fcc2,	%o1,	%o6
	call	loop_761
loop_760:
	fcmple16	%f6,	%f8,	%o0
	rd	%ccr,	%g5
	fmovduge	%fcc0,	%f30,	%f6
loop_761:
	fmovdpos	%icc,	%f14,	%f0
	call	loop_762
	call	loop_763
	fmovsgu	%icc,	%f4,	%f29
	movn	%xcc,	%l2,	%o7
loop_762:
	fmovdge	%fcc2,	%f10,	%f18
loop_763:
	nop
	set	0x14, %i6
	lduh	[%l7 + %i6],	%l4
	addccc	%i0,	%o4,	%i1
	fmovdg	%fcc3,	%f18,	%f14
	edge8l	%l1,	%o3,	%g3
	sdiv	%g7,	0x0D2C,	%g1
	popc	%i7,	%l5
	bvs	%icc,	loop_764
	srlx	%i6,	0x06,	%g2
	fmul8x16au	%f20,	%f0,	%f24
	fandnot1s	%f29,	%f12,	%f9
loop_764:
	nop
	set	0x27, %l2
	ldstuba	[%l7 + %l2] 0x81,	%l3
	rdhpr	%hpstate,	%i3
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f7
	movl	%fcc0,	0x797,	%l6
	fcmpeq16	%f8,	%f16,	%i4
	fcmpgt16	%f2,	%f28,	%o2
	tge	%xcc,	0x5
	xnorcc	%i5,	%g4,	%l0
	movle	%xcc,	%g6,	%o5
	movue	%fcc0,	%o1,	%i2
	movue	%fcc0,	%o6,	%o0
	movcs	%icc,	0x4D2,	%g5
	add	%l2,	0x1B58,	%o7
	fba	%fcc3,	loop_765
	call	loop_766
	flushw
	tleu	%xcc,	0x0
loop_765:
	te	%icc,	0x1
loop_766:
	nop
	set	0x53, %i5
	ldstuba	[%l7 + %i5] 0x0c,	%l4
	andcc	%i0,	%o4,	%l1
	call	loop_767
	call	loop_768
	call	loop_769
	call	loop_770
loop_767:
	bne	%icc,	loop_771
loop_768:
	bl,pt	%xcc,	loop_772
loop_769:
	fornot1s	%f22,	%f18,	%f22
loop_770:
	brnz,pt	%o3,	loop_773
loop_771:
	fmovscc	%icc,	%f2,	%f19
loop_772:
	fors	%f23,	%f12,	%f19
	fpmerge	%f3,	%f16,	%f24
loop_773:
	call	loop_774
	smul	%g3,	0x1F4F,	%i1
	call	loop_775
	fxnor	%f6,	%f4,	%f6
loop_774:
	subc	%g7,	%i7,	%l5
	rdpr	%cansave,	%i6
loop_775:
	andn	%g2,	%l3,	%g1
	call	loop_776
	wr	%i3,	0x1488,	%pic
	orn	%l6,	%i4,	%i5
	call	loop_777
loop_776:
	movle	%fcc1,	0x28C,	%o2
	call	loop_778
	fmovdne	%fcc1,	%f24,	%f24
loop_777:
	call	loop_779
	fmovdleu	%icc,	%f10,	%f24
loop_778:
	fmovdule	%fcc1,	%f4,	%f24
	call	loop_780
loop_779:
	fmovsue	%fcc0,	%f18,	%f20
	nop
	setx	0x3D5F101BE14B7538,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fnot1	%f22,	%f26
loop_780:
	array16	%l0,	%g4,	%o5
	xor	%o1,	0x04E9,	%g6
	mova	%fcc0,	%i2,	%o6
	movo	%fcc0,	%o0,	%g5
	bleu,pt	%icc,	loop_781
	fxnors	%f24,	%f4,	%f28
	brlez,a,pt	%o7,	loop_782
	call	loop_783
loop_781:
	rd	%tick_cmpr,	%l4
	and	%i0,	%l2,	%l1
loop_782:
	call	loop_784
loop_783:
	call	loop_785
	fmuld8ulx16	%f9,	%f14,	%f14
	xnorcc	%o4,	%o3,	%g3
loop_784:
	or	%i1,	0x022E,	%g7
loop_785:
	fpsub32s	%f17,	%f24,	%f2
	fmuld8sux16	%f4,	%f8,	%f26
	call	loop_786
	fmovrde	%l5,	%f16,	%f28
	call	loop_787
	fmovsule	%fcc0,	%f4,	%f25
loop_786:
	call	loop_788
	fmovrsne	%i6,	%f1,	%f3
loop_787:
	call	loop_789
	movue	%fcc1,	0x251,	%i7
loop_788:
	fcmpes	%fcc2,	%f9,	%f7
	orn	%g2,	0x0F10,	%g1
loop_789:
	call	loop_790
	call	loop_791
	nop
	fitos	%f13,	%f21
	call	loop_792
loop_790:
	sra	%i3,	%l6,	%i4
loop_791:
	call	loop_793
	edge32n	%l3,	%i5,	%l0
loop_792:
	umul	%o2,	%g4,	%o1
	rdhpr	%hintp,	%g6
loop_793:
	andn	%o5,	%i2,	%o0
	nop
	setx	0xF7FB85026472F212,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	set	0x30, %g3
	std	%f26,	[%l7 + %g3]
	fmovrdgez	%o6,	%f8,	%f20
	movue	%fcc1,	%g5,	%l4
	fones	%f24
	sllx	%i0,	0x09,	%o7
	add	%l2,	%l1,	%o3
	fone	%f4
	sra	%o4,	%g3,	%i1
	fpsub32	%f22,	%f18,	%f2
	call	loop_794
	fexpand	%f13,	%f30
	addccc	%g7,	%l5,	%i6
	wrpr 	%g0, 	0x0, 	%gl
loop_794:
	fpack32	%f24,	%f14,	%f24
	fnegs	%f12,	%f19
	stx	%g1,	[%l7 + 0x08]
	rdhpr	%hsys_tick_cmpr,	%i7
	call	loop_795
	fcmpes	%fcc0,	%f8,	%f9
	movpos	%xcc,	0x7C7,	%i3
	call	loop_796
loop_795:
	call	loop_797
	subccc	%l6,	0x09B7,	%i4
	call	loop_798
loop_796:
	orncc	%i5,	0x1BB5,	%l3
loop_797:
	be,a,pt	%xcc,	loop_799
	rd	%fprs,	%l0
loop_798:
	nop
	setx	0x0523,	%l0,	%g4
	sdivx	%o2,	%g4,	%g6
	call	loop_800
loop_799:
	call	loop_801
	call	loop_802
	fmovdul	%fcc0,	%f14,	%f30
loop_800:
	fmovdgu	%xcc,	%f22,	%f26
loop_801:
	nop
	fitod	%f12,	%f24
loop_802:
	tleu	%xcc,	0x2
	sdivx	%o5,	0x0289,	%i2
	movrgz	%o1,	%o0,	%g5
	call	loop_803
	call	loop_804
	call	loop_805
	tleu	%icc,	0x1
loop_803:
	fexpand	%f31,	%f2
loop_804:
	rdpr	%cleanwin,	%l4
loop_805:
	movug	%fcc3,	0x514,	%o6
	fabsd	%f14,	%f12
	fbu,pt	%fcc2,	loop_806
	mulscc	%o7,	%i0,	%l1
	xor	%o3,	%o4,	%g3
	andcc	%i1,	%l2,	%l5
loop_806:
	fmovsleu	%icc,	%f27,	%f16
	call	loop_807
	fmovdule	%fcc0,	%f2,	%f2
	rd	%softint,	%g7
	nop
	setx	0x8923C209,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x1A1B7348,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f5,	%f24
loop_807:
	call	loop_808
	call	loop_809
	rdhpr	%hpstate,	%i6
	fmovsul	%fcc2,	%f17,	%f19
loop_808:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_809:
	call	loop_810
	call	loop_811
	call	loop_812
	edge32ln	%g1,	%i7,	%g2
loop_810:
	fsrc2	%f6,	%f0
loop_811:
	call	loop_813
loop_812:
	call	loop_814
	call	loop_815
	fmovse	%fcc2,	%f7,	%f20
loop_813:
	fnegd	%f28,	%f6
loop_814:
	nop
	setx	0xAF0B0461D936BED2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xAF330DA19BDF368C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f8,	%f14
loop_815:
	te	%xcc,	0x3
	call	loop_816
	fmovdcc	%xcc,	%f0,	%f10
	fba,a	%fcc1,	loop_817
	call	loop_818
loop_816:
	call	loop_819
	nop
	setx	0x0799,	%l0,	%l6
	udiv	%i3,	%l6,	%i4
loop_817:
	bvc,a,pn	%xcc,	loop_820
loop_818:
	call	loop_821
loop_819:
	fand	%f16,	%f12,	%f20
	wr	%l3,	%i5,	%sys_tick
loop_820:
	wrpr	%l0,	0x1C15,	%tick
loop_821:
	call	loop_822
	call	loop_823
	fmovdpos	%xcc,	%f0,	%f22
	rd	%tick_cmpr,	%o2
loop_822:
	nop
	set	0x78, %o7
	stw	%g6,	[%l7 + %o7]
loop_823:
	fbu,a	%fcc1,	loop_824
	call	loop_825
	movre	%o5,	%g4,	%o1
	bshuffle	%f4,	%f30,	%f18
loop_824:
	edge8l	%o0,	%g5,	%i2
loop_825:
	rd	%pc,	%l4
	fmovse	%fcc2,	%f26,	%f31
	fmovrdne	%o7,	%f26,	%f16
	wr	%o6,	0x03FF,	%y
	edge16l	%l1,	%o3,	%o4
	fnand	%f30,	%f18,	%f8
	rdpr	%pil,	%g3
	fmovdul	%fcc3,	%f0,	%f28
	srax	%i0,	0x01,	%i1
	fornot2	%f28,	%f18,	%f6
	fmuld8ulx16	%f3,	%f20,	%f16
	orncc	%l5,	0x036F,	%l2
	mulx	%i6,	%g7,	%g1
	wrpr	%i7,	%i3,	%pil
	call	loop_826
	movul	%fcc2,	%g2,	%i4
	call	loop_827
	fmovdge	%xcc,	%f4,	%f8
loop_826:
	movle	%icc,	0x6AD,	%l6
	wr	%l3,	0x1DE5,	%y
loop_827:
	fbule,a,pt	%fcc3,	loop_828
	movleu	%icc,	0x6AC,	%i5
	movue	%fcc1,	%o2,	%g6
	call	loop_829
loop_828:
	and	%o5,	%l0,	%o1
	fmovrdgez	%o0,	%f26,	%f4
	call	loop_830
loop_829:
	movrlez	%g4,	0x0E7,	%i2
	wr	%l4,	0x0C67,	%clear_softint
	call	loop_831
loop_830:
	fornot2	%f8,	%f30,	%f30
	fbul	%fcc1,	loop_832
	call	loop_833
loop_831:
	tcc	%xcc,	0x7
	fbue,a,pt	%fcc2,	loop_834
loop_832:
	fornot1s	%f24,	%f24,	%f3
loop_833:
	call	loop_835
	siam	0x6
loop_834:
	fpsub32	%f30,	%f6,	%f20
	call	loop_836
loop_835:
	fpack16	%f4,	%f21
	fmovdcs	%xcc,	%f2,	%f28
	tvs	%xcc,	0x6
loop_836:
	array8	%g5,	%o6,	%o7
	fnors	%f7,	%f14,	%f18
	call	loop_837
	nop
	setx	0xD0A83F2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x6D762D21,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f14,	%f23
	call	loop_838
	smulcc	%l1,	0x1066,	%o3
loop_837:
	fmovdul	%fcc2,	%f2,	%f26
	tpos	%xcc,	0x0
loop_838:
	fmovdl	%fcc2,	%f28,	%f18
	andn	%g3,	%i0,	%o4
	rd	%softint,	%l5
	call	loop_839
	fbn,a	%fcc0,	loop_840
	movrlz	%i1,	%i6,	%l2
	fandnot2	%f18,	%f16,	%f18
loop_839:
	fnands	%f21,	%f25,	%f4
loop_840:
	movre	%g1,	0x341,	%i7
	tle	%xcc,	0x3
	movvc	%xcc,	0x5BA,	%g7
	movcs	%xcc,	%i3,	%i4
	mulscc	%l6,	0x13D7,	%l3
	call	loop_841
	call	loop_842
	call	loop_843
	movue	%fcc0,	0x6F4,	%i5
loop_841:
	srax	%g2,	%o2,	%o5
loop_842:
	add	%g6,	%o1,	%o0
loop_843:
	tsubcctv	%l0,	%g4,	%i2
	call	loop_844
	tl	%icc,	0x0
	call	loop_845
	nop
	setx	0xED6A585BDA72A548,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEB9A6C35B4234189,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f6,	%f24
loop_844:
	movg	%xcc,	0x76B,	%g5
	fbule,a	%fcc3,	loop_846
loop_845:
	fmul8sux16	%f26,	%f18,	%f18
	tge	%xcc,	0x7
	call	loop_847
loop_846:
	wr 	%g0, 	0x4, 	%fprs
	call	loop_848
	edge16n	%l4,	%l1,	%o3
loop_847:
	movrlez	%i0,	0x293,	%g3
	call	loop_849
loop_848:
	st	%f25,	[%l7 + 0x08]
	call	loop_850
	edge32ln	%o4,	%i1,	%l5
loop_849:
	fandnot1	%f8,	%f6,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_850:
	nop
	setx	0xAC351BDC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f7
	nop
	setx	0x543935F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	umulcc	%i7,	0x09F5,	%l2
	movre	%g7,	%i4,	%i3
	call	loop_851
	fmovdul	%fcc3,	%f16,	%f2
	nop
	setx	0x0FB6,	%l0,	%l3
	udivx	%l6,	%l3,	%g2
	fzeros	%f24
loop_851:
	call	loop_852
	brlz	%o2,	loop_853
	smulcc	%i5,	%o5,	%g6
	nop
	fitos	%f3,	%f24
loop_852:
	mova	%xcc,	0x52D,	%o0
loop_853:
	te	%icc,	0x6
	fmovscc	%icc,	%f0,	%f27
	fsrc2s	%f9,	%f18
	xorcc	%l0,	0x1921,	%g4
	call	loop_854
	fornot2	%f6,	%f16,	%f0
	fblg,a	%fcc1,	loop_855
	fmovdvc	%icc,	%f28,	%f8
loop_854:
	nop
	setx	0x9DD0F128BE153BE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xAB029ABA56B96ED2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f10,	%f16
	fmovsg	%icc,	%f1,	%f15
loop_855:
	movrgez	%i2,	%o1,	%g5
	call	loop_856
	fmovduge	%fcc2,	%f26,	%f6
	fmovsue	%fcc1,	%f25,	%f9
	tneg	%icc,	0x4
loop_856:
	call	loop_857
	movg	%fcc0,	0x25F,	%o7
	bvc,a,pt	%icc,	loop_858
	fsrc2s	%f3,	%f5
loop_857:
	fmovdug	%fcc3,	%f22,	%f26
	nop
	fitod	%f6,	%f18
	fdtos	%f18,	%f27
loop_858:
	fbue,a,pn	%fcc3,	loop_859
	fmovse	%fcc3,	%f28,	%f9
	call	loop_860
	fpadd32s	%f31,	%f26,	%f24
loop_859:
	fxors	%f14,	%f13,	%f31
	rd	%softint,	%o6
loop_860:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpsub32s	%f7,	%f26,	%f13
	prefetch	[%l7 + 0x74],	 4
	movl	%fcc1,	0x615,	%l1
	movle	%fcc1,	%o3,	%l4
	tsubcc	%g3,	0x1CDD,	%i0
	sdivcc	%o4,	0x1F91,	%l5
	xor	%i1,	%g1,	%i7
	addcc	%l2,	0x13C6,	%g7
	fmovdg	%fcc0,	%f4,	%f10
	call	loop_861
	nop
	setx	0x817F055C594EC88F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEE7169806594439E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f6,	%f14
	call	loop_862
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f2
loop_861:
	rdhpr	%hintp,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_862:
	fmovsug	%fcc1,	%f26,	%f6
	nop
	setx	0x1094,	%l0,	%l3
	sdivcc	%i4,	%l3,	%l6
	fnands	%f4,	%f5,	%f27
	fands	%f16,	%f21,	%f28
	call	loop_863
	edge32ln	%o2,	%i5,	%g2
	nop
	setx	0xDC591E609C1E945D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x8C819D91F0CE8A97,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f4,	%f18
	fmovrdgez	%g6,	%f20,	%f22
loop_863:
	nop
	set	0x72, %l3
	ldsha	[%l7 + %l3] 0x89,	%o5
	sub	%l0,	%o0,	%i2
	umul	%o1,	%g5,	%o7
	fmovsue	%fcc3,	%f15,	%f12
	call	loop_864
	call	loop_865
	call	loop_866
	rdpr	%wstate,	%o6
loop_864:
	edge16ln	%g4,	%l1,	%o3
loop_865:
	tl	%icc,	0x1
loop_866:
	fors	%f11,	%f26,	%f0
	fone	%f20
	fbul	%fcc1,	loop_867
	sdiv	%l4,	0x12E0,	%i0
	nop
	set	0x08, %o1
	stx	%o4,	[%l7 + %o1]
	movrgez	%l5,	0x029,	%i1
loop_867:
	wr	%g1,	%g3,	%sys_tick
	call	loop_868
	fpsub16	%f18,	%f16,	%f18
	call	loop_869
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f28
loop_868:
	movvs	%xcc,	0x2E5,	%i7
	call	loop_870
loop_869:
	nop
	fitos	%f2,	%f6
	fmovd	%f6,	%f8
	call	loop_871
loop_870:
	rd	%softint,	%l2
	orncc	%g7,	0x13DE,	%i6
	fmul8sux16	%f30,	%f30,	%f20
loop_871:
	call	loop_872
	rdhpr	%hsys_tick_cmpr,	%i4
	fmovrse	%i3,	%f10,	%f21
	fmovsug	%fcc1,	%f28,	%f7
loop_872:
	nop
	setx	0x88CD22A0EA354818,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f2
	fmuld8ulx16	%f1,	%f0,	%f6
	fmovsvs	%xcc,	%f29,	%f13
	fmovdvc	%icc,	%f18,	%f28
	fmuld8sux16	%f6,	%f23,	%f24
	fnegd	%f22,	%f26
	call	loop_873
	fsrc2s	%f3,	%f15
	call	loop_874
	wr	%l6,	%l3,	%clear_softint
loop_873:
	call	loop_875
	call	loop_876
loop_874:
	fmovrslez	%o2,	%f17,	%f11
	fmovdcc	%xcc,	%f2,	%f22
loop_875:
	taddcc	%i5,	%g2,	%o5
loop_876:
	taddcctv	%g6,	0x0E16,	%o0
	sra	%l0,	0x0D,	%o1
	fmul8ulx16	%f16,	%f30,	%f22
	edge8n	%i2,	%o7,	%g5
	movuge	%fcc1,	0x315,	%g4
	call	loop_877
	call	loop_878
	call	loop_879
	fzeros	%f14
loop_877:
	fcmpgt32	%f30,	%f30,	%o6
loop_878:
	tgu	%icc,	0x4
loop_879:
	fmovsneg	%icc,	%f29,	%f9
	orn	%l1,	0x194F,	%o3
	tvs	%icc,	0x5
	srl	%i0,	%l4,	%l5
	call	loop_880
	fpadd16s	%f30,	%f12,	%f22
	fmovdneg	%icc,	%f2,	%f4
	ldsw	[%l7 + 0x0C],	%i1
loop_880:
	fcmpeq32	%f28,	%f26,	%g1
	fmovsle	%fcc2,	%f17,	%f16
	faligndata	%f10,	%f20,	%f18
	edge16n	%g3,	%i7,	%l2
	nop
	setx	0x4B9F8B50,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x46B70E1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f31,	%f4
	mulscc	%g7,	%i6,	%o4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdcs	%icc,	%f4,	%f30
	fpackfix	%f22,	%f10
	sethi	0x1E85,	%i3
	call	loop_881
	srlx	%l6,	%l3,	%i4
	fnegd	%f28,	%f26
	call	loop_882
loop_881:
	call	loop_883
	call	loop_884
	call	loop_885
loop_882:
	fblg,a,pn	%fcc2,	loop_886
loop_883:
	bne	%icc,	loop_887
loop_884:
	call	loop_888
loop_885:
	fbuge,pn	%fcc2,	loop_889
loop_886:
	fmovrdlez	%o2,	%f12,	%f6
loop_887:
	fmovsne	%fcc0,	%f7,	%f12
loop_888:
	call	loop_890
loop_889:
	call	loop_891
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f10
	call	loop_892
loop_890:
	call	loop_893
loop_891:
	nop
	setx	0x55B42EE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f8
	fmovdg	%fcc0,	%f22,	%f12
loop_892:
	fones	%f19
loop_893:
	tpos	%icc,	0x3
	move	%fcc0,	%i5,	%g2
	edge32n	%o5,	%g6,	%l0
	call	loop_894
	tg	%icc,	0x6
	edge16ln	%o1,	%o0,	%o7
	fmuld8ulx16	%f25,	%f15,	%f0
loop_894:
	tl	%icc,	0x0
	call	loop_895
	rd	%pc,	%g5
	membar	0x7F
	tleu	%icc,	0x6
loop_895:
	call	loop_896
	bneg	%icc,	loop_897
	call	loop_898
	call	loop_899
loop_896:
	call	loop_900
loop_897:
	fands	%f2,	%f1,	%f24
loop_898:
	wrpr	%i2,	0x10B8,	%cwp
loop_899:
	tsubcc	%g4,	%l1,	%o3
loop_900:
	fmovrdne	%i0,	%f12,	%f2
	fpadd32s	%f15,	%f9,	%f7
	fornot2	%f16,	%f0,	%f0
	wr	%o6,	%l5,	%sys_tick
	wr	%i1,	0x0EBE,	%softint
	fmovrdgez	%g1,	%f16,	%f14
	fsrc2s	%f18,	%f21
	movu	%fcc3,	%l4,	%i7
	fmovdug	%fcc1,	%f20,	%f8
	fpackfix	%f16,	%f18
	set	0x7C, %l6
	ldsba	[%l7 + %l6] 0x04,	%l2
	wrpr	%g7,	%i6,	%pil
	edge32n	%o4,	%i3,	%g3
	fmovdu	%fcc0,	%f24,	%f8
	taddcc	%l6,	%i4,	%l3
	call	loop_901
	call	loop_902
loop_901:
	nop

loop_902:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 17
!	Type a   	: 37
!	Type x   	: 6
!	Type cti   	: 143
!	Type f   	: 153
!	Type i   	: 144
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
	set	0x1,	%g2
	set	0xC,	%g3
	set	0xF,	%g4
	set	0x7,	%g5
	set	0x6,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x8,	%i1
	set	-0x6,	%i2
	set	-0x2,	%i3
	set	-0x9,	%i4
	set	-0x3,	%i5
	set	-0x5,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x5A319EA9,	%l0
	set	0x40362185,	%l1
	set	0x6E90A746,	%l2
	set	0x2674A234,	%l3
	set	0x44278F03,	%l4
	set	0x3690A50F,	%l5
	set	0x0A99D6B8,	%l6
	!# Output registers
	set	0x1A3F,	%o0
	set	-0x0D39,	%o1
	set	0x1B41,	%o2
	set	-0x194E,	%o3
	set	0x05C2,	%o4
	set	0x0623,	%o5
	set	0x03FF,	%o6
	set	0x1043,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	bmask	%i5,	%g2,	%o2
	fand	%f26,	%f6,	%f26
	fpadd16	%f22,	%f16,	%f2
	brlez,a	%o5,	loop_903
	call	loop_904
	movrlz	%l0,	%g6,	%o1
	nop
	set	0x70, %l0
	flush	%l7 + %l0
loop_903:
	call	loop_905
loop_904:
	call	loop_906
	alignaddrl	%o7,	%g5,	%i2
	call	loop_907
loop_905:
	fmovdleu	%icc,	%f20,	%f0
loop_906:
	fcmpd	%fcc0,	%f2,	%f4
	call	loop_908
loop_907:
	ba,pn	%xcc,	loop_909
	nop
	set	0x40, %g6
	ldsw	[%l7 + %g6],	%g4
	mova	%icc,	%o0,	%l1
loop_908:
	call	loop_910
loop_909:
	orcc	%i0,	%o3,	%l5
	fmovsleu	%icc,	%f2,	%f31
	sllx	%o6,	0x1F,	%g1
loop_910:
	fand	%f4,	%f8,	%f22
	bge	%xcc,	loop_911
	fmovrdgez	%i1,	%f6,	%f14
	fmovdleu	%icc,	%f16,	%f28
	fbn	%fcc3,	loop_912
loop_911:
	call	loop_913
	call	loop_914
	call	loop_915
loop_912:
	fone	%f14
loop_913:
	call	loop_916
loop_914:
	fabsd	%f0,	%f2
loop_915:
	call	loop_917
	stbar
loop_916:
	fcmple16	%f0,	%f22,	%l4
	fmul8x16al	%f13,	%f25,	%f22
loop_917:
	fnand	%f4,	%f26,	%f18
	fors	%f13,	%f12,	%f16
	bmask	%l2,	%g7,	%i7
	rdhpr	%hsys_tick_cmpr,	%i6
	edge16l	%i3,	%g3,	%o4
	fandnot2	%f0,	%f22,	%f20
	fmovda	%fcc3,	%f30,	%f30
	edge16	%i4,	%l3,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fnot1s	%f18,	%f26
	set	0x73, %i3
	ldstuba	[%l7 + %i3] 0x18,	%l6
	fone	%f8
	movvc	%xcc,	0x305,	%o2
	fmovspos	%xcc,	%f23,	%f9
	wrpr	%l0,	%o5,	%tick
	fabss	%f3,	%f12
	movo	%fcc1,	%o1,	%o7
	call	loop_918
	call	loop_919
	fxnors	%f0,	%f15,	%f10
	or	%g6,	%g5,	%i2
loop_918:
	call	loop_920
loop_919:
	fmovsn	%fcc1,	%f1,	%f17
	movvs	%xcc,	%g4,	%o0
	fmovsgu	%xcc,	%f24,	%f14
loop_920:
	andncc	%i0,	%o3,	%l5
	fandnot2	%f30,	%f0,	%f26
	edge32l	%o6,	%l1,	%g1
	fmovdule	%fcc0,	%f28,	%f28
	fands	%f17,	%f14,	%f2
	rd	%sys_tick_cmpr,	%i1
	movrne	%l4,	0x1EF,	%l2
	nop
	fitos	%f0,	%f28
	fstod	%f28,	%f20
	rdhpr	%hsys_tick_cmpr,	%i7
	edge8	%g7,	%i6,	%g3
	fandnot2s	%f7,	%f26,	%f30
	call	loop_921
	call	loop_922
	call	loop_923
	fbug	%fcc0,	loop_924
loop_921:
	rd	%asi,	%o4
loop_922:
	subc	%i3,	%l3,	%i4
loop_923:
	fmovdul	%fcc0,	%f24,	%f10
loop_924:
	tvc	%xcc,	0x4
	rdpr	%cwp,	%g2
	call	loop_925
	nop
	setx	0x7BE114D9B6473E89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFB4CD333AA8FBBB5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f14,	%f6
	nop
	fitos	%f11,	%f21
	add	%l6,	0x11B3,	%i5
loop_925:
	movpos	%icc,	0x091,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	tsubcctv	%o1,	%g6,	%g5
	mulscc	%i2,	0x18AF,	%g4
	fsrc1	%f20,	%f14
	fmovrdlez	%o7,	%f4,	%f12
	andcc	%o0,	0x0D8C,	%o3
	call	loop_926
	sir	0x07CA
	ld	[%l7 + 0x38],	%f15
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_926:
	fcmpgt16	%f2,	%f30,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEED, 	%sys_tick_cmpr
	sllx	%o6,	0x02,	%l1
	call	loop_927
	fmovsgu	%icc,	%f18,	%f25
	movrgz	%i1,	0x33A,	%g1
	fmovscc	%xcc,	%f30,	%f8
loop_927:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%i7
	fmovsle	%xcc,	%f6,	%f22
	fexpand	%f7,	%f18
	fone	%f4
	nop
	fitos	%f1,	%f9
	fstox	%f9,	%f26
	fxtos	%f26,	%f3
	movpos	%xcc,	0x031,	%l2
	wr 	%g0, 	0x6, 	%fprs
	call	loop_928
	fandnot2	%f24,	%f0,	%f18
	call	loop_929
	call	loop_930
loop_928:
	fxor	%f18,	%f4,	%f24
	movrlz	%i6,	%i3,	%l3
loop_929:
	movgu	%xcc,	0x065,	%o4
loop_930:
	movpos	%xcc,	%g2,	%i4
	call	loop_931
	tsubcc	%i5,	%l6,	%o2
	fpadd32s	%f18,	%f8,	%f30
	call	loop_932
loop_931:
	fmovsvs	%icc,	%f13,	%f27
	srlx	%l0,	%o5,	%o1
	sll	%g5,	%g6,	%g4
loop_932:
	fmovde	%fcc2,	%f6,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8ulx16	%f6,	%f0,	%f14
	movle	%icc,	0x0B7,	%o0
	tleu	%xcc,	0x0
	fnot1	%f4,	%f8
	tcc	%xcc,	0x3
	call	loop_933
	call	loop_934
	nop
	setx	0x52164CF4C67B0D8A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x6E7782B58EF6076B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f28,	%f0
	or	%o3,	0x109D,	%o7
loop_933:
	nop
	setx	0x5E275ED4,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_934:
	mulscc	%l5,	0x1175,	%i0
	brnz,pn	%l1,	loop_935
	fornot1s	%f0,	%f28,	%f1
	call	loop_936
	fmul8x16au	%f20,	%f26,	%f28
loop_935:
	edge8n	%o6,	%i1,	%l4
	fmovdle	%icc,	%f18,	%f18
loop_936:
	fornot1s	%f16,	%f9,	%f28
	call	loop_937
	fornot1s	%f17,	%f11,	%f25
	srlx	%i7,	%l2,	%g1
	fpadd16	%f4,	%f14,	%f24
loop_937:
	tg	%xcc,	0x5
	mulx	%g7,	0x1FD6,	%i6
	set	0x31, %o0
	ldstuba	[%l7 + %o0] 0x18,	%g3
	nop
	setx	0x09E4,	%l0,	%l3
	udiv	%i3,	%l3,	%g2
	set	0x20, %i4
	ldstuba	[%l7 + %i4] 0x10,	%o4
	tvc	%icc,	0x4
	bleu	%icc,	loop_938
	wr	%i4,	0x1851,	%pic
	rdpr	%cansave,	%l6
	call	loop_939
loop_938:
	call	loop_940
	call	loop_941
	addc	%o2,	%i5,	%l0
loop_939:
	fnot2s	%f4,	%f30
loop_940:
	fmovrse	%o5,	%f3,	%f3
loop_941:
	fpack16	%f20,	%f4
	call	loop_942
	fandnot1	%f12,	%f2,	%f26
	faligndata	%f8,	%f4,	%f0
	srlx	%o1,	0x1B,	%g5
loop_942:
	fmul8x16al	%f4,	%f17,	%f20
	call	loop_943
	orcc	%g6,	%g4,	%i2
	taddcc	%o0,	%o3,	%o7
	fornot2	%f4,	%f16,	%f8
loop_943:
	fsrc2	%f24,	%f4
	movrgez	%i0,	%l5,	%o6
	fmovso	%fcc0,	%f18,	%f9
	call	loop_944
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f12
	fbne,a,pt	%fcc1,	loop_945
	umulcc	%l1,	%l4,	%i1
loop_944:
	fpadd32	%f0,	%f12,	%f26
	movule	%fcc1,	0x347,	%l2
loop_945:
	udivx	%i7,	0x0F28,	%g7
	xor	%g1,	%i6,	%g3
	call	loop_946
	movrne	%i3,	0x1AD,	%g2
	fpackfix	%f28,	%f8
	tpos	%icc,	0x1
loop_946:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x22] %asi,	%o4
	fornot2s	%f5,	%f10,	%f25
	fpackfix	%f6,	%f8
	fones	%f7
	call	loop_947
	call	loop_948
	call	loop_949
	tne	%icc,	0x5
loop_947:
	tsubcctv	%i4,	%l3,	%l6
loop_948:
	call	loop_950
loop_949:
	fmovdleu	%icc,	%f20,	%f8
	movvs	%xcc,	%o2,	%i5
	set	0x4A, %g2
	lduha	[%l7 + %g2] 0x88,	%l0
loop_950:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdule	%fcc3,	%f10,	%f30
	fmovdul	%fcc2,	%f12,	%f22
	call	loop_951
	call	loop_952
	wr	%o1,	0x01F9,	%sys_tick
	fmovdneg	%xcc,	%f12,	%f2
loop_951:
	bleu,a,pt	%xcc,	loop_953
loop_952:
	movrlz	%g6,	%g4,	%o0
	fmovdl	%fcc1,	%f4,	%f26
	tsubcc	%i2,	%o7,	%i0
loop_953:
	call	loop_954
	nop
	set	0x1C, %l4
	prefetch	[%l7 + %l4],	 1
	call	loop_955
	call	loop_956
loop_954:
	fpsub32	%f8,	%f0,	%f4
	call	loop_957
loop_955:
	fpadd32s	%f10,	%f12,	%f27
loop_956:
	fmul8x16au	%f13,	%f15,	%f28
	bmask	%l5,	%o6,	%o3
loop_957:
	fblg,a	%fcc1,	loop_958
	rd	%ccr,	%l4
	call	loop_959
	fmul8x16al	%f22,	%f13,	%f30
loop_958:
	fzero	%f22
	taddcctv	%l1,	0x0B49,	%i1
loop_959:
	flush	%l7 + 0x28
	call	loop_960
	call	loop_961
	wrpr	%i7,	0x1FEE,	%pil
	fmovdlg	%fcc0,	%f12,	%f20
loop_960:
	call	loop_962
loop_961:
	call	loop_963
	tg	%icc,	0x3
	rdhpr	%hsys_tick_cmpr,	%g7
loop_962:
	call	loop_964
loop_963:
	movn	%fcc0,	%l2,	%i6
	nop
	setx	0xBA513643EA228858,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f20
	wrpr 	%g0, 	0x2, 	%gl
loop_964:
	andn	%g2,	0x19AF,	%o4
	fmovdgu	%icc,	%f12,	%f18
	call	loop_965
	movne	%fcc3,	0x2F9,	%g1
	call	loop_966
	call	loop_967
loop_965:
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f14
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f28
loop_966:
	call	loop_968
loop_967:
	fmovdlg	%fcc3,	%f20,	%f0
	call	loop_969
	movu	%fcc2,	%l3,	%i4
loop_968:
	fmovde	%icc,	%f4,	%f24
	call	loop_970
loop_969:
	movvs	%xcc,	%l6,	%i5
	call	loop_971
	rdhpr	%hintp,	%o2
loop_970:
	fcmpne32	%f10,	%f20,	%o5
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x10,	%g4
loop_971:
	membar	0x7A
	fnot1	%f12,	%f24
	call	loop_972
	taddcctv	%l0,	%o1,	%g4
	call	loop_973
	mova	%icc,	%g6,	%i2
loop_972:
	movleu	%xcc,	0x6B8,	%o7
	fmovdg	%xcc,	%f22,	%f4
loop_973:
	movrgz	%o0,	%i0,	%o6
	mova	%fcc0,	%o3,	%l4
	bcs,a,pn	%icc,	loop_974
	call	loop_975
	call	loop_976
	fcmpgt32	%f14,	%f20,	%l1
loop_974:
	tleu	%icc,	0x6
loop_975:
	call	loop_977
loop_976:
	fmovrdlz	%l5,	%f22,	%f18
	nop
	setx	0xDDE1778A,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	xnorcc	%i1,	%i7,	%l2
loop_977:
	call	loop_978
	addc	%i6,	0x03C0,	%g7
	call	loop_979
	sdiv	%g3,	0x1608,	%i3
loop_978:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_980
loop_979:
	fmovdl	%xcc,	%f20,	%f8
	call	loop_981
	call	loop_982
loop_980:
	call	loop_983
	call	loop_984
loop_981:
	call	loop_985
loop_982:
	nop
	setx	0x7F41251E44BE8084,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8978BAE5C0C2A8EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f0,	%f26
loop_983:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x70] %asi,	%o4
loop_984:
	fmovsle	%xcc,	%f2,	%f22
loop_985:
	sub	%g1,	%l3,	%i4
	bge,a,pn	%xcc,	loop_986
	movo	%fcc0,	0x349,	%g2
	call	loop_987
	call	loop_988
loop_986:
	pdist	%f20,	%f4,	%f22
	call	loop_989
loop_987:
	call	loop_990
loop_988:
	call	loop_991
	fand	%f14,	%f14,	%f20
loop_989:
	wrpr 	%g0, 	0x0, 	%gl
loop_990:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEB7, 	%sys_tick_cmpr
loop_991:
	call	loop_992
	fcmpeq32	%f0,	%f28,	%l0
	call	loop_993
	call	loop_994
loop_992:
	fmovrsgz	%g5,	%f12,	%f7
	fmovduge	%fcc1,	%f16,	%f6
loop_993:
	brgz,a,pn	%o1,	loop_995
loop_994:
	fcmpgt16	%f28,	%f16,	%g4
	sllx	%i2,	0x0D,	%g6
	fandnot2s	%f17,	%f21,	%f18
loop_995:
	bmask	%o0,	%o7,	%i0
	call	loop_996
	edge8	%o3,	%l4,	%l1
	fmovscc	%icc,	%f12,	%f4
	fmul8sux16	%f30,	%f4,	%f24
loop_996:
	for	%f26,	%f24,	%f6
	bl	%xcc,	loop_997
	array8	%o6,	%l5,	%i7
	alignaddrl	%i1,	%l2,	%g7
	nop
	setx	0xFAEC139D6B9D7FF0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x98E9F3371E558F46,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f4,	%f6
loop_997:
	pdist	%f14,	%f10,	%f28
	call	loop_998
	rdhpr	%hpstate,	%g3
	tsubcc	%i6,	%i3,	%o4
	call	loop_999
loop_998:
	fxors	%f29,	%f26,	%f17
	rdpr	%tl,	%l3
	movleu	%icc,	0x158,	%g1
loop_999:
	sir	0x19F8
	mulscc	%i4,	%i5,	%o2
	call	loop_1000
	edge16	%g2,	%l6,	%o5
	move	%fcc0,	%l0,	%o1
	call	loop_1001
loop_1000:
	call	loop_1002
	fmovrdgez	%g4,	%f10,	%f12
	movo	%fcc1,	0x245,	%g5
loop_1001:
	umul	%i2,	0x1F59,	%g6
loop_1002:
	nop
	fitod	%f3,	%f24
	taddcc	%o0,	%o7,	%i0
	call	loop_1003
	fpsub32s	%f19,	%f7,	%f30
	nop
	setx	0x860F4B3E0D24E29A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x57E917ED29E7CFFC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f26
	edge8	%o3,	%l1,	%l4
loop_1003:
	bshuffle	%f28,	%f0,	%f18
	bmask	%o6,	%l5,	%i1
	fsrc1	%f14,	%f22
	call	loop_1004
	fmovrde	%i7,	%f16,	%f24
	fmovsle	%icc,	%f31,	%f6
	umulcc	%l2,	%g3,	%g7
loop_1004:
	tcs	%icc,	0x1
	rdpr	%tl,	%i6
	fmuld8ulx16	%f4,	%f0,	%f26
	call	loop_1005
	tn	%xcc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDD4, 	%hsys_tick_cmpr
	fmovdo	%fcc3,	%f8,	%f30
loop_1005:
	rdhpr	%htba,	%g1
	or	%l3,	0x047D,	%i4
	wrpr	%i5,	0x0896,	%tick
	fsrc1	%f4,	%f18
	fblg,pt	%fcc2,	loop_1006
	sra	%o2,	0x12,	%g2
	alignaddr	%l6,	%o5,	%o1
	add	%g4,	0x066A,	%l0
loop_1006:
	fmul8x16al	%f5,	%f10,	%f30
	move	%fcc1,	%g5,	%i2
	call	loop_1007
	nop
	setx	0x9F0D3EEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f13
	taddcctv	%o0,	0x05F6,	%g6
	call	loop_1008
loop_1007:
	fmul8sux16	%f30,	%f30,	%f12
	edge8	%i0,	%o3,	%l1
	fbl,a,pt	%fcc3,	loop_1009
loop_1008:
	call	loop_1010
	fmovspos	%icc,	%f4,	%f2
	nop
	fitod	%f10,	%f24
	fdtos	%f24,	%f12
loop_1009:
	fzeros	%f17
loop_1010:
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x18,	%l4
	tsubcc	%o6,	%l5,	%o7
	call	loop_1011
	fxnor	%f26,	%f10,	%f0
	call	loop_1012
	fmovrdgz	%i7,	%f14,	%f30
loop_1011:
	movcs	%icc,	0x48A,	%i1
	call	loop_1013
loop_1012:
	call	loop_1014
	bne	%xcc,	loop_1015
	umul	%l2,	%g7,	%g3
loop_1013:
	movul	%fcc1,	0x37A,	%i6
loop_1014:
	fmovscc	%icc,	%f1,	%f19
loop_1015:
	call	loop_1016
	call	loop_1017
	call	loop_1018
	bl	%xcc,	loop_1019
loop_1016:
	nop
	setx	0x11D9E74C1AB53990,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x7906F936B80952AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f0
loop_1017:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1018:
	orn	%o4,	%i3,	%l3
loop_1019:
	call	loop_1020
	smul	%i4,	0x0AEA,	%i5
	fmovsvc	%xcc,	%f30,	%f1
	ldd	[%l7 + 0x50],	%f8
loop_1020:
	fmovdue	%fcc3,	%f4,	%f28
	edge8l	%g1,	%g2,	%l6
	call	loop_1021
	fzeros	%f19
	call	loop_1022
	fmovdge	%xcc,	%f26,	%f4
loop_1021:
	fornot2	%f20,	%f26,	%f28
	fpsub16s	%f7,	%f7,	%f28
loop_1022:
	call	loop_1023
	subc	%o5,	0x16D8,	%o1
	call	loop_1024
	fmovdgu	%xcc,	%f26,	%f16
loop_1023:
	edge16ln	%g4,	%o2,	%l0
	rdpr	%wstate,	%g5
loop_1024:
	nop
	setx	0x62F0C06E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xCFF43181,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f6,	%f29
	fmovsug	%fcc1,	%f12,	%f7
	andn	%o0,	%g6,	%i2
	call	loop_1025
	call	loop_1026
	popc	%o3,	%i0
	fmovsn	%icc,	%f7,	%f12
loop_1025:
	fcmpne16	%f2,	%f20,	%l4
loop_1026:
	fmovsvc	%xcc,	%f17,	%f6
	wrpr	%o6,	0x1690,	%tick
	movu	%fcc3,	%l1,	%o7
	tvs	%xcc,	0x1
	fzero	%f16
	fpsub32	%f20,	%f26,	%f0
	or	%l5,	%i7,	%i1
	movrne	%l2,	%g7,	%i6
	fmul8ulx16	%f18,	%f10,	%f2
	umulcc	%o4,	0x1229,	%g3
	call	loop_1027
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%l3
	edge16ln	%i3,	%i5,	%i4
	fandnot1s	%f5,	%f15,	%f26
loop_1027:
	fcmpd	%fcc2,	%f8,	%f2
	subcc	%g2,	%g1,	%l6
	edge16ln	%o1,	%g4,	%o2
	call	loop_1028
	fones	%f24
	movl	%fcc3,	%l0,	%o5
	movu	%fcc3,	%o0,	%g5
loop_1028:
	call	loop_1029
	call	loop_1030
	fcmpne32	%f14,	%f26,	%g6
	fbu,a	%fcc2,	loop_1031
loop_1029:
	movg	%fcc3,	%o3,	%i2
loop_1030:
	fnot2s	%f12,	%f17
	call	loop_1032
loop_1031:
	call	loop_1033
	fzeros	%f10
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x54] %asi
loop_1032:
	tle	%icc,	0x5
loop_1033:
	fmovdcc	%icc,	%f0,	%f14
	fmovsne	%fcc2,	%f20,	%f16
	nop
	setx	0xEC222E57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f26
	call	loop_1034
	call	loop_1035
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f28
	call	loop_1036
loop_1034:
	fcmpne32	%f30,	%f16,	%i0
loop_1035:
	fmovrsgz	%o6,	%f16,	%f13
	call	loop_1037
loop_1036:
	call	loop_1038
	fmovrsne	%l4,	%f23,	%f7
	nop
	setx	0x939C7ED5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x00B80145,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f22,	%f10
loop_1037:
	fmovsvs	%icc,	%f29,	%f31
loop_1038:
	xnor	%l1,	%o7,	%i7
	call	loop_1039
	call	loop_1040
	tn	%xcc,	0x1
	alignaddr	%i1,	%l5,	%g7
loop_1039:
	fmovdule	%fcc2,	%f26,	%f8
loop_1040:
	call	loop_1041
	call	loop_1042
	call	loop_1043
	fmovscs	%icc,	%f13,	%f25
loop_1041:
	call	loop_1044
loop_1042:
	movpos	%xcc,	0x55F,	%i6
loop_1043:
	fsrc2	%f8,	%f2
loop_1044:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 20
!	Type a   	: 30
!	Type x   	: 10
!	Type cti   	: 142
!	Type f   	: 161
!	Type i   	: 137
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
	set	0x3,	%g1
	set	0xE,	%g2
	set	0x9,	%g3
	set	0x0,	%g4
	set	0x5,	%g5
	set	0x9,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x3,	%i1
	set	-0x8,	%i2
	set	-0x6,	%i3
	set	-0xD,	%i4
	set	-0x3,	%i5
	set	-0xF,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x0BE9CE22,	%l0
	set	0x7D942E6E,	%l1
	set	0x10734522,	%l2
	set	0x3A8E21D2,	%l3
	set	0x0D812299,	%l4
	set	0x4E58753C,	%l5
	set	0x2778EA33,	%l6
	!# Output registers
	set	0x19DE,	%o0
	set	0x1DAB,	%o1
	set	-0x0FB4,	%o2
	set	-0x1003,	%o3
	set	0x0739,	%o4
	set	-0x0134,	%o5
	set	-0x0CCF,	%o6
	set	-0x03F1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAC3344719CFCD6C1)
	INIT_TH_FP_REG(%l7,%f2,0xA2A5A920FC612357)
	INIT_TH_FP_REG(%l7,%f4,0xBA061E9244E50302)
	INIT_TH_FP_REG(%l7,%f6,0x4543ACC7786610A3)
	INIT_TH_FP_REG(%l7,%f8,0x58FD319F7860BF49)
	INIT_TH_FP_REG(%l7,%f10,0xDF8EDB8C8152F047)
	INIT_TH_FP_REG(%l7,%f12,0x0BCA81CAC0EFAE75)
	INIT_TH_FP_REG(%l7,%f14,0x63BD9C75BB592910)
	INIT_TH_FP_REG(%l7,%f16,0x5408726960E5329B)
	INIT_TH_FP_REG(%l7,%f18,0xFCC5C59172B01F7B)
	INIT_TH_FP_REG(%l7,%f20,0x52B9F30A96F48BF1)
	INIT_TH_FP_REG(%l7,%f22,0x070089E347A91777)
	INIT_TH_FP_REG(%l7,%f24,0x021DB5907C49D759)
	INIT_TH_FP_REG(%l7,%f26,0x79BDF86A61BD8098)
	INIT_TH_FP_REG(%l7,%f28,0x357AC944B6AE599A)
	INIT_TH_FP_REG(%l7,%f30,0x43102DA241581589)

	!# Execute Main Diag ..

	movl	%icc,	0x4DF,	%o4
	fbue,a	%fcc3,	loop_1045
	movrlez	%g3,	0x307,	%l3
	call	loop_1046
	call	loop_1047
loop_1045:
	fmovsge	%fcc2,	%f15,	%f22
	nop
	setx	0x2C576A7EF8ABD1B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x875B8FC21E11F624,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f12,	%f22
loop_1046:
	fmovsug	%fcc0,	%f29,	%f0
loop_1047:
	fcmple32	%f24,	%f24,	%l2
	fmovsue	%fcc3,	%f24,	%f8
	fcmple16	%f12,	%f30,	%i3
	call	loop_1048
	fmovsvc	%icc,	%f18,	%f19
	orn	%i5,	%g2,	%g1
	fpmerge	%f31,	%f12,	%f8
loop_1048:
	nop
	fitos	%f15,	%f7
	sir	0x183A
	udivcc	%l6,	0x0F0D,	%i4
	call	loop_1049
	call	loop_1050
	fmovsa	%xcc,	%f7,	%f1
	fcmple16	%f8,	%f16,	%o1
loop_1049:
	fmovrslez	%o2,	%f14,	%f6
loop_1050:
	fmovdo	%fcc3,	%f14,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB4F, 	%hsys_tick_cmpr
	call	loop_1051
	fmovda	%icc,	%f18,	%f10
	taddcc	%o5,	%g4,	%g5
	call	loop_1052
loop_1051:
	fmovdpos	%icc,	%f16,	%f28
	call	loop_1053
	fmovsneg	%icc,	%f17,	%f5
loop_1052:
	fmovrde	%g6,	%f10,	%f24
	fbug,pt	%fcc2,	loop_1054
loop_1053:
	fpack32	%f28,	%f28,	%f28
	tne	%icc,	0x5
	fmovdpos	%xcc,	%f30,	%f30
loop_1054:
	call	loop_1055
	fbug,a,pn	%fcc0,	loop_1056
	edge16n	%o0,	%i2,	%o3
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1055:
	call	loop_1057
loop_1056:
	fmovrdne	%i0,	%f6,	%f0
	call	loop_1058
	fmuld8sux16	%f17,	%f10,	%f0
loop_1057:
	alignaddrl	%l4,	%o6,	%l1
	call	loop_1059
loop_1058:
	bvs,a,pt	%xcc,	loop_1060
	fnegs	%f28,	%f6
	fba,a,pt	%fcc2,	loop_1061
loop_1059:
	movcc	%icc,	0x385,	%i7
loop_1060:
	call	loop_1062
	fmovsvs	%icc,	%f16,	%f1
loop_1061:
	edge16ln	%i1,	%l5,	%g7
	sdivx	%i6,	0x0A9D,	%o4
loop_1062:
	call	loop_1063
	edge32n	%g3,	%o7,	%l2
	bleu,a,pn	%xcc,	loop_1064
	fmovrdlez	%i3,	%f10,	%f18
loop_1063:
	taddcctv	%i5,	0x093C,	%g2
	call	loop_1065
loop_1064:
	call	loop_1066
	membar	0x6F
	fnands	%f11,	%f23,	%f21
loop_1065:
	fpadd32s	%f21,	%f29,	%f2
loop_1066:
	call	loop_1067
	call	loop_1068
	array32	%g1,	%l3,	%l6
	call	loop_1069
loop_1067:
	call	loop_1070
loop_1068:
	brz,a	%i4,	loop_1071
	fmovsa	%xcc,	%f7,	%f29
loop_1069:
	fcmple32	%f12,	%f10,	%o1
loop_1070:
	orncc	%l0,	0x0738,	%o2
loop_1071:
	nop
	fitos	%f13,	%f9
	fstox	%f9,	%f0
	taddcctv	%o5,	%g4,	%g5
	fcmpes	%fcc1,	%f4,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvc	%xcc,	0x3
	fand	%f16,	%f12,	%f20
	subcc	%o3,	0x187D,	%i0
	movue	%fcc3,	0x537,	%i2
	call	loop_1072
	and	%l4,	0x07E1,	%o6
	fxors	%f18,	%f1,	%f17
	call	loop_1073
loop_1072:
	call	loop_1074
	fmovdle	%fcc3,	%f26,	%f24
	ldstub	[%l7 + 0x4B],	%i7
loop_1073:
	fxnors	%f1,	%f0,	%f25
loop_1074:
	movl	%fcc3,	%i1,	%l5
	call	loop_1075
	tpos	%icc,	0x5
	call	loop_1076
	wrpr	%g7,	0x1CA0,	%tick
loop_1075:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%l1
loop_1076:
	call	loop_1077
	nop
	set	0x10, %o2
	stx	%o4,	[%l7 + %o2]
	call	loop_1078
	fmovsn	%fcc2,	%f9,	%f26
loop_1077:
	edge16l	%g3,	%o7,	%l2
	sir	0x01B7
loop_1078:
	nop
	fitod	%f8,	%f24
	nop
	setx	0x377FE52F267A38D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmovsg	%xcc,	%f10,	%f8
	fors	%f15,	%f2,	%f20
	fbue,a,pt	%fcc2,	loop_1079
	call	loop_1080
	call	loop_1081
	fcmpne16	%f16,	%f14,	%i6
loop_1079:
	array16	%i5,	%g2,	%i3
loop_1080:
	fcmpeq16	%f16,	%f30,	%l3
loop_1081:
	fandnot2s	%f8,	%f24,	%f9
	fmovdcs	%icc,	%f16,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcs	%xcc,	0x0
	smulcc	%i4,	%l0,	%o1
	call	loop_1082
	orncc	%o2,	0x0A53,	%o5
	sub	%g5,	0x0DC1,	%o0
	call	loop_1083
loop_1082:
	smul	%g6,	%g4,	%o3
	call	loop_1084
	rdpr	%tl,	%i0
loop_1083:
	andn	%i2,	0x1BD3,	%l4
	mova	%icc,	0x1C4,	%o6
loop_1084:
	smul	%i1,	%l5,	%g7
	fors	%f1,	%f1,	%f13
	array8	%l1,	%i7,	%g3
	fnot1	%f30,	%f10
	sll	%o4,	%o7,	%i6
	brlz,pn	%i5,	loop_1085
	fcmpgt16	%f30,	%f26,	%l2
	set	0x30, %l5
	stxa	%i3,	[%l7 + %l5] 0x27
	membar	#Sync
loop_1085:
	movul	%fcc3,	%l3,	%g2
	call	loop_1086
	fmovdul	%fcc0,	%f14,	%f28
	faligndata	%f12,	%f10,	%f8
	movpos	%xcc,	%l6,	%g1
loop_1086:
	movrgz	%l0,	%o1,	%i4
	call	loop_1087
	fmul8x16al	%f10,	%f24,	%f6
	bl,a	%xcc,	loop_1088
	call	loop_1089
loop_1087:
	membar	0x2F
	taddcc	%o2,	0x1734,	%o5
loop_1088:
	alignaddr	%o0,	%g6,	%g4
loop_1089:
	call	loop_1090
	call	loop_1091
	rdhpr	%htba,	%o3
	bcc,a,pn	%icc,	loop_1092
loop_1090:
	call	loop_1093
loop_1091:
	tvc	%xcc,	0x7
	andcc	%g5,	%i0,	%l4
loop_1092:
	fmovrdlez	%o6,	%f26,	%f6
loop_1093:
	call	loop_1094
	fnegd	%f16,	%f30
	tpos	%xcc,	0x1
	bl	%xcc,	loop_1095
loop_1094:
	call	loop_1096
	movvs	%icc,	%i1,	%i2
	call	loop_1097
loop_1095:
	tpos	%xcc,	0x5
loop_1096:
	movrgez	%g7,	0x35C,	%l5
	call	loop_1098
loop_1097:
	edge16ln	%l1,	%i7,	%o4
	nop
	setx	0x9472E6C1B5B65A15,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCC192658B74AA8B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f12,	%f2
	nop
	setx	0x598F9F69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x496895B5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f15,	%f31
loop_1098:
	srl	%g3,	%i6,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA12, 	%hsys_tick_cmpr
	call	loop_1099
	fzeros	%f30
	st	%f10,	[%l7 + 0x30]
	movvc	%xcc,	0x453,	%i3
loop_1099:
	call	loop_1100
	call	loop_1101
	call	loop_1102
	call	loop_1103
loop_1100:
	nop
	setx	0x07B8,	%l0,	%g2
	sdiv	%o7,	%g2,	%l3
loop_1101:
	call	loop_1104
loop_1102:
	call	loop_1105
loop_1103:
	tn	%icc,	0x1
	nop
	setx	0x1D0A,	%l0,	%l6
	udivcc	%g1,	%l6,	%o1
loop_1104:
	nop
	setx	0x85126C4137AB12BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f14
loop_1105:
	smulcc	%l0,	0x083E,	%o2
	fsrc2	%f20,	%f0
	call	loop_1106
	membar	0x6C
	fmuld8ulx16	%f21,	%f2,	%f10
	fbul,a	%fcc2,	loop_1107
loop_1106:
	bg,pn	%xcc,	loop_1108
	call	loop_1109
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%i4
loop_1107:
	call	loop_1110
loop_1108:
	call	loop_1111
loop_1109:
	fcmple32	%f4,	%f20,	%o0
	call	loop_1112
loop_1110:
	fxor	%f2,	%f0,	%f2
loop_1111:
	fornot1	%f4,	%f24,	%f6
	tne	%xcc,	0x0
loop_1112:
	mova	%xcc,	%o5,	%g4
	call	loop_1113
	fxnor	%f18,	%f10,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	setx	0x12A1,	%l0,	%l4
	udiv	%o3,	%l4,	%o6
loop_1113:
	call	loop_1114
	sir	0x102D
	fmovdneg	%icc,	%f8,	%f16
	fmovspos	%icc,	%f22,	%f13
loop_1114:
	sra	%i1,	0x0F,	%i0
	fmovdcs	%icc,	%f8,	%f16
	nop
	setx	0x8AA93784573CB857,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFC3FA41B5B9BFA04,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f22,	%f22
	ldx	[%l7 + 0x70],	%i2
	call	loop_1115
	call	loop_1116
	alignaddrl	%l5,	%l1,	%i7
	fandnot2	%f10,	%f18,	%f10
loop_1115:
	nop
	setx	0xD08BBAC5B579E357,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xBB5528A9FAB654F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f22
loop_1116:
	fmovdug	%fcc2,	%f10,	%f16
	fmovsu	%fcc2,	%f20,	%f16
	fmovse	%fcc3,	%f31,	%f31
	call	loop_1117
	and	%o4,	0x15C8,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x04,	%g7,	%i6
loop_1117:
	call	loop_1118
	call	loop_1119
	edge32ln	%l2,	%i3,	%i5
	fcmpne32	%f24,	%f8,	%g2
loop_1118:
	fcmpes	%fcc2,	%f17,	%f15
loop_1119:
	nop
	wr	%g0,	0xd9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovrsgz	%o7,	%f11,	%f16
	fmovdul	%fcc2,	%f28,	%f8
	fone	%f12
	call	loop_1120
	call	loop_1121
	fmovrsgez	%l3,	%f2,	%f16
	call	loop_1122
loop_1120:
	bleu,pn	%icc,	loop_1123
loop_1121:
	call	loop_1124
	fmovsn	%fcc3,	%f21,	%f13
loop_1122:
	nop
	setx	0xB56D74062D9718BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
loop_1123:
	bn	%xcc,	loop_1125
loop_1124:
	call	loop_1126
	fexpand	%f8,	%f12
	fmovdl	%xcc,	%f28,	%f26
loop_1125:
	movcc	%icc,	%g1,	%l6
loop_1126:
	srl	%o1,	%l0,	%i4
	ldsh	[%l7 + 0x6E],	%o0
	fmovsn	%fcc2,	%f12,	%f23
	orn	%o5,	0x0A1F,	%o2
	flushw
	fornot2s	%f14,	%f3,	%f25
	fpackfix	%f4,	%f17
	fmovs	%f30,	%f5
	fsrc1	%f6,	%f20
	xorcc	%g6,	0x0533,	%g4
	udiv	%g5,	0x0201,	%l4
	tneg	%xcc,	0x2
	array32	%o6,	%o3,	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAEC, 	%hsys_tick_cmpr
	call	loop_1127
	rdpr	%cwp,	%i0
	call	loop_1128
	fcmple32	%f12,	%f28,	%l5
loop_1127:
	call	loop_1129
	call	loop_1130
loop_1128:
	ldub	[%l7 + 0x74],	%l1
	rd	%fprs,	%o4
loop_1129:
	call	loop_1131
loop_1130:
	fmovdue	%fcc1,	%f20,	%f0
	fpadd32s	%f16,	%f17,	%f8
	call	loop_1132
loop_1131:
	fornot1	%f26,	%f16,	%f2
	call	loop_1133
	nop
	setx	loop_1134,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034400001401,	%l0,	%l1
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
loop_1132:
	fpack16	%f14,	%f28
	fandnot1s	%f0,	%f3,	%f21
loop_1133:
	nop
	setx	loop_1135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1134:
	fpadd32	%f30,	%f14,	%f2
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%i7
loop_1135:
	fpackfix	%f18,	%f30
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x13] %asi,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%i6
	tsubcctv	%l2,	%i5,	%i3
	umul	%o7,	0x0651,	%g2
	call	loop_1136
	fmovrse	%l3,	%f9,	%f2
	andn	%l6,	0x0A72,	%o1
	rdhpr	%ver,	%l0
loop_1136:
	call	loop_1137
	call	loop_1138
	movpos	%icc,	%i4,	%g1
	xnorcc	%o0,	0x08AC,	%o2
loop_1137:
	edge8	%g6,	%g4,	%o5
loop_1138:
	nop
	set	0x72, %i7
	sth	%l4,	[%l7 + %i7]
	ldstub	[%l7 + 0x44],	%g5
	rdpr	%pil,	%o3
	edge32n	%o6,	%i1,	%i2
	call	loop_1139
	fmovsul	%fcc0,	%f27,	%f4
	fmovso	%fcc0,	%f19,	%f29
	call	loop_1140
loop_1139:
	fornot2	%f16,	%f28,	%f16
	fornot1	%f12,	%f30,	%f10
	call	loop_1141
loop_1140:
	andncc	%l5,	%i0,	%l1
	bpos,a,pn	%xcc,	loop_1142
	tl	%xcc,	0x5
loop_1141:
	call	loop_1143
	call	loop_1144
loop_1142:
	lduw	[%l7 + 0x70],	%i7
	or	%o4,	0x07C9,	%g3
loop_1143:
	fmovdlg	%fcc3,	%f12,	%f8
loop_1144:
	rdpr	%canrestore,	%g7
	edge16	%i6,	%l2,	%i5
	and	%i3,	0x1C5D,	%o7
	set	0x5E, %i1
	ldsha	[%l7 + %i1] 0x18,	%g2
	call	loop_1145
	fornot2	%f26,	%f20,	%f18
	xorcc	%l6,	0x0C7B,	%l3
	array32	%o1,	%l0,	%i4
loop_1145:
	nop
	setx	0x244C2F13,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x97F95764,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f12,	%f29
	fpadd16	%f24,	%f28,	%f12
	move	%fcc3,	%o0,	%g1
	call	loop_1146
	tn	%icc,	0x5
	call	loop_1147
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%g6
loop_1146:
	stb	%o2,	[%l7 + 0x60]
	fnot1	%f16,	%f30
loop_1147:
	call	loop_1148
	fmovsge	%fcc3,	%f16,	%f29
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%g4
loop_1148:
	sllx	%l4,	0x08,	%o5
	nop
	setx	0xCA7A1568,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x6B4AC594,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f9,	%f3
	tcs	%icc,	0x7
	rd	%ccr,	%o3
	fexpand	%f26,	%f18
	call	loop_1149
	tl	%icc,	0x5
	call	loop_1150
	fmovdule	%fcc1,	%f12,	%f30
loop_1149:
	movgu	%xcc,	%o6,	%g5
	fmovsu	%fcc2,	%f27,	%f23
loop_1150:
	call	loop_1151
	edge32l	%i1,	%l5,	%i2
	flushw
	edge8l	%l1,	%i0,	%i7
loop_1151:
	call	loop_1152
	call	loop_1153
	fmovrsgz	%o4,	%f27,	%f16
	call	loop_1154
loop_1152:
	flush	%l7 + 0x18
loop_1153:
	fmovdn	%xcc,	%f16,	%f22
	call	loop_1155
loop_1154:
	call	loop_1156
	ta	%xcc,	0x2
	fcmpgt16	%f28,	%f12,	%g7
loop_1155:
	fpsub16s	%f31,	%f25,	%f30
loop_1156:
	fmovdne	%icc,	%f14,	%f30
	call	loop_1157
	call	loop_1158
	fandnot2s	%f10,	%f6,	%f5
	call	loop_1159
loop_1157:
	call	loop_1160
loop_1158:
	movug	%fcc3,	%g3,	%l2
	call	loop_1161
loop_1159:
	call	loop_1162
loop_1160:
	flushw
	fmovdvc	%icc,	%f20,	%f8
loop_1161:
	addcc	%i5,	%i6,	%o7
loop_1162:
	movneg	%xcc,	0x353,	%g2
	and	%l6,	0x17B5,	%l3
	call	loop_1163
	call	loop_1164
	call	loop_1165
	fpadd32s	%f17,	%f29,	%f7
loop_1163:
	tgu	%xcc,	0x0
loop_1164:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f0
loop_1165:
	movg	%icc,	0x0B5,	%o1
	call	loop_1166
	orn	%l0,	%i4,	%i3
	call	loop_1167
	call	loop_1168
loop_1166:
	fmovso	%fcc3,	%f3,	%f2
	fcmpne16	%f10,	%f28,	%o0
loop_1167:
	call	loop_1169
loop_1168:
	te	%xcc,	0x4
	mulx	%g6,	0x017D,	%o2
	move	%fcc1,	0x71F,	%g4
loop_1169:
	nop
	set	0x65, %i0
	lduba	[%l7 + %i0] 0x0c,	%g1
	call	loop_1170
	fors	%f6,	%f24,	%f25
	call	loop_1171
	fmovspos	%xcc,	%f25,	%f21
loop_1170:
	fmul8x16	%f22,	%f30,	%f16
	fcmpd	%fcc2,	%f12,	%f22
loop_1171:
	rdhpr	%hintp,	%l4
	array16	%o5,	%o6,	%g5
	movlg	%fcc3,	%o3,	%l5
	call	loop_1172
	fbne,pn	%fcc2,	loop_1173
	fnot1s	%f1,	%f2
	nop
	setx	0x7B22E843,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f7
loop_1172:
	movrne	%i1,	0x33B,	%i2
loop_1173:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x026, 	%hsys_tick_cmpr
	movne	%xcc,	%o4,	%l1
	call	loop_1174
	bpos,a,pn	%icc,	loop_1175
	tneg	%icc,	0x4
	nop
	setx	0x0B89,	%l0,	%g3
	sdivx	%g7,	%g3,	%l2
loop_1174:
	tgu	%icc,	0x4
loop_1175:
	call	loop_1176
	rdhpr	%hsys_tick_cmpr,	%i6
	subcc	%o7,	0x0691,	%i5
	sllx	%l6,	%l3,	%o1
loop_1176:
	movrlz	%g2,	%l0,	%i4
	srlx	%o0,	%g6,	%i3
	fpmerge	%f13,	%f15,	%f4
	fmovsul	%fcc2,	%f5,	%f20
	nop
	setx	0x420D699143E286CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8E116D50,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f14,	%f0
	movvc	%icc,	%o2,	%g1
	fmovdo	%fcc0,	%f6,	%f14
	xnor	%g4,	0x100C,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAE2, 	%hsys_tick_cmpr
	fmovdne	%icc,	%f20,	%f24
	sra	%o6,	%o3,	%l5
	fone	%f0
	call	loop_1177
	fmovsge	%xcc,	%f5,	%f27
	movue	%fcc3,	%g5,	%i1
	call	loop_1178
loop_1177:
	sllx	%i2,	%i7,	%i0
	rdpr	%cansave,	%l1
	set	0x60, %l1
	ldsha	[%l7 + %l1] 0x89,	%o4
loop_1178:
	call	loop_1179
	nop
	fitos	%f31,	%f16
	wr	%g0,	0x52,	%asi
	stxa	%g3,	[%g0 + 0x220] %asi
loop_1179:
	tleu	%xcc,	0x6
	fmovrslz	%g7,	%f26,	%f7
	fxnors	%f8,	%f19,	%f1
	fba,a,pn	%fcc2,	loop_1180
	nop
	fitos	%f14,	%f2
	fstoi	%f2,	%f29
	fornot1s	%f0,	%f5,	%f31
	sllx	%l2,	0x15,	%i6
loop_1180:
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f14
	edge16ln	%o7,	%i5,	%l3
	call	loop_1181
	bvc,a,pn	%icc,	loop_1182
	or	%l6,	%o1,	%l0
	tcc	%icc,	0x5
loop_1181:
	fmovsul	%fcc0,	%f1,	%f13
loop_1182:
	fsrc1	%f22,	%f28
	stbar
	movgu	%xcc,	%g2,	%i4
	call	loop_1183
	tvc	%xcc,	0x2
	nop
	set	0x10, %o3
	std	%g6,	[%l7 + %o3]
	rdhpr	%hintp,	%o0
loop_1183:
	movgu	%xcc,	0x791,	%i3
	edge8	%g1,	%g4,	%o2
	addccc	%l4,	%o5,	%o6
	fnands	%f10,	%f11,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge16ln	%g5,	%i1,	%i2
	call	loop_1184
	fcmpeq16	%f26,	%f14,	%i7
	fmovsle	%xcc,	%f20,	%f7
	call	loop_1185
loop_1184:
	fandnot1s	%f31,	%f29,	%f30
	nop
	set	0x78, %g7
	ldsh	[%l7 + %g7],	%i0
	nop
	set	0x24, %o4
	ldsb	[%l7 + %o4],	%o3
loop_1185:
	fcmpes	%fcc2,	%f24,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_1186
	bge	%icc,	loop_1187
	fands	%f1,	%f10,	%f31
	fmul8x16	%f14,	%f26,	%f2
loop_1186:
	brgez,pt	%o4,	loop_1188
loop_1187:
	stw	%g7,	[%l7 + 0x20]
	movuge	%fcc2,	%i6,	%l2
	fmovdule	%fcc3,	%f16,	%f8
loop_1188:
	call	loop_1189
	rdhpr	%hpstate,	%i5
	addc	%l3,	%o7,	%o1
	movpos	%icc,	%l0,	%g2
loop_1189:
	call	loop_1190
	srl	%l6,	0x12,	%g6
loop_1190:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 32
!	Type a   	: 24
!	Type x   	: 12
!	Type cti   	: 146
!	Type f   	: 146
!	Type i   	: 140
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x484BCCF7
.word 0x23E5B0CE
.word 0x41426246
.word 0x5B719DD7
.word 0x90643F0C
.word 0xAAC7A12A
.word 0x96AB0CF3
.word 0x710E356C
.word 0x223818F6
.word 0xDA86FD45
.word 0x6A115864
.word 0xD5F8B25D
.word 0x5FF436C3
.word 0xCB8F489C
.word 0x11B870C2
.word 0xADA4F434
.word 0x2C31D654
.word 0x87F693B9
.word 0x5E6F3093
.word 0xE18302B0
.word 0x6CC10DE9
.word 0xB2EAA874
.word 0xEEC99070
.word 0xDD91B04D
.word 0x9EDC9BCA
.word 0x90CA5C7E
.word 0xF7F09665
.word 0x34F3054C
.word 0xBA064DAC
.word 0x3356CB30
.word 0xD1DA312A
.word 0xB5A9B7F7
.word 0x64571417
.word 0xF5429C91
.word 0x3814191D
.word 0xB00F9485
.word 0xBD6C8118
.word 0x43CBDBEA
.word 0x4A616493
.word 0xDEAD3931
.word 0xEA6A85B3
.word 0x008BCF44
.word 0xDC7CF886
.word 0x1E2DDD60
.word 0x6824C711
.word 0xAF922A66
.word 0x541816FE
.word 0xF1A70AEF
.word 0xB6E3E0AD
.word 0xB190A254
.word 0xFA88EFC1
.word 0x0E00DAFD
.word 0x9EFDD338
.word 0x176AEE6F
.word 0x5D9AED5A
.word 0xFC8C2777
.word 0x6DBE2E01
.word 0x25E49C69
.word 0xC4C25ECA
.word 0x73D68590
.word 0xA0461A69
.word 0x7DA894DA
.word 0x4D69AAF4
.word 0xA966308F
.end
