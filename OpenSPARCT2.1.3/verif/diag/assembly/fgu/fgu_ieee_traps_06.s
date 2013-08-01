/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_06.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12344"
.ident "Mon Dec  8 19:23:20 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_06.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x3,	%g1
	set	0x1,	%g2
	set	0xD,	%g3
	set	0xF,	%g4
	set	0xF,	%g5
	set	0xB,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x8,	%i1
	set	-0x3,	%i2
	set	-0x0,	%i3
	set	-0x4,	%i4
	set	-0x7,	%i5
	set	-0x1,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x7D2563F6,	%l0
	set	0x732BB22D,	%l1
	set	0x52B9A3FD,	%l2
	set	0x7B56D093,	%l3
	set	0x026A2A59,	%l4
	set	0x1A649583,	%l5
	set	0x788FD8EF,	%l6
	!# Output registers
	set	-0x0038,	%o0
	set	0x09A8,	%o1
	set	0x0048,	%o2
	set	0x1834,	%o3
	set	-0x0F01,	%o4
	set	0x19A7,	%o5
	set	0x13B4,	%o6
	set	0x1124,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	orncc	%g3,	%l6,	%i5
	sir	0x0D57
	call	loop_1
	call	loop_2
	call	loop_3
	fpsub16s	%f22,	%f12,	%f0
loop_1:
	fnot2	%f26,	%f0
loop_2:
	call	loop_4
loop_3:
	ldstub	[%l7 + 0x57],	%g7
	fmovsvs	%xcc,	%f1,	%f0
	alignaddrl	%l1,	%g6,	%l5
loop_4:
	fmovdcs	%xcc,	%f30,	%f8
	tn	%icc,	0x0
	fmovsa	%fcc3,	%f1,	%f21
	fmovrdne	%i4,	%f10,	%f2
	call	loop_5
	fnors	%f26,	%f15,	%f18
	fcmpgt16	%f30,	%f2,	%g1
	call	loop_6
loop_5:
	fmovsneg	%icc,	%f24,	%f13
	fbn,a	%fcc2,	loop_7
	siam	0x7
loop_6:
	call	loop_8
	fornot1s	%f19,	%f30,	%f7
loop_7:
	tvc	%icc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDB7, 	%sys_tick_cmpr
loop_8:
	nop
	setx	0x681BB215BF631757,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x29B983D44A9D7378,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f6,	%f24
	call	loop_9
	fmovduge	%fcc3,	%f28,	%f26
	call	loop_10
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_9:
	ldsh	[%l7 + 0x68],	%o7
	xorcc	%o4,	%i6,	%i1
loop_10:
	fmovsul	%fcc2,	%f30,	%f29
	fpsub32s	%f8,	%f30,	%f20
	fblg,a,pn	%fcc2,	loop_11
	fone	%f2
	bcc,a,pt	%icc,	loop_12
	call	loop_13
loop_11:
	fmovscc	%xcc,	%f27,	%f21
	for	%f28,	%f18,	%f10
loop_12:
	movrgez	%o6,	%g2,	%o3
loop_13:
	movrgez	%l0,	0x3B0,	%l3
	fcmpd	%fcc1,	%f4,	%f30
	call	loop_14
	bg,a	%xcc,	loop_15
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%g4
	call	loop_16
loop_14:
	nop
	set	0x40, %g4
	std	%f8,	[%l7 + %g4]
loop_15:
	nop
	setx	0xF0830300662851C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA525FBE95579A450,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f28,	%f12
	fmovdo	%fcc2,	%f16,	%f14
loop_16:
	call	loop_17
	fbl,a,pn	%fcc2,	loop_18
	call	loop_19
	bcc	%xcc,	loop_20
loop_17:
	call	loop_21
loop_18:
	xorcc	%i0,	0x13FA,	%i7
loop_19:
	rdhpr	%htba,	%o5
loop_20:
	fmovsuge	%fcc1,	%f7,	%f4
loop_21:
	call	loop_22
	umulcc	%o0,	%g5,	%o1
	fmul8x16al	%f26,	%f20,	%f20
	fmul8sux16	%f30,	%f20,	%f22
loop_22:
	call	loop_23
	call	loop_24
	fornot1s	%f3,	%f31,	%f24
	rdhpr	%hintp,	%l2
loop_23:
	nop
	setx	0x9B9B89710F0A5D23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0C58A9997473D925,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f10
loop_24:
	orn	%l4,	0x0CFD,	%o2
	tl	%icc,	0x4
	fpack16	%f14,	%f13
	tvs	%icc,	0x7
	bleu,pt	%icc,	loop_25
	stw	%i3,	[%l7 + 0x44]
	fmovrse	%l6,	%f16,	%f8
	fbo,pt	%fcc2,	loop_26
loop_25:
	array8	%i5,	%g7,	%g3
	fcmple16	%f20,	%f6,	%g6
	nop
	fitos	%f8,	%f18
	fstox	%f18,	%f10
loop_26:
	movrgez	%l1,	0x259,	%i4
	nop
	setx	0xE2AC1291,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	call	loop_27
	xor	%g1,	0x1956,	%l5
	smulcc	%o7,	0x04B7,	%i2
	fmovsleu	%icc,	%f0,	%f19
loop_27:
	orncc	%i6,	%i1,	%o4
	fmovso	%fcc0,	%f23,	%f30
	movrlz	%o6,	0x091,	%o3
	fmovrdne	%l0,	%f30,	%f22
	set	0x18, %l6
	ldswa	[%l7 + %l6] 0x18,	%g2
	fmovsneg	%icc,	%f26,	%f21
	alignaddr	%g4,	%i0,	%l3
	call	loop_28
	call	loop_29
	fmovrsgez	%i7,	%f26,	%f25
	fmovdcc	%xcc,	%f14,	%f14
loop_28:
	fmovsne	%xcc,	%f3,	%f24
loop_29:
	array8	%o0,	%o5,	%o1
	fmovscs	%icc,	%f13,	%f30
	bn	%xcc,	loop_30
	movo	%fcc0,	%g5,	%l4
	call	loop_31
	tcs	%xcc,	0x5
loop_30:
	nop
	setx	0x186F1B697CEA2A49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE03977F41851E491,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f4,	%f4
	call	loop_32
loop_31:
	rdpr	%gl,	%l2
	call	loop_33
	call	loop_34
loop_32:
	orncc	%i3,	0x0411,	%o2
	fmuld8sux16	%f31,	%f20,	%f24
loop_33:
	nop
	set	0x70, %i5
	stx	%i5,	[%l7 + %i5]
loop_34:
	fmovdul	%fcc1,	%f6,	%f26
	call	loop_35
	call	loop_36
	call	loop_37
	fmul8x16al	%f22,	%f22,	%f22
loop_35:
	tleu	%xcc,	0x0
loop_36:
	call	loop_38
loop_37:
	xor	%g7,	0x0DF9,	%l6
	fmovduge	%fcc3,	%f22,	%f6
	nop
	setx	0x58F06AC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_38:
	call	loop_39
	sdivx	%g3,	0x0BF6,	%l1
	call	loop_40
	fmovrdlez	%i4,	%f12,	%f28
loop_39:
	fmovrdgz	%g6,	%f6,	%f28
	call	loop_41
loop_40:
	nop
	setx	0xA06FD0DE1AA83644,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f16
	nop
	set	0x68, %g2
	ldx	[%l7 + %g2],	%g1
	fmovdvs	%xcc,	%f4,	%f16
loop_41:
	call	loop_42
	fpack16	%f2,	%f24
	fmovde	%xcc,	%f6,	%f0
	xnor	%o7,	0x043B,	%l5
loop_42:
	call	loop_43
	fmovsvs	%xcc,	%f3,	%f16
	call	loop_44
	tn	%icc,	0x0
loop_43:
	mulx	%i2,	%i1,	%i6
	bvs,pn	%xcc,	loop_45
loop_44:
	call	loop_46
	fone	%f12
	xor	%o6,	0x077C,	%o4
loop_45:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%o3
loop_46:
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f14
	fxtos	%f14,	%f7
	call	loop_47
	call	loop_48
	wr	%l0,	%g4,	%ccr
	fmovdleu	%icc,	%f2,	%f10
loop_47:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC79, 	%hsys_tick_cmpr
loop_48:
	fblg	%fcc0,	loop_49
	call	loop_50
	edge32n	%l3,	%i0,	%i7
	nop
	setx	0xBB8EF917,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x8DBF7BA2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f12,	%f9
loop_49:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o0
loop_50:
	fcmps	%fcc1,	%f16,	%f6
	fmuld8sux16	%f10,	%f10,	%f26
	nop
	fitod	%f12,	%f2
	fdtos	%f2,	%f17
	fmovsne	%xcc,	%f28,	%f19
	movvs	%xcc,	0x59C,	%o1
	sll	%g5,	0x04,	%l4
	call	loop_51
	fpsub16	%f6,	%f20,	%f8
	orncc	%l2,	%i3,	%o5
	call	loop_52
loop_51:
	xor	%o2,	0x1DBB,	%i5
	andn	%g7,	%l6,	%g3
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f10
loop_52:
	rdhpr	%hsys_tick_cmpr,	%l1
	brlez,a,pn	%i4,	loop_53
	call	loop_54
	call	loop_55
	fmovscc	%xcc,	%f12,	%f13
loop_53:
	fabsd	%f20,	%f4
loop_54:
	fcmpgt16	%f28,	%f0,	%g6
loop_55:
	call	loop_56
	call	loop_57
	fmovdu	%fcc3,	%f10,	%f30
	fcmpes	%fcc3,	%f2,	%f5
loop_56:
	fmovscc	%xcc,	%f22,	%f2
loop_57:
	edge32ln	%o7,	%l5,	%i2
	nop
	setx	0x0900,	%l0,	%i6
	sdivcc	%i1,	%i6,	%g1
	call	loop_58
	fbue,a	%fcc3,	loop_59
	mulscc	%o6,	0x1F07,	%o4
	fmovrslez	%o3,	%f27,	%f4
loop_58:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 2
loop_59:
	fmovrde	%g4,	%f4,	%f22
	fcmpne32	%f18,	%f28,	%g2
	wr	%l3,	%i0,	%ccr
	fmul8x16au	%f1,	%f2,	%f18
	subc	%i7,	%o0,	%g5
	fnot2	%f18,	%f26
	fcmps	%fcc1,	%f14,	%f30
	nop
	setx	0x31E2F4E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f2
	fpack32	%f12,	%f4,	%f10
	call	loop_60
	edge32ln	%o1,	%l4,	%l2
	nop
	set	0x0E, %g3
	ldsb	[%l7 + %g3],	%i3
	nop
	set	0x34, %o5
	lduh	[%l7 + %o5],	%o5
loop_60:
	for	%f2,	%f14,	%f18
	movneg	%xcc,	0x598,	%i5
	nop
	fitos	%f9,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f3
	movu	%fcc0,	0x4A5,	%g7
	swap	[%l7 + 0x64],	%o2
	tne	%xcc,	0x6
	fmovdg	%icc,	%f30,	%f4
	fcmpne16	%f14,	%f24,	%l6
	be	%xcc,	loop_61
	call	loop_62
	nop
	setx	0x5EA6DBB795449137,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x704404AA80B05A99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f10,	%f26
	movue	%fcc2,	%l1,	%g3
loop_61:
	udiv	%i4,	0x1780,	%g6
loop_62:
	fmovsge	%fcc2,	%f26,	%f29
	call	loop_63
	fornot1s	%f4,	%f1,	%f17
	fmul8sux16	%f14,	%f28,	%f28
	movrne	%l5,	%i2,	%o7
loop_63:
	fpackfix	%f22,	%f7
	call	loop_64
	fandnot2	%f8,	%f18,	%f22
	fmovsug	%fcc2,	%f31,	%f21
	call	loop_65
loop_64:
	fmuld8sux16	%f26,	%f20,	%f4
	wr	%i1,	0x02C4,	%softint
	fnot1s	%f16,	%f10
loop_65:
	fmovdlg	%fcc0,	%f20,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x694, 	%hsys_tick_cmpr
	fmovrsgz	%g1,	%f31,	%f21
	call	loop_66
	call	loop_67
	movul	%fcc1,	%o4,	%l0
	fnot2s	%f3,	%f30
loop_66:
	rdhpr	%htba,	%o3
loop_67:
	call	loop_68
	fmovsug	%fcc1,	%f5,	%f30
	call	loop_69
	umulcc	%g2,	%l3,	%g4
loop_68:
	nop
	setx	0x0887,	%l0,	%o0
	sdiv	%i7,	%o0,	%i0
	call	loop_70
loop_69:
	and	%g5,	%o1,	%l2
	addcc	%i3,	0x0CBC,	%o5
	call	loop_71
loop_70:
	nop
	set	0x28, %i0
	std	%f10,	[%l7 + %i0]
	fmovdleu	%xcc,	%f30,	%f10
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f16
loop_71:
	call	loop_72
	brz,a,pt	%l4,	loop_73
	fmovrdlez	%g7,	%f28,	%f30
	call	loop_74
loop_72:
	array16	%i5,	%l6,	%l1
loop_73:
	movvs	%xcc,	%o2,	%g3
	alignaddr	%g6,	%l5,	%i2
loop_74:
	fpackfix	%f12,	%f14
	fmovdule	%fcc0,	%f6,	%f14
	nop
	setx	0x1F1D,	%l0,	%o7
	sdiv	%i4,	%o7,	%i6
	fpmerge	%f13,	%f30,	%f12
	nop
	fitod	%f4,	%f20
	fdtoi	%f20,	%f24
	nop
	fitos	%f21,	%f4
	edge16n	%o6,	%i1,	%o4
	call	loop_75
	sethi	0x0252,	%l0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rdpr	%gl,	%g1
loop_75:
	call	loop_76
	call	loop_77
	tpos	%icc,	0x3
	call	loop_78
loop_76:
	xnor	%o3,	0x12C3,	%g2
loop_77:
	movue	%fcc3,	0x2B3,	%g4
	fnegs	%f2,	%f22
loop_78:
	fmovdvs	%icc,	%f8,	%f26
	mova	%icc,	%i7,	%o0
	call	loop_79
	nop
	fitos	%f17,	%f1
	fmovrdlz	%l3,	%f14,	%f4
	movlg	%fcc0,	%i0,	%o1
loop_79:
	fmul8x16al	%f6,	%f22,	%f20
	call	loop_80
	smulcc	%g5,	%i3,	%o5
	bvs,pn	%icc,	loop_81
	call	loop_82
loop_80:
	fmovdue	%fcc0,	%f22,	%f22
	call	loop_83
loop_81:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_82:
	call	loop_84
	nop
	set	0x7A, %i2
	ldstub	[%l7 + %i2],	%l4
loop_83:
	fexpand	%f11,	%f12
	fmovrde	%l2,	%f14,	%f10
loop_84:
	call	loop_85
	call	loop_86
	call	loop_87
	alignaddrl	%i5,	%g7,	%l6
loop_85:
	fnor	%f26,	%f12,	%f0
loop_86:
	movrne	%l1,	%o2,	%g3
loop_87:
	fornot1	%f24,	%f14,	%f20
	edge32n	%g6,	%i2,	%i4
	fbe,pt	%fcc1,	loop_88
	call	loop_89
	fors	%f19,	%f21,	%f30
	nop
	fitos	%f8,	%f17
loop_88:
	fcmple16	%f4,	%f28,	%l5
loop_89:
	fmovrslz	%o7,	%f30,	%f6
	fmovrsgez	%o6,	%f8,	%f4
	rdhpr	%ver,	%i6
	fbul,a	%fcc0,	loop_90
	andn	%i1,	%o4,	%g1
	ba	%icc,	loop_91
	bn,a	%xcc,	loop_92
loop_90:
	fpsub32s	%f13,	%f12,	%f26
	wr	%g0,	0x88,	%asi
	stda	%o2,	[%l7 + 0x08] %asi
loop_91:
	fpadd16	%f30,	%f18,	%f30
loop_92:
	fbul,a	%fcc3,	loop_93
	fmovdneg	%icc,	%f28,	%f10
	call	loop_94
	fmovdn	%fcc1,	%f18,	%f26
loop_93:
	brlez,a	%l0,	loop_95
	movgu	%icc,	0x418,	%g2
loop_94:
	call	loop_96
	fcmpne16	%f4,	%f4,	%i7
loop_95:
	fmovsne	%icc,	%f6,	%f7
	sub	%o0,	0x04E9,	%g4
loop_96:
	movlg	%fcc0,	%i0,	%o1
	fmovsne	%fcc1,	%f4,	%f17
	movg	%fcc0,	0x2CA,	%l3
	call	loop_97
	call	loop_98
	call	loop_99
	array32	%g5,	%i3,	%l4
loop_97:
	tne	%icc,	0x7
loop_98:
	call	loop_100
loop_99:
	tvc	%icc,	0x4
	fsrc1s	%f5,	%f8
	call	loop_101
loop_100:
	movlg	%fcc0,	0x03E,	%l2
	fornot1	%f28,	%f2,	%f12
	nop
	setx	0x188D,	%l0,	%i5
	udivx	%o5,	%i5,	%l6
loop_101:
	fnegd	%f18,	%f26
	fnands	%f4,	%f30,	%f30
	call	loop_102
	prefetch	[%l7 + 0x70],	 4
	nop
	fitos	%f22,	%f30
	movuge	%fcc1,	0x33B,	%g7
loop_102:
	rdpr	%wstate,	%o2
	set	0x2C, %o3
	ldswa	[%l7 + %o3] 0x0c,	%l1
	fmovsa	%xcc,	%f22,	%f12
	udiv	%g6,	0x18DA,	%g3
	call	loop_103
	bcc,pn	%xcc,	loop_104
	call	loop_105
	taddcctv	%i4,	%l5,	%o7
loop_103:
	bgu,pn	%icc,	loop_106
loop_104:
	tl	%icc,	0x2
loop_105:
	andcc	%o6,	0x07B3,	%i6
	tn	%icc,	0x3
loop_106:
	call	loop_107
	call	loop_108
	call	loop_109
	movge	%icc,	%i2,	%i1
loop_107:
	fnot2	%f10,	%f16
loop_108:
	call	loop_110
loop_109:
	nop
	setx	0x19F2,	%l0,	%o4
	sdiv	%g1,	%o4,	%o3
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_111
loop_110:
	call	loop_112
	call	loop_113
	tg	%xcc,	0x2
loop_111:
	pdist	%f6,	%f8,	%f28
loop_112:
	call	loop_114
loop_113:
	fmovsvc	%xcc,	%f28,	%f30
	fcmpeq32	%f14,	%f22,	%o0
	lduw	[%l7 + 0x38],	%g4
loop_114:
	call	loop_115
	fmovso	%fcc3,	%f19,	%f2
	call	loop_116
	fmovdule	%fcc0,	%f6,	%f0
loop_115:
	call	loop_117
	nop
	fitos	%f11,	%f14
	fstox	%f14,	%f10
loop_116:
	call	loop_118
	movn	%icc,	%l0,	%i0
loop_117:
	fbo,pn	%fcc0,	loop_119
	movcc	%icc,	%o1,	%l3
loop_118:
	rd	%pc,	%g5
	nop
	setx	0x38877333,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x0137A876,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f30,	%f2
loop_119:
	call	loop_120
	call	loop_121
	movu	%fcc0,	%i3,	%l2
	call	loop_122
loop_120:
	movu	%fcc3,	0x44B,	%l4
loop_121:
	fmovduge	%fcc1,	%f10,	%f2
	fbg,a	%fcc3,	loop_123
loop_122:
	subcc	%o5,	%l6,	%i5
	movcc	%xcc,	%g7,	%o2
	add	%g6,	%g3,	%l1
loop_123:
	call	loop_124
	call	loop_125
	sra	%l5,	0x00,	%i4
	call	loop_126
loop_124:
	call	loop_127
loop_125:
	call	loop_128
	call	loop_129
loop_126:
	movle	%icc,	0x7D9,	%o7
loop_127:
	fnot1	%f10,	%f16
loop_128:
	call	loop_130
loop_129:
	fmovdule	%fcc0,	%f30,	%f2
	fnot1	%f4,	%f14
	nop
	setx	0xFFCB4786722A9315,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3847DF03D6C829C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f20,	%f2
loop_130:
	fxnors	%f6,	%f18,	%f7
	membar	0x62
	srl	%i6,	0x0F,	%i2
	call	loop_131
	fcmps	%fcc1,	%f4,	%f8
	fabsd	%f22,	%f2
	movg	%xcc,	0x326,	%i1
loop_131:
	call	loop_132
	edge32l	%o6,	%g1,	%o4
	call	loop_133
	stx	%o3,	[%l7 + 0x08]
loop_132:
	fmovrse	%g2,	%f3,	%f25
	fmovsu	%fcc3,	%f0,	%f11
loop_133:
	andcc	%o0,	0x0CDD,	%g4
	fmovsuge	%fcc1,	%f25,	%f0
	fandnot1s	%f5,	%f26,	%f13
	call	loop_134
	call	loop_135
	fmovs	%f15,	%f25
	taddcc	%i7,	0x0E26,	%l0
loop_134:
	movvc	%icc,	0x2D3,	%o1
loop_135:
	call	loop_136
	fmovdug	%fcc2,	%f0,	%f30
	fandnot2	%f24,	%f28,	%f10
	fmovscs	%icc,	%f16,	%f26
loop_136:
	fmovscs	%icc,	%f10,	%f18
	fbug,pn	%fcc3,	loop_137
	call	loop_138
	wrpr	%i0,	0x1CBF,	%cwp
	call	loop_139
loop_137:
	for	%f30,	%f30,	%f4
loop_138:
	or	%l3,	0x00AC,	%g5
	nop
	setx	0x75FEED2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x50C7C618,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f2,	%f8
loop_139:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_140
	array16	%l4,	%l6,	%o5
	mova	%fcc2,	0x462,	%i5
	movg	%xcc,	%g7,	%g6
loop_140:
	call	loop_141
	call	loop_142
	fmovscc	%xcc,	%f26,	%f20
	fnands	%f25,	%f21,	%f27
loop_141:
	tcs	%icc,	0x2
loop_142:
	addccc	%o2,	%g3,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBCA, 	%tick_cmpr
	rdpr	%tl,	%o7
	fmovdo	%fcc3,	%f10,	%f18
	fmul8x16au	%f20,	%f20,	%f6
	addcc	%i6,	%i2,	%l1
	edge8ln	%i1,	%o6,	%o4
	movge	%fcc3,	0x2D0,	%o3
	movg	%fcc3,	0x7F0,	%g2
	fmovdne	%xcc,	%f22,	%f4
	orn	%g1,	0x16BA,	%g4
	edge8	%o0,	%l0,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EB, 	%hsys_tick_cmpr
	call	loop_143
	call	loop_144
	brgez,pt	%g5,	loop_145
	lduw	[%l7 + 0x0C],	%i0
loop_143:
	fors	%f30,	%f24,	%f29
loop_144:
	edge16n	%l2,	%i3,	%l6
loop_145:
	fmovrdgz	%l4,	%f6,	%f28
	movvc	%xcc,	%i5,	%g7
	fmul8x16al	%f16,	%f2,	%f8
	fnands	%f6,	%f0,	%f3
	call	loop_146
	call	loop_147
	call	loop_148
	fpsub32s	%f1,	%f0,	%f16
loop_146:
	xnorcc	%g6,	0x1E10,	%o5
loop_147:
	sll	%g3,	%o2,	%l5
loop_148:
	sra	%i4,	0x03,	%i6
	nop
	fitos	%f4,	%f14
	fstoi	%f14,	%f12
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc5
	call	loop_149
	call	loop_150
	call	loop_151
	fmovrde	%o7,	%f24,	%f2
loop_149:
	call	loop_152
loop_150:
	fbl	%fcc3,	loop_153
loop_151:
	movul	%fcc1,	%l1,	%i2
	movu	%fcc3,	0x61D,	%o6
loop_152:
	fnors	%f27,	%f24,	%f15
loop_153:
	bvc,a,pn	%icc,	loop_154
