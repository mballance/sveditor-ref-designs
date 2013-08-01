/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_09.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=125457"
.ident "Mon Dec  8 19:24:43 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_09.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0xB,	%g1
	set	0x8,	%g2
	set	0xB,	%g3
	set	0x4,	%g4
	set	0x7,	%g5
	set	0x3,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x7,	%i1
	set	-0x8,	%i2
	set	-0x9,	%i3
	set	-0x9,	%i4
	set	-0x2,	%i5
	set	-0x9,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x6858E7A0,	%l0
	set	0x559E8655,	%l1
	set	0x07015E46,	%l2
	set	0x41FC7196,	%l3
	set	0x53EFF5F3,	%l4
	set	0x55E793B9,	%l5
	set	0x22A6C3CC,	%l6
	!# Output registers
	set	-0x0969,	%o0
	set	0x0BB1,	%o1
	set	0x07A0,	%o2
	set	-0x0228,	%o3
	set	-0x1440,	%o4
	set	-0x0A75,	%o5
	set	0x0C56,	%o6
	set	0x14A7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	call	loop_1
	fmuld8sux16	%f0,	%f30,	%f24
	movcc	%xcc,	0x254,	%o4
	fors	%f23,	%f27,	%f19
loop_1:
	edge16ln	%l5,	%o2,	%o6
	nop
	setx	0x549CA263719B42CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f20
	movo	%fcc3,	%o1,	%o7
	movleu	%icc,	%i5,	%g3
	nop
	fitos	%f2,	%f13
	fstox	%f13,	%f14
	fxtos	%f14,	%f13
	call	loop_2
	fmovdgu	%xcc,	%f4,	%f22
	tcc	%xcc,	0x5
	fbe,a,pt	%fcc0,	loop_3
loop_2:
	ta	%icc,	0x1
	tg	%xcc,	0x1
	edge32n	%i2,	%o0,	%o5
loop_3:
	ba,a,pt	%xcc,	loop_4
	flushw
	srax	%g5,	0x10,	%l0
	edge8ln	%i1,	%l4,	%g4
loop_4:
	nop
	fitos	%f14,	%f11
	fstod	%f11,	%f20
	call	loop_5
	alignaddrl	%o3,	%l2,	%l6
	call	loop_6
	rdpr	%cleanwin,	%i3
loop_5:
	subcc	%g7,	0x06BB,	%g6
	fand	%f6,	%f2,	%f4
loop_6:
	tvc	%icc,	0x5
	fxnor	%f24,	%f16,	%f0
	call	loop_7
	addccc	%g2,	0x0CB2,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlez	%i6,	0x373,	%i0
loop_7:
	wr	%i7,	%o4,	%sys_tick
	fmovsue	%fcc1,	%f26,	%f19
	movrgz	%g1,	0x2EB,	%l5
	smul	%o2,	0x1076,	%o1
	call	loop_8
	xnor	%o7,	%o6,	%g3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i5
loop_8:
	addcc	%i2,	%o5,	%g5
	smulcc	%o0,	%i1,	%l4
	nop
	setx	0xD33C0563,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	call	loop_9
	or	%g4,	%o3,	%l0
	call	loop_10
	fmovs	%f13,	%f6
loop_9:
	edge16	%l2,	%i3,	%l6
	fmovdg	%icc,	%f0,	%f26
loop_10:
	fbge,pt	%fcc1,	loop_11
	call	loop_12
	edge32ln	%g7,	%g6,	%g2
	call	loop_13
loop_11:
	fcmpd	%fcc0,	%f26,	%f28
loop_12:
	rd	%y,	%i4
	set	0x7C, %g3
	lduwa	[%l7 + %g3] 0x88,	%l1
loop_13:
	nop
	setx	0x1271E71D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xD4201E23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f9,	%f26
	nop
	setx	loop_14,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x022100001405,	%l0,	%l1
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
	call	loop_15
	edge16ln	%i6,	%l3,	%i7
	call	loop_16
loop_14:
	fmovscs	%xcc,	%f9,	%f3
loop_15:
	nop
	wr	%g0,	0x4f,	%asi
	stxa	%i0,	[%g0 + 0x10] %asi
loop_16:
	call	loop_17
	nop
	setx	0x77BE52F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f0
	brz,pn	%g1,	loop_18
	bcc,a,pn	%xcc,	loop_19
loop_17:
	call	loop_20
	fbl	%fcc1,	loop_21
loop_18:
	call	loop_22
loop_19:
	taddcc	%o4,	%o2,	%l5
loop_20:
	bcc,a	%xcc,	loop_23
loop_21:
	rdpr	%cleanwin,	%o7
loop_22:
	fzeros	%f8
	call	loop_24
loop_23:
	fsrc1s	%f28,	%f27
	fbu	%fcc2,	loop_25
	fmovslg	%fcc2,	%f10,	%f23
loop_24:
	fxor	%f10,	%f4,	%f10
	movvc	%xcc,	0x3CF,	%o6
loop_25:
	movlg	%fcc2,	%g3,	%i5
	fsrc1	%f0,	%f10
	siam	0x3
	fornot1s	%f31,	%f2,	%f22
	edge8l	%o1,	%i2,	%o5
	bneg,pn	%xcc,	loop_26
	tsubcctv	%o0,	%g5,	%i1
	fornot1	%f0,	%f14,	%f28
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f16
loop_26:
	call	loop_27
	edge8	%l4,	%o3,	%l0
	fnor	%f30,	%f22,	%f26
	fexpand	%f9,	%f24
loop_27:
	array32	%l2,	%g4,	%l6
	fmovslg	%fcc3,	%f7,	%f4
	nop
	set	0x20, %g6
	std	%f0,	[%l7 + %g6]
	call	loop_28
	tg	%icc,	0x7
	call	loop_29
	call	loop_30
loop_28:
	fnot1	%f30,	%f18
	fpack32	%f24,	%f22,	%f12
loop_29:
	call	loop_31
loop_30:
	fcmpgt32	%f8,	%f0,	%i3
	fmovsleu	%xcc,	%f0,	%f25
	movul	%fcc1,	0x38F,	%g7
loop_31:
	bneg,a	%icc,	loop_32
	call	loop_33
	fmovdue	%fcc0,	%f6,	%f4
	tleu	%icc,	0x2
loop_32:
	tleu	%icc,	0x3
loop_33:
	fpmerge	%f18,	%f13,	%f18
	movue	%fcc2,	%g2,	%g6
	call	loop_34
	movrne	%i4,	0x3C0,	%l1
	call	loop_35
	call	loop_36
loop_34:
	fornot1s	%f13,	%f25,	%f17
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f10
loop_35:
	edge16l	%l3,	%i6,	%i7
loop_36:
	movrlz	%g1,	%i0,	%o2
	call	loop_37
	fmovrdgez	%l5,	%f10,	%f4
	udiv	%o7,	0x1FBA,	%o6
	nop
	setx	0xC024D685,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x3271C4BF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f2,	%f10
loop_37:
	call	loop_38
	edge16	%g3,	%o4,	%i5
	movl	%fcc3,	0x758,	%i2
	fmovrdlez	%o1,	%f16,	%f10
loop_38:
	fands	%f28,	%f28,	%f24
	rd	%tick_cmpr,	%o0
	fmovrdgz	%o5,	%f20,	%f18
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f22
	call	loop_39
	call	loop_40
	call	loop_41
	nop
	setx	0x1999,	%l0,	%l4
	udiv	%g5,	%l4,	%i1
loop_39:
	move	%xcc,	%l0,	%l2
loop_40:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%g4
loop_41:
	fpsub16	%f14,	%f24,	%f18
	call	loop_42
	nop
	setx	0x2B667A9619AB8767,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA579E1E62BC07873,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f20,	%f12
	call	loop_43
	fnot1s	%f11,	%f14
loop_42:
	fsrc1	%f30,	%f20
	fpsub32s	%f19,	%f31,	%f10
loop_43:
	fmovsgu	%xcc,	%f19,	%f2
	call	loop_44
	call	loop_45
	call	loop_46
	call	loop_47
loop_44:
	rd	%y,	%o3
loop_45:
	nop
	setx	loop_48,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_46:
	nop
	fitos	%f14,	%f26
	fstod	%f26,	%f2
loop_47:
	nop
	setx	0x3118D912,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x1C54C028,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f10,	%f9
	fmovso	%fcc1,	%f26,	%f19
loop_48:
	nop
	set	0x08, %i2
	flush	%l7 + %i2
	wr	%l6,	0x1FC0,	%set_softint
	call	loop_49
	call	loop_50
	movu	%fcc2,	%i3,	%g7
	call	loop_51
loop_49:
	fmovdule	%fcc0,	%f8,	%f24
loop_50:
	call	loop_52
	call	loop_53
loop_51:
	fmovsne	%fcc3,	%f27,	%f23
	call	loop_54
loop_52:
	xnorcc	%g2,	%i4,	%l1
loop_53:
	fcmple16	%f14,	%f4,	%g6
	call	loop_55
loop_54:
	movrgez	%l3,	0x149,	%i7
	call	loop_56
	tneg	%icc,	0x6
loop_55:
	sll	%g1,	%i6,	%i0
	wr	%l5,	%o7,	%ccr
loop_56:
	fsrc2	%f16,	%f2
	swap	[%l7 + 0x34],	%o2
	call	loop_57
	bpos	%xcc,	loop_58
	fpsub32s	%f0,	%f4,	%f14
	movrne	%o6,	%g3,	%o4
loop_57:
	fnegd	%f24,	%f26
loop_58:
	fandnot1	%f14,	%f6,	%f30
	call	loop_59
	tsubcctv	%i2,	%o1,	%i5
	call	loop_60
	call	loop_61
loop_59:
	call	loop_62
	call	loop_63
loop_60:
	fxnors	%f4,	%f31,	%f9
loop_61:
	fmovrde	%o5,	%f2,	%f0
loop_62:
	tgu	%icc,	0x3
loop_63:
	fmovrdne	%o0,	%f24,	%f4
	movne	%icc,	%l4,	%g5
	edge8ln	%i1,	%l2,	%g4
	wrpr 	%g0, 	0x1, 	%gl
	fmovdvs	%icc,	%f24,	%f6
	pdist	%f6,	%f26,	%f8
	call	loop_64
	srl	%l0,	%g7,	%i3
	rdpr	%tba,	%i4
	brlz	%l1,	loop_65
loop_64:
	addccc	%g6,	0x003C,	%l3
	rd	%fprs,	%g2
	call	loop_66
loop_65:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tl	%icc,	0x5
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%g0
loop_66:
	fmovscs	%xcc,	%f24,	%f25
	sllx	%i6,	0x06,	%i0
	fmovsne	%fcc1,	%f28,	%f24
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x28] %asi,	%i7
	call	loop_67
	fcmpgt16	%f14,	%f8,	%l5
	alignaddr	%o7,	%o2,	%g3
	movul	%fcc0,	0x204,	%o4
loop_67:
	fmovsn	%icc,	%f18,	%f31
	rdpr	%canrestore,	%o6
	call	loop_68
	call	loop_69
	fpsub16s	%f20,	%f14,	%f3
	call	loop_70
loop_68:
	fpadd16	%f22,	%f2,	%f6
loop_69:
	rd	%asi,	%i2
	call	loop_71
loop_70:
	nop
	setx	0x0FF1,	%l0,	%o1
	udivcc	%i5,	%o1,	%o5
	fabss	%f28,	%f21
	movre	%o0,	0x1E0,	%g5
loop_71:
	call	loop_72
	fcmpgt32	%f18,	%f30,	%l4
	rd	%y,	%l2
	fcmpgt32	%f18,	%f12,	%i1
loop_72:
	fmovslg	%fcc1,	%f2,	%f23
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xea,	%o2
	call	loop_73
	fpadd16s	%f19,	%f28,	%f27
	nop
	setx	0x09CF,	%l1,	%l0
	udivcc	%l6,	%l0,	%g4
	nop
	setx	0xADA5980B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEB6B9F89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f20,	%f0
loop_73:
	call	loop_74
	fpack16	%f18,	%f13
	fmovdgu	%xcc,	%f28,	%f22
	wrpr	%i3,	%g7,	%cwp
loop_74:
	rdhpr	%hsys_tick_cmpr,	%l1
	call	loop_75
	array8	%g6,	%i4,	%l3
	edge32n	%g2,	%i6,	%i0
	fmovdcc	%icc,	%f6,	%f8
loop_75:
	andcc	%i7,	0x0015,	%g1
	call	loop_76
	call	loop_77
	fornot2s	%f25,	%f21,	%f29
	call	loop_78
loop_76:
	edge8	%o7,	%l5,	%g3
loop_77:
	call	loop_79
	nop
	set	0x78, %g2
	std	%o4,	[%l7 + %g2]
loop_78:
	nop
	set	0x10, %o1
	ldsw	[%l7 + %o1],	%o2
	movl	%fcc1,	0x76C,	%o6
loop_79:
	tpos	%xcc,	0x0
	movg	%xcc,	0x78D,	%i5
	tcs	%icc,	0x2
	nop
	fitos	%f4,	%f7
	fstox	%f7,	%f26
	fxtos	%f26,	%f5
	call	loop_80
	call	loop_81
	fbu,pt	%fcc1,	loop_82
	brz,a,pt	%i2,	loop_83
loop_80:
	pdist	%f28,	%f8,	%f30
loop_81:
	fpmerge	%f22,	%f9,	%f14
loop_82:
	fors	%f5,	%f2,	%f3
loop_83:
	fornot2	%f22,	%f20,	%f22
	fsrc1s	%f13,	%f15
	fbule,a	%fcc2,	loop_84
	fmovdge	%fcc3,	%f2,	%f6
	nop
	setx	0x77631156,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2BC15173,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f7,	%f27
	fmovdvs	%xcc,	%f10,	%f4
loop_84:
	edge8	%o5,	%o0,	%o1
	fmovsul	%fcc3,	%f5,	%f15
	call	loop_85
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	bmask	%l4,	%l2,	%i1
	wrpr	%g5,	0x0A30,	%cwp
loop_85:
	movuge	%fcc3,	%o3,	%l0
	movuge	%fcc0,	0x532,	%l6
	call	loop_86
	fcmpgt16	%f18,	%f28,	%i3
	call	loop_87
	fcmpne16	%f16,	%f22,	%g4
loop_86:
	call	loop_88
	call	loop_89
loop_87:
	fmovdleu	%icc,	%f28,	%f24
	call	loop_90
loop_88:
	edge16l	%g7,	%g6,	%l1
loop_89:
	movgu	%icc,	%l3,	%g2
	nop
	setx	0x19C0,	%l0,	%i4
	sdivcc	%i6,	%i4,	%i0
loop_90:
	call	loop_91
	move	%fcc1,	%i7,	%o7
	rdhpr	%hintp,	%g1
	fbg	%fcc1,	loop_92
loop_91:
	call	loop_93
	wr	%g3,	%o4,	%ccr
	movuge	%fcc0,	0x508,	%o2
loop_92:
	movpos	%xcc,	0x62B,	%o6
loop_93:
	call	loop_94
	movneg	%icc,	%i5,	%l5
	add	%o5,	%i2,	%o1
	movrne	%l4,	0x3D7,	%l2
loop_94:
	bcs,pt	%xcc,	loop_95
	call	loop_96
	faligndata	%f28,	%f6,	%f16
	call	loop_97
loop_95:
	tleu	%xcc,	0x4
loop_96:
	movpos	%icc,	%i1,	%g5
	fnegd	%f8,	%f18
loop_97:
	fmovrslz	%o0,	%f25,	%f6
	call	loop_98
	fpadd32	%f16,	%f28,	%f22
	fmovsneg	%xcc,	%f6,	%f5
	call	loop_99
loop_98:
	fornot2s	%f29,	%f17,	%f12
	call	loop_100
	fmovse	%fcc1,	%f16,	%f27
loop_99:
	membar	0x70
	tsubcctv	%o3,	0x1B97,	%l0
loop_100:
	call	loop_101
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	xorcc	%l6,	0x0C03,	%i3
	call	loop_102
loop_101:
	call	loop_103
	call	loop_104
	movrgz	%g4,	0x3B5,	%g7
loop_102:
	call	loop_105
loop_103:
	fornot2s	%f16,	%f0,	%f3
loop_104:
	mulx	%l1,	%l3,	%g6
	call	loop_106
loop_105:
	nop
	setx	0x9518B963,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x9FB5E255,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f5,	%f28
	fmovrslez	%g2,	%f10,	%f12
	sub	%i6,	%i0,	%i4
loop_106:
	mova	%icc,	0x297,	%i7
	nop
	setx loop_107, %l0, %l1
	jmpl %l1, %o7
	fpadd32	%f12,	%f26,	%f22
	fsrc2	%f12,	%f4
	call	loop_108
loop_107:
	fmovrde	%g1,	%f12,	%f28
	sllx	%o4,	%g3,	%o6
	call	loop_109
loop_108:
	call	loop_110
	fmovse	%fcc0,	%f11,	%f20
	fbule,a	%fcc0,	loop_111
loop_109:
	fnands	%f22,	%f31,	%f23
loop_110:
	fmovdvc	%xcc,	%f8,	%f30
	fcmpgt32	%f8,	%f24,	%i5
loop_111:
	call	loop_112
	call	loop_113
	fbu,a	%fcc1,	loop_114
	rdpr	%cwp,	%o2
loop_112:
	for	%f22,	%f4,	%f18
loop_113:
	call	loop_115
loop_114:
	fmovrdgez	%l5,	%f12,	%f22
	sdiv	%i2,	0x07F4,	%o1
	fpsub32s	%f16,	%f5,	%f24
loop_115:
	movrne	%o5,	0x1C6,	%l4
	fmovscs	%icc,	%f0,	%f0
	nop
	set	0x37, %o4
	ldstub	[%l7 + %o4],	%l2
	fpack16	%f22,	%f5
	fmul8x16au	%f5,	%f26,	%f14
	fmovdn	%xcc,	%f8,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wrpr	%i1,	0x000A,	%cwp
	fornot1	%f30,	%f20,	%f26
	call	loop_116
	movl	%xcc,	0x1E4,	%o0
	tsubcctv	%o3,	0x1A2D,	%l0
	call	loop_117
loop_116:
	call	loop_118
	call	loop_119
	fandnot1	%f14,	%f10,	%f28
loop_117:
	fpadd16	%f28,	%f10,	%f28
loop_118:
	wr	%i3,	0x066C,	%ccr
loop_119:
	movg	%fcc1,	%l6,	%g4
	fmovdu	%fcc0,	%f6,	%f18
	rdpr	%gl,	%g7
	nop
	fitos	%f11,	%f28
	fstox	%f28,	%f6
	fandnot2	%f6,	%f4,	%f16
	bl	%icc,	loop_120
	call	loop_121
	xnorcc	%l3,	0x0693,	%g6
	bcc,pn	%icc,	loop_122
loop_120:
	fcmpgt32	%f14,	%f22,	%g2
loop_121:
	call	loop_123
	and	%l1,	%i6,	%i0
loop_122:
	srlx	%i7,	0x19,	%i4
	rdpr	%cleanwin,	%o7
loop_123:
	call	loop_124
	fmovdneg	%icc,	%f22,	%f30
	call	loop_125
	movneg	%icc,	0x2A0,	%g1
loop_124:
	nop
	setx	0x28E1097D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xFF3A3D95,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f26,	%f17
	and	%g3,	%o6,	%i5
loop_125:
	call	loop_126
	fmovdle	%fcc2,	%f16,	%f2
	rdpr	%tl,	%o4
	bvc,a,pn	%xcc,	loop_127
loop_126:
	movn	%fcc2,	0x166,	%o2
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x11,	 2
loop_127:
	edge16l	%i2,	%o1,	%o5
	call	loop_128
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f10
	movneg	%xcc,	0x697,	%l4
	brgez,a,pn	%l2,	loop_129
loop_128:
	nop
	setx	0x45809AFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x16DA0CD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f3,	%f17
	stw	%g5,	[%l7 + 0x48]
	movo	%fcc3,	%o0,	%i1
loop_129:
	nop
	set	0x28, %o5
	stxa	%l0,	[%l7 + %o5] 0x2f
	membar	#Sync
	movvs	%icc,	%o3,	%i3
	fcmpeq32	%f24,	%f2,	%l6
	call	loop_130
	prefetch	[%l7 + 0x38],	 4
	movgu	%xcc,	%g7,	%g4
	call	loop_131
loop_130:
	subc	%g6,	0x045D,	%g2
	rdpr	%cleanwin,	%l3
	fabsd	%f30,	%f6
loop_131:
	brlz	%l1,	loop_132
	call	loop_133
	tleu	%xcc,	0x7
	fmovdule	%fcc2,	%f0,	%f2
loop_132:
	fxnors	%f16,	%f10,	%f19
loop_133:
	fmovsvc	%icc,	%f15,	%f28
	fmovdgu	%icc,	%f26,	%f12
	call	loop_134
	call	loop_135
	call	loop_136
	call	loop_137
loop_134:
	fmovrse	%i6,	%f25,	%f29
loop_135:
	tl	%icc,	0x6
loop_136:
	bmask	%i0,	%i4,	%o7
loop_137:
	xorcc	%i7,	0x1AC5,	%g1
	fpsub16	%f16,	%f20,	%f24
	call	loop_138
	fmovsuge	%fcc1,	%f17,	%f24
	sub	%g3,	%o6,	%o4
	fcmped	%fcc2,	%f8,	%f10
loop_138:
	fmovduge	%fcc3,	%f30,	%f28
	call	loop_139
	fmovsug	%fcc1,	%f11,	%f23
	fmovde	%xcc,	%f16,	%f2
	tsubcc	%o2,	%i5,	%l5
loop_139:
	bmask	%i2,	%o5,	%l4
	edge32	%l2,	%o1,	%g5
	call	loop_140
	call	loop_141
	call	loop_142
	call	loop_143
loop_140:
	tg	%icc,	0x3
loop_141:
	orcc	%i1,	0x1199,	%l0
loop_142:
	addcc	%o3,	%i3,	%o0
loop_143:
	nop
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x11,	 3
	nop
	fitos	%f2,	%f19
	fstox	%f19,	%f26
	fxtos	%f26,	%f22
	fpadd16	%f2,	%f6,	%f10
	call	loop_144
	wrpr	%l6,	0x1122,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movule	%fcc1,	%g6,	%l3
loop_144:
	movpos	%xcc,	%l1,	%i0
	fmovsge	%fcc3,	%f26,	%f11
	fmovdneg	%xcc,	%f26,	%f2
	call	loop_145
	rdhpr	%hintp,	%i4
	fornot1	%f20,	%f10,	%f6
	call	loop_146
loop_145:
	edge8n	%i6,	%i7,	%o7
	call	loop_147
	fbue,a,pn	%fcc3,	loop_148
loop_146:
	call	loop_149
	movrlz	%g3,	0x16F,	%g1
loop_147:
	udiv	%o6,	0x0112,	%o2
loop_148:
	fzero	%f8
loop_149:
	fcmpgt16	%f24,	%f4,	%o4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x73] %asi,	%i5
	movug	%fcc2,	0x6A8,	%l5
	call	loop_150
	call	loop_151
	call	loop_152
	fmovsvs	%icc,	%f23,	%f16
loop_150:
	fmovsgu	%icc,	%f26,	%f4
loop_151:
	nop
	fitod	%f18,	%f18
loop_152:
	fandnot1s	%f1,	%f0,	%f24
	movcc	%xcc,	0x42D,	%o5
	call	loop_153
	call	loop_154
loop_153:
	nop

