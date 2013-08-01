/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_01.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12349"
.ident "Thu Dec 11 11:20:36 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_01.s,v 1.4 2007/07/27 21:45:30 drp Exp $"
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
	set	0xE,	%g2
	set	0xF,	%g3
	set	0x1,	%g4
	set	0x4,	%g5
	set	0xD,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x2,	%i1
	set	-0x7,	%i2
	set	-0x2,	%i3
	set	-0xE,	%i4
	set	-0x6,	%i5
	set	-0xC,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x2AB753AB,	%l0
	set	0x48B2C4C8,	%l1
	set	0x6199EDEA,	%l2
	set	0x2E41E47C,	%l3
	set	0x04D5A420,	%l4
	set	0x2ABC39CE,	%l5
	set	0x2C683DD5,	%l6
	!# Output registers
	set	-0x1511,	%o0
	set	-0x1655,	%o1
	set	0x1819,	%o2
	set	0x1BB7,	%o3
	set	-0x15B0,	%o4
	set	0x024C,	%o5
	set	0x1861,	%o6
	set	-0x1EE3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	fmovrslez	%i2,	%f9,	%f27
	fba	%fcc2,	loop_1
	udivx	%l6,	%g1,	%g3
	fmovdug	%fcc1,	%f6,	%f24
	call	loop_2
loop_1:
	subcc	%i7,	0x1C81,	%o6
	mulx	%l5,	%l0,	%o3
	call	loop_3
loop_2:
	movleu	%icc,	0x666,	%g5
	call	loop_4
	nop
	setx	0xECE0BBF3,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_3:
	fmovdn	%icc,	%f26,	%f22
	nop
	setx	0xDCBD514EF23CDFC7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_4:
	fmovrde	%o0,	%f10,	%f18
	rdpr	%pil,	%i1
	fzeros	%f19
	movg	%xcc,	%o1,	%i4
	fpadd16	%f2,	%f10,	%f20
	array8	%g4,	%o5,	%i6
	wr	%o7,	0x140B,	%y
	tvc	%icc,	0x0
	taddcctv	%g2,	0x1F48,	%l2
	edge16l	%g7,	%l4,	%i5
	edge8ln	%l3,	%i0,	%o2
	and	%l1,	0x0D8E,	%g6
	umul	%o4,	%i2,	%l6
	udivcc	%g1,	0x00,	%i3
	brlz	%g3,	loop_5
	fmul8ulx16	%f12,	%f18,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	te	%xcc,	0x0
loop_5:
	call	loop_6
	rdpr	%wstate,	%l0
	edge8ln	%l5,	%g5,	%o0
	tsubcctv	%o3,	%o1,	%i4
loop_6:
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_7
	call	loop_8
	tneg	%xcc,	0x2
	wr	%i1,	%i6,	%ccr
loop_7:
	rd	%ccr,	%o7
loop_8:
	fmovslg	%fcc1,	%f9,	%f30
	andncc	%g2,	0x1D30,	%g7
	edge32l	%l4,	%l2,	%i5
	tge	%icc,	0x7
	fones	%f7
	fmovdcs	%icc,	%f8,	%f14
	wr	%l3,	%i0,	%pic
	fmovsa	%fcc2,	%f25,	%f3
	rdhpr	%hsys_tick_cmpr,	%o2
	call	loop_9
	bge,a,pn	%icc,	loop_10
	fnot2s	%f1,	%f1
	fmovdge	%icc,	%f2,	%f2
loop_9:
	nop
	set	0x66, %o6
	lduha	[%l7 + %o6] 0x0c,	%g6
loop_10:
	call	loop_11
	smul	%l1,	%o4,	%l6
	fmul8x16	%f21,	%f26,	%f16
	rd	%sys_tick_cmpr,	%i2
loop_11:
	wrpr	%i3,	%g1,	%pil
	fmovsvc	%icc,	%f19,	%f3
	subccc	%o6,	0x0A60,	%g3
	smul	%l0,	%i7,	%l5
	fmovdcs	%icc,	%f28,	%f18
	fmovdg	%fcc1,	%f8,	%f22
	fnand	%f12,	%f14,	%f2
	call	loop_12
	fmovdcc	%xcc,	%f8,	%f10
	fmovsle	%xcc,	%f27,	%f20
	rdhpr	%hsys_tick_cmpr,	%g5
loop_12:
	nop
	fitos	%f1,	%f27
	fstox	%f27,	%f18
	fxtos	%f18,	%f24
	call	loop_13
	call	loop_14
	call	loop_15
	fxors	%f4,	%f22,	%f14
loop_13:
	fabss	%f8,	%f21
loop_14:
	nop
	setx	0x00CF9CAB452CBC83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x111BD35163A41DB5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f16
loop_15:
	wrpr	%o0,	%o1,	%tick
	edge8n	%i4,	%o3,	%o5
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f20
	fxtod	%f20,	%f10
	fmovsg	%icc,	%f29,	%f10
	siam	0x5
	ba,a,pn	%icc,	loop_16
	tl	%icc,	0x1
	call	loop_17
	fbue,a,pt	%fcc0,	loop_18
loop_16:
	fcmpes	%fcc3,	%f16,	%f19
	sllx	%g4,	0x0C,	%i6
loop_17:
	call	loop_19
loop_18:
	pdist	%f22,	%f22,	%f24
	call	loop_20
	ldsw	[%l7 + 0x78],	%o7
loop_19:
	call	loop_21
	ble,pn	%icc,	loop_22
loop_20:
	fmovrdgez	%i1,	%f22,	%f6
	umul	%g2,	%l4,	%l2
loop_21:
	call	loop_23
loop_22:
	tgu	%xcc,	0x2
	fxors	%f1,	%f17,	%f8
	call	loop_24
loop_23:
	call	loop_25
	fpadd16	%f2,	%f8,	%f26
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%g6
loop_24:
	call	loop_26
loop_25:
	call	loop_27
	call	loop_28
	call	loop_29
loop_26:
	movrgez	%i5,	%i0,	%l3
loop_27:
	call	loop_30
loop_28:
	fcmpne16	%f0,	%f20,	%g6
loop_29:
	fandnot2s	%f1,	%f11,	%f6
	fabss	%f28,	%f11
loop_30:
	subc	%l1,	%o2,	%o4
	fpsub16	%f16,	%f24,	%f26
	wr	%g0,	0x2a,	%asi
	stxa	%i2,	[%l7 + 0x60] %asi
	membar	#Sync
	fmovso	%fcc1,	%f31,	%f6
	fbg,pt	%fcc0,	loop_31
	call	loop_32
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f14
	fmovsug	%fcc3,	%f14,	%f0
loop_31:
	call	loop_33
loop_32:
	udivx	%i3,	%g1,	%l6
	fmovda	%xcc,	%f14,	%f2
	call	loop_34
loop_33:
	umulcc	%o6,	%g3,	%i7
	movne	%fcc2,	0x50A,	%l0
	fsrc1s	%f10,	%f11
loop_34:
	call	loop_35
	fmovdul	%fcc1,	%f6,	%f30
	nop
	setx	0x29AFCE3B660BD2AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2B2CCA26,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsmuld	%f10,	%f24,	%f28
	fcmpeq32	%f4,	%f24,	%g5
loop_35:
	bcc,a	%icc,	loop_36
	call	loop_37
	brnz,a,pn	%l5,	loop_38
	pdist	%f6,	%f30,	%f4
loop_36:
	wr 	%g0, 	0x6, 	%fprs
loop_37:
	fmovrdne	%o1,	%f16,	%f16
loop_38:
	call	loop_39
	srlx	%i4,	%o5,	%g4
	tpos	%xcc,	0x0
	fandnot1s	%f21,	%f28,	%f11
loop_39:
	wrpr	%i6,	0x0E48,	%pil
	rdpr	%cwp,	%o3
	orn	%o7,	%g2,	%l4
	sll	%i1,	%g7,	%l2
	fcmpes	%fcc0,	%f26,	%f16
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%i0
	fmovdug	%fcc3,	%f28,	%f2
	call	loop_40
	call	loop_41
	bshuffle	%f2,	%f16,	%f18
	bgu,pn	%xcc,	loop_42
loop_40:
	fblg	%fcc2,	loop_43
loop_41:
	call	loop_44
	fpackfix	%f8,	%f29
loop_42:
	movule	%fcc2,	%i5,	%g6
loop_43:
	fmovdvs	%icc,	%f24,	%f18
loop_44:
	bl	%icc,	loop_45
	call	loop_46
	fmovrdne	%l1,	%f4,	%f12
	fnot1	%f0,	%f10
loop_45:
	fcmpne32	%f8,	%f12,	%o2
loop_46:
	fornot1	%f4,	%f20,	%f4
	wrpr	%l3,	0x15DE,	%cwp
	wrpr 	%g0, 	0x2, 	%gl
	edge32n	%i2,	%i3,	%g1
	edge8n	%o6,	%g3,	%l6
	for	%f22,	%f24,	%f4
	call	loop_47
	call	loop_48
	addcc	%l0,	0x16F2,	%i7
	tcs	%icc,	0x4
loop_47:
	tsubcctv	%l5,	0x17B5,	%g5
loop_48:
	call	loop_49
	fmovrsgez	%o1,	%f11,	%f0
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f3
	andn	%o0,	%i4,	%o5
loop_49:
	call	loop_50
	call	loop_51
	move	%fcc2,	%g4,	%i6
	fpsub16s	%f16,	%f12,	%f21
loop_50:
	movue	%fcc3,	%o7,	%o3
loop_51:
	fmovde	%fcc1,	%f0,	%f0
	fmovsneg	%icc,	%f8,	%f17
	addc	%g2,	0x1E6F,	%l4
	nop
	set	0x11, %g2
	ldsb	[%l7 + %g2],	%i1
	call	loop_52
	fpackfix	%f6,	%f18
	rdpr	%wstate,	%l2
	movuge	%fcc3,	0x5C2,	%i0
loop_52:
	call	loop_53
	fmovrsne	%g7,	%f3,	%f12
	fmovsvs	%icc,	%f12,	%f31
	bpos	%xcc,	loop_54
loop_53:
	tpos	%icc,	0x4
	call	loop_55
	tneg	%icc,	0x3
loop_54:
	udiv	%i5,	0x00,	%l1
	fcmped	%fcc0,	%f18,	%f16
loop_55:
	edge32	%o2,	%l3,	%g6
	call	loop_56
	bshuffle	%f18,	%f28,	%f20
	fmovsue	%fcc3,	%f8,	%f11
	call	loop_57
loop_56:
	bleu,pt	%xcc,	loop_58
	fblg,a	%fcc3,	loop_59
	flushw
loop_57:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x04,	%i2,	%i3
loop_58:
	call	loop_60
loop_59:
	alignaddr	%g1,	%o4,	%o6
	fexpand	%f12,	%f10
	call	loop_61
loop_60:
	fmovsge	%icc,	%f7,	%f3
	wrpr	%l6,	%g3,	%tick
	movule	%fcc2,	0x090,	%l0
loop_61:
	brlz	%l5,	loop_62
	movrlz	%i7,	%g5,	%o1
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
loop_62:
	call	loop_63
	call	loop_64
	movle	%icc,	%o5,	%o0
	call	loop_65
loop_63:
	rdhpr	%hpstate,	%g4
loop_64:
	movo	%fcc3,	%i6,	%o3
	nop
	setx loop_66, %l0, %l1
	jmpl %l1, %o7
loop_65:
	nop
	setx	0x00D49E48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xA2224FBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f17,	%f3
	call	loop_67
	sra	%l4,	%i1,	%l2
loop_66:
	call	loop_68
	fmul8sux16	%f2,	%f28,	%f28
loop_67:
	nop
	setx	0x8DBFAA69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xC0C9841C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f16,	%f9
	movlg	%fcc0,	%g2,	%g7
loop_68:
	fabss	%f3,	%f18
	call	loop_69
	fmovrsgz	%i0,	%f19,	%f12
	bgu,a	%icc,	loop_70
	movl	%fcc0,	%l1,	%i5
loop_69:
	edge16n	%o2,	%l3,	%g6
	fcmple16	%f28,	%f20,	%i2
loop_70:
	call	loop_71
	bn,a,pt	%xcc,	loop_72
	fnot1	%f6,	%f14
	call	loop_73
loop_71:
	taddcc	%i3,	%g1,	%o6
loop_72:
	nop
	setx	loop_74,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x004100001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpackfix	%f24,	%f28
loop_73:
	smul	%o4,	0x103E,	%g3
	mulscc	%l6,	0x0C7E,	%l0
loop_74:
	subc	%l5,	%i7,	%o1
	fble,a	%fcc0,	loop_75
	sdivx	%g5,	0x00,	%o5
	fabss	%f6,	%f29
	tcc	%icc,	0x6
loop_75:
	rd	%pc,	%o0
	call	loop_76
	rd	%pc,	%i4
	fmul8x16	%f17,	%f0,	%f12
	fmovspos	%xcc,	%f7,	%f24
loop_76:
	call	loop_77
	call	loop_78
	call	loop_79
	movug	%fcc3,	0x771,	%g4
loop_77:
	call	loop_80
loop_78:
	flush	%l7 + 0x0C
loop_79:
	fones	%f2
	call	loop_81
loop_80:
	call	loop_82
	bcc,a,pn	%icc,	loop_83
	fmovdgu	%xcc,	%f22,	%f20
loop_81:
	fmovrdgez	%o3,	%f28,	%f30
loop_82:
	fmovrsne	%o7,	%f0,	%f10
loop_83:
	rdhpr	%hintp,	%i6
	nop
	fitod	%f8,	%f28
	fnegs	%f0,	%f27
	call	loop_84
	call	loop_85
	movrlez	%l4,	0x1EE,	%l2
	bpos,a	%icc,	loop_86
loop_84:
	call	loop_87
loop_85:
	fandnot2	%f18,	%f2,	%f22
	fmovrsgz	%g2,	%f6,	%f8
loop_86:
	bmask	%g7,	%i1,	%l1
loop_87:
	movg	%fcc3,	%i0,	%i5
	call	loop_88
	nop
	fitos	%f12,	%f23
	fstox	%f23,	%f16
	fxtos	%f16,	%f26
	call	loop_89
	fmul8x16al	%f25,	%f0,	%f22
loop_88:
	orncc	%l3,	%o2,	%g6
	call	loop_90
loop_89:
	call	loop_91
	call	loop_92
	fandnot2s	%f30,	%f31,	%f11
loop_90:
	call	loop_93
loop_91:
	call	loop_94
loop_92:
	mova	%fcc3,	%i3,	%g1
	sethi	0x1E72,	%i2
loop_93:
	fcmpne16	%f14,	%f28,	%o4
loop_94:
	call	loop_95
	nop
	setx	0x69C7532A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x73E9AFCA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f27,	%f15
	brgz,a	%o6,	loop_96
	fcmps	%fcc2,	%f15,	%f9
loop_95:
	call	loop_97
	fcmpgt16	%f22,	%f22,	%g3
loop_96:
	bshuffle	%f18,	%f0,	%f14
	fbge,pn	%fcc3,	loop_98
loop_97:
	fzeros	%f17
	subc	%l0,	0x14A6,	%l6
	call	loop_99
loop_98:
	movrgz	%i7,	0x0F0,	%l5
	edge16	%o1,	%o5,	%g5
	tneg	%icc,	0x4
loop_99:
	fpackfix	%f18,	%f29
	call	loop_100
	fmovsuge	%fcc0,	%f18,	%f10
	fmovso	%fcc1,	%f7,	%f8
	fxors	%f2,	%f26,	%f31
loop_100:
	nop
	setx	0x154B9E672FEED61B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE663A80E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f2,	%f26
	fmovsg	%fcc0,	%f19,	%f24
	call	loop_101
	mulscc	%o0,	0x047C,	%i4
	call	loop_102
	wr	%g4,	0x0947,	%y
loop_101:
	sllx	%o3,	0x10,	%i6
	fmovsa	%xcc,	%f0,	%f20
loop_102:
	fpadd16	%f18,	%f26,	%f22
	call	loop_103
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_104
	mulx	%l2,	0x0135,	%g2
loop_103:
	faligndata	%f8,	%f18,	%f0
	set	0x68, %l5
	stxa	%g7,	[%l7 + %l5] 0x04
loop_104:
	fpsub16	%f14,	%f24,	%f24
	fmovsuge	%fcc0,	%f13,	%f4
	fmovdpos	%icc,	%f10,	%f2
	sdivcc	%l1,	0x00,	%i1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tpos	%icc,	0x5
	ldsw	[%l7 + 0x20],	%i5
	bl,a,pt	%xcc,	loop_105
	call	loop_106
	srax	%l3,	%o2,	%i0
	fcmpeq32	%f0,	%f28,	%i3
loop_105:
	andn	%g6,	0x010C,	%i2
loop_106:
	smulcc	%g1,	%o4,	%o6
	fbul,a	%fcc1,	loop_107
	call	loop_108
	fbn,pn	%fcc1,	loop_109
	call	loop_110
loop_107:
	nop
	fitod	%f29,	%f16
loop_108:
	nop
	setx	0x5BA7F537ACE9D512,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x7CC0258EB4A1AA90,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f22,	%f2
loop_109:
	xor	%g3,	0x067A,	%l6
loop_110:
	rd	%fprs,	%i7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x79] %asi,	%l5
	sdivcc	%o1,	%l0,	%o5
	edge16n	%o0,	%g5,	%g4
	fmovdneg	%xcc,	%f0,	%f24
	fpsub16s	%f23,	%f3,	%f0
	edge32n	%o3,	%i4,	%i6
	call	loop_111
	movvs	%xcc,	%o7,	%l4
	call	loop_112
	faligndata	%f24,	%f10,	%f24
loop_111:
	call	loop_113
	fpsub32	%f28,	%f20,	%f20
loop_112:
	call	loop_114
	edge32n	%l2,	%g7,	%g2
loop_113:
	brlz,a,pn	%i1,	loop_115
	wr	%i5,	0x1919,	%set_softint
loop_114:
	fmovdpos	%xcc,	%f22,	%f18
	fcmped	%fcc3,	%f12,	%f20
loop_115:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%o2,	0x0062,	%i0
	call	loop_116
	ldsh	[%l7 + 0x0E],	%g6
	fba,a	%fcc0,	loop_117
	call	loop_118
loop_116:
	call	loop_119
	fnot2	%f14,	%f30
loop_117:
	call	loop_120
loop_118:
	call	loop_121
loop_119:
	fmovdg	%xcc,	%f6,	%f6
	fmuld8sux16	%f30,	%f20,	%f18
loop_120:
	fmul8x16au	%f30,	%f26,	%f6
loop_121:
	call	loop_122
	fbge,a,pt	%fcc2,	loop_123
	fone	%f14
	edge16ln	%i2,	%g1,	%o4
loop_122:
	ldsh	[%l7 + 0x54],	%o6
loop_123:
	rdpr	%pil,	%g3
	nop
	setx	0xC8929897A1EAFA88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f30
	nop
	set	0x58, %g1
	ldsw	[%l7 + %g1],	%i3
	call	loop_124
	fmovdne	%fcc1,	%f24,	%f12
	fandnot1	%f30,	%f18,	%f20
	call	loop_125
loop_124:
	sethi	0x0BF4,	%i7
	brgz,a	%l6,	loop_126
	taddcc	%l5,	0x1F03,	%o1
loop_125:
	call	loop_127
	call	loop_128
loop_126:
	call	loop_129
	call	loop_130
loop_127:
	fmovdu	%fcc3,	%f26,	%f18
loop_128:
	fpsub16s	%f24,	%f18,	%f4
loop_129:
	wrpr	%l0,	0x0941,	%cwp
loop_130:
	call	loop_131
	rdpr	%cansave,	%o5
	call	loop_132
	movg	%fcc3,	0x2B8,	%g5
loop_131:
	movul	%fcc0,	%o0,	%o3
	call	loop_133
loop_132:
	fmovdne	%fcc1,	%f16,	%f24
	subcc	%i4,	%g4,	%o7
	fbule,a,pn	%fcc3,	loop_134
loop_133:
	call	loop_135
	sllx	%l4,	%l2,	%g7
	fmovdg	%xcc,	%f6,	%f6
loop_134:
	fmovsvc	%xcc,	%f0,	%f6
loop_135:
	tsubcc	%g2,	%i1,	%i6
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f4
	fxtod	%f4,	%f22
	fandnot1	%f2,	%f16,	%f14
	fcmpne16	%f6,	%f8,	%l3
	fcmple32	%f0,	%f0,	%i5
	call	loop_136
	fmovdge	%fcc1,	%f30,	%f2
	call	loop_137
	call	loop_138
loop_136:
	call	loop_139
	edge8	%l1,	%i0,	%o2
loop_137:
	fcmpeq32	%f2,	%f0,	%g6
loop_138:
	call	loop_140
loop_139:
	movug	%fcc1,	0x05C,	%i2
	call	loop_141
	fmovd	%f18,	%f18
loop_140:
	mulscc	%g1,	%o4,	%o6
	fmovdule	%fcc0,	%f24,	%f14
loop_141:
	fmul8ulx16	%f18,	%f22,	%f28
	movcs	%icc,	0x589,	%g3
	edge16l	%i3,	%l6,	%i7
	bg,a	%xcc,	loop_142
	fpsub16s	%f9,	%f12,	%f1
	fmovdle	%fcc1,	%f18,	%f14
	call	loop_143
loop_142:
	fabss	%f26,	%f18
	nop
	set	0x38, %i0
	stx	%fsr,	[%l7 + %i0]
	bneg,a	%xcc,	loop_144
loop_143:
	nop
	fitos	%f7,	%f23
	fstod	%f23,	%f18
	nop
	setx	0x0EED750A184AE31A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f14
	addc	%o1,	%l0,	%o5
loop_144:
	movue	%fcc2,	0x780,	%l5
	flushw
	call	loop_145
	fmovsleu	%xcc,	%f13,	%f14
	array8	%g5,	%o0,	%o3
	addc	%g4,	%i4,	%l4
loop_145:
	movu	%fcc1,	%l2,	%g7
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x28] %asi,	%g2
	std	%i0,	[%l7 + 0x78]
	edge8l	%o7,	%i6,	%i5
	rdhpr	%htba,	%l3
	call	loop_146
	fcmpeq16	%f22,	%f30,	%i0
	fpsub16	%f10,	%f6,	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x047, 	%hsys_tick_cmpr
loop_146:
	add	%g6,	%o2,	%g1
	bvs,pt	%xcc,	loop_147
	call	loop_148
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	fbge	%fcc2,	loop_149
loop_147:
	call	loop_150
loop_148:
	call	loop_151
	tg	%icc,	0x2
loop_149:
	faligndata	%f10,	%f0,	%f16
loop_150:
	fornot1s	%f8,	%f0,	%f16
loop_151:
	flushw
	fcmps	%fcc2,	%f17,	%f18
	movlg	%fcc3,	%i2,	%o6
	call	loop_152
	wr	%o4,	0x1D8E,	%sys_tick
	fornot2s	%f10,	%f23,	%f12
	alignaddrl	%i3,	%l6,	%g3
loop_152:
	fbo,a,pt	%fcc0,	loop_153
	fexpand	%f18,	%f10
	prefetch	[%l7 + 0x78],	 0
	movvs	%icc,	%o1,	%l0
loop_153:
	rd	%y,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	rd	%softint,	%l5
	fpack16	%f6,	%f15
	xor	%o3,	0x00E0,	%o0
	fmul8x16al	%f6,	%f23,	%f16
	rd	%y,	%i4
	call	loop_154