loop_154:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 26
!	Type a   	: 21
!	Type x   	: 8
!	Type cti   	: 154
!	Type f   	: 166
!	Type i   	: 125
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
	set	0x7,	%g2
	set	0xA,	%g3
	set	0x0,	%g4
	set	0xD,	%g5
	set	0xF,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x3,	%i1
	set	-0x0,	%i2
	set	-0xC,	%i3
	set	-0xB,	%i4
	set	-0xD,	%i5
	set	-0x2,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x52AC1F96,	%l0
	set	0x65EB68FB,	%l1
	set	0x1758E7F4,	%l2
	set	0x78F5657C,	%l3
	set	0x43E2198C,	%l4
	set	0x1ECEAC9D,	%l5
	set	0x6B228D24,	%l6
	!# Output registers
	set	0x0B06,	%o0
	set	-0x15FB,	%o1
	set	0x015B,	%o2
	set	0x04BA,	%o3
	set	0x1DE6,	%o4
	set	-0x0C56,	%o5
	set	-0x06E7,	%o6
	set	0x00F0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	fpsub32s	%f13,	%f12,	%f30
	nop
	setx	0xD78514998861B01C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5859DA3C3ADBE1F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f6,	%f20
	call	loop_155
	ldd	[%l7 + 0x08],	%i0
	sra	%o4,	0x04,	%g2
	movl	%icc,	0x3DE,	%g1
loop_155:
	fba,pt	%fcc2,	loop_156
	movg	%fcc1,	0x1B3,	%o3
	call	loop_157
	fcmple16	%f0,	%f2,	%g4
loop_156:
	movgu	%xcc,	0x684,	%o0
	edge8n	%i7,	%l0,	%o1
loop_157:
	wrpr	%l3,	%g5,	%cwp
	subc	%l2,	0x1CED,	%i0
	call	loop_158
	stw	%i3,	[%l7 + 0x74]
	call	loop_159
	edge8l	%l4,	%l6,	%g7
loop_158:
	movne	%xcc,	0x585,	%g6
	subccc	%i5,	%o5,	%g3
loop_159:
	bmask	%l5,	%i4,	%i6
	stb	%o7,	[%l7 + 0x0C]
	edge32n	%l1,	%i2,	%o2
	fbu,a	%fcc0,	loop_160
	nop
	setx	0x5B77EA4A72D90D49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	call	loop_161
	sdivcc	%o6,	0x16A1,	%i1
loop_160:
	fmovsl	%fcc0,	%f27,	%f15
	tsubcc	%o4,	%g2,	%o3
loop_161:
	call	loop_162
	fzeros	%f0
	fabss	%f19,	%f7
	call	loop_163
loop_162:
	array32	%g1,	%o0,	%g4
	call	loop_164
	call	loop_165
loop_163:
	call	loop_166
	call	loop_167
loop_164:
	wr	%i7,	0x092B,	%pic
loop_165:
	rdpr	%tl,	%o1
loop_166:
	fone	%f8
loop_167:
	fmovrdgez	%l0,	%f0,	%f6
	call	loop_168
	call	loop_169
	call	loop_170
	and	%g5,	0x065B,	%l3
loop_168:
	fmovse	%icc,	%f8,	%f6
loop_169:
	call	loop_171
loop_170:
	call	loop_172
	fmovrdne	%l2,	%f12,	%f24
	addcc	%i3,	0x0A7C,	%l4
loop_171:
	call	loop_173
loop_172:
	call	loop_174
	call	loop_175
	fmovdvs	%xcc,	%f12,	%f16
loop_173:
	fmovslg	%fcc3,	%f21,	%f18
loop_174:
	fmovdue	%fcc1,	%f20,	%f24
loop_175:
	tgu	%xcc,	0x3
	fcmpes	%fcc2,	%f27,	%f24
	wr	%g0,	0xd2,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f16
	fxtod	%f16,	%f16
	smulcc	%l6,	0x102A,	%g7
	fsrc2	%f26,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fcmpgt16	%f26,	%f6,	%i5
	movrne	%i0,	%o5,	%g3
	fbul,pn	%fcc0,	loop_176
	fbo,a	%fcc2,	loop_177
	call	loop_178
	srl	%i4,	0x19,	%i6
loop_176:
	call	loop_179
loop_177:
	edge32n	%o7,	%l5,	%l1
loop_178:
	fnegd	%f30,	%f20
	call	loop_180
loop_179:
	call	loop_181
	call	loop_182
	addcc	%i2,	0x052E,	%o6
loop_180:
	mulx	%i1,	0x0E79,	%o4
loop_181:
	call	loop_183
loop_182:
	tgu	%icc,	0x3
	fmovdue	%fcc3,	%f12,	%f30
	call	loop_184
loop_183:
	fbug,pn	%fcc0,	loop_185
	fmovsug	%fcc1,	%f28,	%f16
	call	loop_186
loop_184:
	tcs	%icc,	0x0
loop_185:
	orn	%g2,	0x14BF,	%o2
	faligndata	%f16,	%f20,	%f24
loop_186:
	fandnot1	%f0,	%f0,	%f24
	alignaddrl	%g1,	%o0,	%g4
	siam	0x2
	nop
	fitos	%f3,	%f1
	fstoi	%f1,	%f16
	fmul8x16au	%f10,	%f21,	%f0
	nop
	setx	0xBCC92290,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xF3A464E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f20,	%f16
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f9
	orn	%i7,	0x1303,	%o1
	fmovdug	%fcc2,	%f28,	%f2
	nop
	fitos	%f2,	%f6
	fstod	%f6,	%f2
	bleu	%icc,	loop_187
	bgu,pn	%xcc,	loop_188
	call	loop_189
	call	loop_190
loop_187:
	fpack16	%f16,	%f29
loop_188:
	srax	%l0,	0x0C,	%g5
loop_189:
	call	loop_191
loop_190:
	movleu	%xcc,	0x779,	%l3
	smulcc	%o3,	%i3,	%l2
	call	loop_192
loop_191:
	nop
	setx	0xA5F4D82,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	call	loop_193
	call	loop_194
loop_192:
	call	loop_195
	call	loop_196
loop_193:
	movule	%fcc2,	0x5C0,	%l6
loop_194:
	call	loop_197
loop_195:
	call	loop_198
loop_196:
	movg	%fcc1,	0x6AD,	%l4
	bn,pt	%icc,	loop_199
loop_197:
	array16	%g7,	%i5,	%i0
loop_198:
	wr	%g6,	%g3,	%clear_softint
	wrpr	%i4,	0x0237,	%tick
loop_199:
	call	loop_200
	call	loop_201
	fmovsvc	%xcc,	%f22,	%f30
	call	loop_202
loop_200:
	fblg,pt	%fcc3,	loop_203
loop_201:
	nop
	set	0x65, %o1
	stb	%i6,	[%l7 + %o1]
	alignaddrl	%o5,	%l5,	%o7
loop_202:
	fmovsule	%fcc2,	%f21,	%f20
loop_203:
	call	loop_204
	fmovdgu	%xcc,	%f8,	%f4
	pdist	%f6,	%f0,	%f4
	movl	%xcc,	0x635,	%l1
loop_204:
	add	%i2,	%o6,	%o4
	fsrc1	%f16,	%f0
	edge8ln	%i1,	%o2,	%g2
	fmovsul	%fcc3,	%f24,	%f4
	call	loop_205
	movle	%fcc3,	%g1,	%g4
	call	loop_206
	nop
	set	0x40, %l1
	std	%f12,	[%l7 + %l1]
loop_205:
	fcmpne16	%f2,	%f24,	%o0
	rdhpr	%hsys_tick_cmpr,	%o1
loop_206:
	call	loop_207
	udivx	%i7,	0x1B85,	%l0
	call	loop_208
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f22
loop_207:
	bmask	%l3,	%g5,	%i3
	call	loop_209
loop_208:
	nop
	fitos	%f0,	%f9
	fstoi	%f9,	%f7
	call	loop_210
	sllx	%l2,	%l6,	%l4
loop_209:
	fxor	%f0,	%f12,	%f12
	umul	%o3,	0x176F,	%g7
loop_210:
	fnands	%f8,	%f13,	%f14
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f20
	fmovdpos	%xcc,	%f12,	%f6
	fcmpeq16	%f26,	%f20,	%i0
	siam	0x4
	fmuld8ulx16	%f12,	%f1,	%f4
	call	loop_211
	call	loop_212
	fmovsl	%xcc,	%f12,	%f20
	movg	%xcc,	0x5B6,	%i5
loop_211:
	call	loop_213
loop_212:
	fmovdgu	%xcc,	%f28,	%f28
	fcmpeq32	%f8,	%f18,	%g3
	call	loop_214
loop_213:
	rd	%ccr,	%i4
	rdpr	%pil,	%i6
	xorcc	%g6,	0x0409,	%o5
loop_214:
	movvc	%xcc,	0x6CB,	%o7
	srlx	%l5,	0x1C,	%i2
	bge,a	%icc,	loop_215
	tge	%xcc,	0x5
	call	loop_216
	fpadd16s	%f19,	%f19,	%f26
loop_215:
	call	loop_217
	call	loop_218
loop_216:
	call	loop_219
	fbo,a,pt	%fcc1,	loop_220
loop_217:
	call	loop_221
loop_218:
	alignaddr	%l1,	%o4,	%o6
loop_219:
	movvc	%icc,	0x722,	%i1
loop_220:
	fmovsul	%fcc3,	%f22,	%f15
loop_221:
	fabss	%f25,	%f12
	brlez,pn	%g2,	loop_222
	stw	%o2,	[%l7 + 0x1C]
	fornot1	%f8,	%f0,	%f16
	fmovsne	%icc,	%f23,	%f10
loop_222:
	call	loop_223
	movle	%fcc2,	0x340,	%g4
	movgu	%icc,	%o0,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_223:
	call	loop_224
	fbn,a,pt	%fcc3,	loop_225
	movge	%xcc,	0x1A3,	%l0
	membar	0x4A
loop_224:
	call	loop_226
loop_225:
	call	loop_227
	add	%l3,	%g1,	%g5
	set	0x6B, %l3
	stba	%l2,	[%l7 + %l3] 0x11
loop_226:
	movg	%fcc3,	%l6,	%l4
loop_227:
	nop
	setx	loop_228,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004100001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movug	%fcc2,	%o3,	%g7
	xorcc	%i0,	%i3,	%i5
	nop
	fitod	%f10,	%f28
	fdtox	%f28,	%f12
loop_228:
	nop
	setx	0xAB2B82BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x22C27558,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f3,	%f26
	array16	%i4,	%g3,	%i6
	call	loop_229
	fmovduge	%fcc2,	%f30,	%f30
	fcmps	%fcc1,	%f26,	%f1
	fbu,a	%fcc3,	loop_230
loop_229:
	sllx	%g6,	%o5,	%l5
	movre	%o7,	0x3AF,	%l1
	call	loop_231
loop_230:
	edge8n	%o4,	%i2,	%i1
	fmovrsne	%o6,	%f28,	%f2
	call	loop_232
loop_231:
	popc	0x1891,	%g2
	call	loop_233
	sra	%o2,	%o0,	%o1
loop_232:
	srlx	%i7,	0x06,	%l0
	movle	%icc,	0x522,	%g4
loop_233:
	call	loop_234
	fmul8x16	%f30,	%f26,	%f4
	call	loop_235
	fandnot1s	%f19,	%f2,	%f3
loop_234:
	nop
	setx	0xB3D31E31,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xE2C0B9A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f14,	%f0
	fornot2s	%f22,	%f4,	%f15
loop_235:
	fmovdo	%fcc0,	%f6,	%f2
	movg	%xcc,	%l3,	%g5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrdlez	%g1,	%f28,	%f28
	call	loop_236
	call	loop_237
	call	loop_238
	fpsub32	%f28,	%f8,	%f28
loop_236:
	call	loop_239
loop_237:
	movle	%fcc2,	%l2,	%l6
loop_238:
	call	loop_240
	and	%o3,	0x040C,	%g7
loop_239:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_241
loop_240:
	te	%icc,	0x0
	fmul8sux16	%f24,	%f6,	%f18
	call	loop_242
loop_241:
	call	loop_243
	fbul	%fcc1,	loop_244
	fmovsvs	%xcc,	%f12,	%f6
loop_242:
	edge8l	%i3,	%l4,	%i5
loop_243:
	movgu	%icc,	%g3,	%i4
loop_244:
	umulcc	%i6,	0x0905,	%g6
	call	loop_245
	swap	[%l7 + 0x70],	%l5
	bmask	%o7,	%l1,	%o4
	call	loop_246
loop_245:
	nop
	setx	0x7ECAF30C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x3BE9E3D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f27,	%f18
	movrgez	%i2,	%o5,	%i1
	fmovrdgez	%o6,	%f28,	%f2
loop_246:
	edge8ln	%g2,	%o0,	%o1
	call	loop_247
	fnegs	%f31,	%f30
	call	loop_248
	call	loop_249
loop_247:
	call	loop_250
	edge8ln	%o2,	%l0,	%i7
loop_248:
	addccc	%l3,	%g5,	%g4
loop_249:
	wrpr	%l2,	0x0130,	%pil
loop_250:
	movule	%fcc1,	0x46E,	%l6
	fbue	%fcc1,	loop_251
	fblg,a	%fcc2,	loop_252
	fpackfix	%f18,	%f8
	call	loop_253
loop_251:
	call	loop_254
loop_252:
	siam	0x0
	siam	0x1
loop_253:
	call	loop_255
loop_254:
	fnand	%f30,	%f22,	%f4
	call	loop_256
	edge8n	%o3,	%g7,	%i0
loop_255:
	array16	%g1,	%i3,	%i5
	rdpr	%tba,	%l4
loop_256:
	nop
	set	0x60, %i4
	stda	%i4,	[%l7 + %i4] 0x2a
	membar	#Sync
	fmovsleu	%xcc,	%f26,	%f23
	faligndata	%f12,	%f4,	%f0
	fnand	%f26,	%f24,	%f0
	fmovslg	%fcc1,	%f22,	%f1
	fsrc2	%f8,	%f18
	movrne	%g3,	%i6,	%g6
	brgez	%l5,	loop_257
	fpadd32s	%f2,	%f14,	%f8
	ble,pt	%icc,	loop_258
	fcmpd	%fcc2,	%f16,	%f30
loop_257:
	te	%icc,	0x4
	sllx	%o7,	%l1,	%i2
loop_258:
	call	loop_259
	nop
	setx	0x8F8CC231,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x5DF8916B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f26,	%f2
	movpos	%xcc,	%o5,	%o4
	fmovslg	%fcc0,	%f21,	%f24
loop_259:
	call	loop_260
	tsubcctv	%i1,	0x00AA,	%g2
	fmovdge	%xcc,	%f22,	%f16
	fandnot1	%f10,	%f20,	%f14
loop_260:
	subcc	%o6,	0x1CFF,	%o0
	edge8ln	%o2,	%o1,	%l0
	rdhpr	%hsys_tick_cmpr,	%l3
	fpsub32	%f2,	%f30,	%f28
	call	loop_261
	mulscc	%g5,	%g4,	%l2
	bge	%xcc,	loop_262
	orcc	%l6,	0x0213,	%o3
loop_261:
	rd	%y,	%i7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x45] %asi,	%g7
loop_262:
	movul	%fcc1,	0x4B9,	%i0
	movg	%fcc3,	%i3,	%g1
	addc	%i5,	%l4,	%i4
	sethi	0x1455,	%i6
	fones	%f17
	fnegd	%f18,	%f10
	fmovsn	%fcc1,	%f31,	%f8
	call	loop_263
	call	loop_264
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_265
loop_263:
	fmul8x16	%f26,	%f14,	%f12
loop_264:
	fmovdneg	%icc,	%f30,	%f16
	fcmple16	%f24,	%f18,	%g6
loop_265:
	call	loop_266
	fcmpne32	%f8,	%f22,	%g3
	call	loop_267
	movcc	%icc,	%o7,	%l1
loop_266:
	edge16l	%i2,	%l5,	%o5
	set	0x65, %g5
	ldstuba	[%l7 + %g5] 0x0c,	%o4
loop_267:
	fcmpne32	%f6,	%f2,	%i1
	fmovsneg	%icc,	%f31,	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movneg	%icc,	0x149,	%o2
	array16	%o1,	%o0,	%l0
	nop
	setx	0xF705BDC9600E1CB4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3CF447BE3E4E5C9D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f22,	%f16
	subc	%l3,	%g4,	%g5
	fornot1s	%f27,	%f22,	%f14
	fmovrdlez	%l2,	%f10,	%f14
	fzero	%f20
	fcmpeq32	%f22,	%f8,	%o3
	rd	%fprs,	%l6
	fnegs	%f28,	%f14
	fmovsge	%fcc1,	%f5,	%f7
	call	loop_268
	edge8l	%i7,	%g7,	%i0
	tpos	%icc,	0x6
	tpos	%xcc,	0x1
loop_268:
	call	loop_269
	fcmple16	%f14,	%f4,	%i3
	call	loop_270
	rdhpr	%htba,	%g1
loop_269:
	nop
	setx	0xDE5D6273393F02C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDBFC1B159062EC49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f14,	%f2
	tg	%xcc,	0x5
loop_270:
	ta	%xcc,	0x2
	call	loop_271
	call	loop_272
	fmovrdgz	%i5,	%f16,	%f12
	fnegs	%f26,	%f24
loop_271:
	call	loop_273
loop_272:
	or	%l4,	%i4,	%g6
	call	loop_274
	pdist	%f28,	%f8,	%f16
loop_273:
	movlg	%fcc0,	0x2FF,	%g3
	fcmpgt32	%f2,	%f30,	%o7
loop_274:
	smul	%l1,	%i2,	%l5
	call	loop_275
	call	loop_276
	fpackfix	%f16,	%f4
	call	loop_277
loop_275:
	call	loop_278
loop_276:
	nop
	fitos	%f13,	%f10
	fstod	%f10,	%f16
	ldub	[%l7 + 0x7E],	%o5
loop_277:
	call	loop_279
loop_278:
	tsubcctv	%i6,	%i1,	%o4
	brlez	%g2,	loop_280
	fmovsge	%fcc0,	%f25,	%f26
loop_279:
	nop
	fitod	%f22,	%f24
	call	loop_281
loop_280:
	orn	%o6,	%o2,	%o0
	call	loop_282
	fmovsgu	%xcc,	%f25,	%f12
loop_281:
	stw	%o1,	[%l7 + 0x58]
	fabss	%f0,	%f30
loop_282:
	fbug,a,pt	%fcc1,	loop_283
	call	loop_284
	fandnot2	%f2,	%f12,	%f20
	fmovrslz	%l3,	%f28,	%f24
loop_283:
	bl	%icc,	loop_285
loop_284:
	fnot1	%f30,	%f8
	fpadd16s	%f15,	%f17,	%f2
	nop
	fitod	%f12,	%f8
	fdtos	%f8,	%f16
loop_285:
	wrpr 	%g0, 	0x0, 	%gl
	fpadd16	%f24,	%f28,	%f28
	fnands	%f25,	%f28,	%f16
	fmovrse	%l0,	%f7,	%f8
	fnegs	%f31,	%f1
	call	loop_286
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	nop
	setx	0x008E,	%l0,	%o3
	udivx	%g5,	%o3,	%l2
	fmul8x16	%f10,	%f14,	%f20
loop_286:
	call	loop_287
	fnot2s	%f26,	%f24
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%i7
	call	loop_288
loop_287:
	rdpr	%gl,	%l6
	nop
	setx	0x23D56D77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f18
	call	loop_289
loop_288:
	brgz,pt	%i0,	loop_290
	andn	%g7,	%i3,	%i5
	call	loop_291
loop_289:
	call	loop_292
loop_290:
	mulscc	%g1,	0x1B9E,	%i4
	srlx	%l4,	0x14,	%g6
loop_291:
	call	loop_293
loop_292:
	fmovdcs	%icc,	%f22,	%f28
	call	loop_294
	call	loop_295
loop_293:
	call	loop_296
	fmovdue	%fcc0,	%f22,	%f22
loop_294:
	call	loop_297
loop_295:
	call	loop_298
loop_296:
	tcs	%icc,	0x5
	fcmpne16	%f16,	%f16,	%o7
loop_297:
	fones	%f2
loop_298:
	fcmps	%fcc3,	%f24,	%f15
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%g2
	call	loop_299
	fornot1	%f14,	%f30,	%f28
	fmovsgu	%icc,	%f28,	%f10
	tcc	%xcc,	0x6
loop_299:
	call	loop_300
	call	loop_301
	call	loop_302
	addcc	%l1,	%i2,	%o5
loop_300:
	pdist	%f18,	%f8,	%f2
loop_301:
	nop
	set	0x30, %l4
	stxa	%i6,	[%l7 + %l4] 0x19
loop_302:
	call	loop_303
	fmovsl	%fcc0,	%f0,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%asi,	%i1
loop_303:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fand	%f28,	%f20,	%f0
	wrpr	%o2,	0x0939,	%cwp
	movrne	%o1,	%l3,	%g4
	ldsw	[%l7 + 0x74],	%l0
	wr	%g5,	0x05F8,	%clear_softint
	movrlez	%o0,	%l2,	%i7
	te	%icc,	0x7
	tvc	%icc,	0x4
	fmovsvs	%icc,	%f13,	%f24
	fmovsg	%fcc2,	%f24,	%f6
	brgez,a,pt	%o3,	loop_304
	call	loop_305
	fpack16	%f14,	%f26
	call	loop_306
loop_304:
	call	loop_307
loop_305:
	mulx	%i0,	0x089D,	%g7
	movl	%xcc,	0x1F0,	%i3
loop_306:
	movug	%fcc3,	0x0D8,	%l6
loop_307:
	call	loop_308
	tpos	%icc,	0x5
	addcc	%i5,	%i4,	%l4
	call	loop_309
loop_308:
	fmovdvc	%xcc,	%f18,	%f28
	call	loop_310
	tge	%xcc,	0x0
loop_309:
	rdpr	%cwp,	%g1
	fbuge,a	%fcc2,	loop_311
loop_310:
	siam	0x4
	fcmple32	%f0,	%f26,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x66B, 	%hsys_tick_cmpr
loop_311:
	call	loop_312
	call	loop_313
	fsrc1s	%f5,	%f7
	fxor	%f28,	%f12,	%f12
loop_312:
	srax	%i2,	%o5,	%o7
loop_313:
	call	loop_314
	rdpr	%cwp,	%l5
	nop
	setx	0xB1FEF064,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xE978A7D7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f25,	%f0
	fmovd	%f10,	%f22
loop_314:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE72, 	%sys_tick_cmpr
	alignaddr	%i1,	%o4,	%g2
	fcmpne32	%f0,	%f4,	%o2
	fmovsuge	%fcc3,	%f21,	%f12
	mulx	%o1,	%o6,	%g4
	call	loop_315
	pdist	%f8,	%f26,	%f10
	call	loop_316
loop_315:
	nop

loop_316:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 22
!	Type a   	: 29
!	Type x   	: 7
!	Type cti   	: 162
!	Type f   	: 149
!	Type i   	: 131
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
	set	0x9,	%g1
	set	0x3,	%g2
	set	0xC,	%g3
	set	0x1,	%g4
	set	0x8,	%g5
	set	0x2,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xA,	%i1
	set	-0x0,	%i2
	set	-0x3,	%i3
	set	-0x2,	%i4
	set	-0xD,	%i5
	set	-0xB,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x75650203,	%l0
	set	0x79E8CC16,	%l1
	set	0x6E28CB44,	%l2
	set	0x2564B35C,	%l3
	set	0x7D3AA056,	%l4
	set	0x0245E30D,	%l5
	set	0x01042250,	%l6
	!# Output registers
	set	0x10F7,	%o0
	set	-0x1FDB,	%o1
	set	-0x0300,	%o2
	set	0x0902,	%o3
	set	-0x02DE,	%o4
	set	0x0B17,	%o5
	set	0x0777,	%o6
	set	0x0248,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	tne	%xcc,	0x5
	call	loop_317
	call	loop_318
	call	loop_319
	call	loop_320
