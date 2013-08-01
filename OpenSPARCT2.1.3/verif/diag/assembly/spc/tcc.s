/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcc.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ spc_basic_isa2.pl FOCUS_SEED=804309008"
.ident "BY rg131678 ON Thu Jun 26 17:23:08 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: tcc.s,v 1.3 2007/07/05 22:02:08 drp Exp $"
#include "defines.h"
#include "old_boot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	ta	T_RD_THID
	mov	%o1, %l6
	umul	%l6, 256, %l7
	setx	DIAG_DATA_AREA, %g1, %g3
	add	%l7, %g3, %l7

	!# Initialize registers ..

	!# Global registers
	set	0x3,	%g1
	set	0x1,	%g2
	set	0xF,	%g3
	set	0x3,	%g4
	set	0xE,	%g5
	set	0xF,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x7,	%i1
	set	-0xC,	%i2
	set	-0xD,	%i3
	set	-0x6,	%i4
	set	-0xA,	%i5
	set	-0xE,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x3DE7A298,	%l0
	set	0x562541BA,	%l1
	set	0x2A7D95DB,	%l2
	set	0x32AF16C7,	%l3
	set	0x27C91381,	%l4
	set	0x504B3E5E,	%l5
	set	0x79445C00,	%l6
	!# Output registers
	set	-0x06EB,	%o0
	set	-0x03D1,	%o1
	set	0x07D0,	%o2
	set	0x083D,	%o3
	set	-0x07CD,	%o4
	set	-0x1706,	%o5
	set	0x03B0,	%o6
	set	0x025A,	%o7

	!# Execute some ALU ops ..

	tn	%xcc,	0x2
	smulcc	%l2,	0x1817,	%i1
	tcs	%icc,	0x1
	edge16	%o0,	%l5,	%g3
	tle	%xcc,	0x1
	edge32	%i5,	%o5,	%i4
	popc	%l4,	%l6
	orn	%i3,	0x0739,	%g2
	edge8	%o7,	%o4,	%l1
	edge8l	%i6,	%g4,	%g7
	tg	%xcc,	0x7
	movvc	%xcc,	%i2,	%g6
	movrgez	%o1,	%o6,	%i0
	movrgez	%l3,	0x269,	%g1
	addccc	%g5,	%i7,	%o2
	andn	%l0,	%l2,	%i1
	mova	%xcc,	%o3,	%l5
	tg	%xcc,	0x4
	movl	%icc,	%g3,	%o0
	taddcctv	%o5,	0x0ED1,	%i4
	tsubcc	%l4,	%i5,	%l6
	tl	%xcc,	0x6
	edge32ln	%i3,	%g2,	%o7
	umul	%o4,	0x0A2F,	%l1
	edge16n	%g4,	%g7,	%i6
	xnorcc	%g6,	0x1EF8,	%o1
	brnz,a	%o6,	loop_1
	lduh	[%l7 + 0x70],	%i2
	andn	%l3,	0x10EE,	%g1
	movneg	%xcc,	%i0,	%g5
loop_1:
	andn	%i7,	0x19FC,	%l0
	sra	%l2,	%o2,	%i1
	movl	%xcc,	%l5,	%o3
	edge8	%o0,	%o5,	%g3
	xnor	%i4,	%l4,	%l6
	movgu	%xcc,	%i3,	%i5
	movre	%o7,	%o4,	%g2
	movrgez	%g4,	0x19B,	%g7
	fabss	%f0,	%f8
	andcc	%i6,	0x0CF8,	%g6
	subc	%o1,	0x0D82,	%l1
	tleu	%icc,	0x5
	edge16ln	%i2,	%l3,	%g1
	subc	%o6,	%i0,	%g5
	orncc	%i7,	%l0,	%l2
	edge32l	%o2,	%i1,	%o3
	movrne	%o0,	0x356,	%o5
	andcc	%g3,	0x04C9,	%l5
	edge8l	%l4,	%l6,	%i4
	sdiv	%i5,	0x1F99,	%o7
	mulx	%i3,	%o4,	%g4
	tne	%xcc,	0x1
	udiv	%g7,	0x1274,	%i6
	subc	%g6,	%g2,	%l1
	udivcc	%i2,	0x0CAA,	%l3
	edge8n	%o1,	%g1,	%o6
	tvs	%xcc,	0x4
	edge16n	%i0,	%g5,	%l0
	edge8ln	%l2,	%o2,	%i7
	popc	%o3,	%o0
	edge8ln	%o5,	%i1,	%g3
	ld	[%l7 + 0x3C],	%f5
	sdiv	%l5,	0x0875,	%l4
	xorcc	%l6,	0x1143,	%i4
	addcc	%i5,	%o7,	%o4
	movle	%xcc,	%g4,	%g7
	and	%i6,	%g6,	%i3
	movle	%xcc,	%l1,	%g2
	smulcc	%l3,	0x0D13,	%o1
	edge32ln	%i2,	%o6,	%g1
	tn	%icc,	0x0
	mulx	%i0,	0x1B69,	%g5
	edge32n	%l2,	%o2,	%i7
	movre	%l0,	%o0,	%o5
	movne	%icc,	%o3,	%i1
	or	%l5,	%l4,	%g3
	edge32n	%l6,	%i5,	%i4
	subc	%o4,	0x10A5,	%o7
	tneg	%icc,	0x7
	tpos	%icc,	0x4
	movneg	%icc,	%g4,	%g7
	sll	%i6,	%i3,	%g6
	tneg	%xcc,	0x1
	xorcc	%l1,	%l3,	%g2
	smul	%o1,	0x0194,	%i2
	sdivcc	%g1,	0x14C6,	%i0
	te	%xcc,	0x0
	sllx	%o6,	0x12,	%l2
	sra	%g5,	0x1B,	%o2
	sdivcc	%i7,	0x13E0,	%l0
	tcs	%icc,	0x0
	sth	%o5,	[%l7 + 0x64]
	movrne	%o0,	%i1,	%o3
	sethi	0x0E79,	%l4
	tleu	%icc,	0x2
	movl	%icc,	%l5,	%l6
	popc	0x1CE1,	%i5
	umulcc	%g3,	%o4,	%o7
	edge32l	%i4,	%g7,	%i6
	movneg	%xcc,	%g4,	%i3
	sdivx	%l1,	0x120A,	%g6
	popc	0x008C,	%l3
	tcc	%icc,	0x5
	move	%icc,	%o1,	%i2
	tg	%xcc,	0x6
	subccc	%g2,	0x10DB,	%g1
	movneg	%icc,	%o6,	%l2
	fmovrslz	%i0,	%f5,	%f9
	srax	%o2,	0x05,	%g5
	movrgz	%l0,	%i7,	%o0
	movvs	%icc,	%i1,	%o5
	edge8l	%l4,	%l5,	%o3
	tge	%icc,	0x6
	edge16l	%l6,	%i5,	%g3
	movre	%o4,	0x0DD,	%i4
	movrgz	%o7,	%g7,	%g4
	movrgez	%i6,	0x383,	%l1
	udiv	%i3,	0x0B8F,	%g6
	tgu	%xcc,	0x4
	orcc	%o1,	0x1F1A,	%l3
	edge32ln	%i2,	%g2,	%g1
	smul	%o6,	0x0542,	%l2
	fmovsleu	%xcc,	%f7,	%f6
	movrgz	%i0,	0x119,	%g5
	taddcc	%l0,	%o2,	%o0
	xorcc	%i7,	0x1153,	%o5
	tcc	%xcc,	0x4
	tl	%icc,	0x2
	edge32l	%i1,	%l4,	%o3
	fpadd16s	%f8,	%f3,	%f2
	udiv	%l6,	0x19DE,	%i5
	movgu	%xcc,	%g3,	%o4
	stw	%l5,	[%l7 + 0x48]
	subc	%i4,	0x1432,	%o7
	movrne	%g7,	%g4,	%l1
	tge	%icc,	0x5
	ldx	[%l7 + 0x38],	%i3
	edge16n	%g6,	%o1,	%l3
	stb	%i6,	[%l7 + 0x14]
	edge32l	%i2,	%g1,	%g2
	orcc	%l2,	0x17A5,	%i0
	xnorcc	%o6,	%l0,	%o2
	and	%g5,	%i7,	%o0
	udivx	%i1,	0x1BD4,	%o5
	fbne,a	%fcc3,	loop_2
	addc	%o3,	0x1D1D,	%l6
	sdivcc	%l4,	0x000B,	%i5
	ldub	[%l7 + 0x74],	%g3
