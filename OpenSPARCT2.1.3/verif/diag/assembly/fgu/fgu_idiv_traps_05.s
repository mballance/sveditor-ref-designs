/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_05.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=81915147"
.ident "Thu Dec 11 11:45:18 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_05.s,v 1.4 2007/07/27 21:45:30 drp Exp $"
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
	set	0x8,	%g2
	set	0xA,	%g3
	set	0xB,	%g4
	set	0x7,	%g5
	set	0x6,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x0,	%i1
	set	-0x1,	%i2
	set	-0xB,	%i3
	set	-0xF,	%i4
	set	-0x0,	%i5
	set	-0xE,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x0D487DDF,	%l0
	set	0x0E451163,	%l1
	set	0x5F7A5C61,	%l2
	set	0x5655ABA0,	%l3
	set	0x7092C751,	%l4
	set	0x173CFC2B,	%l5
	set	0x7DC961E6,	%l6
	!# Output registers
	set	-0x0C88,	%o0
	set	0x057B,	%o1
	set	0x12A4,	%o2
	set	0x0EBE,	%o3
	set	-0x08C3,	%o4
	set	-0x197B,	%o5
	set	-0x1764,	%o6
	set	-0x0058,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	call	loop_1
	tne	%icc,	0x5
	subc	%g2,	%i5,	%i7
	fbul	%fcc1,	loop_2
loop_1:
	fmovdgu	%icc,	%f4,	%f24
	fmovdue	%fcc1,	%f14,	%f16
	fornot1s	%f30,	%f4,	%f23
loop_2:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fors	%f27,	%f1,	%f27
	fmul8x16	%f11,	%f2,	%f0
	fbul,a,pn	%fcc3,	loop_3
	nop
	fitos	%f13,	%f13
	fstox	%f13,	%f30
	fxtos	%f30,	%f26
	sll	%o0,	%g3,	%i1
	edge8n	%o2,	%i0,	%l0
loop_3:
	call	loop_4
	bcs,a,pn	%xcc,	loop_5
	fmovdue	%fcc2,	%f30,	%f12
	fpsub16	%f12,	%f12,	%f8
loop_4:
	call	loop_6
loop_5:
	fsrc2s	%f2,	%f14
	fmovrdgz	%g1,	%f2,	%f20
	movul	%fcc1,	0x05F,	%o3
loop_6:
	rdpr	%gl,	%g6
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f0
	fmovsul	%fcc3,	%f16,	%f23
	fpadd16s	%f24,	%f2,	%f19
	fornot1	%f22,	%f28,	%f14
	xorcc	%g4,	0x0AA3,	%i3
	st	%f12,	[%l7 + 0x60]
	nop
	fitos	%f0,	%f23
	fstox	%f23,	%f6
	call	loop_7
	wrpr	%l2,	0x0826,	%pil
	call	loop_8
	addccc	%i4,	0x1A80,	%i6
loop_7:
	movrlz	%o4,	%o7,	%l5
	nop
	setx	0xDD786B35574C42D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_8:
	orncc	%i2,	0x0ACA,	%l3
	set	0x75, %i2
	ldsba	[%l7 + %i2] 0x04,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF59, 	%tick_cmpr
	edge32ln	%g5,	%l4,	%o5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x7C] %asi,	%f3
	call	loop_9
	call	loop_10
	fpsub16s	%f9,	%f21,	%f9
	call	loop_11
loop_9:
	fbul,a	%fcc2,	loop_12
loop_10:
	fmovsu	%fcc2,	%f28,	%f16
	stb	%o6,	[%l7 + 0x61]
loop_11:
	fmovscs	%icc,	%f16,	%f23
loop_12:
	ba,a	%xcc,	loop_13
	edge8n	%l1,	%g2,	%i5
	movu	%fcc1,	0x654,	%i7
	call	loop_14
loop_13:
	call	loop_15
	movuge	%fcc3,	0x34C,	%g3
	fxnors	%f22,	%f11,	%f13
loop_14:
	add	%i1,	0x1383,	%o2
loop_15:
	fmovdue	%fcc3,	%f18,	%f8
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xcb
	umulcc	%o0,	%i0,	%g1
	bmask	%o3,	%g6,	%l0
	array32	%g4,	%i3,	%l2
	fnot2	%f24,	%f16
	call	loop_16
	fmul8x16au	%f2,	%f26,	%f30
	call	loop_17
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%i6
loop_16:
	call	loop_18
	edge16ln	%o4,	%i4,	%l5
loop_17:
	alignaddr	%i2,	%o7,	%g7
	bvc	%icc,	loop_19
loop_18:
	call	loop_20
	fand	%f0,	%f14,	%f16
	movne	%xcc,	0x500,	%o1
loop_19:
	call	loop_21
loop_20:
	call	loop_22
	call	loop_23
	fnot2	%f8,	%f20
loop_21:
	call	loop_24
loop_22:
	movo	%fcc2,	%l6,	%l3
loop_23:
	movul	%fcc3,	0x665,	%l4
	nop
	setx loop_25, %l0, %l1
	jmpl %l1, %g5
loop_24:
	fmovsle	%fcc3,	%f13,	%f10
	smulcc	%o6,	0x19E0,	%l1
	nop
	setx	0xCD3B142601B552EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f20
loop_25:
	taddcc	%g2,	0x1402,	%i5
	sdiv	%i7,	0x00,	%o5
	fnand	%f14,	%f22,	%f10
	call	loop_26
	tn	%xcc,	0x7
	fxor	%f2,	%f16,	%f0
	call	loop_27
loop_26:
	siam	0x2
	wr	%g0,	0x2f,	%asi
	stwa	%g3,	[%l7 + 0x24] %asi
	membar	#Sync
loop_27:
	nop
	setx	0x0D588E57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xAA9B7E4E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f18,	%f14
	fmovscc	%xcc,	%f23,	%f31
	membar	0x04
	call	loop_28
	mulx	%i1,	%o2,	%o0
	fsrc2	%f6,	%f2
	rdpr	%tl,	%i0
loop_28:
	rdhpr	%htba,	%o3
	call	loop_29
	nop
	fitod	%f10,	%f6
	fandnot2	%f0,	%f28,	%f16
	movo	%fcc3,	%g6,	%g1
loop_29:
	sir	0x17AF
	call	loop_30
	fblg,a,pt	%fcc1,	loop_31
	call	loop_32
	movu	%fcc3,	%g4,	%l0
loop_30:
	call	loop_33
loop_31:
	edge16ln	%l2,	%i3,	%o4
loop_32:
	popc	0x101F,	%i4
	call	loop_34
loop_33:
	call	loop_35
	xnor	%l5,	%i2,	%o7
	fsrc1s	%f30,	%f25
loop_34:
	be,pt	%icc,	loop_36
loop_35:
	fcmple16	%f10,	%f30,	%g7
	fpmerge	%f4,	%f23,	%f8
	st	%fsr,	[%l7 + 0x30]
loop_36:
	fmovdcs	%icc,	%f12,	%f24
	movle	%fcc2,	%o1,	%l6
	wrpr	%l3,	0x0CE8,	%pil
	call	loop_37
	orn	%i6,	0x1B90,	%g5
	fmuld8sux16	%f3,	%f31,	%f12
	set	0x3A, %l1
	lduba	[%l7 + %l1] 0x88,	%l4
loop_37:
	movne	%fcc2,	%l1,	%o6
	fornot1	%f24,	%f8,	%f6
	fpackfix	%f20,	%f2
	bg,a,pt	%xcc,	loop_38
	call	loop_39
	wr 	%g0, 	0x7, 	%fprs
	rdhpr	%hintp,	%i7
loop_38:
	fbug	%fcc2,	loop_40
loop_39:
	call	loop_41
	call	loop_42
	call	loop_43
loop_40:
	fbn,pn	%fcc2,	loop_44
loop_41:
	fmovde	%fcc3,	%f0,	%f24
loop_42:
	fpack32	%f22,	%f10,	%f6
loop_43:
	sra	%g2,	0x1D,	%g3
loop_44:
	call	loop_45
	call	loop_46
	wr	%o5,	0x113C,	%softint
	call	loop_47
loop_45:
	call	loop_48
loop_46:
	fnegs	%f21,	%f27
	fmovdleu	%icc,	%f28,	%f26
loop_47:
	call	loop_49
loop_48:
	call	loop_50
	fbe	%fcc0,	loop_51
	nop
	setx	0x8B00045A6F14F5F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x19008E60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f24,	%f24
loop_49:
	edge8l	%o2,	%o0,	%i1
loop_50:
	orncc	%o3,	0x0E2E,	%i0
loop_51:
	call	loop_52
	call	loop_53
	movcs	%xcc,	0x73B,	%g1
	call	loop_54
loop_52:
	call	loop_55
loop_53:
	call	loop_56
	fmovrdgez	%g4,	%f30,	%f16
loop_54:
	fcmpd	%fcc1,	%f8,	%f20
loop_55:
	rdhpr	%htba,	%l0
loop_56:
	tsubcctv	%l2,	0x178F,	%g6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i4
	sub	%l5,	%i3,	%i2
	call	loop_57
	fmuld8sux16	%f4,	%f17,	%f10
	call	loop_58
	wr	%o7,	%o1,	%clear_softint
loop_57:
	call	loop_59
	fmovdvs	%icc,	%f4,	%f14
loop_58:
	edge16n	%l6,	%g7,	%i6
	tvc	%xcc,	0x2
loop_59:
	tne	%icc,	0x0
	fmovdneg	%xcc,	%f4,	%f18
	call	loop_60
	fornot1	%f22,	%f18,	%f16
	fmovso	%fcc3,	%f14,	%f26
	taddcc	%g5,	%l4,	%l3
loop_60:
	fnot2	%f6,	%f2
	call	loop_61
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f26
	call	loop_62
	fmovsn	%xcc,	%f13,	%f11
loop_61:
	movrlz	%l1,	%i5,	%i7
	edge32ln	%g2,	%g3,	%o6
loop_62:
	nop
	setx	0xBBA4C7D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f20
	fmovdvs	%icc,	%f16,	%f26
	fabss	%f1,	%f10
	fmovscc	%xcc,	%f15,	%f18
	call	loop_63
	fmovdule	%fcc0,	%f20,	%f12
	array8	%o2,	%o0,	%i1
	call	loop_64
loop_63:
	fmovse	%icc,	%f27,	%f4
	xorcc	%o3,	0x1AF0,	%o5
	fmovslg	%fcc2,	%f31,	%f16
loop_64:
	edge16ln	%i0,	%g4,	%g1
	call	loop_65
	fmovsne	%xcc,	%f20,	%f20
	fnot1	%f2,	%f18
	fmovsul	%fcc1,	%f8,	%f25
loop_65:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%o4,	%i4,	%g6
	movug	%fcc3,	0x296,	%i3
	call	loop_66
	rd	%sys_tick_cmpr,	%i2
	nop
	setx	0x46EB96C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xBCA179AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f20,	%f0
	call	loop_67
loop_66:
	call	loop_68
	call	loop_69
	fmovslg	%fcc0,	%f10,	%f21
loop_67:
	fexpand	%f2,	%f22
loop_68:
	movl	%fcc0,	%l5,	%o7
loop_69:
	sll	%l6,	0x13,	%g7
	call	loop_70
	wrpr 	%g0, 	0x3, 	%gl
	nop
	setx	0x70D3ED44,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2FD304C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f21,	%f5
	andncc	%g5,	%l3,	%l4
loop_70:
	movul	%fcc1,	%l1,	%i5
	fba,a	%fcc2,	loop_71
	move	%icc,	%g2,	%g3
	tvs	%xcc,	0x6
	call	loop_72
loop_71:
	call	loop_73
	flushw
	movrgez	%o6,	%o2,	%o0
loop_72:
	addcc	%i7,	%i1,	%o3
loop_73:
	movvs	%icc,	%i0,	%o5
	edge8l	%g4,	%l2,	%l0
	call	loop_74
	fornot2s	%f19,	%f27,	%f21
	fpsub32	%f18,	%f24,	%f8
	movrgz	%o4,	%i4,	%g6
loop_74:
	movo	%fcc3,	%g1,	%i3
	call	loop_75
	fbl,a	%fcc3,	loop_76
	movug	%fcc2,	%l5,	%i2
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc2
loop_75:
	orn	%l6,	%o7,	%i6
loop_76:
	nop
	set	0x58, %i5
	stx	%g7,	[%l7 + %i5]
	fmovrse	%g5,	%f17,	%f0
	tn	%xcc,	0x1
	edge8l	%l3,	%o1,	%l4
	call	loop_77
	movvc	%icc,	0x5F9,	%l1
	movpos	%icc,	%g2,	%g3
	call	loop_78
loop_77:
	fnot1	%f26,	%f28
	nop
	setx	0x2A9EA7EE0CCD39AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x5A3DB6D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f28,	%f12
	movul	%fcc1,	%i5,	%o6
loop_78:
	fxors	%f0,	%f27,	%f29
	fnegs	%f31,	%f27
	call	loop_79
	tn	%xcc,	0x6
	fornot2s	%f9,	%f17,	%f0
	call	loop_80
loop_79:
	tl	%xcc,	0x5
	call	loop_81
	fsrc1	%f18,	%f22
loop_80:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_81:
	call	loop_82
	srl	%o0,	%i7,	%o2
	fmovdule	%fcc3,	%f8,	%f10
	call	loop_83
loop_82:
	movpos	%icc,	0x672,	%o3
	xnor	%i1,	0x1C27,	%o5
	or	%i0,	0x1CC1,	%g4
loop_83:
	call	loop_84
	tne	%icc,	0x6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0
loop_84:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA36, 	%hsys_tick_cmpr
	call	loop_85
	call	loop_86
	fmovdne	%icc,	%f2,	%f8
	call	loop_87
loop_85:
	call	loop_88
loop_86:
	fnot1	%f24,	%f12
	movl	%xcc,	%o4,	%i4
loop_87:
	fmovrsgez	%g1,	%f20,	%f25
loop_88:
	fcmps	%fcc3,	%f13,	%f21
	call	loop_89
	call	loop_90
	fcmpes	%fcc1,	%f15,	%f22
	call	loop_91
loop_89:
	fcmps	%fcc2,	%f10,	%f7
loop_90:
	edge16n	%i3,	%g6,	%i2
	rdhpr	%hsys_tick_cmpr,	%l6
loop_91:
	call	loop_92
	fmul8x16au	%f22,	%f26,	%f18
	nop
	setx	0xC86D5E066D09A2D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x05D6394540ECF24F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f24,	%f16
	bvs	%xcc,	loop_93
loop_92:
	prefetch	[%l7 + 0x10],	 1
	movlg	%fcc1,	%l5,	%i6
	srax	%o7,	0x08,	%g5
loop_93:
	movrgz	%g7,	%o1,	%l4
	rdpr	%cleanwin,	%l3
	tgu	%icc,	0x4
	call	loop_94
	bmask	%g2,	%l1,	%g3
	rdhpr	%hpstate,	%i5
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f6
loop_94:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x59] %asi,	%o0
	call	loop_95
	udivx	%o6,	%o2,	%o3
	ldd	[%l7 + 0x70],	%f28
	sdiv	%i7,	0x00,	%o5
loop_95:
	edge8ln	%i1,	%g4,	%l2
	fpsub32	%f22,	%f6,	%f20
	wr	%g0,	0x2a,	%asi
	stda	%i0,	[%l7 + 0x10] %asi
	membar	#Sync
	nop
	set	0x58, %l3
	prefetch	[%l7 + %l3],	 0
	call	loop_96
	subcc	%l0,	0x19F1,	%o4
	fzeros	%f8
	movgu	%icc,	0x09C,	%g1
loop_96:
	addc	%i3,	%i4,	%g6
	call	loop_97
	add	%l6,	0x1CBF,	%l5
	fbn,pt	%fcc0,	loop_98
	fnegd	%f26,	%f18
loop_97:
	srlx	%i6,	%i2,	%g5
	rd	%tick_cmpr,	%g7
loop_98:
	fmovsvs	%xcc,	%f30,	%f9
	nop
	fitos	%f9,	%f9
	fstox	%f9,	%f12
	fxtos	%f12,	%f15
	tsubcc	%o1,	%l4,	%l3
	udivcc	%o7,	%g2,	%g3
	call	loop_99
	movrgz	%l1,	0x2F3,	%o0
	fnors	%f15,	%f10,	%f5
	call	loop_100
loop_99:
	movrlz	%o6,	0x1C9,	%i5
	movg	%fcc0,	%o3,	%i7
	fpadd16	%f12,	%f18,	%f8
loop_100:
	call	loop_101
	fmovsule	%fcc1,	%f26,	%f29
	rdpr	%wstate,	%o2
	fcmps	%fcc2,	%f29,	%f30
loop_101:
	flushw
	tvs	%icc,	0x1
	fmovrdlez	%i1,	%f0,	%f28
	ta	%icc,	0x5
	fmovsa	%fcc0,	%f9,	%f20
	fmovrsgz	%o5,	%f28,	%f17
	ld	[%l7 + 0x10],	%f28
	fmovdg	%icc,	%f16,	%f30
	fbue	%fcc1,	loop_102
	addcc	%l2,	0x1621,	%i0
	fmovsg	%fcc3,	%f28,	%f2
	xnorcc	%g4,	%l0,	%g1
loop_102:
	fmovdug	%fcc1,	%f18,	%f12
	call	loop_103
	nop
	fitos	%f4,	%f1
	fstox	%f1,	%f22
	fxtos	%f22,	%f22
	fmovdul	%fcc2,	%f22,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9CD, 	%tick_cmpr
loop_103:
	fors	%f26,	%f10,	%f21
	brz,pn	%i4,	loop_104
	movvs	%icc,	%g6,	%l6
	udivcc	%i3,	0x00,	%i6
	sll	%i2,	0x0D,	%g5
loop_104:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_105
	ble,a	%xcc,	loop_106
	call	loop_107
	ldx	[%l7 + 0x18],	%g7
loop_105:
	call	loop_108
loop_106:
	fpack16	%f14,	%f3
loop_107:
	fmovrdne	%o1,	%f26,	%f0
	tvs	%icc,	0x4
loop_108:
	fmovsneg	%xcc,	%f31,	%f1
	fbul	%fcc1,	loop_109
	nop
	setx	0xCC1ADB59,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xE94F58BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f14,	%f14
	call	loop_110
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
loop_109:
	fmovspos	%icc,	%f18,	%f2
	andncc	%l4,	0x0D09,	%l3
loop_110:
	call	loop_111
	fmul8x16au	%f28,	%f10,	%f12
	call	loop_112
	fpsub16s	%f31,	%f6,	%f10
loop_111:
	fcmpd	%fcc2,	%f18,	%f8
	call	loop_113
loop_112:
	for	%f20,	%f22,	%f26
	nop
	setx	0xCE4033F270BA67EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xEBA4086717642239,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f28,	%f24
	nop
	setx	0x6BD7C918,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f19
loop_113:
	ba	%xcc,	loop_114
	fbn,a,pt	%fcc3,	loop_115
	bmask	%l5,	%o7,	%g2
	fmuld8ulx16	%f8,	%f15,	%f24
loop_114:
	udivx	%l1,	0x00,	%g3
loop_115:
	movcc	%icc,	0x6E6,	%o6
	movrne	%i5,	%o3,	%o0
	sra	%o2,	0x1F,	%i7
	call	loop_116
	call	loop_117
	fcmpne16	%f2,	%f6,	%o5
	tcc	%icc,	0x2
loop_116:
	call	loop_118
loop_117:
	call	loop_119
	call	loop_120
	call	loop_121
loop_118:
	fmovsne	%xcc,	%f18,	%f16
loop_119:
	sllx	%l2,	0x18,	%i1
loop_120:
	add	%i0,	%g4,	%l0
loop_121:
	call	loop_122
	fmovdpos	%xcc,	%f22,	%f18
	call	loop_123
	alignaddrl	%o4,	%i4,	%g6
loop_122:
	tneg	%icc,	0x5
	call	loop_124
loop_123:
	call	loop_125
	call	loop_126
	bneg,a	%icc,	loop_127
loop_124:
	movrgz	%g1,	0x0B2,	%i3
loop_125:
	fornot1s	%f15,	%f21,	%f11
loop_126:
	rdhpr	%ver,	%l6
loop_127:
	nop
	wr	%g0,	0x04,	%asi
	stha	%i6,	[%l7 + 0x1E] %asi
	ldsb	[%l7 + 0x0B],	%i2
	call	loop_128
	tpos	%xcc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA6A, 	%sys_tick_cmpr
	call	loop_129
loop_128:
	tne	%icc,	0x6
	pdist	%f6,	%f12,	%f22
	fnegs	%f20,	%f5
loop_129:
	brz	%l4,	loop_130
	fpmerge	%f30,	%f26,	%f28
	movul	%fcc0,	0x41E,	%l3
	fmovsge	%xcc,	%f25,	%f11
loop_130:
	call	loop_131
	nop
	setx	0x38F4C60D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f17
	call	loop_132
	call	loop_133
loop_131:
	taddcctv	%l5,	%g5,	%g2
	call	loop_134
loop_132:
	fone	%f8
loop_133:
	srlx	%l1,	%g3,	%o7
	fones	%f4
loop_134:
	call	loop_135
	rd	%fprs,	%i5
	fmovdlg	%fcc0,	%f28,	%f0
	call	loop_136
loop_135:
	orn	%o6,	%o3,	%o2
	edge32	%i7,	%o5,	%o0
	fcmpgt32	%f30,	%f4,	%i1
loop_136:
	fornot2s	%f31,	%f9,	%f6
	orcc	%l2,	%g4,	%i0
	call	loop_137
	fpsub32s	%f13,	%f14,	%f10
	sdivx	%l0,	0x00,	%i4
	te	%xcc,	0x1
loop_137:
	call	loop_138
	call	loop_139
	call	loop_140
	wr	%g6,	0x0F92,	%y
loop_138:
	fmul8ulx16	%f0,	%f22,	%f26
loop_139:
	call	loop_141
loop_140:
	fmovdvc	%xcc,	%f0,	%f12
	tleu	%xcc,	0x1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x04,	%f0
loop_141:
	fpsub32	%f16,	%f30,	%f8
	rdpr	%cleanwin,	%o4
	taddcctv	%g1,	0x135E,	%l6
	fmovdvs	%xcc,	%f0,	%f20
	taddcctv	%i3,	%i2,	%g7
	bcc,a,pn	%xcc,	loop_142
	wrpr	%o1,	0x1AA2,	%tick
	popc	0x1B5A,	%l4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x80
loop_142:
	tgu	%xcc,	0x6
	fmovrdlz	%i6,	%f30,	%f14
	call	loop_143
	call	loop_144
	taddcctv	%l3,	0x0AA8,	%l5
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f18
loop_143:
	tge	%xcc,	0x7
loop_144:
	call	loop_145
	movrlz	%g5,	0x209,	%g2
	fandnot2	%f24,	%f6,	%f20
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g3,	%l1
loop_145:
	fmovdvc	%xcc,	%f16,	%f18
	fmovsneg	%xcc,	%f5,	%f29
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 29
!	Type a   	: 27
!	Type x   	: 15
!	Type cti   	: 145
!	Type f   	: 142
!	Type i   	: 142
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
	set	0x1,	%g2
	set	0x4,	%g3
	set	0x0,	%g4
	set	0xF,	%g5
	set	0x3,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0xE,	%i1
	set	-0xD,	%i2
	set	-0xE,	%i3
	set	-0x9,	%i4
	set	-0xC,	%i5
	set	-0xE,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x6996BBAB,	%l0
	set	0x2F17B9C9,	%l1
	set	0x7885E358,	%l2
	set	0x68A14C0C,	%l3
	set	0x017E3E41,	%l4
	set	0x3A4EA2D6,	%l5
	set	0x5093D613,	%l6
	!# Output registers
	set	0x090F,	%o0
	set	0x009E,	%o1
	set	-0x037B,	%o2
	set	-0x0016,	%o3
	set	-0x0BA0,	%o4
	set	-0x0320,	%o5
	set	0x0348,	%o6
	set	-0x090A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	popc	%o7,	%i5
	fandnot2s	%f5,	%f19,	%f10
	call	loop_146
	movvc	%icc,	0x650,	%o6
	brnz	%o3,	loop_147
	udiv	%o2,	0x00,	%o5