loop_317:
	fsrc2s	%f3,	%f21
loop_318:
	movug	%fcc2,	0x75C,	%g5
loop_319:
	tge	%icc,	0x5
loop_320:
	fmovsneg	%xcc,	%f25,	%f5
	set	0x40, %o0
	stxa	%l3,	[%l7 + %o0] 0x23
	membar	#Sync
	call	loop_321
	call	loop_322
	nop
	fitos	%f7,	%f10
	fstox	%f10,	%f18
	fmovde	%fcc3,	%f2,	%f14
loop_321:
	call	loop_323
loop_322:
	fmovsle	%fcc2,	%f11,	%f5
	tg	%xcc,	0x4
	move	%icc,	0x1D1,	%l2
loop_323:
	sth	%i7,	[%l7 + 0x14]
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x89,	%o0
	movpos	%icc,	%i0,	%g7
	call	loop_324
	fbge,pn	%fcc0,	loop_325
	addcc	%o3,	0x0D82,	%i3
	movu	%fcc2,	%l6,	%i4
loop_324:
	sethi	0x1D48,	%i5
loop_325:
	call	loop_326
	call	loop_327
	or	%g1,	%g6,	%l4
	fcmpne16	%f10,	%f26,	%l1
loop_326:
	tpos	%icc,	0x2
loop_327:
	fcmps	%fcc1,	%f30,	%f4
	fnot2	%f22,	%f20
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i2
	fnegd	%f6,	%f8
	movug	%fcc2,	0x5D2,	%o5
	nop
	set	0x54, %o2
	stw	%g3,	[%l7 + %o2]
	pdist	%f28,	%f16,	%f28
	rdhpr	%hpstate,	%l5
	movule	%fcc0,	%i6,	%i1
	fpmerge	%f29,	%f21,	%f12
	call	loop_328
	fornot1	%f6,	%f22,	%f24
	call	loop_329
	flushw
loop_328:
	fcmped	%fcc3,	%f30,	%f22
	edge16ln	%o7,	%g2,	%o4
loop_329:
	call	loop_330
	movne	%fcc1,	0x677,	%o2
	nop
	fitod	%f10,	%f14
	fdtos	%f14,	%f23
	fmovdlg	%fcc1,	%f0,	%f10
loop_330:
	tvs	%xcc,	0x0
	movrgz	%o1,	0x2E1,	%o6
	call	loop_331
	wrpr	%l0,	0x120A,	%tick
	fzeros	%f7
	edge32	%g4,	%l3,	%l2
loop_331:
	sdiv	%g5,	0x0C8F,	%o0
	fpsub32s	%f30,	%f2,	%f2
	call	loop_332
	rdpr	%cleanwin,	%i7
	orn	%g7,	0x059A,	%i0
	rdhpr	%hintp,	%i3
loop_332:
	call	loop_333
	subccc	%l6,	0x084E,	%i4
	fpack32	%f10,	%f12,	%f22
	call	loop_334
loop_333:
	nop
	setx	0x7D968829,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x9521CD3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f22,	%f1
	set	0x4C, %i6
	sta	%f9,	[%l7 + %i6] 0x80
loop_334:
	fnot1	%f26,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC5B, 	%hsys_tick_cmpr
	fmovsle	%icc,	%f12,	%f14
	add	%g6,	0x093D,	%l4
	fmovrde	%g1,	%f22,	%f28
	fsrc1	%f2,	%f18
	fnegd	%f0,	%f0
	fpackfix	%f24,	%f21
	call	loop_335
	call	loop_336
	call	loop_337
	call	loop_338
loop_335:
	call	loop_339
loop_336:
	call	loop_340
loop_337:
	sllx	%i2,	0x02,	%o5
loop_338:
	fmovsneg	%xcc,	%f24,	%f9
loop_339:
	ld	[%l7 + 0x64],	%f12
loop_340:
	fpsub16	%f26,	%f24,	%f0
	fabss	%f24,	%f27
	edge16	%g3,	%l5,	%l1
	fmul8ulx16	%f20,	%f30,	%f24
	set	0x70, %l2
	stxa	%i1,	[%l7 + %l2] 0x27
	membar	#Sync
	call	loop_341
	call	loop_342
	fmovsne	%icc,	%f25,	%f25
	fmovdvc	%xcc,	%f4,	%f24
loop_341:
	sllx	%o7,	%g2,	%o4
loop_342:
	fandnot2s	%f5,	%f15,	%f11
	ld	[%l7 + 0x6C],	%f18
	and	%i6,	%o1,	%o2
	call	loop_343
	edge16	%o6,	%l0,	%g4
	call	loop_344
	tvc	%icc,	0x2
loop_343:
	rdhpr	%htba,	%l2
	movug	%fcc0,	0x1B9,	%l3
loop_344:
	call	loop_345
	call	loop_346
	movrlez	%g5,	0x046,	%i7
	fzero	%f22
loop_345:
	bg,pt	%xcc,	loop_347
loop_346:
	fmovdle	%fcc2,	%f6,	%f8
	tcc	%xcc,	0x1
	tsubcc	%o0,	%g7,	%i0
loop_347:
	nop
	setx	0x2F04B91E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x41C1CD65,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f27,	%f23
	fmovrdgz	%l6,	%f30,	%f10
	rd	%asi,	%i3
	fmovsvc	%icc,	%f27,	%f21
	call	loop_348
	fornot1	%f6,	%f6,	%f6
	nop
	setx	0xCFA3A1F903A21D57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x251A175B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f20,	%f8
	call	loop_349
loop_348:
	fmovdl	%fcc3,	%f10,	%f12
	fmovsule	%fcc2,	%f29,	%f24
	fmovrslez	%i4,	%f21,	%f27
loop_349:
	brgez,pt	%o3,	loop_350
	bg,pt	%icc,	loop_351
	call	loop_352
	wrpr	%g6,	%i5,	%cwp
loop_350:
	rdpr	%cleanwin,	%g1
loop_351:
	call	loop_353
loop_352:
	fmovsvc	%icc,	%f29,	%f2
	fcmps	%fcc2,	%f7,	%f15
	tle	%xcc,	0x5
loop_353:
	taddcctv	%l4,	%o5,	%g3
	fmovdu	%fcc2,	%f16,	%f28
	wr	%g0,	0x04,	%asi
	stxa	%i2,	[%l7 + 0x40] %asi
	brgez,pt	%l5,	loop_354
	fpsub16s	%f1,	%f17,	%f15
	bgu	%icc,	loop_355
	call	loop_356
loop_354:
	bvs,a	%icc,	loop_357
	fbuge,a,pt	%fcc1,	loop_358
loop_355:
	xnor	%i1,	0x0C1D,	%o7
loop_356:
	fmovspos	%icc,	%f2,	%f11
loop_357:
	call	loop_359
loop_358:
	call	loop_360
	edge16n	%g2,	%o4,	%l1
	fbl,a,pt	%fcc2,	loop_361
loop_359:
	call	loop_362
loop_360:
	rdhpr	%ver,	%o1
	fmovsvc	%icc,	%f0,	%f31
loop_361:
	andn	%o2,	0x102A,	%i6
loop_362:
	call	loop_363
	smulcc	%l0,	%o6,	%l2
	movrgez	%l3,	%g5,	%i7
	ldd	[%l7 + 0x68],	%g4
loop_363:
	call	loop_364
	tvs	%icc,	0x1
	nop
	set	0x70, %g1
	std	%g6,	[%l7 + %g1]
	fnegs	%f23,	%f1
loop_364:
	sub	%i0,	0x0E22,	%l6
	fones	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x81B, 	%hsys_tick_cmpr
	movul	%fcc0,	0x02B,	%i4
	fcmpgt32	%f14,	%f30,	%o3
	set	0x74, %g7
	ldswa	[%l7 + %g7] 0x19,	%i5
	nop
	fitos	%f16,	%f8
	nop
	setx	0x96318048,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x11906268,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f28,	%f5
	fmovsvs	%icc,	%f24,	%f31
	fmovslg	%fcc1,	%f25,	%f12
	movle	%icc,	%g1,	%l4
	mova	%icc,	%g6,	%o5
	movgu	%icc,	%i2,	%l5
	fpack32	%f22,	%f6,	%f10
	call	loop_365
	call	loop_366
	call	loop_367
	fmovrslez	%g3,	%f20,	%f25
loop_365:
	call	loop_368
loop_366:
	tleu	%xcc,	0x4
loop_367:
	call	loop_369
	rd	%asi,	%o7
loop_368:
	fmovdule	%fcc3,	%f30,	%f6
	fsrc1	%f26,	%f20
loop_369:
	smulcc	%g2,	0x135B,	%i1
	call	loop_370
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f2
	tneg	%icc,	0x4
	call	loop_371
loop_370:
	fexpand	%f27,	%f22
	umulcc	%l1,	%o1,	%o2
	fmovsule	%fcc1,	%f12,	%f14
loop_371:
	call	loop_372
	call	loop_373
	fcmpeq16	%f26,	%f30,	%o4
	call	loop_374
loop_372:
	call	loop_375
loop_373:
	sub	%l0,	0x1137,	%o6
	tvs	%xcc,	0x2
loop_374:
	call	loop_376
loop_375:
	fmovdgu	%xcc,	%f16,	%f24
	tsubcc	%l2,	0x0DA7,	%i6
	nop
	setx	0x0DBA,	%l0,	%g5
	sdiv	%l3,	%g5,	%g4
loop_376:
	call	loop_377
	call	loop_378
	srl	%g7,	%i0,	%i7
	add	%l6,	%o0,	%i4
loop_377:
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f28
loop_378:
	call	loop_379
	fmovsl	%xcc,	%f6,	%f23
	call	loop_380
	wr	%i3,	0x185D,	%clear_softint
loop_379:
	nop
	setx	0x3430F246063A1190,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0957CE39639EF14C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f2,	%f28
	addcc	%o3,	0x0286,	%g1
loop_380:
	nop
	setx	0x8EC72066,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x1E137351,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f5,	%f25
	movu	%fcc0,	%i5,	%g6
	call	loop_381
	subc	%o5,	%l4,	%l5
	bn	%icc,	loop_382
	fbul	%fcc3,	loop_383
loop_381:
	fnors	%f6,	%f1,	%f14
	call	loop_384
loop_382:
	call	loop_385
loop_383:
	sll	%g3,	0x1C,	%i2
	fmovsl	%icc,	%f23,	%f31
loop_384:
	movrlez	%g2,	%o7,	%l1
loop_385:
	fzeros	%f3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdpos	%icc,	%f14,	%f26
	fmovdu	%fcc3,	%f30,	%f26
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_386
	call	loop_387
	tcs	%xcc,	0x4
	fmovdue	%fcc2,	%f20,	%f12
loop_386:
	fornot2s	%f5,	%f25,	%f6
loop_387:
	fmovspos	%xcc,	%f13,	%f18
	fxnor	%f2,	%f10,	%f20
	edge32l	%i1,	%o4,	%l0
	faligndata	%f30,	%f28,	%f28
	call	loop_388
	rdhpr	%htba,	%l2
	fmovrdgz	%o6,	%f24,	%f20
	call	loop_389
loop_388:
	fmovsule	%fcc2,	%f26,	%f23
	call	loop_390
	fba,a,pt	%fcc3,	loop_391
loop_389:
	nop
	setx	0x1867,	%l0,	%l3
	sdivx	%i6,	%l3,	%g4
	bne	%xcc,	loop_392
loop_390:
	call	loop_393
loop_391:
	fsrc1s	%f2,	%f17
	movle	%xcc,	0x4CF,	%g7
loop_392:
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f31
loop_393:
	fcmpd	%fcc3,	%f30,	%f2
	fmovdvs	%icc,	%f12,	%f24
	tl	%icc,	0x0
	call	loop_394
	sir	0x0C47
	subc	%i0,	0x0D1B,	%g5
	fmovdu	%fcc3,	%f12,	%f12
loop_394:
	fmovsue	%fcc0,	%f27,	%f28
	bshuffle	%f26,	%f6,	%f26
	rdpr	%tl,	%l6
	taddcctv	%o0,	0x0485,	%i4
	call	loop_395
	call	loop_396
	fmovscc	%icc,	%f22,	%f4
	fmovdle	%icc,	%f18,	%f10
loop_395:
	wr	%i3,	0x058C,	%set_softint
loop_396:
	fmovrdne	%o3,	%f4,	%f18
	fbge,pn	%fcc1,	loop_397
	call	loop_398
	nop
	set	0x24, %g6
	flush	%l7 + %g6
	popc	0x10AD,	%g1
loop_397:
	call	loop_399
loop_398:
	nop
	setx	loop_400,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032100001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fone	%f16
	fmovsg	%fcc2,	%f21,	%f18
loop_399:
	fzeros	%f3
loop_400:
	tne	%icc,	0x0
	edge32	%i7,	%i5,	%g6
	fcmpeq32	%f30,	%f4,	%o5
	ldsb	[%l7 + 0x1E],	%l5
	call	loop_401
	tgu	%xcc,	0x5
	add	%l4,	0x0A81,	%g3
	rdhpr	%hpstate,	%i2
loop_401:
	movo	%fcc0,	%o7,	%l1
	sdivx	%g2,	0x0BE1,	%o1
	fcmpgt32	%f6,	%f30,	%o2
	call	loop_402
	edge32ln	%o4,	%i1,	%l0
	fcmpne32	%f16,	%f8,	%l2
	fble,pt	%fcc3,	loop_403
loop_402:
	movvc	%icc,	%o6,	%l3
	add	%i6,	%g4,	%i0
	edge8n	%g7,	%g5,	%l6
loop_403:
	fabsd	%f2,	%f12
	call	loop_404
	flushw
	fnands	%f4,	%f1,	%f18
	call	loop_405
loop_404:
	fandnot2	%f26,	%f30,	%f24
	sdivx	%o0,	0x08C9,	%i3
	fxors	%f22,	%f12,	%f16
loop_405:
	fmovsn	%fcc3,	%f27,	%f15
	or	%o3,	%g1,	%i4
	fblg,a,pt	%fcc3,	loop_406
	orcc	%i5,	%g6,	%o5
	edge32ln	%l5,	%i7,	%l4
	call	loop_407
loop_406:
	call	loop_408
	rd	%asi,	%i2
	bleu,a,pt	%icc,	loop_409
loop_407:
	call	loop_410
loop_408:
	ld	[%l7 + 0x54],	%f13
	fmovrdlez	%o7,	%f28,	%f2
loop_409:
	fmovdcc	%xcc,	%f14,	%f28
loop_410:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrsne	%o1,	%f1,	%f31
	fsrc2	%f0,	%f6
	call	loop_411
	rdpr	%canrestore,	%o2
	set	0x4C, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g3
loop_411:
	fbuge	%fcc3,	loop_412
	tgu	%xcc,	0x7
	fsrc2s	%f27,	%f7
	bgu	%icc,	loop_413
loop_412:
	faligndata	%f30,	%f26,	%f18
	edge16n	%o4,	%i1,	%l2
	call	loop_414
loop_413:
	tcc	%icc,	0x6
	xnorcc	%o6,	0x12C8,	%l0
	call	loop_415
loop_414:
	call	loop_416
	rdpr	%pil,	%l3
	movneg	%icc,	0x246,	%i6
loop_415:
	subccc	%i0,	%g7,	%g5
loop_416:
	wrpr	%l6,	0x1616,	%tick
	move	%xcc,	0x36E,	%g4
	movug	%fcc0,	0x51B,	%i3
	call	loop_417
	move	%fcc1,	%o3,	%o0
	call	loop_418
	call	loop_419
loop_417:
	srl	%g1,	%i4,	%i5
	fxnor	%f16,	%f18,	%f26
loop_418:
	fornot2s	%f13,	%f31,	%f14
loop_419:
	srlx	%o5,	0x1A,	%g6
	tn	%icc,	0x0
	movlg	%fcc0,	%i7,	%l5
	fmovscc	%xcc,	%f19,	%f0
	fmovsleu	%xcc,	%f17,	%f29
	rdpr	%cwp,	%i2
	call	loop_420
	call	loop_421
	rd	%softint,	%o7
	fmovsule	%fcc1,	%f17,	%f15
loop_420:
	fmovsleu	%xcc,	%f6,	%f0
loop_421:
	rd	%sys_tick_cmpr,	%l4
	call	loop_422
	fmovdu	%fcc0,	%f30,	%f30
	nop
	fitod	%f8,	%f28
	fdtos	%f28,	%f13
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l1,	%g2
loop_422:
	fsrc1	%f30,	%f16
	sub	%o2,	0x0F78,	%o1
	call	loop_423
	rdpr	%cwp,	%o4
	ta	%icc,	0x5
	set	0x64, %g4
	ldswa	[%l7 + %g4] 0x04,	%g3
loop_423:
	call	loop_424
	fbe	%fcc2,	loop_425
	wr	%i1,	0x08CE,	%y
	call	loop_426
loop_424:
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%l2
loop_425:
	edge8l	%l0,	%l3,	%o6
	movre	%i6,	0x335,	%g7
loop_426:
	movgu	%icc,	0x221,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_427
	fmovsneg	%icc,	%f23,	%f4
	rd	%sys_tick_cmpr,	%g5
	fmovrdgez	%i3,	%f24,	%f26
loop_427:
	sir	0x04A6
	fmovd	%f24,	%f2
	fmovdu	%fcc2,	%f20,	%f16
	fmovdne	%fcc0,	%f26,	%f26
	movcs	%icc,	%o3,	%o0
	call	loop_428
	fmovsul	%fcc3,	%f8,	%f28
	call	loop_429
	sethi	0x17AA,	%i4
loop_428:
	call	loop_430
	fmovduge	%fcc1,	%f30,	%f22
loop_429:
	call	loop_431
	xnorcc	%g1,	%o5,	%g6
loop_430:
	call	loop_432
	subc	%i7,	%i5,	%i2
loop_431:
	sub	%o7,	0x0EA8,	%l4
	nop
	set	0x08, %i5
	stx	%l5,	[%l7 + %i5]
loop_432:
	fmovslg	%fcc3,	%f20,	%f1
	call	loop_433
	fbu,a	%fcc0,	loop_434
	fmovs	%f29,	%f12
	call	loop_435
loop_433:
	fmovso	%fcc0,	%f15,	%f9
loop_434:
	bn,a,pn	%icc,	loop_436
	rd	%tick_cmpr,	%l1
loop_435:
	fbuge,a,pt	%fcc0,	loop_437
	call	loop_438
loop_436:
	xorcc	%o2,	0x1656,	%o1
	fxnors	%f2,	%f30,	%f21
loop_437:
	call	loop_439
loop_438:
	nop
	setx	0x1C56,	%l0,	%g3
	udivcc	%o4,	%g3,	%g2
	call	loop_440
	call	loop_441
loop_439:
	bvs,a,pt	%xcc,	loop_442
	fsrc1s	%f7,	%f25
loop_440:
	call	loop_443
loop_441:
	subcc	%i1,	0x023A,	%l0
loop_442:
	fmovrslz	%l2,	%f30,	%f5
	movvs	%icc,	%o6,	%i6
loop_443:
	call	loop_444
	tg	%icc,	0x3
	fxnor	%f26,	%f20,	%f8
	call	loop_445
loop_444:
	membar	0x10
	for	%f20,	%f20,	%f10
	fmul8x16al	%f5,	%f9,	%f2
loop_445:
	fmovdue	%fcc0,	%f8,	%f24
	fmovspos	%xcc,	%f12,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0E1, 	%hsys_tick_cmpr
	fbne,a	%fcc0,	loop_446
	call	loop_447
	fnot2s	%f17,	%f23
	ldx	[%l7 + 0x68],	%l6
loop_446:
	fpadd16	%f28,	%f18,	%f10
loop_447:
	tle	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x14E, 	%hsys_tick_cmpr
	call	loop_448
	call	loop_449
	nop
	setx	0x0926,	%l0,	%g5
	udivcc	%i0,	%g5,	%i3
	andn	%o3,	0x0938,	%o0
loop_448:
	tgu	%xcc,	0x2
loop_449:
	edge32	%i4,	%g1,	%g6
	nop
	fitos	%f6,	%f11
	fstox	%f11,	%f4
	bneg,a	%icc,	loop_450
	fcmped	%fcc1,	%f0,	%f24
	fpack32	%f22,	%f0,	%f30
	edge8ln	%o5,	%i5,	%i7
loop_450:
	bvc	%icc,	loop_451
	edge16l	%i2,	%l4,	%o7
	fmovsg	%fcc0,	%f4,	%f5
	membar	0x31
loop_451:
	call	loop_452
	faligndata	%f12,	%f30,	%f8
	call	loop_453
	fmovsul	%fcc1,	%f8,	%f1
loop_452:
	subcc	%l5,	%o2,	%o1
	subcc	%o4,	0x0BF3,	%l1
loop_453:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f14
	fmul8sux16	%f14,	%f30,	%f4
	wrpr	%g3,	0x07B5,	%tick
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_454
	tvc	%xcc,	0x7
	fmovrslez	%i1,	%f22,	%f10
	call	loop_455
loop_454:
	fmovrdgz	%l0,	%f4,	%f26
	call	loop_456
	te	%icc,	0x7
loop_455:
	nop
	setx	0xF902AF10,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x11359A9C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f14,	%f0
	fpadd16	%f18,	%f28,	%f6
loop_456:
	fones	%f25
	movpos	%icc,	%l2,	%o6
	movrgz	%i6,	%g2,	%g7
	nop
	set	0x28, %l6
	stw	%l6,	[%l7 + %l6]
	wr	%g0,	0x22,	%asi
	stda	%g4,	[%l7 + 0x40] %asi
	membar	#Sync
	fpadd32s	%f17,	%f6,	%f21
	sll	%i0,	0x11,	%l3
	call	loop_457
	nop
	fitos	%f24,	%f18
	fmovscs	%xcc,	%f2,	%f19
	tvc	%xcc,	0x0
loop_457:
	call	loop_458
	nop
	setx	0x4B4A3ED07BD1C1EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f22
	subccc	%g5,	%o3,	%i3
loop_458:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 25
!	Type a   	: 34
!	Type cti   	: 142
!	Type x   	: 12
!	Type f   	: 153
!	Type i   	: 134
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
	set	0x4,	%g3
	set	0x8,	%g4
	set	0x0,	%g5
	set	0x9,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x5,	%i1
	set	-0xF,	%i2
	set	-0x6,	%i3
	set	-0xC,	%i4
	set	-0x8,	%i5
	set	-0xD,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x4DDAD198,	%l0
	set	0x4DA15806,	%l1
	set	0x6865FEC1,	%l2
	set	0x7F9E48D2,	%l3
	set	0x27A1DBCC,	%l4
	set	0x6F16D43A,	%l5
	set	0x7E57595A,	%l6
	!# Output registers
	set	0x1A46,	%o0
	set	-0x02FA,	%o1
	set	-0x1F2F,	%o2
	set	-0x05EA,	%o3
	set	0x1E7E,	%o4
	set	-0x0F9C,	%o5
	set	-0x13D5,	%o6
	set	-0x02B4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	fmovse	%icc,	%f26,	%f6
	edge16	%o0,	%g1,	%g6
	call	loop_459
	bcs	%xcc,	loop_460
	fmovsleu	%xcc,	%f25,	%f4
	fnands	%f24,	%f8,	%f16
loop_459:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x73F, 	%sys_tick_cmpr
loop_460:
	movpos	%xcc,	%o5,	%i7
	fornot2s	%f15,	%f21,	%f13
	set	0x70, %g2
	stda	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	orcc	%i2,	%o7,	%l4
	fmovsuge	%fcc1,	%f2,	%f5
	andcc	%o2,	0x156E,	%o1
	fpmerge	%f13,	%f2,	%f0
	fmovsvc	%icc,	%f6,	%f0
	call	loop_461
	smulcc	%o4,	0x1B96,	%l5
	movu	%fcc0,	0x390,	%g3
	tleu	%icc,	0x1