loop_154:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 22
!	Type a   	: 39
!	Type x   	: 7
!	Type cti   	: 154
!	Type f   	: 156
!	Type i   	: 122
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
	set	0x6,	%g1
	set	0xF,	%g2
	set	0x1,	%g3
	set	0x1,	%g4
	set	0xB,	%g5
	set	0xE,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x1,	%i1
	set	-0x4,	%i2
	set	-0x5,	%i3
	set	-0xA,	%i4
	set	-0xA,	%i5
	set	-0x5,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x3C8A2D15,	%l0
	set	0x61ECFF9E,	%l1
	set	0x6648DF0E,	%l2
	set	0x03CEF1D9,	%l3
	set	0x01BD68E5,	%l4
	set	0x1A702FFD,	%l5
	set	0x3E0D38C3,	%l6
	!# Output registers
	set	0x1393,	%o0
	set	0x0546,	%o1
	set	-0x1FA2,	%o2
	set	0x122C,	%o3
	set	-0x1FBD,	%o4
	set	0x0696,	%o5
	set	-0x1B68,	%o6
	set	0x06AF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	rd	%tick_cmpr,	%g4
	rdhpr	%hpstate,	%l2
	fmovdl	%fcc2,	%f26,	%f10
	fmovs	%f20,	%f31
	fmovdgu	%icc,	%f30,	%f8
	movrne	%g7,	0x1C8,	%g2
	call	loop_155
	or	%l4,	%i1,	%i6
	tge	%icc,	0x0
	call	loop_156
loop_155:
	fmovrdgez	%o7,	%f20,	%f8
	std	%i4,	[%l7 + 0x48]
	brnz,a,pn	%i0,	loop_157
loop_156:
	fpadd32s	%f8,	%f15,	%f5
	brnz,pt	%l3,	loop_158
	edge8l	%g6,	%l1,	%g1
loop_157:
	fmovsue	%fcc2,	%f12,	%f22
	call	loop_159
loop_158:
	nop
	setx	0x85E0C46E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x5F54EBD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f2,	%f17
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i2
loop_159:
	and	%o6,	%o2,	%o4
	call	loop_160
	udivx	%i3,	0x00,	%g3
	fandnot2	%f20,	%f6,	%f26
	call	loop_161
loop_160:
	edge16n	%o1,	%l6,	%l0
	siam	0x0
	sth	%i7,	[%l7 + 0x7E]
loop_161:
	bshuffle	%f16,	%f14,	%f30
	fmovdn	%fcc3,	%f6,	%f4
	tcc	%xcc,	0x7
	tle	%icc,	0x6
	brgz,pn	%o5,	loop_162
	fmovsleu	%icc,	%f22,	%f14
	fandnot2s	%f7,	%f15,	%f6
	edge16	%g5,	%l5,	%o0
loop_162:
	nop
	setx	0xFDD86201F3A4646E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	brgez,a	%o3,	loop_163
	call	loop_164
	call	loop_165
	call	loop_166
loop_163:
	call	loop_167
loop_164:
	fpsub16	%f4,	%f20,	%f6
loop_165:
	xnor	%i4,	0x025E,	%l2
loop_166:
	call	loop_168
loop_167:
	movl	%xcc,	%g7,	%g2
	fmovsul	%fcc1,	%f15,	%f30
	call	loop_169
loop_168:
	call	loop_170
	movre	%g4,	0x3EC,	%l4
	taddcctv	%i6,	0x039A,	%i1
loop_169:
	nop
	setx	0xB851DAD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x5DBDEA87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f25,	%f25
loop_170:
	nop
	setx	0xAB307ED9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD1C68B36,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f18,	%f14
	fbge,a,pn	%fcc0,	loop_171
	movvc	%icc,	0x299,	%o7
	call	loop_172
	call	loop_173
loop_171:
	fandnot2s	%f2,	%f24,	%f28
	fnot1	%f10,	%f0
loop_172:
	sra	%i0,	%i5,	%g6
loop_173:
	movcc	%icc,	0x568,	%l3
	fbul,a	%fcc3,	loop_174
	call	loop_175
	fmovrde	%l1,	%f8,	%f30
	call	loop_176
loop_174:
	fand	%f20,	%f6,	%f6
loop_175:
	orncc	%g1,	0x1421,	%i2
	mova	%fcc2,	0x6BB,	%o2
loop_176:
	brlz	%o6,	loop_177
	bge	%xcc,	loop_178
	fandnot2	%f8,	%f2,	%f18
	sll	%i3,	0x11,	%o4
loop_177:
	fmovduge	%fcc1,	%f22,	%f26
loop_178:
	movcs	%xcc,	%g3,	%l6
	fmovde	%icc,	%f0,	%f8
	orncc	%o1,	0x0DF4,	%l0
	set	0x1C, %o5
	ldstuba	[%l7 + %o5] 0x19,	%i7
	call	loop_179
	call	loop_180
	fmul8x16	%f14,	%f22,	%f10
	mulx	%o5,	%l5,	%o0
loop_179:
	call	loop_181
loop_180:
	fmovdcs	%icc,	%f28,	%f28
	fmovsu	%fcc3,	%f26,	%f0
	call	loop_182
loop_181:
	stx	%o3,	[%l7 + 0x70]
	alignaddr	%g5,	%l2,	%i4
	brlz,a,pn	%g2,	loop_183
loop_182:
	movleu	%xcc,	%g4,	%g7
	call	loop_184
	orncc	%l4,	%i6,	%o7
loop_183:
	call	loop_185
	edge32ln	%i1,	%i0,	%g6
loop_184:
	call	loop_186
	call	loop_187
loop_185:
	fands	%f4,	%f0,	%f28
	call	loop_188
loop_186:
	nop
	setx	0x6689F99B6B54135F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f30
loop_187:
	call	loop_189
	edge16ln	%l3,	%l1,	%i5
loop_188:
	smul	%g1,	%i2,	%o2
	call	loop_190
loop_189:
	tleu	%icc,	0x2
	call	loop_191
	fmovsn	%fcc1,	%f1,	%f11
loop_190:
	fmovrsgez	%o6,	%f6,	%f4
	tpos	%icc,	0x0
loop_191:
	call	loop_192
	nop
	set	0x68, %l2
	std	%f18,	[%l7 + %l2]
	edge16l	%o4,	%i3,	%l6
	fmovrsne	%o1,	%f19,	%f4
loop_192:
	rdpr	%cwp,	%l0
	fxor	%f8,	%f16,	%f2
	call	loop_193
	call	loop_194
	sllx	%g3,	0x10,	%i7
	fxnors	%f22,	%f22,	%f28
loop_193:
	call	loop_195
loop_194:
	call	loop_196
	subc	%l5,	%o5,	%o0
	call	loop_197
loop_195:
	sethi	0x10AA,	%g5
loop_196:
	fsrc1s	%f21,	%f13
	fmovsue	%fcc3,	%f29,	%f19
loop_197:
	mulx	%l2,	%i4,	%g2
	movvc	%xcc,	0x158,	%o3
	fmul8x16al	%f13,	%f5,	%f20
	tg	%icc,	0x2
	fbl,pn	%fcc3,	loop_198
	call	loop_199
	call	loop_200
	popc	%g4,	%l4
loop_198:
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f13
loop_199:
	call	loop_201
loop_200:
	edge8l	%g7,	%i6,	%o7
	subc	%i0,	0x1914,	%g6
	movrlz	%i1,	0x332,	%l3
loop_201:
	fmovscs	%xcc,	%f9,	%f13
	tg	%icc,	0x7
	call	loop_202
	nop
	setx	0xD0F9298796EEED55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x357578B301F7EE67,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f4,	%f30
	call	loop_203
	fornot2	%f4,	%f10,	%f2
loop_202:
	tvc	%xcc,	0x3
	call	loop_204
loop_203:
	call	loop_205
	call	loop_206
	nop
	setx	0xD64E31502728622E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB8FE8B6E58E80986,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f4,	%f14
loop_204:
	fmovso	%fcc2,	%f16,	%f4
loop_205:
	membar	0x0C
loop_206:
	fmovrslz	%i5,	%f13,	%f16
	movgu	%xcc,	0x711,	%g1
	call	loop_207
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f8
	call	loop_208
	nop
	set	0x40, %i5
	std	%f20,	[%l7 + %i5]
loop_207:
	call	loop_209
	addc	%l1,	%i2,	%o2
loop_208:
	call	loop_210
	xnor	%o4,	%o6,	%i3
loop_209:
	nop
	set	0x1A, %i1
	stha	%l6,	[%l7 + %i1] 0x89
loop_210:
	fone	%f12
	movo	%fcc3,	%o1,	%l0
	call	loop_211
	fbl,pn	%fcc1,	loop_212
	fmovspos	%icc,	%f27,	%f4
	edge32n	%g3,	%i7,	%l5
loop_211:
	fcmpeq32	%f22,	%f24,	%o0
loop_212:
	fbl,a,pn	%fcc3,	loop_213
	fmovscc	%icc,	%f3,	%f22
	addcc	%o5,	0x06F0,	%g5
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f16
	fxtos	%f16,	%f11
loop_213:
	call	loop_214
	edge32l	%l2,	%g2,	%i4
	fmovdule	%fcc3,	%f14,	%f18
	fmovdcs	%icc,	%f22,	%f28
loop_214:
	fandnot1s	%f3,	%f13,	%f20
	fcmped	%fcc0,	%f0,	%f10
	fmuld8sux16	%f4,	%f17,	%f20
	andn	%o3,	%l4,	%g7
	call	loop_215
	call	loop_216
	call	loop_217
	xorcc	%i6,	%g4,	%o7
loop_215:
	nop
	setx	0x5E77DD57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f20
loop_216:
	fblg	%fcc1,	loop_218
loop_217:
	tle	%icc,	0x7
	bcs,a,pt	%xcc,	loop_219
	flush	%l7 + 0x18
loop_218:
	subccc	%g6,	0x0EC1,	%i1
	fmovrslez	%l3,	%f24,	%f12
loop_219:
	call	loop_220
	fxor	%f0,	%f16,	%f8
	call	loop_221
	bshuffle	%f12,	%f24,	%f6
loop_220:
	call	loop_222
	call	loop_223
loop_221:
	call	loop_224
	edge16	%i5,	%i0,	%l1
loop_222:
	wrpr	%i2,	0x0666,	%pil
loop_223:
	call	loop_225
loop_224:
	fmovdleu	%icc,	%f16,	%f6
	movrne	%o2,	0x3A5,	%o4
	call	loop_226
loop_225:
	ta	%icc,	0x7
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f0
	ba,a,pn	%icc,	loop_227
loop_226:
	nop
	setx	0x903DC046,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD7377477,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f13,	%f30
	addcc	%g1,	0x1BEF,	%o6
	call	loop_228
loop_227:
	call	loop_229
	rdhpr	%ver,	%l6
	fornot1s	%f14,	%f23,	%f15
loop_228:
	fcmpeq32	%f24,	%f12,	%i3
loop_229:
	fmuld8ulx16	%f8,	%f19,	%f0
	fcmpeq32	%f20,	%f22,	%o1
	fabss	%f14,	%f9
	call	loop_230
	call	loop_231
	call	loop_232
	bcs,a,pn	%icc,	loop_233
loop_230:
	fmovdn	%fcc1,	%f24,	%f6
loop_231:
	call	loop_234
loop_232:
	fxor	%f0,	%f16,	%f28
loop_233:
	wrpr 	%g0, 	0x0, 	%gl
	bge,pn	%xcc,	loop_235
loop_234:
	call	loop_236
	edge8l	%l0,	%l5,	%i7
	fnegd	%f16,	%f6
loop_235:
	call	loop_237
loop_236:
	fnand	%f24,	%f6,	%f22
	fmovsul	%fcc0,	%f19,	%f24
	call	loop_238
loop_237:
	ldsw	[%l7 + 0x08],	%o0
	call	loop_239
	call	loop_240
loop_238:
	rdpr	%cwp,	%o5
	ld	[%l7 + 0x6C],	%f29
loop_239:
	call	loop_241
loop_240:
	fmovsul	%fcc1,	%f7,	%f3
	fmovrslz	%g5,	%f13,	%f15
	fornot1	%f4,	%f30,	%f24
loop_241:
	membar	0x79
	fcmpne16	%f0,	%f28,	%l2
	fbug,a	%fcc1,	loop_242
	mulx	%g2,	0x00A4,	%i4
	fxnor	%f18,	%f28,	%f14
	set	0x7C, %g7
	lduwa	[%l7 + %g7] 0x80,	%l4
loop_242:
	fmovde	%xcc,	%f30,	%f20
	fmovsa	%fcc0,	%f29,	%f6
	fpsub32s	%f4,	%f29,	%f10
	taddcc	%g7,	%i6,	%o3
	fcmpeq32	%f4,	%f18,	%g4
	call	loop_243
	movrne	%o7,	%i1,	%g6
	call	loop_244
	nop
	setx	0x6440D2CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x11786C78,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f5,	%f8
loop_243:
	wr	%l3,	0x08DC,	%ccr
	fmuld8sux16	%f21,	%f0,	%f8
loop_244:
	fcmple32	%f6,	%f30,	%i0
	call	loop_245
	rd	%fprs,	%i5
	movo	%fcc0,	0x156,	%i2
	fmovdule	%fcc0,	%f10,	%f12
loop_245:
	fmovdule	%fcc2,	%f30,	%f0
	fmovdge	%icc,	%f26,	%f18
	call	loop_246
	edge16n	%o2,	%l1,	%o4
	wrpr 	%g0, 	0x2, 	%gl
	fabsd	%f10,	%f2
loop_246:
	fmovdvc	%xcc,	%f0,	%f30
	fornot1	%f16,	%f28,	%f18
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f8
	fornot2	%f20,	%f26,	%f0
	fmovso	%fcc3,	%f12,	%f29
	call	loop_247
	fmovdug	%fcc2,	%f2,	%f26
	sdivcc	%o6,	%i3,	%o1
	nop
	setx	0x8F3C5CD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x37753077,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f20,	%f29
loop_247:
	ble,a,pn	%xcc,	loop_248
	fbne,a,pn	%fcc3,	loop_249
	call	loop_250
	call	loop_251
loop_248:
	fzeros	%f12
loop_249:
	fmovsule	%fcc1,	%f30,	%f15
loop_250:
	fsrc1	%f12,	%f6
loop_251:
	fbue	%fcc2,	loop_252
	wrpr	%l6,	%l0,	%cwp
	wr	%l5,	0x08F3,	%ccr
	fmovdge	%xcc,	%f22,	%f6
loop_252:
	edge8ln	%i7,	%g3,	%o5
	edge32l	%g5,	%l2,	%g2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_253
	udivx	%i4,	%o0,	%g7
	nop
	set	0x18, %o1
	stw	%l4,	[%l7 + %o1]
	wr	%g0,	0x2a,	%asi
	stxa	%o3,	[%l7 + 0x28] %asi
	membar	#Sync
loop_253:
	movvc	%xcc,	%g4,	%o7
	fmul8sux16	%f30,	%f26,	%f26
	fnors	%f29,	%f1,	%f15
	fnand	%f4,	%f22,	%f18
	bmask	%i1,	%g6,	%l3
	nop
	setx	0xA0F3FDAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xEB7FFB5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f4,	%f2
	call	loop_254
	mulscc	%i6,	%i5,	%i0
	fbge,a,pn	%fcc3,	loop_255
	call	loop_256
loop_254:
	call	loop_257
	call	loop_258
loop_255:
	fandnot2	%f2,	%f26,	%f26
loop_256:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_257:
	fornot1	%f8,	%f6,	%f14
loop_258:
	fmul8x16	%f25,	%f2,	%f22
	array32	%l1,	%g1,	%o6
	fmovdpos	%xcc,	%f12,	%f24
	call	loop_259
	edge32n	%o4,	%o1,	%i3
	fsrc1	%f8,	%f14
	fble,a,pt	%fcc0,	loop_260
loop_259:
	udivx	%l0,	%l6,	%i7
	call	loop_261
	fmovrdlz	%l5,	%f20,	%f28
loop_260:
	array8	%o5,	%g5,	%g3
	call	loop_262
loop_261:
	fbug,pt	%fcc0,	loop_263
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f10
	fxtos	%f10,	%f15
	rdpr	%pil,	%l2
loop_262:
	fmul8ulx16	%f24,	%f18,	%f2
loop_263:
	sdivcc	%i4,	0x00,	%g2
	tvs	%xcc,	0x3
	sdiv	%o0,	%g7,	%o3
	fbul	%fcc0,	loop_264
	call	loop_265
	fmovsul	%fcc2,	%f5,	%f23
	movgu	%xcc,	0x6E3,	%g4
loop_264:
	st	%f30,	[%l7 + 0x58]
loop_265:
	fmovrsgez	%o7,	%f3,	%f13
	call	loop_266
	fornot1	%f6,	%f4,	%f10
	tleu	%xcc,	0x5
	fxnors	%f31,	%f25,	%f25
loop_266:
	call	loop_267
	call	loop_268
	call	loop_269
	ld	[%l7 + 0x60],	%f17
loop_267:
	nop
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
loop_268:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_269:
	fpack16	%f26,	%f13
	movn	%icc,	0x00D,	%l4
	call	loop_270
	call	loop_271
	rdhpr	%hsys_tick_cmpr,	%i6
	rdhpr	%hintp,	%l3
loop_270:
	fsrc1	%f30,	%f24
loop_271:
	rdpr	%cwp,	%i5
	movrgz	%i2,	%i0,	%l1
	call	loop_272
	addc	%o2,	0x1A1D,	%g1
	tsubcc	%o6,	0x09F4,	%o1
	fone	%f18
loop_272:
	andncc	%i3,	0x0E22,	%l0
	rdpr	%canrestore,	%o4
	call	loop_273
	tsubcc	%l6,	0x094D,	%l5
	call	loop_274
	fmovdleu	%xcc,	%f2,	%f30
loop_273:
	call	loop_275
	brnz,a,pt	%o5,	loop_276
loop_274:
	fmovdle	%icc,	%f30,	%f26
	fpadd32	%f0,	%f8,	%f22
loop_275:
	nop
	fitos	%f3,	%f11
	fstox	%f11,	%f18
	fxtos	%f18,	%f8
loop_276:
	call	loop_277
	alignaddr	%g5,	%i7,	%l2
	brlz,a	%g3,	loop_278
	stw	%g2,	[%l7 + 0x74]
loop_277:
	brlz,a,pn	%o0,	loop_279
	movuge	%fcc3,	%i4,	%g7
loop_278:
	edge16ln	%o3,	%g4,	%o7
	rd	%tick_cmpr,	%g6
loop_279:
	nop
	set	0x5A, %o3
	ldsb	[%l7 + %o3],	%i1
	fornot1	%f14,	%f22,	%f20
	call	loop_280
	call	loop_281
	movul	%fcc3,	%l4,	%i6
	nop
	fitos	%f7,	%f7
	fstoi	%f7,	%f9
loop_280:
	tg	%xcc,	0x6
loop_281:
	fbl	%fcc2,	loop_282
	tvc	%icc,	0x7
	call	loop_283
	sdivx	%l3,	%i2,	%i0
loop_282:
	nop
	setx	0x4BC801E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f9
	edge16	%l1,	%o2,	%g1
loop_283:
	fmovrslez	%i5,	%f14,	%f24
	rdpr	%tl,	%o1
	nop
	setx	0x623837E20D92A0DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xED0A90E4240DEF2D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f0,	%f8
	call	loop_284
	call	loop_285
	nop
	set	0x0C, %l6
	ldsw	[%l7 + %l6],	%o6
	edge32ln	%l0,	%o4,	%i3
loop_284:
	nop
	setx loop_286, %l0, %l1
	jmpl %l1, %l6
loop_285:
	subccc	%o5,	0x17DD,	%g5
	tne	%xcc,	0x1
	rdhpr	%htba,	%i7
loop_286:
	fxor	%f2,	%f22,	%f6
	nop
	fitos	%f6,	%f25
	addcc	%l5,	0x19F2,	%g3
	fmovsvs	%xcc,	%f24,	%f28
	ldstub	[%l7 + 0x2B],	%l2
	tpos	%icc,	0x3
	fpack32	%f18,	%f0,	%f20
	movg	%fcc3,	0x690,	%g2
	fmovduge	%fcc0,	%f14,	%f2
	set	0x19, %i3
	stba	%o0,	[%l7 + %i3] 0x2a
	membar	#Sync
	srl	%g7,	%i4,	%g4
	fcmpgt32	%f0,	%f24,	%o3
	rdhpr	%hintp,	%o7
	call	loop_287
	tle	%xcc,	0x6
	fbu	%fcc2,	loop_288
	tneg	%icc,	0x7
loop_287:
	nop
	set	0x43, %o0
	ldstuba	[%l7 + %o0] 0x0c,	%i1
loop_288:
	fmuld8sux16	%f16,	%f13,	%f28
	fnand	%f4,	%f14,	%f14
	movuge	%fcc1,	0x2A7,	%g6
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x88,	 1
	call	loop_289
	movo	%fcc2,	0x1F3,	%l3
	nop
	fitod	%f10,	%f26
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x04,	%i2
loop_289:
	fornot1s	%f14,	%f2,	%f12
	fmovdvs	%icc,	%f24,	%f20
	call	loop_290
	wrpr 	%g0, 	0x0, 	%gl

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x8D0, 	%hsys_tick_cmpr
	sethi	0x1275,	%g1
loop_290:
	mulx	%l1,	0x0625,	%i5
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o1
	nop
	fitod	%f4,	%f16
	fdtoi	%f16,	%f1
	bmask	%o6,	%l0,	%o4
	movneg	%icc,	0x376,	%l6
	tvs	%icc,	0x0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x68] %asi,	%o5
	nop
	setx	0xBBB05993293513FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x535E9290F19480DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f8,	%f2
	fmovsue	%fcc2,	%f8,	%f12
	ld	[%l7 + 0x48],	%f19
	sdivx	%g5,	%i3,	%i7
	fmovdvc	%icc,	%f12,	%f10
	flushw
	call	loop_291
	call	loop_292
	fmovsvc	%xcc,	%f30,	%f1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_291:
	call	loop_293
loop_292:
	edge16l	%l5,	%l2,	%g2
	subccc	%g3,	%g7,	%i4
	fmovrdgez	%g4,	%f2,	%f0
loop_293:
	edge16n	%o3,	%o0,	%o7
	call	loop_294
	call	loop_295
	flushw
	fmovdul	%fcc2,	%f4,	%f0
loop_294:
	call	loop_296
loop_295:
	movrlz	%g6,	0x1C5,	%i6
	rdpr	%canrestore,	%i1
	rdpr	%cansave,	%i2
loop_296:
	fbl,pn	%fcc1,	loop_297
	rdpr	%gl,	%i0
	fmovsle	%fcc3,	%f30,	%f0
	movcs	%icc,	%l4,	%l3
loop_297:
	call	loop_298
	fmovdule	%fcc1,	%f24,	%f12
	or	%o2,	0x1414,	%l1
	call	loop_299
loop_298:
	wr	%i5,	0x0A54,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flushw
loop_299:
	call	loop_300
	rdhpr	%htba,	%o6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_300:
	movul	%fcc0,	0x4E2,	%l0
	andcc	%o4,	0x013F,	%l6
	addcc	%o5,	0x187E,	%g5
	call	loop_301
	call	loop_302
	bshuffle	%f22,	%f28,	%f8
	fcmpd	%fcc3,	%f16,	%f4
loop_301:
	alignaddrl	%g1,	%i7,	%l5
loop_302:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 29
!	Type a   	: 31
!	Type x   	: 12
!	Type cti   	: 148
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
	set	0x6,	%g1
	set	0xD,	%g2
	set	0xD,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0x3,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x6,	%i1
	set	-0x4,	%i2
	set	-0xB,	%i3
	set	-0x2,	%i4
	set	-0xD,	%i5
	set	-0x1,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x363EEB1D,	%l0
	set	0x4D35198D,	%l1
	set	0x20644EB8,	%l2
	set	0x21D9E0DA,	%l3
	set	0x4306CEF3,	%l4
	set	0x75E37D37,	%l5
	set	0x5D4EEB69,	%l6
	!# Output registers
	set	0x0E1D,	%o0
	set	0x04B6,	%o1
	set	0x0103,	%o2
	set	-0x0A3E,	%o3
	set	-0x0C4B,	%o4
	set	-0x0561,	%o5
	set	-0x16A0,	%o6
	set	-0x12B6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	alignaddrl	%i3,	%l2,	%g2
	call	loop_303
	fmul8x16al	%f25,	%f3,	%f16
	bge,a	%icc,	loop_304
	call	loop_305