loop_146:
	fmovdleu	%xcc,	%f18,	%f20
	rd	%tick_cmpr,	%i7
loop_147:
	tne	%icc,	0x5
	mulx	%i1,	0x111F,	%l2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x77] %asi,	%o0
	call	loop_148
	subccc	%i0,	0x19BD,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x723, 	%hsys_tick_cmpr
	rdhpr	%hpstate,	%o4
loop_148:
	call	loop_149
	edge32	%g6,	%g1,	%i3
	fnot2s	%f23,	%f19
	rdpr	%gl,	%l6
loop_149:
	st	%f7,	[%l7 + 0x1C]
	call	loop_150
	fpadd32s	%f1,	%f13,	%f2
	call	loop_151
	edge32l	%g7,	%o1,	%l4
loop_150:
	addcc	%i6,	%l3,	%l5
	call	loop_152
loop_151:
	movneg	%xcc,	0x7C8,	%i2
	call	loop_153
	call	loop_154
loop_152:
	movo	%fcc0,	0x722,	%g2
	alignaddr	%g3,	%g5,	%o7
loop_153:
	call	loop_155
loop_154:
	popc	0x1191,	%l1
	andn	%o6,	%i5,	%o2
	fmovrdlz	%o5,	%f28,	%f8
loop_155:
	rdpr	%wstate,	%o3
	bpos,pn	%xcc,	loop_156
	call	loop_157
	fands	%f22,	%f27,	%f30
	fmovsge	%fcc1,	%f7,	%f18
loop_156:
	call	loop_158
loop_157:
	call	loop_159
	call	loop_160
	call	loop_161
loop_158:
	fnot1	%f22,	%f8
loop_159:
	add	%i7,	%l2,	%o0
loop_160:
	mulx	%i0,	%g4,	%i1
loop_161:
	call	loop_162
	fmovrslez	%l0,	%f26,	%f6
	fcmpes	%fcc2,	%f28,	%f4
	fmovspos	%xcc,	%f4,	%f11
loop_162:
	nop
	fitod	%f29,	%f2
	call	loop_163
	call	loop_164
	fmovrdlz	%o4,	%f2,	%f0
	fnegd	%f12,	%f10
loop_163:
	call	loop_165
loop_164:
	fmovrse	%i4,	%f19,	%f25
	call	loop_166
	call	loop_167
loop_165:
	fornot2s	%f30,	%f12,	%f2
	fmovdne	%fcc0,	%f0,	%f24
loop_166:
	and	%g6,	0x1349,	%i3
loop_167:
	or	%g1,	%g7,	%o1
	call	loop_168
	fmovscc	%xcc,	%f19,	%f9
	fcmpne32	%f30,	%f26,	%l4
	fmovdcc	%icc,	%f4,	%f4
loop_168:
	fnegd	%f0,	%f28
	smul	%i6,	0x05F3,	%l6
	call	loop_169
	edge32	%l3,	%l5,	%i2
	call	loop_170
	fmovrsgez	%g3,	%f9,	%f9
loop_169:
	tleu	%icc,	0x3
	call	loop_171
loop_170:
	tcc	%xcc,	0x3
	tneg	%icc,	0x4
	sllx	%g2,	0x06,	%o7
loop_171:
	be	%icc,	loop_172
	alignaddr	%g5,	%l1,	%o6
	call	loop_173
	call	loop_174
loop_172:
	fmovrde	%i5,	%f2,	%f12
	call	loop_175
loop_173:
	call	loop_176
loop_174:
	call	loop_177
	fmovdul	%fcc1,	%f16,	%f22
loop_175:
	call	loop_178
loop_176:
	fnand	%f28,	%f14,	%f28
loop_177:
	fmovslg	%fcc2,	%f30,	%f25
	call	loop_179
loop_178:
	fmovrdlez	%o5,	%f20,	%f30
	brnz,a,pn	%o2,	loop_180
	fmovdle	%fcc1,	%f8,	%f0
loop_179:
	andcc	%i7,	%l2,	%o3
	call	loop_181
loop_180:
	call	loop_182
	call	loop_183
	fcmpgt32	%f28,	%f28,	%i0
loop_181:
	nop
	fitos	%f10,	%f0
	fstox	%f0,	%f22
loop_182:
	movcs	%icc,	%g4,	%i1
loop_183:
	nop
	setx	0x7EA4B6E7116CCC4A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC37E8FBD1C0ED95F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f0,	%f24
	wrpr	%o0,	0x1F54,	%cwp
	mova	%icc,	0x424,	%o4
	mova	%icc,	0x45C,	%l0
	fmovsn	%icc,	%f9,	%f15
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f15
	movre	%g6,	%i3,	%i4
	fcmpne16	%f22,	%f4,	%g1
	movule	%fcc1,	%g7,	%o1
	movvc	%xcc,	0x07C,	%l4
	fmovdgu	%xcc,	%f8,	%f26
	fbl,pt	%fcc2,	loop_184
	call	loop_185
	fandnot2s	%f12,	%f12,	%f7
	call	loop_186
loop_184:
	tsubcctv	%l6,	0x136E,	%i6
loop_185:
	fmuld8ulx16	%f13,	%f7,	%f20
	movn	%fcc0,	0x35C,	%l3
loop_186:
	fmovsl	%fcc1,	%f1,	%f30
	umul	%l5,	%i2,	%g2
	nop
	setx	0xF14C47C85202F80D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x132765836B6B790C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f8,	%f6
	edge8ln	%g3,	%g5,	%o7
	pdist	%f8,	%f30,	%f10
	edge32	%l1,	%o6,	%o5
	wrpr	%i5,	0x1724,	%tick
	movug	%fcc2,	0x2C6,	%o2
	fcmpgt16	%f14,	%f0,	%i7
	fmovdl	%icc,	%f10,	%f16
	call	loop_187
	orn	%l2,	0x0DF8,	%i0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x6F] %asi,	%o3
loop_187:
	orcc	%i1,	0x0087,	%g4
	call	loop_188
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f7
	call	loop_189
	ta	%xcc,	0x5
loop_188:
	fmovsug	%fcc2,	%f8,	%f3
	tgu	%icc,	0x7
loop_189:
	fand	%f0,	%f18,	%f4
	fmovrslz	%o4,	%f15,	%f26
	smulcc	%o0,	0x10F4,	%g6
	call	loop_190
	stb	%l0,	[%l7 + 0x78]
	call	loop_191
	call	loop_192
loop_190:
	fba,a,pn	%fcc2,	loop_193
	bneg,pt	%xcc,	loop_194
loop_191:
	movuge	%fcc3,	0x3F8,	%i4
loop_192:
	fcmple16	%f28,	%f4,	%i3
loop_193:
	fnors	%f30,	%f22,	%f13
loop_194:
	ldstub	[%l7 + 0x6D],	%g1
	call	loop_195
	fmovdu	%fcc2,	%f4,	%f10
	fmovdg	%icc,	%f30,	%f4
	call	loop_196
loop_195:
	fmovrsgz	%g7,	%f23,	%f30
	nop
	setx	0xE6E9FC8C87C26BC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD4C31E0E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f20,	%f10
	fcmpd	%fcc0,	%f24,	%f12
loop_196:
	call	loop_197
	nop
	setx	0xB2986FDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xC97C87D3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f24,	%f0
	call	loop_198
	array16	%l4,	%o1,	%l6
loop_197:
	wr 	%g0, 	0x4, 	%fprs
	array16	%i6,	%l5,	%g2
loop_198:
	call	loop_199
	andcc	%i2,	%g5,	%o7
	fmovsne	%fcc1,	%f19,	%f2
	smul	%g3,	0x1774,	%l1
loop_199:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sir	0x08FE
	andn	%o5,	%i5,	%o2
	fornot1s	%f19,	%f14,	%f8
	call	loop_200
	bmask	%o6,	%l2,	%i7
	edge8l	%i0,	%i1,	%g4
	call	loop_201
loop_200:
	tvc	%xcc,	0x6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%o3
loop_201:
	tg	%xcc,	0x7
	fmovsleu	%icc,	%f6,	%f28
	fone	%f28
	mova	%fcc1,	0x319,	%o0
	wrpr	%o4,	%l0,	%pil
	movgu	%icc,	%i4,	%i3
	fnand	%f6,	%f22,	%f6
	edge8	%g1,	%g7,	%l4
	call	loop_202
	tvs	%icc,	0x7
	bge,a	%xcc,	loop_203
	srlx	%o1,	%l6,	%l3
loop_202:
	ta	%xcc,	0x4
	tvc	%icc,	0x5
loop_203:
	sra	%g6,	%i6,	%g2
	movrne	%i2,	%g5,	%l5
	fbne	%fcc3,	loop_204
	tge	%xcc,	0x1
	call	loop_205
	movug	%fcc0,	%o7,	%l1
loop_204:
	call	loop_206
	fba,a,pn	%fcc0,	loop_207
loop_205:
	fandnot2	%f18,	%f24,	%f10
	fmovrdgez	%g3,	%f20,	%f8
loop_206:
	sdivx	%o5,	%i5,	%o6
loop_207:
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f29
	udivx	%l2,	%o2,	%i7
	sth	%i0,	[%l7 + 0x08]
	fpsub32s	%f6,	%f8,	%f0
	fmul8x16au	%f19,	%f25,	%f18
	srl	%i1,	%o3,	%o0
	call	loop_208
	fpadd16	%f0,	%f12,	%f14
	call	loop_209
	bl,a	%xcc,	loop_210
loop_208:
	call	loop_211
	fbg,a	%fcc2,	loop_212
loop_209:
	call	loop_213
loop_210:
	edge16n	%o4,	%l0,	%g4
loop_211:
	mulscc	%i4,	0x08D4,	%g1
loop_212:
	st	%fsr,	[%l7 + 0x68]
loop_213:
	edge16ln	%i3,	%l4,	%g7
	fmovdo	%fcc3,	%f30,	%f22
	ldx	[%l7 + 0x68],	%l6
	nop
	setx	0x42B1B79701AF68C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x24A835FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f2,	%f14
	or	%o1,	0x176D,	%g6
	fpsub16s	%f31,	%f0,	%f17
	alignaddr	%l3,	%g2,	%i6
	fones	%f14
	fmul8sux16	%f10,	%f30,	%f8
	xorcc	%i2,	0x1575,	%l5
	movule	%fcc2,	0x4E2,	%g5
	fabss	%f1,	%f12
	movneg	%icc,	0x3C5,	%l1
	call	loop_214
	fmovdug	%fcc2,	%f22,	%f4
	rd	%ccr,	%g3
	call	loop_215
loop_214:
	sdivcc	%o5,	0x00,	%i5
	movrlz	%o6,	0x032,	%o7
	rd	%tick_cmpr,	%l2
loop_215:
	nop
	set	0x48, %g5
	std	%f28,	[%l7 + %g5]
	fzeros	%f19
	popc	%i7,	%o2
	fmul8ulx16	%f24,	%f2,	%f14
	call	loop_216
	call	loop_217
	fornot1	%f20,	%f10,	%f22
	call	loop_218
loop_216:
	fcmpne32	%f0,	%f20,	%i0
loop_217:
	nop
	set	0x30, %l0
	stwa	%o3,	[%l7 + %l0] 0xe2
	membar	#Sync
loop_218:
	nop
	setx	0x535A0DB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f16
	call	loop_219
	alignaddrl	%i1,	%o4,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCC6, 	%hsys_tick_cmpr
	set	0x7C, %i0
	stba	%i4,	[%l7 + %i0] 0x04
loop_219:
	edge8ln	%o0,	%i3,	%l4
	fbo,pt	%fcc1,	loop_220
	movg	%xcc,	0x5D6,	%g7
	addccc	%l6,	%g1,	%o1
	call	loop_221
loop_220:
	nop
	set	0x58, %g7
	prefetch	[%l7 + %g7],	 0
	flush	%l7 + 0x58

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_221:
	brlz,pt	%i6,	loop_222
	or	%g6,	%l5,	%g5
	rdhpr	%hsys_tick_cmpr,	%i2
	udiv	%g3,	%o5,	%i5
loop_222:
	edge32n	%l1,	%o7,	%o6
	call	loop_223
	movn	%fcc2,	0x3D4,	%l2
	nop
	setx	0x5C90D9DDFA43CB42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x78F49BB16577985D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f12,	%f2
	movrlz	%o2,	%i0,	%i7
loop_223:
	call	loop_224
	edge16ln	%o3,	%o4,	%l0
	xnorcc	%g4,	%i4,	%o0
	sra	%i3,	0x1D,	%i1
loop_224:
	call	loop_225
	fmovdge	%icc,	%f28,	%f4
	rdpr	%wstate,	%l4
	fmovdn	%xcc,	%f18,	%f18
loop_225:
	fabsd	%f26,	%f14
	call	loop_226
	umulcc	%g7,	0x060D,	%l6
	fmovsneg	%icc,	%f24,	%f26
	fmovsug	%fcc2,	%f11,	%f8
loop_226:
	fmul8x16au	%f9,	%f7,	%f2
	nop
	setx	0xD3A3489A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f10
	nop
	setx	0xFFFCD4FBAADAD9F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB89BDEE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f16,	%f6
	wr	%g0,	0x27,	%asi
	stha	%o1,	[%l7 + 0x36] %asi
	membar	#Sync

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC92, 	%hsys_tick_cmpr
	edge32n	%g2,	%l3,	%i6
	fmovsgu	%xcc,	%f23,	%f20
	call	loop_227
	sdivcc	%g6,	%g5,	%i2
	fnot2s	%f20,	%f31
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x16,	%f0
loop_227:
	call	loop_228
	fones	%f9
	sethi	0x179B,	%g3
	sub	%o5,	%i5,	%l1
loop_228:
	fmul8x16	%f9,	%f12,	%f10
	fxors	%f31,	%f0,	%f22
	orncc	%l5,	%o7,	%l2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movvc	%xcc,	%o2,	%i0
	fpack32	%f18,	%f0,	%f8
	rdhpr	%hintp,	%o6
	movul	%fcc3,	0x5A7,	%o3
	movne	%fcc2,	%i7,	%o4
	bmask	%l0,	%i4,	%o0
	fxor	%f28,	%f4,	%f12
	call	loop_229
	call	loop_230
	fsrc2	%f24,	%f30
	tvs	%icc,	0x0
loop_229:
	call	loop_231
loop_230:
	fmul8x16au	%f16,	%f28,	%f22
	call	loop_232
	wr	%i3,	%g4,	%y
loop_231:
	fpack16	%f4,	%f7
	call	loop_233
loop_232:
	fbg	%fcc3,	loop_234
	fxors	%f18,	%f19,	%f21
	fmovdo	%fcc0,	%f14,	%f30
loop_233:
	array32	%l4,	%g7,	%l6
loop_234:
	srl	%i1,	0x04,	%o1
	call	loop_235
	call	loop_236
	edge32n	%g1,	%l3,	%g2
	wrpr	%g6,	%g5,	%cwp
loop_235:
	addccc	%i2,	0x1AC5,	%g3
loop_236:
	bg,a,pn	%xcc,	loop_237
	fors	%f31,	%f0,	%f29
	edge8	%o5,	%i5,	%l1
	nop
	set	0x3B, %l5
	ldsb	[%l7 + %l5],	%i6
loop_237:
	edge16n	%o7,	%l2,	%l5
	call	loop_238
	call	loop_239
	mulx	%o2,	%i0,	%o6
	add	%i7,	%o4,	%l0
loop_238:
	fmovsug	%fcc3,	%f13,	%f21
loop_239:
	srax	%o3,	0x06,	%i4
	call	loop_240
	tg	%icc,	0x2
	call	loop_241
	wrpr 	%g0, 	0x3, 	%gl
loop_240:
	call	loop_242
	fabss	%f10,	%f24
loop_241:
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f4
	fmovrslez	%l4,	%f5,	%f11
loop_242:
	fmovslg	%fcc2,	%f4,	%f13
	fmovdule	%fcc0,	%f12,	%f14
	call	loop_243
	fcmple16	%f16,	%f2,	%i3
	call	loop_244
	movne	%xcc,	%l6,	%i1
loop_243:
	fabss	%f28,	%f23
	movuge	%fcc3,	0x2D2,	%g7
loop_244:
	andn	%o1,	0x1A80,	%g1
	subc	%l3,	0x085A,	%g6
	fmovdneg	%xcc,	%f26,	%f20
	popc	%g5,	%i2
	for	%f0,	%f10,	%f14
	call	loop_245
	call	loop_246
	call	loop_247
	movrgz	%g2,	%g3,	%i5
loop_245:
	movrne	%l1,	0x150,	%i6
loop_246:
	tcc	%xcc,	0x3
loop_247:
	fmovsge	%fcc2,	%f6,	%f22
	fmovdneg	%icc,	%f4,	%f20
	call	loop_248
	call	loop_249
	fmovrsne	%o5,	%f15,	%f25
	brnz,a	%l2,	loop_250
loop_248:
	call	loop_251
loop_249:
	xnorcc	%o7,	0x1C46,	%o2
	orncc	%l5,	0x0235,	%i0
loop_250:
	fsrc2s	%f15,	%f16
loop_251:
	call	loop_252
	call	loop_253
	fnand	%f18,	%f4,	%f24
	edge32	%o6,	%i7,	%o4
loop_252:
	bcs,pn	%xcc,	loop_254
loop_253:
	fmovsneg	%xcc,	%f24,	%f19
	fmovdge	%fcc1,	%f2,	%f16
	call	loop_255
loop_254:
	fpsub16s	%f0,	%f1,	%f4
	call	loop_256
	orncc	%o3,	%i4,	%l0
loop_255:
	movug	%fcc3,	%o0,	%l4
	call	loop_257
loop_256:
	call	loop_258
	call	loop_259
	fnot2s	%f11,	%f31
loop_257:
	movne	%xcc,	%i3,	%g4
loop_258:
	rdhpr	%hintp,	%l6
loop_259:
	call	loop_260
	call	loop_261
	fcmps	%fcc2,	%f28,	%f22
	movg	%icc,	0x0BD,	%g7
loop_260:
	call	loop_262
loop_261:
	fcmps	%fcc3,	%f14,	%f9
	sll	%i1,	0x19,	%g1
	call	loop_263
loop_262:
	fandnot2	%f28,	%f10,	%f0
	movcs	%icc,	0x3D8,	%l3
	movge	%fcc0,	%g6,	%g5
loop_263:
	te	%icc,	0x3
	call	loop_264
	movl	%fcc3,	0x232,	%o1
	fcmpes	%fcc0,	%f16,	%f25
	call	loop_265
loop_264:
	wr	%g2,	%i2,	%softint
	orn	%g3,	0x0626,	%l1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%i5
loop_265:
	wr	%i6,	%l2,	%sys_tick
	fmovduge	%fcc3,	%f22,	%f20
	brgz,a,pn	%o7,	loop_266
	call	loop_267
	call	loop_268
	fmovdle	%fcc0,	%f26,	%f10
loop_266:
	taddcc	%o2,	0x02FF,	%l5
loop_267:
	call	loop_269
loop_268:
	xorcc	%o5,	%i0,	%o6
	call	loop_270
	call	loop_271
loop_269:
	udiv	%i7,	0x00,	%o3
	orncc	%i4,	%o4,	%o0
loop_270:
	fnot1s	%f13,	%f27
loop_271:
	rdhpr	%hintp,	%l4
	nop
	setx	0x0085D3E717856E48,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2941CD4ED0DAD8E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f4
	rdhpr	%hintp,	%i3
	call	loop_272
	movg	%fcc3,	0x4D6,	%g4
	fcmpd	%fcc3,	%f2,	%f0
	call	loop_273
loop_272:
	call	loop_274
	call	loop_275
	fnegd	%f22,	%f22
loop_273:
	call	loop_276
loop_274:
	bcs,a,pt	%icc,	loop_277
loop_275:
	call	loop_278
	xorcc	%l0,	%g7,	%i1
loop_276:
	fbg,a	%fcc3,	loop_279
loop_277:
	fmovrdne	%l6,	%f4,	%f26
loop_278:
	alignaddrl	%l3,	%g6,	%g5
	call	loop_280
loop_279:
	fnegd	%f4,	%f14
	fmovsgu	%xcc,	%f17,	%f22
	call	loop_281
loop_280:
	ldub	[%l7 + 0x68],	%o1
	call	loop_282
	brlz,a,pn	%g2,	loop_283
loop_281:
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	movule	%fcc1,	%g1,	%i2
loop_282:
	addcc	%g3,	%l1,	%i5
loop_283:
	movleu	%icc,	0x041,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x2C8, 	%sys_tick_cmpr
	call	loop_284
	fpsub16s	%f17,	%f18,	%f19
	call	loop_285
	movlg	%fcc1,	%o2,	%o7
loop_284:
	call	loop_286
	call	loop_287
loop_285:
	rdpr	%tba,	%l5
	rdpr	%cwp,	%i0
loop_286:
	bshuffle	%f20,	%f20,	%f12
loop_287:
	fornot2	%f4,	%f2,	%f26
	fmovrse	%o5,	%f7,	%f31
	move	%icc,	%o6,	%o3
	fcmpne16	%f4,	%f14,	%i4
	fmovsg	%xcc,	%f30,	%f22
	movvc	%xcc,	0x7B5,	%o4
	fmovdul	%fcc3,	%f8,	%f26
	tleu	%xcc,	0x4
	call	loop_288
	rd	%ccr,	%o0
	call	loop_289
	tsubcc	%i7,	0x1385,	%i3
loop_288:
	tneg	%icc,	0x1
	call	loop_290
loop_289:
	fbuge,pn	%fcc0,	loop_291
	pdist	%f20,	%f18,	%f2
	call	loop_292
loop_290:
	fmovdpos	%icc,	%f24,	%f24
loop_291:
	rdpr	%cansave,	%l4
	move	%fcc3,	%l0,	%g4
loop_292:
	fmovsneg	%xcc,	%f29,	%f3
	nop
	setx	0xB7CC82A724E3A5AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xCB446C05FE542FCB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f10,	%f28
	nop
	set	0x62, %l2
	ldsh	[%l7 + %l2],	%i1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 21
!	Type a   	: 30
!	Type x   	: 8
!	Type cti   	: 147
!	Type f   	: 142
!	Type i   	: 152
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
	set	0xF,	%g2
	set	0xE,	%g3
	set	0xC,	%g4
	set	0x5,	%g5
	set	0x3,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xA,	%i1
	set	-0xD,	%i2
	set	-0x3,	%i3
	set	-0x1,	%i4
	set	-0xF,	%i5
	set	-0x1,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x1F0FFA03,	%l0
	set	0x314B9288,	%l1
	set	0x2700504E,	%l2
	set	0x1F5B447B,	%l3
	set	0x1D329645,	%l4
	set	0x43373710,	%l5
	set	0x41C8C4CD,	%l6
	!# Output registers
	set	-0x1D4D,	%o0
	set	-0x0F52,	%o1
	set	0x079A,	%o2
	set	0x1BE2,	%o3
	set	-0x0C84,	%o4
	set	0x15C1,	%o5
	set	-0x18C4,	%o6
	set	-0x15FA,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	call	loop_293
	fmovsgu	%xcc,	%f0,	%f21
	call	loop_294
	call	loop_295
loop_293:
	fbug,pt	%fcc0,	loop_296
	fmovdo	%fcc3,	%f18,	%f30
loop_294:
	faligndata	%f10,	%f24,	%f4