loop_2:
	ldx	[%l7 + 0x08],	%o4
	movle	%icc,	%i4,	%l5
	edge8l	%g7,	%o7,	%g4
	addccc	%i3,	%l1,	%o1
	edge32	%l3,	%i6,	%i2
	fabss	%f15,	%f9
	tl	%icc,	0x4
	udiv	%g1,	0x125A,	%g2
	ta	%xcc,	0x3
	tleu	%xcc,	0x6
	alignaddr	%l2,	%i0,	%g6
	srlx	%l0,	0x17,	%o6
	smulcc	%o2,	0x1CEF,	%g5
	sll	%i7,	0x1A,	%i1
	add	%o0,	0x15DF,	%o5
	ldx	[%l7 + 0x18],	%o3
	edge8l	%l4,	%l6,	%g3
	movvc	%xcc,	%i5,	%o4
	tvc	%xcc,	0x7
	tpos	%icc,	0x7
	edge16n	%i4,	%l5,	%o7
	movcs	%icc,	%g7,	%i3
	edge16ln	%l1,	%g4,	%l3
	orcc	%i6,	%o1,	%g1
	movn	%icc,	%i2,	%l2
	tgu	%icc,	0x3
	or	%i0,	%g2,	%l0
	sethi	0x15E1,	%g6
	edge16n	%o2,	%g5,	%i7
	edge16n	%i1,	%o6,	%o5
	edge32ln	%o3,	%o0,	%l6
	tle	%icc,	0x2
	move	%xcc,	%g3,	%i5
	sdivcc	%o4,	0x067B,	%i4
	fmovdle	%icc,	%f6,	%f15
	te	%icc,	0x2
	movrlz	%l5,	0x1BF,	%o7
	alignaddr	%g7,	%i3,	%l4
	edge16n	%l1,	%g4,	%i6
	sdivcc	%l3,	0x0FA5,	%o1
	orncc	%i2,	0x02F0,	%g1
	edge32n	%i0,	%g2,	%l2
	tle	%xcc,	0x7
	movrlez	%l0,	0x1B6,	%o2
	movl	%xcc,	%g5,	%i7
	edge8n	%i1,	%g6,	%o5
	movrlez	%o6,	0x2D8,	%o3
	tge	%icc,	0x6
	movrne	%l6,	0x0F0,	%g3
	movleu	%xcc,	%i5,	%o4
	subcc	%o0,	0x0C73,	%l5
	taddcctv	%i4,	0x02A3,	%o7
	sub	%g7,	%i3,	%l4
	mulx	%g4,	0x0B91,	%l1
	xnor	%i6,	%o1,	%i2
	andcc	%g1,	%i0,	%g2
	umulcc	%l3,	0x1C6D,	%l2
	xor	%l0,	0x0D0B,	%g5
	xorcc	%o2,	0x104D,	%i1
	edge16ln	%g6,	%o5,	%o6
	subcc	%o3,	%l6,	%i7
	srlx	%i5,	0x06,	%o4
	or	%o0,	0x1619,	%g3
	tpos	%xcc,	0x7
	tpos	%icc,	0x7
	movre	%l5,	0x072,	%i4
	alignaddr	%g7,	%o7,	%l4
	edge32n	%i3,	%g4,	%l1
	orncc	%i6,	%o1,	%i2
	edge32l	%g1,	%i0,	%l3
	movl	%xcc,	%l2,	%l0
	tle	%xcc,	0x6
	mulx	%g5,	0x140B,	%g2
	movleu	%icc,	%o2,	%g6
	tle	%xcc,	0x0
	edge16ln	%o5,	%o6,	%o3
	movneg	%icc,	%i1,	%l6
	movne	%xcc,	%i5,	%o4
	edge32l	%i7,	%o0,	%l5
	udivcc	%g3,	0x1849,	%g7
	movcc	%xcc,	%o7,	%l4
	sllx	%i3,	0x04,	%i4
	sll	%l1,	%g4,	%o1
	addcc	%i6,	%g1,	%i2
	edge16ln	%i0,	%l3,	%l2
	movne	%icc,	%g5,	%l0
	movrne	%g2,	0x1B1,	%g6
	te	%xcc,	0x1
	movleu	%icc,	%o2,	%o5
	xnorcc	%o6,	0x0F84,	%i1
	te	%xcc,	0x4
	xnorcc	%l6,	%i5,	%o4
	smulcc	%o3,	%i7,	%o0
	tleu	%xcc,	0x2
	subc	%l5,	%g3,	%g7
	addccc	%l4,	0x1C19,	%i3
	tn	%icc,	0x1
	alignaddrl	%o7,	%i4,	%g4
	tsubcc	%l1,	0x1DC7,	%i6
	mulx	%g1,	%o1,	%i0
	edge32	%l3,	%i2,	%l2
	andn	%l0,	0x144E,	%g5
	tg	%icc,	0x3
	tpos	%icc,	0x1
	andn	%g6,	%o2,	%o5
	andn	%g2,	%i1,	%l6
	sra	%i5,	0x04,	%o6
	or	%o3,	%i7,	%o4
	tcs	%icc,	0x1
	orcc	%o0,	0x0BC4,	%g3
	edge16ln	%l5,	%l4,	%i3
	orcc	%g7,	0x0A41,	%i4
	sll	%o7,	0x00,	%g4
	taddcc	%l1,	%g1,	%o1
	sra	%i0,	0x0D,	%i6
	taddcc	%l3,	0x09F6,	%i2
	tvs	%icc,	0x0
	edge32n	%l0,	%g5,	%g6
	movre	%l2,	%o5,	%o2
	sllx	%i1,	0x0F,	%g2
	movcs	%icc,	%i5,	%l6
	brlez,a	%o6,	loop_3
	movcs	%xcc,	%i7,	%o4
	sdivx	%o3,	0x1D70,	%g3
	movleu	%icc,	%o0,	%l5
