/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_24.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=1879012"
.ident "Mon Dec  8 19:57:18 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_24.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0xA,	%g2
	set	0x0,	%g3
	set	0x9,	%g4
	set	0x4,	%g5
	set	0xE,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x6,	%i1
	set	-0x2,	%i2
	set	-0x1,	%i3
	set	-0x3,	%i4
	set	-0xA,	%i5
	set	-0xB,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x00D1B67B,	%l0
	set	0x79A0E25B,	%l1
	set	0x6B8A46B1,	%l2
	set	0x421E83BD,	%l3
	set	0x7CA2902B,	%l4
	set	0x369FD338,	%l5
	set	0x46F98224,	%l6
	!# Output registers
	set	0x193E,	%o0
	set	0x1998,	%o1
	set	-0x1563,	%o2
	set	0x07F3,	%o3
	set	0x1E65,	%o4
	set	0x0BAD,	%o5
	set	-0x1601,	%o6
	set	0x10AB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	bn,a	%icc,	loop_1
	alignaddrl	%l5,	%o7,	%l6
	call	loop_2
	nop
	setx	0x2C690E37,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xB80F2530,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f2,	%f19
loop_1:
	fmovsvs	%icc,	%f20,	%f16
	rdpr	%wstate,	%o2
loop_2:
	nop
	setx	loop_3,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021100001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%o1,	%l2,	%g5
	bvc,a	%icc,	loop_4
	call	loop_5
loop_3:
	fcmpne32	%f14,	%f28,	%g7
	call	loop_6
loop_4:
	fmul8sux16	%f20,	%f4,	%f10
loop_5:
	bvs,pt	%xcc,	loop_7
	fnands	%f9,	%f3,	%f1
loop_6:
	fmovrde	%o0,	%f8,	%f2
	flushw
loop_7:
	bn,a,pn	%icc,	loop_8
	call	loop_9
	nop
	setx	0x0BE7A72E165D50AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x21A628BA076B5450,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f26,	%f8
	edge16n	%o3,	%o5,	%l4
loop_8:
	call	loop_10
loop_9:
	fbo,a,pt	%fcc1,	loop_11
	fmovsul	%fcc3,	%f12,	%f5
	fmovsne	%xcc,	%f24,	%f29
loop_10:
	call	loop_12
loop_11:
	tsubcc	%g1,	%g2,	%l1
	rdhpr	%htba,	%i2
	fmovdu	%fcc1,	%f30,	%f14
loop_12:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x085, 	%hsys_tick_cmpr
	fmovrslez	%l3,	%f29,	%f3
	fabsd	%f30,	%f0
	xnorcc	%i3,	%i5,	%i6
	fcmpne16	%f12,	%f0,	%l0
	call	loop_13
	rdpr	%tl,	%o4
	fbu,a	%fcc2,	loop_14
	nop
	fitos	%f13,	%f1
	fstox	%f1,	%f8
	fxtos	%f8,	%f9
loop_13:
	add	%i7,	0x1AA6,	%i4
	rdpr	%pil,	%i1
loop_14:
	call	loop_15
	fnors	%f18,	%f24,	%f20
	wrpr	%g6,	0x0FCB,	%cwp
	fmul8x16	%f10,	%f4,	%f4
loop_15:
	and	%g4,	0x03D1,	%l5
	call	loop_16
	fmovrslez	%o7,	%f20,	%f13
	bge	%xcc,	loop_17
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f30
loop_16:
	fbu,pn	%fcc0,	loop_18
	movneg	%icc,	0x2F5,	%l6
loop_17:
	nop
	setx loop_19, %l0, %l1
	jmpl %l1, %g3
	call	loop_20
loop_18:
	call	loop_21
	edge32ln	%o2,	%o1,	%l2
loop_19:
	call	loop_22
loop_20:
	call	loop_23
loop_21:
	fnor	%f26,	%f22,	%f4
	call	loop_24
loop_22:
	subcc	%g7,	%o0,	%o3
loop_23:
	fcmpne32	%f10,	%f30,	%o5
	call	loop_25
loop_24:
	fxors	%f0,	%f7,	%f20
	fbule,a	%fcc0,	loop_26
	fnors	%f25,	%f26,	%f5
loop_25:
	fnands	%f9,	%f29,	%f24
	fble,pt	%fcc2,	loop_27
loop_26:
	call	loop_28
	fmovsn	%icc,	%f8,	%f29
	fsrc2	%f20,	%f30
loop_27:
	nop
	set	0x70, %o6
	std	%l4,	[%l7 + %o6]
loop_28:
	call	loop_29
	call	loop_30
	call	loop_31
	membar	0x1C
loop_29:
	brlz	%g5,	loop_32
loop_30:
	fmovdle	%fcc2,	%f24,	%f30
loop_31:
	faligndata	%f0,	%f20,	%f0
	edge32n	%g2,	%l1,	%g1
loop_32:
	call	loop_33
	umul	%i2,	%o6,	%l3
	call	loop_34
	fbuge,pn	%fcc3,	loop_35
loop_33:
	call	loop_36
	call	loop_37
loop_34:
	call	loop_38
loop_35:
	nop
	set	0x50, %g2
	ldstub	[%l7 + %g2],	%i0
loop_36:
	call	loop_39
loop_37:
	nop
	setx	0x5F1E2055,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
loop_38:
	fsrc1	%f10,	%f26
	fmovslg	%fcc2,	%f16,	%f21
loop_39:
	fbug	%fcc3,	loop_40
	call	loop_41
	call	loop_42
	tleu	%xcc,	0x3
loop_40:
	call	loop_43
loop_41:
	bcs,a,pn	%xcc,	loop_44
loop_42:
	rdhpr	%hintp,	%i5
	call	loop_45
loop_43:
	mulx	%i6,	%i3,	%o4
loop_44:
	movcs	%xcc,	0x077,	%i7
	fnors	%f31,	%f10,	%f10
loop_45:
	fandnot2s	%f25,	%f28,	%f11
	array16	%i4,	%i1,	%l0
	rdhpr	%htba,	%g6
	movn	%icc,	%g4,	%l5
	edge16n	%o7,	%g3,	%l6
	call	loop_46
	srax	%o1,	%l2,	%o2
	fpsub16s	%f29,	%f3,	%f15
	call	loop_47
loop_46:
	call	loop_48
	call	loop_49
	movcc	%icc,	%g7,	%o0
loop_47:
	tg	%icc,	0x7
loop_48:
	call	loop_50
loop_49:
	movrne	%o5,	%o3,	%l4
	fmul8ulx16	%f14,	%f6,	%f2
	call	loop_51
loop_50:
	fandnot1s	%f3,	%f30,	%f23
	call	loop_52
	fmovsu	%fcc1,	%f31,	%f23
loop_51:
	call	loop_53
	fornot2s	%f26,	%f10,	%f7
loop_52:
	call	loop_54
	fmovdleu	%xcc,	%f22,	%f14
loop_53:
	fmovsul	%fcc1,	%f30,	%f24
	fmovdlg	%fcc0,	%f28,	%f24
loop_54:
	fmovrde	%g5,	%f14,	%f30
	call	loop_55
	call	loop_56
	fsrc2s	%f0,	%f5
	movgu	%icc,	0x342,	%l1
loop_55:
	call	loop_57
loop_56:
	fmovduge	%fcc2,	%f18,	%f16
	movl	%fcc1,	0x300,	%g2
	call	loop_58
loop_57:
	call	loop_59
	call	loop_60
	fbge,a,pn	%fcc0,	loop_61
loop_58:
	call	loop_62
loop_59:
	nop
	fitos	%f14,	%f25
loop_60:
	movpos	%icc,	0x468,	%g1
loop_61:
	nop
	wr	%g0,	0xeb,	%asi
	stwa	%o6,	[%l7 + 0x48] %asi
	membar	#Sync
loop_62:
	call	loop_63
	fmul8sux16	%f28,	%f28,	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x943, 	%hsys_tick_cmpr
	call	loop_64
loop_63:
	fcmple32	%f18,	%f8,	%i2
	call	loop_65
	fmovsn	%xcc,	%f26,	%f4
loop_64:
	rd	%softint,	%i5
	fzeros	%f20
loop_65:
	fmovsule	%fcc0,	%f9,	%f29
	call	loop_66
	movleu	%icc,	%i0,	%i3
	brnz	%o4,	loop_67
	bvs,pn	%xcc,	loop_68
loop_66:
	fnands	%f1,	%f16,	%f21
	set	0x190, %i3
!!	stxa	%i6,	[%g0 + %i3] 0x40
loop_67:
	flushw
loop_68:
	brlez,a	%i4,	loop_69
	fandnot2s	%f28,	%f22,	%f29
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i1
loop_69:
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%i7
	call	loop_70
	fmovsue	%fcc0,	%f8,	%f8
	addc	%g6,	0x08EA,	%g4
	fmovspos	%xcc,	%f6,	%f7
loop_70:
	brlz,pn	%l0,	loop_71
	call	loop_72
	call	loop_73
	call	loop_74
loop_71:
	rd	%ccr,	%o7
loop_72:
	call	loop_75
loop_73:
	fpadd32s	%f30,	%f30,	%f28
loop_74:
	srl	%g3,	0x00,	%l5
	call	loop_76
loop_75:
	mulscc	%o1,	0x137B,	%l2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_77
loop_76:
	nop
	set	0x48, %l4
	lduh	[%l7 + %l4],	%o2
	call	loop_78
	call	loop_79
loop_77:
	fnot1	%f28,	%f12
	call	loop_80
loop_78:
	movvc	%icc,	%l6,	%o0
loop_79:
	fxnor	%f26,	%f6,	%f22
	rd	%fprs,	%g7
loop_80:
	call	loop_81
	flushw
	xnorcc	%o3,	0x1B6C,	%o5
	fsrc2s	%f8,	%f13
loop_81:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g5
	call	loop_82
