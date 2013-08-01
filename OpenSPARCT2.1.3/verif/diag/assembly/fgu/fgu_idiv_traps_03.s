/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_03.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=512763"
.ident "Thu Dec 11 11:42:28 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_03.s,v 1.4 2007/07/27 21:45:30 drp Exp $"
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
	set	0xE,	%g1
	set	0xF,	%g2
	set	0xF,	%g3
	set	0xE,	%g4
	set	0x8,	%g5
	set	0xB,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x4,	%i1
	set	-0xB,	%i2
	set	-0xC,	%i3
	set	-0x2,	%i4
	set	-0x4,	%i5
	set	-0xE,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x78DB2944,	%l0
	set	0x6E9ACE66,	%l1
	set	0x03BC1F3B,	%l2
	set	0x7CE1CEF2,	%l3
	set	0x2BB9BCC8,	%l4
	set	0x31773BF1,	%l5
	set	0x2F0CB5AA,	%l6
	!# Output registers
	set	0x160D,	%o0
	set	0x0580,	%o1
	set	-0x160A,	%o2
	set	0x19A8,	%o3
	set	0x1807,	%o4
	set	-0x124D,	%o5
	set	0x118E,	%o6
	set	-0x0B17,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	fcmpgt32	%f30,	%f30,	%g7
	call	loop_1
	fmovsug	%fcc3,	%f8,	%f29
	smulcc	%i5,	%l3,	%l5
	fmovsule	%fcc0,	%f24,	%f15
loop_1:
	rd	%asi,	%i2
	movcc	%icc,	0x04E,	%i4
	movue	%fcc2,	0x0F7,	%o2
	call	loop_2
	call	loop_3
	stbar
	fmul8ulx16	%f28,	%f22,	%f22
loop_2:
	tleu	%xcc,	0x6
loop_3:
	call	loop_4
	tcc	%xcc,	0x4
	fandnot2	%f26,	%f22,	%f30
	array8	%o7,	%g4,	%g3
loop_4:
	call	loop_5
	bcc,a,pn	%icc,	loop_6
	fxors	%f7,	%f0,	%f2
	fpsub16	%f16,	%f0,	%f18
loop_5:
	fcmpeq32	%f22,	%f2,	%l1
loop_6:
	std	%o6,	[%l7 + 0x68]
	fmovspos	%xcc,	%f1,	%f16
	for	%f16,	%f14,	%f12
	call	loop_7
	fmovdl	%xcc,	%f16,	%f28
	fmovdg	%xcc,	%f12,	%f12
	srl	%g1,	%o0,	%o5
loop_7:
	subc	%g2,	%g5,	%g6
	fsrc1s	%f3,	%f5
	call	loop_8
	fmovrsgz	%i6,	%f16,	%f31
	call	loop_9
	call	loop_10
loop_8:
	call	loop_11
	smulcc	%l6,	%i1,	%l4
loop_9:
	rd	%pc,	%i3
loop_10:
	call	loop_12
loop_11:
	call	loop_13
	fnegd	%f22,	%f26
	edge32l	%o3,	%o4,	%l0
loop_12:
	movg	%fcc1,	0x5F2,	%i0
loop_13:
	tg	%icc,	0x1
	fmovdule	%fcc2,	%f8,	%f24
	call	loop_14
	fmovdo	%fcc0,	%f30,	%f22
	smul	%l2,	%i7,	%o1
	orn	%i5,	%l3,	%g7
loop_14:
	orncc	%i2,	%i4,	%o2
	fandnot2	%f0,	%f20,	%f0
	fmovsug	%fcc3,	%f14,	%f22
	rd	%tick_cmpr,	%o7
	fmovsge	%icc,	%f6,	%f25
	fmovsuge	%fcc3,	%f4,	%f1
	fba	%fcc2,	loop_15
	movug	%fcc3,	%l5,	%g3
	call	loop_16
	array32	%g4,	%o6,	%g1
loop_15:
	call	loop_17
	call	loop_18
loop_16:
	fmovdug	%fcc3,	%f6,	%f20
	call	loop_19
loop_17:
	fsrc2	%f22,	%f24
loop_18:
	fxnors	%f16,	%f3,	%f3
	call	loop_20
loop_19:
	call	loop_21
	call	loop_22
	or	%l1,	%o0,	%o5
loop_20:
	fzero	%f18
loop_21:
	call	loop_23
loop_22:
	movrgz	%g2,	%g5,	%i6
	call	loop_24
	call	loop_25
loop_23:
	sir	0x01F4
	fnegs	%f27,	%f22
loop_24:
	fmovsge	%fcc3,	%f22,	%f17
loop_25:
	call	loop_26
	tvs	%icc,	0x2
	fmovrde	%g6,	%f6,	%f16
	call	loop_27
loop_26:
	movrlez	%l6,	%l4,	%i1
	call	loop_28
	fmovsuge	%fcc0,	%f23,	%f18
loop_27:
	ta	%icc,	0x2
	tcc	%icc,	0x3
loop_28:
	fmovscc	%icc,	%f19,	%f22
	call	loop_29
	fandnot1s	%f1,	%f13,	%f19
	call	loop_30
	fblg	%fcc0,	loop_31
loop_29:
	call	loop_32
	fmovsuge	%fcc3,	%f11,	%f21
loop_30:
	movcs	%xcc,	0x33F,	%o3
loop_31:
	call	loop_33
loop_32:
	nop
	setx	0xCEEB5615D71F2A0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x26BDD9F9278B2E27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f28,	%f24
	sra	%o4,	%i3,	%i0
	movcc	%xcc,	0x409,	%l0
loop_33:
	fxor	%f8,	%f30,	%f26
	movuge	%fcc1,	0x2B6,	%i7
	tle	%xcc,	0x6
	array8	%o1,	%i5,	%l2
	st	%f19,	[%l7 + 0x20]
	fpadd16s	%f18,	%f13,	%f20
	rd	%softint,	%g7
	brnz,a,pn	%i2,	loop_34
	fnegd	%f6,	%f8
	movrgz	%i4,	0x046,	%o2
	call	loop_35
loop_34:
	call	loop_36
	movul	%fcc0,	%o7,	%l5
	fmovdu	%fcc3,	%f26,	%f16
loop_35:
	fornot2	%f16,	%f0,	%f4
loop_36:
	sethi	0x0BCC,	%l3
	call	loop_37
	call	loop_38
	ta	%xcc,	0x2
	call	loop_39
loop_37:
	fmovsle	%icc,	%f11,	%f22
loop_38:
	edge8	%g3,	%o6,	%g4
	xnorcc	%g1,	0x1B8D,	%o0
loop_39:
	call	loop_40
	fmovdul	%fcc2,	%f20,	%f26
	membar	0x34
	fmovrsne	%l1,	%f5,	%f14
loop_40:
	tgu	%icc,	0x2
	brz,a,pt	%o5,	loop_41
	rd	%asi,	%g5
	edge8	%i6,	%g6,	%l6
	wr	%g0,	0x88,	%asi
	stba	%l4,	[%l7 + 0x61] %asi
loop_41:
	tpos	%icc,	0x6
	call	loop_42
	call	loop_43
	call	loop_44
	call	loop_45
loop_42:
	fmovsn	%xcc,	%f27,	%f27
loop_43:
	fmovdleu	%xcc,	%f30,	%f10
loop_44:
	call	loop_46
loop_45:
	fmovdvc	%icc,	%f12,	%f26
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_46:
	addccc	%g2,	0x02B5,	%i1
	call	loop_47
	fpsub32s	%f19,	%f18,	%f10
	fmovsn	%fcc2,	%f26,	%f26
	movug	%fcc1,	0x245,	%o4
loop_47:
	edge8	%i3,	%i0,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_48
	rd	%tick_cmpr,	%o1
	fand	%f12,	%f10,	%f4
	udivcc	%i5,	0x00,	%i7
loop_48:
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%l2
	call	loop_49
	orn	%g7,	0x07BE,	%i4
	udivx	%i2,	0x00,	%o2
	call	loop_50
loop_49:
	umulcc	%o7,	0x116F,	%l3
	fmovdug	%fcc2,	%f30,	%f6
	fcmpgt16	%f0,	%f2,	%g3
loop_50:
	nop
	setx	0x7557E3CEBEE26840,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	and	%o6,	%g4,	%g1
	fxors	%f27,	%f19,	%f24
	fmovdle	%fcc2,	%f24,	%f24
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_51
	fmovdne	%icc,	%f2,	%f8
	faligndata	%f30,	%f14,	%f16
	call	loop_52
loop_51:
	tleu	%icc,	0x1
	call	loop_53
	movneg	%icc,	0x222,	%o0
loop_52:
	fones	%f15
	fsrc2s	%f18,	%f16
loop_53:
	call	loop_54
	sra	%l1,	%l5,	%g5
	movpos	%xcc,	0x0C7,	%i6
	call	loop_55
loop_54:
	fble	%fcc0,	loop_56
	call	loop_57
	fcmple16	%f18,	%f6,	%g6
loop_55:
	call	loop_58
loop_56:
	edge32n	%l6,	%o5,	%g2
loop_57:
	call	loop_59
	call	loop_60
loop_58:
	call	loop_61
	or	%i1,	%o4,	%i3
loop_59:
	and	%i0,	%l0,	%l4
loop_60:
	call	loop_62
loop_61:
	movrgez	%o3,	0x205,	%i5
	movue	%fcc1,	%i7,	%o1
	call	loop_63
loop_62:
	call	loop_64
	call	loop_65
	wrpr	%g7,	%l2,	%tick
loop_63:
	fmovsuge	%fcc3,	%f20,	%f20
loop_64:
	bneg,a,pn	%icc,	loop_66
loop_65:
	call	loop_67
	wrpr	%i2,	0x17A4,	%pil
	call	loop_68
loop_66:
	call	loop_69
loop_67:
	tge	%xcc,	0x1
	mulx	%i4,	%o2,	%o7
loop_68:
	fcmpgt16	%f18,	%f16,	%g3
loop_69:
	fnegs	%f25,	%f8
	fcmpgt32	%f4,	%f10,	%l3
	smul	%o6,	0x16F0,	%g1
	fmuld8sux16	%f28,	%f25,	%f22
	fcmpd	%fcc0,	%f12,	%f2
	call	loop_70
	tpos	%icc,	0x0
	nop
	fitod	%f31,	%f30
	fpack32	%f10,	%f28,	%f16
loop_70:
	nop
	setx	0x85B4EBA7C3D2695B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f2
	call	loop_71
	bshuffle	%f0,	%f8,	%f18
	fcmple16	%f2,	%f22,	%g4
	popc	0x0680,	%l1
loop_71:
	fnor	%f30,	%f4,	%f2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o0,	%l5
	call	loop_72
	call	loop_73
	call	loop_74
	fsrc1s	%f4,	%f21
loop_72:
	fpsub32	%f16,	%f26,	%f8
loop_73:
	call	loop_75
loop_74:
	fors	%f0,	%f6,	%f15
	fcmpgt16	%f24,	%f2,	%i6
	andncc	%g6,	0x09D8,	%l6
loop_75:
	movn	%fcc3,	%o5,	%g5
	call	loop_76
	fandnot2	%f26,	%f16,	%f12
	nop
	setx	0x7E80DCAC8A6D342C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f16
	fpsub16s	%f5,	%f12,	%f15
loop_76:
	call	loop_77
	tneg	%icc,	0x5
	movcs	%xcc,	0x423,	%i1
	rd	%fprs,	%o4
loop_77:
	call	loop_78
	tleu	%icc,	0x1
	movul	%fcc1,	0x18D,	%i3
	fxor	%f4,	%f24,	%f16
loop_78:
	st	%f16,	[%l7 + 0x6C]
	fmovdg	%icc,	%f22,	%f8
	fpsub16s	%f29,	%f2,	%f10
	call	loop_79
	smulcc	%g2,	0x178B,	%l0
	edge16	%i0,	%l4,	%o3
	wrpr	%i5,	0x0177,	%cwp
loop_79:
	fpsub32	%f24,	%f10,	%f4
	fmovdule	%fcc3,	%f10,	%f30
	call	loop_80
	movpos	%xcc,	%o1,	%g7
	nop
	setx	loop_81,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hsys_tick_cmpr,	%i7
loop_80:
	movle	%icc,	%i2,	%l2
	sdivx	%o2,	%i4,	%o7
loop_81:
	call	loop_82
	movrlz	%g3,	0x0A3,	%l3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x58] %asi,	%f7
loop_82:
	fmovrslz	%g1,	%f27,	%f4
	alignaddr	%o6,	%l1,	%g4
	tn	%icc,	0x0
	movleu	%icc,	%l5,	%o0
	call	loop_83
	edge8	%g6,	%i6,	%l6
	fnot1s	%f23,	%f27
	fmovspos	%xcc,	%f12,	%f3
loop_83:
	call	loop_84
	nop
	setx	0x6FDA38EC716978E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xC35F81750CA4751C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f20,	%f12
	fbule	%fcc0,	loop_85
	fbug	%fcc1,	loop_86
loop_84:
	call	loop_87
	fcmpne16	%f12,	%f2,	%o5
loop_85:
	nop
	set	0x20, %l0
	sta	%f12,	[%l7 + %l0] 0x89
loop_86:
	fmovrse	%i1,	%f27,	%f5
loop_87:
	call	loop_88
	fmovsule	%fcc1,	%f23,	%f26
	fmovdue	%fcc0,	%f20,	%f20
	fpadd16s	%f28,	%f9,	%f30
loop_88:
	edge32n	%o4,	%i3,	%g2
	movn	%icc,	%g5,	%i0
	fmovdcc	%icc,	%f28,	%f0
	fcmpgt16	%f12,	%f8,	%l0
	fandnot1s	%f22,	%f21,	%f22
	call	loop_89
	wr	%o3,	0x05C9,	%clear_softint
	call	loop_90
	bne,a,pt	%icc,	loop_91
loop_89:
	fmul8x16	%f6,	%f22,	%f0
	fornot1	%f8,	%f20,	%f18
loop_90:
	addcc	%l4,	0x0C7C,	%i5
loop_91:
	fpadd16	%f26,	%f20,	%f24
	movu	%fcc3,	%o1,	%i7
	sdivcc	%g7,	%l2,	%i2
	prefetch	[%l7 + 0x40],	 1
	fsrc1	%f0,	%f24
	fmul8x16	%f11,	%f22,	%f24
	brlz,pn	%o2,	loop_92
	xorcc	%i4,	0x1FD7,	%o7
	wrpr	%g3,	%g1,	%cwp
	call	loop_93
loop_92:
	sdivcc	%l3,	%o6,	%g4
	movre	%l5,	%l1,	%o0
	alignaddr	%i6,	%g6,	%o5
loop_93:
	fmovdne	%fcc1,	%f16,	%f2
	fbo,pn	%fcc3,	loop_94
	call	loop_95
	fmovd	%f6,	%f4
	call	loop_96
loop_94:
	taddcc	%i1,	%o4,	%l6
loop_95:
	fmovdneg	%xcc,	%f2,	%f26
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g2
loop_96:
	fmovduge	%fcc3,	%f30,	%f12
	fcmpne32	%f16,	%f12,	%i3
	movl	%xcc,	0x440,	%i0
	call	loop_97
	fmovdneg	%xcc,	%f14,	%f24
	nop
	set	0x73, %g5
	stb	%g5,	[%l7 + %g5]
	edge16ln	%o3,	%l0,	%i5
loop_97:
	call	loop_98
	fmovrslez	%o1,	%f14,	%f27
	mulx	%i7,	%l4,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x90B, 	%sys_tick_cmpr
loop_98:
	call	loop_99
	rdhpr	%htba,	%i4
	tleu	%xcc,	0x0
	tg	%xcc,	0x2
loop_99:
	movue	%fcc3,	0x592,	%o7
	bneg,pt	%xcc,	loop_100
	rdhpr	%hpstate,	%g3
	bneg	%icc,	loop_101
	fmovdg	%xcc,	%f20,	%f10
loop_100:
	call	loop_102
	call	loop_103
loop_101:
	umulcc	%g1,	0x1E3C,	%o2
	brlz	%o6,	loop_104
loop_102:
	array8	%l3,	%l5,	%l1
loop_103:
	tvs	%xcc,	0x6
	call	loop_105
loop_104:
	array16	%g4,	%o0,	%i6
	wr	%g6,	%o5,	%pic
	call	loop_106
loop_105:
	fcmpd	%fcc1,	%f4,	%f22
	wr	%g0,	0x2b,	%asi
	stda	%i0,	[%l7 + 0x28] %asi
	membar	#Sync
loop_106:
	rdpr	%cwp,	%l6
	movrne	%g2,	0x014,	%i3
	call	loop_107
	fmul8x16	%f29,	%f4,	%f20
	call	loop_108
	fzeros	%f28
loop_107:
	st	%f16,	[%l7 + 0x50]
	bmask	%o4,	%i0,	%o3
loop_108:
	movule	%fcc3,	0x3EE,	%l0
	call	loop_109
	call	loop_110
	movg	%icc,	0x614,	%i5
	fmul8sux16	%f6,	%f28,	%f0
loop_109:
	swap	[%l7 + 0x28],	%g5
loop_110:
	fnors	%f24,	%f23,	%f29
	fmul8x16al	%f12,	%f22,	%f12
	fcmps	%fcc1,	%f17,	%f19
	fcmpeq32	%f28,	%f16,	%o1
	fmovrdlz	%l4,	%f22,	%f16
	call	loop_111
	fandnot2s	%f2,	%f6,	%f2
	call	loop_112
	edge32n	%g7,	%l2,	%i2
loop_111:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f2
	bneg,pt	%icc,	loop_113
loop_112:
	fmovd	%f24,	%f6
	swap	[%l7 + 0x3C],	%i7
	rd	%softint,	%o7
loop_113:
	mova	%icc,	%g3,	%g1
	edge16ln	%i4,	%o6,	%o2
	fornot2	%f12,	%f4,	%f14
	call	loop_114
	tcs	%icc,	0x6
	fmul8x16au	%f2,	%f7,	%f12
	call	loop_115
loop_114:
	array32	%l3,	%l5,	%l1
	tpos	%icc,	0x3
	edge32ln	%o0,	%i6,	%g4
loop_115:
	call	loop_116
	tneg	%xcc,	0x3
	tl	%xcc,	0x5
	movcc	%icc,	0x760,	%o5
loop_116:
	tneg	%icc,	0x7
	nop
	set	0x10, %l5
	ldsb	[%l7 + %l5],	%i1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x1A, %i5
	ldub	[%l7 + %i5],	%l6
	call	loop_117
	array16	%g2,	%i3,	%o4
	call	loop_118
	call	loop_119
loop_117:
	nop
	fitos	%f12,	%f12
	fstoi	%f12,	%f24
	nop
	setx loop_120, %l0, %l1
	jmpl %l1, %i0
loop_118:
	fbue,a	%fcc3,	loop_121
loop_119:
	call	loop_122
	fmovsue	%fcc3,	%f5,	%f4
loop_120:
	bne,a,pt	%xcc,	loop_123
loop_121:
	prefetch	[%l7 + 0x24],	 2
loop_122:
	nop
	fitod	%f12,	%f6
	wr	%o3,	%i5,	%sys_tick
loop_123:
	fpsub16	%f12,	%f28,	%f22
	fexpand	%f7,	%f24
	call	loop_124
	fmovrdgz	%l0,	%f18,	%f10
	fmovsg	%icc,	%f25,	%f31
	call	loop_125
loop_124:
	fxnor	%f0,	%f10,	%f8
	xor	%g5,	0x1CD2,	%o1
	bshuffle	%f26,	%f4,	%f20
loop_125:
	bcc,a,pt	%icc,	loop_126
	nop
	setx	0x79C5A23A825C728F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	call	loop_127
	fandnot2s	%f11,	%f15,	%f28
loop_126:
	edge32n	%g7,	%l4,	%l2
	call	loop_128
loop_127:
	array32	%i2,	%i7,	%g3
	call	loop_129
	fcmpgt16	%f10,	%f2,	%o7
loop_128:
	call	loop_130
	fornot2	%f16,	%f16,	%f4
loop_129:
	brlz,a	%g1,	loop_131
	call	loop_132
loop_130:
	andncc	%o6,	0x0AA0,	%i4
	xorcc	%o2,	0x0865,	%l5
loop_131:
	call	loop_133
loop_132:
	fmovsug	%fcc3,	%f20,	%f25
	addccc	%l3,	0x10E0,	%l1
	call	loop_134
loop_133:
	fmovdpos	%xcc,	%f22,	%f0
	movrlz	%i6,	%o0,	%o5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0A] %asi,	%g4
loop_134:
	tl	%xcc,	0x4
	fmovsa	%icc,	%f31,	%f21
	call	loop_135
	fmul8sux16	%f30,	%f6,	%f8
	bvs,pt	%icc,	loop_136
	fmovdule	%fcc3,	%f8,	%f0
loop_135:
	nop
	setx	0x1D356722E731B621,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD8596AAF137539A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f20,	%f6
	fmovse	%fcc2,	%f27,	%f14
loop_136:
	movleu	%xcc,	%i1,	%g6
	call	loop_137
	fabss	%f30,	%f22
	movug	%fcc1,	0x2B3,	%g2
	fbue	%fcc2,	loop_138
loop_137:
	fmovsleu	%icc,	%f11,	%f0
	fmovsvc	%xcc,	%f8,	%f4
	call	loop_139
loop_138:
	fnot1s	%f19,	%f9
	fnands	%f23,	%f17,	%f15
	fmovdneg	%icc,	%f30,	%f28
loop_139:
	fandnot2s	%f14,	%f4,	%f13
	fcmpes	%fcc3,	%f8,	%f23
	fmovdpos	%xcc,	%f2,	%f16
	umulcc	%l6,	%i3,	%o4
	nop
	setx	0x3D29B3A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f19
	call	loop_140
	movge	%fcc3,	%o3,	%i0
	fmovdvc	%xcc,	%f18,	%f24
	call	loop_141
loop_140:
	rdhpr	%hsys_tick_cmpr,	%l0
	call	loop_142
	bmask	%i5,	%o1,	%g5
loop_141:
	edge32l	%l4,	%l2,	%i2
	umulcc	%g7,	%g3,	%o7
loop_142:
	call	loop_143
	fabsd	%f8,	%f14
	call	loop_144
	xnor	%i7,	0x0515,	%o6
loop_143:
	movne	%icc,	0x024,	%i4
	nop
	setx	0x5744776085DF0F33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xAF85C96A20F8771C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f28,	%f28
loop_144:
	fcmps	%fcc1,	%f17,	%f8
	flushw
	nop
	setx loop_145, %l0, %l1
	jmpl %l1, %o2
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f10
	fxtod	%f10,	%f26
	xnorcc	%l5,	0x184B,	%l3
	fcmpes	%fcc1,	%f9,	%f24
loop_145:
	fbe,pt	%fcc1,	loop_146
	call	loop_147
	fmovdneg	%icc,	%f22,	%f24
	fandnot2s	%f30,	%f21,	%f24
loop_146:
	andcc	%l1,	0x1EED,	%i6
loop_147:
	fornot1s	%f30,	%f3,	%f3
	fmovrdgez	%g1,	%f30,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	umulcc	%o0,	0x10BB,	%i1
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g6
	edge16	%g4,	%g2,	%l6
	movu	%fcc0,	%i3,	%o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 24
!	Type a   	: 24
!	Type x   	: 9
!	Type cti   	: 147
!	Type f   	: 158
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
	set	0xD,	%g2
	set	0x0,	%g3
	set	0xC,	%g4
	set	0x2,	%g5
	set	0xE,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xB,	%i1
	set	-0x4,	%i2
	set	-0x6,	%i3
	set	-0x6,	%i4
	set	-0x7,	%i5
	set	-0xF,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x3FD3923D,	%l0
	set	0x7B16B20F,	%l1
	set	0x64CE5DF8,	%l2
	set	0x76452A08,	%l3
	set	0x56298B23,	%l4
	set	0x7F4BCB01,	%l5
	set	0x65CD24D5,	%l6
	!# Output registers
	set	0x0810,	%o0
	set	0x06F9,	%o1
	set	-0x0AC8,	%o2
	set	0x0062,	%o3
	set	-0x0660,	%o4
	set	0x0DE6,	%o5
	set	0x0F26,	%o6
	set	0x14FE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	call	loop_148
	call	loop_149
	nop
	setx	0xEA7E0170B47E3F47,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE79EE88125055935,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f26,	%f22
	tl	%xcc,	0x6