loop_461:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%i1
	fmovdne	%fcc1,	%f26,	%f20
	movrgz	%l0,	%l2,	%i6
	set	0x58, %o5
	stda	%g2,	[%l7 + %o5] 0xe3
	membar	#Sync
	movl	%fcc1,	%o6,	%g7
	fpmerge	%f9,	%f14,	%f8
	array32	%l6,	%g4,	%i0
	call	loop_462
	nop
	fitos	%f9,	%f11
	fstoi	%f11,	%f7
	call	loop_463
	taddcctv	%g5,	%o3,	%l3
loop_462:
	call	loop_464
	tsubcctv	%i3,	%g1,	%g6
loop_463:
	call	loop_465
	fbue,a,pt	%fcc2,	loop_466
loop_464:
	call	loop_467
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f6
loop_465:
	movne	%xcc,	0x602,	%i4
loop_466:
	fmovsge	%xcc,	%f25,	%f2
loop_467:
	fpackfix	%f6,	%f4
	taddcc	%o0,	%i7,	%i5
	xnorcc	%o5,	0x1A14,	%i2
	call	loop_468
	call	loop_469
	fmovdne	%xcc,	%f6,	%f22
	for	%f28,	%f12,	%f10
loop_468:
	fpsub32s	%f23,	%f17,	%f19
loop_469:
	movgu	%xcc,	%o7,	%l4
	call	loop_470
	call	loop_471
	call	loop_472
	mulscc	%o2,	%o1,	%o4
loop_470:
	movul	%fcc3,	0x03F,	%l5
loop_471:
	movul	%fcc0,	%g3,	%i1
loop_472:
	fcmpne32	%f20,	%f0,	%l1
	call	loop_473
	fbuge,pn	%fcc2,	loop_474
	call	loop_475
	call	loop_476
loop_473:
	fzeros	%f25
loop_474:
	fmovdule	%fcc1,	%f24,	%f8
loop_475:
	brlez,pn	%l0,	loop_477
loop_476:
	fbu,a,pn	%fcc0,	loop_478
	fsrc2	%f4,	%f16
	xor	%l2,	0x125F,	%i6
loop_477:
	movcc	%icc,	%g2,	%o6
loop_478:
	stb	%l6,	[%l7 + 0x46]
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	siam	0x3
	call	loop_479
	fandnot1s	%f13,	%f25,	%f0
	faligndata	%f18,	%f12,	%f14
	call	loop_480
loop_479:
	call	loop_481
	movrne	%g7,	%g4,	%i0
	tgu	%xcc,	0x6
loop_480:
	fcmpne16	%f12,	%f24,	%g5
loop_481:
	call	loop_482
	call	loop_483
	rd	%ccr,	%l3
	call	loop_484
loop_482:
	popc	0x06C4,	%i3
loop_483:
	nop
	wr	%g0,	0x10,	%asi
	stba	%g1,	[%l7 + 0x79] %asi
loop_484:
	tsubcctv	%o3,	%g6,	%i4
	fpadd16s	%f3,	%f14,	%f10
	be	%icc,	loop_485
	fmovrdne	%o0,	%f18,	%f6
	call	loop_486
	sethi	0x0829,	%i5
loop_485:
	fmovdvs	%xcc,	%f12,	%f24
	call	loop_487
loop_486:
	call	loop_488
	nop
	set	0x50, %i0
	flush	%l7 + %i0
	edge16	%o5,	%i7,	%o7
loop_487:
	call	loop_489
loop_488:
	udivx	%i2,	0x164A,	%l4
	wrpr 	%g0, 	0x0, 	%gl
	bneg,a	%icc,	loop_490
loop_489:
	udivcc	%o1,	0x07C7,	%o4
	nop
	fitos	%f8,	%f3
	fstoi	%f3,	%f27
	fmovda	%icc,	%f16,	%f20
loop_490:
	sdiv	%g3,	0x0389,	%l5
	xor	%l1,	%i1,	%l0
	call	loop_491
	fpackfix	%f8,	%f15
	call	loop_492
	call	loop_493
loop_491:
	edge8ln	%l2,	%g2,	%o6
	call	loop_494
loop_492:
	fpackfix	%f8,	%f17
loop_493:
	call	loop_495
	wrpr	%i6,	0x1203,	%cwp
loop_494:
	brgz	%l6,	loop_496
	srax	%g7,	%g4,	%g5
loop_495:
	movneg	%icc,	%l3,	%i3
	call	loop_497
loop_496:
	mulscc	%g1,	0x1D5C,	%o3
	call	loop_498
	call	loop_499
loop_497:
	call	loop_500
	fmovsleu	%icc,	%f13,	%f21
loop_498:
	wr	%i0,	%i4,	%ccr
loop_499:
	tneg	%xcc,	0x1
loop_500:
	bge,a,pt	%xcc,	loop_501
	call	loop_502
	call	loop_503
	fands	%f7,	%f15,	%f10
loop_501:
	ba,a	%xcc,	loop_504
loop_502:
	fmovdge	%fcc1,	%f14,	%f20
loop_503:
	fmovdcc	%xcc,	%f24,	%f10
	nop
	set	0x1F, %o6
	stb	%o0,	[%l7 + %o6]
loop_504:
	call	loop_505
	umul	%g6,	%i5,	%i7
	call	loop_506
	call	loop_507
loop_505:
	addccc	%o5,	0x1D22,	%o7
	orcc	%i2,	%l4,	%o1
loop_506:
	fpsub16	%f14,	%f10,	%f6
loop_507:
	fmovdvs	%icc,	%f2,	%f4
	call	loop_508
	call	loop_509
	call	loop_510
	fmovdl	%fcc3,	%f20,	%f14
loop_508:
	call	loop_511
loop_509:
	bcs	%xcc,	loop_512
loop_510:
	bmask	%o2,	%g3,	%o4
	rdpr	%cwp,	%l1
loop_511:
	fors	%f19,	%f7,	%f28
loop_512:
	fmovspos	%xcc,	%f2,	%f2
	rd	%ccr,	%l5
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f10
	fone	%f22
	taddcctv	%i1,	0x1FD7,	%l0
	call	loop_513
	nop
	setx	0x1B515C1265280DF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9A68597F87966418,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f26
	movvc	%xcc,	0x4A5,	%g2
	edge32	%l2,	%i6,	%l6
loop_513:
	fzero	%f8
	call	loop_514
	be,a	%icc,	loop_515
	call	loop_516
	call	loop_517
loop_514:
	call	loop_518
loop_515:
	fcmped	%fcc2,	%f24,	%f0
loop_516:
	call	loop_519
loop_517:
	taddcctv	%g7,	0x0F1E,	%o6
loop_518:
	umulcc	%g4,	%g5,	%i3
	call	loop_520
loop_519:
	fxors	%f30,	%f4,	%f26
	fmovsneg	%icc,	%f8,	%f15
	call	loop_521
loop_520:
	edge32	%l3,	%g1,	%o3
	set	0x21, %g3
	ldstuba	[%l7 + %g3] 0x0c,	%i4
loop_521:
	taddcc	%o0,	%g6,	%i5
	fmovrse	%i0,	%f31,	%f16
	fbo,pn	%fcc0,	loop_522
	brgez,pt	%i7,	loop_523
	fmovdo	%fcc3,	%f28,	%f22
	fcmped	%fcc2,	%f30,	%f18
loop_522:
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f14
loop_523:
	or	%o7,	%o5,	%l4
	alignaddr	%i2,	%o2,	%o1
	call	loop_524
	fmovsneg	%xcc,	%f31,	%f6
	fnegd	%f16,	%f2
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f26
loop_524:
	call	loop_525
	call	loop_526
	call	loop_527
	fmul8x16au	%f29,	%f8,	%f24
loop_525:
	fmovsuge	%fcc1,	%f27,	%f29
loop_526:
	subccc	%o4,	0x0B4E,	%l1
loop_527:
	fmovduge	%fcc2,	%f12,	%f30
	edge32ln	%l5,	%i1,	%g3
	call	loop_528
	mulx	%g2,	%l2,	%l0
	sub	%l6,	%g7,	%i6
	movug	%fcc0,	0x019,	%g4
loop_528:
	edge16	%o6,	%g5,	%i3
	call	loop_529
	call	loop_530
	call	loop_531
	call	loop_532
loop_529:
	fmovsg	%fcc2,	%f14,	%f8
loop_530:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l3,	%o3
loop_531:
	fones	%f5
loop_532:
	call	loop_533
	sllx	%g1,	0x0D,	%i4
	call	loop_534
	rd	%asi,	%g6
loop_533:
	fmovdcc	%xcc,	%f26,	%f28
	fmul8x16	%f26,	%f20,	%f30
loop_534:
	fsrc2s	%f22,	%f11
	fandnot2	%f2,	%f12,	%f28
	call	loop_535
	fmovsleu	%icc,	%f5,	%f21
	movo	%fcc2,	%o0,	%i5
	movug	%fcc2,	%i0,	%o7
loop_535:
	call	loop_536
	tl	%xcc,	0x0
	call	loop_537
	edge16ln	%i7,	%l4,	%i2
loop_536:
	call	loop_538
	fpack16	%f16,	%f15
loop_537:
	fbg,a	%fcc1,	loop_539
	rdhpr	%htba,	%o5
loop_538:
	edge8ln	%o2,	%o1,	%l1
	fmovsa	%icc,	%f15,	%f24
loop_539:
	call	loop_540
	fmovdvc	%xcc,	%f28,	%f18
	fsrc1	%f4,	%f20
	set	0x35, %o3
	stba	%l5,	[%l7 + %o3] 0x89
loop_540:
	srl	%i1,	%g3,	%o4
	srlx	%g2,	%l2,	%l0
	array32	%l6,	%i6,	%g4
	fnor	%f2,	%f20,	%f20
	fmovsneg	%xcc,	%f2,	%f14
	wr	%o6,	%g7,	%y
	edge16	%i3,	%l3,	%g5
	fbue,a,pn	%fcc0,	loop_541
	movne	%xcc,	0x1E0,	%o3
	call	loop_542
	call	loop_543
loop_541:
	fbo,a	%fcc0,	loop_544
	call	loop_545
loop_542:
	bl,a	%xcc,	loop_546
loop_543:
	wr	%g1,	0x0AD7,	%pic
loop_544:
	call	loop_547
loop_545:
	fmovdg	%fcc1,	%f12,	%f10
loop_546:
	call	loop_548
	edge32n	%i4,	%o0,	%g6
loop_547:
	call	loop_549
	lduh	[%l7 + 0x2A],	%i5
loop_548:
	addc	%i0,	%i7,	%o7
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%l4
loop_549:
	sdiv	%i2,	0x1F0B,	%o5
	or	%o2,	%l1,	%l5
	fpsub16	%f0,	%f6,	%f8
	bmask	%i1,	%g3,	%o4
	nop
	setx	loop_550,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024400001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%g2,	0x0BCE,	%sys_tick
	nop
	set	0x58, %o1
	stx	%o1,	[%l7 + %o1]
	movge	%fcc2,	%l0,	%l6
loop_550:
	fmovsule	%fcc1,	%f28,	%f1
	movn	%fcc1,	0x4FF,	%l2
	ld	[%l7 + 0x1C],	%f18
	tvc	%icc,	0x3
	addccc	%i6,	%g4,	%o6
	call	loop_551
	umulcc	%g7,	%l3,	%i3
	fpmerge	%f13,	%f31,	%f24
	fmovdvc	%icc,	%f22,	%f24
loop_551:
	fcmpeq16	%f24,	%f22,	%g5
	call	loop_552
	fbu	%fcc3,	loop_553
	fbge	%fcc2,	loop_554
	taddcctv	%g1,	0x04AB,	%i4
loop_552:
	umulcc	%o0,	0x1942,	%o3
loop_553:
	tpos	%icc,	0x0
loop_554:
	smulcc	%g6,	0x033F,	%i0
	call	loop_555
	faligndata	%f2,	%f4,	%f6
	fmovsuge	%fcc2,	%f30,	%f26
	fmovsug	%fcc3,	%f5,	%f13
loop_555:
	nop
	fitod	%f29,	%f30
	nop
	setx	0xB776DDA485FDFD9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f14
	tvc	%icc,	0x1
	rd	%tick_cmpr,	%i5
	wr	%o7,	0x17E3,	%y
	call	loop_556
	alignaddr	%i7,	%i2,	%o5
	fnot2	%f26,	%f10
	call	loop_557
loop_556:
	fmovda	%fcc0,	%f30,	%f0
	fmovsul	%fcc1,	%f29,	%f15
	for	%f20,	%f22,	%f24
loop_557:
	call	loop_558
	andn	%l4,	%o2,	%l5
	fmul8sux16	%f12,	%f8,	%f2
	fmovdvc	%xcc,	%f22,	%f0
loop_558:
	call	loop_559
	membar	0x39
	edge8l	%l1,	%i1,	%o4
	call	loop_560
loop_559:
	udivcc	%g3,	0x0087,	%o1
	call	loop_561
	call	loop_562
loop_560:
	edge32	%g2,	%l6,	%l2
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 4
loop_561:
	call	loop_563
loop_562:
	movule	%fcc2,	0x309,	%g4
	nop
	setx	0xEA3EA6EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xA8E5F9E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f22,	%f19
	call	loop_564
loop_563:
	call	loop_565
	call	loop_566
	movuge	%fcc1,	%i6,	%g7
loop_564:
	movre	%o6,	%l3,	%i3
loop_565:
	movcs	%icc,	0x1D3,	%g1
loop_566:
	movleu	%icc,	0x1F7,	%i4
	fandnot2s	%f2,	%f3,	%f4
	call	loop_567
	array8	%g5,	%o0,	%g6
	wr	%o3,	0x02B5,	%ccr
	call	loop_568
loop_567:
	fmovdpos	%icc,	%f26,	%f24
	rdhpr	%hintp,	%i5
	fornot1	%f10,	%f4,	%f28
loop_568:
	sra	%o7,	0x02,	%i0
	call	loop_569
	rdpr	%canrestore,	%i2
	call	loop_570
	nop
	setx	0xB8CC76AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x759A0FDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f5,	%f4
loop_569:
	call	loop_571
	andcc	%o5,	%l4,	%i7
loop_570:
	mova	%icc,	0x740,	%l5
	te	%xcc,	0x4
loop_571:
	andncc	%l1,	%o2,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x19,	%g3,	%i1
	call	loop_572
	fmovsle	%fcc0,	%f1,	%f26
	sllx	%o1,	0x10,	%g2
	set	0x4C, %i2
	stwa	%l2,	[%l7 + %i2] 0x81
loop_572:
	fone	%f20
	fmovspos	%xcc,	%f22,	%f13
	set	0x68, %l1
	ldswa	[%l7 + %l1] 0x88,	%l0
	rd	%y,	%l6
	call	loop_573
	edge8	%i6,	%g4,	%o6
	call	loop_574
	movg	%fcc3,	0x612,	%l3
loop_573:
	call	loop_575
	addc	%i3,	0x1E22,	%g7
loop_574:
	fpadd16s	%f13,	%f6,	%f0
	movge	%fcc0,	0x57B,	%g1
loop_575:
	call	loop_576
	xorcc	%g5,	%o0,	%g6
	ldub	[%l7 + 0x4C],	%o3
	call	loop_577
loop_576:
	nop
	setx	0xF8CF52FF7538B926,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8E4D55C0F0EC735F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f22
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_578
loop_577:
	fcmple16	%f16,	%f12,	%i0
	movne	%icc,	0x0D6,	%i4
	movrne	%i2,	0x276,	%l4
loop_578:
	addcc	%o5,	0x1C9D,	%l5
	call	loop_579
	fblg	%fcc0,	loop_580
	rd	%tick_cmpr,	%i7
	fxnor	%f12,	%f14,	%f26
loop_579:
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f2
loop_580:
	tvs	%xcc,	0x3
	bmask	%l1,	%o2,	%o4
	fcmpgt16	%f4,	%f4,	%i1
	wrpr 	%g0, 	0x0, 	%gl
	fnors	%f4,	%f4,	%f14
	wr	%l2,	0x0E79,	%set_softint
	call	loop_581
	call	loop_582
	xnorcc	%o1,	%l0,	%i6
	call	loop_583
loop_581:
	fmovsneg	%icc,	%f16,	%f2
loop_582:
	addcc	%g4,	%o6,	%l3
	movlg	%fcc0,	0x7DF,	%l6
loop_583:
	call	loop_584
	edge16n	%i3,	%g7,	%g1
	call	loop_585
	orn	%o0,	%g5,	%o3
loop_584:
	xorcc	%g6,	0x0F2F,	%i5
	fmovsvc	%icc,	%f19,	%f10
loop_585:
	sub	%i0,	0x1E90,	%o7
	set	0x76, %l5
	stba	%i4,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	setx	0xBF5D43814123EA97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCEED9EDD63D5E312,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f16,	%f16
	fxor	%f8,	%f30,	%f24
	movrlz	%i2,	%l4,	%o5
	xnorcc	%l5,	%l1,	%o2
	call	loop_586
	fexpand	%f22,	%f0
	call	loop_587
	tleu	%xcc,	0x2
loop_586:
	fornot2s	%f21,	%f31,	%f24
	wr	%o4,	0x0B0C,	%softint
loop_587:
	call	loop_588
	fnot1	%f0,	%f0
	ba,a,pt	%xcc,	loop_589
	lduh	[%l7 + 0x60],	%i1
loop_588:
	brgez,a	%i7,	loop_590
	wr	%g3,	0x1603,	%clear_softint
loop_589:
	movgu	%xcc,	0x097,	%g2
	fornot2	%f20,	%f0,	%f14
loop_590:
	nop
	setx	0x4EA6EA29A771698F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3FB51824DA0D893C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f18,	%f20
	movn	%xcc,	0x66F,	%o1
	fbne,a,pn	%fcc0,	loop_591
	call	loop_592
	fmovdn	%icc,	%f10,	%f0
	fmovdue	%fcc3,	%f2,	%f14
loop_591:
	fpack16	%f4,	%f31
loop_592:
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%l2
	tg	%xcc,	0x1
	fmovdgu	%icc,	%f22,	%f4
	call	loop_593
	tcc	%icc,	0x4
	brlez,a	%l0,	loop_594
	movn	%xcc,	0x770,	%i6
loop_593:
	fmovsge	%fcc0,	%f6,	%f21
	wrpr 	%g0, 	0x3, 	%gl
loop_594:
	call	loop_595
	fmovso	%fcc3,	%f13,	%f22
	edge32ln	%g4,	%i3,	%g7
	taddcctv	%g1,	0x1D98,	%l6
loop_595:
	call	loop_596
	te	%xcc,	0x4
	fmovsg	%fcc3,	%f23,	%f22
	udiv	%g5,	0x1068,	%o0
loop_596:
	movcs	%xcc,	%o3,	%i5
	sll	%i0,	%o7,	%g6
	fsrc1s	%f30,	%f13
	fxnor	%f16,	%f2,	%f8
	rdhpr	%ver,	%i2
	mova	%fcc3,	0x2CD,	%l4
	fpsub16s	%f8,	%f10,	%f25
	fmovsleu	%icc,	%f1,	%f0
	fnors	%f13,	%f20,	%f16
	fmovdug	%fcc3,	%f8,	%f18
	call	loop_597
	call	loop_598
	fmovrslz	%o5,	%f0,	%f11
	fandnot1	%f30,	%f24,	%f30
loop_597:
	mova	%fcc0,	%l5,	%i4
loop_598:
	call	loop_599
	ldsw	[%l7 + 0x3C],	%l1
	fmovduge	%fcc0,	%f2,	%f0
	call	loop_600
loop_599:
	fpadd32s	%f11,	%f21,	%f29
	orn	%o2,	0x10F1,	%o4
	fmovd	%f14,	%f22
loop_600:
	fmovdug	%fcc0,	%f0,	%f20
	fmovse	%fcc1,	%f24,	%f26
	fnot1s	%f23,	%f9
	movvc	%xcc,	%i7,	%g3
	movgu	%xcc,	%i1,	%g2
	set	0x50, %g5
	stxa	%l2,	[%l7 + %g5] 0x11
	fmovdne	%fcc3,	%f30,	%f12
	fexpand	%f2,	%f20
	call	loop_601
	call	loop_602
	wrpr 	%g0, 	0x2, 	%gl
	umul	%i6,	0x0633,	%o1
loop_601:
	movuge	%fcc2,	0x3FC,	%o6
loop_602:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC47, 	%sys_tick_cmpr
	fnands	%f11,	%f18,	%f14
	orn	%i3,	0x168D,	%g1
	bg,a,pn	%icc,	loop_603
	fmovsug	%fcc3,	%f2,	%f17
	tle	%xcc,	0x3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_603:
	call	loop_604
	rdhpr	%ver,	%g5
	sir	0x17A5
	call	loop_605
loop_604:
	bmask	%l6,	%o3,	%i5
	edge8n	%i0,	%o7,	%o0
	call	loop_606
loop_605:
	fcmpne32	%f20,	%f28,	%i2
	nop
	setx	0x4E0A507D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x4DEDD099,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f6,	%f25
	call	loop_607
loop_606:
	call	loop_608
	movlg	%fcc0,	0x427,	%l4
loop_607:
	nop

loop_608:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 25
!	Type a   	: 30
!	Type x   	: 14
!	Type cti   	: 150
!	Type f   	: 138
!	Type i   	: 143
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
	set	0xD,	%g2
	set	0x3,	%g3
	set	0x8,	%g4
	set	0xB,	%g5
	set	0xB,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0x0,	%i2
	set	-0xA,	%i3
	set	-0xB,	%i4
	set	-0xD,	%i5
	set	-0x1,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x01377B55,	%l0
	set	0x66370BF5,	%l1
	set	0x5D9D38AE,	%l2
	set	0x761FDE84,	%l3
	set	0x1BED22FD,	%l4
	set	0x2EB8826B,	%l5
	set	0x6061B37A,	%l6
	!# Output registers
	set	0x08AD,	%o0
	set	-0x0A89,	%o1
	set	0x0470,	%o2
	set	0x04EC,	%o3
	set	-0x1442,	%o4
	set	0x14FC,	%o5
	set	0x0BC7,	%o6
	set	-0x09D1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x54] %asi,	%g6
	subc	%o5,	%i4,	%l5
	fpadd32s	%f0,	%f27,	%f20
	call	loop_609
	call	loop_610
	call	loop_611
	stx	%l1,	[%l7 + 0x28]
loop_609:
	fpsub16	%f10,	%f22,	%f14
loop_610:
	fmovdne	%xcc,	%f10,	%f14
loop_611:
	call	loop_612
	rdhpr	%hpstate,	%o4
	nop
	fitos	%f14,	%f21
	fstox	%f21,	%f2
	fnot1	%f20,	%f24
loop_612:
	array32	%o2,	%i7,	%g3
	movpos	%xcc,	%g2,	%i1
	call	loop_613
	call	loop_614
	call	loop_615
	nop
	setx	0x6F31D230,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f25
loop_613:
	edge32l	%l0,	%l2,	%o1
loop_614:
	call	loop_616
loop_615:
	tne	%xcc,	0x6
	fpadd16	%f30,	%f10,	%f10
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f24
loop_616:
	fmovdcs	%icc,	%f28,	%f10
	call	loop_617
	taddcc	%o6,	%i6,	%l3
	fmovsa	%xcc,	%f1,	%f26
	stb	%g4,	[%l7 + 0x47]
loop_617:
	call	loop_618
	subc	%g1,	0x0B1E,	%g7
	call	loop_619
	call	loop_620
loop_618:
	addccc	%i3,	0x1B24,	%g5
	call	loop_621
loop_619:
	fpadd32	%f2,	%f0,	%f24
loop_620:
	nop
	set	0x66, %l3
	lduh	[%l7 + %l3],	%l6
	call	loop_622
loop_621:
	call	loop_623
	call	loop_624
	fmovdu	%fcc1,	%f2,	%f12
loop_622:
	nop
	fitod	%f0,	%f8
	fdtoi	%f8,	%f0