loop_3:
	movgu	%xcc,	%i3,	%g7
	addcc	%i4,	0x1C8B,	%o7
	edge16	%g4,	%l1,	%l4
	tge	%xcc,	0x1
	tleu	%xcc,	0x4
	sethi	0x07B8,	%g1
	alignaddrl	%o1,	%i6,	%l3
	te	%xcc,	0x0
	tsubcctv	%i0,	%l0,	%g5
	addcc	%i2,	0x11E3,	%l2
	movvs	%xcc,	%o5,	%o2
	tgu	%xcc,	0x1
	movn	%icc,	%g6,	%i1
	alignaddr	%g2,	%l6,	%i5
	sdivx	%i7,	0x1FDE,	%o4
	alignaddrl	%o3,	%o6,	%o0
	mulscc	%g3,	%i3,	%l5
	smul	%i4,	0x1619,	%g7
	umulcc	%o7,	0x1A2B,	%g4
	fxor	%f2,	%f14,	%f2
	tcc	%xcc,	0x7
	xnor	%l1,	0x0C5F,	%g1
	sllx	%l4,	%i6,	%o1
	umul	%l3,	%i0,	%l0
	fmovscc	%icc,	%f10,	%f2
	xnorcc	%i2,	%l2,	%g5
	subcc	%o5,	%g6,	%i1
	umulcc	%g2,	%l6,	%o2
	taddcc	%i7,	0x103D,	%o4
	movleu	%xcc,	%i5,	%o6
	addcc	%o0,	0x1982,	%g3
	tcc	%icc,	0x5
	fmovdne	%icc,	%f3,	%f0
	or	%o3,	%i3,	%i4
	andcc	%g7,	%o7,	%g4
	movpos	%icc,	%l5,	%g1
	movleu	%icc,	%l1,	%i6
	add	%o1,	0x0745,	%l4
	movge	%icc,	%i0,	%l3
	movgu	%icc,	%l0,	%l2
	movvc	%xcc,	%g5,	%i2
	popc	0x17F7,	%g6
	sra	%o5,	0x01,	%i1
	sub	%l6,	%g2,	%i7
	movvs	%xcc,	%o4,	%o2
	sra	%i5,	0x0E,	%o0
	alignaddr	%o6,	%o3,	%g3
	fmovdpos	%icc,	%f3,	%f0
	ldd	[%l7 + 0x40],	%f8
	fandnot1s	%f2,	%f3,	%f4
	addc	%i3,	%i4,	%g7
	ta	%xcc,	0x7
	tvs	%icc,	0x4
	sdivx	%g4,	0x040E,	%l5
	umul	%g1,	0x08CC,	%l1
	tg	%icc,	0x1
	sdivcc	%i6,	0x1AAB,	%o7
	edge16l	%o1,	%l4,	%i0
	edge8ln	%l3,	%l2,	%g5
	ldx	[%l7 + 0x50],	%i2
	tn	%xcc,	0x6
	sdiv	%l0,	0x08A6,	%g6
	movvs	%xcc,	%i1,	%o5
	srax	%g2,	%l6,	%o4
	edge16n	%i7,	%i5,	%o0
	fbn,a	%fcc2,	loop_4
	movgu	%xcc,	%o6,	%o3
	or	%g3,	0x1B4E,	%o2
	movne	%xcc,	%i4,	%g7
loop_4:
	udivx	%g4,	0x17BE,	%l5
	xnorcc	%g1,	%i3,	%i6
	tleu	%icc,	0x1
	tsubcctv	%l1,	0x1767,	%o1
	udivcc	%l4,	0x0E7E,	%o7
	srl	%l3,	%i0,	%g5
	edge32l	%i2,	%l0,	%g6
	movpos	%icc,	%l2,	%i1
	movne	%icc,	%g2,	%o5
	movrgz	%l6,	0x104,	%i7
	edge8n	%i5,	%o0,	%o4
	movge	%icc,	%o6,	%o3
	popc	%o2,	%i4
	movn	%xcc,	%g3,	%g7
	andncc	%g4,	%l5,	%i3
	siam	0x7
	xor	%g1,	0x1BF7,	%l1
	or	%i6,	%o1,	%l4
	movge	%xcc,	%l3,	%o7
	smulcc	%i0,	%i2,	%l0
	tneg	%icc,	0x3
	edge32	%g5,	%g6,	%l2
	edge32ln	%g2,	%o5,	%l6
	fblg,a	%fcc1,	loop_5
	tsubcc	%i1,	%i5,	%o0
	tcc	%icc,	0x0
	sdivcc	%o4,	0x1D64,	%o6