loop_148:
	bcs	%icc,	loop_150
loop_149:
	movg	%fcc0,	%o4,	%l0
	call	loop_151
	fcmps	%fcc1,	%f29,	%f14
loop_150:
	brgz,a,pn	%i0,	loop_152
	udiv	%i5,	%g5,	%o1
loop_151:
	fmovdvs	%icc,	%f6,	%f12
	tn	%xcc,	0x4
loop_152:
	nop
	setx	0x41BAC700,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xBF1DB8E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f23,	%f0
	movcc	%xcc,	%l4,	%i2
	wrpr	%l2,	0x0601,	%tick
	movpos	%icc,	0x3DB,	%g3
	taddcc	%g7,	0x17E1,	%i7
	call	loop_153
	fmovdug	%fcc2,	%f4,	%f16
	fmovdug	%fcc2,	%f26,	%f2
	call	loop_154
loop_153:
	fnot1	%f8,	%f4
	movre	%o7,	0x1FB,	%o6
	movu	%fcc0,	0x28A,	%i4
loop_154:
	call	loop_155
	udivcc	%o2,	%l5,	%l3
	call	loop_156
	brlez,pt	%i6,	loop_157
loop_155:
	call	loop_158
	mulx	%l1,	0x06F6,	%g1
loop_156:
	fmovsle	%fcc0,	%f21,	%f30
loop_157:
	stbar
loop_158:
	fbu,pn	%fcc1,	loop_159
	call	loop_160
	fmovrsne	%o0,	%f20,	%f30
	tvc	%xcc,	0x7
loop_159:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o5
loop_160:
	mova	%icc,	0x197,	%g6
	udiv	%g4,	%g2,	%l6
	alignaddr	%i3,	%i1,	%o3
	fcmpgt32	%f16,	%f28,	%o4
	call	loop_161
	fbule,a,pt	%fcc0,	loop_162
	call	loop_163
	call	loop_164
loop_161:
	bvs,pt	%xcc,	loop_165
loop_162:
	fbule	%fcc2,	loop_166
loop_163:
	fnot2s	%f14,	%f11
loop_164:
	movl	%icc,	%i0,	%i5
loop_165:
	movule	%fcc3,	%l0,	%g5
loop_166:
	nop
	setx	0xA3787CC06071951B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movrgz	%o1,	0x001,	%i2
	rdpr	%wstate,	%l4
	wr	%l2,	0x134A,	%clear_softint
	fpack16	%f22,	%f27
	taddcc	%g3,	%g7,	%o7
	movrlz	%o6,	%i7,	%o2
	fmovsue	%fcc3,	%f8,	%f10
	srl	%i4,	%l3,	%i6
	movug	%fcc1,	%l5,	%l1
	movcs	%icc,	%o0,	%o5
	rd	%softint,	%g6
	fbne,a	%fcc0,	loop_167
	tleu	%icc,	0x0
	fmovrslz	%g4,	%f14,	%f7
	nop
	setx	0x30458232AC55FBC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x26C36CF615A1B6F5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f30,	%f30
loop_167:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g1,	%g2
	nop
	setx loop_168, %l0, %l1
	jmpl %l1, %l6
	tgu	%xcc,	0x6
	nop
	set	0x08, %o0
	stx	%fsr,	[%l7 + %o0]
	fmovsn	%fcc2,	%f5,	%f1
loop_168:
	tsubcc	%i1,	%i3,	%o3
	srax	%o4,	0x11,	%i5
	fmul8x16au	%f17,	%f26,	%f8
	call	loop_169
	fbl,a	%fcc1,	loop_170
	fble	%fcc3,	loop_171
	call	loop_172
loop_169:
	nop
	setx	0xB0CE1E17D0FA9C3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x8D7BCF32C601BAC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f22,	%f16
loop_170:
	sir	0x1BF6
loop_171:
	ldx	[%l7 + 0x50],	%l0
loop_172:
	fzeros	%f15
	mulscc	%g5,	0x06FC,	%i0
	fmovsgu	%icc,	%f23,	%f30
	ld	[%l7 + 0x0C],	%f1
	fmul8x16	%f3,	%f22,	%f2
	nop
	set	0x30, %i4
	std	%i2,	[%l7 + %i4]
	tneg	%xcc,	0x7
	or	%o1,	%l2,	%l4
	call	loop_173
	call	loop_174
	fmovsue	%fcc0,	%f28,	%f3
	sdiv	%g3,	0x00,	%o7
loop_173:
	fmovrslz	%o6,	%f6,	%f2
loop_174:
	call	loop_175
	call	loop_176
	fmovrsgez	%i7,	%f5,	%f9
	tg	%xcc,	0x6
loop_175:
	fmovdleu	%icc,	%f6,	%f26
loop_176:
	sra	%o2,	%i4,	%g7
	fmovrslz	%l3,	%f0,	%f30
	movl	%fcc3,	0x596,	%l5
	nop
	fitod	%f2,	%f30
	fdtos	%f30,	%f6
	call	loop_177
	fmovdge	%fcc1,	%f12,	%f22
	fcmpgt32	%f30,	%f28,	%i6
	call	loop_178
loop_177:
	edge32n	%l1,	%o5,	%g6
	call	loop_179
	fxnors	%f22,	%f13,	%f29
loop_178:
	addc	%o0,	%g1,	%g2
	fmovsvc	%xcc,	%f31,	%f29
loop_179:
	mulscc	%l6,	0x142D,	%g4
	edge32ln	%i1,	%i3,	%o4
	fbug	%fcc3,	loop_180
	call	loop_181
	subcc	%i5,	0x161A,	%l0
	pdist	%f24,	%f18,	%f12
loop_180:
	call	loop_182
loop_181:
	call	loop_183
	fmovscs	%xcc,	%f30,	%f15
	fnot2	%f16,	%f6
loop_182:
	rdpr	%tba,	%o3
loop_183:
	call	loop_184
	call	loop_185
	fmovsul	%fcc1,	%f10,	%f4
	call	loop_186
loop_184:
	tpos	%icc,	0x3
loop_185:
	xnorcc	%g5,	%i2,	%i0
	fnegd	%f2,	%f18
loop_186:
	nop
	setx	0x0CDB1919,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xEBF72AB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f25,	%f12
	fmovsvc	%xcc,	%f29,	%f9
	stx	%fsr,	[%l7 + 0x30]
	call	loop_187
	fmovrdlz	%l2,	%f16,	%f4
	call	loop_188
	fmovsvs	%icc,	%f13,	%f2
loop_187:
	call	loop_189
	edge16ln	%o1,	%l4,	%o7
loop_188:
	fmovs	%f6,	%f14
	te	%icc,	0x2
loop_189:
	xor	%o6,	%g3,	%o2
	udiv	%i4,	0x00,	%g7
	nop
	setx	0x62E81BBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xB3642F0C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f10,	%f24
	or	%i7,	0x03B1,	%l5
	movge	%icc,	0x784,	%i6
	nop
	setx	0x2610AF48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x424751F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f31,	%f30
	ble,a	%icc,	loop_190
	movrlez	%l1,	0x3FB,	%l3
	edge8	%g6,	%o0,	%g1
	tne	%icc,	0x2
loop_190:
	subcc	%o5,	0x075E,	%l6
	pdist	%f2,	%f8,	%f30
	fcmped	%fcc2,	%f4,	%f28
	fnot2s	%f9,	%f14
	fcmpgt16	%f12,	%f20,	%g2
	call	loop_191
	call	loop_192
	rdhpr	%hintp,	%i1
	orncc	%i3,	%g4,	%i5
loop_191:
	fmovdvs	%xcc,	%f8,	%f18
loop_192:
	nop
	fitod	%f8,	%f22
	fdtos	%f22,	%f27
	nop
	set	0x08, %g4
	lduh	[%l7 + %g4],	%l0
	call	loop_193
	fnegs	%f10,	%f28
	fmul8ulx16	%f20,	%f12,	%f14
	call	loop_194
loop_193:
	call	loop_195
	nop
	fitos	%f6,	%f15
	fstox	%f15,	%f22
	fxtos	%f22,	%f21
	call	loop_196
loop_194:
	fpadd32	%f2,	%f4,	%f8
loop_195:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32	%o3,	%o4,	%g5
loop_196:
	movue	%fcc1,	0x79E,	%i2
	ta	%xcc,	0x2
	call	loop_197
	call	loop_198
	tgu	%xcc,	0x2
	fmovdleu	%xcc,	%f6,	%f10
loop_197:
	nop
	set	0x10, %g2
	stda	%l2,	[%l7 + %g2] 0x81
loop_198:
	srlx	%i0,	%l4,	%o1
	call	loop_199
	call	loop_200
	movg	%fcc2,	0x447,	%o6
	fornot1s	%f26,	%f15,	%f20
loop_199:
	fors	%f31,	%f6,	%f3
loop_200:
	fandnot2	%f30,	%f14,	%f2
	wr	%g3,	0x106D,	%clear_softint
	set	0x58, %i1
	stda	%o6,	[%l7 + %i1] 0x81
	rd	%softint,	%o2
	nop
	setx	0x7AE3C760,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x2C6D44E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f20,	%f6
	tneg	%xcc,	0x3
	fmovsge	%icc,	%f26,	%f27
	fmovdvs	%icc,	%f10,	%f4
	call	loop_201
	tsubcctv	%i4,	0x120F,	%i7
	edge8	%g7,	%l5,	%i6
	call	loop_202
loop_201:
	rdhpr	%htba,	%l3
	movrlez	%l1,	%o0,	%g1
	call	loop_203
loop_202:
	faligndata	%f14,	%f26,	%f10
	tvc	%icc,	0x6
	fmovspos	%xcc,	%f9,	%f17
loop_203:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE64, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x914, 	%hsys_tick_cmpr
	fmovrdlez	%g6,	%f30,	%f16
	fpadd32	%f0,	%f8,	%f2
	brnz,pn	%i1,	loop_204
	call	loop_205
	call	loop_206
	call	loop_207
loop_204:
	fnor	%f12,	%f12,	%f0
loop_205:
	movvs	%xcc,	0x266,	%g4
loop_206:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_207:
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%l0
	rdhpr	%htba,	%o3
	sra	%i5,	%o4,	%g5
	tleu	%icc,	0x3
	andn	%i2,	%l2,	%l4
	move	%xcc,	0x742,	%o1
	call	loop_208
	call	loop_209
	fmovrslez	%o6,	%f8,	%f13
	call	loop_210
loop_208:
	fnors	%f2,	%f0,	%f22
loop_209:
	fmovs	%f30,	%f22
	nop
	fitos	%f8,	%f12
	fstox	%f12,	%f0
loop_210:
	nop
	setx	0xABFA0E8E4D4F6C8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6CBE632368958134,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f18,	%f16
	nop
	fitod	%f0,	%f6
	fdtos	%f6,	%f14
	rdhpr	%hpstate,	%g3
	edge16ln	%i0,	%o7,	%o2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i7,	%g7
	fcmpgt16	%f4,	%f22,	%l5
	movuge	%fcc1,	%i4,	%l3
	call	loop_211
	fmovduge	%fcc3,	%f6,	%f28
	fmovscc	%xcc,	%f0,	%f6
	bneg,pt	%xcc,	loop_212
loop_211:
	nop
	setx	0x69E88ADC5B50DFA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFA33C72052A8631D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f14,	%f20
	call	loop_213
	call	loop_214
loop_212:
	fmovsge	%xcc,	%f12,	%f31
	sdivx	%i6,	%l1,	%o0
loop_213:
	fmovsue	%fcc0,	%f10,	%f31
loop_214:
	call	loop_215
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f6
	fmovrdgz	%g1,	%f4,	%f8
	call	loop_216
loop_215:
	call	loop_217
	wr	%o5,	0x0F72,	%softint
	fmovsvs	%icc,	%f20,	%f11
loop_216:
	call	loop_218
loop_217:
	wrpr	%l6,	0x1260,	%pil
	brgz,pn	%g2,	loop_219
	te	%xcc,	0x2
loop_218:
	call	loop_220
	fpsub32s	%f28,	%f1,	%f5
loop_219:
	fxors	%f24,	%f31,	%f2
	bleu,pn	%xcc,	loop_221
loop_220:
	fabsd	%f16,	%f10
	std	%g6,	[%l7 + 0x28]
	add	%g4,	0x031E,	%i1
loop_221:
	call	loop_222
	wrpr	%l0,	%i3,	%pil
	call	loop_223
	smulcc	%i5,	%o4,	%g5
loop_222:
	nop
	set	0x64, %l6
	sta	%f7,	[%l7 + %l6] 0x81
loop_223:
	rdpr	%otherwin,	%o3
	fmovdu	%fcc2,	%f24,	%f24
	fbue	%fcc1,	loop_224
	rdpr	%cleanwin,	%l2
	fbue	%fcc2,	loop_225
	addc	%i2,	%l4,	%o6
loop_224:
	call	loop_226
	edge32l	%o1,	%g3,	%i0
loop_225:
	tleu	%icc,	0x7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x228, 	%hsys_tick_cmpr
loop_226:
	call	loop_227
	fmovrde	%g7,	%f18,	%f30
	call	loop_228
	fandnot2	%f16,	%f8,	%f16
loop_227:
	edge8	%i7,	%l5,	%l3
	nop
	fitos	%f0,	%f9
	fstox	%f9,	%f8
	fxtos	%f8,	%f2
loop_228:
	call	loop_229
	call	loop_230
	movul	%fcc3,	0x04C,	%i4
	fmovdue	%fcc2,	%f20,	%f2
loop_229:
	tl	%xcc,	0x1
loop_230:
	nop
	setx	0xFC72B4F0A290FBE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f20
	call	loop_231
	array16	%l1,	%o0,	%i6
	nop
	fitos	%f4,	%f29
	fstox	%f29,	%f16
	fcmpne32	%f20,	%f0,	%o5
loop_231:
	fmovsg	%fcc2,	%f14,	%f23
	call	loop_232
	fnegs	%f5,	%f2
	call	loop_233
	fbue,a,pt	%fcc0,	loop_234
loop_232:
	sir	0x1C67
	nop
	setx	0x916BB176F78A5420,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x20A54E121B31B470,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f10,	%f4
loop_233:
	call	loop_235
loop_234:
	call	loop_236
	fba	%fcc0,	loop_237
	sllx	%l6,	%g1,	%g2
loop_235:
	fmovdleu	%icc,	%f14,	%f6
loop_236:
	call	loop_238
loop_237:
	call	loop_239
	fand	%f14,	%f20,	%f18
	edge32n	%g4,	%i1,	%g6
loop_238:
	brz	%i3,	loop_240
loop_239:
	nop
	setx	0x7316A5CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x837CBB4E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f15,	%f2
	st	%f1,	[%l7 + 0x70]
	nop
	set	0x18, %o2
	ldsh	[%l7 + %o2],	%i5
loop_240:
	movre	%o4,	%g5,	%o3
	move	%fcc2,	0x479,	%l2
	andn	%i2,	0x0749,	%l0
	call	loop_241
	call	loop_242
	brlz,a	%o6,	loop_243
	fcmpne16	%f4,	%f10,	%o1
loop_241:
	orcc	%l4,	0x0361,	%g3
loop_242:
	call	loop_244
loop_243:
	fmuld8ulx16	%f12,	%f27,	%f6
	call	loop_245
	call	loop_246
loop_244:
	fpack32	%f0,	%f24,	%f22
	fmovsug	%fcc2,	%f25,	%f4
loop_245:
	fbug,a,pn	%fcc2,	loop_247
loop_246:
	movvs	%xcc,	%o7,	%o2
	fbu,a,pt	%fcc1,	loop_248
	movul	%fcc2,	%i0,	%i7
loop_247:
	for	%f14,	%f20,	%f8
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x17,	%f16
loop_248:
	srl	%l5,	%g7,	%i4
	fmovrsgez	%l1,	%f9,	%f16
	fmovd	%f12,	%f10
	call	loop_249
	bneg,pn	%icc,	loop_250
	tsubcc	%l3,	%o0,	%i6
	tn	%icc,	0x4
loop_249:
	fmovsug	%fcc3,	%f19,	%f13
loop_250:
	fmovdcs	%icc,	%f30,	%f4
	call	loop_251
	bleu	%icc,	loop_252
	fones	%f14
	or	%o5,	0x043B,	%g1
loop_251:
	bne,a	%xcc,	loop_253
loop_252:
	call	loop_254
	fnand	%f24,	%f10,	%f20
	tle	%icc,	0x5
loop_253:
	movneg	%icc,	0x68D,	%l6
loop_254:
	edge32	%g2,	%i1,	%g6
	subc	%i3,	0x0EBD,	%g4
	fmovrsgz	%o4,	%f5,	%f5
	edge16n	%g5,	%i5,	%o3
	call	loop_255
	fzeros	%f11
	call	loop_256
	rdpr	%tl,	%l2
loop_255:
	edge32l	%l0,	%o6,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3F4, 	%tick_cmpr
loop_256:
	fmovsa	%fcc3,	%f0,	%f14
	fpack32	%f30,	%f28,	%f12
	nop
	set	0x2D, %o6
	ldstub	[%l7 + %o6],	%g3
	call	loop_257
	ble,pn	%xcc,	loop_258
	fone	%f8
	edge8ln	%o2,	%o7,	%i0
loop_257:
	bvc,pn	%xcc,	loop_259
loop_258:
	call	loop_260
	call	loop_261
	array32	%i7,	%l5,	%g7
loop_259:
	call	loop_262
loop_260:
	call	loop_263
loop_261:
	mulx	%i4,	%l1,	%o0
	fmovsneg	%icc,	%f30,	%f11
loop_262:
	fmovsule	%fcc3,	%f18,	%f16
loop_263:
	call	loop_264
	call	loop_265
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f16
	addcc	%i6,	%l3,	%g1
loop_264:
	st	%f7,	[%l7 + 0x34]
loop_265:
	wr	%o5,	0x0AA1,	%ccr
	set	0x51, %o4
	lduba	[%l7 + %o4] 0x0c,	%g2
	alignaddrl	%i1,	%g6,	%l6
	call	loop_266
	call	loop_267
	or	%i3,	%o4,	%g4
	fbo,pt	%fcc1,	loop_268
loop_266:
	addcc	%i5,	0x08F9,	%o3
loop_267:
	fmul8sux16	%f0,	%f10,	%f16
	fands	%f13,	%f21,	%f18
loop_268:
	edge16n	%g5,	%l2,	%o6
	srl	%o1,	0x00,	%l4
	add	%i2,	0x04D4,	%l0
	alignaddrl	%o2,	%o7,	%g3
	nop
	set	0x68, %g6
	std	%f16,	[%l7 + %g6]
	tg	%icc,	0x2
	call	loop_269
	fmovdcs	%icc,	%f0,	%f10
	wrpr	%i7,	0x158B,	%cwp
	call	loop_270
loop_269:
	fmovsuge	%fcc3,	%f18,	%f20
	call	loop_271
	fmovdug	%fcc0,	%f26,	%f10
loop_270:
	call	loop_272
	fmovd	%f0,	%f0
loop_271:
	call	loop_273
	call	loop_274
loop_272:
	bneg	%icc,	loop_275
	rdhpr	%hpstate,	%l5
loop_273:
	mulscc	%i0,	0x11E7,	%i4
loop_274:
	call	loop_276
loop_275:
	fmovdule	%fcc0,	%f20,	%f10
	movl	%icc,	%l1,	%g7
	fmovsul	%fcc2,	%f18,	%f14
loop_276:
	bshuffle	%f20,	%f16,	%f16
	fmuld8ulx16	%f15,	%f24,	%f18
	call	loop_277
	tvc	%icc,	0x0
	movle	%fcc3,	0x0C0,	%i6
	call	loop_278
loop_277:
	movrgz	%o0,	%l3,	%o5
	fmovdvc	%icc,	%f6,	%f10
	fmuld8sux16	%f31,	%f8,	%f22
loop_278:
	call	loop_279
	orncc	%g2,	%g1,	%i1
	fmovd	%f24,	%f20
	udivx	%g6,	%l6,	%o4
loop_279:
	orn	%i3,	0x1C5A,	%i5
	call	loop_280
	ble,pn	%icc,	loop_281
	call	loop_282
	fcmple32	%f20,	%f22,	%g4
loop_280:
	fmovdneg	%icc,	%f4,	%f30
loop_281:
	fmovsleu	%xcc,	%f29,	%f21
loop_282:
	fmovsug	%fcc2,	%f19,	%f11
	call	loop_283
	popc	%o3,	%g5
	fpsub16s	%f16,	%f4,	%f20
	fors	%f28,	%f30,	%f27
loop_283:
	call	loop_284
	sdiv	%o6,	0x00,	%l2
	and	%l4,	%o1,	%i2
	rd	%sys_tick_cmpr,	%o2
loop_284:
	tvs	%icc,	0x1
	movgu	%xcc,	0x7AD,	%l0
	tsubcc	%o7,	0x14CF,	%i7
	call	loop_285
	rdhpr	%hsys_tick_cmpr,	%g3
	for	%f18,	%f14,	%f22
	xnor	%l5,	%i0,	%l1
loop_285:
	fandnot2	%f16,	%f24,	%f28
	call	loop_286
	fmovrdgez	%g7,	%f14,	%f6
	fmovsuge	%fcc2,	%f4,	%f9
	fbue,a,pt	%fcc3,	loop_287
loop_286:
	umulcc	%i6,	%o0,	%i4
	fmovdgu	%xcc,	%f4,	%f0
	add	%l3,	0x1884,	%o5
loop_287:
	rdhpr	%htba,	%g1
	movrlz	%i1,	%g6,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_288
	movgu	%icc,	%i5,	%g4
	fpadd16s	%f0,	%f20,	%f8
	tcc	%icc,	0x6
loop_288:
	tle	%icc,	0x7
	call	loop_289
	mova	%fcc1,	%o4,	%o3
	umulcc	%o6,	0x1FFC,	%l2
	call	loop_290
loop_289:
	call	loop_291
	edge16	%l4,	%g5,	%i2
	fmovsvs	%icc,	%f11,	%f8
loop_290:
	tn	%icc,	0x4
loop_291:
	te	%xcc,	0x6
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f25
	call	loop_292
	edge8n	%o1,	%l0,	%o2
	movge	%icc,	0x62E,	%i7
	umulcc	%o7,	0x1854,	%l5
loop_292:
	call	loop_293
	fcmped	%fcc2,	%f16,	%f22
	fcmpne16	%f14,	%f20,	%i0
	fmovdg	%icc,	%f18,	%f8
loop_293:
	nop
	setx	0xE3C204DCB6656B26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	call	loop_294
	call	loop_295
	andcc	%l1,	%g7,	%g3
	fxnor	%f12,	%f28,	%f20
loop_294:
	nop

loop_295:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 24
!	Type a   	: 29
!	Type x   	: 8
!	Type cti   	: 148
!	Type f   	: 147
!	Type i   	: 144
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
	set	0x5,	%g1
	set	0xA,	%g2
	set	0xB,	%g3
	set	0x9,	%g4
	set	0x3,	%g5
	set	0xE,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x1,	%i1
	set	-0x3,	%i2
	set	-0x6,	%i3
	set	-0x2,	%i4
	set	-0x0,	%i5
	set	-0x3,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x2544917C,	%l0
	set	0x6B29D3E3,	%l1
	set	0x7D02FD75,	%l2
	set	0x6E07FCF2,	%l3
	set	0x5B0D379E,	%l4
	set	0x46FAD7FD,	%l5
	set	0x43141EFD,	%l6
	!# Output registers
	set	-0x0AA2,	%o0
	set	-0x1B5F,	%o1
	set	0x1A3A,	%o2
	set	-0x076C,	%o3
	set	-0x1DBB,	%o4
	set	0x111D,	%o5
	set	-0x1139,	%o6
	set	-0x0953,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	call	loop_296
	addccc	%i6,	0x0917,	%i4
	fmovdge	%fcc0,	%f26,	%f30
	fsrc1	%f10,	%f30