loop_82:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 9
!	Type a   	: 12
!	Type x   	: 4
!	Type cti   	: 82
!	Type f   	: 56
!	Type i   	: 37
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
	set	0xE,	%g2
	set	0x8,	%g3
	set	0x9,	%g4
	set	0x7,	%g5
	set	0x6,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x4,	%i1
	set	-0x3,	%i2
	set	-0x2,	%i3
	set	-0x4,	%i4
	set	-0xE,	%i5
	set	-0x5,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x156584E8,	%l0
	set	0x23FE776D,	%l1
	set	0x40562EA5,	%l2
	set	0x1A59D002,	%l3
	set	0x31F94048,	%l4
	set	0x4A9EAC1C,	%l5
	set	0x621F2A3D,	%l6
	!# Output registers
	set	0x0C79,	%o0
	set	0x1D09,	%o1
	set	-0x0DF8,	%o2
	set	-0x1383,	%o3
	set	0x1843,	%o4
	set	-0x02F6,	%o5
	set	0x0430,	%o6
	set	0x0304,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	fpsub16	%f26,	%f12,	%f0
	set	0x1A, %g5
	lduha	[%l7 + %g5] 0x10,	%l1
	call	loop_83
	call	loop_84
	nop
	setx	0x15EF,	%l0,	%g2
	udivx	%l4,	%g2,	%g1
	wr	%o6,	0x12DF,	%clear_softint
loop_83:
	bpos	%icc,	loop_85
loop_84:
	fpsub16	%f0,	%f30,	%f30
	rd	%pc,	%l3
	alignaddrl	%i5,	%i2,	%i0
loop_85:
	subccc	%o4,	0x1F21,	%i3
	call	loop_86
	tge	%xcc,	0x1
	brz,pt	%i6,	loop_87
	movrlz	%i4,	0x2E6,	%i7
loop_86:
	mova	%icc,	0x119,	%i1
	fmovdo	%fcc1,	%f10,	%f14
loop_87:
	call	loop_88
	fmovslg	%fcc1,	%f28,	%f22
	fpsub32	%f26,	%f6,	%f4
	fpadd32s	%f2,	%f30,	%f1
loop_88:
	call	loop_89
	call	loop_90
	fmovso	%fcc0,	%f27,	%f24
	fmovrse	%g6,	%f16,	%f13
loop_89:
	fpmerge	%f23,	%f6,	%f10
loop_90:
	movgu	%icc,	0x51A,	%l0
	movgu	%xcc,	%g4,	%o7
	call	loop_91
	nop
	setx	0x166A,	%l0,	%g3
	udiv	%l5,	%g3,	%o1
	tne	%xcc,	0x3
	membar	0x50
loop_91:
	call	loop_92
	ble,a,pt	%icc,	loop_93
	call	loop_94
	fxnors	%f16,	%f20,	%f28
loop_92:
	movug	%fcc1,	%l2,	%o2
loop_93:
	call	loop_95
loop_94:
	call	loop_96
	fmovsule	%fcc1,	%f23,	%f11
	nop
	setx	0xDEFF31EEC81494DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xFEBA54A4F02A0F2A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f20
loop_95:
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%o0
loop_96:
	call	loop_97
	call	loop_98
	call	loop_99
	fmovsvs	%xcc,	%f8,	%f6
loop_97:
	popc	%g7,	%o3
loop_98:
	alignaddr	%l6,	%o5,	%g5
loop_99:
	fmovdlg	%fcc3,	%f14,	%f28
	fornot2s	%f10,	%f24,	%f2
	call	loop_100
	call	loop_101
	call	loop_102
	call	loop_103
loop_100:
	pdist	%f2,	%f2,	%f16
loop_101:
	nop
	wr	%g0,	0x0c,	%asi
	stwa	%l4,	[%l7 + 0x34] %asi
loop_102:
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f18
loop_103:
	nop
	setx	loop_104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024100001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%l1,	0x03F0,	%g1
	tleu	%xcc,	0x1
	call	loop_105
loop_104:
	fba,a	%fcc0,	loop_106
	fmovdule	%fcc1,	%f2,	%f30
	call	loop_107
loop_105:
	movle	%xcc,	0x177,	%o6
loop_106:
	subcc	%l3,	%i5,	%i2
	rdpr	%cleanwin,	%i0
loop_107:
	fpadd32	%f26,	%f0,	%f12
	fsrc1	%f26,	%f0
	call	loop_108
	movneg	%icc,	0x70A,	%g2
	taddcc	%i3,	%i6,	%o4
	sdiv	%i7,	0x00FF,	%i1
loop_108:
	wrpr	%g6,	0x1A0E,	%pil
	fbule,a	%fcc2,	loop_109
	call	loop_110
	nop
	setx	0xB69BFBDF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x170F1BF0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f7,	%f9
	fzeros	%f6
loop_109:
	call	loop_111
loop_110:
	fnors	%f10,	%f5,	%f22
	fmovsg	%icc,	%f16,	%f18
	taddcctv	%i4,	%g4,	%o7
loop_111:
	call	loop_112
	fones	%f25
	fornot2	%f8,	%f28,	%f6
	call	loop_113
loop_112:
	fmul8sux16	%f2,	%f2,	%f10
	wrpr	%l0,	0x099B,	%tick
	edge16ln	%l5,	%g3,	%o1
loop_113:
	array32	%o2,	%o0,	%l2
	call	loop_114
	fmovsne	%fcc3,	%f27,	%f23
	fbe,a	%fcc0,	loop_115
	array8	%o3,	%g7,	%o5
loop_114:
	call	loop_116
	call	loop_117
loop_115:
	stw	%g5,	[%l7 + 0x58]
	call	loop_118
loop_116:
	udivx	%l4,	0x195B,	%l6
loop_117:
	call	loop_119
	fmovrsgz	%l1,	%f12,	%f11
loop_118:
	movre	%o6,	%g1,	%i5
	call	loop_120
loop_119:
	srl	%l3,	%i2,	%g2
	fand	%f6,	%f12,	%f20
	xorcc	%i0,	0x1EB7,	%i3
loop_120:
	movleu	%xcc,	%o4,	%i6
	andcc	%i1,	0x0FCC,	%g6
	movule	%fcc1,	%i7,	%g4
	fmuld8sux16	%f2,	%f4,	%f18
	call	loop_121
	ldsw	[%l7 + 0x48],	%i4
	movue	%fcc3,	0x391,	%l0
	edge32ln	%o7,	%l5,	%o1
loop_121:
	fmovspos	%xcc,	%f1,	%f19
	tsubcc	%o2,	0x1547,	%o0
	call	loop_122
	fcmpeq32	%f2,	%f0,	%l2
	fpadd32s	%f25,	%f12,	%f3
	movu	%fcc2,	%g3,	%o3
loop_122:
	tn	%icc,	0x5
	fnot2	%f2,	%f26
	call	loop_123
	fcmpne32	%f2,	%f22,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_124
loop_123:
	wrpr	%l6,	0x1058,	%pil
	wr	%l1,	0x1C1A,	%ccr
	rdpr	%cwp,	%g5
loop_124:
	fba,a,pt	%fcc1,	loop_125
	tgu	%icc,	0x7
	mova	%fcc3,	0x3B2,	%g1
	movrlez	%o6,	0x161,	%i5
loop_125:
	call	loop_126
	fmovrsgz	%l3,	%f21,	%f20
	call	loop_127
	fsrc1s	%f13,	%f31
loop_126:
	call	loop_128
	call	loop_129
loop_127:
	call	loop_130
	mulx	%g2,	%i0,	%i2
loop_128:
	call	loop_131
loop_129:
	call	loop_132
loop_130:
	tg	%icc,	0x6
	fsrc1s	%f2,	%f21
loop_131:
	ld	[%l7 + 0x0C],	%f22
loop_132:
	wrpr 	%g0, 	0x3, 	%gl
	xor	%o4,	0x0A6F,	%i6
	brgez,pt	%i1,	loop_133
	call	loop_134
	fmovdleu	%xcc,	%f2,	%f24
	brlz	%g6,	loop_135
loop_133:
	call	loop_136
loop_134:
	array8	%g4,	%i7,	%i4
	bn	%xcc,	loop_137
loop_135:
	call	loop_138
loop_136:
	or	%l0,	%o7,	%l5
	fmuld8ulx16	%f18,	%f18,	%f18
loop_137:
	call	loop_139
loop_138:
	call	loop_140
	pdist	%f10,	%f30,	%f18
	addcc	%o1,	%o0,	%l2
loop_139:
	nop
	setx	0x0D00,	%l0,	%o2
	udivcc	%g3,	%o2,	%o5
loop_140:
	tcc	%xcc,	0x6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x394, 	%hsys_tick_cmpr
	call	loop_141
	movre	%l6,	%l4,	%l1
	fmovrsgz	%g5,	%f17,	%f10
	rd	%tick_cmpr,	%g1
loop_141:
	popc	%i5,	%o6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g2
	call	loop_142
	call	loop_143
	call	loop_144
	fmovduge	%fcc1,	%f4,	%f30
loop_142:
	call	loop_145
loop_143:
	call	loop_146
loop_144:
	call	loop_147
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f10
	fxtod	%f10,	%f20
loop_145:
	fmuld8ulx16	%f26,	%f20,	%f4
loop_146:
	udiv	%i0,	0x03C7,	%i2
loop_147:
	nop
	fitos	%f1,	%f14
	fstod	%f14,	%f26
	fbuge,a	%fcc0,	loop_148
	tgu	%xcc,	0x7
	nop
	fitos	%f2,	%f9
	fstox	%f9,	%f26
	fxtos	%f26,	%f20
	tg	%xcc,	0x0
loop_148:
	nop
	fitos	%f10,	%f25
	fstox	%f25,	%f30
	fxtos	%f30,	%f15
	tgu	%xcc,	0x3
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_149
	fmovrsgez	%l3,	%f23,	%f12
	call	loop_150
	call	loop_151
loop_149:
	fmovscc	%icc,	%f1,	%f8
	umulcc	%i6,	0x07BF,	%i1
loop_150:
	call	loop_152
loop_151:
	call	loop_153
loop_152:
	nop

loop_153:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 7
!	Type a   	: 13
!	Type cti   	: 71
!	Type x   	: 3
!	Type f   	: 51
!	Type i   	: 55
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
	set	0xE,	%g1
	set	0x1,	%g2
	set	0x2,	%g3
	set	0xB,	%g4
	set	0x8,	%g5
	set	0x3,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x7,	%i1
	set	-0x3,	%i2
	set	-0x2,	%i3
	set	-0x0,	%i4
	set	-0xE,	%i5
	set	-0x3,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x4B888FF8,	%l0
	set	0x4D786CDD,	%l1
	set	0x7C2B8868,	%l2
	set	0x1E74E254,	%l3
	set	0x2BD176A4,	%l4
	set	0x4E215A69,	%l5
	set	0x03E2283E,	%l6
	!# Output registers
	set	-0x1993,	%o0
	set	-0x0FD5,	%o1
	set	-0x1D9E,	%o2
	set	-0x0510,	%o3
	set	-0x063A,	%o4
	set	-0x0F3D,	%o5
	set	-0x0B46,	%o6
	set	-0x0504,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	edge16n	%g6,	%g4,	%i7
	fbne,a,pn	%fcc2,	loop_154
	alignaddrl	%i4,	%o4,	%l0
	fmovdvs	%xcc,	%f28,	%f8
	subc	%l5,	0x1A8C,	%o1
