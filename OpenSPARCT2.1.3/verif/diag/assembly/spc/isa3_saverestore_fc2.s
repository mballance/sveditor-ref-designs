/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_saverestore_fc2.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ./spc_basic_isa3.pl FOCUS_SEED=599728880"
.ident "BY rg131678 ON Wed Aug  6 18:03:30 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_saverestore_fc2.s,v 1.3 2007/07/05 22:01:53 drp Exp $"
#include "defines.h"
#include "nmacros.h"
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

!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0xB,	%g2
	set	0x4,	%g3
	set	0xB,	%g4
	set	0xA,	%g5
	set	0xC,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xC,	%i1
	set	-0xA,	%i2
	set	-0xD,	%i3
	set	-0xA,	%i4
	set	-0x5,	%i5
	set	-0x6,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x16B4017B,	%l0
	set	0x327ADFC4,	%l1
	set	0x2B01F83A,	%l2
	set	0x300A41F8,	%l3
	set	0x1D452130,	%l4
	set	0x750619D3,	%l5
	set	0x0F48A002,	%l6
	!# Output registers
	set	0x19CA,	%o0
	set	-0x037A,	%o1
	set	0x1FF3,	%o2
	set	-0x1918,	%o3
	set	-0x082D,	%o4
	set	0x0F98,	%o5
	set	0x1DF0,	%o6
	set	-0x08B2,	%o7

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

	std	%f4,	[%l7 + 0x08]
	edge16n	%o7,	%i2,	%o4
	fmovsa	%icc,	%f9,	%f1
	edge32	%l1,	%l5,	%l3
	subccc	%o0,	0x05C0,	%l4
	srax	%i3,	0x0D,	%l6
	stw	%i4,	[%l7 + 0x28]
	addc	%g4,	0x195D,	%l2
	edge8ln	%o3,	%o6,	%i5
	xorcc	%o5,	0x0868,	%g3
	edge32n	%g6,	%i7,	%g5
	edge32l	%i1,	%o1,	%g7
	movrlz	%g2,	0x247,	%o2
	fcmpgt32	%f6,	%f0,	%i6
	pdist	%f12,	%f14,	%f6
	xorcc	%i0,	%g1,	%o7
	movre	%i2,	%l0,	%l1
	xnorcc	%o4,	%l3,	%l5
	fmovsl	%icc,	%f10,	%f15
	ldd	[%l7 + 0x20],	%l4
	movneg	%icc,	%i3,	%o0
	fpsub32s	%f0,	%f6,	%f12
	edge32l	%l6,	%g4,	%l2
	andcc	%o3,	0x190A,	%o6
	movl	%xcc,	%i5,	%i4
	smulcc	%o5,	%g6,	%g3
	orncc	%i7,	0x0612,	%g5
	array8	%i1,	%o1,	%g7
	stb	%o2,	[%l7 + 0x30]
	umulcc	%i6,	0x017A,	%i0
	andncc	%g2,	%o7,	%i2
	edge32n	%g1,	%l0,	%l1
	fcmpne32	%f6,	%f14,	%l3
	fmovspos	%icc,	%f13,	%f4
	ldsh	[%l7 + 0x30],	%o4
	fcmpeq16	%f10,	%f2,	%l4
	movgu	%xcc,	%i3,	%o0
	edge16l	%l5,	%l6,	%g4
	lduh	[%l7 + 0x72],	%l2
	andncc	%o6,	%i5,	%i4
	add	%o5,	0x0CE1,	%o3
	sll	%g6,	%g3,	%i7
	edge8	%g5,	%o1,	%g7
	subcc	%i1,	%i6,	%o2
	andcc	%g2,	0x1995,	%i0
	udivcc	%i2,	0x0EA8,	%g1
	ldsh	[%l7 + 0x7E],	%o7
	std	%f6,	[%l7 + 0x38]
	fsrc2	%f6,	%f10
	alignaddrl	%l0,	%l1,	%l3
	movpos	%icc,	%o4,	%i3
	movle	%xcc,	%o0,	%l5
	ldsh	[%l7 + 0x0A],	%l6
	ldx	[%l7 + 0x20],	%g4
	smulcc	%l2,	0x0CA1,	%l4
	movgu	%xcc,	%i5,	%o6
	edge16l	%i4,	%o5,	%g6
	save %g3, %i7, %o3
	fxnor	%f4,	%f4,	%f14
	and	%g5,	0x026F,	%g7
	udivcc	%o1,	0x13C0,	%i6
	alignaddrl	%i1,	%g2,	%i0
	edge16l	%o2,	%g1,	%o7
	sdivx	%l0,	0x0A2C,	%i2
	srax	%l3,	0x00,	%o4
	udivcc	%i3,	0x0A91,	%l1
	lduh	[%l7 + 0x3E],	%o0
	alignaddrl	%l6,	%g4,	%l5
	movre	%l2,	0x12E,	%i5
	fmovdne	%xcc,	%f11,	%f5
	subcc	%o6,	%i4,	%l4
	ld	[%l7 + 0x38],	%f14
	srlx	%g6,	0x0B,	%g3
	fmovscc	%icc,	%f10,	%f12
	stx	%i7,	[%l7 + 0x40]
	sra	%o5,	0x08,	%g5
	edge16ln	%g7,	%o1,	%i6
	ld	[%l7 + 0x08],	%f8
	fmovrse	%o3,	%f11,	%f14
	array8	%g2,	%i0,	%o2
	sethi	0x045B,	%g1
	ldub	[%l7 + 0x09],	%o7
	movrgez	%i1,	0x05D,	%i2
	movn	%icc,	%l3,	%o4
	lduh	[%l7 + 0x2E],	%l0
	movge	%icc,	%i3,	%l1
	xorcc	%o0,	%g4,	%l5
	edge32ln	%l2,	%i5,	%o6
	movge	%xcc,	%l6,	%l4
	srlx	%i4,	0x01,	%g6
	movl	%icc,	%i7,	%g3
	fmovdpos	%xcc,	%f5,	%f1
	mulscc	%o5,	%g7,	%g5
	stw	%i6,	[%l7 + 0x28]
	addccc	%o3,	%o1,	%g2
	sra	%i0,	%o2,	%g1
	fandnot2s	%f11,	%f10,	%f13
	std	%f0,	[%l7 + 0x70]
	restore %i1, %i2, %o7
	ldsb	[%l7 + 0x30],	%l3
	and	%l0,	0x13B8,	%o4
	std	%f8,	[%l7 + 0x78]
	ld	[%l7 + 0x64],	%f5
	fpack16	%f4,	%f4
	edge32n	%l1,	%o0,	%i3
	array8	%l5,	%g4,	%i5
	subc	%l2,	%l6,	%l4
	array8	%i4,	%g6,	%i7
	udivcc	%o6,	0x0538,	%o5
	siam	0x1
	ld	[%l7 + 0x4C],	%f1
	sdivcc	%g3,	0x0490,	%g7
	ldsb	[%l7 + 0x56],	%g5
	fornot2s	%f2,	%f0,	%f6
	xor	%i6,	0x198E,	%o1
	edge32ln	%o3,	%g2,	%o2
	edge32n	%i0,	%g1,	%i2
	array16	%i1,	%o7,	%l0
	subc	%l3,	0x065F,	%o4
	fmul8x16	%f10,	%f14,	%f8
	ldx	[%l7 + 0x38],	%o0
	std	%f2,	[%l7 + 0x58]
	stb	%l1,	[%l7 + 0x22]
	orn	%i3,	0x0194,	%l5
	sethi	0x1496,	%g4
	fnands	%f14,	%f12,	%f1
	movcc	%icc,	%i5,	%l2
	edge32l	%l4,	%i4,	%g6
	smulcc	%l6,	%o6,	%i7
	mova	%xcc,	%g3,	%o5
	sub	%g7,	%g5,	%i6
	movle	%xcc,	%o3,	%g2
	ld	[%l7 + 0x6C],	%f7
	array16	%o2,	%o1,	%i0
	fmovscs	%xcc,	%f12,	%f13
	fpsub16	%f14,	%f8,	%f12
	movvs	%icc,	%g1,	%i1
	xnor	%o7,	%l0,	%l3
	movleu	%icc,	%i2,	%o4
	xnorcc	%o0,	%i3,	%l1
	stb	%l5,	[%l7 + 0x52]
	movgu	%icc,	%g4,	%l2
	ldsh	[%l7 + 0x28],	%i5
	addcc	%i4,	0x03D8,	%l4
	st	%f6,	[%l7 + 0x60]
	fmuld8sux16	%f13,	%f10,	%f4
	edge32	%g6,	%l6,	%o6
	edge16ln	%i7,	%g3,	%o5
	fcmpeq32	%f14,	%f6,	%g5
	save %g7, %i6, %o3
	fnor	%f8,	%f8,	%f4
	fands	%f8,	%f15,	%f2
	addcc	%g2,	0x15B7,	%o1
	movrgz	%i0,	%g1,	%i1
	edge16n	%o7,	%o2,	%l3
	fmovsle	%icc,	%f11,	%f10
	fnegs	%f14,	%f9
	edge16l	%l0,	%i2,	%o0
	ldsw	[%l7 + 0x20],	%o4
	edge32	%l1,	%l5,	%g4
	xnorcc	%l2,	0x0A67,	%i5
	stw	%i3,	[%l7 + 0x08]
	movg	%icc,	%l4,	%i4
	stx	%g6,	[%l7 + 0x60]
	fmovse	%icc,	%f14,	%f9
	fmul8x16	%f14,	%f6,	%f0
	subcc	%o6,	%i7,	%l6
	movpos	%icc,	%o5,	%g3
	edge16	%g7,	%i6,	%g5
	edge16	%g2,	%o3,	%i0
	and	%g1,	%o1,	%o7
	sdivcc	%o2,	0x1CFD,	%l3
	fabsd	%f2,	%f14
	subc	%l0,	0x0F13,	%i1
	movge	%icc,	%i2,	%o4
	movne	%icc,	%l1,	%l5
	ldx	[%l7 + 0x48],	%g4
	fcmpeq32	%f2,	%f2,	%o0
	edge16ln	%i5,	%l2,	%i3
	subc	%i4,	0x157E,	%g6
	fmovscc	%xcc,	%f1,	%f15
	andcc	%o6,	%i7,	%l4
	st	%f12,	[%l7 + 0x70]
	smulcc	%l6,	%o5,	%g3
	movg	%xcc,	%i6,	%g7
	stb	%g2,	[%l7 + 0x69]
	ldsb	[%l7 + 0x15],	%o3
	fmovdneg	%xcc,	%f1,	%f13
	fmovdcs	%xcc,	%f13,	%f4
	sub	%g5,	%i0,	%g1
	edge8l	%o1,	%o2,	%o7
	fand	%f0,	%f2,	%f10
	xnor	%l3,	0x14C4,	%l0
	fornot2s	%f14,	%f13,	%f5
	movrlz	%i1,	0x3BE,	%o4
	save %i2, %l1, %g4
	fmovrsgez	%o0,	%f0,	%f2
	std	%f14,	[%l7 + 0x38]
	sdivcc	%i5,	0x014C,	%l2
	sdiv	%l5,	0x1875,	%i3
	sra	%i4,	0x17,	%g6
	st	%f7,	[%l7 + 0x30]
	lduh	[%l7 + 0x52],	%o6
	subcc	%i7,	0x0C91,	%l4
	umulcc	%o5,	0x154B,	%l6
	subc	%i6,	%g7,	%g2
	movcc	%xcc,	%o3,	%g5
	movge	%xcc,	%i0,	%g1
	srax	%o1,	%g3,	%o2
	mova	%icc,	%o7,	%l0
	sdiv	%l3,	0x1060,	%o4
	udivx	%i2,	0x1C88,	%l1
	fmovrdgez	%i1,	%f10,	%f0
	add	%g4,	0x1482,	%i5
	fors	%f4,	%f9,	%f12
	ldd	[%l7 + 0x38],	%f6
	edge32n	%o0,	%l2,	%i3
	st	%f14,	[%l7 + 0x18]
	fmovdvs	%xcc,	%f3,	%f0
	movgu	%xcc,	%l5,	%i4
	mulscc	%o6,	%g6,	%l4
	edge8ln	%o5,	%i7,	%i6
	edge16ln	%l6,	%g7,	%g2
	stw	%o3,	[%l7 + 0x20]
	edge32n	%g5,	%g1,	%o1
	andn	%i0,	%g3,	%o7
	movrgez	%o2,	0x041,	%l3
	subcc	%o4,	%l0,	%l1
	stb	%i2,	[%l7 + 0x08]
	sdivx	%g4,	0x111A,	%i5
	fandnot2	%f12,	%f6,	%f14
	edge32ln	%o0,	%l2,	%i3
	udivcc	%i1,	0x0BBD,	%l5
	lduw	[%l7 + 0x44],	%i4
	restore %g6, 0x02F8, %o6
	orncc	%o5,	0x1950,	%l4
	fmovrdgez	%i6,	%f10,	%f0
	lduh	[%l7 + 0x68],	%l6
	ldsh	[%l7 + 0x42],	%i7
	mulx	%g7,	%o3,	%g2
	and	%g5,	0x0639,	%o1
	fors	%f0,	%f12,	%f5
	or	%i0,	0x04FA,	%g3
	lduh	[%l7 + 0x14],	%g1
	alignaddrl	%o2,	%o7,	%l3
	alignaddr	%o4,	%l0,	%l1
	sdivcc	%g4,	0x1BBE,	%i2
	orn	%o0,	0x10CA,	%i5
	orncc	%l2,	%i1,	%l5
	sllx	%i3,	0x0D,	%g6
	edge32	%i4,	%o6,	%o5
	sub	%i6,	%l4,	%l6
	movgu	%xcc,	%g7,	%o3
	andncc	%i7,	%g5,	%o1
	stx	%g2,	[%l7 + 0x68]
	sdiv	%i0,	0x06DC,	%g3
	xnorcc	%o2,	%g1,	%o7
	fabsd	%f0,	%f2
	xnorcc	%o4,	0x1B1F,	%l0
	movrlez	%l1,	%l3,	%i2
	movrlez	%g4,	%o0,	%l2
	movrgz	%i1,	0x305,	%l5
	fmovrdgez	%i5,	%f4,	%f0
	udiv	%g6,	0x00D8,	%i3
	lduh	[%l7 + 0x10],	%i4
	movpos	%xcc,	%o5,	%i6
	fmovdcc	%xcc,	%f3,	%f6
	mulscc	%l4,	%o6,	%g7
	sllx	%o3,	%i7,	%g5
	fmovdle	%xcc,	%f4,	%f15
	stx	%l6,	[%l7 + 0x78]
	edge16n	%o1,	%i0,	%g2
	fsrc1	%f0,	%f10
	fmovdcs	%xcc,	%f15,	%f6
	fmovdne	%icc,	%f3,	%f11
	stb	%o2,	[%l7 + 0x29]
	faligndata	%f0,	%f0,	%f2
	udiv	%g3,	0x0C88,	%g1
	edge8n	%o7,	%l0,	%l1
	edge16n	%l3,	%o4,	%i2
	movpos	%icc,	%g4,	%l2
	fands	%f9,	%f6,	%f2
	subcc	%o0,	%l5,	%i5
	st	%f7,	[%l7 + 0x60]
	orcc	%g6,	%i3,	%i4
	fpack32	%f8,	%f6,	%f14
	addcc	%o5,	%i1,	%i6
	save %o6, %g7, %l4
	smulcc	%o3,	%g5,	%i7
	udivx	%o1,	0x0A35,	%i0
	movneg	%xcc,	%l6,	%g2
	array16	%g3,	%g1,	%o2
	movgu	%xcc,	%l0,	%o7
	fmovsg	%xcc,	%f6,	%f0
	fmovrdgz	%l1,	%f0,	%f6
	orcc	%l3,	0x1E7C,	%i2
	popc	%o4,	%l2
	alignaddrl	%o0,	%l5,	%g4
	udivx	%i5,	0x01AA,	%i3
	sll	%i4,	%g6,	%o5
	movneg	%xcc,	%i6,	%i1
	sdivx	%g7,	0x0820,	%o6
	addccc	%l4,	0x1765,	%o3
	array16	%i7,	%o1,	%i0
	fcmple32	%f14,	%f10,	%l6
	fmovdcs	%xcc,	%f3,	%f2
	subccc	%g5,	0x1D22,	%g2
	fnegd	%f6,	%f10
	movrgez	%g1,	%o2,	%l0
	edge16l	%g3,	%o7,	%l1
	ldd	[%l7 + 0x18],	%i2
	edge32n	%o4,	%l3,	%o0
	restore %l2, 0x075D, %l5
	movrne	%g4,	%i3,	%i4
	udivcc	%g6,	0x1436,	%o5
	fmovrdlez	%i6,	%f12,	%f10
	movle	%xcc,	%i5,	%i1
	std	%f10,	[%l7 + 0x48]
	andcc	%o6,	0x1E5C,	%l4
	sth	%g7,	[%l7 + 0x62]
	movrlz	%i7,	0x16C,	%o3
	alignaddr	%o1,	%i0,	%l6
	fmul8x16au	%f13,	%f10,	%f0
	std	%f8,	[%l7 + 0x28]
	edge8	%g5,	%g2,	%o2
	ld	[%l7 + 0x3C],	%f15
	std	%f14,	[%l7 + 0x70]
	movvc	%xcc,	%g1,	%g3
	ldx	[%l7 + 0x28],	%o7
	edge32ln	%l1,	%i2,	%o4
	addcc	%l3,	0x1E60,	%l0
	edge8	%l2,	%o0,	%l5
	fmovdl	%icc,	%f12,	%f14
	fmovrsne	%i3,	%f2,	%f9
	pdist	%f6,	%f0,	%f2
	sdiv	%i4,	0x0336,	%g6
	edge32ln	%o5,	%g4,	%i6
	fmovdvs	%icc,	%f11,	%f5
	edge8ln	%i5,	%i1,	%o6
	fandnot1s	%f14,	%f3,	%f12
	movrlez	%g7,	%i7,	%l4
	sub	%o3,	%o1,	%l6
	fxnor	%f0,	%f0,	%f0
	movrne	%g5,	0x2BD,	%i0
	add	%o2,	0x1F0B,	%g1
	movvs	%xcc,	%g3,	%g2
	smulcc	%l1,	%i2,	%o4
	edge32n	%o7,	%l3,	%l2
	save %l0, %o0, %l5
	stw	%i4,	[%l7 + 0x60]
	stw	%g6,	[%l7 + 0x78]
	orn	%i3,	0x1021,	%o5
	fcmped	%fcc0,	%f8,	%f4
	xor	%g4,	0x00FF,	%i5
	sth	%i1,	[%l7 + 0x5C]
	ldd	[%l7 + 0x18],	%i6
	alignaddr	%o6,	%g7,	%i7
	fcmpne16	%f10,	%f4,	%o3
	st	%f3,	[%l7 + 0x50]
	fxnor	%f0,	%f12,	%f4
	edge16n	%l4,	%l6,	%o1
	edge32n	%g5,	%i0,	%o2
	movg	%icc,	%g3,	%g1
	edge8n	%g2,	%i2,	%l1
	fmovsa	%icc,	%f15,	%f3
	fmovsg	%xcc,	%f1,	%f14
	sethi	0x0EBA,	%o4
	movcc	%icc,	%l3,	%o7
	orn	%l0,	0x1ED1,	%o0
	sdivcc	%l2,	0x16E0,	%l5
	movrne	%i4,	0x0F0,	%i3
	sdiv	%g6,	0x0B11,	%o5
	movre	%g4,	%i5,	%i6
	subccc	%o6,	0x011B,	%g7
	orn	%i7,	%o3,	%i1
	array32	%l6,	%l4,	%o1
	fmuld8sux16	%f5,	%f3,	%f12
	array16	%g5,	%o2,	%g3
	udiv	%g1,	0x1C0A,	%g2
	faligndata	%f0,	%f14,	%f2
	sra	%i0,	0x1F,	%l1
	sdiv	%i2,	0x121A,	%o4
	srl	%o7,	%l3,	%o0
	and	%l2,	0x006D,	%l0
	edge32n	%l5,	%i3,	%i4
	srlx	%o5,	0x01,	%g6
	fmovdcs	%xcc,	%f6,	%f7
	andncc	%i5,	%i6,	%o6
	umul	%g7,	0x1774,	%i7
	mulx	%g4,	%i1,	%l6
	ldx	[%l7 + 0x28],	%o3
	save %o1, %g5, %o2
	fandnot1	%f2,	%f2,	%f14
	movvc	%icc,	%l4,	%g1
	fmovd	%f2,	%f0
	sdivx	%g2,	0x13DD,	%g3
	fmul8x16al	%f2,	%f4,	%f12
	udivx	%l1,	0x1082,	%i0
	srl	%o4,	%o7,	%l3
	fmovscs	%icc,	%f11,	%f15
	xor	%i2,	%l2,	%l0
	addccc	%o0,	0x1CAB,	%l5
	xorcc	%i4,	0x1473,	%o5
	fmovdn	%icc,	%f13,	%f1
	addc	%g6,	%i3,	%i5
	udivcc	%i6,	0x0FF9,	%g7
	fpack32	%f2,	%f2,	%f12
	stx	%i7,	[%l7 + 0x70]
	fcmpeq32	%f12,	%f2,	%o6
	st	%f5,	[%l7 + 0x08]
	andn	%g4,	%i1,	%l6
	srl	%o1,	0x0B,	%g5
	fmovrdlz	%o3,	%f12,	%f0
	movrlez	%o2,	%l4,	%g2
	mulx	%g1,	0x1557,	%g3
	fmovdne	%xcc,	%f14,	%f4
	fcmpes	%fcc3,	%f3,	%f6
	movrne	%i0,	%l1,	%o7
	ldx	[%l7 + 0x28],	%l3
	fnor	%f0,	%f0,	%f14
	lduh	[%l7 + 0x6A],	%i2
	fxors	%f4,	%f15,	%f8
	xorcc	%l2,	%l0,	%o0
	orcc	%l5,	%o4,	%i4
	orn	%g6,	0x0C47,	%o5
	movneg	%xcc,	%i5,	%i3
	subccc	%g7,	%i6,	%i7
	xorcc	%o6,	0x1B74,	%g4
	array8	%i1,	%o1,	%l6
	movpos	%xcc,	%o3,	%g5
	fandnot1s	%f13,	%f3,	%f8
	edge32ln	%l4,	%o2,	%g2
	mulscc	%g3,	0x0433,	%i0
	fmovsvs	%xcc,	%f15,	%f15
	movvs	%icc,	%g1,	%o7
	movrlz	%l1,	%l3,	%i2
	ldd	[%l7 + 0x18],	%l2
	edge32l	%o0,	%l5,	%o4
	udivx	%i4,	0x1FB1,	%l0
	andcc	%o5,	%i5,	%i3
	srl	%g7,	0x10,	%g6
	movgu	%xcc,	%i7,	%o6
	srax	%i6,	%g4,	%o1
	orncc	%l6,	0x10A6,	%i1
	restore %g5, %l4, %o3
	st	%f1,	[%l7 + 0x5C]
	movn	%xcc,	%g2,	%o2
	movpos	%xcc,	%g3,	%g1
	edge16n	%i0,	%l1,	%l3
	edge16	%i2,	%o7,	%o0
	movne	%icc,	%l5,	%l2
	mulx	%i4,	%o4,	%l0
	addccc	%i5,	0x134D,	%o5
	movrgez	%i3,	0x24E,	%g6
	smul	%i7,	0x0ECF,	%g7
	edge32ln	%o6,	%i6,	%o1
	mulscc	%l6,	%i1,	%g5
	movrgez	%l4,	%g4,	%o3
	edge32	%o2,	%g2,	%g1
	fnot1s	%f13,	%f3
	udivx	%i0,	0x18E7,	%l1
	orcc	%l3,	0x1AAE,	%i2
	fnors	%f2,	%f9,	%f3
	andcc	%g3,	%o0,	%l5
	movrgez	%l2,	%o7,	%i4
	edge32	%o4,	%l0,	%i5
	array8	%o5,	%i3,	%g6
	mulx	%g7,	%o6,	%i6
	edge32n	%o1,	%i7,	%i1
	umul	%l6,	0x02B3,	%l4
	orcc	%g4,	0x12A2,	%o3
	restore %o2, %g2, %g5
	edge16	%i0,	%g1,	%l3
	lduw	[%l7 + 0x0C],	%i2
	addc	%g3,	%o0,	%l5
	orn	%l1,	%o7,	%i4
	stw	%l2,	[%l7 + 0x14]
	fmovs	%f10,	%f15
	movpos	%xcc,	%l0,	%i5
	movle	%xcc,	%o4,	%i3
	movrne	%o5,	%g7,	%g6
	edge32l	%i6,	%o6,	%i7
	movn	%icc,	%o1,	%i1
	srax	%l4,	0x09,	%g4
	xorcc	%o3,	0x129F,	%o2
	orncc	%g2,	%g5,	%i0
	sll	%g1,	0x04,	%l3
	fcmple32	%f10,	%f10,	%i2
	ldx	[%l7 + 0x60],	%l6
	std	%f6,	[%l7 + 0x50]
	subc	%o0,	0x07D9,	%g3
	edge16n	%l5,	%l1,	%o7
	orn	%l2,	%i4,	%l0
	edge16l	%o4,	%i5,	%i3
	ldx	[%l7 + 0x08],	%o5
	subccc	%g7,	%i6,	%g6
	movneg	%icc,	%i7,	%o6
	movne	%icc,	%o1,	%l4
	addcc	%g4,	%i1,	%o3
	ldsh	[%l7 + 0x60],	%o2
	addc	%g5,	0x14B2,	%g2
	edge16n	%g1,	%l3,	%i0
	movrne	%l6,	0x3BF,	%o0
	ldsw	[%l7 + 0x2C],	%g3
	ldsw	[%l7 + 0x40],	%l5
	sdivx	%l1,	0x0F20,	%i2
	fabsd	%f0,	%f6
	movvs	%xcc,	%l2,	%i4
	movcs	%icc,	%o7,	%o4
	fmovrdlez	%l0,	%f8,	%f4
	addc	%i3,	%o5,	%i5
	udivx	%i6,	0x0499,	%g6
	udiv	%i7,	0x19A2,	%o6
	xnorcc	%g7,	%o1,	%l4
	movleu	%xcc,	%g4,	%i1
	ldd	[%l7 + 0x78],	%f12
	srl	%o2,	0x14,	%g5
	fmovse	%icc,	%f4,	%f15
	movcs	%xcc,	%g2,	%o3
	edge32	%g1,	%i0,	%l3
	fones	%f6
	xor	%l6,	%g3,	%o0
	movvs	%icc,	%l5,	%i2
	save %l2, %l1, %o7
	orcc	%i4,	%o4,	%i3
	st	%f4,	[%l7 + 0x7C]
	st	%f9,	[%l7 + 0x54]
	movleu	%xcc,	%l0,	%o5
	fmovrslez	%i6,	%f0,	%f0
	fcmpes	%fcc2,	%f5,	%f0
	ldx	[%l7 + 0x18],	%i5
	or	%g6,	%o6,	%i7
	fmovdl	%xcc,	%f7,	%f12
	edge8ln	%o1,	%g7,	%g4
	stw	%l4,	[%l7 + 0x30]
	fpadd32s	%f13,	%f7,	%f2
	edge16l	%o2,	%i1,	%g5
	movvs	%icc,	%g2,	%o3
	udiv	%g1,	0x1991,	%i0
	ld	[%l7 + 0x4C],	%f15
	umulcc	%l6,	0x06CC,	%l3
	edge32n	%o0,	%l5,	%i2
	stb	%l2,	[%l7 + 0x1C]
	ldub	[%l7 + 0x20],	%l1
	st	%f4,	[%l7 + 0x20]
	srlx	%g3,	%i4,	%o7
	movpos	%xcc,	%i3,	%l0
	udiv	%o4,	0x0F6B,	%i6
	srl	%o5,	0x10,	%g6
	umul	%i5,	0x1B82,	%i7
	stx	%o6,	[%l7 + 0x20]
	fpadd16	%f10,	%f6,	%f4
	sth	%o1,	[%l7 + 0x46]
	edge32l	%g4,	%g7,	%o2
	fnegd	%f2,	%f10
	fnot1	%f12,	%f2
	mulx	%i1,	0x08C7,	%g5
	st	%f1,	[%l7 + 0x68]
	fpadd16	%f2,	%f12,	%f10
	movle	%xcc,	%l4,	%o3
	and	%g2,	%i0,	%g1
	fmovrdgz	%l6,	%f12,	%f8
	ldsh	[%l7 + 0x38],	%l3
	move	%icc,	%o0,	%i2
	ldx	[%l7 + 0x58],	%l2
	sethi	0x015A,	%l1
	sethi	0x02A9,	%l5
	ldsw	[%l7 + 0x78],	%i4
	movgu	%icc,	%g3,	%i3
	addc	%o7,	%o4,	%l0
	srlx	%o5,	%i6,	%i5
	srax	%g6,	0x0A,	%o6
	sdivx	%o1,	0x02A6,	%i7
	stx	%g7,	[%l7 + 0x70]
	and	%o2,	0x1584,	%g4
	movl	%xcc,	%g5,	%i1
	ldd	[%l7 + 0x78],	%f6
	movrgz	%o3,	%l4,	%i0
	movcs	%xcc,	%g1,	%l6
	ldub	[%l7 + 0x48],	%l3
	movcs	%xcc,	%g2,	%o0
	edge32	%i2,	%l1,	%l2
	smulcc	%i4,	%g3,	%i3
	sub	%l5,	0x0629,	%o4
	movre	%o7,	0x351,	%o5
	movvc	%xcc,	%i6,	%i5
	udivcc	%g6,	0x0914,	%o6
	xnorcc	%l0,	0x1093,	%o1
	movvc	%icc,	%g7,	%i7
	fmovs	%f6,	%f9
	movre	%o2,	%g5,	%i1
	fmovdcc	%icc,	%f8,	%f5
	lduw	[%l7 + 0x54],	%g4
	sub	%o3,	%l4,	%g1
	movge	%xcc,	%i0,	%l6
	edge32	%g2,	%l3,	%o0
	edge16ln	%l1,	%i2,	%i4
	fmovde	%xcc,	%f11,	%f11
	movcc	%xcc,	%g3,	%l2
	mova	%xcc,	%l5,	%o4
	fabss	%f4,	%f4
	udivcc	%o7,	0x14D8,	%o5
	ld	[%l7 + 0x2C],	%f6
	fornot2s	%f5,	%f8,	%f8
	ldsw	[%l7 + 0x5C],	%i3
	fmovdcc	%icc,	%f10,	%f15
	movne	%icc,	%i6,	%i5
	fmovdn	%xcc,	%f2,	%f2
	edge32n	%g6,	%o6,	%o1
	andn	%g7,	0x0B9F,	%l0
	sth	%i7,	[%l7 + 0x2A]
	popc	0x05D0,	%g5
	addc	%i1,	0x0A89,	%g4
	fandnot1s	%f4,	%f9,	%f12
	fandnot2	%f4,	%f8,	%f4
	movrlz	%o2,	0x332,	%l4
	fmovsge	%icc,	%f5,	%f14
	addc	%g1,	0x14F9,	%i0
	addccc	%o3,	0x1A5A,	%l6
	fmovsa	%xcc,	%f5,	%f13
	edge32ln	%g2,	%l3,	%o0
	fmovde	%xcc,	%f9,	%f12
	movge	%xcc,	%i2,	%l1
	andncc	%i4,	%l2,	%l5
	fornot2s	%f5,	%f10,	%f5
	srax	%g3,	0x11,	%o7
	srax	%o4,	%o5,	%i6
	stw	%i3,	[%l7 + 0x4C]
	array8	%g6,	%o6,	%i5
	fcmpne16	%f8,	%f0,	%g7
	movcc	%icc,	%o1,	%i7
	movne	%xcc,	%l0,	%g5
	sdivcc	%i1,	0x196B,	%o2
	andncc	%g4,	%g1,	%i0
	fcmple16	%f12,	%f4,	%l4
	edge8	%l6,	%g2,	%l3
	srl	%o3,	%i2,	%o0
	popc	%i4,	%l2
	addcc	%l5,	0x055C,	%g3
	save %o7, %o4, %l1
	mulx	%i6,	%i3,	%g6
	fpack32	%f4,	%f4,	%f4
	addccc	%o6,	0x0D28,	%o5
	smul	%g7,	%i5,	%i7
	orncc	%l0,	%g5,	%o1
	fmovsn	%icc,	%f7,	%f4
	fmovdl	%xcc,	%f11,	%f1
	smul	%i1,	0x08DC,	%g4
	or	%g1,	%o2,	%i0
	ldd	[%l7 + 0x78],	%f0
	movrne	%l6,	%g2,	%l3
	alignaddr	%o3,	%l4,	%i2
	fmovdpos	%icc,	%f4,	%f3
	std	%f14,	[%l7 + 0x78]
	fmovsvc	%xcc,	%f0,	%f12
	fcmpne16	%f4,	%f10,	%i4
	move	%xcc,	%l2,	%l5
	fmul8x16	%f0,	%f6,	%f12
	fxnors	%f9,	%f8,	%f11
	subccc	%g3,	0x1D91,	%o0
	ldsb	[%l7 + 0x5E],	%o4
	mulscc	%o7,	%i6,	%i3
	fmovda	%icc,	%f6,	%f4
	movrne	%g6,	0x3AD,	%l1
	lduh	[%l7 + 0x0E],	%o5
	fcmpgt16	%f14,	%f0,	%o6
	xnor	%i5,	%i7,	%g7
	popc	0x0EEF,	%g5
	addc	%o1,	%l0,	%i1
	edge16l	%g1,	%g4,	%i0
	stx	%o2,	[%l7 + 0x28]
	sth	%l6,	[%l7 + 0x26]
	sth	%g2,	[%l7 + 0x34]
	fcmpgt32	%f2,	%f6,	%o3
	popc	%l4,	%l3
	movrgez	%i4,	%l2,	%i2
	ldsb	[%l7 + 0x5F],	%l5
	movgu	%xcc,	%g3,	%o0
	fzeros	%f4
	sll	%o7,	%o4,	%i6
	andcc	%g6,	%l1,	%o5
	movcc	%xcc,	%i3,	%i5
	sth	%o6,	[%l7 + 0x34]
	srl	%g7,	%g5,	%i7
	orncc	%o1,	%i1,	%g1
	fmovdneg	%xcc,	%f2,	%f6
	array8	%l0,	%i0,	%o2
	udiv	%l6,	0x1A8F,	%g4
	pdist	%f10,	%f8,	%f0
	edge32n	%o3,	%l4,	%l3
	alignaddr	%g2,	%l2,	%i4
	sethi	0x13BC,	%i2
	fandnot2	%f4,	%f14,	%f14
	xorcc	%l5,	0x0494,	%g3
	movl	%xcc,	%o7,	%o0
	lduw	[%l7 + 0x5C],	%o4
	movg	%xcc,	%g6,	%i6
	stx	%l1,	[%l7 + 0x38]
	sdiv	%o5,	0x09BC,	%i3
	umulcc	%o6,	%i5,	%g7
	ld	[%l7 + 0x18],	%f15
	srlx	%i7,	%o1,	%g5
	umul	%i1,	%g1,	%l0
	movrgz	%i0,	%o2,	%g4
	and	%l6,	0x1B0F,	%o3
	edge8ln	%l3,	%l4,	%g2
	smulcc	%l2,	%i2,	%i4
	andcc	%g3,	0x0E8D,	%l5
	ldsb	[%l7 + 0x24],	%o7
	edge8ln	%o4,	%o0,	%g6
	smul	%l1,	0x0EC8,	%i6
	fmovse	%icc,	%f4,	%f13
	fandnot2	%f0,	%f10,	%f0
	fmovdne	%icc,	%f12,	%f15
	move	%xcc,	%o5,	%o6
	fmovdpos	%icc,	%f1,	%f2
	fmovscs	%icc,	%f7,	%f9
	orn	%i3,	%i5,	%g7
	faligndata	%f8,	%f2,	%f8
	udivcc	%o1,	0x06BC,	%i7
	fmovrdlez	%i1,	%f12,	%f8
	andn	%g5,	0x0861,	%l0
	smul	%g1,	%o2,	%g4
	and	%i0,	%l6,	%l3
	andn	%o3,	%l4,	%l2
	fmovsne	%icc,	%f9,	%f5
	add	%i2,	%g2,	%i4
	st	%f5,	[%l7 + 0x50]
	orcc	%l5,	%o7,	%g3
	subccc	%o0,	%g6,	%o4
	edge16	%i6,	%o5,	%o6
	orcc	%i3,	%i5,	%g7
	udivcc	%l1,	0x0645,	%o1
	and	%i1,	%i7,	%l0
	movgu	%xcc,	%g5,	%g1
	umul	%o2,	0x0139,	%g4
	sethi	0x0572,	%i0
	movn	%xcc,	%l6,	%o3
	fcmpeq16	%f4,	%f10,	%l4
	srlx	%l2,	%l3,	%g2
	fmovrsne	%i4,	%f7,	%f6
	smulcc	%i2,	0x0A6A,	%o7
	sethi	0x018D,	%g3
	sth	%o0,	[%l7 + 0x6C]
	movneg	%icc,	%l5,	%o4
	edge16ln	%i6,	%o5,	%g6
	fabsd	%f0,	%f4
	stw	%i3,	[%l7 + 0x3C]
	fzero	%f2
	st	%f5,	[%l7 + 0x50]
	fsrc2s	%f4,	%f11
	movrne	%i5,	0x0C5,	%o6
	movge	%xcc,	%l1,	%g7
	addcc	%o1,	%i7,	%i1
	movgu	%icc,	%g5,	%g1
	movn	%xcc,	%o2,	%l0
	edge32ln	%i0,	%g4,	%l6
	edge16n	%o3,	%l4,	%l3
	lduh	[%l7 + 0x42],	%l2
	popc	0x07C3,	%g2
	andcc	%i2,	%o7,	%g3
	movrgez	%i4,	0x322,	%o0
	subc	%o4,	%i6,	%l5
	st	%f4,	[%l7 + 0x10]
	fxors	%f4,	%f15,	%f6
	andcc	%g6,	%i3,	%o5
	fandnot1	%f6,	%f12,	%f2
	edge16	%o6,	%i5,	%l1
	xnorcc	%o1,	0x0FC6,	%i7
	orncc	%i1,	0x0F9D,	%g5
	sra	%g7,	%g1,	%l0
	edge8ln	%o2,	%g4,	%i0
	edge32l	%o3,	%l4,	%l3
	srlx	%l2,	0x08,	%l6
	movn	%icc,	%i2,	%g2
	alignaddr	%o7,	%g3,	%o0
	edge32ln	%i4,	%o4,	%i6
	movge	%icc,	%l5,	%i3
	edge32	%g6,	%o5,	%i5
	edge32ln	%o6,	%l1,	%i7
	umulcc	%o1,	%g5,	%g7
	udivcc	%g1,	0x1BF6,	%i1
	mulx	%l0,	%o2,	%i0
	addcc	%g4,	0x120C,	%l4
	edge32	%l3,	%o3,	%l2
	movleu	%icc,	%l6,	%g2
	movneg	%icc,	%o7,	%g3
	fsrc1s	%f0,	%f14
	movrlz	%i2,	0x1C0,	%o0
	movrne	%o4,	%i4,	%i6
	movge	%icc,	%i3,	%l5
	sdiv	%o5,	0x16D4,	%g6
	orcc	%o6,	%l1,	%i7
	fpack32	%f6,	%f0,	%f14
	movrgez	%o1,	%g5,	%i5
	ldsb	[%l7 + 0x19],	%g1
	addc	%i1,	0x0634,	%l0
	edge32n	%g7,	%o2,	%i0
	udiv	%l4,	0x1E56,	%g4
	movcs	%icc,	%l3,	%l2
	fnor	%f8,	%f14,	%f2
	stx	%o3,	[%l7 + 0x78]
	mulscc	%l6,	%g2,	%g3
	movle	%icc,	%i2,	%o7
	ldd	[%l7 + 0x08],	%f0
	mova	%xcc,	%o4,	%i4
	srlx	%o0,	%i6,	%i3
	movre	%o5,	0x131,	%l5
	ldsb	[%l7 + 0x11],	%o6
	andcc	%g6,	0x0131,	%i7
	addc	%o1,	%g5,	%i5
	fmul8x16au	%f4,	%f5,	%f12
	movrne	%g1,	0x324,	%l1
	movrlez	%i1,	%g7,	%o2
	and	%i0,	%l4,	%g4
	std	%f6,	[%l7 + 0x18]
	orn	%l3,	0x1A6A,	%l2
	fors	%f2,	%f2,	%f12
	sth	%o3,	[%l7 + 0x58]
	movrgez	%l0,	%l6,	%g2
	movcc	%icc,	%g3,	%i2
	movrgez	%o4,	0x3FE,	%o7
	udivcc	%o0,	0x0585,	%i4
	subcc	%i3,	%i6,	%o5
	or	%l5,	0x1CC6,	%o6
	fmovrdgez	%i7,	%f12,	%f2
	fmovrdgez	%o1,	%f10,	%f0
	mulx	%g6,	0x0C08,	%i5
	edge16ln	%g5,	%g1,	%l1
	fone	%f4
	save %i1, 0x00F3, %g7
	movrne	%i0,	%o2,	%l4
	fxnors	%f0,	%f0,	%f1
	umul	%g4,	%l2,	%l3
	fabsd	%f10,	%f0
	orcc	%l0,	%l6,	%o3
	fpadd16s	%f5,	%f0,	%f6
	move	%xcc,	%g3,	%g2
	st	%f6,	[%l7 + 0x5C]
	ldd	[%l7 + 0x30],	%o4
	fpadd16	%f12,	%f4,	%f6
	srlx	%o7,	%o0,	%i2
	mova	%xcc,	%i3,	%i6
	edge16ln	%i4,	%o5,	%l5
	fmul8sux16	%f6,	%f14,	%f6
	udivcc	%i7,	0x02B6,	%o1
	movcs	%xcc,	%g6,	%o6
	ldub	[%l7 + 0x78],	%i5
	stx	%g5,	[%l7 + 0x28]
	sll	%g1,	%i1,	%l1
	fornot2	%f0,	%f8,	%f12
	fmovrsgz	%g7,	%f0,	%f8
	edge16	%o2,	%l4,	%g4
	sdivx	%l2,	0x1A26,	%l3
	ldd	[%l7 + 0x60],	%f14
	xnor	%l0,	0x0B00,	%l6
	stx	%i0,	[%l7 + 0x40]
	edge8l	%g3,	%g2,	%o4
	save %o3, %o7, %i2
	udivcc	%o0,	0x1D6F,	%i3
	smul	%i6,	%o5,	%l5
	movpos	%xcc,	%i7,	%o1
	movpos	%icc,	%i4,	%o6
	fornot1	%f2,	%f8,	%f4
	edge32	%i5,	%g6,	%g1
	add	%g5,	%l1,	%g7
	edge16l	%i1,	%o2,	%g4
	xorcc	%l2,	0x0823,	%l3
	add	%l0,	%l4,	%l6
	xnorcc	%i0,	%g3,	%o4
	sllx	%o3,	0x0F,	%o7
	movle	%icc,	%i2,	%g2
	edge16n	%o0,	%i3,	%i6
	or	%o5,	%i7,	%o1
	ldx	[%l7 + 0x40],	%l5
	fmuld8ulx16	%f6,	%f2,	%f2
	ldsb	[%l7 + 0x32],	%o6
	edge32l	%i4,	%g6,	%g1
	array16	%i5,	%l1,	%g7
	fmovdcs	%icc,	%f15,	%f3
	ld	[%l7 + 0x30],	%f0
	movrgz	%i1,	0x10B,	%g5
	fabss	%f5,	%f14
	andcc	%o2,	0x0BC4,	%g4
	edge32l	%l2,	%l3,	%l0
	movrgez	%l4,	0x1D0,	%l6
	andn	%i0,	%o4,	%o3
	ldsw	[%l7 + 0x7C],	%o7
	fnot1	%f6,	%f4
	restore %i2, %g3, %o0
	xnor	%i3,	%g2,	%o5
	sth	%i6,	[%l7 + 0x7A]
	srl	%i7,	%l5,	%o6
	movgu	%icc,	%o1,	%g6
	edge8l	%i4,	%g1,	%i5
	movleu	%icc,	%l1,	%i1
	fones	%f7
	ldd	[%l7 + 0x78],	%g4
	fmovsl	%icc,	%f7,	%f0
	edge16ln	%g7,	%o2,	%g4
	ldsw	[%l7 + 0x0C],	%l2
	sdiv	%l0,	0x155B,	%l4
	sll	%l6,	%i0,	%o4
	fpmerge	%f11,	%f2,	%f10
	fpack32	%f14,	%f10,	%f0
	popc	0x14FE,	%o3
	fpack16	%f12,	%f2
	ldd	[%l7 + 0x08],	%l2
	edge32ln	%o7,	%i2,	%g3
	xnorcc	%i3,	%g2,	%o0
	stx	%o5,	[%l7 + 0x78]
	lduh	[%l7 + 0x60],	%i7
	udivx	%l5,	0x0E79,	%o6
	edge8n	%i6,	%o1,	%g6
	array8	%g1,	%i5,	%l1
	move	%icc,	%i4,	%i1
	stw	%g5,	[%l7 + 0x74]
	fabsd	%f4,	%f14
	sub	%o2,	0x13F6,	%g7
	xorcc	%g4,	0x1AAE,	%l0
	stx	%l2,	[%l7 + 0x78]
	smul	%l6,	%i0,	%l4
	stb	%o3,	[%l7 + 0x44]
	orncc	%l3,	0x0FDD,	%o7
	udivcc	%o4,	0x0893,	%g3
	movgu	%icc,	%i3,	%i2
	fabsd	%f4,	%f0
	movcs	%icc,	%g2,	%o5
	movvs	%icc,	%i7,	%o0
	udiv	%l5,	0x1020,	%o6
	save %o1, %g6, %i6
	srlx	%g1,	0x03,	%i5
	array16	%l1,	%i4,	%i1
	umulcc	%o2,	0x1F58,	%g7
	fcmpd	%fcc2,	%f0,	%f10
	fmovdle	%icc,	%f12,	%f6
	edge32	%g4,	%l0,	%l2
	fmovrdlz	%l6,	%f2,	%f2
	smul	%g5,	0x1C6F,	%l4
	subccc	%i0,	%l3,	%o3
	stx	%o7,	[%l7 + 0x50]
	xor	%g3,	%o4,	%i2
	fmovsneg	%icc,	%f9,	%f0
	fand	%f10,	%f0,	%f10
	sdivx	%i3,	0x12E3,	%g2
	edge8l	%o5,	%o0,	%l5
	ld	[%l7 + 0x48],	%f14
	orncc	%i7,	%o6,	%g6
	sdivcc	%o1,	0x1003,	%g1
	movg	%xcc,	%i5,	%l1
	smulcc	%i6,	%i4,	%i1
	ldub	[%l7 + 0x2B],	%o2
	movn	%icc,	%g7,	%l0
	fmovsg	%xcc,	%f6,	%f14
	orncc	%l2,	0x065E,	%g4
	movleu	%icc,	%l6,	%g5
	subcc	%l4,	%i0,	%o3
	addcc	%o7,	0x11E4,	%g3
	xnorcc	%o4,	%i2,	%i3
	edge16n	%g2,	%l3,	%o5
	sllx	%l5,	%o0,	%i7
	array32	%g6,	%o6,	%o1
	alignaddr	%g1,	%i5,	%i6
	edge8	%l1,	%i4,	%o2
	restore %i1, 0x1FE6, %l0
	sll	%g7,	0x03,	%g4
	sdivcc	%l2,	0x1B6D,	%g5
	fcmpeq16	%f2,	%f0,	%l6
	edge16n	%i0,	%l4,	%o3
	array32	%g3,	%o4,	%o7
	fxor	%f6,	%f2,	%f2
	srl	%i2,	0x06,	%g2
	umul	%l3,	0x14E1,	%i3
	restore %o5, %o0, %l5
	fcmpgt16	%f0,	%f4,	%g6
	addcc	%i7,	%o1,	%o6
	alignaddr	%i5,	%g1,	%i6
	smulcc	%i4,	%o2,	%i1
	sdivcc	%l1,	0x0395,	%g7
	udivx	%l0,	0x16D5,	%l2
	ldsb	[%l7 + 0x43],	%g4
	fmovsge	%icc,	%f4,	%f11
	edge16n	%g5,	%i0,	%l4
	movle	%xcc,	%o3,	%g3
	array32	%o4,	%o7,	%l6
	fcmpgt32	%f14,	%f0,	%i2
	movrgez	%l3,	%i3,	%g2
	sra	%o5,	%o0,	%l5
	xorcc	%g6,	0x04B2,	%i7
	addc	%o1,	0x1E96,	%i5
	lduw	[%l7 + 0x3C],	%g1
	sdiv	%o6,	0x1A20,	%i6
	edge8	%o2,	%i1,	%l1
	edge16	%g7,	%i4,	%l0
	fmovsvs	%xcc,	%f14,	%f13
	movvc	%xcc,	%l2,	%g5
	movge	%icc,	%i0,	%l4
	sethi	0x160A,	%o3
	std	%f8,	[%l7 + 0x78]
	fmovsle	%xcc,	%f8,	%f13
	ldd	[%l7 + 0x08],	%g4
	lduh	[%l7 + 0x0A],	%g3
	or	%o7,	%o4,	%i2
	fmul8x16au	%f15,	%f9,	%f14
	umulcc	%l3,	%l6,	%g2
	fones	%f12
	umul	%i3,	%o0,	%l5
	orncc	%o5,	%g6,	%i7
	fcmpd	%fcc3,	%f10,	%f14
	movre	%o1,	0x2B4,	%g1
	fmovsg	%xcc,	%f6,	%f14
	fmovd	%f2,	%f10
	std	%f12,	[%l7 + 0x28]
	fmovrsgz	%i5,	%f3,	%f6
	smulcc	%i6,	%o6,	%i1
	movrlez	%l1,	%o2,	%i4
	edge8l	%l0,	%l2,	%g5
	udiv	%g7,	0x0972,	%i0
	st	%f4,	[%l7 + 0x68]
	movrlez	%o3,	%l4,	%g4
	ldd	[%l7 + 0x10],	%f8
	fmovrdgz	%g3,	%f10,	%f14
	fmovdl	%xcc,	%f4,	%f9
	sdivx	%o7,	0x19F9,	%o4
	fcmpgt16	%f10,	%f8,	%i2
	fmul8sux16	%f2,	%f6,	%f0
	stw	%l6,	[%l7 + 0x60]
	sethi	0x16EA,	%l3
	movvc	%icc,	%g2,	%o0
	ld	[%l7 + 0x48],	%f5
	sra	%i3,	%o5,	%l5
	ldsw	[%l7 + 0x7C],	%i7
	ldd	[%l7 + 0x60],	%f14
	stx	%o1,	[%l7 + 0x08]
	and	%g6,	0x17DB,	%i5
	sll	%g1,	%i6,	%i1
	move	%xcc,	%l1,	%o6
	subccc	%i4,	0x0184,	%l0
	edge8l	%l2,	%g5,	%g7
	udivcc	%i0,	0x1C35,	%o2
	edge16n	%o3,	%l4,	%g3
	xor	%g4,	%o7,	%i2
	fabss	%f15,	%f8
	stb	%o4,	[%l7 + 0x73]
	movvs	%xcc,	%l3,	%g2
	edge8ln	%o0,	%i3,	%l6
	edge8ln	%l5,	%i7,	%o5
	fmul8sux16	%f0,	%f8,	%f4
	ldsw	[%l7 + 0x60],	%o1
	movg	%icc,	%g6,	%g1
	edge8	%i5,	%i6,	%i1
	alignaddr	%l1,	%o6,	%i4
	udivcc	%l2,	0x0D14,	%g5
	udivcc	%l0,	0x03D7,	%i0
	ldd	[%l7 + 0x20],	%o2
	sdivx	%g7,	0x1332,	%l4
	subcc	%o3,	0x0832,	%g3
	sub	%o7,	0x01F8,	%g4
	fmovrdlez	%i2,	%f12,	%f8
	xnorcc	%l3,	%o4,	%o0
	edge16n	%g2,	%l6,	%i3
	sdivcc	%i7,	0x0C9C,	%l5
	srax	%o5,	0x04,	%g6
	movcs	%icc,	%o1,	%g1
	fnors	%f1,	%f8,	%f5
	fabsd	%f4,	%f12
	ldsb	[%l7 + 0x5E],	%i6
	fmul8sux16	%f4,	%f4,	%f4
	movle	%icc,	%i1,	%l1
	lduw	[%l7 + 0x0C],	%i5
	subc	%o6,	%i4,	%l2
	srlx	%g5,	0x01,	%l0
	fcmpeq32	%f8,	%f14,	%o2
	sdivcc	%g7,	0x03BB,	%i0
	fors	%f1,	%f2,	%f8
	stw	%o3,	[%l7 + 0x0C]
	fnot1s	%f14,	%f4
	umulcc	%g3,	0x17E2,	%o7
	fornot2s	%f8,	%f11,	%f0
	movg	%icc,	%l4,	%g4
	ldsh	[%l7 + 0x30],	%l3
	udivcc	%o4,	0x019B,	%o0
	andcc	%i2,	0x0D05,	%l6
	stx	%g2,	[%l7 + 0x78]
	sethi	0x16E1,	%i7
	restore %l5, %o5, %i3
	smulcc	%o1,	%g1,	%g6
	fornot2	%f0,	%f12,	%f8
	andncc	%i1,	%i6,	%i5
	fmovsn	%xcc,	%f3,	%f15
	sth	%o6,	[%l7 + 0x42]
	edge16ln	%i4,	%l2,	%l1
	edge8l	%g5,	%o2,	%l0
	fmuld8ulx16	%f11,	%f13,	%f14
	std	%f12,	[%l7 + 0x20]
	edge8n	%i0,	%g7,	%g3
	edge8l	%o7,	%l4,	%g4
	stb	%o3,	[%l7 + 0x3B]
	st	%f3,	[%l7 + 0x44]
	stx	%l3,	[%l7 + 0x28]
	fmovde	%xcc,	%f12,	%f3
	addccc	%o4,	0x0CE4,	%o0
	ldsh	[%l7 + 0x34],	%i2
	fmovscs	%xcc,	%f14,	%f9
	fxnor	%f2,	%f6,	%f12
	fnands	%f4,	%f12,	%f7
	smulcc	%l6,	%g2,	%l5
	movcc	%xcc,	%o5,	%i3
	addc	%o1,	0x1BAC,	%g1
	fmovsne	%xcc,	%f5,	%f9
	edge16ln	%i7,	%i1,	%g6
	mova	%xcc,	%i5,	%o6
	fmovdle	%xcc,	%f1,	%f5
	alignaddrl	%i6,	%l2,	%l1
	edge32	%g5,	%o2,	%l0
	fmovrdgz	%i4,	%f4,	%f12
	srl	%g7,	0x1D,	%i0
	std	%f4,	[%l7 + 0x18]
	fornot2	%f2,	%f10,	%f0
	fand	%f0,	%f4,	%f4
	movgu	%xcc,	%o7,	%g3
	stx	%l4,	[%l7 + 0x40]
	movge	%xcc,	%g4,	%o3
	ldd	[%l7 + 0x30],	%f10
	movne	%xcc,	%o4,	%l3
	movleu	%xcc,	%i2,	%o0
	sdiv	%g2,	0x0ABA,	%l5
	fnot2	%f8,	%f12
	smulcc	%l6,	0x0A34,	%o5
	edge16n	%o1,	%i3,	%g1
	movge	%icc,	%i1,	%g6
	movrlez	%i7,	%i5,	%o6
	sub	%i6,	0x0A24,	%l1
	addccc	%l2,	%o2,	%l0
	sra	%i4,	%g5,	%i0
	fmovrsgz	%o7,	%f0,	%f7
	add	%g3,	%g7,	%g4
	movne	%xcc,	%l4,	%o4
	fmul8sux16	%f4,	%f4,	%f14
	fmuld8ulx16	%f12,	%f11,	%f14
	edge32l	%l3,	%i2,	%o3
	stw	%g2,	[%l7 + 0x28]
	ldd	[%l7 + 0x38],	%o0
	udivcc	%l6,	0x032C,	%o5
	lduh	[%l7 + 0x7E],	%l5
	fcmple32	%f12,	%f4,	%o1
	fand	%f6,	%f12,	%f2
	popc	%g1,	%i3
	fcmpne16	%f4,	%f14,	%g6
	movl	%icc,	%i1,	%i5
	movvs	%icc,	%o6,	%i7
	subccc	%i6,	0x021E,	%l1
	udiv	%l2,	0x1DD8,	%l0
	movgu	%xcc,	%o2,	%g5
	sllx	%i0,	0x0D,	%i4
	sdiv	%o7,	0x05B6,	%g3
	movrlez	%g7,	0x168,	%g4
	stw	%o4,	[%l7 + 0x60]
	fpadd32s	%f11,	%f15,	%f13
	ldd	[%l7 + 0x58],	%f14
	fmovrsgz	%l4,	%f3,	%f3
	umul	%l3,	0x1AC2,	%o3
	movvc	%icc,	%g2,	%i2
	edge32n	%l6,	%o5,	%l5
	fmovdl	%icc,	%f4,	%f1
	fcmpes	%fcc0,	%f12,	%f10
	fmovrdlz	%o0,	%f8,	%f2
	fmovdneg	%xcc,	%f2,	%f14
	udiv	%o1,	0x0B45,	%g1
	array32	%i3,	%i1,	%g6
	movgu	%icc,	%i5,	%o6
	edge16	%i6,	%i7,	%l2
	movrlz	%l1,	%o2,	%g5
	stw	%i0,	[%l7 + 0x68]
	andn	%i4,	0x016F,	%o7
	ldsh	[%l7 + 0x18],	%g3
	fmovdcs	%icc,	%f8,	%f14
	ldd	[%l7 + 0x10],	%f4
	smul	%l0,	0x10B8,	%g4
	popc	%o4,	%l4
	add	%g7,	%o3,	%g2
	orcc	%l3,	0x1D25,	%l6
	fsrc2	%f10,	%f0
	movcc	%xcc,	%i2,	%l5
	orncc	%o0,	0x1FCF,	%o1
	movgu	%icc,	%g1,	%i3
	umul	%o5,	0x0DBB,	%g6
	fpadd32s	%f5,	%f14,	%f11
	sdiv	%i1,	0x0D09,	%o6
	fmovsg	%xcc,	%f7,	%f14
	movre	%i5,	%i7,	%l2
	movleu	%icc,	%i6,	%o2
	srl	%l1,	0x14,	%i0
	ld	[%l7 + 0x4C],	%f0
	fcmple16	%f10,	%f8,	%i4
	ldd	[%l7 + 0x38],	%f12
	fmuld8ulx16	%f15,	%f10,	%f12
	fabss	%f12,	%f11
	fcmps	%fcc1,	%f10,	%f3
	subcc	%g5,	%g3,	%o7
	edge16ln	%g4,	%o4,	%l0
	ldsw	[%l7 + 0x34],	%l4
	fands	%f1,	%f8,	%f5
	edge32ln	%g7,	%g2,	%o3
	fpadd32s	%f0,	%f15,	%f11
	edge16	%l6,	%l3,	%i2
	edge8ln	%o0,	%l5,	%g1
	fmovrsgez	%i3,	%f10,	%f0
	xnor	%o5,	0x0A4E,	%g6
	orn	%i1,	0x11D3,	%o1
	fmovsa	%icc,	%f2,	%f10
	orcc	%i5,	0x1D1C,	%i7
	umulcc	%o6,	%i6,	%o2
	fands	%f13,	%f10,	%f0
	sll	%l2,	0x0F,	%i0
	sub	%i4,	%l1,	%g3
	mulscc	%o7,	%g5,	%o4
	fsrc2s	%f5,	%f4
	sllx	%l0,	%l4,	%g4
	ldsh	[%l7 + 0x30],	%g7
	movrgez	%g2,	%l6,	%o3
	stb	%l3,	[%l7 + 0x18]
	edge16ln	%o0,	%l5,	%g1
	fcmpne16	%f12,	%f8,	%i3
	std	%f12,	[%l7 + 0x60]
	stb	%o5,	[%l7 + 0x44]
	sll	%i2,	%i1,	%g6
	fnot2	%f4,	%f4
	addccc	%o1,	%i7,	%i5
	movrne	%o6,	0x0FA,	%i6
	xorcc	%o2,	0x1379,	%i0
	ldd	[%l7 + 0x70],	%l2
	edge32n	%i4,	%l1,	%g3
	movleu	%icc,	%g5,	%o7
	ldub	[%l7 + 0x3B],	%o4
	movle	%xcc,	%l0,	%g4
	movcs	%icc,	%l4,	%g2
	edge8n	%l6,	%o3,	%g7
	fpackfix	%f14,	%f8
	fnot1	%f14,	%f4
	xorcc	%l3,	%o0,	%g1
	fones	%f0
	movneg	%xcc,	%i3,	%o5
	srlx	%l5,	0x0E,	%i2
	sdivcc	%g6,	0x018B,	%o1
	srax	%i1,	%i7,	%o6
	ldub	[%l7 + 0x0A],	%i6
	stb	%o2,	[%l7 + 0x3A]
	fpackfix	%f0,	%f11
	orcc	%i0,	0x18FF,	%l2
	udivcc	%i5,	0x0737,	%i4
	movleu	%xcc,	%g3,	%l1
	fsrc2	%f8,	%f12
	movre	%g5,	%o7,	%o4
	edge16ln	%l0,	%g4,	%g2
	fcmpne32	%f10,	%f6,	%l6
	ld	[%l7 + 0x74],	%f10
	fmul8ulx16	%f12,	%f4,	%f6
	fpadd32s	%f15,	%f4,	%f1
	edge16n	%l4,	%g7,	%l3
	array16	%o0,	%o3,	%i3
	fcmpeq16	%f0,	%f8,	%o5
	fzeros	%f14
	fand	%f12,	%f4,	%f14
	edge16n	%l5,	%g1,	%i2
	movpos	%xcc,	%g6,	%i1
	ldsb	[%l7 + 0x61],	%o1
	fcmpgt16	%f0,	%f8,	%i7
	lduw	[%l7 + 0x30],	%i6
	andncc	%o2,	%i0,	%l2
	ldsw	[%l7 + 0x50],	%i5
	movrne	%o6,	0x003,	%i4
	movvc	%xcc,	%g3,	%l1
	alignaddr	%g5,	%o4,	%o7
	edge32n	%g4,	%g2,	%l6
	movrlez	%l4,	0x11F,	%l0
	andncc	%g7,	%l3,	%o0
	subccc	%i3,	%o5,	%l5
	udivcc	%o3,	0x1356,	%i2
	fmuld8sux16	%f9,	%f4,	%f12
	edge8ln	%g1,	%i1,	%o1
	restore %g6, 0x1DC4, %i7
	edge32n	%i6,	%o2,	%i0
	orncc	%l2,	0x0DE9,	%i5
	sethi	0x1650,	%i4
	array16	%g3,	%l1,	%o6
	movne	%xcc,	%g5,	%o4
	ld	[%l7 + 0x48],	%f5
	fmovd	%f10,	%f2
	lduh	[%l7 + 0x34],	%g4
	movl	%xcc,	%g2,	%l6
	edge32l	%o7,	%l4,	%g7
	mulx	%l3,	0x084D,	%o0
	ldub	[%l7 + 0x68],	%l0
	sll	%i3,	0x17,	%o5
	lduw	[%l7 + 0x20],	%l5
	smul	%i2,	0x1EB9,	%o3
	bshuffle	%f8,	%f12,	%f12
	fexpand	%f15,	%f6
	fandnot2s	%f10,	%f10,	%f5
	udivcc	%i1,	0x14B8,	%g1
	fmovd	%f2,	%f14
	udivx	%g6,	0x02CC,	%i7
	fmul8x16al	%f8,	%f15,	%f0
	movge	%icc,	%o1,	%o2
	alignaddr	%i6,	%l2,	%i0
	edge16ln	%i4,	%i5,	%l1
	edge16l	%g3,	%g5,	%o6
	lduw	[%l7 + 0x68],	%g4
	movn	%icc,	%g2,	%l6
	stw	%o4,	[%l7 + 0x54]
	fandnot2	%f12,	%f8,	%f6
	edge8n	%o7,	%g7,	%l4
	pdist	%f6,	%f0,	%f0
	movcc	%xcc,	%o0,	%l0
	xnorcc	%l3,	0x1C00,	%i3
	fsrc1	%f2,	%f14
	array16	%o5,	%i2,	%o3
	stw	%l5,	[%l7 + 0x78]
	fcmpgt32	%f10,	%f2,	%g1
	fmovsne	%xcc,	%f15,	%f6
	movvc	%icc,	%g6,	%i1
	edge8ln	%i7,	%o2,	%i6
	fmovse	%icc,	%f9,	%f9
	ldub	[%l7 + 0x0C],	%o1
	fmovrslz	%i0,	%f6,	%f15
	pdist	%f6,	%f12,	%f14
	ldub	[%l7 + 0x24],	%l2
	movne	%icc,	%i4,	%l1
	alignaddrl	%g3,	%g5,	%o6
	movneg	%icc,	%g4,	%i5
	sllx	%g2,	%o4,	%l6
	sub	%o7,	0x05F8,	%g7
	ldd	[%l7 + 0x50],	%o0
	stx	%l0,	[%l7 + 0x60]
	alignaddr	%l4,	%l3,	%i3
	movne	%icc,	%o5,	%o3
	fmul8ulx16	%f4,	%f4,	%f6
	edge8l	%l5,	%g1,	%i2
	addc	%i1,	0x0936,	%g6
	fcmple32	%f6,	%f4,	%o2
	udivx	%i6,	0x13B7,	%i7
	fsrc2	%f10,	%f4
	movne	%xcc,	%o1,	%l2
	fcmpgt32	%f10,	%f12,	%i0
	andncc	%l1,	%g3,	%g5
	fpmerge	%f10,	%f15,	%f2
	sethi	0x0C1F,	%o6
	xnorcc	%g4,	%i4,	%i5
	srl	%g2,	%o4,	%l6
	fmovrdgz	%o7,	%f12,	%f4
	umulcc	%g7,	0x1BC5,	%o0
	edge16n	%l0,	%l3,	%l4
	movgu	%icc,	%o5,	%o3
	save %i3, 0x08E8, %g1
	orn	%l5,	%i1,	%i2
	subcc	%g6,	0x1393,	%o2
	ld	[%l7 + 0x60],	%f4
	st	%f9,	[%l7 + 0x2C]
	andncc	%i7,	%o1,	%l2
	smulcc	%i6,	%i0,	%g3
	sethi	0x056E,	%g5
	fpsub32s	%f13,	%f14,	%f4
	stx	%l1,	[%l7 + 0x08]
	std	%f2,	[%l7 + 0x50]
	alignaddrl	%o6,	%i4,	%g4
	ldx	[%l7 + 0x18],	%g2
	fand	%f8,	%f12,	%f4
	ldd	[%l7 + 0x10],	%f4
	sub	%o4,	0x068F,	%l6
	movrlez	%o7,	%g7,	%o0
	edge8	%l0,	%l3,	%i5
	addc	%l4,	%o3,	%o5
	fmovrslez	%g1,	%f1,	%f11
	movcc	%icc,	%l5,	%i3
	sub	%i2,	0x13FA,	%i1
	array16	%g6,	%o2,	%i7
	edge16	%o1,	%l2,	%i0
	std	%f8,	[%l7 + 0x68]
	movge	%xcc,	%g3,	%g5
	fcmpgt16	%f14,	%f0,	%i6
	xorcc	%o6,	0x02A4,	%i4
	sub	%g4,	0x0700,	%l1
	mulscc	%o4,	0x1543,	%g2
	movcs	%icc,	%l6,	%g7
	save %o0, 0x0E1E, %o7
	stx	%l3,	[%l7 + 0x48]
	fmuld8ulx16	%f15,	%f6,	%f14
	array16	%i5,	%l4,	%l0
	movgu	%xcc,	%o3,	%o5
	mulx	%l5,	0x0C01,	%g1
	movne	%icc,	%i3,	%i1
	ldx	[%l7 + 0x40],	%g6
	movneg	%icc,	%o2,	%i7
	fpadd32s	%f15,	%f2,	%f11
	ldsh	[%l7 + 0x12],	%i2
	add	%l2,	0x0739,	%o1
	fxors	%f7,	%f3,	%f6
	fxors	%f4,	%f3,	%f4
	addcc	%i0,	%g5,	%g3
	udivcc	%i6,	0x08A6,	%i4
	fandnot1	%f4,	%f12,	%f8
	ldub	[%l7 + 0x0D],	%g4
	addc	%o6,	%o4,	%g2
	subccc	%l1,	%l6,	%o0
	sub	%o7,	%g7,	%i5
	array32	%l3,	%l4,	%l0
	bshuffle	%f12,	%f10,	%f0
	fandnot2s	%f10,	%f11,	%f1
	ldsh	[%l7 + 0x68],	%o5
	ldub	[%l7 + 0x60],	%l5
	ldx	[%l7 + 0x40],	%o3
	and	%g1,	0x01E8,	%i1
	sub	%g6,	0x0C39,	%i3
	movrgz	%i7,	0x07F,	%i2
	movpos	%icc,	%l2,	%o2
	movgu	%icc,	%i0,	%o1
	ldx	[%l7 + 0x38],	%g5
	movleu	%icc,	%g3,	%i6
	fpsub16s	%f15,	%f9,	%f1
	xor	%i4,	%g4,	%o6
	srl	%g2,	%o4,	%l6
	fpack16	%f4,	%f12
	fands	%f5,	%f4,	%f11
	movvs	%icc,	%l1,	%o0
	movg	%icc,	%o7,	%g7
	or	%i5,	0x1612,	%l3
	array32	%l4,	%o5,	%l0
	udivx	%l5,	0x007F,	%g1
	fsrc1	%f12,	%f10
	sethi	0x1A84,	%i1
	siam	0x0
	movl	%xcc,	%g6,	%i3
	ldsw	[%l7 + 0x30],	%o3
	subccc	%i7,	0x088F,	%i2
	sdivx	%o2,	0x15C1,	%l2
	sethi	0x0DEB,	%i0
	edge32l	%g5,	%g3,	%o1
	lduh	[%l7 + 0x4A],	%i6
	fcmpd	%fcc2,	%f4,	%f6
	or	%i4,	%o6,	%g2
	stx	%g4,	[%l7 + 0x58]
	lduw	[%l7 + 0x50],	%o4
	edge8	%l6,	%o0,	%o7
	edge32	%g7,	%l1,	%l3
	edge32	%i5,	%l4,	%o5
	udivcc	%l0,	0x115C,	%l5
	movrne	%g1,	0x153,	%i1
	std	%f14,	[%l7 + 0x10]
	ldd	[%l7 + 0x50],	%g6
	movrlz	%i3,	%o3,	%i2
	movvs	%icc,	%i7,	%o2
	movvc	%icc,	%l2,	%g5
	restore %g3, %o1, %i0
	umulcc	%i4,	%o6,	%g2
	add	%i6,	%o4,	%g4
	movn	%icc,	%o0,	%o7
	fmovdle	%xcc,	%f4,	%f11
	udivcc	%l6,	0x02E4,	%g7
	or	%l1,	%l3,	%l4
	stx	%i5,	[%l7 + 0x58]
	stx	%o5,	[%l7 + 0x10]
	addc	%l0,	%l5,	%g1
	and	%i1,	%g6,	%o3
	udivcc	%i2,	0x095C,	%i3
	umulcc	%o2,	0x1471,	%i7
	srax	%g5,	%l2,	%g3
	movleu	%xcc,	%o1,	%i0
	srax	%i4,	0x1B,	%o6
	udivx	%g2,	0x0E56,	%o4
	save %i6, 0x0294, %o0
	lduh	[%l7 + 0x1E],	%g4
	array8	%o7,	%l6,	%l1
	edge32l	%l3,	%g7,	%l4
	umul	%o5,	%l0,	%l5
	movneg	%xcc,	%i5,	%g1
	fmovdpos	%icc,	%f6,	%f10
	std	%f0,	[%l7 + 0x20]
	orn	%g6,	0x182F,	%i1
	fpack32	%f10,	%f14,	%f14
	fexpand	%f12,	%f8
	stb	%o3,	[%l7 + 0x4B]
	fmovsa	%icc,	%f14,	%f2
	ldx	[%l7 + 0x08],	%i2
	and	%i3,	0x03F6,	%i7
	edge16n	%o2,	%g5,	%g3
	addccc	%o1,	0x061F,	%i0
	ldsw	[%l7 + 0x78],	%i4
	array16	%l2,	%g2,	%o6
	fsrc1	%f14,	%f12
	stw	%i6,	[%l7 + 0x78]
	movre	%o0,	0x261,	%g4
	ldsw	[%l7 + 0x30],	%o7
	mulx	%l6,	%l1,	%o4
	xnor	%g7,	%l3,	%l4
	movneg	%icc,	%l0,	%l5
	fpadd32s	%f7,	%f9,	%f3
	orncc	%o5,	%g1,	%g6
	movgu	%xcc,	%i5,	%o3
	fmovdg	%icc,	%f8,	%f7
	sub	%i2,	0x0CE8,	%i1
	alignaddrl	%i7,	%i3,	%o2
	ldsb	[%l7 + 0x77],	%g3
	fmovrdlez	%o1,	%f10,	%f4
	fabss	%f12,	%f2
	ld	[%l7 + 0x4C],	%f15
	subc	%g5,	%i0,	%i4
	edge16l	%g2,	%l2,	%o6
	ldub	[%l7 + 0x1A],	%i6
	orncc	%g4,	%o0,	%l6
	addc	%l1,	0x04D0,	%o7
	fnot2s	%f12,	%f7
	movne	%xcc,	%g7,	%l3
	srlx	%o4,	%l4,	%l5
	edge32	%o5,	%g1,	%g6
	umulcc	%i5,	%l0,	%i2
	movg	%xcc,	%o3,	%i1
	movvs	%xcc,	%i7,	%o2
	fornot2	%f4,	%f14,	%f14
	edge8ln	%i3,	%g3,	%o1
	lduh	[%l7 + 0x36],	%g5
	fxnor	%f14,	%f0,	%f10
	array8	%i0,	%g2,	%i4
	stw	%o6,	[%l7 + 0x7C]
	udivcc	%l2,	0x15B0,	%g4
	edge16l	%o0,	%i6,	%l1
	fmovspos	%xcc,	%f3,	%f7
	fmovsleu	%xcc,	%f11,	%f9
	ldd	[%l7 + 0x40],	%f4
	fmovdcc	%icc,	%f12,	%f10
	mova	%xcc,	%l6,	%g7
	udivx	%o7,	0x1AA7,	%o4
	movvs	%icc,	%l4,	%l3
	movcs	%xcc,	%o5,	%g1
	fcmpgt32	%f6,	%f14,	%g6
	movl	%icc,	%l5,	%l0
	movpos	%xcc,	%i2,	%i5
	fcmpne16	%f6,	%f0,	%i1
	stb	%o3,	[%l7 + 0x56]
	edge8n	%i7,	%i3,	%o2
	pdist	%f4,	%f14,	%f2
	fmovsge	%icc,	%f14,	%f2
	xor	%o1,	%g5,	%i0
	save %g3, 0x1E26, %i4
	srlx	%o6,	0x1A,	%g2
	movleu	%icc,	%l2,	%o0
	udivcc	%g4,	0x1EF3,	%i6
	ldd	[%l7 + 0x60],	%f8
	movre	%l6,	0x0FE,	%l1
	fcmpgt16	%f10,	%f2,	%g7
	alignaddrl	%o7,	%l4,	%l3
	subccc	%o5,	%o4,	%g1
	orncc	%l5,	0x02D7,	%l0
	sdiv	%g6,	0x0C01,	%i5
	movvs	%xcc,	%i2,	%i1
	udivcc	%o3,	0x1F75,	%i3
	ldd	[%l7 + 0x78],	%f14
	stx	%o2,	[%l7 + 0x70]
	xor	%o1,	0x0336,	%g5
	fnot1s	%f12,	%f8
	ldsb	[%l7 + 0x46],	%i7
	or	%i0,	0x1008,	%i4
	stx	%g3,	[%l7 + 0x38]
	movleu	%xcc,	%g2,	%o6
	sth	%l2,	[%l7 + 0x18]
	edge16n	%g4,	%i6,	%o0
	srl	%l6,	0x01,	%g7
	movne	%icc,	%o7,	%l4
	subcc	%l3,	0x13DB,	%l1
	udivx	%o5,	0x0814,	%g1
	ldx	[%l7 + 0x40],	%o4
	xor	%l5,	0x1F2A,	%l0
	edge16l	%i5,	%i2,	%g6
	udiv	%i1,	0x04ED,	%o3
	lduh	[%l7 + 0x3C],	%o2
	fmul8x16au	%f9,	%f4,	%f6
	alignaddr	%o1,	%g5,	%i3
	fnot2s	%f4,	%f11
	fmovrde	%i7,	%f8,	%f8
	array32	%i0,	%i4,	%g2
	ldx	[%l7 + 0x58],	%o6
	srl	%l2,	%g3,	%g4
	fmul8x16al	%f5,	%f14,	%f12
	alignaddr	%i6,	%l6,	%g7
	ldsb	[%l7 + 0x64],	%o0
	edge32n	%l4,	%o7,	%l3
	stw	%l1,	[%l7 + 0x68]
	fmovde	%icc,	%f5,	%f3
	save %o5, %o4, %l5
	move	%icc,	%l0,	%g1
	edge8	%i2,	%g6,	%i1
	fmovsneg	%xcc,	%f13,	%f8
	fmovrsgez	%i5,	%f9,	%f5
	addccc	%o3,	%o2,	%o1
	subccc	%i3,	0x0037,	%i7
	subc	%g5,	%i0,	%i4
	sdivx	%o6,	0x0CCC,	%l2
	ldd	[%l7 + 0x08],	%f6
	movre	%g3,	%g2,	%i6
	edge8n	%g4,	%l6,	%g7
	fmovrsgez	%l4,	%f7,	%f11
	restore %o7, %o0, %l1
	movrne	%o5,	0x2B4,	%o4
	movrlez	%l3,	%l0,	%g1
	fxnor	%f10,	%f4,	%f12
	and	%i2,	%l5,	%i1
	sth	%i5,	[%l7 + 0x6C]
	fmovrsgz	%g6,	%f10,	%f3
	udivx	%o3,	0x0046,	%o1
	fmovsl	%xcc,	%f11,	%f5
	andn	%o2,	0x0CDB,	%i7
	fcmpes	%fcc1,	%f3,	%f8
	popc	%g5,	%i3
	sra	%i4,	%i0,	%l2
	fcmped	%fcc0,	%f14,	%f2
	sllx	%o6,	%g3,	%i6
	movvc	%xcc,	%g4,	%l6
	ldsw	[%l7 + 0x5C],	%g7
	movvc	%xcc,	%g2,	%o7
	movvc	%xcc,	%l4,	%o0
	fmovdgu	%xcc,	%f1,	%f5
	stw	%l1,	[%l7 + 0x44]
	edge8l	%o5,	%o4,	%l3
	fabss	%f13,	%f13
	stw	%l0,	[%l7 + 0x38]
	fmovsa	%xcc,	%f13,	%f12
	orcc	%i2,	%l5,	%g1
	srax	%i1,	0x0B,	%g6
	edge16n	%i5,	%o3,	%o2
	orn	%o1,	0x0CF9,	%i7
	mova	%xcc,	%i3,	%g5
	movre	%i4,	%l2,	%i0
	add	%o6,	%i6,	%g4
	edge8n	%g3,	%l6,	%g2
	ld	[%l7 + 0x1C],	%f9
	movg	%xcc,	%g7,	%l4
	xnorcc	%o0,	%o7,	%o5
	movpos	%icc,	%l1,	%o4
	array8	%l0,	%i2,	%l5
	pdist	%f2,	%f12,	%f12
	sdiv	%l3,	0x15A4,	%g1
	move	%xcc,	%g6,	%i5
	movl	%icc,	%o3,	%i1
	fmovse	%xcc,	%f5,	%f12
	edge16n	%o1,	%i7,	%i3
	movrne	%g5,	%i4,	%o2
	movvs	%xcc,	%l2,	%o6
	st	%f10,	[%l7 + 0x20]
	fabss	%f4,	%f0
	st	%f10,	[%l7 + 0x58]
	sdiv	%i0,	0x12DE,	%i6
	movneg	%icc,	%g3,	%g4
	movvs	%icc,	%g2,	%l6
	movcs	%icc,	%l4,	%g7
	siam	0x6
	srax	%o0,	0x16,	%o5
	udivx	%l1,	0x074C,	%o7
	fpsub16	%f6,	%f2,	%f10
	movneg	%xcc,	%o4,	%l0
	fnand	%f8,	%f2,	%f6
	movrgz	%l5,	%i2,	%l3
	array16	%g1,	%g6,	%i5
	popc	%i1,	%o3
	lduh	[%l7 + 0x58],	%o1
	umul	%i7,	0x0C07,	%i3
	fmovrdne	%i4,	%f0,	%f8
	popc	0x0ECC,	%g5
	edge8	%l2,	%o6,	%o2
	mulx	%i6,	0x1D78,	%i0
	andncc	%g4,	%g3,	%g2
	addcc	%l4,	0x0CFE,	%g7
	fmul8x16au	%f5,	%f12,	%f0
	fpsub32s	%f5,	%f4,	%f9
	udivcc	%o0,	0x198B,	%o5
	fcmpeq32	%f10,	%f10,	%l6
	sll	%o7,	0x0D,	%o4
	ldsh	[%l7 + 0x20],	%l1
	andn	%l5,	%i2,	%l3
	sethi	0x1ACF,	%g1
	st	%f9,	[%l7 + 0x68]
	or	%g6,	0x1250,	%l0
	fpack32	%f14,	%f8,	%f12
	ldsb	[%l7 + 0x4F],	%i1
	xnor	%i5,	0x0024,	%o1
	alignaddr	%i7,	%i3,	%i4
	fmovrdgz	%g5,	%f8,	%f14
	or	%o3,	0x1A52,	%l2
	ldsb	[%l7 + 0x0C],	%o2
	movrne	%o6,	0x29D,	%i6
	ldsw	[%l7 + 0x54],	%i0
	subccc	%g4,	0x0883,	%g3
	sdivx	%l4,	0x0324,	%g2
	fpadd32	%f2,	%f4,	%f4
	ldsb	[%l7 + 0x3E],	%g7
	edge16n	%o0,	%l6,	%o5
	ldd	[%l7 + 0x48],	%o6
	movg	%icc,	%l1,	%l5
	edge32n	%o4,	%i2,	%l3
	movrne	%g6,	0x2DD,	%g1
	edge16n	%l0,	%i5,	%i1
	fornot1s	%f13,	%f2,	%f9
	movle	%xcc,	%o1,	%i7
	mulx	%i4,	0x0E84,	%g5
	edge16ln	%o3,	%i3,	%l2
	mulx	%o2,	0x0383,	%i6
	edge16n	%o6,	%g4,	%g3
	movvs	%icc,	%l4,	%g2
	ldub	[%l7 + 0x2C],	%g7
	sllx	%i0,	0x07,	%o0
	fones	%f1
	orncc	%l6,	0x0ACD,	%o5
	fmuld8sux16	%f10,	%f3,	%f8
	fandnot2s	%f4,	%f1,	%f11
	fmovrdgez	%l1,	%f12,	%f0
	movgu	%xcc,	%o7,	%l5
	ldub	[%l7 + 0x1F],	%i2
	movcc	%xcc,	%l3,	%o4
	udivcc	%g1,	0x0EA2,	%l0
	xnorcc	%g6,	0x187C,	%i5
	lduw	[%l7 + 0x30],	%i1
	ld	[%l7 + 0x58],	%f11
	fmovrslez	%o1,	%f3,	%f10
	sdivcc	%i7,	0x0FCF,	%g5
	srlx	%o3,	0x1B,	%i3
	edge32n	%i4,	%o2,	%l2
	fpsub16	%f2,	%f0,	%f14
	fmovrsgez	%o6,	%f10,	%f10
	sdiv	%g4,	0x046E,	%g3
	addcc	%l4,	%i6,	%g7
	lduh	[%l7 + 0x5A],	%i0
	subccc	%g2,	0x00EF,	%l6
	movrne	%o0,	%o5,	%o7
	edge32n	%l5,	%i2,	%l1
	edge8l	%l3,	%o4,	%g1
	edge16l	%l0,	%g6,	%i5
	edge16ln	%o1,	%i7,	%i1
	fcmpeq16	%f2,	%f2,	%o3
	edge8n	%i3,	%i4,	%g5
	addc	%o2,	%l2,	%g4
	sethi	0x08D6,	%g3
	srlx	%l4,	%i6,	%g7
	movvs	%xcc,	%o6,	%i0
	udivcc	%l6,	0x03EE,	%g2
	edge16ln	%o0,	%o5,	%l5
	movrne	%i2,	0x30E,	%o7
	fand	%f4,	%f10,	%f14
	fmovrdlez	%l3,	%f0,	%f6
	smulcc	%o4,	0x08A3,	%l1
	xor	%l0,	0x0020,	%g6
	mova	%icc,	%g1,	%o1
	fmul8ulx16	%f2,	%f12,	%f8
	movrlz	%i7,	0x2AE,	%i1
	orn	%i5,	0x0E8C,	%i3
	andncc	%i4,	%o3,	%o2
	fmovdn	%icc,	%f1,	%f11
	sub	%g5,	%l2,	%g4
	movle	%xcc,	%g3,	%l4
	fandnot2	%f12,	%f12,	%f4
	movrne	%i6,	%o6,	%g7
	ldsw	[%l7 + 0x48],	%i0
	mulx	%l6,	%g2,	%o5
	ldx	[%l7 + 0x40],	%l5
	orn	%o0,	0x060F,	%i2
	popc	0x1961,	%l3
	xnor	%o7,	%l1,	%l0
	stw	%g6,	[%l7 + 0x0C]
	stx	%o4,	[%l7 + 0x38]
	movrgz	%o1,	%i7,	%i1
	stx	%g1,	[%l7 + 0x18]
	movleu	%xcc,	%i5,	%i3
	array32	%i4,	%o2,	%o3
	fsrc2	%f12,	%f14
	restore %l2, 0x14B1, %g4
	popc	%g5,	%l4
	move	%icc,	%g3,	%i6
	sdivcc	%g7,	0x127B,	%o6
	xorcc	%i0,	0x038E,	%l6
	movl	%icc,	%o5,	%g2
	movpos	%icc,	%o0,	%l5
	srl	%i2,	%l3,	%l1
	fnot2	%f4,	%f0
	movneg	%xcc,	%o7,	%l0
	fcmpne32	%f0,	%f0,	%g6
	edge32l	%o4,	%i7,	%i1
	edge16l	%g1,	%i5,	%o1
	orncc	%i3,	0x1EE7,	%i4
	smulcc	%o3,	0x1461,	%o2
	movrlz	%l2,	%g5,	%g4
	and	%l4,	%i6,	%g7
	fzero	%f2
	umulcc	%g3,	0x1DAE,	%i0
	fmovrsgz	%l6,	%f5,	%f0
	array32	%o6,	%g2,	%o5
	andcc	%l5,	%o0,	%i2
	fmovsne	%icc,	%f10,	%f8
	fabss	%f8,	%f3
	edge16ln	%l1,	%o7,	%l3
	fmovrse	%g6,	%f3,	%f3
	fnands	%f9,	%f2,	%f15
	xnorcc	%l0,	0x0FE3,	%i7
	sllx	%i1,	%g1,	%i5
	and	%o1,	%o4,	%i3
	fandnot2s	%f15,	%f11,	%f13
	ldd	[%l7 + 0x68],	%i4
	sra	%o2,	0x0F,	%l2
	ldd	[%l7 + 0x08],	%o2
	fpsub16s	%f6,	%f2,	%f8
	sdivcc	%g4,	0x1963,	%l4
	fpadd16s	%f2,	%f9,	%f8
	stw	%g5,	[%l7 + 0x18]
	fmovda	%xcc,	%f9,	%f11
	smulcc	%g7,	%g3,	%i6
	fmovdcs	%icc,	%f0,	%f11
	andcc	%i0,	%l6,	%g2
	ldx	[%l7 + 0x68],	%o5
	subccc	%l5,	0x01E5,	%o0
	faligndata	%f12,	%f10,	%f12
	fsrc2s	%f14,	%f4
	movrlz	%i2,	%l1,	%o7
	edge16n	%l3,	%g6,	%o6
	stx	%l0,	[%l7 + 0x10]
	movne	%icc,	%i7,	%i1
	movre	%i5,	0x170,	%g1
	mova	%xcc,	%o1,	%i3
	edge32l	%i4,	%o4,	%o2
	or	%l2,	0x134B,	%o3
	ldsw	[%l7 + 0x54],	%l4
	fexpand	%f3,	%f10
	ldd	[%l7 + 0x40],	%g4
	fand	%f0,	%f8,	%f0
	xorcc	%g5,	%g7,	%i6
	umulcc	%i0,	%g3,	%l6
	popc	%o5,	%l5
	array32	%g2,	%o0,	%l1
	movle	%xcc,	%o7,	%l3
	movre	%i2,	0x063,	%o6
	fmovda	%icc,	%f4,	%f7
	fsrc1	%f0,	%f10
	sub	%g6,	0x1707,	%l0
	udivcc	%i7,	0x1914,	%i1
	fmovrsgez	%i5,	%f6,	%f13
	andncc	%g1,	%o1,	%i3
	stw	%i4,	[%l7 + 0x20]
	smul	%o4,	0x1E88,	%o2
	subc	%l2,	%o3,	%g4
	fmovdl	%xcc,	%f8,	%f13
	movg	%icc,	%g5,	%l4
	array16	%g7,	%i0,	%i6
	sth	%g3,	[%l7 + 0x76]
	fmovsa	%icc,	%f15,	%f4
	fandnot1	%f4,	%f10,	%f10
	fmovscs	%icc,	%f11,	%f6
	lduw	[%l7 + 0x74],	%o5
	movpos	%icc,	%l6,	%l5
	udivcc	%g2,	0x17B7,	%o0
	mulx	%o7,	%l3,	%l1
	movpos	%icc,	%i2,	%g6
	movl	%xcc,	%l0,	%o6
	fors	%f0,	%f1,	%f13
	or	%i1,	0x170A,	%i5
	edge16l	%g1,	%i7,	%i3
	fmovrsne	%o1,	%f5,	%f4
	edge16n	%o4,	%i4,	%o2
	fpadd16s	%f10,	%f10,	%f3
	fmovdpos	%xcc,	%f14,	%f4
	movge	%xcc,	%o3,	%g4
	ld	[%l7 + 0x28],	%f0
	udivx	%l2,	0x1A71,	%g5
	srl	%l4,	%g7,	%i6
	xor	%i0,	%g3,	%l6
	movn	%icc,	%l5,	%o5
	fmovdvc	%xcc,	%f7,	%f6
	alignaddrl	%g2,	%o0,	%o7
	edge32ln	%l3,	%l1,	%g6
	fmovrdlez	%l0,	%f14,	%f2
	orncc	%o6,	%i2,	%i1
	movvc	%icc,	%i5,	%i7
	subc	%i3,	0x0BED,	%o1
	or	%o4,	0x1DC6,	%g1
	fmuld8ulx16	%f1,	%f15,	%f4
	andcc	%i4,	%o2,	%o3
	sll	%g4,	%l2,	%g5
	add	%l4,	0x1E20,	%g7
	restore %i6, %g3, %i0
	fsrc1s	%f13,	%f12
	addccc	%l6,	0x027F,	%l5
	subcc	%g2,	%o0,	%o7
	smul	%o5,	0x1774,	%l1
	array8	%g6,	%l0,	%o6
	fmovdvs	%icc,	%f7,	%f0
	ldsw	[%l7 + 0x44],	%l3
	subc	%i1,	0x1E3D,	%i5
	and	%i2,	%i7,	%o1
	movge	%icc,	%o4,	%i3
	fpack16	%f10,	%f5
	movre	%i4,	0x1D6,	%g1
	move	%icc,	%o3,	%o2
	movcc	%icc,	%g4,	%l2
	mova	%xcc,	%l4,	%g5
	smul	%g7,	%g3,	%i0
	and	%l6,	%i6,	%l5
	umulcc	%o0,	0x01D7,	%o7
	addcc	%o5,	0x09AB,	%g2
	fmuld8sux16	%f2,	%f0,	%f6
	fcmple16	%f10,	%f2,	%l1
	umulcc	%l0,	%o6,	%l3
	movl	%icc,	%g6,	%i1
	fcmple16	%f10,	%f14,	%i2
	fmovdleu	%icc,	%f7,	%f12
	fmuld8ulx16	%f11,	%f6,	%f0
	movrlz	%i7,	0x197,	%i5
	orncc	%o1,	%i3,	%o4
	addcc	%i4,	%o3,	%g1
	sth	%g4,	[%l7 + 0x4A]
	umul	%o2,	%l4,	%g5
	sdiv	%g7,	0x03D5,	%l2
	ldsb	[%l7 + 0x27],	%i0
	umulcc	%g3,	%l6,	%l5
	ldx	[%l7 + 0x68],	%o0
	fmovsge	%icc,	%f7,	%f11
	fpsub16	%f2,	%f4,	%f6
	movgu	%icc,	%i6,	%o5
	fmovsne	%icc,	%f4,	%f0
	fxor	%f2,	%f4,	%f6
	movpos	%icc,	%o7,	%g2
	popc	0x04F8,	%l1
	sethi	0x12E5,	%o6
	movn	%xcc,	%l0,	%g6
	popc	0x0B22,	%l3
	edge32ln	%i2,	%i7,	%i5
	sub	%i1,	%i3,	%o1
	sll	%i4,	%o4,	%o3
	lduh	[%l7 + 0x1A],	%g4
	subccc	%o2,	%g1,	%l4
	edge16l	%g7,	%l2,	%i0
	stx	%g3,	[%l7 + 0x10]
	fmovsgu	%icc,	%f15,	%f6
	xnor	%g5,	%l6,	%o0
	andcc	%i6,	%l5,	%o7
	umulcc	%g2,	%o5,	%o6
	edge32ln	%l0,	%l1,	%g6
	movrlez	%l3,	%i2,	%i5
	fones	%f1
	movrgez	%i1,	0x1FD,	%i3
	subccc	%i7,	%o1,	%o4
	array32	%o3,	%g4,	%i4
	srax	%o2,	0x14,	%g1
	ldx	[%l7 + 0x10],	%g7
	sth	%l4,	[%l7 + 0x14]
	movn	%icc,	%l2,	%g3
	stb	%i0,	[%l7 + 0x39]
	movl	%icc,	%l6,	%g5
	move	%icc,	%i6,	%o0
	ld	[%l7 + 0x20],	%f6
	xorcc	%l5,	0x0D15,	%g2
	addcc	%o5,	%o6,	%l0
	edge8l	%l1,	%g6,	%l3
	save %i2, 0x15A0, %i5
	orcc	%o7,	%i3,	%i7
	edge16	%i1,	%o4,	%o3
	orncc	%g4,	%i4,	%o2
	sdivx	%o1,	0x1412,	%g7
	edge32ln	%g1,	%l2,	%g3
	movvs	%xcc,	%l4,	%l6
	andncc	%g5,	%i0,	%o0
	or	%i6,	0x00AB,	%g2
	addcc	%l5,	%o6,	%l0
	ldx	[%l7 + 0x40],	%o5
	fmovsne	%icc,	%f7,	%f9
	edge16ln	%g6,	%l3,	%i2
	udiv	%i5,	0x186F,	%o7
	edge32	%i3,	%i7,	%l1
	fmovsne	%icc,	%f6,	%f13
	movgu	%icc,	%o4,	%o3
	sethi	0x1331,	%g4
	fpsub32s	%f6,	%f0,	%f8
	movneg	%icc,	%i1,	%i4
	fmovdn	%icc,	%f3,	%f9
	fxor	%f10,	%f10,	%f12
	smulcc	%o1,	%o2,	%g1
	ldsh	[%l7 + 0x70],	%l2
	srax	%g7,	0x09,	%g3
	bshuffle	%f8,	%f12,	%f14
	srlx	%l4,	%l6,	%i0
	smulcc	%g5,	0x1066,	%o0
	alignaddr	%i6,	%g2,	%l5
	fmovsvc	%icc,	%f4,	%f12
	restore %l0, 0x0A24, %o5
	fandnot2	%f6,	%f4,	%f6
	edge8n	%g6,	%l3,	%o6
	movre	%i5,	%o7,	%i3
	movcs	%xcc,	%i2,	%i7
	subcc	%l1,	0x0E76,	%o4
	movrgz	%g4,	%o3,	%i1
	xorcc	%i4,	0x027F,	%o2
	addccc	%o1,	0x1EA5,	%l2
	edge8l	%g1,	%g7,	%g3
	ld	[%l7 + 0x6C],	%f5
	edge16	%l4,	%i0,	%l6
	edge8n	%g5,	%i6,	%o0
	edge32	%g2,	%l0,	%l5
	orn	%o5,	%g6,	%o6
	xorcc	%l3,	0x1284,	%o7
	mova	%icc,	%i3,	%i5
	edge32l	%i2,	%i7,	%o4
	andncc	%g4,	%l1,	%i1
	movge	%icc,	%o3,	%i4
	movrlez	%o2,	0x39B,	%l2
	ldsh	[%l7 + 0x12],	%g1
	xorcc	%o1,	%g3,	%g7
	srax	%i0,	%l4,	%l6
	stw	%g5,	[%l7 + 0x58]
	stw	%i6,	[%l7 + 0x60]
	sdivcc	%o0,	0x1563,	%l0
	fnot2s	%f0,	%f6
	movge	%icc,	%l5,	%g2
	udivx	%o5,	0x195E,	%g6
	ldd	[%l7 + 0x48],	%l2
	smulcc	%o7,	0x0728,	%o6
	array16	%i3,	%i5,	%i7
	movle	%xcc,	%o4,	%i2
	umul	%l1,	0x0221,	%i1
	move	%xcc,	%g4,	%o3
	movrgez	%i4,	%l2,	%o2
	fpadd16s	%f7,	%f10,	%f13
	andncc	%o1,	%g3,	%g1
	udiv	%i0,	0x0613,	%l4
	stb	%l6,	[%l7 + 0x0D]
	array32	%g5,	%i6,	%g7
	andcc	%l0,	%o0,	%g2
	ldd	[%l7 + 0x78],	%o4
	edge8l	%g6,	%l3,	%o7
	edge8l	%o6,	%i3,	%i5
	array32	%i7,	%o4,	%l5
	addc	%i2,	%i1,	%l1
	stw	%o3,	[%l7 + 0x5C]
	smulcc	%i4,	%g4,	%l2
	movne	%xcc,	%o1,	%g3
	fmovsleu	%icc,	%f2,	%f4
	sll	%g1,	0x1A,	%o2
	movgu	%icc,	%l4,	%i0
	edge16	%l6,	%i6,	%g5
	fmovscc	%xcc,	%f9,	%f0
	lduw	[%l7 + 0x4C],	%l0
	fmovdge	%icc,	%f13,	%f10
	andn	%g7,	0x0C0A,	%g2
	orncc	%o5,	0x1D21,	%o0
	udiv	%g6,	0x1B93,	%l3
	movrne	%o6,	%i3,	%i5
	orncc	%i7,	0x0F29,	%o7
	ldsh	[%l7 + 0x6C],	%o4
	ldsh	[%l7 + 0x42],	%i2
	xnorcc	%l5,	%l1,	%o3
	ldsb	[%l7 + 0x13],	%i4
	addcc	%g4,	0x19BF,	%i1
	fmovrsne	%o1,	%f2,	%f1
	movleu	%icc,	%g3,	%l2
	save %o2, 0x08DD, %l4
	fandnot2	%f0,	%f10,	%f4
	fcmpgt16	%f6,	%f14,	%g1
	movcc	%xcc,	%i0,	%l6
	save %i6, %g5, %l0
	lduw	[%l7 + 0x30],	%g7
	orcc	%o5,	%g2,	%g6
	fmovsle	%xcc,	%f15,	%f1
	fcmped	%fcc1,	%f4,	%f14
	orcc	%o0,	%o6,	%l3
	subccc	%i5,	0x016C,	%i3
	sll	%i7,	%o4,	%o7
	xorcc	%i2,	0x1FBF,	%l1
	array16	%o3,	%i4,	%l5
	fnands	%f13,	%f2,	%f7
	xor	%i1,	%g4,	%o1
	restore %g3, %o2, %l2
	smul	%g1,	%i0,	%l4
	umul	%i6,	%l6,	%g5
	popc	%g7,	%o5
	smul	%l0,	%g6,	%g2
	srl	%o0,	%l3,	%o6
	stw	%i3,	[%l7 + 0x18]
	sub	%i5,	0x1B30,	%i7
	addccc	%o7,	0x0076,	%i2
	mulscc	%o4,	0x16A3,	%o3
	andcc	%l1,	0x1A69,	%i4
	fmovsleu	%xcc,	%f3,	%f2
	fmovsl	%icc,	%f5,	%f8
	movrlez	%i1,	0x237,	%g4
	sllx	%l5,	0x09,	%g3
	fcmpes	%fcc2,	%f3,	%f12
	sub	%o1,	%l2,	%o2
	movrgz	%i0,	0x3D8,	%l4
	ld	[%l7 + 0x1C],	%f7
	edge32	%i6,	%l6,	%g1
	xorcc	%g7,	%g5,	%l0
	fmovsn	%xcc,	%f15,	%f15
	sth	%g6,	[%l7 + 0x50]
	srax	%g2,	0x13,	%o5
	movl	%icc,	%o0,	%o6
	edge16n	%l3,	%i3,	%i5
	fpadd32s	%f9,	%f9,	%f4
	fnors	%f12,	%f9,	%f13
	movvs	%xcc,	%o7,	%i7
	movgu	%xcc,	%i2,	%o3
	movrlez	%l1,	0x36E,	%o4
	movvs	%icc,	%i1,	%g4
	fcmps	%fcc1,	%f10,	%f11
	addcc	%l5,	%g3,	%o1
	srax	%i4,	%o2,	%l2
	fsrc1	%f10,	%f12
	alignaddrl	%i0,	%i6,	%l4
	lduw	[%l7 + 0x5C],	%g1
	std	%f10,	[%l7 + 0x68]
	add	%l6,	0x0608,	%g5
	edge8l	%l0,	%g7,	%g6
	xnorcc	%g2,	0x1B32,	%o5
	smulcc	%o0,	0x066E,	%o6
	mulscc	%l3,	%i5,	%o7
	edge16l	%i3,	%i2,	%i7
	lduh	[%l7 + 0x30],	%o3
	array8	%l1,	%i1,	%g4
	fmovde	%xcc,	%f2,	%f8
	fcmpne32	%f10,	%f4,	%l5
	sdivcc	%o4,	0x0178,	%o1
	mulscc	%g3,	0x1CFB,	%o2
	umulcc	%l2,	%i4,	%i6
	srl	%i0,	%l4,	%l6
	ld	[%l7 + 0x20],	%f14
	srax	%g1,	0x0D,	%l0
	fmovsgu	%xcc,	%f15,	%f13
	xnor	%g7,	%g5,	%g6
	fnands	%f14,	%f5,	%f4
	sll	%g2,	%o5,	%o0
	fmuld8sux16	%f14,	%f0,	%f4
	fabsd	%f0,	%f0
	edge8	%l3,	%i5,	%o6
	movl	%xcc,	%i3,	%o7
	movl	%xcc,	%i2,	%o3
	addccc	%i7,	0x1668,	%i1
	array16	%l1,	%l5,	%o4
	fpack16	%f2,	%f5
	fmovsge	%xcc,	%f9,	%f0
	fnot2s	%f0,	%f7
	ldd	[%l7 + 0x70],	%f6
	ldub	[%l7 + 0x63],	%g4
	fcmpd	%fcc0,	%f0,	%f10
	fsrc1	%f14,	%f14
	stw	%g3,	[%l7 + 0x1C]
	ldd	[%l7 + 0x08],	%o0
	srl	%l2,	0x0B,	%o2
	srl	%i4,	0x0F,	%i6
	orncc	%i0,	0x020D,	%l4
	srl	%l6,	%g1,	%l0
	fmovsvc	%xcc,	%f11,	%f10
	fmovdl	%xcc,	%f2,	%f1
	bshuffle	%f12,	%f10,	%f8
	ldx	[%l7 + 0x18],	%g7
	edge8n	%g5,	%g6,	%o5
	alignaddr	%g2,	%l3,	%i5
	xnorcc	%o6,	%o0,	%i3
	movneg	%xcc,	%i2,	%o7
	umul	%i7,	0x083C,	%o3
	movge	%icc,	%l1,	%l5
	fpmerge	%f13,	%f9,	%f8
	orn	%i1,	%o4,	%g4
	edge16l	%g3,	%l2,	%o2
	movpos	%xcc,	%o1,	%i6
	sdivcc	%i4,	0x102C,	%l4
	udiv	%i0,	0x1C89,	%g1
	ldx	[%l7 + 0x40],	%l0
	udivx	%g7,	0x12CF,	%l6
	edge16	%g6,	%o5,	%g2
	umul	%l3,	%g5,	%o6
	st	%f12,	[%l7 + 0x28]
	fmovsg	%icc,	%f14,	%f12
	lduw	[%l7 + 0x44],	%i5
	fandnot1	%f4,	%f12,	%f10
	ldsb	[%l7 + 0x16],	%o0
	edge8	%i3,	%i2,	%i7
	mulscc	%o3,	%o7,	%l1
	restore %i1, 0x16E7, %o4
	fmovsgu	%icc,	%f6,	%f7
	ldsh	[%l7 + 0x24],	%l5
	move	%icc,	%g3,	%g4
	addc	%l2,	%o2,	%i6
	smul	%o1,	%l4,	%i0
	movgu	%icc,	%g1,	%l0
	ldd	[%l7 + 0x50],	%f6
	smulcc	%i4,	0x013F,	%g7
	or	%g6,	%o5,	%l6
	edge8ln	%g2,	%l3,	%g5
	fxnors	%f10,	%f3,	%f14
	addc	%o6,	0x0A86,	%i5
	array16	%o0,	%i2,	%i3
	stx	%i7,	[%l7 + 0x58]
	fmovsge	%icc,	%f7,	%f0
	fmovs	%f15,	%f14
	movrgz	%o7,	%o3,	%l1
	xnor	%i1,	%l5,	%o4
	movl	%icc,	%g3,	%l2
	lduh	[%l7 + 0x1E],	%o2
	alignaddrl	%i6,	%g4,	%l4
	movne	%xcc,	%o1,	%i0
	udiv	%l0,	0x1218,	%i4
	edge8l	%g7,	%g1,	%o5
	fmovdl	%icc,	%f13,	%f9
	movcs	%xcc,	%l6,	%g6
	edge16l	%l3,	%g2,	%o6
	restore %i5, %g5, %o0
	fcmpne32	%f0,	%f4,	%i2
	smul	%i3,	%i7,	%o7
	movcs	%icc,	%o3,	%i1
	sll	%l1,	0x0F,	%o4
	movneg	%icc,	%l5,	%g3
	ldsb	[%l7 + 0x4E],	%o2
	udivcc	%i6,	0x1915,	%g4
	fcmple32	%f8,	%f12,	%l2
	smul	%o1,	0x197E,	%l4
	stx	%l0,	[%l7 + 0x40]
	fmovdneg	%xcc,	%f11,	%f10
	fzeros	%f11
	addc	%i0,	%g7,	%g1
	fmovsa	%icc,	%f1,	%f15
	xnorcc	%o5,	0x0B60,	%i4
	movge	%icc,	%g6,	%l3
	edge16l	%g2,	%l6,	%i5
	fnands	%f11,	%f13,	%f14
	fmovdge	%xcc,	%f6,	%f7
	ld	[%l7 + 0x60],	%f7
	restore %g5, %o0, %o6
	xnorcc	%i2,	0x0D04,	%i3
	movrlez	%o7,	%o3,	%i7
	edge8n	%i1,	%o4,	%l5
	sdivx	%l1,	0x1908,	%g3
	sllx	%o2,	0x18,	%i6
	orn	%l2,	0x102B,	%g4
	edge32l	%l4,	%l0,	%i0
	fsrc2	%f12,	%f10
	fmovsgu	%xcc,	%f12,	%f14
	sllx	%o1,	0x18,	%g7
	fmul8x16	%f11,	%f14,	%f0
	movvc	%xcc,	%g1,	%i4
	movvc	%xcc,	%g6,	%o5
	fmovdne	%xcc,	%f7,	%f3
	fcmple16	%f4,	%f8,	%l3
	popc	0x104A,	%l6
	add	%i5,	%g2,	%g5
	and	%o6,	0x009A,	%o0
	ldsw	[%l7 + 0x08],	%i2
	orn	%i3,	0x1C28,	%o7
	fmovdne	%icc,	%f1,	%f9
	alignaddrl	%o3,	%i1,	%i7
	ld	[%l7 + 0x1C],	%f14
	fcmpne16	%f12,	%f12,	%l5
	sra	%l1,	0x1B,	%o4
	movvc	%icc,	%o2,	%g3
	subccc	%l2,	0x04D7,	%i6
	sdivcc	%l4,	0x1D56,	%g4
	std	%f6,	[%l7 + 0x40]
	fands	%f6,	%f12,	%f1
	popc	0x1622,	%i0
	edge32n	%o1,	%l0,	%g7
	or	%i4,	0x1D82,	%g6
	mova	%icc,	%g1,	%o5
	fmovdl	%xcc,	%f0,	%f1
	fcmpgt16	%f14,	%f12,	%l3
	fpackfix	%f10,	%f1
	fmovdvs	%xcc,	%f3,	%f12
	fexpand	%f14,	%f10
	movge	%icc,	%l6,	%g2
	fmovrdlez	%i5,	%f8,	%f4
	umul	%o6,	0x1759,	%g5
	fcmpgt16	%f0,	%f6,	%i2
	movn	%icc,	%o0,	%i3
	movre	%o3,	%i1,	%o7
	smul	%i7,	%l1,	%l5
	sra	%o4,	%g3,	%o2
	subc	%i6,	%l2,	%l4
	mulscc	%g4,	0x0313,	%i0
	fand	%f0,	%f0,	%f0
	movrgz	%o1,	%g7,	%l0
	udivx	%i4,	0x0850,	%g1
	array32	%g6,	%o5,	%l3
	sdiv	%g2,	0x167D,	%l6
	xnor	%i5,	%g5,	%o6
	fmovrdgz	%o0,	%f12,	%f8
	array8	%i3,	%i2,	%i1
	addcc	%o3,	%o7,	%i7
	srlx	%l5,	0x08,	%l1
	edge32n	%o4,	%g3,	%i6
	movrne	%l2,	0x1AF,	%l4
	lduh	[%l7 + 0x72],	%g4
	movle	%icc,	%o2,	%o1
	sethi	0x1795,	%g7
	fandnot2	%f2,	%f6,	%f6
	sdivx	%l0,	0x1C9D,	%i0
	fmovdvc	%xcc,	%f14,	%f12
	edge16	%i4,	%g6,	%o5
	fexpand	%f13,	%f4
	fandnot1s	%f11,	%f14,	%f10
	fpadd32s	%f5,	%f2,	%f13
	fmovsvs	%xcc,	%f7,	%f8
	fmul8ulx16	%f10,	%f12,	%f6
	addccc	%g1,	%l3,	%l6
	srlx	%i5,	0x19,	%g2
	xnor	%o6,	%g5,	%o0
	stb	%i3,	[%l7 + 0x47]
	sllx	%i1,	0x1E,	%i2
	udivx	%o7,	0x173C,	%i7
	ldd	[%l7 + 0x60],	%l4
	orncc	%l1,	0x0730,	%o3
	fcmpgt16	%f6,	%f8,	%o4
	fmovs	%f6,	%f7
	fmovdpos	%xcc,	%f12,	%f4
	sdivx	%g3,	0x1AE7,	%l2
	xor	%l4,	%g4,	%o2
	movrlez	%o1,	0x24F,	%i6
	srax	%l0,	%g7,	%i4
	srl	%i0,	0x04,	%g6
	movle	%xcc,	%o5,	%g1
	lduw	[%l7 + 0x78],	%l6
	addcc	%i5,	0x07FD,	%g2
	add	%l3,	0x1247,	%o6
	fcmpgt32	%f8,	%f14,	%o0
	addc	%g5,	%i3,	%i2
	and	%o7,	%i7,	%i1
	ldd	[%l7 + 0x40],	%l0
	sll	%l5,	%o3,	%g3
	fmovdn	%xcc,	%f14,	%f11
	fmovrdgez	%l2,	%f8,	%f8
	stw	%o4,	[%l7 + 0x78]
	fmul8x16	%f1,	%f10,	%f8
	fmovdge	%xcc,	%f13,	%f14
	lduw	[%l7 + 0x54],	%l4
	fmovrse	%g4,	%f7,	%f15
	ldd	[%l7 + 0x60],	%o0
	move	%xcc,	%i6,	%o2
	orn	%g7,	%l0,	%i0
	movrlz	%g6,	%o5,	%g1
	popc	%l6,	%i4
	edge32l	%g2,	%l3,	%o6
	move	%icc,	%i5,	%g5
	array16	%i3,	%i2,	%o7
	addcc	%o0,	0x14F5,	%i1
	fmovrdlz	%i7,	%f0,	%f6
	fmovsle	%icc,	%f1,	%f5
	movrlez	%l5,	0x349,	%l1
	ldsw	[%l7 + 0x10],	%o3
	umul	%g3,	0x17B5,	%l2
	fmovde	%xcc,	%f10,	%f9
	and	%l4,	%g4,	%o4
	movgu	%xcc,	%i6,	%o2
	std	%f0,	[%l7 + 0x78]
	array16	%o1,	%g7,	%i0
	stw	%g6,	[%l7 + 0x14]
	add	%l0,	0x122E,	%o5
	sub	%l6,	0x1438,	%i4
	movge	%icc,	%g1,	%g2
	sdiv	%l3,	0x03BA,	%o6
	movvs	%icc,	%i5,	%g5
	movcs	%icc,	%i2,	%i3
	orcc	%o7,	%i1,	%o0
	ldsb	[%l7 + 0x42],	%l5
	st	%f15,	[%l7 + 0x34]
	fmovrde	%l1,	%f8,	%f6
	sra	%o3,	%i7,	%l2
	sll	%g3,	%l4,	%g4
	movrlz	%o4,	%o2,	%o1
	mulx	%i6,	0x014F,	%g7
	sub	%g6,	0x0563,	%i0
	ldsw	[%l7 + 0x28],	%o5
	smul	%l6,	0x0107,	%i4
	ldx	[%l7 + 0x40],	%g1
	edge16	%l0,	%g2,	%l3
	edge8ln	%i5,	%o6,	%i2
	movleu	%icc,	%g5,	%i3
	edge16n	%o7,	%i1,	%o0
	move	%icc,	%l1,	%o3
	alignaddrl	%i7,	%l2,	%l5
	sra	%g3,	0x1B,	%g4
	xorcc	%l4,	0x052E,	%o2
	movgu	%icc,	%o4,	%i6
	fnot1	%f14,	%f12
	fmovrsne	%o1,	%f11,	%f15
	fsrc1s	%f13,	%f5
	subcc	%g7,	0x045F,	%g6
	movvs	%icc,	%o5,	%l6
	edge32l	%i0,	%i4,	%g1
	srax	%g2,	0x00,	%l3
	andncc	%l0,	%o6,	%i5
	udiv	%g5,	0x18BB,	%i3
	movrlez	%o7,	%i2,	%o0
	sethi	0x076A,	%i1
	fmul8sux16	%f8,	%f6,	%f8
	sdivx	%o3,	0x05CE,	%l1
	lduw	[%l7 + 0x0C],	%l2
	sll	%l5,	%i7,	%g4
	movcc	%icc,	%l4,	%o2
	edge32n	%o4,	%i6,	%o1
	movcc	%xcc,	%g7,	%g3
	xnor	%o5,	%g6,	%l6
	st	%f4,	[%l7 + 0x74]
	fandnot1s	%f1,	%f15,	%f2
	mulx	%i0,	0x0B30,	%i4
	array16	%g1,	%l3,	%l0
	umulcc	%g2,	%i5,	%o6
	fmovs	%f7,	%f1
	srax	%i3,	%o7,	%g5
	ldd	[%l7 + 0x30],	%i2
	smulcc	%o0,	0x0A3E,	%o3
	movne	%icc,	%l1,	%l2
	fsrc2	%f2,	%f10
	udiv	%l5,	0x0FDE,	%i1
	fsrc1	%f0,	%f0
	srl	%g4,	%i7,	%o2
	alignaddr	%o4,	%l4,	%i6
	mulx	%o1,	0x0D9A,	%g7
	movrgz	%g3,	0x04B,	%g6
	stw	%l6,	[%l7 + 0x20]
	orn	%i0,	0x1610,	%i4
	fsrc1s	%f8,	%f8
	movge	%xcc,	%o5,	%g1
	umul	%l0,	0x0CAD,	%l3
	array8	%i5,	%g2,	%o6
	movvs	%xcc,	%o7,	%g5
	fmul8ulx16	%f12,	%f14,	%f12
	movpos	%icc,	%i3,	%o0
	addccc	%i2,	0x15AC,	%o3
	fnegs	%f7,	%f2
	fsrc1s	%f15,	%f7
	ldd	[%l7 + 0x48],	%f2
	sdivcc	%l2,	0x08DE,	%l1
	edge32l	%i1,	%g4,	%l5
	orn	%i7,	%o4,	%l4
	movcs	%icc,	%o2,	%o1
	fornot2	%f12,	%f0,	%f8
	edge32l	%g7,	%i6,	%g3
	subcc	%g6,	0x1A50,	%l6
	ldx	[%l7 + 0x28],	%i4
	srl	%o5,	0x15,	%g1
	smulcc	%i0,	0x00F8,	%l0
	array8	%i5,	%g2,	%l3
	fandnot1	%f12,	%f4,	%f14
	array32	%o7,	%g5,	%o6
	fzero	%f14
	sth	%o0,	[%l7 + 0x24]
	andcc	%i2,	%i3,	%o3
	smul	%l1,	0x1799,	%i1
	sll	%g4,	0x07,	%l2
	popc	%l5,	%o4
	udivcc	%i7,	0x1D86,	%l4
	edge32l	%o2,	%g7,	%i6
	orncc	%g3,	%g6,	%l6
	fpsub16s	%f3,	%f3,	%f11
	xnorcc	%i4,	0x1DD4,	%o1
	edge16	%o5,	%g1,	%l0
	fmovrdlz	%i0,	%f6,	%f8
	addccc	%g2,	0x0BFC,	%l3
	xor	%i5,	0x01F0,	%g5
	umul	%o6,	0x1C13,	%o7
	ldsh	[%l7 + 0x60],	%i2
	movle	%xcc,	%o0,	%i3
	subccc	%o3,	0x0C80,	%i1
	movgu	%icc,	%g4,	%l1
	addccc	%l2,	%l5,	%i7
	alignaddr	%l4,	%o2,	%g7
	subcc	%i6,	%o4,	%g3
	alignaddr	%g6,	%i4,	%l6
	ldd	[%l7 + 0x58],	%o0
	alignaddr	%g1,	%o5,	%i0
	fmovdle	%xcc,	%f13,	%f9
	alignaddrl	%g2,	%l0,	%i5
	ldub	[%l7 + 0x7F],	%g5
	ldsh	[%l7 + 0x76],	%o6
	fmovsgu	%xcc,	%f12,	%f14
	srlx	%l3,	%o7,	%o0
	movge	%icc,	%i3,	%o3
	fmovsne	%icc,	%f12,	%f11
	fands	%f9,	%f8,	%f7
	movpos	%xcc,	%i1,	%g4
	movn	%xcc,	%i2,	%l1
	xorcc	%l2,	%l5,	%i7
	movne	%icc,	%l4,	%g7
	addcc	%i6,	0x17C6,	%o2
	umul	%o4,	0x1B1D,	%g3
	movrlz	%i4,	%l6,	%o1
	andncc	%g6,	%g1,	%i0
	alignaddrl	%g2,	%o5,	%l0
	edge16l	%i5,	%o6,	%g5
	and	%l3,	0x0261,	%o7
	fmovsle	%xcc,	%f1,	%f10
	fmovrde	%o0,	%f10,	%f4
	sub	%i3,	0x0A78,	%i1
	umulcc	%o3,	0x08DB,	%g4
	lduh	[%l7 + 0x30],	%l1
	movrlz	%l2,	%i2,	%l5
	array8	%i7,	%g7,	%l4
	fpack32	%f4,	%f6,	%f6
	ldub	[%l7 + 0x2F],	%o2
	fmovsne	%xcc,	%f9,	%f15
	smulcc	%o4,	0x0B08,	%i6
	fand	%f0,	%f6,	%f6
	xnorcc	%g3,	%i4,	%l6
	or	%g6,	%g1,	%o1
	and	%i0,	%o5,	%g2
	movrgez	%l0,	%o6,	%i5
	movvc	%xcc,	%l3,	%g5
	sdivcc	%o7,	0x0679,	%i3
	movneg	%xcc,	%o0,	%i1
	andn	%o3,	0x0B95,	%g4
	movge	%icc,	%l1,	%l2
	save %i2, 0x1F57, %l5
	stb	%g7,	[%l7 + 0x78]
	array32	%l4,	%o2,	%i7
	stw	%o4,	[%l7 + 0x78]
	fmovdcc	%icc,	%f1,	%f2
	sethi	0x1924,	%g3
	fornot1s	%f2,	%f14,	%f6
	or	%i6,	0x18D0,	%i4
	fcmpgt32	%f0,	%f4,	%l6
	edge8	%g1,	%o1,	%g6
	stw	%o5,	[%l7 + 0x1C]
	fmovrdne	%g2,	%f4,	%f10
	sll	%i0,	0x18,	%o6
	xnor	%i5,	%l0,	%l3
	fmovsleu	%xcc,	%f6,	%f1
	stw	%o7,	[%l7 + 0x7C]
	addcc	%g5,	%i3,	%o0
	ldsw	[%l7 + 0x7C],	%i1
	ldsw	[%l7 + 0x50],	%g4
	add	%l1,	0x157C,	%o3
	srax	%l2,	0x1E,	%i2
	xnorcc	%l5,	%l4,	%o2
	umulcc	%i7,	%g7,	%o4
	addc	%g3,	%i4,	%l6
	mulscc	%g1,	%i6,	%o1
	fmovrdgez	%o5,	%f6,	%f12
	fmovscs	%xcc,	%f0,	%f3
	fmovsle	%xcc,	%f9,	%f0
	addccc	%g6,	0x13B8,	%i0
	edge16n	%o6,	%g2,	%l0
	fornot1s	%f7,	%f1,	%f14
	sub	%i5,	%l3,	%g5
	xnorcc	%o7,	0x13F5,	%i3
	fand	%f8,	%f4,	%f10
	fpack32	%f6,	%f8,	%f4
	movrlez	%o0,	0x130,	%i1
	mulx	%l1,	0x1304,	%o3
	smul	%g4,	0x09DF,	%i2
	save %l5, %l2, %o2
	xnorcc	%i7,	%l4,	%g7
	fones	%f0
	udivx	%o4,	0x19EC,	%g3
	fcmpes	%fcc2,	%f2,	%f1
	sllx	%l6,	0x07,	%g1
	array16	%i4,	%o1,	%o5
	umulcc	%i6,	%i0,	%o6
	fors	%f13,	%f13,	%f6
	mova	%icc,	%g6,	%g2
	movvs	%xcc,	%l0,	%l3
	andcc	%g5,	0x1AB2,	%i5
	srl	%o7,	0x09,	%o0
	fpackfix	%f6,	%f5
	faligndata	%f2,	%f2,	%f10
	umulcc	%i3,	0x129E,	%i1
	stx	%l1,	[%l7 + 0x08]
	movrgz	%g4,	0x17D,	%i2
	fmovrsgez	%l5,	%f10,	%f1
	fmovdneg	%icc,	%f10,	%f4
	fmovdn	%icc,	%f6,	%f13
	ld	[%l7 + 0x50],	%f13
	mulscc	%o3,	0x047C,	%l2
	sth	%i7,	[%l7 + 0x28]
	or	%o2,	0x061D,	%l4
	movne	%xcc,	%g7,	%g3
	ldsb	[%l7 + 0x3D],	%o4
	fmovsn	%icc,	%f9,	%f5
	umulcc	%l6,	%g1,	%i4
	edge32	%o5,	%i6,	%o1
	movcc	%icc,	%i0,	%g6
	movrgz	%g2,	0x10C,	%o6
	fmovsne	%icc,	%f1,	%f1
	edge32n	%l3,	%g5,	%l0
	array32	%o7,	%i5,	%i3
	fmovsg	%icc,	%f9,	%f9
	edge8ln	%i1,	%o0,	%g4
	edge16ln	%i2,	%l5,	%o3
	subccc	%l2,	%l1,	%o2
	restore %i7, %l4, %g3
	smul	%g7,	%l6,	%g1
	fabss	%f10,	%f4
	edge16	%i4,	%o4,	%i6
	edge8ln	%o1,	%i0,	%o5
	array16	%g6,	%o6,	%l3
	movrgez	%g2,	%g5,	%l0
	movn	%xcc,	%o7,	%i3
	umul	%i5,	0x0FFF,	%o0
	fmovsn	%xcc,	%f0,	%f11
	ldd	[%l7 + 0x48],	%g4
	fnands	%f9,	%f14,	%f11
	umul	%i2,	%l5,	%i1
	lduw	[%l7 + 0x40],	%l2
	lduh	[%l7 + 0x76],	%o3
	subccc	%o2,	%i7,	%l1
	orncc	%g3,	%g7,	%l6
	edge32n	%l4,	%i4,	%g1
	fmovsneg	%xcc,	%f9,	%f6
	sllx	%i6,	0x07,	%o1
	or	%i0,	%o4,	%g6
	andcc	%o6,	0x02E8,	%o5
	movleu	%xcc,	%g2,	%g5
	fone	%f12
	edge16ln	%l3,	%o7,	%i3
	stw	%l0,	[%l7 + 0x28]
	fmovsvs	%xcc,	%f10,	%f4
	fxor	%f4,	%f8,	%f6
	sub	%i5,	0x1290,	%g4
	ldub	[%l7 + 0x0A],	%i2
	subccc	%o0,	0x1F3A,	%i1
	alignaddr	%l2,	%l5,	%o3
	subcc	%i7,	0x0F4C,	%o2
	popc	%l1,	%g3
	addcc	%g7,	0x05E3,	%l6
	fpackfix	%f10,	%f13
	movneg	%icc,	%i4,	%g1
	xnor	%i6,	0x1FE5,	%o1
	fpsub16	%f0,	%f10,	%f8
	ldsh	[%l7 + 0x54],	%i0
	edge8	%l4,	%o4,	%g6
	xnorcc	%o6,	%o5,	%g2
	edge8n	%g5,	%l3,	%o7
	lduw	[%l7 + 0x78],	%l0
	orn	%i3,	0x1D00,	%g4
	mova	%icc,	%i5,	%o0
	fmovdn	%icc,	%f5,	%f3
	xnorcc	%i2,	0x0EA8,	%i1
	subcc	%l5,	0x1498,	%o3
	xnor	%l2,	0x0E97,	%i7
	edge8l	%l1,	%g3,	%g7
	fmovdg	%xcc,	%f14,	%f15
	and	%o2,	0x0BA4,	%i4
	fmovdleu	%icc,	%f7,	%f2
	stx	%g1,	[%l7 + 0x50]
	sth	%l6,	[%l7 + 0x54]
	fpmerge	%f4,	%f7,	%f6
	fpadd16s	%f7,	%f5,	%f12
	array32	%i6,	%i0,	%l4
	fexpand	%f10,	%f8
	fones	%f11
	movcs	%icc,	%o1,	%g6
	subcc	%o4,	0x0AE7,	%o6
	fsrc1s	%f9,	%f2
	fpsub16s	%f3,	%f0,	%f5
	andcc	%g2,	0x16E9,	%o5
	sllx	%l3,	%o7,	%l0
	sth	%i3,	[%l7 + 0x18]
	fandnot2s	%f0,	%f11,	%f0
	add	%g5,	%i5,	%o0
	alignaddr	%g4,	%i1,	%l5
	mulscc	%o3,	0x1104,	%i2
	save %l2, %i7, %g3
	movge	%icc,	%g7,	%o2
	edge16	%l1,	%g1,	%l6
	ld	[%l7 + 0x14],	%f15
	array8	%i6,	%i0,	%l4
	alignaddrl	%o1,	%i4,	%o4
	ldsb	[%l7 + 0x7D],	%o6
	fmovrdne	%g2,	%f10,	%f10
	fmovrdlz	%g6,	%f2,	%f4
	addccc	%o5,	%l3,	%l0
	ldub	[%l7 + 0x3A],	%o7
	mulx	%i3,	0x193A,	%g5
	and	%i5,	%g4,	%i1
	movne	%icc,	%o0,	%o3
	edge8	%l5,	%i2,	%i7
	fornot2	%f14,	%f2,	%f10
	ldd	[%l7 + 0x28],	%f2
	smulcc	%g3,	%g7,	%l2
	addccc	%o2,	0x0870,	%l1
	movge	%icc,	%g1,	%l6
	stb	%i6,	[%l7 + 0x56]
	sth	%l4,	[%l7 + 0x4A]
	ldsw	[%l7 + 0x34],	%i0
	add	%i4,	%o1,	%o6
	and	%g2,	0x1A55,	%o4
	movrlz	%g6,	0x0E5,	%l3
	ldx	[%l7 + 0x08],	%o5
	fzeros	%f12
	sdivx	%l0,	0x1A55,	%i3
	mulx	%g5,	0x1E57,	%o7
	umul	%i5,	0x0F48,	%g4
	andcc	%i1,	0x0B47,	%o0
	edge32	%l5,	%i2,	%i7
	andcc	%o3,	%g7,	%g3
	movvc	%xcc,	%o2,	%l2
	srlx	%g1,	0x1A,	%l6
	sub	%i6,	%l1,	%i0
	orcc	%i4,	%o1,	%l4
	fmovdl	%xcc,	%f7,	%f10
	andn	%o6,	%g2,	%o4
	movge	%xcc,	%g6,	%o5
	movre	%l3,	0x29E,	%l0
	xor	%i3,	%o7,	%i5
	fcmps	%fcc2,	%f6,	%f10
	fmuld8sux16	%f14,	%f11,	%f4
	st	%f7,	[%l7 + 0x08]
	xnor	%g5,	%i1,	%g4
	edge8ln	%l5,	%i2,	%i7
	edge8	%o3,	%g7,	%o0
	movgu	%xcc,	%g3,	%o2
	movrlez	%l2,	0x1D0,	%g1
	fornot1s	%f15,	%f15,	%f6
	fmovde	%xcc,	%f13,	%f15
	smulcc	%l6,	0x1190,	%l1
	addccc	%i0,	0x18F8,	%i4
	ldsh	[%l7 + 0x2E],	%i6
	ldd	[%l7 + 0x78],	%f10
	ldd	[%l7 + 0x48],	%f10
	stb	%o1,	[%l7 + 0x42]
	move	%icc,	%l4,	%g2
	alignaddrl	%o4,	%o6,	%o5
	ldd	[%l7 + 0x78],	%l2
	fcmped	%fcc1,	%f0,	%f8
	andn	%l0,	0x1CDA,	%g6
	orncc	%i3,	%o7,	%i5
	fone	%f6
	movrgz	%g5,	%g4,	%l5
	sth	%i2,	[%l7 + 0x4C]
	addc	%i7,	%o3,	%g7
	movcc	%xcc,	%o0,	%g3
	sth	%i1,	[%l7 + 0x7E]
	restore %l2, 0x1E39, %o2
	movvs	%xcc,	%l6,	%g1
	add	%i0,	%l1,	%i6
	ldub	[%l7 + 0x0C],	%o1
	sra	%l4,	0x02,	%g2
	or	%i4,	0x041E,	%o4
	andn	%o6,	0x1554,	%o5
	mulscc	%l3,	0x184F,	%g6
	fone	%f8
	movle	%xcc,	%i3,	%l0
	udivx	%i5,	0x13E7,	%o7
	movl	%icc,	%g5,	%g4
	fone	%f8
	movrgez	%i2,	%i7,	%l5
	edge8n	%g7,	%o3,	%o0
	movleu	%icc,	%g3,	%i1
	edge32n	%o2,	%l2,	%g1
	edge16l	%l6,	%i0,	%i6
	fmovsa	%xcc,	%f7,	%f11
	udiv	%l1,	0x0C5B,	%l4
	subccc	%o1,	0x041E,	%i4
	movrgz	%o4,	%o6,	%g2
	movrgez	%l3,	%o5,	%i3
	ldd	[%l7 + 0x18],	%l0
	andcc	%i5,	0x104D,	%o7
	save %g5, 0x0FFA, %g6
	save %i2, %i7, %l5
	edge32	%g7,	%g4,	%o0
	ldsw	[%l7 + 0x64],	%g3
	movvc	%xcc,	%i1,	%o2
	fnand	%f0,	%f10,	%f8
	smulcc	%o3,	%g1,	%l2
	movneg	%xcc,	%i0,	%l6
	ldd	[%l7 + 0x38],	%i6
	srax	%l4,	%o1,	%i4
	ldsw	[%l7 + 0x34],	%o4
	fmovdn	%xcc,	%f13,	%f7
	ld	[%l7 + 0x68],	%f3
	movre	%o6,	0x189,	%l1
	movleu	%icc,	%l3,	%o5
	orn	%i3,	%l0,	%i5
	movleu	%icc,	%g2,	%g5
	fxor	%f4,	%f12,	%f6
	udivcc	%o7,	0x0E0D,	%g6
	edge16	%i2,	%l5,	%g7
	edge8n	%i7,	%g4,	%g3
	fmovrdgez	%o0,	%f6,	%f14
	movrgz	%o2,	%i1,	%o3
	sdivx	%g1,	0x182E,	%l2
	movrne	%l6,	%i0,	%i6
	fsrc1s	%f5,	%f5
	smulcc	%l4,	0x09FD,	%o1
	fpsub32	%f0,	%f2,	%f2
	edge16	%o4,	%i4,	%l1
	or	%o6,	0x1509,	%o5
	smulcc	%l3,	0x1F16,	%l0
	mulx	%i5,	%i3,	%g2
	sllx	%g5,	0x19,	%o7
	movcc	%icc,	%i2,	%g6
	edge16ln	%g7,	%i7,	%g4
	edge8ln	%g3,	%o0,	%l5
	fmovrse	%i1,	%f1,	%f15
	fxnor	%f10,	%f14,	%f8
	edge8n	%o3,	%o2,	%g1
	popc	0x02FD,	%l2
	movrlez	%l6,	0x2C4,	%i0
	sethi	0x1E4F,	%l4
	sdiv	%o1,	0x1606,	%i6
	fxnors	%f2,	%f11,	%f14
	sethi	0x11B7,	%o4
	orncc	%l1,	%i4,	%o5
	addc	%o6,	0x180C,	%l0
	orncc	%l3,	%i5,	%g2
	addcc	%g5,	0x07F5,	%o7
	ldd	[%l7 + 0x60],	%f14
	movgu	%xcc,	%i2,	%g6
	sllx	%g7,	0x10,	%i3
	alignaddr	%g4,	%g3,	%o0
	udiv	%l5,	0x1ED5,	%i7
	fmovsgu	%icc,	%f11,	%f11
	fpadd32s	%f12,	%f4,	%f0
	subcc	%i1,	0x1856,	%o3
	movge	%icc,	%o2,	%l2
	orcc	%g1,	%l6,	%i0
	edge32	%l4,	%i6,	%o1
	srl	%l1,	%o4,	%o5
	smul	%o6,	%i4,	%l3
	add	%i5,	0x0DF3,	%g2
	edge8	%g5,	%o7,	%l0
	movrlez	%g6,	0x10C,	%i2
	ldsb	[%l7 + 0x25],	%g7
	edge16ln	%i3,	%g4,	%g3
	stx	%l5,	[%l7 + 0x38]
	fone	%f6
	srl	%o0,	0x0C,	%i1
	fors	%f4,	%f12,	%f12
	movre	%i7,	%o2,	%l2
	subccc	%g1,	0x0C83,	%l6
	subc	%i0,	%o3,	%l4
	edge8	%o1,	%l1,	%i6
	edge8	%o4,	%o6,	%i4
	andn	%l3,	0x115E,	%o5
	smul	%g2,	%i5,	%g5
	fcmpeq16	%f10,	%f12,	%o7
	mulscc	%g6,	0x1A06,	%i2
	movn	%xcc,	%g7,	%i3
	movl	%icc,	%l0,	%g4
	stx	%g3,	[%l7 + 0x68]
	addccc	%l5,	%i1,	%o0
	edge32n	%i7,	%l2,	%g1
	movvs	%icc,	%o2,	%l6
	andcc	%i0,	%o3,	%l4
	srlx	%o1,	%l1,	%i6
	ldsb	[%l7 + 0x3F],	%o6
	fmovrde	%i4,	%f12,	%f10
	subccc	%o4,	0x1842,	%o5
	srlx	%l3,	0x18,	%g2
	restore %i5, %g5, %o7
	andcc	%i2,	%g7,	%i3
	movrlz	%g6,	%g4,	%g3
	ldsw	[%l7 + 0x7C],	%l0
	ldub	[%l7 + 0x6B],	%i1
	edge32l	%l5,	%o0,	%i7
	xorcc	%l2,	%o2,	%l6
	edge8ln	%g1,	%i0,	%o3
	fmovdcc	%xcc,	%f4,	%f15
	fnegd	%f2,	%f8
	popc	0x0B5F,	%o1
	movn	%xcc,	%l1,	%i6
	st	%f5,	[%l7 + 0x1C]
	fmovdleu	%icc,	%f2,	%f9
	orcc	%l4,	0x1998,	%i4
	edge32ln	%o6,	%o5,	%o4
	movle	%xcc,	%g2,	%l3
	fmovsneg	%xcc,	%f4,	%f3
	fpsub16s	%f9,	%f6,	%f4
	ldsw	[%l7 + 0x14],	%g5
	sll	%o7,	0x0E,	%i2
	edge8n	%i5,	%g7,	%i3
	fmovdleu	%icc,	%f10,	%f4
	orcc	%g4,	0x1919,	%g6
	srlx	%l0,	0x17,	%i1
	umulcc	%g3,	0x0CF4,	%o0
	edge8	%l5,	%i7,	%o2
	array16	%l6,	%g1,	%l2
	orn	%i0,	%o3,	%l1
	stw	%i6,	[%l7 + 0x78]
	movge	%xcc,	%o1,	%l4
	and	%o6,	0x19E3,	%i4
	fmovs	%f13,	%f8
	udiv	%o5,	0x1B6D,	%o4
	sdivcc	%g2,	0x0BC3,	%l3
	ldub	[%l7 + 0x52],	%g5
	fandnot1	%f2,	%f2,	%f12
	array16	%o7,	%i5,	%i2
	xor	%i3,	0x1A52,	%g4
	smulcc	%g6,	%l0,	%g7
	andcc	%i1,	0x0E58,	%g3
	lduh	[%l7 + 0x4C],	%l5
	movre	%i7,	%o2,	%o0
	subcc	%g1,	0x064A,	%l2
	fmovda	%icc,	%f5,	%f1
	movg	%xcc,	%i0,	%l6
	addcc	%o3,	0x04F0,	%l1
	save %o1, %l4, %i6
	fnegd	%f6,	%f2
	edge8	%o6,	%o5,	%i4
	ldd	[%l7 + 0x68],	%f4
	andncc	%g2,	%l3,	%g5
	edge8n	%o4,	%i5,	%i2
	fmovrdne	%o7,	%f10,	%f6
	fpack16	%f4,	%f4
	movrlz	%g4,	%g6,	%i3
	fsrc2	%f12,	%f8
	save %l0, 0x03BB, %i1
	udivcc	%g3,	0x1ECD,	%l5
	addccc	%i7,	0x1812,	%o2
	fabss	%f14,	%f0
	or	%o0,	0x0343,	%g1
	movn	%icc,	%g7,	%i0
	edge8	%l6,	%l2,	%o3
	umulcc	%o1,	%l1,	%i6
	movcc	%icc,	%l4,	%o5
	stx	%i4,	[%l7 + 0x68]
	fmovrdgez	%g2,	%f8,	%f6
	restore %l3, %o6, %o4
	movre	%i5,	%i2,	%g5
	stb	%o7,	[%l7 + 0x14]
	xor	%g4,	%i3,	%g6
	fmovd	%f8,	%f10
	edge32l	%l0,	%i1,	%l5
	fmovspos	%icc,	%f11,	%f1
	fpadd16s	%f13,	%f9,	%f2
	movvs	%xcc,	%i7,	%g3
	ldub	[%l7 + 0x40],	%o2
	alignaddrl	%g1,	%o0,	%i0
	edge32	%l6,	%g7,	%o3
	xnor	%l2,	0x1132,	%o1
	edge8l	%i6,	%l1,	%o5
	ldx	[%l7 + 0x18],	%l4
	movcc	%icc,	%g2,	%l3
	ldsh	[%l7 + 0x76],	%i4
	fmovrdlz	%o6,	%f8,	%f12
	fpack16	%f2,	%f5
	movneg	%xcc,	%o4,	%i2
	edge8l	%g5,	%o7,	%i5
	save %g4, 0x1436, %i3
	add	%l0,	%g6,	%i1
	movn	%xcc,	%l5,	%i7
	ldd	[%l7 + 0x40],	%f0
	fpack32	%f4,	%f0,	%f12
	sll	%g3,	%g1,	%o0
	fexpand	%f5,	%f0
	movrne	%o2,	0x384,	%l6
	or	%g7,	0x18D0,	%o3
	andn	%i0,	%o1,	%l2
	edge32	%i6,	%o5,	%l1
	ldd	[%l7 + 0x30],	%l4
	fmovspos	%xcc,	%f7,	%f4
	movre	%g2,	0x28E,	%l3
	srax	%i4,	0x1F,	%o6
	or	%i2,	%g5,	%o4
	umulcc	%i5,	0x184E,	%g4
	st	%f2,	[%l7 + 0x78]
	std	%f0,	[%l7 + 0x70]
	move	%icc,	%o7,	%i3
	ldd	[%l7 + 0x40],	%g6
	srax	%i1,	%l0,	%l5
	movrlz	%i7,	%g1,	%g3
	sll	%o0,	0x04,	%o2
	orcc	%l6,	%o3,	%g7
	move	%icc,	%i0,	%l2
	umulcc	%o1,	%i6,	%o5
	st	%f9,	[%l7 + 0x40]
	fornot1	%f6,	%f14,	%f14
	fmovdle	%icc,	%f1,	%f12
	movvc	%icc,	%l4,	%l1
	movre	%g2,	0x262,	%i4
	fmovscs	%icc,	%f10,	%f14
	ldx	[%l7 + 0x60],	%o6
	sdiv	%i2,	0x0AE6,	%l3
	edge8	%o4,	%i5,	%g5
	movleu	%icc,	%o7,	%g4
	xnor	%g6,	%i1,	%i3
	orcc	%l5,	0x1689,	%i7
	and	%l0,	%g3,	%g1
	movl	%xcc,	%o2,	%o0
	fcmpeq32	%f8,	%f8,	%l6
	udivx	%o3,	0x16B4,	%i0
	movge	%xcc,	%g7,	%l2
	lduh	[%l7 + 0x20],	%i6
	stw	%o1,	[%l7 + 0x6C]
	udivx	%o5,	0x031E,	%l1
	smulcc	%g2,	0x1BE1,	%l4
	movl	%icc,	%o6,	%i4
	fsrc1	%f2,	%f10
	movneg	%xcc,	%i2,	%l3
	udivx	%i5,	0x0139,	%o4
	movrlez	%o7,	0x266,	%g5
	movne	%icc,	%g4,	%g6
	sllx	%i3,	%l5,	%i1
	or	%i7,	0x172F,	%l0
	edge32n	%g1,	%o2,	%g3
	ldsw	[%l7 + 0x38],	%l6
	edge8n	%o3,	%o0,	%i0
	sllx	%l2,	0x04,	%g7
	smul	%i6,	0x10FD,	%o1
	mulx	%l1,	0x0918,	%o5
	edge8l	%l4,	%o6,	%i4
	fnot2s	%f13,	%f2
	movg	%icc,	%g2,	%l3
	mulx	%i5,	%i2,	%o4
	mulx	%o7,	%g5,	%g4
	add	%i3,	%g6,	%l5
	sethi	0x1E7B,	%i1
	movvs	%xcc,	%i7,	%g1
	movcs	%xcc,	%l0,	%o2
	movle	%xcc,	%l6,	%o3
	fabss	%f10,	%f14
	andn	%g3,	0x1C13,	%i0
	fmuld8ulx16	%f10,	%f0,	%f14
	fandnot2s	%f14,	%f8,	%f10
	orcc	%l2,	%o0,	%i6
	movle	%xcc,	%o1,	%l1
	fpackfix	%f12,	%f1
	edge16n	%o5,	%l4,	%g7
	fmovrse	%i4,	%f8,	%f4
	movrne	%o6,	0x355,	%l3
	udiv	%i5,	0x068E,	%g2
	fmovsg	%xcc,	%f12,	%f6
	edge32n	%o4,	%o7,	%i2
	movvs	%icc,	%g4,	%g5
	fmovsl	%xcc,	%f0,	%f7
	addcc	%i3,	0x133C,	%l5
	stb	%i1,	[%l7 + 0x1B]
	sub	%i7,	%g6,	%l0
	movrlez	%g1,	%l6,	%o3
	fmovrdlez	%g3,	%f10,	%f14
	ldsh	[%l7 + 0x3A],	%o2
	srl	%i0,	%o0,	%i6
	std	%f10,	[%l7 + 0x68]
	edge8	%l2,	%l1,	%o5
	sub	%o1,	0x196E,	%l4
	fcmps	%fcc2,	%f14,	%f14
	subccc	%g7,	%o6,	%i4
	array16	%i5,	%l3,	%o4
	fnegd	%f4,	%f12
	fpadd16s	%f10,	%f12,	%f1
	movl	%icc,	%o7,	%g2
	fmovdvc	%xcc,	%f10,	%f9
	movge	%xcc,	%i2,	%g4
	ldsb	[%l7 + 0x4D],	%i3
	movge	%icc,	%g5,	%l5
	edge16ln	%i7,	%g6,	%i1
	alignaddr	%g1,	%l6,	%o3
	lduh	[%l7 + 0x54],	%l0
	sethi	0x1481,	%o2
	addccc	%i0,	%g3,	%i6
	movrlz	%o0,	0x3A0,	%l1
	andncc	%o5,	%o1,	%l2
	movn	%icc,	%l4,	%o6
	array32	%g7,	%i5,	%l3
	lduw	[%l7 + 0x18],	%o4
	edge16l	%o7,	%i4,	%i2
	udivx	%g2,	0x1A46,	%i3
	sll	%g4,	%l5,	%g5
	edge8ln	%g6,	%i7,	%i1
	st	%f4,	[%l7 + 0x7C]
	stx	%g1,	[%l7 + 0x60]
	ldub	[%l7 + 0x4B],	%o3
	std	%f0,	[%l7 + 0x30]
	bshuffle	%f4,	%f0,	%f8
	popc	%l0,	%l6
	subcc	%i0,	%g3,	%i6
	edge32l	%o2,	%l1,	%o5
	ld	[%l7 + 0x74],	%f5
	ldsh	[%l7 + 0x5A],	%o0
	fmovscs	%xcc,	%f4,	%f8
	fmovrde	%o1,	%f8,	%f14
	edge16ln	%l4,	%l2,	%o6
	movle	%icc,	%i5,	%l3
	fzeros	%f6
	edge16n	%o4,	%g7,	%i4
	edge16l	%o7,	%i2,	%i3
	restore %g4, 0x1228, %g2
	srl	%l5,	0x11,	%g5
	addccc	%i7,	0x0F31,	%i1
	edge16ln	%g6,	%o3,	%l0
	movl	%icc,	%g1,	%i0
	andcc	%l6,	0x1F87,	%g3
	orncc	%i6,	%o2,	%o5
	movneg	%xcc,	%o0,	%o1
	movg	%xcc,	%l1,	%l2
	fmovdpos	%icc,	%f1,	%f5
	addccc	%o6,	0x1CB8,	%l4
	ld	[%l7 + 0x74],	%f2
	subccc	%i5,	0x1233,	%l3
	fxnors	%f2,	%f0,	%f5
	lduh	[%l7 + 0x0A],	%o4
	movg	%xcc,	%g7,	%i4
	add	%i2,	%o7,	%i3
	fmovsleu	%icc,	%f10,	%f3
	umulcc	%g4,	%l5,	%g5
	sethi	0x102F,	%g2
	addcc	%i1,	0x005C,	%g6
	andcc	%i7,	%o3,	%l0
	save %g1, 0x18B0, %i0
	fcmpgt16	%f8,	%f10,	%g3
	fmovdcs	%icc,	%f3,	%f0
	fandnot2s	%f1,	%f14,	%f5
	sllx	%i6,	%l6,	%o5
	edge32	%o2,	%o1,	%o0
	array8	%l1,	%l2,	%l4
	fpmerge	%f13,	%f14,	%f6
	or	%o6,	0x09A7,	%l3
	fmovd	%f8,	%f2
	andncc	%o4,	%i5,	%g7
	sllx	%i2,	%i4,	%o7
	fmovdge	%icc,	%f5,	%f0
	mulx	%i3,	0x186F,	%g4
	addccc	%l5,	%g5,	%i1
	array32	%g6,	%g2,	%o3
	addcc	%i7,	0x1D70,	%g1
	fmovrse	%i0,	%f13,	%f6
	or	%l0,	%i6,	%l6
	edge32l	%g3,	%o5,	%o1
	movle	%xcc,	%o0,	%l1
	edge16ln	%o2,	%l4,	%o6
	xnorcc	%l3,	0x1088,	%o4
	xor	%i5,	%g7,	%l2
	movvc	%icc,	%i4,	%i2
	fexpand	%f3,	%f10
	edge8n	%i3,	%o7,	%l5
	edge32l	%g4,	%i1,	%g5
	movcs	%icc,	%g2,	%o3
	fmul8x16al	%f10,	%f14,	%f4
	sllx	%i7,	0x12,	%g1
	st	%f0,	[%l7 + 0x28]
	fnegs	%f0,	%f8
	and	%i0,	%g6,	%l0
	fnot1	%f10,	%f12
	edge8n	%i6,	%g3,	%l6
	or	%o5,	%o1,	%l1
	smul	%o2,	0x096D,	%o0
	ldsb	[%l7 + 0x37],	%l4
	fcmpeq32	%f10,	%f14,	%l3
	andncc	%o4,	%i5,	%g7
	fornot1	%f2,	%f14,	%f8
	popc	%l2,	%o6
	movleu	%xcc,	%i2,	%i4
	smul	%i3,	0x0285,	%l5
	ldsh	[%l7 + 0x2E],	%o7
	sethi	0x09DA,	%g4
	ld	[%l7 + 0x50],	%f12
	mulscc	%i1,	%g2,	%o3
	alignaddr	%g5,	%i7,	%g1
	restore %g6, 0x006B, %i0
	addcc	%i6,	0x116E,	%g3
	fmovdneg	%xcc,	%f0,	%f11
	fmovdg	%icc,	%f14,	%f8
	sdivx	%l0,	0x0794,	%l6
	ldub	[%l7 + 0x2C],	%o1
	movgu	%icc,	%l1,	%o2
	std	%f6,	[%l7 + 0x20]
	umul	%o5,	%l4,	%o0
	xorcc	%o4,	%l3,	%g7
	sllx	%i5,	0x0D,	%o6
	array32	%i2,	%l2,	%i4
	movvs	%icc,	%i3,	%l5
	udiv	%o7,	0x05B1,	%i1
	movre	%g4,	%o3,	%g2
	or	%g5,	0x0114,	%g1
	ld	[%l7 + 0x70],	%f0
	orcc	%i7,	0x0246,	%i0
	fones	%f4
	sethi	0x1CFB,	%g6
	movl	%xcc,	%i6,	%g3
	subc	%l6,	%o1,	%l1
	movleu	%xcc,	%l0,	%o5
	fpack16	%f4,	%f6
	fandnot1	%f14,	%f14,	%f12
	fmovde	%xcc,	%f15,	%f1
	ldsb	[%l7 + 0x17],	%o2
	udiv	%l4,	0x0C5A,	%o4
	fnors	%f10,	%f1,	%f15
	movrgez	%l3,	0x311,	%o0
	stb	%i5,	[%l7 + 0x65]
	fpadd16	%f2,	%f2,	%f6
	popc	%g7,	%o6
	subccc	%l2,	%i2,	%i3
	movrgez	%l5,	0x3B6,	%o7
	save %i1, %g4, %o3
	movne	%icc,	%g2,	%i4
	movrlez	%g5,	%i7,	%g1
	edge32ln	%g6,	%i6,	%g3
	ldub	[%l7 + 0x3C],	%l6
	edge8ln	%o1,	%i0,	%l1
	and	%o5,	0x137B,	%l0
	andcc	%o2,	0x1CB7,	%o4
	edge16ln	%l3,	%o0,	%i5
	sdiv	%l4,	0x0644,	%g7
	fxnors	%f3,	%f14,	%f13
	orcc	%l2,	0x04C2,	%i2
	fmuld8ulx16	%f8,	%f6,	%f14
	xorcc	%o6,	%l5,	%o7
	umulcc	%i3,	%g4,	%o3
	stw	%g2,	[%l7 + 0x24]
	add	%i4,	0x1F6A,	%g5
	fmovrdne	%i7,	%f2,	%f2
	movrgez	%i1,	0x394,	%g1
	movneg	%xcc,	%g6,	%i6
	array32	%g3,	%l6,	%o1
	edge16ln	%i0,	%o5,	%l0
	fmovrdlz	%o2,	%f12,	%f0
	xorcc	%o4,	0x10AD,	%l3
	edge8ln	%o0,	%l1,	%i5
	movvc	%xcc,	%g7,	%l2
	edge8	%i2,	%o6,	%l5
	fcmps	%fcc3,	%f12,	%f9
	mulscc	%l4,	0x07A9,	%o7
	xnor	%i3,	%g4,	%g2
	fmovsne	%icc,	%f1,	%f12
	ldx	[%l7 + 0x18],	%i4
	lduh	[%l7 + 0x24],	%o3
	subccc	%g5,	0x1C85,	%i1
	mova	%icc,	%g1,	%g6
	st	%f8,	[%l7 + 0x34]
	edge8l	%i6,	%g3,	%l6
	std	%f8,	[%l7 + 0x18]
	std	%f14,	[%l7 + 0x40]
	or	%i7,	0x1519,	%o1
	udivcc	%i0,	0x0187,	%l0
	edge16ln	%o5,	%o2,	%l3
	and	%o0,	%o4,	%l1
	sdivx	%i5,	0x0102,	%g7
	xor	%i2,	0x04F5,	%o6
	andcc	%l2,	0x131C,	%l4
	fxnors	%f11,	%f9,	%f2
	mulscc	%o7,	%l5,	%g4
	array8	%i3,	%i4,	%o3
	movcs	%xcc,	%g2,	%i1
	sth	%g5,	[%l7 + 0x10]
	fornot1s	%f4,	%f3,	%f0
	std	%f6,	[%l7 + 0x10]
	fnot1s	%f3,	%f5
	and	%g1,	0x1CB1,	%g6
	andncc	%i6,	%l6,	%g3
	movl	%icc,	%i7,	%o1
	sth	%l0,	[%l7 + 0x68]
	fmovda	%icc,	%f12,	%f12
	ldd	[%l7 + 0x70],	%o4
	fornot1s	%f2,	%f15,	%f8
	fandnot2	%f10,	%f14,	%f12
	restore %i0, %o2, %o0
	stx	%l3,	[%l7 + 0x28]
	move	%icc,	%o4,	%l1
	movge	%xcc,	%i5,	%g7
	subcc	%i2,	%l2,	%l4
	popc	%o6,	%o7
	movrne	%l5,	%g4,	%i4
	fmovrdgz	%o3,	%f8,	%f2
	movcs	%icc,	%g2,	%i3
	fnot1	%f10,	%f0
	mova	%xcc,	%g5,	%g1
	restore %i1, %g6, %l6
	fcmpeq32	%f14,	%f10,	%g3
	sllx	%i7,	%o1,	%i6
	ldx	[%l7 + 0x60],	%l0
	bshuffle	%f12,	%f12,	%f0
	andncc	%i0,	%o5,	%o2
	edge8ln	%l3,	%o4,	%o0
	sdivcc	%l1,	0x0ABD,	%g7
	edge16ln	%i5,	%l2,	%i2
	xorcc	%l4,	%o6,	%l5
	xorcc	%g4,	%o7,	%o3
	ldsh	[%l7 + 0x66],	%i4
	addcc	%g2,	%g5,	%i3
	fpmerge	%f1,	%f11,	%f12
	mulscc	%g1,	%i1,	%l6
	fpsub16s	%f14,	%f12,	%f11
	fmovsl	%icc,	%f1,	%f8
	movn	%icc,	%g6,	%i7
	sdivx	%g3,	0x1C5B,	%i6
	mulscc	%l0,	0x13E1,	%i0
	fcmpne16	%f0,	%f0,	%o1
	srax	%o2,	%l3,	%o5
	sra	%o0,	0x17,	%o4
	fmovsl	%icc,	%f7,	%f7
	movn	%xcc,	%l1,	%i5
	udiv	%g7,	0x1E00,	%i2
	fnot2	%f14,	%f2
	andncc	%l2,	%l4,	%o6
	edge32	%g4,	%l5,	%o7
	sdivx	%i4,	0x01CF,	%o3
	ld	[%l7 + 0x10],	%f1
	mulx	%g5,	0x1B9D,	%i3
	movn	%icc,	%g1,	%g2
	ldsh	[%l7 + 0x54],	%i1
	movrgz	%l6,	0x18E,	%i7
	xnor	%g3,	%i6,	%l0
	andncc	%g6,	%i0,	%o2
	sllx	%o1,	0x0A,	%o5
	fmovda	%icc,	%f6,	%f14
	movl	%xcc,	%l3,	%o4
	fmul8ulx16	%f12,	%f10,	%f6
	smulcc	%l1,	%o0,	%g7
	fmul8x16	%f8,	%f10,	%f10
	movvs	%icc,	%i5,	%l2
	fzero	%f2
	movcc	%icc,	%l4,	%o6
	sra	%i2,	0x17,	%g4
	fzero	%f14
	fsrc2	%f4,	%f6
	andcc	%l5,	0x08E6,	%i4
	edge32l	%o7,	%o3,	%g5
	fmul8x16	%f12,	%f14,	%f14
	ldd	[%l7 + 0x28],	%f10
	sdiv	%g1,	0x1C66,	%g2
	ldub	[%l7 + 0x39],	%i1
	ldx	[%l7 + 0x50],	%l6
	edge16ln	%i3,	%g3,	%i7
	udivx	%l0,	0x04EE,	%g6
	sdivx	%i0,	0x0271,	%o2
	array16	%o1,	%o5,	%i6
	stb	%l3,	[%l7 + 0x22]
	stx	%l1,	[%l7 + 0x58]
	std	%f10,	[%l7 + 0x70]
	fornot2s	%f7,	%f14,	%f12
	fandnot2	%f8,	%f4,	%f4
	fcmpeq32	%f2,	%f0,	%o4
	xor	%o0,	%i5,	%g7
	fornot2	%f10,	%f14,	%f2
	orn	%l2,	%o6,	%l4
	subcc	%i2,	0x143D,	%g4
	umulcc	%l5,	%o7,	%i4
	ldd	[%l7 + 0x70],	%f0
	udiv	%g5,	0x180F,	%g1
	addc	%o3,	0x0C7F,	%i1
	stb	%l6,	[%l7 + 0x7A]
	mova	%xcc,	%i3,	%g2
	movge	%icc,	%i7,	%g3
	movcc	%xcc,	%l0,	%i0
	movvc	%icc,	%o2,	%g6
	udiv	%o5,	0x159D,	%i6
	fsrc2s	%f5,	%f5
	fmovdg	%icc,	%f15,	%f0
	movleu	%icc,	%o1,	%l1
	ldub	[%l7 + 0x1A],	%l3
	fnegs	%f3,	%f15
	fmovsvc	%xcc,	%f8,	%f15
	movg	%icc,	%o4,	%o0
	movrne	%i5,	0x3F7,	%g7
	movleu	%icc,	%o6,	%l4
	stw	%l2,	[%l7 + 0x3C]
	movrlz	%g4,	%i2,	%l5
	fmovrdlz	%i4,	%f2,	%f6
	addc	%g5,	0x0876,	%o7
	fpsub16s	%f13,	%f6,	%f2
	movrne	%g1,	%o3,	%i1
	fxor	%f12,	%f8,	%f12
	edge8	%i3,	%g2,	%l6
	save %i7, %l0, %i0
	fornot1	%f0,	%f6,	%f14
	save %o2, %g6, %o5
	edge32	%g3,	%o1,	%l1
	fmovsa	%xcc,	%f13,	%f15
	xnor	%i6,	%l3,	%o4
	sdiv	%i5,	0x17D6,	%o0
	movneg	%icc,	%o6,	%g7
	edge16n	%l4,	%l2,	%g4
	movleu	%icc,	%i2,	%i4
	ld	[%l7 + 0x14],	%f3
	array16	%l5,	%g5,	%o7
	xnorcc	%g1,	0x0840,	%i1
	and	%i3,	0x09F3,	%g2
	subcc	%o3,	%l6,	%l0
	fornot2	%f4,	%f10,	%f10
	fmuld8sux16	%f13,	%f1,	%f6
	movre	%i7,	%i0,	%o2
	srax	%g6,	%o5,	%g3
	movneg	%xcc,	%l1,	%o1
	sdivx	%l3,	0x1D36,	%i6
	sra	%o4,	%o0,	%o6
	array16	%g7,	%i5,	%l2
	fcmple16	%f0,	%f0,	%g4
	fcmps	%fcc2,	%f0,	%f1
	movg	%icc,	%i2,	%i4
	edge32	%l4,	%g5,	%o7
	edge16	%l5,	%g1,	%i3
	sra	%i1,	%o3,	%l6
	movrlz	%g2,	%i7,	%i0
	st	%f15,	[%l7 + 0x10]
	fmovsl	%xcc,	%f9,	%f1
	ldsb	[%l7 + 0x56],	%o2
	edge8l	%l0,	%g6,	%o5
	movrgez	%l1,	%g3,	%l3
	movleu	%xcc,	%i6,	%o1
	and	%o0,	%o4,	%o6
	stb	%i5,	[%l7 + 0x0E]
	movgu	%icc,	%l2,	%g7
	srl	%g4,	%i4,	%l4
	movvc	%xcc,	%i2,	%o7
	fmovsge	%icc,	%f6,	%f13
	fpsub16s	%f2,	%f5,	%f2
	subc	%g5,	0x0F4D,	%g1
	edge8	%i3,	%l5,	%i1
	subccc	%o3,	%g2,	%l6
	sdivx	%i7,	0x1AAB,	%i0
	movpos	%icc,	%l0,	%g6
	xnorcc	%o5,	%l1,	%o2
	smul	%g3,	%i6,	%l3
	lduh	[%l7 + 0x70],	%o1
	ldub	[%l7 + 0x77],	%o4
	alignaddrl	%o0,	%o6,	%l2
	array16	%g7,	%g4,	%i4
	mulscc	%i5,	%l4,	%o7
	udivcc	%i2,	0x0B51,	%g5
	sth	%i3,	[%l7 + 0x44]
	ldsb	[%l7 + 0x65],	%l5
	ldd	[%l7 + 0x08],	%f0
	xnorcc	%g1,	0x13E7,	%i1
	edge8n	%g2,	%l6,	%o3
	fornot2s	%f0,	%f10,	%f5
	fcmpes	%fcc1,	%f4,	%f7
	edge8n	%i0,	%i7,	%g6
	movl	%xcc,	%l0,	%l1
	sdivcc	%o5,	0x0AD5,	%g3
	stb	%o2,	[%l7 + 0x2B]
	movrne	%i6,	%o1,	%l3
	and	%o4,	0x1AD2,	%o6
	srax	%o0,	0x16,	%l2
	movneg	%icc,	%g7,	%g4
	stb	%i4,	[%l7 + 0x4F]
	sra	%i5,	0x18,	%l4
	movcc	%xcc,	%o7,	%g5
	edge8ln	%i3,	%l5,	%i2
	add	%g1,	%g2,	%i1
	movrlz	%l6,	%o3,	%i7
	movrlz	%g6,	%l0,	%l1
	ldsw	[%l7 + 0x60],	%i0
	edge32n	%o5,	%g3,	%i6
	fsrc2	%f14,	%f14
	alignaddrl	%o1,	%l3,	%o2
	edge32n	%o6,	%o0,	%l2
	movle	%icc,	%g7,	%g4
	fmovse	%xcc,	%f11,	%f5
	mulscc	%i4,	%i5,	%o4
	edge8n	%l4,	%o7,	%i3
	fornot2	%f0,	%f14,	%f8
	fmul8sux16	%f6,	%f8,	%f2
	movpos	%xcc,	%g5,	%l5
	pdist	%f2,	%f4,	%f14
	edge16l	%g1,	%g2,	%i2
	orcc	%i1,	%o3,	%l6
	movgu	%xcc,	%g6,	%i7
	movn	%icc,	%l1,	%l0
	fmovrdgz	%o5,	%f6,	%f0
	alignaddrl	%i0,	%i6,	%g3
	ldd	[%l7 + 0x50],	%f6
	st	%f4,	[%l7 + 0x54]
	ldsw	[%l7 + 0x78],	%o1
	fornot1s	%f10,	%f4,	%f0
	mulx	%l3,	%o2,	%o6
	movleu	%icc,	%l2,	%g7
	movleu	%xcc,	%g4,	%o0
	movrgz	%i4,	0x3D4,	%i5
	sdivcc	%o4,	0x04B3,	%l4
	fmovrsgz	%i3,	%f1,	%f14
	edge16ln	%g5,	%o7,	%g1
	or	%g2,	%i2,	%i1
	edge16ln	%o3,	%l6,	%g6
	fors	%f15,	%f0,	%f10
	edge8n	%i7,	%l5,	%l1
	movleu	%icc,	%o5,	%l0
	udivcc	%i6,	0x0BD2,	%i0
	edge32n	%g3,	%o1,	%o2
	stx	%l3,	[%l7 + 0x70]
	fnors	%f8,	%f7,	%f7
	subcc	%l2,	0x08A8,	%g7
	sdivx	%o6,	0x062E,	%o0
	fmovdleu	%icc,	%f12,	%f15
	edge32l	%i4,	%g4,	%i5
	ldub	[%l7 + 0x2B],	%o4
	fmovdg	%icc,	%f7,	%f11
	edge16	%l4,	%i3,	%g5
	fzero	%f10
	movg	%icc,	%o7,	%g1
	ldsb	[%l7 + 0x70],	%g2
	edge8l	%i2,	%o3,	%i1
	ld	[%l7 + 0x18],	%f2
	movrlez	%g6,	%l6,	%l5
	edge16l	%i7,	%o5,	%l0
	sdiv	%i6,	0x0527,	%l1
	fmovda	%xcc,	%f8,	%f14
	sdiv	%g3,	0x1380,	%i0
	xorcc	%o1,	%o2,	%l2
	fmuld8ulx16	%f7,	%f13,	%f12
	fzeros	%f0
	movn	%icc,	%l3,	%g7
	xnorcc	%o6,	%i4,	%o0
	movcs	%xcc,	%i5,	%g4
	sdiv	%l4,	0x0A02,	%o4
	xnor	%g5,	0x1E67,	%o7
	movneg	%xcc,	%g1,	%i3
	fmovsneg	%icc,	%f6,	%f11
	mova	%xcc,	%i2,	%o3
	fmovsvs	%icc,	%f12,	%f3
	fnegs	%f4,	%f8
	movvc	%icc,	%g2,	%g6
	xnor	%i1,	0x122D,	%l6
	std	%f2,	[%l7 + 0x28]
	movne	%xcc,	%l5,	%o5
	edge32	%l0,	%i7,	%l1
	ldsh	[%l7 + 0x5A],	%g3
	array8	%i0,	%o1,	%i6
	movneg	%xcc,	%o2,	%l2
	and	%g7,	%o6,	%i4
	fmovsg	%icc,	%f8,	%f14
	fmul8x16	%f12,	%f10,	%f4
	udiv	%o0,	0x0DF4,	%i5
	fmovrslz	%l3,	%f7,	%f0
	edge16n	%l4,	%o4,	%g5
	movrgez	%o7,	0x093,	%g1
	xnorcc	%g4,	%i3,	%i2
	fmovde	%icc,	%f7,	%f12
	edge16ln	%o3,	%g2,	%g6
	ldsb	[%l7 + 0x34],	%i1
	movpos	%icc,	%l5,	%o5
	movl	%xcc,	%l6,	%l0
	addc	%i7,	0x1326,	%l1
	fmovsvc	%xcc,	%f9,	%f8
	movge	%icc,	%g3,	%i0
	edge32l	%i6,	%o2,	%o1
	sethi	0x13CB,	%l2
	fandnot1	%f0,	%f14,	%f0
	fmovda	%xcc,	%f2,	%f1
	sub	%g7,	0x0D81,	%i4
	fmovdle	%xcc,	%f4,	%f13
	fmovdne	%icc,	%f5,	%f15
	fmovdgu	%icc,	%f11,	%f6
	array16	%o0,	%i5,	%o6
	addc	%l4,	%l3,	%g5
	movneg	%icc,	%o7,	%o4
	for	%f12,	%f12,	%f0
	mova	%xcc,	%g4,	%i3
	srlx	%i2,	%g1,	%o3
	udivcc	%g2,	0x0F59,	%i1
	edge8ln	%l5,	%o5,	%l6
	stx	%g6,	[%l7 + 0x28]
	sra	%i7,	%l0,	%g3
	std	%f12,	[%l7 + 0x70]
	edge16ln	%l1,	%i6,	%o2
	edge32ln	%o1,	%i0,	%g7
	edge32n	%l2,	%o0,	%i4
	save %o6, 0x0BD1, %i5
	for	%f12,	%f4,	%f6
	movle	%xcc,	%l4,	%l3
	lduh	[%l7 + 0x46],	%g5
	lduh	[%l7 + 0x16],	%o7
	mulx	%o4,	0x168E,	%g4
	add	%i3,	%g1,	%i2
	movrlez	%o3,	%g2,	%l5
	fcmpd	%fcc1,	%f0,	%f12
	edge32ln	%o5,	%l6,	%g6
	fmovdle	%xcc,	%f11,	%f6
	restore %i1, %l0, %i7
	ldub	[%l7 + 0x3D],	%l1
	orncc	%i6,	%o2,	%g3
	addccc	%o1,	%g7,	%l2
	umul	%i0,	0x147A,	%o0
	st	%f0,	[%l7 + 0x64]
	subcc	%o6,	0x19A8,	%i4
	ldx	[%l7 + 0x58],	%i5
	movvc	%icc,	%l3,	%g5
	fcmple32	%f6,	%f8,	%o7
	srl	%o4,	%l4,	%i3
	lduh	[%l7 + 0x40],	%g1
	fmovsvc	%xcc,	%f14,	%f0
	add	%g4,	0x0622,	%o3
	srlx	%g2,	0x08,	%l5
	fpsub16s	%f8,	%f3,	%f13
	udivcc	%o5,	0x1B9E,	%l6
	orncc	%g6,	0x117C,	%i2
	fmovdpos	%xcc,	%f13,	%f1
	ld	[%l7 + 0x68],	%f13
	movpos	%xcc,	%l0,	%i7
	sethi	0x0353,	%i1
	umul	%l1,	%o2,	%g3
	fnot1s	%f5,	%f12
	edge8n	%o1,	%i6,	%l2
	popc	%i0,	%g7
	fpsub16s	%f1,	%f13,	%f13
	fnot1	%f12,	%f6
	movleu	%icc,	%o6,	%o0
	movgu	%icc,	%i5,	%l3
	fornot2s	%f8,	%f7,	%f15
	addc	%g5,	0x0B81,	%i4
	movvc	%icc,	%o4,	%l4
	ldsb	[%l7 + 0x10],	%o7
	lduw	[%l7 + 0x70],	%i3
	orcc	%g4,	0x1206,	%g1
	sdiv	%o3,	0x0143,	%l5
	andncc	%g2,	%l6,	%o5
	fnegd	%f2,	%f14
	movg	%xcc,	%g6,	%l0
	stw	%i7,	[%l7 + 0x40]
	subcc	%i1,	%l1,	%o2
	sllx	%g3,	%o1,	%i2
	and	%l2,	%i0,	%i6
	andn	%o6,	0x0633,	%o0
	orn	%g7,	0x1F1B,	%i5
	srl	%l3,	0x00,	%g5
	stx	%i4,	[%l7 + 0x48]
	movcc	%icc,	%o4,	%l4
	xor	%i3,	0x0ABA,	%o7
	subc	%g4,	0x184A,	%g1
	ldsw	[%l7 + 0x74],	%l5
	subc	%g2,	0x124B,	%l6
	fmovrse	%o3,	%f3,	%f11
	array16	%g6,	%l0,	%o5
	fandnot2s	%f15,	%f14,	%f9
	stb	%i1,	[%l7 + 0x27]
	sethi	0x1BA8,	%l1
	xor	%i7,	%o2,	%g3
	ldd	[%l7 + 0x48],	%i2
	movge	%icc,	%o1,	%i0
	stx	%i6,	[%l7 + 0x48]
	fmovrdgz	%l2,	%f2,	%f8
	edge8	%o0,	%o6,	%g7
	movcc	%icc,	%l3,	%g5
	restore %i5, %i4, %l4
	ldd	[%l7 + 0x70],	%f10
	sub	%i3,	%o4,	%o7
	edge32ln	%g1,	%g4,	%g2
	edge8l	%l6,	%l5,	%o3
	ldd	[%l7 + 0x50],	%l0
	stb	%g6,	[%l7 + 0x49]
	ldsh	[%l7 + 0x28],	%o5
	andncc	%l1,	%i1,	%i7
	andcc	%g3,	%i2,	%o1
	umulcc	%i0,	0x1FAC,	%o2
	sdiv	%i6,	0x0F18,	%l2
	movg	%xcc,	%o0,	%o6
	ldsb	[%l7 + 0x32],	%g7
	umulcc	%g5,	0x07BE,	%i5
	save %i4, 0x17B9, %l4
	orn	%i3,	%o4,	%l3
	xnorcc	%o7,	0x1209,	%g1
	sethi	0x1E5E,	%g2
	xor	%g4,	%l5,	%o3
	srl	%l6,	%l0,	%o5
	umul	%g6,	0x14B2,	%l1
	movge	%xcc,	%i1,	%g3
	movrgez	%i2,	0x2C0,	%i7
	udiv	%o1,	0x14EB,	%i0
	movn	%xcc,	%o2,	%l2
	movrgez	%o0,	%o6,	%g7
	udiv	%i6,	0x1DAC,	%i5
	movn	%icc,	%i4,	%l4
	movrlez	%i3,	%o4,	%g5
	umulcc	%o7,	0x1C46,	%l3
	subccc	%g2,	0x1DC5,	%g4
	ldsw	[%l7 + 0x20],	%g1
	edge8n	%l5,	%o3,	%l0
	edge32l	%o5,	%g6,	%l1
	udiv	%i1,	0x0E2D,	%l6
	movne	%icc,	%g3,	%i2
	array8	%o1,	%i7,	%i0
	sethi	0x04BF,	%o2
	edge32l	%o0,	%o6,	%g7
	st	%f8,	[%l7 + 0x70]
	movneg	%icc,	%l2,	%i6
	movgu	%xcc,	%i4,	%i5
	edge32n	%i3,	%l4,	%g5
	movrgz	%o7,	%l3,	%o4
	ldsh	[%l7 + 0x0A],	%g4
	mova	%icc,	%g1,	%l5
	movcc	%icc,	%g2,	%l0
	fmovrdlez	%o3,	%f12,	%f0
	movrgz	%g6,	%l1,	%o5
	movcs	%icc,	%l6,	%g3
	edge16n	%i1,	%o1,	%i2
	movvs	%icc,	%i0,	%o2
	move	%icc,	%o0,	%i7
	subccc	%o6,	%g7,	%i6
	addcc	%l2,	0x1649,	%i4
	udiv	%i3,	0x0BC9,	%i5
	fmovspos	%icc,	%f10,	%f13
	ldx	[%l7 + 0x20],	%g5
	fnegd	%f2,	%f8
	fnand	%f6,	%f8,	%f10
	fxnors	%f11,	%f10,	%f15
	movneg	%icc,	%o7,	%l4
	udiv	%o4,	0x02D6,	%l3
	alignaddrl	%g1,	%g4,	%g2
	orncc	%l5,	%l0,	%g6
	movvs	%icc,	%o3,	%o5
	fmovdne	%icc,	%f2,	%f5
	sub	%l6,	0x1B39,	%g3
	fmovsa	%icc,	%f0,	%f14
	stx	%i1,	[%l7 + 0x60]
	fpsub32s	%f5,	%f3,	%f9
	edge32l	%o1,	%l1,	%i2
	movre	%i0,	0x2CE,	%o0
	edge16l	%o2,	%i7,	%o6
	edge8ln	%g7,	%i6,	%l2
	xnorcc	%i4,	0x0DE1,	%i5
	udivx	%i3,	0x1343,	%g5
	and	%l4,	%o4,	%l3
	srlx	%o7,	0x11,	%g1
	array8	%g2,	%g4,	%l5
	andn	%g6,	0x07DF,	%o3
	edge32ln	%l0,	%l6,	%o5
	movl	%icc,	%g3,	%o1
	fmovrse	%l1,	%f7,	%f2
	sdiv	%i1,	0x1D50,	%i0
	sllx	%o0,	%i2,	%i7
	ldd	[%l7 + 0x60],	%f4
	movl	%xcc,	%o2,	%g7
	fmuld8ulx16	%f1,	%f8,	%f0
	edge32	%i6,	%o6,	%l2
	array8	%i4,	%i5,	%i3
	stw	%g5,	[%l7 + 0x64]
	andcc	%o4,	0x0945,	%l3
	udiv	%o7,	0x12C8,	%g1
	movrlz	%l4,	0x299,	%g4
	fmovrdlez	%g2,	%f14,	%f10
	subccc	%g6,	%o3,	%l0
	edge8l	%l5,	%l6,	%g3
	edge32l	%o5,	%o1,	%l1
	add	%i0,	%i1,	%i2
	movvs	%xcc,	%i7,	%o0
	ld	[%l7 + 0x34],	%f8
	sethi	0x1B55,	%g7
	fmovd	%f4,	%f12
	mulx	%o2,	%i6,	%o6
	sethi	0x1A2F,	%i4
	sdiv	%i5,	0x1A2B,	%i3
	movcs	%icc,	%g5,	%l2
	sra	%o4,	%o7,	%l3
	fmovsleu	%icc,	%f5,	%f4
	fmul8x16au	%f9,	%f12,	%f6
	edge32l	%l4,	%g1,	%g2
	fmovdl	%xcc,	%f8,	%f10
	fmovdcs	%xcc,	%f0,	%f11
	sub	%g6,	0x0D08,	%o3
	movne	%xcc,	%l0,	%g4
	stw	%l6,	[%l7 + 0x60]
	subc	%g3,	0x1C6A,	%o5
	fpsub32s	%f0,	%f15,	%f15
	alignaddr	%l5,	%l1,	%o1
	movn	%xcc,	%i1,	%i2
	fmovdvs	%xcc,	%f7,	%f15
	umulcc	%i7,	0x0F2E,	%i0
	ldsh	[%l7 + 0x52],	%o0
	fnands	%f5,	%f5,	%f4
	edge8l	%o2,	%g7,	%i6
	stx	%o6,	[%l7 + 0x40]
	sll	%i4,	0x15,	%i5
	restore %g5, 0x057F, %l2
	sdiv	%i3,	0x0FBA,	%o4
	subcc	%l3,	0x1185,	%l4
	array8	%g1,	%o7,	%g2
	orn	%g6,	0x111C,	%l0
	move	%xcc,	%g4,	%o3
	orncc	%l6,	0x1194,	%g3
	fmovdge	%xcc,	%f0,	%f7
	xnorcc	%l5,	%o5,	%l1
	save %i1, %o1, %i2
	movgu	%xcc,	%i7,	%i0
	fsrc2	%f10,	%f0
	ldsb	[%l7 + 0x3D],	%o2
	fzero	%f12
	sdiv	%o0,	0x0626,	%g7
	udivcc	%o6,	0x1C90,	%i6
	edge16ln	%i4,	%g5,	%l2
	srax	%i3,	%o4,	%l3
	movcc	%icc,	%i5,	%l4
	fpadd16s	%f5,	%f11,	%f7
	move	%xcc,	%g1,	%g2
	edge8ln	%g6,	%o7,	%g4
	fmul8x16al	%f8,	%f13,	%f0
	popc	0x0BD5,	%o3
	fmovrse	%l0,	%f8,	%f13
	stb	%l6,	[%l7 + 0x35]
	movge	%xcc,	%l5,	%g3
	srl	%o5,	%l1,	%i1
	movge	%xcc,	%i2,	%o1
	movneg	%icc,	%i7,	%o2
	andcc	%o0,	%i0,	%g7
	fornot1	%f8,	%f0,	%f10
	ldx	[%l7 + 0x70],	%i6
	sllx	%o6,	%g5,	%i4
	array32	%l2,	%o4,	%i3
	orncc	%i5,	0x0577,	%l3
	movcc	%xcc,	%g1,	%l4
	srl	%g6,	0x0D,	%g2
	fcmple32	%f6,	%f10,	%o7
	movcs	%xcc,	%o3,	%g4
	ldd	[%l7 + 0x40],	%i6
	orn	%l5,	%l0,	%o5
	ldsb	[%l7 + 0x46],	%g3
	srl	%i1,	0x01,	%l1
	mulx	%o1,	0x0AB8,	%i2
	movrgz	%o2,	0x051,	%i7
	ldub	[%l7 + 0x72],	%i0
	add	%g7,	0x16BB,	%i6
	fpack16	%f0,	%f1
	std	%f6,	[%l7 + 0x20]
	fmovdl	%xcc,	%f12,	%f3
	mulx	%o6,	0x1C9D,	%o0
	addcc	%i4,	0x1DAA,	%g5
	orncc	%l2,	0x1315,	%i3
	fmovdne	%xcc,	%f13,	%f10
	sdiv	%o4,	0x0CB1,	%i5
	edge16l	%g1,	%l3,	%g6
	restore %l4, %g2, %o7
	edge8l	%g4,	%l6,	%o3
	lduh	[%l7 + 0x5A],	%l5
	movleu	%xcc,	%l0,	%o5
	sth	%i1,	[%l7 + 0x32]
	orncc	%l1,	%o1,	%i2
	orncc	%g3,	0x1B46,	%i7
	alignaddrl	%i0,	%g7,	%i6
	fmul8x16	%f13,	%f2,	%f10
	movpos	%icc,	%o6,	%o0
	and	%o2,	0x1DDF,	%g5
	edge32l	%l2,	%i4,	%o4
	ld	[%l7 + 0x64],	%f14
	edge16ln	%i3,	%i5,	%g1
	fmovdge	%xcc,	%f11,	%f8
	popc	%g6,	%l4
	sdivx	%l3,	0x1075,	%o7
	movge	%icc,	%g4,	%g2
	std	%f6,	[%l7 + 0x68]
	edge16	%o3,	%l5,	%l0
	move	%xcc,	%l6,	%i1
	lduh	[%l7 + 0x78],	%o5
	edge32l	%l1,	%o1,	%g3
	movre	%i2,	0x35D,	%i0
	mulscc	%i7,	0x0FD1,	%i6
	ld	[%l7 + 0x34],	%f10
	fmovsgu	%icc,	%f3,	%f8
	addcc	%o6,	%o0,	%o2
	fmovdn	%icc,	%f13,	%f13
	fmovdcs	%icc,	%f4,	%f12
	srax	%g7,	0x13,	%g5
	stx	%l2,	[%l7 + 0x10]
	fmovse	%icc,	%f12,	%f8
	or	%o4,	0x0938,	%i4
	movn	%icc,	%i5,	%g1
	pdist	%f8,	%f2,	%f10
	edge8	%g6,	%i3,	%l4
	orncc	%l3,	%o7,	%g4
	orncc	%g2,	0x1957,	%o3
	fmovspos	%xcc,	%f15,	%f14
	movneg	%icc,	%l5,	%l6
	edge32ln	%l0,	%i1,	%l1
	edge16ln	%o5,	%g3,	%o1
	fmovdle	%icc,	%f6,	%f10
	movneg	%icc,	%i2,	%i0
	movne	%xcc,	%i6,	%o6
	srlx	%i7,	%o2,	%o0
	fmovse	%icc,	%f1,	%f12
	movrne	%g5,	%l2,	%g7
	fornot1s	%f10,	%f12,	%f13
	sth	%o4,	[%l7 + 0x5A]
	umul	%i5,	%g1,	%g6
	fandnot1s	%f5,	%f0,	%f2
	orcc	%i4,	0x1DC1,	%i3
	and	%l3,	%l4,	%o7
	umul	%g2,	0x0D9B,	%o3
	movvs	%icc,	%g4,	%l5
	fcmpne32	%f10,	%f12,	%l0
	addc	%l6,	0x0BD6,	%l1
	sth	%o5,	[%l7 + 0x0C]
	orn	%i1,	%g3,	%o1
	edge8	%i0,	%i2,	%i6
	edge16l	%o6,	%o2,	%o0
	fnegs	%f14,	%f10
	srax	%g5,	%l2,	%i7
	fpackfix	%f6,	%f10
	edge8n	%o4,	%i5,	%g7
	stw	%g1,	[%l7 + 0x1C]
	sll	%g6,	0x01,	%i3
	mulx	%l3,	%l4,	%i4
	udivx	%g2,	0x13C6,	%o7
	and	%o3,	0x0FC3,	%l5
	movcc	%xcc,	%l0,	%g4
	movge	%xcc,	%l6,	%l1
	movge	%icc,	%o5,	%g3
	movrlz	%o1,	0x13C,	%i1
	fnegd	%f4,	%f6
	smul	%i0,	0x0973,	%i6
	sth	%o6,	[%l7 + 0x2C]
	srax	%i2,	0x12,	%o0
	umul	%g5,	%l2,	%o2
	ldd	[%l7 + 0x50],	%i6
	stw	%o4,	[%l7 + 0x68]
	stx	%g7,	[%l7 + 0x58]
	andcc	%i5,	%g6,	%i3
	smul	%g1,	%l4,	%l3
	fmovdneg	%xcc,	%f9,	%f15
	fmul8x16au	%f0,	%f4,	%f2
	for	%f14,	%f6,	%f4
	fmovrdgz	%g2,	%f12,	%f8
	movpos	%icc,	%o7,	%o3
	ldsw	[%l7 + 0x74],	%l5
	movg	%xcc,	%i4,	%l0
	fxors	%f15,	%f2,	%f13
	sdivcc	%g4,	0x146F,	%l1
	ldub	[%l7 + 0x3B],	%l6
	fcmple32	%f10,	%f12,	%g3
	ldsh	[%l7 + 0x3E],	%o1
	smulcc	%o5,	0x0EEF,	%i0
	xnor	%i6,	0x00F5,	%i1
	subcc	%i2,	0x14A9,	%o0
	ldsw	[%l7 + 0x54],	%g5
	andncc	%o6,	%l2,	%o2
	and	%i7,	%o4,	%g7
	andcc	%i5,	%i3,	%g1
	alignaddrl	%g6,	%l3,	%l4
	fmovsg	%xcc,	%f14,	%f14
	edge16l	%g2,	%o3,	%o7
	array32	%l5,	%l0,	%g4
	edge8ln	%l1,	%i4,	%g3
	ld	[%l7 + 0x6C],	%f15
	fmovdcs	%icc,	%f7,	%f11
	fpackfix	%f0,	%f1
	sdiv	%o1,	0x1310,	%o5
	movneg	%icc,	%i0,	%l6
	fmovse	%xcc,	%f5,	%f15
	fabss	%f3,	%f7
	and	%i6,	%i2,	%i1
	edge32ln	%o0,	%g5,	%o6
	fmovdl	%icc,	%f4,	%f1
	orcc	%l2,	0x1A2D,	%i7
	movn	%xcc,	%o2,	%o4
	array16	%i5,	%i3,	%g7
	xnor	%g6,	%g1,	%l4
	sra	%l3,	0x1F,	%g2
	movre	%o3,	%l5,	%o7
	udivcc	%l0,	0x003E,	%g4
	subc	%i4,	%g3,	%l1
	movg	%icc,	%o5,	%o1
	fcmple32	%f12,	%f0,	%l6
	sub	%i0,	0x0778,	%i2
	movneg	%xcc,	%i1,	%o0
	srax	%g5,	%i6,	%o6
	udiv	%i7,	0x0313,	%l2
	movleu	%icc,	%o4,	%o2
	stw	%i5,	[%l7 + 0x24]
	lduw	[%l7 + 0x2C],	%g7
	movvs	%xcc,	%g6,	%g1
	movrlz	%i3,	0x1F7,	%l4
	movrne	%g2,	0x0AA,	%l3
	fexpand	%f9,	%f2
	std	%f8,	[%l7 + 0x68]
	sllx	%l5,	0x0F,	%o3
	movg	%xcc,	%l0,	%g4
	ldd	[%l7 + 0x78],	%o6
	movrlez	%g3,	0x174,	%l1
	movpos	%xcc,	%i4,	%o5
	edge32ln	%o1,	%l6,	%i0
	fcmple32	%f8,	%f0,	%i2
	ldd	[%l7 + 0x68],	%o0
	fmovrdgez	%i1,	%f4,	%f6
	and	%i6,	0x0872,	%o6
	fcmpes	%fcc0,	%f12,	%f13
	fandnot2	%f12,	%f0,	%f8
	fexpand	%f1,	%f2
	edge16n	%g5,	%i7,	%l2
	srax	%o4,	%o2,	%i5
	smul	%g7,	%g6,	%i3
	fmovd	%f14,	%f8
	subcc	%g1,	0x0175,	%g2
	andcc	%l4,	0x05F8,	%l3
	edge32l	%o3,	%l0,	%g4
	edge8l	%l5,	%g3,	%o7
	sdivcc	%l1,	0x181A,	%o5
	udivcc	%o1,	0x07D9,	%l6
	sllx	%i0,	0x07,	%i4
	addc	%i2,	0x08A9,	%i1
	edge32l	%i6,	%o6,	%g5
	umul	%o0,	0x15A1,	%i7
	fmovscc	%xcc,	%f5,	%f12
	sll	%o4,	0x02,	%l2
	subc	%o2,	%g7,	%g6
	subccc	%i5,	%g1,	%i3
	popc	%g2,	%l4
	fornot2s	%f12,	%f8,	%f14
	edge16l	%o3,	%l3,	%l0
	movneg	%icc,	%g4,	%g3
	udivcc	%l5,	0x1680,	%l1
	ldsh	[%l7 + 0x30],	%o7
	add	%o1,	0x16FF,	%o5
	movre	%l6,	0x098,	%i0
	fmovscs	%icc,	%f13,	%f14
	movrne	%i4,	%i1,	%i6
	subccc	%i2,	0x0EDA,	%g5
	popc	0x0AD9,	%o6
	movgu	%icc,	%o0,	%o4
	orn	%l2,	%o2,	%g7
	orn	%i7,	0x1069,	%i5
	movvc	%xcc,	%g6,	%g1
	edge8l	%g2,	%i3,	%l4
	movgu	%icc,	%l3,	%l0
	ldub	[%l7 + 0x0A],	%g4
	srlx	%o3,	%l5,	%l1
	fpsub16s	%f1,	%f7,	%f4
	edge16n	%g3,	%o7,	%o1
	fmovrsgz	%o5,	%f11,	%f2
	fnors	%f6,	%f14,	%f14
	fmovrsgez	%i0,	%f10,	%f14
	fnot2s	%f12,	%f1
	srax	%l6,	0x08,	%i1
	subcc	%i6,	0x1BF0,	%i4
	ldsw	[%l7 + 0x58],	%i2
	edge16ln	%o6,	%g5,	%o0
	edge8ln	%o4,	%l2,	%o2
	array16	%g7,	%i7,	%g6
	edge16	%i5,	%g2,	%g1
	movrlez	%i3,	0x135,	%l4
	fmovrdlez	%l3,	%f0,	%f8
	fpadd16	%f4,	%f8,	%f6
	subcc	%g4,	%o3,	%l5
	edge16l	%l1,	%g3,	%l0
	orncc	%o7,	%o5,	%o1
	fmovsn	%icc,	%f2,	%f1
	mulx	%l6,	0x0A8A,	%i0
	movcc	%icc,	%i6,	%i4
	fpadd32	%f10,	%f14,	%f2
	fmovdneg	%icc,	%f0,	%f10
	movne	%icc,	%i2,	%i1
	edge16ln	%g5,	%o6,	%o0
	fmovsne	%icc,	%f12,	%f9
	array16	%o4,	%l2,	%g7
	or	%i7,	0x043A,	%o2
	alignaddrl	%g6,	%g2,	%g1
	movleu	%icc,	%i5,	%i3
	smul	%l3,	%g4,	%l4
	movre	%o3,	%l1,	%l5
	ldub	[%l7 + 0x5C],	%g3
	lduw	[%l7 + 0x70],	%o7
	ld	[%l7 + 0x28],	%f6
	srlx	%l0,	0x04,	%o1
	fcmpne32	%f12,	%f12,	%o5
	subcc	%l6,	0x0CB9,	%i0
	addcc	%i6,	%i4,	%i1
	movre	%i2,	0x26A,	%o6
	movne	%icc,	%o0,	%g5
	fmovdle	%xcc,	%f10,	%f9
	movvs	%icc,	%l2,	%g7
	movleu	%xcc,	%o4,	%i7
	movrgez	%o2,	%g6,	%g1
	ldsw	[%l7 + 0x24],	%i5
	movcc	%xcc,	%g2,	%i3
	edge8n	%g4,	%l3,	%o3
	ldsw	[%l7 + 0x4C],	%l1
	edge32n	%l5,	%g3,	%o7
	ldd	[%l7 + 0x70],	%l4
	fnors	%f7,	%f1,	%f2
	fmovsn	%icc,	%f7,	%f6
	ldd	[%l7 + 0x70],	%l0
	lduh	[%l7 + 0x6E],	%o1
	sethi	0x159B,	%o5
	sll	%l6,	0x1C,	%i0
	alignaddrl	%i6,	%i4,	%i2
	udivx	%o6,	0x063C,	%o0
	movleu	%icc,	%g5,	%i1
	lduh	[%l7 + 0x30],	%g7
	edge8	%l2,	%i7,	%o2
	movre	%g6,	0x126,	%o4
	movrlez	%g1,	%g2,	%i5
	fmovsge	%xcc,	%f7,	%f6
	movrne	%g4,	0x29A,	%l3
	edge32n	%o3,	%l1,	%l5
	ldsh	[%l7 + 0x0C],	%g3
	udivx	%i3,	0x15CD,	%l4
	srlx	%l0,	%o1,	%o5
	movcs	%xcc,	%o7,	%i0
	fmovdge	%icc,	%f6,	%f0
	fpsub16s	%f1,	%f7,	%f15
	addc	%i6,	0x1F75,	%l6
	siam	0x5
	andn	%i4,	0x0541,	%o6
	orncc	%o0,	%i2,	%i1
	for	%f12,	%f10,	%f0
	movvs	%icc,	%g5,	%g7
	movvs	%xcc,	%l2,	%i7
	ldsh	[%l7 + 0x78],	%o2
	addccc	%g6,	%g1,	%o4
	array32	%g2,	%i5,	%g4
	fpack32	%f2,	%f14,	%f12
	movgu	%xcc,	%o3,	%l1
	movvc	%xcc,	%l3,	%l5
	orn	%i3,	%l4,	%g3
	fxnors	%f2,	%f9,	%f10
	ld	[%l7 + 0x44],	%f3
	lduh	[%l7 + 0x66],	%l0
	xor	%o1,	%o7,	%o5
	fandnot1s	%f6,	%f4,	%f14
	movle	%icc,	%i6,	%l6
	edge8	%i0,	%i4,	%o6
	sub	%o0,	0x1CF2,	%i2
	edge16ln	%i1,	%g7,	%g5
	fmovd	%f6,	%f14
	subc	%i7,	0x054A,	%o2
	edge8l	%l2,	%g6,	%o4
	fcmpd	%fcc3,	%f14,	%f12
	fpack16	%f14,	%f6
	subc	%g1,	%g2,	%g4
	addccc	%i5,	%o3,	%l1
	lduw	[%l7 + 0x64],	%l5
	movvc	%icc,	%l3,	%l4
	siam	0x3
	fors	%f8,	%f7,	%f13
	fmovse	%xcc,	%f14,	%f11
	fcmple32	%f0,	%f10,	%g3
	xor	%i3,	0x0318,	%l0
	subc	%o7,	0x126F,	%o5
	std	%f6,	[%l7 + 0x70]
	edge16l	%o1,	%i6,	%i0
	edge32ln	%i4,	%l6,	%o0
	edge16ln	%o6,	%i1,	%g7
	fand	%f8,	%f8,	%f0
	edge32n	%g5,	%i7,	%o2
	std	%f12,	[%l7 + 0x48]
	fcmpne32	%f12,	%f12,	%l2
	stx	%i2,	[%l7 + 0x70]
	movrgz	%g6,	0x1B2,	%o4
	fcmpd	%fcc0,	%f8,	%f10
	movleu	%icc,	%g1,	%g2
	ld	[%l7 + 0x74],	%f11
	umul	%g4,	%i5,	%o3
	and	%l1,	0x1790,	%l3
	edge16n	%l5,	%l4,	%i3
	fmul8x16	%f3,	%f8,	%f12
	sra	%l0,	%g3,	%o5
	and	%o7,	%i6,	%o1
	array32	%i0,	%l6,	%o0
	movrgz	%o6,	%i4,	%g7
	srl	%i1,	0x12,	%g5
	umul	%i7,	0x043A,	%o2
	fmovse	%xcc,	%f9,	%f1
	umul	%i2,	%l2,	%o4
	popc	%g1,	%g2
	fmovd	%f4,	%f14
	movvs	%icc,	%g4,	%g6
	movrgz	%o3,	%l1,	%l3
	fmovdne	%xcc,	%f2,	%f4
	addc	%l5,	%i5,	%l4
	movgu	%xcc,	%i3,	%l0
	sra	%o5,	%o7,	%i6
	movpos	%icc,	%o1,	%i0
	movge	%icc,	%l6,	%g3
	alignaddrl	%o0,	%i4,	%g7
	fmovdleu	%icc,	%f11,	%f9
	srax	%i1,	0x07,	%o6
	movpos	%xcc,	%i7,	%g5
	sdivx	%i2,	0x0D08,	%o2
	movrlez	%l2,	%o4,	%g2
	or	%g1,	0x1826,	%g4
	fmovsneg	%icc,	%f10,	%f2
	array32	%g6,	%l1,	%o3
	umul	%l5,	0x1F13,	%l3
	srl	%i5,	%i3,	%l4
	movn	%icc,	%l0,	%o7
	movl	%icc,	%o5,	%i6
	array8	%o1,	%l6,	%i0
	restore %g3, 0x0A5F, %i4
	subcc	%g7,	%o0,	%o6
	subcc	%i1,	0x0201,	%i7
	sdivcc	%i2,	0x0CEE,	%g5
	xor	%o2,	%o4,	%g2
	movgu	%xcc,	%g1,	%g4
	subc	%g6,	0x12E3,	%l2
	fornot1s	%f1,	%f5,	%f3
	fpadd16	%f2,	%f10,	%f12
	edge16n	%l1,	%l5,	%l3
	lduh	[%l7 + 0x22],	%o3
	fmovda	%icc,	%f0,	%f4
	xorcc	%i3,	%l4,	%l0
	fmovrdgz	%i5,	%f0,	%f10
	mulx	%o7,	%i6,	%o5
	ldsh	[%l7 + 0x5A],	%o1
	edge32l	%i0,	%l6,	%i4
	fmovrsgz	%g7,	%f8,	%f1
	movn	%xcc,	%o0,	%o6
	fpadd16s	%f15,	%f0,	%f6
	stb	%i1,	[%l7 + 0x6B]
	fpsub32	%f2,	%f14,	%f4
	addc	%i7,	0x1041,	%i2
	sethi	0x031B,	%g5
	ldd	[%l7 + 0x10],	%f2
	fcmpd	%fcc0,	%f8,	%f14
	fmul8x16	%f12,	%f10,	%f2
	orcc	%o2,	%g3,	%g2
	movpos	%icc,	%o4,	%g4
	edge32n	%g6,	%l2,	%g1
	srl	%l1,	%l5,	%l3
	xorcc	%o3,	0x1B43,	%i3
	fcmpgt32	%f4,	%f10,	%l0
	addccc	%l4,	0x17D9,	%o7
	edge32l	%i6,	%i5,	%o1
	sll	%i0,	0x16,	%l6
	smul	%i4,	%g7,	%o5
	fornot1s	%f5,	%f4,	%f0
	andcc	%o0,	%i1,	%i7
	orcc	%i2,	%g5,	%o6
	movcs	%xcc,	%o2,	%g2
	movne	%xcc,	%g3,	%o4
	fmovsge	%icc,	%f13,	%f7
	subc	%g4,	%g6,	%l2
	fcmpne32	%f4,	%f8,	%g1
	andcc	%l5,	%l3,	%l1
	ldub	[%l7 + 0x74],	%o3
	fnors	%f8,	%f14,	%f15
	fxnor	%f12,	%f4,	%f4
	sth	%l0,	[%l7 + 0x3C]
	alignaddrl	%i3,	%l4,	%o7
	ldsb	[%l7 + 0x27],	%i6
	xnor	%o1,	%i0,	%i5
	fxor	%f8,	%f8,	%f14
	sth	%l6,	[%l7 + 0x12]
	fmul8ulx16	%f14,	%f14,	%f0
	fpadd32s	%f4,	%f6,	%f10
	sub	%g7,	%i4,	%o5
	array8	%o0,	%i1,	%i7
	fcmped	%fcc2,	%f12,	%f4
	alignaddrl	%i2,	%o6,	%o2
	fmovrsgz	%g5,	%f0,	%f7
	subc	%g2,	0x1E49,	%g3
	udiv	%o4,	0x027E,	%g4
	orcc	%l2,	0x0B1C,	%g6
	addc	%l5,	0x0000,	%l3
	movrne	%g1,	0x218,	%l1
	std	%f8,	[%l7 + 0x38]
	movrgez	%o3,	0x282,	%i3
	addc	%l4,	0x0DA7,	%o7
	fmuld8sux16	%f11,	%f5,	%f10
	andn	%l0,	%i6,	%o1
	subc	%i5,	%i0,	%l6
	ldd	[%l7 + 0x70],	%i4
	ldsw	[%l7 + 0x68],	%g7
	movrgz	%o0,	0x06C,	%i1
	movneg	%icc,	%o5,	%i7
	st	%f4,	[%l7 + 0x08]
	fsrc1s	%f8,	%f5
	srl	%i2,	%o2,	%o6
	ldsh	[%l7 + 0x70],	%g5
	fandnot1s	%f8,	%f0,	%f1
	ldd	[%l7 + 0x18],	%g2
	sll	%o4,	%g3,	%g4
	std	%f14,	[%l7 + 0x40]
	srax	%l2,	%l5,	%g6
	edge32l	%g1,	%l3,	%l1
	movrlez	%o3,	0x02F,	%l4
	fnot1	%f12,	%f10
	fmovdg	%xcc,	%f9,	%f12
	movcc	%icc,	%o7,	%i3
	movcs	%xcc,	%i6,	%o1
	movgu	%xcc,	%i5,	%i0
	subcc	%l6,	%l0,	%i4
	sethi	0x0DA5,	%o0
	fcmps	%fcc0,	%f7,	%f15
	fzero	%f10
	movl	%xcc,	%g7,	%o5
	addcc	%i7,	%i1,	%i2
	udivx	%o2,	0x1125,	%g5
	xnorcc	%g2,	%o4,	%g3
	sth	%o6,	[%l7 + 0x74]
	fmovdge	%icc,	%f1,	%f6
	fexpand	%f11,	%f14
	edge16l	%l2,	%l5,	%g4
	andcc	%g1,	%l3,	%g6
	restore %o3, 0x13AD, %l4
	movvs	%icc,	%l1,	%o7
	edge16l	%i6,	%i3,	%i5
	movvc	%xcc,	%o1,	%i0
	fzero	%f6
	addccc	%l0,	%i4,	%o0
	stx	%l6,	[%l7 + 0x48]
	ldsb	[%l7 + 0x59],	%o5
	movle	%xcc,	%i7,	%g7
	or	%i1,	%o2,	%g5
	edge8ln	%i2,	%g2,	%o4
	fmovsn	%xcc,	%f7,	%f11
	sdiv	%g3,	0x0394,	%o6
	sethi	0x1127,	%l2
	udivx	%g4,	0x1A03,	%g1
	fmovrslez	%l5,	%f12,	%f2
	xnorcc	%g6,	0x0C90,	%o3
	edge16l	%l3,	%l1,	%o7
	xnorcc	%i6,	%l4,	%i3
	movrlez	%o1,	%i0,	%i5
	ldx	[%l7 + 0x20],	%i4
	sub	%o0,	0x1669,	%l0
	fmovscc	%icc,	%f4,	%f1
	movle	%icc,	%o5,	%i7
	sllx	%g7,	0x02,	%l6
	edge16ln	%i1,	%g5,	%i2
	fnor	%f2,	%f4,	%f2
	array8	%o2,	%g2,	%o4
	fmovscc	%xcc,	%f3,	%f9
	alignaddr	%g3,	%o6,	%g4
	fmovda	%xcc,	%f11,	%f2
	edge8l	%l2,	%g1,	%l5
	edge32	%o3,	%g6,	%l1
	ldx	[%l7 + 0x20],	%l3
	mulscc	%i6,	%o7,	%l4
	movneg	%xcc,	%o1,	%i3
	popc	0x1A1C,	%i5
	movrlez	%i4,	%o0,	%l0
	sllx	%i0,	0x05,	%o5
	movcc	%xcc,	%g7,	%l6
	popc	0x1AC0,	%i7
	fzeros	%f6
	edge8	%g5,	%i2,	%o2
	movcc	%xcc,	%i1,	%g2
	stx	%g3,	[%l7 + 0x38]
	for	%f0,	%f14,	%f0
	srl	%o6,	0x02,	%g4
	movrlez	%l2,	0x3E6,	%g1
	edge32n	%l5,	%o4,	%o3
	edge32	%l1,	%g6,	%i6
	alignaddrl	%o7,	%l3,	%o1
	movne	%xcc,	%i3,	%i5
	move	%xcc,	%i4,	%l4
	fmovsn	%icc,	%f14,	%f8
	ldsw	[%l7 + 0x18],	%o0
	fmovdvs	%icc,	%f9,	%f1
	edge8n	%l0,	%i0,	%o5
	alignaddrl	%g7,	%i7,	%g5
	addc	%l6,	0x0C63,	%o2
	movge	%icc,	%i1,	%i2
	fnot2s	%f15,	%f10
	addc	%g3,	0x1213,	%g2
	andncc	%o6,	%g4,	%l2
	ldub	[%l7 + 0x18],	%g1
	fmovsle	%icc,	%f11,	%f11
	xorcc	%o4,	%o3,	%l5
	edge16n	%l1,	%g6,	%i6
	fmovdpos	%icc,	%f8,	%f0
	fcmpeq32	%f0,	%f12,	%o7
	srax	%o1,	%l3,	%i3
	smul	%i5,	0x0DA1,	%i4
	ldsh	[%l7 + 0x1E],	%o0
	edge16l	%l4,	%l0,	%o5
	st	%f3,	[%l7 + 0x48]
	std	%f10,	[%l7 + 0x20]
	mova	%icc,	%i0,	%i7
	ldsb	[%l7 + 0x6C],	%g7
	edge8n	%g5,	%l6,	%i1
	fpack16	%f14,	%f7
	fmovdcc	%icc,	%f7,	%f11
	fcmpeq32	%f4,	%f0,	%o2
	lduh	[%l7 + 0x4C],	%i2
	movvc	%icc,	%g2,	%g3
	std	%f2,	[%l7 + 0x68]
	fmovdpos	%icc,	%f5,	%f5
	movg	%icc,	%g4,	%l2
	ldsb	[%l7 + 0x24],	%g1
	fnegd	%f14,	%f12
	movg	%icc,	%o6,	%o3
	edge16	%l5,	%l1,	%g6
	pdist	%f2,	%f14,	%f14
	fornot1s	%f6,	%f4,	%f14
	addccc	%o4,	%o7,	%i6
	umul	%l3,	%i3,	%i5
	fmuld8ulx16	%f10,	%f13,	%f2
	fexpand	%f9,	%f14
	srlx	%o1,	0x12,	%o0
	array16	%i4,	%l0,	%o5
	xnor	%i0,	0x101E,	%i7
	fmovsa	%xcc,	%f1,	%f0
	fcmple32	%f8,	%f4,	%l4
	edge32l	%g5,	%g7,	%l6
	stx	%i1,	[%l7 + 0x78]
	movcc	%xcc,	%i2,	%o2
	movvs	%xcc,	%g3,	%g4
	edge16l	%g2,	%l2,	%o6
	orn	%g1,	%l5,	%l1
	udivx	%o3,	0x0E1B,	%o4
	popc	0x1E6B,	%g6
	fmovdne	%xcc,	%f9,	%f10
	move	%xcc,	%i6,	%l3
	fabsd	%f0,	%f6
	movrlz	%i3,	0x05C,	%o7
	sethi	0x1847,	%o1
	fmovdne	%icc,	%f8,	%f15
	fandnot2	%f10,	%f4,	%f14
	fmul8sux16	%f0,	%f12,	%f0
	or	%i5,	%i4,	%l0
	and	%o5,	%i0,	%i7
	array32	%o0,	%l4,	%g5
	sll	%l6,	0x04,	%g7
	xnor	%i1,	0x00FA,	%o2
	fmovrse	%i2,	%f10,	%f12
	andncc	%g3,	%g2,	%l2
	srlx	%o6,	0x13,	%g1
	movrlz	%l5,	%g4,	%o3
	fornot2	%f10,	%f10,	%f14
	fmovdgu	%icc,	%f4,	%f10
	udivcc	%o4,	0x1CCD,	%g6
	sdiv	%i6,	0x10EB,	%l3
	fnegd	%f6,	%f10
	srax	%l1,	%o7,	%i3
	movcs	%xcc,	%i5,	%o1
	orn	%i4,	0x1229,	%o5
	fmovrdlez	%l0,	%f6,	%f8
	xnor	%i0,	%o0,	%i7
	fpack16	%f4,	%f6
	fmovspos	%icc,	%f9,	%f11
	addcc	%g5,	%l4,	%l6
	edge32	%i1,	%g7,	%o2
	fpadd32s	%f2,	%f8,	%f7
	edge16l	%i2,	%g2,	%g3
	movle	%xcc,	%o6,	%g1
	alignaddr	%l5,	%l2,	%o3
	and	%g4,	0x0ED2,	%o4
	movrlz	%i6,	0x2AB,	%g6
	umul	%l3,	0x153C,	%o7
	edge8l	%i3,	%i5,	%l1
	movneg	%icc,	%o1,	%i4
	movcc	%icc,	%l0,	%i0
	movle	%xcc,	%o5,	%i7
	movl	%icc,	%g5,	%o0
	edge8ln	%l6,	%l4,	%g7
	fpack16	%f6,	%f2
	edge8	%o2,	%i2,	%i1
	addc	%g2,	%o6,	%g1
	fmovda	%icc,	%f9,	%f3
	movle	%xcc,	%g3,	%l2
	lduw	[%l7 + 0x08],	%l5
	addcc	%o3,	%g4,	%i6
	lduw	[%l7 + 0x10],	%g6
	std	%f8,	[%l7 + 0x70]
	fpadd16	%f2,	%f14,	%f2
	movcs	%xcc,	%o4,	%o7
	mulx	%i3,	0x02D0,	%i5
	fpadd32s	%f14,	%f11,	%f7
	xnor	%l3,	0x02BD,	%l1
	or	%i4,	0x0DB3,	%o1
	orcc	%l0,	0x1CA5,	%o5
	addcc	%i7,	%i0,	%o0
	ldsb	[%l7 + 0x53],	%g5
	sethi	0x11D9,	%l6
	smulcc	%g7,	0x0AA8,	%l4
	fmovdvc	%xcc,	%f11,	%f13
	sdiv	%i2,	0x0A8D,	%o2
	subc	%i1,	0x0D1E,	%g2
	addc	%g1,	%o6,	%g3
	addc	%l2,	0x0625,	%o3
	movl	%xcc,	%g4,	%l5
	stb	%g6,	[%l7 + 0x25]
	movcc	%icc,	%o4,	%o7
	array32	%i6,	%i5,	%i3
	ldsb	[%l7 + 0x5A],	%l1
	save %l3, 0x1981, %o1
	edge8l	%i4,	%o5,	%i7
	subcc	%i0,	0x0B70,	%o0
	stw	%l0,	[%l7 + 0x38]
	alignaddrl	%l6,	%g5,	%g7
	movcc	%xcc,	%l4,	%o2
	fmovdneg	%icc,	%f0,	%f8
	fcmpgt32	%f10,	%f12,	%i2
	stb	%i1,	[%l7 + 0x6F]
	fnand	%f6,	%f10,	%f8
	alignaddrl	%g1,	%g2,	%o6
	addc	%l2,	0x1D8A,	%o3
	save %g3, 0x008A, %l5
	orncc	%g6,	0x13B7,	%o4
	sub	%o7,	%g4,	%i5
	fmul8x16au	%f0,	%f14,	%f14
	srlx	%i6,	%l1,	%i3
	array8	%l3,	%o1,	%o5
	fmovsa	%xcc,	%f0,	%f4
	fmuld8ulx16	%f11,	%f0,	%f6
	movgu	%icc,	%i7,	%i4
	std	%f12,	[%l7 + 0x10]
	xnor	%o0,	0x109C,	%i0
	stx	%l0,	[%l7 + 0x50]
	orncc	%g5,	%g7,	%l6
	mova	%icc,	%o2,	%l4
	lduw	[%l7 + 0x3C],	%i1
	fnor	%f10,	%f10,	%f0
	fxor	%f2,	%f2,	%f14
	movvc	%xcc,	%i2,	%g1
	sub	%g2,	0x00B3,	%o6
	movrgz	%l2,	%g3,	%l5
	fnegd	%f6,	%f8
	array8	%g6,	%o4,	%o7
	fsrc1	%f12,	%f6
	movcs	%icc,	%o3,	%g4
	xorcc	%i5,	0x1C2B,	%i6
	addcc	%l1,	0x08E0,	%l3
	xnor	%i3,	%o1,	%o5
	fmovdn	%icc,	%f0,	%f8
	subc	%i7,	%o0,	%i0
	fmovspos	%icc,	%f10,	%f7
	fmovrdlz	%i4,	%f2,	%f12
	udivx	%l0,	0x0425,	%g7
	edge16l	%l6,	%g5,	%o2
	lduw	[%l7 + 0x24],	%l4
	movle	%icc,	%i1,	%i2
	addccc	%g2,	0x17E0,	%o6
	fnor	%f0,	%f6,	%f2
	addc	%g1,	%l2,	%l5
	popc	0x0C99,	%g6
	movleu	%icc,	%o4,	%g3
	edge16	%o7,	%g4,	%i5
	ldub	[%l7 + 0x77],	%o3
	sll	%i6,	%l1,	%l3
	alignaddrl	%i3,	%o5,	%i7
	edge16ln	%o0,	%o1,	%i0
	edge32n	%l0,	%g7,	%l6
	fmovdneg	%xcc,	%f4,	%f10
	movrgz	%g5,	0x049,	%o2
	xor	%i4,	0x1518,	%l4
	sth	%i2,	[%l7 + 0x3E]
	addc	%i1,	0x091F,	%g2
	edge32l	%g1,	%o6,	%l5
	ldx	[%l7 + 0x70],	%l2
	sth	%o4,	[%l7 + 0x10]
	edge32	%g6,	%o7,	%g3
	array32	%i5,	%o3,	%g4
	xnor	%i6,	%l1,	%l3
	st	%f15,	[%l7 + 0x6C]
	fcmpgt32	%f12,	%f10,	%i3
	srl	%o5,	0x1B,	%o0
	move	%icc,	%o1,	%i0
	move	%icc,	%l0,	%g7
	fmovd	%f4,	%f6
	move	%icc,	%i7,	%g5
	ldsb	[%l7 + 0x45],	%o2
	edge8n	%i4,	%l4,	%i2
	fmovrdlez	%l6,	%f10,	%f10
	xnorcc	%g2,	0x06A0,	%g1
	fpsub16s	%f10,	%f4,	%f6
	subccc	%i1,	%o6,	%l2
	and	%o4,	%g6,	%o7
	movl	%xcc,	%l5,	%i5
	fmovsge	%icc,	%f6,	%f9
	array8	%o3,	%g3,	%g4
	movcs	%xcc,	%i6,	%l3
	srax	%i3,	0x03,	%l1
	array32	%o5,	%o1,	%o0
	umulcc	%l0,	0x050E,	%i0
	lduw	[%l7 + 0x1C],	%g7
	stx	%i7,	[%l7 + 0x30]
	xor	%g5,	%i4,	%o2
	movrgez	%i2,	%l6,	%g2
	fmovdle	%xcc,	%f13,	%f7
	edge8n	%g1,	%l4,	%i1
	edge16	%o6,	%o4,	%g6
	edge32ln	%o7,	%l2,	%i5
	lduw	[%l7 + 0x40],	%o3
	movrgez	%g3,	0x398,	%g4
	udivx	%i6,	0x1AA0,	%l5
	edge32	%l3,	%l1,	%i3
	fmovdneg	%xcc,	%f7,	%f6
	andncc	%o1,	%o5,	%o0
	fmovdleu	%icc,	%f15,	%f12
	sth	%i0,	[%l7 + 0x16]
	array8	%l0,	%i7,	%g7
	movre	%g5,	%o2,	%i2
	xorcc	%l6,	%g2,	%i4
	movrlez	%l4,	%g1,	%o6
	restore %o4, %g6, %o7
	sra	%i1,	%l2,	%i5
	array16	%o3,	%g3,	%i6
	ldd	[%l7 + 0x68],	%f8
	movcc	%xcc,	%g4,	%l3
	ldsh	[%l7 + 0x28],	%l1
	edge8l	%l5,	%i3,	%o1
	fmovscs	%xcc,	%f1,	%f10
	fmovsl	%xcc,	%f3,	%f14
	fmovdg	%xcc,	%f15,	%f5
	ldub	[%l7 + 0x29],	%o0
	mulscc	%o5,	%i0,	%l0
	movrlez	%g7,	0x0E0,	%i7
	sllx	%g5,	%o2,	%l6
	ldsw	[%l7 + 0x64],	%g2
	movne	%icc,	%i4,	%l4
	edge16l	%g1,	%o6,	%i2
	edge16n	%g6,	%o4,	%o7
	sll	%i1,	0x0D,	%i5
	edge32	%o3,	%g3,	%i6
	ldsb	[%l7 + 0x68],	%g4
	smul	%l2,	0x0E4A,	%l3
	edge16	%l1,	%l5,	%o1
	st	%f4,	[%l7 + 0x7C]
	ldx	[%l7 + 0x38],	%i3
	movleu	%icc,	%o0,	%i0
	movneg	%xcc,	%o5,	%g7
	orncc	%i7,	%g5,	%l0
	fands	%f14,	%f9,	%f0
	stx	%o2,	[%l7 + 0x58]
	movrlez	%l6,	%g2,	%l4
	siam	0x6
	xnor	%i4,	0x00F4,	%o6
	and	%i2,	0x0AB3,	%g6
	fxnor	%f6,	%f14,	%f12
	edge32ln	%o4,	%g1,	%o7
	move	%icc,	%i1,	%o3
	fsrc2s	%f7,	%f1
	movl	%xcc,	%g3,	%i6
	add	%g4,	0x03B1,	%l2
	movpos	%icc,	%i5,	%l3
	or	%l1,	%l5,	%i3
	movpos	%xcc,	%o0,	%o1
	fcmple16	%f2,	%f12,	%o5
	movrgz	%i0,	%g7,	%i7
	ldsw	[%l7 + 0x18],	%g5
	fmovsge	%icc,	%f0,	%f4
	fzeros	%f11
	sra	%o2,	0x18,	%l0
	mulscc	%l6,	0x16D5,	%g2
	fpadd32s	%f4,	%f4,	%f15
	movleu	%icc,	%i4,	%l4
	xnor	%i2,	0x17BF,	%o6
	movrgz	%o4,	%g6,	%o7
	fone	%f4
	movg	%icc,	%g1,	%o3
	andn	%i1,	%i6,	%g3
	edge16	%l2,	%i5,	%g4
	smul	%l3,	%l5,	%i3
	fmovde	%icc,	%f9,	%f8
	movle	%icc,	%l1,	%o0
	fpsub16s	%f5,	%f13,	%f9
	movl	%xcc,	%o5,	%o1
	fmul8x16au	%f6,	%f3,	%f12
	alignaddrl	%g7,	%i7,	%i0
	edge16ln	%o2,	%g5,	%l0
	udivx	%g2,	0x1EE2,	%i4
	fmovsneg	%xcc,	%f6,	%f10
	fmovrse	%l6,	%f2,	%f10
	edge8ln	%l4,	%i2,	%o4
	edge32l	%g6,	%o6,	%o7
	movrlez	%g1,	0x3C2,	%i1
	sllx	%o3,	%i6,	%g3
	sllx	%i5,	0x04,	%l2
	umul	%g4,	0x1925,	%l3
	lduw	[%l7 + 0x18],	%l5
	movrlez	%l1,	0x1DD,	%i3
	fmovdleu	%xcc,	%f14,	%f8
	mulx	%o0,	%o5,	%o1
	edge8n	%g7,	%i0,	%i7
	umul	%g5,	%l0,	%g2
	movg	%icc,	%o2,	%i4
	movrlez	%l6,	0x0FF,	%i2
	udivx	%o4,	0x1276,	%l4
	movl	%icc,	%g6,	%o6
	edge32ln	%g1,	%i1,	%o7
	movvs	%icc,	%o3,	%g3
	movg	%icc,	%i5,	%l2
	movle	%xcc,	%i6,	%l3
	edge16l	%g4,	%l5,	%l1
	andn	%o0,	0x1864,	%i3
	edge8	%o5,	%g7,	%o1
	orncc	%i7,	0x1A77,	%i0
	andcc	%g5,	%l0,	%o2
	movcc	%xcc,	%g2,	%i4
	fmovrslez	%l6,	%f3,	%f14
	xnorcc	%o4,	%l4,	%g6
	array8	%i2,	%g1,	%o6
	movrgz	%i1,	0x151,	%o3
	fcmped	%fcc1,	%f12,	%f10
	subc	%o7,	%i5,	%g3
	edge8ln	%i6,	%l2,	%g4
	srlx	%l3,	%l5,	%l1
	restore %i3, %o5, %g7
	ldd	[%l7 + 0x50],	%o0
	lduw	[%l7 + 0x34],	%o0
	sdivx	%i7,	0x1BBF,	%g5
	alignaddr	%l0,	%i0,	%o2
	fornot2	%f2,	%f0,	%f10
	sdivcc	%g2,	0x0328,	%i4
	sll	%l6,	0x13,	%o4
	movl	%xcc,	%l4,	%i2
	edge16ln	%g1,	%g6,	%o6
	fors	%f5,	%f12,	%f0
	fcmpne32	%f0,	%f14,	%i1
	edge32n	%o3,	%o7,	%i5
	fpsub32	%f14,	%f8,	%f14
	mulx	%g3,	%i6,	%g4
	fmovdcs	%icc,	%f6,	%f15
	edge8n	%l2,	%l5,	%l1
	edge16ln	%i3,	%l3,	%g7
	movg	%xcc,	%o5,	%o1
	xnorcc	%o0,	%i7,	%l0
	xorcc	%i0,	0x00B1,	%o2
	stx	%g5,	[%l7 + 0x38]
	restore %i4, 0x1F42, %g2
	fmovrsgez	%l6,	%f12,	%f4
	orcc	%l4,	0x006F,	%o4
	xnorcc	%g1,	0x0154,	%g6
	andcc	%o6,	%i2,	%o3
	sub	%i1,	0x1250,	%o7
	srax	%i5,	0x13,	%g3
	smul	%i6,	%g4,	%l2
	edge32	%l5,	%l1,	%l3
	and	%g7,	%o5,	%i3
	srlx	%o0,	%o1,	%i7
	sra	%i0,	0x0E,	%o2
	fmovrdne	%l0,	%f4,	%f6
	fmovrdne	%g5,	%f10,	%f4
	mulscc	%i4,	%l6,	%g2
	movvs	%xcc,	%o4,	%g1
	fmovdvc	%icc,	%f3,	%f7
	edge16n	%g6,	%l4,	%i2
	fnands	%f15,	%f10,	%f13
	movre	%o6,	0x0E5,	%i1
	ldsb	[%l7 + 0x4E],	%o3
	bshuffle	%f8,	%f2,	%f6
	addccc	%i5,	%o7,	%i6
	addc	%g3,	%l2,	%l5
	subcc	%l1,	0x0A4B,	%g4
	fcmple32	%f6,	%f8,	%g7
	fxors	%f14,	%f1,	%f14
	xnor	%l3,	%i3,	%o0
	movg	%icc,	%o1,	%i7
	fandnot1	%f4,	%f4,	%f10
	movge	%xcc,	%o5,	%o2
	subc	%l0,	0x1917,	%i0
	array32	%g5,	%l6,	%g2
	addcc	%o4,	%g1,	%g6
	ldd	[%l7 + 0x28],	%f12
	mulx	%i4,	%i2,	%l4
	edge16ln	%o6,	%i1,	%i5
	movle	%xcc,	%o7,	%i6
	fandnot1s	%f15,	%f13,	%f11
	fcmped	%fcc3,	%f2,	%f2
	save %g3, 0x1C68, %l2
	edge8	%o3,	%l5,	%g4
	orncc	%l1,	%g7,	%l3
	or	%o0,	%o1,	%i7
	movn	%xcc,	%o5,	%o2
	movrlz	%l0,	0x3F2,	%i3
	xor	%g5,	%i0,	%g2
	sra	%l6,	0x16,	%o4
	edge16	%g1,	%i4,	%g6
	fmovdle	%icc,	%f6,	%f12
	movle	%xcc,	%i2,	%l4
	fmovs	%f4,	%f12
	movge	%xcc,	%o6,	%i1
	popc	0x1187,	%i5
	subcc	%i6,	0x0745,	%g3
	movne	%icc,	%o7,	%o3
	bshuffle	%f4,	%f6,	%f8
	movneg	%xcc,	%l5,	%l2
	alignaddrl	%g4,	%l1,	%l3
	fcmpeq16	%f2,	%f10,	%o0
	lduw	[%l7 + 0x7C],	%o1
	movneg	%xcc,	%g7,	%o5
	edge16n	%o2,	%i7,	%l0
	smulcc	%i3,	%i0,	%g5
	sethi	0x13CA,	%l6
	stw	%g2,	[%l7 + 0x58]
	fpmerge	%f13,	%f9,	%f8
	sethi	0x08BF,	%o4
	mulx	%i4,	0x1C30,	%g6
	popc	%i2,	%l4
	fmovrde	%g1,	%f4,	%f0
	fpadd16	%f2,	%f12,	%f8
	edge32n	%o6,	%i5,	%i6
	movn	%icc,	%g3,	%o7
	movrlz	%i1,	%o3,	%l2
	andncc	%g4,	%l1,	%l5
	orcc	%o0,	%l3,	%o1
	subc	%g7,	%o2,	%o5
	std	%f10,	[%l7 + 0x20]
	xor	%l0,	%i7,	%i0
	xorcc	%i3,	0x17AF,	%g5
	mulscc	%g2,	%l6,	%o4
	ldsb	[%l7 + 0x1B],	%g6
	srax	%i4,	0x1B,	%i2
	subcc	%l4,	%g1,	%o6
	fabsd	%f8,	%f12
	fzeros	%f7
	fmovdn	%xcc,	%f6,	%f15
	lduw	[%l7 + 0x58],	%i5
	fmovse	%icc,	%f0,	%f4
	fsrc1s	%f15,	%f12
	stb	%g3,	[%l7 + 0x28]
	fmovsn	%icc,	%f1,	%f0
	movcs	%xcc,	%i6,	%o7
	xnor	%o3,	%l2,	%g4
	alignaddrl	%i1,	%l1,	%o0
	movrlez	%l5,	0x360,	%o1
	ldsh	[%l7 + 0x46],	%g7
	xnorcc	%o2,	0x05D4,	%l3
	fnot1	%f0,	%f4
	alignaddr	%l0,	%i7,	%o5
	umulcc	%i3,	%g5,	%i0
	sth	%l6,	[%l7 + 0x6A]
	fmovsgu	%xcc,	%f6,	%f3
	addccc	%o4,	%g6,	%i4
	mulx	%i2,	%g2,	%g1
	movleu	%icc,	%l4,	%o6
	fmovrdne	%g3,	%f14,	%f10
	movneg	%xcc,	%i6,	%i5
	fcmpeq16	%f6,	%f14,	%o7
	fmovrdgez	%l2,	%f12,	%f10
	srlx	%o3,	0x1A,	%g4
	movge	%icc,	%l1,	%o0
	fnot2	%f4,	%f4
	mulscc	%i1,	0x02F4,	%l5
	movne	%xcc,	%o1,	%o2
	mova	%xcc,	%l3,	%l0
	movrgez	%i7,	%o5,	%i3
	fnor	%f8,	%f2,	%f14
	add	%g7,	%i0,	%l6
	sdivx	%g5,	0x18B2,	%o4
	lduw	[%l7 + 0x5C],	%i4
	and	%g6,	%i2,	%g2
	movne	%xcc,	%g1,	%o6
	sll	%l4,	0x0A,	%g3
	fmovrdlz	%i6,	%f12,	%f12
	faligndata	%f6,	%f10,	%f12
	sth	%o7,	[%l7 + 0x28]
	edge8	%l2,	%o3,	%g4
	andncc	%i5,	%l1,	%o0
	or	%i1,	0x107E,	%l5
	edge8	%o2,	%o1,	%l0
	sllx	%i7,	0x0C,	%l3
	sra	%i3,	0x19,	%o5
	movg	%icc,	%i0,	%l6
	movrlez	%g5,	%g7,	%o4
	ldub	[%l7 + 0x3A],	%g6
	sdiv	%i2,	0x0EB9,	%g2
	ldd	[%l7 + 0x10],	%f2
	alignaddrl	%i4,	%o6,	%g1
	movrne	%g3,	0x115,	%l4
	movcc	%xcc,	%i6,	%l2
	movne	%icc,	%o3,	%g4
	ldub	[%l7 + 0x32],	%i5
	ldsw	[%l7 + 0x40],	%l1
	movpos	%icc,	%o0,	%o7
	fxnors	%f0,	%f7,	%f12
	ldub	[%l7 + 0x42],	%l5
	fnot1s	%f2,	%f1
	fxnors	%f6,	%f8,	%f3
	movrne	%o2,	0x0BC,	%i1
	xnorcc	%o1,	%i7,	%l0
	fpack16	%f4,	%f9
	edge32n	%i3,	%l3,	%i0
	udivx	%l6,	0x1255,	%o5
	st	%f6,	[%l7 + 0x18]
	ldx	[%l7 + 0x50],	%g7
	fandnot1s	%f11,	%f3,	%f7
	fmovdge	%icc,	%f12,	%f12
	std	%f14,	[%l7 + 0x60]
	addc	%g5,	0x02E6,	%g6
	xnor	%i2,	0x0BFE,	%g2
	fmovscs	%xcc,	%f11,	%f9
	edge16n	%i4,	%o6,	%g1
	fmovrsne	%g3,	%f14,	%f8
	for	%f4,	%f14,	%f8
	sethi	0x0C7E,	%l4
	ldub	[%l7 + 0x3B],	%o4
	alignaddrl	%i6,	%l2,	%g4
	popc	0x1858,	%i5
	movgu	%xcc,	%l1,	%o0
	fabss	%f5,	%f14
	stw	%o7,	[%l7 + 0x70]
	array8	%o3,	%o2,	%l5
	edge8	%o1,	%i1,	%l0
	sll	%i7,	0x04,	%l3
	movleu	%icc,	%i3,	%i0
	fandnot1	%f8,	%f12,	%f6
	sllx	%l6,	0x1E,	%g7
	ld	[%l7 + 0x34],	%f7
	ldsb	[%l7 + 0x7F],	%g5
	udivx	%g6,	0x1717,	%o5
	movrne	%i2,	0x07B,	%g2
	ldx	[%l7 + 0x30],	%i4
	orncc	%g1,	%g3,	%l4
	for	%f0,	%f2,	%f0
	mulscc	%o4,	%o6,	%l2
	edge32n	%g4,	%i6,	%i5
	fmovdn	%icc,	%f5,	%f4
	stx	%l1,	[%l7 + 0x68]
	mulscc	%o0,	%o3,	%o7
	fmovsg	%xcc,	%f1,	%f1
	edge32	%o2,	%l5,	%o1
	xor	%l0,	%i7,	%l3
	edge8l	%i3,	%i1,	%i0
	umulcc	%l6,	0x0A59,	%g7
	fmovrsgez	%g6,	%f11,	%f5
	subccc	%o5,	%g5,	%i2
	mulscc	%g2,	0x1C81,	%i4
	movcs	%xcc,	%g1,	%g3
	srlx	%o4,	0x1E,	%l4
	udivcc	%l2,	0x1C5F,	%g4
	xnorcc	%o6,	0x18EE,	%i5
	alignaddrl	%l1,	%i6,	%o0
	udivcc	%o7,	0x086B,	%o2
	edge32n	%o3,	%l5,	%l0
	array16	%o1,	%l3,	%i7
	xnorcc	%i1,	0x0812,	%i0
	udiv	%l6,	0x155D,	%i3
	edge16	%g7,	%o5,	%g5
	smulcc	%i2,	%g2,	%g6
	fxors	%f7,	%f5,	%f12
	mulscc	%g1,	0x011A,	%g3
	stw	%o4,	[%l7 + 0x68]
	fmovsgu	%icc,	%f3,	%f5
	std	%f10,	[%l7 + 0x58]
	save %i4, 0x092E, %l4
	addcc	%l2,	%g4,	%o6
	fpmerge	%f10,	%f8,	%f12
	movle	%icc,	%l1,	%i6
	subc	%i5,	0x1753,	%o7
	fmovdneg	%icc,	%f1,	%f3
	srlx	%o0,	%o3,	%o2
	array32	%l5,	%l0,	%o1
	subccc	%l3,	%i7,	%i0
	or	%i1,	0x1A38,	%i3
	xnor	%g7,	%l6,	%o5
	subccc	%g5,	%i2,	%g6
	sdivcc	%g1,	0x0258,	%g2
	fmovrslez	%g3,	%f12,	%f12
	sethi	0x1EC5,	%o4
	xor	%l4,	%i4,	%l2
	movg	%xcc,	%o6,	%g4
	ld	[%l7 + 0x54],	%f5
	edge8l	%i6,	%i5,	%l1
	movn	%icc,	%o7,	%o0
	or	%o3,	%l5,	%l0
	edge16l	%o1,	%l3,	%o2
	movcc	%xcc,	%i0,	%i7
	ldsh	[%l7 + 0x24],	%i3
	sth	%i1,	[%l7 + 0x40]
	sethi	0x07F0,	%g7
	ldx	[%l7 + 0x58],	%o5
	udiv	%l6,	0x1440,	%g5
	sdiv	%i2,	0x0B9E,	%g1
	sdiv	%g6,	0x0005,	%g3
	mova	%icc,	%g2,	%l4
	lduh	[%l7 + 0x16],	%o4
	umul	%l2,	0x1695,	%o6
	edge8ln	%i4,	%i6,	%g4
	subcc	%i5,	%o7,	%l1
	udiv	%o0,	0x1E53,	%o3
	ldd	[%l7 + 0x60],	%f12
	movrne	%l5,	%l0,	%o1
	fmovdpos	%xcc,	%f14,	%f5
	fmovrdne	%o2,	%f0,	%f0
	ldub	[%l7 + 0x5A],	%l3
	popc	0x1EB8,	%i7
	ldsh	[%l7 + 0x74],	%i0
	udivcc	%i3,	0x1959,	%i1
	fcmpd	%fcc1,	%f12,	%f4
	movgu	%icc,	%g7,	%l6
	fcmpne16	%f6,	%f8,	%g5
	sllx	%o5,	%g1,	%i2
	subccc	%g3,	0x190D,	%g6
	xnorcc	%l4,	0x0D1A,	%g2
	fmovs	%f11,	%f3
	edge32n	%l2,	%o4,	%o6
	lduh	[%l7 + 0x3A],	%i6
	add	%g4,	0x0385,	%i5
	movre	%o7,	0x09B,	%i4
	edge16ln	%l1,	%o3,	%o0
	umulcc	%l5,	%l0,	%o2
	fmovdne	%xcc,	%f5,	%f6
	ldd	[%l7 + 0x48],	%l2
	popc	0x0CE0,	%o1
	edge8n	%i7,	%i3,	%i0
	fmovd	%f10,	%f14
	fpack32	%f12,	%f8,	%f0
	fcmpne16	%f6,	%f0,	%g7
	movne	%icc,	%l6,	%i1
	movle	%icc,	%o5,	%g5
	alignaddrl	%i2,	%g3,	%g1
	sub	%g6,	%g2,	%l2
	edge16n	%o4,	%l4,	%o6
	fnot1s	%f10,	%f1
	fmovspos	%icc,	%f12,	%f4
	mova	%xcc,	%i6,	%i5
	sllx	%o7,	%g4,	%l1
	fand	%f8,	%f8,	%f4
	sethi	0x1235,	%o3
	alignaddr	%o0,	%i4,	%l0
	movgu	%xcc,	%l5,	%l3
	ldsb	[%l7 + 0x19],	%o2
	ldsb	[%l7 + 0x79],	%i7
	udivx	%i3,	0x0CF2,	%i0
	srax	%o1,	%l6,	%i1
	udiv	%o5,	0x12EC,	%g7
	alignaddr	%i2,	%g5,	%g3
	srax	%g6,	%g1,	%g2
	sll	%l2,	%o4,	%o6
	lduh	[%l7 + 0x6C],	%l4
	edge8n	%i5,	%i6,	%o7
	array32	%l1,	%o3,	%g4
	movrlz	%o0,	0x39B,	%l0
	edge32l	%i4,	%l5,	%l3
	st	%f10,	[%l7 + 0x54]
	sth	%i7,	[%l7 + 0x52]
	alignaddrl	%i3,	%i0,	%o2
	sethi	0x1C51,	%o1
	stb	%l6,	[%l7 + 0x61]
	ldd	[%l7 + 0x18],	%o4
	movre	%i1,	0x045,	%g7
	smul	%g5,	%g3,	%i2
	umul	%g6,	%g1,	%l2
	movne	%icc,	%o4,	%o6
	lduh	[%l7 + 0x7C],	%g2
	ldsw	[%l7 + 0x20],	%l4
	andncc	%i6,	%o7,	%l1
	sdiv	%o3,	0x1006,	%g4
	edge8n	%i5,	%l0,	%i4
	faligndata	%f12,	%f8,	%f4
	ld	[%l7 + 0x44],	%f7
	move	%xcc,	%l5,	%o0
	movle	%icc,	%l3,	%i7
	mulx	%i3,	0x16AE,	%i0
	movcc	%xcc,	%o2,	%o1
	fandnot2s	%f13,	%f11,	%f5
	mulx	%l6,	0x0D37,	%i1
	lduh	[%l7 + 0x16],	%o5
	movge	%xcc,	%g5,	%g7
	array16	%i2,	%g6,	%g1
	subccc	%g3,	%o4,	%o6
	movleu	%xcc,	%l2,	%g2
	movcs	%icc,	%i6,	%l4
	stw	%l1,	[%l7 + 0x48]
	fmovdleu	%xcc,	%f3,	%f14
	fcmped	%fcc2,	%f2,	%f2
	movcs	%xcc,	%o7,	%g4
	fsrc1s	%f15,	%f12
	ldd	[%l7 + 0x48],	%i4
	fmovrdlz	%o3,	%f10,	%f14
	fmovspos	%icc,	%f14,	%f10
	stx	%l0,	[%l7 + 0x60]
	ldsb	[%l7 + 0x12],	%l5
	udiv	%i4,	0x1205,	%l3
	edge32l	%o0,	%i7,	%i3
	fcmpd	%fcc3,	%f0,	%f14
	movrgz	%i0,	%o1,	%l6
	fandnot2s	%f13,	%f11,	%f8
	orncc	%i1,	%o2,	%g5
	edge32n	%o5,	%i2,	%g7
	sethi	0x1FE2,	%g1
	fmovsa	%icc,	%f9,	%f3
	fones	%f2
	popc	0x1E4A,	%g6
	movrgez	%o4,	0x3BD,	%g3
	edge32ln	%l2,	%g2,	%i6
	edge32l	%o6,	%l4,	%o7
	fmovdvs	%icc,	%f0,	%f4
	orcc	%l1,	0x1CF1,	%g4
	ld	[%l7 + 0x34],	%f12
	fmovda	%xcc,	%f2,	%f6
	addccc	%o3,	%l0,	%l5
	fmovrsgez	%i5,	%f6,	%f13
	fpadd32	%f0,	%f10,	%f4
	smulcc	%l3,	%i4,	%i7
	subccc	%o0,	%i0,	%i3
	alignaddrl	%o1,	%i1,	%l6
	lduh	[%l7 + 0x54],	%g5
	fpack32	%f14,	%f4,	%f0
	ldub	[%l7 + 0x37],	%o2
	ldub	[%l7 + 0x7F],	%o5
	std	%f8,	[%l7 + 0x10]
	fmovda	%icc,	%f9,	%f4
	fmovrde	%g7,	%f2,	%f4
	st	%f13,	[%l7 + 0x74]
	edge16	%i2,	%g1,	%o4
	stb	%g3,	[%l7 + 0x3F]
	alignaddrl	%l2,	%g6,	%i6
	move	%icc,	%g2,	%o6
	stx	%o7,	[%l7 + 0x48]
	andcc	%l1,	0x02ED,	%l4
	xorcc	%o3,	%l0,	%l5
	array32	%g4,	%l3,	%i4
	umulcc	%i5,	0x1947,	%i7
	ldub	[%l7 + 0x57],	%i0
	orn	%o0,	%i3,	%i1
	smulcc	%l6,	0x18D1,	%g5
	udiv	%o1,	0x1E38,	%o5
	ldd	[%l7 + 0x50],	%g6
	fnot1	%f2,	%f8
	edge8	%i2,	%o2,	%g1
	st	%f10,	[%l7 + 0x24]
	umulcc	%g3,	%l2,	%g6
	edge32	%o4,	%i6,	%g2
	movl	%icc,	%o7,	%o6
	fmovdn	%xcc,	%f15,	%f3
	restore %l4, 0x1166, %o3
	edge32	%l0,	%l5,	%l1
	st	%f1,	[%l7 + 0x18]
	mulscc	%l3,	0x1AA8,	%i4
	ldx	[%l7 + 0x48],	%g4
	fmovdcc	%icc,	%f5,	%f5
	movne	%icc,	%i7,	%i0
	movvs	%xcc,	%o0,	%i3
	sethi	0x006A,	%i5
	alignaddr	%i1,	%g5,	%l6
	xor	%o1,	%o5,	%g7
	srl	%i2,	%o2,	%g1
	fmovs	%f4,	%f11
	addc	%g3,	0x1FAC,	%g6
	sra	%l2,	0x04,	%i6
	sra	%g2,	%o4,	%o7
	fandnot1s	%f9,	%f4,	%f6
	fmovs	%f4,	%f6
	andcc	%l4,	%o6,	%l0
	movle	%xcc,	%o3,	%l5
	lduw	[%l7 + 0x38],	%l3
	andncc	%l1,	%g4,	%i4
	fmovscc	%icc,	%f1,	%f1
	fsrc1	%f2,	%f4
	subc	%i0,	0x1E64,	%i7
	movg	%xcc,	%o0,	%i3
	movne	%xcc,	%i1,	%g5
	stx	%l6,	[%l7 + 0x50]
	popc	%o1,	%i5
	fcmpne16	%f12,	%f6,	%o5
	ldsw	[%l7 + 0x40],	%g7
	ldsh	[%l7 + 0x76],	%o2
	stb	%g1,	[%l7 + 0x38]
	sra	%g3,	%g6,	%l2
	ldub	[%l7 + 0x46],	%i2
	bshuffle	%f6,	%f4,	%f10
	andn	%i6,	%g2,	%o4
	sdiv	%o7,	0x1A3F,	%l4
	umul	%o6,	%o3,	%l0
	movpos	%xcc,	%l3,	%l1
	udivcc	%g4,	0x1895,	%l5
	save %i0, 0x1772, %i7
	fnot2s	%f11,	%f3
	orn	%o0,	0x0D70,	%i3
	mulx	%i4,	%i1,	%l6
	subc	%o1,	%g5,	%i5
	umulcc	%o5,	0x164F,	%o2
	movrgz	%g7,	%g1,	%g3
	ldd	[%l7 + 0x70],	%f0
	popc	0x1ACE,	%g6
	alignaddrl	%i2,	%i6,	%g2
	fors	%f11,	%f5,	%f7
	stb	%o4,	[%l7 + 0x2A]
	std	%f10,	[%l7 + 0x78]
	std	%f12,	[%l7 + 0x68]
	edge16	%l2,	%l4,	%o7
	movleu	%icc,	%o6,	%o3
	orncc	%l0,	%l3,	%l1
	fsrc2s	%f9,	%f9
	edge16l	%l5,	%g4,	%i7
	udivx	%i0,	0x0E33,	%i3
	srax	%i4,	0x04,	%o0
	sllx	%i1,	0x1F,	%o1
	edge8ln	%g5,	%i5,	%o5
	edge16l	%o2,	%g7,	%g1
	srax	%g3,	%g6,	%i2
	sdivx	%l6,	0x16FB,	%i6
	andn	%g2,	%o4,	%l2
	ldsw	[%l7 + 0x5C],	%l4
	faligndata	%f0,	%f2,	%f10
	movrlez	%o6,	0x05D,	%o3
	save %o7, 0x1AFA, %l3
	movn	%xcc,	%l1,	%l5
	fcmpne16	%f14,	%f6,	%g4
	std	%f4,	[%l7 + 0x08]
	andn	%i7,	0x0FDC,	%l0
	umul	%i3,	0x18EC,	%i0
	edge16n	%o0,	%i1,	%i4
	edge32	%g5,	%o1,	%o5
	orncc	%o2,	0x18A8,	%i5
	ldsh	[%l7 + 0x60],	%g1
	sdivx	%g7,	0x0563,	%g3
	fmovdvs	%icc,	%f9,	%f4
	movgu	%icc,	%g6,	%i2
	smul	%l6,	0x0FB8,	%g2
	xorcc	%o4,	%i6,	%l2
	edge8	%o6,	%l4,	%o7
	edge16l	%l3,	%o3,	%l5
	edge16n	%l1,	%g4,	%i7
	sdivx	%i3,	0x1215,	%i0
	save %o0, %l0, %i4
	udivx	%g5,	0x0328,	%i1
	ldub	[%l7 + 0x63],	%o5
	ldsw	[%l7 + 0x78],	%o1
	fzero	%f12
	fcmple16	%f12,	%f0,	%i5
	sllx	%o2,	0x08,	%g1
	fnands	%f3,	%f6,	%f6
	fmovda	%icc,	%f5,	%f4
	fpsub32	%f4,	%f14,	%f14
	fmovdne	%xcc,	%f6,	%f4
	ldsb	[%l7 + 0x08],	%g3
	fpsub16	%f2,	%f8,	%f8
	bshuffle	%f6,	%f0,	%f0
	movle	%xcc,	%g6,	%i2
	addcc	%g7,	0x07E8,	%l6
	udivx	%o4,	0x1412,	%i6
	array32	%g2,	%o6,	%l4
	add	%l2,	%o7,	%o3
	movrlez	%l3,	%l1,	%l5
	edge32n	%i7,	%i3,	%i0
	subccc	%o0,	0x0C03,	%l0
	std	%f0,	[%l7 + 0x78]
	subccc	%i4,	0x1FEA,	%g5
	fnands	%f12,	%f12,	%f7
	udiv	%i1,	0x1897,	%g4
	movg	%icc,	%o1,	%o5
	fcmps	%fcc3,	%f9,	%f15
	or	%i5,	%o2,	%g3
	fmovda	%icc,	%f9,	%f15
	sll	%g6,	%g1,	%i2
	srl	%l6,	%g7,	%i6
	movvs	%xcc,	%g2,	%o6
	subccc	%l4,	0x11C6,	%o4
	fmovsle	%icc,	%f5,	%f8
	and	%l2,	%o7,	%o3
	array16	%l1,	%l5,	%i7
	fmovsne	%xcc,	%f15,	%f6
	fors	%f1,	%f0,	%f7
	andn	%i3,	%l3,	%i0
	fmovdvc	%xcc,	%f13,	%f4
	stb	%o0,	[%l7 + 0x1C]
	xor	%l0,	%g5,	%i4
	std	%f12,	[%l7 + 0x60]
	sll	%i1,	0x0C,	%g4
	movrne	%o5,	%i5,	%o1
	sdivcc	%g3,	0x052E,	%o2
	fxors	%f7,	%f6,	%f14
	ld	[%l7 + 0x10],	%f13
	pdist	%f0,	%f8,	%f12
	movvs	%icc,	%g1,	%i2
	edge8n	%g6,	%l6,	%g7
	fcmps	%fcc2,	%f13,	%f5
	addccc	%g2,	0x0593,	%i6
	restore %o6, 0x1688, %l4
	ldd	[%l7 + 0x68],	%l2
	fmovsa	%icc,	%f7,	%f0
	edge8l	%o7,	%o3,	%o4
	umul	%l1,	%l5,	%i7
	fmovsvc	%xcc,	%f8,	%f14
	andn	%l3,	0x05F3,	%i0
	movrlz	%o0,	0x0AC,	%i3
	orn	%g5,	%l0,	%i4
	ldub	[%l7 + 0x60],	%g4
	movne	%icc,	%i1,	%i5
	fors	%f12,	%f14,	%f14
	lduw	[%l7 + 0x54],	%o5
	mulx	%o1,	0x05AD,	%g3
	umulcc	%g1,	0x0779,	%i2
	udivx	%o2,	0x1FED,	%l6
	fmovrdlz	%g6,	%f12,	%f14
	fmovdneg	%icc,	%f8,	%f10
	srax	%g2,	0x0F,	%i6
	subcc	%g7,	0x16E3,	%l4
	fmul8x16au	%f5,	%f14,	%f4
	sra	%o6,	%l2,	%o3
	ldsw	[%l7 + 0x34],	%o4
	st	%f11,	[%l7 + 0x28]
	movvs	%icc,	%l1,	%l5
	udiv	%i7,	0x015C,	%o7
	std	%f4,	[%l7 + 0x18]
	fors	%f7,	%f6,	%f3
	movg	%xcc,	%l3,	%o0
	sra	%i0,	0x14,	%i3
	fabss	%f4,	%f12
	movge	%xcc,	%g5,	%i4
	edge8ln	%l0,	%g4,	%i5
	movcs	%xcc,	%o5,	%o1
	sdivcc	%i1,	0x05A6,	%g1
	sdiv	%g3,	0x1FFD,	%i2
	edge32l	%o2,	%l6,	%g2
	ldub	[%l7 + 0x5E],	%g6
	fmovda	%icc,	%f4,	%f10
	movrlez	%i6,	0x02F,	%g7
	add	%o6,	0x0424,	%l4
	smul	%o3,	0x0B00,	%l2
	fnot2s	%f1,	%f14
	fsrc1	%f8,	%f6
	st	%f10,	[%l7 + 0x44]
	sllx	%o4,	0x1B,	%l5
	umul	%l1,	%i7,	%l3
	fnegs	%f7,	%f14
	movrlz	%o7,	0x1C0,	%i0
	edge8l	%i3,	%o0,	%g5
	subc	%i4,	0x1328,	%g4
	movrgez	%i5,	%l0,	%o5
	movrlez	%i1,	0x0DA,	%g1
	umul	%g3,	0x0166,	%i2
	fmovrde	%o1,	%f6,	%f6
	edge16n	%l6,	%g2,	%o2
	sethi	0x1CFC,	%i6
	std	%f10,	[%l7 + 0x10]
	st	%f10,	[%l7 + 0x6C]
	stw	%g6,	[%l7 + 0x70]
	edge8l	%o6,	%g7,	%l4
	fpadd32	%f6,	%f12,	%f0
	edge8l	%o3,	%o4,	%l2
	movle	%icc,	%l1,	%l5
	movrne	%i7,	%o7,	%i0
	subcc	%l3,	%i3,	%g5
	xnor	%i4,	0x09D7,	%o0
	movrlez	%g4,	0x061,	%l0
	movrgez	%i5,	0x350,	%i1
	subccc	%o5,	0x0C7D,	%g1
	sdivx	%g3,	0x0ED2,	%i2
	umul	%o1,	%g2,	%l6
	fornot1	%f2,	%f14,	%f8
	srax	%i6,	%g6,	%o6
	fandnot2s	%f11,	%f0,	%f8
	and	%o2,	%l4,	%g7
	stx	%o4,	[%l7 + 0x20]
	addc	%l2,	0x00E8,	%l1
	or	%o3,	%l5,	%o7
	addc	%i7,	%l3,	%i0
	subc	%i3,	%i4,	%g5
	ld	[%l7 + 0x5C],	%f4
	fcmple32	%f0,	%f10,	%g4
	ldsb	[%l7 + 0x0A],	%o0
	edge16	%i5,	%l0,	%o5
	srlx	%i1,	%g1,	%i2
	ldsw	[%l7 + 0x34],	%g3
	fmovrsne	%g2,	%f3,	%f10
	edge32ln	%o1,	%l6,	%i6
	movrlz	%g6,	0x2C4,	%o6
	movl	%xcc,	%l4,	%o2
	alignaddrl	%o4,	%l2,	%g7
	sub	%o3,	0x0792,	%l1
	andncc	%l5,	%o7,	%l3
	movrgz	%i0,	0x335,	%i3
	lduw	[%l7 + 0x7C],	%i4
	fsrc1	%f14,	%f12
	stx	%g5,	[%l7 + 0x68]
	edge32n	%i7,	%g4,	%i5
	fmul8x16au	%f6,	%f2,	%f8
	edge16l	%o0,	%l0,	%o5
	lduw	[%l7 + 0x40],	%g1
	movn	%xcc,	%i1,	%g3
	movrne	%i2,	0x3D0,	%g2
	fpsub32s	%f6,	%f15,	%f9
	udivx	%l6,	0x0FB8,	%o1
	sth	%g6,	[%l7 + 0x1A]
	ldub	[%l7 + 0x13],	%o6
	fmovdvs	%icc,	%f8,	%f14
	mova	%xcc,	%l4,	%i6
	edge16l	%o2,	%o4,	%g7
	array8	%o3,	%l2,	%l1
	fsrc1	%f14,	%f2
	fsrc2	%f4,	%f10
	movre	%o7,	0x0D6,	%l5
	edge16	%i0,	%i3,	%i4
	movrlez	%l3,	0x37C,	%g5
	movvs	%icc,	%g4,	%i5
	subcc	%i7,	0x06A3,	%l0
	add	%o0,	%o5,	%g1
	add	%g3,	0x07CF,	%i1
	movrgez	%g2,	0x20F,	%i2
	movleu	%icc,	%o1,	%l6
	lduh	[%l7 + 0x56],	%g6
	srlx	%o6,	%i6,	%o2
	srax	%l4,	0x0C,	%g7
	fpadd16	%f10,	%f6,	%f0
	fmovrdlez	%o4,	%f0,	%f0
	sub	%l2,	%l1,	%o3
	andncc	%l5,	%i0,	%i3
	mova	%icc,	%o7,	%l3
	xorcc	%i4,	0x0C1D,	%g5
	ldd	[%l7 + 0x70],	%i4
	fcmple32	%f8,	%f4,	%i7
	sllx	%g4,	%l0,	%o0
	fmovspos	%icc,	%f4,	%f6
	movrgz	%o5,	%g1,	%i1
	edge32ln	%g3,	%g2,	%o1
	movrgz	%l6,	0x39D,	%i2
	array16	%g6,	%i6,	%o6
	fpadd16s	%f11,	%f1,	%f8
	ldsh	[%l7 + 0x3A],	%o2
	orcc	%g7,	0x0971,	%o4
	fmovdn	%icc,	%f1,	%f11
	movrlz	%l2,	%l4,	%l1
	fmovdn	%icc,	%f3,	%f8
	edge8l	%l5,	%o3,	%i0
	andn	%o7,	0x0D16,	%l3
	move	%icc,	%i3,	%g5
	add	%i4,	0x1A5B,	%i5
	fabsd	%f6,	%f4
	edge16	%g4,	%l0,	%o0
	fpsub32	%f8,	%f0,	%f0
	for	%f0,	%f12,	%f12
	udiv	%i7,	0x0AC1,	%g1
	lduh	[%l7 + 0x4C],	%o5
	andcc	%g3,	%i1,	%g2
	ldd	[%l7 + 0x40],	%f6
	array32	%o1,	%i2,	%l6
	edge32ln	%i6,	%g6,	%o6
	mova	%xcc,	%o2,	%o4
	srlx	%g7,	0x17,	%l4
	movrlez	%l2,	0x39C,	%l1
	sethi	0x08C9,	%o3
	sdivcc	%l5,	0x13DD,	%i0
	orcc	%o7,	%i3,	%g5
	std	%f0,	[%l7 + 0x70]
	fmovsn	%xcc,	%f2,	%f10
	array32	%i4,	%i5,	%l3
	umul	%l0,	%g4,	%o0
	fandnot1	%f6,	%f8,	%f12
	edge16	%i7,	%g1,	%g3
	alignaddrl	%o5,	%g2,	%i1
	fmul8ulx16	%f2,	%f14,	%f14
	stb	%i2,	[%l7 + 0x3A]
	stx	%o1,	[%l7 + 0x28]
	subccc	%i6,	%l6,	%o6
	movrgz	%o2,	0x31F,	%g6
	xnor	%g7,	0x0AAE,	%o4
	xnor	%l2,	%l1,	%o3
	andn	%l5,	%l4,	%i0
	movg	%icc,	%i3,	%o7
	ldsb	[%l7 + 0x57],	%i4
	edge8n	%g5,	%i5,	%l3
	or	%g4,	%l0,	%o0
	ldx	[%l7 + 0x48],	%i7
	fpack32	%f6,	%f0,	%f0
	movrgez	%g3,	%o5,	%g1
	sll	%i1,	0x06,	%g2
	std	%f0,	[%l7 + 0x20]
	edge32n	%o1,	%i6,	%l6
	mova	%xcc,	%i2,	%o6
	ldsh	[%l7 + 0x7C],	%o2
	fpadd32s	%f8,	%f3,	%f14
	movgu	%icc,	%g6,	%g7
	fmovrdgz	%l2,	%f6,	%f8
	fmovsle	%icc,	%f12,	%f2
	udivx	%o4,	0x0EE8,	%o3
	udivcc	%l5,	0x1470,	%l1
	ld	[%l7 + 0x48],	%f12
	addccc	%i0,	0x176E,	%i3
	ldx	[%l7 + 0x10],	%o7
	and	%i4,	0x0C3D,	%l4
	srlx	%g5,	0x1C,	%i5
	subc	%g4,	0x05A9,	%l0
	alignaddrl	%o0,	%l3,	%i7
	fmovsge	%xcc,	%f3,	%f14
	fornot1	%f2,	%f0,	%f4
	movvc	%icc,	%o5,	%g1
	stx	%g3,	[%l7 + 0x20]
	fmovsleu	%icc,	%f11,	%f10
	movle	%icc,	%i1,	%o1
	ld	[%l7 + 0x1C],	%f1
	xnor	%i6,	0x0BB6,	%g2
	fnegs	%f5,	%f12
	edge32n	%l6,	%i2,	%o2
	srl	%g6,	%g7,	%l2
	edge32	%o4,	%o6,	%l5
	fmovdvs	%xcc,	%f15,	%f4
	addccc	%o3,	%i0,	%l1
	movpos	%icc,	%o7,	%i4
	xnorcc	%l4,	0x0E64,	%g5
	movrlz	%i5,	%g4,	%i3
	subcc	%o0,	%l0,	%l3
	movre	%o5,	0x34D,	%i7
	alignaddr	%g1,	%g3,	%i1
	siam	0x7
	movvc	%icc,	%i6,	%o1
	orcc	%l6,	0x0F60,	%g2
	fmovspos	%xcc,	%f9,	%f8
	restore %o2, %i2, %g7
	mova	%xcc,	%g6,	%o4
	orncc	%o6,	%l5,	%l2
	alignaddrl	%i0,	%l1,	%o7
	fones	%f3
	andn	%o3,	0x112C,	%l4
	subccc	%i4,	%i5,	%g4
	fmovdcs	%icc,	%f12,	%f12
	movcc	%xcc,	%i3,	%o0
	edge8n	%g5,	%l0,	%o5
	fandnot1s	%f3,	%f12,	%f8
	xnor	%i7,	%g1,	%g3
	array16	%i1,	%l3,	%i6
	edge16n	%l6,	%g2,	%o1
	lduw	[%l7 + 0x78],	%i2
	pdist	%f12,	%f6,	%f6
	umulcc	%g7,	%g6,	%o2
	fnot2s	%f7,	%f3
	movleu	%xcc,	%o4,	%o6
	umulcc	%l5,	0x1C47,	%i0
	sdivcc	%l1,	0x1CD8,	%o7
	fmovsgu	%icc,	%f3,	%f6
	fmovrde	%l2,	%f14,	%f0
	srl	%l4,	%o3,	%i4
	edge32n	%i5,	%i3,	%o0
	edge8l	%g5,	%l0,	%g4
	udivx	%o5,	0x08D3,	%i7
	movcs	%icc,	%g1,	%i1
	popc	%g3,	%i6
	umulcc	%l3,	%l6,	%g2
	ldsw	[%l7 + 0x70],	%i2
	edge8n	%g7,	%o1,	%g6
	movge	%xcc,	%o2,	%o4
	add	%l5,	%i0,	%l1
	movne	%icc,	%o6,	%l2
	edge8n	%o7,	%o3,	%l4
	array16	%i4,	%i5,	%i3
	movle	%icc,	%o0,	%l0
	udivcc	%g4,	0x02BF,	%g5
	edge8ln	%i7,	%g1,	%o5
	udiv	%i1,	0x17D1,	%i6
	add	%g3,	0x0A8E,	%l6
	fmovrsgz	%g2,	%f3,	%f10
	siam	0x2
	fands	%f13,	%f9,	%f2
	movre	%l3,	%g7,	%i2
	fcmped	%fcc0,	%f2,	%f6
	fmuld8sux16	%f5,	%f5,	%f4
	mova	%xcc,	%g6,	%o2
	movrlez	%o1,	%l5,	%i0
	fmovsg	%icc,	%f5,	%f1
	andcc	%o4,	0x0282,	%o6
	subccc	%l2,	0x1800,	%l1
	edge16	%o7,	%l4,	%o3
	xnorcc	%i4,	%i3,	%o0
	sdivcc	%l0,	0x171B,	%i5
	fxnors	%f2,	%f12,	%f4
	or	%g5,	0x13E9,	%i7
	movrlez	%g1,	%o5,	%g4
	fcmpgt16	%f8,	%f14,	%i6
	movrlez	%g3,	0x187,	%i1
	subccc	%l6,	0x0951,	%g2
	fcmpgt32	%f6,	%f2,	%g7
	fsrc2	%f4,	%f2
	alignaddrl	%l3,	%g6,	%i2
	xorcc	%o2,	0x0B69,	%l5
	fmul8x16au	%f1,	%f0,	%f8
	andn	%o1,	0x0E49,	%i0
	restore %o6, %l2, %l1
	save %o7, 0x1920, %l4
	movge	%icc,	%o3,	%i4
	save %i3, 0x0B27, %o4
	movg	%icc,	%l0,	%o0
	ldd	[%l7 + 0x60],	%f4
	ldx	[%l7 + 0x08],	%i5
	edge8l	%i7,	%g1,	%o5
	orncc	%g4,	%i6,	%g5
	movvs	%icc,	%i1,	%g3
	fzeros	%f14
	array16	%g2,	%g7,	%l3
	fmovsn	%xcc,	%f0,	%f3
	mova	%xcc,	%g6,	%l6
	xorcc	%o2,	0x06E8,	%l5
	fexpand	%f11,	%f8
	movvc	%icc,	%o1,	%i0
	alignaddrl	%o6,	%i2,	%l2
	array16	%l1,	%l4,	%o7
	lduw	[%l7 + 0x74],	%o3
	addc	%i4,	%o4,	%i3
	edge16l	%l0,	%o0,	%i5
	edge16ln	%g1,	%i7,	%g4
	edge8	%o5,	%g5,	%i1
	subc	%i6,	0x1114,	%g2
	movn	%icc,	%g3,	%l3
	ld	[%l7 + 0x18],	%f8
	movn	%xcc,	%g6,	%l6
	ldx	[%l7 + 0x10],	%o2
	udiv	%g7,	0x1921,	%l5
	fmovrdgz	%i0,	%f4,	%f4
	movl	%xcc,	%o6,	%i2
	st	%f2,	[%l7 + 0x4C]
	movn	%icc,	%l2,	%l1
	sra	%o1,	%o7,	%o3
	sth	%i4,	[%l7 + 0x78]
	movcs	%xcc,	%o4,	%l4
	fmovrdne	%l0,	%f6,	%f2
	mova	%xcc,	%o0,	%i3
	array32	%g1,	%i5,	%g4
	fabss	%f6,	%f14
	ldsw	[%l7 + 0x14],	%o5
	movl	%xcc,	%i7,	%i1
	array8	%g5,	%g2,	%i6
	edge32l	%l3,	%g6,	%g3
	fmuld8ulx16	%f3,	%f11,	%f6
	andcc	%o2,	%g7,	%l5
	smul	%l6,	%i0,	%i2
	edge16n	%o6,	%l2,	%o1
	movrlz	%o7,	%o3,	%l1
	movleu	%icc,	%o4,	%l4
	smulcc	%i4,	0x13EE,	%o0
	subccc	%l0,	0x141B,	%g1
	sdivx	%i3,	0x0BBF,	%i5
	movvs	%xcc,	%g4,	%o5
	fcmped	%fcc3,	%f4,	%f8
	subcc	%i1,	%g5,	%g2
	udivx	%i6,	0x1661,	%i7
	srax	%l3,	%g3,	%g6
	stb	%g7,	[%l7 + 0x12]
	edge32	%o2,	%l5,	%i0
	ldsb	[%l7 + 0x09],	%l6
	mulx	%i2,	0x1C03,	%l2
	ld	[%l7 + 0x38],	%f2
	fnot2	%f2,	%f14
	stx	%o6,	[%l7 + 0x68]
	andncc	%o1,	%o7,	%l1
	movl	%xcc,	%o3,	%l4
	or	%o4,	%o0,	%i4
	udivcc	%g1,	0x0E71,	%i3
	sethi	0x1207,	%i5
	orn	%g4,	%l0,	%o5
	sdivcc	%i1,	0x1BB5,	%g2
	smulcc	%i6,	%g5,	%l3
	alignaddrl	%i7,	%g3,	%g6
	fxnor	%f0,	%f2,	%f2
	orcc	%g7,	%o2,	%l5
	move	%xcc,	%l6,	%i0
	stw	%i2,	[%l7 + 0x50]
	umul	%l2,	0x1A54,	%o6
	edge16	%o1,	%o7,	%o3
	fcmpne32	%f12,	%f0,	%l1
	fmovdneg	%xcc,	%f14,	%f9
	fmovsvc	%icc,	%f1,	%f9
	lduw	[%l7 + 0x44],	%l4
	ldsb	[%l7 + 0x60],	%o4
	movle	%icc,	%i4,	%g1
	fmovsl	%icc,	%f7,	%f3
	subc	%i3,	%o0,	%i5
	movrgez	%l0,	0x109,	%o5
	move	%icc,	%g4,	%i1
	mulscc	%g2,	0x1800,	%i6
	movg	%xcc,	%l3,	%i7
	add	%g5,	0x0035,	%g3
	move	%icc,	%g7,	%g6
	edge16	%o2,	%l6,	%i0
	xorcc	%l5,	0x1BC7,	%l2
	edge8l	%i2,	%o6,	%o1
	subccc	%o7,	%l1,	%o3
	movrne	%o4,	0x018,	%l4
	fmul8x16au	%f9,	%f4,	%f8
	andn	%g1,	0x1368,	%i4
	edge16ln	%o0,	%i5,	%l0
	edge32l	%i3,	%g4,	%i1
	movvc	%xcc,	%o5,	%i6
	movrlz	%l3,	%g2,	%i7
	movvs	%icc,	%g5,	%g3
	edge8ln	%g7,	%g6,	%l6
	fmovdg	%icc,	%f4,	%f9
	fmovdge	%xcc,	%f6,	%f8
	for	%f8,	%f0,	%f0
	orncc	%i0,	0x145C,	%o2
	stx	%l5,	[%l7 + 0x28]
	fcmpd	%fcc0,	%f6,	%f12
	andncc	%i2,	%o6,	%l2
	sllx	%o7,	0x1D,	%o1
	stb	%o3,	[%l7 + 0x3B]
	fpadd32	%f6,	%f14,	%f14
	edge8	%o4,	%l1,	%l4
	smulcc	%i4,	%o0,	%g1
	smul	%l0,	0x07E1,	%i5
	alignaddrl	%g4,	%i1,	%o5
	xnorcc	%i6,	0x13EE,	%i3
	sllx	%g2,	0x1C,	%i7
	movcc	%icc,	%g5,	%l3
	std	%f12,	[%l7 + 0x18]
	fnot2	%f8,	%f14
	movcc	%icc,	%g3,	%g7
	addccc	%l6,	%g6,	%o2
	srlx	%l5,	%i2,	%o6
	ldub	[%l7 + 0x5B],	%l2
	st	%f4,	[%l7 + 0x40]
	edge32	%o7,	%i0,	%o1
	siam	0x7
	edge8	%o4,	%o3,	%l1
	smul	%l4,	%i4,	%o0
	array8	%l0,	%i5,	%g4
	sub	%i1,	0x11D2,	%o5
	fmovs	%f13,	%f9
	alignaddrl	%i6,	%i3,	%g2
	movrlez	%g1,	0x32C,	%g5
	restore %l3, 0x052C, %i7
	movrlz	%g7,	%g3,	%g6
	umulcc	%o2,	%l6,	%l5
	sll	%i2,	0x0E,	%l2
	and	%o7,	0x16ED,	%o6
	edge16	%o1,	%i0,	%o4
	ldx	[%l7 + 0x48],	%l1
	movrgez	%l4,	0x1BB,	%o3
	movvs	%xcc,	%i4,	%l0
	movg	%icc,	%i5,	%g4
	edge32	%o0,	%i1,	%o5
	fmovrslez	%i6,	%f13,	%f7
	srlx	%i3,	%g2,	%g5
	stx	%g1,	[%l7 + 0x28]
	movgu	%xcc,	%i7,	%g7
	edge8n	%l3,	%g6,	%o2
	array16	%l6,	%g3,	%l5
	ldx	[%l7 + 0x30],	%l2
	movrlez	%o7,	%o6,	%o1
	fornot1s	%f10,	%f9,	%f3
	fpsub16	%f2,	%f4,	%f8
	movpos	%xcc,	%i0,	%o4
	mulx	%l1,	%l4,	%o3
	movvs	%xcc,	%i2,	%l0
	andn	%i4,	%g4,	%i5
	fmovsg	%icc,	%f12,	%f6
	mulscc	%i1,	%o0,	%i6
	lduw	[%l7 + 0x5C],	%o5
	move	%xcc,	%g2,	%i3
	array16	%g5,	%g1,	%i7
	movrne	%g7,	%g6,	%l3
	movneg	%icc,	%l6,	%o2
	srl	%g3,	0x06,	%l2
	movre	%o7,	%o6,	%o1
	edge16l	%l5,	%i0,	%l1
	stx	%l4,	[%l7 + 0x28]
	subc	%o3,	0x036E,	%o4
	edge8	%l0,	%i4,	%i2
	sll	%i5,	0x1C,	%i1
	andcc	%o0,	%i6,	%g4
	mulx	%g2,	0x1B57,	%i3
	andcc	%o5,	%g1,	%g5
	orn	%i7,	%g6,	%l3
	siam	0x6
	lduh	[%l7 + 0x5E],	%l6
	fmul8x16au	%f1,	%f4,	%f4
	movre	%o2,	%g3,	%l2
	lduw	[%l7 + 0x40],	%g7
	alignaddrl	%o7,	%o6,	%l5
	xnorcc	%o1,	%i0,	%l1
	fpadd32s	%f10,	%f2,	%f4
	movgu	%icc,	%o3,	%o4
	movne	%xcc,	%l0,	%i4
	movn	%xcc,	%i2,	%l4
	edge32ln	%i5,	%i1,	%i6
	movle	%icc,	%o0,	%g4
	fmovsge	%xcc,	%f5,	%f7
	orncc	%g2,	0x07A5,	%o5
	fcmple16	%f12,	%f0,	%g1
	addc	%i3,	%i7,	%g5
	ldsb	[%l7 + 0x78],	%l3
	udivx	%l6,	0x1E7E,	%o2
	srl	%g6,	%g3,	%g7
	ld	[%l7 + 0x0C],	%f9
	fmovrsne	%o7,	%f1,	%f3
	and	%o6,	%l5,	%l2
	fabss	%f8,	%f1
	movre	%o1,	%i0,	%l1
	smul	%o4,	0x0C17,	%o3
	movrlez	%i4,	%i2,	%l0
	sllx	%l4,	%i1,	%i5
	movvs	%icc,	%o0,	%i6
	edge8ln	%g2,	%g4,	%g1
	std	%f8,	[%l7 + 0x68]
	or	%o5,	%i3,	%i7
	ld	[%l7 + 0x50],	%f1
	array16	%g5,	%l3,	%l6
	fmovsle	%xcc,	%f3,	%f5
	umulcc	%o2,	0x0752,	%g3
	xnorcc	%g7,	%o7,	%o6
	sdivx	%g6,	0x0B8E,	%l5
	lduw	[%l7 + 0x2C],	%l2
	andcc	%o1,	%l1,	%o4
	ldd	[%l7 + 0x28],	%i0
	stx	%o3,	[%l7 + 0x40]
	subc	%i2,	%i4,	%l0
	fcmpeq32	%f4,	%f8,	%i1
	addc	%l4,	0x0EC0,	%i5
	mova	%icc,	%i6,	%g2
	ld	[%l7 + 0x1C],	%f12
	fnot1	%f4,	%f0
	movvc	%xcc,	%g4,	%o0
	movrgez	%g1,	0x30D,	%o5
	fzero	%f14
	fcmps	%fcc1,	%f13,	%f5
	fcmps	%fcc3,	%f6,	%f3
	sdiv	%i3,	0x1B8F,	%i7
	array32	%l3,	%l6,	%o2
	movleu	%xcc,	%g5,	%g7
	movne	%icc,	%o7,	%o6
	ldsw	[%l7 + 0x20],	%g6
	mulscc	%l5,	%g3,	%o1
	umulcc	%l1,	%o4,	%i0
	edge8	%l2,	%o3,	%i2
	movneg	%icc,	%l0,	%i4
	srax	%i1,	0x1C,	%l4
	array8	%i6,	%i5,	%g4
	sdivx	%o0,	0x16E6,	%g1
	ldsw	[%l7 + 0x0C],	%o5
	movle	%xcc,	%g2,	%i7
	ld	[%l7 + 0x08],	%f9
	addccc	%i3,	0x15BB,	%l6
	popc	0x03AE,	%l3
	edge8ln	%g5,	%o2,	%g7
	fabss	%f12,	%f13
	fmovse	%icc,	%f7,	%f9
	ld	[%l7 + 0x30],	%f3
	fcmpeq16	%f8,	%f12,	%o6
	movrgez	%o7,	%l5,	%g3
	ld	[%l7 + 0x38],	%f8
	lduh	[%l7 + 0x08],	%o1
	array16	%l1,	%o4,	%g6
	sethi	0x15EA,	%i0
	srax	%l2,	%o3,	%i2
	ldsb	[%l7 + 0x20],	%l0
	andn	%i4,	0x17A1,	%i1
	fmovrdlz	%l4,	%f0,	%f6
	movpos	%xcc,	%i5,	%i6
	or	%o0,	0x080C,	%g1
	edge32ln	%o5,	%g4,	%g2
	movleu	%icc,	%i3,	%i7
	edge8	%l3,	%g5,	%o2
	lduw	[%l7 + 0x40],	%g7
	fcmpgt32	%f6,	%f14,	%l6
	fpsub32s	%f1,	%f11,	%f9
	addccc	%o6,	0x06D5,	%o7
	bshuffle	%f4,	%f0,	%f8
	stw	%g3,	[%l7 + 0x7C]
	sra	%l5,	%o1,	%o4
	movcc	%xcc,	%l1,	%i0
	fcmpne16	%f10,	%f10,	%l2
	subccc	%g6,	0x1457,	%o3
	umulcc	%i2,	0x0E14,	%l0
	edge16n	%i4,	%l4,	%i5
	fmovsvc	%icc,	%f12,	%f8
	movrlz	%i6,	0x2CC,	%o0
	array32	%g1,	%o5,	%g4
	edge32n	%g2,	%i1,	%i7
	ld	[%l7 + 0x4C],	%f9
	edge8n	%l3,	%i3,	%o2
	movvs	%xcc,	%g5,	%g7
	movneg	%icc,	%l6,	%o6
	addc	%g3,	0x1043,	%o7
	edge8	%l5,	%o1,	%o4
	sllx	%i0,	%l1,	%g6
	fmovrdlz	%l2,	%f10,	%f2
	movne	%icc,	%i2,	%o3
	ldub	[%l7 + 0x24],	%l0
	sll	%i4,	0x08,	%l4
	std	%f2,	[%l7 + 0x68]
	udivcc	%i6,	0x07E3,	%i5
	mulx	%o0,	0x08A9,	%g1
	ldx	[%l7 + 0x38],	%g4
	xnorcc	%o5,	%g2,	%i1
	smulcc	%i7,	0x0AF1,	%i3
	array32	%o2,	%g5,	%l3
	ld	[%l7 + 0x70],	%f3
	mulx	%g7,	0x0DB5,	%o6
	movvc	%xcc,	%l6,	%g3
	xor	%l5,	%o1,	%o4
	movge	%xcc,	%o7,	%l1
	edge16l	%g6,	%i0,	%i2
	fsrc2s	%f3,	%f5
	movrgz	%o3,	0x104,	%l0
	smul	%i4,	%l2,	%i6
	orncc	%i5,	0x105B,	%o0
	edge16	%l4,	%g4,	%o5
	udiv	%g2,	0x00BF,	%g1
	mulscc	%i1,	%i3,	%o2
	fand	%f2,	%f4,	%f2
	sth	%i7,	[%l7 + 0x10]
	std	%f10,	[%l7 + 0x38]
	alignaddr	%l3,	%g5,	%o6
	andn	%g7,	%g3,	%l6
	lduw	[%l7 + 0x74],	%l5
	ldsb	[%l7 + 0x4F],	%o1
	movg	%icc,	%o4,	%l1
	subc	%g6,	%i0,	%i2
	sll	%o3,	%l0,	%o7
	st	%f14,	[%l7 + 0x3C]
	ldx	[%l7 + 0x68],	%i4
	movre	%i6,	%i5,	%o0
	smulcc	%l4,	0x1436,	%l2
	alignaddrl	%o5,	%g4,	%g1
	lduh	[%l7 + 0x4A],	%i1
	sra	%i3,	%g2,	%o2
	fpsub32	%f8,	%f12,	%f14
	ldsw	[%l7 + 0x5C],	%i7
	lduh	[%l7 + 0x72],	%l3
	sth	%o6,	[%l7 + 0x1A]
	fones	%f8
	fmovsvs	%xcc,	%f14,	%f1
	movvs	%icc,	%g5,	%g3
	fmovsn	%icc,	%f6,	%f15
	edge8	%l6,	%g7,	%l5
	addccc	%o4,	%o1,	%g6
	srlx	%l1,	%i0,	%o3
	edge16n	%l0,	%o7,	%i2
	xnorcc	%i6,	%i5,	%o0
	movcs	%xcc,	%l4,	%l2
	movcc	%xcc,	%o5,	%i4
	fnot2s	%f14,	%f11
	movrgez	%g1,	0x0E2,	%i1
	fpsub16	%f14,	%f4,	%f14
	add	%i3,	%g2,	%g4
	movne	%xcc,	%o2,	%l3
	stb	%o6,	[%l7 + 0x5D]
	fnot1	%f12,	%f14
	movn	%xcc,	%g5,	%i7
	movrne	%l6,	%g7,	%l5
	fmovdcc	%icc,	%f4,	%f0
	ldsw	[%l7 + 0x14],	%g3
	sethi	0x1EFE,	%o1
	lduh	[%l7 + 0x2E],	%g6
	edge32l	%l1,	%o4,	%o3
	subcc	%l0,	0x11D8,	%i0
	fornot1	%f8,	%f2,	%f0
	subccc	%i2,	0x169A,	%o7
	edge32	%i5,	%o0,	%i6
	lduw	[%l7 + 0x0C],	%l2
	mulx	%l4,	%o5,	%g1
	mova	%xcc,	%i1,	%i3
	sllx	%i4,	0x05,	%g4
	restore %g2, 0x1960, %o2
	stx	%o6,	[%l7 + 0x50]
	udivcc	%l3,	0x16EF,	%i7
	xnorcc	%l6,	0x1BCA,	%g7
	edge32ln	%g5,	%l5,	%g3
	addcc	%g6,	0x0583,	%o1
	srax	%l1,	%o3,	%l0
	srax	%i0,	%i2,	%o7
	movrgez	%i5,	%o0,	%o4
	umul	%i6,	0x129E,	%l4
	fmul8sux16	%f8,	%f0,	%f0
	xorcc	%l2,	0x1A93,	%g1
	movl	%icc,	%o5,	%i3
	ldsw	[%l7 + 0x7C],	%i4
	fpackfix	%f2,	%f8
	fcmple16	%f2,	%f12,	%i1
	umulcc	%g2,	%g4,	%o2
	fmovrsgez	%o6,	%f4,	%f14
	stw	%i7,	[%l7 + 0x1C]
	fornot1s	%f1,	%f14,	%f11
	mova	%icc,	%l6,	%g7
	lduh	[%l7 + 0x5A],	%g5
	fmovdcs	%xcc,	%f12,	%f10
	edge8n	%l5,	%l3,	%g6
	st	%f15,	[%l7 + 0x20]
	andncc	%o1,	%l1,	%g3
	movre	%o3,	%i0,	%l0
	fornot1s	%f4,	%f14,	%f12
	fcmpeq16	%f6,	%f6,	%o7
	movrgez	%i5,	%o0,	%o4
	movle	%icc,	%i2,	%i6
	subccc	%l2,	%g1,	%l4
	edge8n	%o5,	%i3,	%i4
	array8	%i1,	%g4,	%o2
	fcmpne16	%f8,	%f6,	%o6
	orcc	%i7,	%l6,	%g7
	fpsub32s	%f5,	%f4,	%f5
	add	%g2,	0x1F91,	%g5
	movgu	%icc,	%l5,	%l3
	fcmps	%fcc0,	%f13,	%f8
	alignaddr	%g6,	%o1,	%l1
	movl	%icc,	%o3,	%i0
	sethi	0x0740,	%g3
	fmul8x16	%f5,	%f14,	%f4
	edge16n	%o7,	%l0,	%i5
	movle	%xcc,	%o0,	%i2
	fmovrde	%i6,	%f6,	%f2
	udivx	%o4,	0x16D8,	%l2
	edge16ln	%g1,	%l4,	%o5
	xorcc	%i3,	0x0B94,	%i4
	fnot1	%f0,	%f6
	mulx	%g4,	%i1,	%o6
	fxors	%f14,	%f0,	%f11
	edge8ln	%i7,	%l6,	%o2
	subcc	%g7,	0x1F58,	%g2
	fmovdne	%icc,	%f9,	%f9
	subcc	%l5,	0x0586,	%l3
	and	%g6,	0x1DDD,	%o1
	movgu	%xcc,	%g5,	%l1
	restore %o3, %i0, %o7
	sub	%g3,	%l0,	%o0
	edge32	%i2,	%i5,	%o4
	ldub	[%l7 + 0x1A],	%l2
	fabss	%f8,	%f1
	subcc	%g1,	0x12F3,	%i6
	edge32	%o5,	%l4,	%i4
	xnorcc	%g4,	0x0035,	%i1
	or	%i3,	0x1808,	%o6
	movrne	%i7,	0x2E1,	%o2
	orn	%g7,	0x0441,	%l6
	save %g2, 0x1F4C, %l3
	movge	%icc,	%g6,	%l5
	edge8l	%o1,	%g5,	%o3
	ldsw	[%l7 + 0x3C],	%l1
	xorcc	%o7,	0x1013,	%i0
	udiv	%l0,	0x0522,	%g3
	movle	%xcc,	%o0,	%i5
	edge16	%o4,	%i2,	%l2
	edge32l	%g1,	%o5,	%i6
	srax	%l4,	%g4,	%i4
	movrlz	%i3,	0x1BC,	%i1
	movn	%icc,	%i7,	%o2
	subcc	%g7,	%o6,	%l6
	fmovrdlez	%g2,	%f14,	%f14
	movg	%xcc,	%l3,	%l5
	srlx	%o1,	%g5,	%o3
	edge32l	%g6,	%o7,	%l1
	addcc	%l0,	0x0436,	%i0
	fnegs	%f14,	%f1
	xorcc	%g3,	%o0,	%o4
	edge32n	%i5,	%i2,	%l2
	fmovdg	%xcc,	%f2,	%f14
	andn	%o5,	0x164A,	%i6
	movcs	%icc,	%g1,	%g4
	lduw	[%l7 + 0x6C],	%l4
	movvc	%xcc,	%i4,	%i1
	lduh	[%l7 + 0x58],	%i7
	andn	%i3,	%g7,	%o6
	std	%f4,	[%l7 + 0x20]
	restore %l6, 0x0F59, %g2
	udivx	%l3,	0x09D1,	%l5
	sth	%o1,	[%l7 + 0x7E]
	ldsb	[%l7 + 0x1C],	%o2
	movvs	%xcc,	%o3,	%g6
	fandnot1s	%f8,	%f2,	%f13
	stx	%o7,	[%l7 + 0x78]
	edge32n	%l1,	%l0,	%i0
	sdiv	%g3,	0x0BC4,	%g5
	udiv	%o0,	0x0AD8,	%i5
	subc	%o4,	%i2,	%l2
	smul	%i6,	%g1,	%o5
	fands	%f10,	%f9,	%f14
	andncc	%l4,	%g4,	%i4
	fandnot2	%f10,	%f0,	%f12
	stx	%i1,	[%l7 + 0x40]
	subc	%i3,	0x16D5,	%g7
	sdivx	%i7,	0x1051,	%l6
	and	%o6,	%l3,	%g2
	fands	%f5,	%f4,	%f12
	xorcc	%l5,	0x0785,	%o2
	fmovscc	%icc,	%f0,	%f8
	fmul8sux16	%f10,	%f0,	%f2
	fmovrsne	%o3,	%f9,	%f12
	addc	%g6,	0x0861,	%o1
	srlx	%l1,	0x1D,	%o7
	fmovrdgez	%i0,	%f12,	%f8
	movcs	%xcc,	%g3,	%g5
	sllx	%l0,	0x0F,	%i5
	movrgez	%o4,	%o0,	%l2
	ldsb	[%l7 + 0x62],	%i2
	xnorcc	%i6,	%g1,	%l4
	edge32ln	%o5,	%g4,	%i4
	movrlez	%i3,	%g7,	%i1
	fmovrdne	%l6,	%f10,	%f6
	fmovsge	%icc,	%f2,	%f15
	fands	%f2,	%f0,	%f14
	fmul8x16	%f12,	%f0,	%f8
	andn	%o6,	0x07EE,	%i7
	sllx	%g2,	%l3,	%o2
	fpsub16s	%f13,	%f7,	%f12
	array16	%o3,	%g6,	%o1
	movcs	%xcc,	%l5,	%l1
	movrlz	%o7,	%i0,	%g5
	movne	%xcc,	%g3,	%i5
	edge16	%l0,	%o4,	%o0
	fpack16	%f0,	%f3
	edge16	%l2,	%i6,	%g1
	sllx	%l4,	%o5,	%i2
	fmovsge	%xcc,	%f0,	%f15
	fandnot2s	%f13,	%f3,	%f0
	edge32l	%i4,	%i3,	%g7
	movrlez	%g4,	%l6,	%i1
	udiv	%o6,	0x0F7C,	%i7
	std	%f14,	[%l7 + 0x50]
	fsrc1	%f12,	%f10
	xor	%g2,	%o2,	%o3
	add	%g6,	0x1F5B,	%o1
	sub	%l3,	0x08BE,	%l5
	movle	%icc,	%l1,	%o7
	array8	%i0,	%g5,	%g3
	save %i5, 0x078B, %o4
	edge16	%l0,	%l2,	%i6
	smulcc	%o0,	%l4,	%o5
	movge	%icc,	%g1,	%i2
	ldub	[%l7 + 0x6C],	%i4
	andncc	%i3,	%g4,	%l6
	edge8ln	%g7,	%o6,	%i1
	edge16	%i7,	%g2,	%o3
	sth	%o2,	[%l7 + 0x18]
	std	%f14,	[%l7 + 0x20]
	fmuld8sux16	%f5,	%f14,	%f10
	andncc	%g6,	%l3,	%o1
	movneg	%icc,	%l1,	%o7
	udivx	%l5,	0x1DD9,	%g5
	ldub	[%l7 + 0x37],	%g3
	addcc	%i0,	%i5,	%l0
	sth	%o4,	[%l7 + 0x70]
	movge	%xcc,	%l2,	%i6
	edge32	%o0,	%l4,	%g1
	sllx	%o5,	%i2,	%i4
	smulcc	%g4,	0x0DCE,	%l6
	edge16l	%i3,	%g7,	%o6
	ldsb	[%l7 + 0x6D],	%i7
	fmovse	%icc,	%f9,	%f2
	edge8l	%g2,	%i1,	%o2
	fandnot1s	%f5,	%f3,	%f5
	restore %o3, 0x05E8, %l3
	andncc	%o1,	%g6,	%l1
	movl	%icc,	%l5,	%g5
	array16	%o7,	%g3,	%i0
	fmovrdlez	%l0,	%f8,	%f2
	edge8ln	%i5,	%l2,	%i6
	xnorcc	%o4,	0x0948,	%o0
	andncc	%l4,	%o5,	%i2
	fpadd16	%f10,	%f2,	%f2
	srax	%i4,	%g1,	%l6
	fcmpeq32	%f0,	%f10,	%g4
	edge8	%g7,	%i3,	%i7
	sll	%o6,	%g2,	%o2
	fzeros	%f14
	subccc	%i1,	0x0EBC,	%l3
	edge8	%o3,	%g6,	%o1
	bshuffle	%f2,	%f10,	%f4
	edge16	%l5,	%g5,	%o7
	udivx	%l1,	0x1359,	%i0
	fcmpes	%fcc0,	%f6,	%f12
	sth	%g3,	[%l7 + 0x60]
	sra	%i5,	%l0,	%l2
	sdivcc	%i6,	0x1353,	%o0
	movrgez	%o4,	%o5,	%l4
	fpadd16	%f12,	%f14,	%f0
	andn	%i2,	%g1,	%l6
	movvc	%icc,	%g4,	%i4
	edge32ln	%i3,	%g7,	%i7
	edge8	%g2,	%o6,	%i1
	movge	%xcc,	%l3,	%o2
	ldsw	[%l7 + 0x2C],	%g6
	xorcc	%o1,	0x08F5,	%l5
	movle	%xcc,	%g5,	%o3
	fpsub32s	%f1,	%f14,	%f11
	xor	%o7,	0x039C,	%i0
	stb	%l1,	[%l7 + 0x3E]
	fandnot1	%f12,	%f10,	%f4
	edge32	%g3,	%l0,	%i5
	subccc	%i6,	0x101C,	%o0
	fornot1	%f2,	%f12,	%f8
	andn	%l2,	%o5,	%l4
	orncc	%o4,	0x1E5A,	%g1
	smul	%l6,	0x1719,	%i2
	xnorcc	%i4,	0x05A5,	%i3
	fandnot2	%f2,	%f10,	%f2
	orcc	%g4,	%g7,	%g2
	popc	0x0D55,	%i7
	srl	%o6,	%i1,	%o2
	orn	%g6,	0x17B8,	%l3
	smulcc	%o1,	%l5,	%g5
	st	%f7,	[%l7 + 0x14]
	movcs	%xcc,	%o3,	%i0
	fmovrsgz	%l1,	%f13,	%f15
	orncc	%g3,	%l0,	%o7
	orn	%i6,	0x196D,	%o0
	fors	%f4,	%f13,	%f14
	fcmpeq16	%f10,	%f10,	%i5
	sll	%l2,	0x0D,	%o5
	edge8n	%o4,	%g1,	%l4
	fmovdcc	%xcc,	%f7,	%f3
	lduh	[%l7 + 0x7A],	%i2
	udivx	%i4,	0x099B,	%i3
	movcs	%xcc,	%l6,	%g4
	alignaddrl	%g7,	%g2,	%i7
	fxnor	%f6,	%f6,	%f4
	andn	%i1,	0x178C,	%o6
	fmovsne	%xcc,	%f10,	%f14
	udivx	%o2,	0x0D6C,	%l3
	array32	%o1,	%g6,	%l5
	fmovsge	%xcc,	%f13,	%f14
	fmovdge	%icc,	%f11,	%f1
	xnorcc	%o3,	%i0,	%l1
	ldsb	[%l7 + 0x4D],	%g5
	andncc	%l0,	%g3,	%i6
	addccc	%o7,	0x1616,	%o0
	mulx	%i5,	%l2,	%o5
	fnot2s	%f9,	%f10
	edge8	%g1,	%o4,	%i2
	fmovse	%xcc,	%f8,	%f3
	xnor	%i4,	0x1E69,	%i3
	save %l6, %g4, %l4
	udivcc	%g2,	0x04B2,	%i7
	srl	%i1,	0x04,	%g7
	edge8l	%o6,	%l3,	%o1
	orn	%o2,	0x0DAB,	%l5
	xnorcc	%o3,	0x1561,	%i0
	fpadd16s	%f14,	%f4,	%f0
	movleu	%icc,	%l1,	%g5
	fpsub32	%f4,	%f10,	%f12
	movle	%icc,	%l0,	%g6
	udiv	%g3,	0x0561,	%i6
	orn	%o7,	%o0,	%i5
	subccc	%l2,	%o5,	%o4
	movvc	%xcc,	%i2,	%i4
	movg	%icc,	%g1,	%l6
	movn	%icc,	%g4,	%l4
	andcc	%i3,	%g2,	%i1
	sdiv	%g7,	0x1E7E,	%i7
	mulscc	%o6,	0x1C8E,	%l3
	ldsh	[%l7 + 0x36],	%o1
	xnor	%o2,	%o3,	%i0
	ldx	[%l7 + 0x30],	%l1
	lduw	[%l7 + 0x18],	%l5
	sdivcc	%g5,	0x00C9,	%l0
	save %g6, %g3, %o7
	fpsub16s	%f6,	%f5,	%f10
	movvc	%xcc,	%o0,	%i5
	fcmps	%fcc1,	%f15,	%f15
	udiv	%l2,	0x10D4,	%o5
	fmovdcc	%icc,	%f0,	%f8
	edge32l	%o4,	%i6,	%i4
	fmovsvs	%xcc,	%f1,	%f5
	fmovsvc	%icc,	%f1,	%f11
	orn	%g1,	0x118D,	%i2
	fpsub32	%f6,	%f2,	%f4
	xnor	%g4,	0x070D,	%l4
	movvs	%icc,	%l6,	%g2
	stw	%i1,	[%l7 + 0x4C]
	edge32ln	%i3,	%i7,	%o6
	subc	%g7,	%l3,	%o1
	bshuffle	%f2,	%f4,	%f8
	ldd	[%l7 + 0x10],	%f2
	edge16ln	%o3,	%i0,	%l1
	edge8ln	%o2,	%l5,	%g5
	fones	%f3
	fands	%f4,	%f15,	%f13
	udiv	%l0,	0x19A1,	%g6
	array16	%o7,	%o0,	%g3
	sllx	%l2,	0x06,	%o5
	popc	0x1F9F,	%i5
	movvc	%xcc,	%i6,	%i4
	lduh	[%l7 + 0x22],	%o4
	fmovscs	%xcc,	%f3,	%f11
	movvs	%xcc,	%i2,	%g1
	ldsh	[%l7 + 0x50],	%l4
	fnot1s	%f14,	%f4
	edge8	%l6,	%g2,	%i1
	smulcc	%i3,	%g4,	%i7
	fnor	%f10,	%f10,	%f2
	fxor	%f10,	%f2,	%f0
	array32	%g7,	%o6,	%l3
	fmovdne	%icc,	%f10,	%f10
	sdivx	%o3,	0x0EDF,	%i0
	mova	%xcc,	%o1,	%l1
	fcmpeq32	%f14,	%f10,	%l5
	movl	%icc,	%g5,	%l0
	edge8l	%g6,	%o7,	%o0
	restore %o2, 0x0D90, %l2
	sdivcc	%o5,	0x1FA8,	%g3
	movvs	%xcc,	%i5,	%i4
	edge8ln	%i6,	%o4,	%i2
	edge8ln	%l4,	%l6,	%g2
	movpos	%xcc,	%i1,	%g1
	fnot2	%f8,	%f8
	movrlez	%i3,	%g4,	%g7
	movvs	%icc,	%i7,	%l3
	edge32ln	%o3,	%o6,	%i0
	movrne	%l1,	%o1,	%l5
	movl	%xcc,	%g5,	%g6
	fmovsgu	%xcc,	%f4,	%f6
	fandnot1s	%f6,	%f4,	%f4
	lduh	[%l7 + 0x68],	%l0
	umulcc	%o0,	%o7,	%o2
	mulx	%o5,	0x1EA5,	%g3
	smulcc	%l2,	%i4,	%i5
	fmovrdlz	%o4,	%f0,	%f2
	smulcc	%i2,	%i6,	%l4
	add	%g2,	%l6,	%g1
	fmovsl	%icc,	%f6,	%f2
	fpackfix	%f10,	%f10
	fcmpes	%fcc3,	%f13,	%f7
	sub	%i1,	%i3,	%g4
	alignaddrl	%i7,	%g7,	%o3
	alignaddrl	%l3,	%i0,	%l1
	srax	%o1,	%l5,	%g5
	umulcc	%o6,	0x0E65,	%l0
	ldsw	[%l7 + 0x50],	%o0
	orncc	%o7,	0x0072,	%o2
	andn	%o5,	0x05E7,	%g3
	srax	%l2,	%i4,	%g6
	mulscc	%i5,	%i2,	%i6
	movrlez	%o4,	0x1AD,	%g2
	movrgez	%l6,	%l4,	%i1
	subccc	%i3,	%g1,	%i7
	xnor	%g4,	0x0A28,	%g7
	movneg	%icc,	%l3,	%i0
	addccc	%l1,	%o3,	%o1
	movge	%xcc,	%l5,	%g5
	sdiv	%l0,	0x1472,	%o6
	movrlz	%o0,	0x0A9,	%o2
	fmovsne	%icc,	%f6,	%f7
	save %o5, 0x1690, %g3
	fmovdgu	%xcc,	%f12,	%f8
	fnands	%f6,	%f9,	%f12
	fmovrde	%l2,	%f8,	%f12
	fmovsge	%icc,	%f9,	%f7
	movl	%icc,	%o7,	%g6
	sdivx	%i5,	0x1694,	%i4
	movn	%xcc,	%i2,	%o4
	movn	%xcc,	%i6,	%g2
	movrlz	%l6,	0x04A,	%l4
	subccc	%i1,	%i3,	%g1
	fmovdgu	%xcc,	%f0,	%f8
	mulscc	%i7,	0x1E0B,	%g7
	lduw	[%l7 + 0x68],	%g4
	array32	%l3,	%l1,	%i0
	movl	%icc,	%o1,	%o3
	sll	%g5,	0x0C,	%l0
	edge32	%o6,	%o0,	%o2
	sub	%o5,	%l5,	%l2
	subcc	%g3,	0x10F7,	%o7
	fmul8x16	%f11,	%f6,	%f4
	stx	%i5,	[%l7 + 0x48]
	xorcc	%g6,	0x16A2,	%i4
	subc	%o4,	%i2,	%g2
	edge32ln	%l6,	%i6,	%l4
	andn	%i1,	%g1,	%i3
	udiv	%i7,	0x07FB,	%g7
	udivx	%l3,	0x1CE5,	%l1
	subccc	%i0,	0x12A9,	%g4
	movrgez	%o3,	0x26C,	%g5
	alignaddrl	%l0,	%o1,	%o6
	movne	%xcc,	%o2,	%o0
	fpackfix	%f10,	%f5
	orn	%l5,	0x0839,	%l2
	sra	%g3,	%o5,	%i5
	fmovrdlez	%g6,	%f8,	%f10
	and	%o7,	%i4,	%o4
	umulcc	%g2,	0x1A73,	%l6
	save %i6, %i2, %i1
	fnot2	%f14,	%f6
	subc	%l4,	0x1F5B,	%g1
	lduh	[%l7 + 0x62],	%i7
	add	%i3,	0x1D7C,	%l3
	edge8l	%l1,	%i0,	%g4
	movneg	%xcc,	%o3,	%g7
	faligndata	%f8,	%f0,	%f10
	movrlez	%g5,	%o1,	%o6
	smul	%o2,	%l0,	%o0
	lduw	[%l7 + 0x5C],	%l5
	udivx	%g3,	0x0CC5,	%l2
	fpsub32s	%f8,	%f15,	%f11
	sth	%i5,	[%l7 + 0x4A]
	subccc	%g6,	0x1757,	%o5
	andncc	%o7,	%o4,	%g2
	fmovrdlz	%i4,	%f0,	%f2
	edge32ln	%l6,	%i2,	%i1
	popc	0x0322,	%l4
	edge16l	%i6,	%g1,	%i7
	orcc	%l3,	0x1900,	%l1
	fmovrdne	%i3,	%f8,	%f14
	sllx	%g4,	%i0,	%o3
	movpos	%xcc,	%g7,	%o1
	movge	%xcc,	%o6,	%o2
	movl	%icc,	%g5,	%o0
	sll	%l5,	%g3,	%l0
	save %i5, %g6, %o5
	alignaddrl	%o7,	%l2,	%o4
	array16	%g2,	%l6,	%i4
	edge8ln	%i2,	%i1,	%i6
	ldx	[%l7 + 0x60],	%l4
	smulcc	%i7,	0x1D71,	%g1
	subcc	%l1,	0x0F3F,	%l3
	ldsh	[%l7 + 0x72],	%i3
	movrgz	%i0,	%g4,	%o3
	fabsd	%f12,	%f6
	fcmpd	%fcc2,	%f14,	%f14
	sethi	0x0B5A,	%o1
	fpack32	%f0,	%f2,	%f10
	sdiv	%g7,	0x19AD,	%o6
	movrne	%g5,	%o0,	%o2
	fmovdle	%xcc,	%f7,	%f4
	fors	%f10,	%f0,	%f13
	bshuffle	%f6,	%f4,	%f12
	andn	%l5,	%g3,	%i5
	movn	%xcc,	%l0,	%o5
	xnorcc	%o7,	0x02E8,	%l2
	movl	%icc,	%o4,	%g6
	ldd	[%l7 + 0x70],	%i6
	edge32ln	%i4,	%g2,	%i2
	ldsb	[%l7 + 0x30],	%i1
	fmovsn	%xcc,	%f10,	%f4
	fsrc2s	%f0,	%f12
	edge32l	%l4,	%i7,	%i6
	movvc	%xcc,	%l1,	%l3
	edge16ln	%i3,	%g1,	%i0
	movpos	%icc,	%g4,	%o3
	fpsub32	%f2,	%f0,	%f10
	edge16l	%g7,	%o6,	%g5
	fnegd	%f12,	%f8
	fmovrdlez	%o1,	%f2,	%f4
	fsrc2	%f14,	%f8
	mova	%icc,	%o0,	%l5
	fone	%f2
	movne	%icc,	%o2,	%g3
	st	%f8,	[%l7 + 0x2C]
	alignaddrl	%l0,	%i5,	%o5
	movgu	%xcc,	%l2,	%o4
	fpackfix	%f8,	%f11
	fpsub32s	%f5,	%f4,	%f2
	edge32ln	%o7,	%l6,	%i4
	array32	%g2,	%g6,	%i2
	movrgez	%l4,	0x052,	%i7
	smulcc	%i1,	0x15ED,	%i6
	sllx	%l3,	%l1,	%i3
	fpadd32s	%f3,	%f9,	%f5
	sll	%i0,	0x12,	%g4
	fornot2s	%f15,	%f12,	%f9
	fmovdne	%xcc,	%f3,	%f8
	fmovsleu	%xcc,	%f12,	%f1
	edge32l	%g1,	%o3,	%o6
	edge16l	%g5,	%g7,	%o1
	xnorcc	%o0,	%o2,	%l5
	fxors	%f9,	%f4,	%f3
	movre	%l0,	%g3,	%i5
	alignaddr	%l2,	%o4,	%o5
	fpsub16s	%f8,	%f5,	%f0
	movg	%icc,	%o7,	%i4
	addccc	%l6,	%g6,	%i2
	movgu	%icc,	%g2,	%i7
	ldsb	[%l7 + 0x1D],	%i1
	srax	%l4,	0x00,	%i6
	orn	%l1,	0x0AC8,	%i3
	fmovsn	%xcc,	%f4,	%f0
	std	%f12,	[%l7 + 0x10]
	fmovdle	%icc,	%f15,	%f12
	and	%i0,	0x0D12,	%l3
	fand	%f14,	%f2,	%f12
	movcc	%xcc,	%g1,	%o3
	fxnors	%f12,	%f0,	%f9
	srax	%g4,	0x0C,	%o6
	udivx	%g7,	0x0B37,	%g5
	fcmped	%fcc0,	%f6,	%f6
	movneg	%xcc,	%o0,	%o2
	xnor	%l5,	%l0,	%g3
	orn	%i5,	0x19B0,	%l2
	movn	%xcc,	%o1,	%o4
	lduw	[%l7 + 0x44],	%o5
	andcc	%i4,	0x184F,	%l6
	alignaddr	%o7,	%i2,	%g6
	edge8	%g2,	%i1,	%i7
	fmovsn	%icc,	%f13,	%f6
	srlx	%i6,	%l1,	%i3
	smulcc	%i0,	0x031C,	%l3
	addc	%l4,	0x08A1,	%g1
	subcc	%g4,	%o6,	%g7
	ldx	[%l7 + 0x08],	%g5
	fcmple16	%f0,	%f10,	%o0
	orncc	%o2,	%l5,	%l0
	fmul8x16al	%f14,	%f14,	%f14
	fmovsl	%icc,	%f8,	%f4
	fpsub32s	%f0,	%f14,	%f10
	fnors	%f3,	%f9,	%f3
	edge32	%g3,	%i5,	%o3
	add	%o1,	%l2,	%o4
	fmovdvc	%icc,	%f11,	%f1
	sll	%o5,	%l6,	%i4
	lduw	[%l7 + 0x44],	%o7
	sdivcc	%g6,	0x07E9,	%i2
	ldd	[%l7 + 0x68],	%i0
	sethi	0x169E,	%i7
	move	%xcc,	%g2,	%l1
	movg	%xcc,	%i6,	%i0
	edge8l	%l3,	%l4,	%g1
	xor	%g4,	%o6,	%i3
	edge16n	%g5,	%g7,	%o2
	movle	%xcc,	%l5,	%l0
	ldx	[%l7 + 0x50],	%o0
	fcmpne32	%f2,	%f2,	%g3
	array32	%o3,	%o1,	%l2
	alignaddr	%i5,	%o5,	%l6
	sdivx	%o4,	0x19E4,	%o7
	edge8n	%g6,	%i2,	%i1
	movle	%icc,	%i4,	%g2
	sdivx	%l1,	0x0C72,	%i7
	movleu	%xcc,	%i6,	%i0
	fsrc2s	%f6,	%f6
	save %l4, 0x0C64, %g1
	lduw	[%l7 + 0x58],	%g4
	stw	%o6,	[%l7 + 0x58]
	or	%l3,	0x08D9,	%i3
	fmovd	%f2,	%f12
	sllx	%g5,	%g7,	%o2
	lduw	[%l7 + 0x68],	%l0
	xor	%o0,	%l5,	%o3
	srlx	%g3,	%l2,	%o1
	edge32ln	%o5,	%l6,	%o4
	movrlz	%o7,	0x1AF,	%i5
	stx	%g6,	[%l7 + 0x60]
	addcc	%i1,	%i4,	%i2
	edge32l	%g2,	%l1,	%i6
	fcmpne16	%f2,	%f6,	%i0
	ldsb	[%l7 + 0x5C],	%l4
	and	%i7,	0x03E7,	%g1
	mulx	%g4,	0x08D1,	%o6
	fcmps	%fcc2,	%f12,	%f0
	stw	%l3,	[%l7 + 0x60]
	addcc	%i3,	%g7,	%g5
	movleu	%icc,	%l0,	%o0
	restore %o2, %o3, %g3
	add	%l5,	0x1FCD,	%l2
	ldd	[%l7 + 0x38],	%o4
	movpos	%icc,	%l6,	%o4
	fmovsa	%xcc,	%f7,	%f12
	fpadd32s	%f13,	%f12,	%f1
	fxors	%f8,	%f5,	%f2
	move	%xcc,	%o1,	%o7
	movpos	%icc,	%i5,	%g6
	ldsh	[%l7 + 0x4A],	%i4
	stw	%i1,	[%l7 + 0x2C]
	sth	%i2,	[%l7 + 0x4C]
	array8	%l1,	%i6,	%g2
	fmuld8ulx16	%f3,	%f11,	%f4
	sth	%l4,	[%l7 + 0x2E]
	srax	%i0,	0x07,	%i7
	udivcc	%g4,	0x0186,	%g1
	srax	%l3,	0x1D,	%i3
	udiv	%o6,	0x1B75,	%g5
	fnot1	%f8,	%f0
	std	%f14,	[%l7 + 0x18]
	lduw	[%l7 + 0x6C],	%l0
	edge8l	%o0,	%g7,	%o3
	fmovspos	%icc,	%f10,	%f7
	fcmpeq32	%f4,	%f4,	%o2
	andcc	%g3,	%l5,	%o5
	fornot2	%f10,	%f14,	%f0
	fmovsneg	%icc,	%f8,	%f6
	movrgz	%l6,	%o4,	%o1
	movvc	%icc,	%o7,	%l2
	ld	[%l7 + 0x18],	%f6
	stx	%g6,	[%l7 + 0x70]
	edge16l	%i5,	%i1,	%i4
	array32	%l1,	%i6,	%g2
	fcmple32	%f10,	%f8,	%i2
	movn	%icc,	%l4,	%i7
	sll	%g4,	0x14,	%i0
	movne	%xcc,	%g1,	%l3
	fornot1	%f14,	%f12,	%f4
	array8	%o6,	%i3,	%l0
	lduw	[%l7 + 0x44],	%o0
	sth	%g7,	[%l7 + 0x4E]
	edge8	%g5,	%o2,	%g3
	movcs	%icc,	%l5,	%o3
	save %l6, 0x1AD1, %o4
	edge32n	%o1,	%o5,	%o7
	edge16n	%l2,	%g6,	%i5
	mulx	%i1,	0x0AC3,	%l1
	fcmpeq32	%f4,	%f4,	%i6
	ldsw	[%l7 + 0x68],	%i4
	stb	%i2,	[%l7 + 0x1F]
	pdist	%f4,	%f8,	%f4
	fpadd32s	%f13,	%f12,	%f0
	fmovrdgez	%g2,	%f10,	%f12
	orcc	%i7,	%g4,	%i0
	fpadd32s	%f1,	%f0,	%f4
	fmul8sux16	%f10,	%f10,	%f10
	std	%f12,	[%l7 + 0x78]
	alignaddrl	%g1,	%l4,	%l3
	fors	%f10,	%f5,	%f11
	sll	%o6,	%i3,	%l0
	stx	%g7,	[%l7 + 0x38]
	edge8l	%o0,	%g5,	%o2
	add	%l5,	%o3,	%g3
	pdist	%f2,	%f6,	%f2
	andncc	%o4,	%o1,	%o5
	edge8l	%l6,	%o7,	%l2
	movcs	%xcc,	%i5,	%i1
	smul	%g6,	%l1,	%i4
	udivx	%i6,	0x164F,	%i2
	subc	%i7,	0x1F37,	%g4
	stx	%g2,	[%l7 + 0x58]
	subc	%i0,	0x06EC,	%l4
	movrne	%l3,	%g1,	%o6
	orcc	%i3,	%l0,	%g7
	orncc	%g5,	0x00B6,	%o0
	ldsh	[%l7 + 0x4A],	%o2
	sethi	0x1CAE,	%l5
	add	%g3,	0x02DA,	%o3
	faligndata	%f12,	%f4,	%f14
	fmuld8ulx16	%f13,	%f2,	%f2
	udiv	%o4,	0x190E,	%o5
	fmovsneg	%xcc,	%f7,	%f4
	lduw	[%l7 + 0x34],	%o1
	addccc	%o7,	%l6,	%i5
	fmovdleu	%icc,	%f9,	%f2
	fmovsge	%icc,	%f2,	%f11
	xnor	%l2,	%g6,	%i1
	movcs	%icc,	%l1,	%i4
	fornot2s	%f14,	%f2,	%f0
	ldd	[%l7 + 0x58],	%i6
	andncc	%i2,	%i7,	%g4
	mova	%icc,	%i0,	%g2
	edge32l	%l3,	%l4,	%g1
	andcc	%i3,	0x1429,	%l0
	xnorcc	%g7,	%o6,	%g5
	movl	%xcc,	%o2,	%l5
	movgu	%xcc,	%g3,	%o3
	srlx	%o4,	%o0,	%o1
	fmovsvs	%icc,	%f3,	%f13
	movre	%o5,	%o7,	%i5
	andcc	%l2,	0x0D57,	%l6
	fmovdvs	%icc,	%f14,	%f10
	move	%icc,	%g6,	%i1
	movl	%xcc,	%l1,	%i6
	and	%i4,	0x0A63,	%i2
	sethi	0x02F4,	%g4
	fmovse	%xcc,	%f5,	%f13
	fcmpne32	%f8,	%f6,	%i7
	movpos	%icc,	%i0,	%l3
	mulx	%l4,	0x1E74,	%g1
	array32	%g2,	%i3,	%l0
	stw	%g7,	[%l7 + 0x34]
	fones	%f8
	sra	%g5,	%o6,	%l5
	sdivx	%o2,	0x07D5,	%o3
	alignaddr	%o4,	%o0,	%o1
	movne	%xcc,	%o5,	%o7
	fcmpgt16	%f12,	%f2,	%g3
	fexpand	%f12,	%f6
	fpsub16	%f4,	%f4,	%f14
	mova	%icc,	%l2,	%i5
	edge32n	%l6,	%i1,	%g6
	edge16n	%l1,	%i6,	%i2
	fmovsvc	%icc,	%f6,	%f12
	stx	%i4,	[%l7 + 0x48]
	xorcc	%i7,	0x1326,	%i0
	fmovdcc	%icc,	%f8,	%f11
	fnand	%f10,	%f0,	%f4
	ldx	[%l7 + 0x60],	%g4
	ld	[%l7 + 0x0C],	%f7
	movl	%icc,	%l3,	%l4
	fcmped	%fcc2,	%f0,	%f8
	alignaddr	%g2,	%g1,	%i3
	movg	%xcc,	%l0,	%g7
	addccc	%g5,	%l5,	%o2
	movrlz	%o3,	%o4,	%o0
	orncc	%o1,	0x0C88,	%o6
	movcs	%icc,	%o5,	%o7
	ldd	[%l7 + 0x38],	%l2
	edge32	%i5,	%g3,	%i1
	ldd	[%l7 + 0x08],	%g6
	stb	%l1,	[%l7 + 0x71]
	ldsb	[%l7 + 0x41],	%l6
	fmovdcc	%xcc,	%f1,	%f14
	addcc	%i6,	0x089D,	%i4
	movg	%xcc,	%i7,	%i0
	fmovrdne	%i2,	%f2,	%f12
	movgu	%xcc,	%l3,	%g4
	movne	%icc,	%g2,	%g1
	fmuld8ulx16	%f0,	%f9,	%f8
	and	%i3,	%l0,	%g7
	fmovrdgez	%g5,	%f12,	%f10
	movvs	%xcc,	%l4,	%l5
	array8	%o3,	%o4,	%o2
	fnors	%f8,	%f2,	%f13
	fmovdne	%xcc,	%f4,	%f6
	movneg	%xcc,	%o1,	%o6
	fmovsge	%xcc,	%f14,	%f6
	andcc	%o0,	%o7,	%o5
	ldub	[%l7 + 0x7A],	%l2
	fnegd	%f2,	%f2
	movpos	%xcc,	%i5,	%i1
	fcmpne16	%f4,	%f0,	%g6
	srlx	%g3,	%l1,	%l6
	or	%i6,	0x0257,	%i4
	fandnot2s	%f9,	%f4,	%f4
	fmovsne	%icc,	%f0,	%f3
	sdivcc	%i0,	0x0202,	%i7
	fone	%f8
	restore %l3, 0x15C6, %i2
	array32	%g2,	%g4,	%i3
	edge32	%g1,	%g7,	%l0
	movg	%icc,	%g5,	%l5
	movn	%xcc,	%o3,	%l4
	ldsw	[%l7 + 0x7C],	%o4
	movl	%icc,	%o1,	%o2
	fmovdneg	%icc,	%f11,	%f4
	movcs	%icc,	%o0,	%o7
	fmovdcs	%xcc,	%f5,	%f8
	ldsh	[%l7 + 0x66],	%o6
	subc	%o5,	0x1346,	%l2
	popc	0x128E,	%i5
	movg	%icc,	%g6,	%i1
	ldsb	[%l7 + 0x47],	%g3
	fpsub16s	%f8,	%f6,	%f11
	srax	%l6,	%l1,	%i6
	and	%i0,	%i4,	%i7
	fpadd32	%f0,	%f0,	%f0
	udiv	%i2,	0x194A,	%g2
	edge16ln	%l3,	%g4,	%g1
	fmul8x16au	%f4,	%f14,	%f8
	fpackfix	%f2,	%f12
	sth	%i3,	[%l7 + 0x14]
	ldd	[%l7 + 0x20],	%g6
	sra	%g5,	0x15,	%l5
	fmovdleu	%icc,	%f11,	%f9
	fcmpeq16	%f8,	%f12,	%l0
	movleu	%icc,	%o3,	%o4
	orcc	%o1,	0x14E8,	%l4
	ldsh	[%l7 + 0x6E],	%o0
	sub	%o2,	0x1A10,	%o6
	srlx	%o7,	0x01,	%o5
	edge32ln	%i5,	%g6,	%l2
	fmuld8sux16	%f2,	%f5,	%f6
	movle	%xcc,	%i1,	%l6
	movneg	%xcc,	%g3,	%i6
	array32	%l1,	%i4,	%i0
	ldsh	[%l7 + 0x34],	%i7
	movgu	%icc,	%g2,	%l3
	fxnors	%f12,	%f4,	%f8
	edge16l	%i2,	%g1,	%g4
	lduh	[%l7 + 0x6E],	%g7
	xor	%g5,	0x03B7,	%i3
	edge32n	%l5,	%l0,	%o3
	fornot1s	%f12,	%f1,	%f3
	stw	%o1,	[%l7 + 0x0C]
	edge32l	%o4,	%o0,	%o2
	orn	%o6,	%l4,	%o5
	udivx	%o7,	0x1EC9,	%i5
	fpadd32s	%f7,	%f10,	%f1
	alignaddr	%g6,	%l2,	%l6
	udivcc	%g3,	0x131F,	%i1
	edge16l	%l1,	%i6,	%i4
	orn	%i0,	%g2,	%i7
	sth	%l3,	[%l7 + 0x36]
	edge8	%i2,	%g1,	%g4
	xor	%g7,	%g5,	%i3
	fmovdvc	%icc,	%f1,	%f13
	or	%l0,	0x1119,	%o3
	udivcc	%o1,	0x12C6,	%l5
	st	%f1,	[%l7 + 0x40]
	stb	%o4,	[%l7 + 0x58]
	fmovdcs	%xcc,	%f8,	%f0
	movg	%xcc,	%o2,	%o0
	srax	%o6,	0x12,	%l4
	fxnor	%f12,	%f2,	%f8
	movn	%icc,	%o5,	%o7
	mulx	%i5,	0x00E2,	%l2
	alignaddrl	%l6,	%g6,	%g3
	fmovsgu	%icc,	%f6,	%f2
	andn	%i1,	0x1615,	%i6
	movvc	%xcc,	%l1,	%i0
	fandnot1	%f4,	%f2,	%f0
	fpsub16	%f2,	%f14,	%f8
	fmul8x16al	%f1,	%f11,	%f12
	movre	%g2,	0x1AB,	%i4
	ldd	[%l7 + 0x70],	%f12
	srlx	%l3,	0x0E,	%i7
	movn	%xcc,	%i2,	%g1
	movrlz	%g4,	%g5,	%i3
	movneg	%xcc,	%l0,	%o3
	movrlez	%g7,	%l5,	%o4
	addc	%o2,	%o0,	%o6
	ldsb	[%l7 + 0x33],	%l4
	smulcc	%o5,	0x05C9,	%o7
	fmovda	%icc,	%f11,	%f8
	fmovdn	%xcc,	%f13,	%f3
	add	%i5,	0x1B6C,	%l2
	mova	%icc,	%o1,	%g6
	ldub	[%l7 + 0x61],	%l6
	restore %g3, %i6, %l1
	for	%f10,	%f10,	%f4
	orn	%i1,	0x0F19,	%g2
	subcc	%i0,	0x11DC,	%i4
	edge8l	%l3,	%i7,	%i2
	for	%f0,	%f6,	%f0
	umulcc	%g1,	0x16B1,	%g5
	add	%i3,	%g4,	%l0
	srax	%g7,	0x0F,	%l5
	edge32ln	%o4,	%o2,	%o0
	fmovscs	%icc,	%f12,	%f1
	movcc	%icc,	%o3,	%l4
	fcmpne16	%f8,	%f12,	%o6
	fmul8ulx16	%f8,	%f14,	%f12
	edge32l	%o7,	%i5,	%l2
	sra	%o1,	0x07,	%g6
	fmovsvs	%icc,	%f7,	%f6
	udivx	%l6,	0x081A,	%g3
	edge8ln	%o5,	%l1,	%i6
	fornot1s	%f7,	%f5,	%f10
	movneg	%xcc,	%i1,	%i0
	fcmpne32	%f8,	%f6,	%g2
	fpsub16	%f12,	%f4,	%f0
	fmovdgu	%icc,	%f15,	%f4
	fmul8x16al	%f5,	%f3,	%f10
	xorcc	%l3,	%i7,	%i2
	pdist	%f8,	%f2,	%f2
	edge8	%i4,	%g5,	%g1
	movvs	%icc,	%g4,	%l0
	andncc	%i3,	%g7,	%l5
	edge8ln	%o4,	%o2,	%o3
	movn	%xcc,	%l4,	%o0
	array32	%o6,	%o7,	%i5
	udiv	%o1,	0x1FA4,	%l2
	andn	%g6,	0x0F4B,	%g3
	fmovsle	%xcc,	%f0,	%f13
	srlx	%l6,	%o5,	%i6
	sdivx	%l1,	0x0AA9,	%i0
	fmovdle	%xcc,	%f14,	%f8
	smulcc	%g2,	%l3,	%i7
	fxnor	%f10,	%f12,	%f8
	edge32ln	%i2,	%i1,	%i4
	sra	%g1,	%g4,	%l0
	movrlz	%i3,	0x112,	%g5
	edge8	%g7,	%o4,	%o2
	sdiv	%l5,	0x16AB,	%o3
	ldd	[%l7 + 0x60],	%l4
	alignaddrl	%o6,	%o7,	%o0
	movrgez	%i5,	%o1,	%g6
	fornot2	%f12,	%f0,	%f6
	fnot2s	%f8,	%f13
	udivcc	%g3,	0x0762,	%l2
	udivcc	%o5,	0x1960,	%i6
	save %l1, 0x1E81, %i0
	fmovdcs	%icc,	%f11,	%f6
	alignaddrl	%l6,	%g2,	%i7
	subc	%i2,	0x07AE,	%l3
	sllx	%i1,	%i4,	%g1
	edge16n	%g4,	%i3,	%l0
	array32	%g5,	%o4,	%g7
	movneg	%xcc,	%l5,	%o2
	movcc	%xcc,	%o3,	%l4
	edge8	%o6,	%o0,	%i5
	movcc	%icc,	%o1,	%o7
	udivcc	%g3,	0x07EC,	%l2
	or	%o5,	0x111F,	%g6
	edge16	%l1,	%i6,	%l6
	ldd	[%l7 + 0x58],	%f4
	alignaddrl	%i0,	%i7,	%g2
	mulscc	%i2,	0x14CB,	%l3
	movg	%xcc,	%i1,	%i4
	movre	%g1,	%g4,	%i3
	sra	%g5,	0x0D,	%o4
	orcc	%l0,	0x1916,	%g7
	fnor	%f0,	%f12,	%f4
	lduh	[%l7 + 0x2E],	%l5
	srlx	%o2,	0x1B,	%l4
	edge16n	%o6,	%o0,	%o3
	sdivx	%o1,	0x0FA1,	%o7
	movneg	%icc,	%i5,	%l2
	udiv	%o5,	0x0121,	%g6
	fsrc2s	%f15,	%f7
	smulcc	%g3,	0x1B82,	%l1
	sllx	%i6,	%i0,	%l6
	fnegs	%f14,	%f12
	sub	%g2,	0x0438,	%i2
	fmovsge	%xcc,	%f11,	%f3
	fmovdgu	%xcc,	%f2,	%f5
	umulcc	%i7,	%i1,	%l3
	edge8l	%g1,	%i4,	%g4
	movrgz	%g5,	0x2DE,	%i3
	fmovdne	%xcc,	%f3,	%f15
	movrne	%l0,	%g7,	%o4
	movleu	%icc,	%o2,	%l5
	st	%f15,	[%l7 + 0x0C]
	udiv	%o6,	0x12F3,	%o0
	srlx	%l4,	%o1,	%o7
	movrlez	%i5,	0x2B9,	%o3
	fmovsvs	%xcc,	%f1,	%f0
	umul	%o5,	0x1AA6,	%l2
	sethi	0x0E09,	%g6
	ldsw	[%l7 + 0x38],	%g3
	movrne	%i6,	0x386,	%l1
	subccc	%i0,	0x04CA,	%g2
	orcc	%i2,	0x11BE,	%l6
	movn	%xcc,	%i1,	%i7
	fnot1	%f8,	%f8
	std	%f12,	[%l7 + 0x58]
	fmovrdlez	%l3,	%f8,	%f2
	udivcc	%g1,	0x01C6,	%g4
	edge16	%g5,	%i4,	%i3
	fnor	%f12,	%f2,	%f8
	andcc	%l0,	%g7,	%o4
	srl	%o2,	0x14,	%o6
	udivcc	%o0,	0x16D0,	%l5
	smul	%o1,	%o7,	%l4
	lduh	[%l7 + 0x60],	%i5
	and	%o3,	%l2,	%o5
	movre	%g6,	0x094,	%i6
	movcc	%xcc,	%g3,	%i0
	mova	%xcc,	%g2,	%i2
	sra	%l6,	0x17,	%i1
	movne	%icc,	%l1,	%l3
	fors	%f6,	%f1,	%f0
	sdiv	%i7,	0x016C,	%g4
	or	%g5,	%g1,	%i4
	addccc	%i3,	%l0,	%o4
	movrgz	%o2,	%o6,	%o0
	ldd	[%l7 + 0x40],	%l4
	fabss	%f15,	%f7
	ldd	[%l7 + 0x58],	%g6
	sth	%o7,	[%l7 + 0x66]
	ldsb	[%l7 + 0x24],	%l4
	andn	%o1,	%o3,	%i5
	lduw	[%l7 + 0x2C],	%o5
	movcc	%icc,	%l2,	%i6
	movrgez	%g6,	0x136,	%g3
	ldd	[%l7 + 0x30],	%g2
	ld	[%l7 + 0x38],	%f4
	pdist	%f4,	%f2,	%f2
	popc	0x1097,	%i2
	fandnot1	%f10,	%f8,	%f10
	fsrc2	%f14,	%f2
	movge	%xcc,	%i0,	%l6
	fcmpne32	%f8,	%f2,	%l1
	srlx	%l3,	0x07,	%i1
	sllx	%i7,	%g4,	%g5
	sethi	0x0B4C,	%g1
	movleu	%icc,	%i4,	%i3
	edge8n	%o4,	%o2,	%l0
	xnorcc	%o0,	0x034F,	%o6
	fsrc2s	%f11,	%f10
	movvs	%icc,	%g7,	%l5
	sethi	0x0E10,	%o7
	movrlz	%l4,	0x353,	%o3
	ldd	[%l7 + 0x40],	%o0
	sub	%i5,	%o5,	%i6
	fmuld8sux16	%f14,	%f1,	%f12
	fcmpeq32	%f8,	%f14,	%l2
	movge	%icc,	%g3,	%g6
	save %i2, 0x03B3, %i0
	edge16l	%g2,	%l1,	%l3
	bshuffle	%f8,	%f14,	%f0
	fmovsneg	%xcc,	%f11,	%f3
	movg	%xcc,	%i1,	%l6
	xor	%g4,	0x1E7F,	%g5
	ldx	[%l7 + 0x30],	%i7
	fsrc1	%f12,	%f8
	ldub	[%l7 + 0x1B],	%g1
	movvs	%icc,	%i3,	%o4
	stw	%o2,	[%l7 + 0x78]
	fmovrdlz	%i4,	%f6,	%f0
	sra	%o0,	0x15,	%o6
	restore %g7, %l0, %o7
	st	%f15,	[%l7 + 0x6C]
	edge16l	%l5,	%o3,	%l4
	addc	%i5,	0x1C5B,	%o1
	movrgz	%i6,	%o5,	%l2
	edge8l	%g6,	%i2,	%g3
	movcc	%icc,	%i0,	%g2
	fmovdneg	%xcc,	%f2,	%f6
	fmovrslz	%l1,	%f2,	%f13
	alignaddr	%l3,	%l6,	%i1
	movvs	%icc,	%g5,	%g4
	alignaddr	%g1,	%i7,	%i3
	sethi	0x0075,	%o4
	sth	%o2,	[%l7 + 0x60]
	sth	%o0,	[%l7 + 0x10]
	ld	[%l7 + 0x14],	%f7
	srl	%o6,	%g7,	%l0
	fmovsvs	%xcc,	%f15,	%f6
	movle	%xcc,	%i4,	%l5
	and	%o3,	0x0585,	%l4
	fnot1s	%f1,	%f7
	or	%o7,	0x0EBA,	%i5
	orn	%i6,	0x0CCA,	%o1
	fandnot2	%f12,	%f10,	%f6
	udivcc	%l2,	0x13AF,	%g6
	srl	%i2,	0x06,	%o5
	std	%f14,	[%l7 + 0x50]
	mulscc	%i0,	0x1600,	%g2
	movneg	%xcc,	%g3,	%l1
	fmovrsgez	%l3,	%f10,	%f9
	fmovsl	%icc,	%f10,	%f8
	edge16	%l6,	%g5,	%i1
	sra	%g4,	0x1E,	%i7
	movleu	%icc,	%i3,	%o4
	sth	%o2,	[%l7 + 0x4C]
	array8	%o0,	%o6,	%g1
	array32	%l0,	%i4,	%l5
	movge	%icc,	%o3,	%l4
	pdist	%f8,	%f10,	%f8
	xnor	%o7,	%g7,	%i5
	fmovdpos	%icc,	%f15,	%f3
	orncc	%i6,	%l2,	%o1
	umulcc	%g6,	%i2,	%o5
	edge16	%g2,	%g3,	%l1
	mova	%xcc,	%i0,	%l3
	std	%f6,	[%l7 + 0x78]
	std	%f8,	[%l7 + 0x58]
	mova	%xcc,	%g5,	%l6
	edge8ln	%i1,	%g4,	%i3
	orncc	%o4,	0x1389,	%o2
	fmovrsne	%i7,	%f12,	%f10
	srl	%o0,	0x13,	%o6
	pdist	%f8,	%f0,	%f10
	fnegs	%f10,	%f4
	fcmpne16	%f14,	%f2,	%g1
	movrgz	%i4,	%l0,	%l5
	alignaddrl	%o3,	%o7,	%g7
	movl	%icc,	%i5,	%i6
	mulscc	%l4,	%o1,	%l2
	edge16ln	%i2,	%o5,	%g6
	andncc	%g3,	%l1,	%i0
	fmovdneg	%icc,	%f11,	%f11
	fmovrdlez	%l3,	%f6,	%f10
	movn	%xcc,	%g2,	%l6
	movleu	%icc,	%i1,	%g5
	fmovscc	%icc,	%f10,	%f15
	st	%f15,	[%l7 + 0x78]
	umul	%g4,	0x0510,	%o4
	edge8ln	%o2,	%i3,	%i7
	edge16l	%o6,	%g1,	%i4
	andn	%l0,	0x1789,	%l5
	udivcc	%o3,	0x0887,	%o0
	edge8	%g7,	%i5,	%o7
	fmovrde	%l4,	%f0,	%f0
	or	%o1,	%l2,	%i2
	sra	%o5,	%g6,	%g3
	fsrc2	%f4,	%f6
	ldsb	[%l7 + 0x2D],	%l1
	array8	%i6,	%l3,	%g2
	orn	%i0,	0x058D,	%i1
	fxor	%f14,	%f8,	%f2
	smulcc	%l6,	0x1874,	%g4
	fcmple16	%f0,	%f4,	%o4
	fmovsgu	%xcc,	%f4,	%f13
	st	%f12,	[%l7 + 0x6C]
	udivx	%g5,	0x16C5,	%o2
	ldd	[%l7 + 0x58],	%i2
	lduh	[%l7 + 0x1E],	%i7
	fpadd32s	%f4,	%f10,	%f11
	sdivx	%o6,	0x1D59,	%g1
	ldd	[%l7 + 0x30],	%f0
	fnot1	%f2,	%f12
	xnor	%i4,	%l0,	%o3
	srlx	%l5,	0x1B,	%o0
	xnorcc	%i5,	0x1832,	%g7
	movneg	%xcc,	%l4,	%o1
	st	%f4,	[%l7 + 0x44]
	fnor	%f14,	%f0,	%f14
	fpadd16s	%f3,	%f10,	%f3
	ld	[%l7 + 0x18],	%f1
	subccc	%l2,	0x168E,	%o7
	sth	%i2,	[%l7 + 0x12]
	movcc	%xcc,	%o5,	%g6
	fcmpeq32	%f2,	%f12,	%l1
	movrne	%g3,	0x245,	%i6
	edge32	%l3,	%g2,	%i1
	srlx	%i0,	%g4,	%l6
	mulscc	%g5,	0x1251,	%o2
	ldx	[%l7 + 0x48],	%i3
	fzero	%f4
	alignaddrl	%o4,	%o6,	%i7
	stw	%i4,	[%l7 + 0x48]
	subc	%l0,	0x09FC,	%g1
	fmovdpos	%icc,	%f7,	%f10
	sdivx	%o3,	0x1D27,	%l5
	edge16ln	%o0,	%i5,	%g7
	alignaddr	%l4,	%o1,	%o7
	st	%f12,	[%l7 + 0x20]
	addc	%l2,	%i2,	%o5
	std	%f8,	[%l7 + 0x30]
	fcmpgt16	%f14,	%f6,	%l1
	fmovda	%icc,	%f4,	%f4
	fpmerge	%f1,	%f8,	%f8
	fmovd	%f6,	%f0
	movg	%xcc,	%g6,	%i6
	movvc	%xcc,	%l3,	%g2
	movrgez	%g3,	0x306,	%i1
	edge32	%i0,	%g4,	%g5
	fcmps	%fcc2,	%f2,	%f6
	edge8l	%l6,	%o2,	%i3
	movrlz	%o4,	%i7,	%o6
	movre	%i4,	0x3A0,	%l0
	edge8ln	%g1,	%o3,	%o0
	fnors	%f10,	%f0,	%f3
	fnot1	%f6,	%f6
	ldx	[%l7 + 0x08],	%l5
	movle	%icc,	%g7,	%l4
	sub	%i5,	0x1235,	%o7
	fandnot2	%f12,	%f12,	%f10
	fmovdvs	%icc,	%f1,	%f5
	fmovsgu	%icc,	%f14,	%f14
	movcc	%xcc,	%o1,	%i2
	movvs	%xcc,	%o5,	%l1
	alignaddrl	%g6,	%l2,	%l3
	ld	[%l7 + 0x38],	%f8
	fmovsa	%icc,	%f12,	%f4
	movrgz	%g2,	%g3,	%i1
	udivcc	%i6,	0x17D1,	%g4
	edge32	%g5,	%l6,	%o2
	fornot1	%f8,	%f10,	%f0
	edge32n	%i3,	%o4,	%i7
	ldsw	[%l7 + 0x20],	%o6
	fmuld8sux16	%f7,	%f2,	%f14
	and	%i4,	0x07D9,	%i0
	edge8	%g1,	%l0,	%o0
	fcmps	%fcc2,	%f7,	%f1
	fandnot1	%f14,	%f0,	%f0
	fcmpne16	%f8,	%f6,	%o3
	fcmpes	%fcc0,	%f2,	%f7
	for	%f2,	%f14,	%f4
	addc	%l5,	%l4,	%g7
	addc	%o7,	0x0E29,	%i5
	andn	%i2,	0x1F1C,	%o1
	edge8l	%o5,	%l1,	%g6
	movrgez	%l2,	0x355,	%g2
	fornot1s	%f11,	%f12,	%f3
	edge8	%l3,	%i1,	%i6
	lduh	[%l7 + 0x10],	%g4
	sllx	%g5,	0x18,	%g3
	fnegs	%f0,	%f0
	movcc	%icc,	%o2,	%l6
	fmovdvs	%icc,	%f2,	%f12
	fpsub32	%f6,	%f10,	%f6
	lduh	[%l7 + 0x5A],	%i3
	ldsb	[%l7 + 0x37],	%o4
	srl	%o6,	%i7,	%i4
	edge32	%g1,	%i0,	%o0
	lduh	[%l7 + 0x38],	%o3
	fmovdl	%icc,	%f3,	%f11
	edge8ln	%l5,	%l0,	%l4
	movle	%xcc,	%o7,	%g7
	std	%f0,	[%l7 + 0x60]
	mulx	%i5,	%i2,	%o1
	edge32n	%l1,	%o5,	%g6
	st	%f7,	[%l7 + 0x3C]
	srl	%g2,	%l2,	%i1
	and	%i6,	0x11FD,	%g4
	array8	%g5,	%g3,	%o2
	stb	%l3,	[%l7 + 0x0B]
	edge8n	%i3,	%l6,	%o4
	sdivx	%i7,	0x0A2F,	%i4
	fpsub16s	%f15,	%f1,	%f10
	fmovdge	%xcc,	%f9,	%f5
	movgu	%xcc,	%o6,	%i0
	std	%f4,	[%l7 + 0x60]
	sra	%g1,	0x0F,	%o3
	udivx	%o0,	0x09C5,	%l0
	edge16n	%l4,	%o7,	%g7
	sdivx	%i5,	0x0472,	%l5
	fmul8sux16	%f6,	%f4,	%f2
	movrlz	%o1,	0x0BC,	%l1
	fzeros	%f10
	mulscc	%i2,	0x17E8,	%g6
	fors	%f1,	%f11,	%f7
	lduw	[%l7 + 0x48],	%o5
	subccc	%l2,	0x0482,	%i1
	fsrc2	%f4,	%f12
	movl	%icc,	%i6,	%g2
	fmovdge	%icc,	%f1,	%f12
	fcmple32	%f8,	%f10,	%g5
	fmovsvs	%xcc,	%f6,	%f3
	fmovdgu	%icc,	%f13,	%f14
	edge32n	%g3,	%g4,	%o2
	movle	%icc,	%i3,	%l3
	ldsh	[%l7 + 0x0A],	%l6
	ldd	[%l7 + 0x68],	%f0
	stw	%i7,	[%l7 + 0x4C]
	umul	%i4,	0x0275,	%o6
	ldx	[%l7 + 0x10],	%i0
	fmovs	%f6,	%f9
	fornot2	%f2,	%f10,	%f0
	mova	%xcc,	%g1,	%o4
	ldd	[%l7 + 0x08],	%o0
	fmovdpos	%xcc,	%f12,	%f15
	umulcc	%o3,	%l4,	%l0
	sdivx	%o7,	0x0DF3,	%g7
	save %i5, 0x0C53, %o1
	edge16	%l1,	%i2,	%g6
	movleu	%icc,	%l5,	%o5
	ldsw	[%l7 + 0x54],	%i1
	movneg	%icc,	%i6,	%l2
	udivx	%g5,	0x1BED,	%g2
	andcc	%g3,	%g4,	%o2
	edge8n	%i3,	%l6,	%l3
	smul	%i4,	%i7,	%o6
	popc	%g1,	%o4
	andncc	%o0,	%o3,	%l4
	fmovdpos	%icc,	%f5,	%f0
	movneg	%xcc,	%l0,	%o7
	srlx	%g7,	%i5,	%i0
	addccc	%l1,	%i2,	%g6
	fpadd32s	%f10,	%f14,	%f12
	movpos	%icc,	%o1,	%o5
	xnorcc	%l5,	%i1,	%l2
	fones	%f14
	bshuffle	%f4,	%f8,	%f4
	edge16l	%g5,	%i6,	%g2
	fcmple16	%f4,	%f14,	%g4
	fcmpes	%fcc1,	%f11,	%f15
	fmovdl	%icc,	%f15,	%f6
	restore %o2, 0x0220, %i3
	movgu	%xcc,	%l6,	%g3
	lduh	[%l7 + 0x6C],	%i4
	edge16ln	%l3,	%o6,	%g1
	popc	0x13F7,	%i7
	alignaddr	%o4,	%o3,	%l4
	andcc	%o0,	0x0F4E,	%o7
	addc	%g7,	0x16DC,	%i5
	addc	%i0,	0x09E4,	%l0
	movcs	%xcc,	%l1,	%g6
	save %o1, %o5, %l5
	edge32l	%i1,	%l2,	%g5
	edge16	%i2,	%g2,	%g4
	mova	%icc,	%o2,	%i3
	movl	%xcc,	%l6,	%g3
	lduw	[%l7 + 0x34],	%i6
	srax	%i4,	%l3,	%g1
	sllx	%i7,	0x0D,	%o4
	subcc	%o6,	0x0060,	%l4
	movn	%icc,	%o3,	%o7
	xnorcc	%g7,	0x09A0,	%i5
	movrlez	%i0,	0x354,	%l0
	mulx	%l1,	%g6,	%o0
	movrne	%o1,	0x13F,	%l5
	smul	%i1,	0x1B85,	%o5
	fornot1s	%f6,	%f2,	%f8
	or	%g5,	%l2,	%i2
	alignaddrl	%g4,	%o2,	%i3
	movgu	%xcc,	%g2,	%l6
	andncc	%g3,	%i6,	%i4
	movrlez	%l3,	%i7,	%g1
	edge8l	%o4,	%o6,	%o3
	for	%f6,	%f12,	%f2
	fpackfix	%f12,	%f5
	alignaddr	%o7,	%l4,	%i5
	fandnot1	%f0,	%f14,	%f12
	fnegs	%f11,	%f10
	lduh	[%l7 + 0x62],	%g7
	orncc	%i0,	%l0,	%g6
	edge8ln	%l1,	%o0,	%o1
	edge16l	%l5,	%o5,	%i1
	fpadd32	%f4,	%f4,	%f14
	mulx	%l2,	%g5,	%i2
	fmovdpos	%xcc,	%f6,	%f14
	ldsb	[%l7 + 0x3E],	%o2
	movre	%g4,	0x207,	%g2
	edge32	%l6,	%i3,	%i6
	subc	%g3,	0x0C0E,	%i4
	movrgez	%i7,	0x0DA,	%g1
	udivx	%o4,	0x04A8,	%l3
	fmovsa	%xcc,	%f5,	%f14
	ldsw	[%l7 + 0x30],	%o3
	sra	%o7,	0x17,	%o6
	fnot1	%f14,	%f12
	srl	%i5,	0x00,	%l4
	fpmerge	%f2,	%f10,	%f2
	ldsw	[%l7 + 0x5C],	%i0
	alignaddrl	%l0,	%g6,	%g7
	edge32	%l1,	%o0,	%l5
	stw	%o5,	[%l7 + 0x70]
	andcc	%i1,	0x1F7C,	%l2
	edge16l	%o1,	%i2,	%g5
	srax	%g4,	%o2,	%l6
	fmovrsgez	%i3,	%f6,	%f12
	alignaddrl	%g2,	%i6,	%g3
	subcc	%i4,	%g1,	%i7
	ldsw	[%l7 + 0x3C],	%o4
	edge8n	%o3,	%o7,	%o6
	movpos	%icc,	%l3,	%i5
	subccc	%l4,	0x1EB7,	%l0
	or	%i0,	0x1263,	%g6
	andn	%l1,	%o0,	%l5
	movvc	%icc,	%o5,	%g7
	udiv	%i1,	0x16C4,	%o1
	fmovrdgez	%i2,	%f8,	%f2
	movneg	%icc,	%g5,	%g4
	fpadd16	%f12,	%f8,	%f4
	sdiv	%o2,	0x1B2E,	%l6
	st	%f14,	[%l7 + 0x6C]
	udivcc	%l2,	0x0357,	%i3
	andn	%g2,	0x0B2A,	%i6
	andncc	%i4,	%g3,	%i7
	fpack32	%f8,	%f6,	%f8
	ldsw	[%l7 + 0x54],	%o4
	xnorcc	%g1,	%o7,	%o3
	edge8ln	%o6,	%i5,	%l3
	array8	%l0,	%i0,	%g6
	smulcc	%l4,	0x0B81,	%o0
	alignaddrl	%l5,	%l1,	%g7
	fpadd32	%f10,	%f0,	%f12
	fmovrdne	%i1,	%f6,	%f10
	orn	%o1,	%i2,	%g5
	edge32l	%o5,	%o2,	%g4
	ld	[%l7 + 0x5C],	%f8
	array32	%l2,	%l6,	%g2
	addccc	%i6,	%i4,	%i3
	fnot2s	%f9,	%f5
	subc	%i7,	%o4,	%g1
	stb	%g3,	[%l7 + 0x0C]
	sdivx	%o7,	0x0545,	%o6
	movrlez	%i5,	0x11B,	%l3
	movrgez	%o3,	%l0,	%g6
	alignaddr	%l4,	%i0,	%l5
	fmovrsgz	%o0,	%f11,	%f1
	movl	%icc,	%g7,	%l1
	edge8n	%o1,	%i2,	%g5
	fpadd32s	%f5,	%f10,	%f5
	fmovscs	%xcc,	%f12,	%f4
	edge32n	%o5,	%i1,	%g4
	fxnors	%f10,	%f6,	%f3
	ldsb	[%l7 + 0x08],	%o2
	alignaddr	%l2,	%g2,	%i6
	popc	%i4,	%i3
	stw	%l6,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x42],	%o4
	sllx	%g1,	%i7,	%g3
	fxors	%f13,	%f10,	%f6
	fmul8x16	%f13,	%f0,	%f4
	move	%icc,	%o6,	%o7
	popc	%l3,	%i5
	fpmerge	%f7,	%f5,	%f12
	sdivx	%o3,	0x1BB1,	%g6
	ld	[%l7 + 0x64],	%f7
	ldsw	[%l7 + 0x28],	%l4
	fmovrse	%l0,	%f14,	%f0
	fpack32	%f12,	%f12,	%f2
	fmovrslz	%i0,	%f6,	%f3
	st	%f5,	[%l7 + 0x34]
	udivcc	%o0,	0x08F6,	%l5
	movrgz	%g7,	%l1,	%o1
	sll	%i2,	%o5,	%i1
	umul	%g5,	%g4,	%o2
	lduh	[%l7 + 0x0E],	%l2
	stw	%i6,	[%l7 + 0x1C]
	xorcc	%g2,	%i4,	%i3
	edge8ln	%l6,	%o4,	%g1
	movleu	%xcc,	%g3,	%o6
	movpos	%xcc,	%o7,	%i7
	movle	%xcc,	%i5,	%l3
	movpos	%xcc,	%o3,	%l4
	xor	%l0,	%g6,	%o0
	udivx	%l5,	0x18DF,	%g7
	andncc	%l1,	%o1,	%i2
	smul	%o5,	0x006A,	%i0
	fmovdneg	%xcc,	%f2,	%f11
	movleu	%xcc,	%i1,	%g5
	movrgz	%g4,	0x0C0,	%l2
	fmovsvc	%xcc,	%f11,	%f0
	movcs	%icc,	%i6,	%o2
	fmovdvs	%xcc,	%f2,	%f3
	edge16ln	%i4,	%i3,	%g2
	movleu	%xcc,	%l6,	%g1
	fcmped	%fcc2,	%f10,	%f12
	srax	%o4,	%o6,	%g3
	fsrc1s	%f6,	%f2
	fxnors	%f0,	%f0,	%f1
	sth	%o7,	[%l7 + 0x2E]
	ldsh	[%l7 + 0x46],	%i7
	restore %l3, 0x0AF5, %o3
	edge32n	%i5,	%l0,	%g6
	edge16	%l4,	%o0,	%l5
	andn	%g7,	0x0C7E,	%l1
	edge32	%i2,	%o1,	%o5
	movgu	%icc,	%i0,	%i1
	fmovrdgz	%g4,	%f14,	%f12
	fmovrdne	%g5,	%f8,	%f2
	andcc	%i6,	%l2,	%o2
	movcc	%xcc,	%i3,	%g2
	subc	%i4,	%g1,	%l6
	fmovdne	%icc,	%f11,	%f12
	array16	%o6,	%o4,	%g3
	edge16ln	%i7,	%o7,	%o3
	movcs	%icc,	%l3,	%l0
	sll	%i5,	%g6,	%l4
	fmovdne	%icc,	%f4,	%f5
	addcc	%o0,	%g7,	%l5
	fmovdl	%xcc,	%f11,	%f8
	umulcc	%i2,	%l1,	%o5
	movn	%icc,	%o1,	%i0
	mulx	%i1,	0x19CF,	%g5
	movre	%i6,	%g4,	%o2
	edge16n	%i3,	%l2,	%g2
	fpackfix	%f6,	%f13
	fsrc1s	%f5,	%f13
	fandnot2	%f8,	%f6,	%f2
	alignaddrl	%i4,	%g1,	%l6
	edge8	%o4,	%o6,	%i7
	umul	%o7,	%g3,	%l3
	edge8n	%l0,	%i5,	%g6
	restore %l4, 0x04D4, %o3
	subccc	%o0,	%g7,	%i2
	movrne	%l5,	%o5,	%o1
	fmovrslez	%l1,	%f8,	%f6
	edge8n	%i1,	%g5,	%i0
	fandnot1	%f8,	%f10,	%f4
	movrlz	%i6,	%o2,	%i3
	movn	%xcc,	%l2,	%g4
	smul	%i4,	0x1BC9,	%g1
	add	%g2,	0x17D5,	%o4
	andncc	%l6,	%i7,	%o7
	movre	%g3,	0x22F,	%o6
	movvs	%icc,	%l0,	%i5
	movrlez	%g6,	%l4,	%l3
	popc	0x026C,	%o3
	subc	%o0,	%g7,	%i2
	edge16	%l5,	%o5,	%o1
	edge8l	%i1,	%g5,	%i0
	fmovdvs	%xcc,	%f10,	%f2
	fmovsgu	%xcc,	%f4,	%f14
	ldd	[%l7 + 0x20],	%f10
	orn	%i6,	%l1,	%o2
	fcmpeq32	%f14,	%f0,	%i3
	orn	%l2,	0x1CA8,	%g4
	stx	%i4,	[%l7 + 0x08]
	udiv	%g1,	0x1BD4,	%g2
	subc	%l6,	0x1385,	%i7
	edge16	%o7,	%g3,	%o6
	fmovdgu	%icc,	%f3,	%f10
	movre	%l0,	%o4,	%g6
	mulscc	%i5,	%l3,	%l4
	fornot1	%f6,	%f10,	%f10
	mova	%icc,	%o3,	%g7
	array32	%i2,	%o0,	%l5
	movn	%icc,	%o1,	%i1
	xnor	%g5,	%i0,	%o5
	addcc	%l1,	0x0B32,	%o2
	stx	%i3,	[%l7 + 0x68]
	xnorcc	%i6,	%g4,	%l2
	ldd	[%l7 + 0x70],	%i4
	fmovrse	%g1,	%f4,	%f3
	srax	%l6,	%g2,	%o7
	subccc	%i7,	%o6,	%l0
	edge8	%g3,	%o4,	%g6
	edge16n	%i5,	%l3,	%l4
	xorcc	%o3,	%i2,	%o0
	movrlez	%l5,	0x0E3,	%g7
	fmovda	%xcc,	%f12,	%f5
	fone	%f10
	fcmpne16	%f4,	%f2,	%i1
	fmovsle	%icc,	%f15,	%f8
	andn	%o1,	0x09CE,	%i0
	ldx	[%l7 + 0x48],	%o5
	ldsb	[%l7 + 0x22],	%l1
	edge32	%o2,	%i3,	%i6
	save %g5, %l2, %i4
	sth	%g1,	[%l7 + 0x76]
	fone	%f10
	andn	%l6,	0x0DD1,	%g2
	ldsh	[%l7 + 0x3C],	%g4
	movvs	%icc,	%i7,	%o7
	umul	%l0,	0x0D41,	%g3
	ldd	[%l7 + 0x18],	%f0
	fone	%f14
	bshuffle	%f2,	%f10,	%f4
	sth	%o4,	[%l7 + 0x76]
	movpos	%xcc,	%g6,	%i5
	xnor	%l3,	0x035B,	%o6
	fmovdcs	%xcc,	%f13,	%f8
	edge32ln	%o3,	%i2,	%o0
	edge16l	%l4,	%g7,	%i1
	ldub	[%l7 + 0x0F],	%l5
	fornot2	%f0,	%f6,	%f8
	add	%o1,	0x1180,	%i0
	edge16n	%o5,	%l1,	%o2
	popc	%i3,	%i6
	or	%g5,	0x1DB8,	%i4
	srlx	%g1,	%l2,	%l6
	fmovrdlz	%g2,	%f8,	%f12
	xor	%i7,	0x0751,	%o7
	mova	%xcc,	%l0,	%g4
	xnor	%g3,	0x1294,	%o4
	fcmpgt32	%f6,	%f14,	%i5
	array32	%g6,	%o6,	%o3
	edge16	%i2,	%o0,	%l4
	fmovdvc	%icc,	%f6,	%f4
	fnegd	%f14,	%f6
	edge8ln	%g7,	%i1,	%l5
	xor	%l3,	%o1,	%i0
	fpsub16s	%f5,	%f9,	%f3
	lduh	[%l7 + 0x40],	%o5
	movcc	%icc,	%l1,	%i3
	smulcc	%i6,	%g5,	%i4
	movn	%xcc,	%o2,	%g1
	umulcc	%l6,	0x111B,	%g2
	xnor	%i7,	%l2,	%o7
	save %l0, 0x0E8C, %g3
	ldd	[%l7 + 0x28],	%f14
	movvs	%xcc,	%o4,	%i5
	fmovdpos	%xcc,	%f1,	%f7
	restore %g6, %o6, %g4
	alignaddr	%i2,	%o3,	%l4
	array16	%o0,	%g7,	%l5
	stb	%i1,	[%l7 + 0x79]
	edge32	%o1,	%l3,	%i0
	fmovdgu	%icc,	%f11,	%f10
	xnor	%o5,	%i3,	%i6
	stb	%l1,	[%l7 + 0x15]
	udiv	%i4,	0x0C3E,	%o2
	udiv	%g5,	0x0318,	%l6
	fandnot1s	%f14,	%f11,	%f7
	sdivx	%g2,	0x0830,	%i7
	fnors	%f5,	%f5,	%f13
	movleu	%icc,	%g1,	%o7
	siam	0x1
	movge	%icc,	%l0,	%g3
	sll	%l2,	%o4,	%i5
	movleu	%xcc,	%o6,	%g6
	sllx	%i2,	0x19,	%g4
	fmovdge	%xcc,	%f2,	%f4
	sra	%o3,	%l4,	%o0
	subc	%l5,	%g7,	%o1
	ldd	[%l7 + 0x30],	%l2
	fornot2	%f0,	%f4,	%f10
	movre	%i1,	0x35F,	%o5
	sllx	%i0,	%i6,	%i3
	fsrc1s	%f1,	%f14
	edge32	%i4,	%o2,	%l1
	fmovdleu	%icc,	%f10,	%f10
	move	%icc,	%l6,	%g2
	mova	%icc,	%i7,	%g5
	orcc	%g1,	0x18FB,	%o7
	alignaddr	%l0,	%l2,	%g3
	fnot2s	%f14,	%f6
	ldsh	[%l7 + 0x0E],	%i5
	fmovdleu	%xcc,	%f15,	%f13
	movge	%icc,	%o4,	%o6
	stw	%g6,	[%l7 + 0x44]
	sllx	%g4,	0x12,	%i2
	xnorcc	%l4,	%o3,	%l5
	movn	%icc,	%g7,	%o1
	srl	%o0,	0x05,	%i1
	orcc	%o5,	%i0,	%i6
	movneg	%xcc,	%i3,	%l3
	movn	%xcc,	%i4,	%l1
	movvc	%xcc,	%o2,	%g2
	xorcc	%l6,	0x1B7C,	%g5
	subccc	%i7,	0x09C9,	%o7
	fornot2s	%f6,	%f1,	%f11
	andncc	%l0,	%g1,	%l2
	andcc	%i5,	%o4,	%g3
	move	%xcc,	%o6,	%g4
	fmovdleu	%xcc,	%f6,	%f7
	edge32n	%i2,	%l4,	%o3
	edge8	%l5,	%g7,	%g6
	subcc	%o1,	%o0,	%o5
	fmovsvc	%xcc,	%f8,	%f14
	fnor	%f4,	%f10,	%f10
	fornot1	%f4,	%f2,	%f6
	fmovrde	%i0,	%f14,	%f6
	ldub	[%l7 + 0x35],	%i6
	fpsub16s	%f9,	%f0,	%f2
	fmul8sux16	%f14,	%f4,	%f10
	xnorcc	%i1,	%l3,	%i4
	popc	0x0F5F,	%i3
	fmovdleu	%icc,	%f12,	%f13
	edge16n	%l1,	%o2,	%l6
	movle	%icc,	%g5,	%i7
	move	%xcc,	%o7,	%l0
	andncc	%g2,	%g1,	%l2
	edge8ln	%i5,	%o4,	%g3
	movgu	%icc,	%o6,	%i2
	ldsh	[%l7 + 0x34],	%g4
	edge32	%o3,	%l4,	%l5
	fmovdge	%xcc,	%f12,	%f1
	movleu	%icc,	%g6,	%o1
	sllx	%g7,	%o0,	%o5
	movleu	%icc,	%i0,	%i1
	fmovdle	%xcc,	%f13,	%f4
	subcc	%l3,	%i4,	%i6
	fmovrdgz	%l1,	%f14,	%f8
	movrlz	%i3,	%l6,	%o2
	movpos	%xcc,	%g5,	%o7
	sra	%l0,	%g2,	%i7
	ldsh	[%l7 + 0x7A],	%g1
	xnor	%l2,	0x09D4,	%o4
	array32	%g3,	%i5,	%i2
	mova	%xcc,	%g4,	%o3
	movrne	%l4,	%o6,	%l5
	orn	%o1,	0x1A81,	%g7
	sdivcc	%g6,	0x1E24,	%o5
	fmul8x16au	%f13,	%f12,	%f4
	edge16n	%o0,	%i0,	%l3
	mulx	%i1,	%i4,	%l1
	fcmpne16	%f14,	%f8,	%i6
	edge8ln	%l6,	%o2,	%i3
	movcs	%icc,	%o7,	%g5
	fandnot1s	%f11,	%f2,	%f8
	save %g2, %l0, %g1
	stb	%i7,	[%l7 + 0x63]
	orn	%l2,	0x1D01,	%o4
	restore %g3, 0x15C1, %i5
	xnor	%i2,	0x12D5,	%o3
	move	%icc,	%g4,	%l4
	lduw	[%l7 + 0x2C],	%o6
	xorcc	%l5,	%o1,	%g7
	movl	%icc,	%g6,	%o5
	fandnot2s	%f0,	%f14,	%f0
	fmovsne	%xcc,	%f5,	%f4
	save %o0, 0x01D1, %l3
	srl	%i0,	0x0A,	%i1
	array32	%l1,	%i6,	%l6
	sethi	0x10B8,	%i4
	subccc	%o2,	%o7,	%g5
	edge16	%g2,	%l0,	%g1
	for	%f12,	%f8,	%f0
	smulcc	%i3,	%l2,	%o4
	fxnors	%f13,	%f7,	%f0
	restore %g3, 0x1AAB, %i7
	xnor	%i5,	%o3,	%i2
	fcmpgt32	%f12,	%f8,	%g4
	fxnor	%f8,	%f14,	%f12
	movcc	%icc,	%o6,	%l4
	edge8	%o1,	%g7,	%l5
	ldsw	[%l7 + 0x68],	%o5
	ldub	[%l7 + 0x58],	%o0
	lduw	[%l7 + 0x4C],	%g6
	edge32n	%i0,	%i1,	%l1
	array32	%i6,	%l3,	%i4
	fornot2	%f14,	%f6,	%f4
	srax	%l6,	%o7,	%o2
	fmul8x16	%f7,	%f0,	%f8
	orncc	%g5,	0x0572,	%g2
	fmovsne	%xcc,	%f1,	%f10
	st	%f12,	[%l7 + 0x58]
	fmovdvs	%icc,	%f1,	%f0
	lduw	[%l7 + 0x24],	%g1
	movleu	%xcc,	%l0,	%i3
	fmovrsne	%l2,	%f10,	%f13
	ldsh	[%l7 + 0x46],	%o4
	edge32n	%g3,	%i5,	%o3
	add	%i2,	0x1B46,	%g4
	or	%i7,	%o6,	%l4
	mulscc	%g7,	%o1,	%o5
	stx	%l5,	[%l7 + 0x18]
	fmovsne	%xcc,	%f4,	%f12
	udivx	%o0,	0x0BF0,	%g6
	movcs	%xcc,	%i0,	%l1
	fmul8x16	%f0,	%f10,	%f0
	movvc	%xcc,	%i6,	%l3
	smul	%i4,	%i1,	%l6
	fmul8sux16	%f12,	%f8,	%f12
	stw	%o2,	[%l7 + 0x4C]
	fmul8x16au	%f2,	%f14,	%f6
	srax	%o7,	%g5,	%g2
	sub	%l0,	%g1,	%i3
	save %l2, %o4, %i5
	movrne	%o3,	0x066,	%g3
	alignaddr	%i2,	%i7,	%g4
	fcmpeq16	%f12,	%f0,	%l4
	ldd	[%l7 + 0x08],	%f14
	add	%o6,	0x1FF1,	%o1
	mulscc	%g7,	%o5,	%o0
	fpsub32s	%f6,	%f5,	%f6
	srl	%l5,	%g6,	%l1
	movn	%xcc,	%i0,	%i6
	ldub	[%l7 + 0x46],	%i4
	movn	%xcc,	%i1,	%l6
	ldub	[%l7 + 0x64],	%l3
	sllx	%o2,	0x1A,	%g5
	udiv	%g2,	0x0D2D,	%o7
	mulscc	%g1,	0x1ECA,	%i3
	edge32	%l2,	%l0,	%o4
	movgu	%icc,	%o3,	%i5
	and	%i2,	0x0A99,	%i7
	sdivx	%g4,	0x191C,	%g3
	and	%l4,	0x05CC,	%o6
	fmovde	%xcc,	%f0,	%f9
	edge32ln	%o1,	%g7,	%o0
	ld	[%l7 + 0x78],	%f10
	fors	%f15,	%f13,	%f12
	fsrc1s	%f7,	%f0
	edge32l	%o5,	%g6,	%l5
	fmovdcs	%xcc,	%f11,	%f1
	sethi	0x13E3,	%i0
	sllx	%l1,	0x0A,	%i4
	sllx	%i1,	%l6,	%l3
	ldd	[%l7 + 0x48],	%i6
	srlx	%g5,	0x0C,	%g2
	xnorcc	%o7,	%g1,	%i3
	movrlz	%l2,	%l0,	%o2
	stw	%o4,	[%l7 + 0x34]
	movgu	%xcc,	%o3,	%i2
	fands	%f1,	%f2,	%f15
	stw	%i5,	[%l7 + 0x60]
	restore %i7, 0x0DE4, %g3
	fmovsl	%xcc,	%f1,	%f7
	fmovrslez	%l4,	%f2,	%f9
	alignaddrl	%o6,	%g4,	%g7
	fmovsneg	%icc,	%f5,	%f4
	fpadd16	%f2,	%f10,	%f4
	edge32	%o0,	%o5,	%g6
	edge8n	%l5,	%o1,	%i0
	ldsh	[%l7 + 0x58],	%l1
	fmovrse	%i1,	%f0,	%f8
	orcc	%l6,	0x1799,	%i4
	movleu	%icc,	%i6,	%g5
	subccc	%g2,	%l3,	%g1
	edge16n	%i3,	%l2,	%o7
	addccc	%l0,	0x10D7,	%o4
	movge	%xcc,	%o3,	%i2
	ldd	[%l7 + 0x38],	%f14
	ldsh	[%l7 + 0x4E],	%i5
	stw	%o2,	[%l7 + 0x10]
	xnor	%g3,	%i7,	%o6
	ldsw	[%l7 + 0x60],	%l4
	ld	[%l7 + 0x2C],	%f8
	srax	%g7,	0x0C,	%o0
	stx	%g4,	[%l7 + 0x20]
	edge32ln	%o5,	%g6,	%o1
	edge8ln	%i0,	%l1,	%i1
	sdivcc	%l6,	0x1AFA,	%l5
	ldd	[%l7 + 0x10],	%i4
	ldsw	[%l7 + 0x18],	%i6
	movl	%icc,	%g2,	%g5
	edge8ln	%l3,	%g1,	%l2
	andn	%o7,	0x0502,	%l0
	udiv	%o4,	0x0CE2,	%i3
	andncc	%i2,	%o3,	%i5
	array8	%g3,	%o2,	%o6
	xnorcc	%l4,	0x06E8,	%g7
	lduh	[%l7 + 0x12],	%i7
	fmovsa	%icc,	%f11,	%f9
	sethi	0x0493,	%g4
	fpack16	%f14,	%f2
	xnorcc	%o5,	0x0E87,	%o0
	alignaddr	%g6,	%o1,	%i0
	addccc	%l1,	%i1,	%l5
	edge16l	%l6,	%i6,	%g2
	fnegd	%f14,	%f4
	andncc	%i4,	%g5,	%l3
	fmovrslez	%l2,	%f9,	%f0
	orcc	%g1,	%o7,	%l0
	movl	%icc,	%o4,	%i3
	restore %i2, %i5, %o3
	sub	%o2,	%g3,	%l4
	movvs	%icc,	%o6,	%i7
	ldd	[%l7 + 0x40],	%g6
	udiv	%o5,	0x1507,	%g4
	move	%xcc,	%o0,	%g6
	xor	%o1,	0x195A,	%l1
	stw	%i0,	[%l7 + 0x64]
	umulcc	%l5,	%i1,	%l6
	stx	%i6,	[%l7 + 0x58]
	movrlez	%g2,	0x3AB,	%g5
	movrne	%l3,	0x15B,	%l2
	edge8	%i4,	%g1,	%l0
	fornot2	%f8,	%f12,	%f2
	edge16	%o4,	%i3,	%o7
	srlx	%i5,	0x12,	%o3
	fcmpgt32	%f12,	%f10,	%o2
	ldsb	[%l7 + 0x19],	%g3
	ldsb	[%l7 + 0x75],	%l4
	fsrc2s	%f9,	%f13
	std	%f12,	[%l7 + 0x20]
	std	%f12,	[%l7 + 0x70]
	sdiv	%o6,	0x0B2A,	%i2
	movle	%xcc,	%g7,	%o5
	movge	%xcc,	%i7,	%g4
	fmovse	%icc,	%f5,	%f12
	ldd	[%l7 + 0x40],	%f12
	edge32n	%g6,	%o1,	%l1
	lduw	[%l7 + 0x7C],	%i0
	fone	%f10
	movre	%o0,	0x212,	%i1
	edge32ln	%l5,	%l6,	%i6
	xor	%g2,	%g5,	%l2
	movneg	%icc,	%i4,	%l3
	andn	%g1,	%o4,	%i3
	andncc	%o7,	%l0,	%o3
	fandnot2s	%f7,	%f11,	%f8
	save %i5, %g3, %l4
	ldub	[%l7 + 0x2A],	%o2
	movrgz	%o6,	%i2,	%o5
	orn	%g7,	%i7,	%g6
	movrlz	%o1,	%g4,	%i0
	addcc	%l1,	%i1,	%o0
	fmovsn	%xcc,	%f7,	%f8
	smulcc	%l6,	%l5,	%i6
	xor	%g5,	0x08BD,	%l2
	stx	%i4,	[%l7 + 0x28]
	sll	%l3,	0x0D,	%g1
	edge16l	%g2,	%o4,	%o7
	udivcc	%i3,	0x0443,	%o3
	fsrc2s	%f15,	%f8
	addc	%i5,	%g3,	%l4
	movrlez	%l0,	0x33B,	%o2
	edge8	%i2,	%o6,	%g7
	movvs	%icc,	%i7,	%o5
	std	%f6,	[%l7 + 0x50]
	fand	%f10,	%f12,	%f2
	array8	%o1,	%g4,	%g6
	fmovdleu	%xcc,	%f13,	%f8
	st	%f10,	[%l7 + 0x6C]
	subcc	%l1,	%i1,	%o0
	sth	%i0,	[%l7 + 0x6A]
	array8	%l5,	%l6,	%g5
	edge8n	%l2,	%i6,	%l3
	xnorcc	%i4,	%g2,	%o4
	array16	%o7,	%g1,	%o3
	lduh	[%l7 + 0x60],	%i3
	ldsw	[%l7 + 0x6C],	%i5
	fsrc1s	%f1,	%f14
	movleu	%icc,	%g3,	%l4
	srl	%l0,	%i2,	%o2
	alignaddr	%g7,	%i7,	%o6
	for	%f12,	%f4,	%f6
	movrne	%o1,	%o5,	%g6
	udivx	%l1,	0x1FC7,	%i1
	addccc	%o0,	0x0CFD,	%i0
	xorcc	%g4,	%l5,	%g5
	edge16	%l2,	%l6,	%i6
	array16	%i4,	%g2,	%o4
	ldsw	[%l7 + 0x28],	%o7
	fmovdne	%icc,	%f15,	%f8
	sdivx	%g1,	0x1778,	%o3
	subccc	%i3,	0x10DC,	%i5
	fmovse	%xcc,	%f1,	%f10
	edge16ln	%g3,	%l3,	%l0
	sdivcc	%l4,	0x1814,	%i2
	movvc	%xcc,	%g7,	%i7
	fmovsleu	%xcc,	%f15,	%f7
	fmul8ulx16	%f8,	%f0,	%f14
	ldsw	[%l7 + 0x70],	%o6
	edge32ln	%o2,	%o1,	%g6
	movcs	%icc,	%l1,	%o5
	mulx	%i1,	%o0,	%g4
	fmovrdgez	%i0,	%f14,	%f0
	srax	%g5,	0x04,	%l5
	fmovdle	%icc,	%f10,	%f0
	udiv	%l2,	0x1F75,	%l6
	orn	%i6,	0x1842,	%i4
	sra	%o4,	%g2,	%g1
	array16	%o7,	%i3,	%i5
	sll	%g3,	%o3,	%l3
	addc	%l0,	%l4,	%i2
	movrne	%i7,	0x176,	%g7
	sub	%o2,	%o1,	%g6
	fmovs	%f2,	%f4
	fands	%f13,	%f13,	%f10
	edge32n	%l1,	%o5,	%i1
	udiv	%o0,	0x1D57,	%g4
	mova	%icc,	%i0,	%o6
	edge32	%g5,	%l2,	%l6
	or	%i6,	0x102D,	%i4
	xnorcc	%l5,	0x040D,	%g2
	fmovdle	%xcc,	%f4,	%f6
	fmovsl	%xcc,	%f12,	%f5
	lduw	[%l7 + 0x5C],	%o4
	movvc	%icc,	%o7,	%g1
	sethi	0x19F5,	%i5
	restore %g3, 0x18B0, %o3
	movvc	%xcc,	%i3,	%l3
	fmovsne	%icc,	%f13,	%f11
	udiv	%l4,	0x1FCA,	%i2
	alignaddrl	%l0,	%i7,	%g7
	movrlez	%o1,	0x2EF,	%o2
	edge32	%l1,	%o5,	%i1
	movge	%icc,	%o0,	%g4
	movrgz	%g6,	0x097,	%o6
	alignaddrl	%i0,	%g5,	%l2
	fsrc2	%f2,	%f12
	edge16	%l6,	%i4,	%l5
	fandnot2s	%f2,	%f14,	%f13
	fmovdgu	%icc,	%f5,	%f0
	movcc	%icc,	%i6,	%o4
	mulx	%o7,	0x011A,	%g2
	movre	%i5,	%g1,	%g3
	fnands	%f6,	%f7,	%f14
	fornot1s	%f8,	%f2,	%f1
	movvs	%icc,	%o3,	%i3
	addcc	%l4,	0x1FC7,	%l3
	fmovsl	%icc,	%f6,	%f8
	umul	%l0,	0x0E52,	%i7
	sethi	0x0525,	%i2
	edge16n	%o1,	%g7,	%o2
	sra	%o5,	%i1,	%o0
	ldd	[%l7 + 0x70],	%l0
	and	%g6,	%g4,	%i0
	sth	%g5,	[%l7 + 0x5E]
	sll	%l2,	%l6,	%i4
	movrlz	%l5,	0x020,	%i6
	fmovsvc	%icc,	%f3,	%f10
	addccc	%o4,	0x0552,	%o7
	ld	[%l7 + 0x58],	%f5
	umulcc	%o6,	%i5,	%g1
	edge8ln	%g3,	%o3,	%i3
	or	%g2,	%l3,	%l4
	edge32n	%i7,	%i2,	%o1
	fabss	%f13,	%f15
	sdivx	%g7,	0x17F8,	%l0
	fcmple16	%f14,	%f10,	%o2
	add	%i1,	0x1E39,	%o0
	andncc	%o5,	%g6,	%l1
	fpadd16	%f4,	%f14,	%f2
	and	%i0,	%g4,	%l2
	fsrc2	%f4,	%f8
	subccc	%l6,	%i4,	%g5
	umul	%i6,	0x0A50,	%l5
	stb	%o7,	[%l7 + 0x22]
	fnors	%f12,	%f4,	%f2
	and	%o6,	%i5,	%o4
	ld	[%l7 + 0x74],	%f8
	fmovrdgz	%g3,	%f4,	%f6
	stx	%g1,	[%l7 + 0x50]
	edge16ln	%o3,	%i3,	%g2
	edge16l	%l3,	%i7,	%l4
	ldd	[%l7 + 0x40],	%o0
	smul	%g7,	%l0,	%i2
	array32	%i1,	%o2,	%o0
	smulcc	%o5,	%g6,	%i0
	fnands	%f11,	%f14,	%f2
	or	%l1,	0x1D39,	%g4
	movleu	%xcc,	%l6,	%i4
	andn	%l2,	%g5,	%i6
	array16	%l5,	%o6,	%o7
	edge16n	%o4,	%g3,	%i5
	fmovrdlz	%o3,	%f8,	%f6
	save %g1, 0x18B4, %i3
	fmovscc	%icc,	%f9,	%f11
	orcc	%l3,	0x1822,	%g2
	subc	%l4,	0x04E3,	%i7
	fmovsg	%icc,	%f4,	%f0
	fmovsle	%xcc,	%f1,	%f4
	edge8ln	%o1,	%l0,	%i2
	addccc	%i1,	%g7,	%o0
	ld	[%l7 + 0x2C],	%f15
	fcmpne32	%f14,	%f0,	%o2
	stb	%o5,	[%l7 + 0x6A]
	umul	%i0,	%l1,	%g6
	edge32ln	%l6,	%i4,	%l2
	movn	%icc,	%g5,	%g4
	subccc	%i6,	0x17A4,	%l5
	subccc	%o7,	%o6,	%g3
	fmovdg	%icc,	%f4,	%f14
	fmovdleu	%icc,	%f2,	%f5
	ldsb	[%l7 + 0x66],	%o4
	movvc	%icc,	%o3,	%g1
	movrgz	%i3,	%i5,	%l3
	movrlz	%l4,	0x1A0,	%i7
	movrgz	%g2,	%o1,	%l0
	fmovde	%xcc,	%f6,	%f2
	save %i2, 0x0ADE, %g7
	addccc	%o0,	0x06EC,	%i1
	fpadd32s	%f14,	%f5,	%f5
	edge32n	%o5,	%i0,	%o2
	andcc	%l1,	0x0E91,	%l6
	array16	%i4,	%g6,	%l2
	orcc	%g5,	0x1C14,	%g4
	fmovdl	%icc,	%f11,	%f4
	xor	%i6,	0x046E,	%o7
	sllx	%l5,	0x01,	%o6
	fcmpne32	%f10,	%f12,	%o4
	sethi	0x0C47,	%g3
	udiv	%g1,	0x0CF2,	%o3
	movge	%icc,	%i3,	%i5
	smulcc	%l3,	%i7,	%l4
	xorcc	%g2,	%l0,	%o1
	sethi	0x1E3A,	%i2
	xor	%o0,	0x0566,	%g7
	fmovdn	%xcc,	%f2,	%f14
	edge32n	%o5,	%i1,	%i0
	xnorcc	%l1,	%l6,	%o2
	popc	0x154D,	%g6
	andn	%i4,	0x0D2D,	%l2
	sllx	%g4,	%i6,	%g5
	xnor	%o7,	%l5,	%o6
	xorcc	%o4,	0x040D,	%g1
	fsrc1	%f14,	%f4
	fone	%f4
	udivx	%g3,	0x1949,	%i3
	fpack32	%f12,	%f14,	%f12
	array16	%i5,	%l3,	%o3
	movcc	%icc,	%i7,	%g2
	movrlz	%l0,	%l4,	%i2
	edge8l	%o1,	%g7,	%o5
	fpsub32s	%f8,	%f1,	%f4
	array16	%o0,	%i1,	%i0
	fsrc2	%f2,	%f4
	fmovsne	%icc,	%f9,	%f7
	array16	%l6,	%o2,	%l1
	alignaddr	%i4,	%g6,	%l2
	edge32n	%g4,	%i6,	%o7
	ldd	[%l7 + 0x28],	%g4
	xor	%l5,	%o6,	%g1
	st	%f7,	[%l7 + 0x08]
	or	%o4,	%g3,	%i5
	addc	%l3,	%i3,	%i7
	movcc	%icc,	%g2,	%o3
	udivx	%l0,	0x18C9,	%l4
	fornot2s	%f6,	%f9,	%f10
	subccc	%o1,	0x0732,	%i2
	ldsw	[%l7 + 0x7C],	%o5
	fcmpne16	%f8,	%f10,	%g7
	fmovsvs	%icc,	%f6,	%f6
	lduh	[%l7 + 0x7E],	%o0
	orncc	%i0,	0x0032,	%l6
	mulx	%i1,	%l1,	%i4
	fsrc1s	%f10,	%f1
	edge32ln	%g6,	%l2,	%g4
	stw	%o2,	[%l7 + 0x60]
	alignaddrl	%o7,	%g5,	%i6
	edge32l	%o6,	%l5,	%o4
	movneg	%icc,	%g3,	%g1
	fmovrsgez	%i5,	%f11,	%f9
	movrgez	%i3,	%i7,	%l3
	fsrc1s	%f15,	%f12
	sllx	%g2,	%o3,	%l0
	sllx	%o1,	0x10,	%l4
	edge16	%i2,	%o5,	%g7
	edge32	%o0,	%i0,	%l6
	edge8n	%l1,	%i4,	%g6
	movcs	%xcc,	%i1,	%l2
	fmovrdlez	%o2,	%f8,	%f12
	mova	%icc,	%g4,	%g5
	udivcc	%i6,	0x063A,	%o7
	fmovdcc	%xcc,	%f14,	%f4
	addccc	%l5,	0x1302,	%o6
	movne	%xcc,	%o4,	%g3
	subcc	%g1,	0x0A12,	%i5
	edge16ln	%i7,	%i3,	%g2
	ldsb	[%l7 + 0x67],	%o3
	fcmpne16	%f14,	%f6,	%l3
	ldd	[%l7 + 0x30],	%l0
	andncc	%l4,	%o1,	%i2
	stx	%g7,	[%l7 + 0x20]
	movne	%icc,	%o0,	%o5
	sdiv	%i0,	0x0A78,	%l6
	edge8ln	%i4,	%g6,	%l1
	edge8n	%l2,	%o2,	%g4
	sdiv	%i1,	0x02E9,	%g5
	or	%i6,	%l5,	%o6
	movge	%xcc,	%o4,	%o7
	fmovrdne	%g3,	%f10,	%f6
	fnot1s	%f0,	%f12
	edge32	%i5,	%i7,	%g1
	sra	%i3,	0x0B,	%g2
	fcmpne32	%f14,	%f10,	%l3
	ldub	[%l7 + 0x14],	%l0
	restore %o3, 0x1EAC, %l4
	fxor	%f4,	%f8,	%f4
	movrgez	%o1,	0x206,	%g7
	movrlz	%i2,	0x389,	%o5
	sllx	%i0,	%o0,	%i4
	fnegd	%f10,	%f10
	fmovrde	%g6,	%f4,	%f8
	movcs	%xcc,	%l6,	%l2
	srl	%l1,	0x03,	%g4
	array32	%i1,	%o2,	%i6
	or	%l5,	%o6,	%g5
	st	%f12,	[%l7 + 0x24]
	mulx	%o7,	0x1DBC,	%o4
	edge16ln	%i5,	%i7,	%g3
	xorcc	%i3,	0x1C33,	%g2
	ldd	[%l7 + 0x50],	%f10
	orncc	%g1,	0x1802,	%l0
	popc	0x09FF,	%l3
	fpadd32	%f8,	%f10,	%f8
	fcmpgt32	%f14,	%f6,	%l4
	std	%f2,	[%l7 + 0x58]
	addc	%o1,	%o3,	%g7
	bshuffle	%f6,	%f8,	%f8
	movre	%o5,	0x297,	%i2
	fands	%f13,	%f14,	%f5
	st	%f4,	[%l7 + 0x14]
	addccc	%o0,	0x12C8,	%i4
	fmovsne	%icc,	%f15,	%f9
	edge16ln	%i0,	%g6,	%l6
	stb	%l1,	[%l7 + 0x61]
	movle	%icc,	%g4,	%l2
	fand	%f14,	%f14,	%f8
	fones	%f2
	fmovsvs	%xcc,	%f6,	%f0
	movl	%xcc,	%i1,	%o2
	ldsh	[%l7 + 0x48],	%l5
	lduh	[%l7 + 0x0C],	%i6
	fmovrdlez	%g5,	%f14,	%f6
	fmovdgu	%icc,	%f8,	%f4
	edge8n	%o7,	%o6,	%i5
	movgu	%xcc,	%o4,	%i7
	fcmple32	%f12,	%f2,	%i3
	movneg	%xcc,	%g3,	%g1
	smul	%g2,	0x01C1,	%l3
	srax	%l4,	0x01,	%l0
	subc	%o1,	0x0889,	%o3
	movcs	%icc,	%g7,	%i2
	ldd	[%l7 + 0x20],	%f4
	add	%o0,	0x0905,	%o5
	movge	%icc,	%i4,	%g6
	fmovsne	%xcc,	%f4,	%f8
	udivcc	%i0,	0x1E75,	%l6
	edge16n	%g4,	%l1,	%l2
	fmovscs	%icc,	%f13,	%f3
	movl	%icc,	%o2,	%l5
	movl	%icc,	%i1,	%i6
	fmovscs	%icc,	%f7,	%f5
	subc	%g5,	0x03DC,	%o7
	movge	%icc,	%i5,	%o6
	alignaddrl	%i7,	%i3,	%o4
	fcmpgt16	%f12,	%f8,	%g3
	mulscc	%g2,	0x0BA2,	%l3
	umulcc	%g1,	%l4,	%o1
	movrgz	%l0,	%g7,	%o3
	add	%o0,	%i2,	%o5
	fmuld8ulx16	%f5,	%f6,	%f4
	fmuld8sux16	%f13,	%f14,	%f4
	std	%f4,	[%l7 + 0x20]
	sra	%g6,	%i0,	%i4
	xnor	%l6,	0x1FA3,	%l1
	movne	%xcc,	%g4,	%o2
	stw	%l5,	[%l7 + 0x14]
	fsrc1	%f2,	%f2
	array8	%l2,	%i6,	%i1
	fmovrdgz	%o7,	%f10,	%f14
	fmovsg	%icc,	%f0,	%f9
	edge16l	%g5,	%o6,	%i5
	fmovdcc	%icc,	%f7,	%f15
	movge	%icc,	%i7,	%o4
	ldd	[%l7 + 0x58],	%g2
	ldsb	[%l7 + 0x14],	%i3
	edge8ln	%l3,	%g2,	%l4
	restore %g1, %l0, %g7
	fpsub32	%f12,	%f4,	%f10
	fandnot2	%f14,	%f6,	%f8
	udivx	%o1,	0x01C7,	%o0
	orncc	%i2,	0x110B,	%o5
	edge8n	%g6,	%o3,	%i4
	movl	%icc,	%l6,	%i0
	fmovdneg	%xcc,	%f1,	%f7
	addccc	%l1,	0x1F22,	%o2
	movleu	%icc,	%l5,	%g4
	ldsb	[%l7 + 0x57],	%l2
	andcc	%i6,	%o7,	%g5
	mulscc	%i1,	0x0ECC,	%o6
	alignaddrl	%i5,	%o4,	%i7
	ldd	[%l7 + 0x78],	%i2
	addccc	%g3,	%g2,	%l3
	movneg	%xcc,	%g1,	%l0
	fmovdleu	%icc,	%f15,	%f9
	fornot1s	%f6,	%f2,	%f11
	addc	%l4,	0x1BF9,	%o1
	edge8ln	%o0,	%g7,	%i2
	xnor	%o5,	%g6,	%i4
	ldub	[%l7 + 0x1D],	%l6
	add	%i0,	0x0ECE,	%l1
	smulcc	%o2,	%l5,	%o3
	lduw	[%l7 + 0x28],	%l2
	sth	%g4,	[%l7 + 0x60]
	fmovspos	%xcc,	%f2,	%f0
	alignaddr	%o7,	%i6,	%i1
	umul	%g5,	%i5,	%o6
	movle	%xcc,	%i7,	%o4
	ldd	[%l7 + 0x48],	%g2
	xor	%g2,	0x19C3,	%i3
	array32	%l3,	%l0,	%l4
	sdiv	%g1,	0x1449,	%o1
	fnands	%f1,	%f7,	%f2
	add	%g7,	0x11BD,	%o0
	movge	%icc,	%o5,	%g6
	movrgz	%i2,	%i4,	%l6
	edge8	%l1,	%i0,	%l5
	mulx	%o2,	%o3,	%g4
	fmovrsgz	%l2,	%f9,	%f11
	edge32ln	%o7,	%i1,	%g5
	movleu	%icc,	%i6,	%i5
	ldsh	[%l7 + 0x6A],	%i7
	andn	%o6,	%g3,	%g2
	addc	%i3,	0x0B8C,	%o4
	subc	%l3,	%l4,	%l0
	movrlez	%g1,	0x3FE,	%o1
	alignaddr	%o0,	%g7,	%o5
	ldx	[%l7 + 0x48],	%i2
	sll	%g6,	%l6,	%i4
	movle	%icc,	%l1,	%i0
	andncc	%o2,	%l5,	%g4
	movpos	%icc,	%o3,	%o7
	fmovrdlz	%l2,	%f14,	%f0
	fmovdcs	%icc,	%f14,	%f15
	movne	%xcc,	%i1,	%i6
	ldd	[%l7 + 0x58],	%i4
	movcs	%icc,	%g5,	%i7
	sll	%o6,	%g2,	%i3
	fmovsl	%xcc,	%f13,	%f1
	movcc	%icc,	%g3,	%l3
	movle	%icc,	%o4,	%l0
	sdiv	%l4,	0x0943,	%g1
	fnands	%f15,	%f15,	%f0
	array8	%o0,	%g7,	%o1
	fcmple32	%f14,	%f10,	%i2
	fmul8sux16	%f10,	%f6,	%f8
	ldx	[%l7 + 0x48],	%g6
	fxnor	%f10,	%f0,	%f2
	fmovdvs	%icc,	%f4,	%f0
	fmovrdgez	%l6,	%f6,	%f14
	movvs	%xcc,	%i4,	%l1
	edge16n	%o5,	%o2,	%l5
	popc	%i0,	%g4
	smul	%o3,	%o7,	%i1
	fmovrsgz	%i6,	%f1,	%f0
	fexpand	%f6,	%f6
	subc	%l2,	%g5,	%i7
	movneg	%icc,	%o6,	%i5
	fmovrdgez	%i3,	%f14,	%f12
	fmovd	%f8,	%f8
	orcc	%g3,	%l3,	%g2
	movcs	%icc,	%o4,	%l0
	mova	%xcc,	%g1,	%o0
	subc	%l4,	%g7,	%o1
	movle	%icc,	%g6,	%i2
	edge8n	%l6,	%l1,	%i4
	ldx	[%l7 + 0x50],	%o2
	fnegs	%f8,	%f3
	alignaddrl	%o5,	%l5,	%i0
	fmovse	%icc,	%f10,	%f6
	ldd	[%l7 + 0x60],	%o2
	fpsub16s	%f3,	%f14,	%f2
	fpack32	%f0,	%f8,	%f12
	edge8	%g4,	%i1,	%o7
	fmovscc	%icc,	%f0,	%f9
	edge16	%i6,	%g5,	%l2
	andcc	%o6,	0x1A18,	%i5
	edge32n	%i3,	%g3,	%l3
	movne	%icc,	%g2,	%i7
	umul	%l0,	%g1,	%o4
	movne	%xcc,	%o0,	%g7
	movcs	%xcc,	%l4,	%g6
	movvc	%icc,	%o1,	%i2
	srlx	%l1,	%l6,	%o2
	popc	0x1811,	%o5
	stw	%l5,	[%l7 + 0x28]
	st	%f14,	[%l7 + 0x64]
	subc	%i4,	%i0,	%g4
	edge16l	%i1,	%o3,	%i6
	umulcc	%o7,	%g5,	%o6
	mova	%xcc,	%l2,	%i3
	movge	%xcc,	%i5,	%g3
	movrne	%l3,	%g2,	%l0
	srax	%i7,	0x0A,	%g1
	fmovdpos	%xcc,	%f0,	%f4
	sth	%o4,	[%l7 + 0x0C]
	save %g7, %o0, %g6
	add	%l4,	0x0DE7,	%i2
	subccc	%l1,	%l6,	%o1
	ldsh	[%l7 + 0x22],	%o5
	alignaddrl	%o2,	%l5,	%i4
	smulcc	%g4,	0x1FF9,	%i0
	sethi	0x0937,	%o3
	lduw	[%l7 + 0x5C],	%i1
	sethi	0x0E40,	%o7
	movgu	%xcc,	%g5,	%o6
	fcmpes	%fcc3,	%f9,	%f1
	edge32l	%l2,	%i3,	%i6
	edge32l	%i5,	%l3,	%g3
	alignaddr	%g2,	%l0,	%g1
	movg	%icc,	%i7,	%g7
	sethi	0x18C0,	%o0
	umulcc	%o4,	0x05BA,	%l4
	fmovda	%icc,	%f8,	%f14
	fmovrsgez	%g6,	%f9,	%f13
	ldd	[%l7 + 0x58],	%l0
	udiv	%i2,	0x195B,	%l6
	and	%o1,	%o5,	%o2
	sdivcc	%i4,	0x0D01,	%l5
	ldsh	[%l7 + 0x26],	%i0
	fmovsvs	%icc,	%f13,	%f1
	fands	%f12,	%f3,	%f0
	fmul8x16	%f0,	%f10,	%f6
	array16	%o3,	%i1,	%g4
	ldsb	[%l7 + 0x5B],	%o7
	xnor	%o6,	0x1A9E,	%g5
	edge32n	%i3,	%l2,	%i6
	edge8n	%i5,	%g3,	%l3
	fpmerge	%f13,	%f1,	%f4
	movn	%xcc,	%g2,	%l0
	smulcc	%i7,	0x0CE7,	%g7
	movcs	%icc,	%g1,	%o0
	ldsh	[%l7 + 0x20],	%l4
	xnor	%o4,	0x19C0,	%g6
	smul	%i2,	0x06F8,	%l1
	movpos	%xcc,	%o1,	%l6
	mulx	%o2,	%i4,	%o5
	array16	%i0,	%o3,	%i1
	fandnot1	%f6,	%f6,	%f4
	movvc	%icc,	%l5,	%o7
	fmovrdlez	%g4,	%f0,	%f8
	array32	%g5,	%i3,	%o6
	movrne	%l2,	0x129,	%i6
	faligndata	%f6,	%f4,	%f8
	ld	[%l7 + 0x08],	%f13
	save %g3, 0x03CD, %i5
	mulx	%g2,	%l3,	%i7
	stb	%l0,	[%l7 + 0x57]
	fpsub16	%f2,	%f12,	%f10
	ldsw	[%l7 + 0x2C],	%g1
	fmovs	%f15,	%f2
	stb	%g7,	[%l7 + 0x5A]
	sethi	0x117E,	%l4
	fmovrde	%o4,	%f12,	%f14
	movvc	%icc,	%o0,	%g6
	srlx	%i2,	0x09,	%l1
	fpackfix	%f4,	%f2
	sdivcc	%o1,	0x0D12,	%l6
	movne	%xcc,	%i4,	%o2
	array8	%i0,	%o3,	%o5
	edge32ln	%l5,	%i1,	%g4
	ldsw	[%l7 + 0x50],	%o7
	ld	[%l7 + 0x64],	%f7
	sra	%g5,	%o6,	%l2
	addcc	%i3,	%i6,	%g3
	std	%f8,	[%l7 + 0x70]
	ldsh	[%l7 + 0x0A],	%i5
	lduh	[%l7 + 0x1A],	%g2
	orcc	%l3,	%i7,	%g1
	movpos	%xcc,	%l0,	%l4
	mulx	%g7,	0x10AD,	%o0
	fmovsgu	%icc,	%f0,	%f14
	fmovdl	%xcc,	%f5,	%f12
	fzero	%f6
	edge32	%o4,	%g6,	%i2
	fmovrslez	%l1,	%f10,	%f8
	stx	%o1,	[%l7 + 0x68]
	edge16	%i4,	%o2,	%i0
	fpsub16s	%f8,	%f6,	%f5
	lduh	[%l7 + 0x62],	%o3
	srax	%o5,	0x05,	%l6
	movvc	%xcc,	%l5,	%i1
	fmuld8ulx16	%f2,	%f14,	%f6
	sethi	0x0660,	%o7
	or	%g5,	0x049C,	%o6
	edge8l	%l2,	%g4,	%i6
	sra	%g3,	%i5,	%i3
	sub	%l3,	0x1B90,	%i7
	addccc	%g2,	0x13E5,	%l0
	ldsw	[%l7 + 0x58],	%l4
	fmuld8sux16	%f6,	%f2,	%f0
	fornot2	%f4,	%f2,	%f14
	subc	%g1,	%g7,	%o4
	xnor	%o0,	0x1F90,	%i2
	srax	%g6,	%o1,	%i4
	andcc	%o2,	0x1B0A,	%l1
	movrgez	%i0,	%o3,	%l6
	xorcc	%l5,	%i1,	%o5
	array8	%g5,	%o7,	%o6
	ldd	[%l7 + 0x10],	%f4
	move	%xcc,	%l2,	%i6
	fmul8x16al	%f12,	%f11,	%f6
	sdivx	%g4,	0x12C6,	%g3
	fnand	%f8,	%f2,	%f14
	sethi	0x177F,	%i3
	mulscc	%l3,	0x02A2,	%i5
	movrgez	%i7,	%l0,	%l4
	fmovsa	%icc,	%f10,	%f8
	for	%f4,	%f4,	%f10
	edge32	%g2,	%g1,	%g7
	fmovsle	%icc,	%f13,	%f14
	move	%icc,	%o4,	%i2
	stx	%o0,	[%l7 + 0x70]
	edge32n	%g6,	%o1,	%i4
	xorcc	%l1,	%i0,	%o3
	or	%l6,	0x03A2,	%l5
	fmovdge	%icc,	%f4,	%f7
	ldd	[%l7 + 0x28],	%i0
	movvc	%icc,	%o5,	%g5
	move	%xcc,	%o2,	%o6
	orcc	%l2,	%i6,	%o7
	udivx	%g3,	0x0AF8,	%i3
	add	%g4,	%l3,	%i5
	or	%l0,	0x12E7,	%l4
	movpos	%icc,	%g2,	%i7
	fnors	%f3,	%f10,	%f12
	movn	%icc,	%g1,	%g7
	xnorcc	%i2,	%o0,	%g6
	addcc	%o1,	0x1F1E,	%o4
	mulscc	%l1,	%i0,	%o3
	movl	%icc,	%l6,	%l5
	edge16l	%i1,	%o5,	%i4
	fnegd	%f14,	%f12
	array32	%g5,	%o2,	%o6
	or	%i6,	%o7,	%g3
	edge32l	%l2,	%g4,	%l3
	addccc	%i5,	%i3,	%l4
	fornot2	%f14,	%f14,	%f10
	movrgz	%l0,	%i7,	%g2
	subc	%g1,	%i2,	%o0
	faligndata	%f6,	%f2,	%f8
	edge8n	%g7,	%g6,	%o4
	andn	%l1,	0x0888,	%o1
	umulcc	%o3,	%l6,	%l5
	fnegd	%f14,	%f14
	fmovdl	%xcc,	%f1,	%f8
	subc	%i0,	%i1,	%o5
	addccc	%g5,	0x1B54,	%o2
	fzero	%f0
	movrne	%o6,	0x245,	%i6
	stb	%o7,	[%l7 + 0x3C]
	movrlz	%g3,	0x2CA,	%l2
	ld	[%l7 + 0x48],	%f10
	fmovdcs	%xcc,	%f10,	%f2
	edge8	%g4,	%l3,	%i5
	sethi	0x00AE,	%i3
	ld	[%l7 + 0x2C],	%f15
	st	%f10,	[%l7 + 0x58]
	ldsh	[%l7 + 0x4C],	%l4
	movrgez	%i4,	%l0,	%g2
	andcc	%g1,	%i7,	%o0
	popc	0x104D,	%i2
	lduh	[%l7 + 0x5C],	%g6
	stb	%o4,	[%l7 + 0x65]
	subccc	%g7,	%l1,	%o3
	movle	%icc,	%o1,	%l6
	restore %i0, %l5, %o5
	fandnot1	%f8,	%f14,	%f6
	restore %g5, %o2, %o6
	edge8	%i6,	%i1,	%o7
	fmovrdlez	%l2,	%f14,	%f0
	fmovsvc	%xcc,	%f1,	%f15
	fpadd16s	%f14,	%f11,	%f5
	orn	%g3,	0x04EA,	%l3
	movge	%xcc,	%i5,	%i3
	sll	%l4,	0x11,	%g4
	xnorcc	%l0,	0x0EB5,	%i4
	ldx	[%l7 + 0x08],	%g2
	movrgz	%i7,	%g1,	%i2
	fones	%f15
	srlx	%o0,	0x12,	%o4
	array16	%g6,	%l1,	%g7
	xorcc	%o1,	%o3,	%i0
	movne	%xcc,	%l6,	%o5
	mova	%icc,	%g5,	%l5
	sll	%o6,	0x12,	%o2
	fcmpgt32	%f4,	%f10,	%i1
	movvc	%icc,	%o7,	%i6
	alignaddrl	%l2,	%g3,	%l3
	fnands	%f8,	%f6,	%f7
	stb	%i3,	[%l7 + 0x54]
	fnot2s	%f12,	%f4
	fsrc2s	%f10,	%f6
	srl	%i5,	%g4,	%l0
	st	%f10,	[%l7 + 0x10]
	sth	%l4,	[%l7 + 0x54]
	ldx	[%l7 + 0x20],	%i4
	smulcc	%g2,	0x1318,	%i7
	fmovrsgez	%g1,	%f4,	%f7
	xor	%o0,	0x0A33,	%o4
	orcc	%i2,	%g6,	%l1
	movle	%xcc,	%o1,	%o3
	fcmpne32	%f10,	%f14,	%g7
	sdivx	%l6,	0x0900,	%o5
	umul	%g5,	%i0,	%l5
	edge16l	%o6,	%o2,	%o7
	fmovsneg	%xcc,	%f9,	%f15
	fmuld8sux16	%f4,	%f11,	%f2
	lduh	[%l7 + 0x10],	%i6
	fmovscs	%xcc,	%f11,	%f9
	ldsw	[%l7 + 0x6C],	%i1
	fmovsge	%icc,	%f2,	%f9
	fsrc1	%f14,	%f14
	fpadd16s	%f2,	%f3,	%f15
	fcmpes	%fcc2,	%f11,	%f1
	subc	%l2,	%g3,	%l3
	sdivcc	%i3,	0x0255,	%i5
	ld	[%l7 + 0x64],	%f14
	srlx	%g4,	%l0,	%l4
	udiv	%g2,	0x0D4C,	%i7
	subc	%i4,	0x07E7,	%o0
	bshuffle	%f2,	%f4,	%f14
	ldsh	[%l7 + 0x70],	%g1
	fors	%f7,	%f11,	%f12
	movcs	%icc,	%o4,	%i2
	movle	%xcc,	%g6,	%o1
	srax	%l1,	0x10,	%o3
	edge16	%g7,	%o5,	%g5
	ldsh	[%l7 + 0x12],	%l6
	and	%l5,	0x0644,	%o6
	ldsw	[%l7 + 0x4C],	%i0
	addc	%o7,	0x025B,	%o2
	edge32n	%i1,	%l2,	%g3
	xor	%i6,	0x026F,	%i3
	ldsh	[%l7 + 0x44],	%l3
	fxor	%f10,	%f12,	%f12
	umul	%g4,	%i5,	%l0
	restore %l4, %i7, %i4
	smul	%g2,	%g1,	%o4
	fmovsneg	%xcc,	%f11,	%f5
	sth	%o0,	[%l7 + 0x3E]
	fmovsge	%xcc,	%f8,	%f14
	fmovsleu	%xcc,	%f0,	%f13
	array32	%g6,	%i2,	%o1
	faligndata	%f14,	%f8,	%f10
	movrgez	%l1,	0x152,	%o3
	movneg	%xcc,	%g7,	%o5
	smulcc	%l6,	0x04E9,	%l5
	ldsw	[%l7 + 0x14],	%o6
	edge8l	%g5,	%i0,	%o7
	edge8ln	%o2,	%i1,	%g3
	movvc	%icc,	%i6,	%i3
	array8	%l3,	%g4,	%i5
	mulx	%l2,	%l4,	%i7
	fmovdvs	%icc,	%f15,	%f6
	fabss	%f13,	%f15
	array16	%i4,	%g2,	%g1
	subcc	%l0,	0x19C6,	%o4
	fmul8ulx16	%f0,	%f2,	%f4
	udivcc	%g6,	0x1186,	%o0
	sdivcc	%i2,	0x1B09,	%l1
	fmovrsgz	%o1,	%f10,	%f15
	orcc	%o3,	0x0B7E,	%g7
	movvs	%xcc,	%l6,	%o5
	orncc	%l5,	0x0A24,	%o6
	udiv	%i0,	0x0459,	%o7
	addccc	%g5,	0x0BB4,	%i1
	fcmpgt32	%f14,	%f14,	%o2
	orcc	%g3,	%i3,	%l3
	mova	%icc,	%i6,	%g4
	umulcc	%i5,	0x0592,	%l2
	edge16n	%l4,	%i7,	%g2
	mova	%icc,	%i4,	%l0
	xnorcc	%o4,	%g6,	%o0
	fpack32	%f12,	%f12,	%f14
	edge16n	%g1,	%i2,	%o1
	xnor	%o3,	%l1,	%l6
	movrlez	%o5,	%g7,	%o6
	movneg	%icc,	%i0,	%o7
	array32	%g5,	%i1,	%o2
	movrlz	%g3,	%i3,	%l5
	movvc	%xcc,	%l3,	%i6
	addccc	%g4,	0x1A16,	%i5
	lduh	[%l7 + 0x7A],	%l2
	lduh	[%l7 + 0x4C],	%i7
	movn	%xcc,	%g2,	%i4
	fmuld8sux16	%f9,	%f14,	%f0
	stx	%l0,	[%l7 + 0x20]
	save %l4, 0x1C62, %g6
	fmovspos	%xcc,	%f14,	%f10
	movle	%icc,	%o0,	%g1
	udiv	%i2,	0x0873,	%o1
	sll	%o3,	%l1,	%l6
	edge16	%o4,	%g7,	%o5
	movle	%icc,	%i0,	%o7
	fnands	%f3,	%f0,	%f15
	edge16n	%o6,	%i1,	%g5
	movvc	%xcc,	%o2,	%i3
	fmovdvs	%xcc,	%f13,	%f6
	stb	%l5,	[%l7 + 0x51]
	restore %l3, %g3, %g4
	fmovsl	%icc,	%f12,	%f15
	addccc	%i5,	%i6,	%l2
	srlx	%i7,	0x11,	%g2
	sdiv	%l0,	0x046B,	%i4
	fmuld8sux16	%f15,	%f11,	%f2
	ldd	[%l7 + 0x30],	%f0
	xnor	%g6,	0x024C,	%l4
	edge32	%g1,	%i2,	%o1
	sethi	0x0AF2,	%o3
	movrlz	%o0,	0x3E9,	%l1
	udiv	%l6,	0x12E1,	%g7
	stx	%o5,	[%l7 + 0x38]
	movcs	%icc,	%o4,	%i0
	edge8n	%o6,	%o7,	%g5
	smul	%o2,	0x1E7C,	%i3
	fmovdn	%xcc,	%f8,	%f4
	restore %i1, %l5, %l3
	edge8n	%g3,	%g4,	%i6
	fmovrsgz	%l2,	%f5,	%f4
	sllx	%i5,	%g2,	%l0
	addc	%i7,	%i4,	%g6
	subccc	%l4,	%i2,	%g1
	umul	%o3,	0x0FAA,	%o1
	andncc	%l1,	%l6,	%g7
	ldd	[%l7 + 0x50],	%o4
	edge8l	%o4,	%i0,	%o0
	smul	%o7,	%o6,	%g5
	fmovdcs	%icc,	%f15,	%f15
	sra	%i3,	%i1,	%l5
	mova	%icc,	%o2,	%l3
	movpos	%xcc,	%g4,	%i6
	fmovdneg	%icc,	%f12,	%f2
	movge	%xcc,	%g3,	%i5
	fmovdg	%xcc,	%f6,	%f1
	edge32	%l2,	%l0,	%g2
	fnot1	%f2,	%f4
	sdivx	%i4,	0x177F,	%g6
	fmovsvc	%icc,	%f3,	%f9
	add	%i7,	0x0454,	%l4
	ldub	[%l7 + 0x6E],	%g1
	smulcc	%o3,	%i2,	%o1
	edge16n	%l6,	%l1,	%o5
	edge8ln	%g7,	%o4,	%o0
	ldub	[%l7 + 0x68],	%o7
	fcmpgt16	%f2,	%f12,	%o6
	fxors	%f6,	%f8,	%f13
	edge16ln	%i0,	%i3,	%i1
	save %g5, %l5, %l3
	edge16	%g4,	%o2,	%g3
	stx	%i6,	[%l7 + 0x60]
	ldx	[%l7 + 0x20],	%l2
	add	%i5,	%l0,	%g2
	fmovrslz	%i4,	%f14,	%f10
	fnot1	%f10,	%f10
	movrlz	%i7,	0x0AE,	%g6
	mova	%icc,	%g1,	%l4
	edge32	%o3,	%o1,	%l6
	move	%xcc,	%i2,	%l1
	fmovdne	%icc,	%f15,	%f7
	movrgez	%o5,	%g7,	%o4
	pdist	%f2,	%f0,	%f6
	addccc	%o7,	0x16F8,	%o0
	andn	%i0,	0x1AFF,	%i3
	movrlz	%o6,	0x2DA,	%g5
	xnor	%i1,	%l3,	%g4
	ldsw	[%l7 + 0x78],	%l5
	addccc	%g3,	0x1BAD,	%o2
	move	%icc,	%l2,	%i5
	movvs	%xcc,	%l0,	%i6
	fors	%f4,	%f5,	%f13
	smulcc	%i4,	0x00BC,	%i7
	fcmpd	%fcc2,	%f8,	%f2
	andn	%g6,	0x1A27,	%g1
	popc	%g2,	%l4
	andncc	%o1,	%o3,	%l6
	fmovsleu	%icc,	%f11,	%f12
	edge32ln	%i2,	%l1,	%g7
	movrlez	%o4,	0x206,	%o7
	ldd	[%l7 + 0x20],	%f14
	movne	%icc,	%o5,	%i0
	edge8n	%i3,	%o6,	%o0
	save %i1, 0x15D7, %g5
	xor	%g4,	%l5,	%l3
	movge	%xcc,	%o2,	%l2
	srl	%g3,	%i5,	%l0
	sra	%i6,	%i4,	%g6
	sethi	0x090F,	%i7
	movrlz	%g1,	0x3DC,	%g2
	ldub	[%l7 + 0x09],	%o1
	edge8ln	%o3,	%l6,	%l4
	umul	%l1,	0x0B53,	%i2
	edge32l	%g7,	%o4,	%o5
	sdiv	%i0,	0x0CE6,	%o7
	xnorcc	%o6,	0x0C1D,	%i3
	udivcc	%i1,	0x026A,	%g5
	ldd	[%l7 + 0x30],	%f12
	movrgz	%g4,	%o0,	%l3
	fxors	%f13,	%f12,	%f14
	fandnot1s	%f11,	%f15,	%f6
	sub	%l5,	%l2,	%g3
	edge32n	%o2,	%l0,	%i6
	movne	%icc,	%i5,	%g6
	fmovrde	%i4,	%f2,	%f2
	smul	%g1,	%i7,	%o1
	andncc	%o3,	%l6,	%g2
	movrgez	%l4,	0x214,	%i2
	movn	%xcc,	%g7,	%l1
	movg	%icc,	%o5,	%o4
	sub	%i0,	%o6,	%o7
	and	%i3,	%g5,	%i1
	movvc	%icc,	%o0,	%l3
	fmuld8sux16	%f8,	%f7,	%f2
	movrne	%g4,	%l5,	%l2
	edge8l	%o2,	%g3,	%l0
	xorcc	%i5,	%i6,	%i4
	array32	%g1,	%g6,	%i7
	smul	%o1,	0x1AA5,	%l6
	fandnot2	%f0,	%f6,	%f14
	srax	%o3,	0x0D,	%g2
	std	%f10,	[%l7 + 0x28]
	edge32ln	%l4,	%i2,	%l1
	fpadd16s	%f2,	%f3,	%f0
	save %o5, %g7, %i0
	movle	%xcc,	%o6,	%o7
	std	%f10,	[%l7 + 0x78]
	lduw	[%l7 + 0x0C],	%i3
	array32	%g5,	%o4,	%i1
	movpos	%icc,	%l3,	%o0
	mulscc	%g4,	0x1288,	%l2
	movvs	%xcc,	%l5,	%g3
	movgu	%xcc,	%l0,	%i5
	move	%xcc,	%i6,	%o2
	fsrc2	%f6,	%f10
	movleu	%icc,	%g1,	%i4
	mulx	%i7,	%g6,	%l6
	movpos	%icc,	%o3,	%o1
	movg	%icc,	%g2,	%l4
	smul	%l1,	0x002F,	%o5
	fnands	%f15,	%f4,	%f15
	fxnors	%f12,	%f9,	%f11
	movneg	%icc,	%i2,	%g7
	or	%i0,	%o6,	%o7
	movrlez	%i3,	%o4,	%g5
	movne	%xcc,	%l3,	%i1
	ldsh	[%l7 + 0x54],	%o0
	alignaddr	%g4,	%l5,	%g3
	or	%l2,	%i5,	%l0
	fpsub16s	%f11,	%f0,	%f1
	movg	%xcc,	%i6,	%o2
	addcc	%g1,	%i7,	%i4
	movrgez	%g6,	%o3,	%l6
	subc	%g2,	%l4,	%l1
	xor	%o5,	0x16B9,	%o1
	edge32n	%g7,	%i2,	%i0
	movcc	%xcc,	%o6,	%o7
	popc	0x058A,	%i3
	st	%f13,	[%l7 + 0x5C]
	edge8n	%g5,	%l3,	%i1
	save %o0, 0x1FB0, %g4
	fxors	%f14,	%f13,	%f15
	orcc	%o4,	0x1CDD,	%l5
	sdivcc	%l2,	0x0D0C,	%g3
	fmovrdgez	%i5,	%f10,	%f0
	movre	%i6,	%l0,	%g1
	edge8	%o2,	%i7,	%g6
	std	%f6,	[%l7 + 0x10]
	or	%i4,	%l6,	%g2
	fmovde	%icc,	%f5,	%f11
	fpack16	%f4,	%f5
	fnot2s	%f3,	%f6
	edge32l	%l4,	%l1,	%o3
	xor	%o5,	0x1720,	%g7
	fmovscc	%xcc,	%f13,	%f7
	stw	%i2,	[%l7 + 0x08]
	xnorcc	%i0,	%o1,	%o6
	udivcc	%o7,	0x136F,	%i3
	fmovsl	%icc,	%f6,	%f3
	edge8n	%l3,	%g5,	%o0
	fcmple32	%f12,	%f12,	%g4
	orn	%i1,	%o4,	%l2
	edge8n	%g3,	%i5,	%l5
	movl	%icc,	%i6,	%g1
	fnot1	%f4,	%f14
	edge8ln	%o2,	%l0,	%i7
	fzeros	%f15
	fmovrdne	%g6,	%f10,	%f10
	movgu	%xcc,	%i4,	%g2
	fandnot2s	%f13,	%f13,	%f9
	movcc	%icc,	%l6,	%l1
	movneg	%icc,	%l4,	%o5
	edge16	%o3,	%i2,	%g7
	st	%f10,	[%l7 + 0x50]
	add	%i0,	%o1,	%o7
	restore %o6, 0x104E, %i3
	movcc	%icc,	%l3,	%g5
	std	%f10,	[%l7 + 0x20]
	movge	%icc,	%g4,	%o0
	subccc	%i1,	%o4,	%g3
	fpackfix	%f6,	%f12
	edge32	%i5,	%l5,	%i6
	movl	%icc,	%g1,	%o2
	xorcc	%l2,	0x1D69,	%l0
	movleu	%icc,	%g6,	%i4
	movn	%xcc,	%i7,	%g2
	movneg	%xcc,	%l1,	%l6
	movg	%icc,	%l4,	%o3
	addc	%i2,	0x04E8,	%o5
	edge8n	%i0,	%g7,	%o7
	udiv	%o1,	0x038D,	%i3
	mulscc	%l3,	0x000A,	%o6
	fmovdvc	%xcc,	%f13,	%f4
	mova	%xcc,	%g4,	%o0
	array16	%g5,	%i1,	%o4
	fmovsleu	%icc,	%f13,	%f15
	ldd	[%l7 + 0x08],	%f6
	mova	%icc,	%i5,	%g3
	alignaddr	%i6,	%g1,	%o2
	stx	%l5,	[%l7 + 0x78]
	edge8n	%l0,	%l2,	%g6
	fmovsge	%icc,	%f11,	%f9
	movre	%i7,	%g2,	%i4
	fmovdne	%xcc,	%f14,	%f8
	ldx	[%l7 + 0x10],	%l1
	fmovsl	%xcc,	%f14,	%f10
	xor	%l6,	0x053D,	%o3
	orcc	%l4,	%o5,	%i2
	edge32	%g7,	%o7,	%o1
	xnorcc	%i3,	%l3,	%i0
	sll	%g4,	%o6,	%o0
	movrgz	%i1,	0x3A6,	%g5
	smul	%o4,	0x006C,	%i5
	ldsw	[%l7 + 0x3C],	%g3
	movvs	%xcc,	%g1,	%i6
	addcc	%o2,	%l5,	%l0
	movne	%icc,	%g6,	%i7
	movgu	%xcc,	%g2,	%l2
	add	%i4,	0x0A37,	%l1
	ldub	[%l7 + 0x4C],	%o3
	sra	%l6,	0x05,	%o5
	std	%f14,	[%l7 + 0x50]
	umul	%i2,	%g7,	%l4
	mulscc	%o1,	%o7,	%l3
	addccc	%i0,	0x0FBA,	%g4
	umul	%o6,	%i3,	%i1
	xor	%o0,	0x019E,	%g5
	ld	[%l7 + 0x7C],	%f1
	array16	%o4,	%g3,	%i5
	fmovdge	%icc,	%f15,	%f1
	ldx	[%l7 + 0x68],	%g1
	lduw	[%l7 + 0x6C],	%o2
	edge16n	%i6,	%l0,	%g6
	fmovde	%xcc,	%f14,	%f10
	alignaddrl	%l5,	%i7,	%g2
	movn	%xcc,	%l2,	%i4
	fmovdleu	%icc,	%f12,	%f6
	edge16l	%l1,	%o3,	%l6
	ldsb	[%l7 + 0x7A],	%o5
	ldsb	[%l7 + 0x12],	%g7
	alignaddr	%l4,	%i2,	%o7
	alignaddr	%o1,	%l3,	%g4
	fsrc2	%f14,	%f6
	movre	%i0,	%i3,	%i1
	stw	%o6,	[%l7 + 0x74]
	xorcc	%o0,	%o4,	%g3
	fmovdcc	%xcc,	%f3,	%f14
	ldub	[%l7 + 0x08],	%i5
	lduw	[%l7 + 0x68],	%g1
	andn	%o2,	%g5,	%l0
	ldd	[%l7 + 0x38],	%f4
	subccc	%i6,	0x0E88,	%g6
	sdiv	%i7,	0x09BD,	%g2
	movle	%xcc,	%l2,	%i4
	xor	%l5,	0x0A68,	%l1
	edge16	%o3,	%l6,	%o5
	orn	%l4,	0x038D,	%i2
	movl	%xcc,	%o7,	%g7
	edge16ln	%o1,	%g4,	%l3
	fnor	%f8,	%f6,	%f12
	for	%f8,	%f8,	%f10
	srl	%i0,	%i1,	%i3
	sra	%o6,	%o4,	%g3
	xnorcc	%i5,	%o0,	%g1
	xnorcc	%g5,	0x0261,	%o2
	move	%xcc,	%i6,	%g6
	sll	%l0,	%g2,	%l2
	udiv	%i4,	0x1C6C,	%l5
	stx	%i7,	[%l7 + 0x30]
	edge32l	%l1,	%l6,	%o5
	array8	%l4,	%i2,	%o7
	fors	%f13,	%f9,	%f15
	edge8ln	%g7,	%o3,	%g4
	smul	%l3,	0x081B,	%i0
	smul	%i1,	%o1,	%o6
	ldsb	[%l7 + 0x31],	%i3
	sethi	0x0451,	%o4
	orcc	%g3,	%o0,	%g1
	movvs	%icc,	%g5,	%i5
	array8	%i6,	%g6,	%o2
	movg	%icc,	%g2,	%l2
	edge32	%i4,	%l5,	%i7
	fmovrslz	%l0,	%f4,	%f3
	lduh	[%l7 + 0x72],	%l6
	edge32l	%l1,	%o5,	%l4
	fnegd	%f2,	%f10
	mulscc	%o7,	%g7,	%o3
	stb	%i2,	[%l7 + 0x6B]
	addccc	%l3,	%i0,	%g4
	orncc	%o1,	0x1C3A,	%i1
	array32	%o6,	%o4,	%g3
	xor	%i3,	%o0,	%g1
	fxors	%f2,	%f11,	%f0
	ldd	[%l7 + 0x08],	%g4
	mulx	%i5,	%i6,	%o2
	sdiv	%g6,	0x06B0,	%l2
	fpsub32	%f0,	%f10,	%f4
	udivcc	%g2,	0x0104,	%i4
	fmovdgu	%xcc,	%f1,	%f0
	movleu	%xcc,	%i7,	%l0
	movcs	%icc,	%l6,	%l1
	srl	%o5,	0x02,	%l4
	sdiv	%l5,	0x0086,	%g7
	movl	%icc,	%o7,	%o3
	edge16n	%i2,	%l3,	%i0
	fmovrdgez	%o1,	%f2,	%f4
	mova	%icc,	%i1,	%g4
	sethi	0x0EE2,	%o4
	sll	%o6,	%g3,	%o0
	xnorcc	%g1,	%g5,	%i5
	smul	%i6,	0x1AC8,	%o2
	subccc	%g6,	%l2,	%g2
	move	%xcc,	%i3,	%i4
	addccc	%i7,	0x1E71,	%l6
	movle	%icc,	%l1,	%o5
	fpadd32	%f0,	%f14,	%f2
	ldx	[%l7 + 0x30],	%l4
	stw	%l5,	[%l7 + 0x2C]
	fsrc2s	%f9,	%f12
	movpos	%xcc,	%l0,	%o7
	movgu	%xcc,	%o3,	%g7
	udiv	%i2,	0x0DA5,	%l3
	movpos	%xcc,	%o1,	%i0
	movvc	%icc,	%g4,	%o4
	popc	%o6,	%g3
	bshuffle	%f12,	%f14,	%f10
	move	%xcc,	%i1,	%g1
	xnorcc	%o0,	%i5,	%g5
	edge32l	%o2,	%i6,	%l2
	movge	%icc,	%g6,	%g2
	xnorcc	%i4,	0x1DC0,	%i7
	addc	%i3,	0x0772,	%l6
	alignaddr	%l1,	%l4,	%l5
	movl	%xcc,	%o5,	%l0
	edge16l	%o3,	%o7,	%i2
	restore %l3, %o1, %i0
	fmovdge	%xcc,	%f13,	%f12
	ld	[%l7 + 0x14],	%f6
	array16	%g7,	%o4,	%o6
	movrlz	%g3,	0x25C,	%g4
	sdivx	%g1,	0x14F7,	%i1
	mulx	%i5,	0x1E6B,	%o0
	srl	%o2,	0x16,	%g5
	movne	%xcc,	%l2,	%i6
	mova	%xcc,	%g6,	%g2
	fands	%f12,	%f12,	%f11
	movcc	%icc,	%i7,	%i4
	ldx	[%l7 + 0x58],	%i3
	movgu	%xcc,	%l1,	%l4
	fabss	%f10,	%f11
	add	%l5,	%o5,	%l6
	addc	%l0,	0x1F50,	%o7
	and	%o3,	0x1F72,	%l3
	smul	%o1,	%i2,	%i0
	st	%f1,	[%l7 + 0x2C]
	array16	%o4,	%o6,	%g3
	popc	%g4,	%g1
	mova	%xcc,	%g7,	%i5
	alignaddr	%o0,	%i1,	%g5
	fxnor	%f8,	%f8,	%f12
	movpos	%icc,	%o2,	%l2
	fones	%f13
	movpos	%icc,	%i6,	%g2
	sdivcc	%g6,	0x04FC,	%i4
	movl	%icc,	%i3,	%l1
	lduh	[%l7 + 0x48],	%i7
	fcmps	%fcc1,	%f13,	%f5
	sra	%l5,	%o5,	%l4
	fzero	%f8
	fmovsge	%xcc,	%f6,	%f10
	lduh	[%l7 + 0x38],	%l0
	fmovdcc	%xcc,	%f0,	%f12
	alignaddrl	%o7,	%l6,	%o3
	srlx	%o1,	0x1D,	%l3
	fmovdne	%icc,	%f13,	%f7
	addcc	%i2,	0x0882,	%i0
	fmovscc	%icc,	%f10,	%f10
	sdiv	%o4,	0x1ED1,	%o6
	xor	%g4,	0x1E6B,	%g1
	movneg	%icc,	%g7,	%g3
	ldsh	[%l7 + 0x72],	%i5
	fzero	%f14
	stx	%o0,	[%l7 + 0x30]
	edge32l	%i1,	%g5,	%o2
	alignaddrl	%i6,	%l2,	%g6
	movvs	%icc,	%i4,	%i3
	ldsb	[%l7 + 0x2E],	%g2
	sdivx	%i7,	0x0CBB,	%l1
	movleu	%xcc,	%o5,	%l4
	sth	%l5,	[%l7 + 0x10]
	fpadd32s	%f2,	%f4,	%f12
	fmovsgu	%xcc,	%f3,	%f6
	fxnors	%f11,	%f10,	%f1
	fmovspos	%xcc,	%f12,	%f12
	movrgz	%o7,	0x2BF,	%l0
	sub	%o3,	%l6,	%l3
	sdivx	%i2,	0x0830,	%o1
	fcmpeq32	%f10,	%f2,	%o4
	orcc	%o6,	%i0,	%g4
	edge8ln	%g1,	%g3,	%g7
	save %i5, 0x00A8, %o0
	sdiv	%g5,	0x0B91,	%o2
	ldsw	[%l7 + 0x4C],	%i1
	andcc	%l2,	0x02B2,	%g6
	ldx	[%l7 + 0x60],	%i4
	srl	%i6,	0x1A,	%g2
	sth	%i3,	[%l7 + 0x5C]
	udivcc	%l1,	0x12FC,	%o5
	sdiv	%l4,	0x1630,	%l5
	edge32l	%i7,	%o7,	%o3
	movle	%icc,	%l0,	%l3
	srl	%l6,	0x04,	%o1
	save %i2, %o6, %i0
	ldd	[%l7 + 0x40],	%f8
	edge32n	%g4,	%g1,	%g3
	orn	%g7,	%o4,	%o0
	ldsb	[%l7 + 0x2B],	%g5
	pdist	%f2,	%f2,	%f0
	stx	%o2,	[%l7 + 0x70]
	ldsh	[%l7 + 0x46],	%i5
	movcc	%icc,	%i1,	%l2
	orcc	%g6,	0x1857,	%i4
	popc	%g2,	%i3
	ldsb	[%l7 + 0x76],	%i6
	edge8ln	%o5,	%l1,	%l4
	movrlz	%i7,	0x109,	%o7
	movpos	%xcc,	%o3,	%l5
	array8	%l0,	%l6,	%o1
	array16	%i2,	%o6,	%i0
	fcmpes	%fcc2,	%f5,	%f9
	stx	%l3,	[%l7 + 0x40]
	smulcc	%g4,	%g1,	%g3
	fmovdne	%icc,	%f4,	%f1
	movn	%icc,	%o4,	%o0
	movrlz	%g7,	%o2,	%i5
	orn	%g5,	0x0F50,	%i1
	movrgz	%g6,	0x04B,	%l2
	edge32ln	%g2,	%i3,	%i4
	movn	%xcc,	%o5,	%l1
	movpos	%icc,	%i6,	%l4
	lduh	[%l7 + 0x7C],	%i7
	orcc	%o7,	0x0C16,	%l5
	fpack32	%f4,	%f2,	%f14
	sdiv	%l0,	0x18C4,	%l6
	edge32l	%o1,	%i2,	%o6
	movcs	%icc,	%i0,	%o3
	edge8	%l3,	%g4,	%g3
	edge8	%g1,	%o4,	%o0
	fmovsl	%icc,	%f2,	%f7
	movge	%icc,	%o2,	%g7
	std	%f8,	[%l7 + 0x68]
	fpackfix	%f6,	%f9
	fcmpne16	%f6,	%f6,	%i5
	fcmps	%fcc1,	%f1,	%f13
	restore %g5, %g6, %i1
	sra	%g2,	%l2,	%i4
	mulscc	%i3,	0x0DD0,	%o5
	addcc	%l1,	%i6,	%i7
	stw	%l4,	[%l7 + 0x30]
	stw	%o7,	[%l7 + 0x70]
	fandnot2s	%f9,	%f7,	%f5
	st	%f2,	[%l7 + 0x38]
	ldub	[%l7 + 0x47],	%l5
	fmovdvs	%xcc,	%f6,	%f2
	movre	%l0,	%l6,	%o1
	movleu	%icc,	%i2,	%i0
	fnand	%f8,	%f8,	%f0
	fcmple32	%f6,	%f6,	%o6
	edge16l	%o3,	%l3,	%g4
	fornot1	%f8,	%f4,	%f10
	movrgz	%g1,	0x113,	%g3
	ld	[%l7 + 0x50],	%f3
	movvc	%xcc,	%o4,	%o2
	movvs	%icc,	%o0,	%g7
	stw	%g5,	[%l7 + 0x2C]
	fcmped	%fcc2,	%f2,	%f0
	ldd	[%l7 + 0x30],	%g6
	sth	%i1,	[%l7 + 0x3E]
	andcc	%i5,	%g2,	%i4
	alignaddr	%i3,	%o5,	%l2
	fsrc1	%f6,	%f4
	array16	%i6,	%i7,	%l4
	edge16l	%o7,	%l1,	%l5
	lduh	[%l7 + 0x50],	%l0
	movpos	%icc,	%l6,	%i2
	fmovrdgz	%i0,	%f4,	%f4
	edge32n	%o1,	%o3,	%l3
	srlx	%o6,	0x05,	%g1
	bshuffle	%f10,	%f14,	%f4
	movcs	%xcc,	%g3,	%o4
	move	%xcc,	%g4,	%o2
	lduh	[%l7 + 0x18],	%o0
	movrlz	%g7,	%g6,	%i1
	lduh	[%l7 + 0x4E],	%i5
	fnegd	%f4,	%f4
	fnands	%f3,	%f10,	%f13
	std	%f8,	[%l7 + 0x58]
	xorcc	%g5,	%g2,	%i3
	or	%o5,	%l2,	%i4
	std	%f8,	[%l7 + 0x48]
	smulcc	%i6,	0x1601,	%l4
	stx	%i7,	[%l7 + 0x60]
	std	%f4,	[%l7 + 0x38]
	movrgz	%l1,	0x00B,	%l5
	stw	%o7,	[%l7 + 0x64]
	fpsub32s	%f14,	%f15,	%f2
	andn	%l0,	0x1DDE,	%l6
	fnot1	%f8,	%f2
	fmovdge	%icc,	%f3,	%f0
	sllx	%i2,	%i0,	%o1
	srlx	%o3,	%o6,	%g1
	movg	%xcc,	%g3,	%l3
	xnorcc	%o4,	%g4,	%o2
	move	%xcc,	%g7,	%g6
	addccc	%o0,	%i5,	%i1
	movrlez	%g5,	%g2,	%o5
	smul	%i3,	0x1249,	%l2
	edge16ln	%i6,	%l4,	%i7
	movre	%l1,	%l5,	%i4
	fpsub16s	%f1,	%f2,	%f6
	xor	%l0,	0x1892,	%o7
	fmul8x16al	%f7,	%f11,	%f2
	fmul8x16	%f14,	%f6,	%f14
	sub	%i2,	%l6,	%o1
	orn	%i0,	0x1FE7,	%o3
	movrgez	%o6,	0x3E7,	%g3
	ldsw	[%l7 + 0x0C],	%l3
	ldsb	[%l7 + 0x56],	%g1
	lduw	[%l7 + 0x7C],	%o4
	restore %o2, 0x0C32, %g7
	addc	%g4,	0x1440,	%o0
	edge16ln	%i5,	%g6,	%g5
	movneg	%icc,	%i1,	%o5
	edge16ln	%g2,	%l2,	%i6
	sth	%l4,	[%l7 + 0x7C]
	sub	%i3,	%l1,	%l5
	ldsb	[%l7 + 0x5A],	%i7
	fsrc1s	%f2,	%f2
	fandnot1s	%f5,	%f6,	%f10
	lduw	[%l7 + 0x70],	%l0
	fcmple32	%f0,	%f0,	%i4
	movcs	%xcc,	%o7,	%i2
	stw	%l6,	[%l7 + 0x40]
	sethi	0x14FF,	%i0
	ldsw	[%l7 + 0x6C],	%o3
	edge32ln	%o6,	%o1,	%g3
	fmovse	%xcc,	%f10,	%f11
	subccc	%l3,	0x1ECE,	%g1
	fnegs	%f6,	%f3
	subc	%o2,	%g7,	%g4
	st	%f11,	[%l7 + 0x20]
	fmovrdgez	%o4,	%f0,	%f2
	save %i5, 0x0CB7, %o0
	edge8ln	%g6,	%g5,	%o5
	movle	%xcc,	%i1,	%g2
	andncc	%l2,	%l4,	%i3
	restore %l1, 0x02AE, %i6
	edge8n	%l5,	%l0,	%i7
	fpsub32	%f4,	%f2,	%f6
	movvs	%icc,	%o7,	%i2
	udivcc	%l6,	0x05DC,	%i4
	for	%f2,	%f4,	%f4
	movl	%xcc,	%i0,	%o3
	fcmpd	%fcc1,	%f14,	%f8
	fmovrsgz	%o1,	%f6,	%f1
	sub	%g3,	0x1766,	%l3
	xnorcc	%o6,	%g1,	%o2
	movcs	%icc,	%g4,	%g7
	array32	%o4,	%i5,	%o0
	edge16n	%g6,	%g5,	%o5
	edge16	%g2,	%i1,	%l4
	movle	%xcc,	%i3,	%l2
	fmovdvs	%icc,	%f0,	%f7
	fmovscc	%xcc,	%f12,	%f2
	lduw	[%l7 + 0x3C],	%l1
	ldx	[%l7 + 0x38],	%l5
	lduw	[%l7 + 0x70],	%i6
	sth	%i7,	[%l7 + 0x56]
	siam	0x6
	add	%l0,	0x0370,	%o7
	sub	%i2,	0x0EA9,	%l6
	fcmple16	%f0,	%f2,	%i0
	fmovrde	%o3,	%f6,	%f0
	sdivcc	%o1,	0x0A11,	%i4
	ldd	[%l7 + 0x28],	%l2
	movcc	%icc,	%o6,	%g1
	fmul8sux16	%f12,	%f0,	%f14
	udivx	%o2,	0x07D5,	%g4
	array16	%g7,	%g3,	%i5
	movn	%xcc,	%o4,	%o0
	fzeros	%f6
	st	%f6,	[%l7 + 0x24]
	edge8ln	%g5,	%g6,	%o5
	ldsh	[%l7 + 0x48],	%i1
	std	%f4,	[%l7 + 0x08]
	edge16l	%l4,	%g2,	%i3
	edge8ln	%l1,	%l2,	%i6
	fones	%f5
	movge	%xcc,	%i7,	%l5
	ldd	[%l7 + 0x70],	%f10
	andn	%o7,	%l0,	%l6
	edge32ln	%i2,	%o3,	%i0
	fxor	%f10,	%f0,	%f4
	std	%f0,	[%l7 + 0x68]
	movrlez	%o1,	0x359,	%i4
	fcmpes	%fcc0,	%f2,	%f1
	movn	%xcc,	%o6,	%g1
	fexpand	%f12,	%f8
	fmovsvs	%icc,	%f5,	%f9
	movpos	%icc,	%l3,	%g4
	andn	%o2,	%g3,	%g7
	fmul8sux16	%f6,	%f6,	%f4
	fmovsa	%icc,	%f7,	%f4
	st	%f5,	[%l7 + 0x0C]
	subc	%i5,	0x095A,	%o0
	movrlez	%g5,	0x3C8,	%o4
	edge8l	%g6,	%o5,	%i1
	fmovsneg	%icc,	%f14,	%f5
	edge16	%g2,	%i3,	%l1
	fmovsgu	%icc,	%f4,	%f14
	orcc	%l2,	%i6,	%i7
	movg	%icc,	%l4,	%l5
	addc	%o7,	0x0CA1,	%l6
	array32	%i2,	%l0,	%o3
	lduw	[%l7 + 0x6C],	%i0
	smulcc	%i4,	%o1,	%o6
	array8	%l3,	%g4,	%o2
	popc	0x0566,	%g1
	fmovdle	%icc,	%f9,	%f11
	andncc	%g7,	%g3,	%i5
	movgu	%icc,	%o0,	%g5
	movre	%g6,	%o4,	%i1
	ld	[%l7 + 0x20],	%f14
	mulscc	%g2,	%i3,	%o5
	fpadd32s	%f1,	%f7,	%f4
	fxnor	%f2,	%f8,	%f0
	fcmple16	%f4,	%f6,	%l1
	movg	%xcc,	%l2,	%i7
	subc	%i6,	%l5,	%o7
	fmuld8ulx16	%f3,	%f10,	%f8
	sethi	0x0A73,	%l6
	sllx	%l4,	%l0,	%i2
	sethi	0x1BD5,	%o3
	fmovrslz	%i4,	%f10,	%f12
	stw	%i0,	[%l7 + 0x64]
	ldsw	[%l7 + 0x3C],	%o6
	fmovsvs	%xcc,	%f8,	%f13
	fmovdpos	%xcc,	%f7,	%f8
	ldd	[%l7 + 0x78],	%f2
	fmul8x16al	%f12,	%f1,	%f2
	subccc	%o1,	0x13C2,	%g4
	or	%o2,	0x098F,	%l3
	ldx	[%l7 + 0x50],	%g1
	fnegd	%f0,	%f2
	fmovrse	%g7,	%f10,	%f8
	popc	0x00BB,	%i5
	ldx	[%l7 + 0x10],	%g3
	movleu	%icc,	%g5,	%g6
	movne	%xcc,	%o0,	%o4
	srl	%i1,	%g2,	%o5
	smulcc	%i3,	0x17AF,	%l1
	fand	%f8,	%f0,	%f2
	edge8n	%l2,	%i7,	%i6
	sra	%o7,	%l6,	%l4
	xorcc	%l5,	%i2,	%o3
	xnor	%i4,	0x1EF4,	%i0
	or	%l0,	%o6,	%o1
	fmovrsgez	%g4,	%f13,	%f6
	edge8n	%l3,	%o2,	%g7
	fpadd32s	%f11,	%f11,	%f2
	umul	%g1,	0x0335,	%i5
	fmovsl	%xcc,	%f6,	%f8
	save %g3, 0x0532, %g6
	alignaddrl	%g5,	%o4,	%i1
	edge32n	%o0,	%g2,	%i3
	fmovsge	%xcc,	%f5,	%f8
	addcc	%l1,	%l2,	%i7
	movrgz	%i6,	%o7,	%l6
	andn	%l4,	%o5,	%i2
	sra	%o3,	%i4,	%i0
	movpos	%xcc,	%l0,	%l5
	sll	%o1,	0x0A,	%g4
	std	%f2,	[%l7 + 0x60]
	sra	%o6,	%o2,	%l3
	edge8l	%g7,	%i5,	%g1
	fnot2	%f10,	%f10
	movvc	%icc,	%g6,	%g3
	fpsub32	%f14,	%f12,	%f4
	fmuld8sux16	%f7,	%f11,	%f2
	andncc	%o4,	%i1,	%o0
	edge32n	%g2,	%i3,	%g5
	mulx	%l2,	%i7,	%l1
	sdiv	%o7,	0x1F9F,	%i6
	fcmped	%fcc3,	%f12,	%f4
	movre	%l4,	0x26D,	%o5
	andcc	%l6,	0x055D,	%i2
	fornot1s	%f14,	%f9,	%f11
	fmul8ulx16	%f6,	%f2,	%f2
	sllx	%i4,	%o3,	%i0
	fxors	%f15,	%f3,	%f15
	mulscc	%l0,	0x01FD,	%o1
	fmovsa	%xcc,	%f12,	%f0
	fmovs	%f11,	%f1
	stx	%g4,	[%l7 + 0x18]
	orncc	%l5,	%o6,	%o2
	fmovrsgz	%l3,	%f2,	%f10
	edge16	%i5,	%g1,	%g7
	edge8ln	%g3,	%g6,	%i1
	fandnot2	%f6,	%f10,	%f2
	xnor	%o0,	0x0632,	%g2
	ldsb	[%l7 + 0x0C],	%o4
	ldx	[%l7 + 0x18],	%g5
	fpmerge	%f7,	%f10,	%f4
	sdivcc	%i3,	0x0836,	%l2
	stx	%l1,	[%l7 + 0x08]
	lduh	[%l7 + 0x38],	%i7
	mova	%icc,	%i6,	%o7
	movneg	%icc,	%o5,	%l6
	subc	%i2,	%i4,	%o3
	movne	%xcc,	%l4,	%i0
	movg	%xcc,	%l0,	%g4
	umulcc	%o1,	%l5,	%o2
	restore %l3, %i5, %o6
	subcc	%g1,	0x1C22,	%g3
	mulscc	%g6,	0x11BA,	%g7
	popc	%o0,	%g2
	array8	%o4,	%i1,	%g5
	fmovsa	%icc,	%f0,	%f1
	save %l2, 0x1191, %i3
	fzeros	%f9
	or	%l1,	%i7,	%o7
	movre	%o5,	%l6,	%i2
	fpadd32s	%f3,	%f0,	%f2
	subc	%i6,	0x0F07,	%i4
	ldx	[%l7 + 0x68],	%o3
	fones	%f1
	popc	%i0,	%l4
	orcc	%g4,	%l0,	%l5
	stw	%o1,	[%l7 + 0x44]
	umulcc	%l3,	%i5,	%o2
	edge8l	%g1,	%g3,	%o6
	smul	%g7,	%o0,	%g6
	fxor	%f12,	%f12,	%f4
	stx	%o4,	[%l7 + 0x28]
	ldsb	[%l7 + 0x6E],	%i1
	edge32n	%g5,	%g2,	%i3
	sth	%l2,	[%l7 + 0x64]
	sll	%i7,	0x16,	%l1
	movvs	%xcc,	%o7,	%l6
	fnors	%f12,	%f1,	%f0
	srl	%i2,	0x0A,	%o5
	stb	%i6,	[%l7 + 0x5B]
	fpsub16s	%f14,	%f11,	%f8
	restore %o3, %i0, %i4
	movne	%xcc,	%g4,	%l0
	udiv	%l4,	0x15E0,	%o1
	xorcc	%l3,	%i5,	%o2
	orncc	%g1,	0x066F,	%l5
	std	%f8,	[%l7 + 0x48]
	fmul8x16au	%f6,	%f11,	%f8
	movvc	%xcc,	%o6,	%g3
	subcc	%g7,	0x1CB1,	%o0
	srl	%o4,	0x10,	%g6
	edge32l	%g5,	%i1,	%g2
	save %i3, %i7, %l2
	andn	%l1,	%l6,	%i2
	alignaddrl	%o5,	%i6,	%o3
	edge32	%i0,	%i4,	%o7
	fmovsleu	%icc,	%f3,	%f11
	movg	%xcc,	%g4,	%l4
	fmovsvc	%icc,	%f0,	%f6
	stb	%l0,	[%l7 + 0x6A]
	edge32ln	%l3,	%i5,	%o2
	movl	%xcc,	%o1,	%l5
	fmovdgu	%xcc,	%f14,	%f7
	movrlez	%g1,	%o6,	%g7
	smulcc	%g3,	%o4,	%g6
	movvc	%xcc,	%g5,	%i1
	fmovsgu	%icc,	%f15,	%f12
	edge32n	%g2,	%o0,	%i7
	edge16	%l2,	%l1,	%l6
	mulx	%i3,	%i2,	%i6
	fsrc1	%f10,	%f10
	fandnot1s	%f2,	%f15,	%f6
	subcc	%o3,	0x0326,	%i0
	sub	%o5,	%i4,	%g4
	edge32n	%l4,	%o7,	%l0
	fmul8ulx16	%f6,	%f10,	%f8
	ldsh	[%l7 + 0x3E],	%i5
	ldd	[%l7 + 0x78],	%f10
	fmul8sux16	%f14,	%f12,	%f8
	ldsw	[%l7 + 0x18],	%o2
	umulcc	%o1,	0x1E6E,	%l5
	lduw	[%l7 + 0x6C],	%l3
	fcmple32	%f14,	%f8,	%g1
	movn	%icc,	%o6,	%g3
	fpsub16s	%f8,	%f1,	%f0
	edge16l	%o4,	%g7,	%g6
	edge32ln	%i1,	%g5,	%o0
	fmovscs	%xcc,	%f7,	%f8
	smul	%g2,	%l2,	%l1
	sll	%l6,	%i3,	%i7
	move	%xcc,	%i2,	%i6
	movgu	%xcc,	%o3,	%o5
	ldd	[%l7 + 0x58],	%i4
	andn	%i0,	0x0517,	%g4
	array16	%l4,	%o7,	%l0
	fnands	%f13,	%f7,	%f14
	sub	%i5,	0x02BA,	%o2
	sth	%l5,	[%l7 + 0x44]
	orncc	%o1,	%l3,	%o6
	xorcc	%g3,	%g1,	%g7
	array32	%o4,	%g6,	%g5
	addc	%i1,	%o0,	%l2
	fmovsa	%icc,	%f13,	%f0
	fsrc2s	%f10,	%f0
	movpos	%xcc,	%l1,	%g2
	fornot2s	%f1,	%f5,	%f2
	movrlez	%i3,	%l6,	%i2
	orn	%i7,	0x079B,	%i6
	andncc	%o3,	%i4,	%i0
	stb	%o5,	[%l7 + 0x20]
	ldd	[%l7 + 0x40],	%f0
	ldx	[%l7 + 0x70],	%l4
	fone	%f12
	fmovd	%f8,	%f12
	add	%o7,	%l0,	%g4
	fpack16	%f0,	%f8
	andncc	%o2,	%i5,	%o1
	movg	%icc,	%l3,	%o6
	or	%l5,	%g1,	%g7
	edge8l	%g3,	%o4,	%g5
	or	%i1,	0x1D61,	%o0
	edge32	%g6,	%l2,	%l1
	movvc	%xcc,	%i3,	%l6
	fpsub16	%f10,	%f4,	%f8
	movcc	%xcc,	%g2,	%i7
	orn	%i2,	%i6,	%i4
	edge32l	%o3,	%i0,	%l4
	alignaddrl	%o7,	%o5,	%g4
	addcc	%l0,	0x1420,	%o2
	array16	%o1,	%i5,	%l3
	ldd	[%l7 + 0x68],	%f10
	fmovrdlz	%o6,	%f6,	%f4
	sdivcc	%l5,	0x0078,	%g7
	siam	0x3
	alignaddr	%g1,	%g3,	%o4
	movne	%xcc,	%g5,	%o0
	alignaddrl	%g6,	%l2,	%i1
	stb	%i3,	[%l7 + 0x6D]
	popc	0x0DB7,	%l6
	fmovdleu	%icc,	%f3,	%f12
	stx	%l1,	[%l7 + 0x68]
	fmovrdlz	%i7,	%f2,	%f4
	fpadd16s	%f6,	%f13,	%f4
	xorcc	%g2,	%i6,	%i2
	fmovsgu	%xcc,	%f11,	%f12
	xnorcc	%i4,	0x0C94,	%o3
	xnor	%i0,	%o7,	%l4
	move	%icc,	%o5,	%l0
	movl	%icc,	%o2,	%o1
	restore %i5, %l3, %g4
	sdiv	%o6,	0x1A52,	%g7
	array8	%g1,	%g3,	%l5
	fornot1s	%f0,	%f9,	%f9
	addcc	%o4,	%g5,	%g6
	array8	%l2,	%i1,	%o0
	movrlez	%i3,	%l6,	%l1
	ldsb	[%l7 + 0x6D],	%i7
	movvc	%xcc,	%g2,	%i2
	fmovsn	%icc,	%f0,	%f12
	fmovd	%f0,	%f8
	fzeros	%f3
	udiv	%i6,	0x1820,	%i4
	xnorcc	%o3,	%i0,	%o7
	fmovse	%xcc,	%f14,	%f5
	fandnot2	%f4,	%f6,	%f6
	alignaddr	%l4,	%o5,	%l0
	fmovrsgez	%o2,	%f1,	%f6
	stb	%o1,	[%l7 + 0x11]
	fmovrslz	%i5,	%f9,	%f2
	popc	0x0EE8,	%l3
	sllx	%g4,	0x0C,	%g7
	edge8l	%g1,	%g3,	%l5
	xor	%o6,	%o4,	%g6
	std	%f0,	[%l7 + 0x30]
	array32	%g5,	%l2,	%o0
	movl	%xcc,	%i1,	%l6
	array8	%l1,	%i7,	%g2
	edge8n	%i2,	%i6,	%i4
	movvs	%icc,	%i3,	%o3
	lduh	[%l7 + 0x78],	%o7
	movleu	%xcc,	%i0,	%o5
	sdivx	%l4,	0x19AD,	%l0
	sethi	0x005C,	%o1
	fcmpne32	%f14,	%f6,	%i5
	fandnot2	%f2,	%f4,	%f12
	fcmpeq32	%f10,	%f6,	%l3
	ldd	[%l7 + 0x68],	%f10
	sra	%g4,	0x1D,	%o2
	mulx	%g7,	0x0330,	%g1
	sdiv	%l5,	0x1B87,	%o6
	umul	%o4,	0x1F22,	%g6
	orcc	%g3,	0x1CBC,	%g5
	ldsh	[%l7 + 0x46],	%o0
	fones	%f11
	movgu	%icc,	%l2,	%l6
	orncc	%i1,	0x18B9,	%i7
	movgu	%xcc,	%l1,	%i2
	stb	%i6,	[%l7 + 0x69]
	umulcc	%g2,	0x18FA,	%i3
	array16	%i4,	%o7,	%o3
	addcc	%i0,	0x04EE,	%l4
	movneg	%xcc,	%o5,	%l0
	movre	%i5,	0x291,	%o1
	srl	%l3,	%o2,	%g7
	movne	%xcc,	%g4,	%g1
	movrgez	%l5,	%o6,	%g6
	orncc	%g3,	%o4,	%o0
	movrgz	%l2,	0x178,	%g5
	movvc	%icc,	%l6,	%i7
	fpadd16	%f10,	%f4,	%f0
	popc	%l1,	%i1
	udivx	%i6,	0x0556,	%g2
	edge32	%i2,	%i4,	%o7
	umulcc	%i3,	0x0C1B,	%i0
	fmovsne	%xcc,	%f2,	%f2
	fsrc2s	%f4,	%f9
	movn	%icc,	%o3,	%l4
	fpsub32	%f8,	%f6,	%f0
	edge8l	%l0,	%i5,	%o5
	movcc	%icc,	%o1,	%o2
	movcs	%xcc,	%l3,	%g4
	smul	%g7,	0x0151,	%g1
	movrlez	%o6,	0x126,	%l5
	array32	%g3,	%g6,	%o0
	stb	%l2,	[%l7 + 0x7B]
	movle	%xcc,	%g5,	%l6
	ldd	[%l7 + 0x10],	%f8
	edge32	%o4,	%l1,	%i1
	fsrc1s	%f10,	%f1
	stb	%i6,	[%l7 + 0x2E]
	xor	%i7,	%g2,	%i4
	fmovrslez	%i2,	%f14,	%f1
	fmul8ulx16	%f6,	%f4,	%f6
	fmovrde	%o7,	%f0,	%f12
	umul	%i3,	%i0,	%l4
	ldd	[%l7 + 0x30],	%f10
	array8	%l0,	%o3,	%o5
	restore %i5, %o1, %l3
	ldsh	[%l7 + 0x22],	%o2
	orn	%g7,	%g4,	%o6
	edge8	%l5,	%g1,	%g6
	mova	%icc,	%o0,	%l2
	udivcc	%g3,	0x022A,	%l6
	fcmpne16	%f14,	%f4,	%o4
	udivcc	%g5,	0x1345,	%i1
	movle	%xcc,	%i6,	%i7
	edge16	%g2,	%i4,	%l1
	xnorcc	%i2,	0x0885,	%i3
	popc	0x0811,	%i0
	edge32ln	%l4,	%o7,	%o3
	movne	%icc,	%l0,	%o5
	subccc	%o1,	0x060B,	%l3
	sub	%i5,	0x1A8B,	%o2
	std	%f6,	[%l7 + 0x08]
	edge32	%g7,	%o6,	%l5
	orcc	%g1,	0x009A,	%g4
	fmovrsgz	%o0,	%f12,	%f11
	sdiv	%l2,	0x02B9,	%g6
	ldsb	[%l7 + 0x76],	%g3
	ldx	[%l7 + 0x28],	%l6
	movneg	%xcc,	%o4,	%i1
	array32	%i6,	%g5,	%i7
	orn	%g2,	%i4,	%i2
	movvc	%icc,	%i3,	%l1
	ldd	[%l7 + 0x38],	%f0
	movvc	%xcc,	%l4,	%o7
	edge16	%i0,	%o3,	%l0
	fpsub32	%f12,	%f4,	%f12
	movre	%o1,	%o5,	%l3
	stw	%o2,	[%l7 + 0x40]
	umul	%g7,	%o6,	%i5
	xnor	%g1,	%g4,	%l5
	movgu	%xcc,	%o0,	%g6
	fmul8ulx16	%f4,	%f8,	%f4
	fands	%f4,	%f11,	%f2
	popc	%g3,	%l6
	srl	%l2,	0x10,	%o4
	xorcc	%i1,	%g5,	%i7
	popc	%i6,	%i4
	st	%f4,	[%l7 + 0x2C]
	srax	%i2,	0x0D,	%i3
	fmul8x16au	%f12,	%f14,	%f2
	fxor	%f4,	%f8,	%f12
	udiv	%g2,	0x14BA,	%l1
	lduh	[%l7 + 0x72],	%l4
	movle	%icc,	%o7,	%i0
	fmovdle	%icc,	%f2,	%f0
	fnot2s	%f3,	%f12
	array16	%o3,	%o1,	%o5
	edge32n	%l3,	%o2,	%g7
	movleu	%xcc,	%o6,	%i5
	fmovsleu	%xcc,	%f8,	%f15
	ldd	[%l7 + 0x68],	%l0
	siam	0x4
	srlx	%g1,	%g4,	%o0
	sll	%g6,	0x12,	%g3
	and	%l5,	%l2,	%l6
	srl	%o4,	0x09,	%g5
	st	%f4,	[%l7 + 0x74]
	movcc	%xcc,	%i7,	%i1
	addcc	%i4,	0x1E36,	%i6
	fnegd	%f4,	%f0
	movre	%i2,	%i3,	%l1
	ldd	[%l7 + 0x70],	%l4
	add	%g2,	%i0,	%o7
	movneg	%xcc,	%o3,	%o1
	fmovrsgez	%l3,	%f0,	%f0
	sdivcc	%o5,	0x1AD3,	%o2
	alignaddrl	%o6,	%g7,	%i5
	edge8ln	%g1,	%g4,	%l0
	smulcc	%o0,	%g6,	%l5
	edge16	%l2,	%l6,	%o4
	andncc	%g3,	%g5,	%i1
	movg	%icc,	%i4,	%i7
	edge16ln	%i6,	%i2,	%l1
	orncc	%l4,	%i3,	%i0
	mulx	%g2,	%o7,	%o3
	fornot2s	%f1,	%f8,	%f15
	orcc	%o1,	0x1817,	%o5
	umul	%o2,	0x0034,	%l3
	edge32l	%o6,	%i5,	%g7
	movrgz	%g4,	0x330,	%g1
	array32	%o0,	%l0,	%l5
	movne	%icc,	%g6,	%l2
	movn	%xcc,	%l6,	%g3
	ldx	[%l7 + 0x20],	%g5
	sra	%i1,	%i4,	%i7
	orcc	%o4,	%i6,	%l1
	edge8n	%l4,	%i2,	%i0
	fmovsneg	%xcc,	%f6,	%f5
	ldd	[%l7 + 0x18],	%i2
	addc	%o7,	0x14A8,	%g2
	fnot1s	%f15,	%f6
	lduw	[%l7 + 0x5C],	%o3
	mulscc	%o5,	%o1,	%l3
	fmovd	%f10,	%f8
	fmovrdne	%o6,	%f10,	%f10
	edge16	%i5,	%g7,	%g4
	popc	%g1,	%o0
	popc	%l0,	%l5
	ldsb	[%l7 + 0x48],	%g6
	alignaddrl	%o2,	%l2,	%l6
	movrne	%g5,	%g3,	%i1
	orn	%i7,	%o4,	%i4
	fzero	%f10
	andncc	%i6,	%l1,	%l4
	edge16n	%i0,	%i3,	%i2
	subc	%g2,	0x0FA0,	%o3
	movge	%xcc,	%o5,	%o1
	array32	%l3,	%o7,	%i5
	edge8ln	%g7,	%o6,	%g1
	addccc	%o0,	0x01D8,	%g4
	sra	%l0,	%g6,	%l5
	sdiv	%o2,	0x13A9,	%l6
	sll	%l2,	0x18,	%g5
	movrlez	%i1,	0x283,	%i7
	fmovs	%f15,	%f9
	fmovrdgez	%g3,	%f6,	%f2
	srl	%o4,	%i6,	%i4
	fnor	%f8,	%f8,	%f14
	mova	%xcc,	%l4,	%i0
	add	%l1,	%i2,	%i3
	fmuld8ulx16	%f10,	%f12,	%f0
	fmovsvc	%icc,	%f7,	%f12
	edge32l	%g2,	%o5,	%o3
	faligndata	%f10,	%f10,	%f6
	fandnot2	%f6,	%f10,	%f4
	movne	%icc,	%o1,	%l3
	addcc	%o7,	%g7,	%o6
	fmul8sux16	%f6,	%f10,	%f8
	ldd	[%l7 + 0x28],	%f10
	array8	%i5,	%g1,	%g4
	edge32ln	%o0,	%g6,	%l0
	fmovrdgez	%l5,	%f6,	%f2
	fxnor	%f6,	%f12,	%f14
	movneg	%icc,	%l6,	%l2
	edge32l	%g5,	%o2,	%i1
	mulscc	%g3,	0x1E76,	%o4
	movle	%xcc,	%i7,	%i4
	sllx	%i6,	%i0,	%l1
	mulx	%i2,	0x18FF,	%l4
	edge8n	%i3,	%g2,	%o3
	fmovrslz	%o1,	%f10,	%f2
	fmovrslez	%o5,	%f12,	%f9
	sra	%l3,	0x17,	%o7
	xnorcc	%g7,	%o6,	%i5
	andncc	%g1,	%o0,	%g4
	fandnot2	%f10,	%f14,	%f14
	edge16n	%l0,	%g6,	%l5
	fcmpgt16	%f12,	%f6,	%l2
	sll	%l6,	0x1B,	%o2
	orn	%i1,	0x049A,	%g3
	movrlez	%o4,	%i7,	%i4
	movrgz	%i6,	0x3F8,	%i0
	orcc	%l1,	0x17EB,	%g5
	smulcc	%l4,	%i2,	%i3
	add	%g2,	%o3,	%o5
	movle	%icc,	%l3,	%o7
	subccc	%g7,	0x1B3D,	%o6
	stx	%i5,	[%l7 + 0x58]
	movrlez	%o1,	0x281,	%o0
	xnorcc	%g1,	0x1D1F,	%g4
	movneg	%xcc,	%g6,	%l0
	movcs	%xcc,	%l5,	%l6
	fmovrslz	%l2,	%f3,	%f8
	restore %i1, 0x03F1, %o2
	array8	%g3,	%o4,	%i7
	sdivcc	%i4,	0x0EAC,	%i6
	fnot2	%f0,	%f2
	edge8ln	%l1,	%g5,	%i0
	subc	%l4,	0x1A1E,	%i3
	ldd	[%l7 + 0x58],	%f6
	edge8	%i2,	%o3,	%o5
	restore %l3, 0x1CC8, %g2
	sdiv	%g7,	0x0600,	%o6
	fcmpeq32	%f8,	%f12,	%o7
	ldd	[%l7 + 0x60],	%f6
	edge16	%o1,	%i5,	%o0
	movleu	%icc,	%g1,	%g6
	edge8l	%g4,	%l5,	%l0
	udivcc	%l6,	0x07B4,	%i1
	movne	%icc,	%o2,	%l2
	array8	%g3,	%i7,	%o4
	fcmps	%fcc0,	%f6,	%f0
	movre	%i4,	0x173,	%l1
	sth	%i6,	[%l7 + 0x5A]
	edge16ln	%g5,	%i0,	%i3
	edge32ln	%l4,	%o3,	%i2
	fcmpes	%fcc0,	%f4,	%f15
	array32	%l3,	%g2,	%g7
	srax	%o5,	%o6,	%o7
	movrgez	%o1,	0x3F4,	%i5
	sth	%g1,	[%l7 + 0x68]
	fone	%f14
	sub	%o0,	0x0F5D,	%g4
	sllx	%g6,	0x04,	%l0
	edge16	%l5,	%l6,	%i1
	smulcc	%l2,	%g3,	%o2
	movg	%icc,	%o4,	%i7
	fmovrsgez	%l1,	%f11,	%f12
	xnor	%i4,	0x1896,	%i6
	smulcc	%g5,	0x198E,	%i3
	fmovrdgz	%i0,	%f6,	%f0
	andn	%o3,	0x178C,	%l4
	andcc	%l3,	%i2,	%g2
	fmovsn	%xcc,	%f2,	%f1
	andncc	%g7,	%o5,	%o6
	movne	%xcc,	%o1,	%i5
	stx	%o7,	[%l7 + 0x08]
	fcmpes	%fcc3,	%f7,	%f2
	fmovrsgz	%g1,	%f8,	%f4
	and	%g4,	0x123E,	%g6
	save %l0, %o0, %l6
	fmuld8ulx16	%f2,	%f5,	%f10
	restore %l5, 0x0F76, %i1
	alignaddrl	%g3,	%l2,	%o2
	ldx	[%l7 + 0x18],	%i7
	movn	%xcc,	%o4,	%l1
	movrgz	%i4,	0x18F,	%i6
	fcmps	%fcc0,	%f8,	%f8
	fmovsle	%icc,	%f5,	%f8
	fmovrsne	%i3,	%f3,	%f13
	movrlz	%i0,	%g5,	%o3
	ldsw	[%l7 + 0x6C],	%l4
	movne	%icc,	%l3,	%i2
	ldd	[%l7 + 0x28],	%g2
	alignaddr	%o5,	%o6,	%g7
	movne	%xcc,	%i5,	%o1
	sub	%g1,	0x05FE,	%g4
	andncc	%o7,	%l0,	%o0
	ldd	[%l7 + 0x58],	%g6
	movneg	%icc,	%l5,	%l6
	fnot2s	%f14,	%f5
	edge16l	%i1,	%g3,	%l2
	xnor	%o2,	0x1896,	%o4
	movrgez	%i7,	%l1,	%i6
	and	%i4,	0x0DBC,	%i0
	srl	%i3,	0x14,	%o3
	mova	%icc,	%l4,	%l3
	and	%g5,	0x0CD1,	%i2
	add	%o5,	0x1F3E,	%g2
	mulscc	%o6,	0x0BAD,	%g7
	edge8ln	%o1,	%g1,	%i5
	alignaddrl	%g4,	%o7,	%o0
	fones	%f5
	smul	%l0,	%l5,	%g6
	subccc	%l6,	%g3,	%l2
	sth	%o2,	[%l7 + 0x1A]
	array16	%i1,	%i7,	%o4
	ldx	[%l7 + 0x20],	%l1
	ld	[%l7 + 0x50],	%f6
	ldd	[%l7 + 0x68],	%i6
	movrlez	%i4,	0x351,	%i3
	ldd	[%l7 + 0x10],	%f6
	movcc	%icc,	%i0,	%o3
	addcc	%l3,	%g5,	%l4
	add	%i2,	%g2,	%o5
	andcc	%g7,	0x04F1,	%o1
	sdiv	%o6,	0x0A73,	%i5
	ldsw	[%l7 + 0x24],	%g4
	ldsh	[%l7 + 0x60],	%g1
	fcmpne32	%f2,	%f4,	%o7
	st	%f2,	[%l7 + 0x78]
	fmul8sux16	%f14,	%f8,	%f12
	udivx	%l0,	0x176A,	%o0
	sdivcc	%g6,	0x0B8B,	%l5
	stx	%l6,	[%l7 + 0x58]
	fpadd16	%f6,	%f12,	%f4
	st	%f1,	[%l7 + 0x18]
	edge16n	%g3,	%l2,	%o2
	sdivx	%i7,	0x17B7,	%i1
	fmovdn	%xcc,	%f14,	%f13
	stw	%l1,	[%l7 + 0x7C]
	fmovsneg	%icc,	%f9,	%f6
	movrlz	%i6,	%i4,	%o4
	addc	%i0,	%o3,	%i3
	movg	%icc,	%l3,	%g5
	fornot2	%f12,	%f6,	%f0
	ldd	[%l7 + 0x70],	%l4
	umul	%i2,	0x0493,	%g2
	edge8n	%o5,	%g7,	%o1
	udiv	%i5,	0x1709,	%g4
	movleu	%xcc,	%g1,	%o7
	fornot1s	%f1,	%f4,	%f13
	edge16n	%o6,	%o0,	%g6
	subccc	%l0,	0x18BC,	%l5
	sdivcc	%g3,	0x0E1A,	%l2
	fcmped	%fcc2,	%f8,	%f8
	orncc	%l6,	%o2,	%i1
	movrlz	%i7,	0x03A,	%l1
	fnand	%f2,	%f10,	%f4
	addcc	%i6,	0x0D12,	%o4
	save %i0, %o3, %i4
	alignaddrl	%i3,	%l3,	%g5
	edge32l	%l4,	%i2,	%o5
	edge8	%g7,	%g2,	%i5
	udivx	%o1,	0x1208,	%g4
	smul	%o7,	0x0D84,	%g1
	edge16l	%o6,	%g6,	%o0
	udivcc	%l5,	0x07B7,	%l0
	save %l2, 0x15BE, %g3
	sdivcc	%l6,	0x1BB3,	%i1
	sllx	%i7,	%o2,	%i6
	edge16	%l1,	%o4,	%i0
	movvc	%icc,	%i4,	%o3
	edge16ln	%i3,	%l3,	%g5
	lduh	[%l7 + 0x7E],	%i2
	edge8n	%l4,	%g7,	%o5
	ldx	[%l7 + 0x50],	%g2
	movle	%icc,	%o1,	%i5
	mulx	%g4,	%o7,	%g1
	movge	%icc,	%o6,	%g6
	fmovdn	%xcc,	%f5,	%f12
	smulcc	%o0,	%l0,	%l5
	lduw	[%l7 + 0x2C],	%l2
	edge8ln	%l6,	%i1,	%i7
	or	%o2,	0x1C7C,	%i6
	andcc	%g3,	0x0D22,	%o4
	fnegs	%f10,	%f2
	sethi	0x0F3E,	%l1
	alignaddrl	%i0,	%o3,	%i3
	edge32l	%i4,	%g5,	%i2
	fmovd	%f12,	%f12
	edge8	%l3,	%l4,	%g7
	sethi	0x0EAC,	%g2
	addccc	%o1,	%o5,	%i5
	fmuld8sux16	%f1,	%f7,	%f12
	sra	%o7,	0x06,	%g1
	srax	%g4,	%o6,	%g6
	movgu	%xcc,	%l0,	%l5
	movle	%icc,	%l2,	%l6
	andncc	%o0,	%i7,	%i1
	fpadd16s	%f10,	%f8,	%f3
	ldsh	[%l7 + 0x6E],	%i6
	fmovse	%icc,	%f1,	%f0
	sth	%g3,	[%l7 + 0x38]
	movpos	%icc,	%o4,	%l1
	fabss	%f5,	%f5
	fzero	%f2
	fpsub16s	%f11,	%f7,	%f5
	edge16n	%i0,	%o2,	%i3
	xnor	%i4,	%g5,	%i2
	subcc	%o3,	%l3,	%g7
	udiv	%l4,	0x09B2,	%o1
	movl	%icc,	%o5,	%i5
	udivx	%g2,	0x17A4,	%g1
	fmovrse	%o7,	%f9,	%f12
	andncc	%g4,	%g6,	%l0
	st	%f4,	[%l7 + 0x14]
	fexpand	%f14,	%f0
	fmovrsgz	%o6,	%f3,	%f9
	stx	%l5,	[%l7 + 0x20]
	edge32ln	%l6,	%l2,	%i7
	fpsub32s	%f0,	%f15,	%f13
	orn	%i1,	%i6,	%o0
	edge8l	%g3,	%l1,	%i0
	edge8ln	%o4,	%o2,	%i3
	subc	%i4,	0x1ACE,	%i2
	fmovrsne	%o3,	%f8,	%f4
	mulx	%l3,	0x08A7,	%g7
	mulx	%g5,	0x0588,	%o1
	lduh	[%l7 + 0x2E],	%l4
	movrne	%i5,	%o5,	%g1
	fmovsne	%icc,	%f6,	%f11
	umulcc	%g2,	%g4,	%o7
	popc	0x136D,	%l0
	sra	%g6,	%o6,	%l6
	andn	%l2,	%i7,	%l5
	addc	%i6,	%i1,	%g3
	fnors	%f1,	%f7,	%f5
	fxor	%f10,	%f8,	%f6
	edge16n	%o0,	%i0,	%l1
	addccc	%o2,	0x19FA,	%o4
	fandnot2	%f8,	%f12,	%f8
	edge8l	%i3,	%i4,	%i2
	fmovdle	%xcc,	%f0,	%f2
	stb	%o3,	[%l7 + 0x73]
	fpack16	%f12,	%f15
	fmovrsne	%l3,	%f5,	%f6
	fcmpne16	%f12,	%f8,	%g7
	edge16ln	%o1,	%l4,	%i5
	fmovdvs	%icc,	%f14,	%f5
	srax	%o5,	0x0E,	%g1
	ldd	[%l7 + 0x18],	%f12
	ld	[%l7 + 0x34],	%f8
	fmovd	%f10,	%f0
	add	%g5,	%g4,	%g2
	fnot1s	%f14,	%f6
	movvc	%xcc,	%l0,	%o7
	fnot1	%f10,	%f12
	ldsh	[%l7 + 0x58],	%g6
	fone	%f10
	movn	%xcc,	%l6,	%l2
	movpos	%xcc,	%i7,	%o6
	andncc	%l5,	%i6,	%i1
	fpsub32s	%f15,	%f6,	%f0
	fsrc2s	%f0,	%f1
	movleu	%xcc,	%o0,	%g3
	popc	%i0,	%l1
	mulscc	%o2,	%i3,	%o4
	movneg	%xcc,	%i2,	%i4
	movleu	%icc,	%l3,	%o3
	movle	%xcc,	%g7,	%o1
	edge32ln	%l4,	%i5,	%o5
	movn	%xcc,	%g1,	%g4
	andncc	%g5,	%g2,	%l0
	edge16n	%o7,	%l6,	%l2
	subcc	%g6,	%i7,	%l5
	fandnot1s	%f11,	%f12,	%f14
	smul	%i6,	0x190D,	%o6
	fmovsg	%xcc,	%f12,	%f10
	fcmps	%fcc0,	%f13,	%f5
	st	%f7,	[%l7 + 0x20]
	ld	[%l7 + 0x5C],	%f5
	fmovsa	%icc,	%f11,	%f7
	umulcc	%o0,	0x1A68,	%i1
	umul	%i0,	0x0AD8,	%g3
	movrgz	%o2,	%l1,	%i3
	fmul8x16al	%f8,	%f6,	%f6
	add	%i2,	0x0DE1,	%i4
	fpsub16	%f8,	%f12,	%f8
	fmul8ulx16	%f8,	%f4,	%f14
	pdist	%f0,	%f12,	%f2
	umulcc	%o4,	%o3,	%l3
	andcc	%o1,	%l4,	%g7
	fpack16	%f2,	%f2
	ldx	[%l7 + 0x78],	%i5
	std	%f0,	[%l7 + 0x48]
	fnor	%f10,	%f2,	%f10
	edge32l	%g1,	%g4,	%g5
	fmovsvc	%icc,	%f2,	%f14
	fandnot2s	%f7,	%f4,	%f8
	subccc	%o5,	0x09EB,	%g2
	st	%f10,	[%l7 + 0x50]
	ldd	[%l7 + 0x60],	%f0
	edge32n	%o7,	%l0,	%l2
	movvs	%icc,	%g6,	%i7
	subc	%l5,	%l6,	%i6
	lduw	[%l7 + 0x54],	%o0
	fcmpes	%fcc2,	%f15,	%f5
	fnors	%f1,	%f13,	%f10
	pdist	%f4,	%f10,	%f12
	ldsh	[%l7 + 0x44],	%i1
	udiv	%i0,	0x026F,	%o6
	fpadd16	%f4,	%f2,	%f0
	movvs	%xcc,	%o2,	%l1
	ldd	[%l7 + 0x68],	%g2
	edge32	%i3,	%i4,	%o4
	addc	%o3,	0x0509,	%l3
	umulcc	%i2,	0x1829,	%l4
	st	%f10,	[%l7 + 0x38]
	or	%g7,	%o1,	%i5
	edge16	%g1,	%g5,	%o5
	fmovrse	%g2,	%f9,	%f13
	sdivcc	%g4,	0x1062,	%l0
	ldub	[%l7 + 0x4F],	%l2
	umulcc	%o7,	0x1E29,	%i7
	srax	%l5,	%l6,	%g6
	fmovdne	%xcc,	%f14,	%f1
	edge32ln	%o0,	%i1,	%i0
	ldsb	[%l7 + 0x20],	%o6
	fmovrdlez	%o2,	%f6,	%f4
	fmovsvs	%icc,	%f3,	%f3
	movpos	%xcc,	%i6,	%g3
	ldub	[%l7 + 0x10],	%l1
	edge32n	%i4,	%o4,	%o3
	edge16	%i3,	%l3,	%i2
	udiv	%l4,	0x1C62,	%o1
	fxors	%f9,	%f13,	%f15
	fnor	%f14,	%f12,	%f10
	movvs	%icc,	%i5,	%g7
	fcmpd	%fcc0,	%f2,	%f6
	udiv	%g5,	0x005B,	%o5
	movneg	%icc,	%g1,	%g2
	edge32l	%l0,	%g4,	%l2
	stb	%o7,	[%l7 + 0x53]
	fornot2	%f4,	%f0,	%f14
	sdiv	%l5,	0x1C1D,	%l6
	or	%g6,	0x157B,	%i7
	move	%icc,	%i1,	%o0
	ldsh	[%l7 + 0x6C],	%o6
	ldx	[%l7 + 0x28],	%o2
	movvc	%xcc,	%i0,	%g3
	addcc	%i6,	%l1,	%i4
	edge16n	%o3,	%o4,	%i3
	edge32l	%i2,	%l4,	%o1
	fnegs	%f14,	%f3
	fmul8x16au	%f8,	%f7,	%f14
	fmul8x16au	%f13,	%f2,	%f10
	fmul8x16al	%f15,	%f12,	%f8
	subc	%i5,	%g7,	%l3
	array32	%o5,	%g1,	%g2
	mulx	%g5,	0x1D57,	%g4
	fzero	%f0
	edge32ln	%l2,	%l0,	%l5
	umulcc	%l6,	%g6,	%i7
	ldd	[%l7 + 0x40],	%o6
	fmovsg	%icc,	%f7,	%f4
	xnor	%o0,	%i1,	%o2
	orn	%i0,	0x1603,	%o6
	movcc	%icc,	%i6,	%l1
	edge16ln	%g3,	%i4,	%o3
	movneg	%icc,	%i3,	%i2
	movcc	%xcc,	%o4,	%o1
	alignaddrl	%i5,	%g7,	%l4
	fmul8ulx16	%f6,	%f4,	%f12
	fmul8x16au	%f5,	%f2,	%f12
	fsrc2s	%f11,	%f13
	fmovsa	%xcc,	%f5,	%f5
	movre	%l3,	%g1,	%g2
	movpos	%icc,	%o5,	%g4
	movl	%icc,	%g5,	%l0
	mulscc	%l5,	0x1A79,	%l6
	edge32ln	%g6,	%i7,	%o7
	sdivx	%o0,	0x18C1,	%i1
	movcs	%icc,	%o2,	%i0
	movcc	%icc,	%o6,	%l2
	movge	%icc,	%i6,	%g3
	fsrc2s	%f3,	%f13
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type f   	: 2203
!	Type i   	: 6390
!	Type l   	: 1407
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xEC95FBD1
.word 0x87BE18FF
.word 0xD6565607
.word 0x47C7540C
.word 0xF312FCBB
.word 0x92B05486
.word 0x0F298222
.word 0x39D44B29
.word 0x35AF4304
.word 0x4D37A3B9
.word 0x33A85404
.word 0x1AD2EC01
.word 0x0DA53A0B
.word 0x5559C543
.word 0x84B25613
.word 0xAA9DEBBB
.word 0x9034B7EE
.word 0xD2D8F2AD
.word 0x31015C48
.word 0xD4EA88B7
.word 0xC37823E0
.word 0xDBBA4135
.word 0x9D280038
.word 0xC8CD79A7
.word 0xC7DCC715
.word 0xFAF2D2CD
.word 0xF0B97800
.word 0xAF8D1838
.word 0xEF679F24
.word 0x48CCFE34
.word 0x7A6B8B2C
.word 0x3F11B5D0
.word 0x25785C68
.word 0x6D70099A
.word 0x903607CD
.word 0xC7F2084F
.word 0xB0759FEC
.word 0xDCDFA5D1
.word 0xDF8ED7D9
.word 0xC2608FED
.word 0x3461DCCC
.word 0xF93908B4
.word 0xC8200FDD
.word 0xCDF0B974
.word 0x3CADFB74
.word 0xA2B36B9B
.word 0x5EC45377
.word 0x030FA4C5
.word 0x4687C3E0
.word 0x243C8063
.word 0x48C5879D
.word 0xE0570E26
.word 0xED4F99F2
.word 0xAE73EC8A
.word 0x5FB7BF23
.word 0xECFF626D
.word 0x2456EDFC
.word 0x797F6647
.word 0x461ED4F1
.word 0xDC89E19C
.word 0x4BDF4F83
.word 0xB66824B1
.word 0xFAD176E2
.word 0xF0879443
.end