loop_154:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 21
!	Type a   	: 31
!	Type x   	: 11
!	Type cti   	: 154
!	Type f   	: 150
!	Type i   	: 133
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
	set	0xA,	%g2
	set	0xE,	%g3
	set	0x2,	%g4
	set	0x5,	%g5
	set	0xE,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x8,	%i1
	set	-0xF,	%i2
	set	-0xC,	%i3
	set	-0x8,	%i4
	set	-0xE,	%i5
	set	-0xB,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x43A1E1B4,	%l0
	set	0x0177D283,	%l1
	set	0x26172DA5,	%l2
	set	0x06B3483F,	%l3
	set	0x5893C3B8,	%l4
	set	0x60046EFF,	%l5
	set	0x44399C49,	%l6
	!# Output registers
	set	-0x0037,	%o0
	set	0x00D1,	%o1
	set	-0x150C,	%o2
	set	-0x0549,	%o3
	set	0x1670,	%o4
	set	0x0E65,	%o5
	set	-0x026A,	%o6
	set	0x1CDC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	alignaddrl	%i2,	%l4,	%l2
	call	loop_155
	call	loop_156
	call	loop_157
	edge8	%g5,	%o1,	%i1
loop_155:
	call	loop_158
loop_156:
	brnz,pt	%l0,	loop_159
loop_157:
	call	loop_160
	call	loop_161
loop_158:
	fnegd	%f6,	%f12
loop_159:
	fmuld8ulx16	%f12,	%f5,	%f16
loop_160:
	fnot1s	%f21,	%f31
loop_161:
	fmovdlg	%fcc3,	%f6,	%f4
	fmovdle	%fcc0,	%f28,	%f18
	call	loop_162
	addc	%o3,	%i3,	%g7
	fmovrsne	%l6,	%f21,	%f21
	call	loop_163
loop_162:
	fmovrslez	%o0,	%f29,	%f10
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x3C] %asi,	%f18
loop_163:
	or	%g4,	%g6,	%l3
	call	loop_164
	fmovsn	%fcc0,	%f0,	%f17
	rdhpr	%ver,	%g2
	call	loop_165
loop_164:
	tvs	%icc,	0x1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x64] %asi,	%i0
loop_165:
	call	loop_166
	nop
	setx	0xBD01CA94,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xDB7B11B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f23,	%f31
	fmovdvs	%xcc,	%f20,	%f8
	flushw
loop_166:
	movule	%fcc2,	0x0A2,	%i4
	call	loop_167
	brgez,a	%i6,	loop_168
	fbul,a,pn	%fcc3,	loop_169
	movul	%fcc3,	%l1,	%o7
loop_167:
	fmovd	%f28,	%f30
loop_168:
	call	loop_170
loop_169:
	nop
	setx loop_171, %l0, %l1
	jmpl %l1, %g3
	call	loop_172
	call	loop_173
loop_170:
	fcmpeq32	%f14,	%f8,	%i7
loop_171:
	call	loop_174
loop_172:
	lduw	[%l7 + 0x74],	%o6
loop_173:
	call	loop_175
	srl	%g1,	0x18,	%o2
loop_174:
	call	loop_176
	sth	%i5,	[%l7 + 0x44]
loop_175:
	fmovsug	%fcc3,	%f0,	%f18
	rdhpr	%hpstate,	%l5
loop_176:
	movl	%xcc,	%o4,	%o5
	call	loop_177
	nop
	setx	loop_178,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034400001407,	%l0,	%l1
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
	fbe,a	%fcc0,	loop_179
	movrlez	%l4,	0x111,	%l2
loop_177:
	fcmple32	%f8,	%f4,	%i2
loop_178:
	brlz,pn	%g5,	loop_180
loop_179:
	fmovsule	%fcc3,	%f26,	%f27
	call	loop_181
	srl	%i1,	0x0A,	%l0
loop_180:
	call	loop_182
	fcmple32	%f0,	%f22,	%o3
loop_181:
	nop
	set	0x18, %l0
	swap	[%l7 + %l0],	%i3
	sra	%g7,	%o1,	%l6
loop_182:
	fmul8sux16	%f8,	%f2,	%f24
	fxors	%f14,	%f13,	%f0
	call	loop_183
	movrlz	%g4,	%g6,	%l3
	fmovslg	%fcc1,	%f7,	%f5
	fnands	%f14,	%f17,	%f29
loop_183:
	fmovsle	%fcc0,	%f12,	%f17
	call	loop_184
	call	loop_185
	call	loop_186
	movn	%fcc0,	0x37D,	%g2
loop_184:
	fones	%f2
loop_185:
	call	loop_187
loop_186:
	call	loop_188
	call	loop_189
	alignaddr	%i0,	%o0,	%i6
loop_187:
	call	loop_190
loop_188:
	pdist	%f14,	%f20,	%f16
loop_189:
	movge	%icc,	%l1,	%o7
	fmovdg	%fcc3,	%f20,	%f28
loop_190:
	movgu	%icc,	%i4,	%g3
	fmovsu	%fcc1,	%f5,	%f27
	tne	%icc,	0x6
	call	loop_191
	call	loop_192
	fmovdule	%fcc3,	%f14,	%f2
	call	loop_193
loop_191:
	taddcc	%o6,	0x1109,	%g1
loop_192:
	fnand	%f22,	%f4,	%f0
	fmovsvs	%xcc,	%f30,	%f23
loop_193:
	fandnot2	%f28,	%f22,	%f4
	movcc	%icc,	%o2,	%i7
	call	loop_194
	fmovsl	%icc,	%f9,	%f14
	fmovdcc	%icc,	%f20,	%f30
	nop
	fitos	%f10,	%f25
	fstod	%f25,	%f22
loop_194:
	call	loop_195
	fnors	%f27,	%f12,	%f9
	fmovdue	%fcc1,	%f12,	%f6
	tn	%xcc,	0x6
loop_195:
	nop
	fitod	%f8,	%f4
	fdtox	%f4,	%f14
	te	%icc,	0x7
	fxor	%f6,	%f0,	%f4
	fbl,a	%fcc0,	loop_196
	fbn,pn	%fcc1,	loop_197
	call	loop_198
	bneg,pt	%icc,	loop_199
loop_196:
	smul	%l5,	%i5,	%o4
loop_197:
	fxor	%f0,	%f20,	%f22
loop_198:
	call	loop_200
loop_199:
	membar	0x01
	call	loop_201
	fmovrdgez	%l4,	%f24,	%f0
loop_200:
	orncc	%l2,	%o5,	%g5
	fcmps	%fcc0,	%f11,	%f19
loop_201:
	fornot2s	%f24,	%f24,	%f9
	call	loop_202
	nop
	setx	0xE84AA400,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x3310A726,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f12,	%f6
	st	%f26,	[%l7 + 0x64]
	call	loop_203
loop_202:
	call	loop_204
	nop
	setx	0xB22E9376D84205EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x5AD3051C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f10,	%f16
	call	loop_205
loop_203:
	call	loop_206
loop_204:
	call	loop_207
	movrgz	%i2,	%l0,	%o3
loop_205:
	fmovrdgez	%i3,	%f12,	%f16
loop_206:
	wr	%g7,	0x1EFD,	%clear_softint
loop_207:
	call	loop_208
	orn	%o1,	0x191B,	%l6
	fzeros	%f6
	mulx	%g4,	0x1B88,	%i1
loop_208:
	call	loop_209
	edge32ln	%l3,	%g2,	%i0
	call	loop_210
	fexpand	%f10,	%f16
loop_209:
	call	loop_211
	fpack16	%f16,	%f13
loop_210:
	call	loop_212
	orncc	%g6,	0x0D72,	%o0
loop_211:
	nop
	fitod	%f19,	%f20
	call	loop_213
loop_212:
	call	loop_214
	call	loop_215
	fbg,pt	%fcc1,	loop_216
loop_213:
	call	loop_217
loop_214:
	xnor	%l1,	%i6,	%i4
loop_215:
	fxnor	%f6,	%f8,	%f14
loop_216:
	ldstub	[%l7 + 0x56],	%g3
loop_217:
	bvc,pt	%icc,	loop_218
	nop
	fitos	%f7,	%f19
	fstox	%f19,	%f30
	rd	%fprs,	%o7
	call	loop_219
loop_218:
	call	loop_220
	movleu	%xcc,	%o6,	%o2
	fbul,a,pt	%fcc2,	loop_221
loop_219:
	fmovdug	%fcc2,	%f6,	%f8
loop_220:
	rd	%fprs,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%l5
loop_221:
	ta	%icc,	0x3
	edge8l	%i5,	%l4,	%o4
	nop
	fitod	%f6,	%f24
	fdtox	%f24,	%f10
	tsubcc	%l2,	%o5,	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x04,	%i2,	%o3
	call	loop_222
	fcmpne32	%f4,	%f22,	%i3
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f18
	call	loop_223
loop_222:
	fbue	%fcc2,	loop_224
	fnor	%f0,	%f10,	%f30
	fpack16	%f16,	%f21
loop_223:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_224:
	tcc	%xcc,	0x5
	movrne	%g7,	%o1,	%l0
	rdpr	%cansave,	%g4
	xnorcc	%l6,	%i1,	%l3
	alignaddrl	%i0,	%g6,	%g2
	tvc	%xcc,	0x2
	subcc	%o0,	0x0986,	%i6
	call	loop_225
	call	loop_226
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_227
loop_225:
	call	loop_228
loop_226:
	tvc	%icc,	0x7
	movrlez	%o7,	%o6,	%o2
loop_227:
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f4
	fxtod	%f4,	%f30
loop_228:
	ta	%icc,	0x0
	fsrc2	%f6,	%f22
	call	loop_229
	call	loop_230
	fbule,a	%fcc1,	loop_231
	call	loop_232
loop_229:
	call	loop_233
loop_230:
	fmovd	%f4,	%f6
loop_231:
	fmul8sux16	%f14,	%f30,	%f16
loop_232:
	mova	%xcc,	%i7,	%g3
loop_233:
	bcc	%xcc,	loop_234
	call	loop_235
	fmul8x16au	%f23,	%f24,	%f2
	call	loop_236
loop_234:
	fandnot1s	%f12,	%f14,	%f27
loop_235:
	call	loop_237
	fandnot2	%f12,	%f4,	%f28
loop_236:
	rdpr	%pil,	%l5
	set	0x28, %o2
	ldswa	[%l7 + %o2] 0x04,	%g1
loop_237:
	smulcc	%i5,	0x13F5,	%l4
	call	loop_238
	sub	%o4,	0x02F4,	%l2
	call	loop_239
	movlg	%fcc1,	%g5,	%o5
loop_238:
	bmask	%o3,	%i3,	%g7
	fmovscs	%xcc,	%f0,	%f21
loop_239:
	fmovdlg	%fcc0,	%f2,	%f26
	movlg	%fcc1,	0x63C,	%o1
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f6
	fmovrde	%i2,	%f20,	%f10
	call	loop_240
	call	loop_241
	tle	%icc,	0x4
	fzeros	%f16
loop_240:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l0
loop_241:
	fands	%f11,	%f9,	%f30
	alignaddr	%g4,	%i1,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x68E, 	%hsys_tick_cmpr
	fmovdcc	%icc,	%f16,	%f16
	call	loop_242
	fmovsue	%fcc2,	%f20,	%f1
	fnot1s	%f7,	%f13
	movpos	%icc,	0x48B,	%g6
loop_242:
	sth	%l3,	[%l7 + 0x4C]
	fxnor	%f22,	%f18,	%f20
	call	loop_243
	fsrc1s	%f0,	%f29
	fmul8sux16	%f2,	%f22,	%f10
	call	loop_244
loop_243:
	call	loop_245
	wrpr	%g2,	%i6,	%cwp
	call	loop_246
loop_244:
	nop
	fitos	%f3,	%f19
loop_245:
	call	loop_247
	movl	%fcc0,	%i4,	%l1
loop_246:
	rdhpr	%hintp,	%o0
	call	loop_248
loop_247:
	fmovrdlez	%o7,	%f30,	%f8
	call	loop_249
	fmovde	%fcc0,	%f14,	%f0
loop_248:
	fnegs	%f23,	%f1
	udivcc	%o6,	0x1C41,	%o2
loop_249:
	nop
	set	0x08, %o3
	ldstuba	[%l7 + %o3] 0x04,	%g3
	fbne,a,pn	%fcc2,	loop_250
	nop
	set	0x1A, %i4
	sth	%i7,	[%l7 + %i4]
	wr	%l5,	%g1,	%clear_softint
	call	loop_251
loop_250:
	call	loop_252
	taddcc	%i5,	%o4,	%l2
	call	loop_253
loop_251:
	fmovso	%fcc3,	%f24,	%f14
loop_252:
	call	loop_254
	fpsub16	%f14,	%f22,	%f26
loop_253:
	mulx	%g5,	0x1B2E,	%l4
	call	loop_255
loop_254:
	call	loop_256
	call	loop_257
	fmovrslz	%o5,	%f23,	%f1
loop_255:
	call	loop_258
loop_256:
	call	loop_259
loop_257:
	edge32n	%o3,	%g7,	%i3
	fcmpeq32	%f4,	%f14,	%o1
loop_258:
	call	loop_260
loop_259:
	fcmped	%fcc1,	%f22,	%f18
	fbu	%fcc1,	loop_261
	fcmple32	%f22,	%f8,	%l0
loop_260:
	fcmple32	%f24,	%f0,	%g4
	movule	%fcc0,	%i2,	%l6
loop_261:
	call	loop_262
	rdhpr	%htba,	%i1
	fpadd32	%f10,	%f2,	%f12
	fmovsue	%fcc3,	%f27,	%f11
loop_262:
	call	loop_263
	fcmpeq32	%f24,	%f18,	%g6
	fmovdule	%fcc0,	%f4,	%f10
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x19,	%l3
loop_263:
	ldd	[%l7 + 0x38],	%g2
	call	loop_264
	call	loop_265
	orcc	%i0,	%i4,	%l1
	nop
	setx loop_266, %l0, %l1
	jmpl %l1, %i6
loop_264:
	subccc	%o7,	0x0F73,	%o0
loop_265:
	call	loop_267
	fabsd	%f20,	%f14
loop_266:
	ldd	[%l7 + 0x20],	%o2
	fpadd32s	%f30,	%f22,	%f9
loop_267:
	fmovdneg	%xcc,	%f30,	%f16
	fmuld8sux16	%f19,	%f23,	%f10
	rdhpr	%hintp,	%g3
	tn	%xcc,	0x0
	call	loop_268
	call	loop_269
	wr	%i7,	%l5,	%clear_softint
	movn	%xcc,	0x5BD,	%o6
loop_268:
	call	loop_270
loop_269:
	call	loop_271
	flushw
	umulcc	%i5,	0x0D1B,	%o4
loop_270:
	call	loop_272
loop_271:
	fone	%f4
	sll	%l2,	%g1,	%l4
	edge16l	%g5,	%o3,	%g7
loop_272:
	fcmpgt16	%f2,	%f10,	%i3
	move	%fcc3,	%o5,	%o1
	fmovsle	%fcc3,	%f29,	%f23
	sdivx	%g4,	0x094B,	%i2
	call	loop_273
	nop
	setx	0x09EE,	%l0,	%l6
	udivx	%l0,	%l6,	%i1
	call	loop_274
	fmovdneg	%icc,	%f12,	%f20
loop_273:
	fmovsug	%fcc2,	%f28,	%f11
	fmovsleu	%icc,	%f0,	%f23
loop_274:
	nop
	wr	%g0,	0x23,	%asi
	stha	%l3,	[%l7 + 0x60] %asi
	membar	#Sync
	fornot1	%f18,	%f2,	%f2
	srl	%g2,	%i0,	%i4
	taddcctv	%l1,	%g6,	%o7
	fcmped	%fcc0,	%f6,	%f28
	call	loop_275
	fsrc2s	%f13,	%f27
	sdivx	%i6,	0x17D5,	%o0
	brnz,a	%o2,	loop_276
loop_275:
	bvs,a	%icc,	loop_277
	call	loop_278
	orncc	%g3,	%i7,	%l5
loop_276:
	rdhpr	%htba,	%i5
loop_277:
	nop
	setx	0x0C5A,	%l0,	%l2
	udiv	%o6,	%l2,	%g1
loop_278:
	rd	%softint,	%l4
	tleu	%icc,	0x5
	movrlz	%o4,	0x183,	%g5
	bcc,pt	%xcc,	loop_279
	nop
	setx	0xAF0AAEDA5A0CA6A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x3986CE33BD593447,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f8,	%f0
	subcc	%g7,	%i3,	%o5
	movrlz	%o1,	%o3,	%i2
loop_279:
	alignaddrl	%l0,	%g4,	%i1
	fcmpeq16	%f24,	%f18,	%l3
	movrne	%g2,	%l6,	%i0
	bgu	%icc,	loop_280
	fzero	%f30
	fcmpeq16	%f10,	%f12,	%l1
	call	loop_281
loop_280:
	call	loop_282
	fors	%f11,	%f28,	%f3
	call	loop_283
loop_281:
	fmovd	%f10,	%f18
loop_282:
	movue	%fcc2,	%g6,	%i4
	nop
	fitos	%f1,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f5
loop_283:
	nop
	set	0x3C, %i3
	stwa	%o7,	[%l7 + %i3] 0x19
	call	loop_284
	brnz,pt	%o0,	loop_285
	call	loop_286
	fornot2s	%f30,	%f15,	%f6
loop_284:
	fcmpeq32	%f28,	%f18,	%i6
loop_285:
	wrpr 	%g0, 	0x2, 	%gl
loop_286:
	movvc	%icc,	0x00E,	%g3
	call	loop_287
	fmovrdgez	%i5,	%f20,	%f24
	call	loop_288
	tvs	%xcc,	0x2
loop_287:
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f18
	fnegs	%f7,	%f5
loop_288:
	fmovsuge	%fcc3,	%f10,	%f15
	fbne,a	%fcc2,	loop_289
	movue	%fcc3,	0x75D,	%l5
	call	loop_290
	call	loop_291
loop_289:
	call	loop_292
	fornot2s	%f12,	%f3,	%f2
loop_290:
	call	loop_293
loop_291:
	fmovrdne	%o6,	%f12,	%f14
loop_292:
	rdpr	%tl,	%l2
	fpadd16	%f22,	%f18,	%f2
loop_293:
	fmovscc	%icc,	%f8,	%f24
	call	loop_294
	fmovsa	%fcc1,	%f17,	%f16
	fnot2s	%f22,	%f31
	movgu	%icc,	%l4,	%o4
loop_294:
	tsubcc	%g5,	%g7,	%g1
	edge32l	%i3,	%o5,	%o3
	call	loop_295
	edge32	%i2,	%l0,	%o1
	xnor	%g4,	0x146B,	%l3
	call	loop_296
loop_295:
	fmovrdlez	%i1,	%f20,	%f26
	fmovrdgz	%g2,	%f6,	%f24
	fmovscs	%xcc,	%f17,	%f14
loop_296:
	movuge	%fcc1,	%i0,	%l6
	call	loop_297
	movcs	%xcc,	0x3DB,	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x657, 	%hsys_tick_cmpr
	movpos	%xcc,	0x3E1,	%o7
loop_297:
	nop
	fitod	%f0,	%f24
	fdtox	%f24,	%f12
	edge8l	%o0,	%i6,	%o2
	call	loop_298
	fmovsge	%icc,	%f25,	%f27
	call	loop_299
	movcc	%xcc,	0x604,	%g6
loop_298:
	fmovs	%f11,	%f13
	call	loop_300
loop_299:
	edge8n	%g3,	%i5,	%i7
	movne	%fcc0,	%o6,	%l2
	fmovsa	%icc,	%f26,	%f26
loop_300:
	call	loop_301
	fmovdn	%fcc1,	%f8,	%f12
	fmuld8ulx16	%f13,	%f22,	%f6
	tg	%icc,	0x6
loop_301:
	nop
	wr	%g0,	0x2f,	%asi
	stda	%l4,	[%l7 + 0x20] %asi
	membar	#Sync
	nop
	setx	0x813EB4142F74B6BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xBDBFDDCB50E6CA93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f26,	%f2
	call	loop_302
	array16	%o4,	%g5,	%l5
	sir	0x0D29
	siam	0x6
loop_302:
	movrne	%g1,	%i3,	%o5
	call	loop_303
	taddcctv	%g7,	%i2,	%o3
	call	loop_304
	brlz,a,pt	%o1,	loop_305
loop_303:
	fmovdge	%fcc2,	%f0,	%f28
	fornot2s	%f24,	%f2,	%f21
loop_304:
	tsubcc	%g4,	%l3,	%i1
loop_305:
	fmovdcc	%xcc,	%f10,	%f16
	or	%l0,	0x1122,	%i0
	orcc	%g2,	%l1,	%i4
	fmovrdne	%l6,	%f16,	%f18
	movge	%fcc3,	0x7EF,	%o0
	rdpr	%tl,	%i6
	set	0x18, %l6
	stxa	%o7,	[%l7 + %l6] 0x27
	membar	#Sync
	movule	%fcc0,	0x637,	%o2
	brgz,a,pn	%g6,	loop_306
	call	loop_307
	wrpr	%i5,	0x1CCE,	%tick
	tcc	%icc,	0x2
loop_306:
	nop
	wr	%g0,	0xe2,	%asi
	stda	%i6,	[%l7 + 0x18] %asi
	membar	#Sync
loop_307:
	fmovsle	%icc,	%f8,	%f29
	movrlez	%o6,	0x27A,	%g3
	rdhpr	%hsys_tick_cmpr,	%l2
	call	loop_308
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f30
	fxtod	%f30,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCBB, 	%hsys_tick_cmpr
	call	loop_309
loop_308:
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%g5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_310
loop_309:
	tl	%icc,	0x5
	tne	%icc,	0x0
	wrpr	%l5,	%g1,	%pil
loop_310:
	fmovdule	%fcc1,	%f26,	%f2
	call	loop_311
	fmovrsne	%i3,	%f15,	%f31
	wr	%o4,	0x0D21,	%softint
	movre	%g7,	%o5,	%i2
loop_311:
	fsrc2s	%f0,	%f26
	movrlez	%o3,	0x365,	%g4
	fmovdlg	%fcc0,	%f4,	%f2
	fxors	%f7,	%f23,	%f26
	tle	%xcc,	0x1
	call	loop_312
	mova	%icc,	0x4E0,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_313
loop_312:
	call	loop_314
	xnor	%i0,	0x07BE,	%i1
	call	loop_315
loop_313:
	fcmped	%fcc3,	%f4,	%f2
loop_314:
	call	loop_316
	fabsd	%f10,	%f8
loop_315:
	fand	%f0,	%f6,	%f26
	fzeros	%f13
loop_316:
	edge32	%g2,	%l1,	%i4
	tvs	%icc,	0x7
	bge,a	%xcc,	loop_317
	call	loop_318
	brlz,a	%o0,	loop_319
	tl	%icc,	0x0
loop_317:
	array16	%l6,	%o7,	%i6
loop_318:
	call	loop_320
loop_319:
	fcmpes	%fcc2,	%f0,	%f1
loop_320:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 23
!	Type a   	: 27
!	Type x   	: 13
!	Type cti   	: 166
!	Type f   	: 148
!	Type i   	: 123
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
	set	0xB,	%g1
	set	0x9,	%g2
	set	0x7,	%g3
	set	0x2,	%g4
	set	0xF,	%g5
	set	0x5,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x5,	%i1
	set	-0xF,	%i2
	set	-0x4,	%i3
	set	-0x5,	%i4
	set	-0xA,	%i5
	set	-0x9,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x5D9631C8,	%l0
	set	0x06F754C9,	%l1
	set	0x3B47F103,	%l2
	set	0x1A0F2FDC,	%l3
	set	0x640C00C3,	%l4
	set	0x3B4C23BB,	%l5
	set	0x04B156EF,	%l6
	!# Output registers
	set	0x1FC5,	%o0
	set	0x0E41,	%o1
	set	-0x0AF2,	%o2
	set	-0x1EE7,	%o3
	set	-0x16EB,	%o4
	set	0x09A0,	%o5
	set	0x0E4E,	%o6
	set	0x1F14,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	wr	%g0,	0xe2,	%asi
	stha	%o2,	[%l7 + 0x24] %asi
	membar	#Sync
	call	loop_321
	fmovrslez	%g6,	%f30,	%f21
	fmovsge	%xcc,	%f6,	%f13
	fcmpgt32	%f26,	%f12,	%i5