loop_623:
	fexpand	%f7,	%f20
loop_624:
	fpack32	%f0,	%f8,	%f28
	fmovscs	%icc,	%f28,	%f17
	fmovsgu	%xcc,	%f23,	%f16
	bg	%icc,	loop_625
	srlx	%i5,	%o3,	%i0
	srax	%o0,	0x06,	%i2
	fmovdcs	%xcc,	%f12,	%f12
loop_625:
	nop
	set	0x36, %i7
	ldstuba	[%l7 + %i7] 0x11,	%o7
	call	loop_626
	nop
	setx	0x1F0ABE4AEA2F8151,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
	nop
	fitos	%f11,	%f30
	fstod	%f30,	%f14
	array8	%l4,	%g6,	%o5
loop_626:
	nop
	setx	0xB15417A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xBFC69E00,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f3,	%f13
	st	%f23,	[%l7 + 0x20]
	call	loop_627
	fmovdne	%fcc3,	%f0,	%f26
	call	loop_628
	fmovsue	%fcc3,	%f29,	%f7
loop_627:
	fcmps	%fcc2,	%f11,	%f2
	mulx	%i4,	%l1,	%l5
loop_628:
	std	%o2,	[%l7 + 0x70]
	fcmpd	%fcc1,	%f10,	%f24
	bvs,a,pn	%xcc,	loop_629
	popc	%o4,	%i7
	tsubcc	%g2,	%g3,	%l0
	mulx	%l2,	0x1E04,	%o1
loop_629:
	subccc	%o6,	0x0824,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i6,	%g4
	fmovrslz	%g1,	%f26,	%f11
	addc	%g7,	0x1CA6,	%l3
	udivcc	%g5,	0x0DF1,	%l6
	call	loop_630
	xnor	%i5,	0x12A4,	%o3
	fcmped	%fcc2,	%f28,	%f18
	nop
	fitos	%f8,	%f24
	fstox	%f24,	%f18
loop_630:
	nop
	setx	0x73992AAE0BE2ED67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f6
	fsrc2s	%f26,	%f21
	call	loop_631
	call	loop_632
	fmovduge	%fcc1,	%f2,	%f28
	brz,a	%i0,	loop_633
loop_631:
	fmovse	%fcc0,	%f24,	%f11
loop_632:
	fpadd32s	%f11,	%f1,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_633:
	xor	%i3,	%i2,	%l4
	fabsd	%f6,	%f6
	call	loop_634
	fnegs	%f7,	%f22
	edge8ln	%o7,	%o5,	%g6
	brgz,pn	%i4,	loop_635
loop_634:
	fmovdug	%fcc0,	%f4,	%f18
	fmovsg	%fcc2,	%f8,	%f0
	fornot1	%f2,	%f14,	%f10
loop_635:
	call	loop_636
	fmovslg	%fcc3,	%f18,	%f21
	tn	%xcc,	0x7
	fcmpd	%fcc1,	%f4,	%f24
loop_636:
	rdpr	%canrestore,	%l5
	call	loop_637
	addcc	%o2,	%l1,	%o4
	subc	%g2,	0x1CEB,	%g3
	nop
	fitod	%f12,	%f0
	fdtox	%f0,	%f20
loop_637:
	call	loop_638
	movneg	%xcc,	0x79D,	%l0
	mulscc	%l2,	0x06D5,	%o1
	fxnor	%f18,	%f26,	%f26
loop_638:
	nop
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xca
	call	loop_639
	subc	%i7,	%o6,	%i1
	sdivcc	%i6,	0x1956,	%g1
	fand	%f0,	%f8,	%f2
loop_639:
	fmovsule	%fcc0,	%f18,	%f0
	tle	%icc,	0x5
	fmovdug	%fcc1,	%f28,	%f2
	fmul8sux16	%f16,	%f2,	%f24
	fmovdug	%fcc1,	%f22,	%f26
	fsrc1	%f22,	%f2
	lduw	[%l7 + 0x5C],	%g7
	sdiv	%g4,	0x06E1,	%l3
	wrpr 	%g0, 	0x2, 	%gl
	fmovsule	%fcc1,	%f31,	%f25
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f10
	call	loop_640
	call	loop_641
	call	loop_642
	nop
	setx	0xDFD6B6EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xE67AA0BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f0,	%f27
loop_640:
	smul	%i5,	0x074A,	%i0
loop_641:
	fbne	%fcc3,	loop_643
loop_642:
	brz,pn	%o0,	loop_644
	edge8ln	%o3,	%i3,	%l4
	te	%icc,	0x7
loop_643:
	te	%xcc,	0x6
loop_644:
	movne	%xcc,	%i2,	%o5
	nop
	setx	0xBB236EA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f26
	brlz,a,pn	%g6,	loop_645
	fornot2s	%f10,	%f23,	%f9
	xnorcc	%o7,	%l5,	%o2
	call	loop_646
loop_645:
	fble,a	%fcc0,	loop_647
	rdhpr	%hsys_tick_cmpr,	%i4
	set	0x24, %o0
	lduwa	[%l7 + %o0] 0x89,	%l1
loop_646:
	edge16n	%g2,	%o4,	%g3
loop_647:
	tgu	%xcc,	0x1
	fmovdgu	%icc,	%f14,	%f26
	fornot2s	%f27,	%f7,	%f18
	call	loop_648
	fmovrde	%l2,	%f18,	%f30
	wr	%g0,	0x2a,	%asi
	stha	%l0,	[%l7 + 0x64] %asi
	membar	#Sync
loop_648:
	fsrc2	%f30,	%f20
	fmovsne	%fcc0,	%f3,	%f31
	fzeros	%f4
	nop
	set	0x34, %l4
	swap	[%l7 + %l4],	%o1
	mulscc	%i7,	0x1F3F,	%o6
	wrpr	%i6,	%i1,	%tick
	fnot1s	%f5,	%f16
	nop
	setx	0x1AEF8746,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xA8231F8E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f30,	%f13
	movge	%xcc,	%g1,	%g4
	fzeros	%f31
	taddcc	%g7,	0x170F,	%l3
	fabss	%f7,	%f24
	fbn,a	%fcc2,	loop_649
	lduh	[%l7 + 0x6A],	%l6
	call	loop_650
	call	loop_651
loop_649:
	movrne	%i5,	0x0A4,	%g5
	call	loop_652
loop_650:
	call	loop_653
loop_651:
	and	%i0,	0x172F,	%o3
	wrpr	%o0,	%l4,	%pil
loop_652:
	fmovdlg	%fcc1,	%f2,	%f22
loop_653:
	rdhpr	%hintp,	%i2
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x64] %asi
	array8	%g6,	%o7,	%l5
	tneg	%xcc,	0x2
	call	loop_654
	nop
	set	0x11, %l0
	ldstub	[%l7 + %l0],	%o2
	ta	%xcc,	0x7
	sir	0x0EE6
loop_654:
	taddcctv	%i4,	%l1,	%i3
	fmul8x16au	%f13,	%f30,	%f2
	call	loop_655
	call	loop_656
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f3
	call	loop_657
loop_655:
	fmovsule	%fcc0,	%f12,	%f4
loop_656:
	call	loop_658
	xor	%o4,	0x18DF,	%g3
loop_657:
	movrlez	%l2,	0x362,	%l0
	call	loop_659
loop_658:
	call	loop_660
	fbne	%fcc1,	loop_661
	fmovsg	%xcc,	%f22,	%f26
loop_659:
	edge8ln	%o1,	%g2,	%o6
loop_660:
	sll	%i7,	0x1B,	%i6
loop_661:
	nop
	setx	0xC07B0498739CFA4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f24
	call	loop_662
	mova	%xcc,	0x1C2,	%g1
	call	loop_663
	call	loop_664
loop_662:
	movle	%xcc,	0x12F,	%g4
	call	loop_665
loop_663:
	array8	%g7,	%l3,	%i1
loop_664:
	fmovsvc	%xcc,	%f11,	%f26
	movule	%fcc0,	%i5,	%l6
loop_665:
	wr 	%g0, 	0x6, 	%fprs
	rd	%tick_cmpr,	%o3
	fornot1	%f10,	%f24,	%f26
	call	loop_666
	movrgez	%g5,	0x3D7,	%l4
	wr	%o0,	0x1383,	%clear_softint
	call	loop_667
loop_666:
	array32	%o5,	%g6,	%i2
	call	loop_668
	wrpr 	%g0, 	0x3, 	%gl
loop_667:
	sra	%o7,	%o2,	%l1
	fmovsg	%fcc1,	%f1,	%f10
loop_668:
	call	loop_669
	edge16	%i3,	%i4,	%g3
	call	loop_670
	call	loop_671
loop_669:
	call	loop_672
	fzeros	%f2
loop_670:
	edge32l	%l2,	%l0,	%o4
loop_671:
	subcc	%o1,	0x0427,	%g2
loop_672:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	call	loop_673
	fmovsneg	%xcc,	%f31,	%f10
	wr	%i7,	0x1156,	%set_softint
	prefetch	[%l7 + 0x68],	 2
loop_673:
	rdhpr	%htba,	%i6
	call	loop_674
	mulscc	%o6,	%g4,	%g1
	call	loop_675
	call	loop_676
loop_674:
	call	loop_677
	fpack32	%f12,	%f24,	%f14
loop_675:
	movgu	%icc,	%l3,	%i1
loop_676:
	umul	%g7,	%l6,	%i0
loop_677:
	call	loop_678
	bpos,a	%icc,	loop_679
	tpos	%xcc,	0x5
	tvc	%icc,	0x2
loop_678:
	fornot1	%f24,	%f26,	%f20
loop_679:
	fone	%f2
	call	loop_680
	bvs,a	%icc,	loop_681
	call	loop_682
	ldsh	[%l7 + 0x5C],	%i5
loop_680:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBE7, 	%hsys_tick_cmpr
loop_681:
	fors	%f3,	%f5,	%f25
loop_682:
	nop
	setx	0xB8F1511726345DAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x108EEAAB434BECA8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f24,	%f30
	call	loop_683
	call	loop_684
	nop
	setx	0x1660,	%l0,	%o5
	udivx	%o0,	%o5,	%g6
	movcs	%xcc,	%i2,	%l4
loop_683:
	bvs,a,pt	%icc,	loop_685
loop_684:
	nop
	fitod	%f17,	%f10
	taddcctv	%l5,	0x1F1D,	%o7
	fpadd32	%f20,	%f10,	%f8
loop_685:
	sll	%l1,	%i3,	%o2
	call	loop_686
	call	loop_687
	srl	%i4,	0x0C,	%l2
	movcs	%icc,	%g3,	%l0
loop_686:
	fornot1s	%f31,	%f19,	%f20
loop_687:
	fmovdge	%fcc2,	%f2,	%f18
	subccc	%o4,	%g2,	%i7
	fnors	%f25,	%f7,	%f25
	call	loop_688
	fmovsule	%fcc2,	%f2,	%f9
	call	loop_689
	call	loop_690
loop_688:
	ta	%icc,	0x7
	subcc	%o1,	0x0C77,	%i6
loop_689:
	srlx	%g4,	0x05,	%o6
loop_690:
	fbul,a	%fcc2,	loop_691
	call	loop_692
	call	loop_693
	call	loop_694
loop_691:
	fmul8x16au	%f30,	%f3,	%f10
loop_692:
	fmovdue	%fcc3,	%f8,	%f24
loop_693:
	add	%g1,	%l3,	%i1
loop_694:
	fmovrsgez	%g7,	%f22,	%f27
	fmovdule	%fcc2,	%f6,	%f28
	fexpand	%f29,	%f12
	rdhpr	%ver,	%l6
	nop
	fitos	%f0,	%f28
	fstod	%f28,	%f10
	call	loop_695
	fmovdo	%fcc2,	%f14,	%f28
	wr	%g0,	0x19,	%asi
	stwa	%i5,	[%l7 + 0x3C] %asi
loop_695:
	alignaddrl	%g5,	%o3,	%o0
	call	loop_696
	call	loop_697
	call	loop_698
	fcmpeq16	%f28,	%f16,	%i0
loop_696:
	fnegs	%f9,	%f20
loop_697:
	fpadd32s	%f0,	%f22,	%f13
loop_698:
	movgu	%xcc,	%g6,	%i2
	fmuld8ulx16	%f5,	%f13,	%f24
	call	loop_699
	fmovrsne	%l4,	%f23,	%f11
	movneg	%xcc,	0x03C,	%l5
	sir	0x1E6D
loop_699:
	movg	%fcc0,	%o5,	%o7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f14
	call	loop_700
	movrne	%i3,	%o2,	%l1
	call	loop_701
	rd	%ccr,	%i4
loop_700:
	call	loop_702
	movneg	%xcc,	%g3,	%l0
loop_701:
	call	loop_703
	srax	%o4,	%l2,	%g2
loop_702:
	wrpr	%i7,	%o1,	%tick
	fsrc2s	%f20,	%f22
loop_703:
	nop
	wr	%g0,	0xd2,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movge	%icc,	%g4,	%o6
	stbar
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x830, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x70],	%i6
	array32	%i1,	%g7,	%l3
	fmovrslez	%i5,	%f17,	%f30
	call	loop_704
	tle	%xcc,	0x4
	call	loop_705
	fnot1s	%f0,	%f30
loop_704:
	fxors	%f4,	%f26,	%f19
	fmovrdgez	%l6,	%f16,	%f20
loop_705:
	bvs	%xcc,	loop_706
	srlx	%o3,	%g5,	%o0
	fpsub32	%f12,	%f22,	%f4
	call	loop_707
loop_706:
	tsubcc	%g6,	%i2,	%i0
	mulx	%l5,	%o5,	%l4
	andncc	%o7,	0x02EF,	%i3
loop_707:
	srl	%l1,	%o2,	%g3
	edge32	%l0,	%o4,	%l2
	movpos	%xcc,	0x075,	%g2
	bmask	%i4,	%o1,	%i7
	set	0x34, %o2
	ldsha	[%l7 + %o2] 0x10,	%o6
	fcmps	%fcc3,	%f17,	%f7
	call	loop_708
	wr	%g4,	%i6,	%set_softint
	ldsw	[%l7 + 0x0C],	%i1
	fandnot2s	%f4,	%f15,	%f7
loop_708:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_709
	call	loop_710
	fmovrsgz	%g7,	%f31,	%f8
	call	loop_711
loop_709:
	fcmple16	%f30,	%f26,	%g1
loop_710:
	orn	%l3,	0x1FA6,	%l6
	movre	%o3,	0x088,	%g5
loop_711:
	taddcc	%o0,	%i5,	%g6
	fmovdul	%fcc3,	%f8,	%f14
	call	loop_712
	srlx	%i0,	%i2,	%o5
	wr 	%g0, 	0x5, 	%fprs
	tge	%xcc,	0x4
loop_712:
	call	loop_713
	fors	%f25,	%f4,	%f0
	fmovsug	%fcc3,	%f5,	%f30
	edge32	%l5,	%i3,	%o7
loop_713:
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%o2
	call	loop_714
	taddcc	%l1,	0x0F95,	%g3
	fmovdg	%fcc3,	%f18,	%f14
	sra	%o4,	0x0D,	%l2
loop_714:
	brlez	%l0,	loop_715
	fpsub16	%f28,	%f16,	%f24
	call	loop_716
	bn,a	%xcc,	loop_717
loop_715:
	call	loop_718
	fcmpeq16	%f18,	%f10,	%i4
loop_716:
	flushw
loop_717:
	sdiv	%o1,	0x0607,	%i7
loop_718:
	nop
	wr	%g0,	0x23,	%asi
	stba	%o6,	[%l7 + 0x45] %asi
	membar	#Sync
	movre	%g2,	%g4,	%i6
	rdhpr	%htba,	%i1
	call	loop_719
	call	loop_720
	bl,a,pn	%xcc,	loop_721
	fmovsle	%icc,	%f18,	%f10
loop_719:
	tle	%icc,	0x4
loop_720:
	nop
	setx	0x08386A90,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x783BC101,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f5,	%f9
loop_721:
	fpsub16	%f0,	%f6,	%f30
	wr	%g0,	0x2a,	%asi
	stxa	%g1,	[%l7 + 0x60] %asi
	membar	#Sync
	call	loop_722
	movuge	%fcc2,	%l3,	%g7
	array16	%o3,	%g5,	%l6
	orn	%o0,	0x0061,	%i5
loop_722:
	nop
	set	0x24, %l2
	swap	[%l7 + %l2],	%i0
	movrgez	%g6,	%o5,	%i2
	fmovsue	%fcc2,	%f26,	%f21
	nop
	setx	loop_723,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004100001402,	%l0,	%l1
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
	call	loop_724
	pdist	%f28,	%f6,	%f14
	rd	%y,	%l5
loop_723:
	fsrc2	%f24,	%f6
loop_724:
	nop
	setx	0x67FB8FBB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x59A6C5BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f3,	%f0
	rdhpr	%hsys_tick_cmpr,	%l4
	fcmpeq32	%f14,	%f24,	%o7
	nop
	set	0x58, %g7
	stx	%o2,	[%l7 + %g7]
	call	loop_725
	nop
	fitos	%f13,	%f17
	fstox	%f17,	%f6
	and	%i3,	%g3,	%l1
	call	loop_726
loop_725:
	fmovdvs	%xcc,	%f22,	%f16
	movgu	%xcc,	0x51D,	%o4
	nop
	set	0x24, %g1
	stw	%l0,	[%l7 + %g1]
loop_726:
	call	loop_727
	call	loop_728
	fandnot1	%f2,	%f4,	%f4
	fcmpd	%fcc1,	%f0,	%f26
loop_727:
	call	loop_729
loop_728:
	fcmple16	%f14,	%f28,	%l2
	call	loop_730
	fcmpeq16	%f0,	%f6,	%o1
loop_729:
	sdiv	%i4,	0x0A48,	%i7
	fcmpgt32	%f14,	%f30,	%o6
loop_730:
	rdhpr	%htba,	%g2
	tleu	%icc,	0x1
	fmovsgu	%icc,	%f7,	%f21
	call	loop_731
	call	loop_732
	fsrc1	%f28,	%f16
	nop
	setx	0x64BD32CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x985B624C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f23,	%f24
loop_731:
	fmovsne	%icc,	%f30,	%f28
loop_732:
	fmul8x16au	%f15,	%f21,	%f12
	call	loop_733
	fmovdleu	%xcc,	%f10,	%f30
	nop
	setx	0xE3C1580E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xE1638273,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f6,	%f22
	fmovdue	%fcc1,	%f30,	%f22
loop_733:
	te	%icc,	0x3
	call	loop_734
	call	loop_735
	edge8ln	%g4,	%i1,	%i6
	sir	0x05CD
loop_734:
	alignaddr	%g1,	%l3,	%o3
loop_735:
	wr	%g5,	%l6,	%ccr
	call	loop_736
	nop
	setx	0x97E2FC2B8EFA1ED7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f26
	call	loop_737
	array32	%o0,	%i5,	%g7
loop_736:
	movrlez	%i0,	%g6,	%o5
	orncc	%i2,	%l5,	%o7
loop_737:
	nop
	setx	0x16435AB29164E584,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x02E00207,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f0,	%f14
	xnor	%o2,	%i3,	%g3
	srax	%l4,	0x03,	%l1
	rdpr	%pil,	%l0
	fmovsvc	%icc,	%f5,	%f14
	fmovrdgz	%o4,	%f12,	%f16
	fnor	%f12,	%f0,	%f6
	sub	%l2,	0x1677,	%o1
	ldd	[%l7 + 0x20],	%i6
	ble,a	%xcc,	loop_738
	fmovsue	%fcc3,	%f19,	%f23
	xorcc	%i4,	%g2,	%g4
	bmask	%o6,	%i6,	%g1
loop_738:
	nop
	set	0x38, %i1
	stda	%i0,	[%l7 + %i1] 0x22
	membar	#Sync
	rd	%pc,	%o3
	fcmpgt32	%f26,	%f20,	%g5
	call	loop_739
	call	loop_740
	addc	%l3,	0x1A5D,	%o0
	ta	%icc,	0x7
loop_739:
	call	loop_741
loop_740:
	fmovsug	%fcc2,	%f7,	%f17
	movu	%fcc2,	%l6,	%g7
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f2
loop_741:
	call	loop_742
	movgu	%xcc,	%i5,	%g6
	fcmple16	%f16,	%f20,	%o5
	movue	%fcc1,	%i2,	%i0
loop_742:
	fabss	%f24,	%f2
	move	%fcc0,	0x2F5,	%l5
	tge	%xcc,	0x4
	fmovrdgez	%o2,	%f10,	%f12
	nop
	fitos	%f4,	%f15
	fstod	%f15,	%f14
	nop
	setx	0xF76C0C5A2EB402CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x558FF6E69A5DCEE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f28,	%f8
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 34
!	Type a   	: 28
!	Type cti   	: 134
!	Type x   	: 15
!	Type f   	: 150
!	Type i   	: 139
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
	set	0x7,	%g1
	set	0xD,	%g2
	set	0x5,	%g3
	set	0x5,	%g4
	set	0x9,	%g5
	set	0x3,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x0,	%i1
	set	-0x9,	%i2
	set	-0xF,	%i3
	set	-0xB,	%i4
	set	-0xC,	%i5
	set	-0x3,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x412198E6,	%l0
	set	0x07172F3A,	%l1
	set	0x086E8BC3,	%l2
	set	0x74E29241,	%l3
	set	0x43FA6C58,	%l4
	set	0x07605C23,	%l5
	set	0x40B3923A,	%l6
	!# Output registers
	set	-0x0FEE,	%o0
	set	0x06EC,	%o1
	set	-0x19BE,	%o2
	set	-0x1547,	%o3
	set	-0x0DE0,	%o4
	set	-0x1715,	%o5
	set	-0x085B,	%o6
	set	0x0E9E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	bgu,pn	%xcc,	loop_743
	call	loop_744
	wrpr	%i3,	%g3,	%pil
	movneg	%icc,	%o7,	%l4
loop_743:
	call	loop_745
loop_744:
	tvs	%icc,	0x1
	call	loop_746
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f28
loop_745:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%o4
loop_746:
	fmovsge	%fcc2,	%f7,	%f17
	call	loop_747
	membar	0x19
	umul	%l0,	0x1C35,	%o1
	fandnot2s	%f26,	%f1,	%f24
loop_747:
	fpadd32	%f10,	%f22,	%f18
	pdist	%f26,	%f28,	%f14
	fmul8x16al	%f10,	%f25,	%f24
	fmovdneg	%xcc,	%f2,	%f20
	xnorcc	%i7,	%l2,	%i4
	stbar
	fmovsleu	%icc,	%f9,	%f21
	call	loop_748
	array8	%g4,	%g2,	%i6
	movug	%fcc1,	%g1,	%i1
	nop
	setx	0xC8B7510C3E94F0A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x4BF1EC0229DA5B03,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f8,	%f28
loop_748:
	call	loop_749
	srl	%o3,	%g5,	%l3
	fmovda	%icc,	%f30,	%f8
	fnor	%f0,	%f8,	%f8
loop_749:
	call	loop_750
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%o0
	fand	%f2,	%f6,	%f20
	fmovd	%f4,	%f8
loop_750:
	subc	%l6,	%o6,	%i5
	fcmpne32	%f24,	%f6,	%g7
	mulscc	%o5,	%g6,	%i0
	fbn	%fcc3,	loop_751
	swap	[%l7 + 0x28],	%l5
	call	loop_752
	call	loop_753
loop_751:
	call	loop_754
	fmuld8ulx16	%f8,	%f22,	%f14
loop_752:
	call	loop_755
loop_753:
	fornot1s	%f2,	%f0,	%f17
loop_754:
	tpos	%icc,	0x5
	nop
	set	0x62, %o7
	ldstub	[%l7 + %o7],	%o2