loop_296:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	edge16l	%o5,	%o0,	%i1
	bmask	%g1,	%l6,	%g6
	fmovdle	%xcc,	%f12,	%f28
	fmuld8ulx16	%f15,	%f21,	%f30
	array32	%i3,	%g2,	%g4
	wrpr	%o4,	0x0432,	%tick
	call	loop_297
	fcmpgt32	%f22,	%f24,	%o3
	call	loop_298
	nop
	setx	0x4FCE9F94D0EFEDC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x4E1433759CC586EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f28
loop_297:
	udivx	%i5,	0x00,	%l2
	umulcc	%l4,	0x0D78,	%o6
loop_298:
	nop
	fitos	%f11,	%f1
	fones	%f24
	rd	%softint,	%i2
	addccc	%g5,	0x1775,	%l0
	movpos	%xcc,	0x234,	%o2
	tl	%icc,	0x0
	rdpr	%tl,	%o1
	fmovsl	%fcc1,	%f2,	%f7
	tvc	%icc,	0x4
	call	loop_299
	call	loop_300
	call	loop_301
	nop
	setx	0x6F5CD2CE7219EC6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x13EB1E8E85CA83F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f12,	%f10
loop_299:
	call	loop_302
loop_300:
	call	loop_303
loop_301:
	tl	%icc,	0x7
	brz,a	%o7,	loop_304
loop_302:
	movlg	%fcc1,	%l5,	%i7
loop_303:
	fmovsl	%fcc1,	%f23,	%f14
	rdhpr	%hintp,	%i0
loop_304:
	call	loop_305
	fbl,a	%fcc0,	loop_306
	call	loop_307
	umul	%l1,	0x1ACC,	%g7
loop_305:
	andn	%g3,	%i6,	%i4
loop_306:
	call	loop_308
loop_307:
	array16	%o5,	%o0,	%l3
	call	loop_309
	fors	%f19,	%f13,	%f10
loop_308:
	edge16ln	%i1,	%g1,	%l6
	for	%f26,	%f18,	%f16
loop_309:
	call	loop_310
	call	loop_311
	fxor	%f18,	%f4,	%f20
	array32	%i3,	%g2,	%g4
loop_310:
	call	loop_312
loop_311:
	tvc	%icc,	0x0
	call	loop_313
	fpsub32	%f6,	%f22,	%f18
loop_312:
	brz	%o4,	loop_314
	movne	%fcc0,	0x2A1,	%g6
loop_313:
	nop
	setx	0x4903BFEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xF19F35B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f15,	%f20
	membar	0x78
loop_314:
	tleu	%xcc,	0x0
	fexpand	%f24,	%f4
	sir	0x18E8
	movleu	%icc,	0x26D,	%i5
	array16	%o3,	%l4,	%o6
	set	0x64, %o1
	sta	%f31,	[%l7 + %o1] 0x11
	fpadd32s	%f1,	%f16,	%f14
	xor	%i2,	0x12BF,	%g5
	call	loop_315
	popc	0x0F82,	%l2
	movleu	%xcc,	0x79B,	%l0
	rd	%pc,	%o1
loop_315:
	fandnot2	%f24,	%f20,	%f10
	brnz,a,pn	%o2,	loop_316
	call	loop_317
	call	loop_318
	call	loop_319
loop_316:
	fmovsgu	%icc,	%f30,	%f15
loop_317:
	movug	%fcc0,	%o7,	%l5
loop_318:
	tn	%xcc,	0x4
loop_319:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movge	%xcc,	%i0,	%l1
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%g6
	movu	%fcc2,	%i7,	%i6
	nop
	fitos	%f9,	%f4
	fstoi	%f4,	%f9
	nop
	set	0x64, %g3
	flush	%l7 + %g3
	edge32	%i4,	%g3,	%o0
	nop
	setx	0xD69B7B0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xE33065A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f16,	%f29

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x18D, 	%hsys_tick_cmpr
	nop
	setx	0xD9EA8C0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x73A90E45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f29,	%f22
	movlg	%fcc3,	0x333,	%g1
	sdivx	%i1,	0x00,	%i3
	movg	%fcc2,	%l6,	%g4
	call	loop_320
	call	loop_321
	flushw
	ldsw	[%l7 + 0x60],	%g2
loop_320:
	te	%icc,	0x4
loop_321:
	sub	%g6,	%o4,	%i5
	sll	%l4,	%o3,	%i2
	fxnor	%f30,	%f24,	%f12
	fornot1	%f20,	%f24,	%f2
	call	loop_322
	nop
	setx	0xCCC84C19C00F8554,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f28
	nop
	setx	0x180A2D4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	nop
	set	0x34, %l4
	ldsw	[%l7 + %l4],	%o6
loop_322:
	andncc	%g5,	0x0606,	%l0
	call	loop_323
	flushw
	te	%icc,	0x6
	call	loop_324
loop_323:
	fmovdg	%xcc,	%f8,	%f22
	call	loop_325
	rdpr	%tl,	%o1
loop_324:
	call	loop_326
	movg	%fcc3,	%o2,	%l2
loop_325:
	movo	%fcc1,	0x6D9,	%o7
	fsrc2	%f14,	%f8
loop_326:
	rdhpr	%htba,	%l5
	call	loop_327
	call	loop_328
	fbg,a	%fcc0,	loop_329
	rd	%ccr,	%i0
loop_327:
	xor	%g7,	0x17BB,	%i7
loop_328:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x0c
loop_329:
	udivcc	%i6,	0x00,	%l1
	fpadd16	%f14,	%f18,	%f18
	call	loop_330
	rd	%ccr,	%g3
	call	loop_331
	bmask	%i4,	%l3,	%o5
loop_330:
	tcc	%icc,	0x2
	fmovdo	%fcc1,	%f24,	%f2
loop_331:
	wrpr	%o0,	0x1913,	%pil
	call	loop_332
	fmovdo	%fcc3,	%f8,	%f28
	fmovsu	%fcc3,	%f1,	%f30
	call	loop_333
loop_332:
	call	loop_334
	wr	%i1,	0x16E8,	%sys_tick
	call	loop_335
loop_333:
	tne	%xcc,	0x1
loop_334:
	call	loop_336
	fpsub16s	%f9,	%f1,	%f26
loop_335:
	fpmerge	%f7,	%f3,	%f22
	movue	%fcc2,	%g1,	%l6
loop_336:
	call	loop_337
	te	%icc,	0x0
	call	loop_338
	fmovrsne	%g4,	%f24,	%f1
loop_337:
	fnot1	%f22,	%f20
	fmovrdne	%i3,	%f0,	%f0
loop_338:
	fmovdug	%fcc0,	%f24,	%f22
	fmovsge	%xcc,	%f15,	%f28
	addcc	%g6,	0x128A,	%g2
	fmovdcc	%icc,	%f14,	%f22
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ldsh	[%l7 + 0x2C],	%i5
	fpadd16	%f12,	%f22,	%f30
	fmovdlg	%fcc1,	%f22,	%f18
	movue	%fcc3,	%l4,	%o3
	array16	%o4,	%i2,	%g5
	be	%icc,	loop_339
	fmovdne	%icc,	%f12,	%f22
	edge32n	%l0,	%o1,	%o6
	tgu	%xcc,	0x4
loop_339:
	call	loop_340
	fmovsne	%fcc3,	%f8,	%f27
	fpadd16	%f4,	%f0,	%f24
	brlz	%l2,	loop_341
loop_340:
	movuge	%fcc1,	%o2,	%l5
	fmovrsgez	%i0,	%f12,	%f31
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x44] %asi,	%f0
loop_341:
	fmovdvc	%xcc,	%f22,	%f30
	fpsub16	%f2,	%f12,	%f8
	call	loop_342
	fmovsl	%fcc0,	%f25,	%f11
	fpadd32	%f16,	%f24,	%f16
	subccc	%o7,	0x06CC,	%g7
loop_342:
	call	loop_343
	movvs	%xcc,	0x27F,	%i6
	fpsub16s	%f24,	%f0,	%f26
	brnz,a,pt	%i7,	loop_344
loop_343:
	fmovrdgez	%g3,	%f8,	%f6
	call	loop_345
	tsubcctv	%i4,	%l3,	%l1
loop_344:
	fmovdge	%xcc,	%f8,	%f24
	udivcc	%o5,	%i1,	%g1
loop_345:
	movrgz	%o0,	%l6,	%g4
	call	loop_346
	brgz,a,pn	%g6,	loop_347
	tvs	%xcc,	0x0
	sub	%i3,	%i5,	%l4
loop_346:
	movn	%icc,	%g2,	%o4
loop_347:
	wrpr	%i2,	0x1CD2,	%tick
	call	loop_348
	call	loop_349
	bg,a	%xcc,	loop_350
	call	loop_351
loop_348:
	call	loop_352
loop_349:
	fbuge	%fcc3,	loop_353
loop_350:
	fmul8ulx16	%f28,	%f22,	%f2
loop_351:
	call	loop_354
loop_352:
	fnegs	%f22,	%f20
loop_353:
	edge16ln	%g5,	%l0,	%o1
	call	loop_355
loop_354:
	bmask	%o3,	%o6,	%o2
	call	loop_356
	movvc	%xcc,	0x3C3,	%l5
loop_355:
	rdpr	%canrestore,	%i0
	fpsub32s	%f30,	%f9,	%f26
loop_356:
	movu	%fcc3,	%o7,	%l2
	fabsd	%f24,	%f24
	tn	%xcc,	0x2
	fmovsu	%fcc3,	%f26,	%f4
	sethi	0x071C,	%g7
	fnegd	%f0,	%f22
	fbug	%fcc3,	loop_357
	call	loop_358
	brnz	%i6,	loop_359
	edge32ln	%g3,	%i4,	%l3
loop_357:
	call	loop_360
loop_358:
	ba	%xcc,	loop_361
loop_359:
	call	loop_362
	xorcc	%i7,	%o5,	%l1
loop_360:
	call	loop_363
loop_361:
	tge	%icc,	0x7
loop_362:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_364
loop_363:
	fmovdul	%fcc0,	%f8,	%f20
	call	loop_365
	call	loop_366
loop_364:
	fnot1	%f22,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x939, 	%hsys_tick_cmpr
loop_365:
	std	%f26,	[%l7 + 0x28]
loop_366:
	tcs	%icc,	0x7
	fmovrslez	%o0,	%f31,	%f31
	addccc	%g1,	0x08CD,	%g4
	call	loop_367
	fandnot2	%f4,	%f28,	%f18
	nop
	setx	0x55814C990C9B5086,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE9238D73FFE73326,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f12
	fnegd	%f24,	%f28
loop_367:
	subc	%l6,	0x0C33,	%i3
	tsubcctv	%g6,	0x0FDF,	%l4
	call	loop_368
	fmovsle	%fcc2,	%f7,	%f26
	call	loop_369
	edge32n	%i5,	%g2,	%o4
loop_368:
	nop
	set	0x32, %g1
	ldsha	[%l7 + %g1] 0x89,	%g5
loop_369:
	fbl,pt	%fcc1,	loop_370
	call	loop_371
	fmovscc	%xcc,	%f20,	%f5
	call	loop_372
loop_370:
	tne	%xcc,	0x2
loop_371:
	fmovsa	%fcc0,	%f19,	%f24
	call	loop_373
loop_372:
	rd	%asi,	%l0
	fcmps	%fcc0,	%f18,	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_373:
	andncc	%o1,	%o6,	%l5
	fpmerge	%f26,	%f28,	%f30
	edge8n	%o2,	%o7,	%l2
	call	loop_374
	alignaddr	%g7,	%i0,	%i6
	edge16n	%i4,	%g3,	%i7
	tneg	%xcc,	0x6
loop_374:
	siam	0x4
	brz,pt	%l3,	loop_375
	fmovdleu	%xcc,	%f20,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x263, 	%hsys_tick_cmpr
	fmovsvc	%icc,	%f2,	%f4
loop_375:
	movrlez	%o0,	0x2C1,	%i1
	call	loop_376
	call	loop_377
	bn,a,pt	%icc,	loop_378
	fcmpeq32	%f14,	%f18,	%g1
loop_376:
	movvs	%icc,	0x6A1,	%l6
loop_377:
	call	loop_379
loop_378:
	fsrc2	%f26,	%f4
	fmovslg	%fcc3,	%f18,	%f5
	membar	0x1A
loop_379:
	call	loop_380
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8BE, 	%hsys_tick_cmpr
	call	loop_381
loop_380:
	rd	%fprs,	%l4
	fmovdpos	%xcc,	%f28,	%f14
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f26
loop_381:
	rdpr	%cwp,	%g4
	smul	%i5,	0x1394,	%g2
	fpsub16s	%f6,	%f12,	%f11
	array8	%o4,	%l0,	%g5
	movule	%fcc1,	%i2,	%o1
	movrlez	%o6,	%o3,	%l5
	call	loop_382
	fpack32	%f26,	%f28,	%f0
	srlx	%o2,	%o7,	%l2
	bcc,a	%icc,	loop_383
loop_382:
	add	%i0,	%g7,	%i4
	call	loop_384
	call	loop_385
loop_383:
	movle	%fcc3,	%g3,	%i6
	nop
	setx	0x16D503E792BA99A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB7F892B5A6F17210,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f22,	%f24
loop_384:
	lduh	[%l7 + 0x32],	%i7
loop_385:
	fmovrdne	%l3,	%f14,	%f22
	call	loop_386
	fblg	%fcc2,	loop_387
	fbuge,a	%fcc2,	loop_388
	fmovsn	%fcc3,	%f23,	%f27
loop_386:
	call	loop_389
loop_387:
	fpadd32	%f14,	%f14,	%f20
loop_388:
	sethi	0x0A6A,	%l1
	orcc	%o0,	0x0E47,	%i1
loop_389:
	call	loop_390
	call	loop_391
	fmovsleu	%icc,	%f14,	%f22
	edge16l	%o5,	%g1,	%l6
loop_390:
	call	loop_392
loop_391:
	tsubcc	%i3,	%g6,	%g4
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc5
loop_392:
	fpadd16s	%f16,	%f4,	%f1
	srlx	%i5,	%l4,	%g2
	call	loop_393
	fmovslg	%fcc3,	%f30,	%f20
	fmul8x16au	%f14,	%f21,	%f26
	call	loop_394
loop_393:
	fmovsvc	%xcc,	%f3,	%f4
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x4E] %asi
loop_394:
	movrlz	%g5,	0x3D1,	%o4
	tcs	%xcc,	0x4
	sllx	%o1,	0x14,	%o6
	movg	%fcc0,	0x421,	%o3
	bl,a	%icc,	loop_395
	fblg,pt	%fcc3,	loop_396
	tvs	%xcc,	0x6
	fmovsle	%fcc1,	%f27,	%f20
loop_395:
	brgez,a,pn	%l5,	loop_397
loop_396:
	array8	%o2,	%i2,	%o7
	call	loop_398
	tneg	%xcc,	0x6
loop_397:
	fnot1s	%f16,	%f11
	fmovdug	%fcc1,	%f26,	%f30
loop_398:
	tvc	%icc,	0x5
	call	loop_399
	ldd	[%l7 + 0x18],	%i0
	tcs	%xcc,	0x1
	movo	%fcc2,	0x289,	%g7
loop_399:
	fmovdo	%fcc1,	%f14,	%f8
	fmovdleu	%xcc,	%f16,	%f8
	fmovdl	%fcc1,	%f0,	%f2
	tne	%icc,	0x4
	nop
	fitod	%f2,	%f16
	fdtoi	%f16,	%f31
	call	loop_400
	call	loop_401
	umulcc	%l2,	0x0C7E,	%g3
	addccc	%i6,	%i7,	%l3
loop_400:
	fbuge,a,pn	%fcc3,	loop_402
loop_401:
	fpackfix	%f2,	%f26
	rdpr	%cwp,	%i4
	smul	%l1,	%i1,	%o0
loop_402:
	fcmpes	%fcc2,	%f15,	%f4
	rd	%softint,	%o5
	nop
	fitod	%f4,	%f30
	fnors	%f17,	%f8,	%f24
	stx	%g1,	[%l7 + 0x10]
	fornot1s	%f23,	%f23,	%f13
	wr	%g0,	0xda,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	std	%i2,	[%l7 + 0x10]
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%g6
	call	loop_403
	call	loop_404
	movge	%icc,	0x7C1,	%l6
	wr	%g0,	0x89,	%asi
	stwa	%g4,	[%l7 + 0x58] %asi
loop_403:
	call	loop_405
loop_404:
	call	loop_406
	nop
	fitos	%f18,	%f9
	fmul8x16	%f20,	%f22,	%f28
loop_405:
	fnor	%f12,	%f10,	%f22
loop_406:
	fmovsul	%fcc1,	%f25,	%f12
	movleu	%xcc,	%l4,	%i5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rdpr	%cwp,	%l0
	fxnor	%f14,	%f28,	%f20
	fmovsne	%fcc1,	%f17,	%f12
	call	loop_407
	nop
	fitos	%f24,	%f5
	call	loop_408
	ba,a,pn	%xcc,	loop_409
loop_407:
	bcc,pn	%xcc,	loop_410
	fcmped	%fcc1,	%f0,	%f22
loop_408:
	call	loop_411
loop_409:
	call	loop_412
loop_410:
	movvs	%xcc,	0x2C7,	%g5
	fmovsul	%fcc3,	%f8,	%f24
loop_411:
	edge8ln	%o4,	%o1,	%g2
loop_412:
	udivx	%o3,	%l5,	%o6
	fmovdvs	%xcc,	%f0,	%f14
	call	loop_413
	call	loop_414
	xnor	%i2,	0x01E8,	%o7
	and	%i0,	0x1A3E,	%g7
loop_413:
	edge8l	%o2,	%g3,	%i6
loop_414:
	fmovdue	%fcc3,	%f16,	%f20
	call	loop_415
	fmovd	%f28,	%f24
	movue	%fcc2,	0x5F0,	%i7
	fmovsg	%xcc,	%f9,	%f26
loop_415:
	nop
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x0c,	%f16
	fmul8x16	%f6,	%f10,	%f26
	call	loop_416
	fnands	%f2,	%f25,	%f5
	move	%fcc2,	0x06C,	%l3
	taddcctv	%l2,	0x03F0,	%l1
loop_416:
	prefetch	[%l7 + 0x14],	 2
	call	loop_417
	call	loop_418
	call	loop_419
	fmovdge	%xcc,	%f28,	%f24
loop_417:
	rd	%sys_tick_cmpr,	%i4
loop_418:
	fbl,a,pt	%fcc1,	loop_420
loop_419:
	fbn,a	%fcc3,	loop_421
	fzero	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_420:
	fcmpd	%fcc2,	%f26,	%f28
loop_421:
	fpsub32	%f22,	%f12,	%f8
	fba,a,pt	%fcc3,	loop_422
	umulcc	%o5,	0x1C11,	%g1
	call	loop_423
	srl	%i3,	%i1,	%l6
loop_422:
	fbo,a	%fcc3,	loop_424
	bvs,a	%xcc,	loop_425
loop_423:
	call	loop_426
	call	loop_427
loop_424:
	and	%g4,	%l4,	%i5
loop_425:
	fmovso	%fcc2,	%f8,	%f28
loop_426:
	fnot2s	%f24,	%f1
loop_427:
	te	%icc,	0x5
	flushw
	movug	%fcc0,	0x792,	%l0
	fmovsg	%xcc,	%f4,	%f18
	addcc	%g6,	%g5,	%o1
	edge8l	%o4,	%g2,	%l5
	brgez,pt	%o6,	loop_428
	fmovdn	%fcc1,	%f24,	%f0
	call	loop_429
	fmovduge	%fcc0,	%f12,	%f10
loop_428:
	movul	%fcc3,	0x5E1,	%i2
	sdivx	%o7,	0x00,	%o3
loop_429:
	fmovsgu	%icc,	%f10,	%f2
	movpos	%xcc,	0x4B2,	%i0
	ta	%xcc,	0x6
	ldsw	[%l7 + 0x10],	%o2
	fpadd32	%f28,	%f18,	%f22
	rd	%asi,	%g3
	fmovsue	%fcc1,	%f25,	%f15
	call	loop_430
	call	loop_431
	call	loop_432
	fcmps	%fcc1,	%f9,	%f31
loop_430:
	fnot2	%f2,	%f22
loop_431:
	call	loop_433
loop_432:
	fnot1	%f12,	%f0
	fmul8sux16	%f30,	%f20,	%f4
	fzero	%f2
loop_433:
	fpadd16	%f18,	%f16,	%f26
	call	loop_434
	fnot2s	%f23,	%f31
	movcs	%icc,	0x76A,	%i6
	fnot1s	%f23,	%f29
loop_434:
	sllx	%i7,	0x10,	%l3
	fcmple32	%f30,	%f10,	%g7
	nop
	fitod	%f6,	%f24
	fdtos	%f24,	%f9
	fblg	%fcc3,	loop_435
	movre	%l2,	%i4,	%l1
	ld	[%l7 + 0x34],	%f10
	wrpr	%o5,	%o0,	%cwp
loop_435:
	fpadd16	%f20,	%f18,	%f0
	call	loop_436
	wrpr	%i3,	%g1,	%cwp
	movo	%fcc1,	0x222,	%l6
	call	loop_437
loop_436:
	fmovsue	%fcc2,	%f22,	%f28
	fmul8x16al	%f8,	%f14,	%f10
	call	loop_438
loop_437:
	call	loop_439
	call	loop_440
	movne	%fcc1,	%i1,	%g4
loop_438:
	fornot1s	%f24,	%f9,	%f11
loop_439:
	fnor	%f12,	%f2,	%f16
loop_440:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 27
!	Type a   	: 29
!	Type x   	: 11
!	Type cti   	: 145
!	Type f   	: 142
!	Type i   	: 146
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
	set	0x2,	%g2
	set	0x9,	%g3
	set	0xE,	%g4
	set	0xD,	%g5
	set	0xA,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xF,	%i1
	set	-0xA,	%i2
	set	-0x5,	%i3
	set	-0xB,	%i4
	set	-0xC,	%i5
	set	-0xD,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x30E9FD27,	%l0
	set	0x01080A0B,	%l1
	set	0x005B28FA,	%l2
	set	0x23BB0BF8,	%l3
	set	0x1A10A307,	%l4
	set	0x486EDCBC,	%l5
	set	0x6FFEE74C,	%l6
	!# Output registers
	set	0x147D,	%o0
	set	-0x0733,	%o1
	set	0x0477,	%o2
	set	0x12C7,	%o3
	set	0x1791,	%o4
	set	-0x1BED,	%o5
	set	-0x1990,	%o6
	set	-0x09C0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	call	loop_441
	movue	%fcc3,	0x22A,	%l4
	movvs	%xcc,	%i5,	%l0
	fzeros	%f11
loop_441:
	call	loop_442
	movu	%fcc2,	0x108,	%g6
	fexpand	%f2,	%f6
	movrlez	%g5,	0x1CF,	%o1
loop_442:
	call	loop_443
	fmul8ulx16	%f4,	%f24,	%f26
	fones	%f24
	call	loop_444
loop_443:
	alignaddrl	%g2,	%l5,	%o4
	call	loop_445
	movrlz	%i2,	%o6,	%o7
loop_444:
	rdpr	%gl,	%o3
	fmovs	%f0,	%f17
loop_445:
	tcc	%xcc,	0x2
	rdpr	%cleanwin,	%o2
	fnot1	%f14,	%f28
	subcc	%g3,	0x084E,	%i0
	udivx	%i7,	%l3,	%g7
	fnegs	%f30,	%f5
	fabsd	%f26,	%f14
	fcmped	%fcc0,	%f4,	%f8
	rdpr	%cleanwin,	%i6
	fmuld8ulx16	%f13,	%f30,	%f28
	call	loop_446
	fpadd32	%f6,	%f16,	%f12
	edge16l	%i4,	%l2,	%o5
	fornot2	%f4,	%f4,	%f28
