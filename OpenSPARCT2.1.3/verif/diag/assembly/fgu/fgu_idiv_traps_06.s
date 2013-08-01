/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fgu_idiv_traps_06.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa3.pl FOCUS_SEED=77814722"
.ident "Thu Dec 11 11:46:40 CST 2003"
.ident "Using Instruction Hash for Focus :$Id: fgu_idiv_traps_06.s,v 1.4 2007/07/27 21:45:30 drp Exp $"
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
	set	0x6,	%g2
	set	0xA,	%g3
	set	0xD,	%g4
	set	0xD,	%g5
	set	0x7,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xF,	%i1
	set	-0x0,	%i2
	set	-0xE,	%i3
	set	-0xB,	%i4
	set	-0xC,	%i5
	set	-0xC,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x51A499A1,	%l0
	set	0x1A5EA169,	%l1
	set	0x0E012F2F,	%l2
	set	0x136EA529,	%l3
	set	0x1F6174C7,	%l4
	set	0x6893A142,	%l5
	set	0x577EEB05,	%l6
	!# Output registers
	set	-0x0F01,	%o0
	set	0x0409,	%o1
	set	-0x0957,	%o2
	set	-0x1692,	%o3
	set	-0x195C,	%o4
	set	-0x1826,	%o5
	set	0x08C0,	%o6
	set	-0x109F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	movrgz	%l0,	%i6,	%g2
	edge16ln	%l5,	%g4,	%l3
	fmovdn	%fcc3,	%f14,	%f22
	fpsub16	%f18,	%f10,	%f18
	fmovsue	%fcc0,	%f13,	%f0
	sdivcc	%l6,	%o2,	%g6
	nop
	fitod	%f8,	%f22
	fdtoi	%f22,	%f7
	call	loop_1
	call	loop_2
	call	loop_3
	nop
	setx	0x57A93ED9,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_1:
	tleu	%xcc,	0x0
loop_2:
	fornot2s	%f14,	%f15,	%f27
loop_3:
	rdpr	%pil,	%l1
	fandnot1	%f6,	%f4,	%f20
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i2
	call	loop_4
	xorcc	%g7,	0x0B6F,	%i1
	movuge	%fcc2,	%g5,	%o6
	orcc	%o4,	0x176B,	%g3
loop_4:
	movleu	%xcc,	%o7,	%o3
	fpsub16s	%f16,	%f4,	%f22
	movrne	%g1,	0x34A,	%o5
	call	loop_5
	nop
	setx	0xDD74D8C3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xDB893551,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f4,	%f4
	fand	%f14,	%f18,	%f12
	set	0x08, %g5
	stwa	%o1,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_5:
	edge16ln	%l2,	%i0,	%o0
	fmovdule	%fcc3,	%f14,	%f8
	xorcc	%l4,	%i4,	%i7
	fmovrdlez	%i5,	%f22,	%f30
	tle	%xcc,	0x6
	edge16	%l0,	%i6,	%g2
	fbne,a	%fcc1,	loop_6
	fmovdu	%fcc1,	%f18,	%f12
	rdhpr	%hintp,	%l5
	call	loop_7
loop_6:
	fmovrdgz	%i3,	%f12,	%f20
	fmovdpos	%xcc,	%f10,	%f6
	edge32n	%l3,	%g4,	%o2
loop_7:
	call	loop_8
	call	loop_9
	orcc	%g6,	%l1,	%l6
	call	loop_10
loop_8:
	bpos,pt	%xcc,	loop_11
loop_9:
	fcmpne32	%f12,	%f0,	%i2
	fbul	%fcc0,	loop_12
loop_10:
	umulcc	%g7,	0x199E,	%i1
loop_11:
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%g4
	fmovrdlez	%o4,	%f12,	%f4
loop_12:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%o7,	0x0D1A,	%o3
	fabss	%f12,	%f27
	fpadd32	%f8,	%f20,	%f10
	edge16l	%g3,	%o5,	%g1
	call	loop_13
	st	%f12,	[%l7 + 0x64]
	fbg	%fcc1,	loop_14
	wr	%o1,	0x16A1,	%y
loop_13:
	membar	0x38
	movue	%fcc2,	%l2,	%o0
loop_14:
	call	loop_15
	fmovsu	%fcc2,	%f8,	%f5
	fmovd	%f10,	%f20
	nop
	setx	0x3F970039,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x40CEAD88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f25,	%f10
loop_15:
	call	loop_16
	nop
	setx	0xB3CAD443,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x9B21B691,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f1,	%f12
	fsrc1	%f2,	%f2
	taddcc	%i0,	%i4,	%l4
loop_16:
	tvs	%xcc,	0x1
	fmovdcs	%icc,	%f8,	%f28
	set	0x67, %o7
	lduba	[%l7 + %o7] 0x04,	%i5
	call	loop_17
	fnand	%f12,	%f24,	%f6
	fcmpne16	%f2,	%f22,	%l0
	fnegd	%f20,	%f14
loop_17:
	movvs	%xcc,	0x173,	%i6
	call	loop_18
	call	loop_19
	popc	0x1371,	%g2
	call	loop_20
loop_18:
	mova	%fcc3,	0x559,	%i7
loop_19:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
loop_20:
	edge8n	%l3,	%g4,	%o2
	fmovrdne	%g6,	%f24,	%f14
	set	0x7F, %g3
	lduba	[%l7 + %g3] 0x89,	%l5
	nop
	setx	0x232583D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xCB4D4B1F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f6,	%f29
	call	loop_21
	call	loop_22
	fzero	%f30
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f8
loop_21:
	fbu,a	%fcc0,	loop_23
loop_22:
	call	loop_24
	fmovdvs	%xcc,	%f30,	%f16
	tn	%icc,	0x6
loop_23:
	fmovdn	%fcc3,	%f24,	%f0
loop_24:
	bvc,a	%xcc,	loop_25
	movue	%fcc1,	%l6,	%i2
	array32	%g7,	%i1,	%l1
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f19
loop_25:
	subc	%o4,	0x10CB,	%o6
	nop
	setx	0x5C0FF5E76DDF7D2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4E020408F3EB0394,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f4,	%f30
	fbne,pt	%fcc0,	loop_26
	edge32n	%g5,	%o7,	%o3
	fmovrdne	%g3,	%f28,	%f26
	edge16l	%g1,	%o1,	%l2
loop_26:
	movrlez	%o5,	%i0,	%o0
	addcc	%l4,	%i4,	%i5
	sub	%l0,	%i6,	%g2
	edge32	%i3,	%i7,	%g4
	call	loop_27
	movre	%o2,	0x2D3,	%g6
	call	loop_28
	movrlez	%l3,	%l6,	%i2
loop_27:
	call	loop_29
	fmul8x16	%f13,	%f24,	%f12
loop_28:
	call	loop_30
	sethi	0x02BB,	%l5
loop_29:
	fpack32	%f20,	%f2,	%f28
	fxnors	%f0,	%f20,	%f12
loop_30:
	call	loop_31
	fzero	%f6
	call	loop_32
	fpack16	%f14,	%f30
loop_31:
	movrlez	%i1,	%g7,	%o4
	fmovd	%f22,	%f26
loop_32:
	rd	%y,	%o6
	taddcc	%g5,	%l1,	%o3
	movre	%o7,	0x0D1,	%g3
	call	loop_33
	movrgz	%o1,	0x3A0,	%g1
	call	loop_34
	tleu	%xcc,	0x6
loop_33:
	fbe,a,pt	%fcc0,	loop_35
	nop
	setx	0x8E82D545,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_34:
	sethi	0x06B9,	%l2
	fmovrslez	%i0,	%f27,	%f18
loop_35:
	movuge	%fcc0,	0x7DA,	%o0
	call	loop_36
	call	loop_37
	call	loop_38
	movue	%fcc3,	%o5,	%i4
loop_36:
	call	loop_39
loop_37:
	srax	%l4,	0x18,	%l0
loop_38:
	call	loop_40
	xor	%i5,	%g2,	%i3
loop_39:
	taddcc	%i6,	%i7,	%o2
	fmovrdgz	%g6,	%f26,	%f28
loop_40:
	tsubcctv	%l3,	%l6,	%i2
	udiv	%l5,	0x00,	%g4
	tleu	%icc,	0x4
	sra	%i1,	0x18,	%o4
	fmovdlg	%fcc2,	%f28,	%f26
	fmuld8sux16	%f20,	%f27,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x471, 	%hsys_tick_cmpr
	call	loop_41
	tvc	%xcc,	0x2
	fpack32	%f2,	%f20,	%f16
	fmovsle	%fcc1,	%f28,	%f25
loop_41:
	call	loop_42
	call	loop_43
	call	loop_44
	call	loop_45
loop_42:
	call	loop_46
loop_43:
	call	loop_47
loop_44:
	movrlez	%g5,	0x23A,	%o6
loop_45:
	fcmple16	%f4,	%f4,	%o3
loop_46:
	sra	%l1,	0x17,	%o7
loop_47:
	fcmpne16	%f2,	%f4,	%o1
	call	loop_48
	swap	[%l7 + 0x10],	%g3
	movpos	%xcc,	0x54D,	%g1
	fmovsl	%xcc,	%f30,	%f9
loop_48:
	call	loop_49
	udivx	%l2,	%o0,	%o5
	nop
	setx	loop_50,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x002400001403,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%i0,	%i4,	%l0
loop_49:
	fmovdle	%xcc,	%f24,	%f16
	faligndata	%f8,	%f30,	%f4
loop_50:
	edge32n	%l4,	%i5,	%g2
	edge32ln	%i6,	%i3,	%i7
	nop
	setx	0x10F3E09F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xDA6E7791,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f30,	%f27
	nop
	setx	0xEB87108093C1550D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xBA5A69BF33FC21EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f18,	%f24
	fmovsvs	%xcc,	%f28,	%f30
	fcmpeq32	%f12,	%f4,	%o2
	fmovsu	%fcc3,	%f23,	%f10
	call	loop_51
	call	loop_52
	fors	%f23,	%f7,	%f15
	fmovrslez	%l3,	%f15,	%f11
loop_51:
	edge8n	%l6,	%i2,	%g6
loop_52:
	call	loop_53
	nop
	setx	0x70D9F5D41CB0C71C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f24
	fmovsle	%fcc0,	%f28,	%f2
	brz,a	%l5,	loop_54
loop_53:
	and	%g4,	%o4,	%g7
	tn	%xcc,	0x6
	call	loop_55
loop_54:
	call	loop_56
	call	loop_57
	nop
	fitos	%f0,	%f17
	fstox	%f17,	%f22
	fxtos	%f22,	%f24
loop_55:
	call	loop_58
loop_56:
	bcc,a,pt	%xcc,	loop_59
loop_57:
	fcmpgt16	%f16,	%f8,	%i1
	te	%icc,	0x6
loop_58:
	rd	%pc,	%g5
loop_59:
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f22
	subc	%o3,	%l1,	%o6
	call	loop_60
	edge32l	%o7,	%o1,	%g3
	call	loop_61
	fmovsn	%icc,	%f13,	%f1
loop_60:
	sra	%l2,	%o0,	%g1
	call	loop_62
loop_61:
	ta	%xcc,	0x2
	wrpr	%o5,	%i4,	%cwp
	call	loop_63
loop_62:
	udiv	%l0,	%l4,	%i5
	sdivcc	%i0,	0x00,	%i6
	brlz,pt	%i3,	loop_64
loop_63:
	fpadd32	%f2,	%f10,	%f24
	rdpr	%otherwin,	%g2
	tsubcctv	%o2,	%l3,	%i7
loop_64:
	call	loop_65
	sllx	%l6,	%i2,	%l5
	fmovdleu	%icc,	%f2,	%f16
	fmovrdgz	%g4,	%f16,	%f28
loop_65:
	movcc	%xcc,	0x02F,	%o4
	udivcc	%g7,	%i1,	%g6
	edge32n	%o3,	%l1,	%o6
	edge16l	%o7,	%o1,	%g3
	rdpr	%otherwin,	%l2
	tn	%xcc,	0x1
	fbul,a,pt	%fcc3,	loop_66
	call	loop_67
	bgu,pn	%icc,	loop_68
	edge8l	%o0,	%g5,	%g1
loop_66:
	call	loop_69
loop_67:
	call	loop_70
loop_68:
	rdpr	%tba,	%o5
	fzeros	%f30
loop_69:
	call	loop_71
loop_70:
	bgu	%xcc,	loop_72
	sdivx	%l0,	0x00,	%l4
	fmul8x16al	%f12,	%f17,	%f22
loop_71:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i4
loop_72:
	bleu,pn	%icc,	loop_73
	edge8	%i0,	%i6,	%i3
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f17
	call	loop_74
loop_73:
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f26
	fmovsneg	%xcc,	%f18,	%f4
	edge16n	%g2,	%o2,	%i5
loop_74:
	smulcc	%i7,	0x14D2,	%l6
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	call	loop_75
	sll	%i2,	%l5,	%g4
	fmovrdgz	%l3,	%f30,	%f22
	call	loop_76
loop_75:
	fandnot2	%f26,	%f20,	%f28
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	edge8n	%o4,	%i1,	%g6
loop_76:
	rdhpr	%hpstate,	%g7
	stb	%l1,	[%l7 + 0x7C]
	movuge	%fcc1,	0x0FC,	%o3
	nop
	setx	0x68C493A8BCD3C88A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x206CBAC8B2B9E78F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f22,	%f26
	call	loop_77
	st	%fsr,	[%l7 + 0x08]
	fones	%f14
	movug	%fcc0,	0x6EA,	%o7
loop_77:
	flushw
	pdist	%f20,	%f16,	%f6
	pdist	%f2,	%f6,	%f6
	call	loop_78
	call	loop_79
	tcs	%icc,	0x7
	movneg	%icc,	%o1,	%o6
loop_78:
	nop
	fitos	%f2,	%f21
	fstoi	%f21,	%f10
loop_79:
	fmovsuge	%fcc1,	%f17,	%f5
	call	loop_80
	bcc	%icc,	loop_81
	call	loop_82
	call	loop_83
loop_80:
	siam	0x3
loop_81:
	call	loop_84
loop_82:
	stx	%fsr,	[%l7 + 0x08]
loop_83:
	movvs	%xcc,	0x663,	%g3
	fpadd32	%f18,	%f26,	%f22
loop_84:
	sub	%l2,	%o0,	%g1
	nop
	setx	loop_85,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x024100001406,	%l0,	%l1
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
	call	loop_86
	fnegs	%f14,	%f2
	xnorcc	%o5,	0x057B,	%l0
loop_85:
	call	loop_87
loop_86:
	nop
	fitos	%f13,	%f14
	fstod	%f14,	%f16
	sra	%g5,	0x11,	%i4
	nop
	setx	0xF201D75D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x0598E860,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f12,	%f25
loop_87:
	fandnot1	%f26,	%f28,	%f30
	ldsb	[%l7 + 0x37],	%l4
	movle	%icc,	0x711,	%i0
	call	loop_88
	tn	%icc,	0x2
	nop
	setx	0xFBE04871,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xE21EA82B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f23,	%f16
	fmovd	%f12,	%f24
loop_88:
	fmovdne	%fcc2,	%f28,	%f22
	call	loop_89
	tvs	%icc,	0x3
	bn,pt	%icc,	loop_90
	edge8n	%i3,	%g2,	%i6
loop_89:
	movul	%fcc2,	%o2,	%i5
	tg	%icc,	0x2
loop_90:
	call	loop_91
	call	loop_92
	fmovdvs	%icc,	%f24,	%f8
	fmovse	%fcc1,	%f5,	%f17
loop_91:
	tvc	%icc,	0x0
loop_92:
	fmul8x16	%f31,	%f0,	%f10
	movrlz	%i7,	0x08C,	%l6
	lduw	[%l7 + 0x14],	%l5
	tne	%icc,	0x4
	fmovda	%fcc0,	%f22,	%f6
	call	loop_93
	call	loop_94
	fmovde	%fcc2,	%f26,	%f6
	call	loop_95
loop_93:
	call	loop_96
loop_94:
	fmovdcs	%xcc,	%f26,	%f0
	wrpr 	%g0, 	0x0, 	%gl
loop_95:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_96:
	addccc	%o4,	%i1,	%g6
	fmovrsgz	%g4,	%f10,	%f14
	call	loop_97
	call	loop_98
	movleu	%xcc,	0x3F6,	%l1
	fcmpeq32	%f12,	%f14,	%g7
loop_97:
	srlx	%o7,	0x09,	%o1
loop_98:
	fmul8x16al	%f2,	%f18,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_99
	fpmerge	%f31,	%f22,	%f14
	fmovdug	%fcc3,	%f4,	%f8
	wr	%l2,	0x0015,	%y
loop_99:
	fmovsne	%icc,	%f28,	%f4
	tl	%icc,	0x2
	fornot2s	%f18,	%f28,	%f6
	srlx	%o0,	0x0D,	%g1
	sdiv	%g3,	0x00,	%l0
	call	loop_100
	nop
	setx	loop_101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x022200001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	wr	%o5,	0x0FF5,	%ccr
	add	%i4,	0x1FF5,	%g5
loop_100:
	wr	%l4,	0x1EAF,	%softint
loop_101:
	fpackfix	%f4,	%f3
	st	%f27,	[%l7 + 0x28]
	ldsb	[%l7 + 0x5B],	%i0
	call	loop_102
	call	loop_103
	call	loop_104
	fmovduge	%fcc0,	%f2,	%f22
loop_102:
	nop
	set	0x66, %l6
	stb	%i3,	[%l7 + %l6]
loop_103:
	fornot1	%f12,	%f28,	%f24
loop_104:
	add	%i6,	%o2,	%i5
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g2
	fpackfix	%f12,	%f21
	call	loop_105
	fmovdvs	%xcc,	%f8,	%f18
	call	loop_106
	bshuffle	%f18,	%f0,	%f2
loop_105:
	fnot1s	%f31,	%f27
	taddcc	%l6,	0x06F7,	%i7
loop_106:
	nop
	setx	0x6C892CB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x7ADEEF68,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f14,	%f21
	edge8ln	%l5,	%i2,	%l3
	call	loop_107
	fbne,pn	%fcc2,	loop_108
	fmovdug	%fcc2,	%f8,	%f30
	fmovsgu	%icc,	%f13,	%f12
loop_107:
	wr	%i1,	%g6,	%softint
loop_108:
	fblg,a	%fcc0,	loop_109
	nop
	fitod	%f20,	%f2
	movug	%fcc1,	%g4,	%o4
	call	loop_110
loop_109:
	call	loop_111
	call	loop_112
	movrlez	%g7,	0x28C,	%l1
loop_110:
	call	loop_113
loop_111:
	movrgez	%o1,	0x1AB,	%o6
loop_112:
	nop
	set	0x08, %l4
	stda	%o6,	[%l7 + %l4] 0x2b
	membar	#Sync
loop_113:
	nop
	setx loop_114, %l0, %l1
	jmpl %l1, %o3
	call	loop_115
	bne,pt	%xcc,	loop_116
	sub	%l2,	%o0,	%g1
loop_114:
	tneg	%icc,	0x2
loop_115:
	sra	%g3,	0x1B,	%o5
loop_116:
	tneg	%icc,	0x0
	srl	%l0,	%g5,	%i4
	udivcc	%i0,	0x00,	%i3
	nop
	fitos	%f6,	%f15
	fstoi	%f15,	%f7
	nop
	fitod	%f12,	%f30
	fdtos	%f30,	%f30
	sethi	0x05B1,	%i6
	call	loop_117
	call	loop_118
	call	loop_119
	fmovsue	%fcc0,	%f10,	%f30
loop_117:
	edge8n	%l4,	%i5,	%g2
loop_118:
	call	loop_120
loop_119:
	array32	%l6,	%i7,	%o2
	stx	%fsr,	[%l7 + 0x68]
	nop
	setx	loop_121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x014400001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_120:
	edge16ln	%i2,	%l5,	%l3
	bl,pt	%icc,	loop_122
	call	loop_123
loop_121:
	call	loop_124
	array8	%i1,	%g4,	%g6
loop_122:
	call	loop_125
loop_123:
	call	loop_126
loop_124:
	call	loop_127
	edge32n	%g7,	%o4,	%l1
loop_125:
	edge32	%o6,	%o1,	%o3
loop_126:
	call	loop_128
loop_127:
	subc	%o7,	%o0,	%l2
	fxors	%f6,	%f30,	%f4
	call	loop_129
loop_128:
	call	loop_130
	fbu,a,pn	%fcc3,	loop_131
	nop
	setx	0x09CE9ECF792CF05E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x71FBE4A4E3064E88,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f12,	%f26
loop_129:
	call	loop_132
loop_130:
	rd	%pc,	%g1
loop_131:
	movuge	%fcc0,	%g3,	%o5
	fcmpgt32	%f16,	%f2,	%g5
loop_132:
	wrpr 	%g0, 	0x0, 	%gl
	sdivcc	%i3,	%l0,	%l4
	call	loop_133
	movn	%fcc3,	%i5,	%i6
	fmovdg	%xcc,	%f4,	%f30
	call	loop_134
loop_133:
	call	loop_135
	bshuffle	%f14,	%f16,	%f28
	sll	%l6,	0x18,	%g2
loop_134:
	call	loop_136
loop_135:
	ba,a,pt	%xcc,	loop_137
	call	loop_138
	movl	%fcc3,	0x59A,	%o2
loop_136:
	call	loop_139
loop_137:
	taddcctv	%i2,	0x033D,	%i7
loop_138:
	movcs	%icc,	%l5,	%l3
	fmovdule	%fcc3,	%f20,	%f4
loop_139:
	fcmpeq16	%f24,	%f2,	%g4
	fmovrsne	%g6,	%f12,	%f10
	andncc	%g7,	0x1B41,	%o4
	nop
	setx	0x74BB6C875A121295,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xBBE061A531061FC7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f20,	%f4
	fpackfix	%f18,	%f23
	call	loop_140
	sra	%i1,	%o6,	%o1
	call	loop_141
	call	loop_142
loop_140:
	edge8	%o3,	%o7,	%l1
	nop
	fitos	%f1,	%f1
	fstox	%f1,	%f12
	fxtos	%f12,	%f16
loop_141:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%o0
loop_142:
	nop
	set	0x0C, %l0
	ldsw	[%l7 + %l0],	%g3
	sethi	0x0C74,	%o5
	call	loop_143
	mulx	%g5,	%i4,	%g1
	call	loop_144
	bmask	%i0,	%l0,	%l4
loop_143:
	movcs	%icc,	%i3,	%i6
	movue	%fcc2,	0x475,	%i5
loop_144:
	fmovdl	%fcc2,	%f16,	%f12
	nop
	setx	loop_145,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x002200001402,	%l0,	%l1
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
	set	0x1F, %g7
	ldsb	[%l7 + %g7],	%g2
	call	loop_146
	fors	%f7,	%f13,	%f27
loop_145:
	call	loop_147
	wrpr	%o2,	0x1BBE,	%tick
loop_146:
	wrpr	%i2,	0x1D5F,	%cwp
	set	0x44, %g1
	ldswa	[%l7 + %g1] 0x18,	%i7
loop_147:
	rdhpr	%hintp,	%l6
	rdhpr	%hintp,	%l3
	mulscc	%g4,	0x0AFA,	%g6
	call	loop_148
	fsrc1	%f24,	%f18
	fmul8ulx16	%f20,	%f2,	%f22
	fcmpd	%fcc1,	%f26,	%f12
loop_148:
	nop
	setx	0xA81735D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB0955466,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f30,	%f25
	swap	[%l7 + 0x74],	%g7
	call	loop_149
	tl	%xcc,	0x4
	fmovsvs	%icc,	%f10,	%f23
	fpsub16	%f30,	%f24,	%f12
loop_149:
	call	loop_150
	sra	%o4,	0x0B,	%l5
	fmovdu	%fcc3,	%f4,	%f14