loop_321:
	call	loop_322
	fmovrdlz	%o6,	%f16,	%f6
	call	loop_323
	call	loop_324
loop_322:
	call	loop_325
	movule	%fcc1,	0x7B6,	%g3
loop_323:
	sethi	0x0FBD,	%l2
loop_324:
	call	loop_326
loop_325:
	nop
	fitos	%f0,	%f17
	fstoi	%f17,	%f20
	andn	%l4,	%i7,	%g5
	movul	%fcc2,	0x483,	%l5
loop_326:
	fmovdne	%fcc3,	%f26,	%f0
	call	loop_327
	call	loop_328
	call	loop_329
	call	loop_330
loop_327:
	fmovsule	%fcc0,	%f23,	%f15
loop_328:
	fpadd32	%f0,	%f12,	%f28
loop_329:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_330:
	fpack16	%f28,	%f7
	call	loop_331
	fmovslg	%fcc3,	%f26,	%f21
	bgu	%xcc,	loop_332
	nop
	setx	0x90D8FF7046A9C12A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f8
loop_331:
	fbuge,a	%fcc3,	loop_333
	fandnot1s	%f16,	%f25,	%f21
loop_332:
	fmovsvs	%xcc,	%f5,	%f15
	fornot1	%f6,	%f18,	%f10
loop_333:
	fandnot1	%f26,	%f24,	%f0
	fmovrslez	%g7,	%f27,	%f25
	srlx	%o5,	%g1,	%i2
	nop
	set	0x2C, %g1
	stw	%g4,	[%l7 + %g1]
	edge32n	%o1,	%o3,	%l3
	fnor	%f6,	%f10,	%f18
	smulcc	%l0,	%i0,	%g2
	movl	%icc,	0x3BF,	%l1
	set	0x14, %l5
	stwa	%i4,	[%l7 + %l5] 0x22
	membar	#Sync
	call	loop_334
	movule	%fcc0,	%o0,	%l6
	wr	%g0,	0x27,	%asi
	stwa	%o7,	[%l7 + 0x74] %asi
	membar	#Sync
loop_334:
	call	loop_335
	andcc	%i1,	%i6,	%g6
	call	loop_336
	nop
	setx	0x0E13C8DC349921E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0809F12CAB0A66BE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f14,	%f30
loop_335:
	fmovrdgez	%i5,	%f30,	%f2
	movleu	%icc,	0x770,	%o2
loop_336:
	call	loop_337
	call	loop_338
	call	loop_339
	movue	%fcc0,	0x2D1,	%g3
loop_337:
	call	loop_340
loop_338:
	te	%xcc,	0x1
loop_339:
	edge32	%l2,	%l4,	%i7
	rdpr	%tba,	%o6
loop_340:
	nop
	set	0x50, %i5
	std	%f2,	[%l7 + %i5]
	fmovsvs	%xcc,	%f12,	%f27
	fbo,a,pt	%fcc2,	loop_341
	call	loop_342
	call	loop_343
	movue	%fcc3,	%g5,	%l5
loop_341:
	nop
	set	0x35, %o0
	ldub	[%l7 + %o0],	%i3
loop_342:
	call	loop_344
loop_343:
	movuge	%fcc1,	%g7,	%o4
	srl	%o5,	0x0B,	%g1
	fmovsg	%icc,	%f15,	%f4
loop_344:
	andncc	%g4,	0x0985,	%o1
	rd	%fprs,	%o3
	fbne,pt	%fcc3,	loop_345
	smul	%l3,	0x0ADB,	%i2
	xorcc	%l0,	%i0,	%l1
	call	loop_346
loop_345:
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%i4
	edge32l	%o0,	%l6,	%o7
	umulcc	%i1,	0x1100,	%g2
loop_346:
	add	%i6,	0x1EA6,	%i5
	nop
	fitos	%f12,	%f31
	fstox	%f31,	%f2
	call	loop_347
	call	loop_348
	fmovdule	%fcc1,	%f8,	%f12
	ld	[%l7 + 0x3C],	%f29
loop_347:
	fmovsleu	%icc,	%f25,	%f11
loop_348:
	edge16	%o2,	%g6,	%g3
	call	loop_349
	fbe,a	%fcc0,	loop_350
	fmovdue	%fcc3,	%f24,	%f2
	stbar
loop_349:
	rd	%softint,	%l4
loop_350:
	fbe,a,pn	%fcc1,	loop_351
	fmovslg	%fcc2,	%f17,	%f26
	xnor	%i7,	0x0740,	%o6
	call	loop_352
loop_351:
	call	loop_353
	fmuld8ulx16	%f22,	%f2,	%f20
	tleu	%xcc,	0x3
loop_352:
	fbge,pt	%fcc3,	loop_354
loop_353:
	tgu	%icc,	0x7
	nop
	setx	0x0D73,	%l0,	%l5
	udivcc	%l2,	%l5,	%g5
	call	loop_355
loop_354:
	fbne,a	%fcc3,	loop_356
	fors	%f29,	%f17,	%f15
	fmovdge	%fcc0,	%f28,	%f22
loop_355:
	edge8ln	%i3,	%g7,	%o4
loop_356:
	call	loop_357
	add	%o5,	%g4,	%o1
	movle	%fcc1,	%g1,	%o3
	call	loop_358
loop_357:
	fsrc1	%f22,	%f14
	call	loop_359
	call	loop_360
loop_358:
	subccc	%l3,	0x04D8,	%i2
	sllx	%i0,	%l1,	%i4
loop_359:
	rdhpr	%hpstate,	%l0
loop_360:
	sll	%l6,	%o7,	%o0
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%g2
	for	%f14,	%f28,	%f4
	edge8ln	%i6,	%i1,	%i5
	fcmpeq16	%f2,	%f8,	%o2
	andn	%g6,	0x0AFE,	%g3
	edge32l	%i7,	%o6,	%l2
	nop
	setx	0xEA831720,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f9
	set	0x34, %l1
	stwa	%l4,	[%l7 + %l1] 0xe2
	membar	#Sync
	wr	%l5,	%i3,	%pic
	movule	%fcc3,	0x099,	%g5
	fmovdu	%fcc3,	%f6,	%f18
	ba,a,pn	%xcc,	loop_361
	subc	%g7,	%o5,	%o4
	nop
	set	0x48, %l2
	stx	%g4,	[%l7 + %l2]
	subc	%g1,	0x1456,	%o1
loop_361:
	movre	%l3,	0x008,	%i2
	andn	%i0,	0x1CDB,	%o3
	call	loop_362
	sethi	0x0224,	%l1
	fnot2	%f4,	%f4
	fpadd32s	%f12,	%f29,	%f7
loop_362:
	fnot2	%f14,	%f26
	tg	%xcc,	0x6
	call	loop_363
	call	loop_364
	fmovrslez	%i4,	%f26,	%f0
	fbe,a	%fcc2,	loop_365
loop_363:
	call	loop_366
loop_364:
	array8	%l6,	%l0,	%o0
	srl	%g2,	0x1F,	%i6
loop_365:
	call	loop_367
loop_366:
	sll	%i1,	0x1F,	%i5
	fmul8ulx16	%f24,	%f26,	%f18
	andncc	%o2,	0x09B0,	%g6
loop_367:
	call	loop_368
	fbule,a,pn	%fcc0,	loop_369
	movneg	%xcc,	%o7,	%g3
	nop
	setx	0x7CE0FA38D51129D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f30
loop_368:
	tneg	%icc,	0x4
loop_369:
	call	loop_370
	fble	%fcc0,	loop_371
	ld	[%l7 + 0x14],	%f9
	movneg	%icc,	%o6,	%l2
loop_370:
	movl	%fcc1,	%i7,	%l4
loop_371:
	tne	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x83F, 	%hsys_tick_cmpr
	wrpr	%g7,	%g5,	%pil
	call	loop_372
	sdivx	%o4,	0x0B70,	%g4
	call	loop_373
	tleu	%xcc,	0x1
loop_372:
	tne	%xcc,	0x3
	bshuffle	%f4,	%f24,	%f8
loop_373:
	tgu	%xcc,	0x1
	subccc	%o5,	0x11D7,	%g1
	fmovsul	%fcc3,	%f5,	%f28
	array16	%o1,	%i2,	%i0
	fmovsne	%icc,	%f10,	%f16
	xor	%o3,	%l1,	%l3
	fpack16	%f8,	%f24
	fandnot1s	%f19,	%f26,	%f23
	nop
	setx	0xED7C6A7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD1A87882,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f11,	%f30
	fxnors	%f12,	%f30,	%f22
	edge8n	%i4,	%l6,	%l0
	xnorcc	%o0,	%g2,	%i6
	fcmped	%fcc1,	%f6,	%f24
	call	loop_374
	fxors	%f4,	%f3,	%f13
	bcs,pn	%xcc,	loop_375
	call	loop_376
loop_374:
	call	loop_377
	bvc,a	%xcc,	loop_378
loop_375:
	fmovdpos	%xcc,	%f10,	%f14
loop_376:
	udivcc	%i5,	0x110F,	%o2
loop_377:
	movvs	%xcc,	%g6,	%o7
loop_378:
	rdpr	%cansave,	%g3
	set	0x74, %i7
	lda	[%l7 + %i7] 0x89,	%f15
	nop
	setx	0x68B2AB3ACA16E27B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3385E47C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f12,	%f16
	call	loop_379
	call	loop_380
	rd	%softint,	%o6
	andn	%l2,	%i1,	%l4
loop_379:
	rdhpr	%hpstate,	%l5
loop_380:
	edge32n	%i7,	%g7,	%g5
	fcmpgt32	%f12,	%f20,	%o4
	fnand	%f16,	%f2,	%f2
	membar	0x62
	call	loop_381
	move	%xcc,	%i3,	%g4
	fmovrde	%g1,	%f24,	%f28
	movvs	%xcc,	0x073,	%o5
loop_381:
	fnor	%f14,	%f8,	%f20
	xor	%i2,	%i0,	%o3
	sra	%l1,	%o1,	%l3
	movn	%icc,	%i4,	%l0
	nop
	fitod	%f0,	%f8
	fdtoi	%f8,	%f6
	call	loop_382
	xor	%l6,	0x1806,	%o0
	fmovsule	%fcc3,	%f12,	%f10
	fmovs	%f16,	%f29
loop_382:
	call	loop_383
	umulcc	%i6,	0x1B25,	%i5
	call	loop_384
	edge8l	%g2,	%o2,	%o7
loop_383:
	fnot2s	%f29,	%f9
	call	loop_385
loop_384:
	bne	%icc,	loop_386
	movrgz	%g6,	0x224,	%o6
	popc	0x1145,	%l2
loop_385:
	call	loop_387
loop_386:
	call	loop_388
	udivx	%i1,	0x13BB,	%g3
	call	loop_389
loop_387:
	call	loop_390
loop_388:
	edge8n	%l4,	%l5,	%g7
	for	%f30,	%f0,	%f4
loop_389:
	call	loop_391
loop_390:
	fpsub16s	%f4,	%f29,	%f17
	movrne	%i7,	%o4,	%i3
	edge32	%g4,	%g1,	%g5
loop_391:
	call	loop_392
	movo	%fcc2,	0x7E7,	%o5
	nop
	fitod	%f9,	%f0
	nop
	setx	0x9B7217C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xF5E71006,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f5,	%f31
loop_392:
	movrgez	%i0,	0x1C6,	%o3
	call	loop_393
	bmask	%i2,	%o1,	%l3
	call	loop_394
	taddcctv	%l1,	%l0,	%i4
loop_393:
	te	%icc,	0x2
	xorcc	%l6,	%o0,	%i6
loop_394:
	fxnors	%f6,	%f5,	%f3
	call	loop_395
	call	loop_396
	call	loop_397
	sethi	0x1B2C,	%g2
loop_395:
	rdpr	%cleanwin,	%i5
loop_396:
	fcmpgt32	%f28,	%f16,	%o2
loop_397:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orncc	%l2,	%i1,	%g3
	fcmped	%fcc0,	%f8,	%f0
	brgz,a	%o6,	loop_398
	fpack32	%f22,	%f4,	%f2
	call	loop_399
	wrpr	%l5,	%g7,	%tick
loop_398:
	sub	%l4,	0x0442,	%o4
	wrpr 	%g0, 	0x0, 	%gl
loop_399:
	flushw
	bl	%icc,	loop_400
	fmovdu	%fcc1,	%f28,	%f18
	fxors	%f1,	%f10,	%f25
	fpackfix	%f0,	%f21
loop_400:
	call	loop_401
	call	loop_402
	sra	%g4,	%g1,	%i7
	call	loop_403
loop_401:
	call	loop_404
loop_402:
	tneg	%xcc,	0x1
	call	loop_405
loop_403:
	tl	%icc,	0x6
loop_404:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_406
loop_405:
	bmask	%o3,	%i2,	%i0
	ta	%xcc,	0x4
	sdivcc	%o1,	0x10C2,	%l3
loop_406:
	call	loop_407
	fpmerge	%f16,	%f26,	%f4
	edge16n	%l1,	%i4,	%l0
	call	loop_408
loop_407:
	wrpr	%l6,	0x163B,	%pil
	fmovrsgez	%o0,	%f26,	%f29
	fmovdul	%fcc0,	%f10,	%f30
loop_408:
	call	loop_409
	fpadd32	%f14,	%f4,	%f6
	fmovdleu	%xcc,	%f6,	%f24
	fzeros	%f4
loop_409:
	nop
	setx	0xD3F61029C03CE584,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f28
	ldx	[%l7 + 0x08],	%i6
	fornot1	%f4,	%f16,	%f8
	call	loop_410
	bcs,a,pt	%icc,	loop_411
	fnot1s	%f21,	%f19
	addcc	%i5,	0x1A5B,	%o2
loop_410:
	tvc	%xcc,	0x2
loop_411:
	call	loop_412
	fpadd32s	%f4,	%f23,	%f17
	xnor	%o7,	%g6,	%l2
	sth	%i1,	[%l7 + 0x28]
loop_412:
	fmovscs	%icc,	%f18,	%f6
	edge8	%g3,	%g2,	%o6
	lduw	[%l7 + 0x28],	%g7
	call	loop_413
	stb	%l4,	[%l7 + 0x64]
	fsrc2s	%f23,	%f25
	movg	%fcc1,	%o4,	%i3
loop_413:
	fcmped	%fcc0,	%f2,	%f28
	call	loop_414
	call	loop_415
	call	loop_416
	fmovduge	%fcc0,	%f12,	%f12
loop_414:
	call	loop_417
loop_415:
	call	loop_418
loop_416:
	fnot1s	%f11,	%f12
	taddcctv	%g4,	0x02E5,	%g1
loop_417:
	sllx	%i7,	%l5,	%o5
loop_418:
	move	%fcc1,	0x7EB,	%g5
	movneg	%xcc,	0x6B2,	%o3
	call	loop_419
	edge8n	%i0,	%o1,	%i2
	call	loop_420
	fmovdn	%fcc3,	%f10,	%f8
loop_419:
	pdist	%f0,	%f0,	%f2
	movul	%fcc0,	%l1,	%l3
loop_420:
	fbn	%fcc3,	loop_421
	rdpr	%gl,	%l0
	siam	0x4
	addc	%i4,	0x12A3,	%o0
loop_421:
	fpmerge	%f0,	%f22,	%f30
	set	0x2A, %i0
	ldsba	[%l7 + %i0] 0x04,	%i6
	movg	%fcc1,	%i5,	%o2
	fnot2	%f20,	%f18
	wrpr	%o7,	0x181C,	%pil
	fmul8x16au	%f17,	%f1,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdug	%fcc2,	%f6,	%f12
	brlz	%g6,	loop_422
	movuge	%fcc2,	%i1,	%l2
	fmul8x16au	%f26,	%f4,	%f14
	edge32ln	%g3,	%o6,	%g2
loop_422:
	fmovrdgez	%l4,	%f2,	%f6
	rdpr	%cwp,	%o4
	tge	%icc,	0x6
	fnands	%f18,	%f31,	%f14
	udivx	%g7,	0x18AF,	%i3
	call	loop_423
	movrlez	%g4,	%i7,	%l5
	bcs,pn	%xcc,	loop_424
	nop
	fitos	%f11,	%f0
	fstoi	%f0,	%f19
loop_423:
	wr	%g1,	%o5,	%pic
	umulcc	%g5,	0x0151,	%o3
loop_424:
	mulscc	%i0,	0x1FFE,	%i2
	orn	%o1,	%l1,	%l0
	wrpr	%i4,	0x1455,	%pil
	fmovrdne	%o0,	%f24,	%f10
	call	loop_425
	call	loop_426
	orncc	%i6,	0x1A5A,	%i5
	movre	%l3,	%o2,	%l6
loop_425:
	andcc	%g6,	0x1B1F,	%i1
loop_426:
	fcmpes	%fcc3,	%f30,	%f6
	wr 	%g0, 	0x7, 	%fprs
	fblg,a,pn	%fcc2,	loop_427
	call	loop_428
	call	loop_429
	bvc,a,pt	%xcc,	loop_430
loop_427:
	call	loop_431
loop_428:
	call	loop_432
loop_429:
	tge	%xcc,	0x7
loop_430:
	sll	%o6,	%l2,	%g2
loop_431:
	rd	%asi,	%o4
loop_432:
	fmovrdgez	%g7,	%f18,	%f2
	wr	%l4,	%g4,	%y
	fpack16	%f30,	%f30
	call	loop_433
	nop
	fitod	%f10,	%f6
	smul	%i3,	%i7,	%l5
	xnorcc	%g1,	%o5,	%g5
loop_433:
	edge16l	%o3,	%i2,	%i0
	tle	%xcc,	0x1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x19,	%l1,	%o1
	bg	%icc,	loop_434
	rd	%tick_cmpr,	%i4
	nop
	setx	0x0581,	%l0,	%i6
	udivx	%l0,	%i6,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD26, 	%hsys_tick_cmpr
loop_434:
	fmovdcs	%xcc,	%f6,	%f24
	call	loop_435
	rd	%fprs,	%i5
	movlg	%fcc3,	%l6,	%g6
	te	%icc,	0x4
loop_435:
	wrpr	%i1,	%o7,	%cwp
	bg,pt	%icc,	loop_436
	rd	%softint,	%g3
	fnot1	%f18,	%f14
	nop
	fitos	%f7,	%f18
	fstod	%f18,	%f28
loop_436:
	fmovsneg	%icc,	%f16,	%f17
	fmovsn	%fcc3,	%f20,	%f1
	call	loop_437
	movue	%fcc1,	0x5FE,	%o6
	movo	%fcc0,	%l2,	%g2
	call	loop_438
loop_437:
	rd	%softint,	%o4
	umulcc	%g7,	0x1C24,	%l4
	call	loop_439
loop_438:
	brgez	%g4,	loop_440
	fornot2s	%f0,	%f23,	%f17
	call	loop_441
loop_439:
	fornot1	%f12,	%f16,	%f30
loop_440:
	fmovde	%icc,	%f0,	%f0
	call	loop_442
loop_441:
	call	loop_443
	tsubcctv	%o2,	%i3,	%l5
	xnor	%g1,	0x0159,	%i7
loop_442:
	for	%f0,	%f2,	%f24
loop_443:
	ldx	[%l7 + 0x70],	%g5
	call	loop_444
	fornot1	%f10,	%f10,	%f10
	fornot2s	%f10,	%f30,	%f0
	swap	[%l7 + 0x20],	%o5
loop_444:
	fmovso	%fcc2,	%f29,	%f20
	fmovscc	%xcc,	%f18,	%f20
	fmovdgu	%icc,	%f26,	%f24
	tg	%icc,	0x5
	fpsub32s	%f30,	%f31,	%f8
	fsrc2	%f10,	%f26
	srax	%i2,	0x12,	%o3
	taddcctv	%l1,	0x034C,	%o1
	call	loop_445
	tvc	%icc,	0x2
	call	loop_446
	bneg,a,pn	%xcc,	loop_447
loop_445:
	fzeros	%f14
	nop
	set	0x38, %i1
	stw	%i4,	[%l7 + %i1]
loop_446:
	mulscc	%i0,	0x11A8,	%l0
loop_447:
	fmovs	%f15,	%f10
	ld	[%l7 + 0x48],	%f21
	movvc	%icc,	0x36B,	%i6
	ldub	[%l7 + 0x3D],	%o0
	call	loop_448
	call	loop_449
	prefetch	[%l7 + 0x74],	 2
	nop
	fitod	%f10,	%f4
	fdtox	%f4,	%f14
loop_448:
	call	loop_450
loop_449:
	movvs	%icc,	0x3E4,	%l3
	call	loop_451
	brz	%l6,	loop_452
loop_450:
	wr	%g6,	0x1387,	%softint
	call	loop_453
loop_451:
	array32	%i1,	%o7,	%i5
loop_452:
	movvc	%icc,	%o6,	%l2
	rdpr	%gl,	%g3
loop_453:
	call	loop_454
	movrgez	%o4,	0x232,	%g2
	nop
	setx	0x530A985A,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fmul8x16al	%f29,	%f2,	%f10
loop_454:
	nop
	set	0x46, %g6
	ldsba	[%l7 + %g6] 0x88,	%g7
	fmovsneg	%icc,	%f30,	%f30
	tg	%icc,	0x2
	bshuffle	%f30,	%f4,	%f20
	fpack32	%f8,	%f6,	%f12
	call	loop_455
	tg	%xcc,	0x5
	fornot2s	%f6,	%f1,	%f21
	fmovrdgz	%l4,	%f28,	%f26
loop_455:
	taddcctv	%g4,	%o2,	%i3
	movo	%fcc2,	%l5,	%i7
	fpack32	%f16,	%f10,	%f2
	call	loop_456
	fmovsl	%xcc,	%f29,	%f12
	movge	%fcc0,	%g5,	%o5
	fnot1s	%f5,	%f14
loop_456:
	fzero	%f22
	fmovdlg	%fcc0,	%f12,	%f2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_457
	subc	%i2,	%o3,	%l1
	call	loop_458
	srax	%o1,	%i4,	%i0
loop_457:
	fornot1	%f24,	%f14,	%f26
	call	loop_459
loop_458:
	fmovdvc	%xcc,	%f18,	%f2
	edge32ln	%g1,	%l0,	%i6
	fands	%f24,	%f9,	%f17
loop_459:
	subccc	%l3,	%o0,	%l6
	call	loop_460
loop_460:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 28
!	Type a   	: 34
!	Type cti   	: 140
!	Type x   	: 8
!	Type f   	: 134
!	Type i   	: 156
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
	set	0xC,	%g1
	set	0x6,	%g2
	set	0x9,	%g3
	set	0xC,	%g4
	set	0xC,	%g5
	set	0x3,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0x0,	%i2
	set	-0xA,	%i3
	set	-0xB,	%i4
	set	-0xE,	%i5
	set	-0x5,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x3C3C816D,	%l0
	set	0x2AE29BCC,	%l1
	set	0x06681297,	%l2
	set	0x086BE8C0,	%l3
	set	0x564FDF02,	%l4
	set	0x2A0BDECC,	%l5
	set	0x7EBDFA77,	%l6
	!# Output registers
	set	-0x109D,	%o0
	set	-0x1679,	%o1
	set	0x1650,	%o2
	set	0x1FDE,	%o3
	set	0x1819,	%o4
	set	0x0BD3,	%o5
	set	0x0037,	%o6
	set	0x1D89,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	call	loop_461
	call	loop_462
	array32	%g6,	%o7,	%i1
	fpsub16	%f28,	%f22,	%f10
loop_461:
	fmovsug	%fcc2,	%f2,	%f22
loop_462:
	rdpr	%cwp,	%o6
	movcs	%xcc,	%i5,	%g3
	rd	%y,	%o4
	bmask	%l2,	%g7,	%l4
	nop
	set	0x16, %i2
	ldsh	[%l7 + %i2],	%g2
	call	loop_463
	sllx	%o2,	0x02,	%g4
	umulcc	%l5,	0x0225,	%i3
	nop
	setx	0x968B5BBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