loop_446:
	call	loop_447
	call	loop_448
	call	loop_449
	fand	%f10,	%f8,	%f10
loop_447:
	faligndata	%f30,	%f6,	%f12
loop_448:
	sll	%l1,	0x08,	%i3
loop_449:
	mova	%xcc,	0x273,	%o0
	call	loop_450
	call	loop_451
	edge32ln	%g1,	%i1,	%g4
	nop
	setx loop_452, %l0, %l1
	jmpl %l1, %l4
loop_450:
	tn	%xcc,	0x2
loop_451:
	rdpr	%cleanwin,	%i5
	call	loop_453
loop_452:
	fmovrsgez	%l0,	%f29,	%f0
	rd	%softint,	%l6
	nop
	set	0x24, %i6
	stw	%g5,	[%l7 + %i6]
loop_453:
	nop
	setx	0x51A780C670EF82A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xD81ABBE38929927A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f2,	%f2
	rdpr	%wstate,	%g6
	fcmpne16	%f0,	%f12,	%o1
	xorcc	%l5,	0x057C,	%g2
	fmovsg	%icc,	%f27,	%f31
	fmovscc	%icc,	%f7,	%f1
	call	loop_454
	movcs	%icc,	%o4,	%o6
	call	loop_455
	movrgez	%o7,	%i2,	%o3
loop_454:
	call	loop_456
	call	loop_457
loop_455:
	movcc	%icc,	0x4EB,	%g3
	fmovrslez	%i0,	%f3,	%f18
loop_456:
	fnand	%f28,	%f10,	%f22
loop_457:
	call	loop_458
	fors	%f29,	%f1,	%f15
	fmovsgu	%xcc,	%f16,	%f16
	udiv	%o2,	%l3,	%i7
loop_458:
	nop
	setx	0x789F5DF59FB15D30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF074F135FE30CE0C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f28
	call	loop_459
	movcc	%xcc,	0x5FD,	%g7
	call	loop_460
	wr	%i6,	%i4,	%softint
loop_459:
	wrpr	%l2,	0x0708,	%tick
	udivcc	%o5,	0x00,	%i3
loop_460:
	call	loop_461
	fpsub32	%f30,	%f26,	%f2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o0
loop_461:
	fornot2	%f16,	%f20,	%f20
	fnor	%f12,	%f20,	%f22
	call	loop_462
	call	loop_463
	call	loop_464
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_462:
	rd	%ccr,	%g1
loop_463:
	ldstub	[%l7 + 0x40],	%l1
loop_464:
	call	loop_465
	nop
	setx	0x4CBAF5EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x5BBFF3BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f10,	%f12
	fmovrde	%g4,	%f26,	%f18
	call	loop_466
loop_465:
	call	loop_467
	tne	%icc,	0x4
	fmovsuge	%fcc2,	%f16,	%f21
loop_466:
	brlz,pt	%l4,	loop_468
loop_467:
	nop
	setx loop_469, %l0, %l1
	jmpl %l1, %i5
	fpadd32	%f0,	%f4,	%f20
	rd	%ccr,	%i1
loop_468:
	fone	%f2
loop_469:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sdiv	%l6,	%l0,	%g5
	rdhpr	%hsys_tick_cmpr,	%g6
	call	loop_470
	fandnot2	%f24,	%f24,	%f26
	fbne,pn	%fcc0,	loop_471
	fmovdneg	%xcc,	%f30,	%f16
loop_470:
	fbg,a	%fcc0,	loop_472
	sdivx	%o1,	0x00,	%l5
loop_471:
	bvs,a,pn	%icc,	loop_473
	rd	%pc,	%g2
loop_472:
	call	loop_474
	taddcctv	%o4,	%o7,	%i2
loop_473:
	fsrc2	%f6,	%f10
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x64] %asi,	%f10
loop_474:
	nop
	setx	0xEAB48402E8A3771E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x413AD098,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f24,	%f0
	fcmpes	%fcc0,	%f18,	%f15
	edge32	%o3,	%o6,	%i0
	edge8l	%g3,	%l3,	%i7
	edge32l	%g7,	%o2,	%i4
	fcmpeq32	%f22,	%f20,	%i6
	sub	%l2,	0x0009,	%i3
	call	loop_475
	call	loop_476
	call	loop_477
	fmovrslz	%o5,	%f16,	%f21
loop_475:
	alignaddrl	%o0,	%g1,	%g4
loop_476:
	ldd	[%l7 + 0x30],	%l0
loop_477:
	fmuld8ulx16	%f16,	%f15,	%f24
	fcmps	%fcc0,	%f21,	%f11
	fmovrdgez	%l4,	%f12,	%f22
	rdpr	%gl,	%i1
	fpackfix	%f20,	%f9
	umul	%l6,	0x150D,	%l0
	call	loop_478
	wr	%g5,	0x1CC5,	%ccr
	sir	0x0BF1
	call	loop_479
loop_478:
	call	loop_480
	call	loop_481
	fpadd32s	%f21,	%f17,	%f18
loop_479:
	fsrc1	%f30,	%f16
loop_480:
	ldstub	[%l7 + 0x26],	%i5
loop_481:
	taddcc	%o1,	0x1C3E,	%g6
	nop
	setx	0x5D2B079F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f17
	call	loop_482
	movue	%fcc0,	0x4B2,	%g2
	sir	0x1573
	fmovdule	%fcc3,	%f6,	%f0
loop_482:
	call	loop_483
	call	loop_484
	call	loop_485
	fors	%f10,	%f3,	%f27
loop_483:
	call	loop_486
loop_484:
	tn	%xcc,	0x5
loop_485:
	fsrc1s	%f13,	%f27
	udiv	%o4,	%l5,	%o7
loop_486:
	movvc	%icc,	%i2,	%o6
	fmovrse	%i0,	%f11,	%f17
	fandnot1s	%f7,	%f23,	%f14
	fors	%f11,	%f27,	%f28
	call	loop_487
	andcc	%g3,	0x0933,	%o3
	fsrc1s	%f8,	%f0
	tle	%xcc,	0x3
loop_487:
	fpadd16s	%f12,	%f27,	%f1
	fmovsle	%icc,	%f30,	%f30
	fbule	%fcc3,	loop_488
	call	loop_489
	xorcc	%l3,	%g7,	%i7
	edge8n	%o2,	%i4,	%i6
loop_488:
	call	loop_490
loop_489:
	wrpr	%l2,	0x1405,	%tick
	orcc	%o5,	%o0,	%g1
	call	loop_491
loop_490:
	nop
	setx	0xC8F904C16A6BF979,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x64] %asi,	%i3
loop_491:
	alignaddr	%l1,	%l4,	%i1
	array8	%g4,	%l0,	%g5
	rdhpr	%hsys_tick_cmpr,	%l6
	fsrc1s	%f28,	%f11
	and	%o1,	0x0664,	%g6
	call	loop_492
	call	loop_493
	andcc	%i5,	0x01E6,	%g2
	call	loop_494
loop_492:
	bcc,pn	%xcc,	loop_495
loop_493:
	movl	%icc,	0x277,	%l5
	fbn	%fcc2,	loop_496
loop_494:
	call	loop_497
loop_495:
	ta	%icc,	0x4
	udivcc	%o7,	%i2,	%o4
loop_496:
	call	loop_498
loop_497:
	call	loop_499
	fmovsn	%fcc0,	%f29,	%f21
	movne	%icc,	0x36B,	%i0
loop_498:
	fmovdgu	%xcc,	%f26,	%f0
loop_499:
	wr	%o6,	0x0C1E,	%sys_tick
	call	loop_500
	fmovdlg	%fcc3,	%f6,	%f8
	call	loop_501
	bleu,a,pn	%icc,	loop_502
loop_500:
	call	loop_503
	fble,a,pn	%fcc3,	loop_504
loop_501:
	edge16	%g3,	%o3,	%l3
loop_502:
	addc	%g7,	0x1760,	%i7
loop_503:
	wrpr	%i4,	0x1CBB,	%pil
loop_504:
	sethi	0x1685,	%i6
	fbuge,a	%fcc2,	loop_505
	fbe,pt	%fcc1,	loop_506
	call	loop_507
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 2
loop_505:
	nop
	wr	%g0,	0x2a,	%asi
	stwa	%o2,	[%l7 + 0x40] %asi
	membar	#Sync
loop_506:
	fmovsul	%fcc1,	%f26,	%f23
loop_507:
	fmovsl	%xcc,	%f10,	%f12
	rd	%fprs,	%o5
	call	loop_508
	fnors	%f24,	%f31,	%f4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fnot1	%f6,	%f6
loop_508:
	call	loop_509
	fmovdl	%fcc0,	%f2,	%f14
	call	loop_510
	sra	%o0,	%g1,	%l2
loop_509:
	fmovrslz	%l1,	%f26,	%f18
	edge32ln	%i3,	%l4,	%g4
loop_510:
	fzeros	%f0
	tpos	%xcc,	0x4
	fmovrslz	%i1,	%f12,	%f2
	pdist	%f16,	%f30,	%f20
	orncc	%l0,	%g5,	%l6
	call	loop_511
	brlz	%g6,	loop_512
	movrlez	%i5,	%g2,	%l5
	sir	0x082A
loop_511:
	call	loop_513
loop_512:
	call	loop_514
	call	loop_515
	fmovrdlez	%o1,	%f26,	%f2
loop_513:
	movre	%o7,	0x030,	%i2
loop_514:
	orcc	%i0,	%o6,	%g3
loop_515:
	tsubcc	%o4,	%o3,	%g7
	fmovsne	%icc,	%f7,	%f25
	movrlez	%l3,	%i4,	%i7
	fpadd32s	%f19,	%f28,	%f2
	membar	0x43
	fmovs	%f15,	%f28
	call	loop_516
	stx	%o2,	[%l7 + 0x70]
	sdiv	%i6,	%o0,	%o5
	ld	[%l7 + 0x68],	%f22
loop_516:
	call	loop_517
	call	loop_518
	fmovrsgz	%g1,	%f8,	%f12
	movleu	%icc,	%l1,	%i3
loop_517:
	fmovslg	%fcc2,	%f24,	%f9
loop_518:
	fba,a,pn	%fcc1,	loop_519
	tsubcc	%l2,	0x1F67,	%g4
	tpos	%xcc,	0x1
	bmask	%l4,	%l0,	%i1
loop_519:
	call	loop_520
	tsubcc	%l6,	%g6,	%i5
	movo	%fcc0,	%g5,	%l5
	orncc	%g2,	0x0450,	%o7
loop_520:
	fandnot2	%f10,	%f8,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x754, 	%hsys_tick_cmpr
	fmovrdgez	%i0,	%f28,	%f2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovslg	%fcc0,	%f20,	%f16
	mova	%xcc,	%o6,	%g3
	nop
	setx	0x6ED4E408D318DF35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x35C555A625E950DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f0,	%f26
	ta	%icc,	0x0
	call	loop_521
	movge	%icc,	%i2,	%o3
	bpos	%icc,	loop_522
	rdpr	%cwp,	%g7
loop_521:
	call	loop_523
	nop
	setx	0xFA8A24196FDE4107,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xFAA70A08AA8EE450,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f8,	%f24
loop_522:
	fmovsge	%fcc2,	%f19,	%f24
	fmovrsgez	%o4,	%f13,	%f13
loop_523:
	movcc	%xcc,	%l3,	%i4
	edge8l	%o2,	%i7,	%i6
	call	loop_524
	or	%o0,	%g1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x406, 	%hsys_tick_cmpr
	tneg	%icc,	0x4
loop_524:
	fcmped	%fcc2,	%f30,	%f2
	fornot2	%f14,	%f8,	%f22
	call	loop_525
	fxnor	%f2,	%f30,	%f28
	call	loop_526
	fnot2	%f6,	%f10
loop_525:
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f26
	call	loop_527
loop_526:
	sllx	%l2,	%l4,	%g4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fcmpne32	%f24,	%f22,	%l0
loop_527:
	fnot2	%f26,	%f18
	nop
	setx	loop_528,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034400001406,	%l0,	%l1
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
	fcmple32	%f6,	%f2,	%l6
	rdpr	%gl,	%g6
	fmovsle	%xcc,	%f17,	%f7
loop_528:
	call	loop_529
	fmovsgu	%xcc,	%f24,	%f26
	rdhpr	%hsys_tick_cmpr,	%i5
	fmovdvc	%xcc,	%f28,	%f24
loop_529:
	edge32l	%g5,	%i1,	%l5
	movle	%fcc1,	0x35A,	%g2
	call	loop_530
	fcmpd	%fcc0,	%f22,	%f26
	sdiv	%o1,	%o7,	%o6
	fmovrdlz	%g3,	%f20,	%f20
loop_530:
	call	loop_531
	rdhpr	%hsys_tick_cmpr,	%i0
	call	loop_532
	wr	%o3,	%g7,	%y
loop_531:
	wr	%o4,	%l3,	%set_softint
	flushw
loop_532:
	nop
	set	0x34, %i2
	prefetch	[%l7 + %i2],	 2
	fmul8sux16	%f26,	%f4,	%f24
	call	loop_533
	call	loop_534
	stx	%i2,	[%l7 + 0x18]
	te	%xcc,	0x4
loop_533:
	taddcc	%o2,	0x1568,	%i4
loop_534:
	call	loop_535
	call	loop_536
	call	loop_537
	fmovdvs	%xcc,	%f12,	%f18
loop_535:
	be,a	%xcc,	loop_538
loop_536:
	call	loop_539
loop_537:
	movug	%fcc3,	0x575,	%i6
	call	loop_540
loop_538:
	fmovdu	%fcc3,	%f20,	%f16
loop_539:
	fba,pt	%fcc0,	loop_541
	fornot1s	%f19,	%f19,	%f6
loop_540:
	fmovdcs	%xcc,	%f16,	%f4
	fmovsneg	%icc,	%f11,	%f9
loop_541:
	nop
	setx	0x5818BD63,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f16
	call	loop_542
	te	%xcc,	0x4
	rd	%pc,	%i7
	fmovsl	%xcc,	%f2,	%f14
loop_542:
	fbule	%fcc1,	loop_543
	array8	%g1,	%o0,	%o5
	fsrc2	%f4,	%f0
	srax	%i3,	%l1,	%l2
loop_543:
	call	loop_544
	fmovrslz	%l4,	%f9,	%f19
	call	loop_545
	fmul8x16au	%f12,	%f15,	%f10
loop_544:
	movuge	%fcc0,	0x010,	%l0
	fabsd	%f18,	%f14
loop_545:
	nop
	fitos	%f1,	%f30
	fstod	%f30,	%f20
	call	loop_546
	call	loop_547
	edge8l	%l6,	%g4,	%i5
	fmovsvc	%xcc,	%f4,	%f11
loop_546:
	array16	%g6,	%g5,	%i1
loop_547:
	movleu	%xcc,	0x778,	%l5
	swap	[%l7 + 0x5C],	%g2
	fmul8sux16	%f14,	%f24,	%f26
	array16	%o1,	%o6,	%o7
	tneg	%xcc,	0x6
	bmask	%g3,	%i0,	%o3
	fmovsu	%fcc2,	%f28,	%f0
	call	loop_548
	fmovdvc	%xcc,	%f18,	%f0
	call	loop_549
	nop
	set	0x14, %l1
	ldsh	[%l7 + %l1],	%g7
loop_548:
	fxnor	%f0,	%f10,	%f6
	fmovrsgz	%l3,	%f5,	%f14
loop_549:
	call	loop_550
	fbge,pt	%fcc3,	loop_551
	addccc	%i2,	%o4,	%i4
	call	loop_552
loop_550:
	tsubcctv	%i6,	0x0120,	%i7
loop_551:
	umulcc	%o2,	%o0,	%g1
	subc	%o5,	0x0E9A,	%i3
loop_552:
	fmovsn	%icc,	%f13,	%f25
	call	loop_553
	te	%icc,	0x1
	rdhpr	%hpstate,	%l2
	fmovsne	%fcc1,	%f16,	%f31
loop_553:
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f28
	taddcc	%l1,	%l0,	%l4
	fcmpeq32	%f24,	%f14,	%l6
	call	loop_554
	call	loop_555
	nop
	setx	0xBFAC44022B661E23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF4B88DD2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f12,	%f18
	nop
	setx	0xAA617FDEA9B8515B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x49DB9BE276719B6A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f20,	%f6
loop_554:
	bge,pt	%icc,	loop_556
loop_555:
	orn	%i5,	0x0426,	%g4
	fmovdue	%fcc2,	%f0,	%f8
	srlx	%g5,	0x0B,	%i1
loop_556:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_557
	fmovsa	%fcc2,	%f7,	%f21
	movo	%fcc1,	%l5,	%g6
	nop
	setx	0x1666BBBA1051D4C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f22
loop_557:
	call	loop_558
	brlez,pn	%g2,	loop_559
	nop
	setx	0xA4543885E198939E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x707131C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f16,	%f20
	xnorcc	%o6,	%o1,	%o7
loop_558:
	nop
	set	0x1C, %l0
	stw	%g3,	[%l7 + %l0]
loop_559:
	nop
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe3,	%i0
	fxnors	%f6,	%f26,	%f8
	call	loop_560
	rdhpr	%hintp,	%o3
	wrpr	%g7,	0x057B,	%tick
	movgu	%xcc,	%i2,	%o4
loop_560:
	call	loop_561
	call	loop_562
	call	loop_563
	call	loop_564
loop_561:
	orcc	%l3,	%i6,	%i7
loop_562:
	call	loop_565
loop_563:
	movuge	%fcc3,	0x3E3,	%o2
loop_564:
	call	loop_566
	call	loop_567
loop_565:
	ta	%xcc,	0x3
	tsubcc	%o0,	0x04A5,	%g1
loop_566:
	st	%f15,	[%l7 + 0x48]
loop_567:
	tvc	%icc,	0x5
	call	loop_568
	call	loop_569
	fandnot1	%f20,	%f28,	%f18
	fmovdgu	%xcc,	%f8,	%f8
loop_568:
	and	%i4,	0x1F99,	%i3
loop_569:
	movge	%fcc0,	0x779,	%l2
	call	loop_570
	add	%l1,	0x097D,	%l0
	movvs	%icc,	%l4,	%o5
	membar	0x37
loop_570:
	array32	%i5,	%l6,	%g4
	fnors	%f21,	%f1,	%f9
	rd	%fprs,	%g5
	nop
	fitos	%f5,	%f13
	fstox	%f13,	%f30
	fxtos	%f30,	%f31
	fsrc1	%f30,	%f12
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x10,	%l5
	fmovsgu	%xcc,	%f8,	%f21
	movrlz	%i1,	%g6,	%g2
	srax	%o6,	0x17,	%o1
	call	loop_571
	bne,a	%xcc,	loop_572
	call	loop_573
	mulscc	%g3,	%o7,	%i0
loop_571:
	call	loop_574
loop_572:
	call	loop_575
loop_573:
	add	%o3,	%i2,	%g7
	faligndata	%f20,	%f4,	%f0
loop_574:
	call	loop_576
loop_575:
	movcs	%xcc,	%l3,	%o4
	fmovsn	%fcc0,	%f13,	%f3
	fbl,a	%fcc2,	loop_577
loop_576:
	sdiv	%i7,	%i6,	%o0
	nop
	set	0x6E, %o0
	lduh	[%l7 + %o0],	%o2
	nop
	set	0x28, %g4
	std	%g0,	[%l7 + %g4]
loop_577:
	faligndata	%f20,	%f28,	%f10
	movvc	%xcc,	%i3,	%i4
	sll	%l1,	%l0,	%l2
	wrpr	%l4,	0x0487,	%cwp
	srl	%i5,	0x02,	%l6
	tvc	%xcc,	0x4
	edge32ln	%g4,	%g5,	%l5
	rd	%tick_cmpr,	%o5
	fpmerge	%f2,	%f10,	%f18
	orcc	%i1,	%g2,	%o6
	fmovsleu	%xcc,	%f24,	%f13
	call	loop_578
	fmovdcc	%xcc,	%f28,	%f24
	fones	%f20
	call	loop_579
loop_578:
	fmovrsgz	%g6,	%f20,	%f24
	call	loop_580
	te	%xcc,	0x6
loop_579:
	wrpr	%o1,	0x00A0,	%cwp
	movn	%fcc3,	0x420,	%g3
loop_580:
	fbge,a	%fcc1,	loop_581
	edge32l	%o7,	%i0,	%o3
	st	%f29,	[%l7 + 0x24]
	rdhpr	%hpstate,	%i2
loop_581:
	fmovdneg	%icc,	%f24,	%f30
	nop
	set	0x29, %i4
	ldsb	[%l7 + %i4],	%l3
	tneg	%xcc,	0x0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0xEADFBA37,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD0E6FD79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f11,	%f11
	movug	%fcc1,	%o4,	%i7
	rdpr	%otherwin,	%g7
	brlz	%o0,	loop_582
	wr	%o2,	%g1,	%sys_tick
	ldx	[%l7 + 0x50],	%i6
	call	loop_583
loop_582:
	fpadd32	%f10,	%f8,	%f4
	nop
	setx	0x57FB911AE7F926BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f10
	fnot1s	%f20,	%f5
loop_583:
	or	%i4,	0x12C5,	%i3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 26
!	Type a   	: 38
!	Type x   	: 6
!	Type cti   	: 143
!	Type f   	: 142
!	Type i   	: 145
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
	set	0xD,	%g1
	set	0x6,	%g2
	set	0x5,	%g3
	set	0x3,	%g4
	set	0x4,	%g5
	set	0x3,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xE,	%i1
	set	-0x5,	%i2
	set	-0x3,	%i3
	set	-0xE,	%i4
	set	-0x0,	%i5
	set	-0x4,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x4AB1CEF3,	%l0
	set	0x5A966B17,	%l1
	set	0x3D6021B4,	%l2
	set	0x5EDC131A,	%l3
	set	0x55FA26AC,	%l4
	set	0x26CF2701,	%l5
	set	0x3D572606,	%l6
	!# Output registers
	set	-0x134A,	%o0
	set	0x1487,	%o1
	set	0x1921,	%o2
	set	0x1164,	%o3
	set	-0x109E,	%o4
	set	-0x1902,	%o5
	set	0x142E,	%o6
	set	-0x0ABA,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	sra	%l1,	0x03,	%l2
	call	loop_584
	fornot2s	%f2,	%f2,	%f20
	call	loop_585
	fmovdge	%icc,	%f4,	%f18
loop_584:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x93F, 	%hsys_tick_cmpr
	fmovdpos	%icc,	%f26,	%f22
loop_585:
	fmovrsgz	%l6,	%f6,	%f26
	call	loop_586
	fcmpeq16	%f16,	%f16,	%l4
	call	loop_587
	fmovdvs	%icc,	%f0,	%f28
loop_586:
	call	loop_588
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_587:
	fbue,a	%fcc0,	loop_589
	nop
	setx	0xF9AF82D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_588:
	call	loop_590
	fmovdo	%fcc0,	%f10,	%f0
loop_589:
	fmul8x16al	%f21,	%f22,	%f20
	fands	%f4,	%f7,	%f24
loop_590:
	movug	%fcc0,	%g5,	%l5
	tneg	%xcc,	0x7
	fmovsle	%xcc,	%f24,	%f4
	call	loop_591
	fcmpne16	%f20,	%f4,	%o5
	fmovse	%fcc0,	%f12,	%f24
	call	loop_592
loop_591:
	nop
	setx	0x411E94E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f28
	call	loop_593
	call	loop_594
loop_592:
	nop
	setx	0xAFA57FA313A39098,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xDAFC4FDE916DED73,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f0,	%f4
	fmovrsgez	%g4,	%f27,	%f7
loop_593:
	fmovrse	%g2,	%f30,	%f21
loop_594:
	rdpr	%wstate,	%o6
	rdhpr	%hsys_tick_cmpr,	%i1
	movvs	%icc,	%o1,	%g6
	call	loop_595
	fpsub16s	%f16,	%f18,	%f16
	set	0x3C, %i1
	stwa	%o7,	[%l7 + %i1] 0x23
	membar	#Sync