loop_295:
	tge	%icc,	0x4
loop_296:
	fnand	%f26,	%f30,	%f2
	call	loop_297
	tne	%icc,	0x2
	call	loop_298
	fbn,pn	%fcc2,	loop_299
loop_297:
	fmovsvs	%icc,	%f30,	%f11
	call	loop_300
loop_298:
	movu	%fcc1,	%l6,	%g7
loop_299:
	add	%l3,	0x077B,	%g5
	tsubcctv	%g6,	0x163F,	%o1
loop_300:
	call	loop_301
	popc	%g1,	%g2
	movre	%i2,	%g3,	%l1
	nop
	setx	0xE46FEB689B99EB2D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f22
loop_301:
	fmovdge	%icc,	%f30,	%f30
	movrlz	%i6,	%i5,	%o2
	addccc	%o7,	0x00AC,	%l5
	taddcctv	%i0,	%l2,	%o5
	fpadd32	%f28,	%f30,	%f16
	fabsd	%f28,	%f14
	tgu	%xcc,	0x7
	subc	%o6,	0x0B62,	%o3
	call	loop_302
	fnot1s	%f4,	%f12
	call	loop_303
	edge32l	%o4,	%o0,	%i7
loop_302:
	fnegs	%f8,	%f2
	call	loop_304
loop_303:
	fmovscc	%xcc,	%f6,	%f11
	nop
	fitos	%f2,	%f27
	set	0x72, %o6
	lduha	[%l7 + %o6] 0x11,	%i4
loop_304:
	taddcc	%i3,	0x13A3,	%l0
	call	loop_305
	call	loop_306
	addccc	%l4,	0x16B5,	%g4
	rdhpr	%hsys_tick_cmpr,	%l6
loop_305:
	bn	%icc,	loop_307
loop_306:
	and	%g7,	%l3,	%i1
	call	loop_308
	umul	%g6,	0x16DA,	%g5
loop_307:
	stw	%o1,	[%l7 + 0x28]
	call	loop_309
loop_308:
	call	loop_310
	nop
	setx	0xD1E92B4ABB499CE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE631A036,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f14,	%f30
	call	loop_311
loop_309:
	call	loop_312
loop_310:
	fmovdl	%fcc2,	%f22,	%f30
	call	loop_313
loop_311:
	fnand	%f26,	%f16,	%f20
loop_312:
	call	loop_314
	udivx	%g2,	0x00,	%i2
loop_313:
	nop
	set	0x00, %o5
	ldxa	[%g0 + %o5] 0x50,	%g1
loop_314:
	fmovdcc	%icc,	%f24,	%f2
	nop
	set	0x18, %i3
	std	%f12,	[%l7 + %i3]
	fpsub32s	%f21,	%f30,	%f4
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f12
	sllx	%l1,	%i6,	%i5
	array32	%g3,	%o2,	%o7
	array32	%l5,	%l2,	%i0
	fsrc2s	%f1,	%f12
	sdivx	%o5,	0x00,	%o3
	fmovdneg	%xcc,	%f6,	%f28
	nop
	setx	0xEE141A36617094DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f0
	bshuffle	%f4,	%f14,	%f30
	tn	%xcc,	0x2
	rd	%pc,	%o4
	call	loop_315
	fpsub32s	%f1,	%f11,	%f19
	fnands	%f3,	%f1,	%f28
	call	loop_316
loop_315:
	call	loop_317
	wrpr	%o6,	%i7,	%tick
	call	loop_318
loop_316:
	fzero	%f10
loop_317:
	fpadd32	%f16,	%f4,	%f4
	fmovsuge	%fcc3,	%f14,	%f28
loop_318:
	call	loop_319
	fmovrsgz	%o0,	%f25,	%f6
	fmovsule	%fcc3,	%f12,	%f2
	call	loop_320
loop_319:
	edge32n	%i4,	%l0,	%i3
	ble	%xcc,	loop_321
	array8	%g4,	%l4,	%g7
loop_320:
	te	%xcc,	0x6
	nop
	setx	0x2E68CE6A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f15
loop_321:
	taddcctv	%l6,	0x139D,	%i1
	rdpr	%gl,	%g6
	fones	%f7
	ldsw	[%l7 + 0x40],	%g5
	tle	%icc,	0x5
	call	loop_322
	fnegd	%f2,	%f12
	fmuld8ulx16	%f28,	%f7,	%f12
	bneg,a,pn	%icc,	loop_323
loop_322:
	call	loop_324
	call	loop_325
	call	loop_326
loop_323:
	rd	%ccr,	%l3
loop_324:
	fand	%f8,	%f24,	%f16
loop_325:
	fcmpes	%fcc0,	%f5,	%f6
loop_326:
	array8	%g2,	%o1,	%i2
	fmovsl	%fcc0,	%f28,	%f3
	fbne	%fcc3,	loop_327
	call	loop_328
	call	loop_329
	nop
	setx	0x6CFF040E736307EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBD161C04,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f22,	%f24
loop_327:
	brgez,a	%l1,	loop_330
loop_328:
	call	loop_331
loop_329:
	call	loop_332
	fxnor	%f6,	%f12,	%f16
loop_330:
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%g0
loop_331:
	call	loop_333
loop_332:
	fandnot1s	%f12,	%f21,	%f16
	movule	%fcc2,	%i6,	%i5
	move	%icc,	%g3,	%o2
loop_333:
	edge8	%l5,	%l2,	%o7
	call	loop_334
	call	loop_335
	call	loop_336
	call	loop_337
loop_334:
	fmovs	%f19,	%f31
loop_335:
	fmovsvs	%xcc,	%f0,	%f31
loop_336:
	nop
	fitod	%f4,	%f30
	fdtox	%f30,	%f16
loop_337:
	fble,pt	%fcc1,	loop_338
	fpsub32	%f12,	%f2,	%f2
	fexpand	%f1,	%f10
	nop
	setx	0xD6058C50F660561F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x15FC9272,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f20,	%f2
loop_338:
	movvc	%icc,	0x5CC,	%o5
	siam	0x7
	xorcc	%i0,	0x1E3D,	%o3
	call	loop_339
	edge8ln	%o4,	%o6,	%i7
	call	loop_340
	nop
	set	0x14, %l4
	flush	%l7 + %l4
loop_339:
	te	%xcc,	0x1
	fmovdge	%fcc1,	%f10,	%f30
loop_340:
	call	loop_341
	addccc	%o0,	0x11B7,	%l0
	fmovdcs	%xcc,	%f8,	%f0
	fbn	%fcc1,	loop_342
loop_341:
	nop
	fitos	%f22,	%f19
	call	loop_343
	fmovsgu	%icc,	%f26,	%f5
loop_342:
	addc	%i4,	0x15F4,	%g4
	fpsub32s	%f6,	%f17,	%f7
loop_343:
	rdhpr	%hsys_tick_cmpr,	%l4
	call	loop_344
	fmovrde	%i3,	%f18,	%f2
	call	loop_345
	bge,a,pn	%icc,	loop_346
loop_344:
	fmovdpos	%icc,	%f24,	%f20
	call	loop_347
loop_345:
	movn	%fcc2,	%l6,	%g7
loop_346:
	tne	%xcc,	0x6
	call	loop_348
loop_347:
	call	loop_349
	fcmpne32	%f18,	%f14,	%g6
	te	%xcc,	0x1
loop_348:
	fpack16	%f6,	%f20
loop_349:
	nop
	setx	0xD4CCA203,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x3DA39D4F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f26,	%f24
	call	loop_350
	edge8	%g5,	%i1,	%l3
	fandnot1s	%f23,	%f0,	%f19
	call	loop_351
loop_350:
	alignaddrl	%o1,	%i2,	%g2
	call	loop_352
	call	loop_353
loop_351:
	fornot1s	%f10,	%f29,	%f1
	call	loop_354
loop_352:
	alignaddr	%l1,	%i6,	%i5
loop_353:
	fmovdg	%icc,	%f28,	%f6
	fmovrdgz	%g1,	%f22,	%f24
loop_354:
	fornot2	%f12,	%f6,	%f28
	fmovdn	%xcc,	%f24,	%f24
	bvs,a	%xcc,	loop_355
	tg	%xcc,	0x0
	call	loop_356
	fbo,a	%fcc2,	loop_357
loop_355:
	fones	%f6
	tsubcc	%g3,	%o2,	%l2
loop_356:
	call	loop_358
loop_357:
	call	loop_359
	addcc	%l5,	0x02AD,	%o7
	sdiv	%i0,	0x00,	%o5
loop_358:
	fmovsneg	%icc,	%f7,	%f27
loop_359:
	nop
	setx	0x70962B63B81BEA0D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x77AFAE9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f14,	%f24
	fmovdcc	%icc,	%f0,	%f22
	nop
	setx	0x01355932,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f7
	wrpr 	%g0, 	0x3, 	%gl
	rdhpr	%hintp,	%o6
	sub	%i7,	0x0F30,	%o4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%l0
	fmovso	%fcc1,	%f18,	%f1
	tne	%icc,	0x4
	set	0x2E, %o7
	lduba	[%l7 + %o7] 0x0c,	%i4
	array32	%g4,	%i3,	%l4
	call	loop_360
	rdhpr	%hsys_tick_cmpr,	%g7
	movpos	%icc,	0x02B,	%g6
	flushw
loop_360:
	fornot1s	%f31,	%f15,	%f21
	wrpr 	%g0, 	0x0, 	%gl
	taddcctv	%i1,	%o1,	%i2
	call	loop_361
	fnot2s	%f25,	%f14
	andcc	%l3,	%g2,	%l1
	fmovsn	%icc,	%f15,	%f4
loop_361:
	stx	%fsr,	[%l7 + 0x10]
	fcmpeq16	%f16,	%f30,	%i5
	stb	%i6,	[%l7 + 0x26]
	rdpr	%cwp,	%g1
	movvs	%icc,	0x351,	%o2
	umul	%l2,	%g3,	%o7
	call	loop_362
	wr	%l5,	%o5,	%set_softint
	call	loop_363
	orcc	%o3,	0x1466,	%o6
loop_362:
	nop
	set	0x76, %g1
	lduha	[%l7 + %g1] 0x18,	%i7
loop_363:
	fmovdvs	%xcc,	%f22,	%f6
	movrlez	%i0,	0x258,	%o0
	wr	%g0,	0xd1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	taddcctv	%l0,	0x0B56,	%o4
	fmovdule	%fcc0,	%f4,	%f28
	tle	%xcc,	0x4
	fbug,a	%fcc0,	loop_364
	andcc	%i4,	0x1E4F,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fors	%f16,	%f26,	%f24
loop_364:
	add	%g7,	%g6,	%i3
	xorcc	%l6,	0x1A05,	%i1
	fpadd16s	%f20,	%f17,	%f0
	fmuld8sux16	%f22,	%f6,	%f4
	fmovrdgz	%o1,	%f20,	%f12
	call	loop_365
	fmovsne	%xcc,	%f11,	%f11
	fnegd	%f18,	%f14
	membar	0x1A
loop_365:
	sub	%i2,	0x1F62,	%l3
	ble,pn	%xcc,	loop_366
	call	loop_367
	fmovs	%f22,	%f23
	wrpr	%g5,	%g2,	%pil
loop_366:
	udivx	%i5,	%i6,	%l1
loop_367:
	call	loop_368
	movgu	%xcc,	%o2,	%g1
	call	loop_369
	subcc	%l2,	0x1AAD,	%o7
loop_368:
	fpack16	%f26,	%f5
	taddcc	%l5,	0x16C9,	%g3
loop_369:
	orn	%o3,	%o5,	%o6
	andncc	%i7,	%o0,	%l0
	bleu,a,pn	%icc,	loop_370
	edge32ln	%i0,	%o4,	%g4
	movvc	%xcc,	%i4,	%g7
	rd	%sys_tick_cmpr,	%l4
loop_370:
	call	loop_371
	fmovdo	%fcc3,	%f2,	%f4
	movcs	%icc,	0x25A,	%i3
	edge32n	%g6,	%l6,	%o1
loop_371:
	popc	0x119B,	%i1
	call	loop_372
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%l3
	movre	%g5,	%g2,	%i5
	movle	%fcc3,	%i2,	%l1
loop_372:
	tcs	%icc,	0x5
	fornot2	%f26,	%f8,	%f18
	nop
	setx loop_373, %l0, %l1
	jmpl %l1, %o2
	fcmps	%fcc0,	%f8,	%f16
	fmovdn	%xcc,	%f26,	%f18
	movle	%fcc0,	0x0E6,	%i6
loop_373:
	fmuld8ulx16	%f6,	%f13,	%f28
	st	%f30,	[%l7 + 0x64]
	tsubcc	%l2,	0x090F,	%o7
	call	loop_374
	movul	%fcc2,	0x765,	%g1
	fmovdo	%fcc3,	%f2,	%f2
	call	loop_375
loop_374:
	fnegd	%f2,	%f10
	call	loop_376
	rdpr	%tl,	%g3
loop_375:
	ld	[%l7 + 0x48],	%f27
	call	loop_377
loop_376:
	fmovsa	%icc,	%f4,	%f25
	fmovdo	%fcc0,	%f22,	%f30
	fbo,a,pt	%fcc2,	loop_378
loop_377:
	rdpr	%cansave,	%o3
	fabsd	%f2,	%f18
	fpackfix	%f14,	%f23
loop_378:
	call	loop_379
	fmovsul	%fcc2,	%f7,	%f23
	sllx	%o5,	%l5,	%i7
	rd	%ccr,	%o6
loop_379:
	edge32l	%l0,	%i0,	%o0
	for	%f2,	%f0,	%f20
	rd	%y,	%o4
	fxnor	%f24,	%f12,	%f20
	fmul8ulx16	%f18,	%f8,	%f22
	fmovrslz	%i4,	%f25,	%f11
	nop
	setx	0xA42048A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x7DFCA438,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f25,	%f29
	edge32ln	%g7,	%g4,	%l4
	membar	0x3A
	xnor	%i3,	%l6,	%o1
	call	loop_380
	call	loop_381
	fabsd	%f18,	%f4
	tvs	%icc,	0x4
loop_380:
	srax	%g6,	0x19,	%i1
loop_381:
	call	loop_382
	bshuffle	%f10,	%f14,	%f10
	edge16l	%g5,	%l3,	%i5
	movneg	%icc,	%i2,	%l1
loop_382:
	nop
	setx	loop_383,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034400001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012400001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_385
	nop
	setx	0x3D893CFBA767A38B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2C862D08FB48F1C6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f12
loop_383:
	movge	%xcc,	%o2,	%i6
loop_384:
	fxnor	%f24,	%f0,	%f16
loop_385:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	addccc	%g2,	0x057F,	%l2
	movgu	%icc,	0x0F0,	%o7
	sll	%g1,	0x06,	%o3
	udivcc	%g3,	0x00,	%l5
	call	loop_386
	andn	%o5,	%o6,	%l0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%i7
loop_386:
	fmul8sux16	%f20,	%f10,	%f24
	fpack32	%f28,	%f2,	%f10
	rdhpr	%hsys_tick_cmpr,	%o0
	fmovrdlez	%i0,	%f12,	%f8
	call	loop_387
	fmovdue	%fcc0,	%f18,	%f12
	fmovrdlez	%o4,	%f22,	%f18
	call	loop_388
loop_387:
	flush	%l7 + 0x0C
	movuge	%fcc2,	0x7EA,	%g7
	fnand	%f24,	%f28,	%f12
loop_388:
	call	loop_389
	call	loop_390
	call	loop_391
	fmovdcc	%icc,	%f6,	%f14
loop_389:
	ba,pn	%xcc,	loop_392
loop_390:
	nop
	setx	0xF04B127C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x5EA70ACD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f0,	%f3
loop_391:
	call	loop_393
	fand	%f18,	%f20,	%f6
loop_392:
	fmovsue	%fcc0,	%f13,	%f23
	or	%g4,	0x1120,	%l4
loop_393:
	call	loop_394
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fxnors	%f2,	%f18,	%f1
	movpos	%icc,	%i4,	%l6
loop_394:
	fmovdue	%fcc2,	%f4,	%f16
	orcc	%i3,	%g6,	%o1
	fabss	%f13,	%f7
	call	loop_395
	call	loop_396
	fmovsgu	%xcc,	%f27,	%f6
	fmovsleu	%xcc,	%f23,	%f28
loop_395:
	call	loop_397
loop_396:
	fmovdg	%xcc,	%f28,	%f8
	fnand	%f10,	%f2,	%f10
	rdpr	%gl,	%g5
loop_397:
	call	loop_398
	fabsd	%f16,	%f2
	call	loop_399
	movg	%fcc1,	%i1,	%i5
loop_398:
	call	loop_400
	fbg	%fcc2,	loop_401
loop_399:
	rdpr	%tba,	%l3
	mova	%xcc,	0x16D,	%l1
loop_400:
	taddcc	%i2,	0x184A,	%i6
loop_401:
	fmovdne	%fcc3,	%f4,	%f26
	fmul8x16au	%f14,	%f13,	%f12
	call	loop_402
	call	loop_403
	nop
	set	0x64, %i4
	ldub	[%l7 + %i4],	%o2
	nop
	setx	0x421619D299B6A88B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f14
loop_402:
	ta	%icc,	0x7
loop_403:
	fmovduge	%fcc3,	%f30,	%f18
	fmovsge	%fcc3,	%f12,	%f8
	fmovdge	%fcc3,	%f26,	%f6
	fsrc1s	%f14,	%f17
	call	loop_404
	tle	%xcc,	0x2
	call	loop_405
	ba,a,pt	%xcc,	loop_406
loop_404:
	move	%xcc,	%l2,	%o7
	call	loop_407
loop_405:
	addcc	%g1,	%g2,	%o3
loop_406:
	nop
	setx	0x75F06A69B2ACFFF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE4081142,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f16,	%f14
	edge16l	%l5,	%o5,	%g3
loop_407:
	nop
	setx	0x50350961,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x2890DD74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f25,	%f16
	call	loop_408
	call	loop_409
	fmovdne	%fcc3,	%f18,	%f22
	call	loop_410
loop_408:
	fmovsa	%fcc2,	%f28,	%f28
loop_409:
	fpsub16s	%f10,	%f26,	%f16
	orn	%l0,	%o6,	%i7
loop_410:
	fmovsge	%fcc1,	%f4,	%f7
	call	loop_411
	fcmpeq16	%f4,	%f24,	%o0
	fcmpgt16	%f22,	%f28,	%o4
	call	loop_412
loop_411:
	xor	%i0,	0x0A51,	%g7
	sllx	%g4,	0x16,	%l4
	wr 	%g0, 	0x6, 	%fprs
loop_412:
	nop
	setx	0xEACF00C5F0BD6110,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xDEC3844319A26715,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f4,	%f28
	fmovsge	%fcc3,	%f10,	%f6
	nop
	fitos	%f6,	%f25
	fstox	%f25,	%f22
	rdpr	%pil,	%i3
	edge16ln	%l6,	%o1,	%g6
	call	loop_413
	tleu	%icc,	0x3
	call	loop_414
	fnegd	%f18,	%f8
loop_413:
	fcmpeq16	%f16,	%f24,	%g5
	set	0x70, %o2
	stba	%i1,	[%l7 + %o2] 0x19
loop_414:
	fandnot1s	%f1,	%f12,	%f4
	fmovrse	%i5,	%f13,	%f31
	fnands	%f26,	%f29,	%f12
	call	loop_415
	be,pn	%xcc,	loop_416
	fmovsuge	%fcc0,	%f14,	%f14
	sub	%l1,	0x029E,	%l3
loop_415:
	fpsub32	%f24,	%f24,	%f0
loop_416:
	fmovdul	%fcc1,	%f4,	%f16
	call	loop_417
	fnegd	%f4,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_418
loop_417:
	nop
	fitos	%f11,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f8
	fpadd16s	%f7,	%f31,	%f13
	fmovse	%fcc2,	%f25,	%f1
loop_418:
	tgu	%xcc,	0x7
	subcc	%i2,	0x0407,	%o2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdg	%icc,	%f22,	%f30
	fmovdne	%icc,	%f18,	%f14
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%l2
	call	loop_419
	movug	%fcc2,	0x31F,	%g1
	set	0x54, %g4
	swapa	[%l7 + %g4] 0x88,	%g2
loop_419:
	movrne	%o3,	%l5,	%o7
	udiv	%g3,	%l0,	%o6
	fpsub16s	%f19,	%f14,	%f9
	fmovd	%f4,	%f16
	fmovrsne	%i7,	%f27,	%f11
	nop
	set	0x54, %i6
	ldsh	[%l7 + %i6],	%o5
	tcc	%xcc,	0x4
	fandnot2	%f30,	%f22,	%f18
	fmovdcs	%icc,	%f16,	%f24
	edge16ln	%o0,	%i0,	%g7
	fandnot2	%f24,	%f30,	%f28
	nop
	set	0x20, %i2
	stx	%o4,	[%l7 + %i2]
	umul	%l4,	%g4,	%i4
	fbne,a,pt	%fcc1,	loop_420
	sdiv	%i3,	0x00,	%o1
	mulscc	%l6,	%g6,	%g5
	fmovs	%f6,	%f19
loop_420:
	lduh	[%l7 + 0x72],	%i5
	edge16ln	%l1,	%i1,	%l3
	fcmpes	%fcc1,	%f31,	%f3
	tgu	%icc,	0x1
	call	loop_421
	fors	%f4,	%f20,	%f26
	call	loop_422
	wr	%i2,	%o2,	%clear_softint
loop_421:
	call	loop_423
	fbg,a,pn	%fcc3,	loop_424
loop_422:
	subccc	%l2,	%g1,	%g2
	ta	%xcc,	0x3
loop_423:
	udiv	%o3,	0x00,	%i6
loop_424:
	fone	%f4
	set	0x7C, %l1
	lduha	[%l7 + %l1] 0x88,	%o7
	sethi	0x199E,	%l5
	call	loop_425
	std	%f10,	[%l7 + 0x78]
	call	loop_426
	call	loop_427
loop_425:
	fcmpne16	%f24,	%f24,	%l0
	st	%fsr,	[%l7 + 0x3C]
loop_426:
	fcmple32	%f30,	%f2,	%g3
loop_427:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 28
!	Type a   	: 26
!	Type x   	: 10
!	Type cti   	: 135
!	Type f   	: 166
!	Type i   	: 135
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
	set	0x4,	%g1
	set	0x3,	%g2
	set	0xD,	%g3
	set	0x0,	%g4
	set	0xF,	%g5
	set	0xF,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x4,	%i1
	set	-0xF,	%i2
	set	-0xC,	%i3
	set	-0x8,	%i4
	set	-0xC,	%i5
	set	-0x5,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x26C090E7,	%l0
	set	0x65D5E977,	%l1
	set	0x24FBBB85,	%l2
	set	0x75F879AC,	%l3
	set	0x678C7968,	%l4
	set	0x082AA534,	%l5
	set	0x5EAA59DB,	%l6
	!# Output registers
	set	-0x1DE8,	%o0
	set	0x1D62,	%o1
	set	-0x1F9D,	%o2
	set	-0x08CD,	%o3
	set	0x16F2,	%o4
	set	-0x1C77,	%o5
	set	-0x1C21,	%o6
	set	0x08B5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	fexpand	%f6,	%f30
	call	loop_428
	xorcc	%o6,	%o5,	%o0
	nop
	setx	0x122BAB81184799B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x76A45DC00E7EB3C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f18,	%f28
	pdist	%f2,	%f10,	%f2
loop_428:
	edge32ln	%i0,	%i7,	%g7
	fmovsn	%icc,	%f13,	%f13
	fcmpeq32	%f10,	%f28,	%o4
	call	loop_429
	fcmpeq32	%f10,	%f18,	%l4
	call	loop_430
	edge8l	%i4,	%i3,	%g4