loop_463:
	orncc	%i7,	%o5,	%i2
	fabss	%f29,	%f0
	bcs	%xcc,	loop_464
	call	loop_465
	fmovsleu	%xcc,	%f3,	%f31
	call	loop_466
loop_464:
	fmovsge	%icc,	%f29,	%f5
loop_465:
	call	loop_467
	call	loop_468
loop_466:
	wrpr	%o3,	0x1731,	%cwp
	pdist	%f2,	%f12,	%f2
loop_467:
	subccc	%l1,	0x151C,	%g5
loop_468:
	nop
	setx loop_469, %l0, %l1
	jmpl %l1, %i4
	fbge,pn	%fcc1,	loop_470
	fmovsne	%fcc3,	%f8,	%f29
	call	loop_471
loop_469:
	call	loop_472
loop_470:
	tsubcctv	%i0,	%o1,	%l0
	taddcctv	%g1,	0x06F3,	%l3
loop_471:
	fcmped	%fcc3,	%f4,	%f16
loop_472:
	fmovde	%fcc2,	%f14,	%f30
	rdhpr	%hintp,	%o0
	brz,a	%l6,	loop_473
	movrne	%i6,	0x154,	%g6
	fornot2	%f22,	%f4,	%f8
	call	loop_474
loop_473:
	add	%o7,	%o6,	%i5
	call	loop_475
	stw	%g3,	[%l7 + 0x3C]
loop_474:
	fnands	%f9,	%f30,	%f3
	call	loop_476
loop_475:
	wrpr 	%g0, 	0x0, 	%gl
	sll	%o4,	%l4,	%g7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x08] %asi,	%g2
loop_476:
	fandnot1	%f12,	%f10,	%f24
	orn	%o2,	0x1377,	%l5
	fmovdg	%fcc1,	%f24,	%f12
	nop
	setx	0x2B384DCDA1954CA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
	fmul8x16au	%f28,	%f11,	%f10
	call	loop_477
	wrpr	%i3,	%i7,	%cwp
	bge,a,pt	%icc,	loop_478
	movule	%fcc2,	%o5,	%i2
loop_477:
	te	%xcc,	0x2
	fmovrsgez	%g4,	%f21,	%f25
loop_478:
	nop
	fitos	%f1,	%f20
	fstox	%f20,	%f20
	call	loop_479
	call	loop_480
	fmovdue	%fcc3,	%f18,	%f28
	call	loop_481
loop_479:
	call	loop_482
loop_480:
	fmovsug	%fcc0,	%f5,	%f24
	call	loop_483
loop_481:
	tneg	%xcc,	0x0
loop_482:
	fblg,a	%fcc0,	loop_484
	edge32ln	%l1,	%o3,	%g5
loop_483:
	xnor	%i0,	0x0198,	%o1
	array32	%l0,	%g1,	%i4
loop_484:
	nop
	setx loop_485, %l0, %l1
	jmpl %l1, %l3
	rd	%pc,	%o0
	call	loop_486
	fmovsge	%fcc2,	%f20,	%f3
loop_485:
	call	loop_487
	movre	%l6,	0x061,	%g6
loop_486:
	call	loop_488
	call	loop_489
loop_487:
	tsubcctv	%o7,	%o6,	%i5
	call	loop_490
loop_488:
	tsubcctv	%g3,	%i6,	%l2
loop_489:
	rdpr	%cleanwin,	%i1
	call	loop_491
loop_490:
	call	loop_492
	lduh	[%l7 + 0x60],	%l4
	call	loop_493
loop_491:
	faligndata	%f4,	%f14,	%f16
loop_492:
	fone	%f20
	fornot2s	%f28,	%f0,	%f17
loop_493:
	fpadd32	%f14,	%f4,	%f30
	call	loop_494
	fmovs	%f26,	%f21
	call	loop_495
	xor	%o4,	0x078B,	%g2
loop_494:
	movre	%g7,	0x0BC,	%o2
	addcc	%l5,	0x1938,	%i7
loop_495:
	call	loop_496
	movrgez	%o5,	0x379,	%i2
	fmuld8ulx16	%f19,	%f6,	%f2
	movul	%fcc1,	0x1AC,	%g4
loop_496:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f12
	fxtod	%f12,	%f22
	membar	0x4C
	orcc	%l1,	%i3,	%o3
	edge16n	%i0,	%g5,	%l0
	call	loop_497
	nop
	setx	0x032A,	%l0,	%i4
	sdivcc	%o1,	%i4,	%l3
	edge8n	%g1,	%l6,	%o0
	xor	%o7,	%o6,	%g6
loop_497:
	array8	%i5,	%g3,	%l2
	call	loop_498
	subccc	%i6,	%i1,	%o4
	udivx	%g2,	0x088C,	%g7
	call	loop_499
loop_498:
	sub	%o2,	%l4,	%i7
	bcs,pn	%icc,	loop_500
	call	loop_501
loop_499:
	nop
	setx	0xBEA5763B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x425F480A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f25,	%f7
	fmovsg	%xcc,	%f11,	%f19
loop_500:
	rd	%fprs,	%l5
loop_501:
	nop
	fitos	%f0,	%f3
	fstox	%f3,	%f2
	fxtos	%f2,	%f25
	smul	%o5,	0x06EA,	%g4
	call	loop_502
	orcc	%i2,	%l1,	%i3
	move	%fcc0,	0x2ED,	%i0
	fors	%f30,	%f12,	%f19
loop_502:
	movneg	%icc,	0x406,	%g5
	call	loop_503
	fsrc1s	%f28,	%f17
	rd	%ccr,	%o3
	fmovsleu	%icc,	%f20,	%f17
loop_503:
	umulcc	%o1,	%i4,	%l3
	call	loop_504
	flushw
	mulscc	%l0,	0x0007,	%l6
	call	loop_505
loop_504:
	bne,a,pt	%xcc,	loop_506
	fmuld8ulx16	%f21,	%f19,	%f18
	call	loop_507
loop_505:
	fmovdl	%xcc,	%f16,	%f30
loop_506:
	membar	0x6C
	ld	[%l7 + 0x20],	%f10
loop_507:
	fxnor	%f4,	%f4,	%f28
	call	loop_508
	call	loop_509
	st	%f15,	[%l7 + 0x30]
	nop
	fitos	%f4,	%f21
	fstox	%f21,	%f14
	fxtos	%f14,	%f13
loop_508:
	edge32	%o0,	%o7,	%o6
loop_509:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f10
	call	loop_510
	movpos	%xcc,	0x72A,	%g1
	call	loop_511
	orcc	%i5,	0x1B33,	%g3
loop_510:
	movu	%fcc3,	0x053,	%l2
	call	loop_512
loop_511:
	fpadd16s	%f17,	%f29,	%f7
	call	loop_513
	call	loop_514
loop_512:
	fbuge,a	%fcc2,	loop_515
	movre	%g6,	%i1,	%i6
loop_513:
	call	loop_516
loop_514:
	smulcc	%g2,	%g7,	%o4
loop_515:
	call	loop_517
	call	loop_518
loop_516:
	call	loop_519
	fmovsne	%fcc1,	%f9,	%f16
loop_517:
	nop
	setx	0x83EBF41B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xA86C87D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f5,	%f31
loop_518:
	movul	%fcc1,	0x376,	%l4
loop_519:
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f9
	call	loop_520
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%o2
	rdhpr	%hintp,	%l5
	tl	%xcc,	0x5
loop_520:
	fmul8x16au	%f20,	%f20,	%f18
	fnor	%f14,	%f10,	%f18
	edge32l	%o5,	%g4,	%i7
	fmovsug	%fcc1,	%f7,	%f26
	movn	%xcc,	%i2,	%i3
	rdhpr	%hsys_tick_cmpr,	%i0
	call	loop_521
	call	loop_522
	fmovrdlz	%g5,	%f26,	%f8
	edge16	%l1,	%o3,	%i4
loop_521:
	call	loop_523
loop_522:
	call	loop_524
	call	loop_525
	fmovso	%fcc0,	%f1,	%f12
loop_523:
	call	loop_526
loop_524:
	call	loop_527
loop_525:
	fcmpeq16	%f6,	%f4,	%o1
	rd	%sys_tick_cmpr,	%l0
loop_526:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f26
loop_527:
	call	loop_528
	mulscc	%l3,	0x0B68,	%l6
	call	loop_529
	srl	%o7,	%o0,	%g1
loop_528:
	xnorcc	%o6,	%g3,	%l2
	call	loop_530
loop_529:
	call	loop_531
	movg	%fcc1,	%g6,	%i5
	fsrc2	%f16,	%f4
loop_530:
	movlg	%fcc0,	%i6,	%g2
loop_531:
	fmovdge	%fcc0,	%f4,	%f4
	movrgz	%i1,	0x2DC,	%g7
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc9
	addc	%o4,	%l4,	%l5
	fornot2s	%f23,	%f19,	%f20
	fcmpd	%fcc0,	%f16,	%f16
	flushw
	smulcc	%o2,	0x1AF6,	%g4
	tvs	%xcc,	0x2
	srl	%i7,	0x18,	%i2
	fmovsue	%fcc0,	%f12,	%f30
	call	loop_532
	call	loop_533
	call	loop_534
	fornot2s	%f18,	%f28,	%f7
loop_532:
	move	%xcc,	%i3,	%i0
loop_533:
	bn,a	%xcc,	loop_535
loop_534:
	call	loop_536
	call	loop_537
	bvc	%xcc,	loop_538
loop_535:
	fxnor	%f20,	%f16,	%f10
loop_536:
	rd	%y,	%g5
loop_537:
	sir	0x1ECA
loop_538:
	rd	%tick_cmpr,	%l1
	call	loop_539
	tgu	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0
loop_539:
	fmovdgu	%xcc,	%f10,	%f4
	orn	%o3,	%o1,	%i4
	call	loop_540
	call	loop_541
	wr	%l3,	0x10A8,	%pic
	fmovsu	%fcc2,	%f29,	%f20
loop_540:
	edge16l	%l0,	%l6,	%o0
loop_541:
	call	loop_542
	fnands	%f27,	%f27,	%f5
	fcmpgt16	%f2,	%f8,	%o7
	nop
	setx	0xDAE6FA1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x88A7CB64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f3,	%f16
loop_542:
	fmovdn	%icc,	%f22,	%f4
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f29
	fmovsa	%fcc1,	%f30,	%f8
	fmovdle	%xcc,	%f10,	%f16
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x78] %asi,	%o6
	stb	%g1,	[%l7 + 0x3C]
	fxors	%f1,	%f17,	%f12
	call	loop_543
	fmovdgu	%xcc,	%f18,	%f10
	call	loop_544
	fmovdle	%fcc1,	%f22,	%f16
loop_543:
	call	loop_545
	call	loop_546
loop_544:
	tleu	%icc,	0x3
	call	loop_547
loop_545:
	fandnot1	%f10,	%f12,	%f4
loop_546:
	tsubcc	%l2,	0x0C38,	%g6
	andncc	%i5,	0x0B6D,	%g3
loop_547:
	nop
	fitod	%f12,	%f10
	tgu	%xcc,	0x0
	call	loop_548
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f6
	fxtod	%f6,	%f2
	fxor	%f0,	%f28,	%f6
	fandnot2s	%f25,	%f8,	%f1
loop_548:
	call	loop_549
	edge32n	%g2,	%i1,	%i6
	fpadd32	%f6,	%f6,	%f8
	fbge,a,pt	%fcc0,	loop_550
loop_549:
	fmovsuge	%fcc1,	%f21,	%f12
	smulcc	%g7,	0x0C4E,	%l4
	nop
	set	0x58, %g2
	stx	%l5,	[%l7 + %g2]
loop_550:
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f25
	movug	%fcc1,	%o2,	%o4
	std	%g4,	[%l7 + 0x18]
	movcs	%xcc,	0x48D,	%i7
	call	loop_551
	nop
	setx	0x97FB1318,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x8940D4E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f0,	%f18
	fmul8sux16	%f16,	%f14,	%f20
	wr	%g0,	0x89,	%asi
	stda	%i2,	[%l7 + 0x28] %asi
loop_551:
	call	loop_552
	call	loop_553
	fmovrdgz	%i0,	%f20,	%f20
	subcc	%i3,	0x0AEA,	%l1
loop_552:
	edge16	%g5,	%o5,	%o1
loop_553:
	fmovs	%f8,	%f1
	addccc	%o3,	%i4,	%l0
	wr 	%g0, 	0x6, 	%fprs
	rd	%y,	%o7
	fpsub32	%f28,	%f10,	%f18
	fmovsule	%fcc1,	%f22,	%f30
	fmovdleu	%icc,	%f30,	%f18
	call	loop_554
	call	loop_555
	bge,a,pt	%icc,	loop_556
	movlg	%fcc2,	%l3,	%g1
loop_554:
	call	loop_557
loop_555:
	ldub	[%l7 + 0x51],	%l2
loop_556:
	call	loop_558
	call	loop_559
loop_557:
	call	loop_560
	call	loop_561
loop_558:
	fones	%f30
loop_559:
	brgez	%g6,	loop_562
loop_560:
	ba	%xcc,	loop_563
loop_561:
	movule	%fcc0,	%i5,	%o6
	srlx	%g2,	0x15,	%i1
loop_562:
	call	loop_564
loop_563:
	fmovsvc	%xcc,	%f20,	%f13
	movvc	%xcc,	%g3,	%i6
	call	loop_565
loop_564:
	for	%f6,	%f2,	%f18
	fones	%f17
	add	%l4,	0x1C37,	%g7
loop_565:
	fmovdneg	%icc,	%f18,	%f2
	xor	%o2,	%o4,	%l5
	movo	%fcc2,	%g4,	%i2
	fbl,a,pt	%fcc0,	loop_566
	call	loop_567
	fmovspos	%icc,	%f23,	%f6
	nop
	setx	0x0934,	%l0,	%i0
	sdivx	%i7,	%i0,	%l1
loop_566:
	call	loop_568
loop_567:
	fbu,pn	%fcc0,	loop_569
	ldx	[%l7 + 0x10],	%i3
	fpsub16s	%f21,	%f28,	%f20
loop_568:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_569:
	call	loop_570
	call	loop_571
	movlg	%fcc0,	0x057,	%o5
	call	loop_572
loop_570:
	nop
	setx	0x066C,	%l0,	%o1
	sdivx	%g5,	%o1,	%o3
loop_571:
	nop
	setx	0x0675,	%l0,	%l6
	sdiv	%l0,	%l6,	%o0
	fandnot2s	%f0,	%f0,	%f22
loop_572:
	call	loop_573
	call	loop_574
	tvs	%icc,	0x5
	nop
	setx	0xC81ED8E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x57A2AC8D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f27,	%f25
loop_573:
	nop
	fitod	%f15,	%f2
loop_574:
	fbul,a	%fcc1,	loop_575
	movpos	%icc,	0x27C,	%i4
	bge,a,pn	%xcc,	loop_576
	lduw	[%l7 + 0x6C],	%l3
loop_575:
	fmovdul	%fcc1,	%f14,	%f18
	call	loop_577
loop_576:
	wrpr	%o7,	%g1,	%tick
	fcmple16	%f18,	%f10,	%g6
	ba	%xcc,	loop_578
loop_577:
	fbe	%fcc2,	loop_579
	fmovdul	%fcc1,	%f14,	%f16
	xnorcc	%l2,	0x0294,	%i5
loop_578:
	call	loop_580
loop_579:
	brlz	%o6,	loop_581
	call	loop_582
	brlez,pt	%i1,	loop_583
loop_580:
	wr	%g3,	%i6,	%softint
loop_581:
	call	loop_584
loop_582:
	call	loop_585
loop_583:
	fnors	%f15,	%f16,	%f21
	andcc	%l4,	%g2,	%g7
loop_584:
	movgu	%xcc,	0x1B7,	%o2
loop_585:
	nop
	set	0x20, %o1
	stwa	%l5,	[%l7 + %o1] 0x0c
	call	loop_586
	fmovsgu	%xcc,	%f9,	%f12
	flush	%l7 + 0x14
	fcmpeq16	%f20,	%f0,	%g4
loop_586:
	add	%i2,	%i7,	%o4
	call	loop_587
	call	loop_588
	stb	%l1,	[%l7 + 0x46]
	fmovdcc	%xcc,	%f18,	%f8
loop_587:
	nop
	setx	0x2763E5FF7A5D3F41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3C2A0CE6DA7E836A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f8
loop_588:
	fandnot2s	%f9,	%f12,	%f18
	edge32n	%i0,	%o5,	%i3
	lduw	[%l7 + 0x70],	%o1
	movle	%icc,	0x50C,	%g5
	movgu	%icc,	%o3,	%l6
	move	%icc,	%l0,	%o0
	wr	%l3,	%i4,	%ccr
	sdivcc	%g1,	0x1889,	%g6
	edge8	%l2,	%o7,	%i5
	fzeros	%f17
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovrsgz	%o6,	%f21,	%f13
	fabsd	%f2,	%f30
	call	loop_589
	fsrc2s	%f31,	%f8
	nop
	setx	0x189B717AC9A7978F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f2
	call	loop_590
loop_589:
	call	loop_591
	fmovdpos	%icc,	%f18,	%f8
	fmovsn	%fcc1,	%f2,	%f15
loop_590:
	addc	%g3,	0x08C7,	%i6
loop_591:
	fmul8x16au	%f1,	%f27,	%f12
	edge8n	%i1,	%l4,	%g2
	fmovdug	%fcc0,	%f0,	%f0
	call	loop_592
	move	%xcc,	0x606,	%o2
	fpsub16s	%f30,	%f10,	%f22
	fbul	%fcc0,	loop_593
loop_592:
	fpack16	%f0,	%f18
	call	loop_594
	subc	%g7,	0x1A3F,	%g4
loop_593:
	call	loop_595
	fone	%f24
loop_594:
	array32	%l5,	%i7,	%i2
	bge,a	%xcc,	loop_596
loop_595:
	fmul8sux16	%f16,	%f18,	%f20
	fmovdu	%fcc2,	%f4,	%f18
	flushw
loop_596:
	fmovrdgz	%o4,	%f2,	%f12
	xnorcc	%i0,	0x1BE2,	%o5
	fmovduge	%fcc0,	%f24,	%f28
	fpack16	%f2,	%f16
	edge32n	%l1,	%o1,	%i3
	movcc	%icc,	0x17A,	%o3
	call	loop_597
	srlx	%l6,	0x17,	%g5
	popc	0x0725,	%l0
	fsrc2s	%f6,	%f7
loop_597:
	wr	%l3,	%o0,	%y
	call	loop_598
	call	loop_599
	fmovdn	%fcc1,	%f10,	%f2
	fpsub32	%f26,	%f28,	%f12
loop_598:
	fands	%f28,	%f24,	%f0
loop_599:
	call	loop_600
	nop
	fitod	%f0,	%f22
	fdtos	%f22,	%f13
	nop
	setx	0x2EA55FA2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9F899AAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f11,	%f18
	sdiv	%g1,	0x0476,	%g6
loop_600:
	movrne	%l2,	%i4,	%o7
	tsubcc	%o6,	0x0F87,	%g3
	set	0x48, %o6
	sta	%f29,	[%l7 + %o6] 0x19
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%i6
	fors	%f26,	%f8,	%f0
	fmovsue	%fcc1,	%f13,	%f12
	fmovdpos	%icc,	%f24,	%f18
	fsrc1s	%f29,	%f6
	movle	%fcc3,	%l4,	%g2
	fmovso	%fcc3,	%f26,	%f17
	fbuge,a,pn	%fcc3,	loop_601
	call	loop_602
	sub	%i1,	%g7,	%o2
	call	loop_603
loop_601:
	call	loop_604
loop_602:
	movrne	%l5,	0x3AA,	%g4
	wrpr	%i7,	%i2,	%pil
loop_603:
	fpadd32	%f0,	%f6,	%f18
loop_604:
	rdhpr	%hsys_tick_cmpr,	%o4
	faligndata	%f2,	%f4,	%f14
	tl	%icc,	0x2
	movl	%icc,	0x4C2,	%i0
	fcmple16	%f4,	%f10,	%o5
	fxnors	%f14,	%f22,	%f4
	edge8l	%l1,	%i3,	%o3
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x88,	%o1
	fzero	%f12
	movpos	%xcc,	%g5,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x765, 	%sys_tick_cmpr
	st	%f26,	[%l7 + 0x1C]
	fbu	%fcc1,	loop_605
	fbl,a,pt	%fcc2,	loop_606
	nop
	set	0x1B, %o4
	stb	%l3,	[%l7 + %o4]
	fcmps	%fcc2,	%f0,	%f14
loop_605:
	udivcc	%g1,	0x1D6D,	%o0
loop_606:
	fpack32	%f26,	%f12,	%f20
	call	loop_607
	call	loop_608
	call	loop_609
	movrgez	%g6,	0x15A,	%l2
loop_607:
	fmovspos	%xcc,	%f29,	%f16
loop_608:
	call	loop_610
loop_609:
	tpos	%xcc,	0x1
	fmovdneg	%xcc,	%f28,	%f12
	fornot2	%f24,	%f26,	%f10
loop_610:
	sll	%o7,	%o6,	%g3
	call	loop_611
	edge32ln	%i5,	%i6,	%l4
	call	loop_612
	call	loop_613
loop_611:
	nop
	setx	0x8B59F576,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f4
	nop
	setx	0x373B6C60,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
loop_612:
	nop
	setx	0xEF9C1619,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x8A53E6B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f21,	%f17
loop_613:
	andcc	%i4,	%g2,	%g7
	fandnot2	%f26,	%f22,	%f26
	fmovrdgz	%o2,	%f12,	%f30
	fcmple32	%f0,	%f4,	%l5
	edge16l	%i1,	%g4,	%i7
	movcc	%icc,	%o4,	%i2
	edge16l	%o5,	%i0,	%i3
	movn	%xcc,	%l1,	%o1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 28
!	Type a   	: 25
!	Type x   	: 10
!	Type cti   	: 153
!	Type f   	: 145
!	Type i   	: 139
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
	set	0x3,	%g1
	set	0x9,	%g2
	set	0xC,	%g3
	set	0xD,	%g4
	set	0xB,	%g5
	set	0xB,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xA,	%i1
	set	-0x8,	%i2
	set	-0x8,	%i3
	set	-0x1,	%i4
	set	-0xA,	%i5
	set	-0x1,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x0B953824,	%l0
	set	0x15BA4E40,	%l1
	set	0x10AE996B,	%l2
	set	0x43518646,	%l3
	set	0x5D11DCBB,	%l4
	set	0x531B14C9,	%l5
	set	0x60B57AEC,	%l6
	!# Output registers
	set	-0x04B2,	%o0
	set	-0x03BE,	%o1
	set	0x1BFE,	%o2
	set	0x11D1,	%o3
	set	-0x0479,	%o4
	set	-0x0E36,	%o5
	set	-0x180C,	%o6
	set	-0x04A8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	call	loop_614
	fandnot1	%f14,	%f24,	%f28
	rd	%tick_cmpr,	%g5
	movule	%fcc0,	0x398,	%o3
loop_614:
	tpos	%icc,	0x2
	sethi	0x1B8D,	%l0
	srl	%l3,	0x12,	%l6
	for	%f4,	%f4,	%f2
	call	loop_615
	call	loop_616
	movul	%fcc1,	%o0,	%g1
	subc	%g6,	0x015F,	%l2
loop_615:
	tg	%icc,	0x1
loop_616:
	movvs	%xcc,	0x216,	%o7
	rdpr	%otherwin,	%g3
	call	loop_617
	call	loop_618
	call	loop_619
	tleu	%icc,	0x6
loop_617:
	nop
	setx	0x0250,	%l0,	%i6
	udiv	%o6,	%i6,	%l4
loop_618:
	fornot1s	%f15,	%f24,	%f27
loop_619:
	add	%i4,	0x041B,	%i5
	fblg	%fcc2,	loop_620
	movu	%fcc2,	0x72D,	%g7
	pdist	%f6,	%f24,	%f8
	call	loop_621