loop_303:
	call	loop_306
	tle	%xcc,	0x2
loop_304:
	ba,a	%icc,	loop_307
loop_305:
	call	loop_308
loop_306:
	edge8l	%g7,	%i4,	%g4
	call	loop_309
loop_307:
	fmovdcc	%xcc,	%f2,	%f18
loop_308:
	call	loop_310
	ba,a,pt	%xcc,	loop_311
loop_309:
	movvc	%xcc,	0x1B3,	%o3
	brgez,pt	%o0,	loop_312
loop_310:
	fmovsule	%fcc3,	%f0,	%f30
loop_311:
	fmovrdlz	%g3,	%f10,	%f8
	nop
	fitos	%f5,	%f26
	fstox	%f26,	%f20
loop_312:
	sir	0x14B9
	fmovdg	%fcc1,	%f22,	%f14
	call	loop_313
	call	loop_314
	call	loop_315
	fmovsu	%fcc1,	%f19,	%f10
loop_313:
	fpsub16	%f28,	%f8,	%f0
loop_314:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g6
loop_315:
	fmuld8sux16	%f24,	%f16,	%f24
	fcmple16	%f18,	%f28,	%o7
	fcmpes	%fcc1,	%f22,	%f6
	call	loop_316
	call	loop_317
	fsrc1s	%f7,	%f8
	call	loop_318
loop_316:
	rd	%sys_tick_cmpr,	%i1
loop_317:
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	fmovrde	%i6,	%f26,	%f16
loop_318:
	call	loop_319
	call	loop_320
	sllx	%i2,	0x0C,	%l4
	bvc,a	%xcc,	loop_321
loop_319:
	tleu	%xcc,	0x5
loop_320:
	tgu	%xcc,	0x6
	call	loop_322
loop_321:
	call	loop_323
	movlg	%fcc3,	0x2DE,	%l3
	wr	%g0,	0x23,	%asi
	stxa	%o2,	[%l7 + 0x08] %asi
	membar	#Sync
loop_322:
	call	loop_324
loop_323:
	fmovdul	%fcc2,	%f26,	%f18
	call	loop_325
	xnorcc	%l1,	%i5,	%i0
loop_324:
	tne	%xcc,	0x1
	call	loop_326
loop_325:
	call	loop_327
	call	loop_328
	andcc	%o1,	%o6,	%l0
loop_326:
	ta	%icc,	0x0
loop_327:
	movpos	%icc,	0x0A6,	%l6
loop_328:
	call	loop_329
	fmovscs	%xcc,	%f28,	%f2
	call	loop_330
	call	loop_331
loop_329:
	fcmpgt16	%f0,	%f6,	%o5
	fabsd	%f24,	%f22
loop_330:
	call	loop_332
loop_331:
	fcmple16	%f30,	%f12,	%o4
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
loop_332:
	fmovsvs	%xcc,	%f2,	%f15
	call	loop_333
	brlez	%i7,	loop_334
	addccc	%l5,	0x0CF4,	%g5
	wr	%i3,	0x1000,	%set_softint
loop_333:
	smulcc	%g2,	%l2,	%g7
loop_334:
	fmovdcc	%icc,	%f18,	%f26
	movue	%fcc0,	0x107,	%i4
	srl	%g4,	%o3,	%o0
	call	loop_335
	call	loop_336
	fmovde	%icc,	%f0,	%f16
	call	loop_337
loop_335:
	lduh	[%l7 + 0x20],	%g3
loop_336:
	taddcc	%g6,	0x1297,	%o7
	movn	%fcc0,	%i6,	%i1
loop_337:
	call	loop_338
	nop
	set	0x70, %l0
	prefetch	[%l7 + %l0],	 4
	brgz,a,pt	%l4,	loop_339
	call	loop_340
loop_338:
	fcmple16	%f20,	%f26,	%l3
	ldd	[%l7 + 0x10],	%i2
loop_339:
	movn	%fcc1,	0x757,	%o2
loop_340:
	edge16l	%i5,	%i0,	%l1
	call	loop_341
	movneg	%icc,	0x56A,	%o1
	fmovsle	%fcc3,	%f23,	%f16
	call	loop_342
loop_341:
	for	%f4,	%f6,	%f10
	and	%l0,	0x1CD3,	%o6
	smul	%o5,	0x0974,	%l6
loop_342:
	call	loop_343
	fmovdleu	%xcc,	%f16,	%f14
	taddcctv	%g1,	%i7,	%o4
	edge32ln	%g5,	%i3,	%g2
loop_343:
	edge16l	%l5,	%l2,	%g7
	call	loop_344
	call	loop_345
	call	loop_346
	call	loop_347
loop_344:
	sdiv	%i4,	0x00,	%g4
loop_345:
	call	loop_348
loop_346:
	tpos	%icc,	0x5
loop_347:
	call	loop_349
	sdivcc	%o3,	%o0,	%g3
loop_348:
	tsubcc	%o7,	0x1771,	%g6
	bl,a	%xcc,	loop_350
loop_349:
	fmovrdgez	%i1,	%f12,	%f6
	fpadd32s	%f21,	%f11,	%f28
	fmovdlg	%fcc1,	%f18,	%f6
loop_350:
	call	loop_351
	movcc	%xcc,	0x652,	%l4
	call	loop_352
	andn	%l3,	%i2,	%o2
loop_351:
	rdpr	%cleanwin,	%i6
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x2b,	%i4
loop_352:
	call	loop_353
	fnot2	%f10,	%f14
	call	loop_354
	call	loop_355
loop_353:
	fexpand	%f19,	%f10
	udiv	%l1,	%i0,	%o1
loop_354:
	edge8	%o6,	%o5,	%l0
loop_355:
	fmovrsgez	%l6,	%f6,	%f10
	call	loop_356
	sll	%g1,	0x12,	%i7
	call	loop_357
	edge16ln	%o4,	%g5,	%i3
loop_356:
	fcmpeq16	%f16,	%f22,	%l5
	call	loop_358
loop_357:
	call	loop_359
	fmovsn	%icc,	%f22,	%f31
	movle	%icc,	%l2,	%g7
loop_358:
	nop
	fitos	%f22,	%f9
loop_359:
	fpadd16s	%f20,	%f12,	%f30
	fzeros	%f10
	sdivx	%i4,	%g4,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB95, 	%hsys_tick_cmpr
	fmovdug	%fcc0,	%f10,	%f28
	call	loop_360
	fpsub16s	%f16,	%f12,	%f2
	fsrc2s	%f2,	%f16
	add	%g3,	%o7,	%i1
loop_360:
	fors	%f28,	%f13,	%f2
	udivcc	%g6,	0x00,	%l3
	bshuffle	%f2,	%f10,	%f12
	nop
	setx	0xB2CEC15C9C0D7354,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD3DCF700,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f4,	%f16
	fmovrdgz	%l4,	%f18,	%f12
	fsrc2s	%f16,	%f29
	edge32n	%o2,	%i6,	%i2
	ldsb	[%l7 + 0x32],	%i5
	call	loop_361
	fbne,pt	%fcc0,	loop_362
	fmovdneg	%xcc,	%f20,	%f2
	fmul8sux16	%f8,	%f14,	%f16
loop_361:
	subccc	%l1,	%o1,	%i0
loop_362:
	call	loop_363
	nop
	fitos	%f13,	%f5
	nop
	setx	0x420425E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	call	loop_364
loop_363:
	tneg	%icc,	0x7
	movre	%o6,	0x0D7,	%l0
	fmul8x16al	%f14,	%f10,	%f0
loop_364:
	fcmpes	%fcc0,	%f4,	%f6
	set	0x68, %l4
	stda	%i6,	[%l7 + %l4] 0xe3
	membar	#Sync
	call	loop_365
	wrpr	%g1,	0x03E0,	%cwp
	rdhpr	%htba,	%o5
	rd	%pc,	%o4
loop_365:
	call	loop_366
	tsubcc	%g5,	%i7,	%i3
	movl	%xcc,	%l2,	%l5
	fnot1s	%f1,	%f22
loop_366:
	fmul8x16al	%f17,	%f15,	%f0
	wr	%g0,	0x2b,	%asi
	stxa	%g7,	[%l7 + 0x50] %asi
	membar	#Sync
	movg	%fcc2,	0x7FA,	%g4
	udiv	%i4,	0x00,	%o3
	call	loop_367
	fcmpeq32	%f26,	%f10,	%o0
	xorcc	%g3,	0x03F8,	%o7
	fcmpgt16	%f14,	%f8,	%g2
loop_367:
	srlx	%g6,	%i1,	%l3
	fpadd16s	%f10,	%f15,	%f23
	sub	%o2,	%l4,	%i6
	bge	%icc,	loop_368
	fmovd	%f4,	%f22
	nop
	fitod	%f14,	%f0
	for	%f10,	%f10,	%f22
loop_368:
	fmovsug	%fcc1,	%f0,	%f31
	fmovduge	%fcc2,	%f30,	%f14
	call	loop_369
	tsubcctv	%i2,	%i5,	%l1
	movleu	%icc,	%o1,	%i0
	array16	%o6,	%l6,	%l0
loop_369:
	fmovsn	%xcc,	%f5,	%f2
	fmovdneg	%xcc,	%f28,	%f16
	tvs	%icc,	0x5
	fnands	%f2,	%f1,	%f13
	call	loop_370
	fcmpes	%fcc2,	%f22,	%f17
	fnot1s	%f21,	%f31
	fmul8sux16	%f16,	%f6,	%f26
loop_370:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sethi	0x0A70,	%o5
	fmovdne	%xcc,	%f8,	%f14
	fmovda	%fcc0,	%f22,	%f28
	fcmpgt16	%f0,	%f12,	%g1
	movuge	%fcc2,	%o4,	%g5
	fmovslg	%fcc2,	%f11,	%f22
	movle	%icc,	%i7,	%l2
	wr	%i3,	0x1E15,	%pic
	call	loop_371
	fmovrdlez	%g7,	%f4,	%f4
	fmovrdlz	%l5,	%f12,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4A6, 	%hsys_tick_cmpr
loop_371:
	fzeros	%f27
	call	loop_372
	rdpr	%otherwin,	%i4
	rd	%softint,	%o3
	wrpr	%o0,	%o7,	%cwp
loop_372:
	rd	%pc,	%g2
	fmovrdne	%g6,	%f0,	%f10
	nop
	fitod	%f26,	%f16
	call	loop_373
	call	loop_374
	array32	%g3,	%l3,	%o2
	fmovsa	%fcc3,	%f21,	%f8
loop_373:
	add	%i1,	%l4,	%i2
loop_374:
	call	loop_375
	st	%f5,	[%l7 + 0x44]
	movlg	%fcc3,	0x135,	%i5
	fbne,a,pt	%fcc2,	loop_376
loop_375:
	edge8ln	%l1,	%i6,	%o1
	fmovdule	%fcc3,	%f10,	%f12
	call	loop_377
loop_376:
	call	loop_378
	movvc	%icc,	0x656,	%o6
	array8	%i0,	%l0,	%o5
loop_377:
	call	loop_379
loop_378:
	taddcc	%l6,	%g1,	%o4
	nop
	fitod	%f0,	%f22
	add	%g5,	%l2,	%i3
loop_379:
	array32	%i7,	%g7,	%g4
	nop
	setx	0x54331400020097E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x26399AE05856E830,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f2,	%f18
	fble,a	%fcc3,	loop_380
	nop
	setx	0x54882CF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x683E6F06,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f25,	%f10
	fbne,a	%fcc1,	loop_381
	array8	%i4,	%o3,	%l5
loop_380:
	call	loop_382
	fmul8x16au	%f30,	%f22,	%f6
loop_381:
	srl	%o0,	%o7,	%g6
	fmovdpos	%xcc,	%f2,	%f24
loop_382:
	call	loop_383
	bgu,a,pn	%icc,	loop_384
	call	loop_385
	tsubcctv	%g2,	0x11F6,	%g3
loop_383:
	call	loop_386
loop_384:
	call	loop_387
loop_385:
	fpack16	%f18,	%f22
	edge32ln	%l3,	%i1,	%o2
loop_386:
	fornot2	%f24,	%f6,	%f30
loop_387:
	fpadd16	%f22,	%f26,	%f14
	call	loop_388
	call	loop_389
	call	loop_390
	fmovdug	%fcc2,	%f30,	%f16
loop_388:
	movo	%fcc0,	%i2,	%i5
loop_389:
	fmovsu	%fcc1,	%f20,	%f9
loop_390:
	nop
	fitos	%f8,	%f26
	nop
	fitos	%f10,	%f14
	fstoi	%f14,	%f0
	movg	%xcc,	%l1,	%i6
	fcmped	%fcc3,	%f26,	%f30
	fmovdo	%fcc3,	%f12,	%f10
	call	loop_391
	movpos	%xcc,	0x47E,	%l4
	fmovsneg	%icc,	%f0,	%f29
	nop
	set	0x28, %g6
	stx	%o1,	[%l7 + %g6]
loop_391:
	fmovd	%f14,	%f28
	call	loop_392
	tg	%icc,	0x6
	fcmpeq32	%f22,	%f0,	%i0
	fmovdge	%xcc,	%f4,	%f14
loop_392:
	fbuge,a	%fcc1,	loop_393
	fsrc1	%f2,	%f30
	nop
	setx	0xE11713B0CB5D4EA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x70FD9301,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f24,	%f22
	call	loop_394
loop_393:
	bl,pt	%icc,	loop_395
	call	loop_396
	call	loop_397
loop_394:
	ldsb	[%l7 + 0x0E],	%o6
loop_395:
	fmovdne	%xcc,	%f16,	%f4
loop_396:
	call	loop_398
loop_397:
	nop
	fitos	%f25,	%f13
	call	loop_399
	fmovrsgz	%o5,	%f2,	%f0
loop_398:
	sll	%l0,	0x1B,	%g1
	subcc	%l6,	%o4,	%g5
loop_399:
	fsrc1	%f0,	%f6
	edge32	%i3,	%l2,	%i7
	call	loop_400
	xnor	%g4,	0x19DF,	%g7
	edge32ln	%o3,	%l5,	%i4
	popc	%o0,	%o7
loop_400:
	call	loop_401
	call	loop_402
	fmovsl	%icc,	%f11,	%f28
	call	loop_403
loop_401:
	fornot2	%f16,	%f26,	%f24
loop_402:
	wr	%g6,	%g3,	%sys_tick
	fmovdne	%icc,	%f10,	%f30
loop_403:
	fpsub32s	%f3,	%f6,	%f1
	fpadd32	%f8,	%f2,	%f16
	fmovdle	%fcc0,	%f18,	%f2
	fands	%f31,	%f13,	%f10
	fxnors	%f11,	%f19,	%f24
	fmovscc	%icc,	%f26,	%f1
	rdpr	%wstate,	%l3
	fmovsn	%fcc0,	%f21,	%f12
	fmovdlg	%fcc0,	%f8,	%f22
	tpos	%xcc,	0x0
	fands	%f18,	%f25,	%f18
	fxnors	%f3,	%f21,	%f26
	ble,a	%xcc,	loop_404
	mulx	%g2,	%o2,	%i1
	srlx	%i2,	0x06,	%l1
	edge8n	%i5,	%i6,	%l4
loop_404:
	rd	%pc,	%o1
	movneg	%xcc,	%o6,	%i0
	fcmpes	%fcc0,	%f2,	%f22
	faligndata	%f24,	%f6,	%f14
	sir	0x1BBE
	wrpr	%l0,	%g1,	%tick
	fpmerge	%f6,	%f2,	%f22
	fzeros	%f16
	call	loop_405
	nop
	fitos	%f4,	%f1
	fstox	%f1,	%f28
	call	loop_406
	fmul8x16	%f15,	%f14,	%f2
loop_405:
	bcc,a	%xcc,	loop_407
	sethi	0x082A,	%o5
loop_406:
	lduh	[%l7 + 0x54],	%l6
	set	0x18, %i2
	ldswa	[%l7 + %i2] 0x19,	%o4
loop_407:
	edge16	%g5,	%i3,	%i7
	call	loop_408
	call	loop_409
	fnegs	%f23,	%f6
	sub	%l2,	0x1BDA,	%g7
loop_408:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_409:
	fmovsue	%fcc2,	%f9,	%f7
	call	loop_410
	fmovsule	%fcc3,	%f28,	%f19
	call	loop_411
	fmovrse	%o3,	%f24,	%f24
loop_410:
	brlez	%l5,	loop_412
	fones	%f7
loop_411:
	movleu	%icc,	0x7B7,	%i4
	alignaddrl	%g4,	%o0,	%o7
loop_412:
	movre	%g6,	0x123,	%g3
	tleu	%xcc,	0x0
	fbul,a,pt	%fcc1,	loop_413
	array16	%g2,	%o2,	%l3
	fxnors	%f30,	%f2,	%f22
	fblg	%fcc1,	loop_414
loop_413:
	fmovrdgz	%i1,	%f16,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fabsd	%f4,	%f16
loop_414:
	and	%i6,	%i5,	%o1
	ldx	[%l7 + 0x68],	%o6
	call	loop_415
	movrlez	%l4,	%l0,	%i0
	nop
	set	0x40, %i6
	stx	%o5,	[%l7 + %i6]
	call	loop_416
loop_415:
	udivx	%l6,	%g1,	%o4
	movre	%g5,	0x0E0,	%i3
	call	loop_417
loop_416:
	nop
	set	0x58, %o6
	stx	%i7,	[%l7 + %o6]
	call	loop_418
	edge8l	%g7,	%l2,	%l5
loop_417:
	or	%i4,	%g4,	%o3
	bg,a	%xcc,	loop_419
loop_418:
	fmovsvs	%icc,	%f9,	%f19
	fmovsa	%icc,	%f9,	%f16
	call	loop_420
loop_419:
	std	%o0,	[%l7 + 0x18]
	fbl,a,pt	%fcc2,	loop_421
	call	loop_422
loop_420:
	call	loop_423
	array16	%o7,	%g6,	%g2
loop_421:
	fmovsue	%fcc0,	%f17,	%f13
loop_422:
	srax	%o2,	%g3,	%l3
loop_423:
	fcmpgt16	%f16,	%f24,	%l1
	movule	%fcc0,	0x59D,	%i2
	rd	%y,	%i6
	edge8ln	%i1,	%o1,	%o6
	fmovdlg	%fcc1,	%f26,	%f18
	udivcc	%l4,	%i5,	%i0
	nop
	setx	0xBB70C299DD9D6C35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	xorcc	%o5,	0x165E,	%l0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x149, 	%hsys_tick_cmpr
	call	loop_424
	nop
	set	0x64, %l3
	ldsw	[%l7 + %l3],	%g5
	fpsub16s	%f25,	%f29,	%f19
	rd	%sys_tick_cmpr,	%i3
loop_424:
	fpack16	%f4,	%f27
	fpadd32	%f12,	%f24,	%f26
	call	loop_425
	movrgez	%i7,	0x162,	%g7
	call	loop_426
	fmovdcs	%icc,	%f10,	%f0
loop_425:
	movrlez	%l2,	0x271,	%i4
	fnegs	%f28,	%f7
loop_426:
	fands	%f24,	%f3,	%f2
	wr	%g4,	%l5,	%set_softint
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_427
	fmovscs	%xcc,	%f28,	%f31
	wr 	%g0, 	0x7, 	%fprs
	fmovsvs	%xcc,	%f23,	%f10
loop_427:
	movrlez	%o0,	0x0F1,	%g2
	fmovscs	%xcc,	%f5,	%f25
	movl	%fcc1,	0x240,	%o2
	alignaddr	%g6,	%g3,	%l1
	call	loop_428
	fmovdl	%xcc,	%f24,	%f10
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_429
loop_428:
	movre	%i6,	%l3,	%i1
	rdhpr	%hintp,	%o6
	nop
	fitos	%f2,	%f6
	fstod	%f6,	%f6
loop_429:
	fmovrsgez	%o1,	%f22,	%f30
	call	loop_430
	nop
	setx loop_431, %l0, %l1
	jmpl %l1, %i5
	call	loop_432
	edge16l	%i0,	%l4,	%l0
loop_430:
	call	loop_433
loop_431:
	movrlz	%g1,	0x3C1,	%o4
loop_432:
	xorcc	%o5,	0x0D75,	%l6
	fcmpne16	%f2,	%f2,	%i3
loop_433:
	movrne	%i7,	0x114,	%g7
	nop
	setx	0xE5015C45,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xDD124773,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f26,	%f4
	rdhpr	%hpstate,	%l2
	movule	%fcc3,	%g5,	%i4
	bgu,pn	%icc,	loop_434
	srl	%g4,	%o3,	%o7
	sllx	%o0,	%g2,	%l5
	fmul8x16al	%f22,	%f18,	%f4
loop_434:
	flushw
	call	loop_435
	call	loop_436
	rdpr	%cwp,	%o2
	fxnors	%f2,	%f27,	%f29
loop_435:
	fmovsneg	%xcc,	%f10,	%f1
loop_436:
	flushw
	fmovsn	%fcc2,	%f9,	%f29
	call	loop_437
	call	loop_438
	call	loop_439
	tne	%xcc,	0x7
loop_437:
	fbn	%fcc2,	loop_440
loop_438:
	array32	%g3,	%l1,	%i2
loop_439:
	siam	0x6
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%g6
loop_440:
	fmovrsgz	%l3,	%f6,	%f6
	call	loop_441
	fbug,a,pn	%fcc2,	loop_442
	fmovrsgez	%i6,	%f9,	%f0
	udivcc	%i1,	0x00,	%o1
loop_441:
	call	loop_443
loop_442:
	call	loop_444
	nop
	fitos	%f7,	%f28
	fstoi	%f28,	%f20
	call	loop_445
loop_443:
	fmovdo	%fcc1,	%f0,	%f0
loop_444:
	call	loop_446
	call	loop_447
loop_445:
	call	loop_448
	fxor	%f20,	%f16,	%f14
loop_446:
	sll	%o6,	0x15,	%i0
loop_447:
	xnor	%i5,	%l0,	%l4
loop_448:
	sra	%g1,	%o5,	%l6
	sllx	%o4,	%i7,	%i3
	fzeros	%f2
	sllx	%l2,	0x1E,	%g5
	call	loop_449
	tsubcc	%g7,	0x0D75,	%i4
loop_449:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 25
!	Type a   	: 27
!	Type x   	: 8
!	Type cti   	: 147
!	Type f   	: 157
!	Type i   	: 136
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
	set	0xF,	%g1
	set	0xB,	%g2
	set	0x2,	%g3
	set	0x2,	%g4
	set	0x2,	%g5
	set	0x4,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x2,	%i1
	set	-0x1,	%i2
	set	-0x6,	%i3
	set	-0x9,	%i4
	set	-0x5,	%i5
	set	-0x3,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x72FA887C,	%l0
	set	0x74F5B096,	%l1
	set	0x33B9D7C1,	%l2
	set	0x37111E86,	%l3
	set	0x797BAD74,	%l4
	set	0x1DF9C3D6,	%l5
	set	0x32B0F981,	%l6
	!# Output registers
	set	0x04AB,	%o0
	set	0x0BC3,	%o1
	set	-0x1358,	%o2
	set	-0x1FEF,	%o3
	set	-0x06E4,	%o4
	set	-0x183E,	%o5
	set	-0x1D5A,	%o6
	set	0x08B5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x34] %asi,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_450
	call	loop_451
	fbue	%fcc3,	loop_452
	call	loop_453
loop_450:
	fmul8x16al	%f30,	%f21,	%f8
loop_451:
	edge16l	%o0,	%g2,	%o7
