/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f15.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f15.s,v 1.1 2007/05/11 17:22:37 drp Exp $"
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
	setx	0x1824AC70406B3509,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0x8,	%g2
	set	0xE,	%g3
	set	0x6,	%g4
	set	0xB,	%g5
	set	0xB,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x7,	%i1
	set	-0x2,	%i2
	set	-0x9,	%i3
	set	-0xF,	%i4
	set	-0xA,	%i5
	set	-0x3,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x734A4C4A,	%l0
	set	0x0EFED19A,	%l1
	set	0x38F58CA6,	%l2
	set	0x23440AA9,	%l3
	set	0x655E60E8,	%l4
	set	0x1ECEBECA,	%l5
	set	0x5A057E76,	%l6
	!# Output registers
	set	-0x1B97,	%o0
	set	0x124D,	%o1
	set	-0x0BE5,	%o2
	set	-0x1728,	%o3
	set	-0x0635,	%o4
	set	0x00FB,	%o5
	set	0x179C,	%o6
	set	-0x07F4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xE801EF004BEBD463)
	INIT_TH_FP_REG(%l7,%f2,0xE9E29D7117528311)
	INIT_TH_FP_REG(%l7,%f4,0x7034FF688AF2A387)
	INIT_TH_FP_REG(%l7,%f6,0x6098CF523A145B95)
	INIT_TH_FP_REG(%l7,%f8,0xF9D21583C73CE40D)
	INIT_TH_FP_REG(%l7,%f10,0x787A4BC83331EDEA)
	INIT_TH_FP_REG(%l7,%f12,0x1F7F3E35EE540AB0)
	INIT_TH_FP_REG(%l7,%f14,0xE96229C680C9E562)
	INIT_TH_FP_REG(%l7,%f16,0x21CFB9B0B664F2D4)
	INIT_TH_FP_REG(%l7,%f18,0xD0EDD0F5F1B444DC)
	INIT_TH_FP_REG(%l7,%f20,0x840E0FB735178060)
	INIT_TH_FP_REG(%l7,%f22,0xA29DC4E9BB6F5553)
	INIT_TH_FP_REG(%l7,%f24,0xA307C40172CEF4BD)
	INIT_TH_FP_REG(%l7,%f26,0x97B7F6D65628AB7C)
	INIT_TH_FP_REG(%l7,%f28,0x92A1E19EE7FB1AEE)
	INIT_TH_FP_REG(%l7,%f30,0xC7A1FD1B3992C971)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x850, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movvs	%icc,	%g7,	%i5
	ldsh	[%l7 + 0x5C],	%l3
	srlx	%l5,	%i7,	%i6
	move	%xcc,	%g4,	%g1
	andncc	%l6,	%o2,	%g2
	subcc	%l0,	%o4,	%l1
	ldsw	[%l7 + 0x78],	%i3
	srlx	%g3,	%i1,	%o5
	sir	0x086E
	nop
	set	0x48, %o3
	lduh	[%l7 + %o3],	%i4
	fand	%f16,	%f6,	%f8
	lduw	[%l7 + 0x74],	%i2
	ldsh	[%l7 + 0x58],	%g5
	movleu	%xcc,	%g6,	%o1
	srlx	%l2,	0x1F,	%i0
	addcc	%o6,	0x145B,	%o7
	fmovsle	%icc,	%f25,	%f5
	fcmpgt16	%f4,	%f4,	%o3
	array16	%l4,	%g7,	%i5
	fmul8x16al	%f27,	%f22,	%f18
	sethi	0x05E5,	%l3
	mulscc	%o0,	0x1716,	%i7
	movrgz	%i6,	%l5,	%g4
	edge8ln	%g1,	%o2,	%l6
	fmovsne	%xcc,	%f1,	%f4
	save %l0, %g2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i3,	%l1,	%i1
	movle	%xcc,	%g3,	%i4
	movn	%xcc,	%i2,	%o5
	movrgz	%g5,	0x1DB,	%o1
	fcmple32	%f22,	%f8,	%l2
	ld	[%l7 + 0x14],	%f20
	sethi	0x04EF,	%i0
	smulcc	%o6,	%o7,	%g6
	fmovsvs	%xcc,	%f28,	%f26
	movle	%xcc,	%l4,	%g7
	andn	%o3,	%l3,	%o0
	array32	%i7,	%i6,	%l5
	lduw	[%l7 + 0x50],	%i5
	fzero	%f22
	sethi	0x1E7A,	%g4
	edge16	%o2,	%g1,	%l0
	ldsw	[%l7 + 0x64],	%l6
	andn	%o4,	0x0EEF,	%i3
	mulscc	%g2,	0x118C,	%l1
	xnor	%g3,	%i4,	%i2
	xorcc	%o5,	%i1,	%o1
	alignaddr	%g5,	%l2,	%i0
	movn	%icc,	%o7,	%g6
	xnor	%o6,	%l4,	%g7
	edge32l	%o3,	%o0,	%l3
	sdiv	%i6,	0x0E84,	%l5
	fsrc2s	%f31,	%f12
	add	%i5,	0x1C16,	%i7
	movre	%g4,	0x1B0,	%g1
	subcc	%o2,	%l0,	%l6
	movcc	%icc,	%i3,	%o4
	alignaddrl	%l1,	%g3,	%i4
	fpack16	%f10,	%f17
	fpadd32	%f26,	%f2,	%f0
	sdiv	%g2,	0x1F3F,	%i2
	movre	%i1,	0x2CF,	%o5
	xnorcc	%o1,	%l2,	%g5
	ld	[%l7 + 0x7C],	%f22
	fand	%f12,	%f8,	%f20
	edge32n	%i0,	%g6,	%o7
	edge32l	%l4,	%g7,	%o3
	st	%f2,	[%l7 + 0x2C]
	movge	%xcc,	%o6,	%o0
	fcmpne32	%f14,	%f4,	%i6
	edge16l	%l3,	%i5,	%i7
	edge8ln	%l5,	%g4,	%g1
	fabss	%f4,	%f31
	srl	%o2,	0x17,	%l6
	fnands	%f25,	%f31,	%f27
	movcc	%xcc,	%l0,	%o4
	udivcc	%i3,	0x0B24,	%l1
	mulscc	%i4,	%g2,	%i2
	or	%g3,	0x0B12,	%o5
	edge16ln	%o1,	%i1,	%g5
	edge8n	%l2,	%g6,	%o7
	sllx	%l4,	0x1A,	%i0
	ld	[%l7 + 0x74],	%f13
	lduh	[%l7 + 0x22],	%o3
	addccc	%g7,	0x08A7,	%o6
	subccc	%o0,	0x1D6D,	%l3
	addccc	%i5,	%i7,	%i6
	movpos	%xcc,	%g4,	%g1
	fabsd	%f18,	%f20
	fmovdcs	%icc,	%f13,	%f17
	fmovspos	%xcc,	%f3,	%f28
	sth	%l5,	[%l7 + 0x28]
	fcmpd	%fcc2,	%f20,	%f24
	add	%o2,	0x0347,	%l0
	fcmple32	%f6,	%f2,	%o4
	movgu	%icc,	%l6,	%i3
	andncc	%i4,	%l1,	%g2
	fmovsneg	%icc,	%f6,	%f14
	movle	%icc,	%i2,	%g3
	edge8ln	%o1,	%o5,	%i1
	fcmple32	%f12,	%f30,	%g5
	fmovse	%xcc,	%f2,	%f29
	edge8ln	%g6,	%l2,	%o7
	srl	%l4,	0x1C,	%o3
	fnegd	%f12,	%f24
	movrlez	%g7,	%i0,	%o6
	andcc	%o0,	%l3,	%i5
	array8	%i6,	%i7,	%g1
	fmovdne	%icc,	%f14,	%f24
	movrlez	%l5,	0x011,	%o2
	edge16l	%l0,	%o4,	%g4
	edge16	%i3,	%l6,	%l1
	array16	%i4,	%i2,	%g3
	edge32ln	%o1,	%o5,	%i1
	ldsb	[%l7 + 0x2B],	%g5
	sdivx	%g2,	0x021A,	%g6
	movrgez	%l2,	%o7,	%l4
	fmovscs	%xcc,	%f7,	%f9
	andncc	%o3,	%g7,	%o6
	sdiv	%i0,	0x113C,	%o0
	or	%i5,	0x1E20,	%l3
	fnegd	%f4,	%f18
	fnegd	%f12,	%f30
	addc	%i7,	%i6,	%l5
	udivx	%o2,	0x1B46,	%g1
	array32	%o4,	%l0,	%i3
	subccc	%g4,	0x0AE1,	%l6
	ldsw	[%l7 + 0x64],	%l1
	restore %i2, %i4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	0x157F,	%o5
	movg	%icc,	%g5,	%g2
	movrgz	%g6,	%l2,	%i1
	fcmpne16	%f14,	%f26,	%o7
	st	%f8,	[%l7 + 0x4C]
	movneg	%xcc,	%l4,	%g7
	std	%f16,	[%l7 + 0x30]
	fcmpeq32	%f6,	%f8,	%o3
	fmovdge	%xcc,	%f5,	%f1
	sra	%i0,	%o0,	%o6
	edge16ln	%l3,	%i7,	%i5
	fpadd32s	%f0,	%f14,	%f28
	ld	[%l7 + 0x34],	%f22
	udiv	%l5,	0x0244,	%i6
	fmovrde	%g1,	%f8,	%f10
	sdivcc	%o2,	0x0FDA,	%l0
	movrgez	%i3,	%o4,	%l6
	fsrc2s	%f6,	%f31
	stw	%g4,	[%l7 + 0x20]
	edge32l	%i2,	%i4,	%l1
	st	%f25,	[%l7 + 0x7C]
	movleu	%icc,	%o1,	%g3
	fandnot1	%f28,	%f12,	%f20
	umul	%g5,	0x0166,	%o5
	movneg	%icc,	%g2,	%g6
	fmovsa	%xcc,	%f15,	%f20
	movrgz	%i1,	%l2,	%l4
	std	%f22,	[%l7 + 0x20]
	fxnors	%f25,	%f10,	%f17
	movcc	%icc,	%g7,	%o3
	fxnors	%f20,	%f23,	%f18
	srlx	%i0,	%o7,	%o0
	xnorcc	%o6,	%i7,	%i5
	edge32	%l5,	%l3,	%i6
	orcc	%g1,	%l0,	%o2
	edge16ln	%o4,	%l6,	%g4
	fone	%f2
	andcc	%i3,	%i4,	%l1
	movn	%icc,	%o1,	%g3
	fmul8x16au	%f1,	%f20,	%f8
	udiv	%g5,	0x12F7,	%o5
	add	%g2,	%g6,	%i2
	mova	%icc,	%i1,	%l4
	movl	%xcc,	%l2,	%g7
	edge16	%o3,	%o7,	%o0
	sllx	%o6,	0x14,	%i7
	ld	[%l7 + 0x74],	%f14
	fmovdgu	%xcc,	%f17,	%f1
	fnot1s	%f21,	%f11
	movpos	%icc,	%i0,	%i5
	nop
	set	0x0E, %o5
	stb	%l3,	[%l7 + %o5]
	subcc	%i6,	%g1,	%l5
	fsrc2	%f6,	%f16
	addc	%o2,	%l0,	%o4
	popc	%l6,	%g4
	smul	%i3,	%l1,	%o1
	xorcc	%i4,	0x1B85,	%g5
	srl	%o5,	%g3,	%g2
	array8	%i2,	%g6,	%l4
	movvs	%icc,	%i1,	%l2
	fpadd32	%f4,	%f12,	%f0
	fornot1	%f0,	%f8,	%f6
	ldsh	[%l7 + 0x08],	%o3
	subc	%o7,	0x05C5,	%g7
	fabss	%f18,	%f5
	orncc	%o6,	0x11E6,	%i7
	fmovsgu	%xcc,	%f11,	%f21
	movge	%icc,	%o0,	%i0
	srax	%i5,	%i6,	%l3
	sth	%l5,	[%l7 + 0x32]
	fcmpne32	%f22,	%f14,	%o2
	andcc	%g1,	%l0,	%l6
	movge	%icc,	%g4,	%i3
	addccc	%l1,	0x0A9C,	%o4
	add	%i4,	0x0819,	%o1
	movcs	%xcc,	%g5,	%g3
	edge16l	%g2,	%i2,	%g6
	edge32	%o5,	%i1,	%l4
	edge32l	%l2,	%o7,	%o3
	movl	%icc,	%g7,	%o6
	movg	%icc,	%o0,	%i7
	edge8ln	%i0,	%i5,	%l3
	fornot2	%f26,	%f4,	%f22
	sdiv	%l5,	0x1603,	%o2
	fpsub16s	%f13,	%f21,	%f29
	fmovs	%f27,	%f6
	edge32l	%i6,	%l0,	%l6
	orcc	%g1,	%g4,	%l1
	movrne	%i3,	%i4,	%o4
	movrne	%g5,	%g3,	%o1
	ld	[%l7 + 0x58],	%f18
	andn	%g2,	0x14B0,	%g6
	ld	[%l7 + 0x08],	%f4
	sethi	0x0F88,	%i2
	ldsh	[%l7 + 0x14],	%o5
	fmovspos	%xcc,	%f12,	%f13
	fmovrse	%l4,	%f8,	%f25
	move	%xcc,	%i1,	%l2
	edge8l	%o3,	%g7,	%o7
	movrlz	%o0,	0x099,	%o6
	array32	%i7,	%i0,	%l3
	udiv	%l5,	0x1FD3,	%i5
	edge16l	%o2,	%i6,	%l6
	st	%f25,	[%l7 + 0x64]
	andcc	%l0,	0x18A9,	%g1
	andn	%l1,	0x1D47,	%g4
	stw	%i3,	[%l7 + 0x58]
	movge	%xcc,	%i4,	%o4
	or	%g3,	0x0333,	%g5
	edge32ln	%g2,	%g6,	%i2
	lduw	[%l7 + 0x68],	%o1
	sethi	0x08D0,	%l4
	move	%icc,	%i1,	%l2
	andn	%o3,	%o5,	%o7
	array32	%g7,	%o0,	%i7
	fmovrsgez	%o6,	%f28,	%f16
	movcc	%icc,	%l3,	%l5
	movge	%xcc,	%i5,	%i0
	movvs	%xcc,	%o2,	%i6
	fmovda	%xcc,	%f16,	%f26
	xorcc	%l0,	%l6,	%g1
	sllx	%g4,	%l1,	%i4
	fcmpgt32	%f12,	%f16,	%i3
	stx	%g3,	[%l7 + 0x50]
	stw	%o4,	[%l7 + 0x38]
	stx	%g5,	[%l7 + 0x68]
	movrgz	%g6,	0x363,	%i2
	movne	%xcc,	%o1,	%g2
	alignaddr	%l4,	%l2,	%o3
	or	%i1,	0x0E58,	%o7
	udiv	%g7,	0x05A0,	%o5
	fmovdvs	%xcc,	%f5,	%f12
	st	%f7,	[%l7 + 0x28]
	sdiv	%i7,	0x18A6,	%o6
	mova	%xcc,	%l3,	%l5
	st	%f22,	[%l7 + 0x28]
	andcc	%o0,	0x1DD8,	%i0
	edge8n	%o2,	%i5,	%i6
	addc	%l0,	0x1B2F,	%g1
	movrlz	%l6,	0x177,	%l1
	sllx	%i4,	0x15,	%g4
	edge8n	%g3,	%i3,	%g5
	fmovsleu	%icc,	%f18,	%f16
	sethi	0x17F0,	%g6
	fabss	%f13,	%f7
	movneg	%icc,	%o4,	%o1
	fpadd32s	%f29,	%f31,	%f29
	stb	%g2,	[%l7 + 0x68]
	edge32	%l4,	%i2,	%l2
	fpsub16s	%f25,	%f31,	%f20
	stb	%i1,	[%l7 + 0x4D]
	movvc	%xcc,	%o7,	%o3
	fmovdgu	%xcc,	%f10,	%f24
	sir	0x1937
	fcmpgt32	%f24,	%f26,	%o5
	xnor	%i7,	%o6,	%l3
	fsrc2	%f2,	%f30
	lduw	[%l7 + 0x30],	%l5
	fcmps	%fcc0,	%f19,	%f14
	fandnot1	%f16,	%f16,	%f12
	xor	%o0,	%i0,	%o2
	save %i5, %g7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l0,	%l6,	%l1
	addccc	%g1,	%i4,	%g3
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	smul	%g6,	0x01CF,	%o1
	sra	%g2,	0x1B,	%o4
	smul	%l4,	0x17C9,	%i2
	fmovdg	%icc,	%f30,	%f28
	xnorcc	%l2,	%o7,	%o3
	subccc	%o5,	0x0B4C,	%i7
	fmovsleu	%icc,	%f18,	%f8
	addcc	%i1,	%l3,	%o6
	orncc	%o0,	0x14A7,	%i0
	sdiv	%o2,	0x07E0,	%l5
	fors	%f19,	%f30,	%f29
	xorcc	%g7,	0x1B10,	%i6
	ldsw	[%l7 + 0x70],	%l0
	move	%icc,	%i5,	%l1
	movg	%icc,	%g1,	%i4
	andncc	%g3,	%g4,	%g5
	fpadd16s	%f5,	%f30,	%f15
	edge32l	%i3,	%l6,	%o1
	fnand	%f0,	%f16,	%f0
	udivcc	%g2,	0x1B1B,	%o4
	movneg	%icc,	%l4,	%i2
	fcmped	%fcc1,	%f12,	%f10
	edge8l	%g6,	%l2,	%o7
	fmovrse	%o5,	%f3,	%f31
	movvs	%icc,	%i7,	%i1
	mulscc	%o3,	%o6,	%o0
	movgu	%xcc,	%i0,	%l3
	movrgz	%l5,	%g7,	%i6
	fcmped	%fcc0,	%f10,	%f18
	movrgz	%l0,	%o2,	%i5
	ldsh	[%l7 + 0x26],	%l1
	fmovdpos	%xcc,	%f20,	%f0
	movvs	%icc,	%i4,	%g1
	orncc	%g4,	%g3,	%g5
	fcmpne32	%f30,	%f10,	%i3
	umulcc	%l6,	%g2,	%o4
	movvc	%icc,	%l4,	%o1
	movrgez	%i2,	0x10D,	%g6
	sethi	0x054D,	%l2
	edge8	%o5,	%o7,	%i7
	edge32n	%i1,	%o3,	%o6
	subccc	%i0,	0x0A36,	%o0
	sethi	0x081D,	%l5
	and	%l3,	0x05BB,	%g7
	movpos	%xcc,	%i6,	%l0
	mulx	%o2,	0x1A7D,	%i5
	sll	%i4,	%g1,	%l1
	fmovsgu	%xcc,	%f28,	%f26
	st	%f17,	[%l7 + 0x74]
	orcc	%g3,	0x1502,	%g5
	alignaddrl	%g4,	%l6,	%i3
	mulx	%o4,	%l4,	%o1
	sethi	0x0AE5,	%g2
	movrgez	%g6,	0x313,	%l2
	lduh	[%l7 + 0x6A],	%o5
	xor	%i2,	0x1DAD,	%i7
	movvc	%xcc,	%i1,	%o7
	umulcc	%o6,	0x1F58,	%o3
	movrlez	%o0,	0x253,	%i0
	fcmple32	%f6,	%f8,	%l5
	movle	%icc,	%l3,	%i6
	faligndata	%f30,	%f20,	%f8
	subcc	%l0,	0x1E3B,	%o2
	sll	%i5,	%i4,	%g1
	movneg	%xcc,	%g7,	%g3
	smulcc	%g5,	0x1869,	%l1
	movvs	%icc,	%l6,	%g4
	movne	%icc,	%i3,	%l4
	movvc	%icc,	%o4,	%g2
	movrlz	%o1,	0x1AF,	%l2
	mova	%xcc,	%o5,	%g6
	fand	%f0,	%f28,	%f2
	sth	%i2,	[%l7 + 0x1A]
	save %i7, 0x1E2C, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o7,	[%l7 + 0x6E]
	ld	[%l7 + 0x64],	%f9
	udivx	%o3,	0x1317,	%o6
	ld	[%l7 + 0x6C],	%f15
	ldx	[%l7 + 0x58],	%o0
	srlx	%l5,	0x1E,	%l3
	sethi	0x0BE8,	%i0
	sra	%l0,	%i6,	%o2
	st	%f6,	[%l7 + 0x68]
	ldd	[%l7 + 0x28],	%i4
	movre	%i5,	%g7,	%g3
	movneg	%icc,	%g1,	%g5
	movrgz	%l6,	%g4,	%l1
	smul	%l4,	%o4,	%g2
	udivcc	%o1,	0x12B3,	%l2
	ldsb	[%l7 + 0x1A],	%o5
	movrne	%i3,	%i2,	%g6
	alignaddrl	%i7,	%i1,	%o3
	fmovsgu	%xcc,	%f12,	%f31
	fone	%f6
	edge32l	%o7,	%o0,	%l5
	fmovrsgz	%l3,	%f3,	%f8
	mulx	%i0,	0x14E9,	%l0
	sdiv	%i6,	0x0C65,	%o2
	movre	%o6,	%i4,	%i5
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%g7
	umulcc	%g3,	%g1,	%l6
	mulx	%g4,	%g5,	%l4
	alignaddrl	%l1,	%g2,	%o1
	fmovdvs	%icc,	%f5,	%f17
	add	%l2,	0x05BA,	%o5
	edge16ln	%o4,	%i2,	%i3
	fmovdneg	%xcc,	%f31,	%f14
	fcmple32	%f2,	%f30,	%g6
	mova	%xcc,	%i1,	%o3
	ld	[%l7 + 0x70],	%f4
	movge	%icc,	%o7,	%i7
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%l5
	lduh	[%l7 + 0x1C],	%o0
	movn	%icc,	%l3,	%l0
	subcc	%i0,	%o2,	%i6
	fornot2	%f12,	%f4,	%f30
	fmovdleu	%xcc,	%f13,	%f5
	xnor	%i4,	%i5,	%g7
	pdist	%f6,	%f20,	%f0
	ldd	[%l7 + 0x08],	%f8
	ldx	[%l7 + 0x20],	%o6
	edge8n	%g3,	%l6,	%g4
	alignaddrl	%g1,	%g5,	%l1
	andcc	%g2,	%l4,	%l2
	movre	%o5,	%o1,	%o4
	fmovscs	%icc,	%f8,	%f6
	fmovrdlez	%i3,	%f18,	%f4
	udiv	%g6,	0x05E4,	%i1
	fpadd16	%f28,	%f10,	%f8
	movrlez	%o3,	%o7,	%i7
	andcc	%l5,	%o0,	%l3
	edge32n	%l0,	%i2,	%o2
	fmovs	%f18,	%f26
	stx	%i0,	[%l7 + 0x58]
	fmovrslz	%i4,	%f1,	%f1
	fnot1	%f8,	%f30
	lduw	[%l7 + 0x08],	%i6
	addcc	%i5,	%o6,	%g7
	srax	%g3,	%g4,	%g1
	movvs	%icc,	%g5,	%l6
	udivx	%g2,	0x148D,	%l4
	edge16l	%l1,	%l2,	%o5
	movle	%icc,	%o4,	%o1
	movvs	%icc,	%g6,	%i3
	fmovdneg	%xcc,	%f26,	%f30
	fnands	%f17,	%f11,	%f20
	sub	%i1,	0x0659,	%o7
	array32	%o3,	%i7,	%l5
	movrgz	%l3,	%l0,	%o0
	or	%i2,	0x0025,	%i0
	fmul8x16	%f25,	%f16,	%f6
	fmovsg	%xcc,	%f6,	%f26
	edge8n	%i4,	%i6,	%i5
	fmovdne	%xcc,	%f5,	%f30
	umul	%o6,	%o2,	%g7
	movrlz	%g4,	%g3,	%g5
	movrgez	%l6,	%g1,	%g2
	srl	%l1,	%l4,	%l2
	andncc	%o4,	%o1,	%o5
	mulx	%g6,	%i1,	%i3
	addccc	%o7,	0x1472,	%o3
	movre	%l5,	0x031,	%i7
	edge8n	%l0,	%o0,	%i2
	bshuffle	%f28,	%f22,	%f14
	and	%i0,	0x09E1,	%l3
	edge8ln	%i6,	%i5,	%i4
	addccc	%o2,	%o6,	%g4
	sir	0x0296
	lduw	[%l7 + 0x60],	%g7
	stw	%g3,	[%l7 + 0x68]
	movl	%icc,	%g5,	%g1
	fmovscs	%xcc,	%f16,	%f7
	and	%g2,	%l6,	%l4
	orncc	%l1,	%o4,	%l2
	sethi	0x08A6,	%o5
	array32	%g6,	%i1,	%i3
	fcmped	%fcc3,	%f0,	%f30
	sethi	0x10AD,	%o1
	stx	%o3,	[%l7 + 0x18]
	subcc	%o7,	0x1B90,	%l5
	movneg	%xcc,	%i7,	%l0
	ldub	[%l7 + 0x26],	%i2
	movcc	%xcc,	%i0,	%l3
	popc	0x0CBE,	%i6
	udiv	%o0,	0x12D3,	%i5
	xnorcc	%i4,	0x0283,	%o2
	fpsub32s	%f25,	%f28,	%f15
	fcmpd	%fcc2,	%f12,	%f30
	fxnor	%f24,	%f18,	%f18
	sdiv	%g4,	0x0B8B,	%g7
	movvc	%xcc,	%o6,	%g5
	fcmpgt16	%f10,	%f6,	%g1
	addc	%g3,	%l6,	%g2
	fpack16	%f20,	%f16
	and	%l4,	%o4,	%l1
	ldsb	[%l7 + 0x29],	%o5
	udivx	%l2,	0x11CD,	%i1
	fmovdleu	%xcc,	%f10,	%f22
	sir	0x1ADB
	alignaddrl	%i3,	%o1,	%g6
	fpsub16s	%f1,	%f6,	%f3
	movpos	%xcc,	%o7,	%l5
	edge16l	%i7,	%l0,	%i2
	array32	%i0,	%l3,	%o3
	movpos	%xcc,	%i6,	%i5
	and	%i4,	0x169D,	%o2
	fmovrdgz	%g4,	%f28,	%f18
	std	%f0,	[%l7 + 0x60]
	subc	%o0,	%o6,	%g7
	fpack32	%f14,	%f4,	%f12
	and	%g5,	0x0C26,	%g1
	stx	%g3,	[%l7 + 0x68]
	xor	%g2,	0x197E,	%l4
	alignaddrl	%l6,	%o4,	%l1
	alignaddr	%l2,	%o5,	%i3
	ldsh	[%l7 + 0x6A],	%i1
	fmovsne	%icc,	%f1,	%f31
	edge32l	%o1,	%g6,	%o7
	sra	%i7,	%l5,	%i2
	movl	%icc,	%l0,	%l3
	fpack16	%f4,	%f3
	fmul8x16al	%f28,	%f2,	%f14
	fnot2	%f0,	%f6
	restore %o3, %i6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	%i5,	%o2
	fmovrse	%g4,	%f31,	%f7
	std	%f14,	[%l7 + 0x40]
	movcc	%xcc,	%o0,	%o6
	movrgez	%g7,	0x1C5,	%g1
	movrgez	%g5,	%g2,	%l4
	fcmps	%fcc2,	%f8,	%f3
	fmul8x16au	%f6,	%f29,	%f10
	fcmpne32	%f0,	%f2,	%l6
	or	%g3,	%o4,	%l1
	movrlz	%o5,	0x068,	%i3
	movrlz	%l2,	0x1D7,	%o1
	mulx	%g6,	0x063E,	%o7
	ldd	[%l7 + 0x10],	%i6
	and	%l5,	%i1,	%l0
	sethi	0x1BC1,	%i2
	fmuld8ulx16	%f22,	%f0,	%f28
	nop
	set	0x0E, %l1
	ldsh	[%l7 + %l1],	%l3
	addcc	%i6,	0x0677,	%i0
	sth	%i4,	[%l7 + 0x2A]
	movgu	%xcc,	%i5,	%o3
	fpadd32s	%f5,	%f3,	%f15
	subccc	%o2,	%o0,	%o6
	fone	%f30
	fnot1s	%f16,	%f26
	smulcc	%g4,	0x07DF,	%g7
	movrlez	%g1,	%g5,	%l4
	subccc	%l6,	%g3,	%g2
	smul	%l1,	%o5,	%o4
	subcc	%l2,	0x1AF9,	%i3
	fmovsgu	%icc,	%f18,	%f0
	ldx	[%l7 + 0x20],	%o1
	add	%o7,	0x0227,	%i7
	save %l5, 0x08A5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f25,	%f10
	fone	%f26
	stx	%g6,	[%l7 + 0x18]
	movvc	%icc,	%l0,	%l3
	sub	%i6,	%i0,	%i4
	movrgz	%i2,	0x391,	%i5
	umulcc	%o3,	%o0,	%o2
	mulscc	%o6,	%g7,	%g1
	movrlz	%g4,	0x0B4,	%l4
	ldsb	[%l7 + 0x67],	%l6
	sdivcc	%g5,	0x04BE,	%g3
	movneg	%xcc,	%g2,	%o5
	mova	%xcc,	%l1,	%l2
	srax	%o4,	0x1A,	%i3
	smulcc	%o7,	0x01A5,	%i7
	movle	%xcc,	%l5,	%o1
	add	%i1,	%g6,	%l0
	udivcc	%i6,	0x1FA8,	%l3
	sdiv	%i4,	0x071F,	%i0
	srlx	%i2,	%i5,	%o0
	edge8ln	%o3,	%o2,	%g7
	sdivcc	%o6,	0x1D49,	%g1
	movrgz	%l4,	0x062,	%g4
	edge16ln	%l6,	%g5,	%g2
	umulcc	%o5,	%l1,	%g3
	and	%l2,	%i3,	%o4
	stb	%i7,	[%l7 + 0x4B]
	movrgz	%o7,	0x268,	%l5
	movrgz	%i1,	%o1,	%g6
	fnot2s	%f30,	%f21
	addcc	%i6,	%l3,	%l0
	fandnot1	%f6,	%f0,	%f26
	movrlz	%i4,	0x0D4,	%i0
	fmovdne	%xcc,	%f8,	%f25
	orncc	%i5,	0x1B90,	%i2
	xnorcc	%o3,	0x082E,	%o0
	fmul8sux16	%f10,	%f4,	%f30
	movre	%o2,	%g7,	%g1
	fmovrsgz	%l4,	%f23,	%f25
	movgu	%xcc,	%o6,	%g4
	movpos	%xcc,	%l6,	%g5
	fmovrslez	%o5,	%f16,	%f14
	fsrc2s	%f20,	%f22
	edge8ln	%l1,	%g2,	%l2
	ldd	[%l7 + 0x70],	%f8
	sethi	0x112C,	%i3
	alignaddr	%g3,	%i7,	%o7
	array8	%o4,	%l5,	%i1
	sub	%o1,	%g6,	%l3
	edge16ln	%i6,	%i4,	%i0
	fxnor	%f10,	%f28,	%f12
	sra	%l0,	%i2,	%i5
	ldsh	[%l7 + 0x08],	%o3
	movvs	%icc,	%o0,	%o2
	orcc	%g1,	%l4,	%o6
	orncc	%g7,	0x15BD,	%l6
	movrgez	%g5,	%o5,	%g4
	ldsb	[%l7 + 0x5F],	%g2
	stx	%l1,	[%l7 + 0x38]
	orn	%i3,	0x1420,	%l2
	subcc	%i7,	0x1431,	%o7
	ldx	[%l7 + 0x60],	%g3
	fmovspos	%icc,	%f30,	%f11
	edge32l	%l5,	%o4,	%o1
	fnegd	%f2,	%f16
	array16	%i1,	%l3,	%i6
	edge8l	%g6,	%i0,	%l0
	edge8l	%i4,	%i5,	%i2
	movn	%xcc,	%o0,	%o3
	movpos	%icc,	%g1,	%l4
	ldsw	[%l7 + 0x58],	%o2
	udivcc	%o6,	0x15F8,	%l6
	xnorcc	%g5,	%o5,	%g7
	fxors	%f30,	%f0,	%f21
	subccc	%g2,	0x1C8A,	%g4
	udivx	%l1,	0x078B,	%l2
	fmovse	%icc,	%f6,	%f15
	fmul8sux16	%f14,	%f14,	%f8
	fcmple32	%f14,	%f16,	%i3
	xor	%i7,	%g3,	%l5
	stx	%o7,	[%l7 + 0x60]
	edge32n	%o4,	%i1,	%l3
	xor	%o1,	%g6,	%i0
	fmovdcc	%icc,	%f22,	%f19
	fmovrsgez	%l0,	%f25,	%f24
	move	%xcc,	%i6,	%i5
	andncc	%i2,	%o0,	%o3
	ldx	[%l7 + 0x18],	%i4
	fpadd16s	%f19,	%f30,	%f4
	srlx	%l4,	%g1,	%o2
	sll	%l6,	%o6,	%g5
	lduh	[%l7 + 0x36],	%g7
	sdivcc	%o5,	0x006D,	%g2
	orcc	%g4,	0x1A33,	%l1
	movneg	%icc,	%l2,	%i3
	fnegs	%f29,	%f15
	fmovdleu	%xcc,	%f0,	%f25
	andcc	%i7,	%g3,	%o7
	array32	%o4,	%l5,	%l3
	edge8ln	%o1,	%g6,	%i1
	addccc	%l0,	%i6,	%i5
	array16	%i0,	%i2,	%o0
	edge32l	%i4,	%o3,	%g1
	fandnot2	%f16,	%f18,	%f2
	movrgz	%o2,	0x119,	%l4
	edge8l	%l6,	%o6,	%g7
	fornot1	%f12,	%f10,	%f10
	edge32l	%g5,	%g2,	%g4
	umul	%l1,	%l2,	%o5
	edge8n	%i3,	%g3,	%i7
	srlx	%o4,	0x13,	%l5
	movle	%xcc,	%l3,	%o7
	udivcc	%g6,	0x096E,	%o1
	subccc	%i1,	0x0BB3,	%i6
	movcs	%xcc,	%i5,	%i0
	movrlez	%l0,	0x2D7,	%i2
	ld	[%l7 + 0x2C],	%f30
	andcc	%o0,	%i4,	%o3
	srax	%o2,	0x07,	%g1
	movrgz	%l4,	%o6,	%l6
	popc	0x01B2,	%g7
	xnor	%g5,	0x000C,	%g4
	edge16	%l1,	%g2,	%o5
	srl	%l2,	%i3,	%g3
	sdivx	%i7,	0x1B24,	%o4
	and	%l5,	0x1ACE,	%o7
	udivx	%l3,	0x07DA,	%g6
	fcmpne16	%f12,	%f10,	%o1
	movg	%icc,	%i6,	%i5
	addc	%i0,	0x17BB,	%l0
	srl	%i1,	0x18,	%o0
	alignaddrl	%i4,	%i2,	%o2
	movg	%icc,	%g1,	%l4
	ldsw	[%l7 + 0x34],	%o3
	udivx	%o6,	0x1C1F,	%g7
	fmovscs	%xcc,	%f1,	%f10
	fmovspos	%xcc,	%f14,	%f19
	movle	%icc,	%g5,	%g4
	fmovscs	%xcc,	%f10,	%f26
	movpos	%icc,	%l6,	%l1
	xorcc	%o5,	0x0EFF,	%g2
	movpos	%xcc,	%i3,	%l2
	addc	%g3,	0x0736,	%i7
	subcc	%l5,	%o4,	%l3
	fmovsle	%icc,	%f28,	%f3
	pdist	%f6,	%f4,	%f14
	fmul8x16	%f15,	%f6,	%f6
	fpsub16	%f20,	%f24,	%f16
	sllx	%o7,	%o1,	%i6
	fcmpne32	%f30,	%f0,	%g6
	orn	%i0,	%l0,	%i1
	movrgez	%o0,	%i4,	%i5
	edge8n	%o2,	%i2,	%g1
	nop
	set	0x50, %g2
	ldsw	[%l7 + %g2],	%o3
	movgu	%icc,	%o6,	%g7
	edge8n	%l4,	%g5,	%g4
	xor	%l1,	0x17D5,	%o5
	andncc	%l6,	%i3,	%g2
	edge32ln	%l2,	%i7,	%l5
	edge8l	%g3,	%o4,	%o7
	fcmple32	%f16,	%f28,	%o1
	fnot1	%f26,	%f6
	popc	%i6,	%l3
	array8	%i0,	%l0,	%i1
	lduw	[%l7 + 0x1C],	%g6
	udivcc	%i4,	0x12E0,	%o0
	addccc	%i5,	0x11DC,	%i2
	movgu	%xcc,	%g1,	%o2
	xnor	%o6,	0x13AB,	%g7
	fnegd	%f26,	%f10
	andncc	%l4,	%g5,	%o3
	movg	%icc,	%g4,	%o5
	xnor	%l1,	%i3,	%l6
	andncc	%l2,	%g2,	%i7
	movl	%icc,	%l5,	%o4
	udivx	%g3,	0x1DB8,	%o1
	edge8ln	%o7,	%l3,	%i6
	movvc	%icc,	%i0,	%l0
	fmovdpos	%xcc,	%f27,	%f13
	movrgz	%g6,	0x038,	%i1
	ld	[%l7 + 0x68],	%f3
	edge16ln	%o0,	%i4,	%i2
	subccc	%i5,	0x0688,	%g1
	orcc	%o6,	0x0C72,	%o2
	ld	[%l7 + 0x3C],	%f27
	move	%xcc,	%g7,	%g5
	edge8ln	%l4,	%g4,	%o5
	lduw	[%l7 + 0x6C],	%o3
	fnegd	%f6,	%f16
	movl	%xcc,	%i3,	%l1
	xor	%l6,	%g2,	%i7
	smulcc	%l2,	%l5,	%o4
	movcs	%xcc,	%o1,	%o7
	fxnor	%f12,	%f6,	%f28
	edge32n	%l3,	%g3,	%i0
	sub	%i6,	0x1D0F,	%g6
	fpadd16s	%f20,	%f5,	%f28
	add	%l0,	0x1DC7,	%i1
	edge32ln	%i4,	%o0,	%i2
	sth	%g1,	[%l7 + 0x64]
	movne	%xcc,	%o6,	%o2
	fmovdneg	%icc,	%f0,	%f7
	srl	%i5,	%g5,	%l4
	movrlz	%g4,	0x19C,	%o5
	lduh	[%l7 + 0x70],	%g7
	xorcc	%o3,	%i3,	%l1
	movn	%xcc,	%g2,	%i7
	movn	%xcc,	%l2,	%l6
	fsrc2	%f28,	%f24
	edge32	%l5,	%o4,	%o7
	fmovrdgz	%o1,	%f10,	%f0
	movpos	%xcc,	%l3,	%i0
	array32	%g3,	%i6,	%g6
	edge8	%i1,	%l0,	%i4
	movg	%xcc,	%i2,	%g1
	subcc	%o6,	0x147F,	%o0
	smulcc	%i5,	%o2,	%l4
	fpmerge	%f30,	%f31,	%f26
	fmovrsgz	%g4,	%f20,	%f18
	fnot2s	%f5,	%f1
	movrlez	%g5,	0x064,	%o5
	edge8n	%o3,	%g7,	%i3
	subc	%l1,	0x17BF,	%g2
	array8	%i7,	%l6,	%l5
	edge16l	%o4,	%l2,	%o7
	ldd	[%l7 + 0x08],	%f30
	stx	%l3,	[%l7 + 0x10]
	sdivx	%i0,	0x0A9B,	%g3
	fmovsa	%xcc,	%f19,	%f17
	lduw	[%l7 + 0x40],	%i6
	movre	%g6,	%i1,	%o1
	xnorcc	%i4,	%i2,	%l0
	fpadd16s	%f28,	%f31,	%f16
	mulscc	%o6,	%g1,	%o0
	array32	%i5,	%o2,	%l4
	movrgz	%g4,	%o5,	%o3
	fmovsn	%xcc,	%f4,	%f12
	ldub	[%l7 + 0x4A],	%g5
	fmovde	%xcc,	%f22,	%f4
	smulcc	%g7,	0x1C0B,	%i3
	sllx	%g2,	0x0B,	%i7
	sdiv	%l6,	0x0299,	%l5
	pdist	%f8,	%f6,	%f18
	edge16n	%l1,	%o4,	%o7
	umulcc	%l3,	0x18DA,	%l2
	movl	%icc,	%g3,	%i0
	std	%f16,	[%l7 + 0x30]
	movvs	%xcc,	%g6,	%i1
	siam	0x4
	fmul8x16	%f28,	%f30,	%f18
	fpsub16	%f8,	%f2,	%f4
	edge32ln	%i6,	%i4,	%i2
	edge32	%o1,	%o6,	%l0
	subccc	%o0,	%i5,	%g1
	lduw	[%l7 + 0x64],	%l4
	edge16n	%o2,	%g4,	%o3
	movcs	%icc,	%o5,	%g7
	fsrc1	%f4,	%f28
	sdivx	%i3,	0x092F,	%g5
	popc	%i7,	%g2
	srax	%l6,	0x0E,	%l1
	subcc	%l5,	0x1E19,	%o4
	array32	%l3,	%l2,	%o7
	edge16ln	%g3,	%g6,	%i0
	sir	0x1C23
	movcs	%icc,	%i1,	%i6
	fnegd	%f18,	%f26
	sdivcc	%i4,	0x0065,	%o1
	movpos	%xcc,	%o6,	%i2
	fmovdge	%xcc,	%f2,	%f29
	movne	%xcc,	%l0,	%i5
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%g1
	edge32ln	%o0,	%o2,	%g4
	movgu	%xcc,	%l4,	%o5
	fmovrdlez	%g7,	%f24,	%f12
	stw	%o3,	[%l7 + 0x78]
	edge8l	%i3,	%g5,	%i7
	fmovrsne	%l6,	%f5,	%f26
	addc	%l1,	%g2,	%o4
	sth	%l3,	[%l7 + 0x50]
	movrne	%l5,	%l2,	%o7
	movrgz	%g3,	%i0,	%g6
	fmovrslez	%i6,	%f30,	%f28
	umul	%i1,	%i4,	%o1
	edge32	%i2,	%l0,	%o6
	fmovrdlz	%g1,	%f4,	%f12
	fmul8x16al	%f11,	%f1,	%f18
	fmovrse	%i5,	%f13,	%f15
	movrgez	%o2,	%g4,	%o0
	edge8n	%o5,	%l4,	%g7
	movvs	%xcc,	%o3,	%g5
	alignaddrl	%i3,	%l6,	%i7
	edge8n	%g2,	%o4,	%l3
	sub	%l1,	%l5,	%l2
	orcc	%o7,	0x1A52,	%g3
	fmovrdlz	%i0,	%f14,	%f4
	stb	%i6,	[%l7 + 0x67]
	smul	%g6,	%i1,	%o1
	smulcc	%i2,	0x0C85,	%l0
	xorcc	%o6,	%i4,	%i5
	udiv	%o2,	0x12D6,	%g4
	stb	%g1,	[%l7 + 0x5F]
	ldsh	[%l7 + 0x46],	%o5
	umulcc	%l4,	%g7,	%o3
	xnorcc	%o0,	%i3,	%l6
	fmovdpos	%xcc,	%f19,	%f16
	fmovdn	%icc,	%f31,	%f25
	ldd	[%l7 + 0x30],	%f22
	faligndata	%f4,	%f28,	%f10
	orn	%g5,	0x0BA4,	%g2
	udivx	%o4,	0x1722,	%l3
	sllx	%i7,	%l1,	%l2
	fcmpd	%fcc0,	%f30,	%f14
	fands	%f15,	%f18,	%f14
	mova	%xcc,	%l5,	%g3
	addccc	%i0,	%i6,	%o7
	addc	%i1,	%o1,	%i2
	srlx	%l0,	%o6,	%g6
	movrlz	%i4,	%i5,	%g4
	movle	%xcc,	%o2,	%o5
	move	%xcc,	%g1,	%l4
	movrlz	%o3,	%g7,	%i3
	fpsub32	%f28,	%f8,	%f4
	fmovdne	%icc,	%f7,	%f31
	edge8l	%o0,	%l6,	%g2
	mulx	%o4,	%l3,	%i7
	orncc	%l1,	%g5,	%l5
	movvs	%icc,	%l2,	%g3
	sth	%i0,	[%l7 + 0x4E]
	ldsh	[%l7 + 0x5C],	%o7
	udivcc	%i1,	0x16A5,	%i6
	fxnors	%f13,	%f29,	%f19
	addc	%o1,	%l0,	%o6
	movcc	%xcc,	%g6,	%i2
	movle	%xcc,	%i5,	%i4
	movl	%xcc,	%g4,	%o5
	fmul8x16au	%f28,	%f29,	%f18
	movn	%xcc,	%g1,	%o2
	and	%l4,	%o3,	%i3
	alignaddrl	%g7,	%l6,	%g2
	sll	%o0,	0x17,	%l3
	addcc	%o4,	0x0491,	%l1
	movvc	%icc,	%i7,	%g5
	alignaddr	%l5,	%l2,	%g3
	fpadd16s	%f16,	%f28,	%f3
	fmovdcc	%icc,	%f21,	%f6
	siam	0x5
	fandnot2s	%f14,	%f2,	%f14
	movrne	%i0,	%i1,	%i6
	edge16n	%o7,	%l0,	%o1
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%g6
	edge32ln	%o6,	%i5,	%i2
	std	%f28,	[%l7 + 0x28]
	mova	%icc,	%g4,	%o5
	fmovsneg	%xcc,	%f28,	%f29
	xnor	%i4,	0x024D,	%g1
	movrlez	%l4,	%o3,	%o2
	movcs	%icc,	%i3,	%l6
	subccc	%g2,	0x0C1A,	%o0
	faligndata	%f14,	%f6,	%f4
	edge8ln	%g7,	%l3,	%l1
	fmovsgu	%icc,	%f19,	%f29
	ldsw	[%l7 + 0x10],	%o4
	edge16n	%i7,	%g5,	%l2
	edge16n	%g3,	%i0,	%l5
	fcmpes	%fcc0,	%f25,	%f23
	subc	%i6,	%o7,	%l0
	sth	%o1,	[%l7 + 0x36]
	movne	%icc,	%g6,	%o6
	fmovdcs	%icc,	%f22,	%f13
	fzero	%f16
	and	%i5,	0x0F56,	%i1
	fmovdg	%icc,	%f0,	%f15
	sdivx	%i2,	0x18EF,	%g4
	udivx	%o5,	0x0C77,	%g1
	fmovsa	%xcc,	%f15,	%f30
	smulcc	%l4,	%i4,	%o2
	movneg	%xcc,	%o3,	%l6
	ldd	[%l7 + 0x48],	%f4
	movrgez	%g2,	%i3,	%g7
	subcc	%o0,	%l1,	%l3
	movge	%icc,	%i7,	%g5
	movvc	%xcc,	%l2,	%o4
	nop
	set	0x18, %l2
	std	%f2,	[%l7 + %l2]
	xnor	%g3,	0x0216,	%l5
	movrgez	%i6,	%i0,	%o7
	smulcc	%o1,	0x07BD,	%g6
	umulcc	%o6,	0x02E9,	%i5
	subccc	%i1,	%l0,	%i2
	udivcc	%g4,	0x1936,	%g1
	sir	0x0AC2
	lduh	[%l7 + 0x76],	%l4
	ldub	[%l7 + 0x4B],	%i4
	nop
	set	0x32, %g7
	ldsh	[%l7 + %g7],	%o2
	sdiv	%o3,	0x00DE,	%o5
	movleu	%icc,	%g2,	%i3
	fmovdle	%icc,	%f19,	%f28
	movge	%xcc,	%g7,	%o0
	fmovrslz	%l1,	%f19,	%f13
	sub	%l3,	0x1D31,	%l6
	orn	%i7,	0x0FD9,	%g5
	fabsd	%f22,	%f6
	edge32l	%l2,	%o4,	%g3
	movre	%l5,	0x330,	%i6
	xnor	%o7,	0x1362,	%i0
	sll	%o1,	0x0F,	%g6
	edge8	%o6,	%i5,	%i1
	fnot1	%f6,	%f20
	sir	0x1073
	andn	%i2,	0x0CF7,	%l0
	stx	%g4,	[%l7 + 0x68]
	sllx	%g1,	%l4,	%o2
	movleu	%xcc,	%o3,	%i4
	ldsb	[%l7 + 0x46],	%o5
	movle	%icc,	%g2,	%i3
	fmovrsgez	%o0,	%f20,	%f3
	fmovrdgez	%g7,	%f28,	%f30
	orn	%l3,	%l1,	%l6
	fxnor	%f26,	%f0,	%f16
	movrlz	%i7,	%g5,	%l2
	fmovrdne	%o4,	%f30,	%f16
	movrgz	%l5,	0x2FE,	%g3
	edge32	%i6,	%o7,	%i0
	fmovsge	%icc,	%f6,	%f18
	movle	%icc,	%o1,	%o6
	st	%f12,	[%l7 + 0x2C]
	stw	%i5,	[%l7 + 0x58]
	sdivx	%i1,	0x09B4,	%g6
	fpsub16	%f14,	%f24,	%f30
	fmovrdlz	%i2,	%f12,	%f0
	stx	%g4,	[%l7 + 0x58]
	sllx	%l0,	%l4,	%o2
	fcmpeq32	%f6,	%f16,	%g1
	faligndata	%f14,	%f8,	%f2
	sra	%i4,	0x1C,	%o5
	popc	0x078D,	%g2
	fmovspos	%xcc,	%f26,	%f29
	fmovsa	%icc,	%f16,	%f3
	edge32	%i3,	%o0,	%g7
	fmovrdlz	%o3,	%f0,	%f10
	alignaddrl	%l3,	%l6,	%i7
	add	%g5,	0x064B,	%l1
	sub	%o4,	%l2,	%l5
	edge8n	%g3,	%i6,	%o7
	movle	%icc,	%i0,	%o6
	alignaddr	%o1,	%i5,	%i1
	ldsw	[%l7 + 0x1C],	%g6
	movne	%xcc,	%g4,	%l0
	movvs	%icc,	%l4,	%o2
	ldx	[%l7 + 0x08],	%i2
	fmovda	%xcc,	%f29,	%f24
	smul	%i4,	%g1,	%o5
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%g2
	edge32l	%i3,	%o0,	%o3
	edge32l	%l3,	%l6,	%i7
	stw	%g7,	[%l7 + 0x6C]
	addcc	%g5,	0x094C,	%o4
	lduw	[%l7 + 0x14],	%l2
	save %l5, %l1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o7,	%i0,	%o6
	movrgz	%g3,	%i5,	%o1
	xnorcc	%i1,	0x18B4,	%g6
	subccc	%g4,	0x1485,	%l4
	fsrc1s	%f19,	%f0
	fnegd	%f10,	%f28
	ldsw	[%l7 + 0x0C],	%l0
	movge	%icc,	%i2,	%i4
	xorcc	%o2,	%g1,	%o5
	movne	%xcc,	%i3,	%o0
	orcc	%g2,	%o3,	%l3
	stx	%l6,	[%l7 + 0x48]
	fmovrde	%g7,	%f14,	%f0
	movre	%g5,	%o4,	%l2
	sllx	%l5,	%l1,	%i6
	ldsw	[%l7 + 0x14],	%i7
	edge32ln	%i0,	%o7,	%g3
	orn	%o6,	%o1,	%i1
	sll	%i5,	0x0D,	%g6
	movleu	%xcc,	%g4,	%l0
	fmovsge	%xcc,	%f17,	%f12
	andcc	%l4,	0x1277,	%i2
	movn	%icc,	%i4,	%o2
	array8	%g1,	%o5,	%i3
	sdiv	%o0,	0x0D8C,	%o3
	fnegs	%f16,	%f5
	sth	%l3,	[%l7 + 0x62]
	movre	%l6,	0x284,	%g2
	edge16	%g5,	%o4,	%g7
	xor	%l5,	0x0379,	%l1
	umulcc	%i6,	0x0E61,	%l2
	sllx	%i0,	0x02,	%i7
	srlx	%o7,	0x11,	%g3
	movvc	%icc,	%o6,	%o1
	fmovscc	%xcc,	%f7,	%f14
	sdivx	%i5,	0x0871,	%i1
	smulcc	%g6,	0x17BE,	%g4
	xnorcc	%l0,	0x0012,	%i2
	edge8l	%i4,	%l4,	%g1
	movpos	%xcc,	%o2,	%o5
	movre	%i3,	%o0,	%o3
	ldx	[%l7 + 0x70],	%l3
	fabss	%f29,	%f1
	ldsh	[%l7 + 0x3C],	%g2
	movvs	%xcc,	%l6,	%g5
	and	%o4,	%g7,	%l5
	edge16n	%l1,	%l2,	%i6
	movrgez	%i0,	0x39A,	%o7
	std	%f22,	[%l7 + 0x38]
	fpadd32s	%f20,	%f30,	%f0
	edge32	%i7,	%o6,	%o1
	andcc	%g3,	0x06F5,	%i5
	movvs	%xcc,	%i1,	%g6
	lduh	[%l7 + 0x62],	%g4
	popc	0x183F,	%l0
	orncc	%i2,	%l4,	%g1
	addccc	%i4,	0x0AB6,	%o2
	movcc	%icc,	%i3,	%o0
	subccc	%o3,	%o5,	%g2
	stb	%l3,	[%l7 + 0x32]
	fmovrdlz	%l6,	%f2,	%f8
	fcmple16	%f10,	%f6,	%o4
	orn	%g5,	%g7,	%l1
	edge32l	%l2,	%l5,	%i0
	fandnot1	%f30,	%f18,	%f0
	xnor	%i6,	0x085C,	%o7
	xnorcc	%o6,	%o1,	%g3
	sra	%i7,	0x1E,	%i5
	edge32n	%g6,	%g4,	%i1
	movrne	%l0,	%l4,	%g1
	nop
	set	0x78, %i6
	stw	%i2,	[%l7 + %i6]
	and	%i4,	%o2,	%o0
	movleu	%xcc,	%i3,	%o3
	sllx	%o5,	%g2,	%l6
	sdiv	%l3,	0x01C9,	%g5
	ld	[%l7 + 0x60],	%f13
	edge16n	%o4,	%g7,	%l1
	udivx	%l2,	0x1DD3,	%i0
	fsrc1s	%f25,	%f7
	edge16	%l5,	%o7,	%i6
	movpos	%icc,	%o1,	%g3
	movrlez	%o6,	%i7,	%i5
	fmul8x16al	%f21,	%f24,	%f20
	edge16	%g4,	%g6,	%i1
	addcc	%l4,	0x1885,	%l0
	movcs	%xcc,	%g1,	%i4
	fornot2	%f18,	%f0,	%f12
	fzero	%f26
	edge32l	%i2,	%o2,	%o0
	subcc	%i3,	0x13EE,	%o3
	fexpand	%f12,	%f8
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	or	%g5,	0x0961,	%o4
	popc	%l6,	%l1
	stw	%g7,	[%l7 + 0x38]
	umul	%i0,	%l2,	%l5
	fandnot2	%f10,	%f0,	%f2
	popc	0x08C6,	%i6
	udiv	%o1,	0x0306,	%g3
	movrne	%o7,	%o6,	%i7
	ldsh	[%l7 + 0x40],	%g4
	edge32ln	%g6,	%i1,	%l4
	fnor	%f20,	%f14,	%f10
	movrlez	%i5,	%l0,	%i4
	lduw	[%l7 + 0x74],	%g1
	fmovrsgez	%o2,	%f4,	%f14
	restore %i2, 0x060A, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o0,	0x0C1F,	%o3
	edge32ln	%g2,	%l3,	%g5
	andn	%o4,	%o5,	%l1
	edge16n	%l6,	%g7,	%l2
	fors	%f25,	%f4,	%f19
	edge8n	%l5,	%i6,	%o1
	ldub	[%l7 + 0x78],	%g3
	stw	%i0,	[%l7 + 0x74]
	or	%o7,	%i7,	%o6
	fnand	%f14,	%f4,	%f28
	movne	%xcc,	%g6,	%g4
	fcmpne16	%f30,	%f20,	%i1
	ldx	[%l7 + 0x70],	%i5
	udiv	%l0,	0x03C7,	%l4
	movg	%icc,	%g1,	%i4
	edge8n	%i2,	%i3,	%o2
	sdivcc	%o0,	0x091C,	%o3
	movl	%xcc,	%g2,	%g5
	srax	%l3,	%o4,	%l1
	edge8l	%l6,	%g7,	%o5
	fzeros	%f22
	movn	%xcc,	%l5,	%l2
	fandnot2s	%f19,	%f18,	%f16
	faligndata	%f24,	%f30,	%f10
	edge32l	%i6,	%o1,	%i0
	siam	0x6
	movneg	%xcc,	%g3,	%i7
	stx	%o6,	[%l7 + 0x50]
	subccc	%o7,	0x0E2A,	%g4
	nop
	set	0x3C, %i4
	stb	%i1,	[%l7 + %i4]
	edge16	%i5,	%l0,	%g6
	movle	%icc,	%l4,	%i4
	fone	%f14
	sir	0x01D4
	add	%g1,	0x09F6,	%i3
	movge	%xcc,	%i2,	%o2
	fpack32	%f10,	%f8,	%f4
	andcc	%o3,	%o0,	%g2
	edge8	%l3,	%o4,	%g5
	srax	%l6,	%l1,	%o5
	sth	%g7,	[%l7 + 0x62]
	fmovrdgz	%l5,	%f28,	%f8
	srl	%l2,	%i6,	%o1
	andncc	%i0,	%g3,	%o6
	and	%o7,	%i7,	%i1
	fcmpne32	%f30,	%f4,	%g4
	movg	%icc,	%i5,	%g6
	fmul8x16al	%f3,	%f18,	%f28
	fabss	%f20,	%f5
	xorcc	%l4,	%i4,	%g1
	save %l0, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f22,	%f20,	%f26
	alignaddr	%o3,	%o2,	%g2
	fzero	%f22
	edge8ln	%o0,	%l3,	%o4
	mulscc	%g5,	0x1948,	%l1
	orn	%l6,	0x0F45,	%o5
	edge8	%l5,	%l2,	%g7
	fzeros	%f26
	save %o1, 0x0281, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f10,	%f2,	%f2
	addccc	%i0,	%g3,	%o6
	faligndata	%f8,	%f8,	%f8
	movrgz	%i7,	%o7,	%i1
	movrne	%g4,	%i5,	%g6
	ldub	[%l7 + 0x6F],	%i4
	umulcc	%g1,	0x0986,	%l4
	xorcc	%i2,	0x08C4,	%i3
	stx	%l0,	[%l7 + 0x18]
	sllx	%o2,	0x19,	%g2
	subc	%o3,	0x18FE,	%l3
	edge8l	%o0,	%g5,	%l1
	edge32ln	%o4,	%o5,	%l6
	bshuffle	%f18,	%f16,	%f2
	fnands	%f27,	%f11,	%f12
	edge8	%l2,	%g7,	%o1
	movpos	%xcc,	%i6,	%i0
	srlx	%g3,	0x00,	%o6
	and	%l5,	%o7,	%i7
	move	%xcc,	%g4,	%i5
	pdist	%f18,	%f20,	%f6
	sub	%i1,	0x1852,	%i4
	movge	%xcc,	%g6,	%l4
	edge8l	%i2,	%i3,	%g1
	orcc	%l0,	0x0BCF,	%g2
	movneg	%icc,	%o2,	%o3
	movrne	%o0,	%l3,	%g5
	ldsw	[%l7 + 0x24],	%l1
	st	%f16,	[%l7 + 0x30]
	stw	%o4,	[%l7 + 0x6C]
	mulx	%l6,	%l2,	%o5
	movpos	%icc,	%g7,	%o1
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	movrlz	%g3,	0x0AE,	%l5
	lduw	[%l7 + 0x2C],	%o7
	edge8	%i7,	%g4,	%i5
	srax	%o6,	%i1,	%i4
	sdivcc	%g6,	0x10ED,	%l4
	edge16l	%i2,	%i3,	%g1
	edge16l	%g2,	%o2,	%l0
	udivcc	%o3,	0x1131,	%o0
	fcmpne32	%f26,	%f2,	%l3
	orncc	%g5,	0x059B,	%o4
	fmovsvs	%xcc,	%f7,	%f15
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%l6
	ldx	[%l7 + 0x38],	%l1
	edge32n	%l2,	%g7,	%o1
	sdiv	%o5,	0x1D6C,	%i6
	fmovdl	%xcc,	%f10,	%f25
	alignaddrl	%i0,	%g3,	%o7
	fmovrdlez	%i7,	%f8,	%f12
	sdivx	%l5,	0x14A2,	%g4
	sllx	%i5,	%o6,	%i1
	ldsh	[%l7 + 0x64],	%g6
	array8	%l4,	%i4,	%i2
	fmovspos	%icc,	%f3,	%f18
	umulcc	%g1,	0x1521,	%i3
	bshuffle	%f22,	%f18,	%f20
	sdivcc	%g2,	0x0A2D,	%l0
	edge32	%o3,	%o0,	%l3
	subcc	%o2,	0x1AC4,	%g5
	array8	%l6,	%l1,	%l2
	fmovspos	%icc,	%f16,	%f17
	edge16ln	%g7,	%o4,	%o1
	addcc	%i6,	0x0606,	%i0
	fmovsg	%icc,	%f1,	%f21
	movge	%icc,	%o5,	%g3
	sub	%i7,	0x046D,	%l5
	lduh	[%l7 + 0x58],	%o7
	fmovrse	%i5,	%f18,	%f20
	addccc	%o6,	0x0A1D,	%i1
	stx	%g6,	[%l7 + 0x60]
	xor	%g4,	%l4,	%i2
	udiv	%g1,	0x010F,	%i3
	fmovse	%icc,	%f27,	%f27
	edge32l	%g2,	%l0,	%i4
	andn	%o0,	%l3,	%o3
	array8	%g5,	%l6,	%l1
	udivx	%o2,	0x0CDB,	%l2
	movre	%o4,	%o1,	%i6
	movcc	%xcc,	%g7,	%i0
	xnorcc	%o5,	%i7,	%g3
	udivcc	%l5,	0x0FC9,	%o7
	srlx	%i5,	%o6,	%g6
	orncc	%g4,	%i1,	%l4
	fexpand	%f26,	%f28
	movge	%xcc,	%i2,	%g1
	sdivx	%g2,	0x08EA,	%i3
	stb	%l0,	[%l7 + 0x7B]
	sllx	%i4,	0x1A,	%o0
	movrlez	%l3,	0x3B2,	%o3
	mova	%icc,	%l6,	%l1
	xor	%g5,	0x0A72,	%o2
	ld	[%l7 + 0x20],	%f22
	stx	%l2,	[%l7 + 0x30]
	add	%o4,	%i6,	%g7
	edge8l	%i0,	%o5,	%i7
	movrgz	%o1,	%l5,	%o7
	andn	%g3,	0x1877,	%i5
	fmovrdlz	%o6,	%f24,	%f16
	movl	%xcc,	%g6,	%i1
	stb	%g4,	[%l7 + 0x5B]
	sth	%i2,	[%l7 + 0x3A]
	fcmpne16	%f6,	%f22,	%l4
	array8	%g2,	%g1,	%i3
	edge8l	%l0,	%o0,	%l3
	fmovscs	%icc,	%f27,	%f8
	fmul8ulx16	%f24,	%f20,	%f12
	sdivx	%o3,	0x1C82,	%l6
	fandnot2s	%f12,	%f3,	%f10
	fmovsge	%icc,	%f22,	%f2
	stw	%i4,	[%l7 + 0x68]
	movcs	%xcc,	%l1,	%g5
	movrlz	%l2,	%o4,	%o2
	mova	%icc,	%i6,	%g7
	std	%f10,	[%l7 + 0x78]
	orncc	%o5,	0x1382,	%i7
	ldub	[%l7 + 0x47],	%i0
	srlx	%o1,	%o7,	%l5
	popc	%i5,	%o6
	umulcc	%g6,	0x1981,	%i1
	movvc	%xcc,	%g3,	%g4
	sub	%l4,	0x0BE9,	%g2
	sdivx	%g1,	0x1DC7,	%i2
	xor	%i3,	0x0429,	%o0
	edge32	%l3,	%l0,	%l6
	edge8l	%o3,	%i4,	%g5
	add	%l1,	%o4,	%o2
	ldd	[%l7 + 0x78],	%i6
	fsrc1s	%f15,	%f4
	fmovrdne	%g7,	%f0,	%f24
	addc	%l2,	0x0915,	%i7
	edge32l	%i0,	%o1,	%o7
	or	%l5,	0x0CAB,	%i5
	xnor	%o5,	%g6,	%i1
	alignaddrl	%o6,	%g3,	%g4
	ldub	[%l7 + 0x61],	%l4
	edge16n	%g1,	%g2,	%i3
	ldd	[%l7 + 0x60],	%f4
	fmul8x16au	%f29,	%f17,	%f10
	fmovsg	%xcc,	%f8,	%f8
	array16	%o0,	%l3,	%i2
	save %l0, 0x16AF, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o3,	%f26,	%f12
	fmovdne	%xcc,	%f9,	%f6
	sdivx	%g5,	0x1490,	%i4
	std	%f30,	[%l7 + 0x48]
	sir	0x01D4
	movcs	%xcc,	%l1,	%o2
	edge8l	%o4,	%g7,	%l2
	subcc	%i7,	%i0,	%o1
	fmul8sux16	%f14,	%f22,	%f12
	fmovrse	%o7,	%f31,	%f27
	ld	[%l7 + 0x2C],	%f4
	and	%l5,	0x062D,	%i6
	xnorcc	%o5,	%g6,	%i1
	andcc	%o6,	%i5,	%g4
	fmovspos	%xcc,	%f27,	%f31
	srl	%l4,	%g3,	%g2
	edge16	%i3,	%g1,	%o0
	mulx	%i2,	0x0B46,	%l0
	udivx	%l6,	0x10B6,	%o3
	addcc	%l3,	%i4,	%l1
	xnor	%g5,	%o2,	%g7
	sub	%o4,	%i7,	%l2
	xorcc	%o1,	%o7,	%l5
	sir	0x1313
	orncc	%i0,	0x1325,	%o5
	movrne	%g6,	%i6,	%i1
	stx	%o6,	[%l7 + 0x48]
	smulcc	%g4,	%l4,	%i5
	fpsub16s	%f29,	%f23,	%f16
	andncc	%g3,	%g2,	%g1
	movg	%icc,	%i3,	%i2
	array16	%o0,	%l6,	%l0
	sll	%o3,	%l3,	%i4
	edge32	%l1,	%o2,	%g7
	array8	%o4,	%i7,	%g5
	udivcc	%o1,	0x17E7,	%l2
	array8	%l5,	%i0,	%o7
	edge8	%o5,	%i6,	%i1
	fnot2	%f8,	%f24
	edge8n	%o6,	%g6,	%g4
	fmovsn	%icc,	%f9,	%f11
	movcc	%xcc,	%i5,	%l4
	add	%g3,	%g2,	%i3
	restore %i2, 0x1FCB, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g1,	0x083E,	%l6
	ldsw	[%l7 + 0x40],	%o3
	udivcc	%l0,	0x1E10,	%i4
	movgu	%icc,	%l1,	%l3
	movvc	%icc,	%g7,	%o4
	fors	%f31,	%f17,	%f22
	siam	0x0
	edge32ln	%i7,	%o2,	%g5
	st	%f9,	[%l7 + 0x28]
	movvc	%icc,	%o1,	%l2
	fmovrslez	%l5,	%f21,	%f27
	udivcc	%i0,	0x02B9,	%o7
	umulcc	%o5,	0x0246,	%i1
	array16	%i6,	%g6,	%g4
	movpos	%icc,	%i5,	%l4
	edge32	%o6,	%g2,	%g3
	ldsw	[%l7 + 0x10],	%i2
	fors	%f7,	%f18,	%f6
	edge8	%i3,	%o0,	%l6
	movl	%icc,	%o3,	%g1
	sdivx	%l0,	0x0FDD,	%i4
	fmovrse	%l3,	%f9,	%f0
	movvs	%icc,	%g7,	%l1
	fnot2s	%f13,	%f8
	lduh	[%l7 + 0x74],	%i7
	fand	%f8,	%f8,	%f8
	sir	0x04B8
	edge8l	%o2,	%o4,	%o1
	movcc	%icc,	%g5,	%l2
	ldsw	[%l7 + 0x08],	%l5
	smulcc	%o7,	0x0E3C,	%i0
	sethi	0x1537,	%o5
	ldsb	[%l7 + 0x7E],	%i1
	edge8	%g6,	%i6,	%i5
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%g4
	edge16l	%l4,	%g2,	%g3
	sdiv	%i2,	0x1212,	%o6
	movrlz	%o0,	0x0A6,	%i3
	array16	%l6,	%g1,	%l0
	move	%xcc,	%i4,	%o3
	ldsw	[%l7 + 0x5C],	%l3
	movrne	%g7,	0x1C2,	%l1
	ld	[%l7 + 0x6C],	%f0
	fnegs	%f27,	%f11
	fcmpes	%fcc2,	%f2,	%f7
	movn	%icc,	%i7,	%o4
	udivcc	%o1,	0x13EC,	%g5
	edge8n	%l2,	%l5,	%o7
	mova	%xcc,	%i0,	%o5
	movre	%i1,	0x2EC,	%o2
	fandnot1	%f2,	%f14,	%f26
	add	%g6,	0x09B0,	%i6
	movrgez	%g4,	%l4,	%g2
	mulx	%i5,	0x0804,	%g3
	sra	%i2,	%o6,	%i3
	movg	%xcc,	%o0,	%l6
	movrlez	%g1,	0x292,	%i4
	orcc	%o3,	%l0,	%g7
	orcc	%l1,	0x08CF,	%i7
	movne	%icc,	%o4,	%o1
	xorcc	%g5,	%l3,	%l5
	fmovrsgz	%o7,	%f7,	%f21
	movrgz	%l2,	0x122,	%o5
	udivcc	%i0,	0x0BC3,	%i1
	movvs	%xcc,	%o2,	%g6
	fpsub32	%f16,	%f2,	%f14
	ld	[%l7 + 0x40],	%f28
	srlx	%i6,	0x0C,	%g4
	edge16l	%g2,	%l4,	%g3
	ldx	[%l7 + 0x28],	%i2
	edge16l	%o6,	%i3,	%i5
	mulx	%l6,	%o0,	%i4
	movrgz	%g1,	%o3,	%l0
	smul	%g7,	%i7,	%l1
	ldd	[%l7 + 0x20],	%f12
	siam	0x7
	movrgez	%o4,	0x0F5,	%o1
	ldub	[%l7 + 0x7F],	%l3
	edge8ln	%g5,	%o7,	%l2
	orcc	%o5,	%l5,	%i1
	alignaddrl	%i0,	%g6,	%o2
	ld	[%l7 + 0x08],	%f12
	ldsh	[%l7 + 0x66],	%i6
	movneg	%xcc,	%g4,	%g2
	array8	%l4,	%g3,	%o6
	movvs	%xcc,	%i3,	%i2
	sll	%i5,	%l6,	%o0
	movvc	%icc,	%i4,	%o3
	st	%f14,	[%l7 + 0x10]
	movvc	%xcc,	%g1,	%l0
	fmovrdgz	%i7,	%f14,	%f20
	sdiv	%g7,	0x10D6,	%l1
	andcc	%o4,	0x0334,	%o1
	fmul8x16al	%f22,	%f1,	%f10
	ldub	[%l7 + 0x0A],	%g5
	movrne	%o7,	%l2,	%o5
	sethi	0x1CA0,	%l3
	ld	[%l7 + 0x34],	%f4
	edge32n	%l5,	%i1,	%g6
	subcc	%o2,	0x054B,	%i0
	movleu	%icc,	%g4,	%g2
	ldsb	[%l7 + 0x52],	%l4
	movvs	%xcc,	%i6,	%g3
	fmovdneg	%xcc,	%f4,	%f8
	edge8n	%o6,	%i2,	%i5
	subc	%l6,	%o0,	%i3
	srl	%i4,	0x18,	%g1
	edge8ln	%l0,	%o3,	%i7
	save %l1, %o4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f0,	%f8
	orncc	%g5,	0x1869,	%g7
	st	%f26,	[%l7 + 0x44]
	movle	%xcc,	%l2,	%o7
	fcmple16	%f0,	%f12,	%o5
	movg	%icc,	%l3,	%l5
	array32	%i1,	%o2,	%i0
	nop
	set	0x66, %l5
	stb	%g4,	[%l7 + %l5]
	fmovscs	%xcc,	%f22,	%f12
	edge8l	%g2,	%g6,	%l4
	udivx	%i6,	0x1696,	%o6
	addc	%i2,	0x07E9,	%g3
	addcc	%l6,	%o0,	%i5
	fxor	%f26,	%f10,	%f14
	movvc	%icc,	%i4,	%g1
	fpsub16	%f0,	%f10,	%f14
	movneg	%icc,	%l0,	%o3
	umulcc	%i7,	%i3,	%l1
	fzero	%f18
	edge16n	%o1,	%g5,	%g7
	xnorcc	%l2,	0x03A9,	%o7
	movrlz	%o5,	0x367,	%l3
	smulcc	%l5,	%i1,	%o4
	array32	%o2,	%i0,	%g4
	fcmps	%fcc3,	%f26,	%f4
	fmovdge	%xcc,	%f23,	%f1
	movne	%icc,	%g6,	%l4
	umulcc	%g2,	0x0D3C,	%o6
	movl	%xcc,	%i2,	%i6
	smulcc	%l6,	%g3,	%o0
	xnor	%i4,	%g1,	%i5
	orncc	%l0,	0x02F4,	%o3
	movle	%icc,	%i3,	%l1
	array32	%o1,	%g5,	%g7
	save %i7, 0x1296, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o5,	%l3,	%l2
	sllx	%l5,	0x04,	%o4
	srl	%i1,	%o2,	%i0
	movg	%icc,	%g6,	%g4
	fcmped	%fcc2,	%f22,	%f22
	mulscc	%l4,	%o6,	%g2
	nop
	set	0x20, %l4
	sth	%i2,	[%l7 + %l4]
	fornot1s	%f0,	%f6,	%f4
	andn	%l6,	%g3,	%i6
	edge16l	%i4,	%o0,	%i5
	edge16	%g1,	%o3,	%i3
	srlx	%l0,	0x14,	%o1
	udivcc	%g5,	0x116B,	%g7
	lduw	[%l7 + 0x64],	%l1
	xorcc	%i7,	%o5,	%l3
	mulx	%l2,	0x063B,	%o7
	sll	%o4,	0x09,	%i1
	movge	%xcc,	%o2,	%i0
	edge32	%g6,	%l5,	%l4
	orn	%o6,	%g4,	%i2
	movgu	%xcc,	%g2,	%l6
	movgu	%xcc,	%i6,	%g3
	for	%f4,	%f4,	%f2
	xnor	%i4,	%o0,	%g1
	movle	%xcc,	%i5,	%o3
	alignaddr	%i3,	%l0,	%g5
	edge32n	%o1,	%g7,	%i7
	edge16l	%o5,	%l1,	%l2
	ldub	[%l7 + 0x47],	%o7
	sll	%o4,	0x1F,	%i1
	udiv	%l3,	0x1DB7,	%o2
	movle	%icc,	%g6,	%l5
	ldd	[%l7 + 0x10],	%f20
	movg	%icc,	%i0,	%o6
	mulx	%g4,	%i2,	%l4
	and	%l6,	0x1BEC,	%g2
	movpos	%icc,	%g3,	%i6
	stb	%i4,	[%l7 + 0x6C]
	edge16ln	%o0,	%g1,	%o3
	st	%f27,	[%l7 + 0x70]
	orcc	%i3,	0x1051,	%i5
	movn	%xcc,	%l0,	%o1
	movrlez	%g5,	0x0EB,	%g7
	umul	%o5,	0x10B5,	%i7
	fandnot1	%f10,	%f4,	%f0
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%l1
	movrgez	%o7,	0x0EB,	%o4
	array32	%i1,	%l3,	%l2
	fmovdg	%xcc,	%f24,	%f12
	sdiv	%o2,	0x0ECC,	%l5
	sethi	0x02FE,	%g6
	fexpand	%f7,	%f18
	movl	%xcc,	%i0,	%g4
	ldub	[%l7 + 0x74],	%i2
	movcs	%icc,	%l4,	%o6
	movvs	%xcc,	%g2,	%g3
	lduh	[%l7 + 0x1C],	%i6
	ldsw	[%l7 + 0x28],	%i4
	edge32l	%o0,	%g1,	%l6
	fpsub32	%f2,	%f28,	%f26
	addc	%o3,	%i3,	%i5
	mulx	%o1,	%l0,	%g7
	movrgz	%g5,	0x1F0,	%o5
	movvs	%xcc,	%l1,	%i7
	xor	%o7,	0x0C96,	%o4
	edge16n	%l3,	%i1,	%l2
	movne	%xcc,	%o2,	%g6
	andn	%i0,	0x03E3,	%l5
	movge	%xcc,	%i2,	%l4
	umulcc	%o6,	%g4,	%g2
	mulscc	%g3,	0x00AC,	%i6
	movgu	%icc,	%i4,	%o0
	fsrc1s	%f14,	%f28
	fcmpeq32	%f16,	%f8,	%g1
	edge32n	%l6,	%o3,	%i3
	andncc	%i5,	%o1,	%l0
	orncc	%g7,	%o5,	%l1
	alignaddrl	%g5,	%i7,	%o7
	andn	%l3,	0x048C,	%o4
	addc	%i1,	0x0E6D,	%o2
	ldub	[%l7 + 0x28],	%l2
	fmovrsgez	%i0,	%f14,	%f6
	lduw	[%l7 + 0x6C],	%g6
	movre	%l5,	%i2,	%l4
	array32	%o6,	%g4,	%g2
	edge16ln	%i6,	%g3,	%i4
	umulcc	%g1,	%l6,	%o0
	fmovsgu	%xcc,	%f10,	%f24
	st	%f6,	[%l7 + 0x6C]
	fpsub16	%f2,	%f20,	%f2
	fmovdleu	%xcc,	%f22,	%f15
	edge8l	%i3,	%i5,	%o3
	fmovdneg	%icc,	%f27,	%f10
	array32	%o1,	%l0,	%o5
	edge8ln	%g7,	%g5,	%i7
	or	%o7,	0x0042,	%l1
	subc	%o4,	%l3,	%i1
	ldd	[%l7 + 0x78],	%l2
	ldsb	[%l7 + 0x78],	%o2
	or	%g6,	0x06E2,	%i0
	array8	%i2,	%l5,	%l4
	mulscc	%o6,	%g4,	%i6
	alignaddr	%g3,	%i4,	%g1
	sll	%g2,	%o0,	%i3
	edge8l	%i5,	%l6,	%o1
	orncc	%o3,	%o5,	%g7
	fmovdleu	%xcc,	%f22,	%f4
	edge32	%l0,	%g5,	%o7
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	orcc	%l3,	%l2,	%o2
	edge16ln	%i1,	%i0,	%g6
	movpos	%icc,	%i2,	%l4
	umul	%l5,	%o6,	%g4
	and	%g3,	%i4,	%i6
	subccc	%g2,	0x192A,	%g1
	edge16	%i3,	%i5,	%l6
	subcc	%o0,	0x19B5,	%o3
	lduh	[%l7 + 0x50],	%o1
	mulx	%o5,	0x1BF2,	%l0
	ldub	[%l7 + 0x4B],	%g5
	restore %g7, 0x1FCA, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o4,	%o7
	fand	%f10,	%f18,	%f4
	mova	%icc,	%l1,	%l2
	movre	%l3,	0x15F,	%i1
	mova	%xcc,	%i0,	%g6
	save %o2, 0x1BDA, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i2,	%o6,	%l5
	fandnot2	%f24,	%f16,	%f28
	stw	%g4,	[%l7 + 0x6C]
	andcc	%i4,	%g3,	%i6
	fmul8ulx16	%f0,	%f0,	%f18
	udivcc	%g1,	0x1526,	%g2
	udivx	%i5,	0x1C9B,	%i3
	xnor	%o0,	%o3,	%o1
	fpack32	%f8,	%f16,	%f30
	movrgez	%o5,	%l6,	%l0
	xorcc	%g5,	%i7,	%o4
	movcs	%icc,	%g7,	%l1
	sub	%l2,	0x0044,	%l3
	sdivx	%o7,	0x0174,	%i1
	fzeros	%f1
	fmovde	%xcc,	%f5,	%f12
	edge16	%g6,	%o2,	%i0
	movcs	%icc,	%i2,	%o6
	movrlez	%l4,	0x15C,	%g4
	fcmpes	%fcc3,	%f3,	%f27
	fmovdvc	%xcc,	%f0,	%f1
	sdivx	%i4,	0x152A,	%g3
	lduw	[%l7 + 0x2C],	%i6
	sdivx	%l5,	0x099C,	%g2
	fmovsle	%icc,	%f2,	%f29
	fmovsvc	%icc,	%f25,	%f18
	mova	%icc,	%i5,	%g1
	add	%i3,	0x1AA9,	%o0
	fmovdn	%xcc,	%f10,	%f6
	movrlz	%o3,	0x18A,	%o5
	andn	%o1,	0x004C,	%l0
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	ldub	[%l7 + 0x14],	%o4
	stx	%i7,	[%l7 + 0x40]
	subcc	%l1,	%g7,	%l3
	sdivx	%o7,	0x0F9D,	%l2
	fpmerge	%f13,	%f24,	%f14
	add	%g6,	%o2,	%i1
	st	%f30,	[%l7 + 0x48]
	addcc	%i2,	0x0BB7,	%i0
	ldd	[%l7 + 0x48],	%f24
	fmovrdgez	%l4,	%f20,	%f20
	ldsb	[%l7 + 0x0A],	%g4
	fcmpne16	%f14,	%f8,	%o6
	fnand	%f12,	%f22,	%f10
	movrne	%g3,	%i4,	%l5
	udiv	%g2,	0x1990,	%i5
	movne	%xcc,	%i6,	%g1
	fxnor	%f24,	%f24,	%f14
	sdivcc	%i3,	0x1B17,	%o3
	fmovdcc	%icc,	%f8,	%f9
	ldx	[%l7 + 0x28],	%o5
	move	%xcc,	%o1,	%l0
	movge	%icc,	%o0,	%g5
	addcc	%l6,	%i7,	%o4
	fcmpeq16	%f22,	%f20,	%g7
	fmul8sux16	%f0,	%f0,	%f28
	movneg	%xcc,	%l3,	%l1
	movre	%o7,	0x0FC,	%l2
	fmovsgu	%xcc,	%f11,	%f13
	edge32l	%o2,	%g6,	%i2
	popc	%i1,	%l4
	edge32n	%i0,	%o6,	%g4
	lduw	[%l7 + 0x68],	%i4
	fcmps	%fcc3,	%f21,	%f13
	smulcc	%l5,	0x1DC9,	%g2
	stw	%g3,	[%l7 + 0x08]
	sth	%i6,	[%l7 + 0x4A]
	movvc	%xcc,	%i5,	%g1
	array32	%o3,	%o5,	%i3
	fmovsleu	%icc,	%f13,	%f24
	movl	%xcc,	%o1,	%o0
	fandnot1	%f0,	%f30,	%f16
	nop
	set	0x2B, %l0
	ldsb	[%l7 + %l0],	%g5
	fcmpeq32	%f6,	%f30,	%l6
	smul	%i7,	%o4,	%g7
	fxors	%f10,	%f11,	%f6
	or	%l3,	%l0,	%l1
	subcc	%l2,	0x0B37,	%o7
	addccc	%g6,	%i2,	%o2
	fmovsne	%xcc,	%f9,	%f20
	fmovrdne	%i1,	%f10,	%f2
	fpackfix	%f6,	%f5
	sll	%l4,	0x1D,	%i0
	orn	%o6,	%g4,	%i4
	movvc	%icc,	%l5,	%g3
	st	%f5,	[%l7 + 0x38]
	popc	%g2,	%i6
	umulcc	%i5,	%g1,	%o3
	edge16	%i3,	%o1,	%o0
	movrlz	%o5,	0x0DB,	%g5
	nop
	set	0x48, %i7
	lduh	[%l7 + %i7],	%l6
	sdivcc	%i7,	0x1B67,	%o4
	ldub	[%l7 + 0x16],	%g7
	fmul8x16al	%f27,	%f21,	%f24
	umulcc	%l0,	0x1F3D,	%l3
	subccc	%l2,	0x0AC2,	%o7
	add	%l1,	%i2,	%o2
	fmul8x16	%f27,	%f24,	%f2
	fmovdn	%icc,	%f26,	%f8
	movle	%icc,	%g6,	%i1
	orn	%i0,	%l4,	%g4
	subcc	%i4,	0x1F3E,	%l5
	movrlz	%g3,	0x2E2,	%o6
	movne	%xcc,	%g2,	%i5
	fnot1	%f6,	%f8
	srlx	%i6,	0x15,	%o3
	edge8ln	%i3,	%o1,	%o0
	ldx	[%l7 + 0x48],	%g1
	edge32n	%o5,	%g5,	%i7
	ldx	[%l7 + 0x10],	%l6
	movrne	%g7,	%l0,	%l3
	fandnot1s	%f8,	%f17,	%f11
	mulscc	%o4,	%l2,	%o7
	movleu	%icc,	%l1,	%i2
	movcc	%icc,	%o2,	%i1
	andncc	%g6,	%l4,	%g4
	fmul8x16au	%f26,	%f9,	%f28
	edge8n	%i4,	%l5,	%i0
	fmul8ulx16	%f2,	%f18,	%f30
	ldsw	[%l7 + 0x78],	%o6
	movrgz	%g3,	0x0D9,	%i5
	fmovda	%icc,	%f20,	%f26
	fmovdle	%xcc,	%f18,	%f19
	movrne	%g2,	%i6,	%i3
	edge16	%o1,	%o0,	%o3
	fpadd16	%f30,	%f28,	%f6
	fnand	%f18,	%f0,	%f22
	fcmpgt16	%f6,	%f8,	%o5
	mulscc	%g1,	0x10B2,	%g5
	popc	%i7,	%l6
	mova	%xcc,	%l0,	%l3
	ldsw	[%l7 + 0x4C],	%g7
	movn	%icc,	%o4,	%l2
	alignaddr	%o7,	%i2,	%o2
	andncc	%i1,	%l1,	%l4
	ldub	[%l7 + 0x4B],	%g6
	fpack16	%f18,	%f8
	fmovdle	%xcc,	%f29,	%f8
	fpadd16	%f24,	%f22,	%f0
	movcc	%xcc,	%g4,	%l5
	sllx	%i4,	%o6,	%g3
	orcc	%i0,	0x05B0,	%i5
	movgu	%xcc,	%g2,	%i3
	fands	%f13,	%f29,	%f6
	fmovrdlez	%o1,	%f12,	%f0
	orn	%o0,	0x160D,	%o3
	addccc	%o5,	%g1,	%i6
	xorcc	%g5,	0x0C69,	%i7
	movrne	%l0,	0x0F0,	%l3
	or	%g7,	%o4,	%l6
	fmovdne	%xcc,	%f1,	%f24
	fzeros	%f19
	fandnot2	%f16,	%f22,	%f30
	fmovsle	%icc,	%f7,	%f15
	mulx	%o7,	0x160D,	%i2
	movle	%icc,	%l2,	%i1
	fmovspos	%icc,	%f30,	%f12
	fpack32	%f30,	%f14,	%f0
	fmovdcs	%xcc,	%f30,	%f13
	xorcc	%l1,	0x018D,	%o2
	subcc	%g6,	%l4,	%l5
	movne	%icc,	%i4,	%g4
	movl	%xcc,	%o6,	%i0
	alignaddrl	%i5,	%g3,	%g2
	sub	%o1,	0x0981,	%i3
	sdiv	%o3,	0x03A6,	%o5
	fmovrsne	%g1,	%f25,	%f27
	edge8ln	%o0,	%g5,	%i6
	movg	%icc,	%l0,	%i7
	move	%icc,	%g7,	%l3
	movrgez	%l6,	0x300,	%o7
	movcs	%icc,	%o4,	%i2
	fmovspos	%xcc,	%f20,	%f20
	movg	%xcc,	%l2,	%i1
	edge16	%o2,	%g6,	%l4
	nop
	set	0x7E, %l6
	ldsb	[%l7 + %l6],	%l1
	xor	%l5,	%g4,	%o6
	fmovrsgz	%i4,	%f3,	%f8
	fpadd32s	%f2,	%f12,	%f22
	ldsh	[%l7 + 0x2E],	%i5
	edge8	%g3,	%g2,	%i0
	nop
	set	0x78, %g5
	std	%f10,	[%l7 + %g5]
	edge8	%o1,	%i3,	%o5
	fmovdcc	%xcc,	%f15,	%f24
	move	%xcc,	%g1,	%o0
	orn	%o3,	0x1C8D,	%i6
	restore %g5, %l0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i7,	%l6,	%o7
	sllx	%l3,	0x10,	%o4
	fmovdge	%icc,	%f26,	%f27
	ldsw	[%l7 + 0x14],	%l2
	stb	%i2,	[%l7 + 0x6A]
	edge32n	%i1,	%o2,	%g6
	alignaddrl	%l1,	%l5,	%l4
	fmovsne	%icc,	%f26,	%f7
	edge8	%g4,	%i4,	%o6
	fmovscc	%xcc,	%f17,	%f19
	movcs	%xcc,	%i5,	%g2
	ldsh	[%l7 + 0x28],	%g3
	ldx	[%l7 + 0x58],	%o1
	subcc	%i0,	%o5,	%g1
	nop
	set	0x7C, %o0
	sth	%o0,	[%l7 + %o0]
	movcs	%icc,	%i3,	%o3
	udivx	%g5,	0x1FD8,	%i6
	edge16ln	%l0,	%i7,	%l6
	edge16	%g7,	%l3,	%o4
	subccc	%o7,	%i2,	%i1
	movle	%xcc,	%l2,	%o2
	ldub	[%l7 + 0x13],	%l1
	sub	%l5,	%g6,	%l4
	popc	0x0CE4,	%i4
	movg	%xcc,	%g4,	%i5
	edge16	%g2,	%g3,	%o6
	ldd	[%l7 + 0x08],	%i0
	srlx	%o1,	%o5,	%o0
	movleu	%icc,	%i3,	%o3
	andcc	%g1,	%g5,	%i6
	fmovscc	%icc,	%f28,	%f14
	movgu	%xcc,	%i7,	%l0
	sdiv	%g7,	0x0B16,	%l3
	fcmple32	%f10,	%f8,	%l6
	smulcc	%o4,	%o7,	%i2
	movleu	%xcc,	%l2,	%o2
	mulscc	%i1,	0x1034,	%l5
	sub	%l1,	0x05FD,	%l4
	movrlz	%g6,	0x222,	%i4
	fcmpeq32	%f12,	%f10,	%g4
	movgu	%xcc,	%g2,	%i5
	fxnor	%f28,	%f18,	%f28
	edge16ln	%g3,	%i0,	%o6
	orcc	%o1,	%o0,	%o5
	addc	%i3,	%g1,	%o3
	nop
	set	0x36, %g4
	sth	%g5,	[%l7 + %g4]
	save %i6, 0x0D17, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i7,	%l3
	std	%f12,	[%l7 + 0x78]
	fmovsleu	%icc,	%f26,	%f28
	fxors	%f14,	%f8,	%f10
	fone	%f18
	movpos	%icc,	%l6,	%g7
	orncc	%o4,	%i2,	%l2
	siam	0x0
	alignaddr	%o2,	%i1,	%l5
	mulscc	%l1,	0x0270,	%o7
	movvc	%icc,	%g6,	%l4
	orn	%i4,	0x1852,	%g4
	movneg	%xcc,	%i5,	%g3
	ldd	[%l7 + 0x08],	%f0
	srl	%i0,	%o6,	%g2
	ldsh	[%l7 + 0x2E],	%o1
	srlx	%o0,	%i3,	%g1
	fmovdcc	%xcc,	%f29,	%f5
	udivx	%o5,	0x00C0,	%o3
	fexpand	%f11,	%f4
	and	%g5,	0x0D92,	%l0
	movrne	%i7,	0x073,	%l3
	sra	%i6,	%l6,	%o4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	st	%f6,	[%l7 + 0x54]
	sdiv	%l2,	0x188D,	%l5
	movge	%xcc,	%l1,	%o7
	fzeros	%f13
	xor	%g6,	0x1709,	%i1
	ldsb	[%l7 + 0x71],	%l4
	umulcc	%i4,	%g4,	%g3
	edge8l	%i5,	%o6,	%g2
	or	%o1,	%i0,	%i3
	fabss	%f8,	%f20
	ld	[%l7 + 0x70],	%f3
	ldub	[%l7 + 0x66],	%g1
	movre	%o0,	0x173,	%o3
	fabsd	%f26,	%f22
	udivcc	%o5,	0x0FCB,	%g5
	ldub	[%l7 + 0x2E],	%i7
	save %l0, %i6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x40, %g6
	ldsw	[%l7 + %g6],	%o4
	orncc	%l3,	0x0B4E,	%i2
	sllx	%g7,	0x0A,	%o2
	umul	%l5,	0x0630,	%l2
	save %l1, %g6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%l4,	%f8,	%f19
	movrgez	%i4,	0x233,	%o7
	fandnot2	%f4,	%f20,	%f26
	addcc	%g3,	0x0D6C,	%i5
	move	%xcc,	%g4,	%o6
	fmovdg	%icc,	%f4,	%f17
	or	%g2,	%i0,	%o1
	fmovsg	%icc,	%f1,	%f22
	fmovdgu	%xcc,	%f23,	%f8
	fcmpeq16	%f30,	%f30,	%i3
	edge16ln	%g1,	%o3,	%o5
	ldd	[%l7 + 0x68],	%g4
	movvs	%icc,	%i7,	%l0
	fcmpne32	%f6,	%f26,	%o0
	subccc	%l6,	0x0A40,	%o4
	array32	%i6,	%i2,	%g7
	sdivcc	%l3,	0x0725,	%o2
	sdivcc	%l5,	0x15DD,	%l2
	movcs	%xcc,	%g6,	%l1
	srl	%i1,	0x14,	%l4
	udiv	%o7,	0x1AEE,	%i4
	fmovdcc	%xcc,	%f5,	%f25
	mova	%xcc,	%g3,	%i5
	sdivx	%o6,	0x1A1A,	%g2
	movcs	%icc,	%g4,	%i0
	edge32	%o1,	%g1,	%i3
	edge32	%o5,	%g5,	%o3
	subc	%i7,	%l0,	%o0
	sra	%o4,	%i6,	%i2
	fcmps	%fcc0,	%f11,	%f26
	movn	%icc,	%g7,	%l3
	xnorcc	%l6,	%l5,	%o2
	edge8	%g6,	%l1,	%l2
	movle	%icc,	%l4,	%i1
	array32	%o7,	%g3,	%i4
	subccc	%o6,	%g2,	%g4
	stx	%i5,	[%l7 + 0x08]
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f24
	fcmpne16	%f6,	%f6,	%i0
	array32	%o1,	%g1,	%i3
	orncc	%o5,	0x11AE,	%g5
	addc	%i7,	0x0A4A,	%l0
	save %o0, %o4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0035,	%o3
	mulscc	%g7,	0x1CEA,	%l3
	smul	%l6,	0x0FE6,	%i2
	edge32n	%o2,	%l5,	%g6
	sdivx	%l2,	0x0214,	%l4
	lduh	[%l7 + 0x0A],	%l1
	ldsw	[%l7 + 0x4C],	%i1
	mulx	%g3,	%o7,	%o6
	stw	%g2,	[%l7 + 0x14]
	stw	%g4,	[%l7 + 0x28]
	array16	%i5,	%i4,	%i0
	fcmpes	%fcc1,	%f0,	%f0
	movvs	%xcc,	%o1,	%g1
	array32	%o5,	%i3,	%g5
	srl	%i7,	0x17,	%o0
	addccc	%o4,	%l0,	%o3
	movvc	%xcc,	%g7,	%i6
	addc	%l6,	0x1BBD,	%l3
	movne	%xcc,	%o2,	%l5
	lduw	[%l7 + 0x70],	%i2
	array16	%g6,	%l2,	%l4
	edge32	%l1,	%g3,	%i1
	sllx	%o6,	%o7,	%g4
	stx	%g2,	[%l7 + 0x58]
	alignaddr	%i5,	%i4,	%o1
	srl	%i0,	0x0C,	%o5
	or	%g1,	0x0DA2,	%i3
	xnor	%g5,	%o0,	%o4
	smulcc	%i7,	%o3,	%l0
	movleu	%icc,	%g7,	%i6
	array32	%l6,	%l3,	%l5
	fmovdvc	%xcc,	%f29,	%f11
	edge8	%i2,	%g6,	%l2
	srlx	%l4,	0x1F,	%l1
	xor	%g3,	0x18AF,	%o2
	movgu	%icc,	%o6,	%o7
	mulscc	%g4,	0x0B17,	%g2
	ldsw	[%l7 + 0x38],	%i5
	sth	%i1,	[%l7 + 0x26]
	fmul8sux16	%f12,	%f4,	%f20
	edge16ln	%o1,	%i4,	%o5
	edge16l	%i0,	%g1,	%g5
	edge8ln	%o0,	%o4,	%i7
	edge8n	%o3,	%i3,	%l0
	movre	%i6,	%l6,	%l3
	addc	%l5,	0x045C,	%g7
	sethi	0x1BA1,	%g6
	movcs	%xcc,	%l2,	%l4
	umul	%l1,	0x18BE,	%g3
	movrlz	%o2,	%o6,	%o7
	or	%g4,	%i2,	%g2
	fcmpeq32	%f30,	%f12,	%i1
	movl	%icc,	%o1,	%i5
	fcmps	%fcc1,	%f23,	%f21
	st	%f28,	[%l7 + 0x24]
	fmovsvc	%xcc,	%f29,	%f16
	fnand	%f14,	%f20,	%f26
	move	%xcc,	%o5,	%i4
	sll	%g1,	0x1B,	%g5
	std	%f6,	[%l7 + 0x60]
	fmovsge	%xcc,	%f6,	%f7
	sth	%o0,	[%l7 + 0x78]
	save %o4, %i0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i3,	%l0,	%i6
	movrgez	%i7,	%l6,	%l5
	andcc	%l3,	0x1EEF,	%g6
	popc	%g7,	%l4
	movrne	%l2,	0x30D,	%l1
	movre	%o2,	%o6,	%g3
	ldub	[%l7 + 0x4D],	%g4
	movrgz	%i2,	%o7,	%i1
	edge8ln	%o1,	%i5,	%o5
	fmovdcs	%icc,	%f12,	%f9
	sethi	0x10AA,	%i4
	fmovrdlez	%g1,	%f20,	%f16
	ldx	[%l7 + 0x18],	%g5
	umulcc	%g2,	0x0426,	%o4
	addcc	%o0,	0x0A03,	%o3
	addc	%i3,	%i0,	%i6
	fmovrslz	%i7,	%f21,	%f17
	sdivcc	%l6,	0x09F5,	%l0
	movg	%xcc,	%l3,	%g6
	addccc	%l5,	0x1E3E,	%l4
	umulcc	%l2,	0x0CF5,	%l1
	andncc	%g7,	%o2,	%g3
	lduw	[%l7 + 0x08],	%o6
	stx	%g4,	[%l7 + 0x08]
	movvs	%icc,	%o7,	%i2
	umulcc	%o1,	0x109E,	%i5
	fmovdn	%icc,	%f2,	%f0
	edge16	%o5,	%i4,	%i1
	addcc	%g5,	%g2,	%g1
	fmovscc	%xcc,	%f28,	%f19
	sdiv	%o4,	0x0581,	%o0
	orn	%i3,	%i0,	%i6
	sir	0x124A
	andcc	%i7,	0x1CCC,	%l6
	ldsb	[%l7 + 0x6D],	%l0
	movrlz	%o3,	%l3,	%g6
	fone	%f30
	addccc	%l4,	%l5,	%l2
	fmovsneg	%xcc,	%f4,	%f2
	alignaddr	%l1,	%g7,	%o2
	fnand	%f24,	%f30,	%f24
	movgu	%xcc,	%g3,	%g4
	andcc	%o6,	0x17E8,	%i2
	sth	%o7,	[%l7 + 0x3C]
	fmovsgu	%xcc,	%f5,	%f17
	sdivx	%o1,	0x0105,	%o5
	xorcc	%i5,	0x13C3,	%i4
	fsrc2s	%f6,	%f8
	ldd	[%l7 + 0x50],	%f0
	ldsh	[%l7 + 0x76],	%i1
	srax	%g5,	0x0D,	%g2
	alignaddr	%o4,	%g1,	%i3
	fabss	%f1,	%f23
	alignaddrl	%o0,	%i6,	%i0
	srax	%i7,	%l0,	%l6
	array32	%o3,	%g6,	%l4
	edge16	%l3,	%l5,	%l1
	xnorcc	%g7,	0x1B83,	%o2
	fzeros	%f4
	fmovsleu	%xcc,	%f18,	%f31
	xnor	%l2,	0x077C,	%g3
	subccc	%g4,	%o6,	%o7
	addcc	%i2,	%o5,	%i5
	edge32n	%i4,	%i1,	%o1
	ldd	[%l7 + 0x18],	%f10
	edge32l	%g2,	%g5,	%o4
	fmovrdlz	%g1,	%f26,	%f14
	srl	%i3,	0x01,	%o0
	mova	%xcc,	%i0,	%i6
	movge	%icc,	%l0,	%i7
	fmovsa	%icc,	%f4,	%f8
	umulcc	%o3,	%l6,	%l4
	sir	0x1D5D
	and	%l3,	0x0903,	%l5
	fzero	%f24
	restore %l1, 0x077E, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f20,	%f14
	edge8n	%o2,	%l2,	%g6
	movrne	%g4,	%o6,	%g3
	move	%xcc,	%i2,	%o5
	movrne	%i5,	%o7,	%i4
	movrgez	%i1,	%g2,	%o1
	add	%o4,	%g5,	%g1
	udivx	%i3,	0x02F9,	%o0
	movrlz	%i0,	0x1DB,	%l0
	ldd	[%l7 + 0x70],	%i6
	movrlz	%o3,	0x2F9,	%l6
	orncc	%l4,	0x0797,	%i6
	edge8	%l3,	%l5,	%g7
	sdivx	%l1,	0x15CF,	%l2
	movne	%icc,	%g6,	%g4
	edge16l	%o2,	%g3,	%o6
	sth	%i2,	[%l7 + 0x7E]
	fxors	%f11,	%f20,	%f0
	movrgz	%i5,	0x07F,	%o5
	fmovsleu	%icc,	%f28,	%f20
	fandnot2s	%f20,	%f8,	%f0
	udivcc	%o7,	0x1499,	%i1
	srlx	%g2,	0x07,	%o1
	save %i4, 0x05FC, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g1,	%i3,	%o0
	fmovdpos	%icc,	%f6,	%f25
	movrne	%g5,	%i0,	%i7
	edge32ln	%l0,	%l6,	%l4
	movge	%icc,	%o3,	%i6
	edge16ln	%l5,	%l3,	%l1
	fmovdvc	%xcc,	%f20,	%f17
	orn	%g7,	%l2,	%g4
	popc	0x02F5,	%o2
	fmovdne	%icc,	%f16,	%f26
	udivx	%g3,	0x0928,	%g6
	fmovrdne	%i2,	%f18,	%f28
	st	%f4,	[%l7 + 0x60]
	fpadd32s	%f8,	%f1,	%f20
	udiv	%o6,	0x0424,	%o5
	xnor	%o7,	0x08D0,	%i1
	movvs	%xcc,	%g2,	%o1
	sir	0x1B6E
	edge8	%i5,	%i4,	%o4
	movne	%icc,	%g1,	%o0
	sll	%i3,	0x04,	%i0
	edge8l	%i7,	%g5,	%l0
	addc	%l6,	%l4,	%o3
	ld	[%l7 + 0x0C],	%f26
	addcc	%l5,	0x1DCE,	%l3
	fmovrsne	%l1,	%f29,	%f27
	smulcc	%g7,	%i6,	%l2
	faligndata	%f0,	%f2,	%f24
	smul	%o2,	%g4,	%g6
	umulcc	%i2,	0x0144,	%g3
	sra	%o6,	%o7,	%o5
	fornot1s	%f4,	%f16,	%f10
	subc	%g2,	0x0A56,	%o1
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	ldsh	[%l7 + 0x16],	%g1
	subc	%o0,	%i4,	%i0
	array16	%i7,	%g5,	%l0
	addcc	%i3,	0x0462,	%l6
	fmovsgu	%xcc,	%f31,	%f10
	fmovrse	%o3,	%f2,	%f2
	sll	%l4,	%l5,	%l1
	subcc	%l3,	0x1525,	%g7
	fpmerge	%f4,	%f11,	%f18
	movrgez	%i6,	0x19C,	%o2
	fmul8x16au	%f31,	%f2,	%f0
	mova	%xcc,	%l2,	%g4
	fzeros	%f29
	ldsw	[%l7 + 0x6C],	%i2
	save %g6, 0x0452, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o7,	%g3,	%o5
	movneg	%xcc,	%o1,	%g2
	fcmpd	%fcc3,	%f4,	%f26
	orcc	%i1,	0x0E80,	%o4
	move	%xcc,	%i5,	%o0
	save %g1, 0x19F3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%i0,	%f10,	%f26
	fpadd32	%f8,	%f14,	%f18
	edge16ln	%i7,	%l0,	%g5
	udiv	%l6,	0x1D31,	%i3
	umulcc	%o3,	%l5,	%l4
	fmul8sux16	%f28,	%f8,	%f26
	sethi	0x052B,	%l3
	andn	%g7,	%i6,	%l1
	sdiv	%l2,	0x033E,	%o2
	fpackfix	%f28,	%f6
	srlx	%i2,	0x0C,	%g6
	orn	%g4,	0x1C3F,	%o6
	fsrc2s	%f21,	%f20
	subc	%o7,	0x1AF7,	%g3
	sub	%o5,	%o1,	%g2
	fmul8x16	%f0,	%f28,	%f18
	std	%f16,	[%l7 + 0x10]
	fmovdge	%xcc,	%f18,	%f11
	array32	%o4,	%i1,	%i5
	fors	%f20,	%f1,	%f13
	siam	0x0
	stw	%o0,	[%l7 + 0x50]
	movrlz	%g1,	0x3A0,	%i0
	ldx	[%l7 + 0x30],	%i7
	edge8l	%l0,	%i4,	%g5
	edge8ln	%l6,	%i3,	%o3
	edge8	%l5,	%l3,	%l4
	alignaddr	%i6,	%g7,	%l1
	and	%l2,	%i2,	%o2
	fmovda	%xcc,	%f1,	%f6
	addc	%g4,	%g6,	%o6
	fmovrsgz	%o7,	%f18,	%f19
	fxor	%f30,	%f2,	%f18
	movrgez	%o5,	%g3,	%o1
	movl	%icc,	%g2,	%i1
	udiv	%o4,	0x1472,	%i5
	edge16	%o0,	%g1,	%i7
	edge16l	%i0,	%l0,	%g5
	fmovrslz	%l6,	%f27,	%f29
	sdiv	%i4,	0x1CB3,	%o3
	sub	%l5,	0x1264,	%i3
	movrne	%l3,	0x102,	%i6
	fones	%f8
	edge16n	%l4,	%g7,	%l2
	movrlz	%l1,	%i2,	%g4
	ldub	[%l7 + 0x45],	%o2
	sra	%g6,	%o6,	%o7
	sdiv	%o5,	0x160C,	%g3
	movgu	%xcc,	%o1,	%g2
	edge32l	%i1,	%i5,	%o0
	mova	%xcc,	%o4,	%g1
	srax	%i0,	0x1A,	%l0
	sra	%i7,	%l6,	%i4
	and	%g5,	0x1D15,	%l5
	stx	%i3,	[%l7 + 0x38]
	sth	%o3,	[%l7 + 0x26]
	fandnot2	%f10,	%f12,	%f26
	movrlez	%i6,	%l4,	%g7
	fmovsvs	%icc,	%f16,	%f30
	ld	[%l7 + 0x14],	%f5
	fmovrdlz	%l3,	%f10,	%f30
	fxors	%f28,	%f16,	%f27
	movge	%xcc,	%l1,	%l2
	sth	%g4,	[%l7 + 0x18]
	fmovsneg	%icc,	%f28,	%f26
	movvs	%icc,	%o2,	%g6
	array8	%o6,	%o7,	%o5
	fmovsvc	%xcc,	%f29,	%f28
	alignaddrl	%g3,	%o1,	%i2
	sllx	%g2,	%i1,	%i5
	movre	%o4,	0x3AD,	%o0
	edge8n	%i0,	%g1,	%l0
	st	%f7,	[%l7 + 0x10]
	fcmpeq16	%f24,	%f22,	%i7
	smul	%l6,	0x0805,	%g5
	addc	%l5,	%i4,	%i3
	edge16l	%o3,	%i6,	%g7
	orn	%l4,	%l3,	%l1
	sdiv	%l2,	0x07E3,	%o2
	fcmple16	%f10,	%f18,	%g4
	srax	%o6,	0x1C,	%o7
	fmul8x16	%f4,	%f16,	%f30
	xnorcc	%g6,	0x160E,	%o5
	fmovdneg	%xcc,	%f8,	%f24
	fors	%f20,	%f22,	%f10
	movrgez	%g3,	%o1,	%i2
	ldsb	[%l7 + 0x1D],	%g2
	sdivx	%i5,	0x066D,	%o4
	ldd	[%l7 + 0x60],	%o0
	sir	0x153D
	lduh	[%l7 + 0x24],	%i1
	movg	%icc,	%g1,	%i0
	array32	%l0,	%i7,	%g5
	stb	%l6,	[%l7 + 0x32]
	andncc	%i4,	%l5,	%i3
	ldd	[%l7 + 0x38],	%f28
	fpadd16	%f14,	%f8,	%f0
	fpsub32s	%f1,	%f31,	%f9
	addcc	%i6,	%g7,	%l4
	edge16l	%l3,	%l1,	%l2
	fornot1	%f28,	%f20,	%f26
	srl	%o2,	%o3,	%g4
	orn	%o7,	0x13D7,	%o6
	movrgz	%g6,	%g3,	%o5
	stx	%i2,	[%l7 + 0x08]
	fmul8sux16	%f16,	%f0,	%f28
	orn	%g2,	0x131B,	%i5
	sir	0x12E0
	ld	[%l7 + 0x5C],	%f1
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f28
	edge16n	%o1,	%o4,	%i1
	ldsb	[%l7 + 0x6D],	%g1
	fmovdg	%icc,	%f4,	%f16
	edge8	%i0,	%o0,	%i7
	ldsw	[%l7 + 0x30],	%g5
	edge32n	%l6,	%l0,	%i4
	nop
	set	0x6C, %i2
	lduh	[%l7 + %i2],	%i3
	sra	%l5,	%i6,	%g7
	popc	%l4,	%l1
	addccc	%l3,	0x1CFD,	%o2
	stx	%o3,	[%l7 + 0x18]
	movrne	%l2,	%o7,	%g4
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%g6
	edge16	%g3,	%o5,	%i2
	array16	%o6,	%g2,	%i5
	sth	%o4,	[%l7 + 0x18]
	stb	%o1,	[%l7 + 0x7E]
	lduw	[%l7 + 0x70],	%i1
	smulcc	%g1,	%i0,	%o0
	edge32ln	%i7,	%l6,	%l0
	udivx	%g5,	0x0269,	%i4
	movneg	%xcc,	%i3,	%i6
	stw	%l5,	[%l7 + 0x0C]
	movge	%icc,	%l4,	%l1
	fones	%f0
	ldub	[%l7 + 0x68],	%g7
	movrlz	%l3,	%o3,	%l2
	movl	%icc,	%o2,	%o7
	mova	%xcc,	%g4,	%g3
	edge32ln	%o5,	%i2,	%g6
	edge32l	%o6,	%i5,	%o4
	fmovsn	%xcc,	%f6,	%f12
	fmovdge	%xcc,	%f31,	%f15
	subccc	%o1,	0x1A9D,	%i1
	fnor	%f30,	%f0,	%f26
	fpackfix	%f10,	%f14
	xnorcc	%g2,	%i0,	%g1
	ldd	[%l7 + 0x40],	%o0
	fmovse	%xcc,	%f16,	%f5
	movrne	%l6,	%i7,	%g5
	edge32n	%l0,	%i4,	%i3
	movleu	%xcc,	%l5,	%i6
	fmuld8sux16	%f13,	%f31,	%f22
	lduw	[%l7 + 0x74],	%l4
	fsrc1s	%f24,	%f14
	sth	%l1,	[%l7 + 0x28]
	andn	%g7,	0x0843,	%l3
	sub	%l2,	0x0B13,	%o2
	orcc	%o7,	%g4,	%g3
	xnor	%o5,	%i2,	%g6
	movgu	%xcc,	%o3,	%i5
	ldsw	[%l7 + 0x58],	%o4
	movvs	%xcc,	%o6,	%o1
	edge8n	%g2,	%i1,	%i0
	ldub	[%l7 + 0x77],	%g1
	edge16n	%l6,	%o0,	%g5
	umulcc	%l0,	%i7,	%i4
	fmovde	%icc,	%f18,	%f25
	add	%i3,	%l5,	%l4
	umul	%l1,	0x0BB6,	%g7
	movleu	%xcc,	%l3,	%i6
	fmovsl	%xcc,	%f15,	%f6
	fmovdle	%icc,	%f29,	%f24
	srax	%o2,	%l2,	%o7
	movleu	%icc,	%g4,	%g3
	fmovse	%xcc,	%f31,	%f14
	fpsub32s	%f21,	%f24,	%f8
	fors	%f13,	%f21,	%f19
	std	%f22,	[%l7 + 0x28]
	nop
	set	0x18, %o3
	stb	%i2,	[%l7 + %o3]
	subc	%o5,	0x160B,	%g6
	sllx	%o3,	%i5,	%o6
	movrgez	%o4,	0x20F,	%o1
	fpsub16s	%f0,	%f15,	%f0
	mulx	%g2,	0x165C,	%i0
	udivcc	%i1,	0x0CEB,	%l6
	fnot2s	%f27,	%f12
	or	%o0,	%g1,	%g5
	fmovsg	%icc,	%f10,	%f13
	udivx	%l0,	0x0F49,	%i7
	add	%i4,	0x1E9F,	%i3
	fmuld8ulx16	%f22,	%f7,	%f6
	array32	%l4,	%l5,	%g7
	xor	%l3,	%i6,	%l1
	fxnors	%f13,	%f17,	%f8
	fmovspos	%xcc,	%f24,	%f18
	stw	%l2,	[%l7 + 0x0C]
	addc	%o2,	%g4,	%o7
	fmovrse	%i2,	%f17,	%f23
	popc	%g3,	%o5
	movrgez	%o3,	%g6,	%o6
	edge8ln	%o4,	%o1,	%g2
	ldub	[%l7 + 0x4A],	%i0
	fmovdleu	%icc,	%f18,	%f3
	edge32l	%i1,	%l6,	%i5
	add	%o0,	%g5,	%l0
	fmovsvc	%icc,	%f20,	%f7
	movrlez	%g1,	%i4,	%i3
	movg	%xcc,	%i7,	%l4
	fandnot2s	%f24,	%f7,	%f28
	movleu	%icc,	%g7,	%l5
	fcmple16	%f26,	%f26,	%l3
	array8	%l1,	%l2,	%o2
	ldsb	[%l7 + 0x53],	%i6
	or	%o7,	%g4,	%i2
	xnorcc	%g3,	%o3,	%o5
	fcmpeq32	%f26,	%f22,	%g6
	fpack32	%f28,	%f10,	%f22
	edge8	%o6,	%o1,	%g2
	edge16	%i0,	%i1,	%l6
	orn	%o4,	0x056C,	%o0
	sra	%i5,	0x0D,	%g5
	bshuffle	%f14,	%f16,	%f6
	addcc	%l0,	%g1,	%i4
	subcc	%i3,	%i7,	%l4
	fmovdne	%xcc,	%f30,	%f17
	edge8l	%g7,	%l3,	%l1
	movne	%xcc,	%l5,	%l2
	st	%f17,	[%l7 + 0x38]
	fmovrse	%o2,	%f23,	%f14
	fnor	%f12,	%f6,	%f6
	fmovspos	%xcc,	%f6,	%f21
	fexpand	%f11,	%f10
	edge16ln	%o7,	%g4,	%i6
	fcmpne16	%f10,	%f8,	%i2
	movne	%icc,	%o3,	%o5
	ld	[%l7 + 0x20],	%f17
	movrgz	%g3,	0x1C6,	%o6
	sdiv	%o1,	0x0C69,	%g6
	fmovrde	%i0,	%f0,	%f8
	ldd	[%l7 + 0x48],	%g2
	fmovrsgz	%l6,	%f5,	%f8
	fmovdne	%icc,	%f28,	%f22
	std	%f4,	[%l7 + 0x40]
	edge32	%i1,	%o4,	%i5
	udiv	%o0,	0x019A,	%g5
	restore %l0, 0x053B, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g1,	%i7,	%i3
	movgu	%icc,	%g7,	%l3
	srax	%l4,	%l1,	%l2
	movrlez	%o2,	0x368,	%l5
	ldd	[%l7 + 0x68],	%g4
	movgu	%icc,	%o7,	%i2
	movpos	%icc,	%o3,	%i6
	movgu	%icc,	%o5,	%g3
	ldsb	[%l7 + 0x67],	%o6
	and	%o1,	0x1BD3,	%g6
	fands	%f9,	%f15,	%f29
	movle	%icc,	%i0,	%g2
	fmovrsgz	%l6,	%f20,	%f0
	movn	%icc,	%i1,	%i5
	fmovdneg	%icc,	%f4,	%f5
	array16	%o4,	%g5,	%o0
	fandnot1s	%f20,	%f29,	%f21
	movre	%i4,	0x078,	%l0
	fzeros	%f3
	stw	%i7,	[%l7 + 0x54]
	lduh	[%l7 + 0x2A],	%i3
	udivx	%g7,	0x1EC9,	%g1
	edge8n	%l4,	%l3,	%l1
	movl	%xcc,	%l2,	%l5
	mova	%xcc,	%g4,	%o2
	fmovrslz	%o7,	%f10,	%f21
	fmul8x16	%f17,	%f16,	%f30
	movg	%icc,	%o3,	%i6
	sra	%i2,	0x1D,	%o5
	fmovdcc	%icc,	%f14,	%f22
	fmovsle	%icc,	%f27,	%f6
	array32	%g3,	%o6,	%o1
	lduw	[%l7 + 0x0C],	%i0
	edge32ln	%g6,	%g2,	%i1
	fmovrdgz	%l6,	%f2,	%f16
	fmovda	%xcc,	%f5,	%f29
	andcc	%o4,	0x1682,	%g5
	fsrc1	%f10,	%f0
	movle	%xcc,	%o0,	%i5
	movl	%icc,	%i4,	%l0
	sdivx	%i3,	0x0ECC,	%g7
	fmovdneg	%icc,	%f29,	%f24
	srl	%i7,	%l4,	%l3
	fmovdne	%icc,	%f23,	%f19
	fcmpgt32	%f28,	%f12,	%l1
	or	%l2,	%g1,	%l5
	fmovsa	%xcc,	%f31,	%f27
	movrlz	%o2,	0x0C9,	%g4
	popc	0x1FE5,	%o3
	edge8	%i6,	%o7,	%i2
	fnors	%f12,	%f12,	%f27
	movvc	%xcc,	%o5,	%o6
	nop
	set	0x70, %o5
	stx	%g3,	[%l7 + %o5]
	array16	%o1,	%g6,	%g2
	fmovsa	%xcc,	%f21,	%f8
	sub	%i1,	0x1EBD,	%l6
	stw	%o4,	[%l7 + 0x14]
	mulscc	%g5,	0x08F1,	%i0
	lduh	[%l7 + 0x4C],	%i5
	popc	%o0,	%i4
	ldub	[%l7 + 0x68],	%l0
	addcc	%g7,	%i7,	%l4
	udivcc	%i3,	0x1B6F,	%l1
	xnor	%l3,	%l2,	%g1
	fandnot1s	%f1,	%f17,	%f10
	movrne	%o2,	%g4,	%o3
	fmovsleu	%icc,	%f14,	%f26
	and	%l5,	%i6,	%o7
	movne	%xcc,	%o5,	%i2
	smul	%o6,	%g3,	%g6
	fmovrslez	%g2,	%f25,	%f22
	smul	%i1,	%o1,	%l6
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	movneg	%icc,	%i5,	%o0
	fpack32	%f10,	%f2,	%f10
	movneg	%xcc,	%i4,	%l0
	umulcc	%g7,	0x04A1,	%l4
	smul	%i7,	%i3,	%l3
	array16	%l2,	%l1,	%g1
	ld	[%l7 + 0x38],	%f12
	movrgez	%o2,	0x0C6,	%o3
	smulcc	%l5,	%i6,	%o7
	sub	%g4,	%i2,	%o5
	mova	%icc,	%g3,	%o6
	restore %g2, %i1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l6,	%g6
	sllx	%o4,	%g5,	%i5
	movre	%i0,	0x0C6,	%i4
	sra	%l0,	%o0,	%l4
	sll	%i7,	%g7,	%i3
	edge8n	%l2,	%l3,	%l1
	stb	%g1,	[%l7 + 0x62]
	fmovda	%xcc,	%f9,	%f9
	fxnors	%f12,	%f27,	%f8
	fxors	%f23,	%f24,	%f30
	smulcc	%o2,	%o3,	%l5
	addc	%i6,	0x10F4,	%o7
	ldub	[%l7 + 0x70],	%g4
	fmovrdgez	%o5,	%f10,	%f30
	fmovdpos	%xcc,	%f1,	%f24
	sir	0x17DF
	sir	0x0A48
	udivx	%g3,	0x0E14,	%o6
	andn	%i2,	0x1655,	%g2
	mulscc	%o1,	0x14F8,	%i1
	std	%f6,	[%l7 + 0x18]
	and	%g6,	%o4,	%l6
	udivx	%g5,	0x02BB,	%i0
	array8	%i4,	%i5,	%l0
	movg	%xcc,	%l4,	%i7
	xorcc	%g7,	%o0,	%i3
	lduh	[%l7 + 0x64],	%l2
	movneg	%icc,	%l3,	%l1
	sdivcc	%o2,	0x0FBA,	%o3
	fmul8sux16	%f30,	%f24,	%f20
	fmovsleu	%icc,	%f10,	%f5
	ldub	[%l7 + 0x68],	%g1
	fmovrdne	%l5,	%f8,	%f24
	edge32	%i6,	%o7,	%g4
	srlx	%o5,	%g3,	%i2
	edge32	%o6,	%o1,	%g2
	movne	%xcc,	%g6,	%i1
	movl	%xcc,	%o4,	%g5
	orcc	%l6,	%i4,	%i0
	xor	%l0,	0x0A9C,	%i5
	edge8n	%l4,	%g7,	%i7
	movl	%icc,	%i3,	%o0
	ldsh	[%l7 + 0x48],	%l3
	movre	%l1,	%o2,	%o3
	movrgz	%g1,	0x0AC,	%l5
	andncc	%l2,	%i6,	%g4
	movrgez	%o5,	0x281,	%o7
	movcc	%xcc,	%g3,	%o6
	subc	%o1,	%i2,	%g6
	ld	[%l7 + 0x30],	%f23
	subcc	%i1,	0x1C64,	%g2
	array32	%o4,	%g5,	%i4
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	umulcc	%l6,	%l4,	%g7
	movle	%xcc,	%i7,	%o0
	fxor	%f14,	%f8,	%f8
	fmovse	%icc,	%f8,	%f11
	xnorcc	%i3,	0x1B8A,	%l1
	smul	%o2,	%o3,	%l3
	mova	%xcc,	%g1,	%l2
	fxor	%f16,	%f20,	%f28
	movcs	%xcc,	%i6,	%l5
	umul	%o5,	%g4,	%o7
	movrlz	%g3,	%o6,	%i2
	lduh	[%l7 + 0x46],	%o1
	array32	%i1,	%g6,	%g2
	movcc	%xcc,	%o4,	%i4
	sdivx	%i0,	0x16C1,	%l0
	ldsb	[%l7 + 0x2F],	%i5
	edge32ln	%g5,	%l6,	%g7
	ldsh	[%l7 + 0x76],	%l4
	edge16n	%i7,	%i3,	%o0
	sllx	%l1,	0x19,	%o3
	edge32	%l3,	%o2,	%g1
	smulcc	%l2,	%i6,	%o5
	andncc	%l5,	%g4,	%g3
	edge8ln	%o6,	%o7,	%i2
	fmovrdne	%i1,	%f0,	%f22
	movge	%icc,	%o1,	%g2
	udivcc	%o4,	0x02A8,	%g6
	array32	%i0,	%l0,	%i5
	edge32ln	%g5,	%l6,	%i4
	edge16n	%l4,	%g7,	%i3
	and	%o0,	0x031F,	%i7
	addc	%o3,	0x0B1A,	%l3
	stx	%o2,	[%l7 + 0x50]
	edge32ln	%g1,	%l1,	%l2
	mova	%icc,	%i6,	%o5
	addcc	%l5,	0x1C1B,	%g3
	edge16l	%g4,	%o6,	%i2
	ldsb	[%l7 + 0x71],	%o7
	fsrc2s	%f5,	%f0
	lduw	[%l7 + 0x1C],	%o1
	movne	%xcc,	%g2,	%o4
	edge32l	%g6,	%i1,	%l0
	movvs	%icc,	%i0,	%i5
	nop
	set	0x20, %i3
	lduw	[%l7 + %i3],	%l6
	edge8ln	%i4,	%l4,	%g7
	and	%i3,	%o0,	%g5
	udiv	%o3,	0x1259,	%i7
	fsrc1s	%f22,	%f20
	ldub	[%l7 + 0x34],	%l3
	lduh	[%l7 + 0x5C],	%g1
	orncc	%o2,	0x0FC9,	%l2
	smul	%l1,	0x0B6B,	%i6
	ldsw	[%l7 + 0x60],	%l5
	addc	%g3,	%o5,	%g4
	movvc	%icc,	%o6,	%o7
	movrlz	%o1,	0x20A,	%i2
	movg	%icc,	%o4,	%g2
	edge16	%g6,	%l0,	%i1
	umul	%i0,	0x17CD,	%l6
	fmovsa	%icc,	%f25,	%f13
	subccc	%i4,	%i5,	%l4
	addcc	%i3,	0x1750,	%o0
	smul	%g5,	%g7,	%i7
	fmovdn	%xcc,	%f18,	%f8
	edge8ln	%l3,	%g1,	%o2
	sra	%o3,	%l1,	%i6
	subccc	%l5,	0x08AC,	%l2
	and	%o5,	%g3,	%g4
	edge32	%o6,	%o7,	%o1
	edge32l	%o4,	%i2,	%g6
	movl	%xcc,	%g2,	%i1
	or	%l0,	%i0,	%l6
	movpos	%xcc,	%i4,	%l4
	ldx	[%l7 + 0x68],	%i5
	udivcc	%i3,	0x19EA,	%o0
	sll	%g7,	%g5,	%l3
	srl	%g1,	0x12,	%o2
	xnor	%o3,	%l1,	%i6
	movleu	%xcc,	%l5,	%l2
	fmovrdgez	%i7,	%f14,	%f2
	movge	%xcc,	%g3,	%o5
	sll	%o6,	0x0E,	%g4
	sdiv	%o1,	0x1CBE,	%o4
	fpadd32	%f4,	%f30,	%f16
	fone	%f28
	lduw	[%l7 + 0x6C],	%o7
	addc	%i2,	0x0EA0,	%g6
	fmovsle	%xcc,	%f21,	%f3
	orncc	%i1,	%g2,	%i0
	fpsub32s	%f22,	%f24,	%f22
	add	%l6,	%l0,	%i4
	std	%f18,	[%l7 + 0x10]
	fmovdcc	%xcc,	%f27,	%f14
	movcs	%xcc,	%i5,	%l4
	srlx	%o0,	%g7,	%g5
	fmul8x16au	%f0,	%f23,	%f4
	std	%f6,	[%l7 + 0x58]
	fmovdcs	%icc,	%f23,	%f17
	edge16l	%l3,	%i3,	%o2
	ld	[%l7 + 0x70],	%f29
	xorcc	%g1,	%l1,	%i6
	srax	%l5,	0x13,	%o3
	orcc	%i7,	0x0F4B,	%l2
	array32	%g3,	%o6,	%g4
	orn	%o5,	%o4,	%o1
	fmovrde	%o7,	%f26,	%f22
	fors	%f23,	%f7,	%f25
	edge8n	%i2,	%i1,	%g2
	sdivcc	%i0,	0x0BC6,	%g6
	movrne	%l0,	%i4,	%i5
	orn	%l6,	%l4,	%g7
	or	%o0,	%g5,	%l3
	edge32	%o2,	%i3,	%g1
	st	%f20,	[%l7 + 0x3C]
	movgu	%icc,	%l1,	%i6
	subccc	%l5,	%o3,	%i7
	fpmerge	%f7,	%f31,	%f4
	movrne	%l2,	%o6,	%g3
	xorcc	%o5,	0x0816,	%g4
	sll	%o1,	0x14,	%o4
	subc	%i2,	0x0F4C,	%i1
	sll	%g2,	0x0C,	%o7
	fsrc1	%f4,	%f20
	fornot2s	%f26,	%f13,	%f2
	movpos	%icc,	%g6,	%l0
	sllx	%i0,	0x1A,	%i5
	edge16l	%i4,	%l6,	%l4
	fcmpes	%fcc1,	%f26,	%f17
	sdivx	%o0,	0x1D9F,	%g7
	movcs	%icc,	%l3,	%o2
	ldsw	[%l7 + 0x08],	%i3
	xor	%g1,	0x0CA7,	%g5
	srlx	%i6,	%l1,	%l5
	fmovsa	%icc,	%f30,	%f15
	fpadd16	%f30,	%f16,	%f4
	fmovrdgez	%o3,	%f14,	%f8
	ldsw	[%l7 + 0x5C],	%l2
	fornot2	%f16,	%f0,	%f24
	movge	%xcc,	%o6,	%g3
	sra	%o5,	0x14,	%i7
	fcmpgt16	%f16,	%f30,	%g4
	movleu	%xcc,	%o4,	%i2
	movvs	%icc,	%i1,	%g2
	addc	%o1,	%o7,	%l0
	fnot2	%f10,	%f8
	st	%f30,	[%l7 + 0x38]
	andncc	%g6,	%i0,	%i4
	movgu	%xcc,	%i5,	%l6
	movl	%icc,	%l4,	%o0
	save %g7, 0x0479, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l3,	%i3,	%g5
	fnands	%f30,	%f24,	%f22
	fmovsle	%icc,	%f31,	%f9
	fnegd	%f20,	%f8
	array8	%g1,	%i6,	%l5
	movcc	%icc,	%o3,	%l2
	movrne	%o6,	%g3,	%o5
	stx	%i7,	[%l7 + 0x50]
	srax	%l1,	%o4,	%i2
	fors	%f21,	%f15,	%f14
	add	%g4,	%i1,	%o1
	fmovd	%f4,	%f22
	ldub	[%l7 + 0x30],	%o7
	movvs	%xcc,	%l0,	%g6
	sethi	0x1130,	%g2
	edge16	%i4,	%i0,	%i5
	ldsh	[%l7 + 0x46],	%l6
	fcmpgt16	%f6,	%f28,	%o0
	xnor	%g7,	%o2,	%l3
	orcc	%l4,	%g5,	%i3
	fornot1	%f4,	%f22,	%f8
	restore %i6, 0x0FB4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f6,	%f8,	%f26
	umul	%l5,	0x1FA3,	%o3
	smulcc	%l2,	0x0C1F,	%o6
	st	%f2,	[%l7 + 0x60]
	sra	%o5,	0x0B,	%g3
	movcc	%xcc,	%i7,	%o4
	movg	%xcc,	%l1,	%i2
	ldsb	[%l7 + 0x23],	%g4
	subccc	%i1,	%o1,	%o7
	movvc	%xcc,	%l0,	%g6
	fnot2	%f12,	%f6
	fmovdl	%icc,	%f19,	%f8
	umulcc	%g2,	0x1AC6,	%i0
	sethi	0x1504,	%i4
	fpadd32s	%f31,	%f25,	%f11
	stb	%i5,	[%l7 + 0x58]
	fmovdgu	%xcc,	%f17,	%f24
	movge	%icc,	%l6,	%o0
	movrgez	%o2,	0x073,	%g7
	andn	%l3,	0x0537,	%g5
	fmovsge	%icc,	%f31,	%f24
	fmovsne	%icc,	%f11,	%f30
	stw	%i3,	[%l7 + 0x40]
	lduw	[%l7 + 0x64],	%i6
	move	%icc,	%g1,	%l4
	fmovsn	%xcc,	%f23,	%f20
	movcc	%icc,	%o3,	%l5
	mulscc	%o6,	%o5,	%l2
	array8	%i7,	%o4,	%g3
	fmovdcs	%icc,	%f30,	%f19
	umul	%i2,	%g4,	%l1
	udivx	%i1,	0x0C03,	%o7
	stw	%o1,	[%l7 + 0x38]
	ldub	[%l7 + 0x4D],	%l0
	edge8ln	%g6,	%i0,	%g2
	and	%i5,	0x191D,	%l6
	save %o0, 0x0437, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g7,	%l3,	%g5
	fornot1	%f14,	%f28,	%f2
	fnor	%f10,	%f24,	%f12
	ldsh	[%l7 + 0x10],	%i3
	array32	%o2,	%i6,	%l4
	fmovdvc	%icc,	%f5,	%f17
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	sdiv	%o3,	0x16F0,	%o5
	sub	%l2,	0x0D4A,	%o4
	udiv	%g3,	0x0A97,	%i2
	sir	0x1664
	edge16ln	%i7,	%g4,	%i1
	udivcc	%o7,	0x0FD1,	%l1
	subcc	%l0,	%g6,	%o1
	sra	%g2,	0x1E,	%i0
	ldsb	[%l7 + 0x0B],	%i5
	ldub	[%l7 + 0x79],	%o0
	andncc	%l6,	%g7,	%i4
	mova	%icc,	%g5,	%l3
	ldd	[%l7 + 0x18],	%i2
	fornot2	%f18,	%f24,	%f16
	fpadd16s	%f27,	%f10,	%f1
	and	%i6,	0x07D8,	%o2
	add	%g1,	0x0289,	%l5
	ldsb	[%l7 + 0x48],	%l4
	sllx	%o3,	%o6,	%l2
	mova	%icc,	%o5,	%g3
	stx	%o4,	[%l7 + 0x48]
	srl	%i7,	0x0C,	%g4
	fsrc1	%f6,	%f26
	fmovrslz	%i1,	%f28,	%f27
	movvc	%icc,	%i2,	%o7
	subc	%l1,	%l0,	%g6
	smul	%g2,	%i0,	%i5
	fsrc2	%f8,	%f26
	restore %o0, 0x1192, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f4,	%f20
	movrgz	%o1,	%g7,	%g5
	sll	%l3,	0x17,	%i3
	array16	%i4,	%o2,	%g1
	andcc	%i6,	0x18F5,	%l5
	fpsub32s	%f30,	%f31,	%f21
	orcc	%l4,	%o3,	%o6
	ldsb	[%l7 + 0x65],	%l2
	faligndata	%f0,	%f28,	%f0
	sdivcc	%o5,	0x0513,	%g3
	fpsub16s	%f30,	%f28,	%f7
	subcc	%o4,	%g4,	%i7
	or	%i2,	0x1181,	%o7
	movleu	%icc,	%i1,	%l1
	array8	%l0,	%g2,	%g6
	edge32l	%i5,	%i0,	%l6
	ldd	[%l7 + 0x78],	%o0
	addcc	%g7,	0x01BE,	%g5
	movleu	%icc,	%o0,	%i3
	mulscc	%l3,	0x08DC,	%o2
	sra	%i4,	%g1,	%l5
	movrne	%l4,	0x176,	%o3
	siam	0x0
	ldx	[%l7 + 0x50],	%i6
	xnor	%l2,	0x16A7,	%o5
	movrne	%g3,	0x1BD,	%o6
	edge8n	%o4,	%g4,	%i2
	fmovs	%f4,	%f27
	lduw	[%l7 + 0x4C],	%o7
	movleu	%icc,	%i7,	%l1
	smul	%i1,	%l0,	%g2
	movrgz	%g6,	0x063,	%i0
	edge8n	%i5,	%o1,	%g7
	movge	%icc,	%g5,	%l6
	popc	%i3,	%l3
	xnorcc	%o2,	0x02CE,	%i4
	fmovrdne	%o0,	%f2,	%f14
	save %l5, %g1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x28, %o4
	ldsh	[%l7 + %o4],	%o3
	fornot2s	%f9,	%f25,	%f29
	stw	%l2,	[%l7 + 0x0C]
	andn	%o5,	%i6,	%g3
	movcs	%icc,	%o4,	%g4
	fsrc1	%f10,	%f8
	fpack16	%f4,	%f20
	edge32ln	%i2,	%o6,	%i7
	subcc	%o7,	0x0FEC,	%i1
	xorcc	%l0,	%g2,	%g6
	addccc	%l1,	0x0170,	%i5
	array16	%o1,	%g7,	%i0
	sethi	0x1F28,	%l6
	lduh	[%l7 + 0x7E],	%g5
	srax	%i3,	0x1E,	%l3
	subcc	%i4,	0x119A,	%o2
	smul	%l5,	0x14AE,	%o0
	udivx	%l4,	0x114F,	%o3
	xorcc	%l2,	0x1F71,	%g1
	xnorcc	%o5,	0x19EC,	%g3
	stx	%i6,	[%l7 + 0x08]
	sdiv	%g4,	0x1B69,	%o4
	movrgez	%i2,	%i7,	%o6
	sir	0x1D0A
	array8	%i1,	%o7,	%g2
	andcc	%g6,	%l0,	%l1
	array32	%i5,	%o1,	%i0
	save %l6, %g7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f4,	%f1,	%f20
	sllx	%l3,	0x17,	%i3
	move	%icc,	%i4,	%o2
	save %l5, 0x057D, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f24,	%f0,	%f1
	fandnot2	%f28,	%f2,	%f8
	edge8n	%o3,	%l4,	%l2
	fandnot1	%f6,	%f4,	%f4
	xorcc	%o5,	0x0B6D,	%g1
	fornot2	%f0,	%f6,	%f10
	movvc	%xcc,	%g3,	%i6
	movrgz	%o4,	%g4,	%i2
	subccc	%i7,	%o6,	%o7
	edge16ln	%g2,	%g6,	%i1
	xnor	%l1,	%l0,	%o1
	udivcc	%i0,	0x1E59,	%l6
	movle	%xcc,	%g7,	%i5
	alignaddr	%l3,	%g5,	%i4
	movgu	%xcc,	%o2,	%l5
	srlx	%o0,	%o3,	%l4
	movg	%icc,	%l2,	%i3
	xnorcc	%o5,	0x04DC,	%g1
	fmovd	%f28,	%f18
	umul	%g3,	0x1BD4,	%i6
	fmovsneg	%icc,	%f2,	%f14
	movre	%o4,	%g4,	%i7
	ldub	[%l7 + 0x7C],	%o6
	udivcc	%o7,	0x0D03,	%i2
	edge16	%g2,	%i1,	%l1
	alignaddr	%l0,	%g6,	%i0
	movcc	%icc,	%o1,	%l6
	xor	%g7,	%l3,	%i5
	ldsh	[%l7 + 0x16],	%i4
	ldsh	[%l7 + 0x7E],	%g5
	fsrc1	%f26,	%f2
	fornot1s	%f7,	%f3,	%f9
	movre	%l5,	%o0,	%o3
	subccc	%o2,	%l4,	%i3
	edge32ln	%l2,	%o5,	%g3
	fmovdpos	%xcc,	%f14,	%f5
	smul	%i6,	%g1,	%g4
	edge32l	%o4,	%i7,	%o7
	fcmple32	%f16,	%f20,	%o6
	ldsw	[%l7 + 0x0C],	%g2
	mulx	%i1,	%l1,	%i2
	movneg	%icc,	%g6,	%l0
	edge16ln	%i0,	%l6,	%o1
	udivx	%g7,	0x0DB8,	%l3
	orncc	%i4,	%g5,	%l5
	movge	%icc,	%o0,	%o3
	fmovsneg	%icc,	%f16,	%f22
	sth	%o2,	[%l7 + 0x52]
	movle	%icc,	%l4,	%i3
	movrne	%l2,	0x3FD,	%o5
	fcmpgt32	%f6,	%f26,	%i5
	umulcc	%i6,	0x1271,	%g1
	movne	%xcc,	%g3,	%g4
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	ldx	[%l7 + 0x30],	%o6
	array16	%g2,	%o7,	%i1
	fpsub32	%f28,	%f2,	%f20
	fmovrslez	%i2,	%f10,	%f30
	siam	0x3
	edge32ln	%g6,	%l1,	%i0
	movpos	%icc,	%l0,	%l6
	movneg	%icc,	%o1,	%l3
	sethi	0x19B4,	%i4
	fmovd	%f8,	%f18
	andn	%g5,	0x08EA,	%g7
	srax	%o0,	%o3,	%l5
	fmul8x16al	%f9,	%f25,	%f20
	ldub	[%l7 + 0x12],	%o2
	fnor	%f20,	%f2,	%f8
	mulscc	%l4,	%l2,	%o5
	movrgez	%i3,	%i5,	%g1
	add	%g3,	0x0455,	%i6
	fcmpd	%fcc3,	%f16,	%f0
	edge16n	%o4,	%g4,	%i7
	lduw	[%l7 + 0x28],	%g2
	save %o7, 0x19F6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x50],	%i2
	xorcc	%g6,	%l1,	%i1
	andn	%l0,	%l6,	%i0
	nop
	set	0x53, %i5
	ldub	[%l7 + %i5],	%o1
	fabsd	%f4,	%f4
	fmovdn	%icc,	%f17,	%f15
	movrgez	%i4,	0x017,	%l3
	movre	%g7,	0x3F1,	%g5
	fnand	%f0,	%f12,	%f8
	orncc	%o0,	%l5,	%o3
	ldd	[%l7 + 0x10],	%f0
	edge16l	%o2,	%l4,	%l2
	xnor	%i3,	%i5,	%g1
	fornot1	%f14,	%f10,	%f24
	edge32l	%g3,	%o5,	%o4
	edge32	%g4,	%i6,	%i7
	fpsub32s	%f1,	%f11,	%f27
	add	%g2,	%o7,	%o6
	xnorcc	%i2,	0x1DF5,	%l1
	movcs	%xcc,	%g6,	%l0
	movn	%xcc,	%i1,	%i0
	fors	%f24,	%f1,	%f16
	sll	%o1,	%l6,	%i4
	ldsw	[%l7 + 0x20],	%g7
	edge32l	%l3,	%g5,	%o0
	movrgez	%o3,	%l5,	%l4
	fcmple16	%f6,	%f8,	%o2
	ldd	[%l7 + 0x18],	%l2
	srl	%i5,	0x00,	%g1
	movleu	%icc,	%g3,	%i3
	ld	[%l7 + 0x58],	%f24
	fmovrse	%o4,	%f2,	%f6
	movge	%xcc,	%g4,	%o5
	ldsw	[%l7 + 0x28],	%i7
	stb	%g2,	[%l7 + 0x0C]
	movgu	%icc,	%o7,	%i6
	movvs	%icc,	%o6,	%i2
	and	%l1,	0x1E07,	%g6
	fpadd32s	%f28,	%f7,	%f6
	edge16l	%l0,	%i0,	%i1
	addccc	%l6,	%i4,	%o1
	andcc	%l3,	%g5,	%g7
	edge16l	%o3,	%l5,	%o0
	edge16	%o2,	%l2,	%i5
	orncc	%g1,	0x14CF,	%g3
	sllx	%l4,	0x0D,	%o4
	fexpand	%f29,	%f0
	srax	%g4,	0x0A,	%o5
	fmovrslez	%i3,	%f18,	%f17
	stw	%i7,	[%l7 + 0x08]
	fornot1	%f12,	%f6,	%f10
	movgu	%xcc,	%o7,	%g2
	edge16ln	%i6,	%i2,	%l1
	edge32	%o6,	%g6,	%l0
	or	%i1,	0x0968,	%i0
	movre	%l6,	%i4,	%o1
	edge8n	%g5,	%g7,	%l3
	edge32n	%l5,	%o3,	%o2
	edge8	%l2,	%i5,	%o0
	std	%f16,	[%l7 + 0x18]
	std	%f2,	[%l7 + 0x60]
	ldd	[%l7 + 0x58],	%f4
	movrne	%g3,	0x12C,	%l4
	fmovrslez	%o4,	%f7,	%f26
	xor	%g4,	%o5,	%i3
	movgu	%icc,	%g1,	%o7
	popc	%i7,	%i6
	edge8n	%g2,	%i2,	%l1
	smul	%g6,	0x188F,	%l0
	fmovdgu	%xcc,	%f5,	%f6
	sth	%o6,	[%l7 + 0x68]
	srax	%i1,	%i0,	%l6
	movrlz	%i4,	%o1,	%g5
	sir	0x0554
	fmovsle	%xcc,	%f27,	%f0
	smulcc	%g7,	%l3,	%o3
	edge32ln	%l5,	%l2,	%i5
	pdist	%f22,	%f8,	%f26
	sub	%o0,	0x118D,	%g3
	movcs	%icc,	%l4,	%o4
	srlx	%o2,	0x06,	%o5
	fmovdg	%icc,	%f25,	%f21
	movvc	%xcc,	%g4,	%g1
	addcc	%o7,	%i3,	%i6
	ldx	[%l7 + 0x50],	%g2
	movrlz	%i2,	0x37F,	%l1
	fones	%f12
	movre	%g6,	%i7,	%o6
	fnegs	%f1,	%f6
	smul	%l0,	0x0D06,	%i1
	edge8ln	%i0,	%i4,	%o1
	sll	%g5,	%g7,	%l6
	fpack16	%f14,	%f17
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%l3
	andcc	%l5,	%o3,	%i5
	fpsub16	%f26,	%f2,	%f30
	add	%o0,	%g3,	%l2
	restore %l4, 0x08CA, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	0x364,	%o5
	lduh	[%l7 + 0x62],	%g4
	fnot2	%f0,	%f4
	popc	%g1,	%o7
	movne	%icc,	%i6,	%i3
	alignaddrl	%i2,	%l1,	%g2
	edge8n	%g6,	%i7,	%l0
	movge	%xcc,	%o6,	%i1
	lduh	[%l7 + 0x0A],	%i0
	srlx	%o1,	%i4,	%g7
	movvs	%xcc,	%l6,	%g5
	subc	%l5,	%l3,	%o3
	movcc	%icc,	%i5,	%o0
	alignaddrl	%g3,	%l4,	%o4
	movrne	%l2,	0x24A,	%o5
	umulcc	%o2,	0x0956,	%g4
	subcc	%g1,	0x0794,	%i6
	ld	[%l7 + 0x60],	%f4
	andcc	%o7,	%i2,	%i3
	xorcc	%g2,	%g6,	%i7
	movne	%xcc,	%l1,	%o6
	sllx	%i1,	%i0,	%o1
	movle	%xcc,	%i4,	%l0
	addcc	%g7,	0x03D9,	%l6
	ldub	[%l7 + 0x35],	%l5
	sir	0x1F36
	movrne	%g5,	0x055,	%l3
	lduh	[%l7 + 0x0A],	%o3
	ldub	[%l7 + 0x57],	%i5
	fmovrdne	%g3,	%f14,	%f2
	fmovda	%xcc,	%f12,	%f22
	edge8ln	%o0,	%l4,	%o4
	movrlez	%l2,	0x22D,	%o5
	movvs	%icc,	%g4,	%g1
	movne	%xcc,	%i6,	%o2
	fone	%f22
	addc	%i2,	0x1194,	%i3
	fmovdle	%icc,	%f18,	%f13
	ldd	[%l7 + 0x78],	%o6
	fmovrdgz	%g2,	%f16,	%f30
	mulscc	%i7,	0x1047,	%l1
	ldd	[%l7 + 0x50],	%o6
	alignaddr	%i1,	%i0,	%o1
	movcs	%icc,	%g6,	%i4
	orncc	%g7,	0x0DD0,	%l0
	sll	%l6,	0x03,	%g5
	sllx	%l3,	0x08,	%o3
	sir	0x149B
	ldd	[%l7 + 0x08],	%f2
	edge8l	%l5,	%g3,	%i5
	xorcc	%o0,	0x09B6,	%o4
	edge16l	%l4,	%l2,	%o5
	smul	%g4,	%g1,	%i6
	xnorcc	%i2,	%o2,	%o7
	array8	%g2,	%i7,	%i3
	lduh	[%l7 + 0x34],	%o6
	ld	[%l7 + 0x64],	%f27
	movvc	%icc,	%i1,	%l1
	fpadd32	%f20,	%f26,	%f14
	edge8	%o1,	%g6,	%i4
	fnands	%f25,	%f10,	%f19
	movre	%g7,	0x23C,	%i0
	movg	%icc,	%l0,	%l6
	ldsb	[%l7 + 0x42],	%g5
	popc	%l3,	%o3
	array32	%l5,	%g3,	%i5
	edge8n	%o4,	%l4,	%l2
	fmovrde	%o5,	%f16,	%f28
	lduh	[%l7 + 0x10],	%g4
	umul	%g1,	%i6,	%o0
	stb	%o2,	[%l7 + 0x29]
	add	%o7,	0x1796,	%g2
	movleu	%xcc,	%i2,	%i3
	sra	%o6,	%i7,	%l1
	movle	%icc,	%o1,	%g6
	movvc	%xcc,	%i4,	%i1
	save %g7, 0x09CF, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l6,	%g5,	%l3
	addc	%l0,	%l5,	%g3
	popc	0x00D2,	%i5
	fmul8x16al	%f7,	%f4,	%f4
	sdiv	%o4,	0x168F,	%l4
	andncc	%l2,	%o3,	%g4
	mova	%icc,	%g1,	%i6
	fmovse	%xcc,	%f8,	%f14
	smulcc	%o0,	%o5,	%o2
	ldsb	[%l7 + 0x1C],	%o7
	fmovscs	%icc,	%f10,	%f4
	xor	%i2,	%g2,	%i3
	xnorcc	%i7,	0x1276,	%o6
	sllx	%l1,	0x06,	%o1
	fornot2	%f4,	%f20,	%f14
	popc	%g6,	%i4
	xorcc	%g7,	%i1,	%l6
	andcc	%i0,	0x028C,	%g5
	edge32l	%l3,	%l5,	%l0
	movgu	%icc,	%i5,	%g3
	edge16l	%l4,	%o4,	%o3
	umul	%l2,	0x06D3,	%g4
	fmovscs	%icc,	%f12,	%f17
	movvs	%icc,	%g1,	%o0
	movvc	%icc,	%o5,	%o2
	edge32	%i6,	%o7,	%g2
	movrlez	%i2,	%i3,	%o6
	fmul8x16	%f20,	%f12,	%f10
	fmovrsgez	%i7,	%f25,	%f7
	srax	%l1,	%o1,	%i4
	ldsw	[%l7 + 0x34],	%g7
	udivcc	%i1,	0x1FD1,	%l6
	movge	%xcc,	%i0,	%g5
	movle	%xcc,	%g6,	%l3
	movcs	%icc,	%l0,	%l5
	fmovdn	%xcc,	%f20,	%f13
	stw	%i5,	[%l7 + 0x4C]
	st	%f11,	[%l7 + 0x4C]
	fpack16	%f20,	%f17
	edge8ln	%l4,	%g3,	%o4
	alignaddrl	%o3,	%g4,	%g1
	movle	%icc,	%l2,	%o0
	edge16l	%o2,	%o5,	%o7
	subc	%i6,	%g2,	%i2
	mulx	%i3,	0x00A1,	%o6
	sir	0x022A
	fands	%f18,	%f24,	%f16
	fmovdle	%icc,	%f23,	%f29
	movpos	%icc,	%l1,	%i7
	fcmple32	%f16,	%f26,	%i4
	ld	[%l7 + 0x18],	%f4
	fornot1s	%f29,	%f26,	%f6
	popc	0x048A,	%g7
	edge32l	%o1,	%i1,	%i0
	add	%l6,	%g6,	%g5
	save %l0, 0x1746, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i5,	%l3,	%g3
	fmovdvs	%icc,	%f2,	%f20
	ldd	[%l7 + 0x58],	%f30
	fpsub16s	%f29,	%f26,	%f25
	fmul8sux16	%f20,	%f16,	%f26
	fmovdvc	%icc,	%f15,	%f3
	st	%f29,	[%l7 + 0x38]
	movcc	%xcc,	%l4,	%o4
	stx	%g4,	[%l7 + 0x70]
	ldsh	[%l7 + 0x3C],	%o3
	alignaddrl	%l2,	%o0,	%o2
	movvs	%icc,	%g1,	%o7
	fandnot2	%f4,	%f30,	%f10
	xor	%o5,	0x1AB4,	%i6
	fmovdcc	%xcc,	%f0,	%f17
	movre	%i2,	0x1C6,	%g2
	sra	%i3,	%o6,	%i7
	movvs	%icc,	%i4,	%g7
	orn	%o1,	%i1,	%i0
	fexpand	%f8,	%f6
	edge16ln	%l1,	%g6,	%l6
	popc	%l0,	%l5
	xorcc	%i5,	%l3,	%g5
	nop
	set	0x2B, %o2
	ldsb	[%l7 + %o2],	%g3
	ldd	[%l7 + 0x70],	%o4
	movrgez	%g4,	0x2C9,	%o3
	movpos	%xcc,	%l2,	%o0
	movrne	%o2,	%l4,	%o7
	edge8l	%g1,	%i6,	%o5
	popc	0x0B96,	%i2
	fmuld8ulx16	%f7,	%f1,	%f26
	umul	%g2,	0x1AB6,	%o6
	addc	%i7,	0x1027,	%i3
	sll	%g7,	0x07,	%i4
	edge32n	%i1,	%o1,	%l1
	lduw	[%l7 + 0x1C],	%g6
	fcmpeq32	%f10,	%f2,	%l6
	edge32n	%l0,	%l5,	%i5
	ldsb	[%l7 + 0x23],	%l3
	mova	%xcc,	%i0,	%g5
	subcc	%g3,	0x096B,	%g4
	sth	%o3,	[%l7 + 0x20]
	umul	%l2,	%o4,	%o0
	and	%o2,	0x0A7E,	%l4
	move	%icc,	%g1,	%i6
	movg	%xcc,	%o7,	%i2
	edge32l	%o5,	%o6,	%i7
	move	%xcc,	%g2,	%g7
	mulscc	%i3,	0x1A93,	%i4
	fmovde	%xcc,	%f11,	%f30
	lduh	[%l7 + 0x3E],	%o1
	srl	%l1,	0x05,	%i1
	sra	%g6,	0x00,	%l6
	movpos	%icc,	%l5,	%l0
	sir	0x0D8E
	movrgz	%i5,	0x2D0,	%i0
	ldd	[%l7 + 0x30],	%l2
	udivcc	%g3,	0x0594,	%g4
	edge8l	%o3,	%g5,	%l2
	addcc	%o0,	0x0D58,	%o4
	mulx	%l4,	0x1A1D,	%o2
	srlx	%g1,	0x1F,	%o7
	edge16l	%i2,	%o5,	%i6
	udivcc	%i7,	0x0E0C,	%g2
	edge8ln	%g7,	%o6,	%i4
	nop
	set	0x70, %l3
	lduw	[%l7 + %l3],	%o1
	stb	%i3,	[%l7 + 0x33]
	srlx	%l1,	0x1D,	%g6
	srax	%i1,	%l5,	%l6
	xnor	%i5,	%l0,	%i0
	orcc	%g3,	0x0EB9,	%g4
	save %o3, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o0,	0x0012,	%l3
	ldd	[%l7 + 0x50],	%f2
	sra	%l4,	%o2,	%g1
	fpadd32s	%f22,	%f19,	%f14
	fmovrdne	%o7,	%f12,	%f2
	fmovsvc	%xcc,	%f2,	%f31
	fandnot2	%f14,	%f28,	%f8
	addcc	%i2,	%o4,	%o5
	xnorcc	%i7,	%i6,	%g7
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	movg	%icc,	%i3,	%l1
	movcc	%xcc,	%g6,	%i1
	sethi	0x12E5,	%g2
	movrgz	%l5,	0x147,	%i5
	fmovsl	%xcc,	%f0,	%f0
	smulcc	%l6,	%l0,	%g3
	or	%g4,	0x121E,	%i0
	popc	0x059E,	%g5
	movrgez	%o3,	%l2,	%l3
	fmovdleu	%icc,	%f21,	%f22
	fpmerge	%f0,	%f21,	%f10
	orcc	%l4,	%o0,	%o2
	edge16n	%o7,	%i2,	%o4
	save %g1, 0x0C92, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o5,	%g7
	fmovdle	%xcc,	%f12,	%f10
	edge16l	%i6,	%o6,	%o1
	edge16	%i4,	%l1,	%g6
	umulcc	%i1,	0x02DE,	%g2
	fsrc2s	%f6,	%f24
	addccc	%l5,	0x159A,	%i5
	move	%icc,	%l6,	%l0
	edge16ln	%g3,	%i3,	%g4
	movgu	%xcc,	%i0,	%o3
	movrgz	%g5,	%l2,	%l4
	umul	%o0,	%l3,	%o7
	sll	%i2,	%o2,	%o4
	subc	%i7,	%o5,	%g1
	movcc	%icc,	%g7,	%o6
	movrgz	%i6,	0x365,	%o1
	edge8l	%i4,	%l1,	%i1
	for	%f30,	%f16,	%f12
	or	%g6,	%g2,	%l5
	edge16l	%i5,	%l6,	%g3
	xor	%l0,	%i3,	%i0
	sra	%g4,	%g5,	%l2
	fcmple32	%f16,	%f2,	%l4
	fzero	%f4
	fmovsvs	%icc,	%f2,	%f10
	fmul8x16	%f31,	%f16,	%f14
	sllx	%o0,	%o3,	%o7
	lduh	[%l7 + 0x42],	%l3
	std	%f26,	[%l7 + 0x60]
	movrgez	%i2,	%o4,	%o2
	edge8l	%i7,	%g1,	%o5
	array8	%g7,	%o6,	%o1
	ld	[%l7 + 0x60],	%f18
	sdiv	%i6,	0x0F9B,	%l1
	ldsw	[%l7 + 0x58],	%i4
	fandnot2s	%f30,	%f0,	%f25
	fornot1	%f8,	%f30,	%f4
	movl	%xcc,	%g6,	%g2
	ld	[%l7 + 0x28],	%f17
	fmovrde	%l5,	%f6,	%f10
	array8	%i5,	%i1,	%g3
	fnors	%f17,	%f7,	%f11
	move	%icc,	%l6,	%i3
	xnorcc	%l0,	0x144B,	%i0
	popc	%g5,	%l2
	orcc	%g4,	0x1263,	%l4
	xor	%o0,	%o3,	%l3
	fmovrsgez	%i2,	%f12,	%f7
	movg	%xcc,	%o7,	%o4
	udivx	%o2,	0x1632,	%g1
	array32	%o5,	%i7,	%o6
	ldsh	[%l7 + 0x7E],	%o1
	edge16	%i6,	%l1,	%g7
	addc	%g6,	0x1DED,	%g2
	subcc	%i4,	0x1F8D,	%l5
	lduw	[%l7 + 0x78],	%i5
	movrgz	%i1,	%l6,	%g3
	ldsb	[%l7 + 0x31],	%l0
	fabss	%f2,	%f30
	subccc	%i0,	0x1E89,	%i3
	edge8ln	%l2,	%g5,	%l4
	movrgz	%o0,	0x39B,	%g4
	srl	%o3,	0x06,	%i2
	andn	%l3,	0x1290,	%o7
	sll	%o4,	0x17,	%g1
	movleu	%icc,	%o5,	%o2
	ldub	[%l7 + 0x2C],	%o6
	edge16l	%o1,	%i7,	%i6
	movrgez	%l1,	0x09F,	%g7
	edge8l	%g2,	%g6,	%i4
	fxnor	%f0,	%f18,	%f18
	fone	%f26
	ld	[%l7 + 0x58],	%f8
	sdivx	%l5,	0x1AFF,	%i1
	fmovsneg	%xcc,	%f13,	%f9
	edge32l	%l6,	%g3,	%i5
	smul	%l0,	0x1DF4,	%i0
	fmovdle	%xcc,	%f9,	%f21
	edge32	%i3,	%g5,	%l2
	restore %o0, 0x1FDC, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g4,	%o3,	%i2
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	xor	%o4,	0x1461,	%o5
	sdivcc	%g1,	0x130E,	%o2
	umul	%o6,	0x0200,	%o1
	stb	%i6,	[%l7 + 0x51]
	orncc	%l1,	%i7,	%g2
	mulx	%g6,	0x1584,	%i4
	siam	0x5
	movrgez	%l5,	%i1,	%g7
	edge8l	%g3,	%l6,	%l0
	movge	%icc,	%i0,	%i5
	st	%f15,	[%l7 + 0x28]
	fmovdneg	%icc,	%f30,	%f23
	ldsh	[%l7 + 0x44],	%i3
	fmovscs	%icc,	%f22,	%f29
	add	%l2,	%o0,	%l4
	fmovdne	%icc,	%f30,	%f11
	subccc	%g5,	%g4,	%o3
	stw	%l3,	[%l7 + 0x4C]
	subc	%o7,	%o4,	%i2
	edge8	%o5,	%g1,	%o2
	ldsh	[%l7 + 0x4E],	%o6
	udiv	%o1,	0x191A,	%i6
	mulx	%l1,	0x044F,	%g2
	sir	0x033E
	ldd	[%l7 + 0x68],	%f24
	fsrc2	%f22,	%f10
	mulx	%i7,	0x1F11,	%i4
	sll	%l5,	%g6,	%i1
	smul	%g7,	%l6,	%g3
	movrlez	%l0,	0x2A4,	%i0
	fands	%f12,	%f4,	%f6
	stb	%i3,	[%l7 + 0x54]
	fmovspos	%icc,	%f1,	%f6
	array32	%l2,	%i5,	%l4
	add	%o0,	0x1820,	%g4
	movrgz	%o3,	%l3,	%o7
	fmovsgu	%icc,	%f31,	%f21
	mova	%xcc,	%g5,	%i2
	sth	%o5,	[%l7 + 0x24]
	addc	%g1,	0x0BC6,	%o2
	ldsb	[%l7 + 0x0A],	%o4
	subcc	%o6,	%i6,	%l1
	alignaddrl	%o1,	%i7,	%g2
	umul	%i4,	0x0E9C,	%l5
	fmovsvs	%xcc,	%f24,	%f6
	lduh	[%l7 + 0x24],	%g6
	st	%f18,	[%l7 + 0x2C]
	pdist	%f10,	%f28,	%f26
	xorcc	%i1,	%l6,	%g7
	edge16	%g3,	%i0,	%l0
	fmovrdne	%l2,	%f24,	%f2
	nop
	set	0x5A, %l2
	stb	%i5,	[%l7 + %l2]
	andncc	%i3,	%o0,	%l4
	movg	%xcc,	%o3,	%g4
	xnorcc	%l3,	0x1425,	%g5
	ld	[%l7 + 0x30],	%f28
	xorcc	%i2,	%o5,	%o7
	movrlez	%g1,	%o4,	%o2
	fpack32	%f4,	%f20,	%f28
	edge16ln	%i6,	%l1,	%o1
	sub	%o6,	0x0386,	%i7
	stx	%i4,	[%l7 + 0x20]
	fones	%f17
	ld	[%l7 + 0x5C],	%f19
	restore %g2, 0x06A8, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i1,	%l6,	%g7
	movvs	%xcc,	%g3,	%i0
	sll	%g6,	%l2,	%l0
	fpsub16s	%f5,	%f1,	%f30
	sllx	%i5,	0x0F,	%o0
	edge8n	%i3,	%l4,	%o3
	xor	%l3,	%g4,	%i2
	movcc	%icc,	%o5,	%g5
	xor	%o7,	0x1770,	%o4
	xor	%g1,	%o2,	%i6
	fmovdvc	%xcc,	%f25,	%f20
	edge16	%l1,	%o1,	%i7
	umulcc	%o6,	0x1785,	%i4
	fsrc1s	%f1,	%f27
	popc	%g2,	%l5
	edge16l	%l6,	%i1,	%g3
	fmovrdgez	%i0,	%f8,	%f6
	movvs	%xcc,	%g7,	%g6
	fmovspos	%icc,	%f28,	%f0
	fmovdle	%xcc,	%f3,	%f11
	movvc	%icc,	%l0,	%i5
	fmul8x16au	%f12,	%f25,	%f4
	move	%xcc,	%l2,	%o0
	movvc	%xcc,	%l4,	%i3
	addccc	%l3,	%o3,	%g4
	movl	%icc,	%i2,	%g5
	ldd	[%l7 + 0x68],	%o6
	xor	%o5,	%o4,	%g1
	add	%o2,	%i6,	%l1
	movrlez	%o1,	%i7,	%i4
	alignaddr	%g2,	%o6,	%l6
	movvs	%xcc,	%i1,	%l5
	movn	%xcc,	%i0,	%g7
	udivcc	%g6,	0x0DDF,	%g3
	move	%xcc,	%l0,	%l2
	edge32l	%i5,	%o0,	%l4
	fnand	%f24,	%f30,	%f14
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%l3
	edge16ln	%o3,	%g4,	%i2
	fmovsge	%icc,	%f3,	%f16
	fcmped	%fcc0,	%f0,	%f6
	edge16l	%i3,	%g5,	%o7
	movrlz	%o5,	0x27A,	%g1
	xor	%o4,	0x0C29,	%o2
	udivcc	%i6,	0x09A2,	%l1
	edge8ln	%o1,	%i4,	%g2
	ldsb	[%l7 + 0x18],	%o6
	edge32l	%i7,	%i1,	%l6
	sethi	0x0B25,	%l5
	fabss	%f22,	%f7
	xnorcc	%g7,	0x07F9,	%g6
	xor	%g3,	%i0,	%l2
	subc	%l0,	0x116F,	%o0
	stx	%l4,	[%l7 + 0x20]
	fmovdcc	%icc,	%f5,	%f31
	subccc	%i5,	%o3,	%l3
	andcc	%i2,	0x058F,	%g4
	pdist	%f30,	%f24,	%f14
	ldsb	[%l7 + 0x7F],	%g5
	udivcc	%o7,	0x0BAD,	%o5
	movvc	%xcc,	%i3,	%g1
	alignaddrl	%o4,	%o2,	%l1
	fmovs	%f9,	%f18
	movcs	%xcc,	%i6,	%i4
	fones	%f3
	nop
	set	0x6A, %g7
	ldub	[%l7 + %g7],	%o1
	movrgez	%g2,	0x0DF,	%o6
	subccc	%i7,	0x0F83,	%i1
	xorcc	%l6,	0x0D14,	%l5
	edge16l	%g6,	%g3,	%i0
	udiv	%l2,	0x149D,	%g7
	movge	%xcc,	%o0,	%l4
	movvs	%xcc,	%i5,	%l0
	movpos	%icc,	%o3,	%i2
	orn	%g4,	0x005A,	%l3
	fcmpgt32	%f26,	%f20,	%o7
	movrlez	%g5,	0x1A7,	%i3
	array32	%o5,	%o4,	%o2
	srl	%l1,	%i6,	%i4
	movgu	%icc,	%g1,	%g2
	udiv	%o6,	0x1A85,	%o1
	sllx	%i7,	%l6,	%l5
	fpack32	%f24,	%f24,	%f20
	sdiv	%g6,	0x1B1D,	%g3
	movrlz	%i1,	0x3A8,	%l2
	fpadd32	%f14,	%f24,	%f6
	ldd	[%l7 + 0x30],	%g6
	andcc	%i0,	0x0479,	%l4
	addc	%i5,	0x1C15,	%o0
	fmovdg	%icc,	%f26,	%f0
	subccc	%l0,	%o3,	%g4
	addccc	%i2,	0x0AAB,	%o7
	movne	%xcc,	%g5,	%l3
	udiv	%i3,	0x1C39,	%o4
	edge32l	%o2,	%o5,	%i6
	movrgez	%l1,	%g1,	%g2
	addccc	%o6,	%o1,	%i4
	movpos	%xcc,	%l6,	%i7
	udiv	%g6,	0x1D38,	%l5
	sth	%i1,	[%l7 + 0x10]
	stx	%l2,	[%l7 + 0x38]
	alignaddrl	%g3,	%i0,	%g7
	movn	%icc,	%l4,	%o0
	edge8	%l0,	%i5,	%g4
	fmovdcs	%icc,	%f24,	%f25
	fmovrsgez	%i2,	%f15,	%f27
	fmul8sux16	%f18,	%f26,	%f30
	popc	%o7,	%g5
	fsrc1s	%f20,	%f4
	st	%f30,	[%l7 + 0x60]
	movrne	%o3,	0x07A,	%l3
	lduh	[%l7 + 0x0A],	%o4
	fmul8ulx16	%f8,	%f8,	%f2
	sub	%i3,	%o5,	%o2
	edge32	%l1,	%i6,	%g1
	edge8	%g2,	%o1,	%o6
	movcs	%icc,	%i4,	%l6
	fmovdl	%icc,	%f0,	%f10
	fxnors	%f22,	%f24,	%f11
	movcc	%icc,	%i7,	%l5
	fcmpgt16	%f14,	%f12,	%g6
	srax	%l2,	%g3,	%i1
	subccc	%i0,	%l4,	%g7
	fcmpes	%fcc2,	%f18,	%f31
	fabsd	%f24,	%f10
	fmovsvc	%icc,	%f6,	%f29
	movrlez	%l0,	%i5,	%g4
	movvs	%icc,	%o0,	%o7
	movleu	%icc,	%i2,	%g5
	fmovrsgez	%o3,	%f0,	%f19
	udivx	%o4,	0x1625,	%i3
	movcc	%xcc,	%o5,	%o2
	save %l3, %l1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x48],	%i6
	addccc	%o1,	0x1EE5,	%o6
	lduw	[%l7 + 0x48],	%i4
	fpackfix	%f28,	%f1
	movrgz	%l6,	%g2,	%i7
	mulx	%l5,	0x0F6D,	%l2
	edge32	%g3,	%g6,	%i0
	movvc	%xcc,	%l4,	%g7
	andn	%l0,	%i1,	%i5
	fnot1	%f14,	%f22
	fmovscs	%xcc,	%f20,	%f7
	ldd	[%l7 + 0x28],	%g4
	ldd	[%l7 + 0x68],	%f2
	sethi	0x0AE0,	%o0
	sllx	%i2,	0x05,	%g5
	orncc	%o7,	0x1BCD,	%o4
	edge16	%i3,	%o3,	%o5
	fxnors	%f25,	%f27,	%f12
	ldsb	[%l7 + 0x08],	%o2
	fmovsvc	%xcc,	%f0,	%f15
	fsrc2	%f6,	%f12
	edge8n	%l3,	%l1,	%g1
	fmovdge	%icc,	%f13,	%f31
	ldsh	[%l7 + 0x78],	%i6
	movgu	%xcc,	%o1,	%o6
	fmovdpos	%xcc,	%f10,	%f27
	orn	%l6,	%i4,	%g2
	subccc	%i7,	0x17E5,	%l2
	array32	%l5,	%g3,	%i0
	edge16n	%g6,	%l4,	%l0
	fandnot2s	%f23,	%f6,	%f20
	movg	%icc,	%g7,	%i5
	addc	%g4,	%i1,	%o0
	lduh	[%l7 + 0x3E],	%g5
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	edge8	%o4,	%i3,	%o3
	movrlez	%o5,	%l3,	%l1
	umulcc	%o2,	%i6,	%g1
	st	%f27,	[%l7 + 0x78]
	nop
	set	0x7D, %i6
	ldub	[%l7 + %i6],	%o1
	udivx	%l6,	0x19CB,	%i4
	fandnot1s	%f28,	%f16,	%f25
	movl	%icc,	%g2,	%i7
	edge32ln	%o6,	%l5,	%l2
	fcmpgt16	%f10,	%f20,	%i0
	fmovsn	%xcc,	%f11,	%f27
	smul	%g6,	%l4,	%g3
	edge8l	%g7,	%i5,	%g4
	movleu	%xcc,	%i1,	%l0
	ldsb	[%l7 + 0x61],	%o0
	movcs	%icc,	%g5,	%o7
	fzeros	%f20
	subc	%o4,	%i2,	%o3
	or	%o5,	0x1357,	%l3
	sdiv	%l1,	0x044A,	%i3
	movre	%o2,	%i6,	%g1
	udivcc	%o1,	0x0F15,	%l6
	fmovsne	%xcc,	%f11,	%f22
	edge32ln	%g2,	%i7,	%i4
	sth	%l5,	[%l7 + 0x24]
	movn	%xcc,	%o6,	%l2
	movvs	%icc,	%g6,	%i0
	edge8ln	%l4,	%g7,	%g3
	movre	%g4,	0x1F5,	%i5
	fmovrdgez	%l0,	%f18,	%f28
	lduh	[%l7 + 0x48],	%i1
	fexpand	%f21,	%f20
	and	%g5,	%o0,	%o4
	ldsw	[%l7 + 0x78],	%o7
	addc	%o3,	%o5,	%l3
	sdiv	%i2,	0x1CCE,	%i3
	alignaddrl	%o2,	%i6,	%g1
	addccc	%o1,	0x1B8B,	%l6
	fnot2s	%f3,	%f31
	ldub	[%l7 + 0x2D],	%l1
	fxors	%f25,	%f23,	%f23
	fcmpgt32	%f22,	%f18,	%i7
	ldub	[%l7 + 0x64],	%i4
	fmovsg	%xcc,	%f11,	%f28
	nop
	set	0x10, %i4
	ldsh	[%l7 + %i4],	%l5
	mova	%xcc,	%g2,	%l2
	fsrc1	%f12,	%f0
	edge16n	%g6,	%i0,	%o6
	sdivcc	%l4,	0x0F26,	%g3
	add	%g4,	0x1E5E,	%g7
	fmovrslez	%l0,	%f26,	%f21
	fmovsn	%xcc,	%f25,	%f29
	srl	%i5,	%g5,	%i1
	fpadd32	%f6,	%f16,	%f24
	movl	%icc,	%o4,	%o7
	siam	0x7
	ld	[%l7 + 0x1C],	%f28
	addccc	%o3,	%o0,	%l3
	subc	%i2,	0x124D,	%o5
	movn	%xcc,	%o2,	%i3
	edge32l	%g1,	%i6,	%o1
	fpsub32	%f0,	%f10,	%f26
	for	%f30,	%f22,	%f16
	st	%f23,	[%l7 + 0x5C]
	stb	%l6,	[%l7 + 0x3D]
	and	%l1,	%i7,	%l5
	xorcc	%i4,	%g2,	%l2
	movre	%g6,	%i0,	%o6
	xor	%g3,	0x066E,	%l4
	andcc	%g7,	0x0532,	%l0
	movpos	%icc,	%g4,	%i5
	smul	%g5,	0x0553,	%i1
	movrlez	%o4,	0x210,	%o3
	movcs	%xcc,	%o7,	%l3
	orcc	%i2,	0x10DA,	%o5
	fcmpgt16	%f2,	%f14,	%o0
	movre	%o2,	%g1,	%i3
	fabsd	%f24,	%f28
	edge16l	%i6,	%o1,	%l1
	movn	%xcc,	%l6,	%i7
	ldub	[%l7 + 0x1C],	%i4
	fmovdvs	%icc,	%f6,	%f1
	fmul8ulx16	%f4,	%f24,	%f2
	edge16ln	%g2,	%l2,	%g6
	popc	0x0ED6,	%i0
	ldsh	[%l7 + 0x76],	%l5
	alignaddr	%g3,	%o6,	%g7
	smulcc	%l4,	0x12B0,	%g4
	umulcc	%i5,	%l0,	%g5
	fmul8x16	%f22,	%f20,	%f0
	edge16	%o4,	%i1,	%o7
	fxnor	%f26,	%f16,	%f2
	edge16	%o3,	%l3,	%o5
	sub	%o0,	%o2,	%i2
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%i3
	movne	%xcc,	%i6,	%o1
	umul	%g1,	%l6,	%i7
	movrlz	%i4,	0x226,	%g2
	xnor	%l1,	0x01C6,	%l2
	sir	0x12A4
	movl	%xcc,	%i0,	%l5
	movn	%icc,	%g6,	%o6
	edge16ln	%g3,	%l4,	%g7
	sll	%g4,	%l0,	%i5
	srlx	%g5,	%o4,	%i1
	fmovsl	%icc,	%f14,	%f9
	fmovdge	%xcc,	%f16,	%f0
	movpos	%icc,	%o7,	%l3
	array8	%o3,	%o5,	%o0
	udiv	%o2,	0x0EB2,	%i3
	stw	%i6,	[%l7 + 0x48]
	st	%f8,	[%l7 + 0x68]
	fcmpeq32	%f28,	%f16,	%i2
	orncc	%o1,	%g1,	%l6
	movvc	%icc,	%i7,	%i4
	fmovd	%f28,	%f2
	sll	%l1,	0x1B,	%g2
	orcc	%i0,	0x0FDF,	%l2
	movgu	%xcc,	%g6,	%o6
	sllx	%g3,	%l4,	%g7
	stb	%g4,	[%l7 + 0x2B]
	restore %l0, 0x1B0D, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i5,	%o4,	%i1
	movle	%icc,	%g5,	%o7
	edge16n	%o3,	%l3,	%o5
	edge32n	%o0,	%o2,	%i6
	edge32n	%i3,	%i2,	%g1
	edge8	%o1,	%i7,	%i4
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f24
	edge8n	%l1,	%l6,	%i0
	udivcc	%g2,	0x1E83,	%l2
	ldsh	[%l7 + 0x6A],	%g6
	xnorcc	%o6,	0x147A,	%l4
	sth	%g7,	[%l7 + 0x44]
	sub	%g3,	0x05D1,	%g4
	movl	%icc,	%l5,	%i5
	edge32n	%o4,	%i1,	%g5
	stw	%o7,	[%l7 + 0x70]
	edge16ln	%o3,	%l0,	%o5
	ldsw	[%l7 + 0x28],	%o0
	sth	%o2,	[%l7 + 0x2A]
	ldsw	[%l7 + 0x40],	%i6
	movrgez	%l3,	%i3,	%i2
	edge8ln	%g1,	%i7,	%i4
	move	%xcc,	%l1,	%l6
	orcc	%o1,	0x01BD,	%i0
	movvs	%xcc,	%g2,	%l2
	movvc	%icc,	%o6,	%l4
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	umulcc	%l5,	0x1B71,	%g4
	ldsh	[%l7 + 0x66],	%o4
	alignaddr	%i5,	%g5,	%i1
	smulcc	%o7,	0x1850,	%o3
	xnorcc	%l0,	%o0,	%o5
	movl	%icc,	%o2,	%i6
	fornot2	%f22,	%f0,	%f28
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%l2
	fmovscc	%xcc,	%f9,	%f17
	nop
	set	0x0A, %l4
	sth	%i2,	[%l7 + %l4]
	movn	%icc,	%g1,	%i7
	add	%i4,	0x0A87,	%l1
	sir	0x10E7
	save %i3, 0x0723, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o1,	%i0
	movpos	%icc,	%g2,	%l2
	ldx	[%l7 + 0x70],	%l4
	xorcc	%o6,	0x1B17,	%g3
	fmovrde	%g7,	%f22,	%f16
	add	%g6,	%g4,	%l5
	fpsub32	%f0,	%f28,	%f14
	addc	%i5,	0x1BDA,	%g5
	mulscc	%i1,	%o4,	%o3
	srax	%o7,	%o0,	%l0
	stw	%o2,	[%l7 + 0x70]
	fmul8ulx16	%f6,	%f28,	%f0
	fmovdpos	%icc,	%f3,	%f28
	sll	%i6,	%o5,	%i2
	fmovdneg	%icc,	%f8,	%f29
	and	%g1,	0x03C8,	%l3
	edge32ln	%i4,	%l1,	%i7
	udivx	%i3,	0x11C8,	%o1
	fmovrsne	%l6,	%f14,	%f26
	array32	%i0,	%l2,	%l4
	ldub	[%l7 + 0x38],	%o6
	std	%f10,	[%l7 + 0x40]
	fnors	%f31,	%f5,	%f4
	fsrc1s	%f26,	%f6
	andncc	%g3,	%g7,	%g2
	fmovsa	%xcc,	%f28,	%f12
	fpadd32	%f0,	%f14,	%f30
	movle	%xcc,	%g4,	%g6
	movle	%xcc,	%i5,	%l5
	sethi	0x1E3A,	%g5
	edge32l	%i1,	%o4,	%o3
	movge	%icc,	%o7,	%o0
	stw	%o2,	[%l7 + 0x68]
	fabss	%f31,	%f10
	stx	%i6,	[%l7 + 0x68]
	movge	%xcc,	%o5,	%l0
	fxnor	%f24,	%f6,	%f30
	movcs	%icc,	%i2,	%l3
	fmul8x16au	%f16,	%f31,	%f28
	sdiv	%i4,	0x0EF7,	%l1
	mulx	%g1,	0x007C,	%i3
	umul	%i7,	0x02D4,	%o1
	addc	%l6,	%i0,	%l4
	ldsh	[%l7 + 0x4A],	%o6
	movvc	%icc,	%l2,	%g3
	sra	%g2,	%g4,	%g6
	movg	%xcc,	%g7,	%l5
	andncc	%g5,	%i5,	%i1
	edge32ln	%o4,	%o7,	%o3
	lduh	[%l7 + 0x32],	%o2
	fcmpeq32	%f28,	%f8,	%o0
	movge	%xcc,	%o5,	%l0
	smul	%i6,	0x157E,	%i2
	fpadd16	%f14,	%f10,	%f8
	fmovs	%f23,	%f30
	sub	%i4,	%l3,	%g1
	udiv	%l1,	0x0A1D,	%i7
	xorcc	%i3,	%l6,	%o1
	addccc	%l4,	0x1853,	%o6
	movneg	%icc,	%i0,	%g3
	ldx	[%l7 + 0x08],	%l2
	stw	%g4,	[%l7 + 0x3C]
	orcc	%g6,	%g7,	%l5
	or	%g2,	0x0F49,	%i5
	xnor	%i1,	%g5,	%o7
	fmovsn	%icc,	%f13,	%f12
	fmovdn	%xcc,	%f3,	%f23
	addc	%o4,	0x17E9,	%o3
	addcc	%o0,	%o2,	%o5
	ldsw	[%l7 + 0x4C],	%l0
	sra	%i2,	0x1A,	%i4
	fornot1	%f26,	%f28,	%f8
	andcc	%i6,	0x1E72,	%g1
	edge16n	%l1,	%i7,	%l3
	sra	%l6,	0x17,	%i3
	movle	%xcc,	%o1,	%l4
	lduw	[%l7 + 0x08],	%i0
	smulcc	%o6,	0x1855,	%l2
	andn	%g4,	%g6,	%g3
	fcmpeq32	%f28,	%f0,	%g7
	subc	%l5,	%g2,	%i5
	srlx	%g5,	%o7,	%i1
	addccc	%o4,	%o3,	%o0
	orcc	%o5,	%l0,	%o2
	std	%f6,	[%l7 + 0x40]
	subcc	%i2,	0x1CC0,	%i4
	movg	%icc,	%g1,	%l1
	ldd	[%l7 + 0x20],	%f18
	movg	%xcc,	%i6,	%i7
	movvs	%xcc,	%l6,	%l3
	ldd	[%l7 + 0x20],	%o0
	movpos	%icc,	%i3,	%i0
	ldd	[%l7 + 0x10],	%l4
	umulcc	%l2,	%o6,	%g6
	sllx	%g4,	%g3,	%g7
	array16	%l5,	%g2,	%i5
	addc	%g5,	0x187D,	%i1
	edge8ln	%o7,	%o4,	%o3
	orcc	%o5,	%o0,	%o2
	xnorcc	%i2,	%i4,	%l0
	smulcc	%g1,	0x0A44,	%l1
	fmul8x16al	%f29,	%f29,	%f0
	movrgez	%i6,	0x263,	%i7
	movrgez	%l6,	%l3,	%i3
	movn	%xcc,	%i0,	%l4
	movne	%icc,	%l2,	%o6
	array32	%o1,	%g6,	%g3
	movpos	%icc,	%g7,	%l5
	st	%f12,	[%l7 + 0x60]
	edge32ln	%g2,	%i5,	%g4
	andcc	%i1,	%g5,	%o7
	xorcc	%o3,	%o5,	%o4
	sdivx	%o0,	0x026C,	%o2
	edge8ln	%i2,	%l0,	%i4
	sth	%g1,	[%l7 + 0x7C]
	popc	%i6,	%i7
	fornot2s	%f3,	%f31,	%f26
	lduw	[%l7 + 0x6C],	%l1
	movpos	%xcc,	%l3,	%l6
	smul	%i3,	%l4,	%i0
	edge16ln	%l2,	%o1,	%o6
	edge8n	%g3,	%g6,	%g7
	movrne	%g2,	0x1A2,	%l5
	movvc	%xcc,	%i5,	%g4
	movn	%icc,	%i1,	%o7
	fcmpgt32	%f8,	%f12,	%g5
	xnor	%o5,	0x0946,	%o4
	sdivx	%o3,	0x04E7,	%o2
	xorcc	%i2,	0x0910,	%o0
	movl	%icc,	%l0,	%i4
	fnot2s	%f4,	%f28
	edge8	%i6,	%g1,	%i7
	fmovdgu	%icc,	%f17,	%f23
	movg	%icc,	%l1,	%l6
	umul	%l3,	%i3,	%l4
	ldub	[%l7 + 0x59],	%i0
	edge8ln	%o1,	%o6,	%l2
	edge16l	%g3,	%g6,	%g2
	sll	%g7,	0x0F,	%l5
	popc	0x0B9E,	%i5
	restore %g4, 0x0390, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i1,	0x0067,	%g5
	edge8ln	%o4,	%o5,	%o2
	move	%icc,	%i2,	%o3
	smulcc	%l0,	0x071E,	%i4
	smulcc	%o0,	%g1,	%i6
	movle	%icc,	%i7,	%l6
	sdivx	%l3,	0x0417,	%i3
	edge8	%l4,	%i0,	%l1
	fornot1	%f16,	%f2,	%f24
	movl	%icc,	%o1,	%l2
	sllx	%o6,	0x07,	%g6
	edge8l	%g2,	%g3,	%l5
	sra	%i5,	%g7,	%g4
	nop
	set	0x1C, %o7
	ldsw	[%l7 + %o7],	%i1
	fnot1	%f0,	%f24
	movne	%icc,	%g5,	%o7
	move	%xcc,	%o5,	%o4
	fxnors	%f13,	%f8,	%f27
	edge16ln	%i2,	%o2,	%o3
	udiv	%i4,	0x1ED6,	%o0
	popc	%l0,	%i6
	fcmpeq32	%f22,	%f20,	%i7
	movne	%xcc,	%g1,	%l3
	smul	%l6,	0x1935,	%i3
	fzeros	%f10
	save %i0, 0x0136, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o1,	%f10,	%f25
	subccc	%l2,	0x1CCA,	%o6
	subc	%l1,	%g2,	%g3
	movrne	%g6,	%i5,	%l5
	movne	%xcc,	%g4,	%g7
	movleu	%icc,	%g5,	%i1
	movre	%o5,	0x045,	%o4
	popc	%i2,	%o2
	udivx	%o7,	0x0997,	%o3
	alignaddr	%i4,	%o0,	%i6
	fnot1	%f18,	%f4
	fnot1	%f10,	%f24
	movvc	%icc,	%i7,	%l0
	movpos	%icc,	%l3,	%l6
	edge32l	%i3,	%g1,	%i0
	movrgz	%l4,	%o1,	%l2
	fsrc2	%f2,	%f2
	stb	%l1,	[%l7 + 0x6C]
	movcs	%icc,	%o6,	%g2
	orn	%g3,	0x1703,	%g6
	fmovs	%f10,	%f22
	mulx	%l5,	%g4,	%i5
	ldsb	[%l7 + 0x2B],	%g7
	fsrc1	%f6,	%f4
	orcc	%g5,	0x0610,	%i1
	fpackfix	%f28,	%f4
	fmovdneg	%icc,	%f24,	%f28
	ldsw	[%l7 + 0x34],	%o4
	edge8l	%i2,	%o2,	%o5
	fnand	%f14,	%f16,	%f2
	fcmple32	%f0,	%f0,	%o3
	mulx	%o7,	0x08B9,	%o0
	subcc	%i6,	0x1E41,	%i4
	mova	%xcc,	%l0,	%l3
	mulscc	%l6,	0x1062,	%i7
	movle	%icc,	%g1,	%i0
	udivcc	%i3,	0x063C,	%o1
	ld	[%l7 + 0x68],	%f13
	andncc	%l2,	%l1,	%l4
	sra	%g2,	%o6,	%g6
	ldub	[%l7 + 0x1E],	%l5
	movle	%icc,	%g4,	%i5
	movcc	%xcc,	%g3,	%g7
	xorcc	%i1,	%o4,	%g5
	umulcc	%o2,	%i2,	%o3
	movleu	%icc,	%o7,	%o5
	fnot1s	%f9,	%f22
	srl	%i6,	0x1A,	%o0
	fcmpgt16	%f0,	%f30,	%l0
	move	%icc,	%l3,	%i4
	udiv	%i7,	0x0D49,	%g1
	stb	%l6,	[%l7 + 0x20]
	edge16n	%i3,	%o1,	%i0
	sub	%l1,	%l2,	%g2
	fandnot1s	%f9,	%f23,	%f22
	alignaddrl	%o6,	%l4,	%g6
	sdivx	%l5,	0x006A,	%g4
	movn	%icc,	%i5,	%g7
	sth	%i1,	[%l7 + 0x36]
	sdivcc	%g3,	0x160A,	%g5
	std	%f0,	[%l7 + 0x30]
	lduw	[%l7 + 0x30],	%o2
	lduh	[%l7 + 0x7A],	%i2
	fcmpeq32	%f26,	%f10,	%o3
	stb	%o7,	[%l7 + 0x57]
	andncc	%o4,	%i6,	%o0
	fmovrsgz	%o5,	%f20,	%f29
	fmovdvs	%icc,	%f3,	%f14
	movle	%icc,	%l0,	%i4
	movne	%xcc,	%l3,	%g1
	and	%i7,	%l6,	%o1
	movcc	%icc,	%i0,	%l1
	lduw	[%l7 + 0x58],	%l2
	udivcc	%i3,	0x0413,	%o6
	fpsub16s	%f28,	%f24,	%f21
	fmovs	%f31,	%f5
	movrlz	%l4,	0x105,	%g2
	sir	0x0905
	movrgez	%l5,	%g4,	%i5
	movge	%icc,	%g7,	%g6
	movrlez	%g3,	0x190,	%i1
	st	%f29,	[%l7 + 0x14]
	save %o2, %g5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f24,	%f8,	%f16
	mulscc	%o7,	0x0769,	%o4
	stw	%i6,	[%l7 + 0x34]
	movleu	%icc,	%i2,	%o5
	addccc	%o0,	0x1D42,	%i4
	movleu	%xcc,	%l0,	%g1
	fmovspos	%icc,	%f28,	%f1
	movrlz	%i7,	0x140,	%l3
	array32	%l6,	%i0,	%l1
	edge8l	%l2,	%o1,	%o6
	ldsb	[%l7 + 0x09],	%l4
	movl	%icc,	%i3,	%g2
	sethi	0x0F2F,	%g4
	fnot1	%f26,	%f10
	fcmpes	%fcc2,	%f28,	%f5
	andn	%l5,	0x1A88,	%g7
	array32	%g6,	%g3,	%i1
	fmovsa	%xcc,	%f23,	%f29
	array32	%o2,	%i5,	%g5
	xorcc	%o7,	%o4,	%i6
	orn	%o3,	0x0AD6,	%o5
	xorcc	%i2,	0x19ED,	%o0
	xnorcc	%l0,	%g1,	%i4
	mulx	%l3,	%l6,	%i7
	edge8l	%i0,	%l1,	%o1
	movrgz	%o6,	0x163,	%l4
	xor	%l2,	0x004A,	%i3
	stw	%g2,	[%l7 + 0x08]
	edge8n	%l5,	%g4,	%g6
	sdivcc	%g3,	0x04F0,	%g7
	array16	%i1,	%o2,	%i5
	umul	%g5,	0x1DB5,	%o7
	movrne	%o4,	%i6,	%o3
	smul	%i2,	0x109B,	%o5
	movre	%o0,	0x3A8,	%g1
	stx	%i4,	[%l7 + 0x78]
	ldx	[%l7 + 0x58],	%l0
	movcc	%xcc,	%l6,	%i7
	ldd	[%l7 + 0x10],	%l2
	srl	%l1,	%o1,	%o6
	srlx	%l4,	%i0,	%l2
	edge32l	%g2,	%l5,	%g4
	st	%f20,	[%l7 + 0x4C]
	fxor	%f10,	%f18,	%f16
	fmovse	%icc,	%f22,	%f3
	fcmps	%fcc1,	%f8,	%f29
	fmul8x16au	%f5,	%f27,	%f6
	movpos	%icc,	%i3,	%g6
	and	%g7,	0x1F22,	%g3
	ldsh	[%l7 + 0x50],	%i1
	srax	%i5,	0x1A,	%g5
	fcmpgt32	%f30,	%f8,	%o2
	fxnors	%f6,	%f7,	%f10
	ldd	[%l7 + 0x38],	%f24
	ldd	[%l7 + 0x48],	%f2
	subccc	%o4,	0x0310,	%o7
	movneg	%xcc,	%i6,	%o3
	andcc	%o5,	0x134D,	%i2
	subcc	%g1,	0x1A49,	%i4
	or	%o0,	0x0BFE,	%l6
	fmovsleu	%xcc,	%f4,	%f2
	mulscc	%l0,	%i7,	%l3
	mulscc	%l1,	%o6,	%o1
	array16	%i0,	%l2,	%l4
	array8	%g2,	%l5,	%g4
	fone	%f4
	alignaddrl	%g6,	%i3,	%g3
	edge16n	%g7,	%i1,	%g5
	edge32l	%i5,	%o2,	%o4
	ldd	[%l7 + 0x48],	%o6
	fmovrsne	%o3,	%f22,	%f9
	sth	%o5,	[%l7 + 0x20]
	add	%i6,	0x1F0A,	%g1
	udivx	%i4,	0x072D,	%o0
	fnand	%f18,	%f28,	%f30
	ldd	[%l7 + 0x08],	%i2
	ldd	[%l7 + 0x28],	%l0
	movcc	%xcc,	%l6,	%l3
	xor	%l1,	0x01C1,	%o6
	movrne	%i7,	0x0AC,	%o1
	or	%i0,	0x098C,	%l2
	lduh	[%l7 + 0x0E],	%l4
	edge32ln	%l5,	%g4,	%g6
	array8	%g2,	%i3,	%g7
	fmovdle	%xcc,	%f3,	%f20
	fmovdneg	%xcc,	%f7,	%f19
	subcc	%i1,	0x1D6A,	%g3
	movge	%icc,	%g5,	%o2
	andn	%i5,	%o7,	%o3
	nop
	set	0x19, %l0
	ldub	[%l7 + %l0],	%o5
	movne	%xcc,	%i6,	%g1
	movg	%xcc,	%i4,	%o0
	fmovsgu	%xcc,	%f23,	%f12
	edge8n	%i2,	%l0,	%l6
	fpadd16s	%f11,	%f17,	%f10
	movge	%icc,	%l3,	%l1
	array8	%o4,	%o6,	%o1
	array8	%i7,	%l2,	%i0
	array32	%l5,	%l4,	%g6
	umulcc	%g2,	%g4,	%g7
	mulx	%i3,	%g3,	%i1
	fmovsleu	%xcc,	%f10,	%f2
	ldsw	[%l7 + 0x48],	%g5
	movgu	%icc,	%i5,	%o2
	udivcc	%o3,	0x188D,	%o5
	fnot2s	%f2,	%f23
	udivx	%o7,	0x0139,	%g1
	and	%i6,	%o0,	%i4
	fmovsa	%icc,	%f1,	%f27
	fmovdleu	%icc,	%f24,	%f24
	stb	%i2,	[%l7 + 0x44]
	movpos	%icc,	%l0,	%l6
	std	%f2,	[%l7 + 0x78]
	ldx	[%l7 + 0x68],	%l1
	fnot2s	%f31,	%f5
	ldx	[%l7 + 0x68],	%o4
	sdiv	%o6,	0x093A,	%o1
	fmovrdgez	%l3,	%f24,	%f24
	sethi	0x148B,	%i7
	popc	0x0F3F,	%i0
	fnot2s	%f14,	%f20
	edge32n	%l5,	%l4,	%l2
	fmovde	%xcc,	%f19,	%f31
	movne	%xcc,	%g2,	%g6
	movl	%icc,	%g4,	%g7
	movle	%icc,	%g3,	%i3
	sll	%g5,	%i5,	%i1
	movgu	%icc,	%o2,	%o3
	edge8ln	%o7,	%o5,	%g1
	orn	%i6,	0x13CE,	%o0
	movle	%icc,	%i4,	%l0
	std	%f2,	[%l7 + 0x70]
	ld	[%l7 + 0x10],	%f7
	movrgz	%l6,	%l1,	%o4
	fmovsle	%xcc,	%f20,	%f25
	fsrc2	%f16,	%f0
	sub	%o6,	%o1,	%l3
	movvc	%icc,	%i2,	%i0
	movgu	%icc,	%l5,	%l4
	sth	%l2,	[%l7 + 0x5A]
	mulscc	%g2,	0x15EF,	%i7
	and	%g6,	0x038F,	%g4
	sdiv	%g7,	0x06AA,	%i3
	fmovse	%icc,	%f15,	%f28
	mova	%icc,	%g5,	%g3
	sdivx	%i5,	0x0B51,	%o2
	ldsh	[%l7 + 0x54],	%o3
	edge8ln	%i1,	%o5,	%g1
	edge16	%i6,	%o0,	%i4
	fxnor	%f22,	%f6,	%f12
	edge16l	%o7,	%l6,	%l0
	movleu	%icc,	%o4,	%l1
	fxnor	%f18,	%f24,	%f8
	mulx	%o6,	%o1,	%l3
	edge8n	%i0,	%l5,	%l4
	edge16n	%i2,	%g2,	%i7
	udivx	%g6,	0x1344,	%l2
	array16	%g4,	%i3,	%g5
	edge16ln	%g7,	%i5,	%o2
	xnorcc	%g3,	%o3,	%o5
	movgu	%icc,	%i1,	%i6
	or	%g1,	%o0,	%i4
	fpadd32s	%f30,	%f31,	%f8
	fandnot1	%f22,	%f6,	%f16
	fmovsneg	%icc,	%f4,	%f14
	ldsw	[%l7 + 0x34],	%l6
	movrgz	%l0,	%o7,	%l1
	xnorcc	%o4,	0x0341,	%o1
	sdivx	%l3,	0x0559,	%i0
	ldd	[%l7 + 0x60],	%o6
	fmovdge	%icc,	%f12,	%f20
	xorcc	%l5,	0x1A21,	%l4
	sethi	0x1829,	%g2
	movcs	%xcc,	%i7,	%g6
	andcc	%l2,	%i2,	%g4
	smulcc	%i3,	0x0291,	%g7
	movge	%xcc,	%g5,	%o2
	addccc	%g3,	%o3,	%o5
	lduw	[%l7 + 0x7C],	%i1
	ld	[%l7 + 0x78],	%f28
	edge32l	%i5,	%g1,	%o0
	edge16n	%i4,	%l6,	%l0
	mova	%xcc,	%o7,	%l1
	edge8l	%i6,	%o4,	%l3
	movne	%xcc,	%i0,	%o1
	mulscc	%o6,	%l4,	%l5
	movrlez	%g2,	%g6,	%l2
	fmovdn	%icc,	%f3,	%f14
	fandnot2	%f2,	%f28,	%f6
	fnegd	%f8,	%f14
	fexpand	%f5,	%f20
	movrgz	%i2,	0x1EB,	%g4
	andncc	%i7,	%i3,	%g5
	movvc	%icc,	%o2,	%g3
	subcc	%o3,	%g7,	%i1
	fcmpgt16	%f26,	%f16,	%i5
	ldx	[%l7 + 0x58],	%o5
	fmovdg	%xcc,	%f13,	%f10
	movvs	%xcc,	%o0,	%i4
	movneg	%icc,	%l6,	%g1
	fmul8x16	%f10,	%f10,	%f24
	movneg	%xcc,	%o7,	%l1
	stb	%l0,	[%l7 + 0x5C]
	bshuffle	%f12,	%f16,	%f8
	xnor	%i6,	%o4,	%i0
	fmovs	%f15,	%f2
	fpackfix	%f4,	%f27
	movge	%xcc,	%o1,	%l3
	umulcc	%o6,	0x05B4,	%l5
	array32	%l4,	%g2,	%l2
	movrlez	%g6,	%i2,	%i7
	movrlez	%i3,	0x39D,	%g4
	pdist	%f12,	%f4,	%f24
	stb	%o2,	[%l7 + 0x2C]
	edge8l	%g3,	%g5,	%o3
	umulcc	%i1,	0x0D5F,	%g7
	movre	%o5,	0x26D,	%i5
	lduh	[%l7 + 0x68],	%i4
	array32	%l6,	%g1,	%o0
	fsrc2	%f18,	%f8
	movle	%icc,	%o7,	%l0
	sra	%i6,	%l1,	%i0
	edge8n	%o4,	%o1,	%l3
	edge8ln	%l5,	%l4,	%g2
	movvs	%xcc,	%o6,	%g6
	fpadd32s	%f26,	%f4,	%f20
	fcmple16	%f12,	%f4,	%l2
	fone	%f4
	edge8	%i2,	%i3,	%g4
	umul	%o2,	0x06B5,	%i7
	fcmpne16	%f4,	%f12,	%g3
	edge8ln	%g5,	%o3,	%i1
	edge16n	%o5,	%g7,	%i4
	lduh	[%l7 + 0x4A],	%l6
	fcmpeq16	%f14,	%f10,	%i5
	fpackfix	%f30,	%f23
	ld	[%l7 + 0x0C],	%f22
	array32	%g1,	%o0,	%l0
	srl	%i6,	0x00,	%l1
	mulscc	%o7,	%o4,	%o1
	st	%f6,	[%l7 + 0x78]
	subcc	%i0,	0x11EB,	%l3
	movpos	%icc,	%l5,	%g2
	movrgz	%o6,	0x2D6,	%l4
	movg	%icc,	%l2,	%g6
	pdist	%f20,	%f30,	%f10
	orncc	%i2,	0x0D57,	%i3
	movleu	%icc,	%g4,	%o2
	array8	%i7,	%g3,	%g5
	fmovrdgz	%i1,	%f0,	%f0
	fornot2	%f4,	%f8,	%f8
	ldsw	[%l7 + 0x38],	%o5
	srl	%g7,	%i4,	%o3
	movrgez	%l6,	0x09F,	%g1
	udivcc	%i5,	0x086C,	%o0
	subc	%i6,	%l0,	%l1
	fmovsvs	%xcc,	%f4,	%f18
	fmovrsgz	%o4,	%f3,	%f8
	and	%o7,	0x0906,	%i0
	xorcc	%l3,	%o1,	%g2
	sllx	%l5,	0x13,	%l4
	alignaddr	%l2,	%g6,	%o6
	save %i3, 0x19AD, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i2,	%o2,	%i7
	mova	%icc,	%g3,	%i1
	fmovsn	%icc,	%f23,	%f29
	alignaddrl	%g5,	%g7,	%o5
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	edge32ln	%i5,	%o0,	%i4
	srax	%i6,	0x10,	%l1
	alignaddrl	%o4,	%l0,	%o7
	sllx	%l3,	%i0,	%o1
	edge8l	%g2,	%l4,	%l2
	movrgz	%l5,	0x132,	%g6
	fpsub16	%f10,	%f28,	%f20
	orcc	%i3,	%g4,	%i2
	addccc	%o2,	0x0295,	%o6
	sdivcc	%i7,	0x0C48,	%i1
	movleu	%icc,	%g5,	%g3
	fpsub32	%f2,	%f26,	%f28
	movvs	%icc,	%o5,	%o3
	mulscc	%g7,	0x1C1F,	%l6
	restore %i5, 0x18A4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i4,	0x02B0,	%i6
	movcs	%xcc,	%g1,	%o4
	sll	%l0,	%l1,	%l3
	pdist	%f18,	%f14,	%f28
	ldx	[%l7 + 0x50],	%i0
	fmovrslez	%o7,	%f31,	%f31
	movrlez	%o1,	%l4,	%g2
	fmovdn	%icc,	%f24,	%f30
	ldub	[%l7 + 0x31],	%l2
	movgu	%xcc,	%l5,	%g6
	movvs	%xcc,	%g4,	%i3
	ldd	[%l7 + 0x60],	%o2
	edge32l	%o6,	%i2,	%i1
	movcs	%icc,	%i7,	%g3
	subcc	%g5,	%o5,	%o3
	ldd	[%l7 + 0x48],	%f16
	sub	%l6,	0x0AAB,	%i5
	movneg	%xcc,	%o0,	%g7
	fmovsl	%icc,	%f11,	%f8
	sdiv	%i4,	0x085C,	%i6
	edge8ln	%o4,	%g1,	%l1
	fmovsge	%xcc,	%f2,	%f26
	orcc	%l0,	0x000A,	%l3
	and	%o7,	%i0,	%l4
	fnot2s	%f4,	%f24
	save %o1, %g2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g6,	0x1BA5,	%g4
	ldx	[%l7 + 0x60],	%l2
	fmovrslez	%i3,	%f17,	%f3
	andn	%o6,	%o2,	%i2
	fmovsgu	%xcc,	%f13,	%f16
	srax	%i1,	%g3,	%g5
	fnegd	%f4,	%f0
	mulscc	%o5,	%i7,	%o3
	sth	%l6,	[%l7 + 0x4C]
	srl	%o0,	%g7,	%i4
	movpos	%icc,	%i5,	%o4
	xnorcc	%g1,	0x18D6,	%i6
	xorcc	%l1,	%l0,	%o7
	array8	%l3,	%l4,	%o1
	array32	%i0,	%l5,	%g6
	sdivcc	%g4,	0x1A3A,	%l2
	movre	%g2,	%o6,	%o2
	movvs	%xcc,	%i2,	%i1
	fandnot1s	%f26,	%f9,	%f13
	fcmple16	%f16,	%f30,	%g3
	or	%g5,	0x1264,	%i3
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%o5
	movne	%icc,	%o3,	%l6
	subcc	%i7,	0x17B6,	%o0
	xorcc	%i4,	0x0CBE,	%i5
	xor	%g7,	%g1,	%o4
	std	%f8,	[%l7 + 0x28]
	sdiv	%i6,	0x166E,	%l1
	movg	%xcc,	%o7,	%l0
	srax	%l3,	%o1,	%l4
	fmovdpos	%icc,	%f20,	%f14
	edge8n	%l5,	%g6,	%i0
	nop
	set	0x28, %l6
	lduw	[%l7 + %l6],	%l2
	edge8	%g4,	%g2,	%o2
	addcc	%o6,	%i1,	%i2
	sub	%g3,	0x0C94,	%g5
	movrlez	%o5,	%o3,	%i3
	alignaddr	%l6,	%i7,	%i4
	popc	%o0,	%g7
	smulcc	%i5,	%o4,	%i6
	nop
	set	0x30, %l5
	stx	%l1,	[%l7 + %l5]
	srax	%g1,	%o7,	%l0
	fmovscs	%icc,	%f22,	%f25
	std	%f12,	[%l7 + 0x10]
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	andcc	%g6,	0x163B,	%i0
	ldub	[%l7 + 0x69],	%l4
	fnot2	%f10,	%f22
	ldsw	[%l7 + 0x2C],	%l2
	andn	%g2,	%g4,	%o2
	movre	%i1,	%i2,	%g3
	movvs	%xcc,	%o6,	%g5
	movl	%icc,	%o3,	%i3
	fnot2	%f18,	%f20
	andn	%l6,	0x038C,	%o5
	srax	%i7,	0x05,	%o0
	std	%f28,	[%l7 + 0x70]
	movre	%g7,	%i5,	%o4
	edge8l	%i4,	%i6,	%g1
	stx	%l1,	[%l7 + 0x28]
	orn	%l0,	0x055D,	%l3
	edge8	%o7,	%l5,	%o1
	mulx	%i0,	0x0479,	%g6
	movre	%l4,	%l2,	%g2
	movge	%xcc,	%g4,	%i1
	fors	%f13,	%f23,	%f16
	ldsw	[%l7 + 0x38],	%o2
	movge	%xcc,	%g3,	%o6
	edge32n	%i2,	%o3,	%i3
	fmovrslz	%g5,	%f8,	%f24
	udivcc	%o5,	0x15D2,	%l6
	andn	%o0,	%i7,	%i5
	movgu	%icc,	%o4,	%i4
	mulscc	%g7,	%i6,	%l1
	edge16l	%g1,	%l3,	%o7
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%l5
	and	%l0,	%o1,	%i0
	movcc	%xcc,	%g6,	%l2
	mulscc	%l4,	%g4,	%g2
	add	%o2,	0x1F69,	%g3
	movl	%xcc,	%i1,	%o6
	movvs	%icc,	%o3,	%i3
	xorcc	%i2,	0x1066,	%o5
	fmovdvc	%xcc,	%f5,	%f1
	movn	%icc,	%g5,	%o0
	srax	%i7,	0x18,	%i5
	edge32l	%o4,	%l6,	%g7
	addccc	%i4,	0x0397,	%i6
	fsrc1s	%f25,	%f5
	subc	%l1,	0x0DA0,	%g1
	fors	%f4,	%f18,	%f9
	ldd	[%l7 + 0x70],	%l2
	movcs	%xcc,	%l5,	%l0
	smul	%o7,	%o1,	%i0
	sir	0x168B
	edge16	%g6,	%l4,	%l2
	movrlez	%g2,	%o2,	%g3
	sll	%g4,	0x1D,	%o6
	fpackfix	%f22,	%f11
	fxnor	%f28,	%f12,	%f4
	udivcc	%i1,	0x1BDB,	%i3
	edge16	%o3,	%o5,	%g5
	fmovsne	%icc,	%f13,	%f3
	ldsw	[%l7 + 0x38],	%o0
	ld	[%l7 + 0x40],	%f23
	fornot1s	%f31,	%f13,	%f15
	array8	%i2,	%i5,	%o4
	ldsw	[%l7 + 0x60],	%i7
	movgu	%xcc,	%g7,	%i4
	ldsh	[%l7 + 0x1C],	%l6
	edge16ln	%i6,	%l1,	%g1
	fmovrse	%l3,	%f22,	%f4
	mulscc	%l5,	%o7,	%l0
	movre	%o1,	0x182,	%g6
	xor	%i0,	%l2,	%l4
	movrgz	%o2,	%g2,	%g4
	movleu	%icc,	%g3,	%i1
	movcs	%icc,	%i3,	%o6
	umulcc	%o3,	%o5,	%g5
	and	%i2,	%o0,	%o4
	edge8n	%i7,	%g7,	%i5
	fmovdne	%icc,	%f25,	%f22
	ldd	[%l7 + 0x30],	%i6
	fmovdcs	%icc,	%f7,	%f11
	xnorcc	%i6,	0x0805,	%l1
	fpadd32s	%f4,	%f13,	%f6
	andcc	%i4,	%l3,	%g1
	fpadd32	%f20,	%f24,	%f12
	fandnot2s	%f3,	%f5,	%f26
	lduw	[%l7 + 0x48],	%o7
	mulscc	%l0,	%o1,	%l5
	fmovsg	%icc,	%f17,	%f5
	edge32n	%i0,	%g6,	%l4
	xor	%l2,	0x052E,	%g2
	xor	%o2,	0x0E48,	%g3
	movge	%xcc,	%i1,	%i3
	add	%o6,	0x0DB6,	%o3
	fandnot1s	%f7,	%f10,	%f25
	restore %o5, 0x0C48, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g4,	0x2BD,	%i2
	movg	%xcc,	%o4,	%o0
	array32	%g7,	%i7,	%i5
	srax	%l6,	0x08,	%i6
	srl	%l1,	%l3,	%i4
	edge16ln	%g1,	%l0,	%o1
	movcs	%xcc,	%o7,	%l5
	save %i0, %g6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x4A, %g4
	lduh	[%l7 + %g4],	%g2
	movne	%icc,	%l4,	%g3
	st	%f21,	[%l7 + 0x10]
	ldd	[%l7 + 0x70],	%f0
	sdiv	%i1,	0x06F3,	%i3
	fmovdcs	%xcc,	%f16,	%f26
	movne	%icc,	%o2,	%o6
	movrlez	%o5,	%g5,	%o3
	orncc	%i2,	0x1575,	%o4
	sllx	%o0,	0x07,	%g4
	lduh	[%l7 + 0x2C],	%g7
	edge32ln	%i5,	%i7,	%l6
	movpos	%xcc,	%l1,	%i6
	movle	%icc,	%i4,	%g1
	sub	%l0,	0x0FA4,	%l3
	fcmpgt16	%f30,	%f6,	%o1
	orcc	%l5,	0x11F3,	%o7
	and	%i0,	%l2,	%g6
	orn	%g2,	%l4,	%i1
	sub	%g3,	0x066B,	%i3
	andcc	%o2,	%o5,	%o6
	alignaddrl	%g5,	%i2,	%o3
	srl	%o4,	0x00,	%o0
	andn	%g7,	%g4,	%i7
	fnot1s	%f8,	%f3
	fmul8ulx16	%f0,	%f30,	%f18
	fsrc2	%f10,	%f12
	movvc	%icc,	%l6,	%i5
	orncc	%l1,	%i6,	%g1
	fcmpgt16	%f22,	%f4,	%l0
	fpack32	%f12,	%f4,	%f24
	array32	%i4,	%o1,	%l3
	ldsb	[%l7 + 0x12],	%l5
	movge	%xcc,	%i0,	%o7
	xnor	%l2,	%g2,	%g6
	sth	%l4,	[%l7 + 0x74]
	movle	%xcc,	%i1,	%i3
	udivcc	%o2,	0x004C,	%g3
	alignaddr	%o5,	%g5,	%o6
	movvc	%icc,	%o3,	%i2
	orn	%o4,	0x05A7,	%g7
	fornot2	%f2,	%f20,	%f24
	array32	%g4,	%o0,	%i7
	orn	%l6,	0x0484,	%l1
	movrgez	%i5,	0x335,	%g1
	sll	%i6,	%l0,	%i4
	ldsb	[%l7 + 0x48],	%l3
	fxor	%f6,	%f2,	%f4
	alignaddr	%o1,	%i0,	%o7
	xor	%l2,	%g2,	%l5
	movrlez	%l4,	0x110,	%g6
	addc	%i3,	%i1,	%g3
	ld	[%l7 + 0x5C],	%f19
	lduw	[%l7 + 0x48],	%o5
	umulcc	%o2,	0x1DE1,	%o6
	ldd	[%l7 + 0x10],	%o2
	lduh	[%l7 + 0x34],	%g5
	sdiv	%o4,	0x0773,	%i2
	fmovrde	%g4,	%f20,	%f10
	addccc	%o0,	0x1215,	%i7
	addccc	%l6,	0x0376,	%g7
	edge32n	%i5,	%l1,	%i6
	ldd	[%l7 + 0x78],	%l0
	sth	%g1,	[%l7 + 0x62]
	xorcc	%l3,	%i4,	%o1
	udivx	%i0,	0x1286,	%o7
	sir	0x0AF5
	fcmpgt32	%f2,	%f26,	%g2
	movpos	%icc,	%l2,	%l4
	fpack32	%f8,	%f6,	%f4
	edge8n	%g6,	%i3,	%i1
	fmul8x16al	%f19,	%f15,	%f4
	fsrc2	%f22,	%f2
	xnorcc	%g3,	%l5,	%o2
	movgu	%icc,	%o5,	%o6
	stw	%o3,	[%l7 + 0x18]
	array16	%g5,	%i2,	%o4
	sllx	%o0,	0x1B,	%i7
	edge8l	%g4,	%l6,	%i5
	edge16	%g7,	%l1,	%i6
	ldsh	[%l7 + 0x46],	%l0
	fmovsneg	%xcc,	%f25,	%f3
	fones	%f25
	movrlz	%g1,	%i4,	%l3
	fpack32	%f6,	%f30,	%f14
	fmovsvc	%xcc,	%f28,	%f20
	fnot1	%f20,	%f30
	udivx	%i0,	0x0D31,	%o7
	sub	%o1,	0x12EC,	%l2
	fpadd16	%f4,	%f20,	%f20
	edge8n	%g2,	%g6,	%i3
	fones	%f30
	movgu	%icc,	%l4,	%i1
	stb	%g3,	[%l7 + 0x19]
	fmovdcc	%icc,	%f13,	%f28
	movpos	%xcc,	%l5,	%o5
	edge32n	%o2,	%o3,	%g5
	fpadd16	%f22,	%f0,	%f28
	movpos	%xcc,	%o6,	%o4
	andn	%i2,	0x028D,	%i7
	fmovsn	%icc,	%f27,	%f5
	addccc	%o0,	0x0191,	%g4
	edge16l	%i5,	%l6,	%l1
	fmul8x16	%f25,	%f28,	%f12
	fone	%f14
	stb	%g7,	[%l7 + 0x27]
	edge32l	%l0,	%g1,	%i4
	movne	%xcc,	%i6,	%l3
	movrlez	%o7,	0x027,	%o1
	movle	%icc,	%i0,	%l2
	sir	0x16D8
	umul	%g2,	%g6,	%i3
	sdivx	%l4,	0x15F0,	%g3
	ldsb	[%l7 + 0x41],	%i1
	edge16l	%o5,	%l5,	%o2
	edge32ln	%g5,	%o6,	%o4
	fpsub16s	%f16,	%f13,	%f20
	udivcc	%i2,	0x1FC8,	%o3
	smulcc	%i7,	0x1DED,	%o0
	movvs	%icc,	%i5,	%g4
	fmovrslez	%l1,	%f6,	%f9
	fmovsvc	%xcc,	%f6,	%f1
	subc	%g7,	0x0CAB,	%l0
	edge16n	%l6,	%i4,	%i6
	or	%l3,	0x0A24,	%g1
	fmovd	%f24,	%f10
	xorcc	%o1,	0x0B3E,	%o7
	alignaddrl	%l2,	%g2,	%g6
	umulcc	%i3,	%i0,	%l4
	addc	%g3,	%i1,	%o5
	subc	%o2,	0x07B9,	%g5
	fmovd	%f14,	%f26
	andncc	%l5,	%o6,	%i2
	and	%o3,	%i7,	%o0
	fcmple16	%f22,	%f6,	%i5
	sub	%o4,	0x05DD,	%l1
	edge16l	%g7,	%g4,	%l0
	fpsub32	%f24,	%f18,	%f26
	array32	%i4,	%l6,	%l3
	fmovsvs	%xcc,	%f13,	%f11
	fmovrslez	%g1,	%f14,	%f30
	sth	%o1,	[%l7 + 0x3A]
	movrne	%o7,	%i6,	%g2
	stx	%l2,	[%l7 + 0x40]
	fmovrdne	%g6,	%f8,	%f8
	mulx	%i3,	0x1715,	%l4
	save %i0, %i1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	0x1F74,	%g5
	fmuld8sux16	%f25,	%f10,	%f20
	movl	%xcc,	%o5,	%o6
	sdivx	%l5,	0x09BE,	%i2
	movne	%xcc,	%i7,	%o3
	movrgez	%o0,	0x132,	%o4
	movne	%xcc,	%i5,	%g7
	udivx	%g4,	0x13C3,	%l1
	edge32l	%l0,	%i4,	%l3
	edge16n	%l6,	%o1,	%g1
	smul	%i6,	%o7,	%l2
	lduw	[%l7 + 0x08],	%g2
	sdivx	%g6,	0x0E16,	%l4
	mova	%icc,	%i0,	%i3
	sethi	0x04C0,	%g3
	movle	%xcc,	%o2,	%i1
	edge8	%g5,	%o5,	%l5
	fmovse	%xcc,	%f20,	%f20
	andn	%i2,	%o6,	%o3
	array8	%i7,	%o0,	%o4
	array16	%i5,	%g7,	%g4
	edge8n	%l1,	%i4,	%l0
	subcc	%l3,	0x1882,	%l6
	ldx	[%l7 + 0x38],	%g1
	edge8ln	%i6,	%o7,	%o1
	lduw	[%l7 + 0x60],	%g2
	pdist	%f0,	%f28,	%f20
	fcmps	%fcc1,	%f12,	%f15
	fmovsa	%icc,	%f17,	%f12
	st	%f25,	[%l7 + 0x2C]
	array32	%g6,	%l2,	%l4
	lduw	[%l7 + 0x38],	%i0
	stb	%i3,	[%l7 + 0x5D]
	fpsub32	%f24,	%f16,	%f28
	srl	%o2,	0x1C,	%i1
	sll	%g5,	0x0D,	%g3
	udiv	%o5,	0x0344,	%l5
	addccc	%i2,	0x1877,	%o6
	edge16	%i7,	%o0,	%o3
	fpmerge	%f14,	%f18,	%f0
	umulcc	%i5,	%g7,	%o4
	udivx	%g4,	0x0DF0,	%l1
	srl	%l0,	%l3,	%i4
	addccc	%l6,	0x15FD,	%g1
	fmul8x16	%f16,	%f16,	%f14
	addccc	%i6,	%o7,	%o1
	fmovrsgez	%g6,	%f29,	%f14
	fornot2s	%f29,	%f22,	%f0
	fmovrsne	%g2,	%f23,	%f22
	and	%l2,	0x0EC3,	%i0
	st	%f8,	[%l7 + 0x6C]
	fcmpne32	%f24,	%f12,	%i3
	movrgz	%o2,	%i1,	%g5
	fmul8x16au	%f15,	%f25,	%f14
	move	%xcc,	%l4,	%o5
	ldd	[%l7 + 0x18],	%l4
	movle	%xcc,	%g3,	%o6
	movrlz	%i7,	%i2,	%o3
	fmovrsne	%o0,	%f23,	%f19
	st	%f20,	[%l7 + 0x14]
	fmovrslez	%i5,	%f1,	%f28
	movneg	%icc,	%o4,	%g4
	fmovdvc	%icc,	%f21,	%f28
	movcc	%icc,	%l1,	%g7
	st	%f21,	[%l7 + 0x20]
	subc	%l3,	%l0,	%l6
	xorcc	%i4,	0x0F3B,	%i6
	mulscc	%g1,	0x1B6A,	%o1
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	save %g2, 0x01FC, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f10,	%f14
	sdiv	%i0,	0x0AA9,	%i3
	alignaddrl	%i1,	%g5,	%o2
	sra	%o5,	0x16,	%l5
	stb	%g3,	[%l7 + 0x6C]
	movrgz	%o6,	%l4,	%i7
	sth	%o3,	[%l7 + 0x72]
	edge32n	%o0,	%i5,	%o4
	movcs	%icc,	%g4,	%i2
	fones	%f6
	sdivcc	%l1,	0x0012,	%g7
	movn	%icc,	%l0,	%l3
	stb	%i4,	[%l7 + 0x18]
	mulscc	%l6,	0x12F2,	%g1
	umul	%i6,	%o1,	%g6
	mova	%icc,	%g2,	%o7
	sir	0x09D2
	fpsub32s	%f22,	%f3,	%f29
	fmovsge	%icc,	%f17,	%f5
	ldsb	[%l7 + 0x2A],	%l2
	edge8n	%i3,	%i1,	%i0
	srax	%g5,	0x02,	%o5
	movre	%l5,	%o2,	%o6
	sth	%g3,	[%l7 + 0x58]
	movpos	%icc,	%l4,	%i7
	xorcc	%o0,	%i5,	%o3
	mulx	%o4,	0x082C,	%i2
	move	%icc,	%l1,	%g7
	ldx	[%l7 + 0x40],	%l0
	alignaddrl	%l3,	%i4,	%g4
	movge	%icc,	%l6,	%g1
	fcmpne16	%f24,	%f20,	%i6
	subcc	%o1,	0x16ED,	%g2
	smulcc	%g6,	%o7,	%i3
	smul	%l2,	0x1FF3,	%i1
	edge16l	%i0,	%g5,	%l5
	movrne	%o2,	0x1DE,	%o6
	fsrc2s	%f21,	%f6
	movrlez	%g3,	0x18F,	%l4
	movneg	%xcc,	%i7,	%o5
	udiv	%o0,	0x0E36,	%o3
	sdivcc	%i5,	0x1686,	%i2
	ld	[%l7 + 0x70],	%f23
	movcs	%xcc,	%l1,	%o4
	fmovsgu	%icc,	%f15,	%f18
	movre	%l0,	%l3,	%i4
	ldx	[%l7 + 0x18],	%g7
	move	%icc,	%g4,	%g1
	xnorcc	%l6,	%o1,	%g2
	edge16ln	%g6,	%o7,	%i6
	fmovsa	%xcc,	%f9,	%f26
	st	%f10,	[%l7 + 0x70]
	move	%xcc,	%i3,	%l2
	orncc	%i0,	%i1,	%l5
	udiv	%o2,	0x1C84,	%g5
	alignaddr	%g3,	%o6,	%i7
	srax	%l4,	0x1C,	%o0
	smul	%o3,	0x0AFD,	%o5
	sir	0x0A8E
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%i5
	ldsh	[%l7 + 0x68],	%i2
	and	%o4,	0x0D5C,	%l1
	edge32l	%l3,	%i4,	%g7
	orn	%l0,	%g1,	%g4
	add	%l6,	%g2,	%g6
	fandnot1s	%f14,	%f16,	%f20
	ldd	[%l7 + 0x70],	%o6
	ldd	[%l7 + 0x70],	%o0
	edge16n	%i3,	%i6,	%l2
	fones	%f6
	subcc	%i1,	0x0F66,	%i0
	sub	%l5,	%o2,	%g3
	ldd	[%l7 + 0x68],	%f18
	fmovdgu	%xcc,	%f14,	%f30
	edge8l	%o6,	%g5,	%l4
	edge16n	%o0,	%o3,	%o5
	fmovsge	%icc,	%f14,	%f9
	andcc	%i5,	%i7,	%i2
	popc	0x073B,	%l1
	edge16l	%l3,	%o4,	%i4
	sir	0x0BF0
	orcc	%l0,	%g7,	%g1
	nop
	set	0x50, %g6
	stx	%l6,	[%l7 + %g6]
	udivx	%g4,	0x1120,	%g6
	fones	%f1
	movg	%xcc,	%g2,	%o1
	fmovdvs	%xcc,	%f18,	%f18
	fpadd16s	%f15,	%f28,	%f28
	movn	%icc,	%i3,	%i6
	edge16ln	%l2,	%o7,	%i1
	smulcc	%l5,	0x1552,	%i0
	stw	%g3,	[%l7 + 0x68]
	andn	%o2,	%g5,	%o6
	udiv	%o0,	0x098D,	%o3
	fmovdgu	%xcc,	%f12,	%f3
	fnot2s	%f4,	%f23
	movcs	%xcc,	%o5,	%l4
	fmovrsne	%i7,	%f3,	%f16
	addc	%i2,	0x070C,	%i5
	movrne	%l1,	%o4,	%i4
	movg	%icc,	%l0,	%g7
	lduh	[%l7 + 0x2E],	%l3
	fmovsl	%icc,	%f23,	%f0
	lduw	[%l7 + 0x6C],	%g1
	sllx	%l6,	0x0F,	%g4
	ldsb	[%l7 + 0x28],	%g6
	movg	%xcc,	%o1,	%g2
	add	%i3,	%i6,	%o7
	movvs	%icc,	%i1,	%l5
	fmovsneg	%xcc,	%f0,	%f0
	alignaddrl	%i0,	%g3,	%l2
	ldub	[%l7 + 0x61],	%g5
	fcmple16	%f10,	%f14,	%o6
	edge32l	%o2,	%o0,	%o5
	lduh	[%l7 + 0x46],	%l4
	movrgz	%i7,	%o3,	%i5
	save %i2, %o4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%l0,	%l3
	fmovs	%f6,	%f21
	srl	%g7,	%l6,	%g1
	edge8	%g4,	%g6,	%o1
	mulx	%i3,	0x05B6,	%g2
	fmovscc	%icc,	%f9,	%f28
	sdivcc	%o7,	0x18C9,	%i1
	alignaddr	%i6,	%l5,	%g3
	st	%f2,	[%l7 + 0x58]
	stx	%i0,	[%l7 + 0x10]
	srlx	%l2,	0x17,	%g5
	edge32l	%o2,	%o0,	%o6
	edge16l	%o5,	%l4,	%o3
	fmovdgu	%icc,	%f17,	%f6
	bshuffle	%f10,	%f16,	%f16
	edge8n	%i7,	%i5,	%i2
	edge32n	%i4,	%o4,	%l0
	xnorcc	%l1,	0x04A3,	%g7
	mova	%icc,	%l6,	%g1
	sir	0x000D
	fxors	%f26,	%f8,	%f19
	ldd	[%l7 + 0x08],	%g4
	lduw	[%l7 + 0x2C],	%g6
	ldsb	[%l7 + 0x2E],	%o1
	movneg	%icc,	%l3,	%g2
	subccc	%o7,	0x18C4,	%i1
	xnor	%i6,	0x1EEA,	%i3
	edge16l	%g3,	%i0,	%l2
	sdivx	%g5,	0x0E39,	%o2
	fpmerge	%f26,	%f5,	%f2
	fmovscc	%xcc,	%f9,	%f23
	array32	%l5,	%o6,	%o0
	movrgez	%o5,	0x0BB,	%l4
	subc	%o3,	0x126E,	%i7
	edge16l	%i2,	%i5,	%o4
	movle	%xcc,	%l0,	%i4
	nop
	set	0x38, %g3
	ldsb	[%l7 + %g3],	%g7
	orcc	%l1,	%g1,	%l6
	st	%f24,	[%l7 + 0x48]
	movrgz	%g6,	%g4,	%l3
	xnorcc	%g2,	0x079F,	%o1
	smulcc	%o7,	0x0D33,	%i6
	sllx	%i1,	%g3,	%i3
	edge16ln	%l2,	%i0,	%g5
	fpsub32	%f14,	%f16,	%f24
	array16	%o2,	%o6,	%l5
	movrgz	%o5,	%l4,	%o3
	movrgz	%o0,	0x2EF,	%i7
	alignaddr	%i5,	%i2,	%o4
	xnorcc	%l0,	0x1728,	%g7
	edge32ln	%l1,	%g1,	%i4
	movl	%xcc,	%g6,	%g4
	fcmpne32	%f22,	%f20,	%l6
	umul	%g2,	0x1C8E,	%o1
	fmovrsgez	%o7,	%f5,	%f19
	sdivx	%l3,	0x00C5,	%i1
	ldd	[%l7 + 0x68],	%g2
	movcc	%icc,	%i3,	%i6
	fone	%f22
	movre	%i0,	%l2,	%o2
	movg	%icc,	%o6,	%l5
	smulcc	%o5,	%g5,	%o3
	move	%xcc,	%l4,	%o0
	fmovsge	%xcc,	%f1,	%f13
	popc	%i5,	%i7
	movn	%xcc,	%i2,	%o4
	array32	%l0,	%l1,	%g1
	edge16n	%i4,	%g7,	%g6
	ldsw	[%l7 + 0x48],	%g4
	or	%g2,	0x1287,	%o1
	xor	%o7,	0x104B,	%l6
	ld	[%l7 + 0x0C],	%f11
	orcc	%l3,	%g3,	%i1
	srl	%i6,	%i0,	%i3
	edge8	%l2,	%o6,	%o2
	addcc	%l5,	%g5,	%o5
	andn	%o3,	0x0AEE,	%l4
	fmovdcc	%icc,	%f0,	%f17
	fpadd32	%f2,	%f10,	%f10
	fmovrsne	%o0,	%f16,	%f3
	addcc	%i5,	0x1640,	%i7
	sllx	%o4,	%i2,	%l0
	fmovrdgz	%g1,	%f20,	%f22
	udivcc	%l1,	0x1EC8,	%i4
	fpadd16s	%f13,	%f29,	%f8
	fmovdneg	%xcc,	%f2,	%f1
	sllx	%g7,	%g6,	%g2
	edge16	%o1,	%g4,	%o7
	edge16n	%l3,	%g3,	%l6
	fnand	%f8,	%f6,	%f8
	fmovsvc	%icc,	%f14,	%f16
	fpack32	%f18,	%f30,	%f28
	nop
	set	0x28, %i2
	std	%f10,	[%l7 + %i2]
	faligndata	%f26,	%f26,	%f12
	restore %i6, %i0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l2,	%i3,	%o6
	sethi	0x06A6,	%o2
	fexpand	%f5,	%f20
	movrne	%l5,	0x352,	%g5
	array32	%o3,	%l4,	%o0
	xorcc	%i5,	%i7,	%o4
	ldub	[%l7 + 0x52],	%i2
	movrlez	%l0,	%g1,	%l1
	alignaddrl	%o5,	%g7,	%i4
	movrgez	%g6,	%g2,	%g4
	sdivcc	%o1,	0x12B7,	%o7
	fmovdpos	%xcc,	%f5,	%f11
	stw	%g3,	[%l7 + 0x10]
	fpsub32	%f22,	%f16,	%f12
	fpmerge	%f10,	%f14,	%f14
	smulcc	%l3,	0x127B,	%l6
	movn	%xcc,	%i6,	%i0
	stx	%i1,	[%l7 + 0x40]
	fmovdvs	%icc,	%f25,	%f17
	std	%f22,	[%l7 + 0x58]
	ld	[%l7 + 0x7C],	%f24
	fpsub32s	%f3,	%f16,	%f24
	alignaddr	%i3,	%l2,	%o2
	sethi	0x002A,	%l5
	movne	%icc,	%g5,	%o6
	st	%f9,	[%l7 + 0x18]
	fzeros	%f0
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o3
	stw	%l4,	[%l7 + 0x3C]
	movcs	%xcc,	%o0,	%i7
	movrne	%i5,	0x1A5,	%o4
	edge8n	%l0,	%g1,	%l1
	udiv	%i2,	0x1CDF,	%o5
	sra	%i4,	%g7,	%g2
	edge16	%g4,	%o1,	%o7
	sra	%g3,	0x0A,	%l3
	udivx	%g6,	0x0071,	%l6
	movpos	%icc,	%i0,	%i1
	fands	%f20,	%f27,	%f7
	movne	%icc,	%i6,	%i3
	alignaddr	%o2,	%l5,	%g5
	and	%l2,	%o6,	%l4
	sethi	0x0848,	%o0
	fmovrsgz	%o3,	%f12,	%f14
	array16	%i7,	%o4,	%l0
	std	%f24,	[%l7 + 0x68]
	sdivx	%g1,	0x027E,	%i5
	movvc	%icc,	%i2,	%l1
	fmovdn	%icc,	%f31,	%f15
	edge8l	%o5,	%g7,	%g2
	ldd	[%l7 + 0x08],	%g4
	or	%o1,	%i4,	%o7
	lduw	[%l7 + 0x40],	%g3
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	edge8n	%i0,	%i1,	%i6
	array8	%i3,	%o2,	%g5
	xnor	%l2,	0x1936,	%l5
	subcc	%l4,	0x0B8E,	%o6
	smul	%o3,	0x08FC,	%o0
	movrgez	%i7,	0x11D,	%l0
	movneg	%icc,	%g1,	%o4
	ldsb	[%l7 + 0x24],	%i2
	alignaddr	%i5,	%o5,	%g7
	siam	0x0
	edge8n	%l1,	%g4,	%g2
	lduh	[%l7 + 0x4A],	%o1
	ldx	[%l7 + 0x38],	%o7
	ldsh	[%l7 + 0x54],	%i4
	fmovdne	%icc,	%f30,	%f22
	sllx	%g6,	%l3,	%g3
	movpos	%xcc,	%i0,	%i1
	add	%i6,	%l6,	%i3
	movcs	%icc,	%o2,	%g5
	fones	%f11
	sethi	0x0EAD,	%l2
	sra	%l5,	0x09,	%o6
	andn	%l4,	0x1BCA,	%o3
	movne	%icc,	%i7,	%o0
	array8	%g1,	%l0,	%i2
	movvc	%xcc,	%o4,	%i5
	addcc	%g7,	0x1410,	%l1
	fnors	%f19,	%f23,	%f8
	movrgez	%g4,	0x3BA,	%o5
	fmovrdgez	%o1,	%f0,	%f6
	movne	%xcc,	%o7,	%i4
	ldx	[%l7 + 0x20],	%g6
	sdivcc	%g2,	0x0DB9,	%l3
	sllx	%g3,	0x00,	%i1
	fnegd	%f18,	%f14
	movrgez	%i6,	%l6,	%i0
	array16	%o2,	%g5,	%l2
	movvc	%icc,	%l5,	%i3
	save %o6, 0x17BB, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i7,	%o3,	%o0
	movpos	%icc,	%g1,	%i2
	fzero	%f26
	movleu	%icc,	%l0,	%o4
	mulscc	%g7,	0x1459,	%i5
	orn	%l1,	0x0742,	%o5
	sll	%o1,	0x19,	%g4
	subccc	%o7,	0x0084,	%g6
	std	%f16,	[%l7 + 0x20]
	movge	%icc,	%i4,	%g2
	movvs	%icc,	%l3,	%i1
	restore %g3, 0x116C, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%i6,	%f2,	%f14
	andcc	%i0,	0x173B,	%o2
	fandnot1s	%f4,	%f31,	%f2
	xnorcc	%l2,	%l5,	%g5
	fexpand	%f22,	%f14
	nop
	set	0x36, %o3
	lduh	[%l7 + %o3],	%o6
	sdivx	%i3,	0x0F22,	%i7
	movvc	%xcc,	%o3,	%l4
	movne	%icc,	%g1,	%o0
	fornot1s	%f27,	%f17,	%f30
	stw	%i2,	[%l7 + 0x50]
	xor	%o4,	%l0,	%i5
	xor	%l1,	%g7,	%o1
	orcc	%g4,	%o5,	%g6
	srl	%i4,	0x13,	%o7
	add	%l3,	%g2,	%g3
	movrlz	%i1,	0x17B,	%i6
	ldub	[%l7 + 0x6D],	%i0
	sethi	0x16F1,	%o2
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%i6
	edge8ln	%l2,	%g5,	%o6
	movleu	%icc,	%l5,	%i7
	movn	%xcc,	%o3,	%i3
	ldx	[%l7 + 0x58],	%g1
	movrgz	%l4,	0x244,	%i2
	sdiv	%o0,	0x11B9,	%o4
	sth	%i5,	[%l7 + 0x36]
	fmovdleu	%icc,	%f8,	%f10
	ldd	[%l7 + 0x10],	%l0
	addcc	%g7,	%o1,	%l1
	sub	%g4,	0x0427,	%g6
	fcmple16	%f16,	%f20,	%i4
	movvc	%xcc,	%o5,	%o7
	fmovspos	%icc,	%f30,	%f19
	movle	%icc,	%l3,	%g2
	fpackfix	%f0,	%f1
	fpack32	%f6,	%f8,	%f16
	movpos	%icc,	%i1,	%g3
	sub	%i6,	%i0,	%l6
	sdivcc	%o2,	0x0A9A,	%l2
	movpos	%icc,	%o6,	%l5
	or	%g5,	%i7,	%i3
	xnorcc	%g1,	%l4,	%i2
	smul	%o0,	0x1F26,	%o3
	umul	%i5,	0x1F24,	%o4
	andcc	%g7,	0x18B7,	%l0
	alignaddr	%l1,	%o1,	%g6
	sir	0x0897
	ldd	[%l7 + 0x68],	%f24
	xorcc	%g4,	%i4,	%o7
	alignaddrl	%l3,	%g2,	%o5
	lduw	[%l7 + 0x3C],	%i1
	fmovdne	%xcc,	%f19,	%f11
	edge8n	%g3,	%i0,	%i6
	movle	%xcc,	%l6,	%o2
	ldub	[%l7 + 0x64],	%l2
	xnor	%l5,	%g5,	%o6
	sethi	0x1ABC,	%i3
	std	%f16,	[%l7 + 0x58]
	fpsub32s	%f1,	%f26,	%f2
	edge32	%i7,	%l4,	%g1
	umul	%o0,	0x0A39,	%i2
	srlx	%i5,	%o3,	%g7
	edge32	%l0,	%l1,	%o4
	fcmpne32	%f2,	%f0,	%g6
	edge16n	%g4,	%i4,	%o7
	fnand	%f24,	%f24,	%f20
	std	%f8,	[%l7 + 0x20]
	lduh	[%l7 + 0x1C],	%o1
	orncc	%g2,	%o5,	%i1
	orn	%g3,	0x1023,	%i0
	fmovrde	%l3,	%f8,	%f10
	edge8n	%l6,	%i6,	%l2
	bshuffle	%f8,	%f20,	%f16
	movvc	%icc,	%o2,	%l5
	fnot2	%f0,	%f6
	xnorcc	%o6,	0x0C94,	%i3
	edge16	%i7,	%g5,	%l4
	ld	[%l7 + 0x64],	%f26
	fzero	%f0
	edge32ln	%o0,	%i2,	%g1
	fmul8x16al	%f27,	%f9,	%f14
	sth	%o3,	[%l7 + 0x30]
	fabsd	%f24,	%f0
	movg	%xcc,	%i5,	%g7
	movrne	%l0,	%o4,	%l1
	movge	%xcc,	%g4,	%g6
	edge32n	%o7,	%i4,	%o1
	movgu	%xcc,	%o5,	%i1
	fmovscs	%xcc,	%f27,	%f6
	array8	%g3,	%i0,	%g2
	fmovsne	%xcc,	%f13,	%f12
	fmovrdgz	%l3,	%f24,	%f16
	mova	%icc,	%l6,	%l2
	subc	%i6,	%o2,	%o6
	sub	%i3,	%l5,	%i7
	fones	%f18
	fmovrdlez	%l4,	%f18,	%f12
	subc	%o0,	%i2,	%g5
	fmovrdlz	%g1,	%f16,	%f6
	fmovscc	%xcc,	%f21,	%f5
	mova	%icc,	%i5,	%o3
	movvc	%xcc,	%g7,	%l0
	orn	%l1,	0x127D,	%g4
	ldd	[%l7 + 0x78],	%f28
	movre	%o4,	%g6,	%i4
	movre	%o1,	%o7,	%o5
	bshuffle	%f24,	%f14,	%f14
	fmul8sux16	%f4,	%f14,	%f2
	movge	%xcc,	%i1,	%g3
	addccc	%g2,	%l3,	%i0
	movge	%xcc,	%l6,	%l2
	movcs	%icc,	%o2,	%o6
	ldx	[%l7 + 0x38],	%i3
	sth	%i6,	[%l7 + 0x22]
	nop
	set	0x70, %i3
	std	%f12,	[%l7 + %i3]
	andncc	%i7,	%l5,	%o0
	srl	%i2,	%l4,	%g1
	fcmpne32	%f24,	%f22,	%g5
	edge16ln	%o3,	%i5,	%g7
	fmovscc	%icc,	%f20,	%f0
	edge8n	%l1,	%g4,	%o4
	mova	%xcc,	%g6,	%l0
	mulscc	%i4,	0x08F0,	%o1
	fcmple16	%f0,	%f22,	%o5
	save %o7, 0x15A5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g2,	0x21D,	%l3
	subc	%i1,	0x0B07,	%i0
	fmovsle	%icc,	%f13,	%f25
	sdiv	%l2,	0x05AF,	%l6
	sdivcc	%o2,	0x1CFA,	%i3
	subccc	%i6,	0x0DE3,	%i7
	smulcc	%o6,	%l5,	%i2
	fnor	%f10,	%f2,	%f28
	fones	%f0
	subccc	%l4,	0x01C9,	%g1
	sdiv	%o0,	0x1F70,	%o3
	fmul8x16al	%f24,	%f20,	%f30
	mulscc	%g5,	0x01D4,	%g7
	sllx	%l1,	%i5,	%g4
	addcc	%g6,	%o4,	%l0
	fnor	%f8,	%f0,	%f18
	xorcc	%i4,	0x16A2,	%o1
	array16	%o7,	%g3,	%g2
	edge8ln	%l3,	%i1,	%o5
	fmovsg	%icc,	%f10,	%f13
	edge32ln	%l2,	%l6,	%o2
	movleu	%xcc,	%i3,	%i6
	popc	0x0788,	%i0
	subccc	%o6,	%l5,	%i7
	edge8l	%l4,	%g1,	%o0
	fpadd32	%f30,	%f28,	%f28
	sdivcc	%i2,	0x0985,	%g5
	sir	0x1A25
	mulscc	%o3,	%l1,	%i5
	xor	%g4,	0x1918,	%g6
	fmovsn	%xcc,	%f2,	%f30
	movvs	%icc,	%o4,	%l0
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%g7
	smul	%i4,	0x07B1,	%o1
	movvs	%xcc,	%g3,	%o7
	st	%f6,	[%l7 + 0x50]
	sir	0x0A36
	array8	%l3,	%g2,	%o5
	udiv	%l2,	0x0B77,	%l6
	srlx	%o2,	0x06,	%i1
	xor	%i3,	0x0876,	%i0
	sdiv	%o6,	0x1702,	%l5
	andncc	%i6,	%l4,	%g1
	fcmpne32	%f4,	%f22,	%i7
	ldd	[%l7 + 0x08],	%f0
	popc	0x1414,	%o0
	fpadd32s	%f8,	%f21,	%f18
	ldub	[%l7 + 0x22],	%g5
	std	%f26,	[%l7 + 0x60]
	movl	%xcc,	%i2,	%l1
	fmovdge	%icc,	%f21,	%f1
	andn	%i5,	0x1539,	%g4
	udiv	%o3,	0x1997,	%o4
	fmovrdlez	%l0,	%f30,	%f20
	fmovdcs	%icc,	%f4,	%f24
	lduw	[%l7 + 0x78],	%g7
	edge8	%g6,	%o1,	%i4
	fpadd32s	%f10,	%f15,	%f9
	sir	0x0429
	ldd	[%l7 + 0x60],	%f2
	sth	%o7,	[%l7 + 0x50]
	andcc	%l3,	0x0D1A,	%g2
	ldd	[%l7 + 0x18],	%o4
	alignaddrl	%l2,	%g3,	%o2
	sdivcc	%l6,	0x0BD7,	%i3
	array8	%i1,	%o6,	%i0
	movpos	%icc,	%i6,	%l4
	andn	%l5,	%g1,	%i7
	fmovdl	%icc,	%f8,	%f18
	orncc	%o0,	0x11F2,	%g5
	movne	%xcc,	%i2,	%i5
	siam	0x1
	movvs	%xcc,	%g4,	%l1
	sll	%o3,	%l0,	%o4
	movrlez	%g7,	0x1F3,	%o1
	subccc	%i4,	0x04C4,	%o7
	orcc	%l3,	%g2,	%g6
	stw	%l2,	[%l7 + 0x10]
	movle	%icc,	%o5,	%o2
	fpadd32	%f22,	%f14,	%f26
	fmovdge	%icc,	%f16,	%f4
	sethi	0x01E9,	%l6
	umul	%i3,	0x0CD3,	%g3
	ldub	[%l7 + 0x50],	%o6
	andcc	%i1,	%i0,	%l4
	srl	%i6,	%l5,	%g1
	addccc	%i7,	%g5,	%o0
	orncc	%i5,	%g4,	%i2
	pdist	%f20,	%f26,	%f26
	add	%o3,	%l0,	%o4
	movcc	%icc,	%l1,	%g7
	movl	%xcc,	%o1,	%o7
	sdivx	%i4,	0x13C5,	%g2
	ldd	[%l7 + 0x18],	%f6
	srl	%l3,	0x0E,	%l2
	fands	%f22,	%f4,	%f22
	srax	%o5,	0x17,	%o2
	edge8	%l6,	%g6,	%g3
	fsrc1s	%f18,	%f3
	sub	%o6,	0x1526,	%i3
	fpsub32	%f14,	%f6,	%f0
	movgu	%xcc,	%i1,	%l4
	subc	%i0,	0x0E01,	%l5
	or	%g1,	0x1B3A,	%i7
	movleu	%icc,	%i6,	%o0
	edge8l	%i5,	%g4,	%g5
	andncc	%o3,	%i2,	%o4
	mulx	%l1,	%l0,	%o1
	udivcc	%o7,	0x0A7D,	%g7
	movvs	%xcc,	%g2,	%i4
	smul	%l3,	0x1528,	%l2
	xnor	%o5,	0x1DD0,	%l6
	edge32n	%o2,	%g6,	%g3
	addccc	%o6,	0x121E,	%i3
	add	%l4,	0x0FEC,	%i1
	edge32ln	%l5,	%i0,	%g1
	edge8l	%i6,	%o0,	%i5
	fpadd32s	%f13,	%f2,	%f6
	subc	%g4,	%g5,	%i7
	sdiv	%i2,	0x01AB,	%o4
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	movrgez	%l0,	%o1,	%o7
	srl	%g7,	%i4,	%g2
	srlx	%l2,	%l3,	%l6
	edge8n	%o2,	%g6,	%o5
	srl	%g3,	%i3,	%l4
	popc	0x1DA9,	%i1
	fandnot1s	%f7,	%f5,	%f21
	xnor	%o6,	%l5,	%i0
	udivx	%i6,	0x0A9E,	%g1
	movl	%xcc,	%o0,	%i5
	fmovsl	%icc,	%f7,	%f27
	movneg	%xcc,	%g5,	%g4
	fpadd16s	%f12,	%f19,	%f23
	smul	%i2,	0x19F8,	%o4
	fcmple32	%f8,	%f6,	%i7
	fmovsa	%xcc,	%f28,	%f2
	fmovsa	%icc,	%f12,	%f4
	fmovs	%f24,	%f19
	movvs	%xcc,	%l1,	%l0
	andcc	%o1,	%o7,	%o3
	stx	%g7,	[%l7 + 0x38]
	umul	%i4,	0x0151,	%g2
	fpack32	%f0,	%f22,	%f14
	fmovrsgz	%l2,	%f3,	%f5
	sdiv	%l6,	0x10DD,	%l3
	sdivx	%g6,	0x1F54,	%o2
	fmovdneg	%icc,	%f2,	%f16
	movrgz	%o5,	%g3,	%i3
	fpsub16s	%f6,	%f4,	%f4
	movne	%icc,	%l4,	%i1
	subc	%o6,	%i0,	%i6
	edge16l	%l5,	%g1,	%i5
	edge8l	%g5,	%o0,	%g4
	move	%xcc,	%o4,	%i7
	array16	%i2,	%l1,	%o1
	fmovrsne	%o7,	%f0,	%f19
	popc	%l0,	%o3
	stx	%i4,	[%l7 + 0x58]
	movne	%xcc,	%g7,	%g2
	udivcc	%l2,	0x0C5C,	%l6
	udivx	%l3,	0x1151,	%o2
	movrgz	%g6,	%g3,	%o5
	alignaddrl	%i3,	%i1,	%o6
	fmul8sux16	%f26,	%f12,	%f16
	xor	%i0,	0x0295,	%l4
	or	%l5,	0x1AEE,	%g1
	xnorcc	%i5,	0x1FD7,	%g5
	restore %i6, %o0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f26,	%f18,	%f10
	smulcc	%g4,	0x12F6,	%i2
	movneg	%xcc,	%l1,	%i7
	add	%o7,	0x0FA2,	%l0
	sdivx	%o3,	0x17EC,	%i4
	movneg	%xcc,	%o1,	%g2
	fmovs	%f13,	%f19
	edge16l	%l2,	%l6,	%l3
	save %o2, %g7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o5,	[%l7 + 0x51]
	edge16l	%g3,	%i1,	%o6
	andn	%i3,	0x18A2,	%l4
	sllx	%i0,	0x1E,	%l5
	edge32	%i5,	%g5,	%g1
	move	%xcc,	%o0,	%o4
	edge8	%g4,	%i6,	%l1
	movgu	%xcc,	%i7,	%o7
	fnot1	%f14,	%f10
	ld	[%l7 + 0x10],	%f2
	movl	%xcc,	%l0,	%i2
	ld	[%l7 + 0x20],	%f0
	std	%f26,	[%l7 + 0x48]
	stx	%o3,	[%l7 + 0x78]
	fpsub16s	%f5,	%f20,	%f10
	movrlez	%o1,	0x187,	%g2
	orn	%l2,	%l6,	%l3
	edge8ln	%o2,	%i4,	%g7
	ldub	[%l7 + 0x18],	%o5
	movne	%xcc,	%g6,	%g3
	fmovsgu	%xcc,	%f12,	%f28
	edge8n	%i1,	%i3,	%l4
	nop
	set	0x42, %o5
	sth	%i0,	[%l7 + %o5]
	ldd	[%l7 + 0x30],	%f20
	lduw	[%l7 + 0x78],	%o6
	sth	%i5,	[%l7 + 0x3E]
	ld	[%l7 + 0x2C],	%f16
	ldsh	[%l7 + 0x3A],	%l5
	subccc	%g1,	%g5,	%o0
	movg	%icc,	%o4,	%g4
	stw	%i6,	[%l7 + 0x18]
	alignaddrl	%l1,	%o7,	%l0
	xnorcc	%i2,	%i7,	%o3
	sllx	%g2,	0x09,	%l2
	fcmps	%fcc0,	%f1,	%f17
	udiv	%l6,	0x0FE6,	%o1
	movn	%icc,	%l3,	%o2
	edge32	%g7,	%o5,	%i4
	sdiv	%g3,	0x1329,	%i1
	movpos	%icc,	%g6,	%l4
	movg	%xcc,	%i0,	%i3
	edge16l	%o6,	%i5,	%g1
	ldx	[%l7 + 0x28],	%l5
	addcc	%o0,	%o4,	%g5
	fmovrdlez	%g4,	%f16,	%f20
	edge32l	%l1,	%o7,	%l0
	faligndata	%f4,	%f28,	%f30
	fmovs	%f14,	%f7
	fmovd	%f4,	%f8
	movg	%icc,	%i2,	%i6
	ldub	[%l7 + 0x66],	%i7
	edge8	%g2,	%l2,	%l6
	addcc	%o3,	%o1,	%o2
	edge32	%g7,	%o5,	%l3
	udivx	%g3,	0x0044,	%i1
	sethi	0x0321,	%i4
	umulcc	%l4,	0x09EB,	%i0
	fandnot2s	%f28,	%f28,	%f30
	subcc	%i3,	0x0460,	%g6
	movrlez	%i5,	%g1,	%l5
	edge8	%o6,	%o0,	%g5
	ldub	[%l7 + 0x24],	%o4
	mova	%xcc,	%l1,	%o7
	addccc	%g4,	%l0,	%i6
	orcc	%i2,	0x0032,	%g2
	popc	0x1EA1,	%i7
	subc	%l6,	0x17E0,	%o3
	fmovrdgz	%l2,	%f6,	%f2
	ld	[%l7 + 0x28],	%f27
	fabss	%f3,	%f6
	orcc	%o2,	%g7,	%o5
	movrgez	%o1,	0x19B,	%g3
	movne	%icc,	%l3,	%i4
	and	%i1,	0x0916,	%i0
	umulcc	%l4,	%i3,	%g6
	udivcc	%i5,	0x1819,	%l5
	fexpand	%f14,	%f14
	lduw	[%l7 + 0x50],	%g1
	fnot2	%f16,	%f0
	movre	%o6,	0x242,	%g5
	ldd	[%l7 + 0x58],	%o0
	movl	%icc,	%o4,	%o7
	sethi	0x193D,	%g4
	fmovdg	%icc,	%f30,	%f13
	fpadd32s	%f6,	%f0,	%f20
	sdiv	%l0,	0x05ED,	%i6
	movrlz	%i2,	%g2,	%i7
	ldub	[%l7 + 0x1F],	%l6
	mulx	%l1,	%o3,	%l2
	edge8l	%o2,	%g7,	%o5
	movn	%icc,	%g3,	%o1
	fabsd	%f10,	%f30
	srlx	%i4,	0x01,	%l3
	fmovdcc	%xcc,	%f23,	%f25
	addcc	%i1,	0x152E,	%l4
	movre	%i3,	0x3E1,	%i0
	srax	%i5,	%g6,	%g1
	fcmpeq32	%f14,	%f6,	%l5
	fmovscc	%icc,	%f9,	%f24
	ldsb	[%l7 + 0x15],	%o6
	movge	%xcc,	%o0,	%g5
	ld	[%l7 + 0x28],	%f6
	movrlz	%o4,	%o7,	%l0
	addc	%i6,	%i2,	%g2
	array32	%i7,	%g4,	%l6
	mova	%icc,	%l1,	%l2
	sub	%o2,	%g7,	%o5
	ldd	[%l7 + 0x10],	%o2
	fmovsg	%xcc,	%f22,	%f16
	movne	%icc,	%g3,	%o1
	movrne	%l3,	%i1,	%i4
	andcc	%i3,	%l4,	%i0
	edge8l	%g6,	%g1,	%l5
	fmovrslz	%o6,	%f28,	%f28
	edge16n	%i5,	%g5,	%o0
	edge16ln	%o7,	%l0,	%o4
	movge	%icc,	%i2,	%i6
	edge16l	%i7,	%g4,	%l6
	fmul8x16au	%f21,	%f13,	%f6
	fcmpeq16	%f8,	%f14,	%l1
	edge32l	%g2,	%l2,	%g7
	ldsw	[%l7 + 0x68],	%o2
	sra	%o5,	%o3,	%g3
	sdivcc	%l3,	0x0CCB,	%i1
	fmovdgu	%xcc,	%f16,	%f2
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	movrgz	%i3,	0x330,	%i0
	umul	%g1,	%l5,	%g6
	movrlz	%i5,	0x0C5,	%o6
	udiv	%o0,	0x0154,	%g5
	fnors	%f25,	%f16,	%f28
	fpsub32s	%f8,	%f19,	%f4
	lduh	[%l7 + 0x6C],	%o7
	fcmpne16	%f24,	%f22,	%o4
	sth	%i2,	[%l7 + 0x3A]
	sdivcc	%i6,	0x0D8E,	%i7
	subccc	%g4,	0x0474,	%l6
	srl	%l0,	%l1,	%l2
	umulcc	%g2,	%g7,	%o5
	fsrc1	%f30,	%f16
	edge16ln	%o3,	%o2,	%l3
	orcc	%i1,	%g3,	%i4
	subcc	%o1,	%i3,	%i0
	sdivcc	%l4,	0x199D,	%l5
	movrgz	%g6,	0x2F1,	%g1
	addccc	%o6,	%o0,	%g5
	sethi	0x16AE,	%i5
	nop
	set	0x20, %i5
	stx	%o7,	[%l7 + %i5]
	fmovsvs	%icc,	%f31,	%f10
	fpsub16s	%f11,	%f30,	%f23
	movcs	%icc,	%i2,	%o4
	fmul8x16	%f27,	%f16,	%f18
	fnand	%f12,	%f22,	%f26
	edge16ln	%i6,	%i7,	%l6
	edge16l	%g4,	%l1,	%l0
	movrgez	%l2,	%g7,	%o5
	popc	%g2,	%o3
	movrgez	%l3,	%i1,	%g3
	udivx	%i4,	0x0529,	%o2
	sth	%i3,	[%l7 + 0x54]
	edge32l	%o1,	%l4,	%i0
	orn	%l5,	%g6,	%o6
	udivcc	%g1,	0x0490,	%g5
	stw	%o0,	[%l7 + 0x5C]
	fmovdgu	%xcc,	%f0,	%f8
	xorcc	%o7,	%i5,	%i2
	sethi	0x0BF8,	%o4
	sll	%i6,	0x02,	%i7
	fmovrslz	%l6,	%f28,	%f0
	sll	%l1,	%l0,	%g4
	srax	%l2,	0x02,	%g7
	edge16	%o5,	%g2,	%o3
	edge32n	%i1,	%l3,	%i4
	andncc	%g3,	%i3,	%o1
	save %o2, 0x0A83, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f18,	[%l7 + 0x48]
	sll	%i0,	%g6,	%l5
	srlx	%o6,	%g1,	%o0
	fmovsvc	%xcc,	%f20,	%f1
	lduw	[%l7 + 0x40],	%o7
	edge32	%g5,	%i5,	%i2
	ldub	[%l7 + 0x41],	%i6
	udivcc	%i7,	0x0EA0,	%l6
	fzeros	%f9
	edge16l	%o4,	%l1,	%g4
	movleu	%icc,	%l2,	%g7
	fxnors	%f4,	%f11,	%f18
	addccc	%o5,	0x19F6,	%g2
	edge16ln	%l0,	%i1,	%l3
	edge32ln	%o3,	%g3,	%i4
	srax	%o1,	%o2,	%l4
	faligndata	%f26,	%f2,	%f30
	fnot1	%f0,	%f14
	mulscc	%i0,	0x18E5,	%g6
	fpadd16	%f14,	%f6,	%f14
	sll	%i3,	0x1D,	%o6
	fxor	%f8,	%f26,	%f16
	andncc	%g1,	%l5,	%o0
	movge	%icc,	%g5,	%i5
	orn	%i2,	0x167A,	%i6
	movge	%icc,	%i7,	%o7
	xor	%l6,	0x1223,	%o4
	movrgez	%g4,	0x14F,	%l1
	nop
	set	0x10, %g2
	ldsb	[%l7 + %g2],	%g7
	ldd	[%l7 + 0x40],	%o4
	ldub	[%l7 + 0x34],	%l2
	fsrc1s	%f8,	%f1
	fmovrdgz	%l0,	%f12,	%f18
	array32	%g2,	%l3,	%i1
	fmovse	%xcc,	%f9,	%f8
	movge	%xcc,	%o3,	%g3
	sra	%i4,	0x06,	%o2
	xor	%l4,	0x0315,	%o1
	ldd	[%l7 + 0x18],	%i0
	nop
	set	0x3C, %o2
	lduw	[%l7 + %o2],	%i3
	array32	%g6,	%g1,	%o6
	fmovrse	%o0,	%f20,	%f6
	st	%f22,	[%l7 + 0x14]
	fxnor	%f30,	%f8,	%f16
	fmovrslz	%g5,	%f24,	%f23
	ldub	[%l7 + 0x4C],	%l5
	umulcc	%i2,	%i5,	%i6
	fmovrdlz	%o7,	%f0,	%f28
	sllx	%i7,	0x1B,	%o4
	or	%l6,	%g4,	%l1
	add	%o5,	%g7,	%l0
	edge8l	%l2,	%l3,	%i1
	ldsb	[%l7 + 0x14],	%o3
	fmul8ulx16	%f24,	%f12,	%f10
	lduh	[%l7 + 0x7C],	%g2
	fmul8x16al	%f18,	%f19,	%f30
	ld	[%l7 + 0x64],	%f14
	sdiv	%g3,	0x1EB1,	%i4
	mulscc	%l4,	0x1862,	%o2
	movvc	%icc,	%i0,	%o1
	sethi	0x0E4B,	%i3
	stw	%g1,	[%l7 + 0x30]
	movge	%xcc,	%o6,	%g6
	fmovrdne	%o0,	%f6,	%f0
	movleu	%icc,	%l5,	%g5
	edge32ln	%i2,	%i5,	%o7
	fnors	%f29,	%f4,	%f27
	fmovsneg	%xcc,	%f30,	%f31
	restore %i6, 0x1F03, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o4,	0x1AC1,	%l6
	edge16	%g4,	%l1,	%o5
	fxor	%f2,	%f24,	%f24
	fmul8sux16	%f16,	%f28,	%f18
	st	%f12,	[%l7 + 0x40]
	addc	%l0,	0x06DB,	%g7
	sra	%l2,	%i1,	%l3
	st	%f2,	[%l7 + 0x1C]
	lduh	[%l7 + 0x72],	%o3
	sll	%g3,	%g2,	%i4
	xor	%o2,	%i0,	%o1
	sll	%i3,	%l4,	%o6
	ldd	[%l7 + 0x60],	%f24
	movle	%xcc,	%g1,	%o0
	fmovsle	%icc,	%f29,	%f21
	movvs	%icc,	%g6,	%g5
	fpadd16s	%f22,	%f11,	%f10
	fnor	%f24,	%f20,	%f4
	lduh	[%l7 + 0x20],	%i2
	ldub	[%l7 + 0x4B],	%l5
	fornot1	%f20,	%f30,	%f30
	fornot2	%f14,	%f20,	%f2
	movrlez	%i5,	%i6,	%o7
	fone	%f30
	subcc	%o4,	0x0A7D,	%l6
	ldsb	[%l7 + 0x6C],	%i7
	umulcc	%l1,	%g4,	%l0
	fnot1s	%f6,	%f26
	movneg	%icc,	%o5,	%l2
	edge16ln	%g7,	%l3,	%i1
	fxor	%f10,	%f20,	%f18
	ldd	[%l7 + 0x60],	%o2
	edge16n	%g3,	%g2,	%o2
	srl	%i0,	0x04,	%i4
	sra	%o1,	0x0C,	%i3
	mulscc	%o6,	%g1,	%l4
	movrlez	%o0,	%g5,	%g6
	movne	%icc,	%l5,	%i5
	srax	%i2,	%o7,	%i6
	udivx	%l6,	0x0B2C,	%o4
	andncc	%i7,	%g4,	%l1
	fmovd	%f8,	%f12
	movvc	%xcc,	%l0,	%o5
	fpadd16s	%f25,	%f25,	%f18
	fmovrslez	%l2,	%f30,	%f3
	ldsh	[%l7 + 0x3E],	%l3
	fzeros	%f30
	udiv	%i1,	0x04D4,	%g7
	udiv	%o3,	0x18EB,	%g2
	edge32ln	%o2,	%g3,	%i0
	faligndata	%f30,	%f14,	%f4
	fmuld8ulx16	%f22,	%f1,	%f14
	for	%f12,	%f8,	%f8
	edge16	%o1,	%i4,	%i3
	movvc	%icc,	%g1,	%o6
	subcc	%o0,	0x17AF,	%l4
	smul	%g6,	0x01B0,	%g5
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%i5
	fnors	%f15,	%f29,	%f22
	srl	%i2,	%l5,	%i6
	srl	%l6,	%o7,	%o4
	movg	%icc,	%i7,	%g4
	edge16	%l1,	%l0,	%o5
	movrlez	%l2,	%i1,	%l3
	fmovdneg	%xcc,	%f2,	%f27
	subcc	%o3,	%g2,	%o2
	fnot2s	%f17,	%f27
	edge16n	%g7,	%i0,	%g3
	movrne	%o1,	%i3,	%g1
	st	%f24,	[%l7 + 0x74]
	movrlez	%o6,	%i4,	%l4
	mova	%xcc,	%g6,	%g5
	umul	%i5,	0x1309,	%i2
	xorcc	%o0,	0x1046,	%l5
	sdivx	%i6,	0x068A,	%l6
	srl	%o4,	%i7,	%o7
	smul	%g4,	0x144D,	%l1
	xor	%l0,	0x16FC,	%o5
	edge8	%i1,	%l3,	%l2
	srlx	%g2,	%o2,	%g7
	edge16l	%o3,	%g3,	%o1
	mova	%xcc,	%i0,	%i3
	fmovrdlez	%g1,	%f8,	%f2
	movle	%xcc,	%o6,	%i4
	fmul8sux16	%f22,	%f4,	%f10
	smulcc	%g6,	%l4,	%g5
	movrlez	%i2,	0x2C9,	%o0
	subc	%l5,	%i5,	%l6
	fcmple32	%f18,	%f20,	%o4
	edge16n	%i7,	%i6,	%o7
	fxor	%f28,	%f2,	%f10
	save %g4, 0x0C34, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	%o5,	%l3
	fcmpne16	%f14,	%f10,	%l2
	nop
	set	0x0D, %l1
	ldub	[%l7 + %l1],	%i1
	ld	[%l7 + 0x7C],	%f17
	fxnors	%f18,	%f3,	%f18
	subc	%o2,	%g2,	%g7
	smul	%g3,	%o1,	%i0
	addcc	%i3,	%o3,	%o6
	array16	%g1,	%i4,	%g6
	edge8	%l4,	%g5,	%i2
	movrgz	%o0,	%i5,	%l5
	fcmpgt16	%f0,	%f10,	%o4
	movgu	%xcc,	%i7,	%i6
	edge8	%l6,	%g4,	%l1
	sra	%l0,	0x1E,	%o7
	std	%f0,	[%l7 + 0x38]
	move	%icc,	%l3,	%o5
	smulcc	%i1,	%l2,	%o2
	movge	%xcc,	%g2,	%g7
	edge16	%g3,	%o1,	%i3
	lduh	[%l7 + 0x44],	%o3
	ldd	[%l7 + 0x10],	%o6
	fmovsleu	%xcc,	%f9,	%f25
	fornot2s	%f10,	%f30,	%f1
	fands	%f17,	%f9,	%f30
	ldsh	[%l7 + 0x30],	%i0
	ldsb	[%l7 + 0x4D],	%g1
	orcc	%g6,	0x1048,	%i4
	fmovrdgz	%l4,	%f20,	%f18
	mova	%icc,	%g5,	%o0
	edge32ln	%i5,	%l5,	%o4
	movge	%xcc,	%i2,	%i7
	ld	[%l7 + 0x34],	%f29
	edge32	%i6,	%g4,	%l6
	movpos	%icc,	%l0,	%l1
	udivx	%l3,	0x197C,	%o7
	edge32	%i1,	%o5,	%l2
	smulcc	%g2,	%g7,	%o2
	movge	%xcc,	%g3,	%i3
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f18
	smul	%o1,	0x19FD,	%o3
	alignaddr	%i0,	%g1,	%o6
	movgu	%icc,	%g6,	%l4
	addc	%g5,	%o0,	%i4
	sub	%i5,	0x0C85,	%o4
	fcmpne32	%f24,	%f14,	%i2
	sir	0x105C
	movle	%icc,	%l5,	%i7
	movne	%icc,	%g4,	%l6
	mova	%xcc,	%l0,	%i6
	lduw	[%l7 + 0x54],	%l3
	and	%l1,	%o7,	%i1
	popc	0x198A,	%l2
	subcc	%g2,	%o5,	%g7
	fornot2s	%f30,	%f28,	%f6
	stb	%g3,	[%l7 + 0x0E]
	stx	%o2,	[%l7 + 0x68]
	andcc	%o1,	0x16B8,	%o3
	st	%f4,	[%l7 + 0x18]
	ldsh	[%l7 + 0x08],	%i0
	movgu	%xcc,	%i3,	%g1
	add	%o6,	0x177A,	%g6
	andcc	%l4,	0x1833,	%o0
	movrgz	%i4,	0x136,	%i5
	movcs	%xcc,	%o4,	%i2
	sir	0x01FA
	fmovda	%icc,	%f27,	%f22
	andcc	%g5,	0x0195,	%i7
	udiv	%l5,	0x19B1,	%g4
	sdiv	%l6,	0x0F95,	%i6
	sdivx	%l3,	0x04DC,	%l1
	fnands	%f15,	%f28,	%f9
	movne	%xcc,	%l0,	%i1
	fmul8ulx16	%f10,	%f16,	%f16
	movcs	%xcc,	%l2,	%g2
	andncc	%o7,	%g7,	%g3
	subcc	%o2,	0x07F4,	%o5
	alignaddrl	%o1,	%i0,	%i3
	fmovrdgz	%o3,	%f2,	%f28
	add	%o6,	0x07A9,	%g6
	fcmpne32	%f24,	%f20,	%g1
	fmovs	%f7,	%f11
	stb	%o0,	[%l7 + 0x4A]
	mova	%icc,	%i4,	%l4
	smulcc	%o4,	0x17A6,	%i5
	movrlz	%g5,	0x098,	%i2
	sub	%l5,	%g4,	%i7
	fandnot1s	%f16,	%f4,	%f25
	fcmpne16	%f26,	%f8,	%l6
	fabsd	%f20,	%f0
	edge32n	%l3,	%i6,	%l0
	movn	%xcc,	%l1,	%l2
	movge	%xcc,	%g2,	%o7
	sra	%g7,	%g3,	%o2
	save %i1, 0x1CC9, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o1,	%i3
	fandnot2s	%f21,	%f17,	%f9
	movrgez	%i0,	0x355,	%o3
	ldsb	[%l7 + 0x30],	%g6
	fxnor	%f14,	%f14,	%f6
	movgu	%xcc,	%o6,	%g1
	edge32l	%o0,	%l4,	%i4
	sdivcc	%i5,	0x1CAC,	%g5
	movrne	%o4,	0x38B,	%i2
	edge32n	%g4,	%i7,	%l5
	movg	%xcc,	%l6,	%l3
	movrgez	%i6,	%l0,	%l1
	movl	%icc,	%g2,	%o7
	movcs	%icc,	%g7,	%l2
	std	%f28,	[%l7 + 0x30]
	movne	%xcc,	%o2,	%i1
	edge32l	%o5,	%o1,	%g3
	udivx	%i0,	0x19C3,	%i3
	addc	%g6,	%o3,	%o6
	and	%g1,	0x110A,	%l4
	popc	%i4,	%o0
	umulcc	%i5,	%o4,	%i2
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	edge8l	%l5,	%l3,	%l6
	fmovrslez	%l0,	%f8,	%f31
	fabss	%f4,	%f29
	udiv	%i6,	0x1230,	%l1
	edge16l	%g2,	%g7,	%l2
	fzero	%f16
	fabss	%f14,	%f25
	sdiv	%o7,	0x05FB,	%i1
	edge32n	%o2,	%o5,	%g3
	smul	%o1,	%i3,	%i0
	udiv	%g6,	0x15D6,	%o6
	subc	%g1,	%l4,	%o3
	restore %i4, 0x1729, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o4,	0x09BE,	%i5
	orncc	%g5,	%i7,	%i2
	or	%l5,	0x0D24,	%l3
	udivx	%l6,	0x03DB,	%l0
	fmovdleu	%icc,	%f0,	%f0
	movrgz	%g4,	0x2C2,	%l1
	movrne	%i6,	%g2,	%l2
	andcc	%o7,	%i1,	%o2
	movrlz	%g7,	%g3,	%o5
	fpackfix	%f10,	%f21
	add	%i3,	0x1B83,	%i0
	udivcc	%g6,	0x07C4,	%o6
	lduw	[%l7 + 0x74],	%o1
	stx	%g1,	[%l7 + 0x20]
	fornot1	%f24,	%f22,	%f16
	sdiv	%o3,	0x0D20,	%l4
	save %o0, 0x0647, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f18,	%f2,	%i4
	fmovscs	%icc,	%f20,	%f15
	mulx	%i5,	0x1D78,	%g5
	fmovrdlez	%i2,	%f20,	%f12
	andncc	%i7,	%l5,	%l3
	fcmple16	%f0,	%f6,	%l6
	stw	%g4,	[%l7 + 0x1C]
	fmul8x16al	%f2,	%f3,	%f8
	st	%f2,	[%l7 + 0x24]
	fcmpeq32	%f26,	%f4,	%l0
	save %l1, 0x02CB, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x30],	%f1
	ld	[%l7 + 0x24],	%f2
	or	%l2,	%o7,	%i1
	movrlez	%o2,	%g7,	%g3
	ldsb	[%l7 + 0x7A],	%o5
	edge8ln	%g2,	%i0,	%i3
	movrgz	%g6,	0x31F,	%o6
	orn	%o1,	%o3,	%l4
	lduh	[%l7 + 0x62],	%g1
	srlx	%o0,	0x0B,	%o4
	movrgez	%i4,	%g5,	%i2
	udivx	%i5,	0x0107,	%l5
	udiv	%i7,	0x1551,	%l3
	fexpand	%f25,	%f6
	movvc	%xcc,	%g4,	%l0
	movvc	%icc,	%l6,	%l1
	addccc	%l2,	%o7,	%i6
	lduh	[%l7 + 0x32],	%i1
	fxnor	%f10,	%f28,	%f18
	smul	%o2,	0x0B68,	%g3
	fmovsgu	%xcc,	%f30,	%f25
	orncc	%g7,	0x14DE,	%g2
	edge16	%o5,	%i0,	%g6
	sra	%i3,	0x0D,	%o1
	alignaddrl	%o3,	%l4,	%o6
	ldd	[%l7 + 0x78],	%f14
	edge16n	%g1,	%o4,	%i4
	fcmpeq32	%f30,	%f12,	%o0
	srax	%g5,	0x10,	%i5
	sub	%l5,	%i2,	%i7
	fmovspos	%xcc,	%f7,	%f16
	alignaddrl	%l3,	%l0,	%g4
	andcc	%l6,	0x09C7,	%l2
	orcc	%o7,	0x1BFB,	%l1
	sra	%i6,	0x02,	%o2
	fnot2s	%f9,	%f23
	fmovsneg	%xcc,	%f8,	%f13
	movvs	%icc,	%g3,	%g7
	lduw	[%l7 + 0x40],	%g2
	movrlez	%o5,	%i0,	%i1
	andcc	%g6,	%o1,	%o3
	fmovsne	%icc,	%f31,	%f18
	ld	[%l7 + 0x78],	%f31
	fcmpne16	%f16,	%f22,	%l4
	edge16l	%i3,	%o6,	%g1
	orcc	%o4,	%o0,	%g5
	movrgez	%i5,	0x3BD,	%i4
	alignaddr	%l5,	%i7,	%i2
	edge16	%l3,	%g4,	%l0
	popc	0x15C6,	%l6
	popc	0x0E0A,	%l2
	ldsw	[%l7 + 0x70],	%o7
	edge8	%l1,	%i6,	%g3
	addc	%o2,	0x1220,	%g7
	movrlez	%g2,	%i0,	%i1
	ldd	[%l7 + 0x38],	%g6
	edge8n	%o5,	%o3,	%l4
	fxnor	%f26,	%f6,	%f26
	fcmpd	%fcc0,	%f28,	%f26
	movrne	%o1,	0x109,	%i3
	move	%xcc,	%o6,	%g1
	movrlz	%o0,	%g5,	%o4
	ldsh	[%l7 + 0x6A],	%i5
	movcs	%xcc,	%l5,	%i7
	ldx	[%l7 + 0x10],	%i2
	movvs	%xcc,	%l3,	%i4
	fmovsvs	%xcc,	%f15,	%f17
	for	%f22,	%f8,	%f16
	save %g4, %l0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o7,	%l2,	%i6
	umul	%g3,	0x1395,	%l1
	fexpand	%f4,	%f16
	lduw	[%l7 + 0x64],	%g7
	movpos	%xcc,	%g2,	%o2
	stw	%i1,	[%l7 + 0x6C]
	ld	[%l7 + 0x3C],	%f18
	edge32	%g6,	%i0,	%o3
	orn	%o5,	0x1A37,	%o1
	fmuld8ulx16	%f4,	%f26,	%f16
	movg	%icc,	%i3,	%l4
	lduh	[%l7 + 0x2E],	%g1
	fmovsneg	%xcc,	%f28,	%f6
	add	%o0,	%o6,	%g5
	movleu	%icc,	%o4,	%l5
	fmovse	%xcc,	%f10,	%f14
	sll	%i5,	%i7,	%l3
	movl	%xcc,	%i4,	%g4
	ldx	[%l7 + 0x18],	%l0
	or	%i2,	%o7,	%l2
	ldx	[%l7 + 0x48],	%l6
	fcmpeq32	%f12,	%f16,	%i6
	save %g3, 0x0E54, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g2,	%l1,	%i1
	save %o2, 0x023C, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o3,	%o5
	mova	%xcc,	%g6,	%i3
	ld	[%l7 + 0x58],	%f16
	stw	%l4,	[%l7 + 0x24]
	movleu	%icc,	%g1,	%o0
	and	%o1,	%g5,	%o6
	fpack32	%f30,	%f24,	%f18
	movleu	%icc,	%l5,	%o4
	fnot2s	%f18,	%f2
	movge	%xcc,	%i5,	%l3
	smulcc	%i4,	%g4,	%l0
	edge16n	%i7,	%o7,	%l2
	srlx	%l6,	0x1D,	%i6
	andncc	%g3,	%g7,	%i2
	orncc	%g2,	0x11DE,	%i1
	fpadd16s	%f30,	%f4,	%f29
	andcc	%l1,	%o2,	%i0
	mulscc	%o5,	0x1FCC,	%o3
	stx	%g6,	[%l7 + 0x78]
	array8	%i3,	%g1,	%l4
	fmovdcc	%xcc,	%f10,	%f19
	edge8ln	%o0,	%o1,	%o6
	movrgez	%l5,	0x39B,	%o4
	edge8	%i5,	%g5,	%i4
	array8	%l3,	%l0,	%i7
	alignaddr	%o7,	%l2,	%l6
	fpadd16s	%f20,	%f27,	%f2
	ldx	[%l7 + 0x70],	%i6
	movrlez	%g4,	0x2AF,	%g3
	edge32ln	%g7,	%g2,	%i1
	sdivx	%i2,	0x0531,	%o2
	movgu	%icc,	%l1,	%o5
	sllx	%o3,	0x10,	%i0
	srax	%g6,	%g1,	%i3
	smulcc	%o0,	0x0A48,	%l4
	fmovdg	%icc,	%f20,	%f4
	movleu	%icc,	%o1,	%l5
	stw	%o6,	[%l7 + 0x34]
	srax	%i5,	%g5,	%o4
	st	%f3,	[%l7 + 0x28]
	movl	%icc,	%i4,	%l0
	movrgez	%i7,	%l3,	%o7
	movvc	%xcc,	%l2,	%i6
	andcc	%g4,	0x1CEE,	%g3
	movl	%xcc,	%g7,	%l6
	addc	%i1,	%g2,	%i2
	orn	%o2,	%l1,	%o5
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	fornot1	%f30,	%f4,	%f12
	fmovsg	%icc,	%f15,	%f30
	movrne	%i3,	%g1,	%l4
	nop
	set	0x58, %i6
	lduh	[%l7 + %i6],	%o1
	fnot2s	%f15,	%f8
	restore %o0, 0x13F3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i5,	%g5,	%o6
	sir	0x12B3
	save %o4, %l0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l3,	[%l7 + 0x11]
	std	%f8,	[%l7 + 0x18]
	fand	%f8,	%f22,	%f2
	movneg	%xcc,	%i7,	%l2
	stb	%i6,	[%l7 + 0x0D]
	umulcc	%g4,	0x0FA8,	%g3
	fmovse	%icc,	%f2,	%f12
	fmovrdgez	%g7,	%f4,	%f2
	smul	%o7,	0x1FC5,	%i1
	sll	%g2,	0x0E,	%i2
	fmul8x16al	%f8,	%f23,	%f18
	sir	0x179F
	edge16l	%l6,	%o2,	%o5
	edge8ln	%l1,	%g6,	%i0
	mulscc	%o3,	0x1C17,	%g1
	lduh	[%l7 + 0x58],	%l4
	fmovdcs	%icc,	%f8,	%f20
	sir	0x1FF2
	andncc	%i3,	%o0,	%o1
	xnorcc	%i5,	0x0D40,	%l5
	popc	%g5,	%o6
	add	%l0,	0x1A80,	%o4
	edge16l	%l3,	%i7,	%i4
	mulx	%l2,	%i6,	%g4
	xor	%g3,	0x15E7,	%g7
	subccc	%o7,	%g2,	%i2
	addcc	%l6,	0x1C55,	%i1
	edge32ln	%o2,	%l1,	%g6
	xnorcc	%o5,	0x1479,	%i0
	ldub	[%l7 + 0x41],	%g1
	for	%f10,	%f12,	%f10
	fands	%f9,	%f28,	%f9
	edge16l	%o3,	%i3,	%l4
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%o0
	faligndata	%f0,	%f8,	%f16
	movvs	%icc,	%i5,	%o1
	smulcc	%l5,	%o6,	%l0
	umul	%o4,	0x1EFC,	%l3
	edge32ln	%g5,	%i4,	%l2
	movg	%xcc,	%i7,	%i6
	fmovdneg	%xcc,	%f27,	%f7
	add	%g4,	%g3,	%g7
	edge32n	%g2,	%o7,	%l6
	fmovdpos	%icc,	%f18,	%f19
	fmovde	%xcc,	%f27,	%f23
	edge16n	%i1,	%i2,	%o2
	ldsb	[%l7 + 0x6C],	%l1
	ldsb	[%l7 + 0x79],	%o5
	movrlez	%i0,	0x0C1,	%g6
	fmovdg	%icc,	%f13,	%f8
	siam	0x1
	mulscc	%o3,	%g1,	%l4
	ldsh	[%l7 + 0x6C],	%o0
	fmul8sux16	%f14,	%f18,	%f0
	edge8	%i5,	%o1,	%l5
	fmovrsgz	%o6,	%f25,	%f10
	stx	%l0,	[%l7 + 0x40]
	add	%i3,	%o4,	%g5
	fmovrdgez	%l3,	%f2,	%f8
	andncc	%l2,	%i4,	%i7
	fors	%f22,	%f20,	%f15
	fsrc1	%f26,	%f2
	movrgez	%i6,	0x30A,	%g4
	fpadd32	%f14,	%f4,	%f16
	movcs	%icc,	%g7,	%g3
	edge8l	%g2,	%l6,	%o7
	mova	%xcc,	%i2,	%o2
	ldx	[%l7 + 0x50],	%l1
	sir	0x0F7C
	addc	%o5,	0x1AD8,	%i1
	array16	%i0,	%g6,	%g1
	alignaddr	%l4,	%o0,	%i5
	movrlez	%o3,	%o1,	%o6
	movle	%xcc,	%l0,	%i3
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	andn	%l3,	%l5,	%i4
	sdiv	%l2,	0x0037,	%i7
	sdivcc	%i6,	0x0CC2,	%g7
	fmovdgu	%xcc,	%f5,	%f4
	std	%f22,	[%l7 + 0x60]
	fmovsgu	%xcc,	%f15,	%f3
	movrne	%g3,	0x1CE,	%g4
	lduh	[%l7 + 0x1C],	%g2
	umulcc	%o7,	0x0DE9,	%l6
	movcs	%icc,	%o2,	%i2
	fpackfix	%f24,	%f3
	fnot2	%f24,	%f2
	orcc	%o5,	%l1,	%i0
	save %g6, %i1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g1,	%o0
	ldub	[%l7 + 0x36],	%i5
	edge16ln	%o1,	%o6,	%o3
	sir	0x12E0
	addcc	%l0,	0x043C,	%i3
	sdiv	%g5,	0x0862,	%l3
	lduh	[%l7 + 0x28],	%l5
	fcmpne16	%f16,	%f14,	%o4
	sra	%i4,	%i7,	%l2
	st	%f7,	[%l7 + 0x28]
	fmovsleu	%xcc,	%f19,	%f15
	movleu	%xcc,	%g7,	%i6
	movre	%g3,	0x22A,	%g2
	alignaddrl	%g4,	%o7,	%l6
	array16	%i2,	%o5,	%o2
	xor	%l1,	%g6,	%i1
	fzero	%f8
	sll	%i0,	%l4,	%o0
	alignaddrl	%i5,	%o1,	%o6
	movre	%g1,	%l0,	%i3
	ldd	[%l7 + 0x50],	%f2
	add	%g5,	0x0438,	%o3
	fmovsvs	%icc,	%f18,	%f10
	movl	%xcc,	%l5,	%l3
	stx	%o4,	[%l7 + 0x78]
	edge32ln	%i4,	%l2,	%i7
	movpos	%icc,	%i6,	%g3
	sra	%g7,	%g2,	%g4
	sllx	%l6,	%o7,	%i2
	movcs	%icc,	%o2,	%l1
	edge8l	%g6,	%i1,	%i0
	movvc	%xcc,	%l4,	%o0
	fmovse	%xcc,	%f4,	%f5
	movle	%icc,	%i5,	%o1
	movvs	%xcc,	%o6,	%g1
	movne	%icc,	%o5,	%i3
	mova	%xcc,	%g5,	%l0
	edge32ln	%l5,	%l3,	%o3
	fmovsne	%icc,	%f8,	%f19
	fcmpgt16	%f2,	%f26,	%o4
	fmovrse	%i4,	%f30,	%f19
	fmovsle	%xcc,	%f18,	%f9
	fmovsl	%xcc,	%f6,	%f31
	subcc	%i7,	0x0FDC,	%i6
	movre	%g3,	%g7,	%g2
	edge8n	%l2,	%g4,	%l6
	sll	%o7,	%i2,	%o2
	fcmps	%fcc1,	%f2,	%f4
	movrne	%g6,	0x2E0,	%l1
	ldd	[%l7 + 0x40],	%f6
	edge16	%i0,	%i1,	%l4
	fmovs	%f22,	%f4
	or	%o0,	0x1737,	%o1
	movrgz	%i5,	%o6,	%o5
	sub	%i3,	0x1BE2,	%g5
	alignaddrl	%g1,	%l5,	%l3
	lduw	[%l7 + 0x54],	%l0
	movle	%icc,	%o3,	%i4
	udiv	%i7,	0x1C13,	%o4
	edge8	%i6,	%g7,	%g2
	srl	%g3,	0x0B,	%g4
	stb	%l6,	[%l7 + 0x15]
	fpsub16	%f20,	%f4,	%f0
	fnand	%f30,	%f8,	%f22
	udiv	%o7,	0x07ED,	%l2
	alignaddr	%i2,	%o2,	%l1
	sub	%i0,	0x0DBE,	%i1
	movne	%xcc,	%g6,	%o0
	edge8ln	%l4,	%i5,	%o1
	edge32ln	%o6,	%i3,	%o5
	alignaddr	%g1,	%l5,	%g5
	udiv	%l3,	0x1E2D,	%l0
	edge32l	%i4,	%o3,	%o4
	alignaddr	%i7,	%i6,	%g2
	sdivcc	%g7,	0x1F64,	%g4
	fxnor	%f20,	%f8,	%f26
	ldx	[%l7 + 0x68],	%l6
	fcmpgt16	%f26,	%f16,	%g3
	andcc	%o7,	%l2,	%i2
	st	%f20,	[%l7 + 0x10]
	sra	%l1,	%o2,	%i1
	subc	%i0,	0x088B,	%o0
	edge16l	%g6,	%i5,	%o1
	movrlz	%l4,	%i3,	%o6
	subc	%g1,	0x10E9,	%o5
	edge16n	%g5,	%l5,	%l3
	xnor	%l0,	%o3,	%o4
	sllx	%i7,	0x04,	%i6
	orcc	%i4,	%g7,	%g2
	ldd	[%l7 + 0x18],	%g4
	ld	[%l7 + 0x10],	%f6
	fpsub16	%f20,	%f0,	%f22
	nop
	set	0x1E, %o6
	stb	%l6,	[%l7 + %o6]
	fpackfix	%f16,	%f24
	fandnot2	%f0,	%f8,	%f8
	fands	%f8,	%f18,	%f22
	udiv	%o7,	0x01BB,	%l2
	srax	%g3,	%l1,	%o2
	edge32	%i1,	%i2,	%o0
	movvs	%xcc,	%g6,	%i5
	fmul8x16au	%f15,	%f0,	%f24
	popc	0x19AE,	%o1
	movre	%l4,	%i3,	%i0
	stx	%g1,	[%l7 + 0x18]
	fors	%f15,	%f0,	%f17
	fpackfix	%f2,	%f23
	srlx	%o5,	0x13,	%o6
	movl	%icc,	%l5,	%l3
	mova	%xcc,	%g5,	%l0
	movrne	%o4,	0x14E,	%o3
	sllx	%i6,	%i7,	%g7
	movneg	%xcc,	%i4,	%g4
	fpadd16	%f16,	%f6,	%f6
	fmovrdne	%g2,	%f8,	%f0
	movvs	%xcc,	%l6,	%o7
	edge8l	%g3,	%l1,	%o2
	array8	%l2,	%i1,	%o0
	subc	%i2,	0x07DC,	%i5
	fcmpgt32	%f6,	%f28,	%g6
	srax	%o1,	%l4,	%i0
	addc	%i3,	%o5,	%o6
	movrgz	%l5,	%g1,	%g5
	srl	%l0,	%l3,	%o3
	edge32	%i6,	%o4,	%g7
	udivcc	%i7,	0x1E5C,	%i4
	fmovdvs	%icc,	%f11,	%f18
	srlx	%g2,	0x03,	%l6
	edge8n	%o7,	%g3,	%l1
	stw	%o2,	[%l7 + 0x2C]
	movgu	%xcc,	%g4,	%i1
	lduh	[%l7 + 0x2A],	%o0
	std	%f30,	[%l7 + 0x48]
	fmovsneg	%xcc,	%f1,	%f25
	movne	%xcc,	%i2,	%l2
	fnot1	%f4,	%f22
	sethi	0x1E66,	%g6
	fmovrdne	%i5,	%f6,	%f2
	movg	%icc,	%l4,	%o1
	fmovrdgz	%i3,	%f24,	%f0
	movn	%icc,	%i0,	%o6
	movneg	%xcc,	%o5,	%l5
	fcmpeq32	%f6,	%f24,	%g1
	edge16n	%l0,	%g5,	%l3
	fmovs	%f26,	%f26
	fexpand	%f10,	%f16
	movrlz	%o3,	%i6,	%g7
	srl	%i7,	%i4,	%o4
	mulscc	%l6,	0x1BBB,	%o7
	movn	%xcc,	%g2,	%l1
	smulcc	%o2,	%g3,	%g4
	lduw	[%l7 + 0x0C],	%i1
	movle	%xcc,	%o0,	%i2
	sir	0x0BFE
	movrgz	%g6,	%l2,	%l4
	andcc	%o1,	0x1185,	%i3
	movl	%icc,	%i0,	%i5
	movleu	%xcc,	%o6,	%l5
	subccc	%o5,	0x0622,	%l0
	addccc	%g5,	0x081D,	%l3
	sra	%o3,	0x04,	%g1
	movge	%icc,	%g7,	%i7
	ldsw	[%l7 + 0x70],	%i4
	movcc	%icc,	%o4,	%l6
	st	%f22,	[%l7 + 0x18]
	or	%o7,	0x0C09,	%i6
	sub	%l1,	0x038C,	%g2
	movleu	%xcc,	%g3,	%o2
	mulx	%i1,	0x0BC8,	%g4
	ldsw	[%l7 + 0x2C],	%o0
	fpadd16	%f12,	%f10,	%f4
	orcc	%i2,	%l2,	%g6
	mulx	%l4,	%i3,	%o1
	edge16ln	%i0,	%o6,	%i5
	ldsb	[%l7 + 0x4A],	%l5
	st	%f25,	[%l7 + 0x38]
	move	%xcc,	%o5,	%l0
	sethi	0x1546,	%g5
	for	%f14,	%f24,	%f16
	ldx	[%l7 + 0x40],	%o3
	movne	%xcc,	%g1,	%g7
	edge32l	%i7,	%i4,	%l3
	sethi	0x128F,	%l6
	udiv	%o7,	0x06BF,	%i6
	ldsw	[%l7 + 0x20],	%o4
	fmovrslez	%l1,	%f8,	%f5
	sllx	%g3,	0x0A,	%g2
	fmuld8sux16	%f20,	%f21,	%f18
	fpsub16	%f10,	%f24,	%f16
	mulx	%i1,	%g4,	%o0
	array32	%o2,	%l2,	%g6
	fcmpne32	%f18,	%f28,	%i2
	srlx	%i3,	%l4,	%o1
	movn	%icc,	%i0,	%o6
	umul	%l5,	%o5,	%l0
	movrgez	%g5,	0x17F,	%i5
	movn	%xcc,	%o3,	%g1
	movgu	%icc,	%i7,	%g7
	edge8	%i4,	%l3,	%o7
	movrlz	%i6,	0x398,	%o4
	subccc	%l1,	%l6,	%g2
	edge8n	%i1,	%g3,	%g4
	ldd	[%l7 + 0x18],	%o2
	movpos	%icc,	%l2,	%g6
	and	%o0,	0x0146,	%i2
	fxnor	%f22,	%f16,	%f28
	fnegs	%f14,	%f11
	fcmpgt32	%f16,	%f26,	%l4
	fmovsgu	%icc,	%f30,	%f21
	fmovdcs	%icc,	%f8,	%f25
	subc	%i3,	%o1,	%o6
	fpsub32s	%f0,	%f7,	%f22
	edge32n	%i0,	%l5,	%l0
	fpack16	%f6,	%f24
	std	%f20,	[%l7 + 0x58]
	fmovsg	%xcc,	%f21,	%f6
	edge16l	%o5,	%i5,	%g5
	srl	%o3,	0x0A,	%g1
	movvc	%icc,	%i7,	%i4
	andncc	%g7,	%o7,	%l3
	mulscc	%i6,	0x04A3,	%o4
	lduh	[%l7 + 0x64],	%l6
	fzeros	%f20
	lduh	[%l7 + 0x34],	%l1
	move	%xcc,	%i1,	%g3
	udiv	%g4,	0x1553,	%g2
	for	%f8,	%f8,	%f8
	andn	%l2,	0x07C7,	%g6
	andncc	%o2,	%o0,	%l4
	st	%f30,	[%l7 + 0x10]
	smul	%i2,	0x0E73,	%o1
	fandnot2	%f18,	%f28,	%f0
	edge8l	%i3,	%i0,	%o6
	mulscc	%l0,	0x17EF,	%o5
	sethi	0x1427,	%l5
	smulcc	%i5,	%o3,	%g5
	edge16	%g1,	%i4,	%i7
	movne	%icc,	%g7,	%l3
	addcc	%i6,	0x0648,	%o7
	xnorcc	%o4,	0x0C0A,	%l1
	fandnot2	%f10,	%f4,	%f8
	add	%i1,	0x1327,	%l6
	fmul8x16al	%f11,	%f12,	%f0
	movrlz	%g3,	0x0B1,	%g4
	popc	0x1FFE,	%g2
	srl	%g6,	%o2,	%o0
	udiv	%l2,	0x048B,	%l4
	umul	%i2,	0x13F4,	%o1
	fmovsle	%icc,	%f26,	%f30
	ld	[%l7 + 0x74],	%f3
	edge32l	%i3,	%o6,	%l0
	movrgez	%i0,	0x0B6,	%o5
	ldub	[%l7 + 0x36],	%i5
	nop
	set	0x68, %i1
	stx	%l5,	[%l7 + %i1]
	sra	%g5,	%o3,	%i4
	fmovsne	%icc,	%f8,	%f16
	alignaddr	%g1,	%g7,	%i7
	edge32	%l3,	%o7,	%i6
	fpsub32s	%f30,	%f18,	%f29
	edge32l	%l1,	%o4,	%l6
	fandnot1s	%f28,	%f9,	%f17
	movn	%xcc,	%i1,	%g3
	sir	0x07AC
	sir	0x00E5
	edge16ln	%g4,	%g6,	%g2
	array32	%o2,	%l2,	%o0
	sll	%i2,	%o1,	%l4
	st	%f17,	[%l7 + 0x08]
	array8	%i3,	%l0,	%o6
	array8	%i0,	%o5,	%i5
	bshuffle	%f16,	%f8,	%f16
	sethi	0x1AFD,	%l5
	fmovdvs	%icc,	%f8,	%f5
	edge16l	%o3,	%i4,	%g5
	edge32ln	%g1,	%g7,	%l3
	sra	%o7,	0x0E,	%i6
	movvc	%xcc,	%l1,	%o4
	stx	%l6,	[%l7 + 0x78]
	fmovsge	%icc,	%f24,	%f12
	fmovsge	%xcc,	%f23,	%f20
	fmovrslz	%i7,	%f20,	%f12
	fcmpne16	%f12,	%f30,	%i1
	sdivx	%g4,	0x0CC8,	%g3
	andcc	%g6,	%o2,	%g2
	sub	%l2,	%i2,	%o0
	edge16l	%o1,	%l4,	%l0
	fnors	%f30,	%f30,	%f2
	stb	%o6,	[%l7 + 0x7A]
	movl	%icc,	%i3,	%o5
	ldsw	[%l7 + 0x54],	%i0
	sir	0x1BB4
	srax	%i5,	0x1D,	%o3
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%i4
	mulx	%l5,	%g5,	%g7
	fcmpne16	%f4,	%f4,	%l3
	fmovd	%f30,	%f24
	movge	%xcc,	%g1,	%i6
	sra	%o7,	0x15,	%o4
	movleu	%xcc,	%l1,	%i7
	addc	%l6,	%i1,	%g3
	xnor	%g4,	%g6,	%g2
	xorcc	%o2,	0x0055,	%l2
	fnands	%f24,	%f19,	%f1
	restore %i2, 0x05E8, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o0,	0x0485,	%l4
	fnand	%f16,	%f26,	%f30
	edge8n	%o6,	%i3,	%l0
	addcc	%i0,	%i5,	%o3
	srlx	%i4,	0x1F,	%l5
	srlx	%o5,	%g7,	%l3
	ldd	[%l7 + 0x18],	%g4
	fxor	%f22,	%f12,	%f26
	andn	%g1,	%o7,	%o4
	move	%icc,	%l1,	%i7
	fmovscs	%icc,	%f19,	%f14
	movpos	%icc,	%i6,	%i1
	fmovda	%xcc,	%f22,	%f31
	movleu	%icc,	%l6,	%g4
	fornot1s	%f21,	%f5,	%f2
	subcc	%g3,	0x1210,	%g6
	fpsub16s	%f24,	%f24,	%f16
	fmovdvs	%xcc,	%f26,	%f25
	edge16	%o2,	%g2,	%i2
	mulx	%l2,	0x1745,	%o1
	edge16ln	%o0,	%l4,	%o6
	fnegd	%f18,	%f18
	fmovsl	%icc,	%f29,	%f30
	srl	%l0,	%i3,	%i0
	addc	%i5,	0x1176,	%i4
	fmovdcc	%xcc,	%f19,	%f26
	ldd	[%l7 + 0x58],	%f18
	movrne	%l5,	0x14D,	%o3
	fornot2s	%f31,	%f19,	%f4
	fmovdl	%xcc,	%f13,	%f23
	fmovdcs	%icc,	%f12,	%f16
	array8	%o5,	%l3,	%g5
	udiv	%g1,	0x1992,	%g7
	fmul8x16	%f24,	%f14,	%f2
	alignaddrl	%o4,	%l1,	%o7
	orcc	%i6,	0x10EB,	%i7
	sll	%i1,	%g4,	%l6
	movpos	%icc,	%g3,	%g6
	andcc	%o2,	%g2,	%i2
	srax	%o1,	0x16,	%o0
	edge8ln	%l4,	%l2,	%l0
	fabsd	%f8,	%f10
	mova	%icc,	%i3,	%o6
	fpsub32	%f16,	%f6,	%f26
	movn	%xcc,	%i0,	%i5
	orcc	%l5,	0x07BA,	%i4
	fmovsge	%xcc,	%f16,	%f1
	udivx	%o5,	0x1ABF,	%l3
	movrlez	%o3,	%g1,	%g7
	smulcc	%g5,	0x18C9,	%o4
	edge8l	%l1,	%o7,	%i6
	edge16l	%i7,	%i1,	%l6
	smulcc	%g3,	0x069D,	%g4
	std	%f2,	[%l7 + 0x78]
	array16	%o2,	%g2,	%g6
	array16	%o1,	%o0,	%i2
	movrlz	%l2,	%l0,	%i3
	lduh	[%l7 + 0x7A],	%l4
	mova	%xcc,	%i0,	%o6
	movvc	%icc,	%l5,	%i4
	subcc	%i5,	%o5,	%o3
	sdivx	%g1,	0x1D16,	%g7
	mulscc	%g5,	0x0C85,	%o4
	movrlz	%l1,	%l3,	%o7
	sdivcc	%i7,	0x04DD,	%i1
	movleu	%icc,	%i6,	%g3
	fones	%f27
	movvc	%icc,	%g4,	%o2
	nop
	set	0x48, %l2
	std	%f16,	[%l7 + %l2]
	fpadd32	%f30,	%f8,	%f8
	movle	%icc,	%g2,	%l6
	subc	%g6,	0x01F9,	%o0
	ldd	[%l7 + 0x20],	%f2
	fmovrdlz	%o1,	%f22,	%f30
	andncc	%i2,	%l2,	%l0
	stb	%l4,	[%l7 + 0x30]
	save %i0, 0x1940, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f7,	[%l7 + 0x20]
	lduw	[%l7 + 0x14],	%l5
	sllx	%i4,	%o6,	%o5
	fnot2	%f12,	%f14
	orcc	%o3,	%g1,	%g7
	sll	%i5,	0x0F,	%o4
	alignaddrl	%l1,	%l3,	%g5
	sdivx	%o7,	0x1384,	%i7
	orcc	%i1,	%g3,	%i6
	orcc	%g4,	0x0776,	%o2
	movgu	%icc,	%l6,	%g2
	stx	%o0,	[%l7 + 0x60]
	movvc	%xcc,	%g6,	%o1
	movcs	%xcc,	%i2,	%l0
	lduw	[%l7 + 0x30],	%l2
	edge32l	%i0,	%i3,	%l4
	movcs	%xcc,	%l5,	%i4
	movne	%icc,	%o6,	%o5
	movpos	%icc,	%g1,	%g7
	edge8	%o3,	%o4,	%i5
	sth	%l3,	[%l7 + 0x76]
	movcs	%xcc,	%g5,	%o7
	andn	%i7,	0x0973,	%i1
	xnor	%l1,	0x0AE3,	%g3
	movgu	%icc,	%i6,	%o2
	fmovrdlz	%g4,	%f6,	%f2
	edge16l	%l6,	%o0,	%g2
	srlx	%g6,	%o1,	%l0
	movg	%xcc,	%l2,	%i2
	fmovrsne	%i3,	%f19,	%f19
	udivx	%i0,	0x1C7B,	%l5
	fmovdle	%xcc,	%f9,	%f6
	movneg	%icc,	%l4,	%i4
	edge32n	%o5,	%g1,	%o6
	std	%f24,	[%l7 + 0x68]
	umul	%g7,	0x10C9,	%o3
	fmovrslez	%i5,	%f9,	%f11
	stx	%o4,	[%l7 + 0x68]
	ldx	[%l7 + 0x40],	%g5
	edge8	%o7,	%l3,	%i1
	fcmpeq16	%f12,	%f6,	%i7
	movvs	%xcc,	%l1,	%g3
	srlx	%i6,	%g4,	%o2
	stb	%o0,	[%l7 + 0x7F]
	ldsh	[%l7 + 0x12],	%g2
	sth	%g6,	[%l7 + 0x46]
	ldx	[%l7 + 0x40],	%l6
	andn	%o1,	0x08E7,	%l0
	movrlez	%l2,	0x22D,	%i3
	movge	%icc,	%i2,	%i0
	umul	%l5,	%l4,	%o5
	movg	%icc,	%g1,	%i4
	xor	%o6,	0x0F0C,	%g7
	movcc	%icc,	%i5,	%o3
	xor	%g5,	%o7,	%o4
	move	%icc,	%i1,	%l3
	mulscc	%l1,	%i7,	%i6
	andcc	%g3,	0x038D,	%o2
	movcc	%xcc,	%g4,	%g2
	mulx	%g6,	0x0E91,	%o0
	nop
	set	0x48, %o7
	stx	%l6,	[%l7 + %o7]
	fmovdcs	%xcc,	%f27,	%f23
	edge32n	%o1,	%l0,	%i3
	srlx	%l2,	0x1A,	%i2
	ldx	[%l7 + 0x48],	%l5
	sethi	0x1AC6,	%i0
	andn	%l4,	0x0F31,	%o5
	ldsw	[%l7 + 0x7C],	%i4
	fpack32	%f6,	%f18,	%f28
	fpsub16	%f2,	%f26,	%f6
	movle	%icc,	%o6,	%g7
	smulcc	%g1,	%o3,	%i5
	fmovrdlz	%o7,	%f24,	%f0
	stx	%o4,	[%l7 + 0x60]
	or	%i1,	0x1888,	%l3
	edge8n	%l1,	%g5,	%i6
	srl	%g3,	0x10,	%i7
	edge8l	%g4,	%o2,	%g6
	sra	%g2,	%l6,	%o0
	ldx	[%l7 + 0x68],	%o1
	edge8l	%l0,	%i3,	%l2
	movrne	%i2,	%i0,	%l4
	fmovscc	%xcc,	%f14,	%f10
	fmovdleu	%icc,	%f5,	%f21
	fpsub16s	%f4,	%f19,	%f29
	array32	%l5,	%i4,	%o5
	sth	%g7,	[%l7 + 0x3C]
	sethi	0x1955,	%g1
	add	%o3,	%i5,	%o6
	fxors	%f18,	%f7,	%f26
	srax	%o4,	0x03,	%i1
	orcc	%l3,	0x12EC,	%o7
	fmovdl	%icc,	%f29,	%f21
	sub	%l1,	%i6,	%g5
	orn	%g3,	0x0BAE,	%i7
	fmovdle	%icc,	%f22,	%f18
	mulscc	%g4,	%g6,	%o2
	fone	%f10
	sth	%g2,	[%l7 + 0x52]
	umulcc	%l6,	%o1,	%l0
	array16	%i3,	%l2,	%o0
	xorcc	%i0,	%i2,	%l5
	array16	%i4,	%l4,	%o5
	udiv	%g7,	0x1140,	%g1
	orn	%o3,	%i5,	%o6
	udiv	%i1,	0x0DDD,	%o4
	movge	%icc,	%l3,	%l1
	fmovdcc	%icc,	%f22,	%f29
	fmovrsne	%i6,	%f26,	%f9
	fnegs	%f29,	%f17
	sdiv	%g5,	0x175D,	%g3
	movl	%icc,	%o7,	%g4
	sra	%i7,	0x02,	%o2
	lduh	[%l7 + 0x4A],	%g6
	lduh	[%l7 + 0x50],	%g2
	lduh	[%l7 + 0x12],	%o1
	alignaddrl	%l0,	%l6,	%l2
	ldd	[%l7 + 0x30],	%f8
	edge32l	%i3,	%i0,	%o0
	edge16l	%l5,	%i2,	%l4
	fcmpeq16	%f24,	%f8,	%o5
	sdiv	%i4,	0x155B,	%g1
	movg	%icc,	%o3,	%i5
	movg	%icc,	%g7,	%o6
	save %o4, 0x1D2A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l1,	0x158,	%l3
	mova	%xcc,	%i6,	%g3
	orn	%g5,	%o7,	%g4
	fones	%f20
	alignaddrl	%o2,	%i7,	%g2
	fpsub16	%f28,	%f16,	%f14
	edge32n	%g6,	%l0,	%o1
	edge32ln	%l2,	%l6,	%i0
	sra	%o0,	%i3,	%i2
	fmul8x16	%f4,	%f28,	%f0
	fxors	%f15,	%f5,	%f14
	andn	%l4,	0x0EDB,	%l5
	ldub	[%l7 + 0x5B],	%o5
	movre	%i4,	%o3,	%i5
	stx	%g7,	[%l7 + 0x20]
	mulscc	%g1,	%o6,	%o4
	movpos	%xcc,	%i1,	%l3
	edge8ln	%i6,	%g3,	%g5
	fmovrdgez	%o7,	%f26,	%f22
	umulcc	%g4,	0x05AA,	%l1
	movrgez	%o2,	0x3B0,	%i7
	edge32l	%g6,	%g2,	%o1
	umul	%l2,	%l0,	%l6
	movpos	%icc,	%i0,	%o0
	edge32l	%i3,	%i2,	%l4
	movg	%xcc,	%o5,	%i4
	mulscc	%o3,	0x00CC,	%l5
	addcc	%i5,	%g7,	%g1
	array32	%o6,	%i1,	%l3
	array32	%o4,	%i6,	%g5
	fmul8ulx16	%f26,	%f12,	%f4
	ldub	[%l7 + 0x65],	%g3
	ld	[%l7 + 0x0C],	%f24
	edge32ln	%o7,	%l1,	%g4
	fmovdne	%xcc,	%f4,	%f31
	mulscc	%o2,	%g6,	%g2
	movgu	%icc,	%i7,	%l2
	xnor	%o1,	%l0,	%l6
	fmovrdne	%i0,	%f8,	%f26
	ldub	[%l7 + 0x33],	%o0
	movrlz	%i2,	0x028,	%l4
	xnor	%i3,	%i4,	%o5
	movpos	%icc,	%o3,	%l5
	sllx	%i5,	%g1,	%o6
	popc	%i1,	%l3
	edge16	%g7,	%o4,	%g5
	sdivx	%i6,	0x0BF1,	%g3
	ldub	[%l7 + 0x2E],	%o7
	fmovsvc	%icc,	%f4,	%f20
	fcmpgt16	%f26,	%f18,	%l1
	mulx	%g4,	%o2,	%g6
	umul	%i7,	0x0C5B,	%l2
	movrlz	%o1,	0x153,	%g2
	nop
	set	0x21, %l0
	ldsb	[%l7 + %l0],	%l0
	addc	%l6,	0x1F4C,	%o0
	movne	%icc,	%i0,	%l4
	movne	%icc,	%i2,	%i4
	fmovrsne	%o5,	%f1,	%f8
	fmovrsgz	%i3,	%f31,	%f29
	orcc	%o3,	%i5,	%l5
	ldx	[%l7 + 0x08],	%o6
	xnor	%g1,	%l3,	%g7
	orcc	%o4,	%i1,	%i6
	fmul8sux16	%f6,	%f4,	%f28
	ldd	[%l7 + 0x68],	%f8
	array32	%g5,	%g3,	%l1
	bshuffle	%f18,	%f16,	%f22
	movpos	%xcc,	%o7,	%o2
	addc	%g6,	0x1774,	%g4
	fnegs	%f6,	%f26
	movl	%icc,	%i7,	%o1
	movrne	%g2,	%l0,	%l6
	movrne	%l2,	0x2A6,	%o0
	fcmpne16	%f8,	%f22,	%i0
	srl	%l4,	0x15,	%i4
	fxor	%f10,	%f6,	%f22
	fsrc2s	%f19,	%f5
	fcmpes	%fcc1,	%f3,	%f15
	andncc	%o5,	%i2,	%o3
	xorcc	%i3,	%l5,	%i5
	fmovdl	%icc,	%f2,	%f16
	std	%f26,	[%l7 + 0x38]
	fand	%f6,	%f18,	%f26
	udiv	%g1,	0x1BA3,	%l3
	array32	%g7,	%o6,	%o4
	array16	%i6,	%i1,	%g3
	edge32ln	%g5,	%l1,	%o7
	movpos	%icc,	%g6,	%o2
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	fcmple16	%f16,	%f24,	%l0
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f24
	fpackfix	%f4,	%f2
	movvc	%icc,	%g2,	%l6
	fmovsa	%xcc,	%f9,	%f2
	ldsb	[%l7 + 0x1C],	%l2
	smul	%o0,	0x1590,	%l4
	fpadd32	%f20,	%f16,	%f6
	fmovrslez	%i0,	%f13,	%f4
	udiv	%o5,	0x1AC0,	%i4
	array8	%i2,	%o3,	%i3
	mulscc	%i5,	%l5,	%g1
	alignaddr	%l3,	%o6,	%o4
	udiv	%g7,	0x1E33,	%i1
	nop
	set	0x5C, %l6
	ldsb	[%l7 + %l6],	%g3
	orcc	%g5,	0x031B,	%i6
	fmovsvs	%xcc,	%f29,	%f28
	movne	%xcc,	%o7,	%g6
	popc	%o2,	%l1
	ldx	[%l7 + 0x28],	%g4
	movrgez	%i7,	0x26F,	%o1
	srl	%g2,	%l6,	%l2
	smul	%o0,	0x08C4,	%l4
	edge8ln	%l0,	%o5,	%i4
	edge32	%i2,	%i0,	%o3
	ldsh	[%l7 + 0x4C],	%i5
	or	%l5,	%i3,	%l3
	edge32n	%g1,	%o6,	%g7
	smul	%o4,	%g3,	%i1
	std	%f30,	[%l7 + 0x18]
	addcc	%i6,	%o7,	%g5
	for	%f20,	%f24,	%f26
	ldd	[%l7 + 0x30],	%f4
	pdist	%f18,	%f24,	%f6
	sethi	0x10E4,	%g6
	stb	%l1,	[%l7 + 0x22]
	fmovdl	%xcc,	%f26,	%f30
	st	%f6,	[%l7 + 0x14]
	orn	%g4,	0x1FD3,	%i7
	fmovsvs	%icc,	%f18,	%f0
	sll	%o1,	0x1D,	%g2
	edge32	%l6,	%o2,	%l2
	sdiv	%l4,	0x1E01,	%l0
	edge8	%o0,	%i4,	%o5
	ldsw	[%l7 + 0x20],	%i2
	stw	%o3,	[%l7 + 0x54]
	ldsw	[%l7 + 0x64],	%i0
	orcc	%l5,	0x0898,	%i5
	edge16ln	%i3,	%l3,	%o6
	sra	%g1,	0x0E,	%o4
	ldub	[%l7 + 0x1A],	%g3
	xnorcc	%i1,	%g7,	%o7
	fcmple32	%f6,	%f22,	%i6
	orcc	%g5,	0x19C8,	%g6
	ld	[%l7 + 0x28],	%f11
	array8	%l1,	%g4,	%o1
	mova	%icc,	%i7,	%g2
	movrgez	%l6,	%o2,	%l4
	popc	0x1FC6,	%l2
	addc	%l0,	0x1A0D,	%i4
	fmovdvs	%xcc,	%f0,	%f6
	save %o5, %i2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i0,	%o0,	%i5
	and	%i3,	%l3,	%o6
	stw	%g1,	[%l7 + 0x18]
	movge	%icc,	%o4,	%g3
	fornot2s	%f5,	%f4,	%f3
	movcs	%icc,	%i1,	%g7
	ldsh	[%l7 + 0x12],	%l5
	movrlez	%i6,	%o7,	%g6
	fnot2s	%f2,	%f14
	addccc	%l1,	0x1EE1,	%g4
	movrlez	%o1,	0x33D,	%g5
	ldsh	[%l7 + 0x1E],	%g2
	movge	%xcc,	%i7,	%l6
	srax	%l4,	%l2,	%l0
	st	%f12,	[%l7 + 0x48]
	addc	%o2,	%o5,	%i4
	movle	%xcc,	%i2,	%o3
	edge32	%i0,	%i5,	%i3
	movrgez	%l3,	%o6,	%o0
	nop
	set	0x74, %l5
	ldub	[%l7 + %l5],	%g1
	udiv	%g3,	0x04E7,	%o4
	udiv	%i1,	0x0799,	%l5
	fabss	%f22,	%f5
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f28
	andn	%i6,	0x11DD,	%g7
	movneg	%xcc,	%o7,	%l1
	fmovdpos	%icc,	%f20,	%f13
	edge16l	%g4,	%g6,	%o1
	movrlz	%g2,	%g5,	%i7
	fpack16	%f4,	%f8
	mulscc	%l4,	%l2,	%l0
	array16	%o2,	%l6,	%o5
	ld	[%l7 + 0x70],	%f0
	for	%f28,	%f18,	%f28
	fcmpd	%fcc1,	%f22,	%f4
	fpack16	%f24,	%f24
	mova	%icc,	%i4,	%o3
	fmovsl	%icc,	%f9,	%f18
	move	%xcc,	%i2,	%i5
	edge16ln	%i3,	%i0,	%l3
	edge8n	%o6,	%g1,	%g3
	edge16l	%o0,	%o4,	%l5
	bshuffle	%f26,	%f6,	%f30
	umul	%i6,	%g7,	%o7
	array32	%i1,	%l1,	%g4
	andncc	%o1,	%g6,	%g5
	movrgez	%i7,	0x18E,	%g2
	movge	%icc,	%l2,	%l4
	smulcc	%l0,	%o2,	%l6
	movleu	%xcc,	%i4,	%o5
	andn	%i2,	%o3,	%i5
	movleu	%icc,	%i3,	%i0
	fcmpes	%fcc2,	%f31,	%f19
	sra	%o6,	0x03,	%g1
	lduh	[%l7 + 0x0C],	%l3
	subcc	%g3,	%o0,	%l5
	ldsb	[%l7 + 0x11],	%i6
	fsrc1	%f16,	%f2
	movge	%xcc,	%o4,	%g7
	movle	%xcc,	%i1,	%l1
	movge	%xcc,	%g4,	%o7
	move	%icc,	%o1,	%g6
	andncc	%g5,	%g2,	%i7
	srax	%l4,	%l2,	%l0
	movvc	%icc,	%l6,	%i4
	andn	%o2,	%o5,	%i2
	movn	%icc,	%o3,	%i5
	fabsd	%f28,	%f4
	movne	%icc,	%i0,	%i3
	xorcc	%o6,	0x00B0,	%g1
	udiv	%g3,	0x145B,	%o0
	edge32ln	%l5,	%i6,	%l3
	edge8l	%g7,	%o4,	%i1
	sra	%g4,	0x1F,	%o7
	orncc	%l1,	0x0D07,	%o1
	fmovdleu	%icc,	%f16,	%f3
	edge32n	%g6,	%g2,	%g5
	movrgz	%l4,	0x334,	%l2
	sethi	0x1CF2,	%l0
	ldub	[%l7 + 0x17],	%l6
	mulx	%i7,	%i4,	%o2
	orncc	%o5,	0x0CAC,	%i2
	nop
	set	0x4A, %g4
	sth	%i5,	[%l7 + %g4]
	lduw	[%l7 + 0x10],	%i0
	udivcc	%o3,	0x0B89,	%o6
	orncc	%i3,	%g1,	%g3
	movle	%icc,	%o0,	%l5
	umul	%l3,	0x1B8A,	%g7
	alignaddrl	%o4,	%i6,	%i1
	fpadd16s	%f17,	%f13,	%f8
	stb	%g4,	[%l7 + 0x2C]
	addc	%o7,	0x0EA2,	%o1
	or	%g6,	0x1B0E,	%l1
	st	%f8,	[%l7 + 0x0C]
	fmovrdgez	%g2,	%f8,	%f6
	stx	%g5,	[%l7 + 0x38]
	alignaddrl	%l2,	%l4,	%l6
	ldx	[%l7 + 0x20],	%l0
	subcc	%i4,	%i7,	%o5
	edge8ln	%o2,	%i5,	%i0
	fcmpgt32	%f26,	%f22,	%i2
	fmovrde	%o6,	%f8,	%f18
	fmul8x16	%f21,	%f4,	%f30
	movpos	%xcc,	%o3,	%i3
	mulx	%g3,	%o0,	%g1
	edge32	%l3,	%g7,	%l5
	movl	%icc,	%i6,	%i1
	sdiv	%g4,	0x1D78,	%o7
	fmovse	%xcc,	%f30,	%f26
	ldsh	[%l7 + 0x2E],	%o4
	edge8	%o1,	%g6,	%g2
	restore %l1, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l6,	%l4,	%l0
	fmovdle	%icc,	%f18,	%f10
	nop
	set	0x54, %g5
	stw	%i7,	[%l7 + %g5]
	fcmpeq32	%f6,	%f4,	%o5
	movge	%icc,	%i4,	%o2
	andn	%i5,	%i2,	%o6
	ldsb	[%l7 + 0x63],	%o3
	smulcc	%i3,	%i0,	%o0
	xorcc	%g1,	0x07D3,	%l3
	addccc	%g3,	%l5,	%g7
	fmovdne	%xcc,	%f5,	%f0
	movge	%icc,	%i6,	%i1
	subccc	%o7,	%o4,	%g4
	xor	%o1,	%g6,	%l1
	addcc	%g2,	%l2,	%l6
	array32	%l4,	%g5,	%l0
	fmovdle	%xcc,	%f5,	%f17
	movg	%icc,	%i7,	%i4
	subccc	%o5,	0x1E5B,	%o2
	sub	%i2,	%i5,	%o6
	fmuld8ulx16	%f10,	%f6,	%f24
	mova	%xcc,	%i3,	%i0
	movre	%o3,	%o0,	%l3
	nop
	set	0x26, %i7
	ldsh	[%l7 + %i7],	%g1
	lduh	[%l7 + 0x0E],	%l5
	or	%g7,	%i6,	%i1
	xnor	%o7,	%g3,	%g4
	sll	%o4,	%g6,	%o1
	fandnot2	%f4,	%f14,	%f20
	sdiv	%g2,	0x1A0A,	%l2
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%i6
	subccc	%l1,	%l4,	%l0
	movcs	%icc,	%i7,	%i4
	stw	%g5,	[%l7 + 0x44]
	sdivcc	%o5,	0x0177,	%o2
	movg	%icc,	%i2,	%o6
	smul	%i5,	0x094C,	%i0
	fmovdl	%xcc,	%f30,	%f28
	edge32	%i3,	%o0,	%l3
	orcc	%o3,	0x014D,	%g1
	fabss	%f1,	%f17
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	fzeros	%f24
	ldsb	[%l7 + 0x6D],	%g7
	movrne	%o7,	0x3CA,	%g3
	movvs	%xcc,	%i1,	%g4
	stw	%g6,	[%l7 + 0x6C]
	movpos	%icc,	%o4,	%o1
	stb	%l2,	[%l7 + 0x28]
	sll	%g2,	0x02,	%l6
	orn	%l4,	%l0,	%l1
	and	%i4,	%g5,	%o5
	alignaddrl	%o2,	%i7,	%o6
	movge	%xcc,	%i2,	%i5
	fnot2	%f12,	%f22
	stb	%i0,	[%l7 + 0x3F]
	smulcc	%i3,	0x1177,	%o0
	sdivcc	%l3,	0x04A9,	%o3
	alignaddrl	%g1,	%i6,	%l5
	sir	0x1C62
	ldx	[%l7 + 0x40],	%o7
	stb	%g7,	[%l7 + 0x0B]
	ldx	[%l7 + 0x60],	%i1
	addc	%g4,	%g3,	%g6
	addccc	%o1,	0x0EB7,	%l2
	edge8	%o4,	%l6,	%l4
	edge32n	%g2,	%l0,	%i4
	fmovrslez	%g5,	%f30,	%f9
	fandnot1s	%f21,	%f17,	%f0
	umulcc	%l1,	0x0B75,	%o2
	alignaddr	%i7,	%o5,	%o6
	fmul8x16al	%f17,	%f22,	%f14
	stw	%i2,	[%l7 + 0x38]
	array32	%i0,	%i5,	%i3
	addc	%o0,	%o3,	%g1
	movgu	%xcc,	%l3,	%i6
	movpos	%xcc,	%l5,	%o7
	or	%i1,	%g7,	%g4
	and	%g6,	0x03A6,	%o1
	std	%f30,	[%l7 + 0x18]
	fmovdcc	%xcc,	%f0,	%f28
	ldub	[%l7 + 0x69],	%l2
	sethi	0x1034,	%o4
	mulx	%l6,	0x0D41,	%l4
	subccc	%g3,	%g2,	%l0
	edge8l	%i4,	%g5,	%l1
	fpadd16s	%f24,	%f11,	%f13
	fmovde	%icc,	%f30,	%f20
	movrgz	%i7,	%o5,	%o6
	mova	%icc,	%o2,	%i0
	std	%f4,	[%l7 + 0x50]
	movgu	%icc,	%i5,	%i2
	movpos	%xcc,	%o0,	%i3
	save %o3, %g1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l3, 0x1C93, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%i1,	%g7
	subcc	%g4,	%o1,	%g6
	movre	%o4,	%l2,	%l6
	xorcc	%g3,	%l4,	%g2
	udiv	%i4,	0x1463,	%g5
	addccc	%l0,	%l1,	%o5
	edge8ln	%i7,	%o6,	%o2
	fmovdge	%xcc,	%f1,	%f8
	fmul8sux16	%f22,	%f2,	%f16
	popc	%i0,	%i2
	umulcc	%o0,	%i5,	%i3
	fnors	%f2,	%f30,	%f16
	andncc	%o3,	%g1,	%l3
	fmovsg	%xcc,	%f1,	%f21
	fmovscs	%icc,	%f4,	%f7
	fnors	%f8,	%f20,	%f19
	udivx	%i6,	0x1C57,	%o7
	andn	%l5,	%i1,	%g4
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%g7
	movge	%icc,	%g6,	%o4
	fxnor	%f30,	%f8,	%f22
	srl	%o1,	0x10,	%l2
	nop
	set	0x2C, %i2
	lduw	[%l7 + %i2],	%g3
	fcmple16	%f14,	%f24,	%l4
	movne	%icc,	%l6,	%i4
	faligndata	%f18,	%f30,	%f24
	lduh	[%l7 + 0x3A],	%g2
	edge8l	%l0,	%l1,	%g5
	ld	[%l7 + 0x08],	%f15
	ldd	[%l7 + 0x48],	%i6
	ldd	[%l7 + 0x30],	%o4
	andncc	%o2,	%i0,	%o6
	sth	%i2,	[%l7 + 0x4C]
	mulscc	%i5,	0x051B,	%o0
	fpsub16s	%f8,	%f16,	%f22
	movneg	%xcc,	%i3,	%o3
	subc	%g1,	%i6,	%l3
	subc	%o7,	%l5,	%i1
	edge32	%g4,	%g7,	%g6
	movrgez	%o4,	0x06C,	%o1
	nop
	set	0x44, %o3
	ldsb	[%l7 + %o3],	%l2
	fsrc2s	%f16,	%f15
	andncc	%g3,	%l4,	%l6
	movrne	%g2,	%l0,	%l1
	movl	%icc,	%i4,	%g5
	fands	%f23,	%f5,	%f22
	movge	%xcc,	%o5,	%i7
	movn	%xcc,	%o2,	%i0
	movne	%xcc,	%o6,	%i5
	movcs	%xcc,	%o0,	%i3
	xor	%o3,	%g1,	%i6
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%i2
	ldd	[%l7 + 0x48],	%f8
	array8	%o7,	%l5,	%l3
	fmovdle	%icc,	%f11,	%f20
	xnor	%g4,	%g7,	%i1
	fmovdcc	%icc,	%f12,	%f8
	movcc	%xcc,	%o4,	%o1
	movn	%xcc,	%g6,	%g3
	edge32ln	%l2,	%l4,	%g2
	addc	%l0,	0x0D8D,	%l1
	edge8	%i4,	%l6,	%o5
	movl	%xcc,	%i7,	%o2
	xor	%i0,	%g5,	%o6
	edge32n	%i5,	%o0,	%i3
	umul	%g1,	%o3,	%i2
	edge8ln	%o7,	%i6,	%l3
	addccc	%g4,	%g7,	%l5
	movgu	%xcc,	%o4,	%i1
	array16	%o1,	%g6,	%l2
	ldd	[%l7 + 0x10],	%g2
	fmovdpos	%xcc,	%f18,	%f2
	fcmpgt32	%f2,	%f6,	%l4
	mulscc	%g2,	0x05CE,	%l0
	edge32n	%i4,	%l1,	%o5
	fmovrsgz	%i7,	%f29,	%f0
	movrne	%o2,	%l6,	%i0
	orcc	%g5,	%i5,	%o6
	movvs	%icc,	%i3,	%g1
	fornot2	%f30,	%f16,	%f24
	array32	%o0,	%i2,	%o3
	edge8n	%o7,	%i6,	%l3
	movne	%icc,	%g4,	%l5
	pdist	%f12,	%f24,	%f14
	movcs	%icc,	%g7,	%o4
	fmovda	%icc,	%f15,	%f19
	movvc	%icc,	%o1,	%g6
	fnot2s	%f6,	%f26
	srax	%i1,	%g3,	%l2
	subccc	%g2,	%l0,	%l4
	or	%i4,	0x063C,	%l1
	fsrc2	%f24,	%f0
	movvs	%icc,	%i7,	%o5
	sdiv	%o2,	0x0047,	%l6
	addcc	%g5,	%i0,	%i5
	fornot2	%f28,	%f4,	%f4
	andncc	%o6,	%g1,	%o0
	array8	%i3,	%o3,	%i2
	sllx	%i6,	0x07,	%l3
	addc	%g4,	%o7,	%g7
	edge8	%l5,	%o1,	%o4
	mova	%xcc,	%g6,	%g3
	fmovsg	%icc,	%f4,	%f29
	move	%icc,	%l2,	%g2
	umulcc	%l0,	%i1,	%l4
	udiv	%l1,	0x0A78,	%i4
	orn	%i7,	0x1901,	%o2
	stw	%l6,	[%l7 + 0x28]
	ldsh	[%l7 + 0x68],	%g5
	fcmpd	%fcc3,	%f26,	%f30
	popc	%i0,	%i5
	fandnot1s	%f23,	%f27,	%f2
	fnands	%f13,	%f19,	%f30
	edge8n	%o5,	%g1,	%o0
	fmuld8ulx16	%f11,	%f19,	%f10
	edge8l	%o6,	%i3,	%o3
	fmovdvs	%icc,	%f31,	%f29
	edge32n	%i2,	%l3,	%g4
	restore %o7, %g7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i6,	[%l7 + 0x20]
	udiv	%o4,	0x071B,	%g6
	move	%icc,	%o1,	%l2
	srlx	%g3,	0x10,	%g2
	andcc	%l0,	%i1,	%l1
	movrlz	%i4,	%l4,	%i7
	smulcc	%o2,	0x108A,	%l6
	fmovsl	%xcc,	%f2,	%f28
	movre	%g5,	0x0ED,	%i5
	fmovrdne	%i0,	%f8,	%f20
	fabss	%f1,	%f7
	edge16l	%g1,	%o0,	%o5
	movrne	%o6,	0x157,	%o3
	xor	%i2,	%l3,	%g4
	subcc	%o7,	0x02E8,	%i3
	orcc	%g7,	%l5,	%i6
	sub	%o4,	0x0B4F,	%o1
	ldsw	[%l7 + 0x14],	%g6
	fsrc1	%f6,	%f22
	fmuld8ulx16	%f3,	%f22,	%f2
	xor	%l2,	%g3,	%l0
	fnors	%f20,	%f15,	%f17
	fpackfix	%f0,	%f12
	faligndata	%f18,	%f30,	%f26
	edge8ln	%g2,	%l1,	%i1
	fmovsne	%xcc,	%f4,	%f30
	or	%l4,	%i4,	%o2
	xnorcc	%l6,	0x0605,	%i7
	movrgz	%g5,	0x158,	%i5
	st	%f17,	[%l7 + 0x60]
	array8	%i0,	%o0,	%o5
	fmovsleu	%xcc,	%f22,	%f31
	fpsub16s	%f6,	%f0,	%f11
	srl	%o6,	0x16,	%g1
	smulcc	%o3,	0x098F,	%i2
	fsrc1s	%f7,	%f21
	orcc	%g4,	%l3,	%o7
	mulx	%i3,	%l5,	%i6
	fabss	%f3,	%f22
	sub	%o4,	0x0142,	%g7
	movrlez	%g6,	%l2,	%o1
	smulcc	%g3,	%g2,	%l0
	movrne	%l1,	0x29B,	%l4
	udivcc	%i4,	0x17EA,	%o2
	edge16	%i1,	%i7,	%g5
	edge32n	%i5,	%l6,	%o0
	ldsb	[%l7 + 0x5A],	%o5
	and	%o6,	0x0A2B,	%i0
	ld	[%l7 + 0x14],	%f22
	stx	%o3,	[%l7 + 0x38]
	nop
	set	0x2B, %o1
	ldub	[%l7 + %o1],	%i2
	orncc	%g4,	0x03B8,	%g1
	srlx	%l3,	%o7,	%i3
	edge8	%l5,	%o4,	%i6
	edge8l	%g7,	%l2,	%g6
	subcc	%g3,	%g2,	%l0
	movrlz	%l1,	%o1,	%l4
	sub	%o2,	0x1970,	%i4
	movcc	%xcc,	%i1,	%i7
	edge8ln	%g5,	%l6,	%o0
	edge16l	%o5,	%o6,	%i5
	edge8l	%i0,	%i2,	%g4
	ldsb	[%l7 + 0x38],	%o3
	movvc	%icc,	%g1,	%o7
	fxor	%f12,	%f2,	%f24
	srax	%i3,	%l3,	%o4
	smulcc	%i6,	%l5,	%g7
	movpos	%xcc,	%g6,	%g3
	fmovsle	%icc,	%f1,	%f22
	fmovdge	%icc,	%f30,	%f4
	fmovdcc	%icc,	%f15,	%f11
	sdivx	%g2,	0x1860,	%l2
	sth	%l1,	[%l7 + 0x1A]
	edge8n	%l0,	%o1,	%l4
	movre	%i4,	0x343,	%o2
	smulcc	%i1,	0x1AB1,	%i7
	udivx	%l6,	0x16F0,	%g5
	fmul8x16al	%f26,	%f18,	%f22
	movne	%icc,	%o5,	%o0
	fmovdle	%xcc,	%f4,	%f8
	sir	0x12D6
	std	%f12,	[%l7 + 0x70]
	fmul8x16	%f17,	%f26,	%f4
	movgu	%icc,	%o6,	%i0
	fmovdvc	%xcc,	%f12,	%f20
	mulscc	%i5,	%i2,	%g4
	udiv	%g1,	0x1782,	%o3
	movgu	%icc,	%i3,	%l3
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%o4
	srl	%o7,	0x06,	%l5
	mulx	%g7,	%i6,	%g6
	movn	%xcc,	%g2,	%l2
	lduw	[%l7 + 0x18],	%l1
	fmovdne	%xcc,	%f13,	%f15
	add	%g3,	0x135E,	%l0
	andncc	%o1,	%i4,	%l4
	andn	%i1,	0x094D,	%o2
	edge16	%i7,	%g5,	%l6
	edge8l	%o5,	%o6,	%i0
	array8	%o0,	%i2,	%g4
	edge8n	%i5,	%g1,	%o3
	edge32l	%i3,	%l3,	%o4
	mulscc	%l5,	%o7,	%g7
	array16	%g6,	%g2,	%i6
	sdiv	%l2,	0x06DA,	%l1
	ldsh	[%l7 + 0x64],	%g3
	fmovrdlez	%l0,	%f4,	%f30
	movl	%icc,	%o1,	%i4
	fnor	%f10,	%f24,	%f0
	andncc	%i1,	%o2,	%l4
	udiv	%i7,	0x0524,	%l6
	fcmple32	%f24,	%f22,	%o5
	udivx	%g5,	0x0FB0,	%i0
	array8	%o0,	%i2,	%g4
	save %o6, 0x06D5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g1,	%i3,	%l3
	movle	%icc,	%o4,	%o3
	edge16	%o7,	%g7,	%g6
	udivx	%l5,	0x167C,	%i6
	xnorcc	%g2,	0x05C6,	%l1
	movneg	%xcc,	%g3,	%l2
	ldsh	[%l7 + 0x0C],	%o1
	sllx	%i4,	%l0,	%o2
	sub	%l4,	0x0057,	%i7
	udivx	%i1,	0x0A59,	%o5
	sethi	0x0845,	%g5
	edge8l	%l6,	%i0,	%i2
	udivx	%o0,	0x0DF5,	%o6
	array32	%g4,	%i5,	%i3
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	movle	%xcc,	%g1,	%o3
	sdivx	%o7,	0x192B,	%g7
	mulscc	%l5,	0x126C,	%g6
	andn	%i6,	0x0C12,	%g2
	srlx	%g3,	0x14,	%l2
	orncc	%l1,	0x03BB,	%i4
	udivx	%l0,	0x1E5D,	%o1
	subc	%l4,	%o2,	%i7
	sub	%o5,	%i1,	%g5
	mulscc	%i0,	0x0E86,	%i2
	movneg	%xcc,	%l6,	%o6
	lduh	[%l7 + 0x74],	%g4
	subcc	%i5,	0x197F,	%o0
	movrne	%l3,	%o4,	%g1
	fmovrsne	%o3,	%f14,	%f5
	fmovsneg	%xcc,	%f6,	%f11
	movrgez	%i3,	0x11A,	%o7
	fmovdpos	%xcc,	%f4,	%f20
	stb	%l5,	[%l7 + 0x2E]
	movgu	%xcc,	%g6,	%g7
	fnegs	%f5,	%f2
	movpos	%icc,	%i6,	%g3
	movpos	%icc,	%g2,	%l2
	sub	%l1,	%l0,	%o1
	fmul8x16au	%f9,	%f22,	%f26
	movre	%l4,	%o2,	%i4
	sdivcc	%o5,	0x078E,	%i7
	movcc	%icc,	%g5,	%i1
	edge16	%i2,	%i0,	%o6
	alignaddr	%l6,	%i5,	%o0
	edge8ln	%l3,	%o4,	%g4
	xnorcc	%o3,	0x0333,	%i3
	ldsh	[%l7 + 0x6C],	%o7
	srl	%g1,	0x18,	%l5
	udivcc	%g6,	0x06FD,	%g7
	fandnot2s	%f13,	%f21,	%f11
	ldd	[%l7 + 0x38],	%g2
	umulcc	%g2,	0x1C02,	%l2
	fmovsn	%icc,	%f13,	%f3
	ldub	[%l7 + 0x58],	%l1
	edge16l	%l0,	%o1,	%i6
	movn	%icc,	%l4,	%o2
	stb	%i4,	[%l7 + 0x1D]
	restore %i7, %g5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f22,	%f26,	%f28
	fxor	%f12,	%f22,	%f28
	fxors	%f15,	%f8,	%f12
	fmovrdlez	%i2,	%f22,	%f28
	movpos	%icc,	%i0,	%i1
	subcc	%l6,	0x136A,	%i5
	orncc	%o0,	0x1481,	%l3
	movgu	%icc,	%o4,	%g4
	udiv	%o6,	0x0A30,	%i3
	fmovsvc	%icc,	%f22,	%f21
	sllx	%o7,	0x16,	%g1
	orncc	%o3,	%l5,	%g7
	fmovsle	%icc,	%f18,	%f1
	orcc	%g3,	0x0536,	%g2
	fpsub32	%f28,	%f6,	%f22
	edge16ln	%l2,	%l1,	%g6
	edge8ln	%o1,	%l0,	%l4
	ld	[%l7 + 0x74],	%f10
	sir	0x1352
	move	%icc,	%o2,	%i4
	udiv	%i6,	0x1D5A,	%g5
	ldd	[%l7 + 0x58],	%f22
	mulscc	%i7,	0x0D62,	%o5
	fmovdg	%icc,	%f21,	%f9
	siam	0x2
	fandnot2s	%f12,	%f26,	%f26
	movcs	%xcc,	%i0,	%i2
	umul	%i1,	%i5,	%o0
	edge8n	%l6,	%l3,	%o4
	movle	%xcc,	%g4,	%i3
	fmovdvs	%xcc,	%f19,	%f14
	movl	%icc,	%o6,	%o7
	nop
	set	0x56, %o5
	lduh	[%l7 + %o5],	%g1
	orcc	%o3,	0x089D,	%l5
	mova	%xcc,	%g3,	%g7
	fmovrsgez	%l2,	%f25,	%f12
	movrlez	%g2,	%g6,	%o1
	movvs	%xcc,	%l0,	%l1
	srlx	%o2,	0x02,	%l4
	movrgz	%i4,	0x1FB,	%g5
	movl	%xcc,	%i6,	%i7
	ldx	[%l7 + 0x60],	%o5
	mulx	%i2,	%i1,	%i5
	umulcc	%i0,	%l6,	%o0
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	movneg	%icc,	%o6,	%o7
	restore %g1, 0x1DC8, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x56],	%l5
	movge	%icc,	%i3,	%g3
	smul	%l2,	%g7,	%g2
	movgu	%xcc,	%o1,	%l0
	fmovdg	%icc,	%f3,	%f24
	movcs	%icc,	%g6,	%l1
	fandnot1	%f26,	%f28,	%f10
	andncc	%o2,	%i4,	%g5
	fornot2	%f24,	%f18,	%f26
	udiv	%i6,	0x1BDB,	%i7
	stx	%o5,	[%l7 + 0x08]
	subc	%i2,	0x1029,	%l4
	sub	%i1,	0x1C32,	%i0
	fpack16	%f8,	%f3
	sll	%i5,	%l6,	%o0
	srl	%l3,	0x00,	%o4
	udivcc	%o6,	0x1B93,	%o7
	add	%g1,	0x04C1,	%o3
	udiv	%g4,	0x170A,	%i3
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%l4
	xorcc	%l2,	%g3,	%g7
	st	%f18,	[%l7 + 0x38]
	array32	%o1,	%g2,	%l0
	fandnot1s	%f27,	%f8,	%f17
	xnor	%l1,	0x0486,	%o2
	ld	[%l7 + 0x7C],	%f17
	and	%g6,	%i4,	%i6
	alignaddr	%i7,	%o5,	%g5
	movgu	%icc,	%i2,	%l4
	movl	%icc,	%i1,	%i5
	sra	%i0,	%o0,	%l3
	orn	%l6,	0x00B2,	%o6
	edge16l	%o4,	%o7,	%g1
	movge	%icc,	%o3,	%g4
	movcs	%xcc,	%i3,	%l2
	edge16ln	%g3,	%l5,	%o1
	sll	%g2,	0x1E,	%l0
	popc	0x0A34,	%l1
	subc	%g7,	%g6,	%i4
	fmovrsgez	%i6,	%f11,	%f3
	fpsub32s	%f1,	%f25,	%f27
	fnot2s	%f5,	%f22
	umul	%i7,	0x0303,	%o5
	xorcc	%g5,	%i2,	%o2
	sub	%l4,	%i5,	%i1
	fnors	%f3,	%f10,	%f14
	fmovdcc	%icc,	%f9,	%f8
	movrlez	%o0,	%l3,	%l6
	andcc	%o6,	%i0,	%o7
	and	%g1,	%o4,	%g4
	srlx	%o3,	0x16,	%i3
	sdiv	%l2,	0x147F,	%l5
	fmovsa	%icc,	%f31,	%f18
	array32	%g3,	%o1,	%l0
	array8	%g2,	%l1,	%g6
	fornot2	%f16,	%f2,	%f26
	orncc	%g7,	0x0E6A,	%i6
	fpadd32s	%f16,	%f14,	%f21
	movl	%xcc,	%i7,	%i4
	movcs	%xcc,	%g5,	%i2
	lduw	[%l7 + 0x5C],	%o5
	edge8n	%o2,	%i5,	%i1
	subc	%l4,	%l3,	%l6
	fones	%f5
	xnor	%o0,	%o6,	%o7
	addccc	%i0,	%g1,	%g4
	fmovdpos	%xcc,	%f17,	%f29
	movvc	%xcc,	%o3,	%i3
	subc	%l2,	%l5,	%g3
	fandnot1s	%f18,	%f5,	%f13
	addc	%o1,	0x0F5B,	%l0
	fornot2s	%f13,	%f19,	%f13
	umul	%g2,	%o4,	%l1
	orn	%g6,	%i6,	%i7
	fmovdne	%icc,	%f30,	%f21
	edge16	%g7,	%g5,	%i2
	udivx	%i4,	0x0B01,	%o5
	sth	%i5,	[%l7 + 0x36]
	movpos	%icc,	%i1,	%o2
	orcc	%l4,	%l6,	%o0
	umulcc	%l3,	%o6,	%i0
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	fnegs	%f15,	%f2
	fpsub32s	%f25,	%f5,	%f4
	nop
	set	0x5C, %o4
	lduw	[%l7 + %o4],	%i3
	fsrc2	%f2,	%f2
	ldx	[%l7 + 0x10],	%l2
	andn	%o3,	%l5,	%o1
	orn	%g3,	%l0,	%g2
	fpadd16s	%f29,	%f9,	%f8
	st	%f0,	[%l7 + 0x34]
	edge16	%o4,	%g6,	%l1
	movrne	%i6,	%i7,	%g7
	sth	%g5,	[%l7 + 0x60]
	sub	%i2,	0x19E1,	%i4
	movl	%icc,	%o5,	%i5
	lduw	[%l7 + 0x50],	%i1
	ldub	[%l7 + 0x7B],	%o2
	bshuffle	%f2,	%f24,	%f2
	popc	%l4,	%l6
	array32	%o0,	%l3,	%i0
	movle	%xcc,	%o7,	%g1
	udiv	%g4,	0x0844,	%o6
	sllx	%i3,	%o3,	%l5
	fandnot1s	%f23,	%f28,	%f4
	fors	%f18,	%f27,	%f20
	add	%o1,	0x0D69,	%g3
	ldsh	[%l7 + 0x12],	%l0
	movn	%icc,	%g2,	%l2
	movg	%icc,	%g6,	%o4
	sth	%l1,	[%l7 + 0x78]
	sdivx	%i6,	0x042F,	%g7
	edge8	%i7,	%i2,	%g5
	movneg	%icc,	%o5,	%i4
	andcc	%i5,	%o2,	%i1
	movl	%icc,	%l6,	%o0
	or	%l3,	0x1144,	%i0
	fcmped	%fcc3,	%f4,	%f16
	sra	%o7,	%g1,	%g4
	save %l4, 0x0181, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o6,	%l5
	fone	%f10
	fcmple16	%f8,	%f0,	%o1
	edge8ln	%g3,	%l0,	%g2
	fxnors	%f16,	%f15,	%f24
	fcmpgt32	%f16,	%f14,	%o3
	fmul8ulx16	%f24,	%f22,	%f6
	stb	%l2,	[%l7 + 0x48]
	fornot2s	%f4,	%f13,	%f18
	ldd	[%l7 + 0x78],	%g6
	xor	%o4,	0x1D67,	%i6
	fmovsleu	%icc,	%f28,	%f25
	andn	%g7,	%i7,	%i2
	mulscc	%g5,	%l1,	%o5
	and	%i5,	%i4,	%o2
	sra	%i1,	%l6,	%o0
	fsrc2s	%f3,	%f10
	udivx	%i0,	0x1561,	%o7
	sllx	%l3,	%g4,	%l4
	movge	%xcc,	%g1,	%i3
	sllx	%o6,	%o1,	%l5
	fpack16	%f20,	%f8
	movrgez	%g3,	%l0,	%g2
	umulcc	%o3,	%g6,	%l2
	orn	%o4,	0x0DDF,	%i6
	subcc	%i7,	%i2,	%g7
	lduh	[%l7 + 0x30],	%l1
	movrgez	%g5,	0x1E5,	%o5
	and	%i4,	%o2,	%i5
	fnot1	%f12,	%f6
	edge32ln	%i1,	%l6,	%i0
	sdivcc	%o7,	0x13D3,	%o0
	fsrc2s	%f22,	%f25
	edge8	%l3,	%l4,	%g4
	edge32ln	%g1,	%o6,	%o1
	sir	0x12EA
	fmovrsgez	%i3,	%f3,	%f31
	fands	%f25,	%f15,	%f27
	srax	%l5,	0x17,	%l0
	edge8	%g3,	%o3,	%g2
	movcs	%icc,	%g6,	%o4
	umul	%i6,	%l2,	%i2
	fmovscc	%xcc,	%f6,	%f14
	srl	%g7,	0x11,	%l1
	fmul8x16al	%f15,	%f15,	%f14
	fmovdcs	%xcc,	%f31,	%f15
	lduw	[%l7 + 0x14],	%g5
	xor	%o5,	%i7,	%o2
	edge32n	%i4,	%i5,	%i1
	for	%f10,	%f24,	%f2
	fnegd	%f30,	%f14
	siam	0x1
	sra	%l6,	%i0,	%o0
	edge8ln	%o7,	%l3,	%l4
	fsrc2	%f12,	%f14
	movleu	%icc,	%g1,	%o6
	edge32n	%o1,	%i3,	%g4
	nop
	set	0x20, %o2
	ldsw	[%l7 + %o2],	%l0
	st	%f31,	[%l7 + 0x18]
	array16	%g3,	%l5,	%o3
	fabsd	%f12,	%f6
	fcmpne16	%f8,	%f2,	%g6
	fmovsne	%xcc,	%f8,	%f20
	edge16ln	%o4,	%g2,	%l2
	std	%f30,	[%l7 + 0x78]
	movl	%icc,	%i2,	%g7
	mulx	%i6,	0x12B2,	%l1
	xor	%g5,	0x164D,	%o5
	stw	%o2,	[%l7 + 0x4C]
	add	%i4,	0x03C9,	%i7
	edge8l	%i1,	%i5,	%i0
	xnorcc	%l6,	0x1FA9,	%o0
	ldub	[%l7 + 0x40],	%o7
	sir	0x1C00
	for	%f18,	%f4,	%f10
	xnorcc	%l4,	0x05C0,	%g1
	movre	%l3,	%o6,	%i3
	movn	%icc,	%o1,	%l0
	umul	%g3,	0x06CC,	%g4
	andcc	%l5,	0x1A14,	%o3
	and	%g6,	%g2,	%l2
	udivcc	%o4,	0x01E6,	%i2
	fcmped	%fcc0,	%f6,	%f14
	fxors	%f0,	%f18,	%f30
	sth	%g7,	[%l7 + 0x60]
	fsrc1	%f12,	%f14
	xor	%l1,	0x1E36,	%g5
	srax	%i6,	0x10,	%o5
	or	%o2,	0x1F96,	%i4
	fpackfix	%f8,	%f20
	movcc	%icc,	%i1,	%i7
	fornot2	%f6,	%f12,	%f22
	movgu	%icc,	%i0,	%l6
	array16	%o0,	%i5,	%l4
	movre	%o7,	%g1,	%o6
	edge32	%l3,	%i3,	%l0
	ldsb	[%l7 + 0x7C],	%o1
	popc	0x0627,	%g4
	orn	%l5,	%o3,	%g6
	orcc	%g3,	%l2,	%o4
	edge32l	%i2,	%g2,	%l1
	fmovsvs	%xcc,	%f29,	%f25
	alignaddrl	%g5,	%g7,	%o5
	fnors	%f12,	%f16,	%f4
	array32	%i6,	%i4,	%o2
	sth	%i7,	[%l7 + 0x58]
	movle	%xcc,	%i0,	%l6
	sir	0x0BD5
	fmovsle	%xcc,	%f5,	%f12
	fones	%f15
	edge32l	%i1,	%i5,	%l4
	fmovdvc	%icc,	%f26,	%f15
	fpadd32s	%f27,	%f31,	%f4
	movgu	%icc,	%o0,	%o7
	fsrc1s	%f6,	%f2
	movg	%icc,	%g1,	%o6
	fpsub32	%f24,	%f26,	%f16
	mova	%xcc,	%i3,	%l0
	ldd	[%l7 + 0x10],	%f20
	mulscc	%o1,	%l3,	%g4
	fmovrdgz	%o3,	%f10,	%f10
	subc	%l5,	%g6,	%g3
	fpsub32s	%f14,	%f9,	%f7
	addc	%o4,	%i2,	%g2
	sir	0x0322
	fcmpne16	%f6,	%f4,	%l2
	fnands	%f9,	%f13,	%f14
	subcc	%l1,	%g5,	%g7
	edge16n	%o5,	%i4,	%i6
	fandnot2	%f16,	%f14,	%f18
	edge8	%i7,	%i0,	%o2
	movvs	%icc,	%l6,	%i5
	fpackfix	%f10,	%f11
	movrlz	%i1,	%l4,	%o7
	udivx	%o0,	0x13DE,	%g1
	subccc	%o6,	%l0,	%o1
	orncc	%i3,	%l3,	%g4
	andn	%o3,	%l5,	%g6
	edge16ln	%o4,	%g3,	%i2
	addccc	%g2,	%l1,	%l2
	edge16n	%g5,	%g7,	%o5
	move	%xcc,	%i4,	%i6
	addcc	%i0,	%i7,	%o2
	subccc	%i5,	%i1,	%l4
	sra	%l6,	%o7,	%g1
	fsrc2	%f12,	%f30
	ldd	[%l7 + 0x40],	%o6
	sdiv	%l0,	0x0417,	%o1
	edge16l	%i3,	%l3,	%g4
	movrlez	%o0,	%o3,	%g6
	ldub	[%l7 + 0x6C],	%l5
	ldsw	[%l7 + 0x24],	%o4
	stw	%g3,	[%l7 + 0x1C]
	addcc	%g2,	0x092A,	%l1
	srax	%i2,	%l2,	%g7
	alignaddr	%g5,	%o5,	%i6
	fmovdle	%xcc,	%f10,	%f25
	fpsub32s	%f12,	%f9,	%f13
	addcc	%i4,	0x0697,	%i0
	sdivx	%i7,	0x02D1,	%o2
	fexpand	%f21,	%f2
	movge	%xcc,	%i1,	%l4
	fmovrdne	%i5,	%f8,	%f12
	popc	0x1C2D,	%l6
	movleu	%xcc,	%g1,	%o6
	st	%f29,	[%l7 + 0x28]
	array8	%o7,	%o1,	%l0
	fsrc2s	%f30,	%f7
	movneg	%xcc,	%l3,	%i3
	sll	%g4,	%o0,	%o3
	movvc	%xcc,	%g6,	%l5
	fmovdpos	%icc,	%f9,	%f19
	sllx	%g3,	%g2,	%l1
	fcmpes	%fcc2,	%f27,	%f20
	movrgez	%o4,	%i2,	%g7
	edge16ln	%g5,	%o5,	%i6
	fabsd	%f2,	%f8
	movre	%i4,	%i0,	%i7
	lduh	[%l7 + 0x50],	%o2
	movne	%icc,	%l2,	%i1
	movle	%icc,	%l4,	%l6
	xor	%g1,	%o6,	%o7
	movl	%xcc,	%i5,	%l0
	array32	%l3,	%o1,	%i3
	srax	%o0,	0x11,	%g4
	lduw	[%l7 + 0x14],	%g6
	edge8l	%l5,	%g3,	%o3
	fmovrdgez	%l1,	%f28,	%f26
	fone	%f6
	fpadd32s	%f8,	%f26,	%f18
	fpsub32	%f22,	%f30,	%f0
	edge32	%g2,	%o4,	%g7
	movpos	%xcc,	%i2,	%o5
	fnand	%f24,	%f24,	%f4
	srax	%g5,	%i4,	%i0
	movrlez	%i6,	%o2,	%l2
	xnor	%i1,	%l4,	%l6
	movneg	%xcc,	%g1,	%i7
	sdivx	%o7,	0x1E68,	%i5
	sra	%l0,	%l3,	%o1
	edge16l	%o6,	%o0,	%g4
	sir	0x143C
	movgu	%xcc,	%i3,	%g6
	movn	%xcc,	%l5,	%o3
	edge8n	%g3,	%l1,	%g2
	sdivx	%g7,	0x1F27,	%o4
	fxnors	%f30,	%f21,	%f11
	orn	%o5,	0x11BA,	%i2
	edge16n	%g5,	%i4,	%i6
	movg	%xcc,	%i0,	%o2
	smulcc	%l2,	0x1432,	%i1
	ldub	[%l7 + 0x5D],	%l6
	sdivcc	%l4,	0x15C4,	%i7
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f10
	fmovdcc	%xcc,	%f25,	%f11
	movpos	%xcc,	%o7,	%i5
	fsrc1	%f4,	%f4
	add	%g1,	%l0,	%o1
	xorcc	%o6,	%l3,	%g4
	movrlez	%i3,	0x074,	%o0
	smul	%g6,	%o3,	%g3
	srl	%l5,	%g2,	%g7
	edge8l	%o4,	%l1,	%o5
	lduh	[%l7 + 0x48],	%i2
	edge16n	%g5,	%i4,	%i6
	ldub	[%l7 + 0x69],	%o2
	fcmpd	%fcc1,	%f28,	%f16
	ldx	[%l7 + 0x10],	%l2
	orn	%i1,	0x03D4,	%i0
	fmovdg	%xcc,	%f26,	%f8
	fmovsge	%xcc,	%f14,	%f7
	fcmpd	%fcc1,	%f10,	%f28
	edge8ln	%l4,	%i7,	%l6
	std	%f8,	[%l7 + 0x60]
	ldub	[%l7 + 0x3E],	%o7
	fnors	%f19,	%f14,	%f14
	orcc	%g1,	%l0,	%o1
	edge16l	%i5,	%o6,	%g4
	fandnot1	%f4,	%f12,	%f30
	addccc	%i3,	%o0,	%g6
	movleu	%icc,	%l3,	%g3
	edge16n	%l5,	%o3,	%g2
	fmuld8sux16	%f31,	%f8,	%f10
	movne	%xcc,	%g7,	%l1
	sra	%o5,	%o4,	%g5
	addcc	%i4,	0x09C5,	%i2
	fmovda	%xcc,	%f0,	%f3
	andcc	%o2,	0x1C28,	%i6
	orncc	%i1,	0x03CB,	%l2
	movg	%xcc,	%i0,	%i7
	fmovdcc	%icc,	%f29,	%f26
	edge32	%l4,	%l6,	%o7
	fmovdleu	%icc,	%f28,	%f20
	edge32n	%g1,	%l0,	%i5
	edge16	%o6,	%o1,	%i3
	subcc	%o0,	0x1537,	%g6
	edge32l	%g4,	%l3,	%g3
	sethi	0x1008,	%l5
	fnot2	%f4,	%f18
	alignaddr	%o3,	%g7,	%l1
	movcc	%icc,	%g2,	%o5
	alignaddr	%g5,	%o4,	%i2
	subc	%i4,	%o2,	%i1
	sllx	%i6,	%l2,	%i7
	movrlez	%i0,	%l6,	%o7
	st	%f1,	[%l7 + 0x18]
	add	%l4,	%l0,	%g1
	array32	%o6,	%i5,	%o1
	fmovsn	%icc,	%f24,	%f29
	sdivcc	%i3,	0x1493,	%g6
	fmovdvs	%icc,	%f7,	%f11
	ldd	[%l7 + 0x70],	%g4
	fmovsge	%xcc,	%f9,	%f6
	and	%o0,	%l3,	%g3
	movgu	%xcc,	%o3,	%g7
	or	%l5,	0x1082,	%g2
	movrne	%l1,	%g5,	%o4
	movrgez	%o5,	%i4,	%o2
	movvc	%xcc,	%i1,	%i6
	nop
	set	0x38, %l3
	lduh	[%l7 + %l3],	%i2
	sub	%l2,	0x0DC9,	%i7
	fmovdleu	%icc,	%f13,	%f4
	sdivx	%l6,	0x0B1E,	%i0
	fmovdn	%xcc,	%f30,	%f22
	fandnot1	%f30,	%f6,	%f26
	addccc	%l4,	%o7,	%g1
	ldsw	[%l7 + 0x44],	%o6
	sub	%i5,	%l0,	%i3
	orn	%o1,	%g4,	%o0
	fcmpne32	%f6,	%f14,	%g6
	stb	%g3,	[%l7 + 0x79]
	lduw	[%l7 + 0x28],	%o3
	udiv	%g7,	0x1284,	%l5
	edge16l	%g2,	%l1,	%l3
	sub	%g5,	0x161D,	%o5
	or	%i4,	%o4,	%o2
	sth	%i1,	[%l7 + 0x3E]
	orn	%i6,	%l2,	%i2
	fcmple32	%f26,	%f4,	%i7
	lduh	[%l7 + 0x62],	%l6
	sdivx	%i0,	0x118E,	%o7
	edge32l	%l4,	%g1,	%i5
	movvc	%icc,	%o6,	%l0
	srax	%i3,	0x14,	%o1
	movcs	%icc,	%o0,	%g4
	movleu	%xcc,	%g3,	%g6
	move	%icc,	%g7,	%l5
	subc	%g2,	0x1424,	%l1
	srl	%o3,	0x15,	%l3
	fnegd	%f14,	%f8
	movpos	%icc,	%g5,	%i4
	fmovsge	%xcc,	%f26,	%f7
	std	%f4,	[%l7 + 0x70]
	edge32l	%o5,	%o4,	%o2
	movrlez	%i1,	0x16E,	%i6
	movgu	%icc,	%i2,	%l2
	fmovrslez	%l6,	%f5,	%f4
	edge32n	%i0,	%i7,	%o7
	addc	%g1,	%i5,	%o6
	udivcc	%l4,	0x089D,	%i3
	fnot2s	%f13,	%f26
	ldsh	[%l7 + 0x3C],	%o1
	save %l0, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g6,	[%l7 + 0x7C]
	xnor	%g3,	%l5,	%g2
	fpadd32	%f10,	%f18,	%f24
	movrne	%g7,	%l1,	%o3
	fzero	%f26
	fmovrdlz	%g5,	%f8,	%f0
	movn	%icc,	%l3,	%o5
	movg	%xcc,	%o4,	%i4
	fornot1	%f18,	%f28,	%f28
	edge16ln	%o2,	%i6,	%i1
	movvs	%xcc,	%l2,	%i2
	movrlez	%i0,	%l6,	%i7
	xor	%o7,	0x12BA,	%i5
	fcmpne16	%f8,	%f2,	%g1
	sll	%l4,	0x18,	%i3
	edge32l	%o1,	%l0,	%g4
	stw	%o6,	[%l7 + 0x58]
	fpsub16	%f8,	%f4,	%f26
	ldsh	[%l7 + 0x48],	%g6
	andcc	%o0,	0x0E81,	%l5
	fnands	%f26,	%f15,	%f26
	stx	%g2,	[%l7 + 0x18]
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%g6
	ldd	[%l7 + 0x08],	%l0
	fnor	%f2,	%f26,	%f20
	edge8	%g3,	%g5,	%o3
	mulx	%o5,	0x1601,	%o4
	and	%l3,	%i4,	%i6
	movvc	%icc,	%i1,	%l2
	andcc	%i2,	%i0,	%l6
	srax	%o2,	%o7,	%i7
	addc	%i5,	0x0671,	%l4
	fpack32	%f6,	%f0,	%f20
	movge	%xcc,	%i3,	%o1
	edge16ln	%g1,	%g4,	%l0
	umulcc	%o6,	%g6,	%l5
	fmovrslz	%g2,	%f6,	%f9
	mulx	%g7,	%l1,	%g3
	sdivcc	%o0,	0x158B,	%o3
	udiv	%g5,	0x0D93,	%o4
	fmul8x16al	%f28,	%f5,	%f12
	fnot1	%f2,	%f26
	movge	%xcc,	%o5,	%i4
	movl	%icc,	%l3,	%i6
	fnors	%f21,	%f23,	%f9
	subccc	%i1,	%l2,	%i2
	edge8l	%l6,	%o2,	%o7
	fnot2s	%f23,	%f10
	st	%f14,	[%l7 + 0x30]
	fmovscc	%xcc,	%f28,	%f14
	movne	%xcc,	%i0,	%i5
	sll	%l4,	0x0D,	%i3
	fmovdpos	%xcc,	%f14,	%f4
	udivx	%o1,	0x1AB9,	%i7
	fmovdne	%icc,	%f4,	%f30
	edge32	%g4,	%l0,	%g1
	subcc	%o6,	%l5,	%g6
	sra	%g2,	%l1,	%g7
	sll	%g3,	%o0,	%g5
	fandnot2	%f8,	%f16,	%f14
	addccc	%o4,	0x15E6,	%o3
	sdivx	%o5,	0x1AAA,	%l3
	edge8n	%i6,	%i1,	%l2
	fmovrdgez	%i2,	%f22,	%f14
	fcmpne16	%f20,	%f26,	%i4
	move	%icc,	%o2,	%l6
	fcmpgt16	%f22,	%f22,	%i0
	and	%o7,	0x1921,	%i5
	edge32ln	%i3,	%o1,	%i7
	umul	%l4,	%g4,	%g1
	andncc	%l0,	%l5,	%g6
	sir	0x1B03
	restore %g2, 0x19E8, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l1,	%g7
	edge32	%o0,	%g5,	%g3
	movre	%o4,	0x149,	%o3
	fpadd32	%f6,	%f4,	%f4
	array16	%o5,	%i6,	%l3
	add	%i1,	0x0D66,	%i2
	andcc	%i4,	0x018C,	%l2
	fone	%f14
	save %l6, %i0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	0x17A8,	%i3
	pdist	%f22,	%f10,	%f12
	umul	%i5,	0x0DB8,	%i7
	st	%f7,	[%l7 + 0x34]
	edge16l	%o1,	%g4,	%l4
	sdivcc	%l0,	0x0CD6,	%l5
	alignaddr	%g1,	%g2,	%g6
	movrgz	%l1,	0x395,	%o6
	array8	%o0,	%g5,	%g3
	fmovdneg	%icc,	%f5,	%f29
	fnor	%f8,	%f28,	%f18
	fcmps	%fcc3,	%f1,	%f16
	fmovsn	%xcc,	%f15,	%f4
	sdivx	%o4,	0x1F0F,	%g7
	mova	%icc,	%o3,	%i6
	ld	[%l7 + 0x5C],	%f1
	addcc	%l3,	%o5,	%i2
	movn	%xcc,	%i1,	%i4
	movrgez	%l6,	0x2E3,	%i0
	smulcc	%o2,	%l2,	%i3
	movleu	%icc,	%o7,	%i7
	edge16n	%i5,	%g4,	%l4
	movcc	%icc,	%o1,	%l0
	for	%f24,	%f30,	%f22
	edge16ln	%l5,	%g1,	%g6
	movne	%icc,	%g2,	%l1
	edge8n	%o0,	%g5,	%g3
	edge8ln	%o4,	%o6,	%o3
	ldd	[%l7 + 0x68],	%i6
	stw	%l3,	[%l7 + 0x30]
	udivcc	%o5,	0x07C7,	%i2
	stb	%i1,	[%l7 + 0x68]
	movpos	%xcc,	%g7,	%i4
	movg	%icc,	%i0,	%l6
	fmovdgu	%icc,	%f11,	%f0
	fcmpgt16	%f24,	%f30,	%o2
	fcmple16	%f10,	%f14,	%l2
	stw	%i3,	[%l7 + 0x6C]
	addc	%i7,	0x0CA6,	%i5
	ldub	[%l7 + 0x31],	%g4
	fcmpeq16	%f28,	%f18,	%o7
	movn	%xcc,	%o1,	%l4
	fnor	%f28,	%f20,	%f10
	sll	%l0,	%g1,	%g6
	ldd	[%l7 + 0x50],	%g2
	xnorcc	%l1,	0x1F9D,	%o0
	ldd	[%l7 + 0x70],	%g4
	alignaddrl	%g3,	%l5,	%o4
	fmul8ulx16	%f26,	%f4,	%f0
	fandnot2	%f6,	%f18,	%f4
	udivcc	%o6,	0x0D78,	%o3
	edge16ln	%l3,	%i6,	%i2
	fpadd16	%f6,	%f4,	%f28
	siam	0x3
	ldd	[%l7 + 0x50],	%f16
	sub	%o5,	%i1,	%i4
	sethi	0x120E,	%i0
	umul	%g7,	%o2,	%l2
	fornot1	%f6,	%f4,	%f2
	ldd	[%l7 + 0x30],	%f26
	edge16l	%l6,	%i7,	%i5
	fmovdcc	%xcc,	%f27,	%f13
	fmovsn	%xcc,	%f31,	%f3
	umulcc	%g4,	0x07B6,	%o7
	movrlz	%i3,	0x32B,	%l4
	xorcc	%o1,	%l0,	%g6
	addcc	%g1,	%g2,	%l1
	fmovd	%f8,	%f22
	mulscc	%g5,	0x0048,	%g3
	sdivx	%l5,	0x0955,	%o0
	sll	%o4,	%o6,	%l3
	umul	%i6,	%o3,	%o5
	movgu	%xcc,	%i2,	%i1
	lduw	[%l7 + 0x08],	%i4
	andcc	%g7,	0x1CDC,	%i0
	edge16l	%l2,	%l6,	%o2
	srax	%i7,	%g4,	%o7
	andcc	%i5,	%i3,	%l4
	movleu	%icc,	%o1,	%l0
	faligndata	%f28,	%f4,	%f24
	st	%f17,	[%l7 + 0x50]
	subccc	%g6,	%g2,	%l1
	fcmple16	%f14,	%f10,	%g1
	movle	%xcc,	%g3,	%l5
	addc	%o0,	%g5,	%o4
	movg	%icc,	%o6,	%l3
	movn	%xcc,	%o3,	%o5
	fandnot2	%f26,	%f4,	%f10
	ld	[%l7 + 0x1C],	%f25
	fornot2s	%f5,	%f16,	%f5
	andcc	%i6,	0x1F3B,	%i2
	fmovsvs	%xcc,	%f5,	%f1
	sethi	0x0984,	%i1
	movne	%xcc,	%g7,	%i0
	fcmple16	%f30,	%f0,	%l2
	fmovdl	%xcc,	%f25,	%f2
	fnot2	%f20,	%f24
	add	%i4,	%l6,	%o2
	stb	%g4,	[%l7 + 0x2D]
	ldsb	[%l7 + 0x79],	%o7
	edge16	%i7,	%i5,	%i3
	alignaddrl	%o1,	%l0,	%l4
	addccc	%g2,	0x0731,	%g6
	fmovde	%xcc,	%f26,	%f21
	movrlz	%l1,	0x28A,	%g3
	fandnot1s	%f22,	%f13,	%f17
	sub	%g1,	%l5,	%g5
	mulscc	%o0,	%o6,	%l3
	edge32ln	%o4,	%o3,	%i6
	subccc	%i2,	0x0D7F,	%o5
	andn	%g7,	%i1,	%l2
	umul	%i4,	0x09CC,	%l6
	fmovsa	%icc,	%f23,	%f22
	stw	%o2,	[%l7 + 0x3C]
	movre	%i0,	0x2EF,	%g4
	movgu	%xcc,	%i7,	%i5
	fcmpeq32	%f10,	%f10,	%i3
	fmovdl	%icc,	%f12,	%f18
	fmovs	%f0,	%f4
	udiv	%o7,	0x02B6,	%o1
	ldd	[%l7 + 0x58],	%f30
	fmovdvs	%icc,	%f10,	%f17
	srl	%l0,	%l4,	%g6
	smul	%l1,	0x1877,	%g2
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	sir	0x0488
	movrne	%o0,	%o6,	%l3
	addc	%g1,	%o3,	%i6
	srl	%i2,	%o4,	%g7
	move	%icc,	%o5,	%l2
	edge8ln	%i1,	%l6,	%o2
	fmovsl	%xcc,	%f19,	%f15
	edge16l	%i0,	%g4,	%i4
	addccc	%i7,	0x0A03,	%i3
	fmovdneg	%icc,	%f23,	%f28
	sdivcc	%i5,	0x1680,	%o1
	movge	%icc,	%o7,	%l4
	movvs	%icc,	%g6,	%l1
	orn	%g2,	%g3,	%l5
	xnorcc	%l0,	%o0,	%o6
	subc	%l3,	%g1,	%g5
	movrgez	%i6,	%o3,	%i2
	array8	%g7,	%o5,	%o4
	fnor	%f8,	%f0,	%f28
	edge8n	%l2,	%i1,	%l6
	umulcc	%o2,	%g4,	%i4
	edge16n	%i0,	%i3,	%i5
	array8	%o1,	%i7,	%l4
	fmovsg	%icc,	%f24,	%f0
	movn	%xcc,	%o7,	%g6
	edge32l	%g2,	%l1,	%g3
	mulx	%l5,	0x0B0B,	%o0
	sdiv	%l0,	0x0E68,	%o6
	sdiv	%l3,	0x0448,	%g1
	mova	%xcc,	%g5,	%i6
	subcc	%o3,	%g7,	%i2
	edge16ln	%o4,	%o5,	%i1
	st	%f29,	[%l7 + 0x70]
	orncc	%l6,	0x0B69,	%o2
	sir	0x089F
	fmul8ulx16	%f22,	%f18,	%f30
	movle	%icc,	%l2,	%g4
	movre	%i4,	0x326,	%i3
	sra	%i0,	0x06,	%o1
	lduw	[%l7 + 0x18],	%i5
	fnot1s	%f22,	%f15
	array32	%i7,	%o7,	%g6
	sir	0x1203
	array16	%l4,	%g2,	%g3
	xor	%l1,	0x132B,	%l5
	edge16ln	%l0,	%o0,	%o6
	smulcc	%l3,	%g5,	%i6
	stb	%g1,	[%l7 + 0x78]
	sdivcc	%o3,	0x1F4F,	%i2
	movleu	%icc,	%g7,	%o4
	andncc	%o5,	%l6,	%i1
	movneg	%xcc,	%l2,	%g4
	umulcc	%i4,	0x0CD3,	%i3
	sllx	%o2,	0x0E,	%i0
	addccc	%o1,	0x1B16,	%i7
	smul	%i5,	%o7,	%g6
	array8	%g2,	%g3,	%l1
	move	%xcc,	%l4,	%l5
	edge16ln	%l0,	%o6,	%o0
	sethi	0x1E18,	%g5
	edge16n	%i6,	%l3,	%g1
	stb	%i2,	[%l7 + 0x46]
	movne	%icc,	%o3,	%o4
	fcmple16	%f30,	%f2,	%g7
	fcmpeq32	%f16,	%f18,	%l6
	movneg	%xcc,	%i1,	%o5
	movrgz	%l2,	%i4,	%i3
	movrlz	%g4,	%o2,	%o1
	fnot2s	%f16,	%f18
	sub	%i7,	%i5,	%i0
	fmovrslz	%o7,	%f6,	%f20
	xnor	%g6,	0x01E2,	%g3
	movgu	%xcc,	%g2,	%l1
	andcc	%l4,	0x084C,	%l5
	edge16l	%o6,	%l0,	%g5
	popc	%i6,	%o0
	alignaddrl	%g1,	%i2,	%l3
	edge8n	%o3,	%g7,	%l6
	fmovdle	%xcc,	%f20,	%f23
	fmul8x16	%f12,	%f12,	%f12
	fnegs	%f21,	%f28
	lduw	[%l7 + 0x20],	%i1
	andcc	%o4,	0x0C9C,	%l2
	alignaddr	%i4,	%o5,	%i3
	edge8ln	%g4,	%o1,	%i7
	sth	%i5,	[%l7 + 0x18]
	stx	%o2,	[%l7 + 0x60]
	subccc	%i0,	%o7,	%g6
	fnors	%f27,	%f11,	%f23
	or	%g3,	0x136D,	%g2
	sdivcc	%l1,	0x0B4A,	%l5
	or	%l4,	0x1027,	%o6
	movrlz	%l0,	0x286,	%i6
	array16	%o0,	%g1,	%i2
	alignaddrl	%l3,	%g5,	%g7
	edge16	%o3,	%i1,	%o4
	add	%l2,	%i4,	%o5
	orcc	%i3,	%g4,	%o1
	stb	%l6,	[%l7 + 0x1B]
	xorcc	%i5,	%o2,	%i7
	fornot1	%f10,	%f26,	%f26
	std	%f8,	[%l7 + 0x40]
	fsrc1s	%f18,	%f10
	lduh	[%l7 + 0x76],	%i0
	stb	%o7,	[%l7 + 0x76]
	subc	%g6,	0x136E,	%g2
	movre	%l1,	0x3DC,	%l5
	fmovsa	%xcc,	%f17,	%f9
	sdivcc	%l4,	0x0954,	%o6
	orcc	%g3,	0x06AC,	%l0
	ldd	[%l7 + 0x48],	%i6
	andncc	%o0,	%g1,	%i2
	movre	%l3,	0x208,	%g7
	edge8n	%g5,	%o3,	%o4
	ld	[%l7 + 0x08],	%f28
	stx	%i1,	[%l7 + 0x60]
	subcc	%l2,	0x0F4F,	%i4
	or	%o5,	0x1EFA,	%i3
	sth	%o1,	[%l7 + 0x6E]
	fandnot1s	%f12,	%f27,	%f9
	srl	%l6,	%g4,	%i5
	ldd	[%l7 + 0x28],	%o2
	movleu	%xcc,	%i0,	%i7
	edge32l	%g6,	%g2,	%o7
	srlx	%l1,	%l4,	%l5
	udivx	%g3,	0x16BD,	%l0
	orn	%o6,	%o0,	%g1
	stx	%i6,	[%l7 + 0x78]
	edge16n	%i2,	%l3,	%g7
	fmovdneg	%xcc,	%f2,	%f21
	ldd	[%l7 + 0x68],	%o2
	fpsub32	%f8,	%f14,	%f10
	ld	[%l7 + 0x2C],	%f4
	ldd	[%l7 + 0x60],	%f10
	edge16n	%g5,	%o4,	%i1
	edge16ln	%i4,	%o5,	%i3
	andcc	%l2,	0x168E,	%l6
	edge32ln	%g4,	%o1,	%o2
	edge8	%i0,	%i5,	%i7
	sth	%g6,	[%l7 + 0x48]
	ldx	[%l7 + 0x30],	%g2
	fmovsleu	%icc,	%f19,	%f21
	udiv	%o7,	0x177C,	%l4
	and	%l1,	0x1471,	%g3
	fmovdneg	%xcc,	%f22,	%f25
	movcc	%icc,	%l0,	%l5
	xnor	%o6,	%o0,	%g1
	mova	%icc,	%i2,	%i6
	ldsh	[%l7 + 0x4E],	%g7
	ldsh	[%l7 + 0x36],	%o3
	fxors	%f4,	%f16,	%f5
	lduw	[%l7 + 0x38],	%l3
	fabss	%f16,	%f7
	array16	%g5,	%i1,	%o4
	fmovdleu	%xcc,	%f0,	%f14
	andn	%o5,	%i4,	%i3
	movgu	%xcc,	%l6,	%l2
	alignaddr	%g4,	%o1,	%i0
	movvs	%xcc,	%i5,	%i7
	addccc	%o2,	0x0970,	%g2
	fmovdcc	%icc,	%f21,	%f5
	xorcc	%g6,	%o7,	%l4
	movl	%xcc,	%g3,	%l1
	array8	%l5,	%l0,	%o0
	fnot2s	%f22,	%f27
	add	%g1,	0x0FF7,	%i2
	andncc	%o6,	%i6,	%g7
	for	%f6,	%f16,	%f2
	srax	%l3,	%g5,	%i1
	fpmerge	%f29,	%f26,	%f12
	fmovs	%f2,	%f13
	stx	%o4,	[%l7 + 0x68]
	sub	%o3,	0x17F2,	%o5
	fnors	%f31,	%f13,	%f13
	edge16	%i3,	%l6,	%l2
	movg	%xcc,	%i4,	%o1
	movcc	%icc,	%g4,	%i0
	ldx	[%l7 + 0x48],	%i5
	stb	%o2,	[%l7 + 0x5D]
	andn	%i7,	0x1DBC,	%g6
	srax	%g2,	0x1F,	%o7
	orn	%l4,	%l1,	%l5
	ldd	[%l7 + 0x78],	%l0
	fsrc1s	%f16,	%f12
	movcc	%xcc,	%g3,	%o0
	movg	%icc,	%i2,	%g1
	edge16	%o6,	%g7,	%i6
	save %l3, 0x1783, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o4,	0x0797,	%i1
	movle	%xcc,	%o5,	%o3
	edge16l	%l6,	%l2,	%i4
	stb	%i3,	[%l7 + 0x7B]
	mulx	%g4,	0x07C8,	%o1
	smul	%i5,	%o2,	%i0
	edge32	%g6,	%i7,	%o7
	fabss	%f23,	%f21
	faligndata	%f16,	%f14,	%f8
	ldsw	[%l7 + 0x18],	%l4
	umul	%l1,	%l5,	%g2
	movrlz	%g3,	0x0D3,	%o0
	fmovsneg	%xcc,	%f14,	%f24
	xor	%l0,	%g1,	%o6
	edge16l	%i2,	%g7,	%i6
	subc	%g5,	%l3,	%i1
	movgu	%icc,	%o4,	%o5
	movn	%xcc,	%o3,	%l2
	fmul8sux16	%f16,	%f0,	%f20
	edge8n	%l6,	%i3,	%g4
	andn	%i4,	0x04F5,	%o1
	fcmpeq16	%f20,	%f4,	%i5
	st	%f18,	[%l7 + 0x4C]
	movcc	%xcc,	%i0,	%g6
	restore %i7, %o2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l1,	0x17BA,	%o7
	sethi	0x11B7,	%g2
	fcmple32	%f2,	%f30,	%g3
	srl	%o0,	%l0,	%l5
	edge32n	%g1,	%o6,	%g7
	smulcc	%i6,	0x0513,	%i2
	movcs	%icc,	%g5,	%l3
	movrgez	%o4,	0x38B,	%i1
	andncc	%o3,	%l2,	%o5
	addc	%l6,	0x199D,	%i3
	edge8	%i4,	%o1,	%g4
	movcc	%icc,	%i5,	%i0
	edge8	%i7,	%o2,	%l4
	fxor	%f28,	%f8,	%f4
	stw	%g6,	[%l7 + 0x5C]
	fands	%f22,	%f15,	%f4
	movre	%l1,	%g2,	%g3
	ldsb	[%l7 + 0x27],	%o0
	edge8	%o7,	%l5,	%g1
	orcc	%l0,	0x1262,	%g7
	fnot1s	%f22,	%f16
	fornot1s	%f31,	%f14,	%f23
	edge32n	%i6,	%i2,	%g5
	fnot2s	%f13,	%f3
	movvs	%icc,	%o6,	%o4
	fnot1s	%f28,	%f7
	movleu	%xcc,	%i1,	%o3
	xorcc	%l2,	%l3,	%l6
	movne	%icc,	%i3,	%i4
	edge32	%o1,	%o5,	%g4
	smul	%i5,	%i7,	%o2
	fcmps	%fcc0,	%f20,	%f5
	orncc	%i0,	0x00AC,	%g6
	std	%f12,	[%l7 + 0x60]
	addccc	%l4,	%g2,	%g3
	subcc	%l1,	%o7,	%l5
	std	%f2,	[%l7 + 0x10]
	alignaddrl	%o0,	%g1,	%l0
	udiv	%i6,	0x1A4E,	%g7
	lduh	[%l7 + 0x2A],	%g5
	fnot1s	%f26,	%f18
	movle	%xcc,	%i2,	%o4
	movvs	%xcc,	%i1,	%o3
	fmovsvc	%xcc,	%f7,	%f18
	xor	%l2,	0x13D4,	%l3
	movrlez	%l6,	%i3,	%o6
	fmovsg	%xcc,	%f19,	%f11
	edge32ln	%i4,	%o1,	%g4
	edge16n	%o5,	%i5,	%i7
	ldsw	[%l7 + 0x5C],	%i0
	movvc	%xcc,	%g6,	%l4
	movrlz	%o2,	%g2,	%g3
	fpsub16s	%f12,	%f18,	%f0
	ldsb	[%l7 + 0x31],	%l1
	xorcc	%l5,	0x1AB2,	%o0
	subc	%o7,	%l0,	%i6
	movl	%icc,	%g7,	%g5
	movrgez	%i2,	0x1EA,	%o4
	movle	%icc,	%g1,	%i1
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	sub	%l6,	0x1714,	%l3
	sethi	0x0429,	%o6
	edge32ln	%i3,	%o1,	%i4
	fcmpne32	%f28,	%f22,	%o5
	array32	%i5,	%i7,	%i0
	movge	%xcc,	%g4,	%g6
	std	%f16,	[%l7 + 0x20]
	xorcc	%o2,	0x0BB4,	%l4
	mulscc	%g2,	0x0C26,	%l1
	edge16n	%g3,	%l5,	%o0
	edge16	%l0,	%o7,	%i6
	subcc	%g7,	%g5,	%i2
	edge32ln	%o4,	%i1,	%g1
	fpack32	%f6,	%f6,	%f10
	movpos	%xcc,	%l2,	%o3
	save %l6, 0x0C1D, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1A2B
	edge16	%i3,	%o1,	%i4
	move	%icc,	%o5,	%l3
	fmovsvs	%icc,	%f8,	%f31
	movneg	%xcc,	%i7,	%i0
	udiv	%g4,	0x0759,	%g6
	movpos	%icc,	%o2,	%l4
	edge32n	%i5,	%g2,	%l1
	popc	%l5,	%g3
	sll	%o0,	0x11,	%o7
	fcmpeq16	%f26,	%f6,	%l0
	fcmpeq16	%f22,	%f12,	%i6
	array32	%g5,	%i2,	%o4
	sll	%g7,	%g1,	%i1
	fmovdn	%xcc,	%f20,	%f7
	fmovrdlz	%l2,	%f20,	%f2
	fmovsneg	%icc,	%f30,	%f17
	subccc	%l6,	%o3,	%o6
	sllx	%i3,	%i4,	%o5
	movcs	%xcc,	%l3,	%o1
	fpadd16s	%f2,	%f18,	%f9
	edge16ln	%i0,	%g4,	%i7
	movrne	%o2,	%l4,	%g6
	edge32l	%i5,	%g2,	%l5
	sllx	%l1,	%g3,	%o7
	or	%o0,	0x110C,	%i6
	fpadd32	%f18,	%f4,	%f26
	xor	%g5,	%i2,	%o4
	fnor	%f2,	%f20,	%f22
	save %g7, %l0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l2,	0x1121,	%l6
	std	%f2,	[%l7 + 0x10]
	movre	%o3,	%o6,	%i1
	restore %i4, %o5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x60],	%o1
	umul	%i3,	0x1275,	%g4
	edge8	%i0,	%i7,	%o2
	fmul8x16au	%f6,	%f11,	%f2
	movvs	%icc,	%l4,	%g6
	edge8n	%i5,	%l5,	%g2
	fmovsne	%icc,	%f17,	%f14
	smulcc	%g3,	0x134E,	%l1
	ldx	[%l7 + 0x30],	%o0
	fmovs	%f7,	%f23
	umulcc	%i6,	0x1CE3,	%o7
	edge16n	%g5,	%i2,	%o4
	fmovspos	%icc,	%f24,	%f16
	fexpand	%f27,	%f28
	edge32n	%l0,	%g7,	%g1
	add	%l6,	0x0B08,	%o3
	ldsb	[%l7 + 0x24],	%o6
	movg	%xcc,	%l2,	%i4
	fpsub32s	%f10,	%f23,	%f15
	ldx	[%l7 + 0x28],	%o5
	st	%f30,	[%l7 + 0x5C]
	subcc	%i1,	0x13B0,	%l3
	movrlz	%i3,	%o1,	%i0
	mulx	%g4,	%i7,	%o2
	edge16n	%g6,	%i5,	%l5
	udivx	%g2,	0x1159,	%l4
	subc	%l1,	%g3,	%i6
	sth	%o7,	[%l7 + 0x30]
	fxnors	%f11,	%f7,	%f16
	movcc	%xcc,	%g5,	%i2
	movl	%xcc,	%o4,	%l0
	orcc	%g7,	0x17E3,	%o0
	ldx	[%l7 + 0x70],	%g1
	mulscc	%o3,	%o6,	%l2
	ldd	[%l7 + 0x78],	%f18
	stw	%l6,	[%l7 + 0x14]
	fcmpeq32	%f24,	%f30,	%o5
	fpadd32s	%f16,	%f20,	%f21
	sth	%i1,	[%l7 + 0x7C]
	edge16ln	%i4,	%l3,	%o1
	ldub	[%l7 + 0x77],	%i0
	ldd	[%l7 + 0x50],	%i2
	fmovrdne	%i7,	%f12,	%f10
	edge16	%g4,	%g6,	%i5
	fnand	%f8,	%f10,	%f16
	fnands	%f5,	%f20,	%f21
	fandnot2s	%f25,	%f23,	%f0
	popc	%l5,	%g2
	edge32l	%l4,	%o2,	%g3
	st	%f26,	[%l7 + 0x60]
	array16	%l1,	%o7,	%g5
	movneg	%icc,	%i6,	%i2
	stw	%o4,	[%l7 + 0x5C]
	std	%f10,	[%l7 + 0x10]
	udivx	%l0,	0x03D9,	%g7
	umul	%o0,	%g1,	%o3
	array8	%l2,	%l6,	%o6
	movrgez	%i1,	%i4,	%o5
	fcmpes	%fcc1,	%f21,	%f26
	alignaddr	%o1,	%l3,	%i0
	fands	%f4,	%f14,	%f16
	edge32ln	%i7,	%g4,	%g6
	movleu	%xcc,	%i3,	%i5
	stx	%g2,	[%l7 + 0x30]
	movvs	%icc,	%l5,	%l4
	umulcc	%o2,	%g3,	%l1
	edge8l	%g5,	%i6,	%o7
	movle	%xcc,	%i2,	%l0
	edge32ln	%g7,	%o0,	%g1
	edge32	%o3,	%l2,	%o4
	sdivcc	%l6,	0x0F9D,	%o6
	sdivcc	%i1,	0x106F,	%i4
	fmovrsgez	%o5,	%f17,	%f28
	lduw	[%l7 + 0x40],	%l3
	orn	%i0,	0x0712,	%o1
	ldsw	[%l7 + 0x4C],	%i7
	array16	%g6,	%i3,	%g4
	or	%i5,	%g2,	%l4
	srl	%o2,	%g3,	%l1
	orcc	%l5,	%g5,	%i6
	edge8l	%o7,	%l0,	%g7
	fcmpd	%fcc1,	%f4,	%f8
	edge16n	%o0,	%g1,	%i2
	fcmps	%fcc2,	%f3,	%f4
	edge16n	%o3,	%l2,	%o4
	umulcc	%o6,	%i1,	%l6
	movge	%icc,	%i4,	%l3
	udivcc	%i0,	0x100F,	%o5
	sdivcc	%i7,	0x046E,	%g6
	ld	[%l7 + 0x10],	%f15
	stw	%i3,	[%l7 + 0x30]
	fmovsn	%icc,	%f23,	%f1
	umulcc	%o1,	0x0109,	%i5
	orcc	%g4,	%l4,	%o2
	siam	0x4
	movrne	%g3,	%g2,	%l1
	xor	%g5,	0x0180,	%i6
	edge32n	%o7,	%l5,	%l0
	sdivx	%g7,	0x1CFB,	%o0
	save %g1, %o3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i2,	%o4,	%i1
	alignaddrl	%l6,	%o6,	%i4
	fmovsn	%xcc,	%f21,	%f23
	edge16n	%l3,	%i0,	%o5
	smulcc	%g6,	0x1738,	%i3
	sdivcc	%o1,	0x0D2C,	%i5
	ldd	[%l7 + 0x08],	%i6
	nop
	set	0x70, %i6
	lduw	[%l7 + %i6],	%g4
	for	%f20,	%f26,	%f6
	st	%f24,	[%l7 + 0x78]
	xorcc	%o2,	%g3,	%g2
	alignaddr	%l1,	%l4,	%i6
	fmovdgu	%icc,	%f1,	%f17
	mulscc	%g5,	0x161E,	%o7
	sethi	0x1B01,	%l5
	smul	%l0,	%g7,	%o0
	smul	%g1,	0x1C4A,	%l2
	edge32ln	%i2,	%o4,	%i1
	fmovsleu	%xcc,	%f12,	%f5
	movrne	%o3,	%o6,	%l6
	stb	%l3,	[%l7 + 0x75]
	udiv	%i0,	0x1CD6,	%i4
	udivcc	%o5,	0x0265,	%i3
	movrgez	%o1,	0x295,	%g6
	smulcc	%i7,	%g4,	%o2
	fnot1	%f22,	%f2
	ldd	[%l7 + 0x50],	%i4
	subc	%g2,	0x14F1,	%l1
	edge32l	%l4,	%g3,	%g5
	sll	%i6,	0x0A,	%o7
	orcc	%l0,	%g7,	%o0
	addcc	%l5,	%g1,	%i2
	std	%f28,	[%l7 + 0x78]
	movn	%xcc,	%l2,	%i1
	save %o4, 0x0F4C, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f24,	%f14,	%f28
	ldd	[%l7 + 0x28],	%i6
	udivcc	%o3,	0x03D9,	%l3
	addcc	%i0,	%i4,	%i3
	add	%o1,	0x1FE8,	%g6
	movrne	%o5,	0x09E,	%i7
	sth	%g4,	[%l7 + 0x70]
	subcc	%i5,	%o2,	%g2
	umulcc	%l1,	%l4,	%g3
	add	%g5,	%o7,	%i6
	fxnor	%f4,	%f0,	%f26
	movcc	%icc,	%l0,	%g7
	xnor	%o0,	0x0652,	%l5
	fmovdne	%xcc,	%f6,	%f27
	or	%g1,	%i2,	%i1
	fpackfix	%f10,	%f11
	movre	%l2,	0x367,	%o4
	srlx	%l6,	%o6,	%o3
	edge32n	%i0,	%i4,	%i3
	fmovrslez	%l3,	%f2,	%f13
	sra	%g6,	%o1,	%o5
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f0
	edge8	%i7,	%g4,	%o2
	stb	%i5,	[%l7 + 0x12]
	lduw	[%l7 + 0x30],	%l1
	edge32l	%g2,	%l4,	%g5
	ldsb	[%l7 + 0x45],	%o7
	fcmpne16	%f16,	%f26,	%i6
	fmovrslz	%g3,	%f29,	%f6
	stw	%g7,	[%l7 + 0x24]
	addcc	%o0,	0x0B3E,	%l5
	fpackfix	%f16,	%f23
	subcc	%l0,	%g1,	%i2
	movne	%icc,	%l2,	%i1
	movg	%icc,	%l6,	%o6
	orcc	%o4,	0x1EE0,	%i0
	sdiv	%i4,	0x068D,	%i3
	andcc	%l3,	0x0C43,	%g6
	movrlz	%o3,	0x330,	%o5
	subc	%o1,	0x0DAB,	%i7
	sdivcc	%o2,	0x03BF,	%i5
	mulx	%g4,	%g2,	%l1
	fmovsne	%icc,	%f10,	%f28
	addccc	%g5,	%l4,	%i6
	fmovde	%icc,	%f25,	%f21
	edge16ln	%o7,	%g7,	%o0
	movrgez	%l5,	0x225,	%g3
	ldd	[%l7 + 0x60],	%g0
	movne	%icc,	%i2,	%l2
	fcmpne16	%f16,	%f2,	%l0
	subccc	%l6,	%o6,	%o4
	edge16n	%i1,	%i4,	%i3
	sethi	0x194A,	%l3
	addccc	%g6,	0x1A01,	%o3
	udivx	%o5,	0x15DF,	%i0
	movrlz	%o1,	%i7,	%i5
	sllx	%o2,	0x13,	%g2
	edge16	%l1,	%g4,	%g5
	fmul8x16	%f13,	%f18,	%f26
	array16	%i6,	%l4,	%o7
	xorcc	%g7,	0x0F40,	%o0
	fcmped	%fcc2,	%f22,	%f12
	movrlz	%g3,	%g1,	%i2
	fmovdcs	%xcc,	%f21,	%f3
	movrgz	%l5,	0x243,	%l2
	movne	%xcc,	%l0,	%l6
	udivcc	%o4,	0x178F,	%i1
	orn	%o6,	0x1480,	%i3
	srlx	%i4,	0x06,	%l3
	andcc	%o3,	0x0B55,	%g6
	edge16	%i0,	%o5,	%i7
	andncc	%i5,	%o2,	%o1
	fabsd	%f24,	%f8
	movcc	%xcc,	%l1,	%g4
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	srax	%l4,	%g5,	%g7
	nop
	set	0x11, %o6
	ldub	[%l7 + %o6],	%o0
	smul	%g3,	%o7,	%i2
	edge8n	%l5,	%g1,	%l2
	fmovrdlez	%l0,	%f10,	%f22
	addccc	%o4,	0x1D18,	%i1
	sra	%o6,	%i3,	%i4
	fpadd16s	%f18,	%f1,	%f2
	fpsub16s	%f29,	%f11,	%f3
	movrlz	%l6,	0x1AC,	%l3
	fmul8ulx16	%f22,	%f20,	%f22
	movg	%icc,	%o3,	%g6
	fmovsneg	%xcc,	%f14,	%f3
	fmovdneg	%xcc,	%f1,	%f30
	orcc	%i0,	0x09F4,	%o5
	fmovscc	%icc,	%f13,	%f31
	movre	%i7,	0x0FE,	%i5
	popc	%o1,	%l1
	alignaddrl	%g4,	%o2,	%g2
	ldsb	[%l7 + 0x34],	%l4
	fornot1	%f8,	%f28,	%f14
	array32	%i6,	%g5,	%g7
	array8	%o0,	%g3,	%i2
	edge8	%o7,	%l5,	%l2
	sdiv	%g1,	0x067E,	%o4
	fmovsgu	%icc,	%f30,	%f27
	fmovdge	%xcc,	%f23,	%f4
	popc	0x1FB9,	%i1
	movrne	%o6,	%i3,	%l0
	movneg	%icc,	%l6,	%l3
	fmovsvs	%icc,	%f24,	%f5
	sub	%o3,	0x1880,	%g6
	fcmpeq32	%f4,	%f2,	%i4
	srlx	%o5,	0x0D,	%i7
	fornot1	%f4,	%f30,	%f18
	restore %i0, 0x09C0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l1,	%g4
	mulscc	%o2,	%i5,	%l4
	andncc	%g2,	%i6,	%g5
	fmovsne	%icc,	%f18,	%f26
	mulscc	%o0,	0x17BB,	%g7
	fzero	%f10
	ldub	[%l7 + 0x40],	%g3
	add	%i2,	0x0514,	%l5
	fpadd32s	%f24,	%f2,	%f16
	edge16l	%o7,	%g1,	%o4
	array16	%i1,	%l2,	%o6
	fsrc2	%f26,	%f14
	andcc	%l0,	0x126B,	%l6
	movre	%l3,	0x255,	%i3
	xor	%o3,	%g6,	%o5
	movpos	%icc,	%i7,	%i4
	orn	%i0,	0x1B22,	%o1
	movrgez	%l1,	0x0DD,	%g4
	lduw	[%l7 + 0x34],	%o2
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	st	%f20,	[%l7 + 0x70]
	fpadd32s	%f30,	%f24,	%f5
	fnot1	%f22,	%f22
	movrlz	%i6,	%g2,	%g5
	fandnot2s	%f10,	%f23,	%f26
	ldsb	[%l7 + 0x73],	%g7
	ldub	[%l7 + 0x5C],	%o0
	array32	%g3,	%i2,	%l5
	movgu	%icc,	%o7,	%g1
	st	%f3,	[%l7 + 0x58]
	srax	%o4,	0x18,	%l2
	st	%f30,	[%l7 + 0x14]
	srlx	%i1,	%l0,	%l6
	addccc	%l3,	%o6,	%o3
	srlx	%i3,	0x1A,	%o5
	sdivcc	%g6,	0x181F,	%i7
	addccc	%i4,	0x0F99,	%i0
	array32	%l1,	%g4,	%o2
	ldsb	[%l7 + 0x48],	%l4
	movl	%xcc,	%o1,	%i6
	xnorcc	%g2,	0x0FDA,	%i5
	fors	%f6,	%f14,	%f22
	xnorcc	%g5,	%o0,	%g3
	fnegd	%f8,	%f4
	ldsw	[%l7 + 0x2C],	%i2
	movneg	%xcc,	%l5,	%o7
	umul	%g1,	%g7,	%o4
	st	%f25,	[%l7 + 0x60]
	xnorcc	%l2,	%l0,	%l6
	movl	%xcc,	%l3,	%i1
	edge32	%o3,	%o6,	%o5
	std	%f14,	[%l7 + 0x20]
	movrlz	%g6,	%i7,	%i3
	umul	%i0,	%l1,	%g4
	movle	%xcc,	%i4,	%o2
	fmovscc	%icc,	%f16,	%f11
	sllx	%l4,	%o1,	%i6
	sllx	%i5,	0x10,	%g5
	save %g2, %o0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g3,	%o7,	%l5
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f18
	lduh	[%l7 + 0x70],	%g1
	fcmpne32	%f10,	%f28,	%g7
	fxors	%f13,	%f23,	%f18
	lduw	[%l7 + 0x2C],	%o4
	fones	%f26
	alignaddrl	%l2,	%l0,	%l3
	movrgez	%l6,	%o3,	%i1
	edge8ln	%o5,	%o6,	%g6
	std	%f30,	[%l7 + 0x50]
	fandnot2s	%f6,	%f14,	%f24
	movcc	%xcc,	%i3,	%i7
	popc	%l1,	%i0
	array8	%g4,	%i4,	%o2
	movgu	%xcc,	%l4,	%o1
	array16	%i6,	%g5,	%i5
	movvc	%xcc,	%o0,	%g2
	ldsw	[%l7 + 0x40],	%g3
	edge16l	%i2,	%o7,	%g1
	edge32l	%l5,	%o4,	%g7
	mulscc	%l0,	0x14E6,	%l3
	nop
	set	0x0A, %i1
	sth	%l6,	[%l7 + %i1]
	movleu	%xcc,	%o3,	%l2
	movrne	%o5,	0x01D,	%o6
	srlx	%i1,	0x08,	%g6
	restore %i7, %l1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g4,	%i4
	fandnot1s	%f18,	%f12,	%f10
	stx	%i0,	[%l7 + 0x38]
	mulscc	%l4,	0x10CF,	%o1
	udivcc	%o2,	0x105C,	%g5
	ldx	[%l7 + 0x70],	%i6
	ldsb	[%l7 + 0x42],	%o0
	mulx	%g2,	%i5,	%i2
	fmovdle	%xcc,	%f4,	%f26
	xor	%o7,	0x148D,	%g1
	ldsb	[%l7 + 0x57],	%l5
	fcmpeq32	%f10,	%f12,	%g3
	fmul8x16au	%f18,	%f19,	%f2
	std	%f12,	[%l7 + 0x70]
	st	%f6,	[%l7 + 0x08]
	edge32	%o4,	%g7,	%l0
	bshuffle	%f12,	%f20,	%f6
	ldsb	[%l7 + 0x78],	%l6
	movl	%xcc,	%o3,	%l2
	fmovrdlz	%l3,	%f22,	%f28
	movcs	%icc,	%o5,	%i1
	sir	0x0D71
	orncc	%g6,	0x0CBE,	%o6
	udivcc	%l1,	0x12F0,	%i3
	fmovrdlez	%i7,	%f16,	%f24
	nop
	set	0x08, %g1
	sth	%g4,	[%l7 + %g1]
	fpadd16	%f0,	%f10,	%f14
	udiv	%i0,	0x10C5,	%l4
	ld	[%l7 + 0x24],	%f23
	movcc	%icc,	%o1,	%o2
	movge	%xcc,	%g5,	%i4
	orncc	%i6,	0x0222,	%g2
	edge8l	%i5,	%o0,	%o7
	fmovsgu	%xcc,	%f31,	%f21
	fmovdneg	%icc,	%f22,	%f25
	movrlz	%i2,	0x3AE,	%g1
	edge16l	%g3,	%o4,	%g7
	bshuffle	%f16,	%f28,	%f8
	movneg	%xcc,	%l5,	%l0
	fmovdne	%xcc,	%f22,	%f3
	fsrc2s	%f8,	%f10
	movrgez	%l6,	0x355,	%o3
	fmovsn	%xcc,	%f18,	%f26
	add	%l3,	0x08FD,	%l2
	fpsub16	%f18,	%f8,	%f16
	fmovrse	%o5,	%f11,	%f1
	alignaddrl	%i1,	%g6,	%l1
	movcc	%xcc,	%i3,	%i7
	fmovsg	%xcc,	%f15,	%f28
	sra	%g4,	%i0,	%l4
	fcmped	%fcc0,	%f2,	%f14
	edge8ln	%o1,	%o2,	%g5
	movle	%icc,	%o6,	%i4
	fmovscs	%icc,	%f2,	%f11
	movl	%icc,	%g2,	%i6
	faligndata	%f24,	%f10,	%f20
	fnands	%f1,	%f18,	%f5
	umulcc	%i5,	0x1BE6,	%o0
	mova	%xcc,	%o7,	%i2
	edge8l	%g3,	%g1,	%o4
	alignaddrl	%g7,	%l0,	%l5
	fmovrde	%l6,	%f4,	%f10
	stx	%o3,	[%l7 + 0x60]
	fmovdcs	%xcc,	%f23,	%f11
	udivx	%l2,	0x0B9C,	%o5
	edge16l	%i1,	%g6,	%l3
	fxors	%f28,	%f6,	%f23
	fpadd32	%f0,	%f20,	%f28
	sethi	0x0485,	%i3
	edge16	%l1,	%i7,	%i0
	movrlez	%g4,	%l4,	%o1
	array8	%o2,	%o6,	%g5
	edge16n	%i4,	%i6,	%i5
	subcc	%g2,	%o0,	%i2
	movpos	%xcc,	%g3,	%o7
	fzeros	%f17
	fornot1	%f8,	%f16,	%f22
	edge16ln	%o4,	%g7,	%l0
	fmovrslez	%l5,	%f5,	%f29
	fmovsa	%xcc,	%f18,	%f18
	edge16n	%g1,	%l6,	%l2
	fmovrslez	%o3,	%f16,	%f0
	popc	%o5,	%i1
	mulscc	%g6,	%l3,	%i3
	edge32n	%i7,	%l1,	%i0
	movpos	%icc,	%g4,	%l4
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%o0
	movgu	%xcc,	%o2,	%g5
	fmul8ulx16	%f20,	%f26,	%f16
	fabsd	%f8,	%f30
	srl	%i4,	0x09,	%o6
	movrne	%i6,	0x0F9,	%g2
	mova	%xcc,	%i5,	%o0
	edge16n	%i2,	%o7,	%o4
	fmovsn	%xcc,	%f24,	%f10
	fpmerge	%f6,	%f2,	%f14
	movn	%xcc,	%g3,	%l0
	sllx	%g7,	0x14,	%l5
	xnorcc	%l6,	0x186C,	%l2
	orcc	%o3,	0x1F72,	%o5
	fmuld8ulx16	%f23,	%f26,	%f22
	stb	%i1,	[%l7 + 0x11]
	fornot2	%f20,	%f18,	%f10
	umulcc	%g1,	0x1239,	%l3
	edge32n	%g6,	%i7,	%i3
	orn	%l1,	0x0758,	%i0
	sth	%l4,	[%l7 + 0x66]
	umulcc	%o1,	%o2,	%g4
	fxnors	%f7,	%f29,	%f0
	udiv	%g5,	0x00AA,	%o6
	sub	%i4,	0x1E08,	%i6
	array32	%i5,	%o0,	%g2
	edge8l	%o7,	%o4,	%i2
	fandnot2s	%f0,	%f2,	%f17
	sdiv	%g3,	0x1B9E,	%g7
	fcmpgt32	%f30,	%f10,	%l5
	ldsh	[%l7 + 0x78],	%l0
	save %l6, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%i1,	%f29,	%f28
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%l2
	stb	%l3,	[%l7 + 0x1C]
	umul	%g1,	0x0CF8,	%g6
	bshuffle	%f16,	%f24,	%f20
	edge16n	%i7,	%l1,	%i3
	movvs	%xcc,	%l4,	%i0
	movrgz	%o1,	%g4,	%o2
	fmovsge	%icc,	%f1,	%f11
	movl	%xcc,	%g5,	%o6
	fmul8x16	%f30,	%f24,	%f4
	edge8n	%i4,	%i5,	%o0
	stw	%g2,	[%l7 + 0x38]
	udivx	%i6,	0x1A75,	%o4
	xorcc	%i2,	0x1CD4,	%o7
	st	%f22,	[%l7 + 0x3C]
	addcc	%g3,	%g7,	%l0
	sdivcc	%l5,	0x1018,	%o3
	subc	%l6,	0x0A7D,	%o5
	srax	%i1,	%l3,	%g1
	fmovsvc	%xcc,	%f15,	%f2
	sll	%l2,	%g6,	%i7
	subcc	%l1,	0x0A59,	%i3
	movcc	%icc,	%i0,	%l4
	xor	%o1,	%g4,	%g5
	nop
	set	0x53, %l4
	ldsb	[%l7 + %l4],	%o2
	fxnor	%f20,	%f20,	%f6
	fpackfix	%f20,	%f0
	movneg	%xcc,	%i4,	%i5
	movvc	%xcc,	%o6,	%o0
	addcc	%i6,	%g2,	%i2
	array16	%o4,	%o7,	%g7
	fsrc2	%f14,	%f8
	edge8l	%g3,	%l5,	%l0
	fmovrdne	%o3,	%f16,	%f8
	sethi	0x1F67,	%o5
	movpos	%icc,	%l6,	%i1
	edge32ln	%g1,	%l2,	%l3
	subcc	%g6,	0x06F0,	%l1
	and	%i3,	%i0,	%l4
	andcc	%i7,	0x1E16,	%o1
	addc	%g4,	%g5,	%i4
	movg	%icc,	%i5,	%o2
	edge16	%o0,	%o6,	%i6
	smulcc	%g2,	0x08CB,	%i2
	subcc	%o4,	%o7,	%g7
	or	%g3,	%l0,	%l5
	save %o5, %o3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i1,	0x099D,	%g1
	edge16ln	%l3,	%l2,	%l1
	fmovrdgez	%g6,	%f18,	%f16
	fmovrdlez	%i3,	%f20,	%f22
	edge8l	%l4,	%i7,	%o1
	orcc	%i0,	%g4,	%i4
	popc	%g5,	%o2
	sir	0x1DE4
	movvc	%icc,	%i5,	%o6
	stb	%o0,	[%l7 + 0x61]
	movrgez	%g2,	0x22D,	%i2
	fzero	%f28
	ldub	[%l7 + 0x73],	%o4
	fnegs	%f22,	%f22
	fmovrsne	%i6,	%f30,	%f12
	array16	%g7,	%g3,	%l0
	fpsub16s	%f20,	%f18,	%f23
	fandnot2	%f20,	%f26,	%f14
	ld	[%l7 + 0x6C],	%f15
	movne	%icc,	%o7,	%l5
	or	%o3,	%o5,	%l6
	sth	%g1,	[%l7 + 0x46]
	fxnor	%f4,	%f30,	%f4
	movvc	%icc,	%i1,	%l3
	ldd	[%l7 + 0x18],	%l2
	subc	%l1,	0x0724,	%i3
	movcs	%icc,	%g6,	%l4
	ldsw	[%l7 + 0x78],	%i7
	sdiv	%o1,	0x1604,	%g4
	fmovdle	%icc,	%f2,	%f16
	movrlez	%i0,	%g5,	%o2
	movre	%i5,	%o6,	%o0
	fmovse	%icc,	%f17,	%f29
	sllx	%i4,	%i2,	%g2
	sra	%o4,	0x0D,	%i6
	and	%g7,	0x1465,	%g3
	fmovspos	%icc,	%f24,	%f0
	edge8l	%o7,	%l0,	%o3
	movrgez	%o5,	0x299,	%l5
	movre	%g1,	%l6,	%l3
	movcs	%icc,	%i1,	%l2
	edge16l	%l1,	%i3,	%g6
	ldd	[%l7 + 0x58],	%l4
	addcc	%o1,	0x1C01,	%g4
	movle	%icc,	%i0,	%i7
	edge32ln	%g5,	%o2,	%o6
	edge32l	%i5,	%o0,	%i4
	fcmpne32	%f30,	%f28,	%i2
	movne	%xcc,	%g2,	%o4
	edge32l	%i6,	%g3,	%g7
	movleu	%xcc,	%o7,	%l0
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	restore %l5, %l3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f16,	%f6,	%f0
	edge32ln	%l2,	%l6,	%i3
	andn	%g6,	0x1229,	%l1
	fone	%f0
	sllx	%l4,	%g4,	%i0
	ldub	[%l7 + 0x4B],	%i7
	edge16	%o1,	%g5,	%o6
	xnorcc	%o2,	0x05DD,	%i5
	xnor	%o0,	%i2,	%i4
	udiv	%g2,	0x0839,	%o4
	fmovrsgz	%g3,	%f6,	%f1
	movgu	%xcc,	%g7,	%o7
	fmovsleu	%xcc,	%f25,	%f16
	umulcc	%i6,	0x0CDF,	%l0
	sra	%o5,	%g1,	%o3
	fmuld8ulx16	%f17,	%f21,	%f26
	array8	%l3,	%l5,	%l2
	movvs	%xcc,	%l6,	%i3
	array16	%i1,	%g6,	%l4
	addccc	%l1,	%g4,	%i0
	movre	%i7,	0x3E9,	%g5
	fmovsgu	%icc,	%f25,	%f7
	edge8l	%o1,	%o2,	%o6
	fcmped	%fcc3,	%f20,	%f0
	subccc	%o0,	%i2,	%i4
	edge32ln	%g2,	%i5,	%g3
	fmovrse	%g7,	%f20,	%f26
	movrlez	%o7,	0x157,	%o4
	fors	%f22,	%f9,	%f13
	subccc	%l0,	%i6,	%o5
	sth	%g1,	[%l7 + 0x4A]
	fmovdcc	%xcc,	%f13,	%f20
	lduh	[%l7 + 0x40],	%l3
	fsrc1	%f10,	%f24
	siam	0x3
	fmovsgu	%icc,	%f31,	%f25
	mulx	%l5,	0x15FF,	%l2
	subccc	%o3,	0x1C55,	%i3
	smulcc	%i1,	%l6,	%g6
	ld	[%l7 + 0x1C],	%f25
	stw	%l4,	[%l7 + 0x60]
	movcc	%xcc,	%l1,	%i0
	or	%i7,	0x0994,	%g4
	edge16	%g5,	%o1,	%o2
	ldsb	[%l7 + 0x25],	%o6
	alignaddr	%i2,	%o0,	%g2
	subccc	%i5,	%i4,	%g3
	or	%o7,	0x0AB0,	%o4
	sll	%l0,	0x0A,	%i6
	fmovrdgez	%o5,	%f2,	%f0
	nop
	set	0x2C, %l6
	ldsh	[%l7 + %l6],	%g7
	movcs	%xcc,	%g1,	%l3
	array32	%l2,	%l5,	%i3
	edge16	%i1,	%l6,	%g6
	movcc	%xcc,	%o3,	%l4
	edge8	%i0,	%l1,	%i7
	smul	%g4,	%o1,	%g5
	sth	%o2,	[%l7 + 0x58]
	srlx	%o6,	%o0,	%g2
	edge8l	%i5,	%i2,	%i4
	srl	%o7,	%o4,	%g3
	srlx	%i6,	%l0,	%g7
	sth	%g1,	[%l7 + 0x26]
	lduh	[%l7 + 0x2C],	%o5
	movvc	%icc,	%l2,	%l3
	fmovrdne	%l5,	%f22,	%f12
	fzeros	%f12
	movrlz	%i3,	0x315,	%i1
	movrgez	%g6,	%o3,	%l4
	movrgz	%l6,	%l1,	%i0
	or	%g4,	0x1F20,	%i7
	sdivcc	%o1,	0x1E06,	%g5
	fors	%f29,	%f17,	%f10
	sllx	%o6,	%o2,	%g2
	addcc	%i5,	%o0,	%i4
	faligndata	%f14,	%f26,	%f18
	umul	%i2,	%o4,	%g3
	fabss	%f27,	%f27
	edge8	%o7,	%l0,	%g7
	edge32n	%g1,	%o5,	%i6
	xor	%l2,	0x1714,	%l5
	st	%f2,	[%l7 + 0x30]
	ldd	[%l7 + 0x70],	%f16
	edge16n	%l3,	%i3,	%i1
	fnegd	%f8,	%f20
	movvc	%xcc,	%o3,	%g6
	sir	0x0A29
	movleu	%icc,	%l4,	%l6
	movvs	%icc,	%i0,	%g4
	fmovrdgz	%i7,	%f30,	%f12
	sth	%o1,	[%l7 + 0x72]
	movgu	%icc,	%l1,	%g5
	fmovscs	%icc,	%f3,	%f27
	fmovrsgz	%o6,	%f11,	%f15
	edge32l	%o2,	%g2,	%o0
	sdivx	%i4,	0x1F80,	%i5
	subccc	%o4,	0x1227,	%g3
	edge8l	%o7,	%i2,	%l0
	sethi	0x1191,	%g1
	fnors	%f3,	%f8,	%f14
	movpos	%xcc,	%g7,	%i6
	movrgz	%o5,	%l5,	%l3
	fcmpeq32	%f24,	%f18,	%l2
	save %i1, %o3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f8,	[%l7 + 0x60]
	lduw	[%l7 + 0x54],	%l4
	and	%l6,	0x14AE,	%i3
	addcc	%i0,	%i7,	%o1
	fnor	%f28,	%f14,	%f30
	udivcc	%g4,	0x0BE6,	%l1
	save %g5, %o2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o0,	%o6,	%i4
	movg	%icc,	%o4,	%i5
	udivcc	%g3,	0x1025,	%o7
	udivcc	%i2,	0x1B97,	%l0
	ldsb	[%l7 + 0x20],	%g7
	fsrc2	%f14,	%f30
	edge32l	%g1,	%i6,	%o5
	nop
	set	0x50, %l5
	sth	%l5,	[%l7 + %l5]
	andn	%l2,	0x0C6F,	%i1
	movn	%icc,	%l3,	%o3
	add	%g6,	%l6,	%l4
	movn	%xcc,	%i0,	%i7
	xnorcc	%o1,	%g4,	%l1
	movleu	%xcc,	%i3,	%g5
	nop
	set	0x36, %o0
	ldsh	[%l7 + %o0],	%o2
	fpmerge	%f30,	%f26,	%f4
	andncc	%g2,	%o6,	%o0
	sllx	%i4,	%i5,	%o4
	popc	%o7,	%i2
	ldub	[%l7 + 0x16],	%l0
	fmovspos	%xcc,	%f25,	%f17
	alignaddr	%g3,	%g7,	%g1
	ldd	[%l7 + 0x10],	%f18
	edge16ln	%o5,	%i6,	%l2
	lduh	[%l7 + 0x64],	%l5
	std	%f6,	[%l7 + 0x60]
	ldsh	[%l7 + 0x6C],	%i1
	addccc	%o3,	0x0908,	%g6
	sra	%l3,	%l6,	%i0
	nop
	set	0x14, %g4
	ldsh	[%l7 + %g4],	%i7
	fand	%f10,	%f24,	%f6
	fmovsneg	%icc,	%f26,	%f19
	sir	0x156B
	umulcc	%l4,	%o1,	%l1
	srl	%i3,	%g5,	%o2
	movn	%icc,	%g2,	%g4
	xnorcc	%o6,	%i4,	%o0
	subcc	%o4,	0x0397,	%o7
	sllx	%i2,	%i5,	%g3
	movrgz	%g7,	%l0,	%g1
	movcc	%xcc,	%o5,	%l2
	bshuffle	%f4,	%f8,	%f10
	fmovsle	%xcc,	%f1,	%f9
	edge32n	%l5,	%i6,	%i1
	movl	%icc,	%o3,	%l3
	edge16l	%g6,	%i0,	%i7
	srlx	%l4,	%l6,	%o1
	fmovrdgez	%l1,	%f28,	%f10
	sll	%g5,	0x06,	%i3
	edge32	%g2,	%o2,	%g4
	movvs	%icc,	%i4,	%o0
	for	%f0,	%f2,	%f28
	array8	%o6,	%o4,	%i2
	fmovrsne	%i5,	%f17,	%f21
	edge16n	%g3,	%g7,	%l0
	edge16ln	%g1,	%o5,	%l2
	sdivx	%o7,	0x1257,	%l5
	movre	%i1,	%i6,	%l3
	sir	0x0344
	fmovrsgz	%o3,	%f29,	%f9
	sdivx	%i0,	0x14E1,	%g6
	array32	%i7,	%l4,	%o1
	movge	%xcc,	%l1,	%g5
	movrgez	%l6,	0x1C2,	%g2
	fmovrsgz	%i3,	%f18,	%f4
	edge16ln	%o2,	%i4,	%g4
	edge8ln	%o6,	%o0,	%o4
	umulcc	%i2,	0x03EF,	%g3
	fpackfix	%f12,	%f8
	smul	%g7,	%i5,	%l0
	andcc	%o5,	%g1,	%o7
	andncc	%l2,	%l5,	%i6
	srl	%i1,	0x0A,	%o3
	movn	%xcc,	%i0,	%l3
	xnorcc	%g6,	0x10D5,	%l4
	fmul8sux16	%f0,	%f6,	%f14
	srl	%i7,	0x09,	%o1
	fpmerge	%f9,	%f21,	%f18
	edge32l	%g5,	%l1,	%l6
	ldsh	[%l7 + 0x30],	%g2
	and	%o2,	%i4,	%g4
	edge32	%o6,	%i3,	%o4
	ldub	[%l7 + 0x35],	%i2
	movle	%xcc,	%g3,	%g7
	movrlez	%i5,	%o0,	%o5
	movvs	%xcc,	%g1,	%l0
	smul	%o7,	%l2,	%l5
	fmovrdgz	%i6,	%f10,	%f14
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	lduw	[%l7 + 0x50],	%g6
	umulcc	%l4,	0x09F9,	%i7
	fmovrslez	%o1,	%f8,	%f27
	andncc	%g5,	%l3,	%l6
	movvs	%icc,	%g2,	%l1
	movl	%xcc,	%i4,	%g4
	lduh	[%l7 + 0x14],	%o2
	fpack16	%f2,	%f9
	array16	%o6,	%i3,	%i2
	fpadd32s	%f10,	%f8,	%f30
	xnorcc	%g3,	0x1C95,	%g7
	edge8l	%o4,	%o0,	%o5
	andn	%i5,	%l0,	%g1
	edge8	%l2,	%o7,	%i6
	movle	%icc,	%l5,	%i1
	subccc	%o3,	%g6,	%i0
	movrgz	%i7,	%o1,	%l4
	sir	0x111A
	ldd	[%l7 + 0x28],	%f12
	orn	%l3,	0x0357,	%l6
	popc	%g5,	%g2
	sub	%i4,	%g4,	%l1
	movvc	%icc,	%o6,	%i3
	stx	%i2,	[%l7 + 0x40]
	movcc	%xcc,	%g3,	%o2
	subccc	%o4,	0x1835,	%o0
	st	%f17,	[%l7 + 0x6C]
	std	%f2,	[%l7 + 0x78]
	fcmpeq16	%f10,	%f20,	%o5
	fmovrdgez	%i5,	%f24,	%f20
	andn	%l0,	%g1,	%l2
	fzeros	%f5
	fmovrsgez	%g7,	%f21,	%f30
	array16	%o7,	%l5,	%i1
	edge8n	%i6,	%g6,	%o3
	edge8n	%i7,	%o1,	%i0
	edge8l	%l3,	%l4,	%g5
	edge32l	%l6,	%i4,	%g2
	fmovdge	%xcc,	%f28,	%f4
	subccc	%l1,	0x15B6,	%g4
	edge32l	%i3,	%i2,	%g3
	movle	%icc,	%o6,	%o2
	movne	%xcc,	%o0,	%o5
	fcmple32	%f0,	%f12,	%o4
	movpos	%icc,	%i5,	%g1
	lduw	[%l7 + 0x5C],	%l2
	fsrc1	%f12,	%f4
	sllx	%l0,	0x01,	%g7
	andncc	%l5,	%i1,	%o7
	fcmpeq32	%f26,	%f28,	%i6
	umulcc	%g6,	0x1BE5,	%i7
	ld	[%l7 + 0x10],	%f22
	movrgez	%o1,	0x325,	%o3
	restore %l3, 0x0C6F, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f17
	edge8ln	%i0,	%g5,	%l6
	umulcc	%g2,	0x089F,	%l1
	edge8	%g4,	%i3,	%i4
	fone	%f30
	andcc	%i2,	0x06C2,	%o6
	movre	%o2,	0x1E0,	%g3
	fexpand	%f21,	%f22
	lduh	[%l7 + 0x3A],	%o5
	movne	%xcc,	%o0,	%o4
	ldsb	[%l7 + 0x6D],	%i5
	addccc	%g1,	%l0,	%l2
	ld	[%l7 + 0x2C],	%f15
	fmul8x16al	%f15,	%f12,	%f14
	edge16n	%g7,	%i1,	%o7
	array16	%i6,	%g6,	%l5
	fmovrdne	%o1,	%f24,	%f22
	movrlz	%o3,	0x207,	%i7
	bshuffle	%f14,	%f10,	%f10
	fpackfix	%f20,	%f28
	nop
	set	0x6E, %g5
	sth	%l4,	[%l7 + %g5]
	ld	[%l7 + 0x2C],	%f23
	fcmple32	%f26,	%f28,	%l3
	fnot2s	%f8,	%f29
	fmovrdgz	%g5,	%f0,	%f22
	stw	%i0,	[%l7 + 0x7C]
	edge8l	%g2,	%l6,	%l1
	edge16n	%i3,	%i4,	%i2
	sdivx	%o6,	0x02AF,	%g4
	ld	[%l7 + 0x34],	%f19
	smulcc	%g3,	0x1DA9,	%o5
	edge8	%o2,	%o4,	%i5
	and	%g1,	0x0BC9,	%o0
	addc	%l2,	0x1656,	%g7
	mulx	%l0,	%i1,	%o7
	lduw	[%l7 + 0x08],	%g6
	array8	%i6,	%o1,	%l5
	edge8	%o3,	%l4,	%l3
	umulcc	%i7,	%g5,	%i0
	xor	%g2,	0x1181,	%l6
	movrgz	%l1,	0x136,	%i3
	stb	%i4,	[%l7 + 0x56]
	fmovrdgz	%o6,	%f0,	%f14
	ldsw	[%l7 + 0x54],	%g4
	sdivx	%g3,	0x0EDB,	%o5
	sllx	%o2,	0x11,	%o4
	ldub	[%l7 + 0x3D],	%i5
	sll	%g1,	0x0B,	%o0
	fxors	%f22,	%f29,	%f27
	subc	%l2,	%g7,	%i2
	srax	%i1,	%o7,	%g6
	movcc	%icc,	%l0,	%o1
	alignaddr	%i6,	%o3,	%l5
	fmovspos	%xcc,	%f28,	%f11
	edge8n	%l3,	%i7,	%l4
	fmuld8sux16	%f27,	%f2,	%f20
	srlx	%i0,	0x01,	%g5
	fcmpeq16	%f28,	%f30,	%l6
	edge8	%g2,	%i3,	%l1
	fpsub32	%f2,	%f28,	%f16
	umulcc	%o6,	%g4,	%g3
	umulcc	%i4,	%o5,	%o4
	fcmpeq16	%f28,	%f12,	%i5
	sll	%g1,	0x07,	%o0
	save %l2, %o2, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f6,	%f24
	movg	%xcc,	%i1,	%g7
	ldx	[%l7 + 0x58],	%o7
	alignaddr	%l0,	%g6,	%o1
	udivcc	%i6,	0x17E7,	%o3
	movrne	%l5,	%i7,	%l4
	subccc	%i0,	0x09DF,	%g5
	andcc	%l3,	0x0AC6,	%l6
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	sth	%o6,	[%l7 + 0x36]
	andncc	%g3,	%i4,	%g4
	andn	%o5,	%o4,	%i5
	edge16l	%g1,	%l2,	%o0
	edge8	%o2,	%i1,	%g7
	ldd	[%l7 + 0x40],	%f22
	subcc	%i2,	0x0334,	%o7
	ldd	[%l7 + 0x18],	%f0
	movre	%g6,	%o1,	%i6
	save %o3, %l5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i7,	%l4,	%i0
	edge32l	%g5,	%l6,	%l3
	xorcc	%l1,	%i3,	%g2
	move	%icc,	%g3,	%i4
	orncc	%g4,	%o5,	%o4
	std	%f26,	[%l7 + 0x20]
	movrgz	%i5,	%o6,	%g1
	array16	%o0,	%l2,	%o2
	sub	%g7,	%i2,	%i1
	edge32n	%g6,	%o1,	%o7
	smulcc	%i6,	0x1091,	%l5
	move	%xcc,	%l0,	%i7
	movvc	%xcc,	%l4,	%o3
	fsrc1s	%f31,	%f28
	fnot2	%f22,	%f26
	and	%g5,	%i0,	%l3
	sth	%l6,	[%l7 + 0x5A]
	movre	%i3,	0x013,	%g2
	sdiv	%l1,	0x0148,	%i4
	xor	%g3,	%o5,	%o4
	srlx	%g4,	0x13,	%o6
	udiv	%i5,	0x1FFC,	%g1
	sllx	%o0,	0x0B,	%l2
	orcc	%o2,	0x0625,	%g7
	udivx	%i1,	0x0B72,	%i2
	xorcc	%o1,	0x1B21,	%g6
	sth	%i6,	[%l7 + 0x20]
	srlx	%l5,	%l0,	%i7
	subcc	%o7,	0x16BB,	%l4
	fnor	%f4,	%f16,	%f14
	xorcc	%o3,	%i0,	%g5
	fmovsge	%xcc,	%f23,	%f17
	std	%f6,	[%l7 + 0x28]
	sethi	0x1725,	%l6
	edge32ln	%i3,	%g2,	%l3
	fcmpgt32	%f26,	%f30,	%i4
	restore %l1, 0x0C42, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o4,	%g4,	%g3
	movle	%xcc,	%o6,	%i5
	mulscc	%o0,	%g1,	%l2
	sir	0x1D18
	edge16	%o2,	%i1,	%g7
	ldx	[%l7 + 0x38],	%o1
	movne	%icc,	%i2,	%i6
	sllx	%g6,	%l0,	%i7
	movrgez	%l5,	%o7,	%l4
	umul	%i0,	%g5,	%l6
	umulcc	%o3,	%g2,	%l3
	fcmpeq32	%f22,	%f12,	%i3
	movn	%icc,	%l1,	%i4
	movle	%xcc,	%o4,	%g4
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f20
	andncc	%o5,	%o6,	%g3
	fornot2s	%f19,	%f27,	%f31
	movg	%icc,	%o0,	%i5
	andcc	%g1,	%o2,	%i1
	fmovrdgz	%l2,	%f14,	%f20
	mulscc	%g7,	%i2,	%i6
	edge8n	%g6,	%l0,	%i7
	edge32	%o1,	%l5,	%o7
	fmovsl	%xcc,	%f18,	%f23
	movn	%xcc,	%i0,	%g5
	xor	%l4,	%l6,	%g2
	movne	%xcc,	%o3,	%l3
	popc	%l1,	%i3
	umul	%o4,	%g4,	%i4
	subccc	%o6,	%o5,	%o0
	edge32l	%i5,	%g1,	%o2
	edge8ln	%i1,	%g3,	%g7
	sra	%i2,	%i6,	%g6
	movgu	%icc,	%l2,	%l0
	addc	%i7,	0x076C,	%o1
	fmovsneg	%icc,	%f12,	%f15
	movne	%xcc,	%l5,	%i0
	fcmpgt16	%f8,	%f4,	%g5
	fmul8sux16	%f18,	%f30,	%f26
	ldd	[%l7 + 0x40],	%l4
	fmovdcs	%xcc,	%f3,	%f5
	movrne	%o7,	0x007,	%g2
	xorcc	%l6,	%l3,	%o3
	movrgez	%i3,	%o4,	%l1
	popc	0x16D5,	%g4
	save %o6, %o5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i4,	%g1
	movrne	%o2,	0x1FC,	%i5
	fmovdvs	%xcc,	%f16,	%f24
	sethi	0x08ED,	%i1
	mova	%xcc,	%g7,	%g3
	alignaddr	%i2,	%i6,	%g6
	addc	%l2,	%l0,	%i7
	edge8ln	%l5,	%o1,	%g5
	fabsd	%f10,	%f18
	movrgez	%l4,	%o7,	%g2
	ldsh	[%l7 + 0x0C],	%l6
	fmovdcs	%icc,	%f17,	%f16
	edge16	%i0,	%l3,	%i3
	nop
	set	0x74, %g3
	stb	%o4,	[%l7 + %g3]
	fmovrsgez	%o3,	%f7,	%f30
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f18
	fmovrdgz	%l1,	%f28,	%f28
	edge32l	%o6,	%g4,	%o0
	orncc	%o5,	%g1,	%o2
	movgu	%xcc,	%i4,	%i5
	fands	%f31,	%f10,	%f1
	ldd	[%l7 + 0x28],	%f2
	subccc	%i1,	%g7,	%g3
	st	%f13,	[%l7 + 0x58]
	fmovrde	%i6,	%f4,	%f2
	edge16	%i2,	%l2,	%g6
	fcmpne16	%f28,	%f20,	%l0
	edge16	%i7,	%o1,	%l5
	movge	%xcc,	%l4,	%o7
	fmul8ulx16	%f26,	%f24,	%f8
	movle	%icc,	%g5,	%g2
	smul	%i0,	%l3,	%i3
	movge	%xcc,	%o4,	%o3
	lduh	[%l7 + 0x22],	%l6
	movvc	%xcc,	%l1,	%g4
	movre	%o0,	%o6,	%g1
	edge32n	%o2,	%o5,	%i4
	andn	%i1,	0x14BD,	%g7
	edge32ln	%g3,	%i6,	%i5
	st	%f20,	[%l7 + 0x50]
	ldsw	[%l7 + 0x74],	%i2
	movpos	%xcc,	%g6,	%l2
	umul	%l0,	0x01F2,	%o1
	fmovdleu	%xcc,	%f12,	%f25
	edge8n	%i7,	%l5,	%o7
	fnor	%f0,	%f24,	%f22
	ldx	[%l7 + 0x10],	%l4
	movrgz	%g2,	%i0,	%l3
	stb	%i3,	[%l7 + 0x50]
	array32	%o4,	%g5,	%o3
	orncc	%l6,	%l1,	%g4
	sllx	%o6,	%g1,	%o2
	fcmps	%fcc1,	%f15,	%f1
	ldsw	[%l7 + 0x50],	%o5
	nop
	set	0x20, %g6
	lduw	[%l7 + %g6],	%o0
	save %i1, 0x08F2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i4,	%i6,	%i5
	stw	%g3,	[%l7 + 0x78]
	move	%icc,	%i2,	%l2
	add	%g6,	%o1,	%l0
	ldx	[%l7 + 0x10],	%i7
	fmovda	%icc,	%f9,	%f2
	array16	%o7,	%l5,	%l4
	movge	%xcc,	%g2,	%i0
	fmovdvc	%icc,	%f5,	%f18
	srlx	%l3,	0x10,	%i3
	movneg	%icc,	%o4,	%o3
	fmovdvs	%icc,	%f28,	%f10
	addccc	%l6,	%g5,	%g4
	lduh	[%l7 + 0x22],	%o6
	movge	%icc,	%g1,	%l1
	popc	%o2,	%o5
	stx	%i1,	[%l7 + 0x40]
	bshuffle	%f8,	%f14,	%f26
	fnegs	%f4,	%f21
	fcmpd	%fcc0,	%f16,	%f30
	addc	%o0,	%g7,	%i4
	movrgez	%i5,	%i6,	%g3
	fabss	%f6,	%f1
	movrlz	%i2,	0x37A,	%g6
	std	%f10,	[%l7 + 0x18]
	ld	[%l7 + 0x2C],	%f11
	subc	%l2,	0x1649,	%o1
	ldsw	[%l7 + 0x38],	%l0
	andcc	%o7,	0x0189,	%i7
	ld	[%l7 + 0x34],	%f3
	srax	%l5,	%g2,	%i0
	fpack32	%f26,	%f26,	%f24
	array16	%l4,	%i3,	%o4
	movrgez	%l3,	%l6,	%g5
	mulscc	%g4,	%o6,	%o3
	sra	%g1,	%l1,	%o2
	edge16	%i1,	%o5,	%g7
	mulx	%i4,	%o0,	%i6
	sub	%g3,	0x0C26,	%i2
	srl	%g6,	0x01,	%i5
	fnot2s	%f28,	%f24
	popc	0x0B9F,	%l2
	stb	%l0,	[%l7 + 0x35]
	ldd	[%l7 + 0x38],	%o0
	mulscc	%i7,	0x0B2A,	%o7
	edge16l	%g2,	%l5,	%l4
	movl	%xcc,	%i0,	%i3
	srax	%o4,	%l3,	%g5
	stx	%l6,	[%l7 + 0x78]
	fmovrsgz	%g4,	%f18,	%f10
	move	%icc,	%o6,	%o3
	subccc	%l1,	0x0F61,	%o2
	sir	0x0EC0
	sll	%i1,	%o5,	%g7
	fcmple16	%f14,	%f24,	%g1
	fnegd	%f8,	%f8
	movg	%icc,	%o0,	%i6
	ldd	[%l7 + 0x58],	%f14
	movpos	%icc,	%g3,	%i2
	ldub	[%l7 + 0x08],	%i4
	array8	%g6,	%i5,	%l2
	fmovsg	%icc,	%f22,	%f6
	siam	0x1
	stx	%o1,	[%l7 + 0x40]
	movcc	%xcc,	%l0,	%o7
	andncc	%i7,	%l5,	%l4
	array8	%g2,	%i3,	%i0
	movgu	%xcc,	%o4,	%l3
	movl	%icc,	%g5,	%g4
	ldsw	[%l7 + 0x18],	%o6
	sir	0x16E0
	movrlz	%l6,	%l1,	%o3
	movvs	%icc,	%o2,	%o5
	fmovs	%f27,	%f2
	edge16l	%i1,	%g1,	%g7
	fands	%f1,	%f22,	%f11
	andcc	%i6,	%o0,	%g3
	fpadd32s	%f18,	%f24,	%f4
	edge16l	%i2,	%i4,	%i5
	add	%g6,	%l2,	%o1
	movgu	%xcc,	%l0,	%i7
	alignaddr	%o7,	%l4,	%g2
	edge16n	%l5,	%i3,	%o4
	fmovsleu	%icc,	%f0,	%f21
	edge32n	%i0,	%l3,	%g5
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%g4
	ldsh	[%l7 + 0x18],	%o6
	alignaddrl	%l1,	%l6,	%o3
	movneg	%icc,	%o2,	%i1
	array8	%g1,	%g7,	%o5
	nop
	set	0x3C, %i0
	stw	%i6,	[%l7 + %i0]
	array8	%g3,	%i2,	%i4
	edge8n	%i5,	%g6,	%l2
	fcmpne16	%f20,	%f26,	%o1
	xnorcc	%o0,	%l0,	%o7
	mulx	%i7,	%l4,	%g2
	srl	%i3,	%l5,	%o4
	sth	%l3,	[%l7 + 0x78]
	edge32	%i0,	%g4,	%o6
	ldx	[%l7 + 0x40],	%g5
	addc	%l6,	0x074F,	%o3
	addc	%l1,	0x1E9A,	%i1
	movle	%icc,	%o2,	%g7
	sllx	%g1,	0x1F,	%i6
	fcmple32	%f6,	%f0,	%o5
	movpos	%xcc,	%i2,	%i4
	orcc	%g3,	%g6,	%l2
	edge32	%o1,	%o0,	%i5
	sethi	0x034B,	%l0
	xorcc	%i7,	0x0DE3,	%o7
	lduh	[%l7 + 0x46],	%l4
	stw	%i3,	[%l7 + 0x40]
	srax	%l5,	0x14,	%g2
	fsrc2	%f20,	%f30
	sllx	%l3,	0x12,	%o4
	add	%g4,	0x0EDE,	%o6
	smulcc	%i0,	%l6,	%g5
	smul	%o3,	0x0D6F,	%i1
	edge8	%o2,	%l1,	%g1
	movcc	%icc,	%i6,	%o5
	movvc	%xcc,	%i2,	%g7
	movcs	%xcc,	%g3,	%i4
	orcc	%g6,	%o1,	%o0
	udiv	%l2,	0x159E,	%l0
	fxor	%f6,	%f24,	%f14
	addcc	%i5,	0x0B6E,	%i7
	sdiv	%o7,	0x06F4,	%i3
	edge32l	%l5,	%l4,	%l3
	fmovd	%f10,	%f22
	st	%f28,	[%l7 + 0x38]
	orncc	%g2,	%g4,	%o6
	stb	%o4,	[%l7 + 0x41]
	ldx	[%l7 + 0x58],	%i0
	fxors	%f25,	%f9,	%f13
	stw	%l6,	[%l7 + 0x5C]
	xor	%o3,	%g5,	%i1
	fones	%f21
	andn	%l1,	0x0C9F,	%o2
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	fmovspos	%icc,	%f28,	%f0
	movge	%xcc,	%g7,	%o5
	fmovsl	%xcc,	%f16,	%f17
	array8	%i4,	%g3,	%g6
	fxor	%f16,	%f26,	%f28
	ldsw	[%l7 + 0x54],	%o0
	fmovdleu	%xcc,	%f18,	%f26
	fnands	%f8,	%f30,	%f30
	sethi	0x1FE5,	%l2
	movcc	%icc,	%o1,	%i5
	smul	%l0,	0x14C3,	%o7
	fmovdne	%xcc,	%f10,	%f22
	fcmpgt32	%f4,	%f12,	%i7
	fnors	%f14,	%f24,	%f29
	movn	%icc,	%i3,	%l5
	edge16	%l3,	%l4,	%g2
	mulx	%o6,	0x122A,	%o4
	move	%xcc,	%i0,	%l6
	edge32l	%o3,	%g4,	%g5
	sra	%i1,	%o2,	%l1
	andn	%g1,	%i2,	%i6
	andncc	%g7,	%o5,	%i4
	fpadd16s	%f24,	%f21,	%f30
	or	%g6,	%o0,	%g3
	fmovda	%icc,	%f25,	%f20
	movrne	%o1,	0x3F5,	%i5
	srax	%l0,	0x12,	%l2
	movg	%icc,	%o7,	%i3
	fmovdvs	%xcc,	%f4,	%f6
	srlx	%l5,	0x10,	%l3
	xor	%l4,	0x0D7F,	%g2
	movpos	%icc,	%o6,	%o4
	fcmps	%fcc3,	%f16,	%f17
	edge16l	%i7,	%i0,	%l6
	alignaddrl	%g4,	%g5,	%o3
	andcc	%i1,	%l1,	%g1
	movgu	%icc,	%o2,	%i6
	fpackfix	%f16,	%f8
	umul	%i2,	0x0E63,	%g7
	ldx	[%l7 + 0x60],	%i4
	sir	0x0A2F
	stb	%o5,	[%l7 + 0x19]
	movgu	%icc,	%o0,	%g6
	lduw	[%l7 + 0x34],	%o1
	alignaddr	%g3,	%l0,	%l2
	sdiv	%o7,	0x1B1F,	%i3
	fors	%f2,	%f23,	%f4
	restore %l5, %i5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%o6,	%o4
	fabss	%f6,	%f31
	addc	%l3,	%i7,	%i0
	fpsub16s	%f14,	%f24,	%f10
	fpadd32	%f26,	%f26,	%f26
	lduw	[%l7 + 0x0C],	%g4
	edge32ln	%l6,	%g5,	%i1
	sll	%l1,	0x08,	%g1
	nop
	set	0x6C, %i2
	ldsw	[%l7 + %i2],	%o2
	fcmpd	%fcc1,	%f18,	%f24
	movcc	%xcc,	%o3,	%i2
	movle	%xcc,	%i6,	%i4
	fmovrdgez	%g7,	%f14,	%f0
	edge8ln	%o5,	%o0,	%o1
	st	%f6,	[%l7 + 0x5C]
	fcmpes	%fcc2,	%f27,	%f31
	edge32n	%g6,	%g3,	%l0
	save %o7, 0x100D, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f8,	%f4,	%f28
	stx	%i3,	[%l7 + 0x48]
	sdivcc	%i5,	0x119E,	%l4
	lduw	[%l7 + 0x2C],	%g2
	movn	%xcc,	%l5,	%o6
	fcmps	%fcc2,	%f27,	%f29
	mulscc	%l3,	0x196D,	%o4
	fandnot2	%f22,	%f14,	%f12
	fsrc2s	%f25,	%f15
	ld	[%l7 + 0x28],	%f10
	movcc	%xcc,	%i0,	%g4
	sub	%l6,	%i7,	%i1
	alignaddr	%g5,	%l1,	%o2
	fmovdvs	%xcc,	%f3,	%f18
	orcc	%o3,	%g1,	%i2
	movrlez	%i6,	0x152,	%g7
	fmovrsgz	%i4,	%f4,	%f2
	sdiv	%o5,	0x0479,	%o1
	srl	%o0,	0x05,	%g6
	fxnor	%f8,	%f6,	%f28
	fmovspos	%icc,	%f19,	%f19
	movrgz	%g3,	0x026,	%o7
	mulx	%l0,	%l2,	%i5
	movneg	%icc,	%l4,	%i3
	movn	%icc,	%g2,	%l5
	fones	%f1
	and	%o6,	0x03D1,	%o4
	save %i0, %l3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g4,	%i7,	%i1
	movl	%icc,	%g5,	%o2
	alignaddrl	%o3,	%l1,	%i2
	mulx	%i6,	%g7,	%i4
	sub	%g1,	0x1FA3,	%o1
	movvs	%xcc,	%o0,	%o5
	bshuffle	%f24,	%f10,	%f28
	xorcc	%g6,	0x14CB,	%g3
	xnor	%l0,	%o7,	%l2
	movvs	%xcc,	%l4,	%i5
	sdiv	%i3,	0x0C98,	%g2
	movne	%xcc,	%o6,	%l5
	fmovscs	%xcc,	%f28,	%f15
	fmovsne	%icc,	%f31,	%f24
	mulx	%i0,	%l3,	%o4
	addcc	%l6,	0x13BE,	%i7
	xnor	%g4,	%g5,	%i1
	sdivcc	%o3,	0x03F3,	%l1
	ldsb	[%l7 + 0x78],	%o2
	fmovspos	%xcc,	%f22,	%f2
	edge8ln	%i2,	%i6,	%i4
	umul	%g1,	0x1631,	%o1
	sir	0x03D0
	fmovrdgez	%g7,	%f22,	%f30
	alignaddr	%o0,	%o5,	%g3
	movg	%xcc,	%g6,	%o7
	edge32l	%l2,	%l0,	%i5
	umul	%i3,	%g2,	%o6
	sdivx	%l4,	0x0B3D,	%l5
	edge8ln	%i0,	%o4,	%l6
	udiv	%l3,	0x15D6,	%g4
	edge32ln	%i7,	%i1,	%o3
	edge16n	%l1,	%o2,	%i2
	movne	%xcc,	%g5,	%i6
	movg	%icc,	%g1,	%o1
	sdivcc	%g7,	0x11F3,	%o0
	mova	%xcc,	%o5,	%i4
	edge16n	%g6,	%o7,	%l2
	sll	%g3,	0x0D,	%l0
	fmovsvs	%xcc,	%f13,	%f17
	fpadd16	%f20,	%f20,	%f28
	movrgz	%i5,	0x3F5,	%i3
	alignaddrl	%o6,	%g2,	%l4
	movrlez	%i0,	0x05D,	%l5
	move	%icc,	%l6,	%l3
	fabss	%f17,	%f10
	fzero	%f6
	edge16n	%o4,	%g4,	%i7
	fcmpne16	%f8,	%f20,	%i1
	fmovse	%icc,	%f12,	%f18
	ldub	[%l7 + 0x3F],	%l1
	sll	%o2,	%o3,	%i2
	fmovrsne	%i6,	%f1,	%f23
	ld	[%l7 + 0x08],	%f25
	movgu	%xcc,	%g1,	%o1
	movle	%xcc,	%g7,	%o0
	st	%f27,	[%l7 + 0x6C]
	fones	%f27
	movvc	%icc,	%g5,	%o5
	orn	%g6,	%i4,	%l2
	movpos	%icc,	%g3,	%o7
	fandnot2	%f16,	%f30,	%f20
	ldx	[%l7 + 0x68],	%l0
	edge16n	%i3,	%i5,	%o6
	fcmpes	%fcc2,	%f8,	%f25
	nop
	set	0x38, %i3
	stx	%g2,	[%l7 + %i3]
	sdiv	%l4,	0x14D0,	%i0
	movvc	%icc,	%l6,	%l3
	subccc	%l5,	%g4,	%i7
	ldd	[%l7 + 0x10],	%o4
	ldd	[%l7 + 0x38],	%f30
	fornot1s	%f4,	%f17,	%f23
	movrlez	%l1,	0x311,	%i1
	orn	%o3,	%o2,	%i2
	edge16n	%g1,	%o1,	%g7
	stw	%o0,	[%l7 + 0x5C]
	sethi	0x1861,	%i6
	sra	%o5,	0x01,	%g6
	fnegs	%f17,	%f22
	udiv	%g5,	0x0209,	%i4
	fandnot1	%f8,	%f26,	%f4
	lduw	[%l7 + 0x34],	%l2
	srax	%o7,	%g3,	%i3
	orn	%l0,	0x13F5,	%o6
	fmovdleu	%icc,	%f20,	%f12
	fcmple32	%f18,	%f2,	%g2
	sub	%l4,	%i5,	%l6
	sdivx	%l3,	0x0575,	%i0
	ldsw	[%l7 + 0x68],	%g4
	smul	%l5,	%o4,	%l1
	srax	%i1,	%i7,	%o3
	fmovrsgz	%i2,	%f29,	%f1
	ldd	[%l7 + 0x78],	%f22
	movrlez	%o2,	%o1,	%g1
	alignaddrl	%g7,	%i6,	%o5
	umulcc	%o0,	0x0FE1,	%g6
	movn	%icc,	%g5,	%l2
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	fmovscs	%icc,	%f11,	%f2
	st	%f30,	[%l7 + 0x48]
	sethi	0x1CCE,	%g3
	movvs	%icc,	%l0,	%o6
	and	%g2,	%i3,	%i5
	ld	[%l7 + 0x18],	%f4
	srl	%l6,	%l4,	%l3
	andn	%g4,	%l5,	%o4
	fnegd	%f2,	%f18
	st	%f18,	[%l7 + 0x28]
	array32	%l1,	%i1,	%i0
	siam	0x1
	or	%o3,	0x0C10,	%i7
	fcmpeq16	%f0,	%f2,	%i2
	pdist	%f22,	%f30,	%f20
	fmovscc	%xcc,	%f16,	%f21
	sra	%o2,	0x18,	%o1
	fcmpd	%fcc2,	%f16,	%f10
	sdiv	%g1,	0x1BD4,	%i6
	xnor	%o5,	%o0,	%g6
	nop
	set	0x21, %o5
	ldsb	[%l7 + %o5],	%g7
	restore %g5, 0x1FE2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%f30
	sethi	0x1FFA,	%l2
	umulcc	%g3,	%i4,	%o6
	ldub	[%l7 + 0x37],	%l0
	udiv	%i3,	0x00A9,	%i5
	array8	%l6,	%l4,	%g2
	movre	%g4,	%l5,	%o4
	movrlz	%l1,	0x2AA,	%i1
	orncc	%l3,	0x02CB,	%o3
	ldsh	[%l7 + 0x34],	%i0
	movrlz	%i2,	%i7,	%o2
	umul	%g1,	%o1,	%i6
	movneg	%xcc,	%o0,	%o5
	fmovdpos	%icc,	%f22,	%f21
	save %g6, %g7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f6,	%f14
	faligndata	%f2,	%f16,	%f4
	fcmple16	%f24,	%f16,	%g5
	fsrc1s	%f9,	%f4
	xnor	%l2,	0x05D4,	%g3
	st	%f3,	[%l7 + 0x64]
	movrgez	%i4,	%o6,	%l0
	fmovdneg	%xcc,	%f14,	%f31
	sth	%i5,	[%l7 + 0x4C]
	fnot1	%f6,	%f6
	movre	%i3,	%l4,	%g2
	movrne	%l6,	0x3FD,	%l5
	movvc	%icc,	%g4,	%l1
	edge16n	%o4,	%l3,	%o3
	sub	%i0,	%i1,	%i7
	fpack16	%f28,	%f0
	ld	[%l7 + 0x38],	%f13
	mova	%icc,	%i2,	%o2
	fcmpgt16	%f18,	%f0,	%g1
	movvs	%xcc,	%o1,	%i6
	fmovsge	%xcc,	%f2,	%f11
	sdivx	%o5,	0x0F76,	%o0
	xnorcc	%g6,	%o7,	%g7
	edge32ln	%g5,	%g3,	%l2
	addcc	%i4,	0x1334,	%l0
	movn	%icc,	%o6,	%i5
	fmovde	%icc,	%f6,	%f0
	udiv	%i3,	0x176F,	%g2
	andn	%l4,	%l6,	%g4
	fzero	%f8
	fcmpne32	%f30,	%f24,	%l5
	edge32ln	%o4,	%l3,	%l1
	movrlz	%o3,	%i0,	%i1
	edge8n	%i2,	%i7,	%o2
	fnegd	%f8,	%f10
	ldd	[%l7 + 0x30],	%f30
	orcc	%g1,	0x1772,	%o1
	movge	%xcc,	%i6,	%o0
	srl	%o5,	0x0F,	%o7
	fmovdne	%xcc,	%f6,	%f19
	movrlz	%g7,	%g5,	%g6
	fandnot2	%f8,	%f14,	%f2
	ldd	[%l7 + 0x58],	%l2
	or	%i4,	%l0,	%g3
	fmovsl	%icc,	%f15,	%f18
	bshuffle	%f10,	%f6,	%f10
	fmovdle	%xcc,	%f17,	%f2
	movcc	%xcc,	%o6,	%i3
	srlx	%i5,	0x0E,	%l4
	pdist	%f24,	%f4,	%f24
	st	%f11,	[%l7 + 0x44]
	movrlez	%g2,	0x2B7,	%l6
	save %g4, 0x1EA2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l3,	0x20A,	%l5
	sra	%o3,	0x0C,	%i0
	movrlez	%i1,	0x01E,	%i2
	edge8l	%l1,	%i7,	%g1
	movleu	%xcc,	%o1,	%i6
	edge8	%o2,	%o0,	%o5
	mova	%icc,	%g7,	%o7
	edge8l	%g6,	%g5,	%l2
	edge16ln	%l0,	%i4,	%o6
	movle	%xcc,	%g3,	%i3
	st	%f31,	[%l7 + 0x54]
	edge16n	%l4,	%i5,	%g2
	and	%l6,	%o4,	%g4
	movne	%xcc,	%l3,	%o3
	xnorcc	%l5,	%i1,	%i0
	ldub	[%l7 + 0x41],	%l1
	mova	%xcc,	%i2,	%g1
	sdivcc	%o1,	0x0F38,	%i7
	fsrc1s	%f15,	%f4
	movvs	%icc,	%o2,	%o0
	fnot2s	%f11,	%f21
	add	%o5,	%g7,	%i6
	fpsub32s	%f31,	%f17,	%f9
	fpsub16s	%f3,	%f6,	%f23
	nop
	set	0x59, %i5
	stb	%g6,	[%l7 + %i5]
	smul	%g5,	%o7,	%l0
	movvc	%icc,	%i4,	%l2
	or	%o6,	0x1319,	%i3
	sdiv	%g3,	0x1BBB,	%l4
	ldsh	[%l7 + 0x1E],	%g2
	sdivx	%i5,	0x0C1C,	%o4
	xnor	%l6,	%l3,	%o3
	fcmpgt16	%f8,	%f26,	%l5
	subc	%i1,	%g4,	%i0
	subcc	%l1,	%g1,	%i2
	andn	%i7,	%o1,	%o2
	edge16ln	%o0,	%o5,	%g7
	mulscc	%i6,	%g6,	%g5
	ldd	[%l7 + 0x58],	%o6
	array32	%i4,	%l0,	%l2
	fcmped	%fcc0,	%f26,	%f26
	fmovsleu	%icc,	%f20,	%f6
	addccc	%i3,	%o6,	%g3
	fsrc2s	%f4,	%f1
	movpos	%xcc,	%g2,	%l4
	fcmpd	%fcc3,	%f10,	%f10
	edge32	%i5,	%l6,	%l3
	movrgez	%o4,	%o3,	%i1
	ldub	[%l7 + 0x27],	%g4
	fnand	%f18,	%f20,	%f6
	move	%icc,	%l5,	%i0
	mulx	%l1,	0x152F,	%i2
	ldx	[%l7 + 0x40],	%g1
	ldx	[%l7 + 0x78],	%i7
	xnorcc	%o2,	%o1,	%o5
	movpos	%icc,	%g7,	%o0
	sdivx	%g6,	0x1F33,	%i6
	fsrc1	%f22,	%f26
	ldd	[%l7 + 0x28],	%o6
	addc	%i4,	0x19A8,	%l0
	lduh	[%l7 + 0x3C],	%g5
	fnot2	%f26,	%f6
	fmovrsgz	%i3,	%f29,	%f30
	alignaddr	%l2,	%g3,	%g2
	fmovsleu	%xcc,	%f23,	%f19
	umulcc	%l4,	%i5,	%o6
	ldd	[%l7 + 0x08],	%f12
	or	%l3,	%l6,	%o3
	subc	%i1,	0x0E71,	%o4
	fmovdpos	%icc,	%f2,	%f2
	umul	%g4,	%l5,	%l1
	edge8l	%i0,	%g1,	%i2
	xnor	%o2,	0x0B75,	%i7
	sub	%o5,	%g7,	%o1
	addcc	%g6,	0x12F9,	%i6
	movpos	%icc,	%o7,	%o0
	umulcc	%l0,	0x1BD8,	%g5
	ldub	[%l7 + 0x4B],	%i3
	sethi	0x06DC,	%i4
	fcmpes	%fcc2,	%f19,	%f15
	edge8ln	%l2,	%g2,	%g3
	movg	%icc,	%l4,	%i5
	movl	%xcc,	%l3,	%o6
	udivx	%l6,	0x164A,	%o3
	popc	0x16DF,	%o4
	orn	%g4,	0x1FE9,	%i1
	fsrc1s	%f19,	%f13
	move	%xcc,	%l5,	%l1
	movl	%xcc,	%i0,	%g1
	movg	%xcc,	%o2,	%i2
	fmovsvs	%icc,	%f12,	%f7
	movre	%o5,	%i7,	%o1
	movneg	%xcc,	%g6,	%i6
	stw	%g7,	[%l7 + 0x58]
	mova	%icc,	%o7,	%o0
	fmovda	%xcc,	%f14,	%f11
	edge8ln	%g5,	%i3,	%i4
	std	%f6,	[%l7 + 0x70]
	lduw	[%l7 + 0x70],	%l0
	srl	%l2,	%g2,	%l4
	fmovrsne	%g3,	%f2,	%f2
	lduw	[%l7 + 0x6C],	%l3
	fmovdneg	%icc,	%f3,	%f7
	alignaddrl	%i5,	%l6,	%o3
	sdiv	%o4,	0x1932,	%g4
	orncc	%i1,	0x023E,	%o6
	edge32	%l5,	%i0,	%g1
	movl	%xcc,	%o2,	%l1
	fmovsne	%xcc,	%f22,	%f6
	ldx	[%l7 + 0x68],	%i2
	sdiv	%i7,	0x15E0,	%o5
	umulcc	%o1,	0x1C56,	%i6
	srlx	%g6,	%g7,	%o0
	sth	%o7,	[%l7 + 0x36]
	fnor	%f0,	%f10,	%f28
	array8	%i3,	%i4,	%g5
	movrlz	%l2,	%l0,	%g2
	edge16	%g3,	%l4,	%l3
	fabss	%f29,	%f21
	lduh	[%l7 + 0x0A],	%i5
	movn	%icc,	%o3,	%l6
	srax	%o4,	%g4,	%o6
	edge16l	%i1,	%l5,	%i0
	addccc	%g1,	0x0493,	%o2
	movg	%xcc,	%i2,	%i7
	srlx	%l1,	%o1,	%i6
	fzeros	%f27
	fnegs	%f11,	%f0
	fpadd16s	%f7,	%f26,	%f20
	fmovse	%icc,	%f6,	%f18
	fmovrde	%g6,	%f18,	%f6
	fmovsl	%xcc,	%f16,	%f0
	fmovsne	%xcc,	%f18,	%f27
	bshuffle	%f6,	%f8,	%f10
	movrgz	%g7,	%o5,	%o7
	movpos	%xcc,	%i3,	%i4
	move	%icc,	%g5,	%o0
	edge16n	%l0,	%l2,	%g2
	fmovdn	%icc,	%f8,	%f25
	edge8n	%g3,	%l4,	%l3
	movcs	%icc,	%i5,	%l6
	ld	[%l7 + 0x64],	%f21
	st	%f5,	[%l7 + 0x38]
	udivcc	%o3,	0x0B7B,	%g4
	fmovdgu	%icc,	%f20,	%f16
	andncc	%o4,	%o6,	%i1
	movvs	%xcc,	%i0,	%g1
	fandnot2s	%f26,	%f11,	%f18
	ld	[%l7 + 0x48],	%f7
	addcc	%o2,	0x1089,	%i2
	siam	0x4
	movcs	%xcc,	%l5,	%l1
	sdivcc	%i7,	0x1A3D,	%o1
	edge8l	%g6,	%i6,	%o5
	fmovsl	%xcc,	%f14,	%f3
	movrgez	%o7,	%g7,	%i3
	fpadd16	%f10,	%f2,	%f2
	ld	[%l7 + 0x50],	%f17
	sethi	0x0F81,	%g5
	fmovrse	%o0,	%f11,	%f5
	ldsb	[%l7 + 0x61],	%i4
	movpos	%icc,	%l2,	%g2
	fmovdg	%icc,	%f12,	%f7
	array8	%l0,	%l4,	%g3
	xor	%l3,	%l6,	%o3
	srlx	%i5,	%g4,	%o6
	fmovs	%f6,	%f18
	move	%xcc,	%i1,	%i0
	movpos	%icc,	%o4,	%o2
	edge16l	%i2,	%g1,	%l5
	movle	%icc,	%i7,	%o1
	fcmped	%fcc0,	%f16,	%f18
	movle	%xcc,	%g6,	%l1
	array8	%i6,	%o5,	%g7
	fmovrslz	%i3,	%f11,	%f19
	orncc	%o7,	%o0,	%g5
	sethi	0x14F8,	%l2
	fcmpne32	%f12,	%f10,	%g2
	movre	%l0,	%l4,	%i4
	andn	%g3,	%l6,	%l3
	sub	%o3,	0x1402,	%i5
	mova	%xcc,	%o6,	%i1
	fcmpeq16	%f24,	%f14,	%g4
	subc	%i0,	0x0A8B,	%o2
	sth	%i2,	[%l7 + 0x5A]
	sub	%g1,	%l5,	%i7
	movleu	%icc,	%o1,	%g6
	fsrc2	%f18,	%f6
	edge32ln	%l1,	%i6,	%o5
	orcc	%g7,	%o4,	%o7
	lduw	[%l7 + 0x14],	%o0
	edge16l	%i3,	%l2,	%g2
	edge32l	%l0,	%l4,	%g5
	addcc	%i4,	%g3,	%l3
	xnorcc	%o3,	%l6,	%i5
	movvc	%icc,	%o6,	%i1
	movvc	%icc,	%g4,	%i0
	popc	%o2,	%g1
	fmovrsne	%i2,	%f30,	%f5
	udivcc	%l5,	0x1802,	%o1
	fmovrdne	%g6,	%f20,	%f30
	alignaddr	%l1,	%i6,	%o5
	lduh	[%l7 + 0x50],	%g7
	movrgz	%o4,	%i7,	%o0
	array8	%o7,	%i3,	%l2
	fmovdg	%xcc,	%f22,	%f28
	add	%l0,	%l4,	%g5
	fmovrdne	%i4,	%f30,	%f0
	fmovdne	%icc,	%f13,	%f13
	movcc	%xcc,	%g2,	%l3
	srlx	%o3,	%g3,	%i5
	alignaddrl	%l6,	%o6,	%i1
	edge8n	%i0,	%g4,	%o2
	sub	%i2,	%l5,	%o1
	movcs	%icc,	%g1,	%l1
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	sllx	%g7,	0x08,	%i6
	movre	%i7,	%o0,	%o4
	stw	%o7,	[%l7 + 0x30]
	subcc	%i3,	0x06C8,	%l2
	subccc	%l0,	%l4,	%g5
	edge8l	%g2,	%l3,	%i4
	movrgez	%o3,	0x0AF,	%i5
	save %g3, %o6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i1,	0x07EB,	%g4
	sdivcc	%o2,	0x1AEF,	%i0
	ldsw	[%l7 + 0x78],	%i2
	orcc	%l5,	%o1,	%g1
	stw	%l1,	[%l7 + 0x28]
	fmovsl	%icc,	%f7,	%f25
	fmovsgu	%icc,	%f12,	%f26
	andncc	%g6,	%o5,	%i6
	ldsb	[%l7 + 0x29],	%g7
	sdivx	%o0,	0x098D,	%i7
	edge8n	%o4,	%o7,	%i3
	sub	%l2,	%l4,	%l0
	fcmpes	%fcc3,	%f5,	%f5
	st	%f9,	[%l7 + 0x34]
	movpos	%xcc,	%g2,	%g5
	movgu	%xcc,	%l3,	%o3
	lduh	[%l7 + 0x1E],	%i4
	ldsb	[%l7 + 0x4A],	%i5
	mova	%xcc,	%o6,	%g3
	sdivcc	%l6,	0x1491,	%i1
	ldd	[%l7 + 0x10],	%o2
	addc	%g4,	%i0,	%i2
	lduw	[%l7 + 0x68],	%l5
	movvs	%xcc,	%g1,	%o1
	sethi	0x1EB2,	%l1
	udiv	%o5,	0x1B58,	%g6
	srax	%g7,	0x1C,	%i6
	srl	%o0,	%o4,	%o7
	fcmpeq32	%f16,	%f24,	%i3
	ldub	[%l7 + 0x18],	%i7
	fcmpgt16	%f14,	%f26,	%l4
	lduh	[%l7 + 0x44],	%l0
	fmovse	%icc,	%f20,	%f4
	orncc	%g2,	0x0952,	%g5
	sll	%l3,	%o3,	%i4
	edge16	%i5,	%l2,	%g3
	movrlez	%l6,	%o6,	%i1
	popc	%g4,	%i0
	movl	%xcc,	%i2,	%o2
	movvs	%icc,	%l5,	%g1
	edge32ln	%l1,	%o1,	%o5
	fandnot2s	%f10,	%f1,	%f30
	mulscc	%g6,	0x1C0E,	%i6
	fmovscs	%icc,	%f13,	%f0
	array16	%o0,	%g7,	%o7
	fmovsgu	%xcc,	%f2,	%f7
	fmuld8ulx16	%f7,	%f9,	%f28
	sdivcc	%i3,	0x17AC,	%o4
	movge	%xcc,	%i7,	%l4
	movrlz	%g2,	0x0E3,	%g5
	orn	%l0,	0x0D2C,	%o3
	umulcc	%i4,	%l3,	%i5
	array16	%g3,	%l2,	%o6
	subccc	%i1,	%l6,	%g4
	umul	%i2,	%i0,	%o2
	st	%f21,	[%l7 + 0x70]
	fmovscc	%xcc,	%f17,	%f3
	addccc	%g1,	%l5,	%l1
	edge8l	%o1,	%g6,	%o5
	edge8n	%o0,	%g7,	%i6
	fmovsn	%icc,	%f15,	%f14
	fmovsa	%xcc,	%f25,	%f21
	sth	%o7,	[%l7 + 0x08]
	fmovdg	%xcc,	%f9,	%f20
	sdiv	%o4,	0x0D4F,	%i7
	umul	%l4,	0x0621,	%g2
	orcc	%g5,	0x1BCE,	%l0
	edge8l	%i3,	%i4,	%o3
	edge32l	%l3,	%g3,	%i5
	subc	%l2,	%i1,	%o6
	and	%l6,	0x112F,	%g4
	movrlez	%i0,	0x038,	%o2
	movpos	%icc,	%i2,	%l5
	ldsw	[%l7 + 0x74],	%l1
	fmovdvs	%icc,	%f16,	%f30
	umulcc	%o1,	0x1F93,	%g6
	umul	%g1,	0x0ECD,	%o0
	faligndata	%f8,	%f14,	%f12
	mulscc	%g7,	%i6,	%o7
	orncc	%o5,	0x1B4D,	%i7
	andn	%l4,	0x0616,	%o4
	restore %g2, %g5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i3,	%o3,	%i4
	movre	%l3,	%i5,	%g3
	sllx	%l2,	0x03,	%i1
	array16	%o6,	%g4,	%i0
	movvc	%icc,	%o2,	%l6
	movrgez	%l5,	0x3D3,	%i2
	fnegs	%f27,	%f11
	movg	%xcc,	%l1,	%g6
	ldd	[%l7 + 0x50],	%f6
	subc	%g1,	%o0,	%g7
	subccc	%i6,	%o7,	%o5
	movle	%icc,	%i7,	%o1
	movcs	%xcc,	%l4,	%g2
	movge	%icc,	%g5,	%l0
	fmovrdne	%i3,	%f26,	%f14
	nop
	set	0x30, %o1
	lduw	[%l7 + %o1],	%o4
	fcmpd	%fcc0,	%f26,	%f26
	ldx	[%l7 + 0x18],	%o3
	fmovdvc	%icc,	%f21,	%f12
	stb	%l3,	[%l7 + 0x51]
	andncc	%i5,	%i4,	%g3
	fornot2	%f20,	%f14,	%f2
	andn	%i1,	%l2,	%g4
	edge32ln	%o6,	%o2,	%l6
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	array32	%l1,	%g6,	%i0
	stw	%o0,	[%l7 + 0x5C]
	lduw	[%l7 + 0x34],	%g7
	movleu	%xcc,	%g1,	%i6
	array16	%o5,	%o7,	%i7
	fcmpd	%fcc0,	%f28,	%f22
	sllx	%o1,	0x1E,	%l4
	fmovrsgz	%g2,	%f7,	%f13
	fands	%f7,	%f23,	%f9
	udivx	%l0,	0x153E,	%i3
	edge32	%o4,	%g5,	%o3
	orn	%l3,	%i5,	%g3
	pdist	%f0,	%f24,	%f14
	or	%i1,	%l2,	%i4
	fornot2s	%f23,	%f10,	%f1
	ldx	[%l7 + 0x18],	%o6
	fpsub32	%f16,	%f10,	%f22
	fnors	%f9,	%f11,	%f4
	save %o2, %g4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x2D],	%i2
	subc	%l6,	%g6,	%l1
	fpmerge	%f21,	%f23,	%f28
	sir	0x0F9E
	fcmpd	%fcc2,	%f12,	%f16
	ldd	[%l7 + 0x30],	%i0
	udivx	%o0,	0x0993,	%g1
	ldsh	[%l7 + 0x3E],	%i6
	sll	%g7,	0x03,	%o5
	movre	%o7,	0x269,	%i7
	ld	[%l7 + 0x14],	%f28
	movge	%xcc,	%l4,	%g2
	fmovsne	%icc,	%f13,	%f14
	sdivcc	%l0,	0x098B,	%o1
	fpadd32	%f6,	%f26,	%f14
	save %i3, 0x16B4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%o3,	%l3
	movn	%xcc,	%i5,	%i1
	alignaddr	%l2,	%g3,	%o6
	movl	%xcc,	%o2,	%g4
	edge32n	%l5,	%i2,	%l6
	movrne	%i4,	0x1F1,	%g6
	ldsb	[%l7 + 0x5B],	%i0
	ldd	[%l7 + 0x58],	%f0
	addccc	%o0,	0x1B66,	%g1
	fand	%f28,	%f10,	%f4
	popc	%i6,	%g7
	edge16	%l1,	%o5,	%i7
	ldx	[%l7 + 0x48],	%l4
	fmovrdlz	%o7,	%f18,	%f18
	stx	%g2,	[%l7 + 0x20]
	sllx	%l0,	0x1A,	%i3
	orn	%o1,	0x0B83,	%o4
	edge16ln	%o3,	%g5,	%i5
	smulcc	%l3,	%l2,	%g3
	mulscc	%i1,	0x0BDF,	%o2
	edge32	%g4,	%l5,	%i2
	addccc	%o6,	%i4,	%l6
	restore %i0, %o0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g1,	%g7,	%i6
	ld	[%l7 + 0x34],	%f6
	udivx	%o5,	0x0775,	%l1
	fandnot2	%f26,	%f2,	%f24
	xnorcc	%l4,	%o7,	%i7
	mulx	%l0,	%i3,	%g2
	movrgz	%o1,	0x2F3,	%o3
	fmovdg	%icc,	%f25,	%f30
	array32	%g5,	%o4,	%l3
	movneg	%xcc,	%l2,	%g3
	subc	%i1,	%i5,	%o2
	orcc	%l5,	%i2,	%o6
	mulx	%i4,	%l6,	%g4
	save %i0, 0x0E59, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o0,	[%l7 + 0x6C]
	move	%icc,	%g7,	%g1
	fzero	%f10
	fpsub16	%f10,	%f0,	%f20
	movrne	%i6,	0x0B0,	%o5
	orncc	%l1,	0x06B9,	%o7
	sub	%l4,	%l0,	%i3
	movneg	%xcc,	%i7,	%o1
	subc	%g2,	%g5,	%o4
	array16	%l3,	%l2,	%g3
	movre	%i1,	0x3CA,	%o3
	fmovsn	%icc,	%f17,	%f7
	edge16	%o2,	%i5,	%l5
	fcmpd	%fcc0,	%f28,	%f6
	movrgz	%i2,	%i4,	%l6
	andn	%o6,	0x0E66,	%i0
	movne	%xcc,	%g4,	%o0
	fmovdge	%icc,	%f12,	%f10
	move	%icc,	%g6,	%g7
	fmovdpos	%icc,	%f19,	%f17
	srax	%i6,	%g1,	%o5
	fcmpeq32	%f22,	%f2,	%l1
	nop
	set	0x7C, %o4
	ldsh	[%l7 + %o4],	%l4
	edge16l	%l0,	%o7,	%i3
	mulscc	%o1,	%g2,	%g5
	movvc	%xcc,	%i7,	%l3
	movrne	%o4,	0x2FF,	%l2
	ldsb	[%l7 + 0x2F],	%g3
	fornot2s	%f16,	%f30,	%f13
	stx	%i1,	[%l7 + 0x38]
	movcc	%xcc,	%o2,	%o3
	lduw	[%l7 + 0x44],	%i5
	edge8ln	%l5,	%i2,	%i4
	save %l6, %i0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o6,	%g6,	%g7
	smulcc	%o0,	0x1425,	%g1
	sdivx	%o5,	0x0538,	%i6
	edge16ln	%l1,	%l4,	%l0
	edge16	%i3,	%o7,	%g2
	xnor	%o1,	%i7,	%l3
	fmovsn	%icc,	%f4,	%f1
	movvc	%xcc,	%o4,	%g5
	fcmple32	%f18,	%f30,	%g3
	alignaddr	%i1,	%l2,	%o2
	ldx	[%l7 + 0x10],	%o3
	smul	%i5,	0x189C,	%l5
	edge8ln	%i4,	%l6,	%i2
	alignaddrl	%i0,	%o6,	%g4
	xnor	%g7,	0x1B4A,	%o0
	ldd	[%l7 + 0x68],	%g0
	movle	%icc,	%o5,	%i6
	edge8ln	%l1,	%l4,	%l0
	edge8n	%g6,	%o7,	%i3
	or	%g2,	%o1,	%l3
	fzeros	%f19
	mova	%xcc,	%o4,	%g5
	fmovdne	%xcc,	%f27,	%f29
	and	%i7,	0x1DC8,	%i1
	andncc	%l2,	%g3,	%o3
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	std	%f26,	[%l7 + 0x68]
	udivx	%l5,	0x1773,	%l6
	movcc	%xcc,	%i2,	%o6
	addc	%g4,	0x0C7E,	%i0
	fpack32	%f8,	%f24,	%f4
	fmuld8sux16	%f30,	%f23,	%f16
	movrgz	%g7,	%o0,	%g1
	fmovsvs	%icc,	%f12,	%f25
	sllx	%i6,	%o5,	%l1
	umul	%l0,	0x11B2,	%l4
	edge32n	%g6,	%i3,	%g2
	movpos	%icc,	%o7,	%o1
	movrlz	%o4,	0x030,	%l3
	movl	%icc,	%g5,	%i1
	udivx	%i7,	0x11B3,	%g3
	srlx	%l2,	%o3,	%o2
	array16	%i4,	%i5,	%l5
	orcc	%i2,	%o6,	%l6
	andncc	%i0,	%g4,	%o0
	fzeros	%f18
	sir	0x0DF1
	ldd	[%l7 + 0x10],	%f24
	orncc	%g1,	%i6,	%g7
	std	%f18,	[%l7 + 0x28]
	sdivx	%o5,	0x0A36,	%l0
	udivx	%l1,	0x0418,	%g6
	sir	0x199C
	movl	%icc,	%i3,	%l4
	movpos	%xcc,	%o7,	%g2
	udivx	%o4,	0x11B7,	%o1
	fmovrse	%g5,	%f22,	%f23
	std	%f4,	[%l7 + 0x18]
	umulcc	%l3,	%i1,	%g3
	orcc	%l2,	%i7,	%o3
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f16
	udiv	%i4,	0x0C67,	%i5
	sllx	%l5,	0x1A,	%i2
	nop
	set	0x18, %g2
	ldx	[%l7 + %g2],	%o2
	move	%xcc,	%o6,	%i0
	orcc	%g4,	0x18F3,	%o0
	edge32n	%l6,	%g1,	%i6
	fors	%f23,	%f22,	%f0
	fornot1s	%f4,	%f1,	%f29
	edge32ln	%o5,	%g7,	%l0
	sllx	%g6,	%i3,	%l4
	movpos	%icc,	%o7,	%l1
	add	%g2,	0x0E09,	%o4
	movvc	%icc,	%o1,	%l3
	orn	%g5,	%g3,	%i1
	xor	%i7,	0x0372,	%o3
	movneg	%icc,	%l2,	%i4
	mulscc	%l5,	%i5,	%o2
	stb	%o6,	[%l7 + 0x36]
	movrlez	%i0,	%g4,	%i2
	movrlz	%l6,	%o0,	%g1
	addc	%i6,	%g7,	%l0
	udivcc	%o5,	0x0FD3,	%i3
	fcmpgt16	%f26,	%f4,	%l4
	umulcc	%o7,	0x117B,	%l1
	edge8ln	%g2,	%o4,	%g6
	xnor	%o1,	%l3,	%g5
	fnands	%f22,	%f3,	%f10
	stb	%g3,	[%l7 + 0x79]
	edge16n	%i1,	%o3,	%i7
	xnorcc	%l2,	0x1A0F,	%i4
	movn	%xcc,	%i5,	%l5
	stx	%o6,	[%l7 + 0x20]
	stb	%i0,	[%l7 + 0x68]
	alignaddrl	%g4,	%o2,	%i2
	ldsh	[%l7 + 0x3E],	%o0
	orn	%g1,	%i6,	%g7
	lduw	[%l7 + 0x7C],	%l0
	alignaddr	%l6,	%o5,	%l4
	edge8	%i3,	%l1,	%o7
	andn	%g2,	%o4,	%g6
	mulscc	%l3,	%g5,	%o1
	st	%f21,	[%l7 + 0x54]
	edge8	%i1,	%o3,	%i7
	or	%l2,	%g3,	%i5
	stb	%i4,	[%l7 + 0x66]
	edge16l	%o6,	%l5,	%i0
	edge8	%g4,	%o2,	%o0
	mulscc	%i2,	%i6,	%g7
	edge16ln	%g1,	%l6,	%l0
	xorcc	%o5,	%i3,	%l4
	fxnor	%f30,	%f26,	%f10
	fnands	%f11,	%f2,	%f27
	fmovdl	%xcc,	%f16,	%f7
	subc	%l1,	0x0126,	%g2
	edge32l	%o7,	%g6,	%l3
	srlx	%g5,	%o1,	%o4
	fcmpne16	%f18,	%f30,	%o3
	ldd	[%l7 + 0x08],	%i6
	stw	%i1,	[%l7 + 0x30]
	movl	%icc,	%g3,	%l2
	popc	0x09DD,	%i5
	addccc	%o6,	0x0F5C,	%i4
	sllx	%i0,	%l5,	%o2
	ldd	[%l7 + 0x30],	%g4
	subc	%i2,	0x1D07,	%i6
	std	%f4,	[%l7 + 0x40]
	stw	%g7,	[%l7 + 0x6C]
	subccc	%o0,	0x066A,	%l6
	mova	%xcc,	%l0,	%g1
	for	%f6,	%f14,	%f2
	array8	%i3,	%l4,	%o5
	fmovsgu	%icc,	%f8,	%f17
	st	%f14,	[%l7 + 0x74]
	orcc	%g2,	0x0862,	%o7
	srlx	%l1,	0x09,	%g6
	srax	%g5,	%o1,	%l3
	addcc	%o4,	%i7,	%i1
	addcc	%o3,	%l2,	%i5
	mova	%icc,	%g3,	%i4
	srlx	%o6,	%i0,	%l5
	xnor	%o2,	0x18FF,	%i2
	restore %i6, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o0,	%l6,	%l0
	movg	%xcc,	%g1,	%i3
	srax	%l4,	0x0F,	%g2
	movpos	%icc,	%o7,	%l1
	edge32n	%g6,	%o5,	%o1
	orncc	%l3,	%g5,	%i7
	subc	%o4,	0x0CCD,	%i1
	udiv	%o3,	0x10E3,	%i5
	edge8l	%g3,	%l2,	%o6
	movcs	%icc,	%i0,	%l5
	ldd	[%l7 + 0x08],	%i4
	udivx	%i2,	0x1142,	%o2
	nop
	set	0x08, %l1
	ldsh	[%l7 + %l1],	%i6
	orcc	%g7,	0x1C0D,	%g4
	orcc	%l6,	%l0,	%o0
	fmovscs	%xcc,	%f4,	%f8
	umul	%g1,	%l4,	%i3
	edge32n	%o7,	%g2,	%l1
	stb	%g6,	[%l7 + 0x43]
	fmovde	%xcc,	%f28,	%f14
	stb	%o5,	[%l7 + 0x68]
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%o1
	add	%g5,	%i7,	%l3
	movrgez	%o4,	%o3,	%i5
	fsrc1	%f18,	%f14
	stb	%g3,	[%l7 + 0x62]
	fandnot1	%f6,	%f26,	%f30
	fmovdgu	%xcc,	%f30,	%f28
	ld	[%l7 + 0x38],	%f8
	xor	%i1,	%l2,	%i0
	edge16l	%l5,	%i4,	%o6
	sir	0x11B4
	edge16	%o2,	%i2,	%i6
	sir	0x1B71
	edge32ln	%g7,	%g4,	%l6
	movre	%l0,	%o0,	%l4
	ld	[%l7 + 0x18],	%f25
	subccc	%i3,	0x0D38,	%g1
	subc	%o7,	%l1,	%g6
	movleu	%icc,	%g2,	%o5
	popc	%o1,	%i7
	fnot2s	%f20,	%f8
	movre	%g5,	%l3,	%o4
	andncc	%i5,	%o3,	%i1
	movrlez	%l2,	0x1FB,	%g3
	sdivcc	%l5,	0x07F3,	%i0
	stb	%i4,	[%l7 + 0x30]
	and	%o2,	0x06C8,	%o6
	movre	%i2,	0x08D,	%g7
	movrgz	%i6,	%l6,	%g4
	fmovdge	%xcc,	%f4,	%f21
	or	%l0,	0x0839,	%o0
	sub	%i3,	%l4,	%o7
	udivx	%l1,	0x06AC,	%g6
	andn	%g2,	%g1,	%o1
	array8	%i7,	%o5,	%l3
	subc	%o4,	%g5,	%i5
	fandnot1	%f14,	%f26,	%f28
	edge32	%o3,	%i1,	%g3
	andcc	%l2,	%l5,	%i4
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	edge8ln	%i0,	%i2,	%g7
	subcc	%i6,	0x0639,	%l6
	movgu	%xcc,	%g4,	%l0
	movleu	%icc,	%o0,	%l4
	mulx	%i3,	%o7,	%g6
	addc	%g2,	0x03F0,	%l1
	fmovrsne	%g1,	%f2,	%f9
	fmovdneg	%icc,	%f10,	%f27
	sir	0x1DDA
	movg	%xcc,	%o1,	%o5
	edge32l	%l3,	%o4,	%i7
	movleu	%xcc,	%g5,	%i5
	subcc	%o3,	%g3,	%i1
	popc	%l5,	%l2
	smul	%o2,	0x04A7,	%o6
	faligndata	%f4,	%f28,	%f8
	sdivx	%i4,	0x1469,	%i2
	popc	0x18E5,	%g7
	sdiv	%i6,	0x1D4C,	%i0
	fmul8x16	%f13,	%f8,	%f4
	udivcc	%g4,	0x1A9F,	%l6
	movcc	%icc,	%o0,	%l4
	sethi	0x02D9,	%l0
	movcc	%icc,	%i3,	%o7
	movrgz	%g2,	%g6,	%g1
	edge8ln	%o1,	%o5,	%l1
	movrgez	%l3,	0x12B,	%i7
	stx	%g5,	[%l7 + 0x10]
	umul	%i5,	%o3,	%g3
	alignaddr	%i1,	%l5,	%l2
	movcc	%xcc,	%o2,	%o4
	addcc	%i4,	%i2,	%o6
	mulscc	%i6,	0x0B18,	%i0
	edge16ln	%g7,	%g4,	%o0
	popc	%l4,	%l6
	udiv	%l0,	0x1611,	%i3
	fone	%f10
	ld	[%l7 + 0x24],	%f13
	xnorcc	%o7,	%g2,	%g6
	or	%g1,	%o5,	%l1
	fornot1	%f16,	%f6,	%f8
	movrlz	%o1,	0x062,	%l3
	sllx	%i7,	0x13,	%i5
	stw	%g5,	[%l7 + 0x40]
	save %g3, %o3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f0,	%f20
	movge	%xcc,	%l5,	%l2
	sdivx	%o4,	0x15F2,	%o2
	movle	%icc,	%i4,	%o6
	xnorcc	%i2,	0x0BC3,	%i0
	stb	%g7,	[%l7 + 0x55]
	movl	%xcc,	%i6,	%o0
	fexpand	%f0,	%f12
	ldx	[%l7 + 0x30],	%l4
	st	%f6,	[%l7 + 0x0C]
	sdivx	%l6,	0x1AB9,	%l0
	srlx	%i3,	%g4,	%g2
	movcs	%xcc,	%g6,	%o7
	fmovsvc	%icc,	%f29,	%f21
	add	%o5,	%l1,	%g1
	edge8l	%l3,	%i7,	%o1
	array16	%g5,	%i5,	%g3
	fmovdne	%icc,	%f11,	%f25
	sll	%o3,	0x02,	%l5
	ldx	[%l7 + 0x30],	%i1
	alignaddrl	%o4,	%o2,	%l2
	fnot1	%f8,	%f10
	fmovsa	%icc,	%f24,	%f22
	udivx	%i4,	0x0D69,	%o6
	nop
	set	0x6D, %i6
	stb	%i2,	[%l7 + %i6]
	andcc	%i0,	%i6,	%g7
	mulscc	%o0,	0x04EA,	%l4
	mova	%icc,	%l6,	%i3
	fmovdgu	%xcc,	%f29,	%f6
	movrgez	%g4,	%l0,	%g6
	ld	[%l7 + 0x60],	%f2
	edge16	%g2,	%o5,	%l1
	srax	%g1,	0x04,	%o7
	umul	%i7,	0x0A9F,	%l3
	edge16ln	%o1,	%g5,	%g3
	fmovdcc	%icc,	%f8,	%f23
	movrne	%i5,	%l5,	%o3
	movleu	%icc,	%o4,	%o2
	movcs	%xcc,	%i1,	%i4
	sdiv	%l2,	0x1E75,	%o6
	fsrc1	%f6,	%f16
	or	%i0,	%i6,	%i2
	movge	%icc,	%o0,	%l4
	movne	%xcc,	%g7,	%l6
	st	%f16,	[%l7 + 0x18]
	edge8	%g4,	%i3,	%l0
	orcc	%g6,	0x0AC3,	%g2
	edge32	%o5,	%g1,	%l1
	subccc	%o7,	0x0F03,	%l3
	st	%f31,	[%l7 + 0x20]
	xor	%o1,	%i7,	%g3
	fmovsn	%xcc,	%f11,	%f29
	movl	%xcc,	%i5,	%g5
	bshuffle	%f30,	%f12,	%f22
	ldx	[%l7 + 0x50],	%o3
	array16	%l5,	%o4,	%o2
	nop
	set	0x2C, %o6
	stb	%i1,	[%l7 + %o6]
	addcc	%i4,	0x1D5D,	%o6
	edge16l	%l2,	%i6,	%i2
	stx	%i0,	[%l7 + 0x38]
	sdiv	%o0,	0x02A2,	%l4
	edge32ln	%g7,	%g4,	%i3
	fmovrdgez	%l0,	%f14,	%f24
	movrne	%l6,	%g6,	%o5
	nop
	set	0x2F, %i4
	ldub	[%l7 + %i4],	%g2
	sdivx	%g1,	0x13E0,	%l1
	fpadd32s	%f0,	%f12,	%f31
	add	%l3,	%o1,	%o7
	xnor	%g3,	%i7,	%i5
	array16	%o3,	%g5,	%o4
	movl	%icc,	%l5,	%o2
	movn	%xcc,	%i4,	%o6
	or	%i1,	0x01FC,	%l2
	edge16n	%i6,	%i2,	%o0
	fones	%f31
	srl	%l4,	0x12,	%i0
	movg	%xcc,	%g7,	%g4
	ldsh	[%l7 + 0x70],	%l0
	fxnor	%f16,	%f8,	%f20
	sdivcc	%i3,	0x0456,	%g6
	sub	%l6,	%o5,	%g1
	sub	%g2,	%l3,	%o1
	stb	%o7,	[%l7 + 0x3A]
	movrgz	%g3,	%l1,	%i5
	fpadd32	%f28,	%f0,	%f4
	udivcc	%i7,	0x1297,	%o3
	fmuld8ulx16	%f0,	%f25,	%f20
	xor	%o4,	%l5,	%o2
	movge	%icc,	%g5,	%i4
	movrne	%o6,	%i1,	%l2
	fpsub32	%f24,	%f14,	%f24
	ldsw	[%l7 + 0x2C],	%i2
	move	%icc,	%i6,	%o0
	udivx	%l4,	0x1074,	%g7
	fmovsleu	%xcc,	%f5,	%f16
	movle	%icc,	%i0,	%l0
	smul	%g4,	%g6,	%i3
	srax	%o5,	0x11,	%g1
	fpsub16	%f8,	%f26,	%f24
	sir	0x0060
	array16	%g2,	%l3,	%l6
	fcmpne32	%f2,	%f22,	%o1
	ldsw	[%l7 + 0x10],	%g3
	stb	%o7,	[%l7 + 0x1A]
	movg	%xcc,	%l1,	%i7
	fcmpeq16	%f26,	%f20,	%o3
	movrgez	%i5,	0x315,	%o4
	smulcc	%o2,	0x1EFC,	%g5
	movneg	%xcc,	%i4,	%o6
	fmovdg	%xcc,	%f0,	%f22
	movle	%xcc,	%i1,	%l5
	udivx	%i2,	0x16DB,	%l2
	sdiv	%i6,	0x1DCB,	%o0
	fmovrde	%g7,	%f26,	%f28
	movleu	%xcc,	%i0,	%l0
	stw	%g4,	[%l7 + 0x0C]
	edge16n	%l4,	%i3,	%g6
	or	%o5,	%g1,	%l3
	andn	%g2,	%l6,	%g3
	addcc	%o1,	%o7,	%l1
	add	%o3,	0x097C,	%i5
	restore %o4, %i7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g5,	%i4
	popc	%i1,	%l5
	sdivcc	%o6,	0x06AB,	%i2
	orcc	%l2,	0x16A3,	%i6
	fmul8x16	%f10,	%f22,	%f4
	mulx	%o0,	0x1D73,	%i0
	array32	%g7,	%g4,	%l0
	ld	[%l7 + 0x50],	%f3
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%i2
	fmovdge	%xcc,	%f18,	%f17
	fnot2	%f22,	%f0
	edge16l	%g6,	%o5,	%l4
	andcc	%l3,	0x0A24,	%g2
	fcmple32	%f10,	%f12,	%l6
	subcc	%g1,	0x08CF,	%g3
	edge8	%o1,	%o7,	%o3
	movne	%icc,	%l1,	%o4
	ldsw	[%l7 + 0x08],	%i7
	fmovdleu	%xcc,	%f8,	%f15
	fmovsneg	%xcc,	%f23,	%f2
	ld	[%l7 + 0x58],	%f13
	add	%i5,	%g5,	%o2
	edge16n	%i1,	%i4,	%l5
	movcs	%icc,	%i2,	%o6
	or	%i6,	0x0EA8,	%o0
	movg	%icc,	%l2,	%g7
	sub	%g4,	0x192A,	%i0
	movgu	%xcc,	%i3,	%g6
	subcc	%o5,	0x07A8,	%l0
	subc	%l3,	%g2,	%l4
	movge	%icc,	%l6,	%g1
	fmovdcc	%icc,	%f0,	%f17
	fxnors	%f9,	%f22,	%f5
	array16	%o1,	%o7,	%o3
	array8	%l1,	%g3,	%i7
	movle	%icc,	%o4,	%g5
	movle	%icc,	%i5,	%o2
	ldd	[%l7 + 0x08],	%f26
	movneg	%xcc,	%i4,	%l5
	subc	%i2,	%i1,	%i6
	popc	%o6,	%o0
	array8	%g7,	%g4,	%i0
	popc	%l2,	%i3
	udivx	%g6,	0x0AEC,	%o5
	movcs	%icc,	%l0,	%l3
	xnor	%l4,	0x1507,	%g2
	movvc	%icc,	%l6,	%g1
	fpack32	%f4,	%f26,	%f4
	subccc	%o7,	%o3,	%l1
	subc	%o1,	%i7,	%o4
	fmovsa	%icc,	%f11,	%f22
	fexpand	%f20,	%f24
	fone	%f14
	fornot1	%f14,	%f4,	%f10
	xorcc	%g3,	0x125F,	%g5
	alignaddrl	%o2,	%i4,	%i5
	xor	%l5,	%i1,	%i6
	sllx	%o6,	0x10,	%o0
	udivx	%i2,	0x053D,	%g4
	addc	%g7,	%l2,	%i3
	movl	%icc,	%g6,	%i0
	sdiv	%l0,	0x0463,	%l3
	fmovde	%icc,	%f17,	%f4
	array8	%o5,	%g2,	%l4
	fabsd	%f14,	%f6
	ldd	[%l7 + 0x70],	%f12
	bshuffle	%f30,	%f12,	%f28
	stw	%l6,	[%l7 + 0x28]
	edge16	%g1,	%o3,	%l1
	lduh	[%l7 + 0x34],	%o7
	edge16n	%o1,	%i7,	%o4
	movrne	%g5,	%o2,	%i4
	udivcc	%g3,	0x0656,	%i5
	lduh	[%l7 + 0x16],	%l5
	fnors	%f8,	%f22,	%f8
	subccc	%i1,	%i6,	%o0
	addc	%i2,	0x0E3E,	%g4
	subcc	%g7,	%o6,	%i3
	fmovda	%icc,	%f24,	%f25
	umulcc	%l2,	%i0,	%g6
	movne	%xcc,	%l0,	%l3
	sir	0x187C
	alignaddr	%o5,	%g2,	%l4
	ldsh	[%l7 + 0x4C],	%g1
	edge32n	%l6,	%o3,	%o7
	fmovsleu	%xcc,	%f21,	%f8
	edge8l	%l1,	%i7,	%o1
	save %g5, 0x0A31, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o4,	[%l7 + 0x4D]
	mulx	%g3,	%i5,	%l5
	fcmpne32	%f26,	%f2,	%i4
	ld	[%l7 + 0x20],	%f27
	edge16ln	%i6,	%o0,	%i1
	fmovdneg	%xcc,	%f26,	%f21
	move	%icc,	%g4,	%g7
	sdiv	%o6,	0x00D9,	%i2
	orncc	%l2,	%i3,	%g6
	srax	%l0,	0x1D,	%l3
	fcmpeq16	%f10,	%f28,	%i0
	movrne	%o5,	%g2,	%l4
	fmovdn	%xcc,	%f15,	%f30
	fmovrsgez	%g1,	%f11,	%f8
	udivx	%o3,	0x1755,	%l6
	edge16ln	%o7,	%l1,	%i7
	array32	%o1,	%g5,	%o2
	andncc	%o4,	%g3,	%i5
	save %l5, 0x1E17, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%i1,	%g4
	mulx	%o0,	0x05C1,	%g7
	alignaddr	%i2,	%o6,	%l2
	popc	0x10F3,	%g6
	movrne	%i3,	%l0,	%l3
	andncc	%o5,	%g2,	%i0
	sir	0x0158
	movrlz	%l4,	0x18F,	%o3
	movne	%xcc,	%l6,	%g1
	mova	%icc,	%l1,	%o7
	movneg	%xcc,	%o1,	%g5
	edge16ln	%o2,	%o4,	%i7
	fmovdcs	%xcc,	%f30,	%f1
	orncc	%i5,	%l5,	%i4
	fcmpd	%fcc2,	%f14,	%f4
	addcc	%g3,	0x010B,	%i1
	movne	%xcc,	%i6,	%g4
	array32	%g7,	%i2,	%o6
	andcc	%l2,	%o0,	%i3
	fpsub32	%f4,	%f16,	%f14
	for	%f28,	%f12,	%f30
	fmovdn	%icc,	%f10,	%f14
	stx	%g6,	[%l7 + 0x58]
	movrgez	%l3,	0x328,	%o5
	array32	%l0,	%i0,	%g2
	movrlez	%o3,	0x35C,	%l4
	movcs	%xcc,	%g1,	%l6
	edge16l	%o7,	%o1,	%l1
	st	%f25,	[%l7 + 0x34]
	smul	%g5,	%o2,	%o4
	andcc	%i5,	0x0564,	%l5
	siam	0x0
	addcc	%i7,	0x1AF4,	%i4
	edge32ln	%g3,	%i6,	%i1
	alignaddr	%g7,	%i2,	%g4
	fmovda	%xcc,	%f0,	%f7
	movneg	%icc,	%l2,	%o0
	std	%f18,	[%l7 + 0x50]
	sdivcc	%o6,	0x00EE,	%i3
	smulcc	%g6,	0x0C27,	%l3
	movg	%xcc,	%l0,	%i0
	movpos	%xcc,	%o5,	%g2
	fmul8x16	%f3,	%f4,	%f2
	udivcc	%l4,	0x1322,	%g1
	movneg	%xcc,	%o3,	%o7
	nop
	set	0x67, %g1
	stb	%o1,	[%l7 + %g1]
	edge16l	%l6,	%l1,	%o2
	movpos	%xcc,	%g5,	%i5
	pdist	%f20,	%f0,	%f18
	xnor	%o4,	0x0B1E,	%i7
	orn	%i4,	%g3,	%i6
	movrlz	%i1,	%l5,	%g7
	fmovde	%xcc,	%f12,	%f20
	movne	%xcc,	%i2,	%l2
	fcmpne32	%f26,	%f8,	%o0
	fxnors	%f30,	%f10,	%f10
	movg	%icc,	%g4,	%i3
	ldsh	[%l7 + 0x24],	%g6
	movne	%icc,	%o6,	%l0
	edge16	%l3,	%o5,	%i0
	ldsh	[%l7 + 0x3C],	%l4
	fnot2s	%f8,	%f19
	movrlz	%g2,	0x3C5,	%o3
	sdivx	%g1,	0x0B3D,	%o7
	lduw	[%l7 + 0x78],	%l6
	alignaddrl	%o1,	%o2,	%g5
	andcc	%l1,	0x087B,	%i5
	andncc	%o4,	%i7,	%g3
	alignaddrl	%i4,	%i1,	%i6
	sdivcc	%g7,	0x1B34,	%i2
	add	%l5,	%o0,	%g4
	fmovsleu	%icc,	%f4,	%f22
	andn	%l2,	%g6,	%o6
	fmovrdlez	%i3,	%f12,	%f22
	subccc	%l3,	%l0,	%i0
	orcc	%l4,	%g2,	%o5
	movcs	%xcc,	%g1,	%o3
	sub	%o7,	0x1DC9,	%l6
	andncc	%o2,	%g5,	%o1
	fand	%f18,	%f8,	%f6
	edge32ln	%i5,	%o4,	%l1
	alignaddr	%g3,	%i4,	%i7
	array16	%i6,	%g7,	%i2
	sllx	%l5,	0x1C,	%i1
	edge8ln	%g4,	%o0,	%l2
	ldsb	[%l7 + 0x73],	%o6
	ldub	[%l7 + 0x77],	%g6
	umul	%l3,	0x1A53,	%l0
	udiv	%i3,	0x0BB1,	%i0
	xnor	%l4,	0x1560,	%o5
	save %g2, 0x191B, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g1,	[%l7 + 0x14]
	movle	%xcc,	%l6,	%o7
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	fmovdvc	%xcc,	%f30,	%f23
	edge16ln	%i5,	%o4,	%g3
	movgu	%icc,	%i4,	%i7
	fcmpd	%fcc1,	%f8,	%f20
	lduw	[%l7 + 0x28],	%l1
	array16	%i6,	%i2,	%g7
	movcc	%icc,	%l5,	%i1
	add	%o0,	0x1631,	%l2
	xor	%g4,	0x1469,	%o6
	orncc	%l3,	%l0,	%i3
	umulcc	%i0,	0x1E70,	%l4
	std	%f16,	[%l7 + 0x20]
	orncc	%g6,	0x122B,	%g2
	sdivx	%o5,	0x1D00,	%g1
	orn	%l6,	%o7,	%o3
	ldsw	[%l7 + 0x40],	%g5
	fnot1	%f16,	%f0
	subc	%o1,	0x1138,	%o2
	udiv	%i5,	0x0748,	%o4
	ldd	[%l7 + 0x18],	%g2
	fnands	%f3,	%f25,	%f23
	fpsub32s	%f30,	%f10,	%f8
	lduw	[%l7 + 0x44],	%i7
	fnors	%f4,	%f3,	%f24
	udiv	%i4,	0x1618,	%i6
	movvs	%xcc,	%i2,	%l1
	fmovscc	%xcc,	%f21,	%f2
	movrgz	%l5,	0x190,	%i1
	edge32l	%g7,	%o0,	%g4
	smul	%l2,	%l3,	%l0
	edge32	%i3,	%i0,	%o6
	stw	%l4,	[%l7 + 0x64]
	fnor	%f28,	%f28,	%f30
	fmovdpos	%icc,	%f31,	%f26
	move	%icc,	%g2,	%o5
	fandnot2s	%f31,	%f16,	%f1
	movvs	%icc,	%g6,	%l6
	std	%f2,	[%l7 + 0x40]
	array8	%o7,	%g1,	%o3
	edge32l	%o1,	%g5,	%i5
	fmovsl	%icc,	%f11,	%f7
	movl	%icc,	%o2,	%g3
	alignaddr	%o4,	%i4,	%i7
	edge32n	%i6,	%i2,	%l5
	fzeros	%f6
	smul	%i1,	%g7,	%o0
	fmovdleu	%icc,	%f5,	%f26
	movleu	%icc,	%l1,	%g4
	ldx	[%l7 + 0x58],	%l3
	addccc	%l2,	%i3,	%l0
	edge8l	%i0,	%l4,	%g2
	ldd	[%l7 + 0x70],	%o4
	ld	[%l7 + 0x1C],	%f25
	stb	%o6,	[%l7 + 0x39]
	srl	%l6,	%g6,	%o7
	fcmpes	%fcc1,	%f19,	%f0
	st	%f9,	[%l7 + 0x5C]
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f2
	stb	%o3,	[%l7 + 0x3B]
	edge16ln	%g1,	%g5,	%o1
	fmovrsne	%o2,	%f4,	%f7
	movleu	%icc,	%g3,	%o4
	ldub	[%l7 + 0x42],	%i5
	ldsw	[%l7 + 0x3C],	%i7
	movrlez	%i4,	0x13E,	%i2
	movvc	%icc,	%l5,	%i1
	ldsh	[%l7 + 0x32],	%i6
	stx	%g7,	[%l7 + 0x58]
	orncc	%l1,	0x1EC1,	%g4
	movn	%xcc,	%l3,	%o0
	movneg	%xcc,	%l2,	%l0
	xnor	%i3,	%l4,	%g2
	fmovspos	%xcc,	%f23,	%f27
	movcc	%xcc,	%o5,	%o6
	std	%f4,	[%l7 + 0x30]
	xnorcc	%l6,	0x14E6,	%g6
	edge8	%i0,	%o3,	%o7
	movge	%xcc,	%g1,	%g5
	andcc	%o1,	%g3,	%o4
	movvs	%icc,	%o2,	%i5
	fmovdg	%icc,	%f21,	%f25
	sth	%i7,	[%l7 + 0x60]
	movg	%xcc,	%i2,	%l5
	movgu	%xcc,	%i1,	%i6
	or	%i4,	0x1B85,	%g7
	xnor	%g4,	%l3,	%l1
	ldub	[%l7 + 0x0C],	%l2
	ldsh	[%l7 + 0x1E],	%l0
	ldsh	[%l7 + 0x5E],	%o0
	sll	%l4,	%i3,	%g2
	fands	%f26,	%f18,	%f19
	srl	%o5,	0x03,	%l6
	edge32ln	%g6,	%o6,	%i0
	edge32ln	%o3,	%g1,	%g5
	fcmpgt16	%f8,	%f24,	%o1
	fcmpeq16	%f18,	%f14,	%g3
	stb	%o4,	[%l7 + 0x51]
	restore %o2, 0x1AA4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f21,	%f17
	ldsb	[%l7 + 0x0C],	%i7
	fxnors	%f11,	%f1,	%f31
	edge16ln	%i2,	%l5,	%i5
	fmovsle	%icc,	%f24,	%f6
	srax	%i1,	%i4,	%g7
	fmul8ulx16	%f22,	%f16,	%f16
	fnot1s	%f2,	%f12
	edge32	%g4,	%i6,	%l3
	fcmpne32	%f4,	%f30,	%l2
	fzeros	%f21
	xnorcc	%l0,	%l1,	%l4
	xor	%o0,	%i3,	%g2
	srl	%l6,	%g6,	%o5
	andn	%o6,	%i0,	%o3
	movrlz	%g5,	%g1,	%g3
	fmovrsne	%o4,	%f24,	%f14
	movcc	%xcc,	%o1,	%o7
	xor	%o2,	%i7,	%i2
	edge16	%l5,	%i5,	%i4
	sir	0x01CA
	move	%xcc,	%g7,	%g4
	umulcc	%i6,	0x198D,	%l3
	movle	%xcc,	%l2,	%i1
	sllx	%l1,	%l4,	%l0
	ldx	[%l7 + 0x50],	%i3
	stb	%g2,	[%l7 + 0x2C]
	fpsub16	%f20,	%f8,	%f26
	fandnot2s	%f27,	%f8,	%f1
	orcc	%l6,	%o0,	%o5
	ldsw	[%l7 + 0x4C],	%g6
	or	%o6,	%i0,	%o3
	add	%g5,	0x1981,	%g1
	srl	%g3,	0x1D,	%o1
	mova	%xcc,	%o7,	%o2
	fzero	%f12
	fors	%f0,	%f30,	%f10
	srax	%i7,	0x00,	%i2
	fmovsa	%xcc,	%f1,	%f24
	movcs	%xcc,	%l5,	%o4
	sdiv	%i5,	0x1E29,	%g7
	sethi	0x06CE,	%g4
	fandnot2s	%f13,	%f8,	%f1
	stw	%i6,	[%l7 + 0x2C]
	smulcc	%l3,	0x0F45,	%l2
	add	%i4,	%l1,	%i1
	fmovdl	%icc,	%f12,	%f20
	ldsh	[%l7 + 0x3A],	%l0
	stw	%l4,	[%l7 + 0x7C]
	sll	%i3,	0x11,	%g2
	addc	%o0,	0x0BDC,	%l6
	movneg	%icc,	%o5,	%o6
	sethi	0x139C,	%g6
	fpadd32	%f24,	%f24,	%f12
	mulscc	%o3,	%i0,	%g1
	sllx	%g5,	%g3,	%o7
	fcmped	%fcc3,	%f22,	%f14
	movge	%xcc,	%o1,	%i7
	movvs	%icc,	%i2,	%l5
	array16	%o4,	%o2,	%i5
	edge16l	%g4,	%g7,	%i6
	edge32ln	%l2,	%l3,	%l1
	andn	%i4,	0x01E4,	%l0
	move	%xcc,	%l4,	%i1
	edge32n	%g2,	%o0,	%l6
	fpsub32	%f8,	%f14,	%f28
	andn	%o5,	%i3,	%g6
	fmovrdne	%o6,	%f6,	%f8
	fmovsvs	%xcc,	%f21,	%f10
	sdivcc	%o3,	0x18DF,	%i0
	movrlz	%g5,	0x18A,	%g3
	udiv	%g1,	0x1ED3,	%o7
	orn	%i7,	0x17E9,	%i2
	ldub	[%l7 + 0x13],	%o1
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%l5
	save %o2, 0x0357, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i5,	[%l7 + 0x68]
	fmovsvs	%icc,	%f21,	%f13
	sll	%g4,	%i6,	%g7
	ldub	[%l7 + 0x17],	%l2
	andcc	%l1,	0x164D,	%i4
	movrgz	%l0,	%l3,	%i1
	edge32ln	%g2,	%o0,	%l6
	orcc	%l4,	0x11B7,	%o5
	mova	%xcc,	%g6,	%i3
	movle	%xcc,	%o6,	%o3
	fmovdneg	%icc,	%f20,	%f22
	sllx	%i0,	%g5,	%g1
	fandnot1s	%f21,	%f2,	%f20
	movne	%xcc,	%g3,	%o7
	save %i2, %o1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l5,	%o2,	%i5
	ldsw	[%l7 + 0x70],	%o4
	movvc	%icc,	%g4,	%i6
	sdiv	%l2,	0x12F2,	%g7
	andncc	%l1,	%l0,	%l3
	edge16l	%i1,	%g2,	%i4
	movg	%icc,	%l6,	%l4
	movcc	%icc,	%o0,	%o5
	fmovrslz	%g6,	%f1,	%f28
	sllx	%o6,	0x0B,	%o3
	udiv	%i0,	0x0A71,	%i3
	udivx	%g5,	0x1D92,	%g3
	andn	%g1,	0x146A,	%o7
	movrgz	%o1,	%i2,	%i7
	array32	%l5,	%o2,	%o4
	fmovsleu	%xcc,	%f21,	%f6
	lduw	[%l7 + 0x30],	%g4
	movvc	%icc,	%i5,	%i6
	umul	%l2,	0x0D5F,	%l1
	sll	%l0,	%g7,	%i1
	for	%f16,	%f14,	%f24
	mulx	%g2,	%i4,	%l6
	fmovsvc	%xcc,	%f23,	%f17
	ldd	[%l7 + 0x60],	%l4
	movleu	%xcc,	%o0,	%l3
	fmovrse	%g6,	%f16,	%f27
	andn	%o5,	0x0811,	%o6
	movrlez	%o3,	%i3,	%i0
	fmovdn	%xcc,	%f6,	%f25
	movn	%icc,	%g5,	%g3
	andn	%o7,	0x1770,	%g1
	add	%i2,	0x1C4C,	%o1
	movvc	%xcc,	%i7,	%o2
	sllx	%l5,	0x15,	%o4
	addccc	%i5,	0x04F6,	%i6
	movgu	%icc,	%l2,	%g4
	fpsub32s	%f6,	%f13,	%f2
	xnor	%l1,	%l0,	%i1
	ldx	[%l7 + 0x78],	%g2
	xnor	%i4,	0x1687,	%l6
	smulcc	%g7,	%o0,	%l4
	movvs	%icc,	%g6,	%o5
	ldsh	[%l7 + 0x52],	%o6
	edge16ln	%l3,	%i3,	%i0
	subc	%g5,	0x0F21,	%o3
	fxnor	%f30,	%f26,	%f8
	fmovdgu	%xcc,	%f17,	%f9
	smulcc	%g3,	%o7,	%i2
	ldsb	[%l7 + 0x75],	%o1
	nop
	set	0x10, %l4
	std	%f8,	[%l7 + %l4]
	movneg	%xcc,	%i7,	%g1
	subccc	%l5,	%o4,	%i5
	fnot1	%f4,	%f22
	lduh	[%l7 + 0x18],	%i6
	xnor	%l2,	0x1F31,	%o2
	nop
	set	0x70, %i1
	ldx	[%l7 + %i1],	%g4
	nop
	set	0x40, %l6
	ldsh	[%l7 + %l6],	%l0
	xnor	%l1,	0x1551,	%g2
	stb	%i1,	[%l7 + 0x45]
	fmovsge	%icc,	%f17,	%f26
	edge32	%l6,	%i4,	%o0
	fmovde	%xcc,	%f25,	%f11
	alignaddrl	%l4,	%g6,	%o5
	fxnors	%f4,	%f9,	%f8
	addcc	%o6,	0x1D4E,	%l3
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	movcs	%xcc,	%o3,	%i0
	fpack32	%f14,	%f0,	%f24
	fxors	%f22,	%f15,	%f22
	fmovrdne	%o7,	%f22,	%f0
	edge32n	%g3,	%i2,	%o1
	fpadd32	%f6,	%f0,	%f26
	subc	%g1,	%i7,	%l5
	orn	%o4,	%i6,	%i5
	stx	%o2,	[%l7 + 0x38]
	ldsb	[%l7 + 0x10],	%g4
	udivcc	%l0,	0x0A3C,	%l1
	sllx	%l2,	0x09,	%g2
	edge32	%i1,	%i4,	%l6
	edge32	%l4,	%o0,	%o5
	movvc	%icc,	%g6,	%l3
	std	%f26,	[%l7 + 0x08]
	ld	[%l7 + 0x10],	%f29
	subccc	%i3,	%o6,	%g7
	edge8	%g5,	%i0,	%o7
	alignaddrl	%g3,	%i2,	%o1
	fnors	%f16,	%f26,	%f6
	addccc	%o3,	%i7,	%g1
	fmovsg	%icc,	%f7,	%f13
	srlx	%o4,	0x12,	%l5
	fpsub16	%f18,	%f8,	%f22
	popc	%i5,	%o2
	movrlz	%i6,	0x26C,	%g4
	ld	[%l7 + 0x14],	%f13
	edge32ln	%l0,	%l2,	%l1
	ldsb	[%l7 + 0x0B],	%i1
	add	%g2,	0x0A60,	%l6
	srl	%i4,	%o0,	%o5
	fsrc2	%f28,	%f22
	xor	%g6,	0x05EA,	%l3
	edge32ln	%l4,	%o6,	%i3
	mova	%icc,	%g5,	%g7
	and	%o7,	0x0C99,	%g3
	udivcc	%i0,	0x1A04,	%o1
	edge16l	%i2,	%o3,	%i7
	mulx	%o4,	0x1552,	%g1
	andcc	%i5,	%o2,	%l5
	movge	%icc,	%g4,	%l0
	ldsh	[%l7 + 0x34],	%i6
	movleu	%icc,	%l1,	%i1
	array16	%l2,	%l6,	%i4
	fmovrdgez	%g2,	%f24,	%f24
	stw	%o5,	[%l7 + 0x28]
	add	%g6,	0x0DC6,	%o0
	subc	%l4,	0x1BEC,	%o6
	ldub	[%l7 + 0x43],	%l3
	movre	%g5,	%i3,	%o7
	umul	%g3,	%i0,	%o1
	fmovdle	%icc,	%f27,	%f13
	andncc	%g7,	%i2,	%o3
	add	%o4,	%g1,	%i7
	movleu	%xcc,	%o2,	%i5
	ldub	[%l7 + 0x0F],	%g4
	ldd	[%l7 + 0x20],	%l0
	fxor	%f12,	%f26,	%f10
	edge32ln	%i6,	%l1,	%i1
	edge8n	%l2,	%l5,	%i4
	movrne	%l6,	%g2,	%o5
	sethi	0x0C6F,	%o0
	edge8ln	%l4,	%o6,	%g6
	fmovdg	%xcc,	%f20,	%f27
	mulscc	%l3,	%g5,	%i3
	orncc	%o7,	%g3,	%i0
	movl	%xcc,	%o1,	%g7
	movpos	%xcc,	%o3,	%i2
	st	%f29,	[%l7 + 0x34]
	fmul8ulx16	%f28,	%f26,	%f28
	edge16n	%o4,	%g1,	%o2
	ldsb	[%l7 + 0x5C],	%i7
	fandnot1	%f26,	%f4,	%f12
	andcc	%i5,	0x11D2,	%l0
	fandnot1s	%f4,	%f5,	%f22
	array8	%i6,	%l1,	%g4
	ldsh	[%l7 + 0x0A],	%l2
	edge32ln	%i1,	%i4,	%l6
	fcmpgt32	%f12,	%f16,	%g2
	andn	%o5,	%l5,	%l4
	fpsub16	%f2,	%f18,	%f10
	ldsb	[%l7 + 0x6E],	%o6
	fcmpeq32	%f4,	%f14,	%g6
	movn	%xcc,	%o0,	%l3
	fmovrdgz	%g5,	%f8,	%f8
	movre	%o7,	%i3,	%g3
	add	%o1,	0x00CD,	%g7
	smulcc	%i0,	%o3,	%i2
	movvc	%xcc,	%o4,	%o2
	movrgz	%g1,	%i7,	%i5
	and	%l0,	%l1,	%g4
	movneg	%xcc,	%l2,	%i6
	sethi	0x0A3E,	%i1
	movl	%xcc,	%l6,	%i4
	fornot2	%f18,	%f12,	%f10
	edge32n	%o5,	%g2,	%l5
	fsrc1s	%f27,	%f12
	stb	%o6,	[%l7 + 0x3D]
	or	%l4,	%g6,	%o0
	and	%g5,	%l3,	%i3
	ldx	[%l7 + 0x50],	%g3
	fcmple32	%f30,	%f2,	%o7
	movcs	%xcc,	%g7,	%o1
	nop
	set	0x18, %l5
	std	%f28,	[%l7 + %l5]
	std	%f28,	[%l7 + 0x40]
	sdivx	%o3,	0x0A46,	%i0
	fxnors	%f12,	%f27,	%f10
	fnegs	%f18,	%f15
	movcc	%icc,	%i2,	%o2
	st	%f30,	[%l7 + 0x50]
	sethi	0x0DE6,	%g1
	ldsw	[%l7 + 0x48],	%o4
	movneg	%xcc,	%i7,	%l0
	movn	%xcc,	%i5,	%g4
	edge16l	%l2,	%i6,	%i1
	andn	%l6,	0x0A43,	%i4
	movrlez	%l1,	%o5,	%l5
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%g2
	alignaddr	%o6,	%l4,	%o0
	or	%g5,	0x0092,	%l3
	save %g6, 0x171E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i3,	%g7,	%o7
	sethi	0x1495,	%o1
	mova	%xcc,	%i0,	%o3
	or	%o2,	%g1,	%i2
	edge16	%i7,	%o4,	%i5
	movn	%icc,	%g4,	%l0
	fmovdge	%xcc,	%f26,	%f31
	fpack16	%f22,	%f29
	edge8ln	%l2,	%i6,	%l6
	add	%i1,	%l1,	%i4
	edge32l	%l5,	%g2,	%o6
	mulx	%l4,	%o0,	%o5
	xorcc	%g5,	0x1EB0,	%g6
	fnot1	%f2,	%f26
	movcs	%xcc,	%l3,	%i3
	array16	%g7,	%g3,	%o7
	std	%f2,	[%l7 + 0x20]
	orcc	%o1,	%o3,	%o2
	orcc	%g1,	0x075A,	%i0
	nop
	set	0x10, %g4
	stx	%i2,	[%l7 + %g4]
	sdiv	%i7,	0x1EC8,	%o4
	sra	%g4,	0x07,	%l0
	umul	%i5,	%l2,	%l6
	umulcc	%i6,	0x010B,	%i1
	ldsb	[%l7 + 0x0A],	%i4
	sllx	%l1,	%l5,	%o6
	smul	%l4,	%o0,	%g2
	movle	%xcc,	%o5,	%g5
	movneg	%icc,	%l3,	%i3
	array16	%g6,	%g3,	%g7
	stx	%o7,	[%l7 + 0x40]
	movrlez	%o3,	%o1,	%g1
	edge32l	%i0,	%i2,	%i7
	ld	[%l7 + 0x74],	%f20
	andncc	%o4,	%g4,	%o2
	fcmpne16	%f28,	%f6,	%i5
	movne	%icc,	%l0,	%l6
	mulx	%i6,	%l2,	%i1
	movge	%icc,	%l1,	%l5
	sdivcc	%i4,	0x1212,	%l4
	movrlz	%o0,	0x2F4,	%o6
	fnegs	%f0,	%f19
	udivcc	%o5,	0x09ED,	%g5
	sdivx	%g2,	0x1A88,	%i3
	fpadd32	%f0,	%f10,	%f12
	fmovse	%xcc,	%f15,	%f17
	edge8ln	%g6,	%g3,	%l3
	sra	%o7,	0x1B,	%o3
	movrgez	%g7,	0x385,	%g1
	edge16n	%i0,	%i2,	%o1
	edge16	%o4,	%i7,	%g4
	stx	%i5,	[%l7 + 0x38]
	add	%l0,	%o2,	%i6
	movvs	%xcc,	%l2,	%i1
	fmovrslz	%l6,	%f28,	%f12
	array8	%l5,	%i4,	%l4
	fsrc1	%f4,	%f30
	sub	%o0,	%o6,	%l1
	smulcc	%g5,	%o5,	%i3
	xor	%g6,	%g3,	%g2
	orcc	%l3,	0x0F41,	%o3
	and	%o7,	%g1,	%i0
	smul	%g7,	%o1,	%o4
	movvc	%icc,	%i2,	%g4
	movg	%xcc,	%i5,	%i7
	fpackfix	%f14,	%f31
	movneg	%xcc,	%l0,	%o2
	edge8	%i6,	%i1,	%l2
	sdivcc	%l5,	0x0F9F,	%i4
	movrgz	%l6,	0x1BA,	%l4
	st	%f7,	[%l7 + 0x30]
	array32	%o0,	%l1,	%o6
	movge	%xcc,	%o5,	%i3
	fandnot2s	%f20,	%f12,	%f26
	st	%f21,	[%l7 + 0x60]
	fpadd32	%f20,	%f14,	%f16
	edge32	%g5,	%g6,	%g3
	xnorcc	%l3,	0x1E40,	%o3
	fmovdn	%icc,	%f8,	%f6
	ldd	[%l7 + 0x28],	%f26
	srlx	%o7,	0x0F,	%g1
	andn	%i0,	0x097D,	%g7
	orncc	%g2,	%o4,	%i2
	std	%f26,	[%l7 + 0x18]
	st	%f22,	[%l7 + 0x48]
	fornot1s	%f20,	%f26,	%f26
	movgu	%icc,	%o1,	%g4
	std	%f10,	[%l7 + 0x08]
	smulcc	%i5,	0x0724,	%l0
	fcmpd	%fcc2,	%f24,	%f24
	sdivx	%i7,	0x080F,	%o2
	ld	[%l7 + 0x48],	%f30
	edge16l	%i1,	%l2,	%l5
	or	%i4,	0x0737,	%i6
	edge16l	%l4,	%l6,	%o0
	movrgez	%l1,	0x2BA,	%o6
	movneg	%icc,	%i3,	%o5
	movg	%xcc,	%g5,	%g3
	ldsh	[%l7 + 0x42],	%l3
	fsrc2s	%f23,	%f18
	addccc	%o3,	%o7,	%g6
	sir	0x11F1
	movcs	%icc,	%g1,	%i0
	movrgz	%g2,	0x3B3,	%g7
	ld	[%l7 + 0x34],	%f1
	ldd	[%l7 + 0x78],	%o4
	array16	%o1,	%i2,	%g4
	popc	%i5,	%l0
	orcc	%o2,	%i1,	%l2
	mulx	%i7,	%i4,	%l5
	movgu	%xcc,	%l4,	%i6
	fnands	%f14,	%f9,	%f12
	xnorcc	%o0,	0x1535,	%l6
	fcmple32	%f8,	%f20,	%l1
	sth	%i3,	[%l7 + 0x48]
	stx	%o5,	[%l7 + 0x20]
	ldub	[%l7 + 0x0A],	%g5
	fmovdge	%icc,	%f18,	%f29
	alignaddrl	%o6,	%g3,	%o3
	move	%icc,	%l3,	%g6
	movrgz	%g1,	%i0,	%g2
	fxors	%f1,	%f15,	%f8
	movvc	%xcc,	%o7,	%g7
	std	%f4,	[%l7 + 0x68]
	fmovsvs	%icc,	%f26,	%f15
	fmovs	%f31,	%f6
	edge8l	%o1,	%i2,	%o4
	st	%f24,	[%l7 + 0x18]
	sll	%i5,	%g4,	%l0
	add	%i1,	%l2,	%o2
	movcs	%icc,	%i4,	%l5
	movrne	%l4,	0x2C1,	%i7
	edge16l	%o0,	%i6,	%l1
	smul	%l6,	%o5,	%g5
	sll	%i3,	%g3,	%o6
	move	%xcc,	%o3,	%l3
	umul	%g1,	%i0,	%g6
	edge8ln	%g2,	%g7,	%o1
	mova	%icc,	%o7,	%o4
	sdivx	%i2,	0x05A7,	%g4
	movneg	%icc,	%l0,	%i1
	array32	%l2,	%o2,	%i4
	sra	%i5,	%l5,	%l4
	xnor	%i7,	%i6,	%o0
	array16	%l1,	%o5,	%l6
	fcmpgt16	%f4,	%f6,	%g5
	mulscc	%g3,	0x1FC2,	%o6
	movrlez	%i3,	%l3,	%o3
	movleu	%xcc,	%i0,	%g6
	movvs	%xcc,	%g1,	%g2
	fpadd16s	%f24,	%f8,	%f18
	edge32n	%g7,	%o1,	%o7
	edge16n	%i2,	%g4,	%l0
	sll	%i1,	%o4,	%l2
	udivx	%o2,	0x0C1D,	%i4
	stw	%l5,	[%l7 + 0x24]
	movrgz	%i5,	0x023,	%l4
	edge32n	%i7,	%i6,	%l1
	edge32n	%o5,	%l6,	%g5
	addc	%g3,	0x0A18,	%o0
	movrgz	%o6,	%i3,	%l3
	addc	%o3,	%g6,	%i0
	movrlez	%g1,	%g7,	%o1
	subccc	%o7,	0x1183,	%i2
	save %g4, %g2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l0,	%l2,	%o2
	std	%f14,	[%l7 + 0x38]
	fmovdgu	%icc,	%f26,	%f10
	sll	%i4,	0x0C,	%l5
	edge32l	%i5,	%l4,	%i7
	ldsw	[%l7 + 0x6C],	%i6
	fandnot2s	%f15,	%f15,	%f7
	orn	%l1,	%o5,	%o4
	restore %g5, 0x0C14, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o0,	0x1ED4,	%o6
	movneg	%icc,	%g3,	%i3
	umul	%l3,	0x1C4F,	%o3
	movpos	%xcc,	%i0,	%g1
	edge16l	%g6,	%o1,	%g7
	subc	%i2,	%g4,	%g2
	sdiv	%i1,	0x1179,	%l0
	srax	%l2,	0x12,	%o7
	edge16	%i4,	%o2,	%l5
	movrlz	%l4,	%i5,	%i7
	edge8ln	%l1,	%i6,	%o4
	movrlez	%g5,	%o5,	%o0
	fabss	%f29,	%f20
	xorcc	%l6,	0x1AB9,	%o6
	fone	%f14
	udivcc	%g3,	0x125A,	%i3
	edge32n	%l3,	%o3,	%g1
	addccc	%i0,	0x0C30,	%o1
	sdivcc	%g6,	0x106F,	%i2
	fxnors	%f7,	%f18,	%f7
	movrne	%g7,	%g4,	%g2
	xnorcc	%i1,	%l0,	%l2
	fcmps	%fcc3,	%f8,	%f12
	ldsb	[%l7 + 0x28],	%i4
	fmovsg	%icc,	%f23,	%f28
	ldub	[%l7 + 0x11],	%o2
	movre	%l5,	0x197,	%l4
	addc	%o7,	%i7,	%l1
	alignaddrl	%i6,	%i5,	%g5
	movrlz	%o5,	%o0,	%o4
	fmovdvc	%icc,	%f23,	%f27
	sll	%l6,	0x0F,	%g3
	sub	%i3,	%o6,	%l3
	fpadd32	%f18,	%f18,	%f28
	ldub	[%l7 + 0x4B],	%g1
	udiv	%o3,	0x1B73,	%i0
	fnegs	%f10,	%f18
	fmovdg	%icc,	%f2,	%f3
	udiv	%o1,	0x181B,	%i2
	movne	%xcc,	%g6,	%g4
	sethi	0x05BA,	%g7
	alignaddr	%g2,	%l0,	%l2
	fmovsa	%xcc,	%f24,	%f9
	sdivx	%i4,	0x088B,	%o2
	addc	%i1,	0x1264,	%l5
	save %l4, %o7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f29,	%f7,	%f6
	movg	%xcc,	%i6,	%i7
	sir	0x0443
	ldsh	[%l7 + 0x64],	%i5
	srlx	%o5,	0x0F,	%o0
	subc	%g5,	%o4,	%l6
	fmovde	%icc,	%f0,	%f12
	movrlez	%i3,	%g3,	%l3
	fmovdn	%icc,	%f10,	%f22
	movrlz	%o6,	%o3,	%i0
	lduw	[%l7 + 0x48],	%g1
	orcc	%i2,	%o1,	%g4
	xnorcc	%g7,	0x00C6,	%g6
	sub	%g2,	%l0,	%l2
	lduw	[%l7 + 0x54],	%o2
	movrlz	%i4,	0x2F5,	%l5
	movcc	%icc,	%i1,	%l4
	udivcc	%l1,	0x180E,	%o7
	stb	%i6,	[%l7 + 0x49]
	xor	%i7,	0x1407,	%o5
	fmovdneg	%icc,	%f30,	%f11
	stx	%o0,	[%l7 + 0x30]
	edge8ln	%i5,	%g5,	%l6
	smul	%o4,	0x05E8,	%i3
	fcmped	%fcc0,	%f14,	%f18
	sub	%g3,	%l3,	%o6
	movrne	%o3,	%g1,	%i0
	sth	%o1,	[%l7 + 0x12]
	fnands	%f7,	%f15,	%f26
	orncc	%g4,	0x0313,	%g7
	xorcc	%i2,	0x03EF,	%g6
	movcc	%xcc,	%g2,	%l0
	andn	%o2,	0x0710,	%l2
	movneg	%icc,	%i4,	%l5
	movrgez	%i1,	%l1,	%l4
	edge16n	%o7,	%i7,	%o5
	ldx	[%l7 + 0x68],	%o0
	movrlz	%i5,	0x11A,	%g5
	movvc	%xcc,	%i6,	%l6
	sdivcc	%i3,	0x1A49,	%g3
	fandnot1s	%f6,	%f29,	%f19
	sth	%l3,	[%l7 + 0x72]
	edge8	%o6,	%o3,	%o4
	fors	%f4,	%f12,	%f29
	subcc	%i0,	%o1,	%g4
	add	%g7,	0x1967,	%g1
	subccc	%i2,	0x0502,	%g6
	edge32n	%g2,	%l0,	%l2
	orcc	%i4,	%o2,	%i1
	siam	0x4
	edge32ln	%l5,	%l4,	%l1
	srlx	%o7,	0x0E,	%o5
	fmovdneg	%icc,	%f13,	%f19
	fcmpne32	%f16,	%f20,	%i7
	edge16l	%o0,	%g5,	%i6
	fornot1s	%f24,	%f17,	%f30
	addccc	%i5,	%l6,	%i3
	fcmps	%fcc1,	%f5,	%f18
	fornot1	%f6,	%f6,	%f12
	xnor	%g3,	0x10F3,	%o6
	fornot2s	%f27,	%f18,	%f27
	ldsb	[%l7 + 0x47],	%o3
	movvs	%icc,	%o4,	%i0
	fmovdle	%xcc,	%f13,	%f6
	edge32n	%l3,	%g4,	%o1
	udivx	%g7,	0x07C7,	%g1
	fnot2s	%f10,	%f1
	edge16	%g6,	%g2,	%l0
	fcmpd	%fcc0,	%f16,	%f10
	edge8ln	%i2,	%l2,	%o2
	fmovscs	%icc,	%f22,	%f22
	fmovdpos	%xcc,	%f3,	%f12
	stb	%i1,	[%l7 + 0x6D]
	fandnot1	%f0,	%f6,	%f4
	stx	%l5,	[%l7 + 0x40]
	movcc	%icc,	%l4,	%i4
	popc	0x036F,	%o7
	movg	%icc,	%l1,	%o5
	edge16n	%i7,	%o0,	%g5
	subccc	%i6,	0x0E3B,	%i5
	movn	%xcc,	%i3,	%l6
	stb	%o6,	[%l7 + 0x1B]
	andncc	%g3,	%o3,	%o4
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	movcs	%xcc,	%g4,	%g7
	movl	%xcc,	%o1,	%g6
	movgu	%xcc,	%g2,	%l0
	ldd	[%l7 + 0x10],	%f0
	ldub	[%l7 + 0x26],	%i2
	mulx	%g1,	%o2,	%i1
	udivcc	%l5,	0x1689,	%l2
	andn	%l4,	0x002F,	%o7
	or	%i4,	0x0F7B,	%o5
	movrne	%i7,	%l1,	%g5
	fcmpes	%fcc2,	%f28,	%f19
	stw	%i6,	[%l7 + 0x58]
	edge8l	%i5,	%o0,	%l6
	edge16	%o6,	%g3,	%o3
	ldd	[%l7 + 0x58],	%f30
	fmovsle	%icc,	%f25,	%f0
	mova	%xcc,	%o4,	%i3
	xnorcc	%l3,	%g4,	%g7
	pdist	%f0,	%f16,	%f0
	fmovsn	%icc,	%f18,	%f11
	srlx	%o1,	0x0E,	%g6
	ldsh	[%l7 + 0x2E],	%i0
	movgu	%xcc,	%g2,	%l0
	edge16l	%i2,	%g1,	%i1
	fandnot2s	%f16,	%f23,	%f13
	srlx	%o2,	%l2,	%l5
	fmovrdlez	%o7,	%f4,	%f18
	andcc	%i4,	%o5,	%l4
	fcmpne16	%f8,	%f30,	%l1
	fcmpeq16	%f10,	%f12,	%g5
	srl	%i7,	%i5,	%o0
	nop
	set	0x35, %g5
	stb	%i6,	[%l7 + %g5]
	sdiv	%o6,	0x0E18,	%g3
	sth	%l6,	[%l7 + 0x62]
	array8	%o3,	%o4,	%i3
	array32	%l3,	%g7,	%o1
	addccc	%g6,	0x09B8,	%i0
	movleu	%icc,	%g4,	%l0
	fpsub32s	%f22,	%f3,	%f29
	udivx	%g2,	0x0543,	%i2
	srlx	%i1,	%o2,	%l2
	movl	%icc,	%l5,	%o7
	edge8n	%i4,	%o5,	%l4
	xor	%l1,	%g1,	%g5
	ldd	[%l7 + 0x40],	%f30
	edge8	%i7,	%i5,	%i6
	movle	%xcc,	%o0,	%o6
	fmovsleu	%xcc,	%f19,	%f14
	movge	%xcc,	%l6,	%g3
	subccc	%o4,	%i3,	%l3
	ldsw	[%l7 + 0x54],	%o3
	array16	%o1,	%g7,	%g6
	ldsh	[%l7 + 0x20],	%i0
	fcmple32	%f26,	%f30,	%g4
	stx	%l0,	[%l7 + 0x78]
	movrgez	%g2,	0x078,	%i1
	movl	%icc,	%i2,	%o2
	fsrc2	%f20,	%f12
	restore %l2, 0x161E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i4,	%o7
	srlx	%l4,	0x19,	%o5
	movg	%xcc,	%g1,	%g5
	fpmerge	%f1,	%f13,	%f4
	fnors	%f5,	%f9,	%f4
	ldsb	[%l7 + 0x47],	%l1
	udivx	%i5,	0x1EF9,	%i7
	std	%f24,	[%l7 + 0x18]
	movpos	%xcc,	%i6,	%o6
	mulx	%o0,	%l6,	%o4
	smul	%g3,	0x0907,	%i3
	fmovdcc	%icc,	%f17,	%f2
	movrgez	%o3,	0x171,	%o1
	fmovsgu	%xcc,	%f17,	%f10
	lduh	[%l7 + 0x76],	%g7
	movge	%icc,	%l3,	%g6
	movvc	%icc,	%i0,	%g4
	fcmpgt16	%f24,	%f6,	%g2
	lduw	[%l7 + 0x30],	%l0
	udivx	%i2,	0x03C0,	%i1
	stb	%l2,	[%l7 + 0x09]
	movleu	%icc,	%o2,	%i4
	fnot1	%f8,	%f18
	fmovdne	%xcc,	%f11,	%f22
	fones	%f10
	fnegs	%f4,	%f22
	andcc	%l5,	0x11DC,	%o7
	movle	%icc,	%o5,	%g1
	srax	%l4,	0x17,	%g5
	edge8n	%i5,	%l1,	%i7
	edge8ln	%o6,	%o0,	%l6
	sth	%o4,	[%l7 + 0x32]
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	lduh	[%l7 + 0x34],	%o3
	fmovsgu	%xcc,	%f12,	%f4
	andncc	%i3,	%o1,	%g7
	movleu	%icc,	%l3,	%g6
	xnor	%g4,	%i0,	%g2
	sllx	%l0,	0x1A,	%i1
	std	%f12,	[%l7 + 0x28]
	edge32n	%i2,	%o2,	%l2
	movrlz	%i4,	%o7,	%o5
	stx	%g1,	[%l7 + 0x28]
	umulcc	%l4,	0x18C5,	%g5
	movg	%icc,	%i5,	%l5
	alignaddr	%l1,	%i7,	%o0
	edge32n	%l6,	%o6,	%o4
	movg	%icc,	%i6,	%o3
	edge32ln	%i3,	%o1,	%g7
	fabsd	%f4,	%f0
	movcs	%xcc,	%l3,	%g3
	smulcc	%g4,	0x1741,	%g6
	sdivx	%i0,	0x0B59,	%g2
	st	%f25,	[%l7 + 0x34]
	ldub	[%l7 + 0x31],	%i1
	fmovrdgez	%i2,	%f18,	%f20
	andn	%l0,	%o2,	%l2
	subccc	%o7,	%i4,	%o5
	array8	%g1,	%g5,	%l4
	movge	%xcc,	%l5,	%i5
	lduw	[%l7 + 0x08],	%l1
	movge	%icc,	%i7,	%o0
	edge16	%o6,	%o4,	%i6
	sllx	%o3,	0x0E,	%l6
	fand	%f18,	%f12,	%f20
	fexpand	%f7,	%f30
	orncc	%o1,	0x084E,	%i3
	movre	%l3,	%g7,	%g4
	sethi	0x0E3A,	%g6
	movcs	%xcc,	%g3,	%i0
	movle	%icc,	%i1,	%g2
	edge16ln	%i2,	%o2,	%l0
	smul	%l2,	0x13A4,	%i4
	movrne	%o7,	0x37E,	%g1
	sub	%g5,	%o5,	%l5
	lduh	[%l7 + 0x5C],	%i5
	fmovrdne	%l1,	%f14,	%f18
	ldsb	[%l7 + 0x61],	%i7
	subc	%o0,	0x0E7C,	%o6
	xnor	%l4,	0x1932,	%i6
	andncc	%o3,	%o4,	%l6
	add	%o1,	0x07DC,	%i3
	udivcc	%l3,	0x0A86,	%g7
	fmovrde	%g4,	%f22,	%f24
	array32	%g3,	%g6,	%i1
	sir	0x0B9F
	array16	%g2,	%i0,	%i2
	ldsb	[%l7 + 0x0D],	%l0
	fmul8x16	%f29,	%f24,	%f4
	movl	%icc,	%o2,	%i4
	st	%f5,	[%l7 + 0x38]
	smulcc	%o7,	%g1,	%g5
	fmovrsgz	%l2,	%f20,	%f20
	srl	%o5,	%l5,	%l1
	pdist	%f2,	%f8,	%f26
	move	%xcc,	%i7,	%i5
	ldx	[%l7 + 0x48],	%o6
	stb	%o0,	[%l7 + 0x10]
	ldd	[%l7 + 0x68],	%l4
	move	%xcc,	%o3,	%o4
	restore %l6, %o1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x26],	%i3
	orcc	%l3,	%g4,	%g7
	fpsub32s	%f11,	%f5,	%f12
	ldsb	[%l7 + 0x76],	%g6
	edge16ln	%i1,	%g2,	%g3
	stw	%i2,	[%l7 + 0x30]
	ldsw	[%l7 + 0x14],	%l0
	edge16ln	%o2,	%i4,	%i0
	smulcc	%g1,	0x13C3,	%g5
	addccc	%l2,	0x0EAC,	%o5
	smul	%l5,	0x0C7D,	%l1
	udiv	%o7,	0x1C61,	%i7
	movvs	%xcc,	%i5,	%o0
	ldd	[%l7 + 0x58],	%o6
	orcc	%l4,	%o4,	%o3
	fxor	%f4,	%f28,	%f8
	edge32	%o1,	%l6,	%i6
	ldsw	[%l7 + 0x78],	%l3
	movrlz	%g4,	0x05C,	%g7
	orn	%g6,	%i3,	%g2
	orn	%i1,	%i2,	%g3
	mulscc	%o2,	0x0C81,	%i4
	sdivx	%l0,	0x0F96,	%g1
	movrgz	%g5,	0x0EB,	%l2
	ldsw	[%l7 + 0x18],	%o5
	fabss	%f16,	%f27
	orncc	%l5,	0x0DB8,	%i0
	fmul8sux16	%f2,	%f24,	%f28
	fnegs	%f12,	%f7
	movre	%l1,	0x30B,	%o7
	nop
	set	0x78, %o7
	ldsw	[%l7 + %o7],	%i7
	umul	%i5,	0x0253,	%o0
	movcs	%icc,	%l4,	%o4
	fcmpeq16	%f12,	%f18,	%o6
	st	%f17,	[%l7 + 0x28]
	fnegs	%f11,	%f28
	ldd	[%l7 + 0x38],	%o2
	edge32	%o1,	%l6,	%i6
	orcc	%l3,	%g4,	%g7
	udiv	%g6,	0x0989,	%g2
	fmovsl	%icc,	%f10,	%f28
	udivcc	%i3,	0x0BCD,	%i1
	movrgez	%g3,	0x03E,	%o2
	movneg	%icc,	%i4,	%i2
	alignaddr	%g1,	%l0,	%l2
	move	%icc,	%o5,	%g5
	orcc	%i0,	%l1,	%l5
	edge16l	%o7,	%i5,	%o0
	fnands	%f5,	%f6,	%f10
	fxnors	%f0,	%f26,	%f7
	xor	%l4,	%o4,	%i7
	movgu	%xcc,	%o6,	%o1
	movcs	%icc,	%o3,	%i6
	add	%l3,	%l6,	%g7
	movvc	%icc,	%g4,	%g2
	srl	%g6,	%i1,	%i3
	movre	%o2,	%i4,	%i2
	movre	%g3,	0x1F6,	%g1
	orcc	%l2,	0x19D2,	%l0
	movvc	%xcc,	%o5,	%g5
	edge16ln	%i0,	%l1,	%o7
	edge8n	%i5,	%o0,	%l5
	orcc	%o4,	%i7,	%o6
	fmovdneg	%icc,	%f30,	%f23
	fmovdcc	%xcc,	%f24,	%f18
	ldsh	[%l7 + 0x48],	%l4
	fmovrsgez	%o1,	%f14,	%f29
	edge16n	%o3,	%i6,	%l6
	array16	%g7,	%g4,	%g2
	edge32l	%l3,	%i1,	%i3
	fabsd	%f12,	%f22
	alignaddr	%g6,	%i4,	%i2
	st	%f24,	[%l7 + 0x6C]
	subccc	%g3,	0x0ADD,	%g1
	mova	%xcc,	%l2,	%o2
	move	%xcc,	%l0,	%g5
	edge32n	%o5,	%l1,	%i0
	fabsd	%f10,	%f10
	edge16l	%o7,	%i5,	%o0
	edge32l	%l5,	%i7,	%o4
	fmovrde	%l4,	%f8,	%f30
	fmovrdgz	%o1,	%f2,	%f28
	edge8l	%o3,	%i6,	%o6
	edge16ln	%g7,	%g4,	%l6
	umulcc	%l3,	%i1,	%i3
	fxors	%f14,	%f4,	%f5
	edge32ln	%g6,	%i4,	%g2
	alignaddrl	%g3,	%g1,	%l2
	addcc	%o2,	%l0,	%i2
	movrne	%g5,	0x28E,	%l1
	movcc	%xcc,	%i0,	%o7
	subcc	%o5,	0x18A5,	%i5
	andn	%o0,	%i7,	%o4
	or	%l4,	%l5,	%o3
	movle	%icc,	%i6,	%o1
	add	%g7,	0x08F7,	%o6
	orncc	%g4,	0x020A,	%l3
	fnot1	%f26,	%f30
	edge16ln	%l6,	%i3,	%i1
	std	%f28,	[%l7 + 0x28]
	udivx	%g6,	0x1D90,	%i4
	umul	%g2,	0x1766,	%g1
	save %g3, %o2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i2,	%l0,	%g5
	ldd	[%l7 + 0x28],	%f2
	ldd	[%l7 + 0x40],	%l0
	srlx	%i0,	0x1E,	%o5
	addc	%o7,	0x176A,	%i5
	fmovrsne	%i7,	%f10,	%f10
	edge16	%o4,	%o0,	%l5
	array16	%o3,	%l4,	%i6
	sth	%o1,	[%l7 + 0x54]
	movvc	%icc,	%g7,	%o6
	sdiv	%g4,	0x016F,	%l6
	fmovs	%f19,	%f21
	std	%f18,	[%l7 + 0x30]
	edge32n	%i3,	%l3,	%g6
	subccc	%i1,	0x1B0C,	%i4
	mulx	%g2,	0x14DF,	%g3
	save %g1, 0x11D3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l2,	0x0402,	%l0
	smul	%g5,	0x1FC6,	%i2
	fmovrsne	%l1,	%f17,	%f18
	ldd	[%l7 + 0x30],	%o4
	fmul8x16al	%f24,	%f23,	%f6
	fmovdne	%icc,	%f27,	%f24
	srax	%o7,	%i5,	%i7
	xnorcc	%i0,	%o4,	%l5
	edge32l	%o0,	%o3,	%i6
	movre	%o1,	0x3FF,	%l4
	movne	%xcc,	%o6,	%g7
	fmul8x16au	%f18,	%f28,	%f0
	sdiv	%g4,	0x0848,	%l6
	stx	%i3,	[%l7 + 0x78]
	orcc	%g6,	0x074E,	%i1
	movvs	%icc,	%l3,	%g2
	udiv	%i4,	0x0C0F,	%g3
	udivcc	%g1,	0x0D7B,	%o2
	fmovda	%xcc,	%f18,	%f24
	st	%f14,	[%l7 + 0x44]
	movgu	%icc,	%l2,	%l0
	edge8ln	%g5,	%l1,	%i2
	sdivcc	%o7,	0x0747,	%i5
	fmovrdlez	%i7,	%f30,	%f14
	edge8ln	%o5,	%i0,	%o4
	sll	%l5,	0x14,	%o3
	fornot1	%f12,	%f16,	%f2
	subcc	%i6,	0x03B3,	%o0
	edge16ln	%o1,	%o6,	%g7
	edge8ln	%l4,	%g4,	%l6
	array16	%i3,	%i1,	%g6
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%g2
	sdivcc	%i4,	0x176A,	%g3
	edge8n	%g1,	%l3,	%o2
	fmovdpos	%xcc,	%f30,	%f27
	sub	%l2,	%g5,	%l0
	subccc	%l1,	0x14C7,	%o7
	st	%f2,	[%l7 + 0x68]
	movge	%xcc,	%i5,	%i7
	subc	%o5,	0x0073,	%i0
	movgu	%xcc,	%i2,	%o4
	pdist	%f24,	%f22,	%f0
	subcc	%l5,	0x1F56,	%o3
	umul	%o0,	%i6,	%o1
	andncc	%o6,	%g7,	%g4
	edge16ln	%l6,	%l4,	%i1
	fornot1	%f24,	%f0,	%f6
	movge	%xcc,	%g6,	%i3
	srax	%i4,	0x0C,	%g3
	edge8n	%g1,	%l3,	%o2
	movge	%icc,	%g2,	%g5
	smulcc	%l2,	%l0,	%o7
	fmovdge	%icc,	%f23,	%f25
	fmovrsgez	%i5,	%f23,	%f14
	or	%i7,	0x00C0,	%o5
	orn	%i0,	%l1,	%o4
	fmovsvs	%icc,	%f23,	%f23
	orn	%l5,	0x1018,	%o3
	srax	%o0,	0x1E,	%i2
	or	%o1,	0x1315,	%o6
	fpack16	%f16,	%f16
	mova	%xcc,	%i6,	%g4
	movneg	%icc,	%g7,	%l4
	umulcc	%l6,	0x1206,	%i1
	mulx	%g6,	%i3,	%i4
	fcmpgt16	%f18,	%f10,	%g3
	andncc	%g1,	%l3,	%o2
	add	%g5,	0x06C5,	%l2
	fpack16	%f26,	%f22
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%l0
	sub	%g2,	%i5,	%i7
	srl	%o5,	0x16,	%o7
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	alignaddrl	%o3,	%o0,	%l1
	fsrc1	%f20,	%f16
	srax	%i2,	%o6,	%i6
	fsrc2	%f22,	%f2
	edge8n	%o1,	%g7,	%g4
	popc	0x194D,	%l4
	movpos	%xcc,	%l6,	%g6
	fmovsvc	%icc,	%f9,	%f2
	ldub	[%l7 + 0x55],	%i3
	srl	%i4,	%i1,	%g1
	alignaddrl	%l3,	%o2,	%g3
	orncc	%g5,	%l0,	%l2
	addc	%g2,	%i5,	%i7
	ldsh	[%l7 + 0x18],	%o7
	alignaddrl	%i0,	%o4,	%l5
	stb	%o3,	[%l7 + 0x4C]
	fmovdgu	%xcc,	%f0,	%f11
	ldub	[%l7 + 0x7B],	%o5
	movcc	%xcc,	%l1,	%o0
	edge32ln	%o6,	%i6,	%i2
	stb	%g7,	[%l7 + 0x17]
	movge	%icc,	%o1,	%l4
	ldub	[%l7 + 0x29],	%l6
	ldx	[%l7 + 0x48],	%g4
	addccc	%g6,	0x012E,	%i4
	stx	%i1,	[%l7 + 0x70]
	udiv	%i3,	0x1B4F,	%l3
	umulcc	%g1,	%g3,	%g5
	xorcc	%o2,	0x0563,	%l0
	edge32n	%l2,	%i5,	%g2
	fpsub32	%f8,	%f20,	%f24
	nop
	set	0x20, %o3
	std	%f20,	[%l7 + %o3]
	movvs	%xcc,	%i7,	%i0
	ldsw	[%l7 + 0x44],	%o7
	addcc	%o4,	%l5,	%o3
	std	%f24,	[%l7 + 0x60]
	fmovdgu	%xcc,	%f2,	%f13
	xnorcc	%o5,	0x11EE,	%o0
	movg	%icc,	%o6,	%l1
	lduh	[%l7 + 0x4A],	%i2
	mulx	%i6,	%g7,	%l4
	edge8l	%o1,	%l6,	%g6
	fcmpeq16	%f20,	%f8,	%i4
	edge8ln	%i1,	%i3,	%l3
	xor	%g4,	%g1,	%g3
	edge16l	%o2,	%l0,	%g5
	movl	%icc,	%i5,	%g2
	add	%l2,	0x14BB,	%i7
	movpos	%icc,	%i0,	%o4
	movpos	%icc,	%o7,	%o3
	edge8n	%o5,	%l5,	%o0
	fpsub32	%f12,	%f4,	%f24
	udivcc	%o6,	0x0135,	%i2
	sll	%l1,	0x02,	%g7
	fcmple16	%f28,	%f24,	%i6
	lduh	[%l7 + 0x18],	%l4
	array32	%l6,	%g6,	%i4
	fmovrdlez	%i1,	%f18,	%f24
	edge8ln	%i3,	%l3,	%o1
	andcc	%g4,	0x157D,	%g3
	sth	%o2,	[%l7 + 0x5A]
	ld	[%l7 + 0x0C],	%f6
	movcc	%xcc,	%g1,	%l0
	mulscc	%g5,	%i5,	%l2
	subcc	%g2,	%i0,	%i7
	xorcc	%o7,	%o4,	%o5
	udivcc	%o3,	0x0AB6,	%o0
	bshuffle	%f14,	%f18,	%f18
	xorcc	%o6,	%l5,	%i2
	umulcc	%l1,	0x165C,	%i6
	subc	%g7,	0x1B01,	%l4
	ldx	[%l7 + 0x38],	%g6
	sdivx	%i4,	0x10D8,	%i1
	ldsw	[%l7 + 0x64],	%i3
	stx	%l3,	[%l7 + 0x30]
	edge16l	%o1,	%l6,	%g3
	xor	%o2,	%g1,	%g4
	array8	%l0,	%i5,	%g5
	andn	%g2,	0x197E,	%i0
	srlx	%l2,	0x1F,	%o7
	save %o4, 0x04E6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i7,	%o3
	fabsd	%f6,	%f22
	edge32l	%o0,	%l5,	%o6
	ldub	[%l7 + 0x17],	%l1
	fsrc2s	%f19,	%f6
	movrne	%i2,	0x3D9,	%i6
	fcmpes	%fcc1,	%f6,	%f10
	stw	%g7,	[%l7 + 0x1C]
	andncc	%l4,	%g6,	%i1
	movl	%icc,	%i4,	%i3
	ldd	[%l7 + 0x58],	%f18
	sllx	%l3,	%l6,	%g3
	addccc	%o1,	%o2,	%g4
	sdiv	%g1,	0x0012,	%l0
	restore %i5, 0x10F7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g2,	%l2,	%o7
	movcc	%icc,	%o4,	%o5
	edge8ln	%i0,	%o3,	%o0
	stb	%i7,	[%l7 + 0x65]
	fpadd32s	%f19,	%f10,	%f10
	move	%icc,	%l5,	%l1
	fpackfix	%f30,	%f23
	movrlz	%i2,	0x212,	%o6
	movvc	%icc,	%i6,	%l4
	fandnot2s	%f8,	%f7,	%f22
	fxnors	%f10,	%f1,	%f16
	fmovrsgz	%g6,	%f15,	%f20
	fmovscs	%xcc,	%f21,	%f10
	fmovdge	%icc,	%f14,	%f16
	movre	%g7,	0x254,	%i1
	std	%f22,	[%l7 + 0x30]
	movge	%icc,	%i4,	%l3
	edge8ln	%i3,	%g3,	%l6
	andn	%o1,	0x14C3,	%g4
	fmovdge	%xcc,	%f28,	%f9
	movrlez	%o2,	%l0,	%i5
	add	%g5,	0x03CC,	%g2
	orcc	%l2,	%o7,	%o4
	srlx	%g1,	0x04,	%o5
	umulcc	%o3,	0x1755,	%i0
	srax	%o0,	%l5,	%l1
	fmovdcs	%xcc,	%f26,	%f14
	srax	%i7,	%o6,	%i6
	edge32	%l4,	%i2,	%g7
	orn	%g6,	%i1,	%l3
	nop
	set	0x74, %i0
	ldsw	[%l7 + %i0],	%i4
	fpadd32s	%f21,	%f8,	%f16
	fpadd16	%f0,	%f4,	%f14
	movpos	%xcc,	%i3,	%l6
	bshuffle	%f20,	%f4,	%f0
	ld	[%l7 + 0x60],	%f29
	srax	%o1,	0x0C,	%g4
	ldsh	[%l7 + 0x3A],	%g3
	fmovdge	%icc,	%f7,	%f14
	andn	%o2,	%l0,	%g5
	movvc	%xcc,	%g2,	%i5
	fmovrde	%o7,	%f10,	%f14
	fmovrdlez	%l2,	%f8,	%f6
	udiv	%o4,	0x0FBD,	%o5
	stx	%o3,	[%l7 + 0x48]
	mulx	%i0,	%g1,	%l5
	sdivx	%o0,	0x0E32,	%l1
	sll	%i7,	0x10,	%i6
	fands	%f31,	%f24,	%f27
	subccc	%l4,	%i2,	%o6
	sir	0x18A2
	fmovrde	%g6,	%f24,	%f0
	or	%g7,	%l3,	%i1
	ld	[%l7 + 0x44],	%f0
	ldd	[%l7 + 0x10],	%i2
	movneg	%xcc,	%l6,	%i4
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	addccc	%o2,	0x0ED6,	%l0
	movl	%xcc,	%g5,	%g3
	lduh	[%l7 + 0x6C],	%i5
	save %g2, %o7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o5,	%o3,	%i0
	st	%f19,	[%l7 + 0x14]
	fabss	%f16,	%f18
	sll	%g1,	%l5,	%o4
	movneg	%xcc,	%l1,	%o0
	umulcc	%i7,	0x1027,	%i6
	sub	%l4,	0x0285,	%o6
	srax	%g6,	%g7,	%i2
	and	%l3,	0x0B68,	%i1
	movneg	%xcc,	%l6,	%i3
	add	%o1,	0x0161,	%g4
	nop
	set	0x18, %i2
	ldsh	[%l7 + %i2],	%o2
	movrne	%i4,	%l0,	%g5
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%g3
	movg	%xcc,	%i5,	%o7
	movrgz	%l2,	%o5,	%o3
	fsrc2s	%f28,	%f8
	fmovd	%f6,	%f16
	and	%i0,	0x0018,	%g2
	movl	%xcc,	%g1,	%o4
	addc	%l1,	%o0,	%i7
	fand	%f12,	%f10,	%f0
	addc	%l5,	%l4,	%i6
	fmovdneg	%xcc,	%f5,	%f12
	mulscc	%g6,	0x1E1C,	%o6
	ldd	[%l7 + 0x20],	%f2
	subc	%g7,	%i2,	%l3
	movgu	%icc,	%i1,	%i3
	sdivcc	%o1,	0x08C2,	%l6
	sdiv	%o2,	0x1890,	%i4
	umul	%g4,	0x0681,	%l0
	ldub	[%l7 + 0x7B],	%g5
	ldsh	[%l7 + 0x36],	%i5
	movrlez	%g3,	0x3C4,	%o7
	sub	%l2,	0x0CC0,	%o5
	edge16	%i0,	%g2,	%g1
	fone	%f16
	fmovrde	%o4,	%f30,	%f14
	pdist	%f8,	%f26,	%f12
	edge16l	%l1,	%o3,	%i7
	restore %o0, %l5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l4,	%o6,	%g6
	fmovdpos	%icc,	%f20,	%f21
	fnot2s	%f20,	%f1
	save %i2, 0x1E00, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i1,	%i3,	%o1
	umul	%l3,	0x0A1C,	%o2
	array16	%l6,	%g4,	%i4
	alignaddr	%l0,	%i5,	%g3
	sir	0x1617
	movrne	%o7,	%g5,	%o5
	andncc	%i0,	%l2,	%g2
	srl	%o4,	0x0D,	%l1
	movge	%icc,	%o3,	%g1
	edge32l	%i7,	%l5,	%o0
	ldd	[%l7 + 0x18],	%f26
	movpos	%xcc,	%l4,	%o6
	stw	%g6,	[%l7 + 0x24]
	udivx	%i2,	0x0250,	%i6
	array32	%i1,	%i3,	%o1
	movrlz	%l3,	0x2B6,	%g7
	udivcc	%l6,	0x0AF7,	%o2
	movre	%g4,	%i4,	%l0
	edge8ln	%i5,	%o7,	%g3
	srl	%o5,	0x11,	%g5
	movg	%xcc,	%i0,	%l2
	addc	%g2,	0x0197,	%l1
	fmovrdlez	%o3,	%f4,	%f2
	stx	%g1,	[%l7 + 0x48]
	sub	%i7,	%o4,	%l5
	stb	%l4,	[%l7 + 0x3C]
	alignaddrl	%o0,	%g6,	%o6
	lduw	[%l7 + 0x14],	%i6
	movleu	%xcc,	%i2,	%i3
	edge32	%o1,	%l3,	%i1
	srlx	%g7,	%o2,	%l6
	fmovrdlez	%g4,	%f8,	%f16
	movrgez	%l0,	0x249,	%i4
	udivx	%i5,	0x0A62,	%o7
	xnorcc	%g3,	%g5,	%i0
	array32	%o5,	%l2,	%l1
	fnot1s	%f5,	%f11
	movn	%icc,	%g2,	%g1
	fpsub32	%f18,	%f28,	%f4
	subc	%i7,	0x1AA2,	%o3
	movgu	%xcc,	%l5,	%o4
	fmovdvs	%xcc,	%f22,	%f20
	fandnot2s	%f27,	%f22,	%f3
	andncc	%l4,	%g6,	%o0
	edge16	%i6,	%i2,	%i3
	lduw	[%l7 + 0x48],	%o6
	movle	%icc,	%o1,	%l3
	smul	%g7,	0x1DFE,	%o2
	ldx	[%l7 + 0x60],	%l6
	for	%f4,	%f14,	%f30
	fmovsneg	%xcc,	%f25,	%f19
	sir	0x05E3
	fcmpgt16	%f18,	%f24,	%g4
	movg	%icc,	%l0,	%i4
	srax	%i5,	%i1,	%o7
	sra	%g5,	0x1F,	%g3
	movrne	%i0,	0x090,	%l2
	movgu	%xcc,	%l1,	%g2
	nop
	set	0x31, %i7
	ldsb	[%l7 + %i7],	%g1
	mulscc	%o5,	0x0B4E,	%o3
	andncc	%l5,	%i7,	%l4
	sdivx	%g6,	0x0B2F,	%o0
	subc	%i6,	0x052C,	%i2
	fandnot2s	%f11,	%f13,	%f20
	movpos	%xcc,	%o4,	%o6
	addccc	%o1,	%l3,	%i3
	movpos	%icc,	%o2,	%l6
	subc	%g4,	%l0,	%g7
	save %i5, 0x08D8, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i1,	%g5,	%o7
	edge8l	%i0,	%l2,	%l1
	movn	%xcc,	%g3,	%g2
	movge	%xcc,	%o5,	%o3
	edge32ln	%g1,	%l5,	%l4
	subc	%g6,	%o0,	%i7
	xorcc	%i2,	0x106B,	%i6
	fmovsa	%xcc,	%f7,	%f19
	fornot1s	%f13,	%f8,	%f9
	mulscc	%o4,	0x0A7F,	%o1
	nop
	set	0x3C, %o5
	ldsw	[%l7 + %o5],	%o6
	fcmpne16	%f20,	%f4,	%i3
	fxors	%f23,	%f10,	%f13
	stw	%l3,	[%l7 + 0x08]
	subcc	%l6,	%g4,	%l0
	smulcc	%g7,	%i5,	%i4
	movg	%xcc,	%i1,	%o2
	xnor	%o7,	%i0,	%l2
	fandnot2s	%f30,	%f4,	%f11
	edge8ln	%g5,	%l1,	%g3
	andn	%o5,	%g2,	%o3
	andncc	%g1,	%l5,	%l4
	fnegd	%f22,	%f22
	andncc	%o0,	%i7,	%i2
	umulcc	%g6,	%o4,	%i6
	or	%o6,	0x1062,	%o1
	array16	%i3,	%l6,	%l3
	fmovsgu	%xcc,	%f12,	%f25
	lduh	[%l7 + 0x6A],	%l0
	srl	%g4,	0x18,	%i5
	nop
	set	0x0B, %o1
	ldub	[%l7 + %o1],	%i4
	nop
	set	0x5C, %o4
	sth	%g7,	[%l7 + %o4]
	faligndata	%f6,	%f2,	%f16
	mulx	%i1,	%o7,	%i0
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	srlx	%g3,	%g5,	%g2
	lduw	[%l7 + 0x14],	%o3
	sethi	0x01BF,	%g1
	fxor	%f30,	%f18,	%f16
	lduw	[%l7 + 0x24],	%l5
	movrgz	%o5,	%l4,	%o0
	fcmpgt16	%f20,	%f30,	%i7
	fmovdge	%xcc,	%f16,	%f6
	edge8	%i2,	%g6,	%o4
	or	%o6,	0x1A3D,	%o1
	bshuffle	%f14,	%f24,	%f0
	fnot1s	%f12,	%f9
	fmovdl	%icc,	%f14,	%f12
	fpackfix	%f12,	%f8
	sth	%i3,	[%l7 + 0x0C]
	edge8	%l6,	%i6,	%l0
	fmovdl	%xcc,	%f0,	%f13
	mulx	%g4,	%i5,	%l3
	movle	%xcc,	%g7,	%i1
	fmovda	%xcc,	%f23,	%f16
	mulx	%i4,	0x1A1A,	%o7
	orncc	%l2,	%o2,	%l1
	fnot1	%f14,	%f20
	edge8n	%i0,	%g3,	%g2
	fnors	%f15,	%f19,	%f17
	edge32n	%g5,	%o3,	%l5
	fmovrsgez	%g1,	%f6,	%f25
	fxors	%f27,	%f22,	%f8
	movvs	%xcc,	%o5,	%l4
	fmovda	%icc,	%f4,	%f10
	movneg	%xcc,	%o0,	%i2
	xnor	%i7,	%o4,	%g6
	udiv	%o6,	0x03A9,	%i3
	movgu	%xcc,	%l6,	%i6
	edge32l	%l0,	%g4,	%o1
	edge8n	%i5,	%l3,	%i1
	andncc	%i4,	%g7,	%o7
	add	%o2,	%l2,	%i0
	fmovrsgez	%l1,	%f4,	%f7
	stx	%g2,	[%l7 + 0x40]
	nop
	set	0x34, %o2
	ldsh	[%l7 + %o2],	%g3
	smulcc	%o3,	%g5,	%g1
	edge16ln	%l5,	%l4,	%o5
	orcc	%i2,	0x03FD,	%o0
	edge8	%i7,	%o4,	%g6
	movge	%icc,	%i3,	%o6
	edge16ln	%i6,	%l0,	%g4
	for	%f0,	%f4,	%f30
	sub	%o1,	0x1A32,	%i5
	fcmped	%fcc3,	%f0,	%f18
	udiv	%l6,	0x151D,	%i1
	fandnot1s	%f15,	%f22,	%f14
	fone	%f22
	umul	%l3,	0x10AE,	%i4
	fmul8sux16	%f22,	%f22,	%f0
	fsrc2	%f4,	%f4
	umul	%o7,	0x08FC,	%o2
	fmovsa	%xcc,	%f5,	%f13
	edge16l	%l2,	%i0,	%l1
	stb	%g7,	[%l7 + 0x4C]
	fmovrse	%g2,	%f21,	%f15
	edge16l	%o3,	%g3,	%g1
	movleu	%icc,	%g5,	%l4
	xorcc	%l5,	0x0C93,	%i2
	fandnot1s	%f23,	%f2,	%f15
	fornot1s	%f0,	%f1,	%f19
	movle	%icc,	%o5,	%o0
	sllx	%o4,	0x01,	%g6
	movle	%icc,	%i3,	%i7
	fpsub16	%f22,	%f22,	%f30
	fmovspos	%icc,	%f13,	%f23
	fmovsne	%xcc,	%f7,	%f1
	addcc	%o6,	0x1205,	%l0
	lduw	[%l7 + 0x60],	%g4
	movl	%icc,	%o1,	%i6
	fcmple16	%f12,	%f4,	%i5
	fmovscs	%xcc,	%f5,	%f16
	movrlez	%l6,	0x3CD,	%l3
	ldd	[%l7 + 0x50],	%i0
	edge8n	%i4,	%o2,	%l2
	movne	%icc,	%o7,	%l1
	edge8l	%g7,	%g2,	%o3
	pdist	%f30,	%f4,	%f8
	ldsw	[%l7 + 0x30],	%i0
	alignaddrl	%g3,	%g1,	%g5
	udivcc	%l5,	0x10F1,	%i2
	ldd	[%l7 + 0x28],	%o4
	edge32l	%l4,	%o0,	%o4
	movvc	%xcc,	%i3,	%i7
	edge8n	%o6,	%g6,	%l0
	xnor	%o1,	0x1074,	%g4
	edge8	%i5,	%l6,	%i6
	movcc	%xcc,	%i1,	%l3
	edge32n	%o2,	%l2,	%o7
	movre	%i4,	%g7,	%l1
	nop
	set	0x24, %g2
	sth	%g2,	[%l7 + %g2]
	or	%o3,	%i0,	%g1
	udivx	%g3,	0x175E,	%g5
	fnot2s	%f28,	%f26
	fnands	%f31,	%f13,	%f24
	movcc	%xcc,	%l5,	%i2
	sdivcc	%o5,	0x0C0A,	%l4
	xnorcc	%o4,	%o0,	%i7
	movl	%icc,	%o6,	%g6
	andncc	%i3,	%o1,	%l0
	stx	%i5,	[%l7 + 0x78]
	fmovdneg	%xcc,	%f1,	%f9
	srax	%g4,	0x09,	%i6
	movre	%l6,	0x10A,	%i1
	fornot2s	%f22,	%f9,	%f31
	andn	%o2,	%l3,	%o7
	movle	%icc,	%l2,	%i4
	subc	%l1,	%g2,	%o3
	movvs	%icc,	%g7,	%i0
	movneg	%icc,	%g3,	%g1
	movvs	%icc,	%g5,	%i2
	srlx	%o5,	0x03,	%l5
	orn	%o4,	0x1B0D,	%o0
	fnegs	%f26,	%f9
	orn	%i7,	0x10A0,	%o6
	ld	[%l7 + 0x74],	%f6
	orn	%g6,	%l4,	%o1
	fones	%f11
	xorcc	%l0,	%i5,	%i3
	movrlz	%g4,	%i6,	%l6
	ldsw	[%l7 + 0x40],	%i1
	sdivx	%o2,	0x0065,	%l3
	movrlez	%o7,	0x373,	%l2
	movne	%icc,	%i4,	%g2
	fxors	%f23,	%f17,	%f17
	array32	%o3,	%g7,	%i0
	fmovd	%f8,	%f20
	movneg	%icc,	%g3,	%l1
	movrgez	%g1,	%i2,	%o5
	movl	%icc,	%g5,	%o4
	udiv	%o0,	0x10EF,	%i7
	sra	%o6,	%l5,	%g6
	sll	%l4,	%l0,	%i5
	movre	%o1,	%g4,	%i3
	addc	%i6,	%i1,	%o2
	move	%xcc,	%l3,	%o7
	ldd	[%l7 + 0x78],	%f18
	stx	%l6,	[%l7 + 0x20]
	edge16l	%l2,	%g2,	%o3
	std	%f8,	[%l7 + 0x40]
	fmovdn	%xcc,	%f23,	%f2
	edge16l	%g7,	%i0,	%i4
	orcc	%g3,	0x014E,	%g1
	movl	%icc,	%i2,	%l1
	movpos	%xcc,	%o5,	%g5
	save %o4, 0x0C30, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o0,	[%l7 + 0x34]
	fpsub16s	%f27,	%f28,	%f10
	movrgez	%o6,	%g6,	%l4
	subcc	%l0,	%i5,	%o1
	umulcc	%g4,	0x19A9,	%l5
	mulx	%i6,	%i3,	%i1
	edge32l	%o2,	%l3,	%o7
	sdivcc	%l6,	0x1583,	%g2
	edge16ln	%l2,	%o3,	%i0
	alignaddrl	%i4,	%g7,	%g3
	sdivx	%i2,	0x1A8C,	%l1
	edge16n	%g1,	%o5,	%o4
	sra	%i7,	0x05,	%g5
	sllx	%o6,	0x1E,	%o0
	sra	%g6,	0x00,	%l0
	movge	%xcc,	%i5,	%l4
	edge32ln	%o1,	%l5,	%g4
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f0
	nop
	set	0x48, %l3
	lduw	[%l7 + %l3],	%i3
	fnors	%f16,	%f11,	%f25
	for	%f12,	%f28,	%f8
	ldx	[%l7 + 0x78],	%i6
	movrlz	%i1,	0x312,	%l3
	sdivx	%o2,	0x08BC,	%l6
	movn	%xcc,	%o7,	%g2
	movne	%xcc,	%o3,	%i0
	movrlez	%l2,	%i4,	%g3
	ldx	[%l7 + 0x28],	%g7
	orcc	%l1,	0x0365,	%i2
	fcmpeq16	%f20,	%f10,	%o5
	fmuld8sux16	%f3,	%f23,	%f30
	andn	%o4,	%i7,	%g1
	and	%g5,	0x1992,	%o0
	fmovsleu	%icc,	%f8,	%f6
	array16	%g6,	%o6,	%l0
	ldsb	[%l7 + 0x70],	%i5
	sra	%l4,	%l5,	%o1
	ldub	[%l7 + 0x1E],	%g4
	sir	0x04C1
	fandnot2	%f10,	%f12,	%f12
	movne	%xcc,	%i6,	%i3
	fmul8x16au	%f4,	%f6,	%f30
	move	%icc,	%i1,	%o2
	fornot1	%f10,	%f28,	%f18
	umulcc	%l3,	%o7,	%l6
	movrgz	%g2,	0x0EF,	%i0
	udivx	%o3,	0x187A,	%i4
	fmovrslez	%g3,	%f30,	%f16
	movg	%xcc,	%g7,	%l2
	fpsub32	%f4,	%f22,	%f2
	sdivcc	%i2,	0x0805,	%o5
	fcmpne32	%f2,	%f2,	%o4
	movl	%icc,	%i7,	%l1
	restore %g5, %o0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f22,	%f10,	%f8
	edge16n	%o6,	%g1,	%l0
	fmovrslz	%l4,	%f30,	%f15
	movcc	%icc,	%l5,	%i5
	movrgz	%o1,	0x1F8,	%i6
	edge32l	%g4,	%i1,	%i3
	sir	0x1A68
	addc	%o2,	%o7,	%l3
	udivx	%l6,	0x04E3,	%i0
	smul	%g2,	0x069F,	%i4
	movle	%xcc,	%g3,	%o3
	movpos	%xcc,	%g7,	%i2
	sdivcc	%o5,	0x0BC3,	%l2
	ldsw	[%l7 + 0x18],	%i7
	movvc	%xcc,	%o4,	%g5
	movrgez	%l1,	0x143,	%g6
	sdivx	%o0,	0x0D62,	%o6
	movg	%xcc,	%g1,	%l4
	addcc	%l0,	%i5,	%o1
	movneg	%icc,	%l5,	%g4
	movrne	%i1,	%i6,	%o2
	stw	%o7,	[%l7 + 0x10]
	orncc	%l3,	%i3,	%l6
	ldub	[%l7 + 0x3E],	%i0
	fandnot2s	%f16,	%f14,	%f7
	fones	%f30
	movgu	%xcc,	%g2,	%g3
	stx	%i4,	[%l7 + 0x08]
	edge32ln	%o3,	%i2,	%g7
	ldx	[%l7 + 0x70],	%o5
	sth	%l2,	[%l7 + 0x74]
	ldsh	[%l7 + 0x0A],	%o4
	edge16	%i7,	%l1,	%g5
	fmovsne	%icc,	%f21,	%f27
	sll	%g6,	%o6,	%o0
	fnegd	%f28,	%f26
	movvs	%icc,	%l4,	%l0
	fmovdcc	%xcc,	%f25,	%f1
	subc	%g1,	%i5,	%o1
	fmovdvc	%icc,	%f28,	%f27
	sth	%g4,	[%l7 + 0x1C]
	pdist	%f20,	%f28,	%f0
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	save %o7, %l5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l3,	0x17,	%i0
	array16	%g2,	%l6,	%g3
	edge16l	%i4,	%i2,	%o3
	udivcc	%g7,	0x0593,	%l2
	edge32n	%o4,	%i7,	%o5
	fpsub16s	%f22,	%f5,	%f1
	andncc	%l1,	%g6,	%o6
	xnor	%o0,	%l4,	%g5
	addccc	%g1,	%i5,	%l0
	movg	%icc,	%o1,	%g4
	orcc	%i6,	0x0FFD,	%o2
	move	%icc,	%o7,	%l5
	alignaddrl	%i3,	%l3,	%i0
	fors	%f23,	%f25,	%f20
	subccc	%g2,	0x1C6F,	%l6
	movpos	%icc,	%i1,	%i4
	andn	%i2,	%g3,	%g7
	stb	%l2,	[%l7 + 0x1B]
	addc	%o4,	%o3,	%i7
	fmovsne	%xcc,	%f4,	%f5
	addcc	%o5,	%l1,	%o6
	fmovsle	%xcc,	%f0,	%f27
	sir	0x11E5
	edge8n	%o0,	%l4,	%g6
	stw	%g5,	[%l7 + 0x14]
	movre	%i5,	%g1,	%l0
	edge16n	%o1,	%g4,	%o2
	smul	%i6,	%l5,	%i3
	stx	%o7,	[%l7 + 0x78]
	sdiv	%l3,	0x179D,	%i0
	ldub	[%l7 + 0x21],	%g2
	sdivx	%l6,	0x1E6C,	%i1
	sdiv	%i4,	0x037A,	%g3
	edge16l	%g7,	%i2,	%o4
	fmul8sux16	%f2,	%f26,	%f8
	movleu	%icc,	%l2,	%i7
	edge16l	%o3,	%l1,	%o6
	sth	%o5,	[%l7 + 0x44]
	ldx	[%l7 + 0x48],	%l4
	move	%icc,	%o0,	%g5
	andn	%g6,	0x0DB4,	%i5
	andcc	%l0,	%o1,	%g1
	fmovde	%icc,	%f8,	%f7
	add	%o2,	0x059A,	%g4
	movneg	%xcc,	%i6,	%i3
	addcc	%l5,	%o7,	%l3
	andcc	%i0,	%l6,	%i1
	fmovrdgez	%g2,	%f22,	%f8
	edge16ln	%i4,	%g7,	%g3
	stb	%i2,	[%l7 + 0x75]
	array8	%l2,	%i7,	%o4
	alignaddrl	%l1,	%o6,	%o3
	movg	%xcc,	%l4,	%o5
	udivcc	%o0,	0x0C62,	%g6
	udiv	%g5,	0x1D06,	%l0
	movvc	%xcc,	%i5,	%g1
	lduh	[%l7 + 0x62],	%o2
	ldsh	[%l7 + 0x62],	%g4
	bshuffle	%f8,	%f2,	%f2
	lduh	[%l7 + 0x18],	%o1
	stb	%i3,	[%l7 + 0x1E]
	array16	%i6,	%o7,	%l3
	umulcc	%i0,	0x189B,	%l5
	edge32l	%l6,	%i1,	%i4
	alignaddrl	%g2,	%g3,	%i2
	movcc	%icc,	%l2,	%g7
	alignaddr	%i7,	%l1,	%o4
	xor	%o6,	0x0397,	%o3
	fpmerge	%f25,	%f28,	%f26
	xor	%o5,	0x1627,	%o0
	addccc	%g6,	%g5,	%l4
	sdivcc	%i5,	0x046C,	%g1
	mulx	%l0,	0x0280,	%o2
	xorcc	%o1,	0x0BDA,	%g4
	smulcc	%i6,	0x04FC,	%i3
	edge32ln	%o7,	%i0,	%l3
	alignaddrl	%l5,	%l6,	%i1
	fsrc1s	%f8,	%f28
	movn	%xcc,	%i4,	%g2
	smul	%g3,	%i2,	%g7
	edge16l	%i7,	%l1,	%l2
	fmovdge	%xcc,	%f23,	%f0
	movneg	%xcc,	%o6,	%o3
	addccc	%o4,	0x040C,	%o5
	ldub	[%l7 + 0x5A],	%g6
	ldsw	[%l7 + 0x78],	%o0
	fpsub16s	%f14,	%f7,	%f9
	edge8ln	%g5,	%l4,	%g1
	sll	%l0,	%o2,	%i5
	sethi	0x1162,	%g4
	ldd	[%l7 + 0x18],	%i6
	fmovdcs	%xcc,	%f31,	%f10
	edge8ln	%i3,	%o1,	%i0
	edge16l	%l3,	%o7,	%l6
	stw	%l5,	[%l7 + 0x3C]
	movvs	%xcc,	%i4,	%g2
	edge8n	%i1,	%g3,	%i2
	subcc	%g7,	0x1E42,	%i7
	fnot1s	%f20,	%f17
	add	%l2,	%l1,	%o3
	fabsd	%f26,	%f0
	lduw	[%l7 + 0x78],	%o4
	popc	%o5,	%g6
	movre	%o0,	0x1D5,	%g5
	edge32n	%l4,	%o6,	%g1
	stx	%o2,	[%l7 + 0x10]
	addcc	%l0,	0x0C07,	%g4
	srlx	%i5,	%i6,	%i3
	add	%o1,	0x17B5,	%l3
	movgu	%icc,	%i0,	%o7
	orn	%l6,	0x1727,	%i4
	edge8	%g2,	%l5,	%i1
	sdivx	%i2,	0x1EC7,	%g3
	udivx	%g7,	0x02FE,	%l2
	array16	%l1,	%o3,	%i7
	stx	%o4,	[%l7 + 0x08]
	movrlz	%o5,	%g6,	%o0
	subcc	%g5,	%o6,	%l4
	movrlez	%o2,	0x130,	%l0
	xnorcc	%g1,	%i5,	%g4
	ldd	[%l7 + 0x38],	%f2
	movg	%xcc,	%i3,	%o1
	nop
	set	0x32, %i6
	ldsh	[%l7 + %i6],	%l3
	popc	%i0,	%o7
	srlx	%i6,	0x0F,	%l6
	udiv	%i4,	0x105B,	%l5
	movg	%icc,	%g2,	%i1
	andcc	%g3,	%i2,	%g7
	srlx	%l1,	0x09,	%l2
	sdiv	%i7,	0x02DE,	%o3
	edge8l	%o5,	%g6,	%o4
	orcc	%g5,	0x0E5D,	%o0
	movge	%icc,	%l4,	%o2
	fmul8ulx16	%f6,	%f28,	%f4
	fmovscc	%xcc,	%f24,	%f0
	sir	0x1F93
	fmovspos	%icc,	%f26,	%f29
	stx	%o6,	[%l7 + 0x28]
	stb	%g1,	[%l7 + 0x13]
	udivx	%i5,	0x1F3B,	%g4
	sub	%l0,	0x14E0,	%i3
	restore %l3, %o1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i0,	%i6,	%l6
	fmovsg	%icc,	%f22,	%f19
	xnor	%i4,	0x014B,	%g2
	std	%f18,	[%l7 + 0x58]
	srl	%l5,	%g3,	%i1
	fnot1s	%f25,	%f0
	sth	%i2,	[%l7 + 0x2E]
	fxnor	%f4,	%f20,	%f2
	st	%f6,	[%l7 + 0x1C]
	movg	%icc,	%l1,	%g7
	lduh	[%l7 + 0x70],	%l2
	fmovse	%icc,	%f30,	%f15
	edge32	%o3,	%o5,	%i7
	umulcc	%g6,	0x09BE,	%o4
	edge16n	%g5,	%o0,	%l4
	fxnors	%f24,	%f0,	%f26
	movcs	%icc,	%o6,	%g1
	udivcc	%i5,	0x0597,	%g4
	alignaddr	%o2,	%i3,	%l3
	xnor	%l0,	0x0E4C,	%o7
	mova	%xcc,	%i0,	%o1
	edge8l	%l6,	%i4,	%g2
	edge16ln	%i6,	%g3,	%i1
	sth	%l5,	[%l7 + 0x22]
	edge8ln	%l1,	%i2,	%g7
	movle	%icc,	%o3,	%l2
	mulx	%i7,	%o5,	%o4
	fmovrdgz	%g6,	%f28,	%f12
	addccc	%o0,	0x13AE,	%g5
	smulcc	%o6,	%g1,	%i5
	sll	%g4,	%o2,	%l4
	movn	%xcc,	%l3,	%l0
	array16	%o7,	%i0,	%o1
	edge32ln	%l6,	%i4,	%g2
	fsrc1s	%f11,	%f16
	fmovd	%f2,	%f12
	fpsub32	%f20,	%f8,	%f2
	fandnot1s	%f12,	%f26,	%f11
	fmovsa	%xcc,	%f3,	%f7
	xor	%i6,	%i3,	%g3
	subc	%i1,	0x1266,	%l5
	sdivx	%i2,	0x1DE6,	%g7
	stb	%o3,	[%l7 + 0x68]
	xor	%l2,	0x048A,	%i7
	fxnors	%f6,	%f18,	%f12
	nop
	set	0x20, %o6
	stx	%l1,	[%l7 + %o6]
	array32	%o4,	%g6,	%o0
	movrlz	%g5,	%o5,	%g1
	fmuld8sux16	%f10,	%f27,	%f0
	movrne	%i5,	%g4,	%o6
	orcc	%l4,	%l3,	%l0
	or	%o2,	0x19FC,	%o7
	movrne	%o1,	%l6,	%i4
	st	%f6,	[%l7 + 0x14]
	sth	%g2,	[%l7 + 0x4C]
	umul	%i6,	0x1F87,	%i0
	fpadd32	%f8,	%f18,	%f4
	stx	%g3,	[%l7 + 0x50]
	movpos	%xcc,	%i1,	%i3
	ld	[%l7 + 0x0C],	%f22
	umul	%i2,	%g7,	%o3
	sth	%l5,	[%l7 + 0x30]
	lduw	[%l7 + 0x3C],	%i7
	edge32l	%l2,	%l1,	%g6
	movcc	%xcc,	%o0,	%o4
	edge32ln	%o5,	%g1,	%i5
	orcc	%g5,	0x0DD4,	%g4
	movneg	%icc,	%l4,	%l3
	fnot2s	%f19,	%f13
	movpos	%icc,	%l0,	%o2
	std	%f10,	[%l7 + 0x68]
	array32	%o6,	%o7,	%l6
	movleu	%xcc,	%o1,	%i4
	save %i6, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f13
	edge8	%i0,	%i3,	%i1
	sll	%g7,	0x13,	%o3
	mova	%xcc,	%i2,	%i7
	ldsb	[%l7 + 0x20],	%l2
	orn	%l1,	%l5,	%o0
	fmovdle	%icc,	%f5,	%f9
	save %o4, %o5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i5,	%g5,	%g4
	sdivcc	%g6,	0x1516,	%l3
	and	%l0,	0x1712,	%o2
	sll	%l4,	0x11,	%o7
	fpadd16	%f0,	%f28,	%f12
	or	%o6,	0x1C8A,	%l6
	mulscc	%i4,	%o1,	%i6
	fnot2s	%f0,	%f3
	addc	%g2,	0x0920,	%i0
	addc	%g3,	0x0628,	%i1
	xor	%g7,	%i3,	%i2
	sllx	%i7,	%o3,	%l1
	movpos	%icc,	%l2,	%l5
	alignaddrl	%o4,	%o5,	%g1
	movre	%o0,	0x296,	%g5
	fcmped	%fcc1,	%f12,	%f24
	bshuffle	%f20,	%f30,	%f4
	sub	%i5,	%g6,	%l3
	fabss	%f11,	%f27
	addccc	%l0,	0x1CB8,	%g4
	mulx	%o2,	0x12C6,	%o7
	popc	%o6,	%l4
	stw	%l6,	[%l7 + 0x38]
	movgu	%icc,	%o1,	%i6
	array8	%g2,	%i4,	%i0
	fpack32	%f10,	%f22,	%f22
	ldd	[%l7 + 0x20],	%i0
	umulcc	%g3,	%i3,	%i2
	movn	%xcc,	%i7,	%o3
	smulcc	%l1,	0x144E,	%l2
	stx	%g7,	[%l7 + 0x40]
	lduw	[%l7 + 0x30],	%l5
	ldsb	[%l7 + 0x22],	%o5
	fcmple32	%f22,	%f24,	%o4
	movneg	%icc,	%o0,	%g1
	ldsh	[%l7 + 0x24],	%i5
	array16	%g5,	%l3,	%l0
	movcc	%xcc,	%g6,	%o2
	sll	%o7,	%g4,	%l4
	alignaddrl	%o6,	%o1,	%i6
	addcc	%l6,	0x0DE2,	%i4
	movrgz	%i0,	0x316,	%i1
	fmovsvc	%xcc,	%f31,	%f29
	faligndata	%f8,	%f8,	%f8
	ld	[%l7 + 0x5C],	%f13
	sub	%g2,	%g3,	%i3
	smul	%i2,	0x1F63,	%o3
	fmovrslz	%i7,	%f29,	%f25
	movvs	%icc,	%l2,	%l1
	sdivcc	%l5,	0x0FB8,	%g7
	edge32n	%o4,	%o0,	%o5
	mulscc	%i5,	0x0576,	%g1
	umulcc	%g5,	%l0,	%l3
	fmovdcc	%icc,	%f22,	%f20
	movrne	%o2,	0x221,	%g6
	udiv	%g4,	0x1489,	%l4
	mulx	%o7,	%o1,	%i6
	lduw	[%l7 + 0x14],	%l6
	andn	%o6,	%i4,	%i1
	stx	%g2,	[%l7 + 0x40]
	movvs	%icc,	%i0,	%i3
	fmovsa	%xcc,	%f19,	%f27
	edge16l	%g3,	%i2,	%o3
	edge16l	%l2,	%i7,	%l5
	fmovrsgz	%l1,	%f21,	%f19
	movre	%g7,	0x134,	%o4
	edge32	%o5,	%o0,	%i5
	movvs	%xcc,	%g5,	%l0
	and	%l3,	0x0E0A,	%o2
	fnot2s	%f26,	%f22
	add	%g1,	0x1C7C,	%g6
	save %g4, %o7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%i6,	%l4
	smul	%o6,	0x11A9,	%i4
	nop
	set	0x60, %l1
	stx	%i1,	[%l7 + %l1]
	sethi	0x0F7E,	%g2
	sdiv	%i0,	0x1705,	%l6
	alignaddrl	%g3,	%i2,	%o3
	fexpand	%f17,	%f24
	fmovsvc	%icc,	%f4,	%f23
	movcc	%xcc,	%i3,	%l2
	movgu	%icc,	%l5,	%l1
	movrlz	%g7,	0x32A,	%i7
	orn	%o5,	0x1941,	%o0
	andn	%i5,	0x1624,	%o4
	stx	%l0,	[%l7 + 0x50]
	movrne	%g5,	0x0D2,	%o2
	save %g1, 0x169C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l3,	0x02FA,	%o7
	xnor	%o1,	%g4,	%i6
	movcc	%icc,	%l4,	%i4
	fmuld8ulx16	%f22,	%f22,	%f24
	fpsub32s	%f10,	%f30,	%f24
	fmovsg	%xcc,	%f4,	%f6
	orncc	%i1,	%o6,	%g2
	fpackfix	%f18,	%f26
	movleu	%xcc,	%l6,	%g3
	movrlz	%i2,	0x1A7,	%i0
	orncc	%o3,	%l2,	%l5
	fand	%f14,	%f8,	%f16
	srl	%i3,	0x1D,	%l1
	ldub	[%l7 + 0x11],	%i7
	sethi	0x1D76,	%o5
	edge8n	%o0,	%i5,	%g7
	fmovdle	%xcc,	%f29,	%f17
	add	%l0,	%o4,	%g5
	sub	%o2,	%g6,	%g1
	subcc	%l3,	0x18CB,	%o1
	movrne	%o7,	%i6,	%l4
	fmovrsne	%i4,	%f25,	%f4
	andcc	%g4,	%i1,	%g2
	sub	%l6,	0x1DAB,	%o6
	ldub	[%l7 + 0x4A],	%i2
	ldx	[%l7 + 0x38],	%i0
	ldd	[%l7 + 0x50],	%o2
	umulcc	%l2,	0x0AD2,	%l5
	udiv	%i3,	0x1AB3,	%l1
	fnand	%f30,	%f26,	%f2
	stx	%g3,	[%l7 + 0x60]
	mulx	%o5,	%o0,	%i7
	movne	%icc,	%i5,	%l0
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	sll	%o2,	%g1,	%l3
	nop
	set	0x1C, %g7
	ldsw	[%l7 + %g7],	%o1
	ldub	[%l7 + 0x60],	%o7
	sll	%i6,	%g6,	%i4
	fmovs	%f27,	%f2
	orncc	%l4,	%i1,	%g4
	movrgez	%l6,	%g2,	%i2
	fmovdneg	%xcc,	%f26,	%f5
	movneg	%xcc,	%o6,	%o3
	movre	%l2,	0x353,	%i0
	movneg	%icc,	%l5,	%l1
	fmovd	%f30,	%f18
	movre	%g3,	%o5,	%i3
	sra	%i7,	%i5,	%o0
	udivcc	%g7,	0x18D7,	%l0
	smul	%g5,	0x1DDE,	%o2
	andn	%o4,	0x1A9D,	%g1
	addccc	%o1,	0x1FA8,	%l3
	movg	%icc,	%o7,	%i6
	fmovrse	%i4,	%f9,	%f2
	fmovscc	%xcc,	%f13,	%f8
	sll	%l4,	0x18,	%i1
	andn	%g4,	0x0E88,	%l6
	fsrc1	%f6,	%f22
	sdivcc	%g6,	0x0DB8,	%i2
	andn	%g2,	0x1553,	%o6
	stb	%l2,	[%l7 + 0x6C]
	array32	%o3,	%i0,	%l5
	andcc	%g3,	0x0D36,	%l1
	andcc	%o5,	0x162E,	%i7
	sll	%i3,	0x17,	%o0
	edge32ln	%i5,	%l0,	%g5
	smulcc	%o2,	0x1F41,	%o4
	array8	%g7,	%g1,	%l3
	movrgz	%o7,	%o1,	%i6
	movl	%xcc,	%l4,	%i1
	mova	%xcc,	%g4,	%i4
	subcc	%g6,	%l6,	%g2
	ldd	[%l7 + 0x50],	%o6
	fmuld8sux16	%f7,	%f29,	%f6
	mulx	%i2,	%l2,	%o3
	movrne	%i0,	%g3,	%l1
	sra	%l5,	%i7,	%o5
	movle	%icc,	%i3,	%i5
	alignaddr	%o0,	%g5,	%o2
	orcc	%o4,	0x0FAB,	%g7
	ldx	[%l7 + 0x70],	%g1
	edge32ln	%l0,	%o7,	%l3
	nop
	set	0x18, %g1
	std	%f22,	[%l7 + %g1]
	movrne	%o1,	%i6,	%i1
	add	%l4,	0x0004,	%i4
	array8	%g6,	%g4,	%g2
	fmovsne	%icc,	%f13,	%f8
	sdiv	%o6,	0x1506,	%l6
	edge8ln	%l2,	%o3,	%i0
	stb	%g3,	[%l7 + 0x63]
	movge	%icc,	%l1,	%l5
	stx	%i7,	[%l7 + 0x38]
	subccc	%i2,	0x1082,	%i3
	xorcc	%o5,	%i5,	%g5
	fsrc1s	%f10,	%f30
	fornot1s	%f17,	%f12,	%f26
	sth	%o0,	[%l7 + 0x36]
	subcc	%o4,	%o2,	%g7
	fmovrdne	%g1,	%f24,	%f16
	sethi	0x189C,	%l0
	fmovdpos	%icc,	%f22,	%f6
	sdivcc	%l3,	0x1067,	%o1
	fmovsge	%icc,	%f9,	%f28
	movrgz	%i6,	0x26F,	%o7
	fcmped	%fcc2,	%f20,	%f28
	or	%l4,	0x154C,	%i1
	edge32ln	%g6,	%i4,	%g2
	fxnor	%f12,	%f20,	%f10
	fmovsge	%xcc,	%f27,	%f25
	udiv	%o6,	0x134B,	%l6
	orncc	%g4,	0x1E8D,	%l2
	fors	%f20,	%f26,	%f3
	orncc	%o3,	0x05F8,	%i0
	edge16	%g3,	%l1,	%i7
	move	%icc,	%i2,	%l5
	movpos	%icc,	%i3,	%o5
	fnot1	%f12,	%f18
	orcc	%g5,	%o0,	%o4
	sll	%i5,	%o2,	%g7
	movre	%l0,	%g1,	%o1
	faligndata	%f26,	%f2,	%f12
	movrne	%i6,	%o7,	%l4
	array32	%l3,	%i1,	%g6
	xnor	%i4,	0x06B3,	%o6
	udiv	%g2,	0x0F60,	%g4
	movcs	%icc,	%l6,	%l2
	sdiv	%o3,	0x167B,	%g3
	srlx	%l1,	0x12,	%i7
	edge32ln	%i0,	%l5,	%i2
	srlx	%i3,	0x02,	%o5
	ldd	[%l7 + 0x38],	%o0
	umulcc	%o4,	0x1E9C,	%i5
	fmovsneg	%xcc,	%f26,	%f15
	movneg	%xcc,	%g5,	%g7
	fandnot2s	%f15,	%f16,	%f24
	movvc	%icc,	%l0,	%g1
	fnot2s	%f4,	%f30
	ld	[%l7 + 0x48],	%f30
	movvc	%xcc,	%o2,	%o1
	and	%o7,	%l4,	%i6
	edge32l	%i1,	%l3,	%i4
	srl	%o6,	0x1D,	%g2
	sdiv	%g4,	0x167A,	%l6
	sub	%l2,	0x15F5,	%o3
	movn	%icc,	%g6,	%l1
	xorcc	%i7,	0x0C44,	%g3
	fnegd	%f18,	%f30
	fpadd32	%f22,	%f26,	%f28
	movn	%icc,	%i0,	%i2
	fpsub32	%f26,	%f10,	%f24
	movne	%xcc,	%i3,	%o5
	sir	0x105C
	add	%l5,	0x029C,	%o4
	nop
	set	0x2C, %i4
	stw	%o0,	[%l7 + %i4]
	fpack16	%f28,	%f16
	edge8l	%g5,	%i5,	%l0
	movrgez	%g7,	0x2A0,	%g1
	edge8ln	%o1,	%o2,	%o7
	subc	%i6,	%i1,	%l3
	xnorcc	%l4,	%i4,	%o6
	xnorcc	%g2,	%g4,	%l6
	sdivx	%l2,	0x051F,	%o3
	nop
	set	0x54, %l2
	ldsw	[%l7 + %l2],	%g6
	fnot1s	%f9,	%f18
	xnor	%l1,	%g3,	%i0
	movg	%icc,	%i2,	%i7
	fpack16	%f2,	%f3
	fzero	%f12
	movgu	%xcc,	%i3,	%l5
	movrlz	%o5,	%o4,	%o0
	movre	%g5,	0x0E4,	%i5
	movneg	%icc,	%l0,	%g1
	fmovd	%f14,	%f4
	fabss	%f25,	%f10
	srax	%o1,	0x0A,	%o2
	alignaddrl	%o7,	%g7,	%i1
	sdivcc	%l3,	0x032A,	%i6
	fcmpeq32	%f16,	%f4,	%l4
	movrlez	%i4,	%o6,	%g2
	fmovse	%xcc,	%f25,	%f28
	orcc	%l6,	%l2,	%g4
	add	%g6,	%l1,	%o3
	edge8l	%i0,	%g3,	%i7
	alignaddrl	%i3,	%l5,	%o5
	fmovrdgez	%o4,	%f30,	%f16
	movrgez	%o0,	0x2FC,	%g5
	andncc	%i2,	%l0,	%g1
	movne	%xcc,	%o1,	%o2
	edge32l	%i5,	%g7,	%o7
	xnor	%i1,	0x1122,	%l3
	orncc	%l4,	0x1705,	%i6
	edge16l	%o6,	%i4,	%l6
	fmovdvc	%icc,	%f27,	%f25
	addccc	%g2,	0x027E,	%g4
	alignaddrl	%l2,	%l1,	%g6
	udivcc	%o3,	0x0F58,	%g3
	movl	%xcc,	%i7,	%i3
	st	%f18,	[%l7 + 0x14]
	smulcc	%i0,	0x1491,	%l5
	fnand	%f16,	%f2,	%f10
	edge16l	%o4,	%o5,	%g5
	popc	%i2,	%l0
	sllx	%g1,	%o1,	%o0
	sub	%o2,	0x123D,	%i5
	ldx	[%l7 + 0x10],	%g7
	movl	%icc,	%o7,	%l3
	alignaddr	%i1,	%l4,	%i6
	fmovdcs	%xcc,	%f3,	%f30
	ld	[%l7 + 0x54],	%f22
	stw	%o6,	[%l7 + 0x30]
	alignaddr	%l6,	%i4,	%g4
	fmovsneg	%icc,	%f9,	%f15
	andn	%g2,	%l1,	%l2
	move	%xcc,	%o3,	%g6
	fmovdn	%icc,	%f21,	%f3
	edge16l	%i7,	%g3,	%i3
	movn	%xcc,	%i0,	%o4
	ldub	[%l7 + 0x44],	%o5
	edge8	%g5,	%l5,	%i2
	ld	[%l7 + 0x24],	%f0
	add	%l0,	0x160E,	%o1
	smulcc	%g1,	0x10A0,	%o0
	movrne	%i5,	%g7,	%o7
	fmovdvs	%xcc,	%f24,	%f23
	sllx	%o2,	0x07,	%l3
	lduw	[%l7 + 0x18],	%l4
	sth	%i1,	[%l7 + 0x38]
	ldd	[%l7 + 0x08],	%i6
	edge16n	%o6,	%l6,	%i4
	fnor	%f4,	%f16,	%f20
	fcmped	%fcc1,	%f26,	%f12
	sdivx	%g4,	0x166F,	%l1
	movle	%xcc,	%g2,	%l2
	movneg	%xcc,	%g6,	%i7
	sethi	0x02DE,	%o3
	fmovsn	%icc,	%f1,	%f16
	alignaddrl	%g3,	%i0,	%o4
	udiv	%o5,	0x14ED,	%i3
	fmovsa	%xcc,	%f26,	%f3
	movle	%xcc,	%l5,	%g5
	movrgz	%i2,	0x246,	%l0
	addc	%g1,	%o0,	%i5
	fmovsgu	%xcc,	%f29,	%f31
	alignaddrl	%o1,	%o7,	%g7
	fmul8x16au	%f10,	%f31,	%f30
	faligndata	%f28,	%f4,	%f10
	movrlez	%o2,	0x395,	%l3
	fmovsgu	%icc,	%f6,	%f2
	ldd	[%l7 + 0x78],	%l4
	fmovrslz	%i1,	%f25,	%f9
	movcc	%icc,	%o6,	%l6
	movvs	%xcc,	%i4,	%i6
	fsrc2s	%f19,	%f26
	addcc	%l1,	0x1188,	%g4
	fmovsvs	%icc,	%f16,	%f11
	fmovrde	%l2,	%f16,	%f22
	edge32ln	%g2,	%i7,	%o3
	lduw	[%l7 + 0x24],	%g6
	ldsh	[%l7 + 0x6A],	%i0
	edge8ln	%g3,	%o5,	%o4
	ldub	[%l7 + 0x71],	%i3
	nop
	set	0x79, %l0
	ldub	[%l7 + %l0],	%l5
	std	%f22,	[%l7 + 0x30]
	ldx	[%l7 + 0x78],	%i2
	edge8	%g5,	%g1,	%o0
	sdivx	%i5,	0x155A,	%o1
	edge16	%o7,	%l0,	%g7
	stb	%o2,	[%l7 + 0x5D]
	movvc	%icc,	%l3,	%i1
	srl	%l4,	0x01,	%l6
	ldsh	[%l7 + 0x7E],	%o6
	movrne	%i4,	0x27A,	%l1
	fmul8x16al	%f11,	%f26,	%f10
	st	%f3,	[%l7 + 0x28]
	std	%f10,	[%l7 + 0x50]
	and	%g4,	0x1420,	%i6
	popc	%l2,	%i7
	movl	%xcc,	%g2,	%o3
	movge	%icc,	%g6,	%g3
	subcc	%o5,	%o4,	%i3
	edge8	%i0,	%l5,	%g5
	st	%f21,	[%l7 + 0x0C]
	stw	%g1,	[%l7 + 0x5C]
	edge16n	%o0,	%i5,	%i2
	fmovrdlz	%o1,	%f6,	%f4
	alignaddrl	%o7,	%g7,	%l0
	subccc	%l3,	0x1FAE,	%i1
	sllx	%l4,	0x14,	%o2
	fpadd32s	%f21,	%f3,	%f3
	movn	%xcc,	%o6,	%i4
	subcc	%l6,	%l1,	%g4
	movre	%i6,	0x254,	%i7
	and	%g2,	%o3,	%l2
	fmovdgu	%xcc,	%f16,	%f30
	fmovrdlz	%g3,	%f4,	%f12
	and	%g6,	0x1716,	%o5
	xor	%o4,	0x0A14,	%i3
	sub	%i0,	%l5,	%g5
	ldsh	[%l7 + 0x16],	%o0
	move	%xcc,	%g1,	%i5
	std	%f14,	[%l7 + 0x28]
	edge32	%o1,	%i2,	%g7
	movpos	%icc,	%l0,	%o7
	sra	%l3,	0x03,	%l4
	edge32	%o2,	%o6,	%i1
	sdiv	%l6,	0x01EF,	%i4
	edge8n	%g4,	%i6,	%i7
	array16	%g2,	%l1,	%o3
	fmul8sux16	%f8,	%f26,	%f20
	ldx	[%l7 + 0x28],	%l2
	xnorcc	%g3,	%o5,	%g6
	array8	%o4,	%i3,	%i0
	move	%xcc,	%g5,	%l5
	fmovrdgz	%o0,	%f14,	%f28
	movvc	%xcc,	%g1,	%i5
	edge16n	%o1,	%g7,	%i2
	sra	%l0,	%l3,	%o7
	udiv	%o2,	0x1026,	%l4
	edge16	%o6,	%i1,	%i4
	andcc	%l6,	0x19A3,	%i6
	sdivx	%g4,	0x17F6,	%g2
	edge16ln	%l1,	%o3,	%l2
	fpackfix	%f30,	%f10
	xnor	%i7,	0x14BD,	%g3
	fcmple16	%f26,	%f18,	%o5
	smulcc	%o4,	%g6,	%i3
	alignaddr	%g5,	%i0,	%l5
	xnor	%o0,	0x1076,	%i5
	srax	%g1,	%o1,	%i2
	udiv	%g7,	0x1A6D,	%l3
	movl	%icc,	%l0,	%o2
	movrlz	%l4,	%o6,	%i1
	nop
	set	0x0C, %l4
	lduh	[%l7 + %l4],	%i4
	ldx	[%l7 + 0x78],	%o7
	smul	%i6,	%l6,	%g4
	fnands	%f21,	%f0,	%f31
	sllx	%g2,	%l1,	%o3
	popc	0x1417,	%i7
	fnot1	%f30,	%f30
	fxnor	%f6,	%f26,	%f26
	andcc	%l2,	%g3,	%o5
	umul	%o4,	0x0585,	%i3
	fmovdn	%icc,	%f21,	%f8
	fcmpgt32	%f20,	%f12,	%g6
	edge8l	%i0,	%l5,	%o0
	movl	%icc,	%i5,	%g5
	orcc	%o1,	%g1,	%g7
	move	%icc,	%i2,	%l3
	restore %o2, %l0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x76],	%i1
	xnorcc	%i4,	0x1A7B,	%o6
	fornot2s	%f18,	%f4,	%f16
	movrne	%i6,	%o7,	%g4
	fmovdcc	%xcc,	%f25,	%f4
	mova	%xcc,	%l6,	%g2
	alignaddrl	%l1,	%o3,	%l2
	fmuld8ulx16	%f30,	%f21,	%f18
	movle	%icc,	%g3,	%o5
	sub	%i7,	%o4,	%g6
	andn	%i3,	0x0653,	%l5
	edge32	%o0,	%i0,	%i5
	alignaddr	%g5,	%g1,	%g7
	save %i2, 0x1899, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o1,	0x1F,	%l0
	srl	%l4,	0x11,	%i1
	ld	[%l7 + 0x70],	%f13
	movvc	%xcc,	%i4,	%o2
	edge16l	%i6,	%o7,	%o6
	addccc	%l6,	%g2,	%l1
	edge16n	%o3,	%g4,	%g3
	movgu	%xcc,	%l2,	%i7
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%o4
	movre	%o4,	%g6,	%i3
	movrne	%l5,	%o0,	%i0
	umul	%g5,	%i5,	%g1
	movl	%icc,	%i2,	%g7
	edge16n	%l3,	%o1,	%l0
	sll	%i1,	%l4,	%i4
	movneg	%xcc,	%o2,	%o7
	udivx	%o6,	0x183C,	%l6
	orn	%i6,	%l1,	%g2
	fmovrsgz	%o3,	%f23,	%f20
	fmovrsgz	%g3,	%f20,	%f11
	edge32ln	%g4,	%l2,	%o5
	fxnors	%f22,	%f18,	%f18
	addcc	%i7,	%g6,	%o4
	addccc	%l5,	0x1989,	%o0
	fabsd	%f30,	%f4
	andn	%i3,	0x07F9,	%g5
	fmovrde	%i5,	%f12,	%f18
	ldd	[%l7 + 0x70],	%g0
	save %i0, 0x0CB8, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f1,	%f2,	%f5
	udivx	%l3,	0x0BEF,	%o1
	ldd	[%l7 + 0x48],	%i2
	edge16	%i1,	%l0,	%l4
	movrlez	%i4,	%o2,	%o7
	sdiv	%o6,	0x1990,	%l6
	fmul8x16au	%f30,	%f1,	%f24
	fandnot2s	%f1,	%f24,	%f9
	sethi	0x09BB,	%l1
	siam	0x6
	fornot2s	%f11,	%f8,	%f27
	andncc	%g2,	%o3,	%g3
	std	%f10,	[%l7 + 0x60]
	orcc	%i6,	0x0858,	%g4
	ldub	[%l7 + 0x28],	%o5
	sir	0x03E1
	movle	%icc,	%i7,	%l2
	edge32	%o4,	%l5,	%o0
	fmovdle	%icc,	%f21,	%f26
	xorcc	%g6,	%g5,	%i5
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%i2
	subc	%g1,	0x04B8,	%g7
	stx	%i0,	[%l7 + 0x38]
	addcc	%l3,	%i2,	%i1
	stw	%l0,	[%l7 + 0x1C]
	fpsub16s	%f6,	%f15,	%f12
	movg	%icc,	%l4,	%o1
	sra	%i4,	%o2,	%o7
	mova	%xcc,	%l6,	%l1
	sllx	%o6,	%g2,	%g3
	andcc	%i6,	%o3,	%g4
	movrne	%i7,	%o5,	%l2
	xnorcc	%o4,	%l5,	%o0
	popc	%g5,	%i5
	mulscc	%i3,	%g1,	%g6
	fmovscs	%xcc,	%f17,	%f28
	movleu	%icc,	%i0,	%l3
	or	%g7,	0x0014,	%i1
	movle	%icc,	%l0,	%l4
	fzero	%f0
	xnor	%o1,	%i2,	%o2
	andcc	%i4,	%o7,	%l1
	andcc	%o6,	0x044D,	%g2
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	movg	%icc,	%o3,	%i6
	array8	%g4,	%i7,	%l2
	mulx	%o5,	%l5,	%o0
	ldd	[%l7 + 0x18],	%o4
	sir	0x094E
	fcmpne32	%f14,	%f16,	%g5
	array32	%i3,	%g1,	%i5
	edge8l	%i0,	%g6,	%g7
	ldsw	[%l7 + 0x70],	%i1
	edge8ln	%l3,	%l0,	%o1
	ldd	[%l7 + 0x68],	%l4
	fmovrsne	%o2,	%f7,	%f30
	movg	%xcc,	%i4,	%i2
	andn	%o7,	%o6,	%g2
	fcmpne32	%f4,	%f16,	%l1
	stx	%l6,	[%l7 + 0x40]
	fmovrsgez	%g3,	%f26,	%f7
	fabss	%f0,	%f18
	movle	%icc,	%i6,	%o3
	array32	%g4,	%i7,	%l2
	smul	%o5,	%l5,	%o0
	edge32l	%o4,	%i3,	%g5
	fandnot1	%f16,	%f26,	%f24
	sra	%i5,	%i0,	%g6
	move	%icc,	%g7,	%i1
	stw	%g1,	[%l7 + 0x70]
	movleu	%xcc,	%l3,	%l0
	fpack16	%f22,	%f26
	sethi	0x0A16,	%o1
	xnor	%o2,	0x138D,	%i4
	movgu	%icc,	%i2,	%l4
	movcc	%icc,	%o6,	%o7
	fandnot2	%f2,	%f28,	%f10
	movn	%xcc,	%g2,	%l1
	movrlez	%l6,	0x198,	%i6
	fmovsvs	%xcc,	%f1,	%f12
	fmovscs	%xcc,	%f25,	%f11
	movgu	%icc,	%o3,	%g3
	sllx	%g4,	%i7,	%l2
	srlx	%l5,	%o5,	%o4
	move	%icc,	%o0,	%i3
	addc	%i5,	0x1B82,	%g5
	edge32l	%i0,	%g6,	%i1
	movne	%icc,	%g7,	%l3
	sub	%g1,	0x10D4,	%l0
	fmovsle	%icc,	%f29,	%f30
	fnot1s	%f1,	%f31
	edge16n	%o1,	%i4,	%o2
	movcs	%icc,	%l4,	%o6
	movrlz	%o7,	%i2,	%l1
	edge8	%l6,	%g2,	%i6
	movne	%xcc,	%g3,	%g4
	fmovdg	%icc,	%f16,	%f23
	fmovrsgez	%o3,	%f27,	%f2
	ldd	[%l7 + 0x20],	%l2
	udiv	%l5,	0x1458,	%i7
	orn	%o5,	%o4,	%i3
	movrlez	%i5,	0x342,	%o0
	fnands	%f15,	%f11,	%f11
	movre	%g5,	0x03B,	%i0
	alignaddrl	%i1,	%g7,	%g6
	andcc	%l3,	0x1156,	%g1
	udivcc	%o1,	0x16C7,	%i4
	fsrc2	%f28,	%f18
	movcs	%xcc,	%l0,	%l4
	ld	[%l7 + 0x70],	%f24
	edge8l	%o2,	%o6,	%o7
	nop
	set	0x28, %l6
	std	%f30,	[%l7 + %l6]
	lduw	[%l7 + 0x54],	%l1
	fnegd	%f12,	%f0
	edge32ln	%i2,	%g2,	%l6
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f28
	movcs	%icc,	%i6,	%g4
	sdiv	%o3,	0x1218,	%l2
	save %l5, 0x11AC, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g3,	0x1F1C,	%o4
	xnor	%o5,	%i5,	%o0
	ld	[%l7 + 0x10],	%f15
	fabss	%f1,	%f0
	movrne	%g5,	0x36C,	%i3
	fmovsleu	%icc,	%f13,	%f18
	fpsub16	%f12,	%f26,	%f28
	fmovrsgez	%i0,	%f17,	%f12
	addc	%g7,	%i1,	%g6
	mulx	%g1,	%o1,	%i4
	mulx	%l3,	0x07C3,	%l4
	sra	%l0,	0x17,	%o6
	edge32n	%o2,	%o7,	%l1
	restore %g2, %l6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i6,	%g4,	%l2
	srl	%o3,	0x00,	%i7
	movne	%xcc,	%l5,	%g3
	umulcc	%o5,	0x0346,	%o4
	movne	%xcc,	%o0,	%i5
	std	%f12,	[%l7 + 0x20]
	udivx	%g5,	0x0525,	%i3
	mulx	%g7,	%i0,	%g6
	fmul8sux16	%f20,	%f26,	%f18
	edge16n	%i1,	%o1,	%i4
	fnors	%f18,	%f31,	%f8
	movgu	%icc,	%l3,	%l4
	fpmerge	%f16,	%f10,	%f18
	save %l0, %o6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o7,	%g1,	%g2
	udivcc	%l1,	0x141F,	%i2
	udivx	%l6,	0x13C1,	%i6
	orcc	%l2,	%o3,	%i7
	std	%f2,	[%l7 + 0x78]
	movrlez	%g4,	%l5,	%o5
	movvs	%xcc,	%g3,	%o0
	subccc	%o4,	%g5,	%i3
	ldx	[%l7 + 0x20],	%i5
	movrlez	%i0,	0x38D,	%g7
	ldsh	[%l7 + 0x50],	%i1
	array32	%o1,	%g6,	%l3
	sdivx	%i4,	0x073D,	%l4
	andncc	%o6,	%o2,	%l0
	ldsw	[%l7 + 0x70],	%g1
	movgu	%xcc,	%g2,	%o7
	sethi	0x0B9A,	%i2
	stx	%l6,	[%l7 + 0x70]
	fmovsneg	%xcc,	%f9,	%f6
	xor	%i6,	%l2,	%o3
	sdivcc	%l1,	0x1E08,	%i7
	or	%l5,	0x03A5,	%o5
	xnor	%g3,	%g4,	%o4
	movne	%icc,	%o0,	%i3
	ldsw	[%l7 + 0x68],	%g5
	st	%f25,	[%l7 + 0x5C]
	fnegd	%f12,	%f26
	fmul8x16al	%f13,	%f24,	%f30
	sth	%i0,	[%l7 + 0x28]
	move	%xcc,	%i5,	%i1
	edge16n	%g7,	%g6,	%o1
	addcc	%l3,	%i4,	%o6
	subc	%l4,	0x151B,	%l0
	edge32l	%o2,	%g2,	%g1
	movrgez	%i2,	0x011,	%l6
	movle	%icc,	%o7,	%i6
	ldsw	[%l7 + 0x44],	%o3
	edge32ln	%l2,	%i7,	%l5
	fnot1	%f16,	%f12
	std	%f22,	[%l7 + 0x18]
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	andn	%l1,	%o4,	%o0
	edge16ln	%i3,	%g4,	%g5
	sra	%i5,	0x06,	%i0
	mulscc	%i1,	%g6,	%g7
	movgu	%xcc,	%l3,	%o1
	addccc	%o6,	%i4,	%l0
	array32	%l4,	%o2,	%g1
	andcc	%g2,	%l6,	%o7
	and	%i6,	0x047F,	%i2
	andn	%o3,	0x034B,	%i7
	movre	%l2,	0x2B4,	%l5
	edge8ln	%o5,	%l1,	%g3
	edge16n	%o0,	%o4,	%i3
	movrgez	%g5,	0x143,	%g4
	mova	%icc,	%i5,	%i1
	movl	%xcc,	%i0,	%g6
	fmovda	%icc,	%f16,	%f20
	udivx	%g7,	0x1AEF,	%o1
	stw	%l3,	[%l7 + 0x20]
	movleu	%xcc,	%i4,	%l0
	subc	%l4,	%o2,	%g1
	edge32l	%o6,	%g2,	%l6
	smul	%o7,	%i2,	%i6
	add	%o3,	0x0D73,	%i7
	edge32	%l5,	%l2,	%o5
	fmovdne	%xcc,	%f31,	%f23
	nop
	set	0x42, %o0
	lduh	[%l7 + %o0],	%g3
	smul	%o0,	%l1,	%i3
	udiv	%o4,	0x02BF,	%g4
	ldsw	[%l7 + 0x38],	%i5
	sdivcc	%i1,	0x01BC,	%i0
	stx	%g5,	[%l7 + 0x50]
	movrne	%g7,	0x269,	%g6
	array32	%o1,	%i4,	%l3
	siam	0x6
	movrgez	%l0,	%o2,	%l4
	fpackfix	%f20,	%f25
	fnot2	%f24,	%f20
	xnor	%o6,	%g2,	%l6
	addccc	%g1,	0x05D7,	%i2
	array8	%i6,	%o7,	%i7
	udiv	%o3,	0x1999,	%l2
	srax	%o5,	%g3,	%o0
	movge	%icc,	%l1,	%i3
	ld	[%l7 + 0x74],	%f26
	srlx	%o4,	%l5,	%i5
	st	%f21,	[%l7 + 0x78]
	fnand	%f20,	%f8,	%f14
	fmovdvs	%icc,	%f29,	%f29
	movge	%icc,	%g4,	%i0
	fmovrsgez	%i1,	%f21,	%f10
	sth	%g7,	[%l7 + 0x64]
	array16	%g6,	%o1,	%g5
	movrgez	%l3,	%i4,	%o2
	udiv	%l4,	0x143F,	%o6
	xnorcc	%l0,	%g2,	%l6
	sethi	0x1C60,	%g1
	movge	%icc,	%i6,	%i2
	subccc	%o7,	%o3,	%i7
	edge32l	%l2,	%g3,	%o5
	subc	%l1,	0x1991,	%o0
	addccc	%o4,	0x13F5,	%i3
	array8	%i5,	%g4,	%i0
	st	%f15,	[%l7 + 0x6C]
	umul	%l5,	%i1,	%g7
	orncc	%o1,	0x040D,	%g5
	ldsb	[%l7 + 0x7C],	%g6
	edge8	%i4,	%l3,	%o2
	and	%l4,	0x0884,	%o6
	sth	%l0,	[%l7 + 0x20]
	orncc	%l6,	%g1,	%i6
	sth	%g2,	[%l7 + 0x52]
	edge16ln	%i2,	%o7,	%o3
	subc	%i7,	0x14DC,	%g3
	movgu	%icc,	%l2,	%l1
	fmovsl	%xcc,	%f15,	%f8
	ldsb	[%l7 + 0x72],	%o5
	movcs	%icc,	%o4,	%o0
	umul	%i5,	0x1A7E,	%g4
	andcc	%i0,	0x1125,	%l5
	movcs	%icc,	%i3,	%i1
	movrlz	%o1,	%g5,	%g6
	movn	%icc,	%g7,	%i4
	xor	%l3,	0x0B9D,	%l4
	srax	%o2,	0x1D,	%o6
	srax	%l0,	%g1,	%l6
	movle	%xcc,	%g2,	%i6
	movleu	%xcc,	%i2,	%o3
	movrlez	%o7,	0x237,	%g3
	ldsw	[%l7 + 0x5C],	%i7
	umulcc	%l2,	%l1,	%o5
	xnor	%o4,	0x134E,	%i5
	sethi	0x17BA,	%g4
	sdiv	%o0,	0x094C,	%i0
	fmul8sux16	%f16,	%f20,	%f14
	sdiv	%i3,	0x0759,	%i1
	srax	%o1,	0x06,	%l5
	fabss	%f4,	%f7
	move	%icc,	%g6,	%g5
	movrgz	%g7,	%l3,	%i4
	movvc	%icc,	%l4,	%o6
	or	%o2,	%l0,	%l6
	stw	%g1,	[%l7 + 0x14]
	udivx	%i6,	0x020E,	%i2
	andn	%g2,	%o3,	%g3
	movrlez	%o7,	%i7,	%l1
	fmovdneg	%xcc,	%f14,	%f28
	lduw	[%l7 + 0x58],	%o5
	srlx	%o4,	%l2,	%i5
	movpos	%icc,	%g4,	%o0
	xor	%i3,	0x0F9E,	%i1
	stx	%i0,	[%l7 + 0x30]
	andcc	%o1,	0x01E7,	%g6
	edge16l	%g5,	%g7,	%l5
	edge32n	%l3,	%i4,	%o6
	movg	%xcc,	%o2,	%l4
	umul	%l0,	0x0870,	%l6
	for	%f6,	%f18,	%f10
	movrlz	%g1,	0x046,	%i2
	udiv	%i6,	0x1C4B,	%o3
	movrgez	%g3,	%g2,	%o7
	fnot1	%f28,	%f30
	alignaddrl	%l1,	%i7,	%o4
	fpsub32s	%f5,	%f23,	%f23
	lduw	[%l7 + 0x40],	%l2
	fnot1s	%f23,	%f31
	fmovspos	%xcc,	%f5,	%f9
	orcc	%i5,	%g4,	%o0
	fpack32	%f4,	%f16,	%f10
	orcc	%i3,	0x07BE,	%i1
	fmovrdlz	%i0,	%f28,	%f24
	fmul8x16al	%f13,	%f24,	%f30
	sub	%o5,	%g6,	%g5
	ld	[%l7 + 0x5C],	%f28
	sth	%o1,	[%l7 + 0x30]
	movrgz	%l5,	0x0C1,	%g7
	ldub	[%l7 + 0x72],	%i4
	ldsw	[%l7 + 0x10],	%o6
	fandnot2	%f30,	%f12,	%f26
	edge16l	%o2,	%l4,	%l3
	sth	%l0,	[%l7 + 0x24]
	fcmped	%fcc1,	%f22,	%f24
	ldd	[%l7 + 0x60],	%f24
	edge32l	%g1,	%i2,	%i6
	fcmps	%fcc0,	%f24,	%f26
	alignaddrl	%o3,	%l6,	%g2
	movre	%o7,	%g3,	%l1
	sub	%i7,	%l2,	%i5
	addc	%g4,	%o0,	%i3
	fsrc2	%f14,	%f8
	edge8n	%i1,	%i0,	%o4
	mulx	%o5,	%g6,	%g5
	fnors	%f27,	%f28,	%f26
	ldsw	[%l7 + 0x1C],	%l5
	fmovdgu	%xcc,	%f28,	%f30
	edge8ln	%o1,	%g7,	%o6
	fmovsne	%xcc,	%f14,	%f31
	movn	%icc,	%i4,	%o2
	mulx	%l3,	0x0F8F,	%l4
	or	%l0,	0x135D,	%i2
	lduh	[%l7 + 0x0C],	%i6
	andn	%o3,	0x1ED3,	%l6
	array16	%g2,	%g1,	%o7
	movrgz	%l1,	0x35C,	%g3
	movrlz	%i7,	%l2,	%i5
	smul	%o0,	0x0DC7,	%g4
	ldd	[%l7 + 0x20],	%f8
	sra	%i1,	%i0,	%i3
	movpos	%icc,	%o4,	%o5
	add	%g5,	0x0398,	%g6
	edge8n	%l5,	%o1,	%g7
	smul	%i4,	%o6,	%o2
	xorcc	%l4,	0x024B,	%l0
	srax	%l3,	0x14,	%i6
	orn	%o3,	0x01E6,	%l6
	fmovd	%f2,	%f24
	edge8	%i2,	%g2,	%g1
	for	%f18,	%f30,	%f28
	subcc	%o7,	%g3,	%i7
	movrgz	%l2,	%i5,	%l1
	orn	%o0,	0x0EC7,	%i1
	andncc	%g4,	%i3,	%o4
	movneg	%xcc,	%o5,	%g5
	array8	%g6,	%l5,	%o1
	movleu	%icc,	%g7,	%i4
	fpmerge	%f15,	%f3,	%f8
	udivcc	%i0,	0x0F52,	%o6
	stw	%o2,	[%l7 + 0x10]
	sll	%l4,	0x08,	%l0
	and	%i6,	%o3,	%l6
	andncc	%i2,	%g2,	%l3
	addc	%o7,	0x0296,	%g3
	movn	%xcc,	%g1,	%i7
	movle	%icc,	%i5,	%l1
	fmovsge	%xcc,	%f21,	%f13
	movcc	%icc,	%o0,	%i1
	sll	%g4,	0x1D,	%i3
	umulcc	%o4,	%o5,	%g5
	save %l2, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g7,	0x14,	%o1
	ld	[%l7 + 0x7C],	%f11
	fpsub32s	%f11,	%f4,	%f22
	bshuffle	%f10,	%f12,	%f14
	alignaddrl	%i0,	%o6,	%o2
	movgu	%icc,	%l4,	%i4
	sll	%l0,	%o3,	%l6
	sir	0x0C59
	fmovrdgez	%i6,	%f22,	%f22
	fmuld8sux16	%f0,	%f30,	%f8
	edge16n	%i2,	%g2,	%l3
	move	%icc,	%g3,	%o7
	fcmpgt32	%f4,	%f0,	%g1
	fnot2	%f14,	%f16
	edge16	%i7,	%i5,	%l1
	edge8n	%i1,	%g4,	%i3
	movcs	%xcc,	%o4,	%o0
	array32	%g5,	%o5,	%l2
	edge16ln	%g6,	%l5,	%g7
	movvc	%icc,	%i0,	%o1
	fxnor	%f4,	%f28,	%f16
	popc	0x170B,	%o2
	fcmpeq32	%f6,	%f26,	%o6
	edge8	%l4,	%i4,	%l0
	sdivcc	%l6,	0x1FB7,	%o3
	sir	0x06AD
	fnegd	%f20,	%f22
	udivx	%i6,	0x1A6D,	%g2
	and	%i2,	0x0655,	%l3
	fmovrdgz	%g3,	%f0,	%f18
	mova	%icc,	%o7,	%i7
	xnorcc	%i5,	0x0063,	%l1
	edge16l	%i1,	%g1,	%i3
	fcmped	%fcc1,	%f18,	%f28
	ldd	[%l7 + 0x38],	%f22
	lduh	[%l7 + 0x6A],	%g4
	addc	%o0,	0x15C6,	%g5
	fmovrsgez	%o5,	%f13,	%f9
	fmul8sux16	%f16,	%f8,	%f6
	sra	%l2,	%g6,	%l5
	movre	%g7,	%o4,	%o1
	movle	%xcc,	%o2,	%o6
	array32	%i0,	%l4,	%i4
	restore %l0, %o3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%i2,	%g2
	orn	%l3,	0x0044,	%o7
	add	%i7,	%g3,	%l1
	ldub	[%l7 + 0x5D],	%i5
	xor	%i1,	%i3,	%g1
	sir	0x022A
	fmovsle	%xcc,	%f21,	%f22
	fmovrsgez	%g4,	%f25,	%f5
	udiv	%g5,	0x1647,	%o0
	ldd	[%l7 + 0x38],	%f12
	sdivx	%o5,	0x192A,	%l2
	fpsub32s	%f20,	%f13,	%f17
	mulscc	%g6,	0x0CD5,	%l5
	nop
	set	0x2B, %o7
	ldsb	[%l7 + %o7],	%g7
	stx	%o1,	[%l7 + 0x30]
	std	%f12,	[%l7 + 0x70]
	xor	%o2,	%o4,	%o6
	alignaddr	%i0,	%l4,	%i4
	fmovrsne	%o3,	%f12,	%f20
	udiv	%l6,	0x1C19,	%l0
	movrlz	%i6,	%i2,	%l3
	array16	%g2,	%o7,	%i7
	sethi	0x1E67,	%l1
	popc	0x0EF0,	%g3
	edge32	%i5,	%i3,	%g1
	move	%xcc,	%g4,	%i1
	array8	%g5,	%o0,	%o5
	xnor	%g6,	0x1967,	%l2
	srlx	%g7,	%l5,	%o2
	movleu	%xcc,	%o4,	%o6
	fmovde	%icc,	%f9,	%f6
	fcmpne16	%f24,	%f12,	%i0
	edge8n	%l4,	%o1,	%o3
	andcc	%l6,	0x0C8B,	%i4
	fexpand	%f17,	%f16
	umul	%i6,	0x0DCE,	%i2
	movg	%icc,	%l0,	%l3
	udiv	%g2,	0x0221,	%o7
	sllx	%i7,	%g3,	%i5
	nop
	set	0x56, %g3
	lduh	[%l7 + %g3],	%i3
	fpack16	%f18,	%f22
	addcc	%l1,	0x1D48,	%g1
	ldsh	[%l7 + 0x08],	%g4
	edge32	%i1,	%o0,	%o5
	mulscc	%g5,	0x0FE5,	%g6
	sub	%g7,	0x0B3F,	%l5
	fmovdvc	%icc,	%f1,	%f12
	udiv	%o2,	0x0715,	%l2
	fmovs	%f7,	%f25
	fmovdle	%icc,	%f25,	%f0
	xorcc	%o4,	%o6,	%l4
	movneg	%xcc,	%o1,	%i0
	xorcc	%l6,	0x18F7,	%o3
	edge16l	%i4,	%i2,	%l0
	ldub	[%l7 + 0x7B],	%l3
	orncc	%i6,	0x031F,	%o7
	edge8	%i7,	%g3,	%i5
	movrgez	%i3,	0x278,	%g2
	edge8l	%g1,	%l1,	%i1
	fpack16	%f2,	%f4
	fmovdle	%icc,	%f17,	%f20
	array16	%o0,	%g4,	%g5
	movrgez	%o5,	%g6,	%g7
	fcmpne16	%f12,	%f0,	%l5
	orn	%o2,	%l2,	%o4
	smulcc	%l4,	%o1,	%o6
	subccc	%l6,	%o3,	%i4
	fcmpgt32	%f20,	%f26,	%i0
	array8	%l0,	%i2,	%l3
	edge32ln	%i6,	%i7,	%g3
	lduw	[%l7 + 0x40],	%o7
	sllx	%i3,	%i5,	%g2
	fmovdleu	%xcc,	%f6,	%f1
	add	%g1,	%l1,	%o0
	xnor	%g4,	%i1,	%o5
	mulx	%g6,	%g5,	%l5
	movvs	%xcc,	%o2,	%g7
	fsrc2	%f30,	%f26
	movrgez	%l2,	%l4,	%o1
	edge32	%o6,	%l6,	%o3
	edge8	%o4,	%i0,	%i4
	and	%i2,	%l0,	%l3
	fmovdle	%xcc,	%f24,	%f20
	lduh	[%l7 + 0x62],	%i6
	or	%g3,	0x0A03,	%i7
	fcmps	%fcc1,	%f7,	%f1
	xnor	%i3,	%i5,	%g2
	fnot2	%f4,	%f14
	movrgz	%o7,	%g1,	%o0
	ldsw	[%l7 + 0x24],	%l1
	movne	%xcc,	%g4,	%i1
	popc	0x031F,	%g6
	nop
	set	0x44, %g5
	sth	%o5,	[%l7 + %g5]
	sllx	%l5,	0x14,	%g5
	movleu	%xcc,	%g7,	%o2
	movrlez	%l2,	%l4,	%o1
	smul	%l6,	0x179D,	%o6
	mulscc	%o3,	0x01AF,	%o4
	udivx	%i4,	0x039A,	%i2
	orncc	%i0,	%l3,	%l0
	edge16l	%i6,	%g3,	%i3
	fpsub16	%f20,	%f20,	%f0
	sethi	0x1980,	%i7
	array16	%i5,	%o7,	%g1
	fnot1s	%f29,	%f10
	sir	0x08AA
	fmovsvs	%xcc,	%f15,	%f23
	fmovrdgz	%o0,	%f28,	%f22
	sth	%l1,	[%l7 + 0x0C]
	subcc	%g4,	0x0E73,	%g2
	movneg	%icc,	%i1,	%g6
	fandnot1	%f12,	%f18,	%f8
	fmovsl	%icc,	%f16,	%f19
	and	%o5,	%g5,	%l5
	move	%xcc,	%g7,	%o2
	fandnot1	%f4,	%f30,	%f20
	fmovdpos	%xcc,	%f6,	%f16
	edge32l	%l2,	%o1,	%l6
	sir	0x047C
	movvs	%xcc,	%l4,	%o6
	movrlez	%o4,	0x277,	%i4
	ldsb	[%l7 + 0x11],	%i2
	xnor	%o3,	0x1437,	%l3
	fmovrdlez	%i0,	%f6,	%f6
	fornot2s	%f18,	%f16,	%f14
	umulcc	%i6,	%l0,	%i3
	andcc	%i7,	0x190A,	%i5
	st	%f12,	[%l7 + 0x44]
	movrlz	%o7,	0x144,	%g1
	fmovrslez	%o0,	%f9,	%f28
	movre	%g3,	%g4,	%g2
	fnands	%f21,	%f19,	%f6
	sir	0x0CA4
	fmovda	%icc,	%f5,	%f30
	umul	%l1,	0x1602,	%i1
	udivcc	%o5,	0x04C2,	%g6
	movn	%icc,	%l5,	%g7
	movgu	%icc,	%o2,	%l2
	udiv	%g5,	0x0734,	%l6
	movrgz	%l4,	0x109,	%o6
	stx	%o4,	[%l7 + 0x58]
	fmovs	%f6,	%f13
	array8	%i4,	%i2,	%o3
	movn	%xcc,	%l3,	%o1
	sll	%i0,	0x03,	%i6
	andcc	%l0,	%i7,	%i5
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	orn	%o0,	%i3,	%g3
	edge8	%g2,	%g4,	%l1
	fzero	%f24
	andn	%o5,	%g6,	%l5
	or	%i1,	0x0F6D,	%o2
	fmovsa	%xcc,	%f25,	%f8
	sdivcc	%l2,	0x15CB,	%g7
	movn	%icc,	%l6,	%l4
	movpos	%icc,	%g5,	%o4
	andncc	%o6,	%i2,	%i4
	addccc	%o3,	0x16BE,	%l3
	sdivcc	%o1,	0x1548,	%i6
	array32	%l0,	%i0,	%i7
	ldub	[%l7 + 0x69],	%i5
	faligndata	%f22,	%f18,	%f16
	fmovrse	%g1,	%f12,	%f4
	alignaddrl	%o0,	%i3,	%o7
	edge32n	%g3,	%g4,	%l1
	fzeros	%f12
	edge8n	%o5,	%g2,	%g6
	edge8n	%i1,	%o2,	%l2
	std	%f0,	[%l7 + 0x60]
	fcmpgt32	%f0,	%f18,	%g7
	edge8ln	%l5,	%l4,	%l6
	and	%g5,	0x04F6,	%o6
	ldub	[%l7 + 0x74],	%i2
	movpos	%xcc,	%o4,	%o3
	fcmple32	%f22,	%f28,	%i4
	sir	0x0721
	movvs	%xcc,	%o1,	%i6
	xnor	%l3,	0x05B0,	%i0
	sdivcc	%l0,	0x002D,	%i7
	faligndata	%f8,	%f28,	%f24
	fcmpgt16	%f8,	%f26,	%i5
	mova	%xcc,	%o0,	%i3
	fpack16	%f8,	%f16
	add	%o7,	0x08A5,	%g1
	fcmple16	%f2,	%f12,	%g3
	fnot1s	%f31,	%f22
	fandnot1	%f28,	%f16,	%f2
	movcs	%xcc,	%l1,	%g4
	mulx	%g2,	0x02C4,	%g6
	edge32	%o5,	%o2,	%l2
	andncc	%i1,	%l5,	%l4
	andcc	%g7,	%l6,	%g5
	edge16n	%o6,	%o4,	%o3
	alignaddrl	%i4,	%o1,	%i2
	movcc	%xcc,	%i6,	%i0
	movvc	%xcc,	%l3,	%i7
	movcc	%xcc,	%l0,	%i5
	movn	%icc,	%o0,	%i3
	addc	%g1,	%o7,	%g3
	umul	%l1,	%g4,	%g6
	fmovsg	%icc,	%f15,	%f16
	ldub	[%l7 + 0x7F],	%o5
	fornot2s	%f30,	%f4,	%f13
	alignaddrl	%o2,	%g2,	%l2
	movvs	%icc,	%l5,	%i1
	edge8ln	%l4,	%l6,	%g5
	std	%f30,	[%l7 + 0x70]
	udivx	%o6,	0x1E75,	%g7
	movrlz	%o3,	%o4,	%o1
	array16	%i4,	%i6,	%i2
	stb	%l3,	[%l7 + 0x7B]
	udivx	%i7,	0x1113,	%i0
	ld	[%l7 + 0x60],	%f18
	srlx	%i5,	0x11,	%o0
	movre	%i3,	%g1,	%l0
	edge8n	%o7,	%g3,	%l1
	movgu	%xcc,	%g6,	%g4
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%o2
	ldsb	[%l7 + 0x2B],	%g2
	fpadd16s	%f16,	%f20,	%f2
	fsrc1	%f8,	%f8
	alignaddrl	%l2,	%l5,	%o5
	fnors	%f31,	%f18,	%f15
	std	%f0,	[%l7 + 0x50]
	addc	%l4,	0x0466,	%l6
	andcc	%g5,	0x07BE,	%i1
	edge16n	%g7,	%o3,	%o4
	fandnot2	%f10,	%f12,	%f26
	ldd	[%l7 + 0x58],	%f16
	udiv	%o1,	0x1AF3,	%o6
	edge16	%i4,	%i6,	%i2
	srax	%l3,	%i0,	%i5
	movcs	%icc,	%i7,	%i3
	sra	%g1,	0x0B,	%l0
	fmovsvs	%icc,	%f0,	%f24
	udivcc	%o7,	0x1BC6,	%o0
	xor	%g3,	%l1,	%g6
	sethi	0x1549,	%o2
	siam	0x1
	sra	%g4,	%l2,	%g2
	ldub	[%l7 + 0x33],	%l5
	movcc	%xcc,	%l4,	%l6
	fsrc1s	%f8,	%f19
	movleu	%xcc,	%g5,	%i1
	edge16ln	%o5,	%g7,	%o4
	udiv	%o1,	0x1173,	%o6
	movneg	%xcc,	%i4,	%i6
	movrlez	%i2,	0x159,	%o3
	movneg	%xcc,	%i0,	%i5
	sth	%l3,	[%l7 + 0x3C]
	edge32n	%i3,	%i7,	%g1
	array16	%l0,	%o0,	%o7
	movrlz	%g3,	0x26C,	%g6
	fmovsne	%xcc,	%f31,	%f18
	andncc	%l1,	%g4,	%l2
	movrgez	%g2,	%l5,	%o2
	orcc	%l6,	%g5,	%l4
	alignaddrl	%o5,	%g7,	%o4
	subc	%i1,	0x0D75,	%o6
	fpadd16s	%f1,	%f14,	%f0
	movvs	%icc,	%i4,	%o1
	fmovdpos	%icc,	%f4,	%f15
	smulcc	%i2,	%i6,	%o3
	fandnot1	%f12,	%f28,	%f14
	fmul8ulx16	%f0,	%f18,	%f26
	pdist	%f26,	%f4,	%f14
	movg	%xcc,	%i0,	%i5
	movrne	%l3,	%i3,	%g1
	orcc	%l0,	%o0,	%o7
	lduh	[%l7 + 0x70],	%g3
	edge32n	%i7,	%g6,	%g4
	srlx	%l1,	0x14,	%l2
	fpsub32s	%f21,	%f13,	%f26
	ld	[%l7 + 0x34],	%f4
	movrne	%g2,	0x111,	%l5
	movrne	%l6,	0x37C,	%g5
	movcc	%xcc,	%l4,	%o5
	edge16l	%o2,	%o4,	%i1
	umulcc	%g7,	0x01A3,	%o6
	popc	%i4,	%o1
	umul	%i2,	%i6,	%o3
	restore %i5, 0x0F4D, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l3,	0x0347,	%g1
	movpos	%xcc,	%l0,	%o0
	sdiv	%o7,	0x0111,	%g3
	movrlez	%i3,	%g6,	%i7
	stw	%g4,	[%l7 + 0x74]
	sll	%l1,	%g2,	%l5
	fpackfix	%f14,	%f4
	sdivcc	%l6,	0x098C,	%g5
	add	%l2,	%l4,	%o2
	fpsub32	%f0,	%f0,	%f0
	sll	%o5,	%i1,	%g7
	srax	%o4,	0x10,	%i4
	stb	%o6,	[%l7 + 0x69]
	sll	%i2,	%o1,	%i6
	subccc	%o3,	0x0F36,	%i0
	movrlz	%l3,	0x30B,	%g1
	nop
	set	0x58, %i0
	std	%f20,	[%l7 + %i0]
	st	%f11,	[%l7 + 0x14]
	ldub	[%l7 + 0x1A],	%l0
	ldsh	[%l7 + 0x70],	%o0
	fpadd32s	%f31,	%f22,	%f0
	fsrc2s	%f24,	%f24
	edge32	%i5,	%o7,	%g3
	subc	%i3,	%i7,	%g4
	ldsb	[%l7 + 0x13],	%l1
	xorcc	%g6,	0x150F,	%l5
	sllx	%l6,	0x07,	%g2
	subccc	%l2,	%l4,	%o2
	edge32ln	%o5,	%i1,	%g7
	ldub	[%l7 + 0x0C],	%g5
	mulx	%i4,	%o6,	%i2
	edge32l	%o1,	%o4,	%i6
	edge16	%i0,	%l3,	%o3
	fmovde	%xcc,	%f19,	%f11
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	array16	%l0,	%g3,	%i3
	st	%f27,	[%l7 + 0x74]
	nop
	set	0x78, %i2
	ldsh	[%l7 + %i2],	%o7
	ldd	[%l7 + 0x20],	%f4
	mulscc	%g4,	%l1,	%g6
	ldub	[%l7 + 0x0D],	%l5
	mulscc	%i7,	0x0E9C,	%l6
	andn	%g2,	0x0E73,	%l4
	movl	%xcc,	%l2,	%o5
	alignaddr	%o2,	%i1,	%g5
	array8	%g7,	%o6,	%i2
	umulcc	%o1,	0x0897,	%i4
	movg	%xcc,	%o4,	%i6
	fone	%f18
	edge32ln	%l3,	%o3,	%i0
	stb	%o0,	[%l7 + 0x66]
	array8	%g1,	%i5,	%g3
	sth	%i3,	[%l7 + 0x78]
	fnand	%f18,	%f14,	%f0
	fmovsvs	%icc,	%f1,	%f31
	movge	%xcc,	%l0,	%g4
	movrgez	%o7,	0x030,	%l1
	fornot2s	%f22,	%f10,	%f14
	movneg	%xcc,	%g6,	%i7
	movgu	%icc,	%l6,	%g2
	orcc	%l5,	0x0127,	%l4
	fcmpd	%fcc3,	%f20,	%f0
	sir	0x1335
	or	%o5,	%l2,	%i1
	umul	%g5,	0x1557,	%g7
	fmuld8ulx16	%f11,	%f15,	%f24
	ldsh	[%l7 + 0x18],	%o6
	array8	%i2,	%o1,	%o2
	lduw	[%l7 + 0x58],	%o4
	fcmped	%fcc2,	%f16,	%f8
	addc	%i4,	0x124A,	%l3
	fmovdn	%icc,	%f13,	%f17
	edge32ln	%i6,	%i0,	%o0
	std	%f12,	[%l7 + 0x08]
	movrlz	%o3,	0x098,	%i5
	xnor	%g3,	0x19A1,	%i3
	alignaddrl	%l0,	%g1,	%o7
	smulcc	%l1,	0x1318,	%g6
	movrlez	%i7,	%g4,	%l6
	fcmpgt32	%f10,	%f2,	%g2
	edge32n	%l4,	%l5,	%o5
	subc	%i1,	%g5,	%l2
	save %g7, 0x16D0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i2,	%o2,	%o1
	stb	%o4,	[%l7 + 0x39]
	subcc	%i4,	%i6,	%i0
	addc	%o0,	%o3,	%i5
	srl	%l3,	0x01,	%g3
	edge8ln	%i3,	%g1,	%o7
	movvs	%icc,	%l0,	%l1
	fxnors	%f6,	%f30,	%f20
	mulscc	%g6,	%i7,	%l6
	edge32n	%g4,	%g2,	%l5
	sir	0x15A7
	sethi	0x1392,	%l4
	stb	%i1,	[%l7 + 0x77]
	fpsub16	%f10,	%f26,	%f4
	ldx	[%l7 + 0x40],	%o5
	movl	%xcc,	%l2,	%g5
	udiv	%o6,	0x1B72,	%g7
	array16	%o2,	%i2,	%o1
	fandnot2	%f14,	%f6,	%f26
	fandnot2s	%f7,	%f24,	%f12
	movleu	%xcc,	%i4,	%o4
	edge32n	%i6,	%o0,	%i0
	fsrc2s	%f1,	%f30
	alignaddr	%o3,	%i5,	%g3
	edge8	%i3,	%l3,	%g1
	srlx	%l0,	%o7,	%g6
	fpsub16	%f24,	%f8,	%f16
	edge8l	%l1,	%l6,	%g4
	st	%f10,	[%l7 + 0x40]
	or	%i7,	0x0EAF,	%g2
	srl	%l5,	0x08,	%i1
	fmovs	%f31,	%f2
	smulcc	%o5,	0x07CF,	%l2
	lduw	[%l7 + 0x24],	%l4
	fandnot1s	%f25,	%f31,	%f6
	fnot2	%f18,	%f14
	edge16n	%o6,	%g5,	%g7
	add	%i2,	0x0B47,	%o2
	movrlz	%o1,	0x1BD,	%i4
	save %o4, 0x0315, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o0,	0x02,	%i0
	sir	0x0C8E
	xnor	%o3,	%g3,	%i3
	addcc	%l3,	%i5,	%l0
	sdivx	%o7,	0x1397,	%g6
	fsrc1s	%f1,	%f0
	edge32ln	%l1,	%l6,	%g1
	xor	%i7,	0x1DD5,	%g4
	and	%l5,	%i1,	%o5
	fzeros	%f24
	or	%l2,	0x0F42,	%g2
	movvs	%icc,	%o6,	%l4
	edge16n	%g5,	%i2,	%o2
	umul	%g7,	%i4,	%o4
	movneg	%xcc,	%i6,	%o1
	alignaddr	%o0,	%i0,	%g3
	sethi	0x170B,	%o3
	fabsd	%f8,	%f6
	sdivx	%i3,	0x02ED,	%i5
	edge16	%l0,	%o7,	%l3
	ldub	[%l7 + 0x6E],	%l1
	movne	%xcc,	%g6,	%l6
	ldsb	[%l7 + 0x62],	%i7
	edge8n	%g1,	%l5,	%i1
	movcs	%icc,	%o5,	%l2
	movre	%g4,	0x26C,	%g2
	addc	%l4,	0x04E2,	%g5
	movcs	%xcc,	%i2,	%o6
	movl	%icc,	%g7,	%i4
	sdiv	%o2,	0x1014,	%o4
	ldx	[%l7 + 0x20],	%i6
	fcmpd	%fcc3,	%f14,	%f18
	array32	%o0,	%i0,	%o1
	fmovsvs	%icc,	%f7,	%f14
	movleu	%icc,	%o3,	%i3
	or	%i5,	0x1FC8,	%g3
	fabss	%f26,	%f16
	sdivcc	%l0,	0x0BE2,	%l3
	restore %l1, %g6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	%o7,	%g1
	edge8	%i1,	%o5,	%l2
	lduh	[%l7 + 0x22],	%g4
	fmovsvs	%icc,	%f16,	%f16
	fmovrsgz	%g2,	%f27,	%f11
	fcmpne32	%f26,	%f8,	%l5
	andn	%l4,	%i2,	%g5
	popc	0x1F2C,	%g7
	fmovdneg	%xcc,	%f12,	%f6
	subcc	%o6,	0x1923,	%o2
	movcc	%xcc,	%i4,	%i6
	edge32	%o0,	%o4,	%i0
	srax	%o1,	%o3,	%i3
	fmul8ulx16	%f24,	%f18,	%f30
	std	%f12,	[%l7 + 0x68]
	udiv	%g3,	0x0D1F,	%l0
	addc	%l3,	%i5,	%l1
	movcc	%xcc,	%l6,	%i7
	movg	%icc,	%o7,	%g6
	stx	%g1,	[%l7 + 0x78]
	add	%o5,	0x01A3,	%i1
	addc	%g4,	0x077A,	%g2
	movneg	%icc,	%l5,	%l2
	addc	%l4,	%g5,	%i2
	move	%xcc,	%o6,	%g7
	srlx	%i4,	%o2,	%i6
	fmovrsgez	%o4,	%f30,	%f4
	udivx	%o0,	0x106B,	%i0
	array16	%o1,	%i3,	%g3
	movne	%icc,	%l0,	%l3
	fnands	%f31,	%f5,	%f31
	sdiv	%i5,	0x0C0B,	%l1
	edge8n	%o3,	%l6,	%o7
	xnor	%g6,	0x0AA0,	%g1
	orncc	%i7,	0x026E,	%i1
	and	%o5,	%g4,	%l5
	sllx	%l2,	0x12,	%g2
	ldd	[%l7 + 0x78],	%l4
	movne	%icc,	%i2,	%g5
	ldd	[%l7 + 0x08],	%g6
	fmul8x16	%f11,	%f0,	%f28
	edge16ln	%o6,	%i4,	%o2
	sdiv	%o4,	0x1ACE,	%o0
	ld	[%l7 + 0x0C],	%f15
	edge32ln	%i6,	%o1,	%i0
	fsrc2	%f24,	%f18
	edge8n	%g3,	%l0,	%i3
	add	%l3,	%l1,	%o3
	save %i5, 0x0319, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%l6,	%f19,	%f11
	movrlez	%g6,	%i7,	%g1
	srl	%o5,	%i1,	%l5
	movpos	%xcc,	%l2,	%g4
	stx	%l4,	[%l7 + 0x58]
	save %i2, %g2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o6,	%i4,	%g7
	array16	%o4,	%o0,	%i6
	ldd	[%l7 + 0x40],	%o2
	fcmple32	%f20,	%f14,	%i0
	mulscc	%g3,	%o1,	%l0
	sir	0x088B
	fmovrde	%l3,	%f10,	%f6
	nop
	set	0x78, %i3
	lduh	[%l7 + %i3],	%l1
	ldd	[%l7 + 0x60],	%f8
	movneg	%xcc,	%i3,	%o3
	movrgez	%i5,	0x0AC,	%l6
	addccc	%g6,	0x1682,	%i7
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	udivcc	%i1,	0x036E,	%o5
	fmovrslez	%l2,	%f24,	%f9
	orcc	%l5,	%l4,	%i2
	edge16ln	%g2,	%g4,	%o6
	edge16n	%i4,	%g7,	%g5
	or	%o0,	%o4,	%o2
	array32	%i0,	%g3,	%i6
	movrgz	%l0,	0x1CE,	%l3
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f6
	edge16l	%o1,	%i3,	%l1
	edge8ln	%i5,	%l6,	%o3
	movpos	%icc,	%g6,	%g1
	movrgez	%o7,	%i7,	%i1
	fcmpd	%fcc2,	%f30,	%f8
	addc	%l2,	%o5,	%l5
	movrlez	%l4,	%g2,	%g4
	sll	%i2,	%o6,	%i4
	srl	%g7,	%g5,	%o4
	andncc	%o2,	%o0,	%g3
	or	%i0,	%l0,	%l3
	edge8l	%o1,	%i6,	%i3
	movgu	%icc,	%i5,	%l6
	fmul8sux16	%f10,	%f22,	%f20
	alignaddr	%l1,	%o3,	%g1
	xorcc	%g6,	0x11CE,	%i7
	movrlez	%i1,	0x1AF,	%l2
	movpos	%icc,	%o7,	%l5
	orn	%l4,	0x1A73,	%g2
	movle	%icc,	%g4,	%i2
	addc	%o6,	0x1D99,	%o5
	sir	0x1DD9
	movrgez	%g7,	%i4,	%o4
	alignaddr	%g5,	%o2,	%o0
	edge16ln	%g3,	%i0,	%l3
	sra	%l0,	0x0A,	%i6
	umulcc	%o1,	%i3,	%l6
	movle	%xcc,	%i5,	%o3
	fmovdg	%xcc,	%f15,	%f25
	fmovdleu	%icc,	%f9,	%f28
	std	%f24,	[%l7 + 0x40]
	array16	%l1,	%g6,	%i7
	mulscc	%g1,	0x17E4,	%l2
	edge32n	%i1,	%o7,	%l4
	fmovsleu	%xcc,	%f28,	%f21
	movn	%xcc,	%g2,	%l5
	movre	%g4,	0x30A,	%o6
	stw	%o5,	[%l7 + 0x58]
	fmovsl	%xcc,	%f28,	%f17
	addccc	%g7,	0x06C1,	%i4
	fmovrdne	%o4,	%f12,	%f8
	fmovdge	%icc,	%f4,	%f18
	movge	%xcc,	%i2,	%g5
	nop
	set	0x28, %g6
	lduw	[%l7 + %g6],	%o0
	fandnot1	%f4,	%f0,	%f30
	fornot1s	%f2,	%f19,	%f18
	movcc	%icc,	%o2,	%g3
	fmovdvs	%icc,	%f12,	%f10
	movn	%icc,	%i0,	%l3
	addc	%i6,	%l0,	%o1
	movrgez	%l6,	%i3,	%i5
	stw	%l1,	[%l7 + 0x14]
	move	%icc,	%o3,	%g6
	std	%f8,	[%l7 + 0x38]
	fxnor	%f14,	%f8,	%f12
	fmovsl	%xcc,	%f2,	%f17
	restore %g1, 0x0FB1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l2,	%o7
	movneg	%icc,	%l4,	%i1
	mulx	%g2,	%g4,	%o6
	ld	[%l7 + 0x60],	%f29
	ldd	[%l7 + 0x60],	%f28
	move	%icc,	%l5,	%o5
	movne	%xcc,	%g7,	%o4
	movre	%i4,	0x301,	%i2
	movge	%xcc,	%o0,	%g5
	addccc	%g3,	%i0,	%o2
	orn	%i6,	%l3,	%l0
	ldd	[%l7 + 0x08],	%i6
	sethi	0x1CE1,	%i3
	fcmpne16	%f6,	%f6,	%i5
	save %l1, %o3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%g1,	%i7
	xor	%o7,	%l4,	%l2
	orncc	%g2,	0x001F,	%i1
	srax	%g4,	0x15,	%l5
	edge32ln	%o5,	%g7,	%o6
	subc	%o4,	0x1738,	%i2
	mulscc	%i4,	0x0A40,	%o0
	orncc	%g3,	0x0090,	%i0
	andcc	%o2,	0x1B5F,	%g5
	movle	%icc,	%i6,	%l0
	edge32	%l6,	%i3,	%i5
	ldsw	[%l7 + 0x54],	%l3
	add	%o3,	0x06F7,	%l1
	ldsb	[%l7 + 0x2F],	%g6
	ld	[%l7 + 0x4C],	%f10
	fornot1s	%f31,	%f5,	%f26
	srlx	%o1,	0x19,	%g1
	alignaddrl	%i7,	%l4,	%l2
	movne	%xcc,	%g2,	%i1
	edge16ln	%g4,	%l5,	%o5
	fmovsneg	%xcc,	%f11,	%f16
	ldsb	[%l7 + 0x1B],	%g7
	edge8ln	%o6,	%o7,	%o4
	sllx	%i2,	0x06,	%i4
	edge8	%g3,	%o0,	%o2
	andcc	%i0,	%i6,	%l0
	subcc	%l6,	%i3,	%g5
	edge32n	%i5,	%o3,	%l1
	ldsh	[%l7 + 0x3C],	%l3
	sdivx	%g6,	0x1263,	%o1
	movrgez	%i7,	0x01A,	%g1
	lduw	[%l7 + 0x4C],	%l2
	orcc	%g2,	%l4,	%i1
	srl	%g4,	%l5,	%o5
	edge16ln	%o6,	%g7,	%o7
	fmovrdlez	%o4,	%f8,	%f10
	fpmerge	%f7,	%f0,	%f16
	smulcc	%i2,	%i4,	%g3
	fsrc1s	%f0,	%f2
	udivx	%o2,	0x0BD9,	%o0
	sth	%i0,	[%l7 + 0x28]
	subcc	%l0,	0x027E,	%i6
	addccc	%i3,	%l6,	%g5
	array8	%o3,	%l1,	%l3
	or	%g6,	%i5,	%i7
	lduw	[%l7 + 0x70],	%g1
	alignaddr	%o1,	%l2,	%l4
	fmovsn	%icc,	%f21,	%f4
	stb	%i1,	[%l7 + 0x68]
	fnot1s	%f25,	%f9
	movneg	%xcc,	%g4,	%l5
	andncc	%o5,	%g2,	%g7
	edge8ln	%o6,	%o7,	%o4
	udivcc	%i4,	0x17ED,	%g3
	fmovdleu	%icc,	%f18,	%f27
	movle	%icc,	%o2,	%o0
	fnand	%f24,	%f6,	%f12
	andn	%i0,	0x1739,	%i2
	edge32	%i6,	%l0,	%l6
	xnorcc	%g5,	0x1A0A,	%i3
	addc	%l1,	%o3,	%g6
	xor	%i5,	0x1E0E,	%l3
	popc	%i7,	%o1
	movrlez	%l2,	0x0E7,	%l4
	sethi	0x15E4,	%g1
	ld	[%l7 + 0x34],	%f5
	ldsw	[%l7 + 0x1C],	%g4
	alignaddr	%i1,	%l5,	%o5
	array16	%g7,	%g2,	%o6
	fmovdne	%xcc,	%f29,	%f26
	add	%o4,	%i4,	%o7
	fcmped	%fcc2,	%f14,	%f10
	srl	%o2,	0x03,	%o0
	addccc	%g3,	0x1D49,	%i0
	movg	%xcc,	%i6,	%i2
	fnot2s	%f27,	%f17
	movvs	%icc,	%l6,	%l0
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%g4
	sth	%l1,	[%l7 + 0x24]
	smulcc	%o3,	%g6,	%i3
	fmovdcs	%icc,	%f18,	%f9
	ldsw	[%l7 + 0x24],	%l3
	subc	%i7,	0x1716,	%i5
	fcmpd	%fcc1,	%f2,	%f22
	ldsh	[%l7 + 0x10],	%o1
	sdivx	%l4,	0x0A81,	%g1
	udivcc	%g4,	0x0AD6,	%i1
	array16	%l2,	%l5,	%o5
	subc	%g2,	0x0B59,	%g7
	sdivx	%o4,	0x069B,	%o6
	movrgz	%i4,	0x19A,	%o2
	edge32ln	%o0,	%g3,	%o7
	fcmpgt32	%f20,	%f6,	%i6
	orn	%i0,	%i2,	%l0
	sll	%l6,	%l1,	%o3
	sll	%g6,	%i3,	%l3
	addccc	%i7,	0x17AD,	%i5
	edge32ln	%o1,	%g5,	%l4
	ld	[%l7 + 0x64],	%f12
	fmovsvs	%xcc,	%f25,	%f6
	subcc	%g1,	0x109A,	%g4
	ldsw	[%l7 + 0x4C],	%i1
	fmovrslez	%l2,	%f25,	%f25
	edge8n	%l5,	%g2,	%o5
	edge32	%g7,	%o6,	%o4
	movcc	%xcc,	%o2,	%o0
	movcc	%icc,	%i4,	%g3
	edge16l	%i6,	%o7,	%i0
	umul	%l0,	0x1493,	%l6
	movvs	%icc,	%l1,	%i2
	orn	%o3,	%g6,	%l3
	movcc	%icc,	%i3,	%i5
	movgu	%icc,	%i7,	%o1
	edge32	%g5,	%g1,	%l4
	movgu	%xcc,	%g4,	%l2
	fornot2	%f20,	%f22,	%f6
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	xorcc	%g7,	0x0879,	%g2
	andncc	%o4,	%o6,	%o2
	andcc	%i4,	%o0,	%g3
	move	%icc,	%i6,	%o7
	movle	%icc,	%l0,	%i0
	mulscc	%l6,	%l1,	%i2
	sdivcc	%o3,	0x1357,	%l3
	movrgz	%g6,	%i5,	%i3
	fmovrsgz	%o1,	%f16,	%f3
	edge8n	%g5,	%i7,	%l4
	subc	%g1,	0x0C0B,	%g4
	edge8n	%l5,	%l2,	%o5
	edge8l	%i1,	%g7,	%g2
	fmovdcs	%xcc,	%f7,	%f0
	movgu	%xcc,	%o6,	%o2
	fnot1s	%f14,	%f7
	andcc	%i4,	0x1C2F,	%o4
	andcc	%g3,	0x008D,	%o0
	fmovrdgez	%o7,	%f16,	%f16
	fmovsneg	%xcc,	%f24,	%f30
	edge32	%i6,	%i0,	%l0
	movneg	%xcc,	%l1,	%i2
	lduh	[%l7 + 0x56],	%o3
	sub	%l6,	%g6,	%l3
	movle	%icc,	%i5,	%i3
	orncc	%g5,	0x1866,	%i7
	movgu	%icc,	%l4,	%g1
	movvc	%xcc,	%o1,	%l5
	ldsh	[%l7 + 0x1E],	%g4
	srax	%l2,	%o5,	%g7
	sth	%i1,	[%l7 + 0x5A]
	andncc	%g2,	%o2,	%o6
	fornot2s	%f23,	%f9,	%f10
	fcmpeq16	%f4,	%f2,	%o4
	subc	%g3,	0x0050,	%o0
	fmovrsne	%i4,	%f6,	%f23
	subcc	%o7,	0x0C97,	%i0
	fcmpes	%fcc3,	%f10,	%f3
	fmul8sux16	%f24,	%f12,	%f0
	orncc	%i6,	%l0,	%l1
	sll	%i2,	0x03,	%o3
	fsrc2	%f30,	%f8
	fmovsn	%icc,	%f2,	%f14
	array8	%l6,	%g6,	%i5
	ld	[%l7 + 0x44],	%f29
	edge8	%i3,	%l3,	%g5
	stw	%l4,	[%l7 + 0x68]
	andn	%g1,	0x0E7A,	%i7
	addccc	%o1,	0x182B,	%l5
	alignaddrl	%g4,	%o5,	%g7
	smul	%l2,	%i1,	%o2
	edge32	%o6,	%o4,	%g2
	movvc	%icc,	%o0,	%i4
	movleu	%xcc,	%o7,	%i0
	sub	%g3,	%i6,	%l1
	ldd	[%l7 + 0x68],	%i2
	fmovrdgez	%o3,	%f4,	%f20
	fcmpgt16	%f26,	%f26,	%l0
	popc	0x0F37,	%l6
	save %i5, 0x0E23, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f14,	%f18
	fmovrdne	%l3,	%f22,	%f12
	edge16	%g6,	%g5,	%g1
	sdivcc	%i7,	0x0E98,	%l4
	xnor	%o1,	0x065E,	%g4
	edge8n	%o5,	%l5,	%g7
	fandnot1s	%f9,	%f26,	%f15
	umulcc	%i1,	0x1A86,	%o2
	array32	%o6,	%o4,	%l2
	fmovdvs	%xcc,	%f0,	%f8
	popc	0x0E6A,	%g2
	ldsh	[%l7 + 0x66],	%o0
	mulx	%o7,	0x09BC,	%i0
	udivcc	%g3,	0x1658,	%i6
	move	%xcc,	%l1,	%i2
	movne	%xcc,	%o3,	%l0
	orn	%i4,	%l6,	%i5
	orncc	%l3,	%g6,	%i3
	ldsh	[%l7 + 0x50],	%g5
	siam	0x0
	movneg	%icc,	%g1,	%i7
	subc	%o1,	%l4,	%g4
	sethi	0x08DD,	%o5
	mova	%icc,	%l5,	%g7
	smul	%i1,	%o2,	%o6
	ldsh	[%l7 + 0x72],	%l2
	edge16n	%o4,	%g2,	%o0
	smulcc	%o7,	0x1F60,	%g3
	ldsh	[%l7 + 0x58],	%i0
	movrgz	%l1,	0x1CB,	%i2
	movg	%xcc,	%o3,	%l0
	ldd	[%l7 + 0x68],	%f26
	addcc	%i4,	0x06A6,	%l6
	ldsh	[%l7 + 0x14],	%i5
	movrlz	%l3,	0x37F,	%g6
	fmul8x16al	%f12,	%f23,	%f26
	ldx	[%l7 + 0x28],	%i6
	edge32n	%i3,	%g5,	%i7
	xor	%g1,	%o1,	%g4
	move	%icc,	%l4,	%l5
	fmul8x16al	%f6,	%f0,	%f20
	movcs	%icc,	%o5,	%i1
	or	%o2,	%o6,	%l2
	addc	%o4,	0x1D8B,	%g7
	ldd	[%l7 + 0x50],	%g2
	fcmple16	%f0,	%f2,	%o7
	fmovrsgez	%g3,	%f4,	%f7
	mulx	%i0,	%l1,	%i2
	ldsb	[%l7 + 0x5E],	%o3
	edge8n	%o0,	%i4,	%l6
	fcmpgt32	%f0,	%f4,	%l0
	fxnors	%f1,	%f27,	%f5
	edge8l	%l3,	%g6,	%i5
	ld	[%l7 + 0x48],	%f9
	edge32	%i3,	%i6,	%i7
	movcs	%xcc,	%g1,	%o1
	or	%g4,	0x17BE,	%g5
	fsrc1	%f18,	%f30
	fmovrdlez	%l5,	%f26,	%f14
	move	%xcc,	%o5,	%i1
	orncc	%l4,	0x197D,	%o6
	ldd	[%l7 + 0x40],	%f6
	fabss	%f31,	%f25
	subccc	%l2,	%o4,	%g7
	addcc	%g2,	0x0A12,	%o2
	or	%g3,	0x049A,	%o7
	subccc	%l1,	%i2,	%o3
	fmuld8ulx16	%f18,	%f10,	%f8
	bshuffle	%f16,	%f0,	%f8
	orcc	%i0,	%i4,	%l6
	movn	%xcc,	%l0,	%l3
	sra	%o0,	0x09,	%i5
	fzeros	%f4
	fmovsvs	%icc,	%f30,	%f12
	sethi	0x120B,	%i3
	sir	0x08CC
	edge32n	%g6,	%i7,	%i6
	edge16	%g1,	%o1,	%g5
	ldsh	[%l7 + 0x24],	%l5
	fnand	%f18,	%f2,	%f10
	movge	%xcc,	%o5,	%i1
	edge16ln	%g4,	%l4,	%l2
	edge16l	%o4,	%g7,	%g2
	movrne	%o2,	0x0A4,	%g3
	edge8n	%o7,	%o6,	%l1
	movl	%icc,	%i2,	%o3
	edge8	%i4,	%i0,	%l0
	movl	%xcc,	%l6,	%o0
	save %i5, 0x0447, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l3,	0x14E5,	%g6
	umul	%i7,	0x073A,	%i6
	movrlz	%o1,	%g1,	%l5
	fnor	%f10,	%f12,	%f16
	ldsb	[%l7 + 0x0E],	%o5
	udivx	%g5,	0x13E8,	%i1
	or	%g4,	%l4,	%o4
	fornot1	%f24,	%f22,	%f8
	umul	%l2,	0x1925,	%g2
	movre	%g7,	%g3,	%o2
	movcs	%icc,	%o7,	%o6
	subccc	%i2,	%l1,	%o3
	orn	%i0,	0x099A,	%l0
	smul	%i4,	%l6,	%i5
	movvs	%icc,	%o0,	%l3
	array8	%i3,	%g6,	%i6
	movl	%icc,	%o1,	%i7
	movl	%icc,	%l5,	%o5
	movn	%icc,	%g5,	%i1
	fnand	%f12,	%f2,	%f22
	fcmpeq32	%f24,	%f2,	%g4
	fornot1s	%f16,	%f27,	%f7
	fpsub32	%f20,	%f28,	%f18
	edge8	%l4,	%g1,	%l2
	fnegd	%f12,	%f14
	edge32	%g2,	%g7,	%g3
	xorcc	%o2,	0x0480,	%o7
	fmovsvs	%xcc,	%f0,	%f25
	fors	%f12,	%f27,	%f12
	ldsh	[%l7 + 0x0A],	%o4
	addcc	%o6,	%l1,	%i2
	fmul8x16al	%f15,	%f6,	%f12
	movre	%o3,	0x1D8,	%l0
	movle	%icc,	%i4,	%l6
	movleu	%xcc,	%i5,	%o0
	smulcc	%i0,	%l3,	%g6
	fmovsl	%icc,	%f0,	%f15
	fmovrsgz	%i3,	%f23,	%f29
	sll	%i6,	0x0C,	%o1
	xorcc	%l5,	%o5,	%i7
	srlx	%i1,	%g5,	%l4
	movcc	%xcc,	%g1,	%l2
	sub	%g2,	0x03B1,	%g4
	sth	%g7,	[%l7 + 0x6C]
	xorcc	%o2,	%g3,	%o4
	udivx	%o6,	0x1ECD,	%l1
	fmovsg	%xcc,	%f16,	%f25
	stx	%o7,	[%l7 + 0x20]
	faligndata	%f10,	%f8,	%f6
	fxnors	%f26,	%f25,	%f19
	and	%i2,	%l0,	%o3
	sllx	%i4,	0x10,	%l6
	ldub	[%l7 + 0x66],	%o0
	sethi	0x118D,	%i5
	edge8l	%i0,	%g6,	%l3
	mulx	%i6,	%i3,	%o1
	fzeros	%f10
	movn	%xcc,	%o5,	%l5
	movle	%xcc,	%i1,	%g5
	fcmpes	%fcc3,	%f0,	%f25
	xnorcc	%l4,	0x1C3C,	%i7
	movcc	%icc,	%l2,	%g1
	sth	%g2,	[%l7 + 0x22]
	movrlz	%g4,	0x132,	%g7
	subccc	%o2,	%g3,	%o4
	smulcc	%o6,	0x00BD,	%o7
	addccc	%i2,	%l0,	%o3
	fmovsa	%xcc,	%f11,	%f12
	umul	%i4,	%l1,	%l6
	fmovrde	%i5,	%f30,	%f14
	movrgz	%i0,	0x166,	%o0
	movne	%icc,	%g6,	%i6
	alignaddrl	%l3,	%i3,	%o5
	movne	%icc,	%o1,	%i1
	fnand	%f2,	%f4,	%f26
	sdivx	%l5,	0x000A,	%g5
	orn	%i7,	%l2,	%g1
	fmul8ulx16	%f16,	%f14,	%f26
	popc	0x0F41,	%g2
	edge8	%l4,	%g7,	%g4
	ldsw	[%l7 + 0x78],	%o2
	udiv	%o4,	0x151F,	%o6
	addc	%o7,	0x1443,	%i2
	movle	%icc,	%g3,	%o3
	fmovrde	%i4,	%f14,	%f6
	udivcc	%l1,	0x1DD2,	%l0
	movrne	%l6,	%i0,	%i5
	sra	%g6,	%o0,	%i6
	movvs	%xcc,	%l3,	%i3
	edge32	%o5,	%o1,	%i1
	movpos	%xcc,	%l5,	%g5
	and	%i7,	%l2,	%g1
	srax	%g2,	0x10,	%g7
	andcc	%l4,	%o2,	%g4
	fxor	%f26,	%f8,	%f20
	xnorcc	%o4,	%o7,	%o6
	orncc	%g3,	0x0E9D,	%o3
	andncc	%i2,	%i4,	%l1
	fnot1	%f0,	%f30
	ldx	[%l7 + 0x28],	%l6
	movrlez	%i0,	%l0,	%i5
	udiv	%o0,	0x086F,	%g6
	umulcc	%i6,	0x0C04,	%i3
	fxors	%f14,	%f28,	%f12
	ld	[%l7 + 0x0C],	%f4
	edge8n	%o5,	%o1,	%i1
	ldub	[%l7 + 0x44],	%l3
	sll	%g5,	0x13,	%i7
	movrne	%l2,	%l5,	%g2
	fcmpgt32	%f16,	%f16,	%g7
	restore %g1, %o2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f24,	%f22
	fmovs	%f28,	%f4
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	movrgz	%g3,	0x248,	%o6
	movcs	%icc,	%o3,	%i2
	sdiv	%i4,	0x0EAE,	%l1
	sra	%l6,	0x03,	%l0
	movrgz	%i5,	0x0B6,	%i0
	edge16n	%g6,	%o0,	%i6
	stw	%o5,	[%l7 + 0x5C]
	fnegd	%f28,	%f4
	movgu	%icc,	%o1,	%i1
	lduw	[%l7 + 0x4C],	%l3
	add	%g5,	0x0111,	%i3
	edge16l	%l2,	%l5,	%i7
	add	%g7,	0x164E,	%g2
	addccc	%g1,	%l4,	%o2
	subccc	%o4,	%g4,	%g3
	fornot2s	%f13,	%f30,	%f25
	xorcc	%o7,	0x0DC2,	%o6
	fones	%f23
	addc	%o3,	%i4,	%l1
	movneg	%icc,	%i2,	%l0
	mulx	%l6,	%i5,	%g6
	edge32ln	%i0,	%o0,	%o5
	movre	%i6,	0x3A8,	%o1
	alignaddr	%i1,	%g5,	%i3
	fcmpne32	%f26,	%f14,	%l2
	andn	%l3,	0x1C6A,	%l5
	ldub	[%l7 + 0x68],	%g7
	srax	%i7,	0x1D,	%g2
	fzero	%f4
	srlx	%l4,	%g1,	%o2
	orcc	%o4,	%g3,	%o7
	fmovsle	%xcc,	%f20,	%f30
	array8	%o6,	%o3,	%g4
	edge8l	%l1,	%i4,	%l0
	sdivx	%l6,	0x06D5,	%i2
	fpadd32	%f30,	%f28,	%f8
	fornot1	%f22,	%f12,	%f14
	srax	%g6,	%i5,	%o0
	ldd	[%l7 + 0x10],	%f12
	sdivcc	%o5,	0x01BC,	%i6
	movvs	%icc,	%o1,	%i1
	srax	%i0,	0x17,	%g5
	and	%l2,	%i3,	%l5
	orn	%g7,	0x17C7,	%i7
	ldd	[%l7 + 0x20],	%f20
	edge16n	%g2,	%l4,	%g1
	array32	%l3,	%o4,	%o2
	lduw	[%l7 + 0x34],	%g3
	xnor	%o6,	%o7,	%g4
	lduw	[%l7 + 0x54],	%l1
	mulscc	%i4,	0x03F0,	%o3
	sdivx	%l6,	0x18E8,	%l0
	movpos	%xcc,	%g6,	%i2
	movcs	%icc,	%i5,	%o5
	edge16	%i6,	%o1,	%i1
	fornot1s	%f0,	%f15,	%f17
	xnor	%o0,	0x1C2C,	%i0
	sll	%l2,	0x19,	%g5
	movrlz	%l5,	%g7,	%i3
	move	%icc,	%g2,	%i7
	movvs	%icc,	%g1,	%l3
	fmovsvc	%icc,	%f31,	%f13
	fpadd16	%f24,	%f30,	%f6
	edge32n	%o4,	%o2,	%l4
	udiv	%g3,	0x1671,	%o7
	movle	%icc,	%o6,	%l1
	fmovrdgz	%i4,	%f0,	%f28
	smul	%g4,	0x1468,	%l6
	ldsw	[%l7 + 0x5C],	%o3
	fpadd16	%f6,	%f18,	%f2
	restore %l0, 0x0AC6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f22,	%f16,	%f24
	movg	%xcc,	%g6,	%i5
	save %i6, %o1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o5,	%i0
	edge32l	%o0,	%g5,	%l5
	addc	%l2,	0x1DE9,	%i3
	sra	%g7,	0x0E,	%i7
	srax	%g1,	%l3,	%o4
	edge16ln	%g2,	%l4,	%o2
	ldd	[%l7 + 0x40],	%f22
	sir	0x0A64
	srl	%g3,	%o7,	%l1
	fpsub16s	%f30,	%f19,	%f11
	fmovsne	%xcc,	%f14,	%f31
	udiv	%i4,	0x1838,	%o6
	movge	%icc,	%l6,	%o3
	movrlez	%g4,	%i2,	%g6
	edge8l	%l0,	%i5,	%o1
	mulx	%i6,	%i1,	%o5
	ldub	[%l7 + 0x5B],	%i0
	lduh	[%l7 + 0x34],	%o0
	movrlz	%l5,	0x270,	%g5
	sdiv	%l2,	0x0A68,	%g7
	fcmpes	%fcc2,	%f2,	%f2
	edge8ln	%i7,	%i3,	%l3
	popc	%o4,	%g1
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%g2
	fxors	%f8,	%f16,	%f2
	movgu	%icc,	%o2,	%g3
	fmovrsgez	%l4,	%f10,	%f3
	xor	%l1,	0x0040,	%i4
	edge8ln	%o7,	%o6,	%o3
	movcs	%icc,	%l6,	%i2
	fandnot2s	%f25,	%f26,	%f26
	movl	%xcc,	%g6,	%l0
	lduh	[%l7 + 0x12],	%g4
	movrlez	%i5,	%i6,	%i1
	smul	%o1,	%o5,	%o0
	andn	%l5,	0x08F6,	%g5
	edge8l	%i0,	%l2,	%g7
	edge8l	%i3,	%i7,	%l3
	orncc	%o4,	%g1,	%g2
	ldd	[%l7 + 0x30],	%f18
	stw	%o2,	[%l7 + 0x34]
	subccc	%l4,	0x1FBD,	%g3
	fcmped	%fcc2,	%f18,	%f16
	siam	0x6
	orcc	%l1,	%i4,	%o6
	fpackfix	%f2,	%f14
	srlx	%o3,	%o7,	%l6
	ldub	[%l7 + 0x46],	%i2
	fnand	%f2,	%f14,	%f30
	edge32n	%g6,	%l0,	%i5
	sra	%i6,	%g4,	%i1
	edge16n	%o5,	%o0,	%l5
	mova	%xcc,	%g5,	%o1
	movvs	%xcc,	%l2,	%g7
	ldd	[%l7 + 0x70],	%f16
	fmovrdgz	%i3,	%f6,	%f10
	and	%i7,	0x1BE2,	%l3
	fmovrde	%o4,	%f2,	%f0
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%g0
	fexpand	%f16,	%f20
	lduh	[%l7 + 0x28],	%i0
	fmovsgu	%icc,	%f6,	%f16
	udivx	%g2,	0x02DE,	%o2
	fxnors	%f6,	%f16,	%f19
	fmovd	%f2,	%f28
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	movcc	%icc,	%i4,	%l1
	sll	%o6,	%o7,	%o3
	fnegs	%f24,	%f0
	fpsub16s	%f17,	%f28,	%f5
	sth	%l6,	[%l7 + 0x22]
	mova	%xcc,	%g6,	%i2
	movneg	%icc,	%l0,	%i6
	smul	%g4,	%i5,	%o5
	ldx	[%l7 + 0x60],	%o0
	andn	%i1,	%l5,	%g5
	save %l2, %g7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i3,	0x18E7,	%i7
	movrgz	%l3,	0x35A,	%o4
	edge8l	%i0,	%g1,	%g2
	ldsw	[%l7 + 0x2C],	%g3
	lduh	[%l7 + 0x4C],	%o2
	alignaddr	%i4,	%l4,	%o6
	xnor	%o7,	0x1851,	%o3
	fmovrdlz	%l6,	%f4,	%f4
	smul	%l1,	%i2,	%l0
	movpos	%xcc,	%i6,	%g4
	fmovrslz	%g6,	%f28,	%f17
	movcc	%xcc,	%i5,	%o0
	umulcc	%i1,	0x022E,	%l5
	fexpand	%f22,	%f2
	umul	%o5,	%l2,	%g5
	movn	%xcc,	%g7,	%o1
	or	%i7,	%l3,	%i3
	movcs	%xcc,	%i0,	%o4
	movre	%g2,	%g3,	%g1
	sir	0x0DFC
	andn	%i4,	0x178B,	%o2
	or	%o6,	%o7,	%l4
	movrlez	%l6,	0x3D8,	%l1
	sll	%i2,	0x08,	%l0
	fpmerge	%f17,	%f1,	%f18
	smulcc	%o3,	0x145E,	%i6
	restore %g6, %i5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i1,	0x0EB0,	%l5
	srl	%o5,	0x15,	%g4
	addccc	%g5,	0x1CD5,	%l2
	st	%f21,	[%l7 + 0x5C]
	stw	%g7,	[%l7 + 0x70]
	smulcc	%i7,	0x1348,	%l3
	movrgez	%o1,	%i0,	%i3
	array16	%o4,	%g2,	%g1
	ldsb	[%l7 + 0x52],	%g3
	ldsw	[%l7 + 0x68],	%o2
	sir	0x1CE6
	addccc	%o6,	0x08AB,	%i4
	edge8l	%l4,	%o7,	%l6
	fmovd	%f24,	%f26
	fmovrslez	%l1,	%f22,	%f8
	xnorcc	%l0,	0x113D,	%i2
	sdiv	%i6,	0x1573,	%g6
	nop
	set	0x0A, %g2
	ldsh	[%l7 + %g2],	%o3
	fxnors	%f21,	%f5,	%f30
	fmovsn	%icc,	%f16,	%f20
	ldd	[%l7 + 0x68],	%f4
	array32	%o0,	%i5,	%i1
	fornot2	%f8,	%f6,	%f8
	array32	%o5,	%l5,	%g4
	xorcc	%l2,	%g5,	%i7
	movcc	%icc,	%g7,	%l3
	popc	%i0,	%i3
	udivcc	%o4,	0x131A,	%o1
	movvs	%xcc,	%g1,	%g3
	fmuld8sux16	%f18,	%f29,	%f2
	movl	%xcc,	%g2,	%o2
	subc	%o6,	%l4,	%o7
	movvs	%xcc,	%i4,	%l1
	fmovdcc	%icc,	%f21,	%f25
	or	%l6,	%i2,	%l0
	andncc	%i6,	%o3,	%g6
	fmovdl	%icc,	%f13,	%f28
	movrgez	%o0,	0x09F,	%i5
	sir	0x0A63
	add	%i1,	0x025F,	%o5
	edge8ln	%g4,	%l5,	%l2
	fmovdge	%xcc,	%f30,	%f13
	save %g5, 0x1F31, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l3,	%i0,	%i7
	fmovdleu	%xcc,	%f25,	%f5
	sdivx	%i3,	0x020E,	%o4
	movre	%g1,	%g3,	%o1
	fornot1s	%f24,	%f12,	%f1
	orn	%o2,	0x0117,	%g2
	movrlez	%l4,	%o7,	%o6
	udivcc	%i4,	0x0E69,	%l6
	bshuffle	%f10,	%f28,	%f2
	subc	%i2,	%l0,	%i6
	edge32l	%l1,	%g6,	%o3
	edge16n	%i5,	%o0,	%o5
	fornot1	%f10,	%f18,	%f14
	movcs	%xcc,	%g4,	%i1
	fmovdne	%icc,	%f10,	%f3
	fmovscs	%xcc,	%f21,	%f13
	movle	%xcc,	%l2,	%g5
	fnot2s	%f29,	%f8
	lduh	[%l7 + 0x56],	%l5
	array8	%l3,	%g7,	%i0
	stx	%i7,	[%l7 + 0x50]
	lduw	[%l7 + 0x58],	%i3
	fnands	%f17,	%f9,	%f13
	sll	%g1,	0x11,	%g3
	movn	%icc,	%o1,	%o2
	movpos	%icc,	%o4,	%g2
	fpadd32s	%f14,	%f14,	%f11
	fmovsn	%icc,	%f0,	%f11
	and	%l4,	0x06F2,	%o6
	pdist	%f4,	%f10,	%f14
	fpmerge	%f31,	%f9,	%f26
	or	%o7,	%l6,	%i4
	add	%i2,	%i6,	%l0
	fmovsg	%icc,	%f18,	%f18
	fmovdne	%xcc,	%f6,	%f4
	udiv	%g6,	0x0CF0,	%l1
	fsrc1s	%f6,	%f13
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	fsrc1	%f8,	%f20
	fnot1	%f2,	%f2
	movcs	%xcc,	%g4,	%i1
	sll	%o0,	%g5,	%l2
	fmovdcs	%icc,	%f21,	%f27
	movrgez	%l3,	%g7,	%l5
	lduw	[%l7 + 0x7C],	%i0
	fnands	%f30,	%f19,	%f4
	edge32l	%i7,	%i3,	%g1
	fxnor	%f28,	%f14,	%f28
	edge16	%g3,	%o2,	%o1
	edge8l	%o4,	%g2,	%o6
	mulscc	%o7,	%l4,	%l6
	array16	%i2,	%i4,	%l0
	srlx	%i6,	%l1,	%g6
	movre	%o3,	0x0FE,	%i5
	addc	%g4,	%i1,	%o0
	fmovsge	%icc,	%f14,	%f30
	sir	0x14DD
	movrne	%g5,	%l2,	%o5
	movrlez	%g7,	%l5,	%l3
	lduh	[%l7 + 0x38],	%i7
	lduh	[%l7 + 0x16],	%i0
	stw	%g1,	[%l7 + 0x1C]
	movvs	%xcc,	%g3,	%o2
	ldx	[%l7 + 0x28],	%o1
	array8	%o4,	%i3,	%g2
	movvc	%xcc,	%o7,	%l4
	edge32n	%l6,	%o6,	%i2
	movge	%xcc,	%i4,	%i6
	edge16l	%l0,	%l1,	%g6
	srlx	%o3,	%g4,	%i5
	movn	%xcc,	%o0,	%i1
	movne	%icc,	%l2,	%g5
	fors	%f17,	%f11,	%f20
	array8	%g7,	%o5,	%l5
	sethi	0x0C49,	%i7
	addcc	%i0,	%g1,	%g3
	fpsub32s	%f27,	%f1,	%f18
	movgu	%xcc,	%l3,	%o1
	edge8l	%o4,	%o2,	%i3
	fpsub16s	%f11,	%f16,	%f19
	fands	%f0,	%f25,	%f26
	addccc	%o7,	0x1B88,	%g2
	sll	%l4,	0x18,	%o6
	lduw	[%l7 + 0x14],	%i2
	save %i4, 0x1F8B, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l0,	0x0D44,	%l6
	subccc	%g6,	%l1,	%g4
	stw	%o3,	[%l7 + 0x28]
	sdiv	%o0,	0x1703,	%i5
	movgu	%xcc,	%l2,	%g5
	addccc	%g7,	0x0E25,	%o5
	lduh	[%l7 + 0x12],	%i1
	smulcc	%i7,	0x1DB4,	%i0
	orncc	%l5,	0x118C,	%g1
	orcc	%g3,	0x0AE2,	%l3
	movrgz	%o4,	0x01A,	%o2
	movn	%xcc,	%i3,	%o1
	movl	%xcc,	%g2,	%o7
	nop
	set	0x7E, %i5
	lduh	[%l7 + %i5],	%l4
	udivcc	%o6,	0x160C,	%i4
	add	%i2,	0x022C,	%l0
	or	%i6,	0x1B9A,	%g6
	movre	%l6,	0x268,	%l1
	sethi	0x0FA8,	%g4
	movrgez	%o0,	%o3,	%l2
	smul	%i5,	0x05E6,	%g5
	ld	[%l7 + 0x18],	%f28
	movvs	%xcc,	%g7,	%o5
	orcc	%i7,	%i0,	%l5
	fmul8x16	%f30,	%f18,	%f12
	fcmped	%fcc0,	%f0,	%f16
	sir	0x0ED0
	edge32l	%i1,	%g3,	%l3
	addcc	%o4,	%g1,	%o2
	movn	%xcc,	%i3,	%g2
	addc	%o7,	%o1,	%o6
	movvc	%icc,	%i4,	%i2
	fmovdle	%xcc,	%f6,	%f22
	movrgz	%l0,	%i6,	%g6
	fmovd	%f24,	%f10
	edge8	%l4,	%l6,	%l1
	lduw	[%l7 + 0x48],	%o0
	movvs	%icc,	%o3,	%l2
	alignaddrl	%g4,	%g5,	%g7
	ldd	[%l7 + 0x10],	%o4
	stx	%i5,	[%l7 + 0x38]
	sll	%i7,	0x03,	%i0
	fmovsne	%xcc,	%f10,	%f0
	andncc	%l5,	%g3,	%i1
	edge16ln	%o4,	%l3,	%g1
	fmovscs	%xcc,	%f6,	%f16
	fcmped	%fcc1,	%f12,	%f6
	fpadd32s	%f13,	%f19,	%f31
	stw	%o2,	[%l7 + 0x2C]
	subc	%i3,	0x0295,	%o7
	edge16	%g2,	%o6,	%o1
	fcmple32	%f6,	%f12,	%i4
	edge8ln	%i2,	%l0,	%i6
	movrgez	%g6,	0x392,	%l6
	sethi	0x0294,	%l1
	popc	0x05D4,	%l4
	ldub	[%l7 + 0x2B],	%o3
	fmovrdne	%l2,	%f10,	%f16
	fmovscc	%icc,	%f26,	%f7
	fpsub32	%f20,	%f12,	%f26
	fabss	%f7,	%f8
	sdiv	%g4,	0x17B9,	%g5
	movl	%xcc,	%g7,	%o5
	edge16ln	%o0,	%i7,	%i0
	movleu	%xcc,	%i5,	%g3
	movleu	%xcc,	%i1,	%l5
	fmovrsgz	%o4,	%f18,	%f9
	sdivcc	%l3,	0x0F40,	%g1
	fnot2s	%f25,	%f7
	ldsh	[%l7 + 0x40],	%i3
	movcc	%icc,	%o2,	%o7
	ldx	[%l7 + 0x28],	%g2
	sll	%o1,	%i4,	%i2
	fmovrde	%l0,	%f12,	%f10
	edge16ln	%o6,	%i6,	%l6
	xorcc	%g6,	%l1,	%l4
	movvc	%icc,	%o3,	%g4
	fmovdl	%xcc,	%f7,	%f24
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f28
	fones	%f21
	fabss	%f31,	%f23
	addcc	%l2,	%g5,	%o5
	orcc	%g7,	%i7,	%o0
	alignaddr	%i5,	%g3,	%i0
	ld	[%l7 + 0x44],	%f11
	addc	%l5,	0x067C,	%i1
	edge32ln	%o4,	%g1,	%l3
	nop
	set	0x56, %o5
	sth	%o2,	[%l7 + %o5]
	move	%icc,	%i3,	%o7
	movl	%icc,	%o1,	%i4
	fmovdgu	%xcc,	%f0,	%f30
	array16	%g2,	%i2,	%o6
	movvc	%xcc,	%i6,	%l0
	or	%g6,	0x10E0,	%l6
	addc	%l1,	%o3,	%l4
	fabsd	%f30,	%f8
	fmovse	%icc,	%f20,	%f28
	std	%f14,	[%l7 + 0x68]
	edge16ln	%g4,	%g5,	%l2
	movrlez	%g7,	%o5,	%o0
	movn	%icc,	%i5,	%g3
	ldub	[%l7 + 0x57],	%i7
	sdiv	%l5,	0x0041,	%i0
	movgu	%icc,	%o4,	%i1
	fmovsgu	%icc,	%f2,	%f20
	fmovdge	%icc,	%f12,	%f21
	fxnors	%f16,	%f24,	%f30
	mulx	%g1,	%o2,	%l3
	movrne	%i3,	0x2F9,	%o7
	edge32n	%o1,	%g2,	%i4
	restore %o6, 0x09A6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i2,	0x120,	%l0
	edge16l	%l6,	%l1,	%o3
	orn	%l4,	0x0B45,	%g6
	sth	%g4,	[%l7 + 0x3E]
	sth	%l2,	[%l7 + 0x08]
	subcc	%g7,	0x010E,	%g5
	smulcc	%o0,	%o5,	%i5
	fmovdne	%xcc,	%f1,	%f22
	edge8	%i7,	%l5,	%i0
	fpsub16	%f0,	%f10,	%f24
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%g3
	sth	%i1,	[%l7 + 0x20]
	mulx	%o4,	0x110A,	%g1
	andn	%l3,	%i3,	%o7
	edge16n	%o1,	%o2,	%i4
	udiv	%o6,	0x0750,	%i6
	add	%g2,	0x159D,	%i2
	save %l6, %l0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l1,	%g6
	movne	%xcc,	%g4,	%l2
	fmovd	%f20,	%f16
	addc	%g7,	0x10EA,	%l4
	ldsw	[%l7 + 0x48],	%g5
	fcmpd	%fcc0,	%f2,	%f2
	orn	%o0,	0x19A2,	%i5
	subccc	%i7,	%l5,	%i0
	stw	%g3,	[%l7 + 0x64]
	mulx	%o5,	0x0EEA,	%i1
	subcc	%g1,	%o4,	%i3
	edge32n	%l3,	%o1,	%o2
	ld	[%l7 + 0x08],	%f22
	andcc	%o7,	%o6,	%i6
	andcc	%g2,	0x04F1,	%i4
	movle	%xcc,	%l6,	%l0
	movrgez	%o3,	%l1,	%i2
	std	%f28,	[%l7 + 0x50]
	ldd	[%l7 + 0x30],	%g6
	sdiv	%l2,	0x111A,	%g4
	sll	%g7,	%l4,	%g5
	edge16	%i5,	%i7,	%o0
	movle	%icc,	%l5,	%g3
	ldx	[%l7 + 0x68],	%o5
	fnot1	%f14,	%f12
	st	%f13,	[%l7 + 0x3C]
	edge32	%i1,	%i0,	%g1
	edge32l	%i3,	%l3,	%o1
	srlx	%o2,	0x0E,	%o7
	sir	0x17B1
	movre	%o6,	%o4,	%g2
	fmovdneg	%icc,	%f23,	%f3
	edge8	%i4,	%i6,	%l6
	fmovsneg	%icc,	%f0,	%f10
	movre	%l0,	0x3A7,	%o3
	movgu	%icc,	%l1,	%i2
	movge	%xcc,	%g6,	%g4
	ldx	[%l7 + 0x38],	%g7
	edge32	%l4,	%g5,	%l2
	movpos	%icc,	%i7,	%o0
	movre	%l5,	%g3,	%o5
	fpadd16s	%f4,	%f23,	%f20
	sethi	0x0177,	%i1
	srlx	%i5,	%g1,	%i0
	ldub	[%l7 + 0x32],	%l3
	nop
	set	0x48, %l1
	ldsw	[%l7 + %l1],	%i3
	ldub	[%l7 + 0x6A],	%o1
	xnorcc	%o7,	0x14A1,	%o6
	movrne	%o4,	0x194,	%o2
	addc	%g2,	%i4,	%i6
	nop
	set	0x70, %g7
	std	%f16,	[%l7 + %g7]
	fmovrdgez	%l6,	%f8,	%f28
	edge32n	%l0,	%l1,	%o3
	srax	%g6,	%i2,	%g7
	ld	[%l7 + 0x40],	%f15
	edge8	%g4,	%g5,	%l4
	fmovrdne	%i7,	%f26,	%f0
	movvs	%icc,	%o0,	%l5
	edge32ln	%l2,	%g3,	%o5
	array32	%i5,	%i1,	%i0
	fmovdg	%icc,	%f3,	%f7
	smulcc	%g1,	%i3,	%o1
	addcc	%o7,	0x1BF2,	%l3
	fexpand	%f8,	%f4
	fmul8x16al	%f5,	%f28,	%f0
	ldd	[%l7 + 0x68],	%f18
	edge16n	%o6,	%o2,	%o4
	movcs	%xcc,	%g2,	%i4
	edge8	%i6,	%l0,	%l6
	mulscc	%l1,	0x1F7A,	%o3
	udivx	%i2,	0x1A44,	%g7
	fmovdvc	%xcc,	%f21,	%f15
	fors	%f7,	%f13,	%f29
	sdivcc	%g6,	0x067B,	%g5
	ldsb	[%l7 + 0x34],	%l4
	addccc	%g4,	%i7,	%o0
	movrgz	%l2,	0x151,	%g3
	movrlz	%o5,	%l5,	%i1
	edge16l	%i5,	%i0,	%i3
	subcc	%g1,	%o1,	%o7
	fexpand	%f14,	%f18
	udiv	%l3,	0x1B92,	%o2
	ldsb	[%l7 + 0x7F],	%o4
	movcs	%xcc,	%g2,	%i4
	movne	%icc,	%i6,	%o6
	edge32ln	%l0,	%l6,	%o3
	edge16n	%i2,	%l1,	%g6
	fmovsa	%icc,	%f22,	%f23
	lduh	[%l7 + 0x28],	%g5
	movrne	%g7,	0x31D,	%g4
	movpos	%icc,	%l4,	%o0
	movcs	%icc,	%l2,	%g3
	ldd	[%l7 + 0x78],	%f0
	xor	%o5,	%l5,	%i1
	fmovsl	%xcc,	%f20,	%f2
	lduh	[%l7 + 0x4A],	%i7
	movl	%xcc,	%i5,	%i0
	fmovdvs	%xcc,	%f26,	%f3
	udivx	%g1,	0x1619,	%i3
	fmovrslez	%o7,	%f23,	%f13
	std	%f16,	[%l7 + 0x40]
	fmovrdgez	%l3,	%f28,	%f24
	addcc	%o2,	0x0C72,	%o1
	movpos	%xcc,	%g2,	%i4
	xnorcc	%i6,	0x0DEB,	%o4
	edge32n	%l0,	%l6,	%o6
	sethi	0x071C,	%o3
	edge16ln	%i2,	%g6,	%g5
	lduh	[%l7 + 0x74],	%l1
	fcmpgt16	%f26,	%f12,	%g7
	fmovda	%icc,	%f2,	%f26
	addcc	%l4,	0x09C2,	%o0
	srlx	%g4,	%g3,	%l2
	siam	0x5
	subccc	%l5,	0x1EED,	%i1
	movvs	%icc,	%i7,	%o5
	movcc	%xcc,	%i0,	%i5
	srlx	%i3,	0x1A,	%g1
	subccc	%l3,	0x1A64,	%o7
	addccc	%o2,	%g2,	%o1
	xor	%i4,	%o4,	%l0
	umul	%i6,	%l6,	%o3
	subccc	%o6,	%i2,	%g5
	fandnot1s	%f21,	%f29,	%f7
	edge16n	%g6,	%l1,	%g7
	ldd	[%l7 + 0x08],	%f26
	movleu	%xcc,	%l4,	%g4
	movleu	%xcc,	%o0,	%g3
	fxor	%f10,	%f28,	%f4
	fmovsle	%xcc,	%f5,	%f15
	orn	%l5,	0x15EB,	%i1
	edge32n	%l2,	%o5,	%i7
	or	%i0,	%i5,	%g1
	ldub	[%l7 + 0x35],	%i3
	fmul8x16al	%f18,	%f26,	%f28
	stw	%o7,	[%l7 + 0x78]
	fmovrdgz	%o2,	%f30,	%f12
	edge16n	%g2,	%l3,	%i4
	fmovsn	%xcc,	%f15,	%f14
	ldd	[%l7 + 0x70],	%o4
	andncc	%o1,	%l0,	%i6
	array32	%l6,	%o6,	%o3
	fpackfix	%f12,	%f4
	fcmpd	%fcc2,	%f18,	%f22
	sra	%g5,	%g6,	%i2
	sth	%l1,	[%l7 + 0x3A]
	ldd	[%l7 + 0x20],	%f18
	ldd	[%l7 + 0x48],	%g6
	move	%xcc,	%g4,	%l4
	xorcc	%g3,	0x0D14,	%l5
	movgu	%xcc,	%o0,	%l2
	fpadd32	%f26,	%f26,	%f0
	fmovrsgz	%o5,	%f10,	%f10
	sll	%i7,	%i1,	%i5
	pdist	%f2,	%f20,	%f10
	fsrc2s	%f17,	%f30
	sub	%g1,	%i0,	%i3
	smulcc	%o2,	%o7,	%l3
	edge16n	%g2,	%o4,	%i4
	movre	%l0,	%o1,	%i6
	fmovdle	%icc,	%f25,	%f31
	edge32ln	%o6,	%o3,	%l6
	fmovspos	%xcc,	%f22,	%f7
	fornot1s	%f23,	%f21,	%f6
	addccc	%g6,	%i2,	%l1
	fmovsvc	%xcc,	%f9,	%f30
	ldd	[%l7 + 0x48],	%f24
	ldd	[%l7 + 0x28],	%f20
	orn	%g5,	0x1208,	%g4
	fexpand	%f11,	%f8
	ldsh	[%l7 + 0x22],	%g7
	fornot1s	%f4,	%f9,	%f23
	movgu	%icc,	%g3,	%l5
	fpsub32s	%f18,	%f10,	%f11
	fnot2	%f4,	%f4
	fmovdne	%xcc,	%f2,	%f28
	nop
	set	0x20, %o6
	sth	%l4,	[%l7 + %o6]
	movne	%icc,	%o0,	%l2
	sllx	%o5,	0x18,	%i1
	orncc	%i5,	%g1,	%i0
	sdivx	%i3,	0x13ED,	%i7
	xnorcc	%o7,	%o2,	%g2
	smul	%l3,	0x128A,	%i4
	xor	%l0,	%o1,	%i6
	fmovdne	%icc,	%f20,	%f10
	add	%o6,	%o3,	%o4
	siam	0x6
	srl	%l6,	0x1B,	%i2
	and	%l1,	0x0BB0,	%g6
	andncc	%g4,	%g5,	%g7
	nop
	set	0x10, %i4
	std	%f4,	[%l7 + %i4]
	fexpand	%f0,	%f8
	sdiv	%g3,	0x0911,	%l4
	ldd	[%l7 + 0x38],	%f10
	fsrc1s	%f13,	%f22
	array8	%o0,	%l5,	%o5
	mulscc	%l2,	%i1,	%i5
	edge32ln	%g1,	%i3,	%i0
	movne	%icc,	%i7,	%o2
	mulscc	%g2,	0x1399,	%l3
	edge8ln	%i4,	%l0,	%o7
	sth	%i6,	[%l7 + 0x5E]
	mova	%xcc,	%o1,	%o6
	umulcc	%o3,	%l6,	%i2
	save %o4, 0x0B75, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g6,	0x1611,	%g5
	edge32n	%g7,	%g3,	%g4
	movge	%xcc,	%o0,	%l4
	fmovsgu	%icc,	%f12,	%f3
	mulscc	%o5,	%l5,	%l2
	fcmped	%fcc3,	%f20,	%f10
	ldub	[%l7 + 0x09],	%i1
	fmovdcc	%xcc,	%f14,	%f8
	sra	%g1,	0x1D,	%i3
	alignaddr	%i5,	%i0,	%o2
	sir	0x12C2
	movge	%icc,	%g2,	%l3
	fcmple32	%f18,	%f10,	%i4
	stw	%l0,	[%l7 + 0x20]
	edge16ln	%i7,	%i6,	%o1
	srl	%o7,	0x16,	%o6
	popc	0x04C7,	%l6
	ldx	[%l7 + 0x08],	%i2
	fmovdcc	%xcc,	%f26,	%f27
	sllx	%o3,	0x1F,	%l1
	movrgez	%o4,	0x21E,	%g6
	fands	%f6,	%f23,	%f25
	movrne	%g7,	0x117,	%g5
	sub	%g4,	%g3,	%l4
	smulcc	%o5,	%o0,	%l2
	movle	%xcc,	%l5,	%i1
	sllx	%g1,	%i3,	%i0
	mova	%xcc,	%i5,	%g2
	fcmpeq32	%f10,	%f4,	%o2
	sll	%l3,	%i4,	%l0
	fmovrde	%i7,	%f18,	%f12
	addccc	%o1,	%i6,	%o6
	subc	%o7,	0x1843,	%l6
	stw	%o3,	[%l7 + 0x2C]
	fmovdg	%xcc,	%f16,	%f9
	save %l1, 0x0DD8, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i2,	0x1847,	%g7
	std	%f22,	[%l7 + 0x48]
	fpadd16s	%f20,	%f27,	%f21
	fmovdneg	%icc,	%f31,	%f27
	umul	%g5,	0x1E71,	%g6
	edge16n	%g3,	%g4,	%o5
	movleu	%xcc,	%l4,	%l2
	ldd	[%l7 + 0x48],	%f24
	orncc	%o0,	%l5,	%i1
	movcs	%xcc,	%g1,	%i0
	smulcc	%i5,	%i3,	%o2
	orcc	%g2,	0x1C7D,	%l3
	fmovsneg	%icc,	%f16,	%f4
	sdivcc	%i4,	0x0321,	%l0
	movvc	%icc,	%i7,	%i6
	edge32	%o1,	%o7,	%o6
	sdivx	%o3,	0x090C,	%l6
	fpack32	%f0,	%f6,	%f18
	xor	%l1,	0x1803,	%o4
	fsrc2	%f6,	%f6
	edge32l	%g7,	%i2,	%g6
	movpos	%icc,	%g5,	%g3
	edge8ln	%g4,	%l4,	%o5
	movre	%l2,	%o0,	%i1
	fcmpd	%fcc2,	%f0,	%f16
	fnand	%f16,	%f2,	%f16
	add	%g1,	0x01D0,	%i0
	movge	%xcc,	%i5,	%l5
	edge32n	%o2,	%g2,	%l3
	subcc	%i4,	0x164D,	%i3
	movre	%l0,	%i6,	%i7
	fnegs	%f18,	%f16
	subcc	%o1,	%o6,	%o3
	movneg	%xcc,	%o7,	%l1
	srlx	%l6,	%g7,	%o4
	subcc	%i2,	%g5,	%g3
	array32	%g6,	%g4,	%l4
	movl	%xcc,	%l2,	%o0
	movvs	%icc,	%o5,	%g1
	fmovsge	%xcc,	%f17,	%f8
	udiv	%i1,	0x16C8,	%i5
	alignaddrl	%i0,	%o2,	%g2
	fpadd32	%f0,	%f2,	%f26
	sll	%l3,	0x13,	%i4
	udiv	%l5,	0x071B,	%i3
	movl	%xcc,	%l0,	%i6
	mulscc	%o1,	0x01BB,	%o6
	edge16	%i7,	%o7,	%l1
	fones	%f9
	edge32ln	%o3,	%l6,	%g7
	for	%f20,	%f6,	%f10
	orcc	%i2,	0x0042,	%o4
	orncc	%g5,	%g3,	%g6
	edge8	%l4,	%g4,	%l2
	subccc	%o5,	0x1438,	%o0
	save %i1, 0x0AE0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i0,	%g1,	%o2
	std	%f8,	[%l7 + 0x18]
	addccc	%l3,	0x1E80,	%g2
	umul	%l5,	0x15E7,	%i4
	andncc	%l0,	%i6,	%i3
	movleu	%xcc,	%o1,	%o6
	mulx	%o7,	0x00FD,	%l1
	stb	%i7,	[%l7 + 0x7D]
	fmovdvc	%icc,	%f9,	%f9
	udivcc	%o3,	0x0221,	%g7
	ldsw	[%l7 + 0x34],	%l6
	std	%f0,	[%l7 + 0x58]
	fmovsvs	%icc,	%f27,	%f28
	andcc	%o4,	0x1B82,	%g5
	ldub	[%l7 + 0x0A],	%i2
	ldd	[%l7 + 0x10],	%f8
	movvs	%icc,	%g6,	%g3
	movn	%icc,	%g4,	%l2
	srlx	%l4,	%o5,	%o0
	xnorcc	%i1,	%i5,	%i0
	sth	%g1,	[%l7 + 0x4A]
	fmuld8ulx16	%f5,	%f11,	%f0
	fmuld8sux16	%f18,	%f1,	%f22
	fornot2s	%f11,	%f25,	%f25
	fsrc1	%f16,	%f26
	movge	%icc,	%l3,	%o2
	addcc	%g2,	0x1F92,	%l5
	array32	%i4,	%l0,	%i3
	edge16l	%o1,	%o6,	%i6
	orncc	%l1,	0x0A51,	%i7
	umulcc	%o3,	%o7,	%g7
	fmul8x16al	%f20,	%f24,	%f20
	movcc	%icc,	%o4,	%l6
	fmovrdgz	%i2,	%f22,	%f6
	fmovsg	%icc,	%f4,	%f6
	std	%f28,	[%l7 + 0x58]
	edge32l	%g6,	%g3,	%g5
	movneg	%xcc,	%g4,	%l4
	array32	%o5,	%o0,	%l2
	for	%f12,	%f22,	%f16
	movleu	%xcc,	%i5,	%i1
	movrlz	%i0,	%g1,	%l3
	fmovrdgz	%g2,	%f18,	%f30
	andncc	%l5,	%o2,	%l0
	edge16ln	%i3,	%i4,	%o1
	nop
	set	0x11, %l2
	stb	%i6,	[%l7 + %l2]
	lduh	[%l7 + 0x62],	%l1
	and	%o6,	%o3,	%o7
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%g6
	movrne	%i7,	%l6,	%o4
	st	%f27,	[%l7 + 0x18]
	andncc	%i2,	%g3,	%g5
	sdivcc	%g6,	0x049F,	%g4
	addc	%l4,	0x19EF,	%o0
	lduh	[%l7 + 0x3A],	%l2
	movvs	%xcc,	%o5,	%i5
	std	%f20,	[%l7 + 0x30]
	array8	%i1,	%g1,	%l3
	movneg	%xcc,	%i0,	%l5
	movrgez	%o2,	0x1F3,	%l0
	orcc	%i3,	%i4,	%g2
	edge16l	%o1,	%l1,	%o6
	udiv	%i6,	0x190F,	%o3
	edge32l	%o7,	%g7,	%i7
	movl	%icc,	%l6,	%o4
	fnot1s	%f25,	%f12
	ldd	[%l7 + 0x48],	%f30
	fmovscs	%xcc,	%f25,	%f28
	sdivcc	%i2,	0x19CD,	%g5
	popc	0x1ED1,	%g6
	movrne	%g3,	%g4,	%l4
	movcs	%icc,	%o0,	%o5
	pdist	%f10,	%f28,	%f28
	or	%i5,	0x0DE1,	%i1
	movcs	%xcc,	%g1,	%l2
	st	%f0,	[%l7 + 0x24]
	srlx	%i0,	0x1B,	%l3
	fnot1s	%f15,	%f28
	sir	0x0386
	sra	%l5,	0x0F,	%l0
	movneg	%xcc,	%i3,	%i4
	lduh	[%l7 + 0x1E],	%o2
	andcc	%g2,	0x07CC,	%l1
	sra	%o1,	0x10,	%i6
	movpos	%xcc,	%o6,	%o7
	edge32l	%o3,	%g7,	%i7
	fexpand	%f24,	%f10
	fmovsvc	%icc,	%f15,	%f20
	srl	%o4,	%l6,	%i2
	sdivx	%g6,	0x0305,	%g5
	ldsw	[%l7 + 0x74],	%g3
	addc	%l4,	%g4,	%o5
	nop
	set	0x20, %l0
	ldsh	[%l7 + %l0],	%o0
	srlx	%i5,	0x12,	%i1
	fnor	%f8,	%f16,	%f12
	edge32l	%l2,	%g1,	%i0
	edge16	%l5,	%l3,	%l0
	fornot2	%f24,	%f22,	%f30
	ldx	[%l7 + 0x70],	%i4
	std	%f14,	[%l7 + 0x78]
	stx	%i3,	[%l7 + 0x68]
	fmovdge	%xcc,	%f13,	%f25
	edge32	%g2,	%o2,	%l1
	ld	[%l7 + 0x60],	%f23
	sra	%i6,	0x12,	%o1
	add	%o6,	0x149A,	%o7
	movrlez	%o3,	0x372,	%i7
	movrlz	%g7,	0x04A,	%l6
	fone	%f0
	fand	%f0,	%f18,	%f12
	or	%o4,	%g6,	%i2
	sll	%g5,	%l4,	%g3
	mulx	%g4,	%o0,	%i5
	sdivx	%o5,	0x14E8,	%l2
	movn	%icc,	%i1,	%g1
	fmovsne	%icc,	%f17,	%f17
	ldsw	[%l7 + 0x20],	%l5
	edge8	%i0,	%l3,	%l0
	edge16	%i4,	%i3,	%g2
	edge32n	%o2,	%l1,	%o1
	fzeros	%f12
	fmovdvs	%icc,	%f10,	%f25
	fpack32	%f16,	%f2,	%f18
	edge32n	%o6,	%i6,	%o7
	sir	0x15F4
	fmovse	%xcc,	%f20,	%f9
	subccc	%o3,	0x1238,	%g7
	udivcc	%l6,	0x0C2F,	%i7
	umulcc	%o4,	%g6,	%i2
	and	%l4,	%g5,	%g3
	sethi	0x0362,	%o0
	fmovdle	%icc,	%f29,	%f9
	fmovrslz	%g4,	%f27,	%f6
	st	%f23,	[%l7 + 0x30]
	array32	%o5,	%i5,	%l2
	movre	%i1,	%l5,	%g1
	edge32l	%i0,	%l3,	%l0
	udiv	%i4,	0x1892,	%g2
	movrlz	%o2,	0x0B4,	%l1
	stw	%o1,	[%l7 + 0x48]
	movrne	%i3,	0x2AE,	%i6
	orcc	%o7,	0x1BAA,	%o3
	andncc	%g7,	%l6,	%o6
	sth	%i7,	[%l7 + 0x46]
	fnot2s	%f30,	%f4
	lduw	[%l7 + 0x1C],	%o4
	srax	%i2,	%g6,	%l4
	ldsb	[%l7 + 0x0C],	%g3
	xnorcc	%g5,	0x0846,	%o0
	subcc	%g4,	0x1712,	%i5
	sir	0x147D
	movpos	%xcc,	%l2,	%o5
	subcc	%l5,	%i1,	%i0
	edge16n	%g1,	%l0,	%l3
	popc	%i4,	%o2
	movge	%icc,	%l1,	%g2
	edge16n	%i3,	%i6,	%o7
	mova	%icc,	%o1,	%o3
	add	%l6,	%o6,	%g7
	fmovdgu	%icc,	%f20,	%f4
	mova	%icc,	%i7,	%i2
	add	%g6,	%o4,	%l4
	andn	%g3,	%o0,	%g4
	movn	%icc,	%g5,	%i5
	fmuld8sux16	%f29,	%f8,	%f2
	movne	%xcc,	%o5,	%l2
	edge32ln	%l5,	%i1,	%i0
	fors	%f4,	%f29,	%f12
	movrne	%l0,	%l3,	%i4
	ldsh	[%l7 + 0x10],	%o2
	nop
	set	0x7F, %i1
	ldub	[%l7 + %i1],	%l1
	edge8n	%g2,	%g1,	%i6
	subc	%i3,	%o1,	%o7
	movleu	%icc,	%o3,	%l6
	subcc	%o6,	0x0004,	%g7
	andn	%i2,	0x0AC9,	%i7
	movn	%icc,	%g6,	%o4
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	fpadd32	%f18,	%f14,	%f2
	addcc	%g4,	%i5,	%o5
	movrne	%g5,	%l5,	%i1
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%l2
	edge16ln	%i0,	%l3,	%i4
	xorcc	%l0,	%o2,	%l1
	ldsb	[%l7 + 0x15],	%g1
	addcc	%g2,	%i6,	%o1
	st	%f17,	[%l7 + 0x18]
	ldd	[%l7 + 0x10],	%i2
	sth	%o7,	[%l7 + 0x3A]
	fnand	%f16,	%f18,	%f20
	edge16n	%o3,	%l6,	%g7
	fcmpd	%fcc2,	%f20,	%f22
	movl	%icc,	%o6,	%i7
	array8	%i2,	%o4,	%g6
	fmovdvs	%icc,	%f26,	%f27
	umul	%l4,	0x0EE2,	%g3
	srlx	%g4,	%i5,	%o0
	xnorcc	%g5,	%o5,	%i1
	lduw	[%l7 + 0x60],	%l2
	sir	0x0524
	udivcc	%i0,	0x1362,	%l5
	fpmerge	%f7,	%f18,	%f14
	array16	%i4,	%l3,	%l0
	edge32l	%l1,	%o2,	%g1
	sir	0x17AC
	fmovdcc	%icc,	%f8,	%f6
	edge8l	%g2,	%o1,	%i6
	movrgz	%o7,	%i3,	%o3
	alignaddr	%g7,	%l6,	%i7
	subc	%o6,	0x171E,	%i2
	umul	%g6,	%l4,	%g3
	fmovda	%icc,	%f16,	%f9
	movcs	%xcc,	%g4,	%o4
	udivx	%o0,	0x0DF9,	%g5
	mulscc	%o5,	0x1C83,	%i5
	fmovspos	%icc,	%f21,	%f31
	edge8	%l2,	%i1,	%l5
	save %i4, 0x04A5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i0,	%l0,	%o2
	ldub	[%l7 + 0x35],	%l1
	edge32	%g2,	%o1,	%i6
	fnot2	%f22,	%f8
	lduh	[%l7 + 0x2A],	%o7
	xorcc	%g1,	0x077E,	%i3
	sll	%o3,	%l6,	%g7
	xorcc	%i7,	0x0CA2,	%i2
	smulcc	%g6,	0x1483,	%l4
	edge8	%o6,	%g4,	%g3
	addccc	%o4,	0x0098,	%o0
	fmovdle	%xcc,	%f13,	%f6
	or	%o5,	%i5,	%l2
	movle	%icc,	%i1,	%l5
	udivcc	%i4,	0x0B20,	%l3
	movrne	%g5,	0x3C7,	%i0
	srlx	%o2,	0x05,	%l1
	fcmps	%fcc1,	%f9,	%f11
	ldub	[%l7 + 0x14],	%g2
	and	%l0,	%o1,	%i6
	edge8l	%o7,	%i3,	%o3
	edge16	%g1,	%g7,	%l6
	movleu	%icc,	%i2,	%g6
	fmovrslez	%l4,	%f3,	%f2
	edge16l	%o6,	%i7,	%g4
	edge16ln	%o4,	%g3,	%o5
	mova	%icc,	%o0,	%i5
	popc	0x1193,	%l2
	sdivx	%i1,	0x196F,	%i4
	udiv	%l3,	0x091B,	%l5
	faligndata	%f16,	%f12,	%f6
	addc	%i0,	0x12E6,	%g5
	movl	%xcc,	%l1,	%g2
	ldsw	[%l7 + 0x30],	%o2
	subcc	%l0,	0x07BC,	%i6
	mova	%icc,	%o1,	%o7
	fmovdgu	%xcc,	%f12,	%f2
	st	%f30,	[%l7 + 0x18]
	fnot2	%f10,	%f26
	umulcc	%o3,	%g1,	%i3
	movrlez	%g7,	%l6,	%i2
	andn	%g6,	%o6,	%i7
	ld	[%l7 + 0x7C],	%f19
	srl	%g4,	%o4,	%g3
	and	%l4,	%o5,	%o0
	addccc	%i5,	%i1,	%i4
	srlx	%l3,	%l2,	%l5
	alignaddrl	%i0,	%g5,	%l1
	ldd	[%l7 + 0x60],	%o2
	sub	%l0,	0x02BD,	%g2
	movneg	%icc,	%i6,	%o1
	subcc	%o3,	%g1,	%o7
	ldx	[%l7 + 0x70],	%g7
	ldsw	[%l7 + 0x3C],	%i3
	movl	%icc,	%i2,	%l6
	movre	%g6,	0x0D2,	%i7
	array8	%g4,	%o6,	%o4
	for	%f18,	%f30,	%f8
	fandnot2	%f30,	%f18,	%f4
	fmovdcc	%xcc,	%f31,	%f18
	save %l4, %g3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o0,	0x0B80,	%i5
	fmovsne	%icc,	%f27,	%f29
	sth	%i4,	[%l7 + 0x4E]
	movg	%xcc,	%l3,	%l2
	subc	%i1,	0x14F1,	%i0
	edge8ln	%l5,	%l1,	%g5
	movcs	%icc,	%l0,	%g2
	fpsub32	%f16,	%f30,	%f4
	sra	%o2,	0x1D,	%o1
	andncc	%o3,	%i6,	%o7
	sub	%g7,	%i3,	%i2
	add	%g1,	0x0322,	%l6
	srl	%i7,	0x13,	%g6
	ldsh	[%l7 + 0x18],	%o6
	restore %g4, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x4D],	%l4
	addcc	%o0,	%o5,	%i4
	edge16	%l3,	%i5,	%i1
	andcc	%i0,	%l2,	%l5
	fandnot1	%f20,	%f20,	%f24
	fones	%f2
	xnorcc	%l1,	0x0C71,	%l0
	movge	%icc,	%g5,	%g2
	fmovda	%icc,	%f11,	%f10
	ldd	[%l7 + 0x68],	%o0
	xorcc	%o2,	0x1834,	%i6
	array32	%o7,	%g7,	%i3
	mulscc	%i2,	%o3,	%l6
	xor	%g1,	%i7,	%o6
	movrgez	%g6,	%g4,	%o4
	ldd	[%l7 + 0x08],	%f24
	lduw	[%l7 + 0x34],	%g3
	movvc	%xcc,	%o0,	%o5
	addcc	%l4,	%l3,	%i5
	srlx	%i1,	0x0C,	%i4
	sth	%l2,	[%l7 + 0x1C]
	movge	%icc,	%i0,	%l1
	fmovsg	%icc,	%f30,	%f13
	sethi	0x1FF8,	%l5
	fnot1	%f26,	%f30
	xorcc	%l0,	0x073C,	%g5
	sdivcc	%g2,	0x1174,	%o1
	fmovdgu	%icc,	%f16,	%f3
	ldub	[%l7 + 0x4E],	%o2
	fmovsg	%icc,	%f15,	%f9
	st	%f25,	[%l7 + 0x70]
	alignaddr	%o7,	%i6,	%i3
	stx	%g7,	[%l7 + 0x68]
	srl	%i2,	0x16,	%l6
	movrne	%o3,	%g1,	%o6
	movre	%i7,	0x2B0,	%g6
	sdivcc	%o4,	0x16BC,	%g3
	stx	%o0,	[%l7 + 0x70]
	movl	%xcc,	%o5,	%l4
	or	%l3,	%g4,	%i1
	move	%icc,	%i4,	%i5
	subc	%i0,	0x1804,	%l1
	sdivcc	%l5,	0x0269,	%l2
	fmovsge	%xcc,	%f26,	%f16
	movgu	%xcc,	%g5,	%l0
	movle	%xcc,	%o1,	%g2
	subccc	%o7,	0x0A22,	%i6
	movre	%o2,	%g7,	%i2
	mulscc	%l6,	%o3,	%i3
	ld	[%l7 + 0x0C],	%f3
	fnot1	%f30,	%f14
	fand	%f8,	%f18,	%f8
	andcc	%o6,	0x1DE9,	%i7
	fmovspos	%icc,	%f22,	%f13
	edge32n	%g1,	%o4,	%g6
	andncc	%o0,	%o5,	%l4
	ldd	[%l7 + 0x48],	%l2
	fnor	%f8,	%f0,	%f30
	fmuld8ulx16	%f31,	%f13,	%f4
	std	%f12,	[%l7 + 0x18]
	movcc	%xcc,	%g4,	%i1
	edge16	%g3,	%i5,	%i0
	sir	0x05D1
	sll	%l1,	%i4,	%l2
	sllx	%l5,	0x16,	%l0
	fpadd16s	%f8,	%f27,	%f12
	sethi	0x0A9C,	%o1
	fcmple16	%f30,	%f28,	%g5
	stb	%o7,	[%l7 + 0x2A]
	fxor	%f2,	%f12,	%f16
	mulx	%i6,	0x1919,	%o2
	subcc	%g7,	0x0062,	%g2
	srl	%i2,	0x1E,	%o3
	edge32ln	%l6,	%i3,	%o6
	movg	%xcc,	%i7,	%g1
	edge16l	%o4,	%o0,	%o5
	movcs	%icc,	%l4,	%l3
	movneg	%xcc,	%g4,	%g6
	fmovsvs	%xcc,	%f5,	%f27
	movvc	%xcc,	%i1,	%g3
	sir	0x04AB
	save %i5, 0x0122, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l1,	%i4
	xorcc	%l5,	%l0,	%o1
	fpsub32s	%f14,	%f31,	%f19
	umul	%l2,	0x1D3F,	%o7
	ldub	[%l7 + 0x4C],	%g5
	addccc	%o2,	%g7,	%i6
	array16	%i2,	%g2,	%l6
	movpos	%icc,	%o3,	%i3
	sra	%o6,	0x03,	%i7
	sub	%g1,	%o4,	%o0
	udivx	%l4,	0x0CEB,	%o5
	movn	%xcc,	%l3,	%g4
	subc	%g6,	%i1,	%i5
	ldsw	[%l7 + 0x54],	%g3
	srl	%i0,	%i4,	%l1
	movleu	%xcc,	%l5,	%o1
	sdiv	%l0,	0x1CA7,	%o7
	ld	[%l7 + 0x4C],	%f24
	move	%xcc,	%l2,	%g5
	sll	%o2,	0x1C,	%i6
	sdivcc	%i2,	0x1545,	%g2
	addcc	%l6,	%o3,	%i3
	movle	%icc,	%g7,	%o6
	movg	%icc,	%i7,	%o4
	smul	%g1,	0x1C26,	%o0
	sll	%o5,	0x10,	%l4
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	movrne	%i1,	0x186,	%l3
	sdiv	%i5,	0x0725,	%i0
	movrlz	%i4,	%g3,	%l5
	movl	%icc,	%o1,	%l0
	movg	%xcc,	%o7,	%l2
	or	%g5,	%o2,	%i6
	srlx	%l1,	0x0B,	%i2
	fabsd	%f28,	%f18
	fmul8sux16	%f28,	%f20,	%f6
	movcs	%icc,	%g2,	%o3
	add	%i3,	0x13F4,	%g7
	fmovrslez	%l6,	%f24,	%f12
	edge16	%i7,	%o6,	%g1
	array32	%o4,	%o0,	%o5
	fmovrsgz	%g4,	%f28,	%f7
	lduh	[%l7 + 0x76],	%g6
	andcc	%i1,	%l4,	%i5
	lduw	[%l7 + 0x0C],	%l3
	sdiv	%i4,	0x0C8F,	%g3
	movcc	%xcc,	%l5,	%o1
	movvs	%xcc,	%l0,	%o7
	xor	%i0,	0x14FC,	%l2
	fmovda	%xcc,	%f1,	%f24
	fmovspos	%icc,	%f3,	%f23
	ldsh	[%l7 + 0x34],	%g5
	fpsub32s	%f8,	%f5,	%f7
	movn	%xcc,	%o2,	%l1
	subccc	%i2,	%g2,	%i6
	fmovsne	%xcc,	%f24,	%f4
	fcmpgt16	%f2,	%f16,	%i3
	orn	%o3,	0x135B,	%l6
	fornot2	%f12,	%f14,	%f22
	orcc	%g7,	%o6,	%i7
	movl	%icc,	%g1,	%o0
	fmuld8sux16	%f18,	%f0,	%f6
	ldsb	[%l7 + 0x11],	%o4
	fors	%f27,	%f21,	%f10
	movrgez	%g4,	%g6,	%i1
	fornot2s	%f5,	%f7,	%f4
	orncc	%l4,	%o5,	%i5
	movre	%l3,	%i4,	%l5
	sdivx	%g3,	0x18A4,	%o1
	movneg	%xcc,	%o7,	%i0
	and	%l2,	%g5,	%l0
	fnegd	%f28,	%f2
	ldsw	[%l7 + 0x68],	%o2
	edge16l	%i2,	%l1,	%i6
	ldsb	[%l7 + 0x7F],	%i3
	sdivcc	%o3,	0x03B3,	%l6
	umul	%g2,	0x0CBB,	%o6
	fmovrse	%g7,	%f23,	%f12
	array32	%i7,	%g1,	%o0
	mulx	%g4,	%o4,	%i1
	movneg	%xcc,	%l4,	%g6
	xorcc	%i5,	0x0FC8,	%l3
	sdiv	%i4,	0x18ED,	%o5
	andcc	%g3,	0x0ED5,	%o1
	movne	%xcc,	%o7,	%l5
	xorcc	%i0,	%g5,	%l2
	fmovscc	%icc,	%f12,	%f30
	sdivcc	%o2,	0x02BA,	%i2
	sdivcc	%l0,	0x09AC,	%l1
	movrgz	%i3,	%o3,	%l6
	movpos	%icc,	%g2,	%o6
	movre	%g7,	0x11D,	%i7
	popc	0x120B,	%g1
	movrlez	%o0,	%i6,	%g4
	array16	%i1,	%o4,	%l4
	lduh	[%l7 + 0x48],	%g6
	or	%l3,	0x0652,	%i4
	sub	%o5,	0x1AC7,	%i5
	srl	%o1,	0x0F,	%o7
	stw	%g3,	[%l7 + 0x68]
	fornot1s	%f26,	%f31,	%f7
	ldd	[%l7 + 0x20],	%f28
	sll	%i0,	0x10,	%l5
	fnot2	%f12,	%f2
	edge8ln	%g5,	%l2,	%o2
	or	%i2,	%l1,	%l0
	fmovdne	%xcc,	%f19,	%f15
	stb	%i3,	[%l7 + 0x64]
	sub	%l6,	%o3,	%g2
	umulcc	%o6,	%g7,	%g1
	addccc	%o0,	%i7,	%i6
	subcc	%i1,	%g4,	%l4
	sub	%o4,	0x155A,	%g6
	sdiv	%l3,	0x1D6C,	%i4
	sdiv	%i5,	0x016C,	%o1
	movle	%xcc,	%o5,	%o7
	movcs	%icc,	%i0,	%l5
	fpackfix	%f12,	%f1
	and	%g5,	%l2,	%o2
	srlx	%g3,	%i2,	%l0
	ldsw	[%l7 + 0x0C],	%i3
	fnors	%f5,	%f19,	%f3
	sllx	%l1,	0x1C,	%o3
	mova	%xcc,	%g2,	%l6
	popc	0x0D3E,	%o6
	sdiv	%g1,	0x18DD,	%g7
	sub	%i7,	0x0C36,	%o0
	array16	%i1,	%i6,	%g4
	addcc	%o4,	0x05F4,	%l4
	movvc	%xcc,	%l3,	%i4
	fpsub16	%f12,	%f6,	%f4
	stx	%i5,	[%l7 + 0x20]
	array16	%g6,	%o1,	%o5
	sth	%i0,	[%l7 + 0x4E]
	movrgz	%o7,	%l5,	%l2
	umul	%g5,	%o2,	%g3
	and	%i2,	%i3,	%l0
	andcc	%l1,	0x1BA1,	%g2
	edge16	%l6,	%o6,	%g1
	subc	%o3,	%g7,	%i7
	sethi	0x092D,	%i1
	edge16ln	%o0,	%g4,	%i6
	umulcc	%l4,	%l3,	%o4
	xorcc	%i4,	%i5,	%o1
	fmovrdgez	%g6,	%f22,	%f26
	movneg	%xcc,	%o5,	%i0
	sir	0x108A
	movneg	%icc,	%o7,	%l2
	orn	%g5,	0x059E,	%o2
	fmovdvs	%icc,	%f0,	%f30
	movcs	%icc,	%l5,	%g3
	fcmpes	%fcc1,	%f31,	%f4
	ldd	[%l7 + 0x48],	%i2
	xnorcc	%l0,	%i3,	%l1
	fxors	%f21,	%f17,	%f29
	movn	%icc,	%l6,	%o6
	edge16	%g2,	%g1,	%o3
	and	%i7,	%g7,	%i1
	fmuld8sux16	%f14,	%f14,	%f26
	array8	%g4,	%o0,	%i6
	and	%l3,	%l4,	%o4
	edge16	%i4,	%o1,	%g6
	movn	%xcc,	%i5,	%o5
	fpack16	%f14,	%f15
	sra	%o7,	%i0,	%g5
	ldx	[%l7 + 0x18],	%o2
	movrgz	%l2,	%g3,	%l5
	stb	%l0,	[%l7 + 0x2C]
	fmovscs	%xcc,	%f18,	%f12
	smul	%i2,	0x134D,	%i3
	lduw	[%l7 + 0x18],	%l1
	movcs	%xcc,	%o6,	%l6
	srax	%g1,	0x0A,	%o3
	array8	%i7,	%g2,	%g7
	fnot2s	%f16,	%f21
	smulcc	%i1,	%o0,	%i6
	fcmpne16	%f24,	%f28,	%g4
	movl	%xcc,	%l3,	%l4
	array32	%i4,	%o4,	%o1
	pdist	%f18,	%f26,	%f8
	orcc	%i5,	0x17E3,	%g6
	orn	%o7,	%i0,	%o5
	sra	%g5,	0x08,	%l2
	xorcc	%o2,	%l5,	%l0
	ldsw	[%l7 + 0x18],	%i2
	fnot2	%f26,	%f14
	movg	%xcc,	%g3,	%l1
	srlx	%i3,	0x1C,	%l6
	edge16ln	%o6,	%o3,	%i7
	array16	%g1,	%g7,	%g2
	stb	%i1,	[%l7 + 0x7C]
	fandnot1	%f26,	%f16,	%f26
	sllx	%o0,	0x0B,	%g4
	sllx	%i6,	%l3,	%i4
	edge16ln	%l4,	%o1,	%i5
	array32	%g6,	%o7,	%o4
	fones	%f25
	array32	%i0,	%g5,	%l2
	or	%o5,	%o2,	%l0
	edge16n	%i2,	%g3,	%l5
	udivcc	%l1,	0x1F56,	%i3
	smul	%o6,	0x0A23,	%o3
	udiv	%i7,	0x03A7,	%g1
	subc	%l6,	0x0EF7,	%g7
	fcmpne32	%f18,	%f28,	%i1
	add	%g2,	%g4,	%o0
	edge32ln	%l3,	%i4,	%i6
	fmovrdgz	%l4,	%f6,	%f2
	fmovdvs	%icc,	%f19,	%f24
	edge8l	%o1,	%g6,	%o7
	alignaddr	%i5,	%o4,	%i0
	restore %l2, %o5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g5,	0x1E6D,	%i2
	sdiv	%g3,	0x00C8,	%l0
	ld	[%l7 + 0x50],	%f9
	movpos	%icc,	%l1,	%l5
	fmovdvs	%xcc,	%f31,	%f23
	movrlez	%i3,	%o6,	%i7
	edge16	%o3,	%l6,	%g7
	stb	%g1,	[%l7 + 0x1E]
	pdist	%f22,	%f26,	%f26
	save %i1, 0x0B77, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g4,	%l3,	%o0
	sir	0x00B4
	movrlez	%i4,	%l4,	%i6
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	ldsh	[%l7 + 0x08],	%i5
	edge16n	%o4,	%i0,	%l2
	fmovdvs	%icc,	%f13,	%f8
	sdivcc	%o2,	0x0B7F,	%g5
	ldsb	[%l7 + 0x09],	%o5
	movrne	%g3,	0x185,	%i2
	movgu	%xcc,	%l0,	%l5
	stb	%l1,	[%l7 + 0x54]
	edge32	%o6,	%i3,	%o3
	andncc	%i7,	%l6,	%g7
	movge	%xcc,	%i1,	%g1
	movcs	%icc,	%g4,	%l3
	orcc	%g2,	%o0,	%l4
	mova	%xcc,	%i4,	%i6
	sub	%g6,	0x1AEB,	%o1
	array16	%i5,	%o4,	%o7
	orn	%l2,	0x0867,	%o2
	edge16	%i0,	%o5,	%g3
	fcmpeq32	%f16,	%f26,	%g5
	ldx	[%l7 + 0x60],	%l0
	edge8ln	%l5,	%i2,	%o6
	fcmpeq32	%f6,	%f20,	%i3
	fors	%f8,	%f28,	%f18
	fmovsg	%icc,	%f26,	%f9
	xorcc	%l1,	0x0818,	%o3
	ldsh	[%l7 + 0x58],	%i7
	movn	%xcc,	%g7,	%l6
	fmul8sux16	%f2,	%f10,	%f4
	movrne	%i1,	0x24A,	%g1
	sir	0x0C7B
	mulx	%l3,	%g4,	%g2
	movpos	%xcc,	%l4,	%o0
	fnegs	%f23,	%f9
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%i4
	fxnors	%f4,	%f26,	%f2
	sub	%i6,	0x14F4,	%o1
	movrgz	%g6,	%o4,	%o7
	movcc	%xcc,	%i5,	%o2
	smul	%i0,	%o5,	%l2
	nop
	set	0x56, %g4
	lduh	[%l7 + %g4],	%g3
	udivcc	%l0,	0x1DE3,	%g5
	edge16l	%l5,	%i2,	%o6
	sub	%l1,	0x04E5,	%o3
	movrgz	%i7,	0x3F0,	%i3
	andn	%g7,	%i1,	%l6
	nop
	set	0x7C, %o0
	lduh	[%l7 + %o0],	%l3
	edge32	%g4,	%g2,	%l4
	sth	%o0,	[%l7 + 0x18]
	stx	%i4,	[%l7 + 0x40]
	movrgz	%g1,	0x25C,	%i6
	sir	0x1A22
	edge16l	%o1,	%g6,	%o7
	or	%o4,	%i5,	%o2
	fpack16	%f14,	%f4
	movge	%icc,	%i0,	%o5
	xnorcc	%l2,	%g3,	%g5
	movne	%icc,	%l5,	%i2
	smul	%l0,	%o6,	%o3
	popc	%l1,	%i3
	sll	%i7,	%g7,	%l6
	subcc	%l3,	%i1,	%g2
	popc	%g4,	%o0
	udivcc	%l4,	0x1EC2,	%i4
	movle	%icc,	%i6,	%g1
	ldd	[%l7 + 0x78],	%o0
	movg	%xcc,	%o7,	%g6
	fmovsneg	%xcc,	%f20,	%f26
	fcmpne16	%f20,	%f10,	%o4
	addcc	%o2,	%i5,	%i0
	umul	%l2,	%o5,	%g3
	siam	0x1
	xorcc	%l5,	%g5,	%l0
	movleu	%icc,	%i2,	%o6
	fsrc1	%f2,	%f20
	movl	%icc,	%l1,	%i3
	or	%o3,	%g7,	%l6
	xor	%l3,	0x0370,	%i1
	addccc	%g2,	%g4,	%i7
	sir	0x0D40
	movcc	%icc,	%o0,	%l4
	ldx	[%l7 + 0x70],	%i6
	fmovdle	%icc,	%f9,	%f11
	subc	%i4,	%g1,	%o1
	edge32l	%o7,	%o4,	%o2
	sdivcc	%i5,	0x0A22,	%g6
	array16	%l2,	%o5,	%i0
	mova	%xcc,	%l5,	%g3
	srl	%g5,	%l0,	%i2
	movl	%xcc,	%l1,	%i3
	movgu	%xcc,	%o3,	%o6
	fpack16	%f24,	%f4
	xor	%g7,	%l3,	%l6
	movgu	%xcc,	%i1,	%g4
	movrlez	%i7,	0x0F4,	%o0
	fors	%f2,	%f22,	%f21
	subc	%g2,	0x0B24,	%l4
	movg	%icc,	%i4,	%g1
	fmovd	%f4,	%f30
	fpsub16s	%f14,	%f31,	%f22
	edge32	%o1,	%o7,	%i6
	lduh	[%l7 + 0x4C],	%o4
	st	%f25,	[%l7 + 0x70]
	fpsub32	%f8,	%f12,	%f22
	andn	%o2,	0x1271,	%g6
	fcmpeq32	%f24,	%f16,	%i5
	udivx	%l2,	0x0D3E,	%i0
	mova	%icc,	%l5,	%o5
	orncc	%g5,	0x0D4F,	%l0
	addc	%i2,	0x1749,	%l1
	movpos	%xcc,	%i3,	%o3
	subccc	%o6,	0x1257,	%g3
	edge32ln	%l3,	%l6,	%g7
	ldsw	[%l7 + 0x6C],	%g4
	fmovrde	%i1,	%f30,	%f26
	fmovrsne	%i7,	%f10,	%f26
	nop
	set	0x38, %l4
	std	%f6,	[%l7 + %l4]
	subcc	%g2,	%o0,	%i4
	fnot2	%f2,	%f18
	array8	%l4,	%g1,	%o7
	or	%o1,	%o4,	%i6
	mulx	%g6,	0x1A03,	%i5
	fmovsvs	%xcc,	%f21,	%f24
	fcmpeq32	%f20,	%f10,	%o2
	fmovdcs	%icc,	%f8,	%f13
	sllx	%i0,	0x07,	%l5
	edge16l	%l2,	%o5,	%l0
	mova	%xcc,	%g5,	%i2
	ldsh	[%l7 + 0x4C],	%l1
	ldsb	[%l7 + 0x4C],	%o3
	stx	%o6,	[%l7 + 0x58]
	fpsub16	%f30,	%f2,	%f6
	xor	%i3,	%l3,	%g3
	fpackfix	%f20,	%f23
	edge8ln	%g7,	%l6,	%g4
	ldsh	[%l7 + 0x60],	%i1
	fcmple16	%f14,	%f6,	%i7
	sllx	%o0,	%g2,	%l4
	addc	%i4,	%g1,	%o7
	movgu	%icc,	%o1,	%o4
	movn	%icc,	%i6,	%g6
	fmovdpos	%icc,	%f6,	%f14
	fmovs	%f31,	%f0
	move	%icc,	%i5,	%i0
	orcc	%l5,	0x18C4,	%o2
	alignaddr	%l2,	%o5,	%l0
	movrgez	%g5,	0x0FA,	%l1
	edge8n	%o3,	%i2,	%i3
	srax	%l3,	%o6,	%g3
	movpos	%icc,	%l6,	%g7
	sdivcc	%g4,	0x08B6,	%i1
	sdivx	%o0,	0x1C4A,	%i7
	fmovdgu	%xcc,	%f22,	%f27
	edge32	%l4,	%g2,	%g1
	fabss	%f15,	%f15
	movrlz	%i4,	0x1A3,	%o7
	array16	%o4,	%i6,	%g6
	movneg	%xcc,	%o1,	%i0
	edge16ln	%i5,	%l5,	%l2
	nop
	set	0x68, %g3
	lduw	[%l7 + %g3],	%o2
	sethi	0x03CC,	%o5
	popc	0x17D2,	%l0
	edge16	%l1,	%o3,	%i2
	ldd	[%l7 + 0x40],	%f2
	fpadd16	%f8,	%f2,	%f6
	subccc	%g5,	0x192B,	%l3
	lduh	[%l7 + 0x6E],	%o6
	sdiv	%g3,	0x101B,	%i3
	ldd	[%l7 + 0x10],	%i6
	movleu	%icc,	%g7,	%g4
	xnor	%i1,	%i7,	%o0
	ldsb	[%l7 + 0x33],	%g2
	add	%l4,	0x0B13,	%i4
	srl	%g1,	%o4,	%i6
	fmovsa	%xcc,	%f4,	%f18
	stw	%g6,	[%l7 + 0x3C]
	fpackfix	%f28,	%f19
	edge16ln	%o7,	%i0,	%o1
	lduw	[%l7 + 0x70],	%i5
	smulcc	%l5,	0x0879,	%l2
	fcmpeq16	%f24,	%f20,	%o2
	fmovdge	%icc,	%f11,	%f9
	movvs	%xcc,	%l0,	%l1
	nop
	set	0x73, %g5
	ldub	[%l7 + %g5],	%o3
	sllx	%o5,	%g5,	%i2
	movrlz	%l3,	%g3,	%i3
	subcc	%l6,	0x0F89,	%g7
	fcmpd	%fcc2,	%f6,	%f28
	mulscc	%g4,	0x08DB,	%o6
	sub	%i1,	%i7,	%o0
	movrne	%g2,	%l4,	%g1
	fmovsvc	%icc,	%f7,	%f12
	movl	%icc,	%i4,	%o4
	udivx	%i6,	0x0956,	%o7
	fmovdcc	%xcc,	%f8,	%f14
	edge32l	%i0,	%o1,	%i5
	alignaddr	%l5,	%g6,	%o2
	addcc	%l0,	0x0CF4,	%l1
	movleu	%xcc,	%l2,	%o5
	xorcc	%o3,	0x0DE4,	%i2
	fone	%f6
	sethi	0x1AB7,	%g5
	edge8n	%l3,	%g3,	%l6
	fpsub16	%f4,	%f28,	%f30
	movcc	%xcc,	%g7,	%i3
	mulscc	%g4,	%i1,	%o6
	fones	%f13
	edge32	%o0,	%g2,	%l4
	ldsb	[%l7 + 0x43],	%i7
	fpack16	%f2,	%f3
	mova	%xcc,	%i4,	%o4
	xor	%g1,	%o7,	%i0
	orcc	%i6,	0x1F32,	%i5
	udiv	%l5,	0x0959,	%o1
	fpadd32s	%f19,	%f7,	%f8
	movrgz	%g6,	0x264,	%l0
	fabss	%f12,	%f10
	fcmpes	%fcc2,	%f8,	%f27
	ldsb	[%l7 + 0x0E],	%l1
	sth	%o2,	[%l7 + 0x12]
	movrlz	%l2,	0x026,	%o3
	fmovrse	%o5,	%f15,	%f11
	alignaddrl	%g5,	%i2,	%l3
	fornot2s	%f9,	%f12,	%f9
	array32	%l6,	%g3,	%i3
	addcc	%g4,	%i1,	%g7
	subccc	%o6,	0x1B65,	%g2
	stb	%l4,	[%l7 + 0x78]
	sll	%o0,	0x11,	%i7
	edge8l	%o4,	%i4,	%g1
	edge16l	%i0,	%i6,	%o7
	sub	%i5,	0x18D5,	%l5
	movne	%icc,	%g6,	%o1
	sll	%l0,	%o2,	%l2
	stx	%l1,	[%l7 + 0x08]
	andn	%o5,	%g5,	%i2
	fmovrdlz	%o3,	%f0,	%f8
	fcmpeq16	%f28,	%f8,	%l6
	bshuffle	%f0,	%f10,	%f28
	fmovrdgz	%g3,	%f24,	%f4
	edge16l	%i3,	%l3,	%i1
	ld	[%l7 + 0x1C],	%f1
	edge16n	%g4,	%o6,	%g7
	orcc	%l4,	%o0,	%g2
	udivx	%i7,	0x0B4A,	%o4
	fcmple16	%f12,	%f20,	%i4
	sethi	0x0771,	%g1
	sub	%i6,	0x05A3,	%o7
	fmovsvc	%xcc,	%f2,	%f8
	udiv	%i5,	0x0A59,	%i0
	sra	%g6,	%o1,	%l0
	bshuffle	%f28,	%f14,	%f4
	fnot1	%f10,	%f20
	stw	%l5,	[%l7 + 0x58]
	umulcc	%l2,	%o2,	%o5
	addc	%l1,	%g5,	%o3
	fmovscs	%xcc,	%f31,	%f30
	movcc	%xcc,	%i2,	%g3
	fabsd	%f18,	%f8
	lduw	[%l7 + 0x60],	%i3
	mulx	%l3,	0x0100,	%l6
	movl	%xcc,	%g4,	%o6
	fmovdg	%xcc,	%f2,	%f17
	sllx	%i1,	%g7,	%o0
	movl	%xcc,	%g2,	%l4
	orn	%o4,	0x08AC,	%i4
	srl	%g1,	0x1D,	%i7
	fabsd	%f0,	%f28
	addcc	%i6,	0x1255,	%i5
	movneg	%icc,	%i0,	%o7
	ldd	[%l7 + 0x18],	%f14
	sll	%o1,	%g6,	%l0
	orn	%l2,	0x1A51,	%l5
	orn	%o2,	0x0800,	%l1
	fcmpgt32	%f24,	%f30,	%o5
	sdiv	%g5,	0x1166,	%i2
	ld	[%l7 + 0x3C],	%f15
	udivcc	%o3,	0x16D0,	%g3
	fmovs	%f23,	%f20
	edge8l	%i3,	%l3,	%l6
	smulcc	%g4,	0x0DB6,	%o6
	fmul8ulx16	%f30,	%f14,	%f18
	and	%i1,	0x0F56,	%o0
	movg	%icc,	%g2,	%l4
	array16	%o4,	%g7,	%i4
	fmul8x16al	%f30,	%f24,	%f6
	mulscc	%g1,	0x1C72,	%i7
	fpadd16	%f20,	%f6,	%f4
	fands	%f18,	%f6,	%f4
	sll	%i5,	%i0,	%i6
	restore %o7, 0x1AE1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f20,	%f10
	udiv	%l0,	0x0598,	%g6
	mova	%xcc,	%l5,	%o2
	edge32ln	%l2,	%o5,	%l1
	sllx	%i2,	%o3,	%g5
	ldsh	[%l7 + 0x2E],	%g3
	sllx	%i3,	%l3,	%g4
	sethi	0x18D6,	%l6
	fmovdcc	%icc,	%f29,	%f7
	sir	0x0C90
	fmovsvs	%icc,	%f4,	%f4
	smulcc	%o6,	0x11D4,	%o0
	sll	%g2,	0x1F,	%i1
	fmovrde	%o4,	%f4,	%f18
	fsrc1s	%f28,	%f15
	sll	%g7,	%l4,	%g1
	subccc	%i7,	0x1759,	%i5
	mova	%icc,	%i4,	%i6
	subc	%o7,	0x02D2,	%o1
	fand	%f8,	%f14,	%f6
	edge32	%i0,	%g6,	%l5
	fcmpes	%fcc2,	%f26,	%f22
	lduw	[%l7 + 0x38],	%l0
	sir	0x0DFF
	add	%o2,	0x1B1D,	%l2
	umulcc	%l1,	%i2,	%o5
	udivcc	%o3,	0x02E7,	%g3
	fmovdpos	%xcc,	%f8,	%f10
	sir	0x1852
	subc	%g5,	%l3,	%g4
	fsrc1	%f24,	%f30
	xnor	%i3,	0x08CB,	%o6
	edge16n	%l6,	%g2,	%o0
	array16	%o4,	%g7,	%l4
	xor	%i1,	%g1,	%i5
	fmovrdgez	%i7,	%f24,	%f18
	edge16ln	%i6,	%o7,	%o1
	movg	%icc,	%i4,	%g6
	ld	[%l7 + 0x3C],	%f26
	array8	%i0,	%l5,	%l0
	add	%l2,	%l1,	%i2
	fmovdcs	%icc,	%f5,	%f5
	movge	%icc,	%o2,	%o3
	alignaddrl	%g3,	%g5,	%o5
	sdivcc	%g4,	0x00FB,	%i3
	srax	%l3,	0x00,	%l6
	movrlez	%g2,	%o0,	%o6
	fcmpne16	%f16,	%f26,	%o4
	fornot2s	%f30,	%f14,	%f19
	fnegd	%f24,	%f26
	edge16l	%g7,	%i1,	%g1
	sub	%l4,	0x15F7,	%i5
	srl	%i7,	%i6,	%o1
	stb	%i4,	[%l7 + 0x6A]
	smulcc	%o7,	0x0459,	%g6
	edge8l	%i0,	%l5,	%l2
	orcc	%l0,	0x1ED8,	%l1
	movcs	%xcc,	%o2,	%o3
	movre	%i2,	0x012,	%g3
	stw	%o5,	[%l7 + 0x20]
	movcs	%icc,	%g4,	%g5
	or	%i3,	%l6,	%l3
	sdivcc	%g2,	0x1750,	%o0
	alignaddr	%o6,	%g7,	%o4
	alignaddrl	%i1,	%g1,	%i5
	subc	%i7,	0x1A3D,	%l4
	ldsb	[%l7 + 0x1D],	%i6
	srl	%o1,	%o7,	%i4
	move	%icc,	%g6,	%i0
	fmul8sux16	%f14,	%f24,	%f16
	movge	%xcc,	%l2,	%l0
	fmovsneg	%xcc,	%f1,	%f31
	add	%l5,	0x1871,	%o2
	edge16l	%o3,	%l1,	%g3
	xnorcc	%i2,	0x14B7,	%g4
	xorcc	%o5,	0x1029,	%g5
	movrlez	%l6,	%l3,	%g2
	movrlz	%o0,	%o6,	%i3
	ld	[%l7 + 0x30],	%f10
	andn	%g7,	0x02F5,	%o4
	fcmpd	%fcc1,	%f0,	%f4
	addc	%i1,	0x195B,	%i5
	alignaddrl	%i7,	%g1,	%l4
	addcc	%o1,	%i6,	%i4
	fcmpes	%fcc2,	%f4,	%f23
	movg	%xcc,	%o7,	%g6
	movvs	%icc,	%l2,	%l0
	edge8	%l5,	%o2,	%i0
	fcmple16	%f22,	%f30,	%o3
	array16	%g3,	%l1,	%g4
	subcc	%o5,	0x1926,	%i2
	stx	%g5,	[%l7 + 0x78]
	srl	%l3,	%g2,	%l6
	fpack16	%f10,	%f5
	addc	%o0,	%i3,	%g7
	movcc	%icc,	%o4,	%i1
	edge32	%i5,	%i7,	%g1
	udivx	%o6,	0x0252,	%l4
	fnands	%f26,	%f4,	%f19
	smulcc	%i6,	0x1712,	%i4
	popc	%o7,	%o1
	fcmpgt32	%f6,	%f22,	%l2
	fnot1s	%f22,	%f16
	edge16	%g6,	%l5,	%o2
	alignaddr	%l0,	%o3,	%g3
	fnor	%f8,	%f22,	%f18
	save %l1, 0x00D2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	alignaddrl	%o5,	%g2,	%l3
	andncc	%l6,	%o0,	%g7
	fcmpd	%fcc2,	%f16,	%f16
	sub	%i3,	%i1,	%o4
	movre	%i7,	%i5,	%o6
	fmovd	%f28,	%f4
	udivx	%l4,	0x1BB6,	%i6
	sdivx	%i4,	0x1DEC,	%g1
	alignaddr	%o1,	%o7,	%g6
	edge16n	%l5,	%o2,	%l2
	udiv	%l0,	0x0657,	%g3
	edge8ln	%l1,	%o3,	%i0
	xnorcc	%g4,	0x189C,	%i2
	andcc	%g5,	0x07A4,	%o5
	movcs	%xcc,	%g2,	%l6
	ldx	[%l7 + 0x70],	%l3
	movrgez	%o0,	0x2B6,	%g7
	movge	%xcc,	%i1,	%o4
	addccc	%i3,	0x0E6E,	%i7
	mulx	%i5,	0x1DC3,	%o6
	edge8n	%i6,	%i4,	%g1
	fpack16	%f14,	%f19
	movge	%icc,	%l4,	%o1
	fcmple16	%f8,	%f4,	%o7
	lduw	[%l7 + 0x1C],	%g6
	fnot1	%f2,	%f24
	srlx	%o2,	%l5,	%l0
	edge8ln	%l2,	%l1,	%o3
	move	%xcc,	%i0,	%g3
	edge32n	%i2,	%g5,	%g4
	stw	%g2,	[%l7 + 0x48]
	fmovdge	%icc,	%f20,	%f18
	movvs	%xcc,	%o5,	%l6
	fcmpne32	%f2,	%f6,	%o0
	mova	%xcc,	%g7,	%l3
	srlx	%o4,	0x14,	%i3
	umulcc	%i1,	%i5,	%i7
	movgu	%xcc,	%o6,	%i4
	andcc	%i6,	%g1,	%l4
	subc	%o7,	0x0D97,	%g6
	xnorcc	%o1,	0x052E,	%l5
	movn	%xcc,	%o2,	%l2
	fornot2	%f10,	%f12,	%f18
	xnorcc	%l1,	0x1579,	%o3
	fand	%f2,	%f10,	%f24
	fmovsvs	%xcc,	%f28,	%f17
	fands	%f17,	%f29,	%f29
	movrne	%i0,	0x31E,	%l0
	movneg	%xcc,	%i2,	%g5
	movge	%xcc,	%g3,	%g4
	subcc	%g2,	0x1EF7,	%o5
	movle	%xcc,	%o0,	%g7
	ldsb	[%l7 + 0x66],	%l6
	fmovsle	%xcc,	%f30,	%f24
	restore %l3, 0x0A30, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i3,	%i5,	%i1
	move	%icc,	%o6,	%i7
	movne	%xcc,	%i6,	%i4
	andcc	%g1,	0x1A15,	%l4
	mulscc	%g6,	%o1,	%l5
	fmovsgu	%xcc,	%f10,	%f27
	edge32l	%o7,	%l2,	%o2
	umul	%l1,	%o3,	%i0
	addccc	%l0,	0x039B,	%i2
	movl	%xcc,	%g5,	%g3
	and	%g4,	0x05B8,	%o5
	movrgez	%o0,	%g2,	%l6
	sllx	%l3,	%o4,	%g7
	ldub	[%l7 + 0x62],	%i3
	andcc	%i5,	%i1,	%o6
	stw	%i6,	[%l7 + 0x50]
	movleu	%xcc,	%i7,	%g1
	movrlez	%i4,	0x393,	%l4
	nop
	set	0x3C, %o7
	ldsb	[%l7 + %o7],	%o1
	movrne	%l5,	0x1D2,	%o7
	orcc	%l2,	0x1A79,	%o2
	subcc	%g6,	%o3,	%i0
	fmul8x16au	%f20,	%f16,	%f18
	movpos	%xcc,	%l1,	%l0
	fmovsvs	%icc,	%f6,	%f25
	fcmpes	%fcc1,	%f4,	%f15
	movvc	%xcc,	%i2,	%g5
	save %g3, %g4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x64],	%g2
	movvs	%xcc,	%o0,	%l3
	fandnot1s	%f17,	%f17,	%f14
	fors	%f12,	%f1,	%f5
	orn	%o4,	0x1082,	%l6
	movle	%icc,	%i3,	%g7
	sdivx	%i5,	0x09C2,	%o6
	ldd	[%l7 + 0x60],	%i0
	ldd	[%l7 + 0x58],	%f30
	array16	%i7,	%g1,	%i4
	fmovdle	%icc,	%f20,	%f2
	mulx	%i6,	%l4,	%o1
	umul	%l5,	%l2,	%o2
	edge8l	%o7,	%g6,	%o3
	orncc	%l1,	0x057C,	%i0
	fones	%f30
	udivcc	%i2,	0x03FA,	%g5
	sub	%g3,	0x1483,	%l0
	save %o5, 0x0966, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o0,	%g2,	%l3
	and	%o4,	%l6,	%i3
	mulx	%i5,	%g7,	%i1
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%o6
	stx	%i7,	[%l7 + 0x38]
	for	%f12,	%f2,	%f2
	ldd	[%l7 + 0x20],	%f4
	edge16ln	%i4,	%g1,	%i6
	ldd	[%l7 + 0x08],	%o0
	ldd	[%l7 + 0x78],	%l4
	fabss	%f12,	%f25
	movg	%icc,	%l2,	%l4
	popc	%o2,	%g6
	subccc	%o3,	0x14A5,	%o7
	addccc	%i0,	0x11A2,	%l1
	smulcc	%g5,	0x1BBD,	%i2
	andncc	%g3,	%l0,	%o5
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g4
	edge8ln	%g2,	%l3,	%o4
	xorcc	%l6,	0x1C6B,	%o0
	nop
	set	0x20, %i2
	std	%f10,	[%l7 + %i2]
	fmul8sux16	%f8,	%f24,	%f6
	edge8	%i5,	%i3,	%i1
	movre	%o6,	0x070,	%i7
	edge8l	%i4,	%g7,	%i6
	xorcc	%g1,	%o1,	%l2
	edge16ln	%l5,	%o2,	%l4
	orncc	%o3,	0x0E21,	%g6
	addcc	%o7,	%l1,	%i0
	addccc	%i2,	0x0918,	%g3
	smul	%l0,	%o5,	%g4
	orncc	%g2,	0x1A2A,	%g5
	edge32ln	%l3,	%l6,	%o4
	addccc	%i5,	%i3,	%o0
	std	%f28,	[%l7 + 0x58]
	srlx	%o6,	0x07,	%i1
	xorcc	%i7,	%g7,	%i4
	movneg	%icc,	%g1,	%i6
	fcmpne16	%f26,	%f28,	%l2
	edge8l	%o1,	%o2,	%l5
	fmovdgu	%xcc,	%f30,	%f8
	edge32n	%l4,	%g6,	%o7
	fnors	%f2,	%f13,	%f25
	srl	%o3,	%i0,	%i2
	movvc	%icc,	%l1,	%l0
	alignaddrl	%o5,	%g4,	%g2
	fmovrdgz	%g3,	%f14,	%f4
	movg	%xcc,	%l3,	%g5
	movcc	%icc,	%o4,	%l6
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	ldd	[%l7 + 0x48],	%f14
	mulscc	%i1,	%i7,	%o0
	addc	%i4,	0x1796,	%g1
	stw	%g7,	[%l7 + 0x4C]
	xnorcc	%i6,	0x019A,	%o1
	edge8	%l2,	%o2,	%l4
	umul	%l5,	0x0C3A,	%g6
	fmovscs	%xcc,	%f22,	%f21
	ldd	[%l7 + 0x48],	%f10
	add	%o3,	%o7,	%i0
	fmovrslez	%l1,	%f19,	%f11
	ldub	[%l7 + 0x29],	%l0
	mova	%icc,	%o5,	%g4
	sdivcc	%i2,	0x05DA,	%g2
	fnand	%f22,	%f12,	%f2
	save %l3, %g5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g3,	%i3
	movrlez	%l6,	%i5,	%o6
	andncc	%i7,	%o0,	%i1
	fmovrslez	%i4,	%f0,	%f4
	fmovdleu	%xcc,	%f4,	%f26
	ldub	[%l7 + 0x7C],	%g7
	movre	%i6,	%g1,	%l2
	movge	%icc,	%o1,	%l4
	umulcc	%o2,	0x0D8F,	%g6
	movrgz	%o3,	%o7,	%i0
	xnorcc	%l5,	%l0,	%o5
	addc	%l1,	%i2,	%g2
	sth	%l3,	[%l7 + 0x2E]
	array32	%g4,	%g5,	%g3
	fmovrdgez	%o4,	%f2,	%f2
	movgu	%xcc,	%l6,	%i3
	edge16ln	%i5,	%o6,	%o0
	udiv	%i1,	0x0364,	%i7
	movvc	%icc,	%i4,	%g7
	movvc	%icc,	%i6,	%l2
	movpos	%icc,	%g1,	%l4
	subccc	%o1,	0x1289,	%o2
	fmovsne	%xcc,	%f21,	%f8
	edge8	%o3,	%o7,	%g6
	fcmpne32	%f22,	%f14,	%l5
	edge8ln	%l0,	%o5,	%l1
	movrgez	%i0,	0x1E0,	%i2
	fmovrsne	%g2,	%f6,	%f2
	movne	%xcc,	%g4,	%l3
	mova	%icc,	%g3,	%o4
	srlx	%l6,	0x12,	%i3
	edge8l	%g5,	%i5,	%o0
	edge16n	%o6,	%i7,	%i4
	fcmps	%fcc0,	%f2,	%f5
	st	%f2,	[%l7 + 0x54]
	movpos	%xcc,	%g7,	%i6
	movrgz	%l2,	%i1,	%g1
	fmovrsne	%l4,	%f1,	%f29
	umulcc	%o1,	%o3,	%o2
	fexpand	%f9,	%f16
	subccc	%o7,	0x1525,	%g6
	movvc	%xcc,	%l5,	%l0
	st	%f15,	[%l7 + 0x18]
	st	%f28,	[%l7 + 0x30]
	fcmple16	%f18,	%f8,	%o5
	movrgez	%l1,	%i0,	%g2
	movvs	%icc,	%i2,	%g4
	fpack32	%f2,	%f2,	%f10
	fand	%f24,	%f26,	%f2
	addcc	%g3,	%l3,	%o4
	movge	%icc,	%l6,	%g5
	edge32ln	%i3,	%i5,	%o0
	alignaddr	%i7,	%i4,	%o6
	fcmpgt16	%f22,	%f12,	%g7
	ldx	[%l7 + 0x70],	%l2
	ldx	[%l7 + 0x18],	%i1
	edge16ln	%g1,	%l4,	%i6
	mulscc	%o3,	0x09E2,	%o2
	fxnor	%f28,	%f22,	%f6
	array32	%o1,	%o7,	%g6
	movneg	%icc,	%l0,	%o5
	xnor	%l5,	%i0,	%l1
	nop
	set	0x18, %i7
	std	%f26,	[%l7 + %i7]
	fmovrde	%g2,	%f14,	%f22
	srax	%i2,	%g3,	%l3
	edge16ln	%g4,	%l6,	%o4
	fmovscs	%icc,	%f20,	%f31
	andn	%i3,	%i5,	%o0
	fcmped	%fcc1,	%f30,	%f4
	restore %g5, %i4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g7,	0x2A0,	%o6
	fornot2s	%f19,	%f29,	%f15
	sllx	%i1,	0x15,	%g1
	smulcc	%l4,	%i6,	%o3
	umulcc	%o2,	%o1,	%l2
	sethi	0x0853,	%g6
	smulcc	%o7,	%o5,	%l0
	std	%f6,	[%l7 + 0x68]
	fmovde	%icc,	%f20,	%f22
	move	%icc,	%i0,	%l5
	lduh	[%l7 + 0x38],	%l1
	array32	%g2,	%g3,	%l3
	movgu	%xcc,	%i2,	%l6
	sdivx	%g4,	0x0B1C,	%o4
	sdiv	%i5,	0x02A8,	%i3
	sir	0x10C3
	fmovdneg	%xcc,	%f1,	%f29
	fmovrse	%g5,	%f17,	%f20
	xnor	%i4,	0x1F5A,	%i7
	fpsub16	%f0,	%f8,	%f2
	xnor	%g7,	%o0,	%i1
	array8	%g1,	%o6,	%l4
	lduw	[%l7 + 0x0C],	%o3
	andn	%o2,	0x0C41,	%i6
	andcc	%o1,	0x126B,	%l2
	srl	%o7,	0x01,	%g6
	xnorcc	%l0,	%i0,	%l5
	udiv	%l1,	0x00EE,	%o5
	udivx	%g2,	0x11B3,	%l3
	fpadd16s	%f27,	%f5,	%f14
	movrgz	%i2,	%g3,	%g4
	fmovdne	%icc,	%f29,	%f22
	movle	%xcc,	%o4,	%l6
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%i4
	edge32	%g5,	%i3,	%i7
	movrlez	%g7,	0x3CA,	%i4
	orn	%o0,	%g1,	%o6
	array32	%l4,	%o3,	%i1
	orncc	%o2,	0x0D6F,	%o1
	udivcc	%l2,	0x1EB2,	%o7
	edge32	%i6,	%l0,	%i0
	lduh	[%l7 + 0x50],	%l5
	umulcc	%l1,	0x0F45,	%o5
	siam	0x7
	addcc	%g6,	0x1753,	%g2
	edge8ln	%l3,	%g3,	%g4
	fmovsl	%icc,	%f19,	%f15
	edge32l	%i2,	%l6,	%i5
	movrgez	%g5,	0x0FD,	%o4
	andncc	%i7,	%g7,	%i3
	edge16ln	%i4,	%o0,	%g1
	movrlez	%l4,	0x3F6,	%o3
	mulscc	%i1,	%o2,	%o1
	fpsub16	%f0,	%f4,	%f30
	fcmpne16	%f8,	%f0,	%l2
	fcmple16	%f6,	%f18,	%o6
	movrlz	%i6,	%o7,	%i0
	edge16l	%l5,	%l0,	%o5
	subc	%g6,	0x0843,	%l1
	edge16	%l3,	%g3,	%g2
	fxnor	%f6,	%f26,	%f26
	popc	0x16F0,	%i2
	lduw	[%l7 + 0x18],	%g4
	orcc	%i5,	%l6,	%o4
	edge8ln	%g5,	%g7,	%i3
	movcs	%icc,	%i7,	%o0
	fandnot2s	%f10,	%f23,	%f16
	sth	%i4,	[%l7 + 0x40]
	udivx	%l4,	0x0940,	%o3
	edge32n	%g1,	%i1,	%o2
	movrgez	%o1,	0x171,	%o6
	orn	%l2,	0x0E29,	%o7
	srax	%i6,	0x12,	%i0
	andn	%l5,	%l0,	%o5
	smul	%g6,	0x18EF,	%l3
	movrne	%l1,	0x2E1,	%g3
	umulcc	%g2,	%g4,	%i5
	movrgez	%i2,	%l6,	%g5
	movvs	%icc,	%g7,	%o4
	movg	%icc,	%i7,	%o0
	ldsw	[%l7 + 0x18],	%i4
	addc	%i3,	0x18FF,	%l4
	srlx	%g1,	%i1,	%o2
	add	%o3,	%o6,	%l2
	movrlz	%o1,	0x06D,	%o7
	srlx	%i0,	0x02,	%i6
	sir	0x1F99
	lduh	[%l7 + 0x26],	%l5
	fmovrde	%o5,	%f28,	%f16
	srl	%g6,	%l0,	%l1
	array8	%l3,	%g3,	%g4
	edge32ln	%g2,	%i5,	%l6
	umul	%g5,	%g7,	%o4
	array32	%i2,	%i7,	%i4
	smul	%o0,	0x144D,	%i3
	movrgz	%g1,	%l4,	%i1
	fmovdgu	%xcc,	%f0,	%f23
	fmovdcs	%icc,	%f4,	%f14
	stx	%o2,	[%l7 + 0x60]
	movrlez	%o3,	0x166,	%o6
	ldub	[%l7 + 0x51],	%l2
	edge8l	%o7,	%o1,	%i6
	movge	%xcc,	%i0,	%l5
	edge8l	%o5,	%l0,	%g6
	edge32n	%l3,	%l1,	%g4
	add	%g3,	%i5,	%g2
	edge16	%l6,	%g5,	%g7
	umul	%i2,	%i7,	%o4
	movvs	%xcc,	%o0,	%i3
	andncc	%g1,	%l4,	%i4
	add	%o2,	0x175B,	%i1
	sir	0x1CED
	ldsh	[%l7 + 0x54],	%o6
	movcc	%icc,	%o3,	%o7
	movrgz	%l2,	0x0CA,	%o1
	alignaddr	%i6,	%i0,	%o5
	sdivx	%l0,	0x0877,	%l5
	subc	%l3,	%g6,	%l1
	umul	%g3,	%i5,	%g4
	sra	%l6,	0x08,	%g2
	movrgz	%g5,	%i2,	%i7
	srax	%g7,	%o0,	%i3
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%g1
	movrlz	%l4,	%o4,	%i4
	fnot2	%f0,	%f18
	fsrc2	%f10,	%f16
	addccc	%o2,	0x1E6C,	%i1
	nop
	set	0x11, %o1
	ldub	[%l7 + %o1],	%o3
	popc	0x1545,	%o7
	addccc	%l2,	%o1,	%o6
	fornot1s	%f29,	%f27,	%f21
	alignaddrl	%i6,	%o5,	%l0
	movrgz	%l5,	0x0E9,	%l3
	alignaddr	%i0,	%l1,	%g6
	fmovdleu	%xcc,	%f13,	%f26
	edge16n	%g3,	%g4,	%i5
	sethi	0x0E79,	%l6
	fmovrslez	%g2,	%f23,	%f6
	fxor	%f24,	%f16,	%f26
	edge8n	%g5,	%i2,	%i7
	or	%o0,	0x0B70,	%i3
	edge8	%g7,	%l4,	%g1
	std	%f10,	[%l7 + 0x48]
	sir	0x0CEB
	movre	%i4,	0x041,	%o2
	subcc	%i1,	0x0727,	%o4
	movn	%icc,	%o7,	%o3
	fxor	%f26,	%f4,	%f28
	sth	%o1,	[%l7 + 0x7C]
	std	%f0,	[%l7 + 0x30]
	movn	%xcc,	%o6,	%i6
	ldx	[%l7 + 0x60],	%l2
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%l0
	movpos	%xcc,	%l5,	%o5
	mova	%xcc,	%l3,	%i0
	addcc	%g6,	%l1,	%g3
	ldx	[%l7 + 0x10],	%g4
	fmovdcc	%xcc,	%f9,	%f27
	andcc	%i5,	0x19C8,	%l6
	fpadd16s	%f8,	%f13,	%f6
	fcmpgt32	%f14,	%f4,	%g2
	fmovdgu	%icc,	%f8,	%f16
	stx	%i2,	[%l7 + 0x78]
	ldsb	[%l7 + 0x5D],	%i7
	xnor	%g5,	%i3,	%g7
	nop
	set	0x5C, %g2
	stw	%l4,	[%l7 + %g2]
	ldx	[%l7 + 0x20],	%o0
	ldd	[%l7 + 0x78],	%f2
	sub	%i4,	0x0190,	%g1
	fmovsne	%icc,	%f27,	%f2
	edge8ln	%i1,	%o4,	%o2
	save %o3, 0x124F, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f8,	%f26,	%o6
	mulscc	%i6,	%l2,	%o1
	stx	%l5,	[%l7 + 0x08]
	ldd	[%l7 + 0x68],	%o4
	movge	%icc,	%l0,	%i0
	edge8l	%g6,	%l1,	%g3
	std	%f2,	[%l7 + 0x78]
	edge32	%g4,	%i5,	%l3
	ldub	[%l7 + 0x3C],	%l6
	subccc	%g2,	%i7,	%i2
	andncc	%g5,	%i3,	%l4
	edge8l	%o0,	%i4,	%g1
	ldd	[%l7 + 0x50],	%f28
	stb	%g7,	[%l7 + 0x2D]
	ldsb	[%l7 + 0x67],	%i1
	ldd	[%l7 + 0x78],	%f22
	fmovrslz	%o2,	%f23,	%f18
	andn	%o3,	%o7,	%o6
	movvc	%xcc,	%i6,	%o4
	movrgz	%l2,	0x3BF,	%o1
	mova	%icc,	%o5,	%l0
	movcs	%xcc,	%l5,	%i0
	movrlez	%l1,	0x145,	%g6
	mulscc	%g3,	%i5,	%l3
	fxor	%f26,	%f4,	%f6
	sth	%g4,	[%l7 + 0x5C]
	sub	%l6,	0x1559,	%i7
	lduw	[%l7 + 0x74],	%i2
	fmul8x16au	%f15,	%f22,	%f0
	fpadd32s	%f2,	%f28,	%f13
	mova	%icc,	%g5,	%g2
	movvc	%icc,	%i3,	%o0
	edge8	%i4,	%l4,	%g7
	movre	%g1,	0x33F,	%i1
	movl	%xcc,	%o2,	%o3
	edge16l	%o7,	%i6,	%o6
	sdivx	%l2,	0x094F,	%o1
	fand	%f0,	%f16,	%f14
	and	%o4,	0x1F5D,	%o5
	fmul8sux16	%f22,	%f0,	%f28
	mulx	%l5,	%i0,	%l1
	movrgz	%l0,	%g6,	%g3
	fmul8sux16	%f8,	%f30,	%f6
	umulcc	%i5,	0x0D82,	%l3
	fmovsa	%xcc,	%f8,	%f14
	fmul8x16	%f4,	%f28,	%f16
	and	%g4,	%l6,	%i7
	udivx	%g5,	0x0A8B,	%i2
	movne	%xcc,	%i3,	%g2
	movle	%xcc,	%i4,	%l4
	fmovdge	%xcc,	%f31,	%f21
	ldd	[%l7 + 0x78],	%f18
	sll	%g7,	%o0,	%g1
	udiv	%o2,	0x1D27,	%o3
	movvs	%icc,	%o7,	%i1
	xor	%i6,	%l2,	%o1
	umul	%o4,	0x0E2E,	%o6
	array32	%l5,	%i0,	%o5
	edge16ln	%l1,	%g6,	%g3
	array32	%i5,	%l0,	%g4
	st	%f6,	[%l7 + 0x20]
	fxor	%f4,	%f22,	%f30
	alignaddrl	%l6,	%i7,	%g5
	edge32ln	%l3,	%i2,	%g2
	xorcc	%i3,	%i4,	%g7
	ld	[%l7 + 0x70],	%f25
	edge8ln	%l4,	%o0,	%g1
	edge16l	%o2,	%o3,	%o7
	array8	%i1,	%i6,	%o1
	edge32l	%l2,	%o6,	%l5
	fpack32	%f16,	%f24,	%f14
	smulcc	%o4,	0x13FD,	%i0
	fmovsg	%icc,	%f24,	%f12
	movrlz	%o5,	%l1,	%g3
	fandnot2	%f4,	%f16,	%f28
	movne	%icc,	%i5,	%l0
	edge8ln	%g6,	%g4,	%l6
	movcs	%xcc,	%g5,	%l3
	edge32l	%i2,	%i7,	%g2
	stb	%i4,	[%l7 + 0x6B]
	ldsh	[%l7 + 0x0C],	%g7
	smulcc	%l4,	%o0,	%i3
	ldd	[%l7 + 0x60],	%f14
	sir	0x1075
	udivx	%g1,	0x0115,	%o2
	fnot1	%f20,	%f0
	stw	%o7,	[%l7 + 0x38]
	sdivx	%i1,	0x172B,	%i6
	fmovrslez	%o1,	%f10,	%f4
	xor	%o3,	%l2,	%o6
	movl	%xcc,	%o4,	%l5
	edge8n	%o5,	%l1,	%g3
	smulcc	%i5,	0x0AB0,	%i0
	movg	%xcc,	%g6,	%l0
	movvs	%icc,	%l6,	%g5
	sethi	0x1970,	%l3
	fmovrdlz	%i2,	%f14,	%f24
	movge	%icc,	%g4,	%i7
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%i4
	fxors	%f30,	%f20,	%f31
	fnot1s	%f14,	%f15
	fmovdg	%icc,	%f13,	%f15
	fcmpne16	%f22,	%f26,	%g2
	or	%g7,	%l4,	%i3
	fmovspos	%icc,	%f31,	%f19
	save %g1, %o0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%f26
	edge32n	%o7,	%i1,	%o1
	and	%o3,	0x0D29,	%l2
	nop
	set	0x46, %o2
	ldsh	[%l7 + %o2],	%i6
	movn	%icc,	%o6,	%o4
	mova	%xcc,	%o5,	%l5
	fnot2	%f30,	%f0
	edge8ln	%g3,	%i5,	%i0
	fnor	%f20,	%f6,	%f30
	movne	%xcc,	%l1,	%g6
	xnor	%l0,	0x0B71,	%l6
	stw	%g5,	[%l7 + 0x64]
	smul	%l3,	%g4,	%i7
	movrgez	%i4,	%i2,	%g2
	fcmpes	%fcc2,	%f12,	%f10
	ldub	[%l7 + 0x6C],	%l4
	edge8ln	%i3,	%g1,	%g7
	fors	%f3,	%f20,	%f23
	srl	%o0,	%o7,	%i1
	fnands	%f16,	%f15,	%f24
	fmovrdne	%o1,	%f30,	%f30
	sir	0x190F
	fmovsge	%icc,	%f16,	%f23
	movne	%xcc,	%o3,	%o2
	stb	%l2,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x38],	%i6
	xnorcc	%o6,	0x141F,	%o5
	sub	%l5,	0x1111,	%o4
	addc	%i5,	%g3,	%i0
	edge32l	%g6,	%l1,	%l0
	udiv	%l6,	0x1FA2,	%l3
	or	%g4,	%i7,	%i4
	udivcc	%g5,	0x13FF,	%g2
	movge	%icc,	%i2,	%i3
	fmuld8sux16	%f17,	%f22,	%f10
	fabsd	%f30,	%f22
	movne	%icc,	%g1,	%l4
	and	%o0,	0x0888,	%g7
	movcs	%xcc,	%o7,	%i1
	alignaddr	%o3,	%o1,	%o2
	movl	%icc,	%i6,	%o6
	movn	%xcc,	%l2,	%o5
	fmovdn	%xcc,	%f7,	%f12
	movcs	%xcc,	%l5,	%o4
	ldsw	[%l7 + 0x1C],	%i5
	edge16	%g3,	%g6,	%l1
	andcc	%l0,	0x04C3,	%i0
	movl	%xcc,	%l6,	%l3
	movn	%xcc,	%i7,	%g4
	movne	%xcc,	%i4,	%g2
	fmovdne	%xcc,	%f0,	%f7
	save %i2, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	ldsh	[%l7 + 0x74],	%o0
	fxor	%f28,	%f10,	%f8
	movleu	%icc,	%g7,	%i1
	orcc	%o7,	0x02E5,	%o1
	movre	%o3,	%o2,	%o6
	ldd	[%l7 + 0x58],	%f28
	edge16n	%l2,	%i6,	%l5
	fones	%f15
	umul	%o5,	%i5,	%g3
	fnot2s	%f31,	%f1
	xnorcc	%g6,	0x038A,	%o4
	restore %l1, %l0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i0,	%l3,	%i7
	stw	%i4,	[%l7 + 0x18]
	sdiv	%g2,	0x1FDA,	%g4
	ldsw	[%l7 + 0x0C],	%i2
	st	%f24,	[%l7 + 0x4C]
	movrlz	%i3,	0x2C6,	%g5
	edge8n	%l4,	%g1,	%o0
	udivx	%g7,	0x095F,	%i1
	fxnors	%f15,	%f2,	%f3
	edge16ln	%o7,	%o3,	%o1
	array32	%o2,	%l2,	%i6
	or	%o6,	0x09CC,	%o5
	movrgez	%l5,	%i5,	%g3
	fone	%f28
	movne	%icc,	%g6,	%o4
	fpsub32s	%f4,	%f27,	%f22
	sir	0x0EC4
	ldsh	[%l7 + 0x60],	%l1
	fpsub16	%f24,	%f28,	%f24
	stb	%l6,	[%l7 + 0x42]
	movrlz	%i0,	%l3,	%l0
	movvc	%xcc,	%i7,	%i4
	fsrc1s	%f6,	%f0
	fmovsge	%xcc,	%f28,	%f18
	fmovdvc	%icc,	%f11,	%f14
	movl	%icc,	%g4,	%i2
	ldsw	[%l7 + 0x70],	%i3
	edge8l	%g2,	%l4,	%g5
	std	%f6,	[%l7 + 0x30]
	subc	%g1,	0x1D5F,	%o0
	srl	%i1,	0x0A,	%o7
	fcmped	%fcc0,	%f10,	%f14
	fmovsvc	%xcc,	%f3,	%f27
	or	%o3,	%g7,	%o2
	sdiv	%o1,	0x023C,	%i6
	movvc	%xcc,	%l2,	%o5
	subc	%l5,	%o6,	%g3
	srlx	%g6,	0x11,	%o4
	xnor	%l1,	%l6,	%i0
	movle	%xcc,	%l3,	%i5
	subccc	%i7,	%l0,	%g4
	edge8n	%i4,	%i2,	%i3
	stw	%l4,	[%l7 + 0x30]
	fandnot1	%f10,	%f4,	%f30
	fmovdl	%xcc,	%f6,	%f4
	ldx	[%l7 + 0x10],	%g2
	umulcc	%g5,	%g1,	%o0
	srax	%o7,	0x14,	%o3
	edge16n	%i1,	%o2,	%o1
	array8	%g7,	%l2,	%i6
	umulcc	%l5,	%o5,	%o6
	andncc	%g3,	%g6,	%l1
	fpsub16s	%f7,	%f2,	%f13
	fpackfix	%f0,	%f31
	stx	%o4,	[%l7 + 0x70]
	fmovscs	%xcc,	%f8,	%f26
	movvc	%icc,	%l6,	%i0
	fmovrsne	%i5,	%f25,	%f7
	edge16ln	%l3,	%l0,	%i7
	ldub	[%l7 + 0x14],	%g4
	movl	%icc,	%i2,	%i4
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	ldub	[%l7 + 0x58],	%g1
	orn	%o0,	%g5,	%o3
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%i1
	edge8n	%o2,	%o7,	%g7
	fmovdpos	%icc,	%f29,	%f13
	movre	%o1,	0x12D,	%i6
	ldx	[%l7 + 0x68],	%l5
	edge16	%l2,	%o5,	%g3
	subccc	%g6,	0x121B,	%o6
	ldsb	[%l7 + 0x1F],	%o4
	edge8n	%l6,	%i0,	%l1
	movrlez	%i5,	0x338,	%l3
	alignaddrl	%l0,	%g4,	%i7
	movcs	%xcc,	%i4,	%i2
	edge8ln	%l4,	%i3,	%g1
	udivcc	%g2,	0x16E4,	%g5
	fnands	%f6,	%f28,	%f16
	edge32ln	%o0,	%o3,	%i1
	fnot2s	%f27,	%f29
	xnorcc	%o7,	%g7,	%o1
	fzero	%f2
	sll	%o2,	0x0C,	%i6
	st	%f13,	[%l7 + 0x3C]
	srax	%l5,	%o5,	%g3
	std	%f12,	[%l7 + 0x28]
	lduh	[%l7 + 0x52],	%g6
	fcmps	%fcc1,	%f4,	%f11
	edge32l	%l2,	%o4,	%o6
	fmul8ulx16	%f2,	%f0,	%f8
	andcc	%l6,	%i0,	%i5
	sra	%l3,	%l0,	%l1
	andncc	%i7,	%g4,	%i2
	subccc	%l4,	0x16BB,	%i3
	stb	%g1,	[%l7 + 0x0F]
	edge8ln	%i4,	%g2,	%g5
	xnor	%o0,	%i1,	%o3
	srax	%g7,	0x04,	%o1
	subccc	%o2,	%o7,	%i6
	subcc	%o5,	0x0209,	%g3
	srl	%l5,	0x16,	%l2
	fnot1	%f6,	%f22
	fmovrsgez	%o4,	%f17,	%f24
	edge8l	%g6,	%l6,	%i0
	array16	%i5,	%o6,	%l0
	alignaddrl	%l3,	%l1,	%i7
	movneg	%xcc,	%i2,	%g4
	add	%l4,	%i3,	%g1
	addc	%g2,	%i4,	%g5
	fmovsgu	%xcc,	%f19,	%f14
	fpsub16s	%f18,	%f19,	%f12
	movge	%icc,	%i1,	%o0
	fmovsl	%icc,	%f30,	%f4
	subccc	%o3,	0x07ED,	%g7
	ldsh	[%l7 + 0x3A],	%o2
	movrgz	%o1,	0x28D,	%o7
	movrgz	%i6,	%g3,	%l5
	xorcc	%l2,	%o5,	%g6
	edge32l	%o4,	%i0,	%l6
	xor	%o6,	0x03C2,	%l0
	sethi	0x0DE8,	%i5
	edge8ln	%l3,	%l1,	%i7
	stb	%g4,	[%l7 + 0x51]
	movpos	%icc,	%i2,	%l4
	movcc	%xcc,	%g1,	%g2
	array8	%i3,	%i4,	%i1
	orncc	%g5,	0x1697,	%o0
	edge16l	%g7,	%o3,	%o2
	mulscc	%o1,	%o7,	%i6
	subccc	%g3,	0x1715,	%l2
	nop
	set	0x0C, %i6
	lduh	[%l7 + %i6],	%l5
	smul	%o5,	%o4,	%i0
	movle	%icc,	%g6,	%o6
	edge16ln	%l6,	%l0,	%i5
	movrlez	%l3,	%i7,	%l1
	edge16n	%i2,	%g4,	%g1
	save %g2, %i3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i1,	%g5,	%o0
	andcc	%l4,	%g7,	%o3
	ldsb	[%l7 + 0x37],	%o1
	udivx	%o7,	0x1BC1,	%i6
	movneg	%xcc,	%o2,	%l2
	fmovsleu	%xcc,	%f8,	%f15
	orn	%g3,	%l5,	%o4
	fexpand	%f17,	%f0
	addc	%i0,	%g6,	%o6
	edge16n	%l6,	%l0,	%i5
	movrlz	%l3,	%o5,	%i7
	subcc	%l1,	0x03C7,	%g4
	edge8	%i2,	%g2,	%i3
	sra	%g1,	%i4,	%g5
	fmovdvc	%xcc,	%f1,	%f25
	nop
	set	0x78, %l1
	ldsh	[%l7 + %l1],	%i1
	subcc	%l4,	%o0,	%g7
	fandnot1s	%f10,	%f1,	%f3
	subc	%o3,	%o1,	%i6
	fpsub32s	%f26,	%f14,	%f14
	movvc	%xcc,	%o7,	%o2
	udivx	%l2,	0x14B1,	%g3
	fmovsa	%xcc,	%f21,	%f25
	ld	[%l7 + 0x0C],	%f17
	stx	%o4,	[%l7 + 0x10]
	fcmpne32	%f30,	%f0,	%i0
	movneg	%icc,	%l5,	%o6
	mulx	%l6,	%g6,	%l0
	popc	0x15C4,	%i5
	fnot2s	%f20,	%f21
	add	%l3,	0x10E7,	%o5
	sdivcc	%i7,	0x0CB7,	%g4
	fors	%f22,	%f26,	%f16
	fmovsne	%xcc,	%f19,	%f10
	udivx	%l1,	0x0C1A,	%i2
	edge32	%i3,	%g2,	%g1
	popc	0x0D6F,	%g5
	or	%i1,	0x02D8,	%l4
	movneg	%xcc,	%o0,	%g7
	movrne	%o3,	%o1,	%i6
	udivx	%o7,	0x16D7,	%i4
	edge8	%l2,	%g3,	%o2
	restore %o4, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i0,	0x06C1,	%l6
	fmovrsne	%l0,	%f27,	%f10
	fzero	%f2
	smulcc	%i5,	0x1D88,	%l3
	or	%g6,	0x10F9,	%o5
	sir	0x1AE1
	movrne	%g4,	0x1C7,	%i7
	fpadd16s	%f21,	%f25,	%f26
	movrne	%i2,	0x3D7,	%l1
	umul	%i3,	%g2,	%g1
	movrlz	%i1,	0x1C3,	%g5
	movleu	%xcc,	%l4,	%g7
	udivcc	%o0,	0x143A,	%o1
	ldd	[%l7 + 0x08],	%o2
	andncc	%i6,	%o7,	%i4
	addcc	%g3,	%o2,	%o4
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	edge32n	%l2,	%l0,	%l6
	movrgz	%i5,	0x23E,	%g6
	edge16	%l3,	%o5,	%i7
	array16	%g4,	%i2,	%i3
	fmul8x16au	%f30,	%f4,	%f2
	udivx	%l1,	0x1372,	%g2
	orncc	%g1,	0x1957,	%i1
	fpadd16s	%f3,	%f13,	%f20
	ldub	[%l7 + 0x54],	%g5
	sdiv	%g7,	0x09A5,	%l4
	fmovde	%xcc,	%f26,	%f7
	array16	%o0,	%o3,	%o1
	movg	%icc,	%o7,	%i4
	array8	%i6,	%g3,	%o4
	save %l5, %o2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i0,	%l0,	%l6
	ldub	[%l7 + 0x73],	%i5
	movvc	%icc,	%l2,	%g6
	subc	%o5,	0x12CD,	%l3
	and	%g4,	0x12EC,	%i7
	xnor	%i3,	0x0693,	%i2
	movrlz	%g2,	%g1,	%i1
	sethi	0x0BAD,	%l1
	add	%g7,	0x1EEC,	%g5
	subcc	%o0,	0x1A90,	%l4
	edge8l	%o1,	%o7,	%o3
	udivx	%i6,	0x1F19,	%g3
	addccc	%i4,	%l5,	%o2
	lduh	[%l7 + 0x7E],	%o6
	ldsb	[%l7 + 0x1F],	%o4
	for	%f8,	%f20,	%f22
	fand	%f6,	%f6,	%f4
	std	%f20,	[%l7 + 0x50]
	edge16ln	%l0,	%i0,	%i5
	ld	[%l7 + 0x24],	%f7
	fmovdleu	%icc,	%f5,	%f3
	fones	%f8
	andn	%l2,	%g6,	%o5
	sub	%l6,	%g4,	%i7
	movgu	%icc,	%l3,	%i2
	fandnot2s	%f18,	%f18,	%f6
	sdiv	%i3,	0x0D99,	%g1
	udiv	%i1,	0x01B3,	%l1
	movrgez	%g7,	%g5,	%g2
	edge8l	%o0,	%l4,	%o7
	udivx	%o1,	0x0728,	%o3
	edge8	%i6,	%i4,	%l5
	xor	%g3,	0x1489,	%o6
	sllx	%o2,	%l0,	%o4
	fpadd32	%f26,	%f2,	%f6
	andncc	%i0,	%l2,	%i5
	move	%xcc,	%o5,	%l6
	srl	%g4,	0x15,	%g6
	addc	%i7,	0x1127,	%i2
	edge16	%i3,	%g1,	%l3
	orcc	%l1,	0x17C4,	%g7
	ldub	[%l7 + 0x34],	%i1
	sdivcc	%g5,	0x0C0B,	%g2
	st	%f27,	[%l7 + 0x2C]
	fmul8x16au	%f22,	%f21,	%f14
	edge32ln	%l4,	%o7,	%o0
	ldd	[%l7 + 0x38],	%f30
	fmovsge	%icc,	%f9,	%f1
	edge16	%o1,	%i6,	%i4
	edge32l	%o3,	%g3,	%l5
	popc	0x0FCC,	%o6
	ldd	[%l7 + 0x08],	%f30
	addccc	%l0,	0x1256,	%o4
	ldsw	[%l7 + 0x64],	%i0
	addcc	%o2,	%l2,	%o5
	smul	%i5,	0x01AF,	%l6
	sethi	0x1C0E,	%g4
	move	%xcc,	%i7,	%g6
	subcc	%i3,	0x0131,	%g1
	fmovrdlz	%l3,	%f28,	%f22
	fmul8x16au	%f26,	%f7,	%f20
	udiv	%l1,	0x176B,	%g7
	ldub	[%l7 + 0x24],	%i2
	orcc	%i1,	%g2,	%g5
	edge32	%l4,	%o0,	%o7
	mulx	%o1,	%i4,	%o3
	st	%f4,	[%l7 + 0x6C]
	movcc	%icc,	%g3,	%l5
	std	%f10,	[%l7 + 0x78]
	ld	[%l7 + 0x10],	%f25
	sub	%i6,	0x120D,	%l0
	lduw	[%l7 + 0x08],	%o4
	sth	%i0,	[%l7 + 0x62]
	fands	%f6,	%f11,	%f2
	movvs	%xcc,	%o6,	%o2
	edge16ln	%l2,	%i5,	%o5
	movvc	%icc,	%g4,	%l6
	sdiv	%i7,	0x120D,	%g6
	srl	%i3,	0x19,	%g1
	edge8n	%l1,	%g7,	%i2
	edge8	%i1,	%l3,	%g2
	restore %g5, 0x09A4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x58],	%o6
	ldub	[%l7 + 0x2C],	%o1
	xor	%l4,	0x1A93,	%i4
	udiv	%o3,	0x0E42,	%l5
	ldx	[%l7 + 0x30],	%i6
	stw	%g3,	[%l7 + 0x68]
	srl	%o4,	%i0,	%o6
	edge16n	%o2,	%l2,	%i5
	movrne	%l0,	0x291,	%g4
	xor	%o5,	%l6,	%i7
	sub	%i3,	%g1,	%g6
	edge16ln	%l1,	%i2,	%g7
	save %l3, 0x048C, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g5,	0x09D3,	%o0
	smulcc	%o7,	%g2,	%l4
	sth	%o1,	[%l7 + 0x44]
	fnegd	%f12,	%f22
	movneg	%xcc,	%i4,	%o3
	subccc	%l5,	%i6,	%o4
	ldx	[%l7 + 0x78],	%g3
	array16	%i0,	%o6,	%l2
	subcc	%i5,	0x0277,	%l0
	subc	%o2,	0x1CF6,	%g4
	fors	%f19,	%f17,	%f21
	std	%f14,	[%l7 + 0x28]
	sdivx	%o5,	0x082B,	%l6
	edge8	%i7,	%g1,	%g6
	edge8ln	%l1,	%i3,	%g7
	fornot2s	%f2,	%f3,	%f29
	sra	%i2,	0x09,	%i1
	orcc	%l3,	0x0004,	%o0
	movpos	%xcc,	%g5,	%o7
	mova	%icc,	%l4,	%g2
	xorcc	%i4,	%o1,	%o3
	addc	%i6,	0x0F36,	%o4
	ldsw	[%l7 + 0x4C],	%g3
	fnors	%f8,	%f21,	%f17
	fmovde	%icc,	%f17,	%f31
	edge32	%l5,	%o6,	%i0
	lduh	[%l7 + 0x0C],	%l2
	edge32l	%l0,	%i5,	%o2
	edge8	%o5,	%l6,	%g4
	array16	%i7,	%g6,	%l1
	udiv	%i3,	0x0379,	%g1
	srax	%i2,	0x1A,	%i1
	sdivx	%l3,	0x0377,	%g7
	udivcc	%o0,	0x0253,	%g5
	edge16ln	%l4,	%g2,	%o7
	fabsd	%f14,	%f30
	fnot1s	%f3,	%f3
	xnor	%o1,	%o3,	%i6
	andncc	%o4,	%i4,	%g3
	edge8l	%o6,	%l5,	%i0
	sdivcc	%l0,	0x16C4,	%i5
	sllx	%l2,	0x19,	%o5
	srlx	%o2,	0x04,	%g4
	fnors	%f4,	%f21,	%f8
	subcc	%l6,	0x1C0F,	%g6
	sth	%i7,	[%l7 + 0x3A]
	edge32l	%i3,	%l1,	%i2
	movcs	%xcc,	%g1,	%i1
	udivcc	%l3,	0x0B08,	%o0
	add	%g7,	0x1DC9,	%l4
	edge32ln	%g5,	%o7,	%o1
	sllx	%g2,	0x00,	%i6
	mulscc	%o4,	0x1508,	%i4
	fpackfix	%f20,	%f0
	edge16n	%o3,	%o6,	%g3
	udivx	%i0,	0x1302,	%l5
	subc	%i5,	%l0,	%l2
	array8	%o5,	%g4,	%o2
	fmovda	%icc,	%f20,	%f24
	movrgz	%g6,	%l6,	%i3
	movcc	%xcc,	%i7,	%l1
	fmul8sux16	%f20,	%f2,	%f8
	fpadd32	%f10,	%f2,	%f6
	fmul8x16au	%f16,	%f25,	%f14
	array16	%g1,	%i1,	%l3
	movgu	%icc,	%o0,	%g7
	fcmple32	%f6,	%f4,	%i2
	fmovrde	%g5,	%f22,	%f16
	fnors	%f25,	%f4,	%f2
	fsrc2s	%f28,	%f11
	fcmpeq16	%f20,	%f8,	%l4
	stb	%o7,	[%l7 + 0x74]
	fzero	%f0
	lduw	[%l7 + 0x68],	%g2
	add	%i6,	0x0844,	%o4
	mova	%xcc,	%o1,	%i4
	fmul8ulx16	%f14,	%f10,	%f6
	fornot2s	%f21,	%f24,	%f5
	udiv	%o3,	0x06ED,	%g3
	movle	%icc,	%o6,	%l5
	fornot1s	%f22,	%f16,	%f29
	xor	%i5,	%l0,	%i0
	fzero	%f26
	fnor	%f30,	%f20,	%f18
	sub	%l2,	%o5,	%g4
	fpack32	%f12,	%f16,	%f4
	alignaddr	%g6,	%o2,	%i3
	alignaddrl	%l6,	%l1,	%g1
	fmovdneg	%xcc,	%f29,	%f9
	sethi	0x0C58,	%i7
	edge16	%l3,	%i1,	%o0
	fmovdn	%xcc,	%f2,	%f23
	fxnor	%f30,	%f8,	%f26
	ldsh	[%l7 + 0x0A],	%i2
	movrne	%g5,	%g7,	%l4
	udiv	%g2,	0x1743,	%o7
	move	%icc,	%i6,	%o4
	movvs	%icc,	%o1,	%i4
	sethi	0x1C14,	%g3
	fmovrsgz	%o3,	%f22,	%f24
	udiv	%l5,	0x0EB5,	%o6
	srl	%i5,	%l0,	%l2
	movle	%icc,	%i0,	%o5
	mulscc	%g4,	%g6,	%i3
	smul	%l6,	%o2,	%l1
	subcc	%i7,	%g1,	%l3
	xor	%i1,	0x052A,	%i2
	orn	%g5,	%o0,	%g7
	lduh	[%l7 + 0x20],	%l4
	sra	%g2,	%o7,	%o4
	movrlez	%o1,	%i6,	%g3
	fand	%f14,	%f18,	%f10
	movpos	%icc,	%o3,	%l5
	move	%xcc,	%o6,	%i4
	fpack32	%f26,	%f30,	%f6
	orcc	%i5,	0x07CB,	%l0
	fxnor	%f18,	%f2,	%f2
	fornot1s	%f16,	%f0,	%f30
	ld	[%l7 + 0x50],	%f23
	mova	%xcc,	%l2,	%i0
	sll	%o5,	0x14,	%g6
	edge32l	%i3,	%l6,	%o2
	udivx	%l1,	0x0349,	%g4
	sub	%g1,	0x0857,	%l3
	array16	%i7,	%i1,	%g5
	edge8ln	%o0,	%i2,	%g7
	ldsw	[%l7 + 0x4C],	%l4
	add	%o7,	0x12C5,	%g2
	edge32ln	%o1,	%i6,	%o4
	fmul8ulx16	%f12,	%f2,	%f16
	fmovrdne	%g3,	%f6,	%f16
	ld	[%l7 + 0x1C],	%f7
	fmul8x16	%f14,	%f18,	%f20
	movgu	%xcc,	%o3,	%l5
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	mulx	%l2,	%i0,	%o5
	fornot2	%f22,	%f24,	%f10
	andcc	%l0,	%g6,	%i3
	movneg	%icc,	%l6,	%o2
	sir	0x0B97
	udivcc	%g4,	0x179A,	%g1
	alignaddr	%l3,	%l1,	%i7
	fands	%f22,	%f7,	%f11
	movrlez	%i1,	0x157,	%o0
	movn	%xcc,	%i2,	%g7
	array32	%g5,	%o7,	%l4
	movleu	%icc,	%o1,	%g2
	orcc	%o4,	0x0301,	%i6
	fnot2s	%f8,	%f22
	move	%xcc,	%g3,	%l5
	movvs	%icc,	%o3,	%i5
	movge	%icc,	%i4,	%l2
	ldsw	[%l7 + 0x4C],	%i0
	movge	%icc,	%o5,	%o6
	fone	%f2
	movne	%icc,	%l0,	%i3
	stw	%g6,	[%l7 + 0x64]
	array16	%o2,	%l6,	%g4
	addccc	%g1,	0x07BB,	%l3
	alignaddr	%i7,	%l1,	%o0
	edge16l	%i2,	%g7,	%i1
	fzero	%f20
	array8	%o7,	%l4,	%o1
	array8	%g2,	%g5,	%o4
	subc	%g3,	%i6,	%o3
	movg	%icc,	%i5,	%l5
	sdiv	%i4,	0x0D4C,	%i0
	sdivx	%o5,	0x1217,	%l2
	stx	%l0,	[%l7 + 0x60]
	movcs	%xcc,	%o6,	%i3
	fsrc2	%f2,	%f18
	ldsh	[%l7 + 0x3E],	%o2
	movcc	%xcc,	%l6,	%g6
	smulcc	%g1,	0x1B4C,	%g4
	fcmpeq32	%f20,	%f18,	%i7
	mulscc	%l1,	%o0,	%i2
	udiv	%l3,	0x0A2A,	%i1
	fmul8x16au	%f22,	%f23,	%f8
	fmovsgu	%icc,	%f25,	%f9
	edge32ln	%o7,	%g7,	%l4
	ldd	[%l7 + 0x50],	%g2
	array16	%g5,	%o4,	%o1
	sdivcc	%i6,	0x1961,	%o3
	fabsd	%f8,	%f22
	edge8	%i5,	%g3,	%l5
	fnot2s	%f13,	%f4
	edge32l	%i4,	%o5,	%i0
	xor	%l0,	%l2,	%o6
	sllx	%o2,	%l6,	%g6
	fsrc1	%f12,	%f10
	ldx	[%l7 + 0x68],	%g1
	movcs	%xcc,	%i3,	%i7
	nop
	set	0x4E, %l3
	lduh	[%l7 + %l3],	%g4
	fpsub16	%f14,	%f20,	%f8
	movrgz	%l1,	0x239,	%o0
	xor	%l3,	0x0EA3,	%i2
	faligndata	%f22,	%f20,	%f4
	fones	%f1
	movpos	%xcc,	%o7,	%i1
	movcc	%icc,	%g7,	%g2
	subccc	%l4,	%g5,	%o1
	andncc	%o4,	%i6,	%o3
	movg	%xcc,	%g3,	%i5
	movle	%xcc,	%l5,	%o5
	sethi	0x01F5,	%i4
	sub	%l0,	%i0,	%l2
	movrlz	%o2,	0x08C,	%o6
	edge16n	%g6,	%l6,	%i3
	fands	%f7,	%f19,	%f24
	movcs	%xcc,	%i7,	%g4
	fcmpes	%fcc1,	%f4,	%f12
	sdivcc	%l1,	0x00A7,	%o0
	edge32	%g1,	%i2,	%o7
	orn	%i1,	0x1635,	%g7
	fsrc1	%f20,	%f4
	subcc	%g2,	%l3,	%l4
	subc	%g5,	%o4,	%i6
	faligndata	%f16,	%f20,	%f8
	fabss	%f15,	%f18
	sethi	0x0767,	%o1
	xor	%o3,	0x0AFC,	%i5
	subc	%g3,	%o5,	%l5
	srl	%i4,	0x0B,	%l0
	save %i0, 0x188D, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o2,	%o6,	%l6
	xorcc	%g6,	0x0130,	%i7
	movge	%xcc,	%g4,	%l1
	orncc	%i3,	0x1F76,	%g1
	or	%o0,	0x0FCC,	%o7
	movrne	%i2,	0x2D4,	%i1
	fmovspos	%icc,	%f12,	%f31
	movrgz	%g7,	%l3,	%l4
	ldd	[%l7 + 0x40],	%g4
	alignaddr	%o4,	%g2,	%o1
	movgu	%xcc,	%i6,	%i5
	ldd	[%l7 + 0x30],	%f16
	alignaddrl	%g3,	%o5,	%l5
	movle	%xcc,	%i4,	%l0
	lduw	[%l7 + 0x08],	%o3
	fcmple16	%f0,	%f22,	%l2
	ldx	[%l7 + 0x28],	%o2
	movvs	%icc,	%o6,	%i0
	andncc	%l6,	%g6,	%g4
	smul	%l1,	%i7,	%g1
	ldx	[%l7 + 0x50],	%i3
	ldd	[%l7 + 0x38],	%o6
	fnors	%f17,	%f27,	%f29
	mova	%icc,	%o0,	%i2
	array32	%i1,	%g7,	%l3
	fmovrsgz	%g5,	%f3,	%f14
	movrne	%o4,	%l4,	%g2
	move	%icc,	%o1,	%i5
	fmovsgu	%icc,	%f10,	%f3
	edge8ln	%i6,	%g3,	%o5
	movgu	%xcc,	%l5,	%i4
	edge8l	%l0,	%l2,	%o2
	edge16l	%o3,	%o6,	%i0
	edge32l	%l6,	%g4,	%l1
	or	%i7,	%g1,	%i3
	movl	%xcc,	%o7,	%g6
	restore %i2, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%l3
	smulcc	%g7,	%o4,	%l4
	ldd	[%l7 + 0x40],	%f12
	movre	%g5,	0x2C2,	%o1
	fexpand	%f17,	%f10
	stb	%g2,	[%l7 + 0x5B]
	umulcc	%i5,	%i6,	%g3
	andncc	%l5,	%o5,	%i4
	nop
	set	0x0C, %i4
	ldsw	[%l7 + %i4],	%l0
	fxnors	%f26,	%f31,	%f9
	subc	%o2,	%l2,	%o3
	ldub	[%l7 + 0x3D],	%i0
	srl	%l6,	0x11,	%o6
	fmovse	%xcc,	%f19,	%f13
	fsrc2s	%f27,	%f17
	sth	%l1,	[%l7 + 0x50]
	xnor	%i7,	0x0351,	%g1
	fmul8x16	%f30,	%f6,	%f12
	sir	0x1E5E
	array32	%i3,	%o7,	%g6
	subcc	%i2,	%g4,	%i1
	movre	%o0,	0x23D,	%g7
	movleu	%xcc,	%l3,	%o4
	xor	%l4,	%g5,	%o1
	movpos	%xcc,	%i5,	%g2
	udiv	%g3,	0x094E,	%i6
	lduw	[%l7 + 0x24],	%o5
	std	%f0,	[%l7 + 0x40]
	movrlez	%i4,	0x28A,	%l5
	andcc	%l0,	%l2,	%o2
	subcc	%o3,	0x02E6,	%i0
	smulcc	%o6,	%l1,	%l6
	fandnot2s	%f19,	%f7,	%f18
	xnorcc	%g1,	0x153C,	%i7
	lduh	[%l7 + 0x16],	%i3
	array32	%o7,	%i2,	%g6
	and	%g4,	%i1,	%g7
	sdiv	%o0,	0x1840,	%l3
	movge	%xcc,	%o4,	%g5
	movgu	%icc,	%l4,	%o1
	lduh	[%l7 + 0x34],	%g2
	movneg	%icc,	%i5,	%i6
	udiv	%o5,	0x0FC0,	%i4
	array16	%g3,	%l0,	%l5
	subcc	%l2,	%o3,	%i0
	alignaddrl	%o2,	%o6,	%l6
	stb	%g1,	[%l7 + 0x59]
	movneg	%icc,	%l1,	%i7
	save %o7, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g6,	0x1FCC,	%g4
	addcc	%i1,	%o0,	%l3
	mulscc	%o4,	%g7,	%g5
	movrgz	%o1,	%l4,	%g2
	andcc	%i5,	%i6,	%o5
	fmovdl	%xcc,	%f10,	%f7
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	fmovdne	%icc,	%f26,	%f25
	ldsw	[%l7 + 0x20],	%l0
	edge32l	%l2,	%l5,	%o3
	save %o2, 0x059E, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o6,	%g1,	%l6
	sdivcc	%i7,	0x023E,	%l1
	edge8ln	%o7,	%i2,	%i3
	edge16l	%g6,	%i1,	%g4
	stw	%l3,	[%l7 + 0x10]
	ldd	[%l7 + 0x20],	%f0
	subcc	%o0,	0x0F1C,	%g7
	andcc	%o4,	0x02C9,	%g5
	addc	%o1,	0x1A17,	%l4
	edge8ln	%i5,	%g2,	%i6
	edge16ln	%o5,	%g3,	%i4
	sth	%l2,	[%l7 + 0x3E]
	add	%l0,	0x0FF3,	%o3
	fmovsvs	%xcc,	%f4,	%f13
	mova	%icc,	%o2,	%i0
	movrlez	%l5,	%g1,	%o6
	mulx	%l6,	0x06B2,	%l1
	fcmpgt16	%f12,	%f24,	%o7
	add	%i7,	%i2,	%i3
	sdiv	%g6,	0x193E,	%i1
	orcc	%l3,	0x0B99,	%g4
	movre	%o0,	0x231,	%o4
	edge32l	%g5,	%o1,	%l4
	add	%g7,	%i5,	%i6
	array16	%o5,	%g3,	%i4
	lduw	[%l7 + 0x14],	%l2
	udivx	%l0,	0x16C4,	%g2
	fand	%f8,	%f24,	%f8
	movg	%icc,	%o3,	%i0
	for	%f8,	%f6,	%f4
	movgu	%icc,	%o2,	%l5
	fmovscs	%xcc,	%f25,	%f19
	xorcc	%g1,	%o6,	%l6
	ldsh	[%l7 + 0x32],	%l1
	movrlez	%i7,	%i2,	%o7
	and	%g6,	0x0661,	%i3
	sir	0x18A7
	xnorcc	%i1,	%l3,	%o0
	edge32n	%o4,	%g4,	%o1
	sub	%g5,	0x0112,	%g7
	movrlez	%l4,	%i5,	%o5
	sra	%i6,	0x16,	%g3
	edge16ln	%l2,	%l0,	%g2
	edge8	%i4,	%i0,	%o3
	edge16n	%l5,	%o2,	%o6
	fones	%f8
	addccc	%g1,	%l1,	%i7
	umul	%i2,	%o7,	%g6
	fpadd16s	%f29,	%f21,	%f28
	fzeros	%f3
	array8	%l6,	%i3,	%l3
	movle	%icc,	%o0,	%o4
	movrgz	%i1,	0x31E,	%g4
	edge8	%o1,	%g5,	%g7
	stw	%i5,	[%l7 + 0x5C]
	nop
	set	0x24, %g7
	lduh	[%l7 + %g7],	%o5
	movrlz	%i6,	0x210,	%g3
	mulscc	%l4,	0x01CA,	%l2
	alignaddrl	%g2,	%l0,	%i4
	xor	%o3,	0x0F7E,	%l5
	array16	%i0,	%o6,	%g1
	fone	%f0
	st	%f13,	[%l7 + 0x6C]
	movre	%l1,	0x2D7,	%i7
	udiv	%i2,	0x0EBD,	%o7
	orncc	%o2,	0x0948,	%l6
	fmovsg	%icc,	%f28,	%f31
	movn	%icc,	%i3,	%l3
	movrgz	%o0,	%o4,	%i1
	fcmpd	%fcc3,	%f0,	%f24
	movcc	%xcc,	%g4,	%o1
	fands	%f26,	%f19,	%f19
	movg	%icc,	%g5,	%g7
	xorcc	%i5,	%o5,	%g6
	alignaddrl	%i6,	%l4,	%g3
	sth	%g2,	[%l7 + 0x50]
	xnorcc	%l0,	%i4,	%o3
	sll	%l2,	%i0,	%o6
	add	%g1,	0x086C,	%l5
	movgu	%xcc,	%l1,	%i2
	fmul8ulx16	%f2,	%f8,	%f28
	sra	%o7,	0x0B,	%o2
	fpackfix	%f14,	%f12
	fands	%f20,	%f15,	%f24
	lduw	[%l7 + 0x78],	%l6
	fmovd	%f14,	%f2
	edge8ln	%i7,	%l3,	%o0
	fmovrdgz	%i3,	%f20,	%f12
	sdiv	%o4,	0x115F,	%i1
	edge32ln	%o1,	%g5,	%g4
	lduh	[%l7 + 0x08],	%i5
	edge32ln	%g7,	%g6,	%o5
	movg	%xcc,	%l4,	%i6
	udivx	%g3,	0x03E6,	%l0
	movg	%icc,	%i4,	%g2
	ldsw	[%l7 + 0x3C],	%l2
	xorcc	%i0,	0x1A9B,	%o3
	fsrc2	%f18,	%f8
	ldx	[%l7 + 0x58],	%g1
	pdist	%f28,	%f24,	%f22
	movn	%icc,	%l5,	%l1
	addcc	%o6,	0x1F28,	%o7
	array32	%i2,	%l6,	%i7
	udivcc	%l3,	0x1BCA,	%o2
	movvc	%xcc,	%o0,	%o4
	movg	%xcc,	%i1,	%o1
	sdivcc	%i3,	0x0B55,	%g4
	fpadd16s	%f14,	%f11,	%f2
	movneg	%icc,	%g5,	%g7
	movne	%icc,	%g6,	%o5
	stw	%i5,	[%l7 + 0x0C]
	ld	[%l7 + 0x48],	%f6
	fmovdle	%icc,	%f8,	%f4
	sdiv	%i6,	0x1E09,	%l4
	movcs	%icc,	%g3,	%i4
	popc	0x05E6,	%g2
	fcmpeq32	%f4,	%f26,	%l0
	movle	%xcc,	%l2,	%i0
	std	%f20,	[%l7 + 0x30]
	restore %o3, 0x13B8, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f18,	%f18,	%f4
	add	%l5,	%o6,	%l1
	and	%o7,	%l6,	%i2
	sdivx	%i7,	0x1BF2,	%o2
	fornot2s	%f13,	%f25,	%f18
	fmovscs	%icc,	%f31,	%f22
	mulscc	%o0,	0x12DD,	%l3
	fabsd	%f18,	%f28
	movvs	%xcc,	%i1,	%o4
	srlx	%i3,	0x1A,	%g4
	fcmpeq16	%f2,	%f28,	%g5
	orncc	%o1,	0x11A5,	%g7
	fmovrslz	%g6,	%f23,	%f17
	xnor	%o5,	%i5,	%l4
	orn	%g3,	%i4,	%i6
	fpadd32	%f6,	%f2,	%f10
	lduh	[%l7 + 0x48],	%g2
	fcmpeq16	%f30,	%f26,	%l0
	fnot2s	%f24,	%f1
	alignaddrl	%i0,	%o3,	%g1
	save %l5, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o6,	%o7
	ldsb	[%l7 + 0x14],	%l6
	udivx	%i2,	0x1580,	%i7
	movne	%icc,	%o0,	%l3
	edge16l	%o2,	%i1,	%i3
	alignaddrl	%g4,	%o4,	%g5
	fcmps	%fcc2,	%f13,	%f13
	xnorcc	%o1,	%g7,	%o5
	movcc	%xcc,	%i5,	%g6
	lduw	[%l7 + 0x58],	%g3
	movne	%icc,	%l4,	%i4
	movge	%icc,	%i6,	%g2
	st	%f19,	[%l7 + 0x7C]
	edge8ln	%i0,	%o3,	%g1
	edge32l	%l5,	%l0,	%l2
	fmovrdne	%o6,	%f28,	%f22
	fabsd	%f6,	%f24
	sllx	%l1,	0x11,	%l6
	fcmple32	%f6,	%f10,	%o7
	ldd	[%l7 + 0x78],	%f8
	fmuld8sux16	%f24,	%f17,	%f14
	ldsw	[%l7 + 0x0C],	%i7
	alignaddr	%o0,	%l3,	%o2
	orncc	%i1,	0x1C77,	%i3
	movrgez	%g4,	0x27E,	%o4
	movgu	%xcc,	%g5,	%i2
	ld	[%l7 + 0x78],	%f19
	or	%g7,	0x0925,	%o1
	movvc	%xcc,	%i5,	%g6
	edge32l	%o5,	%g3,	%l4
	ldd	[%l7 + 0x60],	%f0
	xor	%i6,	%g2,	%i0
	ldsw	[%l7 + 0x7C],	%o3
	movrlz	%i4,	%g1,	%l5
	edge16l	%l2,	%l0,	%l1
	ldx	[%l7 + 0x50],	%l6
	nop
	set	0x14, %g1
	stw	%o6,	[%l7 + %g1]
	xorcc	%o7,	%i7,	%l3
	fmul8x16au	%f20,	%f4,	%f26
	fmovsvs	%xcc,	%f0,	%f11
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%o2
	udivcc	%o0,	0x048D,	%i3
	ldx	[%l7 + 0x28],	%i1
	ldsh	[%l7 + 0x22],	%o4
	fmovsge	%icc,	%f31,	%f12
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	move	%icc,	%i2,	%i5
	bshuffle	%f26,	%f24,	%f4
	fmovsle	%icc,	%f30,	%f24
	ld	[%l7 + 0x34],	%f27
	ld	[%l7 + 0x0C],	%f27
	subccc	%o1,	0x1714,	%g6
	fmovsa	%icc,	%f26,	%f18
	lduw	[%l7 + 0x14],	%o5
	and	%g3,	%i6,	%l4
	movn	%xcc,	%i0,	%g2
	array32	%i4,	%g1,	%l5
	fpsub32s	%f0,	%f24,	%f19
	fornot2s	%f24,	%f13,	%f21
	movvc	%icc,	%o3,	%l2
	save %l0, %l1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l6,	%i7,	%l3
	edge32	%o7,	%o2,	%o0
	fmovrdgez	%i3,	%f4,	%f18
	addcc	%o4,	0x17DF,	%g4
	move	%icc,	%i1,	%g5
	fmul8x16al	%f1,	%f15,	%f8
	stb	%g7,	[%l7 + 0x34]
	edge32l	%i2,	%i5,	%o1
	movleu	%icc,	%g6,	%o5
	movpos	%xcc,	%i6,	%l4
	sll	%g3,	0x11,	%g2
	udivcc	%i0,	0x0F28,	%i4
	fcmpgt16	%f16,	%f16,	%l5
	array16	%g1,	%o3,	%l0
	fcmps	%fcc1,	%f27,	%f20
	alignaddrl	%l1,	%o6,	%l2
	edge16	%i7,	%l6,	%l3
	ldub	[%l7 + 0x11],	%o2
	addc	%o7,	%o0,	%o4
	movrlz	%g4,	%i1,	%g5
	lduh	[%l7 + 0x28],	%g7
	subccc	%i2,	%i3,	%o1
	stw	%i5,	[%l7 + 0x28]
	movre	%g6,	%o5,	%l4
	move	%icc,	%g3,	%g2
	fnot1	%f2,	%f16
	fpack32	%f4,	%f22,	%f10
	movcc	%icc,	%i6,	%i0
	sllx	%l5,	0x17,	%g1
	alignaddr	%o3,	%l0,	%i4
	movrgz	%l1,	%o6,	%l2
	array32	%i7,	%l3,	%l6
	movvs	%xcc,	%o2,	%o0
	st	%f9,	[%l7 + 0x44]
	and	%o7,	0x07D2,	%o4
	movleu	%icc,	%i1,	%g5
	subccc	%g7,	%g4,	%i3
	sllx	%i2,	%o1,	%g6
	mova	%xcc,	%o5,	%i5
	fmovdneg	%icc,	%f0,	%f22
	fcmpeq16	%f24,	%f10,	%l4
	udivcc	%g3,	0x12CB,	%i6
	orcc	%i0,	%g2,	%g1
	umul	%o3,	%l0,	%i4
	fmovrdne	%l5,	%f20,	%f28
	edge32l	%o6,	%l2,	%l1
	xnor	%l3,	%i7,	%l6
	fsrc2	%f0,	%f4
	movleu	%icc,	%o2,	%o7
	edge32ln	%o4,	%i1,	%g5
	fmovrdne	%o0,	%f14,	%f6
	ldsh	[%l7 + 0x42],	%g7
	xorcc	%i3,	%g4,	%i2
	movpos	%xcc,	%g6,	%o1
	srl	%i5,	%l4,	%g3
	fmovd	%f30,	%f0
	udivcc	%o5,	0x0C8B,	%i0
	fone	%f26
	or	%i6,	%g2,	%g1
	sdiv	%o3,	0x15EB,	%l0
	stx	%i4,	[%l7 + 0x50]
	xnorcc	%o6,	%l2,	%l5
	fcmps	%fcc2,	%f0,	%f10
	ldd	[%l7 + 0x10],	%f18
	sdiv	%l3,	0x0CD0,	%l1
	array32	%l6,	%i7,	%o7
	ldd	[%l7 + 0x50],	%f20
	movrgez	%o4,	0x0FF,	%i1
	umulcc	%g5,	0x0C1D,	%o2
	udiv	%o0,	0x17FD,	%i3
	smul	%g4,	%i2,	%g7
	edge8n	%g6,	%i5,	%l4
	udiv	%o1,	0x046D,	%g3
	addccc	%i0,	0x1B51,	%i6
	movpos	%icc,	%g2,	%o5
	fmovsl	%icc,	%f24,	%f2
	fnot1	%f0,	%f12
	fornot2s	%f22,	%f18,	%f25
	sdiv	%o3,	0x004B,	%l0
	fmovsgu	%icc,	%f4,	%f17
	movrgz	%g1,	0x02D,	%i4
	edge8	%o6,	%l5,	%l2
	edge32ln	%l1,	%l6,	%l3
	edge8ln	%o7,	%i7,	%o4
	xorcc	%g5,	0x19E2,	%i1
	ldsw	[%l7 + 0x40],	%o0
	edge8l	%i3,	%o2,	%g4
	mulscc	%g7,	0x1B33,	%g6
	alignaddr	%i5,	%i2,	%l4
	std	%f10,	[%l7 + 0x58]
	edge16l	%g3,	%i0,	%o1
	smul	%g2,	0x1CCA,	%i6
	andncc	%o3,	%l0,	%o5
	movl	%xcc,	%g1,	%i4
	mulscc	%l5,	%o6,	%l2
	fsrc2s	%f9,	%f5
	movle	%icc,	%l1,	%l6
	fmovd	%f8,	%f22
	movvc	%icc,	%o7,	%i7
	movvs	%xcc,	%l3,	%o4
	fmovdg	%xcc,	%f19,	%f20
	fxors	%f1,	%f2,	%f31
	sub	%g5,	%i1,	%i3
	movge	%icc,	%o2,	%g4
	edge32	%o0,	%g6,	%g7
	ldsw	[%l7 + 0x18],	%i2
	movvs	%xcc,	%l4,	%i5
	lduh	[%l7 + 0x1E],	%g3
	fxor	%f16,	%f24,	%f22
	popc	%i0,	%g2
	movl	%xcc,	%o1,	%i6
	array16	%o3,	%l0,	%o5
	xnor	%g1,	0x1BCB,	%l5
	restore %i4, %l2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f9,	%f8
	movcc	%icc,	%l1,	%o7
	movvs	%icc,	%l6,	%i7
	ldsw	[%l7 + 0x0C],	%l3
	ldsh	[%l7 + 0x72],	%o4
	movcs	%xcc,	%g5,	%i3
	srlx	%i1,	0x08,	%g4
	movrlz	%o2,	0x157,	%g6
	fnot2	%f10,	%f28
	movg	%xcc,	%o0,	%i2
	array32	%l4,	%g7,	%i5
	save %g3, %g2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o1,	0x1755,	%o3
	fmovsn	%xcc,	%f4,	%f1
	fmul8x16al	%f11,	%f6,	%f22
	umulcc	%i6,	%o5,	%g1
	addc	%l0,	0x194B,	%l5
	fcmpes	%fcc3,	%f24,	%f12
	smulcc	%l2,	0x1CD1,	%o6
	move	%xcc,	%i4,	%o7
	xor	%l6,	%l1,	%l3
	siam	0x3
	mulx	%o4,	%i7,	%g5
	edge8l	%i3,	%g4,	%i1
	edge16l	%g6,	%o0,	%o2
	srl	%l4,	%g7,	%i2
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%i5
	andcc	%g3,	0x0BF0,	%i0
	srax	%o1,	0x14,	%g2
	srl	%i6,	%o5,	%g1
	edge8n	%o3,	%l0,	%l5
	fnot2	%f30,	%f10
	movcc	%xcc,	%o6,	%i4
	fcmpgt16	%f12,	%f16,	%l2
	fmovrslz	%o7,	%f28,	%f7
	fmovsle	%xcc,	%f15,	%f8
	sdivcc	%l6,	0x1072,	%l3
	movrlez	%l1,	0x082,	%i7
	andncc	%g5,	%i3,	%g4
	fcmpne32	%f0,	%f30,	%o4
	ldsh	[%l7 + 0x52],	%i1
	movl	%icc,	%o0,	%g6
	xor	%o2,	0x0844,	%g7
	xor	%i2,	0x04B1,	%l4
	movrne	%i5,	%i0,	%o1
	movrlez	%g3,	%i6,	%g2
	movrgez	%g1,	%o5,	%o3
	udivx	%l5,	0x087F,	%o6
	fabsd	%f8,	%f0
	array8	%l0,	%l2,	%i4
	andncc	%l6,	%o7,	%l1
	fsrc1	%f20,	%f18
	fmovspos	%icc,	%f3,	%f5
	xor	%l3,	%g5,	%i3
	movn	%icc,	%g4,	%o4
	mulx	%i7,	0x0143,	%i1
	move	%icc,	%g6,	%o0
	ldx	[%l7 + 0x50],	%o2
	st	%f13,	[%l7 + 0x48]
	addccc	%g7,	%i2,	%i5
	edge16ln	%l4,	%i0,	%g3
	fmovsvc	%xcc,	%f12,	%f27
	array16	%o1,	%g2,	%i6
	sethi	0x05C1,	%o5
	add	%o3,	0x1130,	%g1
	addcc	%l5,	0x19AB,	%o6
	fmovdgu	%icc,	%f29,	%f22
	edge16n	%l2,	%i4,	%l6
	fnor	%f22,	%f4,	%f24
	save %l0, 0x0887, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f2,	%f4,	%l1
	ldd	[%l7 + 0x48],	%f20
	fpack32	%f4,	%f8,	%f30
	for	%f28,	%f8,	%f2
	orncc	%l3,	%g5,	%g4
	mulscc	%i3,	%i7,	%i1
	mulscc	%o4,	%g6,	%o2
	srl	%o0,	%g7,	%i2
	udivx	%i5,	0x1211,	%l4
	sub	%i0,	%o1,	%g3
	sll	%i6,	0x0D,	%o5
	array32	%g2,	%g1,	%o3
	ldsh	[%l7 + 0x20],	%o6
	mulx	%l2,	0x08D1,	%i4
	addc	%l6,	0x0FEE,	%l0
	movvs	%xcc,	%o7,	%l5
	sdiv	%l1,	0x05A7,	%g5
	fmovrdgz	%l3,	%f28,	%f26
	fmovrslez	%g4,	%f8,	%f30
	sub	%i7,	0x0EC2,	%i1
	addc	%o4,	0x14D0,	%g6
	edge8	%o2,	%o0,	%i3
	ldsb	[%l7 + 0x1A],	%g7
	mulx	%i2,	%i5,	%i0
	subccc	%o1,	%l4,	%i6
	fmovrsgez	%o5,	%f10,	%f25
	edge16l	%g2,	%g1,	%o3
	fmovrslz	%g3,	%f16,	%f22
	movrgez	%l2,	%i4,	%l6
	sdiv	%l0,	0x0195,	%o7
	subcc	%l5,	0x1A33,	%l1
	sdiv	%g5,	0x017B,	%o6
	smulcc	%l3,	%g4,	%i1
	fmovrsne	%i7,	%f2,	%f28
	srl	%o4,	%o2,	%g6
	edge32n	%i3,	%o0,	%i2
	sir	0x0A20
	fcmps	%fcc1,	%f26,	%f20
	fnors	%f9,	%f28,	%f2
	movleu	%icc,	%g7,	%i5
	stb	%i0,	[%l7 + 0x49]
	array8	%l4,	%o1,	%i6
	fcmpne16	%f10,	%f10,	%o5
	mulx	%g2,	%g1,	%o3
	edge16ln	%g3,	%l2,	%l6
	movrgez	%i4,	0x3BC,	%o7
	edge32n	%l5,	%l1,	%l0
	lduh	[%l7 + 0x6C],	%o6
	mova	%icc,	%l3,	%g5
	mulx	%i1,	0x1E6A,	%i7
	edge32ln	%o4,	%o2,	%g6
	sir	0x00F7
	sll	%g4,	%o0,	%i3
	fmovs	%f19,	%f26
	fcmpeq32	%f28,	%f22,	%g7
	fmovdneg	%xcc,	%f11,	%f17
	and	%i5,	0x10A0,	%i0
	save %i2, 0x01C2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o1,	%o5,	%g2
	alignaddr	%g1,	%o3,	%i6
	sll	%l2,	0x19,	%l6
	fornot2s	%f30,	%f5,	%f20
	addccc	%g3,	%i4,	%l5
	movn	%xcc,	%o7,	%l0
	mulscc	%o6,	%l1,	%g5
	ldx	[%l7 + 0x68],	%i1
	fnegd	%f8,	%f20
	move	%xcc,	%l3,	%i7
	movleu	%icc,	%o4,	%o2
	fmovrsgez	%g6,	%f18,	%f10
	fand	%f12,	%f4,	%f24
	movge	%xcc,	%g4,	%i3
	xnorcc	%g7,	0x0F69,	%i5
	move	%icc,	%i0,	%o0
	srl	%i2,	0x1E,	%l4
	edge8	%o1,	%g2,	%g1
	movrlez	%o3,	0x363,	%o5
	fmovdvs	%icc,	%f23,	%f15
	movvs	%xcc,	%l2,	%l6
	addcc	%i6,	0x1581,	%g3
	st	%f7,	[%l7 + 0x10]
	ldd	[%l7 + 0x70],	%i4
	addcc	%o7,	0x1CC9,	%l0
	fmul8sux16	%f26,	%f18,	%f30
	movgu	%icc,	%o6,	%l5
	orcc	%g5,	%l1,	%l3
	fmovrde	%i7,	%f26,	%f2
	st	%f4,	[%l7 + 0x24]
	ldx	[%l7 + 0x10],	%o4
	fmovsleu	%icc,	%f13,	%f16
	umul	%i1,	%g6,	%o2
	ldub	[%l7 + 0x66],	%i3
	fors	%f6,	%f12,	%f15
	sll	%g7,	%i5,	%i0
	sdiv	%g4,	0x0B9E,	%i2
	ldub	[%l7 + 0x63],	%l4
	andcc	%o1,	0x0D0E,	%g2
	srlx	%g1,	%o3,	%o5
	ldd	[%l7 + 0x78],	%f30
	fmovdge	%icc,	%f11,	%f15
	fmovrdlez	%o0,	%f4,	%f0
	edge32l	%l6,	%i6,	%g3
	fpmerge	%f6,	%f0,	%f20
	movrne	%i4,	%l2,	%l0
	movcc	%xcc,	%o7,	%l5
	sir	0x12D4
	fmovdpos	%icc,	%f6,	%f9
	smul	%o6,	0x1AE3,	%g5
	subc	%l3,	0x1CEB,	%l1
	array8	%o4,	%i1,	%i7
	fmovsl	%icc,	%f15,	%f17
	edge32n	%o2,	%g6,	%i3
	alignaddrl	%i5,	%g7,	%g4
	andcc	%i2,	0x0BE1,	%l4
	fones	%f30
	movleu	%xcc,	%i0,	%o1
	movge	%icc,	%g2,	%g1
	movvc	%xcc,	%o3,	%o0
	fmovdpos	%xcc,	%f22,	%f26
	ldsb	[%l7 + 0x4F],	%o5
	fmuld8sux16	%f3,	%f23,	%f2
	movrne	%i6,	%l6,	%g3
	sdiv	%l2,	0x08D1,	%i4
	alignaddrl	%l0,	%l5,	%o6
	faligndata	%f24,	%f8,	%f2
	addccc	%o7,	0x16D8,	%l3
	xorcc	%g5,	0x1C1E,	%l1
	sllx	%i1,	%o4,	%o2
	add	%i7,	%i3,	%g6
	movrlez	%g7,	%g4,	%i2
	mulscc	%l4,	%i5,	%o1
	ldd	[%l7 + 0x38],	%g2
	srax	%g1,	0x10,	%o3
	mova	%xcc,	%o0,	%i0
	edge32l	%i6,	%o5,	%l6
	edge32	%g3,	%l2,	%i4
	ldd	[%l7 + 0x48],	%f0
	sdivx	%l5,	0x0BCE,	%l0
	edge16ln	%o7,	%l3,	%g5
	movrne	%l1,	0x1D5,	%i1
	subccc	%o6,	0x117D,	%o2
	movg	%xcc,	%i7,	%i3
	fandnot1	%f16,	%f24,	%f20
	st	%f16,	[%l7 + 0x1C]
	orcc	%g6,	%o4,	%g7
	subccc	%i2,	%l4,	%i5
	fxors	%f28,	%f10,	%f26
	fpack16	%f4,	%f7
	sth	%g4,	[%l7 + 0x5C]
	fandnot2	%f10,	%f2,	%f20
	ldsh	[%l7 + 0x74],	%o1
	and	%g1,	%g2,	%o0
	movvs	%icc,	%o3,	%i0
	edge16	%o5,	%l6,	%g3
	sllx	%i6,	0x01,	%l2
	stw	%l5,	[%l7 + 0x30]
	xnorcc	%i4,	0x1691,	%l0
	edge16ln	%l3,	%o7,	%g5
	sth	%l1,	[%l7 + 0x48]
	movle	%icc,	%i1,	%o2
	addc	%i7,	%o6,	%i3
	sir	0x1BEB
	addc	%g6,	%g7,	%o4
	sdivcc	%l4,	0x071A,	%i5
	edge16	%i2,	%o1,	%g4
	fmovrdne	%g1,	%f4,	%f10
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	umul	%o5,	0x098D,	%i0
	stw	%g3,	[%l7 + 0x54]
	srax	%l6,	%l2,	%l5
	siam	0x5
	sub	%i4,	0x0E16,	%l0
	addccc	%i6,	0x1D0A,	%l3
	ldub	[%l7 + 0x4C],	%o7
	and	%l1,	%i1,	%o2
	fcmped	%fcc3,	%f20,	%f14
	fsrc1s	%f26,	%f3
	movle	%xcc,	%g5,	%o6
	stx	%i3,	[%l7 + 0x40]
	movpos	%icc,	%i7,	%g7
	ldub	[%l7 + 0x48],	%o4
	udivcc	%l4,	0x1EEE,	%i5
	orn	%i2,	%o1,	%g4
	fmovsleu	%icc,	%f16,	%f17
	ldd	[%l7 + 0x38],	%g6
	mulx	%o0,	0x02A5,	%g1
	fandnot2s	%f18,	%f11,	%f23
	movrgz	%o3,	%o5,	%i0
	fmovdvs	%icc,	%f18,	%f8
	lduh	[%l7 + 0x32],	%g2
	sub	%l6,	%g3,	%l2
	movne	%xcc,	%l5,	%l0
	edge16l	%i4,	%i6,	%o7
	lduh	[%l7 + 0x3C],	%l1
	movvc	%icc,	%l3,	%o2
	edge32ln	%i1,	%o6,	%i3
	movleu	%icc,	%g5,	%g7
	array8	%i7,	%o4,	%l4
	udivcc	%i2,	0x06A1,	%o1
	fmovdge	%icc,	%f28,	%f11
	orcc	%i5,	%g6,	%o0
	subcc	%g1,	%g4,	%o5
	sir	0x0C2F
	movneg	%xcc,	%i0,	%o3
	movg	%xcc,	%g2,	%l6
	move	%icc,	%l2,	%g3
	subcc	%l0,	%i4,	%i6
	xnor	%l5,	%o7,	%l3
	sdivx	%o2,	0x0740,	%l1
	save %i1, 0x0351, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o6,	%g5,	%i7
	sth	%o4,	[%l7 + 0x4E]
	fcmped	%fcc2,	%f12,	%f24
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f12
	move	%icc,	%g7,	%l4
	edge16	%i2,	%o1,	%g6
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f22
	array16	%o0,	%g1,	%i5
	smul	%o5,	%g4,	%i0
	fzero	%f28
	xnorcc	%g2,	0x0875,	%o3
	movvc	%icc,	%l2,	%l6
	edge8l	%l0,	%i4,	%g3
	sth	%i6,	[%l7 + 0x18]
	alignaddrl	%l5,	%o7,	%o2
	fabsd	%f6,	%f6
	edge32	%l3,	%l1,	%i1
	fsrc1s	%f17,	%f30
	fmovsge	%xcc,	%f22,	%f7
	movcc	%icc,	%o6,	%i3
	sth	%i7,	[%l7 + 0x4E]
	xor	%g5,	%o4,	%l4
	fmovdvs	%icc,	%f14,	%f8
	ldsh	[%l7 + 0x46],	%g7
	andncc	%i2,	%g6,	%o1
	ldx	[%l7 + 0x10],	%o0
	edge32n	%i5,	%g1,	%o5
	fmovrdlz	%i0,	%f30,	%f2
	orncc	%g4,	0x0C0E,	%g2
	ldub	[%l7 + 0x5C],	%l2
	fpadd16	%f8,	%f20,	%f28
	lduw	[%l7 + 0x28],	%l6
	ldx	[%l7 + 0x78],	%o3
	movneg	%xcc,	%l0,	%i4
	movn	%xcc,	%g3,	%i6
	siam	0x5
	movpos	%xcc,	%l5,	%o2
	fcmpgt16	%f24,	%f16,	%o7
	restore %l1, %l3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i3,	0x078A,	%o6
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	fmovsl	%icc,	%f31,	%f24
	fmovrdlz	%l4,	%f0,	%f0
	move	%xcc,	%o4,	%i2
	edge16ln	%g7,	%o1,	%g6
	edge16n	%i5,	%o0,	%g1
	movrlz	%o5,	0x1D0,	%g4
	alignaddrl	%i0,	%l2,	%l6
	fsrc1s	%f25,	%f15
	fcmple16	%f28,	%f24,	%o3
	movl	%xcc,	%g2,	%i4
	lduw	[%l7 + 0x18],	%l0
	umul	%i6,	%l5,	%g3
	ldd	[%l7 + 0x78],	%o6
	std	%f0,	[%l7 + 0x08]
	sllx	%l1,	%o2,	%i1
	fmovdvs	%icc,	%f28,	%f11
	sllx	%l3,	%i3,	%o6
	lduh	[%l7 + 0x50],	%i7
	ldsh	[%l7 + 0x2A],	%g5
	movn	%icc,	%l4,	%i2
	fmovsne	%xcc,	%f28,	%f27
	subcc	%o4,	0x0B44,	%g7
	subcc	%o1,	%i5,	%g6
	srl	%g1,	0x18,	%o0
	umul	%g4,	%i0,	%l2
	stb	%l6,	[%l7 + 0x14]
	fornot1	%f8,	%f20,	%f24
	fmovdvs	%icc,	%f6,	%f28
	sdivx	%o3,	0x1826,	%g2
	fpsub16s	%f30,	%f29,	%f0
	edge8ln	%o5,	%l0,	%i4
	popc	0x04D4,	%i6
	fpadd16	%f4,	%f20,	%f12
	alignaddr	%l5,	%g3,	%l1
	xorcc	%o2,	%o7,	%i1
	edge8ln	%l3,	%o6,	%i3
	umul	%g5,	%i7,	%i2
	fmovrslez	%o4,	%f13,	%f0
	or	%g7,	0x063F,	%o1
	movg	%xcc,	%i5,	%g6
	fsrc2	%f20,	%f4
	movrgez	%g1,	%l4,	%o0
	sir	0x09E0
	movrgez	%i0,	0x104,	%g4
	edge16l	%l2,	%l6,	%g2
	sllx	%o5,	%l0,	%i4
	edge32ln	%i6,	%l5,	%o3
	ldub	[%l7 + 0x0D],	%l1
	sllx	%o2,	0x07,	%g3
	array8	%i1,	%o7,	%o6
	fmovsneg	%xcc,	%f31,	%f17
	edge32l	%i3,	%g5,	%l3
	sdivx	%i2,	0x0234,	%i7
	fnegs	%f26,	%f22
	ldsh	[%l7 + 0x72],	%g7
	fsrc1	%f10,	%f22
	fnegs	%f14,	%f21
	sub	%o4,	0x1584,	%i5
	movcs	%icc,	%o1,	%g6
	srlx	%l4,	0x1C,	%o0
	edge8	%i0,	%g1,	%g4
	fsrc1s	%f26,	%f7
	xorcc	%l6,	0x10FD,	%g2
	andcc	%o5,	%l2,	%l0
	movcs	%icc,	%i4,	%l5
	fnand	%f28,	%f24,	%f2
	udivx	%i6,	0x0C8E,	%o3
	fandnot2	%f26,	%f26,	%f14
	movn	%xcc,	%l1,	%o2
	movle	%xcc,	%g3,	%i1
	umulcc	%o6,	0x074D,	%i3
	xor	%o7,	0x1546,	%g5
	subccc	%i2,	%i7,	%g7
	sub	%l3,	%o4,	%i5
	fmovsvs	%xcc,	%f31,	%f6
	xorcc	%g6,	%l4,	%o1
	fxnors	%f28,	%f17,	%f21
	xnorcc	%o0,	%g1,	%i0
	subcc	%l6,	0x01A7,	%g4
	movvs	%xcc,	%o5,	%g2
	lduw	[%l7 + 0x40],	%l0
	srlx	%i4,	%l5,	%l2
	ldub	[%l7 + 0x0C],	%o3
	fornot2	%f4,	%f28,	%f0
	edge8n	%l1,	%i6,	%o2
	xorcc	%g3,	%i1,	%o6
	srl	%i3,	0x04,	%g5
	edge32n	%i2,	%i7,	%o7
	fmovsn	%xcc,	%f25,	%f25
	array16	%g7,	%l3,	%i5
	fmovda	%icc,	%f0,	%f4
	movvc	%xcc,	%g6,	%l4
	movvc	%icc,	%o1,	%o0
	ldx	[%l7 + 0x20],	%g1
	orn	%i0,	0x1830,	%l6
	movcs	%xcc,	%o4,	%g4
	fmovs	%f9,	%f24
	fcmpne16	%f28,	%f12,	%o5
	add	%l0,	%i4,	%l5
	addc	%l2,	0x1FF3,	%g2
	movgu	%xcc,	%o3,	%l1
	sir	0x0659
	sll	%i6,	0x08,	%o2
	stx	%g3,	[%l7 + 0x20]
	movgu	%xcc,	%i1,	%i3
	fcmple32	%f10,	%f4,	%o6
	fmul8ulx16	%f12,	%f18,	%f14
	fmovsle	%xcc,	%f19,	%f7
	edge32l	%g5,	%i7,	%o7
	fcmpd	%fcc2,	%f4,	%f16
	fpsub32s	%f16,	%f18,	%f20
	movg	%xcc,	%i2,	%l3
	stb	%i5,	[%l7 + 0x49]
	movrgez	%g6,	0x3AB,	%l4
	movn	%icc,	%o1,	%o0
	movge	%icc,	%g1,	%g7
	movgu	%xcc,	%i0,	%o4
	sra	%l6,	%o5,	%g4
	subc	%l0,	0x019E,	%i4
	fones	%f20
	movleu	%icc,	%l2,	%g2
	movn	%xcc,	%o3,	%l5
	fors	%f20,	%f13,	%f6
	restore %l1, 0x03A3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	0x1997,	%i1
	movl	%icc,	%i3,	%g3
	movpos	%icc,	%o6,	%i7
	stb	%g5,	[%l7 + 0x23]
	lduh	[%l7 + 0x74],	%o7
	subc	%l3,	0x1301,	%i2
	sth	%i5,	[%l7 + 0x1A]
	movleu	%icc,	%l4,	%o1
	xorcc	%o0,	%g1,	%g6
	xnorcc	%g7,	%o4,	%l6
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f20
	srax	%o5,	0x06,	%g4
	movre	%i0,	0x150,	%l0
	fmovrdgez	%l2,	%f30,	%f0
	sllx	%i4,	%g2,	%l5
	movl	%xcc,	%l1,	%i6
	movrne	%o2,	0x1E1,	%i1
	edge32ln	%o3,	%g3,	%i3
	edge16	%i7,	%g5,	%o6
	movpos	%xcc,	%o7,	%i2
	fcmpd	%fcc3,	%f24,	%f16
	array8	%i5,	%l4,	%o1
	movl	%xcc,	%l3,	%g1
	edge32l	%o0,	%g6,	%g7
	fxor	%f16,	%f12,	%f4
	ld	[%l7 + 0x40],	%f12
	edge16n	%l6,	%o5,	%o4
	ldd	[%l7 + 0x58],	%i0
	movl	%xcc,	%l0,	%g4
	for	%f6,	%f16,	%f18
	sdivx	%l2,	0x1299,	%g2
	fmovrsgz	%l5,	%f8,	%f10
	sdiv	%i4,	0x06AD,	%l1
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	edge32ln	%g3,	%i3,	%o3
	array16	%i7,	%o6,	%g5
	sllx	%i2,	%o7,	%i5
	umul	%l4,	0x028C,	%l3
	smulcc	%g1,	0x0134,	%o0
	popc	%o1,	%g7
	alignaddrl	%l6,	%g6,	%o4
	movne	%xcc,	%o5,	%i0
	movre	%g4,	0x0E6,	%l0
	sethi	0x16DA,	%g2
	movleu	%icc,	%l2,	%l5
	srlx	%l1,	0x18,	%i4
	srax	%i1,	0x1F,	%o2
	sth	%i6,	[%l7 + 0x28]
	or	%i3,	%o3,	%g3
	xnorcc	%o6,	0x0580,	%g5
	mulscc	%i2,	0x1421,	%i7
	lduw	[%l7 + 0x70],	%o7
	add	%l4,	%l3,	%g1
	mulx	%o0,	%i5,	%g7
	sub	%o1,	0x1294,	%l6
	fand	%f30,	%f24,	%f26
	fmovd	%f0,	%f24
	srax	%o4,	0x1B,	%o5
	st	%f9,	[%l7 + 0x58]
	sth	%i0,	[%l7 + 0x4A]
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%g4
	edge32	%g6,	%g2,	%l0
	sll	%l5,	0x1D,	%l2
	sub	%l1,	%i4,	%i1
	st	%f0,	[%l7 + 0x20]
	edge8n	%o2,	%i3,	%i6
	std	%f12,	[%l7 + 0x60]
	array8	%o3,	%o6,	%g5
	edge16l	%i2,	%i7,	%g3
	ldsh	[%l7 + 0x0E],	%l4
	fmovrdlez	%o7,	%f28,	%f26
	edge32l	%l3,	%g1,	%i5
	fmovdg	%icc,	%f28,	%f0
	andncc	%g7,	%o0,	%l6
	stw	%o4,	[%l7 + 0x08]
	edge32	%o1,	%o5,	%i0
	fmul8x16al	%f8,	%f22,	%f10
	movgu	%xcc,	%g4,	%g6
	fmovrdgz	%l0,	%f28,	%f0
	movgu	%icc,	%l5,	%g2
	srl	%l1,	0x02,	%l2
	mova	%xcc,	%i1,	%i4
	smulcc	%o2,	%i3,	%i6
	srlx	%o3,	0x16,	%g5
	addccc	%i2,	%o6,	%g3
	fmul8x16au	%f22,	%f19,	%f6
	edge32l	%i7,	%o7,	%l3
	array32	%l4,	%g1,	%i5
	sdiv	%o0,	0x0C5F,	%g7
	subccc	%o4,	%o1,	%l6
	save %i0, 0x0A13, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g4,	0x00,	%l0
	edge32	%g6,	%l5,	%l1
	movleu	%icc,	%g2,	%i1
	ldub	[%l7 + 0x25],	%i4
	fpsub16	%f8,	%f8,	%f20
	edge16	%l2,	%o2,	%i3
	fmovsleu	%xcc,	%f7,	%f17
	sdivx	%i6,	0x0A04,	%o3
	sub	%g5,	%o6,	%i2
	udivcc	%g3,	0x04D9,	%i7
	ldsb	[%l7 + 0x59],	%l3
	fsrc2	%f28,	%f8
	sth	%o7,	[%l7 + 0x74]
	udiv	%g1,	0x0FCF,	%l4
	add	%i5,	%g7,	%o4
	sllx	%o1,	0x14,	%o0
	fnands	%f10,	%f14,	%f28
	fand	%f10,	%f22,	%f28
	sub	%l6,	%i0,	%g4
	edge8l	%o5,	%l0,	%g6
	movne	%icc,	%l1,	%g2
	fnor	%f12,	%f14,	%f12
	ldd	[%l7 + 0x18],	%i0
	array32	%i4,	%l2,	%o2
	movrlez	%i3,	%i6,	%o3
	bshuffle	%f4,	%f10,	%f16
	array32	%l5,	%g5,	%o6
	sub	%g3,	%i7,	%l3
	ldsw	[%l7 + 0x2C],	%o7
	sra	%i2,	0x1C,	%g1
	array8	%l4,	%i5,	%g7
	fmul8sux16	%f14,	%f6,	%f0
	fpsub32	%f2,	%f18,	%f12
	and	%o1,	%o0,	%o4
	edge32n	%l6,	%g4,	%o5
	ldsh	[%l7 + 0x30],	%i0
	xorcc	%g6,	0x107E,	%l1
	sdivx	%l0,	0x0851,	%i1
	edge8n	%g2,	%i4,	%l2
	sll	%i3,	0x0C,	%i6
	orn	%o2,	%l5,	%g5
	edge8l	%o6,	%g3,	%o3
	popc	%l3,	%i7
	and	%i2,	%g1,	%l4
	fnegs	%f0,	%f3
	edge8n	%o7,	%i5,	%o1
	edge8n	%g7,	%o4,	%o0
	std	%f4,	[%l7 + 0x50]
	mulx	%g4,	0x0ECF,	%l6
	ld	[%l7 + 0x0C],	%f0
	edge8	%i0,	%g6,	%o5
	movne	%icc,	%l0,	%l1
	udivx	%g2,	0x0F22,	%i4
	lduh	[%l7 + 0x14],	%i1
	xnor	%i3,	%i6,	%l2
	edge32n	%o2,	%l5,	%g5
	orn	%o6,	0x0B5B,	%o3
	and	%g3,	0x1039,	%l3
	movle	%xcc,	%i7,	%i2
	subccc	%g1,	0x19B5,	%l4
	fmovsa	%icc,	%f3,	%f2
	fcmple16	%f2,	%f14,	%o7
	fmovrse	%o1,	%f8,	%f1
	edge32n	%g7,	%o4,	%o0
	fmul8x16al	%f23,	%f11,	%f14
	fcmps	%fcc3,	%f18,	%f7
	stb	%i5,	[%l7 + 0x15]
	fmovsneg	%icc,	%f6,	%f18
	array16	%g4,	%i0,	%g6
	srax	%l6,	%l0,	%o5
	fpmerge	%f5,	%f22,	%f8
	sethi	0x0D11,	%l1
	edge8ln	%g2,	%i1,	%i3
	lduw	[%l7 + 0x30],	%i6
	umulcc	%l2,	0x1D36,	%i4
	ld	[%l7 + 0x7C],	%f15
	andn	%l5,	%o2,	%g5
	fpsub32s	%f5,	%f23,	%f7
	stw	%o3,	[%l7 + 0x44]
	stx	%g3,	[%l7 + 0x08]
	sethi	0x1ACC,	%l3
	movrgz	%i7,	0x0FD,	%i2
	save %g1, %o6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l4,	%o1,	%g7
	sub	%o0,	0x1723,	%o4
	alignaddrl	%g4,	%i0,	%g6
	ldx	[%l7 + 0x60],	%i5
	fand	%f4,	%f4,	%f12
	sethi	0x1B77,	%l6
	xor	%o5,	0x1CC7,	%l0
	edge16	%l1,	%g2,	%i1
	edge8	%i6,	%i3,	%i4
	edge32n	%l2,	%l5,	%o2
	fcmpgt16	%f12,	%f14,	%g5
	fpmerge	%f10,	%f8,	%f0
	fnor	%f18,	%f20,	%f20
	std	%f0,	[%l7 + 0x10]
	movge	%icc,	%g3,	%o3
	umul	%l3,	%i2,	%g1
	ldd	[%l7 + 0x20],	%f6
	add	%o6,	%o7,	%l4
	movrne	%i7,	0x2EC,	%o1
	srax	%o0,	0x19,	%o4
	fand	%f26,	%f30,	%f18
	sll	%g7,	0x1C,	%i0
	fnot1s	%f2,	%f20
	fornot1	%f4,	%f18,	%f28
	srax	%g4,	%g6,	%l6
	fsrc2	%f30,	%f4
	sethi	0x0CDC,	%i5
	alignaddr	%o5,	%l0,	%l1
	movcs	%xcc,	%i1,	%i6
	ldsh	[%l7 + 0x76],	%i3
	movrlz	%g2,	%i4,	%l5
	edge32n	%o2,	%l2,	%g3
	ld	[%l7 + 0x68],	%f20
	fmovrslz	%o3,	%f28,	%f6
	lduh	[%l7 + 0x1E],	%l3
	fabsd	%f0,	%f10
	sth	%g5,	[%l7 + 0x2C]
	fxnor	%f28,	%f6,	%f28
	movl	%xcc,	%i2,	%o6
	fmovsvc	%xcc,	%f18,	%f31
	move	%xcc,	%o7,	%l4
	fornot2	%f10,	%f24,	%f20
	ldub	[%l7 + 0x52],	%g1
	fmovdle	%xcc,	%f25,	%f21
	sllx	%i7,	%o1,	%o4
	edge16l	%g7,	%i0,	%g4
	movcc	%xcc,	%o0,	%l6
	fmovsl	%icc,	%f15,	%f22
	srl	%i5,	%o5,	%g6
	fmovrslz	%l0,	%f5,	%f23
	restore %i1, %i6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x15EE,	%l1
	mulx	%i4,	%g2,	%o2
	sdivx	%l2,	0x0804,	%l5
	xor	%o3,	0x05D8,	%g3
	ldsb	[%l7 + 0x57],	%g5
	edge32n	%l3,	%o6,	%i2
	movrgez	%o7,	%g1,	%l4
	movpos	%xcc,	%o1,	%i7
	fmul8x16au	%f15,	%f2,	%f18
	xorcc	%g7,	%o4,	%g4
	fpmerge	%f28,	%f26,	%f16
	xorcc	%o0,	%l6,	%i0
	fmovd	%f2,	%f16
	movcs	%xcc,	%i5,	%g6
	subccc	%o5,	0x195F,	%i1
	fzero	%f20
	udivcc	%l0,	0x1386,	%i3
	edge32l	%l1,	%i6,	%g2
	fxors	%f30,	%f12,	%f26
	sll	%o2,	%l2,	%i4
	fnot1s	%f12,	%f8
	umul	%o3,	%g3,	%l5
	addc	%g5,	%o6,	%i2
	movrgez	%l3,	0x196,	%o7
	ldd	[%l7 + 0x28],	%f16
	udivcc	%l4,	0x16BE,	%g1
	movpos	%xcc,	%o1,	%g7
	lduw	[%l7 + 0x64],	%i7
	movneg	%icc,	%g4,	%o0
	edge16n	%o4,	%l6,	%i5
	sll	%i0,	0x17,	%g6
	addcc	%o5,	%i1,	%l0
	movl	%icc,	%i3,	%l1
	movrlz	%g2,	0x2CD,	%i6
	srl	%l2,	%i4,	%o3
	sth	%g3,	[%l7 + 0x52]
	edge8ln	%l5,	%o2,	%o6
	fcmple32	%f2,	%f12,	%g5
	movcs	%icc,	%i2,	%o7
	orncc	%l4,	%l3,	%o1
	movrgz	%g7,	0x3F8,	%i7
	fmovdge	%xcc,	%f9,	%f31
	fmovsg	%xcc,	%f12,	%f10
	udiv	%g4,	0x0EC5,	%o0
	sub	%g1,	%o4,	%i5
	movl	%xcc,	%i0,	%l6
	fandnot2s	%f11,	%f10,	%f8
	sllx	%o5,	%g6,	%l0
	umul	%i1,	0x070B,	%l1
	sth	%i3,	[%l7 + 0x0C]
	mova	%icc,	%g2,	%i6
	ldd	[%l7 + 0x30],	%f12
	edge16ln	%i4,	%l2,	%o3
	fandnot1	%f22,	%f10,	%f22
	movneg	%xcc,	%l5,	%g3
	ldsw	[%l7 + 0x2C],	%o2
	ldsh	[%l7 + 0x16],	%o6
	movneg	%xcc,	%i2,	%o7
	std	%f8,	[%l7 + 0x48]
	orcc	%g5,	0x0D75,	%l4
	sdiv	%o1,	0x16B8,	%g7
	orcc	%l3,	%i7,	%g4
	movne	%icc,	%o0,	%g1
	andcc	%i5,	%o4,	%l6
	ld	[%l7 + 0x38],	%f15
	std	%f20,	[%l7 + 0x68]
	movleu	%icc,	%o5,	%g6
	orncc	%l0,	%i0,	%l1
	andcc	%i1,	%i3,	%g2
	sllx	%i6,	0x19,	%l2
	lduh	[%l7 + 0x4A],	%i4
	movneg	%icc,	%l5,	%g3
	mova	%icc,	%o3,	%o6
	fmovsne	%icc,	%f31,	%f9
	ld	[%l7 + 0x44],	%f12
	nop
	set	0x2F, %l4
	ldub	[%l7 + %l4],	%o2
	movpos	%xcc,	%o7,	%i2
	xorcc	%g5,	%l4,	%o1
	edge32n	%g7,	%l3,	%i7
	sll	%g4,	0x16,	%g1
	sdiv	%i5,	0x15E5,	%o4
	fmovdcs	%icc,	%f1,	%f10
	edge16l	%o0,	%o5,	%g6
	sub	%l0,	%i0,	%l6
	fmovdgu	%icc,	%f10,	%f9
	sra	%l1,	0x0B,	%i1
	popc	%i3,	%i6
	move	%icc,	%g2,	%l2
	movl	%icc,	%i4,	%l5
	edge8ln	%o3,	%g3,	%o6
	edge16	%o2,	%o7,	%i2
	movrlz	%g5,	0x380,	%o1
	fornot2	%f4,	%f30,	%f20
	edge16	%l4,	%l3,	%i7
	fxor	%f10,	%f20,	%f4
	edge32n	%g4,	%g1,	%g7
	sllx	%i5,	0x15,	%o0
	fpackfix	%f8,	%f5
	addc	%o5,	%o4,	%l0
	ldsb	[%l7 + 0x78],	%i0
	srlx	%l6,	%g6,	%l1
	fnand	%f22,	%f8,	%f14
	alignaddrl	%i1,	%i6,	%g2
	sdivx	%l2,	0x1CAB,	%i4
	edge32	%i3,	%o3,	%l5
	edge32n	%o6,	%o2,	%o7
	popc	%i2,	%g3
	movn	%icc,	%g5,	%l4
	srlx	%o1,	%l3,	%i7
	edge8l	%g1,	%g7,	%i5
	fandnot2	%f20,	%f6,	%f8
	fpadd32	%f20,	%f2,	%f24
	umulcc	%g4,	%o5,	%o0
	stx	%o4,	[%l7 + 0x28]
	lduw	[%l7 + 0x60],	%i0
	edge8l	%l6,	%g6,	%l0
	add	%i1,	0x0846,	%i6
	fmovdleu	%icc,	%f11,	%f29
	alignaddr	%g2,	%l2,	%i4
	std	%f10,	[%l7 + 0x20]
	stx	%i3,	[%l7 + 0x20]
	fcmpne16	%f18,	%f8,	%l1
	fmovscs	%xcc,	%f18,	%f28
	umul	%l5,	%o6,	%o3
	mulx	%o2,	0x1816,	%i2
	fmovsl	%icc,	%f20,	%f31
	alignaddrl	%o7,	%g3,	%g5
	edge8ln	%l4,	%o1,	%l3
	subccc	%i7,	0x1BB1,	%g7
	fcmpeq32	%f16,	%f2,	%i5
	std	%f14,	[%l7 + 0x18]
	edge32	%g4,	%o5,	%o0
	nop
	set	0x5C, %l6
	ldsw	[%l7 + %l6],	%o4
	stw	%i0,	[%l7 + 0x5C]
	edge8l	%l6,	%g6,	%l0
	srax	%g1,	0x17,	%i1
	srax	%g2,	%i6,	%i4
	addc	%i3,	%l1,	%l2
	addccc	%o6,	%o3,	%o2
	sethi	0x0197,	%l5
	fmovsne	%xcc,	%f29,	%f7
	addc	%i2,	0x0BEC,	%o7
	mulx	%g5,	0x0EC8,	%l4
	movn	%icc,	%o1,	%g3
	ldsh	[%l7 + 0x5A],	%l3
	xnorcc	%i7,	0x1D40,	%g7
	xorcc	%i5,	%g4,	%o0
	movle	%xcc,	%o5,	%o4
	fmovdcc	%icc,	%f18,	%f6
	save %i0, 0x0D8D, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f12,	%f8
	fmovdneg	%icc,	%f30,	%f30
	udivx	%l0,	0x0E9A,	%g6
	sll	%i1,	0x0F,	%g1
	ldx	[%l7 + 0x70],	%g2
	move	%xcc,	%i4,	%i6
	subcc	%i3,	%l1,	%l2
	lduw	[%l7 + 0x24],	%o6
	smulcc	%o2,	%o3,	%i2
	mulx	%o7,	%g5,	%l4
	andn	%l5,	%g3,	%o1
	srl	%l3,	0x10,	%g7
	srax	%i5,	0x05,	%g4
	addc	%o0,	%o5,	%i7
	orncc	%i0,	0x1D95,	%l6
	addcc	%o4,	%l0,	%i1
	fpadd32s	%f27,	%f31,	%f16
	fpsub16	%f4,	%f18,	%f22
	movre	%g6,	%g2,	%i4
	orcc	%i6,	%g1,	%i3
	subccc	%l2,	%l1,	%o2
	srlx	%o3,	0x1C,	%o6
	std	%f30,	[%l7 + 0x28]
	stx	%i2,	[%l7 + 0x78]
	umulcc	%g5,	%l4,	%l5
	movleu	%icc,	%o7,	%o1
	st	%f10,	[%l7 + 0x08]
	fxors	%f24,	%f8,	%f14
	udivcc	%l3,	0x1105,	%g3
	or	%i5,	0x1BAF,	%g4
	fcmpes	%fcc2,	%f4,	%f5
	edge32n	%o0,	%o5,	%g7
	edge8l	%i7,	%i0,	%l6
	and	%l0,	0x0284,	%o4
	fones	%f6
	udivcc	%i1,	0x061E,	%g2
	stx	%i4,	[%l7 + 0x48]
	stx	%g6,	[%l7 + 0x50]
	edge32	%g1,	%i3,	%l2
	fcmple16	%f6,	%f0,	%l1
	umulcc	%i6,	0x15E0,	%o2
	xnorcc	%o6,	%o3,	%i2
	edge8n	%l4,	%g5,	%o7
	fpsub16	%f18,	%f4,	%f16
	movn	%icc,	%o1,	%l3
	udiv	%l5,	0x0A06,	%i5
	fmovrsgz	%g4,	%f0,	%f29
	umulcc	%o0,	0x0791,	%o5
	mova	%xcc,	%g7,	%g3
	sethi	0x1653,	%i0
	st	%f29,	[%l7 + 0x0C]
	sdivx	%i7,	0x00DD,	%l0
	fnor	%f2,	%f22,	%f30
	udivcc	%o4,	0x14AE,	%l6
	fmovsa	%xcc,	%f29,	%f0
	mova	%xcc,	%i1,	%g2
	edge16n	%g6,	%g1,	%i4
	array32	%l2,	%l1,	%i3
	edge32l	%i6,	%o2,	%o6
	fmuld8ulx16	%f7,	%f30,	%f24
	addcc	%i2,	0x0B22,	%l4
	addccc	%o3,	%o7,	%g5
	movcc	%icc,	%o1,	%l5
	xnorcc	%l3,	%g4,	%o0
	fsrc2s	%f15,	%f13
	movcs	%xcc,	%o5,	%i5
	ldsw	[%l7 + 0x3C],	%g3
	edge32n	%i0,	%i7,	%g7
	ldsb	[%l7 + 0x70],	%l0
	sth	%o4,	[%l7 + 0x4A]
	fandnot1	%f10,	%f18,	%f30
	edge16ln	%l6,	%i1,	%g6
	edge16l	%g1,	%i4,	%l2
	sethi	0x109D,	%g2
	fmovdneg	%icc,	%f3,	%f12
	mova	%icc,	%i3,	%i6
	movneg	%icc,	%o2,	%o6
	movpos	%xcc,	%i2,	%l1
	edge16	%o3,	%o7,	%l4
	fpsub32	%f10,	%f22,	%f30
	ldsh	[%l7 + 0x08],	%o1
	addcc	%g5,	0x12AA,	%l3
	srax	%g4,	0x1B,	%o0
	addccc	%o5,	0x0B2F,	%i5
	fmovsl	%xcc,	%f2,	%f22
	edge16l	%g3,	%l5,	%i7
	movpos	%xcc,	%i0,	%l0
	fsrc1s	%f2,	%f28
	fabsd	%f6,	%f6
	ld	[%l7 + 0x20],	%f9
	subccc	%g7,	0x0D92,	%l6
	movrlez	%i1,	0x3B7,	%g6
	umulcc	%o4,	%i4,	%l2
	edge8l	%g2,	%g1,	%i3
	movleu	%xcc,	%o2,	%o6
	ldsh	[%l7 + 0x38],	%i6
	movneg	%icc,	%l1,	%i2
	fpackfix	%f16,	%f29
	ldd	[%l7 + 0x18],	%o2
	andn	%o7,	%o1,	%l4
	addcc	%l3,	0x17FE,	%g5
	nop
	set	0x56, %g3
	ldsh	[%l7 + %g3],	%g4
	xnor	%o5,	%o0,	%i5
	udivx	%g3,	0x0244,	%i7
	movleu	%icc,	%l5,	%l0
	subc	%i0,	%l6,	%g7
	sub	%g6,	0x145E,	%o4
	fmovrdlez	%i1,	%f18,	%f22
	array8	%i4,	%g2,	%l2
	sll	%g1,	%i3,	%o2
	stx	%i6,	[%l7 + 0x70]
	fandnot2s	%f22,	%f11,	%f1
	nop
	set	0x64, %g5
	stw	%l1,	[%l7 + %g5]
	mova	%icc,	%o6,	%i2
	ldsh	[%l7 + 0x64],	%o3
	udivx	%o1,	0x184C,	%l4
	ldd	[%l7 + 0x28],	%l2
	subc	%g5,	0x07E2,	%o7
	save %g4, 0x1721, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%i5
	std	%f24,	[%l7 + 0x28]
	movle	%icc,	%g3,	%i7
	move	%icc,	%o5,	%l0
	ldsb	[%l7 + 0x45],	%i0
	fpadd32s	%f30,	%f21,	%f15
	or	%l6,	0x039C,	%l5
	fzeros	%f28
	andcc	%g7,	%g6,	%o4
	addcc	%i4,	0x0CA5,	%i1
	st	%f28,	[%l7 + 0x14]
	array16	%l2,	%g1,	%g2
	subccc	%o2,	%i6,	%i3
	fsrc1s	%f29,	%f19
	fpackfix	%f26,	%f29
	edge8n	%l1,	%i2,	%o3
	for	%f16,	%f28,	%f26
	movrne	%o1,	%o6,	%l4
	sdiv	%l3,	0x1656,	%o7
	fzeros	%f24
	array8	%g5,	%o0,	%g4
	movrne	%i5,	%g3,	%o5
	ld	[%l7 + 0x6C],	%f0
	movre	%i7,	%i0,	%l0
	edge32l	%l5,	%g7,	%l6
	movn	%icc,	%o4,	%i4
	udiv	%i1,	0x0DD1,	%g6
	edge32n	%l2,	%g1,	%o2
	fmovrdlez	%i6,	%f22,	%f16
	fmovrsne	%i3,	%f5,	%f21
	sdivcc	%g2,	0x081A,	%i2
	array16	%o3,	%o1,	%l1
	sdiv	%o6,	0x128A,	%l3
	subcc	%l4,	0x0F55,	%g5
	edge8n	%o0,	%g4,	%i5
	edge8n	%g3,	%o5,	%o7
	edge8	%i7,	%i0,	%l0
	edge16	%g7,	%l6,	%o4
	edge32n	%i4,	%l5,	%i1
	umulcc	%l2,	0x1D46,	%g1
	edge8n	%o2,	%g6,	%i3
	movgu	%xcc,	%g2,	%i2
	subccc	%o3,	0x06C7,	%i6
	movcc	%icc,	%o1,	%o6
	sllx	%l1,	%l3,	%l4
	fpadd16	%f16,	%f6,	%f6
	fmuld8ulx16	%f18,	%f1,	%f10
	or	%o0,	%g4,	%g5
	fcmple16	%f12,	%f16,	%g3
	movne	%icc,	%o5,	%i5
	xorcc	%o7,	%i7,	%l0
	umulcc	%g7,	%l6,	%i0
	andncc	%o4,	%i4,	%i1
	alignaddrl	%l2,	%l5,	%o2
	edge16n	%g1,	%g6,	%i3
	subc	%i2,	0x1E11,	%o3
	edge32n	%i6,	%g2,	%o1
	udivcc	%o6,	0x1584,	%l1
	lduw	[%l7 + 0x74],	%l4
	popc	%l3,	%o0
	array32	%g5,	%g3,	%g4
	fmul8ulx16	%f6,	%f28,	%f4
	fabss	%f15,	%f30
	orncc	%i5,	%o7,	%i7
	movle	%xcc,	%o5,	%l0
	sdivcc	%l6,	0x1DCB,	%i0
	sll	%o4,	%i4,	%g7
	alignaddr	%l2,	%i1,	%o2
	movvc	%xcc,	%g1,	%l5
	ldd	[%l7 + 0x68],	%f0
	movge	%xcc,	%g6,	%i3
	fsrc1	%f2,	%f8
	fcmpeq32	%f18,	%f24,	%o3
	xor	%i6,	0x1E86,	%i2
	movle	%icc,	%o1,	%o6
	fmuld8ulx16	%f21,	%f13,	%f8
	st	%f24,	[%l7 + 0x7C]
	fmovda	%icc,	%f6,	%f6
	movge	%xcc,	%g2,	%l4
	movg	%xcc,	%l3,	%l1
	movleu	%icc,	%o0,	%g5
	lduw	[%l7 + 0x78],	%g3
	popc	0x05F4,	%i5
	movvs	%icc,	%g4,	%i7
	ldsb	[%l7 + 0x2E],	%o7
	alignaddrl	%o5,	%l0,	%l6
	alignaddrl	%o4,	%i0,	%i4
	stx	%l2,	[%l7 + 0x78]
	ldsh	[%l7 + 0x7E],	%i1
	ldsb	[%l7 + 0x0D],	%g7
	orcc	%g1,	%l5,	%g6
	edge32n	%i3,	%o2,	%i6
	sub	%i2,	0x1AAB,	%o1
	addccc	%o6,	0x0E25,	%g2
	lduw	[%l7 + 0x08],	%o3
	fmul8ulx16	%f26,	%f10,	%f10
	addc	%l3,	0x0CFD,	%l4
	fcmped	%fcc3,	%f8,	%f20
	movrlz	%l1,	%g5,	%o0
	mova	%icc,	%g3,	%i5
	fornot2s	%f3,	%f16,	%f18
	sub	%g4,	0x0D19,	%o7
	movvs	%xcc,	%i7,	%l0
	movgu	%icc,	%o5,	%l6
	fmovdcc	%icc,	%f6,	%f10
	edge16n	%o4,	%i0,	%l2
	mulx	%i1,	%g7,	%i4
	sth	%l5,	[%l7 + 0x36]
	fmovsa	%xcc,	%f9,	%f10
	movrgz	%g1,	0x01A,	%g6
	movleu	%xcc,	%o2,	%i3
	ldd	[%l7 + 0x18],	%i6
	fpackfix	%f10,	%f30
	addcc	%o1,	0x03E9,	%i2
	orcc	%g2,	0x1DAD,	%o6
	orncc	%l3,	0x0456,	%l4
	movrlez	%o3,	0x352,	%g5
	umul	%o0,	%l1,	%g3
	fnot2	%f4,	%f0
	st	%f4,	[%l7 + 0x44]
	edge8ln	%i5,	%g4,	%o7
	array8	%i7,	%o5,	%l6
	popc	0x0632,	%o4
	fcmpd	%fcc0,	%f24,	%f14
	srl	%l0,	%l2,	%i1
	movrne	%i0,	%g7,	%i4
	smulcc	%l5,	%g6,	%o2
	sub	%i3,	%g1,	%i6
	xorcc	%i2,	0x08B5,	%o1
	xorcc	%o6,	%l3,	%g2
	sdiv	%l4,	0x1B95,	%g5
	fmovsge	%xcc,	%f18,	%f3
	edge16l	%o3,	%o0,	%g3
	array32	%i5,	%l1,	%g4
	addccc	%i7,	0x0BB7,	%o5
	edge32n	%l6,	%o7,	%o4
	fnor	%f24,	%f6,	%f18
	addc	%l2,	0x184B,	%l0
	sllx	%i1,	%i0,	%g7
	stx	%l5,	[%l7 + 0x20]
	st	%f2,	[%l7 + 0x2C]
	mulscc	%g6,	0x0707,	%i4
	subc	%o2,	%i3,	%g1
	fmovdleu	%xcc,	%f13,	%f12
	fsrc2s	%f7,	%f20
	array32	%i6,	%o1,	%i2
	fcmped	%fcc0,	%f24,	%f26
	ldsb	[%l7 + 0x58],	%o6
	fpadd32	%f30,	%f18,	%f8
	umulcc	%g2,	0x10A6,	%l3
	smulcc	%l4,	0x0837,	%o3
	subcc	%o0,	%g5,	%i5
	fabsd	%f22,	%f30
	movle	%icc,	%g3,	%l1
	save %g4, 0x06AD, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f20,	%f3,	%f4
	ldsb	[%l7 + 0x21],	%l6
	fmovsvc	%icc,	%f10,	%f3
	stb	%o5,	[%l7 + 0x43]
	array16	%o7,	%o4,	%l0
	srl	%i1,	0x1E,	%i0
	fmovdg	%xcc,	%f25,	%f2
	xnor	%g7,	%l2,	%g6
	udivx	%l5,	0x11EE,	%i4
	xor	%o2,	0x0AC6,	%g1
	edge8ln	%i3,	%o1,	%i6
	lduw	[%l7 + 0x24],	%o6
	movcs	%icc,	%g2,	%l3
	movn	%icc,	%l4,	%o3
	fcmpne16	%f26,	%f16,	%o0
	array16	%g5,	%i5,	%i2
	movgu	%icc,	%g3,	%l1
	movne	%icc,	%i7,	%g4
	array8	%o5,	%o7,	%l6
	addc	%o4,	0x16AA,	%i1
	movl	%xcc,	%l0,	%g7
	movn	%icc,	%l2,	%i0
	smulcc	%l5,	%g6,	%i4
	sth	%g1,	[%l7 + 0x70]
	nop
	set	0x28, %o7
	lduw	[%l7 + %o7],	%o2
	movn	%icc,	%o1,	%i3
	mova	%xcc,	%o6,	%g2
	std	%f16,	[%l7 + 0x18]
	movcc	%xcc,	%i6,	%l3
	fmovrde	%o3,	%f0,	%f22
	ldub	[%l7 + 0x29],	%l4
	fmovse	%xcc,	%f14,	%f9
	fmovdleu	%icc,	%f19,	%f13
	and	%o0,	0x03E2,	%i5
	edge32	%i2,	%g3,	%l1
	edge8	%i7,	%g4,	%g5
	std	%f18,	[%l7 + 0x38]
	movrgz	%o5,	%o7,	%l6
	siam	0x6
	movne	%icc,	%i1,	%o4
	lduw	[%l7 + 0x38],	%l0
	movleu	%xcc,	%l2,	%g7
	save %l5, 0x0603, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i0,	%g1
	orcc	%i4,	0x0F4F,	%o2
	edge16	%i3,	%o1,	%o6
	movne	%icc,	%g2,	%l3
	addccc	%o3,	0x150E,	%l4
	udiv	%i6,	0x0479,	%i5
	movg	%xcc,	%i2,	%o0
	fnors	%f5,	%f22,	%f6
	smul	%g3,	0x17D6,	%l1
	subccc	%i7,	%g4,	%g5
	fsrc2	%f18,	%f2
	fmovdleu	%xcc,	%f21,	%f12
	fmovspos	%icc,	%f7,	%f4
	mulscc	%o7,	%o5,	%i1
	stb	%o4,	[%l7 + 0x4D]
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	movre	%g7,	%l5,	%l0
	xnor	%i0,	0x1034,	%g1
	orn	%i4,	%o2,	%g6
	and	%o1,	0x17E5,	%i3
	movg	%xcc,	%o6,	%l3
	movneg	%xcc,	%o3,	%g2
	fmovdvc	%icc,	%f12,	%f24
	fcmple32	%f0,	%f4,	%i6
	edge16	%i5,	%l4,	%i2
	fmovdge	%xcc,	%f5,	%f31
	fmuld8sux16	%f3,	%f31,	%f12
	fxor	%f0,	%f20,	%f28
	movpos	%xcc,	%o0,	%g3
	edge8	%l1,	%i7,	%g5
	edge8ln	%o7,	%o5,	%g4
	std	%f10,	[%l7 + 0x08]
	sllx	%o4,	%l6,	%i1
	movpos	%icc,	%l2,	%g7
	sethi	0x0FAC,	%l0
	movn	%icc,	%i0,	%l5
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%g1
	move	%icc,	%o2,	%i4
	movneg	%xcc,	%o1,	%g6
	movgu	%icc,	%o6,	%l3
	movre	%o3,	0x2EA,	%i3
	move	%icc,	%g2,	%i6
	edge8n	%l4,	%i2,	%i5
	fors	%f31,	%f24,	%f21
	siam	0x7
	stx	%g3,	[%l7 + 0x70]
	udivcc	%o0,	0x06CF,	%i7
	fcmpeq32	%f26,	%f28,	%l1
	addcc	%g5,	%o7,	%o5
	sdivcc	%g4,	0x0681,	%l6
	smulcc	%i1,	%l2,	%o4
	sll	%l0,	%i0,	%l5
	orcc	%g1,	%g7,	%i4
	movcc	%xcc,	%o1,	%g6
	subc	%o6,	%o2,	%o3
	fnot2	%f24,	%f30
	fmuld8ulx16	%f8,	%f10,	%f24
	udiv	%i3,	0x1F1A,	%l3
	array16	%i6,	%g2,	%l4
	fmovdcs	%icc,	%f18,	%f17
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%i4
	umulcc	%i2,	0x16AC,	%g3
	srlx	%i7,	0x17,	%o0
	fands	%f6,	%f13,	%f18
	fmovde	%icc,	%f26,	%f23
	edge16ln	%l1,	%g5,	%o5
	fmovsn	%xcc,	%f7,	%f18
	movgu	%icc,	%o7,	%l6
	ld	[%l7 + 0x74],	%f30
	stx	%g4,	[%l7 + 0x08]
	xnorcc	%l2,	0x0FA9,	%i1
	fmovrsgez	%l0,	%f4,	%f19
	srl	%i0,	%o4,	%g1
	mulx	%g7,	0x125C,	%i4
	andncc	%l5,	%g6,	%o6
	subcc	%o2,	%o3,	%i3
	movneg	%icc,	%o1,	%i6
	edge16l	%l3,	%l4,	%i5
	edge16n	%i2,	%g3,	%i7
	ldx	[%l7 + 0x28],	%o0
	mulscc	%g2,	%g5,	%l1
	sra	%o7,	%l6,	%g4
	sdiv	%o5,	0x0ED0,	%l2
	fpack32	%f28,	%f14,	%f22
	umul	%i1,	%i0,	%o4
	xnor	%g1,	%g7,	%l0
	fone	%f16
	sllx	%i4,	%g6,	%l5
	lduh	[%l7 + 0x14],	%o6
	udivcc	%o3,	0x145F,	%o2
	fornot1	%f24,	%f20,	%f26
	move	%xcc,	%o1,	%i6
	fmovsa	%xcc,	%f14,	%f19
	andcc	%i3,	0x046A,	%l4
	subc	%l3,	0x0798,	%i5
	st	%f11,	[%l7 + 0x70]
	xnorcc	%i2,	%i7,	%g3
	fors	%f28,	%f15,	%f9
	smul	%g2,	%o0,	%l1
	smulcc	%g5,	0x0EFD,	%o7
	fmovrdgz	%l6,	%f16,	%f28
	popc	%o5,	%l2
	xnorcc	%i1,	%g4,	%i0
	ldd	[%l7 + 0x58],	%f6
	sir	0x1FE9
	xor	%g1,	0x1E3E,	%o4
	sdiv	%l0,	0x140B,	%g7
	fmovdpos	%icc,	%f31,	%f9
	array32	%i4,	%g6,	%l5
	edge32n	%o6,	%o3,	%o2
	array8	%o1,	%i3,	%l4
	sllx	%i6,	0x1D,	%i5
	addc	%i2,	%i7,	%g3
	movvs	%icc,	%l3,	%g2
	stx	%l1,	[%l7 + 0x38]
	edge32	%g5,	%o0,	%l6
	umul	%o5,	%o7,	%i1
	fmovrde	%g4,	%f2,	%f20
	std	%f28,	[%l7 + 0x10]
	edge16n	%i0,	%l2,	%o4
	save %g1, 0x1992, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x14],	%g7
	restore %g6, 0x1C3F, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f24,	%f11
	fones	%f13
	movvs	%icc,	%i4,	%o3
	ld	[%l7 + 0x40],	%f20
	mulx	%o2,	0x1C9B,	%o1
	fpadd32	%f0,	%f28,	%f4
	xor	%i3,	0x0120,	%o6
	sra	%i6,	%i5,	%l4
	sdivcc	%i7,	0x0557,	%g3
	fmuld8ulx16	%f25,	%f4,	%f18
	array16	%i2,	%l3,	%l1
	andncc	%g5,	%g2,	%o0
	udivx	%o5,	0x1D61,	%o7
	std	%f16,	[%l7 + 0x38]
	movvc	%xcc,	%i1,	%g4
	movneg	%xcc,	%l6,	%l2
	ldsb	[%l7 + 0x52],	%i0
	fpadd16	%f24,	%f30,	%f30
	smul	%o4,	%g1,	%g7
	std	%f6,	[%l7 + 0x70]
	siam	0x3
	fmovda	%xcc,	%f11,	%f17
	ldd	[%l7 + 0x50],	%l0
	srl	%l5,	%i4,	%o3
	mova	%icc,	%g6,	%o1
	srlx	%i3,	%o6,	%i6
	orcc	%i5,	%l4,	%o2
	lduh	[%l7 + 0x58],	%i7
	alignaddr	%i2,	%l3,	%l1
	fmovdvc	%xcc,	%f29,	%f11
	save %g3, 0x1EAF, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o0,	0x1158,	%g5
	umul	%o5,	%o7,	%i1
	udiv	%g4,	0x0929,	%l2
	popc	%i0,	%o4
	sdivx	%g1,	0x0094,	%g7
	movcc	%xcc,	%l0,	%l6
	edge32ln	%i4,	%l5,	%g6
	sdivcc	%o1,	0x01CF,	%o3
	lduh	[%l7 + 0x32],	%o6
	xnorcc	%i6,	%i5,	%l4
	movneg	%xcc,	%i3,	%i7
	fmovrslez	%o2,	%f25,	%f2
	ldd	[%l7 + 0x18],	%f30
	xorcc	%i2,	0x0779,	%l3
	and	%l1,	0x0BD6,	%g2
	udivcc	%g3,	0x037B,	%o0
	move	%icc,	%o5,	%o7
	andncc	%i1,	%g4,	%l2
	fmovrsne	%g5,	%f24,	%f2
	sub	%i0,	%g1,	%o4
	fmovdleu	%icc,	%f23,	%f21
	lduh	[%l7 + 0x44],	%l0
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	edge8	%l5,	%g6,	%o1
	sdiv	%o3,	0x0011,	%i4
	fmovdgu	%xcc,	%f11,	%f24
	fpsub32s	%f5,	%f4,	%f4
	st	%f29,	[%l7 + 0x74]
	andncc	%o6,	%i5,	%i6
	xnor	%i3,	0x137F,	%i7
	srlx	%l4,	0x14,	%i2
	fpsub32s	%f11,	%f20,	%f20
	movpos	%xcc,	%o2,	%l3
	subc	%l1,	0x1776,	%g2
	edge8n	%g3,	%o0,	%o7
	fmuld8ulx16	%f4,	%f25,	%f26
	or	%i1,	%g4,	%l2
	pdist	%f18,	%f18,	%f14
	movrgz	%o5,	%g5,	%g1
	fcmped	%fcc2,	%f28,	%f2
	movvs	%xcc,	%i0,	%o4
	sethi	0x0CFA,	%l0
	movgu	%xcc,	%l6,	%g7
	srax	%l5,	0x0F,	%o1
	edge16n	%o3,	%g6,	%i4
	restore %i5, 0x1242, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x2B],	%i6
	ld	[%l7 + 0x40],	%f13
	alignaddr	%i7,	%l4,	%i2
	andn	%o2,	%i3,	%l3
	movpos	%xcc,	%g2,	%g3
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	lduh	[%l7 + 0x7A],	%i1
	umulcc	%l2,	0x0499,	%o5
	nop
	set	0x50, %i2
	sth	%g4,	[%l7 + %i2]
	array16	%g1,	%g5,	%i0
	stw	%l0,	[%l7 + 0x28]
	movrlz	%l6,	%g7,	%o4
	fpadd32s	%f24,	%f6,	%f11
	sdiv	%l5,	0x1E60,	%o3
	umulcc	%o1,	0x05F3,	%g6
	fnegd	%f22,	%f30
	movleu	%xcc,	%i4,	%o6
	smulcc	%i6,	0x18B1,	%i7
	smulcc	%i5,	0x0B73,	%i2
	subc	%o2,	%l4,	%l3
	move	%icc,	%g2,	%g3
	fnand	%f2,	%f28,	%f10
	alignaddr	%o0,	%o7,	%i3
	srax	%i1,	0x0B,	%l2
	fabss	%f15,	%f25
	fone	%f10
	sir	0x18F7
	fsrc2s	%f11,	%f13
	orncc	%o5,	0x1EBF,	%l1
	edge8ln	%g4,	%g1,	%g5
	edge8	%i0,	%l6,	%g7
	movl	%icc,	%o4,	%l0
	ldx	[%l7 + 0x38],	%o3
	srl	%o1,	%l5,	%i4
	ldsb	[%l7 + 0x20],	%o6
	fmovrde	%i6,	%f12,	%f6
	fmovsneg	%xcc,	%f7,	%f28
	smul	%i7,	0x1E08,	%i5
	udivcc	%i2,	0x126C,	%g6
	movcc	%xcc,	%l4,	%o2
	stx	%g2,	[%l7 + 0x58]
	movrgz	%l3,	%o0,	%g3
	sllx	%i3,	%o7,	%i1
	fsrc2	%f12,	%f6
	edge32n	%o5,	%l2,	%g4
	ldsw	[%l7 + 0x34],	%g1
	fmovdcs	%icc,	%f18,	%f6
	fmovdcc	%xcc,	%f11,	%f1
	movre	%l1,	%i0,	%g5
	fnands	%f14,	%f29,	%f7
	fmovdg	%icc,	%f23,	%f5
	fmovrdgz	%g7,	%f28,	%f10
	addcc	%l6,	%o4,	%l0
	xorcc	%o1,	%o3,	%i4
	fmovsge	%xcc,	%f4,	%f1
	siam	0x3
	fcmps	%fcc1,	%f22,	%f11
	movn	%icc,	%o6,	%i6
	fxnors	%f24,	%f17,	%f23
	fmovsleu	%xcc,	%f17,	%f18
	andcc	%i7,	0x174A,	%i5
	move	%xcc,	%i2,	%g6
	umulcc	%l5,	%l4,	%o2
	ldub	[%l7 + 0x48],	%l3
	sethi	0x0666,	%g2
	ldsh	[%l7 + 0x72],	%o0
	edge8	%g3,	%o7,	%i1
	movleu	%icc,	%i3,	%o5
	edge32n	%l2,	%g1,	%g4
	smulcc	%l1,	0x170E,	%i0
	subccc	%g7,	%g5,	%l6
	sra	%o4,	%l0,	%o1
	edge8n	%i4,	%o3,	%o6
	movg	%icc,	%i7,	%i6
	add	%i5,	%g6,	%i2
	movle	%icc,	%l4,	%o2
	edge8ln	%l3,	%g2,	%l5
	smulcc	%o0,	0x0E8E,	%g3
	srlx	%o7,	%i1,	%o5
	movvs	%xcc,	%i3,	%g1
	movrne	%g4,	%l1,	%l2
	fpsub32	%f28,	%f26,	%f2
	fmovscc	%icc,	%f13,	%f14
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%i0
	ldub	[%l7 + 0x14],	%g7
	edge32	%g5,	%o4,	%l6
	st	%f11,	[%l7 + 0x48]
	fands	%f17,	%f28,	%f21
	edge16ln	%o1,	%l0,	%o3
	movvc	%icc,	%i4,	%i7
	orcc	%o6,	%i6,	%g6
	edge8ln	%i2,	%i5,	%o2
	addccc	%l4,	0x1FE7,	%g2
	ldd	[%l7 + 0x70],	%f26
	edge8ln	%l5,	%o0,	%l3
	sllx	%o7,	0x1A,	%g3
	fnands	%f30,	%f17,	%f14
	fcmpeq32	%f30,	%f22,	%i1
	sll	%o5,	%g1,	%i3
	or	%g4,	0x1DB9,	%l1
	lduw	[%l7 + 0x50],	%i0
	umulcc	%g7,	0x1374,	%l2
	sdivcc	%o4,	0x143F,	%l6
	andn	%g5,	0x141D,	%o1
	ldsw	[%l7 + 0x48],	%o3
	movneg	%icc,	%l0,	%i4
	orncc	%o6,	0x129A,	%i6
	fmovrdlz	%i7,	%f24,	%f10
	fpadd16s	%f30,	%f30,	%f19
	xnorcc	%i2,	0x0430,	%i5
	movn	%xcc,	%o2,	%l4
	st	%f14,	[%l7 + 0x24]
	srlx	%g6,	%g2,	%l5
	popc	0x0717,	%l3
	edge8ln	%o0,	%o7,	%i1
	fmovsgu	%icc,	%f8,	%f2
	fmovrdlz	%o5,	%f4,	%f10
	sub	%g1,	%g3,	%i3
	fand	%f28,	%f22,	%f22
	sdiv	%g4,	0x0A77,	%l1
	ldsh	[%l7 + 0x14],	%g7
	add	%i0,	%l2,	%l6
	fands	%f6,	%f23,	%f13
	edge16ln	%o4,	%g5,	%o3
	alignaddr	%o1,	%l0,	%i4
	subccc	%i6,	0x08E5,	%o6
	movl	%xcc,	%i7,	%i5
	andcc	%o2,	%i2,	%l4
	mulscc	%g6,	0x0215,	%g2
	ldsh	[%l7 + 0x3E],	%l3
	subccc	%l5,	%o7,	%o0
	edge8l	%i1,	%o5,	%g1
	fmuld8ulx16	%f4,	%f12,	%f20
	fmovdge	%icc,	%f11,	%f4
	smul	%i3,	0x0A16,	%g4
	save %g3, 0x0CE3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i0,	%l2
	addcc	%g7,	0x03CA,	%l6
	fmovscc	%xcc,	%f3,	%f14
	alignaddrl	%o4,	%g5,	%o3
	fnot1	%f22,	%f4
	fmovrdlz	%o1,	%f26,	%f2
	fmovdge	%icc,	%f1,	%f12
	fpsub16s	%f27,	%f13,	%f29
	fmovdcs	%xcc,	%f18,	%f7
	st	%f21,	[%l7 + 0x20]
	orcc	%i4,	%l0,	%i6
	ld	[%l7 + 0x24],	%f0
	fands	%f22,	%f7,	%f30
	fmovrdlz	%o6,	%f24,	%f24
	fmovda	%xcc,	%f27,	%f30
	andn	%i5,	0x1438,	%o2
	edge16	%i7,	%l4,	%g6
	restore %g2, 0x1F5D, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f12,	%f6,	%f8
	lduh	[%l7 + 0x28],	%l5
	addccc	%i2,	%o0,	%o7
	movcs	%icc,	%i1,	%o5
	ldub	[%l7 + 0x69],	%g1
	fandnot2s	%f31,	%f31,	%f18
	fpsub16	%f18,	%f12,	%f0
	ldx	[%l7 + 0x20],	%i3
	edge16	%g4,	%l1,	%g3
	stb	%i0,	[%l7 + 0x08]
	edge8ln	%g7,	%l6,	%l2
	movrgz	%o4,	%o3,	%g5
	fornot2s	%f6,	%f23,	%f4
	fsrc2	%f16,	%f2
	sub	%i4,	%l0,	%i6
	fmovda	%xcc,	%f3,	%f11
	fzeros	%f9
	addccc	%o1,	%o6,	%i5
	nop
	set	0x60, %i7
	ldub	[%l7 + %i7],	%o2
	fmovdcs	%xcc,	%f31,	%f7
	mova	%xcc,	%i7,	%g6
	fmovsgu	%xcc,	%f7,	%f13
	alignaddrl	%g2,	%l4,	%l3
	ldsb	[%l7 + 0x4F],	%l5
	array16	%o0,	%o7,	%i1
	fnand	%f22,	%f18,	%f16
	fmovdn	%xcc,	%f3,	%f10
	fornot2s	%f5,	%f16,	%f22
	ldsw	[%l7 + 0x70],	%i2
	fmovrsgz	%o5,	%f14,	%f20
	smul	%g1,	0x1389,	%i3
	edge8n	%g4,	%l1,	%g3
	movrgez	%g7,	%i0,	%l6
	array16	%l2,	%o4,	%o3
	fmovse	%xcc,	%f6,	%f10
	sdiv	%g5,	0x00DD,	%l0
	xor	%i4,	%i6,	%o1
	fornot2	%f4,	%f22,	%f28
	pdist	%f18,	%f10,	%f4
	mova	%xcc,	%o6,	%o2
	nop
	set	0x3C, %g6
	lduh	[%l7 + %g6],	%i5
	addc	%i7,	%g2,	%l4
	sllx	%g6,	%l3,	%o0
	array32	%o7,	%l5,	%i2
	orcc	%o5,	%g1,	%i3
	ldub	[%l7 + 0x11],	%i1
	edge32n	%g4,	%l1,	%g7
	movge	%xcc,	%i0,	%g3
	add	%l6,	%l2,	%o4
	subc	%o3,	0x1760,	%g5
	movle	%icc,	%i4,	%i6
	fmovd	%f30,	%f20
	srax	%o1,	%o6,	%o2
	sdiv	%i5,	0x1027,	%l0
	movrgez	%g2,	%l4,	%i7
	movre	%l3,	0x18D,	%g6
	lduh	[%l7 + 0x2A],	%o0
	or	%l5,	%o7,	%o5
	smul	%g1,	0x0165,	%i2
	edge8n	%i1,	%i3,	%g4
	sth	%g7,	[%l7 + 0x66]
	array8	%i0,	%g3,	%l6
	move	%xcc,	%l1,	%o4
	addccc	%o3,	0x1F69,	%l2
	lduh	[%l7 + 0x74],	%i4
	srax	%g5,	%o1,	%i6
	add	%o6,	0x0364,	%i5
	array32	%o2,	%g2,	%l0
	fandnot1s	%f25,	%f9,	%f13
	bshuffle	%f2,	%f16,	%f12
	movrgz	%i7,	%l3,	%g6
	movpos	%xcc,	%o0,	%l5
	movle	%xcc,	%l4,	%o7
	lduh	[%l7 + 0x1E],	%g1
	movrgez	%i2,	%o5,	%i1
	smul	%g4,	0x0FA6,	%g7
	xorcc	%i3,	%g3,	%i0
	subccc	%l1,	0x0989,	%l6
	std	%f6,	[%l7 + 0x68]
	srl	%o3,	0x1E,	%o4
	andn	%i4,	%l2,	%g5
	movrgz	%i6,	%o1,	%i5
	sllx	%o6,	%g2,	%o2
	orn	%l0,	%l3,	%i7
	ldd	[%l7 + 0x28],	%f16
	fnot1s	%f1,	%f7
	movpos	%icc,	%g6,	%o0
	udivx	%l5,	0x01B3,	%l4
	subc	%o7,	%g1,	%o5
	edge8ln	%i2,	%i1,	%g7
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%g4
	movcs	%xcc,	%g3,	%i0
	andcc	%i3,	0x0BF0,	%l6
	addc	%l1,	0x1C36,	%o4
	edge16l	%o3,	%i4,	%g5
	edge32	%i6,	%l2,	%o1
	xor	%i5,	0x0E98,	%o6
	smul	%o2,	0x11E1,	%g2
	save %l3, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o0,	0x1A3D,	%i7
	orn	%l5,	%l4,	%g1
	fmovsvs	%icc,	%f11,	%f3
	movge	%icc,	%o7,	%i2
	orncc	%o5,	0x0606,	%i1
	popc	0x0637,	%g7
	edge8n	%g3,	%g4,	%i3
	fmovscs	%xcc,	%f17,	%f8
	movrlez	%i0,	%l6,	%o4
	sdivcc	%o3,	0x07BB,	%i4
	fmovdvc	%icc,	%f18,	%f22
	fmovrdlz	%l1,	%f2,	%f18
	sdiv	%i6,	0x1BFC,	%g5
	edge8l	%o1,	%i5,	%o6
	fmovrdlz	%l2,	%f26,	%f28
	udiv	%o2,	0x0788,	%g2
	ldd	[%l7 + 0x18],	%f18
	movre	%l0,	%l3,	%o0
	addcc	%i7,	0x052D,	%l5
	movn	%icc,	%g6,	%l4
	sethi	0x0274,	%o7
	edge8l	%i2,	%g1,	%i1
	edge32	%g7,	%o5,	%g4
	fmovdl	%xcc,	%f23,	%f24
	ldd	[%l7 + 0x20],	%g2
	edge32	%i0,	%i3,	%l6
	xor	%o4,	0x1363,	%o3
	sub	%l1,	0x051A,	%i4
	fmul8ulx16	%f12,	%f0,	%f2
	fmovrde	%g5,	%f6,	%f2
	lduw	[%l7 + 0x34],	%i6
	movg	%icc,	%i5,	%o1
	fmovsl	%xcc,	%f29,	%f29
	movge	%xcc,	%o6,	%o2
	mulx	%l2,	%l0,	%g2
	edge16ln	%l3,	%i7,	%o0
	movrne	%g6,	%l4,	%l5
	movre	%i2,	0x34B,	%o7
	udivx	%i1,	0x0F11,	%g1
	sdiv	%o5,	0x0D03,	%g7
	popc	%g3,	%g4
	xnor	%i3,	%i0,	%o4
	movgu	%icc,	%l6,	%l1
	fmovsle	%xcc,	%f27,	%f5
	srlx	%i4,	%g5,	%o3
	fnand	%f22,	%f22,	%f22
	fpadd16s	%f2,	%f25,	%f3
	std	%f0,	[%l7 + 0x50]
	fmovd	%f10,	%f20
	fandnot1	%f20,	%f28,	%f0
	stw	%i5,	[%l7 + 0x0C]
	fmovsneg	%xcc,	%f6,	%f23
	ldub	[%l7 + 0x3E],	%o1
	movrlz	%o6,	%i6,	%l2
	xnor	%o2,	%g2,	%l3
	movcs	%icc,	%l0,	%i7
	mova	%xcc,	%g6,	%o0
	subc	%l4,	%i2,	%l5
	edge8n	%i1,	%o7,	%g1
	edge32ln	%o5,	%g3,	%g4
	alignaddrl	%i3,	%g7,	%o4
	movneg	%xcc,	%l6,	%i0
	movgu	%xcc,	%l1,	%i4
	movvc	%icc,	%o3,	%i5
	fmul8sux16	%f2,	%f22,	%f10
	addccc	%o1,	%g5,	%o6
	ldd	[%l7 + 0x50],	%l2
	movl	%icc,	%i6,	%o2
	fmovsgu	%xcc,	%f16,	%f7
	faligndata	%f28,	%f14,	%f20
	fmovsneg	%xcc,	%f22,	%f6
	ldd	[%l7 + 0x50],	%l2
	sllx	%l0,	%i7,	%g2
	fmovdvc	%xcc,	%f23,	%f14
	fmul8x16au	%f5,	%f15,	%f12
	edge8	%g6,	%o0,	%l4
	srl	%l5,	%i1,	%i2
	sllx	%o7,	0x04,	%g1
	andn	%o5,	0x00C3,	%g3
	edge16l	%i3,	%g7,	%g4
	edge16ln	%l6,	%i0,	%l1
	edge16n	%o4,	%i4,	%o3
	xnor	%i5,	0x1F20,	%o1
	stx	%o6,	[%l7 + 0x10]
	andn	%g5,	0x0646,	%i6
	siam	0x0
	srl	%o2,	%l2,	%l3
	orn	%l0,	%g2,	%i7
	andn	%o0,	0x0C2C,	%l4
	mova	%icc,	%g6,	%i1
	array16	%i2,	%l5,	%g1
	srl	%o7,	%g3,	%i3
	save %g7, 0x076C, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f8,	%f30,	%f8
	udivcc	%g4,	0x071C,	%i0
	edge8ln	%l6,	%l1,	%o4
	orcc	%o3,	%i4,	%i5
	ldsw	[%l7 + 0x58],	%o1
	movle	%icc,	%o6,	%i6
	alignaddr	%g5,	%o2,	%l2
	movleu	%icc,	%l0,	%l3
	array32	%i7,	%g2,	%l4
	sethi	0x02B5,	%g6
	movge	%icc,	%o0,	%i2
	movgu	%xcc,	%l5,	%g1
	array16	%o7,	%g3,	%i1
	fmovsleu	%xcc,	%f9,	%f14
	fmovdcs	%icc,	%f16,	%f2
	fmovsneg	%icc,	%f31,	%f29
	smulcc	%i3,	0x0190,	%g7
	movgu	%icc,	%g4,	%o5
	sub	%l6,	0x1E9D,	%i0
	fmuld8ulx16	%f19,	%f11,	%f24
	movl	%icc,	%l1,	%o4
	edge16	%i4,	%o3,	%i5
	ldsw	[%l7 + 0x78],	%o1
	edge8	%o6,	%i6,	%o2
	mulscc	%g5,	%l2,	%l3
	edge16ln	%i7,	%l0,	%g2
	fmovse	%icc,	%f0,	%f17
	addc	%g6,	%l4,	%i2
	movl	%icc,	%l5,	%o0
	sdivx	%o7,	0x1FC9,	%g1
	movgu	%icc,	%i1,	%g3
	ldsw	[%l7 + 0x50],	%g7
	udivcc	%i3,	0x16B7,	%g4
	array32	%l6,	%o5,	%i0
	movleu	%icc,	%l1,	%i4
	std	%f14,	[%l7 + 0x38]
	add	%o3,	%i5,	%o4
	std	%f12,	[%l7 + 0x70]
	sdivcc	%o1,	0x0BC3,	%i6
	addc	%o2,	%g5,	%l2
	movgu	%xcc,	%l3,	%o6
	orcc	%l0,	0x1789,	%g2
	movrgz	%i7,	0x1C6,	%g6
	srax	%i2,	%l4,	%l5
	save %o7, 0x1DB4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g1,	0x16,	%g3
	edge16	%i1,	%i3,	%g7
	nop
	set	0x60, %g2
	stx	%g4,	[%l7 + %g2]
	movvs	%xcc,	%l6,	%i0
	smul	%l1,	%o5,	%o3
	array32	%i5,	%i4,	%o4
	udiv	%i6,	0x0720,	%o2
	mulscc	%g5,	%l2,	%o1
	subcc	%l3,	0x06BD,	%o6
	udivcc	%l0,	0x09EB,	%g2
	array32	%g6,	%i2,	%i7
	and	%l5,	%l4,	%o7
	addc	%g1,	%g3,	%i1
	stx	%o0,	[%l7 + 0x10]
	fmovsge	%icc,	%f10,	%f12
	smulcc	%g7,	%g4,	%i3
	umul	%i0,	%l6,	%o5
	movrgz	%o3,	0x1BA,	%i5
	edge16ln	%l1,	%o4,	%i6
	srl	%i4,	0x07,	%o2
	alignaddr	%l2,	%o1,	%l3
	orcc	%g5,	0x01FA,	%l0
	stx	%g2,	[%l7 + 0x40]
	orncc	%o6,	%g6,	%i2
	st	%f1,	[%l7 + 0x34]
	andncc	%l5,	%l4,	%i7
	umul	%o7,	0x13FF,	%g3
	orncc	%i1,	0x0A01,	%g1
	edge16l	%o0,	%g7,	%i3
	fmovdcc	%icc,	%f24,	%f0
	fsrc2s	%f21,	%f12
	mulx	%i0,	0x1E51,	%g4
	fmovrdlez	%o5,	%f6,	%f24
	movpos	%xcc,	%l6,	%i5
	array16	%o3,	%l1,	%o4
	fornot1s	%f15,	%f15,	%f9
	fcmpeq32	%f14,	%f20,	%i4
	andn	%i6,	%o2,	%l2
	sub	%l3,	0x0394,	%g5
	movge	%xcc,	%o1,	%g2
	andncc	%l0,	%g6,	%o6
	addc	%i2,	%l4,	%i7
	fcmpgt16	%f30,	%f18,	%o7
	andn	%l5,	0x132C,	%g3
	fornot2	%f6,	%f28,	%f8
	movvs	%icc,	%i1,	%g1
	fmovsge	%icc,	%f11,	%f3
	movgu	%icc,	%o0,	%i3
	fmovdpos	%xcc,	%f14,	%f12
	srax	%g7,	0x13,	%i0
	edge32l	%o5,	%l6,	%g4
	fxors	%f26,	%f28,	%f23
	edge16	%o3,	%i5,	%o4
	xnorcc	%i4,	%l1,	%o2
	lduw	[%l7 + 0x34],	%l2
	move	%icc,	%i6,	%g5
	subcc	%l3,	%o1,	%l0
	movrgez	%g2,	%g6,	%o6
	fpadd16	%f6,	%f12,	%f20
	fcmpgt32	%f30,	%f30,	%i2
	ld	[%l7 + 0x5C],	%f28
	subccc	%i7,	0x08EF,	%l4
	edge32ln	%o7,	%l5,	%i1
	movrgez	%g3,	0x12C,	%g1
	lduw	[%l7 + 0x34],	%o0
	fmovdle	%icc,	%f21,	%f2
	fmovsleu	%icc,	%f22,	%f16
	xor	%i3,	0x0012,	%g7
	movcc	%icc,	%i0,	%l6
	movl	%icc,	%g4,	%o3
	movre	%o5,	0x0D6,	%o4
	movcc	%icc,	%i5,	%i4
	add	%o2,	%l2,	%l1
	ldsh	[%l7 + 0x6A],	%i6
	array32	%l3,	%o1,	%l0
	smul	%g2,	0x029F,	%g6
	udivcc	%o6,	0x0725,	%g5
	sdiv	%i7,	0x07D5,	%i2
	alignaddrl	%o7,	%l4,	%l5
	ldsh	[%l7 + 0x56],	%i1
	edge16ln	%g3,	%o0,	%i3
	sth	%g1,	[%l7 + 0x2C]
	movrlez	%g7,	%l6,	%i0
	fmovrsgez	%o3,	%f14,	%f1
	edge16n	%g4,	%o4,	%i5
	fnegs	%f9,	%f21
	fmovrslez	%i4,	%f7,	%f21
	fmovsl	%icc,	%f28,	%f28
	edge16	%o2,	%o5,	%l2
	fpmerge	%f14,	%f20,	%f12
	sethi	0x0250,	%l1
	movrlez	%l3,	%o1,	%i6
	sll	%g2,	%g6,	%o6
	edge32l	%g5,	%l0,	%i7
	std	%f2,	[%l7 + 0x48]
	fcmpd	%fcc0,	%f8,	%f6
	ldd	[%l7 + 0x68],	%o6
	fmovdleu	%xcc,	%f12,	%f13
	movge	%icc,	%l4,	%l5
	movleu	%icc,	%i2,	%g3
	fmovrse	%o0,	%f30,	%f0
	edge8	%i3,	%g1,	%i1
	movpos	%xcc,	%g7,	%i0
	sth	%l6,	[%l7 + 0x3A]
	add	%g4,	%o4,	%o3
	movneg	%icc,	%i5,	%o2
	fpsub32s	%f30,	%f26,	%f30
	ldd	[%l7 + 0x40],	%o4
	subcc	%i4,	0x0B4C,	%l1
	andn	%l3,	%l2,	%i6
	sethi	0x074E,	%g2
	alignaddr	%o1,	%g6,	%g5
	movrne	%o6,	%l0,	%o7
	movcs	%icc,	%l4,	%i7
	fpackfix	%f6,	%f25
	st	%f16,	[%l7 + 0x60]
	edge32ln	%l5,	%g3,	%i2
	movne	%icc,	%i3,	%g1
	edge32n	%o0,	%g7,	%i1
	movneg	%icc,	%l6,	%g4
	fmul8x16	%f27,	%f26,	%f16
	movl	%icc,	%i0,	%o3
	std	%f12,	[%l7 + 0x20]
	ld	[%l7 + 0x0C],	%f22
	movneg	%icc,	%i5,	%o4
	fmovdpos	%icc,	%f21,	%f16
	subccc	%o2,	%o5,	%i4
	fmovrdlz	%l1,	%f8,	%f18
	ld	[%l7 + 0x4C],	%f23
	udivx	%l2,	0x0C4D,	%i6
	movleu	%icc,	%g2,	%o1
	udivcc	%l3,	0x1573,	%g6
	subc	%g5,	0x0BA7,	%o6
	edge8l	%l0,	%o7,	%l4
	smulcc	%i7,	%g3,	%l5
	subccc	%i2,	%g1,	%o0
	fabss	%f30,	%f17
	array32	%i3,	%i1,	%g7
	fpadd16s	%f3,	%f18,	%f22
	fmovdcs	%icc,	%f11,	%f7
	movne	%icc,	%l6,	%i0
	sdivx	%g4,	0x0C81,	%o3
	udivx	%o4,	0x1845,	%i5
	fcmpne32	%f8,	%f8,	%o2
	movneg	%icc,	%i4,	%l1
	fornot2	%f16,	%f24,	%f22
	alignaddr	%l2,	%o5,	%g2
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	xnorcc	%g5,	0x1133,	%o6
	edge8ln	%g6,	%l0,	%l4
	orcc	%o7,	%i7,	%g3
	movrlez	%i2,	%l5,	%g1
	mulscc	%o0,	%i3,	%g7
	subc	%l6,	%i1,	%i0
	popc	0x0ABD,	%o3
	fabsd	%f12,	%f12
	st	%f25,	[%l7 + 0x0C]
	lduw	[%l7 + 0x70],	%g4
	ldx	[%l7 + 0x20],	%o4
	stb	%o2,	[%l7 + 0x50]
	std	%f12,	[%l7 + 0x28]
	edge8ln	%i5,	%i4,	%l2
	movneg	%xcc,	%o5,	%l1
	fnot1	%f4,	%f2
	addccc	%g2,	%o1,	%l3
	subc	%i6,	0x007D,	%o6
	fzeros	%f9
	addcc	%g5,	%l0,	%l4
	udiv	%g6,	0x007E,	%i7
	fsrc1s	%f19,	%f9
	alignaddr	%o7,	%i2,	%l5
	ld	[%l7 + 0x20],	%f10
	movgu	%xcc,	%g1,	%g3
	sub	%i3,	%g7,	%l6
	srl	%o0,	0x0E,	%i0
	fpadd16s	%f11,	%f18,	%f10
	ld	[%l7 + 0x60],	%f22
	fornot2s	%f4,	%f31,	%f5
	fmovrsgez	%i1,	%f19,	%f27
	mulscc	%g4,	0x0335,	%o4
	udivcc	%o3,	0x1B32,	%i5
	xor	%o2,	%i4,	%l2
	edge32	%l1,	%g2,	%o5
	sdiv	%l3,	0x0D7C,	%i6
	fpmerge	%f13,	%f28,	%f22
	fmovdneg	%xcc,	%f23,	%f15
	smul	%o1,	%g5,	%l0
	addc	%o6,	%g6,	%l4
	movrne	%i7,	%i2,	%o7
	andcc	%l5,	0x141E,	%g1
	ldsw	[%l7 + 0x14],	%g3
	edge16l	%g7,	%i3,	%l6
	fmovrslez	%i0,	%f29,	%f20
	subc	%o0,	%i1,	%o4
	sth	%g4,	[%l7 + 0x2C]
	array8	%i5,	%o2,	%i4
	stw	%l2,	[%l7 + 0x4C]
	siam	0x5
	movl	%xcc,	%l1,	%g2
	fmovrslez	%o3,	%f22,	%f0
	fmovrdgz	%o5,	%f30,	%f16
	xor	%l3,	%i6,	%g5
	fnot1	%f2,	%f12
	sra	%o1,	%o6,	%g6
	save %l0, 0x0FC8, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i7,	%i2,	%o7
	srl	%g1,	%g3,	%l5
	movrgz	%g7,	0x05C,	%l6
	fmovrsne	%i3,	%f1,	%f20
	fmovsvc	%xcc,	%f27,	%f0
	movcc	%xcc,	%i0,	%o0
	array16	%o4,	%g4,	%i1
	fmovdpos	%xcc,	%f26,	%f22
	edge8ln	%o2,	%i4,	%i5
	movg	%xcc,	%l1,	%g2
	sdivcc	%o3,	0x1493,	%l2
	or	%l3,	%i6,	%g5
	edge16	%o5,	%o1,	%o6
	mova	%xcc,	%g6,	%l4
	orn	%i7,	0x0774,	%l0
	edge8n	%i2,	%g1,	%g3
	srlx	%l5,	0x01,	%g7
	array8	%o7,	%i3,	%i0
	umulcc	%o0,	0x1B63,	%o4
	edge32	%l6,	%g4,	%o2
	fandnot2	%f30,	%f26,	%f4
	orcc	%i4,	%i5,	%l1
	movcs	%icc,	%g2,	%i1
	movleu	%xcc,	%l2,	%l3
	restore %o3, %i6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o1,	%g5,	%g6
	ldsh	[%l7 + 0x32],	%l4
	fmovdge	%xcc,	%f24,	%f9
	fsrc1	%f0,	%f4
	fmul8sux16	%f14,	%f20,	%f26
	movl	%xcc,	%i7,	%l0
	umul	%o6,	%i2,	%g3
	popc	%l5,	%g7
	siam	0x6
	movge	%xcc,	%g1,	%i3
	srlx	%i0,	%o0,	%o4
	udiv	%l6,	0x044D,	%g4
	alignaddr	%o7,	%i4,	%o2
	subc	%l1,	%g2,	%i1
	move	%xcc,	%l2,	%l3
	movn	%icc,	%o3,	%i6
	movpos	%icc,	%i5,	%o1
	alignaddrl	%g5,	%g6,	%l4
	fcmpes	%fcc1,	%f27,	%f1
	movleu	%xcc,	%i7,	%o5
	edge32ln	%l0,	%o6,	%i2
	ldsb	[%l7 + 0x70],	%g3
	umul	%l5,	%g1,	%i3
	fabsd	%f28,	%f16
	nop
	set	0x1A, %o1
	stb	%i0,	[%l7 + %o1]
	nop
	set	0x64, %i5
	stw	%o0,	[%l7 + %i5]
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%o4
	fpsub16	%f18,	%f22,	%f14
	xnor	%l6,	%g4,	%o7
	xor	%g7,	0x10A0,	%o2
	lduw	[%l7 + 0x08],	%i4
	alignaddrl	%l1,	%g2,	%l2
	ldsb	[%l7 + 0x3A],	%l3
	st	%f27,	[%l7 + 0x0C]
	srlx	%o3,	0x04,	%i1
	edge16ln	%i5,	%i6,	%o1
	movg	%icc,	%g5,	%l4
	fmovsg	%icc,	%f19,	%f7
	ld	[%l7 + 0x1C],	%f19
	ldub	[%l7 + 0x58],	%i7
	alignaddrl	%g6,	%o5,	%o6
	edge32l	%l0,	%g3,	%l5
	fmovdle	%icc,	%f18,	%f15
	fmul8x16	%f22,	%f30,	%f10
	xor	%i2,	0x1292,	%g1
	fmovse	%icc,	%f27,	%f0
	fmovrdgz	%i0,	%f0,	%f2
	edge32n	%o0,	%i3,	%o4
	mulx	%l6,	0x076F,	%o7
	sir	0x0CF8
	fornot2	%f0,	%f22,	%f14
	movrlz	%g4,	0x264,	%o2
	ldub	[%l7 + 0x26],	%i4
	fabsd	%f20,	%f12
	array8	%g7,	%l1,	%l2
	edge32	%g2,	%o3,	%i1
	fnors	%f2,	%f17,	%f12
	sdivx	%l3,	0x1A35,	%i5
	ldsh	[%l7 + 0x6A],	%i6
	edge16	%g5,	%o1,	%l4
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	umulcc	%o6,	0x093C,	%g3
	fpmerge	%f8,	%f26,	%f28
	edge16	%l0,	%l5,	%g1
	edge32	%i2,	%i0,	%i3
	lduw	[%l7 + 0x30],	%o0
	movcs	%icc,	%l6,	%o4
	siam	0x2
	orncc	%g4,	0x12C0,	%o2
	srax	%o7,	0x10,	%i4
	movre	%g7,	0x23B,	%l1
	fmovdl	%icc,	%f21,	%f20
	and	%l2,	%g2,	%o3
	edge16n	%l3,	%i1,	%i5
	array8	%g5,	%i6,	%l4
	movle	%icc,	%o1,	%g6
	ldub	[%l7 + 0x7E],	%o5
	fones	%f7
	xnor	%i7,	0x077B,	%g3
	edge16n	%l0,	%o6,	%g1
	umulcc	%l5,	0x0D0E,	%i2
	ldd	[%l7 + 0x40],	%f20
	edge32	%i0,	%o0,	%l6
	srax	%o4,	%g4,	%i3
	array32	%o2,	%i4,	%o7
	ldx	[%l7 + 0x60],	%l1
	movvc	%xcc,	%l2,	%g7
	fmuld8ulx16	%f7,	%f22,	%f20
	restore %o3, 0x06AC, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l3,	0x0B36,	%i1
	std	%f22,	[%l7 + 0x48]
	srax	%g5,	0x0B,	%i5
	ldub	[%l7 + 0x7B],	%i6
	movrgez	%l4,	0x240,	%g6
	subccc	%o1,	0x094F,	%i7
	fpadd32s	%f2,	%f19,	%f12
	movrne	%g3,	%l0,	%o5
	movgu	%xcc,	%o6,	%l5
	edge16l	%i2,	%g1,	%i0
	subcc	%o0,	0x100E,	%o4
	udivx	%g4,	0x1DF7,	%l6
	movvs	%xcc,	%o2,	%i4
	sdivcc	%i3,	0x1F58,	%o7
	fcmple16	%f20,	%f4,	%l2
	ldub	[%l7 + 0x7D],	%l1
	edge8l	%g7,	%o3,	%l3
	ldd	[%l7 + 0x20],	%g2
	lduw	[%l7 + 0x70],	%i1
	stx	%i5,	[%l7 + 0x38]
	xor	%g5,	0x15E7,	%i6
	fmovrslez	%l4,	%f19,	%f17
	fnors	%f3,	%f24,	%f29
	movrlez	%g6,	%i7,	%o1
	ldsh	[%l7 + 0x3C],	%l0
	movrne	%o5,	%o6,	%g3
	srlx	%l5,	%i2,	%g1
	lduh	[%l7 + 0x72],	%i0
	umul	%o4,	%g4,	%l6
	fmovrdlez	%o2,	%f8,	%f16
	fcmped	%fcc0,	%f12,	%f16
	fmovdneg	%icc,	%f29,	%f29
	xorcc	%o0,	%i4,	%i3
	movrlez	%o7,	0x0BB,	%l2
	fpmerge	%f30,	%f11,	%f24
	alignaddrl	%l1,	%g7,	%l3
	addcc	%o3,	0x09AD,	%i1
	fmul8x16au	%f9,	%f21,	%f8
	edge16n	%g2,	%i5,	%g5
	umul	%l4,	%i6,	%i7
	fnot2	%f30,	%f4
	st	%f4,	[%l7 + 0x44]
	orn	%g6,	%l0,	%o1
	mulscc	%o6,	%g3,	%o5
	bshuffle	%f14,	%f30,	%f0
	movneg	%icc,	%i2,	%g1
	alignaddr	%l5,	%i0,	%o4
	sdivcc	%l6,	0x070D,	%g4
	stb	%o2,	[%l7 + 0x2F]
	edge32	%o0,	%i4,	%o7
	movvs	%icc,	%l2,	%l1
	movvs	%xcc,	%g7,	%i3
	movn	%xcc,	%o3,	%l3
	fmovdcs	%xcc,	%f13,	%f30
	fmul8sux16	%f12,	%f24,	%f20
	fpadd16s	%f1,	%f13,	%f2
	fmovdneg	%icc,	%f18,	%f5
	ldsw	[%l7 + 0x20],	%i1
	movne	%xcc,	%g2,	%g5
	sethi	0x0ADC,	%l4
	fmovsgu	%xcc,	%f4,	%f15
	sth	%i6,	[%l7 + 0x34]
	move	%xcc,	%i5,	%i7
	srl	%g6,	0x0E,	%o1
	subc	%o6,	%g3,	%o5
	xnorcc	%l0,	0x1B5B,	%g1
	fmuld8ulx16	%f18,	%f10,	%f16
	umulcc	%i2,	%l5,	%o4
	ld	[%l7 + 0x60],	%f23
	movneg	%icc,	%i0,	%g4
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f22
	alignaddr	%o2,	%o0,	%l6
	fmovrdlz	%o7,	%f20,	%f20
	fcmps	%fcc2,	%f21,	%f13
	udivx	%l2,	0x0395,	%i4
	movvc	%xcc,	%l1,	%g7
	movrlz	%i3,	%l3,	%i1
	udivcc	%o3,	0x0EDD,	%g5
	fmovrslz	%g2,	%f1,	%f9
	movrgz	%i6,	0x1CB,	%l4
	movrlz	%i5,	%g6,	%i7
	movgu	%icc,	%o1,	%g3
	movgu	%xcc,	%o6,	%l0
	fmovsneg	%xcc,	%f5,	%f20
	subccc	%o5,	0x08DC,	%g1
	lduw	[%l7 + 0x68],	%l5
	ldx	[%l7 + 0x28],	%o4
	edge16n	%i0,	%i2,	%g4
	edge32l	%o2,	%o0,	%l6
	fpack16	%f30,	%f27
	ldsb	[%l7 + 0x49],	%l2
	fnands	%f23,	%f18,	%f20
	orncc	%o7,	%i4,	%l1
	umul	%g7,	%i3,	%l3
	umulcc	%i1,	0x1EE0,	%g5
	fpack16	%f22,	%f7
	ld	[%l7 + 0x70],	%f19
	smulcc	%g2,	0x0225,	%o3
	movpos	%xcc,	%i6,	%i5
	orcc	%l4,	%g6,	%i7
	fmul8x16al	%f28,	%f9,	%f14
	movcc	%icc,	%o1,	%o6
	fmovdl	%icc,	%f23,	%f16
	sub	%g3,	0x1FC2,	%l0
	subccc	%o5,	0x16D7,	%l5
	edge32n	%g1,	%i0,	%i2
	srl	%o4,	%g4,	%o0
	fexpand	%f14,	%f28
	sth	%l6,	[%l7 + 0x22]
	fmovdl	%icc,	%f23,	%f3
	lduw	[%l7 + 0x68],	%o2
	smulcc	%l2,	0x1BB4,	%i4
	mulx	%o7,	0x0030,	%g7
	andcc	%i3,	0x18E3,	%l3
	and	%l1,	0x1A4D,	%i1
	array32	%g2,	%o3,	%g5
	andcc	%i5,	0x0318,	%i6
	fmovdvc	%xcc,	%f20,	%f22
	movgu	%icc,	%l4,	%g6
	sdiv	%o1,	0x1C48,	%o6
	ld	[%l7 + 0x74],	%f1
	movne	%icc,	%g3,	%i7
	edge16n	%o5,	%l5,	%g1
	edge32	%i0,	%i2,	%l0
	edge32l	%o4,	%g4,	%l6
	addccc	%o0,	%o2,	%l2
	for	%f26,	%f28,	%f10
	sdiv	%o7,	0x1C18,	%g7
	movrgez	%i4,	0x1C1,	%l3
	movre	%l1,	%i1,	%i3
	addc	%g2,	0x0FF8,	%o3
	movle	%xcc,	%i5,	%i6
	umul	%g5,	0x0E70,	%l4
	xorcc	%g6,	0x1911,	%o6
	movrlz	%g3,	0x3F3,	%o1
	fmul8sux16	%f24,	%f24,	%f28
	orcc	%o5,	0x0D8C,	%l5
	edge8ln	%g1,	%i7,	%i2
	fmovdle	%xcc,	%f20,	%f12
	andcc	%i0,	%l0,	%g4
	movpos	%icc,	%o4,	%o0
	xnor	%l6,	%l2,	%o7
	edge8ln	%g7,	%i4,	%l3
	movcc	%icc,	%o2,	%l1
	fmovsg	%xcc,	%f10,	%f12
	nop
	set	0x60, %i6
	std	%f2,	[%l7 + %i6]
	ldsb	[%l7 + 0x37],	%i3
	stw	%i1,	[%l7 + 0x44]
	move	%xcc,	%o3,	%i5
	edge8ln	%i6,	%g5,	%l4
	edge32n	%g6,	%g2,	%o6
	movgu	%icc,	%g3,	%o1
	fnot1	%f2,	%f30
	edge8n	%o5,	%g1,	%l5
	movpos	%icc,	%i7,	%i0
	fmovs	%f2,	%f10
	fmovsle	%xcc,	%f18,	%f1
	sll	%l0,	%i2,	%o4
	sdiv	%g4,	0x1DE4,	%o0
	edge8	%l6,	%o7,	%l2
	lduw	[%l7 + 0x6C],	%i4
	mulx	%g7,	0x0F69,	%l3
	alignaddrl	%o2,	%i3,	%l1
	xnorcc	%i1,	%i5,	%i6
	ldub	[%l7 + 0x0A],	%o3
	save %l4, 0x0729, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	sll	%g6,	0x07,	%o1
	fmul8x16au	%f11,	%f9,	%f26
	ld	[%l7 + 0x0C],	%f1
	ld	[%l7 + 0x54],	%f3
	or	%o5,	%g1,	%g3
	sra	%i7,	%l5,	%l0
	fmovrdgez	%i2,	%f22,	%f26
	ldsb	[%l7 + 0x4C],	%i0
	edge32ln	%g4,	%o4,	%o0
	popc	0x0FD5,	%l6
	subcc	%o7,	%i4,	%g7
	xor	%l3,	%l2,	%i3
	sir	0x0BA4
	fmovrslez	%o2,	%f2,	%f14
	movgu	%icc,	%i1,	%l1
	srl	%i6,	%i5,	%l4
	alignaddrl	%o3,	%g5,	%g2
	udiv	%g6,	0x0803,	%o6
	ldx	[%l7 + 0x10],	%o5
	ld	[%l7 + 0x40],	%f17
	subccc	%g1,	0x0C95,	%o1
	movg	%icc,	%g3,	%l5
	xnor	%i7,	0x19EF,	%i2
	edge16l	%i0,	%l0,	%g4
	sethi	0x0517,	%o4
	edge16l	%l6,	%o7,	%o0
	movne	%icc,	%g7,	%l3
	restore %l2, %i3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i1,	%l1,	%i6
	mulscc	%i5,	%o2,	%l4
	fmovd	%f28,	%f22
	and	%g5,	%o3,	%g6
	fmovd	%f6,	%f30
	or	%g2,	%o5,	%g1
	subcc	%o1,	%g3,	%l5
	popc	0x140B,	%i7
	ld	[%l7 + 0x70],	%f14
	fmovsneg	%xcc,	%f21,	%f9
	srax	%i2,	0x1E,	%i0
	ldx	[%l7 + 0x38],	%l0
	udivcc	%g4,	0x0A73,	%o6
	sth	%l6,	[%l7 + 0x56]
	movgu	%xcc,	%o4,	%o0
	edge32n	%g7,	%l3,	%l2
	smul	%i3,	0x1388,	%o7
	st	%f7,	[%l7 + 0x70]
	xnorcc	%i4,	%i1,	%l1
	edge16l	%i6,	%i5,	%o2
	fpackfix	%f10,	%f10
	fmovdne	%xcc,	%f25,	%f0
	orcc	%g5,	0x0CBC,	%l4
	std	%f20,	[%l7 + 0x48]
	fpadd32s	%f7,	%f22,	%f29
	ldd	[%l7 + 0x40],	%o2
	movvc	%xcc,	%g6,	%o5
	sub	%g2,	%o1,	%g1
	xorcc	%l5,	%g3,	%i2
	edge16l	%i7,	%i0,	%g4
	movg	%xcc,	%o6,	%l6
	edge16n	%l0,	%o0,	%g7
	fmovdg	%icc,	%f19,	%f4
	nop
	set	0x7E, %l1
	ldub	[%l7 + %l1],	%l3
	xorcc	%l2,	0x0EBE,	%o4
	movn	%icc,	%o7,	%i4
	umulcc	%i3,	%l1,	%i1
	sethi	0x1927,	%i6
	sethi	0x0492,	%i5
	movgu	%xcc,	%g5,	%o2
	mulx	%o3,	%g6,	%l4
	srl	%o5,	0x0E,	%g2
	movpos	%xcc,	%g1,	%o1
	fnands	%f4,	%f8,	%f13
	movrgez	%g3,	%l5,	%i7
	movge	%icc,	%i2,	%i0
	mulscc	%g4,	%l6,	%o6
	edge8ln	%o0,	%l0,	%g7
	sll	%l2,	0x0A,	%o4
	umulcc	%l3,	%o7,	%i3
	udivx	%l1,	0x1179,	%i4
	add	%i6,	0x1EA2,	%i1
	movvs	%xcc,	%i5,	%g5
	add	%o3,	0x0B19,	%o2
	udivcc	%l4,	0x0021,	%o5
	stw	%g2,	[%l7 + 0x4C]
	movle	%icc,	%g1,	%o1
	edge8ln	%g6,	%l5,	%i7
	ldsh	[%l7 + 0x78],	%i2
	edge16	%i0,	%g4,	%g3
	movn	%xcc,	%l6,	%o6
	addccc	%l0,	%g7,	%l2
	fsrc2	%f26,	%f2
	fmul8sux16	%f4,	%f6,	%f10
	std	%f14,	[%l7 + 0x58]
	movrgez	%o4,	%l3,	%o7
	udivx	%i3,	0x07D5,	%o0
	orncc	%l1,	%i6,	%i1
	orn	%i4,	0x1D46,	%i5
	fcmped	%fcc1,	%f20,	%f22
	umulcc	%o3,	%o2,	%l4
	nop
	set	0x5B, %l3
	stb	%o5,	[%l7 + %l3]
	fmul8sux16	%f28,	%f6,	%f18
	udiv	%g2,	0x04C6,	%g5
	fpackfix	%f18,	%f22
	sra	%g1,	%g6,	%o1
	fmovsneg	%icc,	%f27,	%f25
	movpos	%xcc,	%i7,	%i2
	movrlz	%l5,	0x09E,	%i0
	and	%g3,	0x0A20,	%g4
	xor	%l6,	%o6,	%g7
	ldd	[%l7 + 0x28],	%f10
	udiv	%l2,	0x17B0,	%l0
	addccc	%l3,	%o4,	%i3
	orn	%o7,	0x1C35,	%l1
	nop
	set	0x66, %o6
	ldsh	[%l7 + %o6],	%o0
	orcc	%i6,	%i1,	%i4
	movle	%xcc,	%i5,	%o2
	siam	0x7
	fabsd	%f2,	%f20
	movre	%l4,	0x005,	%o3
	movrlez	%g2,	%g5,	%g1
	movrgez	%o5,	%g6,	%i7
	fornot2	%f0,	%f22,	%f2
	fmovdcc	%xcc,	%f12,	%f3
	subcc	%i2,	%o1,	%l5
	ldd	[%l7 + 0x60],	%f18
	fmovrdgz	%g3,	%f12,	%f10
	fmovrse	%i0,	%f22,	%f16
	ldsw	[%l7 + 0x7C],	%l6
	fsrc1s	%f29,	%f27
	orcc	%o6,	0x167B,	%g7
	movvs	%icc,	%l2,	%g4
	stw	%l3,	[%l7 + 0x34]
	fmovsneg	%xcc,	%f28,	%f31
	edge8l	%l0,	%o4,	%o7
	fnot1	%f4,	%f30
	edge16l	%i3,	%l1,	%i6
	sethi	0x11B4,	%i1
	orcc	%i4,	%i5,	%o2
	edge16n	%o0,	%l4,	%g2
	subc	%g5,	0x00D9,	%g1
	fpackfix	%f12,	%f4
	xnor	%o3,	0x0745,	%g6
	fpack32	%f20,	%f28,	%f10
	smulcc	%i7,	0x1889,	%i2
	movvs	%icc,	%o1,	%l5
	movpos	%icc,	%o5,	%g3
	xorcc	%i0,	%o6,	%l6
	sth	%g7,	[%l7 + 0x7C]
	fabsd	%f0,	%f0
	movge	%icc,	%l2,	%l3
	stx	%g4,	[%l7 + 0x60]
	fmovdcs	%xcc,	%f13,	%f15
	ldd	[%l7 + 0x38],	%f24
	movneg	%xcc,	%o4,	%o7
	movneg	%xcc,	%l0,	%l1
	fmovse	%xcc,	%f31,	%f1
	smulcc	%i6,	0x1ECC,	%i3
	sllx	%i4,	0x09,	%i5
	movvs	%icc,	%o2,	%o0
	movl	%xcc,	%i1,	%g2
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	ldsb	[%l7 + 0x17],	%o3
	fnegs	%f21,	%f31
	fabss	%f17,	%f13
	smulcc	%g6,	%i7,	%i2
	andcc	%o1,	0x17C3,	%o5
	fcmple16	%f28,	%f2,	%l5
	fmovsneg	%icc,	%f30,	%f22
	subcc	%i0,	0x0ACB,	%g3
	mulscc	%o6,	0x022E,	%l6
	subccc	%l2,	0x1F79,	%l3
	save %g4, %o4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g7,	%l0,	%l1
	sdivx	%i3,	0x0FBD,	%i4
	movneg	%icc,	%i6,	%i5
	edge8l	%o0,	%o2,	%g2
	and	%i1,	0x0784,	%l4
	movn	%icc,	%g5,	%g1
	fmovdg	%xcc,	%f21,	%f7
	fmovscs	%xcc,	%f16,	%f3
	ldsb	[%l7 + 0x72],	%g6
	fmovrsne	%o3,	%f13,	%f8
	umulcc	%i2,	%o1,	%o5
	fnot1s	%f14,	%f14
	fmovdleu	%icc,	%f31,	%f20
	movneg	%xcc,	%l5,	%i0
	fmovdvs	%xcc,	%f2,	%f3
	stw	%g3,	[%l7 + 0x18]
	mulx	%i7,	0x09DA,	%l6
	fmovsa	%icc,	%f1,	%f26
	subccc	%l2,	%l3,	%g4
	edge32l	%o4,	%o6,	%g7
	subccc	%o7,	0x08EA,	%l0
	xor	%i3,	%i4,	%l1
	movpos	%xcc,	%i5,	%o0
	ldsw	[%l7 + 0x48],	%o2
	move	%icc,	%g2,	%i1
	fmul8ulx16	%f4,	%f16,	%f8
	smulcc	%i6,	%g5,	%l4
	popc	%g1,	%o3
	movge	%icc,	%g6,	%o1
	fmovsge	%icc,	%f24,	%f6
	srax	%i2,	0x19,	%o5
	movge	%xcc,	%l5,	%g3
	fnot2s	%f5,	%f7
	array16	%i7,	%l6,	%i0
	fcmpgt32	%f22,	%f24,	%l2
	fmovspos	%icc,	%f15,	%f15
	movgu	%xcc,	%g4,	%o4
	andncc	%l3,	%o6,	%o7
	sdiv	%l0,	0x09C9,	%g7
	movvs	%icc,	%i3,	%i4
	fnot2s	%f13,	%f7
	movle	%icc,	%l1,	%i5
	orncc	%o2,	0x0899,	%o0
	movrlez	%g2,	%i6,	%g5
	nop
	set	0x22, %i4
	sth	%i1,	[%l7 + %i4]
	edge8n	%l4,	%o3,	%g1
	fmovsvs	%xcc,	%f1,	%f11
	mulscc	%g6,	%o1,	%o5
	movrgz	%l5,	%g3,	%i2
	andn	%i7,	0x197D,	%i0
	sra	%l2,	0x16,	%g4
	umulcc	%l6,	%l3,	%o6
	movrlz	%o4,	%o7,	%g7
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%l0
	edge8n	%i4,	%l1,	%i3
	std	%f18,	[%l7 + 0x30]
	umul	%i5,	%o2,	%g2
	ldsb	[%l7 + 0x4D],	%i6
	ldd	[%l7 + 0x48],	%f2
	mulscc	%g5,	%i1,	%o0
	edge8	%l4,	%o3,	%g1
	movrlz	%g6,	0x325,	%o5
	fornot1	%f16,	%f2,	%f22
	array32	%l5,	%o1,	%i2
	fnor	%f24,	%f24,	%f22
	array8	%i7,	%g3,	%i0
	lduh	[%l7 + 0x24],	%g4
	sub	%l6,	%l3,	%l2
	edge16n	%o4,	%o6,	%o7
	fmuld8sux16	%f13,	%f8,	%f18
	fmovsn	%xcc,	%f12,	%f2
	sll	%l0,	%i4,	%l1
	umulcc	%i3,	%g7,	%i5
	srax	%o2,	0x01,	%i6
	movcc	%icc,	%g5,	%i1
	fone	%f22
	lduw	[%l7 + 0x68],	%o0
	edge32	%l4,	%o3,	%g1
	movrgz	%g6,	%o5,	%l5
	sethi	0x08B4,	%g2
	fmovdcs	%icc,	%f0,	%f29
	srl	%i2,	0x0E,	%i7
	edge8ln	%o1,	%i0,	%g3
	array8	%g4,	%l6,	%l2
	movge	%icc,	%o4,	%l3
	subc	%o6,	%o7,	%l0
	movl	%icc,	%i4,	%i3
	sll	%g7,	0x07,	%i5
	movre	%l1,	0x258,	%o2
	srl	%i6,	%i1,	%o0
	fandnot2s	%f8,	%f23,	%f22
	edge8	%l4,	%g5,	%o3
	popc	0x04C8,	%g6
	array8	%g1,	%l5,	%o5
	mulx	%g2,	%i2,	%o1
	udivx	%i7,	0x0B3D,	%i0
	edge16	%g3,	%l6,	%l2
	edge32ln	%g4,	%o4,	%l3
	mulx	%o7,	%o6,	%i4
	fnors	%f21,	%f18,	%f14
	alignaddr	%i3,	%g7,	%l0
	udivx	%i5,	0x07AA,	%l1
	umul	%o2,	%i6,	%i1
	fmovse	%icc,	%f14,	%f19
	andn	%o0,	%l4,	%o3
	ldd	[%l7 + 0x20],	%g4
	fmovrsne	%g1,	%f16,	%f4
	movre	%l5,	0x212,	%g6
	addc	%g2,	0x1440,	%o5
	xorcc	%i2,	%i7,	%i0
	mulscc	%g3,	%l6,	%l2
	sethi	0x12CB,	%g4
	subc	%o4,	%o1,	%l3
	sdiv	%o7,	0x081E,	%o6
	ldsh	[%l7 + 0x5E],	%i4
	movvc	%xcc,	%i3,	%g7
	for	%f6,	%f14,	%f0
	mulx	%l0,	0x07B1,	%l1
	movcs	%icc,	%i5,	%o2
	movrgz	%i6,	0x197,	%i1
	addccc	%l4,	0x19E8,	%o0
	ldub	[%l7 + 0x57],	%g5
	mova	%xcc,	%g1,	%l5
	fzero	%f30
	array8	%o3,	%g2,	%g6
	stw	%o5,	[%l7 + 0x78]
	alignaddr	%i2,	%i7,	%g3
	restore %i0, %l6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	%g4,	%l3
	fmovdn	%icc,	%f10,	%f21
	fmovscs	%xcc,	%f12,	%f28
	movleu	%xcc,	%o1,	%o7
	orn	%i4,	%i3,	%o6
	save %g7, 0x00C8, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l1,	%i5
	movrgez	%i6,	0x2E3,	%o2
	fnors	%f8,	%f3,	%f0
	sir	0x03D3
	sethi	0x1C44,	%i1
	movre	%l4,	%g5,	%g1
	umul	%o0,	%o3,	%l5
	fnot1	%f30,	%f4
	nop
	set	0x4A, %g7
	stb	%g6,	[%l7 + %g7]
	movneg	%icc,	%g2,	%i2
	smul	%i7,	0x176B,	%g3
	umul	%i0,	0x13DA,	%o5
	smulcc	%l2,	%o4,	%l6
	sub	%l3,	%g4,	%o7
	movneg	%icc,	%o1,	%i3
	sub	%o6,	%i4,	%l0
	ldd	[%l7 + 0x50],	%l0
	orn	%i5,	0x1225,	%i6
	addcc	%g7,	0x0F74,	%o2
	fand	%f18,	%f30,	%f22
	movl	%xcc,	%l4,	%i1
	movcs	%xcc,	%g5,	%g1
	ldd	[%l7 + 0x68],	%f2
	fcmpne32	%f16,	%f8,	%o0
	fmovs	%f13,	%f25
	lduw	[%l7 + 0x6C],	%o3
	movrlz	%l5,	0x316,	%g2
	faligndata	%f0,	%f6,	%f18
	alignaddrl	%g6,	%i7,	%g3
	fpadd32	%f26,	%f8,	%f22
	edge8ln	%i2,	%o5,	%i0
	edge8ln	%o4,	%l6,	%l3
	fmovdneg	%icc,	%f1,	%f3
	edge32	%g4,	%l2,	%o1
	addc	%i3,	0x16C1,	%o7
	mulx	%i4,	%o6,	%l0
	andncc	%i5,	%l1,	%g7
	movg	%xcc,	%o2,	%l4
	array16	%i1,	%i6,	%g1
	addccc	%g5,	%o3,	%l5
	fmovsg	%xcc,	%f12,	%f5
	movrlz	%o0,	%g2,	%i7
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	ldd	[%l7 + 0x50],	%g2
	xor	%i0,	0x1C4E,	%o5
	fmovdn	%icc,	%f16,	%f28
	movrne	%l6,	0x3E5,	%l3
	fmovrdne	%g4,	%f28,	%f30
	movpos	%xcc,	%l2,	%o4
	fmul8x16	%f28,	%f22,	%f26
	fmul8x16	%f12,	%f8,	%f0
	ldd	[%l7 + 0x60],	%f8
	sdiv	%i3,	0x039C,	%o7
	subccc	%o1,	%i4,	%l0
	ldsb	[%l7 + 0x77],	%o6
	mova	%icc,	%i5,	%g7
	nop
	set	0x32, %l2
	ldub	[%l7 + %l2],	%l1
	movcs	%xcc,	%l4,	%i1
	xnorcc	%i6,	0x13B4,	%g1
	fmovd	%f30,	%f4
	andcc	%g5,	0x1C44,	%o2
	fmovdn	%icc,	%f26,	%f1
	sll	%l5,	0x08,	%o0
	srlx	%o3,	%g2,	%g6
	addcc	%i2,	0x0D2B,	%g3
	umul	%i0,	%i7,	%l6
	ldx	[%l7 + 0x78],	%l3
	movleu	%icc,	%o5,	%l2
	mulx	%o4,	0x08F6,	%g4
	andcc	%i3,	%o1,	%o7
	movpos	%icc,	%i4,	%o6
	mulscc	%i5,	%l0,	%l1
	std	%f12,	[%l7 + 0x58]
	orn	%l4,	%i1,	%i6
	sth	%g7,	[%l7 + 0x4C]
	sir	0x12B9
	movgu	%icc,	%g5,	%o2
	alignaddrl	%g1,	%l5,	%o3
	xorcc	%o0,	%g2,	%i2
	edge16n	%g6,	%i0,	%g3
	ldub	[%l7 + 0x55],	%i7
	st	%f16,	[%l7 + 0x34]
	array32	%l6,	%l3,	%o5
	movne	%xcc,	%l2,	%o4
	umul	%g4,	0x021B,	%i3
	fnot2s	%f21,	%f21
	edge8	%o1,	%o7,	%o6
	edge32ln	%i4,	%l0,	%i5
	movleu	%icc,	%l4,	%l1
	movvc	%xcc,	%i1,	%g7
	edge32l	%i6,	%o2,	%g5
	fmovdleu	%xcc,	%f30,	%f11
	ldsh	[%l7 + 0x36],	%g1
	xor	%o3,	0x1D16,	%l5
	edge8n	%g2,	%o0,	%i2
	movrlz	%g6,	%g3,	%i7
	srl	%i0,	0x11,	%l3
	popc	0x161E,	%l6
	ldx	[%l7 + 0x20],	%o5
	smul	%o4,	0x05D2,	%g4
	sdivx	%i3,	0x1718,	%o1
	xorcc	%l2,	%o7,	%o6
	addc	%l0,	0x1CEE,	%i4
	movleu	%icc,	%l4,	%i5
	nop
	set	0x24, %l0
	stw	%i1,	[%l7 + %l0]
	movn	%icc,	%l1,	%g7
	sllx	%i6,	%o2,	%g1
	addcc	%o3,	0x1425,	%g5
	fmovd	%f30,	%f30
	sdiv	%l5,	0x1861,	%g2
	fsrc2s	%f19,	%f15
	st	%f27,	[%l7 + 0x40]
	andncc	%i2,	%o0,	%g3
	umulcc	%i7,	0x14D5,	%g6
	smul	%l3,	%i0,	%o5
	or	%l6,	0x1133,	%o4
	sll	%g4,	%i3,	%o1
	udivx	%o7,	0x11AD,	%o6
	umulcc	%l2,	%l0,	%i4
	sth	%l4,	[%l7 + 0x7E]
	fmovdn	%xcc,	%f7,	%f21
	movn	%xcc,	%i5,	%i1
	mulscc	%g7,	0x1EC0,	%i6
	sdivcc	%l1,	0x0F4A,	%g1
	fpack16	%f26,	%f18
	smul	%o3,	0x1E66,	%o2
	edge8	%g5,	%g2,	%i2
	movrgz	%o0,	%g3,	%i7
	save %g6, %l5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l3,	0x0A37,	%l6
	fmovdpos	%icc,	%f16,	%f30
	srlx	%o5,	0x06,	%g4
	xnor	%i3,	%o1,	%o7
	ldd	[%l7 + 0x28],	%f22
	movpos	%xcc,	%o4,	%l2
	movge	%icc,	%o6,	%i4
	fnegd	%f0,	%f6
	xor	%l0,	0x1030,	%i5
	sllx	%i1,	0x13,	%l4
	and	%i6,	0x1B04,	%g7
	stb	%g1,	[%l7 + 0x10]
	umul	%o3,	0x199E,	%o2
	or	%g5,	%l1,	%g2
	edge16ln	%i2,	%o0,	%g3
	edge32n	%i7,	%g6,	%l5
	fxors	%f3,	%f8,	%f20
	array16	%l3,	%l6,	%o5
	movvs	%icc,	%i0,	%g4
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%o0
	movgu	%xcc,	%i3,	%o4
	fands	%f29,	%f23,	%f4
	movgu	%xcc,	%l2,	%o7
	ldd	[%l7 + 0x58],	%f28
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%i4
	lduw	[%l7 + 0x20],	%l0
	movg	%icc,	%i5,	%i1
	orncc	%l4,	0x1CA4,	%i6
	add	%o6,	%g7,	%g1
	array32	%o2,	%o3,	%g5
	fmul8x16	%f3,	%f4,	%f8
	andn	%g2,	0x18D3,	%i2
	movleu	%icc,	%l1,	%g3
	udivcc	%o0,	0x1DFC,	%g6
	array16	%i7,	%l5,	%l6
	restore %o5, 0x0A04, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x75],	%i0
	andcc	%o1,	0x0BD1,	%i3
	fmovrsgez	%o4,	%f16,	%f20
	sra	%l2,	%o7,	%i4
	fmovsge	%icc,	%f21,	%f9
	movpos	%icc,	%l0,	%g4
	fnands	%f25,	%f2,	%f6
	save %i5, 0x09D2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	%o6,	%g7
	orcc	%g1,	0x190F,	%o2
	fmovdg	%icc,	%f6,	%f9
	fandnot1	%f0,	%f28,	%f24
	fmovrdne	%o3,	%f28,	%f26
	fpsub32	%f20,	%f26,	%f14
	ld	[%l7 + 0x50],	%f13
	orn	%i6,	%g2,	%g5
	andncc	%l1,	%i2,	%g3
	sdiv	%o0,	0x0722,	%g6
	ldd	[%l7 + 0x10],	%i6
	fnors	%f7,	%f30,	%f7
	mulscc	%l5,	0x1F20,	%o5
	edge32l	%l3,	%i0,	%l6
	addccc	%o1,	0x1057,	%o4
	edge16	%i3,	%o7,	%i4
	edge32n	%l0,	%g4,	%l2
	ldsb	[%l7 + 0x74],	%i5
	fcmpeq16	%f20,	%f12,	%i1
	ldd	[%l7 + 0x78],	%f12
	movcs	%xcc,	%o6,	%g7
	fmovda	%icc,	%f10,	%f25
	fzero	%f2
	fornot2s	%f17,	%f2,	%f0
	ldd	[%l7 + 0x10],	%f28
	movl	%icc,	%g1,	%l4
	fnot2s	%f0,	%f5
	fsrc2s	%f19,	%f7
	sth	%o2,	[%l7 + 0x40]
	ldd	[%l7 + 0x30],	%f18
	array16	%i6,	%o3,	%g5
	array32	%g2,	%i2,	%g3
	sub	%o0,	0x0985,	%g6
	fmovsl	%icc,	%f24,	%f4
	movrgez	%l1,	0x30E,	%i7
	udivcc	%l5,	0x1E1B,	%o5
	xor	%i0,	0x0465,	%l3
	fsrc1s	%f10,	%f10
	movrlz	%l6,	%o1,	%i3
	fcmps	%fcc1,	%f31,	%f29
	movgu	%icc,	%o4,	%o7
	sdivcc	%i4,	0x1DBA,	%g4
	ldub	[%l7 + 0x10],	%l2
	fpadd16	%f16,	%f14,	%f20
	sdiv	%l0,	0x0CA9,	%i5
	xorcc	%i1,	0x03D2,	%g7
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%g1
	andn	%l4,	0x1D39,	%o2
	subccc	%i6,	%o3,	%o6
	sir	0x1ABB
	edge32	%g2,	%i2,	%g3
	movgu	%icc,	%g5,	%o0
	fpsub32	%f8,	%f16,	%f12
	edge16ln	%l1,	%i7,	%l5
	edge16	%o5,	%i0,	%l3
	fmovdpos	%xcc,	%f22,	%f3
	fzero	%f18
	sdiv	%l6,	0x1247,	%g6
	edge32ln	%o1,	%i3,	%o7
	stx	%o4,	[%l7 + 0x10]
	movvs	%icc,	%g4,	%i4
	fcmpne16	%f8,	%f12,	%l0
	xnorcc	%l2,	%i1,	%i5
	fmovdle	%icc,	%f7,	%f3
	fmovrdlez	%g7,	%f6,	%f16
	alignaddrl	%g1,	%o2,	%i6
	fandnot2	%f24,	%f20,	%f20
	fmovscc	%xcc,	%f18,	%f16
	fpadd16s	%f27,	%f18,	%f17
	nop
	set	0x28, %l5
	sth	%l4,	[%l7 + %l5]
	movpos	%xcc,	%o6,	%o3
	and	%i2,	0x105A,	%g2
	movvc	%xcc,	%g5,	%g3
	fands	%f16,	%f31,	%f25
	movn	%xcc,	%l1,	%o0
	fmovdg	%xcc,	%f25,	%f14
	array32	%l5,	%i7,	%i0
	fnot1	%f4,	%f10
	movvc	%icc,	%o5,	%l6
	edge16ln	%g6,	%o1,	%l3
	movl	%xcc,	%o7,	%o4
	movgu	%icc,	%i3,	%i4
	movvc	%icc,	%l0,	%l2
	for	%f14,	%f28,	%f18
	movre	%g4,	0x2D3,	%i1
	srlx	%g7,	0x18,	%i5
	move	%icc,	%g1,	%i6
	movle	%xcc,	%o2,	%l4
	udiv	%o3,	0x0D0B,	%i2
	ldd	[%l7 + 0x48],	%o6
	array16	%g2,	%g5,	%l1
	movvc	%xcc,	%g3,	%o0
	fmuld8sux16	%f2,	%f25,	%f14
	siam	0x3
	fmovrslez	%i7,	%f17,	%f26
	fone	%f30
	movcc	%xcc,	%i0,	%l5
	st	%f20,	[%l7 + 0x3C]
	fnot2	%f14,	%f6
	fmovda	%xcc,	%f4,	%f12
	movrgez	%o5,	%g6,	%o1
	umulcc	%l3,	%o7,	%o4
	sir	0x0555
	sdivx	%i3,	0x0293,	%i4
	fcmps	%fcc2,	%f24,	%f0
	sdivcc	%l0,	0x0929,	%l2
	movgu	%icc,	%g4,	%l6
	umul	%g7,	0x0760,	%i5
	movre	%g1,	0x3F1,	%i1
	sdivx	%i6,	0x160A,	%o2
	andncc	%o3,	%i2,	%o6
	edge32n	%l4,	%g2,	%l1
	ldub	[%l7 + 0x10],	%g3
	sub	%g5,	%i7,	%o0
	fnand	%f2,	%f22,	%f6
	addc	%i0,	%o5,	%l5
	lduh	[%l7 + 0x68],	%o1
	movg	%icc,	%l3,	%g6
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	fnors	%f18,	%f23,	%f14
	fsrc1	%f16,	%f28
	fmovrse	%i4,	%f2,	%f1
	movg	%icc,	%l2,	%l0
	stw	%g4,	[%l7 + 0x48]
	edge16	%l6,	%g7,	%i5
	addcc	%i1,	%g1,	%o2
	smul	%o3,	0x19FD,	%i6
	andncc	%o6,	%l4,	%i2
	movleu	%icc,	%l1,	%g2
	movne	%icc,	%g3,	%g5
	movn	%icc,	%i7,	%i0
	subc	%o5,	%o0,	%l5
	save %o1, %g6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x04C3,	%o7
	fmul8x16	%f24,	%f8,	%f6
	andncc	%i3,	%i4,	%o4
	srl	%l2,	0x06,	%l0
	lduh	[%l7 + 0x3E],	%g4
	st	%f24,	[%l7 + 0x68]
	movgu	%icc,	%g7,	%i5
	fmovsneg	%icc,	%f20,	%f28
	movn	%xcc,	%i1,	%g1
	movne	%icc,	%l6,	%o2
	edge16	%o3,	%i6,	%l4
	array32	%o6,	%l1,	%i2
	fmovspos	%xcc,	%f13,	%f2
	fone	%f8
	fmul8sux16	%f20,	%f12,	%f0
	fmovsgu	%xcc,	%f22,	%f31
	subccc	%g2,	0x07E2,	%g3
	edge32n	%i7,	%g5,	%o5
	lduw	[%l7 + 0x7C],	%i0
	movle	%icc,	%l5,	%o0
	movvs	%xcc,	%g6,	%l3
	ldx	[%l7 + 0x48],	%o7
	xorcc	%i3,	0x02C2,	%o1
	fcmple16	%f8,	%f26,	%o4
	sra	%l2,	0x06,	%i4
	subcc	%g4,	0x16E7,	%g7
	subcc	%l0,	0x10E9,	%i1
	edge32l	%g1,	%l6,	%o2
	array8	%o3,	%i6,	%l4
	movrlez	%i5,	%l1,	%i2
	movrgz	%o6,	%g3,	%g2
	nop
	set	0x5A, %l6
	stb	%i7,	[%l7 + %l6]
	movl	%icc,	%o5,	%g5
	smulcc	%l5,	0x0604,	%i0
	alignaddr	%g6,	%l3,	%o0
	movrgz	%o7,	%o1,	%i3
	sdivcc	%l2,	0x0A1E,	%i4
	movne	%icc,	%g4,	%o4
	movne	%xcc,	%g7,	%l0
	lduh	[%l7 + 0x14],	%g1
	edge8ln	%i1,	%l6,	%o2
	or	%i6,	%l4,	%o3
	andn	%i5,	%l1,	%i2
	sra	%g3,	%g2,	%o6
	movneg	%xcc,	%i7,	%o5
	sdiv	%l5,	0x010F,	%i0
	movrgez	%g5,	%l3,	%g6
	fmovdvs	%icc,	%f21,	%f2
	ldd	[%l7 + 0x20],	%o6
	xor	%o1,	%i3,	%l2
	ldd	[%l7 + 0x40],	%o0
	fnegs	%f15,	%f22
	udivcc	%g4,	0x0A0C,	%o4
	andn	%i4,	%g7,	%g1
	fmovsne	%xcc,	%f15,	%f13
	array32	%i1,	%l0,	%o2
	mulscc	%l6,	%l4,	%i6
	std	%f30,	[%l7 + 0x58]
	sdiv	%i5,	0x1E0F,	%o3
	move	%xcc,	%l1,	%i2
	addccc	%g2,	0x197D,	%o6
	andncc	%g3,	%o5,	%l5
	movrgz	%i7,	0x351,	%i0
	ldsw	[%l7 + 0x1C],	%g5
	andn	%l3,	0x19D8,	%o7
	stb	%g6,	[%l7 + 0x3D]
	restore %i3, 0x11B6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l2,	%g4,	%o0
	andn	%o4,	%g7,	%i4
	stw	%i1,	[%l7 + 0x78]
	sethi	0x112D,	%l0
	subc	%o2,	%g1,	%l6
	sllx	%i6,	0x0D,	%l4
	stb	%o3,	[%l7 + 0x6C]
	movleu	%xcc,	%i5,	%i2
	sdivx	%g2,	0x07DF,	%l1
	ld	[%l7 + 0x4C],	%f29
	stx	%o6,	[%l7 + 0x30]
	sdiv	%o5,	0x127A,	%g3
	fmovde	%icc,	%f2,	%f28
	sdivcc	%l5,	0x1078,	%i7
	sethi	0x0D69,	%i0
	xnorcc	%g5,	%l3,	%o7
	fmovrdgez	%i3,	%f10,	%f8
	and	%o1,	0x1BF4,	%g6
	addccc	%g4,	0x0BEA,	%o0
	fmovsvs	%icc,	%f30,	%f20
	movpos	%icc,	%o4,	%g7
	edge8	%i4,	%i1,	%l0
	array8	%o2,	%g1,	%l2
	xnor	%i6,	%l4,	%o3
	sethi	0x03A1,	%i5
	lduh	[%l7 + 0x2A],	%l6
	srlx	%g2,	0x07,	%i2
	mulx	%o6,	%l1,	%o5
	movrgez	%l5,	%i7,	%g3
	or	%i0,	0x1701,	%g5
	ldsb	[%l7 + 0x0F],	%l3
	movrlez	%i3,	%o1,	%g6
	andcc	%o7,	%o0,	%g4
	fandnot2	%f22,	%f0,	%f24
	movcs	%xcc,	%g7,	%o4
	fmovscs	%icc,	%f5,	%f10
	fmovrde	%i1,	%f14,	%f28
	movle	%xcc,	%i4,	%l0
	udivcc	%g1,	0x0834,	%l2
	edge32ln	%i6,	%l4,	%o2
	stb	%o3,	[%l7 + 0x72]
	movneg	%xcc,	%i5,	%g2
	fcmpd	%fcc1,	%f12,	%f20
	fmovrse	%l6,	%f27,	%f10
	movrgez	%o6,	0x036,	%i2
	movn	%icc,	%l1,	%l5
	fsrc2s	%f20,	%f2
	sra	%i7,	%o5,	%g3
	udivx	%i0,	0x1A39,	%l3
	movle	%xcc,	%g5,	%i3
	save %o1, 0x1F80, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g6,	[%l7 + 0x0F]
	srl	%o0,	0x1C,	%g4
	fzeros	%f27
	fmovrde	%g7,	%f12,	%f6
	array16	%o4,	%i4,	%l0
	edge16	%g1,	%i1,	%l2
	movneg	%xcc,	%l4,	%i6
	edge16l	%o3,	%i5,	%g2
	std	%f10,	[%l7 + 0x40]
	fcmpeq16	%f8,	%f14,	%o2
	umulcc	%l6,	0x1C71,	%i2
	nop
	set	0x0A, %g3
	ldub	[%l7 + %g3],	%o6
	sllx	%l1,	%i7,	%l5
	ldub	[%l7 + 0x4C],	%o5
	movrne	%g3,	%i0,	%l3
	addcc	%i3,	%o1,	%o7
	movneg	%icc,	%g6,	%g5
	smul	%o0,	0x139F,	%g4
	edge16ln	%g7,	%i4,	%o4
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	movcc	%icc,	%l4,	%l2
	sethi	0x1643,	%o3
	addc	%i5,	0x12B0,	%g2
	sir	0x0B9D
	srlx	%i6,	0x17,	%l6
	save %o2, 0x1322, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f2,	%f25
	movvc	%xcc,	%o6,	%l1
	movn	%icc,	%l5,	%i7
	edge16l	%o5,	%g3,	%i0
	fnor	%f6,	%f30,	%f10
	edge32ln	%l3,	%i3,	%o7
	subcc	%g6,	0x083D,	%o1
	subccc	%o0,	0x0B0A,	%g4
	for	%f6,	%f6,	%f26
	nop
	set	0x2C, %l4
	ldsb	[%l7 + %l4],	%g5
	fandnot2s	%f16,	%f29,	%f4
	fmovsge	%xcc,	%f13,	%f12
	srax	%g7,	%o4,	%i4
	fnot1	%f22,	%f10
	sdivx	%l0,	0x03AF,	%i1
	edge8	%l4,	%l2,	%g1
	orncc	%i5,	%g2,	%o3
	mulscc	%l6,	0x06CE,	%i6
	sll	%o2,	%i2,	%o6
	sub	%l1,	0x1FD0,	%i7
	movle	%icc,	%l5,	%g3
	movrlz	%i0,	%o5,	%i3
	sdivx	%l3,	0x1502,	%o7
	sethi	0x1A9E,	%o1
	fmovsgu	%xcc,	%f13,	%f22
	srl	%o0,	%g6,	%g4
	edge32l	%g5,	%o4,	%i4
	addccc	%l0,	%i1,	%l4
	subc	%l2,	%g1,	%g7
	umulcc	%g2,	0x1539,	%o3
	addcc	%l6,	0x1C20,	%i5
	faligndata	%f22,	%f30,	%f26
	lduh	[%l7 + 0x2A],	%i6
	sub	%o2,	%o6,	%l1
	andncc	%i2,	%i7,	%l5
	fornot1s	%f30,	%f23,	%f12
	orcc	%i0,	%g3,	%i3
	ldd	[%l7 + 0x78],	%f14
	lduh	[%l7 + 0x1C],	%l3
	umulcc	%o5,	0x1862,	%o1
	ldsh	[%l7 + 0x58],	%o0
	st	%f12,	[%l7 + 0x78]
	edge8ln	%g6,	%o7,	%g4
	movvs	%icc,	%g5,	%i4
	edge8ln	%l0,	%i1,	%l4
	std	%f24,	[%l7 + 0x38]
	st	%f7,	[%l7 + 0x58]
	andn	%l2,	0x0E1E,	%o4
	movgu	%xcc,	%g1,	%g7
	edge16	%g2,	%o3,	%i5
	mova	%xcc,	%i6,	%o2
	sll	%l6,	%l1,	%o6
	restore %i7, %l5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g3,	0x0E33,	%i3
	fmul8ulx16	%f0,	%f28,	%f22
	mulscc	%l3,	0x01F0,	%i2
	mulx	%o1,	%o0,	%g6
	fcmpd	%fcc0,	%f24,	%f6
	srl	%o5,	%g4,	%o7
	lduw	[%l7 + 0x50],	%i4
	faligndata	%f4,	%f18,	%f18
	nop
	set	0x78, %g5
	stx	%g5,	[%l7 + %g5]
	orncc	%l0,	%i1,	%l4
	fcmped	%fcc3,	%f28,	%f24
	fmovdgu	%xcc,	%f0,	%f26
	ldd	[%l7 + 0x38],	%l2
	movleu	%xcc,	%g1,	%o4
	smul	%g7,	%g2,	%o3
	movvs	%icc,	%i5,	%i6
	sdivcc	%o2,	0x0639,	%l1
	srl	%o6,	0x08,	%i7
	fnand	%f26,	%f8,	%f2
	movrne	%l6,	%i0,	%g3
	edge32l	%l5,	%l3,	%i2
	umulcc	%o1,	%o0,	%i3
	fmovdvs	%icc,	%f7,	%f14
	udivcc	%o5,	0x0239,	%g6
	fpsub32	%f18,	%f14,	%f30
	fabsd	%f14,	%f28
	fnegd	%f2,	%f20
	umulcc	%g4,	0x0E7A,	%o7
	movl	%xcc,	%i4,	%g5
	array16	%i1,	%l0,	%l4
	movrgz	%g1,	0x216,	%o4
	fnot1	%f0,	%f8
	ld	[%l7 + 0x14],	%f22
	xor	%g7,	0x0102,	%l2
	movrlez	%o3,	0x037,	%g2
	stw	%i5,	[%l7 + 0x38]
	edge8ln	%i6,	%l1,	%o2
	edge16l	%o6,	%i7,	%i0
	orncc	%g3,	0x039A,	%l6
	movrne	%l3,	%i2,	%l5
	fcmpne32	%f16,	%f12,	%o1
	andn	%o0,	%o5,	%g6
	fcmple16	%f22,	%f28,	%g4
	fmovsg	%icc,	%f26,	%f6
	movcc	%icc,	%o7,	%i3
	movrgez	%g5,	0x31E,	%i1
	alignaddrl	%i4,	%l4,	%l0
	movn	%xcc,	%g1,	%o4
	fnand	%f0,	%f24,	%f16
	sethi	0x1C21,	%g7
	fmovsle	%icc,	%f5,	%f2
	movvs	%icc,	%l2,	%o3
	ldsh	[%l7 + 0x68],	%i5
	movne	%icc,	%g2,	%i6
	bshuffle	%f0,	%f6,	%f18
	lduw	[%l7 + 0x1C],	%o2
	fmovdl	%icc,	%f23,	%f0
	popc	%o6,	%i7
	sethi	0x11D7,	%l1
	array16	%i0,	%g3,	%l6
	fmovrsne	%i2,	%f9,	%f24
	sth	%l5,	[%l7 + 0x40]
	xor	%l3,	%o1,	%o5
	subcc	%g6,	%g4,	%o0
	edge8ln	%o7,	%i3,	%g5
	andn	%i1,	0x1804,	%l4
	ldub	[%l7 + 0x1D],	%l0
	mulx	%i4,	0x105F,	%o4
	sth	%g1,	[%l7 + 0x78]
	fcmpes	%fcc1,	%f23,	%f3
	array8	%g7,	%o3,	%i5
	fcmps	%fcc3,	%f4,	%f16
	sllx	%g2,	0x03,	%l2
	fpsub16	%f14,	%f14,	%f0
	addccc	%i6,	%o2,	%o6
	sll	%l1,	0x13,	%i7
	udiv	%g3,	0x00D5,	%l6
	subcc	%i2,	%i0,	%l5
	fornot2s	%f4,	%f21,	%f9
	edge8n	%l3,	%o5,	%g6
	movpos	%xcc,	%o1,	%g4
	movne	%icc,	%o7,	%i3
	sub	%g5,	%o0,	%l4
	orn	%i1,	%l0,	%i4
	movrgz	%g1,	%o4,	%o3
	or	%i5,	%g2,	%g7
	fmovsneg	%xcc,	%f21,	%f29
	orcc	%l2,	%o2,	%o6
	fnegd	%f0,	%f10
	mulx	%l1,	%i6,	%g3
	fmovde	%icc,	%f0,	%f13
	movcc	%icc,	%i7,	%l6
	fmovdpos	%xcc,	%f21,	%f10
	fnor	%f24,	%f14,	%f4
	ld	[%l7 + 0x30],	%f24
	array8	%i0,	%l5,	%l3
	fsrc1	%f30,	%f22
	movcs	%xcc,	%i2,	%o5
	fmul8sux16	%f16,	%f8,	%f10
	udivx	%g6,	0x1D25,	%g4
	andncc	%o7,	%i3,	%g5
	edge16n	%o0,	%o1,	%l4
	sra	%i1,	%l0,	%i4
	edge8n	%g1,	%o4,	%o3
	move	%xcc,	%i5,	%g7
	fnands	%f9,	%f16,	%f12
	edge32	%g2,	%o2,	%o6
	mulscc	%l2,	0x1CD4,	%l1
	umul	%g3,	0x12F0,	%i7
	xor	%l6,	0x185C,	%i0
	ld	[%l7 + 0x4C],	%f18
	subcc	%l5,	%l3,	%i6
	stb	%o5,	[%l7 + 0x73]
	array8	%g6,	%i2,	%o7
	movneg	%icc,	%g4,	%g5
	edge16	%o0,	%i3,	%l4
	movrlez	%i1,	%o1,	%l0
	edge32ln	%i4,	%o4,	%g1
	xor	%i5,	0x121E,	%g7
	array16	%g2,	%o2,	%o3
	movrlz	%l2,	%l1,	%g3
	fzeros	%f1
	ldd	[%l7 + 0x20],	%f30
	edge32	%o6,	%i7,	%i0
	orcc	%l6,	0x1315,	%l5
	array32	%i6,	%l3,	%g6
	array32	%o5,	%i2,	%g4
	std	%f28,	[%l7 + 0x40]
	array8	%g5,	%o0,	%i3
	save %o7, 0x1875, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l4,	%o1,	%l0
	movrgez	%o4,	%i4,	%g1
	fxnors	%f8,	%f21,	%f24
	fmovrdne	%i5,	%f12,	%f18
	edge32	%g7,	%g2,	%o2
	movleu	%xcc,	%l2,	%l1
	fpack16	%f24,	%f15
	sllx	%o3,	0x1B,	%o6
	fornot1s	%f6,	%f13,	%f26
	array32	%i7,	%i0,	%g3
	movvs	%xcc,	%l5,	%l6
	fpsub32s	%f26,	%f6,	%f4
	smulcc	%i6,	%g6,	%o5
	srax	%l3,	0x1D,	%g4
	mova	%xcc,	%g5,	%o0
	nop
	set	0x7C, %o3
	lduw	[%l7 + %o3],	%i3
	sdivx	%o7,	0x1387,	%i2
	andn	%i1,	%o1,	%l4
	srl	%l0,	0x02,	%o4
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	ldsb	[%l7 + 0x1A],	%g7
	array8	%g2,	%g1,	%o2
	ldx	[%l7 + 0x40],	%l1
	movgu	%xcc,	%o3,	%l2
	orncc	%i7,	0x09E6,	%o6
	st	%f21,	[%l7 + 0x1C]
	fmovdl	%icc,	%f10,	%f3
	edge16	%i0,	%g3,	%l5
	fpackfix	%f10,	%f26
	mova	%xcc,	%l6,	%g6
	andn	%o5,	0x12A6,	%l3
	edge8ln	%i6,	%g4,	%g5
	xor	%i3,	0x0B02,	%o7
	xnorcc	%i2,	%i1,	%o1
	fmovdn	%icc,	%f1,	%f19
	fpadd16s	%f18,	%f12,	%f10
	edge16	%o0,	%l4,	%l0
	move	%xcc,	%i4,	%i5
	save %g7, 0x14FB, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g1,	%g2,	%l1
	fpsub16	%f22,	%f26,	%f16
	movle	%xcc,	%o2,	%l2
	fxnor	%f6,	%f8,	%f14
	fmovrsgez	%i7,	%f3,	%f11
	edge32	%o3,	%o6,	%g3
	movvs	%xcc,	%l5,	%i0
	movleu	%xcc,	%g6,	%o5
	sra	%l3,	%l6,	%i6
	udivcc	%g5,	0x1822,	%i3
	ldub	[%l7 + 0x3A],	%o7
	array16	%g4,	%i2,	%o1
	fsrc1	%f22,	%f4
	fnot1	%f16,	%f24
	ldsb	[%l7 + 0x7D],	%o0
	edge8n	%l4,	%l0,	%i4
	sethi	0x1F41,	%i5
	srlx	%i1,	0x0E,	%o4
	mova	%xcc,	%g7,	%g1
	fcmps	%fcc1,	%f25,	%f2
	movpos	%xcc,	%g2,	%l1
	fcmpeq32	%f10,	%f22,	%l2
	udiv	%o2,	0x030D,	%i7
	movneg	%icc,	%o3,	%g3
	fmuld8ulx16	%f21,	%f8,	%f20
	lduh	[%l7 + 0x7C],	%l5
	sllx	%o6,	%g6,	%o5
	siam	0x2
	sdiv	%i0,	0x1983,	%l3
	orncc	%l6,	0x1328,	%i6
	sdiv	%g5,	0x1160,	%i3
	mulx	%o7,	%i2,	%g4
	movleu	%xcc,	%o1,	%l4
	edge32l	%o0,	%i4,	%i5
	ldsw	[%l7 + 0x7C],	%l0
	movn	%xcc,	%i1,	%g7
	movrne	%g1,	%g2,	%l1
	udiv	%l2,	0x086E,	%o4
	mulscc	%i7,	0x1F25,	%o3
	movn	%xcc,	%g3,	%o2
	fmul8x16au	%f5,	%f21,	%f30
	fmovdpos	%icc,	%f10,	%f18
	ldsh	[%l7 + 0x76],	%l5
	sra	%g6,	%o6,	%o5
	movcs	%xcc,	%i0,	%l3
	fpsub16	%f12,	%f2,	%f2
	sdivx	%l6,	0x11A7,	%g5
	lduh	[%l7 + 0x48],	%i3
	std	%f18,	[%l7 + 0x40]
	andcc	%i6,	0x0313,	%i2
	fxnors	%f16,	%f15,	%f12
	orcc	%o7,	0x1BDE,	%o1
	ldd	[%l7 + 0x18],	%f14
	umul	%l4,	%g4,	%o0
	andcc	%i5,	%i4,	%l0
	edge16	%i1,	%g7,	%g1
	std	%f30,	[%l7 + 0x08]
	lduh	[%l7 + 0x68],	%l1
	movrlz	%g2,	%o4,	%l2
	fcmpes	%fcc3,	%f1,	%f2
	lduw	[%l7 + 0x08],	%o3
	stw	%i7,	[%l7 + 0x60]
	ldd	[%l7 + 0x68],	%o2
	udivx	%g3,	0x1E7A,	%g6
	movcc	%icc,	%o6,	%l5
	umul	%i0,	%l3,	%o5
	add	%l6,	0x0D62,	%g5
	umul	%i3,	0x04ED,	%i6
	sllx	%i2,	0x03,	%o7
	andn	%l4,	0x1F2B,	%g4
	mulscc	%o0,	0x15F9,	%o1
	movre	%i4,	0x055,	%i5
	or	%i1,	%l0,	%g1
	for	%f0,	%f0,	%f2
	sethi	0x0362,	%l1
	smulcc	%g7,	%g2,	%l2
	movg	%icc,	%o4,	%o3
	addcc	%i7,	%o2,	%g3
	edge8n	%o6,	%g6,	%i0
	sdiv	%l3,	0x0743,	%o5
	alignaddr	%l6,	%g5,	%i3
	udivcc	%l5,	0x0F20,	%i2
	st	%f16,	[%l7 + 0x24]
	xor	%o7,	%l4,	%i6
	andn	%g4,	%o1,	%i4
	smul	%i5,	%i1,	%o0
	edge32l	%l0,	%g1,	%g7
	srlx	%l1,	0x0F,	%g2
	or	%o4,	%l2,	%i7
	xnor	%o2,	%g3,	%o6
	mova	%xcc,	%o3,	%i0
	fcmpne32	%f16,	%f28,	%g6
	movg	%icc,	%l3,	%o5
	fcmple32	%f28,	%f18,	%g5
	fexpand	%f14,	%f18
	stx	%l6,	[%l7 + 0x78]
	fmovsg	%icc,	%f24,	%f30
	addcc	%l5,	%i3,	%o7
	sethi	0x1B53,	%l4
	movleu	%icc,	%i6,	%i2
	lduh	[%l7 + 0x3A],	%o1
	save %g4, 0x102F, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i1, %o0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g1,	%g7,	%l1
	sdivx	%l0,	0x12A4,	%g2
	xnor	%l2,	0x095A,	%i7
	umulcc	%o2,	0x020C,	%o4
	andcc	%g3,	0x0067,	%o6
	stx	%i0,	[%l7 + 0x28]
	srl	%o3,	%l3,	%o5
	edge16n	%g5,	%l6,	%l5
	movrlz	%g6,	%o7,	%l4
	fmovrse	%i3,	%f12,	%f19
	edge32	%i2,	%o1,	%g4
	udiv	%i6,	0x05A7,	%i5
	srl	%o0,	%i1,	%g1
	movg	%icc,	%i4,	%g7
	xnorcc	%l0,	0x1F5F,	%g2
	alignaddr	%l1,	%l2,	%o2
	movvc	%xcc,	%i7,	%o4
	edge16n	%g3,	%i0,	%o3
	xor	%o6,	0x07CF,	%l3
	movcs	%xcc,	%g5,	%o5
	fmovsvs	%icc,	%f31,	%f3
	movneg	%xcc,	%l5,	%g6
	move	%icc,	%l6,	%o7
	sdivx	%l4,	0x103F,	%i3
	xorcc	%o1,	%g4,	%i2
	xnor	%i5,	%i6,	%o0
	restore %i1, %g1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	%g2,	%l1
	umulcc	%g7,	%l2,	%o2
	srlx	%o4,	%i7,	%g3
	smul	%i0,	%o3,	%o6
	st	%f28,	[%l7 + 0x18]
	alignaddr	%l3,	%g5,	%o5
	movg	%xcc,	%l5,	%l6
	xnorcc	%g6,	0x149C,	%o7
	umulcc	%i3,	%l4,	%g4
	fmovrdgez	%o1,	%f6,	%f18
	udivx	%i2,	0x1D7D,	%i5
	fnor	%f26,	%f18,	%f0
	edge16ln	%o0,	%i6,	%g1
	or	%i1,	0x0EB5,	%i4
	umul	%g2,	0x1735,	%l0
	fpsub16s	%f29,	%f21,	%f21
	movcc	%xcc,	%l1,	%l2
	st	%f24,	[%l7 + 0x44]
	fmovrsne	%o2,	%f1,	%f24
	udiv	%g7,	0x1C5D,	%o4
	movneg	%icc,	%i7,	%i0
	orcc	%g3,	%o3,	%l3
	edge16n	%g5,	%o6,	%l5
	edge16	%l6,	%o5,	%o7
	mulscc	%i3,	%l4,	%g6
	sll	%o1,	%g4,	%i2
	edge8n	%o0,	%i5,	%g1
	sdiv	%i6,	0x17A1,	%i1
	sethi	0x166F,	%i4
	movpos	%icc,	%g2,	%l1
	stx	%l2,	[%l7 + 0x68]
	popc	0x1B40,	%o2
	fmovsle	%icc,	%f30,	%f22
	ld	[%l7 + 0x6C],	%f2
	subc	%g7,	%o4,	%i7
	move	%icc,	%l0,	%g3
	fmovrde	%i0,	%f30,	%f20
	fpsub16	%f18,	%f2,	%f30
	edge32ln	%o3,	%g5,	%l3
	smul	%o6,	%l5,	%o5
	fpmerge	%f9,	%f6,	%f6
	fmovrdlz	%l6,	%f10,	%f10
	ldd	[%l7 + 0x10],	%o6
	sdiv	%i3,	0x16DA,	%g6
	array32	%l4,	%o1,	%g4
	xor	%o0,	%i5,	%g1
	srl	%i2,	%i1,	%i6
	udiv	%i4,	0x13F7,	%l1
	fmovrsgz	%g2,	%f3,	%f9
	ldsw	[%l7 + 0x18],	%l2
	std	%f20,	[%l7 + 0x78]
	umul	%o2,	0x0F3A,	%g7
	fnot1	%f8,	%f4
	addcc	%i7,	%l0,	%o4
	stb	%g3,	[%l7 + 0x36]
	orcc	%i0,	0x1C43,	%g5
	fcmpgt32	%f26,	%f4,	%o3
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	move	%xcc,	%o5,	%o7
	fpadd32s	%f3,	%f27,	%f19
	sdivx	%i3,	0x118E,	%g6
	smul	%l4,	%o1,	%l6
	sir	0x0912
	movvs	%xcc,	%g4,	%o0
	orn	%g1,	0x1F82,	%i2
	udivx	%i1,	0x134D,	%i6
	array16	%i5,	%l1,	%g2
	restore %l2, 0x16AF, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x20, %i0
	std	%f12,	[%l7 + %i0]
	fmovse	%icc,	%f31,	%f26
	add	%o2,	0x0BDD,	%i7
	movpos	%icc,	%g7,	%l0
	udivx	%o4,	0x07D0,	%g3
	st	%f12,	[%l7 + 0x78]
	st	%f3,	[%l7 + 0x18]
	fmovsleu	%xcc,	%f9,	%f16
	fmovdcc	%icc,	%f1,	%f31
	movl	%icc,	%g5,	%i0
	orn	%o3,	0x1CE3,	%l5
	addc	%l3,	%o5,	%o7
	smul	%i3,	%o6,	%l4
	fmovdvs	%xcc,	%f6,	%f0
	udivcc	%g6,	0x04E6,	%l6
	popc	%o1,	%g4
	sub	%g1,	0x131A,	%i2
	udivx	%o0,	0x1DE7,	%i6
	fmovrdne	%i5,	%f12,	%f2
	xnor	%i1,	%l1,	%g2
	alignaddrl	%i4,	%l2,	%o2
	faligndata	%f30,	%f14,	%f4
	orcc	%i7,	0x1CE2,	%l0
	edge16l	%g7,	%g3,	%g5
	and	%i0,	%o4,	%o3
	subc	%l5,	0x193E,	%o5
	movrne	%l3,	0x1D2,	%o7
	fpadd16	%f22,	%f12,	%f26
	edge16	%i3,	%o6,	%l4
	sdivcc	%g6,	0x09AE,	%o1
	lduh	[%l7 + 0x56],	%g4
	movrlz	%g1,	%i2,	%l6
	addccc	%i6,	0x0939,	%i5
	movvs	%xcc,	%o0,	%i1
	movleu	%icc,	%l1,	%i4
	nop
	set	0x28, %i2
	std	%f30,	[%l7 + %i2]
	smul	%l2,	%o2,	%g2
	ldd	[%l7 + 0x78],	%f26
	movvc	%icc,	%l0,	%i7
	ldd	[%l7 + 0x60],	%g6
	fcmpeq32	%f22,	%f8,	%g3
	movneg	%xcc,	%g5,	%o4
	fmovscs	%icc,	%f18,	%f4
	movcs	%xcc,	%i0,	%l5
	edge16ln	%o5,	%l3,	%o3
	sdivx	%i3,	0x00B2,	%o7
	subc	%l4,	0x1F04,	%o6
	sth	%g6,	[%l7 + 0x28]
	edge8ln	%o1,	%g4,	%i2
	lduh	[%l7 + 0x2C],	%g1
	movrne	%i6,	0x00C,	%i5
	ldub	[%l7 + 0x09],	%l6
	save %o0, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i4,	0x00AF,	%o2
	edge32	%l2,	%l0,	%g2
	addccc	%g7,	0x0D8D,	%g3
	movcs	%xcc,	%i7,	%g5
	popc	%o4,	%l5
	fmovdn	%icc,	%f21,	%f24
	xnorcc	%i0,	%l3,	%o3
	sdiv	%o5,	0x05C6,	%o7
	andncc	%l4,	%o6,	%i3
	edge16ln	%o1,	%g4,	%i2
	movle	%xcc,	%g1,	%i6
	movleu	%xcc,	%g6,	%l6
	edge32ln	%i5,	%o0,	%l1
	array32	%i4,	%i1,	%o2
	edge16ln	%l0,	%g2,	%g7
	nop
	set	0x64, %o7
	lduh	[%l7 + %o7],	%g3
	stb	%i7,	[%l7 + 0x28]
	array16	%g5,	%l2,	%o4
	movrne	%i0,	0x32F,	%l5
	edge32	%l3,	%o3,	%o5
	smulcc	%l4,	0x041B,	%o6
	xorcc	%o7,	0x1F64,	%i3
	movvc	%icc,	%g4,	%o1
	lduh	[%l7 + 0x60],	%i2
	sdivcc	%i6,	0x080A,	%g1
	subccc	%l6,	%i5,	%g6
	sth	%o0,	[%l7 + 0x5A]
	fmovrsne	%i4,	%f20,	%f31
	ldsh	[%l7 + 0x64],	%i1
	movneg	%xcc,	%l1,	%o2
	xnorcc	%g2,	%l0,	%g3
	edge32n	%g7,	%g5,	%i7
	sra	%l2,	%o4,	%l5
	fpadd32s	%f17,	%f26,	%f20
	std	%f0,	[%l7 + 0x58]
	sra	%l3,	0x07,	%o3
	addccc	%o5,	0x0BD2,	%i0
	movvc	%icc,	%l4,	%o6
	nop
	set	0x09, %i7
	ldsb	[%l7 + %i7],	%i3
	fmovrde	%o7,	%f12,	%f2
	ldub	[%l7 + 0x13],	%g4
	udiv	%i2,	0x1107,	%o1
	movrlez	%g1,	0x0C7,	%l6
	subc	%i5,	%g6,	%i6
	fmul8x16	%f16,	%f22,	%f10
	movrlez	%i4,	0x3ED,	%o0
	fnands	%f30,	%f25,	%f26
	andn	%i1,	0x03D6,	%o2
	fmul8x16al	%f24,	%f12,	%f24
	fmovsa	%xcc,	%f16,	%f19
	mulscc	%g2,	0x1566,	%l1
	sdiv	%g3,	0x0A49,	%g7
	movrlez	%l0,	0x101,	%g5
	movg	%xcc,	%l2,	%i7
	fmovrdgez	%l5,	%f18,	%f0
	save %o4, 0x0F2E, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x4A],	%o5
	sub	%i0,	%l4,	%o3
	andncc	%o6,	%o7,	%g4
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f2
	xnor	%i3,	%o1,	%i2
	xorcc	%l6,	0x19A0,	%i5
	ldsb	[%l7 + 0x59],	%g6
	stw	%i6,	[%l7 + 0x64]
	ld	[%l7 + 0x10],	%f2
	ld	[%l7 + 0x7C],	%f27
	addc	%i4,	%g1,	%o0
	movle	%icc,	%i1,	%o2
	alignaddrl	%g2,	%l1,	%g7
	fsrc1s	%f19,	%f7
	fpsub32s	%f3,	%f14,	%f3
	mulx	%l0,	0x130B,	%g3
	ldub	[%l7 + 0x59],	%g5
	fmul8sux16	%f4,	%f6,	%f16
	subcc	%l2,	0x1741,	%i7
	array32	%l5,	%l3,	%o5
	movgu	%xcc,	%o4,	%i0
	sdivcc	%l4,	0x19E3,	%o6
	lduh	[%l7 + 0x18],	%o3
	edge32l	%g4,	%o7,	%o1
	movcs	%icc,	%i3,	%l6
	fandnot1s	%f2,	%f6,	%f23
	alignaddrl	%i5,	%i2,	%i6
	movcc	%icc,	%i4,	%g6
	fmovda	%xcc,	%f26,	%f10
	smulcc	%o0,	0x1117,	%i1
	edge8	%o2,	%g1,	%l1
	popc	%g2,	%l0
	fcmple16	%f14,	%f24,	%g7
	fcmpgt16	%f4,	%f26,	%g5
	movle	%icc,	%g3,	%l2
	orcc	%i7,	%l5,	%l3
	movrlez	%o4,	%i0,	%l4
	fnegs	%f24,	%f21
	ldx	[%l7 + 0x78],	%o6
	fmul8x16au	%f29,	%f26,	%f26
	sir	0x00C8
	edge8l	%o3,	%o5,	%g4
	movrgez	%o1,	0x0B0,	%o7
	movg	%xcc,	%i3,	%l6
	addc	%i2,	%i5,	%i6
	movcs	%xcc,	%g6,	%o0
	movg	%xcc,	%i1,	%i4
	movpos	%xcc,	%o2,	%l1
	movle	%icc,	%g2,	%g1
	st	%f9,	[%l7 + 0x50]
	edge16n	%g7,	%g5,	%g3
	fcmpne16	%f0,	%f22,	%l2
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	xorcc	%o4,	0x1D60,	%i0
	bshuffle	%f4,	%f18,	%f26
	fmovrde	%l4,	%f6,	%f4
	udiv	%o6,	0x0DA9,	%o3
	xnor	%l3,	0x1332,	%o5
	fmovdn	%xcc,	%f6,	%f28
	add	%o1,	0x022B,	%g4
	stx	%o7,	[%l7 + 0x38]
	fnegs	%f11,	%f26
	movrgz	%i3,	0x1F2,	%i2
	edge32l	%i5,	%l6,	%g6
	popc	%i6,	%o0
	andcc	%i4,	0x1208,	%i1
	sra	%o2,	%g2,	%l1
	sll	%g7,	0x1B,	%g5
	std	%f18,	[%l7 + 0x30]
	movrlez	%g3,	0x229,	%g1
	fzeros	%f20
	movcc	%icc,	%l2,	%i7
	mulscc	%l5,	%o4,	%i0
	edge8ln	%l0,	%l4,	%o3
	st	%f22,	[%l7 + 0x40]
	st	%f0,	[%l7 + 0x28]
	restore %l3, %o6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o5,	%o7,	%g4
	lduw	[%l7 + 0x40],	%i3
	andn	%i2,	%l6,	%g6
	movge	%xcc,	%i6,	%i5
	movle	%icc,	%o0,	%i1
	andncc	%o2,	%g2,	%l1
	ld	[%l7 + 0x7C],	%f27
	udiv	%i4,	0x17E4,	%g5
	fxnor	%f20,	%f10,	%f10
	fmovscs	%icc,	%f24,	%f19
	movvc	%icc,	%g7,	%g3
	or	%g1,	0x1632,	%l2
	fmovdcs	%icc,	%f25,	%f18
	ldx	[%l7 + 0x68],	%i7
	xorcc	%l5,	%i0,	%o4
	sth	%l0,	[%l7 + 0x7C]
	array8	%o3,	%l3,	%l4
	edge8l	%o6,	%o1,	%o7
	srax	%o5,	%g4,	%i2
	popc	0x15C3,	%l6
	fmovdle	%icc,	%f7,	%f14
	movneg	%icc,	%g6,	%i6
	st	%f28,	[%l7 + 0x18]
	save %i5, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f9,	%f17
	fmovsle	%icc,	%f4,	%f14
	movcc	%xcc,	%i3,	%g2
	movg	%xcc,	%o2,	%l1
	movrgez	%g5,	0x07C,	%g7
	umulcc	%g3,	0x0BCA,	%i4
	edge32n	%g1,	%i7,	%l2
	ldd	[%l7 + 0x48],	%f0
	movneg	%icc,	%i0,	%l5
	srlx	%l0,	%o4,	%o3
	ldsb	[%l7 + 0x19],	%l4
	fmovdvc	%xcc,	%f27,	%f12
	orncc	%l3,	0x07C0,	%o1
	movrgez	%o7,	%o6,	%g4
	sdivx	%o5,	0x14FF,	%l6
	andn	%i2,	%g6,	%i5
	fcmped	%fcc3,	%f24,	%f2
	movvc	%xcc,	%i6,	%o0
	and	%i1,	%g2,	%i3
	movleu	%xcc,	%o2,	%l1
	xor	%g5,	0x1C3A,	%g3
	fmul8sux16	%f4,	%f26,	%f12
	edge32	%g7,	%g1,	%i7
	ldx	[%l7 + 0x50],	%i4
	alignaddr	%i0,	%l2,	%l5
	xnor	%l0,	0x1EA5,	%o3
	fmovdge	%icc,	%f15,	%f22
	ld	[%l7 + 0x4C],	%f13
	fmovdne	%icc,	%f8,	%f18
	srl	%o4,	%l4,	%l3
	ldsh	[%l7 + 0x50],	%o7
	fmovrslz	%o6,	%f12,	%f27
	array32	%o1,	%o5,	%g4
	fmovda	%icc,	%f24,	%f23
	sdiv	%l6,	0x0C83,	%i2
	for	%f4,	%f0,	%f10
	udiv	%g6,	0x0C63,	%i6
	ldsh	[%l7 + 0x5E],	%i5
	edge32n	%o0,	%g2,	%i1
	srlx	%o2,	%l1,	%i3
	movgu	%icc,	%g3,	%g7
	move	%xcc,	%g1,	%g5
	fzeros	%f25
	fmovdle	%icc,	%f18,	%f18
	stx	%i4,	[%l7 + 0x18]
	udivcc	%i0,	0x0A32,	%l2
	andncc	%l5,	%l0,	%o3
	movle	%icc,	%i7,	%l4
	fmovsa	%xcc,	%f5,	%f9
	edge16	%l3,	%o4,	%o6
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%o6
	popc	%o5,	%g4
	edge32n	%o1,	%i2,	%g6
	umulcc	%i6,	%l6,	%i5
	edge8l	%g2,	%o0,	%i1
	sub	%l1,	%i3,	%o2
	edge16l	%g7,	%g3,	%g5
	xorcc	%i4,	%i0,	%g1
	edge32ln	%l2,	%l5,	%l0
	movneg	%icc,	%i7,	%l4
	edge8l	%l3,	%o4,	%o3
	sth	%o6,	[%l7 + 0x48]
	fmovdne	%xcc,	%f8,	%f15
	edge32ln	%o5,	%g4,	%o7
	alignaddr	%i2,	%o1,	%i6
	subc	%g6,	0x02BD,	%i5
	edge8n	%l6,	%g2,	%i1
	fsrc2s	%f23,	%f6
	sethi	0x0D0B,	%l1
	srlx	%i3,	%o2,	%g7
	movgu	%xcc,	%g3,	%g5
	fmovsneg	%xcc,	%f14,	%f0
	fzero	%f4
	ldub	[%l7 + 0x71],	%o0
	sll	%i0,	0x1D,	%g1
	ld	[%l7 + 0x3C],	%f26
	edge8l	%l2,	%l5,	%l0
	sir	0x1FE4
	movle	%icc,	%i7,	%i4
	stw	%l4,	[%l7 + 0x50]
	bshuffle	%f4,	%f10,	%f14
	edge8	%o4,	%l3,	%o3
	alignaddr	%o5,	%g4,	%o6
	ldx	[%l7 + 0x20],	%o7
	alignaddr	%o1,	%i2,	%i6
	ld	[%l7 + 0x78],	%f2
	ldd	[%l7 + 0x20],	%f0
	std	%f8,	[%l7 + 0x08]
	fmovscc	%icc,	%f3,	%f3
	edge16l	%i5,	%l6,	%g6
	movge	%xcc,	%i1,	%g2
	mova	%xcc,	%i3,	%o2
	alignaddr	%g7,	%l1,	%g3
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	sth	%g1,	[%l7 + 0x60]
	fmovrse	%l5,	%f11,	%f28
	fmovrdlez	%l2,	%f12,	%f4
	movcc	%xcc,	%i7,	%l0
	movvs	%xcc,	%i4,	%o4
	pdist	%f4,	%f16,	%f0
	st	%f30,	[%l7 + 0x40]
	fandnot2	%f10,	%f28,	%f4
	edge8n	%l3,	%l4,	%o3
	mulscc	%o5,	0x0C01,	%o6
	fnand	%f20,	%f28,	%f6
	mova	%xcc,	%o7,	%g4
	nop
	set	0x18, %o4
	ldsw	[%l7 + %o4],	%o1
	movl	%icc,	%i6,	%i5
	movvc	%icc,	%l6,	%g6
	edge8n	%i2,	%i1,	%i3
	edge8n	%o2,	%g7,	%g2
	smulcc	%l1,	0x07F1,	%g5
	andcc	%g3,	0x1131,	%i0
	edge8n	%g1,	%l5,	%l2
	fone	%f6
	alignaddrl	%o0,	%i7,	%l0
	srax	%i4,	0x11,	%o4
	udivcc	%l4,	0x04A7,	%o3
	ldub	[%l7 + 0x14],	%l3
	edge16n	%o5,	%o6,	%g4
	edge8n	%o1,	%o7,	%i6
	movneg	%icc,	%l6,	%g6
	fcmps	%fcc3,	%f15,	%f0
	udivcc	%i5,	0x1238,	%i1
	fmovrsne	%i3,	%f0,	%f6
	addc	%o2,	0x1C8B,	%i2
	subcc	%g2,	%l1,	%g7
	orn	%g5,	0x0F49,	%g3
	fxnors	%f2,	%f28,	%f2
	fmovdpos	%xcc,	%f27,	%f19
	xor	%i0,	%g1,	%l5
	movl	%icc,	%o0,	%l2
	movcs	%xcc,	%i7,	%i4
	addccc	%l0,	0x0125,	%l4
	fcmpne32	%f24,	%f28,	%o3
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%o4
	array8	%l3,	%o5,	%o6
	stb	%g4,	[%l7 + 0x10]
	fnegd	%f18,	%f4
	sdivcc	%o7,	0x14FA,	%i6
	fmul8sux16	%f8,	%f22,	%f18
	fmovrsgz	%o1,	%f17,	%f6
	stx	%l6,	[%l7 + 0x48]
	movcs	%xcc,	%g6,	%i5
	fmovsgu	%icc,	%f15,	%f3
	movneg	%icc,	%i3,	%o2
	umul	%i2,	%g2,	%l1
	alignaddr	%i1,	%g5,	%g7
	ldd	[%l7 + 0x20],	%f22
	alignaddr	%i0,	%g3,	%g1
	lduh	[%l7 + 0x72],	%o0
	fexpand	%f18,	%f26
	fmul8x16au	%f16,	%f14,	%f8
	fmovspos	%icc,	%f28,	%f11
	srlx	%l5,	%i7,	%l2
	addc	%i4,	%l4,	%o3
	sll	%l0,	%l3,	%o5
	ldsb	[%l7 + 0x75],	%o6
	fnor	%f12,	%f24,	%f22
	mulscc	%g4,	0x1B5C,	%o4
	fpadd16	%f18,	%f26,	%f6
	sra	%i6,	%o7,	%o1
	movrne	%g6,	%i5,	%i3
	ldsh	[%l7 + 0x6A],	%o2
	movvs	%xcc,	%i2,	%l6
	fmovdg	%xcc,	%f28,	%f1
	sdiv	%l1,	0x03CD,	%g2
	fmovs	%f2,	%f4
	ldx	[%l7 + 0x38],	%g5
	movge	%xcc,	%i1,	%g7
	sra	%i0,	0x0A,	%g1
	subcc	%o0,	0x1E6F,	%g3
	alignaddr	%l5,	%i7,	%l2
	fors	%f12,	%f24,	%f15
	fcmple16	%f22,	%f6,	%i4
	orn	%l4,	%l0,	%o3
	mulx	%l3,	0x0B6E,	%o6
	sth	%o5,	[%l7 + 0x7E]
	subc	%g4,	%i6,	%o7
	fpsub32s	%f3,	%f17,	%f8
	edge16	%o1,	%g6,	%i5
	movne	%icc,	%i3,	%o2
	save %i2, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f13,	%f19,	%f16
	movrne	%g2,	%g5,	%i1
	fmovrde	%g7,	%f22,	%f22
	subccc	%i0,	%g1,	%o0
	movcs	%icc,	%g3,	%l5
	fabsd	%f4,	%f28
	srax	%l1,	%i7,	%i4
	orn	%l4,	%l2,	%l0
	movrlz	%o3,	0x283,	%l3
	ldub	[%l7 + 0x78],	%o5
	lduw	[%l7 + 0x2C],	%o6
	edge16l	%i6,	%o7,	%o1
	orcc	%g4,	0x0820,	%g6
	mulscc	%i3,	%o2,	%i5
	edge32	%l6,	%i2,	%o4
	smul	%g5,	0x157F,	%i1
	movrgz	%g2,	0x090,	%g7
	movrgz	%i0,	%o0,	%g1
	movge	%xcc,	%g3,	%l1
	or	%l5,	0x06DE,	%i4
	mulscc	%l4,	%l2,	%l0
	movcs	%xcc,	%o3,	%l3
	movrgz	%i7,	%o6,	%o5
	umulcc	%o7,	%i6,	%g4
	movle	%icc,	%g6,	%o1
	fmovscs	%xcc,	%f5,	%f12
	movrne	%o2,	0x3F7,	%i5
	array8	%i3,	%i2,	%o4
	edge32n	%g5,	%l6,	%i1
	fmovsleu	%icc,	%f6,	%f7
	sdivcc	%g2,	0x0868,	%i0
	mulx	%g7,	%o0,	%g1
	udivx	%g3,	0x16A7,	%l1
	addccc	%l5,	%i4,	%l2
	nop
	set	0x58, %g2
	stw	%l4,	[%l7 + %g2]
	edge8	%o3,	%l3,	%l0
	ldx	[%l7 + 0x18],	%i7
	ldsb	[%l7 + 0x63],	%o6
	fmovrsgez	%o7,	%f17,	%f19
	srlx	%i6,	%o5,	%g4
	movcc	%xcc,	%g6,	%o1
	alignaddrl	%o2,	%i3,	%i5
	fzero	%f18
	fcmpeq32	%f0,	%f12,	%o4
	umul	%g5,	%i2,	%l6
	movcc	%icc,	%g2,	%i0
	save %i1, 0x0A6A, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g1,	[%l7 + 0x6C]
	edge8l	%g7,	%l1,	%g3
	fcmpgt16	%f4,	%f16,	%l5
	srl	%l2,	0x13,	%i4
	umulcc	%o3,	0x038D,	%l4
	fmovscs	%xcc,	%f29,	%f16
	andcc	%l0,	0x1CD1,	%l3
	movrgez	%o6,	0x1FF,	%i7
	orncc	%i6,	%o5,	%o7
	fxor	%f28,	%f22,	%f22
	sdivx	%g4,	0x02D8,	%o1
	fmovscc	%xcc,	%f27,	%f12
	edge16n	%g6,	%i3,	%o2
	movne	%icc,	%i5,	%g5
	orcc	%o4,	0x1A81,	%l6
	srax	%i2,	%g2,	%i0
	edge32l	%i1,	%g1,	%g7
	std	%f2,	[%l7 + 0x50]
	fpsub16s	%f31,	%f18,	%f7
	ld	[%l7 + 0x0C],	%f26
	fmovdl	%xcc,	%f2,	%f18
	movrne	%o0,	0x30B,	%l1
	fandnot2	%f0,	%f6,	%f26
	edge8	%g3,	%l5,	%i4
	fornot1	%f0,	%f28,	%f4
	stx	%o3,	[%l7 + 0x38]
	edge16	%l2,	%l0,	%l4
	ld	[%l7 + 0x6C],	%f21
	fmovsvs	%icc,	%f17,	%f28
	edge8n	%l3,	%i7,	%i6
	orncc	%o5,	0x0E0C,	%o6
	mova	%icc,	%g4,	%o1
	edge16l	%g6,	%o7,	%o2
	edge8n	%i3,	%i5,	%g5
	xnor	%l6,	0x168F,	%o4
	popc	%g2,	%i2
	srl	%i0,	0x1E,	%i1
	xnor	%g7,	0x0F0E,	%o0
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%g0
	edge16n	%l1,	%l5,	%g3
	mulx	%i4,	0x1D46,	%l2
	sth	%o3,	[%l7 + 0x48]
	xorcc	%l0,	%l3,	%l4
	fmovsvc	%xcc,	%f22,	%f0
	subcc	%i6,	0x0502,	%i7
	addccc	%o6,	0x0538,	%o5
	fmuld8sux16	%f26,	%f11,	%f20
	lduh	[%l7 + 0x0A],	%o1
	addcc	%g6,	%g4,	%o7
	addccc	%i3,	0x15E7,	%i5
	fnors	%f15,	%f21,	%f25
	fcmpd	%fcc0,	%f12,	%f14
	edge8	%g5,	%o2,	%o4
	fmovsa	%xcc,	%f27,	%f7
	fnegs	%f16,	%f5
	save %g2, 0x0F3B, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%i0
	movle	%xcc,	%i1,	%g7
	fcmpne32	%f22,	%f24,	%o0
	ldd	[%l7 + 0x28],	%g0
	andncc	%l1,	%l5,	%l6
	xor	%g3,	%l2,	%o3
	ldx	[%l7 + 0x60],	%i4
	fands	%f29,	%f7,	%f11
	sdivx	%l3,	0x1F25,	%l0
	fcmpes	%fcc2,	%f3,	%f27
	srax	%i6,	0x05,	%l4
	fandnot2	%f0,	%f8,	%f14
	ldsw	[%l7 + 0x5C],	%o6
	edge8ln	%o5,	%i7,	%o1
	array32	%g6,	%o7,	%i3
	edge32ln	%g4,	%i5,	%g5
	srlx	%o4,	0x09,	%g2
	udiv	%i2,	0x0356,	%o2
	fcmpd	%fcc1,	%f26,	%f14
	edge8l	%i0,	%i1,	%g7
	ldd	[%l7 + 0x20],	%o0
	andn	%l1,	0x077F,	%l5
	fsrc1	%f18,	%f10
	srax	%g1,	0x10,	%g3
	mulscc	%l6,	%l2,	%i4
	movle	%icc,	%o3,	%l0
	fmovse	%icc,	%f31,	%f4
	edge8	%i6,	%l4,	%o6
	lduh	[%l7 + 0x6A],	%o5
	addccc	%i7,	0x0793,	%o1
	lduh	[%l7 + 0x40],	%g6
	stb	%o7,	[%l7 + 0x65]
	subcc	%i3,	0x0A84,	%l3
	ldsw	[%l7 + 0x64],	%g4
	ldx	[%l7 + 0x08],	%g5
	restore %i5, 0x0DB9, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f13,	%f8
	nop
	set	0x7C, %o5
	ldsh	[%l7 + %o5],	%i2
	faligndata	%f12,	%f12,	%f18
	movcs	%icc,	%o2,	%i0
	ldub	[%l7 + 0x26],	%i1
	fcmpne16	%f30,	%f18,	%g2
	fcmpne32	%f30,	%f24,	%o0
	movcs	%xcc,	%l1,	%l5
	fmul8x16	%f3,	%f18,	%f18
	movvc	%xcc,	%g7,	%g3
	orcc	%g1,	%l6,	%i4
	umulcc	%o3,	0x1DBF,	%l0
	array32	%i6,	%l4,	%o6
	subc	%o5,	%i7,	%l2
	array32	%g6,	%o1,	%o7
	movvc	%xcc,	%i3,	%l3
	edge8	%g4,	%i5,	%g5
	stw	%i2,	[%l7 + 0x2C]
	fmovsl	%xcc,	%f0,	%f12
	movrgez	%o4,	0x1CC,	%i0
	subc	%i1,	%g2,	%o0
	movleu	%xcc,	%o2,	%l1
	edge16	%g7,	%g3,	%g1
	andcc	%l5,	%i4,	%o3
	fmovsvs	%xcc,	%f8,	%f17
	fexpand	%f6,	%f0
	sth	%l0,	[%l7 + 0x0E]
	addcc	%l6,	%i6,	%l4
	subc	%o6,	%i7,	%o5
	fcmpgt16	%f14,	%f22,	%l2
	movneg	%xcc,	%g6,	%o7
	sub	%i3,	0x0A15,	%o1
	ldd	[%l7 + 0x58],	%f4
	fmovsgu	%xcc,	%f8,	%f4
	fsrc2s	%f17,	%f13
	mulx	%g4,	%i5,	%g5
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	movne	%xcc,	%o4,	%g2
	movle	%icc,	%o0,	%o2
	movcc	%icc,	%i1,	%l1
	smul	%g7,	0x0788,	%g3
	or	%l5,	%i4,	%o3
	add	%l0,	0x12AC,	%l6
	or	%i6,	%l4,	%o6
	fpadd32	%f10,	%f0,	%f4
	srax	%g1,	%i7,	%l2
	andcc	%g6,	%o7,	%o5
	ldd	[%l7 + 0x48],	%f4
	stx	%o1,	[%l7 + 0x70]
	fornot2	%f4,	%f28,	%f18
	fmovdg	%xcc,	%f17,	%f31
	stx	%i3,	[%l7 + 0x30]
	sdivcc	%g4,	0x1539,	%g5
	or	%l3,	0x1EE7,	%i2
	fcmpne32	%f10,	%f26,	%i0
	ldub	[%l7 + 0x46],	%o4
	movl	%icc,	%i5,	%o0
	xorcc	%g2,	0x1875,	%o2
	orn	%i1,	%l1,	%g7
	srlx	%g3,	0x15,	%i4
	edge8	%l5,	%l0,	%l6
	xnorcc	%i6,	0x14FD,	%l4
	movvs	%icc,	%o6,	%g1
	sir	0x017C
	faligndata	%f0,	%f26,	%f6
	std	%f6,	[%l7 + 0x20]
	mulx	%i7,	0x01B3,	%o3
	srl	%l2,	%g6,	%o5
	or	%o1,	0x1AF1,	%o7
	edge8ln	%i3,	%g4,	%g5
	mulscc	%i2,	%i0,	%o4
	edge8ln	%l3,	%i5,	%g2
	array8	%o0,	%o2,	%l1
	fmovdvc	%xcc,	%f9,	%f31
	add	%i1,	0x1F39,	%g7
	sdivx	%g3,	0x1151,	%l5
	fmovrslz	%l0,	%f6,	%f21
	edge8l	%i4,	%l6,	%i6
	subccc	%l4,	0x1E9F,	%o6
	addcc	%i7,	%o3,	%g1
	fornot2	%f14,	%f14,	%f2
	mova	%icc,	%l2,	%g6
	stw	%o5,	[%l7 + 0x54]
	movrlez	%o1,	%o7,	%g4
	movg	%xcc,	%g5,	%i2
	movrgz	%i3,	%i0,	%l3
	or	%i5,	0x0117,	%o4
	fpackfix	%f0,	%f3
	udivx	%g2,	0x1886,	%o2
	edge8l	%o0,	%i1,	%g7
	fcmpgt16	%f24,	%f26,	%g3
	movle	%xcc,	%l1,	%l5
	mulscc	%l0,	0x01EA,	%i4
	sethi	0x17D2,	%i6
	orn	%l6,	0x0BAB,	%l4
	edge8ln	%i7,	%o6,	%g1
	fmovdneg	%icc,	%f1,	%f28
	fmovrsgez	%o3,	%f19,	%f23
	movrlez	%g6,	%l2,	%o1
	orcc	%o7,	%o5,	%g5
	edge16	%i2,	%g4,	%i3
	udivcc	%l3,	0x1B23,	%i0
	ldsb	[%l7 + 0x6C],	%i5
	edge32ln	%o4,	%o2,	%g2
	subc	%o0,	%g7,	%g3
	fxnors	%f5,	%f9,	%f12
	sir	0x1782
	movcs	%icc,	%i1,	%l5
	movge	%icc,	%l1,	%l0
	movle	%icc,	%i4,	%i6
	fcmpgt16	%f18,	%f2,	%l6
	array8	%l4,	%o6,	%g1
	sub	%o3,	0x0E21,	%g6
	movcc	%xcc,	%i7,	%l2
	fsrc1s	%f13,	%f21
	edge32	%o1,	%o5,	%g5
	fmovd	%f24,	%f28
	ldx	[%l7 + 0x18],	%o7
	movcs	%icc,	%i2,	%i3
	movrne	%g4,	%l3,	%i0
	udivx	%o4,	0x0814,	%i5
	nop
	set	0x28, %o2
	lduh	[%l7 + %o2],	%g2
	orncc	%o0,	%o2,	%g7
	array16	%g3,	%l5,	%i1
	fcmps	%fcc2,	%f2,	%f30
	fands	%f15,	%f2,	%f28
	addcc	%l1,	0x07F5,	%l0
	fands	%f5,	%f7,	%f9
	movvc	%xcc,	%i4,	%l6
	movrlz	%l4,	0x1DF,	%i6
	restore %o6, 0x0567, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g6,	%i7,	%l2
	popc	0x0DAF,	%o1
	movrne	%g1,	%o5,	%g5
	alignaddr	%i2,	%i3,	%g4
	sllx	%l3,	0x01,	%i0
	fnot1s	%f5,	%f15
	ld	[%l7 + 0x74],	%f25
	ldsw	[%l7 + 0x1C],	%o7
	andncc	%i5,	%o4,	%g2
	alignaddr	%o2,	%g7,	%g3
	movn	%xcc,	%l5,	%o0
	edge32	%i1,	%l0,	%l1
	fsrc2s	%f16,	%f4
	edge8l	%i4,	%l6,	%i6
	orncc	%l4,	0x044E,	%o3
	fmovsn	%icc,	%f24,	%f29
	fmovspos	%icc,	%f21,	%f3
	edge32	%g6,	%o6,	%i7
	fnot1s	%f3,	%f6
	lduh	[%l7 + 0x7E],	%o1
	fpadd16s	%f4,	%f28,	%f8
	fmovspos	%icc,	%f19,	%f7
	ldsb	[%l7 + 0x6D],	%g1
	add	%l2,	%g5,	%i2
	smulcc	%i3,	0x004F,	%g4
	movn	%icc,	%l3,	%o5
	array32	%o7,	%i0,	%o4
	ldsw	[%l7 + 0x78],	%i5
	array8	%o2,	%g2,	%g7
	sra	%g3,	%o0,	%l5
	ldsw	[%l7 + 0x08],	%i1
	fmovscs	%xcc,	%f5,	%f13
	fmovs	%f11,	%f22
	movl	%xcc,	%l0,	%l1
	fmovsgu	%icc,	%f1,	%f12
	movg	%xcc,	%l6,	%i6
	movpos	%xcc,	%i4,	%l4
	orcc	%o3,	%o6,	%g6
	movn	%xcc,	%o1,	%i7
	movrlez	%l2,	0x14D,	%g1
	ldx	[%l7 + 0x10],	%i2
	movrlez	%i3,	0x276,	%g5
	movvs	%xcc,	%g4,	%o5
	fnand	%f2,	%f28,	%f2
	srl	%o7,	%l3,	%o4
	srax	%i0,	%o2,	%i5
	fmovdge	%icc,	%f10,	%f26
	udivcc	%g7,	0x0F73,	%g3
	add	%g2,	0x0238,	%l5
	edge32	%o0,	%l0,	%l1
	edge8ln	%l6,	%i1,	%i6
	fmovrse	%i4,	%f3,	%f4
	movcs	%icc,	%l4,	%o6
	array32	%o3,	%g6,	%i7
	edge8	%l2,	%g1,	%o1
	andn	%i3,	%g5,	%g4
	fnot2	%f0,	%f30
	smulcc	%o5,	%i2,	%o7
	ldx	[%l7 + 0x28],	%l3
	movgu	%icc,	%o4,	%i0
	ldsw	[%l7 + 0x44],	%i5
	movrlez	%g7,	0x1A4,	%o2
	save %g3, 0x1244, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o0,	%l5,	%l1
	fmovdgu	%xcc,	%f12,	%f3
	std	%f2,	[%l7 + 0x78]
	sir	0x12B2
	orn	%l0,	%l6,	%i6
	sra	%i4,	%i1,	%o6
	ldub	[%l7 + 0x39],	%o3
	fmul8x16au	%f26,	%f15,	%f20
	sir	0x1FAA
	movrgez	%l4,	0x258,	%i7
	subccc	%l2,	0x009C,	%g1
	fmovdl	%xcc,	%f5,	%f29
	add	%o1,	0x0F39,	%i3
	fpmerge	%f31,	%f28,	%f0
	xnor	%g6,	0x0BA8,	%g5
	movcc	%xcc,	%o5,	%i2
	alignaddr	%o7,	%l3,	%o4
	subcc	%g4,	%i5,	%g7
	sethi	0x029D,	%i0
	sdivcc	%o2,	0x0C84,	%g3
	movrlez	%g2,	%l5,	%o0
	fpsub16s	%f25,	%f11,	%f15
	addc	%l1,	%l6,	%l0
	or	%i4,	%i6,	%o6
	alignaddr	%i1,	%l4,	%i7
	ldub	[%l7 + 0x2D],	%o3
	array16	%l2,	%o1,	%i3
	udivx	%g1,	0x04E0,	%g6
	move	%icc,	%g5,	%o5
	movn	%icc,	%o7,	%i2
	ldsw	[%l7 + 0x7C],	%l3
	sdiv	%g4,	0x1BA0,	%o4
	srax	%g7,	0x0F,	%i0
	fmovdleu	%xcc,	%f24,	%f11
	edge8ln	%i5,	%g3,	%o2
	addccc	%g2,	%l5,	%l1
	ldsb	[%l7 + 0x69],	%o0
	smulcc	%l6,	%l0,	%i6
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	xnor	%i7,	0x00C2,	%o3
	movleu	%xcc,	%l4,	%l2
	fpmerge	%f6,	%f2,	%f4
	movleu	%xcc,	%i3,	%g1
	array8	%o1,	%g6,	%g5
	sth	%o7,	[%l7 + 0x10]
	sdivcc	%o5,	0x038B,	%l3
	andn	%i2,	0x0CE5,	%g4
	orn	%g7,	0x0209,	%i0
	movrgz	%i5,	0x18F,	%g3
	movrgez	%o2,	0x1DD,	%g2
	stw	%o4,	[%l7 + 0x64]
	save %l5, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l6,	0x1AC8,	%l0
	fmovsl	%xcc,	%f10,	%f25
	std	%f12,	[%l7 + 0x60]
	fpmerge	%f29,	%f2,	%f12
	movrlez	%i4,	0x05F,	%o6
	fmul8sux16	%f14,	%f12,	%f10
	movrlz	%i1,	0x20F,	%i6
	edge32l	%o3,	%i7,	%l2
	srax	%i3,	%g1,	%o1
	mova	%icc,	%l4,	%g6
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f22
	ld	[%l7 + 0x14],	%f23
	orncc	%o7,	0x017C,	%g5
	movge	%xcc,	%l3,	%i2
	fmovrdgz	%g4,	%f26,	%f6
	subcc	%o5,	0x0A55,	%g7
	movl	%xcc,	%i0,	%i5
	srl	%o2,	%g3,	%g2
	movcc	%icc,	%l5,	%o4
	edge32l	%l1,	%o0,	%l0
	sdivx	%i4,	0x09A4,	%l6
	nop
	set	0x0C, %l3
	lduh	[%l7 + %l3],	%i1
	sub	%i6,	%o3,	%o6
	std	%f12,	[%l7 + 0x40]
	udiv	%i7,	0x1A70,	%i3
	fnot2s	%f0,	%f20
	andncc	%l2,	%g1,	%o1
	or	%l4,	0x1540,	%o7
	srl	%g6,	%l3,	%g5
	mulx	%i2,	%g4,	%g7
	lduh	[%l7 + 0x38],	%o5
	andncc	%i0,	%o2,	%i5
	smul	%g2,	%l5,	%o4
	xorcc	%l1,	%o0,	%l0
	movvc	%xcc,	%g3,	%i4
	andn	%l6,	0x1E7A,	%i6
	add	%i1,	%o3,	%i7
	subccc	%o6,	0x0E9C,	%l2
	alignaddr	%i3,	%g1,	%l4
	sra	%o7,	%o1,	%g6
	addcc	%l3,	%i2,	%g4
	fmovrdne	%g5,	%f20,	%f14
	fmovdleu	%xcc,	%f4,	%f4
	st	%f30,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x6C],	%o5
	edge8n	%i0,	%o2,	%i5
	for	%f22,	%f30,	%f8
	edge32n	%g2,	%g7,	%l5
	fpadd16s	%f0,	%f14,	%f31
	orn	%o4,	%l1,	%l0
	ldd	[%l7 + 0x60],	%f8
	fmul8sux16	%f12,	%f18,	%f12
	edge16n	%o0,	%g3,	%i4
	alignaddr	%l6,	%i6,	%i1
	ldsw	[%l7 + 0x30],	%o3
	sub	%o6,	0x05C9,	%l2
	andncc	%i7,	%i3,	%l4
	move	%xcc,	%g1,	%o1
	movpos	%xcc,	%g6,	%l3
	orn	%i2,	%o7,	%g5
	fnot1s	%f6,	%f1
	fcmpd	%fcc1,	%f6,	%f24
	addccc	%o5,	0x0273,	%g4
	movgu	%xcc,	%o2,	%i0
	ldsh	[%l7 + 0x16],	%i5
	stb	%g2,	[%l7 + 0x52]
	mulx	%l5,	0x0E3D,	%o4
	andncc	%g7,	%l1,	%o0
	ldub	[%l7 + 0x6C],	%g3
	save %i4, %l0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i1,	%l6,	%o6
	subc	%o3,	0x00B7,	%i7
	std	%f6,	[%l7 + 0x20]
	popc	%i3,	%l2
	stx	%g1,	[%l7 + 0x30]
	fpsub16	%f4,	%f20,	%f26
	addc	%l4,	%o1,	%g6
	edge32ln	%l3,	%o7,	%i2
	fnot1s	%f0,	%f21
	subccc	%o5,	0x00D3,	%g4
	ldub	[%l7 + 0x18],	%g5
	fmovse	%icc,	%f21,	%f7
	movne	%xcc,	%o2,	%i0
	subc	%g2,	0x0936,	%l5
	xorcc	%o4,	%g7,	%i5
	fcmpes	%fcc0,	%f19,	%f13
	move	%icc,	%o0,	%g3
	popc	0x1703,	%l1
	fcmple16	%f12,	%f16,	%l0
	movrne	%i4,	0x017,	%i6
	nop
	set	0x16, %o6
	ldsh	[%l7 + %o6],	%l6
	ldx	[%l7 + 0x30],	%o6
	xor	%i1,	0x0259,	%o3
	fnot2s	%f5,	%f11
	ldsh	[%l7 + 0x24],	%i7
	array8	%i3,	%l2,	%l4
	xorcc	%g1,	%g6,	%o1
	movne	%icc,	%o7,	%i2
	movpos	%xcc,	%o5,	%g4
	fcmps	%fcc2,	%f30,	%f17
	edge8	%l3,	%g5,	%i0
	fnegs	%f29,	%f16
	fcmple16	%f14,	%f30,	%g2
	xnorcc	%o2,	0x089F,	%o4
	umul	%l5,	0x0E78,	%g7
	srl	%o0,	%i5,	%g3
	fnors	%f5,	%f27,	%f17
	stb	%l0,	[%l7 + 0x76]
	siam	0x2
	udivcc	%i4,	0x001D,	%l1
	fcmpgt16	%f24,	%f28,	%l6
	subc	%o6,	0x0A43,	%i6
	movrgez	%o3,	0x0E5,	%i7
	edge8l	%i1,	%l2,	%i3
	array32	%g1,	%l4,	%o1
	movl	%xcc,	%o7,	%g6
	fmovrsgez	%o5,	%f1,	%f30
	fxnor	%f12,	%f0,	%f12
	movgu	%xcc,	%i2,	%g4
	ldsb	[%l7 + 0x7B],	%g5
	mova	%xcc,	%l3,	%g2
	xorcc	%i0,	%o4,	%o2
	movneg	%xcc,	%l5,	%o0
	sllx	%g7,	0x03,	%g3
	xnor	%l0,	%i5,	%l1
	edge16l	%i4,	%l6,	%i6
	addcc	%o6,	0x1726,	%o3
	movre	%i7,	0x07E,	%l2
	nop
	set	0x3C, %i6
	ldsh	[%l7 + %i6],	%i3
	std	%f26,	[%l7 + 0x38]
	mulscc	%i1,	0x00DB,	%l4
	mulscc	%o1,	0x13B3,	%g1
	movleu	%icc,	%g6,	%o7
	fandnot2	%f2,	%f10,	%f10
	stx	%o5,	[%l7 + 0x28]
	edge8n	%g4,	%g5,	%l3
	fandnot1	%f14,	%f28,	%f26
	sth	%g2,	[%l7 + 0x42]
	sll	%i2,	0x07,	%i0
	stw	%o2,	[%l7 + 0x10]
	orncc	%l5,	0x0530,	%o4
	fmovdn	%icc,	%f7,	%f13
	umulcc	%g7,	%o0,	%l0
	edge8	%i5,	%l1,	%g3
	edge8ln	%i4,	%i6,	%l6
	orn	%o6,	%i7,	%o3
	ldd	[%l7 + 0x28],	%f12
	lduh	[%l7 + 0x36],	%l2
	move	%xcc,	%i1,	%i3
	ldsh	[%l7 + 0x6E],	%o1
	edge8l	%l4,	%g1,	%o7
	fones	%f5
	fmovdl	%xcc,	%f14,	%f1
	mulscc	%g6,	0x115B,	%g4
	movg	%icc,	%o5,	%l3
	sth	%g5,	[%l7 + 0x50]
	stx	%i2,	[%l7 + 0x28]
	movrlez	%i0,	0x11C,	%g2
	fmovdg	%xcc,	%f18,	%f22
	popc	0x0CB7,	%l5
	sllx	%o4,	0x06,	%g7
	udivx	%o0,	0x11E6,	%o2
	fmovsg	%icc,	%f3,	%f1
	fsrc1s	%f27,	%f16
	restore %i5, %l1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i4,	0x0A8E,	%l0
	sdivx	%i6,	0x098A,	%o6
	ldub	[%l7 + 0x25],	%l6
	ldx	[%l7 + 0x48],	%o3
	addcc	%l2,	0x0BB8,	%i7
	st	%f27,	[%l7 + 0x7C]
	xor	%i3,	0x0914,	%i1
	ldd	[%l7 + 0x78],	%o0
	and	%g1,	%l4,	%g6
	sir	0x157E
	popc	0x1D91,	%o7
	srl	%o5,	0x05,	%l3
	ld	[%l7 + 0x30],	%f14
	mova	%xcc,	%g4,	%i2
	xorcc	%i0,	%g5,	%g2
	movrne	%o4,	%l5,	%o0
	ld	[%l7 + 0x54],	%f0
	fmovsgu	%icc,	%f26,	%f15
	edge8	%o2,	%i5,	%l1
	subcc	%g3,	%g7,	%i4
	umulcc	%i6,	0x0513,	%o6
	movrgez	%l0,	%l6,	%l2
	fmovrdlz	%i7,	%f10,	%f2
	mulx	%o3,	0x0F79,	%i3
	movrlez	%o1,	0x371,	%g1
	orncc	%i1,	0x05B7,	%g6
	edge8ln	%l4,	%o5,	%l3
	movrlz	%o7,	0x019,	%i2
	fmovdleu	%icc,	%f4,	%f15
	sra	%g4,	0x11,	%g5
	sdiv	%i0,	0x017D,	%o4
	array16	%g2,	%o0,	%l5
	movneg	%icc,	%o2,	%i5
	movvs	%icc,	%l1,	%g7
	fmovrsne	%i4,	%f27,	%f9
	fcmpne32	%f12,	%f4,	%g3
	sdiv	%i6,	0x07B1,	%o6
	fnegd	%f22,	%f12
	mulscc	%l0,	%l6,	%l2
	movgu	%xcc,	%o3,	%i7
	addccc	%o1,	%g1,	%i3
	edge8n	%g6,	%l4,	%i1
	movle	%xcc,	%o5,	%o7
	and	%l3,	0x0B17,	%i2
	siam	0x5
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	movrlez	%o4,	%g2,	%o0
	fcmps	%fcc3,	%f15,	%f16
	lduh	[%l7 + 0x52],	%l5
	fmuld8sux16	%f4,	%f19,	%f8
	movneg	%xcc,	%i0,	%o2
	movpos	%icc,	%l1,	%i5
	movrlez	%i4,	%g3,	%i6
	nop
	set	0x32, %g1
	ldub	[%l7 + %g1],	%g7
	fmovdcs	%icc,	%f22,	%f3
	orn	%l0,	%o6,	%l6
	fmovdgu	%icc,	%f17,	%f27
	save %o3, 0x1AEC, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o1,	%i7,	%g1
	ldsb	[%l7 + 0x36],	%i3
	ldsw	[%l7 + 0x28],	%l4
	fnegs	%f18,	%f6
	sdivcc	%i1,	0x17DF,	%g6
	sllx	%o7,	%l3,	%o5
	movrgez	%i2,	0x336,	%g5
	ldd	[%l7 + 0x10],	%g4
	fsrc2	%f0,	%f18
	fmovscc	%xcc,	%f14,	%f25
	movcc	%xcc,	%o4,	%o0
	smul	%g2,	0x07B9,	%l5
	movrgz	%o2,	0x16D,	%i0
	fmovrslz	%i5,	%f1,	%f3
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f4
	movle	%xcc,	%l1,	%i4
	edge32l	%g3,	%i6,	%g7
	movgu	%icc,	%o6,	%l6
	edge32ln	%o3,	%l2,	%l0
	movcs	%icc,	%i7,	%g1
	movge	%xcc,	%i3,	%l4
	xnor	%o1,	0x0771,	%g6
	fmovsvc	%icc,	%f28,	%f23
	udivx	%o7,	0x1A1E,	%l3
	fnand	%f20,	%f4,	%f30
	fcmps	%fcc1,	%f8,	%f13
	array8	%i1,	%i2,	%o5
	fmovsn	%icc,	%f10,	%f25
	fpadd16	%f16,	%f24,	%f0
	sth	%g4,	[%l7 + 0x3A]
	fmovde	%xcc,	%f26,	%f19
	stw	%g5,	[%l7 + 0x40]
	andn	%o0,	%g2,	%o4
	xorcc	%o2,	%i0,	%i5
	alignaddrl	%l1,	%i4,	%g3
	movge	%icc,	%l5,	%i6
	add	%g7,	0x161C,	%l6
	mova	%xcc,	%o6,	%l2
	ldsh	[%l7 + 0x26],	%l0
	edge8	%i7,	%g1,	%o3
	edge8l	%i3,	%o1,	%l4
	edge32n	%g6,	%o7,	%l3
	array8	%i2,	%o5,	%i1
	movrne	%g4,	0x017,	%o0
	fmovdl	%icc,	%f21,	%f22
	srl	%g5,	%o4,	%o2
	fmovsvs	%icc,	%f17,	%f12
	sllx	%i0,	%i5,	%l1
	alignaddrl	%g2,	%g3,	%i4
	fcmpeq16	%f22,	%f18,	%i6
	ldub	[%l7 + 0x69],	%l5
	fandnot1s	%f16,	%f23,	%f0
	movge	%xcc,	%g7,	%l6
	fmovdl	%xcc,	%f11,	%f25
	or	%o6,	%l0,	%i7
	movpos	%xcc,	%g1,	%o3
	add	%l2,	%i3,	%o1
	sth	%l4,	[%l7 + 0x50]
	xorcc	%g6,	0x0B75,	%o7
	st	%f7,	[%l7 + 0x30]
	fmovsneg	%xcc,	%f4,	%f23
	smul	%i2,	0x0EAD,	%o5
	xnor	%i1,	%l3,	%o0
	fmul8sux16	%f6,	%f26,	%f28
	movl	%xcc,	%g4,	%o4
	movleu	%icc,	%g5,	%o2
	smulcc	%i0,	%i5,	%g2
	alignaddrl	%g3,	%i4,	%i6
	umul	%l1,	%g7,	%l6
	array8	%o6,	%l5,	%i7
	fmul8x16	%f28,	%f2,	%f4
	edge16ln	%l0,	%o3,	%g1
	movrgz	%l2,	%o1,	%l4
	movn	%icc,	%g6,	%o7
	xnorcc	%i2,	0x07B8,	%i3
	fmul8x16	%f2,	%f0,	%f0
	umul	%i1,	%l3,	%o5
	edge16	%g4,	%o4,	%o0
	fmovsneg	%xcc,	%f2,	%f30
	smulcc	%g5,	0x1013,	%i0
	movleu	%icc,	%o2,	%g2
	or	%i5,	0x0365,	%g3
	ldd	[%l7 + 0x08],	%i4
	movrgez	%i6,	0x12C,	%l1
	smul	%l6,	%g7,	%o6
	fcmpne32	%f6,	%f26,	%l5
	edge32n	%l0,	%o3,	%i7
	mova	%xcc,	%l2,	%o1
	ldd	[%l7 + 0x50],	%f24
	ldd	[%l7 + 0x58],	%g0
	orn	%l4,	0x1B14,	%o7
	sdiv	%g6,	0x1329,	%i2
	udiv	%i3,	0x04D6,	%i1
	sdivx	%o5,	0x1703,	%l3
	fcmped	%fcc0,	%f4,	%f28
	sdivcc	%o4,	0x043A,	%g4
	fmovsgu	%xcc,	%f22,	%f24
	edge16l	%g5,	%o0,	%o2
	and	%i0,	%i5,	%g3
	fmovdge	%xcc,	%f15,	%f15
	faligndata	%f0,	%f24,	%f30
	addc	%i4,	0x1475,	%i6
	fnot2s	%f15,	%f9
	udivcc	%g2,	0x0D44,	%l1
	sth	%l6,	[%l7 + 0x10]
	xnor	%g7,	%l5,	%o6
	ldub	[%l7 + 0x59],	%l0
	subccc	%o3,	%i7,	%l2
	sdivcc	%o1,	0x0D0E,	%l4
	andcc	%o7,	%g6,	%i2
	sth	%g1,	[%l7 + 0x2C]
	edge8l	%i1,	%i3,	%l3
	stx	%o4,	[%l7 + 0x48]
	addcc	%o5,	%g4,	%g5
	srl	%o2,	%i0,	%i5
	movvc	%icc,	%g3,	%i4
	edge16n	%i6,	%o0,	%g2
	fmovdpos	%icc,	%f21,	%f0
	stb	%l1,	[%l7 + 0x47]
	and	%g7,	0x19BA,	%l5
	movrgz	%l6,	%l0,	%o6
	udivx	%i7,	0x1EC6,	%o3
	fpadd32	%f0,	%f8,	%f28
	std	%f22,	[%l7 + 0x28]
	fpadd16	%f12,	%f26,	%f22
	edge32ln	%l2,	%o1,	%o7
	ldsw	[%l7 + 0x78],	%g6
	edge16ln	%i2,	%l4,	%i1
	stb	%g1,	[%l7 + 0x0E]
	srax	%l3,	%i3,	%o5
	sra	%g4,	%g5,	%o4
	move	%icc,	%i0,	%o2
	fmul8x16	%f3,	%f2,	%f30
	movneg	%icc,	%g3,	%i5
	fors	%f10,	%f24,	%f1
	movpos	%icc,	%i4,	%o0
	movrne	%g2,	0x16E,	%i6
	movvs	%xcc,	%g7,	%l5
	xnor	%l1,	0x03A7,	%l0
	movrgz	%o6,	0x19D,	%i7
	edge8	%l6,	%o3,	%l2
	mova	%icc,	%o7,	%g6
	movleu	%icc,	%i2,	%l4
	movn	%icc,	%o1,	%i1
	std	%f26,	[%l7 + 0x58]
	fexpand	%f21,	%f16
	fmovdle	%icc,	%f16,	%f24
	fnors	%f7,	%f30,	%f14
	fpackfix	%f22,	%f15
	addc	%l3,	0x0448,	%g1
	ldub	[%l7 + 0x3B],	%i3
	subcc	%o5,	%g5,	%g4
	edge16n	%o4,	%o2,	%g3
	fsrc1	%f16,	%f24
	fcmpd	%fcc2,	%f16,	%f20
	fmovspos	%xcc,	%f28,	%f9
	orn	%i0,	%i5,	%i4
	fandnot2s	%f31,	%f8,	%f12
	xor	%g2,	0x1B0B,	%i6
	for	%f4,	%f16,	%f4
	movle	%xcc,	%o0,	%l5
	xnorcc	%g7,	0x1254,	%l0
	subcc	%o6,	0x1B1E,	%l1
	edge16n	%l6,	%i7,	%o3
	edge8n	%l2,	%o7,	%i2
	ldsb	[%l7 + 0x1E],	%g6
	alignaddrl	%o1,	%l4,	%l3
	move	%xcc,	%i1,	%g1
	ldsw	[%l7 + 0x44],	%o5
	addccc	%i3,	%g5,	%g4
	fcmps	%fcc0,	%f15,	%f14
	or	%o2,	0x0AD6,	%o4
	addccc	%i0,	%i5,	%g3
	sdiv	%g2,	0x02EF,	%i6
	srlx	%i4,	0x1D,	%o0
	ldd	[%l7 + 0x48],	%f30
	orn	%l5,	0x17BD,	%l0
	movle	%xcc,	%o6,	%g7
	movrgez	%l1,	%l6,	%o3
	movrlez	%i7,	%o7,	%l2
	edge16	%g6,	%o1,	%l4
	move	%icc,	%i2,	%i1
	fcmple16	%f4,	%f2,	%g1
	edge8n	%l3,	%o5,	%g5
	fones	%f8
	edge16l	%g4,	%i3,	%o2
	fmovrde	%o4,	%f18,	%f2
	ldsw	[%l7 + 0x50],	%i5
	sra	%g3,	%i0,	%g2
	edge8n	%i6,	%o0,	%l5
	movvc	%xcc,	%l0,	%i4
	sir	0x1F37
	lduh	[%l7 + 0x2E],	%g7
	addcc	%o6,	%l6,	%o3
	st	%f8,	[%l7 + 0x54]
	array32	%l1,	%i7,	%l2
	edge16l	%o7,	%g6,	%o1
	srl	%l4,	%i2,	%g1
	faligndata	%f28,	%f22,	%f8
	fmovdle	%xcc,	%f1,	%f5
	stx	%l3,	[%l7 + 0x10]
	xnor	%i1,	0x02CD,	%o5
	movrgez	%g5,	0x228,	%i3
	fpsub32s	%f21,	%f15,	%f8
	sth	%o2,	[%l7 + 0x5A]
	movcs	%icc,	%g4,	%i5
	ldx	[%l7 + 0x50],	%o4
	movrgez	%g3,	%i0,	%g2
	fpack16	%f26,	%f24
	subccc	%i6,	0x0BBD,	%l5
	subccc	%o0,	0x1567,	%l0
	lduw	[%l7 + 0x30],	%i4
	movcs	%icc,	%o6,	%l6
	fcmpd	%fcc0,	%f18,	%f20
	fnegd	%f10,	%f22
	ldd	[%l7 + 0x38],	%o2
	fmovrsgez	%l1,	%f14,	%f16
	movre	%i7,	%l2,	%g7
	ldsh	[%l7 + 0x4A],	%o7
	fands	%f9,	%f18,	%f17
	movleu	%icc,	%g6,	%l4
	fmovd	%f8,	%f12
	xorcc	%o1,	%g1,	%l3
	movle	%icc,	%i1,	%o5
	ldx	[%l7 + 0x70],	%i2
	sdivx	%i3,	0x0087,	%o2
	fmovrdgz	%g4,	%f10,	%f26
	fnot2s	%f1,	%f30
	ldsw	[%l7 + 0x5C],	%g5
	smulcc	%o4,	%g3,	%i5
	edge16	%g2,	%i0,	%i6
	smulcc	%o0,	%l5,	%i4
	movrgz	%o6,	0x322,	%l6
	edge8	%l0,	%l1,	%i7
	xnor	%l2,	%g7,	%o3
	edge32ln	%g6,	%o7,	%l4
	ldsh	[%l7 + 0x6A],	%o1
	ldx	[%l7 + 0x38],	%l3
	ldsw	[%l7 + 0x10],	%i1
	sub	%o5,	%g1,	%i3
	umulcc	%o2,	0x0B83,	%g4
	movl	%icc,	%i2,	%o4
	alignaddr	%g5,	%i5,	%g2
	fcmpd	%fcc1,	%f24,	%f30
	srax	%i0,	0x08,	%g3
	fmovscs	%icc,	%f0,	%f26
	andn	%i6,	%o0,	%l5
	ldd	[%l7 + 0x18],	%i4
	edge8	%o6,	%l0,	%l1
	ld	[%l7 + 0x2C],	%f10
	srl	%l6,	%l2,	%i7
	edge32n	%g7,	%g6,	%o7
	srax	%o3,	0x18,	%o1
	array8	%l4,	%l3,	%i1
	edge32ln	%g1,	%i3,	%o2
	movrgez	%g4,	%o5,	%i2
	stx	%o4,	[%l7 + 0x40]
	nop
	set	0x70, %g7
	sth	%g5,	[%l7 + %g7]
	movle	%icc,	%i5,	%i0
	umul	%g2,	%i6,	%g3
	ld	[%l7 + 0x40],	%f26
	movge	%icc,	%l5,	%o0
	array32	%i4,	%l0,	%o6
	movcs	%icc,	%l1,	%l6
	srlx	%l2,	0x15,	%i7
	movneg	%xcc,	%g6,	%g7
	sra	%o3,	0x1B,	%o1
	ldsb	[%l7 + 0x50],	%o7
	fones	%f7
	array8	%l3,	%i1,	%l4
	xnor	%i3,	0x1564,	%g1
	movcc	%xcc,	%o2,	%g4
	movrgez	%o5,	0x341,	%i2
	addcc	%g5,	0x1AF4,	%i5
	ldsh	[%l7 + 0x12],	%o4
	xnorcc	%i0,	%g2,	%g3
	xorcc	%l5,	0x0390,	%o0
	fcmpgt16	%f0,	%f2,	%i4
	fmovde	%icc,	%f21,	%f29
	fpackfix	%f0,	%f19
	stb	%l0,	[%l7 + 0x6C]
	sdivx	%o6,	0x0CAB,	%l1
	movpos	%icc,	%i6,	%l2
	sethi	0x0344,	%l6
	movneg	%xcc,	%i7,	%g6
	mova	%icc,	%g7,	%o3
	fnor	%f10,	%f20,	%f14
	movvc	%xcc,	%o1,	%l3
	ldub	[%l7 + 0x44],	%o7
	addc	%i1,	0x17B1,	%l4
	umul	%i3,	0x0A01,	%g1
	fmul8ulx16	%f18,	%f6,	%f28
	fmul8x16au	%f0,	%f30,	%f8
	edge16n	%g4,	%o5,	%o2
	fnot2	%f6,	%f26
	fcmpeq16	%f10,	%f24,	%g5
	ldub	[%l7 + 0x25],	%i2
	xnorcc	%o4,	0x0243,	%i5
	movl	%xcc,	%i0,	%g3
	add	%g2,	%l5,	%i4
	edge32ln	%o0,	%o6,	%l0
	fmovrsgez	%i6,	%f20,	%f12
	save %l2, 0x06DF, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i7,	0x177,	%l6
	sethi	0x1E35,	%g7
	edge8ln	%g6,	%o3,	%l3
	edge32n	%o7,	%i1,	%l4
	popc	%i3,	%o1
	fabsd	%f24,	%f28
	ldub	[%l7 + 0x64],	%g4
	sub	%g1,	0x1B2F,	%o5
	fnand	%f0,	%f8,	%f10
	udivcc	%o2,	0x0BAE,	%g5
	ldub	[%l7 + 0x19],	%i2
	array8	%i5,	%o4,	%i0
	movg	%icc,	%g2,	%g3
	udiv	%i4,	0x0AB8,	%o0
	fcmpgt16	%f2,	%f0,	%o6
	fnors	%f15,	%f21,	%f1
	movrlez	%l5,	%i6,	%l0
	fmovsvc	%icc,	%f25,	%f7
	movn	%icc,	%l1,	%i7
	ldd	[%l7 + 0x20],	%f22
	for	%f20,	%f2,	%f16
	sdiv	%l6,	0x02E3,	%g7
	edge16	%g6,	%o3,	%l3
	xnor	%o7,	0x18F6,	%l2
	sdivcc	%l4,	0x0B08,	%i1
	orcc	%i3,	0x0423,	%o1
	edge8	%g1,	%g4,	%o5
	subcc	%g5,	%o2,	%i2
	edge16ln	%i5,	%o4,	%i0
	smul	%g2,	%g3,	%o0
	edge8	%o6,	%i4,	%l5
	edge16ln	%i6,	%l1,	%i7
	or	%l0,	%g7,	%g6
	fsrc2	%f8,	%f30
	fcmple32	%f10,	%f24,	%o3
	umulcc	%l3,	%o7,	%l6
	stx	%l4,	[%l7 + 0x08]
	ldsh	[%l7 + 0x08],	%i1
	st	%f19,	[%l7 + 0x08]
	orn	%l2,	0x1BB6,	%o1
	movg	%icc,	%i3,	%g1
	nop
	set	0x4D, %l0
	ldub	[%l7 + %l0],	%o5
	stw	%g4,	[%l7 + 0x6C]
	srl	%g5,	0x1B,	%i2
	udivcc	%o2,	0x0F6B,	%o4
	edge8	%i5,	%i0,	%g3
	fmovsge	%icc,	%f9,	%f31
	array16	%g2,	%o6,	%o0
	movge	%icc,	%i4,	%i6
	sethi	0x1CA8,	%l1
	sub	%i7,	0x135A,	%l0
	movrlez	%l5,	%g6,	%o3
	sra	%g7,	0x0D,	%l3
	ldsb	[%l7 + 0x42],	%o7
	ldub	[%l7 + 0x30],	%l4
	array32	%i1,	%l2,	%l6
	edge16n	%o1,	%i3,	%g1
	stb	%g4,	[%l7 + 0x5A]
	array32	%g5,	%i2,	%o2
	fands	%f31,	%f13,	%f26
	edge32	%o4,	%i5,	%o5
	nop
	set	0x78, %l2
	lduh	[%l7 + %l2],	%i0
	udivcc	%g3,	0x0C17,	%o6
	lduh	[%l7 + 0x14],	%o0
	xnor	%i4,	0x10C9,	%g2
	edge8ln	%l1,	%i7,	%l0
	movcc	%icc,	%l5,	%g6
	edge8n	%i6,	%o3,	%g7
	for	%f28,	%f4,	%f22
	stb	%l3,	[%l7 + 0x71]
	udivx	%o7,	0x0703,	%i1
	and	%l2,	0x1D92,	%l4
	fmul8x16	%f28,	%f24,	%f18
	lduh	[%l7 + 0x48],	%l6
	fxor	%f0,	%f8,	%f12
	movcc	%xcc,	%o1,	%g1
	edge16n	%i3,	%g5,	%i2
	fcmpgt32	%f20,	%f14,	%o2
	movcc	%icc,	%o4,	%i5
	edge32l	%g4,	%o5,	%i0
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%o6
	fmovdge	%icc,	%f18,	%f28
	nop
	set	0x5B, %o0
	stb	%o0,	[%l7 + %o0]
	fmovrdne	%i4,	%f2,	%f16
	xnor	%g2,	0x12D6,	%g3
	movle	%xcc,	%i7,	%l1
	orncc	%l0,	%g6,	%i6
	array8	%l5,	%o3,	%l3
	ldx	[%l7 + 0x20],	%g7
	fmul8sux16	%f20,	%f6,	%f24
	movcc	%xcc,	%i1,	%o7
	movrgz	%l2,	%l4,	%l6
	udivx	%g1,	0x0ED4,	%o1
	subc	%g5,	0x1CD9,	%i3
	edge32l	%o2,	%i2,	%o4
	movrgz	%g4,	%i5,	%i0
	fone	%f2
	movge	%icc,	%o6,	%o0
	subccc	%o5,	%i4,	%g2
	sub	%i7,	0x1BE6,	%g3
	movgu	%icc,	%l0,	%g6
	ldsb	[%l7 + 0x25],	%l1
	movne	%icc,	%i6,	%l5
	xnor	%o3,	0x0FB6,	%g7
	edge8ln	%i1,	%l3,	%l2
	edge32l	%l4,	%o7,	%g1
	stx	%o1,	[%l7 + 0x28]
	movcc	%xcc,	%g5,	%i3
	sub	%o2,	%i2,	%l6
	edge8n	%o4,	%g4,	%i5
	movpos	%icc,	%i0,	%o6
	ld	[%l7 + 0x3C],	%f7
	lduw	[%l7 + 0x40],	%o5
	andncc	%i4,	%g2,	%i7
	fpmerge	%f8,	%f12,	%f16
	fnot2	%f12,	%f8
	srlx	%o0,	%g3,	%g6
	ldub	[%l7 + 0x68],	%l1
	sll	%l0,	%l5,	%i6
	restore %o3, %i1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f15,	%f9
	fzero	%f24
	sub	%g7,	0x0D49,	%l4
	sir	0x1616
	movrne	%l2,	0x314,	%o7
	sdivcc	%g1,	0x1238,	%g5
	sdiv	%o1,	0x14A1,	%o2
	udivx	%i2,	0x12DD,	%i3
	sir	0x0693
	fmul8x16	%f16,	%f14,	%f14
	orcc	%l6,	%g4,	%o4
	movrgz	%i5,	%i0,	%o6
	movrlez	%o5,	%g2,	%i7
	xnor	%o0,	%i4,	%g6
	movcs	%icc,	%g3,	%l1
	stb	%l0,	[%l7 + 0x73]
	array16	%i6,	%l5,	%o3
	ldd	[%l7 + 0x38],	%l2
	movne	%icc,	%i1,	%l4
	fnot1s	%f2,	%f7
	movpos	%icc,	%l2,	%g7
	umulcc	%o7,	%g5,	%o1
	movle	%xcc,	%o2,	%g1
	fmovrdgz	%i3,	%f4,	%f26
	orn	%l6,	%g4,	%i2
	movcs	%icc,	%i5,	%i0
	fnot1s	%f1,	%f14
	xnorcc	%o6,	0x060F,	%o5
	fpsub32	%f30,	%f4,	%f12
	sll	%g2,	0x15,	%o4
	fmovse	%xcc,	%f6,	%f12
	fmovrde	%o0,	%f28,	%f16
	and	%i4,	0x16F7,	%i7
	sir	0x0411
	sdiv	%g3,	0x149E,	%l1
	save %g6, %l0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i6,	%l3,	%o3
	movpos	%xcc,	%l4,	%i1
	movne	%xcc,	%g7,	%l2
	sdivx	%g5,	0x08B1,	%o1
	fmovrdlez	%o2,	%f30,	%f28
	fmovscs	%icc,	%f27,	%f26
	ldd	[%l7 + 0x78],	%f18
	fone	%f2
	addc	%g1,	%i3,	%l6
	std	%f22,	[%l7 + 0x30]
	fnand	%f22,	%f20,	%f0
	movn	%icc,	%g4,	%o7
	siam	0x0
	movg	%xcc,	%i2,	%i0
	subcc	%o6,	0x1C2A,	%o5
	edge32	%g2,	%i5,	%o0
	nop
	set	0x14, %g4
	ldsw	[%l7 + %g4],	%o4
	subc	%i4,	0x1B9B,	%i7
	edge8ln	%l1,	%g6,	%l0
	orncc	%g3,	%i6,	%l5
	movg	%xcc,	%o3,	%l3
	sll	%l4,	%g7,	%l2
	movne	%icc,	%i1,	%o1
	array8	%g5,	%g1,	%o2
	movcs	%icc,	%i3,	%l6
	fmovsl	%xcc,	%f7,	%f27
	pdist	%f6,	%f12,	%f4
	edge32ln	%o7,	%i2,	%g4
	fmovrdlz	%i0,	%f4,	%f16
	addccc	%o6,	%g2,	%o5
	fandnot2s	%f6,	%f19,	%f23
	movre	%o0,	%o4,	%i5
	fsrc1s	%f27,	%f8
	fsrc2s	%f14,	%f3
	faligndata	%f2,	%f16,	%f28
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	fxors	%f17,	%f4,	%f0
	lduw	[%l7 + 0x5C],	%l0
	fmul8x16al	%f1,	%f22,	%f24
	fandnot2s	%f3,	%f10,	%f26
	ldd	[%l7 + 0x58],	%f18
	orn	%i4,	0x0ED6,	%i6
	fpsub16	%f10,	%f14,	%f26
	stw	%l5,	[%l7 + 0x50]
	xnorcc	%o3,	0x0DDA,	%g3
	fmovsg	%icc,	%f21,	%f17
	ld	[%l7 + 0x6C],	%f9
	mulscc	%l3,	0x0845,	%g7
	umul	%l2,	0x1E13,	%i1
	udiv	%o1,	0x09B8,	%g5
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%f28
	edge8ln	%g1,	%o2,	%i3
	xor	%l4,	%o7,	%l6
	lduh	[%l7 + 0x16],	%g4
	fpadd32s	%f15,	%f7,	%f22
	sub	%i2,	%i0,	%g2
	edge16	%o6,	%o5,	%o0
	fnors	%f9,	%f15,	%f7
	edge32l	%o4,	%i5,	%i7
	fors	%f29,	%f28,	%f7
	movne	%xcc,	%l1,	%g6
	lduh	[%l7 + 0x62],	%i4
	array32	%i6,	%l5,	%l0
	fpsub32s	%f7,	%f20,	%f7
	xorcc	%o3,	0x1B90,	%g3
	smul	%l3,	%l2,	%g7
	std	%f22,	[%l7 + 0x28]
	fornot1s	%f0,	%f30,	%f11
	srax	%o1,	0x06,	%i1
	lduh	[%l7 + 0x2A],	%g5
	fnors	%f24,	%f21,	%f20
	orn	%g1,	%o2,	%i3
	ldsb	[%l7 + 0x5D],	%o7
	fsrc1s	%f12,	%f0
	srlx	%l4,	0x1A,	%g4
	smulcc	%l6,	0x06FD,	%i0
	edge32n	%g2,	%o6,	%i2
	fsrc1s	%f5,	%f29
	smul	%o5,	%o0,	%o4
	fnors	%f27,	%f26,	%f0
	fornot1s	%f2,	%f25,	%f3
	andncc	%i7,	%l1,	%i5
	sll	%g6,	%i6,	%l5
	movn	%xcc,	%i4,	%o3
	fsrc1s	%f20,	%f29
	edge16ln	%l0,	%l3,	%g3
	fmovse	%icc,	%f4,	%f7
	movge	%xcc,	%g7,	%l2
	movvc	%xcc,	%i1,	%o1
	fmovsle	%xcc,	%f12,	%f24
	std	%f10,	[%l7 + 0x60]
	srlx	%g5,	0x09,	%o2
	fsrc1	%f4,	%f16
	movge	%icc,	%g1,	%i3
	or	%o7,	%g4,	%l4
	orcc	%l6,	0x1953,	%i0
	smul	%o6,	0x0D28,	%i2
	fmovsvs	%xcc,	%f2,	%f26
	udiv	%o5,	0x1106,	%o0
	stw	%g2,	[%l7 + 0x34]
	std	%f28,	[%l7 + 0x68]
	smulcc	%i7,	%l1,	%o4
	popc	%i5,	%i6
	fmovde	%xcc,	%f23,	%f16
	udivx	%l5,	0x08BF,	%i4
	fmovdvc	%xcc,	%f12,	%f16
	stx	%o3,	[%l7 + 0x70]
	edge8	%g6,	%l3,	%g3
	andcc	%g7,	%l0,	%l2
	movrgez	%i1,	0x1CF,	%o1
	subcc	%o2,	0x1EC3,	%g5
	addc	%i3,	%o7,	%g1
	fmovdle	%xcc,	%f24,	%f28
	movleu	%xcc,	%g4,	%l4
	srlx	%i0,	0x11,	%l6
	fsrc2	%f0,	%f14
	fmul8sux16	%f12,	%f18,	%f24
	fandnot1s	%f13,	%f31,	%f14
	sth	%o6,	[%l7 + 0x24]
	array32	%i2,	%o0,	%g2
	addccc	%i7,	%o5,	%o4
	fmovrdlez	%i5,	%f2,	%f18
	fsrc2s	%f15,	%f22
	movpos	%xcc,	%l1,	%l5
	subcc	%i6,	0x0D60,	%i4
	andn	%o3,	0x17C8,	%g6
	edge16ln	%g3,	%g7,	%l0
	orncc	%l2,	0x01CA,	%l3
	ldsb	[%l7 + 0x15],	%o1
	restore %o2, 0x1964, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i1,	0x154,	%i3
	fones	%f27
	move	%icc,	%o7,	%g1
	edge8l	%l4,	%g4,	%i0
	movgu	%icc,	%l6,	%o6
	array16	%o0,	%g2,	%i7
	save %o5, %o4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l1,	[%l7 + 0x68]
	edge16ln	%l5,	%i6,	%i2
	pdist	%f26,	%f6,	%f2
	and	%o3,	%i4,	%g3
	subc	%g7,	0x1174,	%l0
	array32	%l2,	%g6,	%l3
	xnor	%o2,	0x0728,	%o1
	orcc	%i1,	0x1D79,	%g5
	movvs	%xcc,	%o7,	%i3
	fandnot2	%f4,	%f4,	%f22
	orcc	%l4,	0x0127,	%g1
	ld	[%l7 + 0x30],	%f4
	edge32n	%i0,	%g4,	%o6
	srlx	%o0,	%g2,	%l6
	sth	%o5,	[%l7 + 0x60]
	stw	%i7,	[%l7 + 0x38]
	movvs	%icc,	%o4,	%l1
	move	%xcc,	%i5,	%l5
	edge8l	%i2,	%i6,	%i4
	fabss	%f29,	%f15
	lduh	[%l7 + 0x0A],	%o3
	orcc	%g3,	%g7,	%l0
	movpos	%icc,	%g6,	%l2
	movl	%icc,	%o2,	%l3
	nop
	set	0x7A, %l5
	sth	%i1,	[%l7 + %l5]
	ld	[%l7 + 0x2C],	%f30
	fcmps	%fcc3,	%f23,	%f11
	andcc	%o1,	%g5,	%i3
	subccc	%l4,	0x1167,	%o7
	subc	%g1,	0x1742,	%i0
	xorcc	%o6,	0x1F92,	%o0
	movvs	%xcc,	%g2,	%g4
	ldsh	[%l7 + 0x68],	%o5
	sra	%i7,	0x1B,	%o4
	mova	%xcc,	%l6,	%l1
	xor	%i5,	0x0BE1,	%l5
	andcc	%i2,	%i4,	%o3
	fzeros	%f3
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%g2
	movneg	%xcc,	%i6,	%g7
	addc	%g6,	%l2,	%l0
	fcmple32	%f0,	%f6,	%o2
	movg	%xcc,	%l3,	%i1
	ldsb	[%l7 + 0x2C],	%o1
	array16	%g5,	%l4,	%i3
	fsrc2s	%f7,	%f17
	movvs	%icc,	%o7,	%i0
	movn	%icc,	%o6,	%o0
	mulscc	%g1,	0x0C3C,	%g4
	sllx	%g2,	0x03,	%o5
	movre	%i7,	0x2DD,	%o4
	stw	%l6,	[%l7 + 0x2C]
	ldx	[%l7 + 0x40],	%l1
	fmovrdlez	%l5,	%f2,	%f20
	ldsb	[%l7 + 0x0E],	%i5
	stx	%i4,	[%l7 + 0x30]
	sllx	%i2,	0x1C,	%g3
	lduw	[%l7 + 0x20],	%o3
	sra	%g7,	%i6,	%l2
	fcmpes	%fcc1,	%f20,	%f3
	edge8l	%l0,	%g6,	%l3
	ldx	[%l7 + 0x28],	%i1
	edge8	%o1,	%o2,	%l4
	smulcc	%g5,	0x0035,	%i3
	fmovsge	%icc,	%f15,	%f24
	stw	%i0,	[%l7 + 0x50]
	nop
	set	0x78, %g3
	ldub	[%l7 + %g3],	%o7
	fnot2s	%f7,	%f3
	fmovd	%f14,	%f18
	edge8l	%o0,	%g1,	%g4
	ldx	[%l7 + 0x48],	%o6
	movle	%xcc,	%g2,	%o5
	fnors	%f4,	%f18,	%f1
	movrne	%o4,	%i7,	%l6
	movne	%icc,	%l1,	%l5
	ld	[%l7 + 0x24],	%f16
	sir	0x14D3
	movrgez	%i4,	%i5,	%g3
	fmovrde	%o3,	%f16,	%f18
	andn	%i2,	%i6,	%l2
	fpackfix	%f2,	%f0
	fmovsgu	%xcc,	%f11,	%f3
	edge8ln	%l0,	%g7,	%g6
	orn	%i1,	%o1,	%o2
	edge32	%l3,	%g5,	%i3
	movvs	%icc,	%i0,	%l4
	udiv	%o7,	0x14C6,	%g1
	fmovscs	%xcc,	%f13,	%f18
	array8	%g4,	%o6,	%g2
	ldsh	[%l7 + 0x3E],	%o0
	sub	%o4,	%i7,	%l6
	lduw	[%l7 + 0x48],	%o5
	fmovsgu	%icc,	%f0,	%f28
	movneg	%icc,	%l5,	%l1
	ldub	[%l7 + 0x29],	%i4
	mova	%xcc,	%i5,	%g3
	edge16	%o3,	%i6,	%l2
	move	%xcc,	%i2,	%g7
	sethi	0x0BB5,	%l0
	movl	%icc,	%g6,	%i1
	xnor	%o2,	%l3,	%g5
	edge8n	%o1,	%i3,	%i0
	edge8ln	%l4,	%g1,	%o7
	movrgez	%o6,	%g2,	%o0
	st	%f27,	[%l7 + 0x10]
	xnor	%g4,	0x1F11,	%i7
	edge8ln	%o4,	%l6,	%l5
	alignaddrl	%l1,	%o5,	%i5
	edge32l	%g3,	%i4,	%o3
	movpos	%icc,	%l2,	%i6
	fzeros	%f23
	movrlz	%i2,	0x1F7,	%g7
	fpsub32s	%f14,	%f31,	%f16
	sth	%g6,	[%l7 + 0x36]
	movrgz	%i1,	0x392,	%l0
	movleu	%icc,	%l3,	%o2
	fnot2	%f10,	%f2
	fones	%f19
	sdivx	%g5,	0x0F3F,	%o1
	movre	%i3,	%l4,	%i0
	fexpand	%f29,	%f18
	and	%o7,	%g1,	%g2
	edge16ln	%o0,	%g4,	%i7
	fmovdge	%icc,	%f13,	%f18
	array32	%o4,	%l6,	%l5
	pdist	%f28,	%f24,	%f16
	alignaddrl	%o6,	%l1,	%o5
	stx	%g3,	[%l7 + 0x58]
	array32	%i4,	%i5,	%l2
	movvs	%icc,	%i6,	%o3
	umul	%g7,	%i2,	%i1
	nop
	set	0x12, %o3
	lduh	[%l7 + %o3],	%l0
	sdivx	%g6,	0x1B0D,	%l3
	addccc	%o2,	%o1,	%i3
	movle	%icc,	%g5,	%l4
	mova	%icc,	%i0,	%g1
	fmul8x16	%f4,	%f8,	%f24
	popc	0x1CFF,	%o7
	fxors	%f18,	%f13,	%f3
	srl	%g2,	%o0,	%g4
	fmovsneg	%icc,	%f29,	%f6
	movle	%icc,	%o4,	%i7
	fmovsgu	%xcc,	%f17,	%f13
	fmovsle	%xcc,	%f24,	%f28
	edge32	%l5,	%o6,	%l6
	movrlez	%l1,	%g3,	%o5
	sll	%i4,	%l2,	%i5
	edge8n	%o3,	%g7,	%i2
	edge8ln	%i1,	%l0,	%g6
	sllx	%i6,	%o2,	%l3
	fmovrsgz	%o1,	%f14,	%f11
	fmovse	%icc,	%f11,	%f14
	ldd	[%l7 + 0x08],	%i2
	movn	%xcc,	%g5,	%l4
	edge16n	%g1,	%o7,	%i0
	edge32n	%o0,	%g4,	%o4
	array32	%g2,	%l5,	%o6
	fpsub32	%f28,	%f16,	%f26
	ldub	[%l7 + 0x34],	%l6
	addcc	%i7,	0x0077,	%l1
	alignaddrl	%o5,	%g3,	%l2
	umulcc	%i5,	0x1B46,	%i4
	subc	%g7,	0x1393,	%i2
	edge16n	%i1,	%o3,	%g6
	addc	%l0,	%i6,	%l3
	fmovsneg	%xcc,	%f23,	%f29
	lduw	[%l7 + 0x10],	%o1
	sdiv	%o2,	0x157A,	%g5
	mova	%icc,	%l4,	%i3
	movcs	%xcc,	%o7,	%i0
	addcc	%g1,	%o0,	%o4
	movgu	%xcc,	%g2,	%g4
	array16	%o6,	%l6,	%l5
	movcc	%xcc,	%i7,	%l1
	fsrc1	%f16,	%f30
	andncc	%g3,	%o5,	%i5
	orncc	%i4,	0x1738,	%g7
	ldd	[%l7 + 0x50],	%f4
	movcs	%icc,	%i2,	%l2
	andn	%o3,	%g6,	%l0
	sra	%i1,	%i6,	%o1
	sdivx	%l3,	0x0271,	%o2
	ldsw	[%l7 + 0x5C],	%l4
	ldub	[%l7 + 0x39],	%g5
	smul	%o7,	%i0,	%g1
	edge8n	%i3,	%o4,	%g2
	ld	[%l7 + 0x34],	%f20
	movge	%xcc,	%g4,	%o0
	fmovrslez	%o6,	%f0,	%f2
	edge16l	%l6,	%l5,	%l1
	smulcc	%i7,	%o5,	%g3
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	umul	%i2,	%l2,	%o3
	movg	%xcc,	%g6,	%g7
	subcc	%l0,	0x0790,	%i1
	edge16n	%i6,	%o1,	%l3
	ldsh	[%l7 + 0x2E],	%l4
	edge32n	%o2,	%g5,	%o7
	sra	%g1,	0x11,	%i3
	fnot1s	%f21,	%f28
	stb	%o4,	[%l7 + 0x25]
	std	%f16,	[%l7 + 0x20]
	xnor	%i0,	0x0B0E,	%g2
	ldsh	[%l7 + 0x5E],	%o0
	fmovsleu	%xcc,	%f8,	%f18
	save %g4, 0x194E, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l5,	%l1
	fmovdvs	%xcc,	%f19,	%f11
	fmul8ulx16	%f22,	%f10,	%f28
	subcc	%l6,	%o5,	%i7
	movge	%xcc,	%g3,	%i4
	udivx	%i2,	0x062B,	%l2
	mulx	%o3,	0x172C,	%g6
	or	%g7,	%i5,	%i1
	ldd	[%l7 + 0x68],	%f0
	ldub	[%l7 + 0x68],	%l0
	ldd	[%l7 + 0x50],	%f6
	fmovrslz	%o1,	%f1,	%f18
	smulcc	%l3,	0x1587,	%l4
	ldsh	[%l7 + 0x18],	%o2
	edge32	%g5,	%i6,	%o7
	fnot1s	%f16,	%f8
	smulcc	%g1,	0x1316,	%o4
	xnorcc	%i0,	0x0E75,	%i3
	nop
	set	0x28, %g5
	stx	%o0,	[%l7 + %g5]
	fnot1	%f2,	%f4
	edge16n	%g2,	%o6,	%g4
	edge16n	%l1,	%l6,	%o5
	sdiv	%i7,	0x0875,	%l5
	sir	0x1741
	stw	%i4,	[%l7 + 0x60]
	edge32l	%g3,	%l2,	%i2
	or	%o3,	%g6,	%i5
	ldd	[%l7 + 0x50],	%i0
	ldsw	[%l7 + 0x60],	%l0
	xnor	%g7,	0x00F1,	%o1
	ldsw	[%l7 + 0x60],	%l4
	alignaddr	%o2,	%l3,	%g5
	movcs	%icc,	%o7,	%g1
	array32	%i6,	%o4,	%i0
	movle	%icc,	%o0,	%i3
	xorcc	%g2,	%o6,	%l1
	xor	%l6,	0x17FA,	%o5
	alignaddr	%g4,	%l5,	%i4
	sethi	0x00A8,	%i7
	nop
	set	0x19, %i2
	ldsb	[%l7 + %i2],	%l2
	movg	%xcc,	%g3,	%i2
	fmuld8ulx16	%f23,	%f11,	%f14
	fone	%f20
	addcc	%g6,	%i5,	%i1
	sll	%l0,	%o3,	%o1
	mulscc	%g7,	%l4,	%l3
	sdiv	%g5,	0x1690,	%o2
	mova	%xcc,	%o7,	%i6
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%o4
	array16	%i0,	%g1,	%i3
	edge8ln	%g2,	%o0,	%l1
	movre	%l6,	%o6,	%o5
	fand	%f4,	%f4,	%f8
	fors	%f14,	%f4,	%f26
	movvs	%xcc,	%l5,	%g4
	movpos	%xcc,	%i4,	%l2
	st	%f15,	[%l7 + 0x34]
	ldsw	[%l7 + 0x24],	%g3
	edge16n	%i7,	%i2,	%g6
	ld	[%l7 + 0x44],	%f2
	orncc	%i1,	%i5,	%o3
	edge8	%l0,	%g7,	%o1
	for	%f22,	%f22,	%f26
	ldub	[%l7 + 0x67],	%l3
	fandnot2s	%f1,	%f5,	%f10
	edge8l	%l4,	%o2,	%o7
	fnand	%f24,	%f22,	%f18
	array8	%g5,	%o4,	%i6
	nop
	set	0x71, %i7
	stb	%g1,	[%l7 + %i7]
	edge8l	%i0,	%i3,	%g2
	ldsw	[%l7 + 0x28],	%o0
	std	%f14,	[%l7 + 0x58]
	stx	%l1,	[%l7 + 0x08]
	movg	%icc,	%o6,	%l6
	sdivx	%o5,	0x0005,	%g4
	fandnot1s	%f19,	%f23,	%f23
	add	%l5,	0x0B38,	%l2
	std	%f2,	[%l7 + 0x60]
	srlx	%g3,	0x0E,	%i7
	ldd	[%l7 + 0x18],	%f4
	movvc	%icc,	%i4,	%g6
	orncc	%i2,	0x0C18,	%i5
	udivcc	%i1,	0x10AE,	%l0
	movrgez	%g7,	%o3,	%l3
	edge16	%l4,	%o2,	%o7
	xnorcc	%g5,	%o1,	%i6
	andncc	%o4,	%i0,	%g1
	xor	%g2,	%o0,	%l1
	fmovrdlz	%i3,	%f4,	%f2
	fmovrdne	%l6,	%f22,	%f14
	umul	%o6,	0x0282,	%g4
	stx	%o5,	[%l7 + 0x50]
	ld	[%l7 + 0x58],	%f14
	sll	%l5,	0x14,	%l2
	andn	%g3,	0x0AA5,	%i4
	and	%i7,	0x18B8,	%g6
	addc	%i2,	%i5,	%l0
	sra	%i1,	0x05,	%o3
	stw	%g7,	[%l7 + 0x64]
	fmovrdgz	%l3,	%f6,	%f28
	subccc	%l4,	0x15FF,	%o7
	fcmpeq16	%f18,	%f14,	%o2
	sllx	%g5,	0x06,	%i6
	move	%xcc,	%o1,	%o4
	stb	%i0,	[%l7 + 0x19]
	fmuld8ulx16	%f17,	%f19,	%f2
	sra	%g2,	%o0,	%l1
	movleu	%icc,	%g1,	%l6
	srl	%i3,	%o6,	%g4
	and	%o5,	%l5,	%l2
	movrne	%i4,	0x39F,	%i7
	stx	%g3,	[%l7 + 0x28]
	movrgez	%i2,	%g6,	%l0
	movgu	%icc,	%i5,	%o3
	fnor	%f14,	%f4,	%f8
	fnors	%f23,	%f0,	%f6
	ldsh	[%l7 + 0x42],	%g7
	orncc	%l3,	0x04AA,	%l4
	edge16l	%o7,	%o2,	%i1
	std	%f6,	[%l7 + 0x50]
	mulscc	%g5,	%o1,	%o4
	ldd	[%l7 + 0x58],	%i6
	sra	%g2,	%i0,	%o0
	movn	%xcc,	%l1,	%l6
	edge32	%g1,	%o6,	%g4
	ld	[%l7 + 0x48],	%f19
	subcc	%o5,	0x070F,	%i3
	movvs	%icc,	%l5,	%i4
	fcmpgt16	%f6,	%f14,	%l2
	sdivx	%g3,	0x132C,	%i2
	ldsh	[%l7 + 0x0E],	%i7
	save %l0, 0x1377, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o3,	%g7,	%i5
	orcc	%l3,	%l4,	%o7
	edge8l	%i1,	%o2,	%o1
	fpadd16s	%f23,	%f6,	%f23
	umul	%o4,	0x058E,	%g5
	fxnor	%f8,	%f28,	%f18
	andcc	%i6,	0x0249,	%i0
	sth	%g2,	[%l7 + 0x2C]
	ldd	[%l7 + 0x68],	%o0
	movrne	%l1,	0x0A4,	%l6
	andncc	%o6,	%g4,	%g1
	orncc	%i3,	%l5,	%o5
	udivcc	%l2,	0x1F05,	%g3
	sdivcc	%i4,	0x03B5,	%i2
	movrlz	%l0,	%g6,	%i7
	srl	%g7,	%i5,	%l3
	popc	0x1E95,	%o3
	sth	%l4,	[%l7 + 0x58]
	move	%xcc,	%o7,	%o2
	sdivx	%o1,	0x0CE0,	%i1
	fmovdle	%xcc,	%f14,	%f20
	fmovda	%icc,	%f9,	%f22
	nop
	set	0x50, %o7
	stx	%o4,	[%l7 + %o7]
	movrlz	%i6,	%g5,	%g2
	orcc	%i0,	0x19C7,	%l1
	sdiv	%l6,	0x0B7B,	%o0
	addccc	%o6,	0x1DAB,	%g1
	st	%f23,	[%l7 + 0x34]
	addcc	%i3,	%l5,	%o5
	edge16l	%l2,	%g3,	%i4
	mova	%xcc,	%i2,	%g4
	xnor	%g6,	%l0,	%g7
	ldsb	[%l7 + 0x0E],	%i5
	ldsh	[%l7 + 0x56],	%l3
	movg	%xcc,	%i7,	%l4
	movle	%xcc,	%o3,	%o7
	sub	%o1,	0x1487,	%i1
	edge8ln	%o2,	%o4,	%i6
	popc	0x0C59,	%g5
	srl	%g2,	0x07,	%l1
	srax	%i0,	%l6,	%o6
	movvc	%xcc,	%o0,	%i3
	fpadd32	%f2,	%f26,	%f14
	sdivcc	%l5,	0x09B4,	%o5
	xorcc	%g1,	%l2,	%i4
	movvs	%icc,	%g3,	%i2
	mulx	%g4,	0x0B7B,	%g6
	movn	%icc,	%g7,	%l0
	fcmpne32	%f22,	%f26,	%i5
	fmovd	%f26,	%f8
	fmovdn	%xcc,	%f22,	%f30
	movne	%xcc,	%i7,	%l3
	edge32n	%o3,	%o7,	%o1
	movle	%icc,	%l4,	%o2
	movcc	%icc,	%o4,	%i1
	fandnot1	%f28,	%f22,	%f12
	and	%g5,	%g2,	%i6
	edge8l	%i0,	%l6,	%o6
	ld	[%l7 + 0x54],	%f14
	udivx	%l1,	0x0F9B,	%i3
	ldsw	[%l7 + 0x68],	%l5
	udivx	%o0,	0x002F,	%o5
	xor	%g1,	%l2,	%g3
	orcc	%i4,	0x1A08,	%g4
	srl	%g6,	%i2,	%l0
	movg	%icc,	%i5,	%g7
	subc	%l3,	0x06AA,	%i7
	fnot2s	%f13,	%f12
	udiv	%o3,	0x1475,	%o1
	movre	%l4,	0x122,	%o7
	restore %o2, %o4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	0x09,	%i1
	movrgez	%i0,	%i6,	%l6
	movrne	%o6,	0x022,	%i3
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	movl	%icc,	%g1,	%o0
	movvs	%icc,	%g3,	%i4
	fnands	%f7,	%f13,	%f23
	array8	%l2,	%g6,	%i2
	smul	%l0,	%g4,	%g7
	std	%f28,	[%l7 + 0x08]
	xnorcc	%l3,	%i5,	%i7
	fmovrse	%o1,	%f20,	%f1
	sra	%o3,	0x15,	%l4
	srlx	%o2,	%o4,	%o7
	fpadd32s	%f29,	%f31,	%f3
	fmovrse	%g2,	%f24,	%f13
	udiv	%i1,	0x1475,	%i0
	movle	%xcc,	%i6,	%l6
	movrgez	%g5,	0x3C0,	%i3
	stx	%o6,	[%l7 + 0x70]
	edge16n	%l1,	%o5,	%g1
	srl	%l5,	0x06,	%o0
	movg	%xcc,	%g3,	%l2
	sub	%i4,	%i2,	%l0
	xorcc	%g6,	%g7,	%l3
	movrlez	%i5,	0x131,	%g4
	fmuld8ulx16	%f12,	%f4,	%f8
	fmovrde	%i7,	%f2,	%f14
	movrlez	%o1,	0x322,	%l4
	movl	%xcc,	%o2,	%o3
	sth	%o7,	[%l7 + 0x76]
	movgu	%icc,	%o4,	%i1
	andcc	%g2,	0x065C,	%i0
	edge32ln	%l6,	%g5,	%i6
	srax	%i3,	%l1,	%o6
	xnor	%o5,	0x0D50,	%g1
	srax	%l5,	0x16,	%o0
	andn	%g3,	0x0E80,	%i4
	srlx	%i2,	%l0,	%g6
	fmovrsgez	%g7,	%f3,	%f7
	array16	%l2,	%i5,	%g4
	movg	%icc,	%i7,	%l3
	ldx	[%l7 + 0x68],	%l4
	fones	%f27
	array8	%o1,	%o3,	%o7
	alignaddrl	%o2,	%o4,	%g2
	andn	%i0,	0x0EBF,	%l6
	fmovdvs	%xcc,	%f23,	%f14
	st	%f29,	[%l7 + 0x1C]
	umulcc	%i1,	%i6,	%i3
	fmovrsgz	%l1,	%f8,	%f18
	movrlez	%o6,	%g5,	%o5
	fnors	%f14,	%f13,	%f9
	addccc	%g1,	%o0,	%g3
	smulcc	%i4,	%l5,	%l0
	xnorcc	%i2,	%g6,	%g7
	fandnot1s	%f0,	%f22,	%f7
	movle	%icc,	%l2,	%g4
	movg	%xcc,	%i5,	%l3
	ldd	[%l7 + 0x50],	%i6
	edge8l	%l4,	%o1,	%o3
	fcmpeq16	%f20,	%f10,	%o7
	movg	%xcc,	%o2,	%g2
	edge8n	%o4,	%i0,	%l6
	nop
	set	0x5B, %i3
	ldsb	[%l7 + %i3],	%i6
	save %i3, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f28,	%f4,	%f24
	sethi	0x18F6,	%g5
	sethi	0x0AE2,	%o6
	popc	%o5,	%o0
	std	%f0,	[%l7 + 0x10]
	addcc	%g1,	0x1481,	%g3
	movneg	%icc,	%i4,	%l0
	ldd	[%l7 + 0x18],	%l4
	xor	%g6,	%g7,	%i2
	fmovrsne	%l2,	%f4,	%f28
	fnot1s	%f13,	%f6
	or	%g4,	0x0089,	%i5
	fzeros	%f2
	fands	%f12,	%f14,	%f14
	nop
	set	0x6E, %o4
	stb	%l3,	[%l7 + %o4]
	movrgez	%i7,	%l4,	%o3
	alignaddr	%o7,	%o1,	%g2
	fpmerge	%f7,	%f2,	%f0
	sdivx	%o4,	0x1193,	%i0
	st	%f31,	[%l7 + 0x3C]
	and	%o2,	%l6,	%i6
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%i1
	srlx	%l1,	0x1E,	%g5
	orn	%i3,	%o6,	%o5
	movrlez	%g1,	0x0C9,	%o0
	fandnot1	%f6,	%f16,	%f26
	sir	0x016A
	fsrc2	%f16,	%f28
	edge32ln	%g3,	%l0,	%l5
	xnorcc	%g6,	%g7,	%i2
	andncc	%i4,	%l2,	%i5
	fmovdvc	%icc,	%f4,	%f21
	and	%g4,	%i7,	%l4
	ld	[%l7 + 0x24],	%f11
	movne	%icc,	%l3,	%o7
	udivx	%o1,	0x0E23,	%o3
	alignaddrl	%o4,	%g2,	%o2
	mova	%xcc,	%l6,	%i0
	fornot1	%f12,	%f6,	%f10
	xnor	%i1,	%l1,	%i6
	andn	%i3,	0x1BCE,	%g5
	fmovdcs	%icc,	%f22,	%f13
	sdivx	%o5,	0x1297,	%o6
	restore %g1, 0x0430, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%l5,	%g6
	fmovrde	%l0,	%f28,	%f14
	edge16l	%i2,	%i4,	%l2
	std	%f8,	[%l7 + 0x60]
	stw	%g7,	[%l7 + 0x74]
	fcmpeq16	%f28,	%f12,	%g4
	sdivx	%i7,	0x0262,	%l4
	edge16	%i5,	%o7,	%l3
	popc	0x0A0C,	%o1
	edge8n	%o3,	%o4,	%g2
	andncc	%o2,	%l6,	%i0
	ldub	[%l7 + 0x47],	%l1
	orncc	%i1,	0x045A,	%i6
	fcmpne16	%f24,	%f30,	%g5
	fmovde	%xcc,	%f22,	%f19
	edge32ln	%o5,	%i3,	%o6
	sethi	0x0225,	%g3
	movg	%icc,	%g1,	%o0
	fone	%f6
	srax	%g6,	%l0,	%i2
	movrlz	%i4,	0x29B,	%l5
	fones	%f8
	nop
	set	0x1E, %g6
	ldsb	[%l7 + %g6],	%l2
	smul	%g4,	0x161F,	%g7
	xorcc	%i7,	%l4,	%i5
	fmovdne	%xcc,	%f26,	%f17
	edge16n	%o7,	%o1,	%o3
	fnand	%f10,	%f18,	%f10
	add	%o4,	0x1535,	%g2
	srax	%l3,	%l6,	%i0
	alignaddrl	%l1,	%i1,	%i6
	fpack16	%f24,	%f12
	nop
	set	0x40, %i5
	ldsw	[%l7 + %i5],	%o2
	xnor	%o5,	%g5,	%i3
	sir	0x0E8C
	sll	%o6,	0x0D,	%g1
	bshuffle	%f2,	%f12,	%f24
	fone	%f6
	movvs	%xcc,	%o0,	%g3
	subccc	%g6,	0x1015,	%l0
	srl	%i4,	%l5,	%l2
	movre	%i2,	0x268,	%g4
	or	%i7,	%l4,	%g7
	sub	%o7,	%o1,	%i5
	xnor	%o4,	0x02A8,	%o3
	save %g2, 0x0E60, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%l1,	%i1
	fands	%f0,	%f24,	%f29
	st	%f3,	[%l7 + 0x7C]
	fmovrdgz	%i0,	%f14,	%f22
	sdiv	%i6,	0x0386,	%o5
	fnot2	%f16,	%f16
	fmovscc	%icc,	%f30,	%f5
	movcs	%icc,	%o2,	%g5
	and	%o6,	%g1,	%i3
	sdivcc	%o0,	0x1952,	%g6
	fandnot2s	%f12,	%f31,	%f27
	fcmple16	%f8,	%f22,	%l0
	addccc	%i4,	0x10C2,	%g3
	add	%l2,	%i2,	%g4
	srax	%i7,	0x04,	%l4
	andcc	%g7,	%l5,	%o7
	addcc	%o1,	0x1763,	%i5
	fpsub32s	%f26,	%f21,	%f14
	st	%f28,	[%l7 + 0x78]
	sdivx	%o4,	0x1EF8,	%g2
	andncc	%l6,	%o3,	%l1
	ldx	[%l7 + 0x20],	%l3
	movle	%xcc,	%i0,	%i6
	array16	%i1,	%o2,	%g5
	xnor	%o6,	%o5,	%g1
	edge8ln	%o0,	%i3,	%g6
	addc	%l0,	0x1C85,	%g3
	fmovrsgz	%i4,	%f3,	%f26
	nop
	set	0x54, %g2
	ldsw	[%l7 + %g2],	%l2
	sllx	%g4,	0x07,	%i7
	subc	%i2,	%g7,	%l4
	movl	%xcc,	%l5,	%o7
	addcc	%i5,	%o4,	%o1
	fmovrdlez	%g2,	%f14,	%f30
	fmuld8sux16	%f18,	%f5,	%f10
	edge32n	%o3,	%l6,	%l3
	movge	%icc,	%l1,	%i6
	ldsw	[%l7 + 0x1C],	%i1
	xor	%i0,	%o2,	%o6
	fornot1	%f16,	%f0,	%f30
	fexpand	%f30,	%f8
	edge8n	%o5,	%g5,	%g1
	sdivx	%i3,	0x0172,	%o0
	sdivx	%g6,	0x1555,	%l0
	ld	[%l7 + 0x08],	%f14
	fmul8x16al	%f27,	%f15,	%f12
	move	%icc,	%g3,	%l2
	and	%g4,	0x193B,	%i4
	addcc	%i7,	%g7,	%i2
	edge8ln	%l4,	%l5,	%i5
	fornot2	%f12,	%f26,	%f12
	srl	%o4,	%o7,	%g2
	orncc	%o1,	%l6,	%o3
	xor	%l1,	%l3,	%i6
	sllx	%i0,	%o2,	%o6
	ldsw	[%l7 + 0x1C],	%o5
	movneg	%xcc,	%i1,	%g1
	umul	%i3,	0x063B,	%g5
	fmul8x16al	%f1,	%f22,	%f4
	edge8n	%g6,	%o0,	%g3
	edge16n	%l0,	%g4,	%i4
	move	%xcc,	%l2,	%i7
	fsrc2s	%f19,	%f29
	movpos	%xcc,	%g7,	%i2
	movre	%l5,	%l4,	%o4
	fmovsne	%xcc,	%f22,	%f5
	subcc	%o7,	%g2,	%o1
	orcc	%l6,	%o3,	%l1
	ldub	[%l7 + 0x6D],	%i5
	xnor	%i6,	0x021C,	%l3
	umulcc	%o2,	%i0,	%o5
	add	%i1,	%g1,	%i3
	edge8	%g5,	%g6,	%o0
	movleu	%icc,	%o6,	%g3
	ldsw	[%l7 + 0x5C],	%g4
	std	%f26,	[%l7 + 0x48]
	fones	%f0
	lduh	[%l7 + 0x54],	%l0
	srax	%l2,	%i7,	%g7
	ldd	[%l7 + 0x58],	%f20
	addc	%i4,	0x1088,	%l5
	array8	%i2,	%l4,	%o7
	std	%f16,	[%l7 + 0x38]
	edge16l	%o4,	%o1,	%l6
	edge8ln	%g2,	%o3,	%i5
	movgu	%xcc,	%i6,	%l1
	ldsh	[%l7 + 0x60],	%l3
	movcs	%xcc,	%o2,	%o5
	movne	%xcc,	%i0,	%i1
	move	%icc,	%g1,	%i3
	fzero	%f16
	fmovdge	%xcc,	%f31,	%f0
	array8	%g5,	%g6,	%o0
	fmovdg	%icc,	%f25,	%f16
	movrne	%o6,	0x02F,	%g4
	fsrc2s	%f17,	%f17
	sllx	%l0,	0x01,	%l2
	fcmps	%fcc3,	%f20,	%f22
	subcc	%i7,	%g3,	%i4
	edge8n	%l5,	%g7,	%l4
	xnorcc	%o7,	0x076C,	%i2
	movre	%o4,	%l6,	%g2
	ldub	[%l7 + 0x3C],	%o1
	siam	0x6
	movrlz	%o3,	%i6,	%l1
	edge16	%i5,	%o2,	%l3
	stw	%i0,	[%l7 + 0x18]
	fcmpd	%fcc1,	%f6,	%f28
	sllx	%o5,	%i1,	%i3
	andncc	%g5,	%g6,	%g1
	andn	%o0,	0x1A2A,	%o6
	mova	%xcc,	%l0,	%l2
	movge	%xcc,	%g4,	%i7
	umulcc	%i4,	0x0981,	%l5
	movcs	%icc,	%g7,	%g3
	movrgez	%o7,	0x0C4,	%l4
	orncc	%o4,	0x10D4,	%i2
	sra	%g2,	0x12,	%o1
	fpack32	%f24,	%f20,	%f4
	xorcc	%o3,	0x17D6,	%i6
	fmovdneg	%xcc,	%f20,	%f25
	movge	%xcc,	%l1,	%i5
	ld	[%l7 + 0x70],	%f10
	fcmpgt32	%f18,	%f4,	%l6
	umulcc	%l3,	0x0D94,	%o2
	fmovsn	%xcc,	%f18,	%f11
	udivx	%i0,	0x1B2D,	%o5
	for	%f0,	%f0,	%f6
	movneg	%xcc,	%i1,	%i3
	sir	0x0ECF
	std	%f26,	[%l7 + 0x78]
	movrgez	%g6,	0x2AF,	%g5
	fmovscs	%icc,	%f22,	%f1
	fmovrdlz	%g1,	%f16,	%f12
	movrlz	%o6,	0x3B5,	%o0
	stb	%l2,	[%l7 + 0x46]
	movgu	%xcc,	%g4,	%i7
	fcmpeq16	%f26,	%f24,	%l0
	orn	%l5,	%g7,	%i4
	umulcc	%g3,	%l4,	%o4
	smul	%i2,	%o7,	%g2
	fnot2	%f28,	%f2
	sra	%o1,	0x16,	%o3
	ldub	[%l7 + 0x3F],	%l1
	fmovsneg	%icc,	%f22,	%f7
	movcc	%xcc,	%i6,	%l6
	movrgez	%i5,	0x05A,	%l3
	addccc	%o2,	%o5,	%i1
	mulx	%i0,	0x0A0C,	%g6
	fzero	%f4
	save %i3, 0x127B, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f14,	%f6,	%f5
	andcc	%g1,	0x1F0A,	%o6
	fxors	%f31,	%f10,	%f3
	stw	%l2,	[%l7 + 0x34]
	alignaddr	%o0,	%g4,	%l0
	orn	%l5,	%i7,	%g7
	udivcc	%i4,	0x12DC,	%g3
	lduh	[%l7 + 0x16],	%o4
	fmovdn	%icc,	%f26,	%f27
	srl	%i2,	0x03,	%l4
	sub	%o7,	0x0692,	%g2
	movrne	%o1,	%l1,	%i6
	move	%icc,	%o3,	%i5
	fmovdl	%icc,	%f31,	%f24
	nop
	set	0x0C, %o2
	lduh	[%l7 + %o2],	%l3
	lduh	[%l7 + 0x72],	%l6
	mulx	%o2,	%o5,	%i0
	edge8	%g6,	%i3,	%i1
	stw	%g1,	[%l7 + 0x18]
	array16	%o6,	%l2,	%o0
	ldsb	[%l7 + 0x5F],	%g4
	edge32l	%l0,	%l5,	%i7
	sdiv	%g7,	0x1533,	%i4
	mova	%xcc,	%g5,	%g3
	edge8	%o4,	%l4,	%o7
	srax	%g2,	%i2,	%l1
	sth	%i6,	[%l7 + 0x5E]
	edge16l	%o1,	%o3,	%l3
	xnorcc	%i5,	%o2,	%o5
	move	%xcc,	%i0,	%l6
	sethi	0x0709,	%g6
	umulcc	%i3,	0x1A9E,	%i1
	ldd	[%l7 + 0x28],	%f26
	fmovsvc	%xcc,	%f19,	%f23
	edge32n	%g1,	%o6,	%l2
	addcc	%o0,	%l0,	%l5
	movcc	%xcc,	%i7,	%g4
	fpadd16	%f30,	%f14,	%f0
	fmovrdlez	%i4,	%f10,	%f14
	popc	%g7,	%g3
	movge	%xcc,	%o4,	%l4
	movle	%icc,	%g5,	%g2
	mova	%xcc,	%o7,	%l1
	orn	%i2,	0x13E6,	%i6
	orcc	%o3,	%l3,	%o1
	ldd	[%l7 + 0x20],	%o2
	movrgz	%o5,	%i0,	%l6
	movge	%xcc,	%g6,	%i5
	edge16n	%i1,	%i3,	%g1
	movge	%xcc,	%o6,	%o0
	st	%f22,	[%l7 + 0x34]
	stx	%l0,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%l2
	edge8l	%i7,	%g4,	%i4
	ldsw	[%l7 + 0x0C],	%l5
	alignaddr	%g7,	%o4,	%g3
	umulcc	%l4,	0x0E32,	%g5
	save %g2, 0x0D8B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o7,	%i2
	srl	%i6,	0x12,	%l3
	ldd	[%l7 + 0x60],	%f12
	ldx	[%l7 + 0x40],	%o3
	movn	%icc,	%o1,	%o2
	array32	%i0,	%o5,	%g6
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%l6
	fmovsge	%icc,	%f11,	%f21
	srlx	%i5,	0x1A,	%i3
	fors	%f25,	%f0,	%f26
	fpsub32	%f22,	%f14,	%f0
	edge16ln	%i1,	%o6,	%g1
	array32	%o0,	%l0,	%i7
	add	%l2,	%g4,	%l5
	stb	%i4,	[%l7 + 0x70]
	subccc	%g7,	%o4,	%l4
	addcc	%g3,	%g5,	%l1
	array16	%g2,	%o7,	%i6
	movl	%xcc,	%i2,	%l3
	movvc	%icc,	%o1,	%o2
	fmovse	%icc,	%f19,	%f11
	ldsw	[%l7 + 0x7C],	%i0
	fnegd	%f2,	%f22
	move	%icc,	%o3,	%o5
	smulcc	%g6,	%i5,	%i3
	srl	%i1,	0x0F,	%l6
	movl	%xcc,	%g1,	%o0
	srlx	%l0,	%i7,	%o6
	array16	%l2,	%g4,	%i4
	udiv	%g7,	0x16F7,	%l5
	addcc	%l4,	%g3,	%g5
	movcc	%xcc,	%o4,	%l1
	orn	%o7,	%i6,	%i2
	fmovrsne	%l3,	%f28,	%f8
	fmovrslez	%o1,	%f15,	%f2
	sdivx	%g2,	0x0224,	%i0
	edge32n	%o2,	%o3,	%g6
	popc	0x1B7B,	%i5
	orncc	%i3,	%i1,	%o5
	stw	%l6,	[%l7 + 0x48]
	save %o0, 0x03AD, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f15,	%f21,	%f16
	umul	%i7,	%o6,	%l2
	movcc	%xcc,	%g4,	%l0
	fmovdvc	%xcc,	%f22,	%f9
	mulscc	%i4,	%g7,	%l5
	bshuffle	%f26,	%f6,	%f26
	fmovrdlz	%g3,	%f28,	%f18
	srlx	%g5,	0x0A,	%o4
	movrne	%l1,	%o7,	%l4
	umulcc	%i6,	%l3,	%i2
	addccc	%o1,	%i0,	%o2
	ldub	[%l7 + 0x1C],	%o3
	subc	%g2,	%i5,	%i3
	movn	%xcc,	%g6,	%o5
	fmul8x16au	%f22,	%f5,	%f12
	ldd	[%l7 + 0x08],	%i6
	mova	%icc,	%o0,	%i1
	fxnor	%f24,	%f2,	%f22
	move	%icc,	%i7,	%g1
	srlx	%l2,	0x1F,	%o6
	and	%l0,	%i4,	%g4
	ldsw	[%l7 + 0x78],	%g7
	ldx	[%l7 + 0x40],	%g3
	array16	%g5,	%l5,	%o4
	sdivcc	%l1,	0x0A2C,	%l4
	movne	%icc,	%i6,	%l3
	movrlz	%o7,	0x189,	%i2
	edge8ln	%o1,	%i0,	%o3
	array8	%g2,	%o2,	%i5
	movvs	%xcc,	%i3,	%g6
	addccc	%o5,	%o0,	%i1
	movcc	%xcc,	%l6,	%g1
	movpos	%icc,	%l2,	%o6
	array8	%i7,	%i4,	%l0
	edge8l	%g4,	%g3,	%g5
	sdiv	%g7,	0x0A7E,	%l5
	mova	%icc,	%o4,	%l1
	movle	%xcc,	%i6,	%l4
	fmovdcc	%icc,	%f22,	%f3
	array32	%l3,	%i2,	%o1
	stw	%i0,	[%l7 + 0x28]
	lduh	[%l7 + 0x6E],	%o7
	ldd	[%l7 + 0x18],	%f30
	movcc	%xcc,	%o3,	%o2
	array8	%g2,	%i5,	%g6
	movvc	%icc,	%i3,	%o0
	srl	%i1,	%l6,	%o5
	edge16n	%l2,	%o6,	%i7
	fcmpeq32	%f4,	%f18,	%g1
	fnegs	%f16,	%f24
	mulx	%i4,	0x0CAA,	%l0
	edge8l	%g4,	%g3,	%g7
	fmovs	%f13,	%f3
	umul	%g5,	0x0EA5,	%l5
	movvs	%icc,	%o4,	%i6
	fmovsge	%icc,	%f16,	%f15
	sub	%l4,	%l1,	%i2
	save %l3, 0x1081, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	%o3,	%o1
	fmovse	%xcc,	%f8,	%f7
	stx	%g2,	[%l7 + 0x08]
	fmul8x16	%f16,	%f12,	%f10
	or	%o2,	0x143F,	%i5
	movl	%icc,	%g6,	%i3
	fand	%f10,	%f22,	%f26
	edge16	%o0,	%l6,	%o5
	udivx	%i1,	0x0B9A,	%o6
	ldsw	[%l7 + 0x44],	%l2
	array32	%i7,	%i4,	%g1
	edge8n	%l0,	%g3,	%g7
	srlx	%g4,	%l5,	%o4
	fpadd16s	%f5,	%f11,	%f1
	addcc	%g5,	0x097D,	%l4
	edge16n	%i6,	%i2,	%l3
	fmul8sux16	%f12,	%f30,	%f14
	andncc	%i0,	%o7,	%o3
	umul	%l1,	%o1,	%o2
	andn	%g2,	%i5,	%i3
	ldx	[%l7 + 0x20],	%o0
	movcc	%xcc,	%l6,	%g6
	xor	%o5,	%i1,	%l2
	xor	%i7,	%o6,	%i4
	fmovsneg	%xcc,	%f22,	%f2
	movg	%xcc,	%g1,	%g3
	faligndata	%f16,	%f22,	%f6
	fmovsl	%xcc,	%f18,	%f27
	movneg	%xcc,	%g7,	%g4
	fmovsle	%icc,	%f24,	%f9
	orn	%l0,	0x08A2,	%l5
	popc	0x1818,	%g5
	edge32ln	%o4,	%i6,	%l4
	ldsw	[%l7 + 0x78],	%i2
	edge8	%i0,	%o7,	%o3
	edge16	%l1,	%o1,	%l3
	edge16n	%o2,	%i5,	%i3
	lduh	[%l7 + 0x18],	%o0
	sll	%l6,	%g6,	%g2
	or	%i1,	0x0E2A,	%o5
	smulcc	%l2,	%o6,	%i4
	movrlz	%i7,	%g1,	%g3
	edge32n	%g4,	%l0,	%g7
	fxor	%f8,	%f0,	%f26
	movne	%icc,	%l5,	%g5
	movcs	%icc,	%o4,	%i6
	ldsh	[%l7 + 0x24],	%l4
	ldsb	[%l7 + 0x5A],	%i0
	edge32l	%i2,	%o3,	%l1
	sdivx	%o1,	0x1487,	%o7
	sub	%l3,	%o2,	%i5
	srlx	%o0,	%i3,	%g6
	fsrc2	%f30,	%f2
	subccc	%g2,	0x04E5,	%i1
	xnorcc	%o5,	%l2,	%o6
	movrgez	%l6,	%i7,	%g1
	fcmple32	%f28,	%f12,	%g3
	fcmpne16	%f24,	%f20,	%i4
	sra	%l0,	0x0C,	%g7
	stw	%l5,	[%l7 + 0x74]
	lduh	[%l7 + 0x62],	%g5
	fpadd32s	%f14,	%f26,	%f10
	fnand	%f12,	%f28,	%f18
	movneg	%xcc,	%g4,	%i6
	lduh	[%l7 + 0x5E],	%o4
	addcc	%i0,	0x0FB1,	%i2
	udivcc	%o3,	0x0FDB,	%l4
	edge32n	%l1,	%o1,	%l3
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	sdiv	%o7,	0x12AE,	%i3
	fmovscs	%icc,	%f28,	%f6
	movneg	%icc,	%o0,	%g6
	movneg	%icc,	%i1,	%o5
	srl	%l2,	0x16,	%g2
	fnor	%f28,	%f6,	%f12
	sub	%l6,	%o6,	%g1
	nop
	set	0x20, %o5
	ldub	[%l7 + %o5],	%g3
	edge8	%i4,	%l0,	%g7
	subc	%i7,	0x0B0A,	%g5
	fnot2	%f6,	%f2
	nop
	set	0x58, %o6
	ldx	[%l7 + %o6],	%l5
	movl	%xcc,	%i6,	%g4
	movge	%xcc,	%i0,	%i2
	bshuffle	%f30,	%f26,	%f26
	xnorcc	%o4,	%l4,	%l1
	edge8ln	%o1,	%l3,	%o3
	fpmerge	%f4,	%f13,	%f30
	fxnors	%f29,	%f28,	%f0
	array16	%i5,	%o2,	%o7
	fnands	%f0,	%f15,	%f15
	edge16	%o0,	%i3,	%i1
	fxnor	%f18,	%f6,	%f8
	alignaddr	%g6,	%o5,	%g2
	edge8l	%l6,	%o6,	%g1
	movrlez	%l2,	0x3C9,	%i4
	movneg	%icc,	%g3,	%l0
	sth	%i7,	[%l7 + 0x22]
	movrne	%g7,	0x23A,	%g5
	orn	%l5,	0x1B00,	%g4
	movvc	%xcc,	%i0,	%i2
	fcmpd	%fcc2,	%f26,	%f22
	stx	%o4,	[%l7 + 0x70]
	fmovrdgz	%l4,	%f16,	%f18
	fmovrsgez	%i6,	%f24,	%f23
	movre	%o1,	%l1,	%o3
	fmovsge	%icc,	%f20,	%f4
	add	%i5,	0x1FF6,	%o2
	fmovsle	%xcc,	%f16,	%f19
	fmovrse	%o7,	%f23,	%f19
	sra	%o0,	%l3,	%i3
	sdivx	%i1,	0x156B,	%g6
	restore %o5, %g2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g1,	0x0210,	%l6
	edge32n	%i4,	%l2,	%g3
	edge32ln	%i7,	%g7,	%g5
	stx	%l5,	[%l7 + 0x40]
	xor	%l0,	0x0B85,	%i0
	std	%f20,	[%l7 + 0x18]
	subcc	%i2,	%g4,	%o4
	udivx	%i6,	0x0206,	%o1
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%l4
	mulx	%o3,	0x0D5F,	%i5
	edge16l	%o2,	%o7,	%l1
	ld	[%l7 + 0x08],	%f13
	std	%f4,	[%l7 + 0x18]
	xnorcc	%l3,	%i3,	%i1
	mulscc	%g6,	0x1F78,	%o5
	subc	%o0,	0x1489,	%o6
	movvc	%xcc,	%g1,	%l6
	andncc	%g2,	%i4,	%l2
	save %i7, 0x0E54, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g3,	%l5,	%g5
	fmovsne	%icc,	%f30,	%f29
	ldub	[%l7 + 0x12],	%l0
	movrgez	%i2,	0x19C,	%g4
	sll	%o4,	%i0,	%i6
	udivx	%o1,	0x0B6D,	%l4
	stx	%o3,	[%l7 + 0x08]
	st	%f11,	[%l7 + 0x64]
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	edge8ln	%l1,	%l3,	%o2
	and	%i1,	0x1C51,	%i3
	subcc	%o5,	0x09DA,	%g6
	ldd	[%l7 + 0x70],	%o6
	ldd	[%l7 + 0x70],	%g0
	fsrc1s	%f10,	%f7
	subcc	%l6,	%g2,	%o0
	edge32ln	%l2,	%i7,	%g7
	ldsw	[%l7 + 0x18],	%i4
	movge	%icc,	%g3,	%l5
	udivx	%g5,	0x1BF3,	%i2
	xnorcc	%g4,	%l0,	%o4
	andn	%i0,	0x1FC2,	%o1
	udivx	%i6,	0x1650,	%l4
	array16	%i5,	%o3,	%l1
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%l3
	sll	%o7,	0x05,	%i1
	movcs	%xcc,	%o2,	%i3
	fandnot1s	%f7,	%f24,	%f18
	std	%f22,	[%l7 + 0x30]
	movneg	%xcc,	%g6,	%o5
	lduh	[%l7 + 0x16],	%g1
	ldsb	[%l7 + 0x39],	%l6
	fmovdvs	%xcc,	%f16,	%f6
	sdivx	%g2,	0x0282,	%o6
	subc	%l2,	%o0,	%g7
	edge32	%i7,	%g3,	%l5
	sra	%g5,	%i2,	%i4
	movcs	%xcc,	%g4,	%o4
	fandnot2s	%f14,	%f14,	%f7
	fpadd16	%f28,	%f24,	%f24
	fmul8x16au	%f15,	%f22,	%f4
	alignaddr	%l0,	%o1,	%i0
	movrlz	%i6,	0x16D,	%l4
	addc	%o3,	%i5,	%l1
	edge8ln	%l3,	%i1,	%o7
	sethi	0x110B,	%i3
	nop
	set	0x3A, %g1
	ldsh	[%l7 + %g1],	%o2
	fnors	%f29,	%f20,	%f4
	add	%o5,	%g1,	%g6
	edge8	%l6,	%g2,	%l2
	mulx	%o0,	%o6,	%g7
	sth	%g3,	[%l7 + 0x42]
	movrlz	%i7,	0x010,	%g5
	edge8n	%l5,	%i4,	%i2
	edge8n	%g4,	%o4,	%l0
	fexpand	%f27,	%f20
	sdivx	%i0,	0x1E95,	%o1
	sth	%i6,	[%l7 + 0x5E]
	movpos	%icc,	%o3,	%l4
	fexpand	%f13,	%f30
	movcs	%icc,	%l1,	%l3
	fmovsgu	%icc,	%f13,	%f1
	restore %i1, 0x0689, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i3,	%o2,	%i5
	movneg	%xcc,	%g1,	%o5
	save %l6, %g2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g6,	[%l7 + 0x66]
	ldd	[%l7 + 0x48],	%f6
	fandnot1s	%f26,	%f3,	%f6
	edge32	%o0,	%g7,	%o6
	xnor	%i7,	0x0517,	%g5
	faligndata	%f10,	%f16,	%f16
	subccc	%l5,	0x0B60,	%i4
	movrgz	%g3,	0x165,	%g4
	fmovsvc	%xcc,	%f29,	%f7
	udivcc	%o4,	0x07FE,	%l0
	alignaddrl	%i0,	%o1,	%i6
	edge8	%i2,	%l4,	%o3
	st	%f12,	[%l7 + 0x10]
	fmul8x16	%f29,	%f0,	%f30
	fmovsg	%xcc,	%f14,	%f10
	fmovsvc	%xcc,	%f25,	%f7
	std	%f30,	[%l7 + 0x60]
	array32	%l1,	%l3,	%o7
	mulscc	%i3,	0x1A3B,	%i1
	fmovdvc	%xcc,	%f9,	%f23
	sll	%i5,	%o2,	%o5
	alignaddr	%g1,	%g2,	%l6
	fnot1	%f2,	%f14
	fand	%f20,	%f28,	%f6
	edge16n	%l2,	%o0,	%g7
	xnor	%g6,	%i7,	%o6
	fandnot2	%f6,	%f16,	%f6
	fpsub16s	%f8,	%f21,	%f20
	movn	%xcc,	%g5,	%l5
	movpos	%icc,	%i4,	%g4
	movrgez	%o4,	%g3,	%l0
	andcc	%o1,	%i0,	%i6
	movpos	%icc,	%l4,	%i2
	umulcc	%l1,	%l3,	%o7
	subccc	%o3,	%i1,	%i5
	edge8	%o2,	%o5,	%i3
	fxor	%f14,	%f30,	%f6
	orcc	%g2,	0x0676,	%l6
	subc	%l2,	%o0,	%g1
	fnot1	%f6,	%f16
	alignaddrl	%g7,	%i7,	%g6
	movn	%xcc,	%g5,	%l5
	array32	%i4,	%g4,	%o4
	ldd	[%l7 + 0x68],	%o6
	movge	%icc,	%g3,	%o1
	ld	[%l7 + 0x64],	%f3
	fmovdl	%xcc,	%f15,	%f0
	movrne	%l0,	0x2B1,	%i0
	ldd	[%l7 + 0x40],	%l4
	nop
	set	0x6C, %i4
	lduh	[%l7 + %i4],	%i6
	st	%f18,	[%l7 + 0x48]
	movleu	%icc,	%l1,	%l3
	fmovscc	%xcc,	%f5,	%f11
	orncc	%i2,	0x00AE,	%o7
	movrne	%o3,	%i1,	%i5
	sth	%o2,	[%l7 + 0x76]
	edge32ln	%o5,	%i3,	%l6
	move	%icc,	%l2,	%g2
	fmovsg	%icc,	%f28,	%f6
	edge8n	%g1,	%g7,	%i7
	subccc	%g6,	0x1820,	%o0
	nop
	set	0x18, %l0
	std	%f18,	[%l7 + %l0]
	movvc	%icc,	%l5,	%i4
	fmul8x16al	%f0,	%f4,	%f8
	movrgez	%g5,	%g4,	%o4
	addccc	%g3,	0x120E,	%o1
	orn	%o6,	0x0405,	%i0
	fnand	%f20,	%f12,	%f4
	fpadd16	%f12,	%f14,	%f10
	orn	%l4,	%i6,	%l1
	srl	%l3,	%l0,	%o7
	movgu	%icc,	%o3,	%i2
	umulcc	%i5,	%o2,	%o5
	ldx	[%l7 + 0x60],	%i1
	mulscc	%i3,	%l6,	%l2
	movne	%icc,	%g1,	%g2
	umul	%g7,	0x114A,	%g6
	and	%i7,	0x1246,	%o0
	sdivcc	%i4,	0x09B9,	%g5
	movg	%xcc,	%g4,	%o4
	edge8n	%g3,	%l5,	%o6
	array16	%o1,	%i0,	%l4
	udivx	%i6,	0x1F4E,	%l3
	udivx	%l0,	0x0DD0,	%l1
	ldub	[%l7 + 0x7B],	%o3
	sdivcc	%i2,	0x1ACA,	%i5
	fsrc2	%f10,	%f0
	andncc	%o7,	%o5,	%o2
	fmovrsne	%i3,	%f24,	%f23
	subc	%i1,	%l6,	%l2
	movle	%icc,	%g1,	%g2
	fmovsge	%xcc,	%f5,	%f0
	xnorcc	%g7,	%i7,	%g6
	alignaddr	%i4,	%g5,	%o0
	mova	%xcc,	%g4,	%g3
	movcs	%icc,	%l5,	%o4
	addc	%o6,	%o1,	%i0
	xnorcc	%i6,	0x1B19,	%l4
	for	%f18,	%f30,	%f14
	srax	%l3,	%l1,	%o3
	movl	%icc,	%l0,	%i5
	fnegd	%f26,	%f24
	edge8l	%i2,	%o7,	%o2
	fmovdne	%xcc,	%f13,	%f14
	movg	%icc,	%o5,	%i1
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	lduh	[%l7 + 0x3E],	%l2
	movrgez	%g7,	%g2,	%g6
	fnot2s	%f23,	%f23
	subccc	%i4,	0x031A,	%i7
	edge8	%g5,	%o0,	%g3
	or	%l5,	0x1B08,	%o4
	fcmpd	%fcc0,	%f20,	%f30
	ldsb	[%l7 + 0x5C],	%g4
	fands	%f1,	%f23,	%f10
	ldd	[%l7 + 0x10],	%o0
	nop
	set	0x50, %l2
	ldx	[%l7 + %l2],	%i0
	std	%f28,	[%l7 + 0x28]
	stb	%i6,	[%l7 + 0x49]
	movg	%icc,	%o6,	%l4
	fxnor	%f22,	%f4,	%f6
	orn	%l1,	0x0559,	%o3
	sdivcc	%l0,	0x1658,	%l3
	sdivx	%i5,	0x03B2,	%o7
	stw	%o2,	[%l7 + 0x5C]
	movrlez	%o5,	0x15A,	%i2
	umulcc	%i1,	0x04EE,	%i3
	sllx	%g1,	%l2,	%g7
	ld	[%l7 + 0x3C],	%f12
	sth	%l6,	[%l7 + 0x2C]
	subc	%g6,	%g2,	%i4
	xorcc	%i7,	0x1A7E,	%g5
	movg	%icc,	%g3,	%o0
	edge8n	%o4,	%l5,	%o1
	addc	%g4,	0x1CA3,	%i0
	addccc	%i6,	%l4,	%l1
	edge32l	%o3,	%o6,	%l3
	fxnor	%f24,	%f14,	%f30
	fmovscc	%icc,	%f16,	%f14
	ldd	[%l7 + 0x30],	%f26
	sub	%i5,	0x17DA,	%l0
	mulx	%o2,	0x1175,	%o5
	srlx	%o7,	0x0C,	%i1
	ldsb	[%l7 + 0x17],	%i3
	fmovrdlez	%i2,	%f12,	%f28
	fmovspos	%xcc,	%f19,	%f17
	movne	%xcc,	%g1,	%g7
	fmovsg	%xcc,	%f5,	%f6
	sir	0x1B11
	fpmerge	%f22,	%f3,	%f14
	andcc	%l2,	%l6,	%g2
	ldd	[%l7 + 0x30],	%f16
	ldsw	[%l7 + 0x18],	%i4
	alignaddr	%g6,	%g5,	%i7
	movgu	%icc,	%g3,	%o0
	edge16ln	%o4,	%l5,	%o1
	movgu	%icc,	%g4,	%i6
	fmovrslez	%l4,	%f20,	%f19
	edge16l	%l1,	%o3,	%o6
	fcmpes	%fcc0,	%f29,	%f4
	edge16	%l3,	%i0,	%l0
	orcc	%o2,	%o5,	%o7
	movre	%i5,	%i3,	%i1
	addc	%g1,	%g7,	%l2
	orn	%i2,	0x09D2,	%g2
	movvc	%icc,	%l6,	%i4
	fmovrdne	%g5,	%f2,	%f30
	fmovdleu	%icc,	%f2,	%f6
	ldd	[%l7 + 0x20],	%i6
	movne	%icc,	%g3,	%g6
	movle	%xcc,	%o4,	%o0
	add	%o1,	0x0BCF,	%l5
	edge32	%g4,	%l4,	%l1
	move	%xcc,	%o3,	%i6
	fcmpgt16	%f10,	%f20,	%o6
	movrgz	%l3,	%l0,	%i0
	movrgez	%o2,	%o5,	%i5
	ldsb	[%l7 + 0x2A],	%o7
	ld	[%l7 + 0x14],	%f16
	sll	%i3,	0x0D,	%i1
	nop
	set	0x30, %i1
	ldsw	[%l7 + %i1],	%g7
	fcmpne32	%f4,	%f10,	%g1
	movg	%icc,	%i2,	%l2
	alignaddr	%l6,	%g2,	%g5
	edge16ln	%i7,	%i4,	%g6
	fpsub16s	%f0,	%f6,	%f14
	save %g3, %o0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%o4,	%g4
	stx	%l1,	[%l7 + 0x10]
	sdivx	%o3,	0x09F9,	%l4
	ldx	[%l7 + 0x40],	%i6
	movne	%icc,	%l3,	%l0
	sethi	0x0330,	%i0
	smul	%o6,	0x0121,	%o5
	sra	%o2,	%o7,	%i5
	edge8ln	%i3,	%i1,	%g1
	popc	%i2,	%l2
	srlx	%g7,	0x1A,	%l6
	srlx	%g5,	0x0A,	%g2
	for	%f4,	%f30,	%f12
	fmul8x16	%f31,	%f0,	%f28
	sll	%i4,	0x0D,	%i7
	sdivx	%g3,	0x02D9,	%o0
	ld	[%l7 + 0x38],	%f22
	edge8n	%g6,	%o1,	%l5
	save %g4, %l1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l4,	0x1C5D,	%o3
	subcc	%l3,	%i6,	%i0
	smul	%l0,	0x18EA,	%o6
	fpsub16	%f0,	%f10,	%f14
	edge32l	%o5,	%o7,	%i5
	fones	%f29
	sdivcc	%o2,	0x1BCF,	%i1
	srl	%i3,	0x17,	%g1
	xorcc	%i2,	0x1417,	%l2
	lduh	[%l7 + 0x3E],	%l6
	fmovrslz	%g7,	%f12,	%f8
	orn	%g2,	0x18F8,	%g5
	andncc	%i4,	%i7,	%o0
	movgu	%icc,	%g6,	%g3
	fsrc2	%f28,	%f22
	edge32ln	%o1,	%g4,	%l5
	move	%xcc,	%o4,	%l4
	edge32ln	%o3,	%l1,	%l3
	xor	%i6,	%i0,	%o6
	lduh	[%l7 + 0x78],	%l0
	movrgez	%o5,	0x13F,	%o7
	array32	%o2,	%i1,	%i3
	nop
	set	0x6D, %g7
	ldsb	[%l7 + %g7],	%i5
	st	%f1,	[%l7 + 0x7C]
	sra	%g1,	0x1A,	%i2
	alignaddr	%l2,	%l6,	%g7
	fzero	%f0
	fmovsl	%xcc,	%f27,	%f5
	movrgez	%g5,	0x2CC,	%g2
	andncc	%i7,	%i4,	%o0
	movle	%icc,	%g6,	%o1
	andncc	%g3,	%l5,	%g4
	and	%l4,	%o3,	%o4
	udivcc	%l1,	0x04E6,	%l3
	edge16	%i0,	%o6,	%i6
	subccc	%o5,	%o7,	%o2
	movl	%xcc,	%i1,	%l0
	edge16	%i3,	%i5,	%g1
	smul	%l2,	0x1419,	%i2
	fmovsne	%icc,	%f7,	%f29
	udiv	%l6,	0x1997,	%g7
	fmovsa	%xcc,	%f14,	%f2
	ld	[%l7 + 0x3C],	%f24
	movrgez	%g2,	0x024,	%g5
	movrlz	%i4,	%i7,	%o0
	stw	%g6,	[%l7 + 0x2C]
	sllx	%g3,	%o1,	%g4
	xnor	%l5,	0x0E4E,	%l4
	sdivcc	%o4,	0x0404,	%o3
	alignaddr	%l1,	%i0,	%o6
	smulcc	%l3,	0x1728,	%i6
	movrlz	%o7,	%o5,	%o2
	fands	%f24,	%f21,	%f27
	smul	%l0,	%i1,	%i3
	srlx	%g1,	%l2,	%i2
	edge32l	%l6,	%i5,	%g2
	sir	0x127A
	movge	%xcc,	%g5,	%g7
	edge8l	%i7,	%i4,	%g6
	stx	%g3,	[%l7 + 0x58]
	ldd	[%l7 + 0x70],	%f16
	edge8l	%o1,	%g4,	%o0
	fabss	%f6,	%f31
	subc	%l5,	%l4,	%o3
	udiv	%l1,	0x0F7B,	%o4
	movle	%icc,	%o6,	%i0
	stw	%i6,	[%l7 + 0x60]
	sub	%o7,	0x1A6C,	%l3
	sdiv	%o5,	0x07A2,	%o2
	ldsh	[%l7 + 0x76],	%l0
	orncc	%i1,	%g1,	%l2
	lduw	[%l7 + 0x1C],	%i2
	st	%f4,	[%l7 + 0x18]
	sll	%i3,	0x13,	%l6
	sub	%i5,	0x0E18,	%g2
	umul	%g7,	%i7,	%i4
	array16	%g5,	%g6,	%o1
	sdiv	%g4,	0x088C,	%o0
	ldsw	[%l7 + 0x54],	%g3
	movrlez	%l4,	%o3,	%l1
	fmovsleu	%xcc,	%f18,	%f4
	mulscc	%l5,	0x12A2,	%o4
	fmul8x16al	%f10,	%f23,	%f2
	movn	%xcc,	%i0,	%i6
	edge16l	%o7,	%o6,	%l3
	edge16n	%o5,	%o2,	%l0
	movpos	%xcc,	%g1,	%l2
	stb	%i2,	[%l7 + 0x6B]
	fornot1s	%f23,	%f19,	%f7
	movcs	%xcc,	%i1,	%l6
	fnor	%f8,	%f28,	%f4
	or	%i5,	0x0FAE,	%i3
	subcc	%g2,	%i7,	%g7
	movpos	%xcc,	%g5,	%i4
	edge32	%g6,	%o1,	%g4
	edge16l	%o0,	%l4,	%g3
	sll	%l1,	0x05,	%l5
	udivx	%o4,	0x0E01,	%o3
	movvc	%icc,	%i0,	%i6
	fnot2	%f20,	%f16
	subc	%o6,	%l3,	%o5
	fmovdneg	%icc,	%f9,	%f27
	addc	%o2,	0x16B2,	%o7
	movleu	%xcc,	%g1,	%l0
	save %i2, 0x0793, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f18,	%f18,	%l2
	fmovd	%f20,	%f28
	for	%f6,	%f4,	%f0
	fpsub16s	%f1,	%f30,	%f5
	array16	%l6,	%i5,	%i3
	sdivx	%g2,	0x1E43,	%i7
	movrlz	%g5,	0x249,	%g7
	umul	%i4,	0x0E85,	%o1
	sth	%g6,	[%l7 + 0x5A]
	edge16n	%g4,	%o0,	%l4
	edge32n	%g3,	%l5,	%o4
	subccc	%l1,	0x15D1,	%o3
	movrgz	%i0,	0x0AF,	%o6
	fones	%f26
	fpadd16	%f2,	%f6,	%f10
	stx	%l3,	[%l7 + 0x18]
	movgu	%icc,	%o5,	%o2
	movl	%xcc,	%i6,	%o7
	sth	%l0,	[%l7 + 0x42]
	for	%f30,	%f8,	%f20
	alignaddrl	%g1,	%i1,	%l2
	ld	[%l7 + 0x34],	%f18
	mova	%icc,	%i2,	%i5
	andn	%l6,	%g2,	%i3
	fnot1s	%f2,	%f15
	sth	%g5,	[%l7 + 0x46]
	mova	%icc,	%g7,	%i4
	sdivcc	%i7,	0x0B9C,	%g6
	stx	%o1,	[%l7 + 0x10]
	restore %g4, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f26,	%f24,	%f14
	fmovs	%f28,	%f31
	movvs	%icc,	%l5,	%o4
	movne	%xcc,	%g3,	%l1
	movrlez	%o3,	%i0,	%o6
	fcmpes	%fcc2,	%f14,	%f19
	edge32	%o5,	%l3,	%i6
	stw	%o7,	[%l7 + 0x24]
	fmul8ulx16	%f6,	%f20,	%f30
	fmul8x16al	%f25,	%f31,	%f30
	fands	%f11,	%f19,	%f25
	sra	%o2,	0x11,	%l0
	fxor	%f22,	%f30,	%f24
	edge8l	%g1,	%i1,	%i2
	popc	0x088F,	%i5
	lduw	[%l7 + 0x4C],	%l2
	sth	%g2,	[%l7 + 0x66]
	fmovd	%f22,	%f16
	fmovsleu	%xcc,	%f15,	%f16
	srax	%i3,	0x19,	%g5
	fcmpgt32	%f2,	%f16,	%l6
	sethi	0x0C42,	%i4
	sdivx	%g7,	0x0185,	%g6
	fmul8ulx16	%f12,	%f10,	%f10
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	addc	%o1,	%o0,	%l4
	fnegd	%f30,	%f26
	srlx	%l5,	0x1B,	%o4
	movpos	%xcc,	%l1,	%g3
	movn	%xcc,	%i0,	%o3
	and	%o6,	%o5,	%l3
	fxor	%f26,	%f26,	%f28
	pdist	%f12,	%f2,	%f14
	srlx	%o7,	%i6,	%o2
	movrne	%l0,	%g1,	%i2
	sdiv	%i5,	0x1AAB,	%i1
	fabss	%f28,	%f11
	movre	%g2,	0x2A0,	%l2
	lduh	[%l7 + 0x40],	%i3
	edge16ln	%g5,	%l6,	%i4
	movrlez	%g6,	0x3E6,	%g7
	edge32	%g4,	%i7,	%o1
	sethi	0x04ED,	%o0
	stb	%l4,	[%l7 + 0x6F]
	smulcc	%l5,	0x1B75,	%l1
	fpackfix	%f20,	%f17
	sdiv	%g3,	0x080D,	%o4
	srlx	%i0,	%o3,	%o6
	save %l3, 0x1045, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o5,	%i6,	%l0
	array32	%g1,	%o2,	%i5
	ld	[%l7 + 0x30],	%f3
	movne	%xcc,	%i1,	%i2
	edge32	%g2,	%l2,	%i3
	array16	%g5,	%i4,	%l6
	edge8ln	%g6,	%g7,	%g4
	sra	%o1,	%i7,	%o0
	add	%l4,	%l5,	%l1
	movcs	%icc,	%o4,	%g3
	nop
	set	0x34, %o0
	ldsw	[%l7 + %o0],	%i0
	edge32	%o6,	%o3,	%l3
	fmovrslz	%o7,	%f31,	%f5
	edge8l	%i6,	%o5,	%g1
	movg	%icc,	%l0,	%i5
	fcmple16	%f2,	%f22,	%i1
	array32	%o2,	%g2,	%l2
	orncc	%i3,	%i2,	%i4
	xnorcc	%g5,	%l6,	%g7
	fabsd	%f22,	%f22
	edge8l	%g6,	%o1,	%g4
	xor	%o0,	0x1AED,	%i7
	xorcc	%l4,	0x1B4E,	%l1
	fcmps	%fcc1,	%f24,	%f30
	fmovdg	%icc,	%f19,	%f9
	sdivcc	%o4,	0x0BFC,	%g3
	fxnors	%f16,	%f6,	%f14
	fmovsn	%icc,	%f25,	%f20
	sir	0x0399
	fcmpeq16	%f8,	%f26,	%l5
	ld	[%l7 + 0x0C],	%f16
	fmul8sux16	%f26,	%f24,	%f2
	fnors	%f3,	%f20,	%f22
	fmovsl	%icc,	%f13,	%f23
	orn	%i0,	0x0F21,	%o6
	fmul8x16au	%f26,	%f27,	%f22
	sethi	0x0ABA,	%l3
	movne	%icc,	%o3,	%i6
	stb	%o7,	[%l7 + 0x22]
	fpsub32s	%f2,	%f26,	%f7
	fmovdgu	%xcc,	%f28,	%f15
	stx	%o5,	[%l7 + 0x50]
	mova	%icc,	%g1,	%i5
	or	%i1,	0x1E97,	%l0
	fmovsne	%icc,	%f5,	%f31
	orn	%o2,	%g2,	%l2
	edge32ln	%i2,	%i3,	%i4
	udivx	%g5,	0x19E2,	%l6
	smulcc	%g7,	0x0A3B,	%g6
	lduh	[%l7 + 0x12],	%g4
	lduh	[%l7 + 0x78],	%o0
	umul	%o1,	0x1D57,	%i7
	array16	%l4,	%o4,	%g3
	add	%l1,	0x0BE3,	%i0
	movle	%xcc,	%o6,	%l5
	udiv	%l3,	0x11B7,	%i6
	fmovsge	%xcc,	%f17,	%f9
	ldd	[%l7 + 0x10],	%f28
	movl	%icc,	%o7,	%o3
	edge8ln	%g1,	%o5,	%i1
	andncc	%l0,	%i5,	%o2
	fornot2	%f26,	%f26,	%f0
	edge32ln	%l2,	%i2,	%i3
	fmovrsgez	%i4,	%f24,	%f29
	edge8n	%g2,	%g5,	%g7
	fmovdcs	%xcc,	%f27,	%f7
	fnors	%f3,	%f12,	%f10
	ldsw	[%l7 + 0x1C],	%g6
	movg	%icc,	%l6,	%o0
	fpadd32s	%f27,	%f4,	%f21
	movrlz	%o1,	0x22D,	%g4
	orcc	%i7,	0x0B1B,	%l4
	fmovdl	%xcc,	%f21,	%f20
	ld	[%l7 + 0x7C],	%f4
	fcmpne16	%f8,	%f14,	%g3
	orncc	%l1,	%o4,	%o6
	fcmpgt32	%f18,	%f30,	%i0
	udivx	%l3,	0x0098,	%i6
	addccc	%l5,	%o3,	%g1
	xorcc	%o5,	%i1,	%o7
	fmovdle	%xcc,	%f27,	%f5
	edge8n	%i5,	%o2,	%l0
	udivcc	%l2,	0x10A8,	%i3
	popc	0x0E1D,	%i2
	fpackfix	%f20,	%f19
	st	%f7,	[%l7 + 0x0C]
	edge32	%i4,	%g2,	%g7
	movrlez	%g6,	%g5,	%l6
	smulcc	%o1,	%o0,	%i7
	edge32l	%g4,	%l4,	%g3
	alignaddr	%l1,	%o4,	%i0
	ld	[%l7 + 0x10],	%f7
	edge16l	%l3,	%o6,	%l5
	orn	%o3,	%g1,	%o5
	fmovde	%icc,	%f25,	%f23
	fandnot1s	%f0,	%f14,	%f29
	sth	%i1,	[%l7 + 0x22]
	edge16ln	%o7,	%i6,	%o2
	movleu	%icc,	%i5,	%l2
	edge8n	%l0,	%i3,	%i4
	movrne	%g2,	%i2,	%g6
	andncc	%g7,	%l6,	%o1
	movneg	%xcc,	%o0,	%g5
	movne	%icc,	%g4,	%l4
	orn	%i7,	0x16B4,	%l1
	move	%icc,	%o4,	%g3
	sth	%l3,	[%l7 + 0x34]
	movcs	%xcc,	%i0,	%l5
	array16	%o6,	%g1,	%o3
	ldsb	[%l7 + 0x46],	%o5
	movgu	%xcc,	%i1,	%o7
	alignaddrl	%i6,	%i5,	%l2
	edge32ln	%o2,	%l0,	%i4
	sub	%g2,	0x1797,	%i3
	movgu	%icc,	%g6,	%i2
	fmovdg	%xcc,	%f17,	%f23
	std	%f16,	[%l7 + 0x40]
	array32	%g7,	%l6,	%o1
	xor	%g5,	%o0,	%g4
	sdiv	%l4,	0x1444,	%l1
	fmul8x16al	%f7,	%f5,	%f18
	fxors	%f22,	%f20,	%f24
	sth	%o4,	[%l7 + 0x68]
	lduw	[%l7 + 0x6C],	%g3
	edge16n	%l3,	%i0,	%i7
	fmovdl	%icc,	%f14,	%f1
	udivx	%o6,	0x0BAE,	%l5
	lduh	[%l7 + 0x2A],	%g1
	movn	%icc,	%o3,	%i1
	fsrc1	%f6,	%f10
	fmovscs	%icc,	%f1,	%f23
	andncc	%o7,	%i6,	%i5
	fmovsge	%xcc,	%f12,	%f12
	fcmpes	%fcc1,	%f3,	%f24
	ldx	[%l7 + 0x70],	%l2
	sllx	%o5,	0x04,	%l0
	addccc	%o2,	%i4,	%i3
	movne	%icc,	%g6,	%i2
	fornot2s	%f2,	%f22,	%f19
	movcs	%icc,	%g2,	%g7
	edge16n	%o1,	%g5,	%o0
	edge32l	%g4,	%l6,	%l1
	fcmpgt32	%f0,	%f30,	%o4
	ldsh	[%l7 + 0x72],	%g3
	sir	0x16D4
	mova	%xcc,	%l4,	%l3
	fornot2s	%f11,	%f17,	%f22
	movrne	%i7,	%i0,	%o6
	movgu	%icc,	%l5,	%o3
	lduw	[%l7 + 0x54],	%i1
	edge16l	%o7,	%g1,	%i5
	movcc	%icc,	%i6,	%l2
	ldsw	[%l7 + 0x54],	%o5
	fmul8sux16	%f18,	%f22,	%f28
	udivx	%o2,	0x10FD,	%i4
	addccc	%i3,	%l0,	%i2
	fmovdneg	%icc,	%f15,	%f6
	addccc	%g6,	0x1450,	%g7
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%o1
	restore %g5, %g2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%l6,	%l1
	ld	[%l7 + 0x0C],	%f14
	ldsh	[%l7 + 0x36],	%o4
	ldub	[%l7 + 0x23],	%g3
	sdivcc	%l4,	0x1810,	%l3
	save %i7, 0x1AFD, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x2A],	%l5
	andcc	%o3,	%i1,	%o7
	movrne	%i0,	%g1,	%i6
	addccc	%l2,	0x0EF1,	%i5
	fmovdcs	%xcc,	%f11,	%f8
	movge	%xcc,	%o5,	%o2
	alignaddr	%i4,	%i3,	%l0
	andn	%i2,	0x06A8,	%g6
	mulscc	%o1,	%g5,	%g2
	subcc	%g7,	%o0,	%g4
	udivx	%l1,	0x01FC,	%o4
	umul	%l6,	%g3,	%l4
	fone	%f24
	edge16n	%i7,	%o6,	%l5
	sll	%o3,	0x1A,	%i1
	movg	%xcc,	%l3,	%i0
	sir	0x0BF6
	udiv	%o7,	0x0A1A,	%i6
	sllx	%l2,	%i5,	%g1
	smul	%o5,	0x025C,	%i4
	srax	%o2,	0x15,	%l0
	orn	%i2,	%g6,	%i3
	sth	%o1,	[%l7 + 0x3E]
	andncc	%g5,	%g7,	%o0
	subc	%g2,	%g4,	%l1
	fandnot1	%f24,	%f10,	%f24
	movpos	%icc,	%l6,	%o4
	ldub	[%l7 + 0x57],	%g3
	sll	%i7,	%l4,	%l5
	movcs	%icc,	%o6,	%o3
	save %l3, 0x19D3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i1,	%o7
	movrlez	%l2,	%i5,	%i6
	movne	%xcc,	%g1,	%i4
	edge32l	%o2,	%o5,	%i2
	edge32n	%g6,	%l0,	%i3
	fnegd	%f0,	%f4
	addc	%o1,	%g7,	%o0
	fone	%f8
	fmovsn	%icc,	%f25,	%f26
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f26
	array16	%g2,	%g5,	%g4
	fmovsn	%icc,	%f0,	%f22
	mova	%icc,	%l6,	%o4
	subccc	%g3,	0x0647,	%l1
	for	%f26,	%f30,	%f18
	std	%f8,	[%l7 + 0x38]
	subc	%i7,	%l5,	%l4
	xorcc	%o6,	0x063A,	%o3
	ldsh	[%l7 + 0x6A],	%l3
	edge16n	%i0,	%i1,	%o7
	udivx	%i5,	0x1DB1,	%i6
	fsrc1	%f26,	%f2
	fpadd32s	%f7,	%f23,	%f20
	fandnot1	%f18,	%f10,	%f16
	movrne	%l2,	0x3B0,	%g1
	andcc	%i4,	%o5,	%i2
	edge8	%o2,	%l0,	%g6
	alignaddrl	%i3,	%g7,	%o1
	edge32	%g2,	%o0,	%g5
	fand	%f10,	%f22,	%f6
	fpackfix	%f18,	%f1
	fands	%f3,	%f2,	%f14
	srl	%l6,	%g4,	%o4
	srl	%l1,	%i7,	%g3
	fmovrdgez	%l4,	%f30,	%f30
	edge16	%l5,	%o3,	%o6
	fnor	%f12,	%f24,	%f12
	movcc	%icc,	%i0,	%l3
	fandnot1	%f18,	%f20,	%f26
	fmovdgu	%icc,	%f29,	%f11
	xnorcc	%o7,	%i5,	%i1
	movle	%icc,	%i6,	%l2
	movn	%xcc,	%i4,	%o5
	fmovsneg	%icc,	%f17,	%f9
	sdivx	%g1,	0x14A9,	%i2
	ld	[%l7 + 0x34],	%f31
	movvc	%icc,	%o2,	%l0
	movrgz	%g6,	0x052,	%g7
	fcmpd	%fcc3,	%f24,	%f16
	ldsh	[%l7 + 0x2E],	%o1
	fsrc1	%f22,	%f10
	movneg	%icc,	%i3,	%o0
	sdivx	%g2,	0x11FD,	%g5
	andn	%l6,	%o4,	%l1
	sll	%i7,	%g3,	%g4
	sdiv	%l4,	0x1D01,	%o3
	ldsh	[%l7 + 0x12],	%o6
	movge	%xcc,	%i0,	%l5
	fpsub32s	%f23,	%f28,	%f31
	nop
	set	0x68, %g4
	sth	%o7,	[%l7 + %g4]
	andncc	%l3,	%i1,	%i6
	ldd	[%l7 + 0x10],	%f6
	subc	%l2,	%i5,	%o5
	sir	0x12FE
	ldsw	[%l7 + 0x2C],	%g1
	srl	%i2,	%o2,	%l0
	array8	%g6,	%i4,	%g7
	movpos	%xcc,	%o1,	%o0
	fcmped	%fcc2,	%f10,	%f18
	fmovsvs	%icc,	%f25,	%f10
	movle	%xcc,	%g2,	%i3
	edge16	%l6,	%g5,	%l1
	srlx	%o4,	%i7,	%g3
	array8	%g4,	%l4,	%o3
	sllx	%o6,	%i0,	%o7
	fmovsg	%icc,	%f31,	%f13
	edge8n	%l3,	%i1,	%i6
	movrlz	%l5,	0x1EC,	%l2
	edge16ln	%i5,	%o5,	%i2
	fmovsg	%icc,	%f21,	%f17
	edge8	%g1,	%o2,	%l0
	srlx	%i4,	%g7,	%g6
	fmovdn	%icc,	%f6,	%f13
	fpsub16	%f4,	%f0,	%f14
	movn	%icc,	%o1,	%o0
	alignaddr	%g2,	%l6,	%g5
	edge16ln	%l1,	%i3,	%i7
	fandnot1	%f10,	%f26,	%f6
	movrgz	%g3,	0x06E,	%g4
	edge32n	%o4,	%l4,	%o3
	fmovsleu	%xcc,	%f2,	%f1
	ldsh	[%l7 + 0x4C],	%o6
	movvc	%xcc,	%o7,	%i0
	movleu	%xcc,	%i1,	%i6
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	subccc	%o5,	0x0251,	%i2
	movneg	%xcc,	%g1,	%o2
	xor	%l3,	0x05B1,	%i4
	smul	%l0,	0x150B,	%g6
	umul	%o1,	0x0987,	%o0
	movrgz	%g7,	%l6,	%g5
	srl	%l1,	0x05,	%i3
	ldub	[%l7 + 0x2F],	%i7
	movg	%xcc,	%g3,	%g4
	movgu	%icc,	%o4,	%g2
	lduw	[%l7 + 0x58],	%o3
	sll	%o6,	0x07,	%l4
	sra	%i0,	0x07,	%o7
	std	%f10,	[%l7 + 0x08]
	ldsw	[%l7 + 0x08],	%i1
	movrne	%l5,	0x14D,	%i6
	ldd	[%l7 + 0x08],	%i4
	movgu	%xcc,	%o5,	%l2
	fandnot2	%f22,	%f30,	%f22
	edge16n	%g1,	%i2,	%l3
	udivx	%o2,	0x14F1,	%l0
	fornot1s	%f27,	%f10,	%f22
	srlx	%g6,	0x17,	%i4
	std	%f18,	[%l7 + 0x78]
	ldsh	[%l7 + 0x76],	%o0
	fmovsa	%icc,	%f30,	%f8
	ldsw	[%l7 + 0x78],	%g7
	udivcc	%l6,	0x038D,	%g5
	umul	%o1,	%i3,	%l1
	fpsub16	%f30,	%f0,	%f30
	fpadd32	%f2,	%f20,	%f30
	sdivx	%i7,	0x1816,	%g4
	fmovdvs	%xcc,	%f21,	%f21
	movpos	%icc,	%o4,	%g3
	orncc	%o3,	0x1922,	%o6
	fcmpne16	%f2,	%f28,	%g2
	udivcc	%i0,	0x073F,	%l4
	fnand	%f12,	%f12,	%f8
	srl	%o7,	0x0B,	%i1
	sethi	0x0271,	%l5
	orncc	%i5,	0x025D,	%o5
	ldd	[%l7 + 0x10],	%i6
	edge32l	%g1,	%l2,	%l3
	addc	%i2,	0x0282,	%l0
	srax	%g6,	0x0F,	%i4
	smul	%o2,	0x073A,	%o0
	edge8l	%l6,	%g7,	%o1
	movle	%icc,	%g5,	%l1
	movl	%icc,	%i3,	%g4
	ldsb	[%l7 + 0x08],	%i7
	movrgez	%o4,	0x1ED,	%o3
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%o6
	srl	%g2,	%g3,	%i0
	alignaddr	%l4,	%o7,	%l5
	movrgz	%i5,	0x26C,	%i1
	fsrc2	%f22,	%f18
	st	%f27,	[%l7 + 0x28]
	edge8	%o5,	%g1,	%i6
	xnor	%l3,	%i2,	%l2
	subcc	%g6,	%i4,	%o2
	move	%xcc,	%l0,	%l6
	fpadd16	%f2,	%f18,	%f6
	fmovd	%f22,	%f26
	edge8n	%o0,	%g7,	%o1
	andncc	%l1,	%i3,	%g5
	subcc	%i7,	%g4,	%o3
	and	%o6,	%o4,	%g2
	movrne	%i0,	%l4,	%o7
	ldsw	[%l7 + 0x6C],	%g3
	addccc	%i5,	%l5,	%o5
	smul	%g1,	0x092C,	%i6
	fors	%f10,	%f24,	%f5
	mulx	%i1,	%l3,	%l2
	sdivcc	%i2,	0x178A,	%g6
	udiv	%i4,	0x1395,	%l0
	array16	%o2,	%o0,	%l6
	xor	%g7,	%l1,	%o1
	fmovspos	%xcc,	%f15,	%f9
	fnor	%f26,	%f20,	%f6
	movrgez	%g5,	%i7,	%i3
	movgu	%icc,	%o3,	%o6
	edge32	%g4,	%g2,	%o4
	sub	%i0,	%o7,	%l4
	ldd	[%l7 + 0x38],	%f0
	mova	%xcc,	%i5,	%g3
	sllx	%o5,	0x00,	%g1
	edge8	%l5,	%i6,	%l3
	orn	%l2,	%i2,	%i1
	sllx	%i4,	%g6,	%o2
	movrgez	%l0,	%l6,	%g7
	faligndata	%f14,	%f0,	%f28
	ld	[%l7 + 0x54],	%f20
	sdivx	%o0,	0x1BF6,	%o1
	movrlz	%g5,	0x333,	%i7
	movgu	%icc,	%l1,	%i3
	ldd	[%l7 + 0x20],	%f4
	sdivx	%o3,	0x1AFF,	%g4
	andncc	%g2,	%o4,	%i0
	edge32ln	%o6,	%l4,	%i5
	smulcc	%o7,	0x18D4,	%g3
	fcmpes	%fcc3,	%f5,	%f2
	addc	%o5,	0x1041,	%l5
	udivx	%i6,	0x07D9,	%l3
	movre	%g1,	%l2,	%i2
	movleu	%xcc,	%i1,	%i4
	alignaddr	%o2,	%l0,	%l6
	ldd	[%l7 + 0x40],	%f16
	orn	%g7,	%g6,	%o1
	stw	%g5,	[%l7 + 0x38]
	addcc	%o0,	%i7,	%i3
	stx	%l1,	[%l7 + 0x20]
	srax	%o3,	0x0C,	%g4
	movrne	%g2,	%o4,	%i0
	edge32n	%o6,	%i5,	%o7
	andn	%g3,	%o5,	%l5
	fmovrsne	%i6,	%f28,	%f8
	fornot2	%f26,	%f14,	%f18
	fnegd	%f2,	%f20
	fnor	%f16,	%f12,	%f0
	orcc	%l4,	%g1,	%l2
	and	%l3,	0x1DDB,	%i2
	fands	%f3,	%f22,	%f30
	array16	%i4,	%o2,	%i1
	andcc	%l6,	%g7,	%l0
	alignaddrl	%o1,	%g5,	%o0
	fpsub32s	%f20,	%f29,	%f31
	movle	%icc,	%i7,	%i3
	srlx	%l1,	0x12,	%g6
	fcmpd	%fcc0,	%f26,	%f26
	movre	%g4,	%g2,	%o4
	fpsub32s	%f21,	%f7,	%f31
	sth	%i0,	[%l7 + 0x46]
	mulscc	%o3,	0x0E83,	%i5
	xorcc	%o7,	0x0D39,	%g3
	fmovs	%f3,	%f23
	movle	%xcc,	%o5,	%o6
	movg	%xcc,	%i6,	%l5
	lduh	[%l7 + 0x1C],	%g1
	or	%l2,	0x0FED,	%l3
	subccc	%i2,	%i4,	%l4
	array32	%o2,	%l6,	%g7
	movrgz	%i1,	0x04F,	%o1
	st	%f25,	[%l7 + 0x14]
	fcmpd	%fcc0,	%f18,	%f16
	movrne	%g5,	0x060,	%o0
	xnor	%i7,	%i3,	%l0
	popc	0x0885,	%l1
	movrlz	%g6,	0x026,	%g4
	fpsub16	%f14,	%f22,	%f30
	fnand	%f24,	%f30,	%f12
	fpackfix	%f30,	%f2
	mova	%icc,	%g2,	%o4
	edge32	%o3,	%i5,	%o7
	edge32n	%i0,	%o5,	%g3
	umulcc	%i6,	%o6,	%l5
	edge16n	%g1,	%l2,	%l3
	faligndata	%f22,	%f28,	%f30
	xnorcc	%i2,	%l4,	%o2
	orn	%i4,	%g7,	%l6
	movn	%icc,	%i1,	%o1
	mulscc	%g5,	%i7,	%i3
	xnor	%l0,	%l1,	%o0
	sdivcc	%g4,	0x147F,	%g6
	movrlez	%o4,	0x14E,	%g2
	movrlz	%o3,	0x327,	%o7
	movrlez	%i0,	%o5,	%g3
	edge16	%i6,	%o6,	%i5
	sir	0x0771
	fxnor	%f10,	%f26,	%f2
	ldsw	[%l7 + 0x44],	%l5
	edge16n	%g1,	%l3,	%l2
	sub	%l4,	%o2,	%i2
	fmovspos	%icc,	%f11,	%f6
	sll	%g7,	0x1C,	%l6
	movneg	%xcc,	%i1,	%o1
	movleu	%icc,	%i4,	%g5
	ldsh	[%l7 + 0x0E],	%i7
	movre	%l0,	0x1DA,	%i3
	array8	%o0,	%l1,	%g6
	movrlz	%g4,	%o4,	%g2
	ldsb	[%l7 + 0x3F],	%o3
	fmovda	%xcc,	%f31,	%f17
	sdivcc	%i0,	0x16F7,	%o5
	movrlz	%o7,	%g3,	%i6
	popc	%o6,	%i5
	fmul8x16au	%f29,	%f12,	%f16
	smul	%l5,	%l3,	%l2
	ldx	[%l7 + 0x30],	%g1
	lduw	[%l7 + 0x6C],	%o2
	movgu	%icc,	%l4,	%i2
	sth	%l6,	[%l7 + 0x1C]
	movre	%g7,	%i1,	%i4
	fcmpgt32	%f28,	%f26,	%o1
	fmovrsne	%i7,	%f28,	%f11
	nop
	set	0x20, %o3
	std	%f24,	[%l7 + %o3]
	srax	%l0,	0x1C,	%g5
	restore %o0, %l1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f26,	%f7,	%f6
	subcc	%g6,	%g4,	%o4
	array32	%g2,	%o3,	%i0
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	restore %o6, 0x0FEC, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%o7,	%f29,	%f6
	move	%icc,	%l3,	%l5
	mulscc	%l2,	%o2,	%g1
	andcc	%l4,	0x05D5,	%l6
	movre	%i2,	%g7,	%i1
	movpos	%icc,	%o1,	%i4
	orcc	%l0,	%i7,	%o0
	smulcc	%l1,	0x0C2B,	%g5
	array32	%i3,	%g6,	%g4
	edge32ln	%g2,	%o3,	%i0
	ldd	[%l7 + 0x30],	%o4
	fnegd	%f30,	%f16
	alignaddrl	%o4,	%g3,	%i6
	movrgez	%i5,	%o7,	%o6
	sth	%l3,	[%l7 + 0x12]
	fpsub16	%f6,	%f12,	%f8
	subc	%l2,	0x140B,	%o2
	add	%g1,	%l4,	%l5
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%i2
	ldd	[%l7 + 0x58],	%i6
	fmovsa	%xcc,	%f24,	%f11
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%i1
	ldsw	[%l7 + 0x64],	%o1
	movrgz	%i4,	%l0,	%i7
	fone	%f2
	or	%g7,	%o0,	%l1
	stx	%g5,	[%l7 + 0x20]
	ldx	[%l7 + 0x10],	%i3
	popc	%g4,	%g2
	edge8	%g6,	%o3,	%i0
	save %o4, %g3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f16,	[%l7 + 0x50]
	fmovsle	%icc,	%f17,	%f16
	edge32n	%i6,	%o7,	%o6
	fmovsneg	%icc,	%f18,	%f19
	fcmple32	%f12,	%f30,	%l3
	edge8n	%l2,	%i5,	%g1
	and	%l4,	0x159D,	%o2
	movle	%xcc,	%l5,	%l6
	edge16	%i2,	%i1,	%o1
	sllx	%l0,	%i4,	%g7
	fmovsa	%icc,	%f25,	%f27
	fmovrdlz	%i7,	%f0,	%f2
	andcc	%o0,	0x0951,	%g5
	fzero	%f2
	orn	%i3,	%l1,	%g4
	srlx	%g2,	%g6,	%o3
	edge8l	%o4,	%g3,	%i0
	srax	%o5,	%i6,	%o6
	sethi	0x080C,	%l3
	st	%f26,	[%l7 + 0x48]
	fornot1	%f10,	%f14,	%f28
	movrne	%l2,	0x3D7,	%i5
	orcc	%o7,	0x0EFA,	%g1
	movrgez	%o2,	0x1C5,	%l5
	array16	%l4,	%i2,	%l6
	fmovda	%xcc,	%f27,	%f25
	movpos	%xcc,	%i1,	%l0
	sth	%o1,	[%l7 + 0x40]
	sth	%g7,	[%l7 + 0x7E]
	fmovdneg	%xcc,	%f9,	%f21
	movne	%xcc,	%i4,	%o0
	popc	%i7,	%g5
	fmovrsgez	%l1,	%f25,	%f3
	orcc	%i3,	0x04DC,	%g4
	andn	%g6,	%o3,	%g2
	xnorcc	%o4,	0x0872,	%g3
	array16	%o5,	%i0,	%i6
	sth	%o6,	[%l7 + 0x56]
	fmovde	%icc,	%f23,	%f3
	edge16ln	%l3,	%i5,	%o7
	stb	%g1,	[%l7 + 0x75]
	alignaddrl	%l2,	%l5,	%o2
	movleu	%xcc,	%i2,	%l6
	fmovsvs	%xcc,	%f22,	%f29
	sra	%i1,	0x01,	%l4
	array32	%l0,	%g7,	%i4
	edge16	%o0,	%i7,	%g5
	ldsw	[%l7 + 0x24],	%o1
	movrgez	%l1,	%g4,	%g6
	lduw	[%l7 + 0x3C],	%i3
	fpsub16s	%f22,	%f29,	%f19
	fmovsneg	%icc,	%f19,	%f10
	st	%f11,	[%l7 + 0x44]
	sir	0x11B6
	andcc	%g2,	%o3,	%g3
	fpadd32s	%f25,	%f29,	%f14
	xorcc	%o4,	0x0537,	%i0
	ldsb	[%l7 + 0x7C],	%o5
	fzero	%f16
	edge16	%i6,	%o6,	%l3
	smulcc	%o7,	0x0A98,	%i5
	edge16ln	%l2,	%g1,	%o2
	fmovsn	%icc,	%f31,	%f25
	orncc	%i2,	0x07B9,	%l6
	xnor	%i1,	0x0296,	%l4
	movne	%icc,	%l5,	%l0
	edge16n	%i4,	%g7,	%i7
	array32	%g5,	%o1,	%o0
	movl	%xcc,	%g4,	%l1
	popc	%i3,	%g2
	edge32l	%o3,	%g6,	%g3
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%i0
	sdiv	%o5,	0x0F7C,	%i6
	udiv	%o4,	0x10B8,	%l3
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	edge16n	%g1,	%o7,	%o2
	umulcc	%l6,	%i1,	%i2
	fnor	%f6,	%f4,	%f14
	edge8ln	%l5,	%l4,	%l0
	ldsh	[%l7 + 0x7A],	%g7
	movcs	%xcc,	%i4,	%g5
	fmul8x16	%f23,	%f8,	%f12
	xnor	%i7,	%o1,	%g4
	edge16l	%o0,	%l1,	%g2
	edge16ln	%o3,	%i3,	%g6
	array8	%g3,	%o5,	%i6
	fmovsleu	%xcc,	%f21,	%f9
	sll	%i0,	%l3,	%o4
	fcmple32	%f0,	%f14,	%o6
	movg	%icc,	%i5,	%l2
	array32	%o7,	%o2,	%g1
	fnegd	%f12,	%f26
	mova	%icc,	%i1,	%i2
	movre	%l5,	0x38C,	%l4
	bshuffle	%f28,	%f14,	%f28
	smul	%l6,	0x0575,	%l0
	std	%f10,	[%l7 + 0x48]
	subcc	%i4,	0x0C7D,	%g7
	mulscc	%i7,	%o1,	%g4
	subcc	%o0,	%g5,	%l1
	sethi	0x1EC7,	%g2
	stw	%i3,	[%l7 + 0x40]
	addc	%g6,	%o3,	%o5
	xnor	%g3,	0x1DE6,	%i0
	alignaddrl	%i6,	%l3,	%o4
	mova	%icc,	%i5,	%o6
	srlx	%l2,	%o7,	%o2
	edge32l	%g1,	%i1,	%l5
	fmovdl	%xcc,	%f15,	%f11
	subccc	%l4,	%i2,	%l6
	movcs	%xcc,	%i4,	%g7
	edge32ln	%i7,	%l0,	%o1
	xnorcc	%o0,	0x0719,	%g4
	mulscc	%g5,	0x196F,	%l1
	fpmerge	%f17,	%f12,	%f8
	sir	0x1620
	ld	[%l7 + 0x78],	%f0
	ldsh	[%l7 + 0x0C],	%i3
	movpos	%icc,	%g6,	%o3
	xnorcc	%g2,	%o5,	%g3
	fmovs	%f7,	%f22
	ldx	[%l7 + 0x68],	%i0
	movre	%i6,	%l3,	%i5
	fmul8sux16	%f26,	%f16,	%f26
	movle	%icc,	%o4,	%l2
	srl	%o6,	0x1C,	%o2
	ldsw	[%l7 + 0x20],	%g1
	fcmpeq32	%f0,	%f24,	%i1
	movvs	%icc,	%l5,	%o7
	sth	%l4,	[%l7 + 0x44]
	movn	%icc,	%l6,	%i2
	save %i4, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l0,	[%l7 + 0x48]
	edge8n	%o0,	%o1,	%g5
	fands	%f27,	%f25,	%f31
	udivcc	%g4,	0x01C5,	%i3
	movg	%icc,	%l1,	%g6
	mulx	%o3,	0x0396,	%o5
	array8	%g3,	%i0,	%g2
	fcmple32	%f28,	%f22,	%l3
	fsrc2	%f26,	%f18
	edge32	%i6,	%i5,	%l2
	stb	%o4,	[%l7 + 0x55]
	sdiv	%o2,	0x0CA2,	%o6
	sdiv	%i1,	0x0669,	%l5
	fmovrdgz	%g1,	%f8,	%f20
	fmovsa	%icc,	%f11,	%f10
	orncc	%o7,	0x1C6E,	%l4
	fcmpeq16	%f16,	%f16,	%l6
	fmovsge	%xcc,	%f6,	%f24
	fsrc2s	%f14,	%f7
	edge8l	%i2,	%i7,	%g7
	edge32l	%l0,	%i4,	%o0
	xnorcc	%g5,	0x1664,	%o1
	ldsb	[%l7 + 0x0E],	%i3
	fmovdneg	%icc,	%f26,	%f28
	sra	%l1,	0x17,	%g4
	fmul8x16au	%f20,	%f16,	%f0
	fcmple16	%f6,	%f4,	%g6
	umul	%o5,	0x136C,	%o3
	stx	%i0,	[%l7 + 0x20]
	edge8	%g3,	%l3,	%i6
	mova	%icc,	%i5,	%g2
	mova	%icc,	%o4,	%l2
	fmovrde	%o6,	%f30,	%f24
	edge32l	%o2,	%i1,	%l5
	addccc	%g1,	%l4,	%l6
	smul	%o7,	0x136B,	%i7
	alignaddr	%g7,	%l0,	%i4
	movle	%xcc,	%o0,	%i2
	edge32	%o1,	%g5,	%i3
	xorcc	%g4,	0x09AC,	%l1
	movvs	%icc,	%o5,	%g6
	orn	%o3,	0x19B7,	%i0
	andn	%g3,	0x0700,	%i6
	udiv	%i5,	0x171F,	%g2
	fnot2	%f8,	%f4
	movcs	%icc,	%l3,	%o4
	sdiv	%l2,	0x143D,	%o6
	umul	%i1,	0x0387,	%l5
	sdiv	%o2,	0x178B,	%g1
	sra	%l4,	%o7,	%i7
	movl	%icc,	%g7,	%l0
	addcc	%i4,	%l6,	%o0
	movcc	%icc,	%i2,	%g5
	sll	%o1,	%i3,	%g4
	fmovsl	%xcc,	%f30,	%f12
	edge16	%l1,	%g6,	%o3
	movneg	%icc,	%i0,	%o5
	alignaddrl	%g3,	%i6,	%i5
	srax	%g2,	0x1A,	%l3
	edge16l	%o4,	%l2,	%o6
	andncc	%i1,	%o2,	%g1
	movleu	%icc,	%l4,	%o7
	edge8n	%l5,	%g7,	%l0
	movvs	%xcc,	%i4,	%l6
	restore %i7, 0x062B, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f1,	%f13
	udivx	%g5,	0x0D33,	%o1
	or	%i3,	%i2,	%g4
	fornot1s	%f8,	%f11,	%f5
	edge32ln	%l1,	%g6,	%o3
	std	%f0,	[%l7 + 0x28]
	edge16ln	%i0,	%g3,	%i6
	fmovsge	%xcc,	%f8,	%f30
	smulcc	%i5,	0x1F23,	%g2
	movl	%icc,	%o5,	%o4
	movre	%l2,	%l3,	%i1
	ld	[%l7 + 0x2C],	%f31
	move	%icc,	%o6,	%o2
	udivcc	%g1,	0x0B29,	%l4
	fmovsn	%xcc,	%f15,	%f5
	sethi	0x14BA,	%o7
	stw	%g7,	[%l7 + 0x34]
	edge8l	%l0,	%i4,	%l6
	fmovsn	%xcc,	%f13,	%f29
	fmovdvc	%xcc,	%f14,	%f3
	movvc	%icc,	%l5,	%i7
	fmovdneg	%icc,	%f20,	%f14
	movl	%icc,	%o0,	%g5
	fmovscc	%xcc,	%f3,	%f28
	andncc	%o1,	%i2,	%g4
	pdist	%f2,	%f30,	%f10
	movvs	%xcc,	%l1,	%g6
	addcc	%o3,	%i0,	%i3
	ldsh	[%l7 + 0x72],	%g3
	movcs	%icc,	%i5,	%i6
	addcc	%o5,	%o4,	%l2
	lduw	[%l7 + 0x18],	%g2
	fmovrslez	%i1,	%f16,	%f14
	add	%l3,	0x1EA9,	%o2
	movrgz	%g1,	%o6,	%l4
	fmuld8sux16	%f25,	%f9,	%f30
	mulx	%g7,	0x0B1C,	%l0
	fsrc1	%f20,	%f18
	lduw	[%l7 + 0x2C],	%o7
	sethi	0x100B,	%l6
	addc	%i4,	%l5,	%o0
	movg	%xcc,	%g5,	%i7
	udiv	%i2,	0x15D7,	%g4
	xnorcc	%o1,	%l1,	%g6
	ldd	[%l7 + 0x08],	%f22
	subcc	%o3,	0x1347,	%i3
	add	%i0,	%i5,	%g3
	srax	%o5,	0x0C,	%o4
	udiv	%l2,	0x029E,	%g2
	edge32l	%i1,	%l3,	%i6
	sra	%g1,	0x1B,	%o2
	fmovsgu	%xcc,	%f10,	%f2
	fpsub16	%f12,	%f26,	%f26
	alignaddrl	%o6,	%l4,	%g7
	movvs	%xcc,	%l0,	%l6
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	movcs	%icc,	%o0,	%g5
	edge8n	%i7,	%i2,	%o1
	movcc	%icc,	%l1,	%g6
	ldsb	[%l7 + 0x42],	%o3
	udivcc	%g4,	0x02C0,	%i0
	sra	%i3,	0x0B,	%g3
	fnor	%f12,	%f20,	%f26
	fone	%f0
	fxnor	%f24,	%f22,	%f10
	movneg	%xcc,	%o5,	%i5
	movle	%icc,	%o4,	%l2
	and	%g2,	0x1F1C,	%i1
	movle	%icc,	%l3,	%i6
	umul	%o2,	%o6,	%l4
	edge16l	%g7,	%l0,	%g1
	edge16n	%l6,	%i4,	%o7
	andncc	%o0,	%l5,	%g5
	sub	%i2,	0x1A1F,	%o1
	and	%i7,	0x045A,	%g6
	mova	%xcc,	%l1,	%g4
	array8	%i0,	%o3,	%g3
	umul	%o5,	%i3,	%o4
	andn	%i5,	%g2,	%i1
	lduw	[%l7 + 0x64],	%l3
	ldub	[%l7 + 0x67],	%l2
	edge16l	%i6,	%o2,	%l4
	sll	%o6,	0x0F,	%g7
	xnorcc	%g1,	0x1343,	%l0
	array16	%i4,	%l6,	%o0
	orcc	%l5,	%g5,	%o7
	movn	%icc,	%i2,	%i7
	ldd	[%l7 + 0x70],	%f10
	move	%icc,	%g6,	%l1
	edge8l	%g4,	%i0,	%o3
	stx	%g3,	[%l7 + 0x18]
	ldx	[%l7 + 0x38],	%o5
	ldub	[%l7 + 0x6E],	%o1
	andcc	%i3,	%o4,	%i5
	edge8	%i1,	%g2,	%l3
	movpos	%xcc,	%i6,	%o2
	edge32l	%l2,	%o6,	%g7
	edge16n	%l4,	%g1,	%l0
	fmovrse	%i4,	%f28,	%f30
	srl	%l6,	0x1C,	%l5
	movre	%o0,	0x170,	%o7
	andncc	%g5,	%i7,	%g6
	movcc	%icc,	%l1,	%g4
	addc	%i0,	0x0079,	%o3
	movleu	%icc,	%i2,	%o5
	stw	%g3,	[%l7 + 0x08]
	stw	%o1,	[%l7 + 0x40]
	sra	%o4,	%i3,	%i5
	edge32	%g2,	%l3,	%i1
	fcmped	%fcc0,	%f28,	%f28
	sra	%o2,	0x14,	%l2
	fpadd32	%f4,	%f14,	%f28
	edge32	%o6,	%i6,	%l4
	sir	0x0DDA
	movg	%icc,	%g7,	%g1
	addc	%l0,	0x1B12,	%i4
	sdivx	%l5,	0x0B4C,	%l6
	sub	%o0,	%o7,	%i7
	popc	%g6,	%g5
	addc	%g4,	%i0,	%o3
	fmovdvc	%xcc,	%f22,	%f11
	fmovrsne	%l1,	%f16,	%f7
	fandnot1s	%f4,	%f31,	%f10
	fors	%f29,	%f18,	%f7
	movcs	%icc,	%i2,	%g3
	movcc	%icc,	%o5,	%o1
	fmovsg	%icc,	%f10,	%f22
	and	%i3,	%o4,	%g2
	ldub	[%l7 + 0x3F],	%i5
	fmovspos	%xcc,	%f31,	%f13
	fsrc1s	%f7,	%f5
	sir	0x1146
	fornot1s	%f16,	%f22,	%f29
	mulscc	%l3,	%i1,	%o2
	lduh	[%l7 + 0x40],	%l2
	ldx	[%l7 + 0x58],	%o6
	orncc	%i6,	%g7,	%g1
	or	%l4,	%i4,	%l0
	sdiv	%l5,	0x1F95,	%o0
	movg	%xcc,	%o7,	%i7
	ldx	[%l7 + 0x18],	%g6
	fnot2	%f8,	%f18
	fornot1	%f2,	%f22,	%f10
	fmovdne	%xcc,	%f1,	%f20
	umul	%l6,	0x0815,	%g5
	edge16ln	%i0,	%g4,	%o3
	edge16n	%i2,	%g3,	%o5
	mulx	%o1,	0x0806,	%i3
	movle	%xcc,	%o4,	%g2
	fmul8x16	%f26,	%f24,	%f16
	sra	%i5,	%l3,	%l1
	xorcc	%i1,	0x0265,	%o2
	mova	%icc,	%l2,	%i6
	edge8l	%g7,	%o6,	%l4
	umulcc	%g1,	0x1471,	%i4
	movneg	%xcc,	%l0,	%l5
	fmovrdgz	%o0,	%f0,	%f0
	fnegs	%f3,	%f25
	movgu	%icc,	%i7,	%o7
	orn	%l6,	%g5,	%g6
	fandnot1	%f2,	%f4,	%f2
	xnorcc	%g4,	%i0,	%i2
	srl	%g3,	%o5,	%o1
	xor	%i3,	%o3,	%g2
	edge16l	%o4,	%i5,	%l1
	ldd	[%l7 + 0x10],	%l2
	fmovsn	%icc,	%f11,	%f31
	movl	%icc,	%i1,	%o2
	movrlez	%l2,	%g7,	%o6
	movvs	%icc,	%i6,	%g1
	edge8	%i4,	%l4,	%l5
	movgu	%xcc,	%l0,	%i7
	ldx	[%l7 + 0x48],	%o7
	lduh	[%l7 + 0x16],	%l6
	fcmpes	%fcc3,	%f22,	%f26
	lduh	[%l7 + 0x68],	%o0
	orn	%g6,	%g5,	%g4
	fpsub16s	%f21,	%f20,	%f3
	xorcc	%i0,	%g3,	%i2
	save %o1, 0x1710, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i3,	%o3,	%g2
	addccc	%i5,	0x11D7,	%o4
	movrlez	%l1,	0x374,	%l3
	fsrc1	%f6,	%f2
	udiv	%o2,	0x0E4D,	%l2
	st	%f2,	[%l7 + 0x1C]
	fmovse	%icc,	%f2,	%f24
	fmovscc	%xcc,	%f11,	%f5
	edge8	%g7,	%o6,	%i1
	fmovrslz	%i6,	%f8,	%f26
	smul	%i4,	0x0941,	%g1
	fpadd16s	%f16,	%f9,	%f25
	fmuld8ulx16	%f18,	%f20,	%f10
	fnor	%f16,	%f30,	%f16
	fandnot2s	%f14,	%f24,	%f27
	orn	%l5,	0x1BC7,	%l4
	movrgez	%l0,	0x043,	%o7
	xnorcc	%l6,	%i7,	%o0
	fmovdcs	%icc,	%f5,	%f27
	orcc	%g5,	0x183F,	%g4
	subcc	%g6,	%i0,	%i2
	fmovrsgez	%g3,	%f24,	%f11
	fzero	%f0
	movrgez	%o1,	0x063,	%i3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3487
!	Type f   	: 5235
!	Type i   	: 16278
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xFC1C358E
.word 0x74C6E499
.word 0xBC50A3C3
.word 0x9FAB77B0
.word 0x4BD51269
.word 0x33338866
.word 0x8A2F32A4
.word 0x433644AA
.word 0xF3B51AF7
.word 0x69EAC14A
.word 0x5219D60C
.word 0xB0889542
.word 0xFEB5B98C
.word 0xE3AD4BD2
.word 0xCB54418D
.word 0x6EE8ED04
.word 0x09775259
.word 0xE68997EE
.word 0x3A991A7E
.word 0x635B2723
.word 0x4618221D
.word 0x665FBCBD
.word 0xD4F5AAC6
.word 0xA394AF8B
.word 0x61CE9A18
.word 0x6B74B255
.word 0xD5A436B1
.word 0x3E226F1C
.word 0x44030126
.word 0x2AD2F1A1
.word 0xC81D7759
.word 0xE7AA8B61
.word 0x19E5EBC8
.word 0x9B429D23
.word 0xEE126FCC
.word 0x8D55C8AA
.word 0x0A05C2C1
.word 0xBAFB3790
.word 0x6DD439CA
.word 0xF479B0D3
.word 0x9B401467
.word 0x5A2E09FF
.word 0xA8807C7C
.word 0x1882204B
.word 0x66D4E799
.word 0x1C2302C9
.word 0x244B59E1
.word 0xB56244C2
.word 0x26AC6896
.word 0xACBDD648
.word 0x6422E819
.word 0xFEEFE3B5
.word 0xE662D88B
.word 0x82B841E8
.word 0xB7C54B41
.word 0x995B9993
.word 0xD57C0A24
.word 0x3884BE8C
.word 0x03429280
.word 0x73741216
.word 0x7C135D7E
.word 0xC5A9E177
.word 0x10A750F3
.word 0xAE2E9F94
.end