loop_150:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 28
!	Type a   	: 25
!	Type x   	: 9
!	Type cti   	: 150
!	Type f   	: 138
!	Type i   	: 150
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
	set	0xA,	%g2
	set	0x1,	%g3
	set	0xD,	%g4
	set	0x2,	%g5
	set	0x2,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0xD,	%i1
	set	-0x2,	%i2
	set	-0x3,	%i3
	set	-0x3,	%i4
	set	-0xE,	%i5
	set	-0xD,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x0EB68F7E,	%l0
	set	0x51B51C82,	%l1
	set	0x2B0A000B,	%l2
	set	0x6AC14337,	%l3
	set	0x30AAD22A,	%l4
	set	0x2084C9DB,	%l5
	set	0x715714CC,	%l6
	!# Output registers
	set	-0x03C3,	%o0
	set	-0x0846,	%o1
	set	0x0240,	%o2
	set	-0x0C4B,	%o3
	set	-0x16B5,	%o4
	set	0x1F94,	%o5
	set	0x1ACA,	%o6
	set	-0x0AA4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	fornot2s	%f26,	%f13,	%f20
	movleu	%icc,	0x763,	%i1
	call	loop_151
	fmovsneg	%icc,	%f2,	%f26
	movrlz	%o1,	0x3A5,	%o3
	call	loop_152
loop_151:
	fmovda	%icc,	%f10,	%f10
	call	loop_153
	umul	%o6,	%o7,	%l2
loop_152:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x7C] %asi,	%f24
loop_153:
	fmovrdlz	%o0,	%f12,	%f30
	call	loop_154
	nop
	fitos	%f5,	%f29
	fstoi	%f29,	%f10

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	setx	0xA81F58F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_154:
	nop
	setx	0xF327DD28A32B92D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5934BB2F320D71BA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f18,	%f28
	nop
	fitod	%f12,	%f20
	fdtoi	%f20,	%f8
	call	loop_155
	fcmpd	%fcc3,	%f4,	%f8
	edge8l	%l1,	%i4,	%g1
	fors	%f10,	%f17,	%f18
loop_155:
	nop
	fitos	%f0,	%f13
	fstox	%f13,	%f6
	call	loop_156
	movrlz	%g5,	%i0,	%l0
	sub	%l4,	%i6,	%i5
	rdpr	%gl,	%i3
loop_156:
	fxnor	%f24,	%f6,	%f0
	fmovdgu	%icc,	%f28,	%f16
	ld	[%l7 + 0x14],	%f4
	fnors	%f21,	%f11,	%f6
	call	loop_157
	edge8l	%o2,	%i2,	%i7
	udivx	%g2,	0x00,	%l3
	call	loop_158
loop_157:
	call	loop_159
	fcmpne16	%f30,	%f26,	%l6
	fones	%f10
loop_158:
	fbuge,pt	%fcc1,	loop_160
loop_159:
	fmovsle	%icc,	%f25,	%f25
	smulcc	%g6,	0x150E,	%g4
	call	loop_161
loop_160:
	wrpr	%o4,	%l5,	%cwp
	rdhpr	%ver,	%g7
	udivcc	%o1,	%o3,	%i1
loop_161:
	taddcc	%o7,	0x1C3C,	%o6
	fbu,pt	%fcc0,	loop_162
	fmovdneg	%icc,	%f14,	%f20
	nop
	fitod	%f0,	%f4
	subccc	%l2,	%g3,	%o0
loop_162:
	call	loop_163
	fandnot2s	%f14,	%f7,	%f13
	call	loop_164
	call	loop_165
loop_163:
	call	loop_166
	tneg	%xcc,	0x3
loop_164:
	call	loop_167
loop_165:
	movrne	%o5,	%i4,	%g1
loop_166:
	fmovrse	%g5,	%f28,	%f1
	fmovsuge	%fcc0,	%f18,	%f8
loop_167:
	movrgz	%l1,	0x3F4,	%i0
	call	loop_168
	fornot1s	%f22,	%f18,	%f15
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x64] %asi,	%l4
loop_168:
	call	loop_169
	nop
	setx	0x7FE8E497,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x625367F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f14,	%f19
	call	loop_170
	call	loop_171
loop_169:
	fnegd	%f6,	%f16
	movvc	%xcc,	%i6,	%i5
loop_170:
	movneg	%xcc,	0x100,	%i3
loop_171:
	call	loop_172
	fmovrslez	%o2,	%f31,	%f15
	movne	%xcc,	%i2,	%i7
	call	loop_173
loop_172:
	bcc	%icc,	loop_174
	fbu,pn	%fcc1,	loop_175
	movo	%fcc3,	%l0,	%l3
loop_173:
	edge8ln	%l6,	%g6,	%g4
loop_174:
	fxnors	%f20,	%f18,	%f9
loop_175:
	nop
	setx	0x9ABF9298A67B7124,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f8
	tn	%icc,	0x4
	bpos,pt	%xcc,	loop_176
	fmovdcc	%xcc,	%f24,	%f26
	edge16ln	%g2,	%l5,	%g7
	popc	0x0B0E,	%o4
loop_176:
	tge	%icc,	0x5
	nop
	setx	0x60E99FE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xBE4E79B5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f0,	%f7
	wr	%g0,	0x81,	%asi
	sta	%f12,	[%l7 + 0x40] %asi
	nop
	setx	0x8F33754D868E366D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x342355AB4056F142,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f26,	%f16
	fabss	%f25,	%f19
	call	loop_177
	array8	%o1,	%o3,	%i1
	call	loop_178
	fmovsle	%fcc1,	%f15,	%f31
loop_177:
	fcmpes	%fcc0,	%f10,	%f0
	wr	%o6,	0x18F5,	%pic
loop_178:
	fmovrsne	%l2,	%f17,	%f2
	call	loop_179
	fpsub32	%f4,	%f2,	%f4
	fmovdne	%icc,	%f16,	%f2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x59] %asi,	%g3
loop_179:
	movge	%icc,	%o0,	%o5
	rdhpr	%ver,	%o7
	fmovsleu	%icc,	%f5,	%f13
	orcc	%g1,	0x18FE,	%i4
	edge32ln	%g5,	%l1,	%l4
	fmovdul	%fcc3,	%f22,	%f10
	bcc,a	%icc,	loop_180
	movug	%fcc1,	0x7C8,	%i0
	stx	%i5,	[%l7 + 0x58]
	srl	%i6,	%o2,	%i2
loop_180:
	call	loop_181
	fcmple16	%f26,	%f6,	%i3
	fxors	%f29,	%f0,	%f5
	fmovdne	%fcc0,	%f12,	%f24
loop_181:
	call	loop_182
	wr	%l0,	%l3,	%softint
	tn	%icc,	0x7
	wr	%i7,	0x0CE0,	%ccr
loop_182:
	call	loop_183
	call	loop_184
	call	loop_185
	call	loop_186
loop_183:
	call	loop_187
loop_184:
	rdhpr	%ver,	%g6
loop_185:
	fblg,a,pt	%fcc0,	loop_188
loop_186:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_187:
	nop
	fitod	%f0,	%f18
	fdtoi	%f18,	%f5
	smulcc	%l6,	0x00AB,	%g4
loop_188:
	fsrc2	%f2,	%f4
	movl	%fcc2,	%l5,	%g7
	tn	%icc,	0x7
	fnors	%f11,	%f22,	%f14
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f10
	call	loop_189
	fmovdcc	%icc,	%f30,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x937, 	%hsys_tick_cmpr
	call	loop_190
loop_189:
	call	loop_191
	sllx	%o4,	0x07,	%o1
	movrgez	%i1,	0x3DE,	%o3
loop_190:
	call	loop_192
loop_191:
	call	loop_193
	wr	%o6,	%g3,	%softint
	sethi	0x0044,	%l2
loop_192:
	call	loop_194
loop_193:
	add	%o0,	0x19A9,	%o5
	tne	%xcc,	0x4
	call	loop_195
loop_194:
	array8	%o7,	%g1,	%i4
	membar	0x22
	fcmpeq32	%f30,	%f18,	%l1
loop_195:
	te	%icc,	0x1
	call	loop_196
	srax	%l4,	%g5,	%i5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 2
loop_196:
	xnorcc	%i6,	%o2,	%i3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%l3
	fmovdcc	%xcc,	%f24,	%f30
	fmovso	%fcc2,	%f10,	%f25
	call	loop_197
	wr	%i7,	0x176A,	%ccr
	fmovso	%fcc0,	%f6,	%f1
	add	%g6,	0x07FF,	%i2
loop_197:
	tle	%icc,	0x3
	nop
	setx	loop_198,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x021400001406,	%l0,	%l1
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
	rd	%softint,	%g4
	wr	%l5,	%g7,	%ccr
	edge32ln	%l6,	%o4,	%g2
loop_198:
	call	loop_199
	fcmped	%fcc3,	%f2,	%f6
	nop
	fitos	%f7,	%f28
	rdhpr	%ver,	%o1
loop_199:
	fmul8x16	%f29,	%f30,	%f26
	fbule	%fcc1,	loop_200
	call	loop_201
	nop
	set	0x3E, %i3
	stb	%o3,	[%l7 + %i3]
	ta	%xcc,	0x5
loop_200:
	nop
	fitos	%f11,	%f21
	fstox	%f21,	%f24
	fxtos	%f24,	%f9
loop_201:
	smul	%i1,	0x0799,	%g3
	call	loop_202
	prefetch	[%l7 + 0x18],	 0
	nop
	setx	0x5C16B94B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f14
	array32	%o6,	%o0,	%l2
loop_202:
	fmovsule	%fcc0,	%f25,	%f26
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%o6
	edge16	%o5,	%i4,	%l1
	stbar
	brz	%l4,	loop_203
	sdivcc	%g5,	0x00,	%i5
	movleu	%xcc,	0x53A,	%i0
	call	loop_204
loop_203:
	call	loop_205
	call	loop_206
	brlz	%i6,	loop_207
loop_204:
	tleu	%icc,	0x3
loop_205:
	fmovda	%fcc1,	%f20,	%f28
loop_206:
	call	loop_208
loop_207:
	call	loop_209
	fmuld8sux16	%f0,	%f7,	%f0
	call	loop_210
loop_208:
	call	loop_211
loop_209:
	subcc	%o2,	0x1D26,	%g1
	call	loop_212
loop_210:
	call	loop_213
loop_211:
	fmul8ulx16	%f22,	%f10,	%f30
	subccc	%i3,	%l3,	%i7
loop_212:
	movvc	%xcc,	%g6,	%l0
loop_213:
	call	loop_214
	fmovscc	%icc,	%f3,	%f28
	nop
	setx	0x4868CE5BA00E302C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x16C05F1C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f18,	%f10
	rd	%sys_tick_cmpr,	%g4
loop_214:
	fmovdge	%xcc,	%f6,	%f30
	umul	%l5,	%i2,	%g7
	set	0x53, %l2
	lduba	[%l7 + %l2] 0x11,	%o4
	tcc	%icc,	0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovsue	%fcc3,	%f26,	%f4
	movue	%fcc2,	0x3F2,	%g2
	nop
	setx	0x90A649E7E2C0617B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	nop
	fitos	%f6,	%f27
	fstox	%f27,	%f6
	fxtos	%f6,	%f31
	bg	%xcc,	loop_215
	call	loop_216
	movl	%icc,	0x4BC,	%o3
	bleu	%xcc,	loop_217
loop_215:
	wrpr	%g3,	%i1,	%pil
loop_216:
	nop
	setx	0x8AA233C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xC0D985A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f13,	%f24
	fmovsl	%fcc3,	%f0,	%f18
loop_217:
	call	loop_218
	call	loop_219
	call	loop_220
	nop
	setx	0x25CF9A95E9427C86,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD246DFF28011AA6B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f6,	%f24
loop_218:
	call	loop_221
loop_219:
	fmovdne	%fcc2,	%f22,	%f10
loop_220:
	srl	%o0,	0x05,	%l2
	fxnor	%f18,	%f8,	%f28
loop_221:
	addc	%o7,	%o6,	%i4
	edge32	%o5,	%l4,	%g5
	swap	[%l7 + 0x28],	%i5
	fornot1s	%f26,	%f23,	%f30
	wr	%l1,	%i0,	%set_softint
	st	%fsr,	[%l7 + 0x10]
	call	loop_222
	nop
	fitos	%f9,	%f18
	fstox	%f18,	%f14
	fmovdgu	%icc,	%f16,	%f30
	fornot2s	%f19,	%f19,	%f21
loop_222:
	fmovdge	%fcc0,	%f8,	%f6
	call	loop_223
	fpsub32	%f20,	%f8,	%f8
	call	loop_224
	fmuld8sux16	%f26,	%f17,	%f24
loop_223:
	smul	%o2,	0x1B89,	%g1
	fxors	%f19,	%f23,	%f6
loop_224:
	call	loop_225
	fnand	%f8,	%f0,	%f24
	fmovdl	%fcc1,	%f0,	%f4
	ta	%xcc,	0x6
loop_225:
	bgu,pn	%xcc,	loop_226
	fmuld8sux16	%f6,	%f23,	%f22
	fmovsneg	%icc,	%f24,	%f13
	srlx	%i6,	0x04,	%i3
loop_226:
	nop
	set	0x5C, %o1
	lduba	[%l7 + %o1] 0x19,	%l3
	st	%fsr,	[%l7 + 0x50]
	mova	%fcc2,	%g6,	%i7
	edge16ln	%l0,	%g4,	%l5
	lduw	[%l7 + 0x78],	%g7
	set	0x10, %i2
	stda	%i2,	[%l7 + %i2] 0x2b
	membar	#Sync
	wr	%g0,	0x18,	%asi
	stwa	%l6,	[%l7 + 0x44] %asi
	call	loop_227
	call	loop_228
	call	loop_229
	fpadd32s	%f5,	%f17,	%f30
loop_227:
	fmovsug	%fcc1,	%f20,	%f16
loop_228:
	call	loop_230
loop_229:
	wr	%o1,	0x1C55,	%clear_softint
	movleu	%xcc,	%g2,	%o4
	rdhpr	%hintp,	%o3
loop_230:
	nop
	fitod	%f23,	%f2
	movle	%fcc0,	%g3,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fone	%f8
	orcc	%i1,	0x19F2,	%i4
	call	loop_231
	fzero	%f2
	movue	%fcc2,	%o5,	%o6
	fandnot1s	%f13,	%f11,	%f20
loop_231:
	fpack16	%f0,	%f29
	call	loop_232
	call	loop_233
	edge16n	%g5,	%l4,	%l1
	tn	%xcc,	0x1
loop_232:
	fmovrsgez	%i5,	%f6,	%f26
loop_233:
	fornot2	%f14,	%f0,	%f16
	call	loop_234
	or	%i0,	0x0417,	%g1
	nop
	fitod	%f31,	%f28
	fbo,a	%fcc1,	loop_235
loop_234:
	call	loop_236
	fmovsue	%fcc2,	%f8,	%f27
	bn,pt	%xcc,	loop_237
loop_235:
	fbg,pn	%fcc2,	loop_238
loop_236:
	edge8ln	%o2,	%i6,	%i3
	call	loop_239
loop_237:
	bgu,a	%icc,	loop_240
loop_238:
	sethi	0x0AA4,	%l3
	call	loop_241
loop_239:
	call	loop_242
loop_240:
	tg	%icc,	0x3
	call	loop_243
loop_241:
	wrpr	%g6,	%l0,	%tick
loop_242:
	call	loop_244
	ld	[%l7 + 0x70],	%f16
loop_243:
	call	loop_245
	mova	%icc,	0x492,	%g4
loop_244:
	edge16ln	%l5,	%i7,	%i2
	rdpr	%tba,	%l6
loop_245:
	fpack16	%f26,	%f25
	fbuge	%fcc2,	loop_246
	fmovdgu	%xcc,	%f16,	%f22
	sra	%o1,	%g7,	%o4
	wr	%g0,	0x0c,	%asi
	stwa	%o3,	[%l7 + 0x14] %asi
loop_246:
	movle	%xcc,	%g3,	%o0
	bvc,a,pn	%icc,	loop_247
	nop
	fitos	%f8,	%f25
	fstoi	%f25,	%f23
	call	loop_248
	call	loop_249
loop_247:
	call	loop_250
	call	loop_251
loop_248:
	tcc	%xcc,	0x4
loop_249:
	call	loop_252
loop_250:
	call	loop_253
loop_251:
	fmovsn	%icc,	%f29,	%f4
	fbg,pn	%fcc3,	loop_254
loop_252:
	fxnor	%f0,	%f24,	%f16
loop_253:
	tgu	%icc,	0x1
	fmovdue	%fcc3,	%f28,	%f16
loop_254:
	fmuld8ulx16	%f11,	%f12,	%f28
	udivcc	%g2,	%o7,	%l2
	fnot2	%f20,	%f24
	fbe	%fcc0,	loop_255
	edge8l	%i1,	%i4,	%o5
	call	loop_256
	movvc	%icc,	%o6,	%g5
loop_255:
	call	loop_257
	fmovdcc	%xcc,	%f14,	%f28
loop_256:
	fmovsule	%fcc0,	%f21,	%f10
	fsrc1s	%f21,	%f17
loop_257:
	and	%l4,	%i5,	%i0
	brgez,pt	%g1,	loop_258
	call	loop_259
	fcmpne16	%f14,	%f12,	%o2
	te	%xcc,	0x5
loop_258:
	addccc	%l1,	0x0CC7,	%i6
loop_259:
	call	loop_260
	fmovdvs	%xcc,	%f8,	%f8
	fmuld8sux16	%f0,	%f15,	%f4
	fmovrsne	%i3,	%f22,	%f6
loop_260:
	call	loop_261
	and	%l3,	0x028B,	%l0
	fcmpd	%fcc2,	%f20,	%f18
	fcmpd	%fcc0,	%f30,	%f8
loop_261:
	sethi	0x1D3B,	%g6
	popc	0x02CE,	%g4
	fmovdul	%fcc2,	%f4,	%f14
	fmovsneg	%xcc,	%f6,	%f27
	edge32l	%i7,	%i2,	%l5
	fmovdgu	%icc,	%f28,	%f30
	bleu,a	%icc,	loop_262
	fpack32	%f18,	%f28,	%f26
	smul	%l6,	0x09FF,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x841, 	%hsys_tick_cmpr
loop_262:
	fexpand	%f20,	%f4
	fcmpgt16	%f14,	%f14,	%o1
	array8	%o0,	%g2,	%g3
	sllx	%l2,	%i1,	%i4
	move	%fcc0,	0x496,	%o5
	call	loop_263
	movrlez	%o6,	0x33B,	%o7
	fnand	%f18,	%f4,	%f8
	ld	[%l7 + 0x60],	%f7
loop_263:
	call	loop_264
	taddcc	%g5,	0x0AC9,	%l4
	fmovdne	%icc,	%f30,	%f20
	call	loop_265
loop_264:
	fmul8sux16	%f8,	%f12,	%f18
	call	loop_266
	call	loop_267
loop_265:
	fcmpeq16	%f20,	%f20,	%i0
	fcmple32	%f2,	%f10,	%g1
loop_266:
	andn	%i5,	0x144D,	%o2
loop_267:
	rd	%sys_tick_cmpr,	%i6
	rdhpr	%hpstate,	%l1
	call	loop_268
	sllx	%i3,	0x1A,	%l3
	movrne	%g6,	%l0,	%i7
	fmovsvc	%icc,	%f12,	%f10
loop_268:
	array16	%g4,	%i2,	%l6
	movleu	%icc,	%g7,	%l5
	call	loop_269
	fmovsle	%xcc,	%f31,	%f14
	fmovdgu	%xcc,	%f14,	%f14
	fand	%f6,	%f22,	%f16
loop_269:
	call	loop_270
	movneg	%xcc,	%o4,	%o3
	te	%icc,	0x2
	subcc	%o1,	0x1240,	%g2
loop_270:
	call	loop_271
	fmovsne	%xcc,	%f25,	%f7
	array32	%g3,	%l2,	%o0
	fba	%fcc0,	loop_272
loop_271:
	movne	%xcc,	%i1,	%o5
	call	loop_273
	call	loop_274
loop_272:
	bl,a,pt	%icc,	loop_275
	call	loop_276
loop_273:
	call	loop_277
loop_274:
	rdhpr	%ver,	%i4
loop_275:
	sra	%o6,	0x12,	%o7
loop_276:
	fmovdvc	%icc,	%f24,	%f22
loop_277:
	rdhpr	%hintp,	%g5
	call	loop_278
	bg	%icc,	loop_279
	orncc	%i0,	0x0ADB,	%l4
	fmovrsne	%i5,	%f19,	%f30
loop_278:
	fsrc2	%f8,	%f30
loop_279:
	srl	%g1,	%i6,	%o2
	call	loop_280
	fpsub32s	%f29,	%f30,	%f28
	call	loop_281
	addcc	%l1,	0x1DE6,	%l3
loop_280:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	set	0x78, %i0
	ldsha	[%l7 + %i0] 0x19,	%i3
loop_281:
	xor	%i7,	0x1AE2,	%i2
	fornot1s	%f17,	%f17,	%f16
	call	loop_282
	fmovdcs	%xcc,	%f14,	%f16
	call	loop_283
	andn	%g4,	0x040D,	%g7
loop_282:
	fmovrdne	%l5,	%f8,	%f28

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_283:
	fcmpes	%fcc3,	%f11,	%f8
	ta	%icc,	0x5
	call	loop_284
	call	loop_285
	nop
	setx	0xBDFB14EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x623703F5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f14,	%f20
	fmovsu	%fcc2,	%f4,	%f3
loop_284:
	fnegs	%f29,	%f7
loop_285:
	st	%fsr,	[%l7 + 0x34]
	fbue,pn	%fcc2,	loop_286
	call	loop_287
	fmovsule	%fcc3,	%f26,	%f20
	subccc	%o3,	0x11B1,	%o4
loop_286:
	call	loop_288
loop_287:
	bg,pt	%xcc,	loop_289
	call	loop_290
	call	loop_291
loop_288:
	rd	%softint,	%g2
loop_289:
	movul	%fcc0,	%o1,	%l2
loop_290:
	fbge,a	%fcc2,	loop_292
loop_291:
	fnors	%f2,	%f31,	%f6
	fors	%f23,	%f21,	%f17
	fnot1s	%f9,	%f2
loop_292:
	nop
	set	0x28, %o3
	std	%g2,	[%l7 + %o3]
	call	loop_293
	fnors	%f23,	%f15,	%f24
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x38] %asi,	%i1
loop_293:
	call	loop_294
	call	loop_295
	call	loop_296
	fmovdvc	%icc,	%f22,	%f0
loop_294:
	tvc	%xcc,	0x1
loop_295:
	addccc	%o5,	0x02D1,	%o0
loop_296:
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdneg	%icc,	%f24,	%f18
	sdivcc	%i4,	0x00,	%o7
	membar	0x61
	srax	%o6,	0x0A,	%i0
	fnot2s	%f8,	%f9
	nop
	fitos	%f6,	%f31
	fstox	%f31,	%f0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%g5
	call	loop_297
	call	loop_298
	bg,a	%icc,	loop_299
	fands	%f13,	%f24,	%f0
loop_297:
	sethi	0x0AA9,	%i5
loop_298:
	fmovdu	%fcc3,	%f22,	%f22
loop_299:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 30
!	Type a   	: 32
!	Type x   	: 14
!	Type cti   	: 149
!	Type f   	: 147
!	Type i   	: 128
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
	set	0xF,	%g2
	set	0x7,	%g3
	set	0x3,	%g4
	set	0x9,	%g5
	set	0xE,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xA,	%i1
	set	-0xB,	%i2
	set	-0xB,	%i3
	set	-0xA,	%i4
	set	-0xB,	%i5
	set	-0xE,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x43451DAA,	%l0
	set	0x24A957E8,	%l1
	set	0x6D00242A,	%l2
	set	0x6E770B85,	%l3
	set	0x77AB1550,	%l4
	set	0x1459B9FA,	%l5
	set	0x074C118C,	%l6
	!# Output registers
	set	-0x1133,	%o0
	set	0x15DD,	%o1
	set	-0x0E83,	%o2
	set	0x106C,	%o3
	set	-0x1785,	%o4
	set	0x0010,	%o5
	set	-0x18C8,	%o6
	set	-0x1E38,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	fbug,a,pt	%fcc1,	loop_300
	fbg	%fcc1,	loop_301
	fmuld8sux16	%f15,	%f16,	%f18
	sdiv	%l4,	0x00,	%i6