loop_154:
	edge8n	%o7,	%o0,	%l2
	call	loop_155
	fmul8x16	%f20,	%f20,	%f24
	fbul,pt	%fcc2,	loop_156
	movrne	%g3,	%o2,	%o5
loop_155:
	nop
	setx	0x7976AF6F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xCE7F585D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f12,	%f21
	call	loop_157
loop_156:
	fnegd	%f18,	%f8
	call	loop_158
	udiv	%g7,	0x0857,	%o3
loop_157:
	fcmpeq32	%f6,	%f16,	%l6
	call	loop_159
loop_158:
	fmovsu	%fcc2,	%f18,	%f1
	tpos	%xcc,	0x4
	fcmpne16	%f26,	%f28,	%l4
loop_159:
	fnegd	%f24,	%f2
	movvs	%icc,	%g5,	%g1
	call	loop_160
	tvc	%icc,	0x1
	tle	%xcc,	0x3
	fmovdvs	%icc,	%f26,	%f6
loop_160:
	fcmpes	%fcc2,	%f2,	%f9
	movcc	%icc,	%l1,	%o6
	fmovrse	%i5,	%f29,	%f16
	fnot1	%f12,	%f24
	bshuffle	%f10,	%f10,	%f14
	st	%f21,	[%l7 + 0x18]
	call	loop_161
	movlg	%fcc3,	0x008,	%g2
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x18,	%i2
loop_161:
	call	loop_162
	tneg	%icc,	0x1
	bl,a,pn	%xcc,	loop_163
	call	loop_164
loop_162:
	fmovdpos	%icc,	%f30,	%f14
	ldd	[%l7 + 0x10],	%i0
loop_163:
	bl,pt	%xcc,	loop_165
loop_164:
	xorcc	%i3,	0x0DE6,	%i6
	call	loop_166
	fmovs	%f14,	%f22
loop_165:
	movrne	%l3,	0x326,	%g6
	udivcc	%g4,	0x1287,	%i7
loop_166:
	tsubcctv	%i1,	%i4,	%l0
	movule	%fcc0,	0x57F,	%o4
	addcc	%o1,	%l5,	%o0
	bn	%icc,	loop_167
	movcc	%xcc,	0x07C,	%o7
	call	loop_168
	fmovdl	%fcc1,	%f18,	%f2
loop_167:
	movl	%fcc3,	%g3,	%l2
	call	loop_169
loop_168:
	addccc	%o5,	%o2,	%o3
	bmask	%l6,	%g7,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_169:
	stx	%fsr,	[%l7 + 0x30]
	call	loop_170
	fzero	%f24
	flush	%l7 + 0x60
	call	loop_171
loop_170:
	call	loop_172
	call	loop_173
	sra	%l1,	%i5,	%g2
loop_171:
	call	loop_174
loop_172:
	call	loop_175
loop_173:
	flush	%l7 + 0x68
	addc	%o6,	%i2,	%i3
loop_174:
	call	loop_176
loop_175:
	fpsub32s	%f29,	%f2,	%f8
	tvc	%icc,	0x4
	tsubcc	%i6,	%l3,	%g6
loop_176:
	fmul8sux16	%f28,	%f20,	%f14
	call	loop_177
	move	%icc,	%i0,	%i7
	bcs,a,pn	%icc,	loop_178
	call	loop_179
loop_177:
	call	loop_180
	nop
	set	0x78, %i6
	std	%i0,	[%l7 + %i6]
loop_178:
	edge16ln	%i4,	%g4,	%o4
loop_179:
	fmovdvs	%icc,	%f4,	%f28
loop_180:
	fmovsvs	%xcc,	%f30,	%f23
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_181
	movvc	%icc,	%l0,	%l5
	call	loop_182
	mulx	%o0,	0x0EAF,	%g3
loop_181:
	movrne	%o7,	%o5,	%o2
	tsubcc	%l2,	%l6,	%g7
loop_182:
	fmovsneg	%icc,	%f8,	%f17
	fmovdo	%fcc1,	%f28,	%f10
	call	loop_183
	movge	%fcc3,	%l4,	%o3
	tne	%xcc,	0x4
	call	loop_184
loop_183:
	xor	%g5,	0x1F9F,	%g1
	rdpr	%otherwin,	%l1
	fmul8x16au	%f22,	%f13,	%f0
loop_184:
	movn	%xcc,	%i5,	%o6
	fands	%f20,	%f9,	%f11
	addcc	%i2,	%i3,	%g2
	call	loop_185
	fmul8x16	%f18,	%f0,	%f30
	fmovsue	%fcc0,	%f3,	%f29
	nop
	set	0x0C, %l6
	stw	%i6,	[%l7 + %l6]
loop_185:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x79] %asi,	%g6
	fmovs	%f29,	%f25
	call	loop_186
	srl	%l3,	%i7,	%i0
	nop
	setx	loop_187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032200001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%i1,	%g4,	%o4
loop_186:
	movlg	%fcc1,	%i4,	%o1
	fmovsne	%fcc0,	%f2,	%f18
loop_187:
	udiv	%l5,	0x1580,	%o0
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	flushw
	add	%g3,	%o7,	%o5
	add	%o2,	0x0D69,	%l2
	nop
	fitos	%f12,	%f24
	fstod	%f24,	%f26
	call	loop_188
	movule	%fcc1,	0x698,	%l6
	array32	%g7,	%l0,	%l4
	edge8	%g5,	%o3,	%g1
loop_188:
	call	loop_189
	fbue	%fcc3,	loop_190
	nop
	fitod	%f0,	%f20
	fdtoi	%f20,	%f18
	fone	%f10
loop_189:
	movrgez	%i5,	%l1,	%i2
loop_190:
	nop
	set	0x50, %i5
	stx	%i3,	[%l7 + %i5]
	movul	%fcc1,	%o6,	%g2
	fbne,a	%fcc3,	loop_191
	sllx	%i6,	%g6,	%l3
	srlx	%i0,	%i7,	%i1
	fmovsle	%fcc2,	%f16,	%f22
loop_191:
	call	loop_192
	edge16ln	%o4,	%g4,	%o1
	nop
	fitos	%f11,	%f9
	fstoi	%f9,	%f5
	call	loop_193
loop_192:
	call	loop_194
	call	loop_195
	call	loop_196
loop_193:
	tpos	%xcc,	0x0
loop_194:
	call	loop_197
loop_195:
	fmovsug	%fcc2,	%f17,	%f21
loop_196:
	call	loop_198
	srl	%l5,	0x0D,	%i4
loop_197:
	fnor	%f8,	%f2,	%f2
	tne	%xcc,	0x1
loop_198:
	nop
	setx	0x426D25FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x9311F7B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f12,	%f20
	call	loop_199
	fandnot2s	%f5,	%f27,	%f22
	call	loop_200
	call	loop_201
loop_199:
	call	loop_202
	addccc	%o0,	0x05C2,	%o7
loop_200:
	edge16n	%o5,	%g3,	%o2
loop_201:
	fmovd	%f14,	%f14
loop_202:
	call	loop_203
	udiv	%l2,	0x0FD4,	%g7
	nop
	setx	0x1B1A,	%l0,	%l4
	udiv	%l0,	%l4,	%l6
	call	loop_204
loop_203:
	rdpr	%tl,	%o3
	wr	%g5,	0x0FDE,	%set_softint
	call	loop_205
loop_204:
	sethi	0x12F2,	%i5
	subccc	%g1,	0x18A2,	%l1
	fmovdge	%icc,	%f6,	%f18
loop_205:
	fmovdneg	%xcc,	%f0,	%f18
	movlg	%fcc0,	0x715,	%i2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcb
	rd	%sys_tick_cmpr,	%i3
	nop
	fitos	%f8,	%f15
	fstoi	%f15,	%f4
	nop
	set	0x22, %i1
	ldsh	[%l7 + %i1],	%o6
	fmovd	%f2,	%f22
	fble,pn	%fcc0,	loop_206
	udivcc	%i6,	0x0EFD,	%g6
	alignaddr	%g2,	%i0,	%i7
	fcmpne16	%f16,	%f10,	%i1
loop_206:
	fmovsl	%xcc,	%f25,	%f30
	call	loop_207
	call	loop_208
	movle	%xcc,	%l3,	%o4
	alignaddrl	%o1,	%l5,	%g4
loop_207:
	fandnot1	%f26,	%f18,	%f18
loop_208:
	fmovrse	%i4,	%f17,	%f25
	fxor	%f20,	%f24,	%f4
	fmovse	%fcc0,	%f0,	%f22
	fnot1s	%f1,	%f26
	nop
	setx	0x7EA55D09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x64901470,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f31,	%f12
	fornot1s	%f28,	%f23,	%f18
	nop
	fitos	%f5,	%f11
	rdhpr	%hsys_tick_cmpr,	%o7
	call	loop_209
	tle	%xcc,	0x5
loop_209:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 12
!	Type a   	: 7
!	Type x   	: 3
!	Type cti   	: 56
!	Type f   	: 53
!	Type i   	: 69
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
	set	0x6,	%g1
	set	0xC,	%g2
	set	0xC,	%g3
	set	0x5,	%g4
	set	0x3,	%g5
	set	0x8,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x4,	%i1
	set	-0xF,	%i2
	set	-0x5,	%i3
	set	-0x9,	%i4
	set	-0xE,	%i5
	set	-0x9,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x5A261FB9,	%l0
	set	0x5E96C286,	%l1
	set	0x33A1E5AA,	%l2
	set	0x28319263,	%l3
	set	0x5D42DAA3,	%l4
	set	0x16911B12,	%l5
	set	0x1FAA4E03,	%l6
	!# Output registers
	set	0x0EE3,	%o0
	set	0x1DF5,	%o1
	set	-0x03B4,	%o2
	set	-0x1991,	%o3
	set	-0x1CB3,	%o4
	set	-0x0C18,	%o5
	set	-0x13D2,	%o6
	set	0x1C96,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	fnors	%f26,	%f8,	%f18
	call	loop_210
	subccc	%o0,	0x071E,	%g3
	addc	%o2,	0x0ADE,	%l2
	fmovsge	%icc,	%f10,	%f16