loop_595:
	movne	%icc,	0x27D,	%g3
	fmovsa	%fcc3,	%f28,	%f17
	fornot1s	%f29,	%f5,	%f1
	sth	%o3,	[%l7 + 0x34]
	bshuffle	%f6,	%f14,	%f4
	fnegd	%f6,	%f22
	call	loop_596
	fmul8ulx16	%f4,	%f8,	%f16
	smulcc	%i0,	0x0218,	%i2
	fmovsue	%fcc1,	%f27,	%f0
loop_596:
	call	loop_597
	tn	%xcc,	0x2
	rdhpr	%ver,	%o4
	movcc	%icc,	%l3,	%i7
loop_597:
	sdivx	%g7,	0x00,	%o0
	ba	%icc,	loop_598
	ldsb	[%l7 + 0x7A],	%o2
	fmovdvc	%xcc,	%f30,	%f6
	fmovdle	%fcc3,	%f8,	%f0
loop_598:
	nop
	set	0x30, %g2
	std	%g0,	[%l7 + %g2]
	fmovsa	%icc,	%f17,	%f9
	fxors	%f0,	%f20,	%f22
	popc	%i4,	%i6
	tsubcc	%l1,	%l2,	%l0
	call	loop_599
	call	loop_600
	alignaddrl	%i5,	%i3,	%l4
	movvs	%xcc,	0x4D7,	%g5
loop_599:
	alignaddr	%l5,	%o5,	%g4
loop_600:
	nop
	fitod	%f24,	%f28
	nop
	set	0x18, %l6
	lduw	[%l7 + %l6],	%g2
	fxors	%f21,	%f17,	%f7
	call	loop_601
	nop
	setx	0x1AD52E80,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x048E5768,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f5,	%f8
	xnor	%l6,	0x145F,	%o6
	call	loop_602
loop_601:
	add	%o1,	%g6,	%i1
	call	loop_603
	call	loop_604
loop_602:
	nop
	setx	0xE418C4A5FC16120E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x2722460BEB824EE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f18,	%f2
	movcs	%icc,	%o7,	%o3
loop_603:
	nop
	setx	0xAEE6701E68235503,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD7B0FE6A1EB5540B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f22
loop_604:
	ldsb	[%l7 + 0x1A],	%g3
	call	loop_605
	call	loop_606
	call	loop_607
	fmovscs	%icc,	%f6,	%f5
loop_605:
	fpsub16	%f20,	%f14,	%f28
loop_606:
	fmovsu	%fcc0,	%f7,	%f17
loop_607:
	alignaddrl	%i0,	%o4,	%l3
	movrlez	%i7,	%i2,	%o0
	call	loop_608
	tne	%xcc,	0x1
	set	0x50, %g7
	stwa	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
loop_608:
	fmovdvc	%icc,	%f10,	%f14
	alignaddr	%g7,	%g1,	%i4
	movg	%xcc,	0x08F,	%l1
	call	loop_609
	nop
	setx loop_610, %l0, %l1
	jmpl %l1, %l2
	movneg	%icc,	%i6,	%l0
	nop
	setx	0x0E9DA269CEE988B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF83C4B786A9DCE68,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f24,	%f16
loop_609:
	fcmpd	%fcc2,	%f4,	%f6
loop_610:
	tvc	%xcc,	0x6
	call	loop_611
	wr	%i5,	%l4,	%clear_softint
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x831, 	%sys_tick_cmpr
loop_611:
	fcmpes	%fcc0,	%f15,	%f25
	movne	%fcc0,	0x443,	%i3
	fmovsneg	%xcc,	%f20,	%f16
	fnot1	%f20,	%f0
	membar	0x2E

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x368, 	%hsys_tick_cmpr
	fblg,a	%fcc2,	loop_612
	call	loop_613
	call	loop_614
	fxnors	%f7,	%f14,	%f1
loop_612:
	call	loop_615
loop_613:
	andcc	%g4,	%o5,	%g2
loop_614:
	rdpr	%gl,	%l6
	fsrc1s	%f10,	%f11
loop_615:
	fxnors	%f23,	%f19,	%f6
	ba,pt	%xcc,	loop_616
	fpmerge	%f9,	%f4,	%f30
	fmul8sux16	%f2,	%f28,	%f2
	fble,a	%fcc0,	loop_617
loop_616:
	lduw	[%l7 + 0x40],	%o6
	bn,pn	%icc,	loop_618
	tvc	%xcc,	0x7
loop_617:
	srl	%g6,	%o1,	%o7
	edge8ln	%i1,	%o3,	%g3
loop_618:
	call	loop_619
	taddcctv	%o4,	%i0,	%l3
	fnot1	%f18,	%f30
	call	loop_620
loop_619:
	fmovrse	%i2,	%f28,	%f15
	fmovscc	%xcc,	%f2,	%f29
	fcmpgt16	%f16,	%f18,	%i7
loop_620:
	taddcctv	%o0,	0x0085,	%o2
	or	%g1,	0x0536,	%g7
	fand	%f6,	%f20,	%f0
	sllx	%l1,	%l2,	%i6
	andncc	%i4,	0x0D0E,	%i5
	movre	%l4,	%g5,	%l0
	movug	%fcc1,	0x46A,	%i3
	rdhpr	%ver,	%g4
	fmovdg	%fcc1,	%f18,	%f22
	fbule,a	%fcc0,	loop_621
	call	loop_622
	rd	%pc,	%l5
	movu	%fcc2,	0x24D,	%g2
loop_621:
	fmovrde	%l6,	%f12,	%f2
loop_622:
	movre	%o5,	%o6,	%g6
	wr	%o1,	%o7,	%pic
	nop
	set	0x1C, %o2
	flush	%l7 + %o2
	call	loop_623
	fmovrse	%i1,	%f9,	%f10
	rdhpr	%hintp,	%g3
	subcc	%o4,	0x0CB3,	%i0
loop_623:
	xnorcc	%l3,	%i2,	%o3
	fmovrdne	%i7,	%f2,	%f2
	fbuge	%fcc1,	loop_624
	rdpr	%cansave,	%o2
	call	loop_625
	fmovdul	%fcc0,	%f8,	%f0
loop_624:
	andn	%g1,	%g7,	%l1
	fmovdgu	%xcc,	%f10,	%f2
loop_625:
	tneg	%xcc,	0x4
	orcc	%l2,	%o0,	%i6
	call	loop_626
	fnot1s	%f16,	%f16
	wrpr	%i5,	%i4,	%tick
	fmovrde	%g5,	%f8,	%f0
loop_626:
	edge32n	%l4,	%i3,	%g4
	fpsub16	%f24,	%f6,	%f26
	call	loop_627
	rdhpr	%ver,	%l5
	call	loop_628
	fmovdle	%fcc2,	%f2,	%f20
loop_627:
	fmovdvs	%xcc,	%f0,	%f10
	nop
	set	0x38, %o7
	stw	%g2,	[%l7 + %o7]
loop_628:
	call	loop_629
	orncc	%l0,	0x1B78,	%o5
	wr	%l6,	%g6,	%y
	call	loop_630
loop_629:
	ble	%xcc,	loop_631
	fmovdleu	%xcc,	%f26,	%f18
	fmovdue	%fcc1,	%f0,	%f20
loop_630:
	alignaddr	%o1,	%o6,	%i1
loop_631:
	fmovsl	%fcc2,	%f18,	%f1
	rdhpr	%htba,	%g3
	call	loop_632
	call	loop_633
	call	loop_634
	fcmpgt16	%f18,	%f18,	%o4
loop_632:
	fnor	%f20,	%f12,	%f28
loop_633:
	movrgz	%o7,	0x2E8,	%i0
loop_634:
	call	loop_635
	call	loop_636
	call	loop_637
	call	loop_638
loop_635:
	add	%l3,	%o3,	%i2
loop_636:
	nop
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd0
loop_637:
	movrgz	%i7,	0x20B,	%g1
loop_638:
	fpadd16s	%f25,	%f30,	%f13
	call	loop_639
	movg	%fcc2,	%o2,	%g7
	edge32	%l1,	%l2,	%o0
	call	loop_640
loop_639:
	sdiv	%i6,	0x00,	%i5
	fnegd	%f8,	%f18
	udivx	%g5,	%i4,	%i3
loop_640:
	bcs,pn	%xcc,	loop_641
	call	loop_642
	movrgz	%l4,	0x1FB,	%l5
	orncc	%g4,	%l0,	%o5
loop_641:
	brgez	%g2,	loop_643
loop_642:
	call	loop_644
	tne	%icc,	0x1
	nop
	setx	0x5C03B32E52B7D2FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD11812B85665A54A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f12,	%f8
loop_643:
	nop
	setx	0x0FEDB585,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x791CDF21,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f30,	%f9
loop_644:
	brlz	%l6,	loop_645
	call	loop_646
	fnot1	%f14,	%f2
	tg	%icc,	0x4
loop_645:
	rd	%y,	%o1
loop_646:
	umulcc	%o6,	%i1,	%g3
	nop
	set	0x10, %g6
	prefetch	[%l7 + %g6],	 1
	call	loop_647
	nop
	setx	loop_648,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021200001403,	%l0,	%l1
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
	call	loop_649
	fmovdpos	%icc,	%f30,	%f30
loop_647:
	fbg	%fcc2,	loop_650
loop_648:
	call	loop_651
loop_649:
	fmovdneg	%xcc,	%f6,	%f20
	nop
	setx	0x9C47555F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x31EE3B21,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f15,	%f23
loop_650:
	fmovrdne	%g6,	%f20,	%f8
loop_651:
	call	loop_652
	tsubcc	%o4,	%i0,	%l3
	fzeros	%f24
	movo	%fcc1,	0x1F1,	%o3
loop_652:
	fors	%f9,	%f8,	%f15
	pdist	%f4,	%f20,	%f0
	sll	%o7,	%i2,	%i7
	wr	%g0,	0xeb,	%asi
	stba	%g1,	[%l7 + 0x48] %asi
	membar	#Sync
	movrne	%g7,	%o2,	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE37, 	%hsys_tick_cmpr
	movrlz	%i6,	%i5,	%g5
	fmul8x16	%f28,	%f22,	%f6
	call	loop_653
	call	loop_654
	fmovdug	%fcc0,	%f30,	%f12
	call	loop_655
loop_653:
	movrne	%o0,	0x1EA,	%i4
loop_654:
	movcs	%xcc,	%i3,	%l5
	call	loop_656
loop_655:
	movrlz	%l4,	%l0,	%o5
	call	loop_657
	fmul8ulx16	%f2,	%f24,	%f12
loop_656:
	rdhpr	%htba,	%g4
	fmovdcc	%xcc,	%f16,	%f10
loop_657:
	wrpr	%l6,	%g2,	%cwp
	fcmple16	%f6,	%f28,	%o1
	call	loop_658
	nop
	fitos	%f13,	%f14
	fstod	%f14,	%f18
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_659
loop_658:
	movneg	%icc,	0x74D,	%i1
	stbar
	nop
	fitos	%f0,	%f16
	fstod	%f16,	%f10
loop_659:
	bcc	%xcc,	loop_660
	fcmps	%fcc3,	%f8,	%f3
	call	loop_661
	nop
	setx	0xB92753778B29A674,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_660:
	edge8ln	%o6,	%g6,	%g3
	fmovrsgez	%o4,	%f21,	%f18
loop_661:
	bmask	%l3,	%o3,	%o7
	call	loop_662
	nop
	setx	0x5B3D613E19CBA20D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x55A365680BF1C471,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f16,	%f4
	bge,a,pt	%xcc,	loop_663
	fcmple16	%f16,	%f24,	%i2
loop_662:
	edge32n	%i0,	%i7,	%g1
	movrgez	%o2,	%g7,	%l2
loop_663:
	call	loop_664
	call	loop_665
	subccc	%i6,	%l1,	%i5
	call	loop_666
loop_664:
	fbne,a	%fcc2,	loop_667
loop_665:
	xnorcc	%o0,	0x0FDF,	%g5
	call	loop_668
loop_666:
	alignaddrl	%i3,	%i4,	%l5
loop_667:
	movge	%fcc3,	%l0,	%l4
	fbe	%fcc1,	loop_669
loop_668:
	ta	%xcc,	0x6
	fcmpgt16	%f2,	%f2,	%o5
	call	loop_670
loop_669:
	srlx	%l6,	%g2,	%g4
	call	loop_671
	srax	%i1,	%o6,	%g6
loop_670:
	wr	%o1,	%g3,	%clear_softint
	tvc	%xcc,	0x0
loop_671:
	fcmpes	%fcc1,	%f29,	%f5
	membar	0x6B
	popc	0x04E9,	%o4
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f20
	fxtos	%f20,	%f0
	call	loop_672
	call	loop_673
	fmovde	%xcc,	%f18,	%f0
	call	loop_674
loop_672:
	call	loop_675
loop_673:
	wr	%l3,	0x132F,	%softint
	edge16l	%o7,	%i2,	%i0
loop_674:
	fblg	%fcc2,	loop_676
loop_675:
	fmovrslz	%o3,	%f9,	%f7
	addccc	%i7,	0x159B,	%g1
	call	loop_677
loop_676:
	addccc	%o2,	0x1971,	%l2
	fnot2	%f4,	%f12
	set	0x30, %o4
	stha	%i6,	[%l7 + %o4] 0x22
	membar	#Sync
loop_677:
	movcc	%icc,	%g7,	%l1
	movl	%xcc,	0x70C,	%o0
	call	loop_678
	std	%i4,	[%l7 + 0x78]
	orcc	%g5,	0x1F2B,	%i4
	movrlz	%i3,	%l5,	%l0
loop_678:
	fcmpd	%fcc3,	%f2,	%f6
	rdpr	%pil,	%o5
	brlez	%l4,	loop_679
	udivcc	%g2,	0x00,	%l6
	call	loop_680
	movlg	%fcc2,	0x2FF,	%i1
loop_679:
	fmovdg	%fcc3,	%f4,	%f4
	fmovsvc	%icc,	%f5,	%f3
loop_680:
	rd	%softint,	%g4
	fmovdo	%fcc1,	%f26,	%f14
	fmovrslz	%g6,	%f29,	%f24
	andn	%o1,	%o6,	%g3
	fmovdleu	%icc,	%f4,	%f4
	fbne,pn	%fcc3,	loop_681
	tpos	%xcc,	0x4
	fsrc2s	%f17,	%f24
	fpsub32	%f28,	%f4,	%f22
loop_681:
	bn	%xcc,	loop_682
	call	loop_683
	nop
	setx	0xEFBC28081F4637A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2A82BB8258224E49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f10,	%f6
	fmovslg	%fcc0,	%f11,	%f12
loop_682:
	fexpand	%f12,	%f16
loop_683:
	sub	%l3,	%o4,	%o7
	call	loop_684
	call	loop_685
	fmovsvs	%icc,	%f5,	%f8
	fnot2s	%f27,	%f4
loop_684:
	call	loop_686
loop_685:
	rdpr	%cwp,	%i0
	set	0x24, %o1
	ldswa	[%l7 + %o1] 0x19,	%o3
loop_686:
	tle	%icc,	0x7
	array8	%i7,	%i2,	%o2
	call	loop_687
	nop
	setx	0xAB1D3B8D,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	sdivx	%l2,	%g1,	%g7
	call	loop_688
loop_687:
	srax	%l1,	0x1C,	%i6
	call	loop_689
	call	loop_690
loop_688:
	call	loop_691
	nop
	setx	0xE6297F7EC847B392,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xFB94EEAA72A06639,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f6,	%f4
loop_689:
	fmovdcs	%xcc,	%f12,	%f14
loop_690:
	fmovsvc	%icc,	%f13,	%f12
loop_691:
	taddcctv	%o0,	%g5,	%i5
	fabss	%f8,	%f24
	te	%xcc,	0x1
	movule	%fcc2,	%i4,	%l5
	fmovdpos	%xcc,	%f4,	%f18
	sdivx	%l0,	%o5,	%i3
	edge8	%g2,	%l6,	%i1
	fcmpes	%fcc0,	%f6,	%f13
	movrne	%g4,	%l4,	%g6
	wrpr	%o6,	0x0BBC,	%tick
	edge16	%o1,	%l3,	%g3
	call	loop_692
	fpadd16s	%f22,	%f24,	%f17
	call	loop_693
	nop
	fitos	%f14,	%f16
	fstox	%f16,	%f28
loop_692:
	bg	%icc,	loop_694
	srl	%o4,	%i0,	%o3
loop_693:
	call	loop_695
	call	loop_696
loop_694:
	fba,a,pn	%fcc1,	loop_697
	call	loop_698
loop_695:
	call	loop_699
loop_696:
	st	%f5,	[%l7 + 0x30]
loop_697:
	call	loop_700
loop_698:
	alignaddrl	%o7,	%i2,	%o2
loop_699:
	movne	%xcc,	%l2,	%g1
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f4
loop_700:
	call	loop_701
	tvc	%xcc,	0x7
	ldd	[%l7 + 0x10],	%i6
	call	loop_702
loop_701:
	call	loop_703
	fmovsue	%fcc0,	%f12,	%f12
	call	loop_704
loop_702:
	srlx	%g7,	%l1,	%i6
loop_703:
	call	loop_705
	fsrc1	%f30,	%f22
loop_704:
	call	loop_706
	call	loop_707
loop_705:
	movneg	%icc,	%g5,	%i5
	udivcc	%o0,	%i4,	%l0
loop_706:
	edge8	%o5,	%l5,	%i3
loop_707:
	call	loop_708
	fmovrdgez	%g2,	%f16,	%f28
	fnot2s	%f9,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA85, 	%hsys_tick_cmpr
loop_708:
	movl	%fcc1,	%g4,	%i1
	alignaddrl	%l4,	%g6,	%o1
	edge32l	%l3,	%g3,	%o4
	fmovdue	%fcc1,	%f18,	%f2
	fmovscc	%xcc,	%f7,	%f21
	fmovrsgz	%o6,	%f22,	%f6
	flushw
	edge16	%i0,	%o7,	%o3
	fmovs	%f26,	%f19
	addccc	%i2,	%o2,	%l2
	rdpr	%gl,	%i7
	add	%l7,	0x44,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%g7
	nop
	set	0x72, %g3
	ldstub	[%l7 + %g3],	%l1
	edge8ln	%i6,	%g5,	%i5
	fmovdue	%fcc2,	%f4,	%f4
	xnorcc	%o0,	0x0577,	%l0
	nop
	setx	0x51CC88F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x63291273,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f13,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEAA, 	%hsys_tick_cmpr
	fmovdul	%fcc3,	%f12,	%f26
	stb	%i4,	[%l7 + 0x18]
	ba,pt	%xcc,	loop_709
	xnor	%g2,	%l6,	%g4
	fandnot1s	%f17,	%f22,	%f30
	call	loop_710
loop_709:
	xnorcc	%i3,	0x0208,	%i1
	fmovdug	%fcc0,	%f16,	%f2
	fmul8sux16	%f22,	%f10,	%f30
loop_710:
	be,pt	%xcc,	loop_711
	tleu	%icc,	0x6
	call	loop_712
	call	loop_713
loop_711:
	call	loop_714
	fmovse	%xcc,	%f2,	%f12
loop_712:
	nop
	setx	0x5D673F247C02FE2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x457D261C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f30,	%f10
loop_713:
	fsrc1	%f4,	%f0
loop_714:
	fandnot1	%f20,	%f8,	%f24
	fmovsule	%fcc3,	%f18,	%f10
	rdpr	%gl,	%l4
	set	0x54, %i7
	lduwa	[%l7 + %i7] 0x88,	%o1
	fmovsa	%fcc2,	%f16,	%f4
	call	loop_715
	srlx	%l3,	0x05,	%g6
	call	loop_716
	tleu	%xcc,	0x2
loop_715:
	popc	%g3,	%o4
	call	loop_717
loop_716:
	edge8n	%o6,	%o7,	%o3
	array16	%i2,	%o2,	%i0
	call	loop_718
loop_717:
	call	loop_719
	nop
	setx	0x889391A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE7D1318A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f12,	%f3
	tsubcctv	%l2,	0x0985,	%i7
loop_718:
	bgu,a	%xcc,	loop_720
loop_719:
	call	loop_721
	ta	%icc,	0x6
	fmovdue	%fcc0,	%f16,	%f30
loop_720:
	stb	%g1,	[%l7 + 0x5A]
loop_721:
	fmovdug	%fcc0,	%f14,	%f6
	fcmpne32	%f24,	%f22,	%g7
	bneg,pn	%icc,	loop_722
	fsrc1s	%f26,	%f20
	nop
	fitos	%f8,	%f0
	fstox	%f0,	%f8
	nop
	setx	0x9AF2E14B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xF0357BD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f21,	%f20
loop_722:
	subc	%l1,	%i6,	%i5
	fmovscs	%icc,	%f31,	%f9
	call	loop_723
	fmovsn	%icc,	%f31,	%f9
	call	loop_724
	siam	0x1
loop_723:
	call	loop_725
	movue	%fcc3,	%o0,	%g5
loop_724:
	call	loop_726
	call	loop_727
loop_725:
	call	loop_728
	edge32n	%l0,	%l5,	%o5
loop_726:
	nop
	set	0x78, %o5
	std	%g2,	[%l7 + %o5]
loop_727:
	fmul8sux16	%f20,	%f4,	%f28
loop_728:
	movrlz	%l6,	%i4,	%i3
	fsrc2s	%f22,	%f18
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 29
!	Type a   	: 31
!	Type x   	: 8
!	Type cti   	: 145
!	Type f   	: 150
!	Type i   	: 137
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
	set	0x5,	%g1
	set	0x4,	%g2
	set	0x1,	%g3
	set	0x3,	%g4
	set	0x4,	%g5
	set	0x2,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xE,	%i1
	set	-0xB,	%i2
	set	-0xF,	%i3
	set	-0x9,	%i4
	set	-0xF,	%i5
	set	-0x8,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x3DD73B0E,	%l0
	set	0x4FF62E40,	%l1
	set	0x3ACDCA89,	%l2
	set	0x774141AC,	%l3
	set	0x67A207A8,	%l4
	set	0x6C551F8A,	%l5
	set	0x51DF3936,	%l6
	!# Output registers
	set	0x0450,	%o0
	set	-0x1F19,	%o1
	set	0x106A,	%o2
	set	-0x0798,	%o3
	set	0x0685,	%o4
	set	0x1546,	%o5
	set	0x1CF5,	%o6
	set	0x0940,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	fmovrsgez	%g4,	%f30,	%f16
	call	loop_729
	mulx	%i1,	%o1,	%l3
	call	loop_730
	udiv	%g6,	0x00,	%g3
loop_729:
	std	%l4,	[%l7 + 0x08]
	tne	%xcc,	0x7
loop_730:
	prefetch	[%l7 + 0x3C],	 0
	fpsub32	%f10,	%f2,	%f28
	fmovde	%icc,	%f26,	%f30
	sir	0x0D08
	wrpr 	%g0, 	0x2, 	%gl
	fmovdneg	%icc,	%f20,	%f28
	tvc	%xcc,	0x4
	call	loop_731
	call	loop_732
	wrpr	%o7,	%o3,	%cwp
	fble,pn	%fcc3,	loop_733
loop_731:
	fmovsg	%fcc2,	%f29,	%f10
loop_732:
	mova	%fcc3,	0x38E,	%o4
	srax	%i2,	0x10,	%o2
loop_733:
	edge32	%l2,	%i7,	%i0
	rdpr	%tl,	%g1
	movn	%fcc2,	0x016,	%g7
	alignaddr	%i6,	%l1,	%i5
	tcs	%xcc,	0x0
	movue	%fcc2,	%g5,	%o0
	tn	%icc,	0x1
	movcc	%icc,	0x1A7,	%l0
	call	loop_734
	ldub	[%l7 + 0x35],	%o5
	tpos	%xcc,	0x5
	nop
	setx	0xD4083CEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x5B15839A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f31,	%f16
loop_734:
	call	loop_735
	fcmpne16	%f12,	%f18,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	udivx	%l6,	%i4,	%i3
loop_735:
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	call	loop_736
	call	loop_737
	edge8l	%g4,	%i1,	%o1
	call	loop_738
loop_736:
	std	%f10,	[%l7 + 0x50]