loop_5:
	edge8n	%o3,	%o2,	%i7
	movcc	%icc,	%i4,	%g3
	taddcc	%g7,	%l5,	%g4
	movvs	%xcc,	%g1,	%l1
	movn	%xcc,	%i3,	%i6
	edge8l	%l4,	%o1,	%o7
	umulcc	%l3,	%i2,	%l0
	movrgz	%g5,	0x1CE,	%g6
	orn	%i0,	%g2,	%o5
	sub	%l2,	%l6,	%i5
	ldsh	[%l7 + 0x3C],	%o0
	tleu	%xcc,	0x4
	st	%f9,	[%l7 + 0x4C]
	movneg	%icc,	%o4,	%i1
	subccc	%o3,	0x02A6,	%o2
	edge8ln	%o6,	%i4,	%i7
	edge32	%g7,	%l5,	%g4
	move	%xcc,	%g3,	%l1
	edge32	%g1,	%i6,	%l4
	sra	%o1,	0x1E,	%i3
	udiv	%o7,	0x0359,	%l3
	xnorcc	%i2,	0x0B9E,	%l0
	movpos	%icc,	%g5,	%g6
	movcc	%icc,	%i0,	%o5
	andncc	%g2,	%l6,	%l2
	tsubcc	%i5,	%o0,	%o4
	fnot2	%f6,	%f2
	sllx	%i1,	%o2,	%o6
	mulx	%i4,	0x1B1A,	%i7
	alignaddr	%o3,	%g7,	%l5
	tneg	%xcc,	0x1
	sdivcc	%g4,	0x1059,	%g3
	mulscc	%g1,	0x0C16,	%i6
	or	%l4,	%l1,	%i3
	sethi	0x07F1,	%o7
	fnegd	%f12,	%f6
	move	%icc,	%o1,	%i2
	mulscc	%l0,	0x1B29,	%g5
	tsubcctv	%l3,	0x1AB4,	%i0
	alignaddrl	%o5,	%g6,	%g2
	tgu	%xcc,	0x5
	tcs	%icc,	0x5
	movcc	%xcc,	%l6,	%l2
	movrlez	%i5,	0x215,	%o4
	edge32l	%i1,	%o2,	%o6
	popc	%o0,	%i4
	mulscc	%o3,	%g7,	%i7
	sdivx	%l5,	0x0A2C,	%g4
	srax	%g3,	%g1,	%l4
	stb	%i6,	[%l7 + 0x58]
	movrlz	%l1,	0x3B6,	%o7
	tl	%xcc,	0x2
	edge8ln	%o1,	%i2,	%l0
	movpos	%icc,	%i3,	%l3
	tge	%icc,	0x5
	movleu	%xcc,	%g5,	%o5
	movle	%xcc,	%i0,	%g6
	srlx	%l6,	0x1E,	%l2
	move	%xcc,	%i5,	%g2
	andcc	%i1,	%o4,	%o6
	movpos	%xcc,	%o0,	%i4
	movcc	%xcc,	%o3,	%g7
	mova	%icc,	%i7,	%o2
	mulx	%g4,	%g3,	%g1
	tleu	%xcc,	0x6
	srl	%l4,	%l5,	%l1
	sdivcc	%o7,	0x0F85,	%i6
	te	%xcc,	0x3
	edge16ln	%i2,	%l0,	%o1
	movrne	%i3,	0x025,	%l3
	edge32ln	%g5,	%o5,	%g6
	movge	%icc,	%l6,	%l2
	sdiv	%i0,	0x033A,	%i5
	sdiv	%i1,	0x17D5,	%o4
	movre	%o6,	%o0,	%g2
	mova	%xcc,	%o3,	%i4
	popc	%g7,	%o2
	add	%g4,	0x13F1,	%g3
	te	%icc,	0x7
	movl	%icc,	%g1,	%i7
	movle	%icc,	%l4,	%l1
	alignaddr	%l5,	%o7,	%i6
	umul	%l0,	%o1,	%i3
	xnor	%l3,	%g5,	%o5
	lduw	[%l7 + 0x78],	%i2
	sdivcc	%g6,	0x0068,	%l2
	tle	%icc,	0x0
	taddcc	%i0,	0x1866,	%i5
	tcs	%xcc,	0x0
	movne	%xcc,	%l6,	%o4
	movcs	%icc,	%i1,	%o6
	tvs	%icc,	0x0
	subcc	%o0,	0x05B1,	%g2
	tne	%xcc,	0x4
	add	%o3,	0x1901,	%i4
	tvc	%icc,	0x6
	alignaddr	%g7,	%o2,	%g3
	andncc	%g1,	%i7,	%l4
	udivx	%l1,	0x0CD5,	%g4
	te	%icc,	0x3
	tleu	%xcc,	0x4
	add	%o7,	%i6,	%l0
	movrgez	%l5,	%o1,	%i3
	tneg	%icc,	0x0
	addc	%l3,	0x0A24,	%o5
	tg	%icc,	0x6
	sdivx	%i2,	0x079C,	%g6
	tle	%xcc,	0x2
	sllx	%g5,	%i0,	%l2
	addc	%i5,	%o4,	%i1
	mulscc	%o6,	%o0,	%g2
	ta	%icc,	0x4
	tgu	%xcc,	0x0
	fmovsneg	%xcc,	%f10,	%f9
	edge32ln	%l6,	%i4,	%o3
	ta	%icc,	0x1
	movleu	%xcc,	%g7,	%o2
	tl	%icc,	0x7
	orncc	%g3,	0x14EB,	%g1
	or	%l4,	0x0E41,	%l1
	movrgz	%g4,	0x19D,	%o7
	xnor	%i7,	0x058A,	%i6
	tvc	%xcc,	0x4
	addccc	%l0,	%o1,	%l5
	xor	%l3,	%o5,	%i2
	edge16n	%i3,	%g6,	%i0
	ta	%icc,	0x7
	sdiv	%g5,	0x0023,	%l2
	edge32l	%i5,	%o4,	%i1
	edge32n	%o6,	%g2,	%o0
	ldx	[%l7 + 0x10],	%l6
	fands	%f12,	%f2,	%f13
	edge8	%o3,	%i4,	%g7
	ld	[%l7 + 0x58],	%f6
	edge8n	%o2,	%g1,	%g3
	or	%l1,	%l4,	%g4
	movne	%xcc,	%o7,	%i7
	movge	%icc,	%l0,	%o1
	movge	%icc,	%l5,	%l3
	movne	%icc,	%o5,	%i2
	mulscc	%i6,	%g6,	%i3
	ldsh	[%l7 + 0x5E],	%g5
	fmovdcs	%xcc,	%f0,	%f10
	edge8	%i0,	%l2,	%o4
	orn	%i5,	0x0DD2,	%i1
	xor	%o6,	%g2,	%o0
	edge16ln	%l6,	%i4,	%g7
	tsubcctv	%o2,	0x0AF9,	%g1
	edge8ln	%o3,	%l1,	%l4
	ldsb	[%l7 + 0x36],	%g3
	movrne	%o7,	%i7,	%l0
	sra	%g4,	0x0D,	%o1
	te	%xcc,	0x7
	orncc	%l3,	0x1146,	%l5
	tg	%xcc,	0x5
	edge32n	%i2,	%i6,	%g6
	addc	%i3,	0x0DE2,	%g5
	xnor	%o5,	%l2,	%o4
	udivx	%i0,	0x1081,	%i1
	movrne	%i5,	%o6,	%g2
	umul	%o0,	0x1B82,	%i4
	tg	%xcc,	0x5
	movre	%l6,	%g7,	%g1
	movcc	%icc,	%o2,	%l1
	sdivcc	%l4,	0x1951,	%o3
	alignaddrl	%g3,	%i7,	%o7
	movge	%icc,	%l0,	%g4
	movrlez	%o1,	0x15C,	%l3
	move	%xcc,	%i2,	%l5
	addccc	%g6,	0x0181,	%i6
	movpos	%xcc,	%i3,	%g5
	sll	%o5,	%o4,	%i0
	brlez,a	%l2,	loop_6
	tle	%xcc,	0x0
	orncc	%i5,	%o6,	%g2
	ldsb	[%l7 + 0x31],	%o0
