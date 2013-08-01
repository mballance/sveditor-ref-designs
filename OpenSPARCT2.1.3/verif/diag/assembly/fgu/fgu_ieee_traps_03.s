/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_ieee_traps_03.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=12341"
.ident "Mon Dec  8 19:21:56 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_ieee_traps_03.s,v 1.4 2007/07/27 21:45:31 drp Exp $"
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
	set	0x8,	%g2
	set	0x9,	%g3
	set	0x4,	%g4
	set	0xD,	%g5
	set	0xE,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xF,	%i1
	set	-0xE,	%i2
	set	-0x6,	%i3
	set	-0x2,	%i4
	set	-0xE,	%i5
	set	-0xE,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x7B67D425,	%l0
	set	0x0CA6DA32,	%l1
	set	0x3032AAD5,	%l2
	set	0x2996F7D4,	%l3
	set	0x4DC3AE15,	%l4
	set	0x5D63FFBC,	%l5
	set	0x730DCF98,	%l6
	!# Output registers
	set	-0x13B6,	%o0
	set	-0x1BA6,	%o1
	set	-0x1ECB,	%o2
	set	0x02E5,	%o3
	set	0x1165,	%o4
	set	0x1477,	%o5
	set	0x10E6,	%o6
	set	0x0F4B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	fba,pn	%fcc1,	loop_1
	movrne	%l5,	0x275,	%g2
	tcs	%xcc,	0x5
	tn	%icc,	0x1
loop_1:
	sdiv	%i6,	0x1885,	%o5
	srl	%o1,	%o4,	%i2
	call	loop_2
	call	loop_3
	srl	%l0,	%o3,	%o0
	movul	%fcc2,	0x367,	%l3
loop_2:
	fsrc1s	%f30,	%f6
loop_3:
	nop
	setx	0x0CC0C1B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x5407AE5C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f0,	%f7
	fmovsg	%xcc,	%f16,	%f16
	fmovsa	%fcc2,	%f21,	%f1
	movrgez	%l4,	0x004,	%g3
	call	loop_4
	tneg	%xcc,	0x7
	array16	%g5,	%g4,	%l6
	rd	%asi,	%g6
loop_4:
	movl	%fcc3,	%i4,	%g7
	for	%f6,	%f0,	%f6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_5
	tneg	%xcc,	0x2
	add	%l2,	0x1E5C,	%o2
	fmovsgu	%icc,	%f31,	%f9
loop_5:
	call	loop_6
	addcc	%o7,	0x1C7B,	%g1
	call	loop_7
	call	loop_8
loop_6:
	call	loop_9
	movrlez	%i1,	%i7,	%i5
loop_7:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_8:
	mulscc	%l1,	0x1CC8,	%l5
loop_9:
	fnot2	%f2,	%f12
	call	loop_10
	rdpr	%wstate,	%i3
	fbn,a,pn	%fcc3,	loop_11
	call	loop_12
loop_10:
	edge32	%i6,	%g2,	%o5
	tsubcc	%o1,	%i2,	%l0
loop_11:
	edge16ln	%o4,	%o3,	%o0
loop_12:
	fornot1s	%f9,	%f14,	%f24
	wrpr	%l4,	%g3,	%pil
	andcc	%g5,	%g4,	%l6
	mulx	%l3,	0x0D2B,	%i4
	fbge,a	%fcc3,	loop_13
	tpos	%icc,	0x0
	fcmpeq16	%f26,	%f22,	%g6
	fandnot1s	%f6,	%f15,	%f19
loop_13:
	call	loop_14
	fxnors	%f6,	%f15,	%f6
	call	loop_15
	bleu	%xcc,	loop_16
loop_14:
	fexpand	%f20,	%f26
	wr	%l2,	%o2,	%sys_tick
loop_15:
	fmul8x16	%f19,	%f26,	%f18
loop_16:
	move	%fcc1,	0x6E1,	%o7
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f30
	tge	%xcc,	0x3
	xor	%g1,	%g7,	%i1
	fcmped	%fcc0,	%f8,	%f12
	nop
	set	0x1A, %l4
	ldsb	[%l7 + %l4],	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_17
	fand	%f18,	%f20,	%f8
	ta	%icc,	0x2
	fmuld8ulx16	%f5,	%f18,	%f20
loop_17:
	fmovso	%fcc2,	%f28,	%f21
	call	loop_18
	bleu,a,pn	%xcc,	loop_19
	edge8	%i0,	%l1,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC0C, 	%hsys_tick_cmpr
loop_18:
	nop
	setx	0x1EF5,	%l0,	%g2
	udivcc	%i3,	%g2,	%o5
loop_19:
	call	loop_20
	call	loop_21
	edge8	%o1,	%i2,	%l0
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f13
loop_20:
	fnot1	%f10,	%f16
loop_21:
	call	loop_22
	fmovdle	%icc,	%f16,	%f28
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 2
loop_22:
	rdpr	%cleanwin,	%o3
	call	loop_23
	fmovdgu	%xcc,	%f0,	%f24
	set	0x40, %o2
	stxa	%o0,	[%l7 + %o2] 0x2f
	membar	#Sync
loop_23:
	orcc	%i6,	%l4,	%g3
	call	loop_24
	rd	%ccr,	%g4
	call	loop_25
	fmovdul	%fcc2,	%f10,	%f16
loop_24:
	movn	%xcc,	%g5,	%l3
	set	0x49, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i4
loop_25:
	fors	%f2,	%f12,	%f0
	fnot1s	%f5,	%f23
	siam	0x7
	wr	%g6,	0x095D,	%ccr
	fmovrsne	%l6,	%f2,	%f21
	fmovdcc	%icc,	%f4,	%f26
	call	loop_26
	call	loop_27
	fcmpne32	%f22,	%f20,	%o2
	nop
	set	0x0C, %o1
	ldsw	[%l7 + %o1],	%l2
loop_26:
	fpsub32	%f18,	%f2,	%f22
loop_27:
	call	loop_28
	fmul8ulx16	%f6,	%f16,	%f4
	bpos,pn	%icc,	loop_29
	movleu	%icc,	%g1,	%o7
loop_28:
	call	loop_30
	orn	%g7,	0x047B,	%i5
loop_29:
	bshuffle	%f20,	%f28,	%f16
	call	loop_31
loop_30:
	fpadd32s	%f3,	%f31,	%f0
	fmovdvc	%icc,	%f26,	%f6
	std	%f4,	[%l7 + 0x18]
loop_31:
	fone	%f22
	fnegs	%f25,	%f0
	call	loop_32
	tsubcc	%i7,	0x08C4,	%i1
	fnot1s	%f5,	%f4
	fexpand	%f10,	%f30
loop_32:
	orn	%l1,	0x0B4F,	%l5
	fone	%f0
	fmovsue	%fcc2,	%f31,	%f7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i0,	%o6
	bn	%xcc,	loop_33
	call	loop_34
	call	loop_35
	call	loop_36
loop_33:
	fmovdug	%fcc1,	%f6,	%f16
loop_34:
	call	loop_37
loop_35:
	fcmpeq16	%f30,	%f22,	%i3
loop_36:
	movleu	%xcc,	%g2,	%o1
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f10
loop_37:
	sub	%o5,	0x020C,	%l0
	ba	%icc,	loop_38
	flushw
	fmovs	%f8,	%f31
	call	loop_39
loop_38:
	srlx	%o4,	0x17,	%i2
	nop
	set	0x3E, %i3
	stb	%o3,	[%l7 + %i3]
	call	loop_40
loop_39:
	fmovrdgez	%o0,	%f30,	%f6
	tvc	%icc,	0x6
	nop
	setx	0x1D3E,	%l0,	%i6
	udivcc	%l4,	%i6,	%g4
loop_40:
	fcmpes	%fcc0,	%f5,	%f3
	call	loop_41
	fmovdvs	%xcc,	%f28,	%f10
	fmovdle	%fcc1,	%f0,	%f6
	fxnor	%f2,	%f22,	%f6
loop_41:
	call	loop_42
	call	loop_43
	fmovsug	%fcc0,	%f31,	%f6
	movul	%fcc3,	0x4CF,	%g3
loop_42:
	call	loop_44
loop_43:
	fmovrdgez	%l3,	%f10,	%f28
	fcmple16	%f26,	%f22,	%g5
	movuge	%fcc0,	%i4,	%g6
loop_44:
	edge32n	%l6,	%o2,	%g1
	wrpr	%l2,	0x00F4,	%cwp
	wr	%g7,	0x1CD3,	%clear_softint
	flushw
	fabsd	%f10,	%f12
	call	loop_45
	nop
	set	0x1F, %i1
	ldstub	[%l7 + %i1],	%o7
	call	loop_46
	fnot2s	%f21,	%f11
loop_45:
	tl	%icc,	0x1
	call	loop_47
loop_46:
	fpsub16	%f10,	%f8,	%f18
	fmovd	%f6,	%f12
	edge32	%i5,	%i1,	%l1
loop_47:
	movule	%fcc1,	0x24B,	%l5
	xnorcc	%i7,	%o6,	%i0
	rdhpr	%hsys_tick_cmpr,	%g2
	andncc	%i3,	%o5,	%l0
	call	loop_48
	fmovrslz	%o1,	%f15,	%f14
	call	loop_49
	call	loop_50
loop_48:
	fornot2	%f6,	%f30,	%f4
	fmovrsgez	%o4,	%f11,	%f9
loop_49:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD9D, 	%hsys_tick_cmpr
loop_50:
	fmovdge	%fcc1,	%f30,	%f26
	nop
	setx	0x6676C2C3D45EAA05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x96D10CE0BC92BA34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f2,	%f12
	fmovs	%f18,	%f7
	rdhpr	%hpstate,	%i2
	fxor	%f2,	%f14,	%f24
	ldsw	[%l7 + 0x28],	%o0
	and	%l4,	0x130F,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x333, 	%hsys_tick_cmpr
	fmovsl	%fcc2,	%f12,	%f31
	call	loop_51
	tleu	%xcc,	0x4
	fmovsa	%fcc2,	%f16,	%f19
	call	loop_52
loop_51:
	call	loop_53
	siam	0x2
	nop
	set	0x73, %l6
	ldsb	[%l7 + %l6],	%g5
loop_52:
	fbge,a	%fcc1,	loop_54
loop_53:
	tsubcc	%i4,	0x1F52,	%l3
	bgu,a	%icc,	loop_55
	fbe,pt	%fcc2,	loop_56
loop_54:
	call	loop_57
	tle	%icc,	0x4
loop_55:
	ble,pt	%icc,	loop_58
loop_56:
	fnors	%f2,	%f15,	%f20
loop_57:
	call	loop_59
	call	loop_60
loop_58:
	call	loop_61
	bmask	%g6,	%o2,	%g1
loop_59:
	fzeros	%f16
loop_60:
	fornot1s	%f29,	%f16,	%f6
loop_61:
	edge32n	%l2,	%g7,	%l6
	fpadd32s	%f5,	%f12,	%f10
	nop
	set	0x26, %i0
	ldsh	[%l7 + %i0],	%o7
	tsubcctv	%i1,	0x08FD,	%i5
	fmovda	%xcc,	%f10,	%f26
	movge	%icc,	%l1,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBB6, 	%hsys_tick_cmpr
	edge16n	%i7,	%i0,	%g2
	brgz,a,pn	%i3,	loop_62
	tpos	%icc,	0x4
	fmovdue	%fcc1,	%f2,	%f18
	call	loop_63
loop_62:
	orncc	%o5,	0x18C1,	%l0
	movl	%icc,	%o1,	%o4
	orcc	%i2,	0x1913,	%o3
loop_63:
	nop
	fitos	%f3,	%f0
	fstox	%f0,	%f16
	addcc	%o0,	%i6,	%g3
	rdpr	%canrestore,	%g4
	call	loop_64
	call	loop_65
	fcmpne16	%f12,	%f2,	%l4
	tvs	%icc,	0x1
loop_64:
	bmask	%g5,	%l3,	%g6
loop_65:
	fba,a	%fcc0,	loop_66
	movvs	%xcc,	0x5B2,	%i4
	call	loop_67
	call	loop_68
loop_66:
	fsrc2s	%f14,	%f27
	call	loop_69
loop_67:
	stbar
loop_68:
	fmovdneg	%xcc,	%f20,	%f14
	fmovsu	%fcc0,	%f23,	%f17
loop_69:
	wr	%g1,	0x04B5,	%sys_tick
	fmovde	%xcc,	%f0,	%f0
	bcs,a,pt	%icc,	loop_70
	call	loop_71
	call	loop_72
	fblg,pn	%fcc2,	loop_73
loop_70:
	bleu	%xcc,	loop_74
loop_71:
	fmovdug	%fcc3,	%f24,	%f18
loop_72:
	call	loop_75
loop_73:
	movg	%xcc,	%o2,	%l2
loop_74:
	call	loop_76
	ta	%xcc,	0x3
loop_75:
	move	%xcc,	%g7,	%o7
	te	%xcc,	0x2
loop_76:
	call	loop_77
	orncc	%i1,	%i5,	%l1
	pdist	%f22,	%f28,	%f26
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f24
loop_77:
	nop
	set	0x60, %o6
	lduwa	[%l7 + %o6] 0x19,	%l5
	fmovscs	%xcc,	%f5,	%f1
	tvc	%icc,	0x5
	call	loop_78
	bl,pn	%icc,	loop_79
	fmovdlg	%fcc1,	%f8,	%f4
	call	loop_80
loop_78:
	call	loop_81
loop_79:
	call	loop_82
	call	loop_83
loop_80:
	movneg	%xcc,	%o6,	%i7
loop_81:
	nop
	set	0x7C, %g6
	sta	%f15,	[%l7 + %g6] 0x10
loop_82:
	fba,a,pn	%fcc2,	loop_84
loop_83:
	nop
	set	0x4C, %i4
	ldsw	[%l7 + %i4],	%l6
	or	%g2,	0x1150,	%i3
	call	loop_85
loop_84:
	rdpr	%tba,	%o5
	rdhpr	%hpstate,	%i0
	nop
	setx	0x1E0F,	%l1,	%l0
	udivcc	%o1,	%l0,	%o4
loop_85:
	subc	%i2,	%o0,	%i6
	sllx	%g3,	%g4,	%l4
	call	loop_86
	nop
	setx	0xA6318D5B8D50997B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2755FE87,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f26,	%f16
	orn	%g5,	%l3,	%o3
	call	loop_87
loop_86:
	fcmpgt32	%f30,	%f10,	%i4
	call	loop_88
	movcc	%xcc,	%g1,	%g6
loop_87:
	call	loop_89
	call	loop_90
loop_88:
	fnands	%f14,	%f0,	%f11
	fmovduge	%fcc3,	%f0,	%f22
loop_89:
	fmul8x16al	%f0,	%f26,	%f0
loop_90:
	fnors	%f7,	%f27,	%f29
	call	loop_91
	wrpr	%l2,	0x1C60,	%tick
	call	loop_92
	call	loop_93
loop_91:
	call	loop_94
	rd	%asi,	%g7
loop_92:
	movrlez	%o7,	%o2,	%i5
loop_93:
	mulscc	%l1,	%i1,	%l5
loop_94:
	array8	%o6,	%i7,	%g2
	tge	%icc,	0x6
	call	loop_95
	call	loop_96
	call	loop_97
	array16	%i3,	%o5,	%i0
loop_95:
	fnot1s	%f24,	%f27
loop_96:
	call	loop_98
loop_97:
	rdhpr	%hintp,	%l6
	fnand	%f26,	%f4,	%f30
	lduh	[%l7 + 0x60],	%o1
loop_98:
	movge	%fcc3,	0x502,	%l0
	call	loop_99
	movle	%xcc,	%o4,	%o0
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f28
	fxtos	%f28,	%f11
	fmovscs	%xcc,	%f10,	%f6
loop_99:
	orncc	%i6,	0x0F86,	%i2
	fmovsvs	%xcc,	%f0,	%f1
	rdpr	%cleanwin,	%g3
	umulcc	%g4,	0x0CF5,	%l4
	addccc	%g5,	0x1889,	%o3
	fabss	%f30,	%f9
	call	loop_100
	call	loop_101
	bgu	%icc,	loop_102
	call	loop_103
loop_100:
	fnor	%f20,	%f28,	%f16
loop_101:
	fmovdne	%fcc3,	%f0,	%f28
loop_102:
	call	loop_104
loop_103:
	sir	0x079A
	call	loop_105
	movrgz	%l3,	0x3F8,	%g1
loop_104:
	fnot2s	%f26,	%f7
	fmovrdgz	%g6,	%f14,	%f2
loop_105:
	fmovdvc	%icc,	%f10,	%f0
	brgez,a	%l2,	loop_106
	call	loop_107
	fba,a	%fcc0,	loop_108
	tleu	%icc,	0x5
loop_106:
	bgu	%icc,	loop_109
loop_107:
	movul	%fcc1,	%g7,	%i4
loop_108:
	ldx	[%l7 + 0x20],	%o2
	fcmpgt16	%f14,	%f6,	%o7
loop_109:
	fors	%f10,	%f8,	%f29
	sllx	%i5,	0x0F,	%l1
	call	loop_110
	flushw
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_110:
	fmovsul	%fcc2,	%f18,	%f20
	call	loop_111
	edge32l	%l5,	%o6,	%i1
	fpsub16s	%f12,	%f17,	%f19
	rdhpr	%hintp,	%g2
loop_111:
	movneg	%xcc,	%i3,	%i7
	fpadd32	%f16,	%f22,	%f22
	fcmpd	%fcc1,	%f26,	%f28
	nop
	setx	0xB10A0449,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	rdpr	%cwp,	%i0
	call	loop_112
	addccc	%o5,	0x1586,	%o1
	mova	%xcc,	%l6,	%l0
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_112:
	call	loop_113
	edge32l	%o0,	%o4,	%i2
	move	%icc,	0x14B,	%i6
	fpack16	%f8,	%f20
loop_113:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x297, 	%hsys_tick_cmpr
	nop
	setx	0x01A1,	%l0,	%g5
	udivx	%l4,	%g5,	%l3
	fornot2s	%f19,	%f13,	%f17
	srlx	%o3,	%g1,	%g6
	fnands	%f19,	%f4,	%f9
	call	loop_114
	rd	%tick_cmpr,	%l2
	call	loop_115
	fsrc1	%f16,	%f0
loop_114:
	for	%f24,	%f28,	%f30
	udiv	%g7,	0x040E,	%o2
loop_115:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%i5
	and	%o7,	%l5,	%l1
	movrlez	%o6,	0x133,	%i1
	call	loop_116
	call	loop_117
	nop
	fitod	%f2,	%f24
	fdtox	%f24,	%f18
	movge	%xcc,	0x161,	%g2
loop_116:
	fpadd32	%f16,	%f2,	%f28
loop_117:
	call	loop_118
	fmovrsgz	%i3,	%f16,	%f18
	fpack16	%f16,	%f10
	call	loop_119
loop_118:
	edge16	%i7,	%i0,	%o1
	fmovdg	%xcc,	%f24,	%f8
	call	loop_120
loop_119:
	fmovscc	%xcc,	%f5,	%f10
	call	loop_121
	fmovdvc	%icc,	%f4,	%f18
loop_120:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_122
loop_121:
	call	loop_123
	fandnot1	%f30,	%f30,	%f26
	fmovs	%f14,	%f13
loop_122:
	brgz,a,pn	%l6,	loop_124
loop_123:
	fmovde	%xcc,	%f8,	%f12
	edge8l	%o0,	%o4,	%i2
	stbar
loop_124:
	smul	%l0,	%i6,	%g4
	tpos	%icc,	0x2
	call	loop_125
	fmovsul	%fcc0,	%f7,	%f25
	call	loop_126
	fmovsl	%fcc1,	%f12,	%f16
loop_125:
	nop
	fitod	%f6,	%f24
	fdtoi	%f24,	%f24
	call	loop_127
loop_126:
	andcc	%l4,	%g3,	%g5
	tcc	%icc,	0x2
	fmovdule	%fcc2,	%f26,	%f2
loop_127:
	call	loop_128
	edge16n	%l3,	%g1,	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	move	%xcc,	%l2,	%o2
loop_128:
	fmovrsgez	%i4,	%f31,	%f14
	tne	%icc,	0x0
	udivx	%i5,	0x0633,	%l5
	fsrc2	%f30,	%f10
	bleu,a	%xcc,	loop_129
	fpsub16	%f12,	%f10,	%f6
	fxor	%f14,	%f22,	%f22
	nop
	setx	0xBDB78851B4E4B632,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9056818F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f24,	%f24
loop_129:
	call	loop_130
	call	loop_131
	fmovsgu	%icc,	%f13,	%f3
	tsubcc	%o7,	%o6,	%l1
loop_130:
	ba	%icc,	loop_132
loop_131:
	movpos	%xcc,	%i1,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA4D, 	%hsys_tick_cmpr
	tpos	%icc,	0x1
loop_132:
	edge8	%i3,	%o1,	%i0
	nop
	setx	0xAE3FBB18D8B802F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xFFCC3049CC0F558A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f10,	%f24
	edge32l	%o5,	%o0,	%o4
	call	loop_133
	call	loop_134
	bleu,pt	%xcc,	loop_135
	fbul	%fcc0,	loop_136
loop_133:
	fnot1	%f14,	%f18
loop_134:
	call	loop_137
loop_135:
	popc	%i2,	%l6
loop_136:
	fzero	%f12
	fbe,pt	%fcc1,	loop_138
loop_137:
	call	loop_139
	call	loop_140
	umulcc	%i6,	%g4,	%l4
loop_138:
	bcc,a	%icc,	loop_141
loop_139:
	nop
	setx	0x30FD26BCB831C2C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x4AF496BDBE7A2F28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f8
loop_140:
	call	loop_142
	call	loop_143
loop_141:
	fmovrde	%l0,	%f0,	%f14
	edge8n	%g3,	%l3,	%g1
loop_142:
	sdivcc	%o3,	0x016A,	%g5
loop_143:
	te	%icc,	0x3
	tgu	%xcc,	0x3
	orn	%g6,	0x027F,	%g7
	rd	%softint,	%o2
	call	loop_144
	brz,pt	%i4,	loop_145
	fmovdn	%xcc,	%f18,	%f24
	sethi	0x1408,	%l2
loop_144:
	edge16l	%i5,	%l5,	%o7
loop_145:
	edge16n	%o6,	%i1,	%g2
	subc	%i7,	0x1368,	%i3
	fpmerge	%f7,	%f6,	%f20
	call	loop_146
	stx	%o1,	[%l7 + 0x60]
	fnot1	%f4,	%f20
	fsrc2	%f4,	%f30
loop_146:
	movu	%fcc3,	0x263,	%l1
	mulscc	%i0,	%o0,	%o4
	call	loop_147
	alignaddrl	%o5,	%i2,	%i6
	movrlez	%l6,	0x1A0,	%l4
	movpos	%icc,	0x13E,	%g4
loop_147:
	call	loop_148
	fmovdul	%fcc1,	%f16,	%f4
	fmovsgu	%xcc,	%f28,	%f17
	nop
	setx	0x1BBB,	%l1,	%l0
	udivx	%g3,	%l0,	%l3
loop_148:
	siam	0x1
	fcmple32	%f24,	%f10,	%o3
	bmask	%g5,	%g1,	%g6
	movul	%fcc2,	%g7,	%o2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 23
!	Type a   	: 33
!	Type x   	: 8
!	Type cti   	: 148
!	Type f   	: 144
!	Type i   	: 144
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
	set	0xF,	%g1
	set	0xE,	%g2
	set	0xD,	%g3
	set	0x3,	%g4
	set	0x1,	%g5
	set	0x0,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xF,	%i1
	set	-0x7,	%i2
	set	-0x0,	%i3
	set	-0x5,	%i4
	set	-0xE,	%i5
	set	-0x0,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x764E1016,	%l0
	set	0x0D4B30F8,	%l1
	set	0x2065B2C6,	%l2
	set	0x02429280,	%l3
	set	0x214CC097,	%l4
	set	0x2FDDCF12,	%l5
	set	0x511625A4,	%l6
	!# Output registers
	set	-0x0B44,	%o0
	set	-0x0707,	%o1
	set	-0x1BC4,	%o2
	set	0x0F06,	%o3
	set	0x092E,	%o4
	set	0x15AB,	%o5
	set	-0x143F,	%o6
	set	-0x0B65,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	fbu	%fcc0,	loop_149
	fmovrde	%i4,	%f18,	%f4
	call	loop_150
	fmovrdgz	%l2,	%f28,	%f22