loop_755:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x18E, 	%sys_tick_cmpr
	fmovsvc	%xcc,	%f1,	%f0
	fmul8x16	%f22,	%f6,	%f26
	xnor	%g3,	%l4,	%l1
	fpsub16	%f0,	%f26,	%f12
	nop
	fitod	%f7,	%f26
	call	loop_756
	call	loop_757
	wrpr	%o4,	%l0,	%tick
	movg	%icc,	0x051,	%o1
loop_756:
	srl	%i7,	0x11,	%l2
loop_757:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o7
	fors	%f24,	%f10,	%f18
	call	loop_758
	call	loop_759
	fpadd16	%f2,	%f4,	%f8
	tgu	%xcc,	0x7
loop_758:
	fandnot2	%f20,	%f28,	%f26
loop_759:
	fors	%f3,	%f7,	%f7
	fcmpes	%fcc2,	%f23,	%f7
	fpackfix	%f10,	%f16
	call	loop_760
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmul8sux16	%f26,	%f0,	%f16
	set	0x12, %i5
	stba	%g4,	[%l7 + %i5] 0x80
loop_760:
	fnegs	%f4,	%f14
	subcc	%i4,	0x0CA7,	%g2
	ldsh	[%l7 + 0x58],	%i6
	rd	%asi,	%i1
	call	loop_761
	call	loop_762
	call	loop_763
	call	loop_764
loop_761:
	edge32l	%o3,	%g5,	%g1
loop_762:
	call	loop_765
loop_763:
	rdhpr	%htba,	%o0
loop_764:
	call	loop_766
	call	loop_767
loop_765:
	call	loop_768
	fmovdvc	%icc,	%f22,	%f14
loop_766:
	fmovdn	%icc,	%f8,	%f24
loop_767:
	call	loop_769
loop_768:
	fmovdl	%fcc1,	%f30,	%f26
	stx	%l3,	[%l7 + 0x38]
	call	loop_770
loop_769:
	call	loop_771
	tsubcc	%l6,	0x0DD3,	%i5
	call	loop_772
loop_770:
	movcc	%icc,	0x72F,	%o6
loop_771:
	nop
	setx	0x5B8492D8B4E83192,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	call	loop_773
loop_772:
	edge32	%g7,	%g6,	%i0
	call	loop_774
	fba,a	%fcc0,	loop_775
loop_773:
	movl	%xcc,	0x6FD,	%l5
	nop
	setx	0xF9D6E9CC2DD357FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x013BE099,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f10,	%f20
loop_774:
	movn	%fcc0,	0x5C2,	%o2
loop_775:
	call	loop_776
	fmovdul	%fcc0,	%f12,	%f6
	subccc	%i2,	%o5,	%i3
	call	loop_777
loop_776:
	wr	%l4,	%g3,	%sys_tick
	wr	%g0,	0x88,	%asi
	stxa	%o4,	[%l7 + 0x10] %asi
loop_777:
	nop
	setx	0xADBDE7E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x89B12AEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f28,	%f1
	movuge	%fcc1,	%l0,	%o1
	edge8l	%i7,	%l2,	%l1
	call	loop_778
	movu	%fcc2,	%o7,	%g4
	call	loop_779
	rdpr	%wstate,	%g2
loop_778:
	tsubcctv	%i4,	%i1,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCD7, 	%sys_tick_cmpr
loop_779:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%g5
	sra	%o0,	0x02,	%g1
	fmovse	%fcc1,	%f14,	%f28
	call	loop_780
	be,pt	%xcc,	loop_781
	call	loop_782
	movre	%l3,	%i5,	%o6
loop_780:
	fmovrslez	%l6,	%f19,	%f10
loop_781:
	call	loop_783
loop_782:
	andn	%g6,	%i0,	%l5
	fmovsvc	%icc,	%f10,	%f4
	nop
	setx	0x8BC1BAA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA8F2D2CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f12,	%f18
loop_783:
	array8	%g7,	%i2,	%o5
	ldd	[%l7 + 0x70],	%i2
	tge	%xcc,	0x0
	movre	%l4,	%o2,	%g3
	call	loop_784
	call	loop_785
	call	loop_786
	call	loop_787
loop_784:
	fmovsul	%fcc2,	%f15,	%f22
loop_785:
	fmovdul	%fcc1,	%f22,	%f10
loop_786:
	fmovsge	%icc,	%f11,	%f7
loop_787:
	edge16n	%o4,	%l0,	%o1
	call	loop_788
	fpsub16	%f26,	%f0,	%f24
	nop
	setx	0x0E8A,	%l0,	%l1
	sdivx	%i7,	%l1,	%l2
	set	0x1A, %l6
	lduba	[%l7 + %l6] 0x0c,	%o7
loop_788:
	fpsub16s	%f17,	%f1,	%f29
	fcmpne32	%f26,	%f16,	%g2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x68] %asi,	%f11
	rdpr	%wstate,	%i4
	fbue	%fcc1,	loop_789
	fmovsneg	%icc,	%f5,	%f6
	sub	%g4,	%i1,	%o3
	fpadd16	%f22,	%f28,	%f10
loop_789:
	fmovdvc	%icc,	%f16,	%f0
	movlg	%fcc2,	0x76B,	%i6
	smul	%o0,	0x06F4,	%g1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%g5
	andncc	%l3,	0x0EB8,	%i5
	edge32n	%l6,	%o6,	%g6
	call	loop_790
	and	%i0,	0x1460,	%g7
	call	loop_791
	fxnor	%f8,	%f8,	%f14
loop_790:
	rdhpr	%htba,	%l5
	move	%fcc1,	0x7BC,	%o5
loop_791:
	tge	%xcc,	0x3
	sdiv	%i2,	0x0C0B,	%i3
	call	loop_792
	nop
	setx	loop_793,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%o2,	%l4,	%g3
	alignaddr	%o4,	%l0,	%o1
loop_792:
	call	loop_794
loop_793:
	fbge,pt	%fcc3,	loop_795
	call	loop_796
	nop
	setx	0x84618B6A72407643,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFCCCF535,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f22,	%f18
loop_794:
	nop
	set	0x54, %g6
	prefetch	[%l7 + %g6],	 4
loop_795:
	fmovsue	%fcc1,	%f23,	%f26
loop_796:
	tvc	%icc,	0x1
	sdivcc	%i7,	0x12E1,	%l2
	fnands	%f19,	%f5,	%f20
	fbe,pn	%fcc1,	loop_797
	fmovrslez	%o7,	%f22,	%f7
	tl	%xcc,	0x1
	fands	%f14,	%f13,	%f3
loop_797:
	call	loop_798
	fxnors	%f23,	%f11,	%f22
	fmovrdgez	%l1,	%f10,	%f6
	fandnot1	%f22,	%f30,	%f26
loop_798:
	fmovrdlez	%i4,	%f26,	%f28
	membar	0x4B
	fmovdcc	%icc,	%f0,	%f14
	call	loop_799
	wr 	%g0, 	0x5, 	%fprs
	srax	%g4,	%i6,	%o3
	call	loop_800
loop_799:
	call	loop_801
	mulscc	%o0,	%g1,	%g5
	fcmps	%fcc1,	%f13,	%f26
loop_800:
	fcmpgt32	%f0,	%f22,	%l3
loop_801:
	siam	0x1
	call	loop_802
	call	loop_803
	fmovsuge	%fcc3,	%f10,	%f9
	fpsub16s	%f13,	%f24,	%f26
loop_802:
	edge8	%l6,	%o6,	%i5
loop_803:
	fpack32	%f20,	%f4,	%f30
	fands	%f10,	%f7,	%f4
	movneg	%icc,	0x5D9,	%g6
	fzeros	%f27
	nop
	setx	0x0574,	%l0,	%i0
	udivcc	%g7,	%i0,	%l5
	call	loop_804
	membar	0x66
	fand	%f16,	%f24,	%f10
	fandnot2	%f20,	%f12,	%f2
loop_804:
	fnand	%f14,	%f26,	%f4
	fmovsul	%fcc0,	%f10,	%f31
	sll	%i2,	%i3,	%o2
	nop
	setx	0x10D2,	%l0,	%g3
	udiv	%o5,	%g3,	%l4
	fmovrslez	%o4,	%f26,	%f15
	call	loop_805
	fands	%f29,	%f7,	%f16
	call	loop_806
	xnorcc	%l0,	%i7,	%o1
loop_805:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge8l	%o7,	%l2,	%i4
loop_806:
	tsubcctv	%l1,	0x1816,	%g2
	call	loop_807
	call	loop_808
	rd	%pc,	%i1
	edge8n	%i6,	%g4,	%o0
loop_807:
	siam	0x6
loop_808:
	alignaddr	%g1,	%g5,	%o3
	and	%l6,	%o6,	%l3
	call	loop_809
	fmul8x16au	%f5,	%f13,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB33, 	%hsys_tick_cmpr
	andn	%g6,	0x1BB8,	%i0
loop_809:
	call	loop_810
	andncc	%l5,	%g7,	%i2
	nop
	setx	loop_811,	%l0,	%l1
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
	movrgz	%o2,	%i3,	%o5
loop_810:
	taddcc	%g3,	0x1998,	%l4
	rd	%ccr,	%o4
loop_811:
	fmovrse	%i7,	%f29,	%f3
	sllx	%l0,	0x16,	%o1
	rdpr	%gl,	%o7
	fpack16	%f26,	%f9
	set	0x74, %o5
	swapa	[%l7 + %o5] 0x88,	%i4
	fpsub16	%f14,	%f24,	%f10
	fmovrsgez	%l1,	%f8,	%f10
	rdhpr	%hintp,	%l2
	and	%i1,	%i6,	%g2
	fandnot2	%f24,	%f26,	%f12
	call	loop_812
	call	loop_813
	nop
	set	0x50, %i0
	flush	%l7 + %i0
	nop
	fitod	%f0,	%f14
	fdtos	%f14,	%f19
loop_812:
	edge8l	%g4,	%o0,	%g1
loop_813:
	xor	%o3,	0x1D9B,	%l6
	fba,a,pn	%fcc2,	loop_814
	srax	%o6,	0x12,	%g5
	call	loop_815
	nop
	setx	0x1738,	%l0,	%g6
	udiv	%l3,	%g6,	%i5
loop_814:
	fmovsleu	%icc,	%f30,	%f24
	rdhpr	%hpstate,	%i0
loop_815:
	movre	%g7,	%l5,	%i2
	bcc,a,pt	%icc,	loop_816
	movle	%fcc2,	%o2,	%o5
	fandnot1	%f22,	%f4,	%f16
	bleu,pn	%xcc,	loop_817
loop_816:
	call	loop_818
	fpmerge	%f28,	%f24,	%f6
	umulcc	%g3,	0x1A46,	%i3
loop_817:
	fnot1	%f16,	%f6
loop_818:
	tcc	%xcc,	0x2
	fmovdcs	%icc,	%f8,	%f6
	brlez,a	%l4,	loop_819
	fzeros	%f7
	move	%fcc1,	%o4,	%i7
	brlz	%l0,	loop_820
loop_819:
	add	%o1,	%o7,	%l1
	call	loop_821
	rdhpr	%htba,	%i4
loop_820:
	fmovdleu	%icc,	%f24,	%f4
	nop
	set	0x7E, %o6
	stb	%i1,	[%l7 + %o6]
loop_821:
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f22
	andcc	%l2,	0x00E6,	%i6
	movuge	%fcc0,	0x006,	%g2
	ldstub	[%l7 + 0x77],	%o0
	tge	%icc,	0x3
	nop
	setx	0x12205917,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xC47C2B5C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f1,	%f18
	fpack16	%f6,	%f4
	fpackfix	%f30,	%f22
	movrlz	%g1,	%o3,	%g4
	edge8	%l6,	%o6,	%g5
	movge	%icc,	%l3,	%i5
	call	loop_822
	orcc	%i0,	%g7,	%g6
	flushw
	fcmpgt16	%f8,	%f4,	%l5
loop_822:
	rd	%y,	%i2
	fmovdgu	%icc,	%f2,	%f6
	nop
	setx	0x037E2EC6E950EC00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC6751E1C411DB879,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f8,	%f4
	call	loop_823
	rd	%sys_tick_cmpr,	%o5
	nop
	set	0x48, %g2
	std	%g2,	[%l7 + %g2]
	edge8	%i3,	%o2,	%l4
loop_823:
	call	loop_824
	movvs	%xcc,	%i7,	%l0
	fmovsleu	%xcc,	%f9,	%f0
	call	loop_825
loop_824:
	fcmpes	%fcc0,	%f8,	%f16
	fmovsne	%xcc,	%f1,	%f18
	fmovsue	%fcc3,	%f25,	%f25
loop_825:
	fmovdneg	%icc,	%f16,	%f6
	fmovdneg	%icc,	%f28,	%f18
	rd	%ccr,	%o1
	call	loop_826
	array8	%o7,	%l1,	%i4
	fmul8x16al	%f17,	%f22,	%f28
	rdpr	%otherwin,	%o4
loop_826:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB7A, 	%hsys_tick_cmpr
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%i6
	andn	%o0,	%g2,	%g1
	flushw
	fbl,pt	%fcc3,	loop_827
	fmovdo	%fcc0,	%f4,	%f18
	call	loop_828
	call	loop_829
loop_827:
	xnorcc	%o3,	%g4,	%o6
	set	0x08, %i3
	lduwa	[%l7 + %i3] 0x80,	%l6
loop_828:
	fzero	%f6
loop_829:
	xnor	%l3,	%g5,	%i5
	fmovdule	%fcc3,	%f0,	%f28
	call	loop_830
	nop
	setx	0xD3D6C574,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x76C660FA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f9,	%f13
	fmovdul	%fcc3,	%f28,	%f4
	rdpr	%cleanwin,	%i0
loop_830:
	fcmpne16	%f2,	%f16,	%g7
	call	loop_831
	call	loop_832
	call	loop_833
	bcs,pt	%xcc,	loop_834
loop_831:
	fbue,a	%fcc2,	loop_835
loop_832:
	call	loop_836
loop_833:
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f6
loop_834:
	call	loop_837
loop_835:
	fnor	%f4,	%f2,	%f0
loop_836:
	sll	%l5,	%i2,	%o5
	flushw
loop_837:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x31] %asi,	%g3
	nop
	setx	0x02CB,	%l0,	%i3
	sdivcc	%g6,	%i3,	%o2
	fbg	%fcc1,	loop_838
	call	loop_839
	fmovrdlez	%i7,	%f10,	%f14
	fmovse	%xcc,	%f15,	%f8
loop_838:
	fsrc2s	%f17,	%f25
loop_839:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8E2, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x3C],	%o1
	movrlz	%l1,	%i4,	%o4
	udiv	%l2,	0x0471,	%o7
	fmovslg	%fcc2,	%f30,	%f26
	nop
	setx	0x1BBC2AA41EE0E911,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC157E867864AE3CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f8,	%f0
	edge32	%i6,	%o0,	%g2
	tl	%xcc,	0x1
	edge8ln	%g1,	%o3,	%i1
	fmovdug	%fcc3,	%f24,	%f30
	fmovscs	%icc,	%f20,	%f0
	fmovde	%icc,	%f26,	%f2
	bg	%xcc,	loop_840
	fcmpd	%fcc0,	%f12,	%f30
	call	loop_841
	nop
	setx	0x10D6,	%l0,	%l6
	udivcc	%g4,	%l6,	%o6
loop_840:
	call	loop_842
	addc	%l3,	0x056A,	%g5
loop_841:
	call	loop_843
	fandnot1s	%f21,	%f7,	%f0
loop_842:
	rdhpr	%hpstate,	%i5
	tvs	%icc,	0x6
loop_843:
	call	loop_844
	mova	%xcc,	%i0,	%l5
	fmuld8sux16	%f7,	%f15,	%f6
	fcmple32	%f18,	%f16,	%g7
loop_844:
	fmovrsgez	%i2,	%f26,	%f27
	fmovsl	%icc,	%f21,	%f16
	fmuld8sux16	%f20,	%f29,	%f4
	bne,pt	%xcc,	loop_845
	call	loop_846
	addcc	%o5,	%g3,	%i3
	call	loop_847
loop_845:
	fmovdug	%fcc2,	%f18,	%f2
loop_846:
	movule	%fcc3,	0x333,	%o2
	rdhpr	%htba,	%g6
loop_847:
	call	loop_848
	fmovsa	%icc,	%f3,	%f20
	call	loop_849
	fmovse	%icc,	%f21,	%f7
loop_848:
	fnors	%f13,	%f12,	%f2
	set	0x64, %i2
	lda	[%l7 + %i2] 0x89,	%f2
loop_849:
	call	loop_850
	fnot2	%f4,	%f18
	fmul8x16	%f12,	%f10,	%f2
	call	loop_851
loop_850:
	call	loop_852
	movg	%icc,	%l0,	%i7
	fmovso	%fcc0,	%f3,	%f7
loop_851:
	call	loop_853
loop_852:
	be,pn	%xcc,	loop_854
	tleu	%icc,	0x1
	flushw
loop_853:
	nop
	setx	loop_855,	%l0,	%l1
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
loop_854:
	tcc	%icc,	0x3
	call	loop_856
	call	loop_857
loop_855:
	call	loop_858
	call	loop_859
loop_856:
	fmovdcs	%xcc,	%f4,	%f0
loop_857:
	fsrc2	%f28,	%f12
loop_858:
	movre	%l4,	%l1,	%o1
loop_859:
	fabsd	%f12,	%f16
	fnegs	%f27,	%f30
	movle	%fcc0,	%o4,	%i4
	movleu	%xcc,	%l2,	%o7
	edge32n	%o0,	%i6,	%g2
	call	loop_860
	smul	%g1,	%o3,	%g4
	fmovdlg	%fcc2,	%f2,	%f20
	call	loop_861
loop_860:
	fsrc2	%f2,	%f2
	movvc	%icc,	0x008,	%i1
	tvs	%xcc,	0x4
loop_861:
	call	loop_862
	call	loop_863
	tcc	%xcc,	0x6
	fandnot2	%f4,	%f2,	%f12
loop_862:
	fornot2s	%f17,	%f12,	%f6
loop_863:
	fandnot1	%f16,	%f14,	%f20
	call	loop_864
	fpsub16s	%f3,	%f15,	%f18
	call	loop_865
	rdpr	%tl,	%l6
loop_864:
	sdivcc	%o6,	0x1A00,	%g5
	fsrc1	%f26,	%f10
loop_865:
	and	%i5,	0x17FB,	%i0
	nop
	setx	0x1BF4,	%l0,	%l3
	sdivcc	%l5,	%l3,	%i2
	edge32n	%g7,	%g3,	%i3
	call	loop_866
	movu	%fcc0,	0x591,	%o5
	movue	%fcc3,	%o2,	%l0
	call	loop_867
loop_866:
	be	%xcc,	loop_868
	be	%icc,	loop_869
	call	loop_870
loop_867:
	te	%icc,	0x5
loop_868:
	mulscc	%i7,	%g6,	%l4
loop_869:
	xnorcc	%l1,	0x1034,	%o4
loop_870:
	fandnot1	%f10,	%f26,	%f14
	call	loop_871
	wr	%i4,	0x1E77,	%set_softint
	rdhpr	%ver,	%o1
	call	loop_872
loop_871:
	ta	%icc,	0x2
	ldd	[%l7 + 0x58],	%l2
	nop
	set	0x20, %o1
	ldstub	[%l7 + %o1],	%o0
loop_872:
	sra	%o7,	0x11,	%i6
	sdivcc	%g2,	0x1CE4,	%g1
	srax	%g4,	%o3,	%i1
	edge16ln	%o6,	%l6,	%i5
	call	loop_873
	nop
	set	0x20, %l5
	prefetch	[%l7 + %l5],	 2
	udivx	%i0,	0x0054,	%l5
	srl	%g5,	0x05,	%i2
loop_873:
	call	loop_874
	call	loop_875
	fmovdule	%fcc3,	%f8,	%f22
	te	%xcc,	0x7
loop_874:
	call	loop_876
loop_875:
	fones	%f19
	xorcc	%l3,	%g3,	%i3
	bge,a	%xcc,	loop_877
loop_876:
	fmovdge	%fcc0,	%f2,	%f0
	call	loop_878
	call	loop_879
loop_877:
	fsrc2	%f26,	%f30
	fnegd	%f30,	%f6
loop_878:
	sethi	0x00F8,	%o5
loop_879:
	call	loop_880
loop_880:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 31
!	Type a   	: 30
!	Type x   	: 12
!	Type cti   	: 138
!	Type f   	: 147
!	Type i   	: 142
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
	set	0xA,	%g1
	set	0xB,	%g2
	set	0xA,	%g3
	set	0xB,	%g4
	set	0x8,	%g5
	set	0xA,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x9,	%i1
	set	-0x6,	%i2
	set	-0x2,	%i3
	set	-0x7,	%i4
	set	-0x9,	%i5
	set	-0x8,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x01ED0439,	%l0
	set	0x34F4A2BD,	%l1
	set	0x571167D7,	%l2
	set	0x5DF067FF,	%l3
	set	0x472D0E66,	%l4
	set	0x00841981,	%l5
	set	0x51141299,	%l6
	!# Output registers
	set	0x0316,	%o0
	set	0x1C0F,	%o1
	set	-0x09A2,	%o2
	set	-0x0FA5,	%o3
	set	-0x14C2,	%o4
	set	0x003E,	%o5
	set	0x1962,	%o6
	set	-0x1293,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	movg	%icc,	%g7,	%l0
	movre	%i7,	0x0D9,	%o2
	stbar
	movcs	%icc,	0x526,	%l4
	fnot1s	%f10,	%f21
	andncc	%l1,	0x1B91,	%g6
	taddcc	%i4,	%o4,	%l2
	rdpr	%canrestore,	%o0
	sra	%o7,	0x08,	%i6
	nop
	setx	0x1E91,	%l0,	%g1
	udiv	%g2,	%g1,	%g4
	nop
	setx	0xC36EAD95,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x329392AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f7,	%f24
	wrpr	%o3,	0x10DD,	%cwp
	nop
	setx	0x94CEE583,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x334B212F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f9,	%f17
	call	loop_881
	nop
	setx	0x1CE3,	%l0,	%i1
	sdiv	%o1,	%i1,	%l6
	call	loop_882
	fmovrdne	%o6,	%f14,	%f26
loop_881:
	fpsub32	%f10,	%f14,	%f26
	xor	%i0,	%l5,	%g5
loop_882:
	movleu	%icc,	%i5,	%l3
	movn	%fcc2,	0x398,	%g3
	fmovsge	%xcc,	%f10,	%f13
	bvc,pt	%xcc,	loop_883
	call	loop_884
	fmovsl	%xcc,	%f13,	%f12
	fmovse	%fcc3,	%f25,	%f31
loop_883:
	call	loop_885
loop_884:
	movrlez	%i2,	%o5,	%i3
	call	loop_886
	call	loop_887
loop_885:
	fmuld8ulx16	%f7,	%f6,	%f6
	bvc	%xcc,	loop_888
loop_886:
	flushw
loop_887:
	call	loop_889
	fbge,a,pn	%fcc0,	loop_890
loop_888:
	call	loop_891
	call	loop_892
loop_889:
	fmovrsgz	%g7,	%f8,	%f12
loop_890:
	call	loop_893
loop_891:
	fnors	%f30,	%f20,	%f17
loop_892:
	call	loop_894
	movpos	%xcc,	0x05C,	%i7
loop_893:
	call	loop_895
	call	loop_896
loop_894:
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f4
	call	loop_897
loop_895:
	array16	%l0,	%l4,	%l1
loop_896:
	bgu,a,pt	%xcc,	loop_898
	bge,pt	%icc,	loop_899
loop_897:
	movug	%fcc3,	0x37A,	%g6
	wr	%i4,	0x1CDB,	%ccr
loop_898:
	srl	%o4,	0x11,	%o2
loop_899:
	call	loop_900
	fcmpd	%fcc0,	%f2,	%f14
	wrpr	%o0,	0x020C,	%cwp
	nop
	setx	0xD0699AE1F80BAAD1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x25DF82BC11E7B5AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f14,	%f28