loop_210:
	nop
	setx	0x66DA58666F80E466,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x1A9A882B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f30,	%f6
	fnors	%f11,	%f25,	%f18
	fpmerge	%f13,	%f23,	%f20
	fpsub32s	%f23,	%f27,	%f17
	nop
	setx	0x9BDAC9E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	bpos	%icc,	loop_211
	move	%fcc3,	0x4BE,	%o5
	call	loop_212
	call	loop_213
loop_211:
	orncc	%l0,	0x16FF,	%l4
	rdhpr	%hintp,	%g7
loop_212:
	fmovdu	%fcc1,	%f2,	%f4
loop_213:
	fpack32	%f24,	%f14,	%f2
	edge16n	%l6,	%g5,	%o3
	call	loop_214
	fbule	%fcc0,	loop_215
	movul	%fcc2,	0x28C,	%g1
	call	loop_216
loop_214:
	fmovdcc	%icc,	%f2,	%f28
loop_215:
	nop
	fitos	%f4,	%f22
	fstoi	%f22,	%f5
	call	loop_217
loop_216:
	call	loop_218
	movcs	%xcc,	0x098,	%l1
	fandnot1s	%f23,	%f13,	%f1
loop_217:
	nop
	set	0x0E, %o0
	lduh	[%l7 + %o0],	%i2
loop_218:
	sdivcc	%i3,	0x0835,	%o6
	call	loop_219
	nop
	setx	0x5537C105,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x046F71C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f17,	%f3
	call	loop_220
	call	loop_221
loop_219:
	tcc	%icc,	0x3
	fnegs	%f1,	%f24
loop_220:
	call	loop_222
loop_221:
	edge32l	%i5,	%g6,	%g2
	fmovsn	%fcc1,	%f1,	%f9
	rdpr	%canrestore,	%i6
loop_222:
	fnegs	%f30,	%f12
	fcmpgt16	%f8,	%f28,	%i0
	movge	%icc,	%i1,	%l3
	call	loop_223
	mulscc	%o4,	0x1F32,	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0x1D5D98FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_223:
	bvs	%xcc,	loop_224
	fzero	%f12
	rdhpr	%hpstate,	%i7
	fmul8x16au	%f29,	%f15,	%f24
loop_224:
	fmovduge	%fcc3,	%f18,	%f30
	udivx	%i4,	0x0D98,	%o7
	fpsub32s	%f8,	%f7,	%f16
	nop
	fitod	%f6,	%f26
	fdtoi	%f26,	%f20
	edge32n	%o0,	%g3,	%l2
	faligndata	%f18,	%f22,	%f0
	nop
	set	0x18, %l1
	prefetch	[%l7 + %l1],	 4
	call	loop_225
	fornot2s	%f8,	%f19,	%f10
	fsrc2	%f0,	%f4
	smul	%o2,	%o5,	%l4
loop_225:
	call	loop_226
	movrlz	%g7,	%l0,	%g5
	fmovsleu	%icc,	%f22,	%f31
	edge32ln	%o3,	%g1,	%l6
loop_226:
	movo	%fcc3,	%i2,	%i3
	movn	%xcc,	%o6,	%i5
	movrne	%l1,	0x134,	%g2
	movo	%fcc3,	0x4A1,	%g6
	lduh	[%l7 + 0x50],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x67D, 	%hsys_tick_cmpr
	movneg	%icc,	0x2C6,	%l3
	fand	%f10,	%f0,	%f2
	call	loop_227
	movl	%icc,	0x636,	%o4
	fands	%f21,	%f7,	%f18
	subcc	%o1,	%g4,	%l5
loop_227:
	fmovdlg	%fcc1,	%f22,	%f8
	call	loop_228
	srl	%i4,	%i7,	%o0
	edge32	%o7,	%g3,	%o2
	array16	%l2,	%l4,	%o5
loop_228:
	call	loop_229
	fmovsleu	%icc,	%f23,	%f2
	tvs	%xcc,	0x6
	fnot1s	%f3,	%f5
loop_229:
	edge32n	%l0,	%g5,	%g7
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f2
	pdist	%f30,	%f28,	%f30
	call	loop_230
	smul	%o3,	0x078C,	%g1
	and	%l6,	0x0CD4,	%i3
	rd	%y,	%o6
loop_230:
	call	loop_231
	fandnot2s	%f16,	%f30,	%f2
	call	loop_232
	call	loop_233
loop_231:
	fmovdue	%fcc1,	%f20,	%f22
	movcs	%icc,	%i2,	%i5
loop_232:
	faligndata	%f14,	%f18,	%f4
loop_233:
	srax	%l1,	0x1A,	%g2
	call	loop_234
	fba,pt	%fcc3,	loop_235
	array32	%i0,	%i1,	%i6
	rdhpr	%hintp,	%g6
loop_234:
	xor	%o4,	0x03C7,	%l3
loop_235:
	edge32n	%o1,	%l5,	%i4
	fsrc2	%f18,	%f2
	call	loop_236
	movo	%fcc1,	0x350,	%i7
	movcs	%xcc,	0x22B,	%g4
	fandnot1s	%f8,	%f3,	%f25
loop_236:
	stx	%o7,	[%l7 + 0x48]
	tvc	%xcc,	0x2
	faligndata	%f28,	%f2,	%f2
	ldsb	[%l7 + 0x09],	%o0
	rdhpr	%hsys_tick_cmpr,	%o2
	nop
	setx	0xEB2333CB2B35A290,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xC47B83BE1C7869E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f22,	%f12
	xnorcc	%l2,	0x14FA,	%l4
	call	loop_237
	sllx	%o5,	%g3,	%g5
	call	loop_238
	call	loop_239
loop_237:
	fmovsg	%xcc,	%f3,	%f25
	tl	%xcc,	0x4
loop_238:
	fmovsule	%fcc0,	%f30,	%f26
loop_239:
	faligndata	%f14,	%f6,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o3
	call	loop_240
	tneg	%icc,	0x6
	fmovdl	%xcc,	%f30,	%f0
	ta	%xcc,	0x4
loop_240:
	rdpr	%pil,	%g7
	fnegs	%f25,	%f28
	call	loop_241
	call	loop_242
	call	loop_243
	for	%f2,	%f12,	%f8
loop_241:
	fmovrse	%l6,	%f8,	%f18
loop_242:
	call	loop_244
loop_243:
	mulx	%i3,	0x0049,	%g1
	movue	%fcc1,	0x56B,	%i2
	fcmpd	%fcc1,	%f0,	%f12
loop_244:
	array32	%o6,	%i5,	%g2
	fbue,a	%fcc3,	loop_245
	rd	%ccr,	%l1
	movneg	%icc,	%i1,	%i0
	srl	%g6,	0x08,	%o4
loop_245:
	edge16n	%i6,	%o1,	%l5
	call	loop_246
	fmovdvc	%xcc,	%f2,	%f12
	call	loop_247
	rdpr	%tba,	%l3
loop_246:
	nop
	wr	%g0,	0x89,	%asi
	stda	%i4,	[%l7 + 0x70] %asi
loop_247:
	movleu	%icc,	0x032,	%g4
	call	loop_248
	movneg	%icc,	%i7,	%o7
	fpadd16	%f28,	%f30,	%f24
	fmovda	%icc,	%f4,	%f20
loop_248:
	fpmerge	%f17,	%f24,	%f22
	alignaddrl	%o0,	%l2,	%o2
	fbne,a	%fcc2,	loop_249
	bne	%icc,	loop_250
	bg	%icc,	loop_251
	srax	%l4,	0x06,	%o5
loop_249:
	call	loop_252
loop_250:
	movlg	%fcc3,	%g3,	%l0
loop_251:
	movpos	%icc,	%g5,	%o3
	movle	%xcc,	%g7,	%i3
loop_252:
	fblg,pn	%fcc0,	loop_253
	bg	%icc,	loop_254
	edge16	%l6,	%i2,	%g1
	fpadd16	%f18,	%f24,	%f8
loop_253:
	std	%f10,	[%l7 + 0x38]
loop_254:
	movne	%xcc,	0x7DD,	%i5
	bne,a,pt	%icc,	loop_255
	bl,a	%xcc,	loop_256
	wrpr	%g2,	0x1153,	%tick
	nop
	setx	0xF9DE09CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xD227D6A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f28,	%f30
loop_255:
	call	loop_257
loop_256:
	sra	%l1,	0x02,	%o6
	movrgz	%i0,	%g6,	%i1
	call	loop_258
loop_257:
	srl	%i6,	0x14,	%o4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%o1
loop_258:
	fones	%f25
	fcmpgt32	%f30,	%f12,	%l3
	fnot1	%f4,	%f4
	edge8	%i4,	%l5,	%g4
	bpos,a	%icc,	loop_259
	call	loop_260
	fnot1	%f0,	%f12
	edge8	%i7,	%o0,	%l2
loop_259:
	fpack32	%f2,	%f28,	%f14
loop_260:
	rd	%softint,	%o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 11
!	Type a   	: 13
!	Type x   	: 3
!	Type cti   	: 51
!	Type f   	: 58
!	Type i   	: 64
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
	set	0x9,	%g1
	set	0xE,	%g2
	set	0x4,	%g3
	set	0xA,	%g4
	set	0xC,	%g5
	set	0x9,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x4,	%i1
	set	-0xD,	%i2
	set	-0xE,	%i3
	set	-0xD,	%i4
	set	-0xC,	%i5
	set	-0x5,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x72DC86E5,	%l0
	set	0x1C7C88B8,	%l1
	set	0x0919F3F6,	%l2
	set	0x25F3F4E6,	%l3
	set	0x25263F33,	%l4
	set	0x2C4E9254,	%l5
	set	0x09FE63BA,	%l6
	!# Output registers
	set	-0x0313,	%o0
	set	0x0B32,	%o1
	set	-0x056C,	%o2
	set	0x1B07,	%o3
	set	0x0C55,	%o4
	set	0x1120,	%o5
	set	-0x048D,	%o6
	set	0x1C94,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_261
	fabsd	%f14,	%f18
	call	loop_262
	andn	%o2,	0x05D7,	%o5
loop_261:
	array8	%g3,	%l4,	%l0
	array8	%o3,	%g7,	%i3
loop_262:
	call	loop_263
	fmovse	%xcc,	%f3,	%f14
	call	loop_264
	bcs,a,pn	%xcc,	loop_265
loop_263:
	movu	%fcc2,	0x0B1,	%g5
	mulx	%i2,	0x0C38,	%l6
loop_264:
	fors	%f8,	%f4,	%f30