loop_6:
	andn	%i1,	%l6,	%g7
	movrgez	%g1,	%o2,	%i4
	tge	%xcc,	0x7
	fmovsne	%icc,	%f10,	%f10
	edge8n	%l1,	%o3,	%l4
	and	%g3,	0x122D,	%o7
	tpos	%icc,	0x2
	tgu	%xcc,	0x6
	sth	%i7,	[%l7 + 0x38]
	xnor	%l0,	%g4,	%o1
	andn	%i2,	%l3,	%l5
	edge8	%g6,	%i6,	%g5
	movrlez	%i3,	%o4,	%i0
	movne	%icc,	%l2,	%o5
	sll	%i5,	0x1E,	%g2
	smulcc	%o0,	%o6,	%i1
	sllx	%g7,	0x0A,	%g1
	mulscc	%o2,	0x0B35,	%l6
	tleu	%icc,	0x6
	edge32	%i4,	%o3,	%l1
	movne	%icc,	%g3,	%o7
	mova	%icc,	%i7,	%l0
	tvc	%icc,	0x4
	add	%g4,	%o1,	%i2
	srl	%l3,	0x0D,	%l4
	tl	%icc,	0x2
	sub	%l5,	%g6,	%i6
	mulx	%g5,	0x069C,	%o4
	edge32	%i0,	%i3,	%o5
	edge16l	%l2,	%g2,	%i5
	umulcc	%o6,	%o0,	%i1
	addccc	%g7,	0x1D7D,	%o2
	movg	%xcc,	%g1,	%i4
	alignaddr	%o3,	%l1,	%l6
	tvc	%icc,	0x4
	orcc	%o7,	0x1951,	%i7
	edge32l	%g3,	%l0,	%o1
	addc	%g4,	%i2,	%l3
	sra	%l4,	0x1D,	%l5
	brgz	%g6,	loop_7
	movrgez	%g5,	0x195,	%o4
	sdivx	%i6,	0x0282,	%i3
	movcc	%xcc,	%i0,	%o5
loop_7:
	movg	%icc,	%g2,	%l2
	mulscc	%i5,	%o0,	%i1
	movvs	%icc,	%o6,	%g7
	sra	%g1,	0x10,	%o2
	udiv	%o3,	0x1D71,	%l1
	te	%xcc,	0x2
	smul	%i4,	%o7,	%l6
	alignaddrl	%g3,	%i7,	%l0
	movgu	%xcc,	%o1,	%i2
	move	%xcc,	%g4,	%l4
	movl	%icc,	%l5,	%g6
	edge8l	%g5,	%o4,	%i6
	edge8	%i3,	%i0,	%o5
	fbg	%fcc0,	loop_8
	tleu	%icc,	0x6
	mulscc	%l3,	%g2,	%i5
	addc	%o0,	%l2,	%i1
loop_8:
	subccc	%g7,	0x07AE,	%o6
	mulscc	%g1,	0x08B4,	%o3
	andcc	%o2,	0x0C1B,	%l1
	xnor	%o7,	0x09AF,	%i4
	tleu	%xcc,	0x2
	tneg	%icc,	0x4
	xorcc	%l6,	%g3,	%i7
	umul	%o1,	%l0,	%i2
	edge8	%g4,	%l4,	%l5
	andcc	%g5,	%o4,	%g6
	movrlez	%i3,	%i0,	%i6
	sdivcc	%l3,	0x0BA8,	%g2
	andcc	%i5,	0x1061,	%o5
	tg	%icc,	0x2
	movrlz	%l2,	0x38E,	%o0
	ta	%icc,	0x7
	edge8ln	%i1,	%o6,	%g7
	movne	%xcc,	%o3,	%o2
	movn	%icc,	%l1,	%g1
	tsubcctv	%i4,	%l6,	%o7
	movgu	%xcc,	%g3,	%i7
	tcs	%icc,	0x7
	add	%o1,	0x1CF3,	%i2
	movrlez	%l0,	0x0FE,	%l4
	sub	%g4,	0x0351,	%l5
	and	%g5,	%o4,	%i3
	move	%icc,	%i0,	%g6
	tcc	%xcc,	0x2
	fmovdcc	%xcc,	%f12,	%f4
	subc	%l3,	0x0441,	%i6
	tvc	%icc,	0x5
	brnz,a	%i5,	loop_9
	sll	%o5,	%l2,	%o0
	sll	%g2,	%i1,	%g7
	stb	%o3,	[%l7 + 0x3B]