loop_900:
	edge32ln	%o7,	%l2,	%i6
	tsubcctv	%g1,	0x022F,	%g4
	fmovd	%f18,	%f2
	ble,pt	%xcc,	loop_901
	rdpr	%cleanwin,	%o3
	rdpr	%cansave,	%o1
	fnot1s	%f28,	%f15
loop_901:
	fbue,a,pt	%fcc3,	loop_902
	call	loop_903
	call	loop_904
	call	loop_905
loop_902:
	call	loop_906
loop_903:
	call	loop_907
loop_904:
	fmovrdne	%i1,	%f16,	%f0
loop_905:
	fors	%f14,	%f18,	%f25
loop_906:
	fnot1	%f2,	%f4
loop_907:
	nop
	setx	loop_908,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031100001402,	%l0,	%l1
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
	fexpand	%f9,	%f20
	nop
	fitod	%f2,	%f6
	fdtoi	%f6,	%f14
	call	loop_909
loop_908:
	brgez,a,pt	%g2,	loop_910
	call	loop_911
	nop
	setx	0xC6DBD46C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x6C5F67C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f0,	%f21
loop_909:
	sra	%l6,	%i0,	%l5
loop_910:
	call	loop_912
loop_911:
	rdhpr	%ver,	%o6
	call	loop_913
	edge16ln	%g5,	%i5,	%l3
loop_912:
	call	loop_914
	fmovso	%fcc0,	%f3,	%f16
loop_913:
	orcc	%g3,	0x198A,	%o5
	nop
	setx	0x767F76BAE715B658,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_914:
	call	loop_915
	nop
	fitod	%f19,	%f28
	call	loop_916
	call	loop_917
loop_915:
	addc	%i3,	0x0145,	%i2
	movrgz	%g7,	0x08C,	%l0
loop_916:
	fmovda	%xcc,	%f12,	%f2
loop_917:
	movneg	%icc,	0x59F,	%l4
	fpmerge	%f18,	%f30,	%f16
	fmovrsne	%i7,	%f9,	%f14
	flushw
	call	loop_918
	fbg,a	%fcc1,	loop_919
	call	loop_920
	andcc	%l1,	%g6,	%i4
loop_918:
	fpsub16s	%f27,	%f17,	%f21
loop_919:
	fmovsle	%icc,	%f11,	%f18
loop_920:
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f20
	membar	0x4D
	fcmpgt32	%f16,	%f2,	%o4
	nop
	fitos	%f25,	%f0
	tne	%xcc,	0x6
	fmovsne	%fcc0,	%f8,	%f5
	call	loop_921
	srax	%o2,	0x14,	%o7
	mova	%icc,	%l2,	%i6
	te	%icc,	0x2
loop_921:
	call	loop_922
	call	loop_923
	sra	%g1,	%g4,	%o3
	fmovse	%icc,	%f2,	%f27
loop_922:
	movrgez	%o0,	0x0B0,	%i1
loop_923:
	bvc,pn	%icc,	loop_924
	rdhpr	%hpstate,	%g2
	movul	%fcc1,	0x410,	%o1
	array32	%i0,	%l6,	%o6
loop_924:
	fornot2s	%f1,	%f8,	%f5
	bvc,pn	%xcc,	loop_925
	fmovde	%fcc2,	%f22,	%f4
	xnorcc	%g5,	0x1BE8,	%l5
	movue	%fcc0,	%i5,	%g3
loop_925:
	fnot2	%f10,	%f4
	call	loop_926
	taddcctv	%o5,	%l3,	%i2
	call	loop_927
	fmovsg	%icc,	%f13,	%f25
loop_926:
	movrgez	%i3,	%l0,	%g7
	fpadd32s	%f11,	%f15,	%f24
loop_927:
	fsrc2s	%f19,	%f2
	fmovdn	%fcc3,	%f26,	%f28
	fmovsule	%fcc2,	%f21,	%f6
	tcs	%icc,	0x4
	fmovsleu	%xcc,	%f29,	%f12
	fnegd	%f12,	%f20
	movge	%icc,	%i7,	%l1
	wr 	%g0, 	0x5, 	%fprs
	edge16l	%g6,	%i4,	%o4
	edge8ln	%o2,	%l2,	%i6
	wrpr	%o7,	0x01A0,	%pil
	udiv	%g4,	0x12EF,	%g1
	call	loop_928
	fmovsu	%fcc2,	%f17,	%f30
	call	loop_929
	call	loop_930
loop_928:
	call	loop_931
	call	loop_932
loop_929:
	fmovdleu	%xcc,	%f24,	%f12
loop_930:
	tleu	%icc,	0x7
loop_931:
	fors	%f3,	%f18,	%f15
loop_932:
	brnz,pn	%o3,	loop_933
	fmovdn	%xcc,	%f16,	%f20
	nop
	fitos	%f1,	%f26
	fstox	%f26,	%f2
	fmovscs	%icc,	%f23,	%f14
loop_933:
	nop
	setx	0x11AE,	%l0,	%g2
	sdivcc	%o0,	%g2,	%i1
	call	loop_934
	fsrc1	%f8,	%f12
	fmovsuge	%fcc0,	%f12,	%f24
	fmovsvs	%icc,	%f1,	%f17
loop_934:
	fpadd32	%f2,	%f24,	%f12
	tsubcctv	%i0,	0x149E,	%o1
	fpadd32	%f0,	%f4,	%f28
	call	loop_935
	nop
	setx	0x0A09,	%l0,	%o6
	udivcc	%l6,	%o6,	%g5
	nop
	setx	0x3E4774A26920A348,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f14
	faligndata	%f22,	%f30,	%f10
loop_935:
	fbl,a,pt	%fcc2,	loop_936
	call	loop_937
	edge32l	%i5,	%l5,	%o5
	call	loop_938
loop_936:
	fmovdgu	%icc,	%f16,	%f26
loop_937:
	siam	0x4
	brlz,a,pn	%g3,	loop_939
loop_938:
	fnand	%f26,	%f26,	%f24
	edge8l	%i2,	%i3,	%l3
	fpsub32	%f10,	%f12,	%f0
loop_939:
	call	loop_940
	call	loop_941
	call	loop_942
	andncc	%l0,	%i7,	%l1
loop_940:
	rd	%pc,	%l4
loop_941:
	call	loop_943
loop_942:
	subcc	%g6,	%i4,	%g7
	array16	%o2,	%o4,	%i6
	fpadd32s	%f28,	%f24,	%f18
loop_943:
	nop
	setx	0x0119,	%l0,	%g4
	udivx	%l2,	%g4,	%o7
	xnorcc	%o3,	%g1,	%o0
	call	loop_944
	call	loop_945
	tn	%xcc,	0x5
	bn,a	%xcc,	loop_946
loop_944:
	fpadd32	%f6,	%f26,	%f6
loop_945:
	taddcctv	%i1,	%i0,	%o1
	ldsw	[%l7 + 0x4C],	%g2
loop_946:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l6,	%o6
	call	loop_947
	movuge	%fcc2,	%i5,	%l5
	set	0x30, %g5
	sta	%f13,	[%l7 + %g5] 0x0c
loop_947:
	nop
	setx	0x6FAC516F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xBB4EB77D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f8,	%f29
	fzero	%f16
	rdpr	%otherwin,	%o5
	fmovdug	%fcc2,	%f14,	%f18
	tne	%xcc,	0x5
	call	loop_948
	fblg,pn	%fcc1,	loop_949
	call	loop_950
	fnors	%f0,	%f23,	%f29
loop_948:
	movg	%xcc,	%g3,	%i2
loop_949:
	rd	%sys_tick_cmpr,	%i3
loop_950:
	call	loop_951
	call	loop_952
	fpack32	%f24,	%f14,	%f30
	array16	%g5,	%l0,	%i7
loop_951:
	alignaddrl	%l3,	%l4,	%g6
loop_952:
	movpos	%icc,	0x57F,	%i4
	nop
	setx	0x0986,	%l0,	%o2
	udiv	%l1,	%o2,	%o4
	call	loop_953
	mova	%xcc,	0x1E3,	%i6
	wr	%l2,	0x1671,	%ccr
	fmovdcc	%icc,	%f4,	%f24
loop_953:
	taddcc	%g4,	%o7,	%o3
	fbe,a	%fcc0,	loop_954
	tcc	%xcc,	0x1
	fnand	%f22,	%f28,	%f4
	bge	%icc,	loop_955
loop_954:
	call	loop_956
	tleu	%xcc,	0x2
	call	loop_957
loop_955:
	call	loop_958
loop_956:
	call	loop_959
	bvs,a,pt	%icc,	loop_960
loop_957:
	udiv	%g7,	0x10BE,	%g1
loop_958:
	nop
	setx	0x0BE2,	%l0,	%i1
	udivcc	%o0,	%i1,	%o1
loop_959:
	fcmple32	%f16,	%f8,	%i0
loop_960:
	fcmped	%fcc1,	%f28,	%f10
	fcmple16	%f26,	%f24,	%l6
	movu	%fcc0,	0x232,	%g2
	fcmpes	%fcc2,	%f7,	%f5
	brz,a,pt	%o6,	loop_961
	fmovdneg	%xcc,	%f12,	%f24
	fandnot1s	%f8,	%f25,	%f28
	rd	%fprs,	%i5
loop_961:
	fbug,pn	%fcc3,	loop_962
	ld	[%l7 + 0x20],	%f10
	subcc	%o5,	0x18D6,	%l5
	rdpr	%tl,	%g3
loop_962:
	call	loop_963
	tn	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i3
loop_963:
	call	loop_964
	edge32ln	%i2,	%l0,	%g5
	call	loop_965
	brnz	%l3,	loop_966
loop_964:
	fpadd32	%f14,	%f16,	%f2
	bn,a,pn	%icc,	loop_967
loop_965:
	srlx	%l4,	0x0B,	%g6
loop_966:
	movu	%fcc3,	%i7,	%l1
	call	loop_968
loop_967:
	nop
	set	0x25, %l3
	ldsb	[%l7 + %l3],	%i4
	call	loop_969
	fcmple16	%f6,	%f2,	%o4
loop_968:
	movrgez	%o2,	%i6,	%g4
	nop
	setx	0xC09938E0623C2E2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x602512BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f28,	%f0
loop_969:
	udivx	%o7,	0x0C7E,	%l2
	edge32ln	%g7,	%g1,	%o3
	rdpr	%tl,	%o0
	fmovscc	%xcc,	%f26,	%f12
	tvc	%icc,	0x0
	call	loop_970
	call	loop_971
	movug	%fcc2,	%i1,	%i0
	call	loop_972
loop_970:
	nop
	setx	loop_973,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012100001400,	%l0,	%l1
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
loop_971:
	brgez	%l6,	loop_974
	membar	0x22
loop_972:
	call	loop_975
loop_973:
	fmovso	%fcc0,	%f9,	%f21
loop_974:
	fmovsug	%fcc1,	%f14,	%f27
	fmovslg	%fcc0,	%f19,	%f21
loop_975:
	xnorcc	%g2,	%o6,	%i5
	taddcc	%o5,	0x0F57,	%o1
	fbu,pt	%fcc3,	loop_976
	call	loop_977
	movule	%fcc3,	0x4BB,	%l5
	edge16ln	%g3,	%i3,	%i2
loop_976:
	wr	%l0,	0x17DA,	%softint
loop_977:
	bn,a,pn	%xcc,	loop_978
	call	loop_979
	fmovsuge	%fcc2,	%f5,	%f30
	movne	%fcc0,	0x166,	%l3
loop_978:
	fmovdleu	%icc,	%f22,	%f26
loop_979:
	fbg,pt	%fcc3,	loop_980
	edge32n	%l4,	%g5,	%g6
	fmovspos	%icc,	%f3,	%f5
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd0
loop_980:
	fmovduge	%fcc0,	%f22,	%f20
	fmovrdgz	%l1,	%f30,	%f16
	call	loop_981
	fnot2s	%f6,	%f6
	call	loop_982
	nop
	setx	loop_983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011200001402,	%l0,	%l1
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
loop_981:
	smul	%i4,	0x08DA,	%o4
	fands	%f13,	%f7,	%f24
loop_982:
	call	loop_984
loop_983:
	tl	%xcc,	0x0
	fzero	%f26
	fmovsug	%fcc2,	%f19,	%f28
loop_984:
	movo	%fcc3,	0x337,	%o2
	movue	%fcc1,	0x2DB,	%i7
	edge16l	%g4,	%i6,	%l2
	rdpr	%cansave,	%g7
	fandnot1	%f26,	%f22,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%o7
	wrpr	%o3,	%i1,	%pil
	fpack32	%f14,	%f20,	%f18
	movug	%fcc3,	0x404,	%i0
	popc	%l6,	%o0
	call	loop_985
	movge	%fcc3,	%g2,	%i5
	fnot2s	%f14,	%f6
	movleu	%icc,	0x155,	%o6
loop_985:
	rd	%pc,	%o5
	fnors	%f0,	%f18,	%f1
	siam	0x6
	tgu	%xcc,	0x3
	call	loop_986
	fmovdgu	%icc,	%f4,	%f12
	fpmerge	%f1,	%f6,	%f18
	mulx	%l5,	%g3,	%i3
loop_986:
	fcmpes	%fcc3,	%f19,	%f27
	call	loop_987
	call	loop_988
	ta	%icc,	0x1
	fmovsl	%icc,	%f22,	%f19
loop_987:
	tsubcc	%i2,	0x0846,	%l0
loop_988:
	call	loop_989
	call	loop_990
	pdist	%f22,	%f12,	%f14
	nop
	fitos	%f14,	%f19
	fstox	%f19,	%f24
loop_989:
	fmovso	%fcc3,	%f13,	%f27
loop_990:
	sra	%l3,	0x07,	%o1
	fcmped	%fcc2,	%f12,	%f26
	call	loop_991
	nop
	set	0x68, %i7
	std	%l4,	[%l7 + %i7]
	call	loop_992
	call	loop_993
loop_991:
	orncc	%g6,	%g5,	%i4
	movne	%icc,	%l1,	%o2
loop_992:
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f12
loop_993:
	movug	%fcc3,	0x231,	%o4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd8
	tsubcc	%i7,	0x1A56,	%i6
	call	loop_994
	fmovdle	%fcc3,	%f24,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_995
loop_994:
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%g4
	tsubcc	%o7,	%o3,	%i1
	fmovrdlez	%i0,	%f14,	%f30
loop_995:
	tsubcctv	%l6,	%g1,	%g2
	edge32l	%i5,	%o6,	%o0
	fmovsle	%xcc,	%f20,	%f14
	nop
	fitos	%f1,	%f20
	fstox	%f20,	%f12
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o5
	call	loop_996
	call	loop_997
	fmovsul	%fcc2,	%f8,	%f5
	nop
	setx	0x1637,	%l0,	%l5
	udivx	%g3,	%l5,	%i3
loop_996:
	ble	%icc,	loop_998
loop_997:
	fmovslg	%fcc3,	%f25,	%f6
	ld	[%l7 + 0x1C],	%f10
	rdhpr	%htba,	%i2
loop_998:
	orcc	%l0,	0x183A,	%o1
	alignaddr	%l3,	%l4,	%g5
	call	loop_999
	orncc	%i4,	0x0729,	%l1
	edge8l	%o2,	%o4,	%g6
	fmovscc	%xcc,	%f26,	%f26
loop_999:
	sethi	0x11D1,	%i7
	fnegd	%f28,	%f24
	call	loop_1000
	movule	%fcc1,	0x06C,	%l2
	call	loop_1001
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1000:
	rdpr	%pil,	%g7
	fmovrdgz	%i6,	%f10,	%f28
loop_1001:
	mulscc	%g4,	0x0AA1,	%o7
	fpackfix	%f18,	%f17
	wrpr 	%g0, 	0x0, 	%gl
	fmovsn	%fcc3,	%f13,	%f30
	rd	%fprs,	%o3
	tn	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD0A, 	%hsys_tick_cmpr
	fmuld8ulx16	%f19,	%f0,	%f8
	fmovsug	%fcc1,	%f30,	%f11
	ldsb	[%l7 + 0x52],	%g2
	sir	0x00A5
	smul	%i0,	%i5,	%o6
	srl	%o5,	0x05,	%g3
	orncc	%l5,	%o0,	%i2
	call	loop_1002
	fmovs	%f11,	%f9
	ld	[%l7 + 0x28],	%f24
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1002:
	call	loop_1003
	edge16n	%i3,	%l0,	%o1
	fpadd32s	%f18,	%f10,	%f3
	fornot1s	%f19,	%f25,	%f20
loop_1003:
	fandnot1s	%f6,	%f27,	%f7
	fandnot1s	%f19,	%f3,	%f13
	call	loop_1004
	fmovdle	%icc,	%f10,	%f10
	sethi	0x124E,	%l4
	movn	%fcc2,	%g5,	%l3
loop_1004:
	move	%xcc,	0x6EC,	%i4
	sdivx	%l1,	0x0D6F,	%o2
	fmovdgu	%icc,	%f22,	%f6
	fpackfix	%f2,	%f23
	call	loop_1005
	bvs,a	%xcc,	loop_1006
	edge8n	%o4,	%g6,	%i7
	alignaddrl	%g7,	%l2,	%g4
loop_1005:
	fmovdvs	%icc,	%f8,	%f4
loop_1006:
	fpadd16s	%f11,	%f9,	%f5
	call	loop_1007
	orcc	%i6,	0x1CAE,	%i1
	call	loop_1008
	call	loop_1009
loop_1007:
	fmovsgu	%icc,	%f13,	%f8
	fmovsu	%fcc0,	%f27,	%f7
loop_1008:
	call	loop_1010
loop_1009:
	call	loop_1011
	fnors	%f22,	%f6,	%f20
	call	loop_1012
loop_1010:
	tcs	%icc,	0x2
loop_1011:
	fmovsge	%icc,	%f13,	%f23
	call	loop_1013
loop_1012:
	fbl,a,pn	%fcc0,	loop_1014
	call	loop_1015
	mova	%fcc1,	0x24C,	%o7
loop_1013:
	tne	%icc,	0x5
loop_1014:
	call	loop_1016
loop_1015:
	fnor	%f8,	%f4,	%f28
	rd	%ccr,	%o3
	call	loop_1017
loop_1016:
	fpadd16s	%f13,	%f21,	%f20
	movgu	%xcc,	%g1,	%g2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc3
loop_1017:
	fmovse	%xcc,	%f31,	%f11
	nop
	setx	0x108F,	%l0,	%i0
	sdivcc	%l6,	%i0,	%i5
	call	loop_1018
	rdpr	%pil,	%o6
	faligndata	%f18,	%f8,	%f24
	nop
	setx	0x9FBC5B7623246B84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x2D1C8C34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f18,	%f22
loop_1018:
	movrgez	%g3,	%o5,	%l5
	call	loop_1019
	call	loop_1020
	bn,a	%xcc,	loop_1021
	call	loop_1022
loop_1019:
	call	loop_1023
loop_1020:
	call	loop_1024
loop_1021:
	tsubcctv	%i2,	0x086D,	%i3
loop_1022:
	movrlez	%o0,	0x3A8,	%o1
loop_1023:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l4,	%l0
loop_1024:
	wrpr 	%g0, 	0x2, 	%gl

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x2E2, 	%hsys_tick_cmpr
	sub	%o4,	0x0FB6,	%i4
	mulscc	%g6,	0x0A0E,	%i7
	call	loop_1025
	mulx	%l2,	0x0198,	%g4
	fmovsge	%icc,	%f4,	%f8
	nop
	setx	0x894A3CD4494F8259,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x28E92CD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsmuld	%f16,	%f2,	%f28
loop_1025:
	nop
	setx	0x0E06,	%l0,	%g7
	sdiv	%i6,	%g7,	%i1
	fpsub32	%f14,	%f14,	%f16
	fmovsue	%fcc3,	%f17,	%f4
	call	loop_1026
	fsrc2s	%f17,	%f3
	nop
	fitos	%f29,	%f31
	nop
	setx	0x1927053FC2FF7311,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f22
loop_1026:
	wrpr	%o7,	0x19B1,	%pil

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE98, 	%hsys_tick_cmpr
	fsrc1	%f2,	%f6
	fmovsvc	%icc,	%f20,	%f5
	subcc	%g1,	0x11B2,	%g2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 21
!	Type a   	: 33
!	Type x   	: 9
!	Type cti   	: 146
!	Type f   	: 145
!	Type i   	: 146
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
	set	0x9,	%g1
	set	0x8,	%g2
	set	0xB,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0xB,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x1,	%i1
	set	-0x2,	%i2
	set	-0x4,	%i3
	set	-0x1,	%i4
	set	-0xE,	%i5
	set	-0x1,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x7D61665A,	%l0
	set	0x49912227,	%l1
	set	0x00C0050E,	%l2
	set	0x1F9DE13C,	%l3
	set	0x1560855D,	%l4
	set	0x3CCAE1AB,	%l5
	set	0x746AFF6D,	%l6
	!# Output registers
	set	0x05B4,	%o0
	set	-0x0BAB,	%o1
	set	0x16B5,	%o2
	set	0x00BD,	%o3
	set	0x0B4D,	%o4
	set	-0x0AAD,	%o5
	set	-0x15C2,	%o6
	set	-0x0ADA,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x5AC26DDDDFA212FB)
	INIT_TH_FP_REG(%l7,%f2,0xB0C5B480F1E44F09)
	INIT_TH_FP_REG(%l7,%f4,0xC7CA9C0B09D134D9)
	INIT_TH_FP_REG(%l7,%f6,0xA0A9494270A483B7)
	INIT_TH_FP_REG(%l7,%f8,0x71985FB1CAAC6D9C)
	INIT_TH_FP_REG(%l7,%f10,0x3BC87C2E0F027559)
	INIT_TH_FP_REG(%l7,%f12,0xE8088E992184EC0F)
	INIT_TH_FP_REG(%l7,%f14,0xF1572077DA188FFD)
	INIT_TH_FP_REG(%l7,%f16,0x23B959906AB22A8C)
	INIT_TH_FP_REG(%l7,%f18,0xFB8B7023F3EC8EF2)
	INIT_TH_FP_REG(%l7,%f20,0x901DB794D5F2B4AD)
	INIT_TH_FP_REG(%l7,%f22,0x3EEB44357AACD036)
	INIT_TH_FP_REG(%l7,%f24,0xF7C8CFB554BB2A57)
	INIT_TH_FP_REG(%l7,%f26,0xF9AB616688CC00C0)
	INIT_TH_FP_REG(%l7,%f28,0xEAD6119C2DA893FA)
	INIT_TH_FP_REG(%l7,%f30,0x52FB1CE1C7102662)

	!# Execute Main Diag ..

	fcmple16	%f28,	%f16,	%l6
	fnot2	%f16,	%f20
	brlez,a,pn	%i0,	loop_1027
	fornot2	%f28,	%f20,	%f10
	fble,pn	%fcc3,	loop_1028
	nop
	setx	0x11B8,	%l0,	%o6
	sdiv	%i5,	%o6,	%o5
loop_1027:
	addccc	%g3,	%i2,	%i3
	call	loop_1029
loop_1028:
	call	loop_1030
	taddcctv	%l5,	0x01D5,	%o1
	andcc	%o0,	0x0786,	%l4
loop_1029:
	fmovrslz	%g5,	%f21,	%f1
loop_1030:
	tsubcc	%l3,	0x00C9,	%l0
	fmovrsne	%o2,	%f26,	%f30
	fone	%f18
	tneg	%xcc,	0x1
	fmovsge	%xcc,	%f9,	%f18
	call	loop_1031
	call	loop_1032
	wrpr	%l1,	0x170F,	%pil
	fmovsne	%xcc,	%f31,	%f18
loop_1031:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i4
loop_1032:
	movre	%g6,	0x128,	%i7
	wrpr 	%g0, 	0x2, 	%gl
	call	loop_1033
	fmovrsne	%l2,	%f17,	%f31
	call	loop_1034
	brgz	%i6,	loop_1035
loop_1033:
	ta	%icc,	0x6
	call	loop_1036
loop_1034:
	tvc	%xcc,	0x2