loop_265:
	nop
	setx	0x58740C6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xB53F99CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f20,	%f7
	fabss	%f6,	%f17
	nop
	setx	0x0D80,	%l0,	%g2
	sdivx	%g1,	%g2,	%i5
	call	loop_266
	tge	%icc,	0x4
	and	%o6,	0x003A,	%i0
	movrne	%l1,	%g6,	%i1
loop_266:
	fmovdleu	%icc,	%f4,	%f22
	fbue,a	%fcc1,	loop_267
	fbge,a	%fcc3,	loop_268
	xnorcc	%i6,	0x0F85,	%o4
	call	loop_269
loop_267:
	call	loop_270
loop_268:
	call	loop_271
	alignaddrl	%o1,	%i4,	%l3
loop_269:
	xnor	%l5,	0x1CEA,	%i7
loop_270:
	call	loop_272
loop_271:
	call	loop_273
	addcc	%o0,	0x193A,	%l2
	call	loop_274
loop_272:
	umul	%o7,	%g4,	%o5
loop_273:
	fmovsu	%fcc3,	%f24,	%f6
	fmovsule	%fcc1,	%f5,	%f14
loop_274:
	nop
	setx	0x5D00D65C6B5C8C75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x979BE52A7455696D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f0,	%f20
	call	loop_275
	call	loop_276
	nop
	setx	loop_277,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012400001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_278
loop_275:
	bmask	%g3,	%l4,	%o2
loop_276:
	fsrc1	%f8,	%f2
loop_277:
	fmovsne	%fcc1,	%f27,	%f10
loop_278:
	andn	%l0,	%g7,	%i3
	movrne	%g5,	0x0A9,	%o3
	call	loop_279
	call	loop_280
	tgu	%xcc,	0x5
	fmovsa	%fcc3,	%f19,	%f17
loop_279:
	brlez	%i2,	loop_281
loop_280:
	fmovrslez	%g1,	%f20,	%f14
	fmovdvs	%xcc,	%f30,	%f6
	fbue,a	%fcc0,	loop_282
loop_281:
	wr 	%g0, 	0x6, 	%fprs
	fmovdn	%fcc1,	%f2,	%f2
	movul	%fcc2,	%g2,	%o6
loop_282:
	or	%i5,	%i0,	%g6
	movgu	%icc,	%l1,	%i1
	fbo,a	%fcc0,	loop_283
	ta	%xcc,	0x6
	fand	%f18,	%f4,	%f8
	bne,a,pn	%icc,	loop_284
loop_283:
	nop
	setx	0xFD4C281D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x682A1DF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f8,	%f16
	nop
	fitos	%f1,	%f24
	fstoi	%f24,	%f28
	nop
	setx	0xA3A5C185,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f6
loop_284:
	call	loop_285
	fcmpne32	%f10,	%f0,	%o4
	call	loop_286
	call	loop_287
loop_285:
	fxor	%f4,	%f10,	%f16
	fmovsvs	%xcc,	%f10,	%f10
loop_286:
	nop
	setx	loop_288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024200001403,	%l0,	%l1
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
loop_287:
	call	loop_289
	tne	%xcc,	0x3
	smul	%o1,	0x1428,	%i6
loop_288:
	wrpr	%l3,	%i4,	%tick
loop_289:
	call	loop_290
	tn	%icc,	0x2
	nop
	setx	0x1C8CA266,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x819345EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f14,	%f13
	nop
	fitos	%f4,	%f9
	fstox	%f9,	%f26
	fxtos	%f26,	%f22
loop_290:
	call	loop_291
	movg	%fcc2,	%i7,	%o0
	call	loop_292
	taddcctv	%l2,	0x03F3,	%l5
loop_291:
	fabsd	%f26,	%f28
	edge32n	%o7,	%o5,	%g4
loop_292:
	nop
	set	0x50, %i7
	lduw	[%l7 + %i7],	%g3
	call	loop_293
	fmovdl	%fcc2,	%f24,	%f6
	subccc	%o2,	%l0,	%g7
	wrpr	%i3,	%l4,	%pil
loop_293:
	movrgez	%o3,	%i2,	%g5
	tcc	%xcc,	0x3
	fpadd32	%f4,	%f30,	%f14
	call	loop_294
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g1
loop_294:
	fones	%f23
	fzeros	%f6
	fmovsneg	%xcc,	%f4,	%f14
	fmovsvc	%icc,	%f20,	%f2
	rdpr	%wstate,	%l6
	call	loop_295
	fornot2s	%f17,	%f31,	%f28
	call	loop_296
	tleu	%icc,	0x4
loop_295:
	addc	%o6,	0x0CB9,	%g2
	fcmpd	%fcc2,	%f28,	%f12
loop_296:
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f14
	call	loop_297
	xnorcc	%i5,	%g6,	%l1
	call	loop_298
	fpadd16s	%f16,	%f3,	%f14
loop_297:
	call	loop_299
	ba,a,pt	%icc,	loop_300
loop_298:
	call	loop_301
	fmovsle	%icc,	%f4,	%f9
loop_299:
	bpos,a,pt	%xcc,	loop_302
loop_300:
	fmovdvc	%xcc,	%f6,	%f16
loop_301:
	swap	[%l7 + 0x44],	%i1
	nop
	setx	0x163A79E49943D3DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7470D9FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f2,	%f24
loop_302:
	fpsub16	%f22,	%f12,	%f18
	fabsd	%f26,	%f30
	call	loop_303
	sub	%i0,	0x04D0,	%o4
	tne	%xcc,	0x2
	movcc	%xcc,	%o1,	%i6
loop_303:
	nop
	fitos	%f0,	%f2
	fstoi	%f2,	%f27
	fmul8x16	%f0,	%f10,	%f22
	call	loop_304
	rd	%pc,	%i4
	movcc	%icc,	%i7,	%o0
	edge16n	%l3,	%l5,	%o7
loop_304:
	fmovspos	%icc,	%f15,	%f9
	tsubcc	%o5,	%l2,	%g3
	call	loop_305
	call	loop_306
	fmuld8sux16	%f29,	%f7,	%f18
	call	loop_307
loop_305:
	add	%g4,	0x15F9,	%o2
loop_306:
	array16	%g7,	%l0,	%i3
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f18
loop_307:
	tcc	%xcc,	0x6
	fmul8sux16	%f6,	%f30,	%f22
	call	loop_308
	fpsub16s	%f29,	%f10,	%f12
	call	loop_309
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f20
	fxtos	%f20,	%f13
loop_308:
	fnot1	%f10,	%f10
	fxnor	%f12,	%f20,	%f22
loop_309:
	fmovsu	%fcc0,	%f29,	%f5
	nop
	setx	0xB256ECA38B67612E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8CCF60E4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f2,	%f14
	fmovse	%fcc0,	%f19,	%f7
	fmovsleu	%xcc,	%f30,	%f4
	call	loop_310
	rdhpr	%hsys_tick_cmpr,	%l4
	bne,a	%xcc,	loop_311
	fbuge,pn	%fcc2,	loop_312
loop_310:
	fbge	%fcc0,	loop_313
	call	loop_314
loop_311:
	nop
	set	0x62, %i4
	ldsh	[%l7 + %i4],	%o3
loop_312:
	ba	%icc,	loop_315
loop_313:
	movrlz	%i2,	0x054,	%g5
loop_314:
	call	loop_316
	rdpr	%wstate,	%l6
loop_315:
	call	loop_317
	movre	%g1,	0x09E,	%g2
loop_316:
	nop
	set	0x29, %g3
	ldub	[%l7 + %g3],	%o6
	fmovsn	%fcc3,	%f22,	%f5
loop_317:
	call	loop_318
	fnot2	%f10,	%f10
	call	loop_319
	fmuld8sux16	%f17,	%f22,	%f6
loop_318:
	fpack32	%f18,	%f2,	%f10
	fmovdlg	%fcc2,	%f18,	%f24
loop_319:
	nop
	set	0x72, %o7
	stha	%g6,	[%l7 + %o7] 0x23
	membar	#Sync
	fsrc1	%f30,	%f6
	fmovso	%fcc0,	%f19,	%f29
	subccc	%l1,	%i5,	%i0
	call	loop_320
	call	loop_321
	tsubcctv	%i1,	%o1,	%o4
	bne,pn	%icc,	loop_322
loop_320:
	movrne	%i6,	0x1CE,	%i7
loop_321:
	bl,a	%icc,	loop_323
	fnot2	%f24,	%f8
loop_322:
	call	loop_324
	fpadd16	%f30,	%f14,	%f14
loop_323:
	movcs	%icc,	0x0DE,	%i4
	call	loop_325
loop_324:
	array32	%o0,	%l5,	%l3
	brlez,a	%o5,	loop_326
	call	loop_327
loop_325:
	xorcc	%l2,	0x1473,	%o7
	fands	%f10,	%f9,	%f9
loop_326:
	nop
	set	0x22, %o5
	ldsh	[%l7 + %o5],	%g4
loop_327:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 8
!	Type a   	: 7
!	Type x   	: 2
!	Type cti   	: 67
!	Type f   	: 64
!	Type i   	: 52
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
	set	0xB,	%g2
	set	0xC,	%g3
	set	0xD,	%g4
	set	0x8,	%g5
	set	0x1,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x0,	%i1
	set	-0xA,	%i2
	set	-0xB,	%i3
	set	-0xF,	%i4
	set	-0x3,	%i5
	set	-0xA,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x157074D2,	%l0
	set	0x6C1761BE,	%l1
	set	0x0CF26FEB,	%l2
	set	0x1C596E88,	%l3
	set	0x6345E465,	%l4
	set	0x4E085E13,	%l5
	set	0x3BA9F8EB,	%l6
	!# Output registers
	set	0x0991,	%o0
	set	-0x0D95,	%o1
	set	-0x0AFD,	%o2
	set	-0x1F74,	%o3
	set	-0x1727,	%o4
	set	-0x00CA,	%o5
	set	0x0865,	%o6
	set	0x1C48,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	tneg	%xcc,	0x3
	fmovsuge	%fcc0,	%f27,	%f24
	call	loop_328
	call	loop_329
	ld	[%l7 + 0x5C],	%f3
	call	loop_330
loop_328:
	call	loop_331
loop_329:
	call	loop_332
	tpos	%icc,	0x1
loop_330:
	nop
	set	0x68, %l5
	stx	%o2,	[%l7 + %l5]
loop_331:
	call	loop_333
loop_332:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	edge32n	%g3,	%g7,	%l0
	fbu,a,pt	%fcc2,	loop_334
loop_333:
	call	loop_335
	pdist	%f30,	%f4,	%f20
	call	loop_336