loop_452:
	bleu	%icc,	loop_454
loop_453:
	fpsub32s	%f1,	%f22,	%f3
	stx	%o2,	[%l7 + 0x70]
	fcmps	%fcc0,	%f16,	%f3
loop_454:
	rdpr	%cwp,	%g3
	rdpr	%cleanwin,	%l1
	fandnot2s	%f3,	%f7,	%f30
	rdpr	%gl,	%i2
	movle	%fcc0,	%g6,	%l3
	call	loop_455
	mulscc	%i6,	%i1,	%l5
	fmovdul	%fcc0,	%f28,	%f24
	wrpr	%o6,	0x0C45,	%pil
loop_455:
	andncc	%i0,	%i5,	%l0
	fabss	%f6,	%f18
	fandnot1s	%f26,	%f19,	%f20
	fbug	%fcc1,	loop_456
	fmovso	%fcc2,	%f5,	%f7
	wrpr	%l4,	0x08CB,	%tick
	fmovdvc	%icc,	%f16,	%f8
loop_456:
	rdpr	%pil,	%o1
	movcs	%xcc,	%o5,	%g1
	movrgez	%l6,	%o4,	%i3
	nop
	setx	0xD38D099093CA258E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA650623D380039DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f14,	%f6
	srl	%l2,	%g5,	%g7
	rdhpr	%ver,	%i7
	bcc,a	%xcc,	loop_457
	call	loop_458
	call	loop_459
	tleu	%xcc,	0x0
loop_457:
	fmul8ulx16	%f26,	%f4,	%f20
loop_458:
	fmovrslz	%i4,	%f0,	%f11
loop_459:
	fzero	%f28
	nop
	fitos	%f12,	%f2
	fstox	%f2,	%f10
	fzeros	%f0
	fmovdu	%fcc0,	%f22,	%f24
	nop
	setx	0x9CDC33970A110539,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8F62B352806C4CD5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f8,	%f6
	rd	%asi,	%g4
	fmul8sux16	%f30,	%f12,	%f18
	call	loop_460
	tne	%icc,	0x1
	call	loop_461
	array32	%o0,	%g2,	%o7
loop_460:
	call	loop_462
	call	loop_463
loop_461:
	call	loop_464
	call	loop_465
loop_462:
	alignaddr	%o3,	%o2,	%l1
loop_463:
	edge32	%i2,	%g6,	%g3
loop_464:
	call	loop_466
loop_465:
	fmovrse	%l3,	%f2,	%f19
	fmovsue	%fcc0,	%f31,	%f18
	or	%i1,	0x02BE,	%l5
loop_466:
	movcs	%xcc,	0x704,	%o6
	edge8n	%i0,	%i6,	%i5
	movrne	%l4,	%l0,	%o5
	tvc	%xcc,	0x2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%l6
	popc	0x0457,	%o1
	call	loop_467
	call	loop_468
	edge16n	%o4,	%l2,	%i3
	fpsub32	%f10,	%f24,	%f14
loop_467:
	fmovsneg	%xcc,	%f23,	%f31
loop_468:
	bleu	%xcc,	loop_469
	fpadd32	%f30,	%f8,	%f0
	edge16ln	%g5,	%i7,	%g7
	smulcc	%i4,	0x1B67,	%o0
loop_469:
	ld	[%l7 + 0x60],	%f27
	flushw
	fornot1	%f4,	%f30,	%f26
	fbn	%fcc3,	loop_470
	siam	0x1
	call	loop_471
	fnot1s	%f8,	%f9
loop_470:
	tneg	%xcc,	0x6
	call	loop_472
loop_471:
	movre	%g2,	%o7,	%o3
	rdpr	%tba,	%o2
	bvc,a	%icc,	loop_473
loop_472:
	fbl,pn	%fcc0,	loop_474
	xnor	%l1,	0x02CB,	%i2
	fmovsa	%fcc0,	%f31,	%f25
loop_473:
	mova	%fcc2,	%g6,	%g4
loop_474:
	call	loop_475
	membar	0x35
	fcmpne32	%f0,	%f0,	%l3
	fmovsle	%icc,	%f15,	%f13
loop_475:
	movneg	%icc,	0x6BC,	%g3
	fors	%f0,	%f5,	%f22
	fnors	%f8,	%f21,	%f23
	fmovsvc	%xcc,	%f11,	%f11
	sllx	%l5,	%o6,	%i0
	fpsub32s	%f11,	%f14,	%f29
	fmovduge	%fcc1,	%f30,	%f22
	nop
	setx	0xF2887732DF3F9283,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x93F6407C7C859C50,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f4,	%f22
	nop
	setx	0x34BCB4408043186A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8180A6705CC31BB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f28,	%f6
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%i1
	or	%i5,	0x0BC8,	%l4
	movul	%fcc3,	0x430,	%l0
	rdpr	%wstate,	%i6
	fnors	%f27,	%f19,	%f12
	fbuge	%fcc0,	loop_476
	movo	%fcc1,	%o5,	%l6
	call	loop_477
	fmovdgu	%xcc,	%f0,	%f0
loop_476:
	array16	%o1,	%o4,	%l2
	call	loop_478
loop_477:
	sra	%g1,	0x06,	%i3
	fnot1	%f18,	%f12
	movre	%g5,	%i7,	%g7
loop_478:
	fmovsug	%fcc2,	%f6,	%f20
	call	loop_479
	fmovrde	%o0,	%f12,	%f30
	fmovdcc	%icc,	%f12,	%f10
	subccc	%g2,	%o7,	%i4
loop_479:
	tvc	%xcc,	0x2
	call	loop_480
	tge	%icc,	0x1
	call	loop_481
	call	loop_482
loop_480:
	fornot2	%f12,	%f2,	%f30
	fcmpes	%fcc1,	%f0,	%f23
loop_481:
	nop
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x11,	%o2
loop_482:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bmask	%g6,	%i2,	%g4
	fmovd	%f14,	%f28
	te	%xcc,	0x6
	edge16l	%g3,	%l3,	%o6
	andcc	%l5,	%i0,	%i1
	bvs,pn	%icc,	loop_483
	fandnot1	%f10,	%f16,	%f4
	call	loop_484
	movn	%fcc0,	%l4,	%i5
loop_483:
	call	loop_485
	call	loop_486
loop_484:
	movlg	%fcc2,	0x121,	%i6
	array16	%l0,	%l6,	%o1
loop_485:
	call	loop_487
loop_486:
	call	loop_488
	nop
	setx	0xA6B774EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xC9FD4C47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f7,	%f12
	ta	%icc,	0x5
loop_487:
	tg	%icc,	0x3
loop_488:
	call	loop_489
	sub	%o4,	%l2,	%g1
	sub	%o5,	%i3,	%g5
	fmovdvc	%icc,	%f28,	%f10
loop_489:
	fxnor	%f4,	%f18,	%f24
	call	loop_490
	udivx	%i7,	%g7,	%g2
	fcmpgt16	%f24,	%f16,	%o7
	fmovspos	%icc,	%f4,	%f6
loop_490:
	flushw
	fmovdvc	%icc,	%f10,	%f4
	edge8l	%o0,	%o2,	%i4
	call	loop_491
	call	loop_492
	fand	%f22,	%f4,	%f26
	nop
	setx	0x1705C03931461C80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x4A48C162C226AC8B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f14,	%f30
loop_491:
	andncc	%o3,	%l1,	%i2
loop_492:
	call	loop_493
	sdivcc	%g6,	%g3,	%g4
	array8	%o6,	%l3,	%i0
	fpsub16	%f0,	%f8,	%f20
loop_493:
	call	loop_494
	call	loop_495
	fmovdleu	%icc,	%f30,	%f16
	srl	%i1,	%l5,	%l4
loop_494:
	call	loop_496
loop_495:
	fmovslg	%fcc1,	%f22,	%f28
	call	loop_497
	call	loop_498
loop_496:
	call	loop_499
	fbuge,a,pt	%fcc1,	loop_500
loop_497:
	call	loop_501
loop_498:
	nop
	set	0x30, %g5
	ldsb	[%l7 + %g5],	%i5
loop_499:
	taddcctv	%i6,	%l6,	%l0
loop_500:
	brz,pn	%o4,	loop_502
loop_501:
	call	loop_503
	nop
	setx	0xD05B14D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xFEE06D0B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f25,	%f8
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_502:
	movge	%xcc,	0x1DE,	%o1
loop_503:
	addccc	%g1,	%l2,	%i3
	call	loop_504
	rdpr	%tl,	%g5
	call	loop_505
	tn	%xcc,	0x6
loop_504:
	call	loop_506
	fmovslg	%fcc0,	%f19,	%f26
loop_505:
	movcc	%xcc,	0x7A7,	%o5
	bge	%xcc,	loop_507
loop_506:
	call	loop_508
	fpackfix	%f18,	%f7
	fcmple32	%f22,	%f14,	%i7
loop_507:
	taddcc	%g7,	%o7,	%o0
loop_508:
	nop
	fitod	%f2,	%f30
	fdtoi	%f30,	%f26
	call	loop_509
	rdpr	%cwp,	%g2
	call	loop_510
	rdpr	%wstate,	%o2
loop_509:
	call	loop_511
	fand	%f8,	%f26,	%f4
loop_510:
	call	loop_512
	edge16n	%o3,	%i4,	%l1
loop_511:
	call	loop_513
	call	loop_514
loop_512:
	fmul8ulx16	%f22,	%f10,	%f16
	rdhpr	%hsys_tick_cmpr,	%i2
loop_513:
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f18
loop_514:
	movn	%xcc,	%g3,	%g4
	edge32n	%o6,	%l3,	%i0
	call	loop_515
	nop
	set	0x42, %l5
	lduh	[%l7 + %l5],	%i1
	call	loop_516
	sllx	%g6,	%l5,	%l4
loop_515:
	stw	%i6,	[%l7 + 0x7C]
	rd	%softint,	%i5
loop_516:
	fnot2s	%f3,	%f31
	subccc	%l6,	0x15D9,	%o4
	fcmpes	%fcc3,	%f25,	%f16
	call	loop_517
	umulcc	%o1,	%l0,	%g1
	fcmple32	%f18,	%f2,	%i3
	fmovdue	%fcc3,	%f4,	%f28
loop_517:
	tpos	%xcc,	0x4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x04,	%g5,	%l2
	movul	%fcc2,	%o5,	%i7
	fmovrdgez	%g7,	%f2,	%f30
	nop
	setx	0x846EA297168BAD77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x929633E8B2D7B99F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f2,	%f10
	fands	%f2,	%f31,	%f4
	fmovsle	%fcc1,	%f4,	%f30
	call	loop_518
	call	loop_519
	fmovsu	%fcc0,	%f15,	%f23
	fmovscs	%icc,	%f9,	%f11
loop_518:
	fcmpgt16	%f2,	%f0,	%o7
loop_519:
	tneg	%icc,	0x2
	nop
	setx	loop_520,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011100001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsul	%fcc0,	%f7,	%f6
	tneg	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x67] %asi,	%g2
loop_520:
	movlg	%fcc1,	0x1DD,	%o0
	fmovdneg	%xcc,	%f8,	%f20
	fcmpgt32	%f28,	%f24,	%o3
	call	loop_521
	call	loop_522
	fmovsul	%fcc3,	%f19,	%f5
	fbo,pn	%fcc3,	loop_523
loop_521:
	movrlez	%i4,	%o2,	%l1
loop_522:
	edge8ln	%i2,	%g3,	%o6
	call	loop_524
loop_523:
	srax	%l3,	%g4,	%i1
	call	loop_525
	call	loop_526
loop_524:
	fcmps	%fcc0,	%f11,	%f5
	taddcc	%g6,	0x0CD1,	%l5
loop_525:
	call	loop_527
loop_526:
	udivx	%l4,	%i6,	%i5
	fand	%f6,	%f2,	%f16
	fandnot1	%f4,	%f30,	%f6
loop_527:
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f10
	fxtos	%f10,	%f15

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdug	%fcc1,	%f30,	%f8
	tleu	%xcc,	0x0
	nop
	fitod	%f20,	%f22
	fbo,a	%fcc0,	loop_528
	fpsub16	%f2,	%f16,	%f26
	edge16n	%o4,	%i0,	%l0
	srl	%g1,	%o1,	%g5
loop_528:
	edge16	%l2,	%o5,	%i3
	call	loop_529
	mulscc	%i7,	%g7,	%g2
	nop
	fitos	%f14,	%f15
	fstoi	%f15,	%f25
	fpsub16	%f28,	%f2,	%f12
loop_529:
	call	loop_530
	call	loop_531
	rd	%ccr,	%o7
	faligndata	%f24,	%f18,	%f6
loop_530:
	fzeros	%f15
loop_531:
	brz	%o3,	loop_532
	call	loop_533
	movle	%fcc3,	%i4,	%o0
	add	%o2,	%l1,	%g3
loop_532:
	tne	%xcc,	0x0
loop_533:
	wrpr	%o6,	0x07DF,	%cwp
	sdiv	%l3,	%i2,	%i1
	fmovdne	%fcc2,	%f6,	%f2
	udiv	%g4,	%l5,	%g6
	fmovsule	%fcc3,	%f31,	%f6
	movne	%xcc,	%l4,	%i6
	rdhpr	%htba,	%l6
	bgu	%xcc,	loop_534
	fzero	%f20
	wrpr	%o4,	0x0E18,	%cwp
	call	loop_535
loop_534:
	xnorcc	%i0,	0x0C5E,	%l0
	xnor	%i5,	0x02D9,	%o1
	tvc	%icc,	0x5
loop_535:
	ldd	[%l7 + 0x40],	%f2
	nop
	setx	0x4E77B5061A3768CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA325E06C6568D3DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f28,	%f18
	fmul8x16	%f3,	%f30,	%f0
	sdivcc	%g5,	%g1,	%o5
	membar	0x60
	fcmpgt16	%f16,	%f14,	%i3
	call	loop_536
	movcs	%icc,	0x4D2,	%l2
	nop
	setx loop_537, %l0, %l1
	jmpl %l1, %g7
	fmovsg	%fcc3,	%f25,	%f23
loop_536:
	addc	%g2,	0x07F1,	%o7
	fbl,a	%fcc1,	loop_538
loop_537:
	bmask	%i7,	%o3,	%o0
	fmovrdlz	%o2,	%f18,	%f30
	call	loop_539
loop_538:
	call	loop_540
	call	loop_541
	fones	%f28
loop_539:
	call	loop_542
loop_540:
	call	loop_543
loop_541:
	mulscc	%l1,	%i4,	%g3
	add	%o6,	0x0E77,	%l3
loop_542:
	brgez	%i1,	loop_544
loop_543:
	call	loop_545
	fpadd32	%f30,	%f2,	%f4
	nop
	setx	0x1B49CF89B99D237C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xD956065330283115,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f24,	%f2
loop_544:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x40] %asi,	%f1
loop_545:
	call	loop_546
	movl	%xcc,	%g4,	%l5
	fmovsleu	%icc,	%f17,	%f7
	rdhpr	%htba,	%g6
loop_546:
	orcc	%i2,	0x03EC,	%i6
	movrne	%l6,	%l4,	%o4
	addcc	%l0,	0x104E,	%i0
	edge16l	%o1,	%i5,	%g5
	movu	%fcc3,	0x5DA,	%g1
	fmovspos	%icc,	%f16,	%f15
	call	loop_547
	nop
	set	0x3F, %g1
	ldsb	[%l7 + %g1],	%o5
	bvc,pn	%xcc,	loop_548
	movuge	%fcc2,	0x2FA,	%l2
loop_547:
	fmovdleu	%xcc,	%f28,	%f24
	call	loop_549
loop_548:
	xnorcc	%i3,	%g7,	%o7
	call	loop_550
	fmovdvs	%xcc,	%f10,	%f2
loop_549:
	subcc	%i7,	%g2,	%o0
	fxnors	%f0,	%f21,	%f4
loop_550:
	fcmpd	%fcc3,	%f4,	%f6
	ld	[%l7 + 0x1C],	%f31
	movo	%fcc1,	0x2BA,	%o3
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f20
	edge32	%o2,	%l1,	%g3
	edge8l	%o6,	%i4,	%l3
	fandnot1s	%f4,	%f3,	%f19
	xor	%g4,	%i1,	%g6
	siam	0x6
	call	loop_551
	fmovrde	%l5,	%f0,	%f10
	edge32ln	%i2,	%i6,	%l4
	movle	%xcc,	%o4,	%l6
loop_551:
	call	loop_552
	fmovdul	%fcc2,	%f28,	%f18
	nop
	fitos	%f13,	%f21
	fstox	%f21,	%f16
	fxtos	%f16,	%f2
	fcmpne32	%f20,	%f22,	%i0
loop_552:
	movul	%fcc0,	0x721,	%o1
	call	loop_553
	call	loop_554
	call	loop_555
	fzeros	%f22
loop_553:
	sdivcc	%l0,	%i5,	%g1
loop_554:
	nop
	wr	%g0,	0xea,	%asi
	stwa	%g5,	[%l7 + 0x38] %asi
	membar	#Sync
loop_555:
	call	loop_556
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f9
	fmovslg	%fcc2,	%f29,	%f9
	addccc	%l2,	%i3,	%o5
loop_556:
	fcmpeq32	%f12,	%f16,	%g7
	call	loop_557
	call	loop_558
	movule	%fcc3,	%o7,	%i7
	call	loop_559
loop_557:
	fnands	%f23,	%f28,	%f5
loop_558:
	movleu	%icc,	%o0,	%o3
	tle	%icc,	0x1
loop_559:
	rdpr	%cleanwin,	%o2
	xor	%l1,	0x1C35,	%g3
	call	loop_560
	call	loop_561
	nop
	setx	0xEA76FF75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xD471F41F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f17,	%f2
	nop
	setx	0x4B77F9620E1B86A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x12F68C0FDE27807C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f8
loop_560:
	call	loop_562
loop_561:
	movlg	%fcc3,	0x12C,	%o6
	call	loop_563
	fmul8x16	%f17,	%f22,	%f6
loop_562:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tgu	%xcc,	0x5
loop_563:
	tsubcctv	%g2,	%l3,	%i1
	fmovdcc	%xcc,	%f4,	%f28
	call	loop_564
	call	loop_565
	fexpand	%f9,	%f4
	fmovrdlz	%g4,	%f6,	%f16
loop_564:
	call	loop_566
loop_565:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpadd32s	%f23,	%f22,	%f19
	fmovs	%f9,	%f24
loop_566:
	call	loop_567
	movuge	%fcc1,	0x7B3,	%g6
	call	loop_568
	fmovdleu	%icc,	%f30,	%f2
loop_567:
	fmovdu	%fcc3,	%f24,	%f28
	call	loop_569
loop_568:
	fmovslg	%fcc3,	%f8,	%f17
	rd	%ccr,	%i2
	tn	%xcc,	0x6
loop_569:
	movre	%i6,	0x2BD,	%l4
	call	loop_570
	call	loop_571
	call	loop_572
	taddcctv	%l5,	0x1EE7,	%l6
loop_570:
	fmovso	%fcc3,	%f6,	%f1
loop_571:
	movcs	%xcc,	%o4,	%i0
loop_572:
	fmul8x16	%f28,	%f26,	%f2
	tsubcctv	%o1,	0x05B7,	%l0
	fmovrslez	%i5,	%f7,	%f31
	be,a,pt	%xcc,	loop_573
	call	loop_574
	fble,a,pn	%fcc2,	loop_575
	fxnors	%f29,	%f0,	%f9
loop_573:
	xorcc	%g1,	0x0E6B,	%g5
loop_574:
	nop
	set	0x48, %g4
	sta	%f30,	[%l7 + %g4] 0x18
loop_575:
	fmovd	%f30,	%f30
	call	loop_576
	st	%fsr,	[%l7 + 0x74]
	bge,pt	%icc,	loop_577
	fmovrslez	%l2,	%f20,	%f18
loop_576:
	wr	%i3,	%o5,	%set_softint
	edge32ln	%o7,	%i7,	%o0
loop_577:
	fnors	%f5,	%f8,	%f30
	srl	%o3,	0x09,	%o2
	fmovsne	%xcc,	%f16,	%f8
	fornot2	%f6,	%f28,	%f22
	fmovdule	%fcc1,	%f12,	%f14
	wr	%g7,	%g3,	%sys_tick
	rdpr	%cwp,	%o6
	fone	%f18
	call	loop_578
	call	loop_579
	fexpand	%f9,	%f8
	fornot1	%f4,	%f12,	%f24
loop_578:
	subccc	%l1,	0x1D16,	%i4
loop_579:
	call	loop_580
	call	loop_581
	movue	%fcc0,	%l3,	%i1
	nop
	setx	0xEDD156A32537A679,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xFC4528CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f0,	%f6
loop_580:
	smul	%g2,	%g4,	%g6
loop_581:
	tl	%xcc,	0x4
	call	loop_582
	membar	0x04
	fcmpeq32	%f18,	%f2,	%i6
	movpos	%xcc,	0x235,	%l4
loop_582:
	fands	%f24,	%f9,	%f7
	orcc	%l5,	%i2,	%o4
	ldd	[%l7 + 0x08],	%i6
	call	loop_583
	fmovduge	%fcc0,	%f18,	%f8
	fmovsg	%fcc3,	%f27,	%f4
	bge,a	%icc,	loop_584
loop_583:
	tgu	%xcc,	0x3
	fpackfix	%f24,	%f10
	edge32	%i0,	%o1,	%l0
loop_584:
	call	loop_585
	fmovsne	%fcc3,	%f30,	%f23
	call	loop_586
	bcc,a	%xcc,	loop_587
loop_585:
	fmovscs	%icc,	%f7,	%f6
	rd	%asi,	%i5
loop_586:
	call	loop_588
loop_587:
	sub	%g5,	%g1,	%l2
	fbg,pt	%fcc2,	loop_589
	fpsub32s	%f2,	%f11,	%f12
loop_588:
	call	loop_590
	call	loop_591
loop_589:
	tvc	%icc,	0x2
	call	loop_592
loop_590:
	fmovdcs	%icc,	%f14,	%f14
loop_591:
	nop

loop_592:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 19
!	Type a   	: 30
!	Type cti   	: 143
!	Type x   	: 8
!	Type f   	: 154
!	Type i   	: 146
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
	set	0x2,	%g3
	set	0xF,	%g4
	set	0xC,	%g5
	set	0xF,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x4,	%i1
	set	-0x2,	%i2
	set	-0x1,	%i3
	set	-0x6,	%i4
	set	-0xA,	%i5
	set	-0x1,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x68429D9F,	%l0
	set	0x6593E07C,	%l1
	set	0x15335CF2,	%l2
	set	0x41337FF5,	%l3
	set	0x491537F2,	%l4
	set	0x7B047645,	%l5
	set	0x66D8F2AA,	%l6
	!# Output registers
	set	-0x1462,	%o0
	set	-0x04E7,	%o1
	set	0x1DDD,	%o2
	set	-0x169E,	%o3
	set	-0x187D,	%o4
	set	0x0414,	%o5
	set	0x1F6C,	%o6
	set	0x0597,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	fabss	%f7,	%f27
	st	%f5,	[%l7 + 0x70]
	movl	%xcc,	0x207,	%o5
	movrne	%i3,	0x2F0,	%i7
	fpsub16	%f16,	%f28,	%f4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o7
	sethi	0x08D2,	%o0
	call	loop_593
	subcc	%o2,	%o3,	%g7
	andcc	%g3,	0x0669,	%o6
	sub	%i4,	%l1,	%l3
loop_593:
	fmovdug	%fcc3,	%f4,	%f22
	nop
	setx	0x09E1CCE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x78F8C6F6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f31,	%f16
	call	loop_594
	call	loop_595
	nop
	setx	0x6261FC27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xD0B1FEA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f8,	%f23
	sir	0x1005
loop_594:
	fones	%f13
loop_595:
	call	loop_596
	tge	%icc,	0x0
	wrpr	%g2,	0x077A,	%tick
	rdhpr	%ver,	%i1