loop_1035:
	call	loop_1037
	edge32ln	%g7,	%g4,	%i1
loop_1036:
	movneg	%icc,	%o7,	%o3
	call	loop_1038
loop_1037:
	nop
	setx	loop_1039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq32	%f18,	%f20,	%g2
	alignaddrl	%g1,	%i0,	%l6
loop_1038:
	fmul8sux16	%f0,	%f4,	%f28
loop_1039:
	te	%icc,	0x5
	nop
	set	0x4C, %i6
	swap	[%l7 + %i6],	%o6
	fmuld8sux16	%f20,	%f5,	%f16
	fmovrdlez	%i5,	%f12,	%f22
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	array16	%i2,	%g3,	%i3
	nop
	fitos	%f1,	%f26
	bcc,pn	%icc,	loop_1040
	fble,a	%fcc3,	loop_1041
	edge32ln	%l5,	%o1,	%l4
	call	loop_1042
loop_1040:
	subccc	%o0,	0x0A09,	%l3
loop_1041:
	ldsw	[%l7 + 0x48],	%l0
	nop
	setx	0x11DA,	%l0,	%l1
	udivcc	%g5,	%l1,	%i4
loop_1042:
	fmovrdlez	%o2,	%f24,	%f6
	fbge,a,pt	%fcc1,	loop_1043
	tn	%icc,	0x7
	call	loop_1044
	orcc	%g6,	%i7,	%o4
loop_1043:
	popc	0x043D,	%i6
	movle	%icc,	0x5EB,	%g7
loop_1044:
	call	loop_1045
	srlx	%l2,	%i1,	%o7
	rd	%fprs,	%o3
	call	loop_1046
loop_1045:
	fcmpne32	%f26,	%f18,	%g4
	fmovsl	%fcc2,	%f23,	%f0
	xor	%g1,	0x02E1,	%g2
loop_1046:
	call	loop_1047
	fandnot1	%f30,	%f10,	%f4
	call	loop_1048
	fmovrdlez	%l6,	%f12,	%f12
loop_1047:
	call	loop_1049
	fands	%f29,	%f5,	%f2
loop_1048:
	xor	%o6,	0x18C6,	%i5
	tl	%xcc,	0x4
loop_1049:
	fmovsue	%fcc0,	%f18,	%f26
	nop
	setx	0xB34ECB28,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fmovdu	%fcc0,	%f4,	%f8
	call	loop_1050
	wr	%o5,	0x13F0,	%ccr
	wrpr	%i0,	0x1D37,	%cwp
	fmovrdlz	%i2,	%f6,	%f20
loop_1050:
	call	loop_1051
	call	loop_1052
	fmovsu	%fcc1,	%f9,	%f19
	fnot1s	%f14,	%f7
loop_1051:
	movlg	%fcc3,	0x135,	%i3
loop_1052:
	call	loop_1053
	nop
	fitos	%f4,	%f29
	fstod	%f29,	%f18
	lduw	[%l7 + 0x24],	%g3
	array32	%o1,	%l5,	%o0
loop_1053:
	edge8l	%l3,	%l0,	%g5
	fnot1s	%f2,	%f23
	call	loop_1054
	edge8n	%l1,	%i4,	%l4
	call	loop_1055
	fmovdue	%fcc3,	%f10,	%f0
loop_1054:
	orcc	%o2,	%g6,	%o4
	nop
	setx	0x426C9632,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f31
loop_1055:
	rdhpr	%ver,	%i6
	call	loop_1056
	stx	%i7,	[%l7 + 0x58]
	xnorcc	%l2,	0x080B,	%g7
	call	loop_1057
loop_1056:
	call	loop_1058
	fmovsa	%fcc1,	%f6,	%f31
	subc	%i1,	0x02BA,	%o7
loop_1057:
	call	loop_1059
loop_1058:
	call	loop_1060
	call	loop_1061
	fmovsug	%fcc3,	%f0,	%f26
loop_1059:
	fcmpes	%fcc0,	%f1,	%f16
loop_1060:
	ld	[%l7 + 0x0C],	%f26
loop_1061:
	fones	%f31
	fmovrdgz	%g4,	%f4,	%f12
	xorcc	%o3,	0x065C,	%g1
	call	loop_1062
	call	loop_1063
	nop
	fitos	%f7,	%f12
	fstod	%f12,	%f20
	edge32n	%l6,	%o6,	%i5
loop_1062:
	call	loop_1064
loop_1063:
	fmovdl	%fcc3,	%f6,	%f28
	bleu,a	%icc,	loop_1065
	fsrc2s	%f16,	%f5
loop_1064:
	call	loop_1066
	nop
	setx	0xDB808E8D675DDBEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x88BDBB2CE373143E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f20
loop_1065:
	fmovs	%f17,	%f12
	call	loop_1067
loop_1066:
	rdhpr	%hpstate,	%g2
	nop
	setx	0x8D4497A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f19
	fblg,a,pt	%fcc1,	loop_1068
loop_1067:
	membar	0x65
	set	0x46, %o2
	lduha	[%l7 + %o2] 0x04,	%o5
loop_1068:
	edge32	%i0,	%i3,	%g3
	call	loop_1069
	call	loop_1070
	call	loop_1071
	fmovsg	%icc,	%f18,	%f26
loop_1069:
	call	loop_1072
loop_1070:
	movule	%fcc0,	0x2C7,	%o1
loop_1071:
	fmovdl	%fcc0,	%f30,	%f6
	fxors	%f13,	%f13,	%f1
loop_1072:
	fmul8x16	%f7,	%f6,	%f22
	rd	%ccr,	%i2
	fmovdule	%fcc1,	%f22,	%f18
	tcc	%xcc,	0x6
	fbuge,pt	%fcc2,	loop_1073
	rdpr	%tl,	%l5
	siam	0x3
	brz	%l3,	loop_1074
loop_1073:
	call	loop_1075
	fnand	%f0,	%f0,	%f8
	call	loop_1076
loop_1074:
	call	loop_1077
loop_1075:
	fcmpeq32	%f14,	%f2,	%l0
	call	loop_1078
loop_1076:
	edge32ln	%g5,	%l1,	%o0
loop_1077:
	call	loop_1079
	fmovdneg	%xcc,	%f22,	%f6
loop_1078:
	fmovslg	%fcc2,	%f4,	%f31
	movuge	%fcc0,	%l4,	%o2
loop_1079:
	edge16n	%i4,	%g6,	%o4
	movue	%fcc1,	0x309,	%i7
	fone	%f10
	call	loop_1080
	fmovda	%fcc0,	%f22,	%f16
	xnorcc	%i6,	%l2,	%i1
	rd	%softint,	%g7
loop_1080:
	edge16l	%g4,	%o7,	%g1
	nop
	setx	0xF9E6633DD7CDBC81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x72B7D3497D3AD82C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f16,	%f8
	call	loop_1081
	nop
	setx	0x0883,	%l0,	%o6
	udivx	%l6,	%o6,	%i5
	alignaddrl	%o3,	%g2,	%i0
	flushw
loop_1081:
	fand	%f8,	%f30,	%f12
	movvc	%icc,	%o5,	%g3
	fmovdlg	%fcc3,	%f4,	%f20
	tcs	%icc,	0x0
	fbuge,pt	%fcc1,	loop_1082
	sra	%o1,	0x1E,	%i2
	fmovde	%fcc1,	%f18,	%f26
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%i2
loop_1082:
	fmovdlg	%fcc3,	%f30,	%f8
	fmul8sux16	%f12,	%f8,	%f28
	fmovdcs	%xcc,	%f0,	%f14
	nop
	setx	0x17B5,	%l1,	%l0
	udivcc	%l3,	%l0,	%g5
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f10
	fcmpd	%fcc1,	%f26,	%f6
	lduh	[%l7 + 0x1C],	%l5
	call	loop_1083
	nop
	setx	0x435AE623,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x40083940,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f16,	%f3
	sub	%l1,	0x009C,	%l4
	movg	%fcc3,	0x4E1,	%o0
loop_1083:
	call	loop_1084
	fnot2	%f2,	%f18
	fmovrslz	%i4,	%f31,	%f18
	call	loop_1085
loop_1084:
	nop
	set	0x68, %g1
	lduw	[%l7 + %g1],	%g6
	call	loop_1086
	call	loop_1087
loop_1085:
	fcmped	%fcc2,	%f12,	%f28
	edge32l	%o2,	%o4,	%i7
loop_1086:
	subcc	%i6,	0x044A,	%l2
loop_1087:
	fsrc1s	%f21,	%f12
	call	loop_1088
	fmovsa	%fcc0,	%f19,	%f0
	fmovrsgz	%i1,	%f17,	%f27
	movpos	%xcc,	%g4,	%o7
loop_1088:
	smulcc	%g7,	0x0CD1,	%g1
	fmul8x16au	%f8,	%f8,	%f20
	movug	%fcc2,	0x09C,	%l6
	call	loop_1089
	smul	%i5,	%o6,	%g2
	nop
	setx	0xFC49C42E26B16D51,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB6258869,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsmuld	%f28,	%f10,	%f18
	fpsub32	%f16,	%f22,	%f16
loop_1089:
	movge	%xcc,	0x174,	%o3
	call	loop_1090
	movu	%fcc1,	%o5,	%g3
	call	loop_1091
	nop
	setx	0xED28E24486F3619F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f22
loop_1090:
	call	loop_1092
	alignaddr	%i0,	%i2,	%o1
loop_1091:
	fxors	%f28,	%f8,	%f9
	rdhpr	%hsys_tick_cmpr,	%i3
loop_1092:
	call	loop_1093
	fnors	%f23,	%f31,	%f16
	fzero	%f26
	call	loop_1094
loop_1093:
	fmovsg	%fcc2,	%f5,	%f0
	movle	%icc,	0x456,	%l3
	call	loop_1095
loop_1094:
	call	loop_1096
	call	loop_1097
	movneg	%xcc,	0x29D,	%l0
loop_1095:
	fnegs	%f26,	%f11
loop_1096:
	fmovsule	%fcc2,	%f11,	%f7
loop_1097:
	call	loop_1098
	fxors	%f8,	%f3,	%f4
	fnegs	%f5,	%f6
	fmovdneg	%xcc,	%f4,	%f16
loop_1098:
	fcmpeq16	%f0,	%f30,	%l5
	call	loop_1099
	sir	0x1786
	wrpr	%l1,	0x1EAD,	%pil
	addc	%l4,	%o0,	%i4
loop_1099:
	fcmpes	%fcc0,	%f19,	%f18
	xnorcc	%g6,	%g5,	%o4
	call	loop_1100
	orn	%i7,	0x0574,	%o2
	membar	0x57
	sir	0x1073
loop_1100:
	call	loop_1101
	fmul8ulx16	%f22,	%f4,	%f28
	faligndata	%f26,	%f16,	%f16
	fmul8x16	%f8,	%f26,	%f26
loop_1101:
	rdhpr	%ver,	%i6
	fmovdvc	%xcc,	%f8,	%f10
	fand	%f12,	%f0,	%f16
	fmovsul	%fcc0,	%f20,	%f24
	fmovdcs	%xcc,	%f12,	%f4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x08] %asi,	%f6
	nop
	set	0x78, %l2
	flush	%l7 + %l2
	fnegd	%f16,	%f14
	call	loop_1102
	fmovsule	%fcc3,	%f21,	%f2
	rdpr	%cansave,	%i1
	call	loop_1103
loop_1102:
	addcc	%l2,	%o7,	%g4
	call	loop_1104
	bmask	%g1,	%g7,	%l6
loop_1103:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%i5
loop_1104:
	fcmpgt32	%f8,	%f12,	%g2
	sth	%o6,	[%l7 + 0x3A]
	fmovrdne	%o3,	%f26,	%f22
	tge	%icc,	0x3
	fmovdpos	%xcc,	%f26,	%f22
	fmovrsgz	%g3,	%f27,	%f20
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_1105
	nop
	setx	0x8FD5744C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x5AF176EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f12,	%f1
	st	%f24,	[%l7 + 0x48]
	movlg	%fcc1,	0x1F3,	%o1
loop_1105:
	call	loop_1106
	fcmpgt16	%f4,	%f26,	%i3
	tleu	%xcc,	0x4
	nop
	fitos	%f9,	%f11
loop_1106:
	movu	%fcc3,	0x6C9,	%i2
	fmovsule	%fcc0,	%f20,	%f1
	tcs	%xcc,	0x3
	call	loop_1107
	edge32ln	%l3,	%l0,	%l5
	fmovsu	%fcc2,	%f30,	%f12
	nop
	setx	0x17C4D8E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xC79F4011,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f3,	%f27
loop_1107:
	fcmpd	%fcc2,	%f10,	%f14
	call	loop_1108
	fmul8sux16	%f24,	%f8,	%f26
	movne	%fcc1,	%l1,	%l4
	fmovdl	%icc,	%f2,	%f28
loop_1108:
	fxnor	%f16,	%f14,	%f16
	swap	[%l7 + 0x5C],	%i4
	nop
	setx	0x84551220B95E4485,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x499ADCE6ACE43C80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f22,	%f30
	call	loop_1109
	nop
	fitos	%f7,	%f28
	fstox	%f28,	%f24
	call	loop_1110
	edge32l	%o0,	%g5,	%o4
loop_1109:
	fmul8sux16	%f8,	%f18,	%f2
	fmovsuge	%fcc3,	%f7,	%f10
loop_1110:
	fmovdo	%fcc0,	%f12,	%f18
	fbo	%fcc2,	loop_1111
	wrpr 	%g0, 	0x0, 	%gl
	fmovsug	%fcc1,	%f27,	%f11
	call	loop_1112
loop_1111:
	subc	%o2,	0x1D1F,	%i1
	orncc	%l2,	%i6,	%g4
	bl	%xcc,	loop_1113
loop_1112:
	fpackfix	%f20,	%f27
	subcc	%g1,	0x00F2,	%g7
	call	loop_1114
loop_1113:
	stbar
	call	loop_1115
	move	%xcc,	%l6,	%o7
loop_1114:
	fble,pt	%fcc0,	loop_1116
	sub	%i5,	0x08CC,	%g2
loop_1115:
	call	loop_1117
	tle	%xcc,	0x7
loop_1116:
	rd	%softint,	%o6
	andn	%g3,	%o5,	%o3
loop_1117:
	movne	%xcc,	0x3F3,	%i0
	andn	%i3,	%i2,	%o1
	edge16l	%l0,	%l5,	%l3
	call	loop_1118
	flushw
	tleu	%xcc,	0x0
	movug	%fcc2,	%l1,	%l4
loop_1118:
	subcc	%o0,	%i4,	%g5
	movgu	%icc,	%o4,	%i7
	xnor	%g6,	%o2,	%l2
	tg	%xcc,	0x6
	call	loop_1119
	bleu,a	%icc,	loop_1120
	tpos	%xcc,	0x5
	call	loop_1121
loop_1119:
	edge8	%i6,	%g4,	%g1
loop_1120:
	call	loop_1122
	call	loop_1123
loop_1121:
	call	loop_1124
	addcc	%g7,	0x16A8,	%i1
loop_1122:
	call	loop_1125
loop_1123:
	call	loop_1126
loop_1124:
	sra	%l6,	0x1F,	%o7
	xnor	%g2,	0x00CA,	%i5
loop_1125:
	nop
	set	0x54, %i1
	sta	%f20,	[%l7 + %i1] 0x10
loop_1126:
	fcmple16	%f4,	%f6,	%o6
	nop
	setx	0x16E8,	%l0,	%o5
	sdivcc	%g3,	%o5,	%i0
	call	loop_1127
	addccc	%o3,	%i2,	%o1
	flushw
	call	loop_1128
loop_1127:
	wr	%l0,	0x1D27,	%ccr
	call	loop_1129
	ld	[%l7 + 0x3C],	%f17
loop_1128:
	fmovrse	%l5,	%f25,	%f9
	nop
	fitos	%f1,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f19
loop_1129:
	fandnot2s	%f24,	%f29,	%f29
	nop
	setx	0xB1A916EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xDF8B28C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f12,	%f0
	fpackfix	%f10,	%f19
	edge8l	%i3,	%l1,	%l4
	call	loop_1130
	fbo,a,pt	%fcc2,	loop_1131
	fmovdvc	%xcc,	%f4,	%f8
	ble	%xcc,	loop_1132
loop_1130:
	call	loop_1133
loop_1131:
	movpos	%icc,	0x12B,	%l3
	fcmpgt32	%f30,	%f30,	%i4
loop_1132:
	call	loop_1134
loop_1133:
	movul	%fcc2,	0x4E9,	%g5
	tvc	%xcc,	0x5
!!	wr	%g0,	0x40,	%asi
!!	stxa	%o4,	[%g0 + 0x3c8] %asi
loop_1134:
	nop
	set	0x60, %g4
	sta	%f12,	[%l7 + %g4] 0x81
	fornot2s	%f26,	%f20,	%f16
	nop
	setx	0x25AE9125,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	call	loop_1135
	bvs,a,pt	%icc,	loop_1136
	fandnot1s	%f23,	%f17,	%f12
	fmovsu	%fcc3,	%f4,	%f25
loop_1135:
	call	loop_1137
loop_1136:
	rd	%tick_cmpr,	%i7
	fnegd	%f4,	%f20
	call	loop_1138
loop_1137:
	udiv	%o0,	0x0A8E,	%o2
	call	loop_1139
	fcmpne32	%f0,	%f6,	%g6
loop_1138:
	rd	%y,	%i6
	call	loop_1140
loop_1139:
	sethi	0x1B8D,	%g4
	wrpr 	%g0, 	0x0, 	%gl
	tcs	%xcc,	0x5
loop_1140:
	fpsub32	%f28,	%f26,	%f28
	srlx	%g1,	0x1D,	%g7
	call	loop_1141
	nop
	set	0x54, %i5
	lduw	[%l7 + %i5],	%i1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o7
loop_1141:
	be	%icc,	loop_1142
	fmovdue	%fcc3,	%f28,	%f30
	fmovd	%f22,	%f22
	sllx	%l6,	0x11,	%g2
loop_1142:
	call	loop_1143
	orn	%i5,	0x111B,	%o6
	call	loop_1144
	nop
	setx	0x5C3667CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEA4C8DB1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f20,	%f31
loop_1143:
	call	loop_1145
	call	loop_1146
loop_1144:
	call	loop_1147
	bge,pn	%xcc,	loop_1148
loop_1145:
	fornot1s	%f24,	%f31,	%f23
loop_1146:
	fpadd32	%f10,	%f12,	%f6
loop_1147:
	edge32l	%g3,	%o5,	%i0
loop_1148:
	pdist	%f28,	%f30,	%f22
	call	loop_1149
	call	loop_1150
	movgu	%xcc,	0x06C,	%i2
	fxor	%f30,	%f14,	%f26
loop_1149:
	mulx	%o3,	0x07F3,	%l0
loop_1150:
	membar	0x28
	call	loop_1151
	fsrc1s	%f0,	%f15
	siam	0x4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1151:
	call	loop_1152
	call	loop_1153
	call	loop_1154
	call	loop_1155
loop_1152:
	mova	%fcc2,	%l5,	%i3
loop_1153:
	fmovdn	%icc,	%f6,	%f6
loop_1154:
	call	loop_1156
loop_1155:
	call	loop_1157
	call	loop_1158
	fcmpgt32	%f8,	%f10,	%o1
loop_1156:
	fmovsul	%fcc1,	%f0,	%f26
loop_1157:
	fpsub16	%f18,	%f2,	%f30
loop_1158:
	rd	%ccr,	%l1
	smulcc	%l3,	0x054E,	%i4
	bshuffle	%f16,	%f18,	%f10
	taddcctv	%g5,	0x0514,	%o4
	fornot1	%f14,	%f30,	%f6
	call	loop_1159
	movule	%fcc1,	0x3D2,	%i7
	call	loop_1160
	movgu	%icc,	%o0,	%l4
loop_1159:
	rd	%asi,	%g6
	call	loop_1161
loop_1160:
	bmask	%i6,	%o2,	%l2
	call	loop_1162
	nop
	setx loop_1163, %l0, %l1
	jmpl %l1, %g1
loop_1161:
	fmovdue	%fcc0,	%f10,	%f4
	call	loop_1164
loop_1162:
	fcmple16	%f6,	%f2,	%g7
loop_1163:
	movre	%g4,	0x0A6,	%o7
	fmovrse	%i1,	%f10,	%f1
loop_1164:
	popc	0x0034,	%l6
	call	loop_1165
	ldsh	[%l7 + 0x1A],	%i5
	addccc	%g2,	0x0690,	%g3
	movrlez	%o5,	%i0,	%i2
loop_1165:
	rdhpr	%hsys_tick_cmpr,	%o6
	fmovrdlez	%o3,	%f26,	%f14
	rd	%sys_tick_cmpr,	%l5
	fabsd	%f22,	%f20
	call	loop_1166
	fornot2s	%f31,	%f6,	%f15
	add	%i3,	%o1,	%l1
	alignaddrl	%l3,	%i4,	%g5
loop_1166:
	nop
	setx	loop_1167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004200001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_1168
	fmovsn	%xcc,	%f16,	%f24
	call	loop_1169
loop_1167:
	call	loop_1170
loop_1168:
	smulcc	%o4,	0x1BB5,	%l0
	orn	%i7,	%l4,	%o0
loop_1169:
	fpsub16	%f14,	%f12,	%f22
loop_1170:
	fmovs	%f30,	%f21
	nop
	setx	0x014DFB2220E5826D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x681DA09025AA288D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f16,	%f6
	call	loop_1171
	xnorcc	%g6,	0x1B1E,	%o2
	call	loop_1172
	movn	%fcc0,	%i6,	%l2
loop_1171:
	fandnot1s	%f13,	%f12,	%f21
	brlz,pt	%g1,	loop_1173
loop_1172:
	subccc	%g7,	0x061B,	%o7
	fbu,pt	%fcc1,	loop_1174
	fpack32	%f20,	%f22,	%f10
loop_1173:
	nop

loop_1174:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 27
!	Type a   	: 25
!	Type x   	: 9
!	Type cti   	: 148
!	Type f   	: 154
!	Type i   	: 137
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x4CEC96C5
.word 0x696E16DE
.word 0xF22B56E8
.word 0x77457C8E
.word 0x4F8C6BC5
.word 0x5FB4330D
.word 0xF4E7E2E1
.word 0x763C044C
.word 0x98967910
.word 0x31517D6A
.word 0xE6B137EB
.word 0x4927F73C
.word 0xB704AB5B
.word 0xEC5731C4
.word 0x914F903F
.word 0xA03F025D
.word 0x07C2419E
.word 0x1A13E0D0
.word 0xB9EB2BC0
.word 0xE06681E6
.word 0xC3414169
.word 0x747E48E3
.word 0x648E6744
.word 0x1FD2AFF2
.word 0x98BEAAB6
.word 0xAB27FCF0
.word 0x1ACB7D7C
.word 0xBF6CD0BF
.word 0x4E0ED05B
.word 0x34524D4F
.word 0x26EBE1D4
.word 0x6A60E2D3
.word 0x78466AAB
.word 0xBCA40A5C
.word 0x75A822DE
.word 0xEAAEB836
.word 0x9E46B9EE
.word 0x2D086B7E
.word 0x9DC21703
.word 0x1385A73A
.word 0x5B47B1B2
.word 0x49285FD5
.word 0x778771E5
.word 0x3415031E
.word 0xEE2CD9AE
.word 0x37D54BAE
.word 0x040F8B17
.word 0xB44606D7
.word 0xEC8CD919
.word 0x875A615A
.word 0xEDDC7A02
.word 0xF3D409F5
.word 0x0DEBDAA6
.word 0x6978C6B3
.word 0x2F4E2D9C
.word 0x7924EC6E
.word 0x8FD2D5F3
.word 0x7A702F65
.word 0xE992E28F
.word 0x52764A29
.word 0x04FFDCC9
.word 0xBBCED530
.word 0xEC017736
.word 0x0FBEE01F
.end