loop_429:
	call	loop_431
	call	loop_432
loop_430:
	fexpand	%f16,	%f14
	call	loop_433
loop_431:
	fandnot2s	%f26,	%f16,	%f4
loop_432:
	xnor	%o1,	%l6,	%g5
	fmovdul	%fcc0,	%f22,	%f16
loop_433:
	call	loop_434
	array16	%i5,	%g6,	%i1
	fsrc1s	%f17,	%f15
	tgu	%xcc,	0x4
loop_434:
	call	loop_435
	xnor	%l1,	%i2,	%l3
	fandnot2s	%f20,	%f25,	%f5
	fmovrsgez	%l2,	%f19,	%f24
loop_435:
	fcmpd	%fcc1,	%f28,	%f4
	sra	%o2,	%g1,	%o3
	fors	%f10,	%f24,	%f12
	edge8ln	%g2,	%o7,	%i6
	fnot2	%f14,	%f10
	set	0x10, %o0
	ldsba	[%l7 + %o0] 0x10,	%l0
	movge	%xcc,	%g3,	%l5
	add	%o5,	0x08BD,	%o0
	fornot2	%f4,	%f4,	%f14
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32l	%o6,	%i7,	%g7
	call	loop_436
	xnorcc	%i0,	0x0314,	%l4
	fmovdne	%fcc0,	%f18,	%f20
	andcc	%i4,	0x0E2D,	%i3
loop_436:
	fmovdue	%fcc0,	%f28,	%f2
	call	loop_437
	call	loop_438
	call	loop_439
	fmovsvs	%icc,	%f0,	%f31
loop_437:
	fpadd32s	%f4,	%f13,	%f16
loop_438:
	udiv	%g4,	%o4,	%l6
loop_439:
	fcmpne16	%f14,	%f6,	%g5
	sub	%i5,	%g6,	%i1
	smulcc	%l1,	0x143A,	%i2
	rdhpr	%hsys_tick_cmpr,	%o1
	sir	0x1362
	call	loop_440
	fmovdgu	%xcc,	%f20,	%f12
	call	loop_441
	fmovsn	%fcc2,	%f18,	%f2
loop_440:
	movrne	%l2,	%l3,	%g1
	nop
	fitos	%f14,	%f25
	fstod	%f25,	%f2
loop_441:
	call	loop_442
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%o2
	mulscc	%o3,	%g2,	%i6
	alignaddr	%l0,	%g3,	%o7
loop_442:
	fcmpne32	%f10,	%f28,	%l5
	nop
	setx	0x6C63C883,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x3D41F27F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f9,	%f26
	call	loop_443
	fmovsle	%xcc,	%f1,	%f31
	call	loop_444
	fbule	%fcc1,	loop_445
loop_443:
	call	loop_446
	xorcc	%o0,	0x1821,	%o6
loop_444:
	rdpr	%cwp,	%o5
loop_445:
	call	loop_447
loop_446:
	call	loop_448
	call	loop_449
	fmovde	%xcc,	%f22,	%f12
loop_447:
	edge16ln	%g7,	%i7,	%i0
loop_448:
	fmovdn	%xcc,	%f28,	%f20
loop_449:
	siam	0x5
	call	loop_450
	call	loop_451
	call	loop_452
	call	loop_453
loop_450:
	array16	%l4,	%i4,	%g4
loop_451:
	fcmpgt32	%f24,	%f6,	%o4
loop_452:
	fmovrsgez	%l6,	%f25,	%f15
loop_453:
	ble	%xcc,	loop_454
	fxors	%f12,	%f7,	%f0
	call	loop_455
	smulcc	%i3,	0x0F5C,	%g5
loop_454:
	call	loop_456
	fsrc2s	%f21,	%f10
loop_455:
	ld	[%l7 + 0x34],	%f27
	movcs	%icc,	0x69B,	%g6
loop_456:
	fabss	%f27,	%f13
	fcmpes	%fcc1,	%f28,	%f20
	rdpr	%cleanwin,	%i5
	stbar
	nop
	setx	loop_457,	%l0,	%l1
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
	udivx	%i1,	%i2,	%o1
	wrpr	%l1,	%l3,	%pil
	call	loop_458
loop_457:
	call	loop_459
	movge	%xcc,	%l2,	%g1
	fandnot1	%f18,	%f24,	%f26
loop_458:
	fmovsg	%xcc,	%f10,	%f5
loop_459:
	call	loop_460
	tpos	%xcc,	0x3
	srl	%o2,	%g2,	%o3
	nop
	set	0x6C, %i5
	stb	%l0,	[%l7 + %i5]
loop_460:
	fmovrsne	%i6,	%f23,	%f25
	movcc	%xcc,	%o7,	%l5
	rdhpr	%hintp,	%g3
	fmovdvc	%icc,	%f12,	%f18
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xe3,	%o0
	tcs	%icc,	0x7
	movrne	%o6,	0x155,	%o5
	movrlz	%g7,	0x194,	%i0
	addccc	%l4,	%i7,	%i4
	udiv	%o4,	0x00,	%g4
	fmovdneg	%icc,	%f10,	%f16
	fnot1	%f28,	%f16
	tsubcc	%l6,	0x03EB,	%i3
	call	loop_461
	subcc	%g6,	0x1195,	%g5
	rdhpr	%htba,	%i5
	fbuge,a	%fcc3,	loop_462
loop_461:
	fbuge,pn	%fcc3,	loop_463
	fmovdg	%icc,	%f26,	%f4
	movrne	%i2,	%o1,	%l1
loop_462:
	call	loop_464
loop_463:
	fcmped	%fcc2,	%f2,	%f24
	call	loop_465
	fnors	%f1,	%f21,	%f22
loop_464:
	fmovdneg	%xcc,	%f6,	%f26
	faligndata	%f30,	%f6,	%f24
loop_465:
	call	loop_466
	fcmple16	%f18,	%f26,	%l3
	call	loop_467
	call	loop_468
loop_466:
	nop
	setx	loop_469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x034100001401,	%l0,	%l1
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
	fpadd16s	%f31,	%f22,	%f17
loop_467:
	mova	%icc,	%l2,	%i1
loop_468:
	fmovrdlez	%g1,	%f12,	%f28
loop_469:
	edge32	%o2,	%g2,	%o3
	call	loop_470
	orn	%i6,	%l0,	%o7
	tcc	%xcc,	0x3
	call	loop_471
loop_470:
	nop
	setx	0x4D23EE5F51C99A7F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x7B98A278FB91EDBF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f8
	call	loop_472
	movue	%fcc2,	0x25E,	%l5
loop_471:
	nop
	setx	0x412E39AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x25357018,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f24,	%f13
	call	loop_473
loop_472:
	fmovsg	%fcc3,	%f3,	%f2
	tne	%xcc,	0x6
	call	loop_474
loop_473:
	tvs	%xcc,	0x0
	movcc	%icc,	%g3,	%o6
	call	loop_475
loop_474:
	nop
	fitos	%f31,	%f1
	std	%o0,	[%l7 + 0x60]
	fmovsleu	%icc,	%f0,	%f15
loop_475:
	fand	%f8,	%f2,	%f30
	fmovspos	%icc,	%f16,	%f13
	call	loop_476
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f20
	movrlz	%g7,	0x30E,	%o5
	fpack32	%f26,	%f18,	%f4
loop_476:
	tne	%xcc,	0x6
	array8	%i0,	%l4,	%i4
	popc	0x005B,	%o4
	fmovda	%xcc,	%f6,	%f10
	fors	%f7,	%f29,	%f10
	nop
	setx	0x01095E2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x1FA243E0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f1,	%f27
	call	loop_477
	fone	%f16
	ba	%xcc,	loop_478
	fmovdvs	%xcc,	%f12,	%f20
loop_477:
	call	loop_479
	call	loop_480
loop_478:
	call	loop_481
	call	loop_482
loop_479:
	siam	0x4
loop_480:
	fmul8ulx16	%f22,	%f16,	%f14
loop_481:
	xor	%g4,	%l6,	%i7
loop_482:
	taddcc	%i3,	0x0594,	%g5
	fnors	%f30,	%f14,	%f19
	fabss	%f20,	%f9
	edge32	%g6,	%i5,	%i2
	tge	%xcc,	0x2
	fmovsul	%fcc1,	%f7,	%f3
	movrlez	%o1,	%l3,	%l2
	tge	%xcc,	0x7
	nop
	setx loop_483, %l0, %l1
	jmpl %l1, %i1
	rdpr	%otherwin,	%l1
	call	loop_484
	srax	%g1,	0x0F,	%g2
loop_483:
	andn	%o2,	%o3,	%i6
	fnot2	%f20,	%f0
loop_484:
	fpsub16s	%f10,	%f22,	%f4
	movrlez	%l0,	0x3BC,	%o7
	subc	%g3,	0x1F47,	%l5
	umul	%o0,	0x0A5B,	%o6
	edge16ln	%g7,	%i0,	%l4
	call	loop_485
	movrne	%o5,	0x26F,	%i4
	movne	%xcc,	%g4,	%o4
	bvs	%icc,	loop_486
loop_485:
	fmovsul	%fcc3,	%f0,	%f17
	call	loop_487
	call	loop_488
loop_486:
	fbug	%fcc2,	loop_489
	call	loop_490
loop_487:
	nop
	fitos	%f0,	%f3
	fstox	%f3,	%f20
loop_488:
	nop
	set	0x60, %i1
	ldsha	[%l7 + %i1] 0x18,	%i7
loop_489:
	srax	%i3,	%l6,	%g5
loop_490:
	srlx	%g6,	0x0D,	%i2
	movrgez	%i5,	%o1,	%l2
	call	loop_491
	call	loop_492
	fmovsu	%fcc3,	%f3,	%f6
	fmovdug	%fcc1,	%f20,	%f0
loop_491:
	fnot1	%f30,	%f8
loop_492:
	nop
	setx	0xB4FF5012EB096441,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9D93F6214774476B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f4,	%f20
	fpmerge	%f17,	%f0,	%f28
	call	loop_493
	call	loop_494
	movpos	%xcc,	0x4C6,	%i1
	xorcc	%l1,	%l3,	%g1
loop_493:
	call	loop_495
loop_494:
	movue	%fcc2,	0x0D1,	%g2
	fbuge,a	%fcc0,	loop_496
	rdpr	%gl,	%o2
loop_495:
	movle	%fcc1,	%i6,	%l0
	call	loop_497
loop_496:
	call	loop_498
	edge32ln	%o3,	%o7,	%g3
	call	loop_499
loop_497:
	fmovsa	%xcc,	%f5,	%f24
loop_498:
	fmovrslez	%o0,	%f29,	%f19
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x81,	 4
loop_499:
	rdpr	%canrestore,	%g7
	fpsub16	%f8,	%f10,	%f26
	fpsub16	%f6,	%f12,	%f22
	ldx	[%l7 + 0x78],	%o6
	fmovsg	%xcc,	%f7,	%f17
	fpsub16s	%f30,	%f18,	%f29
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l4,	%i0
	movne	%fcc2,	%o5,	%i4
	andncc	%o4,	%i7,	%g4
	call	loop_500
	call	loop_501
	fmul8x16	%f14,	%f4,	%f6
	movne	%xcc,	%l6,	%g5
loop_500:
	call	loop_502
loop_501:
	call	loop_503
	call	loop_504
	call	loop_505
loop_502:
	movvs	%xcc,	%g6,	%i3
loop_503:
	sir	0x1D47
loop_504:
	movl	%fcc3,	%i5,	%i2
loop_505:
	call	loop_506
	fmovsle	%fcc0,	%f21,	%f8
	fcmped	%fcc2,	%f16,	%f6
	wrpr	%o1,	%l2,	%tick
loop_506:
	call	loop_507
	movul	%fcc1,	%i1,	%l3
	fnot1	%f10,	%f18
	movug	%fcc2,	%g1,	%g2
loop_507:
	taddcc	%o2,	0x1A3C,	%i6
	fornot2	%f26,	%f0,	%f20
	call	loop_508
	call	loop_509
	st	%f10,	[%l7 + 0x30]
	call	loop_510
loop_508:
	mulx	%l1,	%l0,	%o7
loop_509:
	edge16	%o3,	%g3,	%o0
	fmovrdlz	%g7,	%f18,	%f12
loop_510:
	fmovdvs	%icc,	%f26,	%f8
	nop
	setx	0x4A9049E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xBB3A1A53,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f17,	%f13
	fpackfix	%f16,	%f4
	sethi	0x0E42,	%o6
	call	loop_511
	sub	%l5,	0x1B76,	%l4
	fandnot2	%f0,	%f18,	%f10
	fmovdlg	%fcc0,	%f6,	%f22
loop_511:
	alignaddr	%o5,	%i0,	%i4
	wrpr	%o4,	0x003D,	%pil
	sdivcc	%g4,	%l6,	%g5
	edge8l	%i7,	%g6,	%i3
	fcmple16	%f8,	%f22,	%i2
	fbug,pt	%fcc3,	loop_512
	tpos	%icc,	0x1
	call	loop_513
	nop
	setx	loop_514,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x001200001401,	%l0,	%l1
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
loop_512:
	srl	%o1,	0x09,	%l2
	wrpr 	%g0, 	0x3, 	%gl
loop_513:
	stbar
loop_514:
	rdhpr	%htba,	%l3
	andncc	%g1,	0x15DC,	%i5
	nop
	fitos	%f13,	%f31
	fstod	%f31,	%f4
	rd	%sys_tick_cmpr,	%o2
	call	loop_515
	fpmerge	%f23,	%f7,	%f18
	call	loop_516
	nop
	setx	0xD3B273D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD622C7A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f11,	%f27
loop_515:
	edge8	%i6,	%g2,	%l1
	call	loop_517
loop_516:
	fcmpd	%fcc3,	%f30,	%f22
	bleu	%icc,	loop_518
	wrpr 	%g0, 	0x0, 	%gl
loop_517:
	tcs	%icc,	0x5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%g3
loop_518:
	rd	%sys_tick_cmpr,	%o0
	call	loop_519
	rdpr	%pil,	%o3
	tle	%icc,	0x4
	sdivx	%g7,	0x00,	%l5
loop_519:
	srl	%o6,	%l4,	%o5
	fmovslg	%fcc1,	%f0,	%f11
	rd	%fprs,	%i0
	bvs,a	%xcc,	loop_520
	call	loop_521
	fmovrdne	%o4,	%f16,	%f20
	udiv	%i4,	%g4,	%g5
loop_520:
	fmovdvs	%icc,	%f8,	%f8
loop_521:
	call	loop_522
	edge16l	%l6,	%i7,	%g6
	popc	%i2,	%i3
	orn	%l2,	0x0071,	%i1
loop_522:
	movue	%fcc0,	%l3,	%g1
	sdiv	%o1,	0x00,	%o2
	tcs	%icc,	0x4
	call	loop_523
	fxor	%f22,	%f16,	%f6
	fcmps	%fcc1,	%f21,	%f11
	nop
	fitos	%f3,	%f6
	fstod	%f6,	%f14
loop_523:
	call	loop_524
	fxnor	%f22,	%f16,	%f4
	call	loop_525
	for	%f14,	%f26,	%f10
loop_524:
	fmovda	%xcc,	%f16,	%f6
	rdpr	%cleanwin,	%i5
loop_525:
	fmovrsgz	%i6,	%f24,	%f4
	call	loop_526
	fzeros	%f30
	array32	%l1,	%o7,	%l0
	prefetch	[%l7 + 0x48],	 2
loop_526:
	call	loop_527
	call	loop_528
	st	%fsr,	[%l7 + 0x78]
	tgu	%xcc,	0x1
loop_527:
	tvc	%xcc,	0x6
loop_528:
	call	loop_529
	movuge	%fcc0,	%g2,	%g3
	call	loop_530
	fmovdleu	%xcc,	%f16,	%f6
loop_529:
	fmovd	%f30,	%f24
	tpos	%icc,	0x7
loop_530:
	nop
	setx	0xEED3A951ABAF4614,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%o0
	movvs	%icc,	%g7,	%l5
	call	loop_531
	fmovso	%fcc0,	%f5,	%f1
	nop
	set	0x34, %l0
	lduh	[%l7 + %l0],	%o6
	fornot2	%f12,	%f12,	%f16
loop_531:
	fmovdgu	%xcc,	%f28,	%f28
	fmuld8sux16	%f22,	%f15,	%f20
	call	loop_532
	fmovsa	%fcc0,	%f13,	%f31
	wr	%l4,	0x1825,	%softint
	tle	%xcc,	0x6
loop_532:
	nop
	wr	%g0,	0x10,	%asi
	stba	%i0,	[%l7 + 0x49] %asi
	call	loop_533
	fbg,a	%fcc0,	loop_534
	fmovdvc	%icc,	%f24,	%f12
	call	loop_535
loop_533:
	bmask	%o4,	%o5,	%g4
loop_534:
	fpackfix	%f30,	%f20
	tge	%xcc,	0x1
loop_535:
	fblg	%fcc0,	loop_536
	fmovdue	%fcc0,	%f2,	%f26
	fmovdo	%fcc3,	%f18,	%f30
	udivcc	%i4,	0x00,	%g5
loop_536:
	bmask	%i7,	%g6,	%l6
	ba,pt	%icc,	loop_537
	call	loop_538
	fpadd16s	%f3,	%f14,	%f1
	movrne	%i2,	0x058,	%l2
loop_537:
	andncc	%i1,	0x0F52,	%l3
loop_538:
	tleu	%xcc,	0x5
	call	loop_539
	nop
	setx	0x35B8A07DB75244BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE0B2AD60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f10,	%f14
	xor	%i3,	%o1,	%o2
	call	loop_540
loop_539:
	te	%icc,	0x7
	fnot1	%f0,	%f2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x21] %asi,	%g1
loop_540:
	call	loop_541
	movle	%icc,	0x267,	%i5
	nop
	setx	0x82ED8C7C756F21BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x0F373660BA3A1DC2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f6,	%f20
	fcmpeq16	%f14,	%f8,	%i6
loop_541:
	movcs	%xcc,	0x5C3,	%o7
	xnor	%l1,	%l0,	%g2
	call	loop_542
	smul	%g3,	0x1563,	%o3
	fmovdvs	%icc,	%f16,	%f0
	and	%o0,	%l5,	%g7
loop_542:
	ba	%icc,	loop_543
	nop
	set	0x28, %g5
	swap	[%l7 + %g5],	%o6
	wrpr	%i0,	%l4,	%tick
	fmovscs	%xcc,	%f16,	%f24
loop_543:
	fors	%f9,	%f10,	%f29
	nop
	fitos	%f29,	%f5
	xorcc	%o5,	0x0265,	%g4
	tpos	%icc,	0x2
	fmovrdlez	%i4,	%f12,	%f22
	addccc	%o4,	%i7,	%g6
	call	loop_544
	add	%l6,	%i2,	%l2
	nop
	setx	0xE6B20BB513BB39A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fcmpes	%fcc2,	%f27,	%f20
loop_544:
	call	loop_545
	tpos	%icc,	0x5
	nop
	set	0x5E, %g7
	ldstub	[%l7 + %g7],	%g5
	call	loop_546
loop_545:
	tl	%xcc,	0x1
	call	loop_547
	bne,a,pt	%xcc,	loop_548
loop_546:
	call	loop_549
	fmovde	%xcc,	%f16,	%f10
loop_547:
	movrne	%i1,	0x0D2,	%i3
loop_548:
	call	loop_550
loop_549:
	call	loop_551
	for	%f14,	%f24,	%f18
	rdhpr	%hintp,	%l3
loop_550:
	call	loop_552
loop_551:
	movge	%fcc1,	0x641,	%o1
	fxnors	%f6,	%f30,	%f21
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f21
loop_552:
	movug	%fcc1,	%o2,	%g1
	call	loop_553
	movrne	%i6,	%i5,	%l1
	fmovdg	%xcc,	%f18,	%f22
	call	loop_554
loop_553:
	smul	%o7,	%l0,	%g2
	edge32l	%o3,	%o0,	%g3
	fnegd	%f0,	%f8
loop_554:
	call	loop_555
	call	loop_556
	add	%l5,	0x010E,	%o6
	fmovspos	%xcc,	%f20,	%f9
loop_555:
	call	loop_557
loop_556:
	tne	%icc,	0x0
	sllx	%g7,	%i0,	%l4
	call	loop_558
loop_557:
	fsrc2	%f30,	%f26
	call	loop_559
	faligndata	%f26,	%f0,	%f6
loop_558:
	call	loop_560
	fnegd	%f12,	%f18
loop_559:
	alignaddr	%g4,	%i4,	%o5
	call	loop_561
loop_560:
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f4
	sir	0x0A21
	fmovsneg	%xcc,	%f0,	%f0
loop_561:
	fands	%f19,	%f24,	%f1
	call	loop_562
	movul	%fcc1,	0x771,	%o4
	fbug	%fcc3,	loop_563
	subccc	%i7,	%g6,	%i2
loop_562:
	call	loop_564
	call	loop_565
loop_563:
	call	loop_566
	fmovdn	%fcc2,	%f20,	%f2
loop_564:
	call	loop_567
loop_565:
	wr	%l6,	0x04AC,	%y
loop_566:
	ba,pt	%xcc,	loop_568
	call	loop_569
loop_567:
	nop
	set	0x50, %i0
	std	%f26,	[%l7 + %i0]
	call	loop_570
loop_568:
	te	%icc,	0x4
loop_569:
	movl	%xcc,	%l2,	%g5
	call	loop_571
loop_570:
	srlx	%i3,	%l3,	%o1
	call	loop_572
	call	loop_573
loop_571:
	nop

loop_572:
	nop

loop_573:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 26
!	Type a   	: 23
!	Type x   	: 10
!	Type cti   	: 146
!	Type f   	: 147
!	Type i   	: 148
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
	set	0xE,	%g1
	set	0xD,	%g2
	set	0x0,	%g3
	set	0xE,	%g4
	set	0xF,	%g5
	set	0x4,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x2,	%i1
	set	-0x7,	%i2
	set	-0x5,	%i3
	set	-0x9,	%i4
	set	-0xE,	%i5
	set	-0x9,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x77D3654A,	%l0
	set	0x6B490AE0,	%l1
	set	0x223F0495,	%l2
	set	0x16187772,	%l3
	set	0x504FEF00,	%l4
	set	0x105933BC,	%l5
	set	0x25C79E3C,	%l6
	!# Output registers
	set	0x0AA0,	%o0
	set	-0x0478,	%o1
	set	-0x1B6D,	%o2
	set	0x15E5,	%o3
	set	0x0524,	%o4
	set	0x108D,	%o5
	set	-0x0823,	%o6
	set	0x05C8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	bneg	%icc,	loop_574
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f28
	fxtod	%f28,	%f28
	fmovdge	%fcc3,	%f12,	%f28
	call	loop_575
loop_574:
	fpadd16s	%f4,	%f5,	%f4
	xorcc	%i1,	%o2,	%i6
	call	loop_576
loop_575:
	bmask	%g1,	%l1,	%o7
	tneg	%icc,	0x5
	fba,a,pn	%fcc3,	loop_577
loop_576:
	tne	%xcc,	0x5
	call	loop_578
	andn	%i5,	0x19D3,	%g2
loop_577:
	call	loop_579
	nop
	fitos	%f10,	%f11
loop_578:
	fpsub16s	%f25,	%f26,	%f28
	fzero	%f22
loop_579:
	xorcc	%l0,	0x193D,	%o0
	tl	%xcc,	0x3
	xnorcc	%g3,	%o3,	%l5
	movrgz	%o6,	%i0,	%g7
	tle	%xcc,	0x4
	sll	%g4,	%l4,	%o5
	call	loop_580
	movrne	%o4,	0x124,	%i7
	call	loop_581
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f3
loop_580:
	fpadd32s	%f25,	%f8,	%f27
	add	%i4,	%g6,	%l6