loop_149:
	movgu	%xcc,	0x4DB,	%i5
	call	loop_151
loop_150:
	fbue,a,pt	%fcc3,	loop_152
	call	loop_153
	call	loop_154
loop_151:
	fmovspos	%xcc,	%f10,	%f20
loop_152:
	fbg,a	%fcc1,	loop_155
loop_153:
	call	loop_156
loop_154:
	nop
	setx	loop_157,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012400001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot1s	%f4,	%f30,	%f9
loop_155:
	movlg	%fcc2,	0x0C1,	%l5
loop_156:
	tneg	%icc,	0x0
loop_157:
	bleu,a	%xcc,	loop_158
	call	loop_159
	fmovdug	%fcc0,	%f20,	%f8
	fmovsneg	%xcc,	%f16,	%f7
loop_158:
	call	loop_160
loop_159:
	call	loop_161
	nop
	setx	0x0EAD7720,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x937359E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f10,	%f30
	fsrc1s	%f3,	%f25
loop_160:
	fzero	%f10
loop_161:
	tl	%xcc,	0x1
	sub	%o6,	0x062D,	%i1
	fmovrsgez	%o7,	%f22,	%f4
	tpos	%xcc,	0x6
	call	loop_162
	fmovdneg	%xcc,	%f4,	%f16
	call	loop_163
	call	loop_164
loop_162:
	fandnot1s	%f17,	%f3,	%f17
	rd	%asi,	%i7
loop_163:
	fxor	%f4,	%f6,	%f10
loop_164:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i3
	srlx	%o1,	%g2,	%i0
	movl	%fcc1,	%l1,	%o4
	fpsub32	%f0,	%f10,	%f30
	call	loop_165
	call	loop_166
	call	loop_167
	bgu,a	%icc,	loop_168
loop_165:
	call	loop_169
loop_166:
	fcmped	%fcc3,	%f8,	%f28
loop_167:
	fxor	%f2,	%f6,	%f24
loop_168:
	lduw	[%l7 + 0x18],	%o5
loop_169:
	taddcc	%o0,	0x066D,	%i2
	fcmple16	%f8,	%f12,	%i6
	movo	%fcc1,	0x007,	%l6
	call	loop_170
	fandnot2	%f2,	%f2,	%f20
	rdhpr	%hintp,	%l4
	edge32	%g4,	%l0,	%l3
loop_170:
	brgz	%o3,	loop_171
	fmovdule	%fcc1,	%f10,	%f18
	call	loop_172
	call	loop_173
loop_171:
	bgu,pn	%xcc,	loop_174
	call	loop_175
loop_172:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_173:
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f13
loop_174:
	movcc	%xcc,	%g3,	%g1
loop_175:
	fcmpeq16	%f10,	%f28,	%g6
	movvc	%icc,	%g7,	%g5
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	for	%f4,	%f26,	%f20
	mova	%fcc2,	0x437,	%i4
	fpadd16s	%f20,	%f10,	%f31
	movg	%fcc0,	0x6D2,	%o2
	bshuffle	%f20,	%f10,	%f4
	fcmple16	%f4,	%f26,	%i5
	wrpr 	%g0, 	0x2, 	%gl
	movneg	%icc,	0x21D,	%o6
	umulcc	%o7,	%i7,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_176
	call	loop_177
	movule	%fcc2,	%g2,	%i1
	fmovrslz	%l1,	%f29,	%f7
loop_176:
	add	%o4,	%i0,	%o0
loop_177:
	bcc,a	%icc,	loop_178
	call	loop_179
	orcc	%o5,	0x1C64,	%i6
	call	loop_180
loop_178:
	movre	%l6,	0x2BF,	%l4
loop_179:
	movpos	%xcc,	%g4,	%l0
	call	loop_181
loop_180:
	bcc,a	%icc,	loop_182
	call	loop_183
	fcmpgt32	%f16,	%f12,	%i2
loop_181:
	edge8	%l3,	%o3,	%g1
loop_182:
	fbl,pt	%fcc3,	loop_184
loop_183:
	bvc,pn	%icc,	loop_185
	fmovdvs	%icc,	%f0,	%f8
	fmovdvc	%icc,	%f26,	%f2
loop_184:
	nop
	setx	0xA7B2B207,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_185:
	edge8	%g6,	%g7,	%g3
	rdhpr	%hintp,	%g5
	sth	%o2,	[%l7 + 0x72]
	movvc	%icc,	%i4,	%i5
	call	loop_186
	bg,pn	%icc,	loop_187
	call	loop_188
	fbl,pn	%fcc2,	loop_189
loop_186:
	mulx	%l5,	0x07C9,	%l2
loop_187:
	rdpr	%cansave,	%o7
loop_188:
	subcc	%o6,	%i7,	%i3
loop_189:
	call	loop_190
	call	loop_191
	flushw
	call	loop_192
loop_190:
	wrpr 	%g0, 	0x2, 	%gl
loop_191:
	nop
	set	0x13, %l1
	lduba	[%l7 + %l1] 0x80,	%l1
loop_192:
	fmovsa	%fcc3,	%f15,	%f3
	call	loop_193
	edge32ln	%o4,	%i0,	%o0
	call	loop_194
	and	%o1,	%o5,	%i6
loop_193:
	call	loop_195
	andcc	%l4,	0x1536,	%l6
loop_194:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g4,	%i2
loop_195:
	call	loop_196
	call	loop_197
	rd	%pc,	%l0
	call	loop_198
loop_196:
	call	loop_199
loop_197:
	nop
	set	0x7C, %o4
	swap	[%l7 + %o4],	%l3
	wrpr	%o3,	0x057F,	%pil
loop_198:
	call	loop_200
loop_199:
	fmovse	%fcc2,	%f0,	%f29
	fmuld8sux16	%f9,	%f27,	%f30
	call	loop_201
loop_200:
	call	loop_202
	mulx	%g1,	0x0413,	%g6
	fmovda	%fcc3,	%f18,	%f6
loop_201:
	nop
	fitod	%f2,	%f2
	fdtoi	%f2,	%f12
loop_202:
	fcmple16	%f26,	%f30,	%g3
	call	loop_203
	fmovsgu	%xcc,	%f6,	%f29
	set	0x18, %l0
	lda	[%l7 + %l0] 0x89,	%f26
loop_203:
	mulx	%g5,	%o2,	%i4
	fmovdul	%fcc0,	%f2,	%f20
	fmovdn	%xcc,	%f24,	%f28
	fnot2	%f8,	%f26
	call	loop_204
	fpadd32s	%f24,	%f5,	%f18
	edge32	%i5,	%l5,	%l2
	call	loop_205
loop_204:
	taddcctv	%o7,	0x1488,	%g7
	fcmpd	%fcc0,	%f18,	%f20
	fors	%f19,	%f7,	%f28
loop_205:
	tcc	%icc,	0x6
	fmovdul	%fcc1,	%f8,	%f24
	movg	%fcc2,	0x150,	%o6
	fornot2	%f30,	%f0,	%f24
	fnot2s	%f3,	%f1
	tsubcc	%i7,	%g2,	%i3
	st	%f18,	[%l7 + 0x1C]
	movcc	%icc,	%l1,	%o4
	fmovse	%icc,	%f6,	%f17
	fmovso	%fcc1,	%f0,	%f22
	xorcc	%i1,	%o0,	%o1
	call	loop_206
	nop
	fitod	%f17,	%f12
	movvs	%xcc,	0x5D7,	%i0
	tcc	%xcc,	0x2
loop_206:
	fsrc2	%f26,	%f12
	movvc	%xcc,	0x2AD,	%i6
	call	loop_207
	bneg,a,pn	%icc,	loop_208
	call	loop_209
	st	%f2,	[%l7 + 0x50]
loop_207:
	rdhpr	%ver,	%l4
loop_208:
	nop
	set	0x60, %g1
	sta	%f15,	[%l7 + %g1] 0x04
loop_209:
	edge8	%l6,	%g4,	%o5
	rdhpr	%hpstate,	%l0
	call	loop_210
	sllx	%l3,	0x1B,	%o3
	call	loop_211
	fbo,a,pn	%fcc0,	loop_212
loop_210:
	call	loop_213
	fmovsl	%fcc2,	%f17,	%f10
loop_211:
	fmovdne	%fcc0,	%f2,	%f12
loop_212:
	call	loop_214
loop_213:
	call	loop_215
	fornot1s	%f23,	%f5,	%f22
	ba,a,pn	%icc,	loop_216
loop_214:
	fornot2s	%f17,	%f31,	%f19
loop_215:
	call	loop_217
	sdivx	%g1,	0x0CBC,	%g6
loop_216:
	fmovsle	%fcc0,	%f22,	%f4
	andncc	%i2,	%g5,	%g3
loop_217:
	call	loop_218
	call	loop_219
	bn	%icc,	loop_220
	tl	%xcc,	0x0
loop_218:
	fcmple32	%f18,	%f0,	%o2
loop_219:
	array8	%i4,	%i5,	%l2
loop_220:
	andn	%l5,	0x19E5,	%o7
	rd	%fprs,	%g7
	call	loop_221
	fmuld8sux16	%f29,	%f18,	%f18
	fmovdne	%icc,	%f24,	%f6
	subcc	%i7,	%o6,	%i3
loop_221:
	fpack32	%f20,	%f14,	%f26
	wr	%g0,	0x0c,	%asi
	stba	%g2,	[%l7 + 0x66] %asi
	subc	%l1,	0x0081,	%i1
	call	loop_222
	call	loop_223
	andcc	%o0,	0x1A35,	%o1
	edge32ln	%o4,	%i0,	%l4
loop_222:
	be	%icc,	loop_224
loop_223:
	andncc	%i6,	%l6,	%o5
	nop
	set	0x10, %i2
	stx	%g4,	[%l7 + %i2]
	tleu	%icc,	0x5
loop_224:
	nop
	set	0x2C, %g2
	lduwa	[%l7 + %g2] 0x81,	%l3
	brgz,a	%o3,	loop_225
	fcmpgt32	%f12,	%f0,	%g1
	fsrc1	%f4,	%f2
	alignaddrl	%g6,	%i2,	%l0
loop_225:
	fmovsul	%fcc3,	%f18,	%f17
	call	loop_226
	fmul8x16	%f27,	%f28,	%f12
	fmovrslez	%g3,	%f2,	%f9
	call	loop_227
loop_226:
	movpos	%xcc,	0x61A,	%o2
	movpos	%icc,	%i4,	%i5
	nop
	setx	0x2CFE4FFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_227:
	fxnors	%f24,	%f30,	%f20
	edge8ln	%g5,	%l2,	%o7
	call	loop_228
	movle	%icc,	%g7,	%i7
	call	loop_229
	call	loop_230
loop_228:
	nop
	setx	0x2DA72038576978CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x74B58BB9C0322148,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f30,	%f2
	call	loop_231
loop_229:
	rdhpr	%ver,	%l5
loop_230:
	call	loop_232
	bl	%icc,	loop_233
loop_231:
	movgu	%icc,	%o6,	%i3
	fmovdul	%fcc0,	%f26,	%f18
loop_232:
	call	loop_234
loop_233:
	brgez,a,pn	%g2,	loop_235
	fmovdgu	%xcc,	%f16,	%f22
	call	loop_236
loop_234:
	nop
	setx	0xD2E2FA71,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x2F121D87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f16,	%f15
loop_235:
	nop
	setx	0xA94EBB5F6A27FE53,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6B98DC2976D3EFB8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f12,	%f16
	fmovsneg	%icc,	%f1,	%f24
loop_236:
	fmovsuge	%fcc2,	%f22,	%f22
	rdpr	%tl,	%l1
	smul	%o0,	0x1512,	%o1
	call	loop_237
	fornot1s	%f24,	%f5,	%f3
	rdhpr	%ver,	%o4
	tle	%icc,	0x1
loop_237:
	movue	%fcc0,	0x2C8,	%i1
	fmovsa	%xcc,	%f18,	%f1
	call	loop_238
	fmovrslez	%l4,	%f13,	%f3
	call	loop_239
	mova	%fcc3,	0x6E4,	%i0
loop_238:
	call	loop_240
	call	loop_241
loop_239:
	call	loop_242
	alignaddr	%l6,	%i6,	%g4
loop_240:
	mulscc	%o5,	0x1462,	%l3
loop_241:
	movue	%fcc2,	%o3,	%g6
loop_242:
	fandnot2s	%f24,	%f10,	%f8
	movre	%i2,	0x3D9,	%g1
	brnz,pt	%g3,	loop_243
	xor	%l0,	0x0363,	%o2
	bleu,a	%icc,	loop_244
	fsrc2	%f24,	%f8
loop_243:
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f26
	fandnot2	%f16,	%f4,	%f6
loop_244:
	movu	%fcc1,	0x27D,	%i4
	fmovspos	%icc,	%f1,	%f21
	call	loop_245
	umul	%g5,	0x0EFB,	%i5
	rd	%tick_cmpr,	%o7
	alignaddr	%l2,	%i7,	%g7
loop_245:
	movu	%fcc2,	%o6,	%i3
	call	loop_246
	fmovdug	%fcc0,	%f4,	%f18
	fone	%f20
	fnot1s	%f20,	%f4
loop_246:
	flush	%l7 + 0x30
	fnot1s	%f28,	%f1
	udivx	%l5,	0x0208,	%g2
	fpack32	%f12,	%f8,	%f14
	fornot2s	%f27,	%f8,	%f1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o1
	smul	%o4,	0x11C2,	%i1
	fmovrsne	%l4,	%f22,	%f9
	array32	%i0,	%o0,	%l6
	taddcctv	%g4,	%i6,	%o5
	call	loop_247
	call	loop_248
	pdist	%f6,	%f4,	%f8
	ta	%xcc,	0x7
loop_247:
	for	%f20,	%f0,	%f18
loop_248:
	fnot2	%f16,	%f22
	nop
	setx	0x03F5,	%l0,	%g6
	sdivcc	%l3,	%g6,	%o3
	bl,a,pt	%icc,	loop_249
	movule	%fcc2,	0x5BF,	%i2
	call	loop_250
	call	loop_251
loop_249:
	fpsub32s	%f15,	%f27,	%f2
	fpack32	%f26,	%f24,	%f8
loop_250:
	ldx	[%l7 + 0x30],	%g1
loop_251:
	fxor	%f14,	%f28,	%f30
	set	0x0C, %g5
	stba	%g3,	[%l7 + %g5] 0x11
	fzeros	%f7
	taddcctv	%l0,	%i4,	%o2
	bl,a	%xcc,	loop_252
	call	loop_253
	fxnor	%f0,	%f28,	%f2
	fpackfix	%f26,	%f29
loop_252:
	rdpr	%tba,	%i5
loop_253:
	fand	%f22,	%f0,	%f18
	udiv	%o7,	0x019F,	%g5
	movlg	%fcc2,	0x765,	%l2
	call	loop_254
	call	loop_255
	fmovdcc	%xcc,	%f20,	%f10
	stbar
loop_254:
	ldub	[%l7 + 0x3D],	%g7
loop_255:
	call	loop_256
	call	loop_257
	call	loop_258
	edge32n	%o6,	%i7,	%l5
loop_256:
	call	loop_259
loop_257:
	wrpr 	%g0, 	0x1, 	%gl
loop_258:
	nop
	setx	0xECF9D53406410307,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x90567DDE6A4E6DB5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f14,	%f12
	fone	%f2
loop_259:
	sth	%l1,	[%l7 + 0x54]
	array16	%o1,	%g2,	%i1
	fmovsn	%icc,	%f10,	%f6
	wr	%l4,	0x1E0F,	%set_softint
	fzero	%f2
	siam	0x1
	fcmpgt16	%f18,	%f24,	%i0
	nop
	set	0x7A, %l2
	lduh	[%l7 + %l2],	%o4
	call	loop_260
	mova	%icc,	%l6,	%g4
	array16	%i6,	%o0,	%l3
	fpadd32s	%f6,	%f25,	%f3
loop_260:
	call	loop_261
	addc	%g6,	0x1521,	%o3
	sra	%o5,	%g1,	%i2
	prefetch	[%l7 + 0x78],	 2
loop_261:
	call	loop_262
	call	loop_263
	call	loop_264
	call	loop_265
loop_262:
	tsubcc	%l0,	%g3,	%o2
loop_263:
	mulx	%i4,	%i5,	%o7
loop_264:
	fands	%f21,	%f11,	%f8
loop_265:
	tle	%icc,	0x3
	call	loop_266
	call	loop_267
	call	loop_268
	nop
	setx	0xB24DF2A56E0EF172,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f2
loop_266:
	fmovdpos	%xcc,	%f28,	%f28
loop_267:
	fsrc2s	%f26,	%f29
loop_268:
	fcmpeq16	%f24,	%f18,	%l2
	nop
	setx	0x14B0,	%l0,	%o6
	udivx	%g7,	%o6,	%i7
	fmovsge	%icc,	%f14,	%f4
	xorcc	%l5,	%g5,	%i3
	set	0x28, %i7
	swapa	[%l7 + %i7] 0x81,	%o1
	fmovrse	%g2,	%f22,	%f6
	call	loop_269
	fornot1s	%f28,	%f22,	%f25
	edge16	%l1,	%i1,	%l4
	bneg	%icc,	loop_270
loop_269:
	call	loop_271
	mulscc	%o4,	0x183A,	%i0
	fmovrdgz	%g4,	%f0,	%f14
loop_270:
	fnands	%f25,	%f10,	%f9
loop_271:
	call	loop_272
	nop
	set	0x30, %i5
	ldstub	[%l7 + %i5],	%i6
	call	loop_273
	fmovrdlz	%o0,	%f2,	%f30
loop_272:
	call	loop_274
	taddcctv	%l3,	%g6,	%l6
loop_273:
	call	loop_275
	andcc	%o3,	%o5,	%i2
loop_274:
	ba,a,pt	%icc,	loop_276
	call	loop_277
loop_275:
	call	loop_278
	taddcc	%l0,	%g1,	%g3
loop_276:
	rdpr	%cansave,	%i4
loop_277:
	bl,a,pt	%icc,	loop_279
loop_278:
	subccc	%o2,	0x0ADA,	%i5
	call	loop_280
	tsubcctv	%o7,	0x0081,	%l2
loop_279:
	call	loop_281
	fbug	%fcc2,	loop_282
loop_280:
	tn	%icc,	0x4
	call	loop_283
loop_281:
	fmovsge	%icc,	%f2,	%f18
loop_282:
	call	loop_284
	movu	%fcc2,	0x622,	%o6
loop_283:
	call	loop_285
	xnorcc	%g7,	%i7,	%l5
loop_284:
	fmovsneg	%xcc,	%f22,	%f23
	flushw
loop_285:
	umul	%g5,	0x116E,	%i3
	call	loop_286
	fbul	%fcc3,	loop_287
	orcc	%o1,	%l1,	%g2
	stb	%i1,	[%l7 + 0x11]
loop_286:
	nop
	set	0x6C, %o3
	flush	%l7 + %o3
loop_287:
	call	loop_288
	call	loop_289
	call	loop_290
	andncc	%l4,	0x0503,	%o4
loop_288:
	nop
	fitos	%f4,	%f18
	fstod	%f18,	%f14
loop_289:
	fcmpgt32	%f22,	%f20,	%g4
loop_290:
	rd	%fprs,	%i0
	call	loop_291
	fmovdg	%fcc0,	%f16,	%f20
	movcs	%xcc,	%o0,	%l3
	call	loop_292
loop_291:
	fmovde	%fcc3,	%f18,	%f6
	fmul8x16al	%f4,	%f31,	%f16
	movleu	%icc,	%i6,	%l6
loop_292:
	call	loop_293
	fmovsgu	%icc,	%f24,	%f22
	fblg,a	%fcc0,	loop_294
	call	loop_295
loop_293:
	call	loop_296
	tge	%xcc,	0x0
loop_294:
	call	loop_297
loop_295:
	bvs	%icc,	loop_298
loop_296:
	movg	%icc,	0x338,	%g6
	fmovdcc	%xcc,	%f6,	%f16
loop_297:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x29] %asi,	%o5
loop_298:
	fmovdcc	%icc,	%f8,	%f6
	call	loop_299
	call	loop_300
	movrlz	%o3,	%l0,	%g1
	tge	%icc,	0x7
loop_299:
	tsubcctv	%i2,	%g3,	%i4
loop_300:
	call	loop_301
	movg	%icc,	%o2,	%i5
	call	loop_302
	fmovdu	%fcc1,	%f12,	%f2
loop_301:
	fcmpne16	%f28,	%f4,	%l2
	edge16l	%o6,	%g7,	%i7
loop_302:
	fmul8x16al	%f11,	%f15,	%f14
	nop
	setx	0x7B6E2E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	movre	%l5,	%o7,	%g5
	bmask	%o1,	%l1,	%g2
	call	loop_303
	and	%i3,	0x0204,	%l4
	call	loop_304
	call	loop_305
loop_303:
	fmovrde	%o4,	%f4,	%f16
	smul	%g4,	%i0,	%o0
loop_304:
	or	%l3,	0x0D51,	%i1
loop_305:
	call	loop_306
	bvc,pn	%icc,	loop_307
	edge8	%l6,	%i6,	%g6
	fmovscc	%icc,	%f24,	%f27
loop_306:
	call	loop_308
loop_307:
	call	loop_309
	tneg	%xcc,	0x2
	tgu	%xcc,	0x2
loop_308:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x2A] %asi,	%o3
loop_309:
	call	loop_310
	fcmpes	%fcc0,	%f21,	%f4
	call	loop_311
	call	loop_312
loop_310:
	sir	0x099A
	fands	%f31,	%f4,	%f20
loop_311:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x48] %asi
loop_312:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%l0
	call	loop_313
	call	loop_314
	nop
	setx	loop_315,	%l0,	%l1
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
	bne,pn	%icc,	loop_316
loop_313:
	call	loop_317
loop_314:
	alignaddrl	%o5,	%g1,	%g3
loop_315:
	nop

loop_316:
	nop

loop_317:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 34
!	Type a   	: 21
!	Type x   	: 14
!	Type cti   	: 169
!	Type f   	: 131
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
	set	0xB,	%g1
	set	0x2,	%g2
	set	0xA,	%g3
	set	0x9,	%g4
	set	0x0,	%g5
	set	0x9,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x8,	%i1
	set	-0xF,	%i2
	set	-0x7,	%i3
	set	-0xB,	%i4
	set	-0x5,	%i5
	set	-0xA,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x3895866B,	%l0
	set	0x4EAA04E5,	%l1
	set	0x1A22465A,	%l2
	set	0x6EA5DEB1,	%l3
	set	0x6EB8EC5B,	%l4
	set	0x239922A1,	%l5
	set	0x16C007BF,	%l6
	!# Output registers
	set	-0x12C9,	%o0
	set	-0x19AD,	%o1
	set	-0x0F39,	%o2
	set	-0x0B04,	%o3
	set	0x1CAE,	%o4
	set	0x1319,	%o5
	set	0x17A7,	%o6
	set	0x1EC7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	srax	%i2,	0x11,	%o2
	call	loop_318
	st	%f19,	[%l7 + 0x70]
	fbuge	%fcc2,	loop_319
	edge8	%i5,	%i4,	%o6
loop_318:
	edge16l	%g7,	%i7,	%l2
	fmovsle	%fcc2,	%f25,	%f19