loop_300:
	fpadd16	%f4,	%f4,	%f24
loop_301:
	call	loop_302
	fmovda	%icc,	%f22,	%f14
	call	loop_303
	fpadd32s	%f6,	%f6,	%f22
loop_302:
	fmul8ulx16	%f4,	%f12,	%f26
	nop
	setx	0xE42BBE70F398B306,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x99D1FEC7B69B6516,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f14,	%f12
loop_303:
	fandnot2	%f22,	%f18,	%f8
	call	loop_304
	mulx	%g1,	0x0032,	%o2
	movvs	%xcc,	0x753,	%l1
	movgu	%icc,	0x29B,	%l3
loop_304:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x324, 	%hsys_tick_cmpr
	andcc	%l0,	0x1358,	%i3
	call	loop_305
	call	loop_306
	movneg	%xcc,	%i7,	%i2
	call	loop_307
loop_305:
	call	loop_308
loop_306:
	fmovrslz	%g7,	%f10,	%f17
	call	loop_309
loop_307:
	fandnot1s	%f4,	%f22,	%f4
loop_308:
	movge	%icc,	0x5C3,	%g4
	nop
	setx	0xBF411DF12C7E082D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x62637B2F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f16,	%f14
loop_309:
	call	loop_310
	nop
	fitos	%f9,	%f12
	fstod	%f12,	%f16
	call	loop_311
	movleu	%xcc,	0x391,	%l5
loop_310:
	call	loop_312
	call	loop_313
loop_311:
	bshuffle	%f30,	%f0,	%f2
	nop
	setx	loop_314,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x012200001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_312:
	call	loop_315
loop_313:
	fmovrdgez	%o3,	%f2,	%f30
	call	loop_316
loop_314:
	fmovdg	%xcc,	%f26,	%f20
loop_315:
	ldstub	[%l7 + 0x0C],	%o4
	alignaddrl	%g2,	%l6,	%o1
loop_316:
	call	loop_317
	edge16l	%g3,	%i1,	%l2
	nop
	fitos	%f5,	%f24
	fstoi	%f24,	%f3
	tvc	%icc,	0x3
loop_317:
	call	loop_318
	fornot2s	%f31,	%f25,	%f5
	fmovdcs	%icc,	%f12,	%f0
	rd	%ccr,	%o0
loop_318:
	movlg	%fcc0,	%i4,	%o5
	nop
	fitos	%f6,	%f28
	fstoi	%f28,	%f6
	fbge,a,pt	%fcc1,	loop_319
	fmovsug	%fcc2,	%f12,	%f4
	call	loop_320
	fmovde	%fcc2,	%f20,	%f2
loop_319:
	wrpr	%o7,	0x13B6,	%pil
	call	loop_321
loop_320:
	fmovdule	%fcc2,	%f18,	%f16
	wrpr 	%g0, 	0x0, 	%gl
	call	loop_322
loop_321:
	call	loop_323
	nop
	fitos	%f4,	%f9
	fstox	%f9,	%f16
	fxtos	%f16,	%f21
	movne	%fcc3,	0x495,	%g5
loop_322:
	tn	%icc,	0x3
loop_323:
	fmuld8sux16	%f24,	%f24,	%f28
	udivcc	%l4,	0x00,	%i6
	rdhpr	%hintp,	%g1
	fmovdug	%fcc0,	%f4,	%f0
	array16	%o2,	%l1,	%l3
	add	%i5,	%l0,	%i3
	fnot2	%f30,	%f10
	call	loop_324
	fsrc2s	%f28,	%f31
	fpsub32	%f18,	%f10,	%f16
	call	loop_325
loop_324:
	call	loop_326
	fexpand	%f0,	%f4
	nop
	setx	0x14A53BF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x633B585F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f3,	%f4
loop_325:
	st	%f4,	[%l7 + 0x24]
loop_326:
	rdhpr	%htba,	%g6
	std	%i2,	[%l7 + 0x60]
	movrlz	%g7,	0x144,	%i7
	call	loop_327
	call	loop_328
	fnands	%f17,	%f30,	%f27
	wr	%g4,	0x0555,	%set_softint
loop_327:
	wr	%o3,	0x05E1,	%ccr
loop_328:
	call	loop_329
	nop
	setx	0x3701D43E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x58CD626D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f17,	%f18
	call	loop_330
	movleu	%icc,	0x560,	%o4
loop_329:
	fmovdo	%fcc2,	%f22,	%f0
	fnors	%f4,	%f24,	%f25
loop_330:
	nop
	setx	0x0F59267C700BA9CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x575C12A372E3B962,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f22,	%f22
	tvc	%xcc,	0x0
	call	loop_331
	call	loop_332
	call	loop_333
	call	loop_334
loop_331:
	fmovdcc	%icc,	%f8,	%f2
loop_332:
	ble,pn	%icc,	loop_335
loop_333:
	nop
	setx	loop_336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031200001405,	%l0,	%l1
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
loop_334:
	call	loop_337
	fmovdle	%fcc2,	%f22,	%f6
loop_335:
	fnot2s	%f1,	%f28
loop_336:
	fpadd16	%f18,	%f4,	%f2
loop_337:
	nop
	setx	loop_338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x024200001401,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%g2,	%l5,	%l6
	tvs	%xcc,	0x7
	call	loop_339
loop_338:
	call	loop_340
	call	loop_341
	call	loop_342
loop_339:
	movpos	%xcc,	0x57C,	%g3
loop_340:
	udiv	%o1,	0x00,	%l2
loop_341:
	fnot2s	%f12,	%f12
loop_342:
	fbu	%fcc3,	loop_343
	tne	%icc,	0x0
	call	loop_344
	tvc	%xcc,	0x0
loop_343:
	fbl,pn	%fcc3,	loop_345
	pdist	%f0,	%f6,	%f4
loop_344:
	nop
	setx	0x366AC664,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xCDFEE59A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f5,	%f16
	fornot1	%f26,	%f6,	%f16
loop_345:
	fcmpgt32	%f14,	%f18,	%i1
	sir	0x1BC4
	wr	%o0,	0x03CC,	%softint
	fpsub16	%f10,	%f26,	%f16
	nop
	fitos	%f1,	%f23
	fstod	%f23,	%f26
	call	loop_346
	fzero	%f4
	ta	%icc,	0x2
	nop
	setx	0x76A9A6DCD5E2C86D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_346:
	call	loop_347
	fbue,a	%fcc2,	loop_348
	srl	%o5,	%o7,	%i4
	movne	%fcc0,	0x213,	%o6
loop_347:
	movcc	%icc,	0x78A,	%i0
loop_348:
	call	loop_349
	call	loop_350
	tsubcctv	%l4,	%i6,	%g5
	fsrc1	%f30,	%f10
loop_349:
	nop
	fitos	%f4,	%f17
	fstox	%f17,	%f0
loop_350:
	lduh	[%l7 + 0x1A],	%o2
	sdivcc	%l1,	0x00,	%l3
	movlg	%fcc3,	%i5,	%l0
	tn	%icc,	0x2
	xor	%g1,	0x07FD,	%i3
	call	loop_351
	rdpr	%pil,	%g6
	ldub	[%l7 + 0x71],	%g7
	call	loop_352
loop_351:
	movneg	%icc,	0x799,	%i7
	fnands	%f5,	%f12,	%f26
	fmovdpos	%icc,	%f0,	%f28
loop_352:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%i2
	call	loop_353
	call	loop_354
	call	loop_355
	call	loop_356
loop_353:
	lduh	[%l7 + 0x5C],	%g4
loop_354:
	call	loop_357
loop_355:
	call	loop_358
loop_356:
	call	loop_359
	call	loop_360
loop_357:
	wr	%o4,	%o3,	%softint
loop_358:
	fmul8x16al	%f14,	%f12,	%f0
loop_359:
	call	loop_361
loop_360:
	movlg	%fcc1,	%l5,	%l6
	movle	%fcc1,	%g2,	%o1
	call	loop_362
loop_361:
	movrlz	%l2,	%g3,	%o0
	andcc	%i1,	%o5,	%i4
	wrpr	%o6,	%i0,	%cwp
loop_362:
	edge8	%o7,	%i6,	%g5
	fmovsvc	%icc,	%f28,	%f21
	edge16l	%l4,	%l1,	%l3
	fbul	%fcc0,	loop_363
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fble	%fcc2,	loop_364
	fpmerge	%f26,	%f28,	%f0
loop_363:
	for	%f12,	%f16,	%f16
	call	loop_365
loop_364:
	call	loop_366
	bvc	%xcc,	loop_367
	movneg	%xcc,	%o2,	%l0
loop_365:
	tle	%icc,	0x1
loop_366:
	fmovsge	%fcc3,	%f18,	%f3
loop_367:
	brlez,a,pt	%g1,	loop_368
	taddcctv	%i5,	%i3,	%g7
	xorcc	%i7,	0x1EDE,	%g6
	call	loop_369
loop_368:
	edge16ln	%g4,	%i2,	%o3
	call	loop_370
	bg,a,pt	%xcc,	loop_371
loop_369:
	call	loop_372
	sllx	%o4,	%l5,	%l6
loop_370:
	fors	%f10,	%f17,	%f12
loop_371:
	fmovrslez	%g2,	%f4,	%f22
loop_372:
	fmovso	%fcc0,	%f11,	%f0
	fbug,a,pn	%fcc0,	loop_373
	fmovdo	%fcc3,	%f16,	%f20
	nop
	setx	0x0A466ABB42D93109,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f28
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o1
loop_373:
	movcc	%xcc,	0x59F,	%g3
	rdpr	%wstate,	%o0
	rd	%tick_cmpr,	%i1
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f8
	fxtos	%f8,	%f2
	fmovsleu	%xcc,	%f30,	%f18
	mova	%xcc,	%o5,	%i4
	call	loop_374
	fpadd16	%f28,	%f26,	%f14
	ta	%icc,	0x2
	fmovdl	%fcc0,	%f26,	%f10
loop_374:
	call	loop_375
	fand	%f20,	%f24,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA7E, 	%hsys_tick_cmpr
	wrpr	%l2,	0x16FE,	%tick
loop_375:
	call	loop_376
	srl	%o7,	0x10,	%g5
	stbar
	wrpr	%i6,	%l4,	%cwp
loop_376:
	movge	%fcc0,	0x2DD,	%l3
	fpackfix	%f12,	%f17
	movcs	%icc,	0x2CC,	%l1
	call	loop_377
	fmovdneg	%xcc,	%f0,	%f6
	movrne	%l0,	%g1,	%o2
	call	loop_378
loop_377:
	fabsd	%f10,	%f12
	fmovdleu	%xcc,	%f20,	%f14
	wr	%i5,	0x0D04,	%clear_softint
loop_378:
	sethi	0x1E97,	%g7
	call	loop_379
	fmul8x16au	%f23,	%f16,	%f20
	movrlz	%i7,	0x0A5,	%i3
	call	loop_380
loop_379:
	fabss	%f0,	%f17
	call	loop_381
	fxnors	%f19,	%f11,	%f9
loop_380:
	fmovrdlez	%g4,	%f12,	%f8
	edge16l	%g6,	%o3,	%i2
loop_381:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE78, 	%hsys_tick_cmpr
	call	loop_382
	nop
	setx	0x1F7141E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xC90A32BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f13,	%f4
	fmovdleu	%icc,	%f20,	%f18
	edge16ln	%l6,	%g2,	%o4
loop_382:
	call	loop_383
	nop
	setx	loop_384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011100001404,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdneg	%xcc,	%f20,	%f28
	tneg	%xcc,	0x3
loop_383:
	stw	%o1,	[%l7 + 0x60]
loop_384:
	fsrc1s	%f9,	%f8
	mova	%icc,	0x29D,	%o0
	sra	%g3,	%i1,	%i4
	brz	%o6,	loop_385
	xor	%i0,	0x12CC,	%o5
	call	loop_386
	and	%l2,	%o7,	%i6
loop_385:
	fsrc1	%f8,	%f18
	call	loop_387
loop_386:
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%l4
	nop
	setx	0xC7E2EC98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xBB65B8DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f27,	%f8
	sra	%l3,	%g5,	%l1
loop_387:
	call	loop_388
	tcs	%xcc,	0x4
	xnor	%g1,	0x1B94,	%l0
	array8	%o2,	%g7,	%i5
loop_388:
	nop
	setx	0x27729904,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	fmovrdgez	%i7,	%f18,	%f20
	or	%i3,	0x0143,	%g6
	fandnot2s	%f31,	%f8,	%f14
	fmovdgu	%xcc,	%f20,	%f24
	fmovsle	%xcc,	%f21,	%f5
	srlx	%g4,	%i2,	%o3
	fbne,pn	%fcc3,	loop_389
	call	loop_390
	wrpr	%l5,	%g2,	%tick

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_389:
	rdpr	%cleanwin,	%o0
loop_390:
	mulscc	%g3,	0x15F8,	%i1
	tle	%icc,	0x4
	std	%f16,	[%l7 + 0x38]
	fmovdvs	%xcc,	%f20,	%f12
	bgu,pt	%xcc,	loop_391
	array16	%o1,	%o6,	%i0
	movrgez	%o5,	%i4,	%l2
	call	loop_392
loop_391:
	fmovsu	%fcc0,	%f21,	%f20
	nop
	set	0x28, %o4
	lduw	[%l7 + %o4],	%i6
	call	loop_393
loop_392:
	fmovsue	%fcc1,	%f26,	%f0
	subcc	%o7,	0x03B3,	%l3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%l4
loop_393:
	fmovdle	%fcc2,	%f0,	%f18
	fmovsug	%fcc1,	%f20,	%f0
	stbar
	std	%f2,	[%l7 + 0x20]
	tcs	%xcc,	0x2
	fmovsvs	%xcc,	%f17,	%f19
	fbge,a	%fcc3,	loop_394
	subccc	%g1,	0x1EDB,	%l1
	call	loop_395
	call	loop_396
loop_394:
	call	loop_397
	movgu	%xcc,	0x49B,	%l0
loop_395:
	edge32n	%g7,	%o2,	%i5
loop_396:
	fmovsvc	%icc,	%f17,	%f29
loop_397:
	call	loop_398
	srax	%i7,	%i3,	%g4
	fmovdug	%fcc2,	%f24,	%f16
	edge8n	%i2,	%g6,	%o3
loop_398:
	edge32	%l5,	%o4,	%l6
	tcs	%icc,	0x2
	call	loop_399
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovdcs	%icc,	%f24,	%f30
	andn	%g2,	%o0,	%g3
loop_399:
	call	loop_400
	call	loop_401
	fxnors	%f26,	%f7,	%f2
	wrpr	%i1,	0x07A4,	%cwp
loop_400:
	call	loop_402
loop_401:
	wrpr	%o6,	%i0,	%cwp
	edge16	%o1,	%i4,	%o5
	call	loop_403
loop_402:
	nop
	setx	0xEA1FBAA8AC7F54DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5AD4F526E1867CC8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f28
	bne,a	%xcc,	loop_404
	tle	%xcc,	0x2
loop_403:
	call	loop_405
	fmovdule	%fcc2,	%f18,	%f28
loop_404:
	nop
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_405:
	rd	%fprs,	%l2
	wr	%o7,	0x028E,	%sys_tick
	nop
	setx	0x56B8CBFC27A91E9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xDA5A3A68244DD2F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f10
	wr	%g0,	0x19,	%asi
	stxa	%i6,	[%l7 + 0x50] %asi
	fnands	%f29,	%f22,	%f26
	fcmple32	%f6,	%f28,	%l3
	mulx	%g5,	0x10A9,	%g1
	rdpr	%cwp,	%l4
	wr	%g0,	0x2f,	%asi
	stda	%l0,	[%l7 + 0x30] %asi
	membar	#Sync
	wr	%g0,	0xeb,	%asi
	stba	%g7,	[%l7 + 0x56] %asi
	membar	#Sync
	set	0x46, %l1
	ldsha	[%l7 + %l1] 0x18,	%l0
	umulcc	%i5,	%i7,	%i3
	rdpr	%wstate,	%o2
	edge32l	%g4,	%i2,	%g6
	movuge	%fcc1,	0x1AF,	%l5
	rdhpr	%ver,	%o4
	fmovsvc	%icc,	%f22,	%f11
	call	loop_406
	call	loop_407
	call	loop_408
	wr	%o3,	0x15DF,	%sys_tick
loop_406:
	fbu	%fcc1,	loop_409
loop_407:
	tne	%xcc,	0x2
loop_408:
	array16	%l6,	%g2,	%g3
	fmovdue	%fcc2,	%f4,	%f0
loop_409:
	rd	%softint,	%i1
	call	loop_410
	fzero	%f4
	fandnot1s	%f30,	%f3,	%f30
	fmovrse	%o6,	%f5,	%f18
loop_410:
	nop
	setx	0xD61193E38E90F721,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2D608EE1B520B6B4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f30
	movue	%fcc3,	%i0,	%o0
	andcc	%o1,	0x0AC2,	%i4
	fcmpeq16	%f10,	%f6,	%o5
	xnor	%o7,	%i6,	%l2
	tcs	%icc,	0x0
	nop
	setx	0xEC75566655E537C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x81C70FB399BC9329,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f22,	%f20
	fcmpeq32	%f2,	%f6,	%g5
	call	loop_411
	call	loop_412
	movu	%fcc0,	%g1,	%l3
	call	loop_413
loop_411:
	call	loop_414
loop_412:
	srax	%l1,	0x08,	%l4
	call	loop_415
loop_413:
	call	loop_416
loop_414:
	tcc	%icc,	0x2
	fbuge,pt	%fcc1,	loop_417
loop_415:
	call	loop_418
loop_416:
	nop
	setx	0x6AA928A36855F816,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x566ACE362A3E4A86,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f6,	%f10
	fnegs	%f9,	%f0
loop_417:
	call	loop_419
loop_418:
	tvc	%xcc,	0x2
	call	loop_420
	call	loop_421
loop_419:
	movvc	%xcc,	%l0,	%i5
	fpsub32s	%f10,	%f27,	%f12
loop_420:
	fmovspos	%icc,	%f11,	%f31
loop_421:
	fpadd32s	%f7,	%f1,	%f31
	fmovrslz	%i7,	%f10,	%f31
	call	loop_422
	ld	[%l7 + 0x50],	%f4
	array32	%i3,	%g7,	%g4
	call	loop_423
loop_422:
	fnot2	%f8,	%f28
	udivx	%i2,	0x00,	%o2
	wrpr	%l5,	0x1BCE,	%tick
loop_423:
	fsrc2s	%f13,	%f28
	fblg	%fcc1,	loop_424
	ldd	[%l7 + 0x70],	%f8
	call	loop_425
	fmovdleu	%xcc,	%f30,	%f8
loop_424:
	rd	%ccr,	%g6
	movul	%fcc2,	%o4,	%l6
loop_425:
	edge8n	%o3,	%g2,	%i1
	add	%g3,	0x16BB,	%i0
	rd	%sys_tick_cmpr,	%o6
	nop
	set	0x50, %i5
	flush	%l7 + %i5
	taddcctv	%o1,	0x0912,	%i4
	nop
	fitos	%f9,	%f4
	fstod	%f4,	%f22
	fmuld8ulx16	%f2,	%f2,	%f16
	movgu	%xcc,	0x531,	%o5
	fands	%f18,	%f27,	%f2
	fbe,a,pt	%fcc2,	loop_426
	add	%o7,	%i6,	%l2
	tsubcc	%o0,	0x1403,	%g5
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
loop_426:
	call	loop_427
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f28
	fxtod	%f28,	%f18
	tle	%icc,	0x5
	tgu	%xcc,	0x7
loop_427:
	call	loop_428
	movge	%xcc,	0x05B,	%g1
	fmovslg	%fcc3,	%f14,	%f4
	call	loop_429
loop_428:
	sra	%l3,	%l4,	%l1
	wr	%l0,	%i7,	%y
	fmovdue	%fcc0,	%f26,	%f24
loop_429:
	fmovsne	%fcc3,	%f21,	%f31
	call	loop_430
	fble	%fcc2,	loop_431
	nop
	setx loop_432, %l0, %l1
	jmpl %l1, %i3
	fmuld8sux16	%f10,	%f8,	%f12
loop_430:
	fmovrdne	%i5,	%f4,	%f26
loop_431:
	movre	%g7,	0x1F6,	%g4
loop_432:
	call	loop_433
	fornot2	%f12,	%f16,	%f12
	call	loop_434
	fmovdn	%xcc,	%f8,	%f8
loop_433:
	sethi	0x085B,	%o2
	fornot1s	%f5,	%f29,	%f5
loop_434:
	call	loop_435
	call	loop_436
	ta	%xcc,	0x5
	fpsub32s	%f25,	%f7,	%f28
loop_435:
	call	loop_437
loop_436:
	call	loop_438
	movleu	%icc,	%l5,	%g6
	call	loop_439
loop_437:
	fmovdpos	%xcc,	%f26,	%f0
loop_438:
	fmovsl	%xcc,	%f6,	%f12
	fmuld8ulx16	%f10,	%f25,	%f12
loop_439:
	te	%xcc,	0x3
	fmovrdgez	%i2,	%f28,	%f16
	fmovrde	%l6,	%f22,	%f20
	fmovrde	%o4,	%f10,	%f10
	call	loop_440
	ldsb	[%l7 + 0x65],	%o3
	bgu,pt	%xcc,	loop_441
	call	loop_442
loop_440:
	sdivx	%g2,	%g3,	%i0
	fmovdue	%fcc2,	%f20,	%f4
loop_441:
	call	loop_443
loop_442:
	call	loop_444
	nop
	setx	0x2420020ECCD3824E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x29EF996415603E27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f26,	%f30
	edge8ln	%o6,	%o1,	%i1
loop_443:
	wr	%o5,	0x18C3,	%clear_softint
loop_444:
	fmovrslz	%i4,	%f28,	%f20
	fmovso	%fcc3,	%f15,	%f27
	fnot1	%f14,	%f6
	fmovrdlez	%o7,	%f8,	%f18
	fbl,pt	%fcc2,	loop_445
	call	loop_446
	call	loop_447
	fabsd	%f28,	%f20
loop_445:
	flushw
loop_446:
	call	loop_448
loop_447:
	tl	%icc,	0x5
	edge16l	%i6,	%o0,	%g5
	fmuld8ulx16	%f23,	%f19,	%f20
loop_448:
	fornot1s	%f15,	%f2,	%f3
	xor	%g1,	0x137F,	%l3
	fmovrdne	%l4,	%f22,	%f6
	movrne	%l2,	0x145,	%l1
	call	loop_449
	fone	%f6
	call	loop_450
	movre	%i7,	0x067,	%l0
loop_449:
	rd	%softint,	%i3
loop_450:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 28
!	Type a   	: 37
!	Type x   	: 8
!	Type cti   	: 151
!	Type f   	: 146
!	Type i   	: 130
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
	set	0x7,	%g1
	set	0x1,	%g2
	set	0x5,	%g3
	set	0xF,	%g4
	set	0x6,	%g5
	set	0x3,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x4,	%i1
	set	-0xF,	%i2
	set	-0x5,	%i3
	set	-0x8,	%i4
	set	-0x2,	%i5
	set	-0x2,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x170AC71F,	%l0
	set	0x6AA2C2E6,	%l1
	set	0x40E12A38,	%l2
	set	0x14D103A6,	%l3
	set	0x3D5D5399,	%l4
	set	0x29DDE6B0,	%l5
	set	0x07F60921,	%l6
	!# Output registers
	set	0x150F,	%o0
	set	-0x01BB,	%o1
	set	0x05DF,	%o2
	set	0x1646,	%o3
	set	0x068E,	%o4
	set	0x066A,	%o5
	set	-0x090D,	%o6
	set	0x040C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	nop
	setx	0x895A8ED3A31B2239,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE8F23029,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsmuld	%f4,	%f6,	%f6
	array16	%g7,	%g4,	%o2
	fcmpes	%fcc3,	%f1,	%f27
	fpack32	%f26,	%f2,	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	rdhpr	%ver,	%i2
	edge16l	%l6,	%g6,	%o4
	brnz,a	%g2,	loop_451
	edge16	%g3,	%o3,	%i0
	fsrc1	%f8,	%f16
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f12
loop_451:
	fmovda	%fcc0,	%f14,	%f26
	call	loop_452
	faligndata	%f10,	%f14,	%f24
	edge16l	%o6,	%o1,	%i1
	fmovsvc	%icc,	%f9,	%f16
