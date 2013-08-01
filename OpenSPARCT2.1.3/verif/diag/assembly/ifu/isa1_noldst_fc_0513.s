/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa1_noldst_fc_0513.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./ifu_basic_isa1.pl FOCUS_SEED=198831092"
.ident "BY somePerson ON Tue May 13 10:41:23 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa1_noldst_fc_0513.s,v 1.3 2007/07/05 21:58:45 drp Exp $"
#include "defines.h"
#include "nmacros.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x2,	%g2
	set	0xA,	%g3
	set	0x8,	%g4
	set	0x8,	%g5
	set	0x2,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x8,	%i1
	set	-0x1,	%i2
	set	-0xB,	%i3
	set	-0xA,	%i4
	set	-0xC,	%i5
	set	-0xF,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x73CCA564,	%l0
	set	0x5D18A944,	%l1
	set	0x10D73395,	%l2
	set	0x4B2BD73C,	%l3
	set	0x7688076A,	%l4
	set	0x178C67BA,	%l5
	set	0x080E099A,	%l6
	set	0x64D5DE80,	%l7

	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

	!# Float Registers
	INIT_TH_FP_REG(%l7, %f0, 0x55555555aaaaaaaa)
	INIT_TH_FP_REG(%l7, %f2, 0xaaaaaaaa55555555)
	INIT_TH_FP_REG(%l7, %f4, 0xfedcba9876543210)
	INIT_TH_FP_REG(%l7, %f6, 0x0123456789abcdef)
	INIT_TH_FP_REG(%l7, %f8, 0x55aa55aaff00ff00)
	INIT_TH_FP_REG(%l7, %f10, 0x1111111111111111)
	INIT_TH_FP_REG(%l7, %f12, 0x8888888888888888)
	INIT_TH_FP_REG(%l7, %f14, 0xfedcba9876543210)

	!# Execute some ALU ops ..

	sll	%o2,	0x1D,	%o3
	srlx	%o5,	0x07,	%l2
	fnegs	%f13,	%f9
	andn	%g4,	0x1933,	%o0
	fands	%f3,	%f12,	%f5
	addcc	%l6,	0x0B02,	%g6
	orn	%l1,	0x1D00,	%l4
	andncc	%g7,	%o1,	%i2
	fmovs	%f7,	%f0
	fxors	%f7,	%f2,	%f0
	brgz,a	%o6,	loop_1
	fmovs	%f13,	%f6
	xorcc	%l3,	0x0172,	%o7
	xnor	%i5,	0x1C4B,	%i0
loop_1:
	fxor	%f10,	%f10,	%f4
	bleu	%icc,	loop_2
	srlx	%l5,	%o4,	%i7
	srl	%g1,	%g2,	%i3
	orn	%i6,	%i1,	%l7
loop_2:
	srlx	%g3,	%i4,	%l0
	and	%o2,	%o3,	%o5
	fornot1	%f12,	%f10,	%f12
	fors	%f1,	%f9,	%f2
	subc	%g4,	%o0,	%g5
	subcc	%l6,	0x1D4D,	%g6
	addccc	%l4,	0x041F,	%g7
	bge,a,pn	%xcc,	loop_3
	xorcc	%l1,	0x16DF,	%o1
	xorcc	%l2,	%i2,	%l3
	addcc	%o7,	0x1C07,	%o6
loop_3:
	andncc	%i0,	%o4,	%l5
	fornot1s	%f12,	%f6,	%f6
	addcc	%g1,	0x03AC,	%i7
	addc	%i3,	%i5,	%g2
	sra	%i6,	%l7,	%i4
	andn	%i1,	%l0,	%o3
	andncc	%g3,	%o2,	%g4
	fnors	%f6,	%f15,	%f6
	xnorcc	%o0,	0x023C,	%l6
	andn	%o5,	0x073D,	%g6
	brlez	%g7,	loop_4
	fone	%f10
	faligndata	%f0,	%f6,	%f12
	srl	%l1,	%o1,	%g5
loop_4:
	fabsd	%f2,	%f4
	bleu,pt	%xcc,	loop_5
	subc	%l4,	%l2,	%i2
	addcc	%o7,	0x1D0D,	%i0
	andncc	%l3,	%l5,	%g1
loop_5:
	srax	%i7,	%i3,	%i5
	subc	%o4,	%i6,	%o6
	bleu,pn	%icc,	loop_6
	subcc	%i4,	%i1,	%l7
	xnorcc	%l0,	%o3,	%g3
	srl	%o2,	%o0,	%g2
loop_6:
	bvc	loop_7
	subcc	%l6,	%g6,	%g4
	ble,pn	%icc,	loop_8
	brlz	%g7,	loop_9
loop_7:
	sra	%o5,	%g5,	%l4
	xorcc	%o1,	%l2,	%l1
loop_8:
	fnand	%f12,	%f2,	%f0
loop_9:
	xnor	%i2,	0x1C2B,	%i0
	fsrc1	%f10,	%f8
	fsrc1s	%f1,	%f1
	ble,pn	%xcc,	loop_10
	faligndata	%f14,	%f4,	%f2
	fandnot2	%f0,	%f4,	%f12
	xnor	%l3,	0x1CB8,	%o7
loop_10:
	brlez,a	%i7,	loop_11
	fnegd	%f0,	%f6
	addc	%i3,	0x0BE1,	%g1
	bvs,a,pn	%icc,	loop_12
loop_11:
	sra	%o4,	0x17,	%l5
	fone	%f14
	orncc	%i6,	0x1007,	%i4
loop_12:
	sllx	%i5,	%i1,	%l0
	fnor	%f10,	%f4,	%f10
	bg,pt	%xcc,	loop_13
	fnegs	%f11,	%f13
	srax	%o6,	%o3,	%g3
	xnor	%l7,	0x1C55,	%o2
loop_13:
	fornot1	%f14,	%f8,	%f10
	bleu	loop_14
	addc	%o0,	%g6,	%g2
	bne,pt	%icc,	loop_15
	sethi	0x087F,	%g7
loop_14:
	fxor	%f0,	%f6,	%f14
	addc	%o5,	%l6,	%g5
loop_15:
	fxor	%f8,	%f2,	%f14
	sub	%o1,	%g4,	%l1
	fandnot1s	%f2,	%f1,	%f2
	orn	%l2,	0x057F,	%i0
	sll	%l3,	%i2,	%i7
	xnor	%l4,	0x06F8,	%o7
	fabsd	%f8,	%f4
	subcc	%o4,	%i3,	%g1
	xnor	%l5,	0x0D2D,	%i5
	orcc	%i4,	%i6,	%l0
	or	%i1,	0x1AF0,	%o3
	xnorcc	%o6,	0x00DE,	%o2
	sra	%o0,	0x04,	%g3
	xnor	%l7,	0x0E6E,	%g7
	srlx	%o5,	%g6,	%l6
	fandnot2	%f4,	%f12,	%f2
	orcc	%o1,	%g4,	%g5
	brlz	%g2,	loop_16
	fabss	%f15,	%f3
	fornot2s	%f1,	%f3,	%f0
	subcc	%i0,	%l2,	%l1
loop_16:
	fnot2s	%f1,	%f14
	bneg,a	%xcc,	loop_17
	bcs	%xcc,	loop_18
	sll	%i7,	0x0F,	%l3
	orncc	%i2,	0x0364,	%l4
loop_17:
	xorcc	%i3,	%o4,	%g1
loop_18:
	srl	%o7,	0x11,	%i5
	fnand	%f6,	%f14,	%f0
	xorcc	%l5,	0x0082,	%l0
	be	loop_19
	fxnor	%f4,	%f4,	%f10
	sethi	0x172E,	%i6
	or	%i1,	%o3,	%o2
loop_19:
	bneg,a,pt	%icc,	loop_20
	bpos	%xcc,	loop_21
	fnands	%f3,	%f2,	%f10
	sra	%o0,	0x1F,	%i4
loop_20:
	xnorcc	%o6,	0x1C97,	%g7
loop_21:
	fornot2	%f8,	%f2,	%f14
	xnorcc	%o5,	0x0F6C,	%g6
	andn	%g3,	0x0A56,	%o1
	brlez,a	%l6,	loop_22
	fabss	%f0,	%f10
	brlez,a	%l7,	loop_23
	srl	%g4,	%i0,	%g2
loop_22:
	addcc	%l2,	%l1,	%i7
	sub	%g5,	0x0C3A,	%i2
loop_23:
	ble,a,pn	%icc,	loop_24
	sll	%i3,	0x0E,	%o4
	addccc	%l3,	0x05F2,	%g1
	or	%i5,	0x11B9,	%l4
loop_24:
	fandnot1	%f12,	%f4,	%f0
	addcc	%l0,	%l5,	%i6
	srl	%o3,	%o7,	%o0
	fnands	%f0,	%f11,	%f10
	fnot2	%f4,	%f14
	addc	%o2,	%i1,	%g7
	andcc	%o6,	0x102E,	%o5
	and	%i4,	0x0765,	%g3
	fzeros	%f4
	sra	%o1,	0x1C,	%l6
	ble,pn	%icc,	loop_25
	fabss	%f4,	%f10
	sllx	%l7,	%g6,	%i0
	andn	%l2,	0x0FA5,	%g2
loop_25:
	sra	%l1,	0x10,	%i7
	andncc	%g4,	%i3,	%i2
	fsrc1	%f12,	%f4
	srlx	%o4,	%l3,	%i5
	addcc	%g5,	0x0322,	%l4
	fxors	%f3,	%f11,	%f9
	xor	%l0,	0x09D1,	%l5
	andcc	%g1,	0x1D41,	%o7
	srl	%o3,	0x01,	%i6
	andcc	%i1,	%g7,	%o6
	or	%o0,	0x1F90,	%i4
	addccc	%o5,	0x0A4C,	%g3
	fones	%f11
	srax	%l6,	0x0C,	%o2
	fsrc1s	%f4,	%f4
	addc	%l7,	%o1,	%g6
	andcc	%i0,	%l2,	%i7
	fornot2	%f8,	%f14,	%f4
	xnorcc	%g4,	%i3,	%l1
	sllx	%o4,	0x19,	%l3
	brnz	%g2,	loop_26
	fand	%f8,	%f12,	%f2
	fsrc1	%f4,	%f14
	bne	loop_27
loop_26:
	orncc	%g5,	0x12DF,	%i5
	orn	%i2,	%l0,	%l4
	fand	%f10,	%f12,	%f10
loop_27:
	and	%l5,	%g1,	%o3
	fandnot1s	%f0,	%f12,	%f11
	orn	%i1,	0x155D,	%o7
	sll	%i6,	%o6,	%g7
	orcc	%i4,	%o0,	%l6
	addc	%o2,	%l7,	%g3
	addccc	%g6,	0x1842,	%o5
	sra	%i0,	0x05,	%o1
	fand	%f14,	%f14,	%f0
	brz	%l2,	loop_28
	subcc	%g4,	%l1,	%i7
	orncc	%o4,	%i3,	%g5
	or	%g2,	0x1776,	%i2
loop_28:
	addccc	%l0,	%l3,	%l4
	orncc	%i5,	0x009B,	%o3
	srl	%i1,	0x09,	%o7
	sethi	0x0793,	%i6
	fnegd	%f2,	%f14
	sra	%l5,	0x01,	%g1
	srlx	%g7,	0x06,	%o6
	fsrc2s	%f13,	%f11
	fors	%f1,	%f11,	%f12
	and	%o0,	%l6,	%i4
	andncc	%g3,	%g6,	%o2
	fabsd	%f0,	%f12
	sll	%i0,	%o5,	%o1
	fors	%f9,	%f0,	%f7
	andncc	%l7,	%g4,	%l1
	addc	%l2,	%o4,	%i3
	sra	%i7,	%g2,	%l0
	bl,a,pn	%xcc,	loop_29
	bpos,a,pn	%xcc,	loop_30
	xorcc	%i2,	0x1332,	%g5
	ble,pt	%icc,	loop_31
loop_29:
	xnor	%l4,	%l3,	%i1
loop_30:
	srl	%o3,	0x18,	%i6
	fnor	%f14,	%f10,	%f12
loop_31:
	srax	%l5,	%o7,	%g7
	addccc	%i5,	0x0165,	%g1
	fxnors	%f10,	%f5,	%f15
	addc	%l6,	0x1452,	%o0
	orn	%g3,	%o6,	%o2
	xorcc	%i4,	0x0785,	%g6
	addccc	%o1,	0x0186,	%o5
	ba,a,pt	%xcc,	loop_32
	fmovs	%f0,	%f9
	srax	%l7,	0x02,	%i0
	sethi	0x0760,	%g4
loop_32:
	xorcc	%o4,	%l1,	%i3
	brlz,a	%g2,	loop_33
	fnors	%f5,	%f6,	%f5
	brlz	%i7,	loop_34
	sethi	0x034A,	%l0
loop_33:
	orncc	%i2,	%l4,	%l3
	xnor	%i1,	0x10C9,	%l2
loop_34:
	or	%g5,	%l5,	%o7
	orcc	%i6,	%o3,	%i5
	add	%g1,	0x0B2D,	%l6
	be	%icc,	loop_35
	orncc	%g7,	0x1414,	%o6
	fzero	%f10
	subc	%g3,	0x1801,	%o0
loop_35:
	add	%i4,	%o1,	%o5
	add	%l7,	0x1B11,	%g6
	fornot1s	%f14,	%f1,	%f2
	and	%o2,	0x19D6,	%i0
	bl,a	loop_36
	subccc	%o4,	0x0E5B,	%l1
	orncc	%g2,	0x15B1,	%i7
	fsrc1	%f4,	%f14
loop_36:
	andn	%i3,	0x0FA2,	%l0
	bvc	%icc,	loop_37
	xorcc	%g4,	%i2,	%i1
	or	%l4,	0x1DBC,	%l2
	add	%l5,	0x1561,	%l3
loop_37:
	xnor	%g5,	%i6,	%i5
	andn	%o7,	0x110A,	%o3
	brlz	%g1,	loop_38
	fzero	%f8
	fnot1	%f6,	%f12
	srlx	%l6,	0x1F,	%g3
loop_38:
	subcc	%o0,	%o6,	%g7
	for	%f0,	%f6,	%f8
	andn	%o5,	%o1,	%i4
	addc	%g6,	0x0B79,	%o2
	orn	%o4,	0x0B01,	%l1
	orncc	%i0,	%l7,	%i3
	fsrc1	%f0,	%f2
	bge,a,pt	%xcc,	loop_39
	orcc	%i7,	%g4,	%g2
	fornot2	%f2,	%f6,	%f4
	xnorcc	%i1,	%l0,	%l4
loop_39:
	sll	%l5,	0x0B,	%l3
	andcc	%g5,	0x0003,	%i2
	fmovs	%f4,	%f8
	orcc	%l2,	0x15B0,	%i5
	sra	%o3,	0x0C,	%g1
	ba,a	loop_40
	bpos,pt	%icc,	loop_41
	sll	%l6,	%g3,	%o0
	subcc	%i6,	0x0F15,	%o7
loop_40:
	bge,a,pt	%icc,	loop_42
loop_41:
	fandnot2s	%f14,	%f0,	%f15
	srlx	%g7,	%o1,	%i4
	sra	%o5,	0x03,	%g6
loop_42:
	orcc	%o4,	%l1,	%o2
	srl	%o6,	0x0F,	%i3
	fandnot2	%f14,	%f8,	%f4
	subcc	%i7,	0x0408,	%g4
	fornot1s	%f6,	%f12,	%f4
	xnor	%i0,	%g2,	%l0
	for	%f0,	%f4,	%f12
	subccc	%i1,	%l5,	%l4
	srax	%l7,	0x0E,	%i2
	fornot2	%f12,	%f2,	%f2
	sllx	%l2,	0x1A,	%g5
	fors	%f5,	%f10,	%f4
	orncc	%o3,	0x0312,	%g1
	srlx	%l3,	0x0F,	%g3
	andncc	%o0,	%i6,	%l6
	bcs,a,pn	%xcc,	loop_43
	xnorcc	%o7,	0x1782,	%g7
	sll	%o1,	%i4,	%o5
	fzeros	%f11
loop_43:
	addc	%i5,	0x1E60,	%o4
	fnor	%f2,	%f4,	%f8
	srax	%g6,	0x0B,	%o2
	orn	%i3,	%o6,	%i7
	xnor	%i0,	0x1555,	%l1
	xnor	%g4,	%i1,	%l0
	xorcc	%g2,	%l7,	%i2
	srl	%l5,	0x12,	%l4
	sethi	0x0E71,	%l2
	sllx	%g1,	%l3,	%o3
	srlx	%o0,	0x04,	%g3
	fxnors	%f8,	%f0,	%f5
	brgez	%g5,	loop_44
	orcc	%o7,	0x0937,	%i6
	bpos,a,pt	%xcc,	loop_45
	addcc	%l6,	0x1E83,	%i4
loop_44:
	xnorcc	%o1,	%o5,	%i5
	subc	%g6,	%o4,	%i3
loop_45:
	addc	%o6,	0x0CFD,	%g7
	bge,pt	%icc,	loop_46
	addcc	%i7,	%o2,	%l1
	subcc	%i1,	0x0484,	%g4
	bleu,a	%xcc,	loop_47
loop_46:
	orcc	%i0,	0x1F79,	%g2
	andn	%i2,	0x0C02,	%l5
	orn	%l7,	0x1976,	%l4
loop_47:
	fmovd	%f0,	%f6
	sethi	0x1961,	%l2
	fabsd	%f8,	%f2
	fnor	%f14,	%f14,	%f8
	xor	%g1,	%l3,	%o3
	sethi	0x0455,	%l0
	sethi	0x1B84,	%o0
	sub	%o7,	0x04A0,	%g3
	fors	%f6,	%f3,	%f0
	fmovd	%f12,	%f8
	addcc	%i6,	%g5,	%o1
	orncc	%l6,	%i5,	%o5
	xnorcc	%g6,	0x0BC7,	%i4
	subcc	%o6,	0x0CF2,	%g7
	bl,a	loop_48
	faligndata	%f4,	%f8,	%f10
	orcc	%o4,	0x1150,	%i3
	orncc	%o2,	0x1DE3,	%i1
loop_48:
	subcc	%g4,	0x067F,	%l1
	sll	%i7,	%i0,	%g2
	srlx	%l5,	%l7,	%l2
	andn	%g1,	%l3,	%l4
	orncc	%l0,	0x0A2A,	%o0
	andncc	%o7,	%g3,	%i2
	andcc	%i6,	0x0751,	%g5
	brnz	%o3,	loop_49
	xnorcc	%i5,	0x1993,	%o5
	orncc	%l6,	0x0B4D,	%g6
	and	%o1,	0x0150,	%g7
loop_49:
	addccc	%o6,	%i3,	%o4
	fandnot1	%f10,	%f4,	%f6
	fandnot1	%f6,	%f6,	%f8
	xnorcc	%o2,	0x0EC4,	%i1
	fors	%f9,	%f9,	%f0
	for	%f4,	%f12,	%f12
	srlx	%l1,	%i7,	%i4
	xnorcc	%g4,	%l5,	%g2
	xorcc	%l2,	0x03D2,	%l7
	fands	%f7,	%f6,	%f2
	sra	%g1,	%l3,	%l4
	fands	%f10,	%f0,	%f1
	xorcc	%i0,	%l0,	%o0
	orncc	%o7,	%i6,	%g3
	and	%i2,	%i5,	%o5
	sra	%g5,	0x07,	%o3
	xnor	%g6,	%l6,	%g7
	fxnors	%f0,	%f12,	%f11
	srlx	%o1,	%i3,	%o2
	xor	%o4,	%i1,	%o6
	sllx	%i7,	%i4,	%l5
	subc	%g2,	%l1,	%l7
	srlx	%g1,	%g4,	%l3
	and	%l4,	%l2,	%l0
	fsrc2	%f12,	%f4
	srlx	%o7,	0x06,	%i0
	srlx	%o0,	0x1B,	%i6
	fornot1	%f4,	%f14,	%f14
	add	%i2,	%g3,	%g5
	sllx	%o5,	0x12,	%g6
	sethi	0x02CF,	%l6
	add	%o3,	%o1,	%i5
	addc	%o2,	%i3,	%g7
	fands	%f8,	%f12,	%f10
	xorcc	%i1,	0x1316,	%i7
	ble,a,pn	%xcc,	loop_50
	srl	%i4,	%l5,	%o6
	sub	%g2,	%o4,	%l1
	bcs	%icc,	loop_51
loop_50:
	fabss	%f2,	%f6
	subc	%g1,	%g4,	%l7
	fnot2s	%f7,	%f10
loop_51:
	andn	%l4,	0x16C6,	%l0
	fsrc1s	%f10,	%f13
	and	%l3,	%i0,	%l2
	fabsd	%f0,	%f12
	sll	%o7,	%i2,	%i6
	addc	%o0,	%g5,	%o5
	subccc	%g6,	0x007C,	%g3
	fabsd	%f4,	%f6
	xnorcc	%o1,	0x11B1,	%i5
	fones	%f1
	fnors	%f7,	%f1,	%f14
	andcc	%o3,	0x1F66,	%o2
	srax	%i3,	%l6,	%i1
	faligndata	%f2,	%f14,	%f4
	orncc	%g7,	0x1304,	%i7
	add	%i4,	0x01F7,	%g2
	orn	%o6,	0x1D1A,	%l1
	orncc	%o4,	%g4,	%g1
	brlz	%l5,	loop_52
	bl,a,pn	%icc,	loop_53
	orn	%l7,	0x168E,	%l0
	srlx	%l3,	0x08,	%i0
loop_52:
	fxors	%f11,	%f8,	%f0
loop_53:
	fsrc1	%f8,	%f12
	orcc	%l2,	%o7,	%l4
	fnands	%f8,	%f14,	%f13
	fxnor	%f2,	%f6,	%f14
	sll	%o0,	%g5,	%i2
	fmovs	%f15,	%f4
	ba,pt	%icc,	loop_54
	addccc	%g6,	%o5,	%g3
	bl,a	%icc,	loop_55
	subc	%o1,	0x1049,	%i5
loop_54:
	orn	%i6,	%o2,	%i3
	andn	%i1,	0x18E4,	%g7
loop_55:
	srlx	%i7,	%l6,	%g2
	addccc	%o3,	0x0FF1,	%o6
	fabsd	%f10,	%f6
	ble,a	loop_56
	addc	%l1,	0x1E94,	%g4
	brz,a	%i4,	loop_57
	srax	%g1,	%l5,	%l0
loop_56:
	sethi	0x04F2,	%o4
	bn,a,pt	%icc,	loop_58
loop_57:
	bn,pt	%icc,	loop_59
	subcc	%l7,	%i0,	%l2
	add	%l4,	0x02F3,	%o0
loop_58:
	fabsd	%f8,	%f12
loop_59:
	srlx	%o7,	0x0B,	%i2
	fnot1	%f0,	%f10
	bvc,a,pt	%icc,	loop_60
	fxor	%f4,	%f6,	%f12
	fnand	%f4,	%f14,	%f8
	orcc	%l3,	0x101B,	%g5
loop_60:
	orncc	%o5,	0x1EC7,	%g6
	sllx	%g3,	0x08,	%o1
	xnorcc	%i5,	0x141E,	%o2
	bpos,a	loop_61
	bgu,pt	%xcc,	loop_62
	orcc	%i1,	%i6,	%i3
	orn	%i7,	%g2,	%o3
loop_61:
	for	%f8,	%f6,	%f2
loop_62:
	xorcc	%l6,	0x1ADD,	%g7
	andn	%g4,	%l1,	%g1
	add	%i4,	%l5,	%o4
	subccc	%l7,	0x0AAF,	%i0
	xorcc	%l0,	0x0EB2,	%l2
	subcc	%o6,	%l4,	%o7
	subc	%i2,	0x1455,	%g5
	addc	%o0,	%g6,	%o5
	brz,a	%g3,	loop_63
	orn	%l3,	%i5,	%i1
	brz,a	%o2,	loop_64
	bvs	loop_65
loop_63:
	fornot2s	%f14,	%f14,	%f5
	addcc	%i3,	%o1,	%i7
loop_64:
	bgu,a	%xcc,	loop_66
loop_65:
	fornot1	%f0,	%f6,	%f14
	bn,a	loop_67
	sethi	0x12C0,	%o3
loop_66:
	xnor	%l6,	%i6,	%g4
	fornot2s	%f9,	%f15,	%f7
loop_67:
	bpos,pt	%xcc,	loop_68
	sub	%l1,	0x0C83,	%g7
	srl	%g1,	%g2,	%o4
	xorcc	%l5,	%i4,	%i0
loop_68:
	xorcc	%l7,	0x0F81,	%l0
	xnor	%o6,	0x0AF2,	%l4
	or	%o7,	%i2,	%o0
	srlx	%g5,	0x05,	%o5
	bl,pt	%icc,	loop_69
	fxnors	%f15,	%f14,	%f15
	fandnot2s	%f7,	%f1,	%f3
	fand	%f4,	%f0,	%f8
loop_69:
	subc	%l2,	%g3,	%l3
	subccc	%i1,	0x0952,	%o2
	brnz	%g6,	loop_70
	bcs,a	loop_71
	subc	%i3,	0x1E9B,	%i5
	subcc	%o1,	%o3,	%i7
loop_70:
	and	%g4,	0x097E,	%i6
loop_71:
	fsrc2	%f6,	%f10
	fnors	%f7,	%f11,	%f7
	bcc,pt	%icc,	loop_72
	fandnot2s	%f11,	%f14,	%f1
	fandnot1	%f4,	%f10,	%f12
	srlx	%l6,	%l1,	%g2
loop_72:
	sllx	%o4,	%g1,	%g7
	bpos	loop_73
	and	%i4,	%l7,	%i0
	xorcc	%o6,	%l4,	%l5
	subccc	%i2,	%o7,	%o0
loop_73:
	subcc	%l0,	%o5,	%g3
	fnot1	%f4,	%f6
	be	loop_74
	or	%l3,	0x0000,	%l2
	fand	%f6,	%f8,	%f10
	add	%g5,	%o2,	%i3
loop_74:
	fornot2	%f10,	%f4,	%f4
	andncc	%i5,	%i1,	%o1
	andn	%o3,	0x1449,	%g6
	sub	%i6,	%l6,	%l1
	srlx	%i7,	%o4,	%g4
	fone	%f12
	addc	%g7,	%g2,	%l7
	orn	%i0,	%g1,	%l4
	sethi	0x11C8,	%o6
	xnor	%i2,	0x1B77,	%i4
	andn	%o7,	%l0,	%o5
	and	%l5,	0x15C3,	%g3
	fnor	%f14,	%f12,	%f14
	fabss	%f14,	%f6
	xnorcc	%l3,	0x1008,	%o0
	fornot1s	%f5,	%f4,	%f11
	sethi	0x118A,	%g5
	brgez	%i3,	loop_75
	fnor	%f14,	%f4,	%f10
	andn	%l2,	%i1,	%o1
	fxnors	%f0,	%f5,	%f0
loop_75:
	subccc	%i5,	0x1A11,	%o3
	fnors	%f8,	%f9,	%f3
	fandnot2s	%f9,	%f8,	%f8
	be	loop_76
	orn	%i6,	0x0274,	%g6
	andncc	%l1,	%l6,	%i7
	fnand	%f2,	%f10,	%f2
loop_76:
	addcc	%o2,	0x17DE,	%g7
	sllx	%g4,	0x19,	%l7
	sra	%i0,	%o4,	%l4
	sub	%g1,	%o6,	%g2
	andn	%o7,	0x0622,	%i4
	and	%l0,	%l5,	%o5
	brnz	%i2,	loop_77
	andncc	%g3,	%g5,	%i3
	xorcc	%o0,	%l3,	%i1
	addcc	%o1,	0x0902,	%l2
loop_77:
	sub	%o3,	%i5,	%l1
	or	%i6,	0x0B0A,	%i7
	andncc	%g6,	%g7,	%o2
	fnands	%f0,	%f10,	%f5
	subcc	%l6,	0x0F34,	%g4
	fsrc2s	%f2,	%f14
	add	%o4,	%i0,	%l7
	fands	%f15,	%f8,	%f11
	fabss	%f1,	%f2
	sub	%l4,	%g2,	%o6
	fors	%f7,	%f0,	%f6
	orncc	%i4,	%g1,	%l5
	fmovs	%f5,	%f0
	orn	%o7,	0x0EF5,	%o5
	xnor	%i2,	0x1AC8,	%l0
	fmovd	%f6,	%f0
	xorcc	%g3,	%i3,	%o0
	xorcc	%l3,	%g5,	%l2
	srl	%o1,	0x18,	%i1
	subc	%i5,	%i6,	%o3
	ba,pt	%icc,	loop_78
	fandnot2s	%f13,	%f9,	%f10
	fnands	%f14,	%f12,	%f3
	orn	%l1,	0x0816,	%i7
loop_78:
	orcc	%g6,	0x10CA,	%g7
	addcc	%g4,	%o4,	%i0
	ble,a,pt	%xcc,	loop_79
	or	%o2,	%l4,	%l6
	and	%o6,	%g2,	%l7
	sethi	0x17B4,	%i4
loop_79:
	fandnot2s	%f7,	%f14,	%f3
	and	%o7,	0x1A9A,	%o5
	fsrc2	%f6,	%f6
	sethi	0x054D,	%g1
	subcc	%l0,	%l5,	%g3
	sub	%i2,	%l3,	%o0
	fxor	%f0,	%f2,	%f4
	xor	%l2,	%o1,	%i1
	xnorcc	%i3,	%i5,	%o3
	and	%i6,	%l1,	%i7
	fsrc1s	%f11,	%f6
	xor	%g6,	0x15A6,	%g5
	bpos	loop_80
	fmovd	%f12,	%f6
	srl	%o4,	%i0,	%g7
	addccc	%g4,	0x1541,	%l4
loop_80:
	fnegd	%f4,	%f2
	and	%o2,	%l6,	%o6
	sra	%g2,	%o7,	%l7
	add	%o5,	%l0,	%i4
	subccc	%g3,	%g1,	%l5
	add	%o0,	%l2,	%i2
	srlx	%i1,	%o1,	%i5
	fxors	%f12,	%f0,	%f6
	sub	%o3,	0x1724,	%i6
	andcc	%l1,	%i7,	%i3
	sub	%g5,	0x04FF,	%l3
	xnor	%i0,	%o4,	%g4
	brz	%g6,	loop_81
	andncc	%l4,	%o2,	%o6
	bvs,pn	%xcc,	loop_82
	fandnot1	%f12,	%f6,	%f2
loop_81:
	srl	%l6,	%g7,	%o7
	xnor	%l7,	%l0,	%g2
loop_82:
	subcc	%i4,	%g3,	%o5
	fsrc1s	%f1,	%f4
	subc	%o0,	%l2,	%i2
	or	%l5,	0x171C,	%o1
	bgu,pn	%xcc,	loop_83
	srax	%i1,	%i5,	%i6
	subccc	%g1,	0x111A,	%i7
	fsrc2s	%f10,	%f9
loop_83:
	bn,pn	%xcc,	loop_84
	fornot2	%f6,	%f0,	%f4
	bpos,a,pt	%icc,	loop_85
	subccc	%i3,	0x1B8E,	%g5
loop_84:
	add	%o3,	0x0DBB,	%l3
	andn	%l1,	%g4,	%o4
loop_85:
	bcs,pn	%icc,	loop_86
	orncc	%l4,	0x0FA0,	%o2
	andncc	%o6,	%g6,	%i0
	subcc	%l6,	0x0209,	%l7
loop_86:
	andncc	%l0,	%o7,	%g7
	xorcc	%i4,	%o5,	%g3
	addc	%g2,	0x0725,	%i2
	andcc	%l2,	0x104A,	%o1
	andn	%i1,	0x13E6,	%i5
	subcc	%o0,	0x0250,	%i6
	xnorcc	%l5,	%g1,	%i3
	orn	%g5,	%l3,	%i7
	subcc	%g4,	%o3,	%o4
	andncc	%o2,	%l1,	%l4
	subc	%o6,	%g6,	%l6
	or	%i0,	0x0232,	%o7
	addccc	%l7,	%i4,	%o5
	addc	%g3,	0x16C5,	%l0
	bcc,pt	%xcc,	loop_87
	subccc	%i2,	%g2,	%l2
	bcs	loop_88
	fzero	%f14
loop_87:
	fabsd	%f6,	%f6
	or	%g7,	0x1C78,	%i1
loop_88:
	bge,a	loop_89
	subccc	%o0,	%o1,	%i5
	srl	%g1,	%l5,	%i6
	fzero	%f0
loop_89:
	fnand	%f14,	%f0,	%f12
	fandnot2	%f12,	%f2,	%f4
	add	%g5,	%l3,	%i7
	addcc	%g4,	0x08D9,	%i3
	fmovd	%f4,	%f2
	fone	%f4
	add	%o2,	0x19AD,	%o3
	fmovs	%f5,	%f8
	add	%l4,	0x0D52,	%l1
	bvs	%xcc,	loop_90
	add	%g6,	%l6,	%i0
	xnor	%o4,	0x013C,	%o6
	andcc	%i4,	%o5,	%l7
loop_90:
	xorcc	%l0,	%i2,	%g2
	xnor	%g3,	%o7,	%g7
	sethi	0x11CE,	%o0
	orn	%l2,	%i1,	%g1
	sra	%l5,	%i6,	%o1
	bn	%icc,	loop_91
	brgez	%i5,	loop_92
	bcs,pt	%xcc,	loop_93
	orn	%i7,	0x1579,	%l3
loop_91:
	xor	%g4,	0x1D2C,	%i3
loop_92:
	addc	%o3,	%o2,	%l4
loop_93:
	srl	%g6,	%g5,	%l6
	or	%l1,	0x1D6A,	%o6
	sllx	%i4,	0x07,	%i0
	addc	%o5,	%l7,	%l0
	sub	%i2,	%o4,	%g2
	brz	%g7,	loop_94
	and	%o0,	%g3,	%l2
	add	%g1,	0x0EA3,	%l5
	xnorcc	%i6,	0x1EB4,	%i1
loop_94:
	fabss	%f12,	%f11
	xor	%o1,	%i5,	%o7
	or	%i7,	%i3,	%o3
	subcc	%g4,	0x023B,	%l4
	bcs,a	%xcc,	loop_95
	xor	%l3,	%o2,	%l6
	addccc	%g5,	%l1,	%i4
	sethi	0x0BD9,	%o6
loop_95:
	be,pt	%icc,	loop_96
	srlx	%o5,	%l7,	%i0
	fabsd	%f4,	%f8
	fornot2	%f12,	%f8,	%f8
loop_96:
	addccc	%i2,	0x0B34,	%l0
	fnot1	%f12,	%f6
	srlx	%g2,	0x09,	%o4
	add	%g7,	%o0,	%g6
	addcc	%g1,	0x1C43,	%l2
	sllx	%i6,	%i1,	%o1
	sllx	%l5,	0x0C,	%g3
	faligndata	%f2,	%f2,	%f6
	fnegd	%f2,	%f4
	xorcc	%i7,	0x04A1,	%i5
	bpos,a	%icc,	loop_97
	fandnot1	%f6,	%f8,	%f2
	addccc	%i3,	%o3,	%l4
	sub	%g4,	0x0510,	%o7
loop_97:
	brnz,a	%l3,	loop_98
	bn,a,pt	%icc,	loop_99
	bpos,a	%xcc,	loop_100
	subcc	%l6,	0x117A,	%l1
loop_98:
	fsrc1s	%f3,	%f11
loop_99:
	orcc	%g5,	0x1AD8,	%o2
loop_100:
	bl,a,pt	%icc,	loop_101
	andcc	%o6,	%i4,	%l7
	subc	%i2,	%o5,	%g2
	orn	%i0,	%g7,	%o4
loop_101:
	add	%g6,	0x15BA,	%l0
	xor	%l2,	0x15F4,	%o0
	and	%i1,	0x0FBC,	%i6
	or	%o1,	0x09DE,	%l5
	or	%i7,	0x1EE9,	%i5
	xnor	%g3,	0x1D9A,	%o3
	subccc	%l4,	0x1175,	%i3
	bge,a,pn	%xcc,	loop_102
	fzeros	%f1
	fnot1s	%f3,	%f11
	xnorcc	%o7,	0x116A,	%g1
loop_102:
	srax	%l3,	%l6,	%l1
	fxnor	%f8,	%f14,	%f6
	sllx	%g4,	%o6,	%g5
	bcc	%icc,	loop_103
	fsrc2s	%f10,	%f15
	srl	%i4,	%i2,	%o2
	ba,a,pt	%xcc,	loop_104
loop_103:
	andncc	%g2,	%o5,	%l7
	be,a	loop_105
	orcc	%i0,	%o4,	%l0
loop_104:
	fnegs	%f14,	%f6
	fnegs	%f5,	%f4
loop_105:
	sra	%g7,	0x0C,	%l2
	or	%g6,	%o0,	%o1
	bcc,pt	%icc,	loop_106
	sethi	0x1966,	%l5
	fsrc2s	%f6,	%f7
	fornot2	%f2,	%f4,	%f14
loop_106:
	fnegs	%f12,	%f15
	addc	%i1,	0x0D97,	%i6
	addc	%i7,	0x0B1B,	%o3
	fsrc1	%f2,	%f12
	orncc	%i5,	0x0D74,	%i3
	subccc	%l4,	0x09D1,	%g3
	orn	%l3,	%l6,	%o7
	sllx	%g4,	0x0D,	%o6
	andcc	%g1,	0x1AB3,	%i4
	bge	%icc,	loop_107
	sub	%g5,	%i2,	%g2
	fands	%f14,	%f9,	%f1
	bpos	%icc,	loop_108
loop_107:
	subcc	%l1,	%l7,	%o5
	srl	%o4,	%l0,	%g7
	orcc	%o2,	%i0,	%o0
loop_108:
	andncc	%g6,	%o1,	%l5
	fsrc2s	%f5,	%f10
	sll	%l2,	0x11,	%i7
	brgez	%i6,	loop_109
	sra	%o3,	0x08,	%i5
	sub	%l4,	%i3,	%i1
	xorcc	%l6,	%g3,	%g4
loop_109:
	fabsd	%f2,	%f12
	orncc	%o6,	0x0F0E,	%l3
	addccc	%i4,	%g1,	%i2
	addc	%g2,	0x1A9D,	%l1
	fnegs	%f7,	%f10
	bg,a,pn	%xcc,	loop_110
	orncc	%g5,	%o7,	%o5
	fands	%f9,	%f1,	%f0
	fands	%f15,	%f9,	%f12
loop_110:
	andcc	%o4,	0x14ED,	%g7
	xnorcc	%l0,	%o2,	%i0
	fnot1	%f8,	%f4
	bvc,a	%icc,	loop_111
	bcc,pn	%xcc,	loop_112
	xnorcc	%l7,	0x0B8D,	%g6
	fnot2	%f10,	%f12
loop_111:
	xnorcc	%o0,	0x1079,	%l2
loop_112:
	addcc	%l5,	%o1,	%i6
	sub	%o3,	%l4,	%i3
	sll	%i5,	0x18,	%i1
	fnot2s	%f9,	%f11
	ble	loop_113
	fone	%f8
	addccc	%l6,	%i7,	%g4
	orn	%l3,	%i4,	%g1
loop_113:
	fsrc1s	%f8,	%f0
	subcc	%o6,	%g2,	%l1
	be,a	%xcc,	loop_114
	bl	loop_115
	srl	%i2,	0x15,	%g3
	srlx	%o5,	%o7,	%g7
loop_114:
	srl	%g5,	%o2,	%o4
loop_115:
	add	%l7,	0x02BD,	%l0
	fornot2	%f6,	%f4,	%f12
	addccc	%i0,	0x159E,	%o0
	addccc	%l5,	%o1,	%l2
	and	%o3,	%l4,	%i3
	fsrc1	%f14,	%f0
	orncc	%i6,	0x1829,	%g6
	fsrc2	%f4,	%f8
	fandnot2s	%f8,	%f3,	%f1
	xorcc	%i1,	%l6,	%i5
	orncc	%g4,	%i7,	%i4
	sll	%l3,	%g2,	%o6
	fsrc2s	%f10,	%f15
	addccc	%i2,	%g1,	%o5
	add	%g3,	0x1F2A,	%g7
	addc	%g5,	%o7,	%o4
	srl	%l1,	%o2,	%i0
	addcc	%l0,	%l7,	%l5
	xnorcc	%o1,	%o0,	%l2
	brlz,a	%l4,	loop_116
	ba	loop_117
	srax	%o3,	0x1F,	%i6
	srax	%i1,	0x01,	%l6
loop_116:
	fnegs	%f0,	%f10
loop_117:
	srl	%i3,	%g4,	%i5
	bgu,a	%xcc,	loop_118
	fnot1s	%f12,	%f11
	add	%g6,	%i4,	%i7
	fand	%f14,	%f14,	%f4
loop_118:
	for	%f8,	%f2,	%f14
	xorcc	%o6,	0x10DE,	%l3
	fandnot1s	%f7,	%f12,	%f14
	ba,pn	%icc,	loop_119
	sllx	%g1,	%i2,	%o5
	fxors	%f13,	%f2,	%f9
	add	%g2,	%g5,	%g3
loop_119:
	fandnot2	%f10,	%f14,	%f8
	andncc	%g7,	%o4,	%l1
	subcc	%i0,	%l0,	%l7
	bcs,a,pt	%xcc,	loop_120
	bne,pn	%icc,	loop_121
	fnot2	%f0,	%f6
	or	%l5,	%o2,	%o7
loop_120:
	sllx	%o0,	%o1,	%o3
loop_121:
	fandnot1	%f6,	%f8,	%f14
	fzeros	%f7
	addcc	%l2,	%i6,	%i1
	fxors	%f9,	%f7,	%f12
	sub	%l4,	0x1ACF,	%i3
	xorcc	%l6,	0x11C4,	%i5
	orncc	%i4,	0x19B7,	%i7
	brlz	%g6,	loop_122
	faligndata	%f10,	%f10,	%f12
	fmovs	%f12,	%f6
	bpos,pt	%xcc,	loop_123
loop_122:
	sllx	%g4,	0x0D,	%l3
	brlz,a	%o6,	loop_124
	subcc	%g1,	%g2,	%i2
loop_123:
	xnorcc	%o5,	%g3,	%o4
	xor	%g7,	%i0,	%g5
loop_124:
	ble	loop_125
	bg,a,pn	%xcc,	loop_126
	add	%l0,	0x18A8,	%l1
	addcc	%o2,	0x1114,	%o7
loop_125:
	xnor	%l5,	%o1,	%o0
loop_126:
	addc	%l2,	%o3,	%i1
	subcc	%l4,	0x012B,	%l7
	add	%i6,	0x076E,	%i3
	fsrc1	%f4,	%f12
	faligndata	%f8,	%f2,	%f8
	fxor	%f12,	%f4,	%f14
	fandnot1s	%f15,	%f14,	%f0
	or	%i4,	0x0750,	%i7
	addccc	%g6,	0x1E84,	%l6
	fsrc2	%f10,	%f10
	fxnor	%f10,	%f10,	%f6
	orcc	%l3,	0x1EC8,	%g4
	addccc	%g1,	0x06BB,	%i5
	addcc	%i2,	0x0CE3,	%o5
	orncc	%g3,	%o6,	%g2
	sll	%g7,	0x1E,	%o4
	add	%i0,	0x0641,	%l0
	bne,pt	%xcc,	loop_127
	fmovd	%f6,	%f10
	bge,pt	%icc,	loop_128
	fnand	%f2,	%f4,	%f4
loop_127:
	ba,a,pt	%icc,	loop_129
	sll	%o2,	0x16,	%o7
loop_128:
	sll	%g5,	%l5,	%o1
	addc	%o0,	0x0DBF,	%o3
loop_129:
	sll	%i1,	%l4,	%l2
	sethi	0x0B72,	%i6
	brlez	%l1,	loop_130
	xor	%i4,	%i7,	%g6
	faligndata	%f8,	%f2,	%f6
	fnors	%f6,	%f0,	%f12
loop_130:
	srl	%l6,	%l7,	%l3
	bpos,a,pn	%icc,	loop_131
	or	%g1,	0x017A,	%i3
	andncc	%i2,	%g4,	%g3
	sllx	%o6,	%g2,	%i5
loop_131:
	fors	%f13,	%f15,	%f10
	be,a	%xcc,	loop_132
	fnegd	%f14,	%f12
	fnor	%f12,	%f4,	%f4
	sub	%o5,	0x0528,	%g7
loop_132:
	be,pn	%icc,	loop_133
	fsrc1s	%f15,	%f14
	subccc	%l0,	%o2,	%o4
	add	%g5,	%l5,	%o7
loop_133:
	fxnors	%f9,	%f14,	%f2
	fabsd	%f0,	%f4
	addccc	%o0,	%i0,	%o3
	fzero	%f14
	sllx	%l4,	%i1,	%i6
	sll	%l2,	0x0C,	%o1
	fnegd	%f2,	%f0
	xorcc	%l1,	%i7,	%l6
	and	%l7,	0x04F1,	%g6
	xnor	%l3,	%i3,	%g1
	orn	%i2,	%g4,	%o6
	sethi	0x0AE0,	%g3
	subccc	%i5,	0x1196,	%i4
	or	%g2,	%g7,	%o2
	sll	%l0,	%g5,	%l5
	srl	%o7,	0x0E,	%o0
	sethi	0x0E47,	%i0
	sub	%o3,	%o5,	%o4
	orn	%l4,	%i6,	%o1
	fandnot2s	%f12,	%f14,	%f9
	fxors	%f3,	%f4,	%f1
	srax	%l2,	%i1,	%l6
	subccc	%l7,	0x11F1,	%l1
	be	loop_134
	addc	%g6,	%i7,	%l3
	fzero	%f2
	addcc	%i3,	0x1DF6,	%g4
loop_134:
	fnot1	%f0,	%f6
	fornot2s	%f2,	%f9,	%f11
	addccc	%g1,	%g3,	%i5
	fabss	%f2,	%f6
	fornot2s	%f0,	%f2,	%f6
	xnor	%i2,	0x0B66,	%o6
	ble,a	loop_135
	orncc	%g7,	%i4,	%o2
	ble	%icc,	loop_136
	add	%g5,	%g2,	%l5
loop_135:
	sra	%o0,	0x0E,	%i0
	orn	%l0,	0x1425,	%o7
loop_136:
	srl	%o4,	0x02,	%o5
	sra	%o3,	%o1,	%i6
	bg,a,pn	%icc,	loop_137
	brnz	%i1,	loop_138
	sll	%l6,	%l4,	%l2
	sub	%l7,	0x0804,	%g6
loop_137:
	fxnor	%f0,	%f12,	%f10
loop_138:
	fornot2	%f14,	%f0,	%f14
	orncc	%i7,	0x03B6,	%i3
	fnot1	%f8,	%f2
	subccc	%l1,	%l3,	%g1
	fzeros	%f0
	bl,a	loop_139
	fnor	%f8,	%f0,	%f14
	fornot1s	%f1,	%f6,	%f0
	andncc	%i5,	%g3,	%o6
loop_139:
	fmovd	%f12,	%f6
	subccc	%g4,	%i2,	%g7
	fand	%f12,	%f14,	%f0
	xor	%i4,	0x0CD0,	%g5
	addc	%g2,	0x0EC4,	%o2
	orn	%l5,	0x0501,	%o0
	sra	%o7,	%o4,	%o5
	srlx	%l0,	%o1,	%i6
	brlz,a	%i0,	loop_140
	bvs,a	loop_141
	fmovd	%f2,	%f6
	xorcc	%i1,	0x03A3,	%l4
loop_140:
	fnegd	%f12,	%f0
loop_141:
	fors	%f8,	%f13,	%f4
	xorcc	%l2,	0x1588,	%l7
	andncc	%g6,	%o3,	%i3
	bcc	loop_142
	subcc	%l6,	0x07B2,	%i7
	fnand	%f2,	%f2,	%f6
	sub	%l1,	%g1,	%g3
loop_142:
	sll	%o6,	%l3,	%i2
	xnor	%g7,	%i5,	%i4
	andn	%g5,	0x1F6D,	%g2
	addc	%l5,	%o0,	%o2
	fand	%f10,	%f2,	%f8
	and	%o7,	0x118C,	%g4
	addcc	%l0,	%o5,	%o1
	sethi	0x1E95,	%i6
	sll	%o4,	0x07,	%i1
	bl,a,pt	%icc,	loop_143
	andncc	%l2,	%l7,	%i0
	addcc	%l4,	%o3,	%g6
	and	%i7,	0x0AA9,	%l6
loop_143:
	bn,pn	%xcc,	loop_144
	srl	%g1,	0x0C,	%l1
	srl	%g3,	%i3,	%l3
	fornot2	%f6,	%f10,	%f2
loop_144:
	fornot2	%f2,	%f2,	%f6
	subcc	%g7,	0x191D,	%i5
	orn	%i4,	%i2,	%o6
	subc	%g5,	0x11EB,	%o0
	xnor	%l5,	0x1E96,	%o7
	bcc,a	loop_145
	xorcc	%o2,	%l0,	%g2
	bleu,a,pt	%icc,	loop_146
	andncc	%o1,	%i6,	%o4
loop_145:
	bneg,a	%icc,	loop_147
	fnot2s	%f5,	%f10
loop_146:
	xnorcc	%i1,	%o5,	%g4
	bpos,a	%xcc,	loop_148
loop_147:
	sllx	%l2,	%i0,	%o3
	srlx	%l4,	%i7,	%g6
	andcc	%l6,	0x1E8C,	%l1
loop_148:
	sra	%l7,	%g3,	%l3
	orn	%i3,	%g7,	%i4
	andn	%g1,	0x09B7,	%o6
	ba	loop_149
	and	%g5,	0x0FEC,	%i5
	subcc	%i2,	%o7,	%o2
	subcc	%l5,	%l0,	%o0
loop_149:
	addccc	%i6,	0x1566,	%o4
	srl	%o1,	0x15,	%g2
	brlz	%o5,	loop_150
	bneg,a	loop_151
	subcc	%l2,	0x079C,	%i1
	brgz	%g4,	loop_152
loop_150:
	sub	%l4,	%i7,	%g6
loop_151:
	sethi	0x1354,	%o3
	xor	%l1,	0x14F9,	%l7
loop_152:
	fnor	%f12,	%f6,	%f8
	sethi	0x094E,	%l6
	orn	%i0,	0x1DD9,	%l3
	xorcc	%g3,	%i4,	%g7
	andncc	%i3,	%o6,	%g5
	bvc	%xcc,	loop_153
	and	%i2,	%i5,	%o7
	or	%l5,	%o2,	%l0
	bne	%xcc,	loop_154
loop_153:
	srlx	%i6,	0x0E,	%o4
	bcc	loop_155
	fmovs	%f4,	%f6
loop_154:
	bl,a	loop_156
	addccc	%g1,	0x02C5,	%g2
loop_155:
	orcc	%o1,	%o0,	%o5
	srl	%l2,	%l4,	%i7
loop_156:
	srax	%g6,	%i1,	%g4
	fnegs	%f4,	%f10
	fandnot2	%f2,	%f6,	%f14
	srax	%l1,	%o3,	%l7
	or	%l6,	%l3,	%i4
	addc	%g3,	%i3,	%g7
	subcc	%i0,	0x00BF,	%i2
	sra	%o6,	0x05,	%i5
	and	%o7,	0x1A82,	%o2
	sub	%g5,	0x1682,	%i6
	or	%o4,	%l0,	%l5
	sll	%o1,	%g2,	%g1
	and	%l2,	%o0,	%i7
	andcc	%l4,	0x0424,	%i1
	xorcc	%o5,	0x0066,	%l1
	orncc	%g6,	%l7,	%g4
	xnor	%l6,	%l3,	%g3
	brlz	%o3,	loop_157
	and	%g7,	0x0154,	%i0
	andncc	%i4,	%i2,	%i3
	srax	%o6,	0x03,	%o7
loop_157:
	srl	%g5,	%o2,	%i5
	fsrc1s	%f6,	%f5
	subcc	%i6,	0x1CD7,	%l5
	sub	%l0,	%o1,	%o4
	orn	%l2,	0x1830,	%g1
	fxnors	%f4,	%f13,	%f8
	fsrc2s	%f0,	%f6
	fxors	%f13,	%f12,	%f13
	bgu,a	%xcc,	loop_158
	xnorcc	%o0,	%l4,	%g2
	orncc	%o5,	0x1B64,	%l1
	addc	%i1,	%i7,	%g6
loop_158:
	bl,pn	%xcc,	loop_159
	sub	%g4,	%l3,	%l6
	bge,a,pn	%icc,	loop_160
	sethi	0x022D,	%o3
loop_159:
	brgez	%l7,	loop_161
	andn	%i0,	0x0D19,	%g7
loop_160:
	sra	%g3,	%i3,	%i4
	orcc	%i2,	%o7,	%o2
loop_161:
	sethi	0x0ADA,	%i5
	subccc	%g5,	0x109D,	%i6
	orn	%l5,	%o6,	%o1
	andncc	%l2,	%o4,	%l0
	bge,pt	%xcc,	loop_162
	sethi	0x0697,	%o0
	andncc	%l4,	%o5,	%g1
	orncc	%g2,	0x13F2,	%i7
loop_162:
	fandnot2	%f6,	%f2,	%f2
	orcc	%l1,	0x04BE,	%i1
	sll	%g4,	0x1E,	%g6
	addcc	%l3,	0x1838,	%l7
	fones	%f1
	andncc	%l6,	%o3,	%g7
	fsrc2	%f0,	%f6
	subccc	%i3,	%g3,	%i0
	sll	%i2,	%i4,	%o7
	sub	%i5,	0x0F9F,	%o2
	sllx	%i6,	0x16,	%l5
	fone	%f4
	sll	%o1,	0x15,	%g5
	subcc	%o4,	0x1354,	%l0
	add	%o0,	%l2,	%o5
	fxnors	%f2,	%f11,	%f8
	andn	%o6,	%l4,	%i7
	fnot2	%f2,	%f12
	bneg,a	%xcc,	loop_163
	sll	%g1,	0x0C,	%i1
	orn	%g2,	0x1034,	%g4
	fone	%f6
loop_163:
	sllx	%g6,	%l1,	%l3
	orn	%l6,	0x1BF2,	%l7
	xnorcc	%i3,	0x0C6D,	%g7
	fandnot2s	%f9,	%f7,	%f8
	for	%f2,	%f14,	%f4
	orncc	%o3,	0x0179,	%i2
	addccc	%i4,	0x0E94,	%g3
	brlez,a	%i5,	loop_164
	sra	%o2,	%i6,	%l5
	fnot1	%f4,	%f0
	sll	%o1,	0x1A,	%i0
loop_164:
	xorcc	%g5,	%o7,	%l0
	orncc	%o0,	%l2,	%o6
	andcc	%l4,	0x0DD3,	%o5
	andn	%o4,	0x09FA,	%g1
	orn	%g2,	%i7,	%i1
	xnorcc	%g4,	0x0A59,	%g6
	or	%l1,	0x0BA2,	%l6
	andncc	%l3,	%i3,	%g7
	fornot1s	%f3,	%f4,	%f3
	fandnot1s	%f11,	%f13,	%f7
	brgz	%l7,	loop_165
	xor	%o3,	%i4,	%i5
	fnors	%f4,	%f10,	%f6
	brlz,a	%g3,	loop_166
loop_165:
	fnot2	%f0,	%f12
	subc	%o2,	0x1018,	%l5
	addc	%i6,	%i2,	%g5
loop_166:
	srlx	%o7,	%l0,	%o1
	xorcc	%l2,	%o0,	%l4
	sllx	%o6,	0x1C,	%o5
	fnands	%f3,	%f12,	%f14
	sllx	%i0,	0x0B,	%o4
	addccc	%i7,	%g1,	%i1
	fornot1s	%f7,	%f1,	%f12
	fsrc1	%f0,	%f6
	brlez	%g4,	loop_167
	brz	%l1,	loop_168
	xnor	%l6,	0x0FEA,	%g2
	andn	%g6,	%l3,	%i3
loop_167:
	xnorcc	%g7,	0x1A14,	%o3
loop_168:
	fxors	%f7,	%f15,	%f15
	orn	%l7,	%i4,	%i5
	sub	%o2,	%g3,	%i6
	sll	%l5,	0x18,	%g5
	xorcc	%l0,	%o7,	%i2
	fxors	%f11,	%f0,	%f15
	orcc	%o0,	%l2,	%o1
	bvs,a	%xcc,	loop_169
	fsrc2s	%f14,	%f11
	bvc	%icc,	loop_170
	or	%l4,	%o5,	%o6
loop_169:
	fsrc2	%f6,	%f12
	subc	%i0,	%i7,	%i1
loop_170:
	fmovs	%f14,	%f12
	xnor	%o4,	0x0527,	%l1
	xor	%g1,	0x1FA2,	%g2
	fnegs	%f5,	%f6
	bne,a	loop_171
	ba,pn	%xcc,	loop_172
	srl	%g6,	%l3,	%l6
	bg	loop_173
loop_171:
	bgu,pn	%icc,	loop_174
loop_172:
	or	%i3,	0x184C,	%o3
	or	%g7,	%g4,	%l7
loop_173:
	orncc	%i4,	0x1337,	%o2
loop_174:
	sethi	0x1C74,	%i5
	fandnot2s	%f1,	%f12,	%f0
	xnor	%i6,	0x1855,	%g5
	xorcc	%g3,	0x0CC0,	%l0
	sra	%l5,	%o7,	%l2
	andcc	%i2,	%o0,	%o1
	sethi	0x19F1,	%l4
	xor	%i0,	%o5,	%i1
	fornot1	%f4,	%f12,	%f8
	ble,a	%icc,	loop_175
	fornot1s	%f1,	%f15,	%f2
	xnorcc	%o4,	%i7,	%l1
	fandnot2	%f8,	%f14,	%f6
loop_175:
	and	%g2,	%g6,	%l3
	orncc	%l6,	%o6,	%o3
	and	%g7,	%i3,	%g4
	andn	%l7,	%g1,	%o2
	subcc	%i4,	0x1218,	%g5
	srl	%i6,	0x12,	%i5
	or	%g3,	%l5,	%o7
	bcc,a,pn	%icc,	loop_176
	fxors	%f12,	%f3,	%f2
	fzeros	%f3
	andncc	%l0,	%o0,	%l2
loop_176:
	srlx	%i2,	0x0A,	%o1
	fnegd	%f12,	%f12
	fsrc2s	%f5,	%f9
	addcc	%i0,	0x1C14,	%i1
	subccc	%o4,	0x12D9,	%i7
	xnorcc	%l4,	0x1A2C,	%o5
	sethi	0x1DFA,	%l1
	add	%g6,	%l6,	%g2
	fone	%f6
	or	%l3,	%o6,	%i3
	andn	%o3,	%g4,	%l7
	sllx	%g7,	0x14,	%i4
	orcc	%g1,	0x0ECD,	%g5
	addccc	%i5,	%g3,	%o2
	srl	%o7,	0x04,	%l0
	andcc	%i6,	%l2,	%l5
	and	%i2,	%o1,	%i0
	subccc	%o0,	0x02FD,	%o4
	srlx	%i7,	%o5,	%i1
	orn	%l4,	%l1,	%l6
	fors	%f0,	%f0,	%f12
	orn	%l3,	%o6,	%i3
	faligndata	%f14,	%f0,	%f12
	srl	%g6,	%o3,	%g2
	faligndata	%f12,	%f12,	%f14
	or	%g4,	%i4,	%l7
	orncc	%g5,	0x1974,	%i5
	orn	%g7,	%g1,	%g3
	fandnot1s	%f0,	%f3,	%f6
	orcc	%o7,	0x00C5,	%o2
	andncc	%l0,	%l5,	%i6
	subcc	%o1,	%i0,	%o0
	add	%l2,	0x1D02,	%i2
	bl,pn	%xcc,	loop_177
	sethi	0x00E3,	%o5
	bvc	%icc,	loop_178
	bne,a	%xcc,	loop_179
loop_177:
	fones	%f8
	fnors	%f10,	%f8,	%f1
loop_178:
	fnand	%f6,	%f2,	%f8
loop_179:
	and	%i1,	0x16C5,	%l4
	bpos,pt	%xcc,	loop_180
	sub	%l1,	%o4,	%i7
	andn	%o6,	%l3,	%i3
	add	%o3,	%g6,	%l6
loop_180:
	orn	%g2,	%l7,	%g4
	fxnor	%f6,	%f2,	%f4
	fzeros	%f3
	subc	%g5,	0x04F7,	%g7
	xorcc	%i4,	%i5,	%g3
	fnegd	%f2,	%f10
	orncc	%o7,	0x0B8D,	%o2
	sub	%g1,	%i6,	%l0
	andn	%l5,	%o1,	%i0
	fand	%f2,	%f10,	%f8
	andcc	%i2,	%l2,	%o0
	srax	%l4,	0x0F,	%o5
	add	%o4,	0x0D0D,	%i1
	fsrc2	%f14,	%f4
	bge,pt	%icc,	loop_181
	andncc	%l1,	%o6,	%l3
	addc	%o3,	%g6,	%i3
	sll	%i7,	%g2,	%l6
loop_181:
	xor	%g5,	%g7,	%l7
	sllx	%g4,	%i4,	%o7
	fxnors	%f12,	%f1,	%f4
	fones	%f14
	andncc	%g3,	%g1,	%i6
	fnot2s	%f5,	%f8
	fxors	%f1,	%f7,	%f11
	fsrc2s	%f7,	%f9
	xnorcc	%l0,	0x0A21,	%l5
	fandnot1s	%f3,	%f3,	%f7
	subcc	%i5,	%i0,	%o2
	fnot2	%f2,	%f12
	orcc	%l2,	0x1FBA,	%o1
	fsrc1	%f10,	%f2
	fnegd	%f6,	%f2
	sub	%i2,	0x047B,	%o0
	addc	%l4,	%o4,	%i1
	fone	%f10
	bcc,a,pn	%icc,	loop_182
	srlx	%l1,	0x03,	%l3
	xnor	%o5,	0x1A6A,	%o3
	andcc	%o6,	%i7,	%i3
loop_182:
	orcc	%l6,	0x1814,	%g6
	fandnot1s	%f4,	%f9,	%f2
	fands	%f3,	%f6,	%f0
	bge	loop_183
	add	%g5,	0x095F,	%g2
	subc	%g7,	%g4,	%l7
	sra	%g3,	%i4,	%i6
loop_183:
	fones	%f14
	srax	%l0,	0x0B,	%g1
	addc	%l5,	%i5,	%o2
	bge,a	loop_184
	xnor	%i0,	0x0325,	%l2
	bcs,a	loop_185
	fnot2s	%f3,	%f11
loop_184:
	brgz	%o7,	loop_186
	addc	%o0,	%l4,	%i2
loop_185:
	subcc	%i1,	0x1D69,	%o4
	andcc	%l3,	%o1,	%l1
loop_186:
	and	%o3,	0x0C69,	%i7
	fsrc1	%f2,	%f0
	sra	%o5,	0x14,	%l6
	fmovs	%f5,	%f6
	subcc	%g6,	%i3,	%g2
	fand	%f4,	%f0,	%f4
	fzero	%f6
	brlez,a	%o6,	loop_187
	andn	%g4,	0x17C7,	%l7
	sll	%g7,	%g3,	%g5
	xorcc	%i6,	0x12B0,	%i4
loop_187:
	bpos,a	loop_188
	fabss	%f2,	%f15
	srax	%l5,	%i5,	%l0
	ba,a	loop_189
loop_188:
	xor	%g1,	%l2,	%o2
	fornot2s	%f10,	%f7,	%f0
	addc	%i0,	%l4,	%o0
loop_189:
	sethi	0x0957,	%o7
	srlx	%i1,	%i2,	%o1
	andn	%l3,	0x043A,	%o3
	bge	%icc,	loop_190
	xor	%o4,	0x1C33,	%o5
	sll	%l6,	0x14,	%i7
	xnorcc	%l1,	%i3,	%o6
loop_190:
	fmovs	%f10,	%f15
	sub	%g4,	0x093D,	%g2
	sub	%g7,	0x1564,	%g3
	orncc	%l7,	0x0339,	%g5
	bvs	%xcc,	loop_191
	sub	%g6,	%l5,	%i6
	fxor	%f4,	%f2,	%f0
	fabsd	%f10,	%f2
loop_191:
	brlez,a	%l0,	loop_192
	subcc	%g1,	%l2,	%o2
	andcc	%i5,	0x0271,	%i0
	fnand	%f12,	%f8,	%f8
loop_192:
	brlz,a	%i4,	loop_193
	srlx	%l4,	0x11,	%o0
	sethi	0x11FF,	%o7
	fandnot2	%f8,	%f10,	%f4
loop_193:
	sra	%i1,	%i2,	%l3
	and	%o3,	0x0069,	%o4
	fmovs	%f10,	%f9
	sub	%o1,	%i7,	%l6
	subcc	%o5,	0x182F,	%l1
	fsrc2	%f0,	%f8
	srax	%g4,	%o6,	%g7
	add	%g3,	0x0FC1,	%i3
	brlz,a	%g2,	loop_194
	fnand	%f4,	%f2,	%f2
	sll	%g5,	%l7,	%i6
	andn	%l0,	0x1FFC,	%g1
loop_194:
	subcc	%l2,	0x0DBE,	%g6
	bleu,pn	%icc,	loop_195
	and	%l5,	%i5,	%o2
	sub	%l4,	0x04B8,	%o0
	fand	%f6,	%f2,	%f14
loop_195:
	fmovd	%f14,	%f8
	andn	%i0,	0x174F,	%i1
	addccc	%i4,	%l3,	%i2
	subccc	%o3,	%o7,	%i7
	addccc	%o1,	0x0272,	%o5
	bl,a	%xcc,	loop_196
	fnegs	%f8,	%f15
	fornot2	%f2,	%f4,	%f14
	fzeros	%f13
loop_196:
	brz	%l6,	loop_197
	addc	%g4,	%o6,	%o4
	addc	%l1,	0x1C1F,	%g3
	andcc	%g7,	0x0EFA,	%g5
loop_197:
	fornot2	%f0,	%f4,	%f10
	sethi	0x13FB,	%g2
	sll	%i3,	%i6,	%g1
	orn	%l7,	%g6,	%l2
	addccc	%l0,	0x000E,	%l5
	brnz,a	%l4,	loop_198
	fnand	%f4,	%f12,	%f6
	srl	%o0,	%i5,	%o2
	sllx	%i4,	%i1,	%i0
loop_198:
	xor	%l3,	0x0466,	%i2
	subc	%o3,	0x0918,	%o7
	sra	%i7,	%o1,	%o5
	sllx	%o6,	0x15,	%o4
	fandnot1s	%f4,	%f8,	%f13
	bpos,a,pn	%xcc,	loop_199
	sllx	%l6,	0x01,	%l1
	subc	%g4,	%g3,	%g2
	xnorcc	%i3,	%g7,	%g1
loop_199:
	orncc	%g5,	0x09E3,	%g6
	xnorcc	%i6,	%l0,	%l5
	xnorcc	%l7,	0x08D6,	%o0
	sethi	0x1059,	%i5
	andn	%o2,	%i4,	%i1
	xnor	%l4,	0x18BB,	%l2
	fnot2s	%f5,	%f14
	brlez	%l3,	loop_200
	sra	%i0,	0x0D,	%o7
	fnor	%f14,	%f14,	%f0
	sethi	0x138F,	%o3
loop_200:
	fnot2	%f6,	%f10
	andcc	%i2,	%o5,	%i7
	srl	%o4,	%o1,	%o6
	bg,a,pn	%xcc,	loop_201
	bg,a	loop_202
	andncc	%g4,	%l1,	%l6
	andcc	%g3,	%i3,	%g7
loop_201:
	srax	%g2,	0x1D,	%g5
loop_202:
	fxnor	%f12,	%f6,	%f0
	bn,a	loop_203
	subccc	%g1,	0x1304,	%g6
	andcc	%l0,	0x16F9,	%l5
	xorcc	%i6,	0x06C8,	%i5
loop_203:
	subcc	%o0,	%l7,	%o2
	fsrc1s	%f7,	%f7
	sub	%i1,	0x00D6,	%l2
	subccc	%l4,	%l3,	%i4
	andn	%i0,	0x155C,	%o7
	addc	%o5,	0x1D7E,	%o3
	orn	%i2,	0x1B9E,	%o1
	subcc	%o4,	%o6,	%l1
	fand	%f14,	%f12,	%f12
	xorcc	%g4,	%i7,	%g3
	sub	%i3,	0x0C46,	%g7
	sethi	0x0E61,	%g5
	xor	%g2,	0x0C0B,	%l6
	fnand	%f2,	%f14,	%f6
	xor	%g1,	0x004A,	%l5
	fabss	%f1,	%f9
	and	%i6,	%g6,	%o0
	addc	%i5,	0x07EF,	%o2
	sllx	%l7,	0x1F,	%l2
	sra	%l0,	0x1F,	%l3
	addccc	%i4,	%l4,	%i1
	orcc	%o7,	%o3,	%i0
	xor	%o5,	0x152D,	%i2
	bne	%icc,	loop_204
	srl	%o1,	0x1C,	%o6
	addc	%o4,	0x0815,	%l1
	srlx	%g4,	%i7,	%g3
loop_204:
	subccc	%g7,	%g5,	%g2
	sethi	0x1210,	%l6
	andncc	%i3,	%l5,	%g6
	addcc	%g1,	0x0947,	%i6
	fandnot2s	%f15,	%f8,	%f9
	fnegd	%f8,	%f4
	addcc	%i5,	0x1847,	%o0
	bne,pn	%xcc,	loop_205
	sra	%l2,	0x15,	%l7
	sethi	0x0F59,	%l0
	bcs,a,pt	%xcc,	loop_206
loop_205:
	sethi	0x1D5D,	%o2
	srax	%l3,	0x0F,	%i1
	for	%f12,	%f4,	%f0
loop_206:
	srlx	%o7,	%o3,	%i0
	subcc	%l4,	0x14ED,	%i4
	subcc	%o5,	%o1,	%i2
	fmovd	%f2,	%f10
	fxors	%f14,	%f6,	%f2
	for	%f8,	%f10,	%f12
	xor	%o4,	0x0F4A,	%o6
	srlx	%g4,	%i7,	%l1
	xnorcc	%g3,	%g5,	%l6
	andn	%g2,	0x1979,	%l5
	fnors	%f10,	%f4,	%f6
	fandnot2	%f8,	%f12,	%f0
	andcc	%i3,	0x00D4,	%g1
	fsrc1	%f10,	%f10
	fand	%f2,	%f2,	%f0
	xnorcc	%g6,	0x0EDB,	%i5
	orcc	%g7,	0x1A0A,	%o0
	brlz,a	%l2,	loop_207
	fnot1s	%f0,	%f10
	bcc	%xcc,	loop_208
	fnot2	%f4,	%f2
loop_207:
	fone	%f6
	addcc	%l0,	0x0D27,	%o2
loop_208:
	for	%f10,	%f8,	%f10
	and	%l7,	0x0DF3,	%i6
	bgu	%icc,	loop_209
	orn	%l3,	0x04E6,	%o7
	for	%f8,	%f4,	%f8
	subccc	%o3,	%i0,	%l4
loop_209:
	sra	%i4,	0x15,	%o1
	orn	%o5,	%i2,	%o4
	fandnot1s	%f3,	%f9,	%f10
	andn	%i1,	%g4,	%i7
	bgu	loop_210
	addc	%l1,	0x037D,	%o6
	orcc	%g3,	0x1203,	%l6
	addcc	%g5,	%l5,	%g1
loop_210:
	sll	%g6,	%g2,	%i5
	fsrc1s	%f5,	%f12
	fandnot1	%f12,	%f6,	%f10
	orcc	%g7,	%l2,	%o0
	andn	%l0,	%l7,	%i6
	subcc	%o2,	%l3,	%i3
	fandnot2s	%f4,	%f9,	%f7
	xor	%o7,	%l4,	%o3
	bneg,pt	%icc,	loop_211
	fzero	%f2
	sllx	%i0,	%o1,	%i2
	sll	%o4,	0x10,	%i4
loop_211:
	bleu,pt	%xcc,	loop_212
	orcc	%g4,	%o5,	%l1
	brlez,a	%o6,	loop_213
	add	%g3,	%l6,	%i7
loop_212:
	fsrc2s	%f5,	%f6
	addc	%l5,	0x13FE,	%g5
loop_213:
	xor	%g6,	0x02BE,	%i1
	srax	%g2,	%g7,	%i5
	bn,a	loop_214
	xnorcc	%l2,	%g1,	%o0
	sra	%l0,	%o2,	%l7
	fandnot1s	%f0,	%f13,	%f9
loop_214:
	bneg,pt	%xcc,	loop_215
	bn,a,pn	%xcc,	loop_216
	or	%l3,	%o7,	%i6
	fabsd	%f10,	%f14
loop_215:
	xorcc	%o3,	0x1118,	%i3
loop_216:
	subccc	%i0,	0x1AC1,	%o1
	add	%i2,	%l4,	%g4
	sll	%o4,	0x03,	%o5
	brnz,a	%o6,	loop_217
	be	%icc,	loop_218
	sll	%g3,	0x09,	%i4
	andncc	%l1,	%l6,	%g5
loop_217:
	sub	%l5,	%g6,	%i1
loop_218:
	fzeros	%f15
	orncc	%i7,	0x1614,	%g2
	fabss	%f8,	%f8
	xorcc	%g7,	0x1A61,	%l2
	xor	%o0,	0x1F16,	%l0
	subccc	%o2,	%l7,	%i5
	sethi	0x0FF4,	%o7
	fsrc1s	%f8,	%f6
	sra	%i6,	%g1,	%l3
	brgez,a	%i0,	loop_219
	orn	%o3,	0x0380,	%o1
	brz,a	%l4,	loop_220
	fxnors	%f8,	%f12,	%f0
loop_219:
	brgez	%i2,	loop_221
	bleu,a,pt	%xcc,	loop_222
loop_220:
	subc	%i3,	0x1F08,	%g4
	or	%o6,	%g3,	%o5
loop_221:
	sllx	%l1,	0x0A,	%i4
loop_222:
	srl	%o4,	%l5,	%g6
	fandnot1	%f4,	%f14,	%f12
	fornot2s	%f8,	%f5,	%f12
	bleu	%xcc,	loop_223
	andcc	%g5,	%i7,	%i1
	fornot2	%f6,	%f10,	%f6
	sllx	%l6,	0x0A,	%l2
loop_223:
	sllx	%g7,	0x16,	%o0
	fnot1	%f10,	%f0
	fornot1	%f10,	%f6,	%f4
	fone	%f8
	xnor	%g2,	%o2,	%l7
	and	%i5,	0x104F,	%l0
	and	%i6,	0x1DE2,	%l3
	xnorcc	%o7,	0x1B0A,	%g1
	add	%o1,	0x0125,	%i0
	sllx	%l4,	0x17,	%o3
	brgz,a	%i2,	loop_224
	srl	%o6,	0x1B,	%g3
	srax	%o5,	0x1D,	%g4
	andn	%i4,	%i3,	%l5
loop_224:
	sllx	%g6,	0x09,	%o4
	fmovs	%f8,	%f12
	sub	%l1,	%g5,	%l6
	xorcc	%i1,	0x12D0,	%i7
	orcc	%o0,	0x1475,	%g7
	srax	%g2,	%l7,	%o2
	and	%i5,	%l2,	%l3
	subc	%i6,	%o7,	%l0
	bne,a	%xcc,	loop_225
	subc	%g1,	%l4,	%o1
	fxors	%f11,	%f11,	%f4
	fnegd	%f12,	%f12
loop_225:
	be,pn	%xcc,	loop_226
	brnz	%i2,	loop_227
	sra	%i0,	%g3,	%o6
	bl	loop_228
loop_226:
	be,a	loop_229
loop_227:
	fornot2s	%f8,	%f7,	%f1
	xorcc	%g4,	0x165A,	%o5
loop_228:
	orn	%i3,	0x140D,	%l5
loop_229:
	addcc	%o3,	0x0891,	%o4
	bg,pt	%xcc,	loop_230
	addccc	%g6,	0x0373,	%l1
	bneg,pn	%icc,	loop_231
	srax	%g5,	0x13,	%l6
loop_230:
	subccc	%i7,	%o0,	%i4
	xorcc	%g2,	%g7,	%i1
loop_231:
	sll	%o2,	0x0E,	%i5
	addcc	%l3,	0x0EFD,	%i6
	brnz	%l2,	loop_232
	or	%l0,	0x0106,	%l7
	fornot1s	%f2,	%f10,	%f14
	srlx	%g1,	%l4,	%o1
loop_232:
	fabss	%f8,	%f7
	ba,a	%icc,	loop_233
	srl	%i2,	0x03,	%i0
	sllx	%o6,	0x18,	%g3
	xnorcc	%o7,	%i3,	%o5
loop_233:
	fandnot2	%f2,	%f6,	%f10
	brz	%g4,	loop_234
	orcc	%l5,	%o3,	%g6
	orn	%g5,	0x0D09,	%o4
	brnz	%l6,	loop_235
loop_234:
	srl	%o0,	0x16,	%l1
	orncc	%i4,	%i7,	%g2
	orn	%i1,	%g7,	%l3
loop_235:
	addcc	%i5,	0x0184,	%i6
	orcc	%l0,	%o2,	%l2
	andcc	%l7,	%g1,	%o1
	srax	%i0,	%i2,	%o6
	bg	loop_236
	ba,a	loop_237
	xor	%g3,	0x1E13,	%o7
	and	%i3,	%o5,	%l5
loop_236:
	subcc	%l4,	0x00A1,	%o3
loop_237:
	bleu,a	loop_238
	andncc	%g6,	%g4,	%l6
	srax	%g5,	%o0,	%i4
	sll	%l1,	0x00,	%g2
loop_238:
	subc	%o4,	%g7,	%l3
	subcc	%i1,	0x12AC,	%i7
	sub	%i5,	%l0,	%o2
	addccc	%i6,	%l2,	%g1
	sra	%o1,	0x0A,	%i0
	srlx	%o6,	%l7,	%i2
	fnot1s	%f4,	%f3
	addc	%g3,	%o7,	%i3
	bge,pt	%xcc,	loop_239
	subccc	%o5,	%l5,	%o3
	or	%g6,	%g4,	%l4
	addccc	%l6,	%o0,	%i4
loop_239:
	srlx	%g2,	%o4,	%g7
	andcc	%l1,	0x12F2,	%i1
	addc	%i7,	%g5,	%l3
	orn	%o2,	%i5,	%i6
	fandnot1s	%f12,	%f13,	%f14
	sra	%g1,	0x0C,	%o1
	andcc	%l2,	0x0A3D,	%o6
	addccc	%i0,	%l0,	%g3
	orcc	%o7,	%i3,	%i2
	fnot2s	%f5,	%f9
	bvs,a	%xcc,	loop_240
	fornot1	%f0,	%f12,	%f12
	bgu	%xcc,	loop_241
	bl,a	%xcc,	loop_242
loop_240:
	xnorcc	%l5,	%l7,	%o5
	fandnot2	%f14,	%f4,	%f14
loop_241:
	subcc	%g4,	0x1C78,	%o3
loop_242:
	fabsd	%f4,	%f14
	orncc	%g6,	0x07A3,	%o0
	orn	%l6,	%i4,	%l4
	sra	%o4,	%l1,	%i1
	sll	%g7,	0x0D,	%g2
	xor	%g5,	0x0D5C,	%l3
	or	%i7,	%i5,	%o2
	orcc	%o1,	%g1,	%i6
	bn,pn	%icc,	loop_243
	orcc	%o6,	0x0CFE,	%i0
	addc	%g3,	%l0,	%o7
	xor	%i2,	0x05DD,	%l5
loop_243:
	srl	%l7,	%l2,	%o5
	fnegd	%f4,	%f2
	fabss	%f1,	%f14
	fandnot2s	%f12,	%f5,	%f6
	bleu,a	%xcc,	loop_244
	xorcc	%g4,	%o3,	%o0
	andcc	%i3,	%g6,	%i4
	bn,pn	%icc,	loop_245
loop_244:
	subc	%l4,	0x1E4D,	%o4
	bcc,a	loop_246
	sethi	0x16D3,	%l6
loop_245:
	orn	%i1,	0x03CB,	%g7
	fnot2	%f14,	%f10
loop_246:
	fsrc2	%f8,	%f12
	subcc	%g2,	%g5,	%l1
	add	%i7,	%i5,	%l3
	addccc	%o1,	0x0206,	%i6
	sllx	%o2,	0x16,	%o6
	orncc	%i0,	%g3,	%g1
	fands	%f5,	%f3,	%f11
	bgu,pn	%xcc,	loop_247
	orn	%l0,	0x188E,	%o7
	andcc	%l7,	0x1DE5,	%l2
	bne,a	loop_248
loop_247:
	andn	%i2,	%l5,	%g4
	fnor	%f14,	%f10,	%f6
	fandnot2	%f2,	%f0,	%f4
loop_248:
	brgez	%o5,	loop_249
	or	%o0,	0x1CFB,	%o3
	ba,a,pt	%icc,	loop_250
	add	%i3,	0x06BF,	%g6
loop_249:
	fsrc2	%f14,	%f14
	sub	%l4,	0x1995,	%l6
loop_250:
	fnands	%f3,	%f0,	%f13
	sll	%i4,	0x03,	%i1
	subc	%o4,	0x024F,	%g2
	subcc	%g7,	%g5,	%l1
	subccc	%i7,	0x0806,	%i5
	and	%o1,	0x0204,	%o2
	andncc	%l3,	%o6,	%i6
	addccc	%i0,	%l0,	%g1
	srl	%o7,	0x0F,	%g3
	fnors	%f3,	%f5,	%f14
	xor	%l2,	%l7,	%i2
	and	%l5,	%o5,	%g4
	orn	%o3,	%o0,	%i3
	subccc	%l6,	0x077E,	%i4
	bn,a	%icc,	loop_251
	sethi	0x1987,	%i1
	subc	%g6,	0x1F17,	%l4
	subcc	%g2,	%g7,	%g5
loop_251:
	or	%o4,	0x1BD4,	%i5
	bgu,pt	%xcc,	loop_252
	addcc	%i7,	%o2,	%l3
	and	%o6,	%o1,	%i6
	orcc	%i0,	0x1170,	%l1
loop_252:
	and	%l0,	%o7,	%g3
	andcc	%l2,	%i2,	%g1
	andncc	%l5,	%g4,	%l7
	xorcc	%o3,	%o5,	%i3
	fnors	%f1,	%f14,	%f6
	fnot1s	%f6,	%f1
	fnegs	%f14,	%f7
	orncc	%i4,	%l6,	%o0
	orncc	%i1,	%g2,	%g7
	fsrc2	%f12,	%f10
	fxors	%f10,	%f12,	%f5
	andncc	%g6,	%g5,	%i5
	fandnot1s	%f3,	%f6,	%f6
	srl	%l4,	0x09,	%i7
	xnor	%o2,	%l3,	%o1
	fandnot1	%f10,	%f0,	%f4
	xor	%o4,	%o6,	%l1
	subcc	%i0,	0x056E,	%i6
	xorcc	%o7,	0x0110,	%l2
	addcc	%l0,	%i2,	%g1
	xor	%g3,	%g4,	%l7
	or	%o3,	0x1CF1,	%l5
	addcc	%i4,	0x1EF9,	%l6
	bcc,a	loop_253
	andcc	%o0,	0x0CE0,	%i3
	orn	%i1,	0x0DE5,	%o5
	ble,a	loop_254
loop_253:
	sll	%g2,	%g7,	%g6
	srlx	%g5,	0x13,	%l4
	fxor	%f8,	%f0,	%f4
loop_254:
	sub	%i5,	%o2,	%i7
	bgu,a,pn	%xcc,	loop_255
	xnor	%o1,	%o4,	%l3
	addccc	%i0,	0x11A1,	%l1
	brgez	%o7,	loop_256
loop_255:
	subccc	%o6,	%l2,	%l0
	sub	%i6,	0x0CEB,	%g1
	subc	%g4,	0x041E,	%l7
loop_256:
	and	%g3,	%i2,	%i4
	bl,pn	%icc,	loop_257
	subccc	%l6,	%l5,	%i3
	addccc	%i1,	0x1511,	%o3
	fsrc1s	%f0,	%f9
loop_257:
	fabss	%f15,	%f4
	sll	%o0,	0x1B,	%o5
	fxnor	%f14,	%f0,	%f0
	bgu,a,pt	%xcc,	loop_258
	ble,a	loop_259
	ba	loop_260
	xorcc	%g2,	%g5,	%g7
loop_258:
	sllx	%l4,	0x19,	%i5
loop_259:
	andcc	%i7,	0x0F7B,	%o1
loop_260:
	andncc	%o4,	%l3,	%i0
	be	%xcc,	loop_261
	xorcc	%l1,	0x10F1,	%o2
	fxnor	%f8,	%f12,	%f2
	sub	%g6,	%o6,	%o7
loop_261:
	bvc,a	%xcc,	loop_262
	subcc	%l2,	%g1,	%i6
	andn	%g4,	%l7,	%l0
	fandnot1s	%f13,	%f0,	%f5
loop_262:
	subc	%i4,	%i2,	%l6
	fnegs	%f13,	%f15
	srlx	%l5,	0x03,	%g3
	fandnot2s	%f0,	%f8,	%f14
	sllx	%i3,	%i1,	%o3
	or	%g2,	%o0,	%o5
	fsrc1	%f0,	%f8
	orcc	%g7,	0x17AC,	%g5
	bl,a,pt	%xcc,	loop_263
	srax	%i7,	0x09,	%i5
	orn	%l4,	%o1,	%o4
	and	%l3,	0x194F,	%l1
loop_263:
	srlx	%i0,	%o2,	%o6
	fxnor	%f2,	%f12,	%f10
	bpos	loop_264
	fsrc1s	%f4,	%f3
	addc	%g6,	%l2,	%g1
	orcc	%o7,	%g4,	%l7
loop_264:
	bn,a,pt	%xcc,	loop_265
	addc	%i6,	%l0,	%i4
	subcc	%i2,	0x022A,	%l6
	andn	%g3,	0x1166,	%i1
loop_265:
	bl,pn	%icc,	loop_266
	srlx	%l5,	0x08,	%o3
	brz,a	%g2,	loop_267
	xorcc	%o0,	0x031F,	%i3
loop_266:
	fmovs	%f10,	%f0
	fnot2	%f4,	%f10
loop_267:
	orcc	%g5,	%i7,	%i5
	fandnot1	%f4,	%f4,	%f0
	fandnot1s	%f5,	%f3,	%f7
	sub	%l4,	0x1ABC,	%o5
	orcc	%o4,	%l3,	%g7
	addc	%i0,	0x02E4,	%o2
	bleu,a	%xcc,	loop_268
	srl	%o1,	%o6,	%l2
	fandnot1	%f6,	%f8,	%f10
	xnor	%g6,	0x1EDC,	%o7
loop_268:
	srax	%g1,	0x0A,	%g4
	xnorcc	%l1,	0x165C,	%l7
	add	%i6,	%l0,	%i2
	fnegd	%f8,	%f0
	andcc	%l6,	0x1DD0,	%i4
	sra	%l5,	0x03,	%i1
	brlez,a	%o3,	loop_269
	andncc	%g3,	%o0,	%i3
	fnot2s	%f15,	%f0
	fands	%f5,	%f10,	%f10
loop_269:
	subc	%i7,	%g2,	%l4
	bne,pt	%icc,	loop_270
	orcc	%i5,	%o5,	%g5
	addccc	%o4,	%i0,	%l3
	fsrc2	%f12,	%f8
loop_270:
	bge	loop_271
	sub	%o2,	%g7,	%l2
	brnz,a	%o1,	loop_272
	fnegd	%f2,	%f6
loop_271:
	fandnot2s	%f4,	%f8,	%f3
	xnor	%o7,	0x1E17,	%o6
loop_272:
	and	%g4,	0x15D8,	%l1
	fnands	%f13,	%f1,	%f8
	fabsd	%f12,	%f10
	xor	%g1,	0x0454,	%i6
	subcc	%l7,	%i2,	%l0
	subc	%i4,	0x0F29,	%l6
	srax	%i1,	%o3,	%g6
	addccc	%l5,	%g3,	%i3
	ba,a	loop_273
	sethi	0x11F7,	%o0
	fandnot2s	%f6,	%f2,	%f0
	and	%i7,	0x05D0,	%i5
loop_273:
	sub	%l4,	0x18F2,	%g5
	fnot1	%f0,	%f0
	ba,a,pt	%icc,	loop_274
	brlz	%o5,	loop_275
	sra	%o4,	%l3,	%g2
	or	%g7,	0x0CFD,	%i0
loop_274:
	srax	%l2,	0x05,	%o1
loop_275:
	bcc	loop_276
	fands	%f14,	%f12,	%f4
	fone	%f0
	sub	%o7,	0x04C3,	%g4
loop_276:
	andncc	%o6,	%g1,	%i6
	fnegd	%f12,	%f0
	sethi	0x145C,	%o2
	brlz,a	%l7,	loop_277
	sub	%l0,	%i2,	%l1
	srax	%i4,	0x14,	%i1
	orn	%o3,	0x0C39,	%l5
loop_277:
	bgu,pn	%xcc,	loop_278
	or	%g3,	0x1CF6,	%l6
	xor	%i3,	%g6,	%i5
	and	%o0,	0x0A68,	%g5
loop_278:
	fnand	%f10,	%f6,	%f6
	bne	loop_279
	fandnot2s	%f5,	%f9,	%f4
	addcc	%o5,	0x0F52,	%o4
	xnorcc	%l3,	%l4,	%i7
loop_279:
	addcc	%g2,	%g7,	%i0
	sethi	0x118D,	%o1
	sub	%l2,	0x0FB4,	%o6
	orcc	%g4,	0x0584,	%o7
	fsrc2	%f14,	%f8
	subccc	%o2,	0x11FE,	%i6
	addcc	%l0,	0x048C,	%i2
	brz	%l1,	loop_280
	srax	%i4,	%g1,	%o3
	orn	%l5,	0x0B2B,	%g3
	andncc	%i1,	%l6,	%g6
loop_280:
	bcs,pt	%icc,	loop_281
	xnorcc	%l7,	%i5,	%g5
	addcc	%i3,	0x0072,	%o4
	fsrc1	%f12,	%f6
loop_281:
	subccc	%o5,	%l3,	%i7
	fxor	%f2,	%f6,	%f12
	orcc	%l4,	%g2,	%g7
	andcc	%o1,	0x1E0A,	%o0
	sub	%o6,	0x1D2E,	%g4
	fmovs	%f3,	%f6
	sethi	0x1F65,	%l2
	sub	%o2,	0x1885,	%i0
	xnorcc	%o7,	%i6,	%l0
	addccc	%i2,	0x027E,	%l1
	andcc	%o3,	0x029E,	%i4
	subccc	%l5,	0x0BD9,	%g3
	andn	%g1,	0x04B1,	%i1
	fxnor	%f12,	%f10,	%f8
	sra	%g6,	0x07,	%i5
	xnor	%l7,	%i3,	%l6
	fzeros	%f14
	orncc	%o5,	%o4,	%l3
	andcc	%g5,	%i7,	%g7
	sethi	0x1E89,	%l4
	sll	%o0,	0x0D,	%g2
	fzeros	%f9
	and	%g4,	0x128F,	%o6
	subcc	%l2,	%o1,	%o2
	addc	%o7,	0x08F1,	%i6
	bvs	loop_282
	fors	%f11,	%f4,	%f13
	sllx	%i0,	%l1,	%i2
	subccc	%l0,	0x0E52,	%l5
loop_282:
	xnor	%g3,	0x1774,	%g1
	orcc	%i4,	%i1,	%g6
	bpos,a	loop_283
	sll	%l7,	%o3,	%i3
	xnor	%o5,	0x1AB4,	%i5
	andcc	%l6,	0x025B,	%o4
loop_283:
	fnot2s	%f10,	%f3
	add	%g5,	0x1A40,	%i7
	orncc	%l4,	%g7,	%g2
	ba,a,pt	%icc,	loop_284
	subc	%l3,	%g4,	%o6
	bneg	loop_285
	fabsd	%f2,	%f14
loop_284:
	orcc	%l2,	%o0,	%o7
	sethi	0x1B5F,	%o2
loop_285:
	addc	%i0,	0x1151,	%o1
	sub	%i2,	%l0,	%l1
	srlx	%i6,	0x0B,	%g1
	sra	%g3,	%i1,	%g6
	fmovd	%f12,	%f6
	xor	%l5,	0x1848,	%l7
	or	%i3,	0x06C9,	%i4
	bneg,pn	%icc,	loop_286
	addcc	%i5,	0x1BC3,	%o5
	xor	%o3,	%o4,	%i7
	srlx	%l4,	%g5,	%g7
loop_286:
	bvc,pn	%icc,	loop_287
	sub	%l6,	0x0712,	%g4
	ba	%xcc,	loop_288
	and	%g2,	0x1A60,	%o6
loop_287:
	bl,a	loop_289
	subccc	%l2,	%o0,	%o7
loop_288:
	xorcc	%l3,	0x07C7,	%o1
	orncc	%o2,	0x068C,	%i0
loop_289:
	fors	%f5,	%f4,	%f3
	fnegs	%f13,	%f12
	sethi	0x06BF,	%l1
	xnor	%i6,	0x0F74,	%l0
	subcc	%g3,	%i1,	%g1
	srax	%g6,	%l7,	%i2
	xnorcc	%i3,	%i4,	%l5
	brlez	%o3,	loop_290
	orncc	%i5,	%i7,	%o4
	xnor	%g5,	0x078F,	%g7
	sub	%l4,	0x1C27,	%g4
loop_290:
	orncc	%g2,	0x0021,	%l6
	xor	%o6,	%o0,	%o7
	be,a	loop_291
	orcc	%l2,	0x0660,	%l3
	fandnot1	%f10,	%f4,	%f8
	fzero	%f14
loop_291:
	fandnot2s	%f4,	%f3,	%f9
	fors	%f12,	%f7,	%f9
	fsrc2s	%f15,	%f15
	orcc	%o2,	0x1521,	%o1
	fand	%f4,	%f2,	%f6
	bcc,a,pt	%icc,	loop_292
	sra	%l1,	0x01,	%o5
	sll	%l0,	%g3,	%i0
	addc	%i6,	%g6,	%l7
loop_292:
	xorcc	%i2,	%g1,	%i1
	sll	%l5,	0x0A,	%i4
	fzeros	%f7
	fsrc2	%f12,	%f10
	sllx	%i3,	0x06,	%i7
	bneg,a,pt	%icc,	loop_293
	andn	%i5,	0x187D,	%o4
	fxnors	%f14,	%f15,	%f6
	and	%o3,	%g7,	%g4
loop_293:
	bge	loop_294
	addc	%g5,	0x08AA,	%g2
	subccc	%l6,	0x11FB,	%o6
	addc	%o7,	%l4,	%l3
loop_294:
	fnot1	%f4,	%f2
	or	%o0,	0x11E5,	%l2
	subc	%o1,	%l1,	%o5
	fandnot2s	%f13,	%f14,	%f5
	bcc,a	loop_295
	fornot2	%f12,	%f4,	%f12
	and	%o2,	%g3,	%i0
	andncc	%i6,	%g6,	%l7
loop_295:
	sethi	0x066C,	%l0
	xorcc	%i1,	%i2,	%i4
	orn	%l5,	%i7,	%g1
	subc	%i5,	0x1D8A,	%o4
	fors	%f14,	%f3,	%f15
	subccc	%o3,	%g4,	%g5
	bl,a	loop_296
	and	%g2,	0x1F99,	%g7
	add	%l6,	0x09B3,	%o7
	xor	%i3,	%l3,	%o0
loop_296:
	subcc	%o6,	%o1,	%l2
	sethi	0x09E3,	%l4
	bcs,pt	%xcc,	loop_297
	fnot1s	%f15,	%f0
	orn	%l1,	%g3,	%o5
	add	%i6,	%g6,	%o2
loop_297:
	xor	%i0,	%l0,	%i2
	orn	%l7,	%i1,	%i4
	sethi	0x1682,	%i7
	brlez	%g1,	loop_298
	addcc	%o4,	%i5,	%l5
	or	%g4,	%o3,	%g7
	fandnot2	%f6,	%f2,	%f10
loop_298:
	ba,a	%xcc,	loop_299
	fandnot2	%f10,	%f12,	%f14
	addccc	%g2,	%g5,	%l6
	orcc	%o7,	0x1F89,	%i3
loop_299:
	orcc	%o0,	0x00E0,	%l3
	addcc	%o6,	0x0316,	%l4
	bn	loop_300
	xor	%o1,	0x0ADF,	%l2
	subcc	%o5,	%i6,	%g6
	fabss	%f5,	%f1
loop_300:
	andncc	%o2,	%i0,	%l0
	sub	%g3,	%l1,	%i2
	bpos,a	%xcc,	loop_301
	sub	%i4,	%i1,	%g1
	orn	%o4,	0x017E,	%l7
	xnorcc	%i7,	0x04B3,	%i5
loop_301:
	addc	%o3,	%g7,	%l5
	brgez,a	%g2,	loop_302
	fabsd	%f8,	%f10
	andcc	%l6,	%g5,	%g4
	xnor	%i3,	0x06A7,	%l3
loop_302:
	xor	%o0,	%l4,	%o6
	srlx	%o1,	%o7,	%o5
	bvc,a,pn	%icc,	loop_303
	xnorcc	%i6,	%l2,	%o2
	fmovs	%f6,	%f1
	subccc	%l0,	0x1ED2,	%g6
loop_303:
	bpos,a,pn	%xcc,	loop_304
	fnegd	%f2,	%f6
	srax	%g3,	0x08,	%l1
	bvc,a,pn	%xcc,	loop_305
loop_304:
	srl	%i0,	0x06,	%i1
	sethi	0x0D1D,	%i4
	xor	%i2,	%o4,	%i7
loop_305:
	bge,a	loop_306
	xnorcc	%l7,	0x08F4,	%o3
	ble,pt	%xcc,	loop_307
	brlz,a	%g1,	loop_308
loop_306:
	fxor	%f10,	%f12,	%f2
	bcs	%xcc,	loop_309
loop_307:
	or	%g7,	%i5,	%g2
loop_308:
	and	%g5,	%g4,	%i3
	orcc	%l3,	%o0,	%l6
loop_309:
	orcc	%l4,	0x1A64,	%o6
	sllx	%o1,	0x09,	%l5
	or	%i6,	0x1253,	%o5
	srax	%o2,	%l0,	%l2
	fornot2	%f14,	%f10,	%f4
	bneg,a,pt	%xcc,	loop_310
	fand	%f14,	%f14,	%f10
	bne,a	loop_311
	addc	%o7,	0x1046,	%l1
loop_310:
	subc	%g3,	0x091B,	%i1
	fnands	%f3,	%f14,	%f0
loop_311:
	andcc	%i0,	0x17EA,	%g6
	addccc	%i2,	%i4,	%l7
	srlx	%o4,	%o3,	%g7
	xnorcc	%g1,	%i7,	%g2
	fandnot2	%f2,	%f14,	%f12
	subc	%g5,	%i5,	%i3
	fnors	%f3,	%f1,	%f15
	add	%l3,	0x032A,	%o0
	xorcc	%l6,	0x0C89,	%o6
	addc	%g4,	%l5,	%i6
	brnz,a	%l4,	loop_312
	fandnot1s	%f1,	%f2,	%f7
	fxnors	%f2,	%f3,	%f0
	subcc	%o5,	%l0,	%o1
loop_312:
	fzeros	%f0
	fabsd	%f4,	%f0
	sra	%l2,	0x0D,	%o2
	fnot1	%f6,	%f10
	sllx	%g3,	0x14,	%i1
	orcc	%i0,	%o7,	%i2
	sllx	%g6,	%l1,	%l7
	fornot1s	%f1,	%f1,	%f7
	fand	%f12,	%f2,	%f6
	or	%i4,	%o4,	%o3
	bl	loop_313
	xnorcc	%g7,	0x1FAA,	%g1
	addc	%g5,	%i7,	%i5
	and	%i3,	%g2,	%l3
loop_313:
	ble	%icc,	loop_314
	xorcc	%o6,	%g4,	%l6
	fnands	%f11,	%f2,	%f9
	sethi	0x0FAD,	%o0
loop_314:
	orn	%l5,	0x0EA6,	%i6
	fmovd	%f4,	%f8
	fors	%f14,	%f14,	%f14
	bn,a,pn	%xcc,	loop_315
	ble,a	loop_316
	fandnot1	%f0,	%f10,	%f2
	srl	%o5,	0x1C,	%o1
loop_315:
	srl	%l4,	%l0,	%l2
loop_316:
	add	%o2,	0x0996,	%i1
	sub	%g3,	0x0903,	%o7
	ble,a,pn	%icc,	loop_317
	fornot1s	%f10,	%f15,	%f14
	xnor	%i2,	0x1D39,	%i0
	fands	%f12,	%f10,	%f14
loop_317:
	subcc	%l1,	0x03A7,	%i4
	andn	%o4,	%g6,	%l7
	sll	%g1,	%g7,	%o3
	subc	%g5,	0x00AA,	%i3
	sub	%i5,	%i7,	%g2
	and	%g4,	%o6,	%o0
	bneg,a,pn	%xcc,	loop_318
	fornot2s	%f4,	%f13,	%f3
	fands	%f3,	%f12,	%f2
	andn	%l6,	0x1F70,	%i6
loop_318:
	bvc,a	loop_319
	xnorcc	%o5,	%l5,	%o1
	fnot1s	%f14,	%f15
	and	%l0,	%l2,	%l3
loop_319:
	xor	%i1,	0x095A,	%o2
	xnorcc	%l4,	%o7,	%i0
	sub	%l1,	0x019F,	%g3
	orncc	%i2,	0x0038,	%i4
	sra	%o4,	0x06,	%g6
	addc	%g1,	%o3,	%g5
	add	%l7,	0x02BE,	%i3
	srlx	%i7,	%i5,	%g7
	bg,a	loop_320
	addccc	%g2,	%o6,	%o0
	sethi	0x04F1,	%g4
	fornot2	%f10,	%f8,	%f4
loop_320:
	bl,a,pt	%xcc,	loop_321
	xnor	%i6,	%l6,	%o1
	addccc	%l5,	%o5,	%l0
	ble	loop_322
loop_321:
	fors	%f6,	%f10,	%f11
	fornot2	%f14,	%f4,	%f0
	ble,pt	%icc,	loop_323
loop_322:
	or	%i1,	0x19D6,	%l3
	addccc	%l4,	0x032C,	%l2
	add	%i0,	%l1,	%g3
loop_323:
	fandnot1s	%f14,	%f12,	%f8
	addcc	%o2,	0x0DCA,	%i2
	sllx	%o7,	%i4,	%o4
	srlx	%g6,	0x17,	%o3
	sllx	%g1,	0x03,	%l7
	srlx	%g5,	%i7,	%i5
	xnorcc	%g2,	%o6,	%g7
	bl,a,pt	%xcc,	loop_324
	sub	%g4,	0x15FF,	%i3
	fandnot1	%f6,	%f0,	%f0
	andcc	%i6,	0x1019,	%o0
loop_324:
	fsrc1	%f0,	%f14
	addc	%o1,	0x098C,	%o5
	fornot2s	%f1,	%f4,	%f5
	orncc	%l5,	0x0CEC,	%l6
	brlez	%i1,	loop_325
	subccc	%l0,	%l4,	%l3
	fzeros	%f12
	srlx	%l1,	0x1E,	%i0
loop_325:
	sethi	0x1852,	%g3
	fnor	%f6,	%f12,	%f8
	orn	%l2,	0x05D5,	%i2
	brlz,a	%o7,	loop_326
	fand	%f14,	%f4,	%f4
	srl	%i4,	%g6,	%o3
	sra	%g1,	0x1B,	%o4
loop_326:
	subccc	%l7,	0x0E9B,	%o2
	srl	%i7,	%i5,	%g5
	sra	%o6,	%g7,	%g2
	fornot2	%f8,	%f10,	%f0
	sethi	0x0E6F,	%i3
	andn	%o0,	0x1B79,	%g4
	add	%i6,	0x1800,	%o5
	fmovs	%f1,	%f0
	bn,a	loop_327
	sllx	%l5,	%i1,	%l6
	or	%o1,	%l0,	%l3
	fornot1s	%f0,	%f10,	%f11
loop_327:
	addc	%l4,	%l1,	%l2
	ba,pn	%icc,	loop_328
	sllx	%g3,	%o7,	%i4
	brz,a	%g6,	loop_329
	xnorcc	%o3,	0x0254,	%i2
loop_328:
	sra	%o4,	0x0F,	%i0
	xnorcc	%l7,	0x1EC9,	%g1
loop_329:
	fornot1	%f14,	%f8,	%f2
	fxnor	%f14,	%f4,	%f2
	sll	%o2,	0x1D,	%i7
	fxors	%f9,	%f5,	%f14
	andncc	%g5,	%o6,	%g7
	fnegs	%f13,	%f0
	addccc	%i5,	%o0,	%g2
	bcc	%icc,	loop_330
	fandnot1	%f4,	%f14,	%f10
	and	%i6,	%g4,	%l5
	fnor	%f12,	%f14,	%f14
loop_330:
	sub	%i1,	%l6,	%o5
	ba,a	%xcc,	loop_331
	orcc	%l0,	0x1BA8,	%o1
	srax	%i3,	%l1,	%l4
	fsrc2s	%f7,	%f3
loop_331:
	xor	%g3,	0x15BA,	%l3
	xorcc	%l2,	0x093D,	%i4
	and	%o7,	%i2,	%g6
	sll	%o4,	%l7,	%o3
	subccc	%i0,	%g1,	%g5
	addccc	%o6,	0x1E06,	%g7
	orn	%o2,	%i5,	%o0
	fsrc1	%f10,	%f2
	fornot1	%f6,	%f8,	%f6
	subccc	%i7,	0x0788,	%i6
	xorcc	%g2,	%g4,	%l6
	bl,a	%xcc,	loop_332
	subccc	%l5,	0x1870,	%o5
	sllx	%i1,	0x1D,	%i3
	subccc	%l1,	%l0,	%o1
loop_332:
	sra	%g3,	%l3,	%l4
	fandnot2s	%f6,	%f11,	%f8
	subccc	%i4,	%o7,	%l2
	fsrc1	%f6,	%f14
	brnz	%i2,	loop_333
	xor	%o4,	%o3,	%l7
	xnor	%i0,	%g5,	%g6
	addccc	%o6,	%g1,	%o2
loop_333:
	ble,a	loop_334
	addcc	%o0,	0x0125,	%g7
	srl	%i7,	%i6,	%g2
	fornot1s	%f10,	%f11,	%f2
loop_334:
	bleu,pn	%icc,	loop_335
	xnorcc	%l6,	0x1E48,	%i5
	fornot2s	%f8,	%f2,	%f14
	fandnot1s	%f1,	%f11,	%f10
loop_335:
	subccc	%o5,	%g4,	%i3
	andncc	%l5,	%l1,	%o1
	sll	%l0,	%l3,	%g3
	andncc	%i4,	%i1,	%l2
	xor	%o7,	0x100E,	%o4
	orn	%o3,	%i2,	%l7
	orncc	%g5,	0x1795,	%l4
	orncc	%i0,	0x02B0,	%g6
	brgez	%g1,	loop_336
	fnegd	%f14,	%f12
	sra	%o0,	0x12,	%o6
	fabsd	%f6,	%f2
loop_336:
	subc	%i7,	%i6,	%o2
	fnot2s	%f0,	%f9
	bcs,a,pt	%icc,	loop_337
	sllx	%g2,	%g7,	%l6
	sll	%i5,	%o5,	%g4
	orn	%l5,	0x0E1D,	%l1
loop_337:
	fxors	%f6,	%f8,	%f4
	andcc	%o1,	0x12A0,	%i3
	bcc,pt	%icc,	loop_338
	srl	%g3,	0x19,	%i4
	fabsd	%f0,	%f10
	or	%i1,	%l3,	%o7
loop_338:
	sub	%l2,	%o4,	%i2
	ba,pt	%xcc,	loop_339
	xnorcc	%l7,	0x132B,	%g5
	andcc	%l4,	%o3,	%i0
	orn	%l0,	%g1,	%g6
loop_339:
	subc	%o6,	0x1F5D,	%i7
	srax	%i6,	%o0,	%g7
	orcc	%o2,	0x0A1F,	%i5
	sll	%o5,	%l6,	%g2
	sethi	0x1A20,	%l1
	orcc	%l5,	%i3,	%o1
	subccc	%g4,	%i1,	%i4
	srax	%o7,	0x1C,	%g3
	add	%l2,	0x0DC2,	%l3
	andn	%l7,	%o4,	%l4
	addccc	%g5,	%i2,	%l0
	be,a	loop_340
	subc	%g1,	0x1B32,	%i0
	faligndata	%f10,	%f8,	%f10
	sra	%o3,	%g6,	%o6
loop_340:
	andncc	%i7,	%g7,	%o0
	addcc	%o2,	%o5,	%l6
	fxors	%f10,	%f15,	%f0
	and	%i5,	%i6,	%g2
	fsrc1	%f10,	%f10
	fnot2	%f12,	%f4
	sllx	%i3,	0x19,	%o1
	fornot1	%f10,	%f10,	%f14
	ba	loop_341
	subc	%g4,	0x1B76,	%l5
	orcc	%i4,	0x1255,	%i1
	srax	%g3,	0x1F,	%l1
loop_341:
	fxnor	%f2,	%f2,	%f8
	fandnot2	%f8,	%f14,	%f14
	addcc	%o7,	0x02FD,	%l7
	subccc	%o4,	0x03F6,	%l3
	sethi	0x100C,	%l4
	brlz	%g5,	loop_342
	andncc	%i2,	%l0,	%l2
	bpos	loop_343
	and	%i0,	0x0B41,	%g6
loop_342:
	bvc	loop_344
	fornot1	%f0,	%f8,	%f14
loop_343:
	andn	%o6,	0x1C89,	%o3
	fnot1s	%f11,	%f2
loop_344:
	fsrc1	%f10,	%f12
	orcc	%i7,	0x1A39,	%g1
	brgz,a	%o0,	loop_345
	fxors	%f15,	%f12,	%f13
	fmovd	%f8,	%f8
	and	%o5,	0x087C,	%l6
loop_345:
	fxors	%f2,	%f9,	%f13
	xor	%o2,	0x107F,	%g7
	ba,a	loop_346
	add	%i6,	0x0628,	%g2
	fandnot1	%f0,	%f8,	%f14
	xnorcc	%i3,	%g4,	%o1
loop_346:
	orn	%i5,	0x0220,	%i4
	orn	%i1,	0x0BAC,	%l1
	brgz	%g3,	loop_347
	sllx	%l5,	%o4,	%l7
	sra	%l4,	%g5,	%i2
	bcs,pt	%xcc,	loop_348
loop_347:
	subcc	%o7,	%l3,	%l0
	bge,a	loop_349
	fones	%f14
loop_348:
	orn	%g6,	0x046C,	%o6
	fandnot1s	%f8,	%f10,	%f14
loop_349:
	or	%l2,	0x1C71,	%i0
	srlx	%g1,	%o0,	%o3
	add	%i7,	%o5,	%l6
	sllx	%g7,	0x1D,	%i6
	fnot2s	%f5,	%f5
	xnor	%g2,	%i3,	%g4
	xorcc	%o1,	0x1025,	%i5
	andn	%o2,	0x12B5,	%i4
	sllx	%i1,	0x01,	%l1
	subc	%l5,	%o4,	%l4
	bvs,a,pt	%xcc,	loop_350
	fxnors	%f0,	%f12,	%f7
	subc	%l7,	%g5,	%i2
	fors	%f8,	%f11,	%f4
loop_350:
	xnorcc	%g3,	0x1446,	%l3
	sll	%g6,	0x17,	%o6
	fornot2s	%f2,	%f6,	%f3
	srl	%l0,	%i0,	%l2
	fsrc1s	%f6,	%f10
	sethi	0x0710,	%o0
	bpos,a	%icc,	loop_351
	sra	%o3,	%i7,	%g1
	or	%o5,	%g7,	%i6
	bleu,pn	%xcc,	loop_352
loop_351:
	orncc	%g2,	%i3,	%o7
	srlx	%o1,	0x06,	%i5
	fornot1	%f8,	%f6,	%f0
loop_352:
	xnor	%o2,	%i4,	%i1
	xor	%l6,	%l5,	%g4
	fors	%f11,	%f0,	%f0
	bne,pt	%xcc,	loop_353
	add	%l4,	0x10AF,	%o4
	addc	%l1,	%g5,	%g3
	bleu,a,pn	%icc,	loop_354
loop_353:
	xorcc	%l3,	0x00C5,	%i2
	xnorcc	%g6,	0x0550,	%l0
	orn	%o6,	%i0,	%l7
loop_354:
	orn	%o3,	0x08E6,	%o0
	subcc	%i7,	%l2,	%o5
	xorcc	%i6,	0x0334,	%g7
	and	%g2,	0x0874,	%i3
	orn	%g1,	0x1253,	%o1
	sllx	%o7,	0x15,	%i5
	brnz,a	%i1,	loop_355
	srl	%l6,	%o2,	%g4
	sra	%i4,	0x06,	%o4
	bcs,a,pt	%icc,	loop_356
loop_355:
	xnorcc	%l1,	%l4,	%l5
	fzero	%f14
	sll	%g3,	0x00,	%l3
loop_356:
	subcc	%i2,	%g6,	%o6
	fornot2s	%f12,	%f0,	%f8
	and	%i0,	0x1EF3,	%l7
	srlx	%l0,	%g5,	%o3
	andncc	%l2,	%o5,	%i7
	bl,pn	%xcc,	loop_357
	addc	%g7,	0x0454,	%o0
	xorcc	%g2,	%i3,	%i6
	subc	%g1,	0x0492,	%o1
loop_357:
	andcc	%o7,	%i1,	%i5
	andcc	%o2,	0x0FD6,	%l6
	xor	%o4,	%l1,	%g4
	orcc	%i4,	0x07D3,	%g3
	subcc	%l4,	0x0893,	%l5
	or	%g6,	0x1365,	%o6
	add	%l3,	%i0,	%i2
	brgez,a	%l0,	loop_358
	sub	%l7,	%o3,	%g5
	brgz,a	%l2,	loop_359
	bvc,a	loop_360
loop_358:
	add	%g7,	%i7,	%o5
	bne	%icc,	loop_361
loop_359:
	fors	%f10,	%f15,	%f1
loop_360:
	andncc	%o0,	%i3,	%g2
	xor	%o1,	0x0EFC,	%i6
loop_361:
	orncc	%o7,	0x0EBA,	%i1
	xnor	%g1,	%l6,	%i5
	sub	%o4,	%o2,	%i4
	sethi	0x09FA,	%g4
	fors	%f10,	%f12,	%f5
	brgez	%l1,	loop_362
	subcc	%l5,	%g3,	%l4
	subccc	%l3,	0x1EE7,	%o6
	for	%f6,	%f0,	%f0
loop_362:
	sethi	0x1E6E,	%g6
	fornot1	%f2,	%f10,	%f12
	brgz,a	%i0,	loop_363
	addcc	%l7,	%l0,	%i2
	add	%l2,	%g5,	%g7
	xorcc	%o5,	%i7,	%o0
loop_363:
	bge,a	%xcc,	loop_364
	xor	%g2,	0x158B,	%o1
	fzero	%f2
	sll	%o3,	0x10,	%i6
loop_364:
	or	%o7,	0x1D5E,	%i1
	ble,pt	%icc,	loop_365
	brlz	%l6,	loop_366
	and	%g1,	%i3,	%o4
	andcc	%o2,	0x02FE,	%i5
loop_365:
	brlez,a	%g4,	loop_367
loop_366:
	subcc	%i4,	%g3,	%l4
	srl	%l3,	0x03,	%l5
	xorcc	%l1,	0x0B59,	%o6
loop_367:
	fxors	%f11,	%f4,	%f14
	xnorcc	%l7,	0x0DF6,	%l0
	brgz	%i0,	loop_368
	srax	%l2,	0x17,	%g6
	sllx	%g5,	%i2,	%i7
	bcs,a,pn	%icc,	loop_369
loop_368:
	bleu,a,pt	%icc,	loop_370
	for	%f4,	%f6,	%f10
	bn	loop_371
loop_369:
	or	%o5,	0x0350,	%g2
loop_370:
	fnor	%f2,	%f14,	%f4
	subcc	%o1,	%o3,	%o0
loop_371:
	add	%o7,	%i6,	%g7
	subcc	%l6,	%i1,	%g1
	fornot1	%f14,	%f12,	%f0
	sethi	0x0B1F,	%i3
	brnz,a	%i5,	loop_372
	srlx	%o4,	0x07,	%g4
	andcc	%o2,	%i4,	%l4
	for	%f10,	%f4,	%f10
loop_372:
	fors	%f15,	%f15,	%f6
	fxnor	%f0,	%f12,	%f2
	orncc	%l5,	%g3,	%l3
	fone	%f4
	fsrc1s	%f1,	%f14
	xnorcc	%l7,	%o6,	%i0
	addcc	%l0,	0x10DF,	%l1
	fandnot1s	%f12,	%f12,	%f6
	fors	%f15,	%f2,	%f11
	orn	%g6,	%g5,	%i2
	addc	%o5,	%i7,	%g2
	bvc	%xcc,	loop_373
	brlez,a	%o3,	loop_374
	bcc,a	loop_375
	xorcc	%l2,	0x1E64,	%o0
loop_373:
	sub	%i6,	%o7,	%g7
loop_374:
	srax	%l6,	%i1,	%o1
loop_375:
	fandnot1s	%f5,	%f7,	%f12
	srax	%g1,	%o4,	%i3
	orcc	%g4,	%i4,	%o2
	fones	%f11
	add	%i5,	0x13FB,	%l5
	subcc	%l4,	0x1181,	%g3
	sra	%l3,	0x1A,	%l7
	fxor	%f12,	%f4,	%f8
	brz	%o6,	loop_376
	bvs,a,pn	%icc,	loop_377
	add	%l1,	%l0,	%i0
	subc	%g5,	0x12C7,	%g6
loop_376:
	orn	%o5,	%i7,	%i2
loop_377:
	orn	%l2,	%o0,	%g2
	ba,a,pn	%icc,	loop_378
	xorcc	%o7,	%g7,	%o3
	srl	%l6,	0x08,	%i1
	addc	%g1,	0x132D,	%o4
loop_378:
	andn	%o1,	0x044A,	%i3
	fornot2s	%f13,	%f8,	%f14
	srl	%g4,	%i6,	%i4
	or	%i5,	%l5,	%o2
	or	%l3,	0x172F,	%l7
	sra	%l4,	0x0C,	%o6
	xorcc	%g3,	%l0,	%l1
	srax	%g5,	%o5,	%g6
	addccc	%i7,	0x1002,	%i2
	sllx	%i0,	%g2,	%l2
	andcc	%o7,	%g7,	%l6
	bl	loop_379
	addc	%i1,	%o3,	%o4
	xor	%g1,	%i3,	%o0
	srlx	%o1,	0x02,	%i6
loop_379:
	brz	%g4,	loop_380
	fnand	%f10,	%f0,	%f8
	fnot2s	%f7,	%f8
	bvs	loop_381
loop_380:
	fandnot1s	%f4,	%f5,	%f6
	fsrc1	%f0,	%f2
	orcc	%i5,	%i4,	%o2
loop_381:
	addcc	%l5,	%l3,	%o6
	bleu,pn	%xcc,	loop_382
	addcc	%g3,	%l7,	%l4
	andn	%l1,	%l0,	%g6
	xorcc	%g5,	0x1047,	%i7
loop_382:
	orn	%i0,	%g2,	%o5
	srlx	%o7,	0x09,	%g7
	addcc	%l2,	0x1733,	%i1
	fmovs	%f10,	%f6
	for	%f14,	%f12,	%f0
	andn	%l6,	%o4,	%i2
	srax	%o3,	%o0,	%o1
	xor	%g1,	%i3,	%i5
	andncc	%i6,	%i4,	%o2
	sllx	%l3,	0x0D,	%l5
	be,pn	%icc,	loop_383
	srax	%g3,	%l7,	%l4
	or	%o6,	%l0,	%l1
	orn	%g4,	0x121F,	%i7
loop_383:
	xor	%g6,	0x1368,	%i0
	andcc	%g5,	0x0B7B,	%o5
	srax	%o7,	%g2,	%l2
	orn	%g7,	%l6,	%o4
	subcc	%i1,	0x011C,	%i2
	fzeros	%f13
	sra	%o3,	0x1A,	%g1
	srl	%o1,	0x13,	%o0
	orn	%i6,	0x0496,	%i4
	bleu,a,pt	%icc,	loop_384
	xnor	%o2,	%i3,	%l5
	fornot1	%f0,	%f8,	%f10
	bgu,a	loop_385
loop_384:
	sra	%l3,	%i5,	%g3
	brlz,a	%l7,	loop_386
	subc	%l4,	%l1,	%g4
loop_385:
	addcc	%o6,	0x0A6D,	%g6
	andcc	%i0,	%l0,	%i7
loop_386:
	brgz,a	%o5,	loop_387
	bgu,pt	%icc,	loop_388
	brnz,a	%o7,	loop_389
	brnz,a	%g2,	loop_390
loop_387:
	fnor	%f8,	%f8,	%f8
loop_388:
	fmovd	%f12,	%f0
loop_389:
	orncc	%g7,	0x0E88,	%l6
loop_390:
	fone	%f12
	andn	%g5,	%i1,	%l2
	or	%o4,	0x0497,	%o3
	orncc	%i2,	%g1,	%i6
	or	%i4,	%o1,	%o2
	fandnot1s	%f4,	%f4,	%f2
	fxors	%f15,	%f8,	%f10
	fones	%f7
	srl	%o0,	0x07,	%l3
	addccc	%l5,	0x1E7E,	%g3
	orn	%l7,	0x04C4,	%i3
	xorcc	%l4,	0x17B1,	%i5
	fands	%f2,	%f5,	%f12
	subcc	%o6,	%l1,	%g4
	fornot1s	%f14,	%f4,	%f13
	bge,a	%icc,	loop_391
	fxnors	%f8,	%f13,	%f9
	orncc	%i0,	%l0,	%o5
	sra	%i7,	%g2,	%g6
loop_391:
	sllx	%g7,	%g5,	%i1
	sll	%l6,	%o7,	%l2
	subcc	%i2,	0x0A06,	%o4
	addc	%i6,	0x1CE1,	%i4
	bcs,pt	%xcc,	loop_392
	bcc,a,pn	%icc,	loop_393
	or	%o3,	%o1,	%o2
	for	%f4,	%f0,	%f0
loop_392:
	xor	%g1,	0x1D74,	%o0
loop_393:
	andn	%l3,	0x1997,	%l7
	subc	%i3,	%l5,	%l4
	sra	%g3,	0x1B,	%l1
	orn	%i5,	%o6,	%g4
	srlx	%i0,	0x1E,	%i7
	sllx	%l0,	%g6,	%g7
	sethi	0x1F25,	%g5
	subccc	%i1,	%o5,	%o7
	orcc	%l2,	%i2,	%g2
	bneg,pt	%xcc,	loop_394
	fnors	%f1,	%f15,	%f15
	fxnor	%f4,	%f10,	%f12
	sll	%o4,	0x02,	%l6
loop_394:
	fnors	%f8,	%f12,	%f6
	fand	%f0,	%f14,	%f0
	fandnot1	%f0,	%f8,	%f0
	srlx	%o3,	%i6,	%i4
	orn	%o2,	0x007D,	%o1
	be,a	loop_395
	bne,a	loop_396
	bg,pn	%icc,	loop_397
	srax	%o0,	%l7,	%i3
loop_395:
	sllx	%l3,	%l4,	%l5
loop_396:
	fornot1	%f4,	%f8,	%f8
loop_397:
	fnot2s	%f0,	%f15
	bneg,a,pn	%xcc,	loop_398
	bpos	loop_399
	subccc	%l1,	%g1,	%i5
	xorcc	%g3,	0x07D8,	%o6
loop_398:
	srl	%i7,	0x0C,	%g4
loop_399:
	and	%l0,	%g7,	%g6
	bcc,a	loop_400
	and	%g5,	0x0469,	%o5
	faligndata	%f8,	%f12,	%f2
	or	%i1,	0x026B,	%o7
loop_400:
	andncc	%i2,	%i0,	%l2
	addc	%o4,	%l6,	%i6
	sll	%i4,	0x1A,	%g2
	xor	%o1,	%o2,	%o3
	srlx	%i3,	0x19,	%o0
	xnor	%l3,	0x1866,	%l4
	fands	%f3,	%f11,	%f5
	fsrc2	%f14,	%f4
	sra	%l7,	%l5,	%l1
	or	%i5,	0x0398,	%g3
	sra	%o6,	0x1A,	%g4
	and	%i7,	%g1,	%g7
	andncc	%g5,	%g6,	%l0
	srl	%i1,	%o7,	%i2
	sll	%i0,	%l2,	%o4
	srlx	%o5,	0x12,	%i4
	andn	%g2,	0x1711,	%i6
	fzeros	%f5
	brlez,a	%o2,	loop_401
	fones	%f10
	andcc	%l6,	%i3,	%o0
	andn	%o3,	0x0A8C,	%l4
loop_401:
	xnorcc	%l3,	0x11F4,	%l5
	sub	%l7,	0x0FB5,	%l1
	addc	%g3,	%o1,	%o6
	bgu,a,pn	%icc,	loop_402
	orcc	%i7,	0x0BEC,	%g1
	subcc	%i5,	%g4,	%g6
	fzeros	%f5
loop_402:
	andcc	%l0,	0x0EB2,	%g5
	sra	%i1,	0x06,	%o7
	and	%i2,	%l2,	%o4
	sra	%g7,	%i4,	%g2
	fornot2s	%f15,	%f15,	%f12
	sethi	0x0DB0,	%i6
	sub	%o5,	%o2,	%l6
	and	%i3,	%o0,	%o3
	bne	%xcc,	loop_403
	ble	loop_404
	fornot1s	%f5,	%f8,	%f11
	bn,a	loop_405
loop_403:
	fsrc1s	%f7,	%f13
loop_404:
	brz	%l3,	loop_406
	orcc	%l5,	%l7,	%i0
loop_405:
	fzeros	%f0
	add	%g3,	%l4,	%o1
loop_406:
	fornot1s	%f6,	%f10,	%f0
	srlx	%l1,	0x13,	%i7
	andcc	%o6,	%i5,	%g4
	orncc	%l0,	0x0AD9,	%g1
	sra	%i1,	0x0C,	%o7
	fandnot1s	%f11,	%f10,	%f13
	and	%g6,	%l2,	%g5
	srax	%g7,	0x0D,	%i4
	srax	%i2,	%i6,	%o5
	fandnot2s	%f6,	%f6,	%f4
	fzeros	%f0
	and	%g2,	%o4,	%i3
	xorcc	%o2,	%o0,	%l6
	add	%l3,	0x0634,	%l5
	fabsd	%f12,	%f12
	fors	%f11,	%f3,	%f11
	subccc	%o3,	%l7,	%l4
	sethi	0x1FEE,	%g3
	srax	%o1,	0x12,	%i0
	addccc	%l1,	%i5,	%o6
	fors	%f3,	%f4,	%f13
	xorcc	%i7,	%g4,	%g1
	orcc	%i1,	0x147A,	%o7
	xnor	%l2,	%l0,	%g6
	brlez,a	%g5,	loop_407
	fandnot2	%f12,	%f4,	%f0
	ba,a,pn	%xcc,	loop_408
	sub	%i4,	0x1F14,	%i6
loop_407:
	bpos	%xcc,	loop_409
	xnorcc	%o5,	%i2,	%g7
loop_408:
	srl	%o4,	%g2,	%o0
	fones	%f9
loop_409:
	subccc	%o2,	0x073E,	%i3
	sra	%l5,	%o3,	%l7
	sll	%l6,	%l3,	%l4
	fornot1s	%f2,	%f3,	%f4
	fnot2s	%f10,	%f0
	bn,a	%icc,	loop_410
	fandnot1s	%f9,	%f12,	%f12
	xnor	%i0,	0x1F21,	%o1
	sllx	%g3,	%o6,	%l1
loop_410:
	and	%i7,	0x1C97,	%i5
	addc	%g4,	0x1D04,	%o7
	subccc	%g1,	0x1FEB,	%l2
	sub	%i1,	%g5,	%i4
	sllx	%l0,	0x1F,	%g6
	bpos,pn	%icc,	loop_411
	subc	%i2,	0x11A8,	%o5
	fandnot2s	%f3,	%f5,	%f12
	or	%i6,	0x08A2,	%o4
loop_411:
	bvs,a,pn	%xcc,	loop_412
	fors	%f2,	%f13,	%f1
	bge	%xcc,	loop_413
	addcc	%g7,	0x0108,	%o2
loop_412:
	fxnors	%f11,	%f14,	%f15
	bleu,a,pn	%icc,	loop_414
loop_413:
	subcc	%g2,	%l5,	%i3
	xnor	%o0,	0x1D7F,	%l7
	andncc	%o3,	%l3,	%l4
loop_414:
	fzero	%f2
	sra	%o1,	%l6,	%g3
	bcc,a	loop_415
	srax	%l1,	0x12,	%o6
	xor	%i7,	0x1546,	%i0
	addc	%g4,	0x1492,	%g1
loop_415:
	sra	%l2,	%i1,	%g5
	subcc	%i4,	%l0,	%i5
	andncc	%o7,	%o5,	%i2
	for	%f6,	%f10,	%f14
	srlx	%o4,	0x0F,	%g6
	orn	%g7,	0x06CC,	%o2
	fsrc1s	%f4,	%f10
	srlx	%l5,	0x1E,	%i3
	faligndata	%f8,	%f2,	%f0
	subcc	%o0,	0x1472,	%g2
	sra	%l7,	%l3,	%i6
	subcc	%l4,	%o3,	%o1
	subccc	%g3,	0x0BE3,	%l6
	orncc	%i7,	0x13A5,	%l1
	fzeros	%f11
	or	%g4,	0x0430,	%i0
	fsrc2	%f14,	%f8
	brz,a	%l2,	loop_416
	brgez,a	%o6,	loop_417
	andncc	%i1,	%g5,	%i4
	sub	%i5,	0x11EA,	%l0
loop_416:
	addccc	%o7,	%g1,	%o4
loop_417:
	srl	%o5,	%g6,	%i2
	orncc	%g7,	0x08C9,	%o2
	andcc	%i3,	%o0,	%l7
	andncc	%g2,	%l3,	%l4
	addccc	%i6,	%o1,	%g3
	andcc	%l6,	0x18BD,	%i7
	bpos	%icc,	loop_418
	xor	%l1,	%g4,	%i0
	fnand	%f12,	%f8,	%f4
	xnor	%o3,	0x0907,	%l2
loop_418:
	fors	%f8,	%f2,	%f9
	fandnot2s	%f14,	%f2,	%f7
	add	%i1,	%o6,	%i4
	orcc	%g5,	%l5,	%l0
	addccc	%i5,	%g1,	%o5
	srl	%o7,	%g6,	%o4
	and	%o2,	0x1C0F,	%i2
	sethi	0x1D72,	%i3
	addcc	%g7,	%l7,	%g2
	srlx	%l3,	%l4,	%o0
	sra	%i6,	%l6,	%o1
	fones	%f10
	fnor	%f12,	%f6,	%f2
	add	%i7,	%g3,	%g4
	bleu,a	%xcc,	loop_419
	orn	%o3,	0x0470,	%i0
	xorcc	%i1,	%l1,	%o6
	brnz,a	%g5,	loop_420
loop_419:
	sra	%l2,	0x11,	%i4
	srl	%i5,	0x11,	%g1
	brgz,a	%o5,	loop_421
loop_420:
	fandnot1s	%f12,	%f13,	%f8
	addc	%l5,	%o7,	%o4
	andn	%l0,	0x04B5,	%i2
loop_421:
	brgz	%g6,	loop_422
	xnor	%o2,	%g7,	%i3
	andn	%l3,	0x1274,	%g2
	add	%l4,	%i6,	%l6
loop_422:
	xor	%o1,	0x1E22,	%o0
	fornot2	%f6,	%f2,	%f10
	andn	%g3,	0x1FB8,	%i7
	andcc	%l7,	%o3,	%i0
	bne	loop_423
	srlx	%g4,	%o6,	%i1
	fandnot1	%f8,	%f10,	%f0
	fzero	%f12
loop_423:
	xnor	%g5,	0x036E,	%l2
	and	%i4,	0x14A8,	%i5
	andn	%l1,	%o5,	%l5
	addc	%o4,	0x1B8D,	%l0
	orncc	%i2,	0x1F87,	%o7
	ba	%icc,	loop_424
	srax	%g6,	%g1,	%o2
	sub	%g7,	0x152C,	%g2
	fsrc2	%f12,	%f2
loop_424:
	subccc	%l3,	0x101A,	%i6
	or	%l6,	%i3,	%o1
	addcc	%o0,	%l4,	%i7
	srlx	%g3,	0x1D,	%o3
	xnor	%g4,	%i0,	%o6
	xnorcc	%i1,	%l2,	%i4
	addcc	%l7,	%l1,	%g5
	fornot1	%f2,	%f10,	%f0
	fnegs	%f3,	%f11
	add	%i5,	%o4,	%l5
	fnot1	%f2,	%f8
	srlx	%l0,	%o5,	%i2
	bcc,a,pt	%xcc,	loop_425
	or	%g1,	%g6,	%g7
	fsrc2s	%f14,	%f8
	addcc	%g2,	%o7,	%i6
loop_425:
	subcc	%o2,	0x00ED,	%l3
	fabsd	%f4,	%f0
	orncc	%l6,	0x13F2,	%i3
	andcc	%l4,	0x1A41,	%i7
	addc	%o1,	0x0AD4,	%o0
	orn	%g3,	0x03B0,	%g4
	xor	%i0,	%o3,	%o6
	subcc	%l2,	%i1,	%i4
	orncc	%l7,	0x1A63,	%l1
	bn	%icc,	loop_426
	orn	%g5,	%l5,	%i5
	brlez	%o5,	loop_427
	fnot1s	%f4,	%f15
loop_426:
	andcc	%i2,	%o4,	%g1
	fnegd	%f4,	%f6
loop_427:
	andncc	%g7,	%l0,	%o7
	xnor	%g2,	%o2,	%l3
	or	%i6,	0x1750,	%i3
	xorcc	%l6,	0x0DF1,	%i7
	andncc	%g6,	%l4,	%g3
	add	%g4,	%o1,	%i0
	and	%o3,	%o6,	%o0
	bl,pn	%icc,	loop_428
	brgz	%l2,	loop_429
	srax	%l7,	%i4,	%l1
	fnegs	%f13,	%f12
loop_428:
	bneg,a	%icc,	loop_430
loop_429:
	addccc	%l5,	0x010B,	%i1
	subcc	%g5,	%o5,	%i2
	bn,a	%icc,	loop_431
loop_430:
	andcc	%g1,	0x05C5,	%i5
	fsrc2s	%f1,	%f3
	orncc	%l0,	0x0505,	%o4
loop_431:
	bgu,a	loop_432
	addccc	%g2,	%g7,	%l3
	xnor	%o2,	%o7,	%l6
	fnands	%f14,	%f9,	%f5
loop_432:
	subcc	%i7,	0x14D4,	%g6
	bl,pt	%icc,	loop_433
	ble,a	%xcc,	loop_434
	subc	%i3,	%g3,	%l4
	xnorcc	%i6,	%o1,	%o3
loop_433:
	sll	%g4,	0x1D,	%o0
loop_434:
	fsrc1s	%f13,	%f6
	and	%l2,	0x0F51,	%o6
	fnor	%f6,	%f8,	%f14
	xor	%l7,	%i4,	%l5
	fand	%f6,	%f0,	%f10
	fzero	%f4
	fsrc2s	%f1,	%f8
	subccc	%l1,	0x07CF,	%i0
	xnorcc	%o5,	%i1,	%g1
	orn	%i2,	0x095B,	%l0
	fands	%f2,	%f13,	%f6
	xnor	%i5,	0x0123,	%g5
	sra	%g7,	0x01,	%o4
	subcc	%g2,	0x16A0,	%l3
	fnands	%f11,	%f15,	%f1
	andcc	%o7,	0x02B1,	%i7
	or	%o2,	%g6,	%i3
	srlx	%g3,	%l6,	%l4
	or	%o1,	%o3,	%i6
	fors	%f2,	%f7,	%f6
	fnot1s	%f8,	%f6
	subc	%l2,	%o6,	%o0
	subccc	%g4,	0x013E,	%l7
	or	%i4,	%i0,	%l5
	sra	%o5,	0x01,	%g1
	addc	%l1,	%i2,	%i5
	fxnor	%f0,	%f4,	%f2
	fnot1s	%f3,	%f8
	bpos,a	%xcc,	loop_435
	andcc	%g5,	%g7,	%o4
	fnors	%f15,	%f10,	%f13
	addcc	%i1,	0x0DEA,	%l3
loop_435:
	bn,a,pt	%xcc,	loop_436
	fornot1	%f6,	%f2,	%f4
	subccc	%g2,	%l0,	%i7
	xor	%o2,	%o7,	%i3
loop_436:
	sra	%g6,	0x0D,	%g3
	add	%o1,	0x0B78,	%l6
	addc	%i6,	0x1AED,	%l2
	xnor	%o6,	%l4,	%g4
	faligndata	%f8,	%f8,	%f10
	bvc,pn	%icc,	loop_437
	bleu	%xcc,	loop_438
	sub	%o0,	0x0B93,	%o3
	fnands	%f5,	%f7,	%f9
loop_437:
	sub	%i4,	%l5,	%o5
loop_438:
	fandnot1s	%f15,	%f5,	%f12
	sub	%g1,	%i0,	%i2
	sll	%i5,	%l1,	%l7
	xorcc	%o4,	0x15DA,	%g7
	or	%l3,	0x0226,	%i1
	xor	%l0,	0x1834,	%g5
	addc	%g2,	0x1156,	%i7
	subc	%o2,	0x1C37,	%g6
	srax	%o7,	0x02,	%g3
	fnor	%f12,	%f10,	%f0
	fxnor	%f4,	%f2,	%f0
	fornot2s	%f10,	%f8,	%f7
	subc	%l6,	%i3,	%l2
	fandnot2s	%f9,	%f3,	%f14
	orn	%i6,	0x1D58,	%l4
	andcc	%o1,	%o6,	%o0
	orn	%o3,	%g4,	%i4
	andncc	%g1,	%i0,	%o5
	fandnot1	%f8,	%f14,	%f10
	orcc	%i5,	0x00B5,	%l1
	be,pn	%xcc,	loop_439
	bcs,pn	%xcc,	loop_440
	addcc	%i2,	0x1008,	%l5
	orcc	%o4,	%l3,	%l7
loop_439:
	orn	%i1,	0x0C53,	%g5
loop_440:
	bneg,a	loop_441
	fandnot1s	%f8,	%f15,	%f7
	srl	%g7,	%i7,	%l0
	srax	%g6,	%o7,	%g2
loop_441:
	srlx	%o2,	0x01,	%l6
	or	%g3,	%i6,	%i3
	orcc	%l2,	0x0504,	%o1
	subc	%l4,	0x0C55,	%o3
	brlez	%g4,	loop_442
	fones	%f1
	bvs	loop_443
	subcc	%o0,	%g1,	%i4
loop_442:
	xnor	%i0,	%o5,	%l1
	sll	%o6,	0x08,	%l5
loop_443:
	sub	%i2,	%i5,	%l7
	add	%i1,	%g5,	%l3
	fnegs	%f13,	%f2
	fornot1s	%f0,	%f14,	%f5
	sllx	%o4,	0x1B,	%g7
	and	%g6,	0x02EF,	%o7
	bn,a,pn	%xcc,	loop_444
	bcs	loop_445
	srlx	%i7,	0x01,	%l0
	and	%g2,	0x1EE9,	%o2
loop_444:
	addcc	%g3,	%i6,	%l2
loop_445:
	xorcc	%o1,	0x0AD5,	%l6
	subc	%o3,	%g4,	%i3
	fone	%f8
	bne,a,pn	%icc,	loop_446
	sra	%l4,	%o0,	%i0
	xorcc	%i4,	0x1CAC,	%g1
	fzero	%f4
loop_446:
	fnegd	%f0,	%f10
	sra	%o5,	%l5,	%i2
	orn	%l1,	0x0078,	%o6
	xnorcc	%i1,	%l7,	%i5
	xnor	%o4,	0x156C,	%g5
	addcc	%g6,	0x0250,	%g7
	subcc	%i7,	%o7,	%l0
	fnors	%f13,	%f0,	%f7
	bn,a	%xcc,	loop_447
	fmovd	%f4,	%f10
	fsrc1s	%f4,	%f13
	xnor	%o2,	0x12FA,	%g2
loop_447:
	fandnot1	%f10,	%f2,	%f6
	andcc	%i6,	0x0FFB,	%g3
	orcc	%o1,	%l2,	%o3
	xor	%l3,	0x0BB6,	%i3
	add	%l4,	%o0,	%i0
	addccc	%i4,	%g4,	%o5
	fnot1	%f0,	%f14
	bvc,pn	%icc,	loop_448
	sllx	%l5,	0x03,	%i2
	brlz,a	%l6,	loop_449
	and	%l1,	0x1044,	%o6
loop_448:
	and	%g1,	0x009D,	%i5
	sethi	0x1FFC,	%i1
loop_449:
	addcc	%o4,	0x1DA0,	%g6
	fxor	%f6,	%f4,	%f6
	bleu	loop_450
	bpos,pt	%xcc,	loop_451
	fmovs	%f0,	%f10
	xor	%l7,	0x1AB9,	%g7
loop_450:
	fornot1	%f2,	%f10,	%f4
loop_451:
	xnorcc	%i7,	%g5,	%o2
	subc	%g2,	0x0CE3,	%o7
	andncc	%l0,	%o1,	%i6
	brz	%g3,	loop_452
	fnand	%f2,	%f2,	%f4
	orcc	%o3,	%i3,	%l4
	xor	%l3,	0x186B,	%l2
loop_452:
	addccc	%o0,	0x19AC,	%i0
	addccc	%i4,	%o5,	%g4
	srlx	%l6,	%l1,	%o6
	bvs,a	loop_453
	addc	%g1,	0x0DE1,	%l5
	andcc	%i5,	%i2,	%o4
	subccc	%i1,	0x11AF,	%g6
loop_453:
	fnors	%f14,	%f10,	%f6
	xor	%i7,	0x1607,	%l7
	fnor	%f12,	%f4,	%f4
	sll	%o2,	0x18,	%g5
	fxnor	%f12,	%f10,	%f4
	srl	%g2,	%g7,	%l0
	bvs,a	loop_454
	orncc	%o7,	%i6,	%o1
	and	%i3,	%g3,	%o3
	fnot2s	%f8,	%f4
loop_454:
	subcc	%l3,	%o0,	%i0
	or	%i4,	0x1498,	%l4
	andcc	%l2,	0x1397,	%l6
	subc	%g4,	0x1BFC,	%l1
	fsrc2s	%f3,	%f2
	fnot2s	%f4,	%f15
	xnor	%o6,	%l5,	%i5
	fone	%f8
	srlx	%i2,	0x19,	%o4
	sub	%i1,	%g6,	%i7
	sethi	0x1557,	%l7
	or	%o2,	%o5,	%g5
	sra	%g2,	%l0,	%o7
	or	%g7,	%o1,	%i6
	orncc	%i3,	%g3,	%l3
	sra	%o3,	%i0,	%g1
	addcc	%i4,	0x0F5E,	%l2
	sllx	%l4,	0x0E,	%g4
	sra	%o0,	%l1,	%l6
	fors	%f10,	%f6,	%f11
	sethi	0x1728,	%i5
	fands	%f7,	%f4,	%f4
	andn	%o6,	%l5,	%o4
	fnot2	%f8,	%f14
	srlx	%i1,	%g6,	%i2
	orncc	%l7,	%i7,	%g5
	srl	%g2,	0x1D,	%o2
	sethi	0x1B17,	%l0
	bvc	%xcc,	loop_455
	sethi	0x05DB,	%g7
	addc	%o1,	%o5,	%o7
	fsrc1s	%f7,	%f12
loop_455:
	xnorcc	%g3,	0x1492,	%i3
	fnot2	%f12,	%f8
	orncc	%o3,	0x116B,	%l3
	brgz,a	%g1,	loop_456
	brnz	%i4,	loop_457
	fnegs	%f15,	%f7
	sll	%l2,	0x09,	%i6
loop_456:
	addcc	%i0,	0x079F,	%l4
loop_457:
	fnor	%f6,	%f12,	%f14
	xnor	%l1,	%g4,	%i5
	orcc	%o6,	%o0,	%o4
	xnorcc	%l6,	%i1,	%i2
	and	%l7,	%l5,	%g5
	subc	%g2,	0x0AA8,	%o2
	addcc	%l0,	%g6,	%o1
	bge,a,pn	%xcc,	loop_458
	sethi	0x0096,	%i7
	fzeros	%f10
	srlx	%g7,	%o5,	%i3
loop_458:
	xnor	%g3,	%o7,	%g1
	brlez	%i4,	loop_459
	sethi	0x1182,	%l2
	sub	%l3,	0x10B1,	%i0
	sra	%l4,	%i6,	%o3
loop_459:
	xorcc	%l1,	%i5,	%g4
	sll	%o6,	0x1E,	%o4
	xnor	%o0,	%l6,	%i1
	fandnot2	%f2,	%f2,	%f4
	bpos,pn	%xcc,	loop_460
	orn	%l7,	0x04F4,	%g5
	srax	%i2,	0x03,	%l5
	xnorcc	%o2,	%l0,	%g2
loop_460:
	orcc	%o1,	0x0779,	%g6
	fzero	%f8
	xor	%g7,	%i3,	%i7
	fand	%f10,	%f10,	%f14
	and	%g3,	0x0C55,	%g1
	ba,a,pt	%icc,	loop_461
	subc	%o5,	%o7,	%i4
	srl	%l3,	0x07,	%i0
	subccc	%i6,	%o3,	%l2
loop_461:
	addcc	%l4,	%g4,	%o6
	sub	%i5,	%o0,	%l1
	fnot2	%f8,	%f4
	or	%l6,	%i1,	%l7
	for	%f8,	%f8,	%f14
	fornot2s	%f5,	%f2,	%f8
	subccc	%o4,	0x1E9A,	%l5
	xorcc	%i2,	0x16B1,	%o2
	brgez,a	%l0,	loop_462
	addcc	%o1,	0x08BA,	%g2
	srax	%g5,	%i3,	%g7
	xorcc	%g6,	0x1A5B,	%g1
loop_462:
	orcc	%o5,	%o7,	%i4
	fxnors	%f14,	%f11,	%f12
	xor	%l3,	%g3,	%i0
	sethi	0x0C4D,	%i6
	and	%o3,	0x105B,	%i7
	andncc	%g4,	%l4,	%i5
	xnorcc	%o0,	%l1,	%o6
	fornot1s	%f0,	%f13,	%f4
	orn	%i1,	0x11BB,	%l6
	be,a,pt	%xcc,	loop_463
	srax	%l2,	0x16,	%l5
	fmovs	%f8,	%f15
	addccc	%o4,	%l7,	%l0
loop_463:
	sllx	%o2,	0x07,	%o1
	brlz,a	%g5,	loop_464
	fnot2s	%f9,	%f10
	bvc,pt	%xcc,	loop_465
	subccc	%i2,	0x03CD,	%g7
loop_464:
	xnor	%g2,	%i3,	%g1
	fxnors	%f8,	%f9,	%f14
loop_465:
	srax	%o7,	0x1B,	%i4
	andncc	%g6,	%l3,	%i0
	fandnot1	%f12,	%f0,	%f6
	or	%i6,	%g3,	%o5
	fnor	%f8,	%f2,	%f6
	bge,a	%icc,	loop_466
	brgez	%i7,	loop_467
	xorcc	%g4,	%i5,	%o3
	bpos,a,pn	%icc,	loop_468
loop_466:
	sll	%l1,	%l4,	%o6
loop_467:
	addccc	%l6,	%l2,	%l5
	addc	%o4,	0x1353,	%i1
loop_468:
	fsrc2	%f6,	%f4
	sra	%l7,	0x17,	%o2
	brlz	%o0,	loop_469
	fnot1s	%f6,	%f15
	sllx	%g5,	0x0B,	%l0
	or	%g7,	%o1,	%i3
loop_469:
	bgu	%icc,	loop_470
	bg,pn	%xcc,	loop_471
	fandnot2	%f10,	%f10,	%f10
	addc	%i2,	0x1EB1,	%o7
loop_470:
	subcc	%g1,	%g6,	%l3
loop_471:
	sethi	0x13E5,	%i4
	fors	%f8,	%f0,	%f12
	sllx	%i0,	%g3,	%o5
	addccc	%i7,	%i6,	%g2
	sra	%g4,	0x1B,	%l1
	subcc	%l4,	0x0E3B,	%o3
	andcc	%o6,	%i5,	%l2
	fornot2	%f14,	%f14,	%f4
	addc	%l6,	%o4,	%l7
	andcc	%l5,	%o0,	%i1
	sllx	%g5,	0x0C,	%o2
	xnor	%g7,	%l0,	%i2
	sll	%o1,	%g1,	%o7
	andn	%i3,	%i4,	%l3
	fsrc1	%f12,	%f4
	fnegs	%f0,	%f11
	bcc,a	loop_472
	sub	%g6,	%i0,	%g3
	xnor	%o5,	0x1998,	%g2
	andncc	%i7,	%g4,	%l1
loop_472:
	bge,a,pt	%xcc,	loop_473
	subccc	%i6,	%o3,	%l4
	add	%i5,	0x19B1,	%o6
	bvs,a	loop_474
loop_473:
	sra	%l2,	0x08,	%l6
	fsrc2	%f6,	%f8
	fornot2	%f8,	%f10,	%f4
loop_474:
	fsrc2s	%f5,	%f4
	fsrc2	%f4,	%f4
	fandnot1	%f6,	%f0,	%f0
	orn	%o4,	%l5,	%o0
	sra	%i1,	0x05,	%o2
	and	%l7,	0x16E8,	%g7
	srax	%i2,	%g5,	%l0
	fnot1s	%f13,	%f7
	subcc	%o1,	0x037D,	%o7
	addc	%i4,	0x1A91,	%g1
	xnorcc	%i3,	%l3,	%i0
	srl	%g6,	%g2,	%o5
	orn	%g3,	0x112F,	%l1
	sra	%g4,	%i7,	%l4
	sra	%i6,	0x07,	%i5
	sllx	%o3,	%l6,	%o6
	orncc	%l5,	%o0,	%l2
	bl,a,pn	%xcc,	loop_475
	subcc	%o4,	0x1524,	%o2
	fornot2	%f6,	%f14,	%f4
	sllx	%g7,	%i1,	%g5
loop_475:
	xnorcc	%l0,	0x1E15,	%o1
	fnor	%f8,	%f4,	%f4
	sethi	0x0A76,	%o7
	add	%l7,	%g1,	%i2
	addcc	%i4,	%i3,	%g6
	orcc	%l3,	%i0,	%g3
	xnor	%o5,	0x09E0,	%g2
	fornot2	%f6,	%f2,	%f0
	srax	%l1,	0x04,	%l4
	and	%i7,	%g4,	%i5
	bvs,pt	%xcc,	loop_476
	bpos,a	%xcc,	loop_477
	sethi	0x1767,	%o3
	andncc	%i6,	%o6,	%l5
loop_476:
	sll	%o0,	0x17,	%o4
loop_477:
	add	%l6,	%o2,	%i1
	bvc,pn	%xcc,	loop_478
	add	%l2,	%g5,	%o1
	andcc	%g7,	%o7,	%l7
	srax	%g1,	0x01,	%i2
loop_478:
	xnor	%l0,	0x1564,	%i4
	addc	%l3,	0x0D71,	%i3
	fsrc1	%f12,	%f14
	sub	%i0,	%g6,	%o5
	addcc	%l1,	%g2,	%g3
	bgu,pn	%icc,	loop_479
	addc	%l4,	%i7,	%g4
	andcc	%o3,	%o6,	%i6
	fands	%f13,	%f4,	%f11
loop_479:
	andcc	%i5,	0x121F,	%o0
	sethi	0x120F,	%o4
	srl	%l5,	%i1,	%l6
	sra	%l2,	%g5,	%o1
	subc	%o7,	0x046C,	%g7
	and	%g1,	%i2,	%l7
	andcc	%l0,	0x1B97,	%l3
	fone	%f14
	srax	%i3,	0x08,	%i4
	xorcc	%o2,	%i0,	%g6
	fxnors	%f0,	%f9,	%f15
	srax	%o5,	%g2,	%l4
	fones	%f14
	fabsd	%f6,	%f10
	and	%l1,	%i7,	%g3
	subccc	%o3,	%o6,	%i5
	fzeros	%f8
	xnor	%g4,	0x17D0,	%o0
	bn,a	loop_480
	srl	%i6,	0x11,	%o4
	addcc	%i1,	%l5,	%l2
	or	%o1,	%g5,	%o7
loop_480:
	orcc	%g1,	0x01C8,	%g7
	srl	%i2,	%l0,	%l6
	add	%l7,	0x11DF,	%i3
	brgez,a	%o2,	loop_481
	and	%l3,	0x19CC,	%g6
	fnot1	%f2,	%f12
	srlx	%i0,	0x1F,	%g2
loop_481:
	subccc	%i4,	%o5,	%i7
	andcc	%g3,	%l1,	%l4
	subccc	%o3,	0x00B3,	%o6
	fsrc2s	%f4,	%f2
	addcc	%g4,	0x1856,	%i5
	xnorcc	%o4,	%o0,	%l5
	andn	%i1,	%o1,	%g5
	orn	%l2,	%i6,	%o7
	addccc	%i2,	0x07F3,	%l0
	addcc	%g1,	0x14D6,	%g7
	bg	%icc,	loop_482
	add	%l7,	0x1E7C,	%i3
	xnor	%l3,	%g6,	%i0
	be,a	loop_483
loop_482:
	xnorcc	%l6,	0x1324,	%g2
	fmovd	%f10,	%f8
	xnorcc	%o5,	%i7,	%o2
loop_483:
	andcc	%l1,	%i4,	%o3
	xorcc	%l4,	%o6,	%g3
	fones	%f3
	subc	%g4,	0x007B,	%o0
	addccc	%o4,	0x0253,	%i1
	orn	%o1,	%l5,	%i5
	xorcc	%i6,	0x0608,	%g5
	addcc	%o7,	%l0,	%l2
	andncc	%g7,	%i2,	%l7
	fnand	%f10,	%f4,	%f12
	andn	%i3,	0x15A0,	%g6
	fandnot1	%f8,	%f12,	%f14
	sra	%g1,	%l3,	%l6
	andcc	%o5,	%i0,	%g2
	or	%o2,	%l1,	%o3
	orcc	%i7,	0x1DF9,	%i4
	xnor	%o6,	0x02EA,	%g3
	srl	%g4,	0x0B,	%o4
	fandnot1	%f2,	%f0,	%f8
	andn	%i1,	%o0,	%l5
	fands	%f13,	%f12,	%f13
	addccc	%l4,	0x0BE4,	%i5
	srax	%i6,	0x17,	%o1
	bleu,pn	%xcc,	loop_484
	andn	%l0,	0x18F0,	%o7
	brlez	%g7,	loop_485
	fmovd	%f6,	%f12
loop_484:
	sethi	0x09E8,	%i2
	fornot2	%f0,	%f12,	%f14
loop_485:
	sllx	%l2,	%g5,	%g6
	andncc	%g1,	%l3,	%l6
	fornot2	%f4,	%f2,	%f4
	xnor	%i3,	0x19A3,	%l7
	fsrc1	%f6,	%f2
	bne,pt	%icc,	loop_486
	srl	%o5,	0x16,	%i0
	bvc,pt	%icc,	loop_487
	bl,pt	%xcc,	loop_488
loop_486:
	orcc	%o2,	0x048C,	%l1
	fnot2s	%f1,	%f0
loop_487:
	sub	%o3,	0x1034,	%g2
loop_488:
	sllx	%i7,	%i4,	%o6
	fornot2s	%f14,	%f3,	%f12
	orncc	%o4,	%i1,	%g4
	brlz,a	%l5,	loop_489
	bg,pn	%icc,	loop_490
	orncc	%o0,	%g3,	%i5
	andcc	%l4,	%i6,	%o7
loop_489:
	fxnor	%f8,	%f0,	%f14
loop_490:
	faligndata	%f14,	%f8,	%f12
	be	%xcc,	loop_491
	addcc	%o1,	0x1A47,	%i2
	xorcc	%g7,	0x06E6,	%g5
	xnor	%l0,	0x1545,	%l2
loop_491:
	subcc	%g6,	0x05BA,	%l3
	add	%l6,	%i3,	%g1
	srax	%i0,	0x14,	%l7
	subc	%l1,	0x1883,	%o3
	bcs,a	%xcc,	loop_492
	srlx	%g2,	0x16,	%o2
	fxnor	%f6,	%f6,	%f0
	sethi	0x0764,	%i7
loop_492:
	andn	%o5,	0x156F,	%o6
	ba,a,pt	%xcc,	loop_493
	fnegd	%f14,	%f4
	brz	%o4,	loop_494
	andcc	%g4,	%i4,	%i1
loop_493:
	subcc	%g3,	%i5,	%l5
	bge,a,pt	%xcc,	loop_495
loop_494:
	srl	%o0,	0x1A,	%l4
	xnorcc	%i6,	0x0F01,	%o1
	fxnor	%f6,	%f10,	%f10
loop_495:
	brz,a	%i2,	loop_496
	xnor	%g5,	0x0259,	%o7
	xnor	%l0,	0x1619,	%l2
	srlx	%g7,	%l6,	%i3
loop_496:
	fornot2	%f6,	%f14,	%f8
	andn	%g1,	%i0,	%l3
	srax	%g6,	%l7,	%g2
	addcc	%l1,	%o2,	%i7
	fabsd	%f8,	%f10
	ble,pt	%xcc,	loop_497
	addcc	%o3,	0x1659,	%o5
	orn	%o6,	0x0CFD,	%i4
	bcs	loop_498
loop_497:
	sub	%i1,	%g4,	%o4
	addccc	%g3,	0x02B2,	%i5
	fnot1s	%f3,	%f15
loop_498:
	sllx	%o0,	%l4,	%l5
	sll	%i2,	%g5,	%o7
	fors	%f7,	%f12,	%f3
	addccc	%i6,	%o1,	%g7
	orcc	%l6,	%i3,	%g1
	subcc	%i0,	%l3,	%l0
	or	%l7,	0x0688,	%l2
	xorcc	%l1,	0x188D,	%g2
	fone	%f10
	srl	%o2,	%o3,	%o5
	and	%g6,	0x03F0,	%i7
	add	%i4,	%i1,	%o6
	fsrc2	%f0,	%f6
	subc	%g4,	%o4,	%g3
	andn	%i5,	%l5,	%l4
	addc	%o0,	%g5,	%o7
	and	%o1,	0x1BBF,	%i2
	fors	%f7,	%f1,	%f10
	xor	%l6,	0x0B6E,	%i3
	srl	%i6,	%g1,	%l3
	sll	%l0,	0x1D,	%i0
	fnegd	%f14,	%f10
	and	%g7,	%l7,	%g2
	be,a	loop_499
	fandnot1	%f12,	%f6,	%f8
	xnor	%l1,	%o3,	%l2
	or	%o2,	0x087E,	%o5
loop_499:
	orncc	%i7,	%g6,	%i4
	addc	%o6,	%o4,	%g3
	fandnot1	%f4,	%f4,	%f8
	bn	%xcc,	loop_500
	fnegd	%f14,	%f12
	addc	%i5,	%i1,	%l5
	or	%o0,	0x0D3B,	%g5
loop_500:
	andcc	%o7,	%g4,	%l4
	bn,a	%xcc,	loop_501
	andcc	%o1,	0x03BF,	%l6
	subcc	%i2,	%i3,	%i6
	fnor	%f4,	%f10,	%f8
loop_501:
	sub	%l3,	0x1CB1,	%l0
	bn,a,pt	%xcc,	loop_502
	bl,a,pt	%xcc,	loop_503
	bl,a,pt	%icc,	loop_504
	xorcc	%g1,	0x1BD2,	%i0
loop_502:
	addc	%g2,	0x133B,	%l1
loop_503:
	addccc	%l7,	%g7,	%o2
loop_504:
	srl	%o3,	%o5,	%g6
	sllx	%i4,	%o6,	%i7
	orncc	%g3,	%l2,	%i1
	be,a,pt	%xcc,	loop_505
	addc	%l5,	0x1AF7,	%o0
	sllx	%o4,	%o7,	%g4
	xorcc	%g5,	%o1,	%l4
loop_505:
	sll	%i5,	0x05,	%i2
	addccc	%l6,	%i3,	%i6
	fnegs	%f4,	%f13
	xnorcc	%l3,	%i0,	%g1
	orncc	%l0,	%g2,	%g7
	andncc	%l1,	%l7,	%o5
	andn	%o3,	%o2,	%g6
	andncc	%o6,	%i7,	%i4
	sethi	0x1A7E,	%i1
	addccc	%g3,	0x1C17,	%o0
	sethi	0x0362,	%l5
	brz	%o7,	loop_506
	srlx	%l2,	%g5,	%g4
	sllx	%l4,	0x08,	%o4
	bcs,pt	%xcc,	loop_507
loop_506:
	brz	%i2,	loop_508
	fandnot2s	%f9,	%f14,	%f8
	srax	%o1,	0x1F,	%i3
loop_507:
	and	%i6,	0x04FC,	%l3
loop_508:
	subc	%i0,	0x16C0,	%g1
	or	%i5,	0x0764,	%g2
	fxnors	%f9,	%f8,	%f14
	addccc	%l0,	%l6,	%g7
	andn	%l7,	0x09CD,	%l1
	sub	%o2,	%o3,	%o5
	srax	%o6,	0x12,	%g6
	xor	%i1,	%g3,	%i4
	fandnot1	%f6,	%f2,	%f6
	sub	%l5,	0x1A84,	%i7
	sll	%o7,	0x15,	%o0
	orncc	%l2,	%g4,	%g5
	srax	%l4,	%o4,	%o1
	sethi	0x0F22,	%i2
	srlx	%l3,	%i3,	%g1
	fandnot1	%f12,	%f6,	%f0
	orncc	%i0,	0x005C,	%i6
	brlez,a	%g2,	loop_509
	addccc	%l0,	0x0B11,	%g7
	bcc,a,pn	%xcc,	loop_510
	fandnot2s	%f9,	%f3,	%f10
loop_509:
	fors	%f12,	%f11,	%f5
	orcc	%l7,	0x1AA5,	%l1
loop_510:
	sub	%l6,	0x18C4,	%o2
	sll	%o3,	%i5,	%g6
	andcc	%i1,	%g3,	%o5
	addc	%l5,	0x00DB,	%o6
	srl	%i7,	0x13,	%o7
	subccc	%o0,	0x1DDD,	%i4
	sra	%g4,	0x0E,	%l4
	bleu,pt	%xcc,	loop_511
	orn	%o4,	0x1798,	%g5
	andcc	%i2,	0x1680,	%l2
	fornot2	%f2,	%f10,	%f2
loop_511:
	sllx	%l3,	%g1,	%i3
	sub	%i6,	%g2,	%l0
	brlz	%g7,	loop_512
	orncc	%o1,	%i0,	%l1
	bcs,a	%icc,	loop_513
	srlx	%l6,	0x12,	%o2
loop_512:
	srl	%l7,	0x1D,	%g6
	addc	%o3,	0x017B,	%i5
loop_513:
	brlz	%o5,	loop_514
	fnor	%f12,	%f4,	%f12
	andncc	%l5,	%i1,	%o6
	fzero	%f14
loop_514:
	fones	%f10
	sub	%i7,	0x1ECB,	%o7
	fmovd	%f2,	%f8
	fabsd	%f2,	%f0
	add	%i4,	%g4,	%g3
	brlz,a	%o0,	loop_515
	andcc	%o4,	%l4,	%l2
	fnands	%f1,	%f5,	%f15
	xnor	%i2,	0x0A60,	%l3
loop_515:
	srlx	%g1,	%i6,	%g5
	xnor	%i3,	%g7,	%l0
	sll	%o1,	%g2,	%i0
	add	%o2,	0x0351,	%l6
	orcc	%g6,	%o3,	%i5
	brgz,a	%l7,	loop_516
	fornot2s	%f14,	%f2,	%f2
	bcc,pn	%xcc,	loop_517
	orncc	%l5,	0x034E,	%i1
loop_516:
	fnot2	%f0,	%f14
	subc	%l1,	%o6,	%o5
loop_517:
	fzeros	%f8
	or	%i7,	%o7,	%g4
	bpos,a,pt	%icc,	loop_518
	andn	%o0,	%o4,	%g3
	subcc	%l4,	%i4,	%l3
	brlez	%i2,	loop_519
loop_518:
	bl,a	%xcc,	loop_520
	orn	%i6,	%l2,	%g5
	srl	%i3,	0x1F,	%l0
loop_519:
	fnegs	%f14,	%f8
loop_520:
	andn	%g1,	%g7,	%i0
	xnorcc	%o1,	%o2,	%g6
	bn,a	loop_521
	xor	%o3,	%l6,	%l7
	sethi	0x17ED,	%g2
	ble	%xcc,	loop_522
loop_521:
	orncc	%i5,	0x1363,	%l1
	andn	%l5,	%o6,	%i7
	subccc	%i1,	%o7,	%g4
loop_522:
	fnot2	%f14,	%f8
	addc	%o4,	%o0,	%l4
	for	%f12,	%f2,	%f10
	subc	%i4,	0x1F8F,	%g3
	sra	%o5,	0x14,	%i6
	fmovd	%f14,	%f14
	addccc	%l3,	0x14D1,	%g5
	fornot2	%f4,	%f14,	%f12
	addcc	%i2,	%i3,	%l2
	orn	%g1,	%l0,	%g7
	andcc	%o1,	%i0,	%g6
	fnot1s	%f7,	%f7
	fnot2	%f12,	%f14
	xorcc	%o3,	%o2,	%g2
	addcc	%i5,	%l1,	%l7
	or	%l6,	%o6,	%i7
	and	%o7,	0x0B33,	%l5
	subc	%o4,	0x0768,	%o0
	subcc	%i1,	0x08B8,	%l4
	fxor	%f0,	%f14,	%f14
	fones	%f7
	bvs,a,pt	%xcc,	loop_523
	fxor	%f6,	%f6,	%f12
	ble,pt	%icc,	loop_524
	bcs,a	loop_525
loop_523:
	or	%g4,	%i4,	%i6
	subccc	%o5,	0x1E9D,	%l3
loop_524:
	orncc	%g3,	0x1D6B,	%g5
loop_525:
	subcc	%i2,	%l2,	%l0
	xor	%g1,	0x0D9C,	%o1
	fsrc1	%f4,	%f10
	add	%i0,	%g7,	%g6
	sra	%o2,	%i3,	%o3
	xorcc	%i5,	0x1892,	%g2
	or	%l6,	%o6,	%i7
	for	%f2,	%f6,	%f14
	ble,a,pn	%xcc,	loop_526
	fornot2	%f4,	%f2,	%f14
	fandnot1	%f14,	%f6,	%f0
	sllx	%o7,	%l5,	%o4
loop_526:
	srax	%l1,	0x07,	%i1
	bg,a	loop_527
	sll	%o0,	%l7,	%g4
	fxor	%f0,	%f12,	%f12
	fone	%f12
loop_527:
	addc	%i4,	0x029A,	%i6
	orn	%o5,	%l4,	%g3
	subccc	%l3,	%i2,	%l2
	sllx	%g1,	0x1F,	%o1
	orn	%g5,	0x1DAC,	%g7
	srlx	%l0,	0x09,	%g6
	andn	%i3,	0x1700,	%o2
	orcc	%i0,	0x1B47,	%g2
	bcc,a	loop_528
	subcc	%l6,	0x0B40,	%i5
	add	%o6,	%o7,	%i7
	bl,pn	%icc,	loop_529
loop_528:
	addccc	%o4,	%o3,	%i1
	brgez	%l5,	loop_530
	addccc	%o0,	%l7,	%l1
loop_529:
	srl	%i6,	%i4,	%o5
	subc	%g3,	0x1417,	%l3
loop_530:
	fnegd	%f12,	%f6
	sethi	0x1B79,	%l4
	sethi	0x04B7,	%l2
	addccc	%g1,	%g4,	%g5
	brlz	%o1,	loop_531
	bne,a,pt	%icc,	loop_532
	bne,a	%xcc,	loop_533
	fxnor	%f6,	%f6,	%f0
loop_531:
	andcc	%l0,	0x0944,	%i2
loop_532:
	brgez	%g6,	loop_534
loop_533:
	addc	%g7,	%i3,	%i0
	bpos,a,pt	%icc,	loop_535
	sethi	0x0E07,	%g2
loop_534:
	subccc	%i5,	0x14E3,	%l6
	sll	%o2,	%i7,	%o7
loop_535:
	xnor	%o3,	0x0664,	%o4
	bg,a,pt	%xcc,	loop_536
	fornot1s	%f2,	%f12,	%f9
	brgz	%i1,	loop_537
	fsrc1	%f10,	%f8
loop_536:
	subccc	%l5,	0x09C7,	%l7
	bne,pt	%icc,	loop_538
loop_537:
	bcc	loop_539
	addc	%l1,	0x1EF1,	%o0
	xnor	%i6,	%i4,	%g3
loop_538:
	addcc	%l3,	0x1BBF,	%o6
loop_539:
	bgu,a,pn	%xcc,	loop_540
	srax	%o5,	0x19,	%l4
	andncc	%g4,	%g1,	%o1
	and	%l2,	%g5,	%g6
loop_540:
	andcc	%i2,	0x17AB,	%g7
	fnot1	%f0,	%f0
	xor	%i0,	%i3,	%i5
	fnot1	%f10,	%f10
	andcc	%g2,	0x1B98,	%l6
	addccc	%l0,	0x1A6D,	%o2
	sra	%i7,	0x12,	%o4
	fnegs	%f13,	%f8
	srax	%o7,	0x16,	%o3
	add	%l7,	%l1,	%o0
	brnz,a	%i6,	loop_541
	sllx	%i1,	0x05,	%l5
	bvc,pn	%xcc,	loop_542
	sethi	0x109D,	%l3
loop_541:
	addccc	%o6,	0x0332,	%o5
	xor	%l4,	%i4,	%g3
loop_542:
	sethi	0x0CBD,	%g4
	subcc	%l2,	%o1,	%g5
	fabsd	%f6,	%f2
	addccc	%g1,	0x0D34,	%i2
	xorcc	%g7,	0x1DF2,	%i3
	or	%i0,	%i5,	%l6
	add	%l0,	%o2,	%g6
	brlz,a	%i7,	loop_543
	fsrc2s	%f5,	%f3
	fnands	%f15,	%f5,	%f12
	brnz	%o7,	loop_544
loop_543:
	xorcc	%g2,	0x0F99,	%l7
	bgu,a,pt	%xcc,	loop_545
	bg,a,pn	%xcc,	loop_546
loop_544:
	xnor	%o3,	0x0C4C,	%o4
	fandnot1s	%f8,	%f6,	%f4
loop_545:
	sub	%i6,	0x13DF,	%l1
loop_546:
	sll	%o0,	%l3,	%l5
	xor	%o5,	0x1883,	%l4
	sll	%o6,	%g3,	%g4
	fornot2s	%f14,	%f14,	%f14
	fnor	%f0,	%f6,	%f8
	subccc	%i4,	0x070B,	%l2
	sub	%o1,	0x1ED5,	%g1
	andncc	%g5,	%i2,	%i1
	sll	%g7,	%i3,	%l6
	xorcc	%l0,	0x13ED,	%o2
	sra	%g6,	%i0,	%i5
	fornot1s	%f4,	%f1,	%f15
	subccc	%g2,	%l7,	%i7
	orncc	%o7,	0x041E,	%o4
	andncc	%o3,	%i6,	%l3
	add	%o0,	0x0A22,	%o5
	sub	%l5,	%l4,	%l1
	brgez,a	%g3,	loop_547
	addcc	%i4,	0x1633,	%g4
	orn	%l2,	%g1,	%g5
	or	%o6,	%i1,	%i2
loop_547:
	fors	%f14,	%f0,	%f2
	fornot1s	%f14,	%f2,	%f5
	fors	%f12,	%f1,	%f10
	bleu,pn	%icc,	loop_548
	for	%f10,	%f12,	%f0
	fandnot1	%f14,	%f0,	%f12
	orncc	%g7,	%l6,	%l0
loop_548:
	fnegd	%f12,	%f8
	sllx	%i3,	%g6,	%i0
	xnor	%o2,	%g2,	%l7
	bne,pt	%icc,	loop_549
	xor	%i5,	%i7,	%o4
	andn	%o1,	0x118B,	%i6
	bleu	%xcc,	loop_550
loop_549:
	ble,pt	%icc,	loop_551
	andncc	%o7,	%o0,	%o5
	sllx	%l5,	%l3,	%l1
loop_550:
	sll	%o3,	%g3,	%l4
loop_551:
	andn	%l2,	%g1,	%i4
	andcc	%o6,	0x13EF,	%i1
	srax	%g5,	0x17,	%g7
	and	%g4,	%l6,	%i3
	fsrc2	%f12,	%f4
	sra	%l0,	%i2,	%o2
	xnor	%g2,	0x1700,	%l7
	fnegd	%f8,	%f2
	subc	%i5,	0x179C,	%i0
	fzeros	%f15
	andncc	%g6,	%i7,	%i6
	sllx	%o7,	%o0,	%o5
	sub	%o1,	%l5,	%l3
	andncc	%o4,	%l1,	%l4
	srax	%l2,	0x09,	%g1
	orncc	%g3,	%o6,	%o3
	add	%g5,	%g7,	%i1
	brlez,a	%l6,	loop_552
	sllx	%g4,	0x13,	%i4
	fand	%f4,	%f6,	%f8
	xnor	%l0,	%o2,	%i2
loop_552:
	orcc	%g2,	%i5,	%l7
	ba	loop_553
	for	%f2,	%f14,	%f10
	subcc	%i0,	%i3,	%i6
	and	%o7,	%i7,	%o0
loop_553:
	fandnot2s	%f12,	%f4,	%f5
	xnorcc	%g6,	0x1F7D,	%o1
	subcc	%o5,	0x1744,	%l3
	srlx	%l5,	0x07,	%o4
	brgz,a	%l1,	loop_554
	sethi	0x0E7D,	%l2
	fxor	%f4,	%f4,	%f2
	orcc	%l4,	%o6,	%o3
loop_554:
	or	%g1,	0x04E9,	%g3
	fnot2	%f4,	%f2
	fzeros	%f4
	fnot2s	%f15,	%f5
	srlx	%g5,	%g7,	%i1
	xnor	%i4,	0x1A27,	%l0
	orn	%g4,	%o2,	%l6
	xnorcc	%g2,	%i2,	%i0
	xor	%i5,	%l7,	%o7
	andncc	%i6,	%o0,	%i3
	subccc	%i7,	%g6,	%o1
	bge,a	loop_555
	andncc	%l5,	%o5,	%o4
	andn	%l3,	0x05D7,	%l1
	xnor	%l2,	%o3,	%l4
loop_555:
	addcc	%o6,	0x0B63,	%g3
	fornot2s	%f3,	%f5,	%f2
	xor	%g1,	%i1,	%g7
	fandnot2	%f6,	%f10,	%f6
	sll	%l0,	%g5,	%o2
	bcs,a	%xcc,	loop_556
	brlz,a	%i4,	loop_557
	sub	%g4,	%g2,	%i2
	fxnor	%f12,	%f2,	%f12
loop_556:
	srax	%i5,	%i0,	%l6
loop_557:
	fzeros	%f8
	xnor	%i6,	0x1126,	%o0
	fnot2	%f6,	%f10
	srl	%o7,	%i3,	%g6
	sethi	0x12FC,	%l7
	add	%o1,	0x119A,	%o5
	sethi	0x02B0,	%l5
	orn	%i7,	0x13F4,	%l3
	and	%l1,	%o3,	%o4
	addccc	%l4,	%o6,	%g3
	subcc	%g1,	0x0B53,	%l2
	fornot2s	%f0,	%f5,	%f10
	brnz	%g7,	loop_558
	orn	%g5,	%i1,	%l0
	srax	%g4,	0x05,	%i4
	xnor	%o2,	0x05C0,	%g2
loop_558:
	brlez,a	%i2,	loop_559
	xnor	%i5,	%l6,	%o0
	and	%i6,	0x0308,	%o7
	bleu,a,pn	%xcc,	loop_560
loop_559:
	sethi	0x13FD,	%g6
	fmovd	%f14,	%f14
	fornot1s	%f15,	%f14,	%f0
loop_560:
	xorcc	%l7,	0x077D,	%i0
	addc	%i3,	0x0FFF,	%o1
	andncc	%i7,	%l3,	%l5
	sethi	0x1668,	%o3
	and	%o4,	%l4,	%l1
	srl	%o6,	%g3,	%o5
	subc	%g1,	0x167E,	%g5
	bleu,pt	%icc,	loop_561
	brz,a	%l2,	loop_562
	bvs,pt	%icc,	loop_563
	bg,a	loop_564
loop_561:
	orncc	%g7,	%i1,	%g4
loop_562:
	sra	%o2,	0x1D,	%l0
loop_563:
	orncc	%g2,	%i4,	%l6
loop_564:
	bge	%xcc,	loop_565
	subccc	%o0,	0x185E,	%i6
	fzeros	%f4
	andcc	%i2,	0x05C8,	%o7
loop_565:
	and	%i5,	0x1F0C,	%i0
	subc	%l7,	%o1,	%i7
	sra	%l3,	0x1F,	%i3
	sub	%o3,	%g6,	%o4
	srl	%l4,	%o6,	%l5
	addccc	%o5,	0x1D73,	%g1
	fnot1s	%f13,	%f2
	fandnot1s	%f13,	%f5,	%f7
	xnorcc	%g3,	0x0BC7,	%g5
	sra	%l1,	%l2,	%g7
	bl,pt	%xcc,	loop_566
	fandnot1s	%f7,	%f10,	%f0
	or	%i1,	0x13E1,	%l0
	fxor	%f0,	%f2,	%f10
loop_566:
	andncc	%g2,	%g4,	%i4
	andncc	%o2,	%i6,	%i2
	and	%o7,	0x035A,	%i5
	sub	%o0,	%l6,	%l7
	add	%i0,	%o1,	%i3
	addc	%o3,	0x1AA8,	%g6
	subc	%i7,	%l3,	%l4
	fnot1s	%f4,	%f5
	fsrc2s	%f5,	%f5
	sub	%l5,	%o4,	%o6
	xor	%o5,	%g5,	%l1
	addcc	%l2,	%g1,	%i1
	xnorcc	%g7,	0x09EE,	%l0
	srl	%g3,	%g4,	%g2
	bvs	loop_567
	subc	%i6,	%i4,	%o2
	fabsd	%f8,	%f2
	andn	%i5,	%o0,	%i2
loop_567:
	fands	%f10,	%f5,	%f12
	brgez,a	%l7,	loop_568
	andcc	%l6,	%o7,	%o1
	srlx	%i3,	0x0A,	%i0
	orncc	%i7,	0x0683,	%g6
loop_568:
	srlx	%l3,	%l5,	%o4
	sra	%l4,	%o6,	%o3
	fnegs	%f8,	%f5
	fand	%f0,	%f0,	%f2
	sllx	%o5,	%g5,	%l2
	add	%i1,	0x1CC3,	%g1
	addcc	%l1,	0x0864,	%g7
	andn	%g3,	%l0,	%g4
	add	%g2,	%o2,	%i4
	bvs,pn	%xcc,	loop_569
	orncc	%i6,	%o0,	%l7
	bne	%xcc,	loop_570
	sll	%i5,	%i2,	%o7
loop_569:
	srax	%l6,	0x05,	%o1
	addcc	%i7,	0x190E,	%i0
loop_570:
	bgu	loop_571
	fabsd	%f2,	%f4
	fabss	%f4,	%f13
	xor	%i3,	0x0A38,	%g6
loop_571:
	sethi	0x0601,	%l5
	subcc	%l3,	%l4,	%o4
	addcc	%o5,	%g5,	%l2
	sllx	%o3,	%o6,	%g1
	orncc	%l1,	%i1,	%g7
	sra	%g3,	0x1C,	%l0
	orn	%o2,	%i4,	%g2
	addccc	%i6,	0x07D5,	%o0
	subc	%i5,	%i2,	%g4
	fnegs	%f15,	%f7
	bl,pn	%xcc,	loop_572
	bneg,a,pn	%xcc,	loop_573
	andncc	%l7,	%l6,	%o7
	and	%o1,	%i7,	%g6
loop_572:
	sra	%i3,	0x08,	%l5
loop_573:
	fsrc1s	%f15,	%f11
	fnot2	%f2,	%f8
	xnor	%l4,	%i0,	%o5
	andcc	%l3,	%g5,	%o3
	fsrc2	%f0,	%f4
	or	%o6,	%l2,	%l1
	xnor	%o4,	0x1D37,	%g1
	srl	%g3,	%l0,	%i1
	bg	%xcc,	loop_574
	fxor	%f8,	%f12,	%f12
	subc	%o2,	%g7,	%i4
	sra	%g2,	%i5,	%o0
loop_574:
	for	%f2,	%f12,	%f4
	fsrc1	%f10,	%f4
	addccc	%i6,	0x0803,	%i2
	xnorcc	%l7,	0x1AE5,	%o7
	orn	%g4,	0x1D4B,	%i7
	sethi	0x0E00,	%l6
	fnot2s	%f1,	%f9
	xor	%i3,	0x0742,	%g6
	xnor	%o1,	%l5,	%i0
	ba,a	%xcc,	loop_575
	fornot2	%f2,	%f6,	%f4
	fsrc1	%f14,	%f8
	orn	%o5,	0x0C9A,	%l3
loop_575:
	fsrc1s	%f1,	%f14
	bcs,pn	%xcc,	loop_576
	srax	%l4,	0x06,	%o3
	andn	%l2,	%l1,	%g5
	subccc	%o4,	0x0DF2,	%o6
loop_576:
	orn	%g3,	0x168D,	%g1
	sub	%i1,	%o2,	%l0
	xnorcc	%i4,	%i5,	%g7
	fabss	%f0,	%f3
	or	%g2,	%i6,	%l7
	ble,pn	%icc,	loop_577
	addcc	%o7,	0x1121,	%i2
	srl	%g4,	%o0,	%l6
	orncc	%i3,	0x048A,	%g6
loop_577:
	orcc	%o1,	0x0B46,	%i7
	fabss	%f12,	%f8
	sub	%i0,	%l5,	%o5
	bgu,a,pn	%icc,	loop_578
	andcc	%l3,	0x0492,	%l4
	bneg	loop_579
	andcc	%l2,	0x0429,	%l1
loop_578:
	sub	%o4,	%o6,	%o3
	sll	%g1,	%i1,	%g5
loop_579:
	sethi	0x03B7,	%g3
	xnorcc	%o2,	0x1093,	%l0
	fabss	%f5,	%f12
	and	%g7,	%g2,	%i6
	xor	%i5,	%l7,	%i4
	or	%o7,	0x03E0,	%i2
	sethi	0x0ABF,	%l6
	subcc	%o0,	0x1DD1,	%g4
	fandnot2	%f4,	%f6,	%f8
	sub	%o1,	%g6,	%i0
	andcc	%i3,	%l5,	%i7
	orn	%l3,	%o5,	%l2
	subccc	%o4,	%o6,	%o3
	bcc,a	%xcc,	loop_580
	bleu,a,pt	%icc,	loop_581
	fand	%f8,	%f6,	%f8
	addccc	%l1,	0x0893,	%l4
loop_580:
	fxnor	%f2,	%f2,	%f0
loop_581:
	sub	%g5,	0x1E42,	%g1
	ba	%icc,	loop_582
	sll	%i1,	%l0,	%g7
	xnorcc	%g3,	0x0E6D,	%g2
	srlx	%o2,	0x0C,	%i6
loop_582:
	addccc	%i4,	0x1519,	%i5
	andncc	%l7,	%o7,	%l6
	andn	%o0,	%o1,	%g6
	addccc	%i2,	%g4,	%i0
	subc	%i3,	0x1191,	%l5
	bneg,a	loop_583
	sllx	%i7,	0x0F,	%l2
	addc	%o5,	0x071A,	%l3
	xnorcc	%o6,	0x1CD4,	%o3
loop_583:
	fornot1	%f2,	%f12,	%f8
	and	%l4,	%l1,	%o4
	fnegd	%f12,	%f12
	orn	%i1,	0x1039,	%g5
	bcs,a,pt	%icc,	loop_584
	bvs,a	loop_585
	bl,a	loop_586
	addc	%g1,	%l0,	%g2
loop_584:
	andcc	%g3,	0x0AFD,	%i6
loop_585:
	orn	%i4,	%o2,	%l7
loop_586:
	addc	%i5,	0x00B6,	%o7
	addcc	%l6,	%o0,	%o1
	xnorcc	%i2,	%g7,	%i0
	xnorcc	%i3,	0x169D,	%g6
	orcc	%i7,	%l5,	%o5
	subcc	%l2,	%l3,	%o6
	subcc	%g4,	0x076A,	%l1
	fornot1s	%f13,	%f14,	%f7
	fone	%f8
	fsrc2s	%f3,	%f12
	sllx	%l4,	0x0C,	%o3
	fandnot1s	%f15,	%f11,	%f10
	addcc	%o4,	0x05B4,	%g5
	and	%i1,	%g2,	%l0
	srlx	%i6,	%i4,	%o2
	subc	%g3,	0x01E8,	%l7
	subc	%g1,	0x04DB,	%i5
	srl	%o7,	%o1,	%i2
	orcc	%g7,	0x1CAD,	%i0
	bn,pn	%xcc,	loop_587
	sllx	%o0,	0x14,	%l6
	brgez	%g6,	loop_588
	faligndata	%f0,	%f0,	%f4
loop_587:
	bn	%xcc,	loop_589
	xnorcc	%i7,	0x17DF,	%l5
loop_588:
	for	%f8,	%f8,	%f12
	srl	%l2,	0x00,	%l3
loop_589:
	orcc	%i3,	0x18DE,	%g4
	fands	%f11,	%f13,	%f4
	sub	%o6,	0x1BFD,	%o5
	add	%o3,	0x1EB3,	%l1
	xnorcc	%l4,	%i1,	%g5
	subcc	%l0,	%g2,	%i6
	subccc	%i4,	%g3,	%o4
	xorcc	%o2,	0x042F,	%l7
	fone	%f6
	srax	%g1,	%o1,	%i5
	bvs,a	loop_590
	bpos,pn	%xcc,	loop_591
	fnors	%f1,	%f13,	%f10
	srl	%o7,	0x14,	%i2
loop_590:
	sub	%g7,	0x17A3,	%o0
loop_591:
	sub	%i0,	0x0D9F,	%g6
	andncc	%l5,	%i7,	%l6
	fnot1s	%f10,	%f10
	addcc	%l3,	0x0A64,	%i3
	fandnot1s	%f9,	%f11,	%f10
	bn,a,pt	%icc,	loop_592
	orncc	%o6,	0x006D,	%g4
	xorcc	%o3,	%o5,	%l1
	ba,a,pn	%xcc,	loop_593
loop_592:
	srax	%i1,	0x13,	%g5
	brlez,a	%l4,	loop_594
	sub	%l0,	%l2,	%i4
loop_593:
	xorcc	%i6,	%g3,	%g2
	or	%o4,	%o2,	%g1
loop_594:
	ba	%xcc,	loop_595
	fabss	%f9,	%f3
	addcc	%l7,	0x1307,	%o7
	srl	%i5,	0x17,	%i2
loop_595:
	addcc	%o0,	%o1,	%g6
	srax	%i0,	0x05,	%l5
	fornot2s	%f4,	%f8,	%f6
	bg	loop_596
	fornot2s	%f8,	%f13,	%f13
	orcc	%i7,	0x113B,	%g7
	add	%i3,	0x1D4D,	%o6
loop_596:
	or	%l6,	%l3,	%g4
	ba,pn	%icc,	loop_597
	fnand	%f14,	%f14,	%f6
	fxor	%f8,	%f14,	%f0
	xor	%l1,	%i1,	%g5
loop_597:
	orcc	%o5,	%l0,	%l4
	fands	%f1,	%f2,	%f11
	brgz	%l2,	loop_598
	orncc	%o3,	%g3,	%g2
	and	%o4,	0x0957,	%i6
	bl,a,pn	%icc,	loop_599
loop_598:
	addcc	%o2,	%l7,	%o7
	fnot1	%f4,	%f2
	fors	%f6,	%f6,	%f10
loop_599:
	sra	%i4,	%i2,	%g1
	bcc,a	%icc,	loop_600
	brlez	%o0,	loop_601
	fnors	%f4,	%f3,	%f10
	xnor	%g6,	%i0,	%l5
loop_600:
	fones	%f4
loop_601:
	orcc	%i5,	0x1DD2,	%i7
	sra	%g7,	%o1,	%i3
	addcc	%l3,	0x1343,	%l6
	fnegs	%f7,	%f13
	fandnot2s	%f15,	%f3,	%f0
	xnorcc	%g4,	0x0191,	%i1
	or	%g5,	0x0461,	%o5
	brgez	%l0,	loop_602
	brgz,a	%o6,	loop_603
	andncc	%l1,	%l4,	%o3
	fornot2	%f6,	%f6,	%f0
loop_602:
	for	%f2,	%f10,	%f8
loop_603:
	andn	%g2,	0x1708,	%l2
	orn	%o4,	0x086D,	%o2
	bneg,a	%xcc,	loop_604
	sllx	%g3,	0x19,	%o7
	sra	%i4,	%l7,	%i6
	subcc	%i2,	0x0A8F,	%g1
loop_604:
	xor	%i0,	%o0,	%i5
	andncc	%i7,	%l5,	%g7
	fnors	%f14,	%f9,	%f3
	or	%o1,	%g6,	%l3
	or	%l6,	0x11DE,	%i1
	bcs	%icc,	loop_605
	andncc	%g5,	%o5,	%l0
	addccc	%g4,	0x0236,	%o6
	and	%l1,	%i3,	%o3
loop_605:
	subccc	%g2,	%o4,	%l2
	sethi	0x0277,	%l4
	faligndata	%f4,	%f12,	%f10
	addcc	%o2,	0x0F44,	%i4
	fands	%f10,	%f8,	%f3
	srl	%o7,	%l7,	%g3
	sra	%i2,	0x00,	%i6
	or	%i0,	0x08A3,	%o0
	ble,a,pt	%icc,	loop_606
	orn	%i7,	0x16AF,	%l5
	subcc	%i5,	%o1,	%g1
	fzero	%f6
loop_606:
	xorcc	%g6,	%g7,	%i1
	sll	%g5,	0x16,	%o5
	srl	%l6,	0x1F,	%l3
	add	%o6,	0x0113,	%l1
	add	%l0,	0x0449,	%g4
	srlx	%g2,	%o4,	%l2
	addccc	%o3,	0x1FA8,	%l4
	addcc	%o2,	%i4,	%i3
	xorcc	%g3,	0x1D4A,	%l7
	subccc	%i6,	0x00EF,	%i2
	xnorcc	%o7,	0x142B,	%i0
	addcc	%i7,	0x01A8,	%l5
	andn	%o0,	%g1,	%g6
	bpos,pn	%xcc,	loop_607
	xnor	%o1,	%i5,	%g5
	or	%o5,	%l6,	%g7
	add	%i1,	%l3,	%l0
loop_607:
	fornot2	%f12,	%f2,	%f8
	subcc	%o6,	%g2,	%o4
	srl	%l2,	%l1,	%o3
	fabsd	%f6,	%f14
	fabss	%f1,	%f2
	fnegs	%f6,	%f15
	sra	%g4,	%o2,	%i4
	and	%g3,	%l7,	%l4
	srl	%i3,	0x1F,	%i6
	bne,pn	%icc,	loop_608
	sub	%i0,	%i7,	%o7
	bcc	%xcc,	loop_609
	subc	%l5,	0x00EC,	%g1
loop_608:
	orn	%i2,	%o0,	%o1
	brgz	%i5,	loop_610
loop_609:
	sra	%g6,	0x1A,	%g5
	brnz,a	%l6,	loop_611
	fnor	%f6,	%f0,	%f6
loop_610:
	add	%o5,	%g7,	%l0
	orncc	%l3,	0x0DFC,	%o6
loop_611:
	sra	%g2,	0x13,	%i1
	or	%l2,	0x19AF,	%o3
	fnand	%f2,	%f14,	%f8
	fxors	%f14,	%f2,	%f10
	sllx	%g4,	0x0C,	%l1
	sethi	0x1885,	%o4
	fabsd	%f12,	%f8
	addcc	%i4,	0x00B2,	%g3
	bneg,a	%icc,	loop_612
	orcc	%o2,	0x00F0,	%l4
	bl,pt	%icc,	loop_613
	bg,a,pn	%xcc,	loop_614
loop_612:
	srax	%l7,	%i3,	%i6
	xorcc	%i0,	%i7,	%l5
loop_613:
	brlez	%g1,	loop_615
loop_614:
	addcc	%o0,	%o1,	%i5
	fsrc2s	%f12,	%f6
	srlx	%o7,	%i2,	%l6
loop_615:
	srl	%o5,	0x1D,	%g5
	sra	%g7,	%g6,	%o6
	sllx	%g2,	%l3,	%l0
	sra	%i1,	0x09,	%l2
	srl	%l1,	%g4,	%o3
	sub	%o4,	%o2,	%g3
	fands	%f13,	%f8,	%f2
	orncc	%i4,	%i3,	%l7
	andncc	%i6,	%l4,	%l5
	addc	%i7,	0x12E1,	%o0
	subc	%i0,	%o1,	%o7
	orn	%i2,	%g1,	%o5
	xorcc	%g5,	0x1844,	%l6
	bvc	%icc,	loop_616
	srl	%g6,	0x1B,	%o6
	bleu,a	%xcc,	loop_617
	xnor	%i5,	0x1BEE,	%l3
loop_616:
	subc	%l0,	%g2,	%g7
	fandnot2s	%f9,	%f0,	%f12
loop_617:
	fabsd	%f6,	%f14
	brnz	%l2,	loop_618
	subcc	%l1,	0x12FD,	%o3
	subc	%i1,	0x047A,	%o2
	fsrc1s	%f2,	%f11
loop_618:
	xorcc	%g3,	0x1E97,	%i4
	bvc,a,pn	%icc,	loop_619
	subcc	%i3,	0x0720,	%g4
	brgez	%l7,	loop_620
	fandnot2s	%f3,	%f13,	%f14
loop_619:
	brgez,a	%l4,	loop_621
	brz,a	%l5,	loop_622
loop_620:
	sll	%i6,	0x05,	%i7
	subccc	%o4,	0x19E3,	%i0
loop_621:
	andncc	%o7,	%o1,	%g1
loop_622:
	add	%i2,	0x0287,	%g5
	orn	%o0,	0x1BC4,	%o5
	orcc	%l6,	%i5,	%g6
	subc	%o6,	%g2,	%l0
	andcc	%l3,	%l2,	%o3
	fornot1	%f6,	%f0,	%f14
	fxor	%f8,	%f8,	%f2
	orcc	%g7,	0x13F0,	%o2
	fnegd	%f0,	%f4
	addc	%i1,	%l1,	%g3
	sra	%i4,	0x18,	%l7
	xor	%i3,	0x08BF,	%g4
	subccc	%i6,	%l5,	%i7
	andncc	%o4,	%l4,	%o1
	fabsd	%f10,	%f12
	andn	%i0,	0x06AB,	%i2
	subc	%g1,	%o7,	%g5
	bne,a,pt	%xcc,	loop_623
	fnot2s	%f0,	%f11
	bneg	%xcc,	loop_624
	fxor	%f6,	%f2,	%f4
loop_623:
	srlx	%l6,	0x0B,	%o5
	orcc	%g6,	%o6,	%o0
loop_624:
	bne,a,pt	%xcc,	loop_625
	fnands	%f2,	%f15,	%f7
	or	%g2,	0x0830,	%l3
	sethi	0x03DC,	%l0
loop_625:
	addc	%i5,	0x14FD,	%l2
	bl,pt	%xcc,	loop_626
	subccc	%g7,	0x1A11,	%o2
	subc	%o3,	%l1,	%i1
	sethi	0x1D7D,	%l7
loop_626:
	fnot1	%f10,	%f12
	sethi	0x1D85,	%i3
	fxors	%f0,	%f10,	%f8
	srlx	%g3,	0x06,	%g4
	srax	%i6,	0x1E,	%l5
	srlx	%i7,	%o4,	%o1
	sll	%l4,	%i4,	%g1
	bn	%xcc,	loop_627
	xnor	%i0,	0x07D3,	%i2
	sethi	0x1EB6,	%l6
	fornot1s	%f15,	%f13,	%f12
loop_627:
	sra	%o7,	0x04,	%g5
	srlx	%o6,	%g6,	%o0
	orn	%l3,	%o5,	%l0
	xor	%g2,	0x04C1,	%l2
	fxnor	%f14,	%f10,	%f0
	fnegd	%f8,	%f14
	fandnot1s	%f14,	%f14,	%f5
	andncc	%o2,	%g7,	%l1
	srl	%i5,	%i1,	%l7
	brlz,a	%o3,	loop_628
	xnorcc	%g3,	0x023A,	%g4
	xnorcc	%l5,	%i3,	%i6
	sll	%i7,	0x16,	%o4
loop_628:
	xnor	%l4,	0x0ED0,	%o1
	bvs,a,pn	%xcc,	loop_629
	add	%i4,	0x1ED9,	%i2
	bcs	%icc,	loop_630
	srlx	%l6,	%g1,	%i0
loop_629:
	andncc	%o7,	%g5,	%o6
	orncc	%o0,	%l3,	%g6
loop_630:
	addc	%o5,	%l0,	%l2
	bn,a,pt	%icc,	loop_631
	and	%g7,	%g2,	%i5
	orcc	%i1,	%l1,	%l7
	fsrc1s	%f9,	%f14
loop_631:
	orncc	%o2,	%o3,	%g3
	or	%g4,	%l5,	%i6
	fxnor	%f0,	%f12,	%f14
	xor	%o4,	0x17DF,	%l4
	add	%i3,	%o1,	%i2
	addccc	%l6,	%g1,	%i7
	subccc	%i4,	0x00A2,	%o7
	addc	%o6,	%g5,	%o0
	sethi	0x1AFC,	%g6
	srlx	%l3,	%l0,	%o5
	fsrc2s	%f13,	%f6
	andncc	%l2,	%g7,	%i5
	bcc	loop_632
	add	%g2,	0x0020,	%l1
	srax	%i0,	%o2,	%l7
	add	%o3,	0x097C,	%i1
loop_632:
	addcc	%g4,	%g3,	%l5
	fornot1	%f0,	%f2,	%f10
	or	%o4,	0x0A19,	%i3
	brnz	%o1,	loop_633
	bpos,a,pt	%icc,	loop_634
	sra	%i6,	%l4,	%g1
	orcc	%l6,	%i7,	%i2
loop_633:
	sub	%o6,	0x170A,	%g5
loop_634:
	fmovd	%f14,	%f0
	srax	%o0,	0x13,	%i4
	bvc,pt	%xcc,	loop_635
	srl	%o7,	0x0C,	%l3
	andcc	%g6,	0x04EE,	%o5
	srax	%g7,	0x17,	%l2
loop_635:
	orn	%l0,	%i5,	%i0
	sra	%o2,	%g2,	%l1
	subc	%o3,	%g4,	%g3
	fandnot1	%f14,	%f10,	%f4
	sub	%l5,	%i1,	%l7
	sll	%i3,	%o4,	%l4
	xnor	%o1,	%l6,	%i7
	xnorcc	%i2,	%i6,	%g5
	sllx	%o0,	0x1F,	%o6
	and	%g1,	0x17D8,	%o7
	addcc	%i4,	0x1AAC,	%l3
	srlx	%g6,	%l2,	%g7
	faligndata	%f4,	%f0,	%f0
	orcc	%i5,	%l0,	%o2
	subcc	%g2,	0x17F1,	%l1
	subc	%i0,	%g4,	%g3
	brgez	%o5,	loop_636
	addc	%i1,	0x100C,	%l5
	xnor	%i3,	0x10CA,	%l7
	sub	%o4,	%l4,	%o1
loop_636:
	and	%l6,	%o3,	%i7
	sll	%g5,	0x1C,	%i2
	xnor	%i6,	0x022F,	%g1
	srlx	%o0,	%o6,	%i4
	orn	%l3,	0x01EB,	%o7
	fandnot1	%f14,	%f0,	%f10
	subccc	%g7,	0x060D,	%l2
	sra	%g6,	%o2,	%l0
	subccc	%l1,	0x142B,	%g2
	subccc	%i5,	0x1C07,	%g3
	brnz	%i0,	loop_637
	fxnors	%f0,	%f6,	%f8
	subcc	%i1,	0x17F0,	%l5
	brgez,a	%i3,	loop_638
loop_637:
	addc	%g4,	0x0535,	%o4
	add	%o5,	%l4,	%l7
	sub	%o1,	%l6,	%o3
loop_638:
	srlx	%i2,	%i6,	%g1
	subcc	%i7,	0x0855,	%o0
	addcc	%g5,	0x0ACE,	%l3
	andcc	%o7,	%i4,	%o6
	orn	%l2,	0x047D,	%g6
	bl,pn	%xcc,	loop_639
	andn	%l0,	%g7,	%o2
	fnegs	%f0,	%f5
	fnands	%f12,	%f13,	%f14
loop_639:
	fnegs	%f1,	%f9
	add	%i5,	%g3,	%g2
	xnorcc	%l1,	%i0,	%i3
	fxnor	%f10,	%f4,	%f10
	sll	%g4,	0x14,	%o4
	fandnot2s	%f13,	%f8,	%f10
	andn	%o5,	0x0FE7,	%l5
	bl,a	%icc,	loop_640
	sub	%l4,	0x1951,	%i1
	sllx	%l7,	%l6,	%o3
	sub	%i6,	%i2,	%i7
loop_640:
	xnor	%o0,	0x1602,	%o1
	xnorcc	%g5,	0x0825,	%l3
	fxors	%f4,	%f0,	%f15
	orncc	%o7,	0x1BDF,	%g1
	bcc,a,pn	%icc,	loop_641
	andcc	%l2,	%o6,	%l0
	brnz	%i4,	loop_642
	fmovs	%f7,	%f11
loop_641:
	orcc	%o2,	0x117D,	%g6
	fmovs	%f2,	%f3
loop_642:
	bvs,pn	%icc,	loop_643
	xor	%i5,	%g2,	%g3
	orcc	%l1,	0x16CF,	%g7
	or	%i0,	%g4,	%o4
loop_643:
	fnegd	%f10,	%f4
	fsrc2s	%f0,	%f3
	andn	%l5,	0x0702,	%o5
	xnorcc	%i1,	0x1343,	%l4
	andcc	%i3,	%l7,	%o3
	xnor	%i2,	0x1A69,	%i7
	sllx	%l6,	%o1,	%g5
	bge,a,pn	%icc,	loop_644
	subccc	%o0,	0x0F13,	%o7
	xnor	%i6,	0x067A,	%l3
	addc	%l2,	0x0928,	%l0
loop_644:
	sll	%i4,	%o2,	%o6
	xor	%i5,	0x0D79,	%g1
	addccc	%g3,	%l1,	%g2
	fands	%f8,	%f15,	%f0
	fzeros	%f1
	fsrc1s	%f15,	%f15
	addc	%g6,	%g4,	%g7
	srax	%o4,	%l5,	%o5
	fand	%f10,	%f6,	%f6
	fnot2	%f6,	%f6
	andcc	%l4,	%i3,	%l7
	srlx	%o3,	%i2,	%i1
	fones	%f0
	brgz	%i7,	loop_645
	orn	%o1,	%i0,	%g5
	subcc	%o0,	%i6,	%l6
	addcc	%o7,	%l2,	%i4
loop_645:
	xorcc	%o2,	%l3,	%l0
	and	%i5,	0x10B0,	%g1
	orcc	%g3,	%g2,	%o6
	fornot1s	%f1,	%f14,	%f14
	xnor	%g6,	0x16B3,	%g7
	addccc	%o4,	0x1292,	%g4
	andn	%o5,	0x03B5,	%l1
	fnot2	%f0,	%f4
	fnor	%f12,	%f4,	%f4
	brlz,a	%l4,	loop_646
	subc	%l5,	0x1014,	%i3
	xnor	%l7,	%i2,	%i1
	faligndata	%f14,	%f8,	%f6
loop_646:
	addc	%i7,	0x175E,	%o1
	sethi	0x0DA4,	%i0
	fnands	%f0,	%f4,	%f12
	or	%o3,	%g5,	%i6
	andcc	%l6,	%o0,	%i4
	fmovs	%f11,	%f0
	subc	%l2,	%l3,	%o2
	addc	%o7,	0x047B,	%l0
	srax	%g1,	0x01,	%g2
	or	%i5,	%o6,	%g6
	fand	%f2,	%f6,	%f12
	fnors	%f6,	%f10,	%f10
	subc	%o4,	0x0BFA,	%g4
	sllx	%g3,	%o5,	%l1
	sub	%l4,	%l5,	%g7
	orncc	%i3,	0x0A9D,	%l7
	fand	%f6,	%f0,	%f6
	addcc	%i1,	0x079B,	%i2
	bvs,a	loop_647
	or	%o1,	%i0,	%g5
	andn	%i6,	%o3,	%o0
	xnor	%i7,	0x160E,	%l6
loop_647:
	addccc	%l2,	0x0422,	%i4
	fxors	%f2,	%f7,	%f15
	fxors	%f6,	%f1,	%f3
	xnor	%o2,	%o7,	%l3
	or	%l0,	0x0CA2,	%g1
	brnz,a	%i5,	loop_648
	bvs,a	%icc,	loop_649
	addccc	%o6,	%o4,	%g2
	subcc	%g3,	%o5,	%g6
loop_648:
	sll	%l4,	%g4,	%g7
loop_649:
	and	%l5,	0x088C,	%l7
	orncc	%i3,	%l1,	%o1
	andn	%i0,	%g5,	%i6
	addccc	%i1,	%o3,	%o0
	fornot1	%f2,	%f14,	%f0
	andcc	%i7,	%l6,	%i4
	and	%o2,	0x090F,	%i2
	fnot2	%f0,	%f6
	sll	%l3,	0x03,	%l2
	addc	%g1,	%o7,	%l0
	xnor	%i5,	0x12C1,	%g2
	fnot1	%f2,	%f12
	andcc	%g3,	0x0353,	%o5
	andn	%o6,	0x17E7,	%g6
	subc	%g4,	0x1820,	%g7
	orcc	%o4,	0x01DE,	%l4
	bpos	%xcc,	loop_650
	bne,a,pn	%xcc,	loop_651
	and	%l5,	%l7,	%i3
	or	%o1,	%l1,	%i6
loop_650:
	brz,a	%g5,	loop_652
loop_651:
	brlz	%i0,	loop_653
	addccc	%i1,	%i7,	%l6
	fmovs	%f7,	%f3
loop_652:
	brz	%i4,	loop_654
loop_653:
	sllx	%o3,	%i2,	%o2
	xor	%l2,	0x057B,	%g1
	andncc	%l3,	%l0,	%i5
loop_654:
	sra	%o0,	%g2,	%o7
	xor	%o6,	%g6,	%g3
	fxnor	%f0,	%f6,	%f2
	xnor	%g7,	0x0A3A,	%o5
	sllx	%o4,	%l4,	%l5
	sll	%i3,	0x0E,	%l7
	subc	%l1,	0x083D,	%g4
	fabss	%f0,	%f2
	addcc	%o1,	0x1DF8,	%g5
	srlx	%i6,	0x06,	%i0
	bl,pt	%icc,	loop_655
	fxnor	%f0,	%f0,	%f0
	addc	%i1,	%i4,	%o3
	or	%l6,	%i2,	%o2
loop_655:
	addccc	%l2,	0x0AC2,	%i7
	be,a	%xcc,	loop_656
	srl	%l3,	%g1,	%o0
	bcc,pn	%xcc,	loop_657
	or	%g2,	0x1EC4,	%l0
loop_656:
	orncc	%i5,	%o7,	%g6
	orncc	%g7,	%g3,	%o4
loop_657:
	andn	%o6,	%l5,	%o5
	andncc	%l4,	%l7,	%g4
	subc	%i3,	%g5,	%i6
	fnegd	%f10,	%f2
	fandnot2	%f8,	%f0,	%f0
	xnorcc	%l1,	%o1,	%i4
	andncc	%o3,	%i0,	%i2
	fnand	%f2,	%f14,	%f8
	sllx	%o2,	0x0A,	%l2
	sub	%i7,	0x10EA,	%i1
	or	%l3,	0x0285,	%l6
	and	%o0,	0x11B8,	%g1
	srax	%i5,	%g2,	%l0
	ba,pn	%xcc,	loop_658
	srl	%o7,	0x09,	%g6
	fmovd	%f12,	%f12
	srax	%g7,	0x1B,	%o6
loop_658:
	andn	%o4,	%l5,	%l4
	sll	%l7,	0x0A,	%g4
	addccc	%o5,	0x15A9,	%g5
	xnorcc	%i6,	%l1,	%o1
	bcc,a	%xcc,	loop_659
	fmovs	%f7,	%f0
	sra	%i3,	%i4,	%o3
	fandnot2s	%f15,	%f2,	%f4
loop_659:
	xor	%i2,	0x105F,	%g3
	xnor	%l2,	%i0,	%i7
	fxors	%f2,	%f6,	%f2
	orn	%l3,	0x1564,	%o2
	subcc	%o0,	0x186B,	%l6
	orncc	%g1,	%g2,	%l0
	srlx	%o7,	0x02,	%g6
	bpos,a,pn	%icc,	loop_660
	or	%i5,	0x0611,	%i1
	subc	%o6,	0x17DE,	%g7
	sll	%o4,	%l5,	%g4
loop_660:
	bcs,pn	%xcc,	loop_661
	orncc	%l7,	0x134A,	%o5
	xor	%g5,	0x0610,	%i6
	xorcc	%l4,	0x053E,	%i3
loop_661:
	addccc	%o1,	%l1,	%i4
	orncc	%g3,	0x0F7C,	%l2
	be,pn	%icc,	loop_662
	xorcc	%o3,	0x13CF,	%i7
	addc	%i2,	0x1E04,	%l3
	fnot1s	%f10,	%f5
loop_662:
	fones	%f15
	xnor	%o0,	%i0,	%o2
	andcc	%g1,	0x06C8,	%g2
	fsrc1	%f6,	%f0
	brz,a	%o7,	loop_663
	fzeros	%f15
	brgez	%l6,	loop_664
	fsrc2s	%f5,	%f7
loop_663:
	xorcc	%l0,	%i1,	%i5
	and	%g7,	0x19F4,	%g6
loop_664:
	fnegs	%f11,	%f7
	subc	%o6,	%o4,	%l5
	sub	%g4,	0x0F40,	%l7
	fones	%f5
	sub	%o5,	%l4,	%i3
	orcc	%g5,	0x0FB6,	%l1
	orn	%o1,	0x1069,	%i4
	fabsd	%f8,	%f6
	andcc	%g3,	%l2,	%o3
	orncc	%i6,	0x06C1,	%i7
	srl	%o0,	0x0C,	%i2
	sub	%l3,	0x1E47,	%g1
	xor	%o2,	%g2,	%l6
	fandnot2	%f12,	%f4,	%f14
	bvs	loop_665
	addc	%l0,	0x1099,	%o7
	fmovd	%f6,	%f12
	and	%i1,	%i5,	%g7
loop_665:
	brnz,a	%o6,	loop_666
	xnorcc	%g6,	0x05C7,	%i0
	xor	%g4,	0x02A4,	%l7
	and	%o5,	%o4,	%l5
loop_666:
	or	%i3,	%g5,	%o1
	addccc	%l4,	0x0EEC,	%g3
	fandnot2s	%f0,	%f14,	%f2
	addccc	%l1,	0x14FE,	%l2
	bge	%xcc,	loop_667
	fones	%f7
	andcc	%o3,	0x06E7,	%i7
	subcc	%i6,	%o0,	%i2
loop_667:
	andcc	%i4,	%g1,	%o2
	andn	%l6,	0x17F5,	%l3
	andncc	%g2,	%l0,	%o7
	sra	%i1,	0x19,	%i5
	fands	%f0,	%f11,	%f12
	sub	%g7,	0x08DD,	%i0
	xorcc	%g6,	%l7,	%o5
	fmovd	%f2,	%f4
	fxnors	%f12,	%f9,	%f4
	fabsd	%f2,	%f6
	addc	%g4,	0x092D,	%o6
	subc	%o4,	%i3,	%g5
	orn	%l4,	0x181E,	%l5
	subc	%o1,	%g3,	%l2
	brgez	%o3,	loop_668
	orcc	%l1,	%i7,	%i6
	sra	%i2,	%o0,	%o2
	brgez,a	%g1,	loop_669
loop_668:
	subccc	%l3,	%g2,	%l6
	and	%o7,	0x0752,	%i4
	orn	%l0,	0x1D1E,	%i5
loop_669:
	andncc	%g7,	%i0,	%l7
	or	%o5,	0x17FE,	%i1
	sra	%o6,	0x1B,	%g6
	or	%g4,	%i3,	%l4
	orn	%l5,	0x19A9,	%o4
	andn	%g5,	0x1798,	%g3
	sll	%o1,	%l1,	%l2
	andcc	%o3,	%i7,	%o0
	andn	%i6,	0x1F16,	%i2
	sub	%o2,	0x085E,	%g2
	bg,pn	%icc,	loop_670
	subc	%g1,	0x035E,	%o7
	bcs,pt	%xcc,	loop_671
	fnot2s	%f4,	%f7
loop_670:
	bcc,a	%xcc,	loop_672
	srl	%i4,	0x01,	%l3
loop_671:
	bge,a	loop_673
	srax	%l0,	0x0D,	%i5
loop_672:
	sllx	%g7,	%i0,	%l7
	sethi	0x0154,	%l6
loop_673:
	fnot1s	%f1,	%f8
	andn	%o5,	%g6,	%g4
	fnand	%f0,	%f10,	%f12
	add	%i3,	%l4,	%o6
	srlx	%o4,	0x10,	%g5
	fsrc1	%f4,	%f4
	srax	%l5,	%o1,	%l1
	fnands	%f14,	%f3,	%f13
	fnand	%f14,	%f12,	%f12
	or	%l2,	%o3,	%i7
	fandnot1	%f2,	%f10,	%f14
	fand	%f2,	%f8,	%f2
	srl	%o0,	0x13,	%i6
	bge,a,pn	%icc,	loop_674
	fxors	%f14,	%f5,	%f11
	fandnot2	%f0,	%f12,	%f6
	subccc	%i1,	0x1109,	%o2
loop_674:
	xnorcc	%i2,	0x19BA,	%g2
	orcc	%o7,	%g3,	%g1
	bl,a	loop_675
	add	%l3,	0x0F17,	%i5
	bgu	loop_676
	subc	%l0,	%i0,	%g7
loop_675:
	bvs,pt	%xcc,	loop_677
	or	%l7,	%o5,	%l6
loop_676:
	and	%g6,	0x0902,	%i3
	fnand	%f12,	%f0,	%f8
loop_677:
	brnz,a	%l4,	loop_678
	sub	%g4,	%o4,	%o6
	for	%f6,	%f4,	%f10
	subc	%i4,	0x1101,	%o1
loop_678:
	sra	%l5,	%g5,	%o3
	xor	%l1,	0x0397,	%o0
	bge	%xcc,	loop_679
	andn	%l2,	0x17BD,	%i7
	sll	%o2,	0x0B,	%i6
	sub	%g2,	%i1,	%o7
loop_679:
	brlez,a	%i2,	loop_680
	bg,a	loop_681
	addccc	%l3,	0x0D8F,	%g1
	brgz,a	%i5,	loop_682
loop_680:
	sll	%l0,	0x0D,	%i0
loop_681:
	srlx	%g3,	0x14,	%l7
	or	%l6,	0x16F9,	%o5
loop_682:
	xnorcc	%g6,	0x0488,	%g7
	subcc	%g4,	0x1010,	%i3
	or	%o4,	%o6,	%l4
	andn	%i4,	%g5,	%o3
	sra	%l1,	0x06,	%l5
	andcc	%l2,	0x0879,	%o0
	xorcc	%i7,	%o1,	%o2
	addc	%i6,	0x03A3,	%o7
	bleu,a,pn	%icc,	loop_683
	add	%i1,	%i2,	%g2
	srl	%g1,	0x1E,	%l0
	add	%i5,	%l3,	%g3
loop_683:
	brlez,a	%l7,	loop_684
	fnor	%f2,	%f12,	%f2
	orn	%l6,	%i0,	%g6
	addccc	%g7,	%i3,	%o5
loop_684:
	bneg,a	loop_685
	subccc	%g4,	%l4,	%o4
	ba,a	%xcc,	loop_686
	bneg,pn	%icc,	loop_687
loop_685:
	srl	%i4,	%o3,	%g5
	brlez	%l1,	loop_688
loop_686:
	fand	%f0,	%f0,	%f2
loop_687:
	sethi	0x0B91,	%l2
	orn	%o0,	%i7,	%o1
loop_688:
	xorcc	%l5,	0x1387,	%o6
	bne,a,pn	%xcc,	loop_689
	brnz	%o2,	loop_690
	srl	%i6,	0x01,	%i1
	xor	%g2,	0x0487,	%i2
loop_689:
	bg	loop_691
loop_690:
	fmovs	%f9,	%f5
	andcc	%g1,	0x0B33,	%i5
	addc	%l0,	%o7,	%l7
loop_691:
	bvc	%xcc,	loop_692
	fones	%f13
	fsrc1	%f4,	%f2
	subccc	%l6,	0x0976,	%i0
loop_692:
	fnot1	%f8,	%f14
	xnor	%l3,	0x1AB4,	%g6
	fzero	%f6
	srl	%i3,	0x04,	%o5
	orn	%g4,	%g3,	%o4
	xorcc	%l4,	0x1E40,	%g7
	andcc	%g5,	%i4,	%l2
	subccc	%o3,	%l1,	%i7
	fnot1s	%f7,	%f5
	orcc	%o1,	0x0284,	%l5
	bpos,a,pn	%xcc,	loop_693
	or	%o2,	%o6,	%i6
	subcc	%i1,	%i2,	%g1
	subcc	%i5,	0x17A9,	%g2
loop_693:
	andcc	%o7,	%l0,	%l6
	sra	%l7,	0x0F,	%l3
	xorcc	%o0,	%i3,	%g6
	andcc	%o5,	%g4,	%g3
	subccc	%o4,	0x1295,	%i0
	brz,a	%l4,	loop_694
	fxors	%f15,	%f12,	%f8
	xnor	%g7,	%g5,	%o3
	xnor	%i4,	0x0FBA,	%l1
loop_694:
	sethi	0x13E7,	%o1
	fones	%f12
	sll	%l5,	%l2,	%o2
	add	%i7,	0x1CD2,	%i6
	orn	%i1,	0x1391,	%i2
	bg	loop_695
	subc	%o6,	0x1F40,	%i5
	xnorcc	%g1,	%l0,	%l6
	srlx	%g2,	0x0B,	%l3
loop_695:
	fandnot1s	%f9,	%f7,	%f8
	fand	%f8,	%f2,	%f14
	sra	%o7,	0x0B,	%o0
	addcc	%l7,	%g6,	%i3
	or	%g3,	0x0B23,	%o5
	sra	%i0,	%l4,	%g4
	orcc	%g5,	0x084D,	%o3
	addc	%o4,	0x17F4,	%l1
	andncc	%o1,	%g7,	%l2
	fsrc2	%f8,	%f2
	orn	%o2,	0x0960,	%i7
	andncc	%i4,	%i6,	%l5
	fandnot1s	%f8,	%f8,	%f15
	fabss	%f2,	%f9
	orncc	%i2,	0x0B41,	%i5
	or	%o6,	0x1C4E,	%l0
	subcc	%g1,	0x1397,	%g2
	sllx	%i1,	0x17,	%o7
	subcc	%o0,	0x1778,	%l6
	srax	%l3,	0x1F,	%g6
	subcc	%g3,	%l7,	%i0
	bgu,pn	%icc,	loop_696
	add	%l4,	%i3,	%g5
	andcc	%o5,	0x0CA0,	%o4
	addccc	%l1,	%o1,	%o3
loop_696:
	fnegs	%f1,	%f1
	sll	%g7,	0x10,	%l2
	xnor	%o2,	%i4,	%i6
	sethi	0x0CB9,	%g4
	andncc	%i2,	%i7,	%o6
	addcc	%l0,	0x076A,	%g1
	andcc	%g2,	0x06F7,	%l5
	and	%i1,	%o7,	%o0
	srax	%i5,	%l3,	%l6
	sllx	%g3,	0x1C,	%g6
	and	%l7,	0x0289,	%i0
	sll	%i3,	%o5,	%g5
	orn	%l4,	0x0634,	%o4
	orcc	%l1,	%o1,	%g7
	sethi	0x0786,	%l2
	addccc	%o2,	%i4,	%i6
	bneg,a	%xcc,	loop_697
	xor	%o3,	0x1F53,	%g4
	addccc	%o6,	0x1E11,	%i2
	addccc	%l0,	0x1A84,	%g2
loop_697:
	orncc	%i7,	%l5,	%o7
	addcc	%g1,	0x0516,	%o0
	fzero	%f0
	andncc	%i1,	%l3,	%g3
	sub	%g6,	%l7,	%i0
	orncc	%l6,	%i5,	%o5
	sethi	0x15B3,	%i3
	addc	%o4,	%l1,	%l4
	xnor	%o1,	%g5,	%g7
	fmovd	%f12,	%f0
	or	%i4,	0x0584,	%i6
	sllx	%o2,	%g4,	%o3
	fnand	%f0,	%f10,	%f10
	fnors	%f12,	%f14,	%f4
	fandnot2	%f6,	%f4,	%f14
	or	%l2,	0x1200,	%i2
	bcc,pn	%xcc,	loop_698
	andncc	%o6,	%l0,	%i7
	addccc	%g2,	%l5,	%o7
	and	%g1,	%i1,	%o0
loop_698:
	ble,pn	%xcc,	loop_699
	srax	%g3,	0x1A,	%l7
	fnegd	%f4,	%f8
	addc	%g6,	%l6,	%i0
loop_699:
	fand	%f2,	%f8,	%f2
	addcc	%l3,	0x0B0A,	%i5
	srax	%o5,	%i3,	%l1
	add	%l4,	%g5,	%g7
	orncc	%o1,	%i4,	%i6
	fxnors	%f0,	%f7,	%f5
	srax	%g4,	%o4,	%l2
	addccc	%i2,	%o3,	%o6
	fnand	%f6,	%f2,	%f12
	addcc	%o2,	%i7,	%l5
	sethi	0x0012,	%o7
	for	%f0,	%f4,	%f14
	fornot2	%f8,	%f2,	%f12
	bpos,a	loop_700
	andn	%g1,	0x13B4,	%i1
	subc	%o0,	0x1320,	%l0
	andcc	%g3,	%g6,	%l7
loop_700:
	fandnot2	%f2,	%f6,	%f6
	sllx	%g2,	0x17,	%l6
	bg,pt	%xcc,	loop_701
	addccc	%i0,	0x1E04,	%i5
	bvs	loop_702
	brgez,a	%l3,	loop_703
loop_701:
	add	%i3,	%l1,	%g5
	addccc	%o5,	%o1,	%g7
loop_702:
	bn,a,pn	%icc,	loop_704
loop_703:
	addccc	%l4,	0x1EF8,	%g4
	fsrc2	%f10,	%f14
	addccc	%o4,	%i6,	%l2
loop_704:
	add	%i2,	0x0969,	%i4
	ba,pt	%xcc,	loop_705
	fnor	%f6,	%f4,	%f0
	bge,a,pn	%icc,	loop_706
	xnorcc	%o6,	0x1988,	%i7
loop_705:
	sll	%o3,	0x02,	%l5
	orcc	%g1,	0x15AD,	%i1
loop_706:
	orcc	%o2,	%l0,	%g3
	xnorcc	%o0,	%l7,	%o7
	orcc	%g6,	%l6,	%i5
	sllx	%l3,	0x0E,	%i0
	subc	%g2,	%g5,	%l1
	sub	%i3,	%o1,	%l4
	fands	%f8,	%f5,	%f1
	andncc	%g4,	%o4,	%i6
	andncc	%l2,	%o5,	%i2
	orn	%i4,	%g7,	%o6
	addc	%l5,	0x1B95,	%g1
	srlx	%i7,	0x1C,	%o2
	and	%o3,	%g3,	%l0
	fmovd	%f14,	%f4
	fsrc2s	%f0,	%f3
	xorcc	%l7,	0x049D,	%o0
	srax	%i1,	%o7,	%i5
	xor	%l3,	%i0,	%g6
	andncc	%l6,	%g2,	%l1
	brlz	%g5,	loop_707
	andcc	%i3,	%g4,	%o1
	subcc	%i6,	0x0953,	%l4
	srlx	%l2,	%o5,	%i4
loop_707:
	subccc	%o4,	%o6,	%i2
	add	%g7,	%l5,	%g1
	bge,a,pt	%xcc,	loop_708
	subcc	%o3,	%i7,	%g3
	fnand	%f6,	%f10,	%f12
	and	%l0,	0x00C4,	%l7
loop_708:
	sra	%i1,	%o0,	%i5
	subccc	%l3,	%o2,	%g6
	ba,a,pn	%icc,	loop_709
	subccc	%i0,	0x0891,	%o7
	bcc,a,pt	%xcc,	loop_710
	xnor	%l6,	0x0CAB,	%g5
loop_709:
	andn	%g2,	%l1,	%i3
	fsrc2s	%f3,	%f2
loop_710:
	fnor	%f0,	%f14,	%f0
	sllx	%o1,	%l4,	%l2
	subcc	%i6,	%g4,	%o4
	andcc	%o6,	0x173A,	%i2
	xnorcc	%o5,	%i4,	%g7
	bl	loop_711
	subcc	%o3,	0x0344,	%l5
	orn	%i7,	%g1,	%g3
	sub	%l7,	%l0,	%i5
loop_711:
	brnz	%l3,	loop_712
	bneg	loop_713
	sll	%o2,	0x1D,	%g6
	sll	%i1,	0x07,	%o7
loop_712:
	fandnot1s	%f5,	%f7,	%f0
loop_713:
	sllx	%o0,	%l6,	%g2
	sllx	%l1,	%i0,	%i3
	xnor	%g5,	%l2,	%l4
	xor	%g4,	0x0DC9,	%o1
	be,a	loop_714
	or	%i6,	%o4,	%i2
	srl	%o5,	%o6,	%g7
	brz,a	%l5,	loop_715
loop_714:
	subcc	%i4,	0x15E4,	%g1
	bgu,pn	%xcc,	loop_716
	orn	%o3,	0x0060,	%g3
loop_715:
	brz	%l0,	loop_717
	subccc	%i5,	%l7,	%o2
loop_716:
	bg,pt	%icc,	loop_718
	subcc	%g6,	0x188D,	%l3
loop_717:
	xnor	%i7,	%o0,	%i1
	fxnor	%f10,	%f14,	%f10
loop_718:
	orn	%g2,	0x0C57,	%o7
	add	%i0,	%l1,	%i3
	andn	%l6,	0x17E0,	%g5
	xnorcc	%l2,	%g4,	%i6
	srlx	%o4,	%o1,	%l4
	bne,pn	%xcc,	loop_719
	sra	%i2,	%g7,	%o5
	bl,a,pn	%icc,	loop_720
	and	%l5,	0x1699,	%g1
loop_719:
	andncc	%o3,	%i4,	%l0
	add	%i5,	%o6,	%o2
loop_720:
	fabss	%f9,	%f11
	bg,a	%icc,	loop_721
	brlz,a	%g3,	loop_722
	bneg,pn	%xcc,	loop_723
	orcc	%l7,	0x0DB4,	%i7
loop_721:
	addc	%g6,	%o0,	%g2
loop_722:
	bgu,a,pn	%icc,	loop_724
loop_723:
	xorcc	%l3,	0x14DC,	%i1
	fnands	%f15,	%f9,	%f11
	fzeros	%f11
loop_724:
	orncc	%o7,	0x0D62,	%l1
	or	%i3,	%i0,	%l6
	addc	%l2,	%i6,	%g4
	and	%o1,	0x05B2,	%g5
	fxor	%f0,	%f10,	%f4
	srl	%o4,	%l4,	%o5
	addccc	%i2,	%g1,	%l5
	andn	%g7,	0x0B24,	%i4
	addc	%l0,	0x094A,	%o3
	brlz,a	%o6,	loop_725
	fandnot1s	%f13,	%f7,	%f4
	fmovd	%f14,	%f4
	andcc	%o2,	%i5,	%i7
loop_725:
	sllx	%g3,	%l7,	%g2
	add	%l3,	%i1,	%o7
	sll	%o0,	0x0A,	%g6
	be,a,pt	%xcc,	loop_726
	andcc	%l1,	0x1CB1,	%i0
	srl	%i3,	%l2,	%g4
	addc	%i6,	0x0748,	%l6
loop_726:
	andncc	%g5,	%o4,	%o1
	orn	%i2,	0x0057,	%l4
	fnegs	%f13,	%f12
	sra	%l5,	%g7,	%g1
	andcc	%l0,	%i4,	%o3
	add	%o6,	%o5,	%i5
	fnot1	%f14,	%f8
	addc	%i7,	0x179A,	%l7
	or	%o2,	0x1EB0,	%g3
	sethi	0x105D,	%i1
	or	%o7,	%o0,	%l3
	andncc	%l1,	%g2,	%i0
	fand	%f12,	%f0,	%f6
	or	%g6,	0x1541,	%g4
	xor	%l2,	0x1E12,	%i6
	addcc	%g5,	%l6,	%i3
	sllx	%o4,	%l4,	%i2
	xor	%g7,	0x1FF5,	%l5
	xnor	%o1,	0x1B27,	%l0
	bvc,pn	%icc,	loop_727
	add	%o3,	0x0D49,	%o6
	fabsd	%f10,	%f10
	bne,a	loop_728
loop_727:
	fandnot2	%f10,	%f2,	%f4
	srl	%o5,	%i5,	%i4
	sub	%i7,	%o2,	%g1
loop_728:
	fabss	%f0,	%f8
	fornot2s	%f1,	%f0,	%f3
	addcc	%g3,	0x1AFC,	%i1
	fnands	%f7,	%f5,	%f6
	or	%o0,	0x1AE9,	%l3
	orn	%o7,	%g2,	%l1
	or	%l7,	%g4,	%i0
	xorcc	%l2,	0x16EC,	%g6
	fnot2s	%f0,	%f2
	addccc	%l6,	%i6,	%g5
	addcc	%l4,	%i3,	%g7
	xnorcc	%i2,	0x0075,	%l5
	orncc	%o1,	%o4,	%o3
	sethi	0x125F,	%o5
	xnorcc	%o6,	%l0,	%i4
	andncc	%i7,	%g1,	%g3
	srax	%i1,	%i5,	%l3
	andncc	%o7,	%o2,	%l1
	addc	%l7,	%g4,	%i0
	subc	%l2,	%o0,	%l6
	bcc,pt	%icc,	loop_729
	sethi	0x08CC,	%g2
	add	%g5,	%l4,	%i6
	addcc	%g6,	%g7,	%i3
loop_729:
	bne,a	loop_730
	sub	%l5,	%o4,	%o3
	subccc	%o5,	0x08C3,	%o1
	srl	%l0,	0x09,	%i2
loop_730:
	bpos,a	%icc,	loop_731
	sra	%i4,	0x0B,	%g1
	xor	%i7,	0x0339,	%g3
	brnz	%i1,	loop_732
loop_731:
	xorcc	%o6,	0x137C,	%l3
	add	%i5,	%o2,	%o7
	addccc	%g4,	0x019D,	%i0
loop_732:
	subc	%l7,	%l1,	%o0
	brz,a	%l6,	loop_733
	faligndata	%f2,	%f10,	%f12
	subcc	%g5,	0x05D8,	%g2
	fand	%f12,	%f0,	%f8
loop_733:
	bcs,a	%icc,	loop_734
	subcc	%l4,	0x1B16,	%l2
	srax	%g7,	%i3,	%g6
	sethi	0x0BD4,	%i6
loop_734:
	xorcc	%o3,	0x1122,	%l5
	srl	%o4,	%o5,	%i2
	fnot2	%f8,	%f4
	fnands	%f14,	%f6,	%f9
	subc	%l0,	%o1,	%i7
	subcc	%g3,	%i4,	%o6
	brlez	%g1,	loop_735
	orncc	%l3,	0x1D0D,	%o2
	add	%o7,	%g4,	%i0
	xorcc	%i5,	%i1,	%l7
loop_735:
	xnor	%o0,	0x07D1,	%g5
	fsrc2	%f12,	%f12
	addc	%l1,	0x0FC4,	%g2
	sethi	0x0BC1,	%l6
	add	%l2,	%i3,	%l4
	fand	%f0,	%f2,	%f6
	subccc	%g7,	%g6,	%l5
	orncc	%o4,	%o5,	%i2
	sra	%o3,	%o1,	%l0
	xorcc	%i6,	0x153F,	%g3
	and	%o6,	%g1,	%i4
	orncc	%l3,	0x153D,	%o2
	xnorcc	%g4,	%o7,	%i0
	orn	%i1,	0x19FA,	%i5
	fxnor	%f2,	%f2,	%f0
	brnz,a	%l7,	loop_736
	and	%o0,	0x0AEA,	%i7
	fnands	%f6,	%f11,	%f7
	orn	%g5,	%g2,	%l6
loop_736:
	srax	%i3,	%l1,	%g7
	fsrc2s	%f14,	%f1
	srlx	%l2,	%g6,	%l4
	srlx	%l5,	0x0C,	%o4
	sethi	0x1E6B,	%i2
	sub	%o1,	%o5,	%o3
	xnorcc	%g3,	%o6,	%l0
	subccc	%i4,	%i6,	%l3
	addccc	%o2,	%g1,	%i0
	sub	%i1,	0x1B6E,	%o7
	andncc	%i5,	%l7,	%o0
	or	%g4,	%i7,	%g2
	addc	%g5,	0x1175,	%l1
	bpos,a,pn	%icc,	loop_737
	bge,a	%icc,	loop_738
	subccc	%g7,	0x0891,	%l6
	fsrc1	%f4,	%f12
loop_737:
	sllx	%g6,	%l4,	%l5
loop_738:
	andn	%l2,	%i3,	%o1
	fors	%f12,	%f14,	%f5
	xnor	%i2,	0x1B2A,	%o5
	xorcc	%g3,	%o3,	%o6
	brgz	%o4,	loop_739
	bne	%icc,	loop_740
	andn	%l0,	0x1550,	%i4
	orncc	%i6,	0x0EC7,	%o2
loop_739:
	addcc	%i0,	%g1,	%l3
loop_740:
	orn	%i5,	0x1ABB,	%o7
	fnegs	%f7,	%f6
	fxnors	%f0,	%f8,	%f13
	andncc	%l7,	%g4,	%i7
	xor	%o0,	%g5,	%i1
	fmovs	%f1,	%f4
	andncc	%g7,	%g2,	%l1
	orncc	%l4,	%l5,	%l2
	fxnors	%f3,	%f5,	%f5
	bne,a,pt	%xcc,	loop_741
	addccc	%g6,	%l6,	%o1
	andcc	%o5,	0x0C97,	%g3
	fzeros	%f4
loop_741:
	add	%i2,	%i3,	%o3
	fnand	%f8,	%f2,	%f8
	fandnot2s	%f15,	%f10,	%f3
	bcs,pt	%xcc,	loop_742
	sll	%o6,	0x0B,	%i4
	orncc	%i6,	0x02D6,	%o2
	orcc	%i0,	0x1B6C,	%g1
loop_742:
	bge,pt	%xcc,	loop_743
	ble,pt	%xcc,	loop_744
	srlx	%l0,	0x1E,	%l3
	sllx	%i5,	%l7,	%o7
loop_743:
	addcc	%i7,	0x053B,	%o0
loop_744:
	srl	%o4,	0x1A,	%i1
	fxnor	%f12,	%f14,	%f2
	bg,a,pn	%icc,	loop_745
	xor	%g7,	%g4,	%g2
	subccc	%g5,	0x18BE,	%l5
	sethi	0x1634,	%l2
loop_745:
	andncc	%l1,	%l6,	%o1
	fornot2s	%f8,	%f2,	%f12
	fors	%f5,	%f2,	%f3
	and	%g6,	0x1642,	%l4
	subccc	%o5,	0x0C99,	%i3
	or	%i2,	0x070C,	%o3
	fandnot1	%f0,	%f4,	%f2
	xorcc	%i4,	0x15FE,	%o6
	addc	%o2,	%g3,	%i0
	bvs,pt	%xcc,	loop_746
	andncc	%i6,	%l0,	%g1
	addcc	%l7,	%o7,	%i7
	andn	%l3,	0x18DB,	%i5
loop_746:
	addc	%i1,	%o4,	%g7
	fnot1s	%f15,	%f6
	addccc	%g2,	0x11C8,	%g4
	add	%l5,	%o0,	%l2
	xnor	%l6,	0x0FAD,	%g5
	fornot1s	%f13,	%f10,	%f2
	addcc	%g6,	0x1036,	%l1
	fabss	%f3,	%f6
	addccc	%o5,	0x0B19,	%i3
	sll	%l4,	%o3,	%o1
	xnor	%i4,	0x0E31,	%o6
	sub	%i2,	0x0571,	%g3
	fmovd	%f14,	%f10
	andncc	%i6,	%i0,	%l0
	andcc	%l7,	0x04B8,	%o7
	brgz	%o2,	loop_747
	sethi	0x0FA3,	%g1
	sllx	%i5,	%l3,	%i1
	fone	%f2
loop_747:
	xorcc	%o4,	0x1160,	%i7
	fnands	%f4,	%f15,	%f2
	andncc	%g7,	%g4,	%o0
	andncc	%l2,	%l5,	%l6
	sra	%g6,	0x01,	%l1
	sll	%g5,	%g2,	%l4
	fxnor	%f6,	%f4,	%f6
	subcc	%o3,	0x04D7,	%o5
	bcs,pn	%xcc,	loop_748
	fornot2	%f2,	%f12,	%f0
	or	%i4,	%o6,	%i3
	subccc	%o1,	0x05F3,	%i6
loop_748:
	fsrc2	%f8,	%f4
	subc	%i0,	0x1FFC,	%i2
	brgz,a	%g3,	loop_749
	bne,a,pn	%xcc,	loop_750
	fxors	%f2,	%f14,	%f5
	sra	%l7,	0x07,	%o7
loop_749:
	and	%o2,	0x181C,	%l0
loop_750:
	addcc	%l3,	0x13B4,	%i1
	bl,a	%xcc,	loop_751
	or	%g1,	%o4,	%i5
	fmovd	%f4,	%f4
	srl	%i7,	%g7,	%g4
loop_751:
	andncc	%l5,	%o0,	%l6
	addccc	%l1,	0x129E,	%g6
	subccc	%g2,	%l2,	%g5
	fsrc1	%f4,	%f2
	fnot1s	%f8,	%f0
	addc	%l4,	%o5,	%o3
	bleu,a,pt	%icc,	loop_752
	bn,a	loop_753
	bvc,a,pn	%icc,	loop_754
	andncc	%o6,	%o1,	%i3
loop_752:
	andncc	%i0,	%i2,	%i4
loop_753:
	brz,a	%g3,	loop_755
loop_754:
	fxor	%f2,	%f2,	%f12
	addc	%l7,	%o2,	%o7
	and	%l0,	0x1A71,	%l3
loop_755:
	subc	%i1,	0x1FF8,	%g1
	andncc	%i6,	%o4,	%g7
	fsrc2	%f14,	%f8
	addcc	%i5,	0x1278,	%i7
	fmovd	%f14,	%f14
	orcc	%o0,	0x02F8,	%l6
	orcc	%g4,	%l1,	%g2
	sethi	0x166A,	%g6
	fnegs	%f14,	%f5
	addccc	%g5,	0x1165,	%l4
	orcc	%l2,	0x19D8,	%o5
	add	%o6,	0x0209,	%l5
	fandnot2s	%f2,	%f14,	%f8
	sll	%o3,	0x1C,	%i0
	fsrc1s	%f0,	%f9
	sub	%i2,	%i3,	%o1
	and	%g3,	0x02C6,	%i4
	andncc	%l7,	%o2,	%l3
	subcc	%l0,	%i1,	%g1
	subcc	%o7,	0x0A3A,	%o4
	sra	%i5,	0x1A,	%i6
	subcc	%i7,	%g7,	%o0
	bn,a	%xcc,	loop_756
	srax	%g4,	%l6,	%g6
	addc	%g2,	%l1,	%l2
	bvc,a,pn	%xcc,	loop_757
loop_756:
	andn	%g5,	0x062E,	%o6
	and	%l5,	%o5,	%i0
	andncc	%o3,	%i3,	%l4
loop_757:
	orncc	%i2,	%i4,	%g3
	sub	%l7,	0x06A1,	%o1
	xor	%l3,	0x16EF,	%o2
	brz,a	%g1,	loop_758
	bne,pn	%xcc,	loop_759
	subc	%i1,	%l0,	%i5
	add	%o4,	0x0F33,	%i6
loop_758:
	bpos,a,pt	%icc,	loop_760
loop_759:
	subc	%o7,	0x00B9,	%o0
	fornot1	%f10,	%f14,	%f14
	subcc	%g7,	0x0522,	%l6
loop_760:
	ba,pt	%icc,	loop_761
	fand	%f12,	%f10,	%f10
	sethi	0x1F78,	%g4
	sra	%i7,	%g2,	%l1
loop_761:
	fnot1	%f2,	%f6
	srax	%l2,	%g5,	%o6
	sra	%o5,	%l5,	%i0
	addcc	%o3,	0x0C17,	%g6
	andncc	%i3,	%l4,	%i2
	add	%g3,	0x13D3,	%o1
	fnot2s	%f13,	%f11
	addccc	%l7,	0x1A46,	%o2
	fnot2s	%f7,	%f8
	xorcc	%l3,	0x1668,	%g1
	fnot2s	%f6,	%f8
	sub	%l0,	%i1,	%i4
	xnor	%o4,	%i5,	%i6
	fandnot1	%f4,	%f10,	%f0
	ba,a	%xcc,	loop_762
	andn	%o0,	0x07BD,	%o7
	subc	%l6,	0x12A5,	%g7
	addccc	%g2,	%i7,	%l1
loop_762:
	fxnor	%f6,	%f10,	%f4
	or	%g4,	%o6,	%l2
	sra	%l5,	%g5,	%o5
	for	%f14,	%f2,	%f0
	orncc	%o3,	%i0,	%l4
	bvc,pt	%xcc,	loop_763
	sll	%i2,	%g6,	%g3
	fands	%f11,	%f8,	%f12
	orcc	%l7,	0x05A9,	%o2
loop_763:
	brz	%i3,	loop_764
	xorcc	%l3,	0x179A,	%g1
	addccc	%l0,	%o1,	%i1
	sll	%i5,	%i6,	%o0
loop_764:
	bn,a,pn	%icc,	loop_765
	fnand	%f8,	%f4,	%f6
	add	%o7,	0x145C,	%o4
	addccc	%g7,	%l6,	%g2
loop_765:
	addcc	%l1,	0x0195,	%g4
	addc	%i7,	%o6,	%i4
	srl	%g5,	%l5,	%o3
	orcc	%l2,	0x161D,	%i0
	andn	%o5,	%g6,	%i2
	andcc	%g3,	%l7,	%i3
	bne	%xcc,	loop_766
	andn	%l3,	%l4,	%o2
	sethi	0x1795,	%g1
	orncc	%o1,	0x13E0,	%i1
loop_766:
	orn	%i5,	0x166F,	%l0
	subcc	%i6,	0x1E0F,	%o0
	srax	%o7,	0x0F,	%o4
	ble,a	loop_767
	fnand	%f6,	%f0,	%f8
	fone	%f0
	bleu,a,pt	%xcc,	loop_768
loop_767:
	addccc	%g2,	%l6,	%g4
	ble	%icc,	loop_769
	bg	loop_770
loop_768:
	and	%i7,	0x178A,	%g7
	subc	%l1,	0x148D,	%o6
loop_769:
	srax	%l5,	0x03,	%o3
loop_770:
	sub	%g5,	%l2,	%i4
	fornot2	%f2,	%f4,	%f10
	fnot2	%f10,	%f0
	fmovs	%f8,	%f5
	srax	%o5,	0x1B,	%i0
	addc	%i2,	%l7,	%g6
	subc	%g3,	%i3,	%o2
	fornot2s	%f0,	%f13,	%f13
	fxors	%f0,	%f12,	%f0
	srl	%l3,	0x1C,	%o1
	andncc	%l4,	%g1,	%i5
	andcc	%i6,	%l0,	%o7
	be	%xcc,	loop_771
	bl,a	loop_772
	fnands	%f6,	%f1,	%f13
	sub	%o0,	%i1,	%l6
loop_771:
	bne,a	%icc,	loop_773
loop_772:
	brgez,a	%o4,	loop_774
	subccc	%g2,	0x05D5,	%g4
	xnorcc	%l1,	%o6,	%g7
loop_773:
	sra	%i7,	0x10,	%l5
loop_774:
	addc	%l2,	%g5,	%i4
	brlez	%o3,	loop_775
	fnands	%f10,	%f9,	%f3
	sethi	0x001C,	%i2
	subccc	%i0,	0x1742,	%g6
loop_775:
	addcc	%o5,	0x13D8,	%i3
	andn	%g3,	%l7,	%l3
	bcs,a	%xcc,	loop_776
	sub	%o2,	0x100C,	%l4
	sll	%i5,	0x0C,	%g1
	brgz	%o1,	loop_777
loop_776:
	srlx	%l0,	0x05,	%o7
	subccc	%i6,	0x061D,	%i1
	subc	%o0,	%l6,	%g4
loop_777:
	sllx	%g2,	0x13,	%o4
	sra	%o6,	%i7,	%l1
	sethi	0x18F2,	%g7
	andncc	%l2,	%l5,	%g5
	fornot2s	%f5,	%f2,	%f8
	fsrc1	%f14,	%f4
	orncc	%i4,	0x1A2E,	%o3
	sub	%g6,	%o5,	%i0
	or	%i3,	%l7,	%g3
	be,pt	%icc,	loop_778
	fand	%f6,	%f12,	%f14
	andn	%o2,	%i2,	%l4
	xnorcc	%i5,	0x167F,	%l3
loop_778:
	xnor	%o1,	0x1917,	%l0
	xnorcc	%i6,	%i1,	%o7
	bcc,a	%icc,	loop_779
	fzeros	%f4
	andncc	%o0,	%g1,	%g4
	fsrc2s	%f11,	%f6
loop_779:
	be	loop_780
	bvs,a,pt	%icc,	loop_781
	sra	%l6,	0x06,	%g2
	or	%o4,	%l1,	%i7
loop_780:
	sra	%o6,	0x1F,	%g7
loop_781:
	orncc	%l5,	%i4,	%l2
	andncc	%g6,	%o5,	%g5
	addcc	%i3,	%o3,	%l7
	sra	%g3,	%i2,	%i0
	orcc	%i5,	0x19E6,	%l3
	brnz	%o1,	loop_782
	subccc	%o2,	0x0754,	%l0
	addcc	%l4,	%o7,	%o0
	fsrc1s	%f0,	%f4
loop_782:
	fnands	%f5,	%f11,	%f12
	xnor	%i6,	%i1,	%g1
	sub	%g4,	0x07D9,	%l6
	fzero	%f4
	subc	%l1,	0x1E89,	%g2
	be,a	loop_783
	fxor	%f10,	%f12,	%f12
	bvc,pn	%icc,	loop_784
	fsrc2s	%f4,	%f2
loop_783:
	subcc	%o4,	%i7,	%l5
	srax	%g7,	%i4,	%g6
loop_784:
	subcc	%o6,	0x1595,	%l2
	be,a,pt	%xcc,	loop_785
	xnorcc	%i3,	%g5,	%o3
	fnands	%f5,	%f9,	%f6
	andncc	%g3,	%i2,	%o5
loop_785:
	fone	%f2
	sllx	%i0,	0x1E,	%l3
	fnot1s	%f4,	%f8
	subc	%o1,	0x0A3D,	%l7
	sra	%i5,	0x08,	%o2
	fxors	%f1,	%f7,	%f10
	addcc	%l4,	%l0,	%i6
	srl	%i1,	0x13,	%o7
	fzero	%f10
	sra	%g1,	0x17,	%l6
	be,pn	%xcc,	loop_786
	fabss	%f14,	%f14
	addccc	%l1,	%g2,	%g4
	srax	%o4,	%i7,	%o0
loop_786:
	sra	%l5,	%i4,	%o6
	fzero	%f12
	sllx	%g6,	0x15,	%l2
	bpos,a	loop_787
	sllx	%g5,	%g7,	%g3
	or	%i2,	%i3,	%o5
	subccc	%i0,	0x199C,	%o3
loop_787:
	and	%l7,	0x0114,	%o1
	fzero	%f10
	orcc	%l3,	%o2,	%i5
	xorcc	%l4,	%i6,	%l0
	fnors	%f1,	%f9,	%f9
	xnorcc	%o7,	0x080A,	%l6
	xor	%l1,	%g1,	%g2
	sll	%o4,	0x07,	%g4
	andncc	%o0,	%i1,	%l5
	andncc	%o6,	%g6,	%l2
	fands	%f2,	%f6,	%f9
	sub	%i7,	%i4,	%g7
	addc	%g3,	%i2,	%g5
	fands	%f11,	%f5,	%f11
	fsrc2	%f0,	%f2
	subcc	%o5,	%i0,	%l7
	bcc,a,pn	%icc,	loop_788
	subccc	%o1,	0x052E,	%l3
	sllx	%i3,	%o3,	%o2
	bge,a	loop_789
loop_788:
	bpos	%icc,	loop_790
	sll	%i5,	0x01,	%l4
	addccc	%o7,	0x115A,	%i6
loop_789:
	xnor	%l0,	0x07D4,	%l6
loop_790:
	srlx	%l1,	%g1,	%o4
	add	%o0,	0x0263,	%i1
	srl	%l5,	0x0D,	%o6
	fnot1s	%f8,	%f1
	fnot1	%f0,	%f10
	andcc	%g4,	%g6,	%l2
	fxnor	%f14,	%f6,	%f6
	and	%g2,	0x098D,	%i7
	fsrc2s	%f0,	%f5
	orn	%g7,	0x063B,	%i2
	add	%i4,	0x0AB2,	%g5
	or	%i0,	0x1952,	%o5
	bleu,pt	%xcc,	loop_791
	bpos,a,pn	%icc,	loop_792
	subcc	%g3,	0x10C6,	%o1
	brgez	%i3,	loop_793
loop_791:
	addcc	%l7,	%o3,	%i5
loop_792:
	bgu,pn	%xcc,	loop_794
	sllx	%l4,	0x1C,	%l3
loop_793:
	subc	%o2,	%l0,	%l6
	orcc	%l1,	0x08C3,	%i6
loop_794:
	sll	%o4,	0x16,	%o7
	fnegd	%f6,	%f2
	addcc	%o0,	%g1,	%o6
	bn	%xcc,	loop_795
	fabss	%f6,	%f8
	bl	loop_796
	sll	%l5,	0x13,	%g4
loop_795:
	srl	%l2,	0x0A,	%g2
	andcc	%g6,	%g7,	%i1
loop_796:
	or	%i4,	0x10CB,	%i7
	addccc	%i0,	%g5,	%i2
	srl	%o1,	0x16,	%g3
	fandnot2s	%f5,	%f4,	%f4
	xor	%l7,	%o3,	%i3
	sra	%i5,	%l3,	%l4
	or	%o5,	%l0,	%l6
	addc	%i6,	%o4,	%o7
	bvs,a	loop_797
	sllx	%o2,	%o0,	%o6
	bne,pn	%icc,	loop_798
	andn	%l5,	%g4,	%l2
loop_797:
	fsrc2s	%f11,	%f12
	bvs,pn	%xcc,	loop_799
loop_798:
	srlx	%g2,	%g6,	%g1
	for	%f6,	%f4,	%f8
	xor	%l1,	0x1FED,	%g7
loop_799:
	sll	%i1,	0x02,	%i4
	sethi	0x1C6B,	%i0
	sethi	0x0C4D,	%i2
	srlx	%g5,	%o1,	%l7
	bpos,a	%xcc,	loop_800
	andncc	%o3,	%i7,	%i5
	bvc,a,pt	%xcc,	loop_801
	fnor	%f8,	%f12,	%f10
loop_800:
	and	%i3,	0x0AAA,	%l3
	fxnors	%f1,	%f3,	%f15
loop_801:
	brgz,a	%l4,	loop_802
	bge,pt	%xcc,	loop_803
	fsrc2s	%f9,	%f14
	subccc	%o5,	%l0,	%g3
loop_802:
	orcc	%i6,	0x04FB,	%o7
loop_803:
	xorcc	%l6,	%o2,	%o4
	bg,pt	%xcc,	loop_804
	srlx	%o6,	%l5,	%l2
	andn	%g4,	%g2,	%g6
	sub	%g1,	0x1862,	%o0
loop_804:
	bge,a,pn	%icc,	loop_805
	fnegd	%f2,	%f6
	subc	%l1,	0x0A34,	%i1
	addccc	%g7,	%i0,	%i2
loop_805:
	fxors	%f7,	%f0,	%f3
	and	%g5,	%i4,	%o1
	fors	%f4,	%f15,	%f11
	fzero	%f0
	fxnor	%f6,	%f6,	%f6
	andncc	%o3,	%i5,	%i7
	fornot2s	%f3,	%f4,	%f0
	andcc	%i3,	%l7,	%l3
	srax	%l4,	0x04,	%o5
	sll	%g3,	%i6,	%o7
	xnorcc	%l0,	0x1F7B,	%l6
	subc	%o6,	%o4,	%o2
	fands	%f0,	%f11,	%f6
	fone	%f4
	fnand	%f14,	%f4,	%f8
	orncc	%l2,	%l5,	%g2
	xnor	%g1,	%g4,	%g6
	fandnot1s	%f9,	%f7,	%f8
	andn	%i1,	0x17ED,	%l1
	srl	%g7,	0x12,	%o0
	xor	%i0,	0x1EA4,	%i2
	subcc	%g5,	0x112C,	%o3
	xnorcc	%o1,	0x0314,	%i5
	fxnors	%f6,	%f7,	%f2
	and	%i4,	0x1174,	%i3
	addccc	%i7,	%l4,	%o5
	addccc	%l7,	0x0325,	%g3
	fnegd	%f4,	%f4
	sub	%l3,	0x01E9,	%l0
	bn,a	%icc,	loop_806
	bl,a	%icc,	loop_807
	ble,a	loop_808
	subccc	%o7,	0x1264,	%i6
loop_806:
	bvc	%xcc,	loop_809
loop_807:
	xorcc	%o4,	%l6,	%o2
loop_808:
	orcc	%l5,	%o6,	%g1
	bge,a	loop_810
loop_809:
	andncc	%l2,	%g4,	%g6
	xnor	%i1,	%g7,	%l1
	andcc	%i0,	0x00DC,	%o0
loop_810:
	faligndata	%f0,	%f4,	%f0
	subccc	%g2,	0x0BC9,	%i2
	andn	%g5,	0x026F,	%i5
	fxnor	%f4,	%f14,	%f6
	sethi	0x0286,	%i4
	brz	%o3,	loop_811
	andcc	%o1,	%i7,	%i3
	xor	%o5,	0x15C3,	%g3
	fsrc2s	%f14,	%f6
loop_811:
	fornot2	%f8,	%f0,	%f14
	subccc	%l7,	%l0,	%l4
	add	%l3,	%i6,	%o7
	orn	%l6,	0x1741,	%l5
	fsrc1s	%f13,	%f3
	addc	%o4,	0x0730,	%o2
	bneg,a	loop_812
	fxnor	%f14,	%f2,	%f2
	addcc	%o6,	0x1255,	%l2
	sub	%g4,	0x0C39,	%g6
loop_812:
	fnor	%f10,	%f2,	%f2
	fnands	%f0,	%f6,	%f14
	fnands	%f8,	%f1,	%f14
	addccc	%g7,	%i1,	%l1
	fornot1	%f10,	%f2,	%f10
	fmovd	%f0,	%f0
	bvs,a,pn	%xcc,	loop_813
	fors	%f15,	%f13,	%f15
	sll	%g1,	%i0,	%i2
	and	%g5,	%o0,	%g2
loop_813:
	fornot1	%f6,	%f12,	%f10
	addcc	%o3,	%i4,	%i7
	subcc	%o1,	%i3,	%o5
	sub	%l7,	0x1D0E,	%i5
	bl,a,pt	%icc,	loop_814
	xorcc	%l4,	%l0,	%l3
	srl	%i6,	0x0F,	%l6
	srl	%g3,	0x04,	%o4
loop_814:
	fabsd	%f4,	%f4
	orncc	%o2,	%o7,	%l5
	fsrc1s	%f4,	%f0
	sub	%l2,	%o6,	%g7
	fand	%f6,	%f14,	%f14
	fxors	%f12,	%f6,	%f6
	orn	%g4,	%g6,	%i1
	fxnors	%f7,	%f12,	%f14
	orcc	%i0,	%i2,	%l1
	andcc	%o0,	%g1,	%g2
	or	%i4,	0x072C,	%g5
	or	%i7,	%o3,	%o5
	fnor	%f10,	%f2,	%f8
	bleu,pn	%xcc,	loop_815
	xnorcc	%o1,	%i5,	%l7
	subcc	%i3,	0x0DFF,	%l4
	sllx	%l0,	0x01,	%i6
loop_815:
	addcc	%l6,	%l3,	%o4
	srlx	%o2,	%o7,	%l5
	orn	%l2,	0x01E5,	%g7
	orncc	%o6,	%g4,	%i1
	fxor	%f14,	%f6,	%f0
	brgez,a	%i0,	loop_816
	and	%i2,	0x01C4,	%l1
	sethi	0x0778,	%g3
	addc	%g6,	0x1B63,	%g2
loop_816:
	fnor	%f8,	%f4,	%f2
	sethi	0x1B12,	%g1
	xnor	%o0,	0x1766,	%i4
	fabsd	%f0,	%f2
	orcc	%g5,	%i7,	%o1
	xnorcc	%o5,	0x1ABC,	%i5
	subccc	%i3,	%l4,	%l0
	fandnot2s	%f13,	%f2,	%f11
	ba,a	%xcc,	loop_817
	add	%o3,	%l7,	%l6
	ba,pn	%xcc,	loop_818
	sll	%i6,	0x07,	%o4
loop_817:
	xnor	%l3,	0x047D,	%o7
	subccc	%l5,	%l2,	%o6
loop_818:
	andcc	%o2,	0x014F,	%g7
	fnot2	%f10,	%f4
	srl	%i1,	0x1C,	%g4
	bvc,pt	%xcc,	loop_819
	xnorcc	%l1,	%i2,	%g3
	andn	%g2,	0x15E1,	%g6
	fzeros	%f13
loop_819:
	bpos,a,pt	%icc,	loop_820
	addc	%g1,	%i4,	%i0
	xorcc	%o0,	0x1FB0,	%i7
	fornot2	%f14,	%f10,	%f0
loop_820:
	xor	%o1,	%i5,	%i3
	ble,a	%xcc,	loop_821
	xorcc	%l4,	0x0D53,	%o5
	xnor	%g5,	0x07AA,	%l0
	sllx	%l6,	%o3,	%l7
loop_821:
	srax	%i6,	%o4,	%o7
	fors	%f9,	%f13,	%f7
	fmovs	%f2,	%f5
	bge,a	loop_822
	addcc	%l2,	0x035A,	%l5
	add	%l3,	%o6,	%g7
	or	%g4,	0x1CCB,	%i1
loop_822:
	fzeros	%f12
	brlez	%o2,	loop_823
	sllx	%g3,	0x11,	%i2
	addc	%l1,	0x128B,	%g2
	subc	%g6,	%i4,	%g1
loop_823:
	fnot1	%f6,	%f12
	xor	%i0,	0x1CF8,	%i7
	xorcc	%i5,	0x0E33,	%i3
	xnorcc	%l4,	%o5,	%g5
	subcc	%o1,	%l0,	%l6
	xor	%l7,	0x0FE1,	%o3
	fandnot2s	%f1,	%f12,	%f13
	bl,a	loop_824
	for	%f2,	%f6,	%f12
	xnor	%o4,	0x05AC,	%o0
	and	%l2,	0x108D,	%i6
loop_824:
	addcc	%l5,	%l3,	%o6
	bn,a	loop_825
	subcc	%o7,	%g4,	%o2
	bcs,pn	%xcc,	loop_826
	addc	%g3,	%g7,	%i2
loop_825:
	sethi	0x184A,	%g2
	fandnot1	%f2,	%f6,	%f12
loop_826:
	bvs,a	loop_827
	add	%l1,	0x062B,	%g6
	sllx	%i4,	%i0,	%i1
	srax	%g1,	%i3,	%l4
loop_827:
	and	%i7,	%i5,	%o1
	srax	%g5,	0x01,	%l0
	fones	%f8
	fxnor	%f10,	%f0,	%f10
	addcc	%o5,	0x0A1A,	%o3
	subc	%l7,	0x0411,	%l6
	addc	%l2,	0x0B65,	%o4
	sub	%l5,	%o0,	%o6
	fnot2s	%f11,	%f3
	andncc	%l3,	%i6,	%g4
	addccc	%o2,	%g3,	%i2
	fabss	%f14,	%f8
	fxnors	%f15,	%f6,	%f3
	addc	%o7,	%l1,	%g2
	orn	%g6,	%i4,	%i0
	be,pt	%icc,	loop_828
	addccc	%g1,	0x189D,	%i3
	xnorcc	%l4,	0x108E,	%i1
	xnorcc	%g7,	%o1,	%g5
loop_828:
	xnorcc	%i5,	0x19C2,	%l0
	orn	%i7,	%o5,	%l6
	fnors	%f6,	%f11,	%f5
	sethi	0x1451,	%l7
	brgz	%o4,	loop_829
	addc	%l5,	0x159A,	%l2
	sethi	0x1C5A,	%o3
	and	%l3,	%o6,	%o0
loop_829:
	sll	%o2,	0x1F,	%i6
	subc	%g4,	0x0476,	%o7
	andn	%g3,	0x0EB6,	%l1
	add	%i2,	%g6,	%i0
	orn	%g1,	%i4,	%i3
	addc	%i1,	%g7,	%l4
	fand	%f6,	%f4,	%f10
	xorcc	%g5,	%g2,	%i5
	and	%i7,	%o1,	%l0
	srax	%o5,	0x1B,	%o4
	fnot2s	%f15,	%f15
	fsrc1	%f8,	%f6
	srl	%l5,	%l2,	%l6
	orcc	%l3,	%l7,	%o6
	addcc	%o0,	0x1D1D,	%o3
	fandnot1s	%f13,	%f6,	%f14
	andncc	%o2,	%o7,	%i6
	sra	%g4,	%l1,	%i2
	sllx	%g3,	%g6,	%i0
	fandnot2s	%f2,	%f0,	%f4
	fabss	%f11,	%f8
	xorcc	%g1,	0x014A,	%i1
	fornot2s	%f4,	%f15,	%f6
	fsrc2s	%f2,	%f9
	fsrc2s	%f10,	%f8
	srl	%i4,	0x1B,	%l4
	sra	%g7,	%i3,	%g2
	subccc	%g5,	%i7,	%l0
	add	%o1,	%i5,	%o4
	xnorcc	%l5,	%o5,	%l6
	fzeros	%f9
	addcc	%l3,	%l2,	%o6
	fnands	%f3,	%f11,	%f15
	fnors	%f7,	%f14,	%f11
	fnot2	%f8,	%f14
	subcc	%o0,	0x10C3,	%o2
	subcc	%l7,	0x1C02,	%i6
	srax	%o7,	0x16,	%g4
	bneg,a,pn	%icc,	loop_830
	bneg,a,pt	%xcc,	loop_831
	and	%i2,	%o3,	%g3
	sra	%g6,	0x1C,	%i0
loop_830:
	orncc	%g1,	0x02D7,	%i1
loop_831:
	fandnot2	%f2,	%f6,	%f14
	fnot1s	%f11,	%f5
	orcc	%l1,	0x1662,	%i4
	sll	%i3,	0x18,	%l4
	fornot1	%f0,	%f12,	%f8
	xor	%g7,	%i7,	%g5
	ba,a,pn	%xcc,	loop_832
	andncc	%o1,	%i5,	%g2
	xorcc	%l0,	%l5,	%o4
	subcc	%l6,	%l3,	%l2
loop_832:
	bcc,a	%xcc,	loop_833
	orn	%o6,	0x1517,	%o2
	andn	%l7,	%o0,	%o7
	sra	%o5,	0x06,	%i6
loop_833:
	bn,pt	%icc,	loop_834
	orncc	%g4,	0x101E,	%g3
	bcc,a	%xcc,	loop_835
	fabss	%f6,	%f7
loop_834:
	ba	loop_836
	fandnot1s	%f2,	%f6,	%f3
loop_835:
	addcc	%i2,	0x02D2,	%o3
	or	%g1,	%i1,	%g6
loop_836:
	andn	%i4,	0x1847,	%i0
	subc	%l4,	%l1,	%i7
	fxnors	%f0,	%f0,	%f8
	andncc	%g5,	%g7,	%i5
	sethi	0x0CCE,	%g2
	subccc	%i3,	0x1A72,	%l5
	xor	%o4,	%l0,	%l6
	andn	%l3,	0x080C,	%o6
	fmovs	%f14,	%f14
	addcc	%l2,	0x09E2,	%o1
	fxor	%f4,	%f12,	%f14
	srlx	%l7,	%o0,	%o2
	srax	%i6,	%g4,	%g3
	be	%xcc,	loop_837
	add	%o7,	0x0D43,	%o3
	sub	%i2,	%i1,	%o5
	faligndata	%f4,	%f12,	%f0
loop_837:
	subcc	%g1,	0x1997,	%i0
	fands	%f5,	%f0,	%f9
	fsrc1	%f14,	%f2
	sra	%i4,	0x1C,	%g6
	add	%l4,	%i7,	%g5
	fsrc2s	%f12,	%f10
	orcc	%l1,	0x039B,	%g2
	addc	%i5,	0x13BB,	%i3
	bleu,a	loop_838
	andcc	%g7,	0x08C4,	%l5
	fornot2s	%f0,	%f8,	%f9
	brlez	%l6,	loop_839
loop_838:
	add	%l0,	%o6,	%l2
	sll	%o4,	%o1,	%l3
	addccc	%l7,	%o0,	%o2
loop_839:
	fzeros	%f7
	fsrc1	%f14,	%f12
	fnot1	%f10,	%f8
	orncc	%g4,	%o7,	%i6
	or	%o3,	0x02E1,	%i2
	brgez	%o5,	loop_840
	xnorcc	%g3,	%i0,	%g1
	or	%i1,	0x03CF,	%l4
	sethi	0x01E6,	%i7
loop_840:
	orcc	%i4,	0x119B,	%g5
	brnz,a	%l1,	loop_841
	bvs,pn	%icc,	loop_842
	add	%g6,	0x17A1,	%i5
	srax	%i3,	0x02,	%g2
loop_841:
	srlx	%l6,	%l5,	%o6
loop_842:
	bg	%icc,	loop_843
	fandnot2	%f10,	%f12,	%f2
	andn	%l2,	0x04DD,	%o4
	fors	%f1,	%f4,	%f12
loop_843:
	fzeros	%f8
	srl	%g7,	%o1,	%l7
	bn,a,pt	%icc,	loop_844
	xnorcc	%l0,	%o0,	%o2
	fnot1s	%f1,	%f7
	srax	%o7,	%g4,	%o3
loop_844:
	bgu,a	loop_845
	addcc	%i6,	%l3,	%g3
	brgz	%i2,	loop_846
	ba,a	%xcc,	loop_847
loop_845:
	xorcc	%o5,	%i0,	%g1
	subccc	%i7,	0x07FC,	%i4
loop_846:
	orn	%i1,	0x15A7,	%l4
loop_847:
	bcc,a	%icc,	loop_848
	andn	%g6,	%i5,	%g5
	fornot2s	%f5,	%f11,	%f4
	srl	%i3,	%l6,	%g2
loop_848:
	fnot1s	%f11,	%f1
	andn	%o6,	0x0686,	%l1
	fnand	%f6,	%f4,	%f8
	subccc	%l2,	0x0D06,	%g7
	andn	%l5,	%o4,	%l7
	addccc	%o0,	%o1,	%o2
	fornot2	%f12,	%f8,	%f4
	sll	%l0,	%o3,	%o7
	srl	%l3,	%g4,	%i2
	xorcc	%o5,	0x0F2D,	%g3
	bg,a	%icc,	loop_849
	orn	%i0,	0x1F22,	%g1
	bcs,a	%xcc,	loop_850
	fnot2s	%f8,	%f0
loop_849:
	andncc	%i7,	%i1,	%i6
	brlez,a	%i4,	loop_851
loop_850:
	andn	%g6,	%l4,	%g5
	xnor	%l6,	%g2,	%o6
	xnorcc	%i5,	0x0A43,	%i3
loop_851:
	subccc	%l2,	0x156F,	%l1
	orn	%g7,	%o4,	%l5
	srax	%o1,	0x16,	%l7
	orncc	%l0,	0x0B68,	%o3
	xor	%o7,	%l3,	%o2
	fnor	%f10,	%f0,	%f10
	be,a,pt	%xcc,	loop_852
	xnor	%o0,	%o5,	%i2
	fone	%f10
	xnor	%g4,	0x072C,	%i0
loop_852:
	and	%g1,	0x19CB,	%i7
	srlx	%g3,	%i6,	%i1
	addc	%g6,	0x0378,	%l4
	sub	%g5,	0x0A46,	%g2
	sll	%i4,	0x0C,	%i5
	fnand	%f6,	%f12,	%f14
	bn	loop_853
	subc	%i3,	%o6,	%l6
	addcc	%l1,	0x00AA,	%o4
	and	%l2,	0x0126,	%g7
loop_853:
	fors	%f14,	%f6,	%f4
	xorcc	%l5,	0x01AD,	%l7
	xnorcc	%o3,	%o1,	%o7
	andcc	%l3,	0x1BC1,	%l0
	brnz	%o2,	loop_854
	andcc	%i2,	%g4,	%o0
	add	%i0,	0x1A91,	%i7
	fzeros	%f8
loop_854:
	fone	%f8
	sub	%g1,	%o5,	%g3
	addcc	%i6,	%l4,	%i1
	and	%g5,	0x1EC7,	%g2
	fornot1	%f6,	%f6,	%f4
	fsrc2s	%f8,	%f0
	srax	%i5,	%g6,	%i4
	addc	%o6,	%l6,	%i3
	and	%l1,	%g7,	%l2
	sra	%o4,	0x04,	%l7
	brlez	%o3,	loop_855
	and	%o1,	0x0BBF,	%l3
	addccc	%l5,	%l0,	%o2
	fmovd	%f2,	%f2
loop_855:
	srlx	%o7,	%o0,	%i2
	xnorcc	%i0,	0x155B,	%i7
	bgu	loop_856
	sub	%g4,	%g3,	%g1
	fnot1s	%f8,	%f5
	subccc	%i6,	0x1E2D,	%l4
loop_856:
	brnz,a	%i1,	loop_857
	bvc,a,pn	%icc,	loop_858
	andn	%o5,	%g5,	%i5
	srax	%g2,	%o6,	%g6
loop_857:
	subccc	%i4,	%l6,	%i3
loop_858:
	andcc	%l1,	0x1601,	%g7
	sll	%l2,	0x1B,	%o3
	or	%o1,	0x1531,	%l3
	srlx	%o4,	0x08,	%l5
	sub	%l0,	0x1E9F,	%l7
	be,pn	%xcc,	loop_859
	subccc	%o2,	0x0A89,	%i2
	bleu,a	%xcc,	loop_860
	fsrc2	%f10,	%f12
loop_859:
	orn	%o7,	0x08D5,	%o0
	fornot2s	%f6,	%f3,	%f14
loop_860:
	addccc	%i0,	%g4,	%g3
	fornot2	%f12,	%f4,	%f12
	subccc	%i7,	%i6,	%l4
	sub	%i1,	0x06D8,	%o5
	ba,a	%icc,	loop_861
	sllx	%g1,	%i5,	%o6
	fxnor	%f0,	%f2,	%f8
	bn	%icc,	loop_862
loop_861:
	subc	%g5,	0x1E36,	%g6
	fandnot1	%f2,	%f6,	%f14
	subc	%l6,	%i3,	%g2
loop_862:
	srax	%g7,	0x00,	%i4
	bvc,pt	%xcc,	loop_863
	sra	%o3,	0x1A,	%l1
	fone	%f0
	brlz	%l2,	loop_864
loop_863:
	srax	%l3,	0x1D,	%l5
	bvc,pt	%xcc,	loop_865
	orn	%o1,	%l7,	%o4
loop_864:
	andcc	%o2,	%o7,	%i2
	fnand	%f0,	%f14,	%f10
loop_865:
	fmovs	%f9,	%f10
	sllx	%l0,	0x17,	%g4
	be,pn	%xcc,	loop_866
	andn	%o0,	%g3,	%i7
	sllx	%i0,	%i1,	%l4
	subccc	%o5,	%i6,	%o6
loop_866:
	fnegs	%f13,	%f2
	faligndata	%f6,	%f6,	%f4
	subccc	%g5,	%i5,	%g6
	xnorcc	%g1,	0x163F,	%g2
	sethi	0x048C,	%l6
	bge,pt	%xcc,	loop_867
	sethi	0x0274,	%i3
	fxnors	%f13,	%f1,	%f11
	fnand	%f2,	%f10,	%f8
loop_867:
	fabss	%f2,	%f5
	fzeros	%f4
	sethi	0x165C,	%i4
	subcc	%l1,	0x1910,	%g7
	orncc	%l3,	%l2,	%o1
	xnorcc	%l5,	%l7,	%o2
	addccc	%o7,	%o4,	%l0
	sllx	%o3,	%g4,	%i2
	xorcc	%o0,	%i0,	%i7
	andn	%g3,	0x17CE,	%l4
	sll	%o5,	0x06,	%o6
	xorcc	%i1,	%g5,	%i6
	and	%g1,	%g2,	%i5
	fsrc1s	%f11,	%f6
	addc	%i3,	%i4,	%l1
	be,a,pn	%xcc,	loop_868
	andcc	%g6,	0x0F90,	%g7
	orcc	%l6,	0x1E8F,	%l3
	fnot2	%f14,	%f10
loop_868:
	fsrc2	%f12,	%f0
	add	%l2,	%l7,	%o2
	subcc	%o1,	0x0043,	%l5
	subcc	%l0,	0x0A28,	%o4
	add	%o3,	0x197D,	%g4
	srax	%o7,	%i2,	%i7
	sllx	%i0,	%o0,	%o5
	xorcc	%g3,	%l4,	%i1
	srl	%i6,	0x0D,	%g5
	andcc	%g2,	%o6,	%i5
	fsrc2	%f0,	%f2
	for	%f4,	%f10,	%f4
	fzeros	%f8
	add	%i4,	%l1,	%g1
	and	%i3,	%l6,	%g7
	srl	%l3,	0x0B,	%l2
	bcs,a,pn	%icc,	loop_869
	xnorcc	%l7,	%g6,	%o1
	and	%o2,	%l0,	%o4
	or	%l5,	0x08C6,	%g4
loop_869:
	brgez	%o7,	loop_870
	fone	%f0
	sll	%i7,	%i0,	%i2
	subccc	%o0,	%g3,	%o3
loop_870:
	fxor	%f10,	%f2,	%f6
	and	%o5,	0x05DE,	%i1
	xorcc	%i6,	%g5,	%g2
	addcc	%l4,	0x1CA8,	%i5
	addccc	%o6,	%g1,	%i4
	and	%l1,	0x06AB,	%g7
	or	%l6,	0x0D37,	%l2
	orcc	%l7,	0x1316,	%g6
	or	%l3,	0x1A77,	%i3
	fnand	%f10,	%f8,	%f14
	sll	%o2,	0x16,	%o1
	fnands	%f14,	%f0,	%f6
	subcc	%l5,	0x1CA3,	%g4
	addc	%l0,	0x1CF2,	%o4
	orn	%i7,	0x1FD5,	%i2
	bgu,a,pt	%icc,	loop_871
	fxors	%f5,	%f12,	%f4
	andncc	%i0,	%o7,	%g3
	orcc	%o5,	%o0,	%o3
loop_871:
	add	%i1,	%g5,	%i6
	bpos	loop_872
	xnor	%g2,	%i5,	%g1
	xorcc	%o6,	0x05EB,	%i4
	xor	%l1,	0x1613,	%g7
loop_872:
	subccc	%l2,	0x15AE,	%l4
	subccc	%l6,	%g6,	%i3
	xor	%o2,	0x18D2,	%l7
	fsrc2s	%f12,	%f3
	fmovs	%f1,	%f2
	sethi	0x0B51,	%l5
	subcc	%l3,	%l0,	%o4
	brnz	%o1,	loop_873
	sra	%g4,	0x1B,	%i7
	fsrc1	%f10,	%f10
	sub	%i2,	%o7,	%g3
loop_873:
	or	%o0,	%o5,	%i0
	addc	%g5,	%i1,	%i6
	or	%i5,	%g1,	%o6
	srl	%g2,	%l1,	%i4
	fnand	%f10,	%f8,	%f4
	fxor	%f2,	%f0,	%f6
	orcc	%l2,	0x1035,	%o3
	fone	%f4
	xorcc	%l4,	0x039A,	%g6
	ba	loop_874
	subcc	%l6,	0x087F,	%i3
	xorcc	%g7,	0x01B9,	%o2
	srl	%l5,	0x16,	%l3
loop_874:
	bge,pn	%icc,	loop_875
	subc	%l0,	0x1309,	%l7
	and	%o1,	%g4,	%i7
	fxnor	%f12,	%f4,	%f10
loop_875:
	subcc	%o7,	0x0AFE,	%o4
	bn,a	%icc,	loop_876
	sethi	0x09A2,	%o0
	addccc	%g3,	0x1DC4,	%o5
	andcc	%i0,	0x1219,	%i2
loop_876:
	andcc	%i1,	%g5,	%i5
	subcc	%g1,	0x1C40,	%g2
	orcc	%o6,	%i6,	%l2
	srl	%i4,	%l4,	%o3
	sub	%l1,	0x18AF,	%g6
	fzero	%f12
	fmovd	%f2,	%f8
	brnz,a	%l6,	loop_877
	sllx	%g7,	%l5,	%o2
	bpos,pn	%icc,	loop_878
	xorcc	%i3,	0x0299,	%l7
loop_877:
	andn	%l3,	%o1,	%i7
	orn	%l0,	0x12A0,	%o7
loop_878:
	brgz,a	%o4,	loop_879
	xor	%g3,	0x14B1,	%g4
	orncc	%o0,	0x1FB2,	%o5
	sra	%i0,	%i1,	%g5
loop_879:
	fabsd	%f2,	%f0
	orcc	%i5,	%i2,	%g2
	addc	%i6,	0x0930,	%l2
	srax	%o6,	%i4,	%g1
	sra	%l1,	%o3,	%l4
	addccc	%g6,	%l6,	%g7
	xnorcc	%o2,	%l7,	%i3
	fxors	%f0,	%f8,	%f9
	xnor	%l5,	0x15C7,	%o1
	bvs,a	%xcc,	loop_880
	fsrc2	%f0,	%f0
	bne,a	loop_881
	orcc	%i7,	0x0C27,	%l3
loop_880:
	fxnor	%f8,	%f0,	%f2
	srl	%o4,	%o7,	%l0
loop_881:
	bn	%icc,	loop_882
	subccc	%g3,	0x1A71,	%g4
	srax	%i0,	0x07,	%o5
	srl	%o0,	%i1,	%i2
loop_882:
	or	%i5,	0x0BBD,	%i6
	addccc	%g5,	0x1D1C,	%l2
	fand	%f14,	%f10,	%f8
	bl	%xcc,	loop_883
	andncc	%i4,	%o6,	%g2
	andncc	%l1,	%o3,	%l4
	xorcc	%l6,	%g7,	%o2
loop_883:
	srlx	%g1,	0x0C,	%l7
	fxnors	%f12,	%f5,	%f12
	orcc	%g6,	%i3,	%o1
	xnorcc	%l5,	%o4,	%l3
	bne,a,pt	%xcc,	loop_884
	sra	%l0,	%i7,	%o7
	xorcc	%g3,	%g4,	%i0
	subcc	%i1,	0x1386,	%o0
loop_884:
	xorcc	%i2,	0x1B48,	%i5
	bl,a,pt	%icc,	loop_885
	srl	%o5,	%g5,	%i6
	bge,a	loop_886
	brgez,a	%l2,	loop_887
loop_885:
	srl	%o6,	%g2,	%l1
	fornot1	%f0,	%f10,	%f14
loop_886:
	sethi	0x0382,	%o3
loop_887:
	addccc	%l6,	%g7,	%i4
	xnorcc	%l4,	0x0052,	%l7
	andcc	%g1,	0x1B9D,	%o2
	sll	%i3,	0x10,	%l5
	sub	%g6,	0x1F9C,	%o4
	fornot1	%f2,	%f2,	%f6
	fsrc1	%f12,	%f12
	fsrc2	%f4,	%f4
	be,a,pn	%icc,	loop_888
	sra	%o1,	%i7,	%o7
	ba,a,pt	%icc,	loop_889
	andncc	%g3,	%l0,	%l3
loop_888:
	add	%g4,	0x0774,	%i0
	fxnor	%f8,	%f4,	%f6
loop_889:
	subccc	%o0,	0x02C0,	%i1
	addc	%o5,	0x0318,	%i2
	srax	%i6,	0x19,	%i5
	fnegs	%f1,	%f15
	fand	%f14,	%f4,	%f2
	andn	%g5,	%l2,	%l1
	fornot1	%f6,	%f10,	%f2
	orncc	%o3,	%o6,	%g2
	fnot2s	%f15,	%f0
	bne,a	loop_890
	srl	%i4,	0x07,	%l4
	srax	%l6,	%g1,	%o2
	srax	%l7,	%l5,	%g6
loop_890:
	srlx	%o4,	0x1D,	%i3
	xnor	%o1,	0x1378,	%i7
	be,pn	%icc,	loop_891
	ba,a,pt	%xcc,	loop_892
	fmovd	%f2,	%f8
	subcc	%g7,	%g3,	%o7
loop_891:
	orcc	%l3,	0x15FF,	%i0
loop_892:
	bge,a,pt	%xcc,	loop_893
	fornot1s	%f9,	%f10,	%f7
	subc	%l0,	0x1DE5,	%o0
	sethi	0x0417,	%i1
loop_893:
	addcc	%g4,	%i6,	%o5
	ble	loop_894
	addccc	%g5,	%i5,	%l2
	orn	%i2,	%o6,	%o3
	orn	%g2,	%l4,	%l1
loop_894:
	fandnot2s	%f4,	%f13,	%f14
	sethi	0x0D11,	%g1
	orn	%l6,	0x0319,	%o2
	fornot1	%f14,	%f4,	%f12
	sub	%l5,	%i4,	%o4
	fandnot1	%f2,	%f8,	%f0
	bl	%xcc,	loop_895
	or	%g6,	%i3,	%i7
	fsrc1s	%f15,	%f6
	xorcc	%l7,	%o1,	%g7
loop_895:
	fone	%f10
	bneg	%icc,	loop_896
	subccc	%o7,	0x00FA,	%g3
	sll	%l3,	0x06,	%i0
	orn	%o0,	%g4,	%i1
loop_896:
	srlx	%o5,	0x0B,	%l0
	xor	%i5,	0x10B0,	%i6
	ba,a,pt	%icc,	loop_897
	orncc	%g5,	%o6,	%o3
	bn,a,pt	%xcc,	loop_898
	srl	%g2,	%i2,	%l2
loop_897:
	and	%g1,	0x097B,	%l4
	srlx	%o2,	0x09,	%l6
loop_898:
	sra	%l1,	0x1C,	%i4
	sethi	0x155F,	%g6
	sub	%l5,	0x1048,	%i3
	srl	%o4,	0x09,	%i7
	srl	%o1,	%l7,	%o7
	andncc	%l3,	%i0,	%g3
	fzero	%f6
	andcc	%o0,	0x16A4,	%g7
	subcc	%i1,	0x1A9B,	%g4
	sra	%l0,	0x19,	%i5
	bge,a,pn	%icc,	loop_899
	srlx	%g5,	%o5,	%i6
	subcc	%o6,	0x1E75,	%o3
	brnz,a	%i2,	loop_900
loop_899:
	fnegd	%f10,	%f2
	subc	%g2,	0x13C4,	%l2
	add	%o2,	0x0804,	%g1
loop_900:
	andn	%l6,	%l4,	%l1
	sllx	%i4,	0x1B,	%g6
	subcc	%l5,	0x00D2,	%i7
	orncc	%o4,	%l7,	%o7
	fnegd	%f10,	%f12
	addccc	%l3,	0x11E5,	%o1
	xor	%g3,	0x0108,	%o0
	andcc	%i3,	0x04D3,	%i0
	sllx	%g7,	%l0,	%i5
	andncc	%i1,	%o5,	%g5
	sll	%g4,	0x07,	%o3
	sethi	0x0055,	%i6
	xorcc	%o6,	0x18F9,	%i2
	andcc	%g2,	0x1BA5,	%g1
	fxors	%f11,	%f13,	%f7
	srl	%o2,	0x07,	%l2
	addccc	%l4,	%l6,	%i4
	andcc	%l1,	0x123F,	%g6
	brgez,a	%l5,	loop_901
	andcc	%i7,	%l7,	%o4
	fsrc2s	%f6,	%f7
	fnot2	%f8,	%f6
loop_901:
	srax	%l3,	0x09,	%o7
	or	%o0,	%o1,	%i0
	brgez,a	%g7,	loop_902
	subccc	%g3,	0x0259,	%l0
	sllx	%i5,	0x1A,	%i3
	fnands	%f1,	%f0,	%f0
loop_902:
	bge,a	loop_903
	fandnot1	%f10,	%f10,	%f12
	srax	%i1,	%o5,	%g5
	bpos,a,pt	%xcc,	loop_904
loop_903:
	fone	%f2
	bg,pn	%xcc,	loop_905
	subcc	%o3,	0x0E23,	%i6
loop_904:
	addcc	%o6,	%i2,	%g1
	subccc	%o2,	0x1D49,	%l2
loop_905:
	fnot2	%f4,	%f14
	xnor	%g4,	%l4,	%g2
	orn	%l1,	0x17FB,	%i4
	or	%g6,	%i7,	%l5
	brgez	%o4,	loop_906
	bn,a	loop_907
	sllx	%l3,	0x0E,	%l7
	fsrc1s	%f11,	%f8
loop_906:
	subcc	%o0,	0x0199,	%o7
loop_907:
	addcc	%o1,	0x1231,	%g7
	fabsd	%f6,	%f12
	sethi	0x180F,	%g3
	orn	%l0,	%i0,	%i5
	addccc	%i1,	%i3,	%l6
	add	%o5,	0x00E4,	%i6
	subccc	%g5,	%o3,	%i2
	fones	%f6
	sra	%g1,	%o2,	%g4
	fandnot1s	%f14,	%f1,	%f0
	bn,a	loop_908
	fzero	%f6
	fandnot1s	%f1,	%f7,	%f4
	or	%l2,	%o6,	%l1
loop_908:
	subc	%l4,	%g2,	%i7
	fnot1	%f0,	%f2
	orcc	%g6,	%l5,	%o4
	bleu	%icc,	loop_909
	sethi	0x06A7,	%l3
	orcc	%i4,	0x01A6,	%l7
	sub	%o1,	%o0,	%g7
loop_909:
	srlx	%l0,	%i0,	%g3
	addc	%i1,	%i5,	%o7
	orcc	%l6,	0x123E,	%o5
	sra	%i3,	0x02,	%o3
	addcc	%i2,	%i6,	%g1
	fnors	%f6,	%f3,	%f14
	addcc	%g4,	%g5,	%l2
	subccc	%o2,	%o6,	%g2
	or	%i7,	%l1,	%l5
	fandnot1	%f14,	%f2,	%f6
	andncc	%g6,	%l3,	%i4
	fnot1	%f12,	%f14
	or	%l4,	%o4,	%o1
	srlx	%g7,	0x18,	%o0
	fandnot1	%f8,	%f6,	%f4
	sra	%i0,	%l0,	%g3
	brlez	%l7,	loop_910
	brlz	%i1,	loop_911
	fornot2	%f10,	%f6,	%f12
	srax	%l6,	0x07,	%i5
loop_910:
	xnor	%o7,	%i3,	%i2
loop_911:
	bneg,pn	%xcc,	loop_912
	brgz	%i6,	loop_913
	brz	%o3,	loop_914
	orncc	%g4,	0x1DF0,	%g5
loop_912:
	or	%l2,	0x15D3,	%o2
loop_913:
	fornot1s	%f13,	%f4,	%f12
loop_914:
	andncc	%o6,	%o5,	%i7
	add	%g2,	0x124E,	%l5
	and	%g1,	0x084F,	%l1
	orn	%i4,	%g6,	%l3
	srl	%o1,	0x17,	%l4
	bn,a,pn	%xcc,	loop_915
	bge	%icc,	loop_916
	brgz	%o0,	loop_917
	fzero	%f10
loop_915:
	orn	%i0,	%l0,	%g3
loop_916:
	brnz,a	%o4,	loop_918
loop_917:
	srax	%l7,	0x19,	%i1
	fnot1s	%f15,	%f12
	srax	%i5,	0x0F,	%o7
loop_918:
	and	%l6,	0x0D01,	%i3
	xnor	%g7,	0x0267,	%i2
	sll	%g4,	%i6,	%o3
	fnot1	%f12,	%f10
	add	%g5,	0x0956,	%o6
	sethi	0x14DF,	%o5
	bneg,pt	%xcc,	loop_919
	fornot1s	%f0,	%f12,	%f3
	xnor	%l2,	%o2,	%g2
	sll	%i7,	%g1,	%l5
loop_919:
	fxor	%f4,	%f6,	%f10
	xorcc	%g6,	%i4,	%l3
	fornot1s	%f2,	%f8,	%f11
	fxnors	%f4,	%f5,	%f11
	fnot1s	%f13,	%f0
	fmovs	%f14,	%f12
	sll	%l4,	0x04,	%o0
	be,pt	%icc,	loop_920
	srlx	%i0,	%o1,	%l0
	fsrc2	%f14,	%f0
	addcc	%g3,	0x139E,	%o4
loop_920:
	bl,pt	%xcc,	loop_921
	ble	%icc,	loop_922
	andncc	%l7,	%i5,	%o7
	fnegd	%f6,	%f14
loop_921:
	fnors	%f6,	%f13,	%f9
loop_922:
	addcc	%i1,	%i3,	%l1
	or	%i2,	%g7,	%l6
	sub	%i6,	%o3,	%g5
	fornot1	%f10,	%f6,	%f8
	add	%o6,	%l2,	%o2
	fornot2s	%f0,	%f7,	%f5
	xnor	%g2,	0x0872,	%o5
	orn	%g4,	%l5,	%i7
	andcc	%g6,	%l3,	%l4
	fabsd	%f0,	%f14
	srax	%o0,	%g1,	%o1
	andcc	%i4,	0x0D5A,	%l0
	orcc	%i0,	0x1C02,	%o4
	andncc	%l7,	%i5,	%o7
	sub	%i3,	0x10C4,	%i1
	orcc	%i2,	%l1,	%g3
	bge	%icc,	loop_923
	andncc	%i6,	%l6,	%g5
	srl	%o3,	%o6,	%l2
	xnor	%o2,	%g2,	%g7
loop_923:
	bge,a	%xcc,	loop_924
	sub	%l5,	0x014A,	%g4
	orcc	%i7,	0x0D32,	%o5
	sra	%l4,	0x08,	%o0
loop_924:
	sethi	0x0A92,	%g1
	orcc	%o1,	0x166D,	%l3
	orn	%l0,	0x0CE3,	%i4
	srax	%g6,	0x0B,	%l7
	bg,a,pn	%icc,	loop_925
	srl	%i5,	0x17,	%o4
	andcc	%i0,	%i3,	%i2
	fsrc1	%f12,	%f4
loop_925:
	fnegs	%f15,	%f14
	brlz,a	%o7,	loop_926
	sethi	0x0194,	%l1
	sra	%g3,	0x0C,	%l6
	andn	%i6,	%o3,	%i1
loop_926:
	add	%l2,	%o2,	%o6
	xnorcc	%g7,	0x1136,	%g5
	sll	%g4,	0x05,	%i7
	fandnot1s	%f15,	%f7,	%f6
	srl	%o5,	%g2,	%l5
	xorcc	%g1,	%o0,	%o1
	andncc	%l0,	%i4,	%l4
	addccc	%g6,	0x0524,	%i5
	srax	%o4,	%l3,	%i3
	fandnot2s	%f15,	%f1,	%f14
	sra	%i0,	0x0C,	%l7
	fnot1	%f4,	%f14
	faligndata	%f2,	%f6,	%f8
	subc	%i2,	%o7,	%l6
	fnot2s	%f8,	%f3
	fone	%f4
	fandnot1	%f2,	%f4,	%f12
	addc	%i6,	0x1450,	%o3
	bcs,pt	%xcc,	loop_927
	srl	%g3,	%i1,	%l1
	sub	%o2,	%l2,	%g7
	fsrc1	%f14,	%f0
loop_927:
	xnorcc	%o6,	0x0F31,	%g4
	andncc	%g5,	%i7,	%l5
	sll	%o5,	%o0,	%o1
	orncc	%g1,	0x10F3,	%i4
	srax	%l0,	0x1C,	%g6
	xorcc	%i5,	0x08D9,	%l4
	orn	%o4,	0x0AEF,	%g2
	andn	%i3,	0x0BF1,	%l7
	add	%i0,	0x0B5D,	%l3
	bgu	%icc,	loop_928
	addccc	%l6,	0x1DD2,	%i6
	addccc	%o3,	0x1B9A,	%i2
	fandnot2	%f8,	%f10,	%f2
loop_928:
	fnegd	%f12,	%f0
	addccc	%i1,	%g3,	%l1
	fone	%f2
	srlx	%o2,	0x0B,	%o7
	addccc	%o6,	%l2,	%g5
	andncc	%g4,	%l5,	%g7
	srl	%o5,	0x09,	%i7
	addc	%g1,	%o1,	%o0
	orn	%l0,	%g6,	%i5
	fone	%f2
	bleu,pt	%icc,	loop_929
	xnorcc	%i4,	0x0302,	%g2
	sethi	0x0017,	%i3
	sub	%l7,	0x06E4,	%l4
loop_929:
	fandnot2	%f12,	%f0,	%f4
	subc	%o4,	0x1805,	%l3
	srl	%i6,	0x03,	%o3
	subcc	%i0,	0x1669,	%i2
	orcc	%l6,	0x1F00,	%g3
	subc	%o2,	%o7,	%i1
	brgz	%o6,	loop_930
	bvs,pn	%icc,	loop_931
	subc	%l1,	0x1587,	%l2
	andn	%g5,	%g4,	%l5
loop_930:
	addc	%i7,	%o5,	%g1
loop_931:
	sub	%o0,	0x0670,	%g7
	sub	%o1,	0x1E0A,	%l0
	subcc	%g6,	0x0032,	%i4
	ba,a	%icc,	loop_932
	subcc	%i3,	0x0903,	%i5
	bn,pn	%icc,	loop_933
	and	%g2,	%l7,	%l4
loop_932:
	subcc	%l3,	0x1BB8,	%o4
	xnorcc	%o3,	%i0,	%i6
loop_933:
	or	%g3,	0x0C37,	%l6
	andn	%i2,	%i1,	%o7
	sethi	0x05EF,	%l1
	xnorcc	%o6,	0x0F73,	%o2
	xnorcc	%g5,	%g4,	%i7
	fone	%f14
	fnot1s	%f3,	%f6
	fxnor	%f10,	%f14,	%f14
	fzeros	%f10
	or	%l2,	%g1,	%o0
	srl	%l5,	0x19,	%o5
	xorcc	%o1,	%g6,	%i4
	sllx	%g7,	%l0,	%g2
	sra	%i3,	0x11,	%i5
	fmovs	%f2,	%f8
	xorcc	%l4,	%l3,	%o4
	orcc	%l7,	%i6,	%o3
	andn	%i0,	0x1AA0,	%g3
	fandnot2	%f6,	%f6,	%f0
	ba,a,pt	%xcc,	loop_934
	andn	%i2,	0x022D,	%l6
	sll	%o7,	0x0C,	%o6
	orncc	%l1,	%i1,	%g4
loop_934:
	fabsd	%f6,	%f6
	bneg,a,pn	%xcc,	loop_935
	fmovd	%f14,	%f4
	xorcc	%o2,	0x1F82,	%l2
	fsrc2	%f8,	%f8
loop_935:
	fnot2s	%f7,	%f6
	xorcc	%g5,	0x164B,	%g1
	fxnor	%f2,	%f4,	%f10
	xor	%o0,	0x0F94,	%l5
	sub	%o5,	0x0390,	%g6
	andcc	%i7,	%o1,	%l0
	brz	%i4,	loop_936
	fnegd	%f6,	%f10
	add	%g2,	0x17C6,	%i5
	addccc	%i3,	0x07C8,	%l4
loop_936:
	addccc	%l3,	0x0473,	%l7
	andncc	%o4,	%g7,	%i6
	ba,a,pt	%icc,	loop_937
	bg,pt	%xcc,	loop_938
	fnors	%f7,	%f12,	%f14
	and	%o3,	%i0,	%i2
loop_937:
	bn	%xcc,	loop_939
loop_938:
	sethi	0x078E,	%l6
	srlx	%o6,	%o7,	%l1
	srax	%g4,	%i1,	%l2
loop_939:
	or	%g5,	%g1,	%o2
	and	%l5,	0x052F,	%g3
	bg,a	loop_940
	bneg,a	loop_941
	xor	%g6,	%o5,	%o0
	sll	%i7,	0x19,	%o1
loop_940:
	addcc	%g2,	0x0279,	%i4
loop_941:
	andn	%l0,	%i3,	%i5
	fands	%f10,	%f13,	%f4
	sub	%l3,	%l7,	%l4
	andcc	%g7,	0x1A83,	%o3
	brlz,a	%i6,	loop_942
	addc	%o4,	0x0784,	%i0
	sethi	0x0879,	%l6
	bvs	%xcc,	loop_943
loop_942:
	and	%o6,	0x1657,	%o7
	subc	%l1,	0x1FFA,	%i2
	sethi	0x0D88,	%i1
loop_943:
	fnors	%f2,	%f15,	%f10
	fones	%f10
	fandnot1	%f14,	%f12,	%f10
	xor	%g5,	0x17BC,	%g1
	andcc	%l2,	0x1130,	%l5
	fabss	%f4,	%f0
	bvc,pn	%icc,	loop_944
	addcc	%g3,	%g4,	%g6
	ba,pn	%icc,	loop_945
	sethi	0x0E83,	%o0
loop_944:
	bcc	loop_946
	orncc	%o2,	0x1043,	%o5
loop_945:
	addcc	%g2,	%o1,	%i4
	subcc	%i3,	%i7,	%l0
loop_946:
	sub	%l7,	%i5,	%l4
	fandnot1	%f6,	%f8,	%f10
	xnorcc	%o3,	0x0158,	%g7
	addcc	%i6,	%o4,	%l3
	andn	%l6,	0x1FD7,	%o6
	srax	%l1,	0x0F,	%i2
	xnor	%i1,	0x048F,	%g5
	andcc	%o7,	0x1EF4,	%l2
	bvc	%xcc,	loop_947
	xor	%g1,	0x1A34,	%g3
	or	%i0,	0x03A3,	%g6
	and	%l5,	0x1511,	%o0
loop_947:
	addc	%o2,	%g4,	%g2
	sllx	%i4,	0x15,	%i3
	bl,a,pn	%icc,	loop_948
	addccc	%i7,	0x1DAC,	%l0
	sub	%l7,	%o5,	%l4
	brnz,a	%i5,	loop_949
loop_948:
	addccc	%o1,	0x055A,	%i6
	andn	%g7,	0x136F,	%o3
	fnot2s	%f6,	%f15
loop_949:
	brgez	%l6,	loop_950
	bcs,a,pt	%xcc,	loop_951
	bl,a	%icc,	loop_952
	fandnot1	%f4,	%f0,	%f14
loop_950:
	fxnor	%f10,	%f10,	%f8
loop_951:
	addcc	%o4,	0x163C,	%l3
loop_952:
	orcc	%o6,	0x1175,	%i1
	andn	%l1,	0x1FC7,	%g5
	fxnors	%f4,	%f1,	%f15
	xor	%l2,	0x0DDB,	%o7
	fxors	%f10,	%f9,	%f9
	be,a	loop_953
	addccc	%g1,	0x14E9,	%g3
	add	%g6,	0x0840,	%l5
	srax	%o0,	0x16,	%i2
loop_953:
	subccc	%i0,	0x0523,	%o2
	andncc	%i4,	%g4,	%g2
	fandnot2	%f6,	%f6,	%f12
	srlx	%l0,	0x09,	%i3
	fandnot2s	%f6,	%f10,	%f6
	brnz	%i7,	loop_954
	subccc	%l4,	0x0AA5,	%i5
	add	%l7,	%o5,	%i6
	subccc	%g7,	0x146A,	%o1
loop_954:
	subcc	%l6,	%o4,	%o6
	or	%l3,	%o3,	%g5
	andn	%l1,	%l2,	%g1
	subccc	%o7,	%g3,	%g6
	fornot2s	%f10,	%f9,	%f9
	orn	%o0,	%l5,	%i0
	srax	%i2,	0x00,	%i1
	add	%i4,	%o2,	%g2
	xorcc	%g4,	0x0BEA,	%l0
	bvc	loop_955
	subc	%i3,	%l4,	%l7
	fmovs	%f0,	%f13
	subccc	%i7,	0x12DF,	%i5
loop_955:
	sllx	%o5,	%o1,	%g7
	subc	%o4,	0x1B2C,	%o6
	orn	%l6,	%i6,	%l3
	xorcc	%g5,	%l1,	%o3
	orncc	%o7,	0x0079,	%g1
	subc	%g6,	0x102A,	%g3
	xor	%l2,	0x1C08,	%i0
	orcc	%o0,	0x1389,	%i2
	fornot2	%f6,	%f8,	%f10
	fsrc1	%f8,	%f6
	orn	%l5,	0x02B8,	%o2
	andncc	%i4,	%g2,	%i1
	fsrc1	%f6,	%f4
	andcc	%i3,	0x1903,	%g4
	fones	%f7
	srlx	%l0,	%i7,	%i5
	bne,pt	%icc,	loop_956
	orcc	%l4,	%l7,	%o5
	fandnot1	%f6,	%f4,	%f10
	fone	%f4
loop_956:
	srlx	%o1,	%o6,	%l6
	fxors	%f4,	%f12,	%f2
	fnand	%f14,	%f12,	%f14
	subc	%o4,	%l3,	%g7
	andncc	%l1,	%o3,	%o7
	xnor	%g5,	0x09F2,	%g1
	andcc	%g6,	%g3,	%i0
	add	%i6,	%i2,	%l5
	sub	%o2,	0x0CD7,	%l2
	fsrc1	%f10,	%f0
	sllx	%o0,	%g2,	%i1
	addcc	%g4,	%l0,	%i7
	fxnor	%f8,	%f2,	%f10
	brlz	%i5,	loop_957
	xnor	%i3,	0x1F07,	%i4
	xorcc	%l7,	0x04DE,	%o1
	srax	%o5,	0x01,	%l6
loop_957:
	xnorcc	%o6,	0x1132,	%o4
	xorcc	%l3,	%g7,	%o3
	or	%l4,	%o7,	%l1
	srax	%g5,	0x13,	%g6
	add	%g1,	0x171D,	%g3
	fsrc2s	%f13,	%f4
	andcc	%i0,	%i6,	%i2
	or	%l5,	%l2,	%o2
	fxors	%f15,	%f4,	%f9
	subccc	%o0,	%g2,	%i1
	addcc	%i7,	%i5,	%l0
	bpos	%xcc,	loop_958
	fandnot1s	%f8,	%f12,	%f13
	subcc	%g4,	0x15E0,	%i3
	andn	%i4,	%l7,	%o1
loop_958:
	bleu,pt	%icc,	loop_959
	addc	%o6,	0x046F,	%l6
	sub	%o4,	0x1670,	%g7
	fnands	%f9,	%f7,	%f13
loop_959:
	addcc	%o5,	0x0F50,	%l4
	fandnot2s	%f10,	%f9,	%f14
	fnor	%f0,	%f10,	%f14
	subccc	%l3,	0x1F35,	%o7
	sub	%g5,	0x0D10,	%l1
	srax	%o3,	%g6,	%i0
	fsrc1s	%f1,	%f0
	bcs,pn	%xcc,	loop_960
	subcc	%g1,	%i2,	%l5
	orn	%l2,	0x0BC0,	%o2
	fnors	%f0,	%f13,	%f1
loop_960:
	fnegs	%f10,	%f3
	addccc	%o0,	%g2,	%i6
	bne,a,pt	%icc,	loop_961
	orcc	%i7,	%i1,	%g3
	addcc	%g4,	0x021B,	%i3
	fxor	%f4,	%f10,	%f10
loop_961:
	sll	%i5,	0x14,	%i4
	sethi	0x1C22,	%l0
	srl	%l7,	%o1,	%l6
	xnorcc	%g7,	%o4,	%o5
	and	%l4,	0x16EE,	%o7
	sra	%l3,	%o6,	%l1
	andn	%g6,	%i0,	%g5
	bl,a,pt	%xcc,	loop_962
	fsrc2	%f12,	%f10
	xor	%o3,	%g1,	%l5
	addcc	%o2,	0x1EF3,	%o0
loop_962:
	faligndata	%f4,	%f14,	%f6
	bvs,pt	%icc,	loop_963
	fsrc2	%f4,	%f0
	for	%f6,	%f10,	%f2
	fzeros	%f0
loop_963:
	srax	%l2,	0x06,	%i2
	fand	%f4,	%f10,	%f8
	sub	%i6,	0x12AB,	%i1
	for	%f2,	%f8,	%f2
	add	%g3,	0x06FC,	%i7
	xorcc	%i3,	%i5,	%g2
	add	%l0,	%l7,	%o1
	srl	%g4,	0x1E,	%i4
	orn	%l6,	0x1B37,	%o4
	for	%f8,	%f0,	%f12
	fnands	%f0,	%f4,	%f15
	fandnot2s	%f8,	%f12,	%f1
	fand	%f6,	%f2,	%f12
	subcc	%o5,	%o7,	%l3
	fnot2	%f12,	%f8
	brlez,a	%g7,	loop_964
	xorcc	%l4,	0x1D15,	%o6
	fornot1	%f6,	%f12,	%f2
	or	%i0,	%g6,	%l1
loop_964:
	sub	%g5,	%g1,	%l5
	xorcc	%o3,	%l2,	%o2
	srl	%i2,	%i1,	%o0
	orn	%i7,	0x1F51,	%i3
	bneg	%xcc,	loop_965
	addc	%i6,	0x1262,	%g2
	orcc	%l0,	%g3,	%l7
	fabsd	%f10,	%f12
loop_965:
	bn,a	%icc,	loop_966
	sub	%i5,	0x017B,	%i4
	andn	%l6,	0x07AF,	%o4
	andncc	%o1,	%o7,	%g4
loop_966:
	fsrc1s	%f9,	%f14
	subcc	%g7,	0x1D53,	%l4
	xnor	%o5,	0x043F,	%i0
	bneg,a,pn	%icc,	loop_967
	xnor	%o6,	0x06F1,	%l1
	fsrc1s	%f8,	%f12
	addc	%l3,	0x0864,	%g5
loop_967:
	fnot2s	%f0,	%f3
	fandnot2	%f2,	%f8,	%f14
	subccc	%g1,	0x1792,	%o3
	andncc	%l2,	%g6,	%l5
	xorcc	%i2,	0x0FC4,	%i1
	srl	%i7,	0x0F,	%o2
	sra	%i6,	0x0C,	%i3
	sub	%g2,	0x1DC9,	%g3
	for	%f12,	%f10,	%f0
	fornot1s	%f2,	%f15,	%f9
	brz,a	%l7,	loop_968
	andcc	%o0,	0x1AE8,	%i5
	and	%l6,	0x08A1,	%i4
	orncc	%o4,	%o1,	%o7
loop_968:
	addccc	%g4,	0x0924,	%g7
	andcc	%o5,	%i0,	%l0
	fones	%f11
	be,pt	%icc,	loop_969
	fabss	%f7,	%f4
	sub	%o6,	%l4,	%l1
	srl	%g5,	0x18,	%l3
loop_969:
	bneg	%icc,	loop_970
	fzeros	%f13
	srl	%g1,	0x01,	%o3
	addcc	%g6,	0x0366,	%l5
loop_970:
	xor	%i1,	%i7,	%l2
	bne,a	loop_971
	bneg,pn	%icc,	loop_972
	sub	%o2,	0x0AEF,	%i3
	xor	%g2,	0x0280,	%i6
loop_971:
	fxor	%f4,	%f0,	%f14
loop_972:
	orn	%l7,	0x0E59,	%i2
	srl	%g3,	%o0,	%i5
	fnor	%f6,	%f8,	%f4
	and	%l6,	%o4,	%o7
	bneg,pt	%icc,	loop_973
	srl	%o1,	%i4,	%g4
	sethi	0x1FD7,	%o5
	xor	%g7,	%i0,	%l4
loop_973:
	xnor	%l0,	%o6,	%g5
	sra	%l3,	0x05,	%l1
	addccc	%o3,	%l5,	%g6
	andn	%i7,	0x12C4,	%i1
	orn	%g1,	%o2,	%l2
	or	%g2,	%i3,	%i6
	xorcc	%i2,	%g3,	%o0
	fandnot1	%f10,	%f12,	%f6
	fxor	%f0,	%f0,	%f2
	sub	%l7,	0x1F22,	%i5
	fornot1s	%f3,	%f4,	%f7
	fands	%f7,	%f5,	%f11
	andn	%o7,	%o4,	%l6
	fnot2s	%f2,	%f9
	xnor	%o1,	0x1BD2,	%i4
	bl	loop_974
	addccc	%g4,	%o5,	%g7
	fornot1s	%f10,	%f14,	%f1
	subc	%l0,	0x1623,	%l4
loop_974:
	xnor	%i0,	0x1F84,	%l3
	orn	%l1,	%g5,	%o6
	xnor	%l5,	%o3,	%g6
	xnorcc	%g1,	0x024E,	%i1
	fnot2	%f10,	%f14
	addccc	%i7,	%l2,	%o2
	sra	%i6,	0x06,	%i2
	bgu	%icc,	loop_975
	fone	%f8
	orcc	%i3,	%o0,	%g2
	andcc	%g3,	%o7,	%i5
loop_975:
	xorcc	%l7,	%o1,	%i4
	xnorcc	%l6,	%g4,	%o4
	sub	%l0,	%o5,	%g7
	fsrc1	%f6,	%f4
	brlez,a	%l4,	loop_976
	bpos	loop_977
	addc	%l1,	0x05D7,	%g5
	subcc	%i0,	%l5,	%o6
loop_976:
	sethi	0x1DCF,	%o3
loop_977:
	fnot2s	%f3,	%f0
	andncc	%g6,	%i1,	%i7
	subc	%g1,	%o2,	%l3
	fnot1s	%f14,	%f10
	fornot2	%f0,	%f14,	%f14
	fxnors	%f3,	%f3,	%f13
	fxnor	%f10,	%f0,	%f0
	bleu	loop_978
	fnot1	%f8,	%f6
	brz,a	%i6,	loop_979
	brlz,a	%i3,	loop_980
loop_978:
	sll	%i2,	%l2,	%g3
	xor	%g2,	0x10AC,	%o7
loop_979:
	addccc	%i5,	%o0,	%l7
loop_980:
	xnorcc	%i4,	%o1,	%o4
	fsrc2s	%f4,	%f10
	fnor	%f4,	%f8,	%f10
	fmovs	%f9,	%f6
	andcc	%l0,	%l6,	%g7
	sll	%o5,	%l1,	%g5
	brnz,a	%g4,	loop_981
	xorcc	%l4,	0x15DE,	%l5
	subccc	%i0,	%g6,	%o3
	xor	%i1,	%g1,	%o6
loop_981:
	orn	%l3,	%i7,	%o2
	fandnot2	%f6,	%f0,	%f14
	and	%i2,	%i3,	%i6
	add	%g2,	0x1C11,	%l2
	orn	%i5,	0x023D,	%g3
	xorcc	%o0,	0x1AA2,	%i4
	sllx	%o7,	%l7,	%l0
	andn	%o4,	%l6,	%g7
	addc	%l1,	0x10A2,	%g5
	fsrc1	%f2,	%f12
	fxor	%f0,	%f10,	%f8
	bcs,pn	%xcc,	loop_982
	sra	%g4,	%o1,	%l5
	srl	%o5,	%i0,	%o3
	bcc,a,pn	%xcc,	loop_983
loop_982:
	andcc	%i1,	0x1AFD,	%g1
	srax	%g6,	0x08,	%o6
	bn,pt	%xcc,	loop_984
loop_983:
	andn	%l4,	0x0440,	%i7
	fxnor	%f0,	%f14,	%f6
	fornot2	%f0,	%f10,	%f12
loop_984:
	andncc	%i2,	%o2,	%l3
	addccc	%i3,	%i6,	%i5
	for	%f8,	%f2,	%f14
	subcc	%g2,	%g3,	%i4
	brgz	%l2,	loop_985
	orncc	%l7,	%o7,	%o0
	fnors	%f13,	%f15,	%f7
	fzero	%f10
loop_985:
	bcc	%icc,	loop_986
	sethi	0x0CCC,	%o4
	bn,a	%xcc,	loop_987
	orncc	%l6,	%g7,	%l0
loop_986:
	bg,a	loop_988
	fandnot1s	%f7,	%f8,	%f4
loop_987:
	brlz,a	%l1,	loop_989
	andn	%o1,	%g5,	%l5
loop_988:
	fone	%f0
	addc	%g4,	0x036E,	%i0
loop_989:
	srax	%o5,	0x14,	%i1
	sll	%g1,	%g6,	%o6
	for	%f12,	%f10,	%f10
	sllx	%i7,	%l4,	%o3
	faligndata	%f8,	%f0,	%f14
	fxors	%f2,	%f8,	%f15
	subcc	%l3,	%o2,	%i6
	srlx	%i3,	%i2,	%g3
	xorcc	%g2,	0x0A38,	%i4
	fandnot1	%f12,	%f6,	%f2
	orncc	%i5,	%l7,	%o0
	subccc	%o4,	%o7,	%l2
	xorcc	%l6,	0x1AAC,	%l0
	fornot1s	%f14,	%f7,	%f12
	srlx	%l1,	0x02,	%o1
	sll	%l5,	0x1C,	%g7
	xnor	%i0,	%g5,	%g4
	addccc	%i1,	0x192D,	%g1
	andn	%g6,	0x07E1,	%o6
	fors	%f9,	%f10,	%f13
	srl	%l4,	%i7,	%o5
	srax	%l3,	%o3,	%i6
	subcc	%o2,	%i2,	%g3
	srlx	%i3,	%g2,	%i5
	addccc	%i4,	%l7,	%o4
	fzero	%f2
	fmovd	%f10,	%f8
	addcc	%l2,	%o0,	%l0
	fandnot1	%f12,	%f10,	%f2
	and	%l1,	%o7,	%l6
	fnand	%f2,	%f0,	%f12
	srax	%l5,	%i0,	%g5
	sra	%g7,	0x1D,	%g4
	subccc	%i1,	%g1,	%g6
	srlx	%o1,	%o6,	%i7
	brz,a	%l4,	loop_990
	fand	%f4,	%f12,	%f0
	fone	%f12
	fone	%f4
loop_990:
	or	%o5,	%i6,	%o2
	addcc	%o3,	0x02FD,	%l3
	andcc	%i2,	0x171A,	%g3
	sra	%i3,	%g2,	%i4
	bne,a,pt	%xcc,	loop_991
	bgu	%xcc,	loop_992
	srax	%l7,	%i5,	%o4
	andcc	%l0,	%l1,	%l2
loop_991:
	orcc	%o0,	0x1A65,	%l6
loop_992:
	fornot2s	%f2,	%f3,	%f15
	orcc	%i0,	%l5,	%o7
	andncc	%g4,	%i1,	%g5
	orn	%g1,	%g7,	%o6
	andn	%o1,	%g6,	%i7
	fabsd	%f8,	%f0
	sub	%o5,	%o2,	%i6
	srax	%l4,	0x06,	%l3
	orcc	%i2,	%i3,	%g3
	addcc	%i4,	%g2,	%l7
	bpos,pt	%icc,	loop_993
	fornot1s	%f0,	%f2,	%f10
	xorcc	%o4,	%i5,	%l0
	fnot1	%f4,	%f6
loop_993:
	sub	%l1,	0x0BC0,	%l2
	subccc	%o0,	%l6,	%i0
	sllx	%l5,	%o3,	%i1
	addc	%o7,	0x01BE,	%g4
	srax	%g7,	0x1B,	%g1
	fnot1	%f6,	%f0
	andn	%g5,	0x191C,	%g6
	bpos,a	%icc,	loop_994
	fnand	%f10,	%f14,	%f8
	xnorcc	%o6,	%o1,	%o2
	fnors	%f15,	%f13,	%f15
loop_994:
	fsrc2s	%f14,	%f6
	andcc	%i7,	%l4,	%i6
	fnand	%f14,	%f2,	%f14
	sethi	0x1239,	%i2
	subcc	%o5,	0x0713,	%l3
	orn	%i4,	0x0856,	%g3
	fnands	%f13,	%f10,	%f7
	faligndata	%f12,	%f4,	%f10
	orn	%i3,	0x1B48,	%g2
	fxnor	%f10,	%f12,	%f12
	xor	%i5,	0x0AFA,	%o4
	srlx	%l7,	%l2,	%l0
	andn	%l6,	0x079F,	%l1
	fandnot2s	%f3,	%f11,	%f14
	orcc	%o0,	0x07EE,	%i0
	srl	%o3,	0x12,	%o7
	addcc	%l5,	0x161E,	%g7
	xnorcc	%g1,	0x0312,	%i1
	orn	%g5,	0x0CA5,	%g4
	ba,a,pn	%icc,	loop_995
	srax	%o1,	0x1D,	%g6
	addc	%i7,	%o6,	%o2
	srl	%l4,	%o5,	%i6
loop_995:
	sra	%i2,	%l3,	%g3
	and	%i3,	0x1238,	%g2
	subcc	%i5,	%i4,	%l2
	sra	%o4,	0x16,	%l0
	sllx	%l7,	%l6,	%l1
	sra	%o0,	0x13,	%i0
	orn	%l5,	%g7,	%g1
	ba	%xcc,	loop_996
	sll	%o7,	%g5,	%i1
	xor	%o1,	0x1ABC,	%o3
	fnot1s	%f13,	%f8
loop_996:
	srl	%i7,	%g6,	%g4
	and	%o2,	0x1EF7,	%o5
	sethi	0x1CBF,	%l4
	bne,a	%xcc,	loop_997
	fsrc2s	%f14,	%f9
	orncc	%i6,	%i2,	%g3
	addccc	%l3,	%o6,	%g2
loop_997:
	xor	%i4,	0x1D93,	%l2
	fmovd	%f4,	%f12
	orn	%i3,	%i5,	%l0
	xnorcc	%l7,	0x01AA,	%l6
	fnegd	%f4,	%f10
	sllx	%o4,	%o0,	%i0
	xor	%g7,	%l5,	%l1
	fnors	%f9,	%f12,	%f12
	srlx	%g1,	%g5,	%o1
	bcs,a,pt	%icc,	loop_998
	sub	%o3,	%o7,	%i7
	xnor	%g4,	0x13EA,	%g6
	andncc	%i1,	%l4,	%o5
loop_998:
	be,a,pn	%xcc,	loop_999
	addc	%i6,	%o2,	%i2
	add	%l3,	%g2,	%g3
	faligndata	%f2,	%f6,	%f12
loop_999:
	addcc	%i4,	0x0711,	%i3
	fones	%f6
	xor	%o6,	%i5,	%l2
	subc	%l7,	%o4,	%o0
	bpos,pt	%icc,	loop_1000
	brlez,a	%i0,	loop_1001
	addc	%l6,	0x13B6,	%l0
	orncc	%g7,	0x0098,	%g1
loop_1000:
	brz	%l5,	loop_1002
loop_1001:
	andcc	%o1,	0x0AA6,	%g5
	bl,a,pn	%icc,	loop_1003
	bpos,pn	%xcc,	loop_1004
loop_1002:
	fnegd	%f10,	%f14
	brgz,a	%l1,	loop_1005
loop_1003:
	fnot2s	%f2,	%f14
loop_1004:
	orncc	%o7,	%g4,	%g6
	bcs,a,pn	%xcc,	loop_1006
loop_1005:
	bleu,a,pt	%xcc,	loop_1007
	add	%i7,	0x0227,	%l4
	sethi	0x06CD,	%o3
loop_1006:
	add	%i1,	%o2,	%i2
loop_1007:
	sll	%o5,	%i6,	%g3
	fone	%f10
	sllx	%g2,	0x10,	%l3
	srax	%i4,	%o6,	%i3
	xor	%l2,	%l7,	%i5
	or	%o0,	%i0,	%o4
	andn	%l0,	%g1,	%l6
	subc	%l5,	0x1EE7,	%o1
	srl	%g7,	0x16,	%g5
	brlez,a	%g4,	loop_1008
	fxnor	%f0,	%f14,	%f4
	add	%o7,	%l1,	%l4
	for	%f10,	%f10,	%f14
loop_1008:
	fsrc2s	%f0,	%f1
	ble,a,pn	%icc,	loop_1009
	addccc	%i7,	0x1983,	%o3
	andcc	%o2,	0x0A41,	%g6
	and	%i1,	%i2,	%i6
loop_1009:
	fabsd	%f4,	%f0
	bge,pt	%xcc,	loop_1010
	subcc	%g3,	%g2,	%l3
	subcc	%o6,	0x067F,	%i4
	sub	%i3,	%l2,	%l7
loop_1010:
	fnand	%f6,	%f8,	%f2
	brgz	%o5,	loop_1011
	sll	%o0,	0x1C,	%i5
	sll	%l0,	0x13,	%g1
	sethi	0x0FB7,	%l6
loop_1011:
	addcc	%l5,	%i0,	%o1
	addcc	%g5,	%o4,	%g7
	sethi	0x08C7,	%o7
	sethi	0x1CF3,	%l1
	fxnors	%f8,	%f8,	%f5
	andn	%g4,	0x1D07,	%i7
	orn	%l4,	%o3,	%g6
	addcc	%i2,	%i1,	%g3
	fornot2	%f0,	%f8,	%f14
	brz,a	%i6,	loop_1012
	or	%o2,	%g2,	%o6
	srlx	%i3,	0x18,	%i4
	orcc	%l2,	%l7,	%o5
loop_1012:
	sll	%o0,	%i5,	%l3
	orcc	%l0,	0x19A7,	%l5
	orncc	%g1,	%o1,	%l6
	andncc	%o4,	%i0,	%g7
	xnor	%l1,	0x1B01,	%g5
	orn	%i7,	%l4,	%g4
	addc	%g6,	0x16A3,	%o7
	sethi	0x03A8,	%i2
	fnegs	%f8,	%f7
	fzeros	%f12
	andncc	%o3,	%g3,	%i6
	fandnot2s	%f10,	%f15,	%f5
	bne,a	%xcc,	loop_1013
	fxnor	%f12,	%f4,	%f2
	fornot2	%f2,	%f10,	%f12
	orn	%i1,	0x0C64,	%o2
loop_1013:
	bcc,a	%xcc,	loop_1014
	fxors	%f0,	%f0,	%f14
	and	%i3,	%g2,	%o6
	bvs,a,pt	%xcc,	loop_1015
loop_1014:
	fnot2	%f10,	%f2
	srl	%l7,	0x07,	%l2
	bcs,pt	%icc,	loop_1016
loop_1015:
	sethi	0x093A,	%o5
	fands	%f12,	%f2,	%f15
	brlez,a	%o0,	loop_1017
loop_1016:
	sra	%l3,	0x02,	%l0
	bge,a,pn	%xcc,	loop_1018
	srlx	%i5,	%l5,	%i4
loop_1017:
	sub	%o1,	0x065E,	%o4
	fnot2s	%f10,	%f7
loop_1018:
	andcc	%i0,	%g1,	%l6
	fones	%f7
	xor	%l1,	%i7,	%g5
	fandnot2s	%f9,	%f3,	%f1
	bpos,pt	%icc,	loop_1019
	fxors	%f2,	%f5,	%f14
	orcc	%g7,	0x08AF,	%g6
	andncc	%o7,	%i2,	%o3
loop_1019:
	orncc	%g3,	%l4,	%g4
	andcc	%i1,	0x0BFA,	%i3
	xnor	%i6,	%o6,	%o2
	fornot2	%f4,	%f4,	%f10
	addccc	%g2,	0x1E45,	%l2
	bn,a	%icc,	loop_1020
	fandnot1s	%f1,	%f11,	%f2
	andn	%o5,	0x03BE,	%o0
	sll	%l3,	0x12,	%l7
loop_1020:
	fxors	%f5,	%f15,	%f2
	orn	%l5,	%i4,	%i5
	add	%o1,	%o4,	%l0
	bpos,a,pt	%xcc,	loop_1021
	fzero	%f10
	sethi	0x16F6,	%l6
	faligndata	%f6,	%f8,	%f8
loop_1021:
	andncc	%g1,	%i7,	%l1
	xnorcc	%g5,	%i0,	%g7
	bvc,a	loop_1022
	andncc	%g6,	%o7,	%o3
	fnor	%f2,	%f2,	%f2
	sub	%g3,	%l4,	%g4
loop_1022:
	xor	%i3,	0x1EC4,	%i2
	and	%o6,	0x1D64,	%o2
	orncc	%g2,	%l2,	%i6
	addcc	%i1,	%l3,	%o0
	sllx	%l7,	%i4,	%l5
	xorcc	%o5,	%o1,	%l0
	brnz,a	%o4,	loop_1023
	or	%i5,	0x1399,	%g1
	fand	%f12,	%f6,	%f4
	or	%i7,	%l1,	%g5
loop_1023:
	ba,pn	%icc,	loop_1024
	andn	%i0,	%l6,	%g7
	srlx	%o3,	0x12,	%g3
	xor	%o7,	%g4,	%g6
loop_1024:
	xorcc	%i2,	0x0B53,	%i3
	fsrc1s	%f10,	%f6
	xnor	%o2,	%l4,	%o6
	brz	%g2,	loop_1025
	addc	%i6,	%i1,	%l2
	srlx	%o0,	%l3,	%i4
	fornot1	%f4,	%f6,	%f2
loop_1025:
	brgz	%l7,	loop_1026
	sethi	0x0715,	%o1
	fxor	%f8,	%f2,	%f8
	fxnors	%f0,	%f2,	%f7
loop_1026:
	addc	%o5,	%l0,	%l5
	fornot1	%f12,	%f14,	%f8
	addcc	%g1,	%i7,	%o4
	sllx	%l1,	%g5,	%l6
	fnor	%f0,	%f2,	%f10
	srax	%g7,	0x04,	%o3
	fnot2s	%f9,	%f5
	sub	%i5,	%o7,	%g4
	xor	%g6,	0x0DBC,	%i2
	sll	%i3,	0x08,	%i0
	sethi	0x0F6D,	%l4
	bneg,a	loop_1027
	bcc,a,pt	%xcc,	loop_1028
	sub	%o6,	0x181A,	%g2
	orcc	%o2,	0x1D02,	%g3
loop_1027:
	brlez,a	%l2,	loop_1029
loop_1028:
	fands	%f4,	%f14,	%f5
	sethi	0x1912,	%i6
	subc	%i1,	%l3,	%i4
loop_1029:
	add	%o0,	0x13B8,	%o1
	sllx	%l7,	%l0,	%o5
	subcc	%i7,	0x0CF9,	%o4
	subc	%g1,	0x0EC0,	%l1
	xorcc	%g5,	0x134C,	%l6
	bvs,pt	%xcc,	loop_1030
	srax	%g7,	%o3,	%i5
	andncc	%o7,	%g4,	%g6
	sllx	%i3,	%i0,	%l4
loop_1030:
	fmovd	%f4,	%f12
	sethi	0x13E6,	%l5
	fandnot2s	%f1,	%f14,	%f12
	andn	%o6,	%o2,	%g3
	xorcc	%i2,	%i6,	%i1
	sra	%g2,	0x07,	%l3
	sra	%i4,	%o0,	%l2
	sethi	0x19C1,	%l7
	fone	%f6
	andn	%o5,	%i7,	%o1
	orn	%o4,	%g1,	%g5
	orncc	%l6,	0x1F09,	%g7
	sll	%l0,	%l1,	%i5
	bl,a	loop_1031
	bg,a,pt	%xcc,	loop_1032
	fzero	%f12
	orn	%o3,	0x1724,	%o7
loop_1031:
	xnorcc	%g6,	%g4,	%l4
loop_1032:
	sethi	0x04CA,	%i3
	subc	%o6,	%i0,	%l5
	andcc	%g3,	%o2,	%i6
	addccc	%i2,	0x17EF,	%i1
	bne,a,pt	%icc,	loop_1033
	fands	%f7,	%f12,	%f9
	orcc	%i4,	%o0,	%l3
	sll	%l2,	%l7,	%i7
loop_1033:
	addccc	%o1,	%g2,	%o5
	ble	%icc,	loop_1034
	bpos	%icc,	loop_1035
	addccc	%o4,	0x00FD,	%l6
	fands	%f3,	%f5,	%f9
loop_1034:
	addccc	%g1,	%g5,	%g7
loop_1035:
	or	%i5,	%l1,	%l0
	ble,a	%xcc,	loop_1036
	fandnot1	%f4,	%f8,	%f12
	sethi	0x1C34,	%o3
	fnegd	%f2,	%f0
loop_1036:
	sllx	%g4,	%l4,	%o7
	or	%i3,	0x1283,	%i0
	xnor	%l5,	%g6,	%g3
	sra	%o2,	%i2,	%i6
	orcc	%i1,	%o6,	%o0
	bneg,a,pt	%xcc,	loop_1037
	brz	%l2,	loop_1038
	bn	%xcc,	loop_1039
	srlx	%l3,	%l7,	%i4
loop_1037:
	xnorcc	%i7,	0x1E10,	%g2
loop_1038:
	srax	%o5,	%o4,	%l6
loop_1039:
	bgu	%xcc,	loop_1040
	fornot2	%f6,	%f4,	%f0
	fornot2s	%f4,	%f8,	%f5
	orcc	%g5,	0x1A9B,	%o1
loop_1040:
	and	%g7,	%l1,	%l0
	fornot1s	%f15,	%f11,	%f6
	brgez	%o3,	loop_1041
	xorcc	%i5,	%l4,	%g4
	orcc	%i3,	%o7,	%l5
	andcc	%g1,	0x0C30,	%i0
loop_1041:
	srlx	%o2,	%i2,	%g3
	fnot2s	%f4,	%f7
	fabss	%f9,	%f2
	fxnors	%f1,	%f13,	%f5
	addcc	%g6,	0x078F,	%i1
	xor	%o6,	0x0360,	%l2
	orncc	%i6,	%o0,	%l3
	sethi	0x07EC,	%i4
	sll	%i7,	0x06,	%o5
	srax	%o4,	%l6,	%g2
	subccc	%l7,	%g5,	%g7
	fsrc2s	%f5,	%f9
	srl	%l0,	%l1,	%o3
	srl	%o1,	%g4,	%l4
	addcc	%i5,	%i3,	%o7
	xnor	%l5,	%i0,	%o2
	orncc	%i2,	%g1,	%g3
	orncc	%g6,	0x12AC,	%o6
	sethi	0x017A,	%i1
	fnand	%f6,	%f2,	%f12
	fnors	%f11,	%f5,	%f14
	addc	%i6,	%l3,	%i4
	and	%o0,	0x1F35,	%o5
	sll	%l2,	0x19,	%o4
	xnorcc	%g2,	%l6,	%g5
	fors	%f10,	%f4,	%f6
	ble,a,pt	%icc,	loop_1042
	xnorcc	%g7,	%l7,	%i7
	bneg	%xcc,	loop_1043
	bne,a,pt	%xcc,	loop_1044
loop_1042:
	sra	%l0,	%l1,	%g4
	addc	%o1,	%o3,	%i3
loop_1043:
	bneg,a	loop_1045
loop_1044:
	fsrc2	%f2,	%f6
	bvs,a	%xcc,	loop_1046
	fabss	%f11,	%f3
loop_1045:
	sub	%l4,	0x1EDD,	%o7
	andcc	%i5,	0x1B05,	%o2
loop_1046:
	subccc	%i2,	%g1,	%g3
	bleu,a,pt	%xcc,	loop_1047
	fnot2	%f6,	%f4
	fxnor	%f8,	%f6,	%f4
	andncc	%l5,	%g6,	%i1
loop_1047:
	xnorcc	%i6,	%i0,	%i4
	sub	%o0,	%o6,	%o5
	andn	%l3,	%l2,	%o4
	xorcc	%g2,	0x10BD,	%g5
	fors	%f9,	%f8,	%f1
	ble,a	loop_1048
	orncc	%l6,	%i7,	%l0
	xorcc	%l7,	0x0CEF,	%g4
	and	%l1,	0x043A,	%o1
loop_1048:
	fnands	%f10,	%f10,	%f6
	sra	%i3,	%g7,	%l4
	bvs,a	loop_1049
	brlz	%o7,	loop_1050
	fxnors	%f15,	%f7,	%f9
	xnor	%i5,	0x1BF1,	%i2
loop_1049:
	and	%o3,	%g1,	%g3
loop_1050:
	faligndata	%f2,	%f10,	%f14
	fsrc2s	%f10,	%f10
	fones	%f7
	xor	%l5,	%o2,	%g6
	xnorcc	%i0,	0x05E2,	%i1
	brnz	%o0,	loop_1051
	srl	%o6,	0x18,	%i4
	srlx	%i6,	0x05,	%l3
	brgez,a	%o4,	loop_1052
loop_1051:
	andncc	%o5,	%l2,	%g2
	fnand	%f8,	%f10,	%f14
	srlx	%g5,	%l0,	%l6
loop_1052:
	addc	%l7,	%g4,	%l1
	subc	%i3,	%i7,	%o1
	addcc	%o7,	0x083F,	%g7
	addc	%l4,	0x1C21,	%i2
	brnz,a	%i5,	loop_1053
	sra	%g1,	0x10,	%l5
	sra	%g3,	0x1F,	%g6
	ba	loop_1054
loop_1053:
	ble,a,pn	%xcc,	loop_1055
	xorcc	%o3,	%o2,	%o0
	brz,a	%i0,	loop_1056
loop_1054:
	srl	%i4,	0x18,	%i1
loop_1055:
	subcc	%o6,	0x0BA0,	%i6
	andn	%o4,	0x149C,	%l2
loop_1056:
	fone	%f14
	fornot2s	%f6,	%f2,	%f10
	srax	%l3,	%g2,	%l0
	fmovs	%f10,	%f2
	xnor	%l6,	%l7,	%g4
	sll	%g5,	0x0E,	%i3
	xor	%l1,	0x15B0,	%o1
	add	%i7,	%g7,	%o7
	subc	%o5,	%i2,	%g1
	brlz,a	%i5,	loop_1057
	sllx	%l4,	%g6,	%o3
	sll	%g3,	0x03,	%o0
	subc	%i0,	0x06F3,	%l5
loop_1057:
	srl	%o2,	0x10,	%i1
	srl	%o6,	0x07,	%i4
	subcc	%l2,	0x1C86,	%l3
	subccc	%o4,	%i6,	%l0
	addcc	%l7,	0x0ABB,	%g4
	or	%l6,	%i3,	%l1
	sll	%o1,	%g5,	%g7
	bvc,pt	%icc,	loop_1058
	brz	%o7,	loop_1059
	bleu,a	loop_1060
	bvs	loop_1061
loop_1058:
	fandnot2	%f14,	%f12,	%f12
loop_1059:
	subc	%i7,	0x00ED,	%i2
loop_1060:
	addcc	%g2,	%o5,	%i5
loop_1061:
	subccc	%g1,	%g6,	%g3
	srlx	%o3,	0x0B,	%l4
	srax	%i0,	%o2,	%i1
	fxor	%f6,	%f4,	%f0
	fnand	%f6,	%f0,	%f14
	subcc	%o0,	%i4,	%l5
	addcc	%l2,	%o4,	%l3
	sub	%l0,	%l7,	%o6
	xorcc	%i6,	0x1F6D,	%l6
	xnor	%i3,	0x0378,	%o1
	subc	%g4,	0x00FD,	%g5
	bge	%xcc,	loop_1062
	add	%g7,	0x0C6E,	%l1
	sllx	%i7,	0x07,	%i2
	orn	%g2,	0x17E2,	%i5
loop_1062:
	fands	%f10,	%f15,	%f4
	xnorcc	%g1,	0x022A,	%o7
	fzeros	%f0
	bl,a,pt	%icc,	loop_1063
	addccc	%g3,	%g6,	%l4
	sra	%o5,	%o2,	%o3
	or	%i0,	%i4,	%i1
loop_1063:
	bge,a	%xcc,	loop_1064
	sra	%o0,	%l2,	%l3
	fandnot2	%f10,	%f6,	%f10
	srlx	%o4,	0x19,	%l0
loop_1064:
	subcc	%l7,	0x1FB6,	%l5
	bvs,pt	%xcc,	loop_1065
	srl	%i6,	0x19,	%l6
	fxors	%f4,	%f9,	%f7
	bl,pt	%icc,	loop_1066
loop_1065:
	fands	%f0,	%f8,	%f4
	addc	%o1,	%o6,	%g5
	xnor	%i3,	%l1,	%i7
loop_1066:
	xorcc	%g7,	%i2,	%g4
	andn	%g2,	%g1,	%g3
	fornot2	%f0,	%f8,	%f14
	fornot2s	%f4,	%f14,	%f10
	xorcc	%g6,	0x0A2E,	%o7
	bvs,a	loop_1067
	srlx	%i5,	0x0F,	%l4
	sllx	%o3,	%o5,	%i4
	fors	%f9,	%f11,	%f11
loop_1067:
	xnorcc	%i1,	0x11E3,	%o2
	fnors	%f6,	%f12,	%f14
	bneg,a,pn	%icc,	loop_1068
	orn	%l2,	0x08A0,	%i0
	fandnot2s	%f4,	%f4,	%f3
	addccc	%l3,	0x17CA,	%o0
loop_1068:
	fandnot1	%f2,	%f12,	%f0
	orcc	%o4,	%l5,	%l0
	addc	%i6,	%l6,	%l7
	bne,pt	%icc,	loop_1069
	orncc	%o6,	%i3,	%l1
	xorcc	%i7,	0x180A,	%o1
	subccc	%g5,	%g7,	%g2
loop_1069:
	orn	%i2,	%g1,	%g6
	addcc	%g4,	0x1958,	%o7
	and	%i5,	0x1EB2,	%g3
	and	%l4,	%o3,	%i4
	xor	%o5,	0x1417,	%o2
	fornot1s	%f1,	%f12,	%f8
	sub	%i0,	%l3,	%o0
	sllx	%o4,	%l5,	%l0
	addc	%i6,	0x0075,	%l2
	bpos,a,pt	%xcc,	loop_1070
	bvs,pt	%icc,	loop_1071
	srax	%i1,	0x1F,	%o6
	fnot2s	%f6,	%f6
loop_1070:
	sra	%i3,	0x1D,	%l6
loop_1071:
	bcs,a	%xcc,	loop_1072
	srax	%i7,	%l1,	%o1
	or	%l7,	%g5,	%g2
	fzeros	%f1
loop_1072:
	brz	%g7,	loop_1073
	fmovs	%f4,	%f8
	srlx	%g6,	%g4,	%g1
	andcc	%o7,	%i5,	%l4
loop_1073:
	addcc	%i2,	0x05FE,	%g3
	fors	%f1,	%f11,	%f15
	bl	loop_1074
	srlx	%i4,	0x1E,	%o3
	xorcc	%o2,	%l3,	%i0
	sub	%o5,	%o4,	%l5
loop_1074:
	xorcc	%o0,	0x080A,	%l2
	bneg,pn	%xcc,	loop_1075
	addccc	%i1,	0x09EA,	%i6
	orncc	%l0,	0x0270,	%o6
	xnorcc	%i3,	0x1CF1,	%l1
loop_1075:
	bleu,pt	%xcc,	loop_1076
	srax	%i7,	%l6,	%g5
	or	%l7,	0x1328,	%g7
	fnot2	%f8,	%f0
loop_1076:
	fandnot2s	%f9,	%f1,	%f11
	sethi	0x1873,	%g6
	fxors	%f3,	%f3,	%f10
	bgu,a	%icc,	loop_1077
	fabss	%f7,	%f6
	fones	%f7
	bg,pt	%icc,	loop_1078
loop_1077:
	sllx	%g2,	0x06,	%o1
	xnor	%g4,	%i5,	%l4
	and	%i2,	%g1,	%g3
loop_1078:
	orn	%i4,	%o3,	%o7
	add	%o2,	%i0,	%o5
	andcc	%l5,	0x1494,	%o4
	xorcc	%l2,	0x00E1,	%l3
	addc	%o0,	%i6,	%o6
	xor	%l0,	%i1,	%i7
	orcc	%i3,	%g5,	%l6
	fmovd	%f12,	%f2
	orncc	%l1,	0x0D30,	%g6
	orcc	%g2,	0x0E3A,	%l7
	sethi	0x0FB1,	%g4
	bgu	%icc,	loop_1079
	srlx	%o1,	%l4,	%i5
	sll	%g1,	0x09,	%i2
	addcc	%g3,	%o3,	%o7
loop_1079:
	andn	%i4,	0x084C,	%g7
	bleu,a	loop_1080
	bg,a,pt	%xcc,	loop_1081
	brlz	%i0,	loop_1082
	sllx	%o2,	0x1B,	%o4
loop_1080:
	addc	%l2,	%l3,	%l5
loop_1081:
	be	loop_1083
loop_1082:
	andncc	%o0,	%o5,	%o6
	subccc	%i1,	0x156F,	%l0
	addcc	%i3,	%i6,	%i7
loop_1083:
	xnorcc	%l1,	%g5,	%g6
	fsrc1s	%f3,	%f6
	xnor	%l6,	%g2,	%l7
	add	%o1,	0x0E91,	%i5
	xnorcc	%g1,	0x0493,	%l4
	xnorcc	%g3,	0x1349,	%i2
	srax	%o3,	%g4,	%i4
	subccc	%g7,	%o7,	%o2
	fandnot2s	%f8,	%f15,	%f1
	orncc	%l2,	%o4,	%i0
	srlx	%l5,	0x09,	%l3
	fsrc1s	%f4,	%f8
	srl	%o0,	0x02,	%i1
	bcs	%xcc,	loop_1084
	orcc	%o5,	%i3,	%i6
	bpos,a	loop_1085
	sub	%i7,	%l0,	%o6
loop_1084:
	fnegd	%f0,	%f4
	brgez	%g6,	loop_1086
loop_1085:
	xnor	%g5,	%l6,	%l7
	brgez,a	%l1,	loop_1087
	sll	%i5,	0x19,	%o1
loop_1086:
	xorcc	%g1,	0x1A9C,	%l4
	and	%g3,	0x1E85,	%g2
loop_1087:
	faligndata	%f8,	%f6,	%f6
	xnor	%i2,	%g4,	%i4
	addc	%o3,	%o2,	%o7
	brz,a	%o4,	loop_1088
	sll	%l2,	0x03,	%g7
	xorcc	%i0,	0x0611,	%o0
	bne	%xcc,	loop_1089
loop_1088:
	fmovs	%f0,	%f8
	fnor	%f4,	%f12,	%f6
	bgu,a	loop_1090
loop_1089:
	xnorcc	%l5,	%o5,	%i3
	fmovd	%f0,	%f0
	subc	%i6,	0x1F2E,	%i1
loop_1090:
	sll	%l0,	%l3,	%i7
	srlx	%g6,	%g5,	%o6
	xnorcc	%l1,	%i5,	%o1
	xorcc	%l6,	0x096E,	%l4
	fsrc1	%f8,	%f0
	xor	%g1,	%g3,	%g2
	fxnors	%f15,	%f7,	%f11
	ba,a,pn	%icc,	loop_1091
	bcc,pn	%icc,	loop_1092
	srl	%g4,	0x00,	%i2
	orcc	%o3,	%l7,	%i4
loop_1091:
	brlz,a	%o7,	loop_1093
loop_1092:
	sethi	0x14D0,	%o4
	bvs,pt	%icc,	loop_1094
	addcc	%l2,	%g7,	%o0
loop_1093:
	subcc	%o2,	%i0,	%i3
	xnor	%i6,	0x1099,	%l5
loop_1094:
	fabss	%f7,	%f4
	orncc	%i1,	%l3,	%i7
	or	%o5,	0x01B7,	%l0
	orncc	%o6,	%g6,	%l1
	brgz,a	%i5,	loop_1095
	brlez,a	%l6,	loop_1096
	subc	%l4,	0x1ACD,	%g5
	subccc	%o1,	0x02EC,	%g3
loop_1095:
	and	%g1,	0x169B,	%g4
loop_1096:
	fnands	%f15,	%f2,	%f10
	bgu	%icc,	loop_1097
	orn	%i2,	0x1CEC,	%l7
	sub	%o3,	0x18BE,	%o7
	andn	%g2,	0x0CB0,	%i4
loop_1097:
	srl	%l2,	0x18,	%o0
	sllx	%o2,	%i0,	%g7
	orncc	%i3,	%l5,	%o4
	addccc	%i1,	0x0801,	%i7
	and	%l3,	0x0AAB,	%i6
	fornot1s	%f7,	%f2,	%f14
	addccc	%o6,	%l0,	%o5
	bleu,a	loop_1098
	xor	%i5,	%g6,	%l1
	subccc	%l6,	0x0915,	%o1
	andncc	%g5,	%l4,	%g3
loop_1098:
	addc	%g4,	0x1422,	%l7
	fsrc2	%f0,	%f2
	srax	%i2,	%o3,	%g1
	brgez,a	%i4,	loop_1099
	bpos	loop_1100
	addc	%l2,	0x106E,	%g2
	fornot2	%f0,	%f0,	%f14
loop_1099:
	xorcc	%o0,	%o7,	%o2
loop_1100:
	srlx	%i0,	%i3,	%g7
	bne	%icc,	loop_1101
	fone	%f4
	sllx	%l5,	%i7,	%o4
	srlx	%i6,	0x1E,	%l3
loop_1101:
	andcc	%i1,	%l0,	%o5
	xnorcc	%g6,	%l1,	%l6
	brnz	%o1,	loop_1102
	or	%i5,	0x0938,	%l4
	fnot1	%f6,	%f12
	brgez	%g5,	loop_1103
loop_1102:
	addccc	%o6,	%g4,	%g3
	fxors	%f8,	%f10,	%f2
	fnot2s	%f15,	%f5
loop_1103:
	ba,a,pt	%icc,	loop_1104
	orcc	%o3,	%l7,	%i4
	subcc	%i2,	%l2,	%g2
	bne,a,pt	%xcc,	loop_1105
loop_1104:
	bl,a	loop_1106
	and	%g1,	0x160B,	%o7
	addccc	%o0,	0x0A87,	%i0
loop_1105:
	xnorcc	%o2,	0x0606,	%i3
loop_1106:
	fnot1	%f4,	%f10
	bcs,a	loop_1107
	fsrc1s	%f5,	%f6
	andncc	%g7,	%i7,	%o4
	andn	%l5,	0x1B6E,	%i6
loop_1107:
	fsrc1s	%f4,	%f12
	or	%l0,	0x18EF,	%i1
	xnorcc	%l3,	0x162D,	%l1
	addcc	%l6,	%g6,	%o5
	and	%o1,	0x00FA,	%g5
	orcc	%l4,	%o6,	%g4
	subccc	%g3,	%l7,	%i5
	andcc	%o3,	0x1B75,	%i2
	addc	%l2,	%g1,	%g2
	fsrc2s	%f1,	%f15
	addccc	%o0,	0x0156,	%i4
	fmovs	%f5,	%f14
	bneg	%xcc,	loop_1108
	srlx	%o7,	0x0C,	%i0
	fsrc2s	%f9,	%f0
	fmovs	%f0,	%f2
loop_1108:
	sllx	%o2,	%g7,	%i3
	srl	%l5,	0x0C,	%i7
	fandnot2	%f8,	%f0,	%f2
	andn	%l0,	%i1,	%l3
	xnor	%i6,	%l1,	%l6
	addcc	%o5,	0x11A4,	%o1
	sll	%o4,	%l4,	%o6
	sethi	0x0602,	%g5
	fands	%f11,	%f9,	%f4
	andncc	%g6,	%g4,	%l7
	sra	%i5,	%i2,	%o3
	xorcc	%l2,	0x03DD,	%g3
	and	%g2,	%o0,	%o7
	orncc	%g1,	0x1279,	%o2
	fsrc2s	%f15,	%f14
	bneg,a,pn	%icc,	loop_1109
	fabsd	%f0,	%f2
	fxnor	%f10,	%f10,	%f10
	ble	%icc,	loop_1110
loop_1109:
	fandnot1s	%f4,	%f11,	%f0
	sll	%i4,	0x07,	%g7
	orncc	%i3,	%i0,	%l0
loop_1110:
	for	%f2,	%f12,	%f12
	subccc	%i7,	0x00CC,	%i1
	xnor	%l5,	%l1,	%l3
	fnot2	%f8,	%f6
	faligndata	%f10,	%f4,	%f12
	orcc	%l6,	%i6,	%o5
	bvs,pt	%icc,	loop_1111
	addc	%l4,	0x0DAD,	%o4
	subc	%o6,	0x0AB6,	%g5
	andn	%g4,	0x0747,	%g6
loop_1111:
	orn	%l7,	0x1B95,	%i2
	bpos	%xcc,	loop_1112
	andn	%i5,	0x13A8,	%o1
	andn	%o3,	0x008B,	%l2
	andncc	%g2,	%o0,	%o7
loop_1112:
	fandnot1	%f14,	%f6,	%f0
	sll	%g1,	%g3,	%g7
	ble,a,pt	%xcc,	loop_1113
	fornot1	%f14,	%f2,	%f12
	subccc	%i4,	%i0,	%l0
	orn	%i3,	%i1,	%l5
loop_1113:
	srlx	%o2,	0x13,	%l1
	fnand	%f0,	%f10,	%f4
	fxnor	%f6,	%f4,	%f12
	orncc	%l3,	0x100A,	%i7
	fornot1s	%f7,	%f13,	%f8
	orcc	%l6,	%i6,	%l4
	subccc	%o6,	0x14BA,	%o5
	bleu,pt	%xcc,	loop_1114
	xnorcc	%g5,	0x127E,	%o4
	sra	%g6,	%l7,	%g4
	bcc,a,pt	%xcc,	loop_1115
loop_1114:
	brlez,a	%o1,	loop_1116
	sllx	%i2,	%i5,	%g2
	fxnors	%f0,	%f7,	%f10
loop_1115:
	bpos,pt	%xcc,	loop_1117
loop_1116:
	brnz,a	%o0,	loop_1118
	fxors	%f1,	%f4,	%f10
	addcc	%l2,	0x19E9,	%o7
loop_1117:
	xorcc	%g3,	0x16F9,	%g1
loop_1118:
	ba	loop_1119
	subccc	%g7,	%i0,	%l0
	sll	%i4,	0x0C,	%o3
	addc	%i1,	0x1CF0,	%o2
loop_1119:
	fabss	%f13,	%f1
	subc	%i3,	%l1,	%i7
	addccc	%l3,	0x19D7,	%i6
	sllx	%l5,	0x0A,	%l6
	fabss	%f1,	%f11
	subc	%l4,	0x1EB4,	%o5
	ble,a,pt	%xcc,	loop_1120
	sllx	%g5,	%g6,	%o6
	fornot2	%f14,	%f4,	%f6
	sra	%o4,	0x03,	%g4
loop_1120:
	addcc	%i2,	0x0C04,	%i5
	fabss	%f5,	%f8
	addcc	%o1,	%o0,	%g2
	bl,a	%icc,	loop_1121
	orn	%l2,	0x1CD2,	%o7
	fnot1	%f4,	%f12
	srax	%l7,	0x13,	%g7
loop_1121:
	xorcc	%g3,	0x0EEF,	%l0
	subc	%i0,	0x0311,	%i4
	fsrc2s	%f4,	%f2
	andcc	%i1,	0x1DFA,	%g1
	andcc	%i3,	0x0D31,	%l1
	sll	%i7,	0x1D,	%l3
	srlx	%i6,	0x12,	%o3
	sll	%l5,	0x04,	%l6
	sra	%o5,	0x1A,	%o2
	faligndata	%f8,	%f6,	%f14
	andcc	%l4,	%g6,	%o6
	srax	%g4,	%i2,	%o4
	sllx	%g5,	0x16,	%i5
	fornot2	%f2,	%f8,	%f6
	addcc	%o1,	0x1E5B,	%o0
	bpos,pn	%icc,	loop_1122
	andcc	%l2,	%g2,	%g7
	add	%g3,	0x0126,	%l0
	orcc	%o7,	0x12E3,	%l7
loop_1122:
	xor	%i4,	%g1,	%i0
	fsrc1s	%f6,	%f9
	bg,pt	%xcc,	loop_1123
	fornot1	%f6,	%f2,	%f6
	fornot1s	%f9,	%f5,	%f8
	subccc	%i3,	%l1,	%l3
loop_1123:
	orcc	%i1,	%i7,	%o3
	andncc	%l5,	%i6,	%o5
	addccc	%l4,	0x0143,	%g6
	fand	%f6,	%f10,	%f10
	addc	%o2,	0x0BB0,	%l6
	orncc	%o6,	%g4,	%i2
	srl	%i5,	%g5,	%o0
	faligndata	%f0,	%f8,	%f0
	and	%l2,	%g2,	%o1
	sll	%g7,	%l0,	%g3
	subcc	%o4,	0x0D1E,	%l7
	brnz	%o7,	loop_1124
	fxors	%f10,	%f3,	%f6
	andcc	%i4,	0x0ABC,	%g1
	fnot1	%f10,	%f10
loop_1124:
	fabsd	%f14,	%f6
	bneg,a,pn	%xcc,	loop_1125
	bg,pt	%xcc,	loop_1126
	andncc	%i3,	%l3,	%i1
	addcc	%i7,	0x0BAF,	%i0
loop_1125:
	addccc	%o3,	0x07C6,	%i6
loop_1126:
	srl	%o5,	0x17,	%l5
	orncc	%g6,	0x109C,	%l4
	addc	%l6,	%l1,	%o6
	orn	%o2,	0x0C1E,	%g4
	xnor	%g5,	%i5,	%o0
	orcc	%l2,	%g2,	%i2
	sra	%l0,	0x1C,	%g3
	bpos,a	%xcc,	loop_1127
	fones	%f13
	fone	%f10
	fxnor	%f8,	%f4,	%f10
loop_1127:
	srax	%g7,	%o1,	%o7
	andn	%l7,	%o4,	%i4
	srax	%g1,	%i3,	%l3
	fxor	%f10,	%f14,	%f0
	sub	%i1,	%i7,	%i6
	orn	%o3,	%o5,	%g6
	addc	%l4,	0x09D3,	%l6
	fone	%f2
	fsrc2s	%f10,	%f1
	brlz,a	%l1,	loop_1128
	addccc	%o6,	%o2,	%i0
	bpos,pn	%icc,	loop_1129
	subccc	%g5,	%i5,	%l5
loop_1128:
	andn	%g4,	%l2,	%g2
	add	%l0,	0x11BE,	%i2
loop_1129:
	fnot2s	%f10,	%f3
	addc	%o0,	%g3,	%o7
	bg,pt	%xcc,	loop_1130
	addccc	%o1,	0x1D94,	%g7
	andn	%i4,	%l7,	%o4
	sllx	%l3,	0x1A,	%i3
loop_1130:
	subccc	%g1,	0x1B44,	%i6
	xnorcc	%i7,	0x01B9,	%o3
	or	%o5,	0x1B29,	%l4
	srl	%g6,	%i1,	%l1
	xorcc	%o2,	0x1E1B,	%i0
	srax	%l6,	%o6,	%g5
	fxnor	%f8,	%f4,	%f10
	sra	%i5,	%l5,	%g4
	orncc	%g2,	0x0F68,	%l2
	fnands	%f5,	%f13,	%f12
	fnor	%f12,	%f6,	%f14
	xnor	%o0,	%l0,	%o7
	sll	%g3,	0x03,	%i2
	fabss	%f15,	%f3
	fabsd	%f8,	%f0
	addc	%i4,	%g7,	%l7
	ba,a,pt	%xcc,	loop_1131
	sllx	%o1,	%l3,	%g1
	and	%i3,	%o4,	%i6
	sll	%o5,	%i7,	%g6
loop_1131:
	ble,pt	%xcc,	loop_1132
	andcc	%o3,	0x0907,	%l1
	xorcc	%i1,	0x0A29,	%i0
	addccc	%o2,	%l6,	%l4
loop_1132:
	andncc	%i5,	%g5,	%o6
	sub	%l5,	%g2,	%o0
	andn	%g4,	0x15DC,	%l0
	and	%g3,	0x09D1,	%i2
	bcc	loop_1133
	subccc	%o7,	0x1473,	%i4
	fandnot1s	%f15,	%f3,	%f5
	srlx	%l2,	0x14,	%o1
loop_1133:
	xor	%l7,	%g1,	%i3
	sll	%g7,	%i6,	%l3
	and	%o4,	%o5,	%g6
	fandnot2	%f4,	%f12,	%f2
	fzero	%f12
	bge,a	%icc,	loop_1134
	xnor	%l1,	0x1552,	%i7
	orn	%i1,	0x0CCD,	%o3
	addc	%l6,	%l4,	%i5
loop_1134:
	or	%g5,	0x0304,	%o6
	subcc	%o2,	%l5,	%i0
	sra	%g2,	0x18,	%l0
	orncc	%g4,	%g3,	%i2
	or	%o0,	0x00A9,	%l2
	fornot2s	%f15,	%f5,	%f7
	srax	%o1,	0x0B,	%i4
	brgz,a	%g1,	loop_1135
	fone	%f0
	ble	loop_1136
	xnor	%i3,	%l7,	%o7
loop_1135:
	fors	%f10,	%f9,	%f2
	fsrc2s	%f14,	%f9
loop_1136:
	srl	%l3,	%g7,	%i6
	xor	%o5,	0x0661,	%g6
	sra	%l1,	0x12,	%i1
	sethi	0x18E3,	%i7
	subcc	%o4,	0x04DB,	%l4
	and	%o3,	%l6,	%g5
	fandnot1s	%f14,	%f0,	%f12
	fornot2s	%f4,	%f1,	%f1
	subccc	%o2,	%l5,	%i5
	xnorcc	%o6,	%l0,	%g2
	srax	%g4,	%g3,	%i2
	subc	%l2,	0x066C,	%i0
	xnorcc	%o0,	%i4,	%o1
	addccc	%i3,	%o7,	%l3
	sra	%l7,	0x0D,	%i6
	bvs	%xcc,	loop_1137
	orcc	%g7,	0x1E41,	%o5
	addc	%l1,	0x0F82,	%g6
	xnorcc	%i7,	0x1E15,	%g1
loop_1137:
	sllx	%o4,	0x1F,	%i1
	bneg,pn	%icc,	loop_1138
	srl	%l4,	%l6,	%o3
	xnorcc	%o2,	0x0636,	%l5
	orn	%g5,	%o6,	%i5
loop_1138:
	or	%g2,	%g4,	%g3
	fnot1	%f0,	%f14
	bvs,a	loop_1139
	xnor	%i2,	%i0,	%o0
	add	%l2,	%i4,	%l0
	xnorcc	%o7,	0x1BE1,	%l3
loop_1139:
	or	%i3,	%l7,	%i6
	orn	%g7,	%o1,	%o5
	sllx	%g6,	%g1,	%o4
	xnorcc	%l1,	0x0F3A,	%l4
	bg	loop_1140
	brz,a	%i7,	loop_1141
	fnegs	%f8,	%f6
	addccc	%i1,	%o3,	%o2
loop_1140:
	bvs,pn	%xcc,	loop_1142
loop_1141:
	sub	%l5,	0x15C9,	%g5
	addcc	%l6,	%i5,	%g4
	brgz,a	%g3,	loop_1143
loop_1142:
	bge,a,pt	%xcc,	loop_1144
	brgz	%o6,	loop_1145
	subccc	%i2,	%g2,	%i0
loop_1143:
	sllx	%i4,	%o0,	%o7
loop_1144:
	and	%l2,	0x0F14,	%i3
loop_1145:
	sethi	0x0ED9,	%l7
	xorcc	%l3,	0x0336,	%i6
	fnot2	%f4,	%f10
	orcc	%g7,	0x0288,	%o5
	brz	%g6,	loop_1146
	andcc	%l0,	%o4,	%l1
	sra	%l4,	%g1,	%i1
	orcc	%o1,	%i7,	%o2
loop_1146:
	srl	%l5,	0x08,	%g5
	srlx	%l6,	%i5,	%g3
	addcc	%o3,	%g4,	%o6
	andn	%i2,	0x12C6,	%i0
	sub	%g2,	0x0C5B,	%o0
	fand	%f10,	%f0,	%f4
	sra	%i4,	%l2,	%i3
	sethi	0x1621,	%l7
	orcc	%i6,	%l3,	%o5
	addccc	%o7,	0x1CFB,	%l0
	addccc	%o4,	0x0984,	%l1
	sra	%l4,	0x05,	%g1
	orcc	%g7,	0x0E7A,	%o1
	sra	%i7,	%g6,	%l5
	srl	%g5,	%l6,	%o2
	fnands	%f14,	%f13,	%f0
	ble,a	loop_1147
	srax	%i1,	0x00,	%o3
	subc	%g3,	%g4,	%i5
	srlx	%o6,	0x16,	%i0
loop_1147:
	andncc	%o0,	%i2,	%g2
	sra	%i4,	0x01,	%i3
	subccc	%i6,	0x0922,	%l2
	fornot2	%f8,	%f8,	%f2
	orcc	%o5,	%l3,	%l7
	subc	%l0,	0x1930,	%l1
	orcc	%o4,	%o7,	%g1
	orn	%g7,	0x0D40,	%l4
	fandnot2	%f4,	%f6,	%f14
	orncc	%i7,	%g6,	%g5
	addc	%o1,	%l6,	%o2
	fand	%f8,	%f6,	%f14
	subccc	%i1,	%l5,	%g3
	sllx	%g4,	0x1B,	%i5
	xnor	%i0,	%o3,	%o0
	orn	%g2,	%i2,	%i4
	fors	%f0,	%f5,	%f5
	bpos	loop_1148
	srax	%i3,	%i6,	%o5
	xnorcc	%l2,	%l3,	%o6
	fabsd	%f2,	%f4
loop_1148:
	subccc	%l7,	%o4,	%l0
	xnorcc	%g1,	%g7,	%o7
	and	%i7,	%l1,	%g5
	subcc	%l4,	0x032B,	%g6
	bgu,pt	%icc,	loop_1149
	add	%o2,	%i1,	%o1
	fsrc1	%f0,	%f0
	xnor	%l5,	%g4,	%g3
loop_1149:
	sll	%i0,	0x0D,	%o3
	addcc	%o0,	%i5,	%g2
	orcc	%i2,	0x1CDE,	%i3
	xorcc	%i6,	%l6,	%i4
	bg	loop_1150
	addcc	%l3,	%o6,	%l2
	fornot2s	%f10,	%f15,	%f7
	sllx	%o4,	%o5,	%l0
loop_1150:
	fnands	%f14,	%f14,	%f14
	sethi	0x0672,	%g7
	subcc	%o7,	%i7,	%g1
	fors	%f2,	%f13,	%f5
	srax	%l7,	0x02,	%g5
	bpos,a,pt	%xcc,	loop_1151
	xor	%g6,	%l4,	%o2
	addccc	%o1,	0x1262,	%l1
	addccc	%g4,	0x1F40,	%l5
loop_1151:
	xorcc	%g3,	0x0891,	%o3
	xnorcc	%i1,	0x1997,	%o0
	fsrc2s	%f5,	%f9
	fnor	%f4,	%f6,	%f6
	fxnor	%f10,	%f4,	%f2
	ba,a,pn	%xcc,	loop_1152
	srlx	%g2,	0x0E,	%i2
	fmovd	%f8,	%f12
	sll	%i3,	%i0,	%i5
loop_1152:
	sra	%i4,	%l3,	%i6
	fsrc1s	%f4,	%f0
	xor	%o6,	%l2,	%l6
	orn	%o4,	0x1901,	%l0
	addcc	%o7,	0x1F7D,	%g7
	addc	%o5,	%i7,	%g5
	xorcc	%l7,	0x1B04,	%g1
	and	%o2,	0x070F,	%o1
	bvs,pt	%icc,	loop_1153
	orn	%l1,	0x0072,	%g4
	xor	%g6,	%g3,	%o3
	addccc	%i1,	0x17AA,	%l4
loop_1153:
	and	%g2,	%l5,	%i3
	xnorcc	%o0,	%i5,	%i4
	orncc	%i2,	0x0F9A,	%l3
	subcc	%i6,	0x11A8,	%i0
	srax	%l2,	%o4,	%o6
	xnor	%l0,	%l6,	%g7
	sethi	0x0CC2,	%o7
	addc	%i7,	0x0415,	%g5
	fnand	%f12,	%f6,	%f8
	fnot2s	%f6,	%f2
	addcc	%o5,	0x12D5,	%l7
	xorcc	%o1,	%g1,	%l1
	addcc	%g6,	0x1137,	%g4
	orncc	%g3,	0x17AB,	%o3
	add	%l4,	%i1,	%l5
	bl	loop_1154
	or	%i3,	%o2,	%i5
	fornot2	%f8,	%f8,	%f14
	fands	%f4,	%f2,	%f14
loop_1154:
	srax	%g2,	0x03,	%i4
	fzeros	%f1
	sethi	0x1B05,	%o0
	brnz,a	%i6,	loop_1155
	sll	%i0,	0x1C,	%l3
	sra	%l2,	%i2,	%l0
	addc	%o6,	0x1A39,	%l6
loop_1155:
	fandnot2	%f6,	%f0,	%f10
	srlx	%g7,	0x08,	%i7
	addcc	%g5,	0x1C3E,	%o5
	srl	%o4,	%l7,	%o7
	bl	loop_1156
	addc	%l1,	%g6,	%o1
	fxnors	%f10,	%f0,	%f13
	add	%g4,	%g1,	%o3
loop_1156:
	fors	%f7,	%f8,	%f2
	addccc	%l4,	0x1DC4,	%g3
	brlz	%l5,	loop_1157
	sllx	%i1,	%i5,	%g2
	bneg,a	%icc,	loop_1158
	xnor	%i4,	0x0993,	%o2
loop_1157:
	orncc	%i6,	%i3,	%i0
	addccc	%l3,	%i2,	%o0
loop_1158:
	subc	%l2,	0x132C,	%o6
	brgez,a	%g7,	loop_1159
	xnor	%l0,	%i7,	%o5
	fand	%f14,	%f10,	%f8
	sll	%g5,	%l7,	%o4
loop_1159:
	add	%l1,	0x0E1F,	%l6
	fandnot1	%f2,	%f6,	%f4
	andncc	%o7,	%g4,	%g6
	addccc	%g1,	0x13F3,	%o3
	andcc	%l4,	0x0066,	%g3
	fxors	%f6,	%f7,	%f3
	for	%f4,	%f2,	%f14
	for	%f2,	%f2,	%f4
	fnot2	%f10,	%f0
	brgez,a	%i1,	loop_1160
	srlx	%o1,	0x17,	%i5
	bne,a	loop_1161
	xnor	%i4,	%o2,	%g2
loop_1160:
	addc	%i6,	0x1B8E,	%i3
	fxnors	%f14,	%f14,	%f3
loop_1161:
	ba,pn	%icc,	loop_1162
	bleu	loop_1163
	bn,pn	%xcc,	loop_1164
	fandnot2	%f10,	%f0,	%f6
loop_1162:
	sll	%i0,	%i2,	%l5
loop_1163:
	xor	%l2,	%o0,	%o6
loop_1164:
	sllx	%g7,	0x09,	%i7
	bcs,a	%xcc,	loop_1165
	addccc	%l3,	%o5,	%l7
	ble,a,pt	%xcc,	loop_1166
	bn,a,pn	%icc,	loop_1167
loop_1165:
	sra	%l0,	%o4,	%g5
	andncc	%l1,	%g4,	%g6
loop_1166:
	bvc,pn	%xcc,	loop_1168
loop_1167:
	brgz	%g1,	loop_1169
	fornot1	%f2,	%f4,	%f8
	sllx	%l6,	%o7,	%g3
loop_1168:
	brlez	%l4,	loop_1170
loop_1169:
	srax	%o1,	%i1,	%o3
	for	%f6,	%f4,	%f14
	orncc	%i4,	0x1C3E,	%o2
loop_1170:
	andn	%g2,	0x1BCA,	%i3
	orcc	%i0,	0x08A7,	%i5
	sethi	0x1415,	%i6
	add	%l2,	%i2,	%o0
	orncc	%l5,	%i7,	%l3
	srax	%o6,	%o5,	%l0
	bgu,a	loop_1171
	addccc	%o4,	%g7,	%l1
	orncc	%g4,	%l7,	%g1
	andncc	%g6,	%l6,	%o7
loop_1171:
	fmovs	%f0,	%f8
	or	%l4,	%g5,	%g3
	xnor	%o1,	0x0238,	%o3
	bvs	loop_1172
	addcc	%o2,	0x1FE5,	%g2
	fmovs	%f6,	%f13
	fornot2	%f12,	%f6,	%f6
loop_1172:
	bvc,pt	%xcc,	loop_1173
	ble,a	%icc,	loop_1174
	subcc	%i1,	%i4,	%i3
	xor	%i5,	%i0,	%i6
loop_1173:
	fnot2	%f10,	%f12
loop_1174:
	brgez	%o0,	loop_1175
	sll	%l2,	%i2,	%l5
	orncc	%o6,	%o5,	%l0
	sra	%o4,	0x1C,	%i7
loop_1175:
	fnot2	%f4,	%f10
	srax	%l1,	%g4,	%l7
	sra	%g7,	0x0C,	%g1
	fsrc2	%f4,	%f14
	addcc	%l3,	%l6,	%g6
	sll	%g5,	%o7,	%o1
	bg,a	loop_1176
	or	%l4,	%g3,	%o2
	andncc	%g2,	%o3,	%i3
	srl	%i5,	0x14,	%i1
loop_1176:
	brgz,a	%i4,	loop_1177
	bneg,a	%icc,	loop_1178
	orcc	%i6,	%l2,	%o0
	andn	%l5,	0x079E,	%i2
loop_1177:
	srax	%o5,	%l0,	%i0
loop_1178:
	bleu,a	%xcc,	loop_1179
	addc	%i7,	%o6,	%o4
	bcc	loop_1180
	fsrc2s	%f2,	%f9
loop_1179:
	or	%g4,	0x1FB4,	%l1
	fmovd	%f2,	%f4
loop_1180:
	subcc	%l7,	%g7,	%g1
	or	%g6,	%l6,	%g5
	and	%o1,	0x0586,	%o7
	subccc	%l3,	%l4,	%g2
	faligndata	%f12,	%f12,	%f10
	or	%g3,	0x0FE2,	%o2
	bneg,pn	%xcc,	loop_1181
	andn	%i3,	0x182D,	%o3
	fandnot1s	%f5,	%f9,	%f15
	srlx	%i4,	%i5,	%i1
loop_1181:
	subc	%l2,	%l5,	%i2
	addcc	%o0,	0x1EDA,	%l0
	subcc	%o5,	%i0,	%i6
	sub	%o4,	%g4,	%l1
	xnorcc	%o6,	%l7,	%g1
	xorcc	%i7,	%g7,	%g5
	bne,a	%xcc,	loop_1182
	orn	%g6,	%l6,	%l3
	xor	%o1,	0x11BB,	%l4
	fabss	%f15,	%f14
loop_1182:
	fandnot2s	%f4,	%f2,	%f9
	andcc	%g2,	%g3,	%o7
	add	%i3,	%o3,	%o2
	and	%i5,	%i4,	%i1
	xnorcc	%l2,	%l5,	%o0
	ble,a,pn	%xcc,	loop_1183
	bleu	loop_1184
	srl	%l0,	0x08,	%i0
	xnor	%i6,	%o4,	%o5
loop_1183:
	fnand	%f0,	%f10,	%f10
loop_1184:
	bvc	%xcc,	loop_1185
	orncc	%g4,	0x18FB,	%l1
	sll	%l7,	0x04,	%g1
	andncc	%i2,	%g7,	%g5
loop_1185:
	addc	%g6,	0x04ED,	%i7
	bg	%icc,	loop_1186
	orn	%l3,	%o6,	%l6
	sll	%o1,	0x17,	%g2
	ble	%xcc,	loop_1187
loop_1186:
	and	%g3,	0x1555,	%i3
	bn,pt	%icc,	loop_1188
	subc	%o7,	%o2,	%i5
loop_1187:
	sll	%l4,	%i1,	%l2
	add	%l5,	0x15BC,	%i4
loop_1188:
	fmovd	%f4,	%f8
	srl	%o3,	%l0,	%i0
	bcs,a,pn	%icc,	loop_1189
	add	%o0,	0x159B,	%o5
	andn	%o4,	%g4,	%i6
	bgu,a,pt	%icc,	loop_1190
loop_1189:
	and	%l7,	%i2,	%g7
	brgez,a	%g1,	loop_1191
	andcc	%l1,	0x00DA,	%g5
loop_1190:
	addcc	%l3,	0x02BA,	%i7
	orcc	%g6,	0x08C9,	%l6
loop_1191:
	xor	%o6,	0x0472,	%o1
	or	%g2,	%o7,	%i3
	bcs	%xcc,	loop_1192
	orncc	%g3,	0x02CD,	%o2
	bleu	%icc,	loop_1193
	addccc	%i5,	0x19D9,	%l2
loop_1192:
	subccc	%l5,	0x1711,	%i1
	bne,a,pn	%icc,	loop_1194
loop_1193:
	fxor	%f8,	%f2,	%f8
	srlx	%l4,	0x13,	%o3
	fxor	%f12,	%f12,	%f4
loop_1194:
	bpos,pt	%icc,	loop_1195
	fornot1s	%f8,	%f4,	%f10
	orncc	%i4,	0x11B4,	%o0
	srl	%i0,	%l0,	%g4
loop_1195:
	fandnot1	%f14,	%f14,	%f0
	andcc	%o4,	0x1A38,	%o5
	add	%i6,	%l7,	%g7
	ble,a	%xcc,	loop_1196
	addccc	%l1,	0x074C,	%g1
	sethi	0x0E76,	%l3
	bcc	%icc,	loop_1197
loop_1196:
	fands	%f12,	%f10,	%f11
	subccc	%i2,	%g6,	%l6
	orcc	%o6,	%o1,	%g5
loop_1197:
	bg,pn	%icc,	loop_1198
	fones	%f2
	sethi	0x03C0,	%g2
	fzeros	%f4
loop_1198:
	fandnot1	%f14,	%f8,	%f10
	srax	%i7,	0x15,	%g3
	srlx	%o7,	%i5,	%l2
	addc	%l5,	%i1,	%i3
	fandnot1s	%f9,	%f7,	%f14
	bvs,a,pt	%icc,	loop_1199
	fnegd	%f4,	%f14
	add	%o2,	0x1FAF,	%o3
	addc	%o0,	%i0,	%l4
loop_1199:
	xorcc	%g4,	0x1583,	%l0
	andn	%i4,	0x113E,	%i6
	subccc	%o5,	%l7,	%o4
	fxnors	%f8,	%f3,	%f3
	fmovd	%f10,	%f6
	fands	%f3,	%f5,	%f8
	ble,a	%icc,	loop_1200
	faligndata	%f14,	%f10,	%f6
	addccc	%g1,	0x07BD,	%g7
	sub	%i2,	0x1116,	%g6
loop_1200:
	or	%l1,	%l3,	%o1
	andcc	%g5,	0x097E,	%l6
	sllx	%g2,	%o6,	%o7
	fabss	%f12,	%f6
	srl	%g3,	%i7,	%l5
	sra	%i5,	%i1,	%o2
	sethi	0x1BE1,	%i3
	faligndata	%f12,	%f10,	%f10
	fnegd	%f12,	%f10
	subc	%l2,	0x0C41,	%i0
	addccc	%o3,	%g4,	%l4
	add	%l0,	%i6,	%o0
	sub	%i4,	0x0753,	%l7
	fones	%f14
	sllx	%o4,	0x0E,	%o5
	bneg,a	%xcc,	loop_1201
	andcc	%g7,	0x04E2,	%g6
	fornot1s	%f7,	%f9,	%f3
	orncc	%g1,	0x16CC,	%l1
loop_1201:
	brz,a	%o1,	loop_1202
	fornot2s	%f0,	%f8,	%f12
	subccc	%l3,	0x0B5A,	%i2
	orcc	%l6,	0x10B8,	%o6
loop_1202:
	fnand	%f12,	%f12,	%f4
	andcc	%o7,	%g5,	%g3
	or	%i7,	%i5,	%l5
	fsrc1s	%f3,	%f5
	xnorcc	%g2,	%o2,	%i3
	addccc	%i0,	%i1,	%l2
	orn	%o3,	%l4,	%i6
	fnegs	%f8,	%f14
	sllx	%l0,	0x05,	%g4
	fsrc2	%f10,	%f2
	subc	%l7,	0x074D,	%o0
	andn	%o4,	%o5,	%g6
	fzero	%f8
	fnors	%f15,	%f1,	%f1
	fornot2	%f12,	%f4,	%f0
	subc	%g7,	%i4,	%l1
	xnorcc	%o1,	%i2,	%l3
	fnands	%f7,	%f14,	%f9
	sllx	%g1,	0x00,	%l6
	subc	%o7,	0x01C3,	%o6
	and	%i7,	0x1A83,	%i5
	fxnors	%f11,	%f6,	%f14
	andcc	%l5,	%g5,	%o2
	orn	%g2,	0x0BF9,	%g3
	srl	%i1,	%i3,	%o3
	fnands	%f4,	%f15,	%f11
	srax	%i0,	0x01,	%l2
	add	%i6,	%g4,	%l0
	andcc	%l4,	%o4,	%o5
	fornot2s	%f12,	%f13,	%f13
	xor	%l7,	0x1266,	%o0
	sub	%i4,	%g6,	%o1
	fnot1	%f4,	%f0
	sub	%i2,	%l3,	%l1
	fnands	%f11,	%f1,	%f12
	sethi	0x0122,	%g1
	sub	%o7,	0x08DD,	%g7
	subcc	%o6,	%i7,	%i5
	sub	%g5,	%l6,	%g2
	sll	%o2,	0x00,	%i1
	xnor	%l5,	0x1FC7,	%o3
	fnot1s	%f12,	%f2
	fnands	%f4,	%f4,	%f1
	orncc	%i3,	%i0,	%g3
	srlx	%g4,	0x0E,	%l0
	or	%i6,	%l2,	%l4
	brlz	%l7,	loop_1203
	addccc	%o4,	0x135C,	%o0
	bneg,a	%icc,	loop_1204
	subccc	%o5,	%o1,	%g6
loop_1203:
	orcc	%l3,	%l1,	%i2
	addcc	%i4,	0x12E6,	%g7
loop_1204:
	subcc	%o7,	0x1BC6,	%i7
	bl,a	%xcc,	loop_1205
	sethi	0x15F0,	%g1
	fnot2	%f12,	%f8
	sll	%o6,	%g5,	%i5
loop_1205:
	sub	%l6,	0x0291,	%o2
	subc	%g2,	%i1,	%o3
	orcc	%i3,	0x1341,	%l5
	sethi	0x06D9,	%i0
	brgz	%g4,	loop_1206
	sra	%l0,	%i6,	%l4
	orncc	%l7,	0x110B,	%g3
	fnot2s	%f2,	%f15
loop_1206:
	fandnot1	%f10,	%f2,	%f0
	sllx	%o4,	0x11,	%o0
	xor	%o5,	%o1,	%l2
	srlx	%l1,	%l3,	%i4
	fandnot1s	%f15,	%f0,	%f11
	orcc	%g7,	%o7,	%i2
	orcc	%g6,	0x061B,	%i7
	orn	%o6,	%g5,	%g1
	fzeros	%f5
	sllx	%o2,	%i5,	%g2
	subccc	%o3,	0x1E5D,	%i3
	srlx	%l6,	0x08,	%i0
	fand	%f8,	%f0,	%f4
	srax	%g4,	0x13,	%l0
	addc	%l5,	%l4,	%i1
	brz	%g3,	loop_1207
	fnot2s	%f11,	%f12
	orncc	%l7,	0x151F,	%o0
	or	%o5,	%i6,	%o4
loop_1207:
	andncc	%o1,	%l2,	%l1
	sllx	%l3,	%i4,	%g7
	add	%o7,	0x13DF,	%g6
	fabss	%f4,	%f8
	orcc	%i2,	%o6,	%g5
	srl	%o2,	%i7,	%i5
	fors	%f12,	%f2,	%f14
	andcc	%g1,	%i3,	%o3
	andncc	%g2,	%g4,	%l6
	fornot2s	%f2,	%f2,	%f14
	bg,a	loop_1208
	orncc	%i0,	%l4,	%l0
	addcc	%g3,	%i1,	%o0
	bge,pn	%xcc,	loop_1209
loop_1208:
	addcc	%l5,	%i6,	%l7
	add	%o5,	0x1C11,	%o4
	add	%o1,	0x1223,	%l2
loop_1209:
	subccc	%l1,	0x1987,	%i4
	srax	%l3,	0x14,	%o7
	subcc	%g7,	%g6,	%o6
	subcc	%o2,	0x0FA5,	%i7
	for	%f8,	%f8,	%f10
	bvc,a	loop_1210
	orcc	%i2,	0x177E,	%g1
	sub	%g5,	0x09CD,	%i5
	orcc	%g2,	%o3,	%g4
loop_1210:
	srax	%l6,	%i3,	%l4
	fmovd	%f14,	%f14
	fsrc2	%f8,	%f10
	fxnor	%f2,	%f14,	%f12
	bg	loop_1211
	or	%g3,	%i1,	%i0
	srax	%o0,	%i6,	%l5
	orncc	%l0,	0x0F65,	%o5
loop_1211:
	fabss	%f2,	%f2
	srl	%o1,	0x06,	%o4
	fnegd	%f2,	%f14
	brnz,a	%l7,	loop_1212
	subc	%l1,	0x00F4,	%l3
	xor	%l2,	0x09C7,	%g7
	sllx	%g6,	0x13,	%i4
loop_1212:
	srl	%o2,	%o6,	%o7
	andncc	%i2,	%i7,	%i5
	sub	%g2,	0x17D6,	%g5
	addccc	%g1,	%l6,	%i3
	fnot2s	%f1,	%f8
	ba	%xcc,	loop_1213
	andn	%o3,	0x10E4,	%l4
	andcc	%i1,	0x0082,	%g3
	subc	%o0,	0x0F7A,	%i0
loop_1213:
	andn	%l5,	%i6,	%g4
	fnor	%f6,	%f10,	%f12
	fandnot1	%f6,	%f0,	%f10
	fabss	%f10,	%f6
	fornot1s	%f0,	%f3,	%f7
	bvc,pn	%xcc,	loop_1214
	fxnors	%f3,	%f11,	%f0
	andncc	%o5,	%o4,	%l0
	ba,a	%xcc,	loop_1215
loop_1214:
	srl	%l7,	%o1,	%l3
	subcc	%l1,	0x1155,	%l2
	fand	%f8,	%f10,	%f14
loop_1215:
	xnor	%g6,	%i4,	%o6
	bge	loop_1216
	srax	%o7,	%o2,	%i2
	subc	%g7,	%i7,	%g2
	andn	%i5,	0x132F,	%g5
loop_1216:
	xnorcc	%l6,	%o3,	%g1
	sethi	0x0B8B,	%i3
	sra	%i1,	0x1A,	%l4
	bcs,pt	%icc,	loop_1217
	srl	%i0,	0x1A,	%l5
	andn	%g3,	0x1EF5,	%o0
	bcs,a	loop_1218
loop_1217:
	orncc	%i6,	0x137E,	%g4
	sub	%o5,	%l0,	%o1
	fand	%f0,	%f14,	%f6
loop_1218:
	addcc	%o4,	%l3,	%l1
	xnorcc	%g6,	0x1242,	%l2
	subccc	%i4,	%l7,	%o6
	fsrc2	%f14,	%f4
	addcc	%o7,	%g7,	%i2
	bvc,a	loop_1219
	srl	%o2,	%i5,	%g5
	and	%l6,	0x110F,	%o3
	orcc	%g1,	0x1D1D,	%i3
loop_1219:
	sra	%i7,	0x03,	%l4
	brgz	%i0,	loop_1220
	xorcc	%i1,	0x1531,	%g2
	xor	%o0,	0x1729,	%g3
	subcc	%l5,	0x1A4A,	%g4
loop_1220:
	fnot2s	%f13,	%f1
	sra	%l0,	%i6,	%o1
	orcc	%o5,	0x144A,	%o4
	andcc	%l1,	%l2,	%i4
	srlx	%g6,	%l3,	%l7
	addc	%g7,	0x1599,	%o6
	bl,pt	%icc,	loop_1221
	srlx	%o7,	%i5,	%g5
	andcc	%i2,	0x1503,	%o2
	and	%l6,	%i3,	%g1
loop_1221:
	sethi	0x00BC,	%i7
	xnor	%o3,	%i0,	%g2
	sra	%o0,	%g3,	%l5
	subccc	%g4,	0x1B57,	%l4
	xor	%i6,	0x03D0,	%o1
	fornot1s	%f0,	%f10,	%f9
	fsrc2	%f14,	%f4
	fandnot1	%f8,	%f12,	%f0
	sra	%l0,	0x0C,	%o5
	and	%o4,	0x02C0,	%l2
	orncc	%l1,	0x1AA7,	%i4
	xnorcc	%g6,	0x1BF5,	%i1
	sub	%g7,	%o6,	%l3
	bn,a	loop_1222
	srlx	%i5,	%o7,	%g5
	sllx	%l7,	0x02,	%o2
	ba,a,pt	%xcc,	loop_1223
loop_1222:
	brnz,a	%i2,	loop_1224
	orncc	%g1,	0x13B6,	%i3
	subc	%l6,	0x1A29,	%o3
loop_1223:
	sethi	0x02EF,	%g2
loop_1224:
	subc	%i7,	0x097F,	%i0
	subcc	%g3,	%l5,	%o0
	sra	%g4,	0x1B,	%o1
	add	%i6,	%o5,	%o4
	fone	%f4
	subc	%l2,	%l0,	%i4
	fnand	%f2,	%f4,	%f0
	fxor	%f8,	%f10,	%f10
	sra	%l4,	%g6,	%l1
	fandnot1s	%f0,	%f4,	%f12
	faligndata	%f8,	%f14,	%f4
	or	%g7,	%i1,	%l3
	be,a,pn	%xcc,	loop_1225
	xor	%o7,	0x1D46,	%i5
	sethi	0x1046,	%o6
	and	%l7,	0x0983,	%o2
loop_1225:
	xnor	%g5,	0x0947,	%i3
	sll	%g1,	%l6,	%g2
	xorcc	%o3,	0x0275,	%i0
	fnot1	%f4,	%f4
	fsrc1s	%f14,	%f8
	xnor	%g3,	%i7,	%l5
	subcc	%i2,	%o1,	%i6
	fornot1	%f4,	%f12,	%f8
	brgez,a	%o5,	loop_1226
	faligndata	%f12,	%f0,	%f0
	sra	%o4,	%o0,	%l0
	sllx	%g4,	0x1C,	%l2
loop_1226:
	bvs,a,pn	%icc,	loop_1227
	bvc,a,pn	%xcc,	loop_1228
	addc	%i4,	%g6,	%g7
	add	%l1,	%i1,	%o7
loop_1227:
	bn,a,pn	%icc,	loop_1229
loop_1228:
	subc	%l3,	%i5,	%l4
	subccc	%o2,	0x0CF9,	%g5
	ble,pt	%xcc,	loop_1230
loop_1229:
	srax	%l7,	%i3,	%l6
	sethi	0x1E70,	%g2
	orn	%g1,	%i0,	%o6
loop_1230:
	andncc	%o3,	%l5,	%i2
	andn	%i7,	%i6,	%o5
	and	%o1,	%o4,	%o0
	fmovs	%f7,	%f12
	sethi	0x163C,	%g4
	fones	%f14
	orncc	%g3,	%l0,	%l2
	andn	%g7,	0x1B8F,	%l1
	fsrc1	%f12,	%f6
	subccc	%g6,	%i1,	%i4
	bge,a,pt	%icc,	loop_1231
	or	%l3,	%i5,	%o2
	andn	%g5,	%o7,	%i3
	fzero	%f12
loop_1231:
	sub	%l6,	0x0B11,	%l4
	andncc	%g2,	%l7,	%i0
	fnand	%f6,	%f12,	%f8
	fnors	%f14,	%f8,	%f3
	sub	%o3,	0x18D9,	%g1
	fnot1s	%f1,	%f3
	srl	%i2,	0x05,	%i7
	andcc	%i6,	0x09F9,	%l5
	fxors	%f0,	%f8,	%f15
	subccc	%o5,	%o6,	%o4
	andncc	%o1,	%g4,	%l0
	bne,a	loop_1232
	addccc	%o0,	0x0106,	%g7
	or	%g3,	0x1CC0,	%l2
	fornot2s	%f15,	%f6,	%f2
loop_1232:
	andn	%l1,	%i1,	%i4
	andn	%g6,	0x0F8A,	%o2
	orcc	%g5,	%i5,	%o7
	or	%l3,	%l4,	%i3
	orcc	%l6,	0x18A6,	%i0
	xnorcc	%g2,	%o3,	%l7
	xorcc	%g1,	0x1906,	%i6
	subcc	%l5,	%i2,	%i7
	fornot2	%f2,	%f6,	%f14
	xnor	%o6,	0x1BDE,	%o1
	orncc	%g4,	0x1A98,	%o4
	addcc	%o0,	%o5,	%l0
	xnorcc	%l2,	0x160E,	%g7
	brlz	%l1,	loop_1233
	sra	%g3,	%i1,	%g6
	add	%o2,	0x0943,	%i4
	fnot2s	%f11,	%f13
loop_1233:
	fandnot2	%f8,	%f12,	%f6
	bcc,pt	%icc,	loop_1234
	bvs	%icc,	loop_1235
	srlx	%o7,	0x0C,	%g5
	fornot1	%f4,	%f4,	%f2
loop_1234:
	brz,a	%l4,	loop_1236
loop_1235:
	fone	%f12
	subcc	%i3,	%i5,	%l3
	sll	%l6,	%o3,	%l7
loop_1236:
	srax	%g2,	0x19,	%i6
	fnegd	%f14,	%f4
	subcc	%i0,	%l5,	%i7
	srlx	%i2,	0x15,	%o1
	xnor	%g1,	%o4,	%g4
	addc	%o0,	0x1266,	%o5
	srl	%l2,	%g7,	%l1
	fsrc1	%f12,	%f6
	xor	%o6,	%l0,	%g3
	fnor	%f0,	%f14,	%f10
	brlez,a	%i1,	loop_1237
	add	%o2,	0x1D21,	%g6
	fornot2	%f8,	%f14,	%f10
	fors	%f13,	%f5,	%f15
loop_1237:
	brgez,a	%o7,	loop_1238
	or	%i4,	%i3,	%i5
	xorcc	%l4,	%g5,	%o3
	addcc	%l6,	0x007B,	%l7
loop_1238:
	subcc	%i6,	0x08EB,	%g2
	fandnot2s	%f4,	%f5,	%f7
	addc	%i0,	%l3,	%l5
	addc	%o1,	%i7,	%o4
	xor	%g1,	0x0485,	%g4
	subccc	%o0,	0x0BFA,	%l2
	srlx	%o5,	%i2,	%g7
	bneg	%icc,	loop_1239
	orncc	%o6,	0x0052,	%l0
	bgu,pn	%xcc,	loop_1240
	sllx	%i1,	0x13,	%l1
loop_1239:
	ble,a,pt	%icc,	loop_1241
	fnot2	%f6,	%f10
loop_1240:
	orn	%g6,	0x1649,	%o2
	fornot1s	%f4,	%f8,	%f14
loop_1241:
	srl	%g3,	%o7,	%i3
	xnorcc	%i4,	0x01F1,	%g5
	ba,a,pn	%icc,	loop_1242
	addccc	%o3,	0x1885,	%l4
	or	%l7,	0x04F7,	%i5
	orncc	%l6,	%i6,	%l3
loop_1242:
	addcc	%g2,	%l5,	%i7
	sll	%i0,	%o1,	%g4
	andn	%o0,	%g1,	%o4
	addcc	%o5,	0x1B1C,	%i2
	srax	%o6,	0x12,	%l2
	fandnot2s	%f4,	%f13,	%f13
	fones	%f7
	and	%l0,	0x1F0E,	%g7
	and	%l1,	0x054D,	%i1
	sub	%g3,	%o2,	%o7
	xnorcc	%g6,	0x0F47,	%i3
	xnorcc	%g5,	%i4,	%l7
	fandnot1	%f6,	%f10,	%f8
	srl	%l4,	%l6,	%i5
	andn	%i6,	0x1AA9,	%g2
	subccc	%l3,	%o3,	%i0
	fxnors	%f13,	%f12,	%f10
	fzeros	%f12
	fones	%f3
	andn	%i7,	0x0E33,	%g4
	fsrc1s	%f9,	%f11
	xnor	%l5,	0x056C,	%g1
	andn	%o1,	%o0,	%o5
	and	%o6,	0x1A8E,	%l2
	fnand	%f2,	%f4,	%f8
	subc	%l0,	0x0210,	%g7
	srax	%o4,	0x19,	%i2
	and	%l1,	%g3,	%i1
	bne,pt	%icc,	loop_1243
	xorcc	%o2,	%i3,	%g6
	or	%i4,	%g5,	%l7
	srl	%l6,	0x10,	%o7
loop_1243:
	orn	%l4,	%i6,	%i5
	ba,a	loop_1244
	subccc	%l3,	0x0D69,	%o3
	sub	%i0,	%i7,	%g2
	bpos,a	loop_1245
loop_1244:
	orn	%l5,	%g4,	%o1
	xorcc	%o0,	0x1FB1,	%g1
	addcc	%o6,	%l0,	%g7
loop_1245:
	xor	%l2,	%o5,	%l1
	sll	%o4,	%i2,	%g3
	xorcc	%i1,	0x18AC,	%o2
	addccc	%i3,	0x1A8E,	%g6
	fxnors	%f3,	%f13,	%f3
	andcc	%g5,	0x14B7,	%l6
	sra	%i4,	0x1A,	%l7
	addc	%o7,	%l4,	%i6
	addc	%l3,	0x1AB6,	%o3
	andcc	%i5,	0x1ED0,	%g2
	srl	%i7,	%i0,	%l5
	sethi	0x1FB1,	%g4
	brlez,a	%o0,	loop_1246
	and	%o1,	0x059A,	%o6
	sll	%g7,	%g1,	%o5
	brlz,a	%l1,	loop_1247
loop_1246:
	or	%l2,	%l0,	%o4
	sll	%i1,	%i2,	%g3
	orncc	%g6,	%i3,	%l6
loop_1247:
	xnor	%g5,	%o2,	%l7
	fones	%f15
	fmovd	%f4,	%f4
	sra	%i4,	%l4,	%o7
	subc	%o3,	%i5,	%l3
	andn	%g2,	%i0,	%l5
	fandnot1s	%f6,	%f3,	%f13
	and	%g4,	0x1CE1,	%i6
	srl	%o0,	0x03,	%i7
	xor	%o6,	%g1,	%g7
	brz	%l1,	loop_1248
	for	%f0,	%f0,	%f10
	fnor	%f10,	%f2,	%f2
	fnand	%f10,	%f0,	%f2
loop_1248:
	subcc	%l2,	0x00BB,	%o5
	orn	%o1,	%l0,	%i1
	andcc	%i2,	0x01AE,	%g6
	or	%i3,	%g3,	%g5
	fornot1s	%f6,	%f11,	%f13
	xor	%o2,	%o4,	%l6
	fsrc2	%f4,	%f12
	be	%icc,	loop_1249
	orcc	%i4,	0x0CE7,	%l7
	brgz,a	%o7,	loop_1250
	addc	%o3,	%i5,	%g2
loop_1249:
	subc	%l4,	0x076B,	%l3
	fornot2	%f6,	%f12,	%f14
loop_1250:
	sethi	0x123F,	%g4
	sllx	%l5,	0x09,	%o0
	subccc	%i7,	%i6,	%g1
	fandnot1	%f10,	%f6,	%f0
	brnz,a	%g7,	loop_1251
	bl	loop_1252
	orcc	%o6,	%i0,	%l2
	and	%o5,	0x04CA,	%l0
loop_1251:
	bpos,a,pt	%icc,	loop_1253
loop_1252:
	srlx	%i1,	%o1,	%l1
	xnor	%i2,	%i3,	%g6
	sethi	0x1F97,	%g3
loop_1253:
	srax	%g5,	0x0F,	%l6
	fnor	%f2,	%f4,	%f14
	addccc	%o4,	0x0444,	%o2
	fnot1	%f14,	%f0
	andncc	%o7,	%i4,	%i5
	bne	loop_1254
	addcc	%l7,	0x14A2,	%o3
	subccc	%l3,	%g2,	%l5
	sll	%o0,	0x0B,	%g4
loop_1254:
	srlx	%i6,	%g1,	%i7
	addc	%l4,	0x0708,	%o6
	sra	%g7,	0x02,	%l2
	bg,a	%xcc,	loop_1255
	andn	%l0,	0x166F,	%i1
	subcc	%i0,	%o1,	%o5
	or	%i2,	0x1626,	%l1
loop_1255:
	bl,a,pt	%xcc,	loop_1256
	fnor	%f0,	%f4,	%f2
	orn	%g3,	%i3,	%l6
	xnor	%g5,	%o2,	%o7
loop_1256:
	srax	%g6,	0x02,	%i4
	sll	%i5,	%o3,	%o4
	orcc	%g2,	%l3,	%o0
	add	%l7,	%l5,	%g1
	bne	%xcc,	loop_1257
	xor	%g4,	0x03AA,	%i7
	fandnot2s	%f5,	%f6,	%f14
	andn	%o6,	0x1784,	%i6
loop_1257:
	sethi	0x0306,	%l2
	bvs,pn	%icc,	loop_1258
	srlx	%l0,	0x0E,	%g7
	orcc	%i0,	%i1,	%o1
	fornot2	%f6,	%f6,	%f2
loop_1258:
	xor	%o5,	0x03FE,	%l1
	srl	%g3,	0x1F,	%l4
	andcc	%l6,	%i2,	%g5
	xnor	%o7,	0x1704,	%o2
	srax	%g6,	0x1B,	%i5
	srax	%i4,	0x09,	%o3
	orn	%i3,	%l3,	%g2
	addccc	%o4,	0x0FCE,	%o0
	brgz,a	%l7,	loop_1259
	sra	%g4,	%i7,	%o6
	ble	%xcc,	loop_1260
	subccc	%g1,	%l5,	%l0
loop_1259:
	fmovd	%f6,	%f4
	addccc	%l2,	%i6,	%i1
loop_1260:
	srl	%o1,	0x00,	%o5
	fsrc1s	%f9,	%f14
	and	%i0,	0x0D88,	%g7
	orncc	%l1,	0x1A7E,	%l6
	xnor	%g3,	0x199A,	%i2
	fsrc1	%f6,	%f14
	brgez	%g5,	loop_1261
	fnand	%f8,	%f8,	%f10
	xorcc	%l4,	0x0845,	%o2
	fxnors	%f9,	%f6,	%f0
loop_1261:
	orn	%g6,	%o7,	%i5
	fzeros	%f11
	andcc	%o3,	%i4,	%g2
	fandnot2s	%f3,	%f14,	%f4
	fsrc1s	%f3,	%f5
	sra	%i3,	0x1A,	%l3
	orncc	%l7,	0x1D9E,	%o4
	xnorcc	%i7,	0x15C5,	%o6
	fand	%f4,	%f8,	%f6
	orcc	%g1,	0x033A,	%g4
	brgez,a	%l0,	loop_1262
	addcc	%l2,	%l5,	%o0
	and	%i6,	%o5,	%i0
	sra	%o1,	0x1E,	%l1
loop_1262:
	fands	%f11,	%f12,	%f12
	xor	%g7,	%g3,	%i2
	andcc	%l6,	0x1892,	%l4
	fnot2s	%f12,	%f9
	fandnot1	%f14,	%f8,	%f14
	fabsd	%f0,	%f2
	orcc	%g5,	0x18FC,	%g6
	brgez	%i1,	loop_1263
	sll	%i5,	0x11,	%o7
	subc	%o3,	0x0814,	%i4
	fnor	%f6,	%f4,	%f8
loop_1263:
	xorcc	%g2,	%l3,	%o2
	addc	%l7,	%o4,	%i7
	sra	%g1,	0x15,	%g4
	fnot2s	%f1,	%f3
	addcc	%l0,	0x1FFE,	%i3
	xorcc	%l5,	0x0556,	%o6
	xnor	%l2,	0x0074,	%i6
	orn	%o0,	%i0,	%o5
	addc	%g7,	0x178C,	%l1
	xnorcc	%i2,	0x1AFA,	%g3
	or	%l4,	0x1AE7,	%o1
	srl	%l6,	%i1,	%g6
	srax	%o7,	%g5,	%i4
	srl	%g2,	0x1B,	%l3
	addcc	%o2,	%i5,	%l7
	fand	%f12,	%f10,	%f0
	fandnot2	%f4,	%f0,	%f14
	bge	loop_1264
	orcc	%o3,	%o4,	%g1
	fnot2s	%f1,	%f3
	sll	%i7,	0x12,	%l0
loop_1264:
	bge	loop_1265
	xor	%l5,	%i3,	%g4
	orncc	%o6,	0x1ADA,	%l2
	add	%i0,	0x1CD6,	%o0
loop_1265:
	bcs,a,pn	%xcc,	loop_1266
	subc	%o5,	%l1,	%g7
	xnor	%i6,	%i2,	%g3
	fnegd	%f6,	%f4
loop_1266:
	orn	%l4,	0x1838,	%o1
	fornot1	%f6,	%f12,	%f10
	orcc	%g6,	%i1,	%o7
	xnorcc	%i4,	%g5,	%l3
	bpos	%xcc,	loop_1267
	addccc	%l6,	%g2,	%o2
	fnors	%f12,	%f15,	%f0
	addccc	%i5,	0x0C8A,	%o3
loop_1267:
	subcc	%o4,	%l7,	%g1
	addccc	%l5,	0x1363,	%i7
	fornot1	%f0,	%f6,	%f2
	subcc	%g4,	0x18C8,	%i3
	fxnor	%f0,	%f2,	%f14
	sllx	%o6,	%l0,	%o0
	subcc	%o5,	0x1B32,	%i0
	andn	%l2,	%i6,	%g7
	fnot1	%f6,	%f6
	sethi	0x0304,	%l1
	fnands	%f11,	%f2,	%f15
	addccc	%i2,	%o1,	%g3
	subccc	%g6,	%l4,	%i4
	fsrc1s	%f7,	%f6
	fandnot2	%f10,	%f8,	%f14
	bge	%icc,	loop_1268
	sllx	%i1,	0x09,	%g5
	sllx	%o7,	0x04,	%l3
	orncc	%g2,	%o2,	%i5
loop_1268:
	addccc	%o3,	%l6,	%o4
	faligndata	%f0,	%f2,	%f4
	sll	%l7,	%l5,	%i7
	addcc	%g4,	0x0812,	%g1
	addcc	%l0,	%i3,	%o6
	add	%i0,	%o0,	%o5
	xor	%g7,	0x15D8,	%l2
	srl	%i2,	%i6,	%l1
	bcs,pt	%icc,	loop_1269
	fandnot2	%f0,	%f10,	%f12
	bcs,a	%icc,	loop_1270
	brlz,a	%g3,	loop_1271
loop_1269:
	orncc	%g6,	%i4,	%o1
	addcc	%l4,	0x13EE,	%o7
loop_1270:
	bneg	%icc,	loop_1272
loop_1271:
	srl	%i1,	0x0B,	%g2
	andncc	%g5,	%o2,	%l3
	subcc	%o3,	0x03BB,	%i5
loop_1272:
	fandnot2	%f10,	%f6,	%f8
	bgu	%xcc,	loop_1273
	srlx	%l6,	%o4,	%i7
	brgez,a	%l7,	loop_1274
	orn	%l5,	%g1,	%l0
loop_1273:
	addc	%i3,	0x13A8,	%g4
	subc	%o0,	%i0,	%o6
loop_1274:
	addc	%g7,	%o5,	%i2
	add	%i6,	0x151C,	%l1
	sll	%l2,	0x14,	%g3
	andn	%g6,	%l4,	%o7
	bne,a,pn	%icc,	loop_1275
	xorcc	%i1,	%i4,	%g5
	fnors	%f11,	%f14,	%f2
	addcc	%g2,	0x19D0,	%l3
loop_1275:
	subccc	%o2,	0x12ED,	%o1
	fxor	%f8,	%f0,	%f6
	subcc	%o3,	0x02B5,	%o4
	fxnor	%f12,	%f12,	%f10
	add	%l6,	%l7,	%i5
	andcc	%i7,	0x166D,	%l0
	bgu	%icc,	loop_1276
	srl	%i3,	0x1A,	%l5
	fsrc2s	%f12,	%f7
	xorcc	%o0,	0x1DDE,	%g1
loop_1276:
	subcc	%o6,	0x1427,	%i0
	brgez,a	%g7,	loop_1277
	andn	%g4,	%i2,	%o5
	sllx	%l1,	%g3,	%g6
	srlx	%l4,	%o7,	%i6
loop_1277:
	srax	%i1,	%i4,	%g5
	fzero	%f12
	subcc	%g2,	0x05CF,	%l2
	andn	%o1,	0x1241,	%o3
	srl	%o4,	0x1E,	%l3
	srax	%o2,	0x13,	%l7
	subccc	%i5,	0x0379,	%l0
	or	%l6,	0x0B7C,	%l5
	fandnot2s	%f15,	%f5,	%f6
	orncc	%i3,	%o0,	%i7
	orn	%o6,	%g7,	%i0
	orn	%g4,	0x1196,	%i2
	fmovs	%f13,	%f5
	brgz	%g1,	loop_1278
	sethi	0x08AC,	%g3
	faligndata	%f8,	%f0,	%f6
	bcc	loop_1279
loop_1278:
	bneg,a,pt	%xcc,	loop_1280
	srax	%o5,	0x03,	%g6
	andcc	%l4,	%i6,	%i1
loop_1279:
	bvc,a	loop_1281
loop_1280:
	srl	%l1,	0x02,	%i4
	for	%f12,	%f6,	%f2
	fabsd	%f0,	%f8
loop_1281:
	bcs,a	%xcc,	loop_1282
	sub	%o7,	0x0D0A,	%g5
	and	%l2,	%o1,	%o4
	fornot2s	%f6,	%f6,	%f9
loop_1282:
	fandnot1s	%f5,	%f6,	%f9
	xorcc	%o3,	%l3,	%l7
	sll	%g2,	%i5,	%o2
	xnorcc	%l6,	0x1328,	%l5
	fsrc1	%f0,	%f8
	addccc	%i3,	0x002B,	%o0
	sllx	%i7,	%g7,	%o6
	fabss	%f9,	%f11
	orn	%g4,	%l0,	%g1
	fand	%f8,	%f8,	%f6
	bpos	loop_1283
	andncc	%g3,	%i0,	%o5
	xor	%i2,	%g6,	%l4
	xor	%i6,	%i4,	%i1
loop_1283:
	andn	%o7,	%l2,	%o1
	subc	%o4,	0x0982,	%l1
	xnor	%o3,	%l3,	%g2
	srlx	%i5,	0x09,	%l7
	andncc	%o2,	%l5,	%g5
	bcs,pn	%icc,	loop_1284
	addcc	%o0,	0x0569,	%i3
	subcc	%i7,	%l6,	%g4
	bcs,a	loop_1285
loop_1284:
	bleu,a	%icc,	loop_1286
	subccc	%g7,	%o6,	%l0
	addc	%i0,	%g1,	%i2
loop_1285:
	andn	%o5,	0x1D15,	%g3
loop_1286:
	addc	%g6,	%l4,	%i4
	fnegd	%f4,	%f10
	fands	%f3,	%f9,	%f8
	sub	%o7,	%i1,	%i6
	brlz,a	%o1,	loop_1287
	sub	%o4,	%l2,	%l3
	xorcc	%l1,	%g2,	%i5
	fsrc1	%f2,	%f6
loop_1287:
	sllx	%l7,	0x04,	%l5
	add	%o2,	0x19D7,	%g5
	sub	%o0,	%i3,	%i7
	fmovd	%f4,	%f4
	addcc	%g4,	0x0448,	%g7
	bge	%xcc,	loop_1288
	fnot1s	%f6,	%f10
	xnorcc	%l6,	0x12FB,	%o6
	brlez,a	%o3,	loop_1289
loop_1288:
	sub	%g1,	%i0,	%o5
	bneg	%xcc,	loop_1290
	xorcc	%i2,	%g3,	%g6
loop_1289:
	addccc	%i4,	%l4,	%o7
	fnot2	%f12,	%f6
loop_1290:
	addc	%l0,	%o1,	%i1
	sethi	0x02F4,	%i6
	fornot1s	%f15,	%f5,	%f15
	or	%l2,	0x0D44,	%l1
	srl	%g2,	0x1B,	%l3
	andn	%i5,	0x0EB3,	%l5
	for	%f0,	%f10,	%f4
	fornot1	%f8,	%f8,	%f8
	or	%o4,	0x0A8F,	%l7
	fnands	%f3,	%f0,	%f6
	fmovs	%f10,	%f13
	bvs,pn	%xcc,	loop_1291
	fnand	%f0,	%f10,	%f8
	fsrc1s	%f15,	%f5
	sra	%o2,	0x13,	%i3
loop_1291:
	bge,a,pt	%icc,	loop_1292
	fand	%f8,	%f10,	%f6
	fmovd	%f6,	%f0
	fnor	%f4,	%f6,	%f2
loop_1292:
	addc	%o0,	%i7,	%g7
	fsrc2	%f4,	%f14
	sra	%g5,	%o6,	%o3
	fxnors	%f10,	%f11,	%f14
	orcc	%l6,	%g1,	%i0
	sethi	0x0413,	%g4
	subc	%o5,	0x0950,	%g6
	andcc	%i2,	0x1AA0,	%i4
	xnor	%l4,	0x045C,	%l0
	brlez,a	%o1,	loop_1293
	fabsd	%f0,	%f2
	addc	%g3,	%o7,	%i1
	fornot2s	%f0,	%f6,	%f13
loop_1293:
	sra	%i6,	0x1B,	%l1
	fnor	%f6,	%f6,	%f8
	orncc	%l2,	%i5,	%l3
	bge,pt	%xcc,	loop_1294
	sethi	0x0000,	%l5
	xorcc	%o4,	0x140A,	%l7
	xnorcc	%g2,	%o2,	%i7
loop_1294:
	sllx	%i3,	%g5,	%o0
	fand	%f8,	%f12,	%f10
	fmovs	%f7,	%f13
	xor	%g7,	0x0E40,	%l6
	andncc	%o6,	%g1,	%o3
	srl	%o5,	0x14,	%g4
	xnorcc	%g6,	%i0,	%i2
	sethi	0x0B1A,	%i4
	addc	%l0,	%o1,	%l4
	addc	%o7,	%g3,	%i1
	sethi	0x0CAD,	%i6
	brlez	%i5,	loop_1295
	andn	%l2,	%l1,	%l5
	sethi	0x1B2E,	%o4
	fzeros	%f9
loop_1295:
	xnorcc	%l3,	%g2,	%l7
	brz	%i7,	loop_1296
	addccc	%o2,	%i3,	%o0
	ble,pt	%xcc,	loop_1297
	srlx	%g5,	%l6,	%g1
loop_1296:
	bvc,a	%xcc,	loop_1298
	fnors	%f0,	%f2,	%f9
loop_1297:
	fsrc1s	%f7,	%f1
	xorcc	%o3,	0x1470,	%o5
loop_1298:
	bleu,a,pt	%xcc,	loop_1299
	sra	%g4,	0x0B,	%g7
	xnor	%i0,	%i2,	%o6
	sethi	0x0588,	%l0
loop_1299:
	sll	%o1,	0x1C,	%i4
	orn	%g6,	%g3,	%i1
	xnor	%i6,	0x0A18,	%i5
	andncc	%l4,	%o7,	%l1
	ba,a,pn	%icc,	loop_1300
	bleu,a	loop_1301
	srl	%l2,	%l3,	%g2
	faligndata	%f2,	%f4,	%f2
loop_1300:
	fabss	%f14,	%f2
loop_1301:
	sub	%l7,	%o4,	%i7
	bcc	%icc,	loop_1302
	addc	%i3,	0x1D23,	%o2
	xnorcc	%l5,	%o0,	%g1
	srlx	%o3,	0x1F,	%g5
loop_1302:
	bge,pt	%icc,	loop_1303
	fornot2s	%f9,	%f6,	%f9
	orn	%l6,	0x07A3,	%o5
	fandnot2	%f10,	%f0,	%f4
loop_1303:
	orncc	%g4,	0x1653,	%i2
	faligndata	%f2,	%f6,	%f2
	bvs,a,pt	%icc,	loop_1304
	xnorcc	%i0,	0x1286,	%o6
	andcc	%o1,	%g7,	%l0
	xnor	%g6,	0x0250,	%g3
loop_1304:
	xnor	%i6,	%i1,	%i5
	sll	%l4,	%i4,	%o7
	subcc	%l3,	%g2,	%l7
	subc	%o4,	0x10C0,	%l2
	fornot2	%f14,	%f6,	%f14
	sllx	%i3,	0x0D,	%o2
	or	%l5,	%l1,	%i7
	xnorcc	%o3,	%o0,	%g1
	subccc	%l6,	0x108A,	%o5
	or	%g4,	%i0,	%i2
	sra	%g5,	0x13,	%o6
	bne,a,pt	%xcc,	loop_1305
	srax	%l0,	0x00,	%g7
	andncc	%o1,	%g3,	%i6
	andncc	%i1,	%g6,	%i4
loop_1305:
	andn	%i5,	%l4,	%l3
	fxnor	%f4,	%f10,	%f12
	addc	%l7,	%g2,	%o4
	sra	%i3,	%l2,	%o7
	bpos	loop_1306
	andn	%o2,	0x1553,	%l5
	orn	%l1,	0x0CAE,	%i7
	be,a,pn	%xcc,	loop_1307
loop_1306:
	bgu,pt	%xcc,	loop_1308
	addccc	%o3,	%g1,	%o0
	be,pt	%xcc,	loop_1309
loop_1307:
	xnorcc	%l6,	0x0FD4,	%i0
loop_1308:
	fnot1	%f14,	%f2
	srlx	%i2,	0x13,	%g5
loop_1309:
	fnot2	%f12,	%f10
	subcc	%g4,	0x1BCC,	%l0
	addcc	%o5,	%g7,	%o6
	andn	%i6,	%i1,	%g6
	sethi	0x0189,	%i4
	and	%o1,	%l4,	%g3
	brz,a	%l7,	loop_1310
	fxor	%f4,	%f2,	%f8
	subcc	%g2,	%o4,	%l3
	sethi	0x032C,	%i3
loop_1310:
	srax	%i5,	%o7,	%l2
	xorcc	%o2,	0x199C,	%l1
	brlz	%o3,	loop_1311
	fxors	%f14,	%f8,	%f14
	subc	%l5,	0x111B,	%g1
	fors	%f14,	%f12,	%f15
loop_1311:
	andn	%i7,	%o0,	%i0
	fandnot1	%f10,	%f0,	%f14
	bcs,a	%xcc,	loop_1312
	fnand	%f4,	%f6,	%f2
	andn	%i2,	%g4,	%l0
	fnands	%f7,	%f11,	%f10
loop_1312:
	brgz,a	%g5,	loop_1313
	orn	%g7,	0x0EF6,	%o5
	orcc	%l6,	%i1,	%o6
	bpos,a,pn	%icc,	loop_1314
loop_1313:
	fabss	%f3,	%f0
	fandnot2s	%f0,	%f6,	%f0
	xnor	%g6,	%i6,	%l4
loop_1314:
	fnand	%f12,	%f0,	%f6
	xor	%g3,	%i4,	%o1
	addccc	%l7,	%l3,	%i3
	andn	%o4,	0x1A7F,	%i5
	bleu	loop_1315
	brgez	%l2,	loop_1316
	fornot2s	%f1,	%f10,	%f6
	orn	%o7,	%l1,	%g2
loop_1315:
	and	%o3,	0x0CE6,	%g1
loop_1316:
	andncc	%l5,	%i7,	%o0
	fxnors	%f1,	%f1,	%f10
	add	%o2,	%g4,	%l0
	fabsd	%f0,	%f4
	sethi	0x1F62,	%i2
	fnands	%f15,	%f5,	%f6
	fxor	%f8,	%f0,	%f14
	orcc	%g5,	0x1803,	%g7
	add	%i0,	0x1E79,	%i1
	sra	%o6,	0x16,	%g6
	add	%o5,	%l6,	%i6
	bleu,a,pt	%icc,	loop_1317
	bge	%icc,	loop_1318
	add	%i4,	%l4,	%o1
	brnz	%g3,	loop_1319
loop_1317:
	andcc	%l3,	%o4,	%i5
loop_1318:
	sll	%l7,	%o7,	%l1
	orn	%l2,	0x0858,	%i3
loop_1319:
	or	%g1,	%o3,	%g2
	xnorcc	%l5,	%i7,	%o0
	sllx	%o2,	0x05,	%l0
	andncc	%g5,	%g7,	%i2
	or	%i0,	0x1E7D,	%o6
	sethi	0x1977,	%g6
	andncc	%g4,	%l6,	%o5
	fxnor	%f6,	%f10,	%f0
	srl	%i1,	%l4,	%i4
	subc	%o1,	%l3,	%i6
	or	%g3,	%i5,	%o7
	fsrc1	%f2,	%f12
	fsrc2s	%f4,	%f5
	fnand	%f14,	%f6,	%f8
	addcc	%o4,	%l2,	%l1
	addcc	%i3,	0x0509,	%o3
	orcc	%g1,	%g2,	%l7
	xorcc	%i7,	%l5,	%o2
	fsrc1s	%f0,	%f4
	fnot2s	%f0,	%f5
	fabsd	%f10,	%f14
	subcc	%l0,	0x1C6A,	%o0
	orncc	%i2,	0x0A39,	%i0
	brgez,a	%g7,	loop_1320
	sllx	%g6,	%g5,	%l6
	subccc	%g4,	0x180C,	%o6
	bge,pt	%xcc,	loop_1321
loop_1320:
	fsrc1	%f0,	%f8
	srlx	%l4,	0x1A,	%o5
	fabsd	%f10,	%f12
loop_1321:
	bpos	loop_1322
	fnors	%f9,	%f13,	%f3
	fandnot2	%f6,	%f12,	%f14
	bl,a,pn	%xcc,	loop_1323
loop_1322:
	orn	%i1,	0x0768,	%l3
	addc	%o1,	0x1D46,	%g3
	fnand	%f2,	%f0,	%f0
loop_1323:
	and	%i5,	0x19FC,	%i4
	srlx	%i6,	0x1C,	%o7
	xnorcc	%l2,	%i3,	%l1
	fnot1s	%f2,	%f10
	xnorcc	%o3,	0x0AF2,	%g1
	fands	%f1,	%f6,	%f1
	xorcc	%l7,	0x09A0,	%o4
	xnor	%g2,	0x06BC,	%i7
	orn	%l0,	0x141C,	%o2
	srax	%i2,	%o0,	%g7
	fnegs	%f11,	%f12
	bgu,a	%icc,	loop_1324
	srl	%i0,	%g6,	%l5
	sra	%l6,	%g5,	%o6
	bn	%xcc,	loop_1325
loop_1324:
	fmovd	%f4,	%f8
	sll	%g4,	%i1,	%l3
	orncc	%o1,	0x1F6E,	%o5
loop_1325:
	brgz,a	%i5,	loop_1326
	sllx	%g3,	%i4,	%l4
	bvs	loop_1327
	fsrc2s	%f10,	%f0
loop_1326:
	fnegd	%f6,	%f2
	add	%l2,	%o7,	%i3
loop_1327:
	addccc	%i6,	%g1,	%l1
	srl	%l7,	%o4,	%i7
	srlx	%g2,	%l0,	%i2
	addccc	%o2,	%o3,	%i0
	bpos,a	%xcc,	loop_1328
	fxnor	%f8,	%f12,	%f0
	andn	%g6,	0x1DCB,	%o0
	bne,a,pn	%xcc,	loop_1329
loop_1328:
	bn,a	loop_1330
	fnor	%f0,	%f0,	%f10
	or	%l6,	0x1213,	%l5
loop_1329:
	xnor	%g7,	%g5,	%i1
loop_1330:
	srl	%l3,	0x02,	%o6
	fzeros	%f7
	andncc	%o5,	%o1,	%g3
	ba,a,pn	%icc,	loop_1331
	andcc	%g4,	%l4,	%i4
	fandnot2	%f6,	%f14,	%f4
	fnor	%f10,	%f12,	%f2
loop_1331:
	sllx	%l2,	0x1B,	%i3
	xorcc	%o7,	0x11BB,	%g1
	andcc	%l1,	0x1BBC,	%i6
	andn	%o4,	0x0DA5,	%l7
	xnor	%g2,	%l0,	%i5
	srlx	%o2,	0x15,	%o3
	add	%i0,	0x1F04,	%i7
	bleu	%xcc,	loop_1332
	and	%g6,	0x08FC,	%o0
	bgu,a,pn	%xcc,	loop_1333
	addcc	%i2,	%l6,	%l5
loop_1332:
	or	%g7,	%l3,	%i1
	subcc	%g5,	%o6,	%o5
loop_1333:
	fornot2s	%f13,	%f6,	%f6
	bl	loop_1334
	fandnot2	%f0,	%f6,	%f2
	fzeros	%f8
	fornot2s	%f15,	%f11,	%f6
loop_1334:
	faligndata	%f4,	%f6,	%f8
	brlez,a	%g4,	loop_1335
	subc	%g3,	0x0362,	%i4
	or	%l2,	%i3,	%o7
	fsrc2	%f14,	%f8
loop_1335:
	or	%o1,	%g1,	%i6
	andcc	%l1,	%o4,	%l7
	sra	%l0,	0x1C,	%l4
	fornot1	%f6,	%f4,	%f14
	subcc	%o2,	0x1EFD,	%o3
	bne	loop_1336
	andn	%i5,	%i0,	%i7
	fnegs	%f12,	%f4
	fand	%f2,	%f8,	%f12
loop_1336:
	fsrc1s	%f5,	%f3
	srl	%o0,	%i2,	%g2
	sllx	%l6,	%g6,	%g7
	xorcc	%l5,	%i1,	%l3
	bcc,a	loop_1337
	subccc	%o6,	0x08ED,	%g4
	add	%o5,	%g3,	%g5
	ble,a,pn	%xcc,	loop_1338
loop_1337:
	fnegd	%f14,	%f2
	fand	%f14,	%f14,	%f14
	ble,pt	%icc,	loop_1339
loop_1338:
	andncc	%i4,	%o7,	%l2
	add	%o1,	0x1146,	%i6
	addccc	%l1,	%g1,	%i3
loop_1339:
	orn	%l7,	%l0,	%l4
	orcc	%o3,	0x1B34,	%o4
	or	%i0,	0x10D9,	%i7
	xnor	%o0,	0x11FF,	%o2
	fmovs	%f10,	%f5
	or	%i2,	%l6,	%i5
	srlx	%g2,	%g7,	%g6
	sethi	0x0CE7,	%l3
	orncc	%o6,	0x0D4B,	%g4
	bl,a,pt	%xcc,	loop_1340
	sethi	0x1639,	%o5
	srlx	%l5,	%g5,	%g3
	xnor	%o7,	0x195C,	%i1
loop_1340:
	and	%l2,	%i6,	%i4
	bcs,a	loop_1341
	xor	%o1,	0x0AA1,	%l1
	srlx	%g1,	%l0,	%i3
	andncc	%l4,	%l7,	%o4
loop_1341:
	addccc	%i0,	0x0896,	%o3
	xorcc	%o0,	0x112C,	%i2
	andn	%l6,	0x0DA9,	%i5
	fandnot1s	%f15,	%f11,	%f7
	xorcc	%i7,	%o2,	%g2
	bn,pt	%icc,	loop_1342
	fabsd	%f0,	%f2
	fors	%f14,	%f11,	%f4
	and	%g6,	0x1B27,	%g7
loop_1342:
	orncc	%o6,	0x0EF7,	%l3
	xnor	%l5,	%g5,	%g3
	orncc	%o7,	%i1,	%o5
	andncc	%l2,	%g4,	%i4
	fsrc1	%f10,	%f4
	orcc	%l1,	%o1,	%l0
	xnorcc	%i3,	%g1,	%l4
	srax	%o4,	0x10,	%l7
	bneg,a	%icc,	loop_1343
	add	%i6,	%o3,	%i2
	orcc	%i0,	0x019B,	%l6
	andn	%i7,	0x1D43,	%i5
loop_1343:
	addc	%g2,	%o0,	%g6
	xor	%o6,	%l3,	%g7
	xorcc	%o2,	0x031E,	%g3
	fsrc2	%f8,	%f10
	srl	%o7,	0x0F,	%l5
	xor	%o5,	%i1,	%g4
	xnorcc	%g5,	%l2,	%l1
	srlx	%o1,	%l0,	%i3
	fandnot2s	%f15,	%f4,	%f7
	fandnot1s	%f15,	%f3,	%f14
	srlx	%i4,	0x00,	%g1
	sra	%l7,	%i6,	%o4
	be,pt	%icc,	loop_1344
	fabss	%f7,	%f14
	xnorcc	%o3,	%i2,	%l6
	ble,a	%icc,	loop_1345
loop_1344:
	sra	%i7,	0x00,	%l4
	bcc,a,pn	%icc,	loop_1346
	xor	%i5,	0x0089,	%i0
loop_1345:
	or	%g6,	%o6,	%g2
	subccc	%g7,	%o0,	%g3
loop_1346:
	srl	%o7,	0x01,	%o2
	sra	%l3,	0x18,	%l5
	fxnors	%f2,	%f7,	%f2
	andcc	%i1,	%g4,	%l2
	fornot2	%f12,	%f6,	%f12
	fandnot2s	%f9,	%f11,	%f0
	sllx	%g5,	%l1,	%l0
	sub	%i3,	0x1DD5,	%o5
	subc	%o1,	0x0748,	%l7
	brz,a	%g1,	loop_1347
	bleu,pt	%xcc,	loop_1348
	orncc	%o4,	%i6,	%o3
	fxors	%f4,	%f6,	%f9
loop_1347:
	addccc	%l6,	%i4,	%l4
loop_1348:
	xnorcc	%i2,	0x1C61,	%i5
	srl	%i0,	%o6,	%g6
	fnors	%f10,	%f11,	%f2
	add	%g2,	%o0,	%g3
	bge,a	%icc,	loop_1349
	sra	%i7,	%o2,	%o7
	orncc	%l5,	%g7,	%i1
	brlz	%l2,	loop_1350
loop_1349:
	fand	%f0,	%f0,	%f2
	xor	%g5,	%l1,	%l3
	orn	%i3,	%o5,	%g4
loop_1350:
	fzero	%f14
	andcc	%l7,	0x00BA,	%o1
	addc	%g1,	0x17C0,	%l0
	orcc	%o4,	0x0C29,	%l6
	andcc	%o3,	%l4,	%i4
	srax	%i6,	%i2,	%i0
	faligndata	%f14,	%f4,	%f10
	sethi	0x044E,	%g6
	addccc	%g2,	%o0,	%i5
	xorcc	%o6,	%i7,	%g3
	fnot2	%f2,	%f12
	sethi	0x1DB6,	%o2
	bleu	%xcc,	loop_1351
	sethi	0x1E87,	%g7
	andncc	%i1,	%l2,	%g5
	bne,a	%xcc,	loop_1352
loop_1351:
	sub	%o7,	0x1346,	%l5
	xnor	%i3,	0x16C3,	%l1
	fzero	%f6
loop_1352:
	fxor	%f14,	%f10,	%f4
	bl	%icc,	loop_1353
	orcc	%g4,	0x0AC6,	%l3
	be	%xcc,	loop_1354
	orcc	%l7,	0x07BC,	%o5
loop_1353:
	orcc	%o1,	%o4,	%l0
	fxor	%f2,	%f10,	%f8
loop_1354:
	xnor	%g1,	%o3,	%l4
	add	%i4,	0x1932,	%l6
	sll	%i2,	0x1E,	%g6
	fnot2	%f10,	%f6
	brlez,a	%i6,	loop_1355
	bneg,a,pn	%icc,	loop_1356
	andcc	%g2,	%i0,	%o0
	sethi	0x1EC1,	%o6
loop_1355:
	sethi	0x1B83,	%g3
loop_1356:
	orn	%o2,	0x1B1D,	%i5
	addc	%g7,	%i1,	%i7
	sub	%g5,	0x117F,	%o7
	fornot2s	%f12,	%f2,	%f0
	andn	%i3,	%l1,	%l2
	xnor	%l5,	%g4,	%l7
	sllx	%o1,	0x09,	%o5
	xor	%o4,	%g1,	%l3
	srl	%o3,	%l4,	%l6
	subc	%l0,	0x1896,	%i4
	sra	%g6,	%i2,	%g2
	bgu,a	%icc,	loop_1357
	srlx	%o0,	0x1B,	%i6
	xorcc	%g3,	0x0733,	%i0
	addcc	%o2,	%o6,	%g7
loop_1357:
	bleu,pt	%icc,	loop_1358
	orcc	%i5,	0x0BAD,	%g5
	fnand	%f2,	%f12,	%f10
	bpos,a,pn	%icc,	loop_1359
loop_1358:
	bvc,a	%icc,	loop_1360
	sll	%i7,	0x0E,	%o7
	faligndata	%f0,	%f4,	%f8
loop_1359:
	or	%i3,	0x05F9,	%l1
loop_1360:
	fxors	%f5,	%f15,	%f10
	sll	%i1,	0x02,	%g4
	faligndata	%f12,	%f12,	%f2
	fnor	%f0,	%f8,	%f14
	fornot1s	%f0,	%f13,	%f7
	fornot1s	%f15,	%f0,	%f7
	fornot2	%f10,	%f6,	%f0
	srlx	%l2,	0x00,	%l5
	fnor	%f8,	%f0,	%f0
	brgz	%o5,	loop_1361
	ble	%xcc,	loop_1362
	subccc	%l7,	0x1904,	%o1
	bvs,a	loop_1363
loop_1361:
	sllx	%g1,	0x14,	%o4
loop_1362:
	bvc,a	%icc,	loop_1364
	addcc	%l4,	0x077A,	%o3
loop_1363:
	fnot2	%f6,	%f14
	addcc	%l3,	%l0,	%i4
loop_1364:
	addc	%l6,	%i2,	%g6
	addcc	%i6,	0x1E12,	%g2
	addcc	%i0,	0x1CF3,	%o0
	sethi	0x03A1,	%o6
	sra	%g3,	0x04,	%i5
	orn	%g7,	0x1292,	%o2
	or	%o7,	0x1394,	%g5
	andncc	%i3,	%l1,	%i1
	srax	%i7,	0x15,	%g4
	fones	%f8
	for	%f12,	%f14,	%f6
	xorcc	%l2,	%l5,	%o5
	andn	%o1,	0x000C,	%o4
	addc	%l7,	%o3,	%l3
	andncc	%g1,	%i4,	%l4
	sethi	0x1DFD,	%i2
	add	%l0,	0x14F4,	%g6
	sethi	0x180B,	%l6
	addcc	%i6,	%o0,	%g2
	xnor	%g3,	0x1B64,	%i5
	xor	%o6,	0x1EE8,	%o2
	fxor	%f8,	%f4,	%f2
	or	%g7,	%o7,	%i3
	xnor	%l1,	%i0,	%g5
	addc	%i1,	0x1709,	%g4
	andcc	%i7,	%l5,	%o1
	xor	%o4,	%o5,	%l7
	xor	%l2,	%l3,	%o3
	srax	%i4,	0x09,	%l4
	addccc	%g1,	0x0FE0,	%l0
	fandnot2	%f8,	%f2,	%f0
	sub	%g6,	%i6,	%i2
	sllx	%o0,	%g2,	%l6
	subccc	%o6,	%o2,	%g7
	orn	%o7,	0x1F4B,	%g3
	fones	%f1
	srlx	%l1,	%i0,	%g5
	subcc	%i3,	%g4,	%i7
	bn,a,pn	%xcc,	loop_1365
	add	%l5,	0x0812,	%i1
	andcc	%i5,	0x0429,	%o4
	or	%o5,	0x0423,	%l2
loop_1365:
	xor	%l3,	0x12C7,	%l7
	xnorcc	%o3,	0x1F09,	%o1
	fnot2	%f0,	%f8
	fxnor	%f14,	%f14,	%f4
	fsrc2	%f12,	%f0
	add	%l4,	0x1130,	%l0
	sub	%i4,	0x1154,	%i6
	fzero	%f0
	fnegs	%f6,	%f12
	sll	%g6,	0x08,	%g1
	sra	%i2,	0x0B,	%o0
	xorcc	%o6,	0x0412,	%l6
	add	%g2,	%g7,	%o2
	fsrc1s	%f5,	%f12
	xnor	%l1,	0x1C1C,	%i0
	andcc	%g3,	%o7,	%g5
	xorcc	%g4,	0x1CD9,	%l5
	srl	%i1,	0x08,	%i3
	fsrc1s	%f7,	%f10
	subccc	%i7,	0x1373,	%i5
	andncc	%l2,	%o5,	%l3
	fandnot1s	%f14,	%f12,	%f7
	srlx	%o3,	%l7,	%o1
	sll	%l0,	%i4,	%i6
	srax	%l4,	%g6,	%o4
	brnz,a	%i2,	loop_1366
	bl,a	loop_1367
	fandnot1	%f10,	%f10,	%f12
	sub	%g1,	0x191E,	%o0
loop_1366:
	andcc	%l6,	%g2,	%o6
loop_1367:
	sub	%g7,	%o2,	%l1
	bneg,a,pt	%icc,	loop_1368
	sllx	%i0,	0x1A,	%g3
	orn	%g5,	%g4,	%l5
	ba,pn	%icc,	loop_1369
loop_1368:
	fnands	%f2,	%f11,	%f11
	andncc	%i1,	%i3,	%o7
	fzeros	%f13
loop_1369:
	srax	%i7,	0x17,	%i5
	bcs,a,pn	%xcc,	loop_1370
	brgz,a	%l2,	loop_1371
	sra	%l3,	0x1D,	%l7
	or	%o3,	%o1,	%i4
loop_1370:
	sll	%o5,	0x0A,	%l0
loop_1371:
	orn	%l4,	%g6,	%o4
	andcc	%g1,	0x196B,	%o0
	fzeros	%f8
	addc	%i6,	0x0BE1,	%l6
	srl	%o6,	0x0E,	%g7
	sub	%g2,	0x0F6D,	%o2
	xor	%i0,	%g3,	%l1
	sll	%g5,	0x0B,	%g4
	bge,a	loop_1372
	brz,a	%l5,	loop_1373
	addcc	%i3,	%i1,	%i7
	fandnot2	%f12,	%f10,	%f8
loop_1372:
	brgez,a	%o7,	loop_1374
loop_1373:
	fnands	%f1,	%f11,	%f7
	xnorcc	%l2,	0x028B,	%l3
	srlx	%i5,	%o3,	%i2
loop_1374:
	fzero	%f2
	subccc	%l7,	0x151F,	%o1
	orncc	%l0,	0x1A28,	%l4
	xorcc	%g6,	0x1694,	%o4
	addc	%o5,	%i4,	%g1
	sethi	0x032D,	%l6
	sra	%o0,	%o6,	%i6
	sethi	0x1CD7,	%o2
	add	%g7,	%g3,	%l1
	fsrc1s	%f11,	%f0
	addc	%i0,	%g2,	%g4
	brlz,a	%i3,	loop_1375
	andn	%l5,	0x1742,	%i1
	fabss	%f4,	%f11
	xorcc	%g5,	%o7,	%i7
loop_1375:
	sethi	0x0B7E,	%i5
	xorcc	%l3,	%o3,	%i2
	fone	%f10
	sra	%l2,	%o1,	%l7
	bvc,pt	%icc,	loop_1376
	xnorcc	%l0,	0x16CD,	%g6
	sra	%o4,	0x07,	%l4
	xorcc	%g1,	0x14A1,	%l6
loop_1376:
	subccc	%o5,	%i4,	%i6
	fsrc2s	%f12,	%f1
	or	%o2,	0x02D6,	%g7
	andncc	%g3,	%o0,	%l1
	addc	%o6,	%i0,	%i3
	subccc	%l5,	0x1D8C,	%g2
	orncc	%g5,	0x18ED,	%i1
	subcc	%g4,	0x0359,	%i7
	bcs,pt	%icc,	loop_1377
	xnorcc	%o7,	0x128E,	%l3
	sll	%i5,	0x0D,	%l2
	orncc	%o1,	%o3,	%l0
loop_1377:
	fornot1	%f12,	%f6,	%f4
	addccc	%g6,	0x09ED,	%l7
	orncc	%l4,	%o4,	%l6
	subc	%o5,	0x0E5C,	%i4
	xnorcc	%i6,	0x0594,	%i2
	sethi	0x05F6,	%g1
	sra	%o2,	%o0,	%g7
	fsrc1	%f0,	%f4
	sll	%g3,	0x1C,	%o6
	subccc	%i0,	%l1,	%l5
	orncc	%g5,	%i1,	%g2
	xnor	%i7,	%o7,	%l3
	fsrc1	%f4,	%f12
	fornot1s	%f6,	%f1,	%f5
	xor	%i3,	0x0F15,	%i5
	bn,a	loop_1378
	addcc	%o1,	%g4,	%o3
	addcc	%l2,	%l0,	%g6
	orn	%o4,	%l6,	%o5
loop_1378:
	sllx	%l7,	%l4,	%i6
	fxor	%f6,	%f14,	%f12
	andncc	%g1,	%i4,	%o0
	sethi	0x0D5B,	%o2
	brnz,a	%g3,	loop_1379
	orncc	%o6,	0x1480,	%g7
	add	%i0,	%l5,	%g5
	or	%l1,	0x0489,	%i1
loop_1379:
	addc	%g2,	%i2,	%o7
	orn	%i3,	0x13F7,	%l3
	sethi	0x0097,	%i5
	srl	%i7,	0x1F,	%o1
	srax	%o3,	0x1B,	%l0
	addcc	%g4,	%g6,	%l2
	fnor	%f6,	%f0,	%f2

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Diag:
!
!	Type f   	: 2031
!	Type cti   	: 1379
!	Type i   	: 6093
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0xF6C3CD69
.word 0xF9BF7BCA
.word 0xB9798D2B
.word 0x949B25E6
.word 0xFB9F9681
.word 0x227609B5
.word 0x0606D12F
.word 0xD253F633
.word 0xE3364DD2
.word 0xD6A30484
.word 0xE4868EA7
.word 0x0E142A2E
.word 0x789D1091
.word 0x761F54C0
.word 0x9F2FD2A5
.word 0x4B877D46
.word 0xA45C9B74
.word 0x36F8CD74
.word 0xA8DE3A42
.word 0x2F12D0BE
.word 0x83F461F7
.word 0x896697AB
.word 0xC65DE669
.word 0xC36F28C3
.word 0x0C2018D2
.word 0x288FE64A
.word 0x97941C7B
.word 0xC8835C9C
.word 0x6B6E53DC
.word 0x61DA3113
.word 0x479566CB
.word 0x076637B2
.word 0x0DE61B88
.word 0x768B816D
.word 0x166A486E
.word 0x923A2CFC
.word 0x7411A2FB
.word 0xDD2271E7
.word 0xADFFA1F0
.word 0xED3C5768
.word 0x0872BF1B
.word 0xBE7BEAA0
.word 0xC09F3D71
.word 0xA25B921B
.word 0xCA69DC2C
.word 0xFF518285
.word 0xF6D79718
.word 0x123819A0
.word 0x5C60149C
.word 0xDEE1F6DB
.word 0x49E4D25A
.word 0xAF31D753
.word 0xAA8C1A8F
.word 0x0FCB3159
.word 0x5172497E
.word 0x88EE7CC9
.word 0xA5E4F351
.word 0xCF39C0FE
.word 0xF558AC2B
.word 0xDB5896C7
.word 0x325C5E47
.word 0xF758FB44
.word 0x3961083A
.word 0x82FC357B
.end