loop_319:
	fmovso	%fcc0,	%f30,	%f21
	fmul8ulx16	%f22,	%f4,	%f12
	fnand	%f14,	%f18,	%f24

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fornot2s	%f17,	%f6,	%f28
	sdivcc	%l5,	0x1525,	%o1
	movne	%fcc1,	0x770,	%l1
	wr	%g5,	0x0D3E,	%sys_tick
	call	loop_320
	fabsd	%f18,	%f10
	call	loop_321
	call	loop_322
loop_320:
	call	loop_323
	nop
	fitos	%f25,	%f29
loop_321:
	sth	%g2,	[%l7 + 0x14]
loop_322:
	call	loop_324
loop_323:
	call	loop_325
	fsrc1	%f2,	%f28
	bcs,pt	%icc,	loop_326
loop_324:
	call	loop_327
loop_325:
	lduh	[%l7 + 0x3C],	%i3
	xnor	%o4,	0x0DBA,	%l4
loop_326:
	call	loop_328
loop_327:
	call	loop_329
	call	loop_330
	call	loop_331
loop_328:
	wr	%g4,	%o0,	%ccr
loop_329:
	call	loop_332
loop_330:
	fmovdcc	%icc,	%f18,	%f16
loop_331:
	call	loop_333
	fmovdneg	%xcc,	%f8,	%f10
loop_332:
	fmovrslz	%l3,	%f3,	%f13
	call	loop_334
loop_333:
	faligndata	%f0,	%f6,	%f8
	fnands	%f23,	%f13,	%f12
	set	0x20, %o0
	stha	%i0,	[%l7 + %o0] 0x2f
	membar	#Sync
loop_334:
	call	loop_335
	call	loop_336
	smul	%l6,	0x0593,	%i1
	smulcc	%g6,	0x0663,	%o3
loop_335:
	nop
	set	0x34, %i6
	lduw	[%l7 + %i6],	%l0
loop_336:
	tsubcc	%o5,	0x1441,	%i6
	edge16	%g3,	%i2,	%o2
	call	loop_337
	rdhpr	%hsys_tick_cmpr,	%i5
	fmovsneg	%xcc,	%f28,	%f30
	fbug	%fcc0,	loop_338
loop_337:
	fandnot2	%f26,	%f6,	%f10
	call	loop_339
	edge8	%i4,	%g1,	%o6
loop_338:
	call	loop_340
	call	loop_341
loop_339:
	call	loop_342
	nop
	setx	0xCBF20AA8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f15
loop_340:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x08] %asi,	%f1
loop_341:
	fbo,a	%fcc1,	loop_343
loop_342:
	fpadd16s	%f24,	%f26,	%f18
	fmovduge	%fcc3,	%f30,	%f28
	call	loop_344
loop_343:
	fmovsvc	%xcc,	%f14,	%f24
	mova	%fcc0,	%i7,	%l2
	fmovdu	%fcc3,	%f12,	%f30
loop_344:
	fpadd16	%f12,	%f14,	%f2
	tcc	%xcc,	0x2
	edge32ln	%g7,	%l5,	%o1
	call	loop_345
	call	loop_346
	call	loop_347
	mulscc	%o7,	0x1E3B,	%l1
loop_345:
	fmovdo	%fcc1,	%f10,	%f16
loop_346:
	fcmps	%fcc2,	%f16,	%f10
loop_347:
	rd	%y,	%g5
	fmovsul	%fcc1,	%f1,	%f17
	call	loop_348
	bcs,a	%icc,	loop_349
	call	loop_350
	brz	%g2,	loop_351
loop_348:
	mova	%fcc2,	%i3,	%l4
loop_349:
	xor	%o4,	%o0,	%g4
loop_350:
	call	loop_352
loop_351:
	fmovsneg	%icc,	%f0,	%f22
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%l6
loop_352:
	bg	%xcc,	loop_353
	subcc	%l3,	0x0195,	%i1
	fmovsu	%fcc3,	%f14,	%f9
	te	%icc,	0x7
loop_353:
	ld	[%l7 + 0x38],	%f9

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE14, 	%hsys_tick_cmpr
	wr 	%g0, 	0x6, 	%fprs
	fornot1s	%f0,	%f26,	%f13
	addcc	%i6,	%i2,	%o2
	subccc	%g3,	%i5,	%g1
	bvs	%xcc,	loop_354
	fmovdge	%fcc3,	%f22,	%f6
	fbu	%fcc1,	loop_355
	movn	%fcc1,	%o6,	%i7
loop_354:
	call	loop_356
	fmovsul	%fcc3,	%f18,	%f5
loop_355:
	fmovsvs	%xcc,	%f18,	%f1
	sub	%i4,	%l2,	%l5
loop_356:
	smul	%o1,	0x152B,	%o7
	movleu	%icc,	%l1,	%g7
	mulscc	%g2,	%g5,	%l4
	ldsb	[%l7 + 0x46],	%i3
	call	loop_357
	array32	%o0,	%o4,	%g4
	fmovdlg	%fcc0,	%f16,	%f0
	call	loop_358
loop_357:
	rdpr	%gl,	%i0
	wr	%l3,	0x1579,	%ccr
	fbo,a	%fcc3,	loop_359
loop_358:
	movl	%fcc1,	%i1,	%o3
	umulcc	%l0,	%o5,	%l6
	edge16l	%g6,	%i6,	%o2
loop_359:
	fmovsne	%fcc0,	%f4,	%f27
	fmovrdlez	%i2,	%f6,	%f14
	call	loop_360
	movcs	%icc,	%i5,	%g3
	call	loop_361
	call	loop_362
loop_360:
	mulscc	%g1,	%o6,	%i7
	rdhpr	%hintp,	%i4
loop_361:
	xnor	%l5,	0x042C,	%l2
loop_362:
	movrgz	%o1,	0x2E5,	%l1
	fmovrdlz	%g7,	%f28,	%f10
	fpadd16	%f0,	%f8,	%f0
	srl	%g2,	%g5,	%o7
	edge16ln	%i3,	%l4,	%o0
	fnands	%f13,	%f5,	%f13
	call	loop_363
	fzeros	%f31
	call	loop_364
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_363:
	call	loop_365
	faligndata	%f20,	%f28,	%f16
loop_364:
	call	loop_366
	fmovdvc	%icc,	%f24,	%f24
loop_365:
	call	loop_367
	call	loop_368
loop_366:
	andn	%o4,	0x0A93,	%g4
	tgu	%xcc,	0x3
loop_367:
	call	loop_369
loop_368:
	fmovrsgez	%i0,	%f14,	%f22
	edge8	%i1,	%l3,	%l0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o3
loop_369:
	movneg	%icc,	0x04C,	%l6
	call	loop_370
	nop
	fitos	%f7,	%f29
	fstox	%f29,	%f0
	fmovslg	%fcc1,	%f8,	%f9
	alignaddr	%o5,	%g6,	%i6
loop_370:
	call	loop_371
	wrpr	%i2,	0x1444,	%cwp
	fnot1s	%f31,	%f28
	fble	%fcc0,	loop_372
loop_371:
	mova	%icc,	%i5,	%g3
	fmovdcc	%xcc,	%f28,	%f24
	movul	%fcc3,	0x732,	%o2
loop_372:
	nop
	setx	0xABE468FBA84E6C80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCDFA802B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsmuld	%f14,	%f28,	%f6
	siam	0x7
	nop
	set	0x30, %g4
	stx	%o6,	[%l7 + %g4]
	subc	%i7,	0x153B,	%g1
	fmovdue	%fcc0,	%f14,	%f28
	sdivcc	%i4,	0x1DE4,	%l2
	fpsub16s	%f1,	%f6,	%f30
	fble	%fcc0,	loop_373
	rdhpr	%ver,	%l5
	call	loop_374
	call	loop_375
loop_373:
	tvs	%xcc,	0x4
	fmovsge	%xcc,	%f31,	%f21
loop_374:
	nop
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc0
loop_375:
	fmovde	%xcc,	%f10,	%f22
	call	loop_376
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fzeros	%f25
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x74] %asi,	%f3
loop_376:
	smulcc	%o1,	%g7,	%g2
	call	loop_377
	call	loop_378
	fpadd16s	%f25,	%f31,	%f4
	call	loop_379
loop_377:
	fmovsue	%fcc1,	%f20,	%f20
loop_378:
	brlz	%g5,	loop_380
	call	loop_381
loop_379:
	movpos	%icc,	%o7,	%l1
	fmovdne	%icc,	%f8,	%f6
loop_380:
	fmovdcs	%xcc,	%f6,	%f8
loop_381:
	rdhpr	%hpstate,	%i3
	mulx	%o0,	0x0B9F,	%l4
	call	loop_382
	fmovs	%f29,	%f22
	call	loop_383
	mulx	%o4,	%i0,	%i1
loop_382:
	movge	%fcc2,	%l3,	%g4
	fmovsug	%fcc0,	%f25,	%f8
loop_383:
	rd	%sys_tick_cmpr,	%o3
	call	loop_384
	fnot2s	%f2,	%f6
	xnorcc	%l6,	%o5,	%l0
	call	loop_385
loop_384:
	tg	%xcc,	0x0
	fmovsgu	%xcc,	%f14,	%f4
	call	loop_386
loop_385:
	movvc	%icc,	0x45D,	%i6
	rdpr	%cleanwin,	%g6
	call	loop_387
loop_386:
	xnorcc	%i5,	0x1D18,	%g3
	srax	%o2,	0x13,	%o6
	fpsub16s	%f19,	%f29,	%f16
loop_387:
	call	loop_388
	tleu	%icc,	0x0
	call	loop_389
	tsubcc	%i7,	0x1C30,	%g1
loop_388:
	nop
	setx	0xE50E2192,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f19
	call	loop_390
loop_389:
	rdpr	%otherwin,	%i4
	wr	%g0,	0xeb,	%asi
	stba	%l2,	[%l7 + 0x62] %asi
	membar	#Sync
loop_390:
	edge8n	%i2,	%l5,	%g7
	call	loop_391
	bge	%xcc,	loop_392
	call	loop_393
	fmovde	%fcc3,	%f0,	%f8
loop_391:
	call	loop_394
loop_392:
	call	loop_395
loop_393:
	call	loop_396
	udivx	%o1,	0x010F,	%g5
loop_394:
	tle	%icc,	0x1
loop_395:
	membar	0x64
loop_396:
	fmovrslez	%g2,	%f16,	%f0
	fbn,a	%fcc3,	loop_397
	fandnot1s	%f26,	%f14,	%f22
	rdpr	%cleanwin,	%o7
	fmovrdlz	%i3,	%f16,	%f22
loop_397:
	call	loop_398
	rd	%softint,	%o0
	fandnot2s	%f6,	%f26,	%f9
	fmovrsgz	%l1,	%f26,	%f1
loop_398:
	movgu	%xcc,	%o4,	%i0
	fmovrdgz	%i1,	%f28,	%f4
	ta	%xcc,	0x0
	call	loop_399
	fmovsuge	%fcc2,	%f20,	%f2
	call	loop_400
	fcmple32	%f30,	%f12,	%l4
loop_399:
	rd	%fprs,	%g4
	call	loop_401
loop_400:
	movvc	%icc,	%o3,	%l3
	movrgez	%o5,	%l6,	%i6
	movuge	%fcc0,	%g6,	%i5
loop_401:
	call	loop_402
	popc	%l0,	%g3
	call	loop_403
	movlg	%fcc1,	%o2,	%i7
loop_402:
	fmovdo	%fcc2,	%f0,	%f10
	smul	%g1,	0x0A4D,	%o6
loop_403:
	fexpand	%f26,	%f22
	call	loop_404
	movrlz	%i4,	%l2,	%l5
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f9
	fsrc2	%f8,	%f30
loop_404:
	fxnors	%f13,	%f30,	%f24
	nop
	setx	0xEBB4ACACC9EB0478,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x36644B9A3CA53E8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f14
	fnot1	%f6,	%f18
	call	loop_405
	nop
	set	0x40, %l3
	std	%g6,	[%l7 + %l3]
	fabss	%f11,	%f1
	fmovdlg	%fcc1,	%f10,	%f24
loop_405:
	movleu	%xcc,	%i2,	%o1
	umulcc	%g5,	0x00AB,	%g2
	nop
	set	0x50, %o7
	prefetch	[%l7 + %o7],	 1
	fpmerge	%f28,	%f12,	%f20
	fmovdge	%icc,	%f2,	%f22
	nop
	setx	0x3FB0CAF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x4633B5F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f9,	%f8
	wr	%o7,	0x13AD,	%set_softint
	fmovd	%f18,	%f14
	call	loop_406
	fpadd32	%f20,	%f20,	%f6
	tsubcc	%o0,	%i3,	%o4
	or	%i0,	%l1,	%i1
loop_406:
	call	loop_407
	fmovsn	%fcc1,	%f6,	%f20
	movrgez	%l4,	%o3,	%l3
	fmovrdlez	%o5,	%f12,	%f22
loop_407:
	nop
	setx	0x78C00805508BFBBC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xDF7C9687,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f26,	%f20
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x18
	movvs	%xcc,	0x280,	%l6
	call	loop_408
	bg,a	%icc,	loop_409
	mulscc	%g4,	0x1335,	%i6
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%i5
loop_408:
	call	loop_410
loop_409:
	tgu	%icc,	0x4
	rdhpr	%hpstate,	%g6
	call	loop_411
loop_410:
	nop
	setx	0x57E6C54A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f13
	fmovsneg	%icc,	%f9,	%f15
	fornot2	%f20,	%f0,	%f26
loop_411:
	call	loop_412
	xor	%g3,	%o2,	%l0
	andn	%i7,	%o6,	%g1
	call	loop_413
loop_412:
	fands	%f8,	%f2,	%f0
	pdist	%f2,	%f18,	%f26
	bcs	%xcc,	loop_414
loop_413:
	tcs	%icc,	0x7
	fmovsn	%icc,	%f3,	%f11
	fmovduge	%fcc1,	%f30,	%f6
loop_414:
	tsubcctv	%l2,	0x0F1F,	%l5
	call	loop_415
	brz	%i4,	loop_416
	fcmpgt32	%f2,	%f4,	%i2
	fandnot2	%f8,	%f8,	%f8
loop_415:
	rdpr	%tba,	%o1
loop_416:
	wrpr	%g7,	0x1BC9,	%tick
	ldsw	[%l7 + 0x08],	%g2
	call	loop_417
	call	loop_418
	movre	%g5,	%o0,	%o7
	call	loop_419
loop_417:
	mulx	%i3,	%i0,	%l1
loop_418:
	call	loop_420
	nop
	set	0x13, %l4
	ldub	[%l7 + %l4],	%i1
loop_419:
	movue	%fcc1,	0x64E,	%l4
	movrlez	%o4,	%o3,	%o5
loop_420:
	add	%l6,	%l3,	%i6
	fmovdcc	%xcc,	%f18,	%f0
	call	loop_421
	udivcc	%g4,	0x157E,	%g6
	call	loop_422
	rdhpr	%htba,	%g3
loop_421:
	fmovsul	%fcc1,	%f6,	%f24
	movg	%icc,	0x34E,	%o2
loop_422:
	fandnot1	%f30,	%f20,	%f8
	call	loop_423
	fblg,pt	%fcc3,	loop_424
	rdhpr	%hintp,	%i5
	tsubcc	%l0,	%i7,	%o6
loop_423:
	call	loop_425
loop_424:
	sllx	%l2,	0x00,	%g1
	fmovduge	%fcc0,	%f2,	%f20
	call	loop_426
loop_425:
	call	loop_427
	array16	%i4,	%i2,	%o1
	udivx	%l5,	0x1F07,	%g7
loop_426:
	rdpr	%tba,	%g5
loop_427:
	call	loop_428
	nop
	setx	0x0852,	%l0,	%o7
	udivcc	%o0,	%o7,	%i3
	movle	%xcc,	0x7A2,	%i0
	fbge	%fcc1,	loop_429
loop_428:
	fmovrsne	%g2,	%f11,	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89B, 	%hsys_tick_cmpr
	siam	0x7
loop_429:
	call	loop_430
	fbu,a	%fcc1,	loop_431
	movg	%fcc3,	%l4,	%l1
	movlg	%fcc3,	%o3,	%o4
loop_430:
	call	loop_432
loop_431:
	call	loop_433
	call	loop_434
	fmovsle	%icc,	%f18,	%f12
loop_432:
	pdist	%f4,	%f2,	%f2
loop_433:
	call	loop_435
loop_434:
	call	loop_436
	movgu	%xcc,	%o5,	%l3
	movg	%icc,	0x0B2,	%i6
loop_435:
	fmovrdgez	%g4,	%f6,	%f20
loop_436:
	fmovdneg	%xcc,	%f16,	%f6
	fmovrde	%g6,	%f6,	%f2
	rdhpr	%hsys_tick_cmpr,	%g3
	membar	0x5D
	call	loop_437
	nop
	setx	0xD808DB668D2E00C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xDE4B1D3D02C002DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f30,	%f20
	call	loop_438
	call	loop_439
loop_437:
	array32	%l6,	%o2,	%i5
	alignaddrl	%l0,	%o6,	%i7
loop_438:
	tge	%xcc,	0x1
loop_439:
	taddcctv	%g1,	0x092F,	%l2
	nop
	fitos	%f12,	%f8
	fstox	%f8,	%f16
	fbug	%fcc2,	loop_440
	call	loop_441
	fpadd32s	%f22,	%f7,	%f14
	bn,a	%icc,	loop_442
loop_440:
	mulx	%i4,	0x08FC,	%i2
loop_441:
	popc	0x1B6C,	%l5
	sir	0x0371
loop_442:
	edge8ln	%g7,	%g5,	%o1
	call	loop_443
	fmovsvc	%icc,	%f6,	%f5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x664, 	%sys_tick_cmpr
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o7
loop_443:
	fornot2s	%f31,	%f0,	%f26
	wr	%g2,	0x0A23,	%ccr
	call	loop_444
	call	loop_445
	xorcc	%i1,	%l4,	%l1
	call	loop_446
loop_444:
	taddcctv	%o3,	0x1EA6,	%o4
loop_445:
	call	loop_447
	fmul8sux16	%f24,	%f28,	%f26
loop_446:
	call	loop_448
	call	loop_449
loop_447:
	call	loop_450
	edge16	%o5,	%l3,	%i6
loop_448:
	taddcctv	%i0,	0x1900,	%g6
loop_449:
	xorcc	%g4,	0x08C0,	%g3
loop_450:
	sll	%o2,	0x11,	%i5
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f14
	fxtod	%f14,	%f24
	mulx	%l6,	%l0,	%i7
	array16	%o6,	%g1,	%i4
	fandnot2s	%f19,	%f27,	%f13
	tsubcc	%l2,	0x0D82,	%i2
	fmovdvc	%xcc,	%f2,	%f8
	call	loop_451
	call	loop_452
	call	loop_453
	subccc	%g7,	%l5,	%g5
loop_451:
	call	loop_454
loop_452:
	fpsub32s	%f24,	%f8,	%f27
loop_453:
	fbul,pt	%fcc0,	loop_455
	nop
	set	0x3C, %o1
	ldub	[%l7 + %o1],	%o0
loop_454:
	tneg	%icc,	0x4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_455:
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f12
	edge16ln	%i3,	%g2,	%i1
	fmovrslz	%l4,	%f31,	%f16
	tne	%icc,	0x7
	nop
	fitos	%f2,	%f8
	fstox	%f8,	%f14
	fpadd16	%f30,	%f0,	%f12
	mulscc	%o7,	%l1,	%o4
	fmul8x16al	%f5,	%f25,	%f26
	edge16ln	%o5,	%l3,	%o3
	bcs,a,pn	%xcc,	loop_456
	call	loop_457
	movule	%fcc3,	%i0,	%g6
	nop
	setx	0xF9906BCC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x967F327C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f5,	%f24
loop_456:
	fmovsa	%xcc,	%f30,	%f18
loop_457:
	call	loop_458
	fmovsa	%fcc1,	%f12,	%f20
	movuge	%fcc3,	%i6,	%g3
	fxors	%f26,	%f30,	%f5
loop_458:
	fmovsuge	%fcc3,	%f6,	%f18
	call	loop_459
	call	loop_460
	sllx	%g4,	%o2,	%l6
	nop
	fitos	%f13,	%f28
	fstoi	%f28,	%f8
loop_459:
	call	loop_461
loop_460:
	taddcc	%l0,	%i7,	%i5
	call	loop_462
	nop
	set	0x5C, %o5
	swap	[%l7 + %o5],	%o6
loop_461:
	call	loop_463
	call	loop_464
loop_462:
	call	loop_465
	call	loop_466
loop_463:
	srax	%i4,	0x0F,	%l2
loop_464:
	wrpr	%i2,	0x1B23,	%pil
loop_465:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_466:
	fmovsn	%fcc3,	%f24,	%f25
	call	loop_467
	call	loop_468
	fcmpeq16	%f10,	%f16,	%g7
	call	loop_469
loop_467:
	call	loop_470
loop_468:
	call	loop_471
	call	loop_472
loop_469:
	orn	%g5,	%o0,	%o1
loop_470:
	call	loop_473
loop_471:
	move	%icc,	0x14D,	%i3
loop_472:
	nop
	setx loop_474, %l0, %l1
	jmpl %l1, %l5
	fands	%f20,	%f29,	%f19
loop_473:
	sir	0x107F
	call	loop_475
loop_474:
	wr	%i1,	%g2,	%ccr
	fmovduge	%fcc0,	%f4,	%f26
	sra	%l4,	%l1,	%o7
loop_475:
	rd	%fprs,	%o4
	call	loop_476
	nop
	setx	0x174D,	%l0,	%o3
	sdiv	%l3,	%o3,	%o5
	call	loop_477
	edge32	%g6,	%i6,	%g3
loop_476:
	std	%f12,	[%l7 + 0x78]
	call	loop_478
loop_477:
	alignaddrl	%g4,	%o2,	%l6
	sdivx	%i0,	0x05EF,	%i7
loop_478:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 24
!	Type a   	: 35
!	Type x   	: 9
!	Type cti   	: 161
!	Type f   	: 132
!	Type i   	: 139
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
	set	0x9,	%g1
	set	0x4,	%g2
	set	0x3,	%g3
	set	0xD,	%g4
	set	0xC,	%g5
	set	0x2,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x8,	%i1
	set	-0x1,	%i2
	set	-0xB,	%i3
	set	-0x0,	%i4
	set	-0x9,	%i5
	set	-0xC,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x2BA72C02,	%l0
	set	0x119A7693,	%l1
	set	0x1EC7209D,	%l2
	set	0x310CB715,	%l3
	set	0x7BEEE3DC,	%l4
	set	0x022C9F86,	%l5
	set	0x746CC92B,	%l6
	!# Output registers
	set	-0x1CC3,	%o0
	set	-0x1F4A,	%o1
	set	0x162A,	%o2
	set	-0x1ECF,	%o3
	set	-0x060F,	%o4
	set	0x182B,	%o5
	set	0x1A6D,	%o6
	set	0x0C34,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	membar	0x1A
	fcmpd	%fcc3,	%f24,	%f24
	rdpr	%canrestore,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBCC, 	%hsys_tick_cmpr
	xnor	%o6,	0x14CB,	%i4
	add	%l2,	%g1,	%i2
	call	loop_479
	fmovdu	%fcc2,	%f8,	%f26
	srlx	%g7,	0x1B,	%g5
	call	loop_480
loop_479:
	smul	%o0,	0x1832,	%i3
	fnor	%f12,	%f6,	%f20
	movleu	%xcc,	0x3A8,	%o1
loop_480:
	rd	%asi,	%l5
	andncc	%g2,	%l4,	%l1
	fmovspos	%icc,	%f5,	%f4
	smulcc	%o7,	%o4,	%l3
	call	loop_481
	subccc	%o3,	0x06F8,	%o5
	set	0x33, %i3
	lduba	[%l7 + %i3] 0x18,	%g6