loop_596:
	nop
	set	0x10, %i0
	ldda	[%l7 + %i0] 0xeb,	%g6
	call	loop_597
	fmovdn	%fcc0,	%f22,	%f10
	fmovrse	%i6,	%f29,	%f8
	tg	%icc,	0x0
loop_597:
	srlx	%g4,	%l4,	%i2
	fmuld8ulx16	%f0,	%f28,	%f26
	call	loop_598
	call	loop_599
	edge32	%o4,	%l6,	%l5
	fmovsu	%fcc3,	%f4,	%f8
loop_598:
	fmovslg	%fcc3,	%f29,	%f18
loop_599:
	call	loop_600
	call	loop_601
	call	loop_602
	edge16l	%i0,	%l0,	%o1
loop_600:
	call	loop_603
loop_601:
	fxnor	%f10,	%f0,	%f30
loop_602:
	wrpr	%i5,	%g5,	%cwp
	nop
	setx	0x8444656,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_603:
	fcmped	%fcc0,	%f4,	%f10
	call	loop_604
	movvs	%icc,	%l2,	%g1
	brgz,a	%o5,	loop_605
	tne	%xcc,	0x0
loop_604:
	alignaddr	%i3,	%i7,	%o7
	movle	%fcc1,	0x7C4,	%o0
loop_605:
	rd	%sys_tick_cmpr,	%o3
	call	loop_606
	fmovslg	%fcc1,	%f2,	%f18
	fmul8x16au	%f7,	%f21,	%f18
	call	loop_607
loop_606:
	call	loop_608
	call	loop_609
	nop
	set	0x68, %l2
	stx	%fsr,	[%l7 + %l2]
loop_607:
	call	loop_610
loop_608:
	call	loop_611
loop_609:
	fmovdo	%fcc1,	%f14,	%f6
	fmovrsgz	%g7,	%f26,	%f19
loop_610:
	srlx	%g3,	0x0E,	%o2
loop_611:
	srlx	%o6,	0x1B,	%l1
	call	loop_612
	fmovsvs	%icc,	%f9,	%f10
	edge8ln	%i4,	%l3,	%g2
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f10
loop_612:
	fbl	%fcc2,	loop_613
	rdpr	%gl,	%g6
	nop
	setx	0xD4E95248,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x89655B8F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f15,	%f10
	tge	%xcc,	0x2
loop_613:
	edge16n	%i6,	%i1,	%l4
	tleu	%xcc,	0x5
	call	loop_614
	call	loop_615
	flush	%l7 + 0x50
	wr	%i2,	0x0F1E,	%ccr
loop_614:
	fmovsg	%xcc,	%f19,	%f21
loop_615:
	movneg	%xcc,	0x127,	%o4
	subccc	%l6,	%g4,	%i0
	fmovsvs	%xcc,	%f30,	%f31
	fnand	%f30,	%f0,	%f0
	edge8l	%l5,	%l0,	%i5
	movcs	%xcc,	%g5,	%o1
	movrlez	%g1,	%l2,	%o5
	xorcc	%i3,	0x1512,	%i7
	fmovsge	%fcc0,	%f15,	%f10
	swap	[%l7 + 0x40],	%o7
	fmovdcc	%xcc,	%f18,	%f10
	stbar
	fornot2s	%f10,	%f4,	%f11
	fcmple16	%f6,	%f2,	%o0
	call	loop_616
	movuge	%fcc1,	%o3,	%g3
	call	loop_617
	or	%g7,	0x0E02,	%o2
loop_616:
	fmovsneg	%xcc,	%f1,	%f19
	fnegs	%f25,	%f14
loop_617:
	fcmpes	%fcc3,	%f4,	%f24
	umul	%l1,	0x04CD,	%o6
	rdhpr	%htba,	%l3
	siam	0x0
	call	loop_618
	wrpr	%i4,	%g6,	%pil
	nop
	setx	0xD3F07835,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB3B81142,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f15,	%f2
	nop
	fitos	%f4,	%f17
	fstod	%f17,	%f14
loop_618:
	call	loop_619
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_620
	popc	%i6,	%g2
loop_619:
	movrgez	%l4,	%i2,	%o4
	fmovsul	%fcc3,	%f12,	%f12
loop_620:
	fnegd	%f8,	%f16
	sdivcc	%l6,	%g4,	%i0
	call	loop_621
	ld	[%l7 + 0x08],	%f5
	call	loop_622
	call	loop_623
loop_621:
	fmovdul	%fcc3,	%f22,	%f10
	fmovdule	%fcc3,	%f30,	%f8
loop_622:
	call	loop_624
loop_623:
	fmovrdne	%i1,	%f28,	%f6
	fmovrdne	%l0,	%f18,	%f10
	fone	%f24
loop_624:
	fand	%f24,	%f26,	%f12
	movl	%xcc,	0x779,	%i5
	fornot2s	%f11,	%f1,	%f1
	movne	%fcc3,	0x4FA,	%l5
	subcc	%o1,	%g5,	%g1
	andncc	%l2,	%o5,	%i3
	sll	%o7,	0x0E,	%i7
	fmovdo	%fcc2,	%f14,	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o3
	fmovda	%fcc0,	%f24,	%f6
	call	loop_625
	sdivx	%g7,	0x00,	%g3
	fmovsg	%fcc0,	%f7,	%f30
	bneg,pn	%xcc,	loop_626
loop_625:
	movcc	%xcc,	%l1,	%o6
	tle	%xcc,	0x4
	fxnor	%f28,	%f2,	%f20
loop_626:
	fmovrdgez	%o2,	%f12,	%f26
	fmul8x16al	%f12,	%f26,	%f4
	fnegd	%f12,	%f18
	call	loop_627
	bcc	%xcc,	loop_628
	call	loop_629
	call	loop_630
loop_627:
	tcc	%icc,	0x4
loop_628:
	rdhpr	%ver,	%l3
loop_629:
	nop
	wr	%g0,	0x81,	%asi
	stba	%i4,	[%l7 + 0x55] %asi
loop_630:
	call	loop_631
	nop
	fitos	%f11,	%f25
	bleu	%xcc,	loop_632
	fmovrde	%i6,	%f14,	%f10
loop_631:
	fmul8x16au	%f21,	%f18,	%f30
	udivx	%g6,	%g2,	%l4
loop_632:
	subc	%o4,	%l6,	%i2
	movule	%fcc3,	0x1D6,	%i0
	edge8n	%i1,	%g4,	%i5
	call	loop_633
	fmovsul	%fcc3,	%f28,	%f17
	call	loop_634
	call	loop_635
loop_633:
	fmovde	%xcc,	%f28,	%f18
	fzeros	%f0
loop_634:
	call	loop_636
loop_635:
	call	loop_637
	fpsub32s	%f27,	%f2,	%f24
	fnor	%f16,	%f6,	%f16
loop_636:
	call	loop_638
loop_637:
	call	loop_639
	call	loop_640
	call	loop_641
loop_638:
	call	loop_642
loop_639:
	rd	%y,	%l0
loop_640:
	fmovscs	%icc,	%f28,	%f31
loop_641:
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f20
	fxtos	%f20,	%f7
loop_642:
	call	loop_643
	mulscc	%l5,	%g5,	%g1
	fcmpne16	%f8,	%f26,	%o1
	fcmple32	%f0,	%f16,	%o5
loop_643:
	fmovdleu	%xcc,	%f28,	%f30
	fmovsvs	%icc,	%f15,	%f31
	fzeros	%f23
	call	loop_644
	call	loop_645
	srax	%i3,	0x06,	%l2
	call	loop_646
loop_644:
	call	loop_647
loop_645:
	fmovsule	%fcc3,	%f17,	%f21
	srax	%o7,	%o0,	%i7
loop_646:
	call	loop_648
loop_647:
	call	loop_649
	movcs	%xcc,	0x2A8,	%o3
	movue	%fcc3,	0x5CD,	%g7
loop_648:
	call	loop_650
loop_649:
	fmovsa	%icc,	%f8,	%f17
	call	loop_651
	andn	%g3,	%o6,	%o2
loop_650:
	movl	%xcc,	0x1BF,	%l3
	call	loop_652
loop_651:
	call	loop_653
	sdivcc	%i4,	%l1,	%g6
	xnor	%g2,	0x1572,	%l4
loop_652:
	be,pn	%xcc,	loop_654
loop_653:
	fmovsuge	%fcc1,	%f3,	%f13
	fnot1	%f24,	%f16
	call	loop_655
loop_654:
	tsubcc	%i6,	0x1A47,	%l6
	andcc	%o4,	0x1D00,	%i2
	fpadd32	%f4,	%f26,	%f28
loop_655:
	fxor	%f0,	%f20,	%f10
	call	loop_656
	fmovrdgz	%i1,	%f10,	%f16
	nop
	fitos	%f7,	%f11
	fstod	%f11,	%f8
	movcc	%icc,	%i0,	%i5
loop_656:
	wr	%l0,	%l5,	%ccr
	subccc	%g5,	0x1601,	%g4
	fmovda	%icc,	%f22,	%f16
	movge	%fcc3,	0x2E6,	%g1
	call	loop_657
	fxnors	%f31,	%f21,	%f6
	call	loop_658
	wr	%o1,	0x0F8F,	%pic
loop_657:
	sdivx	%o5,	0x00,	%l2
	fmul8x16al	%f31,	%f14,	%f16
loop_658:
	ble,a	%icc,	loop_659
	fmovd	%f6,	%f16
	rd	%ccr,	%i3
	fmovdge	%xcc,	%f18,	%f6
loop_659:
	fornot1	%f0,	%f24,	%f10
	call	loop_660
	call	loop_661
	fmovrse	%o7,	%f29,	%f20
	nop
	setx	0x41820F99,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xBD7CDB81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f20,	%f21
loop_660:
	call	loop_662
loop_661:
	movre	%i7,	0x10C,	%o0
	call	loop_663
	call	loop_664
loop_662:
	call	loop_665
	fpsub16s	%f13,	%f4,	%f19
loop_663:
	movl	%fcc3,	%o3,	%g3
loop_664:
	faligndata	%f10,	%f26,	%f8
loop_665:
	rdhpr	%hintp,	%o6
	call	loop_666
	movgu	%icc,	%g7,	%o2
	smul	%i4,	0x06EF,	%l1
	or	%g6,	0x0778,	%l3
loop_666:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f23,	[%l7 + 0x40] %asi
	fmovdlg	%fcc3,	%f0,	%f26
	fmovsuge	%fcc0,	%f8,	%f15
	array16	%g2,	%l4,	%l6
	fmovdpos	%xcc,	%f26,	%f2
	fbge,pn	%fcc3,	loop_667
	fmovda	%xcc,	%f24,	%f18
	add	%i6,	%i2,	%i1
	call	loop_668
loop_667:
	nop
	fitos	%f9,	%f31
	fstod	%f31,	%f30
	srl	%o4,	%i0,	%l0
	fpack16	%f8,	%f31
loop_668:
	rdhpr	%ver,	%i5
	popc	%l5,	%g4
	sir	0x047E
	taddcctv	%g5,	0x0633,	%o1
	call	loop_669
	fpadd16	%f22,	%f26,	%f6
	nop
	setx	0x956818B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x3F565E8E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f25,	%f1
	ble,a	%xcc,	loop_670
loop_669:
	call	loop_671
	rd	%sys_tick_cmpr,	%o5
	sllx	%g1,	0x18,	%i3
loop_670:
	nop
	set	0x4C, %i5
	lduwa	[%l7 + %i5] 0x81,	%l2
loop_671:
	wr	%i7,	0x1710,	%y
	fmovdcs	%xcc,	%f0,	%f26
	nop
	setx	0xF9FCA9C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x08FA105C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f8,	%f14
	movre	%o0,	%o3,	%o7
	nop
	set	0x2E, %o5
	lduh	[%l7 + %o5],	%g3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0D] %asi,	%g7
	call	loop_672
	nop
	set	0x78, %g7
	stx	%fsr,	[%l7 + %g7]
	fmovdn	%icc,	%f26,	%f0
	andn	%o6,	0x1B57,	%o2
loop_672:
	rd	%softint,	%l1
	fmovdle	%fcc3,	%f22,	%f12
	fbu,pn	%fcc0,	loop_673
	fmovrsne	%g6,	%f20,	%f30
	edge16n	%l3,	%i4,	%l4
	fnot2	%f14,	%f18
loop_673:
	edge32	%l6,	%g2,	%i2
	call	loop_674
	edge8	%i6,	%i1,	%i0
	fmovdu	%fcc2,	%f24,	%f12
	rdpr	%cansave,	%o4
loop_674:
	fpack16	%f10,	%f12
	fnot2s	%f26,	%f8
	fpmerge	%f4,	%f25,	%f16
	fbug,pn	%fcc1,	loop_675
	call	loop_676
	fbule,pt	%fcc2,	loop_677
	call	loop_678
loop_675:
	edge32n	%l0,	%i5,	%g4
loop_676:
	edge16n	%g5,	%l5,	%o1
loop_677:
	and	%o5,	0x1891,	%g1
loop_678:
	call	loop_679
	fpsub16s	%f30,	%f6,	%f12
	fmul8x16au	%f27,	%f23,	%f2
	call	loop_680
loop_679:
	flushw
	srl	%l2,	0x11,	%i3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%o0
loop_680:
	call	loop_681
	fmuld8sux16	%f5,	%f24,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x5C],	%o7
loop_681:
	fmovda	%fcc1,	%f30,	%f8
	call	loop_682
	fmovsge	%xcc,	%f1,	%f30
	fmovrdlz	%g7,	%f20,	%f30
	nop
	fitod	%f3,	%f18
loop_682:
	rd	%asi,	%g3
	fmovspos	%icc,	%f8,	%f21
	set	0x48, %o1
	stda	%o2,	[%l7 + %o1] 0x27
	membar	#Sync
	call	loop_683
	movgu	%icc,	0x305,	%l1
	tn	%icc,	0x4
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f2
loop_683:
	xor	%o6,	%l3,	%i4
	movpos	%xcc,	%l4,	%l6
	call	loop_684
	call	loop_685
	fnegd	%f30,	%f16
	call	loop_686
loop_684:
	array16	%g2,	%g6,	%i6
loop_685:
	smul	%i1,	%i2,	%i0
	call	loop_687
loop_686:
	bpos,a,pn	%xcc,	loop_688
	bshuffle	%f8,	%f6,	%f12
	edge16n	%o4,	%i5,	%g4
loop_687:
	andn	%l0,	0x037A,	%l5
loop_688:
	fnot2s	%f28,	%f14
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g5,	%o1
	set	0x48, %l6
	stba	%g1,	[%l7 + %l6] 0x2b
	membar	#Sync
	edge16l	%o5,	%l2,	%i3
	call	loop_689
	fmovrslz	%o0,	%f25,	%f19
	sdivx	%o3,	0x00,	%o7
	fnot2	%f8,	%f20
loop_689:
	andn	%g7,	0x189E,	%i7
	orncc	%o2,	%l1,	%o6
	movue	%fcc2,	0x7BE,	%g3
	set	0x64, %i3
	lduba	[%l7 + %i3] 0x81,	%i4
	fxors	%f9,	%f11,	%f22
	nop
	setx	0x2AA5F36B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xE8DF0673,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f4,	%f8
	call	loop_690
	rdhpr	%htba,	%l4
	fand	%f30,	%f0,	%f14
	sdivx	%l6,	%g2,	%g6
loop_690:
	edge32	%i6,	%l3,	%i2
	andcc	%i1,	%i0,	%o4
	ble,pt	%xcc,	loop_691
	fors	%f10,	%f18,	%f8
	fone	%f4
	popc	%g4,	%l0
loop_691:
	call	loop_692
	fpack32	%f12,	%f6,	%f2
	tvc	%xcc,	0x7
	fnegs	%f9,	%f10
loop_692:
	fornot1s	%f19,	%f26,	%f17
	call	loop_693
	sdiv	%l5,	%g5,	%i5
	tleu	%icc,	0x7
	call	loop_694
loop_693:
	call	loop_695
	bn,a	%xcc,	loop_696
	fnor	%f20,	%f28,	%f16
loop_694:
	tgu	%xcc,	0x2
loop_695:
	srl	%o1,	0x1F,	%g1
loop_696:
	fnands	%f0,	%f3,	%f13
	edge32ln	%o5,	%i3,	%o0
	fsrc2s	%f5,	%f18
	fnegs	%f4,	%f28
	brlez	%o3,	loop_697
	orncc	%l2,	%o7,	%g7
	udivcc	%i7,	%l1,	%o6
	call	loop_698
loop_697:
	call	loop_699
	call	loop_700
	call	loop_701
loop_698:
	tleu	%icc,	0x6
loop_699:
	call	loop_702
loop_700:
	smulcc	%o2,	0x0AF5,	%g3
loop_701:
	call	loop_703
	wrpr	%i4,	0x09AF,	%cwp
loop_702:
	fpadd32	%f10,	%f16,	%f0
	rdpr	%tl,	%l4
loop_703:
	orncc	%g2,	0x1DB9,	%g6
	fmovdcs	%icc,	%f26,	%f8
	movrne	%l6,	0x09C,	%l3
	call	loop_704
	fmuld8sux16	%f12,	%f14,	%f22
	or	%i6,	0x15D0,	%i1
	fxnors	%f19,	%f2,	%f22
loop_704:
	nop
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc0
	andn	%i2,	0x12F1,	%o4
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f31
	movvc	%icc,	0x231,	%g4
	alignaddrl	%i0,	%l0,	%g5
	fmovsue	%fcc0,	%f4,	%f2
	orn	%i5,	0x1C53,	%l5
	fmovrse	%g1,	%f2,	%f22
	movrgez	%o5,	0x253,	%o1
	nop
	set	0x7A, %g3
	lduh	[%l7 + %g3],	%i3
	bneg,pn	%xcc,	loop_705
	call	loop_706
	nop
	set	0x69, %i1
	ldub	[%l7 + %i1],	%o3
	fmovdle	%fcc2,	%f14,	%f14
loop_705:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f30
	fxtod	%f30,	%f24
loop_706:
	call	loop_707
	fmovdl	%fcc3,	%f4,	%f10
	fmovdn	%icc,	%f14,	%f16
	nop
	fitos	%f14,	%f2
	fstoi	%f2,	%f10
loop_707:
	movne	%xcc,	0x40E,	%o0
	srax	%l2,	%g7,	%i7
	call	loop_708
	wrpr	%o7,	0x0AFD,	%pil
	tge	%icc,	0x0
	call	loop_709
loop_708:
	fpmerge	%f6,	%f12,	%f20
	call	loop_710
	fxor	%f4,	%f26,	%f8
loop_709:
	tle	%icc,	0x5
	movo	%fcc0,	0x3E2,	%l1
loop_710:
	fcmple32	%f0,	%f20,	%o2
	call	loop_711
	call	loop_712
	call	loop_713
	tcs	%icc,	0x5
loop_711:
	ldsh	[%l7 + 0x12],	%o6
loop_712:
	fsrc1	%f12,	%f0
loop_713:
	sdivcc	%g3,	0x00,	%i4
	nop
	setx	0x2E2742F6B9D55726,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x6741620B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f26,	%f30
	alignaddr	%l4,	%g6,	%l6
	call	loop_714
	bvc,pn	%xcc,	loop_715
	smul	%l3,	%i6,	%g2
	fmuld8sux16	%f13,	%f28,	%f12
loop_714:
	call	loop_716
loop_715:
	call	loop_717
	fxnor	%f12,	%f12,	%f2
	orcc	%i2,	%i1,	%o4
loop_716:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
loop_717:
	nop
	fitod	%f3,	%f14
	call	loop_718
	fmovrde	%l0,	%f2,	%f12
	stx	%fsr,	[%l7 + 0x50]
	call	loop_719
loop_718:
	call	loop_720
	tle	%icc,	0x2
	fpack16	%f16,	%f23
loop_719:
	fmovdule	%fcc0,	%f16,	%f12
loop_720:
	call	loop_721
	call	loop_722
	fbul	%fcc0,	loop_723
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f24
loop_721:
	call	loop_724
loop_722:
	fmovdlg	%fcc3,	%f16,	%f26
loop_723:
	call	loop_725
	call	loop_726
loop_724:
	call	loop_727
	call	loop_728
loop_725:
	siam	0x0
loop_726:
	fmovrsne	%g4,	%f9,	%f7
loop_727:
	edge32n	%g5,	%l5,	%i5
loop_728:
	movrne	%o5,	%g1,	%i3
	fones	%f25
	call	loop_729
	nop
	set	0x12, %i7
	ldub	[%l7 + %i7],	%o1
	movrlez	%o3,	0x114,	%l2
	call	loop_730
loop_729:
	sub	%g7,	%o0,	%o7
	orn	%l1,	0x1451,	%o2
	nop
	setx	loop_731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012400001404,	%l0,	%l1
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
loop_730:
	movu	%fcc0,	0x054,	%o6
	sub	%g3,	0x1A6C,	%i4
	fmovrse	%i7,	%f14,	%f22
loop_731:
	umul	%g6,	%l4,	%l6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 29
!	Type a   	: 26
!	Type cti   	: 139
!	Type x   	: 13
!	Type f   	: 154
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
	set	0xF,	%g1
	set	0xE,	%g2
	set	0x7,	%g3
	set	0xE,	%g4
	set	0x5,	%g5
	set	0x2,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0x4,	%i2
	set	-0xC,	%i3
	set	-0xF,	%i4
	set	-0xE,	%i5
	set	-0xE,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x712018A6,	%l0
	set	0x348B6969,	%l1
	set	0x2A0B8625,	%l2
	set	0x6BB81CD0,	%l3
	set	0x4ABF58A7,	%l4
	set	0x13AA88DF,	%l5
	set	0x0C885449,	%l6
	!# Output registers
	set	0x1A6F,	%o0
	set	-0x0AF5,	%o1
	set	0x1211,	%o2
	set	0x1AB1,	%o3
	set	-0x0D1A,	%o4
	set	0x1974,	%o5
	set	0x1417,	%o6
	set	0x13A9,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	call	loop_732
	call	loop_733
	fcmpes	%fcc1,	%f18,	%f13
	call	loop_734
loop_732:
	call	loop_735
loop_733:
	edge8	%i6,	%g2,	%i2
	fmovsuge	%fcc3,	%f3,	%f24
loop_734:
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f24
loop_735:
	fbu,pt	%fcc1,	loop_736
	fmovrdgez	%i1,	%f4,	%f2
	fmovrdlez	%o4,	%f0,	%f8
	fmovdcs	%icc,	%f12,	%f14
loop_736:
	call	loop_737
	call	loop_738
	sllx	%l3,	0x08,	%i0
	movge	%xcc,	0x6AD,	%g4
loop_737:
	prefetch	[%l7 + 0x20],	 1
loop_738:
	nop
	set	0x68, %i4
	stx	%g5,	[%l7 + %i4]
	call	loop_739
	edge32ln	%l5,	%i5,	%o5
	movleu	%icc,	0x22A,	%l0
	bmask	%i3,	%o1,	%o3
loop_739:
	fmovsug	%fcc2,	%f10,	%f12
	tcs	%xcc,	0x3
	sllx	%l2,	%g7,	%g1
	tg	%xcc,	0x2
	fmovdcc	%xcc,	%f26,	%f6
	tne	%xcc,	0x1
	fmovdu	%fcc2,	%f16,	%f26
	edge16n	%o0,	%l1,	%o7
	call	loop_740
	fmovsuge	%fcc1,	%f4,	%f10
	call	loop_741
	fnor	%f2,	%f18,	%f16
loop_740:
	fmovdlg	%fcc2,	%f2,	%f10
	bvc,pn	%xcc,	loop_742
loop_741:
	call	loop_743
	pdist	%f20,	%f20,	%f10
	fnor	%f20,	%f30,	%f26
loop_742:
	call	loop_744