loop_9:
	srl	%o6,	%l1,	%o2
	tpos	%icc,	0x3
	subcc	%g1,	%l6,	%o7
	tleu	%icc,	0x1
	sdivx	%i4,	0x15DD,	%i7
	fandnot1s	%f12,	%f3,	%f5
	sdivcc	%o1,	0x17D0,	%i2
	taddcc	%g3,	0x0A36,	%l0
	movcc	%xcc,	%l4,	%l5
	sllx	%g4,	0x0B,	%o4
	andn	%i3,	%i0,	%g5
	edge32ln	%l3,	%i6,	%i5
	xorcc	%o5,	%l2,	%o0
	movcc	%icc,	%g6,	%g2
	tgu	%icc,	0x5
	edge32ln	%i1,	%o3,	%o6
	sllx	%g7,	0x1F,	%l1
	tn	%icc,	0x2
	movvs	%icc,	%g1,	%l6
	tvs	%icc,	0x6
	mulscc	%o7,	%o2,	%i4
	alignaddr	%i7,	%i2,	%o1
	movcc	%icc,	%g3,	%l4
	edge8ln	%l0,	%l5,	%g4
	xor	%o4,	0x151E,	%i3
	ta	%xcc,	0x2
	tgu	%icc,	0x5
	xorcc	%g5,	0x14B9,	%i0
	movre	%i6,	0x242,	%l3
	xorcc	%i5,	%o5,	%l2
	udiv	%g6,	0x0553,	%g2
	andncc	%i1,	%o0,	%o6
	or	%g7,	0x0415,	%l1
	addccc	%o3,	%l6,	%o7
	udivx	%o2,	0x0D71,	%i4
	movgu	%xcc,	%i7,	%g1
	fpadd16s	%f11,	%f13,	%f1
	movleu	%icc,	%i2,	%g3
	ld	[%l7 + 0x60],	%f14
	orncc	%o1,	0x10D4,	%l0
	srl	%l5,	0x0B,	%g4
	taddcctv	%o4,	%i3,	%l4
	tvc	%xcc,	0x5
	movre	%i0,	%g5,	%l3
	movrgez	%i5,	0x07E,	%i6
	fmovspos	%icc,	%f13,	%f6
	move	%xcc,	%l2,	%o5
	udiv	%g2,	0x0445,	%g6
	fbge,a	%fcc1,	loop_10
	edge16l	%i1,	%o6,	%o0
	tgu	%icc,	0x5
	fandnot1s	%f12,	%f2,	%f6
loop_10:
	tgu	%icc,	0x4
	movrlez	%g7,	0x0F1,	%o3
	movvc	%xcc,	%l6,	%o7
	movvs	%xcc,	%o2,	%l1
	movrlez	%i4,	0x0A2,	%g1
	edge16n	%i7,	%g3,	%i2
	lduh	[%l7 + 0x5E],	%l0
	add	%l5,	0x1983,	%g4
	edge16	%o1,	%o4,	%l4
	smul	%i0,	0x01F6,	%i3
	orcc	%g5,	%l3,	%i6
	xnorcc	%l2,	0x01CB,	%i5
	xnor	%o5,	0x1444,	%g6
	srl	%g2,	%o6,	%o0
	sdivx	%g7,	0x1768,	%i1
	ldsb	[%l7 + 0x22],	%o3
	tge	%xcc,	0x2
	ta	%icc,	0x6
	tcc	%xcc,	0x4
	fcmpgt32	%f6,	%f6,	%o7
	andn	%o2,	0x06AE,	%l6
	tn	%xcc,	0x2
	andcc	%i4,	0x0EC5,	%l1
	subccc	%i7,	0x0CD1,	%g3
	tleu	%xcc,	0x4
	sllx	%g1,	0x1A,	%l0
	sethi	0x0F8C,	%l5
	movrne	%i2,	%o1,	%g4
	srax	%o4,	%l4,	%i0
	or	%i3,	%l3,	%i6
	sdiv	%g5,	0x0F34,	%l2
	te	%xcc,	0x3
	tn	%xcc,	0x7
	add	%o5,	%i5,	%g6
	st	%f11,	[%l7 + 0x60]
	sdiv	%g2,	0x168A,	%o0
	srax	%o6,	%i1,	%g7
	movneg	%icc,	%o3,	%o2
	sdivx	%l6,	0x1D1B,	%i4
	smul	%l1,	0x17C4,	%o7
	andncc	%i7,	%g1,	%l0
	sll	%l5,	%i2,	%g3
	edge32n	%o1,	%g4,	%o4
	srlx	%i0,	0x06,	%i3
	add	%l3,	0x0BEA,	%i6
	fnegd	%f4,	%f2
	xnorcc	%g5,	%l4,	%o5
	srl	%i5,	%g6,	%l2
	xorcc	%o0,	%o6,	%i1
	tneg	%icc,	0x4
	edge16l	%g7,	%o3,	%o2
	orncc	%g2,	%l6,	%i4
	edge32l	%l1,	%o7,	%i7
	udiv	%g1,	0x060C,	%l0
	movrgz	%i2,	%g3,	%l5
	orcc	%g4,	0x1C88,	%o1
	popc	0x10DA,	%i0
	ta	%xcc,	0x1
	sdivcc	%i3,	0x0942,	%o4
	udivcc	%l3,	0x1D40,	%i6
	tge	%icc,	0x7
	addccc	%l4,	%o5,	%g5
	edge32n	%i5,	%l2,	%g6
	tsubcc	%o0,	0x103C,	%i1
	tvs	%icc,	0x2
	sllx	%g7,	0x1D,	%o6
	movrlz	%o2,	%o3,	%g2
	tne	%xcc,	0x7
	movgu	%icc,	%i4,	%l1
	sdivcc	%l6,	0x0CB6,	%i7
	tgu	%icc,	0x0
	srl	%g1,	%l0,	%o7
	xor	%i2,	0x0B36,	%l5
	addccc	%g4,	%g3,	%o1
	edge16	%i3,	%o4,	%l3
	fmovsge	%xcc,	%f11,	%f10
	movneg	%icc,	%i6,	%l4
	tsubcc	%i0,	0x1DC9,	%g5
	movneg	%xcc,	%o5,	%l2
	andcc	%i5,	%o0,	%g6
	xnorcc	%g7,	%o6,	%o2
	movleu	%xcc,	%i1,	%o3
	edge16ln	%i4,	%l1,	%l6
	andcc	%g2,	0x17FA,	%g1
	mulx	%l0,	%o7,	%i7
	udiv	%i2,	0x00F7,	%l5
	udiv	%g4,	0x1C6C,	%o1
	edge32ln	%i3,	%g3,	%l3
	tcs	%icc,	0x1
	alignaddr	%i6,	%l4,	%i0
	umul	%o4,	%g5,	%l2
	edge32n	%o5,	%i5,	%o0
	popc	%g6,	%o6
	sethi	0x1068,	%g7
	fmovrde	%o2,	%f12,	%f0
	movcc	%xcc,	%i1,	%i4
	sub	%o3,	0x0436,	%l6
	edge32	%g2,	%l1,	%g1
	subcc	%l0,	0x092A,	%o7
	tn	%icc,	0x5
	sethi	0x05AA,	%i2
	fcmped	%fcc2,	%f2,	%f6
	edge8n	%l5,	%g4,	%i7
	movg	%icc,	%o1,	%g3
	andn	%i3,	%i6,	%l3
	fmovsneg	%xcc,	%f14,	%f4
	movre	%l4,	0x29A,	%i0
	movpos	%icc,	%o4,	%g5
	movre	%o5,	0x161,	%i5
	orncc	%o0,	%g6,	%o6
	udiv	%g7,	0x129C,	%l2
	st	%f4,	[%l7 + 0x5C]
	mulscc	%i1,	%o2,	%i4
	xnorcc	%l6,	%g2,	%o3
	umul	%l1,	%l0,	%o7
	movne	%icc,	%g1,	%l5
	udivcc	%i2,	0x05D2,	%g4
	andcc	%i7,	0x1465,	%o1
	edge32	%g3,	%i3,	%i6
	edge8ln	%l3,	%l4,	%i0
	movgu	%xcc,	%g5,	%o4
	alignaddr	%o5,	%o0,	%g6
	sra	%o6,	0x14,	%i5
	xor	%g7,	%l2,	%i1
	movrgz	%i4,	0x263,	%l6
	tl	%xcc,	0x0
	movgu	%xcc,	%g2,	%o3
	and	%l1,	0x005F,	%o2
	movrgez	%l0,	0x055,	%g1
	ldub	[%l7 + 0x6C],	%l5
	be	%xcc,	loop_11
	movle	%icc,	%o7,	%i2
	xnorcc	%g4,	%o1,	%g3
	tne	%icc,	0x2