loop_481:
	movcc	%xcc,	%i1,	%i6
	fmovdg	%fcc0,	%f2,	%f26
	or	%g4,	%o2,	%g3
	fmovsne	%fcc3,	%f14,	%f15
	alignaddrl	%i0,	%l6,	%i5
	fpsub16s	%f16,	%f12,	%f25
	call	loop_482
	nop
	setx	0xF9A38E1D4756E9D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x72DBADDD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f18,	%f18
	call	loop_483
	bvc,a,pn	%xcc,	loop_484
loop_482:
	rd	%ccr,	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_483:
	alignaddr	%l2,	%g1,	%i2
loop_484:
	fmovrdgez	%g7,	%f18,	%f0
	siam	0x1
	fmovrslz	%g5,	%f0,	%f24
	movrne	%o6,	0x259,	%i3
	fmovdo	%fcc2,	%f30,	%f30
	call	loop_485
	call	loop_486
	tge	%icc,	0x7
	movule	%fcc0,	0x211,	%o1
loop_485:
	tcc	%icc,	0x6
loop_486:
	fsrc2s	%f3,	%f13
	fmovdug	%fcc3,	%f28,	%f24
	edge32ln	%l5,	%o0,	%g2
	nop
	fitos	%f3,	%f29
	fstod	%f29,	%f18
	flushw
	wrpr 	%g0, 	0x0, 	%gl
	sdivcc	%o7,	0x174F,	%l1
	smulcc	%l3,	%o4,	%o5
	call	loop_487
	andncc	%o3,	%i1,	%g6
	fmovsvc	%xcc,	%f0,	%f22
	fors	%f12,	%f0,	%f14
loop_487:
	call	loop_488
	call	loop_489
	fmovs	%f31,	%f30
	tvs	%xcc,	0x6
loop_488:
	call	loop_490
loop_489:
	movle	%icc,	%g4,	%o2
	fone	%f10
	call	loop_491
loop_490:
	pdist	%f10,	%f6,	%f4
	bleu,pn	%xcc,	loop_492
	call	loop_493
loop_491:
	edge8l	%i6,	%g3,	%l6
	tpos	%xcc,	0x5
loop_492:
	srlx	%i0,	%i7,	%i5
loop_493:
	addccc	%i4,	%l0,	%g1
	rdpr	%cleanwin,	%l2
	fbn,pn	%fcc0,	loop_494
	fpsub16	%f14,	%f28,	%f4
	movuge	%fcc0,	0x0FF,	%i2
	rdhpr	%hintp,	%g7
loop_494:
	call	loop_495
	call	loop_496
	fsrc1s	%f20,	%f20
	bmask	%g5,	%o6,	%o1
loop_495:
	fornot1	%f16,	%f18,	%f14
loop_496:
	edge8	%l5,	%i3,	%g2
	call	loop_497
	andn	%o0,	0x00EA,	%o7
	bmask	%l4,	%l3,	%o4
	fmul8sux16	%f14,	%f22,	%f16
loop_497:
	movu	%fcc2,	%o5,	%o3
	nop
	setx	0xD475F22F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f22
	call	loop_498
	call	loop_499
	orn	%i1,	%l1,	%g6
	call	loop_500
loop_498:
	edge16ln	%g4,	%o2,	%g3
loop_499:
	fmovdvs	%icc,	%f16,	%f18
	call	loop_501
loop_500:
	xorcc	%l6,	%i0,	%i6
	nop
	setx	0xF168ACF472D3C75B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x929C811213839986,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f6
	nop
	setx	0x1358,	%l0,	%i5
	udiv	%i7,	%i5,	%i4
loop_501:
	call	loop_502
	fmovsu	%fcc2,	%f10,	%f23
	xnor	%l0,	%g1,	%i2
	fcmple16	%f0,	%f28,	%l2
loop_502:
	call	loop_503
	sllx	%g5,	0x12,	%o6
	fnand	%f12,	%f20,	%f22
	movl	%icc,	%o1,	%l5
loop_503:
	fcmps	%fcc0,	%f6,	%f26
	bshuffle	%f24,	%f28,	%f2
	mulscc	%g7,	0x06A0,	%g2
	stb	%i3,	[%l7 + 0x17]
	add	%o0,	%l4,	%o7
	fmovrdlz	%o4,	%f30,	%f0
	call	loop_504
	fpsub16s	%f26,	%f31,	%f9
	fmovdge	%icc,	%f12,	%f20
	call	loop_505
loop_504:
	fzeros	%f23
	srlx	%l3,	%o3,	%i1
	subc	%o5,	0x0B6B,	%l1
loop_505:
	fmuld8ulx16	%f16,	%f31,	%f2
	st	%f15,	[%l7 + 0x40]
	sub	%g4,	0x11F9,	%g6
	nop
	fitos	%f0,	%f28
	fstoi	%f28,	%f2
	fmovrdne	%o2,	%f2,	%f12
	tcs	%xcc,	0x1
	call	loop_506
	rdhpr	%hpstate,	%g3
	call	loop_507
	fmovrsne	%l6,	%f30,	%f1
loop_506:
	fbule	%fcc1,	loop_508
	fmovso	%fcc0,	%f9,	%f23
loop_507:
	movrlz	%i6,	0x1AF,	%i7
	wr	%g0,	0x27,	%asi
	stwa	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
loop_508:
	call	loop_509
	nop
	setx	0xC53CCB7760A18167,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f28
	call	loop_510
	call	loop_511
loop_509:
	call	loop_512
	call	loop_513
loop_510:
	call	loop_514
loop_511:
	call	loop_515
loop_512:
	sdivcc	%i5,	0x13CC,	%i4
loop_513:
	call	loop_516
loop_514:
	nop
	set	0x12, %l6
	ldub	[%l7 + %l6],	%g1
loop_515:
	call	loop_517
	rdhpr	%htba,	%l0
loop_516:
	wrpr	%l2,	0x10D5,	%tick
	fmovdvc	%xcc,	%f22,	%f16
loop_517:
	mulscc	%i2,	%o6,	%g5
	sethi	0x165E,	%l5
	nop
	setx	0x09CD,	%l0,	%g2
	sdivcc	%g7,	%g2,	%o1
	call	loop_518
	edge32l	%i3,	%l4,	%o7
	movpos	%icc,	0x3EF,	%o4
	call	loop_519
loop_518:
	fmovs	%f13,	%f4
	call	loop_520
	fmovsne	%fcc0,	%f5,	%f15
loop_519:
	fornot2	%f4,	%f30,	%f24
	fbuge	%fcc2,	loop_521
loop_520:
	call	loop_522
	fmovsgu	%icc,	%f3,	%f24
	fcmpne16	%f18,	%f22,	%o0
loop_521:
	andn	%o3,	%l3,	%i1
loop_522:
	xorcc	%l1,	%o5,	%g4
	brgz	%o2,	loop_523
	pdist	%f2,	%f14,	%f24
	fmovdvc	%icc,	%f22,	%f2
	fbe	%fcc1,	loop_524
loop_523:
	call	loop_525
	for	%f24,	%f24,	%f0
	call	loop_526
loop_524:
	call	loop_527
loop_525:
	call	loop_528
	movrlez	%g6,	0x37D,	%l6
loop_526:
	call	loop_529
loop_527:
	nop
	setx	0x98A8657340FC92BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1EC82A5FAF4DD678,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f22,	%f20
loop_528:
	nop
	set	0x3C, %i0
	lduh	[%l7 + %i0],	%g3
	fmovd	%f22,	%f16
loop_529:
	fcmpne16	%f30,	%f22,	%i7
	tne	%icc,	0x1
	nop
	set	0x11, %o6
	stb	%i0,	[%l7 + %o6]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmul8x16au	%f28,	%f18,	%f30
	sra	%i4,	0x08,	%i6
	rdhpr	%hintp,	%l0
	ldd	[%l7 + 0x10],	%l2
	fmovduge	%fcc3,	%f16,	%f2
	fnegs	%f5,	%f29
	fmul8sux16	%f10,	%f24,	%f12
	fmovdn	%xcc,	%f26,	%f24
	tn	%xcc,	0x4
	tne	%xcc,	0x6
	call	loop_530
	edge32l	%i2,	%o6,	%g1
	ldsb	[%l7 + 0x11],	%g5
	umulcc	%g7,	0x0AA0,	%g2
loop_530:
	srax	%o1,	%i3,	%l5
	fors	%f11,	%f9,	%f30
	call	loop_531
	movre	%o7,	0x202,	%l4
	mulx	%o0,	0x111E,	%o3
	fone	%f30
loop_531:
	fmul8x16	%f25,	%f24,	%f4
	fnot2s	%f27,	%f16
	sir	0x1CB7
	movue	%fcc1,	%l3,	%i1
	fmovsge	%fcc2,	%f11,	%f27
	call	loop_532
	fornot2s	%f19,	%f28,	%f14
	fmovdo	%fcc1,	%f24,	%f28
	edge16	%o4,	%o5,	%g4
loop_532:
	brz,a,pt	%o2,	loop_533
	fxors	%f4,	%f17,	%f16
	fnot2	%f18,	%f0
	fsrc1	%f14,	%f6
loop_533:
	call	loop_534
	call	loop_535
	call	loop_536
	fmovdle	%fcc2,	%f22,	%f30
loop_534:
	fmovsg	%xcc,	%f28,	%f17
loop_535:
	fornot2	%f12,	%f24,	%f26
loop_536:
	subc	%g6,	0x1084,	%l6
	fandnot2s	%f16,	%f16,	%f26
	call	loop_537
	membar	0x4E
	call	loop_538
	movgu	%xcc,	%g3,	%l1
loop_537:
	tcc	%icc,	0x4
	fmovrdlez	%i0,	%f6,	%f6
loop_538:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x2C] %asi,	%f20
	call	loop_539
	movo	%fcc3,	0x1DB,	%i7
	fmovscs	%icc,	%f29,	%f0
	movgu	%icc,	%i5,	%i6
loop_539:
	call	loop_540
	nop
	setx	0xA4C2ACA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f21
	fpack32	%f26,	%f20,	%f22
	edge32ln	%l0,	%i4,	%l2
loop_540:
	ldub	[%l7 + 0x0E],	%o6
	fcmped	%fcc0,	%f24,	%f20
	call	loop_541
	rdhpr	%htba,	%g1
	fmovdvc	%icc,	%f12,	%f6
	fmul8x16	%f29,	%f30,	%f22
loop_541:
	addcc	%i2,	0x0BC6,	%g5
	std	%f26,	[%l7 + 0x38]
	fnor	%f8,	%f10,	%f6
	call	loop_542
	rd	%fprs,	%g2
	call	loop_543
	fmovdn	%fcc1,	%f12,	%f18
loop_542:
	smul	%g7,	%o1,	%l5
	nop
	setx	0x2B1B844FFD6CD927,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x60C18E5E7D3C51CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f6,	%f14
loop_543:
	call	loop_544
	wrpr	%o7,	0x177C,	%pil
	nop
	setx	0x3A5717D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x699F0A98,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f4,	%f24
	call	loop_545
loop_544:
	orcc	%l4,	%i3,	%o0
	fornot1	%f10,	%f18,	%f10
	fmovdvc	%xcc,	%f10,	%f22
loop_545:
	movuge	%fcc3,	0x1D1,	%o3
	ld	[%l7 + 0x28],	%f19
	fpmerge	%f7,	%f4,	%f0
	srlx	%l3,	%i1,	%o5
	fmovdu	%fcc1,	%f24,	%f22
	call	loop_546
	fornot2s	%f31,	%f11,	%f27
	call	loop_547
	call	loop_548
loop_546:
	umul	%g4,	0x1E56,	%o4
	udiv	%g6,	0x0C37,	%l6
loop_547:
	fmovscs	%icc,	%f31,	%f5
loop_548:
	nop
	set	0x36, %i1
	ldsh	[%l7 + %i1],	%g3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x11] %asi,	%l1
	fxor	%f30,	%f8,	%f4
	mulx	%i0,	%o2,	%i5
	call	loop_549
	fmovdgu	%icc,	%f4,	%f26
	lduh	[%l7 + 0x52],	%i7
	call	loop_550
loop_549:
	taddcctv	%l0,	0x0209,	%i4
	movo	%fcc0,	%l2,	%o6
	movpos	%icc,	%i6,	%i2
loop_550:
	movrlez	%g1,	%g2,	%g5
	call	loop_551
	fmovsue	%fcc1,	%f7,	%f9
	call	loop_552
	movgu	%icc,	%g7,	%l5
loop_551:
	call	loop_553
	edge32ln	%o7,	%o1,	%l4
loop_552:
	movleu	%icc,	%o0,	%o3
	call	loop_554
loop_553:
	udivx	%l3,	0x1C33,	%i1
	call	loop_555
	nop
	setx	0x75343D7440E08DBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x6BA9AE64376F6B7A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f14,	%f20
loop_554:
	fornot2s	%f19,	%f9,	%f17
	srlx	%o5,	0x1D,	%i3
loop_555:
	edge16l	%o4,	%g6,	%l6
	brlz,pt	%g3,	loop_556
	call	loop_557
	fmovsul	%fcc1,	%f29,	%f16
	tvc	%icc,	0x7
loop_556:
	call	loop_558
loop_557:
	alignaddrl	%l1,	%g4,	%i0
	movne	%fcc2,	%i5,	%i7
	bcc,a	%icc,	loop_559
loop_558:
	call	loop_560
	nop
	fitod	%f18,	%f8
	fbu,pt	%fcc0,	loop_561
loop_559:
	fmovdu	%fcc3,	%f6,	%f6
loop_560:
	fmovscs	%icc,	%f17,	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7E8, 	%hsys_tick_cmpr
loop_561:
	call	loop_562
	nop
	fitod	%f0,	%f12
	fdtoi	%f12,	%f29
	call	loop_563
	sethi	0x1DC5,	%l2
loop_562:
	tn	%xcc,	0x3
	rdpr	%wstate,	%o6
loop_563:
	tcs	%xcc,	0x7
	fcmpeq32	%f14,	%f8,	%i6
	call	loop_564
	rdhpr	%hpstate,	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%g2
loop_564:
	fmovd	%f2,	%f30
	rdhpr	%ver,	%g5
	call	loop_565
	movcs	%xcc,	%g1,	%g7
	fmovdul	%fcc0,	%f26,	%f24
	call	loop_566
loop_565:
	fands	%f18,	%f13,	%f24
	movlg	%fcc3,	0x162,	%l5
	fmovdu	%fcc3,	%f20,	%f2
loop_566:
	tn	%icc,	0x2
	call	loop_567
	fmul8x16al	%f5,	%f6,	%f2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x11,	%o1,	%o7
loop_567:
	fmovsle	%xcc,	%f22,	%f17
	fsrc2s	%f0,	%f7
	call	loop_568
	ldsb	[%l7 + 0x25],	%l4
	siam	0x2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o0
loop_568:
	srax	%l3,	%o3,	%o5
	srax	%i1,	%i3,	%g6
	mova	%fcc0,	%l6,	%g3
	fmovrse	%l1,	%f15,	%f4
	fbug,pt	%fcc3,	loop_569
	sub	%o4,	0x0540,	%g4
	fcmpne16	%f6,	%f22,	%i0
	movrgez	%i7,	0x0B6,	%l0
loop_569:
	nop
	set	0x35, %i4
	stb	%i4,	[%l7 + %i4]
	movleu	%icc,	%l2,	%i5
	addccc	%o6,	%i6,	%i2
	bgu,a	%icc,	loop_570
	nop
	setx	0x47FAB460,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x423CA5B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f17,	%f13
	movpos	%xcc,	0x3CF,	%o2
	movpos	%icc,	%g5,	%g1
loop_570:
	call	loop_571
	call	loop_572
	udivx	%g7,	0x029B,	%l5
	brlz,a,pt	%o1,	loop_573
loop_571:
	wr	%o7,	%l4,	%ccr
loop_572:
	call	loop_574
	call	loop_575
loop_573:
	fmovrdgez	%g2,	%f6,	%f26
	stbar
loop_574:
	fcmple32	%f10,	%f0,	%o0
loop_575:
	call	loop_576
	call	loop_577
	edge32ln	%o3,	%o5,	%l3
	std	%i2,	[%l7 + 0x70]
loop_576:
	movvc	%icc,	0x038,	%g6
loop_577:
	fbge,pn	%fcc3,	loop_578
	call	loop_579
	fmovsue	%fcc3,	%f22,	%f15
	bn,a,pn	%icc,	loop_580
loop_578:
	flushw
loop_579:
	edge8n	%l6,	%g3,	%i1
	edge16l	%o4,	%l1,	%i0
loop_580:
	fmovsg	%fcc1,	%f30,	%f0
	fmovdlg	%fcc1,	%f2,	%f12
	call	loop_581
	be	%icc,	loop_582
	alignaddr	%g4,	%i7,	%l0
	call	loop_583
loop_581:
	call	loop_584
loop_582:
	mulscc	%l2,	0x00C6,	%i5
	call	loop_585
loop_583:
	nop
	set	0x60, %l1
	std	%i4,	[%l7 + %l1]
loop_584:
	call	loop_586
	call	loop_587
loop_585:
	call	loop_588
	umulcc	%o6,	%i6,	%i2
loop_586:
	fmovrsgz	%o2,	%f26,	%f11
loop_587:
	fmovda	%fcc0,	%f24,	%f8
loop_588:
	fpack16	%f18,	%f18
	fmovsu	%fcc1,	%f15,	%f31
	call	loop_589
	mulx	%g5,	%g1,	%g7
	call	loop_590
	fmovrse	%l5,	%f22,	%f31
loop_589:
	call	loop_591
	ldd	[%l7 + 0x58],	%f2
loop_590:
	ble	%xcc,	loop_592
	rd	%y,	%o1
loop_591:
	rdhpr	%htba,	%l4
	call	loop_593
loop_592:
	xorcc	%o7,	0x160C,	%o0
	nop
	set	0x28, %o4
	flush	%l7 + %o4
	tn	%icc,	0x3
loop_593:
	nop
	setx	0x7C3CD139958559C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x429B9354,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsmuld	%f20,	%f22,	%f6
	fpack16	%f6,	%f0
	fmovsuge	%fcc0,	%f7,	%f5
	edge8n	%o3,	%o5,	%g2
	call	loop_594
	call	loop_595
	call	loop_596
	fmovs	%f10,	%f24
loop_594:
	nop
	fitod	%f4,	%f16
	fdtos	%f16,	%f28
loop_595:
	fmovdle	%fcc1,	%f10,	%f12
loop_596:
	faligndata	%f18,	%f18,	%f8
	call	loop_597
	call	loop_598
	nop
	setx	0x17EE,	%l0,	%l3
	sdiv	%i3,	%l3,	%l6
	nop
	setx	loop_599,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022400001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_597:
	xnorcc	%g3,	%i1,	%o4
loop_598:
	subccc	%g6,	%i0,	%g4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_599:
	flushw
	udiv	%i7,	0x15D6,	%l0
	te	%xcc,	0x5
	fmovdo	%fcc3,	%f2,	%f2
	movpos	%icc,	0x7EE,	%l1
	tpos	%icc,	0x7
	fxor	%f22,	%f2,	%f30
	fmovsvs	%icc,	%f25,	%f8
	wr	%g0,	0x2f,	%asi
	stda	%l2,	[%l7 + 0x10] %asi
	membar	#Sync
	fnot2s	%f21,	%f15
	bleu,pt	%xcc,	loop_600
	call	loop_601
	ba,a	%xcc,	loop_602
	fmovrdne	%i5,	%f18,	%f20
loop_600:
	edge16	%o6,	%i4,	%i2
loop_601:
	call	loop_603
loop_602:
	call	loop_604
	edge16n	%o2,	%g5,	%i6
	ba,pt	%xcc,	loop_605
loop_603:
	call	loop_606
loop_604:
	call	loop_607
	call	loop_608
loop_605:
	call	loop_609
loop_606:
	brgz,a	%g7,	loop_610
loop_607:
	fbul	%fcc0,	loop_611
loop_608:
	andn	%l5,	%o1,	%l4
loop_609:
	fabss	%f20,	%f22
loop_610:
	fzeros	%f26
loop_611:
	nop
	fitos	%f11,	%f22
	fstod	%f22,	%f4
	movcs	%xcc,	%g1,	%o7
	fcmps	%fcc3,	%f11,	%f18
	fmul8x16au	%f17,	%f7,	%f26
	movue	%fcc1,	%o3,	%o0
	tneg	%xcc,	0x2
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%g2
	call	loop_612
	call	loop_613
	fand	%f4,	%f22,	%f2
	fmovsuge	%fcc3,	%f11,	%f1
loop_612:
	fnors	%f28,	%f12,	%f0
loop_613:
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f8
	fxor	%f12,	%f6,	%f30
	call	loop_614
	movvs	%icc,	0x27C,	%o5
	call	loop_615
	srl	%l3,	%i3,	%g3
loop_614:
	fnor	%f12,	%f16,	%f10
	call	loop_616
loop_615:
	tleu	%xcc,	0x1
	movl	%fcc1,	0x46B,	%i1
	wrpr	%o4,	0x0BC8,	%tick
loop_616:
	edge8ln	%l6,	%g6,	%i0
	edge16n	%g4,	%l0,	%i7
	sll	%l2,	%l1,	%i5
	be,a	%icc,	loop_617
	sub	%i4,	0x1719,	%i2
	call	loop_618
	umul	%o6,	%o2,	%g5
loop_617:
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f20
	fxtos	%f20,	%f11
	smulcc	%g7,	%l5,	%o1
loop_618:
	rd	%y,	%i6
	popc	%g1,	%l4
	fmovrdne	%o7,	%f24,	%f28
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 29
!	Type a   	: 25
!	Type x   	: 9
!	Type cti   	: 140
!	Type f   	: 147
!	Type i   	: 150
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
	set	0xB,	%g1
	set	0xC,	%g2
	set	0x7,	%g3
	set	0x1,	%g4
	set	0x5,	%g5
	set	0x5,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xE,	%i1
	set	-0xC,	%i2
	set	-0x6,	%i3
	set	-0xB,	%i4
	set	-0x0,	%i5
	set	-0x7,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x1C60646E,	%l0
	set	0x6609F283,	%l1
	set	0x0B665CFC,	%l2
	set	0x07A99CFC,	%l3
	set	0x08FFB110,	%l4
	set	0x2C3627B3,	%l5
	set	0x09340A93,	%l6
	!# Output registers
	set	0x13B0,	%o0
	set	0x1A0A,	%o1
	set	0x075A,	%o2
	set	-0x08C4,	%o3
	set	-0x1016,	%o4
	set	0x1868,	%o5
	set	0x0BD4,	%o6
	set	0x1A5C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o0,	%o3
	brlz,pn	%o5,	loop_619
	fbug	%fcc2,	loop_620
	nop
	setx	0xA4E1CCFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x443A77D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f6,	%f0
	call	loop_621
loop_619:
	call	loop_622
loop_620:
	call	loop_623
	rdpr	%canrestore,	%l3
loop_621:
	pdist	%f2,	%f2,	%f28
loop_622:
	call	loop_624
loop_623:
	call	loop_625
	fmovsu	%fcc0,	%f11,	%f22
	fandnot1s	%f31,	%f1,	%f14
loop_624:
	edge32ln	%g2,	%i3,	%i1
loop_625:
	addc	%o4,	0x188D,	%g3
	call	loop_626
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movre	%g6,	0x073,	%l6
	ba,a	%xcc,	loop_627
loop_626:
	fzeros	%f8
	edge16n	%i0,	%l0,	%i7
	bmask	%l2,	%g4,	%l1
loop_627:
	fmovrde	%i5,	%f22,	%f28
	membar	0x76
	call	loop_628
	call	loop_629
	fmovdg	%xcc,	%f16,	%f24
	set	0x34, %g6
	lda	[%l7 + %g6] 0x18,	%f11
loop_628:
	call	loop_630
loop_629:
	call	loop_631
	fpadd16s	%f30,	%f4,	%f13
	fmovsne	%xcc,	%f25,	%f8
loop_630:
	fmovdule	%fcc2,	%f20,	%f20
