/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f9.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f9.s,v 1.1 2007/05/11 17:22:39 drp Exp $"
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

mov %l7, %g1
wrpr %g0, 0x0, %cwp
mov %g1, %l7
wrpr %g0, 0x1, %cwp
mov %g1, %l7
wrpr %g0, 0x2, %cwp
mov %g1, %l7
wrpr %g0, 0x3, %cwp
mov %g1, %l7
wrpr %g0, 0x4, %cwp
mov %g1, %l7
wrpr %g0, 0x5, %cwp
mov %g1, %l7
wrpr %g0, 0x6, %cwp
mov %g1, %l7
wrpr %g0, 0x7, %cwp
mov %g1, %l7
	nop
	setx	0x98F908E6A0730A22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xF,	%g2
	set	0xA,	%g3
	set	0x0,	%g4
	set	0xD,	%g5
	set	0xC,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x7,	%i1
	set	-0x4,	%i2
	set	-0xD,	%i3
	set	-0xA,	%i4
	set	-0x7,	%i5
	set	-0xD,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x02A7AA83,	%l0
	set	0x5232A862,	%l1
	set	0x738E538B,	%l2
	set	0x152D6F8C,	%l3
	set	0x25D1E681,	%l4
	set	0x4AA298F5,	%l5
	set	0x55FF1536,	%l6
	!# Output registers
	set	0x18B2,	%o0
	set	0x16EB,	%o1
	set	-0x19B4,	%o2
	set	0x01B3,	%o3
	set	-0x1B73,	%o4
	set	0x0D24,	%o5
	set	0x15E5,	%o6
	set	-0x1338,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1683A8D49B18DF47)
	INIT_TH_FP_REG(%l7,%f2,0x7B19B3175E30AF31)
	INIT_TH_FP_REG(%l7,%f4,0x61E2AD524D1EB3EE)
	INIT_TH_FP_REG(%l7,%f6,0x9B698393D32A440F)
	INIT_TH_FP_REG(%l7,%f8,0xDF06DD6EA2B1D98B)
	INIT_TH_FP_REG(%l7,%f10,0x963D28F979E564AE)
	INIT_TH_FP_REG(%l7,%f12,0x957A3BC4BDA4D5D3)
	INIT_TH_FP_REG(%l7,%f14,0x591F76FB885F17E4)
	INIT_TH_FP_REG(%l7,%f16,0x4AF664564CFC53D3)
	INIT_TH_FP_REG(%l7,%f18,0x0D218ACBA6CBA93B)
	INIT_TH_FP_REG(%l7,%f20,0xC755A6109B9A21F0)
	INIT_TH_FP_REG(%l7,%f22,0x5CF2D1E27D2C8F93)
	INIT_TH_FP_REG(%l7,%f24,0x66ECE3C5A2747C7A)
	INIT_TH_FP_REG(%l7,%f26,0x595EF90BDFADFD43)
	INIT_TH_FP_REG(%l7,%f28,0x43CB9E60AB00552E)
	INIT_TH_FP_REG(%l7,%f30,0x1292621D5A73FCC1)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0AA, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fandnot1s	%f31,	%f7,	%f9
	popc	%i6,	%i0
	lduw	[%l7 + 0x3C],	%o2
	ldsb	[%l7 + 0x13],	%l4
	sdiv	%l0,	0x03AC,	%l6
	nop
	set	0x3E, %g1
	ldsb	[%l7 + %g1],	%l2
	movvs	%xcc,	%o0,	%g5
	edge16ln	%g7,	%i4,	%i2
	lduh	[%l7 + 0x08],	%o1
	nop
	set	0x78, %g5
	lduw	[%l7 + %g5],	%i7
	udivcc	%o7,	0x03D9,	%g2
	movre	%g6,	%g3,	%o6
	fmovdneg	%xcc,	%f10,	%f30
	save %l5, %l3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc1,	%f28,	%f21
	subc	%l1,	0x19E2,	%o5
	addcc	%g1,	0x0F4C,	%i1
	movvs	%icc,	%g4,	%i3
	srax	%i5,	%o4,	%i6
	movrgz	%i0,	0x2BB,	%l4
	ldd	[%l7 + 0x38],	%o2
	fmovsl	%icc,	%f3,	%f11
	fors	%f30,	%f25,	%f0
	fone	%f26
	sub	%l6,	0x1731,	%l2
	alignaddr	%o0,	%l0,	%g7
	sir	0x090F
	umulcc	%g5,	0x1070,	%i4
	fmovse	%xcc,	%f24,	%f0
	sdivx	%o1,	0x100A,	%i7
	fmovsge	%icc,	%f21,	%f29
	xnorcc	%i2,	%g2,	%o7
	mulscc	%g3,	0x189C,	%o6
	fpadd32	%f20,	%f20,	%f30
	movneg	%xcc,	%g6,	%l5
	fandnot2s	%f24,	%f14,	%f14
	mulscc	%l3,	0x1470,	%l1
	movpos	%xcc,	%o5,	%g1
	sir	0x0E1E
	sdivcc	%o3,	0x1AB3,	%i1
	edge32	%g4,	%i5,	%i3
	addcc	%i6,	%i0,	%l4
	movvs	%xcc,	%o4,	%l6
	nop
	set	0x10, %l1
	std	%f30,	[%l7 + %l1]
	fmovsle	%icc,	%f0,	%f17
	fpmerge	%f3,	%f4,	%f24
	ldx	[%l7 + 0x48],	%o2
	movvc	%icc,	%l2,	%o0
	fmovd	%f18,	%f6
	andn	%g7,	0x0FDC,	%l0
	array8	%i4,	%o1,	%i7
	fmovrdgz	%i2,	%f22,	%f12
	udivcc	%g5,	0x01E1,	%o7
	alignaddrl	%g3,	%o6,	%g6
	sllx	%l5,	0x16,	%g2
	fpmerge	%f20,	%f30,	%f14
	fpmerge	%f19,	%f22,	%f6
	array32	%l3,	%o5,	%l1
	xnor	%o3,	0x19E4,	%g1
	movgu	%xcc,	%g4,	%i5
	nop
	set	0x48, %g7
	stx	%i1,	[%l7 + %g7]
	stb	%i3,	[%l7 + 0x0C]
	subc	%i6,	0x1EAB,	%i0
	mova	%icc,	%o4,	%l4
	ldub	[%l7 + 0x78],	%o2
	srlx	%l6,	%l2,	%g7
	nop
	set	0x24, %o7
	lduw	[%l7 + %o7],	%o0
	movle	%xcc,	%l0,	%i4
	xorcc	%i7,	%i2,	%o1
	fmovsge	%icc,	%f23,	%f25
	andcc	%g5,	0x1A5D,	%g3
	fone	%f22
	movrgez	%o6,	0x20F,	%g6
	alignaddrl	%o7,	%l5,	%l3
	sth	%o5,	[%l7 + 0x38]
	fmul8x16al	%f0,	%f0,	%f28
	addccc	%l1,	%g2,	%o3
	sra	%g1,	%g4,	%i5
	movrlz	%i1,	0x1D8,	%i3
	sra	%i6,	%o4,	%i0
	movrgez	%l4,	%l6,	%o2
	movrgz	%g7,	%l2,	%o0
	smul	%i4,	%i7,	%i2
	lduw	[%l7 + 0x38],	%l0
	stb	%o1,	[%l7 + 0x2A]
	edge16n	%g3,	%o6,	%g6
	udiv	%o7,	0x01F0,	%l5
	fmovdcs	%xcc,	%f20,	%f12
	sethi	0x0926,	%l3
	movrgez	%o5,	%l1,	%g2
	array16	%o3,	%g5,	%g1
	movg	%xcc,	%g4,	%i1
	ldub	[%l7 + 0x23],	%i5
	movle	%xcc,	%i6,	%o4
	fmovsl	%xcc,	%f19,	%f12
	fmovdg	%icc,	%f5,	%f11
	srax	%i0,	0x0B,	%l4
	edge16	%l6,	%i3,	%g7
	movgu	%xcc,	%o2,	%l2
	fcmpeq32	%f10,	%f14,	%o0
	fandnot2s	%f13,	%f11,	%f10
	movvc	%icc,	%i7,	%i4
	srlx	%i2,	%o1,	%g3
	mova	%xcc,	%o6,	%g6
	fcmps	%fcc3,	%f28,	%f2
	array16	%o7,	%l0,	%l3
	fmovse	%xcc,	%f25,	%f10
	fcmpne16	%f4,	%f12,	%l5
	fnors	%f8,	%f9,	%f28
	srlx	%o5,	0x02,	%l1
	fnegs	%f23,	%f4
	movle	%xcc,	%o3,	%g5
	fmovse	%xcc,	%f23,	%f17
	ld	[%l7 + 0x54],	%f16
	fpack32	%f24,	%f20,	%f0
	movn	%xcc,	%g1,	%g2
	movcs	%xcc,	%i1,	%i5
	srax	%g4,	0x18,	%i6
	movcc	%icc,	%o4,	%l4
	sdiv	%i0,	0x0522,	%i3
	alignaddrl	%g7,	%l6,	%l2
	edge32	%o0,	%i7,	%o2
	andn	%i4,	%i2,	%g3
	ldx	[%l7 + 0x30],	%o6
	umul	%o1,	0x0C81,	%g6
	edge8n	%l0,	%l3,	%l5
	ldd	[%l7 + 0x70],	%o4
	fmovdle	%xcc,	%f23,	%f8
	alignaddrl	%l1,	%o7,	%o3
	sub	%g5,	0x0A19,	%g2
	ldx	[%l7 + 0x20],	%i1
	movrlz	%i5,	0x241,	%g1
	edge8	%g4,	%o4,	%l4
	addcc	%i6,	%i0,	%g7
	fpadd16	%f30,	%f24,	%f6
	movrne	%i3,	%l6,	%o0
	edge8l	%l2,	%i7,	%o2
	edge16l	%i2,	%i4,	%g3
	fcmple16	%f12,	%f4,	%o6
	sllx	%o1,	0x0D,	%g6
	fmovd	%f12,	%f18
	fnegd	%f16,	%f28
	and	%l0,	0x1290,	%l5
	ldsw	[%l7 + 0x68],	%o5
	fmovsge	%icc,	%f23,	%f31
	addccc	%l3,	0x04E4,	%o7
	orcc	%o3,	0x1E1A,	%g5
	std	%f8,	[%l7 + 0x20]
	fzeros	%f3
	subc	%l1,	0x0C6C,	%g2
	mova	%xcc,	%i1,	%g1
	umulcc	%g4,	0x099B,	%o4
	nop
	set	0x40, %i4
	ldsh	[%l7 + %i4],	%l4
	subc	%i5,	0x074F,	%i0
	fpsub32s	%f0,	%f26,	%f15
	movneg	%icc,	%g7,	%i3
	sra	%i6,	%o0,	%l6
	lduw	[%l7 + 0x70],	%i7
	edge16n	%o2,	%l2,	%i4
	movleu	%icc,	%g3,	%i2
	movpos	%xcc,	%o6,	%o1
	xnorcc	%l0,	%g6,	%o5
	srlx	%l5,	0x05,	%o7
	fcmple32	%f30,	%f30,	%o3
	fones	%f25
	fpack32	%f12,	%f26,	%f16
	fornot1	%f8,	%f16,	%f30
	fmul8ulx16	%f2,	%f24,	%f26
	lduh	[%l7 + 0x2A],	%g5
	fmovscc	%xcc,	%f28,	%f12
	movrlez	%l3,	0x0FB,	%l1
	edge8n	%i1,	%g1,	%g4
	sra	%o4,	%l4,	%g2
	movrgez	%i5,	0x2B0,	%i0
	xorcc	%i3,	%i6,	%g7
	edge32ln	%l6,	%o0,	%i7
	edge8n	%o2,	%i4,	%l2
	fmovsleu	%icc,	%f28,	%f2
	edge8ln	%i2,	%o6,	%g3
	sllx	%o1,	0x13,	%l0
	umulcc	%o5,	%g6,	%o7
	addccc	%l5,	%o3,	%g5
	fmul8x16al	%f23,	%f4,	%f26
	movvc	%xcc,	%l1,	%i1
	restore %l3, %g1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g4,	0x1E,	%g2
	fcmps	%fcc2,	%f10,	%f21
	stw	%l4,	[%l7 + 0x48]
	edge8n	%i0,	%i3,	%i6
	fnands	%f29,	%f8,	%f28
	edge32n	%i5,	%l6,	%g7
	subcc	%o0,	%o2,	%i4
	movleu	%xcc,	%i7,	%l2
	alignaddr	%i2,	%o6,	%o1
	fmovrslez	%l0,	%f13,	%f27
	sethi	0x0ECF,	%g3
	fmovrdlez	%o5,	%f28,	%f14
	movrgez	%g6,	%l5,	%o7
	subc	%g5,	%o3,	%l1
	edge8	%l3,	%g1,	%o4
	sdivcc	%i1,	0x18AF,	%g2
	movcc	%icc,	%l4,	%g4
	movgu	%icc,	%i0,	%i6
	fmovsge	%icc,	%f5,	%f22
	sllx	%i3,	0x0A,	%i5
	edge32	%g7,	%l6,	%o2
	fnegd	%f26,	%f8
	movpos	%icc,	%o0,	%i7
	xorcc	%l2,	%i2,	%o6
	nop
	set	0x70, %g2
	std	%f26,	[%l7 + %g2]
	edge32ln	%o1,	%i4,	%g3
	save %l0, %o5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g6,	%o7,	%o3
	smul	%l1,	0x1146,	%l3
	orncc	%g1,	0x1B88,	%o4
	fxnor	%f26,	%f24,	%f0
	umulcc	%g5,	%g2,	%i1
	movneg	%icc,	%l4,	%i0
	subccc	%i6,	0x0E03,	%g4
	movvs	%xcc,	%i5,	%g7
	mulx	%l6,	0x1DB0,	%o2
	mova	%xcc,	%o0,	%i7
	movrlz	%l2,	0x146,	%i3
	movleu	%xcc,	%i2,	%o6
	sir	0x18C2
	movvs	%xcc,	%o1,	%g3
	smulcc	%i4,	0x1E16,	%o5
	fmovs	%f1,	%f2
	fone	%f14
	edge16	%l5,	%l0,	%o7
	sdiv	%g6,	0x1927,	%o3
	fmovsneg	%xcc,	%f4,	%f16
	fcmpeq16	%f10,	%f14,	%l1
	sir	0x1891
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	movrgez	%g2,	%g5,	%i1
	movneg	%xcc,	%l4,	%i6
	xor	%i0,	%i5,	%g7
	array32	%g4,	%o2,	%l6
	edge16l	%o0,	%i7,	%i3
	movleu	%icc,	%l2,	%o6
	fabsd	%f0,	%f18
	edge16	%o1,	%g3,	%i2
	save %o5, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l0,	%o7
	edge32ln	%o3,	%g6,	%l1
	fcmpne16	%f24,	%f30,	%o4
	sllx	%l3,	0x1F,	%g1
	ldd	[%l7 + 0x48],	%g4
	movvs	%icc,	%g2,	%i1
	sdivcc	%l4,	0x151F,	%i0
	ldub	[%l7 + 0x1B],	%i5
	movrne	%i6,	0x1F8,	%g7
	fmovsge	%icc,	%f23,	%f30
	sir	0x17C0
	movcs	%icc,	%o2,	%l6
	array8	%g4,	%i7,	%o0
	xorcc	%l2,	%i3,	%o6
	array32	%g3,	%i2,	%o5
	xnor	%o1,	%l5,	%i4
	movn	%xcc,	%o7,	%o3
	fcmpeq16	%f18,	%f14,	%g6
	movre	%l1,	%o4,	%l3
	movrlez	%l0,	0x065,	%g1
	edge16ln	%g5,	%g2,	%l4
	fzero	%f12
	subcc	%i0,	%i1,	%i5
	fnor	%f4,	%f20,	%f2
	edge16ln	%g7,	%i6,	%o2
	andncc	%g4,	%i7,	%o0
	edge8n	%l2,	%l6,	%o6
	smulcc	%i3,	0x0360,	%i2
	fcmpgt32	%f16,	%f0,	%g3
	fmovrsgez	%o5,	%f5,	%f0
	sllx	%o1,	%i4,	%o7
	movrne	%o3,	%l5,	%l1
	fxor	%f26,	%f24,	%f12
	alignaddrl	%g6,	%o4,	%l3
	edge8	%l0,	%g5,	%g2
	orn	%g1,	%l4,	%i0
	xnorcc	%i1,	0x0978,	%i5
	orncc	%g7,	%i6,	%o2
	nop
	set	0x14, %o6
	stb	%i7,	[%l7 + %o6]
	orn	%o0,	0x046E,	%g4
	or	%l2,	0x0D6D,	%l6
	stw	%i3,	[%l7 + 0x3C]
	ldsb	[%l7 + 0x25],	%i2
	subc	%o6,	0x1746,	%o5
	sir	0x1181
	st	%f5,	[%l7 + 0x34]
	movvs	%icc,	%o1,	%i4
	lduh	[%l7 + 0x40],	%o7
	fmovda	%xcc,	%f20,	%f1
	stw	%o3,	[%l7 + 0x38]
	ld	[%l7 + 0x64],	%f21
	sllx	%g3,	0x11,	%l1
	nop
	set	0x70, %l0
	std	%f2,	[%l7 + %l0]
	mulx	%g6,	%l5,	%o4
	popc	0x1411,	%l0
	ldsb	[%l7 + 0x73],	%l3
	mulscc	%g5,	%g1,	%g2
	subccc	%l4,	0x15E4,	%i0
	popc	0x1A55,	%i5
	movn	%icc,	%g7,	%i1
	popc	%i6,	%i7
	sdivx	%o0,	0x1DC9,	%g4
	nop
	set	0x54, %i2
	stw	%l2,	[%l7 + %i2]
	movn	%icc,	%o2,	%i3
	smulcc	%l6,	%i2,	%o5
	xnor	%o6,	0x0C4F,	%i4
	ldsh	[%l7 + 0x72],	%o1
	fmovse	%xcc,	%f26,	%f17
	array16	%o3,	%g3,	%o7
	edge8l	%l1,	%l5,	%g6
	sra	%o4,	0x09,	%l3
	fmovdne	%icc,	%f2,	%f21
	orn	%l0,	%g1,	%g5
	fmovspos	%icc,	%f26,	%f29
	fpsub16	%f26,	%f22,	%f20
	xor	%g2,	%l4,	%i5
	movge	%xcc,	%g7,	%i1
	siam	0x5
	movge	%xcc,	%i6,	%i0
	sub	%o0,	%i7,	%g4
	sth	%o2,	[%l7 + 0x66]
	movne	%icc,	%i3,	%l6
	fmovrdlz	%l2,	%f2,	%f8
	std	%f18,	[%l7 + 0x58]
	movvc	%xcc,	%i2,	%o5
	stw	%o6,	[%l7 + 0x58]
	addcc	%i4,	%o3,	%o1
	srlx	%g3,	0x04,	%l1
	array8	%o7,	%l5,	%g6
	srl	%o4,	0x19,	%l3
	stb	%l0,	[%l7 + 0x51]
	fmovrslz	%g5,	%f5,	%f24
	edge16	%g1,	%l4,	%g2
	edge32n	%i5,	%g7,	%i1
	srax	%i6,	0x0C,	%o0
	movcc	%xcc,	%i7,	%g4
	array8	%i0,	%i3,	%l6
	srax	%l2,	%o2,	%i2
	edge16	%o5,	%o6,	%o3
	umulcc	%o1,	0x0609,	%i4
	movle	%icc,	%g3,	%l1
	lduw	[%l7 + 0x30],	%o7
	fmovrslez	%l5,	%f31,	%f29
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%o4
	sll	%l3,	%g6,	%l0
	mulx	%g1,	%l4,	%g5
	umul	%g2,	%g7,	%i1
	edge16ln	%i5,	%o0,	%i6
	siam	0x6
	fmovsgu	%icc,	%f28,	%f27
	fmovrsgz	%i7,	%f25,	%f13
	lduw	[%l7 + 0x44],	%i0
	smul	%g4,	0x03FC,	%l6
	fcmpgt32	%f0,	%f30,	%i3
	fmovscs	%xcc,	%f18,	%f2
	movrlz	%o2,	0x052,	%i2
	nop
	set	0x18, %o3
	std	%f18,	[%l7 + %o3]
	fmuld8ulx16	%f28,	%f20,	%f20
	addccc	%o5,	0x04B7,	%l2
	fmovrdne	%o6,	%f20,	%f30
	fpsub32	%f28,	%f20,	%f22
	sra	%o3,	%i4,	%g3
	array32	%o1,	%o7,	%l1
	edge16l	%l5,	%l3,	%g6
	umul	%o4,	0x1144,	%l0
	std	%f4,	[%l7 + 0x20]
	move	%xcc,	%g1,	%g5
	movcc	%icc,	%g2,	%l4
	fexpand	%f11,	%f4
	fpadd16s	%f28,	%f13,	%f16
	fzeros	%f3
	edge32ln	%i1,	%i5,	%o0
	lduw	[%l7 + 0x70],	%g7
	orcc	%i7,	%i0,	%i6
	ld	[%l7 + 0x64],	%f5
	sdivcc	%l6,	0x0F30,	%g4
	lduh	[%l7 + 0x60],	%i3
	movneg	%icc,	%i2,	%o2
	fmovdn	%xcc,	%f17,	%f25
	and	%o5,	0x07AB,	%o6
	mova	%icc,	%o3,	%i4
	fabsd	%f4,	%f10
	sethi	0x0EBE,	%l2
	st	%f3,	[%l7 + 0x54]
	movrlez	%g3,	%o1,	%o7
	sub	%l1,	0x0C53,	%l3
	restore %l5, %o4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l0,	%g5
	lduh	[%l7 + 0x32],	%g1
	fmovrdgz	%g2,	%f20,	%f0
	nop
	set	0x52, %g3
	sth	%i1,	[%l7 + %g3]
	sth	%l4,	[%l7 + 0x0C]
	xnor	%i5,	0x10B6,	%g7
	umul	%i7,	%i0,	%i6
	fmovdcs	%icc,	%f26,	%f12
	ldsw	[%l7 + 0x24],	%l6
	movrgz	%o0,	%i3,	%g4
	movrlez	%o2,	0x2F1,	%i2
	addccc	%o6,	%o5,	%i4
	andn	%l2,	%o3,	%g3
	udiv	%o1,	0x14BD,	%o7
	stx	%l1,	[%l7 + 0x70]
	movle	%xcc,	%l5,	%l3
	lduw	[%l7 + 0x38],	%g6
	pdist	%f26,	%f4,	%f2
	mulscc	%l0,	0x144E,	%o4
	edge16ln	%g5,	%g2,	%i1
	srlx	%l4,	%i5,	%g1
	fmovrdgz	%i7,	%f10,	%f16
	lduh	[%l7 + 0x20],	%i0
	fmovrdlz	%i6,	%f2,	%f14
	edge32n	%g7,	%l6,	%i3
	movcs	%xcc,	%g4,	%o2
	array16	%i2,	%o0,	%o6
	movne	%icc,	%i4,	%o5
	fcmpgt16	%f14,	%f8,	%l2
	umul	%o3,	0x1CB4,	%g3
	fandnot2	%f10,	%f28,	%f8
	array32	%o7,	%l1,	%o1
	fzero	%f0
	ldd	[%l7 + 0x28],	%l4
	nop
	set	0x58, %o0
	ldub	[%l7 + %o0],	%g6
	sra	%l0,	0x01,	%l3
	edge16n	%g5,	%o4,	%g2
	fcmps	%fcc3,	%f28,	%f10
	orcc	%l4,	0x16B8,	%i1
	movneg	%xcc,	%i5,	%g1
	ldx	[%l7 + 0x30],	%i7
	fcmpgt16	%f12,	%f2,	%i0
	movl	%icc,	%i6,	%g7
	movge	%icc,	%l6,	%i3
	movneg	%icc,	%o2,	%i2
	lduh	[%l7 + 0x64],	%o0
	fcmpes	%fcc2,	%f22,	%f19
	fcmpne16	%f14,	%f6,	%g4
	sub	%o6,	0x1185,	%o5
	fmovdneg	%xcc,	%f13,	%f18
	and	%l2,	0x1B0C,	%o3
	fexpand	%f26,	%f30
	addccc	%g3,	0x08C9,	%i4
	umulcc	%l1,	0x1498,	%o1
	fpack16	%f22,	%f14
	srax	%l5,	%g6,	%l0
	movrlez	%o7,	0x0D8,	%g5
	fnot1s	%f14,	%f9
	fandnot1	%f2,	%f22,	%f16
	fnegs	%f15,	%f10
	st	%f21,	[%l7 + 0x74]
	fand	%f0,	%f30,	%f20
	movne	%xcc,	%o4,	%l3
	fmovrse	%l4,	%f21,	%f15
	alignaddrl	%g2,	%i5,	%g1
	fmovrslz	%i1,	%f20,	%f6
	movvc	%xcc,	%i7,	%i6
	movcs	%xcc,	%i0,	%l6
	sllx	%g7,	%i3,	%i2
	movge	%xcc,	%o0,	%o2
	for	%f22,	%f0,	%f18
	save %o6, 0x0FE6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f9
	std	%f18,	[%l7 + 0x60]
	ldd	[%l7 + 0x48],	%o4
	xorcc	%l2,	0x0B56,	%o3
	orcc	%i4,	%g3,	%l1
	edge8l	%o1,	%l5,	%g6
	movpos	%xcc,	%l0,	%o7
	nop
	set	0x30, %o4
	std	%f14,	[%l7 + %o4]
	sir	0x16C5
	nop
	set	0x38, %g4
	std	%f24,	[%l7 + %g4]
	fpack16	%f20,	%f3
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	edge8l	%g2,	%i5,	%l3
	nop
	set	0x58, %i7
	ldsh	[%l7 + %i7],	%i1
	movneg	%xcc,	%i7,	%i6
	movg	%xcc,	%g1,	%l6
	fmovsle	%xcc,	%f27,	%f23
	subc	%g7,	%i3,	%i2
	smul	%o0,	0x0A71,	%i0
	orn	%o6,	0x14B6,	%o2
	movvc	%xcc,	%o5,	%l2
	edge32l	%o3,	%g4,	%g3
	std	%f12,	[%l7 + 0x10]
	movge	%icc,	%l1,	%o1
	fnand	%f0,	%f20,	%f18
	movrgez	%i4,	0x365,	%l5
	umul	%l0,	%g6,	%o7
	stw	%g5,	[%l7 + 0x7C]
	xor	%o4,	0x13B1,	%g2
	alignaddr	%i5,	%l3,	%l4
	movrne	%i1,	%i7,	%i6
	fpack32	%f2,	%f2,	%f28
	fpadd16s	%f15,	%f10,	%f24
	xnor	%l6,	%g7,	%i3
	orn	%g1,	%o0,	%i0
	fmovrsne	%o6,	%f29,	%f21
	fpsub32s	%f30,	%f20,	%f10
	movne	%xcc,	%i2,	%o5
	movcc	%xcc,	%l2,	%o2
	movne	%icc,	%g4,	%o3
	fpsub16	%f20,	%f30,	%f30
	alignaddrl	%l1,	%g3,	%i4
	fmovd	%f6,	%f18
	fmovrsgez	%o1,	%f19,	%f0
	smul	%l5,	0x1AB5,	%g6
	udiv	%l0,	0x0007,	%o7
	sll	%o4,	%g5,	%g2
	srlx	%i5,	%l4,	%i1
	andcc	%i7,	%i6,	%l6
	fpsub16s	%f13,	%f17,	%f19
	sub	%l3,	0x0FB8,	%g7
	sub	%g1,	0x1EB7,	%o0
	mulscc	%i3,	%i0,	%i2
	array16	%o5,	%o6,	%l2
	fnot2s	%f16,	%f12
	lduw	[%l7 + 0x1C],	%o2
	movn	%xcc,	%o3,	%l1
	move	%xcc,	%g4,	%g3
	ldsb	[%l7 + 0x29],	%o1
	fnor	%f18,	%f4,	%f28
	movvs	%xcc,	%l5,	%i4
	sllx	%l0,	0x1C,	%o7
	movl	%xcc,	%g6,	%o4
	movleu	%xcc,	%g5,	%g2
	xnor	%l4,	0x1E88,	%i5
	alignaddr	%i7,	%i1,	%l6
	subc	%i6,	%l3,	%g7
	sllx	%o0,	0x1D,	%i3
	fmovrdne	%g1,	%f12,	%f30
	movre	%i2,	0x257,	%i0
	popc	%o6,	%l2
	fxnors	%f24,	%f16,	%f25
	udiv	%o2,	0x0A80,	%o3
	movrgez	%l1,	0x0C7,	%g4
	sra	%o5,	%o1,	%g3
	alignaddr	%i4,	%l0,	%o7
	ldd	[%l7 + 0x38],	%f8
	ldub	[%l7 + 0x5D],	%g6
	mova	%icc,	%o4,	%g5
	movrlz	%g2,	%l5,	%l4
	ldsb	[%l7 + 0x3E],	%i7
	ldub	[%l7 + 0x59],	%i1
	movleu	%xcc,	%i5,	%l6
	movrgz	%l3,	0x1E1,	%i6
	movrlz	%o0,	%g7,	%g1
	stw	%i2,	[%l7 + 0x40]
	faligndata	%f16,	%f18,	%f12
	subcc	%i0,	%o6,	%i3
	fmovdle	%xcc,	%f26,	%f8
	fandnot1s	%f10,	%f4,	%f25
	and	%l2,	%o3,	%l1
	fnot2s	%f1,	%f17
	udiv	%g4,	0x1CD8,	%o2
	orncc	%o1,	0x1516,	%g3
	andncc	%i4,	%o5,	%o7
	sdivcc	%g6,	0x1185,	%l0
	fcmpne16	%f0,	%f10,	%o4
	movge	%icc,	%g5,	%l5
	xnor	%l4,	0x1675,	%g2
	fmovdl	%icc,	%f24,	%f2
	stx	%i1,	[%l7 + 0x58]
	save %i5, %i7, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i6, %o0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f1,	%f2
	addccc	%g7,	0x0609,	%g1
	stx	%i2,	[%l7 + 0x48]
	fnor	%f22,	%f2,	%f20
	edge8ln	%o6,	%i3,	%i0
	array32	%l2,	%o3,	%l1
	movpos	%xcc,	%o2,	%o1
	movvc	%xcc,	%g4,	%i4
	orn	%o5,	0x1A7A,	%g3
	fmuld8sux16	%f8,	%f17,	%f6
	ldx	[%l7 + 0x38],	%o7
	edge16ln	%l0,	%g6,	%g5
	orn	%l5,	0x16CA,	%l4
	edge16l	%o4,	%i1,	%i5
	fmovdle	%icc,	%f2,	%f12
	movre	%g2,	%i7,	%i6
	fnands	%f9,	%f9,	%f30
	movne	%icc,	%l6,	%o0
	fxnor	%f10,	%f2,	%f28
	edge16n	%l3,	%g7,	%g1
	save %o6, 0x18C5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i3,	0x0783,	%i0
	fmovdcs	%icc,	%f2,	%f12
	movrlz	%o3,	0x33C,	%l1
	movn	%xcc,	%l2,	%o1
	fnor	%f30,	%f28,	%f26
	ldd	[%l7 + 0x20],	%g4
	ldsb	[%l7 + 0x42],	%i4
	movvc	%icc,	%o2,	%g3
	sra	%o5,	0x11,	%o7
	fsrc2	%f6,	%f20
	movn	%icc,	%l0,	%g5
	sub	%g6,	%l5,	%l4
	or	%o4,	%i5,	%i1
	movpos	%icc,	%g2,	%i6
	edge16l	%i7,	%l6,	%l3
	fcmped	%fcc2,	%f8,	%f30
	smul	%g7,	0x0AB5,	%g1
	fmovdvs	%icc,	%f30,	%f13
	mova	%xcc,	%o6,	%o0
	ldx	[%l7 + 0x58],	%i2
	movne	%icc,	%i0,	%o3
	fcmpeq16	%f20,	%f26,	%i3
	ldd	[%l7 + 0x70],	%f6
	ld	[%l7 + 0x74],	%f4
	add	%l2,	%l1,	%o1
	sir	0x14DD
	fmovsvs	%xcc,	%f29,	%f22
	movrgez	%i4,	0x31F,	%g4
	fcmple16	%f28,	%f18,	%o2
	mulscc	%g3,	%o5,	%l0
	xnorcc	%o7,	%g5,	%l5
	sir	0x1D72
	sir	0x1461
	edge16ln	%g6,	%o4,	%i5
	movrgez	%i1,	0x295,	%g2
	movrne	%i6,	%i7,	%l4
	sth	%l3,	[%l7 + 0x7E]
	ldd	[%l7 + 0x38],	%i6
	alignaddr	%g7,	%o6,	%g1
	xnor	%i2,	0x1B92,	%o0
	lduh	[%l7 + 0x08],	%o3
	orncc	%i0,	%i3,	%l1
	edge32	%l2,	%i4,	%g4
	fnot2	%f26,	%f20
	srl	%o2,	%o1,	%g3
	orn	%l0,	0x12CD,	%o5
	xorcc	%g5,	0x1E8B,	%l5
	stw	%g6,	[%l7 + 0x64]
	edge32n	%o7,	%i5,	%i1
	subcc	%g2,	0x1A79,	%i6
	andcc	%i7,	%l4,	%l3
	fmovsvc	%icc,	%f9,	%f20
	fmovsn	%icc,	%f22,	%f10
	fpsub16	%f4,	%f4,	%f22
	add	%o4,	0x1312,	%l6
	ldx	[%l7 + 0x48],	%g7
	fsrc1s	%f12,	%f1
	andn	%o6,	0x0019,	%g1
	popc	0x0732,	%i2
	stw	%o0,	[%l7 + 0x4C]
	edge32	%i0,	%o3,	%l1
	subcc	%i3,	0x0F77,	%i4
	mova	%xcc,	%l2,	%o2
	addc	%g4,	0x057F,	%o1
	srax	%l0,	0x1F,	%g3
	movrgez	%g5,	%l5,	%g6
	ldsb	[%l7 + 0x1C],	%o7
	addcc	%i5,	0x0B56,	%o5
	fmovrdgez	%i1,	%f26,	%f4
	movvs	%icc,	%g2,	%i7
	sdiv	%i6,	0x1544,	%l4
	fpack16	%f0,	%f26
	movpos	%icc,	%o4,	%l3
	movrne	%g7,	%o6,	%l6
	sethi	0x0CEE,	%g1
	smul	%o0,	%i2,	%o3
	ldsb	[%l7 + 0x5C],	%l1
	mulx	%i3,	0x1A2A,	%i4
	ldsw	[%l7 + 0x48],	%l2
	movn	%xcc,	%i0,	%o2
	addcc	%o1,	%g4,	%g3
	movrlez	%l0,	0x164,	%g5
	stw	%l5,	[%l7 + 0x14]
	subccc	%o7,	%i5,	%o5
	movl	%xcc,	%g6,	%g2
	movge	%icc,	%i1,	%i6
	movrgez	%l4,	0x296,	%i7
	sir	0x18A1
	edge16n	%o4,	%l3,	%o6
	movrlz	%g7,	0x322,	%g1
	std	%f30,	[%l7 + 0x50]
	fmuld8ulx16	%f28,	%f16,	%f10
	sdivx	%o0,	0x16D7,	%i2
	movl	%icc,	%o3,	%l6
	movcc	%xcc,	%l1,	%i4
	ldx	[%l7 + 0x10],	%i3
	ldsb	[%l7 + 0x45],	%l2
	ldx	[%l7 + 0x38],	%i0
	mova	%xcc,	%o1,	%o2
	srax	%g4,	%l0,	%g5
	fmovdvc	%xcc,	%f17,	%f16
	movleu	%xcc,	%l5,	%o7
	srax	%g3,	0x1B,	%o5
	fmovdvc	%icc,	%f27,	%f12
	sdivcc	%i5,	0x1E81,	%g2
	ldd	[%l7 + 0x18],	%f2
	mulscc	%i1,	%i6,	%g6
	xor	%i7,	0x1AC0,	%o4
	movrne	%l4,	0x3CB,	%o6
	subc	%l3,	%g1,	%o0
	and	%g7,	0x133D,	%o3
	orncc	%i2,	0x1BCC,	%l1
	movcs	%icc,	%l6,	%i4
	fmovsvc	%xcc,	%f9,	%f6
	sdivcc	%i3,	0x1412,	%l2
	fmovsn	%xcc,	%f29,	%f21
	edge32ln	%i0,	%o1,	%o2
	st	%f29,	[%l7 + 0x18]
	movvs	%xcc,	%g4,	%l0
	smulcc	%l5,	%o7,	%g3
	ldsh	[%l7 + 0x7E],	%g5
	edge16l	%o5,	%g2,	%i5
	alignaddr	%i6,	%g6,	%i1
	ldd	[%l7 + 0x38],	%f30
	fnand	%f6,	%f24,	%f8
	xorcc	%o4,	0x0461,	%i7
	mova	%icc,	%l4,	%o6
	ldd	[%l7 + 0x50],	%f26
	array8	%g1,	%o0,	%g7
	stb	%o3,	[%l7 + 0x4D]
	ldsb	[%l7 + 0x21],	%i2
	edge16ln	%l1,	%l3,	%l6
	movrne	%i4,	0x22A,	%l2
	alignaddr	%i3,	%i0,	%o2
	alignaddr	%g4,	%l0,	%l5
	movrlez	%o1,	0x33D,	%o7
	umulcc	%g3,	0x14CF,	%o5
	movneg	%icc,	%g5,	%g2
	fcmpes	%fcc2,	%f24,	%f31
	fmovdvs	%icc,	%f23,	%f24
	fcmpd	%fcc3,	%f26,	%f8
	xor	%i6,	0x1A9B,	%i5
	subccc	%i1,	0x1E52,	%g6
	sub	%i7,	%o4,	%l4
	sth	%g1,	[%l7 + 0x6C]
	fmovrse	%o6,	%f30,	%f10
	movg	%icc,	%o0,	%g7
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	smul	%l3,	%l1,	%i4
	xor	%l6,	0x0A12,	%l2
	movvc	%icc,	%i3,	%o2
	movneg	%xcc,	%i0,	%g4
	mulscc	%l5,	%o1,	%l0
	save %o7, 0x06F7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g5,	0x1B57,	%g3
	fmul8sux16	%f2,	%f12,	%f2
	ld	[%l7 + 0x7C],	%f10
	movpos	%xcc,	%g2,	%i6
	edge32l	%i5,	%g6,	%i7
	orcc	%o4,	%l4,	%i1
	mulscc	%g1,	%o6,	%g7
	fornot1	%f28,	%f4,	%f26
	stw	%o3,	[%l7 + 0x5C]
	add	%i2,	0x0E6E,	%o0
	edge16ln	%l1,	%l3,	%i4
	addccc	%l2,	%i3,	%l6
	subccc	%o2,	%g4,	%l5
	umulcc	%o1,	0x1F04,	%l0
	array8	%o7,	%i0,	%g5
	fands	%f5,	%f15,	%f0
	sethi	0x12BB,	%g3
	orn	%g2,	%o5,	%i5
	andn	%g6,	%i7,	%i6
	movle	%xcc,	%l4,	%i1
	addccc	%g1,	0x07F3,	%o4
	movge	%icc,	%g7,	%o3
	lduw	[%l7 + 0x50],	%o6
	fors	%f2,	%f0,	%f23
	xnorcc	%o0,	%l1,	%i2
	subcc	%l3,	0x0BA0,	%i4
	movre	%i3,	0x1AC,	%l2
	fmovsge	%icc,	%f10,	%f20
	srl	%o2,	%g4,	%l6
	fcmpd	%fcc0,	%f16,	%f10
	fmovsvc	%xcc,	%f16,	%f3
	and	%l5,	0x073B,	%l0
	movre	%o1,	0x1C5,	%o7
	fmovrse	%i0,	%f10,	%f13
	sllx	%g5,	%g2,	%g3
	ld	[%l7 + 0x3C],	%f12
	fmovrdlez	%i5,	%f0,	%f28
	ldd	[%l7 + 0x18],	%g6
	fmovdg	%xcc,	%f20,	%f21
	ldd	[%l7 + 0x10],	%i6
	ldd	[%l7 + 0x50],	%f14
	fmovda	%icc,	%f19,	%f1
	sir	0x0231
	xnorcc	%i6,	%o5,	%i1
	sir	0x1E10
	edge32l	%l4,	%g1,	%g7
	move	%xcc,	%o4,	%o3
	movg	%icc,	%o0,	%o6
	movn	%xcc,	%i2,	%l3
	alignaddrl	%i4,	%i3,	%l1
	xorcc	%l2,	0x186F,	%o2
	nop
	set	0x18, %o1
	sth	%g4,	[%l7 + %o1]
	popc	0x00B2,	%l6
	fmovde	%icc,	%f15,	%f4
	xnorcc	%l0,	%l5,	%o1
	movleu	%icc,	%i0,	%o7
	fmovdvc	%icc,	%f19,	%f28
	lduw	[%l7 + 0x30],	%g5
	smulcc	%g2,	0x0CA7,	%i5
	edge16l	%g6,	%g3,	%i6
	bshuffle	%f28,	%f22,	%f2
	fmovsl	%xcc,	%f4,	%f20
	array32	%o5,	%i1,	%i7
	fmovdle	%xcc,	%f9,	%f10
	ldub	[%l7 + 0x62],	%l4
	fones	%f27
	edge8l	%g7,	%o4,	%g1
	fands	%f19,	%f5,	%f27
	lduw	[%l7 + 0x40],	%o0
	ldsh	[%l7 + 0x2C],	%o3
	xor	%o6,	%l3,	%i4
	fmovsn	%icc,	%f18,	%f31
	sll	%i2,	%i3,	%l1
	fmovrdlz	%o2,	%f6,	%f18
	fcmpne16	%f24,	%f18,	%l2
	fmovdn	%xcc,	%f10,	%f27
	srl	%g4,	0x15,	%l0
	mulx	%l5,	0x04E9,	%l6
	orcc	%o1,	%o7,	%g5
	srlx	%g2,	%i5,	%i0
	bshuffle	%f24,	%f30,	%f22
	movcs	%icc,	%g3,	%g6
	sub	%o5,	0x0112,	%i6
	andn	%i7,	0x114B,	%i1
	srlx	%g7,	0x16,	%o4
	fsrc1s	%f2,	%f19
	ldsw	[%l7 + 0x54],	%g1
	fpadd32s	%f15,	%f30,	%f18
	fornot1s	%f19,	%f7,	%f9
	movg	%xcc,	%l4,	%o3
	mulx	%o6,	0x0622,	%l3
	or	%o0,	0x1CCA,	%i4
	nop
	set	0x40, %o5
	std	%f8,	[%l7 + %o5]
	ldsw	[%l7 + 0x5C],	%i2
	fmovdgu	%xcc,	%f20,	%f2
	smul	%i3,	%o2,	%l1
	fmovdleu	%icc,	%f30,	%f28
	orcc	%l2,	0x1478,	%l0
	save %g4, %l5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o7,	%o1,	%g5
	array8	%i5,	%i0,	%g2
	movpos	%xcc,	%g3,	%g6
	fxor	%f2,	%f14,	%f2
	edge32ln	%i6,	%o5,	%i1
	addcc	%g7,	%i7,	%o4
	mulx	%l4,	0x1EEA,	%o3
	movvs	%xcc,	%o6,	%l3
	lduh	[%l7 + 0x62],	%o0
	lduh	[%l7 + 0x64],	%g1
	mulscc	%i2,	0x1519,	%i4
	fmovsvc	%icc,	%f19,	%f8
	edge16	%i3,	%l1,	%o2
	faligndata	%f30,	%f2,	%f22
	fmovrdlez	%l2,	%f20,	%f26
	movrgez	%l0,	%l5,	%g4
	lduw	[%l7 + 0x4C],	%o7
	move	%xcc,	%o1,	%g5
	subcc	%i5,	0x0866,	%i0
	ldsw	[%l7 + 0x10],	%g2
	faligndata	%f10,	%f4,	%f16
	ldsh	[%l7 + 0x54],	%g3
	sdiv	%l6,	0x1787,	%i6
	ldx	[%l7 + 0x08],	%o5
	movleu	%icc,	%i1,	%g6
	array32	%g7,	%o4,	%i7
	movgu	%xcc,	%o3,	%l4
	fmovdleu	%icc,	%f0,	%f23
	fmul8sux16	%f26,	%f6,	%f0
	edge16	%l3,	%o0,	%g1
	movvc	%xcc,	%i2,	%i4
	movne	%xcc,	%i3,	%o6
	movleu	%icc,	%o2,	%l1
	fmuld8ulx16	%f15,	%f23,	%f6
	fmovsleu	%icc,	%f8,	%f18
	fmovsl	%icc,	%f13,	%f18
	ldd	[%l7 + 0x30],	%l0
	std	%f24,	[%l7 + 0x40]
	movle	%xcc,	%l2,	%g4
	sdivx	%l5,	0x0FFB,	%o1
	fmul8ulx16	%f30,	%f0,	%f6
	fpsub16s	%f26,	%f22,	%f30
	srax	%o7,	0x14,	%i5
	sethi	0x1BA9,	%i0
	fcmpes	%fcc3,	%f27,	%f0
	movrgz	%g5,	0x38A,	%g2
	faligndata	%f18,	%f2,	%f6
	st	%f30,	[%l7 + 0x68]
	fmovrslz	%l6,	%f3,	%f1
	fmovsa	%icc,	%f31,	%f11
	movne	%icc,	%i6,	%o5
	movge	%xcc,	%g3,	%g6
	movneg	%xcc,	%g7,	%o4
	edge8ln	%i7,	%i1,	%l4
	xnorcc	%o3,	0x1598,	%o0
	edge8	%l3,	%g1,	%i2
	movrlz	%i4,	0x2E1,	%o6
	edge16l	%i3,	%o2,	%l1
	fnor	%f18,	%f4,	%f0
	fnegd	%f16,	%f8
	movvs	%xcc,	%l0,	%l2
	fnot2	%f26,	%f28
	addc	%l5,	0x09AA,	%o1
	add	%o7,	%i5,	%g4
	sub	%g5,	%i0,	%l6
	fpack16	%f4,	%f13
	sdivcc	%g2,	0x001F,	%i6
	movrlz	%g3,	0x292,	%o5
	movpos	%xcc,	%g6,	%g7
	edge32l	%i7,	%o4,	%l4
	movre	%i1,	0x0A2,	%o0
	fcmple32	%f0,	%f4,	%o3
	and	%g1,	0x0ADF,	%l3
	array16	%i4,	%o6,	%i2
	subc	%i3,	%l1,	%o2
	andcc	%l2,	%l0,	%o1
	subccc	%l5,	%i5,	%o7
	array32	%g5,	%i0,	%l6
	movleu	%xcc,	%g2,	%i6
	movvs	%icc,	%g4,	%o5
	fsrc1s	%f31,	%f9
	movcs	%icc,	%g3,	%g6
	andcc	%g7,	0x115F,	%o4
	umulcc	%i7,	0x08BF,	%i1
	ldsh	[%l7 + 0x68],	%o0
	ld	[%l7 + 0x1C],	%f18
	movre	%o3,	%l4,	%g1
	movleu	%icc,	%i4,	%l3
	stb	%o6,	[%l7 + 0x76]
	sll	%i3,	0x0B,	%l1
	fcmpgt16	%f16,	%f24,	%i2
	fxors	%f12,	%f25,	%f14
	lduw	[%l7 + 0x68],	%l2
	xnorcc	%o2,	0x0B0D,	%l0
	fandnot1s	%f0,	%f27,	%f6
	fnot1	%f24,	%f14
	srl	%l5,	%i5,	%o7
	udiv	%g5,	0x0F4E,	%i0
	edge8	%l6,	%o1,	%i6
	stx	%g2,	[%l7 + 0x20]
	srl	%g4,	%o5,	%g6
	ldsb	[%l7 + 0x30],	%g7
	fcmpne16	%f22,	%f14,	%g3
	movrgz	%i7,	%o4,	%i1
	popc	%o3,	%l4
	movl	%xcc,	%o0,	%i4
	sll	%l3,	%g1,	%o6
	movne	%icc,	%l1,	%i3
	fcmpeq32	%f18,	%f12,	%i2
	ldsb	[%l7 + 0x3F],	%l2
	pdist	%f28,	%f2,	%f4
	add	%l0,	0x10AE,	%l5
	xnorcc	%i5,	0x1500,	%o2
	lduh	[%l7 + 0x28],	%o7
	and	%g5,	%l6,	%i0
	ldd	[%l7 + 0x70],	%i6
	fmovdl	%icc,	%f31,	%f6
	fmovdpos	%icc,	%f12,	%f0
	stw	%g2,	[%l7 + 0x78]
	movrgez	%g4,	0x159,	%o1
	st	%f21,	[%l7 + 0x18]
	umul	%g6,	0x1841,	%g7
	edge8	%g3,	%i7,	%o4
	edge32l	%i1,	%o5,	%o3
	srax	%l4,	%i4,	%o0
	fmuld8ulx16	%f21,	%f31,	%f20
	movrgz	%g1,	0x0AE,	%o6
	movrgz	%l3,	%l1,	%i2
	fmovsn	%xcc,	%f20,	%f12
	andcc	%i3,	0x030C,	%l2
	fpsub32	%f28,	%f0,	%f28
	smul	%l0,	%l5,	%i5
	ldsh	[%l7 + 0x6E],	%o7
	sll	%g5,	0x0B,	%o2
	fnot2s	%f5,	%f24
	edge16n	%l6,	%i0,	%g2
	ldsw	[%l7 + 0x30],	%g4
	move	%xcc,	%i6,	%g6
	fpack16	%f14,	%f10
	or	%o1,	0x13C7,	%g3
	edge8	%g7,	%o4,	%i7
	array16	%o5,	%o3,	%i1
	movcc	%icc,	%l4,	%i4
	stw	%g1,	[%l7 + 0x08]
	bshuffle	%f18,	%f28,	%f24
	pdist	%f4,	%f14,	%f6
	movleu	%xcc,	%o0,	%l3
	sth	%l1,	[%l7 + 0x52]
	sll	%o6,	0x17,	%i3
	fcmpne16	%f28,	%f20,	%l2
	edge32ln	%i2,	%l0,	%i5
	array8	%l5,	%o7,	%o2
	fmovda	%icc,	%f2,	%f19
	andncc	%l6,	%i0,	%g5
	fnot1s	%f2,	%f23
	array16	%g2,	%i6,	%g6
	st	%f24,	[%l7 + 0x64]
	xor	%g4,	0x0FFF,	%o1
	mulx	%g3,	%o4,	%g7
	umul	%i7,	%o3,	%o5
	array32	%i1,	%i4,	%g1
	ldx	[%l7 + 0x40],	%l4
	stw	%o0,	[%l7 + 0x2C]
	ldd	[%l7 + 0x28],	%l2
	orcc	%o6,	%l1,	%i3
	st	%f31,	[%l7 + 0x74]
	fpsub16	%f28,	%f10,	%f22
	fmovdneg	%xcc,	%f7,	%f20
	xnorcc	%i2,	0x0378,	%l0
	movcs	%icc,	%l2,	%i5
	movvs	%xcc,	%l5,	%o7
	edge32n	%l6,	%i0,	%g5
	fnegs	%f5,	%f16
	ldsh	[%l7 + 0x56],	%g2
	lduw	[%l7 + 0x58],	%i6
	sir	0x0666
	srlx	%o2,	0x11,	%g6
	sethi	0x1935,	%o1
	mulx	%g3,	0x14AB,	%g4
	edge8l	%o4,	%i7,	%g7
	ldub	[%l7 + 0x36],	%o5
	sir	0x0223
	ldub	[%l7 + 0x3E],	%i1
	lduh	[%l7 + 0x0C],	%i4
	movge	%icc,	%o3,	%g1
	alignaddr	%l4,	%l3,	%o0
	fmul8sux16	%f22,	%f4,	%f10
	and	%l1,	%o6,	%i2
	umul	%i3,	0x19B5,	%l0
	orncc	%i5,	%l2,	%l5
	array8	%l6,	%i0,	%g5
	xnor	%o7,	%i6,	%o2
	stx	%g6,	[%l7 + 0x20]
	fmul8sux16	%f12,	%f2,	%f28
	andcc	%g2,	0x085C,	%o1
	fmovdle	%xcc,	%f0,	%f11
	array32	%g3,	%o4,	%i7
	edge32n	%g7,	%g4,	%o5
	lduh	[%l7 + 0x6A],	%i4
	movne	%icc,	%i1,	%g1
	sra	%l4,	%l3,	%o0
	umulcc	%l1,	0x1537,	%o6
	orncc	%o3,	%i2,	%l0
	ldd	[%l7 + 0x28],	%f24
	srl	%i5,	%l2,	%l5
	fcmpes	%fcc0,	%f19,	%f1
	save %i3, %l6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i0,	0x30B,	%i6
	srlx	%o7,	%o2,	%g6
	movrlez	%o1,	0x1E8,	%g2
	alignaddrl	%o4,	%i7,	%g7
	fmovscc	%icc,	%f18,	%f12
	stb	%g4,	[%l7 + 0x27]
	srlx	%o5,	%g3,	%i1
	sth	%g1,	[%l7 + 0x14]
	umul	%l4,	%l3,	%o0
	fmovdle	%icc,	%f1,	%f4
	andcc	%i4,	0x1E6B,	%o6
	edge16	%o3,	%l1,	%i2
	movrne	%l0,	%i5,	%l2
	movvc	%icc,	%i3,	%l5
	restore %l6, %i0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o7,	%i6,	%g6
	ldsb	[%l7 + 0x40],	%o2
	andn	%g2,	%o1,	%o4
	subccc	%i7,	0x158F,	%g7
	movrlz	%o5,	%g3,	%g4
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f12
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	edge8	%i1,	%i4,	%o6
	sdivcc	%o3,	0x1EF5,	%o0
	fandnot2	%f8,	%f28,	%f22
	subcc	%i2,	0x170C,	%l1
	std	%f28,	[%l7 + 0x08]
	edge8ln	%l0,	%i5,	%i3
	udiv	%l2,	0x0CAD,	%l6
	smul	%l5,	0x017C,	%g5
	fxors	%f28,	%f0,	%f21
	xnor	%o7,	0x15E0,	%i6
	udiv	%g6,	0x01E0,	%o2
	ld	[%l7 + 0x74],	%f18
	popc	0x01E7,	%g2
	mova	%icc,	%o1,	%i0
	movgu	%icc,	%i7,	%o4
	fpack16	%f12,	%f17
	orcc	%o5,	%g3,	%g7
	fornot1	%f30,	%f8,	%f28
	lduh	[%l7 + 0x50],	%g1
	addccc	%g4,	%l4,	%l3
	udivcc	%i1,	0x1547,	%i4
	ldd	[%l7 + 0x58],	%o6
	st	%f12,	[%l7 + 0x3C]
	fmovrsne	%o0,	%f0,	%f31
	fabss	%f5,	%f5
	sll	%o3,	0x01,	%l1
	movrgez	%l0,	0x1FA,	%i5
	ldsw	[%l7 + 0x4C],	%i2
	array32	%l2,	%i3,	%l5
	array32	%g5,	%o7,	%i6
	sllx	%l6,	0x1B,	%o2
	addc	%g6,	%o1,	%g2
	add	%i7,	%o4,	%o5
	edge16ln	%i0,	%g7,	%g3
	fmovdcs	%icc,	%f31,	%f18
	edge16n	%g1,	%g4,	%l4
	fand	%f16,	%f4,	%f8
	xor	%i1,	%i4,	%o6
	umul	%o0,	0x072A,	%l3
	fnors	%f30,	%f5,	%f11
	fmovdn	%icc,	%f2,	%f8
	fexpand	%f7,	%f20
	movrgez	%l1,	%l0,	%o3
	sth	%i5,	[%l7 + 0x36]
	orcc	%l2,	0x0C20,	%i3
	umulcc	%i2,	0x0680,	%g5
	ld	[%l7 + 0x7C],	%f10
	sdivcc	%l5,	0x0F76,	%o7
	alignaddr	%l6,	%o2,	%i6
	lduw	[%l7 + 0x48],	%o1
	movrne	%g6,	%g2,	%i7
	edge16l	%o4,	%o5,	%g7
	fcmped	%fcc0,	%f22,	%f10
	fmul8x16au	%f19,	%f11,	%f10
	orn	%i0,	%g3,	%g1
	xorcc	%g4,	0x1553,	%l4
	fcmpgt16	%f8,	%f16,	%i4
	mulx	%i1,	0x1511,	%o6
	sll	%o0,	%l3,	%l1
	save %o3, 0x1470, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i5,	%i3,	%i2
	smulcc	%l2,	%g5,	%o7
	edge16ln	%l6,	%l5,	%o2
	sethi	0x0FA4,	%o1
	ldd	[%l7 + 0x50],	%g6
	edge16	%g2,	%i6,	%o4
	edge8n	%o5,	%i7,	%g7
	edge32ln	%g3,	%i0,	%g4
	udiv	%g1,	0x1D64,	%l4
	lduh	[%l7 + 0x3C],	%i1
	edge16ln	%o6,	%i4,	%o0
	movg	%xcc,	%l1,	%o3
	fandnot1s	%f0,	%f0,	%f16
	ldsb	[%l7 + 0x0E],	%l3
	stw	%i5,	[%l7 + 0x34]
	alignaddrl	%l0,	%i3,	%i2
	fmovdcs	%icc,	%f12,	%f25
	movrne	%l2,	0x056,	%o7
	movre	%l6,	%l5,	%o2
	fmovdn	%xcc,	%f9,	%f23
	fmovdleu	%xcc,	%f29,	%f3
	sll	%o1,	%g6,	%g2
	fmovrslez	%g5,	%f18,	%f12
	ldsh	[%l7 + 0x12],	%o4
	sdivcc	%o5,	0x1BD6,	%i7
	smulcc	%i6,	0x097D,	%g3
	sll	%g7,	0x0C,	%g4
	fors	%f26,	%f6,	%f20
	edge8n	%g1,	%l4,	%i0
	orcc	%i1,	%o6,	%o0
	ldsw	[%l7 + 0x58],	%l1
	lduh	[%l7 + 0x16],	%i4
	lduw	[%l7 + 0x44],	%o3
	fmovdneg	%xcc,	%f17,	%f15
	sll	%i5,	0x09,	%l3
	addcc	%l0,	%i3,	%i2
	edge32l	%l2,	%o7,	%l5
	edge8n	%o2,	%l6,	%g6
	umul	%g2,	0x0C6E,	%o1
	lduw	[%l7 + 0x3C],	%g5
	lduh	[%l7 + 0x56],	%o5
	mova	%xcc,	%o4,	%i7
	andcc	%g3,	0x0008,	%g7
	sdivcc	%g4,	0x1C94,	%g1
	stw	%i6,	[%l7 + 0x6C]
	fone	%f6
	movrne	%l4,	%i0,	%i1
	edge32	%o0,	%l1,	%o6
	sdiv	%i4,	0x1FC1,	%o3
	ldsh	[%l7 + 0x1A],	%l3
	fpadd16	%f6,	%f6,	%f18
	std	%f16,	[%l7 + 0x30]
	or	%l0,	%i3,	%i2
	fors	%f26,	%f30,	%f10
	sllx	%l2,	%i5,	%o7
	stw	%o2,	[%l7 + 0x3C]
	save %l5, 0x1B13, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g2,	%l6,	%o1
	sll	%o5,	%g5,	%i7
	movrgz	%o4,	%g3,	%g7
	edge32	%g1,	%i6,	%g4
	mova	%xcc,	%i0,	%l4
	xnorcc	%i1,	%o0,	%l1
	edge16	%i4,	%o3,	%l3
	movge	%icc,	%o6,	%l0
	srax	%i2,	%l2,	%i5
	fmovsleu	%xcc,	%f22,	%f9
	st	%f10,	[%l7 + 0x5C]
	xorcc	%i3,	%o7,	%o2
	stw	%g6,	[%l7 + 0x3C]
	array8	%g2,	%l6,	%l5
	fmovdvc	%icc,	%f19,	%f31
	addccc	%o1,	%o5,	%i7
	fcmps	%fcc1,	%f18,	%f16
	fmovse	%xcc,	%f8,	%f31
	fmovdge	%icc,	%f13,	%f8
	fornot1	%f26,	%f2,	%f30
	fpsub32s	%f10,	%f18,	%f8
	ldub	[%l7 + 0x58],	%o4
	movrgz	%g5,	%g3,	%g7
	movneg	%xcc,	%i6,	%g4
	fmovsl	%icc,	%f9,	%f10
	movre	%i0,	%l4,	%g1
	fpsub16	%f6,	%f0,	%f22
	fcmps	%fcc0,	%f31,	%f28
	addc	%i1,	%o0,	%i4
	and	%l1,	0x018A,	%o3
	movge	%xcc,	%l3,	%l0
	movre	%i2,	0x31B,	%l2
	movrlz	%i5,	0x27F,	%i3
	smulcc	%o7,	0x0550,	%o2
	fnot2	%f2,	%f16
	movre	%g6,	%o6,	%l6
	movvc	%xcc,	%g2,	%o1
	save %o5, 0x06C0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%g5,	%l5
	siam	0x5
	movg	%xcc,	%g3,	%i6
	sub	%g7,	0x1D63,	%i0
	fmovde	%xcc,	%f25,	%f2
	addccc	%l4,	0x0093,	%g4
	movvs	%xcc,	%g1,	%i1
	sdivx	%o0,	0x165C,	%l1
	nop
	set	0x54, %l6
	ldsh	[%l7 + %l6],	%i4
	addccc	%o3,	%l3,	%i2
	addc	%l2,	%i5,	%i3
	sir	0x11A7
	addccc	%o7,	%o2,	%g6
	edge32n	%o6,	%l0,	%l6
	fnand	%f24,	%f20,	%f20
	xnor	%g2,	0x02D9,	%o1
	ldub	[%l7 + 0x60],	%o5
	sir	0x0924
	lduh	[%l7 + 0x3E],	%i7
	smul	%g5,	0x0D0B,	%o4
	edge8	%g3,	%i6,	%g7
	fmul8x16au	%f1,	%f30,	%f0
	save %l5, %i0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g1,	0x1CA2,	%i1
	and	%o0,	0x1022,	%g4
	restore %i4, %o3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%i2,	%f8,	%f21
	xnor	%l2,	%i5,	%i3
	fmovsn	%icc,	%f16,	%f15
	movvs	%icc,	%l1,	%o2
	edge16	%g6,	%o6,	%o7
	fzero	%f24
	array32	%l6,	%l0,	%g2
	movgu	%icc,	%o1,	%i7
	edge8l	%g5,	%o4,	%o5
	xnorcc	%i6,	0x0D01,	%g7
	fnot1	%f8,	%f22
	st	%f29,	[%l7 + 0x0C]
	fcmpgt16	%f6,	%f8,	%g3
	movrgez	%i0,	0x380,	%l5
	movrgez	%l4,	%i1,	%o0
	fnot2s	%f5,	%f1
	movpos	%xcc,	%g1,	%g4
	fpadd16s	%f13,	%f1,	%f17
	movl	%xcc,	%i4,	%l3
	fcmpgt32	%f22,	%f28,	%i2
	fpsub32s	%f0,	%f9,	%f31
	movvc	%icc,	%o3,	%i5
	sra	%l2,	0x1C,	%i3
	movre	%o2,	%g6,	%o6
	lduh	[%l7 + 0x48],	%l1
	or	%o7,	0x1738,	%l0
	edge16	%g2,	%l6,	%o1
	movpos	%icc,	%i7,	%o4
	subccc	%g5,	%i6,	%o5
	fmovd	%f26,	%f2
	movleu	%icc,	%g3,	%g7
	movgu	%xcc,	%i0,	%l4
	fmul8sux16	%f24,	%f28,	%f30
	edge8ln	%l5,	%o0,	%g1
	pdist	%f22,	%f2,	%f20
	movneg	%icc,	%g4,	%i1
	ldub	[%l7 + 0x25],	%l3
	sdiv	%i4,	0x19D2,	%i2
	orn	%o3,	%l2,	%i5
	edge32	%i3,	%g6,	%o2
	addccc	%o6,	0x0DBA,	%o7
	sir	0x1D83
	ldd	[%l7 + 0x30],	%f6
	movrlez	%l0,	%l1,	%g2
	fnors	%f24,	%f24,	%f22
	and	%l6,	0x048D,	%i7
	popc	0x0E83,	%o1
	smul	%g5,	0x05CB,	%o4
	fmovsl	%icc,	%f5,	%f22
	fnegd	%f30,	%f2
	edge16n	%o5,	%g3,	%g7
	sll	%i6,	%i0,	%l4
	alignaddr	%l5,	%g1,	%o0
	sdiv	%g4,	0x19FF,	%l3
	umulcc	%i4,	0x005E,	%i1
	ldub	[%l7 + 0x3F],	%o3
	fmovdneg	%xcc,	%f7,	%f22
	andcc	%i2,	0x0865,	%l2
	st	%f3,	[%l7 + 0x48]
	fnegd	%f0,	%f8
	edge8n	%i3,	%i5,	%o2
	fmovdvs	%xcc,	%f31,	%f1
	mulscc	%o6,	0x1862,	%g6
	pdist	%f16,	%f0,	%f8
	fmovs	%f13,	%f16
	movn	%icc,	%o7,	%l1
	move	%icc,	%l0,	%g2
	fands	%f14,	%f19,	%f9
	udivcc	%i7,	0x05E5,	%l6
	orn	%g5,	%o1,	%o5
	movrne	%g3,	%g7,	%i6
	movneg	%icc,	%o4,	%i0
	alignaddrl	%l4,	%l5,	%o0
	movle	%xcc,	%g1,	%g4
	mulscc	%i4,	%l3,	%i1
	smulcc	%i2,	%o3,	%l2
	movcc	%xcc,	%i3,	%i5
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	andncc	%o7,	%l0,	%l1
	ldsh	[%l7 + 0x12],	%g2
	ldsb	[%l7 + 0x3D],	%i7
	alignaddrl	%l6,	%o1,	%o5
	sub	%g3,	%g7,	%i6
	edge16n	%g5,	%o4,	%l4
	fnot2s	%f24,	%f5
	and	%l5,	%o0,	%g1
	mova	%xcc,	%i0,	%g4
	umulcc	%l3,	%i1,	%i2
	ld	[%l7 + 0x10],	%f25
	popc	0x19A4,	%o3
	stw	%l2,	[%l7 + 0x14]
	fmovrde	%i4,	%f8,	%f30
	movrgez	%i5,	0x2DB,	%i3
	ldsw	[%l7 + 0x34],	%o6
	edge8n	%g6,	%o2,	%l0
	edge8l	%l1,	%o7,	%i7
	fmovdvc	%xcc,	%f21,	%f5
	fmovsge	%icc,	%f16,	%f8
	movcc	%xcc,	%l6,	%o1
	fmovscs	%xcc,	%f27,	%f25
	fmul8x16	%f22,	%f16,	%f12
	ldsh	[%l7 + 0x2E],	%g2
	fcmpgt32	%f20,	%f24,	%o5
	addcc	%g3,	%g7,	%g5
	ldx	[%l7 + 0x10],	%i6
	edge8l	%l4,	%l5,	%o4
	subc	%g1,	%i0,	%g4
	smulcc	%o0,	%l3,	%i2
	fmovrdgz	%o3,	%f6,	%f28
	alignaddr	%i1,	%i4,	%i5
	array16	%l2,	%i3,	%o6
	orn	%o2,	%g6,	%l0
	stx	%l1,	[%l7 + 0x50]
	ldx	[%l7 + 0x70],	%o7
	andn	%i7,	0x0942,	%o1
	and	%g2,	0x0C86,	%l6
	movgu	%icc,	%o5,	%g7
	lduw	[%l7 + 0x24],	%g5
	fors	%f21,	%f30,	%f16
	andncc	%i6,	%g3,	%l5
	movvs	%xcc,	%l4,	%g1
	edge8l	%i0,	%o4,	%g4
	fpack32	%f22,	%f26,	%f24
	movneg	%icc,	%o0,	%l3
	lduw	[%l7 + 0x54],	%i2
	orn	%i1,	%i4,	%i5
	ldsh	[%l7 + 0x68],	%l2
	movcs	%xcc,	%o3,	%o6
	or	%o2,	%g6,	%i3
	mulx	%l0,	0x0CD9,	%l1
	umul	%o7,	%o1,	%g2
	fmuld8ulx16	%f14,	%f17,	%f10
	fmovdvc	%xcc,	%f16,	%f13
	fmovscc	%xcc,	%f5,	%f12
	fmovrdgz	%l6,	%f2,	%f0
	andcc	%o5,	0x15CC,	%g7
	movgu	%xcc,	%i7,	%g5
	array8	%i6,	%l5,	%l4
	array8	%g1,	%g3,	%o4
	subccc	%i0,	%g4,	%o0
	andncc	%l3,	%i2,	%i1
	udivx	%i5,	0x01D7,	%l2
	movcc	%icc,	%i4,	%o3
	ldub	[%l7 + 0x4B],	%o6
	movne	%xcc,	%g6,	%o2
	popc	%l0,	%l1
	fnor	%f26,	%f6,	%f10
	movne	%icc,	%i3,	%o1
	movcc	%xcc,	%o7,	%g2
	array16	%l6,	%g7,	%i7
	xorcc	%g5,	0x1B99,	%o5
	movgu	%icc,	%i6,	%l5
	sllx	%g1,	%l4,	%o4
	sdivcc	%i0,	0x1EB2,	%g3
	edge32n	%o0,	%g4,	%i2
	ldsb	[%l7 + 0x2A],	%i1
	ldub	[%l7 + 0x41],	%l3
	mova	%xcc,	%i5,	%i4
	movne	%icc,	%o3,	%l2
	fornot2	%f8,	%f2,	%f4
	fmovsn	%xcc,	%f4,	%f16
	ldx	[%l7 + 0x50],	%g6
	edge16	%o2,	%o6,	%l0
	fmovsne	%icc,	%f15,	%f28
	ldd	[%l7 + 0x40],	%i2
	addc	%l1,	%o7,	%o1
	nop
	set	0x40, %i6
	std	%f26,	[%l7 + %i6]
	fmovdpos	%xcc,	%f0,	%f24
	edge16	%l6,	%g7,	%g2
	move	%icc,	%i7,	%g5
	srlx	%o5,	%i6,	%g1
	fmovsgu	%xcc,	%f8,	%f20
	array32	%l4,	%o4,	%l5
	fmovsgu	%icc,	%f14,	%f10
	edge32ln	%g3,	%o0,	%i0
	andn	%g4,	%i2,	%l3
	st	%f6,	[%l7 + 0x78]
	fxors	%f30,	%f21,	%f9
	sth	%i5,	[%l7 + 0x5E]
	ldsw	[%l7 + 0x58],	%i1
	smulcc	%o3,	%i4,	%l2
	fandnot1	%f26,	%f24,	%f30
	xor	%g6,	%o2,	%o6
	nop
	set	0x0A, %l3
	ldsh	[%l7 + %l3],	%l0
	sdivx	%i3,	0x184E,	%l1
	sir	0x1766
	edge16n	%o1,	%o7,	%l6
	movge	%icc,	%g2,	%g7
	edge16	%g5,	%o5,	%i6
	movl	%icc,	%i7,	%g1
	umulcc	%l4,	0x0A74,	%o4
	sdivx	%l5,	0x093E,	%o0
	fnot1s	%f20,	%f11
	fpackfix	%f14,	%f16
	mova	%xcc,	%i0,	%g4
	addc	%g3,	%i2,	%l3
	movcs	%icc,	%i5,	%o3
	alignaddrl	%i4,	%i1,	%l2
	edge8	%o2,	%g6,	%l0
	edge16	%i3,	%o6,	%l1
	fmovrdlez	%o7,	%f6,	%f4
	stx	%o1,	[%l7 + 0x10]
	srlx	%l6,	0x04,	%g2
	sll	%g7,	0x0B,	%g5
	alignaddr	%i6,	%o5,	%i7
	edge16	%g1,	%l4,	%l5
	mulscc	%o4,	0x0146,	%o0
	movl	%xcc,	%g4,	%i0
	sir	0x1381
	fors	%f4,	%f0,	%f14
	ldx	[%l7 + 0x78],	%i2
	move	%xcc,	%l3,	%g3
	and	%i5,	0x1DE1,	%o3
	mova	%xcc,	%i4,	%l2
	udiv	%i1,	0x0313,	%g6
	alignaddr	%o2,	%l0,	%i3
	fmul8x16au	%f16,	%f3,	%f4
	fpadd32s	%f14,	%f8,	%f15
	fmovrse	%o6,	%f17,	%f21
	fnegs	%f8,	%f7
	and	%l1,	%o7,	%o1
	fzeros	%f17
	sethi	0x012A,	%l6
	fpsub32s	%f21,	%f28,	%f19
	edge16	%g2,	%g7,	%i6
	smulcc	%o5,	%g5,	%g1
	movg	%xcc,	%l4,	%i7
	fmovrsgez	%l5,	%f18,	%f31
	orn	%o0,	%g4,	%i0
	fmovrsgez	%i2,	%f17,	%f27
	srlx	%l3,	%o4,	%i5
	srlx	%g3,	%o3,	%i4
	lduh	[%l7 + 0x6A],	%l2
	ldx	[%l7 + 0x40],	%i1
	popc	0x045A,	%g6
	sethi	0x0E9C,	%o2
	fmul8x16al	%f21,	%f8,	%f28
	sir	0x1858
	edge8l	%i3,	%l0,	%l1
	ldd	[%l7 + 0x70],	%o6
	fmul8x16al	%f3,	%f2,	%f16
	movg	%icc,	%o6,	%l6
	movrgez	%o1,	0x294,	%g7
	fmovsge	%icc,	%f4,	%f9
	orncc	%g2,	%i6,	%o5
	udivx	%g1,	0x0154,	%g5
	fmovdl	%xcc,	%f16,	%f19
	umul	%l4,	%l5,	%i7
	fmovrse	%o0,	%f28,	%f23
	smul	%i0,	%g4,	%l3
	addccc	%o4,	0x028D,	%i5
	sra	%g3,	0x08,	%o3
	stx	%i4,	[%l7 + 0x58]
	subc	%l2,	%i1,	%i2
	subccc	%o2,	%g6,	%l0
	movrgez	%i3,	0x145,	%o7
	nop
	set	0x34, %i3
	lduw	[%l7 + %i3],	%l1
	edge32	%l6,	%o6,	%g7
	movleu	%xcc,	%g2,	%i6
	sra	%o1,	0x16,	%g1
	sll	%g5,	%l4,	%o5
	addccc	%i7,	0x07D2,	%o0
	array16	%l5,	%i0,	%g4
	srlx	%o4,	%i5,	%l3
	stw	%g3,	[%l7 + 0x10]
	srax	%i4,	0x0F,	%o3
	edge8l	%l2,	%i1,	%o2
	fabss	%f5,	%f0
	sub	%g6,	0x0C66,	%l0
	ldsw	[%l7 + 0x78],	%i3
	st	%f27,	[%l7 + 0x74]
	andcc	%i2,	0x1409,	%l1
	fmovdg	%xcc,	%f22,	%f3
	movgu	%xcc,	%o7,	%o6
	sll	%g7,	0x19,	%g2
	mova	%xcc,	%l6,	%i6
	sra	%o1,	%g1,	%l4
	fcmps	%fcc3,	%f19,	%f12
	srax	%o5,	%i7,	%g5
	udivx	%o0,	0x0717,	%i0
	addc	%l5,	%o4,	%i5
	fandnot1s	%f23,	%f11,	%f10
	edge16l	%g4,	%l3,	%i4
	fpadd32s	%f27,	%f9,	%f17
	fmovsleu	%icc,	%f28,	%f5
	mulscc	%o3,	%g3,	%l2
	move	%xcc,	%i1,	%g6
	fmovrdgz	%l0,	%f22,	%f4
	sdivx	%o2,	0x10B2,	%i3
	movre	%i2,	0x081,	%o7
	orn	%o6,	0x03E2,	%l1
	orcc	%g7,	0x0339,	%l6
	smulcc	%i6,	%o1,	%g1
	edge16	%g2,	%o5,	%l4
	array8	%g5,	%o0,	%i0
	movgu	%icc,	%l5,	%i7
	alignaddr	%i5,	%o4,	%l3
	subc	%g4,	0x08A4,	%o3
	move	%icc,	%i4,	%g3
	edge16l	%i1,	%l2,	%l0
	sdivx	%o2,	0x0D51,	%i3
	xnor	%i2,	%o7,	%g6
	movl	%xcc,	%o6,	%l1
	fxors	%f14,	%f12,	%f23
	std	%f12,	[%l7 + 0x20]
	subccc	%g7,	0x1538,	%i6
	xor	%o1,	0x1BBC,	%l6
	addccc	%g1,	%o5,	%g2
	movrgz	%l4,	0x154,	%o0
	fpackfix	%f6,	%f1
	ldd	[%l7 + 0x50],	%f14
	movvc	%icc,	%i0,	%l5
	movrgez	%g5,	0x147,	%i5
	edge32l	%i7,	%l3,	%o4
	sll	%o3,	%g4,	%g3
	ldd	[%l7 + 0x20],	%f18
	movg	%icc,	%i4,	%l2
	subcc	%i1,	0x046B,	%o2
	edge16l	%l0,	%i2,	%i3
	fmovspos	%icc,	%f20,	%f22
	movrlz	%o7,	%o6,	%g6
	srlx	%l1,	0x0C,	%g7
	movle	%xcc,	%i6,	%o1
	and	%l6,	%o5,	%g1
	stb	%l4,	[%l7 + 0x62]
	fmovrslez	%o0,	%f4,	%f8
	movn	%xcc,	%i0,	%l5
	fornot2s	%f7,	%f16,	%f7
	movn	%icc,	%g5,	%i5
	edge16n	%i7,	%l3,	%g2
	or	%o3,	0x09AB,	%o4
	ldsw	[%l7 + 0x3C],	%g4
	movcc	%xcc,	%g3,	%i4
	ldd	[%l7 + 0x60],	%l2
	fmovdle	%xcc,	%f22,	%f25
	andcc	%o2,	0x1454,	%i1
	fcmped	%fcc3,	%f18,	%f16
	sir	0x0441
	fmovdne	%xcc,	%f18,	%f18
	stx	%l0,	[%l7 + 0x40]
	stx	%i3,	[%l7 + 0x20]
	edge8ln	%i2,	%o7,	%g6
	movre	%o6,	%l1,	%g7
	smul	%o1,	0x1E92,	%l6
	st	%f23,	[%l7 + 0x18]
	fmul8x16al	%f13,	%f2,	%f2
	fmovda	%xcc,	%f9,	%f22
	lduh	[%l7 + 0x56],	%o5
	fmovsgu	%xcc,	%f10,	%f24
	fnand	%f22,	%f22,	%f2
	ldd	[%l7 + 0x20],	%f8
	fcmpgt32	%f10,	%f30,	%g1
	alignaddrl	%i6,	%o0,	%i0
	udivcc	%l5,	0x19AC,	%l4
	xor	%g5,	0x0BA4,	%i5
	mova	%icc,	%l3,	%i7
	fpsub16	%f16,	%f14,	%f16
	umul	%o3,	0x17B1,	%g2
	movpos	%icc,	%g4,	%o4
	or	%i4,	%l2,	%g3
	sth	%o2,	[%l7 + 0x4C]
	and	%i1,	0x1E38,	%i3
	sllx	%l0,	%i2,	%o7
	fmovrsgez	%g6,	%f25,	%f28
	edge32ln	%o6,	%l1,	%g7
	xor	%o1,	%o5,	%g1
	xor	%l6,	%o0,	%i6
	movgu	%xcc,	%i0,	%l4
	smul	%l5,	%g5,	%l3
	and	%i5,	%o3,	%i7
	fzeros	%f6
	movpos	%icc,	%g4,	%g2
	movrgz	%i4,	%o4,	%g3
	srl	%l2,	0x18,	%i1
	sth	%i3,	[%l7 + 0x2E]
	edge8n	%o2,	%l0,	%o7
	fmovrse	%i2,	%f21,	%f25
	udivcc	%o6,	0x0416,	%l1
	subc	%g6,	0x027C,	%g7
	array32	%o1,	%g1,	%o5
	fmul8x16au	%f4,	%f15,	%f12
	movrgz	%l6,	%i6,	%o0
	xor	%i0,	0x199E,	%l5
	move	%icc,	%g5,	%l4
	fpack16	%f8,	%f11
	subcc	%i5,	%o3,	%l3
	movrgez	%g4,	0x364,	%g2
	mulscc	%i4,	%o4,	%i7
	sdiv	%g3,	0x1463,	%l2
	srlx	%i3,	%o2,	%l0
	movge	%icc,	%o7,	%i1
	st	%f3,	[%l7 + 0x50]
	movl	%xcc,	%i2,	%l1
	nop
	set	0x24, %l2
	ldub	[%l7 + %l2],	%g6
	orcc	%g7,	0x0BAA,	%o6
	sub	%g1,	%o5,	%o1
	lduw	[%l7 + 0x48],	%l6
	sethi	0x0A97,	%i6
	alignaddrl	%i0,	%l5,	%g5
	array32	%o0,	%l4,	%i5
	addccc	%l3,	%g4,	%o3
	sdivcc	%g2,	0x0AD8,	%i4
	popc	%o4,	%i7
	alignaddrl	%l2,	%g3,	%o2
	fnot2s	%f25,	%f14
	siam	0x6
	fmovse	%xcc,	%f18,	%f5
	mova	%xcc,	%l0,	%o7
	edge32ln	%i3,	%i2,	%l1
	movrlez	%g6,	0x012,	%i1
	movleu	%xcc,	%g7,	%g1
	fmul8ulx16	%f20,	%f4,	%f24
	subcc	%o6,	%o1,	%o5
	fzero	%f16
	addc	%i6,	0x1D4B,	%i0
	edge8ln	%l6,	%g5,	%l5
	movre	%l4,	0x25F,	%o0
	ldd	[%l7 + 0x68],	%f30
	movpos	%icc,	%i5,	%l3
	fcmple32	%f2,	%f6,	%g4
	xnor	%o3,	%g2,	%o4
	subccc	%i7,	%l2,	%g3
	stb	%o2,	[%l7 + 0x69]
	edge32l	%l0,	%i4,	%o7
	xnorcc	%i2,	%i3,	%l1
	fmovspos	%xcc,	%f12,	%f8
	fand	%f20,	%f22,	%f22
	andcc	%i1,	%g6,	%g1
	movne	%icc,	%g7,	%o6
	fzeros	%f19
	andcc	%o5,	%i6,	%o1
	orcc	%i0,	%g5,	%l5
	movrne	%l6,	%o0,	%i5
	sethi	0x10EB,	%l3
	addccc	%g4,	%o3,	%g2
	movn	%icc,	%o4,	%i7
	ldsh	[%l7 + 0x46],	%l4
	array8	%l2,	%g3,	%l0
	lduw	[%l7 + 0x50],	%o2
	fabsd	%f6,	%f16
	edge8l	%o7,	%i4,	%i2
	subc	%l1,	0x1B40,	%i1
	edge32ln	%g6,	%g1,	%i3
	and	%g7,	%o6,	%o5
	or	%i6,	%o1,	%g5
	or	%l5,	0x0F67,	%i0
	stb	%o0,	[%l7 + 0x14]
	xorcc	%l6,	0x01C1,	%l3
	movleu	%xcc,	%g4,	%i5
	udivcc	%o3,	0x0113,	%o4
	movcc	%icc,	%i7,	%g2
	umul	%l2,	0x05B0,	%g3
	ldx	[%l7 + 0x48],	%l4
	fmovrdgez	%l0,	%f10,	%f8
	orncc	%o2,	0x079A,	%o7
	movrlz	%i4,	%i2,	%l1
	udivx	%i1,	0x0DBB,	%g1
	edge16ln	%i3,	%g7,	%o6
	movrlez	%g6,	0x0AB,	%i6
	edge16ln	%o5,	%o1,	%g5
	movle	%icc,	%l5,	%o0
	fxor	%f20,	%f30,	%f12
	lduw	[%l7 + 0x74],	%i0
	movvs	%xcc,	%l3,	%l6
	lduw	[%l7 + 0x48],	%g4
	addcc	%i5,	0x1D1A,	%o3
	andcc	%o4,	0x00AD,	%i7
	movn	%xcc,	%l2,	%g2
	umulcc	%l4,	%l0,	%o2
	array8	%g3,	%o7,	%i2
	lduw	[%l7 + 0x1C],	%i4
	fmul8x16au	%f24,	%f4,	%f24
	fpsub16s	%f28,	%f29,	%f7
	fpsub32s	%f25,	%f13,	%f14
	movg	%icc,	%l1,	%g1
	movge	%icc,	%i3,	%g7
	std	%f18,	[%l7 + 0x08]
	fmovdge	%xcc,	%f21,	%f18
	movvc	%icc,	%i1,	%g6
	movleu	%icc,	%i6,	%o5
	sdiv	%o1,	0x05EF,	%o6
	fmovsvs	%xcc,	%f29,	%f30
	subccc	%g5,	%o0,	%i0
	movleu	%icc,	%l5,	%l3
	stx	%l6,	[%l7 + 0x30]
	fmovdneg	%icc,	%f29,	%f19
	movre	%i5,	0x0C3,	%g4
	edge32l	%o3,	%o4,	%i7
	move	%icc,	%l2,	%l4
	sub	%l0,	%o2,	%g3
	alignaddr	%o7,	%i2,	%g2
	or	%i4,	%g1,	%l1
	lduh	[%l7 + 0x62],	%g7
	ldsw	[%l7 + 0x70],	%i3
	edge8n	%i1,	%i6,	%g6
	movneg	%xcc,	%o1,	%o6
	andn	%o5,	0x1AF0,	%g5
	ldd	[%l7 + 0x50],	%f0
	fmovdg	%icc,	%f5,	%f27
	std	%f4,	[%l7 + 0x50]
	edge16l	%o0,	%i0,	%l3
	edge16ln	%l6,	%l5,	%g4
	fmuld8sux16	%f8,	%f22,	%f24
	fmovsn	%xcc,	%f9,	%f6
	fors	%f24,	%f2,	%f27
	add	%i5,	%o3,	%i7
	movrlz	%o4,	%l4,	%l2
	ldx	[%l7 + 0x30],	%o2
	std	%f24,	[%l7 + 0x30]
	edge32	%g3,	%o7,	%i2
	sub	%g2,	0x0C6F,	%l0
	array8	%g1,	%i4,	%l1
	fand	%f14,	%f10,	%f28
	fmovda	%xcc,	%f15,	%f25
	sth	%g7,	[%l7 + 0x1A]
	srax	%i1,	0x07,	%i6
	fmovsne	%xcc,	%f26,	%f18
	fmovrse	%i3,	%f14,	%f28
	srl	%o1,	%g6,	%o5
	fnegd	%f18,	%f28
	array16	%g5,	%o6,	%o0
	ldd	[%l7 + 0x48],	%f12
	std	%f8,	[%l7 + 0x40]
	edge32l	%l3,	%i0,	%l6
	fand	%f28,	%f0,	%f26
	array16	%l5,	%g4,	%i5
	mova	%xcc,	%i7,	%o3
	fsrc1	%f16,	%f26
	sub	%o4,	0x0989,	%l4
	ldd	[%l7 + 0x68],	%l2
	movg	%xcc,	%o2,	%o7
	lduh	[%l7 + 0x4A],	%g3
	srl	%g2,	%l0,	%i2
	subcc	%g1,	0x1D18,	%i4
	mova	%xcc,	%g7,	%l1
	srax	%i1,	%i3,	%o1
	movrgz	%i6,	%g6,	%o5
	edge8ln	%o6,	%o0,	%g5
	fmovsl	%icc,	%f29,	%f21
	ldsb	[%l7 + 0x4A],	%i0
	ldub	[%l7 + 0x65],	%l3
	st	%f13,	[%l7 + 0x2C]
	edge32	%l6,	%l5,	%g4
	ldub	[%l7 + 0x19],	%i7
	save %i5, %o4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o3,	%o2,	%l2
	umulcc	%o7,	%g2,	%g3
	mulx	%l0,	%g1,	%i2
	edge8	%g7,	%i4,	%l1
	movvs	%xcc,	%i3,	%i1
	sdivx	%o1,	0x0D93,	%g6
	alignaddr	%i6,	%o6,	%o0
	sll	%o5,	%i0,	%l3
	movrlz	%g5,	%l6,	%g4
	xorcc	%i7,	0x081D,	%l5
	andcc	%o4,	0x0E2E,	%i5
	array32	%l4,	%o3,	%o2
	xnor	%o7,	0x1070,	%l2
	subcc	%g3,	0x177A,	%l0
	movl	%xcc,	%g1,	%g2
	ldsb	[%l7 + 0x27],	%g7
	sllx	%i4,	%l1,	%i3
	and	%i2,	%i1,	%g6
	udivx	%i6,	0x1A3A,	%o1
	movcs	%xcc,	%o0,	%o6
	fmovsleu	%icc,	%f12,	%f12
	edge32ln	%i0,	%o5,	%g5
	st	%f7,	[%l7 + 0x2C]
	restore %l6, 0x07F3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i7,	0x1C,	%l3
	stx	%o4,	[%l7 + 0x48]
	subcc	%l5,	%l4,	%i5
	ldd	[%l7 + 0x58],	%o2
	move	%xcc,	%o7,	%o3
	array32	%g3,	%l0,	%g1
	fmovdcc	%icc,	%f22,	%f6
	xorcc	%l2,	0x17DB,	%g7
	edge16	%i4,	%g2,	%i3
	fmovspos	%xcc,	%f10,	%f6
	movge	%icc,	%l1,	%i1
	andcc	%i2,	0x17D7,	%g6
	fxnors	%f24,	%f11,	%f12
	fsrc1	%f0,	%f22
	mulscc	%i6,	0x0863,	%o0
	fexpand	%f17,	%f26
	move	%xcc,	%o1,	%i0
	addc	%o5,	%o6,	%g5
	fmovdcc	%icc,	%f11,	%f14
	fands	%f2,	%f13,	%f29
	addcc	%l6,	%i7,	%g4
	subcc	%l3,	0x1E02,	%o4
	fmovsg	%icc,	%f5,	%f23
	movn	%icc,	%l5,	%i5
	lduw	[%l7 + 0x10],	%o2
	srlx	%o7,	0x02,	%o3
	st	%f27,	[%l7 + 0x68]
	srl	%l4,	%g3,	%l0
	sllx	%l2,	0x15,	%g1
	stw	%i4,	[%l7 + 0x60]
	addc	%g7,	%g2,	%l1
	xorcc	%i1,	%i2,	%g6
	movvs	%icc,	%i6,	%i3
	fmovdgu	%icc,	%f25,	%f13
	save %o1, %i0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o0,	%o6
	array32	%l6,	%i7,	%g4
	sll	%l3,	%o4,	%g5
	xnor	%i5,	0x052F,	%o2
	ldsw	[%l7 + 0x5C],	%o7
	fornot2s	%f3,	%f11,	%f10
	edge32	%l5,	%l4,	%o3
	udiv	%g3,	0x056F,	%l2
	subc	%g1,	%l0,	%g7
	movrne	%i4,	0x35F,	%l1
	ldx	[%l7 + 0x18],	%g2
	sethi	0x123F,	%i1
	mulscc	%g6,	%i6,	%i2
	ldsw	[%l7 + 0x3C],	%i3
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	ld	[%l7 + 0x40],	%f30
	popc	0x14A9,	%i0
	or	%o0,	%l6,	%i7
	std	%f26,	[%l7 + 0x40]
	subc	%g4,	0x1354,	%o6
	edge8l	%o4,	%g5,	%i5
	addc	%l3,	%o7,	%l5
	lduh	[%l7 + 0x1E],	%l4
	xorcc	%o3,	%g3,	%o2
	movcc	%xcc,	%g1,	%l2
	sllx	%l0,	%g7,	%l1
	movle	%icc,	%i4,	%g2
	fcmpne32	%f12,	%f22,	%g6
	fmovdneg	%icc,	%f13,	%f30
	std	%f28,	[%l7 + 0x38]
	siam	0x2
	ldsw	[%l7 + 0x58],	%i1
	movcs	%icc,	%i2,	%i6
	ldd	[%l7 + 0x18],	%o0
	fsrc2s	%f15,	%f14
	fmovdpos	%icc,	%f31,	%f14
	and	%i3,	%i0,	%o5
	mulscc	%l6,	0x145E,	%i7
	umul	%g4,	%o6,	%o4
	orcc	%g5,	%i5,	%o0
	movge	%xcc,	%o7,	%l5
	movleu	%icc,	%l4,	%o3
	lduw	[%l7 + 0x08],	%g3
	fmovsl	%icc,	%f1,	%f19
	edge16n	%l3,	%g1,	%l2
	orncc	%l0,	0x0B93,	%o2
	fpadd16s	%f13,	%f18,	%f13
	movl	%icc,	%l1,	%g7
	movneg	%xcc,	%g2,	%i4
	fsrc1s	%f13,	%f9
	stx	%i1,	[%l7 + 0x58]
	movre	%i2,	0x0E6,	%g6
	sdivx	%o1,	0x0ECF,	%i6
	movge	%icc,	%i0,	%o5
	fcmped	%fcc0,	%f28,	%f24
	edge16ln	%l6,	%i7,	%g4
	sdivx	%i3,	0x0A31,	%o6
	ld	[%l7 + 0x54],	%f13
	umul	%o4,	%i5,	%o0
	movge	%icc,	%o7,	%g5
	movl	%xcc,	%l5,	%o3
	fnegd	%f14,	%f18
	ldsh	[%l7 + 0x70],	%l4
	ldsw	[%l7 + 0x38],	%l3
	fcmpeq16	%f20,	%f6,	%g1
	ldsw	[%l7 + 0x3C],	%l2
	sll	%g3,	0x0A,	%o2
	edge16n	%l0,	%g7,	%l1
	alignaddrl	%i4,	%g2,	%i2
	movleu	%xcc,	%i1,	%o1
	bshuffle	%f26,	%f16,	%f6
	fmuld8sux16	%f10,	%f24,	%f30
	edge32n	%g6,	%i6,	%o5
	fandnot1	%f14,	%f20,	%f4
	smulcc	%l6,	0x0B13,	%i7
	orcc	%i0,	0x19F3,	%g4
	sethi	0x040D,	%o6
	xor	%o4,	%i5,	%o0
	mulx	%o7,	%g5,	%l5
	edge16	%i3,	%o3,	%l3
	fnand	%f10,	%f28,	%f18
	fmovsg	%icc,	%f16,	%f14
	edge32ln	%l4,	%l2,	%g3
	sub	%o2,	0x1E7F,	%l0
	movneg	%icc,	%g7,	%l1
	udiv	%g1,	0x198B,	%i4
	movneg	%icc,	%i2,	%g2
	array16	%o1,	%g6,	%i1
	sdivx	%o5,	0x05F9,	%l6
	movrgz	%i6,	%i0,	%i7
	movl	%icc,	%o6,	%g4
	fnot1s	%f27,	%f6
	xorcc	%i5,	0x13C3,	%o0
	alignaddr	%o4,	%o7,	%g5
	edge32ln	%l5,	%i3,	%l3
	movleu	%icc,	%o3,	%l2
	fsrc2s	%f14,	%f0
	array32	%g3,	%o2,	%l4
	sra	%l0,	%g7,	%l1
	movn	%xcc,	%g1,	%i2
	lduw	[%l7 + 0x1C],	%i4
	fornot1s	%f24,	%f20,	%f26
	array8	%g2,	%o1,	%g6
	movne	%icc,	%o5,	%l6
	movne	%xcc,	%i6,	%i0
	fpackfix	%f0,	%f1
	movgu	%xcc,	%i1,	%i7
	save %o6, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o4,	%o7
	umul	%g5,	%o0,	%i3
	fcmple32	%f24,	%f16,	%l3
	edge32n	%o3,	%l2,	%g3
	fmovdcs	%xcc,	%f4,	%f30
	smul	%l5,	0x0143,	%o2
	sll	%l0,	0x1A,	%g7
	sdiv	%l4,	0x1392,	%g1
	st	%f23,	[%l7 + 0x68]
	andncc	%i2,	%i4,	%l1
	fmovdneg	%xcc,	%f31,	%f28
	movrgez	%g2,	%g6,	%o5
	orncc	%l6,	%o1,	%i6
	edge32n	%i0,	%i1,	%i7
	fmul8x16au	%f2,	%f2,	%f12
	movrgz	%o6,	0x2E5,	%i5
	umul	%o4,	0x083F,	%o7
	array8	%g4,	%o0,	%i3
	fmul8x16au	%f11,	%f12,	%f8
	fmovsleu	%icc,	%f1,	%f7
	edge16	%l3,	%o3,	%l2
	fand	%f24,	%f2,	%f30
	edge8ln	%g5,	%g3,	%o2
	fabss	%f29,	%f11
	edge16	%l5,	%l0,	%g7
	save %l4, 0x1E6E, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f8,	%f17
	movle	%icc,	%i2,	%i4
	movrne	%l1,	%g2,	%o5
	stx	%g6,	[%l7 + 0x30]
	udiv	%o1,	0x052C,	%l6
	movvc	%icc,	%i6,	%i0
	edge8n	%i1,	%o6,	%i5
	movrlez	%o4,	0x3AA,	%i7
	movcc	%xcc,	%o7,	%o0
	ldub	[%l7 + 0x47],	%i3
	fandnot2s	%f20,	%f12,	%f30
	movpos	%icc,	%g4,	%o3
	andncc	%l3,	%l2,	%g3
	mulx	%o2,	%g5,	%l5
	sethi	0x1370,	%g7
	movpos	%icc,	%l4,	%g1
	edge32ln	%l0,	%i4,	%i2
	edge32l	%l1,	%o5,	%g2
	mulscc	%o1,	0x04D5,	%g6
	faligndata	%f4,	%f22,	%f12
	addc	%i6,	0x0B83,	%i0
	udivx	%i1,	0x0345,	%l6
	udivcc	%o6,	0x1659,	%o4
	restore %i5, %i7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o7,	%i3,	%g4
	fabss	%f2,	%f28
	stw	%o3,	[%l7 + 0x70]
	popc	%l3,	%g3
	movvc	%icc,	%l2,	%g5
	ldx	[%l7 + 0x28],	%l5
	fnot2s	%f22,	%f1
	fmovrslz	%g7,	%f17,	%f5
	movgu	%xcc,	%l4,	%o2
	fmovrslz	%l0,	%f30,	%f6
	movvc	%xcc,	%g1,	%i2
	movre	%i4,	0x1D2,	%l1
	ldsb	[%l7 + 0x33],	%o5
	fornot2	%f28,	%f16,	%f22
	fpackfix	%f30,	%f28
	stx	%g2,	[%l7 + 0x38]
	xor	%g6,	0x1EDD,	%o1
	edge8l	%i0,	%i1,	%l6
	andn	%i6,	%o6,	%o4
	array8	%i7,	%i5,	%o0
	fmul8x16al	%f10,	%f7,	%f20
	andncc	%o7,	%g4,	%o3
	udivcc	%l3,	0x1470,	%g3
	fmovdvc	%icc,	%f6,	%f22
	srl	%i3,	0x02,	%g5
	ldsh	[%l7 + 0x78],	%l2
	ldsh	[%l7 + 0x54],	%l5
	fnor	%f20,	%f6,	%f10
	xnor	%l4,	%g7,	%o2
	movle	%xcc,	%g1,	%i2
	sdiv	%i4,	0x0B2F,	%l0
	alignaddrl	%o5,	%g2,	%l1
	and	%g6,	0x0C93,	%o1
	srlx	%i0,	%l6,	%i6
	andncc	%i1,	%o6,	%i7
	movrgz	%i5,	%o4,	%o0
	fmovrsgez	%g4,	%f15,	%f17
	fsrc2	%f30,	%f20
	movrne	%o3,	%o7,	%g3
	ldsb	[%l7 + 0x10],	%l3
	nop
	set	0x50, %o2
	stw	%i3,	[%l7 + %o2]
	fmovrsgz	%g5,	%f7,	%f4
	st	%f31,	[%l7 + 0x64]
	subcc	%l2,	%l5,	%g7
	fxnor	%f8,	%f10,	%f8
	movleu	%icc,	%o2,	%g1
	popc	0x1ADA,	%l4
	ldsw	[%l7 + 0x0C],	%i4
	fxors	%f18,	%f19,	%f10
	smulcc	%l0,	0x1D9D,	%i2
	edge32n	%g2,	%o5,	%g6
	subc	%l1,	0x0636,	%o1
	fmovda	%xcc,	%f9,	%f19
	stb	%l6,	[%l7 + 0x6D]
	lduh	[%l7 + 0x58],	%i6
	smul	%i0,	0x1757,	%o6
	udiv	%i1,	0x19A0,	%i7
	fcmpne16	%f2,	%f16,	%o4
	udivcc	%o0,	0x068F,	%i5
	fmuld8ulx16	%f31,	%f12,	%f28
	fpack16	%f8,	%f5
	fmovsneg	%xcc,	%f6,	%f12
	sll	%o3,	%o7,	%g3
	sdivcc	%l3,	0x00A3,	%g4
	alignaddr	%i3,	%g5,	%l2
	movpos	%icc,	%g7,	%o2
	sethi	0x0187,	%g1
	addccc	%l5,	0x02A7,	%l4
	orncc	%i4,	0x1718,	%i2
	sdivx	%g2,	0x09FA,	%l0
	fmovrslz	%g6,	%f25,	%f27
	array16	%l1,	%o1,	%l6
	edge8	%i6,	%o5,	%o6
	fandnot1s	%f7,	%f21,	%f8
	fexpand	%f3,	%f2
	sllx	%i1,	%i7,	%i0
	ldd	[%l7 + 0x20],	%o4
	movrlez	%i5,	0x0C8,	%o0
	lduw	[%l7 + 0x50],	%o7
	alignaddrl	%o3,	%g3,	%g4
	alignaddrl	%l3,	%g5,	%i3
	array16	%l2,	%g7,	%o2
	fornot2s	%f14,	%f10,	%f23
	fcmpne32	%f16,	%f30,	%g1
	movrne	%l4,	%l5,	%i2
	edge32l	%g2,	%l0,	%g6
	st	%f28,	[%l7 + 0x6C]
	sir	0x1BF4
	fcmple32	%f20,	%f0,	%l1
	fmovrslez	%o1,	%f13,	%f23
	fmovsvs	%xcc,	%f13,	%f27
	ldub	[%l7 + 0x79],	%i4
	fmovdpos	%xcc,	%f12,	%f2
	sdiv	%i6,	0x06E4,	%l6
	alignaddrl	%o5,	%o6,	%i7
	orcc	%i1,	0x171B,	%o4
	sir	0x121E
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	fsrc1	%f10,	%f20
	array32	%o7,	%g3,	%o3
	xnor	%l3,	%g4,	%i3
	move	%xcc,	%l2,	%g7
	mulscc	%o2,	0x101D,	%g1
	srl	%l4,	%l5,	%g5
	fsrc1	%f0,	%f0
	fmovsa	%icc,	%f18,	%f9
	std	%f18,	[%l7 + 0x08]
	movn	%xcc,	%i2,	%l0
	udiv	%g6,	0x069F,	%g2
	fpadd32s	%f3,	%f11,	%f22
	fmovrsne	%l1,	%f16,	%f14
	smul	%i4,	%o1,	%i6
	ldsw	[%l7 + 0x40],	%o5
	alignaddr	%l6,	%i7,	%i1
	movvs	%xcc,	%o6,	%o4
	movne	%xcc,	%i5,	%o0
	xnor	%o7,	%i0,	%g3
	addc	%o3,	%l3,	%i3
	pdist	%f16,	%f12,	%f18
	ldx	[%l7 + 0x20],	%g4
	andn	%g7,	0x0E6C,	%o2
	sethi	0x06DB,	%g1
	smul	%l2,	%l4,	%g5
	movrlz	%i2,	%l5,	%l0
	movl	%icc,	%g2,	%l1
	srax	%g6,	%i4,	%o1
	smulcc	%i6,	0x0926,	%l6
	subccc	%i7,	0x0801,	%i1
	edge32l	%o6,	%o4,	%i5
	udivx	%o5,	0x1694,	%o0
	movneg	%xcc,	%o7,	%i0
	addc	%g3,	%o3,	%i3
	edge16l	%g4,	%g7,	%l3
	fxnor	%f8,	%f0,	%f30
	ldub	[%l7 + 0x15],	%g1
	fsrc1	%f8,	%f16
	save %l2, 0x08D7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x47],	%o2
	mulx	%i2,	0x178A,	%l5
	ldd	[%l7 + 0x28],	%f8
	edge8ln	%g5,	%g2,	%l0
	movg	%icc,	%g6,	%l1
	nop
	set	0x1C, %l4
	ldub	[%l7 + %l4],	%i4
	edge8n	%i6,	%o1,	%l6
	edge16n	%i7,	%o6,	%o4
	srax	%i1,	%o5,	%i5
	fmovsge	%xcc,	%f28,	%f14
	sdivx	%o7,	0x1294,	%o0
	smulcc	%g3,	%i0,	%o3
	sllx	%g4,	0x0C,	%g7
	udiv	%i3,	0x178F,	%g1
	movrgz	%l3,	0x155,	%l4
	sir	0x0EB4
	ldd	[%l7 + 0x58],	%l2
	smulcc	%i2,	%o2,	%l5
	movrlez	%g2,	0x11E,	%l0
	fsrc2	%f16,	%f14
	fandnot2s	%f29,	%f28,	%f10
	addccc	%g5,	0x0B2C,	%g6
	sethi	0x0D93,	%i4
	ldsh	[%l7 + 0x70],	%l1
	array16	%o1,	%i6,	%l6
	addcc	%i7,	0x1717,	%o4
	movne	%xcc,	%i1,	%o6
	movrne	%i5,	0x3D4,	%o5
	addc	%o7,	0x16F3,	%g3
	edge32	%o0,	%o3,	%g4
	movne	%icc,	%g7,	%i0
	fcmpeq16	%f16,	%f8,	%g1
	subccc	%i3,	0x0307,	%l4
	fandnot2s	%f9,	%f26,	%f24
	movneg	%xcc,	%l2,	%i2
	fexpand	%f25,	%f12
	fmovscc	%icc,	%f29,	%f30
	edge8ln	%o2,	%l5,	%g2
	movgu	%icc,	%l3,	%l0
	edge32l	%g5,	%i4,	%g6
	stw	%l1,	[%l7 + 0x3C]
	sdiv	%o1,	0x08AB,	%l6
	ldsw	[%l7 + 0x38],	%i7
	fone	%f26
	fexpand	%f26,	%f12
	fcmpeq32	%f0,	%f26,	%i6
	popc	0x1EA5,	%o4
	fmovrdgez	%i1,	%f24,	%f2
	udivcc	%o6,	0x0CC0,	%o5
	addccc	%o7,	0x15B2,	%g3
	fpadd16	%f18,	%f14,	%f16
	fmovdge	%icc,	%f27,	%f21
	movvc	%icc,	%o0,	%i5
	array16	%o3,	%g7,	%i0
	ld	[%l7 + 0x60],	%f13
	ldd	[%l7 + 0x70],	%f26
	edge8n	%g4,	%i3,	%g1
	addccc	%l2,	%l4,	%o2
	movpos	%xcc,	%l5,	%i2
	alignaddrl	%g2,	%l3,	%g5
	xnor	%l0,	0x1DA8,	%i4
	popc	0x0578,	%g6
	fmovrdne	%l1,	%f4,	%f0
	sub	%l6,	0x0DFE,	%o1
	stw	%i6,	[%l7 + 0x58]
	andncc	%i7,	%o4,	%i1
	addccc	%o5,	0x1467,	%o6
	sllx	%o7,	0x12,	%o0
	sra	%i5,	%o3,	%g7
	alignaddr	%i0,	%g3,	%i3
	fsrc1	%f10,	%f24
	edge16ln	%g1,	%g4,	%l4
	andcc	%o2,	%l5,	%l2
	movcs	%xcc,	%g2,	%i2
	smul	%g5,	%l3,	%i4
	srlx	%g6,	0x0F,	%l1
	fnor	%f16,	%f28,	%f16
	sir	0x0182
	sdivx	%l6,	0x08A8,	%l0
	fmul8ulx16	%f22,	%f30,	%f18
	lduh	[%l7 + 0x2E],	%i6
	ldsh	[%l7 + 0x24],	%o1
	andn	%i7,	%i1,	%o5
	fmovsle	%xcc,	%f18,	%f31
	fmovdpos	%xcc,	%f10,	%f10
	edge16ln	%o6,	%o7,	%o4
	ldsw	[%l7 + 0x1C],	%o0
	subcc	%i5,	%o3,	%g7
	sll	%g3,	%i0,	%g1
	movne	%xcc,	%g4,	%i3
	udiv	%o2,	0x051B,	%l4
	sllx	%l5,	0x07,	%g2
	stb	%l2,	[%l7 + 0x38]
	movrlez	%g5,	0x231,	%i2
	andncc	%l3,	%i4,	%g6
	edge32	%l6,	%l0,	%l1
	movrgez	%o1,	%i7,	%i6
	xnor	%i1,	%o6,	%o5
	fpsub16	%f10,	%f6,	%f14
	alignaddrl	%o4,	%o7,	%i5
	fmovrdlez	%o0,	%f10,	%f20
	xnorcc	%g7,	0x04E6,	%g3
	array32	%o3,	%i0,	%g4
	movgu	%icc,	%g1,	%o2
	fmuld8sux16	%f22,	%f7,	%f26
	subccc	%i3,	0x1D09,	%l5
	movge	%icc,	%g2,	%l2
	edge8ln	%g5,	%i2,	%l3
	fmovdcc	%icc,	%f22,	%f8
	movrlz	%l4,	%i4,	%l6
	fmovsvs	%xcc,	%f29,	%f19
	fmul8sux16	%f18,	%f30,	%f24
	sllx	%g6,	%l1,	%l0
	and	%o1,	0x19FF,	%i7
	move	%icc,	%i6,	%i1
	xor	%o6,	0x13B7,	%o4
	smulcc	%o5,	%i5,	%o0
	add	%g7,	0x0973,	%g3
	umul	%o7,	%i0,	%o3
	andn	%g4,	%g1,	%i3
	fmovdle	%xcc,	%f19,	%f17
	smul	%o2,	%g2,	%l2
	fsrc1s	%f3,	%f26
	xor	%g5,	%l5,	%i2
	fmuld8ulx16	%f15,	%f9,	%f12
	sdivcc	%l3,	0x00B9,	%i4
	edge16ln	%l6,	%l4,	%l1
	xor	%g6,	0x08C5,	%o1
	faligndata	%f4,	%f20,	%f16
	movne	%xcc,	%l0,	%i6
	edge16n	%i7,	%i1,	%o4
	fpsub32	%f18,	%f28,	%f0
	smulcc	%o6,	0x0E2F,	%o5
	movn	%xcc,	%o0,	%i5
	addc	%g3,	%o7,	%g7
	fmovde	%icc,	%f26,	%f0
	popc	0x126F,	%i0
	ldx	[%l7 + 0x30],	%o3
	orcc	%g1,	%g4,	%i3
	ldsw	[%l7 + 0x1C],	%g2
	movrgz	%o2,	%l2,	%g5
	fornot1s	%f2,	%f15,	%f21
	addcc	%l5,	%l3,	%i4
	sdivx	%l6,	0x19F9,	%i2
	andcc	%l4,	0x0FA2,	%g6
	fmovsl	%icc,	%f7,	%f18
	xnor	%l1,	%l0,	%i6
	popc	%i7,	%i1
	fsrc1	%f30,	%f8
	subccc	%o1,	0x122F,	%o4
	fmovdvc	%icc,	%f9,	%f18
	sdiv	%o5,	0x1159,	%o0
	edge8	%o6,	%g3,	%o7
	or	%g7,	%i5,	%o3
	udivx	%i0,	0x112A,	%g1
	fmovd	%f10,	%f24
	lduw	[%l7 + 0x48],	%i3
	edge32l	%g4,	%g2,	%o2
	movg	%xcc,	%l2,	%l5
	and	%g5,	%l3,	%i4
	andn	%i2,	0x0640,	%l6
	edge32n	%g6,	%l4,	%l1
	save %l0, 0x03F9, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	%i1,	%o4
	edge16l	%o5,	%o0,	%o1
	edge16	%o6,	%o7,	%g7
	fsrc1	%f0,	%f16
	srax	%i5,	0x0F,	%g3
	edge8l	%o3,	%i0,	%g1
	edge32n	%g4,	%i3,	%g2
	edge32	%o2,	%l2,	%g5
	lduh	[%l7 + 0x32],	%l5
	or	%l3,	0x144D,	%i4
	edge16ln	%l6,	%g6,	%l4
	edge8ln	%i2,	%l0,	%l1
	stw	%i6,	[%l7 + 0x6C]
	fnot2s	%f20,	%f27
	edge8ln	%i1,	%i7,	%o5
	popc	0x0F33,	%o4
	mulx	%o1,	%o0,	%o6
	fmovrde	%g7,	%f30,	%f18
	movleu	%icc,	%o7,	%i5
	udivx	%g3,	0x178A,	%o3
	alignaddrl	%i0,	%g1,	%g4
	sth	%g2,	[%l7 + 0x2C]
	movrgez	%o2,	0x0B9,	%i3
	edge8n	%l2,	%g5,	%l5
	sdiv	%i4,	0x133F,	%l3
	movvs	%xcc,	%l6,	%g6
	movrne	%i2,	0x20E,	%l4
	add	%l0,	%i6,	%l1
	edge8	%i1,	%i7,	%o5
	array16	%o4,	%o1,	%o0
	ldd	[%l7 + 0x48],	%o6
	ldd	[%l7 + 0x38],	%f10
	nop
	set	0x7C, %g6
	stw	%o7,	[%l7 + %g6]
	fzero	%f12
	addccc	%i5,	%g7,	%g3
	sth	%o3,	[%l7 + 0x28]
	stx	%i0,	[%l7 + 0x28]
	movne	%xcc,	%g4,	%g1
	andcc	%o2,	%i3,	%l2
	fmovse	%xcc,	%f7,	%f6
	sll	%g2,	0x18,	%l5
	std	%f20,	[%l7 + 0x70]
	edge16ln	%i4,	%l3,	%g5
	sethi	0x1D4F,	%l6
	or	%g6,	%l4,	%i2
	addccc	%l0,	0x0A4A,	%i6
	udiv	%i1,	0x185C,	%l1
	subccc	%i7,	%o5,	%o4
	fmovsa	%xcc,	%f25,	%f2
	orncc	%o1,	0x0739,	%o6
	fcmpgt32	%f22,	%f14,	%o0
	add	%i5,	%g7,	%o7
	smul	%o3,	%g3,	%i0
	movcs	%icc,	%g1,	%g4
	lduh	[%l7 + 0x4A],	%o2
	array32	%l2,	%g2,	%l5
	fcmped	%fcc2,	%f30,	%f2
	fmovdge	%xcc,	%f17,	%f3
	sra	%i3,	%i4,	%g5
	move	%icc,	%l6,	%l3
	fmovrsgez	%l4,	%f25,	%f30
	mova	%icc,	%i2,	%g6
	fsrc1s	%f25,	%f31
	movn	%xcc,	%i6,	%i1
	pdist	%f20,	%f2,	%f24
	xnorcc	%l0,	0x0D09,	%l1
	mova	%xcc,	%i7,	%o4
	lduw	[%l7 + 0x18],	%o1
	mulscc	%o5,	%o6,	%i5
	movcc	%xcc,	%g7,	%o0
	fmovdvs	%xcc,	%f6,	%f26
	edge16n	%o3,	%g3,	%o7
	movgu	%icc,	%g1,	%i0
	pdist	%f28,	%f6,	%f18
	movrlez	%g4,	0x20B,	%l2
	mulscc	%g2,	0x000B,	%l5
	edge8n	%i3,	%o2,	%g5
	movleu	%xcc,	%l6,	%l3
	fmovdne	%icc,	%f26,	%f14
	addcc	%l4,	%i4,	%g6
	fpsub32	%f12,	%f0,	%f8
	sdivcc	%i6,	0x1A51,	%i2
	movpos	%icc,	%l0,	%l1
	fnot1	%f6,	%f18
	bshuffle	%f16,	%f24,	%f24
	orncc	%i1,	%i7,	%o1
	fmul8x16al	%f2,	%f2,	%f26
	array16	%o4,	%o6,	%o5
	move	%xcc,	%g7,	%o0
	alignaddrl	%i5,	%g3,	%o3
	edge16	%o7,	%g1,	%i0
	alignaddrl	%l2,	%g2,	%l5
	stb	%i3,	[%l7 + 0x23]
	movrgez	%o2,	%g5,	%g4
	stb	%l3,	[%l7 + 0x36]
	move	%icc,	%l6,	%l4
	sllx	%g6,	%i6,	%i4
	mulscc	%i2,	%l0,	%i1
	udivx	%i7,	0x1710,	%o1
	edge32l	%l1,	%o4,	%o6
	movn	%xcc,	%g7,	%o0
	mulx	%o5,	0x0C15,	%i5
	orn	%g3,	0x0E3A,	%o3
	movneg	%xcc,	%g1,	%i0
	alignaddr	%l2,	%g2,	%l5
	movne	%xcc,	%i3,	%o2
	stw	%o7,	[%l7 + 0x2C]
	sllx	%g5,	%g4,	%l6
	subcc	%l4,	0x0BD0,	%l3
	xor	%g6,	%i4,	%i6
	movle	%icc,	%i2,	%l0
	sth	%i7,	[%l7 + 0x30]
	sub	%i1,	0x0AA4,	%l1
	st	%f9,	[%l7 + 0x68]
	mulscc	%o4,	%o1,	%o6
	movcs	%icc,	%g7,	%o0
	edge8	%o5,	%g3,	%i5
	fmovdg	%icc,	%f25,	%f22
	fmovdvc	%xcc,	%f8,	%f28
	edge8n	%o3,	%g1,	%i0
	fnegd	%f4,	%f26
	mova	%xcc,	%l2,	%l5
	xorcc	%g2,	%i3,	%o2
	fmul8x16au	%f4,	%f11,	%f14
	movrgez	%g5,	0x368,	%o7
	sir	0x1431
	nop
	set	0x50, %l5
	std	%f0,	[%l7 + %l5]
	array16	%l6,	%g4,	%l3
	fzero	%f16
	smulcc	%l4,	0x00E3,	%i4
	sub	%i6,	%i2,	%g6
	movpos	%icc,	%l0,	%i1
	array8	%l1,	%i7,	%o1
	udivx	%o4,	0x08DC,	%o6
	movcc	%xcc,	%o0,	%o5
	lduh	[%l7 + 0x16],	%g3
	smulcc	%i5,	0x014E,	%o3
	movge	%icc,	%g7,	%i0
	movrlz	%l2,	%g1,	%g2
	ldx	[%l7 + 0x60],	%i3
	xorcc	%o2,	%g5,	%o7
	nop
	set	0x40, %i1
	stw	%l5,	[%l7 + %i1]
	fmovscs	%icc,	%f28,	%f21
	andncc	%l6,	%l3,	%l4
	movl	%icc,	%g4,	%i4
	movcc	%icc,	%i6,	%i2
	array8	%l0,	%g6,	%i1
	edge8	%l1,	%i7,	%o4
	std	%f26,	[%l7 + 0x50]
	ldsb	[%l7 + 0x28],	%o6
	fnot1s	%f19,	%f25
	edge8	%o1,	%o0,	%g3
	or	%i5,	%o5,	%g7
	ldsw	[%l7 + 0x18],	%o3
	fmuld8sux16	%f1,	%f11,	%f28
	edge8l	%i0,	%l2,	%g2
	sdiv	%g1,	0x131A,	%o2
	fxnors	%f22,	%f0,	%f8
	fcmpd	%fcc1,	%f26,	%f24
	andncc	%i3,	%o7,	%l5
	stw	%g5,	[%l7 + 0x78]
	mulscc	%l6,	0x095E,	%l4
	andcc	%g4,	%l3,	%i4
	ldd	[%l7 + 0x68],	%i2
	alignaddrl	%l0,	%i6,	%i1
	movrgz	%g6,	0x23A,	%i7
	fmovda	%icc,	%f2,	%f10
	st	%f14,	[%l7 + 0x5C]
	sra	%l1,	0x16,	%o4
	std	%f14,	[%l7 + 0x48]
	movrgez	%o1,	%o0,	%o6
	addcc	%g3,	0x1836,	%o5
	andcc	%i5,	0x15F7,	%g7
	fzero	%f28
	movne	%icc,	%o3,	%l2
	fcmple32	%f14,	%f6,	%i0
	fmovdpos	%icc,	%f20,	%f17
	and	%g2,	%o2,	%g1
	add	%o7,	%i3,	%l5
	xnorcc	%l6,	0x01B3,	%l4
	alignaddr	%g5,	%g4,	%l3
	lduw	[%l7 + 0x7C],	%i4
	ldx	[%l7 + 0x68],	%l0
	sethi	0x1540,	%i6
	edge32l	%i2,	%g6,	%i1
	alignaddrl	%i7,	%o4,	%o1
	fpsub32s	%f26,	%f4,	%f2
	mova	%icc,	%l1,	%o0
	umulcc	%o6,	%o5,	%g3
	orn	%g7,	%i5,	%l2
	movrne	%o3,	%g2,	%i0
	movle	%xcc,	%o2,	%o7
	fmul8ulx16	%f22,	%f12,	%f8
	movleu	%xcc,	%i3,	%l5
	xorcc	%l6,	%g1,	%l4
	fmovsg	%xcc,	%f9,	%f23
	ldsb	[%l7 + 0x75],	%g5
	stb	%g4,	[%l7 + 0x73]
	fors	%f18,	%f28,	%f12
	movrgz	%i4,	0x3A7,	%l3
	xnor	%i6,	0x1EF8,	%i2
	fpmerge	%f31,	%f2,	%f20
	sra	%g6,	%i1,	%l0
	sra	%i7,	0x06,	%o1
	edge32n	%o4,	%l1,	%o6
	sdivx	%o5,	0x05E5,	%o0
	srlx	%g3,	0x0D,	%g7
	fnand	%f24,	%f0,	%f24
	mova	%icc,	%i5,	%l2
	fandnot1	%f22,	%f2,	%f0
	ldx	[%l7 + 0x78],	%o3
	movg	%xcc,	%g2,	%i0
	movrlz	%o7,	%i3,	%o2
	fabsd	%f10,	%f24
	sra	%l5,	%g1,	%l6
	xnor	%g5,	%l4,	%i4
	srax	%g4,	%i6,	%i2
	fabss	%f21,	%f18
	nop
	set	0x42, %g1
	ldsh	[%l7 + %g1],	%l3
	restore %g6, 0x1B68, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l0,	[%l7 + 0x20]
	fmovrsgz	%i7,	%f13,	%f2
	edge32l	%o4,	%o1,	%l1
	array16	%o5,	%o0,	%g3
	movne	%xcc,	%o6,	%i5
	orncc	%l2,	0x097B,	%o3
	edge16n	%g7,	%i0,	%o7
	fmul8x16	%f12,	%f24,	%f6
	edge16ln	%g2,	%o2,	%l5
	edge16n	%i3,	%g1,	%l6
	edge8	%l4,	%g5,	%g4
	edge32ln	%i4,	%i6,	%l3
	fmul8sux16	%f30,	%f28,	%f14
	srlx	%i2,	%i1,	%g6
	addcc	%i7,	%l0,	%o1
	xnorcc	%o4,	0x065A,	%l1
	add	%o0,	%g3,	%o5
	save %i5, %l2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f19,	%f26
	stx	%g7,	[%l7 + 0x68]
	mulx	%i0,	0x0A88,	%o3
	mova	%xcc,	%g2,	%o2
	array16	%o7,	%l5,	%g1
	fmovscc	%xcc,	%f25,	%f21
	subccc	%l6,	%i3,	%g5
	xorcc	%l4,	0x0FF7,	%g4
	ldsb	[%l7 + 0x7A],	%i4
	sth	%l3,	[%l7 + 0x0A]
	umul	%i6,	%i1,	%g6
	movne	%xcc,	%i7,	%i2
	array32	%o1,	%o4,	%l1
	nop
	set	0x08, %g5
	lduw	[%l7 + %g5],	%o0
	movcs	%icc,	%l0,	%o5
	movle	%xcc,	%g3,	%l2
	fcmpeq32	%f6,	%f26,	%o6
	ldsb	[%l7 + 0x42],	%i5
	addcc	%g7,	0x00A6,	%i0
	nop
	set	0x25, %l1
	ldsb	[%l7 + %l1],	%o3
	fnand	%f22,	%f12,	%f14
	andncc	%g2,	%o7,	%o2
	stb	%l5,	[%l7 + 0x45]
	movcc	%icc,	%g1,	%i3
	popc	0x0B28,	%l6
	edge32n	%l4,	%g5,	%i4
	edge8ln	%l3,	%g4,	%i1
	lduh	[%l7 + 0x58],	%g6
	fandnot2	%f6,	%f24,	%f16
	movneg	%xcc,	%i6,	%i7
	edge8ln	%o1,	%i2,	%l1
	fcmple32	%f22,	%f12,	%o0
	movgu	%xcc,	%l0,	%o4
	xorcc	%o5,	%g3,	%o6
	edge32l	%l2,	%i5,	%g7
	umul	%i0,	%g2,	%o7
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	srlx	%g1,	%o3,	%l6
	sdiv	%i3,	0x01EB,	%l4
	edge16	%g5,	%i4,	%g4
	add	%i1,	%g6,	%i6
	udivx	%l3,	0x0891,	%i7
	subcc	%i2,	0x024F,	%l1
	fands	%f30,	%f23,	%f21
	lduh	[%l7 + 0x18],	%o0
	xorcc	%l0,	%o4,	%o5
	sdivx	%g3,	0x0C32,	%o1
	fmul8sux16	%f28,	%f18,	%f0
	fmovrsgez	%o6,	%f27,	%f23
	andncc	%i5,	%l2,	%g7
	fsrc1s	%f13,	%f9
	movn	%xcc,	%i0,	%o7
	fmovsl	%xcc,	%f1,	%f11
	umul	%g2,	0x1902,	%l5
	edge32ln	%o2,	%g1,	%l6
	fpackfix	%f12,	%f4
	sth	%i3,	[%l7 + 0x14]
	edge32n	%o3,	%g5,	%i4
	fsrc1s	%f22,	%f15
	edge16l	%g4,	%i1,	%g6
	popc	0x0337,	%i6
	edge16	%l3,	%l4,	%i7
	edge8ln	%l1,	%i2,	%l0
	umul	%o0,	0x0CB2,	%o4
	fmovrslez	%g3,	%f22,	%f27
	ldsh	[%l7 + 0x6C],	%o5
	movrlez	%o1,	0x279,	%i5
	sllx	%l2,	%o6,	%g7
	fmovsl	%icc,	%f3,	%f31
	stx	%i0,	[%l7 + 0x08]
	ldx	[%l7 + 0x60],	%o7
	srl	%l5,	%g2,	%o2
	st	%f8,	[%l7 + 0x4C]
	sll	%g1,	0x07,	%i3
	alignaddrl	%l6,	%g5,	%o3
	ldsw	[%l7 + 0x2C],	%g4
	fmuld8sux16	%f27,	%f13,	%f4
	andncc	%i1,	%i4,	%g6
	sra	%i6,	0x02,	%l3
	addccc	%i7,	%l4,	%i2
	stb	%l0,	[%l7 + 0x15]
	fpackfix	%f10,	%f1
	movcc	%icc,	%l1,	%o4
	movge	%icc,	%o0,	%o5
	xor	%g3,	%i5,	%l2
	fcmps	%fcc3,	%f17,	%f22
	mova	%xcc,	%o6,	%g7
	edge16l	%o1,	%i0,	%o7
	srl	%l5,	%o2,	%g1
	edge16l	%g2,	%i3,	%g5
	ldd	[%l7 + 0x78],	%i6
	udivx	%g4,	0x0574,	%i1
	xorcc	%o3,	%g6,	%i6
	movrgz	%i4,	%l3,	%l4
	movrgz	%i7,	0x0C0,	%i2
	sir	0x11D4
	ldsw	[%l7 + 0x24],	%l0
	addc	%o4,	%l1,	%o5
	stw	%g3,	[%l7 + 0x6C]
	movrgez	%i5,	0x174,	%o0
	movpos	%icc,	%l2,	%g7
	edge16l	%o1,	%o6,	%i0
	andcc	%o7,	0x14A2,	%o2
	edge16l	%l5,	%g1,	%i3
	fmul8x16au	%f11,	%f28,	%f14
	alignaddrl	%g2,	%l6,	%g4
	fmovse	%icc,	%f14,	%f11
	orncc	%g5,	0x13E0,	%o3
	fnands	%f26,	%f29,	%f15
	fmovsn	%icc,	%f11,	%f3
	sth	%g6,	[%l7 + 0x3A]
	edge32ln	%i6,	%i4,	%i1
	srl	%l3,	%l4,	%i7
	srl	%l0,	0x1E,	%o4
	stb	%i2,	[%l7 + 0x53]
	umulcc	%o5,	0x1E17,	%g3
	srlx	%l1,	0x0B,	%o0
	fnand	%f28,	%f10,	%f8
	alignaddrl	%i5,	%g7,	%o1
	addc	%o6,	%i0,	%o7
	fpsub32	%f18,	%f18,	%f14
	lduw	[%l7 + 0x34],	%o2
	save %l2, 0x0491, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i3,	%g1
	edge16ln	%l6,	%g4,	%g5
	sethi	0x063D,	%o3
	andn	%g2,	0x1767,	%g6
	fmovs	%f24,	%f27
	movne	%icc,	%i6,	%i1
	addc	%i4,	0x1FDB,	%l3
	sdivx	%l4,	0x1212,	%l0
	xnor	%o4,	0x0707,	%i2
	lduh	[%l7 + 0x14],	%o5
	orcc	%i7,	%l1,	%o0
	nop
	set	0x3F, %g7
	ldsb	[%l7 + %g7],	%i5
	fsrc1s	%f12,	%f31
	move	%xcc,	%g3,	%g7
	edge32l	%o1,	%i0,	%o6
	andn	%o2,	0x1C46,	%l2
	xorcc	%l5,	0x0AD6,	%o7
	ldd	[%l7 + 0x60],	%i2
	addc	%l6,	0x1834,	%g4
	fmul8x16al	%f29,	%f31,	%f6
	movg	%xcc,	%g5,	%o3
	fornot1s	%f3,	%f0,	%f16
	fsrc2s	%f21,	%f12
	sdivx	%g2,	0x1288,	%g1
	srl	%g6,	%i1,	%i6
	subc	%l3,	0x1EBE,	%l4
	edge32	%l0,	%i4,	%o4
	edge16n	%i2,	%o5,	%l1
	ldsb	[%l7 + 0x08],	%o0
	fornot2	%f30,	%f26,	%f8
	subcc	%i7,	%g3,	%g7
	alignaddrl	%i5,	%i0,	%o1
	edge32n	%o6,	%o2,	%l5
	stx	%o7,	[%l7 + 0x30]
	sdivcc	%i3,	0x00E4,	%l6
	lduw	[%l7 + 0x30],	%g4
	subcc	%g5,	%l2,	%o3
	or	%g2,	%g6,	%i1
	movgu	%xcc,	%g1,	%l3
	movneg	%icc,	%i6,	%l0
	fmovsn	%xcc,	%f16,	%f31
	move	%xcc,	%i4,	%o4
	lduw	[%l7 + 0x30],	%i2
	movrne	%l4,	0x1B3,	%o5
	udiv	%l1,	0x1D70,	%o0
	sllx	%i7,	%g7,	%i5
	fmovsgu	%xcc,	%f7,	%f7
	movpos	%xcc,	%g3,	%o1
	ldub	[%l7 + 0x1D],	%o6
	udivx	%o2,	0x0078,	%i0
	fpsub32	%f20,	%f18,	%f12
	andcc	%o7,	%l5,	%i3
	popc	%l6,	%g5
	movrgez	%g4,	%o3,	%g2
	fmovsvc	%xcc,	%f26,	%f13
	ldd	[%l7 + 0x30],	%f4
	ldx	[%l7 + 0x60],	%g6
	movvs	%icc,	%i1,	%g1
	array32	%l3,	%l2,	%i6
	udiv	%l0,	0x03D4,	%o4
	movrlz	%i2,	%i4,	%o5
	addc	%l4,	%o0,	%i7
	movneg	%icc,	%l1,	%i5
	orncc	%g3,	0x11FD,	%o1
	fpadd16s	%f31,	%f23,	%f5
	fmovrdgez	%g7,	%f6,	%f8
	xorcc	%o2,	0x0E4F,	%o6
	alignaddrl	%i0,	%o7,	%l5
	fxor	%f14,	%f20,	%f6
	srax	%i3,	0x0C,	%g5
	faligndata	%f6,	%f8,	%f18
	fmovdgu	%icc,	%f9,	%f23
	xorcc	%g4,	0x0319,	%o3
	movrlz	%l6,	0x249,	%g2
	fmovs	%f29,	%f10
	sllx	%g6,	0x13,	%g1
	edge8	%l3,	%l2,	%i1
	andcc	%i6,	%l0,	%o4
	movl	%icc,	%i4,	%i2
	and	%o5,	%o0,	%l4
	fone	%f18
	orn	%i7,	%i5,	%g3
	udivx	%o1,	0x04B9,	%g7
	movn	%xcc,	%o2,	%o6
	edge16ln	%l1,	%i0,	%o7
	orcc	%l5,	0x1BFB,	%i3
	movrlz	%g4,	%g5,	%l6
	fzero	%f8
	fmovsvc	%xcc,	%f9,	%f11
	fand	%f6,	%f30,	%f30
	fpsub32	%f4,	%f4,	%f0
	nop
	set	0x0E, %i4
	lduh	[%l7 + %i4],	%o3
	popc	%g2,	%g6
	fmovscc	%xcc,	%f10,	%f27
	fands	%f13,	%f22,	%f1
	movgu	%icc,	%g1,	%l3
	fpack16	%f14,	%f4
	edge8l	%l2,	%i6,	%l0
	array8	%i1,	%i4,	%o4
	or	%o5,	%o0,	%l4
	fcmpne16	%f30,	%f30,	%i7
	movpos	%icc,	%i5,	%i2
	ldsb	[%l7 + 0x33],	%g3
	movne	%icc,	%o1,	%g7
	xnor	%o6,	%l1,	%i0
	subcc	%o7,	0x0E1C,	%l5
	stx	%o2,	[%l7 + 0x78]
	alignaddr	%g4,	%g5,	%i3
	sir	0x0046
	subcc	%l6,	0x1501,	%g2
	movge	%xcc,	%g6,	%o3
	ldsb	[%l7 + 0x2F],	%l3
	fmovsneg	%xcc,	%f14,	%f26
	smulcc	%g1,	0x0D2C,	%i6
	orncc	%l0,	0x06D7,	%l2
	fcmped	%fcc3,	%f30,	%f6
	fors	%f23,	%f14,	%f22
	stw	%i4,	[%l7 + 0x5C]
	edge16ln	%i1,	%o5,	%o4
	movrgz	%l4,	0x0D3,	%i7
	ldx	[%l7 + 0x38],	%i5
	fmovdcs	%xcc,	%f25,	%f17
	udivx	%i2,	0x03B1,	%o0
	movgu	%icc,	%o1,	%g7
	ld	[%l7 + 0x34],	%f23
	fmovs	%f2,	%f1
	sdivx	%g3,	0x0AAD,	%l1
	movcs	%icc,	%i0,	%o6
	fmovdleu	%icc,	%f19,	%f13
	array16	%l5,	%o7,	%o2
	popc	%g4,	%i3
	sra	%g5,	%g2,	%g6
	edge32	%o3,	%l6,	%l3
	edge32l	%i6,	%g1,	%l2
	fmovscs	%xcc,	%f26,	%f16
	fmul8x16	%f18,	%f8,	%f20
	fmovse	%xcc,	%f2,	%f7
	fcmpgt32	%f4,	%f10,	%l0
	udiv	%i4,	0x1CFF,	%i1
	srlx	%o4,	0x10,	%l4
	andn	%o5,	0x092C,	%i7
	edge32	%i2,	%i5,	%o1
	ldd	[%l7 + 0x18],	%g6
	movrlz	%g3,	0x312,	%o0
	array16	%i0,	%l1,	%l5
	add	%o6,	%o7,	%g4
	movrgz	%o2,	0x1EB,	%g5
	srl	%g2,	0x17,	%g6
	edge32ln	%i3,	%o3,	%l6
	mova	%xcc,	%i6,	%g1
	movcs	%xcc,	%l2,	%l3
	sra	%i4,	%l0,	%i1
	stb	%o4,	[%l7 + 0x36]
	movre	%l4,	0x31E,	%o5
	sdivx	%i2,	0x11DF,	%i5
	sra	%i7,	%o1,	%g7
	addccc	%o0,	%i0,	%g3
	edge16ln	%l1,	%o6,	%o7
	ldx	[%l7 + 0x68],	%l5
	fmovsg	%xcc,	%f26,	%f2
	fand	%f8,	%f18,	%f16
	movcs	%icc,	%g4,	%o2
	for	%f24,	%f30,	%f18
	fsrc1s	%f5,	%f6
	sdivcc	%g5,	0x0DF3,	%g6
	orcc	%g2,	%o3,	%i3
	edge16n	%i6,	%l6,	%l2
	addccc	%l3,	%g1,	%i4
	fmovdgu	%xcc,	%f28,	%f20
	alignaddr	%i1,	%l0,	%l4
	edge32l	%o4,	%o5,	%i2
	fnegd	%f20,	%f28
	udivcc	%i5,	0x17C3,	%o1
	sra	%g7,	0x02,	%i7
	fmovdneg	%icc,	%f30,	%f10
	mova	%xcc,	%o0,	%i0
	fcmpeq16	%f20,	%f12,	%l1
	movpos	%icc,	%o6,	%g3
	movrne	%o7,	0x306,	%l5
	fnot2s	%f13,	%f21
	array8	%o2,	%g5,	%g6
	std	%f2,	[%l7 + 0x48]
	mulx	%g2,	%g4,	%i3
	ldub	[%l7 + 0x0B],	%i6
	fcmped	%fcc0,	%f18,	%f24
	movre	%l6,	%o3,	%l2
	edge32n	%l3,	%i4,	%g1
	ldd	[%l7 + 0x08],	%f30
	edge8n	%i1,	%l0,	%l4
	orcc	%o5,	%o4,	%i2
	ldub	[%l7 + 0x6D],	%o1
	umul	%i5,	%i7,	%o0
	addcc	%i0,	0x043B,	%l1
	movre	%o6,	0x0B6,	%g7
	smul	%g3,	%l5,	%o2
	subcc	%o7,	%g5,	%g2
	sir	0x0186
	orn	%g4,	%g6,	%i6
	edge16ln	%l6,	%o3,	%l2
	andncc	%l3,	%i3,	%i4
	movrlez	%i1,	%l0,	%g1
	add	%l4,	0x0993,	%o4
	lduh	[%l7 + 0x40],	%o5
	sll	%i2,	%i5,	%o1
	sdivcc	%o0,	0x0AEF,	%i0
	fmovsa	%xcc,	%f16,	%f1
	movg	%icc,	%l1,	%o6
	popc	0x10C3,	%i7
	edge8l	%g7,	%l5,	%g3
	movvc	%icc,	%o2,	%g5
	umul	%o7,	0x0B98,	%g4
	mova	%xcc,	%g6,	%i6
	addccc	%l6,	0x1A08,	%o3
	movrgz	%l2,	0x1CF,	%g2
	subc	%l3,	%i4,	%i3
	fcmpgt32	%f4,	%f18,	%i1
	restore %l0, %g1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l4,	0x0D71,	%i2
	edge32	%o5,	%i5,	%o1
	xnorcc	%o0,	0x1CD0,	%i0
	fmovrdgez	%l1,	%f24,	%f24
	fcmpne16	%f12,	%f2,	%o6
	edge32n	%g7,	%i7,	%l5
	or	%o2,	%g3,	%g5
	popc	%o7,	%g6
	mulx	%i6,	0x17D7,	%l6
	ldx	[%l7 + 0x68],	%o3
	movge	%icc,	%g4,	%g2
	ldd	[%l7 + 0x50],	%l2
	xnorcc	%i4,	0x0727,	%l3
	udivcc	%i1,	0x1711,	%l0
	mulscc	%g1,	%o4,	%l4
	stx	%i2,	[%l7 + 0x70]
	array16	%o5,	%i5,	%o1
	fcmped	%fcc0,	%f14,	%f0
	sllx	%i3,	0x16,	%o0
	movleu	%xcc,	%l1,	%i0
	xnor	%o6,	0x18E6,	%i7
	orncc	%l5,	0x0464,	%o2
	fmovda	%xcc,	%f19,	%f19
	popc	%g7,	%g5
	fnot2	%f16,	%f18
	fpsub32s	%f30,	%f3,	%f19
	fpsub16	%f12,	%f6,	%f8
	movcs	%icc,	%o7,	%g6
	alignaddr	%i6,	%g3,	%l6
	sethi	0x0938,	%o3
	edge32n	%g2,	%g4,	%l2
	movgu	%xcc,	%l3,	%i1
	edge8n	%i4,	%l0,	%g1
	edge16n	%o4,	%l4,	%i2
	udivx	%i5,	0x1ADF,	%o1
	fandnot1s	%f30,	%f24,	%f28
	edge32l	%i3,	%o0,	%o5
	fmovsa	%icc,	%f26,	%f21
	movge	%icc,	%l1,	%o6
	fone	%f4
	orn	%i0,	%l5,	%o2
	fpack16	%f24,	%f29
	siam	0x6
	stb	%g7,	[%l7 + 0x19]
	movrgz	%i7,	%o7,	%g6
	movrgez	%i6,	%g3,	%g5
	movrlez	%l6,	0x1D7,	%o3
	subcc	%g4,	%g2,	%l2
	fnegs	%f23,	%f27
	movcs	%xcc,	%i1,	%i4
	addc	%l0,	%l3,	%g1
	sdiv	%o4,	0x13F1,	%i2
	movgu	%icc,	%i5,	%o1
	fxors	%f19,	%f31,	%f17
	movle	%icc,	%i3,	%o0
	smul	%l4,	%l1,	%o6
	sll	%o5,	0x11,	%l5
	xorcc	%o2,	%i0,	%i7
	ldsw	[%l7 + 0x10],	%g7
	fmovdne	%icc,	%f26,	%f16
	movleu	%xcc,	%g6,	%o7
	fcmple32	%f24,	%f28,	%i6
	ldd	[%l7 + 0x70],	%f24
	edge32n	%g3,	%l6,	%g5
	and	%g4,	%g2,	%o3
	udivx	%l2,	0x0BC8,	%i4
	edge8l	%i1,	%l0,	%g1
	mulscc	%l3,	%i2,	%o4
	movcc	%xcc,	%i5,	%o1
	st	%f26,	[%l7 + 0x0C]
	movn	%icc,	%o0,	%l4
	std	%f20,	[%l7 + 0x48]
	edge32	%i3,	%l1,	%o6
	fandnot1s	%f21,	%f18,	%f17
	xorcc	%o5,	%l5,	%o2
	fpadd32	%f14,	%f14,	%f10
	or	%i7,	%i0,	%g7
	sll	%o7,	0x1F,	%g6
	movvc	%xcc,	%g3,	%l6
	subc	%i6,	0x161D,	%g4
	fzeros	%f9
	ldd	[%l7 + 0x68],	%f22
	movneg	%xcc,	%g2,	%g5
	udiv	%l2,	0x1F3A,	%o3
	ldd	[%l7 + 0x68],	%i4
	edge16n	%l0,	%i1,	%l3
	ldub	[%l7 + 0x15],	%g1
	movl	%icc,	%o4,	%i5
	fmovscc	%icc,	%f29,	%f18
	array32	%o1,	%i2,	%l4
	umul	%i3,	0x0082,	%o0
	stx	%o6,	[%l7 + 0x10]
	st	%f8,	[%l7 + 0x6C]
	edge16l	%o5,	%l1,	%o2
	fmovdg	%xcc,	%f31,	%f7
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	fpackfix	%f30,	%f27
	movleu	%xcc,	%o7,	%g6
	fmovrde	%g3,	%f16,	%f24
	movg	%xcc,	%g7,	%l6
	fcmpne16	%f2,	%f24,	%i6
	fmovsgu	%icc,	%f0,	%f10
	fmovdvc	%xcc,	%f18,	%f11
	udivx	%g4,	0x1184,	%g2
	movge	%icc,	%l2,	%o3
	sdiv	%i4,	0x1435,	%g5
	fmovdl	%icc,	%f14,	%f23
	movge	%xcc,	%l0,	%l3
	lduh	[%l7 + 0x6E],	%i1
	fmovdn	%xcc,	%f24,	%f14
	sll	%o4,	0x10,	%i5
	edge16	%g1,	%o1,	%l4
	fnot2	%f12,	%f8
	xnor	%i3,	0x0D94,	%i2
	fmovspos	%xcc,	%f29,	%f4
	fmul8x16	%f24,	%f2,	%f26
	stx	%o6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%o0
	fnegd	%f6,	%f24
	mulx	%l1,	0x0A0F,	%o5
	udiv	%o2,	0x0972,	%i7
	fmovde	%xcc,	%f30,	%f16
	array8	%l5,	%i0,	%g6
	fxor	%f6,	%f20,	%f8
	fmovrsgez	%o7,	%f19,	%f21
	sll	%g7,	%l6,	%g3
	move	%icc,	%i6,	%g4
	fands	%f31,	%f23,	%f11
	edge32l	%l2,	%g2,	%o3
	umul	%i4,	%l0,	%l3
	fexpand	%f31,	%f30
	xor	%i1,	0x1060,	%o4
	movrlez	%g5,	0x1F7,	%g1
	xnor	%i5,	0x021F,	%l4
	movleu	%icc,	%o1,	%i2
	movn	%icc,	%i3,	%o0
	movrlez	%l1,	%o5,	%o6
	movrlez	%o2,	%l5,	%i0
	xnor	%i7,	%o7,	%g7
	addc	%l6,	%g6,	%g3
	sra	%i6,	%g4,	%l2
	movl	%xcc,	%o3,	%i4
	fmovdge	%xcc,	%f16,	%f20
	movrne	%l0,	0x254,	%l3
	fpmerge	%f22,	%f25,	%f26
	edge16	%i1,	%g2,	%g5
	umul	%g1,	0x0721,	%o4
	ldx	[%l7 + 0x30],	%i5
	xnor	%o1,	0x12B6,	%i2
	lduw	[%l7 + 0x4C],	%i3
	lduw	[%l7 + 0x50],	%l4
	fmovde	%xcc,	%f3,	%f11
	udivcc	%o0,	0x1034,	%l1
	fornot1s	%f3,	%f30,	%f26
	stb	%o5,	[%l7 + 0x40]
	addc	%o6,	0x0EBD,	%o2
	sra	%i0,	0x0F,	%l5
	stw	%i7,	[%l7 + 0x28]
	stw	%o7,	[%l7 + 0x24]
	stb	%g7,	[%l7 + 0x55]
	fmovsn	%xcc,	%f23,	%f31
	xorcc	%l6,	%g6,	%g3
	fmovdvc	%xcc,	%f18,	%f13
	xorcc	%i6,	%g4,	%o3
	ldx	[%l7 + 0x20],	%l2
	fpsub32s	%f22,	%f21,	%f20
	edge16n	%l0,	%i4,	%i1
	std	%f12,	[%l7 + 0x10]
	fornot2	%f24,	%f0,	%f0
	edge16	%g2,	%l3,	%g5
	edge8l	%o4,	%i5,	%o1
	movle	%xcc,	%i2,	%i3
	array8	%g1,	%o0,	%l1
	save %l4, %o6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o2,	0x0B,	%l5
	fxor	%f6,	%f8,	%f22
	mova	%icc,	%i0,	%o7
	edge8n	%i7,	%g7,	%g6
	srax	%l6,	0x1B,	%g3
	subc	%i6,	%g4,	%o3
	smulcc	%l0,	0x07BB,	%i4
	sra	%l2,	%i1,	%g2
	fmovsvs	%xcc,	%f5,	%f4
	fnors	%f14,	%f1,	%f11
	save %g5, %l3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f13,	%f17
	srlx	%o4,	%i2,	%o1
	movvs	%icc,	%i3,	%o0
	fabsd	%f16,	%f28
	array16	%l1,	%g1,	%l4
	movl	%icc,	%o6,	%o5
	xnorcc	%o2,	0x0AEC,	%i0
	fmul8ulx16	%f26,	%f12,	%f12
	movcs	%icc,	%l5,	%i7
	ldd	[%l7 + 0x48],	%f18
	fmovrsgez	%o7,	%f0,	%f18
	fmovda	%xcc,	%f5,	%f23
	sdivcc	%g6,	0x024C,	%g7
	fnot1	%f20,	%f4
	xor	%g3,	%l6,	%g4
	orncc	%i6,	0x0B97,	%l0
	movvc	%icc,	%o3,	%i4
	array8	%l2,	%i1,	%g2
	fmovda	%xcc,	%f23,	%f15
	sethi	0x198F,	%l3
	movvc	%xcc,	%i5,	%o4
	addccc	%g5,	0x0DEC,	%o1
	orncc	%i3,	%i2,	%l1
	movge	%icc,	%g1,	%l4
	udivcc	%o0,	0x149D,	%o6
	edge8ln	%o5,	%o2,	%i0
	array16	%i7,	%o7,	%g6
	edge32l	%g7,	%l5,	%g3
	smul	%g4,	%i6,	%l0
	udiv	%l6,	0x078E,	%i4
	subc	%o3,	%i1,	%g2
	edge16ln	%l3,	%l2,	%i5
	fmovscc	%icc,	%f4,	%f14
	udiv	%o4,	0x0BA3,	%o1
	sdiv	%g5,	0x1E95,	%i3
	fpadd32s	%f1,	%f22,	%f28
	fmovrdne	%i2,	%f26,	%f6
	move	%icc,	%g1,	%l4
	sdivcc	%o0,	0x1330,	%o6
	fmovsgu	%icc,	%f4,	%f2
	restore %l1, 0x1F61, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i0,	%i7,	%o7
	movle	%icc,	%o5,	%g6
	smulcc	%l5,	%g7,	%g4
	array8	%i6,	%l0,	%l6
	umul	%i4,	%g3,	%i1
	umulcc	%g2,	0x0040,	%o3
	fmovsl	%icc,	%f6,	%f1
	nop
	set	0x42, %o7
	sth	%l3,	[%l7 + %o7]
	movneg	%xcc,	%l2,	%o4
	andcc	%i5,	%o1,	%g5
	stb	%i3,	[%l7 + 0x3C]
	addcc	%i2,	0x1EEC,	%l4
	fmovsgu	%xcc,	%f0,	%f11
	fmovsne	%icc,	%f11,	%f2
	sdivcc	%o0,	0x0332,	%g1
	edge16l	%l1,	%o6,	%o2
	sdiv	%i7,	0x0C0E,	%i0
	fmovde	%icc,	%f17,	%f12
	sdivcc	%o5,	0x1D37,	%o7
	smul	%l5,	0x0C62,	%g7
	fands	%f3,	%f1,	%f9
	ldub	[%l7 + 0x29],	%g6
	sth	%i6,	[%l7 + 0x26]
	ldx	[%l7 + 0x48],	%l0
	addccc	%g4,	0x1B3F,	%i4
	fand	%f2,	%f24,	%f0
	fmovdpos	%icc,	%f9,	%f3
	sdivcc	%g3,	0x0DB1,	%l6
	ldd	[%l7 + 0x40],	%f16
	fmul8x16au	%f21,	%f7,	%f16
	save %g2, %i1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l3,	%l2,	%o4
	addccc	%o1,	%g5,	%i3
	array32	%i2,	%l4,	%i5
	fornot2s	%f31,	%f2,	%f25
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	fzeros	%f27
	or	%o0,	%o2,	%o6
	fmovdleu	%xcc,	%f28,	%f5
	fmovsn	%xcc,	%f1,	%f3
	andncc	%i7,	%i0,	%o5
	edge8l	%o7,	%l5,	%g6
	xorcc	%i6,	%g7,	%g4
	edge32	%i4,	%g3,	%l6
	edge16l	%g2,	%i1,	%o3
	stx	%l3,	[%l7 + 0x38]
	addc	%l0,	%o4,	%o1
	edge8ln	%g5,	%l2,	%i3
	smulcc	%i2,	%l4,	%i5
	lduw	[%l7 + 0x7C],	%l1
	edge32n	%o0,	%g1,	%o2
	or	%o6,	0x0952,	%i7
	movcc	%xcc,	%i0,	%o5
	mova	%xcc,	%o7,	%l5
	umulcc	%g6,	%i6,	%g7
	fnors	%f10,	%f2,	%f3
	st	%f13,	[%l7 + 0x74]
	nop
	set	0x2C, %o6
	ldsh	[%l7 + %o6],	%g4
	fcmpd	%fcc0,	%f22,	%f20
	srlx	%i4,	%l6,	%g3
	movre	%g2,	0x3C6,	%o3
	fcmpd	%fcc3,	%f18,	%f4
	fmovs	%f24,	%f25
	edge16	%l3,	%i1,	%l0
	movre	%o4,	%o1,	%g5
	fmovrsgz	%l2,	%f17,	%f28
	srlx	%i3,	0x0D,	%l4
	stw	%i5,	[%l7 + 0x60]
	mulx	%l1,	0x0A8E,	%i2
	fornot1s	%f25,	%f30,	%f1
	fpsub16s	%f16,	%f20,	%f8
	srl	%o0,	%o2,	%o6
	sdiv	%i7,	0x0CC5,	%i0
	popc	0x101F,	%o5
	sra	%o7,	0x13,	%g1
	ldsw	[%l7 + 0x74],	%g6
	fcmpeq32	%f16,	%f4,	%i6
	sth	%g7,	[%l7 + 0x2E]
	ldd	[%l7 + 0x70],	%f24
	restore %g4, %l5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g3,	%g2
	andcc	%i4,	0x0F6E,	%l3
	movrgz	%o3,	0x03A,	%i1
	nop
	set	0x26, %g2
	ldsb	[%l7 + %g2],	%l0
	fand	%f6,	%f6,	%f16
	fandnot2s	%f16,	%f31,	%f6
	xnor	%o1,	0x190B,	%g5
	smulcc	%l2,	0x1DC4,	%o4
	udivx	%l4,	0x1536,	%i3
	mova	%xcc,	%i5,	%i2
	edge16l	%l1,	%o2,	%o6
	fmovs	%f6,	%f10
	fcmpne16	%f2,	%f14,	%i7
	subccc	%o0,	%i0,	%o7
	fnand	%f22,	%f18,	%f14
	fmuld8ulx16	%f0,	%f1,	%f10
	edge16ln	%o5,	%g1,	%i6
	array16	%g7,	%g4,	%g6
	mova	%icc,	%l5,	%l6
	fmul8x16au	%f31,	%f6,	%f12
	movn	%icc,	%g2,	%i4
	fnands	%f24,	%f9,	%f22
	sdivcc	%l3,	0x1C2A,	%g3
	edge16	%o3,	%l0,	%i1
	edge16	%o1,	%l2,	%o4
	sdivx	%l4,	0x0A2E,	%i3
	xorcc	%g5,	0x0608,	%i5
	movrgez	%i2,	%o2,	%o6
	xnor	%l1,	%o0,	%i7
	mulx	%i0,	0x0381,	%o7
	andn	%g1,	0x1AD9,	%i6
	srlx	%g7,	0x11,	%o5
	fpsub16	%f4,	%f18,	%f0
	edge32ln	%g6,	%l5,	%g4
	edge32	%l6,	%g2,	%i4
	stb	%l3,	[%l7 + 0x5F]
	fmovrdgez	%o3,	%f6,	%f16
	fandnot2s	%f19,	%f27,	%f14
	fmovrdgez	%g3,	%f16,	%f12
	movge	%xcc,	%l0,	%i1
	edge8l	%o1,	%o4,	%l2
	udiv	%i3,	0x0061,	%g5
	movle	%icc,	%l4,	%i5
	stb	%o2,	[%l7 + 0x58]
	fmovdne	%xcc,	%f29,	%f8
	fmovrde	%o6,	%f28,	%f4
	add	%i2,	%l1,	%o0
	alignaddrl	%i0,	%o7,	%g1
	sdivx	%i7,	0x0710,	%g7
	udiv	%i6,	0x188F,	%o5
	movvc	%xcc,	%g6,	%g4
	stw	%l5,	[%l7 + 0x70]
	fandnot2	%f28,	%f18,	%f22
	edge16n	%g2,	%l6,	%i4
	andcc	%l3,	%g3,	%o3
	edge16ln	%l0,	%i1,	%o4
	umulcc	%o1,	0x0641,	%i3
	smulcc	%l2,	%l4,	%i5
	and	%g5,	%o6,	%i2
	edge16ln	%o2,	%l1,	%i0
	alignaddr	%o0,	%g1,	%i7
	movle	%xcc,	%o7,	%g7
	sdivcc	%o5,	0x1D8D,	%g6
	xnorcc	%i6,	0x0946,	%g4
	subcc	%l5,	0x09A0,	%l6
	edge16n	%g2,	%l3,	%g3
	ldub	[%l7 + 0x2D],	%i4
	fsrc2	%f10,	%f6
	udivx	%l0,	0x1C2B,	%o3
	fmovdne	%xcc,	%f22,	%f9
	movl	%xcc,	%i1,	%o4
	movre	%o1,	%i3,	%l2
	udivcc	%i5,	0x0C44,	%l4
	array16	%g5,	%o6,	%i2
	orn	%o2,	0x029C,	%i0
	mulx	%l1,	%o0,	%g1
	array32	%o7,	%i7,	%o5
	move	%icc,	%g7,	%g6
	alignaddrl	%g4,	%i6,	%l6
	move	%icc,	%g2,	%l3
	fmovsne	%icc,	%f2,	%f31
	siam	0x4
	fpsub16s	%f0,	%f28,	%f29
	sth	%g3,	[%l7 + 0x6E]
	popc	0x0DEA,	%i4
	edge32ln	%l5,	%l0,	%o3
	ldsw	[%l7 + 0x78],	%o4
	srl	%o1,	0x18,	%i3
	movvs	%xcc,	%i1,	%l2
	fnegs	%f13,	%f31
	movrgz	%l4,	%i5,	%g5
	movgu	%icc,	%o6,	%i2
	andn	%o2,	%i0,	%o0
	movrlz	%l1,	%o7,	%i7
	edge8l	%o5,	%g1,	%g6
	edge16ln	%g7,	%g4,	%i6
	fands	%f21,	%f3,	%f28
	movn	%icc,	%g2,	%l3
	movpos	%xcc,	%l6,	%i4
	fnegs	%f19,	%f13
	movge	%xcc,	%l5,	%l0
	fpadd32s	%f23,	%f11,	%f17
	srax	%o3,	0x01,	%o4
	fmuld8ulx16	%f27,	%f22,	%f18
	addcc	%g3,	%i3,	%o1
	save %i1, 0x0AB6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l2,	%i5,	%o6
	fcmpne32	%f22,	%f26,	%i2
	fmul8x16au	%f6,	%f25,	%f22
	edge8	%o2,	%i0,	%o0
	udivx	%l1,	0x04FA,	%o7
	andn	%g5,	0x1835,	%i7
	array8	%g1,	%g6,	%o5
	alignaddr	%g4,	%i6,	%g7
	nop
	set	0x20, %l0
	stx	%g2,	[%l7 + %l0]
	array32	%l3,	%l6,	%i4
	movcc	%icc,	%l0,	%l5
	edge16l	%o3,	%o4,	%i3
	ldd	[%l7 + 0x48],	%f14
	fandnot2	%f28,	%f6,	%f26
	andncc	%g3,	%o1,	%i1
	stx	%l2,	[%l7 + 0x78]
	movne	%icc,	%l4,	%o6
	addcc	%i5,	%o2,	%i0
	movvs	%xcc,	%i2,	%o0
	edge8l	%o7,	%l1,	%i7
	fmovse	%icc,	%f9,	%f27
	mulx	%g5,	0x1737,	%g6
	edge16l	%g1,	%g4,	%o5
	edge8n	%g7,	%i6,	%g2
	edge16l	%l3,	%i4,	%l0
	nop
	set	0x48, %i2
	lduw	[%l7 + %i2],	%l5
	stb	%o3,	[%l7 + 0x6B]
	sdivx	%l6,	0x1420,	%o4
	sth	%i3,	[%l7 + 0x74]
	movle	%xcc,	%o1,	%i1
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	udiv	%o6,	0x0528,	%i5
	fzeros	%f8
	udiv	%o2,	0x15D5,	%l4
	xnorcc	%i0,	%i2,	%o7
	movge	%icc,	%l1,	%o0
	movcc	%icc,	%i7,	%g5
	lduw	[%l7 + 0x6C],	%g1
	edge8ln	%g4,	%o5,	%g6
	fmovsvc	%xcc,	%f5,	%f22
	fmovdvs	%icc,	%f7,	%f15
	fmovsge	%xcc,	%f3,	%f25
	edge16n	%i6,	%g7,	%l3
	udivcc	%g2,	0x1C33,	%i4
	std	%f8,	[%l7 + 0x10]
	edge32l	%l5,	%l0,	%l6
	subc	%o4,	%o3,	%i3
	movl	%icc,	%i1,	%o1
	movneg	%icc,	%l2,	%o6
	movne	%xcc,	%i5,	%o2
	fcmpeq32	%f24,	%f8,	%g3
	lduh	[%l7 + 0x28],	%i0
	alignaddrl	%l4,	%o7,	%l1
	movvs	%icc,	%i2,	%o0
	edge16ln	%i7,	%g1,	%g5
	sethi	0x07B1,	%o5
	movleu	%xcc,	%g4,	%g6
	smul	%i6,	0x0713,	%g7
	movne	%icc,	%g2,	%l3
	fpack32	%f2,	%f26,	%f20
	umul	%i4,	%l0,	%l5
	sllx	%l6,	0x0A,	%o4
	edge8n	%i3,	%i1,	%o3
	fcmpeq16	%f14,	%f22,	%o1
	movre	%o6,	0x3EB,	%i5
	andn	%l2,	%o2,	%g3
	or	%l4,	0x1355,	%o7
	ldsw	[%l7 + 0x3C],	%l1
	fcmpeq32	%f14,	%f30,	%i0
	movvc	%xcc,	%i2,	%i7
	stw	%g1,	[%l7 + 0x0C]
	movvs	%xcc,	%g5,	%o5
	move	%xcc,	%o0,	%g6
	array8	%g4,	%g7,	%g2
	sllx	%l3,	0x0E,	%i6
	fnand	%f24,	%f0,	%f20
	udivx	%l0,	0x0B0F,	%l5
	fmovse	%xcc,	%f23,	%f30
	ld	[%l7 + 0x38],	%f23
	array8	%i4,	%o4,	%l6
	fcmpes	%fcc3,	%f10,	%f21
	movrlz	%i3,	%o3,	%i1
	xnorcc	%o1,	0x032B,	%i5
	stx	%l2,	[%l7 + 0x20]
	movg	%xcc,	%o6,	%o2
	edge32n	%l4,	%g3,	%o7
	lduw	[%l7 + 0x64],	%i0
	fandnot2	%f26,	%f24,	%f22
	movg	%icc,	%i2,	%i7
	siam	0x5
	fone	%f22
	alignaddrl	%g1,	%l1,	%g5
	fandnot1	%f16,	%f28,	%f14
	move	%xcc,	%o5,	%g6
	fpsub16s	%f14,	%f28,	%f14
	std	%f16,	[%l7 + 0x60]
	movvc	%icc,	%o0,	%g7
	umulcc	%g2,	%l3,	%g4
	siam	0x7
	edge32l	%l0,	%i6,	%l5
	popc	%o4,	%l6
	fcmpes	%fcc3,	%f4,	%f19
	ldsb	[%l7 + 0x49],	%i3
	fnegs	%f18,	%f27
	movpos	%icc,	%i4,	%i1
	sra	%o3,	%o1,	%l2
	edge16	%o6,	%i5,	%l4
	mulscc	%o2,	0x1E12,	%o7
	andn	%g3,	0x0875,	%i0
	fpadd16	%f20,	%f12,	%f28
	nop
	set	0x10, %o3
	lduw	[%l7 + %o3],	%i2
	subc	%g1,	%l1,	%i7
	andcc	%o5,	0x09A1,	%g5
	ldsw	[%l7 + 0x20],	%o0
	xnor	%g6,	0x17CD,	%g7
	fmovs	%f14,	%f14
	movle	%icc,	%g2,	%l3
	nop
	set	0x74, %i0
	lduw	[%l7 + %i0],	%g4
	edge16n	%i6,	%l5,	%l0
	smulcc	%l6,	0x0788,	%i3
	sdiv	%i4,	0x106A,	%o4
	fcmple16	%f12,	%f28,	%i1
	nop
	set	0x08, %g3
	std	%f12,	[%l7 + %g3]
	sdiv	%o1,	0x00F0,	%l2
	srlx	%o6,	0x0D,	%o3
	smul	%i5,	0x1567,	%l4
	array32	%o7,	%o2,	%i0
	xorcc	%i2,	0x09C8,	%g3
	andn	%g1,	%i7,	%l1
	edge16ln	%g5,	%o0,	%o5
	mulscc	%g7,	0x0B03,	%g2
	fmovdgu	%xcc,	%f17,	%f9
	orcc	%l3,	%g6,	%i6
	movvs	%icc,	%g4,	%l0
	smulcc	%l6,	0x0B18,	%l5
	edge32ln	%i3,	%i4,	%i1
	srlx	%o4,	0x08,	%l2
	fmovda	%icc,	%f31,	%f5
	edge8	%o6,	%o1,	%o3
	fand	%f26,	%f2,	%f8
	orncc	%l4,	%i5,	%o2
	fmovrslz	%i0,	%f24,	%f8
	smulcc	%o7,	0x17D6,	%g3
	fmul8x16	%f28,	%f28,	%f26
	movn	%xcc,	%g1,	%i2
	fxor	%f24,	%f12,	%f6
	edge16n	%l1,	%g5,	%o0
	fpadd16s	%f5,	%f4,	%f17
	movl	%xcc,	%o5,	%g7
	siam	0x4
	fsrc2s	%f21,	%f29
	edge8n	%i7,	%g2,	%l3
	fmovdneg	%icc,	%f22,	%f1
	movl	%xcc,	%i6,	%g4
	stx	%l0,	[%l7 + 0x08]
	edge16l	%g6,	%l6,	%i3
	xnorcc	%l5,	0x0FC3,	%i1
	movl	%icc,	%o4,	%i4
	movrgz	%o6,	0x1E0,	%l2
	fmovsg	%xcc,	%f22,	%f17
	xor	%o1,	0x18A7,	%o3
	movneg	%icc,	%l4,	%i5
	edge16ln	%i0,	%o7,	%o2
	xnor	%g3,	0x0857,	%i2
	lduh	[%l7 + 0x2A],	%g1
	movgu	%icc,	%g5,	%o0
	and	%l1,	0x0E85,	%g7
	fmovdcc	%xcc,	%f17,	%f11
	fmovspos	%xcc,	%f29,	%f19
	array32	%i7,	%g2,	%o5
	fpsub16s	%f5,	%f2,	%f7
	sth	%l3,	[%l7 + 0x46]
	edge16n	%g4,	%i6,	%l0
	movcc	%icc,	%g6,	%i3
	save %l5, %i1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o4,	%o6
	and	%i4,	0x1BDB,	%o1
	sdivcc	%l2,	0x074A,	%o3
	andcc	%l4,	%i5,	%o7
	alignaddrl	%i0,	%o2,	%i2
	fmovsge	%icc,	%f31,	%f19
	fmovde	%xcc,	%f6,	%f10
	subc	%g1,	0x07B0,	%g3
	srl	%g5,	0x15,	%o0
	array8	%g7,	%i7,	%g2
	fxnors	%f5,	%f15,	%f31
	umul	%l1,	0x174D,	%l3
	smulcc	%o5,	%i6,	%l0
	movrgez	%g6,	0x153,	%i3
	movgu	%icc,	%g4,	%l5
	save %i1, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x50],	%o6
	ldd	[%l7 + 0x30],	%f4
	array16	%i4,	%l2,	%o3
	fmovrdne	%o1,	%f18,	%f16
	andncc	%i5,	%l4,	%i0
	array32	%o7,	%o2,	%i2
	fnegd	%f2,	%f4
	udiv	%g1,	0x1C1B,	%g3
	movvs	%icc,	%g5,	%g7
	udivx	%o0,	0x1F6D,	%i7
	fmovdle	%xcc,	%f5,	%f14
	udivx	%g2,	0x154E,	%l3
	ldd	[%l7 + 0x60],	%f16
	fmul8x16	%f9,	%f4,	%f26
	array16	%l1,	%o5,	%l0
	umulcc	%g6,	0x1D7B,	%i3
	subc	%g4,	0x0FC0,	%i6
	fmovsl	%icc,	%f11,	%f20
	srlx	%i1,	0x07,	%l6
	fmovscs	%icc,	%f5,	%f11
	sdivx	%o4,	0x1E41,	%o6
	ldx	[%l7 + 0x08],	%l5
	restore %i4, %o3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i5,	%l4,	%i0
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	stx	%i2,	[%l7 + 0x38]
	sir	0x0F15
	fnors	%f28,	%f11,	%f25
	subcc	%g1,	0x1222,	%g3
	movrgez	%g7,	0x338,	%o0
	movg	%xcc,	%i7,	%g5
	srl	%g2,	%l1,	%o5
	fmovrsne	%l0,	%f6,	%f6
	xorcc	%g6,	%l3,	%g4
	movvc	%xcc,	%i3,	%i6
	movvc	%xcc,	%l6,	%i1
	edge32l	%o6,	%o4,	%i4
	restore %o3, %o1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l5,	%l4
	std	%f28,	[%l7 + 0x20]
	srax	%i0,	%o2,	%o7
	udivcc	%i2,	0x1812,	%l2
	fmovsl	%icc,	%f15,	%f9
	fmul8x16	%f10,	%f6,	%f2
	fmovdgu	%icc,	%f3,	%f30
	sethi	0x1A35,	%g1
	ldub	[%l7 + 0x19],	%g3
	subcc	%o0,	0x131A,	%i7
	srax	%g7,	0x17,	%g2
	edge16ln	%l1,	%o5,	%g5
	st	%f1,	[%l7 + 0x08]
	subccc	%g6,	%l0,	%l3
	mulscc	%i3,	%g4,	%l6
	subcc	%i1,	%i6,	%o6
	move	%icc,	%o4,	%i4
	srax	%o3,	0x1C,	%o1
	array16	%l5,	%i5,	%l4
	alignaddr	%i0,	%o2,	%i2
	mulx	%o7,	0x1B97,	%l2
	lduw	[%l7 + 0x64],	%g1
	array16	%o0,	%g3,	%i7
	fmovscc	%xcc,	%f21,	%f6
	std	%f14,	[%l7 + 0x38]
	fnot1s	%f27,	%f15
	sir	0x1B7E
	srax	%g2,	0x1F,	%l1
	sdiv	%o5,	0x13EC,	%g5
	umulcc	%g7,	%g6,	%l3
	movne	%icc,	%l0,	%i3
	sllx	%l6,	%i1,	%i6
	ldx	[%l7 + 0x28],	%g4
	xnor	%o6,	0x0C99,	%o4
	xnorcc	%i4,	%o1,	%l5
	movrlez	%o3,	%l4,	%i0
	lduh	[%l7 + 0x60],	%i5
	ldx	[%l7 + 0x08],	%i2
	fxnor	%f4,	%f26,	%f0
	sdivx	%o2,	0x1F98,	%o7
	orcc	%g1,	0x1D1A,	%o0
	sll	%g3,	%l2,	%i7
	sth	%l1,	[%l7 + 0x76]
	srlx	%o5,	0x19,	%g2
	fornot1	%f4,	%f8,	%f8
	fmovrdne	%g5,	%f16,	%f2
	fnot1	%f26,	%f26
	movleu	%xcc,	%g6,	%g7
	array32	%l0,	%l3,	%i3
	stw	%l6,	[%l7 + 0x38]
	fmul8x16	%f28,	%f2,	%f22
	movrgez	%i6,	%i1,	%g4
	fsrc2	%f26,	%f2
	movleu	%xcc,	%o6,	%i4
	ldx	[%l7 + 0x20],	%o4
	edge32n	%o1,	%o3,	%l5
	edge32	%l4,	%i5,	%i0
	xor	%i2,	%o7,	%g1
	subcc	%o0,	%o2,	%l2
	sdiv	%i7,	0x0F3A,	%g3
	ldd	[%l7 + 0x10],	%f18
	movgu	%xcc,	%o5,	%l1
	mulx	%g2,	0x1468,	%g6
	subccc	%g7,	%g5,	%l3
	fxnor	%f2,	%f30,	%f0
	xorcc	%l0,	%i3,	%i6
	mulx	%i1,	%g4,	%l6
	movpos	%xcc,	%o6,	%o4
	movg	%xcc,	%i4,	%o1
	fmul8x16al	%f21,	%f15,	%f14
	add	%l5,	%o3,	%l4
	udivcc	%i5,	0x12EB,	%i0
	xor	%i2,	%g1,	%o0
	sdivx	%o2,	0x10A8,	%l2
	movvc	%xcc,	%o7,	%g3
	fmovd	%f10,	%f10
	xnorcc	%i7,	0x1F01,	%l1
	umul	%g2,	%g6,	%o5
	udivx	%g7,	0x073F,	%g5
	xnor	%l3,	0x1970,	%l0
	fnor	%f22,	%f14,	%f2
	sethi	0x17E9,	%i3
	xor	%i6,	0x1EB2,	%g4
	array8	%l6,	%i1,	%o6
	movg	%xcc,	%o4,	%i4
	movre	%o1,	%l5,	%o3
	array8	%l4,	%i0,	%i5
	subccc	%i2,	%g1,	%o0
	srl	%o2,	%o7,	%g3
	orncc	%i7,	0x19BF,	%l2
	array16	%g2,	%g6,	%o5
	mulscc	%l1,	%g5,	%g7
	edge16ln	%l3,	%l0,	%i6
	andn	%i3,	0x05F9,	%g4
	and	%l6,	0x00F1,	%o6
	srlx	%i1,	0x00,	%o4
	save %i4, %l5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	%l4,	%i0
	movvs	%icc,	%i5,	%g1
	edge8n	%i2,	%o0,	%o7
	and	%o2,	%g3,	%l2
	srax	%i7,	0x10,	%g6
	sir	0x1314
	movpos	%icc,	%o5,	%l1
	movpos	%icc,	%g2,	%g5
	movl	%xcc,	%g7,	%l3
	movneg	%icc,	%i6,	%i3
	fmovsvc	%icc,	%f9,	%f21
	fornot1s	%f30,	%f25,	%f11
	fnot2s	%f30,	%f31
	movneg	%xcc,	%l0,	%g4
	ldsw	[%l7 + 0x34],	%l6
	sth	%i1,	[%l7 + 0x08]
	fand	%f6,	%f0,	%f20
	movvc	%icc,	%o4,	%i4
	st	%f13,	[%l7 + 0x08]
	fmovrsne	%o6,	%f16,	%f7
	fpsub16s	%f9,	%f26,	%f14
	edge32ln	%l5,	%o1,	%o3
	movrlez	%i0,	%i5,	%g1
	movrlez	%i2,	%l4,	%o7
	ldsw	[%l7 + 0x44],	%o0
	sdiv	%g3,	0x0832,	%l2
	movrgez	%o2,	%g6,	%o5
	movle	%icc,	%i7,	%l1
	fornot1s	%f10,	%f16,	%f29
	xnor	%g5,	%g2,	%l3
	lduw	[%l7 + 0x20],	%i6
	mova	%xcc,	%i3,	%g7
	std	%f12,	[%l7 + 0x28]
	movrgez	%g4,	%l6,	%i1
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	subc	%o4,	0x0231,	%o1
	movle	%xcc,	%o3,	%i0
	udivcc	%l5,	0x141C,	%i5
	andn	%i2,	%g1,	%o7
	edge16ln	%l4,	%o0,	%g3
	srl	%o2,	%g6,	%o5
	stx	%i7,	[%l7 + 0x30]
	fone	%f0
	edge8	%l1,	%g5,	%g2
	udivx	%l3,	0x1B6E,	%l2
	umul	%i3,	%i6,	%g7
	ldx	[%l7 + 0x18],	%l6
	movrlez	%i1,	0x136,	%l0
	movge	%icc,	%g4,	%i4
	fmovrde	%o6,	%f10,	%f0
	subccc	%o1,	0x17FF,	%o3
	srax	%o4,	0x0E,	%l5
	sdivcc	%i0,	0x1863,	%i5
	ldub	[%l7 + 0x21],	%i2
	fmovd	%f0,	%f10
	movl	%icc,	%o7,	%g1
	smul	%o0,	%g3,	%o2
	or	%l4,	0x1F8A,	%o5
	ldd	[%l7 + 0x58],	%f24
	fcmpgt16	%f24,	%f28,	%i7
	fexpand	%f5,	%f14
	fpackfix	%f10,	%f17
	fcmpes	%fcc2,	%f20,	%f14
	movvs	%xcc,	%g6,	%l1
	alignaddrl	%g5,	%l3,	%g2
	srl	%l2,	%i3,	%i6
	movrlz	%l6,	%i1,	%g7
	sethi	0x0909,	%g4
	st	%f14,	[%l7 + 0x60]
	sdivx	%i4,	0x154D,	%o6
	movcs	%xcc,	%l0,	%o1
	sdivx	%o3,	0x12D3,	%l5
	umulcc	%i0,	%i5,	%i2
	ldsh	[%l7 + 0x48],	%o7
	movre	%o4,	%o0,	%g3
	stx	%o2,	[%l7 + 0x10]
	subcc	%l4,	0x01E7,	%g1
	movn	%icc,	%o5,	%i7
	fsrc1s	%f4,	%f31
	sethi	0x12F4,	%l1
	movl	%xcc,	%g6,	%g5
	fmul8sux16	%f0,	%f2,	%f4
	fmovsvs	%icc,	%f4,	%f0
	movl	%icc,	%g2,	%l2
	edge8	%i3,	%i6,	%l3
	fandnot1	%f12,	%f24,	%f12
	fcmpd	%fcc2,	%f20,	%f4
	fabss	%f7,	%f1
	orncc	%i1,	0x16D3,	%l6
	sth	%g4,	[%l7 + 0x54]
	srax	%i4,	%g7,	%o6
	udiv	%o1,	0x1AC9,	%o3
	smul	%l0,	0x10D1,	%i0
	fmovrslez	%i5,	%f28,	%f16
	restore %l5, 0x05AC, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o4,	%f30,	%f18
	nop
	set	0x5C, %o0
	ldsh	[%l7 + %o0],	%o7
	sdiv	%g3,	0x1847,	%o0
	st	%f2,	[%l7 + 0x40]
	subccc	%l4,	0x1ED8,	%g1
	udivx	%o5,	0x145A,	%o2
	movleu	%xcc,	%l1,	%g6
	mulx	%i7,	0x0DBB,	%g5
	ldd	[%l7 + 0x68],	%g2
	movne	%icc,	%l2,	%i3
	edge8ln	%l3,	%i6,	%l6
	addcc	%g4,	%i1,	%g7
	movrgez	%i4,	%o6,	%o1
	movpos	%xcc,	%o3,	%i0
	movcc	%xcc,	%i5,	%l5
	sll	%l0,	%o4,	%i2
	fpsub32	%f8,	%f18,	%f4
	sub	%o7,	0x0257,	%o0
	sra	%g3,	0x03,	%l4
	ld	[%l7 + 0x48],	%f6
	fsrc2s	%f10,	%f10
	orncc	%o5,	%o2,	%l1
	fmovsvc	%icc,	%f17,	%f21
	fmovdneg	%icc,	%f10,	%f21
	fmovdcs	%xcc,	%f9,	%f10
	move	%icc,	%g6,	%i7
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	edge32	%l2,	%g1,	%i3
	fmovsg	%icc,	%f29,	%f22
	udivcc	%l3,	0x1500,	%i6
	andncc	%g4,	%l6,	%i1
	sub	%i4,	0x0288,	%g7
	udivcc	%o6,	0x0549,	%o1
	smul	%o3,	0x1CC2,	%i0
	stb	%l5,	[%l7 + 0x45]
	edge8	%l0,	%i5,	%i2
	stx	%o4,	[%l7 + 0x60]
	movleu	%xcc,	%o7,	%g3
	movle	%icc,	%l4,	%o5
	movrlz	%o0,	%o2,	%g6
	or	%l1,	%i7,	%g2
	fsrc1s	%f13,	%f12
	fcmpes	%fcc1,	%f21,	%f5
	edge32ln	%l2,	%g1,	%i3
	movvc	%icc,	%l3,	%i6
	movrgez	%g5,	%g4,	%l6
	array16	%i1,	%g7,	%i4
	array32	%o1,	%o6,	%o3
	fmovdle	%icc,	%f10,	%f27
	ldsh	[%l7 + 0x5C],	%l5
	fmovsle	%xcc,	%f21,	%f20
	add	%l0,	%i0,	%i2
	sethi	0x003A,	%o4
	andcc	%o7,	%g3,	%l4
	fand	%f4,	%f4,	%f26
	udivcc	%o5,	0x07F0,	%i5
	xnorcc	%o2,	0x1001,	%g6
	movvc	%xcc,	%o0,	%i7
	fmovdg	%icc,	%f9,	%f15
	orncc	%g2,	%l1,	%l2
	array32	%g1,	%i3,	%i6
	srl	%l3,	%g5,	%g4
	ldub	[%l7 + 0x3A],	%i1
	array32	%g7,	%l6,	%o1
	fmovrse	%o6,	%f14,	%f2
	fmovdle	%icc,	%f21,	%f1
	edge8ln	%i4,	%l5,	%o3
	edge32ln	%i0,	%i2,	%l0
	ldd	[%l7 + 0x48],	%f22
	movre	%o7,	0x2BD,	%o4
	fmovda	%xcc,	%f10,	%f11
	sethi	0x1A69,	%g3
	add	%o5,	0x18A0,	%l4
	popc	0x1C89,	%i5
	fsrc1s	%f2,	%f23
	movcs	%icc,	%o2,	%g6
	edge8n	%i7,	%g2,	%o0
	fmovspos	%xcc,	%f28,	%f15
	fone	%f26
	movpos	%icc,	%l2,	%l1
	movneg	%icc,	%g1,	%i3
	fsrc1	%f12,	%f30
	movrlz	%i6,	%g5,	%g4
	fmovdcs	%icc,	%f15,	%f16
	stx	%l3,	[%l7 + 0x28]
	udivx	%g7,	0x11D3,	%i1
	movre	%l6,	%o6,	%o1
	fmovsa	%xcc,	%f18,	%f3
	add	%i4,	0x0AFF,	%l5
	xnor	%i0,	0x0F04,	%o3
	fmovrdlz	%l0,	%f14,	%f4
	sll	%o7,	%o4,	%i2
	andncc	%o5,	%g3,	%i5
	fmovscc	%xcc,	%f1,	%f26
	array16	%o2,	%l4,	%i7
	udiv	%g6,	0x103A,	%g2
	array8	%l2,	%o0,	%g1
	movn	%xcc,	%i3,	%i6
	mulx	%l1,	%g4,	%l3
	orn	%g5,	%g7,	%l6
	fabss	%f12,	%f29
	movge	%icc,	%i1,	%o6
	move	%icc,	%i4,	%l5
	edge8n	%o1,	%o3,	%l0
	fmuld8sux16	%f5,	%f7,	%f4
	movrlez	%i0,	0x10B,	%o7
	movvs	%xcc,	%i2,	%o5
	fmovde	%icc,	%f6,	%f31
	srl	%g3,	%i5,	%o4
	fpsub16	%f22,	%f24,	%f8
	stw	%o2,	[%l7 + 0x30]
	movge	%xcc,	%i7,	%g6
	st	%f16,	[%l7 + 0x70]
	edge16l	%g2,	%l2,	%l4
	mulscc	%o0,	%g1,	%i6
	fmovsl	%xcc,	%f24,	%f20
	st	%f7,	[%l7 + 0x54]
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f10
	stb	%l1,	[%l7 + 0x0E]
	fmovdcc	%icc,	%f5,	%f12
	udivx	%g4,	0x1D9C,	%l3
	xorcc	%g5,	0x1138,	%i3
	fmovsa	%icc,	%f24,	%f14
	stx	%l6,	[%l7 + 0x50]
	alignaddr	%g7,	%o6,	%i4
	sub	%l5,	0x0A74,	%o1
	ldx	[%l7 + 0x68],	%i1
	movpos	%xcc,	%l0,	%i0
	mulx	%o7,	%o3,	%i2
	sdivcc	%g3,	0x0681,	%i5
	add	%o5,	0x0E41,	%o4
	movpos	%xcc,	%i7,	%o2
	movn	%xcc,	%g2,	%g6
	std	%f4,	[%l7 + 0x58]
	array16	%l4,	%l2,	%g1
	save %i6, 0x1139, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f29
	edge8	%l1,	%l3,	%g5
	save %g4, 0x0647, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g7,	%l6,	%o6
	save %i4, 0x01FF, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x18],	%o1
	sdivcc	%l0,	0x126C,	%i0
	fcmpd	%fcc0,	%f24,	%f28
	ldsb	[%l7 + 0x17],	%o7
	edge8ln	%o3,	%i1,	%i2
	ldsw	[%l7 + 0x18],	%g3
	std	%f6,	[%l7 + 0x10]
	fmovdneg	%icc,	%f30,	%f27
	smulcc	%i5,	%o4,	%i7
	movrlz	%o5,	%g2,	%g6
	orn	%o2,	0x1966,	%l2
	fmovde	%icc,	%f23,	%f31
	srl	%l4,	0x1B,	%i6
	fsrc2s	%f25,	%f25
	sir	0x17EB
	xorcc	%g1,	%l1,	%l3
	smulcc	%g5,	0x0658,	%o0
	udivcc	%g4,	0x1C15,	%i3
	fmovrsgez	%g7,	%f0,	%f20
	movneg	%icc,	%l6,	%o6
	movre	%l5,	0x24D,	%i4
	addc	%l0,	%i0,	%o7
	move	%xcc,	%o3,	%i1
	movrgez	%i2,	%g3,	%i5
	edge32ln	%o4,	%o1,	%o5
	edge16n	%g2,	%g6,	%o2
	array32	%i7,	%l2,	%l4
	movvc	%icc,	%i6,	%l1
	for	%f20,	%f28,	%f20
	udivcc	%l3,	0x11BD,	%g5
	mulscc	%g1,	0x1125,	%g4
	mulscc	%i3,	0x180B,	%g7
	fmovsgu	%icc,	%f12,	%f4
	lduw	[%l7 + 0x28],	%l6
	ldd	[%l7 + 0x48],	%f10
	orcc	%o6,	%l5,	%o0
	lduh	[%l7 + 0x0A],	%i4
	fmovdle	%icc,	%f22,	%f20
	fmovsa	%icc,	%f30,	%f11
	edge16ln	%i0,	%l0,	%o7
	srlx	%o3,	0x0D,	%i2
	smul	%g3,	0x0CA3,	%i5
	save %o4, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g2,	%g6,	%i1
	lduw	[%l7 + 0x4C],	%o2
	xorcc	%l2,	%i7,	%i6
	and	%l4,	0x1B52,	%l3
	orcc	%l1,	%g5,	%g1
	fpadd32s	%f20,	%f8,	%f14
	ld	[%l7 + 0x24],	%f31
	smul	%g4,	0x1315,	%i3
	movvs	%xcc,	%l6,	%o6
	lduw	[%l7 + 0x6C],	%g7
	addcc	%o0,	0x0DB2,	%l5
	sdivx	%i4,	0x1DFA,	%i0
	movn	%icc,	%o7,	%l0
	udivx	%i2,	0x04C2,	%o3
	srlx	%g3,	%o4,	%i5
	move	%xcc,	%o5,	%o1
	ldsb	[%l7 + 0x17],	%g6
	subcc	%i1,	%g2,	%o2
	orn	%l2,	0x1DEF,	%i7
	ldsb	[%l7 + 0x44],	%l4
	udivx	%i6,	0x0128,	%l1
	edge8l	%l3,	%g1,	%g5
	movleu	%icc,	%g4,	%l6
	movg	%icc,	%i3,	%o6
	fexpand	%f25,	%f16
	fmovdcs	%icc,	%f1,	%f29
	fmovscc	%xcc,	%f24,	%f19
	fmovdpos	%icc,	%f7,	%f11
	movle	%xcc,	%o0,	%g7
	xorcc	%i4,	0x1162,	%l5
	fornot1s	%f9,	%f1,	%f24
	fmovrdgez	%o7,	%f8,	%f4
	ld	[%l7 + 0x70],	%f0
	fmovdcs	%icc,	%f25,	%f22
	ldx	[%l7 + 0x48],	%l0
	alignaddr	%i0,	%i2,	%g3
	array32	%o3,	%o4,	%i5
	movneg	%icc,	%o5,	%g6
	sdiv	%o1,	0x0D3E,	%g2
	orcc	%o2,	%l2,	%i7
	fandnot2s	%f16,	%f17,	%f17
	lduw	[%l7 + 0x58],	%i1
	ld	[%l7 + 0x54],	%f31
	addc	%i6,	0x0AA8,	%l1
	sdivx	%l3,	0x1936,	%l4
	lduw	[%l7 + 0x18],	%g1
	movrgz	%g5,	0x21A,	%l6
	movcc	%icc,	%g4,	%o6
	fmovsneg	%xcc,	%f6,	%f15
	alignaddr	%o0,	%i3,	%g7
	ld	[%l7 + 0x68],	%f13
	xor	%l5,	%o7,	%i4
	fmovrsne	%i0,	%f1,	%f15
	add	%i2,	0x00FB,	%l0
	save %g3, %o4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i5,	%o5
	movn	%icc,	%g6,	%o1
	movrgz	%g2,	0x101,	%l2
	edge8l	%o2,	%i7,	%i1
	addccc	%i6,	%l3,	%l4
	sethi	0x0789,	%g1
	subc	%g5,	0x1F9E,	%l1
	edge16	%g4,	%l6,	%o0
	fandnot1	%f4,	%f12,	%f12
	alignaddrl	%o6,	%g7,	%l5
	umulcc	%o7,	%i4,	%i0
	umul	%i3,	0x150F,	%i2
	fmovdneg	%xcc,	%f25,	%f4
	srl	%g3,	0x01,	%l0
	fmovdleu	%xcc,	%f27,	%f8
	fones	%f10
	fxors	%f6,	%f12,	%f8
	addcc	%o3,	0x1B7C,	%i5
	movpos	%xcc,	%o4,	%g6
	movn	%icc,	%o1,	%o5
	movcc	%xcc,	%l2,	%o2
	restore %g2, 0x1B7C, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f18,	%f27,	%f19
	edge16l	%i6,	%i1,	%l4
	fcmple16	%f6,	%f26,	%g1
	fexpand	%f8,	%f20
	orn	%g5,	%l3,	%l1
	edge32l	%g4,	%l6,	%o0
	sdivcc	%o6,	0x1293,	%l5
	sra	%o7,	0x01,	%i4
	movrne	%g7,	0x062,	%i0
	fmul8sux16	%f10,	%f8,	%f22
	udivx	%i3,	0x14D7,	%g3
	fmovsleu	%xcc,	%f23,	%f5
	sllx	%i2,	0x12,	%o3
	smul	%i5,	%l0,	%g6
	fors	%f26,	%f16,	%f30
	smul	%o4,	%o5,	%l2
	orncc	%o1,	0x1C2A,	%o2
	edge32ln	%i7,	%i6,	%i1
	fpack16	%f6,	%f0
	fmovdpos	%icc,	%f26,	%f9
	array32	%l4,	%g2,	%g5
	and	%g1,	0x1FD6,	%l1
	movpos	%icc,	%l3,	%l6
	orncc	%g4,	0x0D89,	%o6
	movrgez	%o0,	%o7,	%i4
	sdiv	%g7,	0x1777,	%i0
	edge32n	%l5,	%i3,	%g3
	addcc	%o3,	%i2,	%i5
	srlx	%g6,	0x12,	%o4
	ldub	[%l7 + 0x56],	%l0
	umul	%o5,	0x060B,	%o1
	lduh	[%l7 + 0x54],	%o2
	xnor	%i7,	0x0BFA,	%i6
	fcmpne16	%f18,	%f30,	%i1
	edge8n	%l4,	%l2,	%g5
	fcmpne32	%f12,	%f24,	%g2
	fmovse	%xcc,	%f20,	%f5
	edge16l	%g1,	%l3,	%l6
	edge16	%l1,	%o6,	%o0
	smulcc	%o7,	%i4,	%g4
	movcc	%icc,	%g7,	%i0
	edge32n	%l5,	%g3,	%i3
	lduh	[%l7 + 0x64],	%i2
	movrne	%i5,	%g6,	%o4
	nop
	set	0x20, %i7
	stx	%l0,	[%l7 + %i7]
	udiv	%o3,	0x1D55,	%o5
	save %o1, 0x1947, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x16E7,	%i1
	srax	%i6,	0x14,	%l4
	fcmpes	%fcc0,	%f15,	%f2
	addcc	%g5,	0x19B8,	%l2
	fmovrde	%g2,	%f0,	%f24
	fmovscc	%xcc,	%f24,	%f12
	orn	%l3,	%g1,	%l1
	edge32ln	%l6,	%o0,	%o7
	ldub	[%l7 + 0x4C],	%o6
	srax	%i4,	0x1F,	%g7
	movn	%icc,	%i0,	%l5
	subccc	%g4,	0x1FE7,	%g3
	stb	%i2,	[%l7 + 0x19]
	xnor	%i5,	0x0806,	%i3
	srax	%o4,	%g6,	%l0
	movvc	%icc,	%o3,	%o5
	edge32	%o1,	%o2,	%i7
	stx	%i6,	[%l7 + 0x20]
	nop
	set	0x09, %o1
	ldsb	[%l7 + %o1],	%i1
	smulcc	%l4,	0x0D25,	%g5
	stb	%l2,	[%l7 + 0x2E]
	xnorcc	%g2,	%l3,	%l1
	move	%xcc,	%l6,	%o0
	movre	%g1,	0x1A9,	%o6
	edge8l	%o7,	%i4,	%i0
	movre	%g7,	0x118,	%l5
	umul	%g4,	0x0892,	%i2
	stb	%g3,	[%l7 + 0x7E]
	udivx	%i5,	0x0CEE,	%o4
	array32	%i3,	%l0,	%g6
	movvs	%icc,	%o5,	%o3
	std	%f2,	[%l7 + 0x70]
	movrgez	%o2,	%i7,	%o1
	fmovrse	%i6,	%f8,	%f9
	edge32n	%l4,	%i1,	%g5
	fsrc2s	%f0,	%f4
	fmovsvs	%icc,	%f28,	%f12
	fpadd32s	%f11,	%f25,	%f7
	movne	%xcc,	%g2,	%l3
	fcmpeq16	%f26,	%f6,	%l1
	movrlez	%l6,	%l2,	%g1
	sethi	0x0E6F,	%o6
	fmovrdlz	%o7,	%f16,	%f4
	sir	0x0DC6
	addcc	%i4,	0x03E2,	%i0
	udivx	%o0,	0x0F00,	%l5
	nop
	set	0x70, %g4
	std	%f6,	[%l7 + %g4]
	addccc	%g4,	0x1265,	%g7
	orncc	%g3,	0x0786,	%i5
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	move	%xcc,	%l0,	%g6
	ldub	[%l7 + 0x13],	%o4
	subccc	%o3,	%o2,	%o5
	srl	%o1,	%i6,	%l4
	lduh	[%l7 + 0x20],	%i7
	fmovsle	%icc,	%f4,	%f24
	nop
	set	0x10, %o5
	std	%f18,	[%l7 + %o5]
	lduh	[%l7 + 0x4A],	%g5
	xnor	%i1,	0x0E66,	%g2
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%l3
	movre	%l6,	%l1,	%l2
	st	%f29,	[%l7 + 0x34]
	stb	%g1,	[%l7 + 0x22]
	xor	%o7,	0x11FF,	%i4
	ldsh	[%l7 + 0x34],	%i0
	fandnot2s	%f11,	%f18,	%f23
	edge32n	%o0,	%o6,	%l5
	umulcc	%g7,	0x0477,	%g3
	orcc	%g4,	0x0375,	%i5
	umul	%i2,	0x0070,	%l0
	fpsub16	%f30,	%f16,	%f2
	movgu	%icc,	%g6,	%i3
	movre	%o4,	0x07A,	%o2
	fmovdne	%icc,	%f19,	%f4
	mulscc	%o5,	0x062D,	%o1
	fmovdge	%icc,	%f13,	%f12
	save %o3, %i6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x50],	%i7
	restore %g5, %i1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l6,	0x1EAB,	%l1
	lduw	[%l7 + 0x0C],	%g2
	ldsw	[%l7 + 0x1C],	%l2
	fpsub32	%f2,	%f8,	%f18
	movrgz	%o7,	%g1,	%i0
	movl	%xcc,	%i4,	%o0
	sethi	0x1C1F,	%o6
	edge8l	%g7,	%g3,	%l5
	sth	%i5,	[%l7 + 0x5A]
	fexpand	%f27,	%f26
	fcmple16	%f28,	%f10,	%g4
	ldx	[%l7 + 0x58],	%i2
	movrne	%g6,	0x037,	%i3
	fmul8x16al	%f25,	%f27,	%f24
	movvs	%xcc,	%l0,	%o4
	sdiv	%o5,	0x0272,	%o2
	alignaddr	%o1,	%i6,	%l4
	alignaddr	%i7,	%g5,	%o3
	andncc	%l3,	%i1,	%l6
	for	%f4,	%f16,	%f22
	ldsw	[%l7 + 0x10],	%l1
	fcmpne32	%f0,	%f30,	%l2
	movcs	%icc,	%o7,	%g1
	lduh	[%l7 + 0x72],	%g2
	fcmpeq32	%f6,	%f8,	%i0
	movg	%xcc,	%o0,	%i4
	movge	%xcc,	%g7,	%g3
	fabss	%f1,	%f26
	fpsub16s	%f18,	%f14,	%f26
	xor	%l5,	%i5,	%o6
	edge32ln	%g4,	%g6,	%i2
	fcmps	%fcc0,	%f10,	%f13
	lduh	[%l7 + 0x4A],	%l0
	edge16l	%i3,	%o5,	%o2
	sth	%o1,	[%l7 + 0x4E]
	fmovrdgez	%i6,	%f20,	%f22
	alignaddrl	%o4,	%l4,	%g5
	stx	%i7,	[%l7 + 0x60]
	edge16	%o3,	%i1,	%l6
	sdiv	%l1,	0x0AC7,	%l2
	fmovdl	%xcc,	%f6,	%f5
	ldx	[%l7 + 0x28],	%o7
	andncc	%l3,	%g1,	%i0
	movcs	%icc,	%g2,	%i4
	stw	%g7,	[%l7 + 0x48]
	lduw	[%l7 + 0x28],	%g3
	smulcc	%l5,	0x00D5,	%o0
	umul	%o6,	0x0115,	%i5
	movpos	%icc,	%g6,	%i2
	fmul8sux16	%f4,	%f22,	%f14
	edge16l	%g4,	%i3,	%l0
	array16	%o5,	%o1,	%i6
	subc	%o4,	%l4,	%o2
	srlx	%g5,	%o3,	%i7
	sth	%i1,	[%l7 + 0x30]
	std	%f18,	[%l7 + 0x10]
	edge16	%l6,	%l1,	%o7
	fcmpd	%fcc3,	%f6,	%f14
	add	%l2,	0x0A24,	%g1
	fnand	%f14,	%f28,	%f16
	bshuffle	%f30,	%f20,	%f16
	fmovrdlz	%i0,	%f10,	%f0
	smul	%l3,	%g2,	%i4
	fpadd32s	%f24,	%f23,	%f28
	alignaddr	%g3,	%g7,	%o0
	alignaddrl	%o6,	%l5,	%i5
	ldsh	[%l7 + 0x64],	%g6
	movrne	%g4,	0x0AB,	%i2
	ldsb	[%l7 + 0x53],	%l0
	movrlz	%o5,	0x30A,	%i3
	edge8	%o1,	%i6,	%l4
	umul	%o2,	%o4,	%g5
	move	%icc,	%i7,	%o3
	and	%i1,	0x159D,	%l1
	xnor	%o7,	%l2,	%g1
	sub	%i0,	%l6,	%g2
	ldd	[%l7 + 0x58],	%f18
	fmovs	%f29,	%f1
	fmovrse	%l3,	%f26,	%f1
	xnor	%i4,	%g7,	%g3
	edge32ln	%o0,	%o6,	%l5
	movge	%icc,	%i5,	%g6
	movge	%xcc,	%i2,	%l0
	fcmps	%fcc3,	%f16,	%f3
	array8	%o5,	%i3,	%g4
	array8	%o1,	%l4,	%o2
	sub	%o4,	%g5,	%i7
	edge8	%o3,	%i1,	%l1
	lduw	[%l7 + 0x38],	%o7
	ldub	[%l7 + 0x5B],	%i6
	xnor	%g1,	%i0,	%l6
	fornot2	%f0,	%f24,	%f12
	sth	%l2,	[%l7 + 0x1E]
	edge16	%l3,	%g2,	%g7
	srax	%g3,	%o0,	%i4
	udiv	%o6,	0x1A1D,	%l5
	fmovsne	%icc,	%f16,	%f10
	move	%xcc,	%i5,	%i2
	sll	%l0,	%o5,	%g6
	array16	%g4,	%o1,	%i3
	ldd	[%l7 + 0x60],	%f28
	fmovsneg	%xcc,	%f14,	%f13
	movre	%o2,	0x006,	%o4
	movvc	%xcc,	%g5,	%l4
	fandnot2s	%f26,	%f28,	%f5
	fmovsge	%xcc,	%f22,	%f30
	fmovdvc	%icc,	%f0,	%f14
	edge8l	%i7,	%o3,	%l1
	smulcc	%o7,	%i1,	%g1
	andcc	%i0,	%i6,	%l2
	fmovsvs	%icc,	%f27,	%f2
	fmovrdgz	%l3,	%f24,	%f14
	srl	%g2,	%l6,	%g7
	fmovsneg	%icc,	%f17,	%f15
	save %g3, %i4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o6,	%i5,	%l5
	ldsh	[%l7 + 0x20],	%l0
	movrgez	%i2,	0x246,	%g6
	fxors	%f31,	%f18,	%f10
	subc	%g4,	0x19FB,	%o5
	movrlz	%o1,	0x05F,	%o2
	sll	%i3,	0x0B,	%o4
	ldsw	[%l7 + 0x14],	%g5
	fands	%f6,	%f0,	%f26
	subccc	%l4,	0x008C,	%o3
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	alignaddrl	%i1,	%i0,	%i6
	stb	%l2,	[%l7 + 0x7A]
	edge8	%g1,	%l3,	%l6
	andcc	%g2,	0x0E1D,	%g3
	fnegs	%f15,	%f30
	smulcc	%i4,	%o0,	%g7
	popc	0x1AA3,	%o6
	edge16	%l5,	%i5,	%i2
	fnot2	%f26,	%f30
	fmovsvc	%icc,	%f30,	%f30
	fnot1s	%f30,	%f29
	sllx	%g6,	0x1C,	%l0
	lduw	[%l7 + 0x1C],	%g4
	and	%o5,	%o2,	%i3
	and	%o1,	0x1653,	%o4
	array16	%l4,	%o3,	%l1
	mova	%xcc,	%o7,	%g5
	array32	%i1,	%i7,	%i6
	addcc	%l2,	%g1,	%l3
	umul	%l6,	0x1AC7,	%g2
	edge8	%i0,	%i4,	%g3
	array16	%g7,	%o0,	%l5
	movre	%i5,	%o6,	%g6
	fmuld8ulx16	%f23,	%f4,	%f4
	fcmpeq32	%f0,	%f16,	%i2
	movrlz	%l0,	0x0D0,	%g4
	addcc	%o5,	%i3,	%o1
	movrgez	%o2,	0x239,	%l4
	srax	%o4,	%o3,	%l1
	ldub	[%l7 + 0x49],	%g5
	edge8ln	%o7,	%i7,	%i1
	srlx	%l2,	0x17,	%g1
	restore %i6, 0x127B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l3, 0x06FF, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g2,	%g3
	ldub	[%l7 + 0x71],	%g7
	fmovde	%icc,	%f31,	%f5
	addcc	%o0,	0x1A20,	%l5
	edge32ln	%i5,	%o6,	%g6
	ldsw	[%l7 + 0x14],	%i4
	lduh	[%l7 + 0x3A],	%i2
	fmovdle	%xcc,	%f30,	%f28
	fnot2s	%f17,	%f21
	xor	%g4,	0x141B,	%o5
	fmuld8sux16	%f28,	%f12,	%f16
	move	%xcc,	%i3,	%o1
	edge32	%o2,	%l0,	%o4
	ldsb	[%l7 + 0x16],	%l4
	nop
	set	0x30, %i6
	stx	%o3,	[%l7 + %i6]
	or	%l1,	%o7,	%i7
	fmovdvc	%icc,	%f15,	%f16
	movpos	%xcc,	%i1,	%g5
	fornot2s	%f31,	%f29,	%f19
	movpos	%xcc,	%l2,	%i6
	sra	%l6,	%l3,	%i0
	xnor	%g2,	%g3,	%g7
	srlx	%o0,	%g1,	%l5
	fandnot2s	%f30,	%f25,	%f24
	fmovsa	%icc,	%f21,	%f23
	movrne	%i5,	%o6,	%g6
	sdiv	%i2,	0x13CB,	%g4
	smulcc	%i4,	0x194C,	%i3
	fsrc2	%f30,	%f30
	movgu	%icc,	%o5,	%o2
	edge16l	%o1,	%l0,	%l4
	xorcc	%o3,	%o4,	%l1
	edge16ln	%o7,	%i7,	%g5
	addcc	%i1,	0x049C,	%l2
	andncc	%i6,	%l6,	%l3
	fmovdn	%icc,	%f13,	%f9
	movcc	%xcc,	%i0,	%g2
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%g3
	sllx	%g7,	0x13,	%o0
	movcc	%xcc,	%l5,	%g1
	fmovdpos	%icc,	%f2,	%f15
	fcmps	%fcc0,	%f20,	%f11
	fands	%f28,	%f11,	%f9
	sdivcc	%o6,	0x13B2,	%i5
	movl	%xcc,	%g6,	%i2
	andn	%g4,	%i4,	%i3
	ld	[%l7 + 0x64],	%f20
	udiv	%o5,	0x0C30,	%o2
	movleu	%xcc,	%o1,	%l4
	movrlz	%o3,	0x0AD,	%o4
	fpsub16s	%f14,	%f29,	%f4
	fmovsne	%icc,	%f3,	%f28
	fmovrslez	%l0,	%f28,	%f11
	edge16ln	%o7,	%l1,	%i7
	movleu	%icc,	%i1,	%l2
	srlx	%g5,	%i6,	%l3
	and	%l6,	0x1B3A,	%i0
	sll	%g3,	0x11,	%g2
	fxors	%f17,	%f29,	%f25
	xnorcc	%g7,	0x06DA,	%o0
	movgu	%xcc,	%l5,	%o6
	mulx	%i5,	%g1,	%g6
	lduw	[%l7 + 0x64],	%i2
	movrgz	%g4,	0x327,	%i3
	edge16	%i4,	%o5,	%o2
	movvs	%xcc,	%o1,	%o3
	addccc	%o4,	0x17EB,	%l0
	alignaddrl	%o7,	%l4,	%i7
	movrlez	%l1,	0x115,	%i1
	xorcc	%l2,	0x1706,	%g5
	umulcc	%l3,	%i6,	%l6
	udivcc	%i0,	0x0234,	%g3
	movge	%icc,	%g2,	%g7
	array32	%o0,	%o6,	%i5
	sth	%g1,	[%l7 + 0x32]
	movre	%l5,	%g6,	%g4
	addc	%i3,	0x070A,	%i2
	movle	%icc,	%i4,	%o5
	fpack32	%f30,	%f16,	%f6
	fcmple16	%f20,	%f16,	%o2
	or	%o1,	0x12DD,	%o3
	ldub	[%l7 + 0x21],	%o4
	movvc	%xcc,	%l0,	%o7
	movrgez	%l4,	0x372,	%i7
	edge8n	%l1,	%i1,	%g5
	mulx	%l2,	0x1D16,	%l3
	fmovsge	%xcc,	%f15,	%f26
	fcmpgt16	%f18,	%f6,	%i6
	array32	%i0,	%g3,	%g2
	edge16l	%g7,	%l6,	%o6
	std	%f4,	[%l7 + 0x60]
	fabsd	%f22,	%f14
	siam	0x2
	umulcc	%o0,	0x1902,	%g1
	udivcc	%l5,	0x0C8E,	%g6
	ldsw	[%l7 + 0x6C],	%i5
	fsrc1	%f14,	%f8
	fandnot1	%f14,	%f12,	%f20
	movge	%icc,	%i3,	%g4
	or	%i2,	0x140A,	%i4
	subccc	%o5,	0x089D,	%o1
	movneg	%xcc,	%o2,	%o4
	movleu	%icc,	%l0,	%o3
	edge8ln	%o7,	%l4,	%i7
	orncc	%l1,	%g5,	%i1
	fcmpes	%fcc0,	%f7,	%f16
	movn	%icc,	%l2,	%l3
	ldsb	[%l7 + 0x55],	%i6
	movne	%icc,	%i0,	%g3
	fnot2s	%f7,	%f12
	ldub	[%l7 + 0x1E],	%g7
	fands	%f23,	%f17,	%f17
	movre	%l6,	0x3D8,	%o6
	movvc	%xcc,	%g2,	%o0
	orcc	%g1,	%l5,	%i5
	movge	%icc,	%g6,	%i3
	sllx	%i2,	0x06,	%g4
	movle	%xcc,	%i4,	%o5
	smul	%o1,	0x02EB,	%o4
	smul	%l0,	%o3,	%o2
	addcc	%l4,	%o7,	%l1
	and	%g5,	0x15EF,	%i1
	edge8	%i7,	%l3,	%l2
	subcc	%i0,	0x15B9,	%g3
	movrlez	%i6,	0x331,	%l6
	fandnot1	%f16,	%f6,	%f2
	sdivx	%g7,	0x0239,	%g2
	smulcc	%o6,	0x0354,	%g1
	fxors	%f2,	%f24,	%f0
	sir	0x11A7
	stb	%o0,	[%l7 + 0x0C]
	sth	%i5,	[%l7 + 0x50]
	fmovrdgz	%l5,	%f18,	%f26
	edge32l	%i3,	%g6,	%g4
	ldsh	[%l7 + 0x0E],	%i4
	subcc	%i2,	%o5,	%o1
	sdivcc	%l0,	0x09F5,	%o3
	udivcc	%o4,	0x0F00,	%l4
	edge32l	%o7,	%l1,	%g5
	std	%f4,	[%l7 + 0x20]
	pdist	%f16,	%f14,	%f22
	popc	0x19BE,	%o2
	alignaddr	%i1,	%l3,	%l2
	mulx	%i0,	0x10BC,	%i7
	orn	%i6,	%g3,	%g7
	sdivx	%l6,	0x01CE,	%g2
	pdist	%f2,	%f8,	%f0
	subccc	%g1,	0x0ACA,	%o6
	movleu	%icc,	%i5,	%o0
	lduh	[%l7 + 0x7E],	%l5
	ldd	[%l7 + 0x70],	%f22
	movn	%icc,	%g6,	%i3
	bshuffle	%f22,	%f8,	%f20
	orn	%i4,	%i2,	%o5
	movre	%o1,	0x0B3,	%g4
	ld	[%l7 + 0x5C],	%f4
	edge32l	%l0,	%o3,	%o4
	fmovrdgz	%l4,	%f22,	%f30
	popc	%l1,	%g5
	ld	[%l7 + 0x5C],	%f7
	ldub	[%l7 + 0x22],	%o2
	movrgez	%i1,	%o7,	%l2
	addcc	%i0,	0x0574,	%l3
	andn	%i6,	0x1B55,	%g3
	udivx	%g7,	0x1CB8,	%l6
	movleu	%xcc,	%i7,	%g2
	subccc	%o6,	0x1156,	%i5
	movpos	%icc,	%o0,	%l5
	stb	%g6,	[%l7 + 0x7A]
	fmovdge	%icc,	%f17,	%f16
	ldx	[%l7 + 0x08],	%g1
	fand	%f4,	%f28,	%f26
	movleu	%xcc,	%i4,	%i3
	sub	%o5,	%o1,	%g4
	xnor	%i2,	0x06DE,	%o3
	subc	%l0,	%l4,	%o4
	addccc	%l1,	%o2,	%g5
	subccc	%i1,	%l2,	%i0
	sub	%l3,	%o7,	%i6
	fmovrsgz	%g3,	%f13,	%f18
	array32	%l6,	%i7,	%g7
	nop
	set	0x78, %l3
	ldsh	[%l7 + %l3],	%o6
	movle	%icc,	%g2,	%o0
	sll	%i5,	%g6,	%g1
	add	%l5,	0x1E66,	%i3
	ldsh	[%l7 + 0x46],	%o5
	fmovsl	%xcc,	%f16,	%f14
	fornot2	%f20,	%f18,	%f20
	array16	%i4,	%o1,	%i2
	srax	%g4,	0x18,	%o3
	movge	%xcc,	%l0,	%l4
	ldx	[%l7 + 0x78],	%o4
	stx	%l1,	[%l7 + 0x70]
	st	%f1,	[%l7 + 0x7C]
	sdivcc	%o2,	0x093E,	%i1
	array16	%l2,	%i0,	%g5
	ldd	[%l7 + 0x10],	%f0
	ldsw	[%l7 + 0x20],	%o7
	sethi	0x04E2,	%i6
	fmovdle	%icc,	%f20,	%f13
	st	%f11,	[%l7 + 0x40]
	edge8l	%l3,	%g3,	%l6
	edge32n	%g7,	%o6,	%i7
	add	%g2,	%o0,	%i5
	umul	%g1,	0x1105,	%g6
	movrlez	%l5,	%o5,	%i3
	movrgz	%i4,	0x063,	%o1
	movrne	%i2,	%o3,	%l0
	stb	%g4,	[%l7 + 0x15]
	move	%icc,	%l4,	%o4
	fandnot2	%f26,	%f20,	%f2
	array8	%o2,	%i1,	%l2
	array16	%i0,	%l1,	%g5
	sub	%i6,	0x14D8,	%o7
	fmovrsgez	%g3,	%f31,	%f10
	movvs	%xcc,	%l6,	%l3
	udivx	%g7,	0x12DC,	%i7
	save %g2, %o0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g1,	0x15F8,	%i5
	udivx	%l5,	0x14D2,	%g6
	fabsd	%f20,	%f8
	fsrc2s	%f17,	%f26
	sll	%i3,	0x1F,	%o5
	fmovdgu	%xcc,	%f17,	%f25
	fmovsn	%icc,	%f12,	%f23
	fnot1s	%f14,	%f31
	movneg	%xcc,	%o1,	%i2
	and	%i4,	%o3,	%g4
	add	%l4,	%l0,	%o2
	sllx	%i1,	0x0A,	%o4
	edge32l	%l2,	%l1,	%g5
	fzeros	%f3
	edge32n	%i0,	%i6,	%o7
	movpos	%icc,	%l6,	%g3
	sdiv	%g7,	0x0C2D,	%l3
	movl	%icc,	%g2,	%i7
	edge32ln	%o6,	%g1,	%o0
	fmovrdgz	%l5,	%f6,	%f12
	edge16	%g6,	%i3,	%o5
	popc	0x13D5,	%i5
	sll	%i2,	0x05,	%o1
	fmovrse	%i4,	%f27,	%f3
	fmuld8sux16	%f8,	%f1,	%f8
	edge8n	%g4,	%l4,	%l0
	movge	%icc,	%o2,	%o3
	fmovdleu	%icc,	%f5,	%f29
	srl	%i1,	0x1B,	%o4
	edge32n	%l1,	%g5,	%l2
	movrne	%i0,	%i6,	%l6
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%o7
	edge32n	%g7,	%l3,	%g3
	orn	%i7,	%g2,	%g1
	fmovsa	%xcc,	%f25,	%f12
	xor	%o0,	%o6,	%l5
	fmovdle	%icc,	%f9,	%f28
	fmovda	%icc,	%f4,	%f13
	fand	%f24,	%f22,	%f22
	faligndata	%f28,	%f0,	%f30
	edge16	%g6,	%i3,	%i5
	ldub	[%l7 + 0x7D],	%o5
	movvc	%icc,	%i2,	%i4
	ldub	[%l7 + 0x0E],	%o1
	fmovdleu	%xcc,	%f12,	%f6
	and	%l4,	0x0E39,	%g4
	movleu	%xcc,	%l0,	%o2
	lduh	[%l7 + 0x0E],	%o3
	fmovdge	%xcc,	%f6,	%f2
	movrgez	%o4,	0x1EE,	%i1
	fmovrdgez	%l1,	%f10,	%f14
	move	%icc,	%g5,	%i0
	orn	%i6,	%l6,	%o7
	movcs	%xcc,	%l2,	%g7
	movleu	%xcc,	%l3,	%g3
	std	%f10,	[%l7 + 0x48]
	sdivx	%i7,	0x110A,	%g1
	std	%f8,	[%l7 + 0x08]
	fcmpne16	%f16,	%f28,	%o0
	movrlez	%o6,	0x0B2,	%g2
	orncc	%g6,	0x0D69,	%i3
	xor	%i5,	%o5,	%i2
	fmovrslez	%i4,	%f1,	%f13
	fpackfix	%f24,	%f29
	subc	%l5,	0x042C,	%l4
	stw	%g4,	[%l7 + 0x44]
	smul	%l0,	0x0003,	%o2
	xnor	%o1,	%o4,	%o3
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	fmovdgu	%icc,	%f24,	%f13
	stx	%i6,	[%l7 + 0x20]
	edge8ln	%i0,	%o7,	%l2
	sir	0x09F0
	ldsw	[%l7 + 0x1C],	%g7
	xorcc	%l3,	0x1D8F,	%l6
	fcmpeq32	%f24,	%f28,	%i7
	udivcc	%g1,	0x0D68,	%g3
	srax	%o0,	%g2,	%o6
	fmovdge	%icc,	%f24,	%f9
	edge8n	%g6,	%i5,	%i3
	fpack32	%f2,	%f16,	%f6
	fmovsvc	%icc,	%f22,	%f18
	movneg	%icc,	%i2,	%o5
	fmovsne	%icc,	%f7,	%f8
	movneg	%xcc,	%l5,	%i4
	sth	%l4,	[%l7 + 0x1E]
	srax	%g4,	0x04,	%o2
	fmovdneg	%xcc,	%f30,	%f20
	edge32l	%l0,	%o4,	%o3
	ldx	[%l7 + 0x18],	%l1
	movn	%xcc,	%o1,	%g5
	andcc	%i1,	%i0,	%o7
	fmovrsgz	%l2,	%f3,	%f12
	edge8l	%i6,	%l3,	%l6
	bshuffle	%f4,	%f6,	%f28
	edge32l	%i7,	%g7,	%g1
	fmovrdlz	%g3,	%f18,	%f28
	sth	%o0,	[%l7 + 0x6C]
	srax	%o6,	0x05,	%g6
	addccc	%g2,	0x1E47,	%i5
	fmovdle	%icc,	%f11,	%f3
	fpmerge	%f25,	%f1,	%f24
	fmul8x16al	%f20,	%f23,	%f4
	movgu	%icc,	%i3,	%i2
	edge16l	%l5,	%o5,	%i4
	fmovde	%icc,	%f7,	%f6
	edge8l	%g4,	%l4,	%l0
	stw	%o4,	[%l7 + 0x60]
	alignaddrl	%o3,	%l1,	%o1
	edge16	%g5,	%i1,	%o2
	stb	%o7,	[%l7 + 0x55]
	fcmple16	%f22,	%f0,	%i0
	edge8	%l2,	%i6,	%l6
	fmovrsgez	%l3,	%f22,	%f5
	and	%g7,	0x09C7,	%g1
	lduw	[%l7 + 0x40],	%i7
	sethi	0x1267,	%g3
	save %o6, %o0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i5,	%g6
	edge32n	%i2,	%l5,	%i3
	edge8n	%o5,	%i4,	%l4
	edge32n	%g4,	%l0,	%o3
	fsrc1s	%f19,	%f13
	ldd	[%l7 + 0x40],	%f6
	subccc	%l1,	0x124D,	%o1
	xnorcc	%o4,	%g5,	%i1
	popc	0x1316,	%o2
	array16	%i0,	%l2,	%o7
	std	%f22,	[%l7 + 0x70]
	movn	%xcc,	%i6,	%l6
	sub	%l3,	%g7,	%g1
	fmul8x16al	%f20,	%f1,	%f24
	lduh	[%l7 + 0x4C],	%i7
	fnot2	%f24,	%f28
	fnands	%f24,	%f10,	%f8
	mova	%xcc,	%g3,	%o0
	fmovrse	%g2,	%f18,	%f24
	movg	%icc,	%i5,	%g6
	st	%f28,	[%l7 + 0x34]
	edge8n	%i2,	%o6,	%i3
	ldd	[%l7 + 0x28],	%o4
	fmuld8sux16	%f27,	%f1,	%f2
	sdivcc	%i4,	0x09A4,	%l5
	alignaddrl	%l4,	%g4,	%l0
	srl	%o3,	0x06,	%o1
	ldd	[%l7 + 0x38],	%o4
	edge8ln	%l1,	%g5,	%i1
	sra	%i0,	0x07,	%o2
	ldub	[%l7 + 0x78],	%o7
	andn	%l2,	0x10DA,	%l6
	edge32ln	%l3,	%i6,	%g7
	movrlz	%i7,	0x365,	%g1
	edge16n	%g3,	%o0,	%i5
	add	%g2,	%i2,	%o6
	edge16l	%i3,	%o5,	%i4
	fones	%f29
	addcc	%g6,	%l5,	%l4
	andn	%g4,	%l0,	%o1
	fmovdge	%icc,	%f19,	%f29
	sir	0x03B0
	fcmped	%fcc0,	%f0,	%f26
	sll	%o4,	%o3,	%g5
	fand	%f12,	%f10,	%f18
	ldub	[%l7 + 0x79],	%i1
	edge32l	%l1,	%i0,	%o2
	fmovsvs	%xcc,	%f16,	%f30
	lduw	[%l7 + 0x58],	%l2
	subc	%o7,	0x180D,	%l6
	ldsb	[%l7 + 0x36],	%i6
	umul	%g7,	0x00A2,	%l3
	orn	%g1,	0x15FF,	%i7
	lduh	[%l7 + 0x4E],	%g3
	fmovdpos	%xcc,	%f5,	%f18
	addcc	%i5,	0x14DF,	%g2
	andncc	%o0,	%o6,	%i3
	stb	%i2,	[%l7 + 0x37]
	movvc	%icc,	%i4,	%g6
	fmovsvs	%icc,	%f31,	%f7
	xnor	%o5,	%l5,	%l4
	edge32ln	%l0,	%o1,	%o4
	movrlez	%g4,	0x123,	%o3
	restore %g5, %l1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o2,	%l2
	srlx	%o7,	0x11,	%l6
	nop
	set	0x78, %l2
	ldx	[%l7 + %l2],	%i1
	array32	%i6,	%l3,	%g7
	faligndata	%f24,	%f22,	%f16
	fnot2	%f20,	%f2
	umul	%g1,	0x0FA3,	%g3
	movcs	%icc,	%i7,	%g2
	andcc	%o0,	%i5,	%o6
	movl	%icc,	%i3,	%i2
	movcc	%xcc,	%g6,	%o5
	movpos	%icc,	%l5,	%l4
	andcc	%l0,	%i4,	%o4
	movpos	%xcc,	%g4,	%o3
	stw	%o1,	[%l7 + 0x34]
	fpack16	%f30,	%f19
	movl	%icc,	%l1,	%g5
	movcs	%xcc,	%o2,	%l2
	fandnot2s	%f13,	%f8,	%f3
	ldsh	[%l7 + 0x54],	%o7
	lduw	[%l7 + 0x58],	%l6
	movgu	%xcc,	%i0,	%i1
	ldx	[%l7 + 0x30],	%i6
	srax	%g7,	%g1,	%l3
	srax	%g3,	0x11,	%g2
	fmul8x16	%f13,	%f24,	%f8
	mulscc	%i7,	0x19EC,	%o0
	fmovsa	%xcc,	%f18,	%f10
	fpadd16	%f6,	%f28,	%f30
	edge8n	%o6,	%i5,	%i3
	ldsw	[%l7 + 0x24],	%g6
	edge8ln	%i2,	%l5,	%o5
	mulscc	%l0,	0x049B,	%i4
	fnand	%f14,	%f0,	%f24
	movcc	%xcc,	%o4,	%l4
	fcmpd	%fcc2,	%f4,	%f10
	ldsh	[%l7 + 0x32],	%g4
	xnorcc	%o1,	0x0CB5,	%l1
	mulx	%o3,	%g5,	%o2
	ldsb	[%l7 + 0x46],	%o7
	movre	%l6,	%l2,	%i1
	fands	%f28,	%f25,	%f14
	movvs	%icc,	%i0,	%g7
	fsrc1s	%f6,	%f31
	fmovsa	%icc,	%f9,	%f9
	edge8	%i6,	%g1,	%l3
	or	%g3,	0x0E14,	%g2
	umul	%o0,	0x0D19,	%i7
	lduw	[%l7 + 0x78],	%i5
	edge8n	%i3,	%o6,	%i2
	fmovdcc	%icc,	%f9,	%f20
	ldsw	[%l7 + 0x4C],	%g6
	st	%f0,	[%l7 + 0x58]
	ldx	[%l7 + 0x68],	%o5
	stw	%l0,	[%l7 + 0x4C]
	movrlz	%l5,	0x04C,	%i4
	sdivx	%o4,	0x0EDD,	%l4
	fpack16	%f22,	%f25
	fnegd	%f0,	%f10
	movpos	%xcc,	%g4,	%o1
	and	%o3,	%g5,	%l1
	xorcc	%o2,	0x0E35,	%o7
	fmuld8sux16	%f3,	%f18,	%f2
	edge32n	%l6,	%l2,	%i1
	fcmpne32	%f18,	%f24,	%i0
	udivcc	%i6,	0x0F90,	%g7
	movrne	%l3,	%g1,	%g2
	srax	%g3,	%o0,	%i5
	fandnot2	%f6,	%f0,	%f8
	mulscc	%i3,	0x1131,	%o6
	std	%f4,	[%l7 + 0x40]
	fornot2	%f10,	%f24,	%f8
	fcmple16	%f22,	%f0,	%i2
	srlx	%g6,	0x17,	%o5
	and	%l0,	0x180D,	%l5
	sir	0x0B9D
	fabss	%f4,	%f25
	movl	%xcc,	%i4,	%o4
	fpadd16s	%f0,	%f14,	%f31
	fcmps	%fcc3,	%f31,	%f26
	fnors	%f22,	%f2,	%f20
	stw	%i7,	[%l7 + 0x64]
	fabsd	%f18,	%f4
	udivcc	%l4,	0x16DC,	%o1
	fcmpeq16	%f20,	%f30,	%g4
	and	%g5,	0x1FAD,	%l1
	sdiv	%o2,	0x07DD,	%o7
	sdivcc	%o3,	0x0CB1,	%l6
	orcc	%i1,	%l2,	%i6
	std	%f8,	[%l7 + 0x28]
	sth	%i0,	[%l7 + 0x36]
	fmovs	%f8,	%f30
	fmovdgu	%xcc,	%f26,	%f27
	fmovrdgez	%g7,	%f30,	%f14
	movrlez	%g1,	0x242,	%g2
	fpackfix	%f10,	%f17
	edge8n	%g3,	%l3,	%o0
	movne	%icc,	%i5,	%i3
	addcc	%o6,	0x15F2,	%i2
	edge8l	%g6,	%l0,	%l5
	fcmped	%fcc2,	%f28,	%f16
	movleu	%xcc,	%o5,	%o4
	sdiv	%i4,	0x1B77,	%l4
	xnorcc	%o1,	0x0227,	%i7
	mova	%xcc,	%g4,	%g5
	fmovd	%f18,	%f4
	movcs	%xcc,	%l1,	%o7
	nop
	set	0x54, %l4
	stw	%o3,	[%l7 + %l4]
	edge32ln	%o2,	%l6,	%l2
	fmul8ulx16	%f6,	%f24,	%f14
	stx	%i1,	[%l7 + 0x50]
	popc	0x0B19,	%i6
	fsrc2	%f18,	%f0
	movrne	%i0,	0x253,	%g7
	fcmpne32	%f20,	%f8,	%g2
	fmovrdlz	%g1,	%f14,	%f12
	srax	%l3,	0x16,	%o0
	fcmpne32	%f28,	%f20,	%g3
	edge16n	%i3,	%i5,	%o6
	movre	%g6,	0x1F9,	%l0
	fexpand	%f20,	%f28
	ldsh	[%l7 + 0x78],	%l5
	movre	%o5,	0x223,	%i2
	edge8	%i4,	%l4,	%o1
	edge8ln	%o4,	%i7,	%g4
	fmul8sux16	%f22,	%f24,	%f0
	fmovrdlez	%g5,	%f8,	%f0
	addccc	%o7,	0x1973,	%o3
	alignaddrl	%l1,	%l6,	%l2
	xor	%i1,	0x040D,	%i6
	for	%f2,	%f22,	%f16
	movl	%xcc,	%i0,	%g7
	sll	%o2,	%g1,	%g2
	movvs	%xcc,	%o0,	%l3
	fsrc2	%f16,	%f28
	alignaddr	%i3,	%i5,	%g3
	fnors	%f14,	%f27,	%f22
	movrlez	%g6,	0x234,	%l0
	ld	[%l7 + 0x2C],	%f8
	movge	%xcc,	%o6,	%l5
	save %o5, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o1,	0x12A1,	%o4
	fmovdcs	%icc,	%f26,	%f20
	orn	%l4,	%i7,	%g4
	fmovsl	%icc,	%f7,	%f9
	fcmpeq32	%f24,	%f4,	%o7
	sethi	0x17E4,	%g5
	fmul8x16al	%f5,	%f14,	%f24
	bshuffle	%f24,	%f10,	%f24
	edge16ln	%l1,	%l6,	%o3
	movleu	%icc,	%l2,	%i6
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	popc	%g1,	%i1
	movrlez	%o0,	%g2,	%i3
	fands	%f8,	%f30,	%f28
	udivcc	%l3,	0x196F,	%i5
	lduh	[%l7 + 0x4E],	%g6
	sdivcc	%g3,	0x12B3,	%l0
	movcc	%icc,	%l5,	%o5
	sllx	%i4,	%i2,	%o1
	fmovrse	%o4,	%f17,	%f12
	popc	0x0D4F,	%o6
	fcmpgt16	%f12,	%f6,	%l4
	orcc	%i7,	%g4,	%g5
	fsrc1	%f22,	%f20
	andn	%o7,	0x1064,	%l1
	movneg	%icc,	%l6,	%l2
	movn	%xcc,	%i6,	%i0
	umul	%g7,	%o2,	%g1
	ldsw	[%l7 + 0x24],	%o3
	movn	%icc,	%i1,	%g2
	add	%i3,	%o0,	%i5
	sll	%g6,	0x12,	%l3
	sdiv	%g3,	0x1CB1,	%l5
	stw	%o5,	[%l7 + 0x7C]
	andcc	%i4,	0x1D9F,	%i2
	fnot1	%f16,	%f12
	fcmpeq32	%f28,	%f4,	%o1
	ldsb	[%l7 + 0x5D],	%l0
	udivcc	%o4,	0x0825,	%l4
	fpack16	%f26,	%f19
	fmovda	%icc,	%f12,	%f6
	sir	0x1CC1
	srlx	%i7,	0x15,	%g4
	movge	%xcc,	%o6,	%o7
	movn	%icc,	%g5,	%l6
	stb	%l1,	[%l7 + 0x4D]
	srl	%i6,	%l2,	%i0
	fmovse	%xcc,	%f28,	%f7
	addccc	%g7,	0x1B36,	%g1
	movcc	%xcc,	%o3,	%o2
	subcc	%g2,	0x1DE4,	%i3
	movrlz	%i1,	0x359,	%i5
	movgu	%icc,	%g6,	%o0
	fxor	%f24,	%f2,	%f8
	fmovrslz	%g3,	%f20,	%f28
	ld	[%l7 + 0x1C],	%f29
	popc	0x1BF4,	%l5
	umul	%l3,	0x05D0,	%o5
	sdivx	%i2,	0x04C7,	%i4
	fornot1s	%f30,	%f10,	%f20
	mulx	%o1,	0x0C5D,	%o4
	fmovd	%f22,	%f22
	udiv	%l4,	0x06F5,	%i7
	xnor	%l0,	%o6,	%o7
	addccc	%g5,	0x13D9,	%g4
	sdivx	%l6,	0x0680,	%i6
	st	%f12,	[%l7 + 0x2C]
	stb	%l2,	[%l7 + 0x39]
	sth	%l1,	[%l7 + 0x1A]
	fpsub32s	%f26,	%f6,	%f30
	movrne	%g7,	%g1,	%i0
	sll	%o3,	0x1A,	%g2
	umulcc	%i3,	%i1,	%o2
	fmul8x16au	%f22,	%f4,	%f28
	fabss	%f23,	%f25
	orcc	%i5,	%o0,	%g6
	movvc	%xcc,	%g3,	%l5
	movn	%xcc,	%o5,	%i2
	srax	%l3,	0x03,	%o1
	edge32n	%o4,	%i4,	%i7
	fpack16	%f6,	%f17
	fmovsn	%xcc,	%f26,	%f22
	movne	%xcc,	%l4,	%l0
	orcc	%o7,	0x17D0,	%o6
	andncc	%g4,	%g5,	%l6
	smul	%l2,	%l1,	%i6
	movrne	%g7,	%i0,	%o3
	edge8ln	%g2,	%g1,	%i3
	orcc	%i1,	%i5,	%o2
	fmuld8ulx16	%f13,	%f5,	%f18
	movne	%icc,	%o0,	%g6
	fmovdge	%icc,	%f22,	%f10
	fmovsl	%icc,	%f29,	%f18
	subcc	%l5,	0x119E,	%g3
	fandnot2s	%f19,	%f21,	%f17
	edge32	%i2,	%o5,	%o1
	restore %l3, 0x02D5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i4,	%i7
	umulcc	%l0,	0x0894,	%l4
	fmovdle	%icc,	%f19,	%f30
	udiv	%o7,	0x1BED,	%g4
	sir	0x0A03
	orncc	%o6,	0x0BD6,	%g5
	srax	%l2,	0x08,	%l6
	fmovdvc	%xcc,	%f19,	%f31
	edge32l	%l1,	%i6,	%g7
	ldsb	[%l7 + 0x5C],	%i0
	orn	%g2,	%g1,	%i3
	siam	0x4
	fmovsl	%icc,	%f21,	%f13
	fornot1s	%f21,	%f10,	%f8
	andcc	%o3,	%i1,	%i5
	mulx	%o0,	%o2,	%g6
	movl	%xcc,	%l5,	%i2
	fsrc2s	%f16,	%f7
	andn	%g3,	0x029C,	%o5
	fmovdcs	%xcc,	%f29,	%f23
	ldsb	[%l7 + 0x3B],	%o1
	edge8l	%o4,	%l3,	%i4
	fmuld8sux16	%f18,	%f12,	%f30
	movrgez	%l0,	0x368,	%i7
	umul	%l4,	%g4,	%o7
	alignaddr	%o6,	%g5,	%l2
	movg	%icc,	%l6,	%l1
	fexpand	%f2,	%f22
	fnor	%f18,	%f0,	%f14
	fmovdne	%icc,	%f18,	%f29
	movcc	%icc,	%g7,	%i6
	mulx	%g2,	0x1963,	%g1
	stb	%i3,	[%l7 + 0x67]
	stw	%i0,	[%l7 + 0x1C]
	fmovrdne	%i1,	%f20,	%f26
	lduw	[%l7 + 0x7C],	%i5
	fmovsl	%xcc,	%f25,	%f16
	alignaddr	%o0,	%o2,	%g6
	array8	%o3,	%l5,	%g3
	edge32ln	%o5,	%i2,	%o4
	fmovrdgz	%o1,	%f0,	%f16
	ldub	[%l7 + 0x1D],	%i4
	srl	%l0,	0x1F,	%i7
	movrlez	%l3,	0x38F,	%l4
	fpack32	%f6,	%f24,	%f12
	fpsub16s	%f11,	%f24,	%f28
	add	%g4,	%o6,	%g5
	add	%o7,	%l6,	%l2
	fornot2	%f0,	%f6,	%f10
	srl	%g7,	%l1,	%g2
	fpack16	%f28,	%f7
	movvc	%xcc,	%i6,	%i3
	st	%f23,	[%l7 + 0x44]
	andncc	%i0,	%g1,	%i1
	movl	%xcc,	%o0,	%o2
	fmovdcc	%xcc,	%f19,	%f20
	srl	%i5,	0x0D,	%o3
	movg	%xcc,	%g6,	%l5
	edge8ln	%o5,	%i2,	%g3
	nop
	set	0x32, %g6
	sth	%o1,	[%l7 + %g6]
	movrne	%i4,	0x3FD,	%l0
	xorcc	%o4,	%l3,	%i7
	udiv	%l4,	0x0CCC,	%o6
	andcc	%g5,	0x0FB3,	%o7
	movge	%xcc,	%g4,	%l6
	addc	%l2,	%g7,	%l1
	fpadd32s	%f28,	%f23,	%f2
	smulcc	%i6,	%g2,	%i0
	array32	%i3,	%g1,	%o0
	sdivx	%o2,	0x0E01,	%i5
	fsrc2s	%f31,	%f4
	move	%icc,	%i1,	%g6
	save %o3, 0x1048, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f8,	%f2,	%f7
	srlx	%o5,	%i2,	%g3
	sllx	%o1,	%i4,	%l0
	array8	%l3,	%i7,	%l4
	fmovsvs	%icc,	%f20,	%f18
	fcmpgt32	%f22,	%f0,	%o4
	addc	%g5,	%o6,	%g4
	edge8ln	%o7,	%l6,	%l2
	sub	%l1,	0x171F,	%g7
	addccc	%g2,	0x1671,	%i6
	array8	%i3,	%g1,	%i0
	movpos	%xcc,	%o2,	%i5
	fmovscc	%xcc,	%f28,	%f3
	ldd	[%l7 + 0x40],	%f6
	movrgez	%i1,	0x1C7,	%g6
	sub	%o0,	%o3,	%l5
	fornot2s	%f23,	%f3,	%f22
	edge32	%i2,	%o5,	%o1
	movge	%xcc,	%i4,	%g3
	ldd	[%l7 + 0x70],	%l0
	mulscc	%i7,	0x0993,	%l3
	sdivx	%o4,	0x1525,	%g5
	edge8	%o6,	%l4,	%o7
	movl	%icc,	%g4,	%l2
	movvc	%xcc,	%l6,	%l1
	or	%g2,	%g7,	%i3
	sllx	%i6,	0x0C,	%i0
	fmovrsgez	%g1,	%f23,	%f31
	ldsh	[%l7 + 0x5C],	%i5
	and	%i1,	%g6,	%o2
	movl	%icc,	%o0,	%l5
	and	%i2,	0x18A9,	%o5
	movneg	%xcc,	%o3,	%o1
	sdivx	%g3,	0x120A,	%l0
	edge8ln	%i7,	%l3,	%i4
	fcmpeq32	%f12,	%f18,	%g5
	subcc	%o4,	%l4,	%o6
	fmovrdne	%o7,	%f8,	%f30
	addccc	%g4,	0x1EA3,	%l2
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	array32	%g7,	%i3,	%i0
	ldd	[%l7 + 0x60],	%i6
	movpos	%xcc,	%g1,	%i5
	smulcc	%g6,	%i1,	%o0
	edge32	%l5,	%o2,	%o5
	ldub	[%l7 + 0x75],	%i2
	std	%f30,	[%l7 + 0x60]
	fmovsne	%icc,	%f10,	%f0
	stx	%o1,	[%l7 + 0x50]
	edge32	%g3,	%o3,	%i7
	fnegs	%f25,	%f14
	sdivx	%l3,	0x1D24,	%i4
	fmul8x16al	%f12,	%f16,	%f2
	ldx	[%l7 + 0x48],	%l0
	xorcc	%g5,	0x1016,	%l4
	ldsw	[%l7 + 0x68],	%o6
	movcs	%icc,	%o4,	%o7
	fmovsvc	%xcc,	%f24,	%f12
	xor	%g4,	%l6,	%l2
	edge16ln	%g2,	%l1,	%g7
	smulcc	%i3,	%i6,	%i0
	ldsw	[%l7 + 0x1C],	%i5
	restore %g1, 0x0D6F, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	%l5,	%o2
	addcc	%o5,	0x1C6D,	%i2
	save %o0, %g3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i7,	0x1BCF,	%o1
	udiv	%i4,	0x1887,	%l3
	fmovrslez	%g5,	%f24,	%f8
	sra	%l0,	%o6,	%l4
	ldd	[%l7 + 0x08],	%f20
	udiv	%o4,	0x098D,	%g4
	alignaddr	%l6,	%o7,	%g2
	edge16ln	%l2,	%l1,	%i3
	udiv	%i6,	0x1F95,	%g7
	fmovspos	%xcc,	%f14,	%f10
	array8	%i5,	%i0,	%g1
	edge8l	%i1,	%g6,	%l5
	fmovdge	%xcc,	%f14,	%f20
	siam	0x4
	andn	%o2,	0x1D37,	%i2
	lduh	[%l7 + 0x68],	%o0
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fors	%f3,	%f31,	%f9
	fmovdl	%xcc,	%f29,	%f22
	mova	%xcc,	%g3,	%i4
	fmovdn	%xcc,	%f23,	%f26
	sll	%l3,	0x00,	%g5
	edge32	%l0,	%o1,	%o6
	udivcc	%l4,	0x06DF,	%g4
	sth	%o4,	[%l7 + 0x42]
	ldd	[%l7 + 0x38],	%o6
	xor	%g2,	%l6,	%l1
	sub	%i3,	0x1B99,	%i6
	std	%f22,	[%l7 + 0x60]
	lduh	[%l7 + 0x12],	%g7
	movrlez	%l2,	%i5,	%g1
	fcmped	%fcc1,	%f18,	%f22
	fand	%f24,	%f14,	%f2
	fnor	%f18,	%f6,	%f8
	smul	%i1,	0x1E65,	%g6
	for	%f12,	%f16,	%f12
	mulscc	%l5,	0x0B3B,	%i0
	stb	%i2,	[%l7 + 0x7E]
	movrlez	%o0,	%o5,	%o2
	stw	%i7,	[%l7 + 0x64]
	array32	%g3,	%i4,	%o3
	movrlez	%l3,	0x37C,	%g5
	edge8	%l0,	%o6,	%l4
	stw	%g4,	[%l7 + 0x60]
	for	%f20,	%f4,	%f24
	edge32n	%o1,	%o4,	%o7
	ldsw	[%l7 + 0x14],	%g2
	array8	%l6,	%l1,	%i3
	move	%xcc,	%i6,	%l2
	lduw	[%l7 + 0x0C],	%i5
	umul	%g7,	0x1EA2,	%i1
	fcmped	%fcc3,	%f22,	%f30
	fcmped	%fcc2,	%f28,	%f26
	fmovrslz	%g6,	%f3,	%f21
	movrlez	%g1,	%l5,	%i0
	movvc	%xcc,	%o0,	%o5
	movrgez	%i2,	%o2,	%g3
	fmovdcc	%xcc,	%f14,	%f22
	ldx	[%l7 + 0x50],	%i7
	movrne	%i4,	0x2DE,	%o3
	ldsb	[%l7 + 0x3A],	%l3
	movn	%icc,	%g5,	%o6
	ldsb	[%l7 + 0x53],	%l0
	fpsub16	%f28,	%f28,	%f6
	fabsd	%f20,	%f4
	fors	%f20,	%f26,	%f27
	subc	%l4,	0x1E81,	%g4
	orcc	%o1,	%o4,	%o7
	movne	%xcc,	%l6,	%l1
	fmul8ulx16	%f8,	%f30,	%f14
	fpadd16s	%f0,	%f14,	%f29
	udivcc	%i3,	0x18FC,	%g2
	movle	%icc,	%i6,	%l2
	ldsw	[%l7 + 0x0C],	%g7
	fmovdneg	%xcc,	%f31,	%f23
	ldd	[%l7 + 0x68],	%f26
	movrgez	%i5,	%g6,	%g1
	movcs	%icc,	%l5,	%i0
	orncc	%i1,	%o5,	%i2
	and	%o2,	0x1961,	%g3
	fmovsne	%xcc,	%f4,	%f0
	movre	%i7,	%o0,	%i4
	sethi	0x190D,	%o3
	umul	%g5,	0x11DE,	%o6
	fcmpd	%fcc3,	%f8,	%f26
	fnor	%f28,	%f26,	%f2
	udiv	%l0,	0x129C,	%l3
	fands	%f24,	%f15,	%f19
	or	%l4,	%g4,	%o1
	fmovsleu	%xcc,	%f28,	%f16
	fmovrsne	%o7,	%f14,	%f10
	umul	%l6,	%l1,	%o4
	movrlz	%g2,	0x15D,	%i6
	orn	%l2,	%i3,	%i5
	andn	%g7,	0x0F56,	%g1
	fpmerge	%f9,	%f4,	%f24
	array32	%l5,	%i0,	%i1
	move	%xcc,	%g6,	%i2
	fmovsgu	%icc,	%f13,	%f18
	fmovdg	%icc,	%f12,	%f1
	or	%o5,	0x06D7,	%o2
	sra	%i7,	%g3,	%i4
	nop
	set	0x3F, %l5
	ldub	[%l7 + %l5],	%o3
	edge32n	%g5,	%o6,	%l0
	popc	0x036E,	%o0
	subc	%l3,	%g4,	%l4
	movrne	%o7,	0x220,	%l6
	srl	%o1,	%o4,	%l1
	movvs	%icc,	%g2,	%i6
	fmovdvs	%xcc,	%f15,	%f20
	ldsh	[%l7 + 0x1E],	%i3
	nop
	set	0x50, %i1
	lduw	[%l7 + %i1],	%l2
	movcc	%xcc,	%g7,	%i5
	addc	%l5,	0x14BF,	%g1
	movcs	%icc,	%i1,	%i0
	fxors	%f10,	%f15,	%f30
	siam	0x6
	sdiv	%i2,	0x0653,	%g6
	udiv	%o5,	0x09BA,	%i7
	udivcc	%o2,	0x02BE,	%g3
	fcmpne32	%f14,	%f2,	%o3
	fnors	%f6,	%f7,	%f8
	edge8	%g5,	%o6,	%l0
	movl	%xcc,	%o0,	%i4
	nop
	set	0x10, %o2
	std	%f2,	[%l7 + %o2]
	fnot2	%f26,	%f14
	stx	%g4,	[%l7 + 0x48]
	and	%l3,	0x1CE5,	%l4
	array8	%l6,	%o1,	%o4
	subc	%o7,	0x0C72,	%g2
	ldub	[%l7 + 0x14],	%i6
	save %i3, %l1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l2,	0x0510,	%l5
	ldd	[%l7 + 0x58],	%g0
	stw	%i1,	[%l7 + 0x78]
	edge8	%i5,	%i2,	%g6
	subcc	%i0,	0x0D5D,	%o5
	lduh	[%l7 + 0x4C],	%o2
	andcc	%g3,	0x1068,	%o3
	restore %i7, %g5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o0,	0x13FA,	%i4
	fcmps	%fcc0,	%f9,	%f17
	orcc	%g4,	0x12E5,	%l3
	movrlez	%o6,	0x131,	%l6
	and	%l4,	0x0F49,	%o1
	and	%o4,	%g2,	%i6
	edge16	%i3,	%o7,	%l1
	edge16n	%l2,	%l5,	%g1
	fmovs	%f4,	%f13
	andcc	%i1,	0x189F,	%i5
	movpos	%xcc,	%g7,	%i2
	edge32n	%g6,	%o5,	%o2
	move	%icc,	%i0,	%o3
	ldx	[%l7 + 0x30],	%i7
	sdiv	%g5,	0x0785,	%g3
	andcc	%l0,	0x1C38,	%i4
	edge8	%g4,	%o0,	%o6
	umul	%l3,	%l4,	%o1
	mulscc	%o4,	%l6,	%i6
	movcs	%xcc,	%g2,	%o7
	array32	%l1,	%l2,	%l5
	movne	%icc,	%g1,	%i1
	std	%f10,	[%l7 + 0x40]
	fandnot1	%f24,	%f0,	%f8
	fmovrse	%i3,	%f17,	%f10
	movcs	%icc,	%g7,	%i5
	srlx	%i2,	0x14,	%g6
	sir	0x0EC9
	fcmple16	%f10,	%f0,	%o2
	fmovdvc	%icc,	%f16,	%f10
	xor	%i0,	0x04C2,	%o5
	fnot2	%f4,	%f6
	edge8n	%o3,	%g5,	%i7
	fmovse	%xcc,	%f9,	%f26
	fnegs	%f2,	%f16
	movpos	%xcc,	%l0,	%g3
	movne	%icc,	%g4,	%i4
	fsrc2s	%f13,	%f23
	fmovsneg	%xcc,	%f30,	%f21
	xorcc	%o0,	0x0D18,	%l3
	ldx	[%l7 + 0x20],	%l4
	udivcc	%o6,	0x1231,	%o4
	andncc	%l6,	%o1,	%i6
	fcmpeq16	%f20,	%f12,	%g2
	subc	%l1,	0x12A9,	%o7
	fornot2s	%f25,	%f31,	%f10
	fpackfix	%f18,	%f0
	edge8n	%l5,	%g1,	%l2
	fmovsg	%icc,	%f31,	%f12
	fxor	%f12,	%f30,	%f28
	stw	%i1,	[%l7 + 0x38]
	ldsb	[%l7 + 0x2D],	%g7
	edge8ln	%i3,	%i5,	%i2
	fmul8x16au	%f14,	%f7,	%f4
	fmovdcc	%xcc,	%f26,	%f20
	umul	%o2,	0x19A0,	%i0
	fmovsvc	%icc,	%f25,	%f1
	fcmps	%fcc1,	%f17,	%f0
	sdivcc	%g6,	0x0DEB,	%o3
	smul	%o5,	%g5,	%i7
	subcc	%l0,	0x03F6,	%g4
	movn	%icc,	%g3,	%i4
	fmovrslz	%l3,	%f6,	%f17
	movvc	%xcc,	%o0,	%l4
	umulcc	%o4,	%l6,	%o1
	udivx	%i6,	0x180C,	%o6
	bshuffle	%f28,	%f10,	%f20
	sll	%l1,	0x1B,	%o7
	fmovsge	%xcc,	%f13,	%f5
	fmovrde	%g2,	%f8,	%f16
	movgu	%xcc,	%l5,	%l2
	mova	%icc,	%i1,	%g7
	sdivx	%i3,	0x0214,	%g1
	xor	%i2,	%i5,	%i0
	udiv	%g6,	0x096F,	%o2
	udiv	%o3,	0x15F5,	%o5
	ldub	[%l7 + 0x3A],	%g5
	fmovd	%f28,	%f26
	edge8	%i7,	%g4,	%l0
	subccc	%g3,	0x13B4,	%l3
	ldsb	[%l7 + 0x23],	%i4
	edge16ln	%o0,	%l4,	%l6
	fmovde	%icc,	%f24,	%f7
	movleu	%icc,	%o4,	%i6
	movle	%xcc,	%o1,	%o6
	edge16n	%o7,	%g2,	%l1
	ldsb	[%l7 + 0x5D],	%l2
	fcmpgt16	%f28,	%f22,	%i1
	fmovspos	%icc,	%f12,	%f0
	movgu	%icc,	%g7,	%i3
	fpackfix	%f0,	%f20
	fabsd	%f28,	%f14
	fcmpeq16	%f26,	%f30,	%l5
	edge8ln	%i2,	%i5,	%g1
	movrlez	%i0,	%g6,	%o2
	addc	%o5,	%o3,	%g5
	fpsub16	%f30,	%f0,	%f30
	sethi	0x043D,	%g4
	edge16	%l0,	%g3,	%i7
	edge8n	%l3,	%o0,	%l4
	edge16ln	%l6,	%i4,	%o4
	movneg	%icc,	%o1,	%o6
	orcc	%o7,	0x0872,	%i6
	fmovdne	%icc,	%f11,	%f25
	sllx	%g2,	%l2,	%l1
	edge32n	%g7,	%i3,	%l5
	movvc	%xcc,	%i1,	%i2
	fpsub32	%f10,	%f24,	%f30
	umulcc	%g1,	0x160F,	%i5
	fmovdn	%icc,	%f0,	%f11
	xnor	%i0,	0x06CA,	%o2
	fpadd32	%f16,	%f2,	%f24
	addc	%o5,	%o3,	%g6
	mova	%icc,	%g4,	%l0
	save %g5, %i7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x6F],	%l3
	alignaddrl	%l4,	%o0,	%l6
	andn	%o4,	0x115C,	%o1
	fmovd	%f4,	%f12
	udiv	%o6,	0x10C0,	%i4
	edge16	%o7,	%i6,	%l2
	addccc	%g2,	%l1,	%i3
	edge32ln	%l5,	%g7,	%i2
	movvs	%icc,	%i1,	%i5
	mova	%xcc,	%g1,	%i0
	edge16n	%o5,	%o3,	%o2
	orn	%g6,	0x1634,	%l0
	fmovde	%xcc,	%f9,	%f11
	sdiv	%g4,	0x19E4,	%g5
	fpsub16	%f8,	%f12,	%f10
	edge8ln	%g3,	%i7,	%l4
	movrne	%l3,	%o0,	%o4
	fnor	%f18,	%f14,	%f4
	sdivx	%l6,	0x0654,	%o1
	ldd	[%l7 + 0x78],	%f24
	umulcc	%o6,	0x1496,	%o7
	ldd	[%l7 + 0x20],	%i4
	stw	%i6,	[%l7 + 0x64]
	sdivcc	%l2,	0x10AC,	%g2
	ldd	[%l7 + 0x18],	%f24
	edge32l	%l1,	%i3,	%l5
	fandnot2	%f30,	%f12,	%f4
	stx	%g7,	[%l7 + 0x70]
	addcc	%i1,	0x0710,	%i2
	andncc	%g1,	%i5,	%o5
	movne	%icc,	%o3,	%i0
	edge32	%g6,	%o2,	%l0
	popc	0x045A,	%g4
	fmovrdne	%g3,	%f8,	%f12
	edge8l	%i7,	%l4,	%l3
	and	%g5,	%o4,	%o0
	st	%f4,	[%l7 + 0x34]
	movpos	%xcc,	%l6,	%o1
	udivcc	%o7,	0x15E6,	%i4
	fmovscs	%xcc,	%f25,	%f28
	addc	%o6,	0x1C08,	%l2
	udiv	%g2,	0x0500,	%l1
	ldd	[%l7 + 0x50],	%i2
	srlx	%i6,	0x11,	%l5
	sdivx	%i1,	0x0F29,	%g7
	mova	%icc,	%i2,	%g1
	andncc	%i5,	%o5,	%i0
	andncc	%g6,	%o2,	%l0
	ldd	[%l7 + 0x48],	%f6
	movneg	%xcc,	%o3,	%g4
	fmovscs	%icc,	%f11,	%f7
	fexpand	%f3,	%f20
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fmovsne	%xcc,	%f14,	%f26
	movrgez	%l4,	%o4,	%g5
	sdivcc	%o0,	0x0CC5,	%l6
	fpack16	%f6,	%f15
	array16	%o1,	%i4,	%o7
	movneg	%xcc,	%o6,	%l2
	for	%f12,	%f8,	%f30
	fmuld8sux16	%f21,	%f10,	%f4
	fnot2	%f8,	%f4
	ldsw	[%l7 + 0x78],	%l1
	addccc	%g2,	0x1230,	%i3
	fmovdvs	%icc,	%f3,	%f4
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%i6
	movge	%icc,	%i1,	%g7
	addc	%i2,	%l5,	%i5
	add	%o5,	%g1,	%i0
	smulcc	%o2,	%g6,	%l0
	fmovsleu	%icc,	%f23,	%f21
	stx	%o3,	[%l7 + 0x28]
	movneg	%xcc,	%i7,	%g3
	sethi	0x117E,	%g4
	sdivcc	%l3,	0x1305,	%o4
	movg	%icc,	%l4,	%o0
	fcmpgt32	%f30,	%f10,	%g5
	std	%f0,	[%l7 + 0x68]
	add	%l6,	%i4,	%o7
	udiv	%o6,	0x02D3,	%o1
	array16	%l1,	%l2,	%i3
	srl	%g2,	0x10,	%i1
	fpadd32s	%f21,	%f23,	%f29
	subcc	%g7,	0x0D93,	%i2
	lduw	[%l7 + 0x7C],	%i6
	fmovdpos	%icc,	%f10,	%f30
	movvc	%icc,	%l5,	%i5
	fcmpeq32	%f2,	%f22,	%o5
	mulscc	%i0,	%g1,	%g6
	umulcc	%l0,	0x0EDB,	%o3
	orncc	%o2,	0x18EA,	%i7
	movvs	%icc,	%g4,	%g3
	nop
	set	0x1F, %l1
	ldsb	[%l7 + %l1],	%l3
	addc	%o4,	0x007C,	%l4
	edge32n	%g5,	%o0,	%i4
	subc	%l6,	%o7,	%o1
	edge32	%l1,	%l2,	%o6
	fmovsne	%xcc,	%f26,	%f19
	edge16l	%g2,	%i3,	%g7
	fpadd16	%f14,	%f24,	%f20
	fmovscs	%xcc,	%f11,	%f18
	orcc	%i2,	%i1,	%l5
	fmovdleu	%icc,	%f20,	%f22
	fmovsl	%icc,	%f7,	%f25
	ldsw	[%l7 + 0x4C],	%i5
	movn	%icc,	%o5,	%i6
	fmovrdlz	%i0,	%f0,	%f14
	movrlez	%g1,	%l0,	%g6
	movrlz	%o3,	0x343,	%o2
	subccc	%i7,	%g3,	%g4
	subcc	%o4,	%l3,	%g5
	xnor	%l4,	0x17D5,	%i4
	stb	%o0,	[%l7 + 0x5A]
	fmuld8sux16	%f17,	%f3,	%f18
	smul	%o7,	%o1,	%l6
	umulcc	%l2,	0x1D6E,	%l1
	movre	%g2,	0x2DA,	%o6
	movrlz	%i3,	0x224,	%g7
	udiv	%i1,	0x0688,	%i2
	udivcc	%i5,	0x108D,	%l5
	ldd	[%l7 + 0x70],	%f16
	fmovsleu	%icc,	%f16,	%f1
	addcc	%i6,	%o5,	%i0
	srl	%l0,	%g6,	%g1
	move	%icc,	%o3,	%i7
	srl	%o2,	%g4,	%g3
	smul	%o4,	0x0C9F,	%g5
	movrne	%l4,	0x2E8,	%l3
	st	%f11,	[%l7 + 0x74]
	fexpand	%f27,	%f14
	andcc	%o0,	%i4,	%o7
	movl	%xcc,	%o1,	%l2
	addc	%l1,	0x0F11,	%g2
	fexpand	%f13,	%f24
	addc	%l6,	0x1236,	%o6
	smul	%g7,	%i3,	%i2
	fsrc1s	%f18,	%f3
	addccc	%i5,	0x0F0E,	%i1
	alignaddr	%i6,	%o5,	%i0
	lduh	[%l7 + 0x36],	%l5
	sub	%g6,	0x06A3,	%l0
	add	%o3,	%i7,	%o2
	fmovrslz	%g4,	%f12,	%f13
	movg	%icc,	%g3,	%o4
	alignaddr	%g5,	%g1,	%l3
	ld	[%l7 + 0x30],	%f24
	movcs	%xcc,	%o0,	%l4
	fmul8x16au	%f31,	%f4,	%f10
	fpsub32s	%f23,	%f23,	%f6
	alignaddr	%i4,	%o1,	%o7
	restore %l2, %g2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o6,	0x20C,	%g7
	movneg	%xcc,	%i3,	%l1
	movge	%xcc,	%i2,	%i5
	alignaddr	%i1,	%o5,	%i0
	srax	%l5,	%i6,	%l0
	sdivx	%g6,	0x1F2B,	%o3
	sra	%i7,	0x1C,	%g4
	movcs	%icc,	%g3,	%o2
	movvs	%xcc,	%o4,	%g1
	stx	%l3,	[%l7 + 0x18]
	stw	%o0,	[%l7 + 0x10]
	ldd	[%l7 + 0x30],	%l4
	sethi	0x16EA,	%i4
	fmovsa	%icc,	%f29,	%f10
	edge16ln	%o1,	%g5,	%o7
	udivx	%g2,	0x0BC9,	%l2
	fmovdpos	%xcc,	%f10,	%f9
	fpsub32s	%f18,	%f21,	%f21
	fmovsle	%xcc,	%f21,	%f0
	nop
	set	0x53, %g1
	ldsb	[%l7 + %g1],	%o6
	fcmped	%fcc1,	%f18,	%f22
	edge8n	%l6,	%g7,	%i3
	popc	0x04AC,	%i2
	udiv	%i5,	0x1BC7,	%l1
	move	%icc,	%o5,	%i0
	movleu	%xcc,	%l5,	%i1
	mulx	%l0,	0x131E,	%i6
	edge16	%o3,	%i7,	%g6
	movl	%icc,	%g4,	%g3
	fcmpeq16	%f8,	%f4,	%o4
	sir	0x0EA6
	umulcc	%g1,	0x0194,	%o2
	sll	%l3,	%l4,	%o0
	fmovdne	%xcc,	%f17,	%f3
	movgu	%icc,	%o1,	%g5
	umulcc	%o7,	0x1855,	%g2
	addcc	%l2,	0x029E,	%o6
	xnor	%l6,	0x06AD,	%i4
	mulx	%g7,	0x0DCD,	%i3
	alignaddr	%i5,	%i2,	%l1
	ldsb	[%l7 + 0x40],	%o5
	fmovdcc	%icc,	%f20,	%f5
	ldd	[%l7 + 0x08],	%f12
	fmovsgu	%icc,	%f27,	%f24
	fcmpeq32	%f0,	%f26,	%l5
	fcmple32	%f4,	%f10,	%i0
	fmovsne	%xcc,	%f11,	%f28
	fmovrsgez	%l0,	%f8,	%f19
	std	%f0,	[%l7 + 0x70]
	fcmps	%fcc3,	%f17,	%f29
	bshuffle	%f14,	%f8,	%f16
	edge32l	%i6,	%i1,	%i7
	ldd	[%l7 + 0x48],	%f22
	ldsb	[%l7 + 0x08],	%o3
	ldsw	[%l7 + 0x60],	%g4
	ld	[%l7 + 0x6C],	%f29
	fmovdne	%xcc,	%f14,	%f13
	lduh	[%l7 + 0x66],	%g3
	fpack32	%f28,	%f24,	%f28
	movcc	%xcc,	%o4,	%g1
	movvs	%icc,	%g6,	%l3
	pdist	%f2,	%f0,	%f0
	lduh	[%l7 + 0x32],	%l4
	fmovde	%xcc,	%f10,	%f16
	edge16n	%o0,	%o1,	%g5
	fcmpne16	%f30,	%f6,	%o7
	fmovsn	%xcc,	%f16,	%f29
	orncc	%o2,	0x13AD,	%g2
	save %l2, %l6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g7,	%i3
	fmovrdgez	%o6,	%f2,	%f0
	fornot2s	%f23,	%f6,	%f27
	fands	%f0,	%f9,	%f20
	edge8ln	%i5,	%l1,	%i2
	movg	%xcc,	%o5,	%i0
	fsrc2	%f12,	%f8
	udiv	%l5,	0x1CB7,	%i6
	andcc	%i1,	0x1D57,	%l0
	subccc	%o3,	%i7,	%g3
	popc	0x10C4,	%g4
	andn	%g1,	%o4,	%g6
	or	%l3,	0x11C2,	%o0
	fcmpeq16	%f0,	%f18,	%l4
	movrne	%o1,	%g5,	%o2
	fcmpeq32	%f18,	%f20,	%g2
	popc	%o7,	%l6
	fmovsleu	%xcc,	%f6,	%f24
	subccc	%i4,	0x1169,	%l2
	movrlz	%g7,	0x0B7,	%i3
	movn	%icc,	%o6,	%i5
	movvc	%xcc,	%i2,	%l1
	subccc	%i0,	%o5,	%l5
	fandnot2	%f10,	%f30,	%f28
	ld	[%l7 + 0x40],	%f16
	sth	%i1,	[%l7 + 0x50]
	udivx	%i6,	0x1BA7,	%l0
	ldx	[%l7 + 0x38],	%i7
	edge16n	%g3,	%o3,	%g4
	udivcc	%o4,	0x1D51,	%g6
	sdivx	%l3,	0x0F98,	%o0
	movgu	%icc,	%l4,	%g1
	sir	0x14D7
	sir	0x1ACF
	or	%o1,	0x15D6,	%g5
	sllx	%g2,	0x0B,	%o2
	movvs	%icc,	%o7,	%i4
	mulx	%l2,	%g7,	%i3
	movcc	%icc,	%o6,	%i5
	srlx	%i2,	%l6,	%l1
	edge8	%o5,	%i0,	%i1
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	array32	%g3,	%i7,	%g4
	fnors	%f0,	%f23,	%f11
	fmovda	%xcc,	%f25,	%f17
	sllx	%o3,	0x10,	%o4
	st	%f29,	[%l7 + 0x5C]
	srax	%l3,	%o0,	%l4
	edge32l	%g6,	%g1,	%g5
	movcs	%xcc,	%g2,	%o2
	movvc	%icc,	%o1,	%o7
	movne	%icc,	%i4,	%l2
	stb	%i3,	[%l7 + 0x3F]
	edge32ln	%o6,	%g7,	%i5
	subccc	%i2,	0x118E,	%l6
	umul	%l1,	%o5,	%i1
	sll	%i0,	%i6,	%l0
	fmovrdne	%g3,	%f16,	%f22
	movrlz	%l5,	0x09E,	%i7
	fmovsleu	%icc,	%f23,	%f28
	movg	%icc,	%g4,	%o4
	addcc	%l3,	0x0720,	%o0
	movrne	%l4,	%o3,	%g1
	fmovrsgez	%g6,	%f29,	%f1
	fmovsvc	%xcc,	%f15,	%f21
	fmovrsgz	%g2,	%f15,	%f4
	edge8n	%o2,	%o1,	%o7
	std	%f18,	[%l7 + 0x10]
	edge16n	%g5,	%l2,	%i4
	fnot1s	%f5,	%f7
	edge8	%o6,	%g7,	%i5
	fands	%f29,	%f29,	%f25
	ld	[%l7 + 0x3C],	%f6
	movle	%xcc,	%i2,	%l6
	fmovse	%xcc,	%f22,	%f29
	fmovdgu	%icc,	%f24,	%f16
	orcc	%i3,	%o5,	%i1
	edge32ln	%l1,	%i6,	%i0
	fxor	%f14,	%f20,	%f12
	fnegs	%f7,	%f27
	fand	%f10,	%f14,	%f10
	lduw	[%l7 + 0x34],	%l0
	movle	%icc,	%l5,	%g3
	add	%g4,	%o4,	%l3
	movge	%xcc,	%i7,	%l4
	fpadd32s	%f27,	%f19,	%f30
	fmovrdne	%o3,	%f12,	%f28
	fcmpne32	%f10,	%f4,	%o0
	fmovs	%f5,	%f17
	stx	%g1,	[%l7 + 0x40]
	sll	%g2,	%g6,	%o1
	fmovdcs	%xcc,	%f16,	%f31
	addccc	%o2,	0x118F,	%o7
	andcc	%g5,	%l2,	%i4
	mulscc	%g7,	%i5,	%o6
	edge32ln	%l6,	%i3,	%o5
	edge16	%i2,	%i1,	%l1
	sll	%i6,	%l0,	%i0
	movne	%icc,	%l5,	%g3
	mulx	%g4,	%o4,	%i7
	edge16n	%l3,	%l4,	%o3
	alignaddrl	%o0,	%g2,	%g1
	alignaddrl	%o1,	%o2,	%g6
	movleu	%xcc,	%g5,	%l2
	fmovrsgz	%o7,	%f26,	%f27
	fpadd32s	%f27,	%f3,	%f23
	smul	%g7,	0x1769,	%i5
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f16
	fpsub16	%f22,	%f10,	%f10
	xnor	%i4,	%o6,	%l6
	fmovrsgez	%o5,	%f31,	%f29
	restore %i3, 0x1C54, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f16,	%f1
	sllx	%l1,	%i2,	%l0
	smul	%i6,	%i0,	%g3
	sub	%l5,	0x14D5,	%g4
	save %i7, 0x1E9F, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l3,	%l4,	%o0
	fmovsle	%icc,	%f19,	%f22
	or	%g2,	%g1,	%o1
	udivcc	%o3,	0x0E46,	%g6
	ldsh	[%l7 + 0x64],	%g5
	array32	%l2,	%o2,	%g7
	fmul8x16	%f15,	%f22,	%f16
	fcmpd	%fcc3,	%f26,	%f10
	mova	%icc,	%o7,	%i5
	movle	%xcc,	%o6,	%l6
	fmovrdne	%o5,	%f28,	%f10
	fpack16	%f6,	%f4
	smul	%i3,	0x03A7,	%i1
	st	%f26,	[%l7 + 0x0C]
	ldub	[%l7 + 0x22],	%l1
	movge	%icc,	%i4,	%i2
	add	%l0,	0x14A7,	%i0
	stb	%g3,	[%l7 + 0x19]
	edge16n	%l5,	%i6,	%g4
	movvs	%xcc,	%o4,	%i7
	orncc	%l3,	0x1207,	%l4
	edge8ln	%g2,	%g1,	%o0
	orn	%o1,	0x1F9A,	%o3
	movle	%icc,	%g6,	%g5
	edge32	%o2,	%g7,	%l2
	edge16n	%i5,	%o6,	%l6
	addc	%o5,	0x1FA6,	%i3
	edge16n	%o7,	%i1,	%l1
	lduh	[%l7 + 0x3E],	%i4
	sth	%i2,	[%l7 + 0x7E]
	edge8l	%l0,	%g3,	%i0
	fnegs	%f10,	%f2
	pdist	%f16,	%f30,	%f20
	mova	%icc,	%i6,	%l5
	smul	%o4,	0x0BB5,	%i7
	edge8l	%g4,	%l4,	%l3
	ldsw	[%l7 + 0x34],	%g1
	edge32	%g2,	%o0,	%o1
	fmovdl	%xcc,	%f21,	%f24
	movrne	%g6,	%o3,	%g5
	sll	%g7,	0x02,	%l2
	fmovdle	%xcc,	%f23,	%f2
	fcmpne16	%f14,	%f24,	%i5
	sth	%o2,	[%l7 + 0x7C]
	srax	%o6,	%l6,	%o5
	nop
	set	0x2E, %i4
	sth	%o7,	[%l7 + %i4]
	umul	%i1,	%i3,	%l1
	smul	%i2,	%i4,	%g3
	srax	%i0,	0x05,	%l0
	movcc	%xcc,	%i6,	%l5
	subcc	%o4,	%i7,	%l4
	alignaddrl	%g4,	%l3,	%g1
	ldub	[%l7 + 0x36],	%o0
	fmovscc	%xcc,	%f21,	%f31
	fnot2	%f8,	%f16
	ldub	[%l7 + 0x60],	%g2
	umul	%o1,	%o3,	%g5
	edge32ln	%g6,	%l2,	%g7
	ldub	[%l7 + 0x38],	%o2
	movvs	%xcc,	%o6,	%i5
	fpsub16	%f0,	%f8,	%f26
	sethi	0x142D,	%l6
	and	%o7,	%o5,	%i1
	movrgez	%i3,	0x1A5,	%i2
	mulx	%l1,	0x12F0,	%i4
	edge8	%i0,	%g3,	%l0
	lduh	[%l7 + 0x18],	%i6
	edge16n	%o4,	%i7,	%l5
	sth	%g4,	[%l7 + 0x7A]
	sdivcc	%l3,	0x1349,	%l4
	movn	%icc,	%o0,	%g1
	movleu	%xcc,	%g2,	%o3
	fpack16	%f22,	%f28
	subccc	%o1,	0x02FA,	%g5
	fcmpne32	%f18,	%f10,	%l2
	ldx	[%l7 + 0x58],	%g7
	movg	%icc,	%o2,	%o6
	ldub	[%l7 + 0x7D],	%i5
	xnorcc	%g6,	0x1124,	%o7
	addccc	%o5,	%l6,	%i1
	movneg	%xcc,	%i2,	%i3
	edge16ln	%l1,	%i0,	%g3
	fmovrsne	%i4,	%f26,	%f20
	ldsw	[%l7 + 0x70],	%l0
	edge32	%i6,	%o4,	%i7
	fmovsge	%xcc,	%f16,	%f23
	movpos	%xcc,	%g4,	%l3
	edge16l	%l5,	%o0,	%l4
	fmovdcc	%xcc,	%f14,	%f27
	sll	%g2,	%o3,	%g1
	and	%o1,	0x0B4E,	%l2
	udivcc	%g5,	0x0C84,	%o2
	mulx	%g7,	0x039C,	%o6
	std	%f22,	[%l7 + 0x60]
	andncc	%i5,	%g6,	%o7
	sra	%l6,	0x1F,	%i1
	fmul8x16	%f20,	%f20,	%f16
	fnot1	%f28,	%f16
	fmul8sux16	%f8,	%f4,	%f24
	array8	%i2,	%i3,	%l1
	movge	%xcc,	%o5,	%g3
	subcc	%i4,	0x16E6,	%i0
	movleu	%xcc,	%l0,	%i6
	umulcc	%o4,	%i7,	%l3
	array32	%g4,	%o0,	%l4
	addc	%g2,	%o3,	%l5
	ldsb	[%l7 + 0x76],	%o1
	edge16l	%l2,	%g5,	%o2
	edge16l	%g1,	%g7,	%o6
	fnegd	%f2,	%f22
	ldsb	[%l7 + 0x4C],	%i5
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%o7
	ldsw	[%l7 + 0x2C],	%l6
	fmovrdne	%i1,	%f2,	%f2
	or	%i2,	%g6,	%i3
	sdivcc	%l1,	0x109A,	%g3
	umulcc	%i4,	0x16F7,	%o5
	movl	%icc,	%i0,	%i6
	edge16	%o4,	%l0,	%l3
	fmuld8ulx16	%f14,	%f12,	%f30
	stx	%i7,	[%l7 + 0x60]
	siam	0x5
	sllx	%o0,	%l4,	%g2
	edge32n	%o3,	%l5,	%g4
	ldd	[%l7 + 0x48],	%f4
	sth	%o1,	[%l7 + 0x64]
	fpsub16	%f20,	%f26,	%f12
	edge32ln	%g5,	%o2,	%g1
	edge16l	%l2,	%g7,	%o6
	umul	%o7,	%l6,	%i5
	movleu	%icc,	%i2,	%g6
	or	%i3,	0x14E0,	%l1
	lduw	[%l7 + 0x64],	%g3
	fands	%f16,	%f4,	%f3
	xor	%i4,	0x0DD6,	%i1
	movcs	%xcc,	%i0,	%i6
	fmovdvs	%xcc,	%f7,	%f3
	st	%f2,	[%l7 + 0x3C]
	ldub	[%l7 + 0x56],	%o4
	addcc	%l0,	0x0742,	%l3
	srlx	%i7,	0x18,	%o5
	sir	0x0A3B
	ldx	[%l7 + 0x50],	%l4
	smulcc	%g2,	%o3,	%l5
	sdiv	%o0,	0x059D,	%o1
	movcc	%icc,	%g4,	%o2
	st	%f22,	[%l7 + 0x40]
	udiv	%g5,	0x0289,	%g1
	faligndata	%f4,	%f30,	%f30
	fmovsneg	%xcc,	%f21,	%f11
	fmovrse	%g7,	%f8,	%f4
	alignaddr	%l2,	%o6,	%l6
	edge32n	%o7,	%i2,	%i5
	umul	%g6,	0x07D3,	%l1
	movneg	%xcc,	%i3,	%i4
	orncc	%g3,	0x1094,	%i0
	edge32n	%i1,	%i6,	%o4
	fpadd16s	%f26,	%f0,	%f17
	udivcc	%l3,	0x1446,	%l0
	lduh	[%l7 + 0x32],	%i7
	ldsw	[%l7 + 0x4C],	%o5
	and	%g2,	0x186F,	%o3
	fmovsn	%icc,	%f6,	%f23
	movrne	%l5,	%l4,	%o1
	edge16ln	%g4,	%o2,	%g5
	fornot1	%f24,	%f26,	%f6
	fcmpeq16	%f10,	%f14,	%g1
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	nop
	set	0x19, %o6
	ldsb	[%l7 + %o6],	%l6
	edge32	%o6,	%i2,	%i5
	fone	%f22
	ldub	[%l7 + 0x0D],	%g6
	fnot2s	%f29,	%f18
	addcc	%l1,	0x10A9,	%i3
	ld	[%l7 + 0x7C],	%f12
	fmovspos	%icc,	%f2,	%f5
	or	%o7,	%i4,	%i0
	fcmpes	%fcc3,	%f10,	%f30
	umulcc	%g3,	0x0F93,	%i1
	fmovrdgz	%i6,	%f4,	%f30
	movne	%icc,	%o4,	%l0
	edge32	%i7,	%l3,	%o5
	srax	%g2,	%l5,	%l4
	edge32	%o3,	%o1,	%o2
	ldub	[%l7 + 0x2B],	%g4
	fxor	%f22,	%f22,	%f0
	sdivcc	%g5,	0x0753,	%g1
	stb	%o0,	[%l7 + 0x62]
	movcs	%xcc,	%g7,	%l6
	fnand	%f18,	%f28,	%f4
	orncc	%l2,	%o6,	%i2
	fmovdn	%xcc,	%f8,	%f9
	sethi	0x1DB1,	%i5
	movrlez	%l1,	0x00D,	%i3
	movcs	%xcc,	%g6,	%i4
	fmovrdlz	%o7,	%f16,	%f16
	andn	%g3,	0x18FC,	%i0
	edge16ln	%i1,	%i6,	%l0
	movrlz	%i7,	%o4,	%o5
	fmovsge	%xcc,	%f28,	%f6
	array16	%g2,	%l5,	%l4
	movrlez	%o3,	0x36B,	%o1
	movrne	%l3,	%o2,	%g4
	edge8l	%g1,	%g5,	%g7
	fands	%f28,	%f15,	%f6
	fexpand	%f5,	%f30
	fcmpgt32	%f20,	%f22,	%l6
	popc	0x1847,	%l2
	sir	0x077A
	save %o0, %o6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l1,	%i2,	%g6
	sllx	%i3,	%i4,	%o7
	andn	%g3,	%i0,	%i6
	sethi	0x02E1,	%i1
	movre	%i7,	%l0,	%o4
	orn	%g2,	%o5,	%l4
	add	%l5,	0x1354,	%o1
	orn	%l3,	%o2,	%o3
	fmovscc	%xcc,	%f8,	%f3
	movleu	%xcc,	%g4,	%g5
	fmovde	%xcc,	%f27,	%f10
	sub	%g7,	0x0C78,	%l6
	movvs	%icc,	%l2,	%o0
	fsrc2s	%f28,	%f30
	xnor	%g1,	%i5,	%l1
	edge32n	%i2,	%o6,	%i3
	fandnot1s	%f13,	%f24,	%f31
	movcc	%icc,	%g6,	%o7
	fnor	%f12,	%f24,	%f0
	smulcc	%i4,	0x14FB,	%i0
	movn	%icc,	%g3,	%i1
	edge8	%i6,	%l0,	%i7
	fmovrse	%o4,	%f17,	%f20
	fmul8x16al	%f18,	%f3,	%f26
	edge32n	%g2,	%o5,	%l5
	xnorcc	%o1,	%l3,	%l4
	movrgz	%o2,	%g4,	%o3
	ldub	[%l7 + 0x1D],	%g5
	movl	%icc,	%l6,	%g7
	array32	%o0,	%g1,	%l2
	movre	%l1,	%i2,	%i5
	save %o6, 0x10D3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1B05,	%o7
	array32	%g6,	%i0,	%g3
	save %i1, %i4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f4,	[%l7 + 0x44]
	ldx	[%l7 + 0x58],	%i7
	fcmps	%fcc1,	%f20,	%f0
	umul	%l0,	%g2,	%o5
	orncc	%l5,	0x0878,	%o4
	ldx	[%l7 + 0x70],	%o1
	movvc	%xcc,	%l4,	%l3
	ldx	[%l7 + 0x78],	%o2
	edge32	%g4,	%o3,	%l6
	move	%icc,	%g7,	%o0
	movrgz	%g1,	%l2,	%l1
	smulcc	%i2,	0x1213,	%g5
	movrgez	%o6,	0x1FA,	%i5
	fcmpne32	%f10,	%f22,	%o7
	bshuffle	%f14,	%f26,	%f28
	stw	%i3,	[%l7 + 0x50]
	save %g6, 0x022A, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i1,	%g3,	%i6
	sethi	0x0224,	%i7
	st	%f1,	[%l7 + 0x78]
	movpos	%icc,	%i4,	%g2
	movcc	%icc,	%o5,	%l0
	ldd	[%l7 + 0x08],	%o4
	sll	%l5,	%o1,	%l4
	lduw	[%l7 + 0x3C],	%o2
	edge16l	%l3,	%o3,	%g4
	movneg	%icc,	%l6,	%o0
	fmovdl	%xcc,	%f31,	%f23
	addc	%g1,	%g7,	%l1
	movpos	%icc,	%i2,	%l2
	std	%f24,	[%l7 + 0x28]
	movg	%xcc,	%g5,	%o6
	movge	%xcc,	%o7,	%i5
	alignaddrl	%i3,	%g6,	%i1
	fmovdl	%icc,	%f1,	%f28
	fcmps	%fcc1,	%f17,	%f14
	ldsh	[%l7 + 0x6A],	%g3
	add	%i0,	0x1435,	%i7
	mova	%icc,	%i4,	%g2
	edge8ln	%i6,	%l0,	%o4
	fmovsvs	%xcc,	%f10,	%f6
	umulcc	%l5,	0x1909,	%o1
	movn	%icc,	%o5,	%o2
	movge	%icc,	%l4,	%l3
	movrgz	%g4,	0x17D,	%o3
	orncc	%o0,	0x0F1C,	%l6
	fmovrslz	%g1,	%f23,	%f8
	subcc	%g7,	0x1221,	%i2
	for	%f0,	%f16,	%f30
	movvc	%icc,	%l2,	%g5
	sdiv	%l1,	0x0BA0,	%o6
	subccc	%i5,	0x1E82,	%i3
	fmovdcc	%icc,	%f10,	%f13
	movl	%xcc,	%o7,	%g6
	movrgz	%g3,	0x25D,	%i1
	movrgez	%i7,	0x3D8,	%i0
	movrlz	%g2,	%i4,	%i6
	edge32n	%l0,	%l5,	%o4
	edge16l	%o1,	%o2,	%l4
	udivcc	%o5,	0x036A,	%g4
	lduw	[%l7 + 0x24],	%o3
	udivcc	%l3,	0x1B17,	%l6
	andcc	%g1,	%o0,	%i2
	ldub	[%l7 + 0x20],	%l2
	fmovdn	%xcc,	%f21,	%f26
	srlx	%g7,	0x06,	%l1
	fcmpgt16	%f24,	%f30,	%o6
	ldsb	[%l7 + 0x73],	%i5
	fone	%f2
	nop
	set	0x10, %l0
	std	%f18,	[%l7 + %l0]
	sethi	0x080E,	%i3
	umulcc	%g5,	%o7,	%g3
	fmovrdlez	%i1,	%f28,	%f24
	fmovrdne	%i7,	%f20,	%f20
	fone	%f10
	orncc	%i0,	0x0393,	%g6
	fandnot2	%f6,	%f6,	%f16
	movrne	%i4,	%g2,	%i6
	movre	%l5,	0x3A6,	%l0
	movgu	%xcc,	%o1,	%o2
	udivx	%o4,	0x0A45,	%l4
	fmovrdgez	%o5,	%f16,	%f26
	sllx	%o3,	%l3,	%g4
	subc	%g1,	%l6,	%o0
	sra	%l2,	%g7,	%i2
	movgu	%icc,	%l1,	%i5
	fmovdneg	%xcc,	%f6,	%f4
	xnorcc	%i3,	%g5,	%o6
	xorcc	%g3,	0x0DD3,	%o7
	fmovde	%icc,	%f17,	%f0
	udivcc	%i1,	0x168B,	%i0
	edge8l	%i7,	%g6,	%i4
	srl	%i6,	0x0B,	%g2
	fmovrde	%l5,	%f4,	%f12
	edge32n	%l0,	%o2,	%o4
	fmovsne	%icc,	%f0,	%f25
	xor	%l4,	%o1,	%o5
	fabsd	%f22,	%f24
	sdivcc	%o3,	0x037E,	%g4
	fpadd32	%f18,	%f2,	%f30
	srax	%l3,	0x08,	%l6
	xnorcc	%o0,	%l2,	%g1
	movleu	%icc,	%g7,	%i2
	movvc	%icc,	%l1,	%i5
	movle	%icc,	%g5,	%o6
	sllx	%g3,	0x0D,	%i3
	edge8n	%i1,	%o7,	%i7
	orncc	%g6,	%i4,	%i6
	edge8	%i0,	%g2,	%l0
	movrne	%l5,	%o4,	%l4
	ldd	[%l7 + 0x48],	%f22
	addccc	%o1,	0x1326,	%o2
	movneg	%xcc,	%o5,	%o3
	edge8ln	%l3,	%l6,	%o0
	sll	%g4,	%g1,	%g7
	movrlez	%i2,	%l2,	%l1
	xnor	%g5,	0x1DE6,	%o6
	movl	%xcc,	%i5,	%g3
	ldd	[%l7 + 0x68],	%f30
	fmovdneg	%icc,	%f21,	%f0
	udiv	%i3,	0x06E6,	%o7
	array32	%i7,	%i1,	%g6
	ldsh	[%l7 + 0x46],	%i4
	lduh	[%l7 + 0x64],	%i0
	sub	%g2,	0x18F2,	%l0
	lduw	[%l7 + 0x64],	%i6
	movcs	%xcc,	%l5,	%l4
	sub	%o1,	0x04B5,	%o4
	addccc	%o5,	%o3,	%l3
	lduh	[%l7 + 0x56],	%o2
	movle	%icc,	%o0,	%g4
	fmovrdgz	%l6,	%f24,	%f2
	st	%f28,	[%l7 + 0x2C]
	fmovdcs	%icc,	%f8,	%f1
	umul	%g1,	0x1DE9,	%g7
	mulscc	%l2,	%i2,	%g5
	or	%o6,	0x0BCB,	%i5
	and	%g3,	%i3,	%o7
	udiv	%i7,	0x022F,	%l1
	fmovsl	%xcc,	%f12,	%f12
	srax	%g6,	0x0C,	%i1
	alignaddr	%i0,	%i4,	%g2
	andncc	%i6,	%l0,	%l4
	udiv	%o1,	0x11B4,	%o4
	alignaddrl	%o5,	%o3,	%l3
	save %o2, 0x0562, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x10],	%o0
	pdist	%f22,	%f14,	%f14
	srax	%l6,	%g4,	%g1
	edge16ln	%g7,	%l2,	%i2
	fnand	%f24,	%f6,	%f0
	smul	%o6,	0x16D3,	%i5
	stx	%g3,	[%l7 + 0x38]
	sdiv	%g5,	0x14DF,	%i3
	movgu	%icc,	%o7,	%i7
	edge32	%l1,	%i1,	%g6
	fxor	%f18,	%f16,	%f10
	edge32l	%i0,	%i4,	%i6
	stb	%g2,	[%l7 + 0x36]
	fmovrde	%l4,	%f16,	%f22
	alignaddr	%l0,	%o4,	%o1
	mulscc	%o5,	%o3,	%o2
	sdiv	%l5,	0x1AF2,	%o0
	mulx	%l3,	%l6,	%g4
	smulcc	%g7,	0x0EBA,	%g1
	umulcc	%l2,	%i2,	%i5
	sdivx	%o6,	0x0DE1,	%g5
	edge16l	%i3,	%g3,	%o7
	andn	%i7,	%i1,	%g6
	edge32ln	%l1,	%i0,	%i4
	edge8n	%i6,	%g2,	%l0
	andn	%o4,	%o1,	%l4
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%o3
	restore %o2, 0x1D1D, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o5,	%l3,	%o0
	edge16n	%g4,	%g7,	%g1
	fors	%f30,	%f25,	%f28
	alignaddr	%l2,	%l6,	%i5
	stb	%o6,	[%l7 + 0x5D]
	movcc	%xcc,	%i2,	%g5
	or	%g3,	0x0A4F,	%o7
	add	%i3,	0x04C1,	%i7
	xorcc	%i1,	%l1,	%g6
	movcs	%xcc,	%i4,	%i0
	smulcc	%i6,	0x0FE9,	%l0
	subcc	%g2,	%o1,	%l4
	fone	%f30
	edge32	%o4,	%o3,	%o2
	orncc	%o5,	%l3,	%o0
	sethi	0x1C1B,	%l5
	add	%g4,	0x0EF3,	%g7
	sll	%g1,	0x09,	%l2
	lduw	[%l7 + 0x44],	%i5
	subccc	%l6,	0x1C9A,	%i2
	ldd	[%l7 + 0x08],	%o6
	add	%g5,	0x13FA,	%g3
	movvc	%icc,	%i3,	%o7
	movneg	%xcc,	%i7,	%l1
	subc	%g6,	%i1,	%i4
	udivcc	%i0,	0x0BFE,	%i6
	movrgz	%l0,	0x2C8,	%g2
	lduh	[%l7 + 0x40],	%l4
	smulcc	%o4,	0x0A78,	%o1
	andncc	%o2,	%o5,	%l3
	fcmple16	%f14,	%f0,	%o3
	smulcc	%l5,	%o0,	%g4
	std	%f10,	[%l7 + 0x48]
	fandnot1s	%f25,	%f3,	%f20
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	array32	%i5,	%l6,	%i2
	movrlez	%g5,	%g3,	%o6
	edge8l	%i3,	%o7,	%l1
	alignaddrl	%i7,	%i1,	%g6
	ldx	[%l7 + 0x78],	%i0
	ldsh	[%l7 + 0x5C],	%i6
	movrlz	%l0,	%i4,	%l4
	ldd	[%l7 + 0x68],	%g2
	fandnot2s	%f3,	%f21,	%f30
	movvs	%xcc,	%o4,	%o2
	fmovdn	%xcc,	%f21,	%f20
	xor	%o1,	0x16C5,	%o5
	st	%f16,	[%l7 + 0x5C]
	fexpand	%f9,	%f2
	orncc	%o3,	%l5,	%o0
	fmovrdlz	%l3,	%f28,	%f10
	fmul8ulx16	%f4,	%f10,	%f30
	fmul8ulx16	%f8,	%f14,	%f14
	subccc	%g1,	0x013B,	%g7
	ldsw	[%l7 + 0x6C],	%l2
	mulx	%i5,	%g4,	%i2
	fmovdcc	%icc,	%f13,	%f29
	ldd	[%l7 + 0x08],	%f12
	fnot1s	%f9,	%f19
	ldsw	[%l7 + 0x3C],	%l6
	movrgez	%g5,	0x1ED,	%g3
	fnegd	%f8,	%f28
	movg	%xcc,	%o6,	%i3
	fmovs	%f23,	%f5
	lduh	[%l7 + 0x34],	%l1
	fsrc1	%f8,	%f28
	fmul8sux16	%f12,	%f6,	%f30
	mulx	%i7,	0x0DEB,	%i1
	udivx	%g6,	0x1412,	%i0
	stx	%i6,	[%l7 + 0x38]
	umul	%o7,	%i4,	%l0
	movcc	%icc,	%l4,	%g2
	movrgz	%o2,	0x0D8,	%o4
	edge16	%o5,	%o1,	%o3
	smul	%o0,	%l5,	%g1
	alignaddr	%l3,	%l2,	%g7
	fornot2	%f28,	%f18,	%f30
	subcc	%g4,	0x0AE0,	%i2
	movn	%xcc,	%i5,	%l6
	movl	%icc,	%g5,	%g3
	fmovrdlez	%i3,	%f10,	%f8
	fabss	%f24,	%f14
	movrgez	%l1,	%o6,	%i1
	edge16ln	%g6,	%i0,	%i6
	mova	%icc,	%i7,	%o7
	movgu	%xcc,	%l0,	%i4
	srlx	%l4,	%g2,	%o4
	sll	%o5,	%o1,	%o3
	fnot1s	%f1,	%f8
	addcc	%o0,	%l5,	%o2
	restore %l3, 0x1973, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g1,	0x16A6,	%g4
	fmovscc	%xcc,	%f15,	%f20
	fmul8sux16	%f24,	%f16,	%f12
	ldsw	[%l7 + 0x74],	%i2
	fnot1s	%f1,	%f26
	array16	%i5,	%l6,	%g5
	ldx	[%l7 + 0x40],	%g7
	subccc	%g3,	%i3,	%o6
	sub	%l1,	0x05D3,	%i1
	std	%f28,	[%l7 + 0x38]
	edge8n	%i0,	%g6,	%i6
	edge32	%i7,	%l0,	%o7
	srl	%i4,	%g2,	%o4
	movn	%xcc,	%l4,	%o5
	siam	0x4
	movgu	%xcc,	%o1,	%o0
	ldx	[%l7 + 0x48],	%l5
	edge8n	%o3,	%l3,	%o2
	fors	%f25,	%f1,	%f27
	xor	%g1,	%l2,	%g4
	movleu	%xcc,	%i2,	%l6
	fexpand	%f4,	%f28
	popc	%g5,	%i5
	ldsb	[%l7 + 0x39],	%g7
	fmovsn	%xcc,	%f8,	%f22
	smulcc	%g3,	%o6,	%l1
	andncc	%i3,	%i0,	%g6
	alignaddr	%i6,	%i1,	%i7
	sdiv	%o7,	0x0349,	%l0
	fsrc2	%f0,	%f18
	movn	%xcc,	%g2,	%i4
	movle	%xcc,	%l4,	%o5
	movl	%xcc,	%o1,	%o0
	fmul8sux16	%f0,	%f24,	%f14
	subccc	%l5,	0x1065,	%o4
	ldsb	[%l7 + 0x5F],	%o3
	fnegd	%f0,	%f26
	fmovda	%icc,	%f8,	%f12
	sra	%l3,	%o2,	%g1
	fandnot1s	%f1,	%f15,	%f3
	sll	%l2,	%g4,	%i2
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	smul	%g3,	0x1ECA,	%o6
	fpsub32s	%f19,	%f18,	%f3
	and	%i5,	%i3,	%i0
	addc	%l1,	%i6,	%i1
	movrlez	%g6,	%i7,	%l0
	fornot1s	%f18,	%f26,	%f16
	movvs	%icc,	%o7,	%i4
	movrne	%l4,	0x389,	%o5
	movrgez	%o1,	%o0,	%l5
	stx	%o4,	[%l7 + 0x20]
	udivx	%g2,	0x1A05,	%o3
	st	%f20,	[%l7 + 0x64]
	array16	%o2,	%g1,	%l2
	fmovsn	%icc,	%f22,	%f30
	fmovdvc	%icc,	%f15,	%f25
	ldsh	[%l7 + 0x16],	%l3
	fmovrde	%i2,	%f6,	%f12
	udivx	%g5,	0x054B,	%g4
	ldsw	[%l7 + 0x1C],	%g7
	sdiv	%l6,	0x0BFC,	%g3
	fmovsle	%icc,	%f11,	%f8
	fpadd32	%f12,	%f18,	%f6
	srl	%o6,	%i3,	%i0
	edge16l	%i5,	%i6,	%l1
	move	%icc,	%g6,	%i7
	movrlz	%l0,	0x0C7,	%i1
	array32	%o7,	%i4,	%l4
	xor	%o1,	0x0691,	%o0
	srl	%l5,	%o4,	%g2
	edge32ln	%o3,	%o5,	%g1
	edge8n	%o2,	%l2,	%i2
	sll	%g5,	0x13,	%l3
	smul	%g7,	%l6,	%g3
	subccc	%o6,	0x07F1,	%i3
	fcmple32	%f16,	%f24,	%g4
	xor	%i5,	0x097D,	%i0
	edge8	%l1,	%g6,	%i6
	edge8	%l0,	%i1,	%i7
	array16	%o7,	%l4,	%o1
	movne	%xcc,	%i4,	%l5
	movre	%o0,	%g2,	%o3
	ldd	[%l7 + 0x38],	%f0
	restore %o4, %g1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o5,	%i2,	%l2
	movl	%xcc,	%g5,	%l3
	subccc	%l6,	0x1D41,	%g3
	udivcc	%o6,	0x0E36,	%g7
	save %i3, %i5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l1,	%g6,	%g4
	stw	%l0,	[%l7 + 0x50]
	fmovrslz	%i1,	%f8,	%f3
	edge32	%i7,	%o7,	%l4
	movcc	%xcc,	%o1,	%i6
	mulx	%l5,	%o0,	%i4
	edge16l	%g2,	%o4,	%o3
	fnegs	%f6,	%f23
	movrgez	%g1,	%o2,	%o5
	fmovse	%xcc,	%f24,	%f14
	subcc	%i2,	0x0A4E,	%g5
	edge32l	%l3,	%l2,	%g3
	sethi	0x1670,	%l6
	sll	%o6,	%i3,	%g7
	edge16l	%i0,	%l1,	%i5
	movvs	%icc,	%g6,	%g4
	fzero	%f12
	movrne	%i1,	0x1D6,	%i7
	ldsb	[%l7 + 0x26],	%l0
	sdivcc	%l4,	0x0245,	%o1
	fcmpes	%fcc1,	%f23,	%f22
	addccc	%o7,	%i6,	%o0
	fornot2	%f8,	%f2,	%f2
	fmovscs	%icc,	%f26,	%f20
	udivcc	%i4,	0x11C1,	%g2
	addc	%o4,	0x0F2A,	%o3
	fmuld8ulx16	%f14,	%f10,	%f28
	fmovsvc	%xcc,	%f0,	%f28
	fpack16	%f14,	%f16
	fornot2s	%f9,	%f5,	%f26
	udiv	%l5,	0x01A4,	%g1
	xnorcc	%o5,	%o2,	%g5
	movvc	%xcc,	%i2,	%l2
	movneg	%xcc,	%g3,	%l6
	addcc	%o6,	0x15C8,	%i3
	movgu	%icc,	%l3,	%i0
	move	%icc,	%g7,	%i5
	movg	%icc,	%l1,	%g6
	sra	%i1,	%g4,	%i7
	popc	0x047F,	%l4
	sdivx	%l0,	0x1A0E,	%o1
	ldsb	[%l7 + 0x3D],	%o7
	xnorcc	%o0,	%i4,	%g2
	add	%i6,	%o3,	%l5
	udivx	%o4,	0x0DB1,	%g1
	subcc	%o2,	0x0CF2,	%g5
	andcc	%o5,	%i2,	%g3
	movre	%l2,	%l6,	%o6
	move	%xcc,	%l3,	%i0
	movrlz	%g7,	0x137,	%i3
	fcmpeq16	%f24,	%f4,	%l1
	sdiv	%g6,	0x1979,	%i5
	lduh	[%l7 + 0x0E],	%g4
	movneg	%icc,	%i7,	%i1
	andcc	%l0,	0x1FC6,	%o1
	sllx	%o7,	%o0,	%l4
	fmovdneg	%icc,	%f20,	%f28
	movg	%xcc,	%g2,	%i6
	alignaddr	%i4,	%l5,	%o4
	popc	0x1B60,	%o3
	fpsub32	%f6,	%f4,	%f8
	fpsub16	%f30,	%f14,	%f12
	fmovdg	%xcc,	%f31,	%f23
	orcc	%g1,	0x103A,	%o2
	fcmpeq32	%f8,	%f26,	%o5
	and	%g5,	%i2,	%g3
	movvs	%xcc,	%l2,	%l6
	umulcc	%o6,	0x1978,	%i0
	mulx	%l3,	%g7,	%i3
	mulscc	%l1,	0x1D43,	%i5
	movcs	%icc,	%g4,	%i7
	or	%g6,	0x03E5,	%i1
	array32	%l0,	%o7,	%o0
	movrlz	%o1,	%g2,	%i6
	addccc	%i4,	%l5,	%l4
	ldd	[%l7 + 0x78],	%f24
	addcc	%o3,	0x1398,	%g1
	addcc	%o2,	%o5,	%o4
	andn	%g5,	0x1978,	%g3
	ld	[%l7 + 0x68],	%f2
	addc	%i2,	0x0C00,	%l2
	xorcc	%l6,	0x1AFD,	%o6
	movvs	%xcc,	%i0,	%l3
	fxor	%f4,	%f18,	%f2
	movle	%icc,	%i3,	%l1
	save %g7, %i5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f18,	%f20,	%i7
	movvc	%xcc,	%i1,	%l0
	orn	%g6,	%o0,	%o7
	popc	0x1133,	%o1
	edge8	%g2,	%i4,	%l5
	popc	0x0969,	%i6
	fmovdcs	%icc,	%f24,	%f7
	edge8n	%o3,	%g1,	%o2
	addcc	%l4,	%o5,	%g5
	stb	%g3,	[%l7 + 0x41]
	st	%f29,	[%l7 + 0x10]
	movrne	%i2,	%o4,	%l6
	addcc	%l2,	%o6,	%i0
	fcmpes	%fcc1,	%f20,	%f18
	mulscc	%l3,	%i3,	%g7
	andcc	%l1,	%g4,	%i7
	edge16l	%i1,	%l0,	%i5
	alignaddr	%g6,	%o0,	%o7
	andcc	%o1,	%i4,	%l5
	andn	%i6,	%o3,	%g1
	fmovdneg	%xcc,	%f2,	%f4
	sdivx	%o2,	0x16DB,	%g2
	movneg	%icc,	%l4,	%o5
	popc	0x183E,	%g3
	sll	%g5,	0x04,	%i2
	sdivcc	%o4,	0x09CA,	%l6
	sth	%o6,	[%l7 + 0x70]
	sethi	0x04C6,	%i0
	subc	%l3,	0x1ABE,	%i3
	fmovdcc	%xcc,	%f15,	%f25
	orncc	%l2,	0x07D9,	%g7
	save %g4, 0x1DA8, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i1,	0x04A,	%i7
	movrgez	%l0,	%g6,	%o0
	orncc	%i5,	0x196F,	%o7
	and	%o1,	0x0C51,	%l5
	umul	%i6,	0x0759,	%i4
	movrgz	%o3,	%o2,	%g1
	movne	%xcc,	%g2,	%o5
	fmovdleu	%icc,	%f22,	%f8
	fmul8ulx16	%f10,	%f6,	%f0
	nop
	set	0x0A, %g2
	ldsh	[%l7 + %g2],	%l4
	edge32	%g5,	%g3,	%o4
	array32	%i2,	%o6,	%i0
	ldub	[%l7 + 0x6D],	%l6
	fcmple16	%f10,	%f12,	%l3
	movne	%xcc,	%i3,	%g7
	pdist	%f26,	%f0,	%f4
	orn	%l2,	0x02AB,	%l1
	xnor	%i1,	%i7,	%l0
	smulcc	%g6,	0x1191,	%o0
	srlx	%i5,	0x1A,	%o7
	fmovdl	%icc,	%f4,	%f8
	fandnot2	%f22,	%f12,	%f28
	fmul8x16	%f8,	%f8,	%f28
	movvc	%icc,	%o1,	%g4
	mulscc	%i6,	0x113B,	%l5
	edge8	%o3,	%o2,	%g1
	subc	%g2,	%o5,	%i4
	ldx	[%l7 + 0x68],	%l4
	smul	%g3,	0x136A,	%o4
	fnegd	%f6,	%f4
	edge16l	%g5,	%o6,	%i0
	fmovrsne	%l6,	%f29,	%f15
	fmovsn	%icc,	%f15,	%f5
	edge16	%i2,	%i3,	%g7
	srax	%l2,	%l1,	%i1
	movrlz	%i7,	%l3,	%g6
	sdiv	%l0,	0x1E2A,	%o0
	movcs	%icc,	%i5,	%o7
	fcmps	%fcc3,	%f15,	%f12
	orn	%g4,	%i6,	%o1
	edge32n	%l5,	%o3,	%o2
	sir	0x145F
	fors	%f23,	%f1,	%f0
	srax	%g1,	%o5,	%g2
	fzeros	%f19
	fmovrdgez	%l4,	%f22,	%f28
	nop
	set	0x74, %o3
	lduw	[%l7 + %o3],	%g3
	fxors	%f30,	%f22,	%f12
	alignaddr	%o4,	%g5,	%o6
	fmovsvc	%icc,	%f19,	%f15
	sethi	0x0B68,	%i0
	array16	%l6,	%i4,	%i3
	subc	%g7,	%i2,	%l1
	movvc	%icc,	%l2,	%i7
	fcmpeq16	%f12,	%f28,	%l3
	and	%g6,	%i1,	%o0
	ldd	[%l7 + 0x38],	%l0
	edge32	%i5,	%g4,	%o7
	xor	%i6,	0x193E,	%l5
	fmovsa	%icc,	%f7,	%f24
	movn	%icc,	%o1,	%o3
	ldsb	[%l7 + 0x2F],	%g1
	alignaddrl	%o2,	%o5,	%l4
	fabsd	%f6,	%f4
	fnot2	%f6,	%f14
	sdivx	%g3,	0x05F5,	%o4
	stx	%g2,	[%l7 + 0x10]
	stx	%g5,	[%l7 + 0x68]
	movcc	%icc,	%i0,	%l6
	edge8	%o6,	%i4,	%i3
	movn	%icc,	%g7,	%l1
	add	%l2,	0x0773,	%i2
	lduh	[%l7 + 0x68],	%i7
	movcs	%icc,	%g6,	%l3
	addc	%i1,	%l0,	%i5
	fcmpeq32	%f24,	%f2,	%o0
	sdiv	%o7,	0x0501,	%g4
	smul	%l5,	%i6,	%o1
	ldub	[%l7 + 0x62],	%o3
	sllx	%g1,	%o5,	%l4
	fcmpne32	%f18,	%f16,	%o2
	movrgz	%g3,	0x1B8,	%o4
	lduh	[%l7 + 0x1A],	%g5
	sth	%i0,	[%l7 + 0x46]
	add	%l6,	0x1B5C,	%g2
	movleu	%icc,	%o6,	%i3
	edge8ln	%i4,	%g7,	%l1
	movl	%icc,	%i2,	%i7
	edge16n	%l2,	%g6,	%l3
	nop
	set	0x0A, %i0
	sth	%l0,	[%l7 + %i0]
	fmovsne	%xcc,	%f29,	%f19
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	sllx	%g4,	%l5,	%i6
	edge16	%o1,	%o3,	%i1
	fmovrslez	%o5,	%f5,	%f16
	movrne	%g1,	%l4,	%g3
	fpsub16s	%f9,	%f3,	%f21
	fmovrdlez	%o4,	%f0,	%f22
	array16	%o2,	%g5,	%l6
	fmovrsgz	%g2,	%f17,	%f10
	fmovde	%icc,	%f9,	%f6
	fcmpes	%fcc1,	%f30,	%f12
	fmovdcc	%icc,	%f28,	%f0
	movpos	%xcc,	%o6,	%i0
	movl	%icc,	%i4,	%g7
	st	%f2,	[%l7 + 0x14]
	edge16	%l1,	%i3,	%i2
	umulcc	%i7,	0x012B,	%l2
	fcmple32	%f14,	%f20,	%g6
	movre	%l0,	%i5,	%l3
	for	%f8,	%f30,	%f0
	pdist	%f2,	%f12,	%f30
	movpos	%icc,	%o7,	%g4
	move	%xcc,	%l5,	%i6
	subccc	%o0,	%o3,	%i1
	array32	%o5,	%o1,	%g1
	sra	%l4,	0x1D,	%o4
	ldsw	[%l7 + 0x0C],	%g3
	nop
	set	0x34, %o0
	sth	%o2,	[%l7 + %o0]
	addc	%g5,	0x156A,	%g2
	fmovdneg	%xcc,	%f24,	%f6
	pdist	%f10,	%f24,	%f8
	fmovsg	%xcc,	%f31,	%f25
	movvs	%xcc,	%o6,	%i0
	srax	%l6,	%i4,	%g7
	fnor	%f2,	%f20,	%f16
	fmovdg	%xcc,	%f13,	%f24
	edge16n	%i3,	%l1,	%i7
	std	%f30,	[%l7 + 0x58]
	orncc	%i2,	0x1527,	%g6
	edge8ln	%l2,	%i5,	%l0
	sethi	0x0216,	%l3
	movn	%xcc,	%g4,	%l5
	addc	%o7,	%i6,	%o0
	movgu	%icc,	%o3,	%i1
	sra	%o5,	%o1,	%l4
	alignaddrl	%g1,	%o4,	%o2
	stw	%g5,	[%l7 + 0x38]
	sll	%g2,	%g3,	%o6
	faligndata	%f10,	%f8,	%f22
	movl	%xcc,	%l6,	%i0
	edge8ln	%i4,	%i3,	%l1
	addcc	%g7,	%i2,	%i7
	fmovdl	%icc,	%f11,	%f10
	fmovsgu	%icc,	%f25,	%f29
	lduh	[%l7 + 0x2E],	%l2
	fand	%f28,	%f8,	%f20
	fmovrsne	%i5,	%f28,	%f1
	fandnot1	%f10,	%f4,	%f6
	fxnor	%f4,	%f24,	%f16
	udivcc	%l0,	0x0939,	%g6
	edge16n	%g4,	%l5,	%o7
	and	%i6,	0x1378,	%l3
	and	%o0,	%i1,	%o3
	edge16	%o1,	%o5,	%l4
	movrlez	%g1,	%o2,	%g5
	orcc	%g2,	%o4,	%g3
	fmovrslez	%o6,	%f21,	%f28
	addc	%i0,	%i4,	%i3
	fxnor	%f0,	%f30,	%f2
	sub	%l1,	0x00EC,	%g7
	movcs	%icc,	%l6,	%i2
	srax	%l2,	0x0E,	%i7
	movrgez	%l0,	0x1ED,	%g6
	movre	%g4,	%i5,	%l5
	movrlez	%o7,	0x23D,	%l3
	movrne	%i6,	%o0,	%o3
	sub	%o1,	0x14CA,	%o5
	edge32ln	%l4,	%g1,	%i1
	smulcc	%o2,	%g2,	%o4
	fmovdl	%xcc,	%f17,	%f9
	ldub	[%l7 + 0x7C],	%g3
	movvc	%icc,	%o6,	%g5
	alignaddr	%i0,	%i3,	%l1
	fmovscs	%icc,	%f21,	%f11
	fmovsge	%icc,	%f29,	%f19
	orncc	%i4,	%g7,	%l6
	sdivcc	%l2,	0x1A35,	%i2
	mulscc	%l0,	0x0F44,	%i7
	stx	%g6,	[%l7 + 0x18]
	andn	%g4,	0x1C1D,	%l5
	sir	0x0A9B
	movleu	%icc,	%i5,	%l3
	movg	%xcc,	%o7,	%i6
	movrgez	%o3,	%o0,	%o5
	andcc	%l4,	0x1F4A,	%o1
	alignaddr	%g1,	%i1,	%o2
	ldd	[%l7 + 0x10],	%f0
	smulcc	%g2,	0x12C3,	%o4
	addcc	%o6,	%g5,	%g3
	edge32l	%i3,	%i0,	%l1
	lduw	[%l7 + 0x20],	%g7
	sllx	%l6,	%l2,	%i2
	fcmpgt16	%f4,	%f26,	%i4
	andcc	%l0,	0x0B76,	%i7
	mulscc	%g4,	0x1222,	%g6
	udivcc	%l5,	0x1762,	%i5
	add	%l3,	%i6,	%o3
	movneg	%xcc,	%o0,	%o5
	fmovsne	%icc,	%f2,	%f1
	mova	%xcc,	%o7,	%o1
	and	%l4,	0x159E,	%g1
	movge	%icc,	%i1,	%o2
	movre	%g2,	%o4,	%o6
	xorcc	%g3,	0x1693,	%g5
	and	%i0,	%l1,	%i3
	xor	%g7,	0x102C,	%l2
	sllx	%i2,	%l6,	%l0
	umul	%i4,	0x1AB3,	%g4
	movrlez	%g6,	0x1F2,	%i7
	nop
	set	0x10, %o4
	stw	%i5,	[%l7 + %o4]
	addcc	%l3,	%i6,	%l5
	movvs	%xcc,	%o3,	%o0
	andcc	%o7,	0x089A,	%o5
	st	%f0,	[%l7 + 0x68]
	movrlz	%o1,	0x0E6,	%g1
	sllx	%l4,	%o2,	%i1
	addcc	%g2,	%o4,	%o6
	ldd	[%l7 + 0x50],	%g2
	array32	%i0,	%g5,	%i3
	fmovrsgez	%g7,	%f28,	%f30
	subc	%l1,	0x15A0,	%l2
	movpos	%icc,	%i2,	%l0
	edge32ln	%i4,	%g4,	%g6
	ldub	[%l7 + 0x63],	%l6
	movn	%icc,	%i7,	%i5
	fmovdleu	%xcc,	%f26,	%f1
	orcc	%i6,	0x0318,	%l3
	mulx	%o3,	%l5,	%o7
	move	%xcc,	%o5,	%o1
	edge32ln	%g1,	%o0,	%l4
	movge	%icc,	%o2,	%g2
	movrlz	%i1,	%o6,	%g3
	edge32n	%i0,	%o4,	%g5
	xor	%g7,	%l1,	%l2
	lduw	[%l7 + 0x48],	%i2
	move	%icc,	%i3,	%l0
	move	%xcc,	%g4,	%g6
	fpadd32s	%f31,	%f29,	%f0
	xnor	%i4,	%i7,	%l6
	xorcc	%i6,	%i5,	%o3
	fmovdg	%xcc,	%f31,	%f16
	save %l3, %l5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o5,	%o1,	%g1
	ldub	[%l7 + 0x4E],	%o0
	fmovrdgez	%l4,	%f12,	%f24
	edge32	%o2,	%i1,	%o6
	stb	%g3,	[%l7 + 0x6A]
	sth	%g2,	[%l7 + 0x3C]
	lduh	[%l7 + 0x54],	%o4
	edge16	%g5,	%g7,	%i0
	fcmped	%fcc1,	%f30,	%f20
	fcmps	%fcc0,	%f19,	%f13
	movle	%xcc,	%l2,	%l1
	fmul8x16al	%f6,	%f20,	%f26
	mulx	%i3,	0x0798,	%l0
	movne	%xcc,	%g4,	%g6
	fmovsvs	%icc,	%f0,	%f20
	fmovdl	%icc,	%f13,	%f29
	edge32ln	%i2,	%i4,	%l6
	ldsw	[%l7 + 0x44],	%i6
	ldub	[%l7 + 0x38],	%i7
	fcmpes	%fcc2,	%f27,	%f0
	sth	%i5,	[%l7 + 0x2A]
	and	%l3,	0x06AE,	%l5
	and	%o7,	0x040C,	%o5
	fmul8x16au	%f5,	%f9,	%f8
	sra	%o3,	0x09,	%g1
	edge8n	%o1,	%l4,	%o2
	movn	%icc,	%o0,	%i1
	edge16n	%g3,	%g2,	%o6
	addc	%o4,	%g5,	%g7
	edge16n	%l2,	%l1,	%i0
	ld	[%l7 + 0x3C],	%f23
	smul	%i3,	0x0EBF,	%g4
	edge8l	%g6,	%i2,	%i4
	edge8	%l0,	%l6,	%i6
	fpadd32	%f18,	%f10,	%f0
	edge8	%i7,	%i5,	%l3
	fmovs	%f4,	%f11
	sth	%l5,	[%l7 + 0x5A]
	fcmpne16	%f0,	%f6,	%o7
	edge32	%o5,	%g1,	%o1
	fmovdne	%icc,	%f8,	%f15
	movn	%xcc,	%o3,	%o2
	edge8n	%l4,	%i1,	%g3
	alignaddr	%g2,	%o0,	%o6
	alignaddrl	%o4,	%g7,	%l2
	ldub	[%l7 + 0x42],	%l1
	umulcc	%i0,	0x0CC1,	%i3
	smulcc	%g4,	0x156A,	%g6
	sdivcc	%i2,	0x1B7B,	%g5
	sllx	%l0,	0x1E,	%l6
	popc	%i6,	%i4
	movg	%xcc,	%i7,	%i5
	srax	%l3,	%o7,	%l5
	and	%g1,	0x164B,	%o1
	fmovsgu	%icc,	%f5,	%f8
	ldd	[%l7 + 0x68],	%o4
	movl	%icc,	%o3,	%l4
	movpos	%xcc,	%i1,	%o2
	array32	%g3,	%o0,	%g2
	movvc	%icc,	%o6,	%o4
	move	%xcc,	%g7,	%l1
	movcs	%icc,	%i0,	%i3
	stx	%g4,	[%l7 + 0x68]
	addccc	%g6,	%l2,	%g5
	movvc	%xcc,	%l0,	%l6
	sll	%i6,	0x0D,	%i2
	lduw	[%l7 + 0x18],	%i4
	andcc	%i5,	%l3,	%i7
	ldsb	[%l7 + 0x2E],	%l5
	fnot1s	%f24,	%f25
	lduh	[%l7 + 0x6A],	%g1
	lduw	[%l7 + 0x18],	%o1
	sub	%o5,	%o7,	%l4
	nop
	set	0x28, %i7
	stx	%i1,	[%l7 + %i7]
	edge8n	%o2,	%g3,	%o0
	edge16ln	%o3,	%o6,	%g2
	edge8l	%g7,	%o4,	%i0
	fand	%f20,	%f20,	%f0
	ldsb	[%l7 + 0x28],	%i3
	fxnors	%f17,	%f16,	%f23
	movvs	%icc,	%g4,	%l1
	array16	%l2,	%g5,	%g6
	fmovsn	%xcc,	%f5,	%f26
	movneg	%xcc,	%l6,	%l0
	lduh	[%l7 + 0x52],	%i2
	xor	%i4,	0x1761,	%i5
	edge8ln	%i6,	%l3,	%l5
	and	%g1,	%o1,	%o5
	movle	%icc,	%o7,	%l4
	sethi	0x1C84,	%i1
	srlx	%i7,	%o2,	%o0
	smul	%o3,	0x0ED6,	%o6
	fcmple16	%f8,	%f24,	%g2
	fandnot1	%f16,	%f22,	%f10
	ldub	[%l7 + 0x56],	%g7
	fmovscc	%xcc,	%f7,	%f27
	movcc	%icc,	%g3,	%o4
	fmovdcs	%xcc,	%f10,	%f24
	move	%icc,	%i3,	%i0
	movpos	%xcc,	%g4,	%l1
	alignaddr	%g5,	%l2,	%l6
	fmul8x16al	%f27,	%f12,	%f26
	stx	%g6,	[%l7 + 0x70]
	fmovsa	%xcc,	%f24,	%f4
	orn	%l0,	0x1011,	%i2
	fmovs	%f17,	%f2
	move	%icc,	%i4,	%i6
	fmovsl	%icc,	%f8,	%f7
	addccc	%l3,	0x05E3,	%i5
	fmovdle	%icc,	%f23,	%f20
	movge	%xcc,	%g1,	%o1
	ldub	[%l7 + 0x5A],	%l5
	edge32l	%o7,	%l4,	%i1
	nop
	set	0x50, %g3
	ldsh	[%l7 + %g3],	%o5
	fpack16	%f18,	%f4
	fcmpeq32	%f30,	%f10,	%i7
	sll	%o2,	0x0F,	%o3
	orcc	%o6,	0x02E3,	%g2
	xor	%g7,	%g3,	%o0
	ldub	[%l7 + 0x23],	%i3
	srl	%o4,	%i0,	%g4
	srax	%g5,	%l2,	%l1
	movle	%icc,	%l6,	%l0
	movrgz	%i2,	0x18A,	%g6
	edge32n	%i4,	%l3,	%i5
	edge16	%i6,	%g1,	%l5
	ldd	[%l7 + 0x28],	%f4
	ld	[%l7 + 0x08],	%f1
	fmovsa	%icc,	%f21,	%f2
	mova	%icc,	%o1,	%l4
	move	%xcc,	%o7,	%i1
	srax	%i7,	0x07,	%o2
	ldsw	[%l7 + 0x70],	%o3
	fcmpne16	%f24,	%f28,	%o6
	fmovdcs	%xcc,	%f7,	%f25
	movrlz	%o5,	%g2,	%g3
	fmovsleu	%icc,	%f15,	%f7
	xorcc	%g7,	0x1C9D,	%o0
	alignaddr	%i3,	%o4,	%g4
	movrlez	%g5,	0x038,	%l2
	edge32n	%l1,	%i0,	%l6
	ld	[%l7 + 0x6C],	%f10
	fmovsne	%xcc,	%f17,	%f27
	fone	%f2
	edge32n	%i2,	%l0,	%i4
	orncc	%g6,	%i5,	%i6
	movl	%icc,	%l3,	%l5
	ldd	[%l7 + 0x28],	%g0
	edge8n	%o1,	%l4,	%o7
	andncc	%i1,	%i7,	%o3
	udivx	%o2,	0x023C,	%o5
	xor	%o6,	0x02D7,	%g2
	lduh	[%l7 + 0x3A],	%g3
	lduh	[%l7 + 0x16],	%g7
	ld	[%l7 + 0x18],	%f14
	movcs	%icc,	%i3,	%o4
	fmovrslz	%o0,	%f22,	%f10
	addc	%g5,	%l2,	%l1
	stb	%g4,	[%l7 + 0x3E]
	sth	%l6,	[%l7 + 0x16]
	fandnot1s	%f28,	%f5,	%f28
	fxor	%f12,	%f28,	%f6
	fandnot1	%f20,	%f24,	%f8
	movge	%icc,	%i0,	%l0
	fpsub32s	%f26,	%f3,	%f12
	ldub	[%l7 + 0x45],	%i4
	edge32	%g6,	%i5,	%i6
	movrgz	%i2,	0x028,	%l3
	array8	%g1,	%o1,	%l4
	fmovs	%f30,	%f21
	ldsb	[%l7 + 0x46],	%l5
	fsrc1s	%f7,	%f19
	fcmple32	%f2,	%f22,	%o7
	movle	%xcc,	%i1,	%i7
	fzeros	%f21
	edge32	%o3,	%o2,	%o5
	movgu	%icc,	%o6,	%g3
	std	%f12,	[%l7 + 0x50]
	edge32	%g7,	%i3,	%g2
	andncc	%o4,	%g5,	%l2
	srlx	%o0,	%g4,	%l6
	ldd	[%l7 + 0x38],	%f4
	fabss	%f6,	%f2
	addccc	%l1,	%l0,	%i0
	edge16	%g6,	%i4,	%i6
	sdivx	%i2,	0x0C9E,	%i5
	edge16n	%g1,	%l3,	%l4
	xnor	%o1,	0x0482,	%l5
	movle	%icc,	%o7,	%i1
	movvs	%icc,	%o3,	%o2
	srl	%o5,	%i7,	%o6
	fcmped	%fcc3,	%f10,	%f20
	addcc	%g7,	%i3,	%g2
	move	%icc,	%g3,	%o4
	array32	%g5,	%o0,	%g4
	orncc	%l6,	%l2,	%l1
	sub	%l0,	%i0,	%i4
	andn	%g6,	%i6,	%i5
	movpos	%xcc,	%g1,	%i2
	umul	%l4,	%l3,	%o1
	movrgez	%l5,	%i1,	%o3
	edge16l	%o7,	%o2,	%o5
	fmovsge	%xcc,	%f22,	%f24
	edge8l	%i7,	%g7,	%i3
	orn	%g2,	0x0770,	%o6
	umul	%o4,	0x06DA,	%g5
	sdivx	%g3,	0x0BEF,	%g4
	sllx	%o0,	0x07,	%l6
	movre	%l1,	%l0,	%l2
	fmuld8ulx16	%f0,	%f9,	%f26
	edge32n	%i4,	%i0,	%i6
	and	%g6,	0x1F0E,	%i5
	stw	%i2,	[%l7 + 0x2C]
	orcc	%l4,	%l3,	%g1
	st	%f2,	[%l7 + 0x6C]
	sllx	%o1,	%i1,	%o3
	fnot1	%f18,	%f18
	movgu	%xcc,	%l5,	%o2
	std	%f28,	[%l7 + 0x20]
	movrlez	%o7,	0x356,	%o5
	movn	%xcc,	%i7,	%g7
	edge32	%i3,	%g2,	%o6
	sll	%o4,	%g3,	%g5
	fmovdvs	%icc,	%f29,	%f22
	save %g4, %o0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l1,	%l2,	%i4
	movneg	%xcc,	%l0,	%i6
	srl	%i0,	%g6,	%i2
	stb	%i5,	[%l7 + 0x7F]
	movge	%icc,	%l4,	%g1
	xor	%l3,	%i1,	%o3
	edge16	%l5,	%o1,	%o7
	mulx	%o2,	%i7,	%g7
	ldsw	[%l7 + 0x58],	%o5
	udiv	%i3,	0x0FBD,	%g2
	xor	%o6,	%o4,	%g5
	ld	[%l7 + 0x78],	%f30
	fmovdle	%icc,	%f30,	%f17
	orcc	%g3,	%g4,	%l6
	mulscc	%o0,	0x193D,	%l1
	udiv	%l2,	0x0F7F,	%i4
	popc	%l0,	%i0
	fpack16	%f10,	%f10
	fmuld8sux16	%f28,	%f20,	%f2
	fmuld8sux16	%f21,	%f31,	%f30
	subccc	%g6,	%i2,	%i5
	alignaddrl	%l4,	%i6,	%g1
	fmovrslz	%i1,	%f25,	%f5
	array8	%o3,	%l5,	%l3
	smulcc	%o7,	%o1,	%i7
	xnor	%g7,	%o5,	%o2
	fmovscs	%icc,	%f17,	%f30
	fmovscc	%xcc,	%f20,	%f31
	edge8ln	%g2,	%o6,	%o4
	movne	%icc,	%g5,	%g3
	umul	%i3,	%g4,	%l6
	lduh	[%l7 + 0x7A],	%o0
	mulx	%l2,	0x0495,	%l1
	edge32n	%l0,	%i0,	%g6
	ldx	[%l7 + 0x68],	%i4
	smulcc	%i5,	0x049A,	%l4
	fpmerge	%f1,	%f28,	%f8
	array32	%i6,	%i2,	%i1
	udivcc	%o3,	0x03C4,	%g1
	fmovsle	%xcc,	%f6,	%f9
	stb	%l5,	[%l7 + 0x52]
	edge32n	%l3,	%o1,	%o7
	fmovsle	%xcc,	%f6,	%f31
	fones	%f1
	movgu	%icc,	%i7,	%o5
	fmovdgu	%icc,	%f10,	%f24
	addcc	%g7,	%g2,	%o2
	movle	%icc,	%o4,	%o6
	udivcc	%g5,	0x0EBA,	%g3
	movrne	%g4,	0x2AB,	%i3
	fmovdl	%xcc,	%f27,	%f15
	edge32n	%o0,	%l6,	%l1
	ld	[%l7 + 0x6C],	%f20
	edge32l	%l2,	%i0,	%l0
	fmovdg	%icc,	%f13,	%f2
	or	%i4,	0x15C1,	%i5
	movcs	%icc,	%l4,	%g6
	xnor	%i6,	%i1,	%i2
	fnot2s	%f7,	%f16
	movvs	%icc,	%g1,	%o3
	fmovdle	%icc,	%f8,	%f19
	fones	%f12
	bshuffle	%f14,	%f6,	%f16
	movvs	%xcc,	%l5,	%l3
	fabsd	%f10,	%f0
	fmovscs	%icc,	%f24,	%f10
	fcmped	%fcc0,	%f6,	%f10
	edge8l	%o7,	%i7,	%o5
	fmovsn	%icc,	%f11,	%f5
	alignaddrl	%g7,	%o1,	%g2
	or	%o4,	0x1005,	%o6
	srl	%g5,	0x19,	%g3
	ld	[%l7 + 0x34],	%f20
	fornot1	%f14,	%f30,	%f10
	movne	%icc,	%g4,	%o2
	fmovdle	%icc,	%f7,	%f31
	subcc	%o0,	%l6,	%i3
	st	%f6,	[%l7 + 0x44]
	orcc	%l2,	%i0,	%l1
	movl	%xcc,	%l0,	%i4
	subcc	%l4,	0x17BA,	%g6
	move	%xcc,	%i5,	%i1
	orncc	%i6,	%i2,	%g1
	fmovspos	%xcc,	%f11,	%f31
	movle	%xcc,	%l5,	%l3
	edge8l	%o3,	%i7,	%o7
	edge16ln	%o5,	%o1,	%g7
	fxors	%f17,	%f3,	%f15
	mulx	%g2,	%o6,	%g5
	addccc	%g3,	0x0443,	%o4
	stx	%o2,	[%l7 + 0x40]
	srax	%g4,	0x1C,	%o0
	movrne	%i3,	%l2,	%l6
	xnorcc	%l1,	0x1846,	%i0
	edge32n	%l0,	%l4,	%i4
	edge8l	%g6,	%i1,	%i5
	array16	%i6,	%g1,	%i2
	popc	0x06E3,	%l3
	edge16n	%o3,	%i7,	%o7
	edge32ln	%l5,	%o1,	%g7
	movle	%xcc,	%o5,	%o6
	subc	%g5,	0x135C,	%g2
	movg	%icc,	%g3,	%o4
	movne	%icc,	%o2,	%o0
	ldd	[%l7 + 0x10],	%f24
	edge16n	%g4,	%l2,	%i3
	orn	%l1,	0x017F,	%l6
	orncc	%l0,	%i0,	%i4
	subccc	%l4,	0x1498,	%g6
	sdivcc	%i5,	0x1E2A,	%i1
	stb	%g1,	[%l7 + 0x10]
	and	%i6,	0x1CC4,	%i2
	bshuffle	%f0,	%f12,	%f20
	movne	%icc,	%l3,	%i7
	umulcc	%o3,	%o7,	%o1
	fmovdvc	%icc,	%f28,	%f27
	fmovdl	%icc,	%f16,	%f19
	edge16n	%l5,	%o5,	%g7
	sub	%g5,	%g2,	%g3
	sir	0x0918
	ldub	[%l7 + 0x17],	%o6
	array8	%o2,	%o0,	%g4
	xorcc	%o4,	%l2,	%i3
	sra	%l6,	%l1,	%l0
	subccc	%i4,	0x1975,	%l4
	ldd	[%l7 + 0x30],	%i0
	ldx	[%l7 + 0x10],	%i5
	orcc	%i1,	%g6,	%i6
	movrgez	%g1,	%l3,	%i7
	lduw	[%l7 + 0x28],	%i2
	or	%o7,	0x03B3,	%o1
	fmovdcs	%xcc,	%f29,	%f0
	srax	%l5,	0x01,	%o5
	ldsb	[%l7 + 0x2D],	%o3
	stx	%g5,	[%l7 + 0x20]
	sdiv	%g2,	0x0D01,	%g7
	umul	%o6,	0x0DED,	%o2
	sub	%o0,	0x06C7,	%g3
	srax	%o4,	%g4,	%l2
	fnegs	%f10,	%f30
	sdivx	%i3,	0x15CB,	%l1
	movrgez	%l0,	%l6,	%i4
	ldd	[%l7 + 0x40],	%l4
	movrgez	%i5,	%i0,	%i1
	alignaddr	%g6,	%g1,	%i6
	smulcc	%i7,	0x07DC,	%l3
	ldx	[%l7 + 0x40],	%o7
	fmovscc	%xcc,	%f16,	%f31
	movn	%xcc,	%o1,	%i2
	edge32n	%o5,	%o3,	%l5
	udivx	%g5,	0x191A,	%g7
	sdiv	%o6,	0x069E,	%g2
	addc	%o0,	0x1996,	%g3
	udiv	%o4,	0x004B,	%o2
	xorcc	%l2,	0x0CA1,	%g4
	ldsb	[%l7 + 0x7C],	%l1
	st	%f17,	[%l7 + 0x4C]
	fcmpeq16	%f2,	%f6,	%l0
	edge32l	%i3,	%l6,	%i4
	fone	%f26
	fsrc1	%f20,	%f0
	nop
	set	0x24, %o1
	ldub	[%l7 + %o1],	%l4
	fabss	%f20,	%f2
	movle	%icc,	%i0,	%i5
	fpack16	%f28,	%f4
	alignaddr	%g6,	%g1,	%i1
	movl	%icc,	%i7,	%i6
	and	%o7,	0x159B,	%o1
	edge32n	%i2,	%l3,	%o3
	and	%l5,	0x0B5C,	%o5
	ldsh	[%l7 + 0x2A],	%g5
	lduw	[%l7 + 0x28],	%o6
	andn	%g2,	%o0,	%g3
	array32	%o4,	%o2,	%g7
	movre	%l2,	0x2CC,	%l1
	movg	%xcc,	%g4,	%l0
	sll	%l6,	%i4,	%l4
	movne	%icc,	%i3,	%i5
	xor	%g6,	%g1,	%i1
	edge16ln	%i0,	%i7,	%i6
	subccc	%o7,	0x05F0,	%i2
	movrgez	%o1,	%o3,	%l3
	edge16ln	%o5,	%l5,	%g5
	ldsw	[%l7 + 0x60],	%o6
	add	%g2,	%o0,	%o4
	fors	%f0,	%f0,	%f16
	alignaddr	%g3,	%g7,	%o2
	fmul8ulx16	%f0,	%f24,	%f10
	fxnor	%f0,	%f28,	%f12
	subc	%l2,	%l1,	%l0
	fcmpes	%fcc1,	%f8,	%f17
	edge8	%g4,	%l6,	%i4
	fcmpd	%fcc3,	%f26,	%f6
	fmovrsgez	%i3,	%f16,	%f13
	fandnot2	%f0,	%f10,	%f22
	movneg	%xcc,	%l4,	%g6
	fnand	%f22,	%f0,	%f2
	array8	%i5,	%g1,	%i0
	fmuld8ulx16	%f16,	%f14,	%f4
	mulx	%i7,	%i6,	%i1
	fnegs	%f29,	%f10
	xnor	%o7,	0x0D96,	%o1
	andn	%o3,	%l3,	%i2
	ldsb	[%l7 + 0x62],	%l5
	fexpand	%f1,	%f8
	orn	%o5,	%o6,	%g2
	addc	%g5,	%o0,	%o4
	alignaddrl	%g7,	%g3,	%l2
	movleu	%icc,	%o2,	%l1
	subc	%g4,	%l0,	%l6
	edge32l	%i3,	%l4,	%g6
	edge32l	%i4,	%g1,	%i0
	movleu	%xcc,	%i5,	%i7
	st	%f3,	[%l7 + 0x7C]
	addcc	%i1,	0x0129,	%o7
	srax	%o1,	0x12,	%i6
	edge16	%l3,	%o3,	%i2
	subccc	%o5,	0x1335,	%o6
	movneg	%xcc,	%l5,	%g2
	nop
	set	0x33, %o5
	ldsb	[%l7 + %o5],	%o0
	alignaddr	%o4,	%g5,	%g3
	umulcc	%l2,	%g7,	%l1
	sir	0x0E4E
	movgu	%xcc,	%g4,	%o2
	movcc	%xcc,	%l6,	%l0
	xnor	%l4,	%i3,	%i4
	fmovdne	%icc,	%f27,	%f20
	sir	0x0FDD
	addccc	%g6,	%i0,	%g1
	smul	%i5,	0x19C4,	%i1
	move	%icc,	%i7,	%o1
	addcc	%o7,	%i6,	%l3
	movcc	%icc,	%i2,	%o5
	fmul8ulx16	%f10,	%f16,	%f0
	fmovdl	%icc,	%f25,	%f29
	siam	0x4
	addcc	%o6,	%o3,	%g2
	edge32	%o0,	%l5,	%g5
	movrgez	%o4,	%l2,	%g7
	edge32l	%l1,	%g3,	%g4
	edge16l	%l6,	%l0,	%o2
	fmovrdgez	%i3,	%f26,	%f22
	movge	%icc,	%l4,	%g6
	siam	0x7
	fcmpgt32	%f16,	%f24,	%i4
	subccc	%g1,	%i5,	%i1
	andncc	%i0,	%i7,	%o1
	addc	%i6,	0x06E2,	%o7
	addcc	%l3,	%i2,	%o5
	fabsd	%f22,	%f20
	movrlez	%o6,	%g2,	%o0
	fmovdne	%xcc,	%f31,	%f10
	srax	%l5,	0x13,	%o3
	move	%icc,	%o4,	%l2
	sethi	0x0E3C,	%g5
	lduh	[%l7 + 0x28],	%g7
	fmovdg	%xcc,	%f1,	%f9
	fmovsvs	%icc,	%f24,	%f29
	edge32l	%g3,	%l1,	%l6
	edge32	%g4,	%l0,	%o2
	fmovrdne	%i3,	%f18,	%f22
	fors	%f30,	%f7,	%f30
	andn	%l4,	%i4,	%g6
	fabss	%f24,	%f21
	popc	%g1,	%i1
	fsrc1s	%f22,	%f25
	smulcc	%i5,	%i7,	%i0
	smul	%o1,	0x1A5C,	%i6
	xnor	%l3,	0x0165,	%o7
	movvc	%xcc,	%i2,	%o6
	stb	%g2,	[%l7 + 0x32]
	fmul8sux16	%f24,	%f16,	%f8
	fmovdle	%xcc,	%f18,	%f4
	fmovrslz	%o5,	%f7,	%f25
	fmovsgu	%icc,	%f0,	%f24
	ldsb	[%l7 + 0x5B],	%l5
	xnorcc	%o0,	0x01BA,	%o4
	edge16	%l2,	%g5,	%g7
	fmovdgu	%xcc,	%f31,	%f13
	edge16ln	%g3,	%l1,	%l6
	or	%g4,	%o3,	%l0
	movcs	%icc,	%o2,	%i3
	subcc	%i4,	%l4,	%g1
	lduh	[%l7 + 0x16],	%i1
	addc	%g6,	0x0237,	%i7
	fmovdvc	%xcc,	%f20,	%f0
	orncc	%i5,	0x15E7,	%i0
	alignaddrl	%o1,	%i6,	%o7
	or	%i2,	0x1F37,	%l3
	fmul8sux16	%f22,	%f30,	%f24
	ldsb	[%l7 + 0x35],	%g2
	movneg	%icc,	%o6,	%o5
	fmovsne	%xcc,	%f24,	%f1
	sth	%o0,	[%l7 + 0x64]
	ldsb	[%l7 + 0x0E],	%l5
	lduh	[%l7 + 0x72],	%l2
	movvc	%xcc,	%o4,	%g5
	movg	%xcc,	%g3,	%l1
	fmovsvs	%xcc,	%f5,	%f14
	movle	%xcc,	%l6,	%g4
	addcc	%g7,	0x1236,	%o3
	fand	%f16,	%f28,	%f16
	movcc	%icc,	%o2,	%l0
	add	%i4,	%i3,	%g1
	nop
	set	0x68, %l6
	std	%f14,	[%l7 + %l6]
	save %l4, 0x001D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x68],	%i1
	nop
	set	0x18, %i6
	ldsw	[%l7 + %i6],	%i7
	xorcc	%i5,	0x0117,	%o1
	movcc	%xcc,	%i0,	%i6
	ldsh	[%l7 + 0x7A],	%o7
	edge32	%l3,	%i2,	%o6
	movrgez	%o5,	0x0B6,	%o0
	movn	%xcc,	%l5,	%g2
	sethi	0x10BC,	%l2
	ldub	[%l7 + 0x32],	%g5
	xnor	%o4,	%g3,	%l6
	fmovsleu	%icc,	%f6,	%f22
	nop
	set	0x2C, %g4
	stw	%l1,	[%l7 + %g4]
	movcc	%icc,	%g4,	%o3
	edge16ln	%g7,	%l0,	%i4
	stb	%i3,	[%l7 + 0x1F]
	orncc	%g1,	0x18D5,	%o2
	andn	%l4,	%i1,	%g6
	addccc	%i5,	0x1D72,	%i7
	addc	%i0,	0x0BFE,	%o1
	movl	%icc,	%i6,	%o7
	xor	%i2,	0x0B95,	%l3
	array8	%o5,	%o6,	%l5
	udiv	%o0,	0x102B,	%g2
	stb	%g5,	[%l7 + 0x52]
	fmovrslz	%o4,	%f11,	%f11
	stx	%l2,	[%l7 + 0x30]
	fmul8x16al	%f30,	%f14,	%f0
	movpos	%icc,	%g3,	%l6
	xnorcc	%g4,	%o3,	%g7
	movrlz	%l0,	0x327,	%i4
	edge16l	%i3,	%g1,	%l1
	faligndata	%f4,	%f0,	%f12
	fmovdl	%icc,	%f15,	%f22
	ldub	[%l7 + 0x1E],	%o2
	edge16l	%l4,	%i1,	%i5
	fmuld8sux16	%f26,	%f2,	%f14
	std	%f30,	[%l7 + 0x50]
	mulx	%g6,	%i7,	%i0
	sllx	%i6,	0x04,	%o1
	udiv	%o7,	0x1218,	%l3
	fmovda	%xcc,	%f2,	%f9
	stw	%o5,	[%l7 + 0x70]
	fandnot2s	%f7,	%f14,	%f11
	restore %i2, 0x0B69, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o0,	%o6,	%g5
	sra	%o4,	0x1C,	%g2
	andn	%g3,	0x19A8,	%l2
	movrgz	%l6,	0x18D,	%g4
	edge16n	%o3,	%g7,	%l0
	smul	%i3,	%i4,	%l1
	orcc	%o2,	%l4,	%g1
	andn	%i5,	0x1894,	%i1
	edge32l	%i7,	%g6,	%i6
	edge32l	%o1,	%o7,	%i0
	subc	%l3,	%o5,	%l5
	movleu	%xcc,	%i2,	%o6
	subccc	%o0,	0x1AB5,	%o4
	lduw	[%l7 + 0x14],	%g2
	sdivx	%g5,	0x0D52,	%l2
	mulx	%l6,	%g4,	%o3
	sir	0x1AAF
	fmovdle	%icc,	%f4,	%f21
	ldub	[%l7 + 0x49],	%g3
	movl	%icc,	%g7,	%l0
	edge32	%i4,	%i3,	%o2
	movneg	%icc,	%l4,	%g1
	xnor	%i5,	%l1,	%i7
	edge16	%g6,	%i1,	%i6
	subc	%o7,	0x0983,	%i0
	alignaddrl	%l3,	%o1,	%o5
	sth	%l5,	[%l7 + 0x44]
	fmovsvs	%xcc,	%f18,	%f27
	srl	%o6,	0x1D,	%i2
	alignaddrl	%o4,	%o0,	%g2
	smul	%l2,	0x0F7E,	%g5
	edge16n	%l6,	%g4,	%g3
	xor	%g7,	0x1F26,	%o3
	edge8l	%l0,	%i4,	%i3
	fxnors	%f3,	%f23,	%f26
	fmovrdgz	%l4,	%f22,	%f14
	subc	%o2,	%g1,	%l1
	edge8ln	%i5,	%i7,	%g6
	srl	%i6,	%i1,	%o7
	sethi	0x0A5E,	%l3
	umulcc	%o1,	0x1232,	%i0
	fnand	%f20,	%f0,	%f18
	fnot2	%f24,	%f20
	fpmerge	%f6,	%f31,	%f26
	add	%o5,	%l5,	%i2
	udivx	%o6,	0x102D,	%o0
	add	%g2,	%o4,	%g5
	ldsb	[%l7 + 0x0B],	%l6
	xor	%l2,	0x0DC2,	%g3
	fmovdcs	%xcc,	%f23,	%f18
	fnot1s	%f1,	%f7
	ld	[%l7 + 0x68],	%f30
	edge32l	%g7,	%o3,	%g4
	xorcc	%i4,	0x03CF,	%l0
	xnor	%i3,	0x0486,	%o2
	addcc	%g1,	%l1,	%l4
	movrne	%i7,	%g6,	%i5
	movrlz	%i6,	0x0DF,	%i1
	stx	%l3,	[%l7 + 0x38]
	ldx	[%l7 + 0x18],	%o7
	move	%xcc,	%i0,	%o5
	movrlez	%l5,	%o1,	%o6
	add	%o0,	0x1E58,	%g2
	popc	0x1B75,	%i2
	movneg	%icc,	%g5,	%o4
	sllx	%l6,	0x02,	%g3
	fandnot1s	%f0,	%f12,	%f16
	stx	%g7,	[%l7 + 0x70]
	nop
	set	0x08, %i5
	lduw	[%l7 + %i5],	%o3
	add	%l2,	0x0670,	%g4
	movrgez	%l0,	%i3,	%o2
	array16	%i4,	%l1,	%g1
	edge8l	%i7,	%g6,	%l4
	movne	%icc,	%i6,	%i1
	movvs	%xcc,	%l3,	%o7
	fcmple32	%f14,	%f28,	%i5
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	restore %o6, 0x150C, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g2,	0x1CEC,	%l5
	movl	%icc,	%g5,	%i2
	xnor	%o4,	0x157A,	%g3
	movrgz	%g7,	%o3,	%l6
	ldsh	[%l7 + 0x54],	%g4
	andn	%l0,	0x1A68,	%i3
	array32	%o2,	%l2,	%l1
	array16	%i4,	%g1,	%g6
	movvs	%icc,	%l4,	%i6
	array32	%i7,	%l3,	%i1
	edge32ln	%i5,	%o7,	%o5
	udivx	%o1,	0x055F,	%o6
	edge8n	%o0,	%i0,	%g2
	movrgz	%l5,	%i2,	%o4
	fpmerge	%f11,	%f4,	%f12
	sdiv	%g5,	0x1009,	%g7
	faligndata	%f28,	%f22,	%f20
	fmovdg	%xcc,	%f31,	%f13
	srax	%o3,	0x19,	%l6
	andncc	%g4,	%g3,	%i3
	movle	%xcc,	%o2,	%l2
	sethi	0x01D0,	%l0
	edge8n	%l1,	%g1,	%g6
	movg	%xcc,	%l4,	%i6
	alignaddrl	%i7,	%i4,	%l3
	fnand	%f12,	%f30,	%f30
	fornot2	%f0,	%f22,	%f12
	alignaddr	%i5,	%i1,	%o7
	fone	%f14
	edge8	%o5,	%o6,	%o0
	fnot2s	%f15,	%f8
	siam	0x1
	fexpand	%f10,	%f16
	fcmpes	%fcc2,	%f17,	%f6
	edge16l	%i0,	%g2,	%o1
	fmovdcs	%icc,	%f22,	%f22
	ldsb	[%l7 + 0x71],	%l5
	movgu	%xcc,	%o4,	%g5
	addcc	%g7,	0x0C98,	%i2
	sir	0x1B81
	edge32n	%o3,	%l6,	%g4
	sdiv	%g3,	0x01CF,	%o2
	udiv	%i3,	0x0E07,	%l0
	popc	0x0089,	%l1
	fmovrsne	%l2,	%f1,	%f17
	sllx	%g1,	0x1E,	%g6
	orcc	%l4,	%i6,	%i7
	fnot2	%f0,	%f10
	movrlz	%l3,	%i4,	%i5
	subcc	%o7,	%o5,	%o6
	ldd	[%l7 + 0x60],	%f22
	fmul8ulx16	%f18,	%f24,	%f18
	movl	%icc,	%o0,	%i0
	edge16n	%g2,	%o1,	%l5
	movpos	%icc,	%o4,	%g5
	nop
	set	0x58, %l3
	stx	%g7,	[%l7 + %l3]
	addcc	%i1,	%o3,	%i2
	addcc	%l6,	%g4,	%o2
	movrgez	%g3,	%i3,	%l1
	movne	%icc,	%l0,	%l2
	orcc	%g6,	0x1EC6,	%g1
	andn	%i6,	%l4,	%l3
	movne	%xcc,	%i7,	%i5
	fmovrsgz	%o7,	%f16,	%f1
	movn	%icc,	%o5,	%i4
	udivx	%o0,	0x0D27,	%i0
	edge16l	%g2,	%o6,	%o1
	fcmpgt32	%f16,	%f30,	%o4
	umulcc	%g5,	%l5,	%i1
	andn	%g7,	0x0E56,	%o3
	fmovrslez	%l6,	%f22,	%f28
	edge32ln	%g4,	%o2,	%i2
	movn	%icc,	%i3,	%l1
	movneg	%icc,	%l0,	%l2
	edge16	%g6,	%g3,	%g1
	movcc	%icc,	%i6,	%l4
	popc	%l3,	%i5
	movrlz	%i7,	0x3E9,	%o5
	movvc	%xcc,	%i4,	%o7
	orn	%i0,	0x1AFF,	%o0
	fmovdle	%xcc,	%f1,	%f11
	fmovsgu	%icc,	%f28,	%f5
	or	%o6,	%g2,	%o4
	popc	%o1,	%g5
	edge32n	%i1,	%g7,	%o3
	movl	%icc,	%l5,	%l6
	fpadd16	%f28,	%f6,	%f8
	movre	%g4,	0x380,	%i2
	movneg	%xcc,	%i3,	%l1
	lduw	[%l7 + 0x14],	%l0
	edge8l	%o2,	%g6,	%l2
	fcmpeq16	%f24,	%f30,	%g1
	subccc	%i6,	0x15CD,	%l4
	orncc	%g3,	%l3,	%i7
	andcc	%i5,	0x0488,	%o5
	or	%i4,	0x1F96,	%o7
	movg	%icc,	%i0,	%o6
	ldsh	[%l7 + 0x1C],	%g2
	fmovdvs	%icc,	%f2,	%f9
	or	%o0,	0x1D08,	%o1
	nop
	set	0x50, %i3
	stx	%g5,	[%l7 + %i3]
	fexpand	%f20,	%f8
	fmovdpos	%xcc,	%f22,	%f11
	sllx	%i1,	0x19,	%g7
	stb	%o3,	[%l7 + 0x3B]
	ldsh	[%l7 + 0x64],	%l5
	edge8n	%o4,	%l6,	%g4
	fnot2s	%f30,	%f18
	save %i3, %l1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o2,	0x1758,	%g6
	or	%l2,	%i2,	%g1
	fmovdge	%icc,	%f19,	%f28
	stb	%l4,	[%l7 + 0x15]
	ldsw	[%l7 + 0x30],	%g3
	sdivx	%l3,	0x19B1,	%i6
	sllx	%i7,	0x10,	%o5
	subcc	%i5,	%o7,	%i4
	stw	%i0,	[%l7 + 0x58]
	move	%xcc,	%o6,	%o0
	smulcc	%o1,	%g5,	%i1
	stx	%g2,	[%l7 + 0x28]
	smulcc	%g7,	%o3,	%o4
	movle	%xcc,	%l6,	%l5
	edge8	%i3,	%l1,	%l0
	save %g4, 0x01B6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o2,	%i2,	%l2
	for	%f24,	%f16,	%f6
	fors	%f19,	%f18,	%f4
	ldd	[%l7 + 0x40],	%l4
	sllx	%g1,	0x0F,	%l3
	movrgez	%g3,	%i6,	%o5
	movn	%xcc,	%i5,	%i7
	xor	%o7,	%i0,	%i4
	array32	%o6,	%o0,	%g5
	movneg	%icc,	%i1,	%g2
	fsrc2	%f24,	%f14
	ldx	[%l7 + 0x20],	%o1
	fmovdleu	%xcc,	%f9,	%f28
	andcc	%g7,	%o3,	%l6
	array16	%l5,	%o4,	%l1
	fpadd32s	%f11,	%f20,	%f20
	popc	%l0,	%g4
	ldd	[%l7 + 0x18],	%f24
	umul	%g6,	0x1594,	%i3
	fones	%f21
	fmovrsne	%i2,	%f9,	%f10
	fzero	%f24
	for	%f14,	%f8,	%f0
	sir	0x180F
	movvc	%xcc,	%o2,	%l4
	movg	%xcc,	%g1,	%l2
	sethi	0x178E,	%g3
	fmovdleu	%xcc,	%f19,	%f20
	alignaddr	%i6,	%l3,	%o5
	edge32l	%i7,	%i5,	%i0
	sir	0x1159
	alignaddrl	%o7,	%o6,	%i4
	edge32ln	%o0,	%g5,	%i1
	array32	%o1,	%g7,	%g2
	fands	%f23,	%f30,	%f15
	movge	%icc,	%l6,	%l5
	fcmpgt16	%f10,	%f30,	%o4
	mulx	%o3,	0x01CE,	%l0
	sethi	0x19AA,	%l1
	and	%g4,	%g6,	%i3
	ld	[%l7 + 0x70],	%f16
	fpsub32s	%f4,	%f30,	%f10
	smulcc	%i2,	0x1A33,	%o2
	ldsb	[%l7 + 0x7B],	%g1
	movrne	%l2,	0x20F,	%l4
	array32	%i6,	%g3,	%l3
	movleu	%icc,	%o5,	%i5
	stx	%i0,	[%l7 + 0x28]
	movrgez	%o7,	%o6,	%i4
	edge8n	%o0,	%i7,	%i1
	fmovrsne	%o1,	%f15,	%f17
	fexpand	%f28,	%f18
	movl	%xcc,	%g5,	%g7
	ldd	[%l7 + 0x08],	%f20
	and	%l6,	0x181B,	%l5
	fzero	%f24
	mulx	%g2,	0x1B04,	%o3
	or	%o4,	%l1,	%l0
	fcmpes	%fcc0,	%f27,	%f9
	ldx	[%l7 + 0x68],	%g6
	movcc	%xcc,	%i3,	%i2
	subc	%g4,	0x1636,	%o2
	srlx	%g1,	%l4,	%l2
	save %g3, 0x0C0F, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i6,	[%l7 + 0x58]
	ld	[%l7 + 0x74],	%f24
	sir	0x12A4
	ldsb	[%l7 + 0x6B],	%i5
	sra	%o5,	0x10,	%o7
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fxnors	%f31,	%f21,	%f1
	fpsub32	%f22,	%f6,	%f0
	ldd	[%l7 + 0x20],	%o0
	fmovscs	%icc,	%f4,	%f17
	sll	%o6,	%i1,	%i7
	smulcc	%o1,	%g7,	%l6
	fmovsg	%icc,	%f31,	%f7
	movge	%icc,	%l5,	%g2
	fmovsgu	%xcc,	%f2,	%f22
	fnegd	%f12,	%f8
	ldd	[%l7 + 0x20],	%o2
	fmovdle	%icc,	%f7,	%f13
	udivcc	%g5,	0x0C5E,	%l1
	fxor	%f2,	%f22,	%f12
	orn	%o4,	%l0,	%i3
	fzero	%f26
	sir	0x0DC4
	ldsw	[%l7 + 0x7C],	%i2
	smul	%g6,	%g4,	%g1
	ldsh	[%l7 + 0x64],	%l4
	fand	%f2,	%f2,	%f30
	fmovsleu	%xcc,	%f4,	%f5
	mulscc	%l2,	0x1670,	%o2
	srax	%l3,	%g3,	%i5
	ldub	[%l7 + 0x0D],	%o5
	andncc	%i6,	%o7,	%i0
	fnot2s	%f7,	%f23
	lduh	[%l7 + 0x5E],	%i4
	st	%f29,	[%l7 + 0x14]
	or	%o0,	%o6,	%i7
	fmovrsgez	%i1,	%f3,	%f29
	or	%g7,	0x03B7,	%o1
	movl	%icc,	%l6,	%g2
	movvc	%xcc,	%l5,	%o3
	fnot1	%f12,	%f4
	fcmpes	%fcc1,	%f9,	%f12
	srl	%l1,	0x1C,	%o4
	fmuld8ulx16	%f27,	%f18,	%f4
	sll	%l0,	%g5,	%i3
	edge16l	%g6,	%i2,	%g1
	movne	%icc,	%l4,	%l2
	fxnor	%f0,	%f24,	%f14
	movne	%xcc,	%o2,	%g4
	edge8	%l3,	%g3,	%i5
	array32	%i6,	%o7,	%i0
	udivx	%o5,	0x1F0F,	%i4
	edge32l	%o0,	%i7,	%i1
	ldx	[%l7 + 0x70],	%o6
	ldsh	[%l7 + 0x2E],	%g7
	edge8ln	%o1,	%l6,	%g2
	srax	%o3,	0x0F,	%l5
	fmovrdgz	%o4,	%f26,	%f26
	movne	%icc,	%l0,	%l1
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%g4
	st	%f4,	[%l7 + 0x3C]
	mulscc	%i3,	0x0C1C,	%g6
	fmovsvs	%icc,	%f29,	%f28
	edge16ln	%i2,	%g1,	%l2
	edge32ln	%l4,	%o2,	%l3
	fcmpd	%fcc1,	%f0,	%f10
	xor	%g4,	0x18EF,	%g3
	array16	%i5,	%i6,	%o7
	sub	%o5,	%i4,	%i0
	edge8ln	%i7,	%i1,	%o6
	movl	%icc,	%g7,	%o0
	udivx	%l6,	0x0D31,	%o1
	edge16l	%o3,	%g2,	%l5
	addccc	%l0,	0x15D9,	%l1
	sra	%g5,	0x01,	%i3
	edge8	%o4,	%i2,	%g1
	smul	%l2,	0x0082,	%l4
	movl	%xcc,	%o2,	%g6
	movvs	%icc,	%l3,	%g3
	movvs	%xcc,	%g4,	%i6
	siam	0x7
	edge8l	%o7,	%i5,	%o5
	movneg	%icc,	%i0,	%i7
	sth	%i1,	[%l7 + 0x54]
	xnor	%o6,	%g7,	%o0
	fpsub32	%f6,	%f12,	%f22
	sdivcc	%l6,	0x13B0,	%o1
	move	%icc,	%o3,	%i4
	udivx	%g2,	0x1C35,	%l0
	sllx	%l5,	%l1,	%g5
	movn	%icc,	%i3,	%i2
	sll	%g1,	0x0C,	%l2
	st	%f4,	[%l7 + 0x70]
	smul	%o4,	%o2,	%l4
	edge32l	%l3,	%g6,	%g4
	edge16n	%g3,	%i6,	%o7
	fpmerge	%f25,	%f29,	%f14
	addcc	%o5,	%i0,	%i5
	edge32ln	%i1,	%i7,	%g7
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f16
	ld	[%l7 + 0x6C],	%f6
	stx	%o6,	[%l7 + 0x30]
	movn	%xcc,	%o0,	%l6
	bshuffle	%f14,	%f6,	%f24
	smul	%o3,	%o1,	%i4
	array8	%g2,	%l0,	%l5
	edge32n	%l1,	%g5,	%i2
	umul	%g1,	%i3,	%l2
	andcc	%o2,	0x18B1,	%o4
	lduw	[%l7 + 0x78],	%l3
	fmovsge	%xcc,	%f7,	%f27
	sub	%l4,	%g6,	%g4
	andcc	%i6,	0x1351,	%o7
	srl	%o5,	0x12,	%g3
	fzero	%f20
	or	%i5,	%i1,	%i0
	ldub	[%l7 + 0x42],	%i7
	fmovdne	%xcc,	%f17,	%f20
	stx	%o6,	[%l7 + 0x50]
	nop
	set	0x08, %g6
	lduw	[%l7 + %g6],	%g7
	fmovdcc	%icc,	%f1,	%f10
	umulcc	%o0,	0x06B1,	%o3
	lduh	[%l7 + 0x0C],	%l6
	fmovdg	%xcc,	%f8,	%f26
	fmovsg	%icc,	%f6,	%f2
	edge16n	%i4,	%g2,	%l0
	srlx	%l5,	%l1,	%o1
	fpadd32	%f10,	%f8,	%f28
	addccc	%g5,	0x0A28,	%i2
	sethi	0x137F,	%i3
	stw	%g1,	[%l7 + 0x54]
	fandnot2	%f22,	%f28,	%f6
	array8	%l2,	%o2,	%l3
	xnorcc	%o4,	0x16C0,	%g6
	fcmpeq32	%f10,	%f20,	%g4
	fmovdvc	%icc,	%f9,	%f29
	fmovdge	%icc,	%f12,	%f6
	movgu	%xcc,	%l4,	%i6
	edge8ln	%o5,	%o7,	%g3
	edge16l	%i1,	%i5,	%i0
	srl	%o6,	%g7,	%i7
	srlx	%o3,	%o0,	%i4
	sra	%l6,	%l0,	%l5
	fzeros	%f23
	movne	%icc,	%g2,	%l1
	fmovspos	%xcc,	%f23,	%f4
	restore %g5, %o1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f20,	%f14,	%f30
	fmul8x16au	%f9,	%f11,	%f14
	addcc	%g1,	0x0E11,	%l2
	srlx	%o2,	0x10,	%i3
	edge16n	%o4,	%l3,	%g4
	fpmerge	%f12,	%f14,	%f18
	orncc	%l4,	%g6,	%o5
	fmovdgu	%xcc,	%f28,	%f13
	umul	%o7,	%g3,	%i6
	fmovse	%xcc,	%f7,	%f21
	fmul8x16	%f4,	%f14,	%f12
	movcc	%icc,	%i5,	%i1
	orcc	%i0,	%g7,	%o6
	addc	%i7,	0x1A3F,	%o0
	ldsh	[%l7 + 0x24],	%o3
	move	%icc,	%l6,	%i4
	movrlez	%l5,	0x191,	%l0
	fmul8sux16	%f2,	%f18,	%f18
	sll	%l1,	0x12,	%g5
	mulx	%g2,	0x0C24,	%o1
	nop
	set	0x16, %l5
	sth	%g1,	[%l7 + %l5]
	ldd	[%l7 + 0x20],	%f26
	sethi	0x0B84,	%i2
	fmovrdne	%l2,	%f18,	%f10
	movcs	%xcc,	%i3,	%o4
	fpack16	%f6,	%f13
	movg	%icc,	%o2,	%g4
	popc	%l3,	%l4
	fmovsneg	%icc,	%f1,	%f1
	subccc	%o5,	%g6,	%o7
	and	%i6,	0x0F47,	%i5
	movcc	%icc,	%i1,	%i0
	edge16ln	%g7,	%o6,	%g3
	or	%o0,	%o3,	%l6
	edge16ln	%i7,	%l5,	%l0
	edge8	%l1,	%g5,	%g2
	ldsw	[%l7 + 0x24],	%o1
	fmovdle	%icc,	%f11,	%f10
	movpos	%xcc,	%i4,	%g1
	stb	%i2,	[%l7 + 0x1C]
	movrne	%l2,	0x2AA,	%o4
	ldx	[%l7 + 0x78],	%o2
	umulcc	%i3,	0x0D4E,	%l3
	ldx	[%l7 + 0x08],	%l4
	fabss	%f28,	%f26
	fmovd	%f12,	%f26
	fexpand	%f12,	%f18
	ld	[%l7 + 0x50],	%f24
	addcc	%o5,	%g6,	%g4
	sethi	0x180F,	%i6
	movvc	%xcc,	%o7,	%i1
	fmovsl	%icc,	%f0,	%f12
	fornot2s	%f2,	%f4,	%f7
	movg	%icc,	%i5,	%g7
	lduw	[%l7 + 0x0C],	%i0
	array16	%o6,	%o0,	%o3
	edge16n	%g3,	%i7,	%l5
	edge32ln	%l0,	%l6,	%g5
	add	%g2,	%l1,	%o1
	xorcc	%g1,	%i2,	%i4
	xorcc	%l2,	%o4,	%i3
	sdiv	%l3,	0x0FEA,	%l4
	addc	%o5,	0x17BE,	%g6
	edge8ln	%g4,	%i6,	%o7
	movn	%icc,	%i1,	%i5
	edge16	%o2,	%g7,	%i0
	subcc	%o0,	%o3,	%o6
	stb	%i7,	[%l7 + 0x26]
	andn	%l5,	%l0,	%l6
	movcc	%xcc,	%g5,	%g3
	andncc	%l1,	%o1,	%g2
	ldsh	[%l7 + 0x12],	%i2
	move	%xcc,	%i4,	%l2
	udivcc	%o4,	0x1EF8,	%g1
	movrlez	%i3,	%l4,	%o5
	movn	%xcc,	%l3,	%g4
	movre	%g6,	0x0EA,	%o7
	stx	%i6,	[%l7 + 0x10]
	sethi	0x0BB7,	%i5
	sir	0x0F43
	fmovrsne	%i1,	%f13,	%f18
	fnand	%f6,	%f0,	%f28
	or	%o2,	0x1EA6,	%i0
	edge32ln	%g7,	%o0,	%o3
	sra	%o6,	0x04,	%l5
	sethi	0x1118,	%l0
	umul	%i7,	%g5,	%g3
	movle	%icc,	%l1,	%o1
	srlx	%l6,	0x0D,	%i2
	udiv	%g2,	0x1E09,	%i4
	orcc	%o4,	%l2,	%g1
	fmovse	%icc,	%f19,	%f12
	edge8n	%l4,	%i3,	%l3
	sethi	0x1AC0,	%o5
	edge8	%g4,	%o7,	%i6
	fmovrslz	%g6,	%f0,	%f15
	fnot1s	%f24,	%f17
	ldx	[%l7 + 0x08],	%i5
	movvc	%icc,	%o2,	%i0
	sethi	0x0F11,	%g7
	lduh	[%l7 + 0x4E],	%o0
	udiv	%o3,	0x1617,	%o6
	ldd	[%l7 + 0x68],	%f28
	fcmple32	%f26,	%f22,	%l5
	ldd	[%l7 + 0x40],	%f2
	movvs	%xcc,	%l0,	%i7
	edge32ln	%g5,	%i1,	%g3
	sdivx	%l1,	0x08D0,	%l6
	sir	0x0407
	movn	%xcc,	%i2,	%g2
	umulcc	%o1,	%o4,	%l2
	xnorcc	%i4,	0x0689,	%l4
	ld	[%l7 + 0x60],	%f14
	ldsh	[%l7 + 0x20],	%i3
	edge16	%l3,	%g1,	%g4
	edge16	%o7,	%o5,	%g6
	movne	%icc,	%i5,	%o2
	st	%f12,	[%l7 + 0x3C]
	lduw	[%l7 + 0x38],	%i0
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	sir	0x1799
	movge	%xcc,	%o3,	%o6
	fand	%f30,	%f18,	%f22
	smul	%l0,	0x07A9,	%l5
	or	%g5,	%i7,	%i1
	ldd	[%l7 + 0x38],	%g2
	ldd	[%l7 + 0x40],	%f12
	edge16n	%l1,	%i2,	%g2
	umulcc	%o1,	%o4,	%l2
	fmovrdgz	%i4,	%f22,	%f0
	stx	%l6,	[%l7 + 0x60]
	movcs	%icc,	%i3,	%l4
	movrlz	%l3,	%g4,	%o7
	edge8l	%o5,	%g6,	%g1
	movrgz	%i5,	%o2,	%i0
	stw	%i6,	[%l7 + 0x1C]
	mulscc	%o0,	%g7,	%o6
	edge16	%o3,	%l0,	%g5
	fpsub32	%f6,	%f26,	%f10
	edge32l	%i7,	%i1,	%l5
	edge32n	%g3,	%i2,	%g2
	fmovsle	%xcc,	%f27,	%f16
	xor	%o1,	%o4,	%l2
	fmovdpos	%icc,	%f10,	%f25
	srlx	%l1,	0x0A,	%l6
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%i3
	xor	%l4,	%i4,	%g4
	save %l3, %o5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o7, 0x17B0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i5,	%o2,	%i6
	edge16l	%o0,	%i0,	%g7
	lduw	[%l7 + 0x10],	%o6
	movg	%xcc,	%o3,	%g5
	fors	%f12,	%f9,	%f16
	fornot1	%f12,	%f12,	%f8
	movvc	%icc,	%l0,	%i1
	sethi	0x1AD9,	%i7
	ldub	[%l7 + 0x48],	%g3
	srl	%i2,	0x02,	%g2
	fnors	%f17,	%f6,	%f8
	move	%icc,	%l5,	%o1
	ldd	[%l7 + 0x40],	%f14
	nop
	set	0x30, %o2
	stw	%o4,	[%l7 + %o2]
	ld	[%l7 + 0x0C],	%f4
	fnegs	%f31,	%f23
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	fmovse	%xcc,	%f18,	%f21
	fmovsge	%icc,	%f13,	%f24
	lduh	[%l7 + 0x5C],	%l4
	sra	%i4,	%i3,	%l3
	ldd	[%l7 + 0x60],	%g4
	umul	%o5,	%g6,	%o7
	sdiv	%i5,	0x1445,	%g1
	lduh	[%l7 + 0x22],	%o2
	fmovs	%f1,	%f5
	sub	%o0,	%i6,	%g7
	movrgz	%o6,	0x0CC,	%i0
	fmovsl	%icc,	%f12,	%f0
	edge8	%o3,	%l0,	%g5
	movn	%icc,	%i7,	%i1
	movge	%icc,	%i2,	%g2
	movgu	%xcc,	%g3,	%o1
	movneg	%xcc,	%o4,	%l2
	movcs	%icc,	%l1,	%l5
	addccc	%l6,	0x1E84,	%l4
	sth	%i3,	[%l7 + 0x4A]
	restore %i4, 0x0146, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l3,	0x0EBD,	%g6
	edge32ln	%o5,	%i5,	%g1
	fsrc2	%f10,	%f14
	umulcc	%o2,	%o7,	%i6
	edge32ln	%o0,	%g7,	%o6
	fmovdleu	%xcc,	%f13,	%f18
	lduh	[%l7 + 0x74],	%i0
	fpsub16s	%f12,	%f10,	%f28
	movvs	%xcc,	%o3,	%g5
	umulcc	%l0,	%i1,	%i2
	movne	%icc,	%g2,	%g3
	movcc	%xcc,	%o1,	%o4
	umulcc	%i7,	%l2,	%l5
	ldub	[%l7 + 0x0A],	%l6
	fandnot1s	%f9,	%f9,	%f8
	fxnors	%f15,	%f5,	%f1
	movl	%xcc,	%l4,	%l1
	fmovsvc	%xcc,	%f4,	%f14
	save %i3, %g4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i4,	%o5,	%i5
	edge16	%g1,	%g6,	%o7
	edge32l	%i6,	%o2,	%o0
	fnot2s	%f8,	%f1
	sdivx	%o6,	0x140F,	%i0
	xnor	%o3,	0x01B7,	%g5
	ldx	[%l7 + 0x78],	%l0
	fornot1s	%f1,	%f15,	%f25
	edge16	%i1,	%g7,	%i2
	mova	%icc,	%g3,	%g2
	addcc	%o4,	%i7,	%l2
	addccc	%l5,	%l6,	%l4
	add	%l1,	0x15A8,	%o1
	fnot1s	%f31,	%f13
	fmuld8sux16	%f1,	%f19,	%f2
	fmovdn	%xcc,	%f21,	%f18
	sll	%i3,	0x1F,	%l3
	edge16ln	%g4,	%o5,	%i5
	edge8n	%i4,	%g6,	%o7
	movcc	%icc,	%g1,	%i6
	fpmerge	%f8,	%f23,	%f6
	movne	%xcc,	%o0,	%o6
	movpos	%xcc,	%o2,	%o3
	fmovda	%icc,	%f17,	%f31
	alignaddr	%g5,	%l0,	%i1
	movrgez	%g7,	0x0B8,	%i2
	xor	%i0,	0x1113,	%g2
	ldsb	[%l7 + 0x50],	%g3
	sdivcc	%o4,	0x1826,	%l2
	movn	%icc,	%l5,	%i7
	ldd	[%l7 + 0x08],	%i6
	sethi	0x0154,	%l1
	movpos	%xcc,	%o1,	%i3
	fmuld8ulx16	%f18,	%f17,	%f30
	fnot1	%f14,	%f10
	lduw	[%l7 + 0x78],	%l3
	movleu	%xcc,	%l4,	%o5
	subc	%g4,	0x0434,	%i4
	fmovda	%icc,	%f6,	%f6
	ldsh	[%l7 + 0x6C],	%i5
	edge8ln	%o7,	%g1,	%i6
	array32	%g6,	%o6,	%o0
	udivcc	%o2,	0x11F2,	%o3
	mulx	%g5,	%i1,	%l0
	xnor	%g7,	%i0,	%i2
	fpack16	%f16,	%f3
	fcmpgt16	%f24,	%f4,	%g2
	fandnot1s	%f2,	%f5,	%f15
	srax	%o4,	%g3,	%l5
	movge	%icc,	%i7,	%l6
	std	%f26,	[%l7 + 0x78]
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	faligndata	%f4,	%f18,	%f14
	subccc	%i3,	%l1,	%l4
	mova	%xcc,	%o5,	%l3
	save %i4, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o7,	%i6,	%g1
	fmovdleu	%xcc,	%f29,	%f8
	stb	%g6,	[%l7 + 0x74]
	srlx	%o0,	0x1D,	%o6
	stw	%o3,	[%l7 + 0x20]
	ldd	[%l7 + 0x30],	%f8
	movrlz	%o2,	0x3C2,	%g5
	alignaddr	%l0,	%i1,	%g7
	popc	%i2,	%i0
	and	%o4,	%g3,	%g2
	subccc	%l5,	0x1F05,	%i7
	fnot2s	%f30,	%f13
	fpsub16	%f2,	%f0,	%f24
	movrlz	%l6,	%o1,	%l2
	movleu	%xcc,	%l1,	%i3
	movn	%icc,	%o5,	%l4
	sdivcc	%i4,	0x0EF7,	%g4
	pdist	%f30,	%f4,	%f20
	movn	%icc,	%i5,	%l3
	mulx	%i6,	0x0E19,	%o7
	movgu	%icc,	%g1,	%g6
	addcc	%o0,	0x19CD,	%o6
	srlx	%o3,	%g5,	%l0
	edge32n	%i1,	%g7,	%i2
	smulcc	%i0,	%o2,	%o4
	xor	%g3,	0x1512,	%l5
	fsrc1	%f2,	%f10
	or	%i7,	0x0B98,	%g2
	orncc	%l6,	0x0141,	%l2
	movrne	%l1,	%o1,	%o5
	fcmps	%fcc0,	%f27,	%f24
	umulcc	%i3,	%i4,	%g4
	edge8l	%l4,	%l3,	%i5
	movg	%icc,	%i6,	%o7
	move	%xcc,	%g1,	%o0
	edge16l	%g6,	%o6,	%o3
	array16	%g5,	%i1,	%g7
	edge8n	%l0,	%i2,	%o2
	fcmpeq16	%f10,	%f2,	%o4
	srlx	%i0,	0x07,	%l5
	sdiv	%g3,	0x1E23,	%g2
	st	%f7,	[%l7 + 0x1C]
	fsrc2	%f8,	%f16
	xorcc	%i7,	0x0A3B,	%l6
	save %l2, 0x1614, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x46, %l1
	lduh	[%l7 + %l1],	%o1
	add	%i3,	0x1583,	%i4
	ldd	[%l7 + 0x78],	%f2
	movleu	%xcc,	%o5,	%g4
	nop
	set	0x1C, %g1
	stw	%l3,	[%l7 + %g1]
	movrne	%i5,	0x124,	%i6
	add	%l4,	0x0440,	%o7
	sub	%g1,	%o0,	%g6
	edge32	%o3,	%g5,	%i1
	addccc	%o6,	0x0B1D,	%l0
	stw	%g7,	[%l7 + 0x7C]
	sub	%i2,	0x129F,	%o2
	edge16n	%o4,	%l5,	%g3
	std	%f12,	[%l7 + 0x70]
	sdiv	%i0,	0x06B8,	%g2
	stx	%l6,	[%l7 + 0x18]
	orcc	%i7,	%l1,	%o1
	sub	%l2,	%i3,	%o5
	save %i4, 0x13F4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x10],	%i5
	sir	0x08ED
	edge8ln	%g4,	%l4,	%o7
	movl	%icc,	%i6,	%o0
	edge32n	%g1,	%o3,	%g5
	fmovsl	%xcc,	%f14,	%f26
	xor	%g6,	%o6,	%l0
	xnor	%i1,	0x0E04,	%i2
	ldsb	[%l7 + 0x1D],	%o2
	andn	%o4,	0x12DE,	%l5
	xorcc	%g7,	0x1DCB,	%i0
	edge32n	%g3,	%l6,	%g2
	nop
	set	0x27, %g7
	stb	%i7,	[%l7 + %g7]
	mulscc	%l1,	0x1332,	%o1
	umul	%l2,	0x159B,	%i3
	ldd	[%l7 + 0x60],	%f18
	sdivcc	%o5,	0x19E3,	%l3
	xnorcc	%i5,	0x0C26,	%i4
	sdiv	%g4,	0x0335,	%l4
	fnegs	%f6,	%f27
	andncc	%o7,	%o0,	%g1
	st	%f21,	[%l7 + 0x50]
	subc	%o3,	%g5,	%g6
	fmovsvs	%icc,	%f21,	%f8
	edge16n	%o6,	%i6,	%l0
	srl	%i2,	%i1,	%o4
	movgu	%icc,	%l5,	%g7
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o2
	fmovdcs	%xcc,	%f5,	%f12
	ldx	[%l7 + 0x18],	%g3
	edge8	%i0,	%l6,	%g2
	fnot2s	%f23,	%f24
	edge8	%i7,	%o1,	%l1
	or	%i3,	%l2,	%o5
	sllx	%i5,	0x09,	%i4
	ld	[%l7 + 0x18],	%f18
	movne	%icc,	%l3,	%l4
	sir	0x15C7
	edge8l	%g4,	%o7,	%g1
	mova	%icc,	%o0,	%g5
	mulx	%g6,	%o3,	%o6
	fone	%f4
	fmovdneg	%icc,	%f22,	%f19
	fornot1	%f28,	%f0,	%f2
	andncc	%i6,	%l0,	%i1
	restore %o4, %l5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o2,	%g7,	%g3
	and	%i0,	%l6,	%g2
	umul	%o1,	0x04F1,	%i7
	sth	%l1,	[%l7 + 0x14]
	save %i3, 0x089A, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i5,	%i4,	%l2
	edge8l	%l4,	%l3,	%o7
	popc	0x181A,	%g1
	fcmple16	%f8,	%f10,	%g4
	popc	0x0909,	%g5
	ldd	[%l7 + 0x50],	%f28
	xnorcc	%o0,	%o3,	%g6
	xorcc	%o6,	0x1015,	%i6
	movrlez	%l0,	%i1,	%o4
	ldx	[%l7 + 0x68],	%l5
	lduh	[%l7 + 0x7A],	%i2
	udivcc	%o2,	0x0C3F,	%g3
	orncc	%i0,	0x0C8A,	%l6
	edge32	%g7,	%g2,	%o1
	orncc	%i7,	%l1,	%i3
	ldd	[%l7 + 0x58],	%f28
	sth	%i5,	[%l7 + 0x26]
	edge8	%o5,	%i4,	%l4
	sub	%l2,	%l3,	%o7
	fmovsne	%icc,	%f17,	%f13
	fand	%f8,	%f0,	%f22
	stx	%g1,	[%l7 + 0x50]
	andncc	%g4,	%o0,	%o3
	movn	%xcc,	%g5,	%g6
	lduw	[%l7 + 0x0C],	%o6
	ldd	[%l7 + 0x40],	%f24
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	movcc	%xcc,	%l5,	%o4
	ldsh	[%l7 + 0x0C],	%i2
	edge8n	%o2,	%g3,	%i0
	stw	%l6,	[%l7 + 0x34]
	fandnot2s	%f15,	%f2,	%f18
	fpsub16s	%f17,	%f27,	%f22
	fmovdgu	%xcc,	%f23,	%f7
	sdivcc	%g7,	0x10CD,	%o1
	andn	%i7,	%g2,	%l1
	ldsw	[%l7 + 0x2C],	%i5
	and	%i3,	0x1671,	%i4
	movn	%xcc,	%l4,	%o5
	edge8	%l3,	%l2,	%o7
	ldsb	[%l7 + 0x47],	%g1
	fandnot2s	%f29,	%f30,	%f26
	pdist	%f22,	%f22,	%f28
	subcc	%g4,	%o3,	%o0
	ldsb	[%l7 + 0x34],	%g6
	xnorcc	%g5,	%l0,	%i6
	movneg	%icc,	%i1,	%l5
	fand	%f30,	%f2,	%f6
	fandnot2	%f0,	%f4,	%f8
	addc	%o6,	%o4,	%i2
	alignaddr	%g3,	%i0,	%l6
	fmovsvc	%xcc,	%f26,	%f3
	fmovsvs	%icc,	%f10,	%f27
	fandnot1	%f30,	%f2,	%f18
	array8	%g7,	%o1,	%o2
	fzeros	%f13
	fmovsgu	%icc,	%f24,	%f0
	movn	%xcc,	%g2,	%i7
	edge16l	%l1,	%i3,	%i4
	andn	%l4,	0x0E44,	%i5
	fnot1s	%f10,	%f24
	movne	%icc,	%l3,	%o5
	ldd	[%l7 + 0x58],	%l2
	movge	%icc,	%o7,	%g1
	orn	%g4,	%o0,	%g6
	fcmpeq16	%f16,	%f12,	%g5
	mulx	%o3,	%l0,	%i6
	sub	%l5,	%o6,	%o4
	mulscc	%i1,	0x14A9,	%i2
	fandnot2s	%f9,	%f16,	%f9
	movrlez	%i0,	0x311,	%l6
	fnot2	%f8,	%f20
	fmovdle	%icc,	%f31,	%f18
	smulcc	%g3,	%g7,	%o1
	umul	%g2,	%i7,	%o2
	sll	%i3,	0x02,	%i4
	fmovsg	%icc,	%f19,	%f19
	fpack32	%f26,	%f18,	%f20
	stx	%l1,	[%l7 + 0x20]
	fone	%f0
	movg	%xcc,	%l4,	%i5
	srlx	%l3,	%l2,	%o5
	sdivcc	%g1,	0x03E1,	%o7
	movgu	%xcc,	%o0,	%g6
	subccc	%g5,	%g4,	%o3
	srl	%i6,	%l0,	%o6
	edge16l	%l5,	%o4,	%i2
	ldd	[%l7 + 0x58],	%i0
	alignaddrl	%i0,	%l6,	%g3
	fpmerge	%f10,	%f0,	%f2
	ldsw	[%l7 + 0x50],	%o1
	fcmpgt16	%f0,	%f30,	%g2
	popc	0x03C1,	%i7
	array8	%o2,	%i3,	%g7
	movne	%xcc,	%l1,	%l4
	std	%f16,	[%l7 + 0x28]
	fmovscs	%icc,	%f26,	%f31
	edge16l	%i5,	%i4,	%l3
	edge16	%o5,	%l2,	%g1
	sir	0x0FE8
	mulscc	%o7,	0x1FBC,	%g6
	movrlz	%o0,	0x2ED,	%g5
	addcc	%g4,	%i6,	%o3
	stw	%l0,	[%l7 + 0x4C]
	edge16l	%l5,	%o4,	%i2
	mulx	%i1,	0x05A0,	%o6
	fpadd16	%f12,	%f2,	%f8
	udivx	%i0,	0x1514,	%l6
	edge8	%o1,	%g2,	%i7
	subc	%g3,	%o2,	%g7
	mulscc	%l1,	0x00D4,	%l4
	fnot2	%f16,	%f12
	edge32l	%i5,	%i3,	%i4
	fmovdne	%xcc,	%f20,	%f6
	ldsw	[%l7 + 0x24],	%l3
	ldsb	[%l7 + 0x3B],	%o5
	movrlez	%l2,	%o7,	%g1
	edge8l	%o0,	%g6,	%g4
	sdivx	%i6,	0x0E07,	%o3
	sll	%g5,	%l0,	%l5
	ldsw	[%l7 + 0x60],	%i2
	andn	%i1,	%o4,	%i0
	movg	%icc,	%l6,	%o6
	srax	%g2,	%o1,	%g3
	and	%o2,	0x127D,	%g7
	movpos	%xcc,	%i7,	%l4
	xor	%i5,	%l1,	%i3
	movrne	%i4,	0x05F,	%l3
	movpos	%xcc,	%l2,	%o5
	move	%xcc,	%o7,	%g1
	movrgz	%o0,	0x124,	%g4
	movneg	%xcc,	%i6,	%o3
	sdiv	%g6,	0x1AC0,	%l0
	fmovrsgz	%g5,	%f29,	%f15
	fmovdl	%icc,	%f21,	%f9
	fpsub16s	%f22,	%f10,	%f10
	fandnot1s	%f24,	%f15,	%f0
	srax	%l5,	%i1,	%o4
	umul	%i2,	0x1408,	%l6
	ldub	[%l7 + 0x17],	%i0
	edge8ln	%o6,	%o1,	%g3
	andncc	%o2,	%g2,	%g7
	stw	%i7,	[%l7 + 0x38]
	array16	%i5,	%l1,	%i3
	st	%f21,	[%l7 + 0x60]
	movn	%icc,	%i4,	%l4
	alignaddr	%l3,	%l2,	%o5
	movgu	%xcc,	%o7,	%g1
	st	%f18,	[%l7 + 0x7C]
	st	%f6,	[%l7 + 0x70]
	array8	%o0,	%i6,	%g4
	or	%o3,	0x178C,	%g6
	fand	%f26,	%f20,	%f6
	movpos	%icc,	%g5,	%l0
	popc	0x07EC,	%i1
	fmovsg	%xcc,	%f6,	%f4
	xnorcc	%o4,	%i2,	%l5
	srl	%i0,	%l6,	%o6
	subc	%g3,	%o1,	%o2
	fmovs	%f29,	%f30
	ldsw	[%l7 + 0x24],	%g7
	andncc	%g2,	%i7,	%l1
	edge16n	%i5,	%i4,	%l4
	movneg	%icc,	%l3,	%l2
	fpadd32s	%f10,	%f26,	%f6
	edge16ln	%i3,	%o5,	%g1
	xnor	%o0,	%o7,	%i6
	orcc	%g4,	%g6,	%o3
	fnor	%f18,	%f18,	%f6
	move	%icc,	%g5,	%l0
	nop
	set	0x48, %g5
	stx	%o4,	[%l7 + %g5]
	ldsb	[%l7 + 0x5F],	%i1
	fcmped	%fcc2,	%f24,	%f20
	sll	%l5,	%i2,	%i0
	sdivx	%o6,	0x167E,	%l6
	fmovse	%icc,	%f6,	%f17
	fone	%f8
	stb	%o1,	[%l7 + 0x37]
	sdivcc	%g3,	0x17BC,	%g7
	fmovdleu	%icc,	%f16,	%f19
	stb	%g2,	[%l7 + 0x1D]
	stb	%i7,	[%l7 + 0x47]
	fmovrde	%l1,	%f10,	%f26
	stx	%o2,	[%l7 + 0x50]
	ldsb	[%l7 + 0x66],	%i5
	stw	%l4,	[%l7 + 0x68]
	sll	%l3,	%l2,	%i4
	fsrc1s	%f0,	%f19
	stx	%o5,	[%l7 + 0x70]
	edge32n	%g1,	%i3,	%o0
	movrgez	%i6,	0x30A,	%g4
	alignaddrl	%o7,	%g6,	%g5
	movl	%icc,	%o3,	%o4
	ldsw	[%l7 + 0x58],	%i1
	fmovsgu	%icc,	%f6,	%f23
	orn	%l0,	%l5,	%i0
	xorcc	%o6,	0x185E,	%l6
	fxors	%f23,	%f20,	%f7
	orncc	%o1,	%i2,	%g3
	sllx	%g2,	%g7,	%i7
	movrlez	%l1,	0x3C4,	%o2
	restore %l4, %l3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f28,	%f6,	%f16
	mova	%xcc,	%i5,	%o5
	sra	%g1,	0x19,	%i3
	xnor	%i4,	0x0541,	%o0
	movge	%icc,	%i6,	%g4
	mova	%icc,	%g6,	%g5
	smulcc	%o3,	%o4,	%i1
	edge32l	%l0,	%o7,	%l5
	fmovdneg	%icc,	%f20,	%f18
	sdivx	%i0,	0x1ADA,	%o6
	ldd	[%l7 + 0x18],	%f24
	stb	%l6,	[%l7 + 0x79]
	fornot2	%f22,	%f24,	%f22
	lduh	[%l7 + 0x74],	%i2
	fmovsleu	%xcc,	%f11,	%f26
	fmovrslz	%g3,	%f6,	%f7
	stx	%g2,	[%l7 + 0x08]
	add	%g7,	%o1,	%i7
	ld	[%l7 + 0x14],	%f5
	movle	%icc,	%l1,	%l4
	andn	%o2,	0x0649,	%l3
	movrgz	%l2,	%i5,	%g1
	udivx	%i3,	0x10CE,	%i4
	ldsb	[%l7 + 0x7D],	%o0
	orn	%i6,	%o5,	%g4
	sll	%g6,	%o3,	%o4
	edge16l	%i1,	%g5,	%o7
	fpack16	%f30,	%f16
	movl	%icc,	%l0,	%l5
	ldd	[%l7 + 0x28],	%o6
	edge16n	%l6,	%i2,	%i0
	edge32n	%g2,	%g7,	%o1
	sll	%g3,	%i7,	%l4
	edge16l	%o2,	%l3,	%l2
	sll	%l1,	0x0E,	%i5
	popc	0x0C59,	%g1
	edge16n	%i3,	%i4,	%i6
	edge16	%o5,	%o0,	%g6
	sra	%o3,	%g4,	%i1
	edge16l	%g5,	%o7,	%l0
	xnorcc	%l5,	%o6,	%l6
	ldsw	[%l7 + 0x7C],	%i2
	ldx	[%l7 + 0x10],	%i0
	udivx	%o4,	0x10EE,	%g7
	movrgz	%o1,	%g3,	%i7
	mulscc	%g2,	%l4,	%o2
	sra	%l3,	0x13,	%l2
	edge8n	%i5,	%l1,	%i3
	movrgez	%i4,	%g1,	%i6
	smul	%o5,	%g6,	%o3
	movl	%xcc,	%g4,	%i1
	movne	%xcc,	%g5,	%o0
	andcc	%o7,	0x1D39,	%l5
	sllx	%l0,	0x1E,	%l6
	alignaddrl	%o6,	%i0,	%i2
	nop
	set	0x12, %o6
	sth	%g7,	[%l7 + %o6]
	for	%f24,	%f2,	%f4
	fpack16	%f24,	%f20
	movre	%o4,	0x02F,	%g3
	lduh	[%l7 + 0x60],	%o1
	sllx	%i7,	%g2,	%l4
	movcc	%xcc,	%o2,	%l2
	addcc	%l3,	%l1,	%i5
	sth	%i3,	[%l7 + 0x60]
	mulscc	%i4,	%g1,	%i6
	ldd	[%l7 + 0x18],	%f12
	addcc	%o5,	%o3,	%g6
	sdivcc	%i1,	0x0E38,	%g5
	fcmpeq32	%f2,	%f28,	%o0
	srax	%g4,	%o7,	%l5
	fmovsgu	%icc,	%f5,	%f31
	fmovse	%icc,	%f18,	%f23
	movrgez	%l0,	0x334,	%o6
	fmovdvs	%icc,	%f23,	%f7
	movrne	%l6,	0x280,	%i0
	lduh	[%l7 + 0x2A],	%i2
	addccc	%g7,	0x1E41,	%g3
	fmovde	%xcc,	%f17,	%f9
	movne	%xcc,	%o1,	%o4
	xnor	%g2,	%l4,	%i7
	fsrc1s	%f16,	%f2
	ldub	[%l7 + 0x40],	%l2
	fcmple16	%f30,	%f6,	%l3
	popc	0x0546,	%o2
	movgu	%icc,	%l1,	%i5
	fornot2s	%f29,	%f25,	%f20
	sra	%i4,	%i3,	%g1
	srlx	%i6,	%o3,	%o5
	fabsd	%f0,	%f6
	ldd	[%l7 + 0x08],	%f12
	movre	%i1,	%g5,	%o0
	movrgz	%g4,	%o7,	%g6
	fcmpgt16	%f18,	%f4,	%l0
	fpadd16s	%f1,	%f3,	%f5
	orcc	%l5,	%o6,	%i0
	popc	%i2,	%g7
	umul	%l6,	%g3,	%o4
	movrlz	%g2,	0x3DE,	%o1
	edge8n	%l4,	%l2,	%i7
	edge32	%o2,	%l3,	%l1
	std	%f18,	[%l7 + 0x28]
	movrgz	%i5,	0x003,	%i3
	xnorcc	%g1,	0x1851,	%i6
	std	%f20,	[%l7 + 0x48]
	fmovdn	%xcc,	%f30,	%f1
	fmovsge	%icc,	%f4,	%f7
	orcc	%o3,	0x13EA,	%o5
	sdiv	%i4,	0x11B8,	%i1
	srlx	%o0,	%g4,	%o7
	edge32	%g5,	%l0,	%g6
	edge32l	%o6,	%l5,	%i0
	array32	%g7,	%l6,	%g3
	fmovrslz	%o4,	%f10,	%f21
	fexpand	%f7,	%f16
	fmovdgu	%icc,	%f26,	%f9
	fmovrslz	%i2,	%f15,	%f30
	movvs	%icc,	%o1,	%l4
	srlx	%g2,	0x1F,	%l2
	and	%i7,	%l3,	%o2
	orn	%i5,	%l1,	%g1
	ld	[%l7 + 0x24],	%f16
	sub	%i3,	%i6,	%o3
	orncc	%i4,	%o5,	%o0
	fmovrdne	%i1,	%f0,	%f2
	add	%o7,	%g5,	%g4
	and	%l0,	0x1286,	%g6
	popc	%o6,	%i0
	lduw	[%l7 + 0x64],	%l5
	fmovsvs	%xcc,	%f30,	%f12
	fexpand	%f27,	%f2
	movg	%xcc,	%l6,	%g3
	popc	0x178B,	%o4
	stx	%i2,	[%l7 + 0x50]
	ldd	[%l7 + 0x68],	%g6
	sdivcc	%o1,	0x061E,	%g2
	addcc	%l4,	0x1D4C,	%l2
	fsrc1	%f0,	%f28
	lduw	[%l7 + 0x40],	%l3
	array8	%o2,	%i5,	%i7
	fmovda	%icc,	%f16,	%f8
	fpadd32	%f0,	%f30,	%f20
	fmovdpos	%xcc,	%f20,	%f6
	stb	%l1,	[%l7 + 0x75]
	fcmple16	%f8,	%f20,	%g1
	move	%xcc,	%i3,	%i6
	umulcc	%o3,	%i4,	%o0
	fmovrse	%i1,	%f12,	%f9
	srl	%o5,	0x16,	%g5
	edge32ln	%o7,	%g4,	%l0
	sdiv	%g6,	0x16B6,	%i0
	movge	%icc,	%o6,	%l6
	movrlez	%g3,	%l5,	%o4
	srlx	%i2,	%g7,	%o1
	edge8	%g2,	%l2,	%l3
	fnot1s	%f9,	%f7
	movge	%xcc,	%o2,	%i5
	xor	%l4,	0x0078,	%l1
	fnands	%f24,	%f1,	%f31
	fmovrdne	%i7,	%f10,	%f14
	std	%f22,	[%l7 + 0x78]
	movvs	%icc,	%i3,	%i6
	move	%xcc,	%o3,	%g1
	and	%i4,	%i1,	%o0
	fmul8sux16	%f12,	%f0,	%f26
	sir	0x1DB8
	edge32ln	%o5,	%o7,	%g4
	addccc	%g5,	0x0C36,	%l0
	movrne	%g6,	%i0,	%l6
	add	%g3,	%l5,	%o6
	sth	%i2,	[%l7 + 0x40]
	movrgez	%o4,	0x0B0,	%o1
	orn	%g2,	%g7,	%l2
	ldsw	[%l7 + 0x34],	%o2
	save %i5, %l3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%xcc,	%f0,	%f0
	subcc	%l4,	%i3,	%i6
	sll	%o3,	0x1A,	%g1
	fsrc2	%f10,	%f8
	addccc	%i4,	0x0E4F,	%i7
	edge16	%i1,	%o5,	%o0
	subccc	%g4,	%g5,	%o7
	fmovsl	%icc,	%f31,	%f17
	movre	%l0,	%i0,	%g6
	movrlez	%l6,	0x12A,	%g3
	edge16n	%o6,	%i2,	%o4
	edge16l	%l5,	%o1,	%g7
	fmovrdlez	%g2,	%f22,	%f20
	andncc	%o2,	%i5,	%l2
	popc	0x1127,	%l3
	stb	%l4,	[%l7 + 0x0B]
	edge16l	%l1,	%i3,	%o3
	fmovsg	%icc,	%f8,	%f2
	sll	%g1,	%i6,	%i4
	fornot1	%f20,	%f0,	%f30
	movrne	%i1,	0x369,	%i7
	siam	0x4
	movpos	%icc,	%o5,	%o0
	sth	%g4,	[%l7 + 0x72]
	move	%icc,	%g5,	%l0
	movge	%icc,	%i0,	%o7
	sllx	%g6,	0x11,	%g3
	fzero	%f6
	add	%o6,	0x01C7,	%l6
	movneg	%icc,	%i2,	%l5
	alignaddr	%o4,	%g7,	%o1
	fmul8sux16	%f8,	%f24,	%f16
	movl	%icc,	%g2,	%o2
	fand	%f18,	%f28,	%f6
	fornot1s	%f7,	%f0,	%f9
	ld	[%l7 + 0x64],	%f23
	edge32n	%l2,	%i5,	%l3
	movleu	%icc,	%l1,	%i3
	edge8l	%l4,	%g1,	%i6
	umulcc	%o3,	0x10A8,	%i1
	movrgez	%i7,	0x17F,	%o5
	sdiv	%o0,	0x00B3,	%i4
	popc	0x0E9A,	%g4
	udivcc	%g5,	0x01F3,	%l0
	addccc	%i0,	0x14BA,	%g6
	addc	%g3,	0x0F42,	%o6
	smulcc	%l6,	%i2,	%l5
	movg	%xcc,	%o4,	%o7
	std	%f10,	[%l7 + 0x28]
	addccc	%o1,	%g2,	%g7
	sll	%l2,	0x10,	%i5
	ldd	[%l7 + 0x20],	%l2
	umul	%o2,	%i3,	%l4
	alignaddrl	%l1,	%g1,	%i6
	fmovsg	%icc,	%f1,	%f8
	srl	%i1,	0x12,	%i7
	sth	%o5,	[%l7 + 0x78]
	or	%o0,	0x0DEA,	%o3
	umul	%g4,	0x179A,	%g5
	or	%l0,	0x12E9,	%i4
	udivx	%i0,	0x12AE,	%g3
	movvc	%xcc,	%o6,	%l6
	movrne	%i2,	0x210,	%g6
	xnor	%l5,	0x1807,	%o7
	srax	%o1,	%o4,	%g7
	movgu	%icc,	%g2,	%l2
	move	%icc,	%i5,	%o2
	ldd	[%l7 + 0x20],	%i2
	fone	%f16
	fcmped	%fcc2,	%f10,	%f26
	move	%xcc,	%l4,	%l3
	mova	%icc,	%l1,	%g1
	movvc	%xcc,	%i1,	%i7
	movgu	%xcc,	%i6,	%o0
	andcc	%o3,	0x14C0,	%g4
	ldx	[%l7 + 0x20],	%g5
	sllx	%l0,	%i4,	%i0
	for	%f30,	%f14,	%f6
	fxnor	%f6,	%f4,	%f22
	xorcc	%o5,	0x11A4,	%g3
	addc	%o6,	%i2,	%l6
	fmovdg	%icc,	%f0,	%f21
	ldx	[%l7 + 0x20],	%l5
	xnorcc	%o7,	%g6,	%o4
	add	%g7,	0x1E95,	%o1
	smulcc	%l2,	0x1BE7,	%i5
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	mulx	%l3,	%l4,	%l1
	addcc	%g1,	%i1,	%i6
	udivx	%o0,	0x1EF1,	%o3
	movle	%icc,	%g4,	%i7
	orn	%l0,	0x11D8,	%g5
	subccc	%i0,	0x16C5,	%o5
	movrgz	%g3,	%i4,	%i2
	ldx	[%l7 + 0x60],	%o6
	addccc	%l5,	0x156E,	%l6
	array32	%o7,	%o4,	%g7
	fmovrdgez	%g6,	%f10,	%f28
	fmul8ulx16	%f2,	%f12,	%f6
	ldsb	[%l7 + 0x40],	%l2
	smulcc	%o1,	%i5,	%o2
	fmul8x16au	%f11,	%f14,	%f10
	xnor	%g2,	0x138E,	%l3
	sethi	0x12F2,	%i3
	fnegd	%f20,	%f4
	xorcc	%l1,	0x01BC,	%l4
	nop
	set	0x72, %o7
	ldsb	[%l7 + %o7],	%i1
	sra	%i6,	%o0,	%g1
	fmovdn	%xcc,	%f19,	%f19
	stb	%o3,	[%l7 + 0x50]
	orcc	%i7,	0x16C8,	%g4
	udivx	%l0,	0x1209,	%i0
	fandnot2s	%f16,	%f25,	%f4
	fmovsne	%icc,	%f9,	%f14
	mulscc	%o5,	%g5,	%g3
	stx	%i2,	[%l7 + 0x20]
	edge8n	%i4,	%l5,	%l6
	edge16n	%o7,	%o4,	%o6
	udivcc	%g7,	0x12F3,	%g6
	xnor	%l2,	0x0D1E,	%i5
	movle	%icc,	%o2,	%o1
	edge8l	%g2,	%i3,	%l3
	srlx	%l1,	0x0F,	%l4
	ldsh	[%l7 + 0x3E],	%i1
	edge16ln	%o0,	%i6,	%g1
	lduw	[%l7 + 0x0C],	%i7
	sdivcc	%g4,	0x17D3,	%l0
	movcc	%xcc,	%i0,	%o3
	sdivx	%o5,	0x1C41,	%g3
	andn	%g5,	%i2,	%i4
	fnegs	%f11,	%f26
	movgu	%xcc,	%l6,	%o7
	srlx	%l5,	0x10,	%o4
	movg	%icc,	%g7,	%o6
	andn	%g6,	0x13E5,	%l2
	umul	%i5,	%o2,	%o1
	siam	0x3
	mova	%xcc,	%i3,	%g2
	udivcc	%l1,	0x131F,	%l3
	subcc	%l4,	0x0D9D,	%i1
	and	%i6,	0x0AAD,	%g1
	srl	%i7,	%o0,	%l0
	orn	%g4,	0x0C72,	%i0
	xorcc	%o3,	0x03CC,	%o5
	lduw	[%l7 + 0x24],	%g3
	stb	%g5,	[%l7 + 0x52]
	orcc	%i4,	0x1DA1,	%i2
	movrgez	%o7,	%l5,	%l6
	srax	%o4,	0x0A,	%o6
	stb	%g7,	[%l7 + 0x32]
	umulcc	%g6,	%i5,	%o2
	sth	%o1,	[%l7 + 0x2E]
	movvs	%icc,	%l2,	%g2
	srl	%l1,	%l3,	%l4
	edge32l	%i1,	%i3,	%g1
	fcmpgt16	%f20,	%f16,	%i7
	fcmpne16	%f16,	%f16,	%i6
	sll	%o0,	%g4,	%i0
	fcmpes	%fcc3,	%f25,	%f17
	stx	%o3,	[%l7 + 0x38]
	andcc	%o5,	%l0,	%g5
	movrlez	%i4,	0x3EB,	%g3
	sll	%i2,	%l5,	%l6
	fcmpes	%fcc2,	%f10,	%f0
	edge8ln	%o7,	%o6,	%o4
	edge8	%g6,	%i5,	%o2
	smul	%g7,	%l2,	%g2
	lduw	[%l7 + 0x74],	%o1
	fabsd	%f20,	%f0
	movpos	%icc,	%l1,	%l4
	udivcc	%l3,	0x1B8C,	%i3
	fornot2s	%f13,	%f15,	%f20
	lduh	[%l7 + 0x36],	%i1
	movre	%i7,	0x146,	%i6
	restore %o0, 0x1CE0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i0,	%o3,	%o5
	movre	%l0,	0x2D4,	%g4
	edge8n	%g5,	%g3,	%i2
	fmovsvc	%xcc,	%f21,	%f30
	fmovrde	%l5,	%f28,	%f28
	movcs	%xcc,	%i4,	%o7
	sir	0x1BB6
	fmul8x16	%f23,	%f28,	%f2
	sethi	0x1CF4,	%l6
	ldd	[%l7 + 0x08],	%f10
	movl	%icc,	%o6,	%g6
	edge32n	%i5,	%o4,	%g7
	nop
	set	0x44, %l0
	ldsw	[%l7 + %l0],	%l2
	edge16n	%o2,	%g2,	%l1
	andcc	%l4,	%o1,	%i3
	subc	%i1,	0x0745,	%i7
	fmovsg	%icc,	%f12,	%f29
	ldsh	[%l7 + 0x64],	%l3
	udivx	%o0,	0x0D1B,	%g1
	movrgz	%i6,	0x1E9,	%i0
	fmuld8ulx16	%f22,	%f4,	%f4
	st	%f22,	[%l7 + 0x4C]
	fnegd	%f12,	%f26
	movrne	%o3,	%o5,	%g4
	fmul8x16	%f25,	%f2,	%f12
	addc	%g5,	0x1ED0,	%l0
	sdivx	%i2,	0x0F24,	%l5
	sethi	0x07AE,	%i4
	movne	%xcc,	%o7,	%l6
	fones	%f3
	sth	%g3,	[%l7 + 0x3A]
	addc	%o6,	0x1D06,	%g6
	edge8l	%o4,	%i5,	%l2
	fmovrdgez	%o2,	%f2,	%f28
	fsrc2s	%f28,	%f6
	addccc	%g7,	%g2,	%l1
	nop
	set	0x0C, %i2
	sth	%o1,	[%l7 + %i2]
	ldx	[%l7 + 0x58],	%l4
	udivcc	%i3,	0x13B1,	%i1
	smul	%l3,	0x05AC,	%o0
	smulcc	%g1,	%i6,	%i7
	alignaddr	%i0,	%o3,	%o5
	fcmpd	%fcc0,	%f2,	%f12
	fmovdneg	%icc,	%f13,	%f21
	and	%g5,	%g4,	%l0
	stw	%i2,	[%l7 + 0x5C]
	udivcc	%l5,	0x0FA0,	%o7
	st	%f7,	[%l7 + 0x78]
	array16	%i4,	%l6,	%o6
	bshuffle	%f10,	%f20,	%f30
	edge32	%g6,	%o4,	%g3
	lduw	[%l7 + 0x50],	%i5
	ldsw	[%l7 + 0x44],	%l2
	orncc	%g7,	%o2,	%l1
	udivcc	%o1,	0x110B,	%g2
	andncc	%l4,	%i1,	%i3
	mulx	%l3,	%g1,	%o0
	movpos	%icc,	%i6,	%i0
	movgu	%icc,	%i7,	%o5
	fcmpeq32	%f20,	%f8,	%g5
	sllx	%o3,	0x19,	%l0
	movpos	%xcc,	%i2,	%g4
	edge32	%o7,	%l5,	%l6
	edge16n	%i4,	%g6,	%o4
	sdivx	%o6,	0x08DE,	%g3
	fmovdl	%xcc,	%f27,	%f20
	ldsh	[%l7 + 0x60],	%i5
	movrne	%l2,	%o2,	%l1
	edge32l	%o1,	%g2,	%l4
	fabss	%f23,	%f16
	sdiv	%g7,	0x0F5C,	%i3
	smul	%l3,	0x15E8,	%i1
	alignaddr	%g1,	%o0,	%i6
	ldsw	[%l7 + 0x64],	%i0
	stw	%o5,	[%l7 + 0x14]
	fpadd32s	%f18,	%f2,	%f28
	edge8n	%g5,	%i7,	%l0
	fxors	%f0,	%f16,	%f3
	orcc	%o3,	0x128C,	%g4
	fmovrdlez	%i2,	%f8,	%f30
	fcmpgt16	%f8,	%f0,	%l5
	sth	%l6,	[%l7 + 0x4E]
	movge	%xcc,	%i4,	%g6
	edge32n	%o7,	%o4,	%o6
	andcc	%i5,	%g3,	%l2
	fornot1s	%f26,	%f25,	%f29
	udivcc	%o2,	0x053A,	%l1
	save %g2, %l4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o1,	%l3
	std	%f14,	[%l7 + 0x70]
	movn	%icc,	%i1,	%g1
	umulcc	%i3,	0x1998,	%i6
	fcmpeq16	%f10,	%f28,	%i0
	andcc	%o0,	0x0352,	%o5
	alignaddr	%g5,	%i7,	%l0
	ldsh	[%l7 + 0x38],	%g4
	udiv	%i2,	0x0577,	%o3
	fornot1	%f22,	%f8,	%f0
	fpadd16s	%f25,	%f6,	%f14
	ldd	[%l7 + 0x68],	%l4
	movge	%icc,	%l6,	%i4
	movle	%xcc,	%g6,	%o4
	st	%f15,	[%l7 + 0x1C]
	movcc	%icc,	%o7,	%i5
	fpsub32	%f22,	%f28,	%f20
	srl	%g3,	0x0D,	%o6
	edge32ln	%l2,	%o2,	%l1
	srax	%g2,	0x09,	%g7
	xor	%l4,	0x0518,	%o1
	edge16n	%i1,	%l3,	%i3
	edge16ln	%i6,	%g1,	%o0
	smul	%i0,	0x135E,	%g5
	stw	%i7,	[%l7 + 0x44]
	edge8ln	%l0,	%o5,	%g4
	fone	%f18
	fnegd	%f10,	%f30
	mulscc	%i2,	%o3,	%l5
	movvs	%icc,	%l6,	%i4
	movrlez	%o4,	0x116,	%o7
	edge32ln	%g6,	%g3,	%o6
	edge32	%l2,	%o2,	%l1
	for	%f4,	%f2,	%f10
	srlx	%i5,	0x17,	%g7
	fmovrde	%g2,	%f30,	%f26
	umulcc	%o1,	0x03DE,	%l4
	srl	%i1,	0x01,	%l3
	array8	%i3,	%g1,	%i6
	edge32n	%i0,	%g5,	%i7
	popc	%o0,	%l0
	udivcc	%o5,	0x11B0,	%g4
	sir	0x1D56
	fcmpeq32	%f0,	%f24,	%o3
	udiv	%i2,	0x1C20,	%l6
	edge32n	%i4,	%o4,	%l5
	subcc	%g6,	0x078D,	%g3
	array8	%o6,	%l2,	%o7
	fnors	%f11,	%f22,	%f15
	fmovdn	%xcc,	%f10,	%f21
	srl	%l1,	%i5,	%g7
	sdiv	%o2,	0x0E91,	%o1
	fandnot1	%f6,	%f0,	%f14
	ld	[%l7 + 0x64],	%f1
	sir	0x168A
	edge32l	%l4,	%i1,	%g2
	movrlez	%l3,	0x064,	%i3
	lduw	[%l7 + 0x74],	%g1
	fones	%f26
	fornot1s	%f23,	%f29,	%f18
	nop
	set	0x18, %o3
	ldsh	[%l7 + %o3],	%i6
	addcc	%g5,	0x12B9,	%i7
	movre	%i0,	0x1B2,	%o0
	stx	%o5,	[%l7 + 0x70]
	movcc	%xcc,	%l0,	%o3
	fpadd32s	%f7,	%f22,	%f4
	sub	%g4,	%i2,	%i4
	udivcc	%l6,	0x1F4D,	%o4
	ldd	[%l7 + 0x10],	%f12
	edge8	%l5,	%g6,	%o6
	movrlz	%g3,	%l2,	%o7
	udiv	%l1,	0x008B,	%i5
	fmovdvc	%xcc,	%f3,	%f7
	orn	%g7,	0x0B33,	%o1
	udivcc	%l4,	0x1DE7,	%o2
	edge16	%i1,	%l3,	%i3
	smul	%g2,	0x1F54,	%i6
	st	%f16,	[%l7 + 0x60]
	andncc	%g5,	%g1,	%i0
	mulscc	%i7,	%o5,	%o0
	fmul8ulx16	%f12,	%f10,	%f22
	umulcc	%o3,	%l0,	%g4
	mulscc	%i2,	0x184E,	%l6
	edge8	%i4,	%o4,	%g6
	move	%xcc,	%l5,	%o6
	srlx	%g3,	0x07,	%o7
	fpadd32	%f12,	%f2,	%f10
	fandnot2	%f14,	%f26,	%f30
	ld	[%l7 + 0x64],	%f18
	srl	%l1,	%i5,	%l2
	fmovsneg	%xcc,	%f23,	%f30
	movn	%xcc,	%o1,	%g7
	mova	%xcc,	%o2,	%l4
	subcc	%l3,	%i3,	%i1
	edge8n	%g2,	%g5,	%i6
	fnot2	%f26,	%f30
	movge	%xcc,	%g1,	%i7
	mulscc	%o5,	%i0,	%o0
	orn	%l0,	%o3,	%i2
	udivx	%g4,	0x0714,	%l6
	lduw	[%l7 + 0x24],	%i4
	edge8ln	%g6,	%o4,	%l5
	ldx	[%l7 + 0x68],	%o6
	fmovdge	%icc,	%f13,	%f28
	movvc	%xcc,	%o7,	%l1
	edge8	%g3,	%i5,	%o1
	fcmpgt32	%f10,	%f2,	%l2
	sir	0x0E52
	movg	%icc,	%g7,	%o2
	stw	%l4,	[%l7 + 0x74]
	movn	%xcc,	%i3,	%i1
	andn	%l3,	%g2,	%i6
	std	%f28,	[%l7 + 0x60]
	movcs	%icc,	%g5,	%g1
	fmovsne	%xcc,	%f16,	%f0
	xor	%o5,	0x15BA,	%i7
	smul	%o0,	%l0,	%o3
	edge32ln	%i2,	%g4,	%i0
	popc	%l6,	%g6
	addcc	%o4,	0x04B6,	%i4
	srlx	%l5,	0x1D,	%o7
	std	%f20,	[%l7 + 0x60]
	ldsh	[%l7 + 0x72],	%l1
	edge16n	%g3,	%i5,	%o1
	fmovdle	%xcc,	%f29,	%f10
	movvs	%icc,	%o6,	%l2
	udivx	%o2,	0x1B3F,	%g7
	srax	%i3,	0x1A,	%i1
	fmovrsgez	%l3,	%f9,	%f13
	fcmpd	%fcc3,	%f30,	%f28
	fnot2	%f22,	%f30
	sllx	%l4,	0x15,	%i6
	nop
	set	0x5C, %i0
	ldsh	[%l7 + %i0],	%g5
	xorcc	%g2,	%g1,	%o5
	array16	%i7,	%l0,	%o0
	add	%i2,	%o3,	%g4
	alignaddrl	%i0,	%l6,	%g6
	fmovrsgez	%i4,	%f30,	%f20
	fmovsa	%xcc,	%f1,	%f24
	fmovdcc	%xcc,	%f0,	%f31
	addccc	%l5,	0x13DE,	%o7
	movn	%xcc,	%o4,	%g3
	addc	%l1,	%i5,	%o1
	udivx	%o6,	0x17DC,	%l2
	subc	%o2,	0x18BB,	%i3
	udivx	%i1,	0x0533,	%g7
	movge	%xcc,	%l3,	%i6
	movvs	%icc,	%l4,	%g5
	edge8	%g1,	%o5,	%i7
	fmovrse	%g2,	%f25,	%f8
	fmovdcs	%xcc,	%f10,	%f27
	edge16n	%l0,	%i2,	%o0
	fors	%f14,	%f6,	%f3
	fxors	%f9,	%f21,	%f14
	subccc	%g4,	0x0D0A,	%i0
	xnor	%o3,	%g6,	%i4
	edge16n	%l6,	%o7,	%l5
	movvc	%xcc,	%o4,	%g3
	edge16l	%i5,	%o1,	%o6
	srax	%l2,	0x11,	%o2
	sll	%i3,	0x13,	%i1
	orncc	%g7,	0x050D,	%l1
	movge	%icc,	%i6,	%l4
	movl	%icc,	%g5,	%l3
	fmovrdlez	%g1,	%f28,	%f24
	udivx	%o5,	0x1274,	%i7
	mulx	%g2,	0x0F94,	%i2
	array32	%o0,	%g4,	%l0
	fones	%f28
	subccc	%o3,	%g6,	%i4
	fmovrslez	%i0,	%f25,	%f7
	nop
	set	0x52, %g2
	ldsh	[%l7 + %g2],	%l6
	fmul8sux16	%f14,	%f10,	%f2
	edge16	%o7,	%l5,	%g3
	subcc	%o4,	%o1,	%i5
	movne	%icc,	%l2,	%o2
	sllx	%i3,	0x1C,	%i1
	fmovrsne	%o6,	%f0,	%f17
	sub	%g7,	0x1DA8,	%i6
	lduh	[%l7 + 0x4C],	%l1
	edge32n	%l4,	%g5,	%l3
	mova	%xcc,	%o5,	%i7
	array8	%g1,	%g2,	%i2
	ldub	[%l7 + 0x2B],	%g4
	movrgez	%l0,	%o0,	%o3
	fpsub32s	%f0,	%f8,	%f29
	addccc	%g6,	0x17E5,	%i4
	and	%i0,	%o7,	%l5
	andn	%g3,	%o4,	%o1
	add	%i5,	0x042A,	%l6
	movle	%icc,	%o2,	%i3
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	movgu	%xcc,	%i6,	%g7
	movrlez	%l1,	%l4,	%l3
	array32	%g5,	%o5,	%i7
	save %g2, %g1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f0,	[%l7 + 0x58]
	fmovde	%icc,	%f8,	%f3
	edge32l	%l0,	%i2,	%o0
	st	%f27,	[%l7 + 0x7C]
	andncc	%g6,	%i4,	%o3
	fcmpgt32	%f28,	%f18,	%i0
	ldsw	[%l7 + 0x28],	%l5
	fcmple32	%f18,	%f22,	%g3
	fmovdpos	%xcc,	%f10,	%f3
	movrne	%o7,	%o4,	%o1
	edge8n	%i5,	%l6,	%i3
	fmovdvs	%icc,	%f17,	%f14
	array16	%l2,	%i1,	%o2
	stx	%o6,	[%l7 + 0x30]
	st	%f22,	[%l7 + 0x28]
	fpsub16	%f20,	%f22,	%f18
	ldsb	[%l7 + 0x3A],	%i6
	st	%f9,	[%l7 + 0x14]
	fcmpne16	%f10,	%f14,	%g7
	movge	%xcc,	%l4,	%l1
	fcmpes	%fcc3,	%f24,	%f21
	fpadd32	%f24,	%f20,	%f2
	addcc	%g5,	%l3,	%o5
	lduw	[%l7 + 0x78],	%i7
	st	%f27,	[%l7 + 0x3C]
	edge16	%g1,	%g2,	%g4
	srax	%l0,	0x02,	%i2
	lduw	[%l7 + 0x5C],	%g6
	fmovsleu	%xcc,	%f31,	%f28
	fcmpgt16	%f20,	%f24,	%o0
	stx	%o3,	[%l7 + 0x78]
	udiv	%i4,	0x0F40,	%i0
	srlx	%l5,	%o7,	%g3
	movle	%xcc,	%o1,	%i5
	ldd	[%l7 + 0x38],	%f26
	fpadd16s	%f0,	%f3,	%f6
	fcmpd	%fcc0,	%f12,	%f16
	std	%f24,	[%l7 + 0x30]
	sll	%o4,	%i3,	%l6
	smulcc	%l2,	0x0747,	%o2
	fmovdvs	%icc,	%f22,	%f28
	movvs	%xcc,	%i1,	%i6
	lduh	[%l7 + 0x16],	%o6
	umul	%g7,	%l1,	%g5
	fmovd	%f28,	%f2
	sllx	%l4,	%o5,	%i7
	udivx	%l3,	0x19E0,	%g2
	movrgez	%g1,	0x100,	%l0
	xor	%i2,	0x1B59,	%g6
	sth	%o0,	[%l7 + 0x1C]
	lduw	[%l7 + 0x7C],	%o3
	movrne	%i4,	0x1BD,	%i0
	sth	%g4,	[%l7 + 0x62]
	addccc	%l5,	0x0F6A,	%g3
	edge32	%o1,	%o7,	%o4
	srlx	%i5,	0x19,	%l6
	fmovsle	%icc,	%f30,	%f9
	movrlz	%l2,	%o2,	%i1
	fandnot2s	%f23,	%f19,	%f3
	subccc	%i6,	0x0643,	%i3
	stx	%g7,	[%l7 + 0x78]
	mulx	%o6,	0x1F17,	%l1
	addccc	%l4,	%o5,	%i7
	movn	%xcc,	%g5,	%g2
	orcc	%l3,	0x0561,	%l0
	fxnors	%f6,	%f9,	%f16
	mulscc	%i2,	%g1,	%o0
	ld	[%l7 + 0x10],	%f8
	edge16ln	%g6,	%o3,	%i0
	sethi	0x1808,	%i4
	fmovdne	%icc,	%f27,	%f7
	edge16	%l5,	%g3,	%o1
	edge32l	%o7,	%o4,	%g4
	sdiv	%l6,	0x106F,	%i5
	subc	%o2,	0x07D8,	%i1
	movg	%icc,	%l2,	%i3
	edge8ln	%g7,	%o6,	%l1
	edge32l	%l4,	%i6,	%o5
	mova	%icc,	%g5,	%g2
	nop
	set	0x75, %o0
	stb	%i7,	[%l7 + %o0]
	stw	%l0,	[%l7 + 0x24]
	movneg	%xcc,	%l3,	%g1
	sir	0x00C1
	mulscc	%i2,	0x0D4D,	%o0
	edge32	%g6,	%o3,	%i0
	addcc	%i4,	%g3,	%l5
	addcc	%o7,	0x0FC0,	%o1
	sdivcc	%o4,	0x1151,	%l6
	movrgz	%g4,	0x12A,	%o2
	sethi	0x031E,	%i5
	edge32	%i1,	%i3,	%g7
	restore %l2, 0x12A9, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f15,	%f10
	subc	%o6,	0x0EF7,	%i6
	ldsb	[%l7 + 0x7A],	%l4
	fsrc1	%f0,	%f12
	sra	%o5,	%g5,	%i7
	stw	%g2,	[%l7 + 0x40]
	smulcc	%l3,	%g1,	%i2
	edge32ln	%l0,	%g6,	%o0
	udivx	%o3,	0x0E5C,	%i4
	movvc	%xcc,	%i0,	%l5
	ld	[%l7 + 0x3C],	%f16
	movrgz	%g3,	0x113,	%o7
	orn	%o1,	0x00B4,	%l6
	movcc	%xcc,	%g4,	%o2
	fabsd	%f20,	%f4
	sll	%i5,	0x04,	%o4
	subcc	%i3,	%i1,	%g7
	ld	[%l7 + 0x7C],	%f13
	edge32ln	%l1,	%o6,	%i6
	movleu	%xcc,	%l2,	%o5
	movrlz	%l4,	%g5,	%i7
	srax	%g2,	%l3,	%i2
	movvs	%xcc,	%g1,	%g6
	fmovrdlz	%o0,	%f12,	%f26
	bshuffle	%f4,	%f26,	%f12
	smulcc	%l0,	0x02DA,	%i4
	array16	%o3,	%i0,	%g3
	addcc	%o7,	%o1,	%l5
	or	%g4,	%l6,	%i5
	fmuld8ulx16	%f24,	%f4,	%f24
	andcc	%o2,	%o4,	%i3
	movne	%xcc,	%i1,	%l1
	ldub	[%l7 + 0x15],	%o6
	movl	%icc,	%i6,	%l2
	fpmerge	%f12,	%f11,	%f8
	movrgz	%g7,	%l4,	%g5
	movrgez	%i7,	%g2,	%l3
	xnorcc	%o5,	%g1,	%i2
	array16	%g6,	%o0,	%i4
	mova	%icc,	%l0,	%o3
	edge8n	%i0,	%o7,	%g3
	addcc	%o1,	0x1859,	%g4
	fmovscc	%xcc,	%f22,	%f31
	xnor	%l6,	0x0FCC,	%l5
	sdivx	%o2,	0x0188,	%i5
	srlx	%i3,	%i1,	%o4
	sdivcc	%o6,	0x1BA6,	%i6
	sethi	0x15F9,	%l1
	fmovsn	%icc,	%f3,	%f24
	ldsw	[%l7 + 0x44],	%g7
	sth	%l4,	[%l7 + 0x42]
	move	%icc,	%g5,	%l2
	addc	%i7,	0x1642,	%l3
	fmovrsgz	%o5,	%f26,	%f22
	fmovscs	%icc,	%f16,	%f23
	edge32n	%g1,	%i2,	%g2
	udivcc	%o0,	0x1F94,	%g6
	move	%xcc,	%i4,	%o3
	udivcc	%i0,	0x0454,	%l0
	movrgez	%o7,	0x19C,	%g3
	fcmpgt32	%f14,	%f4,	%o1
	popc	0x18BF,	%l6
	umulcc	%l5,	%g4,	%i5
	srl	%i3,	%o2,	%o4
	fmovsa	%xcc,	%f16,	%f31
	smul	%i1,	%o6,	%l1
	fmul8ulx16	%f18,	%f6,	%f10
	subcc	%g7,	%i6,	%l4
	edge16	%g5,	%i7,	%l3
	save %o5, 0x1C5C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i2,	0x13B4,	%g2
	andn	%o0,	0x1796,	%g6
	movrgz	%i4,	%l2,	%o3
	fandnot1s	%f11,	%f5,	%f16
	sll	%l0,	%o7,	%i0
	movneg	%xcc,	%o1,	%g3
	movrgez	%l5,	0x380,	%g4
	ldsw	[%l7 + 0x34],	%i5
	movrgez	%i3,	0x145,	%o2
	movn	%xcc,	%o4,	%i1
	sdivcc	%o6,	0x13B1,	%l1
	mulscc	%g7,	0x1998,	%l6
	smulcc	%l4,	%g5,	%i7
	array16	%i6,	%o5,	%l3
	fmul8x16al	%f25,	%f12,	%f28
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fsrc1	%f18,	%f18
	sdivcc	%o0,	0x0B5C,	%g6
	ld	[%l7 + 0x30],	%f26
	orn	%i2,	%i4,	%l2
	edge32n	%o3,	%l0,	%o7
	movn	%icc,	%o1,	%g3
	addc	%i0,	0x0CB5,	%g4
	lduh	[%l7 + 0x48],	%l5
	movre	%i5,	%i3,	%o2
	movrlez	%o4,	%i1,	%l1
	edge16	%o6,	%l6,	%l4
	xnor	%g7,	%i7,	%g5
	movleu	%xcc,	%o5,	%i6
	popc	%l3,	%g1
	srl	%g2,	%g6,	%o0
	smul	%i4,	%l2,	%i2
	fcmps	%fcc2,	%f26,	%f11
	movrlez	%l0,	%o3,	%o1
	umul	%g3,	%i0,	%g4
	fmovrsne	%l5,	%f14,	%f31
	ldsb	[%l7 + 0x5A],	%o7
	edge8	%i3,	%i5,	%o2
	subcc	%i1,	0x0CC6,	%o4
	sllx	%o6,	%l1,	%l4
	udiv	%l6,	0x0D98,	%i7
	fmovdcc	%xcc,	%f6,	%f10
	andn	%g5,	%o5,	%g7
	fone	%f20
	fcmped	%fcc0,	%f24,	%f28
	umul	%l3,	%i6,	%g2
	sir	0x088B
	edge8ln	%g6,	%g1,	%i4
	edge8	%o0,	%l2,	%i2
	edge32ln	%o3,	%o1,	%l0
	sir	0x0138
	fone	%f10
	addcc	%g3,	0x0DA8,	%g4
	udivx	%l5,	0x0939,	%o7
	mulscc	%i3,	0x077F,	%i0
	xnor	%i5,	%o2,	%o4
	fmovsge	%icc,	%f20,	%f26
	stx	%i1,	[%l7 + 0x18]
	ldd	[%l7 + 0x68],	%l0
	fmovdpos	%icc,	%f9,	%f1
	edge32n	%o6,	%l6,	%l4
	sth	%i7,	[%l7 + 0x0C]
	srlx	%o5,	%g5,	%l3
	nop
	set	0x25, %i7
	ldub	[%l7 + %i7],	%i6
	smulcc	%g2,	0x047D,	%g6
	save %g7, 0x1FAE, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x23],	%g1
	movrgz	%o0,	0x077,	%l2
	sllx	%i2,	%o3,	%o1
	fcmpne32	%f30,	%f22,	%l0
	movcs	%xcc,	%g3,	%g4
	subc	%l5,	0x1AC0,	%i3
	movn	%icc,	%i0,	%o7
	orn	%i5,	%o4,	%i1
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%l1
	smul	%o6,	%l6,	%o2
	movg	%icc,	%i7,	%l4
	movrgz	%o5,	%l3,	%i6
	edge32l	%g5,	%g6,	%g7
	nop
	set	0x62, %o1
	sth	%g2,	[%l7 + %o1]
	orncc	%i4,	0x0726,	%o0
	edge8l	%l2,	%g1,	%o3
	fpsub32s	%f20,	%f4,	%f13
	addcc	%o1,	%i2,	%l0
	sth	%g4,	[%l7 + 0x72]
	edge32n	%g3,	%l5,	%i3
	or	%o7,	0x0F14,	%i5
	fmovs	%f5,	%f30
	fmovscs	%xcc,	%f19,	%f6
	ldub	[%l7 + 0x2D],	%i0
	andcc	%o4,	0x1C82,	%l1
	fmovsvc	%icc,	%f9,	%f28
	orcc	%i1,	0x1C14,	%l6
	ldub	[%l7 + 0x3A],	%o6
	mulx	%i7,	%o2,	%o5
	movrlz	%l3,	%l4,	%i6
	add	%g6,	%g5,	%g7
	srlx	%i4,	%o0,	%l2
	movrgez	%g1,	0x264,	%o3
	sdivcc	%g2,	0x1646,	%i2
	movcc	%xcc,	%o1,	%g4
	edge8	%g3,	%l5,	%i3
	edge32	%o7,	%i5,	%i0
	fandnot2	%f2,	%f0,	%f28
	andcc	%l0,	%l1,	%o4
	sethi	0x1989,	%l6
	movl	%icc,	%o6,	%i7
	sdiv	%o2,	0x0911,	%o5
	addcc	%i1,	0x0B63,	%l3
	fxors	%f17,	%f28,	%f11
	orcc	%l4,	0x027F,	%g6
	ldx	[%l7 + 0x10],	%i6
	fpadd16s	%f18,	%f6,	%f24
	subc	%g5,	%i4,	%g7
	popc	0x15DF,	%l2
	xor	%g1,	0x1FBB,	%o0
	edge8ln	%g2,	%o3,	%i2
	ldsh	[%l7 + 0x14],	%o1
	fmovse	%xcc,	%f21,	%f28
	edge8n	%g3,	%l5,	%i3
	orcc	%g4,	%o7,	%i5
	movrne	%i0,	%l0,	%l1
	xor	%l6,	0x02A3,	%o6
	srl	%i7,	0x07,	%o4
	movrgz	%o5,	%i1,	%o2
	fmovrsne	%l3,	%f17,	%f18
	fzero	%f2
	movn	%icc,	%l4,	%g6
	movvc	%xcc,	%i6,	%g5
	addc	%g7,	0x1425,	%l2
	and	%i4,	0x1103,	%g1
	mova	%icc,	%g2,	%o0
	popc	0x1522,	%i2
	movrgz	%o3,	0x2AB,	%g3
	fmovse	%xcc,	%f21,	%f9
	movrgz	%l5,	%i3,	%o1
	movg	%xcc,	%g4,	%i5
	bshuffle	%f8,	%f22,	%f12
	ldsb	[%l7 + 0x15],	%i0
	movrlz	%o7,	%l0,	%l1
	edge16l	%l6,	%i7,	%o4
	edge32	%o6,	%o5,	%o2
	sub	%i1,	%l4,	%l3
	fmovrsgz	%i6,	%f21,	%f30
	edge8	%g6,	%g7,	%l2
	ldsw	[%l7 + 0x14],	%g5
	sdivcc	%g1,	0x1699,	%i4
	sdivcc	%g2,	0x06FF,	%i2
	faligndata	%f10,	%f16,	%f14
	movrlez	%o0,	0x3A0,	%g3
	pdist	%f18,	%f8,	%f20
	sllx	%o3,	0x00,	%i3
	andncc	%l5,	%o1,	%g4
	edge8	%i5,	%o7,	%l0
	fmovsleu	%icc,	%f21,	%f2
	nop
	set	0x68, %o5
	stw	%i0,	[%l7 + %o5]
	alignaddrl	%l6,	%l1,	%i7
	fpadd32s	%f25,	%f21,	%f6
	edge16	%o6,	%o4,	%o5
	srlx	%o2,	0x08,	%l4
	edge32	%l3,	%i1,	%g6
	sdivx	%g7,	0x0AF4,	%l2
	move	%icc,	%i6,	%g1
	fmovdl	%icc,	%f28,	%f0
	mulscc	%g5,	0x08F9,	%g2
	movl	%icc,	%i2,	%o0
	fsrc2	%f0,	%f30
	fornot1	%f16,	%f30,	%f30
	edge16	%g3,	%o3,	%i3
	movn	%xcc,	%l5,	%i4
	ldub	[%l7 + 0x3F],	%o1
	ldx	[%l7 + 0x40],	%i5
	array16	%o7,	%g4,	%l0
	srax	%i0,	0x0E,	%l6
	movneg	%xcc,	%l1,	%o6
	srlx	%o4,	%i7,	%o2
	movgu	%xcc,	%l4,	%o5
	movrgz	%i1,	0x2B4,	%g6
	fmovsvc	%xcc,	%f29,	%f18
	umul	%l3,	%g7,	%l2
	fornot1	%f12,	%f22,	%f12
	umul	%i6,	%g1,	%g2
	st	%f28,	[%l7 + 0x2C]
	fmovd	%f26,	%f20
	fpack32	%f0,	%f16,	%f30
	srax	%i2,	0x1E,	%g5
	alignaddrl	%g3,	%o0,	%o3
	smulcc	%i3,	0x0F2B,	%l5
	movl	%icc,	%o1,	%i4
	movrgez	%i5,	0x00E,	%o7
	movgu	%xcc,	%l0,	%g4
	nop
	set	0x35, %l6
	ldub	[%l7 + %l6],	%i0
	fcmpes	%fcc2,	%f14,	%f14
	sdivcc	%l1,	0x035F,	%l6
	lduh	[%l7 + 0x50],	%o6
	or	%i7,	%o4,	%o2
	andncc	%l4,	%o5,	%i1
	xorcc	%g6,	%l3,	%g7
	edge16ln	%i6,	%g1,	%l2
	sir	0x15E8
	fandnot1s	%f23,	%f22,	%f8
	udivx	%g2,	0x16EF,	%i2
	fmovdleu	%icc,	%f4,	%f22
	faligndata	%f22,	%f4,	%f4
	fornot2	%f10,	%f0,	%f16
	addcc	%g5,	%o0,	%g3
	movgu	%xcc,	%i3,	%l5
	movrgez	%o1,	%i4,	%i5
	movvs	%icc,	%o3,	%o7
	fcmpne16	%f2,	%f30,	%g4
	movrne	%l0,	%l1,	%l6
	movrgez	%i0,	%o6,	%i7
	mulscc	%o2,	0x018E,	%l4
	fmul8ulx16	%f26,	%f22,	%f28
	orcc	%o4,	%o5,	%g6
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%i0
	fnot2	%f4,	%f18
	edge32l	%l3,	%i6,	%g7
	sll	%g1,	0x00,	%g2
	fcmps	%fcc3,	%f11,	%f15
	fmuld8sux16	%f26,	%f15,	%f16
	xor	%i2,	%l2,	%o0
	mulscc	%g3,	0x1BED,	%g5
	movneg	%xcc,	%i3,	%o1
	fmovdneg	%xcc,	%f17,	%f4
	edge32ln	%i4,	%l5,	%o3
	movrlez	%o7,	%i5,	%l0
	fandnot1s	%f20,	%f21,	%f29
	subccc	%g4,	0x1BB7,	%l6
	array8	%l1,	%o6,	%i7
	xnor	%o2,	%i0,	%o4
	movre	%l4,	%g6,	%i1
	movrlez	%l3,	%o5,	%g7
	fmovsne	%xcc,	%f17,	%f19
	fmovsvc	%xcc,	%f2,	%f8
	fornot2s	%f16,	%f7,	%f9
	stw	%g1,	[%l7 + 0x1C]
	stb	%i6,	[%l7 + 0x46]
	movrgez	%g2,	0x1AD,	%l2
	ldd	[%l7 + 0x78],	%o0
	addc	%i2,	%g3,	%g5
	edge8	%o1,	%i4,	%i3
	movrne	%l5,	0x273,	%o7
	sra	%i5,	%o3,	%g4
	fnegs	%f4,	%f8
	edge16ln	%l0,	%l6,	%l1
	movcc	%icc,	%i7,	%o2
	fmovdleu	%xcc,	%f10,	%f20
	faligndata	%f6,	%f12,	%f18
	sdiv	%i0,	0x053D,	%o6
	st	%f17,	[%l7 + 0x28]
	array8	%l4,	%o4,	%g6
	movge	%xcc,	%l3,	%i1
	fpsub16s	%f9,	%f20,	%f27
	sdivcc	%g7,	0x06D7,	%g1
	lduh	[%l7 + 0x52],	%i6
	sethi	0x0CFB,	%g2
	edge32l	%o5,	%o0,	%i2
	fcmple32	%f18,	%f14,	%g3
	fabsd	%f16,	%f20
	ldsw	[%l7 + 0x3C],	%l2
	edge32	%o1,	%g5,	%i4
	fornot1s	%f13,	%f14,	%f3
	save %l5, %o7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f29,	%f6
	fxors	%f0,	%f2,	%f12
	ldsh	[%l7 + 0x70],	%o3
	movvs	%icc,	%g4,	%l0
	edge32l	%l6,	%l1,	%i7
	sdivx	%o2,	0x0467,	%i0
	edge16ln	%o6,	%l4,	%i5
	srl	%o4,	%g6,	%l3
	fpadd16	%f26,	%f12,	%f18
	fandnot1	%f30,	%f6,	%f2
	movn	%icc,	%i1,	%g7
	xor	%g1,	%i6,	%o5
	srl	%o0,	0x02,	%g2
	edge8ln	%i2,	%g3,	%l2
	movcc	%xcc,	%o1,	%i4
	umulcc	%l5,	%o7,	%i3
	fmovrsgez	%g5,	%f4,	%f2
	edge8l	%o3,	%g4,	%l6
	mulx	%l1,	%i7,	%l0
	movge	%icc,	%i0,	%o6
	udiv	%o2,	0x12E7,	%l4
	andncc	%i5,	%o4,	%g6
	fornot1	%f16,	%f8,	%f26
	ld	[%l7 + 0x64],	%f5
	addcc	%l3,	%i1,	%g1
	add	%i6,	0x13A9,	%o5
	sir	0x1CF8
	movge	%icc,	%o0,	%g7
	fmovdvs	%icc,	%f1,	%f30
	ld	[%l7 + 0x68],	%f7
	restore %i2, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f14,	%f1,	%f0
	xnorcc	%o1,	%l2,	%l5
	movrlz	%i4,	0x2FA,	%o7
	fpsub32	%f2,	%f30,	%f2
	movgu	%xcc,	%i3,	%o3
	sra	%g4,	%l6,	%g5
	subc	%i7,	0x0FA8,	%l1
	umul	%i0,	%o6,	%l0
	sub	%o2,	0x18D3,	%i5
	sra	%o4,	0x0F,	%l4
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	array32	%i6,	%o5,	%g1
	array8	%g7,	%o0,	%i2
	add	%g3,	0x18C9,	%g2
	movpos	%icc,	%o1,	%l2
	sethi	0x0C0B,	%i4
	bshuffle	%f16,	%f20,	%f4
	sth	%l5,	[%l7 + 0x36]
	fpmerge	%f9,	%f16,	%f8
	edge8l	%i3,	%o3,	%o7
	edge16l	%g4,	%g5,	%i7
	mulscc	%l6,	%l1,	%i0
	fmovde	%icc,	%f19,	%f25
	fmovscs	%icc,	%f26,	%f4
	subccc	%l0,	0x078B,	%o2
	addcc	%o6,	%o4,	%i5
	sethi	0x17AD,	%g6
	fmovsvc	%icc,	%f2,	%f25
	std	%f24,	[%l7 + 0x78]
	fsrc1	%f24,	%f22
	movgu	%xcc,	%i1,	%l4
	popc	0x1650,	%l3
	subccc	%o5,	0x1E52,	%i6
	movn	%icc,	%g7,	%o0
	mulx	%i2,	%g1,	%g3
	sdiv	%g2,	0x1DBA,	%o1
	and	%l2,	0x1C9F,	%i4
	array16	%l5,	%i3,	%o7
	xorcc	%g4,	%g5,	%o3
	andn	%l6,	%l1,	%i0
	fxor	%f4,	%f30,	%f16
	fornot1s	%f11,	%f12,	%f13
	orn	%l0,	%i7,	%o6
	mova	%xcc,	%o4,	%o2
	addcc	%g6,	0x1957,	%i5
	fmovdcc	%xcc,	%f11,	%f27
	fmovdvc	%icc,	%f31,	%f10
	save %l4, 0x12F5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i1,	0x08D8,	%o5
	fmuld8ulx16	%f29,	%f21,	%f4
	stx	%g7,	[%l7 + 0x10]
	fmovdne	%xcc,	%f22,	%f5
	fpsub32s	%f9,	%f16,	%f27
	edge32n	%o0,	%i2,	%g1
	fmovsleu	%xcc,	%f30,	%f0
	mova	%xcc,	%i6,	%g2
	subcc	%o1,	0x0322,	%l2
	sdivx	%g3,	0x023C,	%l5
	movle	%icc,	%i4,	%i3
	srl	%g4,	%g5,	%o3
	array32	%o7,	%l1,	%l6
	movg	%icc,	%i0,	%l0
	lduw	[%l7 + 0x50],	%i7
	edge32n	%o6,	%o2,	%g6
	movre	%i5,	%o4,	%l4
	mulx	%l3,	%i1,	%o5
	movneg	%xcc,	%g7,	%i2
	fmovsne	%xcc,	%f8,	%f25
	fpsub16s	%f24,	%f10,	%f14
	fnand	%f0,	%f12,	%f22
	sra	%o0,	%i6,	%g1
	array32	%o1,	%g2,	%l2
	fcmpne16	%f0,	%f30,	%g3
	fmovsl	%icc,	%f17,	%f6
	st	%f15,	[%l7 + 0x1C]
	restore %l5, 0x15A5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i3,	0x0AD5,	%g5
	sdivcc	%o3,	0x0FF1,	%g4
	umul	%o7,	%l6,	%l1
	addccc	%i0,	%i7,	%o6
	srax	%o2,	0x15,	%l0
	edge8n	%g6,	%o4,	%l4
	mova	%xcc,	%i5,	%l3
	move	%icc,	%o5,	%g7
	movneg	%xcc,	%i1,	%o0
	fmovsne	%icc,	%f23,	%f27
	sub	%i2,	0x0624,	%g1
	edge16l	%i6,	%g2,	%o1
	movcs	%icc,	%l2,	%l5
	and	%g3,	%i3,	%g5
	movne	%icc,	%i4,	%g4
	xnor	%o3,	%l6,	%o7
	movrgez	%i0,	0x206,	%i7
	sub	%o6,	%l1,	%o2
	umulcc	%g6,	0x10CB,	%l0
	udivcc	%o4,	0x1442,	%l4
	andn	%l3,	0x1A2D,	%i5
	sdivcc	%g7,	0x0EDC,	%i1
	fmul8x16	%f14,	%f2,	%f12
	movrne	%o0,	0x10D,	%o5
	ldsh	[%l7 + 0x74],	%i2
	or	%g1,	%g2,	%i6
	fpack16	%f20,	%f11
	movleu	%xcc,	%l2,	%o1
	movg	%xcc,	%l5,	%g3
	srax	%g5,	0x08,	%i4
	stw	%i3,	[%l7 + 0x4C]
	fand	%f30,	%f18,	%f4
	edge16ln	%o3,	%l6,	%g4
	fpack32	%f0,	%f30,	%f12
	fmovse	%xcc,	%f9,	%f29
	sra	%i0,	0x01,	%o7
	move	%xcc,	%i7,	%o6
	subc	%o2,	0x1177,	%l1
	sth	%l0,	[%l7 + 0x36]
	movvc	%xcc,	%o4,	%l4
	edge8	%g6,	%i5,	%g7
	ldub	[%l7 + 0x59],	%l3
	sethi	0x10EF,	%o0
	srl	%o5,	0x08,	%i1
	st	%f14,	[%l7 + 0x30]
	movl	%xcc,	%i2,	%g2
	fpack16	%f28,	%f17
	srlx	%g1,	%l2,	%i6
	ld	[%l7 + 0x28],	%f5
	sdiv	%o1,	0x1A25,	%g3
	subccc	%g5,	%i4,	%l5
	movpos	%icc,	%o3,	%i3
	sth	%l6,	[%l7 + 0x34]
	movl	%xcc,	%i0,	%o7
	addc	%i7,	0x1392,	%o6
	movg	%xcc,	%o2,	%g4
	orncc	%l0,	0x11D6,	%l1
	andncc	%l4,	%o4,	%i5
	sub	%g7,	0x1229,	%g6
	fmovs	%f20,	%f25
	fmul8x16al	%f30,	%f6,	%f0
	edge16l	%l3,	%o5,	%o0
	fcmped	%fcc2,	%f24,	%f28
	ldub	[%l7 + 0x3B],	%i1
	fnot1s	%f5,	%f6
	fxor	%f6,	%f20,	%f8
	stx	%g2,	[%l7 + 0x08]
	fabsd	%f18,	%f4
	sth	%i2,	[%l7 + 0x18]
	popc	0x02ED,	%l2
	edge8	%g1,	%i6,	%o1
	orn	%g3,	0x1701,	%g5
	fmuld8sux16	%f24,	%f12,	%f20
	orn	%l5,	0x1823,	%o3
	ldsw	[%l7 + 0x4C],	%i4
	fmovsne	%icc,	%f14,	%f7
	udivx	%l6,	0x0567,	%i3
	array16	%i0,	%o7,	%i7
	ldx	[%l7 + 0x18],	%o2
	andn	%o6,	0x150A,	%l0
	movvs	%xcc,	%g4,	%l1
	edge16	%l4,	%i5,	%g7
	andncc	%o4,	%l3,	%g6
	ldsb	[%l7 + 0x30],	%o5
	fmovdgu	%xcc,	%f20,	%f4
	move	%icc,	%i1,	%g2
	fcmpgt16	%f20,	%f26,	%o0
	movg	%xcc,	%i2,	%l2
	ldd	[%l7 + 0x78],	%g0
	fmul8ulx16	%f6,	%f6,	%f8
	stx	%i6,	[%l7 + 0x10]
	add	%g3,	0x01A6,	%o1
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%l4
	movre	%g5,	0x3E9,	%i4
	alignaddrl	%o3,	%i3,	%l6
	movvs	%icc,	%o7,	%i7
	movcc	%xcc,	%i0,	%o6
	std	%f26,	[%l7 + 0x70]
	edge16	%l0,	%g4,	%o2
	movcc	%icc,	%l4,	%l1
	edge8l	%g7,	%i5,	%l3
	fxors	%f30,	%f21,	%f24
	udivcc	%o4,	0x17EB,	%g6
	fmovsge	%icc,	%f5,	%f6
	alignaddrl	%i1,	%g2,	%o5
	fxnor	%f10,	%f0,	%f2
	fpadd32s	%f13,	%f0,	%f5
	add	%i2,	0x008F,	%l2
	st	%f16,	[%l7 + 0x7C]
	fmovsvs	%icc,	%f30,	%f19
	xor	%g1,	0x15AC,	%i6
	ld	[%l7 + 0x4C],	%f8
	ldub	[%l7 + 0x24],	%g3
	ldd	[%l7 + 0x28],	%o0
	fones	%f19
	nop
	set	0x40, %i5
	lduh	[%l7 + %i5],	%o0
	edge32l	%g5,	%i4,	%o3
	movrgez	%l5,	%i3,	%o7
	orn	%i7,	%i0,	%l6
	sethi	0x10C0,	%o6
	ldub	[%l7 + 0x3D],	%g4
	smul	%l0,	%l4,	%o2
	edge8n	%l1,	%i5,	%l3
	sub	%g7,	0x15A0,	%g6
	udivx	%i1,	0x1651,	%g2
	fmovrdne	%o4,	%f22,	%f20
	fmovdvs	%icc,	%f19,	%f26
	edge16n	%i2,	%o5,	%l2
	movcc	%icc,	%i6,	%g1
	movvc	%icc,	%o1,	%g3
	alignaddrl	%o0,	%i4,	%g5
	lduw	[%l7 + 0x3C],	%o3
	andn	%i3,	0x064D,	%o7
	movge	%icc,	%i7,	%l5
	fnot2	%f10,	%f4
	smulcc	%l6,	%i0,	%g4
	orncc	%o6,	0x0A50,	%l4
	fnot2s	%f24,	%f30
	sth	%o2,	[%l7 + 0x5E]
	sth	%l0,	[%l7 + 0x38]
	sll	%l1,	%l3,	%g7
	fmovsa	%icc,	%f31,	%f11
	edge32l	%i5,	%i1,	%g6
	alignaddr	%g2,	%i2,	%o4
	movle	%icc,	%l2,	%i6
	pdist	%f14,	%f20,	%f2
	sllx	%o5,	%o1,	%g1
	udiv	%g3,	0x05DC,	%i4
	fmovrdlez	%g5,	%f24,	%f26
	array32	%o0,	%o3,	%o7
	movgu	%xcc,	%i7,	%l5
	lduw	[%l7 + 0x54],	%l6
	xor	%i0,	%g4,	%o6
	movgu	%icc,	%l4,	%o2
	movne	%xcc,	%i3,	%l1
	smul	%l3,	%l0,	%i5
	fornot1s	%f20,	%f10,	%f25
	popc	0x0157,	%i1
	subcc	%g6,	0x1847,	%g7
	orcc	%g2,	0x1148,	%i2
	addc	%l2,	%i6,	%o5
	st	%f27,	[%l7 + 0x28]
	sir	0x0E70
	or	%o1,	0x107A,	%g1
	fmovs	%f0,	%f9
	lduh	[%l7 + 0x62],	%g3
	stb	%o4,	[%l7 + 0x63]
	movvs	%icc,	%g5,	%o0
	st	%f23,	[%l7 + 0x74]
	save %i4, %o3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0C0F,	%l5
	movrlz	%i7,	0x373,	%i0
	addcc	%l6,	%o6,	%l4
	sdivx	%o2,	0x0B49,	%g4
	edge32n	%i3,	%l3,	%l1
	std	%f2,	[%l7 + 0x68]
	umulcc	%i5,	0x1243,	%i1
	orcc	%g6,	%l0,	%g2
	ldsb	[%l7 + 0x31],	%g7
	popc	%l2,	%i2
	edge8	%o5,	%i6,	%g1
	lduw	[%l7 + 0x18],	%g3
	nop
	set	0x14, %o4
	ldub	[%l7 + %o4],	%o4
	sdivcc	%g5,	0x0FCD,	%o0
	sllx	%i4,	0x13,	%o3
	xor	%o1,	0x00DE,	%l5
	edge16l	%o7,	%i0,	%l6
	fabss	%f18,	%f15
	and	%i7,	0x117D,	%l4
	subccc	%o6,	0x14DD,	%g4
	array8	%i3,	%o2,	%l1
	edge8	%i5,	%i1,	%g6
	udivx	%l3,	0x0CDC,	%g2
	sir	0x1610
	umulcc	%g7,	0x0BAE,	%l0
	sth	%i2,	[%l7 + 0x54]
	andncc	%o5,	%l2,	%i6
	stb	%g3,	[%l7 + 0x10]
	umulcc	%o4,	%g5,	%o0
	ldsh	[%l7 + 0x7E],	%g1
	movrne	%o3,	0x2F2,	%o1
	umulcc	%i4,	0x05DC,	%l5
	xorcc	%o7,	0x1DC2,	%l6
	orcc	%i7,	0x036B,	%i0
	lduw	[%l7 + 0x34],	%l4
	fmovdvs	%xcc,	%f25,	%f9
	edge32l	%g4,	%i3,	%o2
	orcc	%o6,	%i5,	%l1
	fmovspos	%icc,	%f23,	%f12
	lduh	[%l7 + 0x54],	%g6
	udiv	%l3,	0x01FB,	%i1
	orcc	%g2,	%g7,	%l0
	edge32l	%o5,	%l2,	%i2
	movrgz	%g3,	%i6,	%g5
	fmovrdne	%o4,	%f12,	%f14
	array16	%g1,	%o0,	%o3
	sethi	0x1730,	%i4
	ldx	[%l7 + 0x70],	%o1
	movleu	%icc,	%o7,	%l5
	movne	%icc,	%l6,	%i7
	fmovsa	%xcc,	%f10,	%f26
	alignaddr	%i0,	%l4,	%i3
	movcs	%icc,	%g4,	%o6
	fpsub16s	%f9,	%f11,	%f11
	sll	%o2,	0x14,	%i5
	xnorcc	%g6,	%l3,	%l1
	udivcc	%i1,	0x145C,	%g2
	ldd	[%l7 + 0x58],	%f12
	srax	%l0,	%o5,	%g7
	popc	0x0A34,	%l2
	fcmpgt16	%f26,	%f12,	%i2
	popc	%i6,	%g5
	srax	%o4,	%g1,	%o0
	movvc	%xcc,	%o3,	%i4
	popc	0x0FB7,	%o1
	alignaddrl	%g3,	%o7,	%l6
	array8	%l5,	%i7,	%i0
	fands	%f3,	%f15,	%f4
	edge32n	%l4,	%g4,	%i3
	movcc	%xcc,	%o6,	%i5
	st	%f28,	[%l7 + 0x64]
	lduw	[%l7 + 0x14],	%o2
	fmovdpos	%xcc,	%f5,	%f24
	fmovsneg	%xcc,	%f30,	%f31
	mova	%icc,	%l3,	%g6
	fpadd16s	%f22,	%f24,	%f24
	popc	0x0AEF,	%l1
	edge32n	%g2,	%l0,	%i1
	sra	%g7,	%o5,	%i2
	ldsb	[%l7 + 0x22],	%l2
	subcc	%g5,	0x05FD,	%i6
	stw	%g1,	[%l7 + 0x70]
	movpos	%icc,	%o0,	%o3
	movvs	%xcc,	%o4,	%o1
	fmovrdne	%i4,	%f20,	%f8
	alignaddr	%g3,	%l6,	%l5
	xnor	%i7,	0x1BE9,	%i0
	movrne	%l4,	0x3A7,	%g4
	fmovsgu	%icc,	%f15,	%f14
	ldd	[%l7 + 0x58],	%f6
	fzero	%f22
	mulscc	%o7,	%o6,	%i5
	andncc	%i3,	%l3,	%g6
	umul	%o2,	0x061B,	%l1
	movpos	%icc,	%l0,	%g2
	edge8	%i1,	%g7,	%o5
	fpadd32	%f0,	%f16,	%f30
	xnor	%l2,	0x164C,	%g5
	edge16	%i6,	%g1,	%i2
	fmovspos	%icc,	%f17,	%f25
	orn	%o0,	0x0593,	%o3
	ldd	[%l7 + 0x68],	%f10
	movrne	%o1,	%o4,	%g3
	movrlz	%i4,	%l5,	%l6
	st	%f0,	[%l7 + 0x7C]
	fors	%f25,	%f29,	%f2
	sll	%i7,	0x14,	%l4
	movcs	%icc,	%g4,	%i0
	sra	%o7,	0x0B,	%i5
	stw	%i3,	[%l7 + 0x74]
	subccc	%o6,	0x03AA,	%l3
	addc	%g6,	0x0635,	%o2
	srax	%l0,	0x0C,	%g2
	orcc	%l1,	%g7,	%o5
	mulx	%l2,	0x09B0,	%g5
	sra	%i1,	%i6,	%g1
	addccc	%i2,	0x045F,	%o3
	fornot2s	%f18,	%f5,	%f23
	subcc	%o1,	0x0285,	%o4
	add	%g3,	0x1AA3,	%o0
	subc	%i4,	%l5,	%i7
	edge32ln	%l4,	%g4,	%i0
	udivcc	%o7,	0x1666,	%i5
	edge8n	%l6,	%i3,	%l3
	orn	%o6,	%o2,	%g6
	movcc	%xcc,	%l0,	%l1
	fmovrslz	%g2,	%f22,	%f30
	ldx	[%l7 + 0x50],	%g7
	sdiv	%o5,	0x0F5A,	%g5
	fabsd	%f12,	%f28
	fornot2	%f12,	%f12,	%f26
	subccc	%i1,	%i6,	%l2
	orncc	%g1,	0x17DD,	%i2
	stb	%o1,	[%l7 + 0x64]
	andcc	%o3,	%o4,	%g3
	ldsh	[%l7 + 0x50],	%i4
	ldub	[%l7 + 0x2B],	%o0
	xor	%i7,	0x19E5,	%l5
	movrne	%g4,	%l4,	%o7
	sdivcc	%i5,	0x005E,	%i0
	fsrc2s	%f22,	%f10
	popc	%i3,	%l6
	xorcc	%l3,	0x1C82,	%o2
	fxors	%f13,	%f18,	%f17
	movle	%xcc,	%o6,	%g6
	fmovrdlez	%l1,	%f6,	%f30
	movcs	%xcc,	%g2,	%g7
	movpos	%icc,	%o5,	%l0
	st	%f8,	[%l7 + 0x64]
	movrgez	%i1,	%g5,	%l2
	fandnot1	%f0,	%f4,	%f6
	xnorcc	%i6,	0x1F6D,	%g1
	fxnors	%f0,	%f11,	%f23
	fmovrdlz	%i2,	%f22,	%f0
	array32	%o1,	%o4,	%o3
	srax	%i4,	0x19,	%g3
	fmovrdgz	%o0,	%f0,	%f24
	fnands	%f8,	%f14,	%f23
	ldd	[%l7 + 0x28],	%f18
	lduh	[%l7 + 0x64],	%i7
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x28],	%l4
	ldsh	[%l7 + 0x52],	%g4
	add	%i5,	0x0D4E,	%i0
	fnand	%f16,	%f12,	%f30
	ldd	[%l7 + 0x68],	%o6
	movrlz	%l6,	0x3FE,	%l3
	edge16	%i3,	%o6,	%g6
	edge16ln	%l1,	%g2,	%g7
	save %o2, 0x163E, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o5,	%i1,	%g5
	orcc	%i6,	%g1,	%l2
	fmovdn	%xcc,	%f21,	%f4
	andncc	%i2,	%o1,	%o3
	movcc	%xcc,	%i4,	%g3
	ldsh	[%l7 + 0x5C],	%o4
	srl	%i7,	0x1E,	%l5
	fpadd32s	%f1,	%f12,	%f20
	nop
	set	0x58, %l3
	ldub	[%l7 + %l3],	%o0
	fornot1	%f10,	%f18,	%f18
	lduw	[%l7 + 0x14],	%l4
	alignaddrl	%i5,	%g4,	%o7
	alignaddr	%l6,	%l3,	%i0
	fornot2	%f10,	%f6,	%f28
	fand	%f14,	%f0,	%f8
	srax	%o6,	%g6,	%l1
	movneg	%icc,	%i3,	%g2
	sdivx	%o2,	0x0456,	%g7
	movcc	%icc,	%l0,	%i1
	movvc	%xcc,	%g5,	%o5
	array32	%g1,	%l2,	%i2
	fpsub32s	%f24,	%f23,	%f9
	fmovsvs	%xcc,	%f9,	%f18
	pdist	%f30,	%f4,	%f16
	sdiv	%i6,	0x1461,	%o3
	andcc	%i4,	0x0B81,	%o1
	movl	%xcc,	%o4,	%i7
	edge8ln	%l5,	%o0,	%l4
	fmovdleu	%xcc,	%f21,	%f9
	sll	%i5,	%g4,	%o7
	subccc	%l6,	0x0576,	%l3
	movcc	%xcc,	%g3,	%i0
	fzeros	%f8
	xnorcc	%o6,	0x0232,	%l1
	faligndata	%f20,	%f28,	%f28
	sdiv	%g6,	0x17F5,	%i3
	or	%g2,	0x0B1E,	%o2
	movrne	%l0,	0x0EC,	%i1
	edge8n	%g7,	%o5,	%g1
	sdivcc	%l2,	0x17CE,	%i2
	movneg	%xcc,	%g5,	%i6
	fcmpd	%fcc1,	%f0,	%f28
	fnot1s	%f13,	%f14
	movre	%i4,	0x172,	%o3
	fmovrsne	%o1,	%f7,	%f2
	umulcc	%o4,	0x0CBF,	%i7
	edge32n	%l5,	%l4,	%i5
	fmovsne	%xcc,	%f21,	%f13
	movvs	%icc,	%g4,	%o7
	alignaddrl	%l6,	%o0,	%g3
	orn	%l3,	%i0,	%o6
	movcs	%xcc,	%l1,	%g6
	subc	%g2,	%i3,	%l0
	fmovrdgez	%i1,	%f8,	%f18
	save %o2, %g7, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f26,	%f20,	%f16
	xnor	%o5,	%l2,	%i2
	stw	%g5,	[%l7 + 0x5C]
	or	%i6,	0x0342,	%o3
	nop
	set	0x30, %l4
	lduw	[%l7 + %l4],	%o1
	movge	%icc,	%o4,	%i7
	sethi	0x010F,	%i4
	movcs	%icc,	%l5,	%i5
	mulscc	%l4,	0x0C27,	%g4
	fmovde	%icc,	%f21,	%f5
	fnegs	%f18,	%f4
	fpsub16	%f26,	%f0,	%f20
	fpack16	%f4,	%f7
	umul	%l6,	0x1876,	%o7
	fzeros	%f31
	siam	0x1
	edge16ln	%o0,	%l3,	%i0
	sir	0x0537
	ldx	[%l7 + 0x18],	%o6
	fmul8x16au	%f31,	%f26,	%f26
	fmovd	%f2,	%f14
	fsrc2	%f4,	%f28
	sth	%g3,	[%l7 + 0x46]
	movrlz	%g6,	0x059,	%g2
	sir	0x0E7E
	movcs	%icc,	%i3,	%l1
	std	%f18,	[%l7 + 0x10]
	movn	%icc,	%l0,	%i1
	siam	0x1
	umulcc	%g7,	%g1,	%o5
	sub	%o2,	0x0BD7,	%l2
	save %i2, %i6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o1,	%o3,	%i7
	xnor	%i4,	%l5,	%o4
	umulcc	%l4,	0x1F84,	%g4
	and	%i5,	%o7,	%l6
	srax	%l3,	%i0,	%o6
	move	%xcc,	%g3,	%g6
	movcc	%xcc,	%o0,	%i3
	array32	%g2,	%l0,	%i1
	mulscc	%l1,	0x14A1,	%g7
	edge32l	%o5,	%o2,	%l2
	sir	0x06E6
	stw	%i2,	[%l7 + 0x78]
	array32	%g1,	%g5,	%o1
	smul	%i6,	%i7,	%i4
	edge16	%l5,	%o4,	%l4
	fcmpne32	%f16,	%f20,	%o3
	fmovdne	%xcc,	%f31,	%f24
	edge32l	%i5,	%o7,	%g4
	fmul8ulx16	%f8,	%f8,	%f26
	srl	%l3,	0x04,	%l6
	mulscc	%i0,	0x06D5,	%o6
	udiv	%g6,	0x0AA6,	%g3
	edge32l	%o0,	%i3,	%g2
	fcmple16	%f6,	%f28,	%i1
	movrlz	%l0,	%l1,	%g7
	sdivcc	%o5,	0x1F8C,	%l2
	smulcc	%i2,	%o2,	%g5
	fpsub32s	%f27,	%f17,	%f22
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%g1
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%i6
	stx	%o1,	[%l7 + 0x50]
	ldsb	[%l7 + 0x7A],	%i4
	fcmple16	%f0,	%f14,	%i7
	xor	%l5,	%o4,	%o3
	stx	%l4,	[%l7 + 0x20]
	sethi	0x08E0,	%i5
	edge8l	%o7,	%g4,	%l3
	fmul8ulx16	%f14,	%f0,	%f2
	fmovrslz	%i0,	%f15,	%f0
	movleu	%icc,	%l6,	%g6
	movge	%icc,	%g3,	%o0
	fornot1s	%f14,	%f14,	%f5
	movneg	%icc,	%o6,	%i3
	movg	%icc,	%g2,	%l0
	orncc	%l1,	0x01BF,	%g7
	movge	%xcc,	%i1,	%l2
	xorcc	%o5,	%o2,	%i2
	subccc	%g5,	0x1ECD,	%g1
	fnands	%f5,	%f2,	%f23
	srax	%o1,	%i4,	%i7
	fmovs	%f24,	%f26
	fnand	%f20,	%f2,	%f20
	alignaddr	%i6,	%o4,	%o3
	movvs	%xcc,	%l5,	%l4
	addc	%o7,	%i5,	%g4
	add	%i0,	%l6,	%g6
	andncc	%l3,	%g3,	%o6
	edge8l	%i3,	%g2,	%l0
	move	%xcc,	%o0,	%l1
	movrgz	%g7,	0x20E,	%i1
	addcc	%o5,	%l2,	%o2
	subc	%i2,	0x1F76,	%g1
	udivx	%g5,	0x0D08,	%i4
	umulcc	%i7,	%i6,	%o4
	fnegd	%f12,	%f24
	movn	%icc,	%o3,	%o1
	ldsb	[%l7 + 0x3E],	%l4
	edge16n	%l5,	%i5,	%o7
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	sdiv	%g6,	0x095F,	%l3
	fpmerge	%f3,	%f22,	%f24
	save %g3, %o6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	%o0,	%l1
	fmovrdlz	%g7,	%f6,	%f6
	movcs	%xcc,	%i1,	%l0
	nop
	set	0x68, %l5
	ldsw	[%l7 + %l5],	%o5
	srlx	%l2,	%o2,	%g1
	edge8n	%i2,	%g5,	%i4
	edge8l	%i6,	%o4,	%o3
	siam	0x7
	lduw	[%l7 + 0x6C],	%o1
	siam	0x4
	edge8	%l4,	%i7,	%i5
	movl	%icc,	%o7,	%g4
	addccc	%l6,	%i0,	%l5
	save %l3, 0x123C, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o6,	0x247,	%g6
	fones	%f2
	edge32n	%g2,	%o0,	%i3
	udiv	%l1,	0x1E3B,	%g7
	subccc	%i1,	%o5,	%l2
	fexpand	%f19,	%f28
	alignaddr	%o2,	%g1,	%l0
	movgu	%xcc,	%i2,	%g5
	alignaddrl	%i6,	%o4,	%i4
	for	%f14,	%f12,	%f8
	fexpand	%f26,	%f26
	restore %o1, 0x0C21, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f24,	%f2
	add	%l4,	0x1A1F,	%i5
	edge32n	%i7,	%g4,	%l6
	andn	%i0,	%o7,	%l5
	andcc	%l3,	0x1A15,	%o6
	sub	%g3,	%g2,	%g6
	sllx	%i3,	0x1B,	%o0
	fmovrdgez	%l1,	%f8,	%f10
	fornot1s	%f0,	%f2,	%f21
	sub	%g7,	%i1,	%l2
	add	%o2,	0x0198,	%o5
	movcs	%xcc,	%g1,	%l0
	stx	%i2,	[%l7 + 0x10]
	edge8ln	%i6,	%o4,	%g5
	sub	%i4,	0x0AD7,	%o1
	movne	%icc,	%l4,	%o3
	mulx	%i5,	%g4,	%i7
	movn	%icc,	%l6,	%o7
	movne	%icc,	%i0,	%l3
	sra	%o6,	%g3,	%l5
	fnand	%f8,	%f4,	%f16
	movre	%g2,	%g6,	%o0
	movle	%icc,	%l1,	%g7
	movrgez	%i3,	0x392,	%l2
	movcs	%xcc,	%o2,	%i1
	edge16l	%o5,	%g1,	%i2
	smul	%i6,	0x09AB,	%o4
	sdivx	%g5,	0x176B,	%i4
	ldub	[%l7 + 0x24],	%l0
	edge16l	%l4,	%o1,	%o3
	movl	%xcc,	%g4,	%i5
	fcmpd	%fcc3,	%f0,	%f18
	sra	%i7,	%l6,	%i0
	edge8	%o7,	%o6,	%g3
	sethi	0x076C,	%l5
	ldsw	[%l7 + 0x70],	%l3
	umul	%g6,	%g2,	%l1
	andn	%o0,	%g7,	%i3
	edge32	%l2,	%o2,	%i1
	lduw	[%l7 + 0x20],	%o5
	subc	%i2,	%i6,	%g1
	alignaddr	%g5,	%o4,	%l0
	fmovrdlz	%l4,	%f26,	%f8
	movpos	%icc,	%i4,	%o3
	add	%o1,	%i5,	%g4
	orn	%i7,	%l6,	%i0
	udivx	%o7,	0x0E9A,	%o6
	move	%xcc,	%l5,	%g3
	fpsub16s	%f3,	%f18,	%f11
	edge32l	%l3,	%g2,	%l1
	fmovrse	%o0,	%f19,	%f28
	movrlz	%g6,	%g7,	%i3
	fmul8sux16	%f8,	%f24,	%f8
	subc	%l2,	%o2,	%o5
	fnot2s	%f27,	%f21
	fpsub32s	%f7,	%f8,	%f15
	lduh	[%l7 + 0x30],	%i2
	fones	%f18
	sdivx	%i6,	0x1E0E,	%g1
	fmovdcs	%xcc,	%f19,	%f30
	fpsub16	%f4,	%f14,	%f28
	fandnot1	%f12,	%f30,	%f30
	addcc	%i1,	%o4,	%g5
	fmovsa	%icc,	%f25,	%f4
	andn	%l0,	%l4,	%o3
	fpack16	%f20,	%f25
	movpos	%xcc,	%i4,	%o1
	fsrc1s	%f0,	%f13
	movg	%xcc,	%i5,	%i7
	xorcc	%l6,	0x1A81,	%g4
	subc	%o7,	%i0,	%o6
	xorcc	%l5,	0x1C1B,	%g3
	srax	%l3,	%l1,	%o0
	fcmps	%fcc3,	%f22,	%f30
	movleu	%xcc,	%g6,	%g7
	edge32	%i3,	%l2,	%o2
	ldsh	[%l7 + 0x26],	%o5
	fmovdcc	%xcc,	%f28,	%f19
	and	%i2,	%i6,	%g1
	fnot1s	%f20,	%f18
	movcc	%icc,	%g2,	%i1
	std	%f14,	[%l7 + 0x40]
	umul	%o4,	0x0F2B,	%l0
	ldsw	[%l7 + 0x18],	%l4
	mulx	%o3,	%g5,	%o1
	fnegs	%f22,	%f30
	edge8l	%i4,	%i5,	%i7
	lduw	[%l7 + 0x14],	%g4
	fmul8x16	%f21,	%f24,	%f8
	edge8ln	%l6,	%i0,	%o6
	umulcc	%l5,	%g3,	%o7
	orncc	%l1,	0x0CD3,	%o0
	andncc	%g6,	%l3,	%i3
	umul	%g7,	0x18FA,	%l2
	udivx	%o5,	0x0431,	%o2
	edge32ln	%i6,	%g1,	%i2
	udivx	%g2,	0x1081,	%o4
	xor	%l0,	%i1,	%o3
	movpos	%icc,	%g5,	%l4
	xorcc	%i4,	0x100B,	%i5
	save %i7, 0x06F9, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f20,	%f26
	sdiv	%l6,	0x149C,	%g4
	subc	%i0,	0x0FA9,	%o6
	edge16ln	%l5,	%g3,	%l1
	st	%f1,	[%l7 + 0x1C]
	popc	%o0,	%g6
	ldsb	[%l7 + 0x34],	%o7
	ldub	[%l7 + 0x64],	%l3
	fmovspos	%icc,	%f5,	%f1
	and	%i3,	%l2,	%g7
	fcmpd	%fcc3,	%f16,	%f20
	sllx	%o2,	%i6,	%o5
	fornot1s	%f19,	%f14,	%f24
	orcc	%g1,	%i2,	%o4
	ld	[%l7 + 0x48],	%f8
	fmovsn	%icc,	%f25,	%f15
	edge8n	%g2,	%i1,	%o3
	orn	%g5,	%l0,	%i4
	xnorcc	%l4,	%i5,	%o1
	std	%f8,	[%l7 + 0x50]
	addcc	%i7,	%l6,	%g4
	array32	%o6,	%i0,	%g3
	fexpand	%f17,	%f16
	edge32n	%l1,	%l5,	%g6
	stb	%o7,	[%l7 + 0x36]
	fpadd16s	%f10,	%f17,	%f15
	movcs	%xcc,	%o0,	%i3
	movrlz	%l3,	0x183,	%g7
	addcc	%l2,	0x0734,	%o2
	movcc	%icc,	%i6,	%g1
	fpmerge	%f15,	%f12,	%f24
	array32	%o5,	%o4,	%g2
	nop
	set	0x5E, %i1
	lduh	[%l7 + %i1],	%i2
	siam	0x5
	fcmpne32	%f10,	%f30,	%o3
	edge32	%g5,	%i1,	%i4
	fxnors	%f3,	%f22,	%f12
	movg	%icc,	%l4,	%i5
	movle	%icc,	%l0,	%i7
	fmovscs	%icc,	%f12,	%f2
	fpadd32	%f4,	%f18,	%f10
	lduw	[%l7 + 0x74],	%l6
	movcc	%xcc,	%o1,	%g4
	alignaddr	%o6,	%i0,	%l1
	std	%f26,	[%l7 + 0x78]
	udivx	%g3,	0x0227,	%g6
	fpackfix	%f22,	%f26
	fmovrse	%o7,	%f5,	%f7
	movle	%icc,	%o0,	%i3
	fmovdl	%icc,	%f15,	%f7
	movl	%icc,	%l3,	%l5
	edge32n	%l2,	%g7,	%o2
	fnand	%f18,	%f8,	%f20
	movpos	%xcc,	%i6,	%o5
	fpmerge	%f13,	%f26,	%f24
	movrlez	%o4,	0x006,	%g2
	fandnot2	%f24,	%f14,	%f30
	subccc	%g1,	%o3,	%i2
	edge32n	%i1,	%g5,	%l4
	fcmped	%fcc3,	%f24,	%f4
	fpadd16s	%f5,	%f12,	%f5
	xnorcc	%i4,	0x1F8D,	%i5
	movleu	%icc,	%l0,	%l6
	srlx	%o1,	0x14,	%i7
	edge8	%g4,	%o6,	%i0
	edge16ln	%l1,	%g3,	%o7
	edge32ln	%o0,	%i3,	%g6
	smulcc	%l3,	%l2,	%l5
	sub	%g7,	%o2,	%o5
	array8	%i6,	%g2,	%g1
	alignaddrl	%o4,	%i2,	%i1
	ldd	[%l7 + 0x68],	%f6
	xnorcc	%g5,	0x00C5,	%l4
	movvc	%icc,	%o3,	%i5
	sethi	0x1410,	%l0
	fnor	%f2,	%f24,	%f26
	movrgz	%i4,	0x3D4,	%l6
	orn	%o1,	0x18D9,	%i7
	ldub	[%l7 + 0x47],	%g4
	sth	%o6,	[%l7 + 0x0E]
	andcc	%l1,	%g3,	%i0
	faligndata	%f22,	%f6,	%f24
	movg	%icc,	%o7,	%i3
	sdiv	%g6,	0x13EE,	%o0
	move	%xcc,	%l2,	%l3
	popc	%l5,	%o2
	sth	%o5,	[%l7 + 0x3C]
	movl	%icc,	%g7,	%i6
	movrne	%g1,	0x119,	%o4
	xorcc	%g2,	0x1EB4,	%i1
	movge	%xcc,	%i2,	%g5
	fnegd	%f12,	%f24
	ldd	[%l7 + 0x78],	%l4
	movre	%i5,	0x302,	%o3
	andncc	%l0,	%l6,	%i4
	movge	%icc,	%i7,	%g4
	udivx	%o1,	0x141C,	%l1
	add	%o6,	0x0BFE,	%i0
	sdivx	%g3,	0x01CF,	%i3
	sdivcc	%g6,	0x0867,	%o0
	stx	%o7,	[%l7 + 0x30]
	ldsh	[%l7 + 0x70],	%l3
	sdiv	%l2,	0x0FFD,	%o2
	smulcc	%o5,	0x0907,	%g7
	movcs	%xcc,	%l5,	%g1
	edge32	%o4,	%i6,	%i1
	ldd	[%l7 + 0x78],	%g2
	addccc	%g5,	0x13DD,	%i2
	movvc	%xcc,	%i5,	%l4
	movrlez	%o3,	%l0,	%i4
	edge32	%i7,	%l6,	%g4
	ldsw	[%l7 + 0x28],	%o1
	alignaddr	%o6,	%i0,	%l1
	andcc	%i3,	%g6,	%g3
	fmovdl	%icc,	%f18,	%f11
	andcc	%o0,	0x0ECC,	%o7
	orncc	%l3,	%l2,	%o2
	std	%f26,	[%l7 + 0x40]
	fnand	%f8,	%f18,	%f26
	movleu	%icc,	%o5,	%g7
	edge32	%l5,	%o4,	%g1
	move	%icc,	%i1,	%i6
	sllx	%g5,	0x06,	%i2
	fmovde	%xcc,	%f31,	%f1
	udiv	%i5,	0x180F,	%l4
	fmovrdne	%g2,	%f20,	%f2
	movl	%xcc,	%l0,	%o3
	stb	%i7,	[%l7 + 0x4F]
	movg	%icc,	%i4,	%g4
	udivx	%l6,	0x1732,	%o6
	udivx	%i0,	0x0A17,	%o1
	edge32	%i3,	%g6,	%g3
	xnor	%o0,	0x17CA,	%o7
	edge32l	%l1,	%l2,	%l3
	ldsh	[%l7 + 0x46],	%o5
	fmovsg	%xcc,	%f26,	%f23
	fcmpgt16	%f0,	%f30,	%g7
	movleu	%icc,	%l5,	%o2
	move	%xcc,	%g1,	%i1
	ldx	[%l7 + 0x60],	%i6
	fmovdcs	%xcc,	%f25,	%f20
	edge8n	%g5,	%o4,	%i5
	ldsb	[%l7 + 0x77],	%i2
	edge32ln	%g2,	%l0,	%l4
	fmul8sux16	%f28,	%f22,	%f16
	st	%f26,	[%l7 + 0x38]
	movn	%icc,	%o3,	%i4
	xnor	%i7,	0x1A61,	%l6
	movle	%xcc,	%g4,	%i0
	stw	%o6,	[%l7 + 0x4C]
	movcc	%xcc,	%i3,	%g6
	mulscc	%o1,	0x1635,	%g3
	edge16l	%o7,	%o0,	%l2
	smul	%l3,	%l1,	%o5
	andcc	%g7,	%o2,	%l5
	edge32	%i1,	%i6,	%g1
	fmovrdlz	%o4,	%f28,	%f28
	movvs	%xcc,	%i5,	%g5
	xnorcc	%g2,	0x1C96,	%i2
	stw	%l0,	[%l7 + 0x14]
	orcc	%l4,	%i4,	%o3
	movre	%l6,	%i7,	%i0
	move	%icc,	%o6,	%g4
	ldx	[%l7 + 0x60],	%g6
	edge16	%i3,	%g3,	%o1
	ldd	[%l7 + 0x18],	%o0
	edge32l	%l2,	%o7,	%l1
	subccc	%o5,	%g7,	%o2
	mulscc	%l3,	%l5,	%i1
	addccc	%g1,	0x18B4,	%o4
	xor	%i5,	%i6,	%g2
	move	%xcc,	%i2,	%l0
	ldsh	[%l7 + 0x26],	%g5
	stb	%l4,	[%l7 + 0x41]
	subc	%i4,	%l6,	%o3
	fsrc1	%f10,	%f12
	fmuld8sux16	%f7,	%f7,	%f0
	mulx	%i7,	%o6,	%g4
	sir	0x070B
	ldx	[%l7 + 0x48],	%g6
	fpack16	%f26,	%f1
	movrgz	%i3,	%g3,	%o1
	andcc	%i0,	0x19DD,	%o0
	movrgz	%o7,	%l2,	%l1
	ldub	[%l7 + 0x7B],	%g7
	movrgez	%o5,	0x20A,	%o2
	ldsh	[%l7 + 0x34],	%l5
	fpadd32	%f12,	%f10,	%f4
	edge16l	%i1,	%l3,	%o4
	ldsb	[%l7 + 0x3B],	%i5
	alignaddrl	%g1,	%g2,	%i6
	movge	%xcc,	%i2,	%l0
	fpsub16s	%f16,	%f13,	%f2
	sra	%l4,	0x1F,	%g5
	movrlez	%i4,	0x2D6,	%o3
	stx	%i7,	[%l7 + 0x70]
	stx	%o6,	[%l7 + 0x20]
	edge16l	%l6,	%g4,	%i3
	movpos	%icc,	%g6,	%g3
	fzero	%f4
	fors	%f13,	%f4,	%f11
	move	%icc,	%o1,	%i0
	alignaddr	%o7,	%l2,	%o0
	sethi	0x1457,	%g7
	sra	%o5,	0x1F,	%o2
	sllx	%l5,	0x13,	%i1
	std	%f6,	[%l7 + 0x70]
	sdiv	%l1,	0x0400,	%o4
	movge	%xcc,	%i5,	%l3
	alignaddr	%g2,	%g1,	%i6
	fzero	%f16
	movrne	%l0,	0x14E,	%l4
	fornot1s	%f28,	%f12,	%f15
	srl	%g5,	%i2,	%o3
	fmovsn	%icc,	%f3,	%f25
	xnor	%i7,	%o6,	%i4
	movrlez	%l6,	0x0AF,	%g4
	ldd	[%l7 + 0x58],	%i2
	edge32ln	%g6,	%g3,	%i0
	pdist	%f2,	%f24,	%f20
	fmovdl	%xcc,	%f7,	%f22
	lduw	[%l7 + 0x6C],	%o7
	stb	%l2,	[%l7 + 0x5B]
	lduh	[%l7 + 0x70],	%o0
	movpos	%icc,	%g7,	%o5
	array16	%o2,	%o1,	%i1
	movgu	%xcc,	%l1,	%l5
	movvs	%icc,	%i5,	%l3
	mulscc	%o4,	%g1,	%g2
	movl	%icc,	%i6,	%l4
	movleu	%xcc,	%g5,	%i2
	smul	%l0,	0x055E,	%o3
	fornot1	%f6,	%f8,	%f4
	addc	%o6,	0x1892,	%i4
	movneg	%xcc,	%i7,	%g4
	st	%f0,	[%l7 + 0x44]
	move	%xcc,	%i3,	%g6
	ldx	[%l7 + 0x68],	%g3
	movrgez	%l6,	%i0,	%o7
	popc	%l2,	%o0
	smulcc	%o5,	%g7,	%o2
	udivx	%i1,	0x01AB,	%l1
	srlx	%l5,	%o1,	%l3
	fmovs	%f1,	%f21
	movcc	%xcc,	%i5,	%o4
	ldsb	[%l7 + 0x1D],	%g2
	addcc	%i6,	%l4,	%g5
	fmovdvs	%xcc,	%f22,	%f1
	fmovdvs	%icc,	%f31,	%f17
	smulcc	%g1,	%l0,	%o3
	addc	%i2,	%o6,	%i7
	stx	%i4,	[%l7 + 0x28]
	movvc	%xcc,	%i3,	%g4
	popc	0x1A9E,	%g3
	lduh	[%l7 + 0x52],	%g6
	movg	%xcc,	%l6,	%i0
	movl	%icc,	%l2,	%o0
	sdivx	%o5,	0x1BBD,	%o7
	sth	%g7,	[%l7 + 0x7A]
	fornot2	%f12,	%f12,	%f16
	orncc	%o2,	0x06DC,	%l1
	orcc	%l5,	%i1,	%o1
	fcmpgt16	%f8,	%f8,	%i5
	movcs	%icc,	%l3,	%g2
	movrlez	%i6,	%o4,	%g5
	edge8ln	%g1,	%l4,	%o3
	udiv	%l0,	0x15C6,	%i2
	sir	0x006E
	fpmerge	%f11,	%f31,	%f6
	fcmpgt32	%f28,	%f8,	%o6
	lduw	[%l7 + 0x58],	%i7
	movgu	%icc,	%i3,	%i4
	smul	%g4,	0x07C9,	%g3
	array8	%l6,	%g6,	%i0
	fmovsleu	%icc,	%f26,	%f11
	edge16n	%o0,	%l2,	%o5
	fmovrsgz	%g7,	%f0,	%f3
	edge16ln	%o2,	%l1,	%o7
	udiv	%i1,	0x0AC3,	%l5
	andcc	%i5,	%o1,	%l3
	edge8n	%i6,	%g2,	%g5
	movle	%xcc,	%o4,	%l4
	fcmpgt16	%f26,	%f6,	%o3
	stw	%g1,	[%l7 + 0x14]
	stw	%i2,	[%l7 + 0x5C]
	movn	%xcc,	%o6,	%i7
	fmovse	%xcc,	%f4,	%f30
	movre	%i3,	0x0F4,	%i4
	ldd	[%l7 + 0x40],	%g4
	fzero	%f22
	fzeros	%f26
	xor	%l0,	0x1CB3,	%l6
	sdivcc	%g3,	0x1A92,	%g6
	movl	%xcc,	%i0,	%l2
	sethi	0x00F5,	%o5
	and	%g7,	0x00B4,	%o0
	edge32	%o2,	%o7,	%i1
	fpack32	%f2,	%f12,	%f14
	fandnot1	%f12,	%f4,	%f24
	st	%f2,	[%l7 + 0x24]
	nop
	set	0x1F, %o2
	stb	%l5,	[%l7 + %o2]
	fmovdcs	%icc,	%f27,	%f0
	add	%i5,	%o1,	%l3
	movg	%icc,	%i6,	%g2
	fornot2	%f0,	%f26,	%f4
	umulcc	%l1,	0x0BC3,	%g5
	fsrc2	%f8,	%f2
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%o4
	movl	%icc,	%l4,	%o3
	fmovrde	%g1,	%f0,	%f22
	fmovsneg	%xcc,	%f1,	%f29
	addc	%i2,	%i7,	%i3
	fnand	%f12,	%f26,	%f14
	stw	%i4,	[%l7 + 0x60]
	xorcc	%o6,	0x05C0,	%l0
	xorcc	%l6,	%g4,	%g3
	udivcc	%g6,	0x13B0,	%l2
	udiv	%i0,	0x05DA,	%o5
	ldub	[%l7 + 0x25],	%g7
	xorcc	%o0,	%o7,	%o2
	movpos	%icc,	%l5,	%i5
	movge	%icc,	%i1,	%l3
	andn	%o1,	%g2,	%i6
	sra	%g5,	0x14,	%o4
	xor	%l4,	0x02C1,	%o3
	nop
	set	0x10, %l1
	stw	%l1,	[%l7 + %l1]
	movvc	%xcc,	%i2,	%g1
	sra	%i3,	0x01,	%i4
	xnorcc	%i7,	%l0,	%l6
	movrgez	%g4,	0x0E7,	%o6
	movne	%icc,	%g3,	%g6
	srax	%i0,	0x09,	%l2
	movgu	%xcc,	%g7,	%o0
	bshuffle	%f6,	%f6,	%f6
	fmovsgu	%icc,	%f21,	%f25
	srl	%o5,	0x14,	%o7
	fxors	%f6,	%f6,	%f13
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%o2
	fmovdneg	%icc,	%f17,	%f28
	addc	%l5,	%i1,	%i5
	sllx	%l3,	%g2,	%i6
	fpadd32	%f28,	%f20,	%f20
	movpos	%xcc,	%g5,	%o1
	srl	%l4,	%o4,	%l1
	fcmpes	%fcc0,	%f31,	%f18
	fcmpne32	%f16,	%f26,	%o3
	popc	0x09A8,	%g1
	edge8ln	%i3,	%i2,	%i7
	movre	%i4,	0x07C,	%l0
	fmovsneg	%icc,	%f27,	%f29
	ldub	[%l7 + 0x60],	%g4
	udiv	%o6,	0x1AEE,	%l6
	edge8	%g3,	%g6,	%i0
	xnor	%g7,	%l2,	%o0
	for	%f18,	%f16,	%f20
	sll	%o7,	%o5,	%o2
	sra	%l5,	%i1,	%i5
	edge8ln	%g2,	%l3,	%g5
	srax	%i6,	%l4,	%o4
	ld	[%l7 + 0x08],	%f4
	edge32l	%o1,	%o3,	%g1
	movrlez	%i3,	%i2,	%i7
	sra	%l1,	%l0,	%g4
	fmovdcs	%xcc,	%f26,	%f8
	fornot1s	%f23,	%f22,	%f26
	edge8	%o6,	%l6,	%i4
	andcc	%g6,	0x1C45,	%i0
	andn	%g7,	%l2,	%o0
	edge32l	%g3,	%o7,	%o2
	sethi	0x0D00,	%o5
	xnorcc	%l5,	%i5,	%i1
	popc	0x036F,	%l3
	edge32	%g5,	%i6,	%l4
	ldub	[%l7 + 0x57],	%g2
	movn	%icc,	%o1,	%o4
	ldd	[%l7 + 0x60],	%f8
	st	%f14,	[%l7 + 0x1C]
	xor	%o3,	%i3,	%i2
	movrgz	%i7,	%l1,	%g1
	stw	%l0,	[%l7 + 0x28]
	srlx	%g4,	%o6,	%i4
	edge32n	%g6,	%l6,	%i0
	fcmpd	%fcc0,	%f26,	%f20
	sub	%l2,	%o0,	%g7
	movrne	%g3,	%o7,	%o2
	edge8ln	%o5,	%l5,	%i1
	movrlz	%i5,	%l3,	%g5
	movge	%xcc,	%i6,	%g2
	array16	%o1,	%o4,	%o3
	udivcc	%i3,	0x0EF2,	%l4
	movvc	%xcc,	%i7,	%l1
	sra	%g1,	0x17,	%i2
	movcs	%xcc,	%l0,	%o6
	array8	%i4,	%g6,	%g4
	subccc	%l6,	%l2,	%i0
	fmovdvc	%xcc,	%f23,	%f17
	sethi	0x008E,	%o0
	addc	%g3,	%g7,	%o7
	addcc	%o5,	%o2,	%i1
	add	%l5,	0x0660,	%i5
	edge8l	%l3,	%i6,	%g5
	fmovrdgez	%o1,	%f4,	%f4
	fone	%f6
	edge32n	%g2,	%o4,	%i3
	nop
	set	0x48, %i4
	sth	%o3,	[%l7 + %i4]
	movvs	%xcc,	%i7,	%l1
	ldx	[%l7 + 0x08],	%l4
	movrgz	%g1,	%l0,	%i2
	ldx	[%l7 + 0x68],	%i4
	sth	%o6,	[%l7 + 0x7C]
	mulscc	%g6,	%l6,	%l2
	ldd	[%l7 + 0x58],	%i0
	movl	%icc,	%o0,	%g3
	sethi	0x1B5D,	%g4
	lduw	[%l7 + 0x5C],	%o7
	add	%o5,	0x072D,	%o2
	add	%i1,	0x0C23,	%g7
	ldub	[%l7 + 0x4D],	%i5
	ldub	[%l7 + 0x0F],	%l5
	movge	%icc,	%i6,	%l3
	fmovda	%xcc,	%f29,	%f26
	movre	%g5,	0x141,	%g2
	alignaddr	%o1,	%i3,	%o4
	fabsd	%f0,	%f30
	ld	[%l7 + 0x7C],	%f18
	sra	%o3,	0x1D,	%i7
	umul	%l1,	0x1CF7,	%l4
	add	%l0,	%i2,	%g1
	edge16n	%o6,	%i4,	%g6
	sra	%l2,	%i0,	%o0
	fpack16	%f0,	%f26
	fornot2s	%f12,	%f24,	%f20
	sdiv	%g3,	0x17CC,	%g4
	siam	0x3
	addc	%o7,	0x0FA8,	%o5
	xnor	%o2,	%i1,	%g7
	movpos	%xcc,	%i5,	%l6
	ldd	[%l7 + 0x28],	%l4
	edge8ln	%i6,	%l3,	%g5
	stx	%g2,	[%l7 + 0x08]
	xnorcc	%o1,	0x0A60,	%i3
	alignaddrl	%o3,	%i7,	%l1
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f0
	xnorcc	%l4,	0x199B,	%o4
	xorcc	%i2,	%l0,	%g1
	edge32	%o6,	%i4,	%g6
	fmul8x16al	%f13,	%f18,	%f6
	xnorcc	%l2,	%o0,	%g3
	movcs	%icc,	%i0,	%o7
	umul	%o5,	%o2,	%g4
	fcmpes	%fcc1,	%f13,	%f26
	ld	[%l7 + 0x24],	%f19
	andn	%g7,	0x1C79,	%i5
	fpackfix	%f22,	%f14
	movvc	%xcc,	%l6,	%l5
	udivx	%i1,	0x11FA,	%l3
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	edge16	%o1,	%o3,	%i3
	subc	%l1,	0x1296,	%i7
	add	%l4,	%i2,	%l0
	addccc	%g1,	%o4,	%o6
	alignaddrl	%g6,	%l2,	%o0
	edge16n	%i4,	%g3,	%o7
	mulscc	%i0,	%o5,	%g4
	array16	%g7,	%i5,	%o2
	fmovsne	%icc,	%f0,	%f13
	srlx	%l6,	%l5,	%i1
	subc	%l3,	%g2,	%i6
	sdivx	%o1,	0x1719,	%g5
	srax	%i3,	0x1D,	%o3
	alignaddrl	%l1,	%i7,	%l4
	udivx	%i2,	0x0BA8,	%l0
	fmovdneg	%icc,	%f4,	%f29
	sth	%o4,	[%l7 + 0x68]
	ldx	[%l7 + 0x18],	%g1
	fcmpne16	%f26,	%f24,	%g6
	orcc	%o6,	%o0,	%i4
	srl	%l2,	0x1A,	%o7
	smulcc	%g3,	0x0C8E,	%i0
	save %g4, 0x147B, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i5,	0x219,	%o2
	ldub	[%l7 + 0x71],	%g7
	edge16l	%l5,	%l6,	%l3
	fcmple16	%f30,	%f8,	%g2
	fnor	%f22,	%f18,	%f24
	fmul8sux16	%f10,	%f30,	%f8
	ldx	[%l7 + 0x58],	%i6
	move	%xcc,	%o1,	%i1
	addc	%i3,	%o3,	%l1
	stb	%i7,	[%l7 + 0x4D]
	fpadd16	%f12,	%f14,	%f26
	movneg	%xcc,	%l4,	%g5
	orncc	%i2,	%o4,	%g1
	ldub	[%l7 + 0x54],	%l0
	movrlz	%o6,	%g6,	%o0
	movle	%xcc,	%l2,	%o7
	fone	%f20
	fnands	%f20,	%f14,	%f26
	fmovsgu	%icc,	%f1,	%f7
	ldsw	[%l7 + 0x1C],	%g3
	fpack32	%f20,	%f2,	%f2
	fnot1s	%f8,	%f6
	movl	%icc,	%i4,	%i0
	umul	%o5,	%i5,	%o2
	ldsh	[%l7 + 0x48],	%g7
	movcc	%icc,	%g4,	%l6
	orcc	%l3,	%l5,	%g2
	popc	%i6,	%o1
	stb	%i3,	[%l7 + 0x0D]
	mulscc	%i1,	%o3,	%l1
	edge32l	%i7,	%g5,	%i2
	sub	%o4,	%g1,	%l4
	restore %o6, 0x19E2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o0,	%l2,	%o7
	sdiv	%g3,	0x1986,	%i4
	edge32l	%g6,	%o5,	%i0
	movn	%icc,	%o2,	%i5
	edge8n	%g4,	%l6,	%g7
	udivcc	%l3,	0x1079,	%l5
	edge16	%i6,	%g2,	%o1
	xorcc	%i1,	0x101B,	%i3
	movn	%icc,	%o3,	%i7
	stx	%l1,	[%l7 + 0x58]
	movl	%xcc,	%i2,	%o4
	alignaddrl	%g1,	%l4,	%g5
	sir	0x1D07
	and	%o6,	%o0,	%l0
	sir	0x1C70
	ldd	[%l7 + 0x18],	%l2
	fpsub32s	%f30,	%f19,	%f24
	edge16ln	%o7,	%i4,	%g3
	array32	%o5,	%i0,	%g6
	umulcc	%i5,	%g4,	%l6
	for	%f6,	%f16,	%f12
	ldsw	[%l7 + 0x2C],	%o2
	lduw	[%l7 + 0x68],	%g7
	movre	%l5,	%l3,	%g2
	sll	%o1,	0x13,	%i6
	sir	0x09F1
	fmovsge	%xcc,	%f1,	%f19
	std	%f10,	[%l7 + 0x40]
	movne	%icc,	%i1,	%i3
	movge	%xcc,	%o3,	%l1
	ldsb	[%l7 + 0x34],	%i2
	stx	%o4,	[%l7 + 0x58]
	umul	%g1,	%i7,	%l4
	fmovd	%f12,	%f8
	ldsh	[%l7 + 0x58],	%o6
	movn	%xcc,	%g5,	%l0
	srl	%l2,	%o7,	%o0
	fnegs	%f31,	%f15
	xorcc	%i4,	0x1CFA,	%g3
	alignaddrl	%o5,	%i0,	%g6
	ldsw	[%l7 + 0x34],	%i5
	xnor	%l6,	0x1163,	%o2
	fcmpgt32	%f14,	%f6,	%g4
	smulcc	%g7,	0x05E9,	%l3
	andn	%l5,	0x00BC,	%g2
	subccc	%i6,	%o1,	%i3
	sethi	0x110E,	%i1
	fmovrslez	%o3,	%f22,	%f1
	edge8n	%l1,	%o4,	%g1
	ldub	[%l7 + 0x3C],	%i7
	fcmpeq32	%f12,	%f22,	%i2
	subcc	%l4,	0x03B7,	%g5
	lduw	[%l7 + 0x20],	%o6
	edge16l	%l0,	%o7,	%l2
	pdist	%f6,	%f2,	%f12
	stb	%o0,	[%l7 + 0x4B]
	alignaddr	%i4,	%o5,	%i0
	std	%f28,	[%l7 + 0x50]
	mulx	%g3,	0x0946,	%g6
	fnegs	%f22,	%f8
	xnor	%l6,	0x046F,	%o2
	stb	%i5,	[%l7 + 0x7D]
	fmovdn	%icc,	%f29,	%f30
	fmovdl	%icc,	%f28,	%f18
	smul	%g7,	0x1B6A,	%g4
	fmovde	%icc,	%f18,	%f11
	andncc	%l3,	%l5,	%g2
	smul	%i6,	0x1BF8,	%i3
	edge8n	%o1,	%i1,	%l1
	fand	%f16,	%f6,	%f24
	array32	%o3,	%g1,	%i7
	faligndata	%f14,	%f28,	%f12
	fzero	%f18
	std	%f4,	[%l7 + 0x70]
	sir	0x15F2
	fxnor	%f14,	%f20,	%f6
	andncc	%i2,	%l4,	%o4
	edge32l	%g5,	%o6,	%o7
	sth	%l0,	[%l7 + 0x42]
	ldd	[%l7 + 0x40],	%l2
	ldsh	[%l7 + 0x20],	%o0
	movne	%xcc,	%o5,	%i4
	edge16n	%i0,	%g6,	%g3
	fmovse	%xcc,	%f18,	%f14
	sll	%l6,	0x1C,	%o2
	ld	[%l7 + 0x78],	%f3
	mova	%xcc,	%i5,	%g7
	fmovsleu	%icc,	%f8,	%f11
	sth	%g4,	[%l7 + 0x26]
	movvs	%icc,	%l3,	%g2
	movne	%xcc,	%l5,	%i6
	sdivx	%o1,	0x0E0A,	%i3
	movvc	%icc,	%i1,	%o3
	std	%f16,	[%l7 + 0x20]
	movn	%icc,	%g1,	%l1
	edge32n	%i2,	%l4,	%o4
	andcc	%i7,	0x005F,	%g5
	fand	%f4,	%f16,	%f2
	subcc	%o6,	0x1F32,	%o7
	fones	%f23
	ldx	[%l7 + 0x10],	%l0
	sethi	0x1AF2,	%o0
	udiv	%l2,	0x1871,	%o5
	xor	%i4,	0x0DD0,	%i0
	fmovdvc	%xcc,	%f25,	%f29
	fmovse	%xcc,	%f27,	%f30
	movn	%icc,	%g6,	%g3
	fpsub16s	%f24,	%f18,	%f26
	stb	%o2,	[%l7 + 0x3E]
	edge16ln	%i5,	%l6,	%g7
	fmovsgu	%xcc,	%f6,	%f12
	fmovdcc	%xcc,	%f13,	%f14
	fsrc2	%f20,	%f14
	smulcc	%g4,	0x1D9B,	%g2
	fnot2s	%f0,	%f2
	fmovdvs	%xcc,	%f11,	%f24
	edge32	%l3,	%l5,	%i6
	edge16	%i3,	%o1,	%i1
	std	%f0,	[%l7 + 0x48]
	udiv	%o3,	0x0522,	%g1
	fornot2	%f26,	%f2,	%f16
	movle	%icc,	%l1,	%i2
	movrgz	%l4,	%i7,	%g5
	movn	%icc,	%o6,	%o4
	fmovdn	%xcc,	%f16,	%f6
	xorcc	%o7,	0x1A1C,	%l0
	movne	%xcc,	%o0,	%l2
	orncc	%o5,	%i4,	%g6
	fmul8x16au	%f27,	%f4,	%f28
	xnor	%i0,	0x0D4E,	%o2
	fmovdg	%xcc,	%f20,	%f14
	srax	%i5,	%l6,	%g3
	srax	%g4,	%g2,	%l3
	edge16l	%g7,	%i6,	%l5
	fmul8x16	%f8,	%f6,	%f26
	edge8	%o1,	%i1,	%o3
	edge32n	%i3,	%g1,	%i2
	sdivx	%l4,	0x056A,	%l1
	stb	%i7,	[%l7 + 0x25]
	fnands	%f7,	%f4,	%f22
	sll	%g5,	%o6,	%o7
	sth	%o4,	[%l7 + 0x6A]
	sethi	0x033B,	%o0
	st	%f3,	[%l7 + 0x44]
	fcmped	%fcc2,	%f8,	%f2
	andncc	%l2,	%o5,	%i4
	edge8ln	%l0,	%g6,	%i0
	ldsh	[%l7 + 0x58],	%i5
	fcmpne16	%f22,	%f18,	%l6
	movgu	%xcc,	%g3,	%g4
	edge32l	%g2,	%l3,	%o2
	fzeros	%f21
	andn	%g7,	%i6,	%l5
	fnands	%f18,	%f24,	%f10
	xor	%o1,	%i1,	%o3
	ldub	[%l7 + 0x7D],	%i3
	stx	%i2,	[%l7 + 0x28]
	movgu	%xcc,	%l4,	%l1
	ldd	[%l7 + 0x70],	%i6
	movvs	%xcc,	%g1,	%o6
	ldub	[%l7 + 0x76],	%o7
	lduh	[%l7 + 0x14],	%g5
	orncc	%o4,	%l2,	%o0
	xor	%i4,	0x00B1,	%o5
	ldsb	[%l7 + 0x58],	%l0
	andncc	%g6,	%i5,	%l6
	addc	%g3,	%i0,	%g4
	fabsd	%f12,	%f24
	movpos	%xcc,	%g2,	%o2
	save %g7, %l3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o1,	%i6,	%o3
	fmovscs	%icc,	%f21,	%f30
	ldsw	[%l7 + 0x18],	%i1
	movcc	%xcc,	%i2,	%i3
	movl	%icc,	%l4,	%i7
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	edge16n	%g5,	%o7,	%l2
	subc	%o0,	0x05A9,	%i4
	fmovse	%xcc,	%f23,	%f4
	ldsb	[%l7 + 0x65],	%o5
	fpsub32	%f12,	%f8,	%f14
	fnand	%f16,	%f10,	%f8
	fmovsvs	%icc,	%f25,	%f26
	std	%f2,	[%l7 + 0x40]
	xnor	%l0,	0x1240,	%o4
	sethi	0x047D,	%g6
	fxnors	%f22,	%f2,	%f19
	fmul8ulx16	%f24,	%f18,	%f28
	ldd	[%l7 + 0x60],	%i4
	movrgz	%g3,	%l6,	%g4
	std	%f26,	[%l7 + 0x08]
	alignaddrl	%i0,	%o2,	%g7
	edge32ln	%g2,	%l3,	%o1
	sir	0x0120
	movrne	%i6,	%l5,	%o3
	stx	%i2,	[%l7 + 0x68]
	xnor	%i3,	0x0C41,	%i1
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%i7
	addcc	%l4,	0x1A98,	%l1
	movn	%xcc,	%o6,	%g1
	fmovdvc	%icc,	%f1,	%f25
	fcmpgt32	%f28,	%f16,	%o7
	umulcc	%l2,	0x18E9,	%o0
	edge16ln	%g5,	%i4,	%l0
	edge32	%o4,	%o5,	%g6
	movneg	%xcc,	%g3,	%i5
	movleu	%icc,	%g4,	%l6
	xor	%i0,	%o2,	%g2
	restore %g7, 0x1500, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	%l5,	%o1
	fmovdn	%icc,	%f15,	%f1
	sllx	%i2,	%i3,	%o3
	st	%f21,	[%l7 + 0x24]
	stx	%i1,	[%l7 + 0x48]
	movrlz	%i7,	0x251,	%l1
	udivx	%o6,	0x033A,	%l4
	edge32	%o7,	%l2,	%g1
	movvc	%xcc,	%o0,	%g5
	mova	%xcc,	%i4,	%l0
	sdiv	%o5,	0x1834,	%g6
	movrgez	%o4,	%i5,	%g3
	movgu	%xcc,	%l6,	%i0
	sethi	0x084C,	%o2
	movre	%g4,	%g7,	%l3
	fmovrsne	%g2,	%f4,	%f1
	fors	%f4,	%f29,	%f4
	fcmple32	%f0,	%f26,	%i6
	movne	%xcc,	%l5,	%o1
	nop
	set	0x60, %o7
	std	%f4,	[%l7 + %o7]
	stb	%i2,	[%l7 + 0x0E]
	orcc	%i3,	0x0327,	%i1
	subc	%o3,	%l1,	%i7
	xnorcc	%l4,	%o6,	%o7
	fmovrsne	%g1,	%f11,	%f28
	ldsw	[%l7 + 0x24],	%o0
	sub	%g5,	%l2,	%i4
	udivcc	%o5,	0x1BAF,	%g6
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	sir	0x13A0
	fpsub32	%f14,	%f14,	%f4
	andcc	%g3,	0x10C1,	%i0
	fcmpne32	%f18,	%f2,	%o2
	edge16ln	%l6,	%g7,	%g4
	popc	%l3,	%g2
	save %i6, 0x00A4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f20,	%f25
	edge32l	%l5,	%i2,	%i1
	movvs	%icc,	%i3,	%l1
	movrlez	%o3,	%i7,	%o6
	udivcc	%o7,	0x070C,	%g1
	fpadd32s	%f15,	%f20,	%f17
	stx	%l4,	[%l7 + 0x60]
	xorcc	%g5,	%o0,	%i4
	stx	%o5,	[%l7 + 0x08]
	movgu	%icc,	%l2,	%o4
	fcmps	%fcc0,	%f18,	%f25
	edge32ln	%g6,	%l0,	%i5
	mulscc	%g3,	0x086B,	%o2
	pdist	%f24,	%f24,	%f2
	fmovdl	%xcc,	%f30,	%f8
	fmovdn	%xcc,	%f2,	%f16
	fmuld8sux16	%f26,	%f6,	%f10
	add	%i0,	%l6,	%g4
	movre	%l3,	%g7,	%i6
	edge32n	%g2,	%l5,	%o1
	orn	%i2,	0x0A2A,	%i3
	ldub	[%l7 + 0x66],	%l1
	fcmps	%fcc0,	%f7,	%f26
	sdivcc	%i1,	0x11B2,	%i7
	fmovrslez	%o6,	%f8,	%f3
	fcmpgt16	%f20,	%f12,	%o3
	fmovsneg	%icc,	%f28,	%f17
	edge16n	%o7,	%g1,	%g5
	andcc	%l4,	%i4,	%o5
	movn	%xcc,	%l2,	%o4
	fzeros	%f1
	edge8ln	%o0,	%g6,	%l0
	srlx	%g3,	%o2,	%i0
	orcc	%i5,	%l6,	%l3
	fmovrsgez	%g7,	%f31,	%f31
	fmovda	%icc,	%f22,	%f13
	movle	%icc,	%g4,	%g2
	siam	0x6
	stw	%l5,	[%l7 + 0x40]
	edge16n	%i6,	%i2,	%i3
	ld	[%l7 + 0x08],	%f19
	udivx	%o1,	0x11C0,	%l1
	sth	%i1,	[%l7 + 0x16]
	movleu	%xcc,	%i7,	%o3
	edge16ln	%o7,	%o6,	%g1
	fmul8sux16	%f20,	%f4,	%f8
	edge32n	%g5,	%l4,	%o5
	edge32n	%l2,	%o4,	%i4
	ldub	[%l7 + 0x29],	%o0
	st	%f7,	[%l7 + 0x64]
	sub	%l0,	0x1C75,	%g3
	ldsw	[%l7 + 0x18],	%o2
	edge8	%g6,	%i5,	%i0
	movgu	%xcc,	%l3,	%l6
	and	%g4,	%g2,	%l5
	sth	%g7,	[%l7 + 0x20]
	st	%f22,	[%l7 + 0x20]
	movle	%xcc,	%i6,	%i2
	fcmple16	%f12,	%f0,	%i3
	ldsh	[%l7 + 0x64],	%o1
	movrlez	%i1,	0x082,	%l1
	ldd	[%l7 + 0x30],	%f22
	movrgez	%i7,	%o7,	%o3
	sethi	0x1A58,	%g1
	edge8n	%g5,	%o6,	%l4
	sdivcc	%l2,	0x018F,	%o5
	lduh	[%l7 + 0x74],	%i4
	stb	%o0,	[%l7 + 0x65]
	and	%o4,	0x15E8,	%l0
	fmovrsgez	%o2,	%f8,	%f30
	save %g6, 0x04A4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f15,	%f26,	%f16
	movvc	%icc,	%i5,	%l3
	sdivx	%l6,	0x0DD1,	%i0
	sll	%g4,	0x0A,	%g2
	movg	%xcc,	%g7,	%i6
	sethi	0x1E97,	%l5
	edge16ln	%i3,	%i2,	%o1
	movne	%xcc,	%i1,	%i7
	ld	[%l7 + 0x58],	%f22
	edge8ln	%l1,	%o3,	%o7
	ldd	[%l7 + 0x20],	%g4
	fpadd16s	%f10,	%f8,	%f27
	fmovrslez	%o6,	%f25,	%f15
	fmovsleu	%icc,	%f19,	%f10
	movn	%xcc,	%l4,	%g1
	add	%l2,	0x0F15,	%o5
	sra	%o0,	%i4,	%l0
	andncc	%o2,	%o4,	%g6
	orcc	%i5,	0x06F7,	%g3
	nop
	set	0x20, %l0
	stx	%l3,	[%l7 + %l0]
	fmovsg	%xcc,	%f22,	%f19
	popc	%l6,	%g4
	mulscc	%g2,	%g7,	%i0
	udiv	%i6,	0x16CA,	%l5
	fandnot2s	%f17,	%f30,	%f20
	movleu	%xcc,	%i3,	%i2
	fnand	%f26,	%f2,	%f26
	edge8l	%i1,	%o1,	%i7
	movpos	%icc,	%l1,	%o7
	movrne	%g5,	0x159,	%o6
	nop
	set	0x0C, %g7
	sth	%l4,	[%l7 + %g7]
	mova	%xcc,	%g1,	%l2
	lduh	[%l7 + 0x30],	%o5
	siam	0x4
	udivcc	%o0,	0x0DF6,	%i4
	movrne	%l0,	%o2,	%o4
	fpadd32s	%f1,	%f0,	%f2
	ld	[%l7 + 0x38],	%f10
	fxor	%f0,	%f2,	%f22
	andncc	%o3,	%i5,	%g3
	edge16l	%l3,	%l6,	%g6
	srax	%g2,	0x14,	%g7
	sth	%g4,	[%l7 + 0x3A]
	array8	%i0,	%i6,	%i3
	ldsh	[%l7 + 0x76],	%i2
	lduw	[%l7 + 0x44],	%i1
	fcmple32	%f6,	%f0,	%o1
	orncc	%i7,	%l1,	%o7
	fmovrdgez	%l5,	%f28,	%f0
	bshuffle	%f2,	%f20,	%f20
	edge8	%o6,	%g5,	%g1
	sth	%l4,	[%l7 + 0x78]
	movle	%xcc,	%o5,	%l2
	edge16l	%i4,	%l0,	%o2
	stb	%o0,	[%l7 + 0x11]
	edge32n	%o4,	%i5,	%g3
	mulx	%l3,	%o3,	%g6
	fmovdle	%xcc,	%f28,	%f14
	ldub	[%l7 + 0x65],	%g2
	movneg	%icc,	%l6,	%g4
	ldx	[%l7 + 0x50],	%g7
	edge32n	%i6,	%i3,	%i0
	edge8l	%i1,	%o1,	%i7
	stx	%l1,	[%l7 + 0x78]
	mulscc	%o7,	%i2,	%l5
	orncc	%o6,	%g1,	%l4
	sir	0x0962
	array32	%o5,	%l2,	%g5
	andn	%i4,	0x1B4D,	%l0
	sir	0x005B
	fmovrde	%o2,	%f28,	%f6
	subccc	%o4,	0x18B2,	%o0
	srax	%i5,	0x07,	%g3
	pdist	%f16,	%f6,	%f24
	movcs	%xcc,	%l3,	%g6
	orcc	%o3,	%g2,	%l6
	orcc	%g7,	%i6,	%i3
	subcc	%i0,	%g4,	%o1
	smulcc	%i7,	%l1,	%o7
	mova	%xcc,	%i1,	%l5
	ldsb	[%l7 + 0x48],	%o6
	andcc	%i2,	%g1,	%o5
	edge8ln	%l4,	%l2,	%g5
	fpsub16	%f14,	%f0,	%f6
	sub	%l0,	0x0F3E,	%o2
	movleu	%xcc,	%o4,	%i4
	ldsw	[%l7 + 0x0C],	%i5
	and	%o0,	0x181E,	%l3
	fcmpgt16	%f14,	%f6,	%g6
	fcmpeq32	%f16,	%f10,	%g3
	movle	%xcc,	%o3,	%l6
	sir	0x04C5
	sll	%g7,	0x07,	%i6
	movg	%xcc,	%i3,	%i0
	edge8l	%g2,	%o1,	%i7
	and	%l1,	0x176F,	%g4
	ldd	[%l7 + 0x50],	%i0
	xnorcc	%o7,	0x157D,	%o6
	sth	%l5,	[%l7 + 0x26]
	addc	%g1,	%i2,	%o5
	restore %l2, 0x1FE4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f15,	%f17,	%f30
	sllx	%l0,	0x1E,	%o2
	smulcc	%o4,	%i4,	%g5
	umul	%o0,	0x07E5,	%i5
	fmovsgu	%icc,	%f26,	%f31
	popc	0x1743,	%l3
	fornot1	%f2,	%f24,	%f16
	array16	%g6,	%g3,	%l6
	edge8	%g7,	%o3,	%i6
	sdivx	%i0,	0x0B65,	%i3
	mulscc	%o1,	0x1208,	%i7
	orcc	%l1,	0x132E,	%g2
	sllx	%g4,	0x15,	%o7
	array16	%i1,	%l5,	%g1
	fmovrsgz	%i2,	%f25,	%f26
	movrlez	%o6,	0x168,	%l2
	fmovsne	%icc,	%f10,	%f18
	fmovrdne	%o5,	%f8,	%f22
	save %l4, %l0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i4,	0x18F7,	%o4
	fpsub32s	%f21,	%f4,	%f16
	movrgz	%o0,	%i5,	%l3
	addc	%g5,	0x1CB1,	%g6
	stx	%l6,	[%l7 + 0x70]
	fpsub32	%f18,	%f26,	%f4
	orcc	%g7,	%o3,	%g3
	addc	%i0,	0x0CF6,	%i3
	umulcc	%i6,	%i7,	%o1
	ldx	[%l7 + 0x10],	%l1
	fcmpne32	%f20,	%f24,	%g2
	sdivcc	%o7,	0x136E,	%i1
	ldx	[%l7 + 0x28],	%g4
	movgu	%icc,	%g1,	%l5
	fandnot1s	%f6,	%f7,	%f14
	edge32l	%i2,	%l2,	%o5
	mulscc	%l4,	0x159D,	%o6
	umul	%o2,	0x0E2E,	%l0
	stx	%o4,	[%l7 + 0x28]
	orncc	%i4,	0x0387,	%o0
	ldx	[%l7 + 0x30],	%l3
	fmovde	%xcc,	%f5,	%f14
	fpsub16s	%f30,	%f15,	%f8
	std	%f28,	[%l7 + 0x20]
	movrgez	%i5,	0x12F,	%g5
	movre	%g6,	%l6,	%g7
	fpsub16s	%f26,	%f15,	%f16
	subcc	%o3,	%i0,	%g3
	andncc	%i6,	%i3,	%o1
	movcc	%icc,	%l1,	%g2
	umulcc	%i7,	0x037E,	%i1
	subcc	%g4,	%o7,	%l5
	movge	%xcc,	%g1,	%l2
	and	%i2,	%o5,	%l4
	lduw	[%l7 + 0x3C],	%o6
	andcc	%l0,	%o2,	%o4
	subccc	%o0,	%l3,	%i4
	udivx	%i5,	0x1FFE,	%g5
	edge16l	%l6,	%g6,	%o3
	array16	%i0,	%g3,	%g7
	st	%f16,	[%l7 + 0x44]
	srax	%i6,	0x0A,	%o1
	movvs	%xcc,	%l1,	%g2
	mova	%icc,	%i3,	%i1
	edge16	%g4,	%o7,	%i7
	srl	%l5,	%g1,	%i2
	movrlez	%l2,	0x114,	%o5
	edge16n	%o6,	%l4,	%o2
	andcc	%l0,	%o0,	%l3
	subccc	%o4,	0x008E,	%i4
	movrgez	%i5,	%l6,	%g5
	fmovdvs	%icc,	%f11,	%f30
	alignaddrl	%g6,	%o3,	%g3
	addcc	%i0,	0x0C3F,	%g7
	edge32	%o1,	%i6,	%g2
	subccc	%l1,	%i1,	%i3
	and	%o7,	%g4,	%l5
	add	%i7,	0x135E,	%i2
	sll	%l2,	%g1,	%o5
	array8	%l4,	%o2,	%o6
	st	%f9,	[%l7 + 0x60]
	array32	%l0,	%o0,	%o4
	andcc	%i4,	0x18EF,	%i5
	subccc	%l3,	0x0228,	%l6
	movl	%xcc,	%g5,	%g6
	edge16n	%g3,	%o3,	%i0
	fmovscs	%xcc,	%f8,	%f17
	stw	%g7,	[%l7 + 0x64]
	stw	%i6,	[%l7 + 0x28]
	st	%f4,	[%l7 + 0x14]
	fmovdgu	%icc,	%f23,	%f12
	sethi	0x1244,	%o1
	movg	%icc,	%l1,	%g2
	movl	%icc,	%i1,	%o7
	umulcc	%g4,	0x1637,	%l5
	ldd	[%l7 + 0x08],	%f0
	or	%i3,	0x0A13,	%i7
	orn	%i2,	%g1,	%l2
	or	%o5,	0x0096,	%o2
	ldx	[%l7 + 0x40],	%l4
	srl	%l0,	0x17,	%o0
	ldx	[%l7 + 0x08],	%o6
	popc	%o4,	%i4
	sll	%l3,	%i5,	%g5
	xnorcc	%l6,	%g3,	%g6
	edge8	%o3,	%g7,	%i6
	popc	0x19B4,	%o1
	mulx	%i0,	%g2,	%i1
	movg	%icc,	%l1,	%g4
	fmovdvs	%xcc,	%f24,	%f25
	srlx	%o7,	0x1A,	%l5
	orcc	%i3,	0x0D11,	%i7
	ldd	[%l7 + 0x40],	%i2
	fmovsge	%xcc,	%f27,	%f21
	orcc	%g1,	%l2,	%o5
	fnor	%f6,	%f0,	%f0
	andcc	%o2,	%l0,	%l4
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	stx	%i4,	[%l7 + 0x20]
	addcc	%l3,	0x0496,	%o4
	fmovsn	%xcc,	%f8,	%f9
	udiv	%g5,	0x1320,	%i5
	fpsub32s	%f1,	%f19,	%f30
	ld	[%l7 + 0x48],	%f27
	fandnot2	%f2,	%f20,	%f10
	fmovrde	%l6,	%f14,	%f2
	add	%g3,	0x12AA,	%g6
	fmovrdlz	%o3,	%f20,	%f10
	andncc	%g7,	%i6,	%i0
	st	%f9,	[%l7 + 0x48]
	fornot1	%f16,	%f26,	%f0
	fnegs	%f19,	%f16
	movneg	%icc,	%o1,	%i1
	edge32l	%g2,	%l1,	%o7
	fands	%f9,	%f1,	%f0
	fmovsgu	%xcc,	%f12,	%f9
	edge8ln	%l5,	%i3,	%i7
	edge32	%i2,	%g4,	%g1
	udiv	%l2,	0x06B6,	%o2
	sllx	%o5,	%l4,	%l0
	st	%f10,	[%l7 + 0x70]
	ld	[%l7 + 0x60],	%f24
	sllx	%o0,	%i4,	%l3
	add	%o6,	%g5,	%o4
	sra	%l6,	%i5,	%g6
	fandnot1s	%f1,	%f7,	%f10
	xor	%g3,	0x0D43,	%g7
	movrne	%i6,	%i0,	%o3
	movrgz	%i1,	%o1,	%g2
	addcc	%l1,	0x0CB6,	%o7
	fabsd	%f2,	%f22
	sll	%i3,	%l5,	%i7
	array8	%g4,	%i2,	%l2
	fmovrdne	%g1,	%f26,	%f30
	edge32ln	%o5,	%o2,	%l0
	fpsub32s	%f28,	%f24,	%f20
	movge	%xcc,	%l4,	%i4
	and	%o0,	%o6,	%l3
	mova	%xcc,	%g5,	%o4
	movge	%icc,	%l6,	%i5
	fexpand	%f2,	%f4
	fmovrdgez	%g6,	%f2,	%f2
	edge8ln	%g3,	%i6,	%i0
	orncc	%g7,	0x0913,	%o3
	fmovdleu	%xcc,	%f15,	%f21
	fmul8ulx16	%f0,	%f30,	%f14
	move	%icc,	%o1,	%i1
	st	%f2,	[%l7 + 0x64]
	fpmerge	%f30,	%f31,	%f12
	fornot1s	%f10,	%f24,	%f13
	popc	%g2,	%l1
	sth	%i3,	[%l7 + 0x26]
	ldsw	[%l7 + 0x1C],	%o7
	movg	%icc,	%i7,	%l5
	fnot1	%f12,	%f0
	ldd	[%l7 + 0x20],	%g4
	fzero	%f26
	edge32n	%l2,	%i2,	%g1
	movle	%xcc,	%o2,	%o5
	andn	%l0,	%i4,	%l4
	fandnot1	%f10,	%f14,	%f30
	sdivcc	%o6,	0x027C,	%o0
	edge32n	%g5,	%l3,	%l6
	edge16	%o4,	%i5,	%g6
	andn	%i6,	%g3,	%g7
	addcc	%i0,	0x0149,	%o1
	lduw	[%l7 + 0x44],	%i1
	xnor	%g2,	%o3,	%l1
	fmovdvs	%icc,	%f31,	%f29
	sir	0x088B
	fone	%f8
	udivx	%o7,	0x1502,	%i3
	movpos	%xcc,	%i7,	%g4
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%l4
	movle	%xcc,	%i2,	%l2
	fnot1s	%f25,	%f28
	sub	%o2,	%g1,	%l0
	movg	%xcc,	%i4,	%l4
	fmovrdlz	%o5,	%f0,	%f28
	fabsd	%f20,	%f30
	mulscc	%o0,	%g5,	%l3
	movcc	%icc,	%l6,	%o4
	movrlez	%o6,	%g6,	%i5
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%i6
	edge32l	%g3,	%i0,	%o1
	fmovdcs	%icc,	%f17,	%f28
	nop
	set	0x62, %g2
	stb	%i1,	[%l7 + %g2]
	andncc	%g2,	%g7,	%l1
	stb	%o3,	[%l7 + 0x22]
	fmovspos	%icc,	%f4,	%f27
	fnors	%f13,	%f15,	%f23
	fnands	%f15,	%f23,	%f19
	edge32	%i3,	%i7,	%g4
	movneg	%xcc,	%l5,	%i2
	fsrc2s	%f24,	%f4
	save %o7, %l2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l0,	%g1
	fpadd32	%f22,	%f28,	%f12
	fmovde	%icc,	%f23,	%f21
	bshuffle	%f8,	%f14,	%f22
	umul	%l4,	0x071C,	%o5
	ldsb	[%l7 + 0x48],	%i4
	fnegd	%f16,	%f12
	fmovsleu	%xcc,	%f17,	%f21
	movre	%g5,	0x2AD,	%o0
	fcmpeq32	%f2,	%f24,	%l6
	fandnot1	%f8,	%f28,	%f22
	movne	%icc,	%l3,	%o6
	array8	%o4,	%g6,	%i5
	ldx	[%l7 + 0x78],	%i6
	movleu	%icc,	%g3,	%o1
	mulx	%i1,	%g2,	%g7
	andncc	%i0,	%o3,	%l1
	sdiv	%i7,	0x1224,	%i3
	std	%f6,	[%l7 + 0x10]
	umul	%g4,	%i2,	%o7
	fmovdge	%xcc,	%f0,	%f31
	edge32l	%l2,	%l5,	%o2
	fsrc2s	%f25,	%f20
	array8	%g1,	%l0,	%o5
	addccc	%i4,	%l4,	%o0
	addc	%g5,	%l6,	%o6
	lduw	[%l7 + 0x48],	%l3
	orcc	%o4,	0x01C4,	%i5
	udivx	%i6,	0x0F5D,	%g3
	umul	%g6,	0x15AB,	%o1
	fsrc2s	%f17,	%f17
	fmul8x16al	%f16,	%f10,	%f22
	edge8l	%g2,	%g7,	%i1
	movvs	%xcc,	%o3,	%i0
	movrgz	%l1,	%i7,	%g4
	fcmpgt32	%f10,	%f20,	%i2
	movn	%icc,	%i3,	%o7
	ldx	[%l7 + 0x70],	%l2
	smulcc	%o2,	%g1,	%l5
	smul	%o5,	%i4,	%l4
	restore %o0, %l0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f20,	%f22
	xorcc	%o6,	0x00DA,	%l6
	fmovrde	%l3,	%f14,	%f24
	fmovdne	%icc,	%f11,	%f11
	movre	%o4,	0x015,	%i5
	fmovsneg	%xcc,	%f2,	%f30
	movne	%icc,	%g3,	%g6
	movrne	%o1,	%i6,	%g7
	andncc	%g2,	%o3,	%i0
	edge32n	%i1,	%i7,	%l1
	fpack32	%f0,	%f6,	%f4
	alignaddr	%i2,	%i3,	%g4
	movn	%xcc,	%o7,	%o2
	alignaddrl	%l2,	%l5,	%o5
	smulcc	%g1,	0x19D3,	%i4
	movge	%icc,	%l4,	%l0
	ldub	[%l7 + 0x4F],	%g5
	ldsw	[%l7 + 0x68],	%o6
	and	%o0,	0x0CA6,	%l3
	smul	%o4,	0x0538,	%i5
	fone	%f16
	movrgez	%g3,	%g6,	%l6
	fornot2	%f0,	%f24,	%f20
	edge32l	%i6,	%o1,	%g2
	fabss	%f29,	%f13
	fmovrdne	%o3,	%f30,	%f24
	fpsub16	%f24,	%f0,	%f10
	mova	%xcc,	%g7,	%i0
	movl	%xcc,	%i7,	%l1
	fxors	%f2,	%f4,	%f8
	movcs	%xcc,	%i1,	%i3
	lduh	[%l7 + 0x7C],	%g4
	movvc	%icc,	%o7,	%i2
	movrgz	%o2,	%l5,	%o5
	fmovrdgez	%g1,	%f24,	%f2
	orcc	%i4,	0x1328,	%l4
	movrgez	%l2,	%l0,	%o6
	subcc	%g5,	0x0BF7,	%o0
	std	%f28,	[%l7 + 0x48]
	edge8l	%o4,	%i5,	%g3
	orncc	%l3,	%l6,	%i6
	andcc	%o1,	%g6,	%g2
	ldsb	[%l7 + 0x4D],	%g7
	ldsw	[%l7 + 0x1C],	%i0
	fornot2	%f8,	%f20,	%f6
	edge16n	%o3,	%l1,	%i1
	orncc	%i3,	0x1501,	%i7
	movn	%xcc,	%o7,	%g4
	fcmpne16	%f8,	%f0,	%i2
	smulcc	%o2,	%l5,	%o5
	edge16n	%g1,	%i4,	%l4
	orn	%l0,	0x1F13,	%o6
	ldd	[%l7 + 0x40],	%f12
	fsrc2s	%f16,	%f25
	fnot1s	%f7,	%f0
	edge8ln	%l2,	%o0,	%g5
	mulscc	%o4,	%i5,	%l3
	mova	%icc,	%l6,	%g3
	movle	%xcc,	%i6,	%o1
	xnorcc	%g2,	%g6,	%g7
	ldd	[%l7 + 0x20],	%o2
	movg	%icc,	%i0,	%l1
	subcc	%i3,	0x0330,	%i7
	fmovrdgez	%o7,	%f26,	%f26
	edge32ln	%g4,	%i1,	%o2
	movl	%icc,	%l5,	%o5
	save %g1, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l0,	%l4,	%o6
	fmovdcc	%xcc,	%f9,	%f5
	udivx	%o0,	0x0571,	%g5
	udivx	%o4,	0x0649,	%i5
	srax	%l2,	0x11,	%l6
	fmovsne	%icc,	%f28,	%f15
	nop
	set	0x32, %o0
	sth	%g3,	[%l7 + %o0]
	fands	%f10,	%f26,	%f21
	or	%l3,	0x16DE,	%o1
	sllx	%i6,	%g6,	%g7
	movrgz	%o3,	%i0,	%l1
	smulcc	%i3,	%i7,	%g2
	andcc	%o7,	0x1D13,	%g4
	edge8	%i1,	%l5,	%o5
	popc	%g1,	%o2
	srl	%i4,	%i2,	%l0
	array32	%l4,	%o0,	%g5
	edge16ln	%o4,	%o6,	%i5
	movre	%l2,	0x0E8,	%l6
	smul	%g3,	0x0524,	%o1
	movvs	%xcc,	%l3,	%i6
	umul	%g6,	0x1A55,	%g7
	udivx	%o3,	0x0C12,	%l1
	faligndata	%f26,	%f16,	%f28
	sra	%i0,	0x14,	%i3
	orcc	%i7,	0x1898,	%g2
	add	%o7,	0x1B7C,	%g4
	smul	%l5,	%o5,	%i1
	fpadd16s	%f21,	%f0,	%f9
	edge32l	%g1,	%o2,	%i4
	array16	%i2,	%l4,	%l0
	fxnor	%f0,	%f4,	%f10
	fmovsn	%icc,	%f17,	%f21
	movge	%icc,	%g5,	%o4
	fnegd	%f0,	%f14
	fmovsleu	%xcc,	%f30,	%f4
	fones	%f3
	move	%icc,	%o0,	%i5
	fmovrdlez	%o6,	%f4,	%f26
	subcc	%l2,	%g3,	%l6
	smul	%l3,	%i6,	%o1
	save %g7, 0x1F6E, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f24,	%f0,	%f4
	fmovdneg	%icc,	%f10,	%f17
	edge32ln	%l1,	%i0,	%o3
	mulscc	%i3,	0x186C,	%i7
	edge8n	%o7,	%g2,	%g4
	stx	%o5,	[%l7 + 0x20]
	movvc	%xcc,	%i1,	%l5
	movg	%xcc,	%o2,	%i4
	edge16	%g1,	%i2,	%l4
	edge8l	%g5,	%o4,	%l0
	ldd	[%l7 + 0x70],	%i4
	stb	%o0,	[%l7 + 0x6E]
	and	%o6,	%l2,	%g3
	mova	%xcc,	%l6,	%l3
	andcc	%o1,	%i6,	%g7
	sethi	0x023B,	%g6
	umul	%i0,	0x06A3,	%o3
	movn	%xcc,	%i3,	%l1
	fmul8x16al	%f22,	%f10,	%f12
	ldsh	[%l7 + 0x1E],	%i7
	fcmpes	%fcc3,	%f17,	%f28
	ldsh	[%l7 + 0x6A],	%g2
	movne	%xcc,	%o7,	%g4
	movpos	%icc,	%o5,	%i1
	fnor	%f16,	%f14,	%f22
	movvs	%icc,	%l5,	%o2
	andcc	%g1,	0x11A5,	%i2
	xnor	%l4,	0x16C7,	%i4
	andn	%o4,	%l0,	%g5
	fcmpeq16	%f16,	%f26,	%o0
	addcc	%o6,	%i5,	%l2
	fmovscs	%icc,	%f21,	%f13
	move	%icc,	%l6,	%l3
	fmovrslez	%o1,	%f5,	%f29
	movvs	%icc,	%i6,	%g7
	stx	%g6,	[%l7 + 0x08]
	movrlz	%g3,	%i0,	%i3
	fnands	%f1,	%f28,	%f20
	movg	%icc,	%l1,	%o3
	sethi	0x0FEA,	%i7
	edge16n	%g2,	%o7,	%o5
	alignaddrl	%i1,	%g4,	%o2
	srax	%l5,	0x10,	%g1
	ldsh	[%l7 + 0x18],	%i2
	edge8	%i4,	%o4,	%l0
	srax	%g5,	%l4,	%o6
	fmovdne	%icc,	%f13,	%f18
	mulscc	%i5,	0x166E,	%o0
	fnors	%f23,	%f17,	%f11
	std	%f30,	[%l7 + 0x58]
	fpmerge	%f19,	%f19,	%f22
	siam	0x2
	movvc	%icc,	%l2,	%l3
	lduh	[%l7 + 0x44],	%o1
	udivx	%l6,	0x0A2E,	%g7
	fcmpeq16	%f16,	%f6,	%g6
	nop
	set	0x6E, %i0
	sth	%g3,	[%l7 + %i0]
	fnors	%f24,	%f31,	%f12
	fxor	%f8,	%f30,	%f6
	array16	%i0,	%i3,	%l1
	movneg	%xcc,	%o3,	%i7
	fmuld8sux16	%f28,	%f10,	%f2
	orncc	%g2,	0x0C38,	%i6
	movrlez	%o5,	0x392,	%i1
	subccc	%g4,	%o7,	%l5
	lduw	[%l7 + 0x30],	%o2
	array32	%i2,	%i4,	%o4
	sethi	0x0097,	%g1
	fmovdcs	%icc,	%f10,	%f11
	subcc	%g5,	0x1317,	%l4
	orcc	%o6,	%l0,	%i5
	ldd	[%l7 + 0x20],	%o0
	movleu	%xcc,	%l3,	%l2
	ld	[%l7 + 0x70],	%f13
	lduw	[%l7 + 0x34],	%o1
	movrne	%l6,	0x242,	%g6
	edge16n	%g7,	%i0,	%i3
	mova	%xcc,	%l1,	%g3
	edge16l	%i7,	%o3,	%g2
	edge8ln	%o5,	%i1,	%i6
	orcc	%o7,	%g4,	%l5
	xnorcc	%o2,	%i4,	%i2
	array16	%o4,	%g1,	%l4
	movre	%g5,	0x1A1,	%o6
	movre	%i5,	0x0EE,	%o0
	fxnor	%f2,	%f10,	%f6
	fmovrslz	%l3,	%f18,	%f4
	ld	[%l7 + 0x3C],	%f23
	alignaddrl	%l2,	%o1,	%l0
	ldsw	[%l7 + 0x44],	%l6
	movpos	%icc,	%g7,	%i0
	subcc	%g6,	0x062E,	%i3
	fmovdn	%icc,	%f24,	%f12
	edge16n	%l1,	%g3,	%o3
	smul	%i7,	0x05D2,	%g2
	movrgz	%o5,	%i1,	%o7
	lduw	[%l7 + 0x14],	%g4
	fxnors	%f5,	%f28,	%f0
	srax	%l5,	%o2,	%i4
	mulscc	%i2,	%o4,	%g1
	edge32	%i6,	%l4,	%g5
	ldsb	[%l7 + 0x2B],	%i5
	umul	%o6,	%l3,	%l2
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	sir	0x1AAF
	orncc	%l6,	%i0,	%g7
	fors	%f25,	%f19,	%f15
	fmovdcs	%xcc,	%f28,	%f19
	fcmped	%fcc3,	%f22,	%f0
	edge16	%g6,	%l1,	%g3
	edge16l	%i3,	%o3,	%i7
	sth	%g2,	[%l7 + 0x7A]
	fnot1s	%f12,	%f16
	fmovrsgz	%o5,	%f31,	%f0
	fmovsl	%xcc,	%f26,	%f29
	fmovrde	%o7,	%f14,	%f20
	udivx	%g4,	0x10C8,	%l5
	andn	%i1,	0x1F09,	%i4
	orncc	%o2,	0x1A32,	%i2
	fmovdneg	%xcc,	%f29,	%f29
	andncc	%o4,	%i6,	%l4
	ldsb	[%l7 + 0x79],	%g5
	fpadd32s	%f14,	%f16,	%f15
	movrlz	%i5,	0x09C,	%g1
	movrlez	%o6,	0x345,	%l3
	ldsw	[%l7 + 0x24],	%o1
	restore %l2, 0x0958, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	0x0D71,	%i0
	srl	%g7,	%l6,	%g6
	umulcc	%l1,	%i3,	%g3
	fmovdpos	%icc,	%f29,	%f11
	popc	%o3,	%i7
	fabsd	%f16,	%f26
	andn	%o5,	%o7,	%g4
	edge8l	%l5,	%i1,	%i4
	movrlez	%o2,	%g2,	%o4
	edge8	%i2,	%i6,	%l4
	orn	%g5,	%g1,	%o6
	fpsub32	%f14,	%f22,	%f8
	sra	%l3,	%i5,	%o1
	stw	%l0,	[%l7 + 0x38]
	umul	%o0,	%l2,	%g7
	xnorcc	%l6,	0x1808,	%i0
	ld	[%l7 + 0x20],	%f9
	movne	%xcc,	%g6,	%i3
	or	%g3,	0x19A7,	%l1
	st	%f6,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x12],	%o3
	alignaddr	%o5,	%i7,	%o7
	sub	%l5,	0x1FCA,	%i1
	edge32	%i4,	%g4,	%g2
	srlx	%o2,	0x02,	%o4
	orcc	%i6,	0x079C,	%i2
	stw	%l4,	[%l7 + 0x30]
	addcc	%g5,	%g1,	%l3
	subccc	%o6,	%i5,	%l0
	sra	%o1,	0x18,	%l2
	popc	%o0,	%l6
	orncc	%i0,	%g7,	%g6
	movge	%xcc,	%g3,	%i3
	ldx	[%l7 + 0x68],	%l1
	subcc	%o5,	%o3,	%o7
	movleu	%xcc,	%l5,	%i1
	edge16l	%i4,	%i7,	%g4
	lduw	[%l7 + 0x48],	%o2
	xnorcc	%g2,	%i6,	%o4
	mulscc	%i2,	%l4,	%g5
	fnot2s	%f30,	%f30
	fmul8x16al	%f30,	%f17,	%f22
	fornot2s	%f20,	%f3,	%f0
	pdist	%f2,	%f14,	%f22
	udivcc	%g1,	0x1634,	%o6
	edge32ln	%i5,	%l0,	%o1
	xnor	%l2,	0x1C8D,	%o0
	fmul8ulx16	%f22,	%f12,	%f22
	fpadd32s	%f13,	%f30,	%f16
	fmovda	%xcc,	%f12,	%f25
	fmovsleu	%icc,	%f20,	%f7
	xorcc	%l6,	0x08A6,	%i0
	sth	%l3,	[%l7 + 0x66]
	fmovdn	%xcc,	%f1,	%f22
	andn	%g6,	%g3,	%g7
	umulcc	%l1,	%o5,	%i3
	fand	%f12,	%f28,	%f26
	fpadd32	%f20,	%f22,	%f20
	sllx	%o7,	0x01,	%o3
	ldx	[%l7 + 0x18],	%i1
	movcc	%icc,	%l5,	%i4
	movle	%icc,	%i7,	%o2
	subccc	%g2,	%i6,	%o4
	fcmped	%fcc3,	%f30,	%f18
	array16	%g4,	%i2,	%g5
	movg	%xcc,	%l4,	%g1
	fcmple32	%f20,	%f22,	%o6
	fornot1s	%f26,	%f11,	%f15
	fpadd32	%f4,	%f16,	%f18
	movne	%icc,	%i5,	%l0
	smulcc	%l2,	0x0DD3,	%o1
	smulcc	%o0,	0x01F4,	%i0
	fornot2s	%f11,	%f23,	%f31
	movvc	%xcc,	%l3,	%g6
	edge32ln	%g3,	%l6,	%l1
	ldsh	[%l7 + 0x1C],	%g7
	fandnot2s	%f14,	%f26,	%f19
	sra	%o5,	0x16,	%o7
	ld	[%l7 + 0x0C],	%f4
	fcmps	%fcc3,	%f21,	%f16
	orcc	%i3,	%o3,	%l5
	umulcc	%i4,	0x0734,	%i1
	fcmped	%fcc2,	%f20,	%f16
	fnot2s	%f15,	%f11
	sth	%i7,	[%l7 + 0x3A]
	subccc	%o2,	0x0FE5,	%i6
	st	%f0,	[%l7 + 0x20]
	sll	%g2,	0x05,	%g4
	fzeros	%f9
	edge8l	%i2,	%g5,	%o4
	lduw	[%l7 + 0x1C],	%l4
	edge8l	%g1,	%i5,	%o6
	ldsb	[%l7 + 0x31],	%l2
	ldsw	[%l7 + 0x5C],	%l0
	fmovrdlz	%o1,	%f2,	%f14
	add	%o0,	0x03FC,	%l3
	edge32ln	%i0,	%g6,	%l6
	fmovdgu	%icc,	%f14,	%f11
	stw	%g3,	[%l7 + 0x44]
	ldd	[%l7 + 0x38],	%l0
	edge16l	%g7,	%o5,	%o7
	movcc	%xcc,	%o3,	%i3
	fmovsl	%xcc,	%f14,	%f17
	alignaddrl	%i4,	%l5,	%i7
	ldub	[%l7 + 0x57],	%i1
	array16	%i6,	%g2,	%g4
	srax	%o2,	%g5,	%i2
	mova	%icc,	%o4,	%g1
	fcmped	%fcc2,	%f14,	%f14
	movrgz	%i5,	0x01C,	%o6
	stx	%l4,	[%l7 + 0x38]
	fmovrdgz	%l2,	%f4,	%f10
	smulcc	%l0,	0x095E,	%o1
	fmovsleu	%xcc,	%f12,	%f2
	st	%f5,	[%l7 + 0x10]
	array32	%l3,	%i0,	%g6
	srax	%o0,	%g3,	%l6
	std	%f4,	[%l7 + 0x48]
	fmovscs	%icc,	%f24,	%f25
	edge32n	%l1,	%g7,	%o5
	fmovdgu	%xcc,	%f1,	%f25
	fmovsle	%icc,	%f15,	%f2
	movleu	%xcc,	%o3,	%i3
	udiv	%i4,	0x0940,	%l5
	movgu	%icc,	%i7,	%i1
	smulcc	%o7,	%g2,	%g4
	ldx	[%l7 + 0x38],	%i6
	fcmpes	%fcc0,	%f17,	%f18
	sra	%g5,	0x0D,	%o2
	andcc	%o4,	0x1763,	%i2
	fmovrde	%i5,	%f18,	%f2
	ldd	[%l7 + 0x30],	%f26
	andcc	%g1,	0x0248,	%o6
	srax	%l2,	%l0,	%o1
	udiv	%l3,	0x0C62,	%i0
	alignaddrl	%g6,	%o0,	%g3
	fxors	%f25,	%f19,	%f14
	fmovsgu	%xcc,	%f20,	%f1
	fsrc2	%f8,	%f10
	edge8n	%l4,	%l6,	%g7
	movrlz	%l1,	%o3,	%o5
	subccc	%i3,	0x0DA1,	%i4
	edge32ln	%i7,	%i1,	%l5
	udivcc	%o7,	0x0880,	%g4
	movrlez	%g2,	0x1DB,	%g5
	ldsh	[%l7 + 0x4C],	%o2
	fnors	%f18,	%f31,	%f24
	umulcc	%i6,	0x188D,	%o4
	movne	%xcc,	%i5,	%g1
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%i2
	fmovscs	%xcc,	%f8,	%f0
	subcc	%o6,	0x1D3E,	%l0
	movre	%l2,	0x1E6,	%l3
	alignaddr	%o1,	%i0,	%g6
	fones	%f0
	movgu	%icc,	%o0,	%g3
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	orcc	%l1,	0x17F7,	%g7
	addccc	%o5,	0x0256,	%o3
	srax	%i3,	0x03,	%i7
	addccc	%i4,	%i1,	%o7
	movg	%icc,	%l5,	%g2
	andncc	%g4,	%o2,	%g5
	fone	%f22
	andn	%o4,	%i5,	%i6
	andcc	%i2,	0x0324,	%g1
	move	%xcc,	%l0,	%o6
	sdivcc	%l2,	0x1087,	%l3
	xorcc	%i0,	0x10AC,	%o1
	movre	%g6,	%o0,	%g3
	move	%xcc,	%l4,	%l6
	movcc	%icc,	%l1,	%g7
	fmovrslz	%o3,	%f6,	%f20
	sdivx	%o5,	0x0715,	%i3
	stw	%i7,	[%l7 + 0x08]
	fmovdn	%xcc,	%f9,	%f8
	movn	%icc,	%i4,	%o7
	movleu	%icc,	%i1,	%g2
	andncc	%g4,	%l5,	%o2
	srlx	%g5,	%i5,	%o4
	sdiv	%i6,	0x070B,	%i2
	udivx	%l0,	0x0F5B,	%o6
	udivx	%g1,	0x0844,	%l3
	movrlz	%l2,	0x2FA,	%o1
	smul	%i0,	0x077C,	%g6
	udivcc	%g3,	0x0BCD,	%o0
	edge16ln	%l6,	%l4,	%l1
	movneg	%xcc,	%o3,	%g7
	nop
	set	0x34, %i7
	stb	%o5,	[%l7 + %i7]
	lduw	[%l7 + 0x20],	%i7
	movrlz	%i4,	%i3,	%i1
	movrgz	%g2,	0x108,	%g4
	fmovdle	%icc,	%f4,	%f17
	movpos	%xcc,	%l5,	%o7
	subcc	%g5,	0x04ED,	%i5
	movgu	%xcc,	%o2,	%o4
	edge16ln	%i2,	%l0,	%i6
	fnot1	%f28,	%f26
	stx	%g1,	[%l7 + 0x08]
	movneg	%icc,	%o6,	%l3
	sub	%l2,	0x06CB,	%i0
	fnegd	%f4,	%f8
	smul	%g6,	0x1300,	%g3
	movrgez	%o0,	0x2E8,	%o1
	edge32ln	%l6,	%l4,	%o3
	fmul8x16al	%f5,	%f3,	%f26
	smulcc	%g7,	0x13D0,	%l1
	ldsh	[%l7 + 0x7E],	%i7
	fmovda	%icc,	%f5,	%f4
	fandnot2s	%f9,	%f8,	%f22
	movvc	%xcc,	%i4,	%i3
	fpsub32s	%f19,	%f18,	%f3
	fpackfix	%f14,	%f15
	restore %o5, %i1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f22,	%f22
	fnot2s	%f25,	%f4
	subcc	%l5,	0x1D0F,	%g2
	save %o7, 0x1EE8, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	%o4,	%i5
	movleu	%xcc,	%l0,	%i6
	std	%f18,	[%l7 + 0x28]
	movn	%xcc,	%i2,	%g1
	ld	[%l7 + 0x58],	%f26
	xorcc	%l3,	0x0A9D,	%l2
	movge	%xcc,	%i0,	%o6
	add	%g6,	%g3,	%o1
	movleu	%xcc,	%o0,	%l4
	fmovrdlez	%l6,	%f22,	%f26
	popc	0x0D67,	%g7
	movvs	%xcc,	%o3,	%i7
	fmovsg	%xcc,	%f12,	%f1
	fmovs	%f26,	%f26
	movvs	%xcc,	%l1,	%i3
	fmovdn	%xcc,	%f10,	%f25
	movrgz	%i4,	0x334,	%o5
	movpos	%icc,	%i1,	%l5
	fxors	%f1,	%f16,	%f0
	faligndata	%f22,	%f26,	%f0
	sdivx	%g2,	0x0AD2,	%o7
	ldd	[%l7 + 0x38],	%f24
	subcc	%g4,	0x18B6,	%o2
	fnot2s	%f12,	%f6
	fcmpgt16	%f6,	%f20,	%o4
	movrgez	%i5,	0x340,	%g5
	xor	%l0,	%i6,	%i2
	fmuld8ulx16	%f24,	%f22,	%f28
	movgu	%xcc,	%l3,	%l2
	movre	%g1,	0x3EC,	%i0
	movne	%xcc,	%o6,	%g6
	fones	%f17
	umulcc	%g3,	%o0,	%o1
	movrlez	%l6,	0x21F,	%l4
	udivcc	%o3,	0x18FA,	%i7
	array16	%g7,	%i3,	%l1
	movre	%i4,	%i1,	%o5
	movrgz	%g2,	%o7,	%g4
	edge8l	%l5,	%o4,	%i5
	move	%icc,	%g5,	%l0
	movrgez	%o2,	%i2,	%i6
	movg	%icc,	%l3,	%g1
	movl	%xcc,	%i0,	%o6
	array16	%g6,	%l2,	%g3
	movgu	%xcc,	%o0,	%o1
	movvc	%icc,	%l4,	%l6
	stx	%o3,	[%l7 + 0x20]
	movcc	%xcc,	%g7,	%i3
	sll	%l1,	%i4,	%i1
	udivx	%i7,	0x0BE1,	%g2
	ldsh	[%l7 + 0x0C],	%o5
	movne	%xcc,	%g4,	%l5
	movrgz	%o4,	0x2F7,	%i5
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%g5
	udivcc	%l0,	0x1C1F,	%o2
	fpack32	%f12,	%f0,	%f22
	fmovdvc	%xcc,	%f0,	%f21
	fpmerge	%f6,	%f20,	%f24
	ldsh	[%l7 + 0x5C],	%o7
	fmovdg	%xcc,	%f13,	%f13
	movge	%xcc,	%i2,	%i6
	movne	%xcc,	%l3,	%i0
	smul	%o6,	0x0333,	%g1
	fsrc1	%f26,	%f30
	array16	%l2,	%g3,	%g6
	siam	0x4
	edge32ln	%o0,	%o1,	%l6
	edge16	%o3,	%g7,	%i3
	fmovrsne	%l4,	%f4,	%f28
	alignaddrl	%i4,	%l1,	%i7
	fmovdcc	%xcc,	%f15,	%f9
	alignaddrl	%i1,	%g2,	%o5
	popc	0x1161,	%g4
	fsrc2	%f26,	%f2
	srl	%l5,	%i5,	%g5
	fpadd16s	%f3,	%f7,	%f9
	lduw	[%l7 + 0x38],	%l0
	andncc	%o4,	%o7,	%i2
	movn	%icc,	%o2,	%i6
	movn	%icc,	%l3,	%o6
	edge32l	%i0,	%l2,	%g1
	lduw	[%l7 + 0x4C],	%g3
	edge32l	%o0,	%g6,	%l6
	movl	%icc,	%o3,	%g7
	movrne	%o1,	0x1F6,	%i3
	edge32ln	%l4,	%i4,	%i7
	ldsh	[%l7 + 0x70],	%i1
	fnot1	%f14,	%f16
	fmovsle	%icc,	%f11,	%f0
	andncc	%l1,	%g2,	%g4
	fmovsvs	%xcc,	%f14,	%f18
	pdist	%f6,	%f24,	%f24
	subccc	%l5,	%i5,	%o5
	xnor	%g5,	%l0,	%o7
	lduh	[%l7 + 0x74],	%i2
	array8	%o2,	%i6,	%l3
	xor	%o6,	0x070C,	%i0
	edge32ln	%o4,	%l2,	%g3
	and	%o0,	%g1,	%l6
	umul	%g6,	%o3,	%o1
	save %g7, %i3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x28],	%f5
	udivcc	%l4,	0x1F51,	%i1
	movge	%xcc,	%l1,	%i7
	array32	%g4,	%g2,	%l5
	alignaddrl	%i5,	%o5,	%l0
	fabsd	%f20,	%f12
	edge8	%g5,	%i2,	%o2
	xnorcc	%o7,	0x13E2,	%l3
	fnot1s	%f24,	%f17
	mulx	%i6,	%i0,	%o6
	fpadd32	%f6,	%f30,	%f28
	sra	%o4,	%l2,	%g3
	sra	%g1,	0x19,	%l6
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	array32	%o1,	%o3,	%g7
	andncc	%i3,	%l4,	%i1
	lduw	[%l7 + 0x20],	%l1
	umul	%i7,	%g4,	%g2
	std	%f22,	[%l7 + 0x58]
	fmovrslz	%i4,	%f31,	%f29
	stb	%i5,	[%l7 + 0x6D]
	movleu	%icc,	%o5,	%l5
	srax	%g5,	0x12,	%i2
	orncc	%o2,	%l0,	%l3
	fsrc1	%f24,	%f0
	fmuld8ulx16	%f30,	%f16,	%f26
	movpos	%xcc,	%o7,	%i6
	movrlez	%i0,	%o6,	%o4
	movgu	%xcc,	%l2,	%g3
	umulcc	%l6,	0x08A1,	%g6
	sra	%o0,	%o1,	%g1
	add	%o3,	0x07F6,	%i3
	st	%f10,	[%l7 + 0x5C]
	subc	%g7,	0x03C0,	%i1
	addc	%l1,	0x171B,	%i7
	st	%f29,	[%l7 + 0x5C]
	sub	%g4,	0x15CF,	%l4
	movpos	%icc,	%g2,	%i4
	orncc	%i5,	0x1663,	%o5
	or	%g5,	0x0BCD,	%l5
	andcc	%i2,	%o2,	%l3
	movgu	%xcc,	%o7,	%l0
	xnor	%i6,	0x1486,	%i0
	movgu	%xcc,	%o4,	%o6
	andncc	%g3,	%l6,	%l2
	move	%icc,	%o0,	%o1
	edge32l	%g6,	%g1,	%o3
	xorcc	%g7,	0x10EF,	%i3
	edge32	%l1,	%i1,	%i7
	movrlez	%l4,	0x27D,	%g2
	sub	%g4,	%i5,	%o5
	restore %g5, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l5,	0x110B,	%l3
	std	%f22,	[%l7 + 0x78]
	edge16ln	%o7,	%o2,	%i6
	fmovdle	%xcc,	%f4,	%f23
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	stw	%g3,	[%l7 + 0x08]
	srlx	%l6,	%l2,	%o4
	sdivx	%o1,	0x020E,	%g6
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%g0
	srlx	%o3,	%o0,	%g7
	fzero	%f30
	andn	%i3,	0x1F8B,	%l1
	sir	0x0ECB
	movg	%xcc,	%i7,	%i1
	edge32ln	%l4,	%g4,	%g2
	edge16l	%i5,	%g5,	%i4
	sdiv	%o5,	0x1896,	%i2
	subccc	%l3,	%l5,	%o7
	lduh	[%l7 + 0x0E],	%o2
	sdiv	%i6,	0x104C,	%i0
	movrlez	%l0,	0x26A,	%g3
	srl	%l6,	%l2,	%o4
	fmovrdgz	%o1,	%f18,	%f28
	fornot2s	%f7,	%f8,	%f1
	subccc	%g6,	0x1087,	%o6
	movle	%xcc,	%g1,	%o0
	move	%xcc,	%g7,	%i3
	alignaddr	%l1,	%o3,	%i1
	fcmpeq32	%f2,	%f28,	%l4
	ldub	[%l7 + 0x3B],	%i7
	movrgz	%g4,	0x0F9,	%i5
	fmovsne	%icc,	%f9,	%f28
	sdivcc	%g5,	0x0C88,	%g2
	srax	%i4,	%o5,	%l3
	mulscc	%l5,	%i2,	%o2
	subcc	%i6,	%o7,	%i0
	edge32ln	%g3,	%l6,	%l0
	subccc	%l2,	0x0678,	%o1
	sth	%g6,	[%l7 + 0x78]
	ldx	[%l7 + 0x50],	%o6
	edge16n	%o4,	%g1,	%o0
	fornot1	%f26,	%f4,	%f24
	fmovrde	%g7,	%f0,	%f6
	lduw	[%l7 + 0x7C],	%i3
	fmovde	%xcc,	%f5,	%f19
	fandnot1s	%f18,	%f30,	%f25
	move	%xcc,	%o3,	%l1
	xnorcc	%i1,	%i7,	%g4
	xorcc	%l4,	%g5,	%i5
	movn	%xcc,	%i4,	%o5
	move	%icc,	%l3,	%l5
	fmovsn	%icc,	%f5,	%f13
	addcc	%g2,	%i2,	%i6
	fmovdn	%xcc,	%f10,	%f4
	fnot1	%f4,	%f6
	or	%o2,	%i0,	%o7
	orncc	%l6,	%l0,	%g3
	edge8n	%o1,	%l2,	%o6
	movge	%xcc,	%o4,	%g6
	fmovrslz	%g1,	%f11,	%f27
	move	%icc,	%o0,	%g7
	movpos	%icc,	%i3,	%l1
	fornot2	%f2,	%f22,	%f0
	xor	%i1,	%o3,	%i7
	movl	%icc,	%g4,	%g5
	fcmpd	%fcc1,	%f12,	%f2
	fnands	%f18,	%f7,	%f3
	alignaddr	%l4,	%i4,	%o5
	movn	%icc,	%l3,	%l5
	movl	%icc,	%i5,	%i2
	srlx	%i6,	0x1B,	%o2
	add	%g2,	%i0,	%l6
	sllx	%l0,	%g3,	%o7
	array16	%l2,	%o6,	%o1
	andn	%o4,	0x1D1E,	%g6
	array8	%o0,	%g1,	%g7
	fmovrdgz	%i3,	%f16,	%f14
	movle	%icc,	%i1,	%o3
	st	%f13,	[%l7 + 0x44]
	edge32ln	%l1,	%i7,	%g5
	edge32	%g4,	%l4,	%o5
	fmuld8ulx16	%f30,	%f14,	%f2
	xnor	%i4,	0x01D4,	%l5
	array32	%l3,	%i2,	%i6
	fpadd32	%f12,	%f10,	%f14
	edge8	%i5,	%g2,	%o2
	sra	%i0,	%l0,	%g3
	fcmpgt16	%f26,	%f6,	%l6
	or	%l2,	%o6,	%o7
	sdivx	%o1,	0x006F,	%o4
	edge8	%o0,	%g6,	%g7
	andn	%g1,	0x0719,	%i3
	pdist	%f0,	%f4,	%f28
	ld	[%l7 + 0x48],	%f30
	fexpand	%f10,	%f14
	fornot1s	%f1,	%f5,	%f3
	sdivcc	%o3,	0x1F56,	%l1
	movrne	%i1,	0x142,	%g5
	udivcc	%i7,	0x0398,	%g4
	movneg	%icc,	%l4,	%i4
	save %l5, 0x1A4B, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o5,	0x070B,	%i2
	subcc	%i5,	%i6,	%o2
	xorcc	%g2,	0x1D26,	%l0
	popc	%i0,	%l6
	array16	%g3,	%o6,	%o7
	movleu	%icc,	%o1,	%l2
	edge32ln	%o4,	%o0,	%g6
	edge32n	%g1,	%i3,	%o3
	smul	%g7,	0x09A1,	%i1
	movg	%icc,	%l1,	%g5
	movne	%xcc,	%g4,	%l4
	ldub	[%l7 + 0x7D],	%i7
	fone	%f10
	umulcc	%i4,	0x0375,	%l5
	movre	%o5,	0x00D,	%i2
	edge16ln	%i5,	%i6,	%o2
	ld	[%l7 + 0x50],	%f27
	sdivcc	%l3,	0x0C10,	%l0
	fxnors	%f29,	%f11,	%f8
	sll	%i0,	%g2,	%g3
	edge16n	%l6,	%o6,	%o7
	sethi	0x0C88,	%o1
	array16	%l2,	%o0,	%o4
	movl	%xcc,	%g6,	%i3
	sllx	%g1,	0x08,	%o3
	movre	%i1,	%g7,	%g5
	fmovrslez	%l1,	%f17,	%f15
	edge16n	%l4,	%g4,	%i7
	fmovdn	%xcc,	%f8,	%f8
	srl	%i4,	0x0B,	%l5
	movcc	%xcc,	%o5,	%i5
	udivx	%i6,	0x0DC8,	%o2
	fcmpes	%fcc2,	%f19,	%f30
	siam	0x5
	fsrc1	%f20,	%f22
	movg	%xcc,	%l3,	%l0
	fmovspos	%icc,	%f13,	%f2
	udivx	%i0,	0x07CC,	%i2
	edge32l	%g3,	%l6,	%o6
	stx	%o7,	[%l7 + 0x18]
	ldd	[%l7 + 0x50],	%f2
	movneg	%icc,	%o1,	%l2
	smulcc	%g2,	%o4,	%g6
	udivx	%o0,	0x0F1C,	%g1
	fandnot2s	%f30,	%f25,	%f14
	andn	%o3,	%i1,	%g7
	fxnors	%f6,	%f29,	%f30
	fcmped	%fcc0,	%f2,	%f16
	move	%xcc,	%g5,	%i3
	edge8ln	%l1,	%g4,	%l4
	sethi	0x0C24,	%i7
	fmovrdlez	%i4,	%f12,	%f10
	xnorcc	%l5,	%i5,	%i6
	fpsub32s	%f26,	%f0,	%f26
	sth	%o5,	[%l7 + 0x50]
	fmovdn	%icc,	%f0,	%f12
	movcs	%xcc,	%o2,	%l0
	fmovrsgz	%i0,	%f7,	%f14
	movcc	%icc,	%i2,	%l3
	movgu	%icc,	%l6,	%o6
	std	%f6,	[%l7 + 0x58]
	orncc	%o7,	%g3,	%o1
	addccc	%l2,	0x1FC3,	%g2
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%o4
	fmovsvc	%xcc,	%f19,	%f20
	xnor	%o0,	%g6,	%o3
	sir	0x199B
	movvc	%xcc,	%i1,	%g1
	fmovsne	%xcc,	%f22,	%f10
	ldsb	[%l7 + 0x55],	%g7
	alignaddr	%i3,	%g5,	%g4
	movre	%l1,	0x1B2,	%i7
	srl	%l4,	0x0B,	%l5
	movrgez	%i4,	0x0EC,	%i5
	movleu	%icc,	%o5,	%i6
	movrgz	%o2,	%i0,	%l0
	sth	%l3,	[%l7 + 0x72]
	fmovdle	%icc,	%f31,	%f2
	orcc	%i2,	0x1090,	%l6
	move	%icc,	%o6,	%o7
	fornot2	%f4,	%f2,	%f12
	stb	%g3,	[%l7 + 0x6A]
	edge8	%o1,	%g2,	%l2
	fnegs	%f16,	%f11
	edge8n	%o0,	%g6,	%o3
	ldsb	[%l7 + 0x19],	%o4
	popc	0x1399,	%g1
	stw	%g7,	[%l7 + 0x5C]
	ldd	[%l7 + 0x28],	%i2
	fmovsgu	%xcc,	%f17,	%f29
	fcmpes	%fcc2,	%f23,	%f15
	sdiv	%g5,	0x1D8F,	%g4
	movrlz	%i1,	%l1,	%l4
	srl	%l5,	%i4,	%i7
	array16	%o5,	%i5,	%i6
	orcc	%i0,	0x0FF1,	%l0
	movge	%icc,	%l3,	%o2
	movre	%i2,	%l6,	%o6
	fcmpeq16	%f4,	%f20,	%o7
	movn	%xcc,	%o1,	%g2
	ldsw	[%l7 + 0x38],	%g3
	fors	%f10,	%f14,	%f21
	srlx	%o0,	0x1D,	%g6
	edge16n	%o3,	%l2,	%o4
	umul	%g7,	%i3,	%g1
	sdiv	%g4,	0x0BB1,	%i1
	edge8l	%l1,	%l4,	%g5
	ldsb	[%l7 + 0x68],	%i4
	addccc	%i7,	0x1294,	%o5
	std	%f12,	[%l7 + 0x60]
	movcs	%icc,	%l5,	%i5
	popc	%i0,	%l0
	fexpand	%f24,	%f10
	mulx	%l3,	%i6,	%o2
	edge16ln	%l6,	%o6,	%i2
	ld	[%l7 + 0x38],	%f8
	movrlez	%o1,	0x0E9,	%g2
	fmovdcs	%xcc,	%f1,	%f29
	edge16l	%o7,	%o0,	%g3
	udivx	%g6,	0x18B9,	%o3
	orcc	%l2,	%o4,	%i3
	andn	%g1,	0x1A9C,	%g4
	xnor	%g7,	0x15B1,	%l1
	umulcc	%i1,	%g5,	%i4
	edge16	%l4,	%o5,	%l5
	fcmps	%fcc1,	%f21,	%f6
	fsrc2	%f10,	%f16
	addc	%i7,	0x1E14,	%i0
	sll	%i5,	%l0,	%i6
	subc	%o2,	%l6,	%o6
	movleu	%icc,	%l3,	%i2
	smul	%o1,	0x08CA,	%g2
	movn	%icc,	%o7,	%o0
	stw	%g3,	[%l7 + 0x10]
	umul	%g6,	0x1934,	%l2
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%o3
	fpadd16s	%f10,	%f8,	%f18
	sth	%i3,	[%l7 + 0x48]
	movrgz	%o4,	%g1,	%g7
	sir	0x0F38
	subccc	%l1,	0x029C,	%i1
	fmovdcs	%icc,	%f14,	%f20
	and	%g4,	0x0750,	%g5
	movcs	%xcc,	%i4,	%o5
	move	%xcc,	%l5,	%l4
	edge16n	%i0,	%i7,	%i5
	fmovsn	%xcc,	%f28,	%f25
	fabsd	%f8,	%f14
	smulcc	%i6,	%o2,	%l6
	edge32l	%o6,	%l0,	%l3
	fmovsg	%xcc,	%f18,	%f26
	fabsd	%f8,	%f8
	sllx	%o1,	0x10,	%g2
	restore %i2, %o7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g3,	%g6,	%l2
	ldsb	[%l7 + 0x58],	%o3
	edge16l	%i3,	%g1,	%g7
	add	%o4,	%l1,	%g4
	srlx	%g5,	%i4,	%o5
	movneg	%xcc,	%l5,	%l4
	fmovdvs	%xcc,	%f4,	%f15
	fcmped	%fcc1,	%f18,	%f28
	edge16l	%i1,	%i7,	%i0
	udivcc	%i5,	0x166E,	%i6
	mulscc	%o2,	%l6,	%l0
	movrgez	%l3,	0x16E,	%o6
	movn	%icc,	%g2,	%i2
	movpos	%xcc,	%o7,	%o0
	udivcc	%o1,	0x0927,	%g3
	movgu	%xcc,	%l2,	%o3
	save %i3, 0x047A, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g6,	0x0D99,	%o4
	andncc	%g7,	%g4,	%l1
	fmovdcs	%xcc,	%f29,	%f0
	movre	%i4,	0x3ED,	%g5
	movvc	%icc,	%l5,	%l4
	edge16l	%o5,	%i1,	%i0
	nop
	set	0x24, %l6
	stw	%i7,	[%l7 + %l6]
	movcs	%xcc,	%i6,	%i5
	popc	%l6,	%o2
	addc	%l0,	0x1E4B,	%o6
	fmovrsgez	%g2,	%f25,	%f17
	movcc	%xcc,	%l3,	%i2
	andn	%o0,	0x1ABF,	%o1
	movrne	%g3,	%l2,	%o3
	movre	%i3,	%o7,	%g6
	save %o4, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g1,	%l1,	%i4
	add	%g5,	%l5,	%o5
	fcmple32	%f26,	%f4,	%i1
	edge32l	%l4,	%i0,	%i6
	lduh	[%l7 + 0x42],	%i5
	srl	%i7,	%o2,	%l6
	ldd	[%l7 + 0x78],	%l0
	fnand	%f18,	%f4,	%f24
	udivcc	%o6,	0x095F,	%l3
	movneg	%icc,	%i2,	%g2
	nop
	set	0x7C, %i5
	ldub	[%l7 + %i5],	%o0
	lduh	[%l7 + 0x72],	%g3
	movrlz	%o1,	0x386,	%l2
	srlx	%i3,	0x00,	%o7
	xorcc	%o3,	0x0915,	%o4
	sir	0x0437
	alignaddrl	%g7,	%g6,	%g1
	addccc	%g4,	0x0988,	%i4
	stw	%l1,	[%l7 + 0x70]
	fandnot1	%f28,	%f2,	%f20
	fnot1	%f22,	%f10
	edge8l	%l5,	%o5,	%g5
	movle	%xcc,	%l4,	%i0
	addcc	%i1,	0x153C,	%i6
	save %i7, %i5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f20,	%f31
	umulcc	%l0,	0x0579,	%o6
	smul	%l6,	0x0B99,	%i2
	xnor	%g2,	0x0BA7,	%o0
	fmovdvc	%icc,	%f18,	%f19
	srl	%g3,	%o1,	%l2
	udivcc	%i3,	0x163F,	%l3
	orn	%o3,	%o7,	%o4
	movrne	%g6,	0x2B3,	%g7
	movre	%g1,	%g4,	%l1
	xnorcc	%l5,	%o5,	%g5
	alignaddr	%l4,	%i0,	%i4
	movrgz	%i1,	%i7,	%i6
	subccc	%o2,	0x0A2C,	%l0
	movleu	%xcc,	%o6,	%l6
	fpack32	%f6,	%f2,	%f2
	movg	%icc,	%i5,	%i2
	fors	%f11,	%f22,	%f17
	movle	%icc,	%g2,	%g3
	edge8ln	%o1,	%l2,	%o0
	movvc	%xcc,	%l3,	%i3
	edge32n	%o7,	%o4,	%o3
	xor	%g6,	0x1A8E,	%g7
	sdiv	%g4,	0x12BE,	%g1
	movn	%xcc,	%l1,	%o5
	fmovsg	%icc,	%f31,	%f26
	subccc	%g5,	0x09C2,	%l5
	andncc	%l4,	%i0,	%i1
	sir	0x1232
	edge8	%i4,	%i6,	%i7
	movleu	%icc,	%l0,	%o6
	and	%o2,	0x0885,	%l6
	subc	%i2,	0x0C1A,	%i5
	movrne	%g3,	%o1,	%g2
	subc	%l2,	0x15C5,	%o0
	ldsb	[%l7 + 0x20],	%i3
	subccc	%l3,	0x1B16,	%o7
	subccc	%o3,	0x027C,	%o4
	andncc	%g6,	%g7,	%g1
	movrlz	%g4,	0x051,	%l1
	edge8	%g5,	%l5,	%l4
	edge32l	%o5,	%i0,	%i4
	sethi	0x0EE7,	%i1
	sllx	%i7,	0x15,	%i6
	sub	%l0,	0x162E,	%o6
	movle	%icc,	%o2,	%i2
	fmovd	%f18,	%f2
	movrgz	%i5,	%g3,	%l6
	edge8n	%g2,	%l2,	%o1
	edge16	%i3,	%l3,	%o0
	array16	%o7,	%o4,	%o3
	ldsh	[%l7 + 0x5E],	%g6
	fxor	%f16,	%f12,	%f22
	movleu	%icc,	%g7,	%g4
	fmovdg	%icc,	%f28,	%f27
	addc	%l1,	%g1,	%g5
	fpsub16	%f10,	%f16,	%f12
	srlx	%l5,	%o5,	%l4
	udivcc	%i0,	0x0EB6,	%i4
	sdivcc	%i7,	0x17DB,	%i6
	xorcc	%l0,	0x1CCF,	%i1
	sllx	%o6,	0x1A,	%o2
	movrgez	%i2,	0x02A,	%i5
	fmovsg	%icc,	%f1,	%f30
	movne	%xcc,	%g3,	%g2
	fcmpne16	%f18,	%f2,	%l6
	fmovda	%xcc,	%f1,	%f20
	movvs	%icc,	%l2,	%o1
	edge32l	%i3,	%l3,	%o7
	sra	%o0,	0x0A,	%o4
	ldsh	[%l7 + 0x18],	%g6
	mova	%xcc,	%o3,	%g7
	mulscc	%g4,	%l1,	%g1
	sub	%l5,	%o5,	%g5
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	stw	%i7,	[%l7 + 0x5C]
	subcc	%l0,	%i1,	%o6
	fandnot2	%f30,	%f26,	%f16
	fcmple16	%f4,	%f0,	%i6
	ldsw	[%l7 + 0x6C],	%o2
	fones	%f28
	xnor	%i5,	0x13B9,	%i2
	lduw	[%l7 + 0x10],	%g2
	addc	%g3,	0x12BF,	%l6
	fmovdgu	%xcc,	%f25,	%f25
	fmovdgu	%icc,	%f10,	%f20
	mulscc	%l2,	0x0E0C,	%o1
	movl	%icc,	%i3,	%l3
	movre	%o7,	0x37D,	%o0
	movn	%icc,	%g6,	%o4
	andn	%g7,	%o3,	%g4
	srax	%l1,	0x00,	%g1
	ldsb	[%l7 + 0x51],	%l5
	sll	%g5,	0x18,	%l4
	andncc	%o5,	%i4,	%i7
	movre	%i0,	0x33D,	%l0
	movge	%xcc,	%o6,	%i6
	fsrc1	%f2,	%f16
	fsrc1	%f18,	%f18
	fcmpeq16	%f12,	%f26,	%o2
	std	%f4,	[%l7 + 0x10]
	edge32l	%i1,	%i2,	%g2
	udivcc	%i5,	0x0FF2,	%g3
	srl	%l6,	0x06,	%l2
	edge8l	%i3,	%l3,	%o7
	addccc	%o1,	0x1CAB,	%o0
	st	%f0,	[%l7 + 0x5C]
	udivcc	%o4,	0x199A,	%g6
	edge8l	%g7,	%o3,	%g4
	fors	%f25,	%f11,	%f13
	edge16	%l1,	%l5,	%g1
	sub	%l4,	%o5,	%i4
	restore %i7, %i0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o6,	%g5
	popc	0x04B0,	%i6
	fmovrdlz	%i1,	%f18,	%f24
	movpos	%icc,	%i2,	%g2
	edge16l	%i5,	%o2,	%l6
	fmovrse	%l2,	%f2,	%f27
	fmovdvc	%icc,	%f15,	%f7
	sth	%i3,	[%l7 + 0x24]
	fmovdvc	%xcc,	%f23,	%f16
	sdiv	%l3,	0x0D7E,	%o7
	fsrc2s	%f29,	%f26
	subccc	%g3,	%o0,	%o1
	sdivx	%o4,	0x0A75,	%g7
	edge16n	%o3,	%g6,	%g4
	edge8l	%l1,	%l5,	%g1
	ldsh	[%l7 + 0x2E],	%o5
	and	%i4,	0x0370,	%l4
	subc	%i0,	%l0,	%o6
	ldx	[%l7 + 0x58],	%i7
	popc	%g5,	%i1
	edge8n	%i2,	%g2,	%i5
	edge32ln	%i6,	%l6,	%l2
	fones	%f16
	movcc	%icc,	%i3,	%l3
	movl	%xcc,	%o7,	%o2
	fcmpeq32	%f16,	%f6,	%o0
	sra	%o1,	0x05,	%o4
	fmovde	%icc,	%f18,	%f28
	orn	%g3,	%o3,	%g7
	addc	%g6,	0x0356,	%g4
	movg	%xcc,	%l5,	%l1
	fcmpd	%fcc2,	%f14,	%f20
	alignaddr	%o5,	%g1,	%l4
	st	%f3,	[%l7 + 0x40]
	for	%f12,	%f10,	%f8
	fmul8x16al	%f2,	%f1,	%f2
	edge16ln	%i0,	%l0,	%i4
	or	%i7,	%o6,	%i1
	srl	%i2,	%g2,	%g5
	array16	%i5,	%i6,	%l6
	edge8	%l2,	%l3,	%o7
	edge16n	%o2,	%i3,	%o1
	lduh	[%l7 + 0x5A],	%o4
	movg	%icc,	%g3,	%o3
	movrlez	%g7,	%g6,	%g4
	andn	%o0,	%l1,	%l5
	movrlz	%g1,	0x3A7,	%l4
	movg	%icc,	%o5,	%i0
	sir	0x0AAB
	addccc	%l0,	0x094A,	%i4
	orn	%o6,	%i1,	%i2
	fzeros	%f10
	stx	%g2,	[%l7 + 0x08]
	sra	%i7,	%i5,	%i6
	or	%g5,	%l6,	%l2
	or	%l3,	0x092A,	%o2
	fpadd32	%f24,	%f10,	%f10
	fmovdge	%icc,	%f20,	%f23
	movre	%o7,	0x3B9,	%o1
	fmovdl	%xcc,	%f0,	%f13
	movg	%icc,	%o4,	%i3
	fmul8x16al	%f6,	%f0,	%f0
	fmul8x16al	%f11,	%f2,	%f6
	ldsb	[%l7 + 0x62],	%g3
	mova	%xcc,	%o3,	%g6
	srl	%g4,	%g7,	%o0
	std	%f14,	[%l7 + 0x50]
	mulx	%l1,	%l5,	%l4
	edge32	%o5,	%i0,	%l0
	edge8l	%g1,	%i4,	%o6
	fmovdpos	%icc,	%f29,	%f9
	srlx	%i2,	%i1,	%g2
	movg	%xcc,	%i7,	%i6
	fnot1	%f0,	%f24
	subcc	%i5,	0x1EDD,	%g5
	srax	%l6,	0x12,	%l2
	or	%o2,	0x0384,	%o7
	subc	%o1,	%l3,	%o4
	fandnot2s	%f3,	%f5,	%f26
	fornot1	%f22,	%f30,	%f30
	edge16	%i3,	%o3,	%g3
	fpadd16s	%f9,	%f26,	%f3
	edge32ln	%g6,	%g4,	%g7
	sdivx	%o0,	0x1CAF,	%l5
	save %l4, 0x0CA7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o5,	0x117A,	%i0
	fmovrdlez	%g1,	%f30,	%f16
	orcc	%i4,	0x0EB6,	%l0
	array32	%o6,	%i1,	%g2
	sdiv	%i2,	0x037B,	%i7
	fzeros	%f23
	addccc	%i6,	%i5,	%g5
	movpos	%icc,	%l2,	%o2
	movne	%xcc,	%l6,	%o1
	orcc	%o7,	%o4,	%i3
	edge8	%o3,	%g3,	%g6
	fcmpd	%fcc2,	%f20,	%f6
	movle	%icc,	%g4,	%l3
	movle	%xcc,	%g7,	%o0
	fmovrdlez	%l5,	%f2,	%f12
	movcs	%icc,	%l1,	%l4
	sra	%i0,	0x03,	%o5
	sllx	%i4,	%g1,	%l0
	ld	[%l7 + 0x4C],	%f28
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%i1
	st	%f31,	[%l7 + 0x7C]
	subc	%g2,	0x1604,	%o6
	xnor	%i2,	0x012D,	%i6
	fmovde	%icc,	%f13,	%f28
	fcmped	%fcc2,	%f20,	%f22
	ldub	[%l7 + 0x3C],	%i5
	movrlz	%g5,	%i7,	%l2
	fmul8sux16	%f8,	%f12,	%f30
	sra	%o2,	0x15,	%l6
	fmovscs	%icc,	%f23,	%f9
	edge8	%o7,	%o1,	%i3
	and	%o4,	0x0C70,	%o3
	edge8n	%g3,	%g4,	%l3
	movle	%icc,	%g6,	%g7
	sra	%l5,	%l1,	%o0
	fand	%f22,	%f10,	%f22
	movge	%xcc,	%i0,	%l4
	xor	%i4,	0x1312,	%g1
	ld	[%l7 + 0x44],	%f18
	movleu	%xcc,	%o5,	%l0
	movrne	%i1,	0x2D4,	%g2
	movcc	%xcc,	%i2,	%i6
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f6
	ld	[%l7 + 0x64],	%f7
	alignaddrl	%o6,	%g5,	%i5
	ld	[%l7 + 0x20],	%f27
	movre	%i7,	%l2,	%l6
	srax	%o7,	%o2,	%i3
	fnegd	%f24,	%f2
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o4
	fcmpeq32	%f22,	%f20,	%o1
	edge8	%g3,	%g4,	%o3
	fnors	%f30,	%f0,	%f31
	fmovs	%f15,	%f24
	edge8	%l3,	%g6,	%l5
	srax	%g7,	%o0,	%i0
	srax	%l1,	%l4,	%i4
	movvc	%xcc,	%o5,	%g1
	edge16n	%i1,	%g2,	%l0
	ldsh	[%l7 + 0x20],	%i2
	std	%f22,	[%l7 + 0x40]
	movg	%xcc,	%i6,	%o6
	mova	%icc,	%g5,	%i5
	movgu	%icc,	%i7,	%l6
	ldsh	[%l7 + 0x10],	%o7
	sdivcc	%l2,	0x15B0,	%o2
	ldsb	[%l7 + 0x31],	%o4
	fmovrslz	%o1,	%f4,	%f22
	fpadd32	%f26,	%f16,	%f4
	movvs	%icc,	%g3,	%g4
	fmovsneg	%icc,	%f13,	%f1
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	movge	%xcc,	%o3,	%l5
	subcc	%g7,	%o0,	%l1
	st	%f23,	[%l7 + 0x10]
	umulcc	%l4,	0x1E03,	%i4
	edge32n	%o5,	%g1,	%i0
	movneg	%xcc,	%i1,	%l0
	ldd	[%l7 + 0x30],	%g2
	addccc	%i6,	%i2,	%o6
	xorcc	%i5,	%g5,	%i7
	udivx	%o7,	0x1817,	%l2
	fmovdcc	%icc,	%f29,	%f21
	stx	%o2,	[%l7 + 0x28]
	array16	%l6,	%o4,	%o1
	sethi	0x1E41,	%g4
	movrgez	%i3,	0x27B,	%l3
	addc	%g3,	%g6,	%l5
	fmovdge	%xcc,	%f19,	%f1
	xorcc	%o3,	%o0,	%g7
	fnegs	%f15,	%f29
	subc	%l4,	0x0FEF,	%i4
	stw	%o5,	[%l7 + 0x54]
	smul	%l1,	%i0,	%g1
	sth	%i1,	[%l7 + 0x10]
	fmovd	%f28,	%f24
	fmovsvs	%xcc,	%f23,	%f12
	fpmerge	%f16,	%f17,	%f10
	fxnor	%f0,	%f4,	%f2
	edge8n	%l0,	%g2,	%i2
	st	%f9,	[%l7 + 0x20]
	movgu	%icc,	%i6,	%i5
	udivcc	%g5,	0x0ACA,	%o6
	sir	0x065B
	subc	%i7,	0x097C,	%o7
	fmovdcs	%icc,	%f5,	%f9
	fone	%f4
	umulcc	%o2,	%l6,	%l2
	lduw	[%l7 + 0x70],	%o4
	addccc	%g4,	%i3,	%l3
	movleu	%icc,	%g3,	%g6
	fpadd16s	%f1,	%f17,	%f30
	fabsd	%f6,	%f20
	stb	%l5,	[%l7 + 0x6F]
	movcc	%icc,	%o1,	%o0
	orncc	%g7,	0x1FF2,	%o3
	fmovscc	%xcc,	%f6,	%f31
	umulcc	%i4,	%l4,	%o5
	edge16n	%i0,	%l1,	%i1
	movne	%xcc,	%l0,	%g1
	fmovrdlez	%i2,	%f26,	%f28
	array16	%g2,	%i6,	%i5
	movl	%icc,	%o6,	%g5
	ldd	[%l7 + 0x08],	%f20
	mulx	%o7,	%i7,	%o2
	restore %l6, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f25
	xor	%g4,	0x0767,	%l3
	and	%g3,	%i3,	%l5
	fmovdge	%icc,	%f7,	%f8
	alignaddr	%g6,	%o0,	%o1
	fnot1s	%f9,	%f25
	movvs	%xcc,	%o3,	%g7
	umul	%i4,	0x0C08,	%o5
	xnor	%i0,	0x1530,	%l1
	stw	%l4,	[%l7 + 0x1C]
	array8	%l0,	%i1,	%i2
	udiv	%g2,	0x0738,	%g1
	stb	%i5,	[%l7 + 0x09]
	ldsh	[%l7 + 0x2A],	%i6
	ldsh	[%l7 + 0x3E],	%g5
	lduw	[%l7 + 0x2C],	%o6
	movne	%xcc,	%i7,	%o2
	fexpand	%f22,	%f14
	fmovrdlz	%l6,	%f20,	%f26
	sll	%o7,	%l2,	%g4
	movg	%icc,	%o4,	%l3
	alignaddrl	%g3,	%l5,	%g6
	alignaddr	%o0,	%i3,	%o3
	addcc	%o1,	0x0B7D,	%g7
	ld	[%l7 + 0x5C],	%f3
	movge	%xcc,	%i4,	%i0
	alignaddr	%l1,	%o5,	%l4
	xnor	%i1,	0x08B3,	%i2
	stw	%g2,	[%l7 + 0x18]
	fnand	%f16,	%f6,	%f6
	fcmpeq16	%f24,	%f14,	%l0
	add	%i5,	0x0C48,	%i6
	st	%f13,	[%l7 + 0x54]
	edge32l	%g1,	%g5,	%o6
	ldd	[%l7 + 0x48],	%o2
	st	%f17,	[%l7 + 0x70]
	srl	%l6,	%o7,	%i7
	fmovdvs	%icc,	%f8,	%f17
	movneg	%icc,	%g4,	%l2
	ldsw	[%l7 + 0x2C],	%l3
	fmovrdne	%o4,	%f12,	%f18
	xorcc	%g3,	%g6,	%l5
	movgu	%icc,	%o0,	%i3
	nop
	set	0x30, %l2
	stx	%o1,	[%l7 + %l2]
	edge32n	%o3,	%g7,	%i0
	ldsh	[%l7 + 0x3A],	%l1
	fmovsneg	%xcc,	%f20,	%f17
	sll	%i4,	0x03,	%o5
	fmuld8sux16	%f7,	%f5,	%f20
	movgu	%xcc,	%l4,	%i1
	xnorcc	%i2,	0x0B2D,	%g2
	fmovdpos	%icc,	%f5,	%f10
	fnot1s	%f1,	%f23
	xnorcc	%l0,	0x1BBB,	%i6
	fmovrslz	%g1,	%f10,	%f21
	fornot2	%f10,	%f10,	%f6
	st	%f9,	[%l7 + 0x30]
	orcc	%g5,	0x18BE,	%o6
	movg	%xcc,	%o2,	%l6
	movge	%xcc,	%i5,	%o7
	umulcc	%g4,	0x0CE3,	%l2
	movre	%l3,	%i7,	%o4
	stw	%g6,	[%l7 + 0x78]
	subcc	%l5,	%g3,	%o0
	movrgez	%i3,	%o3,	%o1
	sllx	%i0,	0x0C,	%l1
	or	%i4,	0x1BFB,	%o5
	ldsh	[%l7 + 0x3A],	%g7
	sdivx	%i1,	0x039B,	%l4
	xorcc	%g2,	0x1C4C,	%i2
	fpmerge	%f6,	%f31,	%f30
	array32	%i6,	%g1,	%l0
	stx	%g5,	[%l7 + 0x30]
	ldsw	[%l7 + 0x40],	%o6
	subcc	%o2,	%l6,	%i5
	nop
	set	0x34, %i3
	stw	%g4,	[%l7 + %i3]
	srl	%o7,	%l3,	%l2
	ldx	[%l7 + 0x70],	%i7
	movle	%icc,	%o4,	%g6
	fmul8ulx16	%f4,	%f8,	%f10
	movneg	%xcc,	%l5,	%o0
	fmovdl	%xcc,	%f4,	%f5
	movpos	%icc,	%i3,	%o3
	srlx	%o1,	%i0,	%g3
	save %i4, %o5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	movle	%xcc,	%l4,	%i2
	xorcc	%i6,	%g2,	%l0
	std	%f18,	[%l7 + 0x20]
	addccc	%g5,	0x1291,	%g1
	st	%f29,	[%l7 + 0x6C]
	movn	%xcc,	%o2,	%l6
	movge	%icc,	%i5,	%g4
	fmuld8sux16	%f0,	%f28,	%f12
	fands	%f30,	%f22,	%f8
	movrlez	%o6,	0x03F,	%o7
	save %l3, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f0,	%f11,	%f18
	bshuffle	%f6,	%f24,	%f14
	movneg	%xcc,	%g6,	%o4
	ldsb	[%l7 + 0x71],	%o0
	movrgez	%i3,	0x0FB,	%o3
	fands	%f27,	%f27,	%f8
	udivx	%o1,	0x1792,	%l5
	fmul8x16au	%f26,	%f2,	%f6
	movg	%icc,	%i0,	%i4
	fmovspos	%icc,	%f10,	%f1
	add	%o5,	%g3,	%i1
	fone	%f14
	fzero	%f24
	fmovsge	%xcc,	%f7,	%f1
	xor	%l1,	0x150A,	%l4
	subc	%g7,	%i2,	%g2
	or	%l0,	0x18B4,	%g5
	fmovdle	%icc,	%f0,	%f20
	edge8ln	%i6,	%g1,	%l6
	lduw	[%l7 + 0x14],	%i5
	movn	%xcc,	%o2,	%g4
	alignaddrl	%o6,	%l3,	%l2
	fzeros	%f17
	ldsw	[%l7 + 0x78],	%o7
	movre	%i7,	%o4,	%g6
	movn	%xcc,	%i3,	%o0
	add	%o3,	%l5,	%o1
	fnegs	%f28,	%f17
	smul	%i4,	%o5,	%i0
	array32	%g3,	%l1,	%l4
	alignaddrl	%i1,	%g7,	%g2
	movgu	%xcc,	%i2,	%g5
	restore %i6, 0x1463, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f4,	%f12
	sra	%l6,	%i5,	%o2
	sth	%g4,	[%l7 + 0x6E]
	stb	%g1,	[%l7 + 0x5A]
	fors	%f19,	%f4,	%f14
	fnegs	%f21,	%f1
	fzero	%f30
	xorcc	%l3,	0x003B,	%o6
	movneg	%icc,	%o7,	%i7
	sll	%o4,	0x1F,	%l2
	fmul8x16al	%f15,	%f29,	%f26
	fmovsneg	%icc,	%f16,	%f12
	udivx	%i3,	0x1603,	%o0
	move	%icc,	%o3,	%g6
	alignaddr	%o1,	%l5,	%i4
	save %i0, 0x0844, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l1,	%l4,	%o5
	fmovdgu	%icc,	%f1,	%f1
	movvs	%xcc,	%g7,	%i1
	addccc	%i2,	0x1DB5,	%g2
	edge32ln	%g5,	%l0,	%i6
	or	%i5,	%o2,	%g4
	movre	%g1,	%l3,	%l6
	sdivcc	%o6,	0x1A03,	%i7
	and	%o4,	%l2,	%i3
	edge32n	%o0,	%o3,	%o7
	or	%g6,	0x09E1,	%o1
	mulx	%i4,	%l5,	%g3
	fcmpne32	%f30,	%f22,	%i0
	andncc	%l4,	%l1,	%g7
	fmovda	%xcc,	%f11,	%f26
	edge16	%i1,	%o5,	%i2
	subcc	%g5,	%l0,	%i6
	andn	%g2,	0x0096,	%i5
	ld	[%l7 + 0x60],	%f15
	fsrc1s	%f18,	%f24
	sdiv	%g4,	0x1938,	%o2
	movrlez	%g1,	%l3,	%l6
	andn	%o6,	%i7,	%l2
	ldsh	[%l7 + 0x68],	%o4
	sdiv	%i3,	0x052A,	%o3
	subc	%o0,	%g6,	%o7
	and	%i4,	0x07D4,	%l5
	fcmpne32	%f6,	%f28,	%g3
	fcmpgt32	%f12,	%f14,	%i0
	udiv	%l4,	0x0B32,	%l1
	fmovsa	%xcc,	%f2,	%f17
	ldub	[%l7 + 0x17],	%o1
	stb	%i1,	[%l7 + 0x2E]
	nop
	set	0x42, %i1
	sth	%o5,	[%l7 + %i1]
	edge16ln	%g7,	%i2,	%g5
	lduw	[%l7 + 0x48],	%l0
	edge16ln	%g2,	%i5,	%g4
	lduw	[%l7 + 0x68],	%i6
	movleu	%icc,	%g1,	%o2
	movvc	%icc,	%l3,	%l6
	fcmpgt32	%f2,	%f0,	%i7
	popc	%l2,	%o4
	faligndata	%f2,	%f26,	%f18
	st	%f23,	[%l7 + 0x70]
	stx	%o6,	[%l7 + 0x10]
	ldd	[%l7 + 0x08],	%o2
	edge32l	%i3,	%g6,	%o0
	sdivx	%i4,	0x075C,	%l5
	sir	0x16DE
	sdiv	%o7,	0x1E90,	%i0
	fmovdpos	%xcc,	%f7,	%f3
	andncc	%g3,	%l1,	%o1
	popc	0x08DB,	%l4
	movge	%xcc,	%i1,	%o5
	movrgez	%g7,	0x1FC,	%i2
	sir	0x1DF3
	addccc	%l0,	%g5,	%i5
	move	%xcc,	%g4,	%i6
	stw	%g2,	[%l7 + 0x14]
	movle	%icc,	%o2,	%g1
	srl	%l6,	%l3,	%l2
	umul	%o4,	%o6,	%i7
	array16	%o3,	%g6,	%i3
	andn	%o0,	%l5,	%o7
	ldd	[%l7 + 0x30],	%i4
	orcc	%i0,	0x0545,	%g3
	xorcc	%o1,	%l1,	%l4
	mulx	%o5,	0x1F75,	%i1
	edge8	%i2,	%l0,	%g5
	orncc	%i5,	%g4,	%g7
	stb	%i6,	[%l7 + 0x20]
	array16	%g2,	%o2,	%l6
	movneg	%icc,	%g1,	%l2
	fpadd16s	%f30,	%f20,	%f22
	edge8	%l3,	%o4,	%o6
	popc	%o3,	%g6
	fnegs	%f12,	%f2
	fnot1	%f8,	%f16
	movrgez	%i3,	0x2AB,	%o0
	fcmple16	%f8,	%f18,	%i7
	subcc	%l5,	%o7,	%i4
	fmovsne	%xcc,	%f9,	%f28
	movcs	%xcc,	%g3,	%o1
	fmovdne	%icc,	%f16,	%f26
	for	%f16,	%f12,	%f4
	std	%f28,	[%l7 + 0x58]
	movcc	%xcc,	%l1,	%l4
	udivx	%o5,	0x0029,	%i1
	ldd	[%l7 + 0x38],	%f4
	fpack16	%f12,	%f19
	udivcc	%i0,	0x18E1,	%i2
	and	%g5,	%i5,	%g4
	movle	%xcc,	%g7,	%l0
	edge8ln	%i6,	%o2,	%l6
	movrlz	%g2,	0x02A,	%l2
	xnor	%l3,	%g1,	%o6
	std	%f20,	[%l7 + 0x60]
	st	%f25,	[%l7 + 0x14]
	xnorcc	%o4,	0x0A55,	%g6
	movl	%xcc,	%i3,	%o0
	xorcc	%o3,	0x0DBB,	%l5
	fandnot1	%f18,	%f26,	%f10
	movpos	%icc,	%i7,	%i4
	orn	%o7,	%o1,	%l1
	edge8l	%l4,	%o5,	%g3
	movne	%icc,	%i0,	%i2
	fpadd16s	%f18,	%f28,	%f31
	xor	%g5,	%i5,	%g4
	sll	%i1,	%l0,	%i6
	edge32l	%o2,	%l6,	%g7
	array32	%g2,	%l2,	%g1
	movrlz	%o6,	0x2E0,	%o4
	array32	%l3,	%g6,	%i3
	movcs	%xcc,	%o3,	%o0
	movrne	%i7,	%i4,	%o7
	fmovrde	%l5,	%f10,	%f26
	lduw	[%l7 + 0x74],	%l1
	nop
	set	0x5D, %l5
	ldub	[%l7 + %l5],	%l4
	srlx	%o1,	%g3,	%o5
	movgu	%icc,	%i0,	%i2
	mova	%xcc,	%i5,	%g5
	fmovdgu	%icc,	%f8,	%f18
	addc	%g4,	%i1,	%l0
	sethi	0x1BAE,	%o2
	andcc	%i6,	0x00F0,	%l6
	movge	%xcc,	%g2,	%l2
	fpsub16	%f22,	%f8,	%f0
	orn	%g7,	%o6,	%g1
	movre	%o4,	0x0E5,	%l3
	sub	%i3,	%g6,	%o0
	smul	%i7,	0x1FE0,	%i4
	xnorcc	%o7,	%l5,	%l1
	lduw	[%l7 + 0x0C],	%l4
	fmovdg	%xcc,	%f26,	%f22
	movleu	%icc,	%o3,	%g3
	array16	%o1,	%o5,	%i2
	ldsh	[%l7 + 0x2A],	%i5
	alignaddrl	%i0,	%g4,	%i1
	add	%g5,	%o2,	%l0
	fmovrsne	%l6,	%f15,	%f7
	movvc	%xcc,	%i6,	%g2
	fmovrsne	%l2,	%f27,	%f31
	popc	0x1CB7,	%g7
	st	%f5,	[%l7 + 0x28]
	stw	%o6,	[%l7 + 0x64]
	edge32	%o4,	%l3,	%g1
	fcmps	%fcc3,	%f25,	%f23
	movre	%i3,	0x0E4,	%o0
	movrne	%i7,	%g6,	%i4
	subccc	%o7,	0x0480,	%l5
	fxnor	%f0,	%f8,	%f8
	ldsh	[%l7 + 0x6A],	%l1
	movrlz	%o3,	%l4,	%o1
	movpos	%xcc,	%o5,	%g3
	ldub	[%l7 + 0x2C],	%i5
	add	%i2,	%g4,	%i1
	st	%f2,	[%l7 + 0x0C]
	umul	%g5,	%o2,	%l0
	move	%xcc,	%l6,	%i0
	fornot2	%f24,	%f30,	%f0
	movrlz	%g2,	0x17A,	%l2
	fmovspos	%xcc,	%f23,	%f3
	addc	%i6,	%g7,	%o6
	fcmpne32	%f28,	%f16,	%o4
	and	%l3,	0x0338,	%g1
	fmovsg	%icc,	%f24,	%f24
	nop
	set	0x60, %g6
	ldsh	[%l7 + %g6],	%o0
	edge32n	%i3,	%i7,	%i4
	xorcc	%g6,	%l5,	%l1
	xor	%o7,	%l4,	%o1
	fmovrdgez	%o3,	%f26,	%f20
	fandnot2	%f14,	%f30,	%f20
	movle	%icc,	%g3,	%i5
	ldx	[%l7 + 0x70],	%o5
	udiv	%i2,	0x1F2E,	%i1
	movvs	%icc,	%g5,	%g4
	edge8ln	%o2,	%l0,	%l6
	alignaddr	%i0,	%l2,	%g2
	movcs	%xcc,	%g7,	%i6
	movrlz	%o6,	0x211,	%l3
	mulscc	%o4,	0x17AA,	%g1
	movne	%icc,	%o0,	%i3
	ld	[%l7 + 0x7C],	%f7
	edge8l	%i4,	%i7,	%g6
	xorcc	%l5,	%o7,	%l4
	fmovdcc	%xcc,	%f22,	%f16
	edge16	%o1,	%l1,	%o3
	sethi	0x1C30,	%g3
	ldd	[%l7 + 0x18],	%i4
	andcc	%o5,	0x1867,	%i2
	movneg	%icc,	%i1,	%g5
	edge16ln	%o2,	%l0,	%l6
	lduh	[%l7 + 0x6C],	%i0
	sra	%l2,	%g4,	%g2
	movrgez	%i6,	0x17C,	%g7
	ldx	[%l7 + 0x30],	%o6
	or	%o4,	%l3,	%g1
	movrne	%i3,	0x101,	%i4
	sll	%o0,	0x11,	%i7
	fcmpeq32	%f30,	%f4,	%g6
	andcc	%l5,	%o7,	%l4
	edge16l	%o1,	%o3,	%l1
	sll	%i5,	%g3,	%i2
	srlx	%i1,	0x19,	%o5
	movgu	%xcc,	%g5,	%o2
	ld	[%l7 + 0x58],	%f19
	ldx	[%l7 + 0x78],	%l6
	movcs	%xcc,	%l0,	%l2
	edge32n	%g4,	%i0,	%g2
	fmovsle	%icc,	%f16,	%f2
	fmovdleu	%xcc,	%f21,	%f5
	nop
	set	0x28, %l1
	sth	%i6,	[%l7 + %l1]
	xor	%o6,	0x15C2,	%g7
	fnands	%f9,	%f24,	%f11
	ld	[%l7 + 0x48],	%f24
	umul	%l3,	%g1,	%o4
	sdiv	%i4,	0x1A51,	%i3
	alignaddr	%o0,	%g6,	%l5
	andncc	%o7,	%i7,	%o1
	umulcc	%o3,	%l4,	%l1
	umul	%i5,	%g3,	%i1
	udivcc	%o5,	0x0748,	%g5
	movpos	%xcc,	%o2,	%i2
	stb	%l0,	[%l7 + 0x0E]
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	lduw	[%l7 + 0x5C],	%g2
	fmovse	%icc,	%f23,	%f14
	ldx	[%l7 + 0x28],	%l2
	sethi	0x107A,	%i6
	alignaddr	%o6,	%g7,	%l3
	mova	%xcc,	%g1,	%i4
	ldsb	[%l7 + 0x27],	%i3
	udiv	%o0,	0x08F3,	%g6
	fsrc1s	%f8,	%f9
	fpadd32s	%f12,	%f25,	%f1
	addcc	%l5,	0x03F5,	%o4
	nop
	set	0x0C, %o2
	ldub	[%l7 + %o2],	%i7
	movge	%icc,	%o7,	%o1
	ldsh	[%l7 + 0x50],	%o3
	fmovdge	%icc,	%f15,	%f1
	addc	%l1,	%l4,	%i5
	move	%icc,	%i1,	%g3
	movneg	%icc,	%o5,	%g5
	edge16l	%i2,	%o2,	%l0
	srl	%l6,	0x16,	%g4
	nop
	set	0x2A, %i4
	ldsh	[%l7 + %i4],	%i0
	orncc	%g2,	0x18F6,	%l2
	sdivcc	%o6,	0x1231,	%g7
	fmovdle	%icc,	%f27,	%f3
	fones	%f31
	fmovrdne	%i6,	%f28,	%f22
	movvc	%xcc,	%l3,	%g1
	stw	%i3,	[%l7 + 0x4C]
	ldd	[%l7 + 0x58],	%f4
	fmovd	%f0,	%f14
	edge16ln	%i4,	%g6,	%o0
	xorcc	%o4,	%l5,	%o7
	edge32	%i7,	%o1,	%l1
	orncc	%l4,	0x1DEE,	%i5
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%o2
	orcc	%i1,	0x1FD6,	%g3
	alignaddr	%o5,	%g5,	%i2
	fandnot2	%f16,	%f14,	%f4
	ldub	[%l7 + 0x72],	%o2
	movge	%xcc,	%l6,	%g4
	fmovsvc	%xcc,	%f4,	%f12
	edge32n	%l0,	%i0,	%g2
	stb	%o6,	[%l7 + 0x50]
	movrgez	%l2,	0x1FF,	%i6
	movn	%xcc,	%l3,	%g7
	smul	%i3,	%i4,	%g6
	fcmped	%fcc3,	%f28,	%f20
	subc	%o0,	0x0109,	%g1
	fnot1	%f6,	%f22
	edge16l	%l5,	%o4,	%o7
	or	%i7,	0x0434,	%o1
	srlx	%l4,	0x09,	%l1
	fzeros	%f5
	orn	%i5,	0x0E4B,	%i1
	movrgz	%o3,	%o5,	%g5
	movcc	%icc,	%i2,	%o2
	srax	%l6,	0x14,	%g4
	edge8n	%g3,	%i0,	%l0
	andcc	%o6,	0x16FC,	%g2
	xorcc	%i6,	%l3,	%l2
	fmovse	%icc,	%f11,	%f25
	movrlz	%g7,	%i3,	%g6
	movl	%xcc,	%o0,	%i4
	save %l5, %o4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f20,	%f21
	xnor	%i7,	%g1,	%o1
	sethi	0x078D,	%l4
	bshuffle	%f8,	%f2,	%f4
	movleu	%icc,	%l1,	%i1
	fzero	%f12
	fmovrsgz	%i5,	%f24,	%f20
	mulscc	%o3,	%g5,	%o5
	subccc	%i2,	%l6,	%o2
	fpmerge	%f14,	%f14,	%f24
	subcc	%g4,	%g3,	%l0
	movrlz	%o6,	%i0,	%i6
	edge16l	%g2,	%l3,	%l2
	movrlz	%i3,	%g6,	%g7
	fpadd16	%f14,	%f8,	%f28
	array8	%o0,	%i4,	%l5
	smulcc	%o4,	%o7,	%g1
	xorcc	%i7,	%l4,	%l1
	fandnot2	%f6,	%f14,	%f22
	or	%i1,	0x18B9,	%o1
	stb	%o3,	[%l7 + 0x55]
	movcc	%xcc,	%i5,	%g5
	fmovdcs	%xcc,	%f10,	%f0
	ldsb	[%l7 + 0x66],	%i2
	sll	%l6,	0x18,	%o5
	edge8l	%o2,	%g4,	%l0
	movrlez	%o6,	%g3,	%i6
	fornot2s	%f4,	%f16,	%f21
	fmovsneg	%xcc,	%f8,	%f29
	movleu	%xcc,	%g2,	%l3
	sdivcc	%l2,	0x0DE7,	%i0
	edge8n	%g6,	%i3,	%g7
	andcc	%o0,	0x018F,	%l5
	movn	%xcc,	%o4,	%o7
	mulscc	%i4,	0x0279,	%g1
	edge8	%l4,	%l1,	%i7
	movre	%i1,	%o3,	%i5
	movvs	%icc,	%g5,	%o1
	andn	%l6,	0x0D76,	%i2
	movcs	%xcc,	%o5,	%g4
	ldd	[%l7 + 0x60],	%o2
	subccc	%l0,	%o6,	%g3
	stw	%i6,	[%l7 + 0x68]
	movge	%xcc,	%l3,	%l2
	fmovdl	%xcc,	%f6,	%f22
	mova	%xcc,	%g2,	%g6
	ldsw	[%l7 + 0x38],	%i3
	popc	0x1B3F,	%i0
	fmovsa	%xcc,	%f24,	%f16
	edge8n	%g7,	%l5,	%o4
	edge16ln	%o0,	%o7,	%g1
	smul	%i4,	0x1B5E,	%l4
	sll	%i7,	%i1,	%o3
	movle	%xcc,	%l1,	%i5
	movvc	%icc,	%o1,	%l6
	fmovdle	%xcc,	%f11,	%f5
	fandnot1	%f26,	%f20,	%f30
	edge32ln	%i2,	%g5,	%o5
	movvc	%icc,	%g4,	%l0
	fmul8x16	%f14,	%f28,	%f6
	addc	%o2,	0x067D,	%g3
	fmul8x16au	%f3,	%f8,	%f12
	ld	[%l7 + 0x50],	%f30
	addc	%o6,	0x11F7,	%i6
	sll	%l2,	%g2,	%l3
	movne	%icc,	%g6,	%i0
	fcmps	%fcc0,	%f11,	%f25
	mova	%icc,	%i3,	%g7
	udivcc	%l5,	0x1E19,	%o4
	andncc	%o0,	%o7,	%g1
	udiv	%i4,	0x1E32,	%l4
	subc	%i1,	%o3,	%l1
	addc	%i5,	0x0E12,	%o1
	fmovdneg	%icc,	%f29,	%f10
	mulx	%i7,	%l6,	%g5
	fmovsn	%xcc,	%f17,	%f3
	fcmps	%fcc0,	%f24,	%f22
	srlx	%i2,	0x14,	%g4
	edge8n	%o5,	%l0,	%g3
	movcc	%icc,	%o6,	%i6
	movrlez	%o2,	%l2,	%g2
	move	%icc,	%g6,	%l3
	movcs	%xcc,	%i0,	%i3
	ldsb	[%l7 + 0x41],	%g7
	array16	%l5,	%o0,	%o4
	array16	%g1,	%o7,	%l4
	edge32n	%i1,	%o3,	%l1
	fmuld8ulx16	%f14,	%f5,	%f4
	movn	%xcc,	%i4,	%o1
	movcs	%xcc,	%i7,	%i5
	ldub	[%l7 + 0x0A],	%l6
	edge16n	%g5,	%g4,	%o5
	xor	%l0,	%g3,	%o6
	movn	%icc,	%i2,	%o2
	orcc	%l2,	%g2,	%i6
	sdivx	%g6,	0x1D2C,	%l3
	fmuld8sux16	%f15,	%f20,	%f26
	stx	%i3,	[%l7 + 0x48]
	movcs	%icc,	%i0,	%l5
	array32	%o0,	%o4,	%g7
	movre	%g1,	%o7,	%i1
	fcmpgt16	%f28,	%f4,	%l4
	fsrc1s	%f21,	%f31
	addcc	%l1,	0x0778,	%i4
	movcc	%icc,	%o1,	%o3
	srax	%i5,	0x07,	%l6
	fpadd32	%f4,	%f26,	%f28
	fmovrdlz	%i7,	%f16,	%f10
	array32	%g4,	%o5,	%g5
	stw	%l0,	[%l7 + 0x60]
	or	%o6,	0x0360,	%g3
	alignaddrl	%i2,	%l2,	%g2
	movrne	%o2,	%i6,	%l3
	edge32ln	%g6,	%i0,	%l5
	edge16n	%i3,	%o4,	%o0
	addccc	%g1,	0x08F0,	%g7
	udivcc	%i1,	0x0223,	%l4
	fmovse	%icc,	%f27,	%f12
	movrlz	%l1,	%o7,	%i4
	andncc	%o1,	%i5,	%o3
	srlx	%l6,	0x05,	%i7
	or	%o5,	%g4,	%g5
	save %l0, 0x1AFB, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f15,	[%l7 + 0x7C]
	ldd	[%l7 + 0x30],	%f22
	edge32n	%i2,	%o6,	%l2
	edge16ln	%o2,	%g2,	%l3
	fmovrdlz	%g6,	%f22,	%f2
	orn	%i6,	0x0E27,	%l5
	restore %i0, %o4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f24,	%f22,	%f20
	movg	%icc,	%g1,	%g7
	andn	%i3,	%i1,	%l4
	stx	%l1,	[%l7 + 0x18]
	smulcc	%o7,	%i4,	%o1
	orncc	%i5,	%o3,	%i7
	sth	%o5,	[%l7 + 0x5C]
	sdivx	%g4,	0x0C83,	%g5
	ldx	[%l7 + 0x08],	%l0
	fsrc1	%f12,	%f4
	sllx	%l6,	0x1F,	%i2
	ldsb	[%l7 + 0x70],	%g3
	sir	0x0295
	smulcc	%o6,	0x0CE7,	%l2
	st	%f29,	[%l7 + 0x64]
	subccc	%o2,	%l3,	%g2
	addccc	%g6,	%l5,	%i0
	ldub	[%l7 + 0x18],	%o4
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	xnor	%o0,	%g7,	%i3
	sllx	%l4,	%l1,	%o7
	fnot2s	%f8,	%f31
	edge8	%i4,	%o1,	%i1
	fmovse	%icc,	%f22,	%f24
	edge16n	%i5,	%o3,	%i7
	udiv	%o5,	0x189B,	%g5
	edge32n	%g4,	%l6,	%i2
	fzero	%f18
	addc	%l0,	0x138B,	%g3
	popc	%l2,	%o6
	srl	%l3,	0x01,	%o2
	sub	%g6,	0x164C,	%g2
	alignaddrl	%i0,	%o4,	%i6
	fmul8x16al	%f2,	%f17,	%f12
	movvs	%xcc,	%l5,	%g1
	sub	%g7,	%i3,	%o0
	smul	%l1,	%o7,	%l4
	fabss	%f28,	%f24
	fmovd	%f2,	%f20
	fmovdge	%icc,	%f24,	%f2
	andn	%o1,	%i1,	%i5
	movl	%xcc,	%i4,	%o3
	sth	%i7,	[%l7 + 0x7E]
	udivcc	%o5,	0x1D52,	%g4
	umul	%g5,	%i2,	%l6
	nop
	set	0x33, %o6
	ldsb	[%l7 + %o6],	%g3
	ldd	[%l7 + 0x28],	%f12
	ldd	[%l7 + 0x38],	%f14
	movg	%icc,	%l0,	%o6
	addc	%l3,	0x0A2F,	%l2
	fmovdle	%xcc,	%f23,	%f25
	movrgz	%g6,	0x276,	%g2
	movvc	%xcc,	%i0,	%o2
	move	%xcc,	%i6,	%l5
	movg	%icc,	%g1,	%g7
	ldx	[%l7 + 0x70],	%i3
	srax	%o0,	0x02,	%o4
	add	%l1,	%o7,	%o1
	fnands	%f20,	%f18,	%f19
	smulcc	%l4,	0x1167,	%i5
	and	%i4,	%o3,	%i1
	save %o5, %g4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x58]
	fmovrslez	%i7,	%f21,	%f28
	fmovdg	%icc,	%f19,	%f0
	mulscc	%l6,	0x02D0,	%i2
	fcmpgt16	%f14,	%f0,	%l0
	fmovscs	%xcc,	%f24,	%f17
	add	%g3,	%o6,	%l3
	xor	%g6,	%g2,	%i0
	movcc	%xcc,	%o2,	%i6
	fsrc1	%f6,	%f18
	smulcc	%l2,	%l5,	%g1
	edge8l	%i3,	%o0,	%o4
	array8	%g7,	%l1,	%o1
	fmovrse	%l4,	%f13,	%f9
	ld	[%l7 + 0x6C],	%f20
	lduh	[%l7 + 0x2E],	%o7
	edge32	%i5,	%i4,	%o3
	sub	%i1,	%g4,	%o5
	fmovsgu	%icc,	%f28,	%f23
	movgu	%xcc,	%i7,	%l6
	sllx	%i2,	0x17,	%l0
	fmovrse	%g3,	%f8,	%f17
	fpadd32s	%f17,	%f0,	%f19
	edge32n	%g5,	%o6,	%g6
	ldsb	[%l7 + 0x53],	%g2
	edge8	%i0,	%l3,	%o2
	mulx	%i6,	%l2,	%l5
	fmovspos	%xcc,	%f10,	%f23
	addc	%i3,	%g1,	%o0
	movcc	%icc,	%g7,	%o4
	movg	%icc,	%l1,	%o1
	ldub	[%l7 + 0x79],	%o7
	movcs	%xcc,	%i5,	%l4
	movrgez	%i4,	0x214,	%i1
	sth	%g4,	[%l7 + 0x44]
	edge16ln	%o3,	%o5,	%l6
	movneg	%xcc,	%i7,	%l0
	array16	%i2,	%g3,	%g5
	udivcc	%g6,	0x19E0,	%g2
	movpos	%icc,	%i0,	%o6
	alignaddrl	%o2,	%l3,	%l2
	addccc	%i6,	%l5,	%g1
	ldsh	[%l7 + 0x50],	%o0
	subcc	%g7,	%o4,	%i3
	umul	%l1,	0x056A,	%o7
	add	%i5,	0x03C5,	%l4
	edge32ln	%o1,	%i4,	%i1
	nop
	set	0x1C, %g1
	lduh	[%l7 + %g1],	%g4
	stb	%o5,	[%l7 + 0x34]
	alignaddr	%o3,	%i7,	%l0
	udivcc	%i2,	0x07CB,	%g3
	srlx	%l6,	0x17,	%g6
	subccc	%g2,	%i0,	%g5
	movrgz	%o2,	0x367,	%o6
	fpadd16s	%f1,	%f10,	%f22
	subcc	%l2,	0x0A9A,	%l3
	st	%f18,	[%l7 + 0x68]
	movrne	%i6,	0x134,	%g1
	movpos	%icc,	%l5,	%g7
	fmovs	%f29,	%f2
	udivx	%o4,	0x1F32,	%o0
	array8	%l1,	%i3,	%o7
	fpsub32s	%f19,	%f18,	%f22
	fmovrde	%i5,	%f6,	%f10
	andcc	%l4,	%o1,	%i4
	sll	%i1,	0x1F,	%g4
	movrne	%o5,	0x264,	%o3
	xnorcc	%i7,	%i2,	%g3
	smul	%l0,	%g6,	%g2
	movrgz	%l6,	0x1C7,	%g5
	fmovdpos	%xcc,	%f31,	%f1
	orcc	%o2,	%o6,	%i0
	fxor	%f26,	%f22,	%f22
	edge16l	%l2,	%i6,	%l3
	movre	%g1,	%g7,	%o4
	xnorcc	%o0,	0x04AA,	%l1
	fand	%f28,	%f12,	%f20
	xnorcc	%i3,	%o7,	%l5
	movrlez	%i5,	0x1F5,	%o1
	fcmple16	%f12,	%f12,	%i4
	alignaddr	%l4,	%g4,	%i1
	addc	%o3,	0x18C5,	%i7
	sra	%o5,	0x06,	%g3
	edge8	%l0,	%i2,	%g6
	orncc	%g2,	%g5,	%l6
	fpmerge	%f28,	%f11,	%f20
	movcc	%icc,	%o2,	%o6
	fpsub32s	%f23,	%f4,	%f21
	edge16l	%l2,	%i0,	%l3
	fpsub16	%f24,	%f26,	%f26
	sethi	0x0EB0,	%i6
	ldx	[%l7 + 0x50],	%g1
	or	%g7,	0x06F5,	%o0
	subcc	%o4,	%l1,	%o7
	movg	%xcc,	%l5,	%i5
	mova	%icc,	%o1,	%i3
	fmovsneg	%xcc,	%f1,	%f10
	udiv	%l4,	0x0D0E,	%i4
	sub	%g4,	0x16E5,	%o3
	edge16n	%i7,	%i1,	%g3
	umul	%l0,	0x1901,	%i2
	fpsub32	%f10,	%f10,	%f10
	edge16n	%o5,	%g6,	%g2
	fornot1	%f0,	%f4,	%f20
	movvc	%icc,	%l6,	%g5
	fpsub32s	%f2,	%f25,	%f8
	movle	%xcc,	%o2,	%o6
	fcmpeq16	%f24,	%f4,	%l2
	st	%f3,	[%l7 + 0x64]
	edge32n	%l3,	%i0,	%g1
	stb	%i6,	[%l7 + 0x32]
	addcc	%g7,	0x0B03,	%o4
	edge16n	%o0,	%l1,	%o7
	sra	%i5,	0x0A,	%l5
	edge32n	%i3,	%l4,	%o1
	movrgz	%i4,	0x2DA,	%g4
	sethi	0x01FE,	%i7
	sll	%i1,	0x18,	%g3
	fxnors	%f13,	%f18,	%f13
	fmovs	%f30,	%f8
	fmovs	%f1,	%f28
	udivx	%o3,	0x04FF,	%l0
	sll	%i2,	%o5,	%g6
	edge16n	%g2,	%l6,	%o2
	ldsb	[%l7 + 0x7F],	%g5
	movvs	%xcc,	%l2,	%o6
	edge32ln	%l3,	%g1,	%i0
	lduh	[%l7 + 0x0E],	%g7
	fmovda	%xcc,	%f22,	%f19
	array32	%o4,	%i6,	%l1
	ldub	[%l7 + 0x5E],	%o0
	fpsub32	%f20,	%f0,	%f0
	edge16n	%i5,	%o7,	%i3
	edge16	%l5,	%o1,	%l4
	fcmpgt32	%f14,	%f18,	%g4
	fornot1s	%f22,	%f27,	%f1
	andncc	%i4,	%i7,	%g3
	edge32l	%o3,	%i1,	%l0
	sdiv	%i2,	0x0E9C,	%o5
	std	%f4,	[%l7 + 0x68]
	xnor	%g6,	0x038D,	%l6
	mova	%icc,	%o2,	%g2
	save %l2, %g5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1123,	%l3
	udivcc	%g1,	0x07E9,	%i0
	ldx	[%l7 + 0x68],	%g7
	mulscc	%o4,	0x1017,	%i6
	fmovdge	%icc,	%f28,	%f6
	nop
	set	0x52, %l0
	ldsh	[%l7 + %l0],	%o0
	movrlez	%l1,	%o7,	%i5
	sdiv	%i3,	0x1C0B,	%l5
	ldd	[%l7 + 0x28],	%l4
	edge16n	%g4,	%i4,	%o1
	orcc	%i7,	%o3,	%g3
	ldsh	[%l7 + 0x60],	%i1
	orn	%i2,	%l0,	%g6
	std	%f22,	[%l7 + 0x20]
	fnot2s	%f20,	%f3
	addc	%l6,	0x12B3,	%o5
	andncc	%g2,	%l2,	%o2
	sll	%g5,	%o6,	%l3
	ldsw	[%l7 + 0x1C],	%i0
	orncc	%g1,	0x0C27,	%o4
	xor	%g7,	%o0,	%i6
	udivcc	%l1,	0x17F0,	%i5
	sll	%i3,	0x1D,	%l5
	fmuld8ulx16	%f10,	%f12,	%f4
	pdist	%f12,	%f26,	%f30
	sir	0x16D3
	subccc	%l4,	%g4,	%i4
	movg	%xcc,	%o1,	%o7
	array8	%i7,	%o3,	%g3
	fabsd	%f12,	%f8
	fmovde	%icc,	%f22,	%f30
	stx	%i1,	[%l7 + 0x10]
	xorcc	%l0,	%g6,	%l6
	ldsh	[%l7 + 0x5E],	%o5
	movrgz	%g2,	0x327,	%i2
	std	%f8,	[%l7 + 0x58]
	edge32ln	%o2,	%l2,	%g5
	xnor	%o6,	0x057D,	%i0
	alignaddrl	%g1,	%o4,	%l3
	fandnot2s	%f28,	%f31,	%f7
	fpsub32s	%f3,	%f3,	%f31
	movg	%xcc,	%g7,	%o0
	subcc	%l1,	%i6,	%i3
	nop
	set	0x70, %g7
	ldsh	[%l7 + %g7],	%l5
	sllx	%l4,	0x1C,	%i5
	srax	%i4,	0x0E,	%g4
	movcc	%icc,	%o7,	%o1
	fsrc1s	%f27,	%f19
	edge32ln	%i7,	%g3,	%i1
	array8	%l0,	%g6,	%l6
	movvc	%xcc,	%o3,	%o5
	movleu	%icc,	%g2,	%o2
	subc	%i2,	0x0239,	%g5
	fmovs	%f2,	%f19
	alignaddrl	%l2,	%o6,	%g1
	sll	%i0,	0x1D,	%o4
	sllx	%g7,	0x16,	%l3
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%o0
	movrgz	%i6,	0x29A,	%i3
	ldx	[%l7 + 0x28],	%l1
	mulx	%l5,	0x18B7,	%l4
	subccc	%i5,	0x1055,	%i4
	movrne	%g4,	%o1,	%o7
	movne	%icc,	%g3,	%i7
	fsrc1	%f26,	%f18
	lduh	[%l7 + 0x3A],	%l0
	edge16n	%g6,	%l6,	%o3
	stw	%i1,	[%l7 + 0x68]
	edge32	%o5,	%o2,	%g2
	fmovrdne	%i2,	%f10,	%f28
	xorcc	%g5,	0x1177,	%o6
	or	%g1,	0x0DD2,	%i0
	add	%l2,	0x0F8D,	%o4
	and	%g7,	%l3,	%o0
	fsrc2	%f14,	%f2
	fpadd16	%f0,	%f6,	%f14
	edge32ln	%i3,	%i6,	%l5
	movn	%icc,	%l4,	%i5
	mova	%xcc,	%i4,	%l1
	fandnot1s	%f5,	%f9,	%f8
	movge	%xcc,	%g4,	%o1
	umulcc	%g3,	0x0800,	%o7
	xorcc	%l0,	%i7,	%g6
	edge8	%l6,	%o3,	%i1
	lduh	[%l7 + 0x08],	%o2
	fmul8x16	%f9,	%f30,	%f24
	ld	[%l7 + 0x28],	%f29
	smul	%g2,	%o5,	%g5
	umulcc	%o6,	%g1,	%i2
	save %i0, %l2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l3,	[%l7 + 0x72]
	fand	%f14,	%f8,	%f10
	fmovrdlez	%o4,	%f0,	%f18
	movne	%icc,	%o0,	%i3
	movrlz	%i6,	%l4,	%l5
	fand	%f8,	%f0,	%f0
	smulcc	%i5,	0x19C7,	%l1
	add	%i4,	%o1,	%g4
	fmovrdne	%o7,	%f16,	%f4
	add	%g3,	0x093B,	%i7
	fmovrsgez	%l0,	%f5,	%f2
	or	%l6,	%o3,	%i1
	stb	%o2,	[%l7 + 0x3F]
	ldd	[%l7 + 0x68],	%g2
	fmovs	%f6,	%f28
	save %o5, %g6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g1,	0x061A,	%i2
	mova	%icc,	%i0,	%g5
	sdiv	%l2,	0x16BE,	%l3
	subc	%g7,	%o0,	%o4
	sdivcc	%i6,	0x0A06,	%l4
	umulcc	%l5,	0x160D,	%i5
	ld	[%l7 + 0x48],	%f0
	subccc	%i3,	%l1,	%o1
	xnor	%g4,	%o7,	%g3
	smulcc	%i7,	%l0,	%i4
	subcc	%o3,	0x0961,	%l6
	movcs	%icc,	%i1,	%g2
	edge32ln	%o2,	%o5,	%g6
	ldsw	[%l7 + 0x5C],	%o6
	udivx	%i2,	0x138D,	%g1
	sethi	0x1A2C,	%i0
	orncc	%g5,	0x1120,	%l2
	sethi	0x1BF3,	%l3
	fmovsneg	%xcc,	%f23,	%f22
	fpmerge	%f26,	%f25,	%f8
	sth	%g7,	[%l7 + 0x32]
	mova	%icc,	%o0,	%i6
	and	%o4,	0x1738,	%l4
	movle	%xcc,	%i5,	%i3
	fcmpgt32	%f28,	%f14,	%l5
	stb	%o1,	[%l7 + 0x62]
	movrlz	%l1,	%g4,	%g3
	stx	%i7,	[%l7 + 0x08]
	umulcc	%l0,	0x14CD,	%i4
	edge16	%o3,	%o7,	%i1
	edge8	%g2,	%o2,	%l6
	movcs	%xcc,	%o5,	%o6
	subcc	%i2,	%g1,	%i0
	sth	%g5,	[%l7 + 0x6E]
	lduh	[%l7 + 0x1C],	%l2
	udivcc	%g6,	0x1B5C,	%g7
	edge16n	%l3,	%o0,	%i6
	movvc	%icc,	%l4,	%i5
	edge16n	%o4,	%i3,	%o1
	edge8n	%l1,	%g4,	%g3
	fcmpne32	%f0,	%f28,	%l5
	srl	%i7,	%i4,	%o3
	movle	%icc,	%l0,	%o7
	and	%g2,	0x173E,	%o2
	edge16l	%i1,	%l6,	%o6
	xor	%o5,	0x0EFC,	%g1
	srlx	%i0,	0x16,	%g5
	sdivx	%i2,	0x1098,	%l2
	movrlez	%g6,	%l3,	%o0
	udiv	%i6,	0x07FC,	%g7
	sll	%i5,	%o4,	%i3
	movl	%xcc,	%l4,	%l1
	smulcc	%o1,	0x1B77,	%g4
	andn	%l5,	0x1F73,	%g3
	or	%i7,	%i4,	%o3
	stx	%l0,	[%l7 + 0x78]
	std	%f24,	[%l7 + 0x30]
	alignaddrl	%o7,	%o2,	%i1
	stx	%l6,	[%l7 + 0x10]
	fmul8x16au	%f2,	%f31,	%f4
	fmovrdlz	%g2,	%f10,	%f4
	lduw	[%l7 + 0x6C],	%o6
	udivx	%o5,	0x0976,	%g1
	add	%i0,	0x0BC3,	%g5
	srax	%l2,	%i2,	%g6
	fone	%f24
	udiv	%o0,	0x0700,	%i6
	srlx	%l3,	%i5,	%g7
	edge32n	%i3,	%l4,	%o4
	sth	%o1,	[%l7 + 0x7E]
	fmovdvs	%xcc,	%f0,	%f19
	umul	%l1,	%g4,	%g3
	subcc	%i7,	0x1274,	%l5
	fcmpgt32	%f18,	%f14,	%i4
	ld	[%l7 + 0x20],	%f23
	stw	%o3,	[%l7 + 0x68]
	add	%o7,	0x1727,	%l0
	for	%f2,	%f4,	%f8
	sdivcc	%o2,	0x073C,	%l6
	movrlez	%i1,	%g2,	%o5
	movcs	%xcc,	%o6,	%g1
	fcmpgt16	%f14,	%f24,	%i0
	sdivx	%g5,	0x0832,	%l2
	fnegs	%f31,	%f30
	nop
	set	0x49, %o3
	ldsb	[%l7 + %o3],	%i2
	edge16n	%g6,	%o0,	%i6
	popc	%i5,	%g7
	stw	%i3,	[%l7 + 0x60]
	movge	%xcc,	%l3,	%o4
	fones	%f16
	fmovs	%f7,	%f26
	popc	0x0410,	%l4
	andcc	%o1,	0x04A3,	%g4
	movgu	%xcc,	%g3,	%l1
	movpos	%xcc,	%i7,	%l5
	fmovdvc	%xcc,	%f9,	%f30
	or	%o3,	%o7,	%l0
	mulscc	%i4,	0x13A4,	%l6
	fmovrdne	%i1,	%f14,	%f30
	umul	%g2,	%o2,	%o5
	fpsub16	%f22,	%f24,	%f12
	ldsh	[%l7 + 0x1C],	%g1
	stx	%o6,	[%l7 + 0x08]
	srax	%g5,	0x10,	%l2
	movl	%xcc,	%i0,	%i2
	or	%g6,	%o0,	%i6
	st	%f9,	[%l7 + 0x6C]
	movrlez	%i5,	0x37C,	%i3
	sllx	%g7,	%l3,	%l4
	movcc	%icc,	%o4,	%g4
	movleu	%icc,	%g3,	%l1
	fmovrdlz	%i7,	%f14,	%f2
	move	%xcc,	%l5,	%o3
	sdivx	%o7,	0x1CFD,	%o1
	addc	%l0,	0x17D0,	%i4
	orncc	%i1,	0x04C9,	%l6
	edge32n	%o2,	%o5,	%g1
	edge32ln	%g2,	%o6,	%l2
	fandnot2s	%f6,	%f14,	%f1
	edge16	%g5,	%i2,	%g6
	move	%xcc,	%o0,	%i0
	umul	%i6,	%i5,	%i3
	and	%l3,	%g7,	%o4
	fmovdvs	%icc,	%f18,	%f27
	sdivx	%l4,	0x09ED,	%g3
	umul	%g4,	%i7,	%l5
	fpsub16s	%f29,	%f31,	%f11
	alignaddr	%l1,	%o7,	%o3
	fmovdle	%icc,	%f27,	%f25
	movneg	%xcc,	%l0,	%o1
	array16	%i1,	%i4,	%o2
	movle	%icc,	%l6,	%o5
	movvs	%icc,	%g2,	%o6
	fmovdneg	%xcc,	%f11,	%f13
	st	%f20,	[%l7 + 0x10]
	subcc	%l2,	%g5,	%g1
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%i2
	stw	%g6,	[%l7 + 0x44]
	fcmpgt16	%f10,	%f12,	%o0
	ldub	[%l7 + 0x18],	%i6
	fcmple32	%f26,	%f16,	%i0
	movn	%xcc,	%i3,	%i5
	addccc	%l3,	0x1109,	%g7
	xnor	%l4,	%o4,	%g3
	array8	%i7,	%l5,	%l1
	udiv	%g4,	0x008D,	%o7
	ldsw	[%l7 + 0x58],	%l0
	array16	%o1,	%o3,	%i1
	fmovdgu	%icc,	%f24,	%f28
	fmovrsne	%o2,	%f14,	%f13
	mulscc	%i4,	%l6,	%g2
	orncc	%o6,	0x0722,	%l2
	movg	%xcc,	%g5,	%o5
	sdiv	%g1,	0x07D3,	%i2
	edge32n	%o0,	%g6,	%i0
	udivx	%i3,	0x105B,	%i6
	movleu	%xcc,	%i5,	%g7
	edge16ln	%l4,	%o4,	%l3
	fornot2	%f6,	%f22,	%f30
	movcc	%xcc,	%g3,	%i7
	ldsw	[%l7 + 0x14],	%l1
	sdiv	%g4,	0x0C69,	%l5
	edge8n	%o7,	%l0,	%o1
	movl	%icc,	%o3,	%i1
	movne	%xcc,	%o2,	%l6
	subc	%i4,	0x19B1,	%o6
	addccc	%g2,	%l2,	%g5
	fmovse	%icc,	%f5,	%f3
	movle	%icc,	%g1,	%i2
	save %o5, 0x0A3D, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i0,	%g6
	move	%icc,	%i6,	%i3
	edge16l	%g7,	%i5,	%o4
	st	%f23,	[%l7 + 0x6C]
	orncc	%l4,	%g3,	%l3
	sllx	%i7,	%l1,	%g4
	sethi	0x188B,	%l5
	mulscc	%o7,	%o1,	%o3
	udivcc	%i1,	0x1716,	%l0
	movcs	%icc,	%o2,	%l6
	srl	%o6,	0x17,	%i4
	fmovdvc	%icc,	%f7,	%f5
	edge16ln	%l2,	%g2,	%g5
	srl	%i2,	0x0B,	%g1
	ldx	[%l7 + 0x40],	%o0
	movgu	%icc,	%i0,	%o5
	smulcc	%g6,	0x137E,	%i6
	fand	%f10,	%f22,	%f22
	movn	%icc,	%i3,	%i5
	ldsh	[%l7 + 0x08],	%g7
	movneg	%xcc,	%o4,	%l4
	edge32l	%l3,	%i7,	%g3
	movre	%g4,	%l1,	%o7
	srl	%l5,	0x1A,	%o1
	udivcc	%o3,	0x154F,	%i1
	xor	%o2,	%l0,	%o6
	fpackfix	%f6,	%f10
	umulcc	%l6,	%i4,	%g2
	sll	%l2,	0x1E,	%i2
	fcmple16	%f14,	%f6,	%g1
	smulcc	%o0,	%i0,	%o5
	orn	%g6,	0x0904,	%i6
	alignaddrl	%i3,	%i5,	%g7
	movl	%icc,	%o4,	%g5
	movvc	%xcc,	%l3,	%l4
	movle	%icc,	%g3,	%g4
	stx	%i7,	[%l7 + 0x08]
	edge32n	%o7,	%l1,	%l5
	fpack16	%f12,	%f26
	fmovsle	%icc,	%f3,	%f6
	fcmpgt32	%f14,	%f8,	%o3
	ldub	[%l7 + 0x65],	%o1
	xorcc	%o2,	0x0ACA,	%l0
	udivcc	%i1,	0x0D88,	%o6
	ldsw	[%l7 + 0x38],	%l6
	sra	%g2,	0x0E,	%i4
	stw	%i2,	[%l7 + 0x4C]
	srl	%l2,	%g1,	%o0
	fpsub32	%f20,	%f12,	%f26
	fmovrsgz	%o5,	%f23,	%f7
	edge32ln	%i0,	%i6,	%g6
	srl	%i5,	%g7,	%o4
	array16	%i3,	%g5,	%l4
	movgu	%icc,	%g3,	%g4
	array16	%l3,	%i7,	%o7
	edge16n	%l5,	%l1,	%o1
	fcmple32	%f30,	%f2,	%o3
	sdivx	%l0,	0x01B3,	%o2
	fmovsvs	%icc,	%f24,	%f31
	movrgez	%i1,	%l6,	%g2
	xorcc	%i4,	%o6,	%i2
	fmovscc	%xcc,	%f20,	%f4
	add	%g1,	%o0,	%o5
	fmovrse	%i0,	%f4,	%f18
	fmovdvc	%icc,	%f3,	%f28
	array8	%l2,	%g6,	%i6
	st	%f16,	[%l7 + 0x1C]
	st	%f20,	[%l7 + 0x10]
	array8	%i5,	%o4,	%i3
	fmovde	%xcc,	%f26,	%f24
	alignaddrl	%g7,	%g5,	%g3
	ldx	[%l7 + 0x18],	%l4
	siam	0x2
	movrgz	%g4,	%l3,	%o7
	movrlz	%l5,	0x316,	%i7
	movcc	%xcc,	%l1,	%o3
	movcc	%icc,	%o1,	%l0
	alignaddrl	%i1,	%l6,	%o2
	ldsw	[%l7 + 0x4C],	%i4
	movne	%xcc,	%o6,	%i2
	mova	%icc,	%g1,	%o0
	mulscc	%o5,	%g2,	%i0
	stx	%l2,	[%l7 + 0x50]
	edge32n	%g6,	%i5,	%i6
	movl	%icc,	%o4,	%g7
	sub	%g5,	%i3,	%l4
	movn	%xcc,	%g3,	%g4
	array32	%o7,	%l5,	%i7
	movre	%l3,	%l1,	%o3
	subcc	%o1,	%l0,	%l6
	sdivcc	%o2,	0x0FE6,	%i4
	edge8ln	%o6,	%i1,	%g1
	fcmps	%fcc1,	%f4,	%f30
	fcmpd	%fcc3,	%f6,	%f26
	edge32l	%o0,	%o5,	%g2
	fcmple32	%f2,	%f22,	%i2
	srax	%i0,	%g6,	%i5
	fpackfix	%f16,	%f10
	ldd	[%l7 + 0x50],	%l2
	orncc	%o4,	0x1031,	%g7
	sir	0x013F
	array8	%g5,	%i3,	%l4
	lduw	[%l7 + 0x34],	%g3
	edge32l	%i6,	%o7,	%l5
	addcc	%i7,	%l3,	%l1
	movcc	%icc,	%o3,	%o1
	edge32n	%g4,	%l0,	%l6
	fabsd	%f24,	%f30
	fcmpes	%fcc1,	%f23,	%f12
	udiv	%i4,	0x1488,	%o6
	sdivcc	%i1,	0x1958,	%g1
	sethi	0x01CB,	%o0
	fmovsvs	%xcc,	%f20,	%f22
	movre	%o5,	%g2,	%o2
	fandnot1s	%f11,	%f25,	%f22
	fmovrdgz	%i0,	%f14,	%f18
	movrgez	%i2,	%g6,	%i5
	mulx	%l2,	0x0B6D,	%g7
	xnor	%o4,	0x122A,	%i3
	xnorcc	%l4,	%g5,	%g3
	udivcc	%o7,	0x190E,	%l5
	addcc	%i7,	%i6,	%l1
	edge16	%o3,	%l3,	%g4
	andncc	%l0,	%o1,	%i4
	alignaddr	%o6,	%i1,	%l6
	fmovdle	%xcc,	%f11,	%f3
	orn	%g1,	%o0,	%o5
	fsrc2	%f26,	%f8
	fmovdleu	%icc,	%f3,	%f9
	edge16l	%g2,	%o2,	%i2
	addc	%i0,	0x1BFE,	%i5
	sir	0x1061
	restore %l2, %g6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i3,	%g7,	%g5
	orcc	%g3,	%o7,	%l4
	edge32n	%l5,	%i7,	%l1
	sdiv	%i6,	0x04E1,	%o3
	ldd	[%l7 + 0x20],	%g4
	addccc	%l3,	%o1,	%l0
	ld	[%l7 + 0x0C],	%f2
	sub	%o6,	0x044A,	%i4
	fmovse	%icc,	%f21,	%f11
	array8	%l6,	%g1,	%o0
	lduw	[%l7 + 0x4C],	%i1
	siam	0x6
	lduh	[%l7 + 0x74],	%o5
	smulcc	%g2,	%o2,	%i2
	movn	%icc,	%i0,	%i5
	fcmpeq16	%f0,	%f30,	%g6
	array16	%o4,	%l2,	%g7
	alignaddr	%g5,	%g3,	%o7
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	movg	%xcc,	%l1,	%i7
	fands	%f12,	%f20,	%f8
	move	%xcc,	%o3,	%i6
	ldsh	[%l7 + 0x58],	%l3
	array8	%g4,	%o1,	%l0
	sllx	%i4,	%o6,	%g1
	movcc	%xcc,	%o0,	%i1
	movl	%xcc,	%o5,	%l6
	mulscc	%o2,	0x19B1,	%g2
	movrlz	%i2,	%i5,	%i0
	sethi	0x1935,	%o4
	movrne	%l2,	%g7,	%g6
	xnorcc	%g3,	0x1773,	%o7
	ldsw	[%l7 + 0x38],	%l4
	and	%g5,	%l5,	%l1
	mulx	%i7,	%o3,	%i3
	movvc	%icc,	%i6,	%l3
	sdiv	%g4,	0x1C90,	%o1
	sir	0x001B
	edge32n	%l0,	%i4,	%g1
	edge16n	%o0,	%o6,	%o5
	edge8l	%l6,	%o2,	%g2
	fmovdle	%icc,	%f31,	%f21
	fmovrdlez	%i1,	%f28,	%f4
	xor	%i2,	0x1F00,	%i5
	smul	%o4,	%i0,	%l2
	fmovsne	%xcc,	%f26,	%f9
	movn	%icc,	%g7,	%g6
	edge16ln	%o7,	%g3,	%l4
	fmovsne	%icc,	%f0,	%f22
	edge16l	%l5,	%l1,	%g5
	ldub	[%l7 + 0x59],	%i7
	edge16	%i3,	%i6,	%l3
	movrgez	%o3,	%o1,	%l0
	orncc	%g4,	0x0A09,	%g1
	popc	0x0103,	%i4
	popc	0x1092,	%o0
	sdivcc	%o5,	0x0F24,	%o6
	fmovsa	%icc,	%f4,	%f19
	ldd	[%l7 + 0x38],	%i6
	sir	0x003E
	ldsb	[%l7 + 0x6F],	%o2
	edge16ln	%g2,	%i2,	%i5
	mulscc	%i1,	%o4,	%i0
	mova	%icc,	%l2,	%g7
	lduh	[%l7 + 0x6C],	%o7
	andncc	%g3,	%l4,	%l5
	fnors	%f2,	%f12,	%f23
	move	%icc,	%l1,	%g6
	subccc	%g5,	0x0CB7,	%i3
	sra	%i7,	%i6,	%l3
	srl	%o1,	0x10,	%o3
	subcc	%g4,	%g1,	%l0
	ldsh	[%l7 + 0x22],	%i4
	fmovsvs	%icc,	%f7,	%f23
	sdivx	%o0,	0x1A33,	%o6
	fmovsg	%icc,	%f9,	%f17
	movg	%icc,	%o5,	%l6
	addcc	%g2,	0x1B8A,	%o2
	fmovd	%f30,	%f4
	udivx	%i5,	0x13B4,	%i2
	fpadd32s	%f10,	%f24,	%f28
	fpadd16s	%f24,	%f9,	%f31
	add	%i1,	0x087B,	%o4
	fmovdleu	%xcc,	%f2,	%f11
	sllx	%i0,	%g7,	%o7
	fnegs	%f10,	%f9
	umulcc	%g3,	0x083C,	%l4
	fpadd16s	%f27,	%f10,	%f28
	movre	%l2,	%l5,	%g6
	sllx	%g5,	0x05,	%l1
	andncc	%i3,	%i7,	%l3
	ldd	[%l7 + 0x70],	%o0
	lduw	[%l7 + 0x08],	%i6
	andncc	%o3,	%g1,	%g4
	array32	%l0,	%o0,	%i4
	restore %o6, 0x02D6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f30,	%f29,	%f17
	array8	%l6,	%o2,	%i5
	umul	%g2,	0x011E,	%i2
	fmovrslz	%o4,	%f17,	%f5
	edge32	%i1,	%g7,	%o7
	smulcc	%g3,	%i0,	%l4
	subccc	%l5,	%g6,	%l2
	subc	%g5,	%l1,	%i3
	xor	%l3,	%o1,	%i6
	stx	%i7,	[%l7 + 0x28]
	fmovrdlez	%g1,	%f4,	%f0
	ldd	[%l7 + 0x78],	%f30
	edge16n	%o3,	%l0,	%o0
	edge16l	%i4,	%g4,	%o5
	movrlz	%o6,	0x3A5,	%l6
	popc	%i5,	%g2
	fandnot2s	%f6,	%f27,	%f10
	ldsw	[%l7 + 0x78],	%i2
	andncc	%o4,	%i1,	%g7
	fmul8x16al	%f5,	%f10,	%f18
	addcc	%o2,	0x1C20,	%g3
	movrne	%o7,	0x01B,	%i0
	umulcc	%l4,	0x0A2A,	%l5
	udivcc	%g6,	0x136D,	%g5
	fcmpgt32	%f6,	%f18,	%l2
	movge	%xcc,	%l1,	%l3
	popc	0x0D02,	%i3
	movrgez	%i6,	%o1,	%i7
	ldsw	[%l7 + 0x38],	%o3
	fmul8x16au	%f1,	%f3,	%f24
	ldx	[%l7 + 0x70],	%g1
	alignaddr	%l0,	%i4,	%o0
	fpsub16s	%f5,	%f3,	%f18
	ldsb	[%l7 + 0x14],	%g4
	fmovd	%f10,	%f22
	srlx	%o5,	%l6,	%i5
	ldd	[%l7 + 0x40],	%g2
	movcc	%xcc,	%o6,	%o4
	fmovsne	%icc,	%f13,	%f6
	array8	%i2,	%g7,	%o2
	lduh	[%l7 + 0x4C],	%g3
	addc	%o7,	%i1,	%i0
	stb	%l4,	[%l7 + 0x60]
	movrgz	%g6,	0x327,	%g5
	fxors	%f15,	%f4,	%f0
	stw	%l2,	[%l7 + 0x54]
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%l5
	xnor	%l3,	0x1E9E,	%l1
	popc	0x130B,	%i6
	sllx	%i3,	0x1A,	%o1
	ldd	[%l7 + 0x28],	%f14
	xor	%i7,	%o3,	%l0
	sethi	0x122E,	%g1
	addccc	%i4,	%g4,	%o0
	movrgz	%l6,	0x274,	%o5
	array32	%i5,	%g2,	%o4
	movrne	%i2,	%o6,	%g7
	srlx	%o2,	%o7,	%i1
	movneg	%xcc,	%g3,	%l4
	fsrc2	%f16,	%f2
	xnorcc	%i0,	%g5,	%g6
	movcs	%icc,	%l2,	%l5
	addc	%l3,	0x15CE,	%i6
	fpadd32	%f22,	%f14,	%f10
	orncc	%l1,	0x1070,	%o1
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	andn	%i7,	%l0,	%g1
	movl	%xcc,	%i4,	%g4
	edge16ln	%l6,	%o0,	%i5
	ldd	[%l7 + 0x40],	%f10
	ldsb	[%l7 + 0x31],	%g2
	fmovrsne	%o4,	%f6,	%f13
	movrne	%i2,	0x072,	%o6
	udiv	%g7,	0x1FE2,	%o5
	fmul8sux16	%f14,	%f0,	%f14
	sdiv	%o2,	0x0E72,	%o7
	popc	%i1,	%g3
	movcs	%xcc,	%i0,	%l4
	andncc	%g5,	%l2,	%g6
	fmovsgu	%icc,	%f6,	%f21
	movrne	%l5,	0x05F,	%i6
	stx	%l3,	[%l7 + 0x68]
	sth	%o1,	[%l7 + 0x1C]
	srl	%i3,	0x19,	%o3
	movleu	%xcc,	%i7,	%l1
	fmovscc	%icc,	%f28,	%f0
	movrgz	%l0,	0x059,	%i4
	st	%f16,	[%l7 + 0x68]
	fpsub32s	%f19,	%f1,	%f29
	fnor	%f10,	%f30,	%f0
	sdiv	%g4,	0x0504,	%g1
	sllx	%l6,	0x1D,	%i5
	fandnot1s	%f28,	%f21,	%f11
	sdivx	%g2,	0x1D35,	%o0
	fmovdneg	%xcc,	%f25,	%f29
	movrlz	%o4,	%i2,	%g7
	movneg	%icc,	%o6,	%o5
	movrgez	%o2,	%i1,	%g3
	fmul8sux16	%f4,	%f26,	%f30
	smul	%o7,	%i0,	%g5
	srax	%l4,	0x13,	%g6
	movg	%xcc,	%l5,	%l2
	orn	%l3,	%o1,	%i6
	fmovsneg	%xcc,	%f31,	%f31
	movcc	%icc,	%o3,	%i3
	movge	%xcc,	%l1,	%l0
	add	%i7,	%g4,	%g1
	udivcc	%i4,	0x1DD4,	%i5
	fnegd	%f28,	%f22
	edge8	%g2,	%l6,	%o4
	orn	%i2,	%g7,	%o0
	edge8	%o6,	%o2,	%o5
	movcs	%xcc,	%i1,	%o7
	sll	%i0,	%g5,	%l4
	sllx	%g3,	%g6,	%l2
	andncc	%l5,	%l3,	%i6
	fmovsn	%xcc,	%f23,	%f3
	mulscc	%o3,	%i3,	%o1
	restore %l1, %i7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l0,	0x0511,	%i4
	edge8ln	%i5,	%g2,	%g1
	array16	%l6,	%i2,	%o4
	movl	%icc,	%g7,	%o6
	edge16n	%o2,	%o5,	%o0
	fmovdpos	%xcc,	%f24,	%f26
	ldx	[%l7 + 0x78],	%o7
	sdivcc	%i1,	0x0A97,	%g5
	ldx	[%l7 + 0x28],	%l4
	orn	%i0,	0x1352,	%g3
	sdiv	%g6,	0x0757,	%l5
	srl	%l2,	%l3,	%o3
	bshuffle	%f10,	%f22,	%f22
	fnot1s	%f20,	%f7
	fmul8sux16	%f4,	%f10,	%f16
	ldd	[%l7 + 0x70],	%f10
	sdivx	%i3,	0x118A,	%o1
	fsrc1	%f4,	%f28
	udivcc	%i6,	0x097C,	%i7
	ldub	[%l7 + 0x72],	%g4
	movneg	%xcc,	%l1,	%i4
	ldd	[%l7 + 0x08],	%f22
	move	%xcc,	%i5,	%l0
	sethi	0x04C6,	%g1
	sll	%g2,	0x08,	%l6
	addc	%o4,	0x0B7E,	%g7
	edge32	%i2,	%o2,	%o6
	movcc	%xcc,	%o0,	%o5
	fandnot1s	%f4,	%f31,	%f10
	lduh	[%l7 + 0x7C],	%o7
	move	%xcc,	%i1,	%l4
	fsrc1s	%f23,	%f18
	fsrc2s	%f7,	%f7
	add	%i0,	0x1C2D,	%g3
	movrlz	%g6,	%l5,	%g5
	fmovrde	%l3,	%f14,	%f6
	sdivx	%o3,	0x0068,	%l2
	mulx	%o1,	%i6,	%i3
	movge	%xcc,	%g4,	%l1
	fmovsge	%icc,	%f27,	%f2
	movneg	%icc,	%i7,	%i4
	sth	%l0,	[%l7 + 0x1C]
	sub	%i5,	0x0934,	%g2
	move	%xcc,	%l6,	%o4
	mulscc	%g1,	0x042A,	%g7
	fsrc1	%f22,	%f28
	movg	%icc,	%o2,	%i2
	fors	%f16,	%f29,	%f25
	pdist	%f12,	%f16,	%f16
	sll	%o0,	%o5,	%o6
	fones	%f1
	sll	%i1,	%o7,	%i0
	orncc	%l4,	0x1224,	%g6
	subcc	%l5,	%g5,	%l3
	fpsub32s	%f12,	%f24,	%f30
	movcc	%xcc,	%g3,	%o3
	orcc	%o1,	0x07D9,	%i6
	fmovrdlz	%l2,	%f28,	%f8
	edge8l	%i3,	%l1,	%i7
	sir	0x19E8
	edge32ln	%g4,	%i4,	%i5
	srlx	%g2,	%l0,	%l6
	ldub	[%l7 + 0x7D],	%g1
	std	%f22,	[%l7 + 0x28]
	ld	[%l7 + 0x5C],	%f26
	srax	%g7,	0x0F,	%o4
	edge8	%i2,	%o2,	%o5
	sdiv	%o0,	0x1DB4,	%o6
	save %i1, %o7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l4,	0x257,	%l5
	fcmped	%fcc2,	%f12,	%f28
	array32	%g6,	%l3,	%g5
	subcc	%o3,	%g3,	%o1
	edge16n	%i6,	%i3,	%l2
	fmovsne	%icc,	%f11,	%f23
	fcmpeq32	%f28,	%f24,	%i7
	edge16n	%g4,	%i4,	%l1
	movl	%icc,	%i5,	%l0
	xorcc	%l6,	%g2,	%g1
	movrne	%o4,	0x0A5,	%i2
	fand	%f20,	%f4,	%f6
	sll	%g7,	0x0D,	%o5
	sdiv	%o0,	0x1234,	%o2
	edge16	%o6,	%i1,	%o7
	or	%l4,	%i0,	%l5
	orcc	%g6,	%g5,	%l3
	std	%f2,	[%l7 + 0x28]
	fmovdpos	%xcc,	%f3,	%f17
	ldsb	[%l7 + 0x67],	%g3
	fcmpgt16	%f16,	%f4,	%o3
	array16	%o1,	%i3,	%i6
	fmovrsgez	%i7,	%f28,	%f6
	srl	%l2,	%g4,	%l1
	movneg	%xcc,	%i4,	%l0
	movrgz	%i5,	%l6,	%g2
	ldd	[%l7 + 0x18],	%o4
	mulx	%i2,	0x05C8,	%g1
	fands	%f11,	%f15,	%f8
	srlx	%o5,	%o0,	%o2
	ldsh	[%l7 + 0x5C],	%o6
	movgu	%icc,	%i1,	%o7
	array8	%l4,	%i0,	%l5
	fmovs	%f23,	%f14
	edge32ln	%g7,	%g6,	%l3
	fmovscc	%xcc,	%f28,	%f3
	pdist	%f6,	%f16,	%f30
	movrgez	%g3,	0x2CF,	%o3
	edge8l	%g5,	%i3,	%o1
	edge16l	%i6,	%l2,	%i7
	fornot2s	%f30,	%f10,	%f3
	fmul8x16	%f11,	%f12,	%f20
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	ldsw	[%l7 + 0x34],	%l1
	fors	%f4,	%f18,	%f4
	fmovse	%icc,	%f5,	%f21
	movcs	%xcc,	%i5,	%g2
	fandnot1s	%f25,	%f26,	%f30
	and	%l6,	0x02A6,	%i2
	andn	%o4,	0x0C22,	%g1
	andcc	%o0,	0x1104,	%o5
	ldub	[%l7 + 0x42],	%o2
	fmovrdlz	%o6,	%f8,	%f14
	add	%o7,	%i1,	%i0
	movcs	%xcc,	%l4,	%g7
	fmovsle	%icc,	%f5,	%f17
	stw	%g6,	[%l7 + 0x54]
	andncc	%l5,	%l3,	%o3
	xnorcc	%g3,	0x0670,	%i3
	array8	%o1,	%i6,	%g5
	stx	%l2,	[%l7 + 0x78]
	movrlez	%g4,	%i7,	%l0
	movle	%xcc,	%i4,	%l1
	movl	%xcc,	%i5,	%l6
	sub	%g2,	0x10CC,	%o4
	and	%i2,	0x049D,	%g1
	fmovsne	%icc,	%f25,	%f31
	move	%xcc,	%o0,	%o5
	fmovrsgz	%o6,	%f26,	%f5
	fmovdneg	%xcc,	%f23,	%f6
	ld	[%l7 + 0x78],	%f0
	udiv	%o2,	0x0DC8,	%i1
	faligndata	%f28,	%f20,	%f26
	fmovscs	%xcc,	%f18,	%f27
	udiv	%o7,	0x0AA7,	%i0
	alignaddrl	%l4,	%g6,	%l5
	andn	%l3,	0x0356,	%g7
	movrgz	%g3,	0x156,	%i3
	ldsh	[%l7 + 0x38],	%o3
	movcs	%icc,	%o1,	%g5
	edge32ln	%l2,	%i6,	%g4
	st	%f6,	[%l7 + 0x54]
	edge32l	%l0,	%i4,	%i7
	stw	%l1,	[%l7 + 0x7C]
	udivx	%l6,	0x01AC,	%g2
	std	%f0,	[%l7 + 0x78]
	ldx	[%l7 + 0x70],	%i5
	movrgez	%i2,	0x287,	%o4
	stb	%g1,	[%l7 + 0x52]
	and	%o0,	0x04F2,	%o5
	sdivcc	%o6,	0x1CE6,	%o2
	smul	%o7,	%i0,	%l4
	array32	%g6,	%l5,	%l3
	movrlez	%i1,	%g7,	%i3
	fpsub16s	%f6,	%f14,	%f2
	movvc	%icc,	%o3,	%g3
	sth	%g5,	[%l7 + 0x60]
	fmovrdne	%l2,	%f4,	%f4
	movvc	%xcc,	%i6,	%o1
	fmovrdgez	%l0,	%f10,	%f22
	bshuffle	%f30,	%f6,	%f16
	andncc	%g4,	%i7,	%l1
	fzero	%f4
	smulcc	%l6,	%i4,	%i5
	fsrc2s	%f10,	%f29
	fmovsleu	%xcc,	%f20,	%f21
	move	%icc,	%g2,	%o4
	sllx	%g1,	0x11,	%i2
	movrlz	%o0,	0x370,	%o6
	st	%f17,	[%l7 + 0x20]
	fnegd	%f10,	%f12
	lduw	[%l7 + 0x18],	%o2
	std	%f26,	[%l7 + 0x50]
	edge32n	%o5,	%i0,	%o7
	ldsw	[%l7 + 0x54],	%g6
	sdiv	%l4,	0x1FF4,	%l5
	movre	%i1,	%g7,	%l3
	edge16ln	%i3,	%o3,	%g3
	movg	%xcc,	%l2,	%i6
	orn	%g5,	0x1625,	%o1
	st	%f5,	[%l7 + 0x24]
	movrne	%g4,	%l0,	%i7
	mulx	%l6,	0x0E5C,	%i4
	ldub	[%l7 + 0x42],	%l1
	fmovrslz	%g2,	%f11,	%f4
	fcmpes	%fcc2,	%f10,	%f11
	ldub	[%l7 + 0x16],	%i5
	nop
	set	0x62, %i0
	sth	%o4,	[%l7 + %i0]
	udivcc	%i2,	0x1392,	%o0
	or	%o6,	0x1544,	%g1
	movgu	%xcc,	%o5,	%o2
	orcc	%i0,	0x0BD1,	%o7
	and	%l4,	%l5,	%g6
	edge32	%i1,	%g7,	%i3
	movrgz	%o3,	0x0A5,	%l3
	edge16	%g3,	%i6,	%l2
	andncc	%g5,	%g4,	%o1
	udiv	%i7,	0x15D7,	%l0
	mulscc	%l6,	%l1,	%i4
	edge8ln	%i5,	%g2,	%i2
	fnands	%f21,	%f23,	%f5
	ldsw	[%l7 + 0x08],	%o0
	stw	%o6,	[%l7 + 0x48]
	alignaddrl	%o4,	%g1,	%o2
	srax	%i0,	%o7,	%l4
	move	%icc,	%o5,	%l5
	fones	%f6
	fandnot1	%f14,	%f30,	%f28
	mulx	%g6,	0x144F,	%i1
	edge16	%g7,	%i3,	%l3
	fandnot1s	%f2,	%f0,	%f19
	stx	%o3,	[%l7 + 0x78]
	fmovde	%icc,	%f21,	%f4
	fpack32	%f10,	%f16,	%f20
	movge	%icc,	%i6,	%l2
	udivx	%g5,	0x0087,	%g4
	sdivx	%g3,	0x1083,	%i7
	movcs	%icc,	%o1,	%l0
	orncc	%l1,	%i4,	%l6
	fpack16	%f0,	%f30
	edge16l	%g2,	%i2,	%o0
	edge32n	%o6,	%i5,	%o4
	edge32	%o2,	%g1,	%i0
	stx	%o7,	[%l7 + 0x10]
	edge8l	%o5,	%l4,	%l5
	sdiv	%g6,	0x1B9D,	%i1
	movvc	%icc,	%i3,	%g7
	fxnor	%f28,	%f10,	%f30
	subccc	%l3,	%i6,	%o3
	ldd	[%l7 + 0x70],	%g4
	and	%g4,	%g3,	%l2
	fmovdg	%icc,	%f21,	%f24
	fnot1s	%f28,	%f8
	movpos	%icc,	%i7,	%o1
	ldsw	[%l7 + 0x64],	%l1
	st	%f7,	[%l7 + 0x28]
	std	%f10,	[%l7 + 0x58]
	movcs	%xcc,	%l0,	%i4
	movvc	%xcc,	%l6,	%i2
	edge8n	%g2,	%o6,	%i5
	sethi	0x0AD4,	%o0
	ldub	[%l7 + 0x76],	%o2
	fmovdge	%xcc,	%f23,	%f9
	andcc	%o4,	%g1,	%i0
	andn	%o7,	0x1F76,	%l4
	mova	%xcc,	%o5,	%g6
	sdivcc	%l5,	0x0C77,	%i1
	lduh	[%l7 + 0x5E],	%g7
	sdiv	%i3,	0x1FBC,	%i6
	add	%o3,	%l3,	%g5
	and	%g4,	0x185A,	%g3
	edge32l	%i7,	%l2,	%l1
	sir	0x0933
	fmovdg	%xcc,	%f7,	%f1
	orncc	%l0,	0x128A,	%i4
	fmovdvc	%icc,	%f31,	%f10
	array8	%l6,	%i2,	%o1
	fmovsle	%xcc,	%f26,	%f20
	orncc	%g2,	%o6,	%i5
	move	%icc,	%o2,	%o4
	movvc	%icc,	%o0,	%g1
	lduh	[%l7 + 0x76],	%o7
	edge32l	%i0,	%l4,	%g6
	srax	%o5,	%l5,	%g7
	xnorcc	%i1,	0x184F,	%i6
	popc	%o3,	%i3
	fmovdcs	%icc,	%f12,	%f10
	or	%l3,	0x0B3D,	%g5
	fmovdvs	%xcc,	%f30,	%f0
	orn	%g3,	%i7,	%g4
	edge32l	%l1,	%l2,	%i4
	fands	%f7,	%f1,	%f23
	andcc	%l6,	0x0B04,	%l0
	orn	%i2,	0x0BC8,	%o1
	movvs	%icc,	%o6,	%i5
	andcc	%g2,	%o4,	%o2
	fcmple32	%f26,	%f14,	%g1
	movg	%icc,	%o7,	%o0
	movcc	%icc,	%i0,	%g6
	faligndata	%f26,	%f18,	%f12
	fmovspos	%xcc,	%f17,	%f30
	ldd	[%l7 + 0x38],	%o4
	mova	%icc,	%l4,	%g7
	or	%l5,	%i1,	%i6
	movrlz	%o3,	0x09A,	%l3
	array8	%i3,	%g5,	%i7
	orcc	%g4,	%l1,	%l2
	udivcc	%i4,	0x0E53,	%l6
	array16	%l0,	%i2,	%o1
	ldd	[%l7 + 0x58],	%f4
	alignaddrl	%o6,	%g3,	%g2
	ldsh	[%l7 + 0x78],	%i5
	fcmped	%fcc3,	%f28,	%f20
	fnot2	%f14,	%f10
	edge16	%o4,	%o2,	%o7
	edge16	%o0,	%g1,	%i0
	xorcc	%g6,	0x08B5,	%o5
	orncc	%l4,	%l5,	%i1
	xnor	%g7,	%i6,	%o3
	fmovsvc	%xcc,	%f20,	%f27
	st	%f15,	[%l7 + 0x60]
	movvc	%icc,	%l3,	%g5
	fzeros	%f9
	mulx	%i7,	0x0689,	%i3
	movn	%icc,	%l1,	%l2
	mulscc	%g4,	%l6,	%l0
	st	%f17,	[%l7 + 0x24]
	fabss	%f31,	%f8
	sdivcc	%i4,	0x1BFF,	%o1
	save %i2, %g3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g2,	%i5,	%o2
	save %o4, 0x1BCD, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x6A],	%o0
	ldsh	[%l7 + 0x6C],	%g1
	xorcc	%i0,	%o5,	%l4
	orn	%l5,	0x06B0,	%g6
	xor	%i1,	0x1472,	%g7
	ldx	[%l7 + 0x10],	%i6
	movpos	%xcc,	%o3,	%g5
	popc	%i7,	%i3
	nop
	set	0x7A, %o0
	ldsb	[%l7 + %o0],	%l1
	array16	%l3,	%l2,	%l6
	alignaddrl	%l0,	%i4,	%o1
	st	%f31,	[%l7 + 0x28]
	andncc	%g4,	%i2,	%o6
	sllx	%g2,	%g3,	%i5
	edge32l	%o2,	%o7,	%o0
	udivx	%o4,	0x15D1,	%g1
	umulcc	%i0,	%o5,	%l4
	smulcc	%l5,	%g6,	%g7
	movneg	%xcc,	%i1,	%i6
	edge16	%g5,	%o3,	%i3
	orn	%l1,	0x0997,	%l3
	fmovd	%f2,	%f10
	mova	%xcc,	%l2,	%l6
	movpos	%icc,	%l0,	%i4
	restore %i7, %g4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o6,	%i2,	%g3
	fandnot2s	%f2,	%f6,	%f23
	movrgz	%g2,	0x2BE,	%o2
	popc	0x0082,	%o7
	subcc	%i5,	%o4,	%g1
	lduh	[%l7 + 0x50],	%o0
	fnor	%f30,	%f14,	%f28
	movrlez	%o5,	%l4,	%l5
	stb	%i0,	[%l7 + 0x6D]
	ld	[%l7 + 0x60],	%f27
	fzero	%f8
	fandnot1s	%f22,	%f5,	%f15
	movgu	%icc,	%g6,	%g7
	srlx	%i6,	%g5,	%i1
	edge16l	%o3,	%l1,	%l3
	movgu	%icc,	%i3,	%l6
	sdiv	%l2,	0x0740,	%l0
	fmovsge	%icc,	%f6,	%f27
	alignaddrl	%i7,	%i4,	%g4
	std	%f26,	[%l7 + 0x38]
	alignaddrl	%o6,	%i2,	%g3
	sdivcc	%o1,	0x1D96,	%o2
	andn	%o7,	%i5,	%g2
	std	%f28,	[%l7 + 0x60]
	umulcc	%g1,	%o4,	%o0
	edge8ln	%o5,	%l5,	%i0
	ldd	[%l7 + 0x20],	%f16
	orcc	%g6,	0x0137,	%l4
	orn	%i6,	0x0357,	%g5
	movvc	%xcc,	%g7,	%i1
	fcmpes	%fcc3,	%f25,	%f18
	fornot1s	%f13,	%f1,	%f7
	popc	%l1,	%l3
	fmovsle	%icc,	%f10,	%f29
	fxors	%f8,	%f31,	%f21
	lduh	[%l7 + 0x6C],	%i3
	xnorcc	%o3,	%l2,	%l0
	fmovda	%xcc,	%f17,	%f13
	orn	%l6,	0x1F8E,	%i4
	edge16l	%g4,	%i7,	%o6
	popc	0x0CC7,	%i2
	edge8	%o1,	%g3,	%o2
	xor	%o7,	%g2,	%i5
	array32	%g1,	%o4,	%o5
	smul	%o0,	%i0,	%l5
	xor	%l4,	%g6,	%i6
	fmovrdgz	%g7,	%f24,	%f16
	sdiv	%i1,	0x16C6,	%g5
	fcmpeq32	%f0,	%f28,	%l3
	edge32l	%i3,	%o3,	%l2
	sir	0x1E03
	movne	%icc,	%l0,	%l6
	edge8l	%l1,	%i4,	%g4
	subccc	%i7,	0x0AE1,	%o6
	fmovsge	%icc,	%f5,	%f16
	ldsw	[%l7 + 0x5C],	%i2
	fmovscs	%icc,	%f19,	%f2
	xor	%g3,	%o1,	%o7
	sdivcc	%o2,	0x15DB,	%i5
	subc	%g1,	%o4,	%o5
	movvs	%xcc,	%o0,	%g2
	movl	%xcc,	%i0,	%l4
	sll	%l5,	0x19,	%g6
	srlx	%i6,	%i1,	%g7
	xor	%l3,	0x0B2B,	%i3
	xnorcc	%g5,	0x0102,	%o3
	srl	%l0,	0x1E,	%l6
	smulcc	%l2,	%i4,	%l1
	ldd	[%l7 + 0x10],	%f16
	fcmpgt32	%f18,	%f22,	%g4
	stx	%o6,	[%l7 + 0x78]
	edge16	%i2,	%i7,	%o1
	movne	%icc,	%o7,	%g3
	fmovdne	%xcc,	%f2,	%f10
	fpadd32	%f24,	%f0,	%f6
	fexpand	%f10,	%f22
	movne	%icc,	%i5,	%g1
	movne	%xcc,	%o2,	%o5
	xor	%o4,	%o0,	%g2
	subccc	%l4,	0x1013,	%l5
	edge16l	%i0,	%g6,	%i1
	ldsw	[%l7 + 0x14],	%i6
	sdivcc	%g7,	0x100F,	%l3
	edge8n	%i3,	%g5,	%o3
	xorcc	%l6,	0x13D8,	%l0
	sll	%l2,	%l1,	%i4
	save %g4, 0x1EEF, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i7,	0x1DE6,	%i2
	ldx	[%l7 + 0x10],	%o7
	fcmpne32	%f18,	%f16,	%o1
	ld	[%l7 + 0x24],	%f4
	xnor	%i5,	%g1,	%g3
	sth	%o2,	[%l7 + 0x26]
	save %o5, %o4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l4,	%l5,	%o0
	movg	%icc,	%g6,	%i0
	edge16l	%i1,	%g7,	%l3
	fcmpgt16	%f0,	%f6,	%i3
	fmovda	%xcc,	%f8,	%f3
	stx	%g5,	[%l7 + 0x28]
	orn	%o3,	0x091D,	%i6
	edge8l	%l6,	%l0,	%l2
	stw	%i4,	[%l7 + 0x70]
	array16	%l1,	%o6,	%i7
	fmovd	%f20,	%f10
	bshuffle	%f18,	%f20,	%f4
	smul	%i2,	0x00E9,	%o7
	movvc	%xcc,	%g4,	%i5
	movcc	%icc,	%g1,	%g3
	lduw	[%l7 + 0x44],	%o1
	move	%xcc,	%o2,	%o5
	udiv	%g2,	0x08E6,	%l4
	umul	%l5,	0x02FB,	%o0
	array32	%o4,	%g6,	%i1
	array8	%g7,	%l3,	%i3
	fcmpd	%fcc0,	%f10,	%f0
	edge8n	%i0,	%g5,	%i6
	edge32n	%o3,	%l0,	%l6
	orn	%l2,	0x1DDD,	%i4
	fmovsn	%icc,	%f25,	%f0
	ldsb	[%l7 + 0x15],	%o6
	mova	%xcc,	%l1,	%i7
	orncc	%o7,	%i2,	%i5
	edge8ln	%g1,	%g4,	%g3
	edge16	%o1,	%o5,	%g2
	fmovdvs	%xcc,	%f24,	%f26
	ldsw	[%l7 + 0x10],	%o2
	movleu	%icc,	%l4,	%o0
	ldd	[%l7 + 0x10],	%l4
	fmovrse	%o4,	%f7,	%f12
	popc	%i1,	%g7
	sdivcc	%l3,	0x0990,	%g6
	ldsh	[%l7 + 0x32],	%i0
	udivx	%i3,	0x1BC3,	%g5
	ldub	[%l7 + 0x47],	%i6
	fmovscc	%xcc,	%f23,	%f23
	andcc	%l0,	0x1EA6,	%l6
	mova	%xcc,	%l2,	%i4
	nop
	set	0x50, %g3
	stw	%o3,	[%l7 + %g3]
	array32	%l1,	%o6,	%o7
	fones	%f26
	subc	%i2,	%i7,	%i5
	movrgez	%g1,	%g4,	%g3
	fmul8x16al	%f19,	%f14,	%f16
	array8	%o1,	%g2,	%o5
	addccc	%o2,	%l4,	%l5
	ldsh	[%l7 + 0x1E],	%o4
	movgu	%icc,	%o0,	%i1
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	save %g7, %i0, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f20,	%f8
	ld	[%l7 + 0x3C],	%f28
	sethi	0x065B,	%i3
	smul	%i6,	0x0586,	%l6
	movrgez	%l2,	0x009,	%i4
	move	%xcc,	%o3,	%l1
	st	%f17,	[%l7 + 0x68]
	ldx	[%l7 + 0x70],	%o6
	andncc	%l0,	%i2,	%o7
	nop
	set	0x0C, %o1
	ldsh	[%l7 + %o1],	%i5
	edge16n	%g1,	%i7,	%g4
	edge16n	%o1,	%g2,	%g3
	xnorcc	%o2,	0x1BBE,	%l4
	sdivx	%o5,	0x065F,	%o4
	xnorcc	%o0,	%l5,	%l3
	array8	%g6,	%i1,	%i0
	fpadd32s	%f8,	%f20,	%f10
	addcc	%g7,	%g5,	%i3
	alignaddrl	%i6,	%l2,	%l6
	srax	%o3,	%i4,	%o6
	fmuld8sux16	%f29,	%f9,	%f2
	udiv	%l0,	0x18D5,	%i2
	addc	%l1,	%i5,	%g1
	fornot1s	%f3,	%f30,	%f4
	sdiv	%o7,	0x1FDE,	%i7
	fmovrde	%o1,	%f16,	%f6
	addccc	%g4,	0x02C6,	%g2
	move	%icc,	%o2,	%g3
	fmovdpos	%icc,	%f6,	%f12
	srlx	%o5,	%l4,	%o0
	movrne	%l5,	0x178,	%o4
	fcmps	%fcc1,	%f5,	%f25
	ldsb	[%l7 + 0x5C],	%l3
	st	%f20,	[%l7 + 0x0C]
	orncc	%g6,	%i0,	%i1
	edge32	%g5,	%i3,	%i6
	movvc	%icc,	%g7,	%l6
	fnot2s	%f16,	%f4
	fpsub32s	%f5,	%f11,	%f11
	fmovsge	%icc,	%f21,	%f18
	mulx	%l2,	%i4,	%o3
	edge32l	%o6,	%i2,	%l0
	fnot1	%f8,	%f6
	movgu	%xcc,	%l1,	%i5
	array8	%o7,	%g1,	%o1
	array16	%g4,	%i7,	%g2
	orn	%g3,	%o5,	%l4
	sub	%o0,	0x0F5C,	%o2
	ld	[%l7 + 0x3C],	%f10
	edge16n	%l5,	%l3,	%o4
	edge8l	%i0,	%i1,	%g6
	lduh	[%l7 + 0x54],	%g5
	edge8n	%i6,	%i3,	%l6
	edge8n	%g7,	%i4,	%o3
	fmovdn	%xcc,	%f21,	%f25
	fmovsge	%xcc,	%f29,	%f16
	xor	%l2,	%i2,	%l0
	restore %l1, %o6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f26,	%f12,	%f6
	edge8n	%i5,	%o1,	%g4
	fzero	%f22
	fmovsleu	%icc,	%f2,	%f17
	srl	%i7,	%g2,	%g1
	st	%f24,	[%l7 + 0x38]
	array16	%o5,	%l4,	%g3
	fmovscc	%icc,	%f12,	%f24
	fsrc2s	%f6,	%f15
	fzero	%f24
	ldub	[%l7 + 0x4B],	%o2
	movcc	%xcc,	%o0,	%l3
	xor	%o4,	%i0,	%i1
	movn	%icc,	%g6,	%g5
	ldd	[%l7 + 0x48],	%l4
	ldsh	[%l7 + 0x0E],	%i3
	xor	%i6,	0x1BC4,	%l6
	orncc	%i4,	%o3,	%l2
	array32	%g7,	%i2,	%l0
	nop
	set	0x63, %o5
	ldub	[%l7 + %o5],	%o6
	edge16	%o7,	%i5,	%o1
	fnegd	%f22,	%f20
	edge8l	%g4,	%l1,	%g2
	movrgez	%i7,	0x2B6,	%g1
	mulscc	%o5,	0x0834,	%g3
	and	%l4,	%o2,	%o0
	array32	%l3,	%i0,	%i1
	and	%g6,	0x0AFF,	%o4
	movpos	%xcc,	%g5,	%i3
	movrgez	%l5,	0x029,	%i6
	orcc	%l6,	%i4,	%l2
	fmovrdne	%g7,	%f12,	%f0
	fmovdgu	%icc,	%f4,	%f5
	lduh	[%l7 + 0x1A],	%i2
	stb	%l0,	[%l7 + 0x4C]
	st	%f16,	[%l7 + 0x4C]
	fands	%f18,	%f13,	%f21
	sdiv	%o6,	0x0CBE,	%o7
	movn	%xcc,	%i5,	%o3
	movrne	%o1,	%l1,	%g4
	edge32	%g2,	%g1,	%o5
	sdiv	%g3,	0x1559,	%l4
	sll	%i7,	0x0A,	%o2
	alignaddrl	%l3,	%i0,	%o0
	st	%f3,	[%l7 + 0x3C]
	subccc	%i1,	%g6,	%o4
	movg	%icc,	%i3,	%g5
	faligndata	%f24,	%f2,	%f0
	popc	%l5,	%l6
	movl	%xcc,	%i4,	%l2
	movgu	%xcc,	%i6,	%g7
	edge16n	%i2,	%l0,	%o6
	fand	%f14,	%f4,	%f30
	smulcc	%i5,	%o3,	%o7
	edge16ln	%l1,	%g4,	%o1
	mova	%icc,	%g1,	%g2
	alignaddrl	%o5,	%l4,	%g3
	movrlz	%o2,	%l3,	%i0
	fornot1	%f26,	%f22,	%f18
	fpsub32s	%f18,	%f22,	%f8
	stw	%i7,	[%l7 + 0x78]
	fmovsne	%xcc,	%f1,	%f30
	st	%f23,	[%l7 + 0x78]
	alignaddr	%i1,	%g6,	%o4
	std	%f4,	[%l7 + 0x08]
	edge16l	%i3,	%o0,	%l5
	sethi	0x0594,	%l6
	popc	0x17E6,	%i4
	movre	%g5,	%l2,	%g7
	fmovsvs	%xcc,	%f11,	%f16
	movre	%i2,	%i6,	%l0
	edge8	%i5,	%o6,	%o3
	subccc	%o7,	0x0212,	%l1
	umul	%g4,	0x168E,	%o1
	array16	%g2,	%g1,	%l4
	udivcc	%o5,	0x112E,	%o2
	movpos	%icc,	%g3,	%i0
	fnot1s	%f25,	%f2
	fmovrde	%i7,	%f10,	%f10
	edge16n	%l3,	%g6,	%i1
	sethi	0x063C,	%o4
	array32	%i3,	%l5,	%l6
	edge32	%i4,	%o0,	%g5
	smul	%l2,	0x1B73,	%g7
	andn	%i6,	%i2,	%l0
	stw	%o6,	[%l7 + 0x08]
	ldub	[%l7 + 0x40],	%o3
	fandnot2s	%f11,	%f10,	%f30
	array8	%o7,	%i5,	%g4
	fnegs	%f3,	%f13
	popc	0x103A,	%o1
	xorcc	%l1,	%g2,	%g1
	movrlez	%o5,	%o2,	%g3
	smulcc	%l4,	0x0F17,	%i0
	andncc	%i7,	%g6,	%l3
	fmovdvs	%xcc,	%f24,	%f17
	edge16ln	%o4,	%i3,	%i1
	for	%f18,	%f8,	%f4
	movrlez	%l6,	%i4,	%o0
	fpadd32s	%f28,	%f30,	%f18
	nop
	set	0x3C, %i6
	ldsb	[%l7 + %i6],	%g5
	edge16	%l5,	%g7,	%l2
	save %i2, %i6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	%o7,	%i5
	sra	%o6,	0x0C,	%g4
	movcs	%icc,	%l1,	%g2
	edge8n	%o1,	%o5,	%g1
	mova	%icc,	%o2,	%g3
	or	%i0,	%i7,	%g6
	alignaddr	%l3,	%o4,	%i3
	fmovs	%f7,	%f2
	movvs	%xcc,	%i1,	%l6
	fmovrslez	%l4,	%f19,	%f16
	fpsub16s	%f18,	%f10,	%f4
	ldsb	[%l7 + 0x44],	%i4
	subccc	%o0,	%g5,	%l5
	movgu	%xcc,	%g7,	%l2
	movg	%icc,	%i6,	%i2
	ldub	[%l7 + 0x7B],	%l0
	mulscc	%o7,	0x1D7A,	%i5
	fcmpd	%fcc0,	%f0,	%f18
	andn	%o6,	%o3,	%l1
	movg	%icc,	%g2,	%g4
	move	%icc,	%o5,	%o1
	movneg	%icc,	%o2,	%g3
	sdivx	%i0,	0x156A,	%i7
	fmovsn	%xcc,	%f12,	%f22
	fmovsne	%icc,	%f0,	%f6
	srlx	%g1,	%g6,	%o4
	movleu	%icc,	%i3,	%l3
	fnot2s	%f2,	%f6
	fnot2	%f30,	%f18
	edge32ln	%l6,	%i1,	%i4
	orn	%l4,	0x02EB,	%o0
	fmovse	%xcc,	%f2,	%f1
	subcc	%l5,	0x0188,	%g7
	movl	%icc,	%g5,	%l2
	fnor	%f16,	%f6,	%f20
	lduw	[%l7 + 0x14],	%i2
	fpadd32s	%f10,	%f17,	%f8
	movleu	%xcc,	%l0,	%i6
	and	%o7,	%i5,	%o3
	std	%f4,	[%l7 + 0x30]
	edge8n	%o6,	%l1,	%g4
	sub	%g2,	%o5,	%o2
	fandnot1s	%f20,	%f4,	%f5
	edge8n	%o1,	%g3,	%i7
	lduw	[%l7 + 0x78],	%i0
	movcc	%icc,	%g1,	%g6
	ldsw	[%l7 + 0x78],	%o4
	orncc	%i3,	0x0366,	%l6
	array8	%l3,	%i4,	%i1
	addccc	%o0,	0x1458,	%l5
	subc	%l4,	%g7,	%l2
	udiv	%g5,	0x1026,	%i2
	sllx	%i6,	%o7,	%i5
	ldsb	[%l7 + 0x54],	%o3
	movleu	%xcc,	%l0,	%o6
	srax	%l1,	0x12,	%g2
	xnor	%o5,	%g4,	%o2
	fmovrse	%g3,	%f24,	%f29
	movvc	%icc,	%o1,	%i0
	alignaddr	%g1,	%i7,	%o4
	movrne	%g6,	0x3EA,	%i3
	udivx	%l3,	0x1DBC,	%i4
	edge8	%i1,	%o0,	%l6
	fmovscs	%xcc,	%f9,	%f5
	fmovrsgez	%l4,	%f25,	%f16
	fmovdle	%icc,	%f17,	%f0
	save %l5, %l2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f2,	%f8,	%g7
	movvc	%icc,	%i2,	%i6
	movne	%xcc,	%i5,	%o7
	sethi	0x15F7,	%o3
	xnor	%l0,	0x0C29,	%l1
	ld	[%l7 + 0x44],	%f5
	fmovsl	%xcc,	%f10,	%f20
	lduh	[%l7 + 0x24],	%o6
	fmovsvs	%icc,	%f25,	%f22
	sra	%o5,	%g4,	%g2
	mulscc	%o2,	%o1,	%g3
	fmovdge	%icc,	%f26,	%f6
	fmovse	%xcc,	%f14,	%f29
	fpsub32s	%f6,	%f0,	%f28
	lduw	[%l7 + 0x58],	%g1
	edge32l	%i0,	%i7,	%o4
	sdiv	%g6,	0x1771,	%l3
	movrlez	%i3,	0x293,	%i1
	edge8ln	%i4,	%l6,	%o0
	movne	%xcc,	%l5,	%l4
	edge32ln	%l2,	%g5,	%g7
	mova	%icc,	%i2,	%i5
	add	%i6,	0x1DC0,	%o3
	mulx	%l0,	0x0220,	%l1
	stw	%o6,	[%l7 + 0x30]
	sethi	0x1423,	%o5
	ldsh	[%l7 + 0x28],	%o7
	movvs	%xcc,	%g4,	%g2
	ld	[%l7 + 0x64],	%f17
	sub	%o1,	%o2,	%g1
	addcc	%i0,	0x0EA7,	%i7
	edge16l	%o4,	%g3,	%l3
	movneg	%icc,	%g6,	%i1
	addccc	%i4,	%l6,	%o0
	fnand	%f6,	%f26,	%f2
	move	%xcc,	%i3,	%l4
	subc	%l5,	%l2,	%g5
	fmovsge	%icc,	%f3,	%f21
	fpsub16	%f0,	%f10,	%f4
	sdivcc	%i2,	0x071C,	%g7
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fmul8x16au	%f31,	%f29,	%f0
	edge8ln	%l1,	%o6,	%o5
	nop
	set	0x28, %i7
	stx	%i6,	[%l7 + %i7]
	udivx	%g4,	0x0B0D,	%g2
	fcmpgt32	%f28,	%f2,	%o7
	movgu	%xcc,	%o1,	%g1
	edge32l	%o2,	%i0,	%i7
	movrne	%o4,	%g3,	%g6
	smul	%i1,	0x09EB,	%i4
	addcc	%l6,	%l3,	%i3
	subc	%l4,	%l5,	%l2
	movg	%icc,	%g5,	%i2
	fmovrdgez	%o0,	%f28,	%f24
	edge32	%g7,	%o3,	%i5
	lduw	[%l7 + 0x40],	%l1
	movrgz	%o6,	0x27F,	%o5
	fcmple32	%f26,	%f0,	%l0
	fxnors	%f31,	%f14,	%f4
	ldd	[%l7 + 0x48],	%f24
	edge16l	%i6,	%g4,	%g2
	movl	%xcc,	%o7,	%g1
	fornot1	%f20,	%f24,	%f2
	fmovdvc	%xcc,	%f14,	%f18
	fpsub32	%f24,	%f10,	%f20
	array16	%o2,	%o1,	%i0
	st	%f29,	[%l7 + 0x14]
	array32	%o4,	%g3,	%g6
	srlx	%i1,	%i7,	%i4
	fmovscs	%xcc,	%f26,	%f9
	movl	%xcc,	%l3,	%i3
	movleu	%icc,	%l6,	%l4
	for	%f18,	%f20,	%f28
	ldsb	[%l7 + 0x54],	%l5
	smulcc	%l2,	%g5,	%i2
	edge8	%o0,	%o3,	%i5
	alignaddr	%g7,	%l1,	%o5
	move	%xcc,	%l0,	%o6
	ldsb	[%l7 + 0x1A],	%i6
	nop
	set	0x44, %g4
	ldsb	[%l7 + %g4],	%g4
	srax	%g2,	%g1,	%o7
	or	%o2,	%o1,	%i0
	edge16l	%g3,	%o4,	%i1
	sllx	%i7,	%i4,	%g6
	add	%i3,	%l3,	%l6
	ldsh	[%l7 + 0x14],	%l5
	edge16ln	%l2,	%g5,	%i2
	movleu	%xcc,	%l4,	%o3
	addcc	%i5,	0x1DD8,	%g7
	fand	%f20,	%f6,	%f20
	sll	%o0,	0x13,	%o5
	movrgez	%l1,	0x381,	%o6
	andn	%l0,	%g4,	%g2
	edge16n	%g1,	%i6,	%o2
	fmovrdgez	%o1,	%f6,	%f2
	ldd	[%l7 + 0x28],	%o6
	movrgz	%i0,	0x26C,	%o4
	movrgez	%i1,	%g3,	%i7
	ldd	[%l7 + 0x30],	%f22
	movne	%xcc,	%g6,	%i3
	or	%l3,	%i4,	%l6
	ldub	[%l7 + 0x6D],	%l5
	fandnot1	%f26,	%f16,	%f14
	mova	%xcc,	%l2,	%i2
	movl	%icc,	%g5,	%l4
	smul	%i5,	0x09E3,	%g7
	fmovrdgez	%o0,	%f18,	%f10
	move	%icc,	%o5,	%l1
	sethi	0x0343,	%o6
	orn	%l0,	%g4,	%g2
	movrlz	%g1,	%i6,	%o3
	array8	%o1,	%o7,	%i0
	sdiv	%o2,	0x1597,	%o4
	fmovdvc	%xcc,	%f4,	%f3
	array8	%g3,	%i7,	%i1
	sdiv	%g6,	0x0286,	%i3
	fmovrslz	%i4,	%f3,	%f31
	fmovsleu	%icc,	%f14,	%f30
	edge16l	%l3,	%l6,	%l2
	subcc	%i2,	0x0537,	%g5
	fmovrdgez	%l5,	%f6,	%f16
	fmovdle	%icc,	%f26,	%f11
	nop
	set	0x5E, %i5
	lduh	[%l7 + %i5],	%l4
	edge32l	%g7,	%i5,	%o5
	fmovrdne	%o0,	%f22,	%f16
	stx	%o6,	[%l7 + 0x78]
	edge16	%l1,	%g4,	%l0
	fpadd16	%f16,	%f22,	%f4
	movl	%icc,	%g2,	%i6
	udivcc	%o3,	0x02D2,	%g1
	orn	%o1,	%o7,	%i0
	fmovsn	%icc,	%f17,	%f0
	lduh	[%l7 + 0x20],	%o2
	restore %g3, %o4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i1,	0x0FAE,	%i3
	lduw	[%l7 + 0x74],	%g6
	fnot1	%f24,	%f16
	orncc	%i4,	%l6,	%l2
	edge8ln	%i2,	%l3,	%l5
	fnot2	%f10,	%f4
	orn	%g5,	0x1CAF,	%g7
	siam	0x4
	fpackfix	%f30,	%f15
	movrlez	%i5,	%o5,	%l4
	addcc	%o0,	0x0466,	%l1
	movg	%icc,	%g4,	%o6
	stw	%l0,	[%l7 + 0x34]
	save %i6, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f10,	%f31
	fnegs	%f4,	%f23
	st	%f20,	[%l7 + 0x30]
	movrne	%g1,	0x240,	%o7
	xnor	%i0,	0x125E,	%o1
	mulscc	%g3,	%o2,	%o4
	orn	%i7,	0x0433,	%i3
	or	%g6,	0x0481,	%i1
	alignaddrl	%l6,	%i4,	%l2
	sub	%l3,	%l5,	%i2
	movge	%xcc,	%g5,	%i5
	subc	%o5,	0x0BC7,	%l4
	movneg	%icc,	%g7,	%o0
	move	%icc,	%l1,	%g4
	srl	%l0,	0x02,	%o6
	fmovrslz	%i6,	%f20,	%f19
	edge16n	%o3,	%g1,	%g2
	edge32	%o7,	%o1,	%g3
	mulx	%i0,	0x1689,	%o2
	fmovsl	%xcc,	%f25,	%f18
	sub	%o4,	%i7,	%i3
	st	%f14,	[%l7 + 0x40]
	movleu	%icc,	%g6,	%l6
	array32	%i1,	%l2,	%i4
	fmovdvs	%icc,	%f2,	%f12
	stx	%l3,	[%l7 + 0x58]
	and	%i2,	0x02E2,	%g5
	srl	%l5,	%i5,	%o5
	movg	%icc,	%g7,	%l4
	movl	%icc,	%l1,	%o0
	orncc	%l0,	0x0A8D,	%g4
	array8	%i6,	%o6,	%o3
	stb	%g1,	[%l7 + 0x49]
	movneg	%icc,	%o7,	%o1
	smul	%g3,	0x1B95,	%i0
	movpos	%icc,	%g2,	%o2
	edge32	%o4,	%i7,	%i3
	lduw	[%l7 + 0x38],	%l6
	umulcc	%i1,	%g6,	%i4
	fandnot1s	%f21,	%f18,	%f28
	movpos	%icc,	%l3,	%i2
	movneg	%icc,	%l2,	%l5
	fandnot2	%f24,	%f16,	%f16
	movre	%i5,	%o5,	%g7
	edge16	%g5,	%l4,	%o0
	fmul8x16au	%f13,	%f4,	%f12
	stx	%l1,	[%l7 + 0x60]
	fmovrsgez	%l0,	%f18,	%f19
	ld	[%l7 + 0x20],	%f10
	edge16	%g4,	%i6,	%o6
	fmovrdgz	%g1,	%f12,	%f20
	ldd	[%l7 + 0x18],	%f8
	fpsub16s	%f5,	%f25,	%f12
	fcmpd	%fcc2,	%f18,	%f20
	fmovrsne	%o7,	%f17,	%f16
	movvc	%icc,	%o3,	%o1
	movg	%icc,	%i0,	%g2
	save %g3, %o2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i7,	0x062,	%i3
	add	%i1,	%g6,	%i4
	fsrc1	%f8,	%f8
	edge8ln	%l6,	%l3,	%l2
	fmul8x16au	%f6,	%f0,	%f26
	fmovsgu	%icc,	%f1,	%f23
	edge8	%l5,	%i5,	%o5
	fmovsleu	%xcc,	%f15,	%f12
	lduh	[%l7 + 0x6E],	%g7
	movge	%icc,	%i2,	%l4
	srlx	%o0,	%g5,	%l0
	lduh	[%l7 + 0x0C],	%g4
	andn	%i6,	%o6,	%g1
	movcs	%xcc,	%o7,	%l1
	orncc	%o1,	%o3,	%i0
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	addccc	%o4,	0x0FBD,	%o2
	fmovsge	%xcc,	%f21,	%f25
	ldd	[%l7 + 0x48],	%f16
	subc	%i7,	%i3,	%i1
	udivcc	%i4,	0x0EEC,	%g6
	mulx	%l3,	%l2,	%l6
	fornot1s	%f5,	%f3,	%f14
	movrgez	%i5,	0x078,	%l5
	movrgez	%o5,	0x38D,	%g7
	udivcc	%l4,	0x0B50,	%i2
	edge16	%o0,	%l0,	%g4
	fcmpne16	%f12,	%f22,	%i6
	addcc	%g5,	%o6,	%o7
	movleu	%icc,	%l1,	%g1
	fornot1s	%f19,	%f5,	%f14
	movg	%xcc,	%o1,	%i0
	fcmps	%fcc2,	%f14,	%f31
	orncc	%o3,	%g2,	%g3
	srlx	%o4,	0x0A,	%i7
	srax	%i3,	0x13,	%i1
	fabss	%f14,	%f4
	fpack16	%f0,	%f25
	fmovrslez	%i4,	%f18,	%f29
	fsrc2s	%f21,	%f19
	movcc	%xcc,	%g6,	%l3
	std	%f4,	[%l7 + 0x58]
	ldx	[%l7 + 0x40],	%o2
	add	%l6,	0x0EC6,	%i5
	fmovsvs	%xcc,	%f21,	%f22
	movleu	%xcc,	%l5,	%o5
	array16	%l2,	%g7,	%l4
	orcc	%o0,	0x1752,	%l0
	stb	%i2,	[%l7 + 0x38]
	movleu	%xcc,	%i6,	%g5
	ld	[%l7 + 0x7C],	%f26
	and	%g4,	0x0383,	%o7
	edge32n	%o6,	%g1,	%l1
	lduh	[%l7 + 0x7C],	%i0
	movvs	%icc,	%o3,	%g2
	fmovsvc	%xcc,	%f15,	%f14
	ldx	[%l7 + 0x30],	%o1
	lduw	[%l7 + 0x70],	%o4
	xor	%g3,	%i3,	%i7
	movge	%xcc,	%i4,	%g6
	addcc	%l3,	0x1776,	%i1
	popc	0x0EED,	%o2
	edge32l	%l6,	%i5,	%o5
	udivx	%l2,	0x0385,	%g7
	fsrc1	%f14,	%f0
	ldsb	[%l7 + 0x51],	%l4
	fnor	%f18,	%f0,	%f24
	alignaddr	%o0,	%l5,	%i2
	sllx	%i6,	0x12,	%l0
	umulcc	%g5,	%g4,	%o7
	bshuffle	%f24,	%f14,	%f24
	srlx	%o6,	%g1,	%l1
	sllx	%i0,	%o3,	%o1
	fones	%f14
	array8	%g2,	%o4,	%i3
	array32	%g3,	%i4,	%i7
	addccc	%g6,	0x062A,	%i1
	subccc	%l3,	0x1D4C,	%l6
	popc	%o2,	%o5
	edge16ln	%i5,	%l2,	%g7
	move	%xcc,	%o0,	%l4
	edge16l	%l5,	%i2,	%l0
	popc	0x0361,	%g5
	srlx	%g4,	0x1B,	%i6
	fmovsn	%xcc,	%f11,	%f24
	fpmerge	%f12,	%f11,	%f4
	movcc	%icc,	%o7,	%g1
	save %o6, %l1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o3,	0x0E,	%g2
	fmovdn	%icc,	%f10,	%f30
	subcc	%o4,	%o1,	%i3
	movrlez	%g3,	0x1AA,	%i7
	subcc	%i4,	0x15E9,	%i1
	orcc	%l3,	0x0641,	%g6
	for	%f28,	%f20,	%f6
	mulx	%l6,	0x1B82,	%o2
	add	%i5,	0x10F5,	%l2
	lduw	[%l7 + 0x20],	%o5
	fzeros	%f2
	subc	%o0,	0x1DDF,	%g7
	xorcc	%l5,	%l4,	%l0
	movge	%icc,	%i2,	%g4
	fandnot2s	%f1,	%f6,	%f26
	xnorcc	%g5,	%o7,	%i6
	movneg	%xcc,	%g1,	%o6
	xor	%i0,	0x11FA,	%l1
	fcmpne16	%f10,	%f14,	%o3
	addcc	%g2,	%o4,	%o1
	umul	%g3,	0x0647,	%i7
	umulcc	%i3,	%i1,	%i4
	fnand	%f30,	%f20,	%f8
	edge8ln	%g6,	%l6,	%o2
	edge16ln	%l3,	%l2,	%i5
	movrgez	%o0,	%o5,	%g7
	edge32n	%l5,	%l0,	%i2
	edge32ln	%g4,	%g5,	%o7
	sdivcc	%l4,	0x14B3,	%g1
	srl	%i6,	%i0,	%o6
	mulx	%l1,	0x15BC,	%o3
	fcmpne16	%f6,	%f18,	%o4
	fmovrsgz	%g2,	%f18,	%f27
	fcmpgt32	%f28,	%f18,	%g3
	udivcc	%i7,	0x1B3D,	%o1
	edge8l	%i3,	%i4,	%g6
	move	%icc,	%l6,	%o2
	fmovdvs	%icc,	%f23,	%f12
	sethi	0x13EE,	%i1
	udivx	%l2,	0x1C8F,	%l3
	movrgz	%o0,	0x002,	%i5
	std	%f20,	[%l7 + 0x50]
	fmovs	%f14,	%f27
	edge16l	%g7,	%o5,	%l0
	fnot2s	%f13,	%f25
	sdivcc	%l5,	0x011F,	%g4
	movrlz	%i2,	0x2BA,	%g5
	edge16ln	%o7,	%l4,	%g1
	smul	%i0,	%i6,	%o6
	nop
	set	0x7C, %l3
	stw	%l1,	[%l7 + %l3]
	ldsh	[%l7 + 0x50],	%o3
	move	%icc,	%g2,	%g3
	edge32l	%i7,	%o1,	%o4
	fcmple32	%f20,	%f22,	%i4
	addccc	%i3,	0x1772,	%l6
	fmovsl	%xcc,	%f27,	%f17
	xnor	%g6,	%i1,	%o2
	movrlz	%l3,	%l2,	%i5
	edge16n	%g7,	%o0,	%l0
	udivcc	%l5,	0x08A3,	%o5
	smul	%i2,	0x18AE,	%g4
	edge16n	%o7,	%g5,	%l4
	fandnot2s	%f23,	%f24,	%f12
	ld	[%l7 + 0x50],	%f16
	movrlz	%i0,	%i6,	%o6
	fmovsne	%icc,	%f15,	%f17
	srl	%l1,	%o3,	%g1
	orncc	%g3,	%g2,	%i7
	movrlez	%o1,	0x0B2,	%o4
	fmovsvc	%xcc,	%f15,	%f29
	movne	%xcc,	%i3,	%l6
	ldd	[%l7 + 0x78],	%g6
	umul	%i4,	%i1,	%o2
	edge32n	%l3,	%i5,	%g7
	subc	%o0,	0x1298,	%l2
	fcmple32	%f10,	%f12,	%l0
	edge16ln	%l5,	%o5,	%i2
	and	%g4,	%g5,	%o7
	fands	%f25,	%f19,	%f16
	restore %i0, %l4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l1,	0x08F,	%o6
	movrgz	%o3,	0x308,	%g1
	fnand	%f8,	%f8,	%f20
	edge32ln	%g2,	%i7,	%g3
	array16	%o1,	%o4,	%i3
	ld	[%l7 + 0x60],	%f4
	sdivcc	%l6,	0x1D8C,	%i4
	mova	%xcc,	%g6,	%i1
	addccc	%l3,	%o2,	%i5
	addcc	%o0,	0x1F31,	%l2
	bshuffle	%f28,	%f24,	%f24
	ldd	[%l7 + 0x40],	%f4
	fmovde	%xcc,	%f4,	%f9
	addc	%g7,	%l5,	%l0
	lduh	[%l7 + 0x7E],	%o5
	fcmple16	%f22,	%f0,	%g4
	fpadd32	%f16,	%f30,	%f28
	sdiv	%i2,	0x14E0,	%o7
	fpsub32	%f18,	%f24,	%f28
	srax	%i0,	%l4,	%g5
	srax	%i6,	%l1,	%o3
	fpadd32	%f22,	%f22,	%f12
	orcc	%o6,	0x1CE6,	%g1
	sub	%i7,	%g2,	%g3
	ldsh	[%l7 + 0x40],	%o1
	array16	%i3,	%o4,	%i4
	fmovdvc	%icc,	%f26,	%f3
	lduh	[%l7 + 0x0C],	%g6
	sll	%l6,	%i1,	%o2
	fmovsge	%xcc,	%f9,	%f10
	ldd	[%l7 + 0x60],	%f24
	andncc	%l3,	%i5,	%o0
	movrlz	%l2,	%g7,	%l5
	std	%f4,	[%l7 + 0x70]
	fmovdle	%icc,	%f16,	%f23
	lduw	[%l7 + 0x58],	%o5
	movcc	%xcc,	%g4,	%i2
	fmovdvs	%icc,	%f9,	%f26
	fcmpne32	%f28,	%f4,	%o7
	udivx	%i0,	0x151B,	%l0
	and	%l4,	%i6,	%l1
	st	%f28,	[%l7 + 0x1C]
	fmovrse	%o3,	%f9,	%f5
	umul	%g5,	0x10FC,	%o6
	fpsub32s	%f10,	%f21,	%f5
	sllx	%i7,	%g1,	%g2
	movrgez	%o1,	0x363,	%i3
	popc	0x1A40,	%o4
	srax	%i4,	0x09,	%g6
	movre	%g3,	%l6,	%i1
	addccc	%o2,	%i5,	%o0
	lduw	[%l7 + 0x78],	%l2
	mulx	%g7,	0x0CDA,	%l3
	movne	%xcc,	%l5,	%g4
	xnor	%i2,	0x1BD4,	%o5
	array8	%i0,	%o7,	%l4
	umulcc	%l0,	%l1,	%i6
	movne	%icc,	%g5,	%o3
	edge8l	%o6,	%g1,	%i7
	fsrc1	%f12,	%f30
	fmovrslez	%o1,	%f30,	%f22
	edge8l	%g2,	%i3,	%o4
	edge32n	%g6,	%i4,	%g3
	ldub	[%l7 + 0x51],	%i1
	mova	%icc,	%o2,	%l6
	fmovd	%f16,	%f8
	array16	%i5,	%l2,	%g7
	fmovdleu	%icc,	%f31,	%f28
	udivcc	%o0,	0x1DC1,	%l5
	fandnot2	%f20,	%f16,	%f10
	mulx	%l3,	0x0C11,	%g4
	andncc	%i2,	%i0,	%o5
	sth	%l4,	[%l7 + 0x40]
	alignaddrl	%l0,	%l1,	%o7
	edge32n	%g5,	%o3,	%i6
	andn	%g1,	0x06FD,	%o6
	fmovsge	%icc,	%f15,	%f9
	orcc	%o1,	%i7,	%i3
	add	%o4,	%g2,	%i4
	edge8	%g6,	%i1,	%g3
	fnot1s	%f14,	%f16
	srax	%o2,	%l6,	%l2
	umulcc	%g7,	0x1F8D,	%i5
	alignaddr	%l5,	%o0,	%g4
	sllx	%i2,	0x07,	%l3
	mulscc	%i0,	0x0E3D,	%o5
	umulcc	%l0,	0x03E5,	%l4
	edge16ln	%o7,	%g5,	%l1
	movcs	%icc,	%o3,	%g1
	movleu	%icc,	%i6,	%o6
	add	%o1,	%i3,	%i7
	subccc	%g2,	%o4,	%i4
	movle	%icc,	%i1,	%g6
	smulcc	%o2,	0x14B3,	%l6
	array16	%l2,	%g3,	%g7
	mulscc	%i5,	%l5,	%o0
	popc	0x0E56,	%i2
	pdist	%f20,	%f18,	%f26
	edge8n	%g4,	%i0,	%l3
	umulcc	%o5,	0x0E5B,	%l4
	array16	%l0,	%o7,	%l1
	fnands	%f4,	%f23,	%f12
	movneg	%xcc,	%o3,	%g1
	andn	%i6,	%g5,	%o1
	movrlz	%i3,	0x29A,	%i7
	orncc	%g2,	0x13FE,	%o4
	udiv	%o6,	0x10E7,	%i4
	fsrc2	%f26,	%f26
	ldsh	[%l7 + 0x2C],	%g6
	xor	%o2,	%l6,	%l2
	edge16n	%g3,	%g7,	%i5
	umulcc	%i1,	%l5,	%i2
	ldsh	[%l7 + 0x10],	%g4
	movneg	%xcc,	%i0,	%o0
	fmovdneg	%xcc,	%f16,	%f15
	movn	%icc,	%o5,	%l3
	andncc	%l4,	%o7,	%l0
	fmovscs	%xcc,	%f18,	%f3
	fandnot1s	%f23,	%f30,	%f4
	xorcc	%o3,	%l1,	%g1
	mulscc	%i6,	%g5,	%i3
	movne	%icc,	%i7,	%o1
	movrgz	%o4,	0x37B,	%o6
	edge32n	%g2,	%i4,	%o2
	fmovde	%icc,	%f22,	%f22
	movre	%g6,	0x304,	%l2
	udivcc	%g3,	0x0E57,	%g7
	xnor	%l6,	%i1,	%i5
	stb	%l5,	[%l7 + 0x6F]
	fornot2	%f16,	%f30,	%f4
	edge8n	%i2,	%g4,	%i0
	movle	%icc,	%o0,	%l3
	fmovrdlz	%o5,	%f26,	%f22
	smulcc	%o7,	%l0,	%l4
	stb	%l1,	[%l7 + 0x36]
	edge16n	%o3,	%g1,	%i6
	sdiv	%i3,	0x1EFF,	%i7
	alignaddr	%o1,	%g5,	%o6
	fpsub16	%f14,	%f30,	%f26
	movleu	%icc,	%g2,	%o4
	movne	%xcc,	%i4,	%o2
	array8	%g6,	%l2,	%g3
	movrgez	%l6,	%i1,	%i5
	edge32	%g7,	%i2,	%l5
	fzero	%f20
	popc	0x1FBD,	%i0
	stw	%o0,	[%l7 + 0x20]
	fmovs	%f13,	%f16
	fmovsneg	%xcc,	%f3,	%f26
	orn	%l3,	%g4,	%o5
	subccc	%o7,	0x124E,	%l0
	alignaddr	%l4,	%l1,	%g1
	fmuld8sux16	%f12,	%f12,	%f26
	xor	%o3,	%i6,	%i3
	fabsd	%f20,	%f8
	fmovspos	%xcc,	%f3,	%f11
	fmovdg	%icc,	%f19,	%f23
	ldsw	[%l7 + 0x30],	%o1
	or	%g5,	0x19C5,	%o6
	movvs	%xcc,	%g2,	%i7
	srl	%i4,	%o2,	%g6
	stb	%o4,	[%l7 + 0x34]
	and	%g3,	%l6,	%l2
	movg	%icc,	%i1,	%i5
	fand	%f28,	%f18,	%f0
	fpsub32	%f24,	%f24,	%f12
	edge8n	%i2,	%g7,	%i0
	sll	%o0,	%l3,	%g4
	movge	%xcc,	%l5,	%o5
	sdivx	%l0,	0x13FC,	%l4
	fpack16	%f16,	%f25
	udiv	%l1,	0x018C,	%o7
	ldub	[%l7 + 0x70],	%o3
	sth	%i6,	[%l7 + 0x50]
	movvc	%xcc,	%i3,	%o1
	fones	%f24
	xnorcc	%g5,	0x1265,	%o6
	add	%g1,	%i7,	%g2
	fpadd32s	%f27,	%f10,	%f20
	edge8	%i4,	%g6,	%o2
	subcc	%o4,	0x17FE,	%g3
	fmovd	%f20,	%f22
	fmovrslez	%l2,	%f3,	%f14
	fmovscs	%icc,	%f26,	%f2
	smul	%l6,	0x0934,	%i1
	orcc	%i5,	0x1AFF,	%g7
	udiv	%i0,	0x0931,	%i2
	umulcc	%o0,	%g4,	%l5
	movrgez	%l3,	%l0,	%l4
	nop
	set	0x68, %l4
	std	%f28,	[%l7 + %l4]
	lduh	[%l7 + 0x66],	%l1
	smul	%o5,	%o7,	%o3
	andncc	%i6,	%i3,	%o1
	and	%o6,	%g5,	%i7
	umul	%g2,	0x045E,	%g1
	movvs	%xcc,	%g6,	%o2
	fcmpne16	%f12,	%f0,	%o4
	edge16n	%i4,	%l2,	%l6
	fpadd16	%f14,	%f8,	%f12
	alignaddrl	%i1,	%g3,	%g7
	fmovdleu	%xcc,	%f27,	%f4
	umul	%i5,	%i0,	%i2
	subc	%g4,	%o0,	%l3
	movn	%icc,	%l5,	%l4
	movrne	%l1,	%l0,	%o5
	fmovdcs	%icc,	%f18,	%f16
	or	%o7,	%i6,	%i3
	ldsb	[%l7 + 0x28],	%o3
	edge8	%o1,	%g5,	%i7
	fcmpeq32	%f8,	%f12,	%o6
	movn	%xcc,	%g2,	%g1
	sdivx	%o2,	0x1E29,	%g6
	movle	%xcc,	%o4,	%l2
	array8	%l6,	%i4,	%g3
	stx	%i1,	[%l7 + 0x08]
	movge	%xcc,	%g7,	%i5
	fandnot2	%f22,	%f10,	%f30
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	fmovsne	%icc,	%f1,	%f21
	stx	%i0,	[%l7 + 0x68]
	orn	%l3,	0x1F0B,	%l5
	edge32	%l4,	%l0,	%l1
	movn	%xcc,	%o5,	%i6
	edge32l	%i3,	%o3,	%o1
	restore %g5, 0x123E, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o6,	0x0B30,	%i7
	edge8ln	%g1,	%g2,	%g6
	movgu	%icc,	%o4,	%l2
	addccc	%l6,	%o2,	%i4
	ldsh	[%l7 + 0x1A],	%i1
	alignaddr	%g3,	%g7,	%i2
	mulx	%g4,	0x1E75,	%i5
	movvc	%icc,	%i0,	%l3
	andn	%o0,	0x1E8B,	%l4
	array16	%l0,	%l1,	%o5
	fnand	%f8,	%f26,	%f24
	stb	%l5,	[%l7 + 0x27]
	edge32ln	%i6,	%o3,	%o1
	ldx	[%l7 + 0x08],	%i3
	sethi	0x06C7,	%o7
	sdiv	%o6,	0x1427,	%g5
	edge8l	%g1,	%i7,	%g2
	ldsh	[%l7 + 0x70],	%g6
	srl	%l2,	0x07,	%o4
	umulcc	%l6,	%i4,	%o2
	edge8	%i1,	%g7,	%i2
	movleu	%icc,	%g3,	%i5
	fcmple32	%f16,	%f2,	%i0
	orncc	%g4,	0x0255,	%l3
	sll	%o0,	%l0,	%l1
	addccc	%l4,	%o5,	%l5
	fmovdcc	%xcc,	%f12,	%f18
	ldsh	[%l7 + 0x6A],	%o3
	array8	%o1,	%i3,	%i6
	ldx	[%l7 + 0x30],	%o7
	srax	%o6,	0x19,	%g1
	smul	%i7,	%g2,	%g5
	fpsub16s	%f3,	%f16,	%f12
	fmovrdlez	%l2,	%f2,	%f30
	sethi	0x1B50,	%o4
	or	%l6,	0x0E53,	%g6
	edge8n	%i4,	%i1,	%g7
	fpsub16s	%f19,	%f13,	%f18
	srl	%i2,	0x00,	%o2
	andncc	%g3,	%i0,	%g4
	udiv	%i5,	0x0C3E,	%o0
	srax	%l3,	0x08,	%l1
	fpackfix	%f30,	%f19
	mova	%icc,	%l4,	%o5
	orn	%l0,	0x0B91,	%o3
	fmovse	%icc,	%f1,	%f5
	edge16ln	%o1,	%i3,	%l5
	and	%o7,	0x1E1A,	%o6
	movcs	%xcc,	%i6,	%g1
	addcc	%g2,	0x1EFD,	%g5
	stb	%i7,	[%l7 + 0x44]
	xor	%o4,	%l2,	%l6
	addccc	%i4,	0x061D,	%i1
	fsrc1	%f22,	%f8
	fmovrdgez	%g6,	%f6,	%f8
	srl	%i2,	0x1F,	%o2
	fnands	%f9,	%f28,	%f14
	edge16l	%g3,	%g7,	%i0
	array16	%i5,	%g4,	%l3
	srlx	%o0,	%l4,	%o5
	movrgz	%l1,	%l0,	%o3
	sth	%i3,	[%l7 + 0x40]
	stx	%o1,	[%l7 + 0x38]
	fmovrslz	%o7,	%f18,	%f11
	umul	%o6,	%l5,	%g1
	fpadd16s	%f30,	%f21,	%f2
	mulx	%g2,	0x0A17,	%i6
	smulcc	%g5,	%i7,	%l2
	add	%o4,	0x1BFA,	%i4
	edge32ln	%i1,	%g6,	%i2
	fcmpes	%fcc0,	%f27,	%f6
	udivx	%o2,	0x1560,	%g3
	ldd	[%l7 + 0x58],	%f18
	edge32l	%l6,	%g7,	%i5
	fmovdg	%icc,	%f8,	%f26
	fmovdle	%icc,	%f28,	%f24
	udivcc	%i0,	0x16CF,	%l3
	edge32n	%g4,	%o0,	%o5
	xnorcc	%l1,	0x05D7,	%l4
	st	%f13,	[%l7 + 0x60]
	sra	%l0,	0x0A,	%o3
	edge32	%o1,	%i3,	%o7
	umulcc	%l5,	%o6,	%g2
	edge16	%g1,	%i6,	%i7
	array8	%g5,	%l2,	%o4
	srax	%i4,	0x00,	%g6
	edge32n	%i2,	%o2,	%g3
	andncc	%i1,	%l6,	%g7
	subcc	%i5,	0x00DF,	%i0
	addcc	%l3,	%g4,	%o5
	fcmpeq32	%f4,	%f24,	%o0
	andn	%l1,	0x1F5F,	%l0
	fcmped	%fcc3,	%f12,	%f14
	edge16	%l4,	%o1,	%o3
	fands	%f21,	%f3,	%f14
	ldsw	[%l7 + 0x28],	%i3
	movleu	%xcc,	%l5,	%o7
	sth	%g2,	[%l7 + 0x38]
	fpack16	%f12,	%f8
	save %g1, 0x15CC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x24, %l6
	stb	%i7,	[%l7 + %l6]
	ldd	[%l7 + 0x08],	%f20
	sth	%g5,	[%l7 + 0x30]
	edge8ln	%l2,	%o4,	%i6
	subc	%i4,	%g6,	%i2
	fexpand	%f28,	%f10
	save %o2, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g7,	%i5
	movn	%icc,	%i1,	%l3
	subc	%g4,	0x18CF,	%o5
	fmovsvc	%icc,	%f26,	%f16
	stw	%o0,	[%l7 + 0x6C]
	movcs	%xcc,	%l1,	%i0
	fsrc1s	%f1,	%f29
	fnor	%f10,	%f16,	%f28
	ldsw	[%l7 + 0x50],	%l0
	lduh	[%l7 + 0x40],	%l4
	fors	%f5,	%f11,	%f15
	nop
	set	0x52, %l2
	stb	%o1,	[%l7 + %l2]
	orn	%i3,	%l5,	%o3
	ldub	[%l7 + 0x31],	%g2
	edge16n	%g1,	%o7,	%i7
	ldd	[%l7 + 0x50],	%g4
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	array32	%o6,	%i4,	%i6
	movrne	%i2,	0x3A3,	%o2
	movcc	%icc,	%g6,	%g3
	edge32	%l6,	%i5,	%i1
	fmovrsne	%l3,	%f6,	%f4
	alignaddrl	%g4,	%g7,	%o0
	sra	%o5,	%i0,	%l0
	sll	%l1,	%l4,	%o1
	movrne	%i3,	%o3,	%g2
	fxors	%f29,	%f0,	%f30
	fnot2	%f4,	%f12
	edge32l	%l5,	%g1,	%o7
	sdivcc	%i7,	0x0BD3,	%l2
	movl	%icc,	%o4,	%g5
	fxnors	%f15,	%f11,	%f3
	movneg	%icc,	%o6,	%i6
	xor	%i4,	0x1BDB,	%o2
	ldd	[%l7 + 0x70],	%f6
	movcc	%icc,	%g6,	%g3
	xorcc	%i2,	0x0E83,	%l6
	sdiv	%i5,	0x1059,	%l3
	lduh	[%l7 + 0x20],	%g4
	fandnot2s	%f26,	%f3,	%f27
	movne	%icc,	%g7,	%i1
	xnorcc	%o0,	0x10A4,	%i0
	fandnot1s	%f5,	%f10,	%f12
	fornot1	%f30,	%f26,	%f12
	movrne	%l0,	%l1,	%o5
	movleu	%icc,	%l4,	%i3
	fmovdle	%icc,	%f22,	%f19
	xorcc	%o3,	0x1858,	%o1
	fmovrdlez	%g2,	%f24,	%f26
	ldx	[%l7 + 0x40],	%l5
	srl	%g1,	0x04,	%o7
	fexpand	%f31,	%f0
	fmovd	%f26,	%f18
	movrgz	%l2,	0x3BD,	%i7
	fmovdl	%xcc,	%f26,	%f9
	orncc	%g5,	0x0EA1,	%o4
	xnor	%o6,	%i4,	%o2
	movge	%xcc,	%g6,	%g3
	fpadd16	%f2,	%f0,	%f16
	edge16n	%i2,	%l6,	%i5
	ld	[%l7 + 0x4C],	%f28
	fsrc2s	%f29,	%f8
	udiv	%l3,	0x17C3,	%i6
	movg	%icc,	%g4,	%g7
	movgu	%xcc,	%o0,	%i1
	fandnot2s	%f2,	%f23,	%f27
	stb	%l0,	[%l7 + 0x6C]
	fmovdcs	%xcc,	%f20,	%f20
	movvs	%icc,	%i0,	%o5
	edge8n	%l1,	%l4,	%o3
	fnot1	%f22,	%f24
	edge8	%o1,	%i3,	%l5
	fnot2s	%f30,	%f17
	sllx	%g2,	0x02,	%g1
	std	%f30,	[%l7 + 0x38]
	movcs	%xcc,	%o7,	%i7
	umul	%l2,	0x1903,	%g5
	movneg	%icc,	%o4,	%o6
	fpack32	%f4,	%f20,	%f20
	sll	%o2,	0x19,	%g6
	fmovde	%icc,	%f9,	%f21
	andcc	%g3,	0x1403,	%i2
	xorcc	%l6,	0x0641,	%i5
	movl	%icc,	%i4,	%i6
	srl	%g4,	%g7,	%l3
	smul	%o0,	0x03FD,	%l0
	xnor	%i0,	%i1,	%o5
	ldsh	[%l7 + 0x64],	%l4
	andcc	%l1,	%o1,	%o3
	edge8l	%l5,	%g2,	%g1
	array32	%i3,	%i7,	%l2
	fmovrsgz	%g5,	%f25,	%f22
	fmovd	%f16,	%f28
	popc	%o4,	%o7
	move	%xcc,	%o2,	%g6
	srl	%o6,	%i2,	%g3
	mova	%icc,	%i5,	%i4
	edge8ln	%i6,	%g4,	%l6
	movcc	%xcc,	%l3,	%o0
	xnorcc	%l0,	0x1A85,	%i0
	sdivx	%g7,	0x0DA9,	%o5
	edge8n	%l4,	%l1,	%o1
	andncc	%o3,	%l5,	%g2
	andn	%i1,	%i3,	%g1
	fmovrsne	%l2,	%f8,	%f28
	ldx	[%l7 + 0x58],	%i7
	movleu	%icc,	%o4,	%o7
	srl	%o2,	0x11,	%g6
	fmovdge	%icc,	%f1,	%f16
	fmul8x16al	%f24,	%f11,	%f2
	ldd	[%l7 + 0x68],	%o6
	mova	%icc,	%i2,	%g3
	xor	%i5,	%i4,	%g5
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%i6
	sdiv	%g4,	0x08B9,	%l6
	edge16l	%l3,	%o0,	%i0
	subcc	%g7,	0x0B26,	%o5
	or	%l4,	0x1293,	%l0
	movge	%icc,	%l1,	%o1
	movl	%icc,	%l5,	%g2
	sir	0x188F
	edge32	%o3,	%i1,	%g1
	fmovsn	%icc,	%f13,	%f27
	andn	%l2,	%i7,	%i3
	fmul8sux16	%f24,	%f22,	%f8
	fsrc1	%f8,	%f0
	st	%f1,	[%l7 + 0x44]
	edge32ln	%o7,	%o4,	%g6
	fmovsvs	%xcc,	%f9,	%f30
	fsrc1s	%f12,	%f12
	movge	%icc,	%o6,	%o2
	movleu	%xcc,	%g3,	%i2
	andcc	%i4,	0x12BC,	%g5
	sra	%i6,	%i5,	%l6
	fnegd	%f16,	%f20
	movcc	%icc,	%g4,	%o0
	subccc	%l3,	%g7,	%o5
	ldub	[%l7 + 0x68],	%i0
	udiv	%l4,	0x0F42,	%l0
	srax	%l1,	%o1,	%g2
	sdiv	%o3,	0x17A5,	%i1
	fmul8x16	%f16,	%f22,	%f20
	addcc	%g1,	0x16E0,	%l2
	fmovse	%xcc,	%f22,	%f28
	fmovdne	%xcc,	%f24,	%f8
	movl	%xcc,	%i7,	%i3
	fmuld8ulx16	%f9,	%f13,	%f26
	xnorcc	%l5,	0x1E4A,	%o4
	edge8ln	%o7,	%o6,	%g6
	fmul8x16au	%f16,	%f17,	%f26
	subccc	%g3,	0x08D9,	%o2
	umulcc	%i2,	0x0520,	%g5
	fors	%f31,	%f14,	%f6
	edge16l	%i6,	%i4,	%i5
	ldub	[%l7 + 0x32],	%l6
	ldub	[%l7 + 0x73],	%o0
	alignaddr	%g4,	%l3,	%o5
	movcc	%xcc,	%i0,	%g7
	sra	%l4,	0x10,	%l0
	fmovrdgz	%l1,	%f18,	%f24
	stb	%g2,	[%l7 + 0x77]
	fmovd	%f0,	%f6
	and	%o3,	0x133C,	%o1
	movrne	%g1,	0x2F5,	%l2
	srl	%i7,	%i3,	%l5
	stb	%o4,	[%l7 + 0x66]
	edge16l	%i1,	%o6,	%g6
	movneg	%xcc,	%g3,	%o7
	ld	[%l7 + 0x2C],	%f19
	fmovd	%f2,	%f18
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%o2
	ldsw	[%l7 + 0x4C],	%g5
	movcs	%xcc,	%i6,	%i2
	fmovrsgz	%i4,	%f8,	%f7
	st	%f31,	[%l7 + 0x30]
	fmovsg	%xcc,	%f5,	%f28
	ldd	[%l7 + 0x18],	%i6
	fpsub32	%f10,	%f26,	%f26
	edge32n	%i5,	%o0,	%l3
	mova	%icc,	%o5,	%g4
	std	%f4,	[%l7 + 0x78]
	fnand	%f26,	%f26,	%f18
	movrgz	%i0,	0x3B0,	%l4
	fone	%f16
	movg	%icc,	%l0,	%l1
	movrlz	%g2,	%o3,	%o1
	fabsd	%f4,	%f8
	sdivcc	%g1,	0x0444,	%l2
	edge32ln	%i7,	%i3,	%g7
	stw	%o4,	[%l7 + 0x4C]
	ldd	[%l7 + 0x48],	%f2
	ldub	[%l7 + 0x4A],	%l5
	movn	%icc,	%o6,	%i1
	ld	[%l7 + 0x08],	%f8
	movpos	%icc,	%g3,	%g6
	fmovspos	%icc,	%f9,	%f16
	ldd	[%l7 + 0x20],	%f6
	fmul8sux16	%f28,	%f12,	%f18
	movleu	%icc,	%o7,	%g5
	fnand	%f26,	%f26,	%f10
	alignaddrl	%o2,	%i6,	%i2
	ldsh	[%l7 + 0x5A],	%l6
	movre	%i4,	%o0,	%i5
	subc	%o5,	%g4,	%l3
	fmovrslz	%l4,	%f10,	%f10
	sllx	%i0,	%l0,	%g2
	xorcc	%o3,	%o1,	%g1
	fsrc1	%f16,	%f22
	movvs	%icc,	%l1,	%i7
	movvs	%icc,	%i3,	%l2
	movcc	%icc,	%o4,	%g7
	alignaddr	%o6,	%i1,	%g3
	movcs	%icc,	%g6,	%l5
	fandnot1s	%f30,	%f31,	%f1
	edge32n	%g5,	%o2,	%o7
	mulscc	%i2,	0x06F5,	%i6
	fmovscc	%xcc,	%f18,	%f14
	edge8	%i4,	%l6,	%i5
	sdiv	%o5,	0x17A5,	%g4
	fnegs	%f12,	%f2
	edge32ln	%o0,	%l4,	%i0
	fpadd32s	%f24,	%f16,	%f6
	umul	%l3,	%l0,	%g2
	fornot2s	%f1,	%f12,	%f24
	fmul8x16al	%f24,	%f13,	%f22
	nop
	set	0x3C, %l5
	sth	%o1,	[%l7 + %l5]
	movn	%xcc,	%o3,	%g1
	and	%l1,	%i3,	%i7
	ldub	[%l7 + 0x2E],	%l2
	edge16l	%o4,	%g7,	%o6
	fnot2	%f10,	%f8
	edge32n	%i1,	%g6,	%g3
	subc	%g5,	%l5,	%o7
	andncc	%o2,	%i2,	%i4
	sub	%i6,	%i5,	%l6
	fmovdcc	%xcc,	%f27,	%f0
	edge16l	%o5,	%o0,	%g4
	edge8n	%i0,	%l3,	%l0
	fors	%f18,	%f8,	%f29
	lduw	[%l7 + 0x28],	%l4
	movn	%icc,	%g2,	%o1
	faligndata	%f0,	%f10,	%f18
	alignaddrl	%o3,	%g1,	%i3
	movrgez	%l1,	0x0A9,	%i7
	save %o4, 0x0CDE, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f20,	%f26
	movre	%o6,	%i1,	%l2
	sdiv	%g6,	0x123F,	%g3
	fmovrsgez	%l5,	%f25,	%f14
	or	%g5,	0x07AD,	%o7
	udivcc	%o2,	0x1B0B,	%i2
	udivcc	%i6,	0x13E9,	%i5
	movgu	%icc,	%i4,	%l6
	edge8	%o5,	%g4,	%o0
	fxnor	%f16,	%f18,	%f4
	and	%i0,	0x0363,	%l3
	orncc	%l0,	%g2,	%l4
	st	%f15,	[%l7 + 0x78]
	array8	%o1,	%o3,	%i3
	edge16l	%g1,	%l1,	%o4
	ld	[%l7 + 0x74],	%f30
	addc	%i7,	0x15B2,	%o6
	stw	%g7,	[%l7 + 0x28]
	fxor	%f24,	%f18,	%f4
	movrne	%l2,	0x226,	%g6
	xor	%g3,	%i1,	%l5
	movleu	%icc,	%g5,	%o7
	fmovrsne	%i2,	%f25,	%f11
	addcc	%o2,	%i5,	%i6
	umul	%i4,	0x0176,	%o5
	fpadd32	%f20,	%f20,	%f16
	fpsub16	%f4,	%f8,	%f22
	xor	%l6,	0x0D28,	%o0
	stb	%g4,	[%l7 + 0x58]
	edge16	%i0,	%l3,	%l0
	stb	%l4,	[%l7 + 0x21]
	save %g2, %o3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g1,	%i3,	%o4
	movrlz	%l1,	%i7,	%g7
	fpsub16s	%f25,	%f25,	%f3
	ldd	[%l7 + 0x38],	%f30
	movcs	%xcc,	%l2,	%o6
	add	%g3,	%g6,	%i1
	udiv	%g5,	0x0863,	%o7
	edge16ln	%i2,	%o2,	%l5
	movrne	%i5,	%i4,	%o5
	array8	%l6,	%o0,	%i6
	orncc	%i0,	%g4,	%l3
	movpos	%xcc,	%l4,	%g2
	ldub	[%l7 + 0x1A],	%l0
	movvc	%icc,	%o1,	%g1
	edge16n	%i3,	%o4,	%l1
	orcc	%o3,	0x08F9,	%i7
	edge32n	%g7,	%l2,	%g3
	ldd	[%l7 + 0x18],	%o6
	movn	%icc,	%g6,	%i1
	restore %g5, %o7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f30,	%f12
	edge8n	%i2,	%i5,	%i4
	movpos	%icc,	%l5,	%o5
	addc	%l6,	0x12A5,	%o0
	sdivcc	%i0,	0x1427,	%g4
	fzero	%f30
	fones	%f3
	fnands	%f17,	%f12,	%f31
	or	%l3,	0x1749,	%i6
	edge8ln	%g2,	%l4,	%l0
	fnot1	%f18,	%f14
	sll	%g1,	0x07,	%o1
	edge16l	%i3,	%o4,	%l1
	sdiv	%i7,	0x0338,	%o3
	ld	[%l7 + 0x68],	%f18
	movvs	%xcc,	%l2,	%g7
	ldsh	[%l7 + 0x0A],	%g3
	xnor	%o6,	%g6,	%g5
	fmovs	%f31,	%f19
	fmovdpos	%xcc,	%f2,	%f20
	array8	%i1,	%o7,	%i2
	ldsh	[%l7 + 0x68],	%i5
	edge8ln	%i4,	%o2,	%l5
	array16	%o5,	%l6,	%o0
	alignaddr	%i0,	%g4,	%i6
	sub	%l3,	0x1E63,	%g2
	andn	%l4,	%g1,	%l0
	ldd	[%l7 + 0x50],	%o0
	edge8	%i3,	%l1,	%i7
	fones	%f10
	movpos	%icc,	%o3,	%o4
	udivx	%g7,	0x00C4,	%g3
	xnorcc	%l2,	%o6,	%g6
	ldsh	[%l7 + 0x52],	%g5
	addcc	%i1,	%i2,	%o7
	movrlez	%i5,	0x099,	%i4
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%l4
	and	%o5,	0x1B61,	%l6
	andcc	%o0,	%i0,	%o2
	smul	%g4,	%i6,	%g2
	nop
	set	0x4C, %g6
	ldsh	[%l7 + %g6],	%l4
	movre	%g1,	0x1B7,	%l0
	edge16l	%o1,	%i3,	%l1
	udivx	%i7,	0x1729,	%o3
	fones	%f21
	fnands	%f9,	%f26,	%f20
	fpsub16s	%f23,	%f17,	%f20
	sll	%l3,	%g7,	%g3
	fmul8x16al	%f5,	%f3,	%f26
	andn	%l2,	0x0736,	%o6
	movre	%g6,	%o4,	%g5
	fpsub32s	%f20,	%f10,	%f7
	fnegd	%f12,	%f16
	or	%i1,	%o7,	%i5
	movrgz	%i2,	%i4,	%o5
	sub	%l6,	%o0,	%i0
	movcc	%icc,	%o2,	%g4
	edge16l	%l5,	%i6,	%g2
	orcc	%g1,	%l0,	%o1
	fmovdle	%icc,	%f27,	%f17
	array8	%i3,	%l4,	%l1
	fmovdvs	%icc,	%f13,	%f24
	fmovrdne	%i7,	%f16,	%f26
	fsrc2	%f30,	%f26
	fmuld8sux16	%f4,	%f6,	%f16
	edge8n	%l3,	%o3,	%g3
	movre	%g7,	0x2F5,	%o6
	sdivcc	%g6,	0x066C,	%o4
	fpack16	%f16,	%f1
	fmovrdlez	%l2,	%f0,	%f10
	fmovrslez	%g5,	%f13,	%f14
	movvc	%icc,	%i1,	%i5
	movpos	%xcc,	%i2,	%i4
	edge8	%o7,	%l6,	%o5
	edge16ln	%i0,	%o2,	%o0
	movrne	%l5,	%g4,	%g2
	array8	%i6,	%l0,	%g1
	fpmerge	%f8,	%f27,	%f6
	xor	%o1,	%l4,	%l1
	fmovrse	%i7,	%f26,	%f1
	ldsw	[%l7 + 0x74],	%i3
	sll	%l3,	%g3,	%g7
	edge16n	%o3,	%o6,	%o4
	ldsh	[%l7 + 0x14],	%l2
	orncc	%g6,	0x1505,	%g5
	srl	%i5,	%i2,	%i1
	sra	%i4,	%o7,	%o5
	fmovrdgez	%i0,	%f22,	%f10
	ldd	[%l7 + 0x68],	%o2
	edge32n	%l6,	%l5,	%o0
	udivx	%g4,	0x0347,	%g2
	fmovrdgz	%i6,	%f6,	%f26
	popc	%g1,	%o1
	movrne	%l4,	0x259,	%l0
	and	%l1,	0x11CA,	%i7
	stw	%i3,	[%l7 + 0x2C]
	movneg	%icc,	%g3,	%l3
	subccc	%g7,	0x170B,	%o6
	mova	%xcc,	%o4,	%o3
	movl	%xcc,	%l2,	%g6
	sdivx	%g5,	0x077A,	%i5
	nop
	set	0x6A, %l1
	ldsh	[%l7 + %l1],	%i2
	addc	%i4,	0x1EC7,	%o7
	orn	%o5,	%i1,	%i0
	alignaddr	%o2,	%l6,	%l5
	sllx	%g4,	0x14,	%g2
	edge8ln	%o0,	%g1,	%o1
	ldd	[%l7 + 0x60],	%f6
	fpsub16	%f16,	%f26,	%f14
	xnorcc	%i6,	%l4,	%l1
	fcmpes	%fcc2,	%f12,	%f22
	fzeros	%f31
	sub	%i7,	%i3,	%l0
	edge32	%l3,	%g7,	%o6
	fsrc2	%f4,	%f28
	movcc	%xcc,	%g3,	%o3
	fcmpes	%fcc1,	%f19,	%f4
	or	%l2,	%g6,	%g5
	fpsub32s	%f4,	%f13,	%f23
	sir	0x1896
	andncc	%o4,	%i5,	%i4
	edge16l	%i2,	%o7,	%i1
	fmovdvs	%icc,	%f9,	%f22
	ldsh	[%l7 + 0x34],	%i0
	movvc	%icc,	%o5,	%o2
	mulscc	%l5,	%g4,	%l6
	and	%o0,	0x18D0,	%g1
	mova	%icc,	%o1,	%i6
	srlx	%l4,	0x15,	%g2
	and	%i7,	0x04DF,	%i3
	xnor	%l1,	0x116C,	%l0
	sethi	0x1DF0,	%l3
	addcc	%o6,	%g7,	%o3
	edge32ln	%g3,	%g6,	%l2
	edge32n	%o4,	%i5,	%g5
	fmovscs	%xcc,	%f6,	%f30
	fnegd	%f18,	%f0
	edge8	%i4,	%i2,	%o7
	fmovrdgz	%i0,	%f4,	%f22
	edge16	%o5,	%o2,	%l5
	movrgez	%i1,	0x125,	%g4
	orn	%l6,	0x1491,	%o0
	fabss	%f31,	%f26
	movge	%icc,	%o1,	%g1
	orn	%l4,	%g2,	%i7
	fcmpgt16	%f4,	%f14,	%i6
	addc	%i3,	%l1,	%l3
	nop
	set	0x14, %o2
	ldsw	[%l7 + %o2],	%o6
	fabss	%f10,	%f25
	stb	%g7,	[%l7 + 0x76]
	edge16l	%l0,	%g3,	%o3
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%l2
	movgu	%icc,	%o4,	%i5
	ldub	[%l7 + 0x52],	%g5
	bshuffle	%f22,	%f2,	%f22
	sdivcc	%i4,	0x0B1D,	%g6
	movcs	%icc,	%o7,	%i0
	ldsw	[%l7 + 0x50],	%o5
	lduh	[%l7 + 0x7E],	%o2
	ld	[%l7 + 0x2C],	%f3
	fpackfix	%f12,	%f12
	save %l5, 0x1C90, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g4,	%i1,	%l6
	array32	%o0,	%g1,	%l4
	fmovdne	%icc,	%f16,	%f25
	move	%icc,	%g2,	%i7
	udivcc	%i6,	0x0AB3,	%i3
	subcc	%o1,	0x0B55,	%l1
	edge8l	%l3,	%g7,	%l0
	fands	%f4,	%f10,	%f14
	fmovrslz	%g3,	%f9,	%f31
	fmul8ulx16	%f16,	%f4,	%f30
	array16	%o3,	%o6,	%l2
	movgu	%icc,	%i5,	%g5
	edge32n	%i4,	%g6,	%o4
	fcmpne16	%f24,	%f14,	%i0
	fmovdge	%xcc,	%f9,	%f4
	fmovdcs	%icc,	%f24,	%f11
	edge32l	%o5,	%o2,	%o7
	fornot2s	%f5,	%f7,	%f8
	nop
	set	0x30, %g5
	stx	%l5,	[%l7 + %g5]
	edge8ln	%g4,	%i1,	%i2
	sra	%o0,	%g1,	%l4
	sth	%g2,	[%l7 + 0x30]
	ldub	[%l7 + 0x4C],	%i7
	mulx	%l6,	0x0FB5,	%i3
	udivcc	%o1,	0x1E49,	%l1
	sdivx	%i6,	0x12AC,	%l3
	ldub	[%l7 + 0x60],	%l0
	addccc	%g3,	0x19B7,	%g7
	srl	%o6,	%o3,	%l2
	movrgz	%g5,	%i4,	%g6
	st	%f13,	[%l7 + 0x70]
	edge8	%o4,	%i5,	%i0
	array8	%o5,	%o7,	%o2
	xorcc	%g4,	0x044A,	%i1
	fandnot1s	%f15,	%f6,	%f1
	fandnot1	%f12,	%f2,	%f8
	edge8	%i2,	%o0,	%g1
	alignaddrl	%l4,	%l5,	%i7
	subcc	%g2,	0x0326,	%i3
	smul	%l6,	%l1,	%o1
	sdivx	%i6,	0x1707,	%l0
	movvs	%xcc,	%l3,	%g7
	subcc	%o6,	%o3,	%g3
	fmovsa	%xcc,	%f28,	%f19
	lduh	[%l7 + 0x3C],	%g5
	movgu	%icc,	%l2,	%i4
	or	%o4,	0x1CD8,	%g6
	andn	%i0,	0x1ACA,	%o5
	movvc	%icc,	%o7,	%i5
	ldd	[%l7 + 0x50],	%g4
	movpos	%icc,	%o2,	%i2
	sethi	0x1473,	%i1
	popc	%g1,	%o0
	movvc	%icc,	%l4,	%l5
	fxor	%f6,	%f26,	%f30
	andcc	%g2,	0x1C38,	%i3
	orn	%l6,	0x0986,	%l1
	movrgz	%o1,	0x2D9,	%i6
	edge32n	%i7,	%l0,	%l3
	srl	%o6,	%o3,	%g3
	umul	%g5,	%g7,	%i4
	srax	%o4,	0x03,	%g6
	popc	0x0F0B,	%i0
	movvs	%icc,	%o5,	%l2
	fmovsge	%icc,	%f14,	%f11
	fandnot1s	%f14,	%f11,	%f21
	fmovdl	%xcc,	%f12,	%f25
	edge16n	%o7,	%g4,	%i5
	edge16l	%i2,	%i1,	%o2
	fnot1	%f6,	%f26
	fmovrsgez	%o0,	%f15,	%f29
	edge16ln	%g1,	%l4,	%g2
	movne	%xcc,	%i3,	%l6
	movpos	%icc,	%l1,	%l5
	ldsh	[%l7 + 0x14],	%i6
	addccc	%o1,	0x13BE,	%i7
	fmovscc	%xcc,	%f7,	%f8
	srl	%l0,	0x0D,	%o6
	edge16ln	%l3,	%g3,	%g5
	stw	%g7,	[%l7 + 0x70]
	fmul8x16au	%f11,	%f30,	%f16
	subccc	%i4,	%o3,	%o4
	subccc	%g6,	0x0BC3,	%o5
	fmovdle	%icc,	%f7,	%f29
	movrgz	%l2,	%o7,	%g4
	faligndata	%f12,	%f28,	%f22
	alignaddrl	%i5,	%i0,	%i1
	sllx	%o2,	0x1E,	%i2
	movrgz	%g1,	%o0,	%l4
	srax	%g2,	0x0F,	%l6
	xnor	%i3,	0x196B,	%l1
	movn	%xcc,	%i6,	%o1
	sub	%l5,	%i7,	%l0
	addc	%l3,	0x17A0,	%g3
	ldx	[%l7 + 0x40],	%g5
	ldx	[%l7 + 0x70],	%o6
	edge16ln	%i4,	%g7,	%o4
	fmuld8sux16	%f11,	%f10,	%f22
	umul	%g6,	0x09DC,	%o5
	srax	%l2,	%o3,	%o7
	andn	%g4,	%i0,	%i5
	fcmple32	%f30,	%f20,	%i1
	or	%i2,	0x1E5D,	%o2
	save %o0, 0x152E, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%l4,	%g2
	fzero	%f10
	fzero	%f4
	edge16l	%i3,	%l1,	%i6
	addcc	%o1,	%l6,	%i7
	fone	%f28
	fcmple32	%f2,	%f30,	%l5
	fnot2	%f8,	%f22
	orncc	%l0,	%g3,	%g5
	fmovdleu	%icc,	%f15,	%f2
	mulscc	%o6,	0x18C1,	%i4
	stw	%g7,	[%l7 + 0x0C]
	movrgez	%l3,	%o4,	%g6
	edge16	%o5,	%l2,	%o3
	srax	%g4,	%o7,	%i0
	smulcc	%i5,	0x0494,	%i2
	umulcc	%o2,	%o0,	%i1
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	xorcc	%l1,	0x0C6B,	%i6
	orncc	%o1,	0x0E6D,	%l6
	xnor	%i7,	0x0163,	%l5
	sdiv	%i3,	0x1079,	%g3
	movne	%xcc,	%l0,	%g5
	edge32ln	%i4,	%g7,	%o6
	edge32	%o4,	%l3,	%g6
	mulscc	%o5,	0x1789,	%l2
	movcs	%xcc,	%o3,	%o7
	edge32l	%g4,	%i5,	%i2
	sir	0x0F60
	st	%f5,	[%l7 + 0x30]
	lduw	[%l7 + 0x44],	%i0
	smul	%o0,	%i1,	%o2
	fors	%f15,	%f15,	%f28
	movn	%icc,	%l4,	%g1
	edge8ln	%l1,	%i6,	%g2
	edge8l	%l6,	%o1,	%l5
	fmovdvc	%xcc,	%f5,	%f2
	mova	%xcc,	%i3,	%i7
	popc	%l0,	%g3
	edge32n	%g5,	%g7,	%i4
	xorcc	%o4,	0x0021,	%l3
	edge32	%o6,	%o5,	%g6
	subc	%l2,	0x136C,	%o7
	xorcc	%o3,	0x0D41,	%i5
	ldsh	[%l7 + 0x7C],	%g4
	movle	%icc,	%i2,	%o0
	fmovdg	%xcc,	%f12,	%f12
	movgu	%xcc,	%i0,	%o2
	movne	%icc,	%i1,	%g1
	mulscc	%l1,	%i6,	%g2
	movl	%xcc,	%l4,	%l6
	orncc	%o1,	%i3,	%l5
	srlx	%l0,	%g3,	%i7
	edge16l	%g5,	%g7,	%i4
	ldsb	[%l7 + 0x5E],	%o4
	sllx	%o6,	0x07,	%l3
	movleu	%icc,	%g6,	%o5
	sth	%l2,	[%l7 + 0x20]
	alignaddrl	%o3,	%i5,	%g4
	srax	%o7,	0x1A,	%i2
	fmovsn	%xcc,	%f23,	%f25
	ldx	[%l7 + 0x38],	%i0
	srl	%o0,	0x06,	%i1
	fcmpeq32	%f6,	%f4,	%g1
	fmovspos	%icc,	%f8,	%f29
	udiv	%l1,	0x084F,	%i6
	move	%xcc,	%o2,	%l4
	srlx	%g2,	0x1C,	%l6
	fexpand	%f14,	%f4
	add	%i3,	%l5,	%l0
	movvc	%xcc,	%g3,	%i7
	movg	%xcc,	%o1,	%g5
	fand	%f28,	%f10,	%f30
	xnor	%i4,	0x03B3,	%g7
	udivx	%o4,	0x1FDB,	%o6
	orcc	%l3,	0x010A,	%g6
	edge16	%o5,	%o3,	%l2
	popc	%g4,	%o7
	alignaddrl	%i5,	%i0,	%o0
	sllx	%i1,	%g1,	%l1
	stb	%i6,	[%l7 + 0x6C]
	srax	%o2,	0x06,	%l4
	save %i2, %g2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i3,	%l5,	%g3
	ld	[%l7 + 0x24],	%f18
	andncc	%l0,	%o1,	%g5
	lduh	[%l7 + 0x2E],	%i4
	mulscc	%g7,	%o4,	%i7
	movcs	%icc,	%o6,	%l3
	movrlz	%g6,	%o3,	%l2
	fmul8sux16	%f12,	%f18,	%f10
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%o5
	edge32ln	%g4,	%o7,	%i5
	addccc	%o0,	0x126D,	%i1
	and	%i0,	0x0797,	%g1
	xorcc	%i6,	%o2,	%l4
	movvc	%xcc,	%l1,	%g2
	addccc	%i2,	%l6,	%l5
	ld	[%l7 + 0x38],	%f6
	udivcc	%g3,	0x095D,	%i3
	movrlz	%l0,	0x14B,	%o1
	mova	%icc,	%i4,	%g7
	ld	[%l7 + 0x68],	%f12
	ld	[%l7 + 0x30],	%f26
	sllx	%g5,	%i7,	%o6
	sra	%l3,	%g6,	%o3
	fornot2s	%f27,	%f11,	%f29
	restore %o4, %l2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f14,	[%l7 + 0x18]
	orn	%o7,	0x0FFC,	%i5
	stw	%o0,	[%l7 + 0x14]
	smul	%i1,	0x0506,	%i0
	save %o5, 0x0AFF, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%o2,	%f22,	%f2
	xnorcc	%i6,	0x0918,	%l1
	edge8n	%l4,	%i2,	%g2
	fmovse	%xcc,	%f11,	%f30
	sll	%l6,	%l5,	%g3
	fmovsa	%xcc,	%f22,	%f9
	movrlz	%i3,	0x063,	%l0
	umul	%i4,	%g7,	%o1
	ldd	[%l7 + 0x70],	%f8
	alignaddrl	%g5,	%i7,	%o6
	fmovsne	%xcc,	%f24,	%f26
	ld	[%l7 + 0x50],	%f21
	fcmps	%fcc2,	%f12,	%f31
	ldsb	[%l7 + 0x32],	%l3
	add	%g6,	%o4,	%o3
	nop
	set	0x56, %o6
	ldsb	[%l7 + %o6],	%g4
	edge32n	%l2,	%i5,	%o7
	movre	%o0,	0x18D,	%i1
	movle	%icc,	%o5,	%i0
	subc	%o2,	0x1478,	%i6
	fone	%f20
	fabss	%f27,	%f20
	edge32	%l1,	%g1,	%l4
	add	%i2,	%l6,	%l5
	movrgez	%g2,	%i3,	%l0
	udivx	%i4,	0x0872,	%g7
	fcmps	%fcc1,	%f19,	%f0
	sub	%o1,	%g5,	%i7
	srax	%o6,	0x0A,	%g3
	movne	%icc,	%g6,	%o4
	popc	%l3,	%o3
	std	%f10,	[%l7 + 0x40]
	addccc	%g4,	0x09BB,	%l2
	add	%i5,	%o0,	%o7
	movge	%xcc,	%i1,	%i0
	ld	[%l7 + 0x48],	%f31
	movleu	%icc,	%o2,	%i6
	udivcc	%o5,	0x12BF,	%g1
	subc	%l4,	%i2,	%l1
	move	%icc,	%l5,	%g2
	fmovda	%xcc,	%f11,	%f10
	srlx	%i3,	0x03,	%l0
	fcmpne32	%f0,	%f0,	%l6
	movleu	%xcc,	%g7,	%i4
	andcc	%g5,	%i7,	%o1
	fmovrdne	%o6,	%f22,	%f26
	fmul8x16al	%f28,	%f19,	%f10
	ldsh	[%l7 + 0x6E],	%g6
	ldx	[%l7 + 0x30],	%g3
	sdiv	%l3,	0x16E9,	%o4
	fmovrdne	%o3,	%f10,	%f24
	fcmpne16	%f24,	%f28,	%l2
	lduh	[%l7 + 0x50],	%g4
	ldsw	[%l7 + 0x50],	%o0
	ldsb	[%l7 + 0x6D],	%i5
	movleu	%icc,	%o7,	%i1
	sllx	%o2,	%i6,	%o5
	fornot1s	%f11,	%f25,	%f22
	ldx	[%l7 + 0x60],	%g1
	umul	%i0,	%l4,	%l1
	fcmple32	%f14,	%f22,	%l5
	fmovdcs	%xcc,	%f28,	%f21
	orncc	%i2,	%g2,	%l0
	ldsw	[%l7 + 0x6C],	%i3
	ldsh	[%l7 + 0x72],	%l6
	edge16n	%g7,	%i4,	%i7
	srax	%g5,	%o6,	%g6
	stw	%g3,	[%l7 + 0x10]
	fmovsl	%icc,	%f2,	%f9
	stb	%l3,	[%l7 + 0x28]
	orncc	%o1,	%o3,	%o4
	fmovscs	%icc,	%f5,	%f3
	fpack16	%f14,	%f19
	movge	%icc,	%g4,	%l2
	orcc	%o0,	0x1BF6,	%o7
	movrlz	%i5,	0x0BA,	%o2
	edge8ln	%i6,	%o5,	%i1
	srax	%i0,	%l4,	%l1
	movge	%icc,	%l5,	%i2
	mulscc	%g2,	0x0D51,	%g1
	st	%f12,	[%l7 + 0x60]
	movn	%xcc,	%i3,	%l6
	popc	0x1BE6,	%g7
	srl	%l0,	0x04,	%i4
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	sir	0x1C66
	fcmpgt16	%f18,	%f2,	%g6
	movg	%xcc,	%g3,	%o1
	ldd	[%l7 + 0x60],	%o2
	fmovsgu	%icc,	%f13,	%f23
	udiv	%l3,	0x19F0,	%g4
	ldsw	[%l7 + 0x34],	%l2
	lduw	[%l7 + 0x20],	%o0
	movl	%xcc,	%o4,	%o7
	array16	%i5,	%o2,	%i6
	fmovrdgez	%i1,	%f30,	%f28
	movne	%xcc,	%i0,	%o5
	subccc	%l1,	0x0BCF,	%l5
	smul	%l4,	0x0136,	%i2
	ld	[%l7 + 0x3C],	%f30
	mova	%xcc,	%g2,	%i3
	srax	%g1,	0x1E,	%g7
	xnorcc	%l0,	%l6,	%i7
	xnorcc	%o6,	0x1497,	%i4
	sll	%g5,	%g6,	%o1
	array32	%g3,	%l3,	%o3
	stw	%l2,	[%l7 + 0x7C]
	fmul8ulx16	%f6,	%f14,	%f28
	xorcc	%g4,	0x0F33,	%o4
	mulx	%o0,	0x1817,	%i5
	array16	%o7,	%i6,	%o2
	fcmple16	%f18,	%f2,	%i0
	sth	%i1,	[%l7 + 0x5E]
	smul	%l1,	0x1819,	%o5
	st	%f19,	[%l7 + 0x10]
	addccc	%l5,	0x05D0,	%l4
	mova	%xcc,	%i2,	%g2
	edge16	%i3,	%g1,	%g7
	edge16n	%l6,	%l0,	%i7
	sth	%o6,	[%l7 + 0x44]
	edge32	%g5,	%i4,	%o1
	fmul8x16al	%f31,	%f10,	%f26
	fmovsleu	%icc,	%f11,	%f20
	array32	%g6,	%l3,	%o3
	move	%xcc,	%g3,	%l2
	smul	%g4,	0x1BD6,	%o0
	andcc	%i5,	%o4,	%o7
	alignaddr	%o2,	%i0,	%i1
	edge32ln	%l1,	%i6,	%o5
	movle	%icc,	%l4,	%l5
	fmovrsgz	%i2,	%f25,	%f19
	fmovrdne	%i3,	%f12,	%f14
	std	%f4,	[%l7 + 0x68]
	edge32ln	%g2,	%g1,	%l6
	fmovsne	%icc,	%f11,	%f30
	and	%g7,	0x06BD,	%l0
	fnot2	%f12,	%f22
	movrlez	%i7,	%g5,	%o6
	fmovdl	%icc,	%f12,	%f23
	movn	%icc,	%i4,	%o1
	movneg	%xcc,	%g6,	%l3
	movrlz	%o3,	%g3,	%g4
	edge8ln	%o0,	%i5,	%l2
	array8	%o7,	%o2,	%i0
	udivcc	%i1,	0x1F47,	%o4
	movle	%xcc,	%i6,	%o5
	orncc	%l1,	%l4,	%l5
	ldd	[%l7 + 0x20],	%f12
	mulx	%i2,	0x0690,	%i3
	edge16l	%g1,	%l6,	%g7
	move	%icc,	%l0,	%i7
	edge8ln	%g5,	%g2,	%i4
	ldd	[%l7 + 0x20],	%o0
	sdiv	%g6,	0x1CB9,	%l3
	mulscc	%o3,	0x130D,	%g3
	srax	%g4,	%o0,	%o6
	fmovrdgz	%l2,	%f0,	%f8
	subcc	%i5,	0x0EC6,	%o2
	ldsb	[%l7 + 0x1F],	%i0
	sdivcc	%i1,	0x0BDD,	%o7
	edge16n	%o4,	%o5,	%i6
	addcc	%l1,	%l4,	%l5
	movcc	%xcc,	%i2,	%i3
	fmovsne	%xcc,	%f1,	%f7
	smul	%g1,	%l6,	%l0
	fcmpeq16	%f14,	%f30,	%i7
	stx	%g7,	[%l7 + 0x70]
	fabss	%f10,	%f18
	fnot2s	%f0,	%f5
	smulcc	%g5,	%i4,	%g2
	array8	%o1,	%l3,	%g6
	mulscc	%o3,	0x045B,	%g3
	ldsb	[%l7 + 0x6A],	%o0
	and	%o6,	0x1EA5,	%l2
	andn	%i5,	%g4,	%i0
	udivcc	%o2,	0x1DF6,	%i1
	edge32	%o4,	%o5,	%o7
	stw	%l1,	[%l7 + 0x24]
	xor	%i6,	0x09D0,	%l5
	edge32n	%i2,	%i3,	%g1
	xnorcc	%l4,	%l6,	%i7
	xnor	%l0,	0x0329,	%g5
	umulcc	%i4,	0x17F3,	%g2
	xnorcc	%g7,	%o1,	%g6
	nop
	set	0x0C, %l0
	ldsw	[%l7 + %l0],	%l3
	fmovrsgz	%g3,	%f7,	%f29
	xorcc	%o3,	%o6,	%o0
	array8	%l2,	%g4,	%i0
	smul	%i5,	0x0D1C,	%i1
	fcmpeq16	%f16,	%f10,	%o2
	smul	%o5,	%o7,	%l1
	mova	%icc,	%i6,	%o4
	lduh	[%l7 + 0x46],	%i2
	subccc	%l5,	%g1,	%l4
	ldsh	[%l7 + 0x2C],	%i3
	movcs	%xcc,	%l6,	%l0
	movn	%xcc,	%i7,	%i4
	movrne	%g5,	0x04E,	%g7
	fmul8sux16	%f10,	%f14,	%f14
	mulscc	%g2,	%o1,	%l3
	movvs	%xcc,	%g6,	%g3
	orncc	%o6,	%o0,	%o3
	ld	[%l7 + 0x14],	%f28
	movrgez	%g4,	%i0,	%i5
	subc	%i1,	0x1F39,	%o2
	st	%f31,	[%l7 + 0x74]
	movne	%icc,	%o5,	%l2
	array32	%l1,	%o7,	%i6
	ldsw	[%l7 + 0x58],	%i2
	restore %o4, %g1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i3,	%l5,	%l0
	edge8n	%l6,	%i7,	%i4
	movgu	%icc,	%g7,	%g2
	stx	%o1,	[%l7 + 0x10]
	subc	%g5,	0x0764,	%g6
	fcmped	%fcc0,	%f2,	%f8
	st	%f18,	[%l7 + 0x18]
	fcmpeq16	%f12,	%f10,	%l3
	movrlz	%g3,	%o0,	%o3
	edge16ln	%g4,	%i0,	%i5
	mova	%icc,	%o6,	%i1
	faligndata	%f2,	%f6,	%f18
	stw	%o2,	[%l7 + 0x58]
	fmovspos	%icc,	%f4,	%f20
	ldd	[%l7 + 0x50],	%f4
	edge8	%l2,	%o5,	%o7
	popc	0x0600,	%i6
	movvc	%icc,	%i2,	%l1
	stw	%g1,	[%l7 + 0x7C]
	edge32n	%o4,	%i3,	%l5
	sllx	%l4,	0x07,	%l6
	movrlz	%l0,	0x377,	%i4
	st	%f7,	[%l7 + 0x44]
	std	%f20,	[%l7 + 0x60]
	fmovde	%xcc,	%f17,	%f26
	move	%icc,	%g7,	%g2
	ldsw	[%l7 + 0x28],	%o1
	fcmpes	%fcc1,	%f4,	%f30
	fmovspos	%icc,	%f13,	%f22
	fmovrdgz	%i7,	%f12,	%f6
	fpsub16	%f4,	%f0,	%f18
	ldsw	[%l7 + 0x34],	%g6
	movrgez	%l3,	0x059,	%g5
	lduh	[%l7 + 0x50],	%o0
	fpsub32s	%f22,	%f5,	%f15
	xor	%o3,	%g3,	%g4
	stw	%i0,	[%l7 + 0x18]
	ldx	[%l7 + 0x30],	%i5
	movrlz	%o6,	%o2,	%l2
	movne	%xcc,	%i1,	%o7
	mulx	%o5,	0x0349,	%i2
	add	%l1,	%g1,	%o4
	ldx	[%l7 + 0x50],	%i3
	lduw	[%l7 + 0x54],	%i6
	stb	%l5,	[%l7 + 0x76]
	fmovdleu	%icc,	%f16,	%f23
	orn	%l4,	0x13B1,	%l0
	sllx	%i4,	0x1D,	%l6
	fmul8x16al	%f0,	%f13,	%f14
	movrgz	%g7,	0x23C,	%g2
	ldsh	[%l7 + 0x66],	%o1
	fcmped	%fcc0,	%f16,	%f30
	fmovrde	%i7,	%f2,	%f8
	fandnot2	%f26,	%f24,	%f2
	orncc	%l3,	0x19DC,	%g6
	srl	%g5,	0x05,	%o0
	edge32n	%g3,	%g4,	%i0
	edge32ln	%o3,	%o6,	%i5
	addcc	%o2,	0x08CB,	%l2
	umul	%i1,	%o7,	%o5
	ldd	[%l7 + 0x58],	%i2
	alignaddr	%l1,	%o4,	%g1
	smulcc	%i6,	0x0D35,	%l5
	movgu	%icc,	%i3,	%l0
	fmovdneg	%xcc,	%f12,	%f1
	fnands	%f9,	%f10,	%f13
	mulx	%l4,	0x12CD,	%i4
	edge16	%g7,	%g2,	%l6
	subcc	%o1,	%l3,	%g6
	fmovdneg	%icc,	%f16,	%f28
	fmovrse	%g5,	%f29,	%f15
	sra	%o0,	0x0D,	%i7
	mova	%icc,	%g4,	%g3
	pdist	%f4,	%f0,	%f28
	nop
	set	0x62, %i2
	ldsb	[%l7 + %i2],	%o3
	std	%f18,	[%l7 + 0x70]
	smulcc	%i0,	0x0896,	%o6
	addcc	%i5,	0x01BA,	%o2
	ldd	[%l7 + 0x40],	%f8
	udivcc	%l2,	0x0DA6,	%i1
	subc	%o7,	%o5,	%l1
	fmovdleu	%xcc,	%f7,	%f25
	edge32n	%i2,	%g1,	%i6
	alignaddrl	%o4,	%l5,	%i3
	fnegd	%f2,	%f6
	fpadd32s	%f24,	%f29,	%f9
	movne	%xcc,	%l4,	%l0
	ld	[%l7 + 0x74],	%f11
	movrlz	%g7,	%i4,	%l6
	fmovrdgz	%o1,	%f22,	%f14
	fcmpne16	%f28,	%f22,	%l3
	edge8	%g2,	%g6,	%o0
	srl	%g5,	0x13,	%g4
	sdiv	%g3,	0x02F3,	%i7
	edge16ln	%o3,	%o6,	%i5
	stb	%i0,	[%l7 + 0x1C]
	ldsh	[%l7 + 0x7E],	%l2
	array16	%i1,	%o2,	%o5
	fcmpgt16	%f20,	%f2,	%o7
	stb	%i2,	[%l7 + 0x4B]
	edge8ln	%g1,	%i6,	%o4
	sra	%l1,	%i3,	%l4
	edge8n	%l0,	%l5,	%i4
	andncc	%l6,	%o1,	%g7
	srl	%g2,	0x11,	%g6
	save %l3, 0x0526, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g4,	%o0,	%i7
	and	%g3,	0x1BF8,	%o3
	fmovdg	%icc,	%f22,	%f13
	srax	%o6,	%i5,	%l2
	popc	0x0F41,	%i0
	fxnors	%f30,	%f18,	%f20
	fmovrdne	%i1,	%f24,	%f10
	ldub	[%l7 + 0x4C],	%o5
	fnot2	%f2,	%f6
	xnor	%o7,	%o2,	%i2
	alignaddr	%i6,	%o4,	%g1
	fmuld8ulx16	%f1,	%f30,	%f8
	xnor	%l1,	0x0513,	%i3
	sdivcc	%l4,	0x124E,	%l0
	sdiv	%l5,	0x040D,	%i4
	fcmple32	%f10,	%f16,	%l6
	fmovrdgez	%g7,	%f26,	%f18
	ld	[%l7 + 0x18],	%f23
	edge16ln	%g2,	%o1,	%l3
	fnot1s	%f18,	%f22
	xor	%g5,	0x1E76,	%g6
	st	%f11,	[%l7 + 0x34]
	fpackfix	%f14,	%f0
	fmovsge	%icc,	%f26,	%f16
	ldub	[%l7 + 0x74],	%g4
	andcc	%i7,	0x158A,	%g3
	save %o3, 0x05EB, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o0,	%l2,	%i5
	edge8	%i0,	%o5,	%i1
	fsrc2s	%f11,	%f19
	xorcc	%o7,	%o2,	%i2
	stb	%o4,	[%l7 + 0x5C]
	fmovsgu	%xcc,	%f26,	%f30
	edge32n	%g1,	%i6,	%i3
	udivcc	%l1,	0x14FF,	%l4
	sth	%l0,	[%l7 + 0x5C]
	movre	%l5,	%l6,	%g7
	or	%i4,	0x1626,	%o1
	sdivcc	%l3,	0x0FB0,	%g5
	and	%g6,	0x18B7,	%g4
	udivcc	%i7,	0x0CDE,	%g3
	fcmpeq16	%f2,	%f28,	%g2
	stw	%o3,	[%l7 + 0x4C]
	movle	%xcc,	%o0,	%o6
	mulx	%l2,	%i0,	%i5
	stb	%i1,	[%l7 + 0x14]
	nop
	set	0x5E, %o3
	sth	%o7,	[%l7 + %o3]
	ldx	[%l7 + 0x08],	%o2
	fands	%f19,	%f2,	%f13
	fmovdleu	%xcc,	%f25,	%f3
	xnor	%o5,	%i2,	%o4
	sllx	%g1,	0x0A,	%i6
	andn	%l1,	0x0DB0,	%l4
	edge32n	%l0,	%l5,	%l6
	fcmpne32	%f8,	%f18,	%i3
	fmovsn	%xcc,	%f7,	%f9
	umul	%i4,	%o1,	%l3
	fornot2s	%f30,	%f12,	%f13
	ldd	[%l7 + 0x38],	%f18
	fpsub32s	%f4,	%f3,	%f14
	movcc	%xcc,	%g7,	%g6
	for	%f0,	%f30,	%f24
	ldd	[%l7 + 0x60],	%g4
	fmovrde	%i7,	%f10,	%f28
	addc	%g5,	0x10CF,	%g2
	fsrc1s	%f9,	%f11
	fmovde	%icc,	%f5,	%f24
	edge32	%o3,	%g3,	%o0
	ldsh	[%l7 + 0x26],	%l2
	nop
	set	0x18, %g2
	stw	%i0,	[%l7 + %g2]
	movne	%icc,	%i5,	%i1
	fmovscc	%xcc,	%f24,	%f23
	array8	%o7,	%o2,	%o6
	nop
	set	0x70, %o7
	stw	%o5,	[%l7 + %o7]
	fmovdcc	%xcc,	%f23,	%f22
	movrgez	%o4,	0x162,	%i2
	sra	%i6,	%g1,	%l4
	movvc	%icc,	%l1,	%l5
	array8	%l6,	%l0,	%i4
	fandnot2s	%f16,	%f11,	%f11
	fmovd	%f20,	%f4
	edge16	%o1,	%i3,	%l3
	movle	%icc,	%g7,	%g6
	lduw	[%l7 + 0x28],	%g4
	udivx	%g5,	0x131F,	%i7
	movrgez	%g2,	%g3,	%o3
	movgu	%xcc,	%o0,	%l2
	udivcc	%i5,	0x03B4,	%i1
	movle	%icc,	%o7,	%i0
	fmovrdgz	%o6,	%f12,	%f12
	mova	%icc,	%o5,	%o4
	edge16n	%o2,	%i6,	%i2
	srl	%g1,	0x0D,	%l1
	alignaddrl	%l5,	%l6,	%l4
	subcc	%i4,	0x120C,	%l0
	array16	%i3,	%o1,	%g7
	udivx	%l3,	0x1DD4,	%g6
	movgu	%icc,	%g4,	%g5
	edge16	%g2,	%i7,	%o3
	alignaddrl	%o0,	%l2,	%g3
	movne	%xcc,	%i5,	%o7
	smul	%i1,	%i0,	%o6
	fmovdl	%xcc,	%f25,	%f1
	movrlez	%o5,	%o2,	%o4
	srlx	%i2,	0x0D,	%g1
	movcs	%xcc,	%l1,	%i6
	movg	%icc,	%l6,	%l5
	fsrc1	%f28,	%f10
	fcmple32	%f20,	%f6,	%i4
	fcmpeq32	%f0,	%f22,	%l0
	xnorcc	%i3,	%l4,	%g7
	movge	%xcc,	%l3,	%o1
	addccc	%g6,	%g5,	%g2
	stw	%i7,	[%l7 + 0x24]
	edge16ln	%o3,	%o0,	%l2
	subcc	%g4,	%g3,	%o7
	fmovdgu	%icc,	%f10,	%f14
	srax	%i1,	%i0,	%o6
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	edge16ln	%i5,	%i2,	%l1
	andncc	%g1,	%l6,	%l5
	lduh	[%l7 + 0x50],	%i4
	fmovdge	%xcc,	%f10,	%f30
	std	%f16,	[%l7 + 0x70]
	fmovsn	%icc,	%f18,	%f11
	srl	%i6,	%i3,	%l4
	xor	%l0,	%l3,	%o1
	sdivx	%g6,	0x13F1,	%g5
	srlx	%g7,	0x04,	%g2
	movrlez	%o3,	%o0,	%i7
	fsrc1	%f26,	%f4
	array16	%l2,	%g3,	%o7
	movn	%xcc,	%i1,	%i0
	addccc	%o6,	0x1637,	%o5
	alignaddrl	%g4,	%o2,	%i5
	fmovrsgez	%o4,	%f4,	%f28
	movvs	%icc,	%l1,	%i2
	fmovse	%icc,	%f5,	%f3
	srax	%g1,	%l5,	%i4
	fmovdvs	%xcc,	%f12,	%f24
	stx	%l6,	[%l7 + 0x48]
	fcmps	%fcc0,	%f26,	%f25
	edge16	%i6,	%l4,	%i3
	movvs	%xcc,	%l0,	%l3
	subccc	%o1,	%g6,	%g7
	ldd	[%l7 + 0x40],	%f20
	movrlz	%g5,	0x316,	%g2
	srax	%o3,	0x0A,	%i7
	ldsb	[%l7 + 0x47],	%o0
	edge32	%l2,	%g3,	%o7
	sub	%i0,	0x0470,	%o6
	udiv	%i1,	0x01AA,	%g4
	restore %o2, %i5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l1,	%o5,	%i2
	movrgez	%l5,	%i4,	%l6
	sdiv	%g1,	0x15F9,	%i6
	sth	%l4,	[%l7 + 0x44]
	fmovsneg	%xcc,	%f2,	%f1
	sdiv	%i3,	0x0554,	%l3
	movgu	%icc,	%l0,	%o1
	sir	0x01EA
	ld	[%l7 + 0x34],	%f23
	mulx	%g6,	%g5,	%g2
	movne	%xcc,	%o3,	%g7
	umul	%i7,	%o0,	%l2
	edge8ln	%g3,	%o7,	%o6
	sethi	0x0106,	%i0
	fone	%f4
	srl	%g4,	%o2,	%i1
	fmul8x16al	%f1,	%f27,	%f22
	movne	%icc,	%i5,	%o4
	edge16	%l1,	%i2,	%l5
	fmul8sux16	%f20,	%f6,	%f28
	movcs	%xcc,	%i4,	%o5
	movcs	%icc,	%g1,	%i6
	umul	%l6,	0x1D24,	%i3
	std	%f24,	[%l7 + 0x78]
	xnorcc	%l4,	0x0ABA,	%l3
	fmovrdlez	%l0,	%f4,	%f6
	edge32ln	%g6,	%o1,	%g5
	srax	%g2,	0x0D,	%o3
	and	%i7,	%o0,	%g7
	orncc	%g3,	%l2,	%o7
	fandnot1s	%f19,	%f31,	%f1
	sth	%i0,	[%l7 + 0x56]
	std	%f2,	[%l7 + 0x70]
	orncc	%g4,	0x1688,	%o2
	pdist	%f26,	%f12,	%f22
	fmovrse	%o6,	%f22,	%f0
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%i5
	sir	0x0242
	sub	%o4,	0x19FC,	%l1
	mova	%xcc,	%i2,	%i1
	edge32l	%i4,	%l5,	%g1
	fmovsleu	%xcc,	%f0,	%f19
	udiv	%i6,	0x1E99,	%o5
	edge16	%l6,	%i3,	%l4
	edge8ln	%l3,	%l0,	%o1
	sir	0x0282
	xor	%g6,	0x0A80,	%g2
	ldx	[%l7 + 0x20],	%g5
	sethi	0x1B83,	%o3
	and	%o0,	0x1C2F,	%i7
	ldub	[%l7 + 0x72],	%g7
	edge16l	%l2,	%o7,	%g3
	fcmpes	%fcc3,	%f28,	%f11
	fmovdg	%xcc,	%f5,	%f7
	edge8	%i0,	%o2,	%g4
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%i5
	smul	%o4,	0x0086,	%o6
	fmovsvc	%xcc,	%f2,	%f25
	movvc	%icc,	%i2,	%l1
	movneg	%icc,	%i1,	%i4
	popc	0x0A79,	%g1
	movne	%xcc,	%l5,	%o5
	ldub	[%l7 + 0x4D],	%i6
	st	%f30,	[%l7 + 0x7C]
	edge8n	%l6,	%i3,	%l4
	sir	0x0C81
	sdivcc	%l3,	0x1038,	%l0
	fmovdgu	%xcc,	%f27,	%f29
	xor	%o1,	0x1A95,	%g6
	sll	%g2,	%o3,	%o0
	udiv	%i7,	0x1359,	%g5
	alignaddr	%l2,	%o7,	%g3
	umulcc	%i0,	%o2,	%g4
	xnor	%g7,	%o4,	%o6
	movge	%xcc,	%i2,	%l1
	save %i5, 0x0610, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f6
	fpadd16s	%f24,	%f18,	%f0
	edge8l	%g1,	%i1,	%o5
	move	%xcc,	%l5,	%l6
	fmul8sux16	%f24,	%f14,	%f30
	movrlz	%i6,	0x17A,	%i3
	sir	0x14FF
	subccc	%l4,	0x0D4B,	%l0
	ldsh	[%l7 + 0x58],	%o1
	ldd	[%l7 + 0x70],	%l2
	mulx	%g2,	%g6,	%o0
	edge16	%o3,	%i7,	%g5
	alignaddrl	%o7,	%g3,	%i0
	fpack32	%f24,	%f16,	%f26
	movrgez	%o2,	0x1A8,	%g4
	xnor	%l2,	0x13FA,	%o4
	umul	%o6,	%i2,	%l1
	fnors	%f28,	%f8,	%f22
	fmovsl	%icc,	%f13,	%f5
	edge32ln	%g7,	%i5,	%i4
	ldd	[%l7 + 0x70],	%g0
	andn	%o5,	0x149D,	%l5
	movne	%icc,	%l6,	%i6
	movneg	%xcc,	%i3,	%l4
	subcc	%i1,	%o1,	%l0
	fcmpd	%fcc2,	%f20,	%f18
	orcc	%g2,	0x14FC,	%g6
	fmovrdlez	%o0,	%f2,	%f12
	movrlez	%o3,	%l3,	%g5
	array8	%o7,	%i7,	%i0
	move	%icc,	%o2,	%g3
	std	%f26,	[%l7 + 0x28]
	ldsb	[%l7 + 0x17],	%l2
	edge16ln	%g4,	%o4,	%o6
	lduh	[%l7 + 0x6A],	%l1
	edge8	%i2,	%g7,	%i4
	movl	%icc,	%i5,	%g1
	fmovdneg	%xcc,	%f31,	%f19
	or	%o5,	0x1CB0,	%l5
	fnand	%f26,	%f14,	%f22
	movre	%l6,	%i6,	%l4
	andn	%i3,	0x0222,	%i1
	lduw	[%l7 + 0x2C],	%l0
	nop
	set	0x55, %o0
	ldsb	[%l7 + %o0],	%o1
	addc	%g6,	%o0,	%o3
	movvc	%xcc,	%l3,	%g5
	smul	%g2,	0x0B8E,	%o7
	std	%f12,	[%l7 + 0x20]
	movrgz	%i7,	0x2CF,	%i0
	ldd	[%l7 + 0x18],	%f10
	fmovrdgez	%g3,	%f24,	%f30
	fsrc1s	%f0,	%f20
	andcc	%l2,	%o2,	%g4
	movleu	%icc,	%o4,	%l1
	lduw	[%l7 + 0x28],	%o6
	movge	%icc,	%i2,	%g7
	ldub	[%l7 + 0x0A],	%i5
	fcmple16	%f2,	%f18,	%i4
	fandnot2s	%f6,	%f1,	%f12
	subcc	%o5,	0x06EF,	%l5
	mulx	%l6,	%g1,	%i6
	srl	%l4,	%i1,	%l0
	umulcc	%i3,	%g6,	%o1
	sllx	%o0,	%o3,	%g5
	stb	%l3,	[%l7 + 0x7E]
	orn	%g2,	0x10D5,	%o7
	sra	%i7,	0x1A,	%g3
	srlx	%i0,	%o2,	%l2
	edge8l	%o4,	%g4,	%l1
	alignaddr	%i2,	%g7,	%o6
	fandnot2s	%f25,	%f9,	%f28
	addcc	%i4,	0x04AB,	%o5
	xorcc	%i5,	%l5,	%g1
	ldx	[%l7 + 0x38],	%i6
	movge	%xcc,	%l4,	%l6
	fmovrdgez	%i1,	%f24,	%f8
	movrlez	%l0,	%g6,	%o1
	fmovrde	%i3,	%f18,	%f14
	st	%f3,	[%l7 + 0x48]
	or	%o0,	%o3,	%g5
	addccc	%g2,	%l3,	%i7
	sth	%o7,	[%l7 + 0x60]
	fmovrsgez	%i0,	%f22,	%f7
	ldsb	[%l7 + 0x1F],	%g3
	mulscc	%o2,	%o4,	%l2
	edge8	%l1,	%i2,	%g4
	fmovscs	%xcc,	%f1,	%f29
	fmovrse	%g7,	%f5,	%f12
	mulscc	%o6,	0x177B,	%o5
	sllx	%i5,	0x00,	%l5
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	srl	%l6,	%l4,	%i1
	fands	%f14,	%f13,	%f18
	fsrc2	%f16,	%f2
	fmul8x16au	%f19,	%f21,	%f22
	move	%icc,	%l0,	%g6
	alignaddrl	%o1,	%o0,	%i3
	smulcc	%g5,	0x04DF,	%g2
	srax	%o3,	%l3,	%i7
	stw	%i0,	[%l7 + 0x30]
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%g2
	andn	%o2,	0x035B,	%o7
	movre	%o4,	%l2,	%l1
	fpmerge	%f20,	%f19,	%f16
	mulx	%i2,	0x1157,	%g7
	or	%o6,	0x0F28,	%g4
	xnorcc	%i5,	%l5,	%g1
	mulscc	%i4,	0x1DAD,	%i6
	ldsw	[%l7 + 0x20],	%o5
	edge32	%l6,	%l4,	%l0
	fmul8x16al	%f29,	%f18,	%f10
	movge	%icc,	%g6,	%o1
	fpsub32s	%f3,	%f26,	%f16
	udivx	%i1,	0x1E77,	%o0
	umul	%g5,	0x14A5,	%i3
	movre	%o3,	%g2,	%i7
	movre	%l3,	0x1F0,	%i0
	smul	%o2,	0x140C,	%o7
	smulcc	%g3,	%o4,	%l1
	movre	%i2,	%l2,	%g7
	smulcc	%g4,	%o6,	%l5
	fxor	%f10,	%f22,	%f4
	movcs	%icc,	%i5,	%i4
	edge16ln	%i6,	%g1,	%o5
	smul	%l6,	0x1052,	%l4
	orncc	%g6,	%l0,	%i1
	edge8	%o0,	%o1,	%g5
	st	%f13,	[%l7 + 0x5C]
	restore %i3, 0x0E11, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f9,	%f3
	edge32l	%i7,	%l3,	%i0
	sir	0x1897
	std	%f6,	[%l7 + 0x40]
	mova	%xcc,	%o3,	%o2
	fxnors	%f9,	%f18,	%f24
	popc	%g3,	%o4
	edge8l	%l1,	%o7,	%l2
	fmovsge	%icc,	%f4,	%f3
	fnot1s	%f27,	%f15
	movle	%xcc,	%g7,	%g4
	andcc	%i2,	%l5,	%i5
	udivcc	%o6,	0x04DC,	%i6
	movg	%xcc,	%g1,	%o5
	movrlez	%i4,	0x3BA,	%l6
	mulx	%g6,	%l4,	%l0
	move	%icc,	%o0,	%i1
	sth	%o1,	[%l7 + 0x12]
	fnands	%f5,	%f17,	%f2
	fandnot2s	%f11,	%f24,	%f26
	array16	%i3,	%g5,	%i7
	fmul8x16	%f4,	%f22,	%f26
	fmul8sux16	%f10,	%f0,	%f26
	movrgez	%l3,	0x2B9,	%g2
	movcs	%icc,	%o3,	%o2
	srax	%g3,	%o4,	%i0
	orncc	%o7,	%l2,	%l1
	alignaddr	%g4,	%i2,	%g7
	fnor	%f2,	%f16,	%f18
	xor	%i5,	0x1CDD,	%o6
	lduw	[%l7 + 0x40],	%i6
	fmovsg	%xcc,	%f12,	%f27
	alignaddr	%l5,	%o5,	%i4
	stx	%g1,	[%l7 + 0x38]
	movn	%xcc,	%g6,	%l6
	lduw	[%l7 + 0x6C],	%l4
	smulcc	%o0,	%i1,	%o1
	movrlez	%i3,	%l0,	%i7
	fornot2	%f4,	%f28,	%f18
	fmul8x16al	%f13,	%f22,	%f24
	stw	%g5,	[%l7 + 0x64]
	xor	%g2,	0x196C,	%o3
	ldsb	[%l7 + 0x62],	%o2
	sdivcc	%l3,	0x1018,	%g3
	edge16	%i0,	%o4,	%o7
	popc	0x1C13,	%l2
	ldsb	[%l7 + 0x6D],	%g4
	subccc	%i2,	%g7,	%i5
	fands	%f14,	%f13,	%f23
	fmovrdne	%o6,	%f12,	%f30
	sdivx	%l1,	0x0CAF,	%l5
	alignaddrl	%i6,	%i4,	%o5
	orn	%g1,	%l6,	%l4
	array8	%o0,	%g6,	%i1
	movcc	%xcc,	%i3,	%l0
	st	%f2,	[%l7 + 0x28]
	movle	%icc,	%o1,	%i7
	umulcc	%g2,	0x10B7,	%g5
	fandnot1s	%f4,	%f19,	%f21
	movn	%icc,	%o2,	%l3
	fpsub32	%f2,	%f4,	%f2
	movcs	%xcc,	%o3,	%g3
	fmovdcs	%icc,	%f12,	%f15
	umul	%i0,	0x1070,	%o7
	fmovrsgez	%o4,	%f30,	%f13
	edge8ln	%l2,	%i2,	%g7
	fmovrdgz	%g4,	%f16,	%f18
	udivx	%o6,	0x04E0,	%l1
	movrlez	%i5,	0x3D9,	%i6
	addc	%l5,	%o5,	%g1
	edge32	%i4,	%l6,	%l4
	xorcc	%o0,	%g6,	%i3
	movvc	%icc,	%l0,	%o1
	lduh	[%l7 + 0x58],	%i7
	andn	%i1,	0x1884,	%g2
	lduw	[%l7 + 0x18],	%g5
	orn	%l3,	0x024C,	%o3
	addccc	%o2,	%i0,	%o7
	sra	%g3,	0x07,	%l2
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	nop
	set	0x50, %o5
	stw	%g7,	[%l7 + %o5]
	array8	%o6,	%g4,	%l1
	array16	%i6,	%i5,	%o5
	fexpand	%f9,	%f18
	edge16l	%l5,	%i4,	%g1
	fzero	%f18
	movcs	%xcc,	%l4,	%l6
	movge	%xcc,	%g6,	%o0
	edge16l	%l0,	%i3,	%o1
	xnorcc	%i1,	0x196D,	%g2
	xnor	%g5,	%l3,	%o3
	fpadd16s	%f6,	%f14,	%f27
	lduw	[%l7 + 0x68],	%i7
	smul	%o2,	%o7,	%i0
	smul	%l2,	0x1FB3,	%o4
	edge8	%g3,	%g7,	%i2
	popc	%g4,	%o6
	movne	%xcc,	%l1,	%i6
	fnot2s	%f19,	%f21
	fmovdpos	%xcc,	%f15,	%f11
	movrne	%o5,	%i5,	%l5
	edge16ln	%i4,	%l4,	%g1
	andcc	%l6,	0x0E88,	%g6
	fsrc1	%f28,	%f16
	movcc	%icc,	%l0,	%i3
	sdivcc	%o0,	0x0D10,	%o1
	orcc	%i1,	0x17C1,	%g2
	orncc	%g5,	0x0E35,	%l3
	subcc	%o3,	%o2,	%o7
	fandnot1s	%f0,	%f27,	%f18
	fornot2	%f20,	%f18,	%f18
	edge8l	%i0,	%l2,	%i7
	and	%o4,	0x11EE,	%g3
	movge	%xcc,	%g7,	%g4
	stw	%o6,	[%l7 + 0x68]
	edge8	%l1,	%i6,	%o5
	sdiv	%i5,	0x09D3,	%l5
	movrne	%i4,	%i2,	%l4
	fmovrdgez	%l6,	%f20,	%f16
	srl	%g1,	%g6,	%i3
	fmovrse	%l0,	%f6,	%f15
	movvs	%xcc,	%o1,	%i1
	sra	%g2,	0x0D,	%o0
	movvc	%icc,	%l3,	%g5
	umulcc	%o2,	%o7,	%o3
	edge8	%i0,	%l2,	%o4
	mova	%icc,	%g3,	%i7
	movcs	%xcc,	%g7,	%g4
	move	%icc,	%o6,	%l1
	fnegs	%f6,	%f0
	orcc	%o5,	%i6,	%i5
	smulcc	%l5,	0x11A9,	%i2
	lduh	[%l7 + 0x7C],	%i4
	edge8	%l6,	%g1,	%g6
	fpadd16	%f24,	%f30,	%f26
	addccc	%i3,	0x0A4E,	%l0
	fmovdleu	%icc,	%f18,	%f24
	movleu	%xcc,	%o1,	%i1
	sll	%l4,	0x07,	%o0
	movrlz	%l3,	%g2,	%g5
	edge16l	%o2,	%o7,	%o3
	edge32l	%i0,	%l2,	%g3
	save %o4, 0x0C9D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x68],	%g7
	and	%o6,	%l1,	%g4
	andncc	%o5,	%i6,	%l5
	ldub	[%l7 + 0x43],	%i5
	fpsub16s	%f14,	%f25,	%f31
	movgu	%icc,	%i4,	%l6
	nop
	set	0x40, %i6
	ldsh	[%l7 + %i6],	%i2
	array16	%g1,	%g6,	%l0
	movre	%o1,	%i1,	%i3
	array16	%l4,	%l3,	%g2
	movrgz	%o0,	%o2,	%g5
	move	%icc,	%o3,	%o7
	fcmpeq16	%f16,	%f20,	%i0
	movne	%xcc,	%l2,	%g3
	sll	%i7,	%g7,	%o4
	movvc	%xcc,	%o6,	%l1
	movrlz	%o5,	0x07F,	%i6
	smulcc	%l5,	%i5,	%g4
	movvc	%xcc,	%l6,	%i2
	restore %i4, %g6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%f30
	srax	%o1,	%g1,	%i1
	edge32l	%i3,	%l3,	%l4
	alignaddr	%o0,	%g2,	%g5
	ldd	[%l7 + 0x28],	%f2
	movneg	%xcc,	%o2,	%o7
	movgu	%icc,	%o3,	%l2
	xorcc	%i0,	0x0BC9,	%g3
	fmovs	%f24,	%f6
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	fandnot2	%f8,	%f4,	%f14
	movg	%icc,	%l1,	%o6
	xorcc	%i6,	0x1316,	%l5
	mova	%icc,	%i5,	%o5
	sllx	%l6,	0x02,	%g4
	addc	%i4,	0x1385,	%i2
	srlx	%l0,	0x1F,	%o1
	ldd	[%l7 + 0x68],	%g0
	movrgz	%i1,	%i3,	%g6
	fmovsgu	%icc,	%f28,	%f17
	fsrc2s	%f25,	%f4
	fzeros	%f1
	fmovdne	%icc,	%f13,	%f25
	fmovsn	%xcc,	%f9,	%f9
	and	%l4,	%o0,	%g2
	movneg	%icc,	%l3,	%g5
	addccc	%o7,	%o2,	%l2
	or	%o3,	0x1E91,	%g3
	fmovdge	%icc,	%f31,	%f11
	sdiv	%g7,	0x1C48,	%i0
	udivx	%o4,	0x144B,	%i7
	andcc	%o6,	0x0E01,	%l1
	edge8ln	%l5,	%i5,	%i6
	movg	%icc,	%l6,	%g4
	mova	%xcc,	%o5,	%i2
	ldd	[%l7 + 0x20],	%f22
	ldub	[%l7 + 0x51],	%l0
	fpmerge	%f16,	%f16,	%f30
	mulx	%o1,	%g1,	%i4
	sth	%i3,	[%l7 + 0x3C]
	andncc	%i1,	%g6,	%l4
	fmovsg	%icc,	%f10,	%f28
	fandnot2s	%f22,	%f13,	%f14
	subcc	%o0,	%g2,	%g5
	add	%o7,	0x1C9A,	%o2
	or	%l3,	%l2,	%o3
	edge16l	%g3,	%g7,	%i0
	alignaddrl	%o4,	%i7,	%l1
	srl	%l5,	%o6,	%i5
	ldsw	[%l7 + 0x60],	%l6
	stx	%g4,	[%l7 + 0x28]
	sdivx	%o5,	0x1E91,	%i6
	fcmpeq32	%f12,	%f26,	%i2
	array32	%o1,	%l0,	%g1
	smul	%i4,	0x1438,	%i1
	sdivcc	%g6,	0x0D5D,	%l4
	fxor	%f4,	%f24,	%f14
	xorcc	%o0,	%i3,	%g2
	ldd	[%l7 + 0x18],	%f8
	fxnors	%f15,	%f17,	%f7
	edge32n	%g5,	%o7,	%l3
	mulx	%o2,	%o3,	%l2
	fexpand	%f26,	%f2
	udivcc	%g7,	0x1C4A,	%g3
	umul	%o4,	%i7,	%i0
	sdiv	%l1,	0x1C2F,	%o6
	edge32n	%i5,	%l6,	%l5
	movg	%xcc,	%g4,	%i6
	fmovda	%icc,	%f11,	%f7
	movre	%i2,	%o1,	%o5
	add	%g1,	%i4,	%i1
	stb	%l0,	[%l7 + 0x57]
	edge16	%l4,	%g6,	%i3
	stb	%g2,	[%l7 + 0x46]
	lduw	[%l7 + 0x7C],	%g5
	movneg	%xcc,	%o0,	%l3
	sllx	%o2,	%o7,	%o3
	subccc	%l2,	%g7,	%g3
	ld	[%l7 + 0x40],	%f15
	add	%o4,	%i7,	%i0
	smul	%o6,	%i5,	%l6
	addccc	%l1,	%g4,	%l5
	and	%i6,	0x0136,	%i2
	add	%o1,	%g1,	%o5
	ldsw	[%l7 + 0x74],	%i4
	ldsh	[%l7 + 0x08],	%l0
	sdiv	%l4,	0x07C4,	%i1
	addc	%g6,	%i3,	%g2
	sth	%o0,	[%l7 + 0x6A]
	fnors	%f16,	%f19,	%f24
	edge32n	%l3,	%g5,	%o2
	ldsw	[%l7 + 0x1C],	%o7
	movcc	%xcc,	%o3,	%g7
	fmul8x16al	%f25,	%f31,	%f8
	movn	%xcc,	%g3,	%l2
	fmovdg	%xcc,	%f11,	%f30
	srax	%o4,	0x16,	%i7
	mova	%xcc,	%o6,	%i0
	srl	%l6,	%l1,	%g4
	array8	%i5,	%l5,	%i6
	stx	%o1,	[%l7 + 0x10]
	movcs	%xcc,	%i2,	%o5
	andncc	%g1,	%l0,	%i4
	orn	%l4,	%i1,	%i3
	movrgez	%g6,	0x224,	%o0
	edge16ln	%g2,	%l3,	%o2
	udivcc	%g5,	0x1912,	%o3
	fmovrslz	%o7,	%f3,	%f16
	subcc	%g7,	%l2,	%o4
	movcc	%xcc,	%g3,	%o6
	smulcc	%i0,	0x01B2,	%l6
	edge16l	%i7,	%g4,	%i5
	alignaddrl	%l5,	%l1,	%o1
	movre	%i2,	%o5,	%i6
	ldx	[%l7 + 0x18],	%g1
	movpos	%icc,	%i4,	%l0
	edge8	%l4,	%i1,	%g6
	movcc	%xcc,	%i3,	%g2
	sdivcc	%l3,	0x0C13,	%o0
	xnor	%g5,	0x13E8,	%o2
	edge32n	%o7,	%o3,	%g7
	ldub	[%l7 + 0x46],	%l2
	sdivx	%o4,	0x1CB7,	%g3
	mulx	%i0,	%o6,	%i7
	fpsub32s	%f8,	%f20,	%f21
	array32	%g4,	%i5,	%l6
	subccc	%l1,	%l5,	%o1
	movrlez	%o5,	0x06E,	%i6
	lduw	[%l7 + 0x10],	%i2
	edge16	%g1,	%i4,	%l4
	fandnot2	%f4,	%f20,	%f12
	fcmpd	%fcc3,	%f6,	%f30
	movrgez	%i1,	0x1F6,	%g6
	udiv	%l0,	0x153A,	%g2
	fpadd32	%f20,	%f2,	%f16
	edge32l	%i3,	%o0,	%l3
	ldsb	[%l7 + 0x22],	%g5
	edge8ln	%o7,	%o3,	%g7
	fxnors	%f7,	%f29,	%f13
	sdiv	%l2,	0x1C6C,	%o2
	edge16	%o4,	%g3,	%i0
	fandnot1	%f10,	%f8,	%f18
	array8	%o6,	%i7,	%g4
	movrgz	%l6,	%l1,	%l5
	sethi	0x0D08,	%i5
	array8	%o5,	%i6,	%o1
	fpadd16s	%f12,	%f6,	%f7
	for	%f10,	%f28,	%f28
	sdiv	%g1,	0x1C2D,	%i2
	movrgz	%l4,	%i1,	%g6
	fmovrde	%i4,	%f14,	%f16
	edge8	%l0,	%g2,	%i3
	xorcc	%o0,	%g5,	%o7
	addccc	%o3,	%g7,	%l2
	edge16n	%l3,	%o2,	%g3
	stw	%o4,	[%l7 + 0x78]
	for	%f30,	%f24,	%f8
	udivcc	%o6,	0x15D8,	%i0
	fmovrsgz	%i7,	%f17,	%f3
	movgu	%icc,	%g4,	%l1
	sub	%l6,	%i5,	%o5
	sdivcc	%l5,	0x1C32,	%i6
	movleu	%icc,	%o1,	%g1
	sub	%i2,	%l4,	%i1
	addc	%g6,	0x0ADE,	%i4
	movn	%icc,	%g2,	%l0
	fpack32	%f30,	%f20,	%f6
	mova	%icc,	%i3,	%g5
	array16	%o0,	%o7,	%g7
	stw	%l2,	[%l7 + 0x5C]
	fpackfix	%f0,	%f25
	movge	%xcc,	%l3,	%o3
	nop
	set	0x68, %g3
	lduh	[%l7 + %g3],	%o2
	subcc	%g3,	%o6,	%o4
	movpos	%icc,	%i7,	%i0
	edge32l	%g4,	%l6,	%l1
	fmovd	%f30,	%f10
	orn	%o5,	0x0E27,	%l5
	movvs	%xcc,	%i5,	%o1
	xnorcc	%i6,	%i2,	%l4
	movg	%icc,	%i1,	%g6
	movrlez	%i4,	%g2,	%l0
	ldub	[%l7 + 0x60],	%i3
	ldd	[%l7 + 0x08],	%g0
	ldd	[%l7 + 0x18],	%g4
	fxnors	%f11,	%f5,	%f25
	movvs	%xcc,	%o0,	%g7
	movrlez	%l2,	0x0C7,	%o7
	move	%icc,	%o3,	%l3
	fnand	%f24,	%f26,	%f28
	movvs	%xcc,	%g3,	%o6
	andn	%o2,	%o4,	%i7
	movgu	%xcc,	%g4,	%i0
	mulx	%l6,	0x00BE,	%l1
	array8	%o5,	%i5,	%o1
	srlx	%i6,	0x02,	%i2
	array32	%l4,	%i1,	%l5
	andncc	%i4,	%g2,	%l0
	xnorcc	%i3,	%g6,	%g1
	sethi	0x1346,	%g5
	ldsb	[%l7 + 0x52],	%g7
	udivcc	%l2,	0x0171,	%o7
	edge32	%o0,	%o3,	%l3
	ldx	[%l7 + 0x10],	%o6
	stb	%o2,	[%l7 + 0x15]
	move	%icc,	%o4,	%i7
	sth	%g4,	[%l7 + 0x6E]
	movg	%icc,	%g3,	%i0
	srlx	%l6,	0x1D,	%l1
	fandnot1	%f0,	%f26,	%f6
	fmovrse	%i5,	%f5,	%f11
	ldx	[%l7 + 0x18],	%o1
	movvs	%icc,	%o5,	%i2
	sdiv	%i6,	0x0D41,	%l4
	andcc	%i1,	0x0682,	%i4
	xorcc	%g2,	0x14CF,	%l0
	srlx	%i3,	%g6,	%l5
	smul	%g5,	0x0DBE,	%g7
	xor	%g1,	0x1DBD,	%l2
	sth	%o0,	[%l7 + 0x30]
	st	%f6,	[%l7 + 0x68]
	mulscc	%o3,	0x1BEE,	%o7
	movre	%l3,	0x155,	%o2
	movrgez	%o6,	0x283,	%o4
	sll	%g4,	%i7,	%i0
	move	%icc,	%g3,	%l6
	andcc	%i5,	0x19DD,	%o1
	save %o5, 0x050E, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f13,	%f30
	smulcc	%i6,	%l4,	%i1
	edge8ln	%i4,	%i2,	%l0
	fmovrse	%i3,	%f10,	%f24
	movre	%g2,	%g6,	%l5
	ldd	[%l7 + 0x18],	%f6
	srlx	%g5,	0x0F,	%g1
	std	%f6,	[%l7 + 0x60]
	movvs	%icc,	%l2,	%g7
	fcmple32	%f2,	%f16,	%o0
	movrlez	%o3,	%l3,	%o2
	edge8n	%o7,	%o4,	%g4
	udiv	%i7,	0x1209,	%o6
	add	%i0,	0x1882,	%l6
	std	%f10,	[%l7 + 0x28]
	edge32	%g3,	%o1,	%o5
	udiv	%i5,	0x04BA,	%i6
	mulx	%l1,	%l4,	%i1
	edge32ln	%i2,	%i4,	%l0
	nop
	set	0x14, %i7
	lduw	[%l7 + %i7],	%i3
	ld	[%l7 + 0x38],	%f11
	udivcc	%g6,	0x0FA6,	%g2
	xor	%l5,	0x031E,	%g1
	udivcc	%l2,	0x06FF,	%g5
	array8	%o0,	%o3,	%l3
	or	%g7,	0x0631,	%o2
	andncc	%o4,	%o7,	%i7
	srl	%o6,	%i0,	%g4
	ldx	[%l7 + 0x60],	%l6
	or	%o1,	%g3,	%o5
	xorcc	%i5,	0x15B4,	%i6
	sdivcc	%l4,	0x0E17,	%l1
	xorcc	%i2,	%i1,	%i4
	alignaddr	%l0,	%g6,	%g2
	udivcc	%i3,	0x0092,	%l5
	or	%l2,	%g1,	%o0
	edge8l	%o3,	%l3,	%g5
	array32	%g7,	%o4,	%o7
	subc	%o2,	0x1D23,	%i7
	edge32l	%o6,	%g4,	%l6
	ldsw	[%l7 + 0x4C],	%o1
	fmuld8sux16	%f4,	%f17,	%f6
	fsrc2	%f2,	%f16
	fmovspos	%xcc,	%f11,	%f22
	andn	%i0,	%g3,	%o5
	addc	%i5,	%l4,	%i6
	udivcc	%i2,	0x16F5,	%l1
	edge8n	%i4,	%i1,	%g6
	stw	%l0,	[%l7 + 0x2C]
	nop
	set	0x38, %g4
	std	%f18,	[%l7 + %g4]
	smulcc	%g2,	0x0FE8,	%i3
	edge8n	%l2,	%g1,	%o0
	alignaddrl	%l5,	%l3,	%o3
	fmovsg	%icc,	%f22,	%f24
	srl	%g5,	%g7,	%o7
	udiv	%o4,	0x0FFB,	%i7
	movrne	%o6,	0x3F9,	%o2
	alignaddrl	%g4,	%o1,	%i0
	ldd	[%l7 + 0x18],	%f6
	xnorcc	%l6,	0x0026,	%o5
	std	%f24,	[%l7 + 0x18]
	fmovrdlz	%i5,	%f16,	%f26
	sra	%l4,	0x0C,	%i6
	edge32ln	%i2,	%l1,	%g3
	movrne	%i1,	0x3B9,	%i4
	fmovrdgz	%l0,	%f22,	%f28
	edge16	%g2,	%i3,	%g6
	fabsd	%f20,	%f20
	fpsub16	%f2,	%f14,	%f10
	ldsw	[%l7 + 0x40],	%g1
	mulscc	%l2,	0x0E0B,	%l5
	movre	%l3,	%o3,	%o0
	ld	[%l7 + 0x28],	%f5
	subccc	%g5,	0x0E9C,	%g7
	or	%o4,	%o7,	%o6
	fabsd	%f4,	%f20
	umul	%o2,	0x1A45,	%i7
	edge16	%g4,	%i0,	%l6
	umul	%o1,	0x0932,	%i5
	movvc	%icc,	%l4,	%i6
	xor	%i2,	%o5,	%l1
	stb	%i1,	[%l7 + 0x33]
	nop
	set	0x58, %l3
	stw	%i4,	[%l7 + %l3]
	save %g3, 0x1796, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l0,	%i3,	%g1
	fmovda	%xcc,	%f21,	%f17
	movrgz	%l2,	%l5,	%g6
	edge8l	%o3,	%l3,	%o0
	sir	0x0B4F
	srl	%g7,	%o4,	%g5
	addc	%o6,	0x0BEA,	%o7
	smul	%i7,	%o2,	%i0
	mulx	%g4,	%o1,	%i5
	orncc	%l4,	%i6,	%i2
	srl	%l6,	0x1F,	%l1
	sdivcc	%i1,	0x0B17,	%o5
	xnor	%g3,	0x1AE5,	%i4
	movcs	%icc,	%l0,	%i3
	orncc	%g2,	%l2,	%l5
	array16	%g6,	%g1,	%o3
	addccc	%l3,	0x11C5,	%o0
	restore %g7, %o4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g5,	0x1228,	%i7
	movg	%icc,	%o2,	%i0
	stb	%g4,	[%l7 + 0x5B]
	fmovrslz	%o7,	%f4,	%f1
	stx	%i5,	[%l7 + 0x30]
	xor	%o1,	%l4,	%i6
	umulcc	%l6,	%i2,	%i1
	nop
	set	0x61, %l4
	ldsb	[%l7 + %l4],	%l1
	fexpand	%f20,	%f18
	alignaddrl	%g3,	%o5,	%i4
	mulscc	%l0,	0x1D13,	%i3
	stw	%l2,	[%l7 + 0x60]
	ldx	[%l7 + 0x08],	%g2
	movrne	%g6,	0x1CE,	%g1
	movrlz	%o3,	0x029,	%l3
	array32	%o0,	%l5,	%g7
	udivx	%o6,	0x10CA,	%o4
	pdist	%f26,	%f8,	%f14
	movneg	%xcc,	%i7,	%g5
	edge8n	%i0,	%o2,	%o7
	fcmpne32	%f6,	%f26,	%i5
	udivcc	%g4,	0x1D6E,	%o1
	fmovsg	%icc,	%f5,	%f17
	orncc	%l4,	0x1918,	%l6
	sethi	0x162B,	%i2
	umulcc	%i1,	%i6,	%g3
	udiv	%o5,	0x0297,	%l1
	lduw	[%l7 + 0x6C],	%l0
	xnorcc	%i3,	%i4,	%l2
	fmovdgu	%icc,	%f1,	%f0
	movn	%icc,	%g2,	%g6
	fmovsa	%xcc,	%f8,	%f26
	array8	%o3,	%g1,	%o0
	movcc	%xcc,	%l3,	%l5
	subccc	%g7,	0x00E9,	%o4
	fnegd	%f14,	%f28
	sdiv	%i7,	0x1025,	%o6
	mulx	%g5,	%i0,	%o2
	andcc	%i5,	%o7,	%o1
	movcs	%xcc,	%g4,	%l6
	fpsub16s	%f15,	%f15,	%f8
	stx	%i2,	[%l7 + 0x30]
	orcc	%i1,	%l4,	%g3
	ldx	[%l7 + 0x60],	%i6
	fmovdvc	%icc,	%f6,	%f26
	orncc	%l1,	%l0,	%o5
	sir	0x0E0E
	orcc	%i3,	%l2,	%i4
	udivx	%g2,	0x0F62,	%o3
	srl	%g6,	%o0,	%g1
	edge16	%l5,	%l3,	%o4
	array32	%g7,	%i7,	%o6
	sra	%i0,	%o2,	%g5
	lduw	[%l7 + 0x7C],	%o7
	fmovd	%f0,	%f20
	alignaddr	%o1,	%g4,	%i5
	andncc	%l6,	%i2,	%l4
	and	%g3,	%i6,	%l1
	lduh	[%l7 + 0x6C],	%i1
	save %o5, 0x18C2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i3,	%l2,	%i4
	subcc	%g2,	%g6,	%o0
	sth	%o3,	[%l7 + 0x22]
	fmul8x16	%f2,	%f4,	%f2
	fmovdg	%xcc,	%f30,	%f21
	fzeros	%f12
	movrlz	%g1,	0x0F5,	%l3
	movcc	%xcc,	%o4,	%g7
	srl	%l5,	0x05,	%o6
	fmovsneg	%xcc,	%f27,	%f19
	orn	%i7,	%i0,	%g5
	array16	%o7,	%o1,	%g4
	fors	%f12,	%f2,	%f12
	sethi	0x1BEF,	%o2
	fsrc1	%f20,	%f10
	edge16	%l6,	%i5,	%l4
	edge32	%i2,	%i6,	%l1
	sdivcc	%i1,	0x1A5F,	%g3
	movcc	%icc,	%o5,	%l0
	fnands	%f18,	%f19,	%f9
	movleu	%xcc,	%i3,	%l2
	sub	%i4,	%g2,	%o0
	move	%icc,	%g6,	%g1
	fnegs	%f27,	%f8
	nop
	set	0x40, %i5
	stx	%l3,	[%l7 + %i5]
	umul	%o3,	0x0AD2,	%g7
	alignaddr	%o4,	%l5,	%i7
	xorcc	%o6,	%i0,	%o7
	movvs	%xcc,	%g5,	%o1
	fmovspos	%xcc,	%f6,	%f19
	ld	[%l7 + 0x7C],	%f21
	stw	%o2,	[%l7 + 0x0C]
	fmul8x16al	%f18,	%f23,	%f16
	movle	%xcc,	%g4,	%l6
	movne	%icc,	%i5,	%i2
	subcc	%i6,	%l1,	%i1
	sdivcc	%l4,	0x0F86,	%g3
	udivcc	%l0,	0x0C6A,	%i3
	movpos	%xcc,	%o5,	%i4
	add	%g2,	%l2,	%g6
	mulx	%g1,	%o0,	%o3
	movrlez	%l3,	0x396,	%o4
	fmovdge	%icc,	%f10,	%f0
	mulscc	%g7,	%i7,	%l5
	smul	%i0,	0x08AC,	%o7
	save %o6, 0x10C2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f30,	%f20
	array8	%g5,	%o2,	%g4
	movre	%l6,	%i5,	%i2
	save %i6, %i1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x34],	%l1
	movvc	%xcc,	%l0,	%i3
	fpsub32	%f4,	%f24,	%f16
	addcc	%o5,	0x1EC0,	%g3
	subc	%g2,	0x19FD,	%l2
	subccc	%g6,	0x1789,	%g1
	movl	%xcc,	%i4,	%o0
	stw	%o3,	[%l7 + 0x70]
	fpadd32s	%f8,	%f4,	%f12
	movg	%xcc,	%o4,	%g7
	std	%f18,	[%l7 + 0x68]
	movvs	%xcc,	%l3,	%l5
	fxors	%f17,	%f14,	%f30
	umulcc	%i7,	%o7,	%o6
	xorcc	%i0,	0x1BED,	%o1
	srl	%g5,	0x0F,	%g4
	sdiv	%l6,	0x16CA,	%i5
	st	%f29,	[%l7 + 0x48]
	fnor	%f8,	%f10,	%f4
	ldsw	[%l7 + 0x1C],	%o2
	movg	%icc,	%i2,	%i1
	xorcc	%i6,	0x0A94,	%l1
	fmovrdgez	%l4,	%f4,	%f4
	mulx	%l0,	%o5,	%g3
	fmovsleu	%icc,	%f12,	%f1
	sub	%i3,	0x0B59,	%l2
	movcs	%icc,	%g2,	%g1
	fnors	%f26,	%f22,	%f17
	subcc	%i4,	0x0E88,	%g6
	movle	%xcc,	%o3,	%o0
	movl	%xcc,	%o4,	%l3
	srl	%l5,	%i7,	%g7
	umul	%o6,	%i0,	%o1
	subccc	%o7,	%g5,	%g4
	xnorcc	%i5,	0x0947,	%l6
	edge32l	%i2,	%i1,	%i6
	fmovs	%f16,	%f9
	edge16l	%o2,	%l1,	%l4
	move	%icc,	%l0,	%g3
	fmovdleu	%icc,	%f19,	%f11
	sra	%i3,	%l2,	%g2
	movcs	%icc,	%g1,	%i4
	edge32l	%o5,	%g6,	%o3
	edge32	%o4,	%l3,	%o0
	udivx	%l5,	0x11F6,	%i7
	fmovdne	%xcc,	%f12,	%f22
	xor	%g7,	%o6,	%o1
	xnorcc	%i0,	%o7,	%g5
	fxors	%f24,	%f8,	%f3
	save %i5, 0x1376, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i2,	%i1,	%l6
	fmovrdlez	%o2,	%f10,	%f8
	fmovrdlz	%i6,	%f20,	%f24
	sdiv	%l4,	0x0257,	%l1
	movcc	%xcc,	%g3,	%l0
	movg	%icc,	%i3,	%g2
	add	%g1,	%i4,	%o5
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l2
	fmul8x16au	%f6,	%f1,	%f8
	srlx	%g6,	%o4,	%l3
	edge32ln	%o0,	%o3,	%i7
	array32	%l5,	%o6,	%o1
	mulscc	%g7,	%i0,	%o7
	mulscc	%g5,	0x07C6,	%i5
	fmovdpos	%xcc,	%f9,	%f22
	udivcc	%i2,	0x13E3,	%i1
	ldd	[%l7 + 0x68],	%i6
	sub	%o2,	%g4,	%i6
	and	%l1,	0x12E7,	%l4
	subccc	%l0,	%i3,	%g3
	ldd	[%l7 + 0x18],	%f12
	orn	%g2,	0x14D7,	%g1
	xnorcc	%o5,	%l2,	%i4
	edge32n	%o4,	%l3,	%g6
	subcc	%o3,	%o0,	%i7
	fmovdcc	%icc,	%f5,	%f0
	movg	%icc,	%o6,	%o1
	or	%l5,	0x058B,	%i0
	std	%f2,	[%l7 + 0x30]
	fandnot2	%f6,	%f0,	%f16
	fmul8ulx16	%f18,	%f16,	%f4
	fmovsn	%icc,	%f20,	%f3
	movcc	%xcc,	%g7,	%g5
	fabss	%f22,	%f5
	orncc	%o7,	%i5,	%i2
	fmovde	%icc,	%f0,	%f4
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	and	%g4,	%l6,	%l1
	edge16n	%i6,	%l0,	%l4
	ldd	[%l7 + 0x20],	%i2
	edge32n	%g3,	%g1,	%o5
	movle	%icc,	%g2,	%l2
	fmovdcc	%icc,	%f0,	%f10
	or	%o4,	%i4,	%g6
	fsrc2	%f22,	%f14
	movge	%xcc,	%o3,	%l3
	restore %i7, %o6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o1,	%i0,	%g7
	movgu	%xcc,	%l5,	%g5
	fnors	%f6,	%f16,	%f13
	movne	%xcc,	%o7,	%i5
	ldsh	[%l7 + 0x6A],	%i2
	sir	0x055C
	fmovscs	%xcc,	%f3,	%f27
	umulcc	%i1,	%g4,	%l6
	sdivx	%l1,	0x046F,	%i6
	mulscc	%l0,	0x0D38,	%l4
	edge16	%i3,	%o2,	%g1
	fmovdgu	%xcc,	%f15,	%f12
	xnorcc	%g3,	%o5,	%g2
	movrlz	%o4,	%l2,	%g6
	fmovrslez	%o3,	%f17,	%f9
	movleu	%xcc,	%i4,	%l3
	edge32ln	%i7,	%o6,	%o0
	ldsh	[%l7 + 0x20],	%o1
	fmul8x16au	%f17,	%f9,	%f6
	fmuld8ulx16	%f23,	%f11,	%f28
	edge8l	%g7,	%l5,	%i0
	fmovrdne	%g5,	%f10,	%f24
	ldsw	[%l7 + 0x40],	%i5
	and	%i2,	0x0965,	%i1
	srlx	%o7,	%g4,	%l1
	movleu	%xcc,	%i6,	%l6
	fones	%f9
	movpos	%icc,	%l4,	%i3
	edge32ln	%o2,	%g1,	%l0
	ldsw	[%l7 + 0x78],	%o5
	fmovdle	%xcc,	%f14,	%f26
	umulcc	%g3,	0x1100,	%o4
	xor	%l2,	0x1D3A,	%g2
	ldd	[%l7 + 0x78],	%g6
	fnands	%f17,	%f9,	%f19
	ldsw	[%l7 + 0x0C],	%o3
	fmovrdne	%l3,	%f10,	%f22
	fnot2s	%f7,	%f7
	smul	%i7,	0x1869,	%i4
	movre	%o0,	0x07E,	%o6
	andcc	%o1,	0x067F,	%g7
	srax	%i0,	0x00,	%l5
	fmul8x16	%f24,	%f2,	%f22
	orcc	%g5,	0x08EA,	%i5
	sdiv	%i2,	0x1B6B,	%i1
	xnor	%g4,	0x1D5F,	%o7
	srax	%i6,	%l6,	%l1
	movrgez	%i3,	%l4,	%g1
	fsrc2	%f18,	%f20
	movne	%icc,	%o2,	%l0
	array32	%g3,	%o5,	%l2
	movle	%xcc,	%g2,	%o4
	edge16ln	%o3,	%g6,	%l3
	addc	%i7,	%i4,	%o6
	udivx	%o0,	0x1FD6,	%o1
	movleu	%xcc,	%g7,	%i0
	fmovsa	%xcc,	%f20,	%f2
	and	%g5,	0x17BA,	%l5
	st	%f30,	[%l7 + 0x14]
	fandnot1	%f14,	%f0,	%f4
	umul	%i2,	0x1FF3,	%i5
	bshuffle	%f28,	%f0,	%f16
	fpsub32s	%f0,	%f15,	%f10
	alignaddr	%i1,	%o7,	%g4
	movneg	%xcc,	%l6,	%i6
	movge	%icc,	%l1,	%l4
	movneg	%xcc,	%i3,	%o2
	ldsh	[%l7 + 0x6E],	%l0
	smul	%g1,	0x008D,	%o5
	sir	0x17DC
	xor	%l2,	0x1D8A,	%g3
	sll	%g2,	%o3,	%g6
	save %o4, 0x1850, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f20,	%f17,	%f2
	fmovdneg	%icc,	%f13,	%f5
	sub	%i4,	%l3,	%o0
	stb	%o1,	[%l7 + 0x40]
	array16	%g7,	%o6,	%i0
	stw	%g5,	[%l7 + 0x54]
	alignaddr	%i2,	%l5,	%i1
	sdivcc	%o7,	0x02E7,	%i5
	array8	%l6,	%i6,	%g4
	movge	%icc,	%l4,	%i3
	add	%l1,	%o2,	%g1
	umul	%o5,	0x0D99,	%l2
	or	%g3,	%g2,	%l0
	addc	%g6,	0x0E26,	%o3
	umul	%i7,	0x0052,	%i4
	sllx	%l3,	0x15,	%o4
	orcc	%o1,	0x1CA4,	%g7
	nop
	set	0x48, %i3
	ldsw	[%l7 + %i3],	%o0
	edge16ln	%i0,	%o6,	%g5
	smulcc	%l5,	%i2,	%o7
	sth	%i5,	[%l7 + 0x74]
	ldsw	[%l7 + 0x0C],	%l6
	fmovdn	%xcc,	%f31,	%f7
	fmovsne	%icc,	%f24,	%f17
	movcs	%xcc,	%i1,	%g4
	sllx	%i6,	0x1E,	%l4
	fzeros	%f30
	andncc	%l1,	%o2,	%i3
	ld	[%l7 + 0x74],	%f4
	subc	%g1,	0x0E5F,	%o5
	fpadd16	%f4,	%f26,	%f12
	xnorcc	%l2,	0x124E,	%g3
	movne	%xcc,	%g2,	%g6
	ldx	[%l7 + 0x30],	%l0
	fnot2	%f0,	%f2
	save %i7, %o3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l3,	0x0D8A,	%o4
	fmovdcs	%xcc,	%f21,	%f5
	ldsh	[%l7 + 0x1C],	%g7
	fmovde	%icc,	%f30,	%f24
	fmovdneg	%icc,	%f16,	%f31
	fcmpes	%fcc3,	%f24,	%f2
	fors	%f27,	%f20,	%f18
	add	%o1,	0x1534,	%o0
	addccc	%i0,	0x1653,	%g5
	movvc	%icc,	%l5,	%i2
	ldd	[%l7 + 0x40],	%o6
	udivcc	%o6,	0x11C9,	%i5
	smul	%i1,	0x134D,	%l6
	mulscc	%g4,	0x1FE6,	%l4
	fmovspos	%icc,	%f14,	%f27
	fcmple16	%f10,	%f18,	%i6
	sdivcc	%l1,	0x0F22,	%o2
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	ldd	[%l7 + 0x50],	%f4
	subc	%g3,	%l2,	%g6
	fpsub16s	%f10,	%f4,	%f9
	sllx	%g2,	%l0,	%o3
	subcc	%i7,	%l3,	%o4
	fpadd32	%f30,	%f22,	%f18
	fpackfix	%f16,	%f25
	umulcc	%g7,	%o1,	%i4
	fornot2	%f2,	%f16,	%f4
	sethi	0x008C,	%i0
	lduh	[%l7 + 0x22],	%o0
	xnor	%g5,	%l5,	%i2
	movcc	%xcc,	%o6,	%i5
	sdivx	%o7,	0x1F5D,	%l6
	sra	%g4,	%l4,	%i6
	add	%l1,	%i1,	%i3
	xnor	%g1,	%o2,	%g3
	movleu	%icc,	%l2,	%g6
	stx	%o5,	[%l7 + 0x38]
	movrgz	%g2,	0x265,	%l0
	fpackfix	%f22,	%f22
	udivcc	%o3,	0x1ED8,	%l3
	alignaddrl	%i7,	%g7,	%o4
	subc	%i4,	0x1568,	%i0
	movre	%o0,	0x13A,	%g5
	movneg	%xcc,	%o1,	%l5
	andncc	%o6,	%i5,	%i2
	sethi	0x0FBD,	%l6
	fmul8x16al	%f17,	%f18,	%f14
	ld	[%l7 + 0x6C],	%f29
	movcc	%xcc,	%o7,	%g4
	fpsub32	%f16,	%f24,	%f26
	sll	%l4,	%i6,	%l1
	fpsub16	%f0,	%f12,	%f24
	fcmped	%fcc0,	%f2,	%f28
	ldub	[%l7 + 0x7B],	%i3
	fpmerge	%f31,	%f23,	%f12
	orcc	%g1,	0x050C,	%i1
	ldub	[%l7 + 0x60],	%o2
	ldx	[%l7 + 0x58],	%g3
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%l2
	fmovsgu	%xcc,	%f24,	%f28
	fornot1	%f4,	%f6,	%f2
	sth	%o5,	[%l7 + 0x44]
	movne	%xcc,	%g2,	%g6
	edge16ln	%o3,	%l3,	%i7
	xor	%g7,	0x13B2,	%o4
	fmovsle	%xcc,	%f0,	%f1
	fpadd32s	%f23,	%f1,	%f2
	andcc	%i4,	0x1B84,	%l0
	fcmpeq32	%f20,	%f6,	%i0
	sll	%g5,	0x1E,	%o0
	andcc	%l5,	0x1B98,	%o6
	mulscc	%o1,	%i5,	%l6
	movvs	%xcc,	%o7,	%g4
	srl	%l4,	%i6,	%l1
	stb	%i2,	[%l7 + 0x64]
	fmovscc	%xcc,	%f14,	%f14
	srl	%g1,	%i3,	%o2
	add	%g3,	0x007F,	%l2
	stw	%i1,	[%l7 + 0x14]
	movcc	%xcc,	%g2,	%o5
	edge32	%o3,	%l3,	%i7
	ldsh	[%l7 + 0x16],	%g6
	sdiv	%g7,	0x0ABB,	%i4
	fmovdn	%xcc,	%f18,	%f24
	srax	%o4,	%l0,	%g5
	or	%i0,	0x1994,	%o0
	popc	0x164B,	%o6
	edge8	%l5,	%o1,	%l6
	sdivcc	%o7,	0x145A,	%i5
	array8	%l4,	%i6,	%g4
	movle	%xcc,	%l1,	%i2
	stb	%i3,	[%l7 + 0x25]
	ldub	[%l7 + 0x6E],	%g1
	movpos	%xcc,	%g3,	%l2
	fnor	%f20,	%f12,	%f16
	fmuld8sux16	%f7,	%f3,	%f28
	alignaddrl	%o2,	%g2,	%i1
	ld	[%l7 + 0x3C],	%f29
	sethi	0x13E8,	%o5
	fpadd32	%f6,	%f12,	%f8
	fmovsvc	%icc,	%f30,	%f22
	movvs	%xcc,	%l3,	%i7
	ld	[%l7 + 0x38],	%f28
	edge32ln	%g6,	%o3,	%g7
	fmovrsgz	%i4,	%f8,	%f14
	stb	%l0,	[%l7 + 0x64]
	srl	%o4,	0x06,	%g5
	and	%o0,	0x106B,	%i0
	movre	%o6,	%o1,	%l5
	subcc	%o7,	%i5,	%l6
	fone	%f12
	edge8n	%i6,	%g4,	%l4
	ldd	[%l7 + 0x58],	%f8
	edge32n	%i2,	%l1,	%g1
	edge8n	%i3,	%l2,	%g3
	fornot2s	%f12,	%f19,	%f23
	fones	%f10
	fmovdleu	%xcc,	%f7,	%f3
	ldsw	[%l7 + 0x74],	%g2
	movrlz	%o2,	0x0A3,	%i1
	ld	[%l7 + 0x5C],	%f12
	srl	%o5,	0x06,	%l3
	save %g6, 0x1D65, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g7,	%o3,	%i4
	popc	0x0A74,	%o4
	srl	%l0,	0x01,	%g5
	pdist	%f16,	%f26,	%f20
	ld	[%l7 + 0x64],	%f2
	sub	%o0,	0x19D6,	%o6
	fmovdcc	%icc,	%f18,	%f27
	movrlez	%o1,	%l5,	%o7
	movrgez	%i5,	0x287,	%i0
	stb	%i6,	[%l7 + 0x74]
	fornot1s	%f16,	%f20,	%f6
	ldsb	[%l7 + 0x45],	%l6
	fcmpeq32	%f14,	%f26,	%l4
	addcc	%i2,	%l1,	%g4
	fandnot1	%f16,	%f6,	%f4
	srl	%g1,	0x0F,	%l2
	fcmpgt16	%f24,	%f18,	%g3
	andncc	%i3,	%o2,	%g2
	fcmpne16	%f12,	%f2,	%i1
	ldd	[%l7 + 0x20],	%o4
	ldsb	[%l7 + 0x6D],	%g6
	udivx	%i7,	0x0AB3,	%l3
	addc	%g7,	0x0E73,	%i4
	movrgz	%o4,	0x311,	%l0
	movrgez	%o3,	0x040,	%o0
	mulscc	%o6,	0x0673,	%g5
	fones	%f1
	fnot1	%f12,	%f18
	sllx	%o1,	%l5,	%i5
	subcc	%o7,	0x04ED,	%i0
	umulcc	%l6,	0x0EF1,	%l4
	edge32n	%i2,	%l1,	%g4
	ldx	[%l7 + 0x58],	%i6
	fmovrsgz	%l2,	%f13,	%f12
	ldsh	[%l7 + 0x74],	%g1
	fmovsa	%icc,	%f5,	%f29
	movrgez	%i3,	0x136,	%o2
	fcmps	%fcc3,	%f8,	%f16
	orcc	%g2,	0x0044,	%g3
	lduh	[%l7 + 0x78],	%o5
	movcs	%icc,	%i1,	%i7
	fmovdl	%xcc,	%f20,	%f4
	ldsw	[%l7 + 0x5C],	%g6
	edge32ln	%l3,	%g7,	%o4
	movre	%i4,	0x1AE,	%o3
	ldsw	[%l7 + 0x74],	%o0
	nop
	set	0x28, %o4
	stx	%l0,	[%l7 + %o4]
	fcmpne32	%f26,	%f20,	%o6
	movneg	%icc,	%o1,	%g5
	fmul8x16au	%f26,	%f10,	%f22
	movcs	%xcc,	%l5,	%i5
	movrne	%i0,	%l6,	%l4
	edge32l	%o7,	%l1,	%g4
	mulscc	%i2,	%i6,	%g1
	movg	%icc,	%l2,	%o2
	xnor	%g2,	0x0D50,	%i3
	movpos	%xcc,	%g3,	%o5
	edge32	%i1,	%i7,	%l3
	xorcc	%g6,	%o4,	%i4
	array8	%o3,	%g7,	%l0
	fcmpd	%fcc2,	%f26,	%f14
	and	%o6,	0x046D,	%o0
	sll	%o1,	%g5,	%l5
	sdiv	%i5,	0x1A16,	%i0
	nop
	set	0x08, %l5
	std	%f4,	[%l7 + %l5]
	restore %l4, %l6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g4,	%o7,	%i6
	fnot1s	%f20,	%f5
	ldx	[%l7 + 0x78],	%i2
	fmul8sux16	%f8,	%f24,	%f24
	ld	[%l7 + 0x1C],	%f10
	array8	%g1,	%l2,	%o2
	fpack32	%f2,	%f6,	%f24
	fxor	%f22,	%f30,	%f8
	stx	%g2,	[%l7 + 0x70]
	andncc	%g3,	%o5,	%i1
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	movge	%icc,	%g6,	%o4
	lduw	[%l7 + 0x40],	%o3
	st	%f14,	[%l7 + 0x4C]
	sdivx	%i4,	0x0F6A,	%g7
	mulscc	%l0,	0x044E,	%o6
	fmovsa	%xcc,	%f26,	%f19
	addc	%o0,	0x1032,	%o1
	fxors	%f20,	%f13,	%f5
	fmovsa	%icc,	%f9,	%f13
	sdiv	%g5,	0x049B,	%l5
	edge8	%i5,	%i0,	%l4
	smul	%l6,	%g4,	%o7
	smul	%l1,	%i6,	%g1
	movl	%xcc,	%i2,	%l2
	srlx	%g2,	%o2,	%g3
	smul	%o5,	0x0BBA,	%i1
	subc	%l3,	%i3,	%g6
	xnorcc	%o4,	0x1CC4,	%o3
	movcs	%icc,	%i7,	%g7
	subcc	%l0,	%i4,	%o6
	fmul8sux16	%f26,	%f0,	%f16
	lduw	[%l7 + 0x54],	%o0
	ldsb	[%l7 + 0x5C],	%o1
	movcc	%xcc,	%l5,	%i5
	bshuffle	%f20,	%f26,	%f30
	srl	%i0,	0x05,	%l4
	movrne	%g5,	0x15B,	%g4
	fmuld8ulx16	%f5,	%f14,	%f24
	andn	%l6,	%l1,	%i6
	fcmple32	%f6,	%f28,	%g1
	edge8l	%i2,	%l2,	%g2
	ldx	[%l7 + 0x28],	%o7
	xor	%g3,	%o5,	%o2
	movn	%icc,	%l3,	%i1
	array8	%i3,	%g6,	%o4
	restore %o3, %g7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f4,	%f26,	%i4
	xnorcc	%o6,	%o0,	%l0
	andn	%o1,	%i5,	%i0
	fpadd32s	%f26,	%f24,	%f24
	lduh	[%l7 + 0x2A],	%l4
	fmovrdgz	%l5,	%f2,	%f4
	mulscc	%g5,	0x02DC,	%g4
	fmovdl	%icc,	%f26,	%f0
	udivx	%l1,	0x07DA,	%l6
	mulscc	%i6,	%i2,	%g1
	edge16	%l2,	%o7,	%g3
	movleu	%xcc,	%g2,	%o2
	movgu	%icc,	%o5,	%i1
	fcmpne16	%f22,	%f6,	%i3
	orncc	%g6,	0x1AEF,	%o4
	save %l3, %g7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f30,	%f24
	movgu	%icc,	%i4,	%i7
	sir	0x1FE6
	ldd	[%l7 + 0x10],	%f6
	srax	%o0,	%o6,	%l0
	movl	%icc,	%o1,	%i0
	st	%f24,	[%l7 + 0x38]
	movleu	%icc,	%l4,	%l5
	movrlz	%i5,	%g5,	%g4
	fsrc2	%f6,	%f28
	xor	%l6,	%i6,	%i2
	edge32	%g1,	%l1,	%l2
	alignaddrl	%o7,	%g3,	%g2
	movvc	%icc,	%o5,	%i1
	fmovsneg	%icc,	%f11,	%f16
	movvc	%icc,	%i3,	%g6
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%o4
	edge32n	%o2,	%g7,	%l3
	fornot1	%f28,	%f14,	%f10
	fmovsgu	%xcc,	%f3,	%f30
	alignaddrl	%o3,	%i7,	%i4
	sir	0x1D49
	alignaddr	%o6,	%o0,	%o1
	fmovsg	%icc,	%f30,	%f31
	edge32n	%i0,	%l0,	%l5
	movpos	%icc,	%i5,	%l4
	movrgz	%g5,	%g4,	%l6
	fmovdne	%xcc,	%f4,	%f24
	sth	%i2,	[%l7 + 0x4E]
	edge16l	%g1,	%i6,	%l2
	std	%f8,	[%l7 + 0x60]
	fcmple16	%f26,	%f20,	%o7
	udivx	%l1,	0x097E,	%g3
	edge16n	%g2,	%i1,	%o5
	std	%f2,	[%l7 + 0x48]
	lduh	[%l7 + 0x7E],	%g6
	fmovrsgez	%i3,	%f6,	%f22
	movrlez	%o2,	0x014,	%g7
	sub	%l3,	%o4,	%i7
	movn	%icc,	%o3,	%i4
	movl	%xcc,	%o0,	%o1
	array32	%o6,	%l0,	%i0
	sdivx	%i5,	0x17F3,	%l5
	ldub	[%l7 + 0x2D],	%g5
	orncc	%g4,	%l4,	%l6
	addccc	%i2,	0x1C98,	%g1
	save %l2, 0x199A, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%o7,	%f28,	%f14
	fpadd16	%f10,	%f22,	%f20
	subcc	%g3,	0x0EE5,	%l1
	array32	%i1,	%g2,	%g6
	pdist	%f2,	%f24,	%f2
	ldsw	[%l7 + 0x34],	%i3
	andncc	%o5,	%o2,	%g7
	std	%f22,	[%l7 + 0x28]
	fmovrdlz	%o4,	%f4,	%f10
	edge32ln	%l3,	%o3,	%i7
	sllx	%i4,	0x18,	%o1
	smul	%o0,	%o6,	%l0
	or	%i0,	0x1157,	%i5
	fnands	%f7,	%f18,	%f29
	fmovrde	%l5,	%f6,	%f24
	alignaddr	%g4,	%g5,	%l4
	fmovdcs	%icc,	%f27,	%f16
	movcs	%icc,	%i2,	%l6
	sethi	0x1925,	%g1
	andcc	%l2,	0x12CB,	%i6
	fsrc2	%f10,	%f14
	fmovrsgez	%o7,	%f2,	%f3
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	popc	0x0790,	%i1
	nop
	set	0x34, %l1
	stw	%i3,	[%l7 + %l1]
	addc	%g6,	%o2,	%g7
	movvc	%xcc,	%o4,	%o5
	subccc	%o3,	0x0607,	%i7
	movneg	%icc,	%i4,	%o1
	fmovdl	%icc,	%f25,	%f21
	subcc	%o0,	0x0A43,	%o6
	fmovsg	%icc,	%f1,	%f0
	fsrc2s	%f26,	%f29
	fmovrslez	%l0,	%f9,	%f4
	movle	%xcc,	%l3,	%i0
	fsrc1s	%f2,	%f0
	ldsh	[%l7 + 0x58],	%i5
	andncc	%g4,	%l5,	%g5
	andn	%i2,	%l4,	%g1
	fnot2s	%f4,	%f11
	movl	%icc,	%l2,	%i6
	array8	%o7,	%l6,	%g3
	srl	%g2,	0x13,	%i1
	fcmpgt32	%f2,	%f4,	%i3
	fxors	%f0,	%f2,	%f24
	udivx	%l1,	0x16BF,	%o2
	pdist	%f2,	%f22,	%f2
	restore %g7, %g6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x64],	%o4
	mulx	%i7,	0x1AE0,	%o3
	xnorcc	%i4,	0x0DF4,	%o0
	ldsb	[%l7 + 0x35],	%o1
	fpmerge	%f11,	%f24,	%f14
	lduw	[%l7 + 0x48],	%l0
	andcc	%o6,	0x0B20,	%l3
	edge32	%i5,	%i0,	%l5
	edge16ln	%g4,	%i2,	%l4
	mova	%xcc,	%g1,	%l2
	edge8l	%i6,	%o7,	%g5
	edge8ln	%l6,	%g3,	%g2
	movcs	%icc,	%i1,	%l1
	for	%f12,	%f20,	%f0
	edge8	%i3,	%g7,	%o2
	fmovdg	%xcc,	%f27,	%f11
	subccc	%g6,	0x1806,	%o5
	mulx	%i7,	%o4,	%i4
	movn	%icc,	%o3,	%o1
	mulscc	%l0,	0x146E,	%o6
	fornot2s	%f6,	%f26,	%f31
	orn	%o0,	%l3,	%i0
	addcc	%l5,	%g4,	%i5
	movvs	%icc,	%l4,	%i2
	umulcc	%l2,	0x19E9,	%g1
	edge16l	%o7,	%i6,	%l6
	sra	%g3,	%g2,	%i1
	addc	%l1,	0x1246,	%g5
	edge8ln	%i3,	%o2,	%g6
	mova	%icc,	%o5,	%i7
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	edge32	%i4,	%o3,	%l0
	andncc	%o6,	%o1,	%o0
	edge16	%l3,	%i0,	%l5
	movg	%icc,	%g4,	%i5
	movcc	%icc,	%i2,	%l4
	edge16	%l2,	%g1,	%i6
	udivcc	%o7,	0x03BD,	%g3
	subcc	%l6,	%g2,	%l1
	array8	%g5,	%i3,	%o2
	sub	%g6,	%o5,	%i1
	fmovdleu	%xcc,	%f9,	%f21
	orcc	%i7,	%o4,	%i4
	udivcc	%g7,	0x0A81,	%o3
	edge32n	%l0,	%o6,	%o0
	fpsub32s	%f15,	%f2,	%f26
	andncc	%l3,	%o1,	%i0
	fmovd	%f10,	%f0
	fandnot1	%f24,	%f28,	%f6
	move	%icc,	%l5,	%g4
	edge32l	%i5,	%l4,	%i2
	ldx	[%l7 + 0x10],	%g1
	mova	%xcc,	%l2,	%i6
	sdivx	%g3,	0x039D,	%o7
	fmovsne	%xcc,	%f9,	%f22
	edge16ln	%g2,	%l6,	%l1
	sir	0x1B69
	movg	%icc,	%i3,	%o2
	mova	%xcc,	%g6,	%g5
	ldub	[%l7 + 0x14],	%i1
	fmovrse	%o5,	%f27,	%f15
	ldsb	[%l7 + 0x5C],	%i7
	orcc	%o4,	%g7,	%i4
	sethi	0x03A4,	%l0
	movl	%icc,	%o3,	%o6
	alignaddrl	%o0,	%o1,	%i0
	movle	%icc,	%l5,	%l3
	fsrc2s	%f16,	%f23
	restore %i5, %g4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i2,	0x1DEB,	%g1
	popc	0x064E,	%l2
	or	%g3,	%o7,	%g2
	lduh	[%l7 + 0x22],	%l6
	lduh	[%l7 + 0x08],	%i6
	addcc	%l1,	%i3,	%g6
	fmuld8ulx16	%f17,	%f22,	%f26
	or	%g5,	0x122E,	%o2
	movcc	%xcc,	%i1,	%i7
	orcc	%o5,	0x1C0D,	%o4
	movleu	%icc,	%i4,	%l0
	andncc	%g7,	%o6,	%o3
	movle	%icc,	%o0,	%i0
	fsrc2s	%f20,	%f7
	st	%f23,	[%l7 + 0x54]
	fands	%f15,	%f3,	%f7
	stw	%o1,	[%l7 + 0x10]
	orn	%l5,	%l3,	%i5
	and	%l4,	%i2,	%g1
	xnor	%g4,	0x1945,	%g3
	edge8ln	%l2,	%o7,	%g2
	subcc	%l6,	0x15BD,	%i6
	srax	%i3,	%l1,	%g6
	orcc	%o2,	0x044E,	%g5
	ldd	[%l7 + 0x70],	%i6
	fmovrdlez	%i1,	%f14,	%f4
	andncc	%o5,	%i4,	%l0
	alignaddrl	%o4,	%o6,	%o3
	edge32l	%o0,	%i0,	%o1
	fors	%f5,	%f28,	%f15
	stw	%l5,	[%l7 + 0x24]
	ldd	[%l7 + 0x68],	%f10
	andncc	%l3,	%g7,	%i5
	edge16ln	%l4,	%g1,	%g4
	mova	%xcc,	%g3,	%i2
	movl	%icc,	%l2,	%g2
	fmovsvc	%icc,	%f6,	%f17
	orcc	%l6,	0x1551,	%i6
	array16	%i3,	%l1,	%o7
	udiv	%g6,	0x174E,	%o2
	orcc	%i7,	%i1,	%o5
	fone	%f30
	edge8n	%g5,	%i4,	%l0
	movgu	%icc,	%o6,	%o4
	fmovrsgz	%o3,	%f7,	%f28
	sdivcc	%o0,	0x027E,	%o1
	move	%xcc,	%i0,	%l5
	fmovsle	%icc,	%f15,	%f15
	edge16ln	%g7,	%i5,	%l4
	alignaddr	%g1,	%g4,	%g3
	fmovrsgz	%l3,	%f25,	%f12
	movrgz	%i2,	0x2FA,	%g2
	and	%l6,	0x07E6,	%i6
	andncc	%l2,	%l1,	%i3
	fmovdcc	%icc,	%f21,	%f16
	stb	%o7,	[%l7 + 0x24]
	sethi	0x0648,	%o2
	st	%f5,	[%l7 + 0x2C]
	srl	%g6,	0x00,	%i1
	sll	%o5,	%g5,	%i7
	edge8n	%l0,	%o6,	%i4
	stb	%o3,	[%l7 + 0x2D]
	fexpand	%f8,	%f6
	edge32ln	%o4,	%o0,	%i0
	sir	0x0332
	move	%xcc,	%l5,	%o1
	alignaddrl	%g7,	%i5,	%g1
	edge32	%g4,	%l4,	%l3
	xnorcc	%g3,	0x0BBC,	%i2
	udivcc	%g2,	0x069C,	%l6
	fmovrsne	%i6,	%f23,	%f7
	andcc	%l1,	0x1D8C,	%i3
	movneg	%xcc,	%l2,	%o2
	sra	%g6,	%i1,	%o7
	stb	%g5,	[%l7 + 0x61]
	fpsub16s	%f19,	%f24,	%f3
	fandnot2s	%f31,	%f18,	%f1
	fpsub16s	%f28,	%f20,	%f8
	srax	%o5,	%l0,	%i7
	sethi	0x1662,	%o6
	edge8	%o3,	%i4,	%o4
	sethi	0x01EE,	%o0
	movcs	%xcc,	%i0,	%l5
	ldsw	[%l7 + 0x74],	%g7
	st	%f17,	[%l7 + 0x40]
	fxnor	%f12,	%f22,	%f16
	movcc	%icc,	%o1,	%i5
	edge32	%g4,	%g1,	%l3
	edge16ln	%g3,	%i2,	%g2
	fcmpeq32	%f28,	%f28,	%l4
	udiv	%l6,	0x0CD0,	%l1
	and	%i3,	%i6,	%o2
	fmovsleu	%xcc,	%f27,	%f29
	mulscc	%l2,	0x0B05,	%g6
	xnorcc	%i1,	0x0D8A,	%o7
	fors	%f14,	%f11,	%f28
	ldd	[%l7 + 0x60],	%f10
	stw	%o5,	[%l7 + 0x28]
	smulcc	%l0,	0x0CD3,	%g5
	fmovsn	%icc,	%f6,	%f13
	subcc	%i7,	%o3,	%o6
	nop
	set	0x30, %g6
	ldsw	[%l7 + %g6],	%o4
	std	%f10,	[%l7 + 0x18]
	sllx	%i4,	0x06,	%o0
	orncc	%l5,	%g7,	%i0
	fone	%f14
	nop
	set	0x14, %o2
	ldub	[%l7 + %o2],	%o1
	edge16n	%i5,	%g1,	%l3
	fmovspos	%xcc,	%f11,	%f1
	movn	%icc,	%g4,	%g3
	movrne	%i2,	%g2,	%l4
	fmovsg	%xcc,	%f13,	%f23
	for	%f4,	%f24,	%f6
	fxnor	%f20,	%f2,	%f8
	sdiv	%l6,	0x11FD,	%l1
	std	%f28,	[%l7 + 0x38]
	stb	%i3,	[%l7 + 0x7C]
	sth	%i6,	[%l7 + 0x6C]
	popc	%o2,	%g6
	sdivcc	%l2,	0x1BC9,	%o7
	edge16	%i1,	%o5,	%g5
	xorcc	%l0,	%o3,	%o6
	andncc	%i7,	%i4,	%o4
	move	%xcc,	%o0,	%g7
	edge32	%l5,	%i0,	%i5
	edge16l	%o1,	%l3,	%g4
	movre	%g3,	0x252,	%g1
	udiv	%i2,	0x0F66,	%g2
	fcmpeq32	%f10,	%f6,	%l6
	and	%l4,	%l1,	%i6
	alignaddrl	%i3,	%o2,	%l2
	ldd	[%l7 + 0x70],	%g6
	fcmple32	%f4,	%f10,	%o7
	st	%f27,	[%l7 + 0x60]
	smulcc	%o5,	%g5,	%l0
	andcc	%i1,	0x14DC,	%o6
	udiv	%o3,	0x0D4C,	%i4
	edge32l	%o4,	%o0,	%g7
	movrlez	%i7,	0x294,	%i0
	andn	%i5,	0x04B3,	%o1
	movge	%icc,	%l3,	%g4
	fmul8x16al	%f7,	%f27,	%f12
	movne	%xcc,	%g3,	%l5
	fpadd32	%f6,	%f4,	%f30
	edge16	%g1,	%i2,	%l6
	lduh	[%l7 + 0x08],	%l4
	movneg	%xcc,	%l1,	%g2
	or	%i6,	%o2,	%i3
	subc	%g6,	%l2,	%o5
	stb	%o7,	[%l7 + 0x76]
	edge16l	%l0,	%g5,	%i1
	edge32	%o3,	%i4,	%o6
	ldd	[%l7 + 0x78],	%f26
	movge	%icc,	%o4,	%g7
	fmul8x16au	%f14,	%f14,	%f8
	movne	%icc,	%i7,	%i0
	movrne	%o0,	%i5,	%o1
	ldd	[%l7 + 0x30],	%f14
	array32	%l3,	%g3,	%g4
	fors	%f16,	%f21,	%f7
	fpadd16	%f0,	%f28,	%f6
	movg	%xcc,	%l5,	%i2
	ldd	[%l7 + 0x60],	%g0
	movge	%icc,	%l6,	%l1
	nop
	set	0x52, %i4
	stb	%l4,	[%l7 + %i4]
	sir	0x0556
	movrgz	%g2,	0x004,	%i6
	movge	%icc,	%o2,	%g6
	array32	%l2,	%o5,	%o7
	sir	0x19B6
	fmovrdne	%i3,	%f16,	%f30
	fsrc1s	%f10,	%f24
	edge32ln	%g5,	%l0,	%i1
	fpmerge	%f19,	%f19,	%f4
	ldsb	[%l7 + 0x73],	%i4
	array32	%o3,	%o4,	%o6
	ldx	[%l7 + 0x38],	%i7
	orncc	%g7,	0x03C5,	%i0
	movcs	%xcc,	%o0,	%i5
	fmovdcs	%icc,	%f18,	%f26
	add	%l3,	0x0164,	%g3
	sllx	%g4,	%l5,	%o1
	sdivcc	%i2,	0x05FC,	%l6
	fornot1s	%f16,	%f23,	%f21
	mulscc	%g1,	%l4,	%l1
	movcc	%icc,	%g2,	%i6
	umulcc	%o2,	0x03E8,	%l2
	edge8ln	%o5,	%g6,	%i3
	sethi	0x0408,	%o7
	subccc	%l0,	%g5,	%i4
	edge32ln	%o3,	%i1,	%o4
	movg	%icc,	%o6,	%i7
	fexpand	%f7,	%f10
	fmul8x16au	%f10,	%f13,	%f12
	movgu	%xcc,	%g7,	%i0
	srax	%o0,	%i5,	%l3
	umulcc	%g3,	%g4,	%o1
	fnands	%f23,	%f19,	%f0
	xorcc	%l5,	0x1B9D,	%i2
	movre	%g1,	%l6,	%l1
	addcc	%g2,	0x0D64,	%l4
	movrgz	%i6,	0x271,	%l2
	save %o2, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g6,	%o7,	%l0
	fsrc1	%f8,	%f16
	movn	%icc,	%i4,	%g5
	sdivcc	%o3,	0x14F4,	%i1
	save %o4, 0x151A, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f20,	%f22,	%g7
	sdivx	%o6,	0x13BF,	%o0
	ldsw	[%l7 + 0x3C],	%i0
	movcc	%xcc,	%i5,	%l3
	smul	%g4,	%o1,	%g3
	and	%i2,	0x191A,	%l5
	xorcc	%g1,	%l6,	%l1
	ldub	[%l7 + 0x67],	%g2
	fmovsn	%xcc,	%f15,	%f18
	smul	%i6,	%l2,	%o2
	sll	%l4,	%o5,	%g6
	addccc	%o7,	%l0,	%i3
	subcc	%i4,	0x1D81,	%o3
	edge16ln	%g5,	%o4,	%i1
	movrlez	%g7,	%o6,	%i7
	fmovsa	%icc,	%f16,	%f25
	sir	0x011A
	fnot1	%f0,	%f28
	orncc	%o0,	%i0,	%l3
	fzeros	%f7
	ldub	[%l7 + 0x2D],	%i5
	fmovsl	%icc,	%f11,	%f10
	movl	%icc,	%g4,	%g3
	popc	%o1,	%i2
	movvs	%icc,	%l5,	%l6
	smulcc	%l1,	0x0C83,	%g1
	edge32ln	%g2,	%l2,	%o2
	movcs	%icc,	%l4,	%i6
	srlx	%g6,	%o7,	%l0
	movneg	%icc,	%i3,	%o5
	orn	%i4,	%g5,	%o3
	fzeros	%f20
	orn	%o4,	0x04B8,	%g7
	nop
	set	0x0C, %g5
	stw	%i1,	[%l7 + %g5]
	sllx	%i7,	0x07,	%o0
	xnorcc	%i0,	%o6,	%l3
	andncc	%i5,	%g4,	%o1
	movne	%xcc,	%i2,	%l5
	fmuld8ulx16	%f17,	%f5,	%f26
	movrlez	%g3,	%l6,	%l1
	alignaddrl	%g2,	%g1,	%l2
	fmul8x16au	%f20,	%f1,	%f20
	ldsw	[%l7 + 0x48],	%o2
	sub	%l4,	0x00D1,	%g6
	sdivx	%i6,	0x10D4,	%l0
	edge8	%i3,	%o7,	%i4
	movcs	%icc,	%o5,	%o3
	fzeros	%f2
	sdiv	%g5,	0x09F4,	%g7
	edge32ln	%o4,	%i1,	%o0
	fmovsneg	%icc,	%f11,	%f0
	subccc	%i0,	0x104F,	%o6
	edge16	%l3,	%i7,	%i5
	movre	%o1,	0x147,	%g4
	edge16n	%i2,	%l5,	%l6
	sra	%g3,	%l1,	%g2
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	edge16l	%g6,	%i6,	%l0
	movcs	%icc,	%i3,	%o7
	mova	%xcc,	%g1,	%i4
	fpadd32s	%f28,	%f27,	%f21
	fmovda	%xcc,	%f30,	%f6
	std	%f4,	[%l7 + 0x28]
	movpos	%xcc,	%o5,	%g5
	orcc	%g7,	0x0685,	%o3
	or	%i1,	0x088B,	%o4
	subcc	%o0,	%o6,	%i0
	stb	%i7,	[%l7 + 0x46]
	edge16ln	%i5,	%l3,	%o1
	movvs	%xcc,	%g4,	%l5
	fmovdpos	%icc,	%f14,	%f8
	subccc	%i2,	%l6,	%l1
	move	%xcc,	%g2,	%g3
	addcc	%o2,	%l2,	%l4
	array8	%g6,	%l0,	%i3
	movne	%icc,	%i6,	%g1
	subcc	%i4,	%o5,	%g5
	fcmple16	%f8,	%f26,	%g7
	smulcc	%o3,	0x107F,	%i1
	mova	%xcc,	%o7,	%o0
	sdiv	%o4,	0x1590,	%i0
	array16	%i7,	%i5,	%l3
	srl	%o1,	%g4,	%o6
	fmovrsne	%i2,	%f25,	%f29
	fmul8sux16	%f20,	%f22,	%f4
	sra	%l6,	0x06,	%l1
	array16	%l5,	%g2,	%g3
	movrne	%l2,	0x02D,	%o2
	movrgez	%l4,	0x337,	%l0
	subc	%i3,	0x1ED3,	%i6
	edge32	%g1,	%g6,	%o5
	movvc	%icc,	%i4,	%g5
	movge	%xcc,	%o3,	%i1
	pdist	%f10,	%f18,	%f2
	fmovsa	%icc,	%f30,	%f19
	xorcc	%g7,	%o0,	%o7
	xorcc	%i0,	%i7,	%o4
	mulscc	%i5,	%o1,	%g4
	movgu	%xcc,	%o6,	%i2
	fmovsg	%icc,	%f22,	%f18
	mulscc	%l3,	%l1,	%l5
	movcs	%icc,	%g2,	%g3
	edge16ln	%l2,	%o2,	%l6
	addcc	%l4,	%l0,	%i6
	smulcc	%i3,	%g1,	%g6
	movrgz	%o5,	0x29E,	%g5
	nop
	set	0x51, %o6
	ldsb	[%l7 + %o6],	%i4
	movle	%xcc,	%i1,	%g7
	fabsd	%f6,	%f28
	fcmped	%fcc3,	%f8,	%f6
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%o0
	movgu	%icc,	%o3,	%o7
	array32	%i7,	%o4,	%i0
	udivx	%i5,	0x1D70,	%o1
	edge8l	%o6,	%i2,	%g4
	ldsb	[%l7 + 0x7F],	%l3
	move	%xcc,	%l1,	%g2
	movne	%icc,	%g3,	%l2
	movpos	%xcc,	%l5,	%o2
	movleu	%icc,	%l6,	%l0
	fandnot2	%f28,	%f18,	%f28
	fandnot1s	%f15,	%f5,	%f22
	mulscc	%l4,	%i6,	%g1
	fzero	%f8
	mova	%icc,	%g6,	%i3
	fmovsge	%xcc,	%f22,	%f10
	array32	%g5,	%o5,	%i1
	sra	%i4,	%g7,	%o0
	fcmpne32	%f4,	%f26,	%o7
	movgu	%icc,	%o3,	%i7
	smul	%o4,	%i5,	%o1
	movvs	%icc,	%i0,	%o6
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%i2
	movrgez	%l3,	0x212,	%l1
	fcmpgt16	%f26,	%f12,	%g2
	movpos	%xcc,	%g3,	%g4
	array32	%l5,	%l2,	%o2
	sra	%l0,	0x09,	%l4
	nop
	set	0x1A, %g1
	sth	%l6,	[%l7 + %g1]
	movvs	%xcc,	%g1,	%g6
	movg	%icc,	%i6,	%g5
	or	%o5,	0x1DB5,	%i3
	array32	%i4,	%i1,	%o0
	umul	%o7,	0x194D,	%o3
	edge16	%i7,	%o4,	%i5
	fpack32	%f6,	%f20,	%f0
	udivcc	%g7,	0x1833,	%i0
	ldsh	[%l7 + 0x1C],	%o1
	subccc	%o6,	%i2,	%l1
	srl	%l3,	%g3,	%g4
	edge16n	%g2,	%l2,	%l5
	addccc	%o2,	%l0,	%l6
	fmul8x16al	%f6,	%f19,	%f20
	edge32ln	%g1,	%l4,	%g6
	udivcc	%i6,	0x1D4D,	%g5
	or	%i3,	%i4,	%o5
	mulscc	%o0,	0x13E2,	%i1
	fmovs	%f1,	%f22
	fpsub16	%f4,	%f6,	%f18
	fmovdcc	%icc,	%f12,	%f28
	movrne	%o7,	0x074,	%o3
	sth	%o4,	[%l7 + 0x4A]
	alignaddrl	%i5,	%g7,	%i0
	edge8n	%i7,	%o1,	%i2
	fmovdn	%xcc,	%f16,	%f21
	array8	%o6,	%l1,	%g3
	fmovs	%f13,	%f10
	movle	%xcc,	%l3,	%g4
	subccc	%g2,	0x0D4D,	%l2
	array8	%l5,	%l0,	%l6
	addc	%g1,	%o2,	%l4
	sra	%i6,	0x00,	%g6
	fmuld8ulx16	%f4,	%f15,	%f12
	fcmps	%fcc0,	%f17,	%f8
	fcmpne32	%f22,	%f8,	%g5
	movl	%xcc,	%i3,	%i4
	array8	%o5,	%o0,	%i1
	edge8l	%o7,	%o4,	%i5
	umulcc	%g7,	0x1975,	%o3
	movn	%icc,	%i7,	%i0
	smulcc	%o1,	%o6,	%i2
	movrlz	%l1,	%g3,	%l3
	movneg	%xcc,	%g4,	%l2
	fexpand	%f12,	%f26
	movrgez	%g2,	%l0,	%l5
	sdivx	%l6,	0x001B,	%o2
	umul	%g1,	%i6,	%l4
	movleu	%icc,	%g6,	%i3
	ldsh	[%l7 + 0x5C],	%i4
	mulscc	%o5,	%g5,	%o0
	fmovspos	%xcc,	%f12,	%f12
	array32	%i1,	%o4,	%i5
	stb	%g7,	[%l7 + 0x68]
	fcmpeq32	%f12,	%f30,	%o7
	mulx	%o3,	0x0258,	%i7
	sra	%i0,	0x19,	%o1
	ld	[%l7 + 0x3C],	%f11
	lduh	[%l7 + 0x28],	%i2
	fmovsn	%xcc,	%f28,	%f20
	fsrc1s	%f23,	%f16
	array8	%o6,	%g3,	%l3
	movge	%xcc,	%l1,	%g4
	fmul8x16al	%f3,	%f23,	%f0
	xnorcc	%g2,	0x1BB2,	%l0
	movre	%l2,	%l5,	%o2
	mulscc	%g1,	%l6,	%i6
	udivcc	%l4,	0x1631,	%i3
	edge32n	%i4,	%g6,	%g5
	sll	%o5,	0x0B,	%o0
	edge32ln	%o4,	%i5,	%g7
	or	%o7,	0x135E,	%i1
	movrgez	%i7,	0x1A8,	%i0
	srax	%o3,	0x03,	%i2
	fnors	%f8,	%f24,	%f15
	srax	%o1,	%g3,	%l3
	movvc	%xcc,	%o6,	%g4
	move	%icc,	%g2,	%l0
	andcc	%l1,	%l5,	%l2
	mulscc	%g1,	%l6,	%i6
	st	%f16,	[%l7 + 0x7C]
	array16	%l4,	%o2,	%i4
	nop
	set	0x60, %o3
	std	%f24,	[%l7 + %o3]
	movleu	%icc,	%g6,	%i3
	fmuld8sux16	%f28,	%f10,	%f0
	sll	%g5,	%o5,	%o4
	add	%i5,	0x0E56,	%o0
	or	%g7,	%i1,	%o7
	sllx	%i0,	0x14,	%i7
	mova	%xcc,	%i2,	%o1
	ldsw	[%l7 + 0x7C],	%o3
	fmuld8sux16	%f5,	%f7,	%f10
	andn	%l3,	%g3,	%g4
	fnot2	%f14,	%f26
	array16	%g2,	%l0,	%o6
	udivcc	%l1,	0x15A3,	%l5
	edge32ln	%l2,	%l6,	%g1
	movrlez	%i6,	%l4,	%i4
	orn	%g6,	0x13DA,	%o2
	mulx	%g5,	0x097C,	%o5
	subcc	%i3,	0x1D46,	%i5
	fcmpne32	%f12,	%f18,	%o4
	or	%g7,	0x08BB,	%o0
	ldsh	[%l7 + 0x1E],	%i1
	mulscc	%o7,	%i0,	%i7
	for	%f6,	%f0,	%f30
	fmovrdlez	%o1,	%f24,	%f26
	fnors	%f2,	%f12,	%f4
	add	%i2,	0x1103,	%l3
	ldsb	[%l7 + 0x4E],	%g3
	sdivx	%o3,	0x1692,	%g4
	subccc	%l0,	%g2,	%o6
	udiv	%l1,	0x19F9,	%l5
	fnors	%f30,	%f28,	%f4
	movrgz	%l2,	0x1C6,	%g1
	sir	0x0768
	edge32	%i6,	%l4,	%i4
	sll	%l6,	0x17,	%o2
	fpadd16s	%f29,	%f14,	%f14
	srl	%g5,	0x19,	%g6
	fmovdcc	%icc,	%f21,	%f19
	fcmpgt32	%f12,	%f22,	%o5
	ldsh	[%l7 + 0x48],	%i5
	ldsh	[%l7 + 0x26],	%o4
	ldsb	[%l7 + 0x52],	%i3
	fsrc1s	%f31,	%f29
	std	%f12,	[%l7 + 0x20]
	sethi	0x1BC7,	%o0
	restore %i1, %g7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i0,	%f22,	%f2
	save %i7, %o1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%l2
	move	%icc,	%o3,	%g3
	smulcc	%l0,	%g2,	%g4
	srl	%o6,	0x17,	%l1
	edge8l	%l2,	%l5,	%i6
	movvs	%icc,	%l4,	%i4
	srax	%g1,	%o2,	%l6
	edge32ln	%g5,	%g6,	%i5
	fones	%f22
	andncc	%o4,	%i3,	%o0
	movrgez	%o5,	0x10C,	%g7
	array16	%o7,	%i1,	%i7
	sdivcc	%i0,	0x1740,	%i2
	mova	%icc,	%l3,	%o1
	ldsw	[%l7 + 0x68],	%g3
	umul	%o3,	%g2,	%g4
	movcs	%xcc,	%l0,	%l1
	fandnot1s	%f28,	%f13,	%f24
	stw	%o6,	[%l7 + 0x70]
	fpadd16	%f6,	%f8,	%f30
	edge32ln	%l5,	%i6,	%l4
	lduw	[%l7 + 0x74],	%i4
	edge16	%l2,	%g1,	%o2
	xnorcc	%l6,	0x03D3,	%g5
	orn	%i5,	0x132A,	%g6
	fmovdg	%xcc,	%f9,	%f10
	movcc	%icc,	%i3,	%o4
	edge16n	%o5,	%o0,	%g7
	xnor	%o7,	0x04AA,	%i1
	edge16l	%i7,	%i0,	%l3
	siam	0x7
	fones	%f12
	stb	%i2,	[%l7 + 0x28]
	ldd	[%l7 + 0x50],	%g2
	xnorcc	%o1,	0x1094,	%g2
	xnor	%g4,	0x0830,	%o3
	array16	%l0,	%l1,	%l5
	fxor	%f0,	%f24,	%f22
	fmovdne	%xcc,	%f10,	%f1
	edge32ln	%i6,	%l4,	%o6
	movrlz	%i4,	%g1,	%o2
	move	%xcc,	%l2,	%l6
	xnorcc	%i5,	0x1538,	%g5
	xnor	%i3,	%o4,	%o5
	srlx	%o0,	0x08,	%g7
	edge8ln	%o7,	%i1,	%i7
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	fzeros	%f25
	fmovrsne	%g3,	%f3,	%f19
	orn	%i2,	0x06E2,	%g2
	addcc	%o1,	0x0377,	%o3
	mulscc	%l0,	0x0873,	%l1
	edge32l	%l5,	%i6,	%g4
	fmul8x16au	%f10,	%f23,	%f0
	lduh	[%l7 + 0x46],	%o6
	fcmpeq32	%f14,	%f26,	%i4
	movre	%l4,	0x22A,	%o2
	fpackfix	%f30,	%f22
	movn	%icc,	%g1,	%l6
	edge32ln	%i5,	%l2,	%i3
	and	%o4,	0x15D9,	%g5
	srl	%o5,	%o0,	%o7
	or	%i1,	0x19ED,	%g7
	fzeros	%f17
	movrgez	%i7,	0x3F0,	%g6
	movrne	%i0,	0x0C7,	%l3
	add	%i2,	0x1911,	%g3
	edge8	%o1,	%o3,	%g2
	xor	%l1,	0x1844,	%l0
	mova	%icc,	%l5,	%g4
	movrlez	%o6,	0x119,	%i6
	fmovrsgz	%i4,	%f11,	%f25
	movvc	%xcc,	%l4,	%g1
	ldsw	[%l7 + 0x08],	%l6
	movvs	%xcc,	%i5,	%o2
	movrgz	%i3,	0x14D,	%l2
	save %o4, 0x1B7B, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g5,	%f18,	%f2
	and	%o0,	%o7,	%i1
	fmovd	%f30,	%f20
	fmul8ulx16	%f2,	%f30,	%f18
	movg	%icc,	%g7,	%g6
	movn	%icc,	%i0,	%l3
	xorcc	%i7,	0x1CB5,	%i2
	array16	%g3,	%o1,	%g2
	fmovsa	%icc,	%f7,	%f9
	movcc	%xcc,	%o3,	%l0
	sethi	0x0F95,	%l1
	edge16	%l5,	%g4,	%o6
	ldsh	[%l7 + 0x34],	%i4
	fandnot2	%f2,	%f20,	%f30
	ldsb	[%l7 + 0x27],	%l4
	sth	%g1,	[%l7 + 0x6C]
	andncc	%i6,	%l6,	%i5
	xnorcc	%i3,	0x002A,	%l2
	movrgz	%o2,	0x13C,	%o4
	ldsb	[%l7 + 0x42],	%o5
	movrgez	%o0,	%o7,	%g5
	add	%g7,	%g6,	%i0
	mulscc	%i1,	%l3,	%i2
	udiv	%g3,	0x19F1,	%o1
	movl	%icc,	%i7,	%o3
	ldd	[%l7 + 0x30],	%l0
	movpos	%icc,	%g2,	%l5
	mulx	%g4,	0x1EE2,	%o6
	udivcc	%l1,	0x032D,	%l4
	andcc	%g1,	0x0C56,	%i6
	sdivx	%l6,	0x1A15,	%i4
	edge8ln	%i5,	%l2,	%i3
	udiv	%o4,	0x0287,	%o2
	movrgez	%o5,	%o7,	%g5
	movpos	%xcc,	%o0,	%g6
	std	%f30,	[%l7 + 0x58]
	fmovsvs	%icc,	%f24,	%f27
	movl	%xcc,	%i0,	%g7
	and	%l3,	%i2,	%i1
	sll	%o1,	%i7,	%g3
	sllx	%o3,	%l0,	%g2
	fors	%f22,	%f9,	%f26
	edge16l	%g4,	%o6,	%l5
	alignaddrl	%l1,	%g1,	%l4
	edge32n	%l6,	%i6,	%i5
	stw	%i4,	[%l7 + 0x1C]
	stw	%l2,	[%l7 + 0x34]
	sdivcc	%o4,	0x014F,	%i3
	fmovdcc	%icc,	%f7,	%f27
	sdiv	%o5,	0x0DC1,	%o7
	fabsd	%f8,	%f12
	alignaddrl	%g5,	%o2,	%g6
	addc	%o0,	%i0,	%g7
	movg	%icc,	%i2,	%l3
	nop
	set	0x64, %g7
	stw	%o1,	[%l7 + %g7]
	fcmped	%fcc3,	%f2,	%f16
	addcc	%i7,	%g3,	%o3
	srlx	%i1,	%g2,	%l0
	movcc	%icc,	%g4,	%o6
	umul	%l1,	0x0D7D,	%g1
	movl	%xcc,	%l4,	%l6
	stw	%l5,	[%l7 + 0x24]
	sth	%i5,	[%l7 + 0x72]
	movcs	%xcc,	%i6,	%l2
	lduh	[%l7 + 0x20],	%o4
	fabss	%f6,	%f0
	array8	%i4,	%i3,	%o7
	nop
	set	0x1D, %i0
	stb	%g5,	[%l7 + %i0]
	smulcc	%o5,	%g6,	%o0
	udivcc	%o2,	0x1999,	%i0
	ldd	[%l7 + 0x20],	%i2
	orn	%g7,	0x1345,	%l3
	fpadd16	%f8,	%f12,	%f22
	sub	%o1,	%i7,	%g3
	orn	%i1,	%g2,	%l0
	orn	%g4,	%o6,	%l1
	ld	[%l7 + 0x10],	%f15
	addcc	%g1,	0x1D78,	%l4
	fcmped	%fcc2,	%f26,	%f18
	fnands	%f31,	%f11,	%f13
	movneg	%icc,	%l6,	%l5
	fornot1s	%f5,	%f23,	%f19
	sdiv	%i5,	0x06FD,	%o3
	fnot1	%f4,	%f18
	fmovsneg	%xcc,	%f20,	%f7
	fcmpd	%fcc3,	%f22,	%f26
	std	%f6,	[%l7 + 0x78]
	restore %i6, %l2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f28,	%f8,	%f10
	edge16l	%o4,	%i3,	%g5
	edge32	%o7,	%o5,	%g6
	fpack32	%f12,	%f8,	%f14
	udiv	%o0,	0x1F64,	%o2
	fmovdl	%xcc,	%f29,	%f13
	fors	%f25,	%f6,	%f31
	andncc	%i0,	%g7,	%i2
	stx	%o1,	[%l7 + 0x18]
	andcc	%i7,	%g3,	%i1
	fmovsvc	%xcc,	%f30,	%f31
	movrne	%l3,	0x06B,	%g2
	alignaddrl	%g4,	%o6,	%l0
	fpack32	%f20,	%f4,	%f18
	addccc	%l1,	%g1,	%l4
	st	%f16,	[%l7 + 0x2C]
	srlx	%l6,	%l5,	%o3
	udiv	%i6,	0x055B,	%l2
	stx	%i4,	[%l7 + 0x58]
	sdivcc	%o4,	0x15EC,	%i5
	lduw	[%l7 + 0x40],	%g5
	save %i3, %o5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f6,	%f0
	fmovda	%xcc,	%f26,	%f23
	sethi	0x1888,	%o0
	andcc	%o2,	0x070A,	%i0
	mulx	%g7,	0x0CAD,	%i2
	xnorcc	%o1,	%g6,	%g3
	add	%i1,	%l3,	%i7
	stb	%g2,	[%l7 + 0x17]
	sdiv	%g4,	0x1408,	%l0
	ldsh	[%l7 + 0x3E],	%l1
	subcc	%g1,	%o6,	%l4
	fpadd16	%f10,	%f8,	%f26
	ldub	[%l7 + 0x38],	%l5
	edge32l	%o3,	%l6,	%i6
	lduh	[%l7 + 0x7C],	%l2
	smul	%i4,	0x1CBC,	%i5
	mulscc	%o4,	%i3,	%g5
	fnegs	%f15,	%f2
	movneg	%xcc,	%o7,	%o0
	fone	%f18
	fmovdvs	%icc,	%f10,	%f2
	edge32l	%o2,	%o5,	%g7
	array8	%i0,	%o1,	%g6
	ldsw	[%l7 + 0x54],	%i2
	fmovrse	%i1,	%f25,	%f27
	move	%xcc,	%g3,	%i7
	ldsw	[%l7 + 0x50],	%l3
	ldsh	[%l7 + 0x28],	%g2
	fmovscs	%xcc,	%f9,	%f17
	fpack32	%f26,	%f28,	%f26
	mova	%icc,	%g4,	%l0
	subc	%l1,	%g1,	%l4
	ldsb	[%l7 + 0x57],	%o6
	array32	%o3,	%l6,	%l5
	popc	0x13EA,	%i6
	srlx	%l2,	0x1A,	%i4
	addccc	%i5,	0x1740,	%o4
	fpadd16	%f4,	%f22,	%f24
	fmovdg	%icc,	%f10,	%f29
	ldsw	[%l7 + 0x54],	%g5
	mova	%xcc,	%i3,	%o7
	fandnot2s	%f23,	%f4,	%f23
	addc	%o2,	0x1745,	%o0
	orcc	%g7,	0x0A65,	%i0
	edge8l	%o5,	%g6,	%i2
	fpadd32	%f30,	%f20,	%f6
	srax	%o1,	0x09,	%g3
	andn	%i7,	%l3,	%g2
	srax	%i1,	0x1D,	%l0
	edge16l	%g4,	%l1,	%l4
	movvs	%xcc,	%o6,	%o3
	fxor	%f30,	%f22,	%f8
	add	%g1,	0x1EA7,	%l5
	edge8l	%i6,	%l6,	%l2
	fandnot2s	%f30,	%f25,	%f11
	udivcc	%i4,	0x0AE7,	%o4
	addcc	%g5,	%i5,	%o7
	stb	%o2,	[%l7 + 0x09]
	fmovsne	%icc,	%f3,	%f31
	lduh	[%l7 + 0x3C],	%i3
	movcs	%xcc,	%g7,	%o0
	fmovsne	%xcc,	%f26,	%f4
	udiv	%o5,	0x017A,	%g6
	addc	%i2,	0x15AA,	%i0
	fmovrsne	%o1,	%f19,	%f1
	alignaddrl	%i7,	%g3,	%l3
	fnot1	%f26,	%f10
	fpsub16	%f14,	%f2,	%f14
	srax	%g2,	0x08,	%i1
	fmovscc	%icc,	%f16,	%f6
	array16	%g4,	%l1,	%l0
	movrlez	%o6,	%o3,	%g1
	fmovrsgz	%l4,	%f19,	%f4
	udivcc	%i6,	0x0340,	%l6
	st	%f4,	[%l7 + 0x74]
	fnor	%f30,	%f16,	%f26
	for	%f6,	%f16,	%f16
	fmovrdgez	%l5,	%f24,	%f24
	fmovsl	%xcc,	%f18,	%f17
	sdivx	%l2,	0x020C,	%o4
	mulx	%g5,	0x1881,	%i5
	movle	%xcc,	%i4,	%o7
	edge8n	%o2,	%i3,	%g7
	edge8l	%o5,	%g6,	%i2
	fmovsneg	%xcc,	%f21,	%f15
	ldsw	[%l7 + 0x50],	%o0
	fornot1	%f18,	%f14,	%f12
	mulx	%i0,	%o1,	%g3
	udivx	%l3,	0x1FBC,	%i7
	sll	%i1,	0x18,	%g4
	srax	%l1,	%l0,	%g2
	sra	%o3,	%g1,	%l4
	orncc	%i6,	0x0F9A,	%l6
	movre	%o6,	0x253,	%l2
	mova	%xcc,	%l5,	%o4
	movcs	%icc,	%g5,	%i5
	ldx	[%l7 + 0x08],	%o7
	fandnot2	%f22,	%f28,	%f16
	fone	%f8
	fcmpeq16	%f2,	%f16,	%o2
	smul	%i3,	0x0A8D,	%i4
	fpsub32s	%f26,	%f12,	%f29
	movrgez	%o5,	0x3E2,	%g6
	fmul8x16au	%f0,	%f22,	%f26
	movvs	%xcc,	%g7,	%i2
	umul	%o0,	0x0A46,	%o1
	subcc	%i0,	0x0F9C,	%g3
	fornot1	%f0,	%f30,	%f28
	movge	%icc,	%i7,	%i1
	subccc	%g4,	0x1C4D,	%l1
	fones	%f10
	array16	%l3,	%l0,	%g2
	sra	%o3,	%l4,	%g1
	mulscc	%i6,	0x1047,	%o6
	and	%l2,	0x12CE,	%l6
	fmovdvc	%icc,	%f11,	%f31
	andncc	%l5,	%o4,	%g5
	fmovdneg	%icc,	%f15,	%f31
	mulscc	%o7,	0x0705,	%o2
	fmovspos	%xcc,	%f11,	%f17
	mulscc	%i3,	0x0144,	%i4
	ldsw	[%l7 + 0x58],	%i5
	andncc	%g6,	%g7,	%o5
	orncc	%i2,	0x10A5,	%o0
	and	%o1,	%i0,	%i7
	orcc	%i1,	%g4,	%g3
	save %l1, 0x121F, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g2,	[%l7 + 0x75]
	array16	%o3,	%l4,	%g1
	fone	%f30
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%f16
	alignaddr	%l0,	%i6,	%l2
	array8	%l6,	%o6,	%l5
	edge32ln	%o4,	%g5,	%o7
	xnor	%i3,	%i4,	%i5
	fones	%f22
	fmovs	%f30,	%f9
	add	%g6,	0x1EC8,	%o2
	edge8	%o5,	%g7,	%o0
	smulcc	%o1,	%i0,	%i2
	fmovsa	%icc,	%f11,	%f8
	movcs	%icc,	%i1,	%i7
	fand	%f14,	%f26,	%f8
	fcmpgt16	%f24,	%f22,	%g3
	nop
	set	0x54, %o7
	stw	%l1,	[%l7 + %o7]
	subcc	%g4,	0x1775,	%g2
	ldub	[%l7 + 0x2F],	%o3
	fmovrdlez	%l3,	%f28,	%f18
	subc	%l4,	0x197D,	%l0
	fmovdneg	%xcc,	%f0,	%f2
	udiv	%i6,	0x08A9,	%l2
	fpsub32s	%f15,	%f8,	%f21
	xor	%g1,	%l6,	%o6
	ldsw	[%l7 + 0x68],	%l5
	move	%xcc,	%o4,	%g5
	ldd	[%l7 + 0x28],	%i2
	edge16	%o7,	%i4,	%i5
	ldub	[%l7 + 0x72],	%o2
	xnorcc	%o5,	%g7,	%o0
	sllx	%g6,	%i0,	%o1
	array8	%i2,	%i1,	%g3
	stb	%i7,	[%l7 + 0x0F]
	fpadd16s	%f18,	%f1,	%f4
	smul	%l1,	%g2,	%o3
	movrlz	%l3,	%g4,	%l4
	ldx	[%l7 + 0x20],	%l0
	movgu	%xcc,	%i6,	%l2
	array32	%l6,	%g1,	%o6
	srax	%o4,	%l5,	%i3
	st	%f13,	[%l7 + 0x5C]
	sdivx	%g5,	0x1563,	%i4
	fnand	%f30,	%f30,	%f22
	sth	%i5,	[%l7 + 0x42]
	bshuffle	%f28,	%f28,	%f0
	sir	0x10AE
	fpadd16s	%f26,	%f3,	%f28
	edge32ln	%o7,	%o5,	%o2
	fnot1	%f12,	%f10
	movle	%xcc,	%o0,	%g7
	movg	%xcc,	%i0,	%g6
	array16	%o1,	%i2,	%g3
	fpsub16s	%f14,	%f17,	%f31
	subc	%i7,	0x15A2,	%i1
	srax	%l1,	0x00,	%o3
	fandnot2	%f22,	%f26,	%f2
	andncc	%g2,	%g4,	%l4
	st	%f1,	[%l7 + 0x24]
	movg	%xcc,	%l3,	%i6
	orn	%l0,	%l2,	%g1
	lduh	[%l7 + 0x64],	%o6
	edge32ln	%o4,	%l5,	%l6
	edge16ln	%i3,	%i4,	%i5
	movvs	%xcc,	%g5,	%o5
	sllx	%o2,	0x1C,	%o7
	edge8l	%o0,	%i0,	%g6
	subccc	%o1,	%i2,	%g7
	sll	%g3,	%i7,	%i1
	orcc	%o3,	0x1370,	%l1
	array16	%g2,	%g4,	%l3
	fcmpne32	%f20,	%f4,	%l4
	fcmpne32	%f22,	%f12,	%i6
	udivx	%l2,	0x1A2C,	%g1
	alignaddr	%o6,	%o4,	%l0
	subc	%l6,	%i3,	%l5
	udivcc	%i5,	0x16F0,	%g5
	ldsh	[%l7 + 0x08],	%o5
	movre	%i4,	0x1E1,	%o7
	movrgz	%o0,	0x191,	%i0
	fpsub16s	%f18,	%f11,	%f18
	array16	%o2,	%g6,	%o1
	movl	%icc,	%g7,	%g3
	edge8ln	%i2,	%i7,	%i1
	smul	%l1,	%g2,	%g4
	movl	%xcc,	%l3,	%l4
	edge16n	%i6,	%l2,	%g1
	sdiv	%o6,	0x1C27,	%o3
	fmovsle	%xcc,	%f17,	%f29
	fandnot2	%f6,	%f14,	%f4
	mulscc	%o4,	0x036A,	%l0
	movg	%xcc,	%l6,	%l5
	movrne	%i5,	0x02A,	%i3
	addc	%g5,	%o5,	%o7
	fxnor	%f28,	%f8,	%f18
	xnorcc	%i4,	0x1044,	%i0
	fandnot1s	%f11,	%f12,	%f1
	fmuld8sux16	%f22,	%f7,	%f2
	ldx	[%l7 + 0x10],	%o0
	mova	%icc,	%g6,	%o2
	edge8ln	%g7,	%o1,	%g3
	fnands	%f11,	%f8,	%f6
	mova	%xcc,	%i2,	%i7
	or	%i1,	0x19C1,	%g2
	movneg	%icc,	%l1,	%l3
	xnorcc	%l4,	%i6,	%l2
	ldd	[%l7 + 0x40],	%g0
	bshuffle	%f28,	%f24,	%f10
	nop
	set	0x28, %o1
	stx	%g4,	[%l7 + %o1]
	movre	%o3,	%o4,	%l0
	array16	%o6,	%l5,	%l6
	popc	%i3,	%i5
	array16	%o5,	%g5,	%o7
	addcc	%i0,	%i4,	%o0
	fcmple16	%f2,	%f16,	%g6
	ld	[%l7 + 0x30],	%f27
	sra	%g7,	%o2,	%g3
	xorcc	%o1,	0x0647,	%i2
	lduw	[%l7 + 0x18],	%i7
	edge16	%g2,	%l1,	%l3
	sdivcc	%i1,	0x1C2E,	%l4
	sdivcc	%i6,	0x13E4,	%g1
	edge8n	%g4,	%o3,	%o4
	st	%f9,	[%l7 + 0x78]
	movleu	%icc,	%l2,	%o6
	sllx	%l5,	0x13,	%l0
	ld	[%l7 + 0x70],	%f11
	fmovsl	%icc,	%f30,	%f1
	ldub	[%l7 + 0x53],	%i3
	array32	%l6,	%o5,	%g5
	edge8	%o7,	%i5,	%i0
	umulcc	%i4,	0x1641,	%o0
	fxor	%f20,	%f6,	%f14
	or	%g6,	%g7,	%o2
	fmovrsgez	%o1,	%f23,	%f8
	stx	%g3,	[%l7 + 0x20]
	xnorcc	%i2,	%g2,	%l1
	movpos	%icc,	%l3,	%i1
	mova	%icc,	%i7,	%l4
	movle	%xcc,	%g1,	%g4
	ldx	[%l7 + 0x78],	%o3
	movvs	%icc,	%i6,	%o4
	fmuld8sux16	%f12,	%f19,	%f24
	fsrc2	%f24,	%f16
	fpsub32	%f2,	%f16,	%f22
	movvs	%xcc,	%o6,	%l5
	ld	[%l7 + 0x1C],	%f9
	movrlez	%l0,	0x296,	%l2
	ldd	[%l7 + 0x70],	%i2
	sub	%o5,	%l6,	%o7
	addccc	%g5,	0x1BE1,	%i5
	edge16n	%i0,	%i4,	%g6
	andn	%g7,	%o0,	%o1
	movrgez	%g3,	0x1F4,	%o2
	umul	%g2,	0x1133,	%i2
	edge32l	%l1,	%l3,	%i1
	fandnot2s	%f15,	%f24,	%f17
	fnand	%f4,	%f20,	%f10
	fmovdle	%icc,	%f11,	%f24
	subccc	%l4,	%g1,	%g4
	ld	[%l7 + 0x60],	%f28
	srl	%o3,	0x1D,	%i7
	umul	%o4,	%i6,	%o6
	movge	%xcc,	%l0,	%l5
	xorcc	%l2,	0x0D94,	%o5
	lduh	[%l7 + 0x4E],	%i3
	xorcc	%o7,	%l6,	%g5
	andcc	%i5,	%i4,	%g6
	fpsub32s	%f27,	%f24,	%f28
	movvs	%icc,	%i0,	%o0
	movgu	%icc,	%o1,	%g7
	stw	%g3,	[%l7 + 0x74]
	fmul8x16al	%f16,	%f26,	%f2
	mulscc	%g2,	0x0FCE,	%o2
	edge16	%l1,	%i2,	%i1
	nop
	set	0x28, %i6
	stw	%l4,	[%l7 + %i6]
	movre	%g1,	0x159,	%g4
	movcs	%xcc,	%l3,	%o3
	edge8n	%i7,	%i6,	%o6
	fmovsleu	%xcc,	%f2,	%f21
	movcs	%icc,	%o4,	%l5
	stx	%l2,	[%l7 + 0x30]
	movge	%icc,	%l0,	%o5
	fnand	%f14,	%f16,	%f10
	std	%f10,	[%l7 + 0x18]
	stb	%o7,	[%l7 + 0x54]
	ldub	[%l7 + 0x67],	%l6
	or	%i3,	%g5,	%i4
	lduw	[%l7 + 0x44],	%g6
	nop
	set	0x2E, %o5
	lduh	[%l7 + %o5],	%i5
	stx	%i0,	[%l7 + 0x48]
	xnorcc	%o0,	0x0337,	%g7
	ld	[%l7 + 0x14],	%f6
	edge8l	%g3,	%g2,	%o2
	subc	%o1,	0x023B,	%i2
	fsrc2	%f6,	%f12
	udiv	%i1,	0x11D4,	%l1
	movge	%xcc,	%g1,	%l4
	srl	%l3,	%o3,	%g4
	nop
	set	0x10, %g3
	std	%f16,	[%l7 + %g3]
	sdiv	%i6,	0x1C7A,	%i7
	movcc	%xcc,	%o4,	%l5
	ldsw	[%l7 + 0x4C],	%l2
	sub	%l0,	0x0420,	%o6
	sra	%o5,	%l6,	%i3
	andcc	%g5,	0x1C38,	%o7
	andcc	%g6,	%i4,	%i0
	fmovrdgez	%i5,	%f2,	%f4
	movg	%xcc,	%g7,	%o0
	fzeros	%f19
	sth	%g3,	[%l7 + 0x2E]
	umul	%g2,	%o2,	%i2
	alignaddrl	%i1,	%o1,	%l1
	edge8	%l4,	%g1,	%o3
	stb	%l3,	[%l7 + 0x23]
	fmovrdgez	%g4,	%f24,	%f24
	xorcc	%i6,	0x14A9,	%i7
	nop
	set	0x30, %g4
	stw	%l5,	[%l7 + %g4]
	fsrc1	%f18,	%f0
	fmovrsgz	%o4,	%f8,	%f25
	sra	%l2,	%o6,	%l0
	stb	%l6,	[%l7 + 0x0A]
	fpadd32	%f22,	%f12,	%f18
	movrgz	%o5,	%i3,	%o7
	edge8l	%g6,	%g5,	%i0
	std	%f22,	[%l7 + 0x70]
	sra	%i4,	0x13,	%g7
	lduh	[%l7 + 0x12],	%o0
	movcc	%icc,	%i5,	%g3
	sth	%o2,	[%l7 + 0x4A]
	fmovdg	%icc,	%f18,	%f26
	udivcc	%i2,	0x1E27,	%i1
	ldub	[%l7 + 0x1D],	%g2
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	sth	%o3,	[%l7 + 0x66]
	sllx	%g1,	0x14,	%g4
	movrlez	%i6,	%l3,	%i7
	edge32	%l5,	%l2,	%o6
	alignaddr	%l0,	%o4,	%o5
	ld	[%l7 + 0x58],	%f13
	udiv	%l6,	0x0D3F,	%o7
	srax	%g6,	%i3,	%i0
	edge8	%i4,	%g7,	%g5
	fcmpne16	%f16,	%f4,	%i5
	edge32ln	%g3,	%o2,	%o0
	lduw	[%l7 + 0x14],	%i2
	sdivcc	%g2,	0x0701,	%l1
	sir	0x17E1
	nop
	set	0x10, %i7
	ldsh	[%l7 + %i7],	%l4
	array16	%o1,	%i1,	%g1
	array32	%g4,	%i6,	%l3
	fmovrslz	%i7,	%f7,	%f17
	or	%o3,	0x0508,	%l2
	movgu	%xcc,	%l5,	%o6
	mova	%xcc,	%o4,	%l0
	ldsw	[%l7 + 0x1C],	%l6
	pdist	%f30,	%f20,	%f10
	edge32l	%o5,	%o7,	%i3
	st	%f17,	[%l7 + 0x14]
	ldub	[%l7 + 0x36],	%i0
	ldub	[%l7 + 0x21],	%g6
	ldsh	[%l7 + 0x2A],	%g7
	ldub	[%l7 + 0x5F],	%g5
	sra	%i5,	0x00,	%g3
	fmovdn	%icc,	%f19,	%f26
	subc	%i4,	0x18B7,	%o2
	edge16ln	%o0,	%i2,	%g2
	udiv	%l4,	0x1385,	%l1
	addccc	%i1,	0x072F,	%g1
	edge16	%g4,	%o1,	%i6
	movrne	%i7,	0x011,	%l3
	fmovdcc	%xcc,	%f28,	%f27
	ldsw	[%l7 + 0x2C],	%o3
	fmovrsgez	%l5,	%f19,	%f13
	fxnors	%f26,	%f18,	%f27
	sethi	0x10D0,	%l2
	sllx	%o4,	%o6,	%l6
	andcc	%l0,	%o5,	%o7
	movleu	%icc,	%i3,	%i0
	addccc	%g7,	0x1C62,	%g5
	edge16	%g6,	%g3,	%i5
	umulcc	%i4,	0x0594,	%o0
	fmovdvs	%icc,	%f2,	%f9
	movge	%icc,	%i2,	%o2
	edge32	%l4,	%l1,	%i1
	movne	%icc,	%g2,	%g4
	xnor	%o1,	0x072A,	%i6
	array8	%i7,	%g1,	%o3
	alignaddrl	%l3,	%l2,	%l5
	movneg	%icc,	%o6,	%o4
	movcc	%icc,	%l0,	%o5
	edge8n	%o7,	%i3,	%i0
	movrgz	%g7,	%l6,	%g5
	sdiv	%g3,	0x00B1,	%i5
	subccc	%g6,	%i4,	%o0
	movpos	%icc,	%o2,	%l4
	st	%f7,	[%l7 + 0x08]
	fandnot2	%f28,	%f22,	%f10
	fcmpes	%fcc0,	%f3,	%f29
	movge	%xcc,	%l1,	%i2
	fmovscs	%icc,	%f18,	%f28
	fmul8x16al	%f18,	%f16,	%f8
	addc	%i1,	0x0255,	%g4
	fmul8sux16	%f10,	%f6,	%f24
	fmovse	%xcc,	%f27,	%f11
	udiv	%g2,	0x1C0E,	%i6
	lduh	[%l7 + 0x16],	%o1
	umulcc	%g1,	%o3,	%i7
	smul	%l2,	%l3,	%l5
	edge32	%o4,	%l0,	%o5
	edge8l	%o6,	%o7,	%i3
	edge16l	%g7,	%l6,	%i0
	movleu	%xcc,	%g3,	%i5
	fcmpne32	%f4,	%f20,	%g6
	alignaddrl	%g5,	%i4,	%o2
	ld	[%l7 + 0x6C],	%f7
	edge16l	%l4,	%l1,	%i2
	andn	%o0,	%g4,	%i1
	save %i6, %o1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g1, %o3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l2,	0x1C7C,	%l3
	umul	%o4,	%l5,	%o5
	fmovdleu	%icc,	%f16,	%f27
	edge8	%o6,	%o7,	%i3
	fmovda	%icc,	%f3,	%f18
	fmovsleu	%icc,	%f23,	%f25
	sir	0x0D48
	fmovscc	%icc,	%f1,	%f12
	sub	%g7,	%l0,	%l6
	movvc	%icc,	%i0,	%i5
	st	%f18,	[%l7 + 0x34]
	ldx	[%l7 + 0x40],	%g6
	alignaddrl	%g5,	%g3,	%o2
	edge32	%i4,	%l4,	%i2
	movcs	%xcc,	%o0,	%l1
	fabss	%f15,	%f7
	edge32l	%g4,	%i6,	%i1
	fandnot2s	%f4,	%f8,	%f28
	movneg	%xcc,	%o1,	%g1
	edge16l	%o3,	%g2,	%l2
	or	%i7,	%l3,	%l5
	umul	%o4,	%o5,	%o6
	movvs	%xcc,	%i3,	%o7
	movrlez	%l0,	%g7,	%l6
	fmovdge	%xcc,	%f19,	%f22
	array16	%i0,	%i5,	%g5
	movle	%icc,	%g3,	%o2
	sll	%g6,	%l4,	%i4
	sub	%o0,	%i2,	%g4
	restore %l1, 0x0209, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o1,	0x2D6,	%g1
	ldx	[%l7 + 0x40],	%i6
	movcs	%xcc,	%g2,	%l2
	stx	%i7,	[%l7 + 0x08]
	movrlez	%l3,	%l5,	%o4
	orncc	%o5,	0x19F7,	%o6
	fmovde	%xcc,	%f19,	%f10
	sllx	%i3,	%o7,	%o3
	mulx	%l0,	0x0B2C,	%g7
	lduw	[%l7 + 0x64],	%i0
	movcs	%xcc,	%i5,	%l6
	edge16l	%g3,	%g5,	%g6
	edge32ln	%o2,	%i4,	%o0
	alignaddr	%i2,	%g4,	%l4
	edge8ln	%l1,	%o1,	%i1
	movcc	%icc,	%g1,	%g2
	ldx	[%l7 + 0x18],	%l2
	or	%i7,	%i6,	%l5
	mulscc	%o4,	%l3,	%o6
	smul	%o5,	0x15FE,	%o7
	subc	%i3,	%o3,	%l0
	edge8ln	%g7,	%i0,	%i5
	edge32n	%l6,	%g5,	%g6
	save %g3, %i4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f28,	%f20
	fcmpne32	%f10,	%f24,	%o2
	mulscc	%g4,	0x1F2C,	%l4
	ldub	[%l7 + 0x5A],	%i2
	fpsub16s	%f0,	%f20,	%f25
	fcmple16	%f8,	%f10,	%o1
	fnot2	%f0,	%f20
	movg	%xcc,	%i1,	%g1
	xnorcc	%g2,	%l1,	%i7
	fpackfix	%f4,	%f12
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f6
	edge32	%i6,	%l5,	%l2
	umulcc	%l3,	0x0542,	%o6
	fmovdgu	%icc,	%f19,	%f29
	xnor	%o4,	0x07CE,	%o7
	edge32	%o5,	%i3,	%l0
	sdivcc	%g7,	0x01C4,	%o3
	movcs	%icc,	%i5,	%i0
	sdiv	%g5,	0x0816,	%l6
	ldub	[%l7 + 0x63],	%g6
	movleu	%icc,	%g3,	%i4
	fcmpes	%fcc1,	%f17,	%f18
	subcc	%o2,	0x1EAB,	%g4
	lduh	[%l7 + 0x5E],	%l4
	edge16ln	%o0,	%o1,	%i1
	movcs	%xcc,	%i2,	%g1
	fmovsl	%icc,	%f18,	%f5
	fmovrslez	%g2,	%f23,	%f31
	sdivx	%l1,	0x1550,	%i6
	fandnot1s	%f20,	%f30,	%f6
	movrlez	%l5,	0x2D7,	%i7
	alignaddr	%l2,	%o6,	%l3
	fmovscc	%xcc,	%f21,	%f18
	xnorcc	%o7,	0x0075,	%o4
	edge16l	%o5,	%l0,	%i3
	stx	%o3,	[%l7 + 0x48]
	movn	%xcc,	%g7,	%i5
	ldsw	[%l7 + 0x1C],	%i0
	fpmerge	%f28,	%f25,	%f4
	orn	%l6,	%g5,	%g3
	movneg	%xcc,	%i4,	%g6
	fpadd32	%f28,	%f26,	%f2
	fnot1s	%f27,	%f20
	movge	%icc,	%o2,	%l4
	or	%g4,	0x1A19,	%o1
	edge8ln	%i1,	%o0,	%i2
	ldd	[%l7 + 0x40],	%g2
	stx	%l1,	[%l7 + 0x38]
	fmovspos	%xcc,	%f21,	%f10
	ldsw	[%l7 + 0x48],	%i6
	movleu	%xcc,	%l5,	%g1
	fnand	%f20,	%f0,	%f10
	fmovdleu	%xcc,	%f11,	%f31
	addcc	%i7,	%l2,	%l3
	movg	%icc,	%o6,	%o7
	edge32l	%o4,	%l0,	%i3
	edge32	%o5,	%o3,	%i5
	fxnor	%f2,	%f28,	%f4
	udiv	%i0,	0x08CF,	%g7
	movle	%icc,	%g5,	%l6
	subccc	%i4,	0x1929,	%g3
	fnot2s	%f9,	%f20
	fnor	%f20,	%f30,	%f18
	fsrc2	%f30,	%f26
	orcc	%g6,	%o2,	%g4
	srax	%o1,	%i1,	%l4
	alignaddrl	%i2,	%o0,	%g2
	orcc	%l1,	%i6,	%l5
	xnor	%g1,	%l2,	%l3
	movcs	%icc,	%o6,	%i7
	lduw	[%l7 + 0x74],	%o7
	subcc	%o4,	%l0,	%o5
	sdivcc	%o3,	0x1296,	%i5
	sub	%i3,	0x08CE,	%i0
	nop
	set	0x1C, %l4
	stw	%g7,	[%l7 + %l4]
	fmul8sux16	%f12,	%f22,	%f22
	addcc	%g5,	0x13D2,	%i4
	movne	%xcc,	%g3,	%g6
	popc	%o2,	%g4
	subc	%o1,	%i1,	%l6
	popc	0x02D6,	%i2
	edge8ln	%o0,	%l4,	%l1
	and	%i6,	0x1106,	%g2
	smul	%g1,	0x07E3,	%l5
	orcc	%l3,	%l2,	%o6
	edge32	%o7,	%o4,	%l0
	edge16ln	%o5,	%i7,	%o3
	movcs	%xcc,	%i5,	%i0
	lduw	[%l7 + 0x7C],	%i3
	lduw	[%l7 + 0x78],	%g5
	fornot1	%f28,	%f8,	%f28
	movrne	%g7,	%g3,	%i4
	fmovdn	%icc,	%f2,	%f27
	udiv	%g6,	0x1DC9,	%o2
	sdiv	%g4,	0x0C5A,	%o1
	movleu	%icc,	%l6,	%i2
	sllx	%o0,	%l4,	%l1
	sth	%i6,	[%l7 + 0x48]
	movrne	%g2,	%i1,	%l5
	movge	%xcc,	%g1,	%l2
	edge16l	%o6,	%o7,	%o4
	edge8ln	%l0,	%l3,	%o5
	fpsub32	%f16,	%f16,	%f30
	std	%f12,	[%l7 + 0x48]
	fpadd32s	%f25,	%f9,	%f8
	smul	%o3,	%i5,	%i0
	or	%i3,	%g5,	%g7
	lduw	[%l7 + 0x78],	%g3
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	ldx	[%l7 + 0x20],	%o2
	movleu	%xcc,	%i7,	%g4
	std	%f16,	[%l7 + 0x78]
	udivx	%o1,	0x1F7B,	%i2
	movvc	%xcc,	%l6,	%o0
	movl	%icc,	%l1,	%i6
	sdiv	%l4,	0x174E,	%i1
	movle	%icc,	%g2,	%l5
	fcmps	%fcc3,	%f11,	%f8
	fxor	%f0,	%f14,	%f20
	movcs	%xcc,	%l2,	%g1
	movg	%xcc,	%o7,	%o4
	ldsh	[%l7 + 0x58],	%o6
	mulscc	%l0,	%o5,	%l3
	srl	%o3,	%i5,	%i3
	movpos	%icc,	%g5,	%g7
	xor	%i0,	0x0641,	%i4
	lduh	[%l7 + 0x18],	%g3
	fmovsn	%xcc,	%f12,	%f23
	movneg	%xcc,	%g6,	%o2
	fmovdg	%xcc,	%f31,	%f11
	movneg	%icc,	%i7,	%o1
	sub	%g4,	0x1B9D,	%l6
	edge16l	%o0,	%l1,	%i2
	ldx	[%l7 + 0x70],	%l4
	movg	%xcc,	%i6,	%g2
	movge	%xcc,	%i1,	%l2
	movgu	%icc,	%l5,	%o7
	fmovdgu	%icc,	%f25,	%f17
	movge	%icc,	%g1,	%o6
	alignaddr	%o4,	%l0,	%o5
	edge16ln	%o3,	%i5,	%i3
	array8	%l3,	%g7,	%i0
	alignaddr	%i4,	%g3,	%g6
	std	%f10,	[%l7 + 0x28]
	fpsub32	%f8,	%f18,	%f10
	fcmpgt32	%f24,	%f12,	%g5
	movre	%o2,	0x29E,	%o1
	addcc	%g4,	0x0107,	%i7
	movrne	%o0,	0x25D,	%l6
	edge32	%i2,	%l1,	%i6
	ldub	[%l7 + 0x2C],	%g2
	subc	%i1,	0x0B75,	%l4
	stx	%l5,	[%l7 + 0x38]
	srax	%l2,	%g1,	%o7
	movre	%o6,	0x326,	%o4
	mova	%xcc,	%l0,	%o3
	array32	%o5,	%i5,	%i3
	mova	%icc,	%g7,	%i0
	xnorcc	%l3,	0x038C,	%g3
	movg	%xcc,	%i4,	%g5
	movle	%icc,	%o2,	%o1
	fpadd32s	%f22,	%f5,	%f22
	ldsb	[%l7 + 0x15],	%g6
	edge16	%g4,	%o0,	%l6
	ldub	[%l7 + 0x38],	%i7
	array16	%i2,	%l1,	%i6
	fmovdg	%icc,	%f10,	%f10
	fmovrsne	%g2,	%f11,	%f23
	array16	%l4,	%i1,	%l2
	edge32	%l5,	%g1,	%o7
	fmovd	%f20,	%f0
	mova	%xcc,	%o4,	%o6
	edge16l	%l0,	%o3,	%o5
	movge	%xcc,	%i5,	%i3
	edge16n	%i0,	%g7,	%g3
	movre	%i4,	0x386,	%g5
	alignaddr	%o2,	%l3,	%o1
	add	%g4,	%o0,	%g6
	fmovrdgz	%l6,	%f2,	%f26
	edge8n	%i2,	%l1,	%i7
	stb	%i6,	[%l7 + 0x79]
	subccc	%g2,	%i1,	%l2
	movge	%xcc,	%l4,	%g1
	movpos	%xcc,	%l5,	%o7
	fsrc2	%f10,	%f12
	fornot2s	%f14,	%f20,	%f2
	movcc	%icc,	%o4,	%o6
	fmul8ulx16	%f2,	%f30,	%f10
	fcmpeq32	%f14,	%f28,	%l0
	fpsub16	%f24,	%f12,	%f18
	srlx	%o5,	%i5,	%i3
	addc	%i0,	%o3,	%g3
	ldsw	[%l7 + 0x78],	%i4
	edge32ln	%g7,	%g5,	%o2
	movre	%o1,	%l3,	%g4
	nop
	set	0x38, %l2
	std	%f0,	[%l7 + %l2]
	srax	%o0,	%l6,	%i2
	sth	%l1,	[%l7 + 0x64]
	ldd	[%l7 + 0x40],	%i6
	udivx	%i6,	0x1C7E,	%g2
	srlx	%g6,	0x01,	%l2
	nop
	set	0x2A, %i3
	ldsh	[%l7 + %i3],	%l4
	fmovdg	%xcc,	%f26,	%f3
	fabsd	%f14,	%f20
	movge	%xcc,	%g1,	%l5
	addccc	%i1,	0x1792,	%o7
	movleu	%icc,	%o4,	%l0
	movrne	%o5,	0x047,	%o6
	fpadd32	%f24,	%f8,	%f22
	edge32l	%i3,	%i5,	%i0
	udiv	%o3,	0x14A0,	%i4
	fmul8ulx16	%f12,	%f18,	%f20
	orncc	%g7,	0x1A5B,	%g5
	edge8	%o2,	%g3,	%o1
	movneg	%icc,	%l3,	%o0
	popc	0x117F,	%g4
	edge8	%i2,	%l1,	%i7
	fmuld8sux16	%f27,	%f26,	%f18
	udiv	%i6,	0x0B5B,	%g2
	fornot2s	%f1,	%f7,	%f16
	edge8	%l6,	%g6,	%l2
	edge32	%g1,	%l5,	%l4
	movcs	%icc,	%i1,	%o7
	movn	%icc,	%l0,	%o4
	fnegs	%f29,	%f28
	movcc	%icc,	%o5,	%o6
	andn	%i3,	%i0,	%i5
	srl	%o3,	%g7,	%g5
	movvs	%icc,	%i4,	%g3
	fmovdneg	%xcc,	%f4,	%f19
	movleu	%icc,	%o1,	%o2
	fpack32	%f18,	%f22,	%f2
	nop
	set	0x44, %l6
	stw	%o0,	[%l7 + %l6]
	orncc	%g4,	0x1C46,	%i2
	or	%l1,	0x1FF2,	%i7
	fcmple16	%f8,	%f16,	%l3
	fmul8ulx16	%f2,	%f8,	%f2
	st	%f15,	[%l7 + 0x48]
	edge32l	%g2,	%l6,	%i6
	edge8n	%g6,	%l2,	%l5
	edge32l	%g1,	%i1,	%o7
	fmovdl	%xcc,	%f31,	%f31
	fone	%f24
	sllx	%l4,	0x10,	%l0
	xnor	%o5,	%o4,	%o6
	sdiv	%i0,	0x1C86,	%i3
	fmovsleu	%xcc,	%f13,	%f23
	movn	%xcc,	%o3,	%g7
	popc	0x1B4F,	%i5
	mulscc	%g5,	0x0F3E,	%i4
	edge16	%g3,	%o2,	%o0
	save %o1, %i2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i7,	%l1,	%g2
	and	%l6,	0x175C,	%i6
	ldx	[%l7 + 0x10],	%l3
	fcmpeq32	%f14,	%f14,	%g6
	movre	%l5,	%g1,	%l2
	smulcc	%o7,	%l4,	%l0
	udivx	%i1,	0x033C,	%o5
	fxors	%f18,	%f14,	%f22
	edge16ln	%o6,	%i0,	%i3
	movge	%icc,	%o3,	%g7
	movrgz	%i5,	%o4,	%i4
	edge8n	%g5,	%o2,	%g3
	subcc	%o0,	0x175B,	%i2
	sllx	%o1,	0x11,	%g4
	sra	%l1,	%i7,	%g2
	fones	%f21
	edge8l	%i6,	%l3,	%g6
	subcc	%l5,	0x197F,	%l6
	fmul8ulx16	%f12,	%f0,	%f24
	fnands	%f15,	%f22,	%f3
	and	%l2,	%g1,	%l4
	sdiv	%o7,	0x1260,	%i1
	srlx	%l0,	0x10,	%o5
	lduh	[%l7 + 0x1E],	%i0
	ldub	[%l7 + 0x40],	%o6
	alignaddrl	%o3,	%i3,	%i5
	movpos	%xcc,	%o4,	%i4
	fxnor	%f16,	%f30,	%f18
	movcc	%xcc,	%g5,	%o2
	stw	%g3,	[%l7 + 0x1C]
	andcc	%g7,	%i2,	%o1
	popc	%g4,	%o0
	add	%i7,	%g2,	%i6
	umul	%l3,	0x0CD6,	%l1
	and	%g6,	%l5,	%l2
	xnor	%g1,	0x085F,	%l4
	movcc	%icc,	%l6,	%o7
	fpack16	%f30,	%f15
	fzeros	%f25
	fcmpeq32	%f12,	%f0,	%i1
	ldsb	[%l7 + 0x3D],	%l0
	and	%i0,	0x0120,	%o6
	sdiv	%o5,	0x1B35,	%i3
	restore %i5, %o3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o4,	0x0473,	%o2
	sdivcc	%g3,	0x0566,	%g7
	movrne	%i2,	0x230,	%o1
	edge8	%g5,	%o0,	%g4
	xnorcc	%i7,	%g2,	%i6
	fxnors	%f7,	%f9,	%f25
	smul	%l3,	%g6,	%l5
	fornot2	%f14,	%f10,	%f30
	xnorcc	%l1,	0x0BF6,	%g1
	orcc	%l2,	%l6,	%o7
	fmovrdne	%l4,	%f10,	%f28
	andcc	%i1,	%l0,	%o6
	array32	%o5,	%i0,	%i3
	fcmpgt16	%f8,	%f8,	%o3
	edge32ln	%i4,	%o4,	%o2
	fmovda	%icc,	%f13,	%f21
	sdivcc	%g3,	0x0309,	%i5
	edge32ln	%g7,	%o1,	%g5
	umulcc	%o0,	%g4,	%i7
	sdivcc	%g2,	0x06E5,	%i2
	movl	%icc,	%l3,	%i6
	edge32	%l5,	%g6,	%l1
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f0
	fmul8x16	%f1,	%f28,	%f20
	sdivx	%g1,	0x1AF1,	%l2
	udivcc	%l6,	0x0681,	%o7
	movpos	%icc,	%l4,	%i1
	stx	%o6,	[%l7 + 0x78]
	movvs	%icc,	%o5,	%l0
	mulscc	%i0,	0x084D,	%o3
	movrlez	%i3,	%o4,	%i4
	edge16ln	%o2,	%g3,	%i5
	fmovsg	%icc,	%f25,	%f6
	sllx	%o1,	%g5,	%o0
	stb	%g7,	[%l7 + 0x5A]
	or	%g4,	0x1996,	%g2
	orn	%i2,	0x0A0A,	%l3
	mova	%xcc,	%i6,	%i7
	ldsh	[%l7 + 0x08],	%l5
	sir	0x12DB
	movl	%icc,	%l1,	%g1
	xor	%l2,	%l6,	%o7
	popc	%l4,	%i1
	fexpand	%f2,	%f0
	fpsub16	%f10,	%f0,	%f14
	ldsw	[%l7 + 0x20],	%o6
	udiv	%o5,	0x0C7B,	%l0
	fmovrde	%i0,	%f24,	%f16
	addcc	%o3,	%i3,	%o4
	alignaddrl	%i4,	%g6,	%o2
	udivx	%g3,	0x0D63,	%o1
	udivx	%g5,	0x1C2A,	%o0
	ldd	[%l7 + 0x18],	%i4
	edge32n	%g4,	%g2,	%i2
	fnegs	%f23,	%f27
	ldx	[%l7 + 0x78],	%g7
	mulscc	%i6,	0x093A,	%i7
	subc	%l5,	%l1,	%l3
	movgu	%icc,	%l2,	%g1
	srl	%o7,	%l4,	%l6
	array16	%i1,	%o6,	%o5
	alignaddrl	%l0,	%o3,	%i0
	fcmpne16	%f10,	%f6,	%i3
	ldub	[%l7 + 0x0C],	%o4
	sethi	0x1A5F,	%g6
	fmul8x16au	%f22,	%f28,	%f26
	lduh	[%l7 + 0x4E],	%i4
	ldx	[%l7 + 0x78],	%o2
	sllx	%g3,	0x1F,	%g5
	movn	%icc,	%o1,	%o0
	ldd	[%l7 + 0x20],	%g4
	or	%g2,	%i5,	%i2
	fsrc2	%f6,	%f28
	edge32	%i6,	%g7,	%i7
	xor	%l1,	0x0C42,	%l3
	or	%l5,	0x1790,	%l2
	st	%f18,	[%l7 + 0x1C]
	stb	%o7,	[%l7 + 0x5D]
	umul	%l4,	%l6,	%g1
	andncc	%i1,	%o5,	%l0
	orn	%o6,	%i0,	%o3
	movleu	%xcc,	%i3,	%g6
	save %o4, %i4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g5,	0x0B9C,	%o1
	xorcc	%o0,	%g4,	%g3
	array32	%g2,	%i2,	%i6
	fmovrsgez	%i5,	%f28,	%f23
	edge8	%i7,	%g7,	%l3
	fpackfix	%f12,	%f26
	edge16n	%l5,	%l2,	%o7
	fpsub16s	%f24,	%f13,	%f11
	ldd	[%l7 + 0x08],	%f4
	stb	%l1,	[%l7 + 0x21]
	movle	%icc,	%l4,	%g1
	stx	%l6,	[%l7 + 0x68]
	sub	%i1,	%o5,	%l0
	edge32	%o6,	%o3,	%i0
	array16	%i3,	%o4,	%i4
	umulcc	%o2,	0x1703,	%g6
	sra	%o1,	0x13,	%g5
	popc	%g4,	%o0
	srlx	%g3,	0x1D,	%g2
	fcmpne16	%f4,	%f30,	%i2
	fmovdl	%xcc,	%f25,	%f3
	umul	%i5,	0x114A,	%i6
	movge	%icc,	%g7,	%i7
	stx	%l5,	[%l7 + 0x60]
	edge16	%l2,	%o7,	%l1
	orcc	%l4,	0x0E82,	%l3
	edge8ln	%g1,	%i1,	%o5
	stw	%l0,	[%l7 + 0x58]
	nop
	set	0x40, %i5
	ldsw	[%l7 + %i5],	%l6
	fmovsl	%icc,	%f2,	%f23
	fmovscc	%xcc,	%f31,	%f25
	sub	%o6,	%o3,	%i3
	stx	%o4,	[%l7 + 0x68]
	mulx	%i4,	0x00C5,	%o2
	srlx	%g6,	0x14,	%o1
	edge32ln	%i0,	%g4,	%g5
	xnor	%o0,	0x0212,	%g2
	edge8	%g3,	%i5,	%i2
	movne	%xcc,	%g7,	%i7
	movn	%icc,	%l5,	%i6
	sdiv	%l2,	0x04A8,	%l1
	popc	%o7,	%l3
	srlx	%l4,	0x10,	%g1
	fnands	%f7,	%f2,	%f0
	sir	0x1F67
	fmovdn	%icc,	%f19,	%f0
	fnot1s	%f20,	%f28
	edge8n	%i1,	%l0,	%o5
	movrne	%l6,	0x170,	%o6
	fand	%f30,	%f22,	%f24
	stb	%o3,	[%l7 + 0x62]
	ldsb	[%l7 + 0x4E],	%i3
	fone	%f16
	orn	%i4,	%o4,	%o2
	andncc	%o1,	%i0,	%g6
	edge32n	%g5,	%o0,	%g4
	ld	[%l7 + 0x44],	%f6
	smul	%g2,	%g3,	%i2
	ldx	[%l7 + 0x40],	%g7
	fmovscc	%xcc,	%f6,	%f11
	movle	%icc,	%i5,	%l5
	fpack32	%f22,	%f6,	%f6
	fornot2	%f30,	%f14,	%f18
	andn	%i7,	%i6,	%l2
	ld	[%l7 + 0x50],	%f31
	and	%o7,	0x0CCF,	%l1
	edge16	%l3,	%g1,	%i1
	edge8n	%l0,	%l4,	%o5
	edge16n	%o6,	%o3,	%i3
	ldub	[%l7 + 0x5F],	%i4
	movne	%icc,	%o4,	%l6
	fornot1s	%f19,	%f13,	%f3
	umulcc	%o1,	%i0,	%g6
	umul	%g5,	0x0F03,	%o0
	or	%g4,	%o2,	%g3
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	sth	%l5,	[%l7 + 0x70]
	movneg	%xcc,	%g7,	%i7
	movrgz	%i6,	0x07C,	%o7
	movgu	%xcc,	%l2,	%l3
	ldsw	[%l7 + 0x38],	%g1
	add	%l1,	0x1F12,	%l0
	fmovsgu	%xcc,	%f2,	%f15
	array32	%l4,	%o5,	%o6
	sdivcc	%i1,	0x0431,	%i3
	save %o3, %i4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o1,	0x104D,	%l6
	fmovrdlz	%i0,	%f28,	%f14
	fmovdle	%xcc,	%f5,	%f25
	edge8l	%g6,	%g5,	%o0
	sdivcc	%g4,	0x05AE,	%o2
	ldub	[%l7 + 0x78],	%i2
	udiv	%g2,	0x03D8,	%i5
	xorcc	%g3,	0x0A59,	%l5
	movg	%icc,	%g7,	%i6
	ldsb	[%l7 + 0x55],	%o7
	edge16n	%i7,	%l3,	%l2
	movrgez	%g1,	0x1E3,	%l1
	edge32ln	%l0,	%o5,	%l4
	std	%f24,	[%l7 + 0x18]
	fmul8x16au	%f12,	%f12,	%f18
	move	%icc,	%i1,	%i3
	fcmpes	%fcc2,	%f30,	%f11
	or	%o6,	%i4,	%o4
	udivx	%o1,	0x04BF,	%o3
	movne	%xcc,	%i0,	%g6
	movle	%xcc,	%g5,	%l6
	movn	%icc,	%g4,	%o0
	xnorcc	%i2,	0x0E3A,	%o2
	movcs	%icc,	%i5,	%g2
	movvc	%xcc,	%l5,	%g7
	ldd	[%l7 + 0x70],	%f26
	movgu	%xcc,	%i6,	%g3
	mulscc	%o7,	%i7,	%l3
	ldd	[%l7 + 0x78],	%f24
	movcs	%xcc,	%g1,	%l1
	edge32ln	%l2,	%o5,	%l4
	movgu	%xcc,	%i1,	%i3
	orcc	%l0,	0x0C6D,	%i4
	edge8n	%o4,	%o6,	%o1
	smulcc	%i0,	0x19BE,	%o3
	ldub	[%l7 + 0x73],	%g5
	subc	%l6,	%g4,	%o0
	sethi	0x0741,	%g6
	fnot2s	%f3,	%f12
	orn	%i2,	0x1BA1,	%o2
	movgu	%xcc,	%g2,	%i5
	movrgz	%g7,	0x2EA,	%i6
	edge32n	%g3,	%o7,	%l5
	fmovspos	%xcc,	%f13,	%f17
	fnot1	%f30,	%f16
	srl	%i7,	0x1B,	%l3
	movpos	%icc,	%l1,	%g1
	ldd	[%l7 + 0x78],	%o4
	fmovsa	%xcc,	%f19,	%f6
	andn	%l2,	0x0E21,	%l4
	orcc	%i1,	%l0,	%i4
	ldsb	[%l7 + 0x29],	%i3
	restore %o6, 0x06F8, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o4,	%i0,	%o3
	fmovrdlez	%g5,	%f20,	%f14
	edge16ln	%l6,	%g4,	%g6
	sdiv	%i2,	0x0319,	%o2
	subc	%g2,	%o0,	%i5
	ldd	[%l7 + 0x60],	%g6
	srl	%g3,	%i6,	%o7
	fandnot2	%f24,	%f0,	%f24
	movgu	%xcc,	%l5,	%i7
	fornot2	%f26,	%f30,	%f30
	movn	%xcc,	%l3,	%g1
	edge32l	%o5,	%l1,	%l2
	pdist	%f26,	%f26,	%f4
	edge32l	%l4,	%l0,	%i4
	array16	%i3,	%i1,	%o6
	array32	%o4,	%i0,	%o3
	nop
	set	0x08, %l5
	stx	%g5,	[%l7 + %l5]
	edge16n	%o1,	%g4,	%g6
	edge16l	%l6,	%o2,	%g2
	andncc	%i2,	%o0,	%g7
	fmovsle	%xcc,	%f24,	%f25
	fxors	%f30,	%f27,	%f3
	mova	%xcc,	%i5,	%g3
	ldub	[%l7 + 0x4A],	%o7
	umul	%i6,	0x0083,	%i7
	sir	0x0207
	fandnot2	%f14,	%f2,	%f8
	lduw	[%l7 + 0x3C],	%l3
	lduw	[%l7 + 0x54],	%g1
	addccc	%l5,	0x1F52,	%l1
	edge16	%o5,	%l4,	%l2
	movcs	%xcc,	%i4,	%l0
	edge16	%i1,	%i3,	%o4
	movne	%xcc,	%i0,	%o3
	array8	%g5,	%o1,	%g4
	movge	%icc,	%o6,	%g6
	sub	%o2,	%l6,	%i2
	save %o0, 0x1991, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g7,	%i5
	fandnot1s	%f3,	%f15,	%f23
	movre	%o7,	0x3B3,	%g3
	fmovsa	%icc,	%f17,	%f30
	array8	%i6,	%l3,	%i7
	movrlez	%l5,	0x0C2,	%g1
	movgu	%xcc,	%o5,	%l4
	add	%l2,	%l1,	%l0
	popc	%i1,	%i4
	stx	%o4,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%f28
	subcc	%i0,	%o3,	%i3
	fnot1s	%f2,	%f6
	ldd	[%l7 + 0x08],	%f16
	movrlz	%g5,	0x32C,	%o1
	fcmpd	%fcc2,	%f4,	%f0
	sdiv	%o6,	0x0B11,	%g4
	fcmpgt32	%f0,	%f28,	%g6
	umul	%l6,	0x1869,	%o2
	fmovrdgez	%o0,	%f18,	%f4
	edge8l	%i2,	%g2,	%i5
	movcc	%icc,	%g7,	%g3
	orn	%i6,	%l3,	%o7
	movrne	%i7,	%g1,	%l5
	fmovsge	%icc,	%f30,	%f6
	fmovdgu	%xcc,	%f22,	%f5
	fmovrdlz	%l4,	%f0,	%f8
	move	%icc,	%o5,	%l1
	fmovrsne	%l2,	%f19,	%f0
	std	%f12,	[%l7 + 0x78]
	movrgz	%i1,	%i4,	%o4
	udiv	%i0,	0x0A0B,	%o3
	movrgez	%l0,	0x20C,	%i3
	edge32ln	%g5,	%o6,	%o1
	fmovde	%xcc,	%f21,	%f29
	alignaddrl	%g4,	%l6,	%o2
	sir	0x1982
	udivcc	%o0,	0x1CD9,	%i2
	xnorcc	%g6,	0x1EBA,	%i5
	and	%g7,	0x0E6C,	%g3
	alignaddr	%i6,	%l3,	%o7
	fmovdpos	%icc,	%f19,	%f18
	udiv	%g2,	0x0756,	%i7
	addc	%l5,	%l4,	%g1
	fcmple32	%f30,	%f6,	%o5
	fexpand	%f4,	%f26
	srax	%l1,	0x1B,	%i1
	movge	%icc,	%l2,	%i4
	fmovsl	%icc,	%f31,	%f20
	sdiv	%i0,	0x1212,	%o3
	fmovs	%f16,	%f18
	movcc	%icc,	%o4,	%l0
	or	%g5,	%o6,	%i3
	fmovdgu	%xcc,	%f6,	%f0
	orn	%o1,	%g4,	%o2
	siam	0x6
	umulcc	%l6,	%i2,	%g6
	ldub	[%l7 + 0x7E],	%i5
	lduh	[%l7 + 0x78],	%g7
	std	%f20,	[%l7 + 0x40]
	fpadd16s	%f12,	%f13,	%f18
	fxors	%f31,	%f25,	%f13
	fmovdvc	%icc,	%f6,	%f18
	ldub	[%l7 + 0x76],	%g3
	udivcc	%o0,	0x1CB7,	%l3
	movneg	%icc,	%o7,	%i6
	addccc	%i7,	%g2,	%l4
	fcmpeq16	%f12,	%f14,	%g1
	edge16	%l5,	%l1,	%o5
	stb	%i1,	[%l7 + 0x0B]
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	bshuffle	%f8,	%f6,	%f18
	addc	%o3,	%o4,	%l0
	sll	%o6,	0x16,	%g5
	subc	%i3,	%o1,	%o2
	edge16ln	%l6,	%g4,	%i2
	alignaddr	%g6,	%i5,	%g7
	nop
	set	0x08, %l1
	stx	%o0,	[%l7 + %l1]
	fornot2	%f28,	%f30,	%f26
	restore %g3, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l3,	%i7,	%l4
	lduh	[%l7 + 0x7E],	%g2
	fmovdn	%icc,	%f2,	%f18
	fnor	%f0,	%f10,	%f4
	movn	%icc,	%l5,	%g1
	edge16l	%l1,	%o5,	%i4
	subc	%l2,	0x0A90,	%i1
	umulcc	%o3,	0x1F31,	%o4
	fmovda	%icc,	%f7,	%f20
	subc	%i0,	%l0,	%g5
	orn	%i3,	0x0A2D,	%o1
	fmovdg	%icc,	%f2,	%f26
	movcc	%icc,	%o6,	%l6
	edge32	%g4,	%i2,	%o2
	movvc	%xcc,	%i5,	%g6
	movre	%o0,	%g7,	%g3
	ldsb	[%l7 + 0x1A],	%i6
	addcc	%o7,	0x1EC6,	%l3
	andcc	%l4,	%i7,	%l5
	umul	%g1,	0x0B9B,	%l1
	fexpand	%f15,	%f26
	orn	%o5,	%i4,	%l2
	umul	%g2,	%o3,	%o4
	array16	%i0,	%l0,	%i1
	sra	%g5,	0x06,	%i3
	fpadd32s	%f2,	%f29,	%f0
	andcc	%o6,	%o1,	%g4
	movcs	%icc,	%l6,	%o2
	addcc	%i2,	%i5,	%g6
	orn	%g7,	%o0,	%g3
	subccc	%o7,	%i6,	%l3
	fmovsvs	%xcc,	%f9,	%f9
	subc	%l4,	%l5,	%i7
	edge32	%g1,	%l1,	%i4
	fmovsl	%icc,	%f31,	%f16
	movcc	%icc,	%o5,	%g2
	mulx	%l2,	0x1A16,	%o3
	fnot2s	%f31,	%f3
	array8	%i0,	%o4,	%l0
	mulscc	%i1,	0x0266,	%g5
	edge16	%o6,	%o1,	%i3
	fmovsn	%xcc,	%f19,	%f23
	fmovde	%icc,	%f19,	%f21
	sdiv	%g4,	0x0917,	%l6
	stb	%o2,	[%l7 + 0x40]
	andncc	%i2,	%g6,	%i5
	fmuld8ulx16	%f14,	%f12,	%f2
	ld	[%l7 + 0x74],	%f1
	mova	%xcc,	%g7,	%o0
	edge16ln	%g3,	%o7,	%l3
	addcc	%l4,	0x0E9B,	%l5
	srlx	%i7,	%g1,	%l1
	smul	%i6,	0x0C1B,	%i4
	movne	%xcc,	%g2,	%o5
	orcc	%l2,	0x130C,	%i0
	sdiv	%o4,	0x04FC,	%o3
	andncc	%i1,	%g5,	%l0
	movle	%xcc,	%o1,	%o6
	subccc	%i3,	%l6,	%o2
	fmovrdgz	%g4,	%f18,	%f26
	ldx	[%l7 + 0x60],	%g6
	edge16ln	%i2,	%g7,	%o0
	sdivx	%g3,	0x0177,	%i5
	edge8n	%l3,	%l4,	%o7
	udiv	%l5,	0x128E,	%g1
	std	%f12,	[%l7 + 0x68]
	fmovsvc	%icc,	%f13,	%f2
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f30
	movn	%icc,	%l1,	%i6
	smulcc	%i4,	0x1A62,	%i7
	and	%g2,	0x136B,	%o5
	array16	%l2,	%o4,	%i0
	movrgz	%o3,	%g5,	%l0
	ldsb	[%l7 + 0x56],	%o1
	fmovsn	%icc,	%f1,	%f11
	array16	%i1,	%o6,	%i3
	stb	%l6,	[%l7 + 0x7A]
	movcs	%xcc,	%g4,	%o2
	xorcc	%i2,	0x1ECC,	%g6
	ldd	[%l7 + 0x78],	%f18
	movvc	%icc,	%o0,	%g3
	ldsb	[%l7 + 0x42],	%g7
	fcmpeq32	%f18,	%f22,	%i5
	orcc	%l4,	0x0E7A,	%o7
	fmovs	%f27,	%f11
	bshuffle	%f28,	%f16,	%f16
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	edge32l	%l3,	%l1,	%i6
	fmovrsne	%i7,	%f9,	%f30
	srl	%g2,	%o5,	%i4
	alignaddrl	%o4,	%l2,	%i0
	fmovdneg	%icc,	%f2,	%f15
	fmovsg	%xcc,	%f10,	%f6
	ldx	[%l7 + 0x58],	%o3
	movcc	%xcc,	%g5,	%o1
	fsrc1	%f20,	%f18
	orn	%l0,	%o6,	%i1
	xnor	%l6,	%g4,	%i3
	fnot2	%f20,	%f4
	ld	[%l7 + 0x60],	%f22
	orncc	%i2,	0x039C,	%g6
	array16	%o2,	%o0,	%g7
	edge8ln	%i5,	%l4,	%o7
	movle	%xcc,	%l5,	%g3
	fmovrdlz	%g1,	%f14,	%f16
	xor	%l3,	%i6,	%i7
	array8	%l1,	%g2,	%o5
	umulcc	%o4,	0x048F,	%i4
	fpsub16s	%f14,	%f22,	%f21
	fcmpgt16	%f6,	%f4,	%l2
	fmovsne	%xcc,	%f28,	%f17
	xor	%i0,	0x069A,	%g5
	subcc	%o1,	0x07EE,	%o3
	save %l0, 0x164E, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i1,	%g4,	%l6
	orn	%i2,	%g6,	%i3
	siam	0x3
	sub	%o2,	0x1EEE,	%o0
	faligndata	%f4,	%f24,	%f6
	movrlz	%g7,	%i5,	%o7
	lduw	[%l7 + 0x14],	%l4
	orncc	%l5,	0x13B0,	%g1
	fnot1	%f2,	%f12
	movrgez	%l3,	0x059,	%i6
	move	%xcc,	%g3,	%l1
	srlx	%i7,	%g2,	%o4
	edge8n	%o5,	%l2,	%i0
	movle	%icc,	%i4,	%o1
	fandnot1	%f26,	%f16,	%f14
	movpos	%icc,	%g5,	%l0
	nop
	set	0x47, %g6
	ldsb	[%l7 + %g6],	%o3
	fpadd32s	%f24,	%f1,	%f29
	sethi	0x0685,	%i1
	movrlez	%o6,	0x173,	%g4
	array8	%l6,	%i2,	%g6
	fmul8ulx16	%f18,	%f26,	%f18
	fmovsvc	%icc,	%f7,	%f5
	addccc	%o2,	%i3,	%g7
	mulscc	%i5,	0x13AC,	%o0
	ldx	[%l7 + 0x30],	%l4
	fmovrde	%o7,	%f30,	%f16
	mulscc	%l5,	0x078E,	%l3
	movcc	%xcc,	%g1,	%i6
	std	%f10,	[%l7 + 0x20]
	orn	%g3,	0x02C9,	%i7
	addc	%l1,	%o4,	%g2
	edge8l	%o5,	%i0,	%i4
	move	%icc,	%l2,	%o1
	sdivx	%g5,	0x1A43,	%o3
	andn	%l0,	%i1,	%g4
	sdivx	%l6,	0x1BF7,	%o6
	fmovsg	%icc,	%f3,	%f3
	stb	%g6,	[%l7 + 0x62]
	fmovsvs	%xcc,	%f24,	%f15
	fmovdvc	%xcc,	%f18,	%f1
	array8	%i2,	%i3,	%g7
	alignaddr	%o2,	%o0,	%l4
	ldd	[%l7 + 0x18],	%i4
	faligndata	%f0,	%f0,	%f26
	ldd	[%l7 + 0x28],	%o6
	move	%icc,	%l3,	%l5
	fpadd32s	%f27,	%f1,	%f26
	ldd	[%l7 + 0x18],	%f30
	srl	%g1,	0x0F,	%g3
	fcmped	%fcc1,	%f8,	%f28
	sdivcc	%i6,	0x1B6E,	%i7
	ldd	[%l7 + 0x28],	%f26
	movrne	%o4,	0x09E,	%g2
	sth	%o5,	[%l7 + 0x38]
	stx	%i0,	[%l7 + 0x68]
	movn	%xcc,	%l1,	%i4
	fmovrdlz	%o1,	%f2,	%f6
	fmul8sux16	%f28,	%f26,	%f10
	fone	%f16
	lduh	[%l7 + 0x7A],	%l2
	lduh	[%l7 + 0x4E],	%o3
	restore %l0, 0x1F1F, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g5,	0x0B2F,	%g4
	edge8l	%o6,	%g6,	%i2
	fcmpne16	%f8,	%f8,	%i3
	alignaddr	%l6,	%o2,	%g7
	sra	%l4,	0x07,	%i5
	movcs	%xcc,	%o0,	%l3
	ld	[%l7 + 0x78],	%f17
	udivcc	%l5,	0x0D63,	%g1
	movrgz	%o7,	%g3,	%i6
	nop
	set	0x18, %o2
	ldsw	[%l7 + %o2],	%i7
	sdivcc	%o4,	0x103B,	%o5
	fpadd16	%f30,	%f4,	%f22
	orn	%i0,	0x098A,	%l1
	save %g2, 0x1FA5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o1,	0x03FD,	%l2
	move	%xcc,	%o3,	%l0
	sethi	0x1725,	%g5
	edge32ln	%g4,	%i1,	%g6
	udivcc	%i2,	0x1A3F,	%i3
	fmovdvc	%xcc,	%f17,	%f31
	srax	%o6,	%o2,	%l6
	ldd	[%l7 + 0x38],	%g6
	sdivcc	%l4,	0x0F70,	%i5
	and	%l3,	%l5,	%g1
	xnor	%o0,	%o7,	%g3
	movcc	%icc,	%i7,	%i6
	sdivx	%o4,	0x083C,	%i0
	edge32	%l1,	%o5,	%i4
	movvc	%icc,	%g2,	%o1
	movn	%icc,	%o3,	%l0
	movge	%xcc,	%g5,	%g4
	movcc	%xcc,	%i1,	%g6
	edge32l	%l2,	%i3,	%o6
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%o2
	lduw	[%l7 + 0x20],	%i2
	edge8l	%l6,	%l4,	%g7
	smul	%i5,	%l5,	%g1
	edge32l	%l3,	%o0,	%g3
	fxors	%f27,	%f2,	%f2
	movvc	%icc,	%i7,	%o7
	movvs	%xcc,	%o4,	%i0
	subcc	%l1,	%o5,	%i4
	ld	[%l7 + 0x1C],	%f10
	stw	%g2,	[%l7 + 0x28]
	andn	%o1,	0x03BA,	%o3
	ldsh	[%l7 + 0x0C],	%i6
	ldub	[%l7 + 0x7B],	%l0
	subccc	%g4,	0x104F,	%i1
	edge8ln	%g5,	%g6,	%l2
	fpsub16s	%f16,	%f12,	%f27
	alignaddrl	%i3,	%o2,	%o6
	edge16l	%l6,	%l4,	%i2
	sdivx	%g7,	0x1582,	%l5
	sth	%i5,	[%l7 + 0x44]
	srax	%l3,	0x01,	%o0
	movrlz	%g3,	%i7,	%g1
	xor	%o7,	0x15F1,	%i0
	edge8n	%o4,	%o5,	%i4
	fmovsvs	%icc,	%f27,	%f27
	fmovrsne	%g2,	%f28,	%f3
	array8	%l1,	%o3,	%i6
	orncc	%l0,	%g4,	%o1
	mulscc	%i1,	0x016A,	%g5
	sdivx	%l2,	0x1527,	%i3
	stx	%o2,	[%l7 + 0x08]
	std	%f14,	[%l7 + 0x40]
	lduh	[%l7 + 0x52],	%g6
	sth	%o6,	[%l7 + 0x22]
	array8	%l6,	%l4,	%i2
	ldsb	[%l7 + 0x11],	%l5
	movle	%icc,	%g7,	%l3
	srl	%o0,	0x0F,	%i5
	fmovsg	%xcc,	%f25,	%f29
	for	%f16,	%f20,	%f10
	subc	%i7,	%g3,	%o7
	ldd	[%l7 + 0x38],	%f20
	smulcc	%i0,	0x0029,	%o4
	fpmerge	%f1,	%f7,	%f30
	ld	[%l7 + 0x10],	%f22
	fcmpne16	%f30,	%f30,	%g1
	movrlz	%o5,	0x3F3,	%g2
	fandnot1	%f30,	%f16,	%f4
	sdivcc	%i4,	0x0F94,	%o3
	fnot1	%f14,	%f2
	pdist	%f0,	%f24,	%f12
	sll	%i6,	0x1E,	%l1
	movne	%icc,	%l0,	%g4
	movn	%icc,	%o1,	%i1
	save %l2, 0x08EC, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o2,	0x047A,	%i3
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%g6
	std	%f28,	[%l7 + 0x50]
	fand	%f22,	%f8,	%f16
	ldsb	[%l7 + 0x4D],	%l6
	fnor	%f8,	%f26,	%f14
	st	%f29,	[%l7 + 0x74]
	addcc	%o6,	0x02E4,	%i2
	fcmpgt32	%f8,	%f14,	%l5
	xor	%l4,	0x14FB,	%g7
	udivcc	%l3,	0x13BC,	%i5
	ldsh	[%l7 + 0x52],	%o0
	save %g3, 0x09C1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc2,	%f19,	%f5
	fabsd	%f4,	%f24
	fnot2	%f22,	%f16
	xnorcc	%i7,	%i0,	%o4
	lduw	[%l7 + 0x0C],	%g1
	alignaddrl	%g2,	%i4,	%o5
	sll	%i6,	0x0B,	%o3
	ld	[%l7 + 0x78],	%f10
	sll	%l1,	0x12,	%g4
	mova	%xcc,	%o1,	%i1
	fornot2	%f22,	%f16,	%f24
	andcc	%l0,	%g5,	%o2
	ldx	[%l7 + 0x20],	%i3
	move	%icc,	%g6,	%l2
	fmovsn	%xcc,	%f14,	%f0
	sth	%o6,	[%l7 + 0x38]
	smulcc	%l6,	0x097A,	%i2
	array32	%l4,	%l5,	%g7
	stb	%i5,	[%l7 + 0x4A]
	fmovda	%xcc,	%f23,	%f2
	andcc	%l3,	0x1078,	%g3
	fmovdg	%xcc,	%f26,	%f31
	movle	%xcc,	%o0,	%o7
	fmovrslez	%i7,	%f14,	%f14
	fpsub32s	%f31,	%f9,	%f18
	subc	%o4,	%g1,	%g2
	stb	%i0,	[%l7 + 0x5D]
	movvs	%icc,	%i4,	%o5
	or	%o3,	0x1200,	%l1
	ldub	[%l7 + 0x36],	%i6
	fnand	%f20,	%f10,	%f30
	move	%xcc,	%g4,	%i1
	xnorcc	%o1,	0x0FD2,	%g5
	mulx	%l0,	0x10BD,	%i3
	movrne	%o2,	0x24D,	%l2
	fmovs	%f18,	%f24
	move	%xcc,	%o6,	%l6
	edge8n	%g6,	%l4,	%i2
	fones	%f15
	movn	%xcc,	%g7,	%i5
	fands	%f31,	%f30,	%f26
	sir	0x1030
	movrlz	%l3,	0x084,	%l5
	fnand	%f2,	%f26,	%f14
	edge32l	%o0,	%o7,	%g3
	smul	%i7,	%g1,	%o4
	ldsw	[%l7 + 0x20],	%i0
	xnor	%g2,	%o5,	%o3
	sdiv	%i4,	0x0BC8,	%i6
	srax	%l1,	0x03,	%g4
	movcs	%icc,	%o1,	%g5
	subcc	%l0,	%i3,	%i1
	edge8ln	%o2,	%l2,	%l6
	or	%g6,	%l4,	%o6
	movl	%icc,	%g7,	%i5
	movrlz	%l3,	%l5,	%o0
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	stw	%i7,	[%l7 + 0x74]
	restore %o4, %g1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g2,	%o5,	%o3
	fmovdvc	%icc,	%f4,	%f5
	movcs	%icc,	%i6,	%l1
	fmovde	%icc,	%f6,	%f21
	udivx	%g4,	0x1821,	%o1
	movvs	%icc,	%i4,	%l0
	lduw	[%l7 + 0x08],	%g5
	stw	%i3,	[%l7 + 0x70]
	subc	%o2,	%l2,	%l6
	fmovsle	%xcc,	%f12,	%f19
	fors	%f7,	%f0,	%f5
	movrgez	%g6,	%l4,	%o6
	fmovsleu	%xcc,	%f14,	%f17
	movrlz	%g7,	%i1,	%l3
	edge8n	%l5,	%o0,	%i5
	ldsw	[%l7 + 0x2C],	%i2
	xorcc	%g3,	%o7,	%o4
	fxor	%f0,	%f6,	%f8
	srl	%i7,	0x05,	%i0
	udivx	%g2,	0x1586,	%o5
	fandnot2	%f14,	%f30,	%f12
	movg	%icc,	%g1,	%i6
	fzeros	%f0
	sth	%l1,	[%l7 + 0x34]
	faligndata	%f24,	%f22,	%f26
	fcmps	%fcc2,	%f16,	%f29
	orcc	%o3,	0x121E,	%g4
	addccc	%o1,	%i4,	%l0
	popc	0x0BBE,	%i3
	movle	%icc,	%g5,	%l2
	ldsh	[%l7 + 0x1C],	%o2
	and	%g6,	0x0E56,	%l4
	move	%icc,	%o6,	%l6
	movne	%icc,	%g7,	%l3
	fmovdcs	%icc,	%f31,	%f13
	ldub	[%l7 + 0x63],	%i1
	orn	%l5,	%o0,	%i5
	movpos	%xcc,	%i2,	%g3
	nop
	set	0x44, %o6
	lduw	[%l7 + %o6],	%o4
	udivx	%o7,	0x086C,	%i7
	movrne	%g2,	%i0,	%o5
	fmovsge	%xcc,	%f4,	%f8
	nop
	set	0x5E, %i2
	ldsb	[%l7 + %i2],	%i6
	st	%f9,	[%l7 + 0x44]
	srl	%l1,	0x15,	%o3
	fcmpne16	%f8,	%f14,	%g1
	xorcc	%g4,	%o1,	%i4
	std	%f22,	[%l7 + 0x18]
	fmovsge	%xcc,	%f4,	%f30
	fxors	%f9,	%f6,	%f10
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%l0
	movpos	%icc,	%g5,	%i3
	mulx	%l2,	0x0476,	%o2
	sll	%g6,	0x15,	%o6
	edge16l	%l6,	%l4,	%g7
	movvc	%icc,	%i1,	%l5
	subccc	%o0,	%l3,	%i2
	or	%i5,	0x1A9F,	%g3
	movrlez	%o4,	%o7,	%i7
	edge8n	%i0,	%g2,	%i6
	edge16	%l1,	%o3,	%g1
	stb	%o5,	[%l7 + 0x0C]
	fnot1	%f4,	%f14
	fandnot2	%f24,	%f16,	%f18
	edge8n	%g4,	%i4,	%o1
	movrne	%g5,	0x0D1,	%i3
	fmovdle	%xcc,	%f11,	%f4
	movre	%l0,	0x339,	%l2
	movrgez	%o2,	%o6,	%g6
	fpackfix	%f0,	%f17
	sethi	0x00D3,	%l6
	edge8l	%l4,	%g7,	%l5
	edge8l	%o0,	%i1,	%i2
	smulcc	%l3,	0x05A2,	%i5
	fpsub16s	%f27,	%f3,	%f4
	movvs	%xcc,	%o4,	%o7
	stb	%g3,	[%l7 + 0x0A]
	movrlez	%i0,	0x250,	%i7
	xor	%g2,	0x0DE8,	%i6
	fmovdn	%icc,	%f27,	%f7
	edge16	%l1,	%g1,	%o5
	srl	%o3,	%i4,	%o1
	ld	[%l7 + 0x48],	%f13
	movl	%icc,	%g4,	%i3
	addccc	%g5,	0x0DFD,	%l2
	edge16	%o2,	%o6,	%l0
	popc	%l6,	%g6
	edge16n	%g7,	%l4,	%l5
	fnands	%f14,	%f19,	%f27
	and	%i1,	0x0167,	%i2
	array16	%o0,	%l3,	%i5
	and	%o7,	0x1B3A,	%g3
	movrgez	%i0,	0x09C,	%i7
	movg	%xcc,	%g2,	%i6
	sub	%l1,	%o4,	%o5
	alignaddr	%g1,	%i4,	%o1
	subc	%g4,	%o3,	%i3
	fmovsn	%xcc,	%f17,	%f14
	xnorcc	%l2,	%g5,	%o6
	movcs	%icc,	%o2,	%l0
	fpack16	%f8,	%f10
	sir	0x042A
	alignaddrl	%l6,	%g7,	%l4
	array32	%l5,	%g6,	%i1
	ldsh	[%l7 + 0x4E],	%o0
	fones	%f4
	addcc	%i2,	%i5,	%o7
	edge8	%l3,	%g3,	%i0
	ldx	[%l7 + 0x48],	%g2
	movpos	%xcc,	%i7,	%i6
	fmovd	%f6,	%f26
	array8	%o4,	%o5,	%g1
	sll	%i4,	0x1E,	%l1
	fzero	%f0
	move	%xcc,	%g4,	%o3
	edge32n	%o1,	%i3,	%l2
	fmovsgu	%xcc,	%f0,	%f7
	ldd	[%l7 + 0x40],	%f18
	sll	%g5,	0x0F,	%o2
	movne	%icc,	%o6,	%l0
	std	%f18,	[%l7 + 0x40]
	movl	%icc,	%g7,	%l6
	array16	%l5,	%g6,	%i1
	ldx	[%l7 + 0x30],	%l4
	ldub	[%l7 + 0x15],	%o0
	xnor	%i5,	0x0FEB,	%o7
	fnegs	%f22,	%f28
	xor	%l3,	%i2,	%g3
	ldsb	[%l7 + 0x2C],	%i0
	and	%i7,	%i6,	%g2
	fmovdcc	%xcc,	%f26,	%f6
	edge32n	%o5,	%g1,	%o4
	siam	0x1
	movl	%xcc,	%i4,	%g4
	fmovrdlz	%o3,	%f30,	%f26
	umulcc	%o1,	0x145A,	%i3
	edge16l	%l1,	%l2,	%o2
	sir	0x17CC
	fmovse	%xcc,	%f26,	%f18
	fmovdge	%xcc,	%f1,	%f12
	subc	%g5,	0x0379,	%l0
	edge16ln	%o6,	%l6,	%l5
	lduw	[%l7 + 0x40],	%g6
	alignaddr	%g7,	%l4,	%o0
	smul	%i1,	0x0AF0,	%o7
	alignaddrl	%l3,	%i2,	%i5
	movn	%icc,	%i0,	%i7
	fmovdle	%icc,	%f27,	%f0
	xnorcc	%g3,	0x0500,	%i6
	umulcc	%o5,	0x132E,	%g1
	fmovdle	%icc,	%f2,	%f18
	udiv	%o4,	0x02B8,	%i4
	fmovsneg	%xcc,	%f2,	%f4
	ldsb	[%l7 + 0x0B],	%g2
	andncc	%o3,	%o1,	%g4
	sra	%l1,	0x00,	%i3
	fnegd	%f20,	%f4
	movgu	%xcc,	%l2,	%g5
	std	%f6,	[%l7 + 0x30]
	udiv	%l0,	0x1B34,	%o6
	lduh	[%l7 + 0x0A],	%o2
	movre	%l5,	%l6,	%g6
	std	%f26,	[%l7 + 0x08]
	array16	%g7,	%l4,	%o0
	move	%xcc,	%o7,	%i1
	st	%f14,	[%l7 + 0x34]
	fxor	%f22,	%f14,	%f18
	array16	%i2,	%l3,	%i0
	lduh	[%l7 + 0x0C],	%i7
	movcs	%icc,	%g3,	%i5
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	xor	%g1,	%g2,	%i4
	array16	%o3,	%g4,	%o1
	fmovdpos	%xcc,	%f15,	%f5
	mulscc	%l1,	0x19CA,	%i3
	lduw	[%l7 + 0x34],	%l2
	edge16	%g5,	%o6,	%o2
	array16	%l0,	%l5,	%l6
	ldd	[%l7 + 0x20],	%f2
	save %g7, %l4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x34],	%o7
	edge32ln	%o0,	%i2,	%i1
	sth	%i0,	[%l7 + 0x08]
	fmovrdne	%i7,	%f8,	%f0
	movn	%xcc,	%g3,	%l3
	edge8	%i5,	%o5,	%i6
	edge8n	%g1,	%o4,	%g2
	lduw	[%l7 + 0x20],	%o3
	and	%i4,	0x16DD,	%g4
	addccc	%l1,	%o1,	%i3
	fmovsvc	%xcc,	%f23,	%f17
	fcmpgt32	%f4,	%f30,	%l2
	popc	%g5,	%o2
	fpsub16s	%f21,	%f14,	%f15
	edge32l	%l0,	%l5,	%l6
	st	%f3,	[%l7 + 0x60]
	add	%o6,	%l4,	%g7
	subc	%g6,	%o7,	%o0
	edge8l	%i1,	%i2,	%i7
	addcc	%i0,	0x1C92,	%g3
	popc	0x0CE3,	%l3
	or	%i5,	%o5,	%g1
	edge8	%i6,	%o4,	%o3
	subc	%i4,	%g4,	%l1
	ldd	[%l7 + 0x78],	%g2
	srl	%o1,	0x0B,	%i3
	fmovdcs	%xcc,	%f12,	%f20
	ldd	[%l7 + 0x58],	%f6
	edge32l	%g5,	%l2,	%o2
	movrlz	%l5,	%l6,	%l0
	movrlz	%o6,	%l4,	%g6
	movne	%xcc,	%g7,	%o0
	movcc	%icc,	%i1,	%o7
	move	%xcc,	%i7,	%i2
	andcc	%g3,	%l3,	%i0
	alignaddrl	%o5,	%g1,	%i6
	movvs	%icc,	%i5,	%o3
	fmovrdgz	%o4,	%f28,	%f28
	ldsh	[%l7 + 0x52],	%g4
	movcs	%icc,	%l1,	%i4
	edge8l	%o1,	%i3,	%g2
	movne	%xcc,	%g5,	%o2
	sra	%l2,	%l6,	%l5
	fmovsgu	%icc,	%f24,	%f13
	movneg	%xcc,	%o6,	%l4
	movneg	%icc,	%l0,	%g7
	fcmped	%fcc0,	%f30,	%f4
	edge16l	%o0,	%i1,	%o7
	fmovdgu	%xcc,	%f28,	%f1
	srlx	%g6,	0x0F,	%i2
	pdist	%f4,	%f6,	%f10
	edge32n	%i7,	%g3,	%l3
	addccc	%i0,	%g1,	%i6
	smulcc	%o5,	0x0694,	%i5
	xnor	%o4,	%g4,	%o3
	array8	%i4,	%l1,	%i3
	srl	%o1,	0x05,	%g2
	alignaddrl	%g5,	%o2,	%l2
	movne	%icc,	%l6,	%l5
	fnor	%f4,	%f8,	%f22
	ldsh	[%l7 + 0x32],	%l4
	add	%l0,	0x1106,	%g7
	movg	%xcc,	%o0,	%o6
	ldsw	[%l7 + 0x24],	%i1
	fmovs	%f5,	%f12
	smulcc	%g6,	%o7,	%i7
	ldsb	[%l7 + 0x7D],	%g3
	st	%f13,	[%l7 + 0x28]
	movvs	%icc,	%l3,	%i0
	movrlz	%i2,	0x0D2,	%g1
	fmovrde	%o5,	%f30,	%f10
	nop
	set	0x3C, %o3
	stw	%i6,	[%l7 + %o3]
	andncc	%o4,	%i5,	%g4
	fmuld8sux16	%f22,	%f2,	%f8
	mova	%icc,	%i4,	%o3
	fmul8sux16	%f12,	%f16,	%f4
	subc	%l1,	0x128E,	%o1
	fmovrde	%g2,	%f8,	%f2
	movleu	%icc,	%i3,	%g5
	fornot2s	%f27,	%f25,	%f27
	smulcc	%l2,	0x0F90,	%o2
	edge32ln	%l6,	%l5,	%l0
	fornot2	%f26,	%f22,	%f0
	stw	%l4,	[%l7 + 0x28]
	array8	%g7,	%o0,	%o6
	fcmpne32	%f30,	%f22,	%g6
	movg	%xcc,	%o7,	%i1
	fabss	%f30,	%f5
	fexpand	%f27,	%f14
	andn	%g3,	0x09E1,	%l3
	edge32	%i7,	%i0,	%i2
	ldsw	[%l7 + 0x14],	%o5
	smulcc	%i6,	%g1,	%o4
	andncc	%i5,	%i4,	%g4
	umul	%o3,	0x19F6,	%o1
	srax	%g2,	0x18,	%l1
	edge16l	%g5,	%i3,	%l2
	xnor	%l6,	%o2,	%l0
	movrlz	%l4,	%l5,	%g7
	sdiv	%o6,	0x0267,	%g6
	sra	%o7,	%i1,	%o0
	orncc	%g3,	0x1DE7,	%i7
	ldd	[%l7 + 0x28],	%f18
	add	%l3,	%i0,	%i2
	save %i6, 0x1F06, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f7,	%f19,	%f24
	xorcc	%g1,	%i5,	%o4
	fones	%f13
	fnands	%f17,	%f26,	%f8
	ldsh	[%l7 + 0x72],	%i4
	sdivcc	%o3,	0x1E89,	%g4
	ldd	[%l7 + 0x38],	%f12
	edge8	%g2,	%o1,	%g5
	fcmpeq32	%f22,	%f26,	%i3
	std	%f24,	[%l7 + 0x38]
	xor	%l1,	%l6,	%l2
	movrlez	%o2,	%l0,	%l4
	movvc	%icc,	%g7,	%l5
	ldsb	[%l7 + 0x76],	%o6
	fornot2	%f16,	%f28,	%f22
	alignaddr	%g6,	%o7,	%o0
	sllx	%i1,	0x04,	%i7
	movvc	%icc,	%g3,	%i0
	movcc	%xcc,	%i2,	%i6
	xnorcc	%l3,	0x0845,	%g1
	movcs	%xcc,	%i5,	%o5
	edge8n	%i4,	%o4,	%o3
	udiv	%g2,	0x0C07,	%g4
	movrlez	%g5,	%o1,	%i3
	andncc	%l6,	%l2,	%o2
	subc	%l1,	0x0435,	%l4
	srax	%l0,	%g7,	%o6
	fmovrsgez	%l5,	%f25,	%f22
	edge32	%o7,	%o0,	%i1
	fmovdle	%icc,	%f24,	%f6
	sra	%g6,	0x15,	%i7
	fornot1	%f10,	%f8,	%f18
	fmovdn	%icc,	%f7,	%f19
	fmovsl	%icc,	%f23,	%f17
	save %i0, %g3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f26,	%f11
	fxor	%f2,	%f14,	%f6
	ldd	[%l7 + 0x08],	%f28
	xnorcc	%i6,	%g1,	%i5
	edge8	%l3,	%i4,	%o5
	fmovrdne	%o4,	%f6,	%f26
	stw	%o3,	[%l7 + 0x14]
	ldub	[%l7 + 0x63],	%g2
	sdivcc	%g5,	0x1B6E,	%g4
	edge8l	%o1,	%l6,	%l2
	movpos	%icc,	%o2,	%l1
	sethi	0x17D9,	%l4
	array16	%l0,	%g7,	%i3
	umulcc	%l5,	%o6,	%o7
	fmovsg	%icc,	%f29,	%f11
	movrlez	%o0,	%g6,	%i7
	udiv	%i1,	0x08C8,	%g3
	mova	%icc,	%i0,	%i2
	move	%xcc,	%i6,	%i5
	movcs	%icc,	%g1,	%i4
	movne	%icc,	%o5,	%l3
	mova	%xcc,	%o4,	%o3
	sllx	%g5,	%g4,	%o1
	andn	%l6,	%g2,	%l2
	lduw	[%l7 + 0x44],	%o2
	edge8l	%l4,	%l0,	%g7
	fcmple32	%f28,	%f24,	%l1
	xorcc	%l5,	0x0522,	%o6
	fornot2s	%f0,	%f29,	%f8
	nop
	set	0x6F, %l0
	ldub	[%l7 + %l0],	%i3
	udiv	%o7,	0x107E,	%o0
	nop
	set	0x4C, %g2
	ldsw	[%l7 + %g2],	%g6
	mulx	%i1,	0x184F,	%g3
	edge32	%i0,	%i2,	%i6
	fcmpd	%fcc1,	%f10,	%f4
	stb	%i7,	[%l7 + 0x43]
	xnor	%i5,	0x0329,	%i4
	subccc	%o5,	0x1C8A,	%l3
	subc	%g1,	%o4,	%g5
	sdiv	%o3,	0x12D2,	%o1
	smulcc	%l6,	%g2,	%l2
	movre	%o2,	%l4,	%g4
	edge32	%g7,	%l0,	%l1
	udivx	%l5,	0x0C97,	%o6
	fzero	%f28
	edge16l	%i3,	%o0,	%o7
	sub	%g6,	%g3,	%i0
	movrlz	%i2,	0x07E,	%i1
	std	%f14,	[%l7 + 0x70]
	sub	%i7,	%i5,	%i6
	addc	%o5,	%i4,	%g1
	edge8ln	%l3,	%o4,	%o3
	sth	%g5,	[%l7 + 0x7C]
	edge8	%l6,	%o1,	%g2
	movrne	%o2,	0x32F,	%l4
	edge32	%g4,	%g7,	%l2
	popc	%l0,	%l1
	popc	%o6,	%l5
	ldub	[%l7 + 0x13],	%i3
	array32	%o7,	%o0,	%g6
	udivcc	%g3,	0x0F9D,	%i0
	fpmerge	%f24,	%f0,	%f20
	ldsb	[%l7 + 0x28],	%i1
	and	%i2,	0x0608,	%i7
	edge16l	%i5,	%o5,	%i4
	fmovdpos	%xcc,	%f4,	%f19
	umulcc	%i6,	0x0CC5,	%g1
	sethi	0x160F,	%o4
	edge32n	%l3,	%g5,	%o3
	fabss	%f24,	%f9
	movrlz	%l6,	%g2,	%o2
	movcc	%icc,	%o1,	%g4
	ld	[%l7 + 0x08],	%f12
	movcs	%xcc,	%g7,	%l4
	movpos	%icc,	%l2,	%l1
	fxor	%f2,	%f8,	%f12
	udivcc	%o6,	0x021E,	%l5
	fsrc1s	%f20,	%f11
	subc	%l0,	0x08DF,	%o7
	movrgz	%i3,	%o0,	%g6
	alignaddr	%g3,	%i1,	%i0
	orn	%i7,	%i2,	%o5
	movleu	%icc,	%i5,	%i6
	fmovsvs	%xcc,	%f13,	%f9
	ldsw	[%l7 + 0x6C],	%g1
	restore %o4, 0x1C04, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i4,	%g5,	%l6
	edge8	%o3,	%g2,	%o2
	ldd	[%l7 + 0x60],	%g4
	ldx	[%l7 + 0x78],	%g7
	edge16ln	%l4,	%o1,	%l1
	andn	%l2,	0x1A11,	%o6
	ldsw	[%l7 + 0x7C],	%l0
	movrne	%o7,	0x035,	%l5
	movpos	%xcc,	%i3,	%g6
	stb	%g3,	[%l7 + 0x18]
	fmovrdgz	%i1,	%f8,	%f20
	for	%f24,	%f20,	%f14
	fnands	%f6,	%f18,	%f2
	edge32ln	%o0,	%i7,	%i2
	sra	%o5,	0x00,	%i0
	movle	%icc,	%i6,	%g1
	udivcc	%o4,	0x1705,	%l3
	fmovrsne	%i5,	%f17,	%f17
	edge32ln	%g5,	%l6,	%o3
	edge8ln	%g2,	%o2,	%i4
	sth	%g7,	[%l7 + 0x5A]
	subc	%g4,	%o1,	%l1
	andn	%l2,	0x1D2A,	%o6
	orncc	%l0,	%o7,	%l4
	std	%f8,	[%l7 + 0x40]
	mulx	%i3,	%l5,	%g6
	orcc	%g3,	%i1,	%i7
	srl	%o0,	0x1F,	%o5
	stb	%i2,	[%l7 + 0x54]
	movn	%xcc,	%i6,	%g1
	fmovdcs	%xcc,	%f18,	%f20
	subcc	%i0,	0x056D,	%l3
	movcc	%xcc,	%o4,	%i5
	movrne	%g5,	%l6,	%g2
	fpsub16s	%f21,	%f30,	%f27
	fand	%f4,	%f22,	%f24
	sth	%o3,	[%l7 + 0x52]
	movrlz	%i4,	0x010,	%o2
	move	%xcc,	%g7,	%g4
	movne	%xcc,	%o1,	%l2
	ldub	[%l7 + 0x09],	%l1
	add	%l0,	0x0E97,	%o6
	edge16ln	%o7,	%l4,	%l5
	edge32n	%i3,	%g6,	%i1
	subc	%g3,	%i7,	%o0
	subccc	%o5,	%i2,	%g1
	edge32	%i0,	%l3,	%i6
	movpos	%icc,	%i5,	%g5
	edge8n	%o4,	%l6,	%o3
	edge8ln	%i4,	%o2,	%g7
	fnot1s	%f14,	%f12
	movle	%icc,	%g2,	%o1
	sth	%g4,	[%l7 + 0x58]
	movvc	%icc,	%l1,	%l2
	movvc	%xcc,	%l0,	%o7
	udivcc	%l4,	0x12CF,	%l5
	sdiv	%o6,	0x11EB,	%i3
	ldd	[%l7 + 0x60],	%f20
	edge16ln	%i1,	%g3,	%i7
	xnorcc	%g6,	0x1707,	%o5
	andcc	%i2,	%g1,	%o0
	fmovsneg	%xcc,	%f23,	%f3
	or	%i0,	%l3,	%i5
	edge8l	%i6,	%o4,	%g5
	andncc	%l6,	%i4,	%o2
	edge16	%o3,	%g2,	%o1
	edge8ln	%g4,	%g7,	%l1
	udivx	%l0,	0x18F7,	%l2
	fcmpd	%fcc2,	%f26,	%f20
	array32	%l4,	%o7,	%o6
	fornot1s	%f25,	%f26,	%f22
	ldd	[%l7 + 0x08],	%l4
	fmovda	%icc,	%f25,	%f17
	movle	%xcc,	%i3,	%i1
	movvc	%icc,	%g3,	%g6
	edge8l	%i7,	%i2,	%o5
	sth	%g1,	[%l7 + 0x60]
	fmovrslz	%i0,	%f2,	%f7
	movvs	%xcc,	%l3,	%i5
	ldsh	[%l7 + 0x5A],	%i6
	ldsb	[%l7 + 0x3B],	%o4
	or	%o0,	0x0F6D,	%l6
	andn	%g5,	0x1509,	%o2
	fandnot1	%f30,	%f18,	%f4
	or	%o3,	%i4,	%o1
	edge8	%g2,	%g7,	%l1
	movle	%icc,	%l0,	%g4
	movgu	%xcc,	%l2,	%l4
	orncc	%o6,	0x0F83,	%l5
	array16	%i3,	%i1,	%g3
	movrlz	%o7,	0x0A9,	%i7
	alignaddr	%i2,	%g6,	%o5
	ldx	[%l7 + 0x30],	%g1
	andcc	%l3,	%i0,	%i5
	smul	%i6,	0x0A46,	%o0
	sdivcc	%o4,	0x129F,	%g5
	ldsb	[%l7 + 0x20],	%o2
	edge16ln	%l6,	%i4,	%o3
	fmovrdgez	%o1,	%f18,	%f24
	xorcc	%g2,	0x1110,	%g7
	movneg	%icc,	%l0,	%g4
	ld	[%l7 + 0x3C],	%f29
	udivcc	%l2,	0x014C,	%l1
	andcc	%o6,	%l5,	%i3
	andcc	%i1,	0x1AEA,	%l4
	std	%f16,	[%l7 + 0x38]
	movge	%icc,	%o7,	%i7
	ldd	[%l7 + 0x08],	%f28
	movpos	%icc,	%g3,	%i2
	movle	%xcc,	%o5,	%g6
	orcc	%g1,	0x0966,	%l3
	sdiv	%i5,	0x0C7D,	%i0
	fnand	%f16,	%f24,	%f20
	sth	%o0,	[%l7 + 0x74]
	ld	[%l7 + 0x24],	%f20
	movvs	%icc,	%o4,	%g5
	fcmpne16	%f16,	%f28,	%o2
	edge8l	%l6,	%i4,	%o3
	movgu	%icc,	%i6,	%o1
	save %g7, 0x173F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x11],	%l0
	andcc	%g4,	%l2,	%l1
	edge8	%o6,	%i3,	%i1
	alignaddrl	%l5,	%o7,	%i7
	lduh	[%l7 + 0x70],	%g3
	smul	%l4,	0x09AF,	%o5
	fmovse	%xcc,	%f5,	%f10
	ld	[%l7 + 0x20],	%f29
	movneg	%xcc,	%g6,	%i2
	edge16	%l3,	%g1,	%i5
	edge32ln	%i0,	%o0,	%g5
	sethi	0x0F80,	%o4
	lduw	[%l7 + 0x54],	%l6
	movpos	%xcc,	%o2,	%i4
	ldsb	[%l7 + 0x0D],	%i6
	movrgez	%o1,	%o3,	%g7
	addcc	%g2,	%l0,	%l2
	sllx	%l1,	0x0A,	%g4
	std	%f4,	[%l7 + 0x10]
	ldsh	[%l7 + 0x22],	%o6
	srl	%i1,	0x12,	%i3
	or	%o7,	%i7,	%l5
	edge32	%l4,	%g3,	%o5
	lduh	[%l7 + 0x48],	%g6
	edge16	%l3,	%i2,	%i5
	fcmpes	%fcc3,	%f7,	%f29
	sub	%g1,	0x011F,	%o0
	alignaddr	%i0,	%g5,	%l6
	fmovrsgz	%o2,	%f3,	%f5
	ldub	[%l7 + 0x2A],	%o4
	fmovrdne	%i6,	%f28,	%f2
	fcmpgt32	%f26,	%f14,	%i4
	movrlez	%o3,	0x394,	%o1
	fandnot1s	%f8,	%f13,	%f28
	lduw	[%l7 + 0x50],	%g7
	movneg	%icc,	%g2,	%l0
	fmovsleu	%xcc,	%f23,	%f9
	fmovdleu	%icc,	%f9,	%f18
	array32	%l1,	%l2,	%g4
	array32	%i1,	%i3,	%o7
	movre	%o6,	%i7,	%l5
	umulcc	%l4,	%o5,	%g6
	fone	%f0
	nop
	set	0x18, %g7
	lduw	[%l7 + %g7],	%l3
	smulcc	%i2,	0x1C9C,	%i5
	movcs	%xcc,	%g1,	%g3
	subc	%o0,	0x0406,	%g5
	udivcc	%l6,	0x1839,	%i0
	fmovrdgz	%o4,	%f4,	%f26
	edge16n	%i6,	%o2,	%i4
	nop
	set	0x42, %o0
	sth	%o3,	[%l7 + %o0]
	edge8	%g7,	%o1,	%l0
	fmovdneg	%icc,	%f9,	%f7
	fnot1s	%f2,	%f5
	movneg	%xcc,	%l1,	%g2
	sdiv	%g4,	0x086D,	%l2
	movrlez	%i1,	0x290,	%o7
	ldsh	[%l7 + 0x0C],	%o6
	movneg	%icc,	%i7,	%i3
	movne	%xcc,	%l5,	%l4
	movge	%icc,	%o5,	%l3
	movrne	%g6,	0x1C8,	%i5
	sra	%i2,	%g3,	%g1
	st	%f25,	[%l7 + 0x3C]
	edge32	%g5,	%o0,	%i0
	udivcc	%o4,	0x093F,	%l6
	movcs	%xcc,	%i6,	%o2
	movge	%icc,	%o3,	%i4
	sllx	%o1,	0x01,	%l0
	sth	%g7,	[%l7 + 0x2C]
	fcmps	%fcc3,	%f18,	%f14
	umul	%g2,	%g4,	%l1
	udiv	%l2,	0x143D,	%i1
	xnor	%o7,	0x17E7,	%i7
	sub	%o6,	%l5,	%i3
	mulscc	%l4,	%l3,	%o5
	edge8ln	%g6,	%i2,	%i5
	st	%f26,	[%l7 + 0x6C]
	andn	%g1,	0x0707,	%g3
	srl	%g5,	%o0,	%i0
	movcc	%xcc,	%l6,	%o4
	fmovsvs	%xcc,	%f17,	%f24
	fmovdvc	%icc,	%f21,	%f13
	andncc	%o2,	%i6,	%o3
	smul	%i4,	0x06F9,	%l0
	movne	%icc,	%g7,	%o1
	edge32ln	%g2,	%l1,	%g4
	movcc	%xcc,	%i1,	%o7
	ld	[%l7 + 0x0C],	%f8
	smul	%l2,	%i7,	%l5
	st	%f3,	[%l7 + 0x60]
	edge32n	%o6,	%i3,	%l3
	movrne	%o5,	0x0AC,	%g6
	mova	%icc,	%i2,	%l4
	ld	[%l7 + 0x24],	%f14
	andn	%g1,	%i5,	%g3
	movl	%icc,	%g5,	%i0
	fmovrsne	%l6,	%f1,	%f29
	mulx	%o0,	%o2,	%o4
	movpos	%xcc,	%o3,	%i6
	alignaddrl	%i4,	%g7,	%o1
	movgu	%xcc,	%l0,	%g2
	sllx	%g4,	%l1,	%o7
	orncc	%l2,	%i1,	%l5
	sdivcc	%i7,	0x0363,	%i3
	orcc	%o6,	0x08A7,	%o5
	fmovrse	%g6,	%f24,	%f5
	fnegs	%f19,	%f15
	fones	%f22
	ldsh	[%l7 + 0x0E],	%i2
	st	%f13,	[%l7 + 0x5C]
	fones	%f9
	addccc	%l4,	%g1,	%l3
	fpackfix	%f24,	%f5
	movcs	%icc,	%g3,	%g5
	movre	%i5,	%i0,	%l6
	sdivx	%o0,	0x0C09,	%o2
	sll	%o3,	%i6,	%i4
	ldub	[%l7 + 0x0F],	%o4
	array8	%o1,	%g7,	%l0
	subccc	%g4,	%g2,	%o7
	addc	%l1,	0x0F95,	%i1
	ldd	[%l7 + 0x50],	%l2
	fpadd16s	%f8,	%f2,	%f11
	edge8l	%i7,	%i3,	%o6
	sdiv	%o5,	0x118D,	%l5
	smulcc	%i2,	%g6,	%l4
	movn	%xcc,	%l3,	%g1
	fmovda	%xcc,	%f22,	%f16
	std	%f20,	[%l7 + 0x68]
	fnors	%f19,	%f20,	%f23
	orncc	%g3,	0x0728,	%i5
	fmovdgu	%xcc,	%f17,	%f4
	addccc	%g5,	%i0,	%l6
	movg	%xcc,	%o2,	%o0
	movcc	%icc,	%i6,	%i4
	edge8n	%o4,	%o1,	%o3
	edge32ln	%g7,	%l0,	%g2
	edge16	%g4,	%o7,	%l1
	sth	%l2,	[%l7 + 0x62]
	movrgz	%i1,	%i3,	%i7
	stw	%o6,	[%l7 + 0x4C]
	fmovrdne	%l5,	%f16,	%f4
	smulcc	%o5,	%i2,	%g6
	fcmpgt16	%f16,	%f10,	%l4
	fmovs	%f5,	%f9
	fmovscc	%icc,	%f25,	%f24
	faligndata	%f16,	%f18,	%f14
	popc	%g1,	%l3
	fmovdneg	%icc,	%f27,	%f21
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%g3
	fornot1	%f4,	%f8,	%f16
	faligndata	%f16,	%f4,	%f20
	sir	0x0DE7
	ld	[%l7 + 0x2C],	%f5
	ld	[%l7 + 0x10],	%f7
	edge16	%i5,	%i0,	%l6
	ldd	[%l7 + 0x70],	%o2
	fand	%f4,	%f6,	%f4
	umul	%o0,	0x010A,	%g5
	sdivx	%i4,	0x0132,	%i6
	movcc	%xcc,	%o4,	%o3
	ld	[%l7 + 0x60],	%f6
	add	%o1,	0x02D1,	%g7
	movvs	%icc,	%g2,	%l0
	movne	%icc,	%o7,	%g4
	fcmpgt32	%f14,	%f20,	%l1
	movre	%l2,	0x024,	%i3
	movge	%xcc,	%i7,	%i1
	sdivcc	%o6,	0x0897,	%o5
	fmovrdne	%l5,	%f22,	%f30
	smul	%i2,	%g6,	%g1
	srax	%l4,	%l3,	%g3
	mova	%xcc,	%i0,	%l6
	fnot1s	%f6,	%f21
	movrne	%i5,	%o0,	%o2
	addccc	%g5,	0x0445,	%i4
	edge16	%o4,	%i6,	%o1
	srax	%g7,	0x1A,	%o3
	umulcc	%l0,	%o7,	%g4
	fxnor	%f10,	%f2,	%f18
	sub	%l1,	0x0E8B,	%g2
	edge32	%i3,	%i7,	%l2
	stx	%i1,	[%l7 + 0x78]
	movl	%xcc,	%o5,	%o6
	movrlez	%i2,	0x2F6,	%l5
	smul	%g1,	%g6,	%l3
	movvs	%icc,	%l4,	%g3
	fpadd16s	%f5,	%f20,	%f27
	move	%icc,	%l6,	%i5
	subccc	%o0,	0x0356,	%o2
	fmul8x16au	%f30,	%f1,	%f10
	faligndata	%f26,	%f10,	%f28
	ldd	[%l7 + 0x68],	%f22
	srl	%g5,	0x1E,	%i0
	fmovdpos	%xcc,	%f6,	%f14
	xorcc	%o4,	%i4,	%o1
	addcc	%g7,	0x19BD,	%i6
	smulcc	%o3,	%l0,	%g4
	fmovdl	%xcc,	%f3,	%f31
	umul	%o7,	%l1,	%i3
	addcc	%i7,	0x066C,	%g2
	movrgez	%i1,	%o5,	%o6
	array16	%i2,	%l5,	%g1
	sdiv	%g6,	0x18CC,	%l2
	edge8n	%l4,	%g3,	%l6
	fmovrdlez	%i5,	%f14,	%f10
	movl	%icc,	%o0,	%l3
	sub	%g5,	%i0,	%o2
	edge16n	%i4,	%o1,	%o4
	fone	%f12
	and	%i6,	0x0C0A,	%g7
	edge8ln	%o3,	%g4,	%o7
	smulcc	%l1,	0x0AB3,	%i3
	movne	%xcc,	%i7,	%l0
	movcs	%xcc,	%i1,	%g2
	edge8ln	%o6,	%o5,	%i2
	fmovs	%f12,	%f12
	or	%g1,	0x16C7,	%l5
	sll	%g6,	0x00,	%l2
	fmovdneg	%xcc,	%f19,	%f18
	xor	%g3,	0x0926,	%l4
	fmul8ulx16	%f22,	%f24,	%f30
	subcc	%i5,	%l6,	%l3
	orcc	%o0,	0x01A8,	%i0
	movrlz	%g5,	%i4,	%o1
	movcc	%icc,	%o4,	%i6
	sdivx	%o2,	0x0DF3,	%g7
	movg	%xcc,	%o3,	%o7
	array16	%g4,	%l1,	%i3
	movleu	%icc,	%l0,	%i1
	orn	%i7,	0x1F02,	%o6
	lduh	[%l7 + 0x12],	%g2
	sdivcc	%o5,	0x12AA,	%i2
	addc	%g1,	0x09D7,	%l5
	fmovsleu	%icc,	%f1,	%f16
	edge32	%g6,	%g3,	%l4
	movl	%xcc,	%l2,	%i5
	edge32l	%l3,	%l6,	%o0
	smul	%i0,	%i4,	%o1
	fpadd16s	%f20,	%f6,	%f21
	ldsw	[%l7 + 0x78],	%o4
	movrne	%g5,	0x040,	%i6
	subcc	%g7,	0x0E23,	%o3
	fmul8ulx16	%f18,	%f20,	%f16
	fmuld8sux16	%f4,	%f14,	%f4
	xnorcc	%o7,	0x159F,	%g4
	fcmple32	%f0,	%f22,	%o2
	xorcc	%l1,	%i3,	%l0
	alignaddr	%i1,	%i7,	%o6
	udivx	%g2,	0x150C,	%o5
	sra	%i2,	%g1,	%g6
	add	%l5,	%g3,	%l4
	std	%f28,	[%l7 + 0x68]
	sethi	0x062C,	%i5
	fnands	%f18,	%f15,	%f12
	sth	%l3,	[%l7 + 0x32]
	movrgz	%l6,	0x3D5,	%l2
	movgu	%xcc,	%i0,	%o0
	edge16l	%o1,	%o4,	%i4
	fmovsa	%icc,	%f13,	%f27
	movcc	%icc,	%g5,	%i6
	sll	%o3,	0x03,	%o7
	fmovs	%f3,	%f29
	movre	%g4,	0x3E3,	%o2
	move	%icc,	%g7,	%i3
	stx	%l1,	[%l7 + 0x70]
	orcc	%l0,	%i1,	%i7
	movpos	%xcc,	%o6,	%g2
	movneg	%icc,	%o5,	%g1
	stb	%g6,	[%l7 + 0x4F]
	array8	%i2,	%l5,	%g3
	sethi	0x1658,	%l4
	mulx	%l3,	0x0332,	%i5
	andcc	%l2,	0x1219,	%i0
	andn	%l6,	0x0283,	%o0
	movpos	%icc,	%o4,	%o1
	fmovsge	%xcc,	%f30,	%f26
	edge16	%g5,	%i6,	%o3
	stx	%i4,	[%l7 + 0x68]
	edge32l	%o7,	%o2,	%g4
	addcc	%g7,	0x0071,	%l1
	fmul8x16	%f29,	%f20,	%f0
	sth	%i3,	[%l7 + 0x1E]
	edge16l	%i1,	%l0,	%o6
	xnor	%g2,	0x02F0,	%o5
	fcmped	%fcc0,	%f24,	%f22
	fmovdleu	%icc,	%f7,	%f25
	mulscc	%i7,	%g1,	%i2
	array8	%l5,	%g6,	%g3
	edge32ln	%l3,	%l4,	%i5
	edge8	%l2,	%l6,	%o0
	alignaddr	%o4,	%o1,	%i0
	movleu	%icc,	%g5,	%o3
	movrgz	%i4,	0x231,	%i6
	edge32ln	%o7,	%g4,	%g7
	ldx	[%l7 + 0x28],	%l1
	sub	%i3,	%o2,	%l0
	mova	%xcc,	%i1,	%g2
	std	%f4,	[%l7 + 0x50]
	movl	%icc,	%o6,	%o5
	movrgz	%g1,	0x3E8,	%i7
	fmovsl	%xcc,	%f15,	%f11
	sdiv	%l5,	0x197B,	%i2
	smul	%g3,	0x0CF2,	%l3
	fabss	%f13,	%f25
	lduh	[%l7 + 0x28],	%g6
	edge32l	%l4,	%l2,	%l6
	fmovrde	%i5,	%f4,	%f0
	movn	%xcc,	%o0,	%o4
	movpos	%xcc,	%o1,	%i0
	save %o3, 0x1551, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f8,	%f18,	%i6
	alignaddrl	%o7,	%i4,	%g7
	move	%icc,	%g4,	%i3
	smulcc	%l1,	0x054D,	%l0
	xor	%i1,	%g2,	%o6
	xorcc	%o2,	0x0C6D,	%o5
	movrlz	%i7,	0x357,	%l5
	ld	[%l7 + 0x10],	%f1
	move	%xcc,	%g1,	%i2
	sllx	%g3,	0x18,	%g6
	fmovsa	%xcc,	%f1,	%f30
	movcs	%icc,	%l4,	%l2
	sdivx	%l3,	0x0F25,	%i5
	fsrc2	%f16,	%f4
	fpadd16s	%f27,	%f9,	%f4
	orncc	%o0,	%l6,	%o4
	sethi	0x0DBC,	%i0
	add	%o3,	0x0EDC,	%g5
	ldsw	[%l7 + 0x38],	%i6
	xorcc	%o7,	0x1EC4,	%i4
	movleu	%xcc,	%o1,	%g4
	sllx	%i3,	%g7,	%l1
	fmovdl	%xcc,	%f2,	%f4
	fornot2	%f2,	%f26,	%f18
	fmovsl	%icc,	%f19,	%f12
	ldsh	[%l7 + 0x6C],	%l0
	ld	[%l7 + 0x7C],	%f14
	fpsub16s	%f31,	%f8,	%f13
	fmovspos	%icc,	%f27,	%f10
	subcc	%g2,	0x05BB,	%i1
	udivx	%o2,	0x1A41,	%o5
	ldd	[%l7 + 0x10],	%f4
	fcmpgt16	%f26,	%f18,	%i7
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	movrgz	%i2,	%o6,	%g6
	save %l4, 0x0B51, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l3,	0x0F8B,	%i5
	edge32ln	%g3,	%l6,	%o4
	movn	%xcc,	%i0,	%o0
	andn	%o3,	%g5,	%o7
	alignaddr	%i4,	%i6,	%o1
	stx	%i3,	[%l7 + 0x78]
	fornot1	%f6,	%f4,	%f24
	movn	%xcc,	%g7,	%l1
	save %l0, 0x0BD1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g4,	%i1
	smul	%o2,	0x1DE6,	%o5
	edge16l	%l5,	%i7,	%g1
	smul	%i2,	%o6,	%l4
	movne	%icc,	%l2,	%g6
	movle	%icc,	%l3,	%i5
	smulcc	%l6,	0x0F79,	%o4
	orcc	%g3,	0x003D,	%i0
	sdivcc	%o0,	0x1143,	%g5
	fmovsvc	%xcc,	%f2,	%f10
	xnorcc	%o7,	%i4,	%i6
	movcc	%icc,	%o3,	%i3
	movvc	%icc,	%g7,	%l1
	movrne	%l0,	0x08E,	%g2
	fexpand	%f13,	%f0
	edge32ln	%o1,	%g4,	%i1
	orncc	%o2,	%o5,	%i7
	movrgez	%g1,	%i2,	%o6
	st	%f16,	[%l7 + 0x1C]
	fcmple16	%f24,	%f2,	%l5
	movrgez	%l4,	%g6,	%l2
	udivcc	%i5,	0x1E70,	%l6
	fmul8x16au	%f24,	%f19,	%f30
	nop
	set	0x15, %o1
	ldub	[%l7 + %o1],	%l3
	stb	%o4,	[%l7 + 0x7E]
	movcs	%icc,	%i0,	%g3
	udiv	%o0,	0x0FA6,	%g5
	edge8n	%o7,	%i6,	%i4
	and	%o3,	0x18B5,	%g7
	fmul8ulx16	%f20,	%f8,	%f14
	movn	%xcc,	%l1,	%i3
	movrgez	%g2,	0x332,	%o1
	fmovsge	%icc,	%f25,	%f30
	movl	%icc,	%g4,	%l0
	st	%f17,	[%l7 + 0x70]
	edge32n	%o2,	%o5,	%i1
	movcc	%icc,	%i7,	%i2
	udiv	%g1,	0x10BE,	%o6
	add	%l5,	0x0BF8,	%l4
	fcmpgt32	%f12,	%f6,	%l2
	movge	%xcc,	%g6,	%i5
	edge8n	%l6,	%o4,	%l3
	movne	%xcc,	%i0,	%o0
	edge16l	%g5,	%o7,	%i6
	stw	%g3,	[%l7 + 0x48]
	or	%i4,	%g7,	%l1
	orcc	%i3,	%o3,	%o1
	fpackfix	%f12,	%f1
	movcs	%icc,	%g2,	%l0
	mova	%xcc,	%o2,	%g4
	lduw	[%l7 + 0x34],	%i1
	ldsb	[%l7 + 0x56],	%i7
	xnor	%o5,	0x0C7E,	%i2
	movleu	%icc,	%g1,	%l5
	srlx	%o6,	0x02,	%l2
	orncc	%l4,	%g6,	%l6
	restore %i5, %l3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f20,	%f0,	%f16
	fcmpne32	%f4,	%f6,	%o4
	movvs	%xcc,	%g5,	%o7
	fmovrsgez	%i6,	%f11,	%f19
	fones	%f4
	movrgez	%o0,	0x372,	%g3
	st	%f14,	[%l7 + 0x08]
	addccc	%i4,	%g7,	%l1
	edge16	%o3,	%i3,	%o1
	fsrc1	%f10,	%f22
	fmul8x16	%f3,	%f2,	%f2
	fpadd32s	%f17,	%f6,	%f17
	movrgez	%g2,	0x391,	%l0
	nop
	set	0x56, %i6
	sth	%o2,	[%l7 + %i6]
	sdivcc	%i1,	0x1163,	%g4
	ldub	[%l7 + 0x3B],	%o5
	movrgez	%i7,	%g1,	%l5
	fands	%f2,	%f16,	%f4
	ldd	[%l7 + 0x40],	%f16
	ldsw	[%l7 + 0x7C],	%i2
	movrne	%o6,	0x35F,	%l4
	sdivcc	%l2,	0x0FF1,	%l6
	srax	%i5,	%l3,	%i0
	lduw	[%l7 + 0x20],	%o4
	edge8ln	%g6,	%o7,	%g5
	movn	%icc,	%o0,	%g3
	fcmple16	%f22,	%f28,	%i4
	edge8	%g7,	%l1,	%o3
	srl	%i6,	0x05,	%i3
	popc	%g2,	%l0
	fandnot1	%f16,	%f10,	%f14
	movn	%icc,	%o2,	%o1
	subccc	%i1,	0x06B4,	%g4
	ldd	[%l7 + 0x70],	%i6
	array16	%g1,	%o5,	%i2
	sub	%o6,	0x09B1,	%l4
	xorcc	%l5,	0x050E,	%l2
	addccc	%l6,	%i5,	%l3
	fmovdcc	%xcc,	%f13,	%f20
	ldub	[%l7 + 0x71],	%o4
	addcc	%g6,	0x197F,	%i0
	orcc	%o7,	%g5,	%o0
	movpos	%icc,	%i4,	%g7
	fpackfix	%f4,	%f31
	fmovsne	%xcc,	%f5,	%f26
	ldd	[%l7 + 0x48],	%f28
	stx	%g3,	[%l7 + 0x30]
	or	%o3,	%l1,	%i3
	or	%g2,	%i6,	%o2
	fcmpeq16	%f24,	%f4,	%o1
	addc	%i1,	%l0,	%i7
	fzero	%f12
	smul	%g1,	0x1409,	%o5
	movvc	%icc,	%i2,	%g4
	fmovspos	%icc,	%f29,	%f27
	edge16n	%o6,	%l4,	%l2
	sll	%l5,	%l6,	%l3
	sir	0x19E7
	st	%f27,	[%l7 + 0x20]
	and	%i5,	0x1BA5,	%o4
	movle	%xcc,	%g6,	%i0
	umul	%o7,	0x13BD,	%o0
	fcmpeq32	%f8,	%f20,	%g5
	edge16n	%i4,	%g3,	%g7
	movpos	%icc,	%l1,	%o3
	movn	%xcc,	%g2,	%i6
	edge32	%i3,	%o1,	%o2
	movle	%icc,	%i1,	%i7
	movre	%g1,	%o5,	%i2
	mulx	%g4,	0x0E2A,	%o6
	fnot2	%f20,	%f16
	sdiv	%l4,	0x19C4,	%l0
	edge32l	%l5,	%l6,	%l3
	movl	%xcc,	%l2,	%o4
	fandnot2	%f6,	%f20,	%f16
	mulscc	%g6,	0x1A44,	%i5
	and	%i0,	0x0D9B,	%o0
	udivx	%g5,	0x1E3D,	%o7
	udivcc	%g3,	0x193E,	%i4
	orn	%g7,	0x1DC6,	%l1
	movrgz	%g2,	%o3,	%i6
	ldd	[%l7 + 0x70],	%f10
	andn	%o1,	%i3,	%i1
	nop
	set	0x70, %i0
	std	%f28,	[%l7 + %i0]
	fmovdne	%icc,	%f6,	%f7
	xnorcc	%i7,	%o2,	%o5
	stx	%g1,	[%l7 + 0x18]
	movg	%icc,	%g4,	%i2
	edge32	%o6,	%l4,	%l5
	fcmps	%fcc2,	%f15,	%f21
	movl	%icc,	%l0,	%l6
	fmovrse	%l3,	%f27,	%f27
	movrgez	%l2,	%o4,	%g6
	edge32	%i0,	%i5,	%o0
	fpadd16	%f24,	%f16,	%f0
	fmovdcc	%xcc,	%f26,	%f12
	fnegd	%f8,	%f10
	udivx	%g5,	0x1B72,	%o7
	movleu	%xcc,	%i4,	%g3
	movre	%g7,	%g2,	%l1
	umul	%o3,	%o1,	%i3
	ldx	[%l7 + 0x18],	%i1
	fmovsneg	%icc,	%f16,	%f14
	xor	%i7,	%i6,	%o2
	movrgez	%o5,	0x2F7,	%g1
	stw	%i2,	[%l7 + 0x40]
	ld	[%l7 + 0x74],	%f4
	or	%g4,	%l4,	%l5
	ldsh	[%l7 + 0x6C],	%l0
	array8	%l6,	%o6,	%l3
	fmovsl	%xcc,	%f20,	%f13
	sdiv	%o4,	0x1BAA,	%l2
	subcc	%i0,	0x013C,	%g6
	st	%f24,	[%l7 + 0x14]
	mova	%xcc,	%i5,	%g5
	ld	[%l7 + 0x38],	%f9
	srax	%o7,	0x17,	%o0
	ld	[%l7 + 0x74],	%f9
	movrgz	%g3,	0x023,	%i4
	umul	%g2,	%g7,	%o3
	addcc	%l1,	%o1,	%i3
	edge8l	%i1,	%i7,	%i6
	movrgz	%o5,	%g1,	%o2
	mova	%xcc,	%i2,	%g4
	save %l4, %l0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f12,	%f2
	fcmpne16	%f22,	%f2,	%l6
	edge32n	%l3,	%o4,	%l2
	srlx	%i0,	%g6,	%o6
	ldd	[%l7 + 0x28],	%g4
	fcmpne32	%f22,	%f2,	%i5
	fmovse	%xcc,	%f7,	%f17
	fmovrslez	%o0,	%f19,	%f30
	srax	%o7,	%i4,	%g2
	xor	%g3,	0x0204,	%o3
	sethi	0x18C0,	%l1
	movle	%icc,	%o1,	%g7
	fmovrse	%i1,	%f26,	%f27
	edge8ln	%i3,	%i6,	%o5
	fmovsne	%xcc,	%f14,	%f9
	smulcc	%g1,	%o2,	%i2
	movle	%icc,	%g4,	%i7
	fandnot2	%f18,	%f30,	%f8
	ldsb	[%l7 + 0x49],	%l4
	movg	%xcc,	%l0,	%l6
	fmovdvc	%icc,	%f30,	%f6
	fmovsg	%icc,	%f8,	%f9
	umul	%l5,	0x0166,	%l3
	fmovrdlz	%o4,	%f6,	%f6
	fmovsle	%icc,	%f25,	%f28
	movneg	%icc,	%l2,	%g6
	ldx	[%l7 + 0x10],	%i0
	array32	%o6,	%g5,	%i5
	smul	%o0,	0x0F9B,	%o7
	edge32ln	%g2,	%i4,	%g3
	ldd	[%l7 + 0x60],	%o2
	movgu	%icc,	%o1,	%g7
	ldsw	[%l7 + 0x38],	%l1
	edge16	%i3,	%i6,	%i1
	xorcc	%o5,	%g1,	%o2
	subcc	%i2,	0x13CA,	%i7
	lduh	[%l7 + 0x68],	%g4
	lduh	[%l7 + 0x46],	%l4
	subcc	%l0,	%l5,	%l6
	std	%f10,	[%l7 + 0x20]
	ldub	[%l7 + 0x45],	%o4
	edge16	%l3,	%l2,	%g6
	mulx	%i0,	%o6,	%i5
	sub	%o0,	%o7,	%g2
	and	%g5,	0x0831,	%g3
	edge32n	%i4,	%o3,	%g7
	ldsh	[%l7 + 0x7C],	%o1
	array16	%i3,	%i6,	%i1
	fmovsgu	%xcc,	%f6,	%f19
	alignaddrl	%l1,	%g1,	%o5
	edge8n	%o2,	%i7,	%i2
	xnorcc	%g4,	%l4,	%l0
	srl	%l5,	%o4,	%l6
	fcmpgt32	%f14,	%f26,	%l2
	orn	%g6,	%l3,	%i0
	mulx	%o6,	%o0,	%o7
	fmovrse	%g2,	%f15,	%f5
	addccc	%g5,	0x0522,	%g3
	fmovdne	%icc,	%f10,	%f23
	smul	%i5,	%o3,	%i4
	movvc	%xcc,	%o1,	%i3
	mulx	%g7,	0x0C6B,	%i1
	xorcc	%l1,	%i6,	%o5
	movrgz	%o2,	0x017,	%i7
	orcc	%i2,	%g4,	%g1
	srax	%l0,	%l5,	%l4
	fmovrsne	%o4,	%f29,	%f30
	fpackfix	%f8,	%f4
	movrne	%l2,	0x052,	%g6
	edge8l	%l6,	%l3,	%o6
	movrgez	%o0,	%i0,	%o7
	edge8ln	%g5,	%g2,	%g3
	mova	%xcc,	%o3,	%i4
	alignaddr	%o1,	%i5,	%i3
	or	%g7,	0x0CA8,	%l1
	sth	%i6,	[%l7 + 0x2A]
	array32	%i1,	%o2,	%o5
	edge32n	%i2,	%i7,	%g4
	st	%f24,	[%l7 + 0x60]
	subccc	%g1,	0x1D20,	%l0
	fmovsvc	%xcc,	%f26,	%f4
	andncc	%l4,	%o4,	%l2
	nop
	set	0x3D, %o5
	stb	%g6,	[%l7 + %o5]
	orncc	%l5,	%l6,	%l3
	andcc	%o0,	%o6,	%o7
	sra	%i0,	%g2,	%g5
	movcs	%icc,	%o3,	%g3
	popc	%o1,	%i4
	xor	%i3,	0x15CC,	%i5
	mova	%icc,	%l1,	%i6
	movgu	%icc,	%g7,	%o2
	movl	%xcc,	%i1,	%o5
	srl	%i2,	%i7,	%g4
	edge32l	%l0,	%l4,	%o4
	addcc	%g1,	0x06E1,	%l2
	mulx	%g6,	0x1C41,	%l5
	xor	%l6,	%l3,	%o0
	fmovdn	%icc,	%f5,	%f8
	fmovrsgz	%o6,	%f28,	%f15
	fnegd	%f26,	%f10
	addc	%o7,	%g2,	%g5
	sdiv	%i0,	0x1C94,	%o3
	popc	0x1018,	%o1
	movle	%icc,	%g3,	%i3
	fmovsg	%xcc,	%f20,	%f17
	movleu	%xcc,	%i5,	%l1
	lduh	[%l7 + 0x30],	%i6
	fornot1s	%f0,	%f16,	%f22
	umul	%g7,	0x124F,	%i4
	movvs	%icc,	%i1,	%o5
	fpadd16	%f24,	%f24,	%f0
	umulcc	%i2,	0x0957,	%o2
	sdivx	%g4,	0x0BD8,	%i7
	edge32n	%l4,	%l0,	%o4
	move	%xcc,	%g1,	%g6
	ldsw	[%l7 + 0x4C],	%l5
	edge16	%l6,	%l2,	%o0
	movneg	%xcc,	%l3,	%o7
	ldx	[%l7 + 0x30],	%o6
	orcc	%g5,	%g2,	%o3
	sra	%i0,	%g3,	%i3
	fmovsneg	%icc,	%f9,	%f20
	fpsub32	%f26,	%f24,	%f10
	movle	%xcc,	%o1,	%l1
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	edge8n	%i1,	%i6,	%i2
	fmovrdgz	%o5,	%f16,	%f16
	stw	%g4,	[%l7 + 0x54]
	for	%f10,	%f8,	%f22
	fcmps	%fcc1,	%f2,	%f17
	edge32	%i7,	%l4,	%l0
	movle	%icc,	%o4,	%o2
	sth	%g6,	[%l7 + 0x7C]
	smul	%l5,	0x1F6C,	%l6
	stw	%g1,	[%l7 + 0x20]
	sdivcc	%o0,	0x11C2,	%l2
	edge32ln	%o7,	%o6,	%g5
	movvs	%xcc,	%l3,	%o3
	fpsub32s	%f18,	%f19,	%f13
	mova	%xcc,	%g2,	%g3
	edge8n	%i3,	%i0,	%l1
	nop
	set	0x79, %g3
	ldub	[%l7 + %g3],	%o1
	edge32	%g7,	%i4,	%i5
	sir	0x04AE
	lduh	[%l7 + 0x0C],	%i6
	ldsw	[%l7 + 0x78],	%i1
	movneg	%icc,	%i2,	%g4
	fornot1	%f6,	%f2,	%f12
	or	%i7,	0x0A18,	%l4
	fnegd	%f8,	%f26
	fsrc2s	%f26,	%f2
	edge16ln	%l0,	%o5,	%o2
	umulcc	%o4,	0x116E,	%g6
	edge8n	%l5,	%g1,	%o0
	movpos	%xcc,	%l2,	%l6
	stx	%o6,	[%l7 + 0x78]
	fmovspos	%icc,	%f18,	%f8
	movvs	%icc,	%g5,	%l3
	std	%f28,	[%l7 + 0x40]
	popc	0x1C67,	%o7
	fmovrslez	%o3,	%f23,	%f23
	edge32	%g2,	%i3,	%g3
	sir	0x1FDF
	movge	%xcc,	%l1,	%o1
	fxnors	%f24,	%f27,	%f30
	mova	%xcc,	%i0,	%i4
	edge32l	%g7,	%i5,	%i1
	fmovscc	%xcc,	%f5,	%f19
	orn	%i2,	%g4,	%i6
	ldub	[%l7 + 0x66],	%i7
	smulcc	%l0,	0x1512,	%l4
	mova	%icc,	%o5,	%o2
	fcmpeq16	%f16,	%f2,	%o4
	sllx	%l5,	0x10,	%g6
	fsrc1	%f14,	%f0
	edge32ln	%o0,	%l2,	%g1
	fzeros	%f26
	ldd	[%l7 + 0x58],	%o6
	lduw	[%l7 + 0x34],	%l6
	movvc	%xcc,	%g5,	%l3
	fmovsvc	%xcc,	%f8,	%f6
	mulscc	%o3,	0x1A89,	%g2
	fnot1	%f4,	%f10
	edge32n	%o7,	%g3,	%i3
	movn	%xcc,	%o1,	%i0
	sra	%i4,	%l1,	%g7
	stw	%i5,	[%l7 + 0x10]
	fmovdleu	%icc,	%f7,	%f10
	st	%f15,	[%l7 + 0x40]
	xor	%i2,	%i1,	%i6
	xorcc	%i7,	0x12B6,	%l0
	sra	%g4,	0x1D,	%o5
	array16	%o2,	%l4,	%l5
	alignaddrl	%o4,	%o0,	%g6
	stx	%l2,	[%l7 + 0x60]
	fpadd32	%f22,	%f4,	%f24
	ldd	[%l7 + 0x50],	%f2
	fmovrslz	%o6,	%f25,	%f31
	edge8	%l6,	%g1,	%g5
	udivx	%l3,	0x1A2A,	%g2
	srl	%o3,	%o7,	%g3
	ldub	[%l7 + 0x39],	%o1
	save %i3, %i4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g7,	%i5,	%i2
	array16	%l1,	%i6,	%i1
	lduw	[%l7 + 0x34],	%l0
	movneg	%icc,	%i7,	%o5
	sethi	0x05E3,	%o2
	movcs	%xcc,	%l4,	%g4
	edge8ln	%l5,	%o0,	%o4
	fmovsl	%xcc,	%f1,	%f11
	edge32ln	%l2,	%g6,	%l6
	movne	%icc,	%o6,	%g5
	udivcc	%l3,	0x0330,	%g2
	andcc	%o3,	0x1E23,	%g1
	ldd	[%l7 + 0x18],	%f18
	movle	%icc,	%g3,	%o7
	udivcc	%i3,	0x1104,	%o1
	movne	%xcc,	%i0,	%g7
	sdivx	%i5,	0x0A06,	%i4
	addccc	%l1,	0x1A03,	%i6
	fmovrslez	%i1,	%f1,	%f23
	fmovspos	%xcc,	%f11,	%f24
	edge8n	%l0,	%i7,	%i2
	movvc	%icc,	%o2,	%o5
	mulscc	%l4,	0x0318,	%g4
	movgu	%icc,	%l5,	%o4
	fpackfix	%f0,	%f13
	fmuld8ulx16	%f1,	%f22,	%f28
	movrgez	%l2,	0x2A7,	%g6
	movrne	%l6,	0x200,	%o6
	ldub	[%l7 + 0x0C],	%o0
	lduw	[%l7 + 0x48],	%g5
	movvc	%icc,	%g2,	%l3
	addcc	%o3,	%g1,	%o7
	movrgz	%g3,	%i3,	%i0
	st	%f29,	[%l7 + 0x34]
	restore %g7, 0x193A, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f12,	%f22,	%i4
	fpsub16	%f24,	%f2,	%f12
	movne	%icc,	%l1,	%i6
	fmovrse	%i5,	%f9,	%f12
	andn	%l0,	0x1444,	%i1
	movcc	%xcc,	%i7,	%o2
	alignaddrl	%i2,	%l4,	%o5
	movpos	%xcc,	%g4,	%o4
	xnorcc	%l5,	0x0207,	%l2
	fmovdge	%icc,	%f13,	%f29
	lduh	[%l7 + 0x2E],	%l6
	udivcc	%o6,	0x0823,	%o0
	ldsb	[%l7 + 0x6C],	%g6
	popc	%g2,	%l3
	edge8ln	%g5,	%g1,	%o7
	ldsw	[%l7 + 0x18],	%o3
	sth	%g3,	[%l7 + 0x62]
	orcc	%i0,	%i3,	%o1
	xor	%g7,	%i4,	%i6
	sdivcc	%i5,	0x1D7C,	%l0
	sdivcc	%i1,	0x112F,	%i7
	fexpand	%f5,	%f12
	ldsb	[%l7 + 0x57],	%o2
	fpsub32s	%f15,	%f4,	%f12
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	addccc	%l4,	%o4,	%l5
	sdiv	%l2,	0x155A,	%l6
	and	%g4,	%o0,	%o6
	ldub	[%l7 + 0x13],	%g2
	array8	%g6,	%g5,	%l3
	fmovdcs	%icc,	%f3,	%f12
	edge8l	%o7,	%o3,	%g1
	fexpand	%f2,	%f28
	edge8n	%i0,	%g3,	%o1
	sub	%i3,	%i4,	%g7
	udiv	%i5,	0x0CF9,	%l0
	edge32ln	%i6,	%i7,	%i1
	edge32ln	%i2,	%o2,	%o5
	subccc	%l1,	0x0076,	%l4
	movcs	%icc,	%l5,	%o4
	movleu	%icc,	%l2,	%g4
	lduh	[%l7 + 0x4A],	%l6
	movvc	%icc,	%o6,	%o0
	smulcc	%g6,	0x1DF5,	%g2
	fpadd16	%f20,	%f30,	%f20
	alignaddrl	%g5,	%o7,	%l3
	ldsh	[%l7 + 0x60],	%o3
	array16	%g1,	%i0,	%o1
	andcc	%g3,	%i3,	%g7
	edge16n	%i5,	%i4,	%l0
	stb	%i7,	[%l7 + 0x56]
	mulx	%i1,	%i2,	%i6
	edge16	%o5,	%l1,	%o2
	movrgez	%l4,	0x383,	%o4
	fpadd32s	%f20,	%f11,	%f21
	movvs	%icc,	%l5,	%g4
	fmovsvc	%xcc,	%f22,	%f30
	andcc	%l2,	0x01F0,	%o6
	addccc	%o0,	0x1E78,	%g6
	srl	%l6,	0x0F,	%g2
	fmovrdlez	%o7,	%f26,	%f8
	stx	%l3,	[%l7 + 0x78]
	edge32	%o3,	%g1,	%i0
	andcc	%o1,	%g3,	%i3
	xnor	%g7,	%g5,	%i4
	orn	%i5,	%i7,	%i1
	smul	%l0,	%i6,	%i2
	ldsb	[%l7 + 0x3D],	%l1
	xnorcc	%o5,	%o2,	%l4
	edge8	%l5,	%o4,	%l2
	addc	%g4,	0x0E6B,	%o0
	movgu	%xcc,	%g6,	%o6
	edge16l	%l6,	%g2,	%o7
	movcs	%xcc,	%o3,	%l3
	fcmpne16	%f10,	%f24,	%i0
	array8	%g1,	%o1,	%i3
	fmul8ulx16	%f18,	%f10,	%f16
	movgu	%xcc,	%g7,	%g5
	ldsb	[%l7 + 0x3A],	%g3
	ldsw	[%l7 + 0x44],	%i5
	or	%i7,	0x1886,	%i1
	fmul8x16au	%f3,	%f28,	%f2
	movcs	%icc,	%i4,	%i6
	fornot2s	%f20,	%f31,	%f27
	andcc	%i2,	%l0,	%o5
	movgu	%xcc,	%o2,	%l4
	stb	%l1,	[%l7 + 0x27]
	srl	%l5,	0x0A,	%l2
	orn	%o4,	%g4,	%g6
	movleu	%xcc,	%o6,	%o0
	udivx	%g2,	0x100B,	%l6
	save %o7, %l3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x50],	%g1
	movrgez	%i0,	%o1,	%g7
	movre	%i3,	0x2C6,	%g3
	fmovrdne	%i5,	%f2,	%f28
	mulx	%i7,	%g5,	%i4
	st	%f27,	[%l7 + 0x68]
	fabsd	%f14,	%f18
	array32	%i6,	%i1,	%l0
	subcc	%o5,	%i2,	%l4
	sdiv	%l1,	0x05D2,	%o2
	fmovse	%xcc,	%f7,	%f16
	smul	%l2,	%o4,	%g4
	movne	%icc,	%l5,	%o6
	move	%xcc,	%o0,	%g2
	fmovrsgez	%g6,	%f12,	%f19
	movcc	%xcc,	%l6,	%o7
	xnorcc	%o3,	%g1,	%i0
	xor	%l3,	0x1791,	%o1
	nop
	set	0x6F, %g4
	ldsb	[%l7 + %g4],	%g7
	and	%g3,	0x09E9,	%i3
	edge16	%i7,	%g5,	%i4
	orcc	%i5,	0x1713,	%i6
	fornot1	%f20,	%f8,	%f0
	mova	%xcc,	%l0,	%i1
	sth	%i2,	[%l7 + 0x4A]
	orcc	%l4,	0x1D4A,	%l1
	fmovdleu	%icc,	%f12,	%f12
	movrgz	%o5,	0x257,	%o2
	fmovsneg	%icc,	%f3,	%f8
	orcc	%o4,	%l2,	%g4
	sth	%o6,	[%l7 + 0x14]
	movleu	%icc,	%l5,	%o0
	movne	%icc,	%g2,	%l6
	nop
	set	0x08, %i7
	lduw	[%l7 + %i7],	%o7
	movneg	%xcc,	%g6,	%g1
	and	%i0,	%o3,	%l3
	ldd	[%l7 + 0x40],	%o0
	ldsb	[%l7 + 0x70],	%g7
	fmul8x16	%f8,	%f18,	%f8
	andncc	%g3,	%i7,	%i3
	restore %g5, 0x105D, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x6C],	%f1
	fcmped	%fcc2,	%f6,	%f30
	lduh	[%l7 + 0x5A],	%i4
	srax	%l0,	%i1,	%i6
	nop
	set	0x0E, %l4
	sth	%i2,	[%l7 + %l4]
	addccc	%l4,	0x1737,	%o5
	ldub	[%l7 + 0x64],	%l1
	sra	%o2,	%o4,	%g4
	umul	%o6,	0x1B1F,	%l2
	fmovspos	%xcc,	%f28,	%f6
	srax	%o0,	0x01,	%g2
	movcs	%icc,	%l6,	%o7
	sdiv	%g6,	0x188B,	%g1
	fsrc2	%f8,	%f20
	movne	%icc,	%i0,	%l5
	movg	%xcc,	%o3,	%o1
	ldub	[%l7 + 0x73],	%g7
	edge16n	%l3,	%i7,	%i3
	fmovrdgez	%g5,	%f8,	%f0
	srl	%g3,	0x00,	%i5
	movcc	%xcc,	%l0,	%i4
	xnorcc	%i6,	0x0F7B,	%i1
	movg	%icc,	%l4,	%o5
	fmovda	%xcc,	%f1,	%f17
	sub	%i2,	%o2,	%o4
	edge16ln	%l1,	%g4,	%l2
	movrlez	%o0,	0x259,	%g2
	movleu	%xcc,	%l6,	%o7
	fmovrdlz	%g6,	%f8,	%f22
	and	%o6,	%i0,	%l5
	fmovdg	%xcc,	%f6,	%f22
	move	%xcc,	%g1,	%o3
	nop
	set	0x6E, %l2
	sth	%g7,	[%l7 + %l2]
	lduh	[%l7 + 0x1A],	%o1
	andn	%i7,	0x0EA6,	%l3
	fmovdg	%xcc,	%f28,	%f27
	fmovrdgz	%g5,	%f6,	%f18
	xnorcc	%i3,	0x12CE,	%i5
	fmovspos	%xcc,	%f28,	%f23
	movvs	%icc,	%g3,	%l0
	movrlz	%i6,	0x013,	%i4
	srlx	%l4,	0x17,	%i1
	sdivcc	%i2,	0x0215,	%o2
	fandnot1s	%f11,	%f31,	%f12
	ldd	[%l7 + 0x48],	%o4
	stw	%o5,	[%l7 + 0x2C]
	sth	%l1,	[%l7 + 0x50]
	sll	%g4,	%o0,	%g2
	fmovscs	%icc,	%f9,	%f22
	fornot1s	%f15,	%f9,	%f30
	pdist	%f8,	%f18,	%f16
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	restore %g6, 0x07CE, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%xcc,	%f12,	%f2
	edge8	%o7,	%l5,	%i0
	fmovsl	%xcc,	%f29,	%f17
	movrne	%o3,	%g7,	%g1
	sub	%i7,	0x07C9,	%o1
	and	%g5,	0x0908,	%i3
	movle	%xcc,	%i5,	%l3
	fsrc2	%f20,	%f16
	edge32n	%g3,	%l0,	%i6
	edge8n	%i4,	%i1,	%l4
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	move	%xcc,	%o2,	%o5
	fandnot1	%f30,	%f2,	%f8
	fmovsvc	%icc,	%f7,	%f3
	umul	%l1,	%o0,	%g2
	fmovrsne	%g4,	%f23,	%f7
	fcmpd	%fcc3,	%f24,	%f22
	move	%xcc,	%l2,	%g6
	addccc	%l6,	0x0064,	%o7
	fmovdneg	%xcc,	%f3,	%f28
	umulcc	%o6,	0x1019,	%i0
	fmovspos	%icc,	%f29,	%f3
	add	%l5,	%o3,	%g1
	fexpand	%f18,	%f10
	orn	%g7,	0x08B3,	%i7
	sethi	0x018E,	%g5
	edge16l	%o1,	%i5,	%i3
	fmovdgu	%xcc,	%f21,	%f21
	std	%f28,	[%l7 + 0x20]
	array16	%l3,	%g3,	%i6
	sth	%l0,	[%l7 + 0x22]
	movvs	%xcc,	%i1,	%l4
	xnor	%i2,	%o4,	%o2
	addccc	%o5,	0x0B6F,	%l1
	umulcc	%o0,	0x1FED,	%g2
	fnands	%f12,	%f13,	%f0
	movpos	%icc,	%g4,	%l2
	fmovdge	%icc,	%f17,	%f14
	fnot1	%f6,	%f30
	srl	%g6,	0x11,	%l6
	edge8l	%o7,	%o6,	%i4
	fcmpes	%fcc0,	%f18,	%f7
	fmovrdne	%l5,	%f12,	%f14
	array32	%i0,	%o3,	%g1
	alignaddr	%i7,	%g7,	%g5
	edge8	%i5,	%i3,	%o1
	xor	%l3,	%i6,	%l0
	smulcc	%i1,	0x08C3,	%l4
	sir	0x1236
	edge8n	%g3,	%o4,	%o2
	fmovda	%icc,	%f4,	%f25
	movrgz	%i2,	%o5,	%l1
	fmovdge	%xcc,	%f9,	%f16
	edge8n	%g2,	%o0,	%l2
	fnegs	%f25,	%f8
	sdivx	%g6,	0x1B9B,	%l6
	fone	%f30
	movcs	%xcc,	%o7,	%g4
	movcs	%xcc,	%o6,	%l5
	movrgez	%i0,	%o3,	%g1
	fmovspos	%xcc,	%f19,	%f12
	fors	%f4,	%f14,	%f2
	add	%i4,	0x1A10,	%i7
	array16	%g5,	%g7,	%i5
	movle	%xcc,	%o1,	%i3
	andn	%i6,	0x1992,	%l3
	fmovsge	%icc,	%f8,	%f7
	or	%i1,	%l4,	%g3
	movleu	%xcc,	%o4,	%o2
	fmovdgu	%xcc,	%f24,	%f6
	sdivx	%i2,	0x1708,	%l0
	addc	%l1,	0x1482,	%g2
	fxors	%f4,	%f30,	%f13
	sir	0x1C4D
	smulcc	%o0,	0x1ED9,	%o5
	nop
	set	0x10, %i3
	stx	%g6,	[%l7 + %i3]
	ldub	[%l7 + 0x25],	%l2
	udivx	%o7,	0x1BFC,	%l6
	movn	%xcc,	%g4,	%o6
	udiv	%l5,	0x126D,	%i0
	fmovrdlz	%o3,	%f12,	%f16
	smul	%i4,	0x1C3A,	%g1
	fmovsleu	%xcc,	%f18,	%f10
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%i7
	fmovrsne	%g7,	%f1,	%f28
	edge32	%i5,	%g5,	%o1
	srax	%i3,	0x1E,	%l3
	st	%f12,	[%l7 + 0x4C]
	srax	%i6,	0x0A,	%l4
	smul	%i1,	%g3,	%o4
	fmovdneg	%xcc,	%f10,	%f20
	edge16l	%o2,	%i2,	%l0
	udivx	%l1,	0x1C50,	%o0
	fcmped	%fcc1,	%f14,	%f22
	movrgez	%g2,	0x102,	%o5
	movneg	%icc,	%l2,	%g6
	fmovsne	%xcc,	%f10,	%f22
	stb	%o7,	[%l7 + 0x08]
	subc	%l6,	%g4,	%o6
	subccc	%l5,	%i0,	%o3
	sir	0x167C
	sdivcc	%i4,	0x188A,	%g1
	lduw	[%l7 + 0x0C],	%g7
	fmovdcc	%xcc,	%f17,	%f26
	nop
	set	0x70, %l6
	stx	%i5,	[%l7 + %l6]
	fnot1s	%f10,	%f28
	movle	%icc,	%g5,	%i7
	sir	0x1DF1
	alignaddr	%i3,	%o1,	%i6
	edge16n	%l3,	%l4,	%g3
	fmovdpos	%icc,	%f12,	%f3
	addc	%i1,	0x09F4,	%o4
	sra	%i2,	%l0,	%l1
	fmovrslz	%o0,	%f10,	%f14
	ldsh	[%l7 + 0x2E],	%g2
	edge32n	%o5,	%l2,	%o2
	umul	%o7,	0x177E,	%g6
	stb	%g4,	[%l7 + 0x2C]
	ld	[%l7 + 0x48],	%f29
	array16	%o6,	%l5,	%l6
	or	%i0,	0x1B2E,	%i4
	movle	%xcc,	%g1,	%o3
	mulscc	%g7,	0x04F2,	%g5
	fmovdcs	%icc,	%f19,	%f25
	mulscc	%i7,	0x0B3B,	%i5
	move	%xcc,	%i3,	%i6
	fzeros	%f28
	ldd	[%l7 + 0x68],	%o0
	lduw	[%l7 + 0x74],	%l4
	sethi	0x1EB5,	%l3
	fmovrsgez	%g3,	%f29,	%f21
	fnand	%f2,	%f6,	%f6
	fmovscc	%xcc,	%f29,	%f29
	movvs	%icc,	%o4,	%i1
	fmovrdne	%i2,	%f2,	%f4
	lduh	[%l7 + 0x3E],	%l0
	array16	%l1,	%g2,	%o0
	movneg	%xcc,	%o5,	%l2
	smul	%o7,	%o2,	%g6
	sir	0x1D61
	fexpand	%f18,	%f14
	edge32n	%o6,	%g4,	%l5
	fmovrslz	%l6,	%f4,	%f25
	movcs	%xcc,	%i0,	%g1
	edge8l	%i4,	%g7,	%g5
	movg	%xcc,	%i7,	%o3
	sdiv	%i3,	0x057C,	%i6
	sth	%o1,	[%l7 + 0x30]
	movrne	%l4,	0x138,	%l3
	andncc	%g3,	%o4,	%i1
	edge32n	%i5,	%i2,	%l0
	movn	%xcc,	%g2,	%o0
	array32	%l1,	%l2,	%o7
	movgu	%xcc,	%o5,	%o2
	fpadd32s	%f27,	%f22,	%f4
	nop
	set	0x70, %o4
	stb	%o6,	[%l7 + %o4]
	movre	%g4,	%l5,	%g6
	movvs	%icc,	%i0,	%g1
	edge32ln	%i4,	%g7,	%g5
	fmovdgu	%xcc,	%f4,	%f4
	movcs	%icc,	%i7,	%o3
	subc	%i3,	0x09BF,	%l6
	edge16ln	%o1,	%l4,	%l3
	array16	%i6,	%o4,	%g3
	array8	%i5,	%i1,	%i2
	smulcc	%g2,	%l0,	%o0
	edge32	%l1,	%o7,	%o5
	fmovrdgz	%l2,	%f14,	%f2
	movg	%xcc,	%o2,	%o6
	movn	%xcc,	%g4,	%l5
	fmovdn	%icc,	%f10,	%f22
	ldd	[%l7 + 0x38],	%g6
	movrne	%g1,	0x0CF,	%i0
	lduh	[%l7 + 0x76],	%g7
	xorcc	%g5,	%i7,	%o3
	movleu	%xcc,	%i3,	%i4
	sllx	%o1,	0x18,	%l6
	ld	[%l7 + 0x58],	%f18
	sethi	0x1AF0,	%l4
	array32	%i6,	%o4,	%l3
	popc	0x1CD0,	%i5
	fxors	%f10,	%f0,	%f30
	array8	%i1,	%g3,	%i2
	smul	%g2,	0x1646,	%o0
	fzeros	%f28
	udivx	%l1,	0x00F5,	%l0
	movcs	%icc,	%o7,	%l2
	popc	0x1302,	%o5
	xor	%o2,	%g4,	%l5
	edge32ln	%g6,	%g1,	%i0
	alignaddrl	%g7,	%g5,	%o6
	movrne	%o3,	%i7,	%i4
	edge8	%o1,	%l6,	%i3
	array8	%i6,	%l4,	%l3
	movcc	%icc,	%i5,	%o4
	fmovdvc	%icc,	%f4,	%f19
	fnor	%f26,	%f22,	%f20
	movrlez	%i1,	%i2,	%g3
	array16	%o0,	%g2,	%l1
	array8	%o7,	%l2,	%o5
	sra	%l0,	%g4,	%l5
	fpackfix	%f14,	%f6
	andcc	%o2,	%g6,	%g1
	movcs	%xcc,	%g7,	%g5
	movrlz	%o6,	0x323,	%i0
	movle	%icc,	%i7,	%i4
	fcmpne32	%f2,	%f12,	%o3
	ldd	[%l7 + 0x48],	%i6
	fpsub32	%f8,	%f8,	%f14
	stx	%o1,	[%l7 + 0x78]
	save %i6, 0x07BF, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f12,	[%l7 + 0x68]
	alignaddr	%i3,	%i5,	%o4
	ldd	[%l7 + 0x28],	%i0
	fmovsvc	%icc,	%f25,	%f9
	array16	%i2,	%l3,	%g3
	movrne	%o0,	%g2,	%o7
	lduh	[%l7 + 0x10],	%l2
	fmovdpos	%icc,	%f19,	%f12
	alignaddrl	%l1,	%o5,	%g4
	array16	%l0,	%o2,	%l5
	fcmple32	%f30,	%f26,	%g6
	fabss	%f21,	%f9
	addcc	%g7,	%g1,	%g5
	movne	%xcc,	%i0,	%o6
	edge8n	%i7,	%o3,	%l6
	edge16ln	%o1,	%i6,	%l4
	sth	%i4,	[%l7 + 0x4C]
	fpadd16s	%f20,	%f24,	%f7
	fcmpeq16	%f4,	%f30,	%i5
	restore %i3, %o4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l3,	%i1
	srl	%o0,	%g3,	%o7
	edge8ln	%l2,	%l1,	%g2
	sth	%g4,	[%l7 + 0x64]
	edge16	%l0,	%o2,	%l5
	xorcc	%o5,	%g6,	%g1
	edge8ln	%g5,	%i0,	%g7
	movvc	%icc,	%o6,	%o3
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f24
	ldd	[%l7 + 0x50],	%f26
	movl	%icc,	%i7,	%o1
	fmovrdne	%l6,	%f26,	%f22
	addcc	%l4,	0x017E,	%i4
	edge32ln	%i6,	%i3,	%i5
	mova	%xcc,	%o4,	%i2
	udivx	%i1,	0x16B8,	%o0
	addcc	%g3,	0x1BE5,	%l3
	movrgez	%o7,	%l1,	%g2
	srl	%l2,	%l0,	%o2
	mova	%icc,	%l5,	%o5
	edge16	%g4,	%g6,	%g5
	array16	%g1,	%g7,	%o6
	fmovrsne	%o3,	%f28,	%f30
	umul	%i0,	0x0801,	%o1
	fzeros	%f1
	array32	%i7,	%l4,	%i4
	alignaddr	%l6,	%i6,	%i3
	alignaddrl	%o4,	%i2,	%i5
	smulcc	%o0,	0x133A,	%g3
	for	%f2,	%f12,	%f2
	fcmple16	%f8,	%f20,	%i1
	edge8l	%l3,	%o7,	%g2
	edge16ln	%l2,	%l0,	%l1
	fmovsleu	%icc,	%f22,	%f27
	for	%f24,	%f0,	%f26
	ldd	[%l7 + 0x30],	%o2
	orncc	%l5,	0x1887,	%g4
	ldd	[%l7 + 0x38],	%g6
	fmovrslz	%g5,	%f12,	%f1
	ldd	[%l7 + 0x28],	%g0
	fmovsneg	%icc,	%f27,	%f26
	sir	0x1B02
	fxors	%f9,	%f10,	%f8
	stw	%g7,	[%l7 + 0x50]
	udivcc	%o5,	0x018C,	%o3
	srax	%i0,	%o6,	%i7
	mulscc	%l4,	%o1,	%i4
	movvc	%icc,	%i6,	%i3
	movn	%xcc,	%l6,	%i2
	nop
	set	0x40, %i5
	stx	%i5,	[%l7 + %i5]
	fornot2	%f0,	%f6,	%f8
	orncc	%o4,	%o0,	%g3
	save %l3, 0x1462, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g2,	%l2
	fpadd32	%f18,	%f12,	%f8
	fnegd	%f28,	%f20
	andcc	%o7,	%l0,	%l1
	fmovsle	%xcc,	%f8,	%f1
	movrlez	%o2,	%l5,	%g4
	fnot1	%f18,	%f10
	fmovrdgz	%g6,	%f14,	%f20
	sethi	0x011B,	%g1
	srax	%g7,	0x0E,	%g5
	edge32ln	%o5,	%i0,	%o3
	fmovscs	%xcc,	%f9,	%f26
	movvc	%icc,	%o6,	%i7
	edge16n	%l4,	%o1,	%i6
	movleu	%xcc,	%i4,	%l6
	movvs	%icc,	%i3,	%i5
	stx	%o4,	[%l7 + 0x78]
	mova	%icc,	%o0,	%i2
	lduh	[%l7 + 0x26],	%g3
	subccc	%l3,	0x1C4D,	%i1
	xnorcc	%l2,	%g2,	%o7
	udivcc	%l1,	0x11FB,	%l0
	movvs	%xcc,	%l5,	%o2
	fmovrsne	%g6,	%f22,	%f2
	edge32ln	%g4,	%g1,	%g5
	movn	%xcc,	%o5,	%i0
	fmovdne	%icc,	%f15,	%f1
	movl	%xcc,	%g7,	%o3
	movrlez	%o6,	0x0F6,	%i7
	array32	%l4,	%i6,	%i4
	movge	%icc,	%l6,	%o1
	edge16	%i3,	%o4,	%i5
	fmovspos	%icc,	%f22,	%f20
	movcc	%icc,	%i2,	%g3
	edge8n	%o0,	%i1,	%l2
	fpadd16	%f30,	%f10,	%f24
	smulcc	%l3,	0x010E,	%g2
	mulx	%o7,	%l1,	%l5
	fcmpd	%fcc2,	%f28,	%f22
	addccc	%l0,	0x1D6D,	%g6
	fmovdvs	%icc,	%f28,	%f10
	orn	%g4,	%o2,	%g1
	movrgez	%o5,	0x12A,	%i0
	fmovsa	%xcc,	%f10,	%f22
	nop
	set	0x3F, %l1
	ldsb	[%l7 + %l1],	%g7
	movge	%icc,	%o3,	%g5
	edge8ln	%o6,	%l4,	%i7
	edge32l	%i6,	%l6,	%o1
	movrne	%i3,	0x25F,	%i4
	array16	%o4,	%i5,	%g3
	fmovdcc	%icc,	%f18,	%f7
	umulcc	%o0,	0x045A,	%i2
	andncc	%i1,	%l2,	%g2
	subc	%l3,	%o7,	%l1
	srax	%l0,	%l5,	%g6
	movleu	%xcc,	%o2,	%g1
	sdivcc	%g4,	0x0EDE,	%i0
	ldsb	[%l7 + 0x1A],	%g7
	edge8ln	%o3,	%o5,	%g5
	faligndata	%f2,	%f14,	%f4
	fnot2	%f28,	%f28
	stb	%l4,	[%l7 + 0x23]
	andn	%i7,	%i6,	%l6
	fxnor	%f22,	%f14,	%f8
	fnand	%f10,	%f4,	%f10
	stx	%o6,	[%l7 + 0x20]
	umul	%o1,	%i3,	%i4
	udivx	%o4,	0x0941,	%i5
	mulx	%o0,	0x1651,	%g3
	fmovrdgz	%i2,	%f2,	%f18
	fpadd32s	%f22,	%f27,	%f26
	sth	%i1,	[%l7 + 0x5C]
	srax	%g2,	%l3,	%l2
	fandnot2	%f2,	%f26,	%f20
	lduh	[%l7 + 0x0E],	%l1
	array16	%o7,	%l5,	%g6
	edge16ln	%o2,	%l0,	%g4
	save %g1, 0x08A5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o3,	0x0244,	%g7
	movrlez	%g5,	%o5,	%l4
	andcc	%i7,	0x1BAC,	%i6
	popc	0x0621,	%l6
	lduw	[%l7 + 0x24],	%o1
	subc	%o6,	%i4,	%i3
	nop
	set	0x70, %g6
	std	%f30,	[%l7 + %g6]
	ldd	[%l7 + 0x58],	%f12
	sdivcc	%o4,	0x1AB5,	%o0
	edge8n	%i5,	%g3,	%i1
	subcc	%i2,	0x1A71,	%g2
	udivx	%l2,	0x040D,	%l3
	fpmerge	%f9,	%f29,	%f4
	edge32l	%o7,	%l1,	%g6
	fand	%f20,	%f24,	%f20
	ldsw	[%l7 + 0x24],	%l5
	ldsh	[%l7 + 0x6C],	%l0
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%o2
	edge32n	%g4,	%i0,	%o3
	edge32l	%g7,	%g5,	%g1
	fandnot1	%f16,	%f8,	%f10
	addccc	%o5,	0x154C,	%l4
	add	%i6,	%i7,	%l6
	and	%o6,	0x1B73,	%o1
	fand	%f22,	%f30,	%f28
	ldsw	[%l7 + 0x10],	%i3
	movrne	%i4,	%o4,	%i5
	edge8l	%o0,	%i1,	%g3
	movgu	%icc,	%i2,	%l2
	edge8n	%l3,	%g2,	%l1
	fcmpne32	%f12,	%f8,	%g6
	alignaddr	%o7,	%l5,	%o2
	edge32l	%l0,	%g4,	%i0
	stw	%g7,	[%l7 + 0x6C]
	movcc	%icc,	%o3,	%g1
	ldsw	[%l7 + 0x38],	%g5
	mulscc	%l4,	%o5,	%i7
	fmovrsgz	%i6,	%f26,	%f8
	movleu	%xcc,	%l6,	%o1
	edge8	%o6,	%i3,	%i4
	add	%i5,	0x1B5B,	%o0
	xor	%i1,	%g3,	%o4
	movrlz	%l2,	%i2,	%l3
	std	%f26,	[%l7 + 0x40]
	fmovrsgez	%g2,	%f29,	%f31
	edge16n	%g6,	%l1,	%l5
	edge32	%o2,	%o7,	%g4
	array32	%l0,	%i0,	%o3
	fabss	%f8,	%f28
	movpos	%icc,	%g1,	%g7
	fexpand	%f14,	%f2
	umul	%g5,	%l4,	%i7
	sll	%o5,	0x04,	%i6
	sdiv	%o1,	0x1630,	%l6
	movrne	%o6,	0x0B2,	%i3
	addcc	%i5,	%i4,	%o0
	srlx	%i1,	%o4,	%g3
	umul	%i2,	%l2,	%g2
	umul	%g6,	%l3,	%l5
	fxnor	%f0,	%f2,	%f26
	xnorcc	%o2,	%l1,	%g4
	ldsb	[%l7 + 0x39],	%l0
	array16	%o7,	%o3,	%i0
	sub	%g1,	%g5,	%l4
	fmovdpos	%icc,	%f31,	%f24
	stw	%i7,	[%l7 + 0x5C]
	edge32l	%g7,	%o5,	%i6
	fcmpgt32	%f20,	%f20,	%l6
	ld	[%l7 + 0x7C],	%f10
	save %o1, %o6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%i3,	%i4
	stx	%i1,	[%l7 + 0x10]
	stb	%o0,	[%l7 + 0x7A]
	addcc	%o4,	%g3,	%i2
	subccc	%g2,	%l2,	%g6
	udivcc	%l3,	0x0100,	%o2
	fmul8sux16	%f28,	%f8,	%f18
	subc	%l1,	0x1652,	%l5
	ldsh	[%l7 + 0x5C],	%g4
	xnor	%o7,	%l0,	%i0
	array16	%o3,	%g5,	%g1
	movrgez	%l4,	0x3DD,	%g7
	nop
	set	0x74, %o2
	lduw	[%l7 + %o2],	%i7
	subccc	%i6,	%o5,	%l6
	edge32ln	%o1,	%o6,	%i3
	fmul8x16al	%f20,	%f28,	%f12
	fmovdleu	%xcc,	%f26,	%f6
	movrlz	%i4,	0x226,	%i5
	fnot2	%f2,	%f12
	sll	%i1,	%o0,	%g3
	fmovrsne	%i2,	%f18,	%f7
	sll	%o4,	0x0C,	%l2
	smul	%g6,	%l3,	%o2
	fabsd	%f28,	%f24
	movrgz	%l1,	0x0CA,	%l5
	udivx	%g4,	0x1D99,	%o7
	orncc	%l0,	%i0,	%o3
	edge16n	%g2,	%g1,	%g5
	edge8	%l4,	%i7,	%i6
	smulcc	%o5,	%g7,	%l6
	sllx	%o1,	0x1A,	%o6
	ldsb	[%l7 + 0x1E],	%i3
	orncc	%i5,	0x047D,	%i1
	edge8	%i4,	%o0,	%g3
	save %i2, %l2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g6,	0x0DC8,	%o2
	fone	%f16
	alignaddrl	%l3,	%l5,	%l1
	nop
	set	0x48, %g5
	std	%f4,	[%l7 + %g5]
	fmovdn	%icc,	%f27,	%f24
	fmovdg	%xcc,	%f16,	%f20
	orcc	%g4,	%l0,	%o7
	xorcc	%o3,	0x15A7,	%i0
	movge	%icc,	%g1,	%g5
	ldd	[%l7 + 0x60],	%l4
	movneg	%xcc,	%g2,	%i6
	ldx	[%l7 + 0x20],	%i7
	addc	%o5,	%l6,	%o1
	movpos	%icc,	%g7,	%o6
	movrne	%i3,	%i1,	%i5
	fornot1s	%f16,	%f11,	%f9
	edge32l	%i4,	%o0,	%i2
	xorcc	%l2,	%g3,	%g6
	fpadd16	%f30,	%f10,	%f28
	movn	%icc,	%o2,	%l3
	movcs	%icc,	%o4,	%l1
	stb	%l5,	[%l7 + 0x3E]
	addc	%l0,	%g4,	%o7
	sth	%o3,	[%l7 + 0x0E]
	subccc	%i0,	0x18DB,	%g1
	stx	%l4,	[%l7 + 0x20]
	subccc	%g2,	0x088E,	%i6
	movre	%g5,	0x3DB,	%i7
	edge16	%l6,	%o1,	%g7
	sdiv	%o6,	0x0033,	%i3
	alignaddrl	%i1,	%o5,	%i4
	nop
	set	0x73, %i4
	ldub	[%l7 + %i4],	%o0
	mova	%xcc,	%i2,	%i5
	umul	%g3,	%l2,	%g6
	popc	%o2,	%l3
	udivcc	%l1,	0x00F4,	%l5
	fpsub32	%f16,	%f28,	%f30
	subc	%l0,	%g4,	%o7
	movleu	%xcc,	%o4,	%o3
	srl	%g1,	%l4,	%i0
	sra	%i6,	0x0C,	%g2
	nop
	set	0x20, %o6
	stx	%g5,	[%l7 + %o6]
	movle	%icc,	%i7,	%o1
	fmovsgu	%xcc,	%f30,	%f25
	save %g7, 0x090E, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o6,	%i3
	movpos	%xcc,	%i1,	%i4
	edge16l	%o5,	%i2,	%i5
	edge8ln	%g3,	%o0,	%l2
	stx	%g6,	[%l7 + 0x18]
	udivx	%l3,	0x0F34,	%o2
	stb	%l1,	[%l7 + 0x3B]
	ldx	[%l7 + 0x28],	%l5
	edge32l	%g4,	%l0,	%o4
	nop
	set	0x24, %g1
	ldsb	[%l7 + %g1],	%o3
	udivcc	%o7,	0x07FF,	%l4
	fmovsleu	%icc,	%f14,	%f2
	alignaddrl	%i0,	%i6,	%g1
	fmovd	%f0,	%f20
	movleu	%xcc,	%g5,	%i7
	movcs	%icc,	%g2,	%o1
	ldx	[%l7 + 0x08],	%g7
	fsrc1s	%f4,	%f7
	edge32	%l6,	%i3,	%o6
	std	%f30,	[%l7 + 0x38]
	movvc	%icc,	%i4,	%i1
	mova	%xcc,	%i2,	%i5
	subc	%o5,	0x10F4,	%g3
	array32	%l2,	%o0,	%g6
	andcc	%o2,	%l1,	%l3
	andcc	%l5,	0x15D2,	%l0
	movrlz	%g4,	0x133,	%o4
	orncc	%o7,	0x0C69,	%o3
	and	%i0,	0x0FAA,	%i6
	ldub	[%l7 + 0x71],	%g1
	ld	[%l7 + 0x4C],	%f22
	edge32l	%g5,	%i7,	%l4
	srl	%g2,	0x0D,	%g7
	fpsub16	%f24,	%f18,	%f14
	movne	%icc,	%l6,	%i3
	mova	%icc,	%o1,	%i4
	fcmple32	%f14,	%f20,	%o6
	movrlez	%i1,	0x09B,	%i5
	movrne	%o5,	0x375,	%g3
	movcs	%xcc,	%l2,	%i2
	movn	%icc,	%g6,	%o2
	edge16l	%o0,	%l3,	%l1
	subcc	%l0,	%l5,	%g4
	udivx	%o7,	0x1E18,	%o3
	edge16	%o4,	%i6,	%g1
	sir	0x08FD
	movle	%icc,	%g5,	%i7
	lduw	[%l7 + 0x08],	%i0
	edge32n	%g2,	%l4,	%l6
	movneg	%icc,	%i3,	%o1
	sdivx	%g7,	0x1798,	%i4
	edge8n	%i1,	%o6,	%o5
	xnor	%g3,	%l2,	%i2
	movg	%icc,	%g6,	%i5
	popc	0x1A2B,	%o0
	fpackfix	%f2,	%f26
	sub	%l3,	%o2,	%l0
	fmul8x16au	%f17,	%f6,	%f20
	sdivcc	%l5,	0x1065,	%l1
	movcc	%xcc,	%o7,	%o3
	movne	%xcc,	%o4,	%i6
	lduw	[%l7 + 0x4C],	%g4
	movvs	%xcc,	%g1,	%i7
	orn	%i0,	0x0472,	%g5
	subccc	%l4,	%g2,	%l6
	edge16	%o1,	%i3,	%i4
	ldsb	[%l7 + 0x27],	%i1
	movvc	%icc,	%o6,	%g7
	fmovsne	%xcc,	%f13,	%f11
	add	%g3,	0x05DD,	%o5
	fmovsgu	%xcc,	%f30,	%f5
	sll	%l2,	0x09,	%i2
	edge16l	%g6,	%i5,	%l3
	movpos	%xcc,	%o0,	%l0
	fcmpgt16	%f2,	%f22,	%l5
	edge32ln	%l1,	%o2,	%o3
	ldx	[%l7 + 0x68],	%o7
	fnegd	%f26,	%f10
	sdiv	%i6,	0x1ECC,	%g4
	fands	%f9,	%f3,	%f30
	sdiv	%o4,	0x0D1B,	%i7
	xnorcc	%i0,	0x1E36,	%g1
	movrlez	%l4,	%g2,	%l6
	subcc	%g5,	%o1,	%i3
	mova	%xcc,	%i4,	%i1
	sethi	0x04B7,	%o6
	movne	%xcc,	%g7,	%g3
	ldsw	[%l7 + 0x18],	%l2
	movrgz	%o5,	0x3D0,	%i2
	edge32ln	%i5,	%l3,	%o0
	fnands	%f3,	%f27,	%f26
	subccc	%g6,	0x061F,	%l5
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	xorcc	%o2,	%o7,	%g4
	edge8	%o4,	%i7,	%i0
	fmovd	%f18,	%f30
	sir	0x1ABC
	sdivcc	%i6,	0x0D89,	%g1
	edge32l	%l4,	%l6,	%g2
	fpackfix	%f10,	%f17
	lduh	[%l7 + 0x36],	%g5
	fxor	%f22,	%f10,	%f16
	mova	%xcc,	%o1,	%i4
	smulcc	%i1,	%i3,	%g7
	movpos	%icc,	%g3,	%l2
	sth	%o6,	[%l7 + 0x5C]
	array8	%i2,	%i5,	%o5
	orncc	%l3,	0x048A,	%o0
	smul	%l5,	%l0,	%l1
	smulcc	%g6,	0x14CD,	%o2
	edge8l	%o7,	%g4,	%o4
	fmovsge	%xcc,	%f26,	%f20
	movrne	%i7,	0x065,	%i0
	edge32	%o3,	%g1,	%i6
	fandnot1s	%f26,	%f28,	%f6
	movrne	%l4,	0x11E,	%l6
	edge32n	%g2,	%g5,	%i4
	fsrc1	%f12,	%f12
	mulscc	%i1,	%i3,	%g7
	movvc	%icc,	%g3,	%l2
	sll	%o1,	0x01,	%o6
	movvc	%icc,	%i2,	%i5
	restore %l3, 0x1F26, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o5,	%l5
	fnot1s	%f1,	%f22
	mova	%icc,	%l0,	%l1
	fmovrslez	%g6,	%f6,	%f12
	movl	%icc,	%o2,	%o7
	sub	%g4,	%o4,	%i0
	movne	%xcc,	%o3,	%g1
	nop
	set	0x68, %o3
	std	%f30,	[%l7 + %o3]
	fmovrsgz	%i6,	%f5,	%f4
	sllx	%l4,	0x0A,	%i7
	pdist	%f24,	%f30,	%f8
	fands	%f0,	%f28,	%f4
	movn	%icc,	%l6,	%g2
	stw	%g5,	[%l7 + 0x08]
	ldd	[%l7 + 0x78],	%i0
	movle	%xcc,	%i4,	%i3
	fmovdvc	%icc,	%f26,	%f21
	andcc	%g3,	0x0976,	%l2
	ldd	[%l7 + 0x18],	%f24
	edge16n	%g7,	%o6,	%i2
	movne	%xcc,	%i5,	%l3
	andn	%o1,	%o0,	%l5
	fmovdvs	%icc,	%f24,	%f2
	fabsd	%f26,	%f14
	ldub	[%l7 + 0x79],	%l0
	sdivcc	%o5,	0x0F41,	%l1
	movpos	%xcc,	%g6,	%o7
	xorcc	%o2,	0x0A7E,	%g4
	addccc	%i0,	0x0A01,	%o3
	fpackfix	%f0,	%f25
	umulcc	%o4,	0x1349,	%g1
	sdivcc	%i6,	0x19F0,	%i7
	array16	%l6,	%g2,	%g5
	movrgz	%l4,	0x224,	%i4
	st	%f4,	[%l7 + 0x74]
	fmovsl	%xcc,	%f15,	%f26
	mulx	%i1,	0x1E03,	%i3
	edge8n	%g3,	%g7,	%l2
	fmovdle	%icc,	%f22,	%f14
	and	%i2,	0x03C0,	%o6
	smul	%i5,	0x050D,	%l3
	xnorcc	%o1,	%l5,	%l0
	sethi	0x1346,	%o0
	ldub	[%l7 + 0x77],	%l1
	sethi	0x17F5,	%o5
	xnor	%o7,	%o2,	%g6
	fmovrslz	%i0,	%f25,	%f9
	fnot1	%f26,	%f2
	fcmpgt16	%f24,	%f8,	%g4
	sra	%o3,	%o4,	%i6
	edge8	%i7,	%l6,	%g2
	fmovdge	%xcc,	%f17,	%f3
	addc	%g5,	0x1C31,	%l4
	st	%f9,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x0A],	%g1
	ldx	[%l7 + 0x08],	%i4
	fsrc1s	%f1,	%f23
	andcc	%i1,	0x0CFB,	%g3
	xorcc	%i3,	0x1725,	%l2
	fmuld8sux16	%f27,	%f0,	%f14
	andn	%i2,	0x1BFB,	%o6
	nop
	set	0x58, %l0
	stx	%i5,	[%l7 + %l0]
	fsrc1s	%f0,	%f21
	fzeros	%f3
	ldsb	[%l7 + 0x33],	%g7
	edge32	%o1,	%l5,	%l0
	addcc	%l3,	%o0,	%o5
	sra	%o7,	%l1,	%o2
	st	%f5,	[%l7 + 0x10]
	alignaddr	%i0,	%g4,	%g6
	edge16n	%o4,	%o3,	%i7
	udiv	%i6,	0x105D,	%l6
	ldsw	[%l7 + 0x58],	%g5
	ldx	[%l7 + 0x50],	%l4
	sir	0x14EE
	array8	%g2,	%g1,	%i1
	add	%g3,	%i4,	%l2
	umul	%i3,	%o6,	%i2
	fnot2s	%f2,	%f5
	bshuffle	%f30,	%f10,	%f12
	orcc	%i5,	%g7,	%o1
	sir	0x0B3C
	move	%icc,	%l0,	%l5
	ldsw	[%l7 + 0x70],	%l3
	srl	%o5,	%o0,	%l1
	siam	0x7
	movcc	%xcc,	%o7,	%i0
	fornot2s	%f11,	%f8,	%f20
	fone	%f30
	movre	%o2,	%g6,	%g4
	fnegs	%f31,	%f28
	udivx	%o4,	0x160D,	%i7
	sllx	%o3,	0x18,	%l6
	add	%g5,	0x0DD7,	%i6
	movgu	%icc,	%g2,	%l4
	movcs	%icc,	%g1,	%i1
	sdiv	%g3,	0x02FD,	%i4
	movcs	%icc,	%i3,	%l2
	sub	%i2,	%i5,	%o6
	movn	%icc,	%g7,	%o1
	udivx	%l5,	0x1C0A,	%l3
	edge32l	%o5,	%o0,	%l0
	nop
	set	0x28, %i2
	stw	%l1,	[%l7 + %i2]
	fmovdneg	%xcc,	%f10,	%f28
	movvs	%icc,	%o7,	%o2
	fmovdg	%xcc,	%f13,	%f4
	movrne	%i0,	0x04D,	%g6
	movrgz	%o4,	0x2AE,	%g4
	fnands	%f1,	%f27,	%f30
	stb	%i7,	[%l7 + 0x17]
	ldsh	[%l7 + 0x1C],	%o3
	smulcc	%l6,	0x0879,	%g5
	udivx	%i6,	0x04C7,	%g2
	addc	%g1,	0x14F0,	%l4
	ld	[%l7 + 0x34],	%f11
	edge16n	%g3,	%i1,	%i4
	array16	%l2,	%i3,	%i5
	sir	0x0B90
	movrlez	%o6,	%i2,	%o1
	or	%g7,	%l3,	%l5
	xor	%o0,	%l0,	%o5
	fmovdge	%xcc,	%f27,	%f31
	fmovdvc	%xcc,	%f10,	%f21
	movgu	%xcc,	%o7,	%l1
	fmovda	%icc,	%f24,	%f16
	smul	%i0,	%g6,	%o4
	std	%f16,	[%l7 + 0x50]
	edge8l	%o2,	%i7,	%o3
	fmul8x16	%f24,	%f28,	%f2
	orncc	%g4,	%g5,	%l6
	fcmpeq16	%f26,	%f14,	%g2
	fmul8x16al	%f5,	%f6,	%f14
	fmovde	%icc,	%f8,	%f12
	andn	%i6,	0x1C9B,	%g1
	movvs	%icc,	%l4,	%g3
	fmovrsgz	%i4,	%f11,	%f25
	udivx	%l2,	0x00BE,	%i3
	ldsw	[%l7 + 0x20],	%i5
	movrlez	%i1,	%i2,	%o6
	orcc	%o1,	0x043E,	%g7
	movcs	%xcc,	%l5,	%o0
	fmul8x16al	%f22,	%f30,	%f26
	subc	%l3,	%o5,	%o7
	movne	%icc,	%l1,	%i0
	fandnot1s	%f1,	%f6,	%f5
	movg	%icc,	%l0,	%g6
	movg	%xcc,	%o4,	%o2
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%i6
	fandnot1	%f22,	%f22,	%f14
	andcc	%o3,	0x0186,	%g4
	fmovdge	%xcc,	%f22,	%f7
	movle	%xcc,	%l6,	%g5
	std	%f12,	[%l7 + 0x50]
	alignaddrl	%i6,	%g2,	%g1
	orncc	%l4,	0x1292,	%g3
	sir	0x0D1A
	sethi	0x15EA,	%l2
	fpackfix	%f20,	%f16
	ldd	[%l7 + 0x20],	%i4
	array32	%i5,	%i3,	%i1
	fpsub32s	%f24,	%f2,	%f15
	fsrc1	%f18,	%f26
	fornot2s	%f11,	%f2,	%f20
	ldd	[%l7 + 0x20],	%i2
	movrlez	%o6,	%g7,	%o1
	movle	%xcc,	%l5,	%l3
	movneg	%xcc,	%o0,	%o5
	stb	%o7,	[%l7 + 0x26]
	movrlez	%i0,	0x3C9,	%l0
	array32	%g6,	%l1,	%o4
	fxnor	%f30,	%f14,	%f6
	fmul8x16au	%f6,	%f20,	%f14
	sethi	0x14C8,	%o2
	sra	%o3,	%g4,	%i7
	fzero	%f18
	edge8l	%g5,	%i6,	%g2
	move	%xcc,	%g1,	%l4
	lduh	[%l7 + 0x1A],	%l6
	movneg	%icc,	%g3,	%i4
	sub	%i5,	%l2,	%i3
	fnot1s	%f2,	%f3
	ldsb	[%l7 + 0x62],	%i1
	movrlez	%o6,	%i2,	%g7
	edge8n	%l5,	%o1,	%o0
	movpos	%xcc,	%o5,	%l3
	movg	%icc,	%i0,	%l0
	sll	%o7,	%l1,	%g6
	addcc	%o2,	0x1AF0,	%o3
	array16	%o4,	%g4,	%i7
	fmovdge	%icc,	%f18,	%f18
	fpsub16s	%f31,	%f25,	%f30
	movvs	%icc,	%i6,	%g2
	movn	%icc,	%g1,	%g5
	fmovsneg	%xcc,	%f19,	%f6
	mova	%icc,	%l6,	%l4
	edge16	%g3,	%i4,	%l2
	xor	%i3,	%i1,	%o6
	ldub	[%l7 + 0x5A],	%i2
	siam	0x7
	subc	%i5,	0x1CCF,	%l5
	fcmped	%fcc2,	%f10,	%f20
	fcmpgt16	%f20,	%f18,	%o1
	orn	%g7,	%o5,	%o0
	movcs	%icc,	%l3,	%l0
	edge16l	%i0,	%o7,	%g6
	mulscc	%l1,	0x1183,	%o2
	array8	%o3,	%o4,	%g4
	edge16	%i6,	%g2,	%i7
	mulscc	%g1,	0x0593,	%l6
	movrgez	%l4,	0x39C,	%g3
	edge16l	%i4,	%g5,	%i3
	popc	0x075C,	%i1
	edge8l	%o6,	%i2,	%i5
	fmuld8sux16	%f1,	%f8,	%f4
	addc	%l5,	%o1,	%l2
	fsrc1s	%f17,	%f7
	or	%g7,	%o5,	%l3
	andcc	%o0,	%i0,	%o7
	edge16n	%g6,	%l0,	%l1
	addcc	%o3,	%o4,	%g4
	movrgz	%i6,	%g2,	%i7
	stb	%g1,	[%l7 + 0x3E]
	lduh	[%l7 + 0x66],	%o2
	orcc	%l4,	0x12DD,	%g3
	smul	%l6,	%i4,	%i3
	movcc	%xcc,	%i1,	%g5
	edge16l	%i2,	%i5,	%l5
	std	%f18,	[%l7 + 0x20]
	lduw	[%l7 + 0x0C],	%o6
	ldsh	[%l7 + 0x6E],	%o1
	fmovrslez	%l2,	%f27,	%f25
	fmovdleu	%xcc,	%f2,	%f6
	fcmpd	%fcc3,	%f22,	%f0
	movn	%xcc,	%g7,	%l3
	edge8ln	%o0,	%o5,	%i0
	sdivx	%g6,	0x1C48,	%o7
	xnorcc	%l0,	0x1812,	%o3
	addcc	%l1,	0x1322,	%g4
	ld	[%l7 + 0x6C],	%f14
	fandnot1s	%f6,	%f21,	%f16
	fmovdgu	%icc,	%f10,	%f8
	orncc	%i6,	%g2,	%o4
	srlx	%i7,	0x0C,	%g1
	andncc	%o2,	%l4,	%l6
	nop
	set	0x22, %o0
	ldub	[%l7 + %o0],	%g3
	movrgz	%i3,	%i4,	%g5
	sllx	%i2,	%i1,	%i5
	movvs	%icc,	%o6,	%l5
	mulx	%o1,	%l2,	%g7
	ldsw	[%l7 + 0x7C],	%l3
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	ld	[%l7 + 0x34],	%f18
	ldd	[%l7 + 0x28],	%i0
	addcc	%l0,	%o3,	%l1
	array8	%o7,	%g4,	%g2
	move	%xcc,	%i6,	%o4
	sir	0x0CC7
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%g1
	edge16l	%i7,	%l4,	%l6
	orn	%g3,	%i3,	%i4
	movcs	%icc,	%o2,	%g5
	smulcc	%i2,	%i5,	%o6
	faligndata	%f28,	%f0,	%f8
	orcc	%i1,	0x0BC3,	%o1
	xor	%l2,	0x0AC1,	%l5
	popc	0x13F0,	%g7
	stw	%l3,	[%l7 + 0x3C]
	srlx	%o0,	0x0C,	%g6
	smul	%o5,	%i0,	%o3
	fnors	%f17,	%f29,	%f20
	andcc	%l0,	0x0B51,	%o7
	srax	%l1,	0x18,	%g4
	movgu	%xcc,	%g2,	%i6
	umul	%g1,	0x0F38,	%o4
	edge8l	%i7,	%l6,	%l4
	movrlez	%i3,	%g3,	%i4
	fmovrdlez	%g5,	%f8,	%f2
	st	%f9,	[%l7 + 0x60]
	nop
	set	0x58, %g2
	std	%f28,	[%l7 + %g2]
	ld	[%l7 + 0x40],	%f14
	ldd	[%l7 + 0x70],	%f2
	fzeros	%f13
	edge8n	%i2,	%o2,	%o6
	st	%f6,	[%l7 + 0x30]
	array32	%i5,	%i1,	%l2
	movpos	%icc,	%l5,	%g7
	fornot1	%f12,	%f18,	%f2
	alignaddr	%o1,	%l3,	%g6
	fpadd16	%f24,	%f10,	%f20
	orncc	%o5,	0x0D6A,	%i0
	movl	%icc,	%o3,	%l0
	sethi	0x13C2,	%o7
	ldsw	[%l7 + 0x58],	%o0
	fcmped	%fcc0,	%f20,	%f18
	fmovsvs	%xcc,	%f13,	%f17
	edge8	%g4,	%l1,	%g2
	mulscc	%g1,	%o4,	%i7
	mulx	%l6,	%l4,	%i3
	sir	0x0DCC
	fcmps	%fcc1,	%f10,	%f9
	sir	0x05F5
	add	%i6,	0x02D1,	%g3
	ld	[%l7 + 0x38],	%f18
	orn	%g5,	0x0C84,	%i2
	fpmerge	%f18,	%f22,	%f10
	stb	%i4,	[%l7 + 0x21]
	fnot2s	%f2,	%f26
	movrne	%o2,	0x0C2,	%o6
	udivcc	%i1,	0x0EBC,	%l2
	movcc	%xcc,	%i5,	%l5
	sll	%g7,	%l3,	%o1
	fabsd	%f0,	%f16
	addcc	%o5,	0x17AD,	%g6
	xorcc	%i0,	0x0080,	%o3
	xor	%o7,	%l0,	%g4
	fxnor	%f28,	%f22,	%f12
	sra	%o0,	%g2,	%l1
	srax	%g1,	0x06,	%i7
	or	%o4,	0x0A0C,	%l4
	ldd	[%l7 + 0x20],	%i2
	move	%xcc,	%l6,	%i6
	lduh	[%l7 + 0x30],	%g3
	udiv	%g5,	0x1156,	%i4
	mulscc	%o2,	%i2,	%i1
	edge16ln	%o6,	%i5,	%l2
	edge16l	%l5,	%g7,	%l3
	for	%f14,	%f18,	%f24
	addcc	%o1,	%o5,	%i0
	std	%f10,	[%l7 + 0x08]
	movvs	%xcc,	%g6,	%o3
	movrgz	%l0,	%o7,	%g4
	fzero	%f8
	edge32	%g2,	%o0,	%g1
	srl	%l1,	0x05,	%o4
	movl	%xcc,	%i7,	%l4
	sllx	%i3,	0x14,	%i6
	udivx	%l6,	0x0766,	%g5
	array16	%g3,	%o2,	%i4
	or	%i1,	%i2,	%i5
	fands	%f30,	%f23,	%f1
	movre	%l2,	0x095,	%l5
	sdivcc	%g7,	0x04E3,	%o6
	popc	%l3,	%o5
	orn	%i0,	%g6,	%o1
	fcmps	%fcc3,	%f12,	%f24
	andn	%o3,	0x19A5,	%l0
	sub	%g4,	%g2,	%o7
	edge32	%g1,	%l1,	%o4
	fmovsne	%xcc,	%f3,	%f8
	edge32	%i7,	%o0,	%i3
	sra	%i6,	%l6,	%g5
	xnorcc	%l4,	%o2,	%i4
	orncc	%i1,	0x1D84,	%g3
	sra	%i5,	%l2,	%i2
	fands	%f0,	%f7,	%f31
	fmovrdgz	%g7,	%f24,	%f22
	udiv	%o6,	0x0292,	%l3
	smulcc	%l5,	0x14AC,	%i0
	orcc	%g6,	0x1E44,	%o5
	srl	%o3,	%o1,	%g4
	nop
	set	0x0D, %i6
	ldub	[%l7 + %i6],	%g2
	movcc	%icc,	%o7,	%g1
	fcmpd	%fcc1,	%f10,	%f18
	addcc	%l0,	%l1,	%o4
	movre	%o0,	0x1CE,	%i3
	sra	%i6,	0x02,	%i7
	fcmped	%fcc3,	%f2,	%f30
	orn	%g5,	%l6,	%o2
	fmovrde	%l4,	%f10,	%f20
	fpsub16s	%f28,	%f26,	%f25
	xorcc	%i1,	0x0D80,	%g3
	fcmped	%fcc1,	%f0,	%f0
	add	%i5,	%l2,	%i4
	fmuld8sux16	%f26,	%f7,	%f12
	fxors	%f16,	%f24,	%f30
	sub	%g7,	0x1728,	%i2
	movvc	%icc,	%l3,	%o6
	movle	%icc,	%i0,	%l5
	ldd	[%l7 + 0x58],	%f8
	save %g6, %o5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o1,	%g4
	array8	%o7,	%g1,	%g2
	ldub	[%l7 + 0x70],	%l0
	xor	%l1,	%o4,	%o0
	edge8	%i3,	%i7,	%g5
	movcs	%icc,	%l6,	%i6
	edge32	%o2,	%i1,	%l4
	fmul8x16	%f16,	%f10,	%f10
	fmovda	%icc,	%f3,	%f25
	udivx	%g3,	0x1BE9,	%i5
	xnor	%i4,	0x1BCC,	%g7
	orncc	%l2,	0x03E2,	%l3
	sub	%i2,	0x0E79,	%o6
	srlx	%i0,	0x0E,	%l5
	ldx	[%l7 + 0x48],	%g6
	array32	%o3,	%o5,	%g4
	movn	%icc,	%o1,	%g1
	fcmpd	%fcc1,	%f20,	%f12
	movgu	%xcc,	%g2,	%l0
	edge16	%l1,	%o4,	%o0
	ld	[%l7 + 0x78],	%f29
	movcc	%xcc,	%o7,	%i3
	fpmerge	%f30,	%f8,	%f2
	sth	%g5,	[%l7 + 0x52]
	ldsw	[%l7 + 0x10],	%i7
	edge32	%i6,	%l6,	%i1
	array16	%o2,	%l4,	%i5
	movne	%icc,	%g3,	%i4
	movcs	%icc,	%g7,	%l2
	sdivx	%l3,	0x1082,	%i2
	sllx	%o6,	%i0,	%g6
	lduh	[%l7 + 0x30],	%l5
	edge8l	%o3,	%g4,	%o1
	srl	%o5,	%g1,	%l0
	edge8ln	%l1,	%g2,	%o4
	sub	%o0,	%i3,	%g5
	smulcc	%i7,	0x04C9,	%i6
	edge16n	%o7,	%l6,	%o2
	srax	%l4,	%i1,	%g3
	fexpand	%f3,	%f12
	sll	%i4,	0x0F,	%g7
	sir	0x17A4
	srl	%i5,	0x0D,	%l2
	fmovrde	%l3,	%f18,	%f24
	udivcc	%i2,	0x0CC9,	%o6
	fcmple16	%f16,	%f10,	%i0
	movpos	%icc,	%g6,	%o3
	fornot2	%f16,	%f14,	%f2
	ldd	[%l7 + 0x10],	%f16
	subc	%l5,	0x09E4,	%g4
	fand	%f30,	%f20,	%f14
	andn	%o5,	0x187D,	%o1
	fmovsgu	%icc,	%f25,	%f1
	array32	%g1,	%l0,	%g2
	addccc	%l1,	%o0,	%i3
	nop
	set	0x60, %o1
	stb	%g5,	[%l7 + %o1]
	movneg	%icc,	%i7,	%i6
	edge8	%o7,	%o4,	%o2
	fones	%f6
	fnands	%f17,	%f13,	%f27
	edge8n	%l4,	%l6,	%g3
	andncc	%i4,	%g7,	%i5
	movne	%xcc,	%l2,	%l3
	movrlez	%i2,	0x11A,	%o6
	umulcc	%i0,	0x1883,	%g6
	srax	%i1,	0x0D,	%o3
	fnot1s	%f30,	%f6
	sll	%l5,	0x13,	%g4
	edge32l	%o5,	%g1,	%o1
	fcmpeq16	%f16,	%f18,	%g2
	fmovsa	%xcc,	%f5,	%f9
	movrgz	%l0,	%o0,	%l1
	alignaddrl	%i3,	%i7,	%g5
	edge16n	%i6,	%o4,	%o7
	umul	%o2,	%l4,	%g3
	sra	%i4,	0x1F,	%g7
	ldsb	[%l7 + 0x2C],	%i5
	fnor	%f20,	%f26,	%f10
	mova	%icc,	%l2,	%l6
	edge16ln	%l3,	%o6,	%i0
	array16	%i2,	%i1,	%g6
	ldd	[%l7 + 0x70],	%f22
	nop
	set	0x78, %i0
	std	%f6,	[%l7 + %i0]
	smulcc	%l5,	%o3,	%g4
	edge8ln	%g1,	%o1,	%g2
	edge16ln	%l0,	%o5,	%o0
	sdivcc	%i3,	0x1E4D,	%i7
	srl	%l1,	%i6,	%o4
	or	%o7,	%o2,	%g5
	fmul8ulx16	%f10,	%f26,	%f28
	movn	%icc,	%g3,	%l4
	sra	%g7,	%i4,	%l2
	ldsh	[%l7 + 0x66],	%i5
	fmovsne	%xcc,	%f0,	%f16
	save %l6, 0x1C19, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%i2,	%i0
	fsrc2	%f16,	%f26
	stx	%i1,	[%l7 + 0x28]
	sllx	%g6,	%l5,	%o3
	udiv	%g1,	0x024D,	%g4
	sll	%o1,	%g2,	%l0
	fmovsl	%xcc,	%f30,	%f8
	sethi	0x085A,	%o0
	addccc	%o5,	0x07F6,	%i7
	stw	%i3,	[%l7 + 0x44]
	fmovrsne	%i6,	%f25,	%f3
	movl	%icc,	%l1,	%o4
	lduw	[%l7 + 0x78],	%o7
	ldd	[%l7 + 0x78],	%o2
	stw	%g3,	[%l7 + 0x30]
	fmuld8ulx16	%f15,	%f13,	%f28
	edge32n	%l4,	%g7,	%g5
	smul	%l2,	0x0C70,	%i5
	sir	0x0F96
	sllx	%l6,	0x1D,	%i4
	ldub	[%l7 + 0x08],	%o6
	udiv	%i2,	0x0095,	%i0
	movneg	%xcc,	%i1,	%l3
	sth	%l5,	[%l7 + 0x74]
	edge8ln	%o3,	%g6,	%g1
	edge8ln	%o1,	%g4,	%g2
	bshuffle	%f4,	%f10,	%f0
	fnegs	%f5,	%f1
	alignaddrl	%o0,	%o5,	%i7
	movneg	%xcc,	%l0,	%i3
	fnot2s	%f3,	%f12
	fmovdle	%xcc,	%f22,	%f9
	fmovsvc	%icc,	%f8,	%f10
	movre	%l1,	0x217,	%o4
	sdivcc	%i6,	0x0DCE,	%o7
	fcmple32	%f28,	%f2,	%g3
	udivcc	%l4,	0x1872,	%g7
	fcmped	%fcc0,	%f14,	%f10
	orncc	%o2,	%g5,	%i5
	fmovd	%f6,	%f16
	movcc	%xcc,	%l6,	%l2
	fabsd	%f20,	%f20
	edge32n	%i4,	%i2,	%i0
	ldd	[%l7 + 0x40],	%f24
	edge16l	%o6,	%l3,	%l5
	movg	%xcc,	%o3,	%i1
	smul	%g1,	%g6,	%o1
	popc	0x0708,	%g4
	movcs	%icc,	%g2,	%o5
	move	%icc,	%o0,	%i7
	mulx	%l0,	0x1C94,	%l1
	udivcc	%o4,	0x02A4,	%i6
	nop
	set	0x76, %g3
	lduh	[%l7 + %g3],	%o7
	stb	%g3,	[%l7 + 0x7A]
	fmovdl	%xcc,	%f0,	%f1
	fmovdpos	%xcc,	%f26,	%f4
	fmovspos	%xcc,	%f31,	%f12
	fornot1s	%f19,	%f28,	%f15
	movrlz	%i3,	0x039,	%g7
	fpack32	%f10,	%f2,	%f2
	st	%f26,	[%l7 + 0x6C]
	movrlz	%o2,	0x3CC,	%g5
	srl	%i5,	%l6,	%l2
	movrlez	%i4,	%i2,	%i0
	fpadd16s	%f19,	%f17,	%f16
	mulx	%l4,	%l3,	%l5
	fzeros	%f22
	alignaddr	%o6,	%i1,	%o3
	fornot2	%f16,	%f6,	%f28
	orn	%g1,	%g6,	%g4
	fabsd	%f28,	%f16
	edge32	%g2,	%o5,	%o0
	faligndata	%f2,	%f2,	%f8
	movne	%icc,	%o1,	%l0
	fmovdne	%xcc,	%f26,	%f26
	movle	%icc,	%i7,	%o4
	fmovscs	%xcc,	%f20,	%f23
	fmovdle	%icc,	%f10,	%f14
	sra	%l1,	%o7,	%i6
	edge16l	%g3,	%g7,	%i3
	fmovrdlez	%o2,	%f22,	%f20
	fmovscs	%xcc,	%f11,	%f20
	fcmpeq16	%f8,	%f8,	%i5
	movgu	%xcc,	%g5,	%l6
	movre	%i4,	0x271,	%i2
	fpack16	%f22,	%f2
	umulcc	%i0,	0x04BD,	%l4
	subccc	%l2,	%l3,	%l5
	movrlez	%i1,	0x191,	%o6
	fnot1	%f12,	%f16
	fornot1	%f16,	%f28,	%f14
	udivx	%o3,	0x04DC,	%g6
	fsrc2	%f2,	%f14
	addc	%g1,	%g4,	%g2
	movn	%xcc,	%o5,	%o0
	xor	%o1,	%l0,	%o4
	edge8n	%i7,	%l1,	%o7
	fmovsneg	%xcc,	%f21,	%f15
	bshuffle	%f22,	%f10,	%f10
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%i6
	fmovdg	%icc,	%f14,	%f18
	edge8l	%g3,	%i3,	%o2
	fsrc1	%f30,	%f18
	edge32	%i5,	%g7,	%g5
	array16	%i4,	%i2,	%l6
	ldub	[%l7 + 0x74],	%l4
	mulx	%l2,	%l3,	%i0
	andcc	%i1,	0x0C4B,	%o6
	fpadd32s	%f29,	%f30,	%f16
	popc	%o3,	%l5
	subcc	%g1,	0x06B6,	%g4
	subcc	%g2,	%o5,	%o0
	movre	%g6,	%l0,	%o4
	addccc	%i7,	%o1,	%o7
	alignaddr	%i6,	%g3,	%l1
	alignaddrl	%o2,	%i3,	%i5
	smul	%g5,	0x0DE1,	%i4
	fmovd	%f20,	%f6
	fmovdneg	%xcc,	%f20,	%f23
	fsrc1	%f4,	%f12
	movrgz	%g7,	%i2,	%l6
	movcc	%icc,	%l2,	%l4
	addccc	%l3,	%i1,	%o6
	sll	%o3,	%l5,	%i0
	ld	[%l7 + 0x10],	%f24
	smul	%g1,	%g2,	%g4
	edge16	%o5,	%o0,	%l0
	fones	%f29
	movcs	%xcc,	%g6,	%i7
	xnor	%o4,	0x092C,	%o7
	fors	%f5,	%f10,	%f14
	srax	%o1,	%g3,	%i6
	fpmerge	%f1,	%f21,	%f28
	stw	%o2,	[%l7 + 0x70]
	ldsw	[%l7 + 0x54],	%l1
	movge	%icc,	%i5,	%i3
	umulcc	%i4,	%g5,	%g7
	xorcc	%l6,	0x0C1B,	%l2
	udiv	%i2,	0x0113,	%l4
	or	%l3,	%o6,	%i1
	umul	%o3,	0x14DD,	%l5
	fpadd16s	%f18,	%f12,	%f31
	smulcc	%g1,	0x0049,	%i0
	fmovrdne	%g2,	%f2,	%f18
	orn	%o5,	%o0,	%l0
	mulx	%g6,	%g4,	%o4
	array16	%o7,	%i7,	%g3
	std	%f10,	[%l7 + 0x38]
	edge8n	%i6,	%o2,	%l1
	add	%i5,	%i3,	%o1
	movge	%icc,	%i4,	%g7
	movre	%g5,	%l2,	%l6
	ldsw	[%l7 + 0x44],	%i2
	edge8ln	%l4,	%l3,	%o6
	fcmpd	%fcc3,	%f20,	%f14
	edge32	%o3,	%i1,	%g1
	mulx	%l5,	0x1C55,	%g2
	fmovdn	%xcc,	%f5,	%f11
	movleu	%icc,	%i0,	%o5
	for	%f22,	%f14,	%f18
	movcs	%xcc,	%l0,	%o0
	edge16n	%g4,	%g6,	%o4
	alignaddrl	%o7,	%i7,	%i6
	edge32ln	%g3,	%l1,	%i5
	lduw	[%l7 + 0x3C],	%i3
	alignaddrl	%o2,	%i4,	%o1
	st	%f26,	[%l7 + 0x4C]
	srax	%g5,	0x1D,	%l2
	movrne	%g7,	%l6,	%i2
	sub	%l4,	%l3,	%o3
	st	%f8,	[%l7 + 0x18]
	orncc	%o6,	%i1,	%l5
	sethi	0x1BC7,	%g1
	edge16ln	%g2,	%o5,	%i0
	stw	%l0,	[%l7 + 0x14]
	udivcc	%o0,	0x0864,	%g4
	sth	%o4,	[%l7 + 0x0C]
	fsrc1s	%f23,	%f10
	edge32ln	%o7,	%g6,	%i7
	save %g3, %i6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x11],	%i3
	edge32ln	%o2,	%i4,	%o1
	movl	%icc,	%i5,	%g5
	stx	%g7,	[%l7 + 0x40]
	movrgz	%l2,	%l6,	%l4
	fzero	%f4
	ld	[%l7 + 0x64],	%f26
	srl	%i2,	0x19,	%o3
	std	%f16,	[%l7 + 0x40]
	and	%l3,	%i1,	%l5
	orncc	%g1,	0x1D5C,	%o6
	smul	%o5,	%i0,	%l0
	udiv	%o0,	0x141C,	%g4
	movrlez	%o4,	0x11A,	%g2
	fmovscc	%icc,	%f13,	%f4
	nop
	set	0x7A, %i7
	ldsh	[%l7 + %i7],	%o7
	add	%i7,	%g3,	%i6
	edge8l	%g6,	%l1,	%i3
	popc	%i4,	%o1
	fmovrdgez	%i5,	%f24,	%f10
	movrne	%g5,	%o2,	%l2
	edge8n	%l6,	%g7,	%l4
	xorcc	%o3,	%l3,	%i1
	edge32ln	%l5,	%g1,	%o6
	fmovsgu	%xcc,	%f15,	%f31
	fmovdvs	%icc,	%f15,	%f4
	sdivcc	%i2,	0x1D03,	%o5
	and	%l0,	0x0D7E,	%i0
	xor	%g4,	0x1A82,	%o0
	andcc	%o4,	%g2,	%i7
	fzeros	%f12
	andcc	%g3,	%i6,	%g6
	srax	%o7,	0x0F,	%i3
	ldsb	[%l7 + 0x47],	%i4
	lduw	[%l7 + 0x7C],	%l1
	addc	%o1,	%g5,	%i5
	andncc	%o2,	%l6,	%l2
	srl	%g7,	%o3,	%l3
	movre	%i1,	%l4,	%g1
	sra	%o6,	%i2,	%o5
	xor	%l0,	0x1FDA,	%i0
	movrne	%g4,	%o0,	%l5
	fors	%f16,	%f31,	%f27
	fmovrdne	%o4,	%f24,	%f6
	fpack32	%f18,	%f28,	%f28
	fmovrsgez	%i7,	%f10,	%f26
	fabss	%f28,	%f18
	edge8l	%g3,	%i6,	%g2
	edge16n	%g6,	%o7,	%i3
	sub	%i4,	0x17CA,	%o1
	fcmple16	%f8,	%f18,	%l1
	movgu	%xcc,	%g5,	%i5
	orn	%o2,	0x062C,	%l2
	addccc	%g7,	0x10DB,	%l6
	xnor	%l3,	%i1,	%l4
	fpmerge	%f28,	%f30,	%f18
	fmovrdgez	%o3,	%f10,	%f10
	array32	%o6,	%g1,	%i2
	addccc	%o5,	0x1864,	%i0
	fmovscs	%icc,	%f10,	%f19
	edge16	%g4,	%o0,	%l0
	udivcc	%l5,	0x1F00,	%o4
	array8	%i7,	%i6,	%g2
	restore %g6, 0x04B9, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x24],	%i3
	fxnor	%f24,	%f30,	%f6
	addc	%o7,	0x0FF7,	%i4
	subccc	%o1,	%l1,	%i5
	and	%g5,	0x16AE,	%o2
	ldsw	[%l7 + 0x48],	%g7
	fsrc1	%f12,	%f26
	edge16	%l2,	%l6,	%l3
	udivx	%l4,	0x0873,	%i1
	movneg	%icc,	%o3,	%o6
	movrlz	%i2,	%g1,	%i0
	sub	%o5,	%g4,	%o0
	fand	%f6,	%f2,	%f18
	stb	%l5,	[%l7 + 0x4F]
	stb	%o4,	[%l7 + 0x4B]
	lduh	[%l7 + 0x12],	%l0
	sethi	0x1B2C,	%i6
	edge16ln	%g2,	%g6,	%g3
	edge16n	%i3,	%o7,	%i4
	sub	%i7,	%l1,	%i5
	fmovdne	%icc,	%f9,	%f25
	srax	%g5,	0x12,	%o1
	ldsw	[%l7 + 0x0C],	%g7
	movrgez	%l2,	%o2,	%l3
	mulscc	%l4,	0x1D64,	%l6
	srax	%o3,	%i1,	%i2
	ldsb	[%l7 + 0x37],	%g1
	movgu	%xcc,	%o6,	%o5
	lduh	[%l7 + 0x50],	%g4
	movcc	%xcc,	%i0,	%l5
	movne	%xcc,	%o4,	%l0
	sdivx	%o0,	0x16DE,	%g2
	ldsh	[%l7 + 0x5E],	%g6
	ldd	[%l7 + 0x38],	%i6
	stw	%i3,	[%l7 + 0x64]
	fpadd16	%f4,	%f6,	%f6
	fand	%f28,	%f4,	%f8
	movg	%icc,	%g3,	%i4
	fandnot2s	%f12,	%f5,	%f27
	udivcc	%o7,	0x0D87,	%i7
	std	%f14,	[%l7 + 0x68]
	edge32ln	%i5,	%g5,	%l1
	move	%xcc,	%o1,	%l2
	sth	%g7,	[%l7 + 0x2E]
	fxor	%f26,	%f30,	%f16
	fornot1s	%f25,	%f25,	%f21
	popc	0x159E,	%l3
	movl	%xcc,	%l4,	%l6
	movne	%icc,	%o3,	%o2
	fpsub32	%f20,	%f16,	%f26
	ldsh	[%l7 + 0x26],	%i1
	movle	%icc,	%i2,	%g1
	xor	%o5,	%g4,	%i0
	sdivx	%o6,	0x08F0,	%l5
	edge32l	%o4,	%o0,	%l0
	save %g2, 0x083D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i3,	%g3,	%i6
	sir	0x1B17
	edge16n	%o7,	%i4,	%i5
	fnands	%f28,	%f9,	%f11
	orncc	%g5,	0x1CC6,	%l1
	stw	%o1,	[%l7 + 0x44]
	fcmpd	%fcc2,	%f24,	%f6
	fcmple16	%f20,	%f2,	%i7
	movrne	%l2,	0x042,	%l3
	sll	%g7,	0x0C,	%l6
	movgu	%icc,	%o3,	%l4
	fornot1s	%f18,	%f16,	%f23
	movvc	%xcc,	%i1,	%o2
	ldsb	[%l7 + 0x42],	%g1
	ldsb	[%l7 + 0x6D],	%i2
	movrgz	%o5,	%i0,	%o6
	sth	%g4,	[%l7 + 0x6C]
	movcc	%xcc,	%o4,	%l5
	movvs	%xcc,	%o0,	%l0
	move	%xcc,	%g2,	%i3
	fornot1s	%f1,	%f20,	%f3
	xorcc	%g3,	0x1CBE,	%i6
	movrlez	%g6,	0x105,	%o7
	array32	%i5,	%i4,	%l1
	sdivcc	%o1,	0x146E,	%g5
	stw	%l2,	[%l7 + 0x2C]
	ldd	[%l7 + 0x48],	%f16
	fcmpeq16	%f0,	%f30,	%l3
	mova	%xcc,	%i7,	%l6
	fexpand	%f18,	%f12
	fmovde	%xcc,	%f2,	%f24
	addccc	%g7,	0x1AFA,	%o3
	movpos	%icc,	%l4,	%i1
	fnand	%f20,	%f8,	%f4
	movrlz	%g1,	0x216,	%i2
	movvs	%xcc,	%o5,	%i0
	or	%o2,	%o6,	%o4
	stb	%g4,	[%l7 + 0x5D]
	array16	%o0,	%l0,	%g2
	edge8l	%l5,	%i3,	%i6
	fmovrsgz	%g6,	%f22,	%f17
	fxnors	%f22,	%f11,	%f4
	movgu	%icc,	%g3,	%o7
	movvs	%icc,	%i5,	%i4
	alignaddr	%o1,	%g5,	%l1
	fcmple16	%f2,	%f30,	%l2
	stx	%i7,	[%l7 + 0x70]
	alignaddr	%l3,	%g7,	%l6
	or	%o3,	%i1,	%g1
	movrgz	%l4,	0x255,	%o5
	fnegd	%f26,	%f20
	fcmpeq16	%f16,	%f10,	%i0
	addccc	%i2,	%o2,	%o6
	movneg	%icc,	%o4,	%g4
	fmul8x16	%f21,	%f12,	%f24
	edge16l	%l0,	%g2,	%l5
	movleu	%icc,	%i3,	%o0
	ldsw	[%l7 + 0x3C],	%i6
	sllx	%g3,	%o7,	%i5
	fnot2	%f8,	%f0
	nop
	set	0x5C, %l4
	ldsb	[%l7 + %l4],	%g6
	addccc	%o1,	0x1C7E,	%g5
	array8	%i4,	%l1,	%i7
	fmovrdne	%l3,	%f30,	%f22
	fmul8ulx16	%f22,	%f6,	%f10
	movrgz	%g7,	%l6,	%l2
	fpadd32	%f8,	%f28,	%f18
	fmovd	%f22,	%f24
	edge16	%o3,	%i1,	%l4
	fexpand	%f23,	%f10
	lduw	[%l7 + 0x18],	%g1
	edge8ln	%i0,	%o5,	%i2
	movpos	%icc,	%o6,	%o2
	subcc	%o4,	0x1D96,	%l0
	srlx	%g2,	0x0B,	%g4
	movcs	%icc,	%l5,	%o0
	add	%i6,	%g3,	%o7
	ld	[%l7 + 0x50],	%f12
	fnands	%f17,	%f19,	%f3
	fmovse	%xcc,	%f1,	%f22
	sdivcc	%i3,	0x09B0,	%g6
	sra	%i5,	%g5,	%o1
	mulscc	%i4,	0x1E99,	%i7
	movvs	%xcc,	%l1,	%g7
	ldsw	[%l7 + 0x6C],	%l6
	array8	%l2,	%l3,	%o3
	sra	%i1,	%l4,	%g1
	edge8n	%i0,	%i2,	%o6
	movneg	%xcc,	%o2,	%o5
	mulscc	%l0,	0x0BD9,	%o4
	fmovdg	%icc,	%f20,	%f1
	sir	0x1047
	orncc	%g2,	0x0EF8,	%g4
	andcc	%l5,	0x13DB,	%i6
	movg	%xcc,	%o0,	%o7
	fnors	%f11,	%f18,	%f2
	edge16l	%g3,	%i3,	%i5
	movvc	%icc,	%g6,	%g5
	and	%o1,	%i7,	%i4
	fornot1s	%f12,	%f3,	%f13
	movl	%xcc,	%g7,	%l1
	array32	%l6,	%l2,	%l3
	movvs	%xcc,	%i1,	%l4
	fcmple32	%f12,	%f26,	%o3
	orn	%g1,	0x0E98,	%i2
	umul	%o6,	0x1798,	%i0
	lduw	[%l7 + 0x54],	%o2
	sdivcc	%l0,	0x0B32,	%o5
	movrne	%g2,	%g4,	%o4
	orcc	%i6,	0x1BCA,	%o0
	ldsw	[%l7 + 0x20],	%l5
	xnorcc	%g3,	%o7,	%i3
	stb	%i5,	[%l7 + 0x2F]
	subcc	%g5,	0x1283,	%o1
	nop
	set	0x48, %g4
	stw	%g6,	[%l7 + %g4]
	movle	%icc,	%i4,	%g7
	movrgz	%i7,	%l1,	%l6
	fmovrdgez	%l2,	%f2,	%f24
	ldsw	[%l7 + 0x28],	%i1
	edge8ln	%l3,	%l4,	%g1
	stx	%i2,	[%l7 + 0x18]
	udivx	%o3,	0x1C37,	%i0
	orcc	%o2,	%l0,	%o6
	fmovsa	%icc,	%f14,	%f28
	orcc	%o5,	%g4,	%o4
	move	%xcc,	%i6,	%o0
	xor	%g2,	%l5,	%o7
	orncc	%i3,	%i5,	%g3
	edge8ln	%g5,	%o1,	%i4
	edge16	%g6,	%g7,	%l1
	udiv	%l6,	0x1BDD,	%l2
	movre	%i1,	%i7,	%l3
	ldsw	[%l7 + 0x3C],	%l4
	stb	%i2,	[%l7 + 0x16]
	movrlz	%o3,	0x0D0,	%i0
	udivcc	%o2,	0x14BE,	%l0
	ld	[%l7 + 0x3C],	%f15
	movrlz	%g1,	%o6,	%g4
	addcc	%o4,	0x0F9B,	%o5
	sdivcc	%i6,	0x14B3,	%o0
	std	%f10,	[%l7 + 0x08]
	xorcc	%g2,	0x1D2C,	%l5
	fpsub32s	%f21,	%f5,	%f2
	mova	%icc,	%o7,	%i5
	sub	%g3,	%g5,	%o1
	edge32l	%i3,	%i4,	%g6
	movre	%l1,	0x21A,	%g7
	fcmps	%fcc1,	%f18,	%f9
	array8	%l6,	%l2,	%i1
	fones	%f6
	sdiv	%l3,	0x109A,	%i7
	std	%f16,	[%l7 + 0x78]
	fmovrsgez	%l4,	%f1,	%f20
	fmovsge	%icc,	%f31,	%f15
	mulx	%i2,	%o3,	%i0
	edge8	%o2,	%l0,	%o6
	array8	%g4,	%g1,	%o5
	srax	%i6,	0x13,	%o4
	edge16	%o0,	%l5,	%g2
	fmuld8sux16	%f0,	%f1,	%f28
	movn	%icc,	%i5,	%g3
	ldsw	[%l7 + 0x30],	%o7
	movrlz	%g5,	%o1,	%i3
	umul	%g6,	0x0CDA,	%i4
	subc	%l1,	0x0CD4,	%l6
	fmovspos	%icc,	%f9,	%f16
	movrgz	%g7,	%l2,	%i1
	sdivx	%l3,	0x0AE2,	%i7
	umul	%l4,	0x1FAB,	%o3
	srl	%i0,	%i2,	%o2
	mulx	%l0,	0x03EB,	%o6
	srlx	%g4,	0x1F,	%o5
	edge32l	%i6,	%o4,	%o0
	fornot1s	%f25,	%f4,	%f13
	edge16l	%l5,	%g2,	%i5
	xnorcc	%g3,	%g1,	%g5
	bshuffle	%f4,	%f26,	%f26
	umulcc	%o7,	0x1F60,	%i3
	movg	%icc,	%g6,	%o1
	edge8ln	%i4,	%l6,	%g7
	sllx	%l2,	0x0D,	%i1
	fmul8x16al	%f10,	%f7,	%f10
	udivx	%l1,	0x101B,	%i7
	orncc	%l3,	0x03FF,	%l4
	sll	%o3,	%i0,	%o2
	fmovdpos	%xcc,	%f7,	%f17
	movcc	%xcc,	%l0,	%i2
	fmul8sux16	%f14,	%f16,	%f28
	movvc	%xcc,	%g4,	%o6
	fcmpeq32	%f8,	%f6,	%i6
	fmovspos	%xcc,	%f26,	%f15
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f26
	umulcc	%o4,	%o5,	%o0
	xorcc	%l5,	%i5,	%g2
	popc	%g3,	%g1
	sdivcc	%g5,	0x0C11,	%i3
	fmovrdlez	%o7,	%f16,	%f26
	umulcc	%g6,	0x10C0,	%o1
	edge16l	%l6,	%g7,	%l2
	orncc	%i4,	0x10AC,	%i1
	array16	%i7,	%l1,	%l3
	orncc	%o3,	0x0AD6,	%l4
	edge16	%o2,	%l0,	%i2
	array16	%i0,	%o6,	%i6
	addccc	%o4,	0x0D5F,	%o5
	edge32l	%o0,	%g4,	%l5
	xorcc	%i5,	0x0E2B,	%g3
	ldd	[%l7 + 0x18],	%f10
	edge8n	%g1,	%g2,	%i3
	addc	%g5,	%g6,	%o1
	ldub	[%l7 + 0x56],	%l6
	add	%o7,	%l2,	%i4
	movvs	%icc,	%i1,	%i7
	subc	%l1,	%l3,	%g7
	array8	%o3,	%l4,	%l0
	movn	%icc,	%i2,	%o2
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	lduw	[%l7 + 0x48],	%i0
	lduh	[%l7 + 0x36],	%o0
	popc	%g4,	%o5
	addccc	%i5,	%g3,	%l5
	fsrc2	%f26,	%f2
	orncc	%g1,	%g2,	%i3
	movn	%icc,	%g6,	%o1
	lduw	[%l7 + 0x60],	%l6
	fmovdle	%xcc,	%f14,	%f30
	fands	%f15,	%f16,	%f4
	fmuld8ulx16	%f24,	%f8,	%f22
	edge16n	%o7,	%g5,	%i4
	fmovdvs	%icc,	%f25,	%f21
	udivx	%l2,	0x1FB1,	%i1
	st	%f6,	[%l7 + 0x48]
	edge16ln	%i7,	%l3,	%g7
	movcs	%icc,	%o3,	%l4
	mulx	%l1,	0x17D8,	%l0
	fmovsvc	%xcc,	%f14,	%f0
	sethi	0x0DDE,	%i2
	fmovrse	%o6,	%f16,	%f0
	fand	%f10,	%f12,	%f20
	sllx	%i6,	0x04,	%o4
	edge32ln	%i0,	%o2,	%g4
	array8	%o5,	%i5,	%g3
	fandnot1s	%f18,	%f15,	%f27
	fmovs	%f13,	%f21
	smulcc	%l5,	0x1416,	%g1
	mulscc	%o0,	0x130C,	%g2
	array32	%i3,	%g6,	%o1
	subc	%l6,	0x1796,	%o7
	edge32	%g5,	%i4,	%l2
	movcc	%xcc,	%i7,	%i1
	ldub	[%l7 + 0x22],	%l3
	ldd	[%l7 + 0x18],	%f20
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%o3
	smul	%g7,	%l4,	%l1
	fmuld8sux16	%f6,	%f25,	%f8
	fmovsg	%icc,	%f24,	%f19
	movrne	%i2,	%o6,	%i6
	edge32l	%l0,	%i0,	%o2
	movgu	%xcc,	%g4,	%o5
	xor	%i5,	%g3,	%l5
	andncc	%o4,	%o0,	%g1
	orn	%g2,	0x0817,	%g6
	movge	%icc,	%i3,	%l6
	edge32l	%o7,	%o1,	%i4
	fornot2s	%f8,	%f29,	%f8
	array32	%l2,	%g5,	%i1
	edge32l	%l3,	%o3,	%i7
	movle	%xcc,	%l4,	%l1
	umulcc	%i2,	%g7,	%i6
	sdivcc	%l0,	0x1632,	%o6
	alignaddr	%o2,	%g4,	%o5
	fmovdcs	%icc,	%f17,	%f19
	sra	%i5,	%g3,	%l5
	alignaddrl	%i0,	%o4,	%g1
	ldsb	[%l7 + 0x08],	%o0
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%g6
	stw	%g2,	[%l7 + 0x3C]
	movle	%xcc,	%l6,	%o7
	movn	%xcc,	%i3,	%o1
	fornot1	%f28,	%f26,	%f6
	fmovdcc	%xcc,	%f17,	%f2
	subccc	%i4,	0x02A3,	%g5
	st	%f27,	[%l7 + 0x60]
	movrgz	%i1,	%l3,	%l2
	array16	%i7,	%o3,	%l4
	stb	%i2,	[%l7 + 0x3B]
	xnorcc	%g7,	%l1,	%l0
	fabsd	%f26,	%f28
	movcs	%xcc,	%o6,	%i6
	sdivx	%g4,	0x1499,	%o2
	movne	%xcc,	%i5,	%g3
	ld	[%l7 + 0x08],	%f9
	movvc	%xcc,	%o5,	%i0
	movrne	%l5,	0x23C,	%g1
	ld	[%l7 + 0x58],	%f25
	movgu	%icc,	%o0,	%g6
	fmovse	%icc,	%f18,	%f26
	fmovrse	%o4,	%f15,	%f31
	movle	%xcc,	%g2,	%l6
	sra	%o7,	0x00,	%i3
	fmovrdgz	%o1,	%f14,	%f2
	movrgz	%g5,	%i1,	%i4
	sir	0x1945
	udiv	%l3,	0x0793,	%i7
	sdivx	%o3,	0x1753,	%l2
	edge16n	%i2,	%l4,	%g7
	movrgez	%l1,	0x0A2,	%l0
	fmovsl	%xcc,	%f16,	%f1
	edge32ln	%i6,	%g4,	%o2
	fpadd16	%f16,	%f2,	%f14
	fnot2s	%f17,	%f17
	restore %i5, 0x0AD4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f26,	%f15,	%f14
	addcc	%o5,	%g3,	%i0
	ldx	[%l7 + 0x70],	%g1
	andcc	%o0,	0x0D32,	%g6
	edge8n	%l5,	%g2,	%l6
	fpsub32	%f8,	%f30,	%f30
	fmovsge	%xcc,	%f22,	%f11
	umulcc	%o7,	0x1201,	%o4
	movrlez	%o1,	0x255,	%i3
	lduw	[%l7 + 0x5C],	%i1
	smul	%g5,	0x0DA1,	%i4
	fmovrsgez	%l3,	%f21,	%f24
	nop
	set	0x10, %o4
	stx	%i7,	[%l7 + %o4]
	alignaddr	%o3,	%i2,	%l2
	fmovrdlz	%l4,	%f24,	%f8
	nop
	set	0x40, %l6
	lduw	[%l7 + %l6],	%g7
	fpsub32s	%f12,	%f20,	%f5
	add	%l1,	%l0,	%g4
	and	%o2,	%i6,	%o6
	srl	%i5,	%o5,	%g3
	ldx	[%l7 + 0x70],	%i0
	edge16ln	%o0,	%g1,	%l5
	smul	%g2,	%g6,	%o7
	or	%l6,	0x0BF5,	%o1
	faligndata	%f0,	%f2,	%f2
	st	%f29,	[%l7 + 0x58]
	srl	%i3,	0x13,	%o4
	edge32n	%g5,	%i4,	%l3
	ldd	[%l7 + 0x20],	%i6
	edge16	%i1,	%i2,	%o3
	ldd	[%l7 + 0x28],	%f2
	save %l2, 0x02EA, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f27,	%f16,	%f22
	stx	%l4,	[%l7 + 0x18]
	fpsub32s	%f29,	%f18,	%f11
	smul	%l1,	0x1B02,	%g4
	fnot2	%f0,	%f22
	fmovda	%xcc,	%f16,	%f10
	smul	%l0,	%o2,	%o6
	ldub	[%l7 + 0x08],	%i6
	udiv	%i5,	0x178B,	%g3
	xor	%i0,	0x108C,	%o0
	addccc	%o5,	0x1D4D,	%g1
	fmovdge	%xcc,	%f7,	%f7
	movg	%icc,	%l5,	%g6
	stx	%g2,	[%l7 + 0x10]
	mulscc	%o7,	%l6,	%i3
	addccc	%o1,	%o4,	%i4
	umulcc	%l3,	0x039F,	%i7
	add	%g5,	%i1,	%o3
	movcc	%xcc,	%l2,	%i2
	smulcc	%g7,	0x0F88,	%l4
	fexpand	%f3,	%f28
	ldsw	[%l7 + 0x2C],	%g4
	movrgez	%l0,	%o2,	%l1
	fmul8x16au	%f11,	%f18,	%f24
	edge16	%i6,	%o6,	%i5
	or	%g3,	0x0D2E,	%o0
	edge32n	%o5,	%i0,	%g1
	movvs	%xcc,	%l5,	%g2
	ld	[%l7 + 0x38],	%f18
	ldsb	[%l7 + 0x5E],	%o7
	stb	%g6,	[%l7 + 0x75]
	smul	%i3,	%l6,	%o1
	mulscc	%o4,	%i4,	%i7
	fcmpne32	%f10,	%f18,	%l3
	ldx	[%l7 + 0x08],	%g5
	edge16l	%o3,	%l2,	%i2
	edge16l	%g7,	%i1,	%g4
	fmovrslez	%l0,	%f2,	%f24
	edge8	%l4,	%l1,	%o2
	smulcc	%o6,	0x1DB5,	%i5
	sll	%g3,	%i6,	%o5
	addcc	%i0,	%g1,	%o0
	fmovscs	%icc,	%f6,	%f26
	ldd	[%l7 + 0x78],	%g2
	udivcc	%l5,	0x0789,	%g6
	fandnot1	%f12,	%f20,	%f22
	edge8	%i3,	%l6,	%o1
	fmovdge	%xcc,	%f27,	%f12
	andncc	%o4,	%i4,	%o7
	sub	%l3,	%i7,	%o3
	fmovdleu	%icc,	%f24,	%f5
	lduh	[%l7 + 0x56],	%l2
	addccc	%i2,	%g7,	%g5
	fcmpne16	%f6,	%f24,	%i1
	sub	%g4,	0x1FC9,	%l4
	srax	%l1,	%l0,	%o2
	sra	%o6,	%i5,	%g3
	edge8l	%o5,	%i6,	%i0
	stx	%o0,	[%l7 + 0x08]
	udivx	%g2,	0x0A61,	%l5
	fpadd16	%f10,	%f0,	%f8
	fmovsgu	%xcc,	%f25,	%f13
	movg	%icc,	%g1,	%i3
	fornot2s	%f15,	%f19,	%f3
	ld	[%l7 + 0x40],	%f2
	ldsb	[%l7 + 0x37],	%g6
	smulcc	%o1,	%l6,	%i4
	ldd	[%l7 + 0x50],	%f4
	movne	%xcc,	%o4,	%o7
	movrgz	%l3,	%o3,	%i7
	andn	%i2,	0x10F0,	%l2
	sdivx	%g7,	0x15BF,	%g5
	addc	%g4,	0x1342,	%l4
	fmovrdne	%l1,	%f4,	%f20
	movrgez	%l0,	0x221,	%i1
	array16	%o6,	%o2,	%g3
	edge32ln	%i5,	%o5,	%i0
	sir	0x1B77
	lduw	[%l7 + 0x18],	%o0
	stb	%i6,	[%l7 + 0x50]
	fcmpne32	%f20,	%f18,	%g2
	lduw	[%l7 + 0x48],	%l5
	movvc	%icc,	%i3,	%g1
	sllx	%o1,	0x1B,	%l6
	save %g6, 0x129B, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x28],	%o7
	andncc	%l3,	%o4,	%i7
	alignaddr	%i2,	%o3,	%g7
	fmovrdlz	%g5,	%f24,	%f6
	std	%f14,	[%l7 + 0x10]
	subc	%l2,	%l4,	%g4
	orcc	%l1,	%i1,	%l0
	movgu	%xcc,	%o2,	%g3
	edge32n	%i5,	%o6,	%o5
	mulscc	%i0,	%i6,	%g2
	fnot2s	%f28,	%f26
	ldd	[%l7 + 0x60],	%l4
	st	%f13,	[%l7 + 0x4C]
	sllx	%o0,	%g1,	%o1
	faligndata	%f24,	%f26,	%f30
	or	%i3,	0x0D02,	%g6
	movcs	%xcc,	%l6,	%o7
	sll	%i4,	%o4,	%l3
	st	%f14,	[%l7 + 0x5C]
	fnot1s	%f12,	%f19
	movneg	%icc,	%i7,	%i2
	fmul8sux16	%f26,	%f0,	%f30
	sdiv	%g7,	0x0025,	%o3
	fmovsa	%icc,	%f30,	%f20
	srax	%g5,	%l2,	%l4
	movg	%xcc,	%g4,	%i1
	edge32ln	%l1,	%o2,	%l0
	edge32n	%i5,	%g3,	%o6
	smulcc	%i0,	%o5,	%i6
	umulcc	%l5,	0x1E42,	%g2
	ldub	[%l7 + 0x62],	%o0
	fxnors	%f17,	%f5,	%f24
	xorcc	%g1,	0x13D1,	%i3
	movcs	%xcc,	%o1,	%l6
	and	%o7,	0x1B5C,	%g6
	umulcc	%i4,	0x1F4B,	%l3
	fcmpeq16	%f14,	%f14,	%o4
	xor	%i7,	0x1365,	%g7
	ldd	[%l7 + 0x20],	%i2
	and	%o3,	0x1190,	%l2
	movne	%xcc,	%l4,	%g5
	xnor	%i1,	0x0B04,	%l1
	movle	%icc,	%o2,	%g4
	orcc	%l0,	%g3,	%o6
	st	%f14,	[%l7 + 0x3C]
	sub	%i0,	0x12FF,	%o5
	orn	%i6,	0x128D,	%l5
	srax	%g2,	%o0,	%g1
	and	%i3,	%i5,	%o1
	fxor	%f4,	%f30,	%f8
	fmovrse	%l6,	%f21,	%f1
	orcc	%g6,	%o7,	%l3
	movpos	%xcc,	%i4,	%i7
	fcmpeq32	%f4,	%f18,	%g7
	popc	0x156D,	%i2
	udivcc	%o4,	0x17FA,	%o3
	udivcc	%l4,	0x1783,	%g5
	mova	%xcc,	%l2,	%l1
	movle	%xcc,	%o2,	%g4
	sub	%i1,	%l0,	%g3
	subcc	%i0,	0x084D,	%o6
	move	%icc,	%i6,	%o5
	sdivx	%l5,	0x0072,	%g2
	movrlez	%o0,	%g1,	%i3
	sth	%i5,	[%l7 + 0x32]
	xor	%o1,	%g6,	%l6
	fnot1s	%f6,	%f13
	edge32	%l3,	%o7,	%i7
	sllx	%i4,	%i2,	%g7
	movvc	%icc,	%o3,	%o4
	movvc	%xcc,	%l4,	%g5
	ld	[%l7 + 0x0C],	%f9
	xor	%l1,	0x179A,	%o2
	orncc	%l2,	0x182C,	%g4
	xor	%i1,	0x0220,	%g3
	umul	%l0,	%o6,	%i6
	xnorcc	%i0,	%l5,	%g2
	fmovdvc	%icc,	%f17,	%f23
	fnot2s	%f3,	%f14
	fnegd	%f12,	%f22
	ldd	[%l7 + 0x70],	%o0
	srlx	%o5,	0x07,	%i3
	edge32	%i5,	%o1,	%g1
	ldsw	[%l7 + 0x58],	%g6
	movn	%icc,	%l3,	%l6
	subcc	%o7,	0x1602,	%i4
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	fnot2	%f14,	%f24
	ldsb	[%l7 + 0x7A],	%o4
	fpack16	%f16,	%f5
	movrne	%o3,	0x1C9,	%g5
	fsrc1	%f12,	%f8
	umul	%l1,	%l4,	%l2
	movvc	%icc,	%g4,	%i1
	edge16n	%g3,	%l0,	%o6
	fmovsvs	%icc,	%f17,	%f3
	fcmpne16	%f24,	%f10,	%i6
	edge16ln	%o2,	%i0,	%g2
	ldd	[%l7 + 0x60],	%l4
	ld	[%l7 + 0x20],	%f2
	st	%f0,	[%l7 + 0x3C]
	and	%o5,	%o0,	%i5
	fones	%f25
	fmovrdlez	%i3,	%f30,	%f28
	sth	%g1,	[%l7 + 0x54]
	fandnot2	%f2,	%f8,	%f10
	andn	%g6,	0x1E17,	%l3
	umulcc	%o1,	%l6,	%i4
	movre	%o7,	%i2,	%g7
	ldsw	[%l7 + 0x54],	%i7
	movcs	%icc,	%o3,	%g5
	movleu	%xcc,	%o4,	%l4
	smul	%l1,	0x1E97,	%l2
	stw	%g4,	[%l7 + 0x10]
	fpsub32s	%f4,	%f15,	%f1
	popc	%g3,	%i1
	movne	%icc,	%o6,	%i6
	ldsh	[%l7 + 0x0E],	%l0
	st	%f21,	[%l7 + 0x74]
	fmovrdne	%o2,	%f8,	%f6
	stw	%i0,	[%l7 + 0x44]
	sdiv	%g2,	0x000F,	%l5
	orncc	%o0,	%o5,	%i5
	fmovd	%f28,	%f26
	fmovsg	%xcc,	%f31,	%f4
	xorcc	%g1,	%i3,	%g6
	edge16	%o1,	%l6,	%i4
	edge32ln	%o7,	%i2,	%g7
	sdivx	%i7,	0x0A21,	%l3
	udivx	%o3,	0x093B,	%g5
	fcmpd	%fcc1,	%f14,	%f4
	edge32	%l4,	%l1,	%o4
	sth	%l2,	[%l7 + 0x0E]
	sethi	0x0EFA,	%g3
	st	%f26,	[%l7 + 0x44]
	orn	%g4,	%o6,	%i1
	stw	%i6,	[%l7 + 0x14]
	sethi	0x1343,	%l0
	edge16n	%i0,	%g2,	%o2
	ldub	[%l7 + 0x5E],	%l5
	edge8	%o5,	%o0,	%i5
	fsrc1	%f8,	%f20
	fpsub16	%f24,	%f4,	%f6
	smul	%g1,	%g6,	%o1
	edge32n	%l6,	%i4,	%o7
	movrlez	%i2,	%g7,	%i3
	addc	%l3,	0x086C,	%i7
	ldub	[%l7 + 0x6F],	%g5
	movge	%xcc,	%l4,	%o3
	orcc	%o4,	0x0CE1,	%l1
	fxors	%f27,	%f15,	%f7
	array16	%l2,	%g4,	%g3
	fmovrdgz	%i1,	%f10,	%f20
	sth	%i6,	[%l7 + 0x14]
	lduh	[%l7 + 0x12],	%o6
	fmovdne	%icc,	%f9,	%f15
	fpadd16s	%f20,	%f12,	%f30
	fcmpgt16	%f18,	%f14,	%i0
	restore %g2, 0x1944, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%o2
	udivx	%o5,	0x02E2,	%l5
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	movrlz	%o1,	0x20C,	%l6
	andncc	%g1,	%i4,	%o7
	fnot1s	%f2,	%f12
	ldub	[%l7 + 0x41],	%i2
	fmul8x16al	%f18,	%f24,	%f0
	smul	%g7,	0x1666,	%l3
	fnegs	%f9,	%f25
	movcs	%icc,	%i3,	%i7
	smul	%l4,	0x0B29,	%g5
	fmuld8sux16	%f12,	%f8,	%f10
	std	%f28,	[%l7 + 0x20]
	srl	%o4,	0x0D,	%o3
	fmovrdlz	%l2,	%f16,	%f22
	movge	%icc,	%g4,	%l1
	edge16n	%i1,	%g3,	%i6
	fandnot2	%f10,	%f0,	%f12
	fcmpd	%fcc2,	%f30,	%f2
	umulcc	%o6,	%i0,	%l0
	movneg	%xcc,	%g2,	%o2
	movre	%l5,	0x1CE,	%o0
	movre	%i5,	0x252,	%g6
	edge32ln	%o1,	%o5,	%l6
	movrne	%i4,	%o7,	%g1
	sub	%i2,	%l3,	%i3
	movpos	%icc,	%i7,	%l4
	andcc	%g7,	0x06D9,	%g5
	addcc	%o4,	%l2,	%g4
	sth	%l1,	[%l7 + 0x78]
	movre	%i1,	0x37F,	%g3
	ldd	[%l7 + 0x70],	%f20
	ldsh	[%l7 + 0x5C],	%i6
	array16	%o3,	%o6,	%l0
	fmovdl	%xcc,	%f29,	%f16
	sir	0x1F8D
	fmovd	%f16,	%f26
	sir	0x1B26
	smulcc	%g2,	0x1252,	%i0
	subccc	%l5,	%o0,	%i5
	and	%g6,	%o2,	%o5
	edge16l	%l6,	%i4,	%o7
	popc	0x1101,	%o1
	andn	%i2,	%l3,	%g1
	stx	%i7,	[%l7 + 0x08]
	fcmps	%fcc1,	%f20,	%f22
	and	%i3,	0x056F,	%l4
	fcmple32	%f22,	%f22,	%g7
	xorcc	%g5,	0x169C,	%l2
	udiv	%g4,	0x07D9,	%l1
	lduw	[%l7 + 0x5C],	%o4
	popc	%g3,	%i1
	smulcc	%o3,	%i6,	%o6
	srl	%g2,	0x02,	%i0
	array16	%l5,	%l0,	%o0
	subcc	%i5,	0x0B68,	%g6
	fcmpeq32	%f14,	%f4,	%o2
	array8	%l6,	%i4,	%o5
	lduw	[%l7 + 0x64],	%o7
	udivx	%i2,	0x187C,	%l3
	nop
	set	0x68, %i5
	stx	%o1,	[%l7 + %i5]
	nop
	set	0x2E, %l1
	sth	%i7,	[%l7 + %l1]
	subcc	%i3,	%g1,	%g7
	srlx	%g5,	0x0E,	%l2
	fcmpgt32	%f30,	%f4,	%g4
	umul	%l1,	%l4,	%o4
	alignaddrl	%i1,	%g3,	%o3
	movre	%o6,	%i6,	%g2
	movne	%xcc,	%l5,	%l0
	or	%i0,	0x0DFC,	%o0
	xorcc	%i5,	%g6,	%l6
	fmovrdlez	%i4,	%f6,	%f28
	std	%f30,	[%l7 + 0x28]
	udivx	%o2,	0x0BB6,	%o7
	fpadd16	%f18,	%f16,	%f22
	fexpand	%f0,	%f18
	popc	%o5,	%l3
	srl	%i2,	0x00,	%i7
	alignaddrl	%o1,	%g1,	%g7
	movrlz	%i3,	%g5,	%l2
	movcc	%icc,	%g4,	%l1
	fmuld8ulx16	%f17,	%f20,	%f30
	and	%o4,	%i1,	%l4
	ldsh	[%l7 + 0x78],	%o3
	addc	%o6,	%g3,	%g2
	move	%xcc,	%i6,	%l0
	stb	%l5,	[%l7 + 0x48]
	andn	%o0,	0x0B53,	%i5
	addc	%g6,	0x1A40,	%l6
	array8	%i4,	%i0,	%o7
	addcc	%o5,	%o2,	%l3
	edge8n	%i7,	%i2,	%g1
	xnor	%g7,	0x0D67,	%o1
	edge8l	%g5,	%i3,	%g4
	movvs	%xcc,	%l2,	%o4
	edge32	%i1,	%l4,	%o3
	addc	%l1,	0x0C9E,	%o6
	fcmpne32	%f4,	%f10,	%g3
	save %i6, %g2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l0,	0x1C97,	%o0
	or	%i5,	%g6,	%l6
	xor	%i4,	0x0DB2,	%i0
	movne	%xcc,	%o5,	%o2
	movcc	%xcc,	%o7,	%i7
	save %i2, 0x020C, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f16,	%f10,	%f14
	alignaddr	%g7,	%o1,	%g5
	sdivx	%i3,	0x0B7E,	%g4
	sethi	0x02EC,	%l2
	sll	%g1,	%o4,	%l4
	movg	%icc,	%i1,	%l1
	st	%f9,	[%l7 + 0x78]
	nop
	set	0x78, %l5
	stw	%o3,	[%l7 + %l5]
	mulscc	%g3,	0x0856,	%i6
	ldub	[%l7 + 0x14],	%o6
	stb	%g2,	[%l7 + 0x10]
	edge16l	%l5,	%o0,	%l0
	andn	%i5,	0x0E67,	%g6
	edge8	%i4,	%i0,	%l6
	srlx	%o5,	%o2,	%o7
	sethi	0x1B4D,	%i7
	sdivcc	%l3,	0x1EE9,	%i2
	smul	%o1,	0x18B0,	%g5
	stw	%i3,	[%l7 + 0x2C]
	mulscc	%g7,	0x1D28,	%g4
	move	%xcc,	%g1,	%l2
	movrlez	%o4,	%l4,	%l1
	sir	0x172B
	udivx	%o3,	0x1A51,	%i1
	fmovdle	%icc,	%f10,	%f4
	movvs	%icc,	%i6,	%g3
	orcc	%o6,	0x1ECC,	%l5
	addc	%o0,	%l0,	%i5
	fmovrdgz	%g2,	%f16,	%f4
	smulcc	%g6,	%i4,	%l6
	and	%i0,	%o2,	%o7
	smul	%o5,	0x179C,	%l3
	fornot1s	%f6,	%f25,	%f23
	fone	%f12
	smul	%i2,	%o1,	%i7
	smulcc	%i3,	%g5,	%g4
	fmovsa	%xcc,	%f25,	%f19
	addc	%g7,	0x1F0A,	%l2
	popc	%g1,	%l4
	movgu	%xcc,	%l1,	%o3
	mulx	%i1,	%i6,	%o4
	stb	%g3,	[%l7 + 0x39]
	and	%l5,	0x1F78,	%o0
	array32	%l0,	%i5,	%g2
	fnors	%f22,	%f26,	%f7
	subccc	%o6,	%i4,	%g6
	xnorcc	%l6,	0x1927,	%o2
	array32	%o7,	%i0,	%l3
	sth	%o5,	[%l7 + 0x4A]
	fmovse	%xcc,	%f0,	%f27
	ldsh	[%l7 + 0x3A],	%i2
	fmovscs	%icc,	%f29,	%f25
	stb	%i7,	[%l7 + 0x0E]
	xnorcc	%o1,	%g5,	%i3
	xnor	%g7,	0x1113,	%l2
	lduh	[%l7 + 0x62],	%g1
	sll	%g4,	%l1,	%o3
	fmovrsgz	%i1,	%f7,	%f2
	fxnors	%f29,	%f22,	%f3
	movle	%icc,	%l4,	%o4
	movle	%icc,	%i6,	%l5
	movre	%o0,	%l0,	%i5
	st	%f3,	[%l7 + 0x4C]
	fmovse	%icc,	%f9,	%f17
	umulcc	%g3,	%g2,	%i4
	ldx	[%l7 + 0x38],	%g6
	alignaddr	%o6,	%o2,	%l6
	edge32l	%i0,	%l3,	%o7
	bshuffle	%f6,	%f0,	%f26
	fmovdcc	%xcc,	%f5,	%f14
	subccc	%o5,	0x1878,	%i2
	sra	%o1,	%g5,	%i7
	ldsh	[%l7 + 0x44],	%i3
	sth	%g7,	[%l7 + 0x72]
	edge16n	%g1,	%l2,	%l1
	fmovsgu	%xcc,	%f16,	%f3
	fmovdg	%xcc,	%f3,	%f23
	movg	%xcc,	%g4,	%o3
	fcmpeq32	%f10,	%f12,	%l4
	sra	%o4,	0x0C,	%i6
	xor	%i1,	0x0FB3,	%o0
	movrlez	%l5,	0x061,	%i5
	fxor	%f4,	%f10,	%f10
	movrlez	%g3,	%l0,	%i4
	ldx	[%l7 + 0x28],	%g2
	fmovsleu	%icc,	%f26,	%f10
	sdiv	%g6,	0x0E57,	%o2
	umulcc	%l6,	%i0,	%l3
	movne	%icc,	%o6,	%o5
	sub	%i2,	%o7,	%o1
	edge8ln	%i7,	%i3,	%g7
	movrne	%g5,	%g1,	%l2
	lduw	[%l7 + 0x18],	%g4
	xnorcc	%l1,	%l4,	%o3
	popc	%o4,	%i6
	fmuld8ulx16	%f31,	%f30,	%f14
	movn	%icc,	%o0,	%l5
	sir	0x1180
	udivx	%i5,	0x193B,	%g3
	edge16ln	%i1,	%i4,	%l0
	edge32n	%g2,	%g6,	%l6
	sll	%o2,	0x0A,	%i0
	edge16l	%l3,	%o5,	%i2
	move	%icc,	%o6,	%o7
	alignaddrl	%i7,	%i3,	%g7
	sethi	0x027A,	%o1
	fzero	%f0
	umul	%g1,	%l2,	%g5
	movgu	%xcc,	%g4,	%l4
	movne	%xcc,	%o3,	%l1
	mova	%xcc,	%o4,	%o0
	fmovrde	%l5,	%f30,	%f14
	and	%i5,	0x14CB,	%i6
	array16	%g3,	%i4,	%l0
	alignaddr	%i1,	%g6,	%l6
	sra	%o2,	%i0,	%l3
	fcmpgt32	%f4,	%f6,	%g2
	fornot2s	%f5,	%f7,	%f16
	st	%f20,	[%l7 + 0x78]
	movrgz	%o5,	0x082,	%o6
	sth	%i2,	[%l7 + 0x5A]
	ldsb	[%l7 + 0x7C],	%i7
	movleu	%xcc,	%o7,	%i3
	ldx	[%l7 + 0x38],	%o1
	ldd	[%l7 + 0x70],	%f20
	fpmerge	%f9,	%f25,	%f12
	orn	%g7,	%l2,	%g1
	edge8l	%g4,	%l4,	%o3
	array8	%g5,	%o4,	%l1
	edge8ln	%l5,	%o0,	%i6
	fmovdvs	%xcc,	%f9,	%f24
	fmovscs	%xcc,	%f17,	%f6
	movne	%icc,	%g3,	%i4
	movrlez	%l0,	%i1,	%i5
	srlx	%l6,	%g6,	%o2
	stw	%l3,	[%l7 + 0x2C]
	sdiv	%i0,	0x10E8,	%g2
	edge16n	%o6,	%o5,	%i2
	move	%icc,	%i7,	%i3
	movg	%xcc,	%o7,	%o1
	sllx	%l2,	%g1,	%g7
	fmovdn	%icc,	%f18,	%f2
	andcc	%g4,	0x02F3,	%l4
	restore %o3, %o4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%l5,	%f26,	%f24
	ldsb	[%l7 + 0x4E],	%l1
	sdivx	%i6,	0x16CC,	%o0
	movrne	%i4,	%g3,	%i1
	xor	%l0,	%l6,	%i5
	std	%f20,	[%l7 + 0x50]
	nop
	set	0x10, %i1
	stx	%o2,	[%l7 + %i1]
	movle	%xcc,	%g6,	%l3
	edge8n	%g2,	%i0,	%o6
	array8	%i2,	%o5,	%i7
	andcc	%i3,	%o7,	%l2
	fcmped	%fcc1,	%f24,	%f16
	edge8n	%o1,	%g1,	%g4
	fpack16	%f0,	%f13
	mulscc	%g7,	0x0222,	%o3
	lduh	[%l7 + 0x76],	%l4
	movpos	%xcc,	%o4,	%l5
	mulx	%g5,	%i6,	%o0
	movg	%icc,	%l1,	%g3
	array16	%i1,	%i4,	%l0
	movneg	%xcc,	%l6,	%i5
	fnor	%f26,	%f30,	%f24
	ldd	[%l7 + 0x38],	%g6
	xor	%l3,	0x0B88,	%g2
	fmovdgu	%xcc,	%f14,	%f13
	fmovscs	%xcc,	%f16,	%f1
	fcmpne16	%f20,	%f30,	%i0
	umul	%o2,	%i2,	%o5
	edge32l	%o6,	%i3,	%i7
	fmovdvc	%xcc,	%f7,	%f25
	ldsb	[%l7 + 0x31],	%o7
	movle	%icc,	%o1,	%g1
	udiv	%l2,	0x15FA,	%g4
	fornot1	%f2,	%f14,	%f12
	andcc	%g7,	%o3,	%l4
	fmovscs	%icc,	%f7,	%f25
	fandnot1	%f2,	%f26,	%f8
	alignaddr	%o4,	%g5,	%i6
	save %l5, 0x03F4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o0,	%g3,	%i4
	edge32n	%i1,	%l0,	%l6
	mova	%xcc,	%i5,	%l3
	srlx	%g2,	%g6,	%i0
	and	%o2,	%o5,	%o6
	srlx	%i3,	0x07,	%i2
	udivcc	%o7,	0x0396,	%o1
	ldub	[%l7 + 0x15],	%i7
	fmul8x16al	%f12,	%f10,	%f20
	sdivx	%l2,	0x179E,	%g4
	movrlz	%g1,	%g7,	%l4
	movl	%icc,	%o3,	%g5
	mulx	%i6,	0x1F86,	%o4
	andncc	%l1,	%o0,	%l5
	edge32ln	%i4,	%g3,	%l0
	addc	%l6,	%i5,	%l3
	movvc	%icc,	%i1,	%g2
	ldd	[%l7 + 0x38],	%f10
	movpos	%icc,	%g6,	%i0
	ldub	[%l7 + 0x0D],	%o2
	andcc	%o5,	0x0551,	%o6
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%i3
	andn	%o7,	%i2,	%o1
	sllx	%l2,	0x15,	%i7
	sethi	0x1A38,	%g1
	movneg	%xcc,	%g4,	%l4
	xorcc	%g7,	%g5,	%i6
	mulx	%o3,	0x01B2,	%o4
	popc	%l1,	%o0
	umul	%i4,	%g3,	%l0
	movpos	%icc,	%l5,	%l6
	lduh	[%l7 + 0x3A],	%l3
	ldsh	[%l7 + 0x5A],	%i1
	movrne	%g2,	0x0ED,	%i5
	fpadd32s	%f24,	%f5,	%f13
	orcc	%g6,	0x0738,	%i0
	fone	%f10
	xnor	%o5,	%o2,	%o6
	fmovscs	%xcc,	%f23,	%f12
	fands	%f0,	%f5,	%f19
	xnor	%i3,	0x0B23,	%o7
	xnor	%i2,	%o1,	%l2
	umul	%g1,	0x0065,	%g4
	orncc	%i7,	0x1263,	%l4
	fmovdle	%icc,	%f7,	%f13
	add	%g5,	%i6,	%o3
	movgu	%icc,	%g7,	%l1
	alignaddr	%o0,	%o4,	%i4
	sra	%g3,	0x1B,	%l0
	xor	%l6,	%l5,	%i1
	movgu	%xcc,	%l3,	%g2
	and	%g6,	%i5,	%i0
	udivx	%o5,	0x1F6B,	%o2
	fmovrdlz	%o6,	%f12,	%f22
	array8	%o7,	%i2,	%i3
	fmovrdgez	%o1,	%f6,	%f28
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	edge8	%g4,	%i7,	%g5
	movn	%icc,	%i6,	%l4
	restore %o3, %g7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f26,	%f6,	%o0
	edge32n	%o4,	%g3,	%i4
	fzeros	%f17
	movre	%l6,	0x181,	%l5
	nop
	set	0x48, %o2
	stw	%i1,	[%l7 + %o2]
	ldd	[%l7 + 0x48],	%f12
	sir	0x1B62
	fmul8x16	%f19,	%f12,	%f20
	xorcc	%l0,	%g2,	%l3
	sdivcc	%g6,	0x0D2A,	%i0
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	xor	%o6,	0x1572,	%o2
	edge32n	%o7,	%i3,	%o1
	fpsub32s	%f11,	%f26,	%f26
	fpadd32s	%f19,	%f3,	%f31
	addc	%g1,	0x0844,	%i2
	umul	%l2,	0x0A41,	%i7
	stw	%g5,	[%l7 + 0x74]
	fmuld8ulx16	%f21,	%f6,	%f28
	ldd	[%l7 + 0x50],	%i6
	sll	%l4,	%g4,	%o3
	fexpand	%f3,	%f18
	sra	%l1,	%g7,	%o4
	stb	%o0,	[%l7 + 0x25]
	sub	%g3,	%l6,	%i4
	mulx	%l5,	%i1,	%l0
	udiv	%l3,	0x01EA,	%g6
	udivx	%i0,	0x05B0,	%g2
	smul	%o5,	%i5,	%o6
	ldub	[%l7 + 0x4C],	%o2
	sdiv	%i3,	0x0D22,	%o1
	fmovdl	%xcc,	%f21,	%f20
	orncc	%g1,	0x0019,	%o7
	and	%l2,	%i7,	%g5
	fcmped	%fcc0,	%f28,	%f24
	move	%xcc,	%i2,	%i6
	movle	%icc,	%g4,	%l4
	fmovsne	%icc,	%f16,	%f24
	edge32n	%o3,	%l1,	%o4
	fabsd	%f14,	%f20
	movne	%xcc,	%g7,	%o0
	smulcc	%l6,	%g3,	%i4
	stw	%l5,	[%l7 + 0x3C]
	movrgz	%l0,	%i1,	%g6
	fpadd32	%f20,	%f24,	%f6
	fsrc2s	%f0,	%f27
	edge16	%l3,	%i0,	%g2
	ldd	[%l7 + 0x28],	%o4
	fmovsvs	%icc,	%f22,	%f11
	movle	%icc,	%i5,	%o2
	fmovsvs	%icc,	%f30,	%f4
	xor	%i3,	%o6,	%g1
	movl	%icc,	%o7,	%l2
	ld	[%l7 + 0x18],	%f14
	fcmpd	%fcc1,	%f6,	%f4
	fpadd32s	%f31,	%f20,	%f18
	umul	%o1,	0x04E6,	%g5
	movrne	%i7,	%i6,	%i2
	edge16n	%l4,	%g4,	%o3
	andn	%l1,	%g7,	%o4
	orn	%l6,	%o0,	%i4
	fmovsge	%xcc,	%f14,	%f10
	andncc	%g3,	%l0,	%l5
	umulcc	%i1,	0x1162,	%g6
	andcc	%l3,	0x1624,	%i0
	subccc	%o5,	%i5,	%g2
	ldub	[%l7 + 0x52],	%i3
	xnorcc	%o2,	%o6,	%o7
	fnot1s	%f31,	%f10
	popc	%l2,	%g1
	movrgez	%o1,	0x364,	%i7
	movrgz	%g5,	0x003,	%i6
	fand	%f4,	%f14,	%f16
	stb	%i2,	[%l7 + 0x4E]
	movneg	%xcc,	%g4,	%l4
	fpmerge	%f17,	%f19,	%f8
	ldsw	[%l7 + 0x44],	%l1
	sub	%g7,	0x1CBC,	%o4
	ldsh	[%l7 + 0x58],	%o3
	fmovrdne	%o0,	%f30,	%f14
	smul	%i4,	%g3,	%l0
	sdivcc	%l5,	0x19CF,	%l6
	stw	%i1,	[%l7 + 0x60]
	movvc	%icc,	%l3,	%i0
	movrne	%o5,	0x299,	%g6
	ldx	[%l7 + 0x40],	%g2
	add	%i3,	0x0603,	%i5
	fpadd32	%f10,	%f12,	%f4
	edge16ln	%o2,	%o7,	%o6
	fpadd32	%f24,	%f28,	%f28
	movleu	%xcc,	%l2,	%o1
	std	%f14,	[%l7 + 0x60]
	movre	%i7,	%g5,	%g1
	sdivcc	%i2,	0x17F2,	%i6
	ldsh	[%l7 + 0x50],	%g4
	popc	0x1FC7,	%l1
	edge32n	%g7,	%l4,	%o3
	movn	%icc,	%o0,	%o4
	movvs	%icc,	%g3,	%l0
	udiv	%l5,	0x0AC4,	%i4
	addcc	%l6,	%l3,	%i0
	ldx	[%l7 + 0x10],	%o5
	movne	%xcc,	%g6,	%g2
	mulx	%i1,	%i5,	%o2
	fpackfix	%f8,	%f0
	fpadd32s	%f23,	%f26,	%f24
	umulcc	%o7,	0x088E,	%i3
	fmovdpos	%icc,	%f14,	%f26
	sll	%l2,	0x0C,	%o1
	edge8l	%i7,	%g5,	%o6
	orcc	%i2,	%i6,	%g4
	or	%g1,	0x1E1B,	%g7
	fpmerge	%f9,	%f6,	%f10
	fmovdneg	%icc,	%f23,	%f10
	add	%l4,	0x1288,	%l1
	edge16ln	%o0,	%o3,	%g3
	fmuld8sux16	%f26,	%f5,	%f20
	xorcc	%l0,	0x13F7,	%l5
	nop
	set	0x17, %i4
	stb	%i4,	[%l7 + %i4]
	add	%o4,	0x1C4D,	%l3
	fone	%f28
	umulcc	%i0,	%l6,	%o5
	srl	%g6,	%i1,	%i5
	restore %o2, %o7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g2,	0x1476,	%o1
	movl	%xcc,	%i7,	%l2
	movrlz	%g5,	%i2,	%i6
	fmul8ulx16	%f16,	%f20,	%f26
	movn	%icc,	%g4,	%g1
	movgu	%xcc,	%g7,	%o6
	sdiv	%l1,	0x1569,	%l4
	umul	%o3,	0x079D,	%o0
	st	%f9,	[%l7 + 0x20]
	srlx	%l0,	%l5,	%i4
	movl	%icc,	%g3,	%o4
	smul	%l3,	%i0,	%o5
	fcmpgt16	%f4,	%f4,	%l6
	movrgez	%i1,	0x0FB,	%i5
	st	%f10,	[%l7 + 0x24]
	movgu	%xcc,	%o2,	%o7
	fors	%f3,	%f25,	%f3
	srax	%g6,	%g2,	%i3
	fmovsleu	%icc,	%f2,	%f15
	fzero	%f0
	ldsw	[%l7 + 0x6C],	%i7
	mulscc	%l2,	%o1,	%g5
	edge16	%i6,	%i2,	%g1
	sdivx	%g7,	0x1A2F,	%o6
	andncc	%g4,	%l4,	%o3
	fxnors	%f17,	%f14,	%f21
	movl	%xcc,	%o0,	%l0
	movpos	%xcc,	%l1,	%l5
	movrgz	%i4,	%o4,	%l3
	sll	%g3,	0x10,	%i0
	movleu	%icc,	%o5,	%l6
	movge	%icc,	%i1,	%o2
	movg	%xcc,	%o7,	%i5
	sub	%g6,	%i3,	%i7
	sra	%g2,	0x19,	%l2
	sllx	%o1,	0x16,	%i6
	save %i2, %g5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%g7,	%l4
	movpos	%xcc,	%g4,	%o3
	edge16l	%o0,	%l1,	%l5
	subccc	%l0,	0x0FCD,	%o4
	lduh	[%l7 + 0x1C],	%i4
	array8	%g3,	%i0,	%l3
	edge8n	%o5,	%l6,	%i1
	or	%o7,	0x05C6,	%o2
	orncc	%g6,	0x1EB2,	%i5
	lduw	[%l7 + 0x34],	%i3
	edge8ln	%i7,	%l2,	%o1
	smulcc	%g2,	0x152A,	%i6
	movge	%xcc,	%i2,	%g1
	fpackfix	%f6,	%f22
	mulscc	%g5,	%o6,	%l4
	sethi	0x1AF3,	%g7
	fnot1	%f26,	%f4
	sdiv	%o3,	0x12AA,	%g4
	popc	0x0AC2,	%l1
	mulx	%l5,	0x13A8,	%o0
	fmovdleu	%icc,	%f12,	%f25
	movle	%icc,	%o4,	%i4
	edge16ln	%l0,	%g3,	%l3
	andcc	%i0,	%l6,	%o5
	lduw	[%l7 + 0x10],	%i1
	ldub	[%l7 + 0x3F],	%o2
	ldx	[%l7 + 0x48],	%o7
	std	%f6,	[%l7 + 0x40]
	edge16n	%i5,	%i3,	%g6
	orncc	%l2,	%i7,	%o1
	movrlz	%i6,	%i2,	%g1
	xorcc	%g5,	%g2,	%o6
	xnor	%l4,	0x0339,	%o3
	fmovscs	%icc,	%f27,	%f21
	addcc	%g7,	0x170B,	%l1
	srl	%l5,	0x0E,	%o0
	edge8l	%g4,	%i4,	%o4
	fmovdle	%icc,	%f20,	%f8
	sethi	0x0680,	%g3
	movl	%icc,	%l0,	%i0
	movge	%icc,	%l6,	%o5
	fmovsgu	%xcc,	%f3,	%f14
	smul	%i1,	0x063A,	%o2
	sdivcc	%l3,	0x10B4,	%o7
	fmovspos	%icc,	%f0,	%f20
	save %i3, 0x1F51, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l2,	0x0E31,	%i7
	edge8l	%o1,	%i6,	%i5
	sdiv	%g1,	0x1C0C,	%i2
	fmovsa	%xcc,	%f14,	%f6
	edge8l	%g5,	%o6,	%g2
	move	%xcc,	%l4,	%g7
	movcc	%xcc,	%o3,	%l5
	edge16n	%l1,	%g4,	%o0
	orcc	%o4,	0x18A3,	%g3
	alignaddrl	%l0,	%i0,	%l6
	sll	%o5,	%i1,	%i4
	move	%icc,	%o2,	%o7
	sdivcc	%i3,	0x0CE1,	%g6
	udivx	%l3,	0x17B8,	%l2
	array16	%i7,	%i6,	%i5
	smulcc	%g1,	%i2,	%g5
	movrgz	%o1,	0x07E,	%g2
	addcc	%o6,	%g7,	%o3
	edge16n	%l4,	%l1,	%l5
	bshuffle	%f6,	%f24,	%f6
	udivcc	%o0,	0x0CDB,	%o4
	edge32l	%g3,	%g4,	%l0
	fmovsleu	%icc,	%f25,	%f17
	udivcc	%i0,	0x00FD,	%l6
	fpadd32s	%f23,	%f14,	%f0
	ldsw	[%l7 + 0x20],	%i1
	sethi	0x042B,	%i4
	fxnor	%f30,	%f2,	%f4
	fzero	%f0
	fmovrdgz	%o2,	%f4,	%f26
	fmul8ulx16	%f22,	%f30,	%f30
	sll	%o7,	0x1E,	%o5
	subcc	%i3,	%l3,	%g6
	movrgz	%l2,	%i7,	%i6
	move	%icc,	%i5,	%i2
	udiv	%g5,	0x1E1F,	%g1
	udivx	%g2,	0x0FFE,	%o1
	sir	0x04EE
	fandnot2	%f14,	%f4,	%f22
	addc	%g7,	%o3,	%l4
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	sethi	0x119E,	%o4
	edge32	%g3,	%g4,	%l1
	ld	[%l7 + 0x10],	%f10
	udivcc	%l0,	0x04CF,	%i0
	umul	%i1,	0x013F,	%l6
	umul	%o2,	0x1262,	%i4
	udivcc	%o5,	0x0408,	%i3
	fexpand	%f8,	%f24
	movleu	%icc,	%l3,	%g6
	ldsh	[%l7 + 0x74],	%l2
	fnot1s	%f25,	%f11
	orcc	%o7,	%i7,	%i5
	sethi	0x1F2F,	%i2
	subc	%g5,	%g1,	%g2
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f22
	stb	%o1,	[%l7 + 0x64]
	mova	%xcc,	%i6,	%o3
	ldx	[%l7 + 0x18],	%l4
	edge8n	%o6,	%l5,	%o0
	udiv	%g7,	0x0C6C,	%g3
	smul	%o4,	0x1777,	%l1
	fnors	%f25,	%f18,	%f26
	movn	%icc,	%g4,	%i0
	ldub	[%l7 + 0x2A],	%i1
	edge16n	%l6,	%o2,	%l0
	udivx	%i4,	0x08E1,	%i3
	sub	%o5,	0x0BD7,	%g6
	movrgz	%l2,	%l3,	%i7
	movrgz	%i5,	0x36C,	%i2
	movcc	%icc,	%g5,	%o7
	fmovrdlez	%g2,	%f20,	%f22
	ldsh	[%l7 + 0x56],	%g1
	stx	%i6,	[%l7 + 0x40]
	array8	%o3,	%l4,	%o1
	sub	%l5,	0x167D,	%o0
	orncc	%g7,	0x18F3,	%o6
	subcc	%g3,	%l1,	%o4
	movrgez	%g4,	%i1,	%l6
	edge32ln	%o2,	%i0,	%l0
	fnands	%f8,	%f16,	%f19
	fands	%f26,	%f26,	%f28
	fandnot1s	%f21,	%f31,	%f12
	alignaddrl	%i3,	%o5,	%g6
	mulscc	%i4,	%l3,	%l2
	sdiv	%i5,	0x155A,	%i7
	lduw	[%l7 + 0x54],	%g5
	fzero	%f22
	nop
	set	0x28, %g5
	std	%f2,	[%l7 + %g5]
	sll	%o7,	%i2,	%g1
	fabss	%f20,	%f11
	movrgz	%i6,	%g2,	%o3
	sllx	%o1,	%l5,	%o0
	movne	%icc,	%l4,	%g7
	udivcc	%o6,	0x06CC,	%g3
	movleu	%icc,	%o4,	%l1
	fmovrslez	%g4,	%f17,	%f1
	restore %i1, 0x1086, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o2,	%l0
	udiv	%i3,	0x0F97,	%o5
	xnor	%g6,	%i4,	%l3
	movpos	%icc,	%i0,	%i5
	ldsh	[%l7 + 0x52],	%l2
	sdiv	%i7,	0x00C8,	%g5
	mulscc	%i2,	%g1,	%o7
	addc	%i6,	%g2,	%o1
	sdivcc	%l5,	0x07E6,	%o3
	sllx	%l4,	0x03,	%g7
	edge16	%o6,	%g3,	%o0
	orncc	%l1,	%o4,	%i1
	fandnot2	%f4,	%f16,	%f0
	smul	%l6,	%o2,	%l0
	udivcc	%g4,	0x0381,	%i3
	array8	%g6,	%i4,	%o5
	fzero	%f26
	fpsub16	%f4,	%f8,	%f8
	edge8l	%i0,	%i5,	%l3
	movvs	%xcc,	%l2,	%g5
	array32	%i2,	%i7,	%g1
	xor	%i6,	0x17B4,	%g2
	addc	%o7,	0x030B,	%o1
	addc	%l5,	0x18D6,	%o3
	edge32n	%l4,	%g7,	%g3
	fmovsl	%xcc,	%f23,	%f22
	add	%o0,	%l1,	%o4
	movn	%xcc,	%i1,	%l6
	mulx	%o6,	%l0,	%g4
	edge32	%i3,	%o2,	%g6
	edge32ln	%o5,	%i0,	%i4
	movrlz	%l3,	0x007,	%i5
	fmovscs	%icc,	%f9,	%f28
	fornot1s	%f24,	%f29,	%f7
	movl	%xcc,	%g5,	%i2
	array8	%i7,	%l2,	%g1
	movcs	%icc,	%i6,	%o7
	movn	%xcc,	%g2,	%l5
	addc	%o1,	0x1E4C,	%o3
	stx	%g7,	[%l7 + 0x08]
	fabsd	%f28,	%f4
	alignaddrl	%l4,	%o0,	%g3
	addcc	%o4,	0x0974,	%i1
	st	%f1,	[%l7 + 0x70]
	lduh	[%l7 + 0x68],	%l1
	std	%f2,	[%l7 + 0x20]
	nop
	set	0x5E, %o3
	sth	%o6,	[%l7 + %o3]
	edge16	%l0,	%g4,	%i3
	save %o2, 0x017D, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o5,	%i0,	%g6
	ldsh	[%l7 + 0x56],	%i4
	stx	%i5,	[%l7 + 0x68]
	fnot1s	%f30,	%f16
	umul	%l3,	0x01C2,	%g5
	sllx	%i2,	0x0F,	%l2
	ldub	[%l7 + 0x77],	%g1
	save %i6, 0x0A9D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f4,	%f18,	%g2
	movpos	%icc,	%l5,	%o7
	subcc	%o3,	%g7,	%l4
	movrne	%o0,	0x189,	%o1
	sethi	0x0734,	%g3
	xnor	%i1,	%l1,	%o6
	edge16ln	%o4,	%l0,	%g4
	movrgez	%o2,	%i3,	%o5
	andn	%i0,	0x0DB0,	%g6
	movre	%l6,	0x3F5,	%i5
	sdiv	%l3,	0x1BEC,	%g5
	fzero	%f0
	andcc	%i4,	%l2,	%i2
	movne	%icc,	%g1,	%i6
	fpadd32	%f2,	%f4,	%f26
	ldsb	[%l7 + 0x17],	%g2
	movrlez	%l5,	%o7,	%o3
	movcs	%xcc,	%g7,	%l4
	st	%f26,	[%l7 + 0x38]
	movle	%xcc,	%o0,	%o1
	orcc	%i7,	%g3,	%l1
	move	%icc,	%o6,	%o4
	movvc	%xcc,	%l0,	%i1
	fnot2	%f0,	%f20
	fabss	%f10,	%f28
	ld	[%l7 + 0x60],	%f24
	movpos	%icc,	%g4,	%o2
	ld	[%l7 + 0x40],	%f2
	sdivx	%i3,	0x0183,	%o5
	array16	%g6,	%i0,	%i5
	sllx	%l3,	0x1E,	%l6
	movcc	%icc,	%g5,	%l2
	xor	%i2,	%i4,	%i6
	ldsh	[%l7 + 0x56],	%g2
	udivcc	%g1,	0x089A,	%o7
	stx	%o3,	[%l7 + 0x30]
	sra	%l5,	0x0D,	%l4
	movne	%icc,	%o0,	%g7
	addccc	%o1,	%i7,	%g3
	xor	%l1,	%o4,	%o6
	fpmerge	%f28,	%f4,	%f6
	fnot2s	%f30,	%f28
	alignaddr	%i1,	%g4,	%l0
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f22
	fzeros	%f24
	movrgez	%i3,	0x38F,	%o2
	fmovsle	%xcc,	%f16,	%f8
	movpos	%xcc,	%g6,	%o5
	srax	%i0,	%l3,	%l6
	lduh	[%l7 + 0x76],	%g5
	sdivx	%i5,	0x11DE,	%i2
	fornot1	%f22,	%f16,	%f30
	lduw	[%l7 + 0x70],	%i4
	sdiv	%i6,	0x1033,	%g2
	smulcc	%g1,	%o7,	%l2
	xor	%l5,	0x0658,	%o3
	add	%o0,	%l4,	%g7
	fmovde	%xcc,	%f15,	%f13
	sra	%i7,	0x1B,	%o1
	addccc	%g3,	%o4,	%o6
	fmovdn	%xcc,	%f16,	%f27
	movge	%xcc,	%i1,	%g4
	fmovs	%f19,	%f5
	fmovdne	%icc,	%f18,	%f31
	fzero	%f14
	smulcc	%l0,	0x0831,	%l1
	and	%i3,	%g6,	%o5
	move	%icc,	%i0,	%l3
	mova	%icc,	%l6,	%g5
	fmovrsgz	%i5,	%f10,	%f16
	srl	%o2,	0x00,	%i4
	stb	%i2,	[%l7 + 0x4F]
	fmovsl	%xcc,	%f16,	%f21
	movrgz	%g2,	0x0CE,	%i6
	addc	%g1,	0x1CA1,	%o7
	edge8	%l5,	%o3,	%o0
	movvc	%icc,	%l4,	%l2
	movvs	%xcc,	%g7,	%i7
	movge	%xcc,	%g3,	%o4
	ldsb	[%l7 + 0x10],	%o6
	movvc	%icc,	%o1,	%i1
	sth	%g4,	[%l7 + 0x10]
	xnor	%l0,	0x0CB8,	%i3
	srl	%l1,	0x17,	%o5
	xnorcc	%i0,	0x0BD1,	%g6
	srl	%l3,	0x00,	%g5
	ldd	[%l7 + 0x58],	%f14
	edge16l	%l6,	%i5,	%o2
	mulx	%i2,	0x0820,	%g2
	sub	%i4,	%g1,	%o7
	fpadd32s	%f14,	%f0,	%f21
	movvc	%xcc,	%l5,	%i6
	fmovdcs	%icc,	%f29,	%f0
	movne	%xcc,	%o3,	%o0
	andcc	%l4,	%l2,	%g7
	and	%g3,	0x0D93,	%i7
	sth	%o4,	[%l7 + 0x1A]
	fmovdgu	%icc,	%f13,	%f7
	udivcc	%o1,	0x03F6,	%i1
	fmovrsne	%o6,	%f30,	%f20
	movrlz	%l0,	%i3,	%g4
	udivcc	%o5,	0x07A9,	%i0
	fcmpeq16	%f18,	%f26,	%g6
	smulcc	%l3,	%l1,	%l6
	move	%icc,	%i5,	%g5
	orncc	%o2,	%g2,	%i2
	xor	%g1,	%i4,	%l5
	edge16l	%o7,	%o3,	%o0
	sth	%i6,	[%l7 + 0x36]
	ldd	[%l7 + 0x78],	%f6
	movrne	%l4,	%l2,	%g7
	xnor	%i7,	0x06E9,	%g3
	fmovrsne	%o4,	%f31,	%f3
	fcmpeq32	%f24,	%f18,	%i1
	fmovsne	%xcc,	%f2,	%f27
	ldx	[%l7 + 0x58],	%o1
	fabsd	%f8,	%f22
	fmovsvs	%icc,	%f0,	%f5
	movrlz	%l0,	0x12B,	%i3
	movneg	%icc,	%g4,	%o6
	xorcc	%i0,	0x0658,	%g6
	orcc	%l3,	0x1D93,	%o5
	lduw	[%l7 + 0x44],	%l6
	movl	%xcc,	%i5,	%l1
	popc	%g5,	%g2
	sethi	0x0A8F,	%i2
	movvc	%xcc,	%o2,	%g1
	ldsh	[%l7 + 0x7E],	%i4
	ldsh	[%l7 + 0x30],	%l5
	fmovsl	%xcc,	%f9,	%f18
	addc	%o3,	%o0,	%o7
	ldd	[%l7 + 0x30],	%f26
	sir	0x1317
	subc	%l4,	0x057E,	%i6
	add	%l2,	0x10AB,	%g7
	movleu	%icc,	%g3,	%o4
	st	%f4,	[%l7 + 0x54]
	fmovde	%xcc,	%f14,	%f0
	edge8n	%i7,	%o1,	%l0
	fmovspos	%icc,	%f1,	%f23
	udiv	%i1,	0x054B,	%g4
	fcmpeq16	%f8,	%f0,	%o6
	fmovscs	%xcc,	%f29,	%f3
	edge8	%i3,	%g6,	%i0
	fmovrdgz	%l3,	%f4,	%f12
	fmovsa	%icc,	%f17,	%f3
	movvc	%icc,	%l6,	%i5
	alignaddr	%o5,	%g5,	%g2
	fmovsne	%icc,	%f15,	%f13
	movvs	%icc,	%i2,	%o2
	mulx	%l1,	0x1388,	%i4
	fmovsneg	%icc,	%f21,	%f6
	stw	%l5,	[%l7 + 0x54]
	sethi	0x02CE,	%g1
	fmul8x16	%f14,	%f10,	%f18
	fnand	%f12,	%f22,	%f14
	sllx	%o3,	0x10,	%o7
	fpadd32	%f0,	%f22,	%f4
	ldsb	[%l7 + 0x30],	%o0
	addccc	%l4,	%l2,	%i6
	movrne	%g7,	0x0CE,	%o4
	edge32l	%i7,	%o1,	%l0
	xnor	%i1,	%g3,	%o6
	mulscc	%i3,	0x0A4F,	%g4
	udivx	%i0,	0x0A57,	%l3
	fmovsneg	%xcc,	%f2,	%f9
	fmovrdlez	%l6,	%f14,	%f18
	subc	%i5,	0x0CDB,	%o5
	array16	%g6,	%g2,	%i2
	movleu	%xcc,	%g5,	%o2
	udivx	%l1,	0x0199,	%i4
	movpos	%icc,	%g1,	%l5
	movleu	%xcc,	%o7,	%o3
	fmovsn	%icc,	%f23,	%f16
	edge8ln	%l4,	%l2,	%o0
	andcc	%g7,	%i6,	%i7
	addccc	%o4,	%o1,	%l0
	movre	%i1,	%g3,	%o6
	movneg	%icc,	%g4,	%i3
	udivx	%l3,	0x07D1,	%l6
	stw	%i0,	[%l7 + 0x10]
	save %i5, 0x118D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o5,	%i2,	%g5
	fmovrdlez	%g2,	%f14,	%f8
	edge8ln	%l1,	%o2,	%i4
	array16	%g1,	%l5,	%o3
	ld	[%l7 + 0x68],	%f21
	movle	%xcc,	%l4,	%o7
	xnorcc	%l2,	%g7,	%o0
	sll	%i6,	0x02,	%i7
	smulcc	%o4,	%l0,	%i1
	sll	%o1,	%g3,	%o6
	sir	0x0195
	movrgez	%g4,	0x339,	%i3
	andncc	%l6,	%i0,	%l3
	umul	%g6,	0x0EF9,	%i5
	fcmpes	%fcc1,	%f3,	%f26
	movle	%xcc,	%i2,	%o5
	std	%f0,	[%l7 + 0x10]
	alignaddrl	%g5,	%l1,	%o2
	and	%g2,	%i4,	%g1
	andcc	%l5,	%l4,	%o7
	st	%f5,	[%l7 + 0x18]
	movneg	%xcc,	%l2,	%o3
	smulcc	%o0,	0x1A32,	%g7
	xorcc	%i6,	0x1676,	%i7
	sra	%l0,	%i1,	%o4
	fxnors	%f8,	%f3,	%f30
	sub	%g3,	%o6,	%g4
	edge16n	%o1,	%i3,	%l6
	sdiv	%l3,	0x1DAF,	%i0
	movcc	%icc,	%g6,	%i5
	fcmped	%fcc2,	%f10,	%f6
	array32	%o5,	%g5,	%l1
	and	%o2,	%g2,	%i2
	fcmple16	%f26,	%f16,	%g1
	ld	[%l7 + 0x1C],	%f8
	movrlez	%i4,	%l5,	%l4
	movrlez	%l2,	0x1EC,	%o3
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	array32	%o0,	%i7,	%i6
	movrgz	%i1,	%o4,	%g3
	subcc	%o6,	0x1510,	%l0
	smul	%g4,	0x0C37,	%i3
	fandnot1s	%f3,	%f16,	%f18
	orncc	%l6,	0x1952,	%o1
	movle	%xcc,	%l3,	%g6
	fnand	%f30,	%f0,	%f0
	andn	%i5,	%i0,	%g5
	movge	%icc,	%o5,	%l1
	move	%xcc,	%o2,	%g2
	umul	%g1,	0x033C,	%i4
	array8	%i2,	%l4,	%l2
	fsrc2	%f26,	%f30
	alignaddr	%l5,	%o7,	%o3
	umulcc	%o0,	%g7,	%i6
	ldx	[%l7 + 0x70],	%i1
	fabsd	%f0,	%f22
	fone	%f10
	ldd	[%l7 + 0x50],	%f20
	movvc	%icc,	%i7,	%g3
	fmovsge	%xcc,	%f11,	%f22
	edge32	%o6,	%l0,	%g4
	movgu	%xcc,	%i3,	%o4
	udiv	%l6,	0x08D3,	%l3
	xor	%o1,	0x1486,	%i5
	movg	%xcc,	%g6,	%g5
	fxnor	%f8,	%f2,	%f12
	or	%o5,	%l1,	%i0
	subc	%o2,	0x1152,	%g1
	movpos	%icc,	%i4,	%i2
	movcs	%icc,	%g2,	%l2
	movre	%l5,	%o7,	%o3
	lduh	[%l7 + 0x28],	%l4
	edge16ln	%g7,	%i6,	%o0
	movcc	%icc,	%i1,	%g3
	ldsw	[%l7 + 0x4C],	%o6
	fmovscs	%xcc,	%f31,	%f29
	edge32	%l0,	%i7,	%i3
	subccc	%o4,	0x0BA5,	%g4
	movge	%xcc,	%l6,	%l3
	movrne	%o1,	%i5,	%g5
	sub	%o5,	0x12D4,	%l1
	movrlez	%g6,	0x3C6,	%i0
	sra	%o2,	%i4,	%i2
	fabss	%f9,	%f6
	subccc	%g2,	%l2,	%g1
	save %l5, 0x0DBF, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l4,	%o7,	%i6
	fmul8x16al	%f10,	%f20,	%f28
	lduh	[%l7 + 0x66],	%g7
	movcs	%icc,	%o0,	%i1
	fmul8sux16	%f6,	%f14,	%f0
	stx	%g3,	[%l7 + 0x50]
	edge32ln	%l0,	%i7,	%o6
	edge16ln	%o4,	%i3,	%g4
	andn	%l3,	0x1F36,	%o1
	fcmple32	%f12,	%f2,	%l6
	sth	%i5,	[%l7 + 0x70]
	edge8	%o5,	%l1,	%g6
	mulscc	%g5,	0x0B57,	%o2
	orn	%i0,	%i4,	%i2
	movrlz	%g2,	0x052,	%g1
	fmovdl	%xcc,	%f5,	%f19
	sllx	%l2,	%o3,	%l4
	move	%icc,	%o7,	%i6
	array16	%g7,	%o0,	%i1
	sdiv	%l5,	0x08DF,	%l0
	fxnors	%f7,	%f30,	%f31
	sdiv	%g3,	0x0FF8,	%i7
	fmovsn	%xcc,	%f1,	%f21
	edge8ln	%o6,	%o4,	%g4
	edge16	%i3,	%o1,	%l6
	smul	%i5,	0x1A37,	%l3
	edge8l	%l1,	%o5,	%g5
	sra	%o2,	%g6,	%i0
	andcc	%i2,	0x11C0,	%g2
	fcmpgt32	%f4,	%f10,	%i4
	andncc	%l2,	%o3,	%l4
	srlx	%g1,	%o7,	%i6
	fmovsne	%icc,	%f25,	%f23
	fmovrse	%g7,	%f2,	%f0
	movvs	%xcc,	%i1,	%o0
	fmul8x16al	%f19,	%f28,	%f2
	fnands	%f18,	%f27,	%f20
	stx	%l5,	[%l7 + 0x08]
	fpmerge	%f28,	%f3,	%f14
	sdivx	%l0,	0x1628,	%g3
	fcmple32	%f30,	%f4,	%o6
	ldx	[%l7 + 0x38],	%i7
	fornot1s	%f26,	%f13,	%f31
	smul	%o4,	%g4,	%i3
	lduw	[%l7 + 0x44],	%o1
	mulx	%i5,	%l6,	%l1
	edge8	%l3,	%o5,	%o2
	edge8	%g5,	%i0,	%g6
	array8	%g2,	%i2,	%l2
	orcc	%o3,	%i4,	%g1
	fmovdpos	%icc,	%f29,	%f15
	move	%icc,	%o7,	%l4
	alignaddr	%i6,	%i1,	%g7
	edge8n	%l5,	%l0,	%o0
	stw	%o6,	[%l7 + 0x4C]
	subc	%g3,	%i7,	%o4
	subccc	%i3,	0x0FC7,	%g4
	sir	0x1AD1
	subcc	%o1,	%l6,	%i5
	fandnot2	%f12,	%f10,	%f30
	srl	%l3,	%l1,	%o2
	subccc	%o5,	0x1CAF,	%g5
	srl	%g6,	0x1D,	%g2
	umulcc	%i2,	%i0,	%l2
	udiv	%i4,	0x0727,	%g1
	alignaddr	%o7,	%o3,	%l4
	umul	%i6,	0x047F,	%i1
	movn	%xcc,	%g7,	%l0
	addccc	%l5,	0x10C9,	%o6
	fmul8x16al	%f26,	%f26,	%f6
	movgu	%icc,	%g3,	%o0
	movg	%xcc,	%o4,	%i7
	restore %g4, %o1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i5,	0x0AE4,	%l6
	fmul8sux16	%f8,	%f30,	%f30
	smulcc	%l1,	0x1147,	%l3
	mova	%icc,	%o2,	%g5
	sdiv	%o5,	0x07CD,	%g2
	movn	%icc,	%i2,	%i0
	edge8n	%g6,	%l2,	%g1
	fmovdne	%xcc,	%f27,	%f12
	movgu	%icc,	%o7,	%i4
	edge8ln	%l4,	%i6,	%i1
	fxors	%f19,	%f0,	%f25
	edge32l	%o3,	%l0,	%l5
	subccc	%o6,	%g7,	%o0
	subccc	%o4,	%i7,	%g4
	fmuld8sux16	%f3,	%f3,	%f30
	ldsw	[%l7 + 0x64],	%g3
	movrgez	%o1,	0x3CA,	%i5
	fmuld8ulx16	%f23,	%f16,	%f10
	umulcc	%i3,	0x0539,	%l1
	and	%l6,	%l3,	%g5
	movrgz	%o5,	%g2,	%o2
	fnor	%f6,	%f10,	%f22
	ldx	[%l7 + 0x78],	%i0
	xnorcc	%i2,	%g6,	%l2
	srax	%o7,	%g1,	%i4
	xorcc	%l4,	0x1CDE,	%i1
	fcmpeq16	%f28,	%f28,	%o3
	srax	%l0,	%l5,	%i6
	addcc	%o6,	0x069A,	%g7
	sra	%o0,	%o4,	%i7
	fnand	%f10,	%f16,	%f10
	edge8l	%g4,	%g3,	%o1
	srlx	%i3,	0x02,	%l1
	ld	[%l7 + 0x44],	%f19
	edge16ln	%i5,	%l3,	%g5
	udivx	%l6,	0x0643,	%o5
	lduh	[%l7 + 0x0E],	%o2
	save %g2, %i2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l2,	%o7,	%g1
	std	%f14,	[%l7 + 0x68]
	ld	[%l7 + 0x14],	%f18
	array32	%i0,	%l4,	%i1
	fmovdn	%icc,	%f16,	%f28
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	sra	%l5,	%i6,	%o6
	orncc	%g7,	0x15F6,	%o0
	restore %o4, 0x0259, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i7,	%g3,	%g4
	sra	%o1,	0x17,	%l1
	orn	%i5,	%l3,	%i3
	sethi	0x01A1,	%l6
	popc	%g5,	%o5
	array32	%g2,	%i2,	%o2
	movle	%xcc,	%l2,	%o7
	movrlz	%g6,	0x2BA,	%g1
	xorcc	%l4,	%i1,	%o3
	sdiv	%i0,	0x1353,	%l5
	sdivx	%i4,	0x09EA,	%i6
	fmovrdne	%g7,	%f26,	%f22
	fmovda	%icc,	%f18,	%f4
	sth	%o0,	[%l7 + 0x60]
	sub	%o6,	%o4,	%i7
	edge32	%l0,	%g4,	%o1
	fmovdl	%icc,	%f26,	%f6
	edge16	%g3,	%i5,	%l1
	smulcc	%i3,	%l6,	%l3
	ld	[%l7 + 0x5C],	%f3
	srlx	%o5,	%g5,	%g2
	sub	%i2,	%o2,	%o7
	nop
	set	0x28, %i2
	ldsh	[%l7 + %i2],	%l2
	udivx	%g6,	0x044C,	%l4
	xnorcc	%g1,	0x0632,	%i1
	xnor	%i0,	0x1D33,	%l5
	udivx	%o3,	0x0D38,	%i6
	stb	%g7,	[%l7 + 0x71]
	fnot1s	%f13,	%f8
	mova	%xcc,	%o0,	%o6
	movneg	%icc,	%i4,	%o4
	edge8n	%l0,	%i7,	%o1
	sethi	0x1BA6,	%g3
	ldub	[%l7 + 0x32],	%i5
	ldsw	[%l7 + 0x20],	%g4
	andcc	%l1,	0x12E3,	%l6
	edge32n	%l3,	%o5,	%i3
	subccc	%g5,	0x07EB,	%i2
	edge32l	%o2,	%g2,	%l2
	movvc	%icc,	%o7,	%g6
	movcc	%icc,	%l4,	%i1
	fmovsneg	%icc,	%f5,	%f30
	srl	%i0,	0x0B,	%g1
	sra	%l5,	%i6,	%o3
	fsrc2s	%f11,	%f17
	sub	%o0,	0x1BBC,	%o6
	fabss	%f31,	%f25
	sub	%i4,	0x025F,	%o4
	movpos	%xcc,	%g7,	%i7
	alignaddr	%o1,	%l0,	%i5
	mova	%icc,	%g3,	%g4
	st	%f8,	[%l7 + 0x68]
	fxnors	%f7,	%f2,	%f8
	movvc	%icc,	%l6,	%l3
	edge32l	%o5,	%i3,	%l1
	sth	%g5,	[%l7 + 0x40]
	and	%i2,	0x06CE,	%o2
	array32	%g2,	%o7,	%g6
	fcmpne16	%f24,	%f12,	%l4
	fpsub16	%f28,	%f4,	%f0
	movre	%i1,	%l2,	%g1
	movrgz	%l5,	0x276,	%i0
	srl	%o3,	%i6,	%o0
	fmovspos	%xcc,	%f14,	%f11
	xnor	%i4,	0x08D7,	%o6
	edge32	%g7,	%o4,	%o1
	edge8l	%i7,	%l0,	%i5
	movg	%xcc,	%g3,	%g4
	edge32n	%l3,	%l6,	%o5
	fmovdvs	%icc,	%f31,	%f16
	fmovrdne	%i3,	%f18,	%f4
	umulcc	%g5,	%l1,	%o2
	stb	%i2,	[%l7 + 0x14]
	save %g2, %o7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i1,	0x1B5C,	%l2
	xor	%l4,	0x1512,	%g1
	alignaddrl	%l5,	%i0,	%o3
	movne	%icc,	%o0,	%i6
	movrgz	%i4,	0x3C6,	%o6
	movne	%icc,	%o4,	%o1
	fcmped	%fcc3,	%f0,	%f6
	xnorcc	%g7,	%i7,	%l0
	movg	%icc,	%g3,	%i5
	movvc	%icc,	%g4,	%l3
	orncc	%l6,	%i3,	%g5
	lduh	[%l7 + 0x52],	%l1
	fmovdneg	%icc,	%f13,	%f6
	fpadd32	%f4,	%f22,	%f22
	sub	%o5,	%i2,	%g2
	stx	%o2,	[%l7 + 0x28]
	sdivx	%o7,	0x1A28,	%i1
	edge8ln	%l2,	%l4,	%g1
	movrne	%g6,	%l5,	%o3
	and	%i0,	%i6,	%i4
	sir	0x093C
	movgu	%icc,	%o6,	%o4
	std	%f20,	[%l7 + 0x08]
	mulx	%o1,	%g7,	%i7
	fmovdne	%xcc,	%f18,	%f1
	orcc	%l0,	0x1771,	%g3
	stb	%o0,	[%l7 + 0x6D]
	fnegd	%f6,	%f20
	edge8	%i5,	%l3,	%g4
	movvs	%icc,	%l6,	%i3
	movvc	%icc,	%l1,	%g5
	sll	%o5,	%i2,	%o2
	movvs	%xcc,	%g2,	%i1
	movle	%xcc,	%o7,	%l2
	save %l4, %g1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o3,	%i0
	fcmpgt16	%f26,	%f0,	%l5
	fmovrsne	%i6,	%f22,	%f2
	lduw	[%l7 + 0x1C],	%i4
	fzero	%f18
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%o4
	array8	%o1,	%g7,	%o6
	xnorcc	%i7,	%l0,	%o0
	ldd	[%l7 + 0x20],	%f26
	umul	%g3,	0x042B,	%i5
	array16	%l3,	%g4,	%l6
	edge32n	%i3,	%g5,	%o5
	sll	%l1,	0x05,	%i2
	addccc	%o2,	%i1,	%g2
	movpos	%xcc,	%o7,	%l4
	fors	%f29,	%f13,	%f5
	movrne	%l2,	%g6,	%g1
	fcmple16	%f8,	%f4,	%i0
	movl	%xcc,	%o3,	%i6
	fmovrsne	%l5,	%f24,	%f11
	stb	%i4,	[%l7 + 0x34]
	fandnot1	%f8,	%f2,	%f28
	srax	%o1,	%g7,	%o6
	sllx	%o4,	0x0F,	%i7
	fpadd32s	%f4,	%f2,	%f12
	movcs	%icc,	%l0,	%g3
	fcmped	%fcc2,	%f4,	%f24
	edge32n	%o0,	%i5,	%l3
	fmovd	%f22,	%f22
	edge16ln	%g4,	%i3,	%l6
	srlx	%o5,	%l1,	%i2
	srlx	%o2,	%g5,	%g2
	srlx	%o7,	0x0D,	%l4
	sll	%l2,	%g6,	%i1
	edge8n	%g1,	%o3,	%i6
	fmuld8ulx16	%f25,	%f2,	%f22
	fand	%f4,	%f30,	%f26
	fmovdpos	%xcc,	%f31,	%f9
	popc	0x1779,	%l5
	sub	%i0,	%i4,	%g7
	udiv	%o6,	0x04D5,	%o1
	orcc	%i7,	%l0,	%o4
	udivcc	%g3,	0x108F,	%o0
	movre	%l3,	0x0E1,	%g4
	movrne	%i5,	%i3,	%o5
	sth	%l6,	[%l7 + 0x1C]
	ldx	[%l7 + 0x78],	%i2
	addcc	%o2,	%l1,	%g5
	movrgz	%o7,	%l4,	%l2
	movge	%xcc,	%g2,	%i1
	umulcc	%g6,	%o3,	%i6
	fpackfix	%f20,	%f18
	ldsw	[%l7 + 0x60],	%l5
	orn	%g1,	0x057A,	%i0
	stw	%g7,	[%l7 + 0x30]
	xorcc	%i4,	%o6,	%o1
	orn	%i7,	%o4,	%g3
	fmuld8sux16	%f17,	%f12,	%f20
	movne	%icc,	%o0,	%l3
	fcmpes	%fcc3,	%f14,	%f21
	addc	%l0,	%g4,	%i3
	fcmpd	%fcc3,	%f18,	%f22
	movge	%icc,	%i5,	%l6
	udivcc	%o5,	0x13BF,	%o2
	fones	%f9
	fxor	%f20,	%f8,	%f20
	edge16n	%l1,	%g5,	%i2
	addccc	%l4,	%o7,	%l2
	udivcc	%i1,	0x11E0,	%g2
	fones	%f22
	movl	%icc,	%o3,	%g6
	udivx	%l5,	0x1382,	%g1
	fornot2s	%f30,	%f20,	%f14
	fsrc1	%f22,	%f30
	subccc	%i6,	%i0,	%i4
	alignaddr	%g7,	%o6,	%o1
	movpos	%icc,	%i7,	%g3
	sir	0x1568
	sll	%o0,	%l3,	%o4
	lduw	[%l7 + 0x64],	%g4
	sethi	0x0D6F,	%l0
	ldub	[%l7 + 0x57],	%i5
	movcs	%icc,	%l6,	%i3
	movl	%icc,	%o2,	%o5
	movrlez	%l1,	0x226,	%i2
	subcc	%l4,	0x1E37,	%o7
	fpsub32s	%f0,	%f0,	%f28
	movleu	%xcc,	%l2,	%g5
	smulcc	%g2,	0x1A88,	%i1
	movleu	%icc,	%g6,	%o3
	sethi	0x0484,	%g1
	umulcc	%i6,	%i0,	%i4
	edge8n	%l5,	%o6,	%o1
	ldx	[%l7 + 0x70],	%g7
	fmovde	%xcc,	%f10,	%f16
	array16	%i7,	%o0,	%l3
	movge	%xcc,	%o4,	%g4
	subccc	%g3,	%l0,	%i5
	sllx	%l6,	0x06,	%o2
	movleu	%icc,	%o5,	%i3
	edge8l	%l1,	%l4,	%o7
	fmovsn	%xcc,	%f11,	%f29
	srl	%i2,	%l2,	%g2
	fpackfix	%f26,	%f17
	fsrc1s	%f2,	%f13
	ldsw	[%l7 + 0x38],	%i1
	smul	%g6,	%g5,	%g1
	edge8l	%o3,	%i6,	%i0
	ldd	[%l7 + 0x68],	%f18
	array8	%l5,	%i4,	%o1
	movpos	%icc,	%g7,	%i7
	ldd	[%l7 + 0x68],	%f16
	nop
	set	0x36, %o0
	ldub	[%l7 + %o0],	%o6
	fmul8ulx16	%f26,	%f6,	%f16
	array32	%l3,	%o4,	%g4
	fsrc2s	%f23,	%f6
	stb	%g3,	[%l7 + 0x58]
	edge32	%o0,	%l0,	%l6
	movvs	%xcc,	%i5,	%o2
	ldsb	[%l7 + 0x6E],	%o5
	mova	%icc,	%l1,	%i3
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f8
	subcc	%l4,	%i2,	%l2
	faligndata	%f20,	%f10,	%f22
	edge32n	%g2,	%i1,	%o7
	add	%g5,	0x04FB,	%g6
	mova	%icc,	%g1,	%o3
	edge32l	%i0,	%l5,	%i4
	lduh	[%l7 + 0x56],	%i6
	alignaddrl	%g7,	%o1,	%o6
	ldd	[%l7 + 0x30],	%f28
	sub	%i7,	%o4,	%l3
	fandnot1	%f26,	%f2,	%f24
	edge32n	%g3,	%g4,	%l0
	lduh	[%l7 + 0x66],	%o0
	fabss	%f5,	%f22
	smulcc	%i5,	0x157A,	%l6
	movre	%o5,	%l1,	%o2
	orcc	%l4,	0x0DB6,	%i3
	movne	%xcc,	%l2,	%g2
	fmovdvs	%xcc,	%f10,	%f17
	smul	%i1,	0x14A8,	%o7
	movcc	%xcc,	%i2,	%g6
	fors	%f0,	%f12,	%f11
	fmovdge	%xcc,	%f5,	%f23
	and	%g5,	%g1,	%o3
	ldsh	[%l7 + 0x52],	%l5
	edge16n	%i4,	%i6,	%i0
	udiv	%o1,	0x0945,	%o6
	fxnors	%f0,	%f3,	%f2
	sir	0x1B87
	ldsh	[%l7 + 0x24],	%g7
	fmul8x16al	%f9,	%f0,	%f22
	edge32	%i7,	%l3,	%o4
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	addccc	%o0,	0x1DE0,	%g3
	andn	%l6,	%i5,	%l1
	subcc	%o5,	0x1772,	%o2
	umulcc	%i3,	%l2,	%l4
	movrgez	%g2,	%o7,	%i1
	fpadd32s	%f1,	%f0,	%f13
	ldx	[%l7 + 0x28],	%g6
	fnot1	%f20,	%f0
	fnegs	%f30,	%f12
	and	%g5,	0x1911,	%g1
	fmovrsgez	%i2,	%f15,	%f29
	fmuld8sux16	%f17,	%f13,	%f20
	movvc	%icc,	%l5,	%i4
	and	%i6,	%o3,	%o1
	stw	%o6,	[%l7 + 0x24]
	movvs	%icc,	%g7,	%i0
	subccc	%i7,	0x1A35,	%o4
	ldx	[%l7 + 0x30],	%g4
	restore %l0, 0x044D, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g3,	0x12DF,	%l3
	sub	%l6,	0x154E,	%i5
	fpack16	%f6,	%f16
	orcc	%o5,	0x0F61,	%l1
	addc	%o2,	0x0D83,	%l2
	sth	%i3,	[%l7 + 0x6A]
	add	%g2,	0x171A,	%o7
	srax	%l4,	%i1,	%g6
	fnot2	%f2,	%f24
	fornot2s	%f1,	%f29,	%f15
	sth	%g5,	[%l7 + 0x20]
	fornot2s	%f19,	%f14,	%f29
	ldsh	[%l7 + 0x36],	%i2
	orcc	%l5,	%i4,	%g1
	udivx	%o3,	0x1A02,	%i6
	fnot2	%f24,	%f30
	fmovrsgz	%o6,	%f3,	%f5
	smulcc	%o1,	0x1C96,	%i0
	fabss	%f24,	%f21
	fpsub32s	%f15,	%f24,	%f25
	movcs	%icc,	%g7,	%i7
	smul	%o4,	0x1270,	%l0
	ldsw	[%l7 + 0x5C],	%o0
	or	%g4,	0x0C41,	%l3
	nop
	set	0x6B, %g2
	ldsb	[%l7 + %g2],	%g3
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	fcmpeq16	%f22,	%f28,	%l1
	movrlez	%l2,	%i3,	%g2
	array8	%o7,	%l4,	%o2
	movpos	%xcc,	%g6,	%i1
	umulcc	%g5,	%l5,	%i4
	array16	%g1,	%i2,	%i6
	sdivcc	%o6,	0x1685,	%o1
	ldx	[%l7 + 0x38],	%i0
	addcc	%o3,	%g7,	%i7
	fmovrslz	%l0,	%f3,	%f15
	fmovrslz	%o0,	%f30,	%f29
	edge8ln	%o4,	%g4,	%g3
	ldx	[%l7 + 0x38],	%l3
	mulx	%l6,	0x1F5C,	%i5
	xnorcc	%o5,	0x0E31,	%l1
	xor	%l2,	%i3,	%o7
	andncc	%l4,	%o2,	%g6
	srl	%i1,	0x0C,	%g2
	save %l5, %g5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i4,	%i2,	%o6
	mulx	%o1,	%i6,	%o3
	fandnot1s	%f20,	%f18,	%f25
	smul	%g7,	0x0622,	%i0
	stb	%l0,	[%l7 + 0x0A]
	edge16l	%i7,	%o4,	%g4
	smul	%g3,	%l3,	%o0
	orcc	%i5,	%l6,	%l1
	ld	[%l7 + 0x58],	%f3
	fmovs	%f10,	%f1
	stw	%o5,	[%l7 + 0x5C]
	subcc	%i3,	0x0FCE,	%l2
	movpos	%xcc,	%o7,	%l4
	movneg	%icc,	%g6,	%i1
	array16	%o2,	%g2,	%g5
	sdivcc	%g1,	0x1AAB,	%l5
	fpsub16s	%f17,	%f9,	%f29
	mulx	%i4,	%i2,	%o6
	nop
	set	0x7A, %o7
	ldsh	[%l7 + %o7],	%i6
	alignaddr	%o3,	%g7,	%i0
	fmovrdlz	%l0,	%f18,	%f4
	umulcc	%i7,	%o4,	%o1
	fmovdvs	%xcc,	%f15,	%f26
	umulcc	%g4,	%g3,	%o0
	ld	[%l7 + 0x70],	%f22
	ldub	[%l7 + 0x66],	%i5
	ldd	[%l7 + 0x38],	%f18
	orn	%l3,	%l1,	%o5
	movleu	%xcc,	%l6,	%l2
	fmovrde	%i3,	%f24,	%f24
	xorcc	%l4,	0x1DD8,	%o7
	srl	%g6,	0x01,	%i1
	array16	%o2,	%g5,	%g1
	subc	%l5,	%i4,	%i2
	edge32n	%g2,	%o6,	%o3
	sllx	%g7,	%i0,	%l0
	edge8	%i6,	%o4,	%i7
	movvs	%xcc,	%g4,	%o1
	andcc	%o0,	0x15A2,	%g3
	udiv	%l3,	0x0E0F,	%i5
	mulscc	%o5,	%l6,	%l1
	fnegd	%f4,	%f2
	andn	%i3,	%l2,	%l4
	restore %g6, %i1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o2,	%g5,	%l5
	addc	%g1,	0x1E79,	%i2
	sll	%i4,	%g2,	%o6
	fandnot1s	%f24,	%f27,	%f5
	stw	%g7,	[%l7 + 0x3C]
	stx	%o3,	[%l7 + 0x40]
	edge8ln	%l0,	%i0,	%i6
	ldub	[%l7 + 0x4D],	%o4
	smulcc	%i7,	%o1,	%o0
	fpsub16	%f20,	%f30,	%f0
	mulscc	%g3,	%l3,	%g4
	subcc	%i5,	0x140D,	%o5
	ldx	[%l7 + 0x40],	%l1
	ldub	[%l7 + 0x70],	%l6
	udiv	%i3,	0x09C2,	%l2
	pdist	%f0,	%f2,	%f12
	ldub	[%l7 + 0x50],	%l4
	and	%i1,	%o7,	%o2
	fnegs	%f7,	%f4
	array8	%g6,	%l5,	%g1
	edge8	%g5,	%i4,	%g2
	movg	%xcc,	%i2,	%o6
	addcc	%g7,	0x046D,	%o3
	fcmps	%fcc0,	%f0,	%f21
	sllx	%i0,	0x17,	%i6
	subccc	%l0,	%i7,	%o4
	array8	%o0,	%g3,	%l3
	sethi	0x0B10,	%g4
	subccc	%o1,	%i5,	%o5
	movne	%xcc,	%l6,	%l1
	stb	%i3,	[%l7 + 0x69]
	movrlez	%l2,	0x36F,	%i1
	sth	%l4,	[%l7 + 0x12]
	udiv	%o2,	0x1CD1,	%g6
	fmovdneg	%icc,	%f11,	%f13
	movgu	%xcc,	%l5,	%o7
	sll	%g5,	0x02,	%g1
	movle	%xcc,	%i4,	%i2
	sub	%g2,	0x1768,	%g7
	xorcc	%o6,	0x1011,	%i0
	sethi	0x1F89,	%o3
	fnot1	%f6,	%f0
	movrne	%l0,	0x3BE,	%i6
	sdivx	%i7,	0x12D2,	%o4
	addccc	%g3,	%o0,	%g4
	sdivx	%o1,	0x1FB8,	%l3
	sra	%o5,	0x08,	%i5
	fnands	%f12,	%f1,	%f29
	fmovdgu	%icc,	%f2,	%f13
	stx	%l6,	[%l7 + 0x60]
	sir	0x0272
	xnorcc	%i3,	0x0FCC,	%l2
	movne	%icc,	%i1,	%l4
	sethi	0x157D,	%o2
	andn	%g6,	%l5,	%o7
	movn	%icc,	%g5,	%l1
	sdivx	%g1,	0x1A70,	%i4
	sllx	%g2,	%g7,	%o6
	faligndata	%f30,	%f10,	%f2
	fmovrslz	%i0,	%f31,	%f24
	ldsh	[%l7 + 0x54],	%i2
	fnot1	%f14,	%f24
	ldsh	[%l7 + 0x42],	%o3
	subc	%l0,	%i6,	%i7
	smul	%o4,	0x0420,	%g3
	ldub	[%l7 + 0x15],	%o0
	move	%icc,	%o1,	%g4
	addccc	%o5,	0x0100,	%i5
	ldd	[%l7 + 0x50],	%i6
	movcc	%icc,	%l3,	%i3
	movgu	%xcc,	%i1,	%l2
	fmovrdgz	%o2,	%f18,	%f30
	edge8n	%l4,	%g6,	%l5
	movgu	%icc,	%g5,	%o7
	std	%f24,	[%l7 + 0x20]
	movrlez	%g1,	%l1,	%g2
	xnor	%g7,	%o6,	%i4
	movl	%icc,	%i2,	%i0
	fnors	%f8,	%f26,	%f3
	movge	%icc,	%l0,	%i6
	movne	%icc,	%i7,	%o3
	fabss	%f14,	%f9
	sllx	%g3,	0x02,	%o0
	sll	%o4,	%g4,	%o1
	edge8ln	%o5,	%l6,	%i5
	umul	%l3,	%i3,	%l2
	alignaddrl	%o2,	%l4,	%i1
	movne	%xcc,	%g6,	%l5
	st	%f19,	[%l7 + 0x58]
	edge16l	%g5,	%g1,	%l1
	bshuffle	%f0,	%f20,	%f12
	xnor	%o7,	%g7,	%g2
	stb	%i4,	[%l7 + 0x2C]
	sth	%o6,	[%l7 + 0x7E]
	ldub	[%l7 + 0x59],	%i2
	udivcc	%l0,	0x04FD,	%i0
	sethi	0x0E0B,	%i7
	popc	0x1BCC,	%o3
	addccc	%g3,	0x0D06,	%o0
	fmovdne	%xcc,	%f0,	%f5
	lduh	[%l7 + 0x4E],	%o4
	or	%g4,	%o1,	%o5
	fnot2	%f6,	%f0
	stw	%l6,	[%l7 + 0x24]
	siam	0x4
	sth	%i5,	[%l7 + 0x36]
	xor	%l3,	0x0FCE,	%i6
	edge8	%i3,	%o2,	%l2
	udivx	%l4,	0x1E60,	%g6
	ldd	[%l7 + 0x50],	%i0
	lduh	[%l7 + 0x14],	%l5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3585
!	Type f   	: 5444
!	Type i   	: 15971
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xAC3FBC48
.word 0x58CF56E8
.word 0x853B836D
.word 0x4B7518A9
.word 0x3D229789
.word 0xF0130B71
.word 0x015FECE2
.word 0x58A64C42
.word 0x73E450B5
.word 0x9CBD4A0A
.word 0x360097F0
.word 0xF11487A9
.word 0x46E4EA75
.word 0xFEF7B948
.word 0xAD695731
.word 0xCCA35740
.word 0x0FE05B37
.word 0xA0AF544D
.word 0xD94C6CCE
.word 0x9F83FDD4
.word 0x430D09D3
.word 0x9E1095E2
.word 0x84D42F19
.word 0x8F494DAE
.word 0x3C1E848D
.word 0x40C462BA
.word 0x28D77684
.word 0x763AEFFA
.word 0xCAC83457
.word 0x6D60F97D
.word 0x4E44C108
.word 0x4307D47C
.word 0xA544EB82
.word 0xD93237CA
.word 0x7027C69A
.word 0xFCC6EA0B
.word 0x260E70B4
.word 0x7807362B
.word 0x2C5EBC7F
.word 0x5CB8C56C
.word 0xA8344D08
.word 0x94CBDE6D
.word 0x7F4A91CF
.word 0x70B39192
.word 0x3FB54125
.word 0x4A5E30E3
.word 0xB28176AA
.word 0x637B12E0
.word 0x5822C71D
.word 0x12E8A235
.word 0x3FAF8A1E
.word 0xDA0B35D2
.word 0x36582FFF
.word 0x706DC522
.word 0x582EB92F
.word 0x78ED842D
.word 0x520A5BA5
.word 0x211A75A2
.word 0xEC10E459
.word 0x3022ECA1
.word 0xB47831CF
.word 0x49175744
.word 0xD2A71888
.word 0x229AEADD
.end