loop_620:
	te	%xcc,	0x5
	call	loop_622
	call	loop_623
loop_621:
	call	loop_624
	srax	%g2,	%l5,	%i1
loop_622:
	wr	%o2,	%i7,	%pic
loop_623:
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%o4
loop_624:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	loop_625,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002400001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sir	0x02DF
	flushw
	taddcctv	%i2,	0x0F76,	%g4
loop_625:
	fxor	%f10,	%f10,	%f2
	fmuld8ulx16	%f10,	%f12,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8sux16	%f26,	%f24,	%f4
	call	loop_626
	movrgz	%i3,	0x23B,	%i0
	tcc	%icc,	0x6
	fbne,a	%fcc3,	loop_627
loop_626:
	lduw	[%l7 + 0x38],	%l1
	call	loop_628
	movlg	%fcc2,	%o1,	%o3
loop_627:
	call	loop_629
	fbe,pt	%fcc2,	loop_630
loop_628:
	call	loop_631
	umulcc	%l0,	0x0FC0,	%g5
loop_629:
	fornot1s	%f9,	%f28,	%f28
loop_630:
	movvs	%icc,	%l6,	%o0
loop_631:
	wr	%g1,	%g6,	%softint
	fands	%f22,	%f9,	%f6
	edge32	%l2,	%l3,	%g3
	movcc	%icc,	0x4FB,	%o6
	call	loop_632
	fpsub16s	%f12,	%f8,	%f25
	fmovrdgez	%i6,	%f2,	%f10
	fmovdvs	%icc,	%f2,	%f8
loop_632:
	call	loop_633
	movn	%xcc,	%o7,	%l4
	call	loop_634
	call	loop_635
loop_633:
	fbuge	%fcc1,	loop_636
	movne	%fcc2,	0x67F,	%i4
loop_634:
	edge16ln	%i5,	%g2,	%g7
loop_635:
	fnot2	%f22,	%f22
loop_636:
	call	loop_637
	rd	%sys_tick_cmpr,	%i1
	tn	%icc,	0x1
	bpos,pn	%icc,	loop_638
loop_637:
	tne	%icc,	0x5
	and	%l5,	%i7,	%o2
	call	loop_639
loop_638:
	fmovsa	%icc,	%f9,	%f16
	fbg,a	%fcc0,	loop_640
	fsrc2	%f22,	%f12
loop_639:
	call	loop_641
	fsrc1	%f28,	%f18
loop_640:
	siam	0x0
	bvc,a,pn	%xcc,	loop_642
loop_641:
	fone	%f24
	fmovse	%xcc,	%f2,	%f21
	rdhpr	%hpstate,	%o4
loop_642:
	movpos	%xcc,	0x517,	%g4
	fba,a	%fcc2,	loop_643
	ba,a,pt	%xcc,	loop_644
	orncc	%i2,	0x0A8C,	%o5
	rd	%softint,	%i0
loop_643:
	fmovsul	%fcc3,	%f2,	%f15
loop_644:
	call	loop_645
	fbne,a,pn	%fcc1,	loop_646
	fandnot2s	%f28,	%f17,	%f14
	fcmple32	%f10,	%f16,	%i3
loop_645:
	wr	%l1,	0x0CA4,	%ccr
loop_646:
	call	loop_647
	tleu	%icc,	0x7
	fmovslg	%fcc0,	%f7,	%f29
	fnand	%f24,	%f26,	%f10
loop_647:
	call	loop_648
	bge,a,pt	%xcc,	loop_649
	call	loop_650
	movcc	%xcc,	%o1,	%o3
loop_648:
	flush	%l7 + 0x4C
loop_649:
	edge32	%l0,	%g5,	%l6
loop_650:
	call	loop_651
	call	loop_652
	fmovsul	%fcc0,	%f16,	%f3
	fornot2s	%f8,	%f22,	%f26
loop_651:
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f21
loop_652:
	fnor	%f24,	%f2,	%f6
	call	loop_653
	or	%o0,	%g1,	%l2
	fzeros	%f28
	nop
	setx	0x121A,	%l0,	%g3
	udivx	%l3,	%g3,	%g6
loop_653:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x53] %asi,	%i6
	fands	%f27,	%f0,	%f1
	fmovdl	%fcc2,	%f10,	%f20
	andncc	%o6,	0x0D23,	%o7
	movue	%fcc1,	0x4DA,	%l4
	srax	%i4,	%i5,	%g7
	fxors	%f14,	%f26,	%f0
	movvc	%icc,	0x2F5,	%g2
	movn	%fcc0,	0x7F5,	%l5
	tvc	%xcc,	0x3
	call	loop_654
	siam	0x0
	tl	%icc,	0x3
	edge16n	%i1,	%i7,	%o2
loop_654:
	xorcc	%o4,	%i2,	%o5
	edge16ln	%g4,	%i3,	%l1
	tleu	%xcc,	0x7
	tne	%icc,	0x2
	fmovsl	%fcc2,	%f9,	%f31
	call	loop_655
	movrlez	%o1,	0x2A2,	%o3
	bcs	%xcc,	loop_656
	fbo,a,pt	%fcc2,	loop_657
loop_655:
	call	loop_658
	movlg	%fcc0,	0x54B,	%l0
loop_656:
	bneg	%xcc,	loop_659
loop_657:
	edge8ln	%g5,	%l6,	%o0
loop_658:
	movn	%xcc,	%g1,	%l2
	ld	[%l7 + 0x6C],	%f14
loop_659:
	nop
	fitos	%f13,	%f21
	fstox	%f21,	%f26
	fxtos	%f26,	%f26
	call	loop_660
	call	loop_661
	tpos	%icc,	0x4
	call	loop_662
loop_660:
	orcc	%l3,	0x0E7E,	%i0
loop_661:
	fmovscc	%icc,	%f0,	%f7
	fnot1s	%f29,	%f0
loop_662:
	fbue,a	%fcc0,	loop_663
	ta	%icc,	0x1
	call	loop_664
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 3
loop_663:
	wrpr	%g3,	%g6,	%tick
	edge32	%i6,	%o6,	%l4
loop_664:
	ba,a	%icc,	loop_665
	udivcc	%i4,	0x0628,	%o7
	rdhpr	%hintp,	%g7
	fpadd16	%f14,	%f0,	%f18
loop_665:
	call	loop_666
	fmovduge	%fcc0,	%f0,	%f6
	fmul8x16	%f7,	%f20,	%f26
	fmovsul	%fcc0,	%f7,	%f26
loop_666:
	call	loop_667
	fcmpne32	%f26,	%f22,	%g2
	call	loop_668
	andn	%l5,	%i1,	%i5
loop_667:
	nop
	fitos	%f0,	%f2
	fstox	%f2,	%f22
	fpadd16s	%f4,	%f10,	%f17
loop_668:
	rdhpr	%hpstate,	%o2
	call	loop_669
	fmovsn	%icc,	%f12,	%f5
	movrlz	%o4,	0x2D8,	%i7
	fmovsuge	%fcc0,	%f18,	%f15
loop_669:
	call	loop_670
	movule	%fcc3,	0x6EA,	%o5
	call	loop_671
	fpack32	%f26,	%f8,	%f22
loop_670:
	call	loop_672
	call	loop_673
loop_671:
	or	%g4,	0x02B9,	%i3
	udivx	%i2,	0x12E7,	%o1
loop_672:
	rdpr	%cleanwin,	%l1
loop_673:
	fxnors	%f4,	%f20,	%f9
	fandnot2	%f16,	%f28,	%f16
	fcmps	%fcc0,	%f16,	%f28
	call	loop_674
	fmovsule	%fcc0,	%f3,	%f20
	fpmerge	%f15,	%f8,	%f16
	fxor	%f8,	%f4,	%f22
loop_674:
	movug	%fcc0,	0x3FA,	%l0
	bvs,a	%xcc,	loop_675
	wr	%o3,	0x0EDA,	%softint
	movcc	%icc,	0x793,	%l6
	tg	%icc,	0x5
loop_675:
	nop
	fitod	%f3,	%f16
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x11,	%f0
	fors	%f9,	%f30,	%f3
	movule	%fcc2,	%o0,	%g1
	wr	%l2,	%l3,	%set_softint
	udivx	%i0,	0x1BE7,	%g5
	fmovrse	%g3,	%f21,	%f6
	fnands	%f17,	%f19,	%f30
	call	loop_676
	subccc	%g6,	%o6,	%i6
	fmovdug	%fcc2,	%f30,	%f18
	call	loop_677
loop_676:
	fmovrdlez	%l4,	%f10,	%f10
	call	loop_678
	fmovrsgez	%i4,	%f8,	%f3
loop_677:
	fxnors	%f0,	%f14,	%f21
	fmovsue	%fcc0,	%f21,	%f11
loop_678:
	sub	%g7,	%g2,	%o7
	wr	%l5,	%i1,	%pic
	array32	%o2,	%o4,	%i7
	nop
	fitos	%f23,	%f2
	fmovsge	%fcc3,	%f11,	%f0
	fxor	%f0,	%f28,	%f2
	brlez,a	%o5,	loop_679
	fmul8x16al	%f5,	%f7,	%f0
	tgu	%icc,	0x2
	fbu,a,pt	%fcc3,	loop_680
loop_679:
	call	loop_681
	call	loop_682
	ldub	[%l7 + 0x7E],	%i5
loop_680:
	call	loop_683
loop_681:
	fmovdleu	%icc,	%f4,	%f8
loop_682:
	fmovrslez	%g4,	%f21,	%f25
	fmovdneg	%icc,	%f6,	%f10
loop_683:
	call	loop_684
	call	loop_685
	wrpr	%i2,	0x1709,	%pil
	fmovrse	%o1,	%f9,	%f8
loop_684:
	fbo,a	%fcc1,	loop_686
loop_685:
	fcmped	%fcc1,	%f6,	%f20
	wrpr	%i3,	0x19B8,	%pil
	smulcc	%l0,	0x040E,	%l1
loop_686:
	sra	%o3,	%l6,	%g1
	wr	%o0,	0x1355,	%sys_tick
	fpsub16s	%f0,	%f8,	%f19
	call	loop_687
	nop
	setx	0xA0A15E106033B104,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	call	loop_688
	call	loop_689
loop_687:
	call	loop_690
	call	loop_691
loop_688:
	sll	%l2,	%l3,	%g5
loop_689:
	bn,pt	%icc,	loop_692
loop_690:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_691:
	nop
	fitod	%f10,	%f14
	fdtos	%f14,	%f4
	fmovsl	%xcc,	%f29,	%f27
loop_692:
	fandnot1	%f30,	%f2,	%f8
	umulcc	%g3,	%g6,	%i0
	wr	%g0,	0xd2,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32l	%i6,	%o6,	%l4
	call	loop_693
	call	loop_694
	fnegd	%f12,	%f4
	mova	%xcc,	0x244,	%i4
loop_693:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x15F, 	%hsys_tick_cmpr
loop_694:
	fornot2s	%f24,	%f21,	%f5
	tn	%icc,	0x1
	fornot1s	%f16,	%f23,	%f18
	tg	%xcc,	0x3
	set	0x60, %o2
	stda	%g6,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	setx	0x4A1E96167B10BFEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f12
	fmovsvc	%xcc,	%f3,	%f10
	nop
	set	0x64, %o3
	stw	%o7,	[%l7 + %o3]
	wrpr	%l5,	%i1,	%pil
	addc	%o2,	%i7,	%o5
	call	loop_695
	nop
	setx	0x8D989807,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x9E41B288,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f23,	%f8
	fnegs	%f0,	%f11
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_695:
	udiv	%i5,	0x1556,	%g4
	call	loop_696
	nop
	set	0x46, %g5
	ldstub	[%l7 + %g5],	%o4
	rdpr	%tba,	%o1
	rd	%y,	%i3
loop_696:
	bshuffle	%f18,	%f26,	%f16
	fmovrdne	%l0,	%f4,	%f4
	fblg,a	%fcc2,	loop_697
	fsrc2s	%f4,	%f9
	nop
	fitos	%f0,	%f11
	fstox	%f11,	%f12
	fxtos	%f12,	%f28
	fcmple16	%f2,	%f10,	%l1
loop_697:
	fsrc2	%f0,	%f12
	fpadd32	%f22,	%f16,	%f24
	nop
	setx	0x08E4E5FEB97A1CED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x691D1377D19C94F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f26,	%f20
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_698
	call	loop_699
	fmovso	%fcc2,	%f30,	%f2
	alignaddr	%i2,	%l6,	%g1
loop_698:
	call	loop_700
loop_699:
	fandnot2s	%f29,	%f22,	%f19
	fzero	%f2
	fmul8ulx16	%f26,	%f12,	%f0
loop_700:
	ta	%icc,	0x6
	call	loop_701
	fnands	%f29,	%f6,	%f11
	tneg	%xcc,	0x4
	tvs	%xcc,	0x0
loop_701:
	movu	%fcc2,	0x2FD,	%o0
	wr	%g0,	0x19,	%asi
	sta	%f25,	[%l7 + 0x18] %asi
	nop
	set	0x40, %i4
	stw	%l2,	[%l7 + %i4]
	tl	%xcc,	0x0
	nop
	setx	0xBE85CAE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2B036B67,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f22,	%f24
	nop
	fitos	%f0,	%f18
	fstox	%f18,	%f30
	orcc	%o3,	%l3,	%g5
	call	loop_702
	call	loop_703
	fmovrsgz	%g6,	%f13,	%f24
	taddcc	%i0,	%g3,	%o6
loop_702:
	call	loop_704
loop_703:
	call	loop_705
	call	loop_706
	call	loop_707
loop_704:
	fmovscc	%xcc,	%f7,	%f29
loop_705:
	call	loop_708
loop_706:
	nop
	fitos	%f0,	%f0
loop_707:
	fbug,a	%fcc0,	loop_709
	fpack32	%f14,	%f28,	%f4
loop_708:
	call	loop_710
	array8	%l4,	%i6,	%g2
loop_709:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8l	%g7,	%i1,	%l5
loop_710:
	fcmpgt32	%f26,	%f14,	%o2
	edge8n	%o5,	%i7,	%i5
	fnot1	%f8,	%f16
	fmovrdgez	%g4,	%f12,	%f30
	fmovdvs	%icc,	%f2,	%f4
	fexpand	%f10,	%f0
	array32	%o4,	%i3,	%l0
	wrpr	%o1,	0x00A1,	%tick
	fmovrdgez	%l1,	%f4,	%f2
	fpsub32	%f28,	%f12,	%f22
	srl	%l6,	%i2,	%o0
	edge8ln	%l2,	%o3,	%l3
	tsubcc	%g5,	0x1B78,	%g1
	call	loop_711
	fmovsvs	%xcc,	%f23,	%f25
	tcc	%xcc,	0x6
	call	loop_712
loop_711:
	call	loop_713
	prefetch	[%l7 + 0x7C],	 2
	fmovrdlez	%g6,	%f14,	%f8
loop_712:
	call	loop_714
loop_713:
	fmovdl	%xcc,	%f28,	%f24
	stw	%i0,	[%l7 + 0x48]
	addccc	%g3,	%l4,	%o6
loop_714:
	fmovrdlz	%g2,	%f10,	%f24
	wrpr	%i6,	%o7,	%pil
	edge32	%i4,	%g7,	%i1
	nop
	setx	0x72440528,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x2DB0643E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f17,	%f14
	call	loop_715
	call	loop_716
	sll	%o2,	0x00,	%o5
	fone	%f4
loop_715:
	ble,pn	%xcc,	loop_717
loop_716:
	swap	[%l7 + 0x74],	%i7
	srl	%i5,	%g4,	%o4
	xor	%l5,	%l0,	%o1
loop_717:
	rdhpr	%hintp,	%i3
	nop
	setx loop_718, %l0, %l1
	jmpl %l1, %l6
	fmovsn	%fcc1,	%f25,	%f30
	movneg	%xcc,	0x13B,	%l1
	fbug,pt	%fcc3,	loop_719
loop_718:
	call	loop_720
	fmovdge	%xcc,	%f18,	%f0
	fmovsug	%fcc1,	%f17,	%f6
loop_719:
	bne	%icc,	loop_721
loop_720:
	addc	%o0,	0x0BFB,	%i2
	alignaddrl	%o3,	%l3,	%l2
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xcb
loop_721:
	rdhpr	%htba,	%g5
	faligndata	%f2,	%f18,	%f24
	sth	%g1,	[%l7 + 0x52]
	nop
	setx	0x111E1705,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f2
	movcc	%xcc,	0x69E,	%i0
	popc	0x154B,	%g6
	fornot2s	%f18,	%f20,	%f16
	srlx	%l4,	%o6,	%g3
	fmovdug	%fcc3,	%f4,	%f16
	fcmpne32	%f30,	%f28,	%g2
	fones	%f26
	fornot2s	%f27,	%f21,	%f15
	fcmpeq32	%f20,	%f18,	%i6
	te	%icc,	0x4
	nop
	set	0x6A, %l6
	ldsh	[%l7 + %l6],	%o7
	edge8	%i4,	%g7,	%o2
	call	loop_722
	fmovsue	%fcc1,	%f17,	%f4
	call	loop_723
	fpadd32	%f18,	%f18,	%f22
loop_722:
	bpos	%xcc,	loop_724
	movvc	%icc,	0x365,	%i1
loop_723:
	fmovde	%fcc1,	%f30,	%f18
	tpos	%icc,	0x3
loop_724:
	call	loop_725
	edge16l	%o5,	%i7,	%i5
	fands	%f6,	%f28,	%f6
	fmovdl	%xcc,	%f30,	%f26
loop_725:
	addccc	%o4,	0x1FF2,	%g4
	movneg	%xcc,	0x1E4,	%l5
	fones	%f2
	fandnot1s	%f30,	%f6,	%f2
	sir	0x0CFC
	fmovdg	%icc,	%f30,	%f30
	call	loop_726
	call	loop_727
	wrpr	%o1,	%i3,	%tick
	subcc	%l0,	%l1,	%o0
loop_726:
	fnand	%f16,	%f20,	%f14
loop_727:
	fmovdle	%icc,	%f0,	%f10
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%l6
	nop
	fitos	%f6,	%f7
	fstox	%f7,	%f4
	fxtos	%f4,	%f4
	edge32ln	%i2,	%l3,	%o3
	call	loop_728
	call	loop_729
	ta	%icc,	0x5
	edge16ln	%l2,	%g1,	%i0
loop_728:
	fmovrslez	%g5,	%f1,	%f5
loop_729:
	fmovrdlez	%l4,	%f14,	%f30
	fcmpne32	%f0,	%f26,	%o6
	fbg,a,pn	%fcc1,	loop_730
	nop
	setx	0xCF437923,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x959A851C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f10,	%f18
	call	loop_731
	movvc	%icc,	%g6,	%g3
loop_730:
	tneg	%icc,	0x2
	fmul8x16al	%f10,	%f2,	%f28
loop_731:
	sdiv	%g2,	0x0E68,	%o7
	bneg	%icc,	loop_732
	fmovdleu	%icc,	%f20,	%f14
	fxnor	%f18,	%f0,	%f30
	call	loop_733
loop_732:
	call	loop_734
	tne	%xcc,	0x0
	array32	%i6,	%g7,	%o2
loop_733:
	call	loop_735
loop_734:
	call	loop_736
	bshuffle	%f24,	%f0,	%f28
	fcmpd	%fcc2,	%f2,	%f8
loop_735:
	nop
	set	0x30, %g1
	flush	%l7 + %g1
loop_736:
	call	loop_737
	xor	%i4,	%i1,	%o5
	fandnot1	%f20,	%f22,	%f26
	fmovrdgz	%i7,	%f26,	%f10
loop_737:
	call	loop_738
	edge16n	%i5,	%o4,	%g4
	smul	%o1,	0x1294,	%i3
	fmovsle	%fcc0,	%f22,	%f11
loop_738:
	call	loop_739
	edge32n	%l5,	%l0,	%l1
	movcc	%icc,	0x006,	%l6
	udivx	%o0,	0x0ABB,	%l3
loop_739:
	tgu	%xcc,	0x0
	call	loop_740
	call	loop_741
	bcs,a,pn	%xcc,	loop_742
	fbul	%fcc3,	loop_743
loop_740:
	movul	%fcc2,	%i2,	%l2
loop_741:
	call	loop_744
loop_742:
	movn	%xcc,	%o3,	%g1
loop_743:
	movrne	%g5,	%l4,	%i0
	call	loop_745
loop_744:
	call	loop_746
	call	loop_747
	nop
	setx	0x08C9,	%l0,	%g6
	udivx	%o6,	%g6,	%g2
loop_745:
	movrgez	%g3,	%o7,	%g7
loop_746:
	movne	%fcc1,	%i6,	%o2
loop_747:
	sir	0x1138
	rdhpr	%htba,	%i1
	call	loop_748
	call	loop_749
	rdhpr	%htba,	%o5
	call	loop_750
loop_748:
	call	loop_751
loop_749:
	call	loop_752
	call	loop_753
loop_750:
	fcmple16	%f20,	%f22,	%i7
loop_751:
	edge32l	%i5,	%i4,	%g4
loop_752:
	tleu	%xcc,	0x0
loop_753:
	movul	%fcc0,	%o4,	%i3
	call	loop_754
	edge16n	%l5,	%o1,	%l0
	subc	%l1,	%o0,	%l6
	fble	%fcc2,	loop_755
loop_754:
	nop

loop_755:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 23
!	Type a   	: 31
!	Type x   	: 6
!	Type cti   	: 142
!	Type f   	: 149
!	Type i   	: 149
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
	set	0x0,	%g1
	set	0xD,	%g2
	set	0x7,	%g3
	set	0x5,	%g4
	set	0x1,	%g5
	set	0x3,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x6,	%i1
	set	-0x6,	%i2
	set	-0xC,	%i3
	set	-0x4,	%i4
	set	-0xC,	%i5
	set	-0x4,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x47A80340,	%l0
	set	0x14710180,	%l1
	set	0x527D6522,	%l2
	set	0x7C0B9830,	%l3
	set	0x12C1C346,	%l4
	set	0x00C4FF46,	%l5
	set	0x145CB883,	%l6
	!# Output registers
	set	-0x0DB2,	%o0
	set	0x07DC,	%o1
	set	0x05D8,	%o2
	set	-0x100E,	%o3
	set	-0x12F8,	%o4
	set	-0x0D56,	%o5
	set	0x1956,	%o6
	set	-0x1DA0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	nop
	setx	0xB21F8B68DB23A038,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x31493B08C0EB4A1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f4,	%f24
	call	loop_756
	call	loop_757
	fornot1	%f0,	%f0,	%f10
	call	loop_758
loop_756:
	call	loop_759
loop_757:
	fmovdlg	%fcc2,	%f0,	%f8
	fnors	%f26,	%f9,	%f31
loop_758:
	call	loop_760
loop_759:
	call	loop_761
	fmuld8sux16	%f12,	%f5,	%f4
	call	loop_762
loop_760:
	fble	%fcc2,	loop_763
loop_761:
	call	loop_764
	nop
	setx	0x0DC6,	%l0,	%l2
	sdivcc	%i2,	%l2,	%l3
loop_762:
	call	loop_765
loop_763:
	call	loop_766
loop_764:
	call	loop_767
	ta	%xcc,	0x1
loop_765:
	rd	%tick_cmpr,	%g1
loop_766:
	call	loop_768
loop_767:
	fmovda	%xcc,	%f14,	%f22
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdue	%fcc2,	%f8,	%f24
loop_768:
	fmovrsne	%o3,	%f11,	%f26
	fmovsug	%fcc1,	%f31,	%f6
	ta	%xcc,	0x6
	tge	%icc,	0x7
	fsrc1	%f30,	%f24
	call	loop_769
	edge8	%l4,	%g5,	%o6
	fmovdu	%fcc2,	%f14,	%f8
	set	0x108, %i5
	ldxa	[%g0 + %i5] 0x21,	%g6