loop_581:
	movvs	%xcc,	%i2,	%l2
	call	loop_582
	rd	%tick_cmpr,	%i3
	fbo,a	%fcc0,	loop_583
	fpsub32s	%f9,	%f23,	%f16
loop_582:
	call	loop_584
	fmovrdgez	%l3,	%f14,	%f24
loop_583:
	andn	%g5,	%o1,	%i1
	sdivx	%i6,	%g1,	%l1
loop_584:
	fpsub32	%f24,	%f22,	%f4
	tsubcctv	%o2,	%i5,	%o7
	call	loop_585
	fcmpeq16	%f24,	%f22,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f10,	[%l7 + 0x18] %asi
loop_585:
	fmovsu	%fcc3,	%f28,	%f17
	fpadd16	%f6,	%f0,	%f22
	call	loop_586
	nop
	fitos	%f10,	%f8
	fstox	%f8,	%f30
	fnor	%f26,	%f28,	%f8
	fmul8sux16	%f26,	%f30,	%f10
loop_586:
	fcmpeq32	%f14,	%f14,	%l0
	call	loop_587
	call	loop_588
	fmovsleu	%xcc,	%f4,	%f26
	movrlez	%o0,	0x240,	%o3
loop_587:
	call	loop_589
loop_588:
	tleu	%xcc,	0x7
	fmovdle	%fcc1,	%f16,	%f14
	brnz	%g3,	loop_590
loop_589:
	fsrc2s	%f28,	%f20
	brgez	%l5,	loop_591
	fmovsne	%fcc1,	%f26,	%f5
loop_590:
	membar	0x55
	bvs,a,pn	%icc,	loop_592
loop_591:
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f8
	call	loop_593
	fones	%f27
loop_592:
	fbu	%fcc0,	loop_594
	fpsub16	%f24,	%f28,	%f24
loop_593:
	tle	%xcc,	0x5
	movpos	%icc,	%i0,	%g7
loop_594:
	call	loop_595
	fmovdvs	%xcc,	%f24,	%f22
	call	loop_596
	edge8	%o6,	%g4,	%l4
loop_595:
	call	loop_597
	membar	0x6F
loop_596:
	call	loop_598
	bpos,pn	%icc,	loop_599
loop_597:
	call	loop_600
	call	loop_601
loop_598:
	array8	%o5,	%i7,	%o4
loop_599:
	ta	%xcc,	0x2
loop_600:
	call	loop_602
loop_601:
	call	loop_603
	nop
	fitos	%f2,	%f27
	fstox	%f27,	%f22
	fxtos	%f22,	%f3
	rd	%pc,	%g6
loop_602:
	call	loop_604
loop_603:
	brgez,pt	%l6,	loop_605
	bvc	%xcc,	loop_606
	movu	%fcc0,	%i4,	%i2
loop_604:
	call	loop_607
loop_605:
	fmul8x16au	%f2,	%f31,	%f30
loop_606:
	fxnors	%f21,	%f31,	%f14
	sll	%l2,	%i3,	%g5
loop_607:
	fabsd	%f2,	%f18
	fmovspos	%xcc,	%f3,	%f21
	fcmple32	%f2,	%f16,	%l3
	andn	%o1,	0x1AB1,	%i6
	sdivcc	%i1,	%l1,	%g1
	fmovrsne	%i5,	%f13,	%f31
	fmovrdgez	%o2,	%f10,	%f0
	fbug,a	%fcc3,	loop_608
	fmovsleu	%xcc,	%f22,	%f2
	fmovdul	%fcc2,	%f10,	%f24
	movule	%fcc1,	%o7,	%g2
loop_608:
	tgu	%xcc,	0x4
	nop
	set	0x40, %l5
	prefetch	[%l7 + %l5],	 2
	nop
	setx	0xB5ABE2DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x307B6081,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f16,	%f4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x04,	%l0,	%o0
	rdpr	%otherwin,	%o3
	edge8ln	%l5,	%g3,	%i0
	call	loop_609
	st	%f1,	[%l7 + 0x34]
	edge16	%o6,	%g7,	%l4
	rdhpr	%hpstate,	%o5
loop_609:
	sethi	0x05C9,	%g4
	call	loop_610
	call	loop_611
	popc	%i7,	%g6
	movlg	%fcc3,	%l6,	%i4
loop_610:
	xorcc	%i2,	%o4,	%i3
loop_611:
	fmovs	%f27,	%f30
	movle	%fcc1,	0x010,	%l2
	wr	%g0,	0xe2,	%asi
	stda	%l2,	[%l7 + 0x30] %asi
	membar	#Sync
	fcmpne32	%f26,	%f10,	%g5
	call	loop_612
	call	loop_613
	nop
	setx	0x47EA2333,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x16E2D577,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f8,	%f31
	fbo	%fcc0,	loop_614
loop_612:
	fmul8x16au	%f8,	%f9,	%f14
loop_613:
	nop
	fitos	%f6,	%f29
	fstox	%f29,	%f10
	fbue,a,pt	%fcc2,	loop_615
loop_614:
	edge16ln	%o1,	%i6,	%l1
	edge8n	%g1,	%i1,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_615:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%g2,	[%l7 + 0x70] %asi
	membar	#Sync
	call	loop_616
	nop
	set	0x6C, %g6
	lduh	[%l7 + %g6],	%l0
	subc	%o0,	%l5,	%g3
	movug	%fcc3,	%i0,	%o3
loop_616:
	fmovda	%icc,	%f28,	%f4
	nop
	fitos	%f3,	%f1
	fstoi	%f1,	%f24
	xorcc	%o6,	%l4,	%g7
	edge32ln	%o5,	%g4,	%i7
	fmovs	%f8,	%f25
	for	%f6,	%f14,	%f10
	call	loop_617
	fmovslg	%fcc0,	%f13,	%f0
	movrgz	%g6,	0x1DA,	%i4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_617:
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_618
	call	loop_619
	fpsub32s	%f9,	%f17,	%f13
	call	loop_620
loop_618:
	fmovsge	%fcc1,	%f8,	%f13
loop_619:
	fcmpeq16	%f4,	%f10,	%i3
	call	loop_621
loop_620:
	fandnot1	%f20,	%f16,	%f24
	call	loop_622
	sllx	%l2,	%l3,	%o4
loop_621:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA6B, 	%hsys_tick_cmpr
	movul	%fcc3,	0x7BA,	%o1
loop_622:
	fbn,a,pn	%fcc2,	loop_623
	fnot2	%f18,	%f22
	nop
	setx	0x9710AD0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x0B228A2B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f23,	%f9
	call	loop_624
loop_623:
	wr	%l1,	%i6,	%sys_tick
	nop
	fitos	%f2,	%f1
	fstox	%f1,	%f4
	fxtos	%f4,	%f21
	call	loop_625
loop_624:
	call	loop_626
	fmovrsgez	%i1,	%f21,	%f22
	fcmpeq16	%f16,	%f16,	%i5
loop_625:
	tne	%xcc,	0x7
loop_626:
	call	loop_627
	edge16ln	%g1,	%o2,	%g2
	fnegs	%f5,	%f14
	tvs	%icc,	0x7
loop_627:
	movul	%fcc1,	0x5AA,	%l0
	edge32l	%o7,	%l5,	%g3
	fmuld8ulx16	%f25,	%f12,	%f22
	fpack16	%f6,	%f9
	fmovrdlz	%o0,	%f22,	%f8
	fpackfix	%f24,	%f27
	edge16	%o3,	%o6,	%i0
	fmovsg	%fcc0,	%f21,	%f14
	fmovsle	%xcc,	%f18,	%f9
	rd	%ccr,	%l4
	fmovrde	%g7,	%f28,	%f0
	fpack16	%f22,	%f9
	fornot1	%f8,	%f20,	%f0
	movvs	%xcc,	%g4,	%o5
	call	loop_628
	fnegd	%f22,	%f6
	sth	%g6,	[%l7 + 0x5C]
	call	loop_629
loop_628:
	sra	%i4,	%i7,	%i2
	wr	%g0,	0x10,	%asi
	stwa	%l6,	[%l7 + 0x14] %asi
loop_629:
	bleu	%icc,	loop_630
	ta	%xcc,	0x2
	call	loop_631
	fandnot1	%f24,	%f26,	%f30
loop_630:
	movvs	%xcc,	0x2B2,	%l2
	fmovrdgz	%i3,	%f26,	%f4
loop_631:
	tle	%xcc,	0x5
	edge32	%l3,	%g5,	%o4
	udiv	%l1,	0x00,	%o1
	movrne	%i1,	0x28E,	%i6
	fnors	%f17,	%f26,	%f31
	call	loop_632
	call	loop_633
	fabsd	%f22,	%f18
	rdpr	%cleanwin,	%g1
loop_632:
	udiv	%i5,	0x00,	%o2
loop_633:
	bg,a,pt	%xcc,	loop_634
	call	loop_635
	fmovdleu	%xcc,	%f28,	%f24
	fmovsleu	%icc,	%f0,	%f16
loop_634:
	nop
	fitos	%f2,	%f16
	fstox	%f16,	%f20
loop_635:
	fsrc2s	%f27,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x00D, 	%hsys_tick_cmpr
	fbg,a,pt	%fcc3,	loop_636
	call	loop_637
	nop
	fitos	%f6,	%f27
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x76] %asi,	%o7
loop_636:
	te	%icc,	0x7
loop_637:
	xnor	%g3,	0x130A,	%l5
	fandnot2	%f14,	%f12,	%f20
	call	loop_638
	fmul8sux16	%f18,	%f2,	%f24
	call	loop_639
	fbo,a	%fcc0,	loop_640
loop_638:
	fmovsuge	%fcc2,	%f14,	%f7
	movgu	%icc,	0x3AE,	%o0
loop_639:
	fcmped	%fcc1,	%f4,	%f24
loop_640:
	call	loop_641
	fmul8x16	%f27,	%f20,	%f24
	bg,a,pt	%xcc,	loop_642
	stx	%o3,	[%l7 + 0x30]
loop_641:
	tg	%icc,	0x6
	smulcc	%i0,	0x0381,	%l4
loop_642:
	addcc	%g7,	%g4,	%o6
	stx	%g6,	[%l7 + 0x48]
	sethi	0x112B,	%o5
	fbule,a	%fcc1,	loop_643
	rdhpr	%ver,	%i4
	movge	%fcc3,	%i7,	%i2
	call	loop_644
loop_643:
	fmovrsgez	%l6,	%f9,	%f16
	call	loop_645
	membar	0x55
loop_644:
	call	loop_646
	fnegs	%f3,	%f16
loop_645:
	bleu,a	%icc,	loop_647
	or	%l2,	0x03B6,	%l3
loop_646:
	fandnot1	%f26,	%f14,	%f20
	call	loop_648
loop_647:
	rdhpr	%ver,	%g5
	wr	%i3,	0x0BC0,	%set_softint
	udivcc	%l1,	0x00,	%o4
loop_648:
	bge,pn	%xcc,	loop_649
	fornot1s	%f18,	%f20,	%f27
	fand	%f16,	%f8,	%f24
	call	loop_650
loop_649:
	call	loop_651
	sir	0x013F
	fmovsuge	%fcc0,	%f23,	%f21
loop_650:
	movgu	%xcc,	0x386,	%i1
loop_651:
	movvs	%icc,	0x6F1,	%i6
	edge16ln	%o1,	%g1,	%i5
	set	0x54, %i7
	lda	[%l7 + %i7] 0x80,	%f3
	fmovdge	%icc,	%f26,	%f20
	udivx	%l0,	0x00,	%o2
	call	loop_652
	rdpr	%otherwin,	%o7
	addc	%g3,	0x0E92,	%l5
	wr	%g2,	%o0,	%y
loop_652:
	orncc	%o3,	0x0ECC,	%i0
	bvs,a	%icc,	loop_653
	fone	%f0
	call	loop_654
	edge8l	%l4,	%g7,	%g4
loop_653:
	call	loop_655
	call	loop_656
loop_654:
	fpmerge	%f15,	%f7,	%f26
	tgu	%xcc,	0x3
loop_655:
	udivx	%o6,	0x00,	%g6
loop_656:
	andn	%o5,	%i7,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x154, 	%hsys_tick_cmpr
	wrpr	%l3,	%g5,	%pil
	fmul8x16al	%f31,	%f6,	%f28
	udiv	%l2,	0x00,	%l1
	array32	%o4,	%i3,	%i1
	movul	%fcc0,	%o1,	%g1
	set	0x78, %o6
	lda	[%l7 + %o6] 0x04,	%f21
	rd	%y,	%i6
	rd	%asi,	%l0
	nop
	setx	0x7655DA4A98DECEB4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1210F1FB6C696461,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f16,	%f22
	fmovsul	%fcc3,	%f24,	%f15
	call	loop_657
	fpack16	%f14,	%f27
	bcc,a,pn	%xcc,	loop_658
	call	loop_659
loop_657:
	fnegd	%f14,	%f26
	brgez	%i5,	loop_660
loop_658:
	fmul8x16	%f15,	%f24,	%f26
loop_659:
	rd	%fprs,	%o7
	nop
	setx	0x37C9B78C705E54CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x174B3AB0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsmuld	%f24,	%f4,	%f20
loop_660:
	nop
	set	0x6E, %o5
	lduh	[%l7 + %o5],	%o2
	call	loop_661
	fmovdule	%fcc3,	%f20,	%f24
	brlz,a,pn	%g3,	loop_662
	nop
	fitod	%f2,	%f16
	fdtos	%f16,	%f3
loop_661:
	fcmpne32	%f8,	%f10,	%g2
	fmovs	%f21,	%f29
loop_662:
	call	loop_663
	sdivcc	%l5,	0x00,	%o3
	movug	%fcc1,	0x69B,	%i0
	fmovsl	%xcc,	%f20,	%f16
loop_663:
	fmuld8sux16	%f21,	%f9,	%f0
	fexpand	%f29,	%f28
	call	loop_664
	for	%f2,	%f24,	%f30
	rdhpr	%hintp,	%o0
	fxnors	%f26,	%f11,	%f31
loop_664:
	fexpand	%f21,	%f6
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f22
	bge,a,pt	%xcc,	loop_665
	array8	%g7,	%g4,	%o6
	fmovdu	%fcc0,	%f12,	%f4
	fmovdl	%icc,	%f30,	%f6
loop_665:
	ldub	[%l7 + 0x09],	%l4
	tpos	%xcc,	0x1
	nop
	fitos	%f1,	%f29
	fstox	%f29,	%f12
	fxtos	%f12,	%f18
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f5
	fandnot1	%f30,	%f4,	%f0
	brgez,a	%o5,	loop_666
	movul	%fcc2,	0x7D8,	%i7
	tcs	%icc,	0x5
	st	%f31,	[%l7 + 0x48]
loop_666:
	fandnot1s	%f9,	%f20,	%f24
	sdivx	%g6,	0x00,	%i4
	rdpr	%wstate,	%i2
	call	loop_667
	fbug	%fcc0,	loop_668
	call	loop_669
	ldsb	[%l7 + 0x23],	%l3
loop_667:
	call	loop_670
loop_668:
	tvs	%icc,	0x2
loop_669:
	fmovrdlz	%g5,	%f16,	%f28
	movge	%xcc,	0x1C5,	%l2
loop_670:
	tvc	%icc,	0x6
	rdhpr	%ver,	%l6
	fbule	%fcc0,	loop_671
	srlx	%l1,	%o4,	%i3
	call	loop_672
	call	loop_673
loop_671:
	fmovrsne	%o1,	%f3,	%f2
	call	loop_674
loop_672:
	fmovsuge	%fcc3,	%f13,	%f21
loop_673:
	alignaddrl	%g1,	%i6,	%i1
	stb	%l0,	[%l7 + 0x56]
loop_674:
	call	loop_675
	call	loop_676
	fornot2s	%f27,	%f5,	%f5
	fabss	%f7,	%f17
loop_675:
	sdiv	%o7,	%i5,	%o2
loop_676:
	fmovdne	%fcc0,	%f2,	%f24
	tle	%xcc,	0x5
	call	loop_677
	call	loop_678
	call	loop_679
	fandnot1s	%f13,	%f24,	%f26
loop_677:
	xor	%g2,	0x0D8C,	%g3
loop_678:
	tg	%xcc,	0x7
loop_679:
	wrpr	%l5,	0x0271,	%pil
	fmovdu	%fcc1,	%f26,	%f10
	bgu	%xcc,	loop_680
	nop
	fitod	%f10,	%f14
	fdtos	%f14,	%f5
	movl	%icc,	0x03D,	%o3
	call	loop_681
loop_680:
	call	loop_682
	fmovdul	%fcc3,	%f16,	%f12
	edge16l	%o0,	%g7,	%i0
loop_681:
	tgu	%xcc,	0x3
loop_682:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	call	loop_683
	nop
	setx	0xF33DF2C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x05F7551C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f11,	%f27
	call	loop_684
	call	loop_685
loop_683:
	nop
	setx	0x80C1FA574BF44D33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xFFF09F0F5B227516,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f10,	%f10
	fcmpeq32	%f30,	%f6,	%g4
loop_684:
	rdhpr	%htba,	%o5
loop_685:
	fmul8x16	%f16,	%f24,	%f0
	edge32l	%i7,	%l4,	%i4
	wr 	%g0, 	0x7, 	%fprs
	and	%g5,	%l2,	%l6
	set	0x5D, %i3
	ldsba	[%l7 + %i3] 0x88,	%l3
	wrpr 	%g0, 	0x3, 	%gl
	fsrc2	%f18,	%f24
	fmovrdgez	%i3,	%f4,	%f2
	movneg	%xcc,	0x563,	%o4
	call	loop_686
	fpack16	%f16,	%f17
	call	loop_687
	fmovdge	%icc,	%f12,	%f18
loop_686:
	bgu,pn	%xcc,	loop_688
	call	loop_689
loop_687:
	ble,a,pn	%xcc,	loop_690
	nop
	fitod	%f21,	%f22
loop_688:
	wrpr 	%g0, 	0x2, 	%gl
loop_689:
	nop
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x81,	%i6
loop_690:
	call	loop_691
	movuge	%fcc3,	0x59D,	%i1
	orncc	%l0,	%o7,	%i5
	movule	%fcc2,	0x08A,	%g1
loop_691:
	bge,pt	%xcc,	loop_692
	call	loop_693
	call	loop_694
	call	loop_695
loop_692:
	call	loop_696
loop_693:
	edge32ln	%g2,	%o2,	%g3
loop_694:
	tn	%icc,	0x7
loop_695:
	fxnors	%f24,	%f14,	%f30
loop_696:
	call	loop_697
	call	loop_698
	nop
	setx	0x69703F082D7A28FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x37181A549ABCA993,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f12,	%f26
	call	loop_699
loop_697:
	fmovsne	%fcc3,	%f26,	%f22
loop_698:
	sir	0x13A6
	fcmpne32	%f20,	%f4,	%l5
loop_699:
	fcmpgt32	%f8,	%f30,	%o3
	fmul8x16	%f13,	%f20,	%f24
	call	loop_700
	movg	%xcc,	%o0,	%g7
	rd	%y,	%i0
	movlg	%fcc2,	%g4,	%o5
loop_700:
	alignaddrl	%i7,	%l4,	%o6
	fmovduge	%fcc0,	%f4,	%f12
	andcc	%g6,	%i4,	%i2
	call	loop_701
	nop
	setx	0xE2BCF4307A0E8BB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5B24D8908795C7DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f30,	%f20
	movul	%fcc0,	0x707,	%l2
	movre	%l6,	%l3,	%g5
loop_701:
	fmovde	%icc,	%f12,	%f12
	wrpr	%i3,	0x17D9,	%cwp
	call	loop_702
	fble,pn	%fcc1,	loop_703
	call	loop_704
	fsrc1	%f18,	%f4
loop_702:
	mulscc	%o4,	0x0642,	%o1
loop_703:
	fmovsu	%fcc0,	%f7,	%f9
loop_704:
	fmovscs	%icc,	%f21,	%f27
	brgz,a,pn	%i6,	loop_705
	fnot2s	%f31,	%f23
	fmovsge	%fcc3,	%f11,	%f22
	call	loop_706
loop_705:
	fmovdl	%fcc1,	%f20,	%f22
	movrne	%l1,	%i1,	%l0
	movu	%fcc0,	0x5F1,	%i5
loop_706:
	udivcc	%o7,	0x00,	%g1
	move	%fcc0,	0x186,	%o2
	bn,pt	%icc,	loop_707
	bn,a	%xcc,	loop_708
	nop
	fitod	%f27,	%f8
	fmovsge	%xcc,	%f17,	%f12
loop_707:
	movg	%fcc3,	0x7AC,	%g3
loop_708:
	andn	%l5,	%g2,	%o3
	udiv	%g7,	%i0,	%o0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o5
	nop
	setx	0xE95FAC3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x4713D6E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f2,	%f17
	call	loop_709
	nop
	setx	0x6C52CF2A5F7D46E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fandnot2	%f18,	%f28,	%f6
	nop
	set	0x10, %l4
	std	%i6,	[%l7 + %l4]
loop_709:
	nop
	setx	0x18A09CFC031EBA4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB4A883333EB4DAD9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f4,	%f10
	fcmps	%fcc1,	%f9,	%f26
	flushw
	call	loop_710
	wr 	%g0, 	0x7, 	%fprs
	nop
	setx	0x399D9115,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x2D0B49A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f29,	%f17
	movrlz	%o6,	%g6,	%i4
loop_710:
	sllx	%l4,	0x10,	%l2
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f19
	fmovse	%icc,	%f20,	%f24
	fmovdleu	%xcc,	%f2,	%f8
	sth	%i2,	[%l7 + 0x42]
	brlz,a,pn	%l3,	loop_711
	srl	%l6,	0x1C,	%i3
loop_711:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 25
!	Type a   	: 33
!	Type x   	: 11
!	Type cti   	: 138
!	Type f   	: 158
!	Type i   	: 135
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
	set	0x8,	%g1
	set	0x8,	%g2
	set	0x5,	%g3
	set	0x6,	%g4
	set	0xF,	%g5
	set	0x1,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x5,	%i1
	set	-0x9,	%i2
	set	-0x9,	%i3
	set	-0x6,	%i4
	set	-0x4,	%i5
	set	-0xA,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x6025BE40,	%l0
	set	0x7F308EB8,	%l1
	set	0x3BC4BBD7,	%l2
	set	0x1769AFFA,	%l3
	set	0x3533C7B2,	%l4
	set	0x5F726392,	%l5
	set	0x6F2DD717,	%l6
	!# Output registers
	set	0x117F,	%o0
	set	-0x005B,	%o1
	set	-0x0284,	%o2
	set	-0x1D6E,	%o3
	set	-0x0674,	%o4
	set	0x0625,	%o5
	set	-0x1A27,	%o6
	set	0x0F06,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	nop
	setx loop_712, %l0, %l1
	jmpl %l1, %o4
	call	loop_713
	xnorcc	%o1,	%i6,	%l1
	fmovdue	%fcc0,	%f24,	%f8
loop_712:
	nop
	fitod	%f8,	%f26
loop_713:
	movrne	%i1,	0x11B,	%g5
	array32	%i5,	%o7,	%l0
	subcc	%o2,	%g3,	%g1
	wr	%g2,	%l5,	%clear_softint
	call	loop_714
	call	loop_715
	umulcc	%o3,	0x072B,	%g7
	movo	%fcc1,	%i0,	%o0
loop_714:
	edge8	%i7,	%g4,	%o6
loop_715:
	movue	%fcc2,	%o5,	%g6
	fsrc1	%f26,	%f14
	ble,a,pt	%icc,	loop_716
	call	loop_717
	ta	%xcc,	0x4
	tle	%xcc,	0x7
loop_716:
	call	loop_718
loop_717:
	movvs	%xcc,	%i4,	%l4
	udiv	%i2,	%l2,	%l6
	fmovrdgez	%l3,	%f28,	%f30