loop_631:
	nop
	fitos	%f4,	%f16
	tge	%xcc,	0x6
	call	loop_632
	fmovdcc	%xcc,	%f26,	%f12
	nop
	setx loop_633, %l0, %l1
	jmpl %l1, %i2
	nop
	setx	0xDB91DDF3D8D72610,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x3DD7A70C492AB39D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f4,	%f6
loop_632:
	call	loop_634
	nop
	setx	0x24B1DFF1380F6348,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF84E119F208AAA5A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f12,	%f26
loop_633:
	tne	%icc,	0x1
	nop
	fitod	%f12,	%f20
	fdtox	%f20,	%f20
loop_634:
	rd	%softint,	%i4
	movre	%o6,	%g5,	%o2
	bl,a	%xcc,	loop_635
	bvs	%icc,	loop_636
	call	loop_637
	fpsub32s	%f9,	%f26,	%f2
loop_635:
	call	loop_638
loop_636:
	fmovrse	%l5,	%f0,	%f8
loop_637:
	rdhpr	%htba,	%o1
	fmovrse	%g7,	%f7,	%f5
loop_638:
	call	loop_639
	call	loop_640
	srlx	%i6,	%l4,	%o7
	fornot1	%f28,	%f24,	%f2
loop_639:
	nop
	set	0x18, %i2
	stw	%g1,	[%l7 + %i2]
loop_640:
	nop
	set	0x26, %g1
	ldsh	[%l7 + %g1],	%o0
	call	loop_641
	umulcc	%o3,	0x099C,	%o5
	wr	%l3,	0x0CBE,	%sys_tick
	call	loop_642
loop_641:
	wr	%i3,	%g2,	%y
	bcc,a,pn	%icc,	loop_643
	fmovdge	%fcc3,	%f10,	%f26
loop_642:
	sth	%i1,	[%l7 + 0x46]
	fzeros	%f13
loop_643:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7EE, 	%hsys_tick_cmpr
	tsubcc	%g6,	%l6,	%o4
	call	loop_644
	fcmpne32	%f12,	%f8,	%i0
	tcs	%xcc,	0x4
	fbl,a,pt	%fcc2,	loop_645
loop_644:
	rd	%asi,	%l0
	movge	%fcc1,	%i7,	%l2
	fmovdo	%fcc0,	%f18,	%f14
loop_645:
	fmovdneg	%icc,	%f4,	%f10
	fcmpgt32	%f4,	%f8,	%g4
	movleu	%xcc,	0x0D2,	%i5
	bne	%icc,	loop_646
	call	loop_647
	fpackfix	%f28,	%f23
	call	loop_648
loop_646:
	fpsub32s	%f14,	%f23,	%f21
loop_647:
	call	loop_649
	udiv	%i2,	0x0180,	%i4
loop_648:
	sdivcc	%l1,	0x0C50,	%g5
	call	loop_650
loop_649:
	fsrc2s	%f0,	%f17
	fzeros	%f25
	nop
	setx loop_651, %l0, %l1
	jmpl %l1, %o2
loop_650:
	tge	%icc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovda	%fcc2,	%f18,	%f12
loop_651:
	andncc	%g7,	0x0B70,	%o6
	call	loop_652
	srl	%l4,	%o7,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_653
loop_652:
	ldub	[%l7 + 0x4E],	%o3
	fmovsneg	%xcc,	%f27,	%f17
	taddcctv	%o5,	0x16B9,	%l3
loop_653:
	movrgez	%i3,	0x3F8,	%g2
	fpackfix	%f0,	%f3
	taddcctv	%g1,	%g3,	%i1
	fmovsg	%fcc2,	%f15,	%f28
	move	%fcc3,	%l6,	%g6
	nop
	setx	0x10A7,	%l1,	%l0
	udivcc	%i0,	%l0,	%i7
	fsrc1	%f26,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_654
	call	loop_655
	fsrc1	%f6,	%f20
	fnands	%f10,	%f8,	%f10
loop_654:
	fmovdne	%icc,	%f18,	%f2
loop_655:
	for	%f0,	%f0,	%f8
	call	loop_656
	call	loop_657
	rd	%ccr,	%o4
	call	loop_658
loop_656:
	call	loop_659
loop_657:
	movule	%fcc0,	%g4,	%i5
	call	loop_660
loop_658:
	fmovsleu	%xcc,	%f3,	%f24
loop_659:
	movre	%i4,	0x0DF,	%i2
	call	loop_661
loop_660:
	fmovs	%f21,	%f9
	nop
	fitos	%f2,	%f5
	fstox	%f5,	%f12
	bcs,pn	%xcc,	loop_662
loop_661:
	movug	%fcc1,	%g5,	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldx	[%l7 + 0x68],	%l1
loop_662:
	addcc	%o6,	0x04BD,	%l4
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f4
	fxtos	%f4,	%f12
	rdhpr	%ver,	%g7
	call	loop_663
	rdpr	%tl,	%o7
	fmovduge	%fcc0,	%f12,	%f10
	srax	%o0,	0x10,	%i6
loop_663:
	umulcc	%o3,	0x11CB,	%l3
	movgu	%icc,	0x314,	%i3
	movule	%fcc1,	%g2,	%g1
	edge32n	%o5,	%i1,	%l6
	sra	%g6,	%i0,	%g3
	fbuge,a	%fcc2,	loop_664
	call	loop_665
	call	loop_666
	call	loop_667
loop_664:
	tleu	%xcc,	0x5
loop_665:
	array8	%l0,	%l2,	%i7
loop_666:
	fmovdue	%fcc2,	%f24,	%f22
loop_667:
	call	loop_668
	fbuge	%fcc1,	loop_669
	fmovdneg	%xcc,	%f16,	%f24
	sethi	0x1A45,	%o4
loop_668:
	fxnor	%f0,	%f10,	%f14
loop_669:
	call	loop_670
	fxor	%f2,	%f16,	%f18
	fornot1	%f16,	%f24,	%f4
	call	loop_671
loop_670:
	call	loop_672
	fandnot1s	%f5,	%f30,	%f9
	movvs	%icc,	0x354,	%g4
loop_671:
	fcmpgt32	%f4,	%f26,	%i4
loop_672:
	udiv	%i2,	0x1B7C,	%g5
	wr	%i5,	0x0882,	%softint
	nop
	fitos	%f4,	%f17
	fstoi	%f17,	%f2
	sll	%l5,	0x0C,	%o1
	wrpr 	%g0, 	0x0, 	%gl
	mova	%fcc2,	0x53B,	%l1
	movrne	%l4,	0x1EE,	%o7
	fmovrsne	%g7,	%f1,	%f27
	call	loop_673
	call	loop_674
	call	loop_675
	fcmpeq16	%f2,	%f8,	%o0
loop_673:
	fmovdl	%xcc,	%f14,	%f10
loop_674:
	call	loop_676
loop_675:
	srl	%i6,	0x1E,	%o3
	call	loop_677
	call	loop_678
loop_676:
	srlx	%l3,	%g2,	%g1
	wr	%o5,	%i3,	%clear_softint
loop_677:
	bshuffle	%f0,	%f16,	%f16
loop_678:
	call	loop_679
	call	loop_680
	fnot1	%f10,	%f4
	call	loop_681
loop_679:
	fnot2s	%f29,	%f16
loop_680:
	nop
	setx	0x12AF47711E0B9F44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xFBA52045772226FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f26
	fmovrdne	%i1,	%f12,	%f28
loop_681:
	fmovrdne	%l6,	%f0,	%f8
	array32	%g6,	%g3,	%l0
	tpos	%icc,	0x5
	fnot1	%f24,	%f12
	set	0x66, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i0
	fmovdg	%xcc,	%f10,	%f4
	fbule,a,pn	%fcc0,	loop_682
	fmovsue	%fcc0,	%f13,	%f21
	call	loop_683
	fmovs	%f8,	%f11
loop_682:
	call	loop_684
	sll	%l2,	0x04,	%o4
loop_683:
	tl	%icc,	0x4
	sub	%g4,	0x086F,	%i4
loop_684:
	call	loop_685
	fabsd	%f24,	%f10
	fnegd	%f28,	%f6
	tcs	%xcc,	0x2
loop_685:
	bge,pt	%xcc,	loop_686
	fmovsleu	%xcc,	%f0,	%f17
	call	loop_687
	call	loop_688
loop_686:
	fpmerge	%f31,	%f1,	%f4
	call	loop_689
loop_687:
	srax	%i7,	%g5,	%i5
loop_688:
	movne	%xcc,	0x238,	%i2
	ldsw	[%l7 + 0x40],	%l5
loop_689:
	call	loop_690
	fmovrdgez	%o1,	%f28,	%f6
	call	loop_691
	tgu	%xcc,	0x5
loop_690:
	edge16n	%o6,	%l1,	%o2
	fmovdule	%fcc1,	%f0,	%f26
loop_691:
	call	loop_692
	smul	%l4,	0x07A5,	%o7
	orcc	%g7,	0x0F0B,	%o0
	movrgz	%i6,	%o3,	%l3
loop_692:
	call	loop_693
	call	loop_694
	andcc	%g2,	%o5,	%g1
	rdhpr	%hsys_tick_cmpr,	%i1
loop_693:
	nop
	wr	%g0,	0x18,	%asi
	stwa	%l6,	[%l7 + 0x7C] %asi
loop_694:
	fmuld8ulx16	%f3,	%f12,	%f22
	fpsub32s	%f29,	%f19,	%f28
	xnorcc	%i3,	0x1C8D,	%g3
	wrpr	%l0,	0x1E62,	%cwp
	set	0x31, %g7
	stba	%i0,	[%l7 + %g7] 0x23
	membar	#Sync
	fmovrdgez	%g6,	%f0,	%f8
	fmovsle	%xcc,	%f9,	%f11
	fcmps	%fcc1,	%f6,	%f15
	fmovdl	%icc,	%f28,	%f6
	fmovrsgez	%l2,	%f21,	%f16
	call	loop_695
	call	loop_696
	fmovrdlez	%g4,	%f18,	%f24
	call	loop_697
loop_695:
	call	loop_698
loop_696:
	fpack32	%f18,	%f0,	%f12
	rdpr	%otherwin,	%i4
loop_697:
	movge	%fcc1,	0x61F,	%o4
loop_698:
	fmovscs	%icc,	%f27,	%f29
	brz,a	%g5,	loop_699
	movule	%fcc1,	0x417,	%i7
	edge32n	%i2,	%l5,	%o1
	membar	0x4E
loop_699:
	wr	%o6,	0x0B3B,	%set_softint
	edge8n	%i5,	%l1,	%l4
	call	loop_700
	call	loop_701
	tvs	%xcc,	0x0
	movrlz	%o7,	%g7,	%o0
loop_700:
	call	loop_702
loop_701:
	fcmpeq16	%f24,	%f20,	%i6
	fcmpgt16	%f20,	%f30,	%o3
	call	loop_703
loop_702:
	call	loop_704
	call	loop_705
	andn	%l3,	%o2,	%o5
loop_703:
	fandnot2	%f8,	%f12,	%f18
loop_704:
	call	loop_706
loop_705:
	fmovsn	%xcc,	%f12,	%f10
	call	loop_707
	bgu,a	%icc,	loop_708
loop_706:
	fmovrdlz	%g1,	%f6,	%f4
	ba,a	%xcc,	loop_709
loop_707:
	nop
	setx	0x6F67470E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x148E9BC4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f11,	%f21
loop_708:
	wrpr	%i1,	0x0648,	%pil
	wr	%g2,	0x1CF9,	%y
loop_709:
	call	loop_710
	faligndata	%f16,	%f26,	%f10
	call	loop_711
	call	loop_712
loop_710:
	call	loop_713
	call	loop_714
loop_711:
	call	loop_715
loop_712:
	fbn,a,pt	%fcc1,	loop_716
loop_713:
	fble	%fcc0,	loop_717
loop_714:
	nop
	set	0x08, %g5
	stw	%l6,	[%l7 + %g5]
loop_715:
	fsrc1s	%f29,	%f12
loop_716:
	fmovspos	%icc,	%f16,	%f14
loop_717:
	fnot2	%f8,	%f28
	call	loop_718
	movleu	%xcc,	0x697,	%i3
	mova	%icc,	0x3D7,	%l0
	call	loop_719
loop_718:
	tg	%icc,	0x1
	edge32n	%g3,	%i0,	%g6
	fnand	%f30,	%f6,	%f20
loop_719:
	call	loop_720
	nop
	set	0x74, %i7
	swap	[%l7 + %i7],	%g4
	fbne,pn	%fcc0,	loop_721
	fpsub16s	%f22,	%f8,	%f9
loop_720:
	call	loop_722
	fbue,a	%fcc0,	loop_723
loop_721:
	fornot2s	%f1,	%f14,	%f28
	call	loop_724
loop_722:
	fmovsne	%xcc,	%f20,	%f16
loop_723:
	fmovrslz	%i4,	%f31,	%f31
	fornot1	%f20,	%f16,	%f20
loop_724:
	fbl	%fcc0,	loop_725
	nop
	setx	0x1F45,	%l0,	%g5
	udivx	%o4,	%g5,	%i7
	movule	%fcc3,	0x76D,	%l2
	nop
	set	0x48, %l2
	stx	%l5,	[%l7 + %l2]
loop_725:
	fmovrdlez	%o1,	%f14,	%f6
	call	loop_726
	call	loop_727
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f4
	call	loop_728
loop_726:
	call	loop_729
loop_727:
	movge	%xcc,	%o6,	%i2
	bmask	%i5,	%l1,	%l4
loop_728:
	movleu	%xcc,	%o7,	%o0
loop_729:
	movge	%icc,	0x2D4,	%g7
	taddcctv	%o3,	%l3,	%o2
	call	loop_730
	call	loop_731
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%o4
	call	loop_732
loop_730:
	fbu,a,pn	%fcc3,	loop_733
loop_731:
	movrgz	%i6,	0x23A,	%i1
	brlz,pt	%g1,	loop_734
loop_732:
	tle	%xcc,	0x1
loop_733:
	edge16	%l6,	%g2,	%l0
	fmovdu	%fcc3,	%f20,	%f26
loop_734:
	rdhpr	%htba,	%i3
	orcc	%g3,	0x0369,	%g6
	fmovrdgz	%i0,	%f16,	%f2
	fpadd16s	%f1,	%f2,	%f11
	fmovrslez	%i4,	%f13,	%f17
	call	loop_735
	bn,a	%xcc,	loop_736
	call	loop_737
	mulscc	%o4,	%g5,	%g4
loop_735:
	andcc	%i7,	%l2,	%l5
loop_736:
	bvc,pn	%xcc,	loop_738
loop_737:
	fmovrdgez	%o6,	%f12,	%f30
	call	loop_739
	orcc	%i2,	0x0F59,	%i5
loop_738:
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f0
	fpack32	%f0,	%f8,	%f28
loop_739:
	movule	%fcc0,	%o1,	%l4
	movrne	%l1,	%o0,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	call	loop_740
	fbuge,a,pt	%fcc2,	loop_741
	movule	%fcc3,	0x76D,	%l3
	fmovsl	%icc,	%f26,	%f14
loop_740:
	fmovrslz	%o7,	%f21,	%f29
loop_741:
	call	loop_742
	brz,pt	%o2,	loop_743
	stbar
	call	loop_744
loop_742:
	call	loop_745
loop_743:
	bneg	%xcc,	loop_746
	nop
	fitos	%f5,	%f27
	fstod	%f27,	%f22
loop_744:
	taddcctv	%o5,	%i1,	%g1
loop_745:
	fmovsvc	%xcc,	%f23,	%f13
loop_746:
	edge32n	%l6,	%g2,	%i6
	call	loop_747
	call	loop_748
	fcmpd	%fcc3,	%f6,	%f20
	fmovsgu	%xcc,	%f13,	%f14
loop_747:
	sethi	0x0AD1,	%i3
loop_748:
	fmovdg	%xcc,	%f6,	%f12
	tneg	%icc,	0x2
	fmovscc	%icc,	%f31,	%f29
	fmovsul	%fcc0,	%f10,	%f26
	andn	%g3,	%l0,	%g6
	fbn,pt	%fcc1,	loop_749
	wrpr	%i0,	0x07B1,	%tick
	call	loop_750
	call	loop_751
loop_749:
	movn	%xcc,	0x261,	%i4
	rdhpr	%hsys_tick_cmpr,	%o4
loop_750:
	call	loop_752
loop_751:
	fmovrdgez	%g4,	%f16,	%f12
	tsubcctv	%g5,	0x0F41,	%l2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd0
loop_752:
	call	loop_753
	call	loop_754
	fxnors	%f19,	%f14,	%f25
	fornot1s	%f12,	%f14,	%f0
loop_753:
	call	loop_755
loop_754:
	call	loop_756
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f14
	call	loop_757
loop_755:
	fcmple16	%f12,	%f4,	%i7
loop_756:
	fandnot1	%f8,	%f0,	%f4
	fmovrdne	%l5,	%f28,	%f16
loop_757:
	udivx	%i2,	0x1AF7,	%i5
	call	loop_758
	edge8ln	%o1,	%l4,	%l1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o6
loop_758:
	call	loop_759
	smul	%g7,	0x016B,	%o3
	call	loop_760
	subccc	%l3,	%o0,	%o2
loop_759:
	call	loop_761
	fmovduge	%fcc1,	%f0,	%f30
loop_760:
	tcc	%xcc,	0x2
	fmovda	%fcc1,	%f28,	%f22
loop_761:
	call	loop_762
	fcmpgt32	%f28,	%f18,	%o5
	edge32	%o7,	%g1,	%i1
	movrgz	%l6,	%i6,	%i3
loop_762:
	call	loop_763
	fpsub32	%f22,	%f16,	%f10
	ta	%icc,	0x4
	srl	%g3,	0x1D,	%g2
loop_763:
	fand	%f14,	%f28,	%f8
	sdivx	%l0,	0x138C,	%i0
	call	loop_764
	nop
	setx	0xCEC379914338A268,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x26700A46,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsmuld	%f6,	%f6,	%f26
	movule	%fcc0,	%g6,	%o4
	sdivcc	%i4,	0x07D3,	%g5
loop_764:
	nop
	setx	0xB43B6398EFA86F0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x78AD7C1A512F4C71,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f18,	%f14
	fpadd16s	%f10,	%f12,	%f19
	movue	%fcc3,	0x470,	%g4
	call	loop_765
	nop
	setx	0x9CFC3355AC361323,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB289CEB06FACDEB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f26,	%f26
	fnegd	%f18,	%f8
	ba,a	%xcc,	loop_766
loop_765:
	call	loop_767
	fmovrsgz	%i7,	%f25,	%f2
	call	loop_768
loop_766:
	fbul,pt	%fcc2,	loop_769
loop_767:
	array16	%l5,	%l2,	%i5
	call	loop_770
loop_768:
	call	loop_771
loop_769:
	rdpr	%pil,	%o1
	addc	%i2,	0x1E3D,	%l1
loop_770:
	tge	%icc,	0x1
loop_771:
	fmovdlg	%fcc1,	%f14,	%f10
	call	loop_772
	call	loop_773
	movne	%fcc0,	0x1ED,	%l4
	stbar
loop_772:
	tne	%xcc,	0x0
loop_773:
	call	loop_774
	fmovsneg	%icc,	%f23,	%f28
	call	loop_775
	fmovsvs	%icc,	%f20,	%f4
loop_774:
	call	loop_776
	call	loop_777
loop_775:
	movul	%fcc0,	%g7,	%o3
	fmovdg	%fcc0,	%f28,	%f6
loop_776:
	fmovdue	%fcc0,	%f10,	%f12
loop_777:
	call	loop_778
	call	loop_779
	fzeros	%f0
	tsubcctv	%o6,	0x17BC,	%l3
loop_778:
	fpadd32	%f10,	%f28,	%f22
loop_779:
	nop
	set	0x58, %i6
	stwa	%o2,	[%l7 + %i6] 0x2a
	membar	#Sync
	movug	%fcc0,	0x1B5,	%o0
	wrpr	%o5,	%o7,	%cwp
	add	%g1,	%l6,	%i1
	wr	%g0,	0x88,	%asi
	stba	%i6,	[%l7 + 0x19] %asi
	nop
	setx	0xD2A9F8707557F6E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xC94CFE3A109D73E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f22,	%f20
	fmovdgu	%icc,	%f0,	%f14
	bl,a	%icc,	loop_780
	edge32l	%g3,	%i3,	%l0
	call	loop_781
	wrpr	%i0,	%g2,	%cwp
loop_780:
	movug	%fcc1,	0x36D,	%o4
	fmovdl	%icc,	%f26,	%f6
loop_781:
	movvc	%icc,	0x17F,	%g6
	stw	%g5,	[%l7 + 0x60]
	movge	%icc,	%i4,	%i7
	edge8l	%l5,	%l2,	%g4
	nop
	fitos	%f2,	%f22
	fstod	%f22,	%f22
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i5
	bne	%icc,	loop_782
	fzeros	%f14
	umulcc	%i2,	0x03D3,	%l1
	sub	%o1,	0x0D28,	%l4
loop_782:
	fmul8x16al	%f9,	%f6,	%f10
	rdpr	%wstate,	%o3
	fcmpeq16	%f10,	%f28,	%g7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 23
!	Type a   	: 31
!	Type cti   	: 164
!	Type x   	: 10
!	Type f   	: 146
!	Type i   	: 126
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
	set	0xE,	%g1
	set	0x5,	%g2
	set	0x6,	%g3
	set	0xF,	%g4
	set	0xA,	%g5
	set	0x5,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x2,	%i1
	set	-0x4,	%i2
	set	-0x4,	%i3
	set	-0xD,	%i4
	set	-0xF,	%i5
	set	-0xC,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x0301BF54,	%l0
	set	0x2609BE7D,	%l1
	set	0x0FF80399,	%l2
	set	0x2F551BF8,	%l3
	set	0x2E585988,	%l4
	set	0x4D66063D,	%l5
	set	0x6A238B1A,	%l6
	!# Output registers
	set	-0x01DC,	%o0
	set	-0x1192,	%o1
	set	-0x0C4B,	%o2
	set	-0x032F,	%o3
	set	-0x0EF8,	%o4
	set	0x0ED6,	%o5
	set	-0x0AF7,	%o6
	set	0x0553,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	fzeros	%f6
	fones	%f26
	call	loop_783
	bvc,pn	%icc,	loop_784
	te	%xcc,	0x3
	call	loop_785
loop_783:
	call	loop_786
loop_784:
	fones	%f6
	fmovda	%fcc0,	%f2,	%f0
loop_785:
	call	loop_787
loop_786:
	edge8l	%l3,	%o2,	%o6
	call	loop_788
	call	loop_789
loop_787:
	fmovdcs	%xcc,	%f6,	%f0
	tl	%xcc,	0x0
loop_788:
	call	loop_790
loop_789:
	movvs	%icc,	0x19F,	%o0
	fmovdule	%fcc2,	%f14,	%f12
	fnegd	%f30,	%f0
loop_790:
	fmovspos	%icc,	%f15,	%f3
	brnz,a	%o7,	loop_791
	sdiv	%g1,	0x13A2,	%o5
	call	loop_792
	call	loop_793
loop_791:
	call	loop_794
	call	loop_795
loop_792:
	fcmps	%fcc1,	%f12,	%f30
loop_793:
	fmovdcs	%xcc,	%f14,	%f24
loop_794:
	fnegs	%f8,	%f10
loop_795:
	nop
	fitos	%f3,	%f21
	fstox	%f21,	%f4
	fxtos	%f4,	%f27
	fmul8sux16	%f30,	%f12,	%f8
	fmovdcc	%icc,	%f20,	%f2
	sra	%i1,	0x01,	%l6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd3,	%f0
	fandnot1s	%f20,	%f1,	%f24
	call	loop_796
	rd	%softint,	%g3
	rd	%y,	%i3
	tgu	%icc,	0x0
loop_796:
	call	loop_797
	nop
	setx	0x0A50A07B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xCA00CF3B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f9,	%f5
	edge8	%i6,	%i0,	%l0
	nop
	set	0x0C, %o0
	prefetch	[%l7 + %o0],	 1