loop_737:
	bpos,pn	%icc,	loop_739
	orncc	%l3,	%g6,	%l4
loop_738:
	call	loop_740
	or	%g3,	%o6,	%o7
loop_739:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx loop_741, %l0, %l1
	jmpl %l1, %i2
loop_740:
	fmovdgu	%xcc,	%f20,	%f0
	call	loop_742
	call	loop_743
loop_741:
	nop
	setx	0xD589387F82E2BB08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xEAB6C22CD5B2CC29,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f20,	%f6
	call	loop_744
loop_742:
	fpack32	%f18,	%f24,	%f0
loop_743:
	call	loop_745
	call	loop_746
loop_744:
	call	loop_747
	nop
	set	0x70, %i3
	std	%f10,	[%l7 + %i3]
loop_745:
	fmovsg	%icc,	%f23,	%f6
loop_746:
	fmovsvs	%xcc,	%f4,	%f7
loop_747:
	movule	%fcc1,	0x3BE,	%o2
	call	loop_748
	fmul8x16	%f2,	%f2,	%f4
	fpsub16	%f2,	%f28,	%f4
	tpos	%icc,	0x6
loop_748:
	wr	%i7,	0x0C0E,	%ccr
	array32	%l2,	%i0,	%g7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tneg	%icc,	0x5
	fmovscs	%xcc,	%f28,	%f7
	fmovde	%fcc2,	%f22,	%f4
	movug	%fcc1,	0x1B8,	%i6
	call	loop_749
	rdhpr	%hintp,	%l1
	call	loop_750
	rd	%asi,	%i5
loop_749:
	fcmps	%fcc0,	%f7,	%f28
	fmovrsgz	%g1,	%f20,	%f26
loop_750:
	fcmpne16	%f4,	%f26,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x692, 	%hsys_tick_cmpr
	and	%o5,	%l5,	%g5
	fmovdule	%fcc2,	%f24,	%f10
	nop
	setx	0xC00CB5E8E1CE7B31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x3FBE065A78D094B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f30,	%f20
	fmovspos	%icc,	%f30,	%f7
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f26
	tsubcctv	%g2,	%i4,	%l6
	and	%g4,	%i1,	%i3
	movle	%icc,	0x15F,	%o1
	ldsw	[%l7 + 0x74],	%g6
	edge32n	%l3,	%l4,	%g3
	call	loop_751
	or	%o6,	0x0796,	%o7
	movrlez	%o3,	%o4,	%o2
	call	loop_752
loop_751:
	fmovrdne	%i2,	%f6,	%f0
	call	loop_753
	fsrc2	%f20,	%f28
loop_752:
	fabsd	%f0,	%f18
	tpos	%xcc,	0x7
loop_753:
	bshuffle	%f6,	%f8,	%f0
	call	loop_754
	call	loop_755
	rdpr	%pil,	%l2
	bg,a,pt	%icc,	loop_756
loop_754:
	fmovda	%icc,	%f24,	%f10
loop_755:
	fmovrde	%i0,	%f30,	%f2
	movu	%fcc2,	%g7,	%i7
loop_756:
	movg	%xcc,	%l1,	%i6
	call	loop_757
	tle	%xcc,	0x2
	call	loop_758
	call	loop_759
loop_757:
	srl	%i5,	0x00,	%o0
	nop
	set	0x78, %i0
	std	%l0,	[%l7 + %i0]
loop_758:
	call	loop_760
loop_759:
	swap	[%l7 + 0x78],	%o5
	tsubcc	%l5,	0x0C1C,	%g5
	call	loop_761
loop_760:
	rd	%pc,	%g1
	call	loop_762
	smulcc	%g2,	%i4,	%g4
loop_761:
	subcc	%l6,	%i3,	%i1
	movrgez	%g6,	0x23C,	%o1
loop_762:
	nop
	setx	0x98208B0DC2926269,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	stb	%l3,	[%l7 + 0x47]
	fmovsneg	%xcc,	%f4,	%f26
	fmovsleu	%xcc,	%f23,	%f8
	call	loop_763
	bleu,a	%xcc,	loop_764
	udivx	%g3,	%o6,	%l4
	tneg	%icc,	0x5
loop_763:
	movrgez	%o7,	0x2EB,	%o4
loop_764:
	rdhpr	%hpstate,	%o3
	fandnot1	%f8,	%f16,	%f10
	bleu,pn	%icc,	loop_765
	call	loop_766
	popc	0x0A12,	%i2
	wrpr	%o2,	%i0,	%cwp
loop_765:
	xnorcc	%l2,	0x01BC,	%i7
loop_766:
	sdivcc	%l1,	%i6,	%i5
	call	loop_767
	nop
	fitos	%f1,	%f13
	fstox	%f13,	%f22
	edge32l	%o0,	%l0,	%g7
	call	loop_768
loop_767:
	call	loop_769
	addc	%l5,	%g5,	%g1
	smul	%o5,	0x1090,	%g2
loop_768:
	pdist	%f8,	%f26,	%f24
loop_769:
	fmovsleu	%xcc,	%f4,	%f14
	fmovsa	%fcc0,	%f6,	%f17
	movuge	%fcc1,	0x647,	%i4
	wr	%g0,	0x52,	%asi
	stxa	%g4,	[%g0 + 0x108] %asi
	call	loop_770
	edge8n	%l6,	%i1,	%g6
	movuge	%fcc1,	0x319,	%i3
	wrpr 	%g0, 	0x0, 	%gl
loop_770:
	movo	%fcc1,	0x58F,	%g3
	movrlez	%o6,	%l4,	%o7
	call	loop_771
	movu	%fcc3,	%o4,	%l3
	mova	%icc,	0x1C4,	%i2
	fnegd	%f14,	%f8
loop_771:
	tcs	%icc,	0x4
	fmovdn	%xcc,	%f20,	%f14
	call	loop_772
	movuge	%fcc3,	%o3,	%o2
	movpos	%xcc,	%l2,	%i7
	fmovduge	%fcc0,	%f14,	%f14
loop_772:
	fnot1	%f10,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_773
	call	loop_774
	call	loop_775
	fmovsu	%fcc0,	%f1,	%f3
loop_773:
	nop
	setx	0x6394FE6A1981F797,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1268B8ED7F33095D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f6,	%f30
loop_774:
	ta	%xcc,	0x1
loop_775:
	call	loop_776
	tneg	%icc,	0x0
	movue	%fcc0,	%l1,	%i5
	edge32	%i6,	%l0,	%o0
loop_776:
	nop
	set	0x40, %l3
	stda	%g6,	[%l7 + %l3] 0x27
	membar	#Sync
	wr	%g5,	%l5,	%softint
	membar	0x3A
	tneg	%icc,	0x7
	fornot1s	%f19,	%f10,	%f8
	movuge	%fcc3,	0x798,	%o5
	tsubcctv	%g2,	%g1,	%i4
	bneg,pt	%icc,	loop_777
	membar	0x51
	fnand	%f10,	%f22,	%f30
	tvs	%xcc,	0x6
loop_777:
	call	loop_778
	ldstub	[%l7 + 0x0B],	%l6
	call	loop_779
	fmovdu	%fcc3,	%f28,	%f20
loop_778:
	movvs	%xcc,	%i1,	%g4
	bshuffle	%f28,	%f14,	%f6
loop_779:
	std	%i2,	[%l7 + 0x60]
	ba,pt	%xcc,	loop_780
	tcc	%icc,	0x2
	call	loop_781
	bshuffle	%f30,	%f14,	%f18
loop_780:
	fmovdule	%fcc0,	%f22,	%f14
	fcmpne32	%f24,	%f22,	%o1
loop_781:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%g6
	fmovslg	%fcc0,	%f28,	%f12
	fmovdleu	%xcc,	%f22,	%f12
	wr	%o6,	0x0331,	%sys_tick
	fpack32	%f6,	%f8,	%f22
	fnot2s	%f16,	%f26
	xnor	%l4,	0x1CB9,	%g3
	wr	%g0,	0x88,	%asi
	stwa	%o7,	[%l7 + 0x44] %asi
	umulcc	%o4,	%i2,	%l3
	bn,a	%icc,	loop_782
	fpadd32	%f24,	%f26,	%f22
	fbne	%fcc2,	loop_783
	movpos	%xcc,	%o3,	%o2
loop_782:
	nop
	set	0x70, %l4
	stda	%l2,	[%l7 + %l4] 0xea
	membar	#Sync
loop_783:
	for	%f6,	%f4,	%f4
	fcmps	%fcc3,	%f31,	%f20
	call	loop_784
	brz,a	%i0,	loop_785
	fmovsue	%fcc3,	%f29,	%f29
	addccc	%i7,	%l1,	%i5
loop_784:
	edge8	%i6,	%l0,	%g7
loop_785:
	movge	%fcc0,	%o0,	%g5
	movgu	%xcc,	0x268,	%l5
	wr	%g0,	0x19,	%asi
	sta	%f20,	[%l7 + 0x4C] %asi
	tneg	%xcc,	0x1
	rdhpr	%hintp,	%g2
	rdhpr	%ver,	%o5
	mulscc	%i4,	0x1983,	%g1
	fbuge,a	%fcc1,	loop_786
	bvs,a	%xcc,	loop_787
	fpack32	%f28,	%f10,	%f14
	brgez,a,pn	%l6,	loop_788
loop_786:
	call	loop_789
loop_787:
	call	loop_790
	fmovduge	%fcc2,	%f22,	%f24
loop_788:
	fmuld8sux16	%f23,	%f8,	%f2
loop_789:
	call	loop_791
loop_790:
	fbne	%fcc0,	loop_792
	fcmpne32	%f12,	%f2,	%i1
	mulx	%g4,	0x1988,	%i3
loop_791:
	fpadd32s	%f5,	%f25,	%f14
loop_792:
	fcmpeq32	%f6,	%f0,	%o1
	call	loop_793
	tsubcc	%g6,	%l4,	%g3
	fzeros	%f0
	call	loop_794
loop_793:
	wrpr	%o6,	%o7,	%cwp
	call	loop_795
	call	loop_796
loop_794:
	bg,a	%xcc,	loop_797
	call	loop_798
loop_795:
	array16	%o4,	%i2,	%l3
loop_796:
	movvc	%xcc,	%o2,	%l2
loop_797:
	nop
	setx	loop_799,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024200001407,	%l0,	%l1
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
loop_798:
	tcs	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5E1, 	%hsys_tick_cmpr
	fbn,a	%fcc2,	loop_800
loop_799:
	popc	%i7,	%l1
	call	loop_801
	udiv	%i6,	%i5,	%l0
loop_800:
	fandnot2	%f8,	%f4,	%f4
	fsrc1s	%f10,	%f29
loop_801:
	rdhpr	%hpstate,	%o0
	taddcctv	%g5,	%l5,	%g7
	fone	%f30
	call	loop_802
	call	loop_803
	rdhpr	%htba,	%o5
	movug	%fcc2,	0x5C6,	%g2
loop_802:
	call	loop_804
loop_803:
	call	loop_805
	edge32	%i4,	%l6,	%i1
	edge8	%g1,	%i3,	%o1
loop_804:
	fcmpne32	%f12,	%f22,	%g6
loop_805:
	nop
	fitos	%f8,	%f2
	fstod	%f2,	%f28
	movule	%fcc0,	0x66E,	%g4
	call	loop_806
	call	loop_807
	movleu	%icc,	%l4,	%o6
	alignaddrl	%o7,	%g3,	%i2
loop_806:
	fmul8ulx16	%f26,	%f6,	%f14
loop_807:
	movlg	%fcc2,	%o4,	%o2
	sir	0x0313
	mulscc	%l2,	%l3,	%o3
	wr	%i7,	0x0B3E,	%y
	call	loop_808
	fsrc2s	%f14,	%f2
	fpadd32	%f0,	%f2,	%f26
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f25
loop_808:
	sir	0x1569
	array32	%i0,	%i6,	%i5
	fmovdg	%fcc0,	%f24,	%f22
	movlg	%fcc3,	%l1,	%l0
	call	loop_809
	array32	%o0,	%g5,	%g7
	fnot2s	%f31,	%f13
	call	loop_810
loop_809:
	call	loop_811
	call	loop_812
	nop
	setx	0xFB8E57F9823AEB47,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA6DBFA31B61B0013,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f0,	%f8
loop_810:
	nop
	setx loop_813, %l0, %l1
	jmpl %l1, %o5
loop_811:
	call	loop_814
loop_812:
	fmovslg	%fcc3,	%f31,	%f14
	call	loop_815
loop_813:
	call	loop_816
loop_814:
	call	loop_817
	movule	%fcc1,	%g2,	%i4
loop_815:
	call	loop_818
loop_816:
	call	loop_819
loop_817:
	fpsub32	%f2,	%f8,	%f28
	movuge	%fcc0,	0x040,	%l5
loop_818:
	edge32n	%i1,	%l6,	%i3
loop_819:
	call	loop_820
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	taddcc	%g1,	%o1,	%g6
	fcmpne16	%f18,	%f12,	%l4
loop_820:
	rdpr	%cwp,	%g4
	siam	0x6
	call	loop_821
	movleu	%xcc,	0x791,	%o7
	movl	%xcc,	0x2B3,	%g3
	fmovdcc	%xcc,	%f28,	%f24
loop_821:
	call	loop_822
	fmovscs	%icc,	%f12,	%f13
	tsubcctv	%o6,	%o4,	%i2
	sra	%l2,	0x11,	%o2
loop_822:
	umulcc	%l3,	0x1764,	%i7
	addcc	%i0,	0x01F6,	%i6
	nop
	setx	0x02C18ADC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x595A9232,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f16,	%f11
	call	loop_823
	movn	%fcc1,	0x1EE,	%o3
	fmovsa	%xcc,	%f0,	%f2
	xnorcc	%l1,	%i5,	%l0
loop_823:
	movgu	%icc,	%g5,	%g7
	fmul8ulx16	%f8,	%f26,	%f28
	call	loop_824
	call	loop_825
	call	loop_826
	call	loop_827
loop_824:
	udivx	%o5,	0x00,	%o0
loop_825:
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f2
	fxtod	%f2,	%f2
loop_826:
	nop
	setx	0x370515CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_827:
	sethi	0x07D8,	%g2
	fones	%f29
	movgu	%icc,	%l5,	%i1
	wr	%i4,	0x0A54,	%pic
	movgu	%icc,	%l6,	%i3
	call	loop_828
	call	loop_829
	movo	%fcc3,	0x00A,	%g1
	fnot2s	%f29,	%f28
loop_828:
	subc	%o1,	0x1986,	%l4
loop_829:
	taddcctv	%g6,	0x0B2B,	%o7
	alignaddr	%g3,	%o6,	%o4
	popc	0x11ED,	%g4
	addccc	%l2,	0x0331,	%i2
	call	loop_830
	fmuld8sux16	%f28,	%f11,	%f24
	fmovsul	%fcc2,	%f27,	%f22
	sub	%l3,	%i7,	%i0
loop_830:
	rdhpr	%ver,	%i6
	alignaddr	%o2,	%o3,	%i5
	fmovdu	%fcc1,	%f4,	%f0
	fmovdcc	%xcc,	%f18,	%f10
	edge32n	%l1,	%g5,	%l0
	tvc	%xcc,	0x5
	movge	%icc,	0x362,	%o5
	call	loop_831
	movvc	%xcc,	0x62A,	%g7
	fxor	%f4,	%f14,	%f20
	call	loop_832
loop_831:
	nop
	set	0x38, %i6
	lduw	[%l7 + %i6],	%g2
	call	loop_833
	fmovdgu	%icc,	%f10,	%f4
loop_832:
	fornot2	%f10,	%f2,	%f28
	move	%fcc1,	0x118,	%l5
loop_833:
	tn	%icc,	0x4
	ble,a,pn	%icc,	loop_834
	rdpr	%wstate,	%i1
	andncc	%o0,	0x0723,	%l6
	tle	%xcc,	0x6
loop_834:
	xnorcc	%i4,	%i3,	%g1
	tle	%xcc,	0x2
	fzero	%f10
	fmovsule	%fcc2,	%f29,	%f6
	rdhpr	%htba,	%o1
	fbg	%fcc2,	loop_835
	xnor	%g6,	0x1B88,	%l4
	call	loop_836
	fmuld8ulx16	%f22,	%f22,	%f10
loop_835:
	fmovsge	%fcc1,	%f24,	%f11

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_836:
	nop
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc8
	call	loop_837
	edge16ln	%o6,	%g3,	%g4
	nop
	setx	0x0B3AD36B96C16E8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5B0715ADD3FDCD13,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f20,	%f28
	fands	%f26,	%f6,	%f21
loop_837:
	stw	%o4,	[%l7 + 0x5C]
	membar	0x1D
	call	loop_838
	fmovrsne	%l2,	%f5,	%f22
	call	loop_839
	umulcc	%l3,	0x101D,	%i2
loop_838:
	call	loop_840
	edge8ln	%i7,	%i0,	%o2
loop_839:
	fandnot1	%f26,	%f18,	%f28
	wrpr	%o3,	%i5,	%pil
loop_840:
	fnot1	%f6,	%f12
	fcmpes	%fcc1,	%f25,	%f1
	fands	%f4,	%f5,	%f9
	sdivx	%i6,	0x00,	%g5
	call	loop_841
	stw	%l1,	[%l7 + 0x4C]
	call	loop_842
	fmovdue	%fcc1,	%f26,	%f0
loop_841:
	call	loop_843
	fmovrdlz	%o5,	%f8,	%f10
loop_842:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fsrc1	%f22,	%f4
loop_843:
	wr	%g7,	%l5,	%clear_softint
	call	loop_844
	brlez	%g2,	loop_845
	movneg	%xcc,	%i1,	%o0
	orn	%l6,	0x01BE,	%i3
loop_844:
	call	loop_846
loop_845:
	edge8	%i4,	%o1,	%g6
	movvs	%icc,	0x4A9,	%l4
	call	loop_847
loop_846:
	xorcc	%o7,	%o6,	%g3
	taddcctv	%g1,	0x0279,	%g4
	ldsh	[%l7 + 0x36],	%o4
loop_847:
	edge8	%l2,	%l3,	%i7
	call	loop_848
	call	loop_849
	call	loop_850
	rdpr	%otherwin,	%i0
loop_848:
	movvs	%icc,	%o2,	%o3
loop_849:
	call	loop_851
loop_850:
	fmovsvc	%xcc,	%f31,	%f11
	call	loop_852
	te	%icc,	0x3
loop_851:
	fmovsa	%xcc,	%f13,	%f9
	brlez,a	%i2,	loop_853
loop_852:
	orncc	%i5,	0x10AC,	%i6
	movl	%fcc0,	%g5,	%l1
	call	loop_854
loop_853:
	srl	%l0,	0x07,	%g7
	subccc	%o5,	%g2,	%i1
	fabss	%f1,	%f12
loop_854:
	tne	%icc,	0x2
	fpadd32s	%f19,	%f31,	%f10
	call	loop_855
	rdhpr	%ver,	%l5
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_856
loop_855:
	call	loop_857
	call	loop_858
	call	loop_859
loop_856:
	fbule	%fcc1,	loop_860
loop_857:
	bcs,a	%icc,	loop_861
loop_858:
	fbl,a	%fcc1,	loop_862
loop_859:
	mova	%xcc,	0x46F,	%o0
loop_860:
	call	loop_863
loop_861:
	sll	%l6,	%i3,	%o1
loop_862:
	srax	%i4,	%g6,	%o7
	sll	%l4,	0x0E,	%g3
loop_863:
	edge32n	%o6,	%g4,	%g1
	fbul,pn	%fcc2,	loop_864
	udivx	%o4,	%l2,	%l3
	fmovse	%fcc2,	%f25,	%f23
	call	loop_865
loop_864:
	call	loop_866
	call	loop_867
	bcc,a	%xcc,	loop_868
loop_865:
	fcmps	%fcc2,	%f14,	%f1
loop_866:
	fmul8x16au	%f4,	%f10,	%f24
loop_867:
	fmovdne	%fcc3,	%f6,	%f12
loop_868:
	fmovrdlez	%i0,	%f0,	%f6
	fmovrsgz	%o2,	%f14,	%f22
	call	loop_869
	tn	%icc,	0x5
	fmovsa	%xcc,	%f26,	%f29
	fnot2	%f10,	%f0
loop_869:
	fbue,a,pn	%fcc2,	loop_870
	or	%o3,	0x0EE4,	%i7
	edge8	%i5,	%i2,	%i6
	fmovdcc	%icc,	%f2,	%f4
loop_870:
	call	loop_871
loop_871:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 25
!	Type a   	: 35
!	Type x   	: 7
!	Type cti   	: 143
!	Type f   	: 122
!	Type i   	: 168
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
	set	0x1,	%g1
	set	0xC,	%g2
	set	0x0,	%g3
	set	0x1,	%g4
	set	0xD,	%g5
	set	0xB,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0xE,	%i3
	set	-0x4,	%i4
	set	-0xE,	%i5
	set	-0x3,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x0BD19040,	%l0
	set	0x5E72A4BE,	%l1
	set	0x72F3C458,	%l2
	set	0x28E5662B,	%l3
	set	0x239C97D6,	%l4
	set	0x4BDD6A78,	%l5
	set	0x7A888FD2,	%l6
	!# Output registers
	set	0x04C0,	%o0
	set	0x14B7,	%o1
	set	0x0C83,	%o2
	set	0x1F89,	%o3
	set	0x0171,	%o4
	set	0x05AC,	%o5
	set	-0x162F,	%o6
	set	0x19D4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	nop
	fitos	%f0,	%f9
	fstox	%f9,	%f16
	fxtos	%f16,	%f22
	fcmpne32	%f14,	%f12,	%l1
	fbg	%fcc2,	loop_872
	fxor	%f2,	%f10,	%f6
	rdhpr	%hpstate,	%g5
	movvs	%icc,	%g7,	%o5
loop_872:
	andcc	%l0,	0x1A05,	%i1
	call	loop_873
	call	loop_874
	movu	%fcc0,	0x2D4,	%l5
	ta	%xcc,	0x1
loop_873:
	fmovse	%icc,	%f9,	%f30
loop_874:
	fmovdvc	%xcc,	%f16,	%f0
	call	loop_875
	fmovdne	%icc,	%f28,	%f0
	call	loop_876
	subc	%g2,	0x15FF,	%o0
loop_875:
	fbue,pn	%fcc1,	loop_877
	or	%l6,	0x176D,	%i3
loop_876:
	call	loop_878
	fbl,a,pn	%fcc3,	loop_879
loop_877:
	call	loop_880
	umul	%o1,	%g6,	%i4
loop_878:
	fmovrsgz	%o7,	%f13,	%f30
loop_879:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_880:
	nop
	fitos	%f4,	%f24
	brgz,a,pt	%l4,	loop_881
	subccc	%g4,	%o6,	%g1
	call	loop_882
	fmovrdgez	%o4,	%f30,	%f16
loop_881:
	sth	%l3,	[%l7 + 0x78]
	fmovda	%fcc2,	%f4,	%f12
loop_882:
	sllx	%i0,	0x0A,	%o2
	edge16	%l2,	%i7,	%i5
	call	loop_883
	add	%i2,	%i6,	%l1
	fbn,a	%fcc3,	loop_884
	fxors	%f2,	%f20,	%f14
loop_883:
	fmovrse	%g5,	%f8,	%f18
	fornot2	%f16,	%f30,	%f10
loop_884:
	brnz,pt	%o3,	loop_885
	nop
	fitos	%f2,	%f24
	fstox	%f24,	%f22
	fcmpgt16	%f0,	%f26,	%o5
	ba,a,pt	%xcc,	loop_886
loop_885:
	andn	%g7,	0x1A03,	%l0
	fmovsgu	%icc,	%f31,	%f26
	fblg,a,pn	%fcc3,	loop_887
loop_886:
	nop
	setx	0x18CAFA35D6E827E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5BBD21F235C5BFC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f8
	taddcctv	%l5,	0x0B27,	%i1
	udivx	%g2,	0x00,	%l6