loop_769:
	nop
	setx	0x0FCB,	%l0,	%g2
	udivx	%i0,	%g2,	%g3
	bshuffle	%f14,	%f16,	%f24
	fornot2	%f16,	%f26,	%f22
	fba	%fcc3,	loop_770
	fornot2	%f20,	%f20,	%f22
	call	loop_771
	fpack32	%f22,	%f26,	%f24
loop_770:
	bvs	%icc,	loop_772
	call	loop_773
loop_771:
	sir	0x0305
	call	loop_774
loop_772:
	st	%f29,	[%l7 + 0x68]
loop_773:
	call	loop_775
	st	%f20,	[%l7 + 0x38]
loop_774:
	fbne,a,pt	%fcc3,	loop_776
	movul	%fcc2,	0x3A1,	%o7
loop_775:
	fmovdvc	%icc,	%f28,	%f30
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 4
loop_776:
	fbul,a,pt	%fcc3,	loop_777
	call	loop_778
	call	loop_779
	subcc	%o2,	0x00D4,	%i1
loop_777:
	fmovdge	%icc,	%f4,	%f20
loop_778:
	call	loop_780
loop_779:
	call	loop_781
	fmovsn	%xcc,	%f12,	%f4
	subcc	%o5,	0x0C29,	%i7
loop_780:
	call	loop_782
loop_781:
	movne	%fcc3,	%g7,	%i4
	tl	%xcc,	0x5
	fmovdneg	%icc,	%f16,	%f2
loop_782:
	rdpr	%wstate,	%g4
	addc	%i5,	0x088C,	%i3
	rd	%fprs,	%o4
	call	loop_783
	call	loop_784
	fors	%f3,	%f24,	%f18
	nop
	setx	0x01A4,	%l0,	%o1
	udivx	%l5,	%o1,	%l1
loop_783:
	sethi	0x17D5,	%o0
loop_784:
	call	loop_785
	movvs	%xcc,	%l6,	%i2
	movre	%l2,	%l0,	%l3
	pdist	%f6,	%f20,	%f26
loop_785:
	rdhpr	%hpstate,	%g1
	call	loop_786
	call	loop_787
	subcc	%o3,	%l4,	%o6
	rd	%y,	%g5
loop_786:
	call	loop_788
loop_787:
	call	loop_789
	call	loop_790
	call	loop_791
loop_788:
	orncc	%i0,	%g2,	%g3
loop_789:
	call	loop_792
loop_790:
	orn	%g6,	0x124C,	%i6
loop_791:
	nop
	setx	0x118FEC981ABC9516,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f6
	fcmpne16	%f24,	%f12,	%o7
loop_792:
	nop
	setx	0x175A,	%l0,	%i1
	udivx	%o2,	%i1,	%o5
	call	loop_793
	fxnor	%f0,	%f24,	%f28
	fandnot1s	%f11,	%f23,	%f29
	call	loop_794
loop_793:
	fmovsa	%fcc1,	%f21,	%f10
	fmovse	%xcc,	%f9,	%f1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_794:
	fmovdne	%fcc3,	%f26,	%f14
	call	loop_795
	fpackfix	%f6,	%f1
	fbne	%fcc1,	loop_796
	edge16ln	%g4,	%i4,	%i3
loop_795:
	movcc	%xcc,	%o4,	%l5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x16] %asi,	%i5
loop_796:
	nop
	set	0x60, %o0
	stxa	%o1,	[%l7 + %o0] 0x04
	fmovspos	%icc,	%f27,	%f0
	fpack32	%f22,	%f8,	%f28
	fmovsvs	%xcc,	%f3,	%f25

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	edge8	%o0,	%i2,	%l6
	fble,a,pt	%fcc0,	loop_797
	fmovscs	%icc,	%f4,	%f0
	call	loop_798
	movul	%fcc1,	0x5CD,	%l0
loop_797:
	fone	%f28
	fbu,a,pn	%fcc1,	loop_799
loop_798:
	fmovdleu	%icc,	%f20,	%f28
	call	loop_800
	fandnot2s	%f7,	%f3,	%f5
loop_799:
	call	loop_801
	fcmped	%fcc1,	%f10,	%f16
loop_800:
	fxors	%f1,	%f17,	%f0
	rdhpr	%ver,	%l2
loop_801:
	call	loop_802
	fones	%f22
	rdpr	%gl,	%g1
	call	loop_803
loop_802:
	tsubcctv	%l3,	%l4,	%o3
	call	loop_804
	edge8l	%o6,	%i0,	%g5
loop_803:
	andn	%g3,	0x16EE,	%g2
	rd	%ccr,	%i6
loop_804:
	fmovdlg	%fcc2,	%f22,	%f18
	call	loop_805
	fxnors	%f3,	%f30,	%f0
	bg,pn	%icc,	loop_806
	fmovsue	%fcc3,	%f14,	%f20
loop_805:
	fnot1s	%f5,	%f0
	tg	%xcc,	0x5
loop_806:
	movrlz	%g6,	%o7,	%o2
	call	loop_807
	call	loop_808
	srl	%o5,	0x08,	%i1
	fmovdug	%fcc1,	%f2,	%f6
loop_807:
	nop
	setx	0x1A7D,	%l0,	%g7
	sdivcc	%i7,	%g7,	%g4
loop_808:
	fpsub32s	%f14,	%f12,	%f1
	call	loop_809
	rd	%softint,	%i3
	fbule,a	%fcc2,	loop_810
	call	loop_811
loop_809:
	call	loop_812
	membar	0x63
loop_810:
	movvc	%icc,	%o4,	%i4
loop_811:
	rdhpr	%hintp,	%i5
loop_812:
	movvc	%xcc,	0x020,	%l5
	fmovdn	%fcc3,	%f16,	%f16
	fmovsg	%fcc2,	%f25,	%f11
	fcmpeq32	%f2,	%f26,	%o1
	nop
	setx	0x05D533CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f21
	call	loop_813
	fmovdvc	%icc,	%f16,	%f2
	fmovsge	%icc,	%f1,	%f7
	tsubcctv	%l1,	0x0AF2,	%o0
loop_813:
	fcmple32	%f24,	%f20,	%l6
	movgu	%xcc,	%l0,	%i2
	call	loop_814
	fmovsug	%fcc3,	%f21,	%f25
	fmovdpos	%icc,	%f6,	%f18
	umulcc	%l2,	%l3,	%l4
loop_814:
	tsubcc	%g1,	0x030F,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_815
	movpos	%icc,	0x37B,	%g3
	swap	[%l7 + 0x54],	%g5
	nop
	setx	0xB521F7A984E30FCB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2FA36790,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f24,	%f18
loop_815:
	movvs	%icc,	%g2,	%g6
	call	loop_816
	fmovdgu	%icc,	%f26,	%f2
	fbul	%fcc3,	loop_817
	nop
	setx	0x12C77F1A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f3
loop_816:
	edge8n	%o7,	%o2,	%i6
	fxors	%f31,	%f20,	%f23
loop_817:
	rd	%tick_cmpr,	%o5
	fmovrslez	%i7,	%f21,	%f27
	fbul,a	%fcc3,	loop_818
	fmovsne	%fcc2,	%f20,	%f28
	tpos	%xcc,	0x3
	nop
	set	0x27, %i6
	ldsb	[%l7 + %i6],	%i1
loop_818:
	fba	%fcc3,	loop_819
	call	loop_820
	tvs	%xcc,	0x2
	call	loop_821
loop_819:
	addc	%g7,	%i3,	%o4
loop_820:
	fcmpes	%fcc2,	%f1,	%f25
	set	0x36, %o7
	lduha	[%l7 + %o7] 0x80,	%i4
loop_821:
	call	loop_822
	call	loop_823
	fbo	%fcc1,	loop_824
	membar	0x68
loop_822:
	taddcc	%i5,	%l5,	%o1
loop_823:
	edge16	%g4,	%l1,	%o0
loop_824:
	call	loop_825
	subcc	%l6,	0x0DA7,	%l0
	fmovsle	%icc,	%f13,	%f10
	fnors	%f30,	%f13,	%f8
loop_825:
	call	loop_826
	nop
	setx	0x4AF5DCA1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xD1D8FC27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f29,	%f24
	rd	%fprs,	%i2
	movuge	%fcc1,	0x283,	%l3
loop_826:
	call	loop_827
	call	loop_828
	call	loop_829
	call	loop_830
loop_827:
	add	%l2,	0x15E4,	%g1
loop_828:
	fones	%f0
loop_829:
	fbuge,a,pn	%fcc1,	loop_831
loop_830:
	movo	%fcc1,	0x7D2,	%o3
	rdpr	%pil,	%l4
	umulcc	%i0,	0x0825,	%o6
loop_831:
	fpackfix	%f24,	%f13
	call	loop_832
	call	loop_833
	fmovdne	%icc,	%f26,	%f0
	fandnot2s	%f11,	%f20,	%f20
loop_832:
	std	%g4,	[%l7 + 0x70]
loop_833:
	fbn,a	%fcc2,	loop_834
	call	loop_835
	fmovdlg	%fcc0,	%f0,	%f0
	fmul8x16al	%f21,	%f31,	%f28
loop_834:
	fbug	%fcc2,	loop_836
loop_835:
	fnot1	%f4,	%f2
	fandnot2s	%f30,	%f26,	%f29
	rd	%sys_tick_cmpr,	%g2
loop_836:
	movrne	%g3,	0x1C3,	%g6
	lduh	[%l7 + 0x10],	%o7
	xnor	%o2,	0x03EF,	%i6
	fsrc1s	%f30,	%f12
	call	loop_837
	movo	%fcc1,	%i7,	%o5
	fmuld8sux16	%f4,	%f28,	%f28
	fmovslg	%fcc2,	%f28,	%f15
loop_837:
	xnorcc	%g7,	%i1,	%o4
	call	loop_838
	call	loop_839
	call	loop_840
	fmovdne	%fcc1,	%f16,	%f22
loop_838:
	sth	%i3,	[%l7 + 0x4A]
loop_839:
	call	loop_841
loop_840:
	andncc	%i4,	%l5,	%i5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sra	%o1,	%g4,	%l1
loop_841:
	call	loop_842
	call	loop_843
	fblg,a	%fcc1,	loop_844
	fpadd16s	%f27,	%f30,	%f5
loop_842:
	wrpr	%o0,	0x1715,	%tick
loop_843:
	tgu	%xcc,	0x4
loop_844:
	be,a	%icc,	loop_845
	fmovsug	%fcc0,	%f30,	%f13
	membar	0x47
	fmovsa	%icc,	%f15,	%f8
loop_845:
	fmovdcs	%xcc,	%f6,	%f26
	ble,a,pt	%icc,	loop_846
	movvc	%icc,	0x474,	%l0
	wrpr	%i2,	%l3,	%cwp
	fbug	%fcc2,	loop_847
loop_846:
	call	loop_848
	fcmpgt16	%f10,	%f30,	%l6
	edge16ln	%g1,	%l2,	%o3
loop_847:
	andn	%l4,	0x1527,	%i0
loop_848:
	call	loop_849
	fnands	%f0,	%f15,	%f23
	call	loop_850
	call	loop_851
loop_849:
	fbe	%fcc2,	loop_852
	tle	%xcc,	0x4
loop_850:
	movo	%fcc3,	%o6,	%g5
loop_851:
	umulcc	%g3,	%g2,	%g6
loop_852:
	fnegd	%f24,	%f18
	call	loop_853
	orncc	%o2,	%o7,	%i7
	fcmpne16	%f26,	%f16,	%i6
	call	loop_854
loop_853:
	call	loop_855
	call	loop_856
	fmovsuge	%fcc2,	%f26,	%f31
loop_854:
	sdiv	%o5,	0x1238,	%g7
loop_855:
	movl	%xcc,	%o4,	%i3
loop_856:
	fnands	%f4,	%f12,	%f7
	fbge,a,pn	%fcc1,	loop_857
	call	loop_858
	call	loop_859
	edge16l	%i1,	%i4,	%i5
loop_857:
	call	loop_860
loop_858:
	fnot1	%f6,	%f20
loop_859:
	fmovsne	%icc,	%f27,	%f29
	fmovdpos	%icc,	%f18,	%f4
loop_860:
	rd	%fprs,	%o1
	fxnors	%f13,	%f15,	%f31
	movrlez	%g4,	0x281,	%l1
	sub	%l5,	0x19A3,	%o0
	call	loop_861
	call	loop_862
	fcmped	%fcc3,	%f10,	%f24
	movrne	%l0,	0x268,	%i2
loop_861:
	tcc	%xcc,	0x0
loop_862:
	bshuffle	%f18,	%f26,	%f24
	xorcc	%l3,	0x01EA,	%g1
	fmovd	%f30,	%f18
	movcc	%icc,	0x38C,	%l6
	fpsub16s	%f27,	%f3,	%f14
	tge	%icc,	0x3
	fnor	%f14,	%f28,	%f14
	call	loop_863
	bmask	%l2,	%l4,	%o3
	call	loop_864
	wr	%o6,	0x0FEC,	%y
loop_863:
	nop
	set	0x308, %l1
!!	ldxa	[%g0 + %l1] 0x40,	%i0
loop_864:
	call	loop_865
	bmask	%g3,	%g2,	%g6
	call	loop_866
	call	loop_867
loop_865:
	call	loop_868
	movne	%icc,	0x2DF,	%g5
loop_866:
	nop
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcb
loop_867:
	wr	%o7,	0x07AE,	%set_softint
loop_868:
	fnor	%f10,	%f28,	%f16
	fmovsue	%fcc0,	%f12,	%f12
	fcmpeq16	%f18,	%f18,	%o2
	fnor	%f6,	%f6,	%f0
	call	loop_869
	fmovrsne	%i7,	%f2,	%f2
	fmovdn	%icc,	%f0,	%f14
	fmovdu	%fcc0,	%f4,	%f8
loop_869:
	xnorcc	%o5,	%g7,	%i6
	fmovsug	%fcc3,	%f12,	%f14
	subc	%i3,	0x0F2B,	%o4
	fmovda	%icc,	%f2,	%f14
	fpmerge	%f7,	%f29,	%f26
	fmovrdgez	%i4,	%f28,	%f6
	andn	%i1,	%o1,	%g4
	fnor	%f2,	%f10,	%f18
	fsrc2s	%f29,	%f27
	call	loop_870
	nop
	fitod	%f23,	%f14
	edge32l	%l1,	%i5,	%o0
	fmovdgu	%icc,	%f26,	%f4
loop_870:
	call	loop_871
	movg	%icc,	%l5,	%l0
	fbl	%fcc2,	loop_872
	fcmpgt16	%f18,	%f2,	%i2
loop_871:
	fandnot2	%f2,	%f20,	%f6
	mulscc	%l3,	0x095B,	%g1
loop_872:
	fmovde	%fcc2,	%f2,	%f4
	fmovso	%fcc3,	%f31,	%f8
	call	loop_873
	fmovsne	%fcc2,	%f23,	%f17
	call	loop_874
	call	loop_875
loop_873:
	call	loop_876
	call	loop_877
loop_874:
	fcmpgt32	%f6,	%f22,	%l6
loop_875:
	fcmps	%fcc2,	%f21,	%f31
loop_876:
	fnand	%f10,	%f16,	%f10
loop_877:
	fba	%fcc0,	loop_878
	fbu,pt	%fcc0,	loop_879
	movneg	%icc,	%l2,	%l4
	tle	%xcc,	0x7
loop_878:
	fmovscs	%icc,	%f16,	%f6
loop_879:
	fmovdn	%fcc0,	%f24,	%f22
	fbug,a	%fcc1,	loop_880
	edge32l	%o6,	%i0,	%g3
	fmovdu	%fcc0,	%f22,	%f26
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f13
loop_880:
	fpsub32s	%f1,	%f0,	%f27
	move	%xcc,	0x26B,	%o3
	udivcc	%g6,	0x1248,	%g5
	call	loop_881
	fmovdne	%fcc0,	%f28,	%f28
	call	loop_882
	srlx	%o7,	0x01,	%g2
loop_881:
	call	loop_883
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f20
loop_882:
	call	loop_884
	be	%icc,	loop_885
loop_883:
	orn	%i7,	%o2,	%g7
	movcs	%xcc,	0x487,	%o5
loop_884:
	call	loop_886
loop_885:
	fmul8x16au	%f26,	%f14,	%f18
	call	loop_887
	call	loop_888
loop_886:
	sub	%i3,	%i6,	%i4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i1
loop_887:
	nop
	set	0x28, %i0
	stda	%o0,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_888:
	call	loop_889
	edge32n	%o4,	%l1,	%g4
	nop
	set	0x28, %i7
	sth	%o0,	[%l7 + %i7]
	rdpr	%tl,	%l5
loop_889:
	fcmple32	%f16,	%f0,	%l0
	wr 	%g0, 	0x6, 	%fprs
	call	loop_890
	fcmpne16	%f14,	%f2,	%i2
	and	%g1,	0x0659,	%l6
	movgu	%icc,	%l2,	%l4
loop_890:
	call	loop_891
	fmovrdne	%o6,	%f26,	%f24
	fmovsgu	%icc,	%f2,	%f20
	call	loop_892
loop_891:
	call	loop_893
	wr	%g3,	0x0311,	%set_softint
	nop
	setx	0xD0885EF0796B4043,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6E604F4627C0AAFA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f8,	%f20
loop_892:
	srl	%i0,	%o3,	%g5
loop_893:
	call	loop_894
	fexpand	%f14,	%f22
	fmovdge	%icc,	%f28,	%f8
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g6
loop_894:
	call	loop_895
	nop
	setx	0x34E30665,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	nop
	setx	0x8794D79622E0D6C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA1A9891D37C24874,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f4,	%f14
	fandnot1s	%f21,	%f22,	%f14
loop_895:
	nop
	setx	0x9FBABE4C8742102D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x72D953A4C98A2C72,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f22,	%f14
	subcc	%o7,	0x0E56,	%i7
	call	loop_896
	call	loop_897
	call	loop_898
	fmovsa	%icc,	%f26,	%f23
loop_896:
	fmovsue	%fcc3,	%f30,	%f30
loop_897:
	rdpr	%tba,	%g2
loop_898:
	sir	0x148E
	call	loop_899
	fcmple32	%f10,	%f26,	%o2
	call	loop_900
	fmovsvs	%xcc,	%f30,	%f25
loop_899:
	movrlez	%g7,	0x152,	%o5
	call	loop_901
loop_900:
	tle	%icc,	0x3
	call	loop_902
	xorcc	%i3,	0x1E7C,	%i4
loop_901:
	srax	%i1,	0x19,	%o1
	nop
	setx	0x35F58D0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x6A22BA3F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f5,	%f19
loop_902:
	movule	%fcc2,	0x1E8,	%i6
	call	loop_903
	bn	%xcc,	loop_904
	call	loop_905
	ldub	[%l7 + 0x58],	%l1
loop_903:
	rdpr	%cwp,	%g4
loop_904:
	fpack16	%f6,	%f9
loop_905:
	movneg	%xcc,	%o4,	%l5
	fbo	%fcc2,	loop_906
	flushw
	call	loop_907
	fcmple16	%f8,	%f18,	%l0
loop_906:
	tsubcctv	%i5,	%o0,	%i2
	movvs	%xcc,	0x79A,	%g1
loop_907:
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f26
	fxtod	%f26,	%f12
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 1
	fcmped	%fcc0,	%f26,	%f6
	nop
	setx	0x1D7A,	%l0,	%l3
	sdiv	%l2,	%l3,	%l4
	set	0x38, %g6
	lduwa	[%l7 + %g6] 0x18,	%g3
	wr	%o6,	0x03EE,	%softint
	call	loop_908
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f6
	wrpr	%i0,	%g5,	%cwp
	andncc	%g6,	%o7,	%i7
loop_908:
	call	loop_909
	edge16l	%g2,	%o2,	%g7
	call	loop_910
	movneg	%xcc,	0x67B,	%o5
loop_909:
	call	loop_911
	fpadd16	%f10,	%f14,	%f22
loop_910:
	srax	%o3,	%i4,	%i1
	edge16ln	%i3,	%o1,	%i6
loop_911:
	fmovde	%icc,	%f0,	%f24
	movcc	%icc,	%g4,	%o4
	fble	%fcc0,	loop_912
	pdist	%f0,	%f24,	%f6
	call	loop_913
	be,a,pn	%icc,	loop_914
loop_912:
	rdpr	%cleanwin,	%l1
	movrlez	%l0,	0x20B,	%i5
loop_913:
	rdpr	%tba,	%l5
loop_914:
	call	loop_915
	call	loop_916
	fmul8x16au	%f4,	%f31,	%f16
	fmovsuge	%fcc1,	%f8,	%f6
loop_915:
	stw	%i2,	[%l7 + 0x0C]
loop_916:
	subccc	%g1,	%l6,	%l2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 24
!	Type a   	: 31
!	Type x   	: 12
!	Type cti   	: 161
!	Type f   	: 150
!	Type i   	: 122
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
	set	0x4,	%g1
	set	0x8,	%g2
	set	0xC,	%g3
	set	0xB,	%g4
	set	0x2,	%g5
	set	0x0,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x0,	%i1
	set	-0x5,	%i2
	set	-0x9,	%i3
	set	-0x8,	%i4
	set	-0x1,	%i5
	set	-0xC,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x5D6B6D5F,	%l0
	set	0x3B690EAF,	%l1
	set	0x04957B64,	%l2
	set	0x0C6A0675,	%l3
	set	0x6819ADAE,	%l4
	set	0x49840FE7,	%l5
	set	0x2CC6F74C,	%l6
	!# Output registers
	set	0x0C82,	%o0
	set	-0x0F50,	%o1
	set	0x0094,	%o2
	set	0x1E78,	%o3
	set	-0x1905,	%o4
	set	-0x1B90,	%o5
	set	0x13D2,	%o6
	set	-0x068A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	fpadd16s	%f2,	%f13,	%f3
	wrpr	%l3,	%o0,	%tick
	call	loop_917
	fabsd	%f6,	%f14
	call	loop_918
	fbge,a,pt	%fcc1,	loop_919
loop_917:
	call	loop_920
	movrgz	%g3,	0x04A,	%o6
loop_918:
	fblg,a,pt	%fcc3,	loop_921
loop_919:
	rd	%asi,	%i0
loop_920:
	fmovdlg	%fcc0,	%f16,	%f24
	bpos,a	%xcc,	loop_922
loop_921:
	call	loop_923
	srl	%l4,	%g6,	%g5
	tvs	%xcc,	0x7
loop_922:
	ble	%xcc,	loop_924
loop_923:
	fmovrsgz	%i7,	%f7,	%f30
	fmovslg	%fcc2,	%f8,	%f10
	nop
	fitod	%f27,	%f10
loop_924:
	smulcc	%g2,	%o2,	%g7
	fbug,a	%fcc0,	loop_925
	call	loop_926
	call	loop_927
	fpadd32s	%f25,	%f10,	%f14
loop_925:
	bn,a,pn	%xcc,	loop_928
loop_926:
	subc	%o5,	%o7,	%o3
loop_927:
	umul	%i4,	0x1333,	%i3
	rdhpr	%htba,	%i1
loop_928:
	movrlez	%o1,	%i6,	%o4
	mulscc	%l1,	%g4,	%i5
	call	loop_929
	alignaddr	%l0,	%l5,	%g1
	fbg,a	%fcc3,	loop_930
	fmovsg	%fcc1,	%f29,	%f24
loop_929:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%i2,	[%l7 + 0x58] %asi
	membar	#Sync
loop_930:
	tgu	%icc,	0x5
	fabss	%f5,	%f6
	fsrc1	%f18,	%f0
	call	loop_931
	tvs	%xcc,	0x2
	fbule,a	%fcc1,	loop_932
	nop
	fitos	%f12,	%f11
loop_931:
	call	loop_933
	call	loop_934
loop_932:
	fmovrslez	%l2,	%f6,	%f10
	call	loop_935
loop_933:
	call	loop_936
loop_934:
	call	loop_937
	fmul8x16al	%f4,	%f1,	%f8