loop_718:
	call	loop_719
	rdpr	%tl,	%o4
	fzero	%f26
	fones	%f26
loop_719:
	call	loop_720
	call	loop_721
	call	loop_722
	movl	%fcc3,	0x267,	%o1
loop_720:
	fcmpne32	%f14,	%f22,	%i3
loop_721:
	fmovdpos	%xcc,	%f16,	%f22
loop_722:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x2b,	%asi
	stxa	%i6,	[%l7 + 0x58] %asi
	membar	#Sync
	call	loop_723
	call	loop_724
	sdiv	%i1,	%l1,	%i5
	call	loop_725
loop_723:
	call	loop_726
loop_724:
	bpos,a	%xcc,	loop_727
	fpack16	%f26,	%f2
loop_725:
	fmovslg	%fcc0,	%f17,	%f23
loop_726:
	fmovdneg	%icc,	%f10,	%f14
loop_727:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%l0
	call	loop_728
	rd	%pc,	%o7
	movneg	%icc,	0x126,	%g3
	call	loop_729
loop_728:
	call	loop_730
	call	loop_731
	call	loop_732
loop_729:
	fnand	%f14,	%f0,	%f20
loop_730:
	call	loop_733
loop_731:
	fandnot2s	%f22,	%f7,	%f25
loop_732:
	fpack32	%f4,	%f10,	%f22
	bmask	%g1,	%o2,	%l5
loop_733:
	call	loop_734
	fmovdn	%icc,	%f12,	%f16
	movn	%xcc,	0x087,	%g2
	call	loop_735
loop_734:
	taddcctv	%g7,	%o3,	%o0
	call	loop_736
	rdpr	%tl,	%i7
loop_735:
	fmovsu	%fcc1,	%f20,	%f8
	call	loop_737
loop_736:
	flushw
	subc	%i0,	%g4,	%o6
	movvc	%xcc,	0x0A6,	%o5
loop_737:
	call	loop_738
	call	loop_739
	call	loop_740
	tsubcctv	%i4,	0x1DBD,	%l4
loop_738:
	tpos	%xcc,	0x7
loop_739:
	call	loop_741
loop_740:
	fmovduge	%fcc2,	%f10,	%f4
	bne,a	%icc,	loop_742
	mova	%icc,	0x142,	%i2
loop_741:
	fmovdl	%icc,	%f14,	%f10
	nop
	setx	0x3B276172,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x759B4217,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f17,	%f18
loop_742:
	srlx	%l2,	%g6,	%l3
	rdpr	%pil,	%o4
	call	loop_743
	fpadd32s	%f9,	%f31,	%f14
	tpos	%xcc,	0x7
	call	loop_744
loop_743:
	edge32	%o1,	%i3,	%i6
	movle	%xcc,	0x314,	%l6
	call	loop_745
loop_744:
	orn	%l1,	%i1,	%i5
	edge8n	%g5,	%l0,	%g3
	srlx	%g1,	%o2,	%o7
loop_745:
	edge32	%l5,	%g7,	%o3
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f4
	fmovrsgz	%g2,	%f19,	%f30
	wr	%o0,	0x17EF,	%pic
	call	loop_746
	movu	%fcc2,	%i0,	%i7
	fornot1s	%f1,	%f19,	%f15
	tpos	%icc,	0x2
loop_746:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0xD05F7082A1392374,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	wr	%g4,	%i4,	%softint
	fbuge,a,pt	%fcc3,	loop_747
	fpadd16s	%f16,	%f26,	%f22
	call	loop_748
	call	loop_749
loop_747:
	nop
	fitod	%f6,	%f4
	fdtoi	%f4,	%f27
	fsrc2	%f4,	%f2
loop_748:
	call	loop_750
loop_749:
	fmovrsne	%l4,	%f5,	%f13
	fpadd16s	%f14,	%f20,	%f4
	be	%icc,	loop_751
loop_750:
	fmovdgu	%icc,	%f22,	%f8
	call	loop_752
	fmovrslz	%l2,	%f27,	%f12
loop_751:
	nop
	setx	0x821BE545E3E7BC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbug,a	%fcc3,	loop_753
loop_752:
	movle	%xcc,	%g6,	%i2
	nop
	setx	0x15379706,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xDD5BA2A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f17,	%f16
	fmovdl	%xcc,	%f14,	%f20
loop_753:
	call	loop_754
	fmovdg	%xcc,	%f0,	%f4
	fble	%fcc3,	loop_755
	tsubcctv	%o4,	%l3,	%i3
loop_754:
	fmovse	%xcc,	%f0,	%f6
	fmovde	%fcc1,	%f26,	%f14
loop_755:
	call	loop_756
	call	loop_757
	fcmpd	%fcc0,	%f22,	%f14
	wr	%o1,	%l6,	%ccr
loop_756:
	call	loop_758
loop_757:
	fnegd	%f26,	%f20
	call	loop_759
	fmovrsgez	%l1,	%f24,	%f16
loop_758:
	call	loop_760
	subcc	%i6,	%i1,	%i5
loop_759:
	umul	%l0,	0x193B,	%g3
	call	loop_761
loop_760:
	fmovrdne	%g5,	%f2,	%f16
	fmovrsne	%g1,	%f19,	%f6
	edge8n	%o7,	%l5,	%o2
loop_761:
	fcmple16	%f0,	%f22,	%o3
	fmovsu	%fcc3,	%f27,	%f25
	fmovsleu	%icc,	%f6,	%f28
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f20
	fxtod	%f20,	%f8
	addc	%g7,	0x1C0A,	%o0
	call	loop_762
	fornot2s	%f15,	%f13,	%f20
	call	loop_763
	pdist	%f24,	%f8,	%f2
loop_762:
	sdivx	%i0,	0x00,	%g2
	fmovsle	%fcc3,	%f1,	%f23
loop_763:
	fmovscc	%xcc,	%f24,	%f27
	movg	%fcc0,	%i7,	%o5
	fmovdneg	%icc,	%f26,	%f6
	sdivx	%g4,	0x00,	%i4
	xnor	%o6,	0x0FF8,	%l4
	nop
	set	0x48, %l2
	stx	%l2,	[%l7 + %l2]
	call	loop_764
	orncc	%i2,	%o4,	%g6
	rd	%pc,	%i3
	fmovdgu	%icc,	%f18,	%f26
loop_764:
	bl,a,pn	%icc,	loop_765
	flushw
	fnot1	%f22,	%f2
	fexpand	%f8,	%f0
loop_765:
	fandnot1	%f0,	%f22,	%f30
	call	loop_766
	tvs	%icc,	0x0
	call	loop_767
	call	loop_768
loop_766:
	tpos	%icc,	0x1
	call	loop_769
loop_767:
	movle	%icc,	0x223,	%l3
loop_768:
	fmovso	%fcc3,	%f16,	%f17
	movvc	%xcc,	%o1,	%l6
loop_769:
	umulcc	%i6,	0x1C63,	%l1
	and	%i5,	%i1,	%g3
	call	loop_770
	call	loop_771
	fblg	%fcc3,	loop_772
	fmovrsgz	%l0,	%f26,	%f1
loop_770:
	fmovrsne	%g1,	%f20,	%f3
loop_771:
	call	loop_773
loop_772:
	fmovsgu	%icc,	%f8,	%f17
	brnz,a,pn	%o7,	loop_774
	smul	%g5,	0x1CE0,	%o2
loop_773:
	taddcc	%l5,	%o3,	%g7
	fornot2s	%f14,	%f20,	%f9
loop_774:
	movuge	%fcc2,	%i0,	%g2
	bneg,a,pt	%icc,	loop_775
	call	loop_776
	bneg	%xcc,	loop_777
	fbu,pn	%fcc3,	loop_778
loop_775:
	movvc	%xcc,	%o0,	%i7
loop_776:
	fmovdgu	%xcc,	%f16,	%f4
loop_777:
	stx	%o5,	[%l7 + 0x48]
loop_778:
	nop
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 1
	call	loop_779
	fmovrdlz	%o6,	%f26,	%f28
	bleu	%xcc,	loop_780
	call	loop_781
loop_779:
	flush	%l7 + 0x48
	fmovrdlz	%i4,	%f2,	%f2
loop_780:
	fcmpes	%fcc1,	%f4,	%f14
loop_781:
	nop
	setx	0xCD69B71625B20912,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fmovspos	%xcc,	%f26,	%f3
	fmovsn	%icc,	%f0,	%f21
	movrlz	%l4,	%l2,	%i2
	fmovdu	%fcc3,	%f8,	%f14
	fmovs	%f30,	%f10
	rdpr	%cwp,	%g6
	fpmerge	%f22,	%f9,	%f28
	rdhpr	%hpstate,	%i3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f8
	movlg	%fcc3,	%l3,	%o4
	fmovsneg	%icc,	%f7,	%f24
	sll	%o1,	0x1C,	%i6
	tpos	%icc,	0x4
	call	loop_782
	movul	%fcc1,	0x484,	%l1
	fbl,pn	%fcc3,	loop_783
	call	loop_784
loop_782:
	te	%xcc,	0x0
	mulscc	%i5,	%l6,	%i1
loop_783:
	fandnot1	%f10,	%f24,	%f24
loop_784:
	call	loop_785
	call	loop_786
	udiv	%l0,	%g1,	%g3
	call	loop_787
loop_785:
	fmovdue	%fcc2,	%f24,	%f8
loop_786:
	for	%f24,	%f6,	%f14
	fmovdneg	%icc,	%f24,	%f0
loop_787:
	call	loop_788
	brlez,a	%o7,	loop_789
	edge16n	%o2,	%l5,	%g5
	fmovs	%f30,	%f0
loop_788:
	movvc	%xcc,	0x7C7,	%g7
loop_789:
	sdiv	%i0,	0x00,	%o3
	call	loop_790
	call	loop_791
	fnands	%f30,	%f16,	%f6
	call	loop_792
loop_790:
	rd	%sys_tick_cmpr,	%g2
loop_791:
	fandnot2	%f28,	%f16,	%f4
	call	loop_793
loop_792:
	call	loop_794
	call	loop_795
	fmovrse	%o0,	%f25,	%f10
loop_793:
	call	loop_796
loop_794:
	fmovsul	%fcc3,	%f4,	%f16
loop_795:
	nop
	set	0x3A, %g1
	ldub	[%l7 + %g1],	%o5
	fcmpeq16	%f16,	%f8,	%g4
loop_796:
	add	%o6,	0x0A70,	%i4
	nop
	set	0x50, %o1
	ldstub	[%l7 + %o1],	%i7
	call	loop_797
	movpos	%icc,	0x310,	%l4
	bg,pt	%icc,	loop_798
	fmovsuge	%fcc1,	%f28,	%f9
loop_797:
	array8	%i2,	%l2,	%i3
	bleu,pn	%xcc,	loop_799
loop_798:
	tsubcc	%l3,	0x1CA3,	%g6
	tgu	%icc,	0x0
	xnorcc	%o1,	%o4,	%i6
loop_799:
	fand	%f4,	%f22,	%f2
	wrpr 	%g0, 	0x1, 	%gl
	edge16l	%l6,	%i1,	%i5
	fbu,a,pt	%fcc3,	loop_800
	nop
	setx	0x4DFBA9151BAC8A7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x38C9DA0B8A48A65E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f16
	call	loop_801
	rd	%tick_cmpr,	%l0
loop_800:
	edge32ln	%g3,	%g1,	%o2
	call	loop_802
loop_801:
	fmovdge	%xcc,	%f0,	%f16
	addcc	%o7,	%l5,	%g7
	nop
	set	0x3B, %o7
	stb	%g5,	[%l7 + %o7]
loop_802:
	fmovrdne	%i0,	%f16,	%f30
	movg	%fcc3,	%g2,	%o0
	call	loop_803
	wrpr	%o3,	0x18E3,	%tick
	fmuld8sux16	%f2,	%f20,	%f8
	fmovsge	%icc,	%f27,	%f28
loop_803:
	call	loop_804
	fandnot2s	%f7,	%f26,	%f15
	array8	%o5,	%o6,	%g4
	fpsub32s	%f8,	%f4,	%f22
loop_804:
	call	loop_805
	fbn,pn	%fcc2,	loop_806
	taddcctv	%i4,	0x13A0,	%i7
	sllx	%l4,	0x11,	%l2
loop_805:
	fmovdgu	%xcc,	%f10,	%f0
loop_806:
	fmovdu	%fcc0,	%f10,	%f8
	fba,a,pn	%fcc1,	loop_807
	call	loop_808
	xnor	%i2,	0x0B9D,	%i3
	call	loop_809
loop_807:
	tsubcc	%g6,	%o1,	%o4
loop_808:
	fmovsg	%icc,	%f0,	%f12
	call	loop_810
loop_809:
	call	loop_811
	nop
	set	0x4C, %i4
	ldsw	[%l7 + %i4],	%l3
	movcc	%icc,	0x51B,	%l1
loop_810:
	call	loop_812
loop_811:
	call	loop_813
	call	loop_814
	tge	%xcc,	0x7
loop_812:
	flushw
loop_813:
	call	loop_815
loop_814:
	call	loop_816
	call	loop_817
	fmovda	%icc,	%f22,	%f24
loop_815:
	stw	%l6,	[%l7 + 0x28]
loop_816:
	nop
	set	0x59, %o3
	stba	%i6,	[%l7 + %o3] 0x2f
	membar	#Sync
loop_817:
	call	loop_818
	call	loop_819
	tvs	%icc,	0x6
	fcmpd	%fcc1,	%f16,	%f20
loop_818:
	fmovsgu	%icc,	%f6,	%f8
loop_819:
	tg	%icc,	0x5
	movue	%fcc1,	%i5,	%l0
	call	loop_820
	bn,a,pt	%xcc,	loop_821
	nop
	setx	0x60C8369D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x7F6FDEE5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f14,	%f29
	fmuld8sux16	%f31,	%f17,	%f18
loop_820:
	call	loop_822
loop_821:
	rdpr	%tba,	%i1
	call	loop_823
	call	loop_824
loop_822:
	fcmple16	%f24,	%f2,	%g1
	fmovrdlz	%o2,	%f2,	%f30
loop_823:
	fmovda	%xcc,	%f0,	%f20
loop_824:
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f10
	array32	%o7,	%g3,	%g7
	nop
	setx	0xCBD1910173615874,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xBFF350D1A7F7785E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f26,	%f6
	call	loop_825
	call	loop_826
	call	loop_827
	call	loop_828
loop_825:
	fnot1s	%f29,	%f12
loop_826:
	movleu	%xcc,	0x713,	%l5
loop_827:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_828:
	movo	%fcc2,	0x197,	%g5
	addcc	%i0,	0x170E,	%o0
	fmovsvc	%xcc,	%f6,	%f18
	call	loop_829
	siam	0x3
	call	loop_830
	fornot2s	%f11,	%f22,	%f2
loop_829:
	mulx	%o3,	%o5,	%o6
	fmovde	%fcc0,	%f4,	%f6
loop_830:
	wr	%g2,	0x084A,	%pic
	for	%f8,	%f28,	%f8
	fbl,pt	%fcc3,	loop_831
	call	loop_832
	fmovdneg	%xcc,	%f26,	%f12
	tn	%icc,	0x1
loop_831:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_832:
	tsubcc	%g4,	%i7,	%i4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f12
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sllx	%l2,	0x14,	%i2
	nop
	setx	0xD05833B036420C59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5CE476525BF7BBBA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f16,	%f2
	and	%i3,	0x0AE5,	%g6
	wrpr	%o1,	%o4,	%pil
	set	0x14, %g4
	stha	%l4,	[%l7 + %g4] 0x19
	edge32n	%l1,	%l3,	%i6
	addcc	%l6,	%i5,	%i1
	nop
	setx	loop_833,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x032100001401,	%l0,	%l1
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
	array16	%g1,	%l0,	%o2
	fpack32	%f18,	%f10,	%f12
	call	loop_834
loop_833:
	srlx	%g3,	0x16,	%g7
	fmul8sux16	%f12,	%f28,	%f18
	bvc,pt	%xcc,	loop_835
loop_834:
	srlx	%l5,	0x0B,	%o7
	call	loop_836
	fzeros	%f17
loop_835:
	tn	%xcc,	0x0
	fbo,a	%fcc3,	loop_837
loop_836:
	fxor	%f30,	%f0,	%f4
	fble,pt	%fcc0,	loop_838
	edge8l	%i0,	%o0,	%o3
loop_837:
	pdist	%f16,	%f12,	%f30
	fbg	%fcc1,	loop_839
loop_838:
	fmul8x16al	%f16,	%f8,	%f30
	brlz,a	%g5,	loop_840
	wrpr	%o5,	%o6,	%cwp
loop_839:
	rdpr	%pil,	%g4
	fxor	%f8,	%f8,	%f4
loop_840:
	pdist	%f8,	%f22,	%f4
	fmul8ulx16	%f4,	%f8,	%f22
	fnot2s	%f17,	%f26
	nop
	setx	0xA1DAAAF0CDD2632D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f12
	fpmerge	%f8,	%f4,	%f24
	rd	%y,	%g2
	call	loop_841
	fone	%f26
	call	loop_842
	call	loop_843
loop_841:
	call	loop_844
	call	loop_845
loop_842:
	mulx	%i7,	0x0CA7,	%i4
loop_843:
	nop
	set	0x28, %o2
	prefetch	[%l7 + %o2],	 3
loop_844:
	call	loop_846
loop_845:
	call	loop_847
	fmovdlg	%fcc0,	%f26,	%f28
	fmovsle	%icc,	%f15,	%f11
loop_846:
	call	loop_848
loop_847:
	call	loop_849
	wrpr	%l2,	0x07D2,	%cwp
	edge8	%i2,	%i3,	%g6
loop_848:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_849:
	call	loop_850
	mulscc	%l4,	0x16C6,	%l1
	movug	%fcc3,	%l3,	%i6
	call	loop_851
loop_850:
	call	loop_852
	nop
	setx	0xF526046D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xC7EF0910,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f25,	%f31
	call	loop_853
loop_851:
	call	loop_854
loop_852:
	wr	%i5,	0x0A4B,	%y
	nop
	set	0x54, %i6
	lduw	[%l7 + %i6],	%l6
loop_853:
	mulscc	%g1,	%i1,	%l0
loop_854:
	call	loop_855
	sllx	%o2,	%g3,	%g7
	call	loop_856
	wr	%l5,	0x00F3,	%ccr
loop_855:
	fmovdle	%fcc1,	%f20,	%f22
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%o7
loop_856:
	fmovdg	%fcc0,	%f12,	%f26
	call	loop_857
	call	loop_858
	tg	%xcc,	0x0
	brnz,pn	%i0,	loop_859
loop_857:
	call	loop_860
loop_858:
	edge32l	%o3,	%o0,	%o5
	call	loop_861
loop_859:
	call	loop_862
loop_860:
	fsrc1s	%f4,	%f29
	fbg,pt	%fcc0,	loop_863
loop_861:
	fnors	%f13,	%f16,	%f23
loop_862:
	call	loop_864
	andncc	%g5,	0x12B2,	%o6
loop_863:
	call	loop_865
	fbu,a,pn	%fcc0,	loop_866
loop_864:
	fmovsue	%fcc2,	%f6,	%f27
	call	loop_867
loop_865:
	fnegd	%f12,	%f10
loop_866:
	move	%fcc2,	0x5CB,	%g2
	set	0x6B, %i2
	ldstuba	[%l7 + %i2] 0x11,	%g4
loop_867:
	movlg	%fcc1,	0x05F,	%i7
	fbge,a	%fcc1,	loop_868
	nop
	set	0x38, %l1
	ldsw	[%l7 + %l1],	%l2
	call	loop_869
	fbg	%fcc3,	loop_870
loop_868:
	movle	%icc,	%i4,	%i3
	nop
	set	0x6A, %o0
	sth	%g6,	[%l7 + %o0]
loop_869:
	edge32l	%o1,	%o4,	%i2
loop_870:
	fmovrdgez	%l4,	%f20,	%f10
	and	%l1,	0x12CC,	%i6
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f30
	fsrc1s	%f26,	%f29
	call	loop_871
	call	loop_872
	call	loop_873
	fmovsne	%xcc,	%f5,	%f16
loop_871:
	call	loop_874
loop_872:
	call	loop_875
loop_873:
	fmovsug	%fcc1,	%f30,	%f1
	rdhpr	%hsys_tick_cmpr,	%i5
loop_874:
	edge8n	%l3,	%g1,	%i1
loop_875:
	nop
	set	0x40, %i5
	stw	%l6,	[%l7 + %i5]
	call	loop_876
	fmovsge	%icc,	%f17,	%f7
	nop
	setx	0x11B3636F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x549660EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f28,	%f31
	sub	%o2,	0x0333,	%l0
loop_876:
	fands	%f21,	%f11,	%f3
	fpadd32	%f6,	%f26,	%f20
	fpsub32s	%f15,	%f20,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrdgz	%g3,	%f18,	%f0
	nop
	setx	loop_877,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021200001401,	%l0,	%l1
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
	edge16ln	%l5,	%i0,	%o7
	tg	%xcc,	0x1
	fornot1	%f18,	%f20,	%f12
loop_877:
	movpos	%xcc,	%o0,	%o5
	array32	%o3,	%g5,	%g2
	movne	%xcc,	%o6,	%i7
	stx	%g4,	[%l7 + 0x38]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 26
!	Type a   	: 28
!	Type x   	: 9
!	Type cti   	: 166
!	Type f   	: 142
!	Type i   	: 129
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
	set	0xD,	%g1
	set	0xC,	%g2
	set	0x2,	%g3
	set	0x3,	%g4
	set	0x5,	%g5
	set	0x7,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x2,	%i1
	set	-0xD,	%i2
	set	-0x8,	%i3
	set	-0x4,	%i4
	set	-0x0,	%i5
	set	-0x0,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x5B1DF332,	%l0
	set	0x20D16E53,	%l1
	set	0x755D829A,	%l2
	set	0x2816CD22,	%l3
	set	0x47B51BE2,	%l4
	set	0x2A85719E,	%l5
	set	0x001FFDC9,	%l6
	!# Output registers
	set	-0x0D89,	%o0
	set	-0x1858,	%o1
	set	-0x05C5,	%o2
	set	0x16C3,	%o3
	set	-0x1E85,	%o4
	set	-0x1B27,	%o5
	set	0x0B8D,	%o6
	set	-0x1666,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	fmovdg	%icc,	%f18,	%f18
	fmovsl	%fcc1,	%f3,	%f9
	tleu	%icc,	0x5
	sdivx	%l2,	%i4,	%i3
	nop
	fitos	%f11,	%f24
	fstox	%f24,	%f10
	call	loop_878
	fzeros	%f19
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x19,	%g6,	%o1
loop_878:
	udivx	%o4,	0x00,	%i2
	call	loop_879
	fpmerge	%f26,	%f14,	%f2
	fpack16	%f12,	%f24
	fmovduge	%fcc3,	%f16,	%f18
loop_879:
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f30
	rdpr	%wstate,	%l4
	movo	%fcc0,	%l1,	%i6
	movne	%xcc,	0x46F,	%i5
	fmovs	%f0,	%f11
	fone	%f6
	fmovdul	%fcc3,	%f6,	%f2
	call	loop_880
	call	loop_881
	call	loop_882
	fones	%f4
loop_880:
	fors	%f7,	%f1,	%f18
loop_881:
	nop
	set	0x6C, %o4
	lduw	[%l7 + %o4],	%l3
loop_882:
	fmovrslz	%g1,	%f26,	%f29
	fzero	%f4
	pdist	%f8,	%f28,	%f12
	for	%f6,	%f0,	%f28
	array16	%i1,	%o2,	%l0
	nop
	set	0x08, %i1
	prefetch	[%l7 + %i1],	 4
	call	loop_883
	call	loop_884
	movn	%fcc3,	%l6,	%g7
	wrpr	%l5,	0x04A9,	%cwp