loop_452:
	nop
	setx	0xA517BCC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f26
	call	loop_453
	call	loop_454
	mulscc	%o5,	0x0A80,	%i4
	fcmpne32	%f30,	%f2,	%i6
loop_453:
	call	loop_455
loop_454:
	call	loop_456
	fmul8x16al	%f3,	%f0,	%f18
	fnands	%f1,	%f12,	%f3
loop_455:
	fmovdle	%fcc1,	%f14,	%f14
loop_456:
	ldub	[%l7 + 0x2D],	%o0
	fornot2	%f2,	%f26,	%f28
	call	loop_457
	nop
	set	0x78, %i7
	stx	%o7,	[%l7 + %i7]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovrslez	%l4,	%f4,	%f28
loop_457:
	call	loop_458
	udiv	%l2,	0x00,	%l1
	call	loop_459
	or	%i7,	%g5,	%l0
loop_458:
	fandnot2	%f26,	%f26,	%f10
	xor	%i3,	%g7,	%o2
loop_459:
	movg	%xcc,	%l5,	%g4
	call	loop_460
	call	loop_461
	sub	%i2,	%i5,	%l6
	fnot1	%f18,	%f8
loop_460:
	fnors	%f24,	%f17,	%f8
loop_461:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 3
	array16	%g6,	%g2,	%o3
	nop
	setx	0xF0F0B966,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xA2A1EB0D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f28,	%f24
	rdhpr	%hpstate,	%i0
	fcmpeq32	%f4,	%f16,	%o6
	call	loop_462
	tn	%xcc,	0x2
	movpos	%icc,	0x31E,	%g3
	brz,a	%i1,	loop_463
loop_462:
	sll	%o1,	0x15,	%i4
	tleu	%icc,	0x7
	mulscc	%i6,	%o5,	%o7
loop_463:
	fnot2	%f2,	%f12
	nop
	set	0x38, %o6
	stw	%g1,	[%l7 + %o6]
	addccc	%l3,	%l4,	%o0
	call	loop_464
	movleu	%xcc,	%l2,	%i7
	set	0x68, %g6
	prefetcha	[%l7 + %g6] 0x04,	 1
loop_464:
	call	loop_465
	call	loop_466
	fmovsule	%fcc1,	%f17,	%f16
	fmovsgu	%icc,	%f1,	%f16
loop_465:
	addc	%l0,	0x026D,	%l1
loop_466:
	fcmps	%fcc2,	%f15,	%f0
	fbue,a	%fcc1,	loop_467
	movle	%xcc,	%i3,	%o2
	fmovdle	%fcc1,	%f18,	%f10
	call	loop_468
loop_467:
	call	loop_469
	sth	%l5,	[%l7 + 0x76]
	tleu	%xcc,	0x6
loop_468:
	or	%g7,	%g4,	%i5
loop_469:
	call	loop_470
	fmovrdgez	%i2,	%f6,	%f2
	call	loop_471
	fmovdule	%fcc3,	%f26,	%f8
loop_470:
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f14
	fcmple32	%f12,	%f28,	%l6
loop_471:
	ldstub	[%l7 + 0x2A],	%g6
	call	loop_472
	nop
	setx	0xD92A2C7D52BE2901,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x252AD8A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsmuld	%f26,	%f16,	%f2
	rd	%fprs,	%g2
	fpadd16s	%f9,	%f21,	%f20
loop_472:
	nop
	setx	0x155CE7C3F2D6967,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	call	loop_473
	fbuge,pn	%fcc0,	loop_474
	call	loop_475
	edge8l	%o3,	%o4,	%i0
loop_473:
	fbg,a,pt	%fcc1,	loop_476
loop_474:
	smulcc	%g3,	%i1,	%o6
loop_475:
	movl	%icc,	%o1,	%i4
	call	loop_477
loop_476:
	movleu	%xcc,	0x623,	%i6
	addc	%o5,	0x0B59,	%o7
	popc	%l3,	%l4
loop_477:
	fmovdule	%fcc0,	%f4,	%f8
	fpadd32s	%f23,	%f20,	%f22
	call	loop_478
	tn	%xcc,	0x0
	wrpr	%g1,	%l2,	%tick
	movg	%xcc,	%i7,	%o0
loop_478:
	or	%l0,	%g5,	%i3
	edge32n	%o2,	%l1,	%l5
	call	loop_479
	call	loop_480
	tpos	%icc,	0x1
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_479:
	call	loop_481
loop_480:
	fmovso	%fcc1,	%f14,	%f18
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g4
loop_481:
	bcc,a,pn	%xcc,	loop_482
	sdivcc	%i5,	0x00,	%g7
	fmovsn	%xcc,	%f22,	%f1
	prefetch	[%l7 + 0x48],	 1
loop_482:
	umul	%i2,	%l6,	%g6
	tpos	%icc,	0x2
	fmovsuge	%fcc3,	%f0,	%f16
	fmovsne	%fcc3,	%f12,	%f3
	srlx	%o3,	0x14,	%g2
	tsubcctv	%i0,	%o4,	%i1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0
	call	loop_483
	edge32ln	%o1,	%o6,	%i4
	andcc	%o5,	0x0194,	%o7
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l3
loop_483:
	fmovsa	%fcc2,	%f18,	%f8
	brz,a	%l4,	loop_484
	rdhpr	%hsys_tick_cmpr,	%i6
	call	loop_485
	call	loop_486
loop_484:
	nop
	setx	0xDC1379D6E68F8629,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f22
	call	loop_487
loop_485:
	xnorcc	%g1,	0x0672,	%l2
loop_486:
	call	loop_488
	movrgz	%i7,	%o0,	%l0
loop_487:
	edge32	%g5,	%i3,	%o2
	tcc	%icc,	0x6
loop_488:
	fmovrde	%l5,	%f8,	%f10
	edge16ln	%g4,	%i5,	%l1
	wrpr	%g7,	%l6,	%pil
	smulcc	%g6,	%o3,	%g2
	call	loop_489
	call	loop_490
	faligndata	%f26,	%f10,	%f4
	call	loop_491
loop_489:
	fmovdpos	%icc,	%f4,	%f4
loop_490:
	nop
	fitod	%f8,	%f8
	fdtos	%f8,	%f25
	fmovscs	%icc,	%f2,	%f2
loop_491:
	fcmple16	%f10,	%f10,	%i2
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f6
	fmovdue	%fcc0,	%f10,	%f2
	fpsub32	%f22,	%f8,	%f8
	fmovsneg	%xcc,	%f29,	%f22
	udiv	%o4,	0x00,	%i0
	fmovscc	%icc,	%f17,	%f19
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xca
	array32	%i1,	%o1,	%g3
	call	loop_492
	bge,pn	%icc,	loop_493
	fors	%f18,	%f27,	%f5
	fpackfix	%f10,	%f20
loop_492:
	movneg	%xcc,	%o6,	%i4
loop_493:
	fnegd	%f22,	%f30
	nop
	fitos	%f13,	%f16
	bvc,a,pt	%xcc,	loop_494
	fpadd16	%f24,	%f18,	%f24
	fmovdleu	%icc,	%f16,	%f20
	call	loop_495
loop_494:
	movul	%fcc2,	%o5,	%o7
	fcmpeq16	%f0,	%f10,	%l4
	movpos	%xcc,	0x3EF,	%i6
loop_495:
	call	loop_496
	call	loop_497
	fbug,a,pn	%fcc3,	loop_498
	fone	%f8
loop_496:
	movo	%fcc3,	%g1,	%l2
loop_497:
	std	%i6,	[%l7 + 0x38]
loop_498:
	fpsub16s	%f7,	%f28,	%f22
	ta	%icc,	0x7
	andncc	%l3,	%l0,	%o0
	call	loop_499
	call	loop_500
	fcmple32	%f0,	%f2,	%g5
	movge	%xcc,	%i3,	%l5
loop_499:
	te	%icc,	0x0
loop_500:
	srl	%o2,	0x06,	%g4
	fbu	%fcc0,	loop_501
	ldsh	[%l7 + 0x78],	%i5
	rdpr	%tl,	%l1
	set	0x2D, %i6
	lduba	[%l7 + %i6] 0x04,	%g7
loop_501:
	brgez,pn	%g6,	loop_502
	nop
	setx	0x96E5BB36CB7AF109,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x9538948F71A4CE65,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f4,	%f18
	fmovdn	%icc,	%f2,	%f16
	fpsub32	%f2,	%f6,	%f10
loop_502:
	nop
	fitos	%f12,	%f28
	fstox	%f28,	%f12
	call	loop_503
	nop
	setx	0x8C46CA9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x961B4F2D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f6,	%f4
	nop
	setx	0x3C839BEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xB0E04346,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f6,	%f22
	call	loop_504
loop_503:
	call	loop_505
	alignaddrl	%o3,	%g2,	%l6
	fcmps	%fcc1,	%f2,	%f30
loop_504:
	movvc	%icc,	%i2,	%o4
loop_505:
	fnot2s	%f1,	%f5
	tle	%xcc,	0x7
	addccc	%i1,	0x1CC4,	%o1
	movl	%icc,	%g3,	%i0
	xnor	%i4,	%o5,	%o6
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f28
	nop
	setx	0xDB1753753EC50D79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f12
	fsrc2	%f22,	%f24
	call	loop_506
	tvs	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l4
loop_506:
	call	loop_507
	call	loop_508
	tsubcctv	%i6,	%g1,	%l2
	flushw
loop_507:
	call	loop_509
loop_508:
	bl,a,pn	%xcc,	loop_510
	bshuffle	%f28,	%f6,	%f20
	fpadd16s	%f6,	%f10,	%f23
loop_509:
	call	loop_511
loop_510:
	call	loop_512
	movn	%icc,	0x1E7,	%o7
	fmovscs	%icc,	%f7,	%f17
loop_511:
	edge32l	%i7,	%l3,	%l0
loop_512:
	call	loop_513
	ldsb	[%l7 + 0x66],	%o0
	fnands	%f2,	%f17,	%f9
	fcmple32	%f14,	%f4,	%g5
loop_513:
	call	loop_514
	call	loop_515
	fmul8sux16	%f2,	%f26,	%f8
	call	loop_516
loop_514:
	faligndata	%f14,	%f16,	%f0
loop_515:
	pdist	%f18,	%f8,	%f22
	movre	%l5,	0x059,	%i3
loop_516:
	array16	%g4,	%i5,	%l1
	movneg	%xcc,	%g7,	%o2
	call	loop_517
	nop
	setx loop_518, %l0, %l1
	jmpl %l1, %o3
	fmovs	%f27,	%f8
	tleu	%xcc,	0x3
loop_517:
	fmovdule	%fcc0,	%f12,	%f26
loop_518:
	rdpr	%tba,	%g6
	fmovsue	%fcc3,	%f23,	%f12
	te	%icc,	0x6
	fmovrdlz	%g2,	%f16,	%f6
	subc	%l6,	%o4,	%i2
	call	loop_519
	umulcc	%i1,	0x0F84,	%g3
	brz,pn	%o1,	loop_520
	fmovdlg	%fcc2,	%f30,	%f6
loop_519:
	call	loop_521
	fnot2s	%f17,	%f26
loop_520:
	fbn,a	%fcc2,	loop_522
	fbge,a	%fcc3,	loop_523
loop_521:
	fxor	%f18,	%f30,	%f6
	edge8l	%i0,	%i4,	%o6
loop_522:
	move	%fcc3,	0x6F2,	%l4
loop_523:
	nop
	set	0x6C, %o0
	stw	%i6,	[%l7 + %o0]
	udivx	%g1,	%o5,	%l2
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f2
	fxtod	%f2,	%f10
	rd	%fprs,	%i7
	call	loop_524
	call	loop_525
	fmovrdlez	%l3,	%f18,	%f12
	sir	0x0470
loop_524:
	call	loop_526
loop_525:
	fmovdu	%fcc1,	%f16,	%f6
	alignaddr	%o7,	%l0,	%g5
	nop
	setx loop_527, %l0, %l1
	jmpl %l1, %l5
loop_526:
	edge8	%i3,	%g4,	%o0
	nop
	fitod	%f18,	%f16
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l1
loop_527:
	fmovrsne	%g7,	%f4,	%f16
	fmuld8ulx16	%f27,	%f0,	%f10
	call	loop_528
	movneg	%xcc,	%i5,	%o3
	call	loop_529
	nop
	set	0x68, %g5
	std	%f4,	[%l7 + %g5]
loop_528:
	prefetch	[%l7 + 0x10],	 4
	edge16n	%o2,	%g2,	%l6
loop_529:
	call	loop_530
	call	loop_531
	nop
	set	0x6A, %i1
	sth	%g6,	[%l7 + %i1]
	fpadd16	%f16,	%f12,	%f4
loop_530:
	nop
	setx	0x27A700333E84983C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xC9AB57D8847028A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f22,	%f30
loop_531:
	wrpr 	%g0, 	0x1, 	%gl
	fmovsuge	%fcc2,	%f20,	%f6
	te	%xcc,	0x6
	nop
	setx	0x8C1FFB82,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xD7AE5D56,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f21,	%f2
	fmovrdlz	%o4,	%f30,	%f22
	tneg	%xcc,	0x4
	fble,a,pn	%fcc1,	loop_532
	call	loop_533
	nop
	setx	0x4B3870A5D21F9351,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF2CDDE3B5765A0AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f30,	%f16
	movleu	%xcc,	%i1,	%g3
loop_532:
	tneg	%icc,	0x0
loop_533:
	orcc	%i0,	%i4,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fpmerge	%f12,	%f15,	%f8
	udivx	%i6,	0x00,	%g1
	sdivx	%o5,	0x00,	%l2
	call	loop_534
	movug	%fcc3,	%o1,	%l3
	flush	%l7 + 0x08
	movpos	%xcc,	0x6BF,	%o7
loop_534:
	fbue,pt	%fcc3,	loop_535
	nop
	setx	0x04EB6E2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x4C953417,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f24,	%f18
	edge32ln	%l0,	%g5,	%i7
	subccc	%i3,	0x00E3,	%g4
loop_535:
	nop
	fitod	%f8,	%f14
	fdtoi	%f14,	%f4
	fmovdcs	%icc,	%f10,	%f8
	fnor	%f16,	%f12,	%f26
	movvc	%xcc,	%l5,	%l1
	movleu	%xcc,	0x65B,	%o0
	movlg	%fcc1,	0x2FE,	%g7
	bmask	%i5,	%o2,	%o3
	call	loop_536
	fmovdneg	%icc,	%f30,	%f20
	fmovsu	%fcc1,	%f15,	%f25
	edge32l	%l6,	%g2,	%i2
loop_536:
	fmovrslez	%o4,	%f18,	%f9
	nop
	setx	0x14458458A7F7E70B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3758E97CD2C7E45C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f12,	%f26
	call	loop_537
	fpmerge	%f19,	%f27,	%f8
	fxor	%f8,	%f8,	%f30
	call	loop_538
loop_537:
	fmovduge	%fcc1,	%f30,	%f8
	ld	[%l7 + 0x40],	%f7
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f20
loop_538:
	fnot1s	%f16,	%f14
	umul	%g6,	%g3,	%i0
	flushw
	nop
	setx	0xBF2B678B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x9299CF10,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f1,	%f31
	tg	%icc,	0x2
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	sub	%i4,	0x1C4F,	%o6
	call	loop_539
	fmovscc	%xcc,	%f15,	%f20
	call	loop_540
	fmovdge	%fcc1,	%f22,	%f12
loop_539:
	fornot2	%f8,	%f4,	%f30
	call	loop_541
loop_540:
	bneg	%xcc,	loop_542
	call	loop_543
	call	loop_544
loop_541:
	subcc	%l4,	%i1,	%g1
loop_542:
	tgu	%xcc,	0x1
loop_543:
	nop
	fitod	%f4,	%f24
	fdtox	%f24,	%f10
loop_544:
	nop
	setx	0x7A15D6606B20C020,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x4AE659F62A3C5646,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f14,	%f28
	rdpr	%tba,	%i6
	fmovdlg	%fcc3,	%f4,	%f26
	movg	%fcc3,	%l2,	%o5
	fpsub32s	%f22,	%f12,	%f27
	wr	%g0,	0xd3,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovsge	%fcc2,	%f0,	%f6
	subccc	%o1,	0x17B4,	%o7
	st	%fsr,	[%l7 + 0x54]
	fandnot2s	%f13,	%f27,	%f1
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	bl	%icc,	loop_545
	movn	%icc,	0x0AE,	%l0
	fandnot1	%f30,	%f6,	%f8
	nop
	fitos	%f2,	%f7
	fstox	%f7,	%f8
	fxtos	%f8,	%f25
loop_545:
	ta	%icc,	0x6
	call	loop_546
	nop
	setx	0xD0173F64,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xAAE3264D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f20,	%f22
	movre	%g5,	0x30A,	%l3
	call	loop_547
loop_546:
	call	loop_548
	call	loop_549
	call	loop_550
loop_547:
	edge16n	%i7,	%g4,	%i3
loop_548:
	fmovscs	%icc,	%f4,	%f28
loop_549:
	flush	%l7 + 0x60
loop_550:
	fsrc1s	%f25,	%f18
	call	loop_551
	fmovdvc	%icc,	%f10,	%f22
	wrpr 	%g0, 	0x1, 	%gl
	andn	%o0,	0x15F4,	%l1
loop_551:
	ldd	[%l7 + 0x18],	%f24
	fpmerge	%f7,	%f0,	%f2
	fmovduge	%fcc1,	%f18,	%f14
	call	loop_552
	fmovdlg	%fcc0,	%f18,	%f26
	orncc	%g7,	0x1953,	%o2
	call	loop_553
loop_552:
	nop
	setx	loop_554,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x021200001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	rdhpr	%hintp,	%i5
	edge32ln	%l6,	%o3,	%g2
loop_553:
	call	loop_555
loop_554:
	fmovda	%icc,	%f20,	%f6
	call	loop_556
	bcs,pn	%icc,	loop_557
loop_555:
	fnot2	%f20,	%f18
	call	loop_558
loop_556:
	ldub	[%l7 + 0x5B],	%i2
loop_557:
	fmul8x16au	%f11,	%f20,	%f24
	fpadd32	%f4,	%f26,	%f20
loop_558:
	orcc	%g6,	%o4,	%i0
	fmovso	%fcc1,	%f9,	%f26
	fxor	%f30,	%f8,	%f10
	srl	%i4,	%o6,	%l4
	call	loop_559
	movule	%fcc3,	0x080,	%i1
	call	loop_560
	add	%g3,	%g1,	%l2
loop_559:
	call	loop_561
	nop
	fitos	%f10,	%f5
	fstoi	%f5,	%f12
loop_560:
	fbl	%fcc2,	loop_562
	call	loop_563
loop_561:
	bgu	%xcc,	loop_564
	fmovrdne	%i6,	%f12,	%f14
loop_562:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_563:
	movcs	%icc,	0x4DB,	%o1
loop_564:
	fmovdpos	%icc,	%f4,	%f24
	fmovsul	%fcc1,	%f20,	%f31
	ldstub	[%l7 + 0x0F],	%o7
	wrpr	%o5,	%l0,	%pil
	call	loop_565
	movrgez	%l3,	0x177,	%g5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x80
loop_565:
	fmovrdlz	%g4,	%f24,	%f16
	taddcc	%i7,	0x076B,	%l5
	call	loop_566
	fabss	%f10,	%f31
	move	%xcc,	%o0,	%l1
	fmovdul	%fcc0,	%f4,	%f28
loop_566:
	bl,pn	%icc,	loop_567
	call	loop_568
	fxnors	%f16,	%f10,	%f10
	fpsub16	%f4,	%f2,	%f0
loop_567:
	fpsub32s	%f22,	%f31,	%f31
loop_568:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	brlz,pt	%g7,	loop_569
	call	loop_570
	call	loop_571
	call	loop_572
loop_569:
	sir	0x0784
loop_570:
	fmovdug	%fcc2,	%f26,	%f4
loop_571:
	fabss	%f26,	%f1
loop_572:
	nop
	set	0x44, %o7
	ldsh	[%l7 + %o7],	%o2
	nop
	setx	0xA005345245B314A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF62DFD1689044B7F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f12,	%f20
	fmovdvs	%xcc,	%f12,	%f24
	edge16ln	%i5,	%l6,	%g2
	fmovsleu	%xcc,	%f24,	%f15
	fnor	%f28,	%f8,	%f14
	sethi	0x1B58,	%o3
	call	loop_573
	movuge	%fcc3,	%i2,	%o4
	fmovsle	%fcc0,	%f4,	%f25
	call	loop_574
loop_573:
	nop
	setx	0x7C0634A7DC2086E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x5B86C96DCB82CE71,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f10,	%f20
	orncc	%g6,	%i0,	%o6
	call	loop_575
loop_574:
	fabsd	%f0,	%f16
	movg	%xcc,	%i4,	%l4
	sdivx	%g3,	0x00,	%i1
loop_575:
	fmul8x16al	%f20,	%f29,	%f10
	fabsd	%f22,	%f20
	fmovrdlz	%l2,	%f20,	%f14
	addc	%i6,	%o1,	%o7
	call	loop_576
	fmovdvc	%icc,	%f22,	%f0
	fmuld8ulx16	%f29,	%f15,	%f14
	call	loop_577
loop_576:
	bl,a	%xcc,	loop_578
	call	loop_579
	fmovdneg	%icc,	%f26,	%f16
loop_577:
	call	loop_580
loop_578:
	nop
	setx	0x25ACA394,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x8FEF51FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f27,	%f10
loop_579:
	call	loop_581
	fmovdue	%fcc3,	%f18,	%f2
loop_580:
	movn	%icc,	0x057,	%o5
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%l0
loop_581:
	movgu	%xcc,	0x093,	%l3
	movuge	%fcc2,	%g1,	%g5
	call	loop_582
	edge8ln	%g4,	%i7,	%o0
	call	loop_583
	fmul8sux16	%f4,	%f22,	%f30
loop_582:
	nop

loop_583:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 35
!	Type a   	: 18
!	Type x   	: 11
!	Type cti   	: 133
!	Type f   	: 164
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
	set	0x1,	%g1
	set	0x4,	%g2
	set	0x8,	%g3
	set	0x8,	%g4
	set	0xB,	%g5
	set	0x9,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xA,	%i1
	set	-0xE,	%i2
	set	-0xE,	%i3
	set	-0x1,	%i4
	set	-0x8,	%i5
	set	-0xB,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x6CF6869D,	%l0
	set	0x0D4A8992,	%l1
	set	0x39C6C962,	%l2
	set	0x56C6BD4F,	%l3
	set	0x1D32A147,	%l4
	set	0x359E21C9,	%l5
	set	0x0B73ABEB,	%l6
	!# Output registers
	set	-0x07B4,	%o0
	set	0x1B10,	%o1
	set	-0x1713,	%o2
	set	0x09D7,	%o3
	set	0x10E8,	%o4
	set	-0x0665,	%o5
	set	-0x05F8,	%o6
	set	0x0DF1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	fmovsug	%fcc2,	%f3,	%f19
	fmovspos	%xcc,	%f13,	%f1
	call	loop_584
	nop
	fitos	%f14,	%f13
	fstoi	%f13,	%f30
	nop
	setx	0x8B511EB59A2F3119,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xAD244D322BA49038,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f18,	%f26
	call	loop_585
loop_584:
	subc	%l1,	%i3,	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x793, 	%hsys_tick_cmpr
	call	loop_586
loop_585:
	array8	%g7,	%i5,	%g2
	call	loop_587
	add	%o3,	0x09ED,	%l6
loop_586:
	fand	%f22,	%f26,	%f20
	andcc	%i2,	%o4,	%g6
loop_587:
	and	%o6,	%i0,	%i4
	xnor	%g3,	%l4,	%i1
	bge	%icc,	loop_588
	call	loop_589
	call	loop_590
	tge	%icc,	0x3