loop_797:
	faligndata	%f2,	%f4,	%f12
	fcmps	%fcc0,	%f23,	%f16
	fors	%f21,	%f0,	%f0
	add	%g2,	%o4,	%g6
	call	loop_798
	call	loop_799
	call	loop_800
	srax	%g5,	0x1F,	%i4
loop_798:
	fornot1	%f2,	%f18,	%f30
loop_799:
	fbne,pt	%fcc1,	loop_801
loop_800:
	mulscc	%l5,	0x0A1E,	%i7
	call	loop_802
	fnot1	%f18,	%f4
loop_801:
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f10
	fxtos	%f10,	%f30
	edge8ln	%l2,	%g4,	%i5
loop_802:
	call	loop_803
	fmovscc	%xcc,	%f28,	%f24
	fmovdge	%icc,	%f4,	%f26
	nop
	set	0x7C, %l3
	lduw	[%l7 + %l3],	%i2
loop_803:
	call	loop_804
	ba,pt	%xcc,	loop_805
	edge8ln	%l1,	%o1,	%o3
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%g7
loop_804:
	call	loop_806
loop_805:
	tgu	%icc,	0x3
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_807
loop_806:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fpack16	%f22,	%f20
	call	loop_808
loop_807:
	fmovsl	%fcc1,	%f11,	%f21
	fmovso	%fcc1,	%f21,	%f18
	call	loop_809
loop_808:
	wr	%l4,	%l3,	%sys_tick
	movue	%fcc0,	%o6,	%o0
	movg	%icc,	%o2,	%g1
loop_809:
	call	loop_810
	call	loop_811
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f24
	fxtos	%f24,	%f25
	fbule,a,pt	%fcc0,	loop_812
loop_810:
	fmovdcs	%icc,	%f12,	%f26
loop_811:
	rdpr	%canrestore,	%o5
	call	loop_813
loop_812:
	call	loop_814
	call	loop_815
	fmovspos	%icc,	%f4,	%f25
loop_813:
	fmovrde	%o7,	%f20,	%f2
loop_814:
	call	loop_816
loop_815:
	array32	%l6,	%g3,	%i3
	rdhpr	%hsys_tick_cmpr,	%i1
	fpadd16s	%f17,	%f27,	%f21
loop_816:
	rdhpr	%hintp,	%i6
	set	0x10, %g3
	stha	%i0,	[%l7 + %g3] 0xea
	membar	#Sync
	call	loop_817
	call	loop_818
	call	loop_819
	bcs	%xcc,	loop_820
loop_817:
	call	loop_821
loop_818:
	call	loop_822
loop_819:
	tl	%xcc,	0x1
loop_820:
	fbuge,a	%fcc3,	loop_823
loop_821:
	fpackfix	%f6,	%f30
loop_822:
	bcc,pt	%xcc,	loop_824
	xorcc	%g2,	0x06B1,	%o4
loop_823:
	call	loop_825
	fzero	%f2
loop_824:
	fpadd32s	%f8,	%f29,	%f23
	nop
	set	0x38, %o7
	std	%g6,	[%l7 + %o7]
loop_825:
	rd	%sys_tick_cmpr,	%g5
	call	loop_826
	nop
	fitos	%f1,	%f8
	fstox	%f8,	%f26
	fmovda	%icc,	%f16,	%f30
	movrlez	%i4,	0x217,	%l0
loop_826:
	call	loop_827
	fpadd16s	%f7,	%f7,	%f8
	call	loop_828
	call	loop_829
loop_827:
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f6
	fxtos	%f6,	%f13
	movrne	%l5,	%i7,	%g4
loop_828:
	sllx	%l2,	%i2,	%l1
loop_829:
	call	loop_830
	orn	%i5,	0x1D84,	%o3
	call	loop_831
	movug	%fcc3,	%g7,	%o1
loop_830:
	fcmpes	%fcc0,	%f3,	%f17
	fmovdpos	%xcc,	%f30,	%f16
loop_831:
	fornot1s	%f29,	%f13,	%f13
	fmovdu	%fcc2,	%f20,	%f30
	fcmple16	%f12,	%f12,	%l4
	call	loop_832
	call	loop_833
	nop
	setx	0xE3F3407B92923F42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f6
	fbg	%fcc1,	loop_834
loop_832:
	add	%l3,	%o6,	%o2
loop_833:
	popc	%o0,	%g1
	xnorcc	%o7,	0x0F4B,	%o5
loop_834:
	call	loop_835
	wrpr 	%g0, 	0x1, 	%gl
	fandnot1	%f8,	%f0,	%f24
	te	%icc,	0x1
loop_835:
	call	loop_836
	popc	0x18D5,	%l6
	call	loop_837
	call	loop_838
loop_836:
	fabsd	%f16,	%f26
	edge8ln	%i1,	%i6,	%i0
loop_837:
	tge	%icc,	0x0
loop_838:
	fmovdcc	%xcc,	%f2,	%f16
	fmovsg	%fcc0,	%f11,	%f26
	nop
	setx	0x554EE230,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2188B3A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f0,	%f6
	array32	%g2,	%i3,	%o4
	fmovdpos	%xcc,	%f8,	%f26
	sethi	0x1A11,	%g5
	call	loop_839
	call	loop_840
	lduh	[%l7 + 0x50],	%g6
	nop
	setx	0x67C9E20BD45E3A9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD73097DB559D752E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f6
loop_839:
	movo	%fcc0,	%i4,	%l0
loop_840:
	tne	%icc,	0x3
	nop
	fitos	%f0,	%f10
	fstod	%f10,	%f2
	call	loop_841
	fmovsu	%fcc2,	%f17,	%f31
	alignaddr	%i7,	%l5,	%l2
	srlx	%i2,	0x0B,	%g4
loop_841:
	call	loop_842
	sra	%i5,	%l1,	%o3
	bge,a,pt	%icc,	loop_843
	taddcc	%o1,	%g7,	%l3
loop_842:
	call	loop_844
	call	loop_845
loop_843:
	fmovsvc	%xcc,	%f8,	%f6
	call	loop_846
loop_844:
	fabss	%f10,	%f24
loop_845:
	call	loop_847
	fcmple32	%f4,	%f12,	%o6
loop_846:
	fpackfix	%f30,	%f0
	fnot2s	%f5,	%f3
loop_847:
	fmovscs	%xcc,	%f28,	%f29
	fnegs	%f18,	%f30
	call	loop_848
	edge8l	%o2,	%o0,	%g1
	call	loop_849
	tn	%icc,	0x5
loop_848:
	bvc,a	%icc,	loop_850
	call	loop_851
loop_849:
	call	loop_852
	fandnot1s	%f15,	%f10,	%f17
loop_850:
	movrlez	%o7,	%o5,	%l4
loop_851:
	call	loop_853
loop_852:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	ta	%icc,	0x3
	call	loop_854
loop_853:
	fba,pn	%fcc3,	loop_855
	tgu	%icc,	0x6
	call	loop_856
loop_854:
	addccc	%l6,	0x1E4C,	%g3
loop_855:
	srlx	%i6,	0x06,	%i0
	fbe,a,pt	%fcc3,	loop_857
loop_856:
	fmovdule	%fcc2,	%f14,	%f18
	call	loop_858
	call	loop_859
loop_857:
	call	loop_860
	call	loop_861
loop_858:
	nop
	setx	0xECE57563ECF8D73E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8D475A692349B903,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f28,	%f30
loop_859:
	andncc	%i1,	0x1FB7,	%i3
loop_860:
	tg	%icc,	0x0
loop_861:
	nop
	set	0x10, %l4
	ldsb	[%l7 + %l4],	%o4
	fmovdge	%xcc,	%f6,	%f24
	nop
	setx	0x6CFC112D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f15
	call	loop_862
	fabss	%f5,	%f2
	call	loop_863
	nop
	setx	0x1996,	%l0,	%g2
	sdivx	%g5,	%g2,	%g6
loop_862:
	umulcc	%i4,	0x0779,	%i7
	tvc	%icc,	0x0
loop_863:
	addccc	%l0,	0x123F,	%l5
	call	loop_864
	call	loop_865
	sllx	%i2,	%g4,	%l2
	call	loop_866
loop_864:
	tvc	%icc,	0x2
loop_865:
	call	loop_867
	call	loop_868
loop_866:
	xor	%l1,	%i5,	%o1
	call	loop_869
loop_867:
	fxor	%f18,	%f20,	%f8
loop_868:
	andncc	%g7,	%o3,	%l3
	fmovdcc	%icc,	%f24,	%f10
loop_869:
	fabss	%f15,	%f13
	call	loop_870
	fpadd32s	%f20,	%f20,	%f22
	tg	%icc,	0x6
	rdpr	%wstate,	%o2
loop_870:
	nop
	setx	0x8EA7BCD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xB54187E3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f18,	%f25
	fors	%f31,	%f4,	%f4
	rdhpr	%ver,	%o0
	fmul8x16au	%f8,	%f23,	%f6
	fornot2s	%f4,	%f28,	%f11
	srlx	%o6,	0x1E,	%o7
	edge32n	%g1,	%o5,	%l4
	bneg,a	%icc,	loop_871
	movcs	%icc,	0x072,	%g3
	fnegs	%f23,	%f15
	fblg,a	%fcc0,	loop_872
loop_871:
	call	loop_873
	fzero	%f8
	fmovsule	%fcc2,	%f24,	%f10
loop_872:
	rd	%tick_cmpr,	%i6
loop_873:
	smul	%l6,	0x050A,	%i1
	fmovsgu	%icc,	%f13,	%f3
	call	loop_874
	fabss	%f10,	%f21
	call	loop_875
	mulx	%i0,	0x004C,	%o4
loop_874:
	fmovso	%fcc1,	%f22,	%f28
	fsrc2s	%f12,	%f26
loop_875:
	movrgez	%i3,	0x3A3,	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0FE, 	%hsys_tick_cmpr
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i4
	movrlz	%l0,	0x07F,	%l5
	fnegd	%f6,	%f14
	bl	%icc,	loop_876
	tgu	%icc,	0x4
	call	loop_877
	call	loop_878
loop_876:
	tge	%icc,	0x2
	call	loop_879
loop_877:
	fcmpeq16	%f20,	%f2,	%i2
loop_878:
	brlez	%i7,	loop_880
	movule	%fcc1,	0x70B,	%g4
loop_879:
	add	%l2,	%l1,	%o1
	subcc	%g7,	0x098B,	%o3
loop_880:
	mulx	%i5,	0x1170,	%l3
	fmovsl	%fcc1,	%f4,	%f29
	addccc	%o0,	0x1309,	%o2
	call	loop_881
	fmovsug	%fcc2,	%f21,	%f2
	fmul8x16au	%f16,	%f8,	%f6
	fmovdn	%fcc0,	%f8,	%f16
loop_881:
	nop
	setx	loop_882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032200001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_883
	fmovdge	%fcc1,	%f16,	%f0
	fornot1s	%f10,	%f13,	%f10
loop_882:
	lduh	[%l7 + 0x6C],	%o6
loop_883:
	call	loop_884
	movne	%xcc,	%o7,	%g1
	call	loop_885
	fmovdo	%fcc3,	%f10,	%f14
loop_884:
	call	loop_886
	fmovse	%xcc,	%f0,	%f25
loop_885:
	movcc	%xcc,	%l4,	%g3
	call	loop_887
loop_886:
	fpmerge	%f21,	%f10,	%f22
	nop
	set	0x70, %o1
	ldsh	[%l7 + %o1],	%o5
	fornot1	%f24,	%f14,	%f28
loop_887:
	or	%i6,	%l6,	%i1
	fcmpes	%fcc0,	%f16,	%f19
	nop
	setx	0xF406C0E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f7
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%i0
	movlg	%fcc0,	0x43B,	%o4
	membar	0x25
	fands	%f8,	%f12,	%f23
	te	%icc,	0x2
	brz,a	%i3,	loop_888
	bl,pn	%icc,	loop_889
	call	loop_890
	xnorcc	%g2,	%g6,	%i4
loop_888:
	fpadd32	%f10,	%f18,	%f18
loop_889:
	fmovdl	%xcc,	%f2,	%f18
loop_890:
	nop
	setx	0xFDE6E46297540DD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	call	loop_891
	call	loop_892
	movleu	%xcc,	0x101,	%l0
	fpadd32s	%f15,	%f28,	%f11
loop_891:
	bvs,a,pt	%icc,	loop_893
loop_892:
	fmovrslz	%g5,	%f4,	%f19
	brgez,a,pt	%i2,	loop_894
	call	loop_895
loop_893:
	subcc	%i7,	%l5,	%l2
	add	%g4,	%o1,	%l1
loop_894:
	call	loop_896
loop_895:
	nop
	setx loop_897, %l0, %l1
	jmpl %l1, %o3
	fmovscs	%xcc,	%f17,	%f10
	call	loop_898
loop_896:
	call	loop_899
loop_897:
	fmul8x16au	%f9,	%f28,	%f12
	xorcc	%g7,	%i5,	%o0
loop_898:
	fmovdvc	%xcc,	%f12,	%f2
loop_899:
	fmovsgu	%icc,	%f28,	%f26
	fbge,a,pn	%fcc2,	loop_900
	call	loop_901
	call	loop_902
	fmovrse	%o2,	%f10,	%f28
loop_900:
	fsrc1	%f0,	%f10
loop_901:
	rdpr	%gl,	%l3
loop_902:
	call	loop_903
	fmovrse	%o6,	%f17,	%f29
	call	loop_904
	te	%icc,	0x2
loop_903:
	andncc	%o7,	0x084B,	%g1
	fbul,a	%fcc0,	loop_905
loop_904:
	fnegd	%f2,	%f18
	mova	%fcc1,	%g3,	%l4
	call	loop_906
loop_905:
	movge	%fcc0,	%o5,	%l6
	sllx	%i6,	%i0,	%o4
	tg	%icc,	0x3
loop_906:
	fmovscs	%xcc,	%f11,	%f31
	faligndata	%f10,	%f18,	%f2
	call	loop_907
	tn	%icc,	0x0
	alignaddrl	%i1,	%i3,	%g6
	movvc	%xcc,	%g2,	%l0
loop_907:
	movre	%i4,	0x110,	%g5
	stw	%i2,	[%l7 + 0x30]
	edge16	%l5,	%l2,	%i7
	nop
	setx	0x18A7,	%l0,	%l1
	sdiv	%g4,	%l1,	%o1
	call	loop_908
	movrgz	%g7,	%o3,	%o0
	call	loop_909
	umul	%i5,	0x0EAF,	%l3
loop_908:
	fandnot1s	%f19,	%f28,	%f25
	call	loop_910
loop_909:
	taddcc	%o6,	%o7,	%o2
	movcs	%icc,	%g1,	%l4
	fmovdul	%fcc0,	%f26,	%f20
loop_910:
	bshuffle	%f20,	%f24,	%f0
	fmovdo	%fcc3,	%f30,	%f20
	call	loop_911
	tneg	%icc,	0x4
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%g2
	subccc	%o5,	0x0FBC,	%l6
loop_911:
	sra	%i0,	0x1D,	%i6
	ldsh	[%l7 + 0x62],	%i1
	rdhpr	%htba,	%i3
	tvs	%icc,	0x5
	fnot2s	%f17,	%f28
	call	loop_912
	call	loop_913
	subcc	%g6,	0x1343,	%o4
	nop
	setx	0x04AA,	%l0,	%i4
	sdivcc	%l0,	%i4,	%g2
loop_912:
	movge	%xcc,	0x458,	%i2
loop_913:
	ldsh	[%l7 + 0x4C],	%l5
	alignaddr	%l2,	%g5,	%i7
	call	loop_914
	fornot2s	%f23,	%f24,	%f9
	fexpand	%f9,	%f18
	call	loop_915
loop_914:
	movn	%fcc2,	%l1,	%o1
	nop
	setx	0x0477,	%l0,	%g7
	udiv	%g4,	%g7,	%o3
	fsrc1s	%f11,	%f10
loop_915:
	xnor	%o0,	%i5,	%l3
	sub	%o6,	%o2,	%o7
	fnand	%f12,	%f10,	%f8
	fmovrdlz	%l4,	%f6,	%f30
	smulcc	%g1,	0x0F52,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movcs	%icc,	%i0,	%i6
	call	loop_916
	xnor	%i3,	%g6,	%o4
	sethi	0x0A52,	%l0
	nop
	fitos	%f12,	%f19
	fstoi	%f19,	%f11
loop_916:
	fandnot1	%f16,	%f26,	%f24
	wrpr 	%g0, 	0x3, 	%gl
	call	loop_917
	fsrc1s	%f11,	%f25
	orcc	%i4,	%g2,	%l5
	tn	%xcc,	0x0
loop_917:
	call	loop_918
	fpadd16s	%f8,	%f7,	%f31
	bcs,a,pt	%icc,	loop_919
	srl	%i2,	0x05,	%g5
loop_918:
	addcc	%i7,	0x0372,	%l1
	call	loop_920
loop_919:
	tne	%icc,	0x3
	tvc	%icc,	0x4
	movl	%xcc,	%o1,	%l2
loop_920:
	tpos	%icc,	0x0
	call	loop_921
	fmovsa	%icc,	%f0,	%f9
	sdiv	%g7,	0x00AD,	%g4
	nop
	setx	0x1BDA,	%l0,	%o3
	sdivx	%o0,	%o3,	%i5
loop_921:
	tg	%icc,	0x6
	subcc	%o6,	0x1E37,	%l3
	call	loop_922
	fmovsug	%fcc2,	%f4,	%f8
	fmovduge	%fcc2,	%f18,	%f2
	call	loop_923
loop_922:
	srl	%o2,	0x0C,	%l4
	nop
	setx	0xA8654A32,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	movlg	%fcc1,	%o7,	%o5
loop_923:
	call	loop_924
	call	loop_925
	subc	%l6,	%g3,	%g1
	wr	%g0,	0x2b,	%asi
	stwa	%i6,	[%l7 + 0x24] %asi
	membar	#Sync
loop_924:
	call	loop_926
loop_925:
	fcmpeq32	%f12,	%f20,	%i3
	rd	%asi,	%g6
	edge16n	%i0,	%o4,	%i1
loop_926:
	tcc	%icc,	0x3
	call	loop_927
	fnot1	%f6,	%f14
	tn	%icc,	0x6
	call	loop_928
loop_927:
	call	loop_929
	movo	%fcc0,	%l0,	%g2
	call	loop_930
loop_928:
	call	loop_931
loop_929:
	subccc	%l5,	0x02C2,	%i2
	call	loop_932
loop_930:
	fmovrdne	%i4,	%f20,	%f26
loop_931:
	fmovsle	%fcc3,	%f5,	%f9
	wr	%g0,	0x19,	%asi
	stwa	%g5,	[%l7 + 0x08] %asi
loop_932:
	stbar
	call	loop_933
	fmovrdgz	%l1,	%f6,	%f22
	fornot2	%f18,	%f0,	%f28
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f18
loop_933:
	call	loop_934
	fpack16	%f30,	%f23
	call	loop_935
	fbe,a	%fcc1,	loop_936
loop_934:
	call	loop_937
	fcmpgt16	%f16,	%f20,	%i7
loop_935:
	call	loop_938
loop_936:
	sub	%o1,	0x12DD,	%l2
loop_937:
	movl	%fcc3,	0x01D,	%g7
	fcmpne16	%f6,	%f2,	%g4
loop_938:
	edge16ln	%o0,	%i5,	%o6
	bpos,pn	%xcc,	loop_939
	fmovsu	%fcc2,	%f21,	%f4
	rdpr	%tba,	%l3
	call	loop_940
loop_939:
	call	loop_941
	fnot1s	%f7,	%f1
	fmovrdgz	%o3,	%f30,	%f8
loop_940:
	brgez,a,pt	%l4,	loop_942
loop_941:
	call	loop_943
	fmovrslez	%o7,	%f16,	%f2
	call	loop_944
loop_942:
	std	%o4,	[%l7 + 0x18]
loop_943:
	fmovrse	%o2,	%f10,	%f30
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x60] %asi,	%g3
loop_944:
	call	loop_945
	edge16l	%l6,	%g1,	%i3
	call	loop_946
	edge32n	%i6,	%i0,	%o4
loop_945:
	call	loop_947
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_946:
	call	loop_948
	nop
	fitod	%f6,	%f18
loop_947:
	nop

loop_948:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 23
!	Type a   	: 18
!	Type x   	: 6
!	Type cti   	: 166
!	Type f   	: 144
!	Type i   	: 143
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
	set	0xC,	%g4
	set	0x3,	%g5
	set	0x2,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x2,	%i1
	set	-0x8,	%i2
	set	-0xF,	%i3
	set	-0xE,	%i4
	set	-0xA,	%i5
	set	-0xC,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x27F66927,	%l0
	set	0x5D56320C,	%l1
	set	0x54DF27D6,	%l2
	set	0x5A61BF0E,	%l3
	set	0x431CFDAD,	%l4
	set	0x7E7843DC,	%l5
	set	0x69427930,	%l6
	!# Output registers
	set	-0x195A,	%o0
	set	0x16E5,	%o1
	set	0x0177,	%o2
	set	0x05E2,	%o3
	set	-0x0FCD,	%o4
	set	0x0222,	%o5
	set	-0x1994,	%o6
	set	0x17B8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	movre	%i1,	%l0,	%g6
	fmovdu	%fcc3,	%f28,	%f16
	tl	%xcc,	0x0
	movg	%xcc,	0x668,	%g2
	fpadd16s	%f29,	%f5,	%f17
	fmovdvc	%xcc,	%f18,	%f8
	xorcc	%l5,	0x0B04,	%i2
	call	loop_949
	movrgez	%g5,	0x06C,	%l1
	fbge,a,pn	%fcc0,	loop_950
	bneg,a	%xcc,	loop_951
loop_949:
	fmovsneg	%icc,	%f21,	%f6
	call	loop_952
loop_950:
	fpmerge	%f13,	%f0,	%f10
loop_951:
	ldsh	[%l7 + 0x24],	%i4
	fcmpne32	%f24,	%f24,	%o1
loop_952:
	call	loop_953
	or	%l2,	%g7,	%i7
	fmovrdlz	%o0,	%f30,	%f10
	fmovdue	%fcc0,	%f20,	%f16
loop_953:
	or	%g4,	0x1027,	%i5
	call	loop_954
	fmovdle	%icc,	%f6,	%f8
	tvc	%xcc,	0x0
	ldd	[%l7 + 0x20],	%f14
loop_954:
	fmovsu	%fcc3,	%f23,	%f6
	call	loop_955
	tvs	%icc,	0x3
	nop
	fitod	%f12,	%f8
	call	loop_956
loop_955:
	add	%o6,	0x0439,	%l3
	call	loop_957
	movpos	%icc,	%o3,	%o7
loop_956:
	tne	%xcc,	0x1
	rdhpr	%hpstate,	%l4
loop_957:
	tne	%icc,	0x3
	tgu	%icc,	0x4
	nop
	set	0x1C, %o2
	prefetch	[%l7 + %o2],	 2
	call	loop_958
	fpsub32s	%f11,	%f31,	%f20
	call	loop_959
	nop
	setx	loop_960,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x014400001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_958:
	call	loop_961
	rdhpr	%ver,	%o5
loop_959:
	call	loop_962
loop_960:
	nop
	setx	0x65250EE62441B41D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_961:
	fmovdn	%icc,	%f14,	%f10
	orcc	%o2,	0x1422,	%l6
loop_962:
	fpsub16s	%f5,	%f25,	%f14
	call	loop_963
	fmovsn	%fcc2,	%f1,	%f1
	tpos	%icc,	0x4
	sra	%g3,	0x1E,	%i3
loop_963:
	call	loop_964
	fmovdge	%fcc1,	%f2,	%f26
	movvs	%xcc,	0x375,	%i6
	addccc	%i0,	%g1,	%o4
loop_964:
	call	loop_965
	tg	%xcc,	0x3
	fpadd32s	%f6,	%f0,	%f1
	fnot2	%f0,	%f28