loop_883:
	fnegs	%f7,	%f10
loop_884:
	call	loop_885
	fmovsn	%icc,	%f6,	%f24
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f22
	wr	%g3,	0x13E6,	%softint
loop_885:
	edge8l	%o7,	%o0,	%i0
	nop
	set	0x4E, %l6
	lduh	[%l7 + %l6],	%o5
	fpmerge	%f23,	%f10,	%f10
	fcmpeq32	%f0,	%f24,	%o3
	movcs	%xcc,	%g5,	%g2
	call	loop_886
	tle	%icc,	0x3
	call	loop_887
	fmovsle	%fcc1,	%f27,	%f11
loop_886:
	call	loop_888
	brgz,a,pn	%o6,	loop_889
loop_887:
	fcmpne16	%f26,	%f14,	%g4
	smul	%i7,	0x0A27,	%i4
loop_888:
	fmovdvs	%xcc,	%f24,	%f0
loop_889:
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f24
	fxtod	%f24,	%f4
	orn	%l2,	%g6,	%o1
	fnot1s	%f15,	%f19
	fnegs	%f5,	%f14
	fba,a	%fcc0,	loop_890
	call	loop_891
	orn	%o4,	0x1A71,	%i3
	call	loop_892
loop_890:
	fxor	%f30,	%f18,	%f30
loop_891:
	alignaddr	%l4,	%l1,	%i6
	call	loop_893
loop_892:
	fcmpne16	%f12,	%f20,	%i5
	fpadd16	%f18,	%f26,	%f12
	ba,a,pn	%xcc,	loop_894
loop_893:
	fmovsu	%fcc1,	%f11,	%f18
	fmovdvc	%icc,	%f4,	%f30
	fsrc1	%f4,	%f6
loop_894:
	movrlez	%l3,	%i2,	%g1
	fandnot2s	%f20,	%f26,	%f27

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tsubcc	%l0,	%l6,	%i1
	call	loop_895
	fmovsug	%fcc3,	%f26,	%f16
	pdist	%f18,	%f18,	%f30
	call	loop_896
loop_895:
	fmovspos	%xcc,	%f3,	%f1
	rdpr	%tba,	%g7
	movule	%fcc3,	0x205,	%g3
loop_896:
	fmovsvs	%xcc,	%f18,	%f27
	fcmpd	%fcc3,	%f0,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x163, 	%hsys_tick_cmpr
	call	loop_897
	fcmple32	%f22,	%f24,	%o0
	tvc	%xcc,	0x3
	fmovrsgz	%l5,	%f31,	%f1
loop_897:
	rdhpr	%hintp,	%i0
	fbne,a,pt	%fcc2,	loop_898
	xorcc	%o3,	%g5,	%g2
	fbl,pt	%fcc1,	loop_899
	fcmpeq16	%f20,	%f0,	%o5
loop_898:
	wr	%o6,	%i7,	%y
	call	loop_900
loop_899:
	fmovsue	%fcc2,	%f23,	%f20
	edge8n	%g4,	%i4,	%l2
	fbu	%fcc3,	loop_901
loop_900:
	fpack32	%f2,	%f10,	%f10
	fones	%f10
	movn	%fcc2,	0x767,	%g6
loop_901:
	call	loop_902
	fxor	%f20,	%f0,	%f26
	rdpr	%cleanwin,	%o1
	fpsub32	%f10,	%f12,	%f18
loop_902:
	fmul8ulx16	%f0,	%f16,	%f28
	call	loop_903
	fones	%f31
	call	loop_904
	orcc	%i3,	0x0112,	%l4
loop_903:
	fpsub32	%f28,	%f26,	%f18
	fmovscs	%icc,	%f21,	%f4
loop_904:
	fmovdvs	%icc,	%f2,	%f12
	fbule,a	%fcc0,	loop_905
	umul	%o4,	0x0869,	%l1
	call	loop_906
	fmovslg	%fcc1,	%f14,	%f4
loop_905:
	umulcc	%i6,	0x0A60,	%l3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
loop_906:
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f12
	tgu	%icc,	0x6
	edge32l	%i2,	%o2,	%g1
	fnot1s	%f0,	%f12
	fmovsg	%fcc1,	%f28,	%f1
	fzeros	%f13
	sdivx	%l6,	%l0,	%i1
	fmovrslez	%g3,	%f25,	%f9
	sethi	0x0188,	%g7
	fbne,a,pt	%fcc1,	loop_907
	sllx	%o0,	0x14,	%o7
	fmovrdgz	%i0,	%f14,	%f18
	movlg	%fcc2,	0x2BC,	%l5
loop_907:
	fbne,pt	%fcc3,	loop_908
	fmovrdlez	%o3,	%f18,	%f0
	movlg	%fcc3,	0x4CF,	%g5
	and	%o5,	%o6,	%g2
loop_908:
	fsrc2s	%f3,	%f24
	srax	%i7,	%g4,	%l2
	set	0x14, %l3
	lduha	[%l7 + %l3] 0x18,	%g6
	movue	%fcc0,	0x40C,	%i4
	call	loop_909
	movo	%fcc3,	0x2A5,	%o1
	brgz,pn	%i3,	loop_910
	orn	%o4,	0x09E4,	%l4
loop_909:
	fpadd16s	%f22,	%f31,	%f7
	nop
	setx	0xC28B8FBFCE9F94E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x9DF845C1E2A6BA3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f14,	%f0
loop_910:
	nop
	set	0x3D, %g3
	ldstuba	[%l7 + %g3] 0x0c,	%l1
	call	loop_911
	fmovsleu	%icc,	%f22,	%f6
	edge8l	%l3,	%i6,	%i5
	tle	%xcc,	0x4
loop_911:
	fmovsa	%icc,	%f11,	%f25
	fsrc2s	%f6,	%f5
	movrgez	%o2,	%i2,	%g1
	tl	%xcc,	0x3
	fone	%f12
	fnor	%f22,	%f24,	%f10
	call	loop_912
	movrgez	%l0,	0x3B0,	%l6
	call	loop_913
	wrpr 	%g0, 	0x0, 	%gl
loop_912:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%o0
loop_913:
	nop
	fitos	%f14,	%f0
	wr	%g0,	0x2f,	%asi
	stha	%o7,	[%l7 + 0x28] %asi
	membar	#Sync
	call	loop_914
	array32	%g7,	%l5,	%i0
	sethi	0x12DB,	%o3
	tleu	%xcc,	0x1
loop_914:
	fpmerge	%f19,	%f12,	%f26
	fmovdug	%fcc0,	%f12,	%f28
	call	loop_915
	call	loop_916
	ba,a	%xcc,	loop_917
	call	loop_918
loop_915:
	fandnot1	%f6,	%f20,	%f0
loop_916:
	wrpr 	%g0, 	0x0, 	%gl
loop_917:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_918:
	call	loop_919
	movcc	%xcc,	0x7F4,	%g2
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%o5
	tne	%xcc,	0x0
loop_919:
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_920
	nop
	setx	0x179066E82EF691E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f24
	call	loop_921
	nop
	setx	0x785446F1E6E8E756,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f12
loop_920:
	call	loop_922
	call	loop_923
loop_921:
	lduh	[%l7 + 0x62],	%g6
	fpack16	%f14,	%f3
loop_922:
	call	loop_924
loop_923:
	fpadd32s	%f16,	%f13,	%f17
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%i4
	fpadd16s	%f12,	%f22,	%f19
loop_924:
	nop
	fitod	%f18,	%f10
	call	loop_925
	fmovdg	%icc,	%f24,	%f2
	sethi	0x08EA,	%o1
	nop
	setx	0x87527822,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f24
loop_925:
	call	loop_926
	brgez,pt	%l2,	loop_927
	nop
	setx	loop_928,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x002100001400,	%l0,	%l1
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
	addccc	%i3,	0x0DBC,	%o4
loop_926:
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f16
loop_927:
	tvs	%xcc,	0x1
loop_928:
	call	loop_929
	movpos	%xcc,	%l1,	%l4
	call	loop_930
	fmovsug	%fcc1,	%f0,	%f14
loop_929:
	fcmpd	%fcc2,	%f24,	%f26
	add	%i6,	0x0243,	%l3
loop_930:
	fmovdvs	%icc,	%f2,	%f18
	fabss	%f13,	%f17
	move	%fcc3,	0x363,	%o2
	movre	%i5,	0x158,	%i2
	call	loop_931
	call	loop_932
	fmovs	%f15,	%f7
	call	loop_933
loop_931:
	srl	%g1,	%l6,	%g3
loop_932:
	call	loop_934
	bge	%xcc,	loop_935
loop_933:
	edge32n	%l0,	%i1,	%o0
	movgu	%icc,	0x358,	%g7
loop_934:
	fmuld8ulx16	%f17,	%f17,	%f6
loop_935:
	srax	%l5,	%i0,	%o3
	fcmpne16	%f24,	%f16,	%o7
	edge16n	%o6,	%g5,	%g2
	call	loop_936
	edge8n	%i7,	%o5,	%g6
	fmovdo	%fcc2,	%f4,	%f30
	and	%i4,	0x0EAA,	%g4
loop_936:
	call	loop_937
	fpadd32s	%f12,	%f0,	%f13
	fmovduge	%fcc3,	%f10,	%f30
	srl	%l2,	%o1,	%i3
loop_937:
	fcmpd	%fcc0,	%f6,	%f12
	call	loop_938
	fbug	%fcc0,	loop_939
	movu	%fcc3,	0x2DE,	%l1
	orcc	%o4,	0x029F,	%i6
loop_938:
	fmovrdgz	%l3,	%f14,	%f24
loop_939:
	call	loop_940
	fmovsuge	%fcc1,	%f9,	%f14
	ld	[%l7 + 0x24],	%f14
	call	loop_941
loop_940:
	fbg,a,pn	%fcc3,	loop_942
	tn	%icc,	0x1
	fabsd	%f12,	%f2
loop_941:
	call	loop_943
loop_942:
	call	loop_944
	nop
	setx	0xA6DFD4A2FC10A0E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB652D9350FFD279A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f12,	%f4
	rd	%fprs,	%l4
loop_943:
	fmovdgu	%icc,	%f24,	%f0
loop_944:
	call	loop_945
	call	loop_946
	rdhpr	%hsys_tick_cmpr,	%o2
	edge32ln	%i2,	%g1,	%l6
loop_945:
	tne	%icc,	0x4
loop_946:
	edge8	%i5,	%g3,	%i1
	bge,a	%icc,	loop_947
	edge32	%o0,	%l0,	%l5
	fzeros	%f0
	fxors	%f14,	%f31,	%f22
loop_947:
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f8
	fxtod	%f8,	%f18
	fmovdpos	%xcc,	%f8,	%f12
	call	loop_948
	call	loop_949
	movu	%fcc0,	0x576,	%i0
	call	loop_950
loop_948:
	fbu	%fcc0,	loop_951
loop_949:
	nop
	set	0x18, %i0
	swap	[%l7 + %i0],	%o3
	call	loop_952
loop_950:
	movl	%fcc1,	%o7,	%g7
loop_951:
	bgu,pt	%icc,	loop_953
	nop
	fitos	%f5,	%f21
	fstoi	%f21,	%f24
loop_952:
	fmovduge	%fcc2,	%f26,	%f22
	bpos,pn	%xcc,	loop_954
loop_953:
	call	loop_955
	fmovda	%fcc0,	%f10,	%f22
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%o6
loop_954:
	rd	%softint,	%g5
loop_955:
	edge16n	%i7,	%o5,	%g6
	movul	%fcc3,	0x46E,	%g2
	bshuffle	%f24,	%f4,	%f20
	fcmpne16	%f2,	%f6,	%i4
	ldd	[%l7 + 0x38],	%g4
	fmovde	%fcc0,	%f4,	%f0
	fmovdneg	%icc,	%f12,	%f18
	bmask	%l2,	%i3,	%l1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tg	%icc,	0x0
	movule	%fcc0,	%o1,	%o4
	fmovdu	%fcc2,	%f26,	%f26
	fmul8ulx16	%f30,	%f18,	%f14
	call	loop_956
	call	loop_957
	call	loop_958
	call	loop_959
loop_956:
	tge	%xcc,	0x3
loop_957:
	call	loop_960
loop_958:
	call	loop_961
loop_959:
	wr 	%g0, 	0x6, 	%fprs
	call	loop_962
loop_960:
	smulcc	%i6,	0x1933,	%o2
loop_961:
	fmovsne	%fcc2,	%f25,	%f10
	tle	%xcc,	0x6
loop_962:
	call	loop_963
	fmovscs	%icc,	%f30,	%f0
	call	loop_964
	smul	%i2,	%l6,	%g1
loop_963:
	fmovde	%xcc,	%f24,	%f20
	sethi	0x193D,	%g3
loop_964:
	call	loop_965
	movcc	%xcc,	%i5,	%o0
	nop
	set	0x0C, %l5
	ldsh	[%l7 + %l5],	%i1
	bpos,a,pt	%icc,	loop_966
loop_965:
	andcc	%l5,	%i0,	%o3
	fcmpne16	%f22,	%f4,	%l0
	fblg	%fcc3,	loop_967
loop_966:
	call	loop_968
	fbug	%fcc3,	loop_969
	call	loop_970
loop_967:
	umulcc	%g7,	%o6,	%o7
loop_968:
	movn	%xcc,	%g5,	%i7
loop_969:
	edge8l	%g6,	%o5,	%g2
loop_970:
	call	loop_971
	stb	%g4,	[%l7 + 0x7D]
	bne	%xcc,	loop_972
	call	loop_973
loop_971:
	call	loop_974
	edge16ln	%i4,	%l2,	%l1
loop_972:
	call	loop_975
loop_973:
	orncc	%i3,	0x1B94,	%o4
loop_974:
	faligndata	%f0,	%f28,	%f10
	fbule,a	%fcc3,	loop_976
loop_975:
	popc	%l3,	%o1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x5F49B1AC2EB74604,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDDCEFD7360F26537,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f12,	%f20
loop_976:
	call	loop_977
	call	loop_978
	movcs	%icc,	0x087,	%l4
	fmovdpos	%xcc,	%f16,	%f16
loop_977:
	fmovrdgez	%o2,	%f18,	%f4
loop_978:
	call	loop_979
	call	loop_980
	fnand	%f20,	%f18,	%f24
	nop
	set	0x28, %g6
	ldx	[%l7 + %g6],	%i6
loop_979:
	nop
	set	0x7F, %o6
	ldstub	[%l7 + %o6],	%i2
loop_980:
	for	%f2,	%f24,	%f12
	edge8l	%g1,	%l6,	%g3
	rdpr	%pil,	%i5
	fbul,a	%fcc3,	loop_981
	tl	%xcc,	0x2
	tle	%xcc,	0x2
	call	loop_982
loop_981:
	call	loop_983
	fpack32	%f14,	%f4,	%f18
	mulx	%i1,	0x15C7,	%o0
loop_982:
	fmovrdlez	%l5,	%f24,	%f4
loop_983:
	fmovrdlez	%i0,	%f20,	%f4
	edge16n	%o3,	%g7,	%l0
	nop
	fitos	%f11,	%f19
	fstod	%f19,	%f6
	tneg	%xcc,	0x6
	set	0x110, %i7
	stxa	%o6,	[%g0 + %i7] 0x21
	fmovdl	%fcc2,	%f12,	%f8
	fmovdleu	%xcc,	%f0,	%f30
	fbue,a,pt	%fcc2,	loop_984
	fmovsne	%xcc,	%f11,	%f25
	fmovrsgez	%o7,	%f7,	%f11
	movne	%xcc,	0x5F8,	%g5
loop_984:
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f14
	call	loop_985
	fmovdule	%fcc1,	%f8,	%f10
	or	%g6,	%i7,	%o5
	movne	%icc,	0x163,	%g4
loop_985:
	rd	%tick_cmpr,	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	smul	%g2,	%i3,	%l1
	set	0x1A, %g2
	stha	%l3,	[%l7 + %g2] 0x22
	membar	#Sync
	edge32ln	%o1,	%o4,	%l4
	rdhpr	%hintp,	%o2
	fcmped	%fcc3,	%f6,	%f26
	call	loop_986
	fmovse	%fcc2,	%f9,	%f19
	call	loop_987
	fzeros	%f17
loop_986:
	call	loop_988
	call	loop_989
loop_987:
	call	loop_990
	fpadd32s	%f24,	%f3,	%f0
loop_988:
	call	loop_991
loop_989:
	call	loop_992
loop_990:
	brz,pn	%i2,	loop_993
	sllx	%i6,	0x11,	%g1
loop_991:
	alignaddrl	%l6,	%g3,	%i1
loop_992:
	call	loop_994
loop_993:
	call	loop_995
	call	loop_996
	call	loop_997
loop_994:
	lduw	[%l7 + 0x60],	%o0
loop_995:
	call	loop_998
loop_996:
	wrpr	%i5,	%l5,	%cwp
loop_997:
	umulcc	%i0,	0x1A66,	%o3
	movrne	%l0,	0x3B1,	%o6
loop_998:
	call	loop_999
	nop
	set	0x68, %l4
	swap	[%l7 + %l4],	%g7
	call	loop_1000
	mulscc	%g5,	%g6,	%i7
loop_999:
	call	loop_1001
	sll	%o5,	%o7,	%g4
loop_1000:
	fmovsvc	%xcc,	%f7,	%f23
	call	loop_1002
loop_1001:
	call	loop_1003
	call	loop_1004
	xnorcc	%i4,	0x051F,	%g2
loop_1002:
	call	loop_1005
loop_1003:
	call	loop_1006
loop_1004:
	wr	%l2,	0x11CE,	%sys_tick
	fmul8x16au	%f29,	%f22,	%f4
loop_1005:
	call	loop_1007
loop_1006:
	fmovsug	%fcc3,	%f26,	%f7
	call	loop_1008
	bmask	%i3,	%l3,	%o1
loop_1007:
	brlez	%o4,	loop_1009
	call	loop_1010
loop_1008:
	fmovscs	%xcc,	%f14,	%f26
	rdhpr	%htba,	%l4
loop_1009:
	fpadd32	%f2,	%f30,	%f16
loop_1010:
	fbo,a	%fcc2,	loop_1011
	rdpr	%tl,	%o2
	fmovduge	%fcc1,	%f4,	%f2
	nop
	fitos	%f4,	%f25
	fstox	%f25,	%f2
	fxtos	%f2,	%f26
loop_1011:
	subccc	%i2,	%i6,	%g1
	fnors	%f31,	%f13,	%f21
	call	loop_1012
	fcmpeq32	%f28,	%f26,	%l1
	call	loop_1013
	movpos	%xcc,	0x09F,	%l6
loop_1012:
	nop
	setx	0x801566C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x2B1CE520,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f1,	%f13
	fmovsneg	%icc,	%f13,	%f4
loop_1013:
	fmovrsne	%g3,	%f6,	%f12
	movuge	%fcc0,	%o0,	%i1
	fbug,a,pn	%fcc2,	loop_1014
	fxnors	%f7,	%f16,	%f0
	movcs	%xcc,	%i5,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x035, 	%hsys_tick_cmpr
loop_1014:
	call	loop_1015
	fmovsl	%fcc2,	%f23,	%f11
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f10
	wrpr	%l0,	0x19DC,	%tick
loop_1015:
	fmovdlg	%fcc1,	%f2,	%f8
	mova	%icc,	%g7,	%g5
	tvc	%icc,	0x5
	call	loop_1016
	bvc	%icc,	loop_1017
	call	loop_1018
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%f28
loop_1016:
	nop
	set	0x35, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o6
loop_1017:
	fmovscc	%icc,	%f10,	%f9
loop_1018:
	fmovdl	%icc,	%f8,	%f26
	call	loop_1019
	pdist	%f30,	%f16,	%f4
	mulx	%i7,	0x035D,	%g6
	call	loop_1020
loop_1019:
	rd	%softint,	%o5
	bn,pn	%xcc,	loop_1021
	movu	%fcc3,	0x1F5,	%o7
loop_1020:
	call	loop_1022
	rd	%sys_tick_cmpr,	%i4
loop_1021:
	call	loop_1023
	fmovrsne	%g2,	%f24,	%f7
loop_1022:
	call	loop_1024
	call	loop_1025
loop_1023:
	mulx	%l2,	0x0FCC,	%i3
	call	loop_1026
loop_1024:
	taddcctv	%g4,	0x0575,	%o1
loop_1025:
	tcs	%icc,	0x7
	movo	%fcc3,	0x48C,	%o4
loop_1026:
	nop
	setx	0x5D7DF90343D418C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBE7B714D4454B719,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f24,	%f6
	call	loop_1027
	movl	%icc,	%l4,	%l3
	fmovsge	%xcc,	%f18,	%f4
	nop
	fitos	%f11,	%f13
	fstox	%f13,	%f18
	fxtos	%f18,	%f16
loop_1027:
	fmovd	%f8,	%f4
	fmul8x16au	%f21,	%f12,	%f10
	fnegd	%f14,	%f20
	fpsub16	%f20,	%f30,	%f8
	nop
	set	0x40, %o1
	sth	%i2,	[%l7 + %o1]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 28
!	Type a   	: 28
!	Type x   	: 9
!	Type cti   	: 150
!	Type f   	: 161
!	Type i   	: 124
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
	set	0x8,	%g2
	set	0xC,	%g3
	set	0xA,	%g4
	set	0x7,	%g5
	set	0x8,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x3,	%i1
	set	-0x8,	%i2
	set	-0xB,	%i3
	set	-0x6,	%i4
	set	-0x3,	%i5
	set	-0x4,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x0A7BE2DC,	%l0
	set	0x74B8C931,	%l1
	set	0x3D520848,	%l2
	set	0x2A745552,	%l3
	set	0x2B86163C,	%l4
	set	0x7DACC093,	%l5
	set	0x3B3DE2EE,	%l6
	!# Output registers
	set	0x0556,	%o0
	set	0x1ED2,	%o1
	set	-0x1BFD,	%o2
	set	-0x0467,	%o3
	set	0x0B53,	%o4
	set	-0x06FB,	%o5
	set	-0x1011,	%o6
	set	-0x13FB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4B08680F9D4F1D99)
	INIT_TH_FP_REG(%l7,%f2,0xDFAF7089A55F9042)
	INIT_TH_FP_REG(%l7,%f4,0x1B72399AA1C06E63)
	INIT_TH_FP_REG(%l7,%f6,0x510E4400AD223E5A)
	INIT_TH_FP_REG(%l7,%f8,0x8DB2FCDCE8C1C283)
	INIT_TH_FP_REG(%l7,%f10,0xCDA3801BCAD6ECD5)
	INIT_TH_FP_REG(%l7,%f12,0x4FF95A4BFE30534B)
	INIT_TH_FP_REG(%l7,%f14,0x35284A2F3B4E1DAE)
	INIT_TH_FP_REG(%l7,%f16,0xA3B503AD0DED0D1E)
	INIT_TH_FP_REG(%l7,%f18,0x592A1E00D673E40F)
	INIT_TH_FP_REG(%l7,%f20,0x6CDA4990546BD57B)
	INIT_TH_FP_REG(%l7,%f22,0x35B555E01706E8A7)
	INIT_TH_FP_REG(%l7,%f24,0x0F2FD8945C5AA3C1)
	INIT_TH_FP_REG(%l7,%f26,0x2D95A14C78C621CB)
	INIT_TH_FP_REG(%l7,%f28,0x066015C2758991CE)
	INIT_TH_FP_REG(%l7,%f30,0x9358099FC722CA0E)

	!# Execute Main Diag ..

	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f10
	call	loop_1028
	movrgz	%o2,	0x22B,	%g1
	edge16ln	%l1,	%i6,	%g3
	nop
	setx	0x62A553BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x69E30728,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f5,	%f24