loop_743:
	sethi	0x0D88,	%o6
	call	loop_745
	call	loop_746
loop_744:
	call	loop_747
	fcmpes	%fcc1,	%f10,	%f4
loop_745:
	call	loop_748
loop_746:
	call	loop_749
loop_747:
	wr	%g3,	0x0FDF,	%softint
	call	loop_750
loop_748:
	bcs	%icc,	loop_751
loop_749:
	fcmpes	%fcc0,	%f21,	%f9
	fmovsvc	%xcc,	%f7,	%f6
loop_750:
	taddcctv	%o2,	0x18B7,	%i4
loop_751:
	array16	%i7,	%l4,	%l6
	call	loop_752
	fmovrsgez	%g6,	%f6,	%f6
	fmovrsne	%g2,	%f13,	%f15
	call	loop_753
loop_752:
	fsrc1	%f18,	%f26
	fmovrsgz	%i2,	%f12,	%f1
	call	loop_754
loop_753:
	call	loop_755
	fcmpeq16	%f30,	%f0,	%i6
	nop
	setx loop_756, %l0, %l1
	jmpl %l1, %o4
loop_754:
	fmovdcs	%xcc,	%f12,	%f20
loop_755:
	call	loop_757
	tneg	%xcc,	0x7
loop_756:
	wrpr	%i1,	0x05D4,	%tick
	set	0x1C, %o7
	swapa	[%l7 + %o7] 0x18,	%l3
loop_757:
	call	loop_758
	call	loop_759
	fmovslg	%fcc0,	%f11,	%f25
	wr	%g0,	0x04,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
loop_758:
	call	loop_760
loop_759:
	array8	%i0,	%g5,	%i5
	ldstub	[%l7 + 0x3A],	%l5
	addcc	%l0,	0x1D14,	%o5
loop_760:
	fnegs	%f30,	%f12
	fbu,a,pn	%fcc1,	loop_761
	subccc	%i3,	%o3,	%l2
	brlz	%g7,	loop_762
	fxnors	%f4,	%f11,	%f11
loop_761:
	fcmpgt16	%f14,	%f22,	%o1
	nop
	setx	0x2D75023947A4D8F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x042514E80152D2F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f2,	%f18
loop_762:
	fandnot2s	%f1,	%f30,	%f16
	fmovda	%xcc,	%f6,	%f6
	fpadd16	%f24,	%f14,	%f0
	movle	%icc,	0x7C1,	%o0
	taddcctv	%g1,	0x0D07,	%o7
	call	loop_763
	fors	%f28,	%f28,	%f10
	call	loop_764
	fnand	%f4,	%f8,	%f22
loop_763:
	call	loop_765
	xnor	%l1,	0x0DD6,	%o6
loop_764:
	call	loop_766
	movneg	%icc,	%g3,	%o2
loop_765:
	sub	%i4,	0x003F,	%l4
	add	%i7,	%g6,	%l6
loop_766:
	fcmps	%fcc3,	%f7,	%f29
	fpadd16	%f22,	%f24,	%f28
	tl	%xcc,	0x6
	tge	%icc,	0x1
	edge16n	%i2,	%g2,	%o4
	fmovs	%f0,	%f10
	call	loop_767
	call	loop_768
	rdhpr	%ver,	%i1
	rd	%sys_tick_cmpr,	%l3
loop_767:
	rdhpr	%hpstate,	%g4
loop_768:
	movleu	%xcc,	%i0,	%g5
	addccc	%i6,	0x10E3,	%l5
	bvc,a,pt	%xcc,	loop_769
	tge	%icc,	0x2
	call	loop_770
	fmovduge	%fcc0,	%f0,	%f22
loop_769:
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f12
	stbar
loop_770:
	movg	%fcc1,	%i5,	%l0
	sdivcc	%i3,	0x00,	%o3
	rdpr	%otherwin,	%l2
	prefetch	[%l7 + 0x64],	 0
	fpadd32s	%f23,	%f18,	%f10
	tl	%xcc,	0x1
	nop
	set	0x60, %l0
	stx	%g7,	[%l7 + %l0]
	movlg	%fcc3,	0x22B,	%o1
	mulscc	%o0,	0x034F,	%g1
	orncc	%o5,	0x1EEA,	%l1
	fbge,a,pn	%fcc3,	loop_771
	fmovd	%f14,	%f30
	movue	%fcc2,	%o7,	%g3
	fmovdneg	%icc,	%f8,	%f24
loop_771:
	movue	%fcc1,	0x19A,	%o6
	call	loop_772
	call	loop_773
	fmul8x16au	%f0,	%f0,	%f14
	sdiv	%i4,	0x00,	%l4
loop_772:
	nop
	setx	0x133D13D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA7C59804,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f12,	%f4
loop_773:
	call	loop_774
	rdhpr	%ver,	%o2
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f0
	nop
	fitod	%f8,	%f4
	fdtox	%f4,	%f4
loop_774:
	movl	%fcc2,	0x43F,	%i7
	nop
	set	0x1E, %g6
	ldsb	[%l7 + %g6],	%l6
	call	loop_775
	edge16l	%i2,	%g6,	%o4
	call	loop_776
	call	loop_777
loop_775:
	nop
	fitos	%f8,	%f16
	fstoi	%f16,	%f7
	call	loop_778
loop_776:
	movlg	%fcc1,	%g2,	%i1
loop_777:
	ldub	[%l7 + 0x45],	%l3
	fmovdo	%fcc3,	%f26,	%f8
loop_778:
	fmovdl	%fcc0,	%f30,	%f4
	call	loop_779
	movre	%i0,	0x349,	%g5
	fabss	%f12,	%f6
	fmovrdgz	%g4,	%f12,	%f4
loop_779:
	tne	%xcc,	0x6
	call	loop_780
	call	loop_781
	rd	%pc,	%i6
	andn	%i5,	0x1385,	%l5
loop_780:
	fnands	%f30,	%f17,	%f4
loop_781:
	fmovdleu	%icc,	%f12,	%f16
	fbne	%fcc2,	loop_782
	call	loop_783
	rd	%pc,	%l0
	movneg	%icc,	0x5C3,	%i3
loop_782:
	nop
	setx	0xB79F835B41AC4941,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x97A282B5F22DBFA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f2,	%f12
loop_783:
	fbne,a,pt	%fcc0,	loop_784
	call	loop_785
	pdist	%f12,	%f22,	%f14
	ldsw	[%l7 + 0x10],	%l2
loop_784:
	call	loop_786
loop_785:
	rd	%y,	%g7
	call	loop_787
	call	loop_788
loop_786:
	fblg	%fcc3,	loop_789
	fpadd32	%f24,	%f18,	%f8
loop_787:
	call	loop_790
loop_788:
	fmovdne	%fcc2,	%f10,	%f10
loop_789:
	andcc	%o3,	0x1EA4,	%o1
	fbg	%fcc0,	loop_791
loop_790:
	call	loop_792
	fmovdcs	%xcc,	%f30,	%f12
	fandnot2	%f30,	%f0,	%f22
loop_791:
	srax	%g1,	0x1A,	%o0
loop_792:
	fnegs	%f10,	%f30
	smulcc	%o5,	%o7,	%g3
	wrpr 	%g0, 	0x0, 	%gl
	movle	%fcc3,	0x2F1,	%o6
	fpackfix	%f4,	%f9
	fbuge	%fcc1,	loop_793
	tne	%icc,	0x3
	fnot1	%f22,	%f14
	subc	%l4,	%o2,	%i7
loop_793:
	call	loop_794
	nop
	set	0x6C, %l4
	lduw	[%l7 + %l4],	%i2
	sethi	0x04E4,	%l6
	fmovs	%f5,	%f7
loop_794:
	call	loop_795
	tpos	%xcc,	0x0
	call	loop_796
	fnegs	%f18,	%f12
loop_795:
	call	loop_797
	srax	%o4,	%g2,	%i1
loop_796:
	call	loop_798
	edge8	%l3,	%i0,	%g6
loop_797:
	mulx	%g5,	%i6,	%i5
	fmovdg	%icc,	%f4,	%f14
loop_798:
	call	loop_799
	fmovrdne	%g4,	%f18,	%f24
	fmovrdgez	%l5,	%f0,	%f2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f16
loop_799:
	call	loop_800
	call	loop_801
	rd	%y,	%l0
	rd	%fprs,	%l2
loop_800:
	fmovd	%f8,	%f6
loop_801:
	movu	%fcc3,	%g7,	%i3
	tsubcc	%o1,	0x143C,	%g1
	call	loop_802
	wrpr	%o3,	0x0FC6,	%cwp
	edge8n	%o5,	%o7,	%o0
	movl	%fcc1,	0x6E3,	%g3
loop_802:
	fornot1	%f14,	%f8,	%f4
	call	loop_803
	call	loop_804
	call	loop_805
	movl	%fcc0,	%l1,	%i4
loop_803:
	nop
	fitod	%f12,	%f20
loop_804:
	movpos	%xcc,	0x649,	%l4
loop_805:
	fmuld8ulx16	%f2,	%f11,	%f6
	call	loop_806
	fcmple16	%f14,	%f26,	%o6
	srl	%o2,	%i7,	%l6
	call	loop_807
loop_806:
	fabss	%f13,	%f17
	edge16n	%o4,	%i2,	%i1
	orncc	%g2,	%i0,	%g6
loop_807:
	taddcc	%l3,	0x0D04,	%g5
	call	loop_808
	fsrc1	%f30,	%f12
	fpmerge	%f18,	%f29,	%f4
	edge32	%i6,	%i5,	%g4
loop_808:
	movrne	%l0,	0x2C3,	%l2
	call	loop_809
	fmovdpos	%xcc,	%f6,	%f28
	call	loop_810
	nop
	setx	0x49E2207E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xEF876110,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f19,	%f25
loop_809:
	fmovsvc	%xcc,	%f14,	%f18
	fmovscc	%icc,	%f11,	%f25
loop_810:
	xnorcc	%l5,	0x1748,	%g7
	edge8l	%i3,	%g1,	%o1
	movleu	%icc,	%o5,	%o3
	fmovsul	%fcc2,	%f21,	%f12
	call	loop_811
	flush	%l7 + 0x24
	fmovrslez	%o7,	%f22,	%f5
	faligndata	%f18,	%f10,	%f10
loop_811:
	movleu	%xcc,	0x682,	%o0
	fmovsu	%fcc3,	%f6,	%f7
	set	0x31, %o6
	ldsba	[%l7 + %o6] 0x80,	%g3
	fornot2s	%f17,	%f18,	%f9
	call	loop_812
	mulx	%i4,	0x06F4,	%l1
	tne	%xcc,	0x0
	call	loop_813
loop_812:
	fabsd	%f6,	%f20
	set	0x2C, %l3
	lda	[%l7 + %l3] 0x04,	%f26
loop_813:
	rd	%fprs,	%l4
	fmovso	%fcc1,	%f14,	%f12
	stb	%o2,	[%l7 + 0x7C]
	alignaddrl	%i7,	%l6,	%o6
	nop
	setx	0x164C7B38100FD701,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x13321D2977D3FAC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f12,	%f18
	call	loop_814
	call	loop_815
	rdhpr	%hpstate,	%o4
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_814:
	andcc	%i2,	%i1,	%i0
loop_815:
	edge8ln	%g2,	%g6,	%l3
	fmovsu	%fcc0,	%f28,	%f12
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%g5
	edge16l	%i6,	%g4,	%i5
	fmovrsgez	%l2,	%f16,	%f7
	rdhpr	%hsys_tick_cmpr,	%l0
	call	loop_816
	movcs	%xcc,	0x5A8,	%l5
	call	loop_817
	nop
	fitod	%f17,	%f0
loop_816:
	ldsb	[%l7 + 0x71],	%g7
	fsrc2s	%f0,	%f7
loop_817:
	fmovde	%fcc2,	%f2,	%f12
	fmovsneg	%icc,	%f2,	%f20
	call	loop_818
	rd	%pc,	%i3
	fones	%f3
	call	loop_819
loop_818:
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f0
	fmovslg	%fcc0,	%f8,	%f22
	call	loop_820
loop_819:
	movug	%fcc2,	%g1,	%o1
	call	loop_821
	call	loop_822
loop_820:
	call	loop_823
	fxnor	%f20,	%f16,	%f8
loop_821:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_822:
	edge8	%o7,	%o0,	%g3
loop_823:
	flush	%l7 + 0x5C
	nop
	setx	0xBCC37C1A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f17
	bgu,a	%xcc,	loop_824
	fmovdu	%fcc3,	%f8,	%f14
	siam	0x5
	call	loop_825
loop_824:
	fpsub32	%f16,	%f10,	%f26
	wr	%g0,	0x89,	%asi
	stxa	%l1,	[%l7 + 0x58] %asi
loop_825:
	fmovsu	%fcc0,	%f29,	%f22
	call	loop_826
	tneg	%xcc,	0x5
	movug	%fcc1,	0x7B0,	%i4
	call	loop_827
loop_826:
	call	loop_828
	call	loop_829
	nop
	set	0x1C, %i6
	prefetch	[%l7 + %i6],	 4
loop_827:
	movo	%fcc0,	%o2,	%i7
loop_828:
	add	%l6,	0x11E5,	%o6
loop_829:
	call	loop_830
	call	loop_831
	movrgez	%o4,	0x222,	%i2
	call	loop_832
loop_830:
	fzero	%f30
loop_831:
	movle	%xcc,	%l4,	%i1
	fnegs	%f25,	%f29
loop_832:
	fpadd16	%f6,	%f22,	%f28
	fnot2	%f28,	%f2
	call	loop_833
	tvc	%xcc,	0x5
	movneg	%xcc,	%g2,	%i0
	tgu	%icc,	0x7
loop_833:
	fmovrse	%l3,	%f31,	%f23
	fxors	%f20,	%f2,	%f18
	std	%f6,	[%l7 + 0x18]
	call	loop_834
	fmovspos	%xcc,	%f12,	%f9
	call	loop_835
	edge8n	%g6,	%i6,	%g5
loop_834:
	fmovdneg	%xcc,	%f24,	%f22
	call	loop_836
loop_835:
	call	loop_837
	call	loop_838
	wr	%i5,	%l2,	%ccr
loop_836:
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f6
	fxtod	%f6,	%f0
loop_837:
	tle	%xcc,	0x6
loop_838:
	fmovrdne	%g4,	%f22,	%f6
	wr	%l0,	%g7,	%ccr
	fbule,a	%fcc0,	loop_839
	call	loop_840
	call	loop_841
	fnand	%f18,	%f22,	%f24
loop_839:
	fpadd32s	%f17,	%f10,	%f10
loop_840:
	call	loop_842
loop_841:
	fsrc1s	%f28,	%f4
	sethi	0x1743,	%l5
	edge8l	%i3,	%o1,	%g1
loop_842:
	fnor	%f2,	%f14,	%f2
	nop
	setx	0x9855CAC37B89E1EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA57A4241ED8C3CDA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f16,	%f16
	movul	%fcc2,	%o3,	%o7
	nop
	fitos	%f5,	%f24
	fstoi	%f24,	%f17
	call	loop_843
	call	loop_844
	movge	%icc,	0x614,	%o5
	array32	%o0,	%l1,	%g3
loop_843:
	call	loop_845
loop_844:
	call	loop_846
	fand	%f28,	%f22,	%f22
	call	loop_847
loop_845:
	call	loop_848
loop_846:
	fbuge	%fcc1,	loop_849
	sdiv	%o2,	%i4,	%i7
loop_847:
	call	loop_850
loop_848:
	fmovsn	%icc,	%f22,	%f5
loop_849:
	subccc	%o6,	%o4,	%i2
	fpsub16	%f18,	%f10,	%f26
loop_850:
	movn	%fcc1,	0x20D,	%l6
	fxnor	%f28,	%f4,	%f18
	call	loop_851
	fmovsleu	%xcc,	%f30,	%f30
	xnorcc	%l4,	0x134C,	%g2
	call	loop_852
loop_851:
	stx	%i1,	[%l7 + 0x30]
	fxnors	%f19,	%f29,	%f31
	bg,a	%xcc,	loop_853
loop_852:
	pdist	%f26,	%f12,	%f16
	movneg	%icc,	%l3,	%i0
	tle	%icc,	0x3
loop_853:
	fcmpne16	%f0,	%f28,	%i6
	movre	%g5,	%g6,	%l2
	call	loop_854
	call	loop_855
	tsubcc	%g4,	%i5,	%g7
	movre	%l0,	%l5,	%i3
loop_854:
	nop
	fitos	%f8,	%f18
	fstox	%f18,	%f0
loop_855:
	call	loop_856
	call	loop_857
	fmul8sux16	%f18,	%f12,	%f18
	call	loop_858
loop_856:
	call	loop_859
loop_857:
	call	loop_860
	movue	%fcc1,	0x73F,	%g1
loop_858:
	call	loop_861
loop_859:
	call	loop_862
loop_860:
	bge,a,pt	%icc,	loop_863
	call	loop_864
loop_861:
	rdhpr	%ver,	%o1
loop_862:
	fcmpeq16	%f0,	%f28,	%o7
loop_863:
	tne	%xcc,	0x5
loop_864:
	wrpr	%o3,	%o5,	%pil
	xor	%o0,	0x0CA0,	%g3
	nop
	setx	0x37E4C5BC543F4A31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4B46DB4A6AD6715D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f28
	sdivx	%l1,	0x00,	%i4
	call	loop_865
	call	loop_866
	fpadd16	%f28,	%f24,	%f0
	bcs	%xcc,	loop_867
loop_865:
	movuge	%fcc3,	0x30F,	%o2
loop_866:
	call	loop_868
	call	loop_869
loop_867:
	fbn	%fcc2,	loop_870
	andncc	%o6,	%i7,	%i2
loop_868:
	ta	%xcc,	0x3
loop_869:
	wr	%l6,	0x040C,	%clear_softint
loop_870:
	fmovdvs	%xcc,	%f2,	%f18
	andncc	%l4,	0x18D7,	%g2
	fmovslg	%fcc1,	%f20,	%f25
	call	loop_871
	movpos	%xcc,	%i1,	%l3
	bvs	%xcc,	loop_872
	flushw
loop_871:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	subcc	%i6,	%g5,	%g6
loop_872:
	fzero	%f24
	call	loop_873
	tsubcc	%i0,	0x1E15,	%g4
	brz,a,pt	%i5,	loop_874
	wrpr	%l2,	%l0,	%pil
loop_873:
	tsubcctv	%g7,	%l5,	%i3
	mova	%fcc0,	0x105,	%g1
loop_874:
	array32	%o1,	%o3,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E1, 	%hsys_tick_cmpr
	fmuld8ulx16	%f16,	%f15,	%f26
	move	%fcc3,	0x484,	%o7
	bge,a,pt	%icc,	loop_875
	movrgez	%g3,	%l1,	%i4
	call	loop_876
	call	loop_877
loop_875:
	fpadd32	%f30,	%f16,	%f20
	call	loop_878
loop_876:
	fnegd	%f26,	%f16
loop_877:
	edge32ln	%o6,	%i7,	%i2
	mova	%fcc1,	0x736,	%o2
loop_878:
	call	loop_879
	fmovdlg	%fcc0,	%f14,	%f14
	nop
	setx	0x13F42F62,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x6C22121B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f12,	%f13
	sdivcc	%l6,	%l4,	%g2
loop_879:
	call	loop_880
	movrgz	%l3,	%o4,	%i6
	call	loop_881
	stbar
loop_880:
	call	loop_882
	fnot1	%f4,	%f12
loop_881:
	call	loop_883
	tpos	%xcc,	0x7
loop_882:
	st	%f20,	[%l7 + 0x24]
	fxors	%f3,	%f10,	%f8
loop_883:
	call	loop_884
	tcs	%icc,	0x3
	lduh	[%l7 + 0x3A],	%i1
	fpadd32s	%f20,	%f30,	%f17
loop_884:
	tpos	%xcc,	0x5
	fmul8x16al	%f0,	%f4,	%f10
	call	loop_885
	sdivx	%g6,	0x00,	%i0
	call	loop_886
	movn	%fcc2,	0x1B8,	%g4
loop_885:
	edge16	%i5,	%l2,	%l0
	fpack16	%f18,	%f14
loop_886:
	call	loop_887
	fmovdue	%fcc3,	%f18,	%f28
	call	loop_888
	movul	%fcc3,	%g5,	%l5
loop_887:
	alignaddrl	%g7,	%g1,	%i3
	call	loop_889
loop_888:
	nop

loop_889:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 28
!	Type a   	: 27
!	Type x   	: 7
!	Type cti   	: 158
!	Type f   	: 143
!	Type i   	: 137
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
	set	0x7,	%g2
	set	0x0,	%g3
	set	0x7,	%g4
	set	0xD,	%g5
	set	0x5,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xF,	%i1
	set	-0x6,	%i2
	set	-0x6,	%i3
	set	-0x8,	%i4
	set	-0xB,	%i5
	set	-0xD,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x48BEF528,	%l0
	set	0x1308E4E4,	%l1
	set	0x54A57772,	%l2
	set	0x5185CFB1,	%l3
	set	0x064FE883,	%l4
	set	0x740621A0,	%l5
	set	0x061860A5,	%l6
	!# Output registers
	set	0x09B9,	%o0
	set	-0x1CCB,	%o1
	set	0x1F27,	%o2
	set	-0x0B9F,	%o3
	set	0x005B,	%o4
	set	-0x193E,	%o5
	set	0x07C2,	%o6
	set	-0x1055,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	sub	%o1,	%o5,	%o3
	stbar
	subc	%o7,	0x1A01,	%o0
	call	loop_890
	call	loop_891
	call	loop_892
	call	loop_893
loop_890:
	call	loop_894
loop_891:
	call	loop_895
loop_892:
	call	loop_896
loop_893:
	call	loop_897
loop_894:
	call	loop_898
loop_895:
	fmovrdgz	%g3,	%f8,	%f26
loop_896:
	fmovdle	%fcc0,	%f30,	%f6
loop_897:
	call	loop_899
loop_898:
	movu	%fcc0,	0x30D,	%i4
	fmovsge	%icc,	%f11,	%f22
	call	loop_900
loop_899:
	fmovsvc	%xcc,	%f0,	%f0
	andcc	%o6,	0x168B,	%l1
	call	loop_901
loop_900:
	alignaddrl	%i7,	%i2,	%l6
	call	loop_902
	call	loop_903
loop_901:
	sdivcc	%o2,	0x00,	%g2
	movneg	%xcc,	0x33B,	%l4
loop_902:
	call	loop_904
loop_903:
	fble	%fcc0,	loop_905
	movo	%fcc3,	0x69A,	%l3
	rd	%softint,	%i6
loop_904:
	bne,a,pt	%icc,	loop_906
loop_905:
	movue	%fcc1,	0x2BB,	%o4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g6
loop_906:
	nop
	set	0x4D, %g2
	ldsba	[%l7 + %g2] 0x10,	%i0
	call	loop_907
	fmovrslez	%g4,	%f24,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x039, 	%hsys_tick_cmpr
	movgu	%xcc,	0x16C,	%i1
loop_907:
	taddcc	%l0,	0x1293,	%l2
	call	loop_908
	fmovdgu	%xcc,	%f2,	%f2
	call	loop_909
	fcmpgt16	%f28,	%f10,	%g5
loop_908:
	rdpr	%wstate,	%l5
	bl,a,pn	%xcc,	loop_910
loop_909:
	movule	%fcc1,	%g7,	%g1
	fmovde	%fcc2,	%f10,	%f18
	add	%i3,	0x0B34,	%o5
loop_910:
	membar	0x5D
	nop
	fitos	%f1,	%f24
	fstoi	%f24,	%f27
	fmovsuge	%fcc2,	%f14,	%f14
	call	loop_911
	call	loop_912
	rd	%asi,	%o3
	fcmple16	%f12,	%f18,	%o7
loop_911:
	movue	%fcc3,	0x318,	%o0