loop_887:
	movre	%i3,	0x371,	%o0
	fmovdcc	%icc,	%f26,	%f0
	fmovsul	%fcc1,	%f19,	%f22
	rdhpr	%ver,	%o1
	nop
	fitod	%f9,	%f2
	fnot1s	%f29,	%f3
	call	loop_888
	fmovso	%fcc1,	%f16,	%f14
	movrlz	%g6,	0x355,	%i4
	udiv	%o7,	0x00,	%l4
loop_888:
	fpack32	%f12,	%f14,	%f12
	bcs,a	%xcc,	loop_889
	movul	%fcc2,	%g3,	%g4
	sra	%g1,	%o4,	%o6
	call	loop_890
loop_889:
	wrpr	%l3,	0x1B1A,	%pil
	sdivx	%i0,	0x00,	%o2
	call	loop_891
loop_890:
	array32	%l2,	%i5,	%i7
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f4
	fxtod	%f4,	%f22
	ldsh	[%l7 + 0x36],	%i2
loop_891:
	movrlz	%l1,	%i6,	%o3
	call	loop_892
	fandnot2s	%f22,	%f7,	%f20
	call	loop_893
	movre	%g5,	0x3AD,	%o5
loop_892:
	call	loop_894
	umulcc	%g7,	0x090D,	%l0
loop_893:
	fmovrdgz	%i1,	%f20,	%f20
	call	loop_895
loop_894:
	call	loop_896
	fpackfix	%f12,	%f27
	fmovs	%f13,	%f12
loop_895:
	fmovd	%f10,	%f24
loop_896:
	fmovdneg	%xcc,	%f12,	%f4
	call	loop_897
	call	loop_898
	stb	%g2,	[%l7 + 0x0A]
	call	loop_899
loop_897:
	call	loop_900
loop_898:
	bgu	%xcc,	loop_901
	mova	%fcc0,	%l6,	%l5
loop_899:
	call	loop_902
loop_900:
	fcmpne32	%f14,	%f18,	%o0
loop_901:
	fmul8ulx16	%f14,	%f12,	%f4
	wrpr	%o1,	%i3,	%cwp
loop_902:
	nop
	setx	0x3AF80E784116B375,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fmovsvs	%icc,	%f7,	%f13
	flushw
	nop
	setx	0xDA0818BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x6E633262,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f4,	%f29
	call	loop_903
	movcc	%icc,	%i4,	%o7
	fmovsg	%icc,	%f0,	%f3
	bpos,a	%icc,	loop_904
loop_903:
	call	loop_905
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmul8x16au	%f7,	%f0,	%f20
loop_904:
	fmovdug	%fcc1,	%f16,	%f6
loop_905:
	array8	%l4,	%g6,	%g4
	rdhpr	%hsys_tick_cmpr,	%g1
	nop
	setx	0x17331BAD74599263,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x93F662EB8D00D693,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f20
	call	loop_906
	movg	%fcc1,	%o4,	%o6
	nop
	fitos	%f19,	%f1
	bl,pn	%xcc,	loop_907
loop_906:
	fmovdcc	%icc,	%f12,	%f16
	fmovsne	%xcc,	%f26,	%f5
	wr	%g3,	0x0CD1,	%sys_tick
loop_907:
	tne	%icc,	0x4
	movneg	%xcc,	%i0,	%o2
	rdhpr	%ver,	%l2
	nop
	setx	0x3DAD841763983223,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x7D4D6BBAAE2DD390,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f2
	call	loop_908
	nop
	set	0x0F, %l2
	ldsb	[%l7 + %l2],	%l3
	call	loop_909
	fpsub16s	%f5,	%f9,	%f3
loop_908:
	fmuld8ulx16	%f4,	%f5,	%f8
	movvc	%xcc,	%i7,	%i5
loop_909:
	fmovdleu	%xcc,	%f8,	%f28
	call	loop_910
	wr	%i2,	0x1C02,	%set_softint
	call	loop_911
	fmovrdgez	%l1,	%f28,	%f14
loop_910:
	nop
	set	0x18, %l1
	ldswa	[%l7 + %l1] 0x18,	%i6
loop_911:
	smul	%o3,	0x09B7,	%o5
	fmovdo	%fcc0,	%f4,	%f26
	taddcctv	%g7,	%l0,	%i1
	wr	%g5,	0x111F,	%ccr
	movg	%fcc3,	0x243,	%g2
	fcmpd	%fcc2,	%f18,	%f24
	call	loop_912
	call	loop_913
	fexpand	%f5,	%f26
	fbge,pn	%fcc0,	loop_914
loop_912:
	sll	%l5,	%l6,	%o0
loop_913:
	bg,a	%xcc,	loop_915
	call	loop_916
loop_914:
	call	loop_917
	array32	%o1,	%i4,	%i3
loop_915:
	fmovdug	%fcc3,	%f18,	%f18
loop_916:
	bmask	%o7,	%l4,	%g4
loop_917:
	sub	%g6,	0x08D5,	%o4
	edge32ln	%g1,	%o6,	%i0
	fmovrsgz	%o2,	%f13,	%f23
	call	loop_918
	fmovdug	%fcc0,	%f22,	%f20
	call	loop_919
	fmul8x16au	%f21,	%f10,	%f4
loop_918:
	fandnot1s	%f18,	%f29,	%f28
	fbu	%fcc0,	loop_920
loop_919:
	call	loop_921
	nop
	set	0x20, %i2
	stx	%g3,	[%l7 + %i2]
	fcmps	%fcc0,	%f9,	%f19
loop_920:
	movgu	%xcc,	0x7DB,	%l3
loop_921:
	call	loop_922
	fand	%f6,	%f4,	%f18
	fsrc2	%f14,	%f0
	call	loop_923
loop_922:
	sra	%l2,	%i7,	%i2
	subcc	%i5,	%i6,	%o3
	tsubcctv	%o5,	%g7,	%l1
loop_923:
	fpsub32	%f30,	%f28,	%f10
	call	loop_924
	fxors	%f28,	%f14,	%f4
	ldsb	[%l7 + 0x63],	%i1
	fone	%f2
loop_924:
	fmovd	%f30,	%f4
	movle	%fcc3,	%g5,	%l0
	call	loop_925
	fmovsn	%xcc,	%f13,	%f9
	movn	%fcc0,	%l5,	%l6
	fbu,a,pn	%fcc3,	loop_926
loop_925:
	fbge,a	%fcc1,	loop_927
	movue	%fcc0,	%g2,	%o1
	fmovdn	%fcc0,	%f10,	%f8
loop_926:
	stb	%o0,	[%l7 + 0x38]
loop_927:
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f12
	movule	%fcc1,	0x6CD,	%i3
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%i4
	fmovsue	%fcc2,	%f15,	%f16
	fmovsvs	%icc,	%f7,	%f18
	fmovrdlez	%o7,	%f8,	%f8
	call	loop_928
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f20
	fmovdle	%fcc0,	%f14,	%f16
	movne	%fcc3,	%l4,	%g4
loop_928:
	udivcc	%o4,	0x00,	%g1
	call	loop_929
	call	loop_930
	fcmple32	%f24,	%f0,	%g6
	sethi	0x1EF8,	%o6
loop_929:
	brz,a,pt	%o2,	loop_931
loop_930:
	movue	%fcc0,	0x101,	%i0
	call	loop_932
	fmovsug	%fcc1,	%f10,	%f16
loop_931:
	fbu,pn	%fcc0,	loop_933
	and	%g3,	%l2,	%l3
loop_932:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
loop_933:
	addc	%i7,	%i2,	%i6
	andn	%o3,	0x0A95,	%i5
	nop
	fitos	%f14,	%f22
	fstox	%f22,	%f10
	call	loop_934
	nop
	setx	0x79D468A325A771C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x27D92FF9D75539CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f18,	%f24
	call	loop_935
	fmul8sux16	%f22,	%f16,	%f26
loop_934:
	call	loop_936
	alignaddrl	%o5,	%g7,	%i1
loop_935:
	call	loop_937
	fmul8x16al	%f29,	%f24,	%f26
loop_936:
	wr 	%g0, 	0x5, 	%fprs
	fandnot2s	%f11,	%f28,	%f20
loop_937:
	fpadd32s	%f3,	%f20,	%f3
	fmovdul	%fcc3,	%f18,	%f26
	fmovdo	%fcc3,	%f28,	%f12
	fpsub32s	%f6,	%f3,	%f5
	fcmpgt16	%f6,	%f20,	%l1
	fmovdneg	%icc,	%f22,	%f10
	fornot2s	%f26,	%f11,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x34E, 	%hsys_tick_cmpr
	fpsub16	%f8,	%f12,	%f12
	movrgz	%o1,	0x1FC,	%l5
	fxor	%f22,	%f28,	%f4
	fandnot2s	%f3,	%f27,	%f22
	call	loop_938
	stx	%fsr,	[%l7 + 0x48]
	bcc,a,pn	%xcc,	loop_939
	brgez	%o0,	loop_940
loop_938:
	call	loop_941
	sdivx	%i4,	%o7,	%l4
loop_939:
	std	%i2,	[%l7 + 0x70]
loop_940:
	call	loop_942
loop_941:
	call	loop_943
	movvs	%xcc,	%o4,	%g4
	call	loop_944
loop_942:
	fbe,pn	%fcc1,	loop_945
loop_943:
	call	loop_946
	nop
	fitod	%f12,	%f12
loop_944:
	fmuld8sux16	%f15,	%f19,	%f4
loop_945:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_946:
	sll	%o2,	%i0,	%g3
	add	%l2,	0x042E,	%o6
	brlz,pt	%l3,	loop_947
	call	loop_948
	addc	%i2,	%i7,	%i6
	fbl,pt	%fcc3,	loop_949
loop_947:
	fmovdne	%fcc1,	%f28,	%f22
loop_948:
	fmovscs	%xcc,	%f15,	%f18
	tge	%icc,	0x5
loop_949:
	call	loop_950
	umulcc	%o3,	0x125F,	%o5
	fzeros	%f26
	call	loop_951
loop_950:
	rdpr	%cwp,	%i5
	call	loop_952
	fornot1s	%f22,	%f14,	%f3
loop_951:
	rdpr	%wstate,	%g7
	fbe,a,pn	%fcc0,	loop_953
loop_952:
	array16	%g5,	%i1,	%l1
	xorcc	%l6,	0x0782,	%l0
	srl	%g2,	0x1D,	%l5
loop_953:
	udiv	%o1,	0x00,	%i4
	call	loop_954
	andncc	%o0,	0x1E7D,	%l4
	bgu,a	%icc,	loop_955
	fpadd32	%f22,	%f12,	%f4
loop_954:
	xor	%o7,	0x03D7,	%i3
	brgez,pt	%g4,	loop_956
loop_955:
	call	loop_957
	fmovsle	%fcc1,	%f30,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1DC, 	%hsys_tick_cmpr
loop_956:
	umul	%g6,	%i0,	%o2
loop_957:
	fmovsge	%icc,	%f28,	%f0
	fmovdn	%xcc,	%f26,	%f30
	call	loop_958
	umulcc	%l2,	0x062E,	%g3
	xor	%o6,	0x12A7,	%l3
	fmovdgu	%xcc,	%f22,	%f22
loop_958:
	tsubcc	%i7,	%i2,	%i6
	tvc	%xcc,	0x3
	fmovdue	%fcc0,	%f20,	%f16
	call	loop_959
	fcmpgt32	%f6,	%f20,	%o5
	call	loop_960
	fnot1	%f6,	%f8
loop_959:
	ta	%xcc,	0x6
	fmovdl	%fcc1,	%f12,	%f6
loop_960:
	fmovrsne	%o3,	%f19,	%f11
	wr	%i5,	0x08C7,	%ccr
	rd	%asi,	%g5
	fsrc1s	%f18,	%f7
	fmovdg	%icc,	%f30,	%f28
	sll	%i1,	0x00,	%g7
	tcc	%xcc,	0x3
	call	loop_961
	fmovdcc	%icc,	%f28,	%f8
	movre	%l1,	0x063,	%l6
	nop
	setx	0x945A7E1228843A48,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x6F2CA7E527DA9D39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f10,	%f2
loop_961:
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f12
	call	loop_962
	ba	%xcc,	loop_963
	tsubcc	%l0,	%l5,	%g2
	tleu	%xcc,	0x2
loop_962:
	rdpr	%otherwin,	%i4
loop_963:
	taddcctv	%o0,	0x06EC,	%l4
	fones	%f31
	fmovdue	%fcc1,	%f18,	%f26
	movge	%icc,	%o7,	%i3
	fmovdule	%fcc3,	%f20,	%f16
	movn	%fcc2,	%g4,	%o1
	fpsub16s	%f0,	%f8,	%f3
	call	loop_964
	nop
	fitod	%f4,	%f26
	fmovdleu	%xcc,	%f18,	%f12
	bcc	%icc,	loop_965
loop_964:
	fcmpeq16	%f6,	%f26,	%g1
	movvs	%xcc,	%g6,	%o4
	srlx	%o2,	%i0,	%g3
loop_965:
	fmovd	%f16,	%f30
	fbl,pn	%fcc0,	loop_966
	nop
	fitos	%f26,	%f3
	call	loop_967
	prefetch	[%l7 + 0x28],	 2
loop_966:
	edge32ln	%o6,	%l3,	%i7
	edge16	%l2,	%i2,	%o5
loop_967:
	orncc	%o3,	0x03AB,	%i5
	call	loop_968
	call	loop_969
	call	loop_970
	edge32l	%i6,	%g5,	%g7
loop_968:
	subc	%i1,	%l6,	%l1
loop_969:
	rd	%asi,	%l5
loop_970:
	fmul8x16	%f8,	%f22,	%f30
	fmovrsgez	%g2,	%f16,	%f29
	fcmpeq32	%f14,	%f30,	%i4
	fmovdcc	%icc,	%f16,	%f16
	fmovrdgz	%l0,	%f22,	%f22
	fnor	%f8,	%f2,	%f8
	nop
	setx	0x32A5A394DC9469BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f14
	xnorcc	%l4,	0x0C0F,	%o0
	call	loop_971
	fmuld8sux16	%f6,	%f13,	%f16
	tvs	%xcc,	0x1
	fmovsue	%fcc3,	%f15,	%f18
loop_971:
	fmovdu	%fcc2,	%f14,	%f30
	movrlez	%i3,	%o7,	%g4
	fmovsg	%xcc,	%f19,	%f3
	movn	%xcc,	%g1,	%o1
	edge32n	%g6,	%o4,	%o2
	movleu	%xcc,	%g3,	%o6
	edge32n	%l3,	%i7,	%i0
	call	loop_972
	fmovdvc	%icc,	%f26,	%f6
	nop
	fitos	%f9,	%f1
	fstoi	%f1,	%f20
	srlx	%i2,	0x19,	%o5
loop_972:
	call	loop_973
	tvc	%icc,	0x6
	orcc	%l2,	0x0419,	%i5
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f0
	fxtos	%f0,	%f18
loop_973:
	nop
	set	0x1C, %l0
	swapa	[%l7 + %l0] 0x89,	%o3
	call	loop_974
	call	loop_975
	movleu	%icc,	%g5,	%g7
	call	loop_976
loop_974:
	call	loop_977
loop_975:
	call	loop_978
	fmovsul	%fcc3,	%f4,	%f21
loop_976:
	nop
	set	0x68, %o0
	std	%f26,	[%l7 + %o0]
loop_977:
	umulcc	%i6,	%i1,	%l1
loop_978:
	nop
	setx	0x291D59A57D3D8CAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x891B93F1290993B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f10,	%f26
	fpadd16s	%f12,	%f0,	%f27
	siam	0x0
	tpos	%xcc,	0x4
	call	loop_979
	fxor	%f6,	%f18,	%f10
	movrlz	%l5,	0x1C9,	%g2
	move	%fcc3,	0x739,	%i4
loop_979:
	movneg	%xcc,	0x2CD,	%l6
	sdivcc	%l0,	%l4,	%o0
	fmovrdgez	%o7,	%f16,	%f6
	call	loop_980
	wr	%i3,	%g1,	%softint
	nop
	setx loop_981, %l0, %l1
	jmpl %l1, %o1
	fmovdne	%icc,	%f0,	%f26
loop_980:
	fba	%fcc1,	loop_982
	brlz,a	%g6,	loop_983
loop_981:
	nop
	setx	loop_984,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001400001407,	%l0,	%l1
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
	mulx	%o4,	0x1200,	%o2
loop_982:
	fmovdcc	%icc,	%f10,	%f26
loop_983:
	rd	%sys_tick_cmpr,	%g4
loop_984:
	movrne	%o6,	0x1B5,	%l3
	fmul8sux16	%f10,	%f30,	%f6
	call	loop_985
	fmovsug	%fcc3,	%f17,	%f1
	fmovda	%xcc,	%f14,	%f0
	movge	%fcc2,	%g3,	%i0
loop_985:
	fandnot2	%f4,	%f14,	%f8
	orncc	%i7,	%i2,	%l2
	fmovscs	%icc,	%f10,	%f13
	fmovsul	%fcc1,	%f24,	%f5
	nop
	setx	0x64E485C3A95B56EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD797B55452E2AA11,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f20,	%f26
	rdpr	%canrestore,	%o5
	movuge	%fcc3,	0x4A2,	%o3
	umul	%g5,	%g7,	%i6
	call	loop_986
	fmovdge	%fcc0,	%f10,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%l5
loop_986:
	call	loop_987
	smul	%l1,	%i4,	%l6
	call	loop_988
	call	loop_989
loop_987:
	subcc	%g2,	0x05EE,	%l0
	umulcc	%o0,	0x1863,	%l4
loop_988:
	wrpr	%o7,	0x173E,	%tick
loop_989:
	call	loop_990
	movrlez	%i3,	%g1,	%o1
	bleu	%icc,	loop_991
	fpsub16	%f24,	%f18,	%f24
loop_990:
	fmovsvs	%xcc,	%f22,	%f26
	fmovdleu	%xcc,	%f30,	%f4
loop_991:
	fmovdo	%fcc3,	%f16,	%f10
	fnor	%f16,	%f26,	%f12
	movrlz	%o4,	0x1AA,	%o2
	fnot2s	%f18,	%f23
	call	loop_992
	movne	%fcc2,	0x790,	%g4
	xnor	%g6,	%l3,	%g3
	fpsub32s	%f18,	%f6,	%f26
loop_992:
	call	loop_993
	fmovdvc	%icc,	%f26,	%f8
	fcmpeq16	%f10,	%f24,	%o6
	call	loop_994
loop_993:
	tcc	%xcc,	0x4
	andcc	%i0,	0x06B7,	%i2
	fexpand	%f1,	%f10
loop_994:
	sir	0x18E3
	call	loop_995
	tpos	%xcc,	0x1
	fpsub16	%f16,	%f30,	%f18
	orcc	%i7,	0x16C6,	%o5
loop_995:
	edge32l	%l2,	%o3,	%g7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_996
	fmovrde	%i6,	%f12,	%f12
	fnegs	%f22,	%f26
	std	%g4,	[%l7 + 0x50]
loop_996:
	movneg	%icc,	0x212,	%i1
	rd	%y,	%l5
	fpadd16s	%f4,	%f13,	%f4
	call	loop_997
	fmovdug	%fcc3,	%f0,	%f8
	fmovdpos	%icc,	%f16,	%f0
	call	loop_998
loop_997:
	fmovrde	%i5,	%f24,	%f30
	fpackfix	%f0,	%f7
	nop
	fitos	%f4,	%f5
	fstoi	%f5,	%f11
loop_998:
	rd	%pc,	%i4
	fmovdvc	%xcc,	%f30,	%f24
	alignaddrl	%l1,	%g2,	%l6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovs	%f16,	%f31
	call	loop_999
	srl	%o0,	0x1C,	%l0
	brlz,a,pn	%l4,	loop_1000
	wr	%o7,	0x0957,	%ccr
loop_999:
	fmovspos	%xcc,	%f17,	%f21
	call	loop_1001
loop_1000:
	udiv	%i3,	0x00,	%o1
	movug	%fcc2,	%g1,	%o2
	fmovrdlz	%g4,	%f0,	%f4
loop_1001:
	mulx	%o4,	0x1795,	%g6
	be,a,pt	%icc,	loop_1002
	fmovduge	%fcc1,	%f24,	%f24
	call	loop_1003
	call	loop_1004
loop_1002:
	fone	%f0
	call	loop_1005
loop_1003:
	fcmpeq16	%f12,	%f24,	%g3
loop_1004:
	fmovse	%fcc1,	%f24,	%f11
	fandnot2s	%f4,	%f22,	%f4
loop_1005:
	wr	%o6,	0x19F4,	%set_softint
	rd	%softint,	%l3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i2
	bge,pn	%icc,	loop_1006
loop_1006:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 20
!	Type a   	: 30
!	Type x   	: 6
!	Type cti   	: 135
!	Type f   	: 173
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
	set	0xC,	%g1
	set	0x5,	%g2
	set	0x9,	%g3
	set	0x4,	%g4
	set	0xE,	%g5
	set	0x4,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x5,	%i1
	set	-0xE,	%i2
	set	-0x3,	%i3
	set	-0x7,	%i4
	set	-0xE,	%i5
	set	-0x5,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x7A22DB34,	%l0
	set	0x3F2CBE19,	%l1
	set	0x64A1E7C4,	%l2
	set	0x6D904195,	%l3
	set	0x4C2473C0,	%l4
	set	0x2BEC5400,	%l5
	set	0x769EB6D6,	%l6
	!# Output registers
	set	-0x1493,	%o0
	set	-0x0E15,	%o1
	set	0x0DC0,	%o2
	set	0x0924,	%o3
	set	0x01BC,	%o4
	set	0x14DF,	%o5
	set	-0x1C39,	%o6
	set	0x1BB2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6001571AA22DB65B)
	INIT_TH_FP_REG(%l7,%f2,0x01FA35C27AEADFC1)
	INIT_TH_FP_REG(%l7,%f4,0xA35F8CC2B169ECFB)
	INIT_TH_FP_REG(%l7,%f6,0x923B4FD44261E9EE)
	INIT_TH_FP_REG(%l7,%f8,0xE8E6EDEABC68A43B)
	INIT_TH_FP_REG(%l7,%f10,0x060D99D1F83A19E6)
	INIT_TH_FP_REG(%l7,%f12,0x9E1AE0C80B24AD6D)
	INIT_TH_FP_REG(%l7,%f14,0x7D3E804744AF61C7)
	INIT_TH_FP_REG(%l7,%f16,0x4FFADC598105ED17)
	INIT_TH_FP_REG(%l7,%f18,0xB1910B5762FF419B)
	INIT_TH_FP_REG(%l7,%f20,0x7F50F43629567172)
	INIT_TH_FP_REG(%l7,%f22,0x26231F8EAF2A4C04)
	INIT_TH_FP_REG(%l7,%f24,0x47D997D55ACA387E)
	INIT_TH_FP_REG(%l7,%f26,0x7C306AD3E8FB4592)
	INIT_TH_FP_REG(%l7,%f28,0xCCFB1863B82CBBF4)
	INIT_TH_FP_REG(%l7,%f30,0xA44248973E7797C9)

	!# Execute Main Diag ..

	orncc	%i7,	%o5,	%l2
	fornot2s	%f15,	%f14,	%f25
	wrpr	%o3,	0x16F9,	%cwp
	wrpr 	%g0, 	0x0, 	%gl
	fmovd	%f14,	%f22
	fmovrdlz	%i6,	%f20,	%f24
	movpos	%icc,	0x0A5,	%i1
	fmul8x16al	%f20,	%f23,	%f20
	call	loop_1007
	fmovdne	%xcc,	%f26,	%f4
	add	%g5,	0x1757,	%i5
	call	loop_1008
loop_1007:
	xnorcc	%i4,	%l5,	%l1
	brgez,a	%l6,	loop_1009
	array32	%o0,	%g2,	%l4
loop_1008:
	fmovsleu	%icc,	%f28,	%f28
	ldstub	[%l7 + 0x7F],	%o7
loop_1009:
	subcc	%i3,	%o1,	%g1
	call	loop_1010
	tcc	%icc,	0x1
	fmovdcc	%icc,	%f28,	%f6
	fmovsul	%fcc1,	%f19,	%f15