loop_1028:
	fmovse	%xcc,	%f22,	%f25
	call	loop_1029
	fpadd32s	%f2,	%f15,	%f19
	taddcctv	%o0,	0x0605,	%l6
	rd	%asi,	%i1
loop_1029:
	xorcc	%i0,	%l5,	%i5
	fabss	%f31,	%f20
	call	loop_1030
	fbu,a,pn	%fcc3,	loop_1031
	fabsd	%f20,	%f6
	umulcc	%l0,	0x0758,	%g7
loop_1030:
	xnor	%o3,	0x1AE5,	%o6
loop_1031:
	call	loop_1032
	udivcc	%g5,	0x00,	%g6
	nop
	setx	0x447BD7887CB4B502,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xCAB44A9A20509F17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f20
	fmovdgu	%icc,	%f24,	%f30
loop_1032:
	fxnor	%f16,	%f10,	%f20
	rd	%sys_tick_cmpr,	%o5
	rd	%pc,	%o7
	call	loop_1033
	call	loop_1034
	nop
	fitod	%f10,	%f16
	fdtos	%f16,	%f14
	edge8l	%i4,	%i7,	%l2
loop_1033:
	taddcctv	%i3,	%g2,	%o1
loop_1034:
	rd	%softint,	%g4
	call	loop_1035
	call	loop_1036
	fmovrdne	%o4,	%f16,	%f22
	umulcc	%l4,	0x02C8,	%i2
loop_1035:
	rdhpr	%ver,	%o2
loop_1036:
	rdhpr	%htba,	%g1
	bgu,a,pn	%icc,	loop_1037
	movue	%fcc2,	0x74D,	%l1
	movo	%fcc0,	%i6,	%l3
	movrgz	%o0,	%l6,	%g3
loop_1037:
	movre	%i0,	0x2A3,	%i1
	call	loop_1038
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	orncc	%l5,	0x075B,	%i5
	rdhpr	%ver,	%g7
loop_1038:
	fsrc1	%f14,	%f20
	fmovslg	%fcc1,	%f22,	%f16
	for	%f8,	%f16,	%f6
	add	%o3,	0x01CF,	%l0
	movrgez	%o6,	%g5,	%o5
	brlz	%g6,	loop_1039
	fcmple16	%f18,	%f16,	%o7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l2
loop_1039:
	be,a	%icc,	loop_1040
	call	loop_1041
	call	loop_1042
	fpackfix	%f12,	%f17
loop_1040:
	movpos	%icc,	0x14C,	%i3
loop_1041:
	call	loop_1043
loop_1042:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1044
	fmovdne	%icc,	%f4,	%f22
loop_1043:
	fornot1s	%f22,	%f12,	%f3
	tpos	%icc,	0x1
loop_1044:
	call	loop_1045
	sth	%g2,	[%l7 + 0x5A]
	set	0x3C, %o7
	sta	%f8,	[%l7 + %o7] 0x18
loop_1045:
	nop
	wr	%g0,	0xd2,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	call	loop_1046
	nop
	set	0x5E, %l2
	lduh	[%l7 + %l2],	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o1,	%o4
loop_1046:
	tcs	%xcc,	0x5
	edge16ln	%l4,	%g4,	%o2
	fcmple16	%f30,	%f16,	%i2
	tvc	%icc,	0x1
	tne	%xcc,	0x7
	call	loop_1047
	sir	0x0E05
	fbge,a,pt	%fcc0,	loop_1048
	fmovdneg	%xcc,	%f8,	%f0
loop_1047:
	movrne	%g1,	%i6,	%l3
	call	loop_1049
loop_1048:
	bneg,a,pt	%xcc,	loop_1050
	call	loop_1051
	movrgz	%l1,	0x160,	%o0
loop_1049:
	call	loop_1052
loop_1050:
	fmovdo	%fcc3,	%f14,	%f16
loop_1051:
	fmovrslez	%l6,	%f9,	%f31
	call	loop_1053
loop_1052:
	fmovsg	%xcc,	%f12,	%f15
	tcc	%xcc,	0x6
	fcmple32	%f8,	%f8,	%g3
loop_1053:
	fmovso	%fcc2,	%f26,	%f14
	fnot1s	%f0,	%f4
	fcmpeq32	%f8,	%f28,	%i1
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i0
	call	loop_1054
	add	%i5,	%g7,	%l5
	fmovsvc	%icc,	%f4,	%f31
	add	%l0,	0x15D3,	%o6
loop_1054:
	tl	%icc,	0x0
	fmovdpos	%xcc,	%f14,	%f10
	fcmple16	%f14,	%f28,	%o3
	tn	%xcc,	0x3
	fblg,pn	%fcc0,	loop_1055
	udivx	%o5,	%g6,	%g5
	membar	0x27
	fornot1s	%f31,	%f27,	%f27
loop_1055:
	fmovsg	%icc,	%f30,	%f5
	nop
	setx	0x2091D382BFC8CEA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7946F62C562114DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f2,	%f30
	edge32l	%i7,	%o7,	%l2
	prefetch	[%l7 + 0x38],	 2
	subc	%i3,	0x1B10,	%g2
	addc	%i4,	0x157B,	%o1
	call	loop_1056
	addccc	%l4,	0x165B,	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o4,	%i2
loop_1056:
	fcmped	%fcc3,	%f26,	%f30
	call	loop_1057
	call	loop_1058
	fmovdu	%fcc2,	%f24,	%f16
	fpsub32	%f16,	%f8,	%f0
loop_1057:
	fmovsleu	%xcc,	%f24,	%f26
loop_1058:
	ta	%icc,	0x6
	fmovdug	%fcc3,	%f0,	%f14
	fmovdule	%fcc1,	%f18,	%f0
	tcc	%icc,	0x0
	nop
	setx	loop_1059,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002100001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_1060
	call	loop_1061
	call	loop_1062
loop_1059:
	fnand	%f22,	%f10,	%f14
loop_1060:
	flushw
loop_1061:
	fsrc2	%f2,	%f18
loop_1062:
	fbu,pn	%fcc0,	loop_1063
	fmovrdlez	%g1,	%f30,	%f28
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movule	%fcc0,	0x0BC,	%o2
loop_1063:
	movcs	%icc,	%l3,	%i6
	call	loop_1064
	orn	%l1,	%l6,	%o0
	call	loop_1065
	call	loop_1066
loop_1064:
	call	loop_1067
	rdhpr	%htba,	%i1
loop_1065:
	mulx	%i0,	%g3,	%i5
loop_1066:
	fpack16	%f18,	%f11
loop_1067:
	fexpand	%f21,	%f4
	fcmpeq16	%f8,	%f16,	%l5
	addccc	%l0,	0x081A,	%g7
	movue	%fcc2,	%o6,	%o5
	fmul8x16al	%f5,	%f12,	%f14
	fand	%f12,	%f30,	%f6
	fzero	%f30
	call	loop_1068
	fmuld8sux16	%f14,	%f10,	%f18
	call	loop_1069
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f0
loop_1068:
	rdhpr	%hsys_tick_cmpr,	%g6
	edge16n	%g5,	%o3,	%i7
loop_1069:
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f18
	fmovdne	%xcc,	%f12,	%f20
	addcc	%l2,	%i3,	%g2
	fnot1	%f0,	%f18
	fcmpes	%fcc2,	%f10,	%f5
	fbule,a	%fcc0,	loop_1070
	membar	0x20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsn	%icc,	%f29,	%f15
loop_1070:
	call	loop_1071
	flushw
	movrne	%o7,	%l4,	%g4
	call	loop_1072
loop_1071:
	fmovdug	%fcc1,	%f4,	%f22
	addccc	%o1,	0x0F08,	%o4
	call	loop_1073
loop_1072:
	fone	%f10
	edge32n	%g1,	%o2,	%l3
	bvs,a	%icc,	loop_1074
loop_1073:
	fbo,a,pt	%fcc1,	loop_1075
	call	loop_1076
	call	loop_1077
loop_1074:
	fsrc2	%f22,	%f0
loop_1075:
	edge16l	%i6,	%i2,	%l1
loop_1076:
	wr 	%g0, 	0x4, 	%fprs
loop_1077:
	call	loop_1078
	nop
	setx	0x1D3905A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f1
	fmovdvc	%xcc,	%f0,	%f24
	membar	0x64
loop_1078:
	taddcc	%i1,	0x1616,	%i0
	call	loop_1079
	fexpand	%f26,	%f0
	flush	%l7 + 0x30
	fmovrdgez	%l6,	%f6,	%f14
loop_1079:
	fpsub16	%f26,	%f20,	%f24
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g3
	orncc	%i5,	%l0,	%g7
	tcs	%icc,	0x1
	call	loop_1080
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f30
	udivx	%o6,	0x00,	%l5
	fpack32	%f12,	%f28,	%f26
loop_1080:
	fmovrsne	%o5,	%f14,	%f0
	pdist	%f12,	%f24,	%f2
	stw	%g5,	[%l7 + 0x78]
	fone	%f20
	orncc	%g6,	%i7,	%l2
	call	loop_1081
	nop
	fitod	%f4,	%f8
	call	loop_1082
	fexpand	%f23,	%f4
loop_1081:
	fpackfix	%f28,	%f2
	fzero	%f6
loop_1082:
	fnors	%f21,	%f3,	%f28
	call	loop_1083
	andncc	%i3,	0x1F75,	%o3
	nop
	set	0x30, %o3
	swap	[%l7 + %o3],	%i4
	tcs	%icc,	0x0
loop_1083:
	call	loop_1084
	tcs	%icc,	0x3
	call	loop_1085
	fmovsneg	%icc,	%f14,	%f28
loop_1084:
	call	loop_1086
	edge16	%g2,	%o7,	%l4
loop_1085:
	fmovrdlez	%o1,	%f18,	%f26
	movrgz	%g4,	%g1,	%o2
loop_1086:
	call	loop_1087
	edge8ln	%o4,	%l3,	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x98C, 	%hsys_tick_cmpr
	fbue,pn	%fcc0,	loop_1088
loop_1087:
	fmovdneg	%xcc,	%f2,	%f12
	move	%icc,	%l1,	%i1
	call	loop_1089
loop_1088:
	fones	%f16
	rdhpr	%hsys_tick_cmpr,	%o0
	fpsub32	%f28,	%f28,	%f24
loop_1089:
	fxor	%f2,	%f30,	%f30
	fmovrslz	%l6,	%f10,	%f23
	call	loop_1090
	call	loop_1091
	fmovsu	%fcc1,	%f20,	%f0
	fmovdpos	%xcc,	%f28,	%f28
loop_1090:
	fmovrdne	%i0,	%f14,	%f2
loop_1091:
	call	loop_1092
	fnot2s	%f27,	%f4
	fbge,a,pn	%fcc2,	loop_1093
	fpsub16	%f2,	%f0,	%f6
loop_1092:
	movo	%fcc1,	%i5,	%g3
	tle	%xcc,	0x7
loop_1093:
	call	loop_1094
	flushw
	call	loop_1095
	call	loop_1096
loop_1094:
	fmovspos	%xcc,	%f11,	%f23
	fsrc2s	%f30,	%f24
loop_1095:
	rdhpr	%hpstate,	%l0
loop_1096:
	call	loop_1097
	fmovsul	%fcc2,	%f29,	%f9
	fmovrsne	%g7,	%f11,	%f3
	call	loop_1098
loop_1097:
	fblg	%fcc3,	loop_1099
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	lduw	[%l7 + 0x50],	%o6
loop_1098:
	fpackfix	%f26,	%f22
loop_1099:
	fmul8x16au	%f29,	%f28,	%f20
	smulcc	%l5,	0x1B6B,	%g5
	fsrc1	%f30,	%f24
	movre	%g6,	%o5,	%l2
	movuge	%fcc3,	0x760,	%i3
	call	loop_1100
	popc	%i7,	%i4
	fcmpeq32	%f18,	%f30,	%o3
	or	%o7,	0x1794,	%g2
loop_1100:
	tgu	%icc,	0x4
	call	loop_1101
	ldd	[%l7 + 0x18],	%f22
	call	loop_1102
	fmovsle	%xcc,	%f9,	%f7
loop_1101:
	fcmped	%fcc0,	%f26,	%f16
	fbne,a,pt	%fcc0,	loop_1103
loop_1102:
	call	loop_1104
	fnegs	%f14,	%f31
	edge16l	%l4,	%g4,	%g1
loop_1103:
	call	loop_1105
loop_1104:
	brgz,pt	%o2,	loop_1106
	call	loop_1107
	call	loop_1108
loop_1105:
	ble,a	%icc,	loop_1109
loop_1106:
	andn	%o1,	%o4,	%i2
loop_1107:
	array8	%i6,	%l1,	%i1
loop_1108:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o0,	%l6
loop_1109:
	nop
	wr	%g0,	0xd8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	fitod	%f5,	%f16
	call	loop_1110
	rdpr	%cwp,	%i0
	fpack16	%f16,	%f19
	fxnors	%f27,	%f6,	%f27
loop_1110:
	fmovsne	%xcc,	%f27,	%f16
	call	loop_1111
	orn	%i5,	0x13DD,	%l3
	call	loop_1112
	call	loop_1113
loop_1111:
	edge8l	%g3,	%l0,	%o6
	nop
	fitod	%f24,	%f24
loop_1112:
	mova	%fcc0,	%g7,	%g5
loop_1113:
	nop
	set	0x10, %i6
	std	%g6,	[%l7 + %i6]
	call	loop_1114
	xor	%l5,	0x06EB,	%o5
	fsrc1s	%f3,	%f10
	sllx	%l2,	0x1A,	%i7
loop_1114:
	fmovslg	%fcc0,	%f25,	%f15
	set	0x63, %i2
	ldsba	[%l7 + %i2] 0x81,	%i3
	edge16ln	%o3,	%o7,	%g2
	call	loop_1115
	movvc	%icc,	0x0CA,	%l4
	add	%i4,	0x0C08,	%g1
	movrlez	%g4,	0x345,	%o1
loop_1115:
	fnands	%f27,	%f2,	%f26
	rdpr	%canrestore,	%o4
	fsrc1s	%f11,	%f24
	fcmpeq16	%f24,	%f16,	%i2
	edge32l	%o2,	%l1,	%i6
	call	loop_1116
	ldd	[%l7 + 0x48],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tle	%icc,	0x3
loop_1116:
	tgu	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x4C] %asi,	%f6
	fmovsleu	%xcc,	%f26,	%f3
	call	loop_1117
	nop
	setx	0x2C093B7B87831E79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6FC9DD63,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f22,	%f6
	fmovsvs	%icc,	%f18,	%f28
	xorcc	%i0,	%i5,	%l3
loop_1117:
	fpmerge	%f12,	%f23,	%f14
	fmuld8sux16	%f12,	%f26,	%f2
	movpos	%icc,	0x5B8,	%i1
	fpack32	%f30,	%f8,	%f6
	tle	%icc,	0x5
	call	loop_1118
	call	loop_1119
	nop
	setx	0xE8915B7EBF43A251,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE88E058D115C2090,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f8,	%f28
	call	loop_1120
loop_1118:
	call	loop_1121
loop_1119:
	call	loop_1122
	fcmped	%fcc2,	%f0,	%f16
loop_1120:
	umulcc	%g3,	0x14DE,	%l0
loop_1121:
	bshuffle	%f8,	%f12,	%f28
loop_1122:
	call	loop_1123
	brnz,a	%g7,	loop_1124
	fpmerge	%f11,	%f0,	%f26
	call	loop_1125
loop_1123:
	stbar
loop_1124:
	fmovsleu	%xcc,	%f4,	%f26
	bneg,pt	%icc,	loop_1126
loop_1125:
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f14
	fpack16	%f26,	%f13
	nop
	setx	0x41E6C00813282D3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x068DE072969063F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f18,	%f18
loop_1126:
	fmovslg	%fcc1,	%f6,	%f20
	movge	%xcc,	%g5,	%g6
	sdiv	%o6,	%o5,	%l2
	call	loop_1127
	bpos	%icc,	loop_1128
	fpsub16s	%f14,	%f0,	%f29
	popc	%l5,	%i7
loop_1127:
	movcs	%icc,	%i3,	%o3
loop_1128:
	movn	%xcc,	0x1EE,	%o7
	movo	%fcc0,	0x2CB,	%g2
	fmovsul	%fcc0,	%f12,	%f31
	fmovdcc	%xcc,	%f8,	%f28
	call	loop_1129
	movvc	%xcc,	0x24E,	%l4
	call	loop_1130
	fpsub32	%f28,	%f28,	%f14
loop_1129:
	call	loop_1131
	fmovrdlez	%g1,	%f0,	%f12
loop_1130:
	sllx	%g4,	%o1,	%o4
	call	loop_1132
loop_1131:
	fmovdn	%icc,	%f26,	%f18
	fcmpgt16	%f14,	%f26,	%i4
	call	loop_1133
loop_1132:
	fmovsuge	%fcc3,	%f15,	%f31
	call	loop_1134
	wr 	%g0, 	0x6, 	%fprs
loop_1133:
	edge32n	%o2,	%i6,	%l1
	nop
	setx	0x5AFB5455,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
loop_1134:
	movre	%o0,	0x326,	%l6
	andncc	%i0,	0x1477,	%l3
	movcc	%xcc,	%i5,	%i1
	fxor	%f26,	%f6,	%f12
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1135
	srl	%l0,	0x16,	%g3
	call	loop_1136
	tsubcc	%g5,	0x1B23,	%g7
loop_1135:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f2
	fxtod	%f2,	%f30
	fpack16	%f4,	%f2
loop_1136:
	movl	%icc,	%g6,	%o6
	subccc	%o5,	%l5,	%l2
	call	loop_1137
	movug	%fcc1,	%i7,	%i3
	movle	%fcc1,	%o7,	%g2
	call	loop_1138
loop_1137:
	fnot1s	%f23,	%f26
	set	0x28, %l1
	stxa	%l4,	[%l7 + %l1] 0x2b
	membar	#Sync
loop_1138:
	fmovrslz	%g1,	%f15,	%f13
	nop
	fitos	%f2,	%f21
	fstod	%f21,	%f16
	rdpr	%gl,	%o3
	call	loop_1139
	movrlz	%o1,	%g4,	%i4
	srl	%i2,	%o2,	%i6
	rdhpr	%hintp,	%o4
loop_1139:
	fmovspos	%xcc,	%f21,	%f0
	wrpr	%l1,	%o0,	%tick
	edge16ln	%i0,	%l6,	%i5
	movgu	%xcc,	%l3,	%l0
	andcc	%i1,	%g3,	%g5
	rdpr	%cwp,	%g7
	set	0x7D, %o0
	ldsba	[%l7 + %o0] 0x0c,	%o6
	fandnot2	%f30,	%f2,	%f12
	call	loop_1140
	call	loop_1141
	call	loop_1142
	fmovdvs	%xcc,	%f6,	%f12
loop_1140:
	call	loop_1143
loop_1141:
	fmovsleu	%icc,	%f1,	%f7
loop_1142:
	nop
	setx	0x3C74DA225FABBEB9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x43A6F984EE409B1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f30
	mulx	%g6,	%l5,	%l2
loop_1143:
	fornot2s	%f1,	%f19,	%f29
	udivcc	%i7,	0x00,	%o5
	fmovda	%fcc3,	%f30,	%f16
	andn	%o7,	0x0F32,	%i3
	fmovdleu	%xcc,	%f4,	%f28
	bshuffle	%f22,	%f0,	%f24
	fcmpeq16	%f22,	%f12,	%g2
	call	loop_1144
	tl	%icc,	0x5
	fmovspos	%xcc,	%f17,	%f22
	umulcc	%g1,	%l4,	%o3
loop_1144:
	bcc,a	%xcc,	loop_1145
	xor	%o1,	%i4,	%g4
	sdivx	%o2,	%i6,	%i2
	fcmple16	%f18,	%f18,	%o4
loop_1145:
	fones	%f1
	st	%f31,	[%l7 + 0x68]
	call	loop_1146
	fnand	%f2,	%f12,	%f12
	fmovdle	%xcc,	%f22,	%f12
	fblg,pt	%fcc1,	loop_1147
loop_1146:
	fmovdue	%fcc1,	%f4,	%f6
	fcmpeq32	%f6,	%f20,	%l1
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%o0
loop_1147:
	subccc	%l6,	%i5,	%l3
	set	0x14, %o4
	stwa	%l0,	[%l7 + %o4] 0x2b
	membar	#Sync
	fmovdl	%fcc1,	%f26,	%f4
	fnors	%f16,	%f23,	%f5
	sllx	%i1,	%g3,	%g5
	sir	0x0DA8
	nop
	fitos	%f24,	%f17
	movo	%fcc0,	0x56A,	%g7
	fmovsvc	%xcc,	%f23,	%f31
	call	loop_1148
	call	loop_1149
	wrpr 	%g0, 	0x0, 	%gl
	fmovrsgz	%g6,	%f17,	%f10
loop_1148:
	rdhpr	%htba,	%o6
loop_1149:
	sll	%l5,	0x1D,	%i7
	flushw
	orncc	%l2,	%o5,	%i3
	call	loop_1150
	tcc	%xcc,	0x1
	fmovslg	%fcc2,	%f1,	%f12
	fcmpeq32	%f2,	%f2,	%o7
loop_1150:
	call	loop_1151
	call	loop_1152
	call	loop_1153
	tgu	%icc,	0x3
loop_1151:
	wrpr	%g2,	0x1F75,	%tick
loop_1152:
	fblg,a	%fcc2,	loop_1154
loop_1153:
	fnot1s	%f14,	%f7
	fmovse	%fcc1,	%f0,	%f3
	call	loop_1155
loop_1154:
	siam	0x7
	call	loop_1156
	umul	%l4,	%g1,	%o1
loop_1155:
	edge8	%o3,	%i4,	%o2
	call	loop_1157
loop_1156:
	fornot1s	%f13,	%f27,	%f17
loop_1157:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 29
!	Type a   	: 25
!	Type x   	: 13
!	Type cti   	: 130
!	Type f   	: 163
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
.word 0x54BA626A
.word 0x6A41B1BC
.word 0xD9985702
.word 0x1E3A31DF
.word 0x022038F9
.word 0xAE18C477
.word 0xCC1A453A
.word 0x564F6DAD
.word 0xDBE6010C
.word 0x64E6929B
.word 0xAD7E1553
.word 0xF2FCB764
.word 0xDFF6F2DF
.word 0x31BE35E2
.word 0x9244BFD5
.word 0xB296F02A
.word 0x894B61FF
.word 0x87209373
.word 0x60858B95
.word 0xBDA77749
.word 0x1D193861
.word 0xEB21109A
.word 0xFC46CDD7
.word 0x3D163DAF
.word 0x940AE839
.word 0xCC0D7A2D
.word 0x4DB4FA50
.word 0x5A7A4C3C
.word 0xC9E4D91E
.word 0x2EB91BBD
.word 0x49CC44DD
.word 0xD952CCDF
.word 0x20C6EEC5
.word 0xA9D8A872
.word 0xBB8FA139
.word 0x0074BA6F
.word 0x8AFB9DCF
.word 0x89C2FACB
.word 0x2EBD9A48
.word 0xC83DFAC2
.word 0x304CADC3
.word 0xCB390E24
.word 0x775A0EB6
.word 0xEA0B266E
.word 0xC976DC02
.word 0xE7728327
.word 0xD56E5C21
.word 0x30E795CD
.word 0xA6C6183B
.word 0x5551E970
.word 0x63EE99E0
.word 0x37887A4F
.word 0xE5491002
.word 0xAFD1B440
.word 0x284F27FB
.word 0xFE567510
.word 0x01D5A91A
.word 0xBEBDC626
.word 0xCE55ACA1
.word 0x99BFFC34
.word 0x19655831
.word 0x2896DA18
.word 0x85368045
.word 0xC7B34369
.end