loop_912:
	call	loop_913
	array8	%o1,	%g3,	%o6
	fpack32	%f8,	%f10,	%f18
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f11
loop_913:
	fmovdvs	%icc,	%f8,	%f28
	fmovdlg	%fcc3,	%f22,	%f18
	smul	%l1,	0x0525,	%i7
	movneg	%xcc,	0x59A,	%i4
	movg	%fcc2,	%i2,	%o2
	brlez,a,pt	%g2,	loop_914
	call	loop_915
	movrgez	%l6,	%l4,	%l3
	rd	%fprs,	%o4
loop_914:
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f10
loop_915:
	call	loop_916
	fmovrslz	%i6,	%f19,	%f16
	rd	%fprs,	%g6
	for	%f8,	%f20,	%f10
loop_916:
	call	loop_917
	addcc	%i0,	%g4,	%i5
	srlx	%i1,	%l0,	%g5
	bg,pt	%xcc,	loop_918
loop_917:
	nop
	set	0x30, %o4
	sth	%l5,	[%l7 + %o4]
	nop
	set	0x2B, %o2
	ldsb	[%l7 + %o2],	%l2
	wr	%g7,	0x0877,	%y
loop_918:
	fmovduge	%fcc1,	%f16,	%f30
	call	loop_919
	fpadd32	%f4,	%f20,	%f18
	stbar
	ble,a,pt	%xcc,	loop_920
loop_919:
	mulscc	%g1,	0x0834,	%o5
	wr	%i3,	0x1486,	%set_softint
	nop
	setx loop_921, %l0, %l1
	jmpl %l1, %o3
loop_920:
	fpsub16	%f12,	%f14,	%f4
	array32	%o7,	%o1,	%o0
	nop
	set	0x74, %l5
	ldsw	[%l7 + %l5],	%g3
loop_921:
	bmask	%o6,	%l1,	%i4
	call	loop_922
	fmovdvs	%icc,	%f2,	%f14
	fand	%f12,	%f14,	%f30
	movgu	%icc,	0x3DF,	%i2
loop_922:
	fbul,pt	%fcc2,	loop_923
	call	loop_924
	srlx	%i7,	%o2,	%l6
	call	loop_925
loop_923:
	call	loop_926
loop_924:
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f4
	udivcc	%l4,	%l3,	%o4
loop_925:
	movneg	%icc,	0x011,	%g2
loop_926:
	fmovs	%f2,	%f5
	fmovsge	%xcc,	%f15,	%f1
	tcc	%xcc,	0x1
	srlx	%i6,	%i0,	%g4
	movg	%fcc0,	%g6,	%i1
	fones	%f25
	rdpr	%otherwin,	%i5
	call	loop_927
	sllx	%g5,	%l5,	%l2
	fzeros	%f26
	call	loop_928
loop_927:
	call	loop_929
	fmovsge	%xcc,	%f18,	%f4
	alignaddr	%g7,	%g1,	%o5
loop_928:
	andcc	%i3,	%o3,	%l0
loop_929:
	tne	%icc,	0x1
	wrpr	%o7,	0x0A9C,	%pil
	nop
	setx	0x9D08E59D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xAE939A56,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f25,	%f12
	call	loop_930
	edge32	%o1,	%o0,	%g3
	orncc	%o6,	%l1,	%i4
	rd	%ccr,	%i7
loop_930:
	nop
	setx	0xEE3AA439,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x290B28A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f19,	%f20
	rd	%ccr,	%i2
	fpadd32	%f14,	%f0,	%f16
	subcc	%l6,	0x0524,	%o2
	call	loop_931
	addc	%l4,	0x18C8,	%l3
	call	loop_932
	rd	%pc,	%o4
loop_931:
	call	loop_933
	fbule,a,pn	%fcc0,	loop_934
loop_932:
	fcmpgt16	%f14,	%f18,	%g2
	nop
	fitos	%f9,	%f25
	fstoi	%f25,	%f26
loop_933:
	nop
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc0
loop_934:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbuge,pn	%fcc2,	loop_935
	wr	%i6,	0x1E43,	%sys_tick
	bneg,pt	%xcc,	loop_936
	call	loop_937
loop_935:
	wrpr	%g4,	%i0,	%cwp
	fnot1s	%f17,	%f22
loop_936:
	fmovdcc	%xcc,	%f2,	%f0
loop_937:
	nop
	fitos	%f12,	%f11
	fstox	%f11,	%f12
	fpadd32s	%f24,	%f8,	%f14
	movvs	%xcc,	0x18C,	%g6
	nop
	fitos	%f12,	%f30
	fstox	%f30,	%f12
	edge8ln	%i5,	%g5,	%i1
	fmovdcs	%icc,	%f24,	%f0
	tle	%xcc,	0x1
	fmovsge	%fcc2,	%f31,	%f31
	fors	%f27,	%f27,	%f21
	call	loop_938
	sub	%l2,	0x1AD8,	%l5
	call	loop_939
	call	loop_940
loop_938:
	edge32l	%g1,	%o5,	%i3
	edge32l	%o3,	%g7,	%l0
loop_939:
	addcc	%o1,	%o7,	%o0
loop_940:
	fmovdul	%fcc0,	%f8,	%f16
	ld	[%l7 + 0x08],	%f8
	call	loop_941
	fmovda	%xcc,	%f14,	%f16
	fmovsu	%fcc2,	%f10,	%f0
	movne	%fcc1,	%o6,	%g3
loop_941:
	fmovdge	%xcc,	%f24,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x139, 	%hsys_tick_cmpr
	fmovsa	%icc,	%f6,	%f22
	call	loop_942
	brgez,a	%i2,	loop_943
	call	loop_944
	call	loop_945
loop_942:
	bg	%icc,	loop_946
loop_943:
	call	loop_947
loop_944:
	call	loop_948
loop_945:
	brlez,pt	%l6,	loop_949
loop_946:
	edge32n	%o2,	%i4,	%l4
loop_947:
	sra	%o4,	%l3,	%i6
loop_948:
	sdivx	%g2,	0x00,	%g4
loop_949:
	movg	%xcc,	%i0,	%g6
	fnegs	%f13,	%f18
	call	loop_950
	fmovdo	%fcc0,	%f24,	%f26
	call	loop_951
	call	loop_952
loop_950:
	nop
	setx	0x945A1EFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x042CB36F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f10,	%f31
	call	loop_953
loop_951:
	call	loop_954
loop_952:
	tcs	%xcc,	0x7
	fors	%f19,	%f23,	%f26
loop_953:
	movlg	%fcc3,	%g5,	%i5
loop_954:
	fcmped	%fcc1,	%f14,	%f18
	call	loop_955
	call	loop_956
	call	loop_957
	ldd	[%l7 + 0x58],	%l2
loop_955:
	fcmple16	%f10,	%f24,	%l5
loop_956:
	brlez,a,pt	%g1,	loop_958
loop_957:
	call	loop_959
	call	loop_960
	call	loop_961
loop_958:
	sllx	%o5,	0x1C,	%i3
loop_959:
	nop
	set	0x2C, %g4
	lduwa	[%l7 + %g4] 0x10,	%o3
loop_960:
	call	loop_962
loop_961:
	bvs,a	%icc,	loop_963
	call	loop_964
	edge32ln	%i1,	%l0,	%o1
loop_962:
	movrlez	%g7,	%o7,	%o0
loop_963:
	flushw
loop_964:
	wrpr 	%g0, 	0x0, 	%gl
	or	%i7,	%i2,	%l1
	call	loop_965
	nop
	setx	0x0025318C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2B634F9D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f22,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF4E, 	%tick_cmpr
	fmovsvc	%xcc,	%f17,	%f14
loop_965:
	fmovrsne	%o2,	%f14,	%f12
	call	loop_966
	fpack16	%f24,	%f1
	fxors	%f25,	%f17,	%f24
	call	loop_967
loop_966:
	orcc	%l4,	%o4,	%l3
	popc	%g2,	%i6
	fnands	%f31,	%f25,	%f18
loop_967:
	fors	%f8,	%f29,	%f5
	call	loop_968
	edge32	%i0,	%g4,	%g6
	rdhpr	%hpstate,	%g5
	edge8n	%l2,	%i5,	%l5
loop_968:
	fpackfix	%f6,	%f13
	call	loop_969
	fmovscc	%xcc,	%f31,	%f14
	tg	%icc,	0x4
	rd	%fprs,	%o5
loop_969:
	sub	%i3,	%g1,	%i1
	subcc	%l0,	0x048A,	%o3
	fnegs	%f26,	%f24
	call	loop_970
	call	loop_971
	call	loop_972
	fmovrsgez	%g7,	%f29,	%f25
loop_970:
	sdivx	%o1,	0x00,	%o7
loop_971:
	fmovsl	%fcc0,	%f23,	%f7
loop_972:
	edge32l	%o0,	%g3,	%i7
	fmovsl	%fcc0,	%f21,	%f14
	pdist	%f16,	%f16,	%f28
	fnors	%f23,	%f0,	%f26
	call	loop_973
	tvs	%xcc,	0x5
	nop
	setx	0x539080D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x15B2E31B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f1,	%f21
	fmovso	%fcc1,	%f19,	%f4
loop_973:
	sllx	%i2,	0x0A,	%l1
	tg	%icc,	0x3
	call	loop_974
	call	loop_975
	call	loop_976
	umul	%l6,	%i4,	%o2
loop_974:
	call	loop_977
loop_975:
	fmovduge	%fcc0,	%f14,	%f20
loop_976:
	call	loop_978
	mulscc	%l4,	%o6,	%o4
loop_977:
	edge32ln	%g2,	%l3,	%i6
	edge16ln	%g4,	%g6,	%i0
loop_978:
	fmovsg	%fcc0,	%f7,	%f12
	fmovscc	%xcc,	%f23,	%f0
	fmuld8ulx16	%f23,	%f1,	%f14
	fmovdneg	%icc,	%f22,	%f12
	call	loop_979
	movcs	%icc,	0x4F0,	%g5
	call	loop_980
	fmuld8ulx16	%f3,	%f12,	%f18
loop_979:
	rdhpr	%hsys_tick_cmpr,	%l2
	fmovdle	%xcc,	%f28,	%f14
loop_980:
	fcmps	%fcc1,	%f14,	%f25
	movuge	%fcc2,	0x49E,	%i5
	fzeros	%f12
	movgu	%icc,	0x7BC,	%l5
	call	loop_981
	rd	%y,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x99C, 	%hsys_tick_cmpr
	fmovdl	%fcc2,	%f26,	%f6
loop_981:
	sra	%o5,	0x1F,	%i1
	nop
	set	0x6C, %i0
	sth	%o3,	[%l7 + %i0]
	fornot2	%f0,	%f8,	%f28
	fcmps	%fcc0,	%f23,	%f14
	fmovsul	%fcc0,	%f17,	%f3
	orn	%l0,	0x07A3,	%o1
	udivx	%g7,	0x00,	%o0
	fmovde	%fcc0,	%f24,	%f14
	call	loop_982
	nop
	setx	0x04C5FA65,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xBAC0E6F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f7,	%f19
	fzero	%f8
	fxnors	%f22,	%f1,	%f14
loop_982:
	fmovsule	%fcc3,	%f2,	%f29
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f26
	nop
	fitos	%f8,	%f29
	fstoi	%f29,	%f19
	fmovsne	%icc,	%f21,	%f2
	call	loop_983
	fbug,a,pt	%fcc0,	loop_984
	call	loop_985
	tn	%icc,	0x3
loop_983:
	fpadd32	%f20,	%f16,	%f0
loop_984:
	call	loop_986
loop_985:
	call	loop_987
	tneg	%icc,	0x1
	tvs	%xcc,	0x6
loop_986:
	fnot1	%f14,	%f24
loop_987:
	fnands	%f15,	%f20,	%f19
	call	loop_988
	fcmpeq16	%f26,	%f28,	%o7
	bge,a	%xcc,	loop_989
	call	loop_990
loop_988:
	rdhpr	%hintp,	%i7
	call	loop_991
loop_989:
	call	loop_992
loop_990:
	bne,a,pn	%icc,	loop_993
	movn	%icc,	%g3,	%i2
loop_991:
	subcc	%l6,	%i4,	%l1
loop_992:
	edge8n	%l4,	%o6,	%o4
loop_993:
	movrne	%g2,	0x116,	%l3
	fsrc1s	%f26,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%g6,	%o2,	%i0
	bshuffle	%f6,	%f22,	%f20
	edge32	%g5,	%l2,	%l5
	call	loop_994
	call	loop_995
	tge	%icc,	0x6
	fors	%f25,	%f1,	%f6
loop_994:
	sdivcc	%i3,	%i5,	%g1
loop_995:
	rdhpr	%hsys_tick_cmpr,	%o5
	fmovrdgez	%o3,	%f16,	%f2
	call	loop_996
	fmovdu	%fcc1,	%f26,	%f2
	fmovdpos	%xcc,	%f20,	%f24
	call	loop_997
loop_996:
	fnegs	%f23,	%f7
	wr	%l0,	0x1853,	%sys_tick
	nop
	setx	0x04E9E16D3C4F674C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xAD94532C1E4CCB91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f18
loop_997:
	nop
	setx	0x870CD518,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xBBF3F86B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f3,	%f26
	sub	%o1,	0x1782,	%g7
	call	loop_998
	fbue,a	%fcc3,	loop_999
	nop
	setx	0xE27B1C39,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f21
	flushw
loop_998:
	fcmps	%fcc3,	%f4,	%f21
loop_999:
	fcmple16	%f22,	%f6,	%i1
	call	loop_1000
	call	loop_1001
	call	loop_1002
	fbuge,pn	%fcc1,	loop_1003
loop_1000:
	move	%xcc,	0x54D,	%o0
loop_1001:
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
loop_1002:
	edge16n	%i7,	%g3,	%o7
loop_1003:
	call	loop_1004
	call	loop_1005
	movrlez	%i2,	%l6,	%l1
	edge16l	%i4,	%o6,	%l4
loop_1004:
	call	loop_1006
loop_1005:
	fors	%f11,	%f0,	%f14
	fbule,a,pn	%fcc2,	loop_1007
	sllx	%o4,	0x06,	%l3
loop_1006:
	move	%xcc,	%g2,	%g4
	call	loop_1008
loop_1007:
	call	loop_1009
	membar	0x66
	nop
	setx	0x97892344EA814E95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB6EE3B8121174A55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f20,	%f2
loop_1008:
	fblg,a,pt	%fcc1,	loop_1010
loop_1009:
	fmovsleu	%xcc,	%f4,	%f16
	be,a	%icc,	loop_1011
	fmovdug	%fcc3,	%f0,	%f18
loop_1010:
	siam	0x6
	call	loop_1012
loop_1011:
	call	loop_1013
	srax	%i6,	0x10,	%g6
	fcmps	%fcc1,	%f18,	%f18
loop_1012:
	nop
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x17
	membar	#Sync
loop_1013:
	addcc	%o2,	0x0300,	%g5
	fmovdn	%icc,	%f0,	%f30
	xnorcc	%i0,	0x1BFD,	%l5
	fmovsule	%fcc1,	%f22,	%f5
	movrlez	%i3,	%l2,	%i5
	nop
	setx	0x81107DFD00F1FDDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE1D2FE61F97443DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f20
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdvs	%icc,	%f12,	%f20
	fmovdgu	%icc,	%f22,	%f18
	fcmped	%fcc0,	%f14,	%f8
	fbuge,pt	%fcc3,	loop_1014
	edge32n	%g1,	%o3,	%o5
	ld	[%l7 + 0x4C],	%f30
	fmovrdne	%o1,	%f8,	%f22
loop_1014:
	movlg	%fcc1,	0x7EF,	%g7
	bg,pn	%icc,	loop_1015
	fxors	%f10,	%f12,	%f3
	movn	%xcc,	%l0,	%i1
	fones	%f18
loop_1015:
	movcc	%xcc,	%o0,	%g3
	call	loop_1016
	wr	%i7,	0x1BF8,	%softint
	nop
	setx	0x38CA99A2593CF7B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f0
	tneg	%xcc,	0x6
loop_1016:
	tl	%xcc,	0x2
	bne,pn	%icc,	loop_1017
	flushw
	flushw
	tn	%xcc,	0x2
loop_1017:
	call	loop_1018
	call	loop_1019
	fnands	%f2,	%f1,	%f12
	fabss	%f15,	%f0
loop_1018:
	call	loop_1020
loop_1019:
	fmovrdlz	%o7,	%f10,	%f20
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f10
	fxtod	%f10,	%f2
	movle	%xcc,	%l6,	%l1
loop_1020:
	call	loop_1021
	fcmpne32	%f24,	%f22,	%i2
	set	0x08, %o5
	lduha	[%l7 + %o5] 0x88,	%i4
loop_1021:
	fcmped	%fcc3,	%f22,	%f16
	movle	%fcc2,	0x78C,	%l4
	tle	%xcc,	0x7
	call	loop_1022
	tg	%xcc,	0x6
	call	loop_1023
	nop
	setx	0x7D9EEC72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x2BB10E3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f4,	%f9
loop_1022:
	rdhpr	%htba,	%o6
	rdpr	%gl,	%l3
loop_1023:
	call	loop_1024
	fornot2	%f14,	%f12,	%f2
	st	%fsr,	[%l7 + 0x0C]
	call	loop_1025
loop_1024:
	rdhpr	%hintp,	%g2
	tne	%icc,	0x7
	sub	%o4,	%g4,	%g6
loop_1025:
	nop
	setx	0x078C738D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7B971DA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f26,	%f10
	brlz	%o2,	loop_1026
	call	loop_1027
	andn	%i6,	%g5,	%i0
	movu	%fcc0,	0x1FB,	%l5
loop_1026:
	add	%l2,	%i3,	%i5
loop_1027:
	edge32	%g1,	%o3,	%o5
	fnot1	%f10,	%f10
	nop
	setx	0xF1E982A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x62C2C2FF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f25,	%f31
	fcmpgt16	%f8,	%f16,	%g7
	fbne	%fcc0,	loop_1028
	fxor	%f24,	%f26,	%f10
	nop
	setx	0xBCD68DF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x5227F05C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f28,	%f3
	fmovrsgz	%o1,	%f25,	%f0
loop_1028:
	fmovrslz	%i1,	%f20,	%f6
	call	loop_1029
	te	%icc,	0x5
	edge8n	%o0,	%g3,	%l0
	call	loop_1030
loop_1029:
	fcmpeq32	%f28,	%f0,	%o7
	fble,a,pt	%fcc0,	loop_1031
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f3
loop_1030:
	fmovsule	%fcc3,	%f30,	%f28
	tgu	%icc,	0x1
loop_1031:
	movrgez	%i7,	0x32E,	%l6
	movrlez	%i2,	%i4,	%l1
	nop
	setx	0x987F14CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	pdist	%f16,	%f12,	%f14
	fmul8sux16	%f12,	%f18,	%f2
	addcc	%o6,	%l4,	%l3
	fxnor	%f14,	%f18,	%f0
	call	loop_1032
	fsrc1s	%f28,	%f7
	fornot1	%f22,	%f0,	%f12
	call	loop_1033
loop_1032:
	movrgez	%o4,	0x18A,	%g2
	edge16l	%g6,	%o2,	%i6
	smul	%g4,	%g5,	%l5
loop_1033:
	fmovsule	%fcc1,	%f10,	%f18
	nop
	fitod	%f12,	%f18
	xorcc	%l2,	%i0,	%i5
	fmul8x16au	%f29,	%f7,	%f12
	fabsd	%f20,	%f8
	fcmps	%fcc2,	%f31,	%f5
	brlez,a,pt	%g1,	loop_1034
	tgu	%xcc,	0x3
	movvs	%xcc,	0x7AD,	%o3
	tpos	%xcc,	0x2
loop_1034:
	call	loop_1035
	nop
	setx	0xF0916E14,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC2EE7207,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f17,	%f7
	bcc,a	%xcc,	loop_1036
	bneg,a	%icc,	loop_1037
loop_1035:
	call	loop_1038
	mulx	%o5,	0x08E5,	%g7
loop_1036:
	nop
	fitos	%f6,	%f27
	fstox	%f27,	%f10
	fxtos	%f10,	%f20
loop_1037:
	rdpr	%wstate,	%i3
loop_1038:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 18
!	Type a   	: 32
!	Type x   	: 6
!	Type cti   	: 149
!	Type f   	: 154
!	Type i   	: 141
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
	set	0x9,	%g2
	set	0xF,	%g3
	set	0xB,	%g4
	set	0x2,	%g5
	set	0xD,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x1,	%i1
	set	-0x7,	%i2
	set	-0xB,	%i3
	set	-0x9,	%i4
	set	-0x0,	%i5
	set	-0x0,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x393AAEDB,	%l0
	set	0x6803B2D0,	%l1
	set	0x264668CC,	%l2
	set	0x0287975A,	%l3
	set	0x54217F42,	%l4
	set	0x4BFF8790,	%l5
	set	0x67069638,	%l6
	!# Output registers
	set	0x1192,	%o0
	set	-0x04A8,	%o1
	set	0x0EE1,	%o2
	set	-0x14DD,	%o3
	set	0x06A7,	%o4
	set	0x1297,	%o5
	set	0x0CB4,	%o6
	set	0x19C9,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xB563799CA47CB1EA)
	INIT_TH_FP_REG(%l7,%f2,0xC534A8B960D75F5A)
	INIT_TH_FP_REG(%l7,%f4,0x4E66CE430A015D45)
	INIT_TH_FP_REG(%l7,%f6,0x82ECAEAB4180273C)
	INIT_TH_FP_REG(%l7,%f8,0x465F621F04C3BB89)
	INIT_TH_FP_REG(%l7,%f10,0x23CCB7FEAC1F276C)
	INIT_TH_FP_REG(%l7,%f12,0xC2C87BDC97404CA2)
	INIT_TH_FP_REG(%l7,%f14,0xA8F409E3C9452704)
	INIT_TH_FP_REG(%l7,%f16,0xA033973E189914D8)
	INIT_TH_FP_REG(%l7,%f18,0xA5141CB8CC1D24BF)
	INIT_TH_FP_REG(%l7,%f20,0x26F31C19613960B3)
	INIT_TH_FP_REG(%l7,%f22,0xA1FBA7CAC35352F8)
	INIT_TH_FP_REG(%l7,%f24,0x5A08F77DF5E11E1C)
	INIT_TH_FP_REG(%l7,%f26,0x2F4AF179937412A6)
	INIT_TH_FP_REG(%l7,%f28,0x72484632BB27A07A)
	INIT_TH_FP_REG(%l7,%f30,0x43A1F9809E00DE83)

	!# Execute Main Diag ..

	call	loop_1039
	call	loop_1040
	xorcc	%o1,	0x0FAA,	%o0
	fcmpes	%fcc2,	%f25,	%f7
loop_1039:
	fmovdvc	%xcc,	%f10,	%f4
loop_1040:
	edge16l	%g3,	%i1,	%l0
	tg	%xcc,	0x6
	nop
	setx loop_1041, %l0, %l1
	jmpl %l1, %o7
	fmovse	%icc,	%f25,	%f2
	rdpr	%cansave,	%i7
	bpos,a	%xcc,	loop_1042
loop_1041:
	fcmpgt16	%f10,	%f2,	%i2
	movrgez	%l6,	%i4,	%l1
	tn	%icc,	0x1
loop_1042:
	addcc	%l4,	%l3,	%o4
	call	loop_1043
	umulcc	%g2,	%g6,	%o2
	stbar
	movrne	%o6,	%i6,	%g5
loop_1043:
	fpsub16	%f18,	%f8,	%f16
	call	loop_1044
	call	loop_1045
	fand	%f8,	%f28,	%f6
	call	loop_1046
loop_1044:
	fpsub16s	%f19,	%f9,	%f28
loop_1045:
	nop
	wr	%g0,	0x11,	%asi
	stxa	%g4,	[%l7 + 0x70] %asi