loop_334:
	fnors	%f12,	%f17,	%f4
loop_335:
	tvc	%xcc,	0x6
	orncc	%i3,	0x1552,	%o3
loop_336:
	call	loop_337
	call	loop_338
	call	loop_339
	fmovrdne	%i2,	%f22,	%f6
loop_337:
	fmovsle	%icc,	%f6,	%f25
loop_338:
	tle	%icc,	0x7
loop_339:
	call	loop_340
	movneg	%xcc,	0x6D5,	%l4
	nop
	setx	0x09BE26A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x3312C36E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f13,	%f13
	call	loop_341
loop_340:
	bvs,a,pn	%xcc,	loop_342
	wrpr 	%g0, 	0x3, 	%gl
	edge32	%g2,	%l6,	%o6
loop_341:
	call	loop_343
loop_342:
	taddcc	%g6,	0x03A9,	%l1
	fpack32	%f22,	%f2,	%f0
	wr	%i5,	0x0A59,	%softint
loop_343:
	call	loop_344
	fnegd	%f14,	%f12
	movg	%xcc,	0x6C8,	%i0
	call	loop_345
loop_344:
	fmovd	%f18,	%f2
	prefetch	[%l7 + 0x64],	 0
	andn	%i1,	0x1CF2,	%o1
loop_345:
	call	loop_346
	rd	%softint,	%i6
	call	loop_347
	call	loop_348
loop_346:
	st	%fsr,	[%l7 + 0x1C]
	call	loop_349
loop_347:
	call	loop_350
loop_348:
	ldsh	[%l7 + 0x3C],	%i7
	edge16l	%o4,	%i4,	%o0
loop_349:
	tpos	%xcc,	0x2
loop_350:
	fmovdo	%fcc2,	%f24,	%f14
	fmovs	%f31,	%f27
	fmuld8sux16	%f7,	%f3,	%f18
	flush	%l7 + 0x1C
	fpsub16	%f28,	%f26,	%f18
	fbo,a	%fcc1,	loop_351
	call	loop_352
	call	loop_353
	fzeros	%f19
loop_351:
	brgz,a,pt	%l3,	loop_354
loop_352:
	call	loop_355
loop_353:
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f20
	fzero	%f4
loop_354:
	call	loop_356
loop_355:
	fmovdne	%fcc1,	%f18,	%f24
	call	loop_357
	andncc	%l5,	0x0327,	%o5
loop_356:
	xor	%l2,	%g4,	%o7
	call	loop_358
loop_357:
	fmovsu	%fcc1,	%f11,	%f11
	bge	%xcc,	loop_359
	nop
	fitos	%f0,	%f31
	fstox	%f31,	%f18
loop_358:
	stb	%g3,	[%l7 + 0x15]
	edge32n	%o2,	%l0,	%i3
loop_359:
	fnors	%f23,	%f20,	%f6
	fcmpeq16	%f4,	%f18,	%o3
	fbe,pn	%fcc3,	loop_360
	fnegs	%f22,	%f31
	edge8n	%g7,	%i2,	%l4
	fmovdug	%fcc3,	%f28,	%f30
loop_360:
	nop
	fitos	%f9,	%f9
	fstox	%f9,	%f0
	fxtos	%f0,	%f22
	call	loop_361
	fmovrdgez	%g5,	%f8,	%f24
	bgu,pt	%xcc,	loop_362
	array32	%g2,	%g1,	%o6
loop_361:
	call	loop_363
	brlez,pn	%l6,	loop_364
loop_362:
	srl	%g6,	0x09,	%i5
	tg	%xcc,	0x3
loop_363:
	fmovsvc	%icc,	%f20,	%f23
loop_364:
	edge32	%i0,	%l1,	%i1
	tvc	%xcc,	0x1
	call	loop_365
	fbo	%fcc0,	loop_366
	fnegd	%f10,	%f12
	fmovsl	%xcc,	%f13,	%f29
loop_365:
	fmovsue	%fcc2,	%f12,	%f14
loop_366:
	call	loop_367
	wr	%o1,	%i7,	%clear_softint
	call	loop_368
	nop
	setx	0x1205A739,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_367:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_369
loop_368:
	call	loop_370
	fbl,pt	%fcc3,	loop_371
	array16	%i6,	%i4,	%o0
loop_369:
	ble	%icc,	loop_372
loop_370:
	sll	%l3,	%o4,	%l5
loop_371:
	nop
	fitod	%f10,	%f14
	fmovsge	%fcc2,	%f23,	%f26
loop_372:
	fpadd32	%f0,	%f0,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x590, 	%hsys_tick_cmpr
	movug	%fcc3,	0x223,	%o7
	call	loop_373
	ldsw	[%l7 + 0x50],	%g3
	edge32n	%l2,	%o2,	%l0
	fmovdcs	%icc,	%f30,	%f16
loop_373:
	movvc	%xcc,	%o3,	%g7
	call	loop_374
	tl	%xcc,	0x6
	bleu,pt	%icc,	loop_375
	rdpr	%tl,	%i2
loop_374:
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f14
	bvc,a	%icc,	loop_376
loop_375:
	fnand	%f6,	%f10,	%f22
	fsrc2	%f12,	%f22
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f2
loop_376:
	sir	0x0943
	nop
	setx	0xEC66DF3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xFCEF61E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f11,	%f15
	fmovdo	%fcc0,	%f14,	%f30
	fmul8x16al	%f17,	%f21,	%f6
	call	loop_377
	call	loop_378
	fmovse	%fcc2,	%f23,	%f15
	tle	%xcc,	0x6
loop_377:
	fandnot1s	%f15,	%f31,	%f19
loop_378:
	udivcc	%l4,	0x0DEF,	%g5
	call	loop_379
	fnegd	%f8,	%f20
	fzeros	%f15
	edge16	%i3,	%g1,	%o6
loop_379:
	wr	%g2,	0x04BB,	%softint
	fcmpne16	%f4,	%f24,	%l6
	movrgez	%g6,	0x118,	%i5
	fmovrsgez	%i0,	%f17,	%f31
	edge8n	%i1,	%l1,	%i7
	fandnot1s	%f15,	%f15,	%f7
	bcs,pn	%xcc,	loop_380
	call	loop_381
	sra	%i6,	0x02,	%o1
	call	loop_382
loop_380:
	add	%o0,	%l3,	%o4
loop_381:
	bpos	%xcc,	loop_383
	rdhpr	%hintp,	%i4
loop_382:
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f22
	ldsb	[%l7 + 0x25],	%o5
loop_383:
	nop
	wr	%g0,	0x27,	%asi
	stxa	%l5,	[%l7 + 0x60] %asi
	membar	#Sync
	edge16l	%g4,	%g3,	%o7
	wr	%g0,	0x81,	%asi
	stba	%l2,	[%l7 + 0x6D] %asi
	siam	0x3
	xor	%o2,	%l0,	%g7
	fbo	%fcc3,	loop_384
	call	loop_385
	fmovdlg	%fcc1,	%f6,	%f24
	wr	%i2,	%o3,	%pic
loop_384:
	rdhpr	%ver,	%l4
loop_385:
	call	loop_386
	fpadd32s	%f27,	%f11,	%f30
	fmovsge	%xcc,	%f28,	%f13
	fmovdlg	%fcc2,	%f18,	%f24
loop_386:
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f1
	nop
	fitos	%f12,	%f5
	fstoi	%f5,	%f15
	brgez,pt	%i3,	loop_387
	edge32l	%g1,	%o6,	%g2
	fbug,a,pn	%fcc0,	loop_388
	call	loop_389
loop_387:
	fmovscs	%xcc,	%f13,	%f14
	fmovdgu	%xcc,	%f30,	%f4
loop_388:
	call	loop_390
loop_389:
	fsrc2	%f18,	%f2
	addcc	%l6,	%g6,	%g5
	tcs	%icc,	0x6
loop_390:
	fpsub32	%f20,	%f10,	%f18
	fandnot1s	%f3,	%f25,	%f22
	nop
	setx	0x521C5E1793F7A50B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	wr	%i0,	0x0BD8,	%sys_tick
	call	loop_391
	call	loop_392
	call	loop_393
	movle	%fcc0,	%i1,	%i5
loop_391:
	edge32ln	%i7,	%l1,	%i6
loop_392:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x970, 	%sys_tick_cmpr
loop_393:
	fornot2s	%f17,	%f5,	%f28
	call	loop_394
loop_394:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 13
!	Type a   	: 12
!	Type x   	: 2
!	Type cti   	: 67
!	Type f   	: 61
!	Type i   	: 45
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
	set	0x7,	%g1
	set	0xC,	%g2
	set	0xA,	%g3
	set	0xB,	%g4
	set	0x3,	%g5
	set	0x4,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x4,	%i1
	set	-0xF,	%i2
	set	-0x4,	%i3
	set	-0xD,	%i4
	set	-0x3,	%i5
	set	-0xC,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x5CABE15A,	%l0
	set	0x42CB9751,	%l1
	set	0x2BECC8D7,	%l2
	set	0x5A9F059D,	%l3
	set	0x365509F1,	%l4
	set	0x701D4871,	%l5
	set	0x7C987C3E,	%l6
	!# Output registers
	set	-0x160E,	%o0
	set	-0x014A,	%o1
	set	0x012D,	%o2
	set	-0x11F3,	%o3
	set	0x0894,	%o4
	set	-0x0769,	%o5
	set	-0x11A2,	%o6
	set	0x13A9,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	fbn,a	%fcc2,	loop_395
	call	loop_396
	call	loop_397
	call	loop_398
loop_395:
	stbar
loop_396:
	fcmpeq16	%f22,	%f8,	%o1
loop_397:
	call	loop_399
loop_398:
	movul	%fcc3,	0x2FE,	%i4
	call	loop_400
	fmovsgu	%icc,	%f29,	%f29
loop_399:
	fmovdge	%xcc,	%f2,	%f2
	and	%o5,	0x07D4,	%l5
loop_400:
	call	loop_401
	sra	%o4,	0x0E,	%g3
	call	loop_402
	flushw
loop_401:
	call	loop_403
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f6
loop_402:
	edge32n	%o7,	%l2,	%g4
	call	loop_404
loop_403:
	call	loop_405
	wrpr	%o2,	0x0815,	%tick
	call	loop_406
loop_404:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_405:
	smulcc	%g7,	%i2,	%l0
	array16	%l4,	%i3,	%o3