loop_11:
	movne	%xcc,	%i7,	%i3
	movle	%icc,	%l3,	%l4
	tle	%xcc,	0x1
	subccc	%i6,	0x0D04,	%g5
	tl	%xcc,	0x2
	movle	%icc,	%i0,	%o5
	srax	%o0,	0x1F,	%g6
	sdivcc	%o6,	0x197B,	%i5
	tl	%icc,	0x1
	fnor	%f12,	%f4,	%f12
	movle	%icc,	%o4,	%g7
	addcc	%i1,	%l2,	%i4
	addccc	%g2,	%o3,	%l6
	movg	%icc,	%l1,	%l0
	andncc	%g1,	%o2,	%l5
	addccc	%i2,	%o7,	%o1
	xor	%g3,	%g4,	%i3
	umul	%l3,	%l4,	%i7
	tcs	%icc,	0x3
	sethi	0x0A96,	%g5
	mova	%icc,	%i6,	%o5
	tsubcctv	%i0,	%g6,	%o0
	tcc	%xcc,	0x0
	sethi	0x0460,	%i5
	tsubcctv	%o4,	0x19B3,	%g7
	movrgz	%o6,	%l2,	%i4
	and	%i1,	%o3,	%g2
	movcs	%icc,	%l1,	%l6
	ldub	[%l7 + 0x70],	%l0
	mova	%xcc,	%g1,	%o2
	sra	%i2,	%o7,	%o1
	edge8n	%g3,	%g4,	%l5
	fmovdg	%xcc,	%f12,	%f1
	xorcc	%l3,	0x02AF,	%i3
	tle	%icc,	0x0
	tle	%icc,	0x7
	tvs	%xcc,	0x7
	sethi	0x02FE,	%l4
	popc	%i7,	%i6
	brlz,a	%o5,	loop_12
	sll	%i0,	%g6,	%g5
	movneg	%icc,	%i5,	%o4
	movleu	%icc,	%g7,	%o0