loop_965:
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%i1
	movug	%fcc0,	0x645,	%g6
	orcc	%l0,	0x0B9A,	%l5
	xor	%i2,	%g2,	%g5
	fmovdvs	%xcc,	%f30,	%f10
	sra	%l1,	0x01,	%i4
	call	loop_966
	nop
	set	0x54, %o6
	sth	%l2,	[%l7 + %o6]
	call	loop_967
	fmovscs	%xcc,	%f10,	%f24
loop_966:
	fmovrslz	%g7,	%f0,	%f8
	call	loop_968
loop_967:
	call	loop_969
	call	loop_970
	fzero	%f2
loop_968:
	nop
	setx	0x077D,	%l0,	%o0
	sdivcc	%i7,	%o0,	%g4
loop_969:
	nop
	setx	0x8673E3CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x8CFBA9FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f13,	%f4
loop_970:
	udivcc	%i5,	0x1780,	%o1
	fmovdl	%fcc2,	%f2,	%f6
	call	loop_971
	nop
	setx	0x01B99A95,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x4EAE4A9F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f27,	%f17
	smul	%o6,	%l3,	%o3
	smul	%o7,	0x15A1,	%l4
loop_971:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE4D, 	%hsys_tick_cmpr
	brlez,a,pt	%o5,	loop_972
	nop
	set	0x58, %i0
	stx	%g3,	[%l7 + %i0]
	fmovd	%f14,	%f30
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x34] %asi,	%f2
loop_972:
	movl	%fcc3,	0x542,	%i6
	srlx	%i3,	%i0,	%o4
	fmul8ulx16	%f20,	%f16,	%f4
	std	%f22,	[%l7 + 0x18]
	movue	%fcc3,	%i1,	%g1
	call	loop_973
	edge16	%l0,	%l5,	%i2
	fmovrdgz	%g6,	%f0,	%f14
	fmovdu	%fcc0,	%f28,	%f10
loop_973:
	call	loop_974
	fmovdvc	%icc,	%f20,	%f6
	fpadd16s	%f13,	%f15,	%f31
	call	loop_975
loop_974:
	movle	%fcc2,	%g2,	%g5
	nop
	fitos	%f0,	%f31
	fstod	%f31,	%f20
	edge8n	%i4,	%l2,	%g7
loop_975:
	movrgez	%l1,	%i7,	%o0
	rdhpr	%hsys_tick_cmpr,	%g4
	fxor	%f22,	%f0,	%f30
	fsrc2	%f16,	%f10
	call	loop_976
	call	loop_977
	wrpr	%i5,	%o1,	%tick
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x11,	 2
loop_976:
	movcs	%xcc,	%o3,	%o7
loop_977:
	call	loop_978
	call	loop_979
	fmovsvc	%icc,	%f3,	%f19
	fmovsgu	%xcc,	%f24,	%f25
loop_978:
	fmovd	%f26,	%f12
loop_979:
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f22
	fmovdle	%icc,	%f28,	%f0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o6
	bpos,a,pn	%icc,	loop_980
	rdpr	%cwp,	%l4
	call	loop_981
	call	loop_982
loop_980:
	fnot1	%f18,	%f20
	wr	%o2,	%o5,	%softint
loop_981:
	call	loop_983
loop_982:
	call	loop_984
	rdhpr	%hintp,	%l6
	fbu,a,pt	%fcc2,	loop_985
loop_983:
	tvc	%xcc,	0x6
loop_984:
	fpadd32s	%f8,	%f30,	%f16
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g3
loop_985:
	andncc	%i3,	%i0,	%o4
	tsubcc	%i6,	%i1,	%l0
	set	0x38, %i1
	swapa	[%l7 + %i1] 0x80,	%g1
	xor	%l5,	0x1D46,	%i2
	fmovda	%icc,	%f12,	%f2
	call	loop_986
	smulcc	%g6,	%g5,	%i4
	call	loop_987
	nop
	setx	0xC302A724,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xFA531DBD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f9,	%f5
loop_986:
	fmovscc	%icc,	%f23,	%f28
	call	loop_988
loop_987:
	fmovrdlez	%l2,	%f22,	%f6
	movu	%fcc3,	%g2,	%l1
	call	loop_989
loop_988:
	fmovspos	%xcc,	%f22,	%f25
	call	loop_990
	rdpr	%otherwin,	%g7
loop_989:
	call	loop_991
	fmovse	%fcc3,	%f29,	%f19
loop_990:
	call	loop_992
	call	loop_993
loop_991:
	sub	%i7,	%g4,	%i5
	add	%o0,	0x1D84,	%l3
loop_992:
	call	loop_994
loop_993:
	nop
	setx	0x6EB7A405D06DDC9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xC4BD33B43696EC35,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f20,	%f10
	nop
	set	0x32, %l1
	stb	%o3,	[%l7 + %l1]
	edge16l	%o7,	%o1,	%l4
loop_994:
	membar	0x19
	nop
	set	0x1C, %l0
	flush	%l7 + %l0
	sdivx	%o6,	0x09E4,	%o2
	edge8l	%o5,	%l6,	%i3
	fmovdvc	%icc,	%f2,	%f10
	bleu,a	%xcc,	loop_995
	call	loop_996
	nop
	fitos	%f11,	%f4
	fstod	%f4,	%f30
	movul	%fcc3,	0x11B,	%i0
loop_995:
	faligndata	%f8,	%f12,	%f18
loop_996:
	call	loop_997
	edge32n	%g3,	%o4,	%i1
	fmovsvc	%icc,	%f27,	%f20
	fmovdl	%xcc,	%f12,	%f22
loop_997:
	call	loop_998
	array8	%i6,	%g1,	%l0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 3
loop_998:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%i4,	0x1441,	%l2
	fmovsg	%xcc,	%f21,	%f26
	call	loop_999
	call	loop_1000
	edge8ln	%g2,	%g5,	%l1
	call	loop_1001
loop_999:
	movneg	%icc,	%g7,	%g4
loop_1000:
	fsrc1s	%f20,	%f24
	fbug,a	%fcc2,	loop_1002
loop_1001:
	rdhpr	%hintp,	%i7
	addcc	%i5,	%o0,	%o3
	call	loop_1003
loop_1002:
	call	loop_1004
	call	loop_1005
	fmovdvc	%icc,	%f22,	%f16
loop_1003:
	brlz,a,pt	%o7,	loop_1006
loop_1004:
	edge16	%o1,	%l3,	%o6
loop_1005:
	rdpr	%wstate,	%l4
	nop
	set	0x0C, %o4
	ldsw	[%l7 + %o4],	%o5
loop_1006:
	pdist	%f2,	%f28,	%f28
	bleu,a	%icc,	loop_1007
	call	loop_1008
	fandnot2	%f20,	%f16,	%f22
	taddcc	%o2,	0x06F5,	%i3
loop_1007:
	call	loop_1009
loop_1008:
	call	loop_1010
	fmovsuge	%fcc1,	%f22,	%f3
	tsubcctv	%i0,	%g3,	%l6
loop_1009:
	movu	%fcc2,	%i1,	%o4
loop_1010:
	fnot2s	%f8,	%f13
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fbul,a,pn	%fcc0,	loop_1011
	fnegd	%f30,	%f14
	call	loop_1012
	wr	%i6,	%l0,	%y
loop_1011:
	bcc,pn	%icc,	loop_1013
	fmovrslz	%l5,	%f23,	%f15
loop_1012:
	fpadd32s	%f5,	%f2,	%f8
	fmovsue	%fcc1,	%f16,	%f3
loop_1013:
	call	loop_1014
	call	loop_1015
	call	loop_1016
	movrlez	%i2,	0x1BB,	%g1
loop_1014:
	nop
	fitos	%f9,	%f7
	fstox	%f7,	%f20
loop_1015:
	fmul8x16au	%f15,	%f18,	%f26
loop_1016:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1017
	fmovscc	%icc,	%f29,	%f31
	fcmpne32	%f0,	%f30,	%g6
	xorcc	%i4,	%g2,	%l2
loop_1017:
	call	loop_1018
	fbue,a,pn	%fcc2,	loop_1019
	fnot1s	%f2,	%f29
	bpos	%xcc,	loop_1020
loop_1018:
	fexpand	%f24,	%f0
loop_1019:
	fmovrdlz	%l1,	%f20,	%f2
	call	loop_1021
loop_1020:
	orn	%g5,	0x1CB6,	%g4
	call	loop_1022
	movu	%fcc1,	0x7C6,	%g7
loop_1021:
	call	loop_1023
	xorcc	%i5,	%i7,	%o3
loop_1022:
	call	loop_1024
	fmovsg	%fcc3,	%f11,	%f11
loop_1023:
	tle	%icc,	0x0
	call	loop_1025
loop_1024:
	movcs	%xcc,	%o0,	%o7
	fmovdpos	%icc,	%f4,	%f18
	call	loop_1026
loop_1025:
	umul	%l3,	%o1,	%l4
	wr	%o6,	0x147A,	%y
	fnot1s	%f6,	%f28
loop_1026:
	fbue	%fcc1,	loop_1027
	call	loop_1028
	movl	%xcc,	%o2,	%i3
	fpsub16	%f20,	%f24,	%f30
loop_1027:
	call	loop_1029
loop_1028:
	ldd	[%l7 + 0x68],	%f22
	rdpr	%tba,	%o5
	alignaddr	%g3,	%l6,	%i1
loop_1029:
	edge8n	%i0,	%o4,	%i6
	call	loop_1030
	fornot1	%f20,	%f0,	%f28
	bmask	%l5,	%i2,	%g1
	fsrc2	%f30,	%f0
loop_1030:
	fandnot1	%f12,	%f12,	%f8
	nop
	fitos	%f13,	%f12
	fstoi	%f12,	%f21
	nop
	fitos	%f3,	%f23
	fstod	%f23,	%f6
	bl,a	%icc,	loop_1031
	array8	%l0,	%i4,	%g6
	andn	%g2,	%l1,	%g5
	fone	%f10
loop_1031:
	fmovscs	%icc,	%f26,	%f23
	fcmpgt16	%f22,	%f28,	%l2
	call	loop_1032
	bl,pn	%icc,	loop_1033
	call	loop_1034
	fmovsne	%fcc0,	%f1,	%f3
loop_1032:
	srax	%g7,	0x0E,	%g4
loop_1033:
	alignaddr	%i7,	%i5,	%o3
loop_1034:
	fmovdn	%icc,	%f26,	%f20
	fabsd	%f4,	%f22
	call	loop_1035
	call	loop_1036
	edge32n	%o0,	%l3,	%o7
	call	loop_1037
loop_1035:
	call	loop_1038
loop_1036:
	call	loop_1039
	call	loop_1040
loop_1037:
	fmovsvs	%icc,	%f28,	%f31
loop_1038:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1039:
	call	loop_1041
loop_1040:
	movrgez	%o6,	0x1B6,	%o2
	srlx	%l4,	%i3,	%g3
	fsrc2	%f24,	%f24
loop_1041:
	tsubcctv	%l6,	%o5,	%i0
	fors	%f31,	%f31,	%f14
	fpsub16s	%f21,	%f9,	%f21
	rdpr	%cansave,	%o4
	edge8	%i1,	%l5,	%i2
	fpadd32	%f10,	%f28,	%f12
	call	loop_1042
	call	loop_1043
	tcs	%xcc,	0x4
	addccc	%g1,	0x0B52,	%l0
loop_1042:
	orncc	%i4,	%i6,	%g2
loop_1043:
	nop
	fitos	%f6,	%f15
	fstox	%f15,	%f12
	fxtos	%f12,	%f17
	call	loop_1044
	call	loop_1045
	bmask	%g6,	%g5,	%l1
	nop
	setx	0xDCAB34D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xFF0CF8A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f20,	%f26
loop_1044:
	or	%g7,	0x1493,	%g4
loop_1045:
	call	loop_1046
	movug	%fcc0,	%l2,	%i7
	call	loop_1047
	fcmpeq32	%f12,	%f18,	%i5
loop_1046:
	edge8n	%o0,	%l3,	%o7
	fcmps	%fcc3,	%f6,	%f13
loop_1047:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f20,	[%l7 + 0x28] %asi
	tvc	%xcc,	0x1
	tgu	%icc,	0x7
	sir	0x0DE1
	call	loop_1048
	call	loop_1049
	edge16	%o3,	%o6,	%o2
	smulcc	%o1,	%i3,	%l4
loop_1048:
	call	loop_1050
loop_1049:
	fxors	%f19,	%f4,	%f25
	call	loop_1051
	fmovrslz	%l6,	%f15,	%f13
loop_1050:
	fabsd	%f20,	%f10
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g3
loop_1051:
	fmovsg	%xcc,	%f10,	%f2
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f20
	st	%f24,	[%l7 + 0x54]
	movrne	%o4,	%i1,	%l5
	mova	%fcc3,	0x0D1,	%i0
	nop
	set	0x34, %i2
	ldub	[%l7 + %i2],	%g1
	nop
	set	0x26, %g6
	lduh	[%l7 + %g6],	%l0
	rdhpr	%hsys_tick_cmpr,	%i4
	fexpand	%f4,	%f18
	call	loop_1052
	tg	%xcc,	0x5
	fmovsu	%fcc1,	%f4,	%f27
	call	loop_1053
loop_1052:
	fsrc1	%f14,	%f10
	fbl,pt	%fcc3,	loop_1054
	call	loop_1055
loop_1053:
	xnor	%i2,	%i6,	%g6
	brgez,a	%g2,	loop_1056
loop_1054:
	call	loop_1057
loop_1055:
	call	loop_1058
	movleu	%xcc,	%l1,	%g5
loop_1056:
	ldd	[%l7 + 0x58],	%g4
loop_1057:
	fands	%f10,	%f25,	%f23
loop_1058:
	wrpr	%g7,	0x0273,	%tick
	call	loop_1059
	call	loop_1060
	fpmerge	%f17,	%f20,	%f26
	nop
	setx	0xBBDBB992EE3186EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9DC3227E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsmuld	%f30,	%f0,	%f12
loop_1059:
	tle	%xcc,	0x6
loop_1060:
	tneg	%icc,	0x4
	fmovdneg	%icc,	%f28,	%f12
	fmovsle	%fcc1,	%f19,	%f12
	array8	%i7,	%i5,	%l2
	call	loop_1061
	call	loop_1062
	call	loop_1063
	call	loop_1064
loop_1061:
	fcmpgt16	%f8,	%f30,	%o0
loop_1062:
	tn	%xcc,	0x6
loop_1063:
	edge16n	%l3,	%o7,	%o3
loop_1064:
	umul	%o2,	%o1,	%o6
	call	loop_1065
	srax	%i3,	0x06,	%l4
	fbuge,pn	%fcc0,	loop_1066
	movrlz	%o5,	%l6,	%o4
loop_1065:
	fbge,a,pt	%fcc2,	loop_1067
	andn	%g3,	%l5,	%i1
loop_1066:
	call	loop_1068
	rd	%softint,	%g1
loop_1067:
	call	loop_1069
	fmovsule	%fcc0,	%f13,	%f30
loop_1068:
	rdhpr	%htba,	%l0
	fmovdg	%fcc3,	%f6,	%f0
loop_1069:
	nop
	setx	0xCF6710EE90920C0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x9E9BC3C5BEE90A41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f14,	%f8
	movpos	%icc,	0x630,	%i0
	fnegd	%f30,	%f30
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%i4
	edge8n	%i2,	%g6,	%i6
	rd	%pc,	%l1
	call	loop_1070
	call	loop_1071
	nop
	setx	0xCE072DF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x7F4C3C03,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f13,	%f15
	movlg	%fcc1,	%g5,	%g2
loop_1070:
	fmovdule	%fcc2,	%f26,	%f24
loop_1071:
	fmovdpos	%icc,	%f10,	%f6
	fmuld8sux16	%f14,	%f20,	%f30
	fmovdug	%fcc0,	%f12,	%f6
	array8	%g4,	%i7,	%i5
	set	0x40, %g2
	sta	%f25,	[%l7 + %g2] 0x88
	st	%f24,	[%l7 + 0x3C]
	fnegd	%f4,	%f16
	movvs	%xcc,	%g7,	%l2
	fmovrdlz	%o0,	%f22,	%f28
	swap	[%l7 + 0x28],	%o7
	fmovsneg	%icc,	%f10,	%f18
	call	loop_1072
	call	loop_1073
	fbge,a,pt	%fcc0,	loop_1074
	tn	%xcc,	0x4
loop_1072:
	edge8l	%o3,	%o2,	%l3
loop_1073:
	xor	%o6,	%i3,	%l4
loop_1074:
	membar	0x42
	call	loop_1075
	call	loop_1076
	fmovrdgez	%o5,	%f10,	%f30
	nop
	setx	0xB1052DE7CDF483DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_1075:
	nop
	wr	%g0,	0x0c,	%asi
	stwa	%o1,	[%l7 + 0x3C] %asi
loop_1076:
	wrpr 	%g0, 	0x1, 	%gl
	smul	%l5,	0x094C,	%o4
	subccc	%i1,	%l0,	%i0
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x34] %asi
	fbl,pt	%fcc2,	loop_1077
	fmovsneg	%icc,	%f14,	%f13
	fsrc2s	%f29,	%f13
	orn	%g1,	%g6,	%i2
loop_1077:
	edge8l	%i6,	%l1,	%g2
	wrpr 	%g0, 	0x1, 	%gl
	tge	%xcc,	0x4
	set	0x2B, %g7
	ldsba	[%l7 + %g7] 0x19,	%g4
	fmovdne	%icc,	%f8,	%f2
	call	loop_1078
	tle	%xcc,	0x3
	call	loop_1079
	bmask	%i7,	%i5,	%g7
loop_1078:
	call	loop_1080
	umulcc	%l2,	0x17C1,	%o7
loop_1079:
	nop
	set	0x40, %i7
	ldsb	[%l7 + %i7],	%o0
	fpack16	%f12,	%f27
loop_1080:
	fsrc2s	%f24,	%f14
	fbul,a	%fcc1,	loop_1081
	wrpr	%o3,	%l3,	%cwp
	call	loop_1082
	bneg	%xcc,	loop_1083
loop_1081:
	call	loop_1084
	wrpr	%o6,	0x0143,	%cwp
loop_1082:
	fcmpeq16	%f28,	%f20,	%i3
loop_1083:
	fmovdle	%fcc3,	%f16,	%f20
loop_1084:
	fmuld8sux16	%f1,	%f23,	%f16
	call	loop_1085
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 1
	movue	%fcc0,	0x200,	%o2
	wr	%o5,	0x0FF2,	%pic
loop_1085:
	call	loop_1086
	wrpr	%o1,	0x1B83,	%tick
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x4C] %asi,	%f29
loop_1086:
	movl	%icc,	%l4,	%g3
	call	loop_1087
	call	loop_1088
	call	loop_1089
	rd	%y,	%l5
loop_1087:
	call	loop_1090
loop_1088:
	call	loop_1091
loop_1089:
	andncc	%l6,	0x1C35,	%i1
	wrpr	%l0,	0x0191,	%pil
loop_1090:
	fmovspos	%icc,	%f10,	%f14
loop_1091:
	call	loop_1092
	fmovrdlz	%o4,	%f10,	%f6
	fors	%f17,	%f5,	%f1
	call	loop_1093
loop_1092:
	call	loop_1094
	call	loop_1095
	wr	%i0,	0x12C5,	%sys_tick
loop_1093:
	call	loop_1096
loop_1094:
	call	loop_1097
loop_1095:
	tne	%xcc,	0x1
	orcc	%g1,	0x08EC,	%i4
loop_1096:
	call	loop_1098
loop_1097:
	movrgez	%g6,	%i6,	%i2
	call	loop_1099
	nop
	setx	0x67C7CBC0F20260A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_1098:
	call	loop_1100
	edge8ln	%l1,	%g2,	%g5
loop_1099:
	rdhpr	%hintp,	%g4
	fandnot2s	%f30,	%f8,	%f23
loop_1100:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 36
!	Type a   	: 32
!	Type x   	: 13
!	Type cti   	: 152
!	Type f   	: 134
!	Type i   	: 133
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
	set	0x1,	%g1
	set	0x1,	%g2
	set	0x5,	%g3
	set	0xA,	%g4
	set	0x5,	%g5
	set	0x5,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xF,	%i1
	set	-0x1,	%i2
	set	-0xB,	%i3
	set	-0x0,	%i4
	set	-0x1,	%i5
	set	-0xC,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x14294117,	%l0
	set	0x5A2EF1C3,	%l1
	set	0x625A3272,	%l2
	set	0x3AB41F9C,	%l3
	set	0x0FCB1406,	%l4
	set	0x79256310,	%l5
	set	0x0A8E190E,	%l6
	!# Output registers
	set	-0x00A4,	%o0
	set	-0x15AD,	%o1
	set	0x1090,	%o2
	set	0x0125,	%o3
	set	-0x14F1,	%o4
	set	0x0749,	%o5
	set	0x1EE8,	%o6
	set	-0x1D0F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBDFA339D0326E6CC)
	INIT_TH_FP_REG(%l7,%f2,0x0AE8BB957C1F453B)
	INIT_TH_FP_REG(%l7,%f4,0x10A14AB63CEDE96E)
	INIT_TH_FP_REG(%l7,%f6,0x7F4CD936C01A54D4)
	INIT_TH_FP_REG(%l7,%f8,0xF1EDC4A441600BAA)
	INIT_TH_FP_REG(%l7,%f10,0x16FA584CE3F7A42B)
	INIT_TH_FP_REG(%l7,%f12,0x97FDCD0F0E17B20E)
	INIT_TH_FP_REG(%l7,%f14,0x1CC29468B1029BB5)
	INIT_TH_FP_REG(%l7,%f16,0x72A39AF5CF2E046B)
	INIT_TH_FP_REG(%l7,%f18,0x2F6B6EFB7235CECE)
	INIT_TH_FP_REG(%l7,%f20,0xCF3748161C004D63)
	INIT_TH_FP_REG(%l7,%f22,0x9D130875824C1B58)
	INIT_TH_FP_REG(%l7,%f24,0xBCD4B7D82735FE85)
	INIT_TH_FP_REG(%l7,%f26,0x0CB3A48982625C73)
	INIT_TH_FP_REG(%l7,%f28,0x665F8BADD8C92604)
	INIT_TH_FP_REG(%l7,%f30,0xF5C9654E794FB7F4)

	!# Execute Main Diag ..

	fmovrslz	%i7,	%f17,	%f25
	call	loop_1101
	fmovso	%fcc0,	%f7,	%f19
	fmovdo	%fcc3,	%f18,	%f10
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%i5
loop_1101:
	call	loop_1102
	membar	0x04
	fmovdue	%fcc2,	%f2,	%f0
	wrpr	%l2,	%o0,	%cwp
loop_1102:
	call	loop_1103
	call	loop_1104
	fcmpne32	%f28,	%f28,	%o3
	call	loop_1105
loop_1103:
	nop
	setx	0x9EF0B19A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xBFF23262,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f15,	%f10
loop_1104:
	fbn,a,pt	%fcc3,	loop_1106
	bgu,pt	%xcc,	loop_1107
loop_1105:
	call	loop_1108
	fnot2	%f12,	%f18
loop_1106:
	fmovrslz	%o7,	%f6,	%f15
loop_1107:
	edge32l	%l3,	%i3,	%o6
loop_1108:
	movpos	%xcc,	%o2,	%o1
	fmovsvs	%icc,	%f0,	%f25
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
	movleu	%xcc,	%g3,	%l5
	fandnot2s	%f6,	%f5,	%f14
	nop
	setx	0x420B40434EA7D4B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x8F17E4910152C3E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f28
	wr	%g0,	0xe3,	%asi
	stha	%l6,	[%l7 + 0x6A] %asi
	membar	#Sync
	edge8	%i1,	%l4,	%o4
	fnands	%f19,	%f9,	%f5
	fxnor	%f18,	%f12,	%f16
	fpackfix	%f14,	%f13
	flushw
	nop
	setx	0x0860,	%l0,	%i0
	sdivx	%l0,	%i0,	%g1
	fmovdule	%fcc0,	%f2,	%f18
	nop
	setx	0xEEE18CDE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f9
	fxnors	%f15,	%f11,	%f29
	call	loop_1109
	lduh	[%l7 + 0x14],	%i4
	call	loop_1110
	bvc,pt	%xcc,	loop_1111