loop_588:
	fzero	%f4
loop_589:
	fmovrse	%i6,	%f12,	%f20
loop_590:
	call	loop_591
	brlz,a,pn	%o1,	loop_592
	call	loop_593
	bne,a,pt	%icc,	loop_594
loop_591:
	srlx	%o7,	%l2,	%l0
loop_592:
	te	%xcc,	0x6
loop_593:
	call	loop_595
loop_594:
	edge16	%l3,	%o5,	%g5
	fmul8sux16	%f6,	%f4,	%f12
	tneg	%icc,	0x0
loop_595:
	fmovdu	%fcc2,	%f14,	%f30
	call	loop_596
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f2
	fmovslg	%fcc2,	%f1,	%f17
	fnot2	%f16,	%f2
loop_596:
	udiv	%g1,	%i7,	%o0
	fzeros	%f26
	call	loop_597
	movul	%fcc0,	0x70C,	%g4
	nop
	setx	0xA82A38F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9D6A8E90,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f7,	%f21
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_597:
	fmovdcc	%icc,	%f8,	%f14
	fors	%f31,	%f23,	%f5
	fbo,a	%fcc0,	loop_598
	orn	%l1,	0x01C0,	%i3
	movge	%fcc0,	0x600,	%l5
	fmovrdgez	%o2,	%f4,	%f24
loop_598:
	sdivx	%g7,	%g2,	%i5
	bleu,pn	%icc,	loop_599
	fmovdl	%xcc,	%f18,	%f8
	fornot2s	%f15,	%f0,	%f24
	fexpand	%f4,	%f22
loop_599:
	call	loop_600
	bcc	%icc,	loop_601
	brlz,pt	%l6,	loop_602
	bleu,pt	%icc,	loop_603
loop_600:
	fornot2s	%f11,	%f30,	%f10
loop_601:
	fmovdle	%icc,	%f0,	%f10
loop_602:
	nop
	setx	loop_604,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011400001402,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_603:
	subcc	%i2,	%o4,	%g6
	call	loop_605
	call	loop_606
loop_604:
	movue	%fcc1,	%o3,	%o6
	nop
	fitod	%f8,	%f26
	fdtoi	%f26,	%f12
loop_605:
	fandnot1	%f20,	%f22,	%f18
loop_606:
	fmovrdgz	%i4,	%f28,	%f12
	ld	[%l7 + 0x6C],	%f31
	fsrc1s	%f2,	%f15
	stx	%g3,	[%l7 + 0x28]
	sub	%l4,	0x1DC8,	%i1
	fnors	%f16,	%f4,	%f31
	bgu,a,pt	%icc,	loop_607
	fmovscs	%xcc,	%f29,	%f12
	call	loop_608
	fmovdn	%xcc,	%f8,	%f4
loop_607:
	tvs	%icc,	0x7
	fmovsug	%fcc3,	%f14,	%f17
loop_608:
	xnorcc	%i0,	0x0DE0,	%o1
	call	loop_609
	rdpr	%otherwin,	%i6
	call	loop_610
	fmul8x16au	%f4,	%f22,	%f2
loop_609:
	fmovsl	%fcc0,	%f11,	%f13
	call	loop_611
loop_610:
	fmovrsgez	%l2,	%f30,	%f14
	fmovsle	%fcc3,	%f26,	%f4
	fmovdlg	%fcc0,	%f2,	%f26
loop_611:
	addcc	%l0,	0x0345,	%l3
	brlz,a,pt	%o7,	loop_612
	sllx	%o5,	%g5,	%i7
	call	loop_613
	edge8	%o0,	%g4,	%l1
loop_612:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%l5
loop_613:
	te	%xcc,	0x2
	call	loop_614
	call	loop_615
	tcc	%xcc,	0x4
	wr	%o2,	0x1FD7,	%sys_tick
loop_614:
	call	loop_616
loop_615:
	fpackfix	%f24,	%f3
	fbne,a,pt	%fcc0,	loop_617
	movug	%fcc0,	%g7,	%g1
loop_616:
	fands	%f20,	%f15,	%f27
	bcc	%xcc,	loop_618
loop_617:
	nop
	setx	0x78A8D583,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f10
	stbar
	brgez,a,pn	%g2,	loop_619
loop_618:
	call	loop_620
	nop
	setx	0x3F0F7756,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA77893E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f3,	%f27
	bge	%icc,	loop_621
loop_619:
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_620:
	call	loop_622
	wrpr 	%g0, 	0x2, 	%gl
loop_621:
	call	loop_623
	st	%f22,	[%l7 + 0x6C]
loop_622:
	call	loop_624
	brlez,pn	%o4,	loop_625
loop_623:
	call	loop_626
	fandnot1s	%f28,	%f6,	%f5
loop_624:
	movl	%xcc,	%g6,	%i2
loop_625:
	brlz	%o3,	loop_627
loop_626:
	tleu	%xcc,	0x5
	call	loop_628
	fnands	%f31,	%f8,	%f4
loop_627:
	call	loop_629
	fmovdl	%fcc2,	%f14,	%f22
loop_628:
	nop
	set	0x74, %g3
	flush	%l7 + %g3
	fandnot1	%f24,	%f28,	%f2
loop_629:
	array8	%o6,	%i4,	%l4
	movpos	%icc,	0x213,	%g3
	movg	%fcc0,	0x551,	%i0
	call	loop_630
	call	loop_631
	array8	%i1,	%i6,	%l2
	fmovsue	%fcc1,	%f2,	%f3
loop_630:
	fmovsuge	%fcc1,	%f25,	%f21
loop_631:
	fmovdpos	%xcc,	%f20,	%f8
	call	loop_632
	sethi	0x083A,	%l0
	movne	%fcc1,	%o1,	%o7
	call	loop_633
loop_632:
	move	%fcc2,	%l3,	%o5
	call	loop_634
	addc	%i7,	0x1E63,	%o0
loop_633:
	mulscc	%g4,	0x10D2,	%g5
	nop
	set	0x18, %l4
	ldub	[%l7 + %l4],	%l1
loop_634:
	srlx	%l5,	0x05,	%i3
	fmovdvs	%icc,	%f10,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_635
	fnegs	%f18,	%f27
	fmul8x16au	%f13,	%f6,	%f18
	wr	%o2,	%g2,	%softint
loop_635:
	sir	0x0399
	call	loop_636
	call	loop_637
	nop
	setx	0x6D800421,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x4B9A2842,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f0,	%f30
	call	loop_638
loop_636:
	call	loop_639
loop_637:
	call	loop_640
	call	loop_641
loop_638:
	sra	%l6,	0x1B,	%g1
loop_639:
	movlg	%fcc2,	0x2B1,	%o4
loop_640:
	fmovrsgz	%i5,	%f19,	%f19
loop_641:
	addc	%g6,	%o3,	%i2
	fpack16	%f20,	%f17
	fmovrsne	%o6,	%f30,	%f15
	nop
	setx	loop_642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x011100001405,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_643
	nop
	setx	0x31561560FF534912,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	call	loop_644
loop_642:
	sll	%l4,	%g3,	%i0
loop_643:
	fands	%f20,	%f10,	%f0
	rdhpr	%hintp,	%i4
loop_644:
	fornot1	%f30,	%f22,	%f8
	movne	%fcc0,	%i6,	%l2
	udivx	%l0,	0x00,	%i1
	call	loop_645
	bne,a,pn	%xcc,	loop_646
	call	loop_647
	call	loop_648
loop_645:
	bleu,pn	%icc,	loop_649
loop_646:
	fmovsleu	%xcc,	%f12,	%f8
loop_647:
	mova	%xcc,	%o7,	%o1
loop_648:
	rdpr	%cansave,	%o5
loop_649:
	call	loop_650
	orn	%l3,	%o0,	%g4
	fpsub32s	%f17,	%f28,	%f17
	ld	[%l7 + 0x2C],	%f26
loop_650:
	tgu	%xcc,	0x4
	nop
	set	0x15, %l0
	ldub	[%l7 + %l0],	%g5
	call	loop_651
	rd	%y,	%i7
	call	loop_652
	call	loop_653
loop_651:
	fmovspos	%icc,	%f29,	%f24
	edge8n	%l1,	%l5,	%g7
loop_652:
	call	loop_654
loop_653:
	call	loop_655
	fpadd16s	%f7,	%f18,	%f17
	subccc	%o2,	%g2,	%l6
loop_654:
	call	loop_656
loop_655:
	call	loop_657
	edge8	%g1,	%i3,	%i5
	wr	%g0,	0x04,	%asi
	sta	%f21,	[%l7 + 0x58] %asi
loop_656:
	andcc	%g6,	%o4,	%o3
loop_657:
	tvc	%xcc,	0x5
	nop
	setx	0x2752F4F35AD616BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB49A30ECED0C656E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f12,	%f6
	fmovd	%f30,	%f24
	movul	%fcc1,	%i2,	%l4
	call	loop_658
	movrne	%o6,	%i0,	%i4
	movpos	%xcc,	0x1F3,	%i6
	call	loop_659
loop_658:
	fmul8x16au	%f17,	%f22,	%f24
	fcmpgt16	%f2,	%f4,	%l2
	fmovsug	%fcc3,	%f23,	%f27
loop_659:
	fmovdge	%fcc2,	%f18,	%f8
	fmovsl	%icc,	%f23,	%f30
	call	loop_660
	fmovdneg	%xcc,	%f4,	%f18
	movrne	%l0,	%i1,	%g3
	call	loop_661
loop_660:
	nop
	fitos	%f8,	%f1
	fstoi	%f1,	%f21
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f28
	sra	%o1,	%o5,	%l3
loop_661:
	fbul,a,pt	%fcc0,	loop_662
	fpadd32	%f24,	%f10,	%f6
	movgu	%xcc,	0x538,	%o0
	fnands	%f10,	%f25,	%f26
loop_662:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	movrlez	%i7,	%o7,	%l1
	call	loop_663
	andn	%l5,	0x0E58,	%g7
	fbul	%fcc2,	loop_664
	bmask	%g2,	%o2,	%g1
loop_663:
	udivx	%l6,	0x00,	%i3
	fbuge,a	%fcc0,	loop_665
loop_664:
	fmovsle	%fcc2,	%f18,	%f0
	call	loop_666
	fmovrsne	%g6,	%f5,	%f21
loop_665:
	fnor	%f8,	%f2,	%f12
	nop
	setx	0x4C2DFED1767E073F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x577F0D4C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f12,	%f18
loop_666:
	tvc	%icc,	0x4
	fornot1	%f18,	%f18,	%f16
	alignaddr	%i5,	%o4,	%o3
	fmovdvs	%icc,	%f4,	%f4
	bcc,a,pn	%xcc,	loop_667
	fmovdue	%fcc0,	%f22,	%f22
	mulx	%i2,	%l4,	%o6
	nop
	setx	loop_668,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x002100001402,	%l0,	%l1
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
loop_667:
	alignaddr	%i0,	%i6,	%i4
	xor	%l0,	0x0343,	%l2
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_668:
	fmovdcs	%icc,	%f18,	%f14
	movlg	%fcc3,	%g3,	%o1
	call	loop_669
	fmovrsne	%i1,	%f25,	%f26
	call	loop_670
	fbo,pt	%fcc3,	loop_671
loop_669:
	fpackfix	%f20,	%f23
	fmovrdgz	%l3,	%f0,	%f28
loop_670:
	mulscc	%o5,	%o0,	%g5
loop_671:
	fmul8x16al	%f19,	%f1,	%f12
	fzeros	%f17
	movleu	%xcc,	0x59C,	%g4
	st	%f18,	[%l7 + 0x24]
	move	%icc,	0x2AC,	%i7
	movue	%fcc2,	0x485,	%o7
	fbl,a,pt	%fcc3,	loop_672
	call	loop_673
	call	loop_674
	fnors	%f0,	%f25,	%f16
loop_672:
	movrlez	%l5,	%l1,	%g7
loop_673:
	call	loop_675
loop_674:
	bgu,a	%icc,	loop_676
	fors	%f1,	%f20,	%f17
	nop
	setx	0xE772C64A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xC170BC62,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f2,	%f31
loop_675:
	tgu	%xcc,	0x2
loop_676:
	movg	%fcc3,	%o2,	%g1
	bcs	%xcc,	loop_677
	call	loop_678
	fornot1s	%f29,	%f29,	%f8
	rdhpr	%hsys_tick_cmpr,	%l6
loop_677:
	nop
	setx	0x41ACF8BFA6B3194A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xDA8200991966BABE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f6,	%f10
loop_678:
	call	loop_679
	xor	%i3,	0x10DA,	%g2
	fmovrslez	%i5,	%f25,	%f10
	rd	%asi,	%g6
loop_679:
	edge16l	%o3,	%i2,	%o4
	fpsub32	%f12,	%f0,	%f14
	fone	%f0
	andncc	%l4,	%i0,	%i6
	fmovsg	%icc,	%f17,	%f30
	call	loop_680
	tpos	%icc,	0x5
	edge16ln	%o6,	%l0,	%l2
	call	loop_681
loop_680:
	fornot2s	%f10,	%f6,	%f29
	call	loop_682
	bne,pn	%icc,	loop_683
loop_681:
	call	loop_684
	tpos	%icc,	0x0
loop_682:
	tsubcc	%g3,	0x0A6A,	%i4
loop_683:
	nop
	fitos	%f0,	%f8
	fstod	%f8,	%f6
loop_684:
	fmovscs	%icc,	%f20,	%f23
	fpadd16s	%f16,	%f12,	%f2
	movo	%fcc1,	0x1CA,	%i1
	set	0x45, %g7
	ldstuba	[%l7 + %g7] 0x0c,	%o1
	fcmps	%fcc0,	%f23,	%f6
	wrpr	%l3,	%o5,	%pil
	fbuge,a	%fcc1,	loop_685
	fandnot2s	%f8,	%f16,	%f19
	set	0x28, %l6
	stxa	%o0,	[%l7 + %l6] 0x22
	membar	#Sync
loop_685:
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f3
	fpack16	%f2,	%f7
	fones	%f21
	array32	%g4,	%i7,	%o7
	xnor	%l5,	%g5,	%g7
	rdhpr	%hintp,	%o2
	fxors	%f28,	%f7,	%f0
	call	loop_686
	fcmpd	%fcc3,	%f8,	%f6
	fbue,a	%fcc2,	loop_687
	call	loop_688
loop_686:
	call	loop_689
	movge	%fcc2,	0x4F5,	%l1
loop_687:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_688:
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f24
loop_689:
	fabsd	%f6,	%f12
	call	loop_690
	call	loop_691
	nop
	setx	0x220B45164F48493B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x5BB0CA9871D6F5B1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f2,	%f4
	nop
	fitos	%f5,	%f1
	fstoi	%f1,	%f10
loop_690:
	movpos	%xcc,	0x64A,	%i3
loop_691:
	call	loop_692
	fmovsgu	%icc,	%f23,	%f20
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%g2
loop_692:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	move	%icc,	%o3,	%i2
	add	%g6,	%o4,	%i0
	fmovse	%xcc,	%f26,	%f17
	te	%xcc,	0x7
	call	loop_693
	call	loop_694
	call	loop_695
	movneg	%xcc,	0x580,	%i6
loop_693:
	movo	%fcc1,	%o6,	%l0
loop_694:
	bvc,a,pt	%icc,	loop_696
loop_695:
	move	%fcc0,	0x513,	%l2
	subccc	%l4,	0x0FFE,	%i4
	tcc	%xcc,	0x7
loop_696:
	call	loop_697
	call	loop_698
	rdhpr	%ver,	%i1
	fand	%f8,	%f18,	%f2
loop_697:
	fblg,a	%fcc1,	loop_699
loop_698:
	nop
	setx	0x3FC8FC25D98EB728,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBCAFBCD7B7E9FBC5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f22,	%f24
	call	loop_700
	call	loop_701
loop_699:
	fmovrsne	%g3,	%f18,	%f20
	ldd	[%l7 + 0x40],	%f2
loop_700:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l3
loop_701:
	srl	%o5,	%o0,	%o1
	wr	%i7,	%o7,	%clear_softint
	movug	%fcc1,	%l5,	%g4
	fmul8x16al	%f16,	%f12,	%f14
	nop
	set	0x2E, %i3
	ldsh	[%l7 + %i3],	%g7
	sir	0x0916
	alignaddr	%g5,	%l1,	%l6
	fpmerge	%f16,	%f12,	%f28
	fxors	%f10,	%f13,	%f12
	bvs,a	%icc,	loop_702
	wrpr	%g1,	0x0BCB,	%tick
	rdhpr	%htba,	%o2
	fmovrde	%i3,	%f24,	%f8
loop_702:
	xorcc	%g2,	0x1BB6,	%i5
	nop
	setx	0x35311811589CE0F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x93603B9266C6FFA4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f4,	%f10
	fmovrdlz	%o3,	%f8,	%f8
	fnot2	%f20,	%f30
	subccc	%i2,	0x0CEF,	%o4
	udiv	%i0,	%i6,	%o6
	rd	%softint,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovdue	%fcc3,	%f18,	%f18
	brlz	%g6,	loop_703
	fmovde	%fcc1,	%f22,	%f26
	tcc	%xcc,	0x3
	fmovdo	%fcc1,	%f10,	%f8
loop_703:
	call	loop_704
	sir	0x0009
	fcmps	%fcc3,	%f21,	%f17
	call	loop_705
loop_704:
	fandnot2	%f22,	%f16,	%f6
	set	0x1C, %g1
	sta	%f7,	[%l7 + %g1] 0x11
loop_705:
	movgu	%xcc,	%i4,	%l4
	mulscc	%i1,	%l3,	%o5
	udivx	%g3,	0x00,	%o1
	fpsub32s	%f20,	%f29,	%f3
	edge16	%o0,	%i7,	%l5
	call	loop_706
	fmovdgu	%xcc,	%f8,	%f16
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x10,	%o6
loop_706:
	tneg	%xcc,	0x5
	fmovsvc	%icc,	%f14,	%f18
	call	loop_707
	call	loop_708
	call	loop_709
	call	loop_710
loop_707:
	call	loop_711
loop_708:
	alignaddr	%g4,	%g5,	%g7
loop_709:
	fxnor	%f4,	%f26,	%f6
loop_710:
	wrpr	%l1,	0x0EC3,	%cwp
loop_711:
	sra	%l6,	%g1,	%i3
	call	loop_712
	fmovrse	%o2,	%f0,	%f7
	udivx	%i5,	%g2,	%o3
	call	loop_713
loop_712:
	call	loop_714
	fpadd32	%f28,	%f4,	%f10
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_713:
	movl	%icc,	%i2,	%o4
loop_714:
	mova	%fcc0,	%i0,	%o6
	call	loop_715
	wr	%l0,	%l2,	%softint
	smulcc	%g6,	%i4,	%i6
	rd	%pc,	%i1
loop_715:
	tge	%xcc,	0x1
	call	loop_716
	rdhpr	%ver,	%l3
	xnorcc	%o5,	0x1B58,	%l4
	call	loop_717
loop_716:
	fbug,a	%fcc0,	loop_718
	rdhpr	%hintp,	%g3
	fmovsuge	%fcc1,	%f2,	%f11
loop_717:
	bmask	%o0,	%o1,	%i7
loop_718:
	wrpr	%o7,	%l5,	%pil
	call	loop_719
	call	loop_720
	edge8ln	%g4,	%g5,	%l1
	nop
	fitos	%f0,	%f19
	fstox	%f19,	%f20
loop_719:
	xor	%l6,	0x13AB,	%g1
loop_720:
	call	loop_721
	ldstub	[%l7 + 0x2D],	%g7
	set	0x62, %o2
	ldsha	[%l7 + %o2] 0x04,	%o2
loop_721:
	fnegs	%f20,	%f5
	call	loop_722
	movleu	%icc,	%i5,	%i3
	fornot2	%f2,	%f4,	%f8
	call	loop_723
loop_722:
	nop
	setx loop_724, %l0, %l1
	jmpl %l1, %g2
	nop
	fitos	%f13,	%f13
	fstoi	%f13,	%f3
	movrne	%i2,	0x1E3,	%o3
loop_723:
	smulcc	%o4,	%o6,	%i0
loop_724:
	fmovse	%fcc0,	%f19,	%f24
	call	loop_725
	fble,a	%fcc1,	loop_726
	fmovsl	%xcc,	%f22,	%f24
	fmovdge	%fcc2,	%f0,	%f22
loop_725:
	call	loop_727
loop_726:
	sir	0x1EF8
	fbule,pn	%fcc0,	loop_728
	call	loop_729
loop_727:
	fornot1	%f24,	%f10,	%f16
	movn	%fcc0,	0x139,	%l2
loop_728:
	nop
	set	0x20, %o1
	std	%f18,	[%l7 + %o1]
loop_729:
	call	loop_730
	bshuffle	%f30,	%f20,	%f24
	call	loop_731
	nop
	setx	0xCC3C61C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
loop_730:
	movpos	%xcc,	%l0,	%g6
	nop
	setx	0x78789432,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xED59C630,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f4,	%f2
loop_731:
	fcmple32	%f22,	%f12,	%i6
	fmovsle	%xcc,	%f4,	%f1
	fmuld8sux16	%f5,	%f16,	%f30
	movvc	%xcc,	0x6A7,	%i4
	fmovdule	%fcc1,	%f6,	%f22
	fmul8ulx16	%f0,	%f4,	%f6
	fmovsa	%xcc,	%f5,	%f25
	membar	0x71
	call	loop_732
	call	loop_733
	call	loop_734
	fmovsvs	%icc,	%f19,	%f21
loop_732:
	fxors	%f12,	%f1,	%f13
loop_733:
	wr	%l3,	0x1475,	%clear_softint
loop_734:
	fpsub16	%f20,	%f12,	%f22
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 26
!	Type a   	: 28
!	Type x   	: 11
!	Type cti   	: 151
!	Type f   	: 151
!	Type i   	: 133
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
	set	0x4,	%g1
	set	0xB,	%g2
	set	0xF,	%g3
	set	0x4,	%g4
	set	0x6,	%g5
	set	0x0,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0x0,	%i1
	set	-0x4,	%i2
	set	-0x9,	%i3
	set	-0xE,	%i4
	set	-0x1,	%i5
	set	-0xA,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x67F35AD6,	%l0
	set	0x79ABE87C,	%l1
	set	0x66CE40C2,	%l2
	set	0x78C482F9,	%l3
	set	0x5A059DA9,	%l4
	set	0x1752A041,	%l5
	set	0x63E12959,	%l6
	!# Output registers
	set	0x0327,	%o0
	set	0x1B1E,	%o1
	set	0x0F35,	%o2
	set	-0x144F,	%o3
	set	-0x0D22,	%o4
	set	-0x1AB9,	%o5
	set	0x1011,	%o6
	set	0x16FE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	fmovdue	%fcc1,	%f2,	%f12
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x11,	%o5,	%l4
	addccc	%g3,	%o0,	%o1
	fnot1s	%f27,	%f7
	fmovrdlez	%i7,	%f12,	%f30
	call	loop_735
	call	loop_736
	fpadd32	%f22,	%f6,	%f28
	call	loop_737
loop_735:
	fmovrsne	%o7,	%f6,	%f22
loop_736:
	sll	%i1,	%l5,	%g5
	xnor	%g4,	0x0BF5,	%l6
loop_737:
	fpsub16s	%f26,	%f12,	%f15
	brgz	%l1,	loop_738
	tsubcctv	%g7,	%o2,	%i5
	fpadd32	%f18,	%f20,	%f30
	fmovsa	%xcc,	%f31,	%f16
loop_738:
	fmovrsgz	%g1,	%f15,	%f20
	fcmpgt32	%f14,	%f2,	%i3
	nop
	setx	0xE5EAE872E6930EDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xFEE3FB582946B18D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f20,	%f16
	movl	%icc,	0x73D,	%i2
	movgu	%icc,	0x54A,	%o3
	call	loop_739
	edge16ln	%g2,	%o6,	%i0
	wrpr	%o4,	%l2,	%pil
	fcmps	%fcc3,	%f6,	%f4