loop_406:
	rdpr	%pil,	%g1
	nop
	setx	0xF73D1C8BFD3968D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x80C70D9150460131,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f24,	%f24
	call	loop_407
	call	loop_408
	call	loop_409
	fmovdle	%fcc0,	%f8,	%f28
loop_407:
	fmovrslz	%g2,	%f11,	%f9
loop_408:
	call	loop_410
loop_409:
	flushw
	fmovdu	%fcc0,	%f14,	%f20
	nop
	fitos	%f5,	%f8
	fstoi	%f8,	%f27
loop_410:
	fabsd	%f14,	%f18
	tl	%xcc,	0x5
	siam	0x1
	fmovsneg	%icc,	%f0,	%f9
	movcs	%xcc,	%o6,	%g6
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f0
	call	loop_411
	fpack32	%f6,	%f16,	%f10
	wr	%l6,	0x0BE6,	%clear_softint
	fzero	%f6
loop_411:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEA3, 	%tick_cmpr
	tsubcctv	%g5,	%i5,	%i7
	be,pn	%icc,	loop_412
	fandnot2s	%f24,	%f19,	%f5
	call	loop_413
	movn	%icc,	%l1,	%i6
loop_412:
	rd	%asi,	%i1
	udivcc	%o0,	0x13E7,	%l3
loop_413:
	fbu	%fcc3,	loop_414
	rd	%fprs,	%i4
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x81,	%o5
loop_414:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f27,	[%l7 + 0x24] %asi
	fnot2	%f8,	%f2
	wr	%l5,	0x0A9C,	%sys_tick
	tvc	%icc,	0x1
	fpsub16s	%f28,	%f21,	%f25
	movn	%icc,	%o1,	%g3
	edge32n	%o7,	%o4,	%g4
	fmovdpos	%icc,	%f12,	%f6
	call	loop_415
	addcc	%o2,	%g7,	%l2
	fbug	%fcc3,	loop_416
	fzero	%f16
loop_415:
	fmul8x16	%f18,	%f10,	%f24
	fandnot2	%f12,	%f0,	%f18
loop_416:
	rd	%softint,	%l0
	call	loop_417
	call	loop_418
	sll	%l4,	0x19,	%i3
	fpsub16	%f2,	%f10,	%f26
loop_417:
	swap	[%l7 + 0x44],	%o3
loop_418:
	rdhpr	%htba,	%i2
	call	loop_419
	rd	%softint,	%g1
	edge8	%g2,	%o6,	%g6
	call	loop_420
loop_419:
	tn	%xcc,	0x1
	call	loop_421
	call	loop_422
loop_420:
	fmovdpos	%xcc,	%f8,	%f2
	for	%f24,	%f26,	%f6
loop_421:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x50F, 	%hsys_tick_cmpr
loop_422:
	fornot2	%f4,	%f28,	%f10
	fmovsle	%fcc2,	%f3,	%f24
	set	0x6A, %g7
	stha	%i0,	[%l7 + %g7] 0xeb
	membar	#Sync
	tle	%xcc,	0x2
	movneg	%icc,	%g5,	%i7
	bvs,a,pt	%icc,	loop_423
	call	loop_424
	tvs	%icc,	0x5
	rdhpr	%htba,	%i5
loop_423:
	nop
	set	0x2B, %l2
	ldub	[%l7 + %l2],	%i6
loop_424:
	fmovsne	%icc,	%f22,	%f29
	addccc	%i1,	0x1644,	%l1
	rdpr	%gl,	%o0
	fnand	%f12,	%f30,	%f12
	fpmerge	%f10,	%f29,	%f26
	call	loop_425
	call	loop_426
	membar	0x62
	call	loop_427
loop_425:
	call	loop_428
loop_426:
	fbuge	%fcc1,	loop_429
	fsrc2	%f8,	%f8
loop_427:
	edge8	%l3,	%i4,	%o5
loop_428:
	tne	%icc,	0x5
loop_429:
	mulx	%o1,	%g3,	%l5
	wr	%o7,	0x0D70,	%sys_tick
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f2
	movle	%icc,	0x51D,	%g4
	fsrc1s	%f24,	%f5
	andcc	%o2,	%o4,	%l2
	call	loop_430
	ta	%icc,	0x2
	addc	%g7,	0x1BC8,	%l0
	movo	%fcc2,	0x657,	%l4
loop_430:
	fnot1	%f18,	%f2
	rd	%tick_cmpr,	%o3
	nop
	setx	0x750BED86,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	movu	%fcc0,	%i2,	%g1
	call	loop_431
	call	loop_432
	add	%g2,	0x1678,	%o6
	nop
	setx	0x0900,	%l0,	%g6
	udivx	%i3,	%g6,	%i0
loop_431:
	nop
	fitod	%f4,	%f12
	fdtos	%f12,	%f26
loop_432:
	brlez,a	%l6,	loop_433
	addcc	%g5,	%i7,	%i6
	fmovdge	%icc,	%f16,	%f8
	fnegs	%f26,	%f16
loop_433:
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f9
	wrpr	%i1,	0x1A73,	%pil
	ble,pt	%xcc,	loop_434
	tg	%xcc,	0x0
	movrgz	%i5,	0x00F,	%l1
	subc	%l3,	0x11C0,	%o0
loop_434:
	call	loop_435
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	sub	%i4,	0x040D,	%o1
	call	loop_436
loop_435:
	call	loop_437
	umulcc	%o5,	%g3,	%o7
	popc	%l5,	%o2
loop_436:
	call	loop_438
loop_437:
	call	loop_439
	fbg,pn	%fcc0,	loop_440
	sth	%o4,	[%l7 + 0x30]
loop_438:
	call	loop_441
loop_439:
	fmovdvc	%xcc,	%f30,	%f30
loop_440:
	call	loop_442
	call	loop_443
loop_441:
	fmovdlg	%fcc3,	%f30,	%f24
	xnorcc	%g4,	0x031C,	%g7
loop_442:
	movlg	%fcc0,	0x39E,	%l2
loop_443:
	nop
	setx	0x77983442,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x442DBB6D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f7,	%f26
	fxnor	%f16,	%f28,	%f28
	call	loop_444
	movgu	%icc,	0x7D5,	%l0
	call	loop_445
	call	loop_446
loop_444:
	movrlz	%o3,	0x0B5,	%i2
	set	0x18, %o2
	stda	%l4,	[%l7 + %o2] 0xea
	membar	#Sync
loop_445:
	fxnors	%f22,	%f0,	%f4
loop_446:
	call	loop_447
	fornot2s	%f23,	%f3,	%f26
	fmul8x16al	%f18,	%f21,	%f20
	call	loop_448
loop_447:
	or	%g2,	0x0608,	%g1
	tle	%xcc,	0x6
	call	loop_449
loop_448:
	call	loop_450
	movue	%fcc0,	0x42E,	%o6
	call	loop_451
loop_449:
	call	loop_452
loop_450:
	call	loop_453
	bcc	%xcc,	loop_454
loop_451:
	fmovdue	%fcc0,	%f8,	%f28
loop_452:
	fmovrdgez	%g6,	%f28,	%f30
loop_453:
	call	loop_455
loop_454:
	fcmpd	%fcc0,	%f26,	%f10
	move	%fcc1,	0x7B2,	%i0
	te	%icc,	0x6
loop_455:
	call	loop_456
	fmovrslez	%i3,	%f7,	%f26
	fmovsuge	%fcc2,	%f18,	%f29
	call	loop_457
loop_456:
	srl	%l6,	0x17,	%g5
	ba,a,pt	%icc,	loop_458
	movo	%fcc0,	%i7,	%i6
loop_457:
	andcc	%i1,	%l1,	%i5
loop_458:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 10
!	Type a   	: 16
!	Type x   	: 4
!	Type cti   	: 64
!	Type f   	: 50
!	Type i   	: 56
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
	set	0x6,	%g1
	set	0xA,	%g2
	set	0x1,	%g3
	set	0xE,	%g4
	set	0xC,	%g5
	set	0x0,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x2,	%i1
	set	-0xE,	%i2
	set	-0x3,	%i3
	set	-0xB,	%i4
	set	-0x0,	%i5
	set	-0x3,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x08AE3624,	%l0
	set	0x7209E83E,	%l1
	set	0x748F1D74,	%l2
	set	0x4F5948B8,	%l3
	set	0x0CB0EF93,	%l4
	set	0x7795B1C5,	%l5
	set	0x66FFD2E6,	%l6
	!# Output registers
	set	0x1CE1,	%o0
	set	0x09E3,	%o1
	set	-0x101D,	%o2
	set	-0x0E71,	%o3
	set	-0x0AB3,	%o4
	set	0x16C4,	%o5
	set	0x161C,	%o6
	set	0x1ECE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x288F5FE4ADC85DBB)
	INIT_TH_FP_REG(%l7,%f2,0x99330CD29345F7AA)
	INIT_TH_FP_REG(%l7,%f4,0xF0864B2A2C349933)
	INIT_TH_FP_REG(%l7,%f6,0x6ACBB695416C1DE8)
	INIT_TH_FP_REG(%l7,%f8,0x702D9225E1849BBF)
	INIT_TH_FP_REG(%l7,%f10,0x3B80F57713CEF94D)
	INIT_TH_FP_REG(%l7,%f12,0x29F58B18105B9DB9)
	INIT_TH_FP_REG(%l7,%f14,0x3A004DF21FB60FC8)
	INIT_TH_FP_REG(%l7,%f16,0x61C26D62F509D405)
	INIT_TH_FP_REG(%l7,%f18,0x12DA3DA3327AD216)
	INIT_TH_FP_REG(%l7,%f20,0xBB062AE6B90609C1)
	INIT_TH_FP_REG(%l7,%f22,0x9340BB5270849C7A)
	INIT_TH_FP_REG(%l7,%f24,0x3BED08A82F701640)
	INIT_TH_FP_REG(%l7,%f26,0x4F29A2C887EA9969)
	INIT_TH_FP_REG(%l7,%f28,0xFD29195D7721EC62)
	INIT_TH_FP_REG(%l7,%f30,0x2BF5B668A5F183A1)

	!# Execute Main Diag ..

	call	loop_459
	movle	%xcc,	%o0,	%l3
	fnot1	%f22,	%f2
	fpadd32	%f2,	%f18,	%f6
loop_459:
	add	%o1,	%i4,	%o5
	udivx	%g3,	0x117B,	%o7
	fmovdn	%fcc1,	%f14,	%f14
	tle	%xcc,	0x3
	bleu,a	%icc,	loop_460
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 3
	edge32	%l5,	%o2,	%g4
	tcs	%icc,	0x6