loop_935:
	call	loop_938
loop_936:
	fnands	%f29,	%f4,	%f15
loop_937:
	fabsd	%f8,	%f10
	call	loop_939
loop_938:
	brlz,a	%l3,	loop_940
	call	loop_941
	tge	%icc,	0x4
loop_939:
	movneg	%xcc,	0x57A,	%o0
loop_940:
	fmovsgu	%icc,	%f24,	%f12
loop_941:
	call	loop_942
	edge32n	%g3,	%l6,	%i0
	fand	%f16,	%f14,	%f28
	fnor	%f8,	%f22,	%f22
loop_942:
	fandnot2	%f26,	%f0,	%f4
	rdpr	%wstate,	%l4
	fmovrsgez	%o6,	%f10,	%f19
	call	loop_943
	addcc	%g6,	%i7,	%g2
	xnorcc	%g5,	0x0811,	%g7
	nop
	set	0x46, %i1
	lduh	[%l7 + %i1],	%o2
loop_943:
	fabsd	%f22,	%f4
	fands	%f26,	%f9,	%f7
	wr	%g0,	0x4f,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
	nop
	setx	0x480DFB4140856C08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f16
	fmovdvs	%xcc,	%f30,	%f14
	call	loop_944
	fcmpne32	%f30,	%f26,	%o7
	call	loop_945
	wrpr	%i4,	%o3,	%tick
loop_944:
	call	loop_946
	call	loop_947
loop_945:
	brlez,a,pn	%i3,	loop_948
	fnand	%f2,	%f26,	%f10
loop_946:
	tgu	%icc,	0x4
loop_947:
	tg	%icc,	0x4
loop_948:
	fandnot2s	%f9,	%f27,	%f23
	fpsub32	%f14,	%f18,	%f26
	nop
	fitos	%f6,	%f26
	edge16	%o1,	%i6,	%o4
	nop
	setx	0x27E72602DB513411,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA6B0D81E64C6BB3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f26,	%f18
	call	loop_949
	mulx	%l1,	0x14CD,	%i1
	fornot1	%f6,	%f0,	%f8
	movre	%i5,	%l0,	%g4
loop_949:
	xor	%g1,	0x0E0C,	%l5
	ta	%icc,	0x7
	brgz,a,pn	%i2,	loop_950
	rd	%pc,	%l2
	fabsd	%f14,	%f16
	call	loop_951
loop_950:
	edge32l	%l3,	%o0,	%l6
	fexpand	%f13,	%f4
	fmul8x16	%f8,	%f4,	%f26
loop_951:
	call	loop_952
	movneg	%icc,	0x441,	%i0
	flushw
	subc	%g3,	%l4,	%o6
loop_952:
	array16	%g6,	%i7,	%g2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x72] %asi,	%g7
	call	loop_953
	subcc	%o2,	0x0763,	%o5
	add	%g5,	0x0D64,	%i4
	fmovso	%fcc3,	%f7,	%f26
loop_953:
	fblg,pn	%fcc2,	loop_954
	pdist	%f20,	%f18,	%f26
	rdhpr	%htba,	%o3
	fabsd	%f30,	%f28
loop_954:
	fbug,pn	%fcc3,	loop_955
	call	loop_956
	fmovda	%icc,	%f24,	%f2
	fmovsg	%xcc,	%f16,	%f27
loop_955:
	srl	%i3,	%o7,	%o1
loop_956:
	call	loop_957
	xnorcc	%i6,	%o4,	%i1
	call	loop_958
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f0
loop_957:
	wrpr	%i5,	0x15A8,	%pil
	fmovscc	%xcc,	%f15,	%f18
loop_958:
	fabsd	%f22,	%f20
	call	loop_959
	call	loop_960
	call	loop_961
	tg	%xcc,	0x2
loop_959:
	fandnot2	%f0,	%f20,	%f20
loop_960:
	movpos	%icc,	0x2A8,	%l1
loop_961:
	xor	%g4,	0x1E67,	%l0
	nop
	setx	0xDD5CA173E28609CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0E330CB58AF767FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f14,	%f18
	rd	%asi,	%g1
	tge	%xcc,	0x7
	rd	%sys_tick_cmpr,	%l5
	set	0x6C, %i2
	lda	[%l7 + %i2] 0x04,	%f14
	call	loop_962
	rd	%softint,	%l2
	stbar
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_962:
	fmovs	%f24,	%f19
	fcmple32	%f2,	%f2,	%l3
	call	loop_963
	be,a,pn	%xcc,	loop_964
	fornot1	%f12,	%f0,	%f6
	tne	%xcc,	0x3
loop_963:
	call	loop_965
loop_964:
	tl	%xcc,	0x6
	fmovso	%fcc0,	%f6,	%f19
	fsrc2s	%f3,	%f26
loop_965:
	call	loop_966
	fpsub32	%f4,	%f2,	%f22
	fcmpeq16	%f26,	%f26,	%o0
	fmovda	%icc,	%f30,	%f8
loop_966:
	call	loop_967
	fcmple32	%f2,	%f22,	%i2
	movue	%fcc2,	0x09D,	%l6
	udivx	%i0,	0x0FEC,	%g3
loop_967:
	fmovdne	%xcc,	%f30,	%f18
	call	loop_968
	tcs	%icc,	0x6
	call	loop_969
	call	loop_970
loop_968:
	fmovdvc	%xcc,	%f8,	%f16
	fsrc2	%f16,	%f10
loop_969:
	fcmple32	%f2,	%f12,	%l4
loop_970:
	nop
	setx	0x86876534,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC5040C0A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f17,	%f12
	call	loop_971
	wr	%g6,	0x108B,	%set_softint
	call	loop_972
	pdist	%f16,	%f18,	%f0
loop_971:
	call	loop_973
	fabsd	%f18,	%f22
loop_972:
	fmovsneg	%icc,	%f5,	%f8
	movgu	%icc,	%i7,	%g2
loop_973:
	fmovd	%f24,	%f4
	fxor	%f10,	%f24,	%f16
	movrlez	%o6,	%o2,	%g7
	call	loop_974
	call	loop_975
	call	loop_976
	nop
	setx	0x221025FC8B49723C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE54C8797732016FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f8,	%f10
loop_974:
	call	loop_977
loop_975:
	edge8	%g5,	%o5,	%i4
loop_976:
	edge16n	%i3,	%o3,	%o1
	fmovdcc	%xcc,	%f14,	%f14
loop_977:
	call	loop_978
	fmuld8ulx16	%f19,	%f26,	%f16
	movneg	%icc,	%i6,	%o4
	call	loop_979
loop_978:
	ble,a,pt	%icc,	loop_980
	call	loop_981
	fmovscs	%xcc,	%f25,	%f17
loop_979:
	xor	%i1,	%o7,	%i5
loop_980:
	call	loop_982
loop_981:
	movcs	%icc,	0x6E0,	%l1
	call	loop_983
	rd	%ccr,	%l0
loop_982:
	call	loop_984
	subc	%g1,	%g4,	%l2
loop_983:
	fmovdue	%fcc0,	%f18,	%f26
	rdpr	%gl,	%l3
loop_984:
	bneg	%icc,	loop_985
	call	loop_986
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_987
loop_985:
	fcmped	%fcc1,	%f26,	%f0
loop_986:
	rd	%y,	%l5
	or	%o0,	0x1B31,	%l6
loop_987:
	call	loop_988
	wr 	%g0, 	0x7, 	%fprs
	movue	%fcc3,	%l4,	%g6
	smulcc	%g3,	%g2,	%i7
loop_988:
	nop
	setx	0x9EC4025E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x2DF30CC5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f11,	%f6
	movcc	%icc,	%o6,	%g7
	fsrc2s	%f19,	%f6
	tpos	%icc,	0x3
	fmovdl	%icc,	%f20,	%f16
	rd	%sys_tick_cmpr,	%o2
	srlx	%o5,	%g5,	%i4
	tg	%xcc,	0x6
	call	loop_989
	fmovdlg	%fcc3,	%f14,	%f26
	be,a	%icc,	loop_990
	edge16ln	%i3,	%o3,	%o1
loop_989:
	rdhpr	%ver,	%i6
	fcmpgt16	%f0,	%f6,	%i1
loop_990:
	fmovdcs	%xcc,	%f6,	%f4
	fsrc2s	%f20,	%f12
	bcs,pt	%xcc,	loop_991
	call	loop_992
	call	loop_993
	fxor	%f18,	%f6,	%f14
loop_991:
	fabsd	%f6,	%f28
loop_992:
	fmovsge	%xcc,	%f10,	%f14
loop_993:
	fpsub16	%f0,	%f18,	%f30
	mova	%fcc0,	%o4,	%o7
	movgu	%xcc,	0x500,	%i5
	fmul8x16	%f11,	%f18,	%f24
	udivcc	%l0,	0x1A00,	%l1
	nop
	fitos	%f2,	%f28
	fstod	%f28,	%f8
	call	loop_994
	call	loop_995
	fmovsug	%fcc1,	%f19,	%f18
	call	loop_996
loop_994:
	movul	%fcc0,	%g4,	%l2
loop_995:
	fmovsvc	%icc,	%f0,	%f15
	bvc,a	%xcc,	loop_997
loop_996:
	fmovsleu	%icc,	%f7,	%f18
	call	loop_998
	fmovsu	%fcc3,	%f5,	%f21
loop_997:
	movvs	%icc,	0x009,	%g1
	movvs	%icc,	0x723,	%l3
loop_998:
	call	loop_999
	movne	%fcc0,	%l5,	%l6
	fmul8x16	%f12,	%f0,	%f12
	fpack16	%f16,	%f11
loop_999:
	bg,pt	%xcc,	loop_1000
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	srax	%o0,	%i2,	%l4
	call	loop_1001
loop_1000:
	fmovdge	%fcc3,	%f22,	%f10
	call	loop_1002
	call	loop_1003
loop_1001:
	fcmpne32	%f16,	%f30,	%i0
	call	loop_1004
loop_1002:
	call	loop_1005
loop_1003:
	fnot2	%f18,	%f20
	fnot1	%f6,	%f30
loop_1004:
	fmovdcc	%icc,	%f0,	%f22
loop_1005:
	xnor	%g3,	0x182D,	%g2
	fmovdpos	%xcc,	%f8,	%f18
	movn	%fcc2,	%i7,	%o6
	fmul8x16au	%f6,	%f29,	%f22
	call	loop_1006
	movg	%fcc1,	0x1D7,	%g7
	wr	%g6,	%o2,	%set_softint
	call	loop_1007
loop_1006:
	fandnot2s	%f14,	%f6,	%f26
	call	loop_1008
	wr	%g5,	%o5,	%clear_softint
loop_1007:
	nop
	set	0x0B, %l3
	ldsb	[%l7 + %l3],	%i3
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x18] %asi,	%o3
loop_1008:
	call	loop_1009
	udiv	%o1,	0x003C,	%i4
	xnor	%i6,	0x0291,	%o4
	fcmpne16	%f24,	%f14,	%o7
loop_1009:
	sllx	%i5,	0x0C,	%l0
	call	loop_1010
	call	loop_1011
	srl	%i1,	0x1F,	%g4
	sdiv	%l1,	0x18F3,	%l2
loop_1010:
	edge16ln	%g1,	%l3,	%l5
loop_1011:
	te	%xcc,	0x7
	call	loop_1012
	srlx	%l6,	0x14,	%o0
	fmovsvs	%icc,	%f18,	%f9
	fmovrdlz	%l4,	%f18,	%f22
loop_1012:
	or	%i0,	%g3,	%g2
	rd	%softint,	%i2
	tg	%xcc,	0x1
	fornot1	%f16,	%f6,	%f22
	call	loop_1013
	smulcc	%i7,	%o6,	%g6
	wr	%o2,	%g7,	%clear_softint
	fzero	%f6
loop_1013:
	call	loop_1014
	ta	%icc,	0x1
	call	loop_1015
	edge16n	%o5,	%i3,	%g5
loop_1014:
	movrlz	%o3,	0x286,	%o1
	edge8n	%i4,	%o4,	%o7
loop_1015:
	flushw
	fsrc2s	%f13,	%f13
	wrpr	%i6,	%l0,	%pil
	call	loop_1016
	call	loop_1017
	fbo	%fcc0,	loop_1018
	nop
	set	0x79, %g2
	stb	%i5,	[%l7 + %g2]
loop_1016:
	andn	%g4,	%i1,	%l2
loop_1017:
	rdpr	%tba,	%l1
loop_1018:
	fmovrsgz	%g1,	%f29,	%f31
	wrpr	%l5,	%l6,	%cwp
	call	loop_1019
	call	loop_1020
	call	loop_1021
	subcc	%o0,	%l4,	%i0
loop_1019:
	udiv	%l3,	0x0D6F,	%g3
loop_1020:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBAA, 	%hsys_tick_cmpr
loop_1021:
	movvc	%xcc,	0x140,	%i7
	brnz,a	%o6,	loop_1022
	movrne	%i2,	%o2,	%g6
	nop
	setx	0xA64FFC4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xAA9143C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f18,	%f28
	movneg	%icc,	%o5,	%i3
loop_1022:
	nop
	setx	0xF8A573CDC2C3A059,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	call	loop_1023
	fnands	%f30,	%f14,	%f26
	fandnot1s	%f25,	%f11,	%f7
	alignaddrl	%g7,	%g5,	%o1
loop_1023:
	call	loop_1024
	fmovdne	%fcc2,	%f26,	%f26
	nop
	fitos	%f12,	%f25
	fstox	%f25,	%f30
	fxtos	%f30,	%f31
	nop
	setx	0x4E7DF2B226B9AED7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f26
loop_1024:
	fzero	%f26
	taddcc	%i4,	0x0B66,	%o4
	movcc	%icc,	0x3DA,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	movrgz	%l0,	%i5,	%i6
	subcc	%g4,	%i1,	%l1
	call	loop_1025
	movrgez	%g1,	0x384,	%l2
	wr	%l6,	%o0,	%sys_tick
	wrpr 	%g0, 	0x2, 	%gl
loop_1025:
	fpsub32	%f0,	%f2,	%f14
	sll	%l5,	%i0,	%l3
	movrgez	%g3,	%i7,	%o6
	brnz,a,pt	%i2,	loop_1026
	rdhpr	%ver,	%o2
	fmovso	%fcc1,	%f10,	%f16
	bcc,a,pt	%icc,	loop_1027
loop_1026:
	rdhpr	%hpstate,	%g2
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%g6
	fcmpne16	%f20,	%f18,	%o5
loop_1027:
	call	loop_1028
	fpmerge	%f7,	%f18,	%f4
	call	loop_1029
	addcc	%i3,	%g5,	%g7
loop_1028:
	call	loop_1030
	fnegd	%f2,	%f12
loop_1029:
	wrpr 	%g0, 	0x3, 	%gl
	fmovdpos	%icc,	%f24,	%f4
loop_1030:
	call	loop_1031
	bl,pt	%xcc,	loop_1032
	call	loop_1033
	udiv	%o3,	0x15DA,	%o7
loop_1031:
	taddcctv	%l0,	%o4,	%i6
loop_1032:
	array8	%g4,	%i5,	%i1
loop_1033:
	fbe	%fcc0,	loop_1034
	st	%f15,	[%l7 + 0x70]
	call	loop_1035
	fmovsue	%fcc0,	%f2,	%f17
loop_1034:
	bvc,a,pt	%icc,	loop_1036
	call	loop_1037
loop_1035:
	fabss	%f26,	%f29
	mulx	%l1,	%g1,	%l6
loop_1036:
	movug	%fcc1,	%o0,	%l2
loop_1037:
	nop
	fitos	%f9,	%f10
	call	loop_1038
	fands	%f17,	%f14,	%f1
	call	loop_1039
	call	loop_1040
loop_1038:
	call	loop_1041
	udivx	%l5,	0x11F6,	%i0
loop_1039:
	flushw
loop_1040:
	wrpr	%l4,	%l3,	%tick
loop_1041:
	sllx	%g3,	%i7,	%i2
	movle	%icc,	%o6,	%o2
	call	loop_1042
	call	loop_1043
	call	loop_1044
	movleu	%xcc,	0x69A,	%g6
loop_1042:
	tsubcctv	%g2,	%o5,	%g5
loop_1043:
	array8	%i3,	%g7,	%o1
loop_1044:
	fnands	%f28,	%f13,	%f17
	fxnors	%f10,	%f28,	%f30
	call	loop_1045
	nop
	fitos	%f21,	%f23
	alignaddr	%o3,	%o7,	%l0
	set	0x110, %o6
	ldxa	[%g0 + %o6] 0x21,	%o4
loop_1045:
	call	loop_1046
	edge32ln	%i4,	%g4,	%i6
	call	loop_1047
	call	loop_1048
loop_1046:
	fmovdge	%fcc1,	%f16,	%f8
	movrgz	%i1,	%i5,	%g1
loop_1047:
	tpos	%xcc,	0x5
loop_1048:
	call	loop_1049
	call	loop_1050
	call	loop_1051
	edge32	%l6,	%o0,	%l2
loop_1049:
	taddcc	%l5,	%l1,	%i0
loop_1050:
	nop
	setx	0xF14BDD995EFABD54,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x09F5CB5F89D03751,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f2,	%f8
loop_1051:
	nop
	setx	0x14EE,	%l0,	%l4
	udivcc	%l3,	%l4,	%i7
	rdhpr	%hpstate,	%i2
	call	loop_1052
	fnand	%f0,	%f0,	%f8
	call	loop_1053
	ta	%xcc,	0x6
loop_1052:
	flushw
	call	loop_1054
loop_1053:
	fabss	%f30,	%f30
	fbue,pn	%fcc0,	loop_1055
	for	%f8,	%f4,	%f6
loop_1054:
	fornot2	%f6,	%f10,	%f4
	fnegd	%f20,	%f18
loop_1055:
	faligndata	%f0,	%f26,	%f22
	call	loop_1056
	fnors	%f7,	%f18,	%f7
	fpsub16s	%f21,	%f4,	%f0
	fmovrsgez	%g3,	%f27,	%f31
loop_1056:
	fmovsa	%xcc,	%f20,	%f2
	call	loop_1057
	wrpr	%o6,	0x04EA,	%pil
	movrlz	%g6,	0x26E,	%o2
	nop
	fitod	%f2,	%f20
	fdtoi	%f20,	%f10
loop_1057:
	call	loop_1058
	fmovrse	%o5,	%f3,	%f6
	fpsub32s	%f18,	%f17,	%f15
	call	loop_1059
loop_1058:
	fpsub16s	%f26,	%f1,	%f28
	fsrc2	%f24,	%f16
	andcc	%g2,	0x0E5F,	%i3
loop_1059:
	fnors	%f28,	%f29,	%f26
	movneg	%icc,	%g7,	%o1
	fmovsneg	%xcc,	%f0,	%f17
	call	loop_1060
	addc	%g5,	%o7,	%l0
	call	loop_1061
	call	loop_1062
loop_1060:
	call	loop_1063
	tle	%icc,	0x5
loop_1061:
	nop
	fitod	%f18,	%f22
loop_1062:
	movug	%fcc1,	%o3,	%i4
loop_1063:
	movpos	%xcc,	0x56B,	%g4
	nop
	setx	0x526A1001,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x8FB89993,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f15,	%f26
	edge8	%o4,	%i1,	%i5
	tcc	%xcc,	0x0
	nop
	setx	0x89043C4E0E2D7953,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x58B3E56BF9A9D4AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f28,	%f18
	nop
	setx	0x7D2E1B0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x7E29B3C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f11,	%f21
	fmul8ulx16	%f16,	%f8,	%f2
	set	0x3C, %l4
	ldsha	[%l7 + %l4] 0x19,	%i6
	movn	%icc,	0x0AA,	%g1
	fmovrslz	%l6,	%f12,	%f22
	call	loop_1064
	call	loop_1065
	call	loop_1066
	popc	0x1DB6,	%l2
loop_1064:
	fmovrsgez	%o0,	%f21,	%f4
loop_1065:
	subcc	%l5,	%l1,	%i0
loop_1066:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD91, 	%hsys_tick_cmpr
	movlg	%fcc3,	0x74F,	%i7
	call	loop_1067
	for	%f18,	%f0,	%f2
	call	loop_1068
	fmuld8ulx16	%f3,	%f30,	%f0
loop_1067:
	nop
	setx	0x7BC5A68C,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	call	loop_1069
loop_1068:
	call	loop_1070
	call	loop_1071
loop_1069:
	nop

loop_1070:
	nop

loop_1071:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 15
!	Type a   	: 36
!	Type x   	: 7
!	Type cti   	: 155
!	Type f   	: 151
!	Type i   	: 136
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
	set	0xB,	%g1
	set	0x2,	%g2
	set	0x5,	%g3
	set	0x4,	%g4
	set	0xB,	%g5
	set	0xD,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x9,	%i1
	set	-0x5,	%i2
	set	-0x5,	%i3
	set	-0x0,	%i4
	set	-0xC,	%i5
	set	-0x4,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x066F85D9,	%l0
	set	0x7C96FC42,	%l1
	set	0x5A280E9D,	%l2
	set	0x5E31CEF0,	%l3
	set	0x2B1EED25,	%l4
	set	0x57B3DD03,	%l5
	set	0x6C948DDF,	%l6
	!# Output registers
	set	0x05F6,	%o0
	set	0x161E,	%o1
	set	-0x08FD,	%o2
	set	-0x149C,	%o3
	set	0x065B,	%o4
	set	-0x0BBD,	%o5
	set	-0x11C0,	%o6
	set	0x0DE6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6A831C8D0B95B5F6)
	INIT_TH_FP_REG(%l7,%f2,0x70910443C9F4DF2F)
	INIT_TH_FP_REG(%l7,%f4,0x8113A9A37E15C6EB)
	INIT_TH_FP_REG(%l7,%f6,0x3AE14135A525687F)
	INIT_TH_FP_REG(%l7,%f8,0xA0CCF9A4757AC78C)
	INIT_TH_FP_REG(%l7,%f10,0xB49978F97682E9B8)
	INIT_TH_FP_REG(%l7,%f12,0xA6B7652AA40F4D72)
	INIT_TH_FP_REG(%l7,%f14,0xE8BAA1B73CD287F5)
	INIT_TH_FP_REG(%l7,%f16,0x60AB4DF8808038BC)
	INIT_TH_FP_REG(%l7,%f18,0xA79ED0006FC85061)
	INIT_TH_FP_REG(%l7,%f20,0x0DD9F14A0D4D391C)
	INIT_TH_FP_REG(%l7,%f22,0xF9B9BE0B9404447C)
	INIT_TH_FP_REG(%l7,%f24,0x546967A583D9FAA8)
	INIT_TH_FP_REG(%l7,%f26,0x6E559C36D5E8CCE6)
	INIT_TH_FP_REG(%l7,%f28,0x7F19EEF740FCA4AB)
	INIT_TH_FP_REG(%l7,%f30,0x4E1F3A2638770A99)

	!# Execute Main Diag ..

	fone	%f6
	bleu,a,pt	%xcc,	loop_1072
	call	loop_1073
	call	loop_1074
	call	loop_1075
loop_1072:
	bvs	%xcc,	loop_1076
loop_1073:
	umul	%l3,	%g3,	%i2
loop_1074:
	call	loop_1077
loop_1075:
	call	loop_1078
loop_1076:
	bvc	%xcc,	loop_1079
	call	loop_1080
loop_1077:
	movge	%xcc,	0x5FC,	%g6
loop_1078:
	fmovrsgez	%o6,	%f30,	%f18
loop_1079:
	movlg	%fcc0,	0x270,	%o5
loop_1080:
	edge16n	%g2,	%o2,	%g7
	wrpr	%o1,	%i3,	%pil
	brgz,pt	%o7,	loop_1081
	call	loop_1082
	call	loop_1083
	bvc,a,pt	%icc,	loop_1084
loop_1081:
	ta	%icc,	0x7
loop_1082:
	call	loop_1085
loop_1083:
	call	loop_1086