loop_739:
	nop
	fitod	%f30,	%f14
	tg	%xcc,	0x6
	nop
	setx	0xD28AD5F19FD9342D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0010162CC26ADFF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f10,	%f16
	fornot2	%f8,	%f2,	%f28
	wr	%g0,	0x4f,	%asi
	stxa	%g6,	[%g0 + 0x20] %asi
	fcmpne32	%f12,	%f20,	%l0
	orcc	%i4,	%l3,	%i6
	ldd	[%l7 + 0x30],	%o4
	call	loop_740
	fcmpne16	%f20,	%f26,	%l4
	call	loop_741
	movue	%fcc0,	%g3,	%o0
loop_740:
	fmul8x16	%f14,	%f4,	%f28
	fmovs	%f30,	%f12
loop_741:
	nop
	set	0x55, %i2
	ldstub	[%l7 + %i2],	%o1
	srax	%o7,	0x12,	%i1
	smulcc	%i7,	%g5,	%g4
	tneg	%icc,	0x0
	nop
	setx	0x7859F9BDC726AADD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x26448E4AF089587E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f22,	%f8
	wrpr	%l5,	%l6,	%pil
	call	loop_742
	fpsub32s	%f30,	%f28,	%f22
	brlz,pn	%g7,	loop_743
	fmovse	%icc,	%f7,	%f15
loop_742:
	fmovdule	%fcc3,	%f14,	%f22
	call	loop_744
loop_743:
	orncc	%l1,	%o2,	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x04,	%i5,	%i3
loop_744:
	fmovdug	%fcc0,	%f0,	%f28
	fble	%fcc1,	loop_745
	call	loop_746
	rdhpr	%htba,	%o3
	bn,a,pt	%xcc,	loop_747
loop_745:
	fpackfix	%f30,	%f12
loop_746:
	fmovsneg	%xcc,	%f18,	%f23
	nop
	setx	0x6506EE89,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x81769C5A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f22,	%f2
loop_747:
	and	%g2,	0x0244,	%i2
	tleu	%xcc,	0x6
	fcmpne32	%f2,	%f22,	%o6
	rd	%ccr,	%o4
	call	loop_748
	fmovscs	%icc,	%f8,	%f12
	fmovsa	%fcc1,	%f17,	%f14
	andcc	%l2,	0x03D5,	%g6
loop_748:
	call	loop_749
	brlz,pt	%i0,	loop_750
	fmovdvs	%icc,	%f6,	%f10
	fornot2	%f8,	%f14,	%f10
loop_749:
	nop
	setx	loop_751,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x004100001401,	%l0,	%l1
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
loop_750:
	subc	%i4,	%l3,	%i6
	call	loop_752
	call	loop_753
loop_751:
	fandnot2	%f24,	%f14,	%f6
	addc	%o5,	%l4,	%l0
loop_752:
	call	loop_754
loop_753:
	edge16ln	%o0,	%g3,	%o7
	fornot1	%f4,	%f2,	%f10
	movule	%fcc3,	%i1,	%i7
loop_754:
	edge32ln	%g5,	%g4,	%l5
	fbue,a,pt	%fcc0,	loop_755
	fmovdcs	%icc,	%f2,	%f22
	movgu	%icc,	0x31E,	%o1
	call	loop_756
loop_755:
	fmovde	%xcc,	%f6,	%f14
	brlz	%g7,	loop_757
	call	loop_758
loop_756:
	edge32	%l1,	%l6,	%o2
	tpos	%icc,	0x2
loop_757:
	movrne	%g1,	0x3AF,	%i3
loop_758:
	fmovdcs	%icc,	%f18,	%f24
	sdivx	%i5,	0x00,	%o3
	fmovsa	%fcc3,	%f27,	%f20
	fcmpne32	%f2,	%f26,	%i2
	call	loop_759
	fornot2	%f12,	%f4,	%f8
	fmovrdlz	%o6,	%f4,	%f10
	movre	%o4,	0x2B6,	%g2
loop_759:
	mulx	%g6,	%l2,	%i4
	udivx	%l3,	0x00,	%i0
	fmovsneg	%icc,	%f22,	%f15
	fmovsn	%fcc2,	%f13,	%f20
	call	loop_760
	call	loop_761
	fmovdneg	%icc,	%f12,	%f6
	fmovdn	%xcc,	%f14,	%f6
loop_760:
	fnot2	%f14,	%f20
loop_761:
	taddcctv	%o5,	0x1951,	%i6
	call	loop_762
	call	loop_763
	fpsub16	%f30,	%f0,	%f28
	call	loop_764
loop_762:
	tgu	%xcc,	0x7
loop_763:
	fzeros	%f3
	movo	%fcc3,	%l4,	%l0
loop_764:
	fmovrdgz	%o0,	%f12,	%f24
	fand	%f30,	%f12,	%f20
	fcmpeq32	%f16,	%f0,	%g3
	fcmpgt32	%f16,	%f0,	%i1
	call	loop_765
	stw	%i7,	[%l7 + 0x70]
	fors	%f20,	%f5,	%f24
	rdhpr	%hintp,	%o7
loop_765:
	nop
	fitod	%f4,	%f30
	fdtos	%f30,	%f30
	call	loop_766
	nop
	setx	0xB38C020C2BC1AA32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xC56385E993E519A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f24,	%f30
	fmovs	%f9,	%f6
	tcc	%xcc,	0x1
loop_766:
	edge16l	%g5,	%l5,	%o1
	mulscc	%g4,	0x168B,	%l1
	fbge	%fcc0,	loop_767
	move	%fcc1,	%g7,	%o2
	fcmped	%fcc0,	%f6,	%f22
	call	loop_768
loop_767:
	call	loop_769
	fmovsne	%fcc0,	%f30,	%f23
	subcc	%l6,	%i3,	%g1
loop_768:
	call	loop_770
loop_769:
	for	%f20,	%f28,	%f2
	movlg	%fcc1,	%i5,	%o3
	nop
	setx	0x5F9FAE5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xD9C8C3EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f0,	%f21
loop_770:
	fabsd	%f14,	%f8
	edge8l	%i2,	%o6,	%g2
	call	loop_771
	call	loop_772
	call	loop_773
	mulx	%g6,	%l2,	%i4
loop_771:
	sll	%o4,	0x12,	%l3
loop_772:
	and	%o5,	0x0A30,	%i0
loop_773:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f2,	[%l7 + 0x0C] %asi
	brlez	%i6,	loop_774
	tgu	%icc,	0x0
	smul	%l4,	%l0,	%g3
	andncc	%o0,	%i7,	%i1
loop_774:
	mulscc	%o7,	0x0CF3,	%g5
	tneg	%icc,	0x7
	call	loop_775
	call	loop_776
	fcmpes	%fcc0,	%f15,	%f31
	nop
	setx	0x6231DED1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x63E047F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f9,	%f9
loop_775:
	fsrc2s	%f2,	%f2
loop_776:
	fmovrdgz	%o1,	%f28,	%f20
	call	loop_777
	bneg,a	%icc,	loop_778
	call	loop_779
	call	loop_780
loop_777:
	call	loop_781
loop_778:
	nop
	setx	loop_782,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x031100001403,	%l0,	%l1
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
loop_779:
	fexpand	%f25,	%f12
loop_780:
	movo	%fcc0,	0x34A,	%g4
loop_781:
	fmovdle	%icc,	%f26,	%f24
loop_782:
	fzeros	%f29
	fmul8ulx16	%f2,	%f24,	%f4
	call	loop_783
	bge,a	%xcc,	loop_784
	movleu	%xcc,	%l5,	%l1
	tvs	%icc,	0x2
loop_783:
	fzero	%f12
loop_784:
	tle	%xcc,	0x4
	rdhpr	%hintp,	%o2
	call	loop_785
	movpos	%icc,	%g7,	%i3
	tl	%xcc,	0x1
	rdhpr	%hpstate,	%l6
loop_785:
	nop
	fitod	%f12,	%f10
	fdtoi	%f10,	%f27
	fmovda	%icc,	%f28,	%f30
	tneg	%icc,	0x4
	tle	%xcc,	0x0
	fandnot2s	%f18,	%f27,	%f28
	call	loop_786
	call	loop_787
	fmovdlg	%fcc0,	%f0,	%f6
	call	loop_788
loop_786:
	bg,a	%xcc,	loop_789
loop_787:
	fpadd16s	%f11,	%f20,	%f14
	addc	%i5,	0x0D09,	%o3
loop_788:
	call	loop_790
loop_789:
	call	loop_791
	call	loop_792
	srlx	%i2,	0x19,	%g1
loop_790:
	call	loop_793
loop_791:
	call	loop_794
loop_792:
	fabss	%f21,	%f19
	addcc	%g2,	0x0914,	%o6
loop_793:
	call	loop_795
loop_794:
	nop
	setx	0xB4CE8A56,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f13
	call	loop_796
	movrlz	%l2,	0x01A,	%i4
loop_795:
	sdiv	%o4,	%g6,	%l3
	call	loop_797
loop_796:
	call	loop_798
	rd	%pc,	%o5
	wr 	%g0, 	0x6, 	%fprs
loop_797:
	fmuld8ulx16	%f15,	%f6,	%f20
loop_798:
	call	loop_799
	fmovsug	%fcc1,	%f17,	%f7
	bcc	%xcc,	loop_800
	fmovs	%f3,	%f3
loop_799:
	fmovrsgez	%l4,	%f14,	%f21
	call	loop_801
loop_800:
	bcs,a	%icc,	loop_802
	fexpand	%f16,	%f8
	fmuld8sux16	%f16,	%f14,	%f6
loop_801:
	wrpr	%i6,	%g3,	%cwp
loop_802:
	addccc	%o0,	%l0,	%i7
	call	loop_803
	stx	%o7,	[%l7 + 0x20]
	fmovdle	%xcc,	%f26,	%f14
	fmovdvc	%icc,	%f30,	%f10
loop_803:
	call	loop_804
	smulcc	%i1,	%g5,	%o1
	fbue,a	%fcc1,	loop_805
	call	loop_806
loop_804:
	fzero	%f10
	call	loop_807
loop_805:
	tle	%icc,	0x5
loop_806:
	fmovdul	%fcc1,	%f16,	%f8
	edge16ln	%g4,	%l5,	%l1
loop_807:
	nop
	setx	0x0410047DA55F6310,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x14B3949F545B14C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f20,	%f24
	call	loop_808
	fmovduge	%fcc2,	%f4,	%f26
	fxors	%f9,	%f31,	%f11
	fandnot2s	%f20,	%f25,	%f26
loop_808:
	call	loop_809
	add	%g7,	0x1864,	%o2
	call	loop_810
	fpsub32	%f24,	%f10,	%f12
loop_809:
	te	%icc,	0x6
	call	loop_811
loop_810:
	edge16	%i3,	%i5,	%l6
	stw	%i2,	[%l7 + 0x60]
	popc	0x036E,	%o3
loop_811:
	nop
	set	0x62, %o3
	stha	%g2,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	fitos	%f1,	%f12
	fstoi	%f12,	%f0
	nop
	set	0x58, %g2
	stx	%o6,	[%l7 + %g2]
	tvc	%xcc,	0x2
	orn	%l2,	%g1,	%o4
	edge16	%g6,	%i4,	%l3
	set	0x60, %i0
	stha	%o5,	[%l7 + %i0] 0xeb
	membar	#Sync
	fmovrdne	%i0,	%f0,	%f4
	rdpr	%wstate,	%i6
	fmovrsgz	%l4,	%f15,	%f0
	call	loop_812
	fmovrdgez	%g3,	%f8,	%f16
	udiv	%o0,	%i7,	%l0
	call	loop_813
loop_812:
	nop
	setx	loop_814,	%l0,	%l1
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
	bcs,a,pn	%xcc,	loop_815
	call	loop_816
loop_813:
	fmovs	%f11,	%f15
loop_814:
	fand	%f28,	%f16,	%f26
loop_815:
	fsrc2s	%f2,	%f8
loop_816:
	call	loop_817
	movge	%fcc3,	0x76B,	%o7
	fbn,a	%fcc1,	loop_818
	fandnot2	%f28,	%f24,	%f26
loop_817:
	nop
	setx loop_819, %l0, %l1
	jmpl %l1, %i1
	fmovsue	%fcc0,	%f28,	%f8
loop_818:
	movrlez	%o1,	%g4,	%g5
	tleu	%xcc,	0x6
loop_819:
	fmovdlg	%fcc1,	%f0,	%f30
	fcmpgt16	%f12,	%f12,	%l1
	xnor	%g7,	%o2,	%i3
	call	loop_820
	sir	0x0D44
	call	loop_821
	fmovrdgz	%l5,	%f18,	%f28
loop_820:
	call	loop_822
	call	loop_823
loop_821:
	brnz	%i5,	loop_824
	call	loop_825
loop_822:
	movue	%fcc3,	0x0E6,	%l6
loop_823:
	movo	%fcc3,	%i2,	%o3
loop_824:
	nop
	setx	0xD918781A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x0D264AD5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f26,	%f22
loop_825:
	wr	%g2,	0x17D9,	%set_softint
	call	loop_826
	call	loop_827
	xnor	%l2,	0x0A99,	%o6
	wr 	%g0, 	0x6, 	%fprs
loop_826:
	fmovsug	%fcc2,	%f24,	%f11
loop_827:
	for	%f0,	%f20,	%f0
	fmovspos	%icc,	%f19,	%f8
	call	loop_828
	call	loop_829
	call	loop_830
	fmovd	%f18,	%f14
loop_828:
	fmovdpos	%xcc,	%f2,	%f6
loop_829:
	call	loop_831
loop_830:
	fmovdlg	%fcc2,	%f30,	%f30
	fmovdge	%icc,	%f10,	%f24
	udivcc	%g1,	%g6,	%l3
loop_831:
	fnot1s	%f21,	%f9
	fcmpne16	%f24,	%f24,	%i4
	call	loop_832
	fmovsvs	%xcc,	%f0,	%f2
	nop
	setx	0x54DDF07C511F7DE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x44E37EBAC4EF402C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f16,	%f30
	fbn,a	%fcc0,	loop_833
loop_832:
	fmovsleu	%icc,	%f12,	%f8
	call	loop_834
	addcc	%i0,	%o5,	%i6
loop_833:
	fcmpd	%fcc2,	%f12,	%f2
	bg,a	%xcc,	loop_835
loop_834:
	fandnot1	%f28,	%f10,	%f28
	call	loop_836
	fsrc1s	%f8,	%f16
loop_835:
	fones	%f3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_836:
	umulcc	%l4,	%o0,	%i7
	and	%o7,	%i1,	%l0
	fmovsu	%fcc1,	%f13,	%f7
	tleu	%icc,	0x0
	rd	%tick_cmpr,	%o1
	call	loop_837
	fcmpgt16	%f28,	%f30,	%g4
	tsubcc	%g5,	0x0B89,	%l1
	call	loop_838
loop_837:
	call	loop_839
	movvc	%xcc,	%g7,	%o2
	call	loop_840
loop_838:
	fbu	%fcc0,	loop_841
loop_839:
	fmovdgu	%xcc,	%f10,	%f12
	movu	%fcc2,	0x358,	%l5
loop_840:
	call	loop_842
loop_841:
	subccc	%i5,	0x0E75,	%i3
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f4
	nop
	fitos	%f10,	%f9
	fstox	%f9,	%f18
	fxtos	%f18,	%f13
loop_842:
	call	loop_843
	fandnot1	%f2,	%f2,	%f14
	call	loop_844
	fsrc1s	%f1,	%f20
loop_843:
	fmovdvs	%icc,	%f22,	%f28
	call	loop_845
loop_844:
	rd	%sys_tick_cmpr,	%i2
	wrpr	%l6,	%g2,	%pil
	call	loop_846
loop_845:
	movg	%xcc,	%l2,	%o3
	fmovdg	%xcc,	%f26,	%f0
	fmuld8ulx16	%f2,	%f7,	%f2
loop_846:
	fbg,pn	%fcc2,	loop_847
	call	loop_848
	fmovsule	%fcc1,	%f22,	%f30
	call	loop_849
loop_847:
	fmovde	%fcc0,	%f12,	%f26
loop_848:
	call	loop_850
	fmovdge	%fcc2,	%f22,	%f8
loop_849:
	fmovrdgz	%o6,	%f12,	%f10
	rdpr	%cansave,	%g1
loop_850:
	udivx	%g6,	%l3,	%i4
	movleu	%icc,	%i0,	%o4
	fmovrdne	%i6,	%f10,	%f8
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%o5
	fexpand	%f0,	%f12
	tcc	%icc,	0x0
	fcmps	%fcc0,	%f4,	%f10
	ldx	[%l7 + 0x20],	%l4
	fmovsn	%fcc3,	%f0,	%f15
	udiv	%g3,	%i7,	%o7
	call	loop_851
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	array16	%o0,	%i1,	%l0
	array32	%o1,	%g4,	%l1
loop_851:
	nop
	fitos	%f4,	%f7
	fstod	%f7,	%f16
	wrpr	%g7,	0x02FB,	%pil
	call	loop_852
	movleu	%xcc,	0x7BB,	%g5
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xea,	%l4
loop_852:
	wrpr 	%g0, 	0x1, 	%gl
	call	loop_853
	rdhpr	%hpstate,	%i2
	fnot1	%f4,	%f2
	call	loop_854
loop_853:
	call	loop_855
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovse	%fcc3,	%f31,	%f11
loop_854:
	call	loop_856
loop_855:
	wr	%l6,	0x1EAF,	%sys_tick
	te	%icc,	0x3
	fmuld8ulx16	%f4,	%f22,	%f10
loop_856:
	nop
	fitos	%f14,	%f16
	fstoi	%f16,	%f2
	call	loop_857
	call	loop_858
	fzeros	%f31
	fbuge	%fcc0,	loop_859
loop_857:
	call	loop_860
loop_858:
	array32	%o2,	%g2,	%l2
	call	loop_861
loop_859:
	fmovscc	%icc,	%f10,	%f9
loop_860:
	nop
	set	0x3F, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o6
loop_861:
	movn	%xcc,	0x756,	%o3
	edge32n	%g1,	%g6,	%l3
	movrgez	%i0,	%o4,	%i4
	movn	%icc,	%i6,	%o5
	xor	%g3,	%i7,	%o7
	call	loop_862
	rdhpr	%ver,	%l4
	sdiv	%i1,	0x00,	%o0
	call	loop_863
loop_862:
	fmovso	%fcc1,	%f27,	%f10
	movvc	%icc,	0x18A,	%l0
	fmovdgu	%icc,	%f8,	%f26
loop_863:
	call	loop_864
	sub	%g4,	%l1,	%o1
	nop
	setx	0xDC434A63,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD9DEED12,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f11,	%f23
	call	loop_865
loop_864:
	tge	%xcc,	0x7
	edge32ln	%g5,	%l5,	%i5
	fmovrslz	%i3,	%f11,	%f31
loop_865:
	smul	%i2,	0x058A,	%g7
	nop
	set	0x78, %i5
	ldsh	[%l7 + %i5],	%o2
	mova	%xcc,	0x270,	%l6
	wrpr	%l2,	%o6,	%tick
	nop
	fitos	%f10,	%f8
	fstox	%f8,	%f18
	fmovsne	%fcc0,	%f21,	%f21
	fmovdpos	%xcc,	%f4,	%f4
	fmovrdgez	%o3,	%f14,	%f26
	tcc	%xcc,	0x1
	fmovspos	%xcc,	%f26,	%f12
	fmovspos	%xcc,	%f1,	%f26
	call	loop_866
	call	loop_867
	ld	[%l7 + 0x58],	%f17
	call	loop_868
loop_866:
	call	loop_869
loop_867:
	fbul,a	%fcc0,	loop_870
	edge16	%g1,	%g6,	%g2
loop_868:
	call	loop_871
loop_869:
	fzeros	%f14
loop_870:
	edge32	%i0,	%l3,	%o4
	call	loop_872
loop_871:
	fxnor	%f4,	%f16,	%f16
	fxor	%f20,	%f8,	%f20
	call	loop_873
loop_872:
	call	loop_874
	bcc	%icc,	loop_875
	fbne,a,pt	%fcc2,	loop_876
loop_873:
	call	loop_877
loop_874:
	edge32ln	%i6,	%o5,	%g3
loop_875:
	fmovspos	%xcc,	%f8,	%f23
loop_876:
	rdhpr	%hpstate,	%i4
loop_877:
	fmovdule	%fcc2,	%f2,	%f20
	nop
	fitod	%f22,	%f30
	call	loop_878
	ta	%icc,	0x1
	nop
	fitos	%f7,	%f16
	fstoi	%f16,	%f10
	call	loop_879
loop_878:
	fpack32	%f12,	%f28,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC47, 	%hsys_tick_cmpr
	flushw
loop_879:
	fmuld8sux16	%f22,	%f23,	%f28
	movrlez	%o7,	%l4,	%o0
	fmovdule	%fcc0,	%f30,	%f28
	tleu	%xcc,	0x0
	nop
	setx loop_880, %l0, %l1
	jmpl %l1, %l0
	fandnot1s	%f11,	%f12,	%f27
	nop
	set	0x1D, %o5
	ldsb	[%l7 + %o5],	%g4
	flushw
loop_880:
	call	loop_881
	fcmpd	%fcc1,	%f14,	%f14
	fabss	%f31,	%f26
	fmovrdlez	%i1,	%f4,	%f24
loop_881:
	bne,pn	%xcc,	loop_882
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f0
	call	loop_883
	add	%o1,	0x05B7,	%l1
loop_882:
	nop
	set	0x16, %o6
	lduh	[%l7 + %o6],	%g5
	wrpr	%l5,	%i3,	%pil
loop_883:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 20
!	Type a   	: 27
!	Type cti   	: 149
!	Type x   	: 9
!	Type f   	: 171
!	Type i   	: 124
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
	set	0x8,	%g1
	set	0x6,	%g2
	set	0xF,	%g3
	set	0x9,	%g4
	set	0xE,	%g5
	set	0x5,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x3,	%i1
	set	-0xB,	%i2
	set	-0x5,	%i3
	set	-0x9,	%i4
	set	-0x1,	%i5
	set	-0x8,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x3FF7D355,	%l0
	set	0x4281D045,	%l1
	set	0x7567D8D4,	%l2
	set	0x72BA9B79,	%l3
	set	0x55504E86,	%l4
	set	0x47D6D8A5,	%l5
	set	0x21DA4358,	%l6
	!# Output registers
	set	0x0364,	%o0
	set	-0x1F90,	%o1
	set	0x1A0E,	%o2
	set	-0x1DC3,	%o3
	set	0x0943,	%o4
	set	-0x1616,	%o5
	set	-0x17E0,	%o6
	set	-0x1154,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	call	loop_884
	call	loop_885
	fcmped	%fcc2,	%f0,	%f2
	edge8l	%i5,	%i2,	%g7
loop_884:
	fcmpne16	%f12,	%f12,	%l6
loop_885:
	fandnot2	%f12,	%f22,	%f2
	tg	%xcc,	0x4
	wr 	%g0, 	0x7, 	%fprs
	movrgez	%l2,	0x321,	%g1
	fmovdcc	%icc,	%f18,	%f22
	tge	%icc,	0x2
	call	loop_886
	sdiv	%o3,	%g6,	%i0
	fbg	%fcc3,	loop_887
	call	loop_888
loop_886:
	fands	%f24,	%f30,	%f24
	edge8l	%g2,	%l3,	%o4
loop_887:
	tn	%xcc,	0x4
loop_888:
	tvs	%icc,	0x7
	movcs	%icc,	0x2CC,	%i6
	sir	0x11EA
	orncc	%g3,	%o5,	%i4
	nop
	setx	0xF3E73A26,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x268EE2E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f18,	%f14
	call	loop_889
	fmovdle	%fcc3,	%f8,	%f2
	subcc	%i7,	%o7,	%l4
	fpadd16	%f0,	%f24,	%f24
loop_889:
	rdhpr	%hsys_tick_cmpr,	%l0
	nop
	setx	0x9A26A2F05696DBB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x74363C7C07F50449,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f6
	wrpr	%o0,	0x193F,	%cwp
	andncc	%g4,	0x0733,	%i1
	srl	%l1,	%g5,	%l5
	fexpand	%f17,	%f16
	call	loop_890
	brz,pt	%o1,	loop_891
	ta	%xcc,	0x7
	movug	%fcc3,	%i3,	%i2