loop_1046:
	call	loop_1047
	tvc	%icc,	0x6
	fandnot1	%f14,	%f12,	%f26
	fmuld8sux16	%f10,	%f12,	%f18
loop_1047:
	nop
	set	0x76, %g7
	ldsb	[%l7 + %g7],	%l5
	call	loop_1048
	fpadd32s	%f8,	%f23,	%f30
	nop
	fitos	%f5,	%f5
	fstox	%f5,	%f16
	nop
	setx loop_1049, %l0, %l1
	jmpl %l1, %l2
loop_1048:
	fmul8x16au	%f7,	%f29,	%f22
	call	loop_1050
	call	loop_1051
loop_1049:
	fxnors	%f7,	%f5,	%f19
	sir	0x13AD
loop_1050:
	array32	%i0,	%i5,	%o3
loop_1051:
	fmovrdgez	%g1,	%f18,	%f26
	call	loop_1052
	tsubcc	%g7,	%i3,	%o1
	movrgz	%o5,	0x32D,	%g3
	fmovrsgez	%i1,	%f19,	%f20
loop_1052:
	call	loop_1053
	srax	%o0,	0x0B,	%o7
	call	loop_1054
	call	loop_1055
loop_1053:
	call	loop_1056
	fmovsug	%fcc3,	%f12,	%f25
loop_1054:
	nop
	setx	0xEDE26A96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xAA694C2A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f13,	%f28
loop_1055:
	movvc	%icc,	0x49B,	%l0
loop_1056:
	bmask	%i7,	%l6,	%i4
	call	loop_1057
	movvs	%xcc,	%l1,	%i2
	andcc	%l4,	%l3,	%o4
	bshuffle	%f24,	%f6,	%f16
loop_1057:
	fors	%f29,	%f18,	%f23
	fmul8ulx16	%f4,	%f28,	%f26
	andcc	%g2,	0x1DC9,	%g6
	fbule,a	%fcc0,	loop_1058
	call	loop_1059
	siam	0x2
	fmovdleu	%xcc,	%f12,	%f2
loop_1058:
	rdhpr	%hpstate,	%o6
loop_1059:
	edge16n	%i6,	%o2,	%g5
	fmovdgu	%icc,	%f14,	%f14
	call	loop_1060
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1061
	fmovrsgz	%l5,	%f20,	%f5
loop_1060:
	fpadd32	%f6,	%f12,	%f30
	edge32n	%g4,	%i0,	%l2
loop_1061:
	fsrc1s	%f15,	%f21
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%i5
	fandnot1	%f0,	%f22,	%f20
	ta	%xcc,	0x0
	fcmpeq16	%f10,	%f4,	%g1
	call	loop_1062
	nop
	setx	0x6B4146DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2BBF408E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f12,	%f4
	movge	%fcc0,	%o3,	%g7
	fsrc1	%f4,	%f20
loop_1062:
	edge16ln	%i3,	%o5,	%o1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x1E] %asi,	%i1
	fnors	%f3,	%f4,	%f8
	call	loop_1063
	fmovdneg	%icc,	%f2,	%f8
	call	loop_1064
	fsrc2	%f0,	%f28
loop_1063:
	fmovdg	%fcc0,	%f16,	%f2
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g3
loop_1064:
	call	loop_1065
	call	loop_1066
	mova	%xcc,	%o7,	%l0
	fpsub32	%f14,	%f8,	%f22
loop_1065:
	udivcc	%i7,	0x00,	%o0
loop_1066:
	fornot2	%f6,	%f10,	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fcmps	%fcc0,	%f0,	%f13
	fpadd16s	%f12,	%f19,	%f9
	nop
	fitos	%f3,	%f31
	fstox	%f31,	%f10
	fpackfix	%f10,	%f23
	call	loop_1067
	srlx	%l1,	%i2,	%l3
	udiv	%l4,	%g2,	%g6
	nop
	fitod	%f0,	%f24
	fdtos	%f24,	%f20
loop_1067:
	movcs	%icc,	%o6,	%i6
	fornot1s	%f12,	%f3,	%f14
	fnand	%f0,	%f24,	%f14
	brlez,pn	%o2,	loop_1068
	rdpr	%cwp,	%o4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
loop_1068:
	call	loop_1069
	movrgz	%g4,	0x10B,	%i0
	fandnot2	%f8,	%f8,	%f22
	call	loop_1070
loop_1069:
	fcmple32	%f26,	%f2,	%l5
	for	%f12,	%f4,	%f22
	fmovda	%fcc2,	%f4,	%f16
loop_1070:
	call	loop_1071
	fmul8sux16	%f18,	%f12,	%f14
	sllx	%i5,	%l2,	%g1
	nop
	setx	loop_1072,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x012100001407,	%l0,	%l1
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
loop_1071:
	udivx	%g7,	0x00,	%o3
	fpadd32	%f12,	%f22,	%f26
	sll	%o5,	%o1,	%i3
loop_1072:
	fcmple16	%f16,	%f30,	%i1
	call	loop_1073
	fpadd16	%f30,	%f0,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_1074
loop_1073:
	umul	%o7,	0x0E75,	%l0
	call	loop_1075
	call	loop_1076
loop_1074:
	subcc	%o0,	0x14FA,	%i4
	call	loop_1077
loop_1075:
	call	loop_1078
loop_1076:
	wr	%l6,	%i7,	%sys_tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x60E, 	%hsys_tick_cmpr
loop_1077:
	fmovs	%f25,	%f18
loop_1078:
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f4
	fmovdlg	%fcc3,	%f30,	%f6
	edge16l	%l1,	%l4,	%l3
	ldstub	[%l7 + 0x4A],	%g6
	tneg	%xcc,	0x6
	rdpr	%wstate,	%g2
	fmovdle	%xcc,	%f16,	%f24
	te	%icc,	0x6
	movvs	%xcc,	%i6,	%o6
	call	loop_1079
	tn	%icc,	0x7
	call	loop_1080
	call	loop_1081
loop_1079:
	sth	%o4,	[%l7 + 0x60]
	call	loop_1082
loop_1080:
	taddcc	%g5,	0x046B,	%g4
loop_1081:
	popc	0x19FD,	%o2
	or	%i0,	%i5,	%l2
loop_1082:
	call	loop_1083
	rdhpr	%htba,	%g1
	fmovsue	%fcc0,	%f24,	%f12
	nop
	setx	0x2E773CBA67B2B441,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f26
loop_1083:
	movvs	%icc,	0x675,	%l5
	call	loop_1084
	fabss	%f20,	%f4
	fmovrdne	%g7,	%f18,	%f4
	fmovdue	%fcc1,	%f4,	%f20
loop_1084:
	call	loop_1085
	mova	%fcc1,	%o5,	%o3
	movl	%xcc,	0x38C,	%o1
	rdpr	%tl,	%i1
loop_1085:
	nop
	fitod	%f22,	%f12
	lduw	[%l7 + 0x10],	%g3
	fxnors	%f30,	%f10,	%f20
	fpack32	%f0,	%f8,	%f28
	call	loop_1086
	movul	%fcc1,	0x471,	%i3
	call	loop_1087
	call	loop_1088
loop_1086:
	brgez,a,pn	%o7,	loop_1089
	mulscc	%l0,	0x03DF,	%o0
loop_1087:
	call	loop_1090
loop_1088:
	fmovdue	%fcc2,	%f0,	%f30
loop_1089:
	fmovdug	%fcc3,	%f30,	%f28
	bge	%xcc,	loop_1091
loop_1090:
	andcc	%l6,	0x0FEC,	%i7
	fcmped	%fcc2,	%f0,	%f24
	call	loop_1092
loop_1091:
	fmovsle	%xcc,	%f27,	%f12
	fmovdu	%fcc0,	%f14,	%f26
	fmovsu	%fcc3,	%f19,	%f5
loop_1092:
	call	loop_1093
	fxors	%f17,	%f2,	%f25
	fmovrde	%i2,	%f2,	%f26
	wrpr 	%g0, 	0x3, 	%gl
loop_1093:
	nop
	set	0x64, %o1
	lduwa	[%l7 + %o1] 0x88,	%l4
	movl	%fcc2,	%i4,	%g6
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f13
	tl	%xcc,	0x0
	move	%icc,	0x348,	%g2
	call	loop_1094
	tge	%xcc,	0x2
	set	0x7C, %o3
	swapa	[%l7 + %o3] 0x88,	%i6
loop_1094:
	fmovdue	%fcc0,	%f20,	%f2
	call	loop_1095
	umulcc	%o6,	%l3,	%g5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%o4
loop_1095:
	tcc	%icc,	0x4
	nop
	set	0x1A, %l6
	sth	%g4,	[%l7 + %l6]
	fmovrde	%i0,	%f28,	%f4
	subcc	%i5,	0x1ECA,	%o2
	sdivx	%g1,	%l5,	%g7
	fba,pn	%fcc1,	loop_1096
	call	loop_1097
	edge16n	%o5,	%l2,	%o3
	fxor	%f6,	%f16,	%f18
loop_1096:
	fxnor	%f8,	%f8,	%f6
loop_1097:
	edge32ln	%i1,	%o1,	%g3
	fcmpeq32	%f16,	%f0,	%i3
	xnorcc	%o7,	%o0,	%l0
	umul	%l6,	0x06D5,	%i7
	xnor	%i2,	%l4,	%l1
	fmovrse	%i4,	%f13,	%f5
	rdhpr	%hsys_tick_cmpr,	%g6
	fabss	%f22,	%f10
	edge8l	%g2,	%o6,	%l3
	call	loop_1098
	fmovrsne	%i6,	%f18,	%f17
	call	loop_1099
	fmovsle	%fcc1,	%f27,	%f29
loop_1098:
	call	loop_1100
	call	loop_1101
loop_1099:
	fmovscc	%icc,	%f9,	%f28
	fmovdleu	%xcc,	%f18,	%f20
loop_1100:
	fmovrde	%g5,	%f0,	%f30
loop_1101:
	fmovso	%fcc0,	%f16,	%f16
	xnorcc	%o4,	0x022E,	%g4
	fpadd16	%f6,	%f26,	%f26
	call	loop_1102
	fnot2s	%f27,	%f4
	call	loop_1103
	call	loop_1104
loop_1102:
	andcc	%i5,	0x04CD,	%i0
	call	loop_1105
loop_1103:
	fand	%f14,	%f6,	%f2
loop_1104:
	call	loop_1106
	fnot2	%f24,	%f28
loop_1105:
	tne	%icc,	0x6
	stb	%o2,	[%l7 + 0x77]
loop_1106:
	nop
	fitod	%f2,	%f14
	fdtos	%f14,	%f0
	fnot2s	%f3,	%f26
	edge32ln	%l5,	%g1,	%g7
	rdhpr	%ver,	%l2
	tge	%icc,	0x4
	call	loop_1107
	movcc	%icc,	%o3,	%o5
	call	loop_1108
	fmul8x16au	%f6,	%f5,	%f18
loop_1107:
	fpadd16	%f8,	%f6,	%f20
	fsrc1s	%f24,	%f26
loop_1108:
	fmovdcs	%xcc,	%f10,	%f30
	call	loop_1109
	movge	%xcc,	%i1,	%o1
	nop
	setx	0x0B57019930B3FF27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f8
	call	loop_1110
loop_1109:
	fcmpgt16	%f16,	%f12,	%i3
	fcmpne16	%f24,	%f16,	%g3
	call	loop_1111
loop_1110:
	movlg	%fcc2,	0x2D4,	%o0
	bcc,a,pt	%icc,	loop_1112
	nop
	set	0x10, %i3
	std	%f20,	[%l7 + %i3]
loop_1111:
	call	loop_1113
	andcc	%l0,	0x0618,	%l6
loop_1112:
	fmovsvc	%xcc,	%f31,	%f2
	nop
	set	0x58, %o0
	std	%o6,	[%l7 + %o0]
loop_1113:
	call	loop_1114
	nop
	setx	0x98A69CCC5D523F96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0B82B7B98C2B7786,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f16,	%f24
	call	loop_1115
	bcc,pn	%icc,	loop_1116
loop_1114:
	call	loop_1117
	movrlez	%i7,	%l4,	%i2
loop_1115:
	ta	%xcc,	0x7
loop_1116:
	fba,pt	%fcc0,	loop_1118
loop_1117:
	sllx	%i4,	%l1,	%g6
	tvs	%icc,	0x5
	call	loop_1119
loop_1118:
	fmovrdlez	%g2,	%f10,	%f0
	and	%l3,	%o6,	%g5
	nop
	set	0x42, %g3
	lduh	[%l7 + %g3],	%i6
loop_1119:
	fnot2s	%f23,	%f2
	fpsub32s	%f23,	%f30,	%f24
	ble,a	%icc,	loop_1120
	call	loop_1121
	fcmpne32	%f26,	%f26,	%o4
	umul	%i5,	0x11B7,	%i0
loop_1120:
	fmovdo	%fcc1,	%f6,	%f6
loop_1121:
	fnors	%f29,	%f26,	%f18
	lduw	[%l7 + 0x74],	%o2
	call	loop_1122
	tne	%icc,	0x0
	fbue,a	%fcc3,	loop_1123
	fbue,a,pt	%fcc2,	loop_1124
loop_1122:
	movvc	%icc,	%l5,	%g1
	call	loop_1125
loop_1123:
	fmovsl	%fcc1,	%f25,	%f25
loop_1124:
	andn	%g4,	%l2,	%g7
	fmovdleu	%icc,	%f24,	%f14
loop_1125:
	fabss	%f9,	%f0
	udiv	%o5,	0x00,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE11, 	%tick_cmpr
	call	loop_1126
	alignaddr	%i3,	%g3,	%l0
	call	loop_1127
	movleu	%icc,	%l6,	%o0
loop_1126:
	fmovrsne	%i7,	%f27,	%f20
	fmovsle	%fcc3,	%f8,	%f29
loop_1127:
	fxors	%f12,	%f0,	%f6
	array16	%l4,	%i2,	%i4
	call	loop_1128
	call	loop_1129
	fmovse	%icc,	%f21,	%f14
	alignaddrl	%o7,	%g6,	%l1
loop_1128:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f24
	fxtod	%f24,	%f16
loop_1129:
	fpadd16s	%f9,	%f19,	%f18
	fpackfix	%f10,	%f11
	fmovsu	%fcc3,	%f10,	%f8
	edge32n	%l3,	%o6,	%g5
	fcmpne16	%f14,	%f20,	%i6
	call	loop_1130
	fpackfix	%f18,	%f9
	nop
	setx	0x42A62331,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	call	loop_1131
loop_1130:
	fbl,pt	%fcc2,	loop_1132
	nop
	setx	loop_1133,	%l0,	%l1
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
	fmovdcs	%icc,	%f26,	%f22
loop_1131:
	array8	%g2,	%i5,	%o4
loop_1132:
	fbge,pn	%fcc3,	loop_1134
loop_1133:
	bl,a,pt	%icc,	loop_1135
	fornot2s	%f31,	%f19,	%f15
	call	loop_1136
loop_1134:
	stx	%o2,	[%l7 + 0x40]
loop_1135:
	call	loop_1137
	move	%fcc2,	0x11B,	%l5
loop_1136:
	movvs	%icc,	%g1,	%g4
	fmovdpos	%icc,	%f20,	%f0
loop_1137:
	fxors	%f4,	%f30,	%f27
	addc	%i0,	%l2,	%o5
	fpack32	%f24,	%f16,	%f2
	call	loop_1138
	call	loop_1139
	fmovsge	%fcc0,	%f2,	%f31
	call	loop_1140
loop_1138:
	call	loop_1141
loop_1139:
	tleu	%xcc,	0x3
	fmovrslz	%g7,	%f21,	%f8
loop_1140:
	subcc	%i1,	%o3,	%i3
loop_1141:
	call	loop_1142
	sethi	0x13CB,	%g3
	movneg	%icc,	0x6D0,	%o1
	udivx	%l0,	%l6,	%i7
loop_1142:
	fmovsvc	%icc,	%f26,	%f23
	call	loop_1143
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f16
	set	0x6E, %g5
	ldsha	[%l7 + %g5] 0x18,	%o0
loop_1143:
	tcs	%icc,	0x2
	movule	%fcc2,	%i2,	%i4
	fmovsul	%fcc3,	%f19,	%f15
	smul	%l4,	0x150F,	%o7
	wrpr	%l1,	0x1503,	%tick
	call	loop_1144
	sll	%g6,	0x0E,	%o6
	nop
	setx	0xF2A84059,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x8EF6C5A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f9,	%f16
	call	loop_1145
loop_1144:
	call	loop_1146
	call	loop_1147
	bvs,a	%xcc,	loop_1148
loop_1145:
	fbge	%fcc1,	loop_1149
loop_1146:
	tle	%icc,	0x5
loop_1147:
	tsubcctv	%l3,	%g5,	%i6
loop_1148:
	tneg	%xcc,	0x4
loop_1149:
	fmovrslz	%g2,	%f20,	%f27
	fmovdge	%fcc1,	%f2,	%f18
	te	%xcc,	0x6
	fmovdpos	%icc,	%f12,	%f12
	fxnors	%f16,	%f29,	%f6
	bge,pn	%xcc,	loop_1150
	edge8ln	%o4,	%i5,	%o2
	fmul8x16al	%f2,	%f13,	%f20
	call	loop_1151
loop_1150:
	fmovrdne	%l5,	%f24,	%f28
	nop
	setx	0xC5DEC40B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA5C2779B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f3,	%f16
	fmul8ulx16	%f20,	%f18,	%f22
loop_1151:
	sir	0x0435
	nop
	set	0x1A, %i7
	stb	%g1,	[%l7 + %i7]
	call	loop_1152
	call	loop_1153
	be,a	%xcc,	loop_1154
	fmovsne	%icc,	%f2,	%f16
loop_1152:
	nop
	set	0x3C, %i1
	lduba	[%l7 + %i1] 0x80,	%g4
loop_1153:
	fxnor	%f20,	%f10,	%f20
loop_1154:
	array32	%i0,	%l2,	%o5
	call	loop_1155
	movrlez	%i1,	0x157,	%g7
	tle	%xcc,	0x6
	edge32	%o3,	%i3,	%g3
loop_1155:
	edge32n	%o1,	%l6,	%l0
	array8	%i7,	%o0,	%i4
	call	loop_1156
	tne	%icc,	0x2
	wr	%i2,	0x1D0A,	%sys_tick
	call	loop_1157
loop_1156:
	wr	%o7,	%l1,	%softint
	call	loop_1158
	fmovsleu	%icc,	%f14,	%f1
loop_1157:
	movcc	%icc,	0x42C,	%l4
	movue	%fcc3,	%g6,	%l3
loop_1158:
	edge8n	%o6,	%i6,	%g5
	call	loop_1159
	pdist	%f30,	%f24,	%f10
	edge16n	%o4,	%g2,	%o2
	fmovd	%f30,	%f24
loop_1159:
	call	loop_1160
	movn	%xcc,	%l5,	%g1
	call	loop_1161
	fmovrde	%i5,	%f24,	%f14
loop_1160:
	orncc	%g4,	%i0,	%l2
	srl	%o5,	%i1,	%g7
loop_1161:
	call	loop_1162
	fmovsgu	%icc,	%f11,	%f16
	fabsd	%f22,	%f8
	call	loop_1163
loop_1162:
	wrpr 	%g0, 	0x3, 	%gl
	fandnot2	%f0,	%f10,	%f22
	tg	%icc,	0x1
loop_1163:
	rd	%sys_tick_cmpr,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE71, 	%hsys_tick_cmpr
	call	loop_1164
	movneg	%icc,	%l6,	%i7
	srl	%o0,	0x04,	%i4
	nop
	setx	0x880FB9AE09650A81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8990F63E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsmuld	%f0,	%f8,	%f16
loop_1164:
	nop
	setx	0x55E682CB5874E242,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE7937DC302A6729C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f6,	%f16
	fsrc1s	%f0,	%f26
	or	%l0,	0x1315,	%o7
	srl	%i2,	0x1D,	%l4
	bne,a	%xcc,	loop_1165
	fmovsneg	%icc,	%f21,	%f12
	call	loop_1166
	alignaddrl	%l1,	%g6,	%o6
loop_1165:
	edge8	%l3,	%i6,	%o4
	fandnot1s	%f12,	%f30,	%f7
loop_1166:
	nop
	setx	0x76F78158EE659D70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF245B7FE72994F78,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f2,	%f2
	fmovdg	%fcc2,	%f14,	%f28
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1167
	fsrc2	%f14,	%f10
	fxnor	%f16,	%f0,	%f10
	popc	0x181B,	%g5
loop_1167:
	call	loop_1168
	call	loop_1169
	movrgez	%g2,	%l5,	%o2
	call	loop_1170
loop_1168:
	fmuld8sux16	%f9,	%f21,	%f0
loop_1169:
	edge32l	%g1,	%g4,	%i0
	call	loop_1171
loop_1170:
	edge8	%l2,	%o5,	%i5
	nop
	setx	0x7991398B6983C25C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x33133AAC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f28,	%f24
	edge32	%g7,	%i1,	%o3
loop_1171:
	fmovse	%fcc0,	%f1,	%f28
	srax	%o1,	0x00,	%i3
	smulcc	%l6,	0x0A82,	%g3
	alignaddr	%o0,	%i4,	%i7
	fcmps	%fcc1,	%f17,	%f11
	call	loop_1172
	fcmpgt32	%f4,	%f4,	%o7
	st	%f10,	[%l7 + 0x38]
	mulx	%l0,	0x1903,	%l4
loop_1172:
	movvc	%xcc,	%l1,	%i2
	call	loop_1173
	fsrc1	%f18,	%f2
	set	0x44, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%g6
loop_1173:
	siam	0x5
	fmovrslez	%l3,	%f12,	%f14
	nop
	setx	0x333CC0B64A8711BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC84E206664FA8958,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f24
	fsrc1	%f26,	%f2
	nop
	set	0x78, %o7
	swap	[%l7 + %o7],	%i6
	call	loop_1174
	call	loop_1175
loop_1174:
	nop

loop_1175:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 27
!	Type a   	: 20
!	Type x   	: 11
!	Type cti   	: 137
!	Type f   	: 166
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
.word 0x20A48808
.word 0x3265D8DC
.word 0x8C26C848
.word 0xEA73E437
.word 0x3DDBC4B4
.word 0xC93E48E6
.word 0x941EC994
.word 0x70368C74
.word 0x4CE2CE40
.word 0x9FCB28DE
.word 0x367A0957
.word 0xC28C3ED3
.word 0x5E777A75
.word 0x45CB86A0
.word 0x52183B76
.word 0x686852D1
.word 0xCB8B8F79
.word 0xBD86AE6A
.word 0x70060B2B
.word 0xB0F621E2
.word 0x21B25755
.word 0x43A13191
.word 0xCA9E571E
.word 0x357ABD8F
.word 0xA251E108
.word 0xB4514643
.word 0x071F7650
.word 0x3D53491E
.word 0x78483C49
.word 0x426559A9
.word 0xDD36C7C8
.word 0xAC8B69AE
.word 0x898C3959
.word 0xC270D917
.word 0xB7125151
.word 0xA5EE89FD
.word 0x6D3FAE6F
.word 0x98EE01A9
.word 0xD701CC14
.word 0x3462543D
.word 0xA42BCF39
.word 0xE2899B38
.word 0x5598530E
.word 0xB6732676
.word 0xD4F5CFE2
.word 0xAB2A20EC
.word 0x8D7292EA
.word 0x9AFDA4CE
.word 0xE6F8A16D
.word 0xB0585BC6
.word 0x6EFC6E89
.word 0x49217AB4
.word 0x5B6110AB
.word 0xEEC1C67C
.word 0x11779164
.word 0xF757456E
.word 0xF37AA8AD
.word 0x0714417E
.word 0x648364BE
.word 0x41B34D3F
.word 0x59A85D95
.word 0xC4ED4846
.word 0x918FC7BC
.word 0x9C8BBA12
.end