loop_12:
	fors	%f10,	%f1,	%f4
	move	%xcc,	%l2,	%o6
	popc	%i1,	%o3
	movneg	%icc,	%g2,	%i4
	srlx	%l6,	%l1,	%l0
	edge32n	%g1,	%o2,	%i2
	subcc	%o1,	0x0EEE,	%g3
	fnegd	%f10,	%f12
	ldub	[%l7 + 0x0A],	%g4
	te	%icc,	0x1
	edge16l	%l5,	%l3,	%o7
	mova	%icc,	%i3,	%l4
	mulx	%i7,	0x05C9,	%o5
	sdivcc	%i0,	0x060E,	%i6
	subccc	%g5,	%g6,	%o4
	alignaddrl	%g7,	%i5,	%l2
	movrgz	%o0,	0x17F,	%i1
	edge32n	%o6,	%g2,	%i4
	edge16n	%l6,	%l1,	%l0
	or	%g1,	%o3,	%o2
	udivx	%i2,	0x15E7,	%o1
	orncc	%g3,	0x19F2,	%l5
	mulscc	%g4,	0x0377,	%o7
	tcs	%xcc,	0x5
	srl	%i3,	0x12,	%l3
	xnor	%l4,	%i7,	%o5
	movleu	%xcc,	%i0,	%i6
	sth	%g6,	[%l7 + 0x48]
	edge32ln	%o4,	%g5,	%i5
	tsubcc	%l2,	0x0602,	%o0
	andn	%i1,	%o6,	%g7
	movgu	%xcc,	%g2,	%l6
	tge	%icc,	0x6
	edge8ln	%i4,	%l1,	%l0
	andn	%o3,	0x047E,	%o2
	movrne	%i2,	0x237,	%o1
	tsubcc	%g1,	0x1EF2,	%g3
	andn	%g4,	%l5,	%o7
	xnor	%l3,	0x0263,	%i3
	and	%i7,	0x1F30,	%l4
	sdiv	%o5,	0x15AB,	%i6
	movleu	%icc,	%g6,	%i0
	tpos	%xcc,	0x5
	and	%o4,	0x0A88,	%g5
	sdivcc	%i5,	0x06D3,	%o0
	umulcc	%i1,	0x165E,	%o6
	edge16l	%l2,	%g2,	%g7
	ta	%icc,	0x0
	taddcc	%l6,	0x098E,	%l1
	or	%i4,	%o3,	%o2
	orn	%i2,	0x06FF,	%l0
	tcc	%icc,	0x0
	edge32	%g1,	%o1,	%g4
	xnor	%l5,	0x13DA,	%g3
	edge16ln	%l3,	%i3,	%i7
	movvc	%icc,	%l4,	%o5
	srlx	%i6,	0x19,	%o7
	smulcc	%g6,	0x02C1,	%i0
	edge16ln	%o4,	%g5,	%i5
	movcs	%icc,	%i1,	%o6
	smulcc	%o0,	0x155F,	%g2
	tvs	%icc,	0x1
	taddcctv	%l2,	%g7,	%l6
	mova	%xcc,	%l1,	%o3
	edge8l	%i4,	%i2,	%l0
	sethi	0x05A8,	%o2
	edge8	%o1,	%g4,	%l5
	movrgez	%g3,	%g1,	%i3
	popc	0x0C30,	%l3
	edge32	%l4,	%i7,	%i6
	smulcc	%o7,	0x1548,	%g6
	mulx	%o5,	%o4,	%g5
	movrgez	%i0,	0x05B,	%i5
	movrne	%i1,	0x208,	%o6
	edge16ln	%g2,	%o0,	%g7
	add	%l6,	0x1058,	%l2
	xnor	%l1,	%o3,	%i2
	taddcc	%l0,	%o2,	%i4
	ldsb	[%l7 + 0x1D],	%o1
	xnorcc	%g4,	%g3,	%l5
	udiv	%i3,	0x18C2,	%l3
	fmovsvs	%icc,	%f13,	%f11
	tsubcc	%l4,	%i7,	%g1
	sllx	%o7,	%g6,	%o5
	edge32l	%i6,	%g5,	%o4
	te	%xcc,	0x7
	sethi	0x06AB,	%i0
	subcc	%i1,	0x0537,	%o6
	tgu	%icc,	0x2
	ldsw	[%l7 + 0x48],	%i5
	tpos	%xcc,	0x1
	movneg	%icc,	%g2,	%g7
	sub	%l6,	%o0,	%l1
	tpos	%xcc,	0x7
	addcc	%l2,	0x0EE7,	%i2
	edge8	%o3,	%o2,	%l0
	tle	%xcc,	0x2
	tg	%icc,	0x5
	movcc	%xcc,	%i4,	%g4
	sra	%o1,	%g3,	%l5
	edge32l	%i3,	%l4,	%i7
	tle	%xcc,	0x3
	st	%f0,	[%l7 + 0x24]
	taddcctv	%l3,	0x1961,	%g1
	subcc	%o7,	0x123E,	%g6
	andcc	%o5,	0x18EC,	%g5
	movgu	%icc,	%o4,	%i6
	mulscc	%i1,	%i0,	%o6
	edge32ln	%g2,	%g7,	%l6
	movrlz	%o0,	0x14B,	%l1
	xnorcc	%i5,	0x1A91,	%i2
	edge16n	%o3,	%o2,	%l0
	movrlz	%i4,	%l2,	%o1
	edge16ln	%g3,	%g4,	%l5
	tn	%xcc,	0x5
	te	%xcc,	0x7
	fmovdpos	%xcc,	%f13,	%f0
	andcc	%i3,	0x010D,	%l4
	orcc	%i7,	0x01D9,	%g1
	tcs	%icc,	0x6
	orn	%o7,	%l3,	%o5
	edge8n	%g5,	%g6,	%o4
	tvc	%icc,	0x2
	umulcc	%i1,	0x0C2D,	%i0
	tsubcc	%i6,	0x1EC2,	%o6
	mulx	%g2,	%l6,	%o0
	tpos	%xcc,	0x0
	sdivcc	%l1,	0x1820,	%i5
	movgu	%icc,	%i2,	%o3
	tgu	%icc,	0x6
	movpos	%icc,	%g7,	%l0

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Diag:
!
!	Type f   	: 35
!	Type cti   	: 12
!	Type i   	: 919
!	Type l   	: 34
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.word 0x80E9ED37
.word 0x13FB3DF8
.word 0xCE820BE6
.word 0x7894F110
.word 0x35AE1F94
.word 0xA4393524
.word 0xEC1D5725
.word 0xB15234AB
.word 0x224F5C38
.word 0x56225637
.word 0x54617DC4
.word 0xB29067CD
.word 0xAEFB4412
.word 0xAD58DF84
.word 0x364B6AB9
.word 0xD2920B96
.word 0x1B01D3FF
.word 0x877581CC
.word 0xE27A459F
.word 0xF3F62BB8
.word 0xD4E4B745
.word 0xAEF78184
.word 0xC426E786
.word 0xE611D297
.word 0x6EC89F27
.word 0xF362BD9D
.word 0x53740C01
.word 0x43C73F58
.word 0xD52A7B4B
.word 0xE2B7C826
.word 0xFC104E1A
.word 0xDAA6A056
.word 0x45C09A9E
.word 0x460F0229
.word 0x0F918520
.word 0xE208EF9B
.word 0xAF1833CB
.word 0xEA1DCD07
.word 0x0FAD4294
.word 0xC83BB49C
.word 0x0160691F
.word 0xC462C717
.word 0x418D5679
.word 0xC938F0CD
.word 0x2A237579
.word 0x5F681668
.word 0x4268FD57
.word 0x9CAEAE3F
.word 0x1173D019
.word 0x7BF1D107
.word 0x90323107
.word 0x57838C20
.word 0xCBDA529D
.word 0xCA6A7491
.word 0xCFD855E1
.word 0xB3CE7C7C
.word 0x22F6FA55
.word 0x77E15F6A
.word 0x5723D775
.word 0xB2E8A65B
.word 0xA4220178
.word 0x63A49F3D
.word 0xC3FF3D69
.word 0x61903825
.end