loop_890:
	movleu	%xcc,	%g7,	%l6
loop_891:
	call	loop_892
	stx	%o2,	[%l7 + 0x78]
	call	loop_893
	fpsub16	%f0,	%f18,	%f14
loop_892:
	lduw	[%l7 + 0x10],	%o6
	edge32l	%l2,	%g1,	%o3
loop_893:
	call	loop_894
	nop
	setx	loop_895,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x011200001401,	%l0,	%l1
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
	call	loop_896
	fmovduge	%fcc0,	%f18,	%f20
loop_894:
	call	loop_897
loop_895:
	call	loop_898
loop_896:
	call	loop_899
	movvs	%xcc,	%g6,	%i0
loop_897:
	tl	%icc,	0x0
loop_898:
	udiv	%i5,	0x00,	%l3
loop_899:
	fmovrdne	%g2,	%f12,	%f24
	tle	%icc,	0x4
	movne	%xcc,	0x503,	%o4
	andn	%g3,	%i6,	%o5
	movul	%fcc1,	%i4,	%i7
	nop
	set	0x4C, %i7
	lduw	[%l7 + %i7],	%l4
	call	loop_900
	bn,a,pt	%xcc,	loop_901
	fmovrsgz	%l0,	%f1,	%f8
	rd	%ccr,	%o0
loop_900:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%g4,	[%l7 + 0x38] %asi
	membar	#Sync
loop_901:
	tn	%xcc,	0x0
	sdivx	%o7,	0x00,	%i1
	call	loop_902
	call	loop_903
	fnot1s	%f31,	%f3
	fmovde	%fcc3,	%f4,	%f16
loop_902:
	edge16ln	%g5,	%l5,	%o1
loop_903:
	nop
	setx	0x63BEE6D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f16
	taddcctv	%i3,	0x0000,	%i2
	fand	%f12,	%f8,	%f20
	fmovrslz	%l1,	%f17,	%f12
	movrlez	%l6,	%o2,	%g7
	call	loop_904
	fcmped	%fcc3,	%f22,	%f8
	edge8l	%o6,	%l2,	%g1
	fbul	%fcc1,	loop_905
loop_904:
	bleu	%xcc,	loop_906
	sdivcc	%g6,	0x00,	%o3
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f11
loop_905:
	fcmple16	%f20,	%f18,	%i0
loop_906:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	call	loop_907
	fornot2	%f24,	%f14,	%f24
	call	loop_908
	nop
	setx	0xA61C3C9A7036769F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA15F58BC179832E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f4
loop_907:
	call	loop_909
	mulscc	%o4,	%g3,	%i6
loop_908:
	movrlez	%i5,	%o5,	%i7
	edge8n	%i4,	%l0,	%o0
loop_909:
	call	loop_910
	call	loop_911
	movl	%fcc1,	%g4,	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_910:
	fmovsul	%fcc2,	%f30,	%f25
loop_911:
	call	loop_912
	fcmpes	%fcc3,	%f23,	%f13
	rd	%y,	%l5
	nop
	setx	0xE18460B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f27
loop_912:
	tleu	%icc,	0x6
	bgu,a	%icc,	loop_913
	tn	%icc,	0x4
	fone	%f2
	call	loop_914
loop_913:
	fmovse	%fcc3,	%f9,	%f9
	fmovrdgz	%g5,	%f14,	%f12
	call	loop_915
loop_914:
	edge8l	%o1,	%i3,	%l1
	array32	%i2,	%l6,	%g7
	nop
	setx	0xB0181208,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_915:
	movug	%fcc0,	%o6,	%o2
	rdhpr	%hsys_tick_cmpr,	%g1
	fmul8x16au	%f9,	%f30,	%f10
	wr	%g0,	0xd2,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	call	loop_916
	call	loop_917
	fmovso	%fcc0,	%f1,	%f20
	brlez,a,pn	%l2,	loop_918
loop_916:
	nop
	fitos	%f0,	%f26
loop_917:
	mova	%fcc2,	%o3,	%i0
	addccc	%l3,	0x12FF,	%g2
loop_918:
	call	loop_919
	call	loop_920
	tge	%icc,	0x3
	nop
	setx	0x54DAE71073C53E08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x66E41BAA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsmuld	%f22,	%f18,	%f30
loop_919:
	fmovsle	%fcc2,	%f6,	%f20
loop_920:
	call	loop_921
	call	loop_922
	tvc	%icc,	0x6
	call	loop_923
loop_921:
	taddcctv	%g6,	0x0537,	%o4
loop_922:
	sethi	0x0537,	%g3
	nop
	fitos	%f8,	%f15
	fstoi	%f15,	%f18
loop_923:
	nop
	setx	0xD21CA09F9ECFC84B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f12
	call	loop_924
	edge16	%i6,	%o5,	%i7
	fmovdg	%fcc3,	%f14,	%f18

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_924:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i5
	call	loop_925
	movcs	%icc,	0x0AC,	%o0
	movrgez	%g4,	0x0DD,	%l0
	udivcc	%i1,	0x00,	%l4
loop_925:
	fmovdo	%fcc3,	%f12,	%f8
	call	loop_926
	nop
	setx	0x58D587998B650F3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE93AFAC8A0D7F644,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f2,	%f2
	nop
	setx	loop_927,	%l0,	%l1
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
	movvs	%xcc,	%o7,	%l5
loop_926:
	fandnot2	%f26,	%f16,	%f28
	fmul8ulx16	%f2,	%f24,	%f8
loop_927:
	mulx	%g5,	%i3,	%l1
	call	loop_928
	fmovdneg	%icc,	%f20,	%f26
	fmovsul	%fcc2,	%f15,	%f1
	call	loop_929
loop_928:
	xnor	%o1,	%i2,	%g7
	fmovrdgez	%o6,	%f14,	%f0
	movo	%fcc3,	%o2,	%g1
loop_929:
	brnz,pt	%l6,	loop_930
	call	loop_931
	xnor	%l2,	%i0,	%l3
	fmovdge	%fcc3,	%f22,	%f22
loop_930:
	fmovrsgez	%g2,	%f18,	%f3
loop_931:
	call	loop_932
	wrpr 	%g0, 	0x3, 	%gl
	rd	%tick_cmpr,	%g6
	call	loop_933
loop_932:
	bneg	%xcc,	loop_934
	call	loop_935
	srl	%o4,	0x09,	%i6
loop_933:
	rdhpr	%hsys_tick_cmpr,	%o5
loop_934:
	movre	%g3,	%i7,	%i4
loop_935:
	edge8n	%i5,	%o0,	%g4
	movrlz	%i1,	%l0,	%l4
	stb	%l5,	[%l7 + 0x3C]
	fnegs	%f20,	%f18
	rdpr	%tl,	%o7
	call	loop_936
	call	loop_937
	fmovdul	%fcc1,	%f22,	%f20
	fbuge	%fcc2,	loop_938
loop_936:
	call	loop_939
loop_937:
	sdivx	%g5,	0x00,	%l1
	fpsub16	%f6,	%f14,	%f30
loop_938:
	call	loop_940
loop_939:
	tvc	%xcc,	0x0
	fbge	%fcc0,	loop_941
	or	%i3,	%i2,	%o1
loop_940:
	edge8	%g7,	%o2,	%o6
	edge16n	%g1,	%l6,	%l2
loop_941:
	rdhpr	%htba,	%i0
	movleu	%xcc,	%g2,	%o3
	fmovdle	%xcc,	%f30,	%f18
	tl	%icc,	0x6
	tg	%icc,	0x3
	fmovrsgz	%g6,	%f24,	%f11
	fmovso	%fcc1,	%f25,	%f15
	rd	%fprs,	%o4
	rd	%softint,	%l3
	membar	0x33
	call	loop_942
	xnorcc	%o5,	%g3,	%i6
	nop
	setx	0xA951B4A2503EDBCE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB774BBDB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsmuld	%f12,	%f18,	%f6
	fmovrdlz	%i7,	%f12,	%f0
loop_942:
	fmovdug	%fcc1,	%f8,	%f22
	call	loop_943
	fcmpgt16	%f8,	%f30,	%i4
	call	loop_944
	call	loop_945
loop_943:
	movvc	%xcc,	%i5,	%g4
	brgez,a	%o0,	loop_946
loop_944:
	fmovdo	%fcc2,	%f8,	%f2
loop_945:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i1,	%l4
loop_946:
	sir	0x0C2D
	call	loop_947
	fnot2s	%f6,	%f18
	alignaddr	%l5,	%o7,	%g5
	fsrc2	%f12,	%f16
loop_947:
	fmovdg	%icc,	%f18,	%f24
	nop
	setx	0xDAA721F822426172,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x49C97478A6B199AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f18,	%f26
	call	loop_948
	call	loop_949
	fmovrdgez	%l0,	%f8,	%f2
	call	loop_950
loop_948:
	udivcc	%i3,	0x00,	%l1
loop_949:
	fblg,a	%fcc3,	loop_951
	andn	%i2,	%o1,	%g7
loop_950:
	fcmped	%fcc3,	%f26,	%f12
	call	loop_952
loop_951:
	call	loop_953
	orncc	%o2,	%g1,	%o6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_952:
	nop
	setx	0x994251E3AE62F1BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE490C8452489851C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f10,	%f14
loop_953:
	mulx	%l6,	0x0DC7,	%i0
	addccc	%l2,	%o3,	%g2
	edge32ln	%o4,	%g6,	%o5
	sdivx	%g3,	0x00,	%i6
	sdivx	%i7,	0x00,	%l3
	call	loop_954
	fxnors	%f19,	%f19,	%f8
	subcc	%i5,	%g4,	%o0
	fbo	%fcc3,	loop_955
loop_954:
	tne	%icc,	0x4
	pdist	%f10,	%f24,	%f4
	call	loop_956
loop_955:
	fmuld8sux16	%f25,	%f6,	%f26
	call	loop_957
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_956:
	fmovrdne	%i1,	%f4,	%f4
	rdhpr	%htba,	%i4
loop_957:
	fmovdue	%fcc0,	%f12,	%f18
	set	0x44, %g6
	ldswa	[%l7 + %g6] 0x19,	%l4
	call	loop_958
	call	loop_959
	call	loop_960
	tl	%icc,	0x6
loop_958:
	fmovsule	%fcc1,	%f14,	%f10
loop_959:
	for	%f20,	%f30,	%f10
loop_960:
	wr	%l5,	0x0CC8,	%sys_tick
	mulscc	%g5,	%o7,	%i3
	edge8n	%l0,	%i2,	%l1
	call	loop_961
	call	loop_962
	movvs	%xcc,	0x469,	%g7
	fsrc2s	%f23,	%f27
loop_961:
	call	loop_963
loop_962:
	rd	%softint,	%o2
	fmovslg	%fcc0,	%f23,	%f6
	call	loop_964
loop_963:
	udivcc	%o1,	%g1,	%o6
	call	loop_965
	call	loop_966
loop_964:
	tneg	%icc,	0x7
	array32	%i0,	%l2,	%l6
loop_965:
	call	loop_967
loop_966:
	fmovscc	%xcc,	%f14,	%f29
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	orn	%g2,	%o4,	%o3
loop_967:
	umul	%o5,	0x1124,	%g3
	call	loop_968
	movpos	%xcc,	%g6,	%i7
	fmovrde	%l3,	%f22,	%f12
	fsrc1s	%f30,	%f9
loop_968:
	call	loop_969
	rdpr	%otherwin,	%i5
	nop
	setx	0x569E3E27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xCA260045,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f9,	%f28
	edge16	%i6,	%g4,	%i1
loop_969:
	call	loop_970
	nop
	fitod	%f15,	%f28
	call	loop_971
	fnand	%f22,	%f12,	%f2
loop_970:
	call	loop_972
	fcmpne16	%f26,	%f10,	%i4
loop_971:
	brgz,a	%l4,	loop_973
	call	loop_974
loop_972:
	call	loop_975
	wrpr	%o0,	%g5,	%cwp
loop_973:
	movrne	%l5,	0x036,	%i3
loop_974:
	movl	%fcc2,	%o7,	%l0
loop_975:
	sir	0x1256
	bn,a,pt	%icc,	loop_976
	edge16l	%l1,	%g7,	%i2
	nop
	setx	loop_977,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x032100001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsvc	%icc,	%f26,	%f25
loop_976:
	fnot1	%f6,	%f16
	call	loop_978
loop_977:
	nop
	set	0x66, %i6
	sth	%o2,	[%l7 + %i6]
	call	loop_979
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f4
loop_978:
	call	loop_980
	bvs	%xcc,	loop_981
loop_979:
	call	loop_982
	call	loop_983
loop_980:
	call	loop_984
loop_981:
	fpack16	%f2,	%f8
loop_982:
	rdpr	%tba,	%g1
loop_983:
	nop
	setx	0x73680E78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f31
loop_984:
	udivcc	%o1,	%i0,	%l2
	fcmpes	%fcc3,	%f21,	%f10
	fbule,a	%fcc2,	loop_985
	faligndata	%f30,	%f10,	%f30
	fmovduge	%fcc2,	%f18,	%f6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x469, 	%hsys_tick_cmpr
loop_985:
	nop
	setx	0x86CECAFD0CAB4B9B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f6
	fmovrdne	%g2,	%f0,	%f30
	fmovsvs	%xcc,	%f18,	%f4
	subcc	%o4,	%o3,	%o5
	call	loop_986
	bcs	%xcc,	loop_987
	fpadd32s	%f9,	%f12,	%f21
	fmovdgu	%icc,	%f14,	%f24
loop_986:
	fmovrdgz	%o6,	%f12,	%f4
loop_987:
	movrne	%g3,	0x396,	%i7
	fpsub16s	%f15,	%f19,	%f2
	call	loop_988
	fmovsn	%xcc,	%f7,	%f31
	fmovsgu	%icc,	%f18,	%f28
	fcmped	%fcc3,	%f12,	%f28
loop_988:
	udivcc	%l3,	%i5,	%g6
	fand	%f20,	%f8,	%f24
	sdivx	%g4,	0x00,	%i6
	nop
	setx	0x4FDC737B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f30
	fbg	%fcc3,	loop_989
	fandnot2	%f20,	%f8,	%f28
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2E] %asi,	%i1
loop_989:
	tle	%xcc,	0x6
	call	loop_990
	tpos	%icc,	0x5
	movlg	%fcc0,	0x65D,	%l4
	call	loop_991
loop_990:
	call	loop_992
	tle	%xcc,	0x5
	call	loop_993
loop_991:
	call	loop_994
loop_992:
	call	loop_995
	nop
	setx	0x8A4D9A670DF36E10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xEB38B7ADE9B0C88E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f28
loop_993:
	fmovrslez	%i4,	%f4,	%f23
loop_994:
	smulcc	%o0,	%l5,	%i3
loop_995:
	xnorcc	%g5,	0x0499,	%o7
	sethi	0x0CE7,	%l1
	call	loop_996
	wrpr 	%g0, 	0x2, 	%gl
	mova	%icc,	0x193,	%g7
	taddcc	%i2,	%o2,	%g1
loop_996:
	fmovse	%fcc0,	%f3,	%f8
	wr	%o1,	0x0024,	%ccr
	fsrc2	%f26,	%f22
	fmovdlg	%fcc3,	%f12,	%f26
	wr	%l2,	0x1A7D,	%ccr
	wr	%l6,	%g2,	%y
	call	loop_997
	stbar
	call	loop_998
	fpsub16	%f20,	%f26,	%f14
loop_997:
	nop
	fitod	%f4,	%f18
	nop
	set	0x50, %g4
	stw	%i0,	[%l7 + %g4]
loop_998:
	tn	%icc,	0x7
	nop
	set	0x30, %i4
	std	%o4,	[%l7 + %i4]
	xnor	%o3,	0x143F,	%o6
	fmovsug	%fcc1,	%f26,	%f13
	movrne	%g3,	0x14A,	%i7
	xorcc	%l3,	0x0733,	%o5
	ba	%icc,	loop_999
	fmovdug	%fcc0,	%f10,	%f14
	wrpr 	%g0, 	0x0, 	%gl
	umulcc	%i5,	0x1A7B,	%i6
loop_999:
	movle	%fcc2,	%g4,	%l4
	call	loop_1000
	call	loop_1001
	fxor	%f28,	%f14,	%f26
	rdhpr	%hintp,	%i4
loop_1000:
	fmovdul	%fcc1,	%f6,	%f0
loop_1001:
	rdhpr	%ver,	%o0
	movre	%l5,	%i1,	%i3
	call	loop_1002
	call	loop_1003
	fsrc1s	%f3,	%f24
	call	loop_1004
loop_1002:
	call	loop_1005
loop_1003:
	fcmpgt32	%f8,	%f0,	%g5
	fpsub32	%f20,	%f8,	%f6
loop_1004:
	nop
	set	0x66, %o0
	lduba	[%l7 + %o0] 0x81,	%o7
loop_1005:
	call	loop_1006
	call	loop_1007
	fmovsge	%fcc1,	%f9,	%f20
	fmovsneg	%icc,	%f31,	%f27
loop_1006:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_1007:
	call	loop_1008
	bshuffle	%f24,	%f14,	%f4
	rd	%ccr,	%g7
	te	%xcc,	0x3
loop_1008:
	call	loop_1009
	movul	%fcc2,	0x626,	%i2
	nop
	fitos	%f23,	%f30

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
loop_1009:
	fpadd32	%f30,	%f18,	%f22
	fnot2	%f20,	%f18
	call	loop_1010
	movneg	%xcc,	0x1C5,	%l1
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f22
	fxtod	%f22,	%f4
	fmovsuge	%fcc1,	%f15,	%f26
loop_1010:
	fpsub32s	%f28,	%f28,	%f3
	wrpr	%o1,	%l2,	%pil
	fbo,a,pt	%fcc0,	loop_1011
	fpsub16	%f24,	%f16,	%f4
	sll	%l6,	%g2,	%i0
	call	loop_1012
loop_1011:
	bn	%icc,	loop_1013
	addc	%o4,	%o3,	%o6
	tpos	%icc,	0x6
loop_1012:
	call	loop_1014
loop_1013:
	call	loop_1015
	alignaddrl	%i7,	%l3,	%o5
	call	loop_1016
loop_1014:
	wrpr	%g6,	0x0A71,	%cwp
loop_1015:
	movu	%fcc0,	%i5,	%i6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g4
loop_1016:
	xorcc	%g3,	0x0A67,	%i4
	call	loop_1017
	tne	%xcc,	0x3
	fmovsneg	%icc,	%f25,	%f2
	call	loop_1018
loop_1017:
	fbge,a	%fcc1,	loop_1019
	fmovsg	%fcc3,	%f16,	%f31
	fnegd	%f0,	%f6
loop_1018:
	fmovdcs	%xcc,	%f18,	%f18
loop_1019:
	ldub	[%l7 + 0x5C],	%o0
	call	loop_1020
	fpadd32s	%f29,	%f20,	%f0
	fpadd16	%f4,	%f4,	%f12
	fmovsleu	%icc,	%f12,	%f25
loop_1020:
	tneg	%icc,	0x2
	movuge	%fcc1,	0x4C4,	%l5
	rd	%tick_cmpr,	%i1
	addc	%l4,	%i3,	%o7
	call	loop_1021
	edge8n	%l0,	%g5,	%g7
	fmovdlg	%fcc1,	%f22,	%f22
	fpadd32	%f26,	%f6,	%f28
loop_1021:
	call	loop_1022
	call	loop_1023
	fone	%f30
	call	loop_1024
loop_1022:
	call	loop_1025
loop_1023:
	fmovso	%fcc0,	%f28,	%f1
	call	loop_1026
loop_1024:
	tvc	%icc,	0x2
loop_1025:
	call	loop_1027
	call	loop_1028
loop_1026:
	nop
	setx loop_1029, %l0, %l1
	jmpl %l1, %i2
	fmul8x16al	%f7,	%f31,	%f14
loop_1027:
	array16	%g1,	%o2,	%l1
loop_1028:
	udivcc	%l2,	0x00,	%l6
loop_1029:
	call	loop_1030
	call	loop_1031
	udivx	%o1,	%i0,	%o4
	call	loop_1032
loop_1030:
	fmovdgu	%icc,	%f18,	%f8
loop_1031:
	tleu	%icc,	0x6
	call	loop_1033
loop_1032:
	fmovsge	%icc,	%f6,	%f3
	edge32ln	%o3,	%o6,	%g2
	movn	%fcc1,	0x675,	%i7
loop_1033:
	movule	%fcc1,	0x504,	%o5
	call	loop_1034
	fmovduge	%fcc3,	%f22,	%f24
	call	loop_1035
	fors	%f12,	%f3,	%f17
loop_1034:
	nop

loop_1035:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 18
!	Type a   	: 36
!	Type x   	: 8
!	Type cti   	: 152
!	Type f   	: 142
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
	set	0x8,	%g2
	set	0xA,	%g3
	set	0x6,	%g4
	set	0xA,	%g5
	set	0x3,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0x3,	%i2
	set	-0xD,	%i3
	set	-0x5,	%i4
	set	-0x6,	%i5
	set	-0x8,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x62EB7E21,	%l0
	set	0x36A091E5,	%l1
	set	0x1FA023E0,	%l2
	set	0x1AF7D33D,	%l3
	set	0x68BBE0D1,	%l4
	set	0x5466B7C9,	%l5
	set	0x211EC040,	%l6
	!# Output registers
	set	-0x0F30,	%o0
	set	0x1294,	%o1
	set	-0x135E,	%o2
	set	0x09ED,	%o3
	set	-0x11CB,	%o4
	set	-0x0A62,	%o5
	set	-0x1AB1,	%o6
	set	0x12A5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xBC91B29D080600A6)
	INIT_TH_FP_REG(%l7,%f2,0xB53A5F5CB9F6E5F1)
	INIT_TH_FP_REG(%l7,%f4,0x56D4F5A32928432D)
	INIT_TH_FP_REG(%l7,%f6,0x8EF4EA88A37E8BA6)
	INIT_TH_FP_REG(%l7,%f8,0x073A49DEE4E279D7)
	INIT_TH_FP_REG(%l7,%f10,0x6C250671B9707F6E)
	INIT_TH_FP_REG(%l7,%f12,0x1AB71F5EC402D451)
	INIT_TH_FP_REG(%l7,%f14,0xE106E049893A7514)
	INIT_TH_FP_REG(%l7,%f16,0xD9FFDC478428A131)
	INIT_TH_FP_REG(%l7,%f18,0x8CE4AC05FF168B45)
	INIT_TH_FP_REG(%l7,%f20,0x9797AF21AD877E7B)
	INIT_TH_FP_REG(%l7,%f22,0xA9BBF516C7F22672)
	INIT_TH_FP_REG(%l7,%f24,0x660B62CFC591E5BE)
	INIT_TH_FP_REG(%l7,%f26,0x9BECAFA2A5471F53)
	INIT_TH_FP_REG(%l7,%f28,0xB2A6C26BC5812F34)
	INIT_TH_FP_REG(%l7,%f30,0xB51B51B4FFDBA69E)

	!# Execute Main Diag ..

	call	loop_1036
	fandnot1	%f20,	%f20,	%f16
	set	0x08, %i1
	stwa	%g6,	[%l7 + %i1] 0x11
loop_1036:
	xnor	%i5,	0x154A,	%i6
	fnot2s	%f29,	%f15
	call	loop_1037
	fbo,pn	%fcc1,	loop_1038
	fcmpes	%fcc1,	%f13,	%f27
	nop
	fitos	%f0,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f25
loop_1037:
	call	loop_1039
loop_1038:
	rd	%softint,	%l3
	nop
	setx	0xA7806651,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB86CF17E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f1,	%f25
	call	loop_1040
loop_1039:
	fmovrdlz	%g4,	%f30,	%f28
	call	loop_1041
	fmovrdlez	%g3,	%f6,	%f16
loop_1040:
	sethi	0x1A23,	%o0
	movrlz	%i4,	%i1,	%l4
loop_1041:
	alignaddrl	%l5,	%o7,	%l0
	fblg	%fcc0,	loop_1042
	udiv	%g5,	0x00,	%g7
	addcc	%i2,	%i3,	%o2
	fands	%f8,	%f1,	%f21