loop_1084:
	fmovrsne	%l0,	%f26,	%f9
	array32	%g5,	%i4,	%o3
loop_1085:
	bg,a	%xcc,	loop_1087
loop_1086:
	fpsub16	%f24,	%f28,	%f18
	te	%xcc,	0x4
	bshuffle	%f4,	%f14,	%f18
loop_1087:
	fmovscc	%xcc,	%f3,	%f8
	call	loop_1088
	fmovsu	%fcc3,	%f14,	%f11
	fmovdcs	%xcc,	%f16,	%f12
	call	loop_1089
loop_1088:
	call	loop_1090
	fmovslg	%fcc3,	%f17,	%f8
	call	loop_1091
loop_1089:
	fba	%fcc3,	loop_1092
loop_1090:
	fandnot1s	%f9,	%f7,	%f4
	movrlz	%g4,	%o4,	%i5
loop_1091:
	wrpr	%i6,	%g1,	%tick
loop_1092:
	fmovdue	%fcc1,	%f26,	%f28
	nop
	setx	0x292EA40F29602BAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2E3F5A32,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f28,	%f12
	fmovdle	%xcc,	%f20,	%f12
	wr	%i1,	%l6,	%pic
	fmovdcs	%icc,	%f28,	%f10
	movne	%xcc,	0x348,	%l2
	fmovscs	%icc,	%f27,	%f25
	sdiv	%l5,	0x1F46,	%l1
	set	0x60, %g3
	stwa	%i0,	[%l7 + %g3] 0x19
	fmovsug	%fcc0,	%f23,	%f5
	fnot2s	%f14,	%f16
	fpsub16s	%f9,	%f28,	%f7
	call	loop_1093
	fmovs	%f0,	%f26
	fpadd16	%f26,	%f24,	%f14
	fmul8x16al	%f24,	%f29,	%f18
loop_1093:
	smul	%o0,	%i7,	%l3
	bpos	%xcc,	loop_1094
	fcmpne16	%f12,	%f30,	%l4
	call	loop_1095
	stw	%g3,	[%l7 + 0x10]
loop_1094:
	rdhpr	%hsys_tick_cmpr,	%g6
	or	%i2,	%o5,	%o6
loop_1095:
	fxors	%f21,	%f14,	%f0
	call	loop_1096
	call	loop_1097
	ld	[%l7 + 0x68],	%f20
	edge8n	%g2,	%o2,	%o1
loop_1096:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1097:
	nop
	setx	0x5B0501DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xECF86B08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f8,	%f6
	fmul8x16al	%f7,	%f14,	%f0
	fornot2	%f20,	%f8,	%f6
	movcs	%icc,	0x22F,	%g7
	call	loop_1098
	call	loop_1099
	nop
	setx	0xF08F6DA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD5F2BD77,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f18,	%f19
	popc	%o7,	%l0
loop_1098:
	taddcc	%g5,	%i4,	%i3
loop_1099:
	movcs	%icc,	0x727,	%o3
	fmovduge	%fcc1,	%f12,	%f24
	smul	%g4,	%o4,	%i5
	call	loop_1100
	nop
	fitos	%f2,	%f1
	fstod	%f1,	%f30
	fmovrdgz	%i6,	%f8,	%f26
	fands	%f2,	%f29,	%f20
loop_1100:
	fcmpne16	%f30,	%f28,	%g1
	movcc	%xcc,	%l6,	%l2
	array8	%l5,	%l1,	%i1
	movn	%icc,	0x76D,	%o0
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%i7
	movgu	%xcc,	%l3,	%i0
	fmovdlg	%fcc0,	%f10,	%f30
	fnot2	%f2,	%f24
	movue	%fcc3,	0x584,	%g3
	fxors	%f28,	%f30,	%f27
	wrpr 	%g0, 	0x2, 	%gl
	nop
	setx	0x40C80778,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fornot1	%f16,	%f12,	%f26
	fnot1s	%f13,	%f16
	brnz	%i2,	loop_1101
	call	loop_1102
	fone	%f28
	movo	%fcc3,	0x26F,	%l4
loop_1101:
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f0
loop_1102:
	sub	%o6,	0x1808,	%g2
	nop
	setx	0xBE344247,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x19E28DB4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f6,	%f20
	call	loop_1103
	xorcc	%o5,	0x1491,	%o1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	set	0x68, %l0
	stb	%o2,	[%l7 + %l0]
loop_1103:
	edge32l	%o7,	%l0,	%g5
	call	loop_1104
	fabsd	%f18,	%f14
	movu	%fcc2,	%g7,	%i3
	fpsub16	%f30,	%f14,	%f18
loop_1104:
	call	loop_1105
	nop
	set	0x08, %o4
	stw	%i4,	[%l7 + %o4]
	fmovsul	%fcc3,	%f11,	%f31
	call	loop_1106
loop_1105:
	call	loop_1107
	fnot2s	%f25,	%f17
	fmovdcs	%xcc,	%f4,	%f20
loop_1106:
	edge32	%o3,	%o4,	%g4
loop_1107:
	tge	%icc,	0x7
	movrgez	%i5,	0x3B9,	%g1
	sir	0x0DDC
	fpadd32	%f8,	%f4,	%f12
	call	loop_1108
	call	loop_1109
	call	loop_1110
	tvc	%icc,	0x0
loop_1108:
	fmovrsgez	%i6,	%f20,	%f8
loop_1109:
	sllx	%l2,	0x0B,	%l6
loop_1110:
	udivcc	%l5,	0x0028,	%i1
	edge8ln	%o0,	%l1,	%l3
	call	loop_1111
	nop
	set	0x34, %g7
	ldsh	[%l7 + %g7],	%i0
	tne	%xcc,	0x0
	call	loop_1112
loop_1111:
	call	loop_1113
	fmovdul	%fcc0,	%f20,	%f28
	faligndata	%f8,	%f30,	%f2
loop_1112:
	alignaddr	%g3,	%i7,	%g6
loop_1113:
	fmuld8sux16	%f0,	%f2,	%f4
	fpsub32s	%f28,	%f12,	%f22
	nop
	setx	0x38E857BBE604452F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF602A77D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f18,	%f4
	call	loop_1114
	movrlz	%i2,	0x1CD,	%l4
	bmask	%g2,	%o5,	%o1
	call	loop_1115
loop_1114:
	call	loop_1116
	sdiv	%o6,	0x1E7C,	%o7
	edge8	%l0,	%o2,	%g5
loop_1115:
	call	loop_1117
loop_1116:
	edge32ln	%g7,	%i4,	%o3
	rdhpr	%ver,	%o4
	fand	%f24,	%f12,	%f0
loop_1117:
	nop
	set	0x78, %o2
	std	%f4,	[%l7 + %o2]
	call	loop_1118
	fcmpeq32	%f4,	%f18,	%i3
	nop
	setx	0x9AE4D937,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xD9DAAC4C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f1,	%f0
	call	loop_1119
loop_1118:
	edge8l	%i5,	%g1,	%i6
	ldsw	[%l7 + 0x54],	%l2
	fxor	%f30,	%f10,	%f8
loop_1119:
	nop
	fitos	%f26,	%f28
	fpack32	%f30,	%f28,	%f6
	wr 	%g0, 	0x5, 	%fprs
	fexpand	%f4,	%f30
	edge32	%l5,	%g4,	%i1
	tsubcc	%l1,	%o0,	%i0
	call	loop_1120
	fnegs	%f20,	%f18
	nop
	setx	0xBC5579D55FF4E22C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xCEF2C9AC07F22F47,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f0
	call	loop_1121
loop_1120:
	call	loop_1122
	movl	%icc,	0x1D8,	%g3
	set	0x44, %g5
	ldsha	[%l7 + %g5] 0x18,	%l3
loop_1121:
	tleu	%icc,	0x6
loop_1122:
	fpsub32	%f0,	%f6,	%f6
	call	loop_1123
	movrgez	%g6,	%i2,	%i7
	nop
	setx	0x5FBEC4057914F169,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCCC590E4854306FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f16,	%f6
	call	loop_1124
loop_1123:
	move	%fcc2,	0x1F8,	%l4
	fbge,pn	%fcc3,	loop_1125
	nop
	fitod	%f10,	%f24
	fdtos	%f24,	%f10
loop_1124:
	mulx	%g2,	%o1,	%o5
	nop
	setx	0x0E7B,	%l0,	%o7
	sdivx	%o6,	%o7,	%o2
loop_1125:
	fmuld8sux16	%f4,	%f4,	%f16
	fmovso	%fcc3,	%f12,	%f3
	wrpr	%l0,	%g7,	%pil
	call	loop_1126
	udiv	%i4,	0x0268,	%g5
	brgez,a,pn	%o3,	loop_1127
	movre	%i3,	%i5,	%g1
loop_1126:
	bvs,a	%xcc,	loop_1128
	tpos	%xcc,	0x2
loop_1127:
	bne,a	%icc,	loop_1129
	fmovdul	%fcc1,	%f0,	%f18
loop_1128:
	call	loop_1130
	nop
	fitos	%f8,	%f27
loop_1129:
	andn	%o4,	%l2,	%l6
	fble	%fcc3,	loop_1131
loop_1130:
	call	loop_1132
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	faligndata	%f18,	%f26,	%f22
loop_1131:
	call	loop_1133
loop_1132:
	call	loop_1134
	fpadd32s	%f17,	%f9,	%f29
	fcmps	%fcc0,	%f1,	%f29
loop_1133:
	call	loop_1135
loop_1134:
	fbue,pn	%fcc0,	loop_1136
	call	loop_1137
	fxors	%f18,	%f5,	%f15
loop_1135:
	rd	%softint,	%l5
loop_1136:
	call	loop_1138
loop_1137:
	movrlez	%i6,	%g4,	%l1
	orncc	%o0,	0x0048,	%i1
	call	loop_1139
loop_1138:
	tsubcc	%g3,	%i0,	%l3
	call	loop_1140
	call	loop_1141
loop_1139:
	nop
	fitod	%f27,	%f30
	call	loop_1142
loop_1140:
	call	loop_1143
loop_1141:
	fmovdule	%fcc1,	%f8,	%f14
	fnegs	%f10,	%f27
loop_1142:
	edge32ln	%i2,	%i7,	%l4
loop_1143:
	for	%f24,	%f14,	%f12
	movrlez	%g2,	%g6,	%o5
	fmovsvs	%icc,	%f30,	%f14
	fmovdneg	%xcc,	%f20,	%f6
	nop
	setx	0xCF4B6C6003D8F921,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xBE744F21C75FD270,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f12,	%f8
	movuge	%fcc2,	%o1,	%o6
	fxor	%f4,	%f0,	%f8
	fmovsne	%fcc1,	%f5,	%f1
	fsrc1s	%f8,	%f26
	movo	%fcc3,	%o2,	%l0
	fmovdneg	%icc,	%f18,	%f18
	call	loop_1144
	bl	%xcc,	loop_1145
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0xDC145ED15B64E759,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x80A529E59BE01CE6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f10,	%f26
loop_1144:
	rdhpr	%hsys_tick_cmpr,	%o7
loop_1145:
	fmovse	%xcc,	%f24,	%f28
	fpsub16s	%f10,	%f11,	%f29
	andncc	%g7,	0x1C93,	%g5
	fmuld8ulx16	%f11,	%f14,	%f0
	call	loop_1146
	xor	%o3,	0x1440,	%i3
	orncc	%i4,	%i5,	%g1
	fbl,a,pn	%fcc0,	loop_1147
loop_1146:
	nop
	set	0x79, %i4
	ldsb	[%l7 + %i4],	%l2
	call	loop_1148
	nop
	setx	0x18BF,	%l0,	%l5
	udivcc	%l6,	%l5,	%i6
loop_1147:
	fmovsneg	%icc,	%f21,	%f7
	flushw
loop_1148:
	swap	[%l7 + 0x64],	%g4
	call	loop_1149
	call	loop_1150
	movrlez	%l1,	%o4,	%o0
	call	loop_1151
loop_1149:
	call	loop_1152
loop_1150:
	fcmpgt32	%f20,	%f18,	%i1
	fxors	%f19,	%f6,	%f11
loop_1151:
	wr 	%g0, 	0x4, 	%fprs
loop_1152:
	fmovrde	%i2,	%f18,	%f6
	tvs	%xcc,	0x3
	array8	%l3,	%i7,	%l4
	fxnors	%f23,	%f4,	%f13
	call	loop_1153
	movu	%fcc1,	%g6,	%g2
	rdhpr	%hpstate,	%o5
	nop
	fitos	%f3,	%f30
	fstod	%f30,	%f20
loop_1153:
	call	loop_1154
	addccc	%o6,	0x1176,	%o1
	call	loop_1155
	nop
	setx	loop_1156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022100001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1154:
	sth	%o2,	[%l7 + 0x12]
	set	0x4D, %o3
	ldstuba	[%l7 + %o3] 0x19,	%l0
loop_1155:
	rdhpr	%hpstate,	%o7
loop_1156:
	call	loop_1157
	fblg	%fcc3,	loop_1158
	stx	%g7,	[%l7 + 0x28]
	fbul,pn	%fcc1,	loop_1159
loop_1157:
	call	loop_1160
loop_1158:
	orncc	%g5,	%i3,	%o3
	movcs	%xcc,	%i4,	%g1
loop_1159:
	call	loop_1161
loop_1160:
	call	loop_1162
	call	loop_1163
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f26
loop_1161:
	movule	%fcc1,	%i5,	%l6
loop_1162:
	bshuffle	%f0,	%f14,	%f20
loop_1163:
	call	loop_1164
	sub	%l5,	%i6,	%g4
	tcs	%xcc,	0x4
	subccc	%l1,	0x084B,	%l2
loop_1164:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o0
	array8	%i1,	%i0,	%o4
	rdhpr	%hsys_tick_cmpr,	%g3
	movug	%fcc3,	0x663,	%i2
	call	loop_1165
	swap	[%l7 + 0x5C],	%l3
	tneg	%icc,	0x3
	add	%i7,	0x14EB,	%g6
loop_1165:
	edge8ln	%g2,	%o5,	%l4
	edge32ln	%o6,	%o2,	%o1
	fmovsgu	%xcc,	%f4,	%f25
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f10
	flushw
	srl	%l0,	%g7,	%g5
	nop
	setx	loop_1166,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%i3,	%o3,	%i4
	call	loop_1167
	call	loop_1168
loop_1166:
	call	loop_1169
	faligndata	%f20,	%f8,	%f0
loop_1167:
	siam	0x1
loop_1168:
	fornot2s	%f11,	%f20,	%f21
loop_1169:
	fmovspos	%icc,	%f21,	%f3
	call	loop_1170
	alignaddrl	%o7,	%g1,	%l6
	rdpr	%gl,	%l5
	wrpr	%i5,	0x166B,	%pil
loop_1170:
	rd	%y,	%g4
	call	loop_1171
	fnands	%f23,	%f1,	%f6
	tcs	%icc,	0x2
	movn	%xcc,	%l1,	%i6
loop_1171:
	call	loop_1172
	nop
	setx	0xF8E3EB83805D0ADA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f8
	array16	%l2,	%o0,	%i1
	fandnot1s	%f4,	%f2,	%f20
loop_1172:
	bcc,a	%xcc,	loop_1173
	sub	%o4,	%i0,	%g3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i7
loop_1173:
	fmovdle	%xcc,	%f24,	%f26
	fmovsuge	%fcc1,	%f17,	%f19
	fmovsug	%fcc3,	%f18,	%f2
	and	%g6,	%g2,	%l3
	call	loop_1174
	call	loop_1175
	call	loop_1176
	fnot2s	%f8,	%f31
loop_1174:
	tpos	%xcc,	0x1
loop_1175:
	movl	%xcc,	%o5,	%o6
loop_1176:
	call	loop_1177
	movug	%fcc1,	%o2,	%o1
	popc	0x1033,	%l0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1177:
	xor	%l4,	0x036B,	%g7
	rd	%pc,	%i3
	call	loop_1178
	fone	%f2
	fornot1	%f12,	%f18,	%f6
	call	loop_1179
loop_1178:
	call	loop_1180
	call	loop_1181
	wrpr	%o3,	%i4,	%pil
loop_1179:
	tcc	%xcc,	0x1
loop_1180:
	fmovrse	%o7,	%f9,	%f1
loop_1181:
	st	%f13,	[%l7 + 0x78]
	udivx	%g5,	0x0E48,	%g1
	movrgz	%l6,	0x3C5,	%i5
	wr	%g4,	0x02D7,	%pic
	addcc	%l5,	0x03BC,	%i6
	call	loop_1182
	ta	%icc,	0x4
	call	loop_1183
	rdpr	%wstate,	%l2
loop_1182:
	add	%o0,	%l1,	%i1
	rdpr	%pil,	%o4
loop_1183:
	call	loop_1184
	call	loop_1185
	fpack16	%f30,	%f1
	call	loop_1186
loop_1184:
	nop
	setx	0xDDEF95B9D3ABF084,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_1185:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fabss	%f27,	%f24
loop_1186:
	fmovdne	%xcc,	%f14,	%f12
	call	loop_1187
	rdhpr	%ver,	%i0
	fmovsle	%xcc,	%f13,	%f21
	fmovrdgz	%i7,	%f24,	%f24
loop_1187:
	call	loop_1188
	movlg	%fcc3,	%g6,	%g2
	array16	%i2,	%o5,	%l3
	call	loop_1189
loop_1188:
	call	loop_1190
	xorcc	%o6,	0x0695,	%o2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1189:
	andcc	%o1,	0x1FF2,	%l4
loop_1190:
	call	loop_1191
	call	loop_1192
	edge8l	%l0,	%g7,	%o3
	nop
	setx	0x070BB18D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x52DF46D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f5,	%f0
loop_1191:
	fmovdcc	%icc,	%f20,	%f12
loop_1192:
	call	loop_1193
	fble,a	%fcc2,	loop_1194
	call	loop_1195
	tsubcc	%i4,	0x0FA9,	%i3
loop_1193:
	call	loop_1196
loop_1194:
	movre	%o7,	%g5,	%g1
loop_1195:
	movle	%fcc0,	%l6,	%g4
	call	loop_1197
loop_1196:
	fandnot2s	%f24,	%f1,	%f3
	call	loop_1198
	call	loop_1199
loop_1197:
	umulcc	%i5,	%l5,	%l2
	bvc	%xcc,	loop_1200
loop_1198:
	fmovdu	%fcc2,	%f14,	%f6
loop_1199:
	fpadd32	%f12,	%f2,	%f26
	call	loop_1201
loop_1200:
	fmovda	%xcc,	%f26,	%f14
	rdpr	%pil,	%o0
	movule	%fcc1,	%i6,	%i1
loop_1201:
	call	loop_1202
	rdpr	%cwp,	%l1
	call	loop_1203
	fandnot2	%f6,	%f30,	%f6
loop_1202:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x67] %asi,	%o4
loop_1203:
	edge8	%g3,	%i7,	%i0
	ldstub	[%l7 + 0x43],	%g6
	wrpr	%i2,	%o5,	%cwp
	fmovsge	%icc,	%f21,	%f25
	fxors	%f11,	%f10,	%f14
	rdpr	%canrestore,	%l3
	nop
	fitos	%f8,	%f29
	fstod	%f29,	%f28
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o6
	call	loop_1204
	call	loop_1205
	fcmpne32	%f8,	%f28,	%g2
	srax	%o1,	0x05,	%l4
loop_1204:
	call	loop_1206
loop_1205:
	bne,a,pt	%icc,	loop_1207
	call	loop_1208
	call	loop_1209
loop_1206:
	call	loop_1210
loop_1207:
	movrgez	%l0,	%g7,	%o3
loop_1208:
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f25
loop_1209:
	subc	%o2,	0x0960,	%i4
loop_1210:
	wr	%i3,	%g5,	%pic
	fmovdu	%fcc0,	%f24,	%f4
	sra	%g1,	%l6,	%g4
	fpsub16	%f4,	%f16,	%f18
	call	loop_1211
	sllx	%o7,	0x10,	%l5
	fpsub16	%f6,	%f28,	%f8
	wrpr	%i5,	%o0,	%tick
loop_1211:
	udivcc	%i6,	0x0E25,	%i1
	wr	%l1,	%l2,	%ccr
	fnors	%f23,	%f16,	%f8
	fmovslg	%fcc0,	%f1,	%f28
	fabsd	%f22,	%f6
	fabsd	%f22,	%f14
	fmovdneg	%xcc,	%f0,	%f18
	brgz,a,pt	%g3,	loop_1212
	call	loop_1213
	orncc	%i7,	0x00A9,	%i0
	andn	%o4,	0x0926,	%g6
loop_1212:
	call	loop_1214
loop_1213:
	call	loop_1215
	sllx	%i2,	%l3,	%o6
	fmovsneg	%icc,	%f4,	%f7
loop_1214:
	fmovdo	%fcc3,	%f0,	%f20
loop_1215:
	sub	%g2,	%o1,	%l4
	rdpr	%otherwin,	%o5
	fexpand	%f1,	%f14
	fmovrdgez	%l0,	%f20,	%f12
	call	loop_1216
	fbu	%fcc2,	loop_1217
	bshuffle	%f24,	%f14,	%f22
	tpos	%icc,	0x6
loop_1216:
	movgu	%xcc,	0x0C3,	%g7
loop_1217:
	sethi	0x1002,	%o3
	udiv	%o2,	0x0488,	%i3
	call	loop_1218
	popc	%i4,	%g5
	umul	%g1,	0x0277,	%l6
	call	loop_1219
loop_1218:
	movul	%fcc1,	%g4,	%l5
	call	loop_1220
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f10
loop_1219:
	movrgez	%i5,	%o0,	%i6
	fsrc2s	%f11,	%f8
loop_1220:
	nop
	fitos	%f0,	%f8
	fstox	%f8,	%f14
	edge32ln	%o7,	%l1,	%l2
	fmovsvs	%xcc,	%f14,	%f31
	subcc	%i1,	0x0C50,	%i7
	fmovrdlez	%i0,	%f24,	%f6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 25
!	Type a   	: 32
!	Type x   	: 7
!	Type cti   	: 149
!	Type f   	: 145
!	Type i   	: 142
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xF6F2DC2F
.word 0xE5D57030
.word 0x02D253DB
.word 0xA37DD85A
.word 0x8AE061CE
.word 0xA61AEE06
.word 0x44B8F904
.word 0xB89D5E3D
.word 0x7AB8D525
.word 0xD5FF99A0
.word 0x8217A743
.word 0xF200E1FB
.word 0x7CA76519
.word 0xC8B4E9B5
.word 0x189C268E
.word 0x75FDE222
.word 0x2BC80A66
.word 0xA824E4FB
.word 0xE7719298
.word 0x2CC80DF8
.word 0x59C17605
.word 0x12762340
.word 0xBBE17349
.word 0xF7A538D2
.word 0x0BBF7345
.word 0x35B8C2E8
.word 0xDFF62018
.word 0xAD151DD6
.word 0xD8DEB20B
.word 0x4E7B4985
.word 0x69A6B8A0
.word 0xC5BE80AE
.word 0x32FD165F
.word 0xE1069617
.word 0x6A62E59A
.word 0xD19DB9DB
.word 0x954F2F6F
.word 0x9405A9DC
.word 0x2BEBB550
.word 0x9682FEEE
.word 0x12193CCD
.word 0x31293D5E
.word 0x3CA90C57
.word 0x7A59B43E
.word 0x5E77864A
.word 0x8CA6D720
.word 0x7348D43E
.word 0xA812EB22
.word 0x4CE515C5
.word 0x59B1BD8C
.word 0x1BD80E4A
.word 0x49B38A8A
.word 0xD942E2AA
.word 0xC8B7D009
.word 0xCFEBACAD
.word 0x86FB4B2C
.word 0x17B5F98F
.word 0x16639CC0
.word 0xBB93414A
.word 0x82630AD7
.word 0xCEF757FD
.word 0x6FBF40F7
.word 0x3B149326
.word 0xD11B7D5C
.end