loop_460:
	nop
	setx	0x024D,	%l0,	%g7
	udiv	%o4,	%g7,	%l0
	sir	0x0764
	fcmpeq16	%f20,	%f12,	%l2
	call	loop_461
	sethi	0x03A1,	%i2
	edge32	%l4,	%o3,	%g2
	call	loop_462
loop_461:
	orcc	%g1,	0x02E3,	%o6
	set	0x60, %o3
	ldswa	[%l7 + %o3] 0x18,	%i0
loop_462:
	call	loop_463
	fbule,a	%fcc2,	loop_464
	call	loop_465
	array32	%g6,	%i3,	%g5
loop_463:
	tn	%icc,	0x6
loop_464:
	orn	%i7,	%i6,	%i1
loop_465:
	edge16l	%l6,	%i5,	%o0
	fnors	%f22,	%f25,	%f23
	fcmps	%fcc2,	%f11,	%f8
	fmovscc	%icc,	%f30,	%f18
	fmovrslz	%l1,	%f1,	%f22
	call	loop_466
	nop
	fitos	%f8,	%f1
	fstox	%f1,	%f6
	fxtos	%f6,	%f25
	call	loop_467
	fmovrsgz	%o1,	%f27,	%f12
loop_466:
	fba	%fcc0,	loop_468
	call	loop_469
loop_467:
	brgez,pt	%i4,	loop_470
	fmovrdne	%l3,	%f12,	%f12
loop_468:
	orcc	%o5,	0x0FAD,	%g3
loop_469:
	fmovrslez	%o7,	%f24,	%f10
loop_470:
	fble,pn	%fcc3,	loop_471
	call	loop_472
	fpsub32	%f10,	%f2,	%f30
	call	loop_473
loop_471:
	andn	%l5,	0x12C2,	%o2
loop_472:
	movug	%fcc2,	0x3A3,	%g4
	nop
	setx	0x33E0CBE669A07981,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xC36589E7C0568BC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f24
loop_473:
	call	loop_474
	wrpr	%g7,	0x14BF,	%cwp
	fnegs	%f11,	%f30
	edge8l	%l0,	%l2,	%o4
loop_474:
	andn	%l4,	%i2,	%g2
	call	loop_475
	nop
	setx	0x79D4534A5D696BBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x544436111893902E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f2,	%f24
	bpos	%icc,	loop_476
	nop
	setx	0x585C4C68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2925364C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f22,	%f9
loop_475:
	movule	%fcc3,	0x4A0,	%g1
	fcmple16	%f24,	%f18,	%o3
loop_476:
	edge8n	%o6,	%g6,	%i3
	sub	%i0,	0x1CD6,	%g5
	fcmpeq16	%f16,	%f10,	%i6
	tg	%icc,	0x0
	wrpr 	%g0, 	0x3, 	%gl
	fands	%f9,	%f0,	%f24
	mova	%fcc0,	%l6,	%i5
	fmovrslz	%i1,	%f16,	%f28
	call	loop_477
	call	loop_478
	lduw	[%l7 + 0x38],	%l1
	fcmpne16	%f22,	%f20,	%o1
loop_477:
	fone	%f10
loop_478:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA00, 	%hsys_tick_cmpr
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o5
	fmovrdlez	%i4,	%f6,	%f6
	fpsub16s	%f21,	%f4,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpsub16	%f10,	%f12,	%f20
	fnand	%f10,	%f16,	%f20
	movrlz	%g3,	%l5,	%g4
	fmovsleu	%xcc,	%f9,	%f12
	call	loop_479
	wr	%g7,	%o2,	%clear_softint
	fmovdul	%fcc1,	%f22,	%f26
	add	%l0,	%o4,	%l2
loop_479:
	fxnors	%f31,	%f18,	%f26
	sir	0x0FDB
	tleu	%icc,	0x3
	rd	%tick_cmpr,	%i2
	fcmps	%fcc0,	%f3,	%f9
	fcmpeq32	%f0,	%f24,	%g2
	nop
	set	0x60, %o4
	flush	%l7 + %o4
	tne	%icc,	0x0
	sdivx	%l4,	0x0AC6,	%o3
	call	loop_480
	call	loop_481
	mulscc	%o6,	%g1,	%i3
	edge16n	%g6,	%i0,	%g5
loop_480:
	xorcc	%i6,	%l6,	%i5
loop_481:
	call	loop_482
	edge8ln	%i7,	%i1,	%o1
	call	loop_483
	call	loop_484
loop_482:
	nop
	fitos	%f9,	%f5
	fstod	%f5,	%f0
	st	%f3,	[%l7 + 0x08]
loop_483:
	call	loop_485
loop_484:
	tpos	%icc,	0x3
	nop
	fitos	%f10,	%f11
	fstod	%f11,	%f10
	call	loop_486
loop_485:
	fsrc2	%f26,	%f26
	srlx	%l1,	%o0,	%l3
	fandnot1s	%f27,	%f11,	%f0
loop_486:
	movneg	%icc,	%i4,	%o7
	fpsub16s	%f0,	%f6,	%f28
	call	loop_487
	te	%icc,	0x2
	wr	%g3,	0x0FC6,	%pic
	bge,a,pn	%xcc,	loop_488
loop_487:
	array32	%o5,	%g4,	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g7,	%l0
loop_488:
	fmovdl	%xcc,	%f14,	%f16
	call	loop_489
	fpsub32	%f16,	%f18,	%f16
	movrlz	%o2,	0x330,	%l2
	set	0x6A, %g2
	stha	%o4,	[%l7 + %g2] 0x81
loop_489:
	fmovrse	%i2,	%f25,	%f6
	fmovspos	%icc,	%f8,	%f9
	rd	%fprs,	%g2
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_490
	fmovdn	%fcc1,	%f12,	%f2
	tneg	%xcc,	0x3
	movge	%icc,	0x6EB,	%o6
loop_490:
	call	loop_491
	fmovrdlez	%g1,	%f6,	%f4
	flushw
	fmovsl	%fcc2,	%f31,	%f11
loop_491:
	stb	%i3,	[%l7 + 0x1A]
	fzeros	%f28
	fpadd16s	%f26,	%f20,	%f17
	fmovsul	%fcc2,	%f25,	%f29
	call	loop_492
	fblg,pt	%fcc1,	loop_493
	ba,a,pt	%xcc,	loop_494
	pdist	%f6,	%f28,	%f2
loop_492:
	call	loop_495
loop_493:
	call	loop_496
loop_494:
	call	loop_497
	fnot2	%f2,	%f30
loop_495:
	popc	%l4,	%i0
loop_496:
	fmovdcs	%icc,	%f12,	%f20
loop_497:
	umul	%g5,	0x08C9,	%g6
	fcmpes	%fcc3,	%f7,	%f14
	edge8	%i6,	%l6,	%i5
	wrpr	%i7,	%o1,	%cwp
	call	loop_498
	fcmple32	%f6,	%f12,	%i1
	call	loop_499
	call	loop_500
loop_498:
	fmovdue	%fcc0,	%f22,	%f28
	fsrc1s	%f19,	%f31
loop_499:
	fbuge,a	%fcc3,	loop_501
loop_500:
	fpadd16s	%f14,	%f11,	%f1
	set	0x50, %i3
	stwa	%o0,	[%l7 + %i3] 0x22
	membar	#Sync
loop_501:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	tpos	%icc,	0x4
	call	loop_502
	fba,a	%fcc1,	loop_503
	rdpr	%otherwin,	%l1
	fpsub32s	%f1,	%f25,	%f3
loop_502:
	call	loop_504
loop_503:
	fandnot2	%f22,	%f22,	%f24
	srl	%l3,	0x18,	%i4
	fmovdne	%fcc0,	%f20,	%f6
loop_504:
	bgu,pt	%xcc,	loop_505
	sub	%o7,	%g3,	%o5
	fornot1s	%f12,	%f19,	%f0
	bmask	%l5,	%g7,	%g4
loop_505:
	call	loop_506
	call	loop_507
	call	loop_508
	call	loop_509
loop_506:
	fornot1s	%f4,	%f25,	%f21
loop_507:
	call	loop_510
loop_508:
	nop
	setx	loop_511,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022400001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_509:
	call	loop_512
	fmovrdlz	%l0,	%f0,	%f6
loop_510:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x3D] %asi,	%l2
loop_511:
	srlx	%o4,	%o2,	%i2
loop_512:
	movneg	%xcc,	0x667,	%o3
	call	loop_513
	call	loop_514
	fmovdue	%fcc0,	%f18,	%f22
loop_513:
	nop

loop_514:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 11
!	Type a   	: 11
!	Type x   	: 6
!	Type cti   	: 56
!	Type f   	: 62
!	Type i   	: 54
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x8CF88538
.word 0x2911B6FD
.word 0x412E43CD
.word 0x0800A71D
.word 0xA318C8AA
.word 0xD58EB8B2
.word 0x9F5FED4D
.word 0x44BA154D
.word 0x9C0AC5B6
.word 0x6244E523
.word 0x37D9505D
.word 0x47833C53
.word 0x7E3FFC84
.word 0xF14D8791
.word 0x832A1BBD
.word 0x7E8592F6
.word 0x2E02FBCE
.word 0xCBDF312D
.word 0x288047AD
.word 0x8AAD8955
.word 0xCCB183EC
.word 0xEDAD1792
.word 0x3E04F66F
.word 0x5E374E83
.word 0x6021D732
.word 0xAA4C4FD2
.word 0x184CF9C9
.word 0x5E87B783
.word 0x5FF7FEF1
.word 0xFA812931
.word 0x3824F7D7
.word 0x0753274D
.word 0x2C0D1A21
.word 0x6325840F
.word 0xB77B3473
.word 0xB4809D29
.word 0x7FD07CD1
.word 0x26E3ECF4
.word 0x9CC30383
.word 0x3DFAD08E
.word 0x71AB3846
.word 0x7C258B3A
.word 0x767EDB1F
.word 0x78AB4450
.word 0x40577EB9
.word 0x3B1B34BA
.word 0xF869605D
.word 0x98F91A49
.word 0x31BFE39B
.word 0x0980F0BF
.word 0x5FF80ECD
.word 0xD90421AE
.word 0xBCF196DC
.word 0x94022EDE
.word 0xA8252C8F
.word 0xBDCCE9E0
.word 0x91FEFEE1
.word 0x45A6611D
.word 0xFB607EF0
.word 0x575BB4C0
.word 0x4CC84F33
.word 0xFC997F87
.word 0xF850FDEA
.word 0xEE35F528
.end