loop_1042:
	call	loop_1043
	tvs	%icc,	0x2
	nop
	setx	0x6655BCC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x615376ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f31,	%f18
	fmovsa	%fcc3,	%f18,	%f18
loop_1043:
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f24
	lduh	[%l7 + 0x1C],	%g1
	call	loop_1044
	fcmpeq16	%f12,	%f24,	%l1
	sll	%l6,	%l2,	%o1
	fmovduge	%fcc3,	%f10,	%f30
loop_1044:
	movuge	%fcc2,	%o4,	%i0
	movue	%fcc2,	0x4E4,	%o3
	sub	%o6,	0x103B,	%g2
	movre	%i7,	0x24F,	%g6
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	fmovse	%fcc2,	%f14,	%f16
	udiv	%o5,	0x00,	%i5
	movrgez	%l3,	%g4,	%g3
	nop
	fitos	%f23,	%f24
	fmovdule	%fcc3,	%f14,	%f28
	call	loop_1045
	fmovrdne	%i6,	%f16,	%f16
	fmovdule	%fcc1,	%f24,	%f24
	rdpr	%gl,	%i4
loop_1045:
	fmovdleu	%xcc,	%f20,	%f26
	call	loop_1046
	ldsw	[%l7 + 0x34],	%o0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i1,	%l4
loop_1046:
	fands	%f21,	%f0,	%f11
	call	loop_1047
	fmovda	%icc,	%f0,	%f18
	tgu	%icc,	0x2
	movrgez	%l5,	0x2B6,	%l0
loop_1047:
	srax	%g5,	0x0D,	%g7
	call	loop_1048
	movneg	%xcc,	0x2B5,	%o7
	call	loop_1049
	brnz,pt	%i3,	loop_1050
loop_1048:
	call	loop_1051
	fbo	%fcc2,	loop_1052
loop_1049:
	nop
	setx	0x207DA9D725E4322C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB854C427ACDE1418,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f30,	%f0
loop_1050:
	call	loop_1053
loop_1051:
	tl	%icc,	0x0
loop_1052:
	call	loop_1054
	call	loop_1055
loop_1053:
	call	loop_1056
	rdhpr	%ver,	%o2
loop_1054:
	call	loop_1057
loop_1055:
	edge16	%g1,	%l1,	%l6
loop_1056:
	call	loop_1058
	edge16n	%i2,	%l2,	%o1
loop_1057:
	fxnors	%f11,	%f4,	%f28
	call	loop_1059
loop_1058:
	fmovdue	%fcc2,	%f24,	%f0
	call	loop_1060
	call	loop_1061
loop_1059:
	fzero	%f24
	fmovrsne	%o4,	%f15,	%f26
loop_1060:
	call	loop_1062
loop_1061:
	call	loop_1063
	fmovdg	%fcc0,	%f16,	%f18
	fmovrde	%i0,	%f28,	%f18
loop_1062:
	fbne,pn	%fcc3,	loop_1064
loop_1063:
	call	loop_1065
	call	loop_1066
	tsubcc	%o3,	%g2,	%i7
loop_1064:
	call	loop_1067
loop_1065:
	tcc	%xcc,	0x5
loop_1066:
	wrpr	%o6,	%o5,	%pil
	umulcc	%g6,	0x1E43,	%i5
loop_1067:
	call	loop_1068
	wr	%l3,	%g4,	%clear_softint
	call	loop_1069
	call	loop_1070
loop_1068:
	siam	0x0
	call	loop_1071
loop_1069:
	fpadd16s	%f15,	%f20,	%f26
loop_1070:
	sdivcc	%i6,	0x00,	%g3
	addc	%i4,	%i1,	%o0
loop_1071:
	rd	%y,	%l5
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	call	loop_1072
	nop
	fitod	%f29,	%f4
	fandnot2s	%f3,	%f12,	%f9
	be,pn	%icc,	loop_1073
loop_1072:
	orcc	%l4,	0x02CC,	%g5
	fandnot1s	%f6,	%f22,	%f25
	call	loop_1074
loop_1073:
	fba	%fcc0,	loop_1075
	call	loop_1076
	call	loop_1077
loop_1074:
	movg	%xcc,	%l0,	%g7
loop_1075:
	call	loop_1078
loop_1076:
	wr	%i3,	0x1C57,	%clear_softint
loop_1077:
	fnegs	%f0,	%f7
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f28
loop_1078:
	nop
	setx	0x03F6BCB7023971D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2AA8B466,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsmuld	%f18,	%f4,	%f12
	wr 	%g0, 	0x6, 	%fprs
	nop
	setx	0x3DD2CEE018857D52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x0B3055EA92D3F1B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f12
	call	loop_1079
	pdist	%f2,	%f10,	%f10
	edge16ln	%g1,	%l1,	%l6
	fmul8x16	%f19,	%f8,	%f18
loop_1079:
	tne	%xcc,	0x3
	call	loop_1080
	movl	%fcc1,	%i2,	%o2
	call	loop_1081
	call	loop_1082
loop_1080:
	fmovdcc	%icc,	%f26,	%f12
	subc	%l2,	0x0E6E,	%o1
loop_1081:
	fmovsug	%fcc3,	%f1,	%f20
loop_1082:
	addcc	%o4,	%i0,	%g2
	rdhpr	%hsys_tick_cmpr,	%o3
	fbg,pt	%fcc0,	loop_1083
	call	loop_1084
	ta	%xcc,	0x2
	wr	%i7,	%o5,	%set_softint
loop_1083:
	fmovdne	%icc,	%f26,	%f22
loop_1084:
	call	loop_1085
	umul	%o6,	0x078E,	%i5
	fmovscc	%xcc,	%f22,	%f15
	fmovsl	%xcc,	%f15,	%f11
loop_1085:
	fbge,a,pt	%fcc1,	loop_1086
	call	loop_1087
	siam	0x3
	fmovd	%f14,	%f6
loop_1086:
	fmovdg	%fcc1,	%f28,	%f22
loop_1087:
	fmovduge	%fcc2,	%f22,	%f30
	tgu	%icc,	0x5
	nop
	fitos	%f9,	%f28
	fstoi	%f28,	%f24
	call	loop_1088
	call	loop_1089
	fmovrslez	%l3,	%f7,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1088:
	call	loop_1090
loop_1089:
	wrpr 	%g0, 	0x3, 	%gl
	flushw
	movue	%fcc1,	%i4,	%i1
loop_1090:
	tne	%icc,	0x2
	fmovdue	%fcc0,	%f2,	%f8
	call	loop_1091
	call	loop_1092
	call	loop_1093
	edge8ln	%o0,	%l4,	%g5
loop_1091:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_1092:
	fmovsne	%fcc3,	%f31,	%f13
loop_1093:
	call	loop_1094
	nop
	setx	0xF8C2200AA43289C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f6
	movcs	%icc,	0x04A,	%g7
	fmovsul	%fcc2,	%f6,	%f31
loop_1094:
	fmovscc	%xcc,	%f22,	%f17
	call	loop_1095
	addc	%i3,	%o7,	%l0
	fandnot2	%f2,	%f20,	%f14
	wr	%g0,	0xeb,	%asi
	stba	%g1,	[%l7 + 0x7A] %asi
	membar	#Sync
loop_1095:
	fmovdge	%icc,	%f10,	%f14
	brlz,a	%l6,	loop_1096
	array8	%l1,	%i2,	%l2
	fmovsvs	%icc,	%f28,	%f28
	orncc	%o2,	0x1FB0,	%o4
loop_1096:
	call	loop_1097
	call	loop_1098
	call	loop_1099
	fmovrse	%i0,	%f31,	%f10
loop_1097:
	fxor	%f24,	%f30,	%f6
loop_1098:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x412, 	%hsys_tick_cmpr
loop_1099:
	fmovrdlez	%o1,	%f8,	%f4
	andn	%i7,	%o3,	%o5
	call	loop_1100
	nop
	setx	0x477111F6FC022970,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	fcmpeq32	%f22,	%f28,	%i5
	call	loop_1101
loop_1100:
	fandnot1s	%f1,	%f12,	%f4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0
loop_1101:
	call	loop_1102
	fcmpd	%fcc0,	%f30,	%f0
	rdhpr	%hpstate,	%l3
	call	loop_1103
loop_1102:
	xor	%g6,	0x1ADF,	%g3
	fpack32	%f30,	%f6,	%f12
	xor	%i6,	%i4,	%g4
loop_1103:
	andcc	%o0,	0x1F42,	%i1
	xorcc	%g5,	0x1C4C,	%l5
	wrpr	%l4,	%g7,	%tick
	movle	%xcc,	0x002,	%o7
	call	loop_1104
	fcmpne32	%f18,	%f22,	%i3
	fsrc2s	%f20,	%f16
	fmovde	%fcc1,	%f26,	%f6
loop_1104:
	taddcc	%l0,	%l6,	%g1
	set	0x78, %g5
	stda	%l0,	[%l7 + %g5] 0x89
	fbne,a	%fcc3,	loop_1105
	fmovdvc	%xcc,	%f16,	%f20
	call	loop_1106
	xorcc	%l2,	%i2,	%o2
loop_1105:
	rd	%pc,	%i0
	call	loop_1107
loop_1106:
	call	loop_1108
	call	loop_1109
	bvs,a,pn	%xcc,	loop_1110
loop_1107:
	wrpr	%o4,	0x005C,	%tick
loop_1108:
	call	loop_1111
loop_1109:
	call	loop_1112
loop_1110:
	fcmpd	%fcc0,	%f24,	%f10
	nop
	setx	0xB1841394,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x9CAD6468,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f23,	%f3
loop_1111:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x97E, 	%hsys_tick_cmpr
loop_1112:
	fornot2	%f24,	%f4,	%f22
	fcmpgt16	%f8,	%f28,	%g2
	call	loop_1113
	edge16n	%o3,	%o5,	%i7
	fmovdneg	%icc,	%f10,	%f20
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%o6
loop_1113:
	wrpr	%i5,	%g6,	%cwp
	movue	%fcc2,	%l3,	%i6
	fmovdleu	%icc,	%f12,	%f18
	rdhpr	%htba,	%i4
	call	loop_1114
	movge	%fcc0,	0x080,	%g4
	call	loop_1115
	wr	%g3,	%i1,	%sys_tick
loop_1114:
	wr	%o0,	%l5,	%set_softint
	call	loop_1116
loop_1115:
	rd	%pc,	%g5
	call	loop_1117
	fmovdlg	%fcc3,	%f12,	%f2
loop_1116:
	be,a,pt	%xcc,	loop_1118
	fexpand	%f14,	%f4
loop_1117:
	edge8ln	%g7,	%l4,	%o7
	addc	%l0,	%l6,	%i3
loop_1118:
	call	loop_1119
	brlz	%g1,	loop_1120
	wr	%l2,	0x1380,	%set_softint
	call	loop_1121
loop_1119:
	movul	%fcc2,	%i2,	%o2
loop_1120:
	fcmple16	%f22,	%f2,	%i0
	fnot2	%f28,	%f10
loop_1121:
	call	loop_1122
	movcs	%icc,	%l1,	%o1
	movul	%fcc0,	%g2,	%o3
	fbe,pt	%fcc2,	loop_1123
loop_1122:
	call	loop_1124
	movre	%o5,	0x29B,	%o4
	bvc,a,pn	%xcc,	loop_1125
loop_1123:
	rdhpr	%htba,	%o6
loop_1124:
	fornot2s	%f18,	%f12,	%f4
	call	loop_1126
loop_1125:
	fexpand	%f10,	%f10
	call	loop_1127
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f24
	fxtos	%f24,	%f12
loop_1126:
	fmovsneg	%icc,	%f26,	%f27
	xnorcc	%i5,	%g6,	%i7
loop_1127:
	fmovrdgz	%i6,	%f30,	%f12
	nop
	fitos	%f27,	%f31
	st	%fsr,	[%l7 + 0x10]
	call	loop_1128
	fpsub32s	%f21,	%f3,	%f15
	fmovdpos	%icc,	%f26,	%f10
	udivx	%i4,	0x00,	%l3
loop_1128:
	nop
	fitos	%f2,	%f30
	fstoi	%f30,	%f4
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x48] %asi,	%g3
	fbul,a,pt	%fcc3,	loop_1129
	fmovdu	%fcc0,	%f16,	%f22
	fpsub32s	%f26,	%f26,	%f12
	movvc	%icc,	%g4,	%o0
loop_1129:
	fmovrsgez	%i1,	%f4,	%f16
	movu	%fcc0,	%g5,	%l5
	movrlz	%l4,	%g7,	%o7
	fornot1	%f0,	%f6,	%f18
	brgz	%l6,	loop_1130
	fmovdneg	%xcc,	%f12,	%f6
	nop
	fitos	%f8,	%f28
	call	loop_1131
loop_1130:
	call	loop_1132
	udivx	%l0,	%i3,	%l2
	call	loop_1133
loop_1131:
	fmovsue	%fcc1,	%f24,	%f13
loop_1132:
	nop
	set	0x6A, %l3
	lduha	[%l7 + %l3] 0x04,	%g1
loop_1133:
	nop
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc3
	call	loop_1134
	srl	%o2,	0x08,	%i2
	mulx	%l1,	%o1,	%g2
	call	loop_1135
loop_1134:
	move	%icc,	0x430,	%i0
	call	loop_1136
	fsrc1s	%f1,	%f2
loop_1135:
	subc	%o3,	%o4,	%o6
	movug	%fcc2,	0x744,	%i5
loop_1136:
	tsubcctv	%o5,	0x1FC6,	%i7
	udiv	%g6,	%i4,	%i6
	wr	%g0,	0x2a,	%asi
	stha	%l3,	[%l7 + 0x5A] %asi
	membar	#Sync
	fsrc2	%f4,	%f8
	fsrc2s	%f9,	%f8
	lduw	[%l7 + 0x78],	%g4
	fandnot1s	%f30,	%f12,	%f30
	addccc	%g3,	%o0,	%g5
	bneg	%icc,	loop_1137
	fpadd32	%f8,	%f28,	%f20
	fsrc1s	%f12,	%f7
	call	loop_1138
loop_1137:
	fmovsul	%fcc3,	%f27,	%f28
	call	loop_1139
	movgu	%xcc,	%i1,	%l4
loop_1138:
	fbl,pt	%fcc2,	loop_1140
	st	%f5,	[%l7 + 0x10]
loop_1139:
	fbo	%fcc2,	loop_1141
	call	loop_1142
loop_1140:
	fpsub32s	%f2,	%f11,	%f2
	brlz,pn	%l5,	loop_1143
loop_1141:
	call	loop_1144
loop_1142:
	bshuffle	%f20,	%f10,	%f20
	and	%o7,	0x0993,	%l6
loop_1143:
	edge8l	%g7,	%l0,	%l2
loop_1144:
	subcc	%i3,	%o2,	%g1
	call	loop_1145
	fmovsne	%fcc2,	%f7,	%f17
	wrpr	%i2,	0x082C,	%pil
	call	loop_1146
loop_1145:
	call	loop_1147
	call	loop_1148
	call	loop_1149
loop_1146:
	subcc	%l1,	%o1,	%i0
loop_1147:
	call	loop_1150
loop_1148:
	rdhpr	%htba,	%g2
loop_1149:
	call	loop_1151
	fmovdo	%fcc1,	%f2,	%f0
loop_1150:
	fabss	%f3,	%f11
	call	loop_1152
loop_1151:
	fsrc2s	%f25,	%f25
	brgez,a,pn	%o3,	loop_1153
	call	loop_1154
loop_1152:
	call	loop_1155
	st	%f2,	[%l7 + 0x14]
loop_1153:
	fnegs	%f27,	%f4
loop_1154:
	tg	%icc,	0x3
loop_1155:
	tl	%xcc,	0x4
	rdpr	%pil,	%o4
	fnot2s	%f24,	%f29
	call	loop_1156
	ldsh	[%l7 + 0x64],	%i5
	wr 	%g0, 	0x5, 	%fprs
	fcmpne16	%f30,	%f6,	%o6
loop_1156:
	fnot1s	%f20,	%f30
	fmovrslz	%g6,	%f27,	%f2
	call	loop_1157
	call	loop_1158
	tpos	%xcc,	0x2
	fors	%f24,	%f13,	%f26
loop_1157:
	fcmpes	%fcc0,	%f22,	%f2
loop_1158:
	fmul8ulx16	%f10,	%f26,	%f14
	call	loop_1159
	fmul8ulx16	%f20,	%f24,	%f24
	fmovda	%icc,	%f26,	%f20
	call	loop_1160
loop_1159:
	udivx	%i7,	0x00,	%i4
	fxnors	%f1,	%f4,	%f29
	call	loop_1161
loop_1160:
	fmovrsgez	%i6,	%f12,	%f29
	call	loop_1162
	fmovse	%xcc,	%f31,	%f23
loop_1161:
	fmovsg	%fcc1,	%f20,	%f25
	brlz	%g4,	loop_1163
loop_1162:
	fbg	%fcc3,	loop_1164
	edge32n	%l3,	%o0,	%g5
	fmovrsne	%i1,	%f26,	%f0
loop_1163:
	fmovsgu	%xcc,	%f21,	%f13
loop_1164:
	call	loop_1165
	xorcc	%g3,	%l4,	%o7
	fmovdcs	%xcc,	%f2,	%f18
	fmul8x16au	%f15,	%f29,	%f20
loop_1165:
	nop
	setx	0xE67F3534,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xB4DF5C85,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f21,	%f26
	call	loop_1166
	nop
	fitos	%f1,	%f17
	fstoi	%f17,	%f6
	brgez,pt	%l6,	loop_1167
	saved
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
loop_1166:
	call	loop_1168
	andn	%l5,	%g7,	%l0
loop_1167:
	call	loop_1169
	orn	%i3,	%o2,	%g1
loop_1168:
	and	%i2,	0x1643,	%l2
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f28
loop_1169:
	siam	0x5
	sethi	0x0F5B,	%o1
	call	loop_1170
	call	loop_1171
	call	loop_1172
	subc	%i0,	%l1,	%o3
loop_1170:
	fbuge	%fcc3,	loop_1173
loop_1171:
	nop
	setx	loop_1174,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x034200001406,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1172:
	nop
	setx	0xFFF881D8FB5CA963,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x27C1B724,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsmuld	%f8,	%f24,	%f14
	ldx	[%l7 + 0x78],	%g2
loop_1173:
	tgu	%xcc,	0x7
loop_1174:
	udivx	%o4,	0x00,	%o5
	fmovda	%xcc,	%f0,	%f8
	for	%f2,	%f14,	%f8
	tpos	%xcc,	0x5
	xorcc	%i5,	0x1899,	%g6
	fnot1s	%f30,	%f19
	call	loop_1175
	orn	%i7,	0x1426,	%o6
	movg	%xcc,	%i6,	%i4
	call	loop_1176
loop_1175:
	call	loop_1177
	restored
	rdpr	%cwp,	%g1
	rdpr	%cansave,	%g2
	rdpr	%canrestore,	%g3
	rdpr	%cleanwin,	%g4
	rdpr	%otherwin,	%g5
	rdpr	%wstate,	%g6
	movpos	%xcc,	0x36C,	%l3
loop_1176:
	call	loop_1178
loop_1177:
	faligndata	%f20,	%f12,	%f16
	fzeros	%f4
	fmovdne	%xcc,	%f0,	%f4
loop_1178:
	subcc	%g4,	%o0,	%i1
	sethi	0x0E61,	%g5
	call	loop_1179
	fmovdne	%icc,	%f22,	%f16
	fandnot2	%f2,	%f0,	%f8
	call	loop_1180
loop_1179:
	call	loop_1181
	fors	%f20,	%f24,	%f30
	movg	%fcc2,	0x3DD,	%l4
loop_1180:
	fmovdle	%fcc2,	%f26,	%f22
loop_1181:
	bcc,a,pt	%xcc,	loop_1182
	brgz	%o7,	loop_1183
	nop
	set	0x4C, %l4
	lduh	[%l7 + %l4],	%g3
	nop
	setx	0x449243A861915D6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xEDAE5D96CC5F7853,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f30,	%f14
loop_1182:
	fexpand	%f19,	%f8
loop_1183:
	call	loop_1184
	call	loop_1185
	tleu	%xcc,	0x7
	fxor	%f26,	%f2,	%f16
loop_1184:
	nop
	set	0x2E, %g3
	stha	%l5,	[%l7 + %g3] 0x27
	membar	#Sync
loop_1185:
	call	loop_1186
	call	loop_1187
	call	loop_1188
	movu	%fcc3,	0x35C,	%l6
loop_1186:
	call	loop_1189
loop_1187:
	subc	%l0,	0x0C51,	%i3
loop_1188:
	fmovdg	%fcc0,	%f28,	%f12
	call	loop_1190
loop_1189:
	edge8	%g7,	%g1,	%i2
	brlz,a	%o2,	loop_1191
	subc	%l2,	0x0D8A,	%o1
loop_1190:
	call	loop_1192
	call	loop_1193
loop_1191:
	for	%f30,	%f28,	%f2
	movcc	%xcc,	0x10B,	%i0
loop_1192:
	smul	%o3,	%g2,	%l1
loop_1193:
	fmovdleu	%icc,	%f30,	%f2
	call	loop_1194
	call	loop_1195
	fpsub16	%f12,	%f2,	%f26
	call	loop_1196
loop_1194:
	wr	%o4,	%o5,	%clear_softint
loop_1195:
	bleu,pt	%xcc,	loop_1197
	fbge,a,pt	%fcc3,	loop_1198
loop_1196:
	call	loop_1199
	call	loop_1200
loop_1197:
	call	loop_1201
loop_1198:
	rdpr	%wstate,	%i5
loop_1199:
	bmask	%g6,	%i7,	%o6
loop_1200:
	call	loop_1202
loop_1201:
	fbne,a	%fcc2,	loop_1203
	nop
	fitos	%f8,	%f21
	call	loop_1204
loop_1202:
	smul	%i4,	0x0CB0,	%i6
loop_1203:
	fmovsa	%xcc,	%f19,	%f20
	call	loop_1205
loop_1204:
	call	loop_1206
	udivx	%l3,	0x00,	%g4
loop_1205:
	nop

loop_1206:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 21
!	Type a   	: 32
!	Type x   	: 11
!	Type cti   	: 171
!	Type f   	: 151
!	Type i   	: 114
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x5A81260B
.word 0x11157596
.word 0x8E654975
.word 0x2E6901CD
.word 0x4FBFA489
.word 0x9B5FB911
.word 0x56C72EE9
.word 0x6485740A
.word 0x37F65F39
.word 0xABEE32B0
.word 0x77708789
.word 0x40A428F5
.word 0xAC878EE9
.word 0x62732FF7
.word 0x08DF84F0
.word 0xF66EEB42
.word 0x9FE6AEA6
.word 0x96623441
.word 0x12C69C45
.word 0x972AB354
.word 0x218EBDCF
.word 0x03844087
.word 0xFF3AF284
.word 0x76D3A6CE
.word 0x7C2BC66C
.word 0x64BB5F1C
.word 0x7E097880
.word 0x4B8F0B45
.word 0xFC225EF2
.word 0x1010E70F
.word 0x47CB463F
.word 0x5BA8CBCD
.word 0x4D963643
.word 0x5DECCC65
.word 0x5492E30D
.word 0x9E384AF4
.word 0x9D6C4CD4
.word 0x33CF5145
.word 0xDB6B63DE
.word 0x410965E4
.word 0x77C2FEEF
.word 0x8BA3B493
.word 0x135AC0F1
.word 0xD25B57E9
.word 0xE1059E6C
.word 0xFB362095
.word 0x43DF4FC0
.word 0xD5ED4319
.word 0xEC8130C7
.word 0xA6FB7E44
.word 0x55FFFA60
.word 0xC9BCC0EF
.word 0x559C9023
.word 0xDEF2307D
.word 0x311D6248
.word 0x47075EAF
.word 0x860B4357
.word 0xEFB9A7F6
.word 0xB302979B
.word 0xAF843D1C
.word 0x4E38E5A0
.word 0x9BD2AAA5
.word 0xC22125F4
.word 0xA3043A54
.end