loop_1010:
	movue	%fcc1,	%o2,	%g4
	call	loop_1011
	nop
	setx	0x2F0EC1B99C2D90B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3AAECA0BEADD1D54,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f26,	%f30
	subccc	%o4,	0x1CB3,	%g6
	fmovrsgez	%g3,	%f6,	%f27
loop_1011:
	udivx	%o6,	0x00,	%l3
	fmovdge	%fcc0,	%f24,	%f24
	fpadd16	%f30,	%f6,	%f20
	nop
	setx	0x2563983C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x36946564,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f12,	%f5
	ta	%icc,	0x6
	movue	%fcc2,	%l0,	%i7
	srlx	%o5,	0x17,	%i2
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f5
	fpsub16	%f16,	%f28,	%f28
	bmask	%l2,	%o3,	%i0
	rdhpr	%hintp,	%i6
	wrpr	%i1,	0x104B,	%pil
	edge32	%g5,	%g7,	%i5
	umul	%l5,	%l1,	%l6
	sir	0x02B2
	nop
	fitos	%f7,	%f2
	fstox	%f2,	%f12
	fbuge,pt	%fcc1,	loop_1012
	fors	%f13,	%f18,	%f12
	call	loop_1013
	fpadd32s	%f3,	%f2,	%f25
loop_1012:
	ldstub	[%l7 + 0x45],	%i4
	tsubcc	%o0,	0x00E3,	%g2
loop_1013:
	call	loop_1014
	sll	%o7,	%l4,	%o1
	fmovsvs	%icc,	%f3,	%f17
	tgu	%xcc,	0x3
loop_1014:
	call	loop_1015
	call	loop_1016
	fmovdcs	%icc,	%f10,	%f12
	xnor	%i3,	%g1,	%g4
loop_1015:
	fpmerge	%f0,	%f14,	%f22
loop_1016:
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	fmovdl	%fcc2,	%f6,	%f28
	st	%f29,	[%l7 + 0x58]
	andn	%o4,	0x020B,	%g6
	call	loop_1017
	call	loop_1018
	rdhpr	%htba,	%o2
	fmovrde	%o6,	%f6,	%f12
loop_1017:
	movrlez	%l3,	0x04D,	%g3
loop_1018:
	nop
	set	0x8, %i4
	stxa	%l0,	[%g0 + %i4] 0x21
	ldsw	[%l7 + 0x6C],	%o5
	fornot1s	%f16,	%f9,	%f18
	tn	%xcc,	0x2
	nop
	setx	0x16677734338D108B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1314E2B21D213F94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f20,	%f10
	edge32ln	%i7,	%l2,	%i2
	movleu	%xcc,	0x4B9,	%i0
	udivcc	%o3,	%i1,	%g5
	rdpr	%canrestore,	%i6
	nop
	set	0x30, %l5
	flush	%l7 + %l5
	fmovdle	%xcc,	%f2,	%f8
	fcmpgt16	%f10,	%f0,	%i5
	nop
	setx	0x4596177077D0D5D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE35877190A3FED2A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f2,	%f20
	movge	%fcc3,	0x66A,	%l5
	movneg	%xcc,	0x209,	%l1
	fmovsleu	%icc,	%f6,	%f8
	fmovrdgz	%l6,	%f28,	%f30
	bn,a	%icc,	loop_1019
	orcc	%i4,	%o0,	%g7
	tcc	%xcc,	0x4
	tpos	%icc,	0x7
loop_1019:
	call	loop_1020
	fandnot2	%f16,	%f18,	%f6
	movleu	%xcc,	%o7,	%g2
	fba,a	%fcc3,	loop_1021
loop_1020:
	fmovdneg	%icc,	%f6,	%f18
	swap	[%l7 + 0x6C],	%o1
	fmovdge	%fcc3,	%f0,	%f8
loop_1021:
	movrgz	%l4,	0x00C,	%i3
	rdhpr	%hsys_tick_cmpr,	%g4
	fzero	%f18
	call	loop_1022
	fcmps	%fcc3,	%f0,	%f7
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovsug	%fcc3,	%f2,	%f25
loop_1022:
	and	%o4,	0x07D9,	%g6
	fbne,a,pn	%fcc3,	loop_1023
	fcmple32	%f28,	%f2,	%o2
	rdpr	%tba,	%o6
	nop
	set	0x4A, %i1
	sth	%l3,	[%l7 + %i1]
loop_1023:
	fpsub32	%f28,	%f22,	%f12
	ta	%xcc,	0x3
	call	loop_1024
	fmovd	%f24,	%f6
	set	0x36, %l6
	lduha	[%l7 + %l6] 0x81,	%g1
loop_1024:
	fnot1	%f2,	%f28
	movcc	%icc,	0x77D,	%g3
	fmul8x16al	%f24,	%f2,	%f28
	call	loop_1025
	call	loop_1026
	fmovrsgez	%o5,	%f2,	%f28
	fmovdne	%fcc3,	%f24,	%f22
loop_1025:
	tvs	%icc,	0x4
loop_1026:
	orn	%i7,	%l0,	%l2
	fexpand	%f6,	%f24
	call	loop_1027
	call	loop_1028
	fpsub32	%f16,	%f22,	%f28
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f10
loop_1027:
	call	loop_1029
loop_1028:
	call	loop_1030
	sir	0x00AF
	ldd	[%l7 + 0x18],	%f0
loop_1029:
	movle	%fcc3,	%i2,	%o3
loop_1030:
	for	%f4,	%f12,	%f10
	fxors	%f12,	%f10,	%f24
	bshuffle	%f28,	%f0,	%f2
	nop
	setx	0x4DCEE827,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE46CCBDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f11,	%f28
	fmovrsgez	%i1,	%f2,	%f27
	rdhpr	%hsys_tick_cmpr,	%i0
	move	%fcc2,	%g5,	%i6
	call	loop_1031
	sdivx	%l5,	0x00,	%l1
	andcc	%l6,	%i5,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF9, 	%hsys_tick_cmpr
loop_1031:
	tgu	%icc,	0x1
	fpackfix	%f8,	%f15
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	wr	%o7,	0x0D9A,	%sys_tick
	fnor	%f12,	%f22,	%f18
	fmovse	%xcc,	%f24,	%f21
	edge8ln	%g2,	%o1,	%l4
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD64, 	%hsys_tick_cmpr
	array32	%g6,	%o2,	%o4
	xnorcc	%o6,	%l3,	%g3
	call	loop_1032
	fmovsule	%fcc3,	%f24,	%f18
	array8	%g1,	%i7,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66B, 	%hsys_tick_cmpr
loop_1032:
	call	loop_1033
	fmovrse	%i2,	%f15,	%f5
	call	loop_1034
	fcmpd	%fcc3,	%f2,	%f2
loop_1033:
	fmovsgu	%xcc,	%f8,	%f4
	fcmps	%fcc0,	%f19,	%f31
loop_1034:
	array16	%l0,	%o3,	%i1
	call	loop_1035
	call	loop_1036
	umul	%i0,	0x0529,	%i6
	movrlez	%l5,	0x23D,	%g5
loop_1035:
	nop
	fitod	%f12,	%f28
	fdtox	%f28,	%f18
loop_1036:
	tl	%icc,	0x3
	fpack32	%f2,	%f12,	%f24
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l1
	fcmple32	%f8,	%f2,	%l6
	wr 	%g0, 	0x4, 	%fprs
	fba,a,pn	%fcc2,	loop_1037
	bvs,pt	%xcc,	loop_1038
	call	loop_1039
	fone	%f6
loop_1037:
	call	loop_1040
loop_1038:
	movgu	%icc,	%g7,	%o0
loop_1039:
	fmovdpos	%icc,	%f28,	%f28
	bgu,a,pn	%icc,	loop_1041
loop_1040:
	movvs	%icc,	0x118,	%g2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1042
loop_1041:
	brz,pn	%o7,	loop_1043
	edge16	%l4,	%g4,	%o1
	fmovdg	%fcc0,	%f24,	%f28
loop_1042:
	rdhpr	%hsys_tick_cmpr,	%g6
loop_1043:
	call	loop_1044
	fpsub32s	%f27,	%f2,	%f19
	fmovrsne	%i3,	%f17,	%f0
	move	%fcc3,	0x7D6,	%o2
loop_1044:
	tn	%icc,	0x0
	edge32n	%o4,	%o6,	%g3
	call	loop_1045
	fmovdgu	%xcc,	%f18,	%f2
	call	loop_1046
	bvc,pn	%icc,	loop_1047
loop_1045:
	rdpr	%cwp,	%g1
	fmovsgu	%xcc,	%f23,	%f19
loop_1046:
	tleu	%xcc,	0x0
loop_1047:
	movrlz	%i7,	0x32A,	%l3
	fmovdul	%fcc0,	%f6,	%f2
	call	loop_1048
	fmovrse	%o5,	%f11,	%f8
	set	0x74, %o2
	lda	[%l7 + %o2] 0x10,	%f8
loop_1048:
	fpack16	%f28,	%f30
	call	loop_1049
	fmovsleu	%icc,	%f31,	%f21
	ld	[%l7 + 0x78],	%f27
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x10] %asi,	%l2
loop_1049:
	call	loop_1050
	fandnot2s	%f26,	%f2,	%f20
	call	loop_1051
	nop
	setx	0xE6FBE856A7CFD12B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE7AB371E9FC23C9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f14,	%f18
loop_1050:
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_1052
loop_1051:
	fmovrdlez	%l0,	%f22,	%f4
	edge16n	%i0,	%i6,	%i1
	fmovspos	%icc,	%f12,	%f16
loop_1052:
	xnorcc	%l5,	%g5,	%l1
	rd	%y,	%i5
	call	loop_1053
	tleu	%icc,	0x3
	call	loop_1054
	fbge,pn	%fcc2,	loop_1055
loop_1053:
	fmovsa	%fcc3,	%f22,	%f15
	fones	%f10
loop_1054:
	edge8ln	%l6,	%i4,	%o0
loop_1055:
	rdpr	%otherwin,	%g7
	fmovsn	%fcc0,	%f12,	%f11
	call	loop_1056
	call	loop_1057
	call	loop_1058
	fmovse	%fcc1,	%f8,	%f22
loop_1056:
	rdpr	%cleanwin,	%g2
loop_1057:
	fmovdcc	%xcc,	%f4,	%f18
loop_1058:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x70] %asi,	%l4
	fmovdug	%fcc1,	%f28,	%f6
	call	loop_1059
	bne,a	%icc,	loop_1060
	rdhpr	%hsys_tick_cmpr,	%g4
	set	0x50, %o6
	sta	%f20,	[%l7 + %o6] 0x89
loop_1059:
	swap	[%l7 + 0x34],	%o7
loop_1060:
	movl	%fcc1,	%o1,	%g6
	rdhpr	%hpstate,	%o2
	call	loop_1061
	bshuffle	%f16,	%f20,	%f10
	fmovdpos	%xcc,	%f6,	%f28
	and	%o4,	0x0680,	%o6
loop_1061:
	xnor	%g3,	%i3,	%i7
	rdhpr	%hpstate,	%l3
	call	loop_1062
	fornot1s	%f23,	%f26,	%f19
	call	loop_1063
	mulx	%o5,	0x1F13,	%g1
loop_1062:
	call	loop_1064
	movleu	%icc,	%l2,	%i2
loop_1063:
	movle	%icc,	0x41E,	%o3
	call	loop_1065
loop_1064:
	call	loop_1066
	fmovrdgez	%l0,	%f10,	%f12
	call	loop_1067
loop_1065:
	fmovsneg	%xcc,	%f17,	%f29
loop_1066:
	movrlez	%i0,	%i1,	%l5
	fcmped	%fcc0,	%f30,	%f14
loop_1067:
	call	loop_1068
	tvs	%icc,	0x3
	sub	%i6,	0x1799,	%g5
	fmuld8ulx16	%f12,	%f31,	%f10
loop_1068:
	movge	%xcc,	0x66A,	%l1
	bgu,a	%icc,	loop_1069
	andncc	%l6,	%i5,	%i4
	call	loop_1070
	nop
	fitod	%f6,	%f2
loop_1069:
	call	loop_1071
	flushw
loop_1070:
	fcmple16	%f10,	%f28,	%o0
	fpadd16	%f2,	%f28,	%f8
loop_1071:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ta	%icc,	0x0
	taddcc	%g4,	%l4,	%o7
	rdhpr	%htba,	%g6
	fmovsvc	%xcc,	%f16,	%f16
	fmovduge	%fcc1,	%f10,	%f18
	sub	%o1,	%o2,	%o6
	call	loop_1072
	movvc	%xcc,	%g3,	%o4
	xnorcc	%i7,	%l3,	%o5
	fmovrde	%g1,	%f14,	%f2
loop_1072:
	call	loop_1073
	call	loop_1074
	edge16	%l2,	%i3,	%o3
	add	%i2,	%i0,	%i1
loop_1073:
	call	loop_1075
loop_1074:
	addc	%l5,	%i6,	%l0
	movrne	%l1,	%g5,	%i5
	fbn,pt	%fcc1,	loop_1076
loop_1075:
	edge16ln	%i4,	%o0,	%g7
	wr	%g2,	0x1FBA,	%clear_softint
	addc	%l6,	0x1888,	%g4
loop_1076:
	call	loop_1077
	fbe,a	%fcc3,	loop_1078
	fcmpeq16	%f4,	%f24,	%o7
	move	%fcc0,	0x6C9,	%l4
loop_1077:
	fcmpeq16	%f2,	%f16,	%o1
loop_1078:
	fmovrdgez	%o2,	%f14,	%f16
	andncc	%g6,	%o6,	%o4
	call	loop_1079
	ldx	[%l7 + 0x10],	%g3
	call	loop_1080
	call	loop_1081
loop_1079:
	nop
	setx	0xA68F59AD97C91A80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xADF3E54BD6ED6FBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f18,	%f24
	fmovsne	%fcc3,	%f5,	%f21
loop_1080:
	fmovrdlz	%i7,	%f2,	%f28
loop_1081:
	fbe,a,pn	%fcc3,	loop_1082
	call	loop_1083
	movgu	%icc,	0x5CA,	%o5
	orncc	%g1,	%l2,	%i3
loop_1082:
	pdist	%f6,	%f20,	%f30
loop_1083:
	stbar
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f12
	nop
	fitod	%f6,	%f26
	fdtos	%f26,	%f21
	fnot1s	%f20,	%f17
	fxnors	%f15,	%f4,	%f28
	call	loop_1084
	fmovrdne	%o3,	%f2,	%f16
	call	loop_1085
	edge8l	%l3,	%i0,	%i2
loop_1084:
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032400001401,	%l0,	%l1
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
	call	loop_1087
loop_1085:
	fcmpne16	%f20,	%f2,	%i1
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x10,	 0
loop_1086:
	fmovdgu	%xcc,	%f24,	%f10
loop_1087:
	addc	%i6,	%l1,	%g5
	mova	%fcc1,	%l0,	%i5
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f30
	nop
	set	0x24, %g6
	ldub	[%l7 + %g6],	%i4
	movne	%icc,	0x5C7,	%o0
	alignaddrl	%g7,	%g2,	%g4
	fmuld8ulx16	%f20,	%f28,	%f8
	nop
	setx	0x29091889F009E48A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAE866869,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f22,	%f20
	call	loop_1088
	umulcc	%l6,	%o7,	%o1
	fmovrslez	%o2,	%f12,	%f19
	call	loop_1089
loop_1088:
	fbule	%fcc1,	loop_1090
	fblg	%fcc1,	loop_1091
	membar	0x38
loop_1089:
	edge32l	%g6,	%o6,	%l4
loop_1090:
	fmovsul	%fcc0,	%f22,	%f8
loop_1091:
	sub	%o4,	0x03AF,	%g3
	fmovrslz	%i7,	%f29,	%f1
	call	loop_1092
	udivcc	%o5,	0x00,	%g1
	fcmpgt32	%f24,	%f10,	%i3
	call	loop_1093
loop_1092:
	fmovsl	%xcc,	%f31,	%f10
	fpadd32s	%f13,	%f6,	%f10
	fmovdule	%fcc3,	%f6,	%f30
loop_1093:
	fandnot1s	%f9,	%f27,	%f25
	fcmpeq32	%f2,	%f18,	%l2
	prefetch	[%l7 + 0x60],	 3
	mulscc	%l3,	0x16E5,	%o3
	tneg	%icc,	0x6
	fbue,a,pt	%fcc3,	loop_1094
	call	loop_1095
	fmovdue	%fcc2,	%f26,	%f2
	call	loop_1096
loop_1094:
	umulcc	%i0,	0x0959,	%i2
loop_1095:
	call	loop_1097
	and	%l5,	%i6,	%l1
loop_1096:
	call	loop_1098
	call	loop_1099
loop_1097:
	fbge,pn	%fcc2,	loop_1100
	call	loop_1101
loop_1098:
	fmul8x16al	%f13,	%f26,	%f18
loop_1099:
	call	loop_1102
loop_1100:
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%g5
loop_1101:
	call	loop_1103
	fpadd16s	%f23,	%f2,	%f31
loop_1102:
	fsrc2	%f10,	%f0
	movrlez	%l0,	0x217,	%i5
loop_1103:
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xAB3, 	%hsys_tick_cmpr
	call	loop_1104
	call	loop_1105
	rd	%fprs,	%i4
	fmovrsgz	%g2,	%f6,	%f6
loop_1104:
	bvs,a,pt	%xcc,	loop_1106
loop_1105:
	xnor	%g4,	%g7,	%l6
	addccc	%o1,	0x0B51,	%o2
	fmovsug	%fcc1,	%f27,	%f10
loop_1106:
	call	loop_1107
	membar	0x2D
	fmovsuge	%fcc0,	%f7,	%f4
	fsrc2s	%f6,	%f10
loop_1107:
	tvs	%xcc,	0x1
	lduh	[%l7 + 0x70],	%o7
	st	%f25,	[%l7 + 0x64]
	wr	%g6,	0x1BA2,	%sys_tick
	nop
	setx	0x409BFC2BBEA40400,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x12152C6B36DDE81D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f6,	%f18
	movne	%xcc,	%o6,	%o4
	movvs	%icc,	0x36D,	%l4
	fxnor	%f22,	%f10,	%f16
	call	loop_1108
	rd	%fprs,	%g3
	call	loop_1109
	call	loop_1110
loop_1108:
	tleu	%xcc,	0x3
	mulscc	%i7,	0x1545,	%g1
loop_1109:
	brgz	%o5,	loop_1111
loop_1110:
	wrpr	%i3,	0x0D94,	%cwp
	fmovsleu	%xcc,	%f15,	%f2
	ldstub	[%l7 + 0x72],	%l3
loop_1111:
	fmovsge	%xcc,	%f18,	%f3
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f6
	nop
	set	0x70, %g3
	stx	%l2,	[%l7 + %g3]
	brgz,a	%i0,	loop_1112
	fmovsue	%fcc1,	%f1,	%f1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fors	%f18,	%f5,	%f3
loop_1112:
	call	loop_1113
	call	loop_1114
	fbule,pn	%fcc2,	loop_1115
	call	loop_1116
loop_1113:
	tpos	%xcc,	0x4
loop_1114:
	tcc	%xcc,	0x6
loop_1115:
	rdhpr	%htba,	%o3
loop_1116:
	fpsub16s	%f13,	%f1,	%f20
	call	loop_1117
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f6
	fblg,pn	%fcc3,	loop_1118
	call	loop_1119
loop_1117:
	call	loop_1120
	fba	%fcc3,	loop_1121
loop_1118:
	call	loop_1122
loop_1119:
	tsubcctv	%i2,	%i6,	%l1
loop_1120:
	tl	%xcc,	0x0
loop_1121:
	rdpr	%cleanwin,	%l5
loop_1122:
	tsubcctv	%l0,	0x182D,	%g5
	nop
	set	0x66, %o5
	lduh	[%l7 + %o5],	%i5
	call	loop_1123
	fandnot2s	%f1,	%f6,	%f29
	call	loop_1124
	fxnors	%f12,	%f17,	%f7
loop_1123:
	mulscc	%o0,	0x098E,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1124:
	movpos	%xcc,	0x17E,	%g2
	call	loop_1125
	fmovdge	%fcc1,	%f14,	%f12
	call	loop_1126
	fpsub32s	%f5,	%f10,	%f18
loop_1125:
	call	loop_1127
	brnz	%g7,	loop_1128
loop_1126:
	fmovrse	%l6,	%f13,	%f29
	call	loop_1129
loop_1127:
	call	loop_1130
loop_1128:
	fmovda	%xcc,	%f24,	%f20
	call	loop_1131
loop_1129:
	edge8	%o2,	%o1,	%o7
loop_1130:
	call	loop_1132
	call	loop_1133
loop_1131:
	sdiv	%o6,	0x00,	%o4
	fmuld8ulx16	%f4,	%f7,	%f2
loop_1132:
	te	%icc,	0x0
loop_1133:
	fmul8x16au	%f22,	%f4,	%f24
	call	loop_1134
	fmovrde	%g6,	%f2,	%f14
	call	loop_1135
	nop
	set	0x74, %g1
	ldsw	[%l7 + %g1],	%g3
loop_1134:
	fmovsleu	%xcc,	%f20,	%f29
	movo	%fcc1,	0x752,	%i7
loop_1135:
	call	loop_1136
	call	loop_1137
	edge8l	%g1,	%l4,	%o5
	tne	%xcc,	0x2
loop_1136:
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f8
	fxtos	%f8,	%f21
loop_1137:
	call	loop_1138
	call	loop_1139
	nop
	set	0x08, %i3
	stx	%i3,	[%l7 + %i3]
	call	loop_1140
loop_1138:
	nop
	setx	loop_1141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022100001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1139:
	fmovdul	%fcc1,	%f6,	%f2
	fpadd32	%f26,	%f10,	%f10
loop_1140:
	subcc	%l3,	0x1DB2,	%i0
loop_1141:
	rdhpr	%ver,	%o3
	fmovdule	%fcc3,	%f6,	%f28
	bg,a	%xcc,	loop_1142
	fcmpne32	%f22,	%f10,	%l2
	udivcc	%i6,	0x00,	%l1
loop_1142:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 34
!	Type a   	: 35
!	Type x   	: 8
!	Type cti   	: 136
!	Type f   	: 154
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
.word 0x12F66671
.word 0x569D8E37
.word 0x4C23FFA6
.word 0x7F02C3BD
.word 0x169638DF
.word 0x1CBF5EC7
.word 0x5B1F28F3
.word 0x345FCA9B
.word 0x03A1BD01
.word 0x0F615520
.word 0x038B177E
.word 0x990F1304
.word 0xD5D9A3CA
.word 0xEFAC0C1B
.word 0x7176EEC8
.word 0xE785B029
.word 0x4DE9C03A
.word 0x427C8361
.word 0x906CE509
.word 0x1374ED19
.word 0x077256F1
.word 0xE8A23C30
.word 0x10F46B44
.word 0x75D12142
.word 0xA8FD8C68
.word 0xF38E71B2
.word 0xBBD19D4A
.word 0x89ADCEC1
.word 0x32A920CD
.word 0x910D90F0
.word 0x0210D7A8
.word 0x3C70C14D
.word 0x62575BDB
.word 0x0B791C7B
.word 0x90677D06
.word 0xFC05CF95
.word 0x20BF5650
.word 0x0CECBD96
.word 0x9382B86F
.word 0xCEFCA656
.word 0xDAA89E14
.word 0x141FA1CA
.word 0xFF4CF3A9
.word 0xDBB02806
.word 0xCF2EC9EA
.word 0xE4F1D10B
.word 0xB4D4E493
.word 0xFE1465FA
.word 0x96FC0EB9
.word 0x8D8D1348
.word 0xB881BD25
.word 0x7EBEFD97
.word 0x33B4BF24
.word 0xBF089C92
.word 0xABF40030
.word 0xEAD51CD3
.word 0xA9DD1A7A
.word 0xE75427B5
.word 0x8B4FA68D
.word 0x2204036E
.word 0xB60597E0
.word 0xEC40B5D1
.word 0xDC582292
.word 0x48585775
.end