loop_1109:
	call	loop_1112
	srax	%g6,	0x02,	%i2
loop_1110:
	call	loop_1113
loop_1111:
	call	loop_1114
loop_1112:
	brnz,a,pt	%l1,	loop_1115
	tvs	%xcc,	0x3
loop_1113:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x203, 	%hsys_tick_cmpr
loop_1114:
	call	loop_1116
loop_1115:
	fmuld8ulx16	%f0,	%f3,	%f20
	call	loop_1117
	call	loop_1118
loop_1116:
	tleu	%icc,	0x2
	call	loop_1119
loop_1117:
	call	loop_1120
loop_1118:
	movrlez	%g5,	%g4,	%i6
	wr	%i7,	%g7,	%ccr
loop_1119:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%l2
loop_1120:
	fbuge,pn	%fcc3,	loop_1121
	tne	%icc,	0x0
	bl,a	%xcc,	loop_1122
	rdpr	%pil,	%i5
loop_1121:
	bcs,a	%icc,	loop_1123
	nop
	setx	0x14EE3B4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x07D50353,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f20,	%f6
loop_1122:
	fnot2s	%f24,	%f11
	fandnot2	%f8,	%f12,	%f24
loop_1123:
	call	loop_1124
	fmovdle	%fcc0,	%f12,	%f2
	fmovsneg	%xcc,	%f15,	%f3
	call	loop_1125
loop_1124:
	wrpr	%o0,	0x1234,	%cwp
	movcc	%xcc,	%o3,	%l3
	call	loop_1126
loop_1125:
	fsrc2	%f6,	%f14
	bg,pt	%icc,	loop_1127
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1126:
	call	loop_1128
	bcc	%xcc,	loop_1129
loop_1127:
	andcc	%o7,	%o6,	%o2
	movgu	%xcc,	0x064,	%o1
loop_1128:
	udivx	%o5,	0x11C5,	%g3
loop_1129:
	fmovdule	%fcc2,	%f16,	%f12
	fandnot2	%f22,	%f10,	%f4
	nop
	set	0x34, %g5
	lduh	[%l7 + %g5],	%l5
	bneg,a	%xcc,	loop_1130
	srax	%i3,	0x0C,	%l6
	call	loop_1131
	fcmped	%fcc0,	%f10,	%f8
loop_1130:
	movrgez	%l4,	%o4,	%l0
	fmovdcc	%xcc,	%f14,	%f28
loop_1131:
	edge32n	%i1,	%i0,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7BD, 	%hsys_tick_cmpr
	wr	%g0,	0x5f,	%asi
	stxa	%i4,	[%g0 + 0x0] %asi
	swap	[%l7 + 0x10],	%i2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l1,	%g5
	call	loop_1132
	rdpr	%cwp,	%g2
	nop
	setx	0x1802DDF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x6423A5BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f18,	%f13
	stbar
loop_1132:
	fmovspos	%xcc,	%f14,	%f7
	call	loop_1133
	srax	%g4,	0x0C,	%i6
	fabss	%f20,	%f2
	fmovsl	%fcc3,	%f3,	%f8
loop_1133:
	call	loop_1134
	call	loop_1135
	call	loop_1136
	call	loop_1137
loop_1134:
	andncc	%g7,	%l2,	%i5
loop_1135:
	movrlez	%o0,	0x1E9,	%i7
loop_1136:
	wrpr	%o3,	0x16DF,	%tick
loop_1137:
	call	loop_1138
	fmovdne	%icc,	%f4,	%f16
	movo	%fcc0,	0x5A4,	%o7
	call	loop_1139
loop_1138:
	call	loop_1140
	call	loop_1141
	call	loop_1142
loop_1139:
	call	loop_1143
loop_1140:
	movu	%fcc3,	%l3,	%o2
loop_1141:
	fpsub16	%f2,	%f2,	%f2
loop_1142:
	fmul8x16	%f6,	%f20,	%f6
loop_1143:
	call	loop_1144
	fmovrsgz	%o6,	%f28,	%f22
	call	loop_1145
	tgu	%icc,	0x2
loop_1144:
	fmovdpos	%xcc,	%f28,	%f16
	movul	%fcc0,	%o5,	%o1
loop_1145:
	nop
	wr	%g0,	0xe2,	%asi
	stxa	%l5,	[%l7 + 0x08] %asi
	membar	#Sync
	fcmpd	%fcc2,	%f18,	%f22
	call	loop_1146
	call	loop_1147
	edge16l	%g3,	%l6,	%i3
	xnorcc	%o4,	0x0C4C,	%l4
loop_1146:
	nop
	fitos	%f13,	%f16
	fstoi	%f16,	%f0
loop_1147:
	fcmpgt16	%f2,	%f18,	%l0
	sir	0x1432
	call	loop_1148
	fandnot2s	%f16,	%f7,	%f28
	srl	%i1,	0x00,	%g1
	fcmple32	%f0,	%f28,	%i0
loop_1148:
	fandnot1s	%f24,	%f19,	%f31
	bg,a,pt	%xcc,	loop_1149
	nop
	setx	0xA88AE66BF692D0C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x8369E4AF0A97CAAE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f12,	%f12
	nop
	set	0x28, %i6
	ldsh	[%l7 + %i6],	%g6
	call	loop_1150
loop_1149:
	call	loop_1151
	call	loop_1152
	mulx	%i2,	%i4,	%g5
loop_1150:
	call	loop_1153
loop_1151:
	fmovsne	%fcc3,	%f8,	%f12
loop_1152:
	wr	%l1,	0x0D24,	%softint
	fnands	%f9,	%f7,	%f19
loop_1153:
	call	loop_1154
	fmovsleu	%xcc,	%f3,	%f1
	nop
	set	0x22, %g4
	lduh	[%l7 + %g4],	%g2
	call	loop_1155
loop_1154:
	sir	0x16B6
	subccc	%g4,	0x0340,	%g7
	fbo	%fcc2,	loop_1156
loop_1155:
	srax	%i6,	%l2,	%o0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%i5
loop_1156:
	andcc	%i7,	%o7,	%l3
	rdpr	%gl,	%o3
	fmovscc	%icc,	%f25,	%f27
	rd	%pc,	%o6
	fmovdvs	%xcc,	%f14,	%f2
	movleu	%xcc,	%o2,	%o5
	call	loop_1157
	edge16ln	%o1,	%g3,	%l5
	fmovdle	%fcc2,	%f18,	%f26
	fmul8x16al	%f11,	%f25,	%f20
loop_1157:
	umul	%i3,	%l6,	%l4
	rdhpr	%hintp,	%o4
	fmovdule	%fcc0,	%f14,	%f14
	andcc	%i1,	%l0,	%i0
	sethi	0x1A98,	%g6
	udivcc	%i2,	0x1D0C,	%g1
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%i4
	subcc	%l1,	0x19D3,	%g5
	te	%icc,	0x0
	call	loop_1158
	call	loop_1159
	fmovdneg	%xcc,	%f4,	%f4
	movrne	%g2,	0x1BA,	%g4
loop_1158:
	wr	%g7,	0x1F39,	%pic
loop_1159:
	call	loop_1160
	movul	%fcc2,	0x0B7,	%l2
	fnegs	%f15,	%f21
	fmovsn	%fcc0,	%f21,	%f26
loop_1160:
	orn	%o0,	0x0CE9,	%i5
	fble,a,pt	%fcc2,	loop_1161
	fmovdul	%fcc3,	%f28,	%f26
	bvc	%icc,	loop_1162
	fmovsu	%fcc1,	%f26,	%f17
loop_1161:
	xnorcc	%i7,	0x156F,	%i6
	fmul8x16	%f21,	%f14,	%f10
loop_1162:
	fbule,a,pt	%fcc3,	loop_1163
	rdhpr	%htba,	%o7
	mova	%xcc,	%o3,	%l3
	nop
	setx	0x7DB63D599BE96CFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x35D19084,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsmuld	%f2,	%f10,	%f4
loop_1163:
	fmovdg	%fcc1,	%f0,	%f26
	call	loop_1164
	call	loop_1165
	movl	%fcc1,	0x1EF,	%o2
	call	loop_1166
loop_1164:
	fnegs	%f7,	%f15
loop_1165:
	call	loop_1167
	nop
	setx	0x19622978E3E84EF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f20
loop_1166:
	taddcc	%o5,	0x0C86,	%o6
	fpack32	%f20,	%f2,	%f20
loop_1167:
	sdivx	%g3,	0x08FE,	%l5
	fpmerge	%f0,	%f4,	%f30
	bg,a	%xcc,	loop_1168
	array8	%o1,	%i3,	%l4
	fmovsug	%fcc2,	%f16,	%f31
	nop
	setx	0x19BA,	%l0,	%i1
	sdiv	%l6,	%i1,	%o4
loop_1168:
	nop
	set	0x11, %l3
	ldstub	[%l7 + %l3],	%i0
	fmovdge	%icc,	%f24,	%f0
	movrlz	%g6,	%l0,	%i2
	fmul8x16al	%f12,	%f17,	%f2
	brlz,a	%i4,	loop_1169
	wrpr	%l1,	%g5,	%tick
	fmovsne	%icc,	%f18,	%f17
	ba,a,pn	%icc,	loop_1170
loop_1169:
	taddcctv	%g2,	%g1,	%g7
	fmovsgu	%xcc,	%f18,	%f20
	sra	%g4,	%o0,	%l2
loop_1170:
	call	loop_1171
	nop
	setx	0x9AB71BD8C00C97D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f10
	nop
	setx	0xA1BBD038,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x90B1768B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f20,	%f3
	movvc	%xcc,	%i7,	%i5
loop_1171:
	xorcc	%i6,	0x090D,	%o3
	edge16l	%o7,	%l3,	%o5
	fpadd16s	%f10,	%f12,	%f10
	call	loop_1172
	nop
	set	0x10, %l5
	ldstub	[%l7 + %l5],	%o2
	array8	%o6,	%l5,	%o1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0A] %asi,	%g3
loop_1172:
	fnands	%f7,	%f10,	%f3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f0
	flushw
	lduh	[%l7 + 0x4C],	%l4
	fexpand	%f31,	%f6
	call	loop_1173
	fmovrsgez	%i3,	%f3,	%f5
	call	loop_1174
	call	loop_1175
loop_1173:
	fblg,a,pn	%fcc1,	loop_1176
	nop
	setx	0x16B0,	%l0,	%o4
	udiv	%i1,	%o4,	%l6
loop_1174:
	call	loop_1177
loop_1175:
	sll	%i0,	%g6,	%i2
loop_1176:
	nop
	setx	0xB26CD0275B973CB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f10
	nop
	setx	0xAE87E074,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x6D5778F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f27,	%f20
loop_1177:
	fpadd16	%f12,	%f24,	%f4
	call	loop_1178
	fmovdgu	%icc,	%f24,	%f6
	fnot2s	%f13,	%f19
	movuge	%fcc3,	0x4B4,	%i4
loop_1178:
	call	loop_1179
	fcmple16	%f6,	%f0,	%l0
	movue	%fcc2,	0x2B2,	%l1
	rd	%sys_tick_cmpr,	%g2
loop_1179:
	movle	%fcc2,	0x128,	%g1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fornot1s	%f4,	%f27,	%f13
	rdhpr	%hsys_tick_cmpr,	%g5
	fpack32	%f26,	%f8,	%f0
	call	loop_1180
	fpsub16	%f28,	%f8,	%f20
	call	loop_1181
	call	loop_1182
loop_1180:
	tne	%xcc,	0x5
	fmovso	%fcc1,	%f24,	%f11
loop_1181:
	edge8n	%g4,	%g7,	%l2
loop_1182:
	call	loop_1183
	fcmpd	%fcc1,	%f26,	%f24
	array16	%o0,	%i7,	%i6
	movrlz	%i5,	%o3,	%o7
loop_1183:
	fmovso	%fcc2,	%f20,	%f21
	call	loop_1184
	for	%f26,	%f4,	%f30
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x08] %asi,	%l3
loop_1184:
	edge8l	%o5,	%o2,	%l5
	fsrc1s	%f27,	%f10
	call	loop_1185
	rdhpr	%ver,	%o1
	call	loop_1186
	nop
	setx	0x125A,	%l0,	%l4
	udivcc	%g3,	%l4,	%i3
loop_1185:
	fmovduge	%fcc2,	%f16,	%f12
	rdhpr	%hintp,	%i1
loop_1186:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_1187
	call	loop_1188
	umul	%o4,	0x1192,	%l6
	tvc	%icc,	0x2
loop_1187:
	xor	%o6,	0x02A2,	%i0
loop_1188:
	nop
	setx	0x22AF0351,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	wr	%g6,	%i2,	%ccr
	movpos	%icc,	%l0,	%i4
	call	loop_1189
	taddcctv	%l1,	0x0257,	%g1
	fmovsvs	%icc,	%f11,	%f11
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x11,	%f16
loop_1189:
	nop
	fitos	%f14,	%f2
	fstod	%f2,	%f12
	fmovscc	%xcc,	%f24,	%f22
	call	loop_1190
	fbg,pt	%fcc1,	loop_1191
	call	loop_1192
	call	loop_1193
loop_1190:
	call	loop_1194
loop_1191:
	fones	%f20
loop_1192:
	call	loop_1195
loop_1193:
	call	loop_1196
loop_1194:
	move	%xcc,	%g5,	%g2
	tsubcctv	%g7,	0x190D,	%l2
loop_1195:
	fors	%f10,	%f27,	%f24
loop_1196:
	fmovsn	%fcc1,	%f22,	%f13
	fmovrde	%o0,	%f22,	%f16
	call	loop_1197
	call	loop_1198
	sir	0x0ECB
	fmovrdgz	%i7,	%f20,	%f28
loop_1197:
	smulcc	%i6,	0x1C63,	%i5
loop_1198:
	fcmple32	%f6,	%f30,	%o3
	andcc	%o7,	0x1898,	%g4
	nop
	setx	0xF8DB14A647567BFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x563B65561E287515,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f16,	%f28
	fmovrsgez	%l3,	%f3,	%f4
	bgu,pn	%icc,	loop_1199
	fmovsg	%xcc,	%f17,	%f22
	fmovdgu	%xcc,	%f30,	%f28
	fxnors	%f11,	%f25,	%f29
loop_1199:
	fbne,pt	%fcc1,	loop_1200
	movrlz	%o5,	%l5,	%o2
	fors	%f26,	%f11,	%f26
	rdhpr	%hsys_tick_cmpr,	%g3
loop_1200:
	edge16ln	%l4,	%o1,	%i3
	fmovsgu	%xcc,	%f30,	%f13
	call	loop_1201
	call	loop_1202
	wr	%o4,	%l6,	%softint
	call	loop_1203
loop_1201:
	call	loop_1204
loop_1202:
	call	loop_1205
	smul	%i1,	0x0CD0,	%o6
loop_1203:
	fpack16	%f18,	%f11
loop_1204:
	fbge,a	%fcc1,	loop_1206
loop_1205:
	call	loop_1207
	call	loop_1208
	udivx	%i0,	0x057A,	%g6
loop_1206:
	subc	%l0,	%i4,	%l1
loop_1207:
	movul	%fcc2,	0x11A,	%i2
loop_1208:
	fnot1	%f12,	%f2
	fcmpgt16	%f10,	%f14,	%g1
	fsrc1s	%f2,	%f27
	movne	%fcc1,	%g2,	%g7
	fmovdcc	%xcc,	%f14,	%f26
	edge16l	%g5,	%l2,	%o0
	nop
	setx	0x08E8E785F94347DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD1190077B68EBC75,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f10
	bmask	%i7,	%i5,	%i6
	call	loop_1209
	ta	%icc,	0x2
	fmovdneg	%xcc,	%f8,	%f18
	fmul8sux16	%f12,	%f28,	%f10
loop_1209:
	fbue,a,pt	%fcc3,	loop_1210
	ta	%icc,	0x4
	fmovrse	%o3,	%f9,	%f18
	fpsub32	%f30,	%f14,	%f8
loop_1210:
	smulcc	%g4,	0x075A,	%l3
	set	0x26, %l4
	ldsba	[%l7 + %l4] 0x11,	%o7
	movle	%fcc0,	%o5,	%l5
	movle	%xcc,	0x2F0,	%g3
	fmovdlg	%fcc2,	%f16,	%f28
	addccc	%l4,	%o2,	%o1
	nop
	set	0x3E, %o1
	ldsb	[%l7 + %o1],	%i3
	nop
	setx	0x59D8954CBC0006C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8C1C79A18BBF0F24,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f26,	%f24
	be,a	%icc,	loop_1211
	addccc	%o4,	0x09C7,	%i1
	call	loop_1212
	rdhpr	%hsys_tick_cmpr,	%l6
loop_1211:
	fmovsu	%fcc2,	%f22,	%f14
	fexpand	%f31,	%f10
loop_1212:
	fornot2s	%f4,	%f3,	%f12
	call	loop_1213
	nop
	setx	loop_1214,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012200001407,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wrpr	%o6,	%i0,	%pil
	fbug	%fcc1,	loop_1215
loop_1213:
	movn	%fcc3,	0x72D,	%g6
loop_1214:
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f28
	edge16n	%i4,	%l1,	%i2
loop_1215:
	ble,pt	%icc,	loop_1216
	wr	%g1,	0x0052,	%pic
	fpack32	%f10,	%f2,	%f28
	call	loop_1217
loop_1216:
	movpos	%xcc,	0x163,	%l0
	call	loop_1218
	array16	%g7,	%g5,	%g2
loop_1217:
	call	loop_1219
	fmovde	%fcc1,	%f10,	%f30
loop_1218:
	fandnot2	%f26,	%f26,	%f16
	nop
	fitod	%f4,	%f0
loop_1219:
	rd	%sys_tick_cmpr,	%o0
	tvc	%xcc,	0x4
	call	loop_1220
	call	loop_1221
	add	%i7,	%l2,	%i5
	fmul8sux16	%f14,	%f12,	%f24
loop_1220:
	call	loop_1222
loop_1221:
	call	loop_1223
	bgu	%icc,	loop_1224
	fcmpes	%fcc0,	%f4,	%f30
loop_1222:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1223:
	orncc	%g4,	0x03A6,	%i6
loop_1224:
	fmovsa	%xcc,	%f8,	%f17
	popc	%l3,	%o7
	tg	%xcc,	0x5
	tge	%xcc,	0x2
	sllx	%l5,	%g3,	%l4
	movule	%fcc0,	0x545,	%o2
	call	loop_1225
	nop
	set	0x60, %o5
	lduh	[%l7 + %o5],	%o5
	call	loop_1226
	fmovsgu	%xcc,	%f3,	%f18
loop_1225:
	tcs	%xcc,	0x6
	xnorcc	%i3,	%o1,	%i1
loop_1226:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
	move	%fcc1,	0x611,	%o6
	call	loop_1227
	wrpr	%i0,	0x17C1,	%pil
	ldstub	[%l7 + 0x15],	%o4
	fsrc1	%f26,	%f18
loop_1227:
	fnot1s	%f17,	%f8
	call	loop_1228
	call	loop_1229
	fmovdu	%fcc2,	%f6,	%f14
	call	loop_1230
loop_1228:
	call	loop_1231
loop_1229:
	fmovdvc	%xcc,	%f14,	%f4
	andn	%g6,	%i4,	%l1
loop_1230:
	call	loop_1232
loop_1231:
	fmul8sux16	%f12,	%f14,	%f22
	nop
	setx	0x4929FBC534D521BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x669F8E316083B0EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f28,	%f6
	fbg,a	%fcc3,	loop_1233
loop_1232:
	call	loop_1234
	fmovdleu	%icc,	%f12,	%f14
	bl	%xcc,	loop_1235
loop_1233:
	fcmpgt16	%f18,	%f24,	%g1
loop_1234:
	fmovso	%fcc0,	%f5,	%f16
	call	loop_1236
loop_1235:
	fnor	%f0,	%f8,	%f14
	set	0x20, %o7
	lda	[%l7 + %o7] 0x80,	%f22
loop_1236:
	fcmple16	%f22,	%f2,	%l0
	nop
	set	0x10, %o2
	stw	%i2,	[%l7 + %o2]
	be,pt	%xcc,	loop_1237
	fnegs	%f25,	%f14
	fmovrsgz	%g5,	%f9,	%f30
	stbar
loop_1237:
	call	loop_1238
	call	loop_1239
	fmovdlg	%fcc0,	%f20,	%f22
	fmul8x16	%f21,	%f10,	%f28
loop_1238:
	bl	%xcc,	loop_1240
loop_1239:
	xnor	%g2,	0x036D,	%g7
	fcmple32	%f12,	%f10,	%i7
	fmovs	%f13,	%f28
loop_1240:
	rdpr	%pil,	%l2
	fmovse	%xcc,	%f24,	%f23
	fnot1	%f20,	%f10
	fmovsgu	%xcc,	%f18,	%f1
	fbuge,pt	%fcc0,	loop_1241
	fnot2s	%f23,	%f10
	call	loop_1242
	fnegd	%f6,	%f22
loop_1241:
	tvc	%xcc,	0x0
	movne	%icc,	0x48E,	%o0
loop_1242:
	brgez,a	%i5,	loop_1243
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f15
	call	loop_1244
	fandnot2s	%f27,	%f0,	%f24
loop_1243:
	fmuld8ulx16	%f12,	%f3,	%f10
	faligndata	%f2,	%f20,	%f0
loop_1244:
	nop
	setx	0x180C,	%l0,	%g4
	sdiv	%o3,	%g4,	%i6
	call	loop_1245
	fmovrsgez	%o7,	%f31,	%f13
	bgu,a	%icc,	loop_1246
	smulcc	%l5,	%l3,	%g3
loop_1245:
	nop

loop_1246:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 31
!	Type a   	: 29
!	Type x   	: 15
!	Type cti   	: 146
!	Type f   	: 157
!	Type i   	: 122
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x9592DF70
.word 0x9978FD7C
.word 0x0760ECAD
.word 0x940C9936
.word 0x8D3BEA70
.word 0xAABD8A18
.word 0x652A5AE5
.word 0xF6C6F777
.word 0xBE8FCF4C
.word 0xC644ECDF
.word 0x2034823E
.word 0x64ADBF1B
.word 0x01054F83
.word 0xD18D44D2
.word 0xC7798005
.word 0x371B16FF
.word 0x0DB38123
.word 0x6EC30045
.word 0x9D062546
.word 0xEBDD77AD
.word 0x1AD671B5
.word 0x4760BBB0
.word 0xFA5F6664
.word 0x2AAD7358
.word 0x1CDD6EEB
.word 0x182A1136
.word 0xF9731FFB
.word 0xB6434BBF
.word 0x290A855B
.word 0xA1802EED
.word 0x2F0038BD
.word 0x19B35CBB
.word 0x04F43076
.word 0x703EE7CE
.word 0xB458DF3B
.word 0xC7C94343
.word 0x5BCABD6A
.word 0xBFB91CEB
.word 0xF67B5769
.word 0x51663785
.word 0xF8532B2D
.word 0x205B8B9C
.word 0x93A9F5CE
.word 0xCA7B40B2
.word 0xE32B3AF8
.word 0xBA938F67
.word 0x02BE6A01
.word 0x04698728
.word 0x526B8449
.word 0xCF23A78C
.word 0x3DB43F63
.word 0xE2703B2F
.word 0xECB284FC
.word 0xD7108E79
.word 0x4E17D879
.word 0x48E94505
.word 0x478D57A6
.word 0x72668552
.word 0x6C5A7449
.word 0x6D7A9858
.word 0x9347B5AC
.word 0x3FECD221
.word 0x9496CD44
.word 0x251DB6DF
.end
