/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f14.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f14.s,v 1.1 2007/05/11 17:22:37 drp Exp $"
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
	setx	0x7610C7356068C24B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x7,	%g2
	set	0x9,	%g3
	set	0x9,	%g4
	set	0x7,	%g5
	set	0xE,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xD,	%i1
	set	-0x6,	%i2
	set	-0x1,	%i3
	set	-0x9,	%i4
	set	-0x3,	%i5
	set	-0xC,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x3A861BD1,	%l0
	set	0x6889280A,	%l1
	set	0x7A72117B,	%l2
	set	0x757B4472,	%l3
	set	0x576384EF,	%l4
	set	0x268804B8,	%l5
	set	0x740735EC,	%l6
	!# Output registers
	set	-0x0780,	%o0
	set	-0x1D21,	%o1
	set	-0x1543,	%o2
	set	-0x175B,	%o3
	set	0x1FB2,	%o4
	set	-0x08A3,	%o5
	set	0x066F,	%o6
	set	0x1811,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x138D299A896AEE76)
	INIT_TH_FP_REG(%l7,%f2,0xC11663D6AE09447C)
	INIT_TH_FP_REG(%l7,%f4,0x178C21370205FF2C)
	INIT_TH_FP_REG(%l7,%f6,0xCC7E9201BECE55D6)
	INIT_TH_FP_REG(%l7,%f8,0x1F2BEC78EE1CD3EA)
	INIT_TH_FP_REG(%l7,%f10,0x8F4C23DADDE4A255)
	INIT_TH_FP_REG(%l7,%f12,0x56F3E579D74DBDBB)
	INIT_TH_FP_REG(%l7,%f14,0x349C98DAD5B12163)
	INIT_TH_FP_REG(%l7,%f16,0x290AA5104E522C85)
	INIT_TH_FP_REG(%l7,%f18,0x6899B000841BDF1D)
	INIT_TH_FP_REG(%l7,%f20,0xDB905F7A08D87B29)
	INIT_TH_FP_REG(%l7,%f22,0x6A12EC9B1C46C937)
	INIT_TH_FP_REG(%l7,%f24,0xE0465461EDEC1C67)
	INIT_TH_FP_REG(%l7,%f26,0x47FB1B9AE0535422)
	INIT_TH_FP_REG(%l7,%f28,0x70962B7F5F96E942)
	INIT_TH_FP_REG(%l7,%f30,0x18CFF1868A4E3189)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA01, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	save %l6, 0x0C9B, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g6,	0x0E,	%o1
	move	%xcc,	%i0,	%l2
	xnorcc	%o7,	%i6,	%o4
	fmovse	%xcc,	%f16,	%f9
	movvc	%xcc,	%g3,	%i4
	stw	%o3,	[%l7 + 0x50]
	fpack32	%f28,	%f12,	%f24
	sub	%l4,	0x0268,	%i7
	movn	%icc,	%l0,	%l1
	sdiv	%o6,	0x1F27,	%g4
	fcmps	%fcc0,	%f22,	%f29
	fcmpne32	%f8,	%f28,	%i3
	udivx	%o2,	0x0521,	%l5
	std	%f0,	[%l7 + 0x18]
	movrlez	%o5,	0x30D,	%l3
	andn	%g7,	%g1,	%g5
	mulx	%i5,	0x03B8,	%i2
	umul	%i1,	0x008E,	%l6
	array8	%g2,	%o0,	%o1
	edge16l	%g6,	%i0,	%o7
	fnot1s	%f27,	%f10
	fpsub16	%f2,	%f18,	%f2
	movrlez	%i6,	0x32E,	%l2
	fone	%f26
	edge16l	%o4,	%i4,	%o3
	stw	%l4,	[%l7 + 0x18]
	srlx	%g3,	0x02,	%l0
	ldsw	[%l7 + 0x6C],	%l1
	movrlz	%i7,	%o6,	%i3
	smul	%g4,	%l5,	%o5
	ld	[%l7 + 0x14],	%f26
	edge16n	%o2,	%l3,	%g7
	subcc	%g1,	0x081D,	%g5
	umulcc	%i5,	%i1,	%i2
	smulcc	%g2,	%o0,	%o1
	fmovdne	%xcc,	%f31,	%f23
	fmovsl	%icc,	%f16,	%f16
	movge	%xcc,	%g6,	%i0
	fcmped	%fcc1,	%f4,	%f18
	or	%o7,	0x0524,	%l6
	srlx	%i6,	%l2,	%o4
	ldsb	[%l7 + 0x2A],	%o3
	and	%i4,	0x13AD,	%g3
	xor	%l0,	0x125C,	%l1
	orcc	%l4,	0x167A,	%i7
	fnot1	%f16,	%f8
	movgu	%icc,	%i3,	%g4
	udivx	%o6,	0x15B5,	%o5
	nop
	set	0x46, %l2
	sth	%o2,	[%l7 + %l2]
	fmovsleu	%xcc,	%f6,	%f23
	fcmpes	%fcc3,	%f26,	%f26
	edge16	%l5,	%l3,	%g7
	addcc	%g1,	0x072D,	%i5
	alignaddr	%g5,	%i2,	%g2
	sir	0x1459
	fpsub32	%f10,	%f14,	%f2
	sdivx	%i1,	0x0A72,	%o0
	fmovrse	%g6,	%f5,	%f0
	movrgz	%o1,	0x327,	%o7
	movcs	%icc,	%l6,	%i6
	movrgez	%l2,	0x3AB,	%o4
	faligndata	%f20,	%f6,	%f30
	addcc	%o3,	%i0,	%i4
	movrlez	%l0,	%g3,	%l4
	fpack16	%f14,	%f31
	edge32ln	%i7,	%i3,	%g4
	fone	%f6
	mulscc	%o6,	0x189D,	%o5
	fcmped	%fcc2,	%f20,	%f14
	st	%f8,	[%l7 + 0x78]
	subc	%l1,	0x1FBB,	%l5
	array8	%o2,	%l3,	%g1
	fmovdgu	%xcc,	%f31,	%f27
	fnors	%f23,	%f8,	%f14
	st	%f13,	[%l7 + 0x50]
	fsrc1	%f14,	%f22
	andncc	%i5,	%g7,	%g5
	sdivcc	%g2,	0x1214,	%i1
	sir	0x0C58
	movge	%xcc,	%i2,	%g6
	movne	%xcc,	%o0,	%o7
	stb	%l6,	[%l7 + 0x20]
	ldsb	[%l7 + 0x54],	%o1
	orcc	%l2,	0x0823,	%o4
	mulx	%i6,	0x0886,	%o3
	and	%i4,	0x1895,	%i0
	movpos	%xcc,	%l0,	%l4
	restore %i7, %g3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%o6
	udivx	%i3,	0x05AA,	%o5
	move	%xcc,	%l1,	%l5
	ldx	[%l7 + 0x70],	%o2
	std	%f26,	[%l7 + 0x38]
	edge16l	%g1,	%l3,	%g7
	fors	%f28,	%f2,	%f21
	fand	%f24,	%f2,	%f0
	xor	%i5,	0x159E,	%g2
	fmovrdlz	%g5,	%f8,	%f0
	fxnor	%f26,	%f20,	%f14
	movrlz	%i2,	0x0A1,	%g6
	ldub	[%l7 + 0x2E],	%i1
	alignaddrl	%o0,	%l6,	%o7
	fcmpgt16	%f10,	%f6,	%o1
	save %l2, %o4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o3,	%i4,	%i0
	fmovrdgz	%l4,	%f8,	%f24
	edge8ln	%i7,	%g3,	%g4
	stb	%o6,	[%l7 + 0x2F]
	and	%l0,	%i3,	%o5
	edge8n	%l5,	%l1,	%g1
	ldsh	[%l7 + 0x2A],	%l3
	ldub	[%l7 + 0x0C],	%o2
	move	%icc,	%i5,	%g7
	sth	%g5,	[%l7 + 0x18]
	or	%i2,	%g6,	%i1
	ldsh	[%l7 + 0x74],	%g2
	fmovsn	%xcc,	%f2,	%f31
	movneg	%icc,	%l6,	%o7
	movleu	%icc,	%o0,	%l2
	faligndata	%f18,	%f6,	%f20
	umulcc	%o1,	0x03D1,	%i6
	fcmpeq32	%f24,	%f0,	%o4
	sllx	%o3,	%i4,	%l4
	edge8ln	%i0,	%i7,	%g4
	movge	%icc,	%o6,	%g3
	movrne	%l0,	0x040,	%i3
	bshuffle	%f12,	%f4,	%f28
	fcmpeq16	%f26,	%f4,	%l5
	lduh	[%l7 + 0x74],	%o5
	movge	%xcc,	%g1,	%l3
	edge8n	%o2,	%i5,	%l1
	lduh	[%l7 + 0x6E],	%g5
	edge16n	%i2,	%g7,	%g6
	fmovscc	%icc,	%f1,	%f14
	addcc	%i1,	0x10C0,	%l6
	lduw	[%l7 + 0x10],	%o7
	sdiv	%o0,	0x08A5,	%l2
	srl	%g2,	0x1A,	%o1
	and	%o4,	%o3,	%i4
	addccc	%i6,	0x0A6E,	%i0
	fmovdle	%icc,	%f3,	%f20
	srax	%l4,	0x00,	%i7
	orn	%o6,	%g4,	%g3
	xnorcc	%i3,	%l5,	%l0
	stb	%g1,	[%l7 + 0x74]
	stw	%l3,	[%l7 + 0x74]
	sdiv	%o2,	0x154B,	%i5
	edge16	%o5,	%l1,	%i2
	stw	%g5,	[%l7 + 0x10]
	fcmple32	%f30,	%f26,	%g7
	sth	%i1,	[%l7 + 0x5E]
	edge32	%g6,	%o7,	%l6
	nop
	set	0x48, %i0
	std	%f6,	[%l7 + %i0]
	srlx	%o0,	0x19,	%g2
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%l2
	fnot2	%f12,	%f14
	movrgez	%o4,	0x018,	%o1
	sth	%o3,	[%l7 + 0x42]
	stb	%i6,	[%l7 + 0x50]
	mulx	%i0,	%i4,	%l4
	and	%o6,	0x0C3C,	%i7
	fcmpd	%fcc1,	%f16,	%f24
	fsrc2	%f26,	%f12
	srl	%g3,	%i3,	%l5
	movcc	%icc,	%l0,	%g4
	ldsw	[%l7 + 0x7C],	%g1
	movpos	%icc,	%o2,	%i5
	ldx	[%l7 + 0x48],	%l3
	sir	0x076C
	fornot1s	%f15,	%f8,	%f8
	array16	%o5,	%i2,	%l1
	sdivx	%g5,	0x067A,	%i1
	udivx	%g6,	0x0117,	%o7
	lduh	[%l7 + 0x30],	%l6
	fabsd	%f12,	%f2
	movrgez	%o0,	%g7,	%g2
	movgu	%xcc,	%l2,	%o4
	sub	%o1,	%o3,	%i0
	ldsb	[%l7 + 0x66],	%i6
	alignaddr	%l4,	%o6,	%i7
	andncc	%g3,	%i3,	%l5
	andncc	%i4,	%l0,	%g1
	movl	%xcc,	%g4,	%o2
	movcs	%icc,	%l3,	%i5
	add	%i2,	%l1,	%g5
	sra	%i1,	%o5,	%g6
	fmovrdne	%o7,	%f28,	%f16
	alignaddrl	%l6,	%g7,	%o0
	fmovsne	%xcc,	%f10,	%f27
	movcs	%icc,	%g2,	%o4
	udivcc	%o1,	0x0B4B,	%o3
	mova	%icc,	%l2,	%i6
	sth	%i0,	[%l7 + 0x2A]
	addcc	%o6,	%i7,	%l4
	edge16ln	%g3,	%l5,	%i3
	lduw	[%l7 + 0x70],	%l0
	popc	0x18C3,	%g1
	pdist	%f2,	%f6,	%f4
	srax	%i4,	%g4,	%l3
	stb	%i5,	[%l7 + 0x64]
	xor	%i2,	0x0D56,	%l1
	andn	%o2,	0x05B5,	%i1
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	movcc	%xcc,	%g5,	%l6
	movg	%xcc,	%o0,	%g2
	movn	%icc,	%o4,	%o1
	movrlez	%o3,	%g7,	%l2
	umulcc	%i6,	%i0,	%o6
	edge8l	%l4,	%g3,	%i7
	edge8ln	%l5,	%i3,	%g1
	save %l0, %g4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i5,	0x072E,	%i2
	xnorcc	%l1,	0x0726,	%l3
	udiv	%i1,	0x1304,	%o5
	fnot1	%f8,	%f10
	st	%f17,	[%l7 + 0x5C]
	movrne	%o2,	%g6,	%o7
	smulcc	%g5,	0x0EBE,	%o0
	udivx	%g2,	0x024A,	%l6
	sdivx	%o4,	0x0BE1,	%o3
	xnorcc	%g7,	0x0161,	%l2
	st	%f23,	[%l7 + 0x5C]
	srax	%i6,	%o1,	%i0
	sub	%l4,	0x0EC8,	%g3
	ldsw	[%l7 + 0x7C],	%i7
	nop
	set	0x3C, %o6
	sth	%l5,	[%l7 + %o6]
	fxnors	%f11,	%f3,	%f2
	sll	%o6,	%g1,	%l0
	movleu	%xcc,	%i3,	%i4
	ldsw	[%l7 + 0x10],	%g4
	movn	%icc,	%i2,	%l1
	movvc	%xcc,	%l3,	%i1
	xnorcc	%i5,	0x1765,	%o2
	edge8ln	%o5,	%g6,	%g5
	alignaddrl	%o0,	%g2,	%l6
	edge16l	%o7,	%o4,	%g7
	xor	%o3,	%i6,	%o1
	array16	%i0,	%l4,	%g3
	movpos	%xcc,	%i7,	%l5
	movge	%xcc,	%o6,	%g1
	or	%l0,	0x055B,	%i3
	movleu	%xcc,	%i4,	%l2
	move	%icc,	%g4,	%i2
	fnor	%f6,	%f10,	%f8
	movn	%xcc,	%l1,	%i1
	movvs	%icc,	%i5,	%l3
	ldd	[%l7 + 0x78],	%f0
	move	%icc,	%o5,	%o2
	smulcc	%g6,	0x134A,	%o0
	edge16l	%g2,	%l6,	%g5
	sdivx	%o7,	0x0277,	%o4
	ldsb	[%l7 + 0x77],	%g7
	stb	%i6,	[%l7 + 0x18]
	fmul8x16	%f23,	%f10,	%f30
	for	%f12,	%f12,	%f18
	fabss	%f31,	%f14
	movneg	%xcc,	%o3,	%o1
	mulscc	%i0,	0x0B6D,	%g3
	popc	%i7,	%l4
	movne	%xcc,	%l5,	%g1
	subc	%l0,	0x0CE6,	%i3
	movgu	%icc,	%i4,	%o6
	udivx	%g4,	0x05B4,	%i2
	sub	%l2,	0x1B64,	%l1
	srax	%i1,	0x1B,	%l3
	alignaddr	%i5,	%o2,	%g6
	sth	%o0,	[%l7 + 0x50]
	movrne	%g2,	0x1F9,	%l6
	array8	%g5,	%o5,	%o7
	stb	%g7,	[%l7 + 0x74]
	movpos	%icc,	%i6,	%o4
	movrlz	%o1,	0x286,	%o3
	fxor	%f20,	%f12,	%f6
	movle	%icc,	%i0,	%i7
	sra	%g3,	0x1C,	%l4
	sub	%g1,	%l5,	%l0
	xorcc	%i4,	0x12CD,	%o6
	fandnot1	%f8,	%f2,	%f0
	fpadd16	%f6,	%f20,	%f10
	ldx	[%l7 + 0x18],	%i3
	fmovscc	%icc,	%f27,	%f24
	edge16	%i2,	%g4,	%l2
	move	%icc,	%i1,	%l3
	move	%xcc,	%i5,	%o2
	fmovsvc	%icc,	%f13,	%f21
	lduw	[%l7 + 0x40],	%g6
	udivx	%l1,	0x11A3,	%g2
	fmovsge	%icc,	%f18,	%f11
	fandnot2s	%f2,	%f5,	%f4
	umulcc	%l6,	0x060D,	%g5
	edge16ln	%o5,	%o0,	%o7
	fmovdl	%icc,	%f12,	%f6
	movle	%icc,	%g7,	%i6
	movre	%o4,	%o3,	%i0
	movrgez	%i7,	0x1D1,	%g3
	ldx	[%l7 + 0x48],	%o1
	sll	%g1,	0x0B,	%l4
	edge8ln	%l0,	%l5,	%i4
	edge16ln	%i3,	%i2,	%o6
	movleu	%xcc,	%g4,	%i1
	ldd	[%l7 + 0x28],	%l2
	srl	%i5,	%o2,	%g6
	fmovdcc	%icc,	%f6,	%f28
	umulcc	%l3,	0x1517,	%l1
	and	%g2,	%g5,	%l6
	edge8ln	%o0,	%o5,	%o7
	mova	%xcc,	%g7,	%i6
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f2
	fmovdcs	%xcc,	%f16,	%f11
	fmovdg	%icc,	%f5,	%f2
	movl	%xcc,	%o4,	%o3
	subc	%i7,	%g3,	%o1
	addccc	%g1,	0x03C2,	%i0
	movne	%icc,	%l4,	%l0
	sdiv	%l5,	0x0EAC,	%i3
	fcmpne32	%f8,	%f20,	%i2
	movl	%xcc,	%o6,	%i4
	ldx	[%l7 + 0x78],	%g4
	lduw	[%l7 + 0x48],	%l2
	fmovrdlez	%i5,	%f30,	%f12
	array8	%i1,	%g6,	%o2
	mova	%icc,	%l3,	%g2
	sdiv	%l1,	0x1366,	%l6
	addccc	%o0,	0x0D36,	%o5
	smulcc	%o7,	0x1799,	%g7
	movcs	%icc,	%g5,	%i6
	srl	%o3,	0x0C,	%o4
	orcc	%i7,	0x092D,	%o1
	save %g1, 0x04FF, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f2,	[%l7 + 0x60]
	sub	%i0,	0x1881,	%l0
	fpack16	%f4,	%f17
	array32	%l5,	%l4,	%i2
	ld	[%l7 + 0x60],	%f9
	ldd	[%l7 + 0x68],	%f12
	edge32l	%o6,	%i3,	%g4
	addc	%l2,	0x17C9,	%i5
	fcmpne16	%f2,	%f12,	%i1
	edge16n	%g6,	%o2,	%i4
	edge8l	%g2,	%l3,	%l1
	movrne	%o0,	0x145,	%l6
	edge16	%o7,	%g7,	%o5
	fornot1	%f10,	%f20,	%f16
	edge16	%g5,	%o3,	%o4
	edge16	%i7,	%i6,	%g1
	stw	%o1,	[%l7 + 0x48]
	andn	%g3,	0x1CB8,	%l0
	st	%f18,	[%l7 + 0x50]
	movrlz	%i0,	0x29E,	%l5
	lduh	[%l7 + 0x36],	%i2
	udiv	%o6,	0x15A9,	%l4
	andn	%g4,	0x07C4,	%l2
	fmovdleu	%xcc,	%f14,	%f4
	edge16	%i5,	%i3,	%i1
	edge8ln	%o2,	%g6,	%g2
	smul	%i4,	0x1963,	%l1
	xorcc	%l3,	0x1BC4,	%l6
	srlx	%o7,	%o0,	%o5
	fmovrdne	%g5,	%f4,	%f26
	lduh	[%l7 + 0x3A],	%o3
	mulscc	%g7,	0x1BC7,	%o4
	umulcc	%i6,	%g1,	%i7
	fones	%f0
	fmovsvs	%icc,	%f7,	%f8
	fpsub16s	%f13,	%f20,	%f23
	fmovrslz	%g3,	%f2,	%f24
	edge8ln	%l0,	%o1,	%l5
	subcc	%i0,	%o6,	%l4
	subcc	%g4,	0x09DA,	%l2
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%i5
	addc	%i3,	0x01E9,	%i1
	fandnot2	%f2,	%f10,	%f4
	sllx	%o2,	%g6,	%g2
	fpsub16s	%f12,	%f14,	%f23
	sub	%i4,	%l1,	%l3
	fmovdneg	%icc,	%f26,	%f9
	movrgz	%i2,	0x25D,	%l6
	edge32ln	%o0,	%o5,	%g5
	save %o7, %g7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc3,	%f8,	%f14
	mulscc	%i6,	0x1EB6,	%g1
	fnands	%f1,	%f9,	%f19
	std	%f30,	[%l7 + 0x10]
	movn	%xcc,	%i7,	%o3
	fmovdvc	%icc,	%f2,	%f11
	movg	%xcc,	%g3,	%o1
	addcc	%l5,	%i0,	%l0
	edge8ln	%l4,	%g4,	%l2
	fand	%f8,	%f12,	%f12
	movn	%icc,	%i5,	%i3
	movl	%xcc,	%o6,	%i1
	fmovrde	%g6,	%f30,	%f2
	nop
	set	0x54, %i2
	lduw	[%l7 + %i2],	%g2
	alignaddr	%o2,	%i4,	%l1
	sdiv	%l3,	0x1F63,	%l6
	sth	%i2,	[%l7 + 0x42]
	fpack32	%f12,	%f6,	%f4
	fmul8ulx16	%f20,	%f10,	%f26
	edge8ln	%o0,	%g5,	%o5
	nop
	set	0x6A, %o1
	stb	%o7,	[%l7 + %o1]
	srax	%g7,	0x0E,	%i6
	fmovsg	%xcc,	%f26,	%f28
	ldsh	[%l7 + 0x50],	%o4
	fone	%f10
	movleu	%icc,	%g1,	%o3
	edge16ln	%i7,	%g3,	%l5
	sth	%i0,	[%l7 + 0x3C]
	sdiv	%o1,	0x1312,	%l0
	movvs	%xcc,	%l4,	%l2
	fpack16	%f26,	%f7
	fmovdvs	%icc,	%f29,	%f30
	fmovse	%xcc,	%f4,	%f2
	fornot1s	%f5,	%f21,	%f13
	fmovrdlez	%i5,	%f2,	%f30
	fpsub32s	%f19,	%f10,	%f17
	movleu	%icc,	%g4,	%o6
	udivcc	%i3,	0x1E69,	%g6
	edge8l	%i1,	%g2,	%o2
	srlx	%i4,	0x1F,	%l3
	andn	%l6,	0x0254,	%l1
	movcs	%xcc,	%o0,	%g5
	edge32n	%o5,	%i2,	%o7
	movrlez	%i6,	%g7,	%g1
	movgu	%xcc,	%o3,	%o4
	xor	%g3,	0x0ACE,	%i7
	movre	%i0,	%l5,	%l0
	and	%l4,	%o1,	%l2
	subc	%i5,	%o6,	%i3
	alignaddr	%g4,	%g6,	%i1
	fmul8ulx16	%f0,	%f16,	%f8
	ldsh	[%l7 + 0x6A],	%g2
	movrgz	%i4,	%o2,	%l3
	movgu	%xcc,	%l6,	%l1
	and	%o0,	0x0827,	%g5
	edge16n	%o5,	%o7,	%i6
	fcmpne16	%f24,	%f14,	%i2
	umul	%g7,	%o3,	%g1
	edge8ln	%g3,	%i7,	%i0
	sdivx	%o4,	0x0778,	%l5
	srl	%l0,	0x1D,	%l4
	umul	%l2,	0x0D6A,	%o1
	movvc	%icc,	%o6,	%i5
	fcmpgt16	%f28,	%f26,	%i3
	fandnot2	%f4,	%f28,	%f26
	fmovsle	%icc,	%f7,	%f4
	lduh	[%l7 + 0x60],	%g6
	andncc	%g4,	%g2,	%i4
	movn	%xcc,	%o2,	%l3
	orncc	%l6,	%l1,	%o0
	fmovs	%f16,	%f12
	ldub	[%l7 + 0x41],	%g5
	move	%icc,	%i1,	%o5
	ldsh	[%l7 + 0x46],	%i6
	smulcc	%o7,	%i2,	%o3
	mova	%xcc,	%g1,	%g7
	fcmped	%fcc0,	%f6,	%f30
	save %g3, 0x164F, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o4,	%i0
	smulcc	%l5,	%l4,	%l0
	stx	%l2,	[%l7 + 0x40]
	xorcc	%o6,	0x119C,	%i5
	and	%o1,	%g6,	%g4
	fmovrsne	%g2,	%f11,	%f17
	orncc	%i3,	0x1E06,	%i4
	srl	%l3,	%o2,	%l6
	movcs	%xcc,	%o0,	%g5
	movrne	%l1,	%o5,	%i6
	movre	%i1,	%o7,	%i2
	edge8n	%o3,	%g7,	%g1
	fmovsn	%xcc,	%f0,	%f16
	add	%i7,	%o4,	%g3
	st	%f9,	[%l7 + 0x2C]
	addccc	%i0,	%l5,	%l4
	fmovdleu	%xcc,	%f8,	%f16
	fpsub16	%f26,	%f18,	%f22
	for	%f6,	%f24,	%f4
	sdiv	%l2,	0x0B57,	%l0
	edge8n	%o6,	%i5,	%g6
	sub	%g4,	0x1B51,	%o1
	fabsd	%f4,	%f18
	fcmple32	%f8,	%f28,	%g2
	udivx	%i4,	0x14DF,	%i3
	faligndata	%f26,	%f14,	%f26
	st	%f5,	[%l7 + 0x38]
	xnorcc	%l3,	0x16F7,	%l6
	andcc	%o2,	%o0,	%g5
	movne	%xcc,	%l1,	%o5
	st	%f5,	[%l7 + 0x34]
	fpack32	%f16,	%f22,	%f18
	fsrc2s	%f20,	%f9
	or	%i1,	0x0946,	%o7
	sdiv	%i6,	0x104B,	%i2
	movre	%g7,	%o3,	%g1
	movne	%icc,	%i7,	%o4
	sll	%g3,	%i0,	%l4
	edge8	%l5,	%l0,	%o6
	fnot1s	%f22,	%f26
	fandnot1s	%f14,	%f2,	%f31
	edge8l	%l2,	%i5,	%g6
	edge16l	%o1,	%g4,	%g2
	stb	%i3,	[%l7 + 0x26]
	fandnot2s	%f25,	%f11,	%f27
	subc	%l3,	%l6,	%o2
	edge16n	%i4,	%o0,	%g5
	umulcc	%o5,	0x0123,	%l1
	sll	%i1,	%o7,	%i6
	fandnot2s	%f7,	%f29,	%f20
	movcc	%icc,	%i2,	%g7
	orncc	%g1,	0x0710,	%i7
	faligndata	%f30,	%f8,	%f26
	edge8	%o3,	%o4,	%i0
	movneg	%xcc,	%l4,	%g3
	movgu	%xcc,	%l5,	%l0
	movvs	%icc,	%l2,	%o6
	fmovdleu	%xcc,	%f9,	%f6
	xnorcc	%g6,	0x07F8,	%o1
	udivcc	%i5,	0x1B46,	%g2
	movcc	%xcc,	%i3,	%g4
	orncc	%l6,	%l3,	%o2
	sll	%o0,	%i4,	%o5
	udivx	%l1,	0x03E8,	%i1
	movcs	%icc,	%g5,	%i6
	addccc	%i2,	0x0A87,	%g7
	ldd	[%l7 + 0x60],	%f6
	umul	%g1,	0x17CD,	%i7
	sllx	%o3,	%o4,	%i0
	sra	%l4,	%o7,	%g3
	movpos	%xcc,	%l5,	%l0
	fmovdvs	%icc,	%f10,	%f21
	nop
	set	0x70, %o2
	std	%f22,	[%l7 + %o2]
	alignaddrl	%o6,	%l2,	%g6
	srl	%i5,	0x0A,	%o1
	movcc	%xcc,	%g2,	%i3
	xnor	%g4,	%l3,	%o2
	fmovdl	%icc,	%f18,	%f4
	movleu	%xcc,	%o0,	%l6
	edge32ln	%i4,	%o5,	%i1
	movrlez	%g5,	0x060,	%i6
	orncc	%i2,	%g7,	%l1
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f2
	xorcc	%g1,	%o3,	%o4
	sllx	%i7,	%i0,	%o7
	sdivx	%g3,	0x10E5,	%l5
	sdivx	%l4,	0x0CC9,	%o6
	fand	%f28,	%f2,	%f28
	udivcc	%l0,	0x13E7,	%l2
	movn	%xcc,	%i5,	%o1
	movrlz	%g6,	0x151,	%g2
	alignaddr	%i3,	%l3,	%g4
	sethi	0x0459,	%o0
	ldsw	[%l7 + 0x48],	%o2
	subccc	%l6,	0x1BBC,	%i4
	fmovrse	%i1,	%f17,	%f1
	movcs	%icc,	%g5,	%i6
	sdiv	%i2,	0x038F,	%g7
	fmovrsgez	%o5,	%f7,	%f9
	fmul8x16	%f26,	%f2,	%f2
	fones	%f17
	movrgez	%l1,	%g1,	%o3
	edge8l	%o4,	%i7,	%o7
	add	%g3,	%l5,	%l4
	xor	%i0,	%l0,	%l2
	udivcc	%i5,	0x0F31,	%o6
	mova	%xcc,	%o1,	%g6
	nop
	set	0x30, %l6
	lduw	[%l7 + %l6],	%i3
	fornot1	%f10,	%f12,	%f2
	fmovrsgz	%l3,	%f21,	%f17
	ld	[%l7 + 0x6C],	%f0
	sdivx	%g2,	0x02C7,	%g4
	ldsh	[%l7 + 0x50],	%o2
	edge8	%o0,	%l6,	%i4
	movrne	%i1,	0x00B,	%i6
	andn	%g5,	%i2,	%g7
	st	%f26,	[%l7 + 0x20]
	sdivx	%o5,	0x18F5,	%g1
	ldub	[%l7 + 0x71],	%l1
	movg	%xcc,	%o4,	%o3
	and	%o7,	0x098D,	%i7
	fands	%f1,	%f14,	%f30
	alignaddr	%l5,	%g3,	%l4
	ldd	[%l7 + 0x38],	%f30
	sth	%i0,	[%l7 + 0x4E]
	stw	%l0,	[%l7 + 0x54]
	edge32ln	%i5,	%o6,	%o1
	srlx	%g6,	%l2,	%i3
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%g2
	fmovsle	%icc,	%f24,	%f11
	movre	%l3,	0x160,	%g4
	lduw	[%l7 + 0x50],	%o2
	fmovrslz	%l6,	%f21,	%f28
	addccc	%i4,	%o0,	%i6
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%g4
	udiv	%i1,	0x1462,	%i2
	edge32	%o5,	%g7,	%l1
	srlx	%o4,	0x0E,	%g1
	movvc	%xcc,	%o3,	%i7
	ldsw	[%l7 + 0x10],	%l5
	stw	%o7,	[%l7 + 0x28]
	stx	%g3,	[%l7 + 0x58]
	movrgez	%l4,	%l0,	%i5
	fmovdneg	%icc,	%f8,	%f27
	udivx	%i0,	0x1262,	%o6
	nop
	set	0x20, %l5
	stw	%g6,	[%l7 + %l5]
	movrlez	%o1,	0x12B,	%i3
	xor	%g2,	0x1662,	%l2
	movge	%xcc,	%g4,	%l3
	edge8l	%l6,	%i4,	%o2
	mova	%icc,	%o0,	%g5
	umul	%i1,	0x0B1B,	%i6
	popc	0x166F,	%i2
	edge16	%o5,	%g7,	%l1
	movrgez	%g1,	0x14B,	%o3
	fabsd	%f8,	%f22
	lduh	[%l7 + 0x0A],	%o4
	lduh	[%l7 + 0x54],	%i7
	andn	%o7,	%g3,	%l5
	mulx	%l0,	%l4,	%i5
	sethi	0x008A,	%i0
	movrne	%o6,	0x048,	%o1
	fmovrslez	%i3,	%f12,	%f18
	stb	%g2,	[%l7 + 0x2A]
	edge32	%l2,	%g6,	%g4
	fmovsg	%xcc,	%f30,	%f15
	fnand	%f2,	%f4,	%f22
	srax	%l3,	%i4,	%l6
	sdivx	%o2,	0x1DB5,	%g5
	array32	%o0,	%i1,	%i2
	edge16l	%o5,	%i6,	%g7
	fmovsneg	%xcc,	%f13,	%f13
	edge32	%g1,	%o3,	%l1
	xnor	%o4,	%o7,	%g3
	fmovspos	%icc,	%f30,	%f17
	movrne	%i7,	0x151,	%l5
	smul	%l0,	%l4,	%i5
	lduh	[%l7 + 0x5C],	%i0
	orn	%o1,	0x0968,	%i3
	fxors	%f3,	%f11,	%f18
	orn	%g2,	%o6,	%l2
	fabsd	%f2,	%f28
	srlx	%g6,	%l3,	%g4
	smul	%l6,	%i4,	%o2
	movcs	%icc,	%g5,	%o0
	fnand	%f6,	%f18,	%f14
	subcc	%i2,	%o5,	%i6
	movle	%xcc,	%i1,	%g1
	subc	%o3,	%g7,	%o4
	movre	%o7,	0x318,	%g3
	mulx	%l1,	%l5,	%i7
	fcmpes	%fcc0,	%f30,	%f25
	array16	%l0,	%l4,	%i0
	movge	%icc,	%o1,	%i5
	sth	%i3,	[%l7 + 0x34]
	fmovdcc	%icc,	%f25,	%f22
	edge8n	%g2,	%l2,	%o6
	xnorcc	%l3,	%g4,	%l6
	sra	%i4,	0x1A,	%o2
	udiv	%g5,	0x0CB4,	%g6
	movneg	%xcc,	%i2,	%o5
	alignaddrl	%o0,	%i6,	%g1
	movvc	%xcc,	%o3,	%i1
	and	%g7,	%o4,	%o7
	fsrc2	%f4,	%f24
	fmovrslz	%l1,	%f7,	%f2
	fmovspos	%icc,	%f21,	%f3
	movrne	%l5,	0x2DE,	%g3
	movcc	%icc,	%l0,	%i7
	mulscc	%i0,	%l4,	%o1
	addc	%i3,	%g2,	%i5
	movrlez	%l2,	0x2EE,	%o6
	sub	%g4,	%l6,	%i4
	addc	%l3,	%g5,	%o2
	movge	%icc,	%i2,	%o5
	sll	%o0,	0x0E,	%i6
	ldsw	[%l7 + 0x6C],	%g1
	fornot2s	%f3,	%f13,	%f26
	movrlez	%g6,	%i1,	%o3
	addccc	%g7,	%o7,	%l1
	ldub	[%l7 + 0x4E],	%l5
	movre	%g3,	0x21D,	%o4
	ldd	[%l7 + 0x58],	%f4
	subcc	%i7,	%l0,	%i0
	udivx	%l4,	0x18B2,	%o1
	movne	%icc,	%i3,	%g2
	fabss	%f9,	%f2
	edge32l	%l2,	%o6,	%g4
	array16	%i5,	%l6,	%i4
	movrgez	%l3,	%o2,	%g5
	and	%i2,	%o5,	%o0
	sra	%i6,	0x03,	%g6
	movne	%xcc,	%i1,	%o3
	addcc	%g1,	0x1701,	%o7
	sth	%l1,	[%l7 + 0x34]
	movrgz	%g7,	0x34C,	%l5
	edge8l	%g3,	%o4,	%l0
	sub	%i7,	0x02BF,	%l4
	nop
	set	0x5C, %l3
	lduw	[%l7 + %l3],	%o1
	fcmpeq32	%f24,	%f14,	%i3
	movre	%i0,	0x37D,	%l2
	lduh	[%l7 + 0x0C],	%o6
	lduh	[%l7 + 0x48],	%g4
	ldsb	[%l7 + 0x42],	%g2
	fsrc2	%f22,	%f14
	smulcc	%i5,	0x0C65,	%l6
	edge8ln	%i4,	%l3,	%g5
	movn	%icc,	%o2,	%o5
	fmovdneg	%icc,	%f2,	%f30
	fmovsge	%xcc,	%f0,	%f14
	array16	%i2,	%i6,	%g6
	fpack16	%f24,	%f1
	fmovsneg	%xcc,	%f21,	%f6
	fnand	%f8,	%f18,	%f2
	andn	%i1,	0x0B79,	%o3
	fpsub32s	%f0,	%f29,	%f27
	movre	%g1,	%o0,	%o7
	movl	%icc,	%g7,	%l1
	fpsub32s	%f26,	%f25,	%f7
	ldd	[%l7 + 0x58],	%l4
	fandnot1s	%f6,	%f30,	%f4
	stx	%o4,	[%l7 + 0x78]
	addccc	%g3,	0x0B49,	%i7
	and	%l0,	%o1,	%l4
	fmovrsgz	%i3,	%f27,	%f2
	fmovrdgz	%l2,	%f12,	%f4
	stw	%o6,	[%l7 + 0x70]
	fandnot1s	%f10,	%f3,	%f23
	fandnot1s	%f0,	%f5,	%f22
	movg	%xcc,	%i0,	%g2
	edge32n	%i5,	%g4,	%i4
	lduw	[%l7 + 0x34],	%l6
	sdiv	%l3,	0x044D,	%o2
	ldd	[%l7 + 0x58],	%f26
	xorcc	%o5,	%i2,	%g5
	smul	%g6,	0x025E,	%i6
	movgu	%icc,	%i1,	%g1
	fcmple16	%f0,	%f30,	%o3
	popc	0x008D,	%o7
	subccc	%o0,	0x0F91,	%g7
	sth	%l1,	[%l7 + 0x76]
	movleu	%xcc,	%o4,	%l5
	fmovrsne	%i7,	%f28,	%f20
	fxor	%f4,	%f4,	%f16
	and	%l0,	0x11A5,	%g3
	fsrc2s	%f6,	%f6
	edge16n	%l4,	%i3,	%l2
	edge32n	%o6,	%o1,	%g2
	stb	%i0,	[%l7 + 0x0D]
	lduw	[%l7 + 0x58],	%g4
	edge16ln	%i5,	%l6,	%i4
	movn	%icc,	%o2,	%l3
	edge8l	%i2,	%g5,	%g6
	array8	%i6,	%i1,	%o5
	move	%xcc,	%o3,	%g1
	fmovdg	%xcc,	%f10,	%f1
	subc	%o0,	0x18DA,	%o7
	movgu	%icc,	%l1,	%o4
	movleu	%xcc,	%l5,	%i7
	fmovrdlez	%g7,	%f14,	%f14
	movvs	%icc,	%g3,	%l0
	mova	%icc,	%i3,	%l2
	movle	%xcc,	%l4,	%o1
	sra	%o6,	%i0,	%g4
	movg	%xcc,	%g2,	%i5
	fabsd	%f0,	%f0
	mova	%icc,	%i4,	%l6
	edge8l	%o2,	%i2,	%g5
	sub	%g6,	%l3,	%i6
	movleu	%xcc,	%o5,	%i1
	fcmps	%fcc2,	%f13,	%f11
	stw	%o3,	[%l7 + 0x7C]
	mulscc	%o0,	0x10DA,	%g1
	stw	%o7,	[%l7 + 0x08]
	srax	%o4,	%l1,	%l5
	smul	%i7,	0x1D80,	%g3
	addccc	%l0,	0x135C,	%g7
	ld	[%l7 + 0x78],	%f14
	orncc	%i3,	0x0BDC,	%l4
	fmovrsgz	%l2,	%f31,	%f27
	umul	%o6,	%i0,	%o1
	lduw	[%l7 + 0x3C],	%g2
	movcc	%icc,	%i5,	%g4
	xnor	%i4,	0x00C8,	%o2
	orncc	%i2,	%l6,	%g6
	fone	%f16
	orcc	%l3,	0x065C,	%i6
	movcs	%xcc,	%g5,	%o5
	fmovscs	%icc,	%f30,	%f4
	sethi	0x17F5,	%o3
	edge8n	%o0,	%i1,	%o7
	ldsb	[%l7 + 0x73],	%o4
	fmovsge	%icc,	%f27,	%f2
	xnor	%g1,	%l1,	%i7
	sllx	%l5,	0x05,	%l0
	fcmple32	%f20,	%f18,	%g7
	fmovsle	%icc,	%f16,	%f2
	edge32n	%g3,	%i3,	%l2
	fpack16	%f14,	%f19
	mulscc	%o6,	%l4,	%i0
	movpos	%xcc,	%g2,	%i5
	array32	%g4,	%i4,	%o2
	sra	%o1,	0x1B,	%l6
	stx	%g6,	[%l7 + 0x70]
	addc	%l3,	%i6,	%g5
	orcc	%i2,	0x009D,	%o3
	fmovs	%f12,	%f13
	udiv	%o5,	0x0FE3,	%i1
	udivx	%o7,	0x1791,	%o4
	xor	%o0,	0x0A37,	%g1
	fmovrdne	%l1,	%f24,	%f26
	edge8n	%l5,	%i7,	%g7
	movrgez	%l0,	0x013,	%g3
	stb	%i3,	[%l7 + 0x7A]
	and	%l2,	%o6,	%i0
	fmovrdlez	%g2,	%f8,	%f8
	restore %l4, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f22,	%f12,	%f7
	addcc	%o2,	%i4,	%l6
	edge8ln	%g6,	%l3,	%i6
	fsrc2s	%f3,	%f6
	orn	%o1,	0x05A9,	%i2
	fcmpgt32	%f10,	%f22,	%o3
	orncc	%g5,	0x102C,	%o5
	ldx	[%l7 + 0x20],	%o7
	fornot2s	%f25,	%f27,	%f18
	and	%o4,	0x019E,	%o0
	add	%g1,	0x146B,	%l1
	andcc	%i1,	0x0262,	%i7
	srax	%g7,	0x06,	%l5
	movpos	%icc,	%l0,	%i3
	movcs	%icc,	%g3,	%l2
	ldd	[%l7 + 0x50],	%i0
	movle	%icc,	%o6,	%g2
	addccc	%g4,	0x0555,	%l4
	fcmpeq32	%f12,	%f18,	%o2
	alignaddr	%i5,	%l6,	%i4
	fmovrslz	%g6,	%f6,	%f19
	andcc	%i6,	0x0307,	%l3
	fmovde	%icc,	%f8,	%f10
	popc	0x0B7B,	%o1
	smul	%i2,	0x1149,	%o3
	fmovrdlz	%g5,	%f2,	%f6
	xor	%o7,	0x0D61,	%o4
	orn	%o0,	%o5,	%l1
	fmuld8ulx16	%f23,	%f22,	%f4
	movn	%xcc,	%g1,	%i7
	movle	%xcc,	%i1,	%g7
	array8	%l0,	%l5,	%i3
	edge32	%l2,	%g3,	%i0
	andncc	%o6,	%g2,	%g4
	save %o2, 0x1C71, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l6,	%i4,	%l4
	movgu	%xcc,	%g6,	%i6
	sll	%o1,	%l3,	%o3
	ldsw	[%l7 + 0x44],	%g5
	xnor	%i2,	%o4,	%o7
	or	%o5,	0x07B8,	%l1
	sll	%o0,	0x06,	%i7
	fcmpeq16	%f2,	%f8,	%g1
	ldsb	[%l7 + 0x44],	%i1
	umulcc	%l0,	%g7,	%l5
	ldd	[%l7 + 0x70],	%l2
	fmuld8sux16	%f18,	%f17,	%f30
	orcc	%i3,	%i0,	%o6
	edge16l	%g3,	%g4,	%o2
	ld	[%l7 + 0x0C],	%f10
	lduw	[%l7 + 0x68],	%i5
	orn	%l6,	0x131E,	%i4
	sdiv	%l4,	0x1376,	%g2
	sll	%i6,	0x06,	%o1
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	orn	%g5,	0x06DC,	%i2
	udivcc	%o4,	0x1B7E,	%o3
	fcmpes	%fcc3,	%f0,	%f14
	edge8l	%o5,	%l1,	%o7
	fmovdg	%xcc,	%f25,	%f21
	andncc	%i7,	%o0,	%g1
	move	%xcc,	%i1,	%g7
	umul	%l0,	%l5,	%l2
	ldsh	[%l7 + 0x24],	%i3
	edge32l	%i0,	%g3,	%g4
	edge32n	%o6,	%i5,	%o2
	fmovsn	%icc,	%f22,	%f5
	srl	%l6,	0x00,	%i4
	subcc	%g2,	0x0966,	%l4
	fexpand	%f12,	%f30
	sll	%o1,	%g6,	%l3
	sdivx	%g5,	0x1251,	%i6
	movleu	%xcc,	%i2,	%o3
	mulx	%o5,	0x1C42,	%l1
	movle	%xcc,	%o7,	%i7
	array16	%o4,	%o0,	%i1
	fors	%f19,	%f5,	%f13
	fnot2s	%f12,	%f31
	edge8n	%g1,	%l0,	%l5
	fcmped	%fcc2,	%f2,	%f16
	srax	%l2,	%g7,	%i0
	movcs	%xcc,	%g3,	%g4
	sra	%i3,	0x1E,	%i5
	sdivcc	%o2,	0x0A87,	%o6
	addcc	%l6,	%g2,	%i4
	restore %o1, %l4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l3,	%g5,	%i6
	movrne	%o3,	0x1FD,	%o5
	andn	%i2,	%l1,	%o7
	pdist	%f28,	%f22,	%f26
	fxnors	%f3,	%f14,	%f25
	srlx	%o4,	%i7,	%i1
	smulcc	%o0,	0x0029,	%g1
	sdiv	%l5,	0x04D8,	%l2
	fmovdleu	%xcc,	%f26,	%f4
	addc	%g7,	%i0,	%g3
	fmovdpos	%xcc,	%f2,	%f3
	ldd	[%l7 + 0x08],	%g4
	smul	%i3,	0x0098,	%i5
	fcmpgt16	%f28,	%f16,	%l0
	array16	%o2,	%o6,	%l6
	bshuffle	%f26,	%f28,	%f14
	save %i4, 0x0596, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l4,	%g6,	%g2
	st	%f29,	[%l7 + 0x24]
	movleu	%icc,	%l3,	%g5
	fmovse	%xcc,	%f13,	%f15
	movn	%xcc,	%o3,	%i6
	movrgez	%i2,	0x297,	%o5
	fandnot2	%f22,	%f28,	%f16
	sethi	0x006E,	%l1
	andn	%o7,	0x1060,	%o4
	fmovd	%f16,	%f4
	smul	%i7,	0x15BA,	%i1
	fsrc1	%f22,	%f22
	edge32n	%o0,	%l5,	%l2
	lduw	[%l7 + 0x3C],	%g7
	mulscc	%g1,	%g3,	%g4
	subccc	%i3,	%i0,	%i5
	fmovda	%icc,	%f28,	%f21
	std	%f2,	[%l7 + 0x48]
	movrlez	%o2,	0x3A6,	%o6
	fzeros	%f27
	mova	%icc,	%l0,	%l6
	srl	%i4,	0x1E,	%l4
	orcc	%g6,	0x1E9F,	%o1
	ldx	[%l7 + 0x18],	%l3
	lduh	[%l7 + 0x72],	%g2
	subccc	%o3,	%g5,	%i2
	udivcc	%o5,	0x17B6,	%l1
	ldd	[%l7 + 0x20],	%f8
	addcc	%i6,	%o7,	%i7
	edge16l	%i1,	%o0,	%l5
	edge32	%l2,	%g7,	%g1
	and	%g3,	%g4,	%o4
	sir	0x0834
	movcs	%xcc,	%i3,	%i5
	srlx	%o2,	%o6,	%i0
	edge32n	%l0,	%i4,	%l4
	edge16l	%g6,	%o1,	%l3
	udiv	%g2,	0x0EC6,	%l6
	movrlz	%o3,	%g5,	%o5
	udivcc	%l1,	0x1610,	%i2
	fmovsne	%xcc,	%f18,	%f20
	movrgz	%i6,	%o7,	%i7
	nop
	set	0x5A, %o7
	ldsh	[%l7 + %o7],	%o0
	xorcc	%i1,	%l2,	%l5
	edge16	%g7,	%g3,	%g1
	andn	%g4,	0x0AE5,	%o4
	movrgz	%i3,	0x2CF,	%o2
	sllx	%i5,	0x0A,	%i0
	alignaddrl	%o6,	%l0,	%i4
	movg	%xcc,	%l4,	%g6
	fmul8sux16	%f0,	%f12,	%f24
	alignaddrl	%l3,	%g2,	%o1
	movre	%o3,	0x2AE,	%g5
	movle	%xcc,	%l6,	%l1
	popc	%i2,	%i6
	edge16n	%o7,	%i7,	%o0
	edge8n	%i1,	%o5,	%l5
	fmovrsgz	%g7,	%f12,	%f25
	ldsb	[%l7 + 0x69],	%l2
	edge16ln	%g3,	%g1,	%g4
	movge	%icc,	%o4,	%o2
	ldx	[%l7 + 0x20],	%i5
	andn	%i3,	%o6,	%i0
	movvc	%xcc,	%i4,	%l0
	ldsw	[%l7 + 0x3C],	%g6
	edge16ln	%l4,	%l3,	%o1
	fmovscs	%icc,	%f10,	%f13
	edge32	%o3,	%g5,	%l6
	mova	%xcc,	%l1,	%i2
	udivcc	%i6,	0x19D7,	%g2
	srl	%i7,	0x17,	%o7
	movle	%xcc,	%o0,	%i1
	edge8ln	%o5,	%g7,	%l2
	edge16	%g3,	%l5,	%g4
	st	%f4,	[%l7 + 0x58]
	popc	%g1,	%o2
	edge16n	%o4,	%i5,	%o6
	std	%f2,	[%l7 + 0x08]
	stw	%i0,	[%l7 + 0x7C]
	fmovdcc	%icc,	%f17,	%f13
	subccc	%i3,	%l0,	%g6
	andn	%i4,	0x0193,	%l4
	fmul8x16	%f15,	%f14,	%f10
	edge8	%o1,	%l3,	%o3
	ld	[%l7 + 0x1C],	%f28
	umul	%g5,	%l6,	%i2
	movre	%l1,	%i6,	%i7
	orncc	%o7,	%o0,	%i1
	stb	%g2,	[%l7 + 0x2A]
	addcc	%o5,	%g7,	%l2
	fcmple16	%f24,	%f6,	%g3
	lduh	[%l7 + 0x64],	%g4
	movleu	%xcc,	%l5,	%g1
	andn	%o4,	%i5,	%o6
	movpos	%icc,	%o2,	%i0
	edge16	%i3,	%l0,	%g6
	subc	%l4,	0x1CD8,	%i4
	sub	%o1,	0x0B24,	%o3
	sll	%g5,	%l3,	%l6
	subccc	%l1,	0x156D,	%i6
	udiv	%i7,	0x1A04,	%i2
	array8	%o0,	%i1,	%g2
	popc	0x06A1,	%o7
	subc	%g7,	0x0874,	%l2
	movle	%icc,	%g3,	%g4
	fmovs	%f5,	%f2
	alignaddr	%l5,	%g1,	%o5
	fmovse	%xcc,	%f8,	%f9
	sub	%i5,	0x16F9,	%o6
	edge16l	%o2,	%o4,	%i0
	orncc	%l0,	%i3,	%g6
	fmovdneg	%icc,	%f19,	%f12
	sir	0x0B84
	xor	%l4,	0x13DE,	%i4
	movpos	%icc,	%o1,	%g5
	subcc	%l3,	%o3,	%l1
	orn	%l6,	0x1CB5,	%i6
	fmovrsgez	%i7,	%f9,	%f20
	mulx	%i2,	%o0,	%g2
	array32	%o7,	%i1,	%g7
	ldsb	[%l7 + 0x7A],	%l2
	mova	%xcc,	%g3,	%l5
	ldd	[%l7 + 0x10],	%f24
	sth	%g4,	[%l7 + 0x1E]
	ldd	[%l7 + 0x70],	%g0
	ldsw	[%l7 + 0x48],	%o5
	fcmpeq16	%f18,	%f16,	%o6
	orcc	%i5,	0x10F5,	%o2
	ldsb	[%l7 + 0x47],	%i0
	movrne	%l0,	0x12E,	%i3
	sllx	%g6,	%o4,	%i4
	fmul8sux16	%f18,	%f8,	%f28
	edge16n	%l4,	%o1,	%g5
	movrlez	%l3,	%o3,	%l1
	fornot1s	%f19,	%f16,	%f5
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	udiv	%i2,	0x1F97,	%g2
	movn	%icc,	%o0,	%o7
	st	%f8,	[%l7 + 0x74]
	fmovdle	%icc,	%f31,	%f0
	sth	%i1,	[%l7 + 0x14]
	subc	%l2,	%g3,	%l5
	udivx	%g7,	0x013B,	%g1
	edge8ln	%o5,	%o6,	%g4
	movne	%xcc,	%i5,	%i0
	xnor	%o2,	0x0D2C,	%l0
	fmovrdlz	%i3,	%f10,	%f4
	popc	%g6,	%i4
	alignaddrl	%o4,	%o1,	%g5
	movrlz	%l3,	%o3,	%l4
	fnegs	%f15,	%f30
	fands	%f5,	%f7,	%f4
	fcmpgt32	%f0,	%f30,	%l1
	mulx	%i6,	0x197C,	%l6
	fnand	%f26,	%f24,	%f12
	fandnot2	%f22,	%f6,	%f14
	movrne	%i2,	0x1D7,	%g2
	udivx	%o0,	0x09D1,	%o7
	lduh	[%l7 + 0x76],	%i7
	movrlez	%l2,	%g3,	%l5
	fmovrdlz	%i1,	%f10,	%f4
	movn	%icc,	%g1,	%g7
	addccc	%o5,	0x1BC0,	%g4
	subcc	%i5,	0x03D1,	%o6
	edge32l	%o2,	%i0,	%l0
	ldd	[%l7 + 0x38],	%f18
	or	%i3,	%i4,	%g6
	fnors	%f18,	%f18,	%f23
	movrlez	%o1,	0x2E2,	%g5
	fornot1s	%f9,	%f27,	%f25
	fmovdge	%icc,	%f5,	%f8
	udivcc	%l3,	0x04AA,	%o4
	fmovrdgez	%o3,	%f24,	%f6
	fcmps	%fcc2,	%f21,	%f8
	sra	%l1,	0x1C,	%l4
	sdivx	%l6,	0x0664,	%i2
	st	%f29,	[%l7 + 0x40]
	subcc	%g2,	0x0F17,	%o0
	fpsub16s	%f14,	%f6,	%f31
	fmovdcs	%xcc,	%f2,	%f25
	movrlz	%o7,	0x358,	%i6
	addccc	%l2,	%i7,	%g3
	subccc	%i1,	%g1,	%l5
	movl	%xcc,	%g7,	%g4
	fcmpgt16	%f8,	%f26,	%o5
	movcc	%xcc,	%o6,	%i5
	lduw	[%l7 + 0x44],	%i0
	edge16n	%l0,	%o2,	%i3
	addcc	%g6,	%i4,	%o1
	stx	%l3,	[%l7 + 0x68]
	edge32ln	%g5,	%o4,	%l1
	movl	%icc,	%l4,	%o3
	srl	%l6,	0x0C,	%i2
	fmovscc	%xcc,	%f14,	%f11
	movrne	%o0,	0x3B3,	%o7
	movrgz	%g2,	0x231,	%l2
	array32	%i7,	%g3,	%i6
	movl	%icc,	%g1,	%i1
	fcmpes	%fcc0,	%f9,	%f23
	andncc	%g7,	%l5,	%g4
	move	%icc,	%o6,	%i5
	ldub	[%l7 + 0x22],	%i0
	xnor	%o5,	0x18BF,	%l0
	movneg	%xcc,	%o2,	%g6
	sll	%i4,	%i3,	%l3
	fors	%f26,	%f20,	%f23
	xor	%g5,	%o4,	%o1
	fcmped	%fcc0,	%f14,	%f26
	sllx	%l1,	%o3,	%l4
	fpsub32	%f20,	%f14,	%f14
	fmovdg	%icc,	%f28,	%f3
	fmovsge	%icc,	%f12,	%f27
	xnorcc	%l6,	%o0,	%i2
	orcc	%g2,	%o7,	%i7
	smul	%l2,	%g3,	%i6
	movne	%icc,	%i1,	%g1
	save %l5, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o6,	%i0
	ldx	[%l7 + 0x18],	%i5
	edge32n	%l0,	%o2,	%o5
	addccc	%g6,	%i4,	%l3
	movl	%xcc,	%g5,	%i3
	subc	%o1,	%l1,	%o3
	fcmpeq32	%f0,	%f16,	%o4
	edge8l	%l4,	%o0,	%i2
	movne	%icc,	%g2,	%l6
	movneg	%xcc,	%i7,	%l2
	mova	%icc,	%g3,	%i6
	mulscc	%o7,	%i1,	%g1
	andcc	%g7,	0x049F,	%l5
	lduw	[%l7 + 0x18],	%g4
	fmul8x16	%f22,	%f12,	%f20
	edge16l	%o6,	%i5,	%i0
	ldsw	[%l7 + 0x68],	%o2
	sethi	0x1400,	%o5
	lduw	[%l7 + 0x14],	%l0
	lduw	[%l7 + 0x7C],	%i4
	sub	%g6,	0x0164,	%l3
	fmovsn	%xcc,	%f11,	%f23
	restore %g5, 0x1F11, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l1,	0x04C9,	%o3
	alignaddr	%o4,	%i3,	%o0
	stw	%i2,	[%l7 + 0x58]
	movvc	%xcc,	%g2,	%l4
	udiv	%l6,	0x186A,	%l2
	subc	%g3,	%i6,	%i7
	ldsw	[%l7 + 0x5C],	%o7
	orcc	%g1,	0x0B0C,	%g7
	addccc	%l5,	0x031B,	%g4
	ldub	[%l7 + 0x3E],	%i1
	umul	%o6,	%i0,	%i5
	movcs	%xcc,	%o2,	%o5
	std	%f24,	[%l7 + 0x40]
	stb	%i4,	[%l7 + 0x58]
	movle	%xcc,	%l0,	%g6
	fand	%f0,	%f0,	%f18
	and	%l3,	0x1968,	%o1
	smul	%g5,	%o3,	%o4
	fands	%f26,	%f22,	%f12
	subcc	%l1,	0x1D7A,	%o0
	and	%i3,	%i2,	%g2
	orncc	%l6,	0x0CA3,	%l4
	andncc	%g3,	%i6,	%i7
	lduh	[%l7 + 0x2A],	%l2
	fmovrdgez	%g1,	%f12,	%f4
	edge8ln	%o7,	%g7,	%l5
	edge16ln	%i1,	%g4,	%o6
	stb	%i5,	[%l7 + 0x72]
	movrne	%o2,	%i0,	%i4
	edge8ln	%l0,	%g6,	%o5
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	save %o1, 0x057E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%o4,	%f4,	%f22
	fmovsn	%xcc,	%f19,	%f30
	edge16l	%o0,	%l1,	%i2
	fpadd16s	%f2,	%f7,	%f16
	xnor	%g2,	%l6,	%i3
	fnegs	%f9,	%f2
	faligndata	%f20,	%f16,	%f18
	xor	%l4,	%g3,	%i7
	edge16ln	%i6,	%l2,	%g1
	edge32n	%g7,	%o7,	%l5
	edge16n	%g4,	%i1,	%o6
	addccc	%o2,	0x1A59,	%i5
	ldd	[%l7 + 0x60],	%f14
	move	%icc,	%i0,	%l0
	lduh	[%l7 + 0x10],	%i4
	ldd	[%l7 + 0x20],	%f14
	fpsub16	%f30,	%f8,	%f14
	ldsh	[%l7 + 0x42],	%o5
	movre	%g6,	0x1E9,	%l3
	srlx	%g5,	0x1F,	%o1
	nop
	set	0x08, %i3
	stx	%o4,	[%l7 + %i3]
	ldsb	[%l7 + 0x6C],	%o3
	ld	[%l7 + 0x38],	%f6
	udiv	%o0,	0x14A4,	%i2
	movn	%icc,	%g2,	%l1
	save %l6, %i3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l4,	%i7,	%l2
	edge32ln	%g1,	%i6,	%g7
	sra	%o7,	0x16,	%l5
	fabsd	%f10,	%f10
	xnorcc	%i1,	0x0545,	%o6
	ldub	[%l7 + 0x12],	%o2
	andncc	%g4,	%i5,	%i0
	alignaddrl	%i4,	%l0,	%o5
	restore %g6, 0x1A18, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o1,	%o4,	%g5
	fmovsg	%icc,	%f8,	%f1
	xnor	%o3,	%o0,	%i2
	movvc	%xcc,	%g2,	%l1
	movcs	%icc,	%i3,	%g3
	orn	%l6,	0x1D05,	%i7
	movcs	%icc,	%l2,	%l4
	fmovrslez	%g1,	%f13,	%f5
	subccc	%g7,	%o7,	%i6
	stb	%l5,	[%l7 + 0x79]
	fcmple32	%f8,	%f14,	%i1
	lduh	[%l7 + 0x22],	%o6
	movvs	%xcc,	%o2,	%g4
	orcc	%i0,	%i5,	%l0
	movre	%o5,	0x1B7,	%i4
	subccc	%g6,	0x115B,	%o1
	ldd	[%l7 + 0x50],	%o4
	udiv	%l3,	0x005B,	%g5
	nop
	set	0x08, %i5
	ldub	[%l7 + %i5],	%o0
	fones	%f1
	and	%i2,	0x0FF7,	%o3
	fcmpgt16	%f22,	%f14,	%g2
	movg	%icc,	%l1,	%g3
	fabss	%f18,	%f31
	faligndata	%f0,	%f8,	%f16
	xorcc	%l6,	0x03FB,	%i3
	sub	%i7,	%l2,	%l4
	fmovse	%icc,	%f17,	%f4
	fmul8x16al	%f25,	%f21,	%f30
	stw	%g7,	[%l7 + 0x1C]
	edge32	%o7,	%g1,	%i6
	ld	[%l7 + 0x08],	%f30
	ldx	[%l7 + 0x78],	%i1
	smul	%o6,	%o2,	%g4
	sdiv	%i0,	0x1D8A,	%l5
	nop
	set	0x4E, %l0
	lduh	[%l7 + %l0],	%i5
	ldd	[%l7 + 0x58],	%o4
	movgu	%icc,	%l0,	%g6
	edge32ln	%i4,	%o1,	%l3
	subc	%o4,	%o0,	%g5
	ldsw	[%l7 + 0x2C],	%o3
	edge16n	%i2,	%g2,	%l1
	edge8	%l6,	%g3,	%i7
	ldd	[%l7 + 0x18],	%i2
	array16	%l2,	%g7,	%o7
	popc	0x17FF,	%g1
	movvc	%icc,	%i6,	%i1
	and	%l4,	0x168B,	%o6
	subc	%g4,	0x17FE,	%i0
	ldd	[%l7 + 0x60],	%l4
	fpadd32s	%f1,	%f9,	%f29
	mulscc	%o2,	%i5,	%l0
	ldsw	[%l7 + 0x78],	%o5
	movrgez	%g6,	%i4,	%l3
	pdist	%f22,	%f26,	%f26
	movneg	%icc,	%o4,	%o0
	fcmple16	%f28,	%f30,	%g5
	array8	%o3,	%o1,	%g2
	smul	%l1,	%l6,	%g3
	edge16n	%i7,	%i2,	%i3
	stw	%l2,	[%l7 + 0x5C]
	fmovrdlez	%o7,	%f22,	%f26
	fmovdcs	%icc,	%f17,	%f21
	fmovdl	%xcc,	%f22,	%f11
	fxnor	%f6,	%f8,	%f18
	and	%g1,	0x0E0B,	%g7
	movneg	%icc,	%i1,	%l4
	fxors	%f16,	%f0,	%f11
	fnegd	%f0,	%f6
	edge16l	%o6,	%i6,	%g4
	andncc	%i0,	%o2,	%l5
	mova	%icc,	%i5,	%l0
	orn	%o5,	0x0BC2,	%i4
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	ld	[%l7 + 0x78],	%f11
	subc	%o4,	%g5,	%o3
	ldx	[%l7 + 0x50],	%o1
	nop
	set	0x40, %i6
	std	%f22,	[%l7 + %i6]
	edge16	%g2,	%l1,	%o0
	ldsh	[%l7 + 0x7A],	%l6
	bshuffle	%f22,	%f18,	%f10
	array16	%g3,	%i2,	%i7
	fmovdleu	%xcc,	%f16,	%f22
	fmovrse	%i3,	%f27,	%f22
	udivx	%o7,	0x1EFD,	%l2
	udiv	%g1,	0x1480,	%i1
	sll	%l4,	0x17,	%g7
	fcmpeq32	%f24,	%f28,	%o6
	movrne	%g4,	0x27A,	%i6
	movcs	%icc,	%i0,	%o2
	and	%i5,	0x13E9,	%l5
	ldsh	[%l7 + 0x20],	%l0
	udivx	%o5,	0x0E68,	%i4
	edge8	%l3,	%o4,	%g6
	alignaddrl	%o3,	%g5,	%o1
	ldd	[%l7 + 0x30],	%l0
	edge16n	%g2,	%o0,	%l6
	stx	%g3,	[%l7 + 0x78]
	save %i2, %i7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f8,	%f24,	%f24
	edge8l	%o7,	%l2,	%g1
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%i1
	stb	%g7,	[%l7 + 0x7B]
	or	%l4,	%o6,	%g4
	fpadd32s	%f0,	%f22,	%f12
	edge32ln	%i0,	%o2,	%i5
	movrne	%l5,	0x16A,	%l0
	stx	%i6,	[%l7 + 0x48]
	fmul8sux16	%f2,	%f2,	%f4
	mova	%icc,	%i4,	%o5
	movrlez	%o4,	0x260,	%l3
	umul	%o3,	0x1FEF,	%g6
	sub	%g5,	%l1,	%g2
	movn	%xcc,	%o1,	%l6
	popc	%g3,	%i2
	sub	%i7,	%o0,	%o7
	fmovdl	%xcc,	%f15,	%f17
	movcc	%icc,	%l2,	%g1
	edge32ln	%i3,	%g7,	%l4
	add	%i1,	%o6,	%g4
	smulcc	%o2,	0x1204,	%i5
	mulscc	%l5,	%i0,	%i6
	xnor	%i4,	0x022D,	%o5
	umulcc	%l0,	%l3,	%o3
	movle	%icc,	%g6,	%o4
	fmovrdgz	%l1,	%f0,	%f28
	edge8	%g5,	%o1,	%g2
	movne	%xcc,	%l6,	%g3
	xnor	%i7,	%o0,	%o7
	orn	%i2,	0x009D,	%l2
	edge32ln	%g1,	%i3,	%g7
	fmovs	%f14,	%f30
	add	%l4,	0x1DB2,	%i1
	fabss	%f14,	%f31
	fmovsleu	%xcc,	%f23,	%f20
	andncc	%o6,	%g4,	%o2
	movre	%i5,	%i0,	%i6
	add	%i4,	0x185A,	%l5
	andcc	%l0,	%l3,	%o3
	fcmpgt16	%f24,	%f20,	%g6
	edge16	%o4,	%o5,	%g5
	fpack16	%f14,	%f31
	movvs	%xcc,	%o1,	%g2
	subc	%l1,	%l6,	%g3
	edge32ln	%o0,	%i7,	%o7
	alignaddrl	%i2,	%l2,	%i3
	ld	[%l7 + 0x28],	%f6
	andn	%g7,	0x147A,	%g1
	srax	%l4,	%o6,	%g4
	edge8n	%o2,	%i1,	%i0
	ldsb	[%l7 + 0x4F],	%i5
	fmovsvc	%xcc,	%f8,	%f17
	movpos	%icc,	%i4,	%i6
	mova	%xcc,	%l0,	%l5
	stx	%o3,	[%l7 + 0x40]
	edge8n	%g6,	%l3,	%o5
	sdivcc	%g5,	0x06F1,	%o4
	edge32l	%o1,	%g2,	%l6
	subc	%l1,	%o0,	%g3
	fnors	%f10,	%f14,	%f6
	umulcc	%o7,	0x03DF,	%i7
	edge32ln	%l2,	%i3,	%g7
	movvs	%xcc,	%i2,	%l4
	fmovsl	%xcc,	%f30,	%f3
	movpos	%icc,	%g1,	%g4
	subc	%o2,	%o6,	%i0
	movn	%xcc,	%i5,	%i1
	sll	%i4,	0x00,	%l0
	fmovsn	%xcc,	%f17,	%f25
	movvs	%icc,	%l5,	%i6
	fxors	%f4,	%f8,	%f23
	edge16l	%g6,	%l3,	%o5
	xnorcc	%g5,	0x1DF8,	%o4
	subcc	%o3,	%o1,	%l6
	sdivcc	%l1,	0x093D,	%g2
	fnor	%f8,	%f22,	%f4
	bshuffle	%f18,	%f4,	%f0
	udivcc	%g3,	0x0DCE,	%o7
	orcc	%o0,	%l2,	%i3
	edge32ln	%g7,	%i7,	%l4
	fpsub16s	%f9,	%f20,	%f24
	movgu	%icc,	%i2,	%g4
	fcmpgt32	%f4,	%f4,	%o2
	alignaddr	%o6,	%g1,	%i5
	fpadd32	%f2,	%f0,	%f28
	fmovsn	%xcc,	%f21,	%f21
	fmovdneg	%icc,	%f28,	%f29
	srl	%i0,	%i1,	%i4
	mulx	%l5,	%i6,	%l0
	orncc	%l3,	0x04CB,	%o5
	umul	%g6,	%o4,	%o3
	sra	%g5,	0x0D,	%o1
	popc	0x0885,	%l1
	edge32ln	%l6,	%g2,	%o7
	movpos	%icc,	%o0,	%g3
	subc	%i3,	%l2,	%g7
	srl	%i7,	%i2,	%l4
	fmovrsgz	%o2,	%f14,	%f18
	stb	%o6,	[%l7 + 0x1A]
	fmovsleu	%xcc,	%f3,	%f10
	mulscc	%g1,	0x0EAA,	%g4
	movne	%xcc,	%i0,	%i1
	addccc	%i4,	%l5,	%i5
	edge16	%i6,	%l3,	%o5
	movre	%g6,	0x2F5,	%l0
	fpackfix	%f16,	%f16
	orn	%o4,	%g5,	%o1
	ldsb	[%l7 + 0x51],	%o3
	andncc	%l6,	%l1,	%g2
	andncc	%o7,	%o0,	%g3
	add	%l2,	0x1169,	%i3
	fnand	%f2,	%f24,	%f4
	move	%icc,	%i7,	%i2
	ldsh	[%l7 + 0x36],	%l4
	movpos	%xcc,	%o2,	%g7
	xor	%g1,	%g4,	%o6
	edge8l	%i1,	%i4,	%i0
	nop
	set	0x72, %g5
	stb	%i5,	[%l7 + %g5]
	fmul8ulx16	%f10,	%f6,	%f16
	sllx	%i6,	%l5,	%o5
	xor	%g6,	0x157C,	%l3
	fmovsvc	%xcc,	%f9,	%f30
	stw	%l0,	[%l7 + 0x38]
	fxor	%f6,	%f10,	%f2
	xnorcc	%g5,	%o4,	%o1
	movgu	%icc,	%o3,	%l6
	fones	%f22
	movle	%xcc,	%g2,	%o7
	alignaddrl	%o0,	%l1,	%g3
	sth	%l2,	[%l7 + 0x38]
	movrgz	%i3,	0x189,	%i7
	fsrc1	%f22,	%f6
	xorcc	%l4,	0x12B5,	%i2
	stx	%g7,	[%l7 + 0x18]
	fcmpeq32	%f12,	%f22,	%g1
	fmovrslez	%g4,	%f14,	%f14
	fcmped	%fcc1,	%f14,	%f24
	fmovsvs	%icc,	%f19,	%f28
	movne	%icc,	%o6,	%i1
	fcmpgt16	%f12,	%f20,	%i4
	st	%f9,	[%l7 + 0x40]
	fmovsgu	%xcc,	%f20,	%f29
	fmovdcc	%xcc,	%f4,	%f16
	siam	0x0
	edge32n	%o2,	%i5,	%i6
	movge	%xcc,	%l5,	%i0
	sdiv	%g6,	0x0B58,	%l3
	alignaddr	%l0,	%o5,	%g5
	udivcc	%o1,	0x0DF6,	%o4
	fand	%f10,	%f14,	%f4
	fsrc1	%f0,	%f26
	mulx	%o3,	%l6,	%g2
	ldx	[%l7 + 0x30],	%o0
	fornot1s	%f23,	%f5,	%f9
	sdivcc	%o7,	0x1699,	%g3
	udivcc	%l2,	0x1FF2,	%i3
	edge32ln	%l1,	%l4,	%i7
	fnands	%f22,	%f17,	%f24
	sll	%g7,	%g1,	%i2
	nop
	set	0x50, %l1
	std	%f20,	[%l7 + %l1]
	sllx	%o6,	%g4,	%i1
	save %o2, %i4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i6,	0x15CF,	%l5
	addcc	%i0,	%l3,	%g6
	movn	%icc,	%o5,	%l0
	fmovrdgez	%o1,	%f22,	%f6
	orncc	%o4,	%o3,	%g5
	movgu	%xcc,	%g2,	%l6
	movgu	%icc,	%o0,	%g3
	movleu	%xcc,	%o7,	%i3
	fors	%f19,	%f19,	%f22
	edge8ln	%l2,	%l1,	%i7
	edge16	%l4,	%g7,	%g1
	stx	%o6,	[%l7 + 0x30]
	ldsb	[%l7 + 0x21],	%i2
	ldub	[%l7 + 0x60],	%i1
	fpadd16s	%f4,	%f11,	%f30
	sdivx	%g4,	0x0BF8,	%o2
	sdiv	%i4,	0x1DB6,	%i5
	add	%i6,	%l5,	%l3
	andncc	%i0,	%o5,	%l0
	stb	%o1,	[%l7 + 0x29]
	edge32	%g6,	%o4,	%g5
	movleu	%xcc,	%g2,	%o3
	fcmpgt32	%f30,	%f18,	%o0
	movge	%xcc,	%l6,	%g3
	sir	0x0DA5
	movre	%i3,	0x094,	%l2
	sra	%l1,	%o7,	%i7
	fcmpne32	%f10,	%f14,	%l4
	movn	%xcc,	%g7,	%g1
	fands	%f12,	%f24,	%f29
	fmuld8ulx16	%f30,	%f10,	%f30
	std	%f10,	[%l7 + 0x50]
	movle	%xcc,	%i2,	%i1
	fcmpeq32	%f18,	%f14,	%o6
	addc	%o2,	0x0A44,	%i4
	sir	0x0A35
	orcc	%g4,	%i5,	%l5
	fmovdle	%icc,	%f9,	%f30
	xorcc	%l3,	%i0,	%o5
	ldsb	[%l7 + 0x38],	%i6
	sdiv	%o1,	0x1C2A,	%l0
	orn	%g6,	%g5,	%o4
	umulcc	%o3,	%o0,	%g2
	movneg	%xcc,	%g3,	%l6
	andn	%l2,	0x0100,	%i3
	movge	%icc,	%o7,	%l1
	fexpand	%f20,	%f26
	lduh	[%l7 + 0x42],	%i7
	smul	%g7,	0x18EF,	%l4
	ldd	[%l7 + 0x28],	%g0
	sll	%i2,	%o6,	%i1
	sth	%o2,	[%l7 + 0x42]
	orn	%i4,	%i5,	%g4
	array32	%l3,	%i0,	%o5
	addc	%i6,	0x1540,	%o1
	ldx	[%l7 + 0x10],	%l0
	movrgez	%l5,	0x1FF,	%g6
	fmovdle	%xcc,	%f2,	%f29
	edge8l	%o4,	%g5,	%o0
	for	%f10,	%f14,	%f24
	st	%f14,	[%l7 + 0x30]
	fmovscc	%xcc,	%f18,	%f16
	nop
	set	0x26, %o4
	stb	%o3,	[%l7 + %o4]
	sth	%g3,	[%l7 + 0x44]
	ldd	[%l7 + 0x50],	%f2
	fmul8x16al	%f14,	%f22,	%f24
	fnegd	%f6,	%f22
	ldx	[%l7 + 0x40],	%g2
	movrgez	%l2,	%i3,	%l6
	smulcc	%o7,	%i7,	%g7
	lduw	[%l7 + 0x30],	%l1
	ldx	[%l7 + 0x30],	%l4
	ldub	[%l7 + 0x4D],	%g1
	movrlz	%i2,	0x2AF,	%o6
	udiv	%i1,	0x158A,	%i4
	umul	%i5,	0x0B99,	%o2
	st	%f30,	[%l7 + 0x6C]
	movne	%icc,	%l3,	%i0
	edge8n	%o5,	%i6,	%o1
	mova	%xcc,	%g4,	%l5
	ldx	[%l7 + 0x08],	%l0
	fabss	%f13,	%f14
	fxnors	%f15,	%f29,	%f3
	movle	%icc,	%o4,	%g6
	movrgez	%g5,	%o0,	%o3
	movrne	%g3,	0x31E,	%l2
	fornot2s	%f29,	%f22,	%f6
	addc	%i3,	%g2,	%l6
	umul	%o7,	0x030E,	%i7
	udivx	%l1,	0x1C5D,	%g7
	umulcc	%l4,	%g1,	%o6
	udiv	%i2,	0x18BC,	%i4
	popc	0x1302,	%i1
	fmovrsgez	%i5,	%f6,	%f31
	fmovrsgez	%o2,	%f18,	%f2
	std	%f8,	[%l7 + 0x78]
	movge	%xcc,	%i0,	%o5
	udivx	%l3,	0x1B13,	%o1
	edge16l	%i6,	%l5,	%g4
	st	%f15,	[%l7 + 0x10]
	movle	%xcc,	%l0,	%g6
	movrlez	%o4,	%g5,	%o3
	fornot1	%f18,	%f10,	%f16
	addc	%g3,	0x1593,	%o0
	sll	%i3,	0x1C,	%g2
	xnorcc	%l2,	%o7,	%l6
	fmovrse	%i7,	%f23,	%f23
	fxor	%f16,	%f24,	%f24
	fmovsge	%xcc,	%f11,	%f4
	movgu	%icc,	%l1,	%g7
	edge32n	%g1,	%l4,	%o6
	add	%i2,	%i4,	%i1
	fpack32	%f28,	%f8,	%f30
	mulx	%o2,	0x004C,	%i5
	fpack16	%f0,	%f17
	fmovrdgez	%i0,	%f24,	%f26
	movpos	%xcc,	%o5,	%l3
	fmuld8ulx16	%f11,	%f2,	%f4
	array32	%i6,	%l5,	%g4
	or	%o1,	0x16E9,	%g6
	array32	%o4,	%l0,	%o3
	movcc	%xcc,	%g3,	%g5
	andcc	%i3,	0x0425,	%g2
	sll	%o0,	%o7,	%l2
	fmuld8ulx16	%f10,	%f0,	%f16
	fandnot2	%f14,	%f12,	%f24
	add	%i7,	0x00BF,	%l1
	sub	%g7,	0x0B51,	%l6
	ldx	[%l7 + 0x78],	%l4
	fandnot1s	%f16,	%f15,	%f28
	movrlez	%o6,	0x219,	%i2
	fandnot2s	%f20,	%f8,	%f3
	umulcc	%i4,	%g1,	%o2
	fmovsn	%xcc,	%f5,	%f24
	srl	%i5,	0x1C,	%i1
	fzero	%f22
	array16	%i0,	%o5,	%l3
	mulx	%l5,	0x0C73,	%i6
	edge32n	%g4,	%o1,	%g6
	xorcc	%l0,	%o3,	%o4
	subccc	%g3,	%g5,	%g2
	fcmpeq16	%f4,	%f28,	%o0
	edge32ln	%i3,	%o7,	%l2
	movrlez	%i7,	0x243,	%g7
	movg	%xcc,	%l6,	%l4
	fnands	%f7,	%f22,	%f18
	st	%f14,	[%l7 + 0x74]
	ldx	[%l7 + 0x40],	%l1
	movrgz	%i2,	0x302,	%o6
	movrlz	%i4,	0x3EB,	%o2
	fmovrsne	%g1,	%f7,	%f1
	edge16ln	%i5,	%i0,	%i1
	movcc	%xcc,	%o5,	%l5
	array32	%i6,	%g4,	%l3
	fmul8x16	%f16,	%f2,	%f18
	fpadd32	%f4,	%f16,	%f16
	addccc	%o1,	%l0,	%g6
	array8	%o3,	%g3,	%o4
	add	%g2,	0x0CA7,	%o0
	movrlz	%g5,	%i3,	%l2
	edge16	%i7,	%o7,	%l6
	edge8n	%l4,	%g7,	%l1
	fsrc1	%f2,	%f20
	umul	%o6,	0x1FCC,	%i2
	fcmps	%fcc3,	%f17,	%f17
	fnands	%f30,	%f13,	%f23
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%o2
	addcc	%i4,	%i5,	%i0
	alignaddrl	%g1,	%o5,	%i1
	move	%icc,	%l5,	%i6
	fmovrdne	%g4,	%f20,	%f10
	movpos	%icc,	%l3,	%o1
	movre	%l0,	0x232,	%g6
	sdivcc	%o3,	0x163B,	%o4
	edge32n	%g2,	%g3,	%g5
	fmovdcc	%icc,	%f11,	%f13
	movvs	%xcc,	%i3,	%o0
	subcc	%i7,	%l2,	%o7
	edge16l	%l6,	%l4,	%g7
	umulcc	%l1,	%i2,	%o2
	smulcc	%i4,	%o6,	%i0
	addc	%g1,	0x0CE3,	%i5
	edge32	%o5,	%l5,	%i1
	ldd	[%l7 + 0x20],	%i6
	edge16	%l3,	%g4,	%o1
	ld	[%l7 + 0x78],	%f16
	add	%g6,	%o3,	%l0
	fpadd32	%f28,	%f4,	%f8
	sra	%o4,	%g2,	%g5
	smul	%g3,	0x0CEF,	%i3
	edge32	%i7,	%o0,	%l2
	or	%l6,	0x1474,	%l4
	xnor	%o7,	%l1,	%i2
	edge8ln	%o2,	%i4,	%o6
	lduw	[%l7 + 0x20],	%i0
	edge16n	%g1,	%i5,	%o5
	xorcc	%l5,	%g7,	%i6
	fnot2s	%f7,	%f15
	movg	%icc,	%l3,	%g4
	srlx	%i1,	0x07,	%o1
	movvs	%icc,	%g6,	%l0
	smul	%o4,	0x1A63,	%o3
	edge32l	%g5,	%g2,	%g3
	std	%f30,	[%l7 + 0x30]
	movvs	%icc,	%i3,	%i7
	ldub	[%l7 + 0x09],	%o0
	alignaddr	%l6,	%l2,	%o7
	srax	%l4,	%i2,	%o2
	fcmpeq16	%f30,	%f20,	%l1
	fmovdg	%icc,	%f9,	%f21
	fmovse	%xcc,	%f29,	%f13
	xor	%i4,	%o6,	%g1
	fnot2	%f20,	%f12
	stb	%i0,	[%l7 + 0x0B]
	popc	0x008B,	%o5
	srax	%i5,	%l5,	%g7
	array16	%i6,	%g4,	%i1
	pdist	%f0,	%f4,	%f26
	lduw	[%l7 + 0x28],	%o1
	movrgz	%l3,	%l0,	%o4
	move	%icc,	%g6,	%g5
	stw	%g2,	[%l7 + 0x38]
	movvs	%icc,	%g3,	%i3
	movvc	%icc,	%i7,	%o3
	xnor	%l6,	0x05CE,	%l2
	movn	%icc,	%o0,	%o7
	fmovscc	%icc,	%f31,	%f13
	fpack16	%f0,	%f20
	udivx	%i2,	0x055A,	%o2
	lduw	[%l7 + 0x10],	%l1
	fxnors	%f26,	%f11,	%f21
	sdivcc	%l4,	0x1A8B,	%i4
	movg	%xcc,	%o6,	%i0
	xorcc	%g1,	%o5,	%i5
	st	%f27,	[%l7 + 0x18]
	xor	%l5,	0x03E5,	%i6
	ld	[%l7 + 0x0C],	%f22
	andcc	%g7,	0x0EF6,	%g4
	fcmple16	%f8,	%f6,	%o1
	fmovdneg	%icc,	%f7,	%f13
	fcmpeq16	%f24,	%f0,	%l3
	array8	%i1,	%o4,	%g6
	sth	%l0,	[%l7 + 0x34]
	sdiv	%g5,	0x115D,	%g2
	xnorcc	%i3,	0x0F23,	%g3
	popc	0x0955,	%o3
	fmul8sux16	%f22,	%f10,	%f20
	fandnot1s	%f7,	%f31,	%f31
	addcc	%i7,	%l6,	%o0
	restore %l2, %o7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l1,	%o2,	%i4
	movcs	%icc,	%l4,	%i0
	fnot2s	%f12,	%f3
	edge8n	%g1,	%o6,	%i5
	subcc	%o5,	0x0D21,	%l5
	ldsh	[%l7 + 0x62],	%g7
	movrgez	%g4,	%i6,	%o1
	alignaddr	%i1,	%o4,	%g6
	fmovsleu	%icc,	%f2,	%f7
	ld	[%l7 + 0x6C],	%f16
	udiv	%l0,	0x0A1B,	%g5
	movle	%icc,	%l3,	%i3
	movle	%xcc,	%g3,	%o3
	st	%f16,	[%l7 + 0x30]
	lduw	[%l7 + 0x3C],	%i7
	edge8	%l6,	%o0,	%g2
	ldsb	[%l7 + 0x23],	%o7
	edge16ln	%l2,	%i2,	%l1
	save %o2, 0x06C9, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x0E]
	fmovdvs	%icc,	%f3,	%f30
	sra	%i0,	0x1C,	%o6
	edge32	%i5,	%o5,	%g1
	stx	%l5,	[%l7 + 0x08]
	movrlez	%g4,	0x07E,	%i6
	movle	%icc,	%o1,	%i1
	movrlez	%g7,	0x047,	%g6
	save %o4, %g5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l0,	0x041D,	%i3
	fmovdn	%icc,	%f3,	%f13
	movgu	%xcc,	%o3,	%i7
	addc	%g3,	%o0,	%g2
	movgu	%xcc,	%o7,	%l6
	andn	%i2,	%l2,	%o2
	srax	%l1,	0x14,	%i4
	save %i0, 0x13C5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%o5,	%g1
	movgu	%icc,	%i5,	%g4
	addc	%l5,	%i6,	%o1
	alignaddr	%i1,	%g6,	%g7
	fmovrdgz	%g5,	%f8,	%f18
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	fnot1	%f2,	%f10
	std	%f6,	[%l7 + 0x78]
	ldsb	[%l7 + 0x7E],	%o3
	mova	%icc,	%l0,	%i7
	movrgz	%g3,	0x10C,	%g2
	edge16l	%o7,	%l6,	%o0
	stw	%l2,	[%l7 + 0x2C]
	fpsub32s	%f0,	%f2,	%f1
	subc	%i2,	0x18CD,	%l1
	fone	%f8
	movcc	%icc,	%i4,	%o2
	stw	%l4,	[%l7 + 0x44]
	edge32ln	%o6,	%i0,	%g1
	sll	%i5,	0x04,	%o5
	mulx	%g4,	0x0DBA,	%i6
	umul	%o1,	0x11F6,	%l5
	fcmpgt16	%f26,	%f22,	%g6
	movcs	%xcc,	%i1,	%g5
	fmul8sux16	%f20,	%f26,	%f10
	ld	[%l7 + 0x74],	%f8
	ldsw	[%l7 + 0x60],	%o4
	movrgz	%g7,	0x20A,	%i3
	save %o3, %l0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f25
	sllx	%l3,	0x0A,	%g2
	ld	[%l7 + 0x5C],	%f14
	movle	%xcc,	%o7,	%g3
	fmul8x16au	%f7,	%f0,	%f24
	movvs	%xcc,	%o0,	%l6
	fzero	%f0
	movrgz	%i2,	%l1,	%i4
	orn	%l2,	0x142E,	%l4
	andcc	%o2,	0x04AB,	%i0
	fpackfix	%f10,	%f22
	udiv	%g1,	0x1FFA,	%i5
	udivx	%o5,	0x0096,	%g4
	sdivcc	%o6,	0x00B2,	%i6
	subccc	%l5,	%o1,	%i1
	stb	%g5,	[%l7 + 0x4D]
	fcmpeq32	%f24,	%f20,	%g6
	ldub	[%l7 + 0x3F],	%g7
	movvc	%icc,	%i3,	%o4
	fmovdleu	%xcc,	%f30,	%f15
	fmovdneg	%xcc,	%f2,	%f20
	fnors	%f1,	%f15,	%f10
	fmovsne	%icc,	%f18,	%f29
	movne	%icc,	%o3,	%i7
	fmovse	%xcc,	%f30,	%f10
	fones	%f7
	edge8n	%l3,	%g2,	%o7
	alignaddr	%l0,	%g3,	%l6
	alignaddr	%o0,	%l1,	%i2
	fnor	%f16,	%f0,	%f20
	srlx	%l2,	%l4,	%i4
	and	%i0,	%g1,	%o2
	umul	%o5,	0x09E2,	%g4
	edge8n	%i5,	%i6,	%o6
	movvc	%icc,	%l5,	%i1
	fzero	%f18
	movle	%icc,	%o1,	%g5
	movl	%xcc,	%g7,	%i3
	alignaddr	%o4,	%o3,	%g6
	faligndata	%f26,	%f2,	%f18
	fsrc2	%f16,	%f6
	fmovsne	%xcc,	%f20,	%f14
	add	%l3,	%g2,	%i7
	fmovsvs	%xcc,	%f25,	%f24
	ld	[%l7 + 0x20],	%f6
	fzero	%f16
	movvs	%xcc,	%l0,	%g3
	fpack16	%f16,	%f11
	std	%f28,	[%l7 + 0x70]
	movrlez	%o7,	0x1B1,	%o0
	ldub	[%l7 + 0x49],	%l1
	edge16n	%i2,	%l6,	%l2
	fmovrdgez	%l4,	%f26,	%f8
	ldd	[%l7 + 0x38],	%f20
	andncc	%i0,	%i4,	%g1
	fmovrsne	%o5,	%f28,	%f13
	faligndata	%f2,	%f6,	%f22
	xnorcc	%g4,	%i5,	%o2
	ldx	[%l7 + 0x78],	%o6
	udiv	%l5,	0x081E,	%i6
	movrgez	%o1,	%i1,	%g7
	srax	%i3,	%g5,	%o3
	fxnor	%f18,	%f2,	%f30
	orcc	%o4,	0x073D,	%l3
	restore %g6, %g2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l0,	%o7,	%g3
	fabsd	%f18,	%f24
	fsrc1s	%f17,	%f15
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	movre	%l6,	%l2,	%l4
	fmovrdgz	%i4,	%f24,	%f14
	subcc	%i0,	%g1,	%o5
	alignaddrl	%i5,	%g4,	%o2
	sdivcc	%o6,	0x1B6D,	%l5
	st	%f13,	[%l7 + 0x18]
	fmovsge	%icc,	%f2,	%f7
	array32	%o1,	%i6,	%g7
	fmovrsne	%i3,	%f3,	%f0
	edge8n	%g5,	%o3,	%o4
	subccc	%i1,	%l3,	%g6
	fmovdleu	%icc,	%f17,	%f3
	edge32l	%i7,	%g2,	%l0
	sdivx	%o7,	0x0935,	%g3
	fmul8x16al	%f19,	%f18,	%f4
	edge32	%l1,	%o0,	%i2
	fnot1s	%f21,	%f2
	ldsb	[%l7 + 0x53],	%l6
	udivcc	%l4,	0x12CE,	%l2
	fone	%f14
	ldd	[%l7 + 0x70],	%f8
	ldsb	[%l7 + 0x5C],	%i0
	restore %g1, 0x08C3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x78],	%f18
	ldsb	[%l7 + 0x3A],	%o5
	edge32	%g4,	%i5,	%o6
	sllx	%l5,	0x03,	%o1
	sdiv	%i6,	0x0CDC,	%g7
	sllx	%o2,	%i3,	%g5
	xnorcc	%o4,	0x1890,	%i1
	fmovrdgz	%l3,	%f18,	%f16
	ldd	[%l7 + 0x10],	%g6
	edge8n	%i7,	%g2,	%o3
	fpsub16	%f4,	%f26,	%f26
	udivcc	%l0,	0x03C6,	%g3
	umulcc	%l1,	0x1B98,	%o0
	mulscc	%o7,	0x0A1C,	%l6
	sub	%l4,	%l2,	%i2
	movvc	%icc,	%g1,	%i0
	fcmpgt16	%f10,	%f0,	%i4
	fexpand	%f22,	%f28
	xnor	%g4,	%o5,	%o6
	fmovscs	%icc,	%f17,	%f8
	movre	%i5,	0x334,	%l5
	ldsb	[%l7 + 0x79],	%i6
	movre	%o1,	%g7,	%o2
	fpadd16s	%f2,	%f3,	%f4
	edge16l	%i3,	%g5,	%o4
	sdivx	%l3,	0x13D5,	%i1
	movrgz	%g6,	%i7,	%g2
	fands	%f19,	%f17,	%f4
	and	%l0,	%g3,	%o3
	smul	%o0,	0x05D7,	%l1
	sra	%l6,	%o7,	%l4
	sll	%i2,	0x15,	%g1
	srl	%l2,	0x01,	%i0
	mulx	%g4,	%o5,	%i4
	fpsub16s	%f16,	%f1,	%f14
	edge16ln	%o6,	%l5,	%i6
	movne	%xcc,	%o1,	%g7
	edge8	%o2,	%i3,	%i5
	popc	%g5,	%o4
	add	%i1,	%g6,	%l3
	fmovda	%icc,	%f23,	%f21
	movpos	%icc,	%g2,	%l0
	mulx	%i7,	%o3,	%g3
	sth	%o0,	[%l7 + 0x52]
	udiv	%l1,	0x15E7,	%o7
	movcs	%icc,	%l6,	%l4
	fmovdn	%xcc,	%f2,	%f17
	edge32n	%i2,	%g1,	%i0
	subc	%l2,	%o5,	%i4
	movleu	%icc,	%g4,	%l5
	fnors	%f21,	%f8,	%f8
	st	%f21,	[%l7 + 0x1C]
	nop
	set	0x20, %i4
	stx	%i6,	[%l7 + %i4]
	ld	[%l7 + 0x4C],	%f14
	ldx	[%l7 + 0x08],	%o6
	movvc	%xcc,	%g7,	%o1
	movle	%icc,	%i3,	%o2
	sdivx	%i5,	0x0086,	%g5
	ldsw	[%l7 + 0x54],	%i1
	fmuld8sux16	%f25,	%f18,	%f10
	movg	%icc,	%g6,	%o4
	ldsb	[%l7 + 0x09],	%g2
	mova	%icc,	%l0,	%l3
	movcs	%icc,	%o3,	%i7
	smulcc	%o0,	%g3,	%o7
	movl	%xcc,	%l6,	%l4
	ldsb	[%l7 + 0x1F],	%l1
	addccc	%i2,	%g1,	%i0
	edge16l	%o5,	%l2,	%g4
	fcmps	%fcc1,	%f14,	%f8
	andn	%i4,	%i6,	%l5
	ldub	[%l7 + 0x29],	%g7
	fmovdpos	%icc,	%f20,	%f6
	edge16n	%o1,	%i3,	%o2
	alignaddrl	%i5,	%g5,	%i1
	fmovrsgz	%g6,	%f12,	%f31
	movleu	%icc,	%o6,	%o4
	stb	%g2,	[%l7 + 0x1E]
	edge32ln	%l0,	%o3,	%l3
	movvs	%xcc,	%o0,	%i7
	edge8	%g3,	%l6,	%l4
	alignaddrl	%o7,	%l1,	%g1
	movcc	%icc,	%i0,	%i2
	for	%f14,	%f30,	%f2
	array8	%l2,	%o5,	%g4
	sir	0x1960
	popc	%i6,	%i4
	save %l5, %o1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o2,	%i3,	%g5
	array8	%i1,	%g6,	%i5
	fones	%f31
	lduh	[%l7 + 0x7A],	%o6
	addcc	%o4,	%l0,	%o3
	fpadd32	%f20,	%f12,	%f28
	srl	%l3,	%g2,	%o0
	fmovsvc	%icc,	%f3,	%f0
	stw	%i7,	[%l7 + 0x34]
	movvs	%icc,	%g3,	%l4
	alignaddrl	%o7,	%l6,	%g1
	srl	%l1,	%i2,	%i0
	udivx	%l2,	0x0D4B,	%o5
	fsrc1	%f30,	%f12
	movn	%icc,	%g4,	%i4
	movg	%icc,	%l5,	%i6
	fxnors	%f6,	%f5,	%f24
	alignaddrl	%g7,	%o2,	%o1
	udivcc	%i3,	0x00DE,	%g5
	edge16	%i1,	%i5,	%g6
	or	%o6,	%l0,	%o3
	movle	%xcc,	%o4,	%g2
	subc	%l3,	%i7,	%o0
	fsrc1	%f26,	%f8
	fmovd	%f0,	%f14
	movcs	%xcc,	%l4,	%g3
	edge8ln	%o7,	%g1,	%l1
	movleu	%icc,	%i2,	%l6
	edge8n	%i0,	%l2,	%g4
	fandnot1s	%f18,	%f1,	%f29
	movge	%xcc,	%o5,	%i4
	sra	%i6,	%g7,	%l5
	edge32ln	%o1,	%o2,	%g5
	srlx	%i1,	%i5,	%g6
	edge8ln	%i3,	%o6,	%l0
	xorcc	%o3,	0x1147,	%g2
	movleu	%xcc,	%o4,	%l3
	movrlz	%o0,	%i7,	%g3
	umul	%l4,	0x1776,	%o7
	movneg	%icc,	%l1,	%i2
	fxor	%f14,	%f14,	%f6
	xnorcc	%l6,	0x092C,	%g1
	orncc	%i0,	%l2,	%g4
	addccc	%i4,	0x00B3,	%o5
	movl	%icc,	%g7,	%l5
	fmovrdgez	%i6,	%f10,	%f2
	srl	%o2,	0x11,	%g5
	fmovspos	%icc,	%f24,	%f1
	sdivcc	%i1,	0x139D,	%i5
	subc	%o1,	0x1460,	%i3
	sir	0x0A59
	andn	%g6,	0x09D6,	%l0
	or	%o6,	%o3,	%o4
	sdivx	%l3,	0x00A0,	%g2
	fcmpne16	%f10,	%f6,	%o0
	add	%g3,	%l4,	%i7
	sethi	0x0606,	%o7
	sra	%l1,	0x14,	%l6
	alignaddr	%i2,	%i0,	%g1
	xnorcc	%g4,	0x06F1,	%i4
	stx	%l2,	[%l7 + 0x38]
	sra	%g7,	0x0D,	%o5
	siam	0x0
	movneg	%xcc,	%l5,	%i6
	udiv	%o2,	0x067A,	%i1
	ld	[%l7 + 0x54],	%f24
	sir	0x00E8
	stb	%g5,	[%l7 + 0x54]
	fabss	%f11,	%f5
	edge8l	%i5,	%i3,	%g6
	subc	%o1,	0x1DE7,	%l0
	umulcc	%o6,	0x134A,	%o3
	movrlez	%o4,	0x364,	%l3
	ldsb	[%l7 + 0x58],	%o0
	addc	%g3,	0x1871,	%l4
	edge8l	%i7,	%g2,	%o7
	movgu	%xcc,	%l6,	%l1
	movcc	%icc,	%i0,	%i2
	ldx	[%l7 + 0x58],	%g4
	fmovrde	%g1,	%f4,	%f14
	fnands	%f4,	%f21,	%f17
	movre	%l2,	%g7,	%i4
	fcmpne16	%f20,	%f18,	%l5
	fnot1	%f16,	%f0
	ldsw	[%l7 + 0x50],	%i6
	movge	%xcc,	%o5,	%o2
	edge8n	%i1,	%i5,	%i3
	orcc	%g6,	%g5,	%l0
	nop
	set	0x2A, %i1
	ldub	[%l7 + %i1],	%o1
	movgu	%icc,	%o6,	%o3
	fmovda	%icc,	%f17,	%f11
	stw	%o4,	[%l7 + 0x5C]
	array16	%o0,	%g3,	%l4
	ldsw	[%l7 + 0x50],	%l3
	fmovrdgz	%i7,	%f12,	%f18
	movre	%o7,	%g2,	%l1
	andncc	%i0,	%i2,	%g4
	srlx	%l6,	%l2,	%g7
	edge16l	%g1,	%l5,	%i4
	fmovrsne	%o5,	%f23,	%f15
	andn	%i6,	%i1,	%o2
	and	%i5,	%g6,	%g5
	srax	%i3,	%o1,	%o6
	ldsw	[%l7 + 0x30],	%o3
	array8	%l0,	%o4,	%o0
	fmovrdlez	%g3,	%f28,	%f6
	nop
	set	0x56, %o3
	ldsh	[%l7 + %o3],	%l3
	pdist	%f20,	%f14,	%f22
	lduw	[%l7 + 0x2C],	%l4
	movrlz	%o7,	0x3DD,	%g2
	umul	%i7,	%l1,	%i2
	movn	%icc,	%g4,	%l6
	fnegs	%f19,	%f2
	umulcc	%i0,	0x0C07,	%l2
	movre	%g7,	0x1D0,	%g1
	orcc	%i4,	0x06B3,	%l5
	subccc	%i6,	0x161F,	%o5
	fcmpne16	%f10,	%f18,	%o2
	edge8l	%i5,	%g6,	%i1
	xnor	%i3,	0x0F8C,	%g5
	xnor	%o6,	0x0727,	%o3
	xorcc	%o1,	%o4,	%l0
	movrne	%o0,	0x368,	%g3
	srlx	%l4,	%l3,	%o7
	movvc	%xcc,	%g2,	%i7
	fandnot1s	%f29,	%f17,	%f14
	xorcc	%l1,	0x04E1,	%g4
	siam	0x7
	fmul8x16al	%f6,	%f18,	%f10
	fcmpne32	%f6,	%f22,	%l6
	umulcc	%i2,	%l2,	%g7
	movneg	%xcc,	%i0,	%i4
	sir	0x1B9A
	sethi	0x00EE,	%l5
	smulcc	%i6,	%o5,	%o2
	udivcc	%g1,	0x0199,	%g6
	smulcc	%i5,	%i1,	%i3
	st	%f7,	[%l7 + 0x34]
	ldsw	[%l7 + 0x10],	%o6
	movg	%icc,	%g5,	%o3
	xnorcc	%o1,	0x15FA,	%l0
	udiv	%o0,	0x06A3,	%g3
	umulcc	%l4,	%o4,	%l3
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	popc	0x1FA9,	%o7
	fmovsl	%xcc,	%f28,	%f28
	subc	%l6,	0x08E5,	%g4
	movrgz	%i2,	%l2,	%g7
	subcc	%i4,	%i0,	%l5
	movrlz	%o5,	%o2,	%g1
	fmovdle	%icc,	%f24,	%f11
	orn	%i6,	%i5,	%i1
	movgu	%xcc,	%i3,	%o6
	ld	[%l7 + 0x48],	%f17
	movneg	%icc,	%g6,	%o3
	movleu	%icc,	%g5,	%o1
	movl	%icc,	%o0,	%g3
	addc	%l4,	0x1022,	%l0
	fmovdge	%xcc,	%f1,	%f12
	subcc	%o4,	%l3,	%i7
	xnorcc	%l1,	%g2,	%o7
	fmovrslz	%g4,	%f26,	%f4
	movgu	%xcc,	%i2,	%l2
	std	%f18,	[%l7 + 0x38]
	movleu	%icc,	%l6,	%g7
	edge32	%i0,	%i4,	%l5
	stw	%o2,	[%l7 + 0x08]
	movn	%xcc,	%o5,	%i6
	ldsb	[%l7 + 0x41],	%g1
	fsrc2	%f26,	%f20
	srl	%i1,	%i3,	%i5
	array8	%o6,	%o3,	%g5
	fabsd	%f24,	%f14
	srax	%o1,	%o0,	%g6
	edge32l	%g3,	%l0,	%l4
	sth	%l3,	[%l7 + 0x54]
	umulcc	%i7,	%o4,	%g2
	sdivcc	%o7,	0x1457,	%l1
	movcc	%icc,	%g4,	%l2
	movleu	%icc,	%l6,	%g7
	ldsb	[%l7 + 0x66],	%i0
	movrlz	%i2,	%i4,	%l5
	stw	%o5,	[%l7 + 0x58]
	fmovsvc	%icc,	%f9,	%f9
	edge16	%i6,	%o2,	%i1
	fpsub16	%f14,	%f24,	%f30
	popc	0x1845,	%g1
	sdivx	%i3,	0x092F,	%o6
	ldx	[%l7 + 0x60],	%o3
	fpsub16	%f8,	%f22,	%f30
	ldd	[%l7 + 0x30],	%i4
	smul	%o1,	%g5,	%o0
	srl	%g6,	%l0,	%l4
	fcmpes	%fcc1,	%f7,	%f16
	sra	%l3,	0x02,	%i7
	andcc	%g3,	%g2,	%o4
	fmovdneg	%icc,	%f29,	%f27
	popc	%l1,	%o7
	addcc	%l2,	0x098D,	%l6
	udivcc	%g4,	0x0DDD,	%g7
	ldsw	[%l7 + 0x68],	%i2
	movrlz	%i4,	%i0,	%o5
	xnorcc	%i6,	0x0F13,	%o2
	fsrc2	%f22,	%f22
	ldd	[%l7 + 0x18],	%i0
	movpos	%xcc,	%g1,	%l5
	fnegs	%f27,	%f14
	udivx	%i3,	0x072B,	%o3
	subccc	%i5,	0x1AD8,	%o6
	fmovsg	%icc,	%f26,	%f12
	xorcc	%o1,	%g5,	%o0
	ldub	[%l7 + 0x60],	%g6
	movge	%icc,	%l4,	%l3
	lduh	[%l7 + 0x38],	%l0
	andcc	%g3,	0x132C,	%g2
	fcmps	%fcc2,	%f23,	%f24
	edge16ln	%o4,	%i7,	%l1
	ldx	[%l7 + 0x38],	%l2
	movvc	%xcc,	%o7,	%g4
	edge8l	%g7,	%i2,	%l6
	fmovsgu	%icc,	%f25,	%f10
	andcc	%i0,	0x118F,	%i4
	addccc	%i6,	%o5,	%o2
	stw	%g1,	[%l7 + 0x18]
	movge	%icc,	%l5,	%i3
	alignaddrl	%i1,	%o3,	%i5
	fornot1	%f2,	%f30,	%f16
	movrlez	%o1,	%g5,	%o0
	edge32l	%g6,	%o6,	%l3
	lduw	[%l7 + 0x4C],	%l4
	st	%f21,	[%l7 + 0x60]
	array8	%g3,	%l0,	%o4
	xorcc	%i7,	%l1,	%g2
	fmovrdlez	%l2,	%f22,	%f8
	siam	0x5
	fone	%f2
	mulx	%o7,	0x0DD4,	%g7
	nop
	set	0x7F, %i7
	ldub	[%l7 + %i7],	%i2
	fxnors	%f6,	%f5,	%f19
	addcc	%l6,	0x11AA,	%g4
	movvc	%xcc,	%i0,	%i4
	srlx	%i6,	0x1C,	%o5
	movcc	%xcc,	%g1,	%l5
	smul	%i3,	%i1,	%o3
	srax	%o2,	%o1,	%g5
	movpos	%xcc,	%i5,	%o0
	edge16n	%o6,	%g6,	%l3
	movneg	%xcc,	%g3,	%l0
	edge32ln	%o4,	%l4,	%l1
	edge32n	%i7,	%l2,	%g2
	movcc	%xcc,	%o7,	%g7
	movrlz	%l6,	0x1C9,	%g4
	edge8	%i2,	%i0,	%i4
	fpsub32	%f8,	%f24,	%f16
	fzero	%f18
	edge32l	%o5,	%i6,	%l5
	sdivx	%i3,	0x00A0,	%i1
	fmovsge	%icc,	%f21,	%f3
	fnot2s	%f6,	%f20
	array8	%o3,	%o2,	%g1
	fcmpgt32	%f20,	%f22,	%g5
	array32	%i5,	%o1,	%o0
	subcc	%g6,	%l3,	%o6
	fmovsgu	%xcc,	%f18,	%f18
	fornot1s	%f13,	%f22,	%f15
	srlx	%l0,	%o4,	%g3
	fmovdcs	%xcc,	%f28,	%f8
	restore %l4, 0x054C, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l1,	%l2,	%g2
	subccc	%g7,	%l6,	%g4
	fnot2	%f26,	%f18
	xnorcc	%o7,	0x0115,	%i2
	fmul8sux16	%f26,	%f8,	%f26
	or	%i4,	0x05C0,	%i0
	udivcc	%i6,	0x1B05,	%l5
	add	%o5,	%i1,	%i3
	sdivcc	%o2,	0x0521,	%o3
	edge8ln	%g5,	%i5,	%o1
	ldsw	[%l7 + 0x28],	%o0
	orcc	%g1,	%l3,	%g6
	subc	%l0,	%o4,	%o6
	movrne	%g3,	0x158,	%i7
	orcc	%l4,	%l1,	%g2
	array32	%g7,	%l2,	%l6
	fpadd16s	%f31,	%f21,	%f9
	movneg	%icc,	%o7,	%i2
	add	%g4,	%i0,	%i6
	std	%f0,	[%l7 + 0x70]
	movrne	%i4,	0x284,	%l5
	udiv	%o5,	0x12FC,	%i3
	movle	%xcc,	%i1,	%o2
	srax	%g5,	0x1C,	%o3
	stx	%i5,	[%l7 + 0x30]
	edge16l	%o1,	%o0,	%g1
	umul	%g6,	%l0,	%l3
	fmovsa	%xcc,	%f28,	%f19
	fnand	%f22,	%f6,	%f26
	ldub	[%l7 + 0x0F],	%o4
	alignaddrl	%o6,	%g3,	%i7
	ld	[%l7 + 0x34],	%f23
	movrlz	%l1,	%l4,	%g7
	srlx	%l2,	%l6,	%g2
	fmovrde	%o7,	%f26,	%f12
	fmovrdgz	%i2,	%f18,	%f20
	sub	%g4,	%i6,	%i4
	fnor	%f24,	%f6,	%f28
	save %i0, 0x0380, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i3,	%l5,	%o2
	array8	%i1,	%g5,	%o3
	movrne	%i5,	0x18C,	%o0
	bshuffle	%f22,	%f6,	%f18
	or	%o1,	0x03F1,	%g6
	fcmple32	%f24,	%f14,	%l0
	edge8n	%g1,	%l3,	%o4
	fnot1	%f12,	%f12
	fmovsge	%xcc,	%f11,	%f4
	andn	%g3,	%o6,	%l1
	fmovrslez	%l4,	%f4,	%f22
	andcc	%g7,	%i7,	%l6
	fmovsa	%xcc,	%f24,	%f1
	mova	%icc,	%l2,	%g2
	addcc	%i2,	%g4,	%i6
	fabsd	%f6,	%f28
	movne	%xcc,	%o7,	%i4
	subcc	%i0,	%o5,	%l5
	stx	%o2,	[%l7 + 0x10]
	nop
	set	0x70, %g2
	ldx	[%l7 + %g2],	%i1
	ldub	[%l7 + 0x0E],	%g5
	fmovsgu	%icc,	%f3,	%f1
	ldx	[%l7 + 0x40],	%i3
	edge32	%o3,	%i5,	%o1
	fmovsa	%icc,	%f29,	%f1
	subc	%o0,	%g6,	%g1
	mova	%icc,	%l3,	%l0
	movgu	%icc,	%o4,	%g3
	save %l1, %o6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g7,	0x1B2D,	%l6
	fmovdcs	%icc,	%f13,	%f27
	srax	%l2,	%i7,	%g2
	umul	%i2,	%g4,	%i6
	movrlz	%o7,	0x2DA,	%i4
	addccc	%i0,	0x0180,	%l5
	fmovscc	%xcc,	%f4,	%f3
	lduw	[%l7 + 0x20],	%o5
	array8	%i1,	%o2,	%i3
	srl	%g5,	%o3,	%i5
	fmovse	%xcc,	%f10,	%f28
	subccc	%o0,	%o1,	%g6
	fpadd16	%f4,	%f26,	%f28
	subc	%l3,	0x185F,	%l0
	fmovdne	%xcc,	%f9,	%f19
	sllx	%g1,	0x11,	%g3
	movpos	%icc,	%l1,	%o4
	udiv	%o6,	0x00CD,	%g7
	sub	%l6,	0x0B5A,	%l4
	movneg	%icc,	%i7,	%l2
	sll	%g2,	%i2,	%i6
	movvs	%xcc,	%g4,	%i4
	array8	%o7,	%l5,	%i0
	subcc	%o5,	0x0970,	%o2
	andncc	%i3,	%g5,	%i1
	orn	%o3,	0x1C13,	%i5
	edge16ln	%o0,	%o1,	%g6
	fmovrsgez	%l3,	%f18,	%f20
	movg	%xcc,	%l0,	%g1
	xnor	%l1,	0x012F,	%g3
	udivcc	%o6,	0x18C1,	%g7
	movvc	%xcc,	%o4,	%l4
	subcc	%l6,	%l2,	%i7
	fzeros	%f24
	sir	0x1A98
	fornot2	%f22,	%f8,	%f30
	movneg	%icc,	%i2,	%i6
	alignaddrl	%g4,	%i4,	%g2
	movle	%icc,	%l5,	%o7
	fandnot1	%f10,	%f20,	%f16
	fnand	%f8,	%f10,	%f26
	umulcc	%o5,	0x097D,	%o2
	srl	%i3,	%i0,	%i1
	fmovdg	%xcc,	%f28,	%f16
	sdivx	%o3,	0x0F82,	%i5
	ldd	[%l7 + 0x18],	%f20
	save %g5, %o0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l3,	0x0D9F,	%o1
	edge16ln	%g1,	%l0,	%l1
	edge32l	%g3,	%g7,	%o4
	fcmpne32	%f26,	%f18,	%o6
	sub	%l6,	%l2,	%i7
	fcmple32	%f6,	%f6,	%l4
	orncc	%i6,	0x1E2A,	%g4
	edge16	%i2,	%i4,	%l5
	srlx	%o7,	0x1C,	%g2
	edge8	%o5,	%i3,	%o2
	smul	%i1,	0x0494,	%i0
	udivcc	%i5,	0x10B6,	%o3
	fzero	%f8
	fmovdleu	%xcc,	%f0,	%f23
	smul	%g5,	0x0463,	%o0
	stb	%g6,	[%l7 + 0x5C]
	stw	%o1,	[%l7 + 0x44]
	umul	%l3,	%g1,	%l0
	fpadd16s	%f28,	%f8,	%f12
	std	%f20,	[%l7 + 0x60]
	udivx	%l1,	0x064F,	%g3
	stx	%o4,	[%l7 + 0x38]
	std	%f12,	[%l7 + 0x48]
	fxnors	%f22,	%f25,	%f10
	addccc	%o6,	%g7,	%l2
	fnands	%f24,	%f8,	%f9
	fcmpd	%fcc2,	%f30,	%f28
	lduw	[%l7 + 0x18],	%i7
	sra	%l4,	0x1F,	%l6
	xor	%g4,	0x199C,	%i2
	std	%f6,	[%l7 + 0x28]
	ldd	[%l7 + 0x70],	%i4
	fone	%f2
	sub	%l5,	%i6,	%o7
	srlx	%o5,	0x01,	%g2
	fmovrslez	%i3,	%f0,	%f25
	movvs	%icc,	%o2,	%i1
	sllx	%i5,	0x00,	%i0
	stb	%o3,	[%l7 + 0x15]
	edge32ln	%g5,	%g6,	%o0
	udivcc	%o1,	0x004C,	%g1
	movne	%xcc,	%l3,	%l0
	movre	%g3,	0x14F,	%o4
	smul	%l1,	%g7,	%o6
	sdivx	%l2,	0x15AC,	%i7
	movn	%icc,	%l4,	%l6
	fcmpes	%fcc1,	%f15,	%f19
	smulcc	%i2,	%g4,	%i4
	movleu	%icc,	%l5,	%o7
	movne	%xcc,	%i6,	%o5
	fcmpgt32	%f20,	%f24,	%i3
	sdivx	%o2,	0x0282,	%i1
	edge32	%i5,	%i0,	%g2
	movne	%icc,	%o3,	%g6
	umul	%g5,	0x02D0,	%o1
	xor	%g1,	0x0011,	%l3
	ldsw	[%l7 + 0x6C],	%o0
	srlx	%g3,	%l0,	%l1
	fmovscc	%icc,	%f11,	%f19
	umul	%g7,	%o4,	%o6
	fmovdcc	%icc,	%f14,	%f14
	movvc	%xcc,	%l2,	%i7
	udivcc	%l6,	0x1066,	%i2
	sethi	0x175F,	%l4
	movvc	%icc,	%g4,	%l5
	subc	%i4,	%o7,	%i6
	sir	0x0C20
	fnegd	%f4,	%f8
	movgu	%icc,	%o5,	%i3
	fmovdg	%xcc,	%f2,	%f7
	movneg	%xcc,	%i1,	%o2
	siam	0x6
	alignaddr	%i5,	%g2,	%i0
	umulcc	%o3,	%g5,	%o1
	movpos	%xcc,	%g6,	%l3
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	ldub	[%l7 + 0x32],	%l1
	fpsub32s	%f16,	%f3,	%f30
	fornot2s	%f19,	%f20,	%f11
	movpos	%icc,	%l0,	%g7
	xorcc	%o6,	%o4,	%l2
	ldd	[%l7 + 0x18],	%i6
	edge32	%l6,	%l4,	%g4
	sdiv	%l5,	0x19DE,	%i4
	restore %i2, 0x17D7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i6,	0x30A,	%o5
	movl	%icc,	%i1,	%o2
	orn	%i3,	0x1B43,	%i5
	srax	%i0,	%g2,	%o3
	edge16n	%o1,	%g5,	%g6
	mulscc	%o0,	%g3,	%g1
	edge32	%l3,	%l0,	%g7
	udiv	%o6,	0x0254,	%l1
	ldd	[%l7 + 0x78],	%f12
	sdivx	%l2,	0x15AD,	%i7
	move	%xcc,	%l6,	%o4
	subcc	%l4,	%l5,	%i4
	fmovdvs	%icc,	%f29,	%f15
	sdivcc	%g4,	0x02F9,	%i2
	movl	%icc,	%o7,	%o5
	edge16	%i6,	%o2,	%i3
	movne	%icc,	%i5,	%i0
	ldd	[%l7 + 0x10],	%i0
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%o2
	movleu	%icc,	%g2,	%o1
	sub	%g5,	0x0545,	%g6
	movgu	%xcc,	%g3,	%o0
	fpackfix	%f10,	%f22
	fnand	%f12,	%f8,	%f2
	fsrc1s	%f28,	%f20
	sdivx	%l3,	0x043E,	%g1
	for	%f16,	%f20,	%f4
	fmovd	%f8,	%f30
	subcc	%g7,	%l0,	%l1
	nop
	set	0x60, %g3
	std	%f8,	[%l7 + %g3]
	movrlz	%l2,	%i7,	%l6
	move	%icc,	%o4,	%l4
	alignaddrl	%o6,	%l5,	%g4
	sethi	0x05DF,	%i2
	fmul8ulx16	%f14,	%f16,	%f24
	fmovdle	%icc,	%f23,	%f2
	sll	%i4,	%o7,	%o5
	subcc	%i6,	%o2,	%i3
	ldsb	[%l7 + 0x7F],	%i0
	addcc	%i5,	%o3,	%g2
	smulcc	%o1,	%g5,	%i1
	fmovsge	%xcc,	%f29,	%f23
	edge8n	%g3,	%g6,	%l3
	smul	%g1,	%g7,	%l0
	sll	%l1,	0x17,	%o0
	ldsb	[%l7 + 0x7C],	%l2
	sir	0x0FC7
	ldx	[%l7 + 0x38],	%i7
	udivcc	%o4,	0x03A1,	%l6
	mova	%xcc,	%o6,	%l4
	addc	%l5,	0x1149,	%i2
	edge16	%i4,	%g4,	%o5
	srlx	%o7,	0x1B,	%i6
	sethi	0x0B36,	%i3
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	sdiv	%g2,	0x1A8C,	%i5
	stx	%o1,	[%l7 + 0x20]
	fcmpgt32	%f22,	%f0,	%g5
	movl	%xcc,	%i1,	%g6
	edge16l	%l3,	%g1,	%g7
	subc	%l0,	0x127B,	%l1
	orcc	%g3,	%o0,	%i7
	mulx	%o4,	%l2,	%l6
	edge32n	%l4,	%l5,	%i2
	movcc	%icc,	%i4,	%g4
	edge32	%o5,	%o7,	%o6
	sdiv	%i3,	0x1F31,	%i6
	movrne	%o2,	0x314,	%i0
	sdivcc	%g2,	0x051F,	%o3
	andncc	%o1,	%g5,	%i5
	movl	%xcc,	%i1,	%g6
	movneg	%icc,	%l3,	%g7
	movcs	%icc,	%g1,	%l0
	stw	%l1,	[%l7 + 0x7C]
	movle	%icc,	%o0,	%g3
	srl	%o4,	0x00,	%i7
	addccc	%l2,	%l4,	%l6
	fcmpne32	%f24,	%f6,	%l5
	fcmpd	%fcc1,	%f2,	%f22
	srl	%i4,	%i2,	%o5
	edge8n	%o7,	%o6,	%i3
	udivcc	%g4,	0x10F8,	%i6
	edge8n	%o2,	%i0,	%g2
	fmovsvs	%icc,	%f3,	%f31
	lduw	[%l7 + 0x6C],	%o3
	fpsub32s	%f10,	%f24,	%f5
	fnand	%f28,	%f2,	%f20
	alignaddrl	%o1,	%i5,	%i1
	sdiv	%g6,	0x0971,	%l3
	movrne	%g5,	0x2F1,	%g1
	smulcc	%g7,	%l1,	%o0
	addc	%l0,	0x1EB6,	%o4
	fcmpeq32	%f26,	%f22,	%i7
	fcmple32	%f0,	%f28,	%l2
	orn	%l4,	%l6,	%g3
	fcmpeq32	%f30,	%f8,	%l5
	sdivx	%i2,	0x191A,	%o5
	fmovscs	%icc,	%f11,	%f27
	array32	%i4,	%o6,	%o7
	movgu	%icc,	%g4,	%i6
	stb	%i3,	[%l7 + 0x34]
	restore %i0, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o1,	%o2,	%i1
	fandnot1s	%f0,	%f3,	%f27
	orcc	%g6,	0x1C00,	%i5
	movne	%icc,	%g5,	%l3
	sll	%g1,	0x12,	%g7
	orncc	%l1,	%l0,	%o4
	array8	%o0,	%l2,	%l4
	save %i7, 0x16AC, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f10,	%f4,	%l5
	alignaddr	%i2,	%l6,	%i4
	sra	%o6,	%o5,	%o7
	addc	%i6,	%g4,	%i3
	movg	%xcc,	%g2,	%o3
	mulx	%i0,	0x10A1,	%o2
	fmovdcs	%icc,	%f8,	%f8
	mulx	%o1,	0x0953,	%g6
	edge8ln	%i5,	%g5,	%i1
	stw	%g1,	[%l7 + 0x0C]
	edge8l	%l3,	%g7,	%l1
	fmovscc	%xcc,	%f19,	%f15
	fmovrdlez	%l0,	%f4,	%f20
	fcmpeq16	%f18,	%f20,	%o4
	orncc	%l2,	%l4,	%o0
	stw	%g3,	[%l7 + 0x78]
	andn	%i7,	%l5,	%i2
	umulcc	%i4,	0x1AD5,	%o6
	stb	%o5,	[%l7 + 0x36]
	sllx	%l6,	0x0A,	%i6
	edge8l	%o7,	%g4,	%g2
	srlx	%i3,	%i0,	%o3
	udivx	%o1,	0x144D,	%g6
	umulcc	%i5,	0x053E,	%o2
	edge8	%g5,	%g1,	%l3
	fmovrslez	%g7,	%f26,	%f6
	movre	%i1,	0x1C0,	%l1
	stb	%l0,	[%l7 + 0x2A]
	edge16	%l2,	%l4,	%o0
	fmovrsne	%o4,	%f27,	%f21
	ld	[%l7 + 0x44],	%f13
	stx	%g3,	[%l7 + 0x50]
	movn	%icc,	%l5,	%i2
	fmul8x16	%f17,	%f12,	%f20
	mova	%icc,	%i7,	%o6
	xnorcc	%i4,	%l6,	%o5
	sllx	%o7,	%g4,	%i6
	subccc	%i3,	0x1E28,	%g2
	subcc	%o3,	%o1,	%i0
	orncc	%g6,	0x0602,	%i5
	movgu	%icc,	%g5,	%o2
	sub	%l3,	%g1,	%i1
	alignaddr	%l1,	%g7,	%l2
	stx	%l4,	[%l7 + 0x58]
	orcc	%l0,	0x05F8,	%o4
	ldsw	[%l7 + 0x38],	%g3
	andncc	%o0,	%l5,	%i7
	fmovdn	%xcc,	%f26,	%f4
	ld	[%l7 + 0x60],	%f17
	umulcc	%o6,	%i2,	%l6
	fmovsneg	%xcc,	%f25,	%f8
	fmovrdne	%o5,	%f0,	%f6
	udivcc	%o7,	0x040A,	%i4
	sll	%i6,	%i3,	%g2
	orn	%g4,	%o3,	%o1
	edge8ln	%i0,	%i5,	%g6
	stx	%g5,	[%l7 + 0x38]
	mulscc	%l3,	%o2,	%i1
	fpadd32	%f30,	%f14,	%f26
	andn	%l1,	0x1267,	%g7
	edge32ln	%g1,	%l2,	%l4
	srax	%o4,	0x0F,	%g3
	movcs	%xcc,	%l0,	%l5
	movrlez	%i7,	0x0E8,	%o6
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%o0
	fmovspos	%xcc,	%f21,	%f27
	move	%icc,	%i2,	%o5
	edge16ln	%l6,	%o7,	%i6
	sra	%i3,	%g2,	%i4
	edge16ln	%g4,	%o3,	%o1
	array16	%i0,	%i5,	%g6
	movge	%icc,	%l3,	%g5
	movgu	%icc,	%o2,	%i1
	srlx	%l1,	0x16,	%g7
	umul	%g1,	%l2,	%o4
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	movleu	%icc,	%l0,	%l5
	for	%f14,	%f0,	%f28
	and	%o6,	%o0,	%i2
	sir	0x1A92
	addcc	%o5,	0x1C64,	%i7
	srl	%o7,	0x06,	%l6
	sdivcc	%i3,	0x024D,	%i6
	udivcc	%g2,	0x15AF,	%i4
	subccc	%o3,	0x0F6A,	%g4
	umulcc	%o1,	0x1B61,	%i5
	edge8n	%g6,	%i0,	%g5
	movl	%icc,	%l3,	%i1
	andn	%l1,	%o2,	%g1
	movrgez	%l2,	%o4,	%g7
	addcc	%l4,	0x0BAA,	%g3
	fmovsge	%xcc,	%f19,	%f17
	movvs	%icc,	%l5,	%l0
	edge16n	%o6,	%i2,	%o0
	edge8n	%o5,	%o7,	%l6
	ldub	[%l7 + 0x7E],	%i3
	movrgez	%i6,	%g2,	%i7
	movcc	%xcc,	%i4,	%g4
	subccc	%o1,	0x093E,	%i5
	addccc	%o3,	0x0478,	%i0
	lduh	[%l7 + 0x30],	%g5
	ld	[%l7 + 0x1C],	%f10
	array32	%l3,	%i1,	%l1
	alignaddrl	%o2,	%g6,	%g1
	movcs	%xcc,	%o4,	%l2
	fmovrslz	%l4,	%f13,	%f0
	sdivx	%g7,	0x1F1E,	%l5
	movvs	%xcc,	%l0,	%o6
	subc	%i2,	%o0,	%g3
	alignaddr	%o7,	%o5,	%i3
	mova	%icc,	%l6,	%i6
	ld	[%l7 + 0x20],	%f16
	ldsb	[%l7 + 0x4C],	%g2
	for	%f26,	%f22,	%f4
	fmul8x16	%f28,	%f4,	%f8
	fnot1	%f28,	%f0
	ldsw	[%l7 + 0x08],	%i7
	movrlz	%i4,	%g4,	%o1
	orncc	%o3,	%i0,	%g5
	mova	%xcc,	%l3,	%i1
	srax	%l1,	0x19,	%o2
	ldsb	[%l7 + 0x2F],	%g6
	fnor	%f30,	%f0,	%f2
	fabsd	%f18,	%f10
	edge16n	%i5,	%g1,	%l2
	movne	%icc,	%l4,	%o4
	fand	%f10,	%f18,	%f28
	edge16ln	%l5,	%l0,	%o6
	ldsw	[%l7 + 0x74],	%g7
	ldd	[%l7 + 0x30],	%i2
	subcc	%o0,	%o7,	%o5
	edge16l	%g3,	%l6,	%i6
	alignaddrl	%g2,	%i7,	%i3
	ldsw	[%l7 + 0x78],	%g4
	fsrc1s	%f3,	%f17
	fmovscc	%xcc,	%f7,	%f2
	orcc	%i4,	0x02B3,	%o3
	edge16	%o1,	%g5,	%i0
	subccc	%l3,	0x109B,	%i1
	st	%f4,	[%l7 + 0x10]
	sra	%o2,	%l1,	%i5
	xnorcc	%g6,	0x16B6,	%g1
	edge8l	%l4,	%o4,	%l5
	ldx	[%l7 + 0x48],	%l0
	sllx	%o6,	%l2,	%g7
	fnands	%f5,	%f20,	%f27
	ldd	[%l7 + 0x70],	%i2
	movneg	%xcc,	%o0,	%o7
	sdivcc	%g3,	0x0D66,	%l6
	orncc	%o5,	0x0D97,	%i6
	sth	%g2,	[%l7 + 0x4A]
	edge16	%i3,	%i7,	%g4
	or	%o3,	0x08C4,	%o1
	xorcc	%i4,	%i0,	%l3
	fand	%f26,	%f2,	%f28
	fmovrsgez	%i1,	%f2,	%f27
	stw	%o2,	[%l7 + 0x6C]
	ldub	[%l7 + 0x42],	%l1
	movg	%xcc,	%g5,	%i5
	movneg	%icc,	%g1,	%g6
	movn	%xcc,	%o4,	%l5
	sra	%l0,	0x00,	%o6
	movrlz	%l4,	%g7,	%l2
	st	%f13,	[%l7 + 0x6C]
	orcc	%o0,	0x162E,	%o7
	fcmple16	%f10,	%f0,	%g3
	udiv	%i2,	0x0A47,	%l6
	movrlez	%i6,	%o5,	%g2
	addcc	%i3,	%g4,	%i7
	edge32n	%o1,	%o3,	%i0
	fmuld8ulx16	%f23,	%f29,	%f10
	addccc	%i4,	%l3,	%i1
	mova	%xcc,	%l1,	%g5
	ldsb	[%l7 + 0x21],	%i5
	andcc	%g1,	%g6,	%o4
	fmovdgu	%icc,	%f6,	%f0
	andn	%l5,	%l0,	%o6
	movrlz	%l4,	0x37B,	%g7
	fsrc2s	%f29,	%f1
	array32	%l2,	%o0,	%o7
	movrgz	%o2,	0x0CE,	%i2
	save %g3, 0x18BC, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%i6
	stw	%g2,	[%l7 + 0x18]
	edge32	%o5,	%g4,	%i7
	fmovdcc	%xcc,	%f27,	%f24
	edge32n	%i3,	%o1,	%o3
	stb	%i0,	[%l7 + 0x3E]
	restore %l3, 0x14DB, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l1,	%i4,	%i5
	edge8n	%g5,	%g6,	%o4
	edge32n	%l5,	%l0,	%g1
	udivcc	%o6,	0x0021,	%g7
	orcc	%l4,	%l2,	%o7
	fnegd	%f0,	%f22
	orn	%o2,	%o0,	%g3
	ldsh	[%l7 + 0x5A],	%i2
	fcmpne32	%f12,	%f0,	%i6
	srax	%l6,	%o5,	%g2
	fone	%f30
	sll	%g4,	0x18,	%i3
	sdivx	%i7,	0x132E,	%o3
	fmovrdne	%i0,	%f18,	%f2
	array32	%o1,	%l3,	%l1
	save %i1, 0x1386, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g5,	%i5,	%g6
	orn	%o4,	%l0,	%g1
	movrne	%o6,	0x2B9,	%l5
	fmul8x16au	%f8,	%f28,	%f12
	srlx	%l4,	%l2,	%o7
	fmovrdne	%g7,	%f10,	%f4
	xorcc	%o2,	%g3,	%o0
	sdivcc	%i6,	0x0D50,	%l6
	movvs	%xcc,	%i2,	%o5
	array16	%g2,	%i3,	%i7
	movrlz	%o3,	%i0,	%g4
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	array16	%i1,	%o1,	%i4
	xor	%g5,	0x1072,	%g6
	sll	%o4,	%i5,	%l0
	save %g1, %o6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x1C],	%f24
	and	%l2,	0x1A2A,	%l5
	nop
	set	0x18, %g4
	stx	%g7,	[%l7 + %g4]
	fmovsneg	%icc,	%f23,	%f2
	movge	%xcc,	%o7,	%o2
	fpack32	%f18,	%f0,	%f0
	lduw	[%l7 + 0x18],	%o0
	sethi	0x0256,	%i6
	array16	%l6,	%i2,	%o5
	xnor	%g3,	%i3,	%g2
	udivx	%i7,	0x1457,	%i0
	fand	%f28,	%f16,	%f20
	andncc	%o3,	%l3,	%g4
	edge32	%l1,	%o1,	%i4
	bshuffle	%f28,	%f12,	%f28
	ldsw	[%l7 + 0x0C],	%i1
	movvs	%xcc,	%g6,	%g5
	stw	%o4,	[%l7 + 0x60]
	edge32l	%l0,	%i5,	%o6
	movne	%xcc,	%l4,	%g1
	umulcc	%l2,	0x1DB1,	%l5
	fmovrdgz	%g7,	%f6,	%f14
	srlx	%o7,	%o2,	%i6
	movrlz	%l6,	%i2,	%o0
	add	%g3,	0x1189,	%o5
	srl	%g2,	%i3,	%i0
	fpack32	%f6,	%f6,	%f28
	addc	%i7,	0x15CF,	%l3
	sub	%g4,	%o3,	%l1
	mulscc	%i4,	0x10B1,	%i1
	movrlz	%g6,	0x3CC,	%g5
	movleu	%icc,	%o4,	%l0
	xnorcc	%i5,	0x14D4,	%o1
	andncc	%l4,	%o6,	%g1
	fcmple32	%f8,	%f20,	%l2
	alignaddrl	%l5,	%o7,	%g7
	save %o2, 0x172B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f11,	%f29
	stw	%i6,	[%l7 + 0x34]
	movpos	%icc,	%o0,	%i2
	sdivx	%o5,	0x16D5,	%g3
	mulscc	%g2,	%i3,	%i0
	movre	%l3,	%g4,	%i7
	orncc	%o3,	%l1,	%i1
	or	%i4,	%g5,	%o4
	edge8	%g6,	%l0,	%o1
	srlx	%i5,	%l4,	%g1
	movcs	%xcc,	%o6,	%l2
	fnors	%f1,	%f17,	%f25
	umulcc	%o7,	%l5,	%g7
	movrne	%o2,	%i6,	%l6
	array8	%i2,	%o5,	%o0
	movre	%g3,	0x07D,	%i3
	nop
	set	0x28, %g7
	std	%f10,	[%l7 + %g7]
	ldd	[%l7 + 0x10],	%g2
	fcmpes	%fcc3,	%f5,	%f22
	fcmpes	%fcc3,	%f11,	%f18
	edge8ln	%l3,	%i0,	%g4
	fmul8x16al	%f30,	%f2,	%f14
	movrgez	%o3,	%l1,	%i7
	fmovscs	%icc,	%f3,	%f28
	or	%i4,	%i1,	%g5
	fones	%f8
	movge	%xcc,	%g6,	%l0
	orn	%o4,	%o1,	%l4
	fmovdg	%icc,	%f17,	%f15
	restore %g1, %o6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f8,	%f30,	%f26
	subc	%o7,	0x07D4,	%i5
	subccc	%l5,	%o2,	%g7
	xnorcc	%i6,	%i2,	%l6
	stw	%o5,	[%l7 + 0x70]
	sth	%g3,	[%l7 + 0x10]
	sdiv	%o0,	0x0286,	%i3
	sdivcc	%g2,	0x13FB,	%l3
	movrlz	%i0,	0x108,	%o3
	add	%l1,	0x0EB8,	%i7
	xnor	%g4,	0x19DF,	%i1
	movneg	%icc,	%g5,	%i4
	sub	%g6,	0x0F64,	%l0
	movg	%icc,	%o4,	%l4
	smul	%g1,	%o1,	%l2
	fmul8x16	%f7,	%f4,	%f6
	orn	%o6,	%o7,	%l5
	lduw	[%l7 + 0x7C],	%o2
	save %g7, 0x13AF, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i2,	%l6,	%i5
	edge32l	%g3,	%o5,	%o0
	fpack16	%f2,	%f14
	srax	%g2,	%i3,	%i0
	subc	%o3,	0x1828,	%l3
	andn	%i7,	%g4,	%l1
	subcc	%i1,	0x118C,	%g5
	fones	%f12
	udivcc	%i4,	0x0990,	%l0
	movgu	%icc,	%g6,	%o4
	array8	%g1,	%o1,	%l4
	ldd	[%l7 + 0x68],	%f30
	fmovrde	%o6,	%f26,	%f4
	st	%f25,	[%l7 + 0x58]
	mova	%icc,	%o7,	%l5
	andn	%l2,	0x0AD2,	%o2
	and	%g7,	%i2,	%i6
	and	%l6,	0x15E7,	%g3
	orn	%i5,	%o0,	%o5
	ldsb	[%l7 + 0x7E],	%i3
	fpadd16	%f26,	%f18,	%f26
	st	%f2,	[%l7 + 0x58]
	edge8l	%g2,	%o3,	%l3
	movrgz	%i7,	%g4,	%l1
	edge8ln	%i0,	%i1,	%g5
	faligndata	%f12,	%f24,	%f30
	movre	%l0,	0x132,	%i4
	sdiv	%g6,	0x0155,	%g1
	movle	%icc,	%o1,	%o4
	ldsh	[%l7 + 0x58],	%o6
	edge32l	%o7,	%l5,	%l4
	stx	%o2,	[%l7 + 0x10]
	stb	%l2,	[%l7 + 0x68]
	movneg	%icc,	%g7,	%i2
	std	%f30,	[%l7 + 0x70]
	orncc	%l6,	0x19E1,	%i6
	movpos	%icc,	%g3,	%i5
	ldd	[%l7 + 0x40],	%o4
	umulcc	%o0,	%g2,	%o3
	stb	%l3,	[%l7 + 0x2B]
	fnands	%f18,	%f23,	%f24
	stb	%i3,	[%l7 + 0x3B]
	mulx	%g4,	0x1FDE,	%i7
	xnorcc	%l1,	%i0,	%i1
	xnorcc	%g5,	0x0E06,	%i4
	edge8	%g6,	%g1,	%l0
	alignaddrl	%o4,	%o6,	%o1
	sethi	0x15C6,	%o7
	popc	0x014A,	%l5
	add	%o2,	0x046B,	%l4
	fmul8x16al	%f15,	%f11,	%f0
	fnegs	%f18,	%f17
	add	%l2,	%i2,	%g7
	sdivcc	%i6,	0x1E37,	%l6
	movneg	%icc,	%i5,	%g3
	faligndata	%f26,	%f20,	%f28
	movrgz	%o0,	0x116,	%g2
	fxors	%f25,	%f8,	%f10
	orn	%o5,	0x11C2,	%o3
	sll	%i3,	%l3,	%g4
	fxor	%f16,	%f18,	%f20
	mulx	%i7,	0x0B89,	%i0
	udivcc	%l1,	0x1DD9,	%g5
	stb	%i1,	[%l7 + 0x26]
	lduh	[%l7 + 0x64],	%i4
	fmovsn	%xcc,	%f27,	%f9
	mova	%icc,	%g6,	%g1
	ld	[%l7 + 0x78],	%f5
	fmovdle	%icc,	%f20,	%f17
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	alignaddrl	%o4,	%l5,	%o2
	save %o7, %l2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%i2
	fmovscs	%icc,	%f21,	%f7
	edge8ln	%g7,	%l6,	%i5
	fornot1s	%f0,	%f15,	%f19
	movrne	%g3,	0x2ED,	%i6
	fcmple32	%f14,	%f26,	%o0
	movvc	%xcc,	%g2,	%o5
	fmovdne	%xcc,	%f25,	%f16
	stw	%o3,	[%l7 + 0x08]
	lduh	[%l7 + 0x16],	%l3
	popc	0x11D4,	%g4
	fmovscc	%icc,	%f3,	%f4
	alignaddr	%i3,	%i0,	%l1
	umul	%g5,	%i1,	%i4
	movcc	%icc,	%g6,	%i7
	sll	%l0,	%o6,	%o1
	movleu	%xcc,	%o4,	%l5
	movrgz	%o2,	0x0B3,	%g1
	edge32	%o7,	%l4,	%l2
	array8	%g7,	%i2,	%l6
	fpadd32s	%f17,	%f17,	%f9
	udiv	%g3,	0x19F5,	%i5
	movvc	%icc,	%o0,	%g2
	udiv	%i6,	0x1634,	%o5
	stw	%o3,	[%l7 + 0x20]
	movpos	%icc,	%g4,	%l3
	ldsb	[%l7 + 0x38],	%i0
	restore %l1, 0x03CE, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%g5,	%f29,	%f9
	fmovdgu	%icc,	%f6,	%f10
	fmovspos	%xcc,	%f2,	%f16
	fmovdpos	%icc,	%f8,	%f30
	ldd	[%l7 + 0x10],	%i0
	stw	%i4,	[%l7 + 0x18]
	movle	%xcc,	%g6,	%i7
	ldd	[%l7 + 0x28],	%l0
	ldsw	[%l7 + 0x4C],	%o6
	movne	%icc,	%o4,	%l5
	andncc	%o1,	%o2,	%g1
	movvs	%icc,	%l4,	%o7
	andn	%g7,	%l2,	%i2
	fpadd32	%f16,	%f16,	%f6
	movvs	%icc,	%l6,	%i5
	fmovrslz	%g3,	%f4,	%f19
	orn	%o0,	0x1F6E,	%i6
	fmovrdlez	%g2,	%f12,	%f22
	movge	%icc,	%o3,	%o5
	subc	%g4,	%l3,	%i0
	xnor	%i3,	0x1847,	%l1
	fmovsa	%xcc,	%f12,	%f23
	movgu	%xcc,	%i1,	%g5
	orcc	%i4,	%g6,	%i7
	lduw	[%l7 + 0x0C],	%l0
	sdivcc	%o6,	0x1131,	%l5
	edge8n	%o4,	%o1,	%o2
	ldx	[%l7 + 0x40],	%g1
	fmuld8ulx16	%f20,	%f18,	%f22
	ldd	[%l7 + 0x38],	%f6
	xor	%o7,	0x1AB1,	%l4
	movne	%xcc,	%l2,	%i2
	edge16ln	%g7,	%l6,	%i5
	fandnot1	%f2,	%f12,	%f24
	subccc	%g3,	0x0C1B,	%o0
	movrlez	%i6,	0x07F,	%o3
	movvc	%icc,	%o5,	%g4
	sth	%g2,	[%l7 + 0x5E]
	movrgz	%l3,	0x1C7,	%i0
	movrne	%i3,	%i1,	%l1
	fcmple16	%f8,	%f24,	%i4
	movn	%icc,	%g6,	%g5
	fmovrslez	%l0,	%f21,	%f12
	edge32l	%i7,	%l5,	%o4
	sub	%o1,	0x06D1,	%o6
	sethi	0x183F,	%o2
	array16	%o7,	%l4,	%g1
	sdivcc	%i2,	0x13D6,	%l2
	movcc	%xcc,	%g7,	%l6
	pdist	%f26,	%f10,	%f0
	mulx	%i5,	0x029E,	%g3
	edge16ln	%i6,	%o3,	%o5
	umul	%o0,	0x0C6A,	%g4
	fcmpes	%fcc3,	%f7,	%f23
	udivcc	%l3,	0x1402,	%g2
	movl	%icc,	%i0,	%i3
	srlx	%i1,	0x1F,	%l1
	sir	0x1AB0
	movvc	%xcc,	%g6,	%i4
	edge16	%g5,	%i7,	%l5
	alignaddrl	%o4,	%o1,	%l0
	edge8n	%o6,	%o7,	%o2
	edge32n	%g1,	%i2,	%l2
	udivcc	%g7,	0x05D9,	%l6
	movcc	%xcc,	%l4,	%i5
	movvc	%xcc,	%i6,	%g3
	std	%f16,	[%l7 + 0x20]
	nop
	set	0x4C, %o6
	ldsw	[%l7 + %o6],	%o5
	ldsh	[%l7 + 0x1C],	%o0
	fpackfix	%f30,	%f5
	orn	%o3,	0x0597,	%l3
	ldsh	[%l7 + 0x26],	%g2
	array8	%i0,	%g4,	%i3
	movre	%i1,	%g6,	%i4
	udivcc	%l1,	0x10AF,	%i7
	array32	%l5,	%g5,	%o4
	fmovrslez	%o1,	%f20,	%f22
	movneg	%icc,	%l0,	%o6
	alignaddr	%o7,	%g1,	%o2
	fmovsne	%icc,	%f1,	%f11
	fmovdgu	%xcc,	%f29,	%f19
	orncc	%i2,	%g7,	%l2
	sra	%l4,	%i5,	%l6
	fmovspos	%xcc,	%f19,	%f0
	mova	%xcc,	%i6,	%o5
	or	%g3,	0x1178,	%o3
	fpmerge	%f9,	%f5,	%f18
	edge16n	%o0,	%g2,	%l3
	lduw	[%l7 + 0x50],	%i0
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	movl	%icc,	%g6,	%i4
	addccc	%g4,	%l1,	%i7
	edge8l	%g5,	%l5,	%o1
	movn	%icc,	%o4,	%o6
	lduh	[%l7 + 0x4E],	%o7
	movneg	%icc,	%l0,	%g1
	ldd	[%l7 + 0x10],	%o2
	sdiv	%i2,	0x1223,	%g7
	fmul8x16au	%f23,	%f30,	%f10
	fmovrslz	%l4,	%f26,	%f14
	udiv	%l2,	0x1823,	%l6
	ldd	[%l7 + 0x10],	%i6
	fmovrsne	%o5,	%f3,	%f21
	udivx	%i5,	0x099D,	%g3
	movrgez	%o3,	0x024,	%o0
	ldsh	[%l7 + 0x52],	%g2
	movpos	%icc,	%l3,	%i3
	popc	0x01C4,	%i0
	ldd	[%l7 + 0x60],	%i0
	umulcc	%i4,	%g6,	%g4
	edge8l	%i7,	%g5,	%l1
	movcc	%icc,	%l5,	%o1
	nop
	set	0x10, %o1
	stw	%o6,	[%l7 + %o1]
	andn	%o7,	0x0120,	%o4
	ldub	[%l7 + 0x70],	%l0
	movrne	%o2,	0x25B,	%g1
	sub	%g7,	0x05F0,	%l4
	movne	%xcc,	%i2,	%l2
	sdivx	%l6,	0x0822,	%o5
	edge16n	%i6,	%g3,	%i5
	or	%o0,	0x0793,	%g2
	andcc	%o3,	%l3,	%i0
	edge16n	%i1,	%i4,	%i3
	movrlz	%g6,	%i7,	%g5
	edge16ln	%g4,	%l5,	%o1
	sdivx	%l1,	0x1C76,	%o7
	sth	%o4,	[%l7 + 0x28]
	orncc	%l0,	%o6,	%o2
	fsrc2	%f18,	%f18
	xorcc	%g7,	0x1F3F,	%l4
	smulcc	%g1,	%i2,	%l2
	fmovsne	%icc,	%f1,	%f29
	fcmped	%fcc3,	%f6,	%f8
	movg	%icc,	%l6,	%o5
	move	%xcc,	%i6,	%i5
	fcmpgt32	%f20,	%f16,	%o0
	movrlz	%g3,	0x1F2,	%g2
	andcc	%l3,	0x12E5,	%o3
	edge32	%i1,	%i4,	%i0
	movneg	%icc,	%g6,	%i7
	orn	%i3,	%g4,	%g5
	movcs	%icc,	%l5,	%o1
	srlx	%o7,	%o4,	%l1
	movrlez	%l0,	0x3BE,	%o6
	movrgez	%o2,	%l4,	%g7
	alignaddrl	%g1,	%l2,	%l6
	ld	[%l7 + 0x18],	%f1
	and	%o5,	0x03E7,	%i2
	orn	%i5,	0x139B,	%o0
	movrlez	%i6,	0x22A,	%g2
	edge16n	%l3,	%o3,	%g3
	fmovsg	%icc,	%f27,	%f15
	smulcc	%i1,	%i0,	%i4
	array16	%g6,	%i3,	%g4
	andncc	%i7,	%l5,	%o1
	orcc	%o7,	0x1932,	%o4
	movneg	%icc,	%g5,	%l0
	movgu	%xcc,	%l1,	%o6
	and	%l4,	0x196A,	%g7
	edge16l	%o2,	%g1,	%l2
	movgu	%xcc,	%o5,	%l6
	fnot1	%f30,	%f26
	stw	%i5,	[%l7 + 0x48]
	add	%i2,	0x0AAB,	%o0
	ldsh	[%l7 + 0x2A],	%i6
	edge8l	%l3,	%g2,	%o3
	popc	0x060E,	%g3
	movg	%xcc,	%i0,	%i4
	addc	%i1,	%i3,	%g4
	srlx	%g6,	0x04,	%i7
	fmovspos	%icc,	%f0,	%f10
	andncc	%l5,	%o7,	%o4
	and	%g5,	%l0,	%l1
	fmul8x16	%f29,	%f8,	%f10
	smulcc	%o6,	%o1,	%g7
	fcmpeq16	%f2,	%f26,	%o2
	movrgez	%g1,	0x190,	%l2
	sir	0x11B2
	movvc	%xcc,	%o5,	%l4
	st	%f19,	[%l7 + 0x18]
	mulx	%l6,	0x070F,	%i2
	ldsh	[%l7 + 0x50],	%i5
	ldsh	[%l7 + 0x62],	%i6
	movrlez	%l3,	0x1DA,	%o0
	ldx	[%l7 + 0x50],	%g2
	siam	0x1
	ld	[%l7 + 0x10],	%f15
	and	%o3,	%g3,	%i4
	stb	%i1,	[%l7 + 0x16]
	fmovsneg	%icc,	%f25,	%f6
	movvc	%icc,	%i0,	%g4
	std	%f18,	[%l7 + 0x20]
	fmovrde	%i3,	%f0,	%f30
	sllx	%i7,	0x17,	%l5
	fandnot1	%f4,	%f26,	%f28
	fmovrdlz	%g6,	%f6,	%f26
	srl	%o7,	0x18,	%g5
	edge32l	%l0,	%o4,	%o6
	fcmpeq16	%f16,	%f18,	%o1
	array32	%g7,	%l1,	%g1
	fmovdvs	%icc,	%f19,	%f17
	smul	%o2,	%l2,	%o5
	fabss	%f24,	%f22
	andncc	%l4,	%i2,	%l6
	mulx	%i5,	0x1ED6,	%i6
	smulcc	%o0,	0x0A73,	%g2
	edge32ln	%o3,	%g3,	%i4
	udivcc	%i1,	0x0649,	%i0
	fpsub16	%f8,	%f18,	%f12
	fmovrdgez	%g4,	%f16,	%f20
	xnorcc	%i3,	0x1F24,	%l3
	orncc	%l5,	%g6,	%o7
	movrlz	%i7,	0x1EA,	%g5
	st	%f2,	[%l7 + 0x3C]
	array8	%o4,	%o6,	%o1
	fxors	%f24,	%f9,	%f10
	udivx	%g7,	0x141C,	%l1
	subc	%g1,	%l0,	%o2
	movvc	%icc,	%l2,	%l4
	movle	%xcc,	%i2,	%o5
	addcc	%l6,	0x14E3,	%i6
	movn	%icc,	%o0,	%i5
	fpadd32s	%f20,	%f7,	%f31
	array8	%g2,	%o3,	%g3
	popc	0x1B57,	%i1
	udiv	%i0,	0x05F7,	%i4
	fmovsn	%icc,	%f9,	%f10
	edge8n	%i3,	%g4,	%l3
	mulx	%l5,	0x0291,	%o7
	srl	%g6,	0x1D,	%g5
	smulcc	%o4,	%o6,	%o1
	array16	%g7,	%l1,	%g1
	edge16	%l0,	%o2,	%l2
	fmovspos	%xcc,	%f13,	%f18
	ldsw	[%l7 + 0x70],	%l4
	ldub	[%l7 + 0x23],	%i7
	siam	0x6
	sdiv	%i2,	0x1079,	%o5
	sth	%l6,	[%l7 + 0x62]
	edge16l	%i6,	%o0,	%g2
	umulcc	%o3,	0x0309,	%g3
	edge32ln	%i1,	%i5,	%i0
	xor	%i4,	%g4,	%i3
	fmovspos	%xcc,	%f11,	%f11
	umul	%l5,	0x0C07,	%o7
	edge8	%g6,	%g5,	%o4
	xnorcc	%l3,	%o1,	%g7
	movg	%icc,	%l1,	%o6
	smulcc	%g1,	0x18E0,	%l0
	ldub	[%l7 + 0x2A],	%l2
	smulcc	%o2,	0x0755,	%l4
	fmovspos	%icc,	%f21,	%f22
	orcc	%i2,	0x17F7,	%o5
	st	%f20,	[%l7 + 0x74]
	fmovdneg	%xcc,	%f11,	%f14
	addcc	%i7,	%i6,	%l6
	fandnot1s	%f24,	%f25,	%f6
	stb	%g2,	[%l7 + 0x5F]
	and	%o3,	0x07D0,	%g3
	srax	%o0,	0x15,	%i5
	edge8l	%i0,	%i4,	%i1
	fpack32	%f16,	%f30,	%f26
	movgu	%xcc,	%i3,	%g4
	xor	%l5,	%o7,	%g5
	subc	%g6,	%l3,	%o1
	udiv	%o4,	0x199F,	%l1
	andn	%g7,	%o6,	%g1
	fmovrse	%l2,	%f12,	%f23
	movrgez	%o2,	%l4,	%l0
	fmovsvs	%xcc,	%f3,	%f21
	array8	%i2,	%o5,	%i6
	fnands	%f13,	%f18,	%f0
	fexpand	%f7,	%f2
	fmovrdlez	%l6,	%f0,	%f16
	sethi	0x1CB7,	%i7
	movg	%xcc,	%o3,	%g3
	sra	%g2,	0x10,	%o0
	lduh	[%l7 + 0x5A],	%i0
	st	%f0,	[%l7 + 0x6C]
	fpadd32s	%f2,	%f22,	%f18
	fabsd	%f14,	%f16
	movneg	%icc,	%i5,	%i4
	movneg	%xcc,	%i3,	%g4
	array32	%i1,	%o7,	%g5
	addccc	%l5,	0x18F6,	%l3
	fornot1s	%f26,	%f16,	%f16
	sllx	%o1,	%g6,	%l1
	subccc	%g7,	0x080A,	%o4
	fxnors	%f13,	%f1,	%f8
	alignaddrl	%o6,	%g1,	%o2
	udivcc	%l4,	0x0F47,	%l2
	stb	%i2,	[%l7 + 0x51]
	save %o5, 0x0F1F, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l6,	%i7
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%o2
	ldsw	[%l7 + 0x6C],	%l0
	alignaddr	%g2,	%g3,	%o0
	lduw	[%l7 + 0x20],	%i0
	xor	%i4,	%i3,	%i5
	sll	%g4,	%i1,	%o7
	addc	%l5,	%l3,	%o1
	xor	%g5,	%l1,	%g7
	edge16ln	%o4,	%o6,	%g1
	orn	%g6,	0x0FF9,	%o2
	ldd	[%l7 + 0x40],	%l4
	edge8l	%i2,	%l2,	%i6
	popc	0x15F6,	%l6
	fmovde	%xcc,	%f22,	%f1
	ldsb	[%l7 + 0x45],	%i7
	edge32	%o3,	%o5,	%g2
	movleu	%icc,	%l0,	%g3
	fnors	%f16,	%f4,	%f6
	fmuld8sux16	%f22,	%f23,	%f4
	edge32ln	%o0,	%i4,	%i3
	umul	%i0,	%g4,	%i5
	smul	%o7,	0x07C4,	%i1
	orcc	%l3,	%o1,	%l5
	movle	%xcc,	%g5,	%g7
	ldsw	[%l7 + 0x0C],	%o4
	edge32l	%o6,	%l1,	%g1
	movrne	%o2,	0x3C2,	%g6
	udiv	%i2,	0x1CE4,	%l4
	orn	%i6,	%l6,	%i7
	fmul8x16al	%f23,	%f31,	%f18
	sdiv	%l2,	0x0A1C,	%o3
	fmul8x16	%f29,	%f6,	%f26
	ldd	[%l7 + 0x70],	%f16
	movne	%xcc,	%o5,	%g2
	edge8l	%g3,	%l0,	%i4
	sllx	%i3,	%o0,	%g4
	fpack16	%f30,	%f0
	sub	%i0,	%i5,	%o7
	andn	%l3,	0x174C,	%i1
	orncc	%o1,	%l5,	%g5
	subcc	%g7,	0x02D2,	%o6
	srlx	%o4,	%g1,	%o2
	fmovsle	%xcc,	%f25,	%f18
	fmovsleu	%icc,	%f25,	%f11
	stb	%l1,	[%l7 + 0x43]
	srl	%i2,	%g6,	%i6
	movn	%xcc,	%l6,	%i7
	movneg	%xcc,	%l2,	%o3
	movleu	%icc,	%o5,	%g2
	fmul8x16al	%f5,	%f28,	%f4
	subc	%l4,	%g3,	%i4
	fnands	%f26,	%f26,	%f12
	array8	%l0,	%i3,	%o0
	movn	%icc,	%g4,	%i0
	edge8l	%i5,	%o7,	%l3
	mova	%icc,	%i1,	%o1
	movre	%g5,	%g7,	%l5
	udiv	%o4,	0x1A0B,	%o6
	fnors	%f9,	%f6,	%f11
	edge8l	%g1,	%o2,	%i2
	udivcc	%g6,	0x07A3,	%l1
	edge8l	%i6,	%l6,	%l2
	movrlz	%i7,	%o5,	%o3
	mova	%icc,	%g2,	%l4
	movrgez	%i4,	0x164,	%l0
	sir	0x083C
	fcmple32	%f26,	%f4,	%g3
	movgu	%icc,	%o0,	%i3
	fmovsl	%xcc,	%f8,	%f10
	orncc	%g4,	0x1500,	%i0
	add	%o7,	0x1D03,	%i5
	st	%f9,	[%l7 + 0x4C]
	andcc	%i1,	%o1,	%g5
	fnor	%f0,	%f30,	%f2
	fmovsg	%icc,	%f11,	%f0
	movrlz	%l3,	0x266,	%l5
	movg	%icc,	%o4,	%g7
	movpos	%icc,	%o6,	%o2
	add	%g1,	0x0B2F,	%g6
	edge32n	%l1,	%i6,	%l6
	fmovsa	%icc,	%f11,	%f14
	fandnot2s	%f7,	%f20,	%f2
	srax	%i2,	0x08,	%i7
	movle	%xcc,	%o5,	%l2
	xor	%g2,	0x0950,	%l4
	udivx	%o3,	0x0248,	%i4
	edge32n	%g3,	%l0,	%o0
	fpack32	%f18,	%f18,	%f30
	movcc	%icc,	%g4,	%i0
	srlx	%i3,	0x0F,	%i5
	andn	%o7,	%o1,	%i1
	ldd	[%l7 + 0x20],	%f30
	srax	%g5,	%l5,	%l3
	save %g7, %o6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g1,	%o2,	%l1
	andcc	%g6,	0x0CA9,	%l6
	ldsb	[%l7 + 0x2B],	%i6
	movgu	%xcc,	%i7,	%o5
	sdivx	%l2,	0x1EC2,	%g2
	fmovsne	%icc,	%f17,	%f20
	sdiv	%i2,	0x1B12,	%o3
	fsrc1	%f8,	%f18
	movrne	%i4,	0x1B4,	%l4
	stw	%g3,	[%l7 + 0x38]
	edge32l	%o0,	%l0,	%g4
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f14
	movrgz	%i3,	%i5,	%o7
	save %o1, %i0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l5,	0x0A4,	%l3
	movge	%icc,	%g5,	%o6
	stw	%o4,	[%l7 + 0x6C]
	addc	%g1,	0x020A,	%g7
	nop
	set	0x52, %l6
	sth	%l1,	[%l7 + %l6]
	udiv	%g6,	0x07A2,	%o2
	fnot1	%f0,	%f14
	movneg	%xcc,	%i6,	%l6
	xnorcc	%i7,	%l2,	%o5
	fnot1	%f30,	%f4
	fnot2s	%f30,	%f2
	udiv	%g2,	0x1AB8,	%o3
	movn	%xcc,	%i4,	%i2
	subccc	%g3,	0x173A,	%o0
	sdiv	%l4,	0x0CCB,	%l0
	mova	%xcc,	%i3,	%g4
	array8	%i5,	%o1,	%o7
	andn	%i0,	0x1A13,	%i1
	movn	%xcc,	%l5,	%g5
	fxnor	%f12,	%f0,	%f12
	sdivx	%l3,	0x1F76,	%o4
	edge32	%g1,	%o6,	%g7
	fnors	%f29,	%f17,	%f6
	ld	[%l7 + 0x78],	%f14
	fnor	%f30,	%f26,	%f30
	fmovs	%f4,	%f11
	fpack32	%f26,	%f22,	%f16
	sll	%g6,	%o2,	%l1
	fnands	%f19,	%f0,	%f18
	lduh	[%l7 + 0x12],	%l6
	fcmple32	%f18,	%f0,	%i6
	and	%i7,	0x1F4A,	%l2
	ldsh	[%l7 + 0x32],	%g2
	std	%f24,	[%l7 + 0x28]
	smul	%o3,	0x165E,	%i4
	andn	%i2,	%o5,	%o0
	array8	%g3,	%l0,	%i3
	sllx	%l4,	0x1B,	%i5
	alignaddrl	%g4,	%o1,	%i0
	ldsh	[%l7 + 0x1E],	%i1
	and	%o7,	%g5,	%l3
	subccc	%o4,	%l5,	%g1
	umul	%o6,	0x06CF,	%g6
	restore %g7, %o2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i6,	%l6,	%i7
	and	%l2,	%g2,	%o3
	movrlez	%i2,	0x11C,	%o5
	sub	%o0,	%g3,	%l0
	alignaddr	%i4,	%l4,	%i3
	fors	%f20,	%f21,	%f11
	xorcc	%i5,	%g4,	%i0
	edge8l	%o1,	%i1,	%g5
	fsrc2s	%f21,	%f20
	array8	%o7,	%o4,	%l3
	fmuld8sux16	%f11,	%f0,	%f18
	fmovdn	%xcc,	%f21,	%f10
	umul	%g1,	%l5,	%g6
	stb	%g7,	[%l7 + 0x25]
	fcmple32	%f14,	%f14,	%o2
	edge32ln	%o6,	%i6,	%l1
	movre	%l6,	0x266,	%i7
	fmovs	%f8,	%f23
	xor	%l2,	%o3,	%i2
	fpadd16	%f2,	%f24,	%f18
	sub	%g2,	%o0,	%g3
	umul	%o5,	0x0842,	%i4
	edge16l	%l4,	%i3,	%i5
	nop
	set	0x08, %i2
	stx	%g4,	[%l7 + %i2]
	movrgz	%l0,	0x27E,	%o1
	fmovdcc	%icc,	%f21,	%f9
	movneg	%xcc,	%i0,	%i1
	ldub	[%l7 + 0x69],	%g5
	addcc	%o7,	0x06DA,	%o4
	sub	%g1,	0x0B78,	%l5
	udivcc	%l3,	0x02BF,	%g7
	addc	%o2,	0x135A,	%g6
	ld	[%l7 + 0x10],	%f21
	fmovrdlz	%o6,	%f20,	%f12
	mulx	%i6,	0x16A8,	%l1
	fexpand	%f13,	%f14
	orncc	%l6,	0x1021,	%l2
	array16	%o3,	%i7,	%i2
	fmovdg	%icc,	%f2,	%f5
	fmovdneg	%icc,	%f7,	%f9
	orn	%o0,	0x1C31,	%g3
	movg	%xcc,	%g2,	%o5
	array32	%l4,	%i3,	%i4
	xnor	%g4,	0x151E,	%l0
	fmovrsgez	%i5,	%f2,	%f6
	movvc	%xcc,	%o1,	%i0
	alignaddr	%g5,	%o7,	%i1
	move	%icc,	%g1,	%o4
	movre	%l3,	0x197,	%l5
	ldsw	[%l7 + 0x64],	%g7
	movcs	%xcc,	%g6,	%o6
	orncc	%o2,	%i6,	%l1
	ldsw	[%l7 + 0x48],	%l6
	sub	%o3,	0x07AF,	%l2
	edge32ln	%i7,	%i2,	%g3
	mulx	%o0,	%g2,	%l4
	edge32n	%i3,	%i4,	%g4
	subcc	%l0,	%i5,	%o5
	ldd	[%l7 + 0x08],	%o0
	stw	%i0,	[%l7 + 0x50]
	ldsw	[%l7 + 0x70],	%g5
	subccc	%o7,	%g1,	%o4
	fsrc2	%f16,	%f4
	movcs	%xcc,	%i1,	%l3
	movg	%icc,	%g7,	%g6
	udiv	%l5,	0x0274,	%o6
	save %o2, 0x135B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f15,	%f5,	%f29
	movl	%icc,	%i6,	%l6
	fmul8ulx16	%f28,	%f20,	%f4
	alignaddr	%o3,	%i7,	%i2
	fmovsg	%xcc,	%f10,	%f16
	edge32ln	%g3,	%o0,	%l2
	fxnor	%f16,	%f14,	%f0
	sdivcc	%g2,	0x0EED,	%l4
	sub	%i4,	0x0D64,	%g4
	ld	[%l7 + 0x4C],	%f1
	umulcc	%l0,	%i5,	%i3
	std	%f12,	[%l7 + 0x08]
	edge8ln	%o5,	%i0,	%g5
	andn	%o1,	%g1,	%o7
	move	%icc,	%i1,	%l3
	fone	%f10
	andcc	%g7,	0x16AE,	%o4
	st	%f7,	[%l7 + 0x54]
	movcc	%icc,	%l5,	%o6
	ld	[%l7 + 0x0C],	%f8
	srax	%g6,	0x16,	%o2
	st	%f1,	[%l7 + 0x3C]
	xnorcc	%l1,	%l6,	%o3
	xorcc	%i7,	%i2,	%i6
	srl	%o0,	%g3,	%l2
	alignaddrl	%g2,	%i4,	%l4
	popc	%g4,	%i5
	sdivx	%i3,	0x18EA,	%l0
	fabsd	%f24,	%f4
	smulcc	%o5,	%i0,	%o1
	ldd	[%l7 + 0x50],	%f12
	sra	%g1,	0x0D,	%g5
	movrne	%o7,	%i1,	%l3
	andn	%g7,	0x15EA,	%l5
	ldd	[%l7 + 0x78],	%f12
	sir	0x10F0
	ldx	[%l7 + 0x40],	%o4
	fmul8ulx16	%f8,	%f28,	%f26
	orncc	%o6,	0x1185,	%o2
	stx	%g6,	[%l7 + 0x68]
	fnot1s	%f17,	%f31
	save %l1, %o3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i7,	0x221,	%i6
	edge32l	%i2,	%o0,	%g3
	orcc	%l2,	0x17A9,	%i4
	sth	%g2,	[%l7 + 0x0C]
	xnor	%l4,	0x11BB,	%g4
	fnot2s	%f9,	%f18
	ldsb	[%l7 + 0x29],	%i3
	addccc	%l0,	0x0A66,	%i5
	and	%i0,	%o1,	%o5
	subc	%g5,	%o7,	%g1
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	udiv	%l5,	0x06FE,	%g7
	st	%f1,	[%l7 + 0x20]
	fpadd16s	%f23,	%f31,	%f5
	umul	%o4,	0x034A,	%o2
	fornot2	%f0,	%f12,	%f14
	fnor	%f0,	%f22,	%f10
	edge8	%o6,	%g6,	%l1
	fornot2s	%f9,	%f13,	%f20
	mulscc	%l6,	%o3,	%i7
	fsrc2s	%f13,	%f4
	edge16ln	%i6,	%i2,	%o0
	fornot2s	%f23,	%f1,	%f24
	subc	%g3,	%l2,	%g2
	movn	%icc,	%i4,	%l4
	fnot1	%f8,	%f18
	fcmps	%fcc2,	%f0,	%f14
	movcs	%xcc,	%g4,	%l0
	fpsub16s	%f29,	%f3,	%f10
	udivcc	%i3,	0x01B1,	%i0
	udivx	%o1,	0x0148,	%o5
	pdist	%f22,	%f30,	%f16
	edge8l	%g5,	%o7,	%g1
	movcs	%icc,	%i5,	%i1
	ldx	[%l7 + 0x10],	%l5
	fand	%f0,	%f22,	%f8
	restore %l3, %g7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f28,	%f11,	%f16
	movrgez	%o4,	0x21F,	%o6
	fcmped	%fcc1,	%f26,	%f22
	and	%l1,	0x1FB8,	%l6
	popc	%o3,	%i7
	andn	%g6,	%i6,	%o0
	fmovdvc	%xcc,	%f5,	%f30
	st	%f17,	[%l7 + 0x68]
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	fmovrdlz	%g2,	%f0,	%f30
	smul	%l2,	0x194F,	%i4
	sethi	0x1994,	%g4
	movcs	%xcc,	%l0,	%l4
	edge32n	%i0,	%o1,	%i3
	fmovdvs	%xcc,	%f15,	%f10
	and	%g5,	%o7,	%g1
	fcmpeq16	%f24,	%f22,	%i5
	and	%o5,	0x1BF6,	%i1
	array8	%l3,	%g7,	%l5
	movrlz	%o4,	%o6,	%l1
	fcmpes	%fcc2,	%f17,	%f18
	srax	%o2,	0x02,	%o3
	movleu	%icc,	%i7,	%l6
	fabsd	%f8,	%f28
	orncc	%g6,	%o0,	%i6
	srax	%i2,	%g3,	%l2
	movle	%xcc,	%g2,	%g4
	ldd	[%l7 + 0x10],	%f24
	addc	%l0,	%l4,	%i0
	smulcc	%o1,	0x0F55,	%i4
	std	%f6,	[%l7 + 0x68]
	sll	%i3,	0x0C,	%o7
	fmovdvs	%icc,	%f8,	%f29
	movcc	%xcc,	%g5,	%g1
	movle	%xcc,	%o5,	%i1
	umul	%l3,	%i5,	%l5
	edge8	%o4,	%g7,	%l1
	array32	%o6,	%o3,	%i7
	ldsh	[%l7 + 0x56],	%l6
	ldd	[%l7 + 0x08],	%f26
	pdist	%f26,	%f12,	%f10
	udivcc	%o2,	0x17FC,	%o0
	orcc	%g6,	%i2,	%i6
	fcmps	%fcc1,	%f11,	%f18
	sdivx	%l2,	0x000C,	%g2
	fmovdvc	%xcc,	%f15,	%f9
	stw	%g3,	[%l7 + 0x44]
	sdivcc	%g4,	0x094C,	%l0
	sethi	0x0FD8,	%i0
	movleu	%xcc,	%o1,	%i4
	edge16l	%i3,	%l4,	%o7
	fmovdcs	%icc,	%f20,	%f30
	sdivx	%g5,	0x0F5C,	%g1
	fand	%f4,	%f20,	%f12
	lduh	[%l7 + 0x28],	%i1
	smul	%l3,	0x03B2,	%o5
	movn	%xcc,	%i5,	%o4
	movvc	%icc,	%l5,	%l1
	sdivcc	%o6,	0x0511,	%g7
	movneg	%icc,	%o3,	%l6
	umul	%o2,	0x1D0C,	%i7
	edge32n	%g6,	%o0,	%i6
	movvc	%icc,	%l2,	%g2
	movre	%i2,	0x05B,	%g3
	ldx	[%l7 + 0x68],	%l0
	fmovsneg	%icc,	%f11,	%f10
	ldsw	[%l7 + 0x5C],	%g4
	andcc	%o1,	0x09B5,	%i4
	sir	0x1F0E
	srl	%i0,	0x16,	%i3
	movl	%xcc,	%o7,	%l4
	fpadd16	%f16,	%f10,	%f12
	ldsh	[%l7 + 0x70],	%g1
	sethi	0x0CB3,	%i1
	fzero	%f14
	srl	%l3,	0x00,	%o5
	srax	%i5,	0x01,	%g5
	edge8l	%l5,	%o4,	%l1
	addcc	%g7,	0x0818,	%o3
	move	%icc,	%o6,	%l6
	mulscc	%o2,	0x1EC2,	%i7
	addccc	%g6,	0x1388,	%o0
	movleu	%xcc,	%i6,	%l2
	restore %g2, %g3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g4,	%l0
	fcmpgt32	%f22,	%f22,	%o1
	fmovsge	%xcc,	%f9,	%f30
	alignaddrl	%i0,	%i3,	%o7
	movne	%xcc,	%i4,	%g1
	sub	%i1,	0x0FF4,	%l4
	fmovdcs	%xcc,	%f26,	%f25
	smulcc	%l3,	%i5,	%o5
	edge32l	%g5,	%o4,	%l1
	save %l5, %o3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1593,	%o6
	faligndata	%f0,	%f26,	%f20
	alignaddr	%o2,	%i7,	%g6
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	movneg	%icc,	%g2,	%l2
	ld	[%l7 + 0x0C],	%f4
	std	%f12,	[%l7 + 0x08]
	movge	%xcc,	%g3,	%i2
	movge	%xcc,	%l0,	%g4
	sub	%i0,	%o1,	%o7
	fand	%f12,	%f28,	%f16
	andncc	%i4,	%i3,	%i1
	sdivx	%l4,	0x10AF,	%l3
	pdist	%f10,	%f28,	%f2
	alignaddrl	%i5,	%o5,	%g5
	add	%o4,	0x0C12,	%l1
	lduw	[%l7 + 0x54],	%g1
	edge16	%l5,	%g7,	%o6
	udivcc	%o3,	0x07C7,	%o2
	srax	%g6,	0x09,	%l6
	edge8n	%i7,	%i6,	%g2
	fandnot2	%f30,	%f2,	%f0
	mulscc	%l2,	0x0A8B,	%o0
	lduh	[%l7 + 0x4A],	%g3
	fandnot2s	%f16,	%f5,	%f27
	subc	%i2,	0x1BFA,	%g4
	edge16ln	%i0,	%l0,	%o7
	andcc	%i4,	0x0C98,	%i3
	fandnot1s	%f4,	%f7,	%f3
	addc	%i1,	%o1,	%l4
	edge16ln	%i5,	%l3,	%o5
	fsrc2s	%f28,	%f27
	movle	%icc,	%o4,	%g5
	save %l1, %g1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	%o3,	%g7
	movrlz	%o2,	%g6,	%l6
	or	%i6,	%i7,	%g2
	srl	%o0,	%l2,	%i2
	mulx	%g4,	%g3,	%l0
	fmovdneg	%xcc,	%f4,	%f10
	ldsh	[%l7 + 0x34],	%i0
	sra	%o7,	%i4,	%i3
	umulcc	%i1,	%l4,	%o1
	save %i5, %l3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f12,	%f10,	%f6
	udivx	%g5,	0x0F3E,	%l1
	addccc	%g1,	%o4,	%l5
	andncc	%o3,	%o6,	%o2
	orcc	%g7,	0x07B5,	%g6
	orn	%i6,	0x03E8,	%l6
	movne	%xcc,	%i7,	%o0
	fpsub16	%f6,	%f4,	%f14
	movrlez	%l2,	%i2,	%g2
	andn	%g3,	%g4,	%l0
	fmovde	%icc,	%f5,	%f0
	fmovdcc	%xcc,	%f19,	%f11
	andn	%o7,	0x1FFD,	%i4
	movgu	%icc,	%i3,	%i1
	ldd	[%l7 + 0x68],	%f18
	faligndata	%f26,	%f28,	%f30
	sra	%i0,	%o1,	%i5
	udivx	%l3,	0x0A40,	%o5
	fmul8x16	%f12,	%f8,	%f12
	smulcc	%g5,	%l4,	%g1
	movle	%icc,	%o4,	%l5
	nop
	set	0x3C, %g1
	lduh	[%l7 + %g1],	%o3
	fmovscc	%xcc,	%f6,	%f22
	ldsb	[%l7 + 0x68],	%o6
	movrlez	%o2,	%g7,	%l1
	umulcc	%g6,	0x0147,	%i6
	lduh	[%l7 + 0x5A],	%i7
	movle	%icc,	%o0,	%l6
	addccc	%i2,	0x0D09,	%l2
	popc	%g3,	%g2
	popc	%l0,	%o7
	movcs	%icc,	%g4,	%i3
	fmovrdne	%i4,	%f24,	%f24
	fcmpd	%fcc3,	%f10,	%f0
	array32	%i0,	%o1,	%i1
	sll	%i5,	0x0E,	%o5
	edge8n	%g5,	%l3,	%g1
	subcc	%o4,	0x1BB1,	%l4
	or	%l5,	0x10B6,	%o3
	srlx	%o6,	%o2,	%l1
	movgu	%icc,	%g7,	%i6
	array32	%i7,	%o0,	%g6
	movcc	%xcc,	%l6,	%l2
	movpos	%icc,	%i2,	%g3
	edge8ln	%g2,	%l0,	%g4
	edge16	%o7,	%i3,	%i4
	ldsh	[%l7 + 0x1E],	%o1
	addc	%i1,	%i0,	%i5
	lduw	[%l7 + 0x3C],	%g5
	movrgez	%o5,	%g1,	%l3
	movrgz	%l4,	%o4,	%o3
	fmul8x16al	%f19,	%f11,	%f6
	movrgz	%o6,	%o2,	%l1
	lduw	[%l7 + 0x6C],	%g7
	subc	%l5,	0x1FA7,	%i6
	movcs	%xcc,	%o0,	%g6
	udiv	%l6,	0x1D46,	%l2
	edge16	%i2,	%g3,	%i7
	restore %l0, 0x1ABE, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o7,	%f8,	%f4
	ldd	[%l7 + 0x50],	%g2
	movvc	%xcc,	%i3,	%o1
	movre	%i1,	0x370,	%i4
	ldd	[%l7 + 0x18],	%i4
	movleu	%xcc,	%i0,	%o5
	sub	%g5,	%l3,	%g1
	movne	%icc,	%o4,	%o3
	movl	%icc,	%l4,	%o6
	alignaddrl	%l1,	%o2,	%l5
	movrgz	%g7,	0x261,	%i6
	ldsw	[%l7 + 0x7C],	%g6
	movne	%xcc,	%l6,	%l2
	fsrc2	%f28,	%f22
	sir	0x0FDB
	popc	0x0CA8,	%i2
	fand	%f20,	%f16,	%f24
	edge8n	%o0,	%i7,	%g3
	addc	%l0,	0x09E7,	%g4
	udivx	%o7,	0x0074,	%g2
	fpadd32	%f20,	%f6,	%f24
	edge32	%i3,	%i1,	%o1
	save %i5, 0x0474, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	%g5,	%l3
	edge16	%o5,	%g1,	%o4
	array32	%l4,	%o6,	%l1
	stx	%o2,	[%l7 + 0x18]
	fpsub16	%f0,	%f8,	%f0
	fmovscs	%icc,	%f10,	%f2
	stw	%l5,	[%l7 + 0x3C]
	nop
	set	0x6E, %l5
	ldsh	[%l7 + %l5],	%o3
	ldub	[%l7 + 0x63],	%g7
	addcc	%g6,	%i6,	%l2
	sdivx	%l6,	0x1959,	%o0
	ldx	[%l7 + 0x40],	%i7
	srlx	%g3,	%l0,	%g4
	movne	%xcc,	%o7,	%i2
	edge8	%g2,	%i1,	%i3
	mulx	%o1,	0x0464,	%i5
	movre	%i4,	0x3F8,	%g5
	ldd	[%l7 + 0x40],	%f14
	edge16n	%l3,	%i0,	%g1
	sth	%o4,	[%l7 + 0x0A]
	subcc	%l4,	%o5,	%l1
	fmul8ulx16	%f0,	%f26,	%f28
	udivcc	%o2,	0x02A4,	%l5
	fmovd	%f20,	%f28
	orncc	%o3,	0x1124,	%g7
	orncc	%o6,	0x0E8F,	%i6
	edge8	%g6,	%l2,	%l6
	fmul8x16au	%f18,	%f9,	%f12
	movneg	%xcc,	%i7,	%g3
	stw	%l0,	[%l7 + 0x50]
	sdiv	%g4,	0x1BE0,	%o7
	movgu	%xcc,	%o0,	%i2
	edge32n	%i1,	%i3,	%o1
	ldsh	[%l7 + 0x1C],	%i5
	fnands	%f22,	%f22,	%f15
	edge32ln	%g2,	%g5,	%l3
	ldx	[%l7 + 0x28],	%i0
	ldsh	[%l7 + 0x64],	%g1
	ldsh	[%l7 + 0x0A],	%o4
	fands	%f9,	%f26,	%f14
	ldd	[%l7 + 0x48],	%i4
	ld	[%l7 + 0x0C],	%f18
	andncc	%l4,	%o5,	%o2
	ld	[%l7 + 0x78],	%f17
	movrgz	%l5,	0x321,	%o3
	smul	%g7,	%o6,	%l1
	movrlez	%i6,	%g6,	%l2
	fxor	%f10,	%f22,	%f2
	movrgez	%l6,	%i7,	%g3
	nop
	set	0x3D, %g6
	stb	%l0,	[%l7 + %g6]
	smul	%o7,	0x0E5F,	%g4
	fzero	%f2
	nop
	set	0x7E, %o7
	ldub	[%l7 + %o7],	%i2
	stw	%o0,	[%l7 + 0x2C]
	orcc	%i3,	%i1,	%i5
	fxor	%f22,	%f22,	%f20
	movgu	%xcc,	%g2,	%o1
	ldsw	[%l7 + 0x40],	%l3
	edge8ln	%i0,	%g1,	%o4
	edge8l	%g5,	%l4,	%o5
	subccc	%o2,	0x0D2B,	%l5
	ldsw	[%l7 + 0x74],	%i4
	fmovscc	%xcc,	%f0,	%f24
	sllx	%o3,	%g7,	%o6
	movle	%xcc,	%i6,	%g6
	and	%l2,	%l6,	%i7
	fmovdneg	%xcc,	%f6,	%f18
	edge32n	%l1,	%l0,	%o7
	edge8ln	%g3,	%g4,	%o0
	fcmpeq32	%f4,	%f26,	%i2
	array8	%i1,	%i5,	%i3
	andncc	%o1,	%l3,	%g2
	movrne	%g1,	0x131,	%i0
	fsrc1	%f14,	%f30
	fmovscc	%icc,	%f2,	%f10
	sth	%g5,	[%l7 + 0x4A]
	movrgz	%l4,	0x0AD,	%o4
	movrlez	%o5,	%o2,	%l5
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%i4
	orncc	%g7,	%o6,	%i6
	orncc	%g6,	%o3,	%l2
	sllx	%i7,	0x0D,	%l6
	movrne	%l0,	%o7,	%g3
	std	%f20,	[%l7 + 0x28]
	fmovsn	%icc,	%f15,	%f31
	std	%f10,	[%l7 + 0x48]
	sdivx	%g4,	0x117F,	%o0
	movvs	%xcc,	%i2,	%l1
	fnand	%f30,	%f30,	%f6
	udivx	%i5,	0x02E7,	%i3
	pdist	%f30,	%f10,	%f20
	movge	%icc,	%o1,	%i1
	fcmpgt16	%f24,	%f12,	%l3
	xnor	%g1,	%i0,	%g5
	array8	%l4,	%o4,	%o5
	andn	%o2,	0x0D99,	%l5
	movgu	%icc,	%i4,	%g7
	fsrc1	%f10,	%f24
	fpsub32	%f6,	%f22,	%f8
	movle	%xcc,	%o6,	%g2
	ldd	[%l7 + 0x68],	%f26
	ldsb	[%l7 + 0x65],	%i6
	fmovsge	%xcc,	%f23,	%f22
	fmovspos	%xcc,	%f14,	%f5
	fmovs	%f16,	%f0
	fmovdl	%xcc,	%f21,	%f6
	edge16ln	%o3,	%l2,	%i7
	edge32	%g6,	%l0,	%o7
	fmovdneg	%xcc,	%f12,	%f7
	fsrc1	%f30,	%f8
	xnorcc	%l6,	%g3,	%o0
	fmul8sux16	%f12,	%f10,	%f14
	save %g4, %l1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f4,	%f6,	%i2
	fnand	%f28,	%f8,	%f24
	nop
	set	0x56, %i5
	sth	%i3,	[%l7 + %i5]
	fmovrsgez	%o1,	%f26,	%f6
	edge32	%i1,	%g1,	%i0
	sethi	0x0079,	%g5
	movle	%xcc,	%l4,	%o4
	movne	%xcc,	%l3,	%o2
	fpack16	%f20,	%f18
	alignaddr	%o5,	%l5,	%g7
	fmovsl	%xcc,	%f25,	%f4
	udivx	%o6,	0x1AAE,	%g2
	fnor	%f30,	%f28,	%f8
	edge16	%i6,	%o3,	%i4
	udiv	%l2,	0x018A,	%g6
	sllx	%i7,	%o7,	%l6
	addc	%l0,	0x17FE,	%g3
	srl	%g4,	0x13,	%l1
	fmovdle	%icc,	%f4,	%f1
	movl	%xcc,	%i5,	%o0
	edge16n	%i3,	%o1,	%i1
	ldsw	[%l7 + 0x28],	%g1
	edge8n	%i0,	%g5,	%l4
	xnorcc	%i2,	%o4,	%o2
	addcc	%o5,	%l3,	%l5
	alignaddrl	%o6,	%g2,	%i6
	fnegs	%f26,	%f3
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	ldsh	[%l7 + 0x5C],	%l2
	array8	%i7,	%g6,	%o7
	add	%l0,	%g3,	%g4
	fcmps	%fcc0,	%f2,	%f5
	fmovdcs	%xcc,	%f13,	%f21
	movcc	%icc,	%l6,	%l1
	add	%o0,	0x0EBF,	%i5
	srlx	%i3,	%o1,	%i1
	sub	%g1,	%i0,	%g5
	and	%l4,	0x0E64,	%i2
	fpadd16s	%f5,	%f13,	%f28
	udivcc	%o4,	0x14D8,	%o5
	array16	%o2,	%l5,	%l3
	mulscc	%g2,	%i6,	%o3
	movrne	%o6,	0x120,	%i4
	edge8l	%g7,	%i7,	%l2
	fnands	%f11,	%f20,	%f13
	fmovscc	%xcc,	%f30,	%f10
	subcc	%g6,	0x1090,	%l0
	ldsw	[%l7 + 0x2C],	%g3
	fzeros	%f28
	fcmped	%fcc2,	%f14,	%f0
	edge16ln	%o7,	%l6,	%g4
	udivx	%l1,	0x1E77,	%o0
	sllx	%i3,	%i5,	%o1
	array32	%i1,	%g1,	%i0
	fmovse	%xcc,	%f30,	%f29
	xorcc	%l4,	0x09D2,	%g5
	sllx	%o4,	%o5,	%i2
	umul	%o2,	%l3,	%l5
	std	%f18,	[%l7 + 0x10]
	edge32n	%i6,	%g2,	%o6
	fors	%f8,	%f17,	%f18
	movcc	%icc,	%o3,	%g7
	orncc	%i4,	0x120E,	%i7
	edge32	%l2,	%l0,	%g3
	fsrc1	%f14,	%f8
	edge32l	%g6,	%l6,	%g4
	movvs	%xcc,	%o7,	%l1
	movl	%xcc,	%o0,	%i3
	fabss	%f15,	%f14
	fmovdl	%icc,	%f10,	%f21
	sdivx	%o1,	0x11B1,	%i1
	fpack16	%f10,	%f27
	fnegd	%f14,	%f28
	mulx	%i5,	%g1,	%i0
	fmovscc	%xcc,	%f20,	%f17
	stx	%l4,	[%l7 + 0x68]
	fcmpes	%fcc0,	%f21,	%f7
	xorcc	%o4,	0x0E3C,	%g5
	fcmps	%fcc0,	%f11,	%f4
	lduh	[%l7 + 0x3A],	%i2
	fmovdneg	%xcc,	%f19,	%f7
	udivx	%o2,	0x0072,	%o5
	restore %l3, 0x0EEE, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f2,	%f20
	fmovdvc	%icc,	%f15,	%f30
	save %l5, 0x0502, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g2,	%o3
	fpackfix	%f24,	%f25
	ldsw	[%l7 + 0x48],	%i4
	ldsw	[%l7 + 0x7C],	%g7
	mova	%icc,	%l2,	%i7
	fabsd	%f18,	%f0
	movcs	%icc,	%l0,	%g3
	sdivx	%g6,	0x1D9A,	%g4
	fpsub32	%f4,	%f30,	%f0
	sth	%l6,	[%l7 + 0x18]
	umul	%l1,	%o0,	%i3
	subc	%o1,	0x06E5,	%o7
	or	%i5,	0x1A2F,	%i1
	stb	%i0,	[%l7 + 0x41]
	andcc	%g1,	%l4,	%o4
	fmuld8sux16	%f31,	%f11,	%f14
	edge8	%g5,	%i2,	%o5
	sub	%o2,	%l3,	%i6
	movcc	%icc,	%o6,	%g2
	movge	%xcc,	%l5,	%i4
	srax	%o3,	%g7,	%l2
	movrne	%l0,	%i7,	%g6
	orncc	%g4,	0x1A8A,	%l6
	fmovspos	%xcc,	%f31,	%f2
	orn	%g3,	%l1,	%o0
	addcc	%o1,	%o7,	%i5
	fandnot2s	%f4,	%f30,	%f8
	nop
	set	0x48, %l0
	std	%f28,	[%l7 + %l0]
	edge32	%i1,	%i3,	%i0
	movrgz	%l4,	0x24B,	%g1
	ldd	[%l7 + 0x38],	%f18
	subccc	%o4,	%i2,	%g5
	edge8n	%o2,	%l3,	%o5
	fpackfix	%f20,	%f27
	fsrc1s	%f4,	%f23
	edge8ln	%i6,	%g2,	%o6
	sdivx	%i4,	0x1F42,	%l5
	array16	%o3,	%l2,	%l0
	edge32	%g7,	%i7,	%g4
	edge16n	%l6,	%g3,	%g6
	fpadd32	%f22,	%f16,	%f26
	fandnot2	%f14,	%f10,	%f20
	ldub	[%l7 + 0x33],	%l1
	movgu	%icc,	%o0,	%o1
	ldx	[%l7 + 0x40],	%o7
	fmovsneg	%icc,	%f24,	%f0
	movvc	%icc,	%i1,	%i5
	ldsb	[%l7 + 0x13],	%i3
	stw	%i0,	[%l7 + 0x34]
	subccc	%g1,	%l4,	%o4
	fmovrslez	%g5,	%f27,	%f2
	popc	0x0061,	%i2
	lduh	[%l7 + 0x2A],	%l3
	andcc	%o5,	%i6,	%g2
	fmovdle	%xcc,	%f4,	%f28
	movge	%xcc,	%o6,	%o2
	addccc	%i4,	%l5,	%o3
	ldx	[%l7 + 0x50],	%l2
	lduw	[%l7 + 0x6C],	%g7
	movl	%icc,	%i7,	%l0
	add	%g4,	0x0AF3,	%g3
	fmovsge	%icc,	%f4,	%f20
	movvs	%icc,	%l6,	%l1
	fpsub16	%f10,	%f4,	%f26
	stx	%o0,	[%l7 + 0x70]
	ldsw	[%l7 + 0x10],	%g6
	movrlz	%o7,	%o1,	%i1
	fcmps	%fcc1,	%f4,	%f6
	fmul8x16al	%f7,	%f0,	%f30
	addc	%i5,	0x03B2,	%i3
	mulx	%i0,	0x1D34,	%l4
	movrlez	%o4,	0x17C,	%g1
	xnorcc	%g5,	%i2,	%o5
	andcc	%i6,	0x010E,	%l3
	udivcc	%o6,	0x121A,	%g2
	movg	%xcc,	%i4,	%l5
	sdivcc	%o3,	0x091C,	%l2
	edge8l	%o2,	%g7,	%i7
	edge8ln	%l0,	%g3,	%l6
	fmovdcs	%xcc,	%f25,	%f10
	alignaddrl	%l1,	%g4,	%g6
	fnot2s	%f29,	%f1
	fmovsle	%icc,	%f22,	%f28
	sdivx	%o0,	0x118C,	%o1
	umulcc	%i1,	%i5,	%o7
	ldd	[%l7 + 0x60],	%f12
	movcc	%xcc,	%i0,	%i3
	fcmpne16	%f4,	%f0,	%o4
	subcc	%g1,	0x0A65,	%g5
	umul	%l4,	0x04BE,	%i2
	ldsb	[%l7 + 0x5B],	%o5
	edge8	%l3,	%o6,	%g2
	std	%f16,	[%l7 + 0x28]
	sll	%i4,	0x1D,	%i6
	edge32l	%o3,	%l5,	%l2
	orn	%o2,	%i7,	%g7
	srlx	%g3,	0x17,	%l0
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	fnegd	%f0,	%f8
	addcc	%o0,	%o1,	%i1
	fmovs	%f14,	%f6
	fmovsn	%xcc,	%f1,	%f21
	ldx	[%l7 + 0x50],	%i5
	fmovdle	%icc,	%f4,	%f27
	movrlz	%g6,	0x3A1,	%o7
	udivcc	%i0,	0x012A,	%o4
	edge16	%g1,	%g5,	%l4
	fcmpeq16	%f10,	%f10,	%i2
	fmovrdlez	%i3,	%f16,	%f24
	mova	%xcc,	%l3,	%o6
	orncc	%o5,	%g2,	%i4
	movge	%icc,	%o3,	%i6
	movrlez	%l5,	%l2,	%i7
	orncc	%g7,	%g3,	%l0
	stw	%l1,	[%l7 + 0x10]
	sdivx	%g4,	0x0B51,	%o2
	array32	%o0,	%o1,	%l6
	movg	%xcc,	%i5,	%i1
	edge32n	%o7,	%i0,	%o4
	ldsw	[%l7 + 0x24],	%g6
	fmovde	%icc,	%f7,	%f28
	subc	%g5,	0x1CE7,	%l4
	sra	%i2,	%g1,	%l3
	edge16ln	%o6,	%i3,	%g2
	srl	%i4,	0x12,	%o3
	addcc	%o5,	0x04D5,	%l5
	movle	%xcc,	%l2,	%i6
	fabss	%f1,	%f15
	addccc	%i7,	0x14E0,	%g7
	subccc	%g3,	0x1140,	%l0
	movrlez	%l1,	0x18B,	%g4
	ld	[%l7 + 0x4C],	%f20
	edge16ln	%o2,	%o0,	%l6
	movge	%icc,	%i5,	%i1
	sdivcc	%o1,	0x0C96,	%o7
	movre	%o4,	%g6,	%i0
	sra	%g5,	0x05,	%l4
	or	%i2,	%l3,	%g1
	ldsh	[%l7 + 0x1A],	%o6
	movrgz	%i3,	%i4,	%g2
	ld	[%l7 + 0x4C],	%f17
	or	%o5,	0x0748,	%l5
	addcc	%o3,	0x00DD,	%i6
	edge16l	%i7,	%g7,	%g3
	stb	%l2,	[%l7 + 0x7C]
	fmovrslez	%l0,	%f5,	%f6
	xnorcc	%l1,	%o2,	%g4
	ldsw	[%l7 + 0x6C],	%l6
	mova	%xcc,	%o0,	%i5
	ldub	[%l7 + 0x1A],	%i1
	xnor	%o7,	0x0DB0,	%o4
	movrgz	%o1,	0x1E4,	%g6
	ldsh	[%l7 + 0x3A],	%g5
	movn	%icc,	%i0,	%l4
	xnorcc	%l3,	%i2,	%o6
	addccc	%g1,	%i4,	%i3
	fandnot2	%f18,	%f12,	%f24
	alignaddr	%g2,	%l5,	%o3
	srax	%i6,	0x12,	%o5
	fmuld8sux16	%f13,	%f13,	%f26
	alignaddr	%g7,	%g3,	%l2
	fpackfix	%f20,	%f1
	std	%f24,	[%l7 + 0x70]
	nop
	set	0x59, %l3
	ldsb	[%l7 + %l3],	%l0
	movleu	%icc,	%l1,	%o2
	sra	%g4,	0x0C,	%i7
	movgu	%icc,	%o0,	%l6
	andn	%i1,	0x1894,	%i5
	st	%f5,	[%l7 + 0x1C]
	fmovsa	%icc,	%f18,	%f4
	andncc	%o4,	%o7,	%g6
	sdivcc	%g5,	0x1B26,	%o1
	udivcc	%l4,	0x0372,	%i0
	fpsub16s	%f17,	%f27,	%f14
	movre	%l3,	%o6,	%g1
	sdivcc	%i2,	0x0FEE,	%i3
	stx	%g2,	[%l7 + 0x30]
	srax	%i4,	%l5,	%o3
	movrgez	%i6,	0x13B,	%o5
	ldd	[%l7 + 0x70],	%f24
	ldub	[%l7 + 0x3D],	%g3
	ldd	[%l7 + 0x40],	%l2
	array32	%g7,	%l1,	%l0
	fmovsle	%icc,	%f21,	%f21
	sir	0x06F0
	add	%g4,	%o2,	%o0
	stw	%i7,	[%l7 + 0x5C]
	srlx	%l6,	%i5,	%i1
	array8	%o4,	%g6,	%g5
	ldd	[%l7 + 0x48],	%f12
	xnor	%o1,	0x0EAE,	%o7
	sth	%i0,	[%l7 + 0x54]
	alignaddr	%l3,	%o6,	%g1
	array32	%i2,	%i3,	%l4
	movgu	%xcc,	%i4,	%l5
	umulcc	%o3,	0x1AB0,	%g2
	udivcc	%i6,	0x0BA4,	%g3
	fcmple32	%f22,	%f6,	%l2
	sdivcc	%o5,	0x1567,	%g7
	stw	%l1,	[%l7 + 0x0C]
	stx	%g4,	[%l7 + 0x78]
	restore %l0, 0x1D0A, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x12],	%o2
	lduh	[%l7 + 0x30],	%l6
	nop
	set	0x74, %i6
	sth	%i5,	[%l7 + %i6]
	fandnot2	%f24,	%f20,	%f26
	sethi	0x0932,	%i1
	fmul8sux16	%f8,	%f20,	%f6
	xnorcc	%i7,	%g6,	%o4
	array32	%g5,	%o1,	%i0
	orn	%o7,	0x02C4,	%l3
	mova	%xcc,	%o6,	%i2
	movl	%icc,	%g1,	%l4
	addc	%i4,	0x093D,	%l5
	fone	%f20
	array32	%o3,	%g2,	%i6
	movleu	%xcc,	%i3,	%g3
	srl	%l2,	%o5,	%l1
	xor	%g7,	%g4,	%o0
	sth	%o2,	[%l7 + 0x08]
	mulscc	%l0,	%l6,	%i1
	or	%i7,	%g6,	%i5
	edge8	%o4,	%g5,	%o1
	movrlez	%o7,	0x305,	%l3
	std	%f14,	[%l7 + 0x18]
	smul	%o6,	0x1A55,	%i0
	andcc	%g1,	0x15D2,	%i2
	movg	%xcc,	%i4,	%l5
	fmovda	%xcc,	%f30,	%f17
	edge32n	%o3,	%g2,	%l4
	ldsw	[%l7 + 0x44],	%i3
	sethi	0x060C,	%i6
	fxor	%f16,	%f16,	%f12
	array8	%g3,	%l2,	%o5
	sub	%l1,	%g4,	%g7
	fmovsvc	%xcc,	%f12,	%f24
	movre	%o2,	0x236,	%o0
	nop
	set	0x50, %g5
	stx	%l0,	[%l7 + %g5]
	movpos	%xcc,	%i1,	%i7
	array16	%l6,	%g6,	%o4
	siam	0x7
	edge32ln	%g5,	%o1,	%i5
	ldub	[%l7 + 0x32],	%l3
	movcs	%xcc,	%o7,	%i0
	fsrc1	%f26,	%f0
	sllx	%o6,	%i2,	%i4
	edge32	%g1,	%l5,	%o3
	fmovscc	%icc,	%f18,	%f22
	lduh	[%l7 + 0x2E],	%g2
	or	%i3,	0x0255,	%l4
	edge8ln	%g3,	%i6,	%o5
	std	%f22,	[%l7 + 0x18]
	popc	%l2,	%l1
	andn	%g7,	0x11C8,	%o2
	save %o0, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%i6
	edge32	%l6,	%g6,	%o4
	xnor	%i1,	0x0560,	%o1
	std	%f18,	[%l7 + 0x50]
	smulcc	%g5,	%l3,	%o7
	udivcc	%i5,	0x16AF,	%i0
	movrgz	%o6,	%i2,	%g1
	srlx	%i4,	0x17,	%l5
	st	%f15,	[%l7 + 0x30]
	ldub	[%l7 + 0x36],	%g2
	sllx	%i3,	0x18,	%o3
	ldd	[%l7 + 0x18],	%f22
	movcs	%icc,	%g3,	%l4
	array32	%o5,	%i6,	%l1
	sethi	0x18C9,	%l2
	mova	%xcc,	%o2,	%o0
	std	%f4,	[%l7 + 0x08]
	and	%l0,	0x1294,	%g7
	movg	%xcc,	%i7,	%g4
	sub	%g6,	0x1226,	%l6
	std	%f22,	[%l7 + 0x70]
	fors	%f21,	%f27,	%f31
	edge16l	%o4,	%o1,	%i1
	ldd	[%l7 + 0x18],	%f4
	movcs	%icc,	%l3,	%g5
	movrgz	%i5,	0x28B,	%i0
	subcc	%o6,	0x01C0,	%i2
	movcc	%icc,	%o7,	%i4
	movcs	%icc,	%g1,	%g2
	fmovdg	%icc,	%f28,	%f25
	stb	%l5,	[%l7 + 0x6E]
	udivcc	%i3,	0x058F,	%o3
	fnegs	%f24,	%f26
	mulscc	%l4,	0x04BE,	%o5
	fpsub16	%f0,	%f16,	%f14
	and	%i6,	0x00BB,	%l1
	sllx	%l2,	%o2,	%g3
	movrgz	%o0,	%g7,	%i7
	array32	%l0,	%g4,	%l6
	movle	%icc,	%g6,	%o1
	movn	%icc,	%o4,	%l3
	sllx	%g5,	0x05,	%i5
	alignaddr	%i1,	%o6,	%i0
	fmovsleu	%xcc,	%f21,	%f7
	fmovrsne	%i2,	%f16,	%f10
	mulscc	%o7,	0x13A7,	%g1
	fcmple32	%f10,	%f6,	%g2
	fmul8x16au	%f10,	%f0,	%f18
	nop
	set	0x08, %l1
	std	%f12,	[%l7 + %l1]
	movl	%icc,	%i4,	%i3
	array16	%l5,	%l4,	%o3
	fnot1s	%f21,	%f12
	fnot2s	%f16,	%f1
	std	%f26,	[%l7 + 0x10]
	fornot1	%f30,	%f28,	%f16
	stb	%i6,	[%l7 + 0x4D]
	movre	%o5,	%l2,	%o2
	xorcc	%l1,	0x0C70,	%o0
	fmovsle	%xcc,	%f2,	%f1
	movl	%xcc,	%g7,	%i7
	and	%g3,	%l0,	%l6
	smulcc	%g4,	%g6,	%o1
	mulx	%o4,	%l3,	%i5
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	alignaddr	%o6,	%i2,	%o7
	sdivx	%i0,	0x0046,	%g2
	mulx	%g1,	0x1AF3,	%i3
	array32	%l5,	%i4,	%o3
	edge8	%i6,	%o5,	%l2
	sub	%o2,	0x188E,	%l4
	fmovrsgez	%o0,	%f2,	%f12
	movvs	%icc,	%g7,	%l1
	stw	%i7,	[%l7 + 0x14]
	udivx	%l0,	0x0AFC,	%g3
	fmovdneg	%icc,	%f26,	%f23
	fpadd32s	%f28,	%f5,	%f23
	xnor	%l6,	%g4,	%o1
	fmuld8sux16	%f22,	%f22,	%f4
	fmovdneg	%xcc,	%f3,	%f1
	ldd	[%l7 + 0x48],	%g6
	fpadd32s	%f3,	%f11,	%f16
	sra	%l3,	0x17,	%o4
	movrlez	%g5,	0x009,	%i1
	sth	%o6,	[%l7 + 0x58]
	array16	%i5,	%i2,	%o7
	fmovdvc	%icc,	%f8,	%f2
	edge8n	%g2,	%g1,	%i0
	addc	%l5,	%i4,	%i3
	fmovdne	%icc,	%f0,	%f29
	fpsub32	%f6,	%f22,	%f18
	orcc	%i6,	%o3,	%l2
	edge16n	%o5,	%l4,	%o0
	fornot1s	%f1,	%f31,	%f19
	fmovsvs	%xcc,	%f7,	%f14
	popc	%o2,	%g7
	andcc	%l1,	%l0,	%g3
	lduh	[%l7 + 0x64],	%l6
	save %i7, 0x17E4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g6,	%l3,	%o1
	sdiv	%g5,	0x0ED0,	%o4
	umul	%o6,	0x1E87,	%i1
	fnot1	%f16,	%f18
	udiv	%i2,	0x0535,	%i5
	movgu	%xcc,	%g2,	%o7
	movpos	%xcc,	%g1,	%i0
	movre	%l5,	0x154,	%i3
	fpackfix	%f22,	%f27
	move	%icc,	%i6,	%i4
	and	%o3,	0x143C,	%l2
	mova	%xcc,	%l4,	%o5
	edge8l	%o2,	%o0,	%g7
	edge16ln	%l0,	%g3,	%l6
	edge8n	%l1,	%g4,	%g6
	srlx	%l3,	0x03,	%o1
	movl	%icc,	%g5,	%i7
	movl	%icc,	%o4,	%i1
	lduh	[%l7 + 0x4C],	%i2
	ldd	[%l7 + 0x40],	%o6
	movvc	%xcc,	%i5,	%o7
	fands	%f23,	%f14,	%f14
	ldd	[%l7 + 0x68],	%g0
	ldsh	[%l7 + 0x30],	%i0
	st	%f27,	[%l7 + 0x6C]
	movg	%icc,	%g2,	%i3
	ldx	[%l7 + 0x10],	%l5
	fpadd32s	%f30,	%f26,	%f17
	stb	%i4,	[%l7 + 0x68]
	array32	%i6,	%l2,	%l4
	movrgez	%o5,	0x00B,	%o3
	sir	0x10FC
	movre	%o0,	%g7,	%o2
	sub	%l0,	%l6,	%g3
	srax	%g4,	%g6,	%l1
	movne	%xcc,	%o1,	%g5
	edge8n	%l3,	%i7,	%o4
	sethi	0x0D91,	%i2
	subcc	%i1,	0x1A67,	%i5
	edge32	%o6,	%g1,	%o7
	fmovscs	%icc,	%f2,	%f19
	fmovsl	%xcc,	%f18,	%f13
	movre	%g2,	%i0,	%i3
	srlx	%i4,	0x04,	%i6
	udivcc	%l2,	0x1C2C,	%l5
	sll	%o5,	0x14,	%l4
	xnorcc	%o0,	0x1205,	%o3
	andn	%o2,	%l0,	%g7
	movcs	%icc,	%l6,	%g3
	fmovrdlz	%g4,	%f4,	%f10
	fmovsneg	%icc,	%f22,	%f4
	save %l1, 0x1DD6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g5,	[%l7 + 0x68]
	movre	%l3,	%i7,	%g6
	umulcc	%o4,	0x12F1,	%i1
	ld	[%l7 + 0x3C],	%f9
	fmovrse	%i5,	%f13,	%f26
	subccc	%i2,	0x0098,	%g1
	fpack16	%f2,	%f27
	addc	%o7,	%o6,	%i0
	or	%i3,	%i4,	%g2
	edge16ln	%l2,	%l5,	%i6
	fmovdg	%icc,	%f20,	%f23
	sdiv	%o5,	0x0B05,	%o0
	fmovrdgez	%o3,	%f30,	%f0
	movne	%icc,	%l4,	%l0
	udiv	%g7,	0x0C26,	%o2
	edge8l	%l6,	%g3,	%l1
	addcc	%g4,	0x0619,	%o1
	nop
	set	0x0C, %o4
	lduw	[%l7 + %o4],	%l3
	movrlez	%g5,	0x3C9,	%i7
	edge32ln	%g6,	%o4,	%i5
	srl	%i2,	0x05,	%i1
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%g1
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%o7
	udiv	%o6,	0x00F1,	%i3
	fpsub32s	%f5,	%f20,	%f1
	movrlez	%i0,	0x1A9,	%i4
	orn	%l2,	%g2,	%l5
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%o5
	sth	%o0,	[%l7 + 0x4E]
	fmuld8sux16	%f22,	%f26,	%f28
	edge8n	%o3,	%l4,	%i6
	fnot2	%f20,	%f28
	movvs	%icc,	%g7,	%l0
	andncc	%l6,	%g3,	%l1
	edge32n	%o2,	%o1,	%l3
	fmovsl	%icc,	%f7,	%f31
	edge16n	%g4,	%i7,	%g6
	movcs	%icc,	%o4,	%g5
	sethi	0x1304,	%i5
	fmul8x16al	%f26,	%f10,	%f26
	fmovsvc	%icc,	%f6,	%f18
	sll	%i2,	0x11,	%i1
	fmovsgu	%icc,	%f29,	%f18
	ldd	[%l7 + 0x18],	%o6
	nop
	set	0x5C, %o3
	ldsh	[%l7 + %o3],	%o6
	fones	%f14
	edge8	%i3,	%g1,	%i4
	nop
	set	0x16, %i7
	ldsh	[%l7 + %i7],	%l2
	edge16l	%i0,	%l5,	%o5
	fsrc2	%f26,	%f16
	xnorcc	%o0,	0x0050,	%o3
	smulcc	%g2,	0x1457,	%i6
	edge16	%l4,	%g7,	%l6
	andcc	%l0,	0x1C63,	%l1
	array8	%g3,	%o1,	%l3
	fmovdge	%xcc,	%f24,	%f4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%g4
	fmovrdgez	%i7,	%f20,	%f4
	edge16ln	%o2,	%g6,	%o4
	ldsb	[%l7 + 0x71],	%i5
	smul	%i2,	0x05D7,	%g5
	subcc	%i1,	%o7,	%o6
	ldd	[%l7 + 0x50],	%f18
	fmovdg	%icc,	%f5,	%f13
	fmovdn	%xcc,	%f31,	%f25
	movl	%xcc,	%g1,	%i4
	umulcc	%i3,	0x01F8,	%l2
	smulcc	%l5,	%o5,	%i0
	movpos	%icc,	%o0,	%o3
	add	%i6,	%l4,	%g7
	edge8l	%g2,	%l0,	%l6
	edge16ln	%g3,	%o1,	%l1
	alignaddr	%g4,	%l3,	%o2
	ldub	[%l7 + 0x5A],	%i7
	save %o4, 0x0146, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x58],	%f18
	edge32	%g6,	%g5,	%i2
	array32	%o7,	%o6,	%i1
	movcc	%icc,	%g1,	%i3
	xorcc	%i4,	%l5,	%l2
	fxnors	%f14,	%f18,	%f27
	movrgez	%o5,	%i0,	%o0
	save %o3, %i6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l4,	%l0
	fmovsneg	%xcc,	%f7,	%f24
	array8	%l6,	%g3,	%g2
	movle	%xcc,	%l1,	%g4
	popc	0x0560,	%l3
	sllx	%o1,	0x16,	%o2
	sra	%o4,	%i7,	%g6
	ldsb	[%l7 + 0x4A],	%g5
	fmovsl	%icc,	%f29,	%f28
	movle	%icc,	%i2,	%o7
	movneg	%xcc,	%i5,	%o6
	ldsh	[%l7 + 0x46],	%i1
	movrgz	%g1,	%i3,	%i4
	add	%l2,	0x109C,	%o5
	array8	%i0,	%l5,	%o3
	add	%i6,	0x0303,	%g7
	sdiv	%o0,	0x1D33,	%l0
	fpsub16s	%f26,	%f19,	%f3
	fmovsne	%icc,	%f21,	%f14
	movvs	%xcc,	%l4,	%l6
	nop
	set	0x7A, %i0
	stb	%g3,	[%l7 + %i0]
	umul	%g2,	0x10DA,	%g4
	fnot2	%f26,	%f6
	stx	%l3,	[%l7 + 0x78]
	popc	0x11C8,	%o1
	addccc	%o2,	0x092B,	%o4
	fmovrsne	%l1,	%f13,	%f21
	movvc	%icc,	%g6,	%i7
	subc	%g5,	%o7,	%i5
	movcc	%icc,	%i2,	%i1
	udiv	%o6,	0x020F,	%g1
	fcmpes	%fcc2,	%f20,	%f8
	ldsb	[%l7 + 0x76],	%i4
	edge16n	%i3,	%l2,	%o5
	udiv	%l5,	0x0B14,	%o3
	edge32n	%i0,	%i6,	%o0
	edge16l	%l0,	%g7,	%l6
	fmovsle	%xcc,	%f0,	%f15
	fpackfix	%f2,	%f2
	edge16	%g3,	%l4,	%g2
	st	%f22,	[%l7 + 0x20]
	sllx	%l3,	0x03,	%o1
	fcmpne16	%f4,	%f22,	%o2
	movre	%o4,	%l1,	%g6
	edge8n	%g4,	%i7,	%o7
	array32	%g5,	%i5,	%i2
	movcs	%icc,	%i1,	%g1
	fabsd	%f16,	%f8
	subcc	%o6,	%i4,	%l2
	movleu	%xcc,	%o5,	%l5
	ld	[%l7 + 0x68],	%f9
	addccc	%i3,	0x02C6,	%o3
	fxors	%f15,	%f10,	%f13
	smul	%i0,	%i6,	%l0
	movrlz	%o0,	%l6,	%g7
	edge32l	%l4,	%g2,	%l3
	movvs	%icc,	%g3,	%o2
	movge	%xcc,	%o1,	%l1
	edge16l	%o4,	%g4,	%i7
	popc	%o7,	%g6
	fpadd16s	%f7,	%f12,	%f8
	or	%i5,	0x1B88,	%i2
	addccc	%g5,	0x0659,	%g1
	array8	%i1,	%o6,	%i4
	fmovsne	%xcc,	%f17,	%f12
	movrgez	%l2,	0x1C8,	%l5
	or	%i3,	%o5,	%o3
	movrlz	%i6,	0x305,	%l0
	edge8	%i0,	%o0,	%g7
	restore %l4, 0x1BED, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x3A],	%g2
	sdivcc	%g3,	0x0A38,	%l3
	udivx	%o2,	0x0CEA,	%o1
	edge8ln	%o4,	%l1,	%g4
	edge8	%o7,	%g6,	%i5
	stx	%i7,	[%l7 + 0x20]
	fmovrde	%i2,	%f12,	%f10
	movpos	%icc,	%g1,	%g5
	movvc	%xcc,	%o6,	%i1
	fmovde	%icc,	%f24,	%f2
	edge32n	%l2,	%l5,	%i3
	stw	%i4,	[%l7 + 0x0C]
	srax	%o5,	%o3,	%l0
	lduh	[%l7 + 0x1C],	%i6
	movvc	%icc,	%i0,	%o0
	ldub	[%l7 + 0x2F],	%g7
	movleu	%xcc,	%l4,	%l6
	alignaddrl	%g3,	%g2,	%l3
	ldsw	[%l7 + 0x24],	%o2
	fcmped	%fcc2,	%f26,	%f26
	sllx	%o4,	0x13,	%l1
	ldsb	[%l7 + 0x48],	%g4
	fmovdcs	%icc,	%f20,	%f23
	udivcc	%o7,	0x0973,	%g6
	movn	%icc,	%o1,	%i7
	edge16ln	%i2,	%i5,	%g5
	fmovspos	%xcc,	%f17,	%f1
	movrlz	%o6,	0x364,	%i1
	st	%f23,	[%l7 + 0x64]
	andcc	%g1,	0x14C5,	%l5
	andcc	%i3,	%i4,	%o5
	movn	%xcc,	%l2,	%o3
	fcmple16	%f14,	%f18,	%l0
	srax	%i0,	%o0,	%i6
	sth	%l4,	[%l7 + 0x32]
	sra	%g7,	%g3,	%g2
	movgu	%icc,	%l6,	%l3
	move	%icc,	%o2,	%l1
	udiv	%g4,	0x0A40,	%o7
	umulcc	%g6,	0x04F2,	%o4
	ldsh	[%l7 + 0x38],	%i7
	smul	%o1,	%i2,	%i5
	fxnor	%f12,	%f26,	%f16
	ldsh	[%l7 + 0x70],	%g5
	lduh	[%l7 + 0x40],	%o6
	stw	%i1,	[%l7 + 0x74]
	andn	%g1,	%l5,	%i3
	edge8n	%o5,	%l2,	%o3
	ldd	[%l7 + 0x30],	%l0
	addccc	%i0,	%i4,	%o0
	movl	%icc,	%l4,	%g7
	edge8n	%g3,	%g2,	%l6
	andncc	%l3,	%o2,	%i6
	movcs	%xcc,	%l1,	%g4
	sra	%o7,	%g6,	%i7
	fmovrsgz	%o1,	%f23,	%f5
	array16	%i2,	%i5,	%o4
	mova	%icc,	%g5,	%o6
	fmovrsgz	%g1,	%f29,	%f9
	fnot1	%f20,	%f10
	fcmpne16	%f12,	%f4,	%l5
	fmovspos	%icc,	%f29,	%f19
	movpos	%xcc,	%i3,	%i1
	fmovsvs	%xcc,	%f29,	%f20
	movcs	%icc,	%o5,	%o3
	smul	%l0,	%l2,	%i0
	movl	%xcc,	%i4,	%l4
	srlx	%g7,	0x02,	%o0
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%g3
	fands	%f31,	%f22,	%f20
	edge8ln	%g2,	%l6,	%o2
	xor	%i6,	0x15A2,	%l3
	addcc	%g4,	0x1F57,	%l1
	sdivx	%g6,	0x06C1,	%o7
	mova	%icc,	%i7,	%o1
	edge16ln	%i5,	%i2,	%o4
	sdivcc	%o6,	0x007F,	%g1
	edge16n	%g5,	%l5,	%i3
	movneg	%icc,	%i1,	%o3
	fsrc1s	%f31,	%f7
	fmovsg	%xcc,	%f26,	%f19
	sdiv	%o5,	0x1640,	%l2
	umulcc	%i0,	%l0,	%i4
	array8	%g7,	%o0,	%g3
	sdiv	%l4,	0x1B1B,	%g2
	smulcc	%o2,	0x0999,	%l6
	edge8l	%l3,	%i6,	%g4
	sethi	0x1F58,	%l1
	movgu	%xcc,	%o7,	%g6
	fmovdn	%xcc,	%f30,	%f28
	movrlz	%o1,	%i7,	%i5
	mulx	%o4,	0x1B6C,	%i2
	fpsub16s	%f16,	%f2,	%f5
	addccc	%o6,	%g1,	%g5
	fpsub32	%f28,	%f6,	%f2
	orncc	%l5,	0x0C3F,	%i1
	sth	%o3,	[%l7 + 0x36]
	smul	%o5,	0x0EEF,	%i3
	stx	%l2,	[%l7 + 0x78]
	movcs	%icc,	%l0,	%i0
	mova	%icc,	%g7,	%i4
	edge8l	%o0,	%l4,	%g2
	sllx	%g3,	%l6,	%o2
	alignaddr	%l3,	%g4,	%l1
	ldsw	[%l7 + 0x50],	%i6
	fzeros	%f6
	fmovsa	%icc,	%f30,	%f6
	array8	%o7,	%o1,	%i7
	fmovsgu	%icc,	%f18,	%f4
	movrgz	%g6,	0x05A,	%o4
	sra	%i2,	0x19,	%o6
	movrgez	%g1,	0x34E,	%i5
	edge8	%l5,	%i1,	%g5
	fmovdl	%xcc,	%f29,	%f13
	array8	%o3,	%i3,	%l2
	stx	%l0,	[%l7 + 0x30]
	movrne	%i0,	%o5,	%i4
	mulscc	%o0,	%l4,	%g7
	stb	%g2,	[%l7 + 0x63]
	fmovsge	%icc,	%f20,	%f21
	movvc	%xcc,	%l6,	%o2
	and	%g3,	0x0FEA,	%l3
	sethi	0x0773,	%g4
	orcc	%i6,	0x1449,	%o7
	fcmpd	%fcc2,	%f4,	%f16
	fmovrse	%l1,	%f10,	%f12
	edge32n	%o1,	%g6,	%i7
	sth	%i2,	[%l7 + 0x7C]
	movrlez	%o6,	0x026,	%g1
	andcc	%i5,	0x0BCB,	%o4
	fxors	%f15,	%f6,	%f28
	array8	%i1,	%g5,	%l5
	andn	%o3,	0x1F45,	%l2
	movrgz	%l0,	%i0,	%i3
	save %i4, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f9,	%f17
	array8	%o5,	%g2,	%g7
	and	%l6,	%o2,	%g3
	ldd	[%l7 + 0x48],	%l2
	fandnot1s	%f31,	%f19,	%f9
	umul	%g4,	0x1B4C,	%i6
	fmovse	%xcc,	%f25,	%f11
	fnors	%f14,	%f2,	%f30
	edge32l	%o7,	%l1,	%g6
	fnor	%f20,	%f8,	%f16
	movg	%icc,	%o1,	%i7
	smul	%i2,	0x1891,	%o6
	lduw	[%l7 + 0x18],	%i5
	edge8n	%g1,	%i1,	%g5
	fmovdn	%xcc,	%f17,	%f22
	edge8ln	%l5,	%o3,	%o4
	move	%icc,	%l2,	%i0
	movleu	%xcc,	%l0,	%i3
	or	%o0,	0x097E,	%l4
	ldsb	[%l7 + 0x2D],	%o5
	sllx	%i4,	0x02,	%g2
	andncc	%g7,	%o2,	%l6
	movrne	%g3,	0x390,	%g4
	ldsb	[%l7 + 0x1A],	%l3
	ld	[%l7 + 0x38],	%f3
	fornot1s	%f9,	%f28,	%f30
	fcmpd	%fcc0,	%f8,	%f18
	fmovd	%f20,	%f2
	sll	%o7,	0x1B,	%i6
	edge32l	%g6,	%l1,	%i7
	popc	0x1C93,	%o1
	std	%f24,	[%l7 + 0x58]
	addccc	%i2,	0x1A68,	%o6
	sll	%i5,	%g1,	%i1
	fmovsleu	%xcc,	%f26,	%f31
	ldsb	[%l7 + 0x1D],	%l5
	or	%g5,	%o4,	%l2
	sethi	0x1AE9,	%i0
	subccc	%o3,	0x1C7B,	%i3
	std	%f6,	[%l7 + 0x68]
	move	%icc,	%o0,	%l4
	alignaddr	%l0,	%i4,	%o5
	array8	%g2,	%g7,	%l6
	andcc	%g3,	%g4,	%o2
	std	%f24,	[%l7 + 0x60]
	movcs	%icc,	%l3,	%i6
	xnorcc	%o7,	%g6,	%l1
	subcc	%i7,	%o1,	%o6
	edge32	%i5,	%g1,	%i1
	movrgz	%l5,	%g5,	%o4
	fmovspos	%xcc,	%f0,	%f12
	movrne	%l2,	%i0,	%i2
	movne	%xcc,	%o3,	%i3
	andn	%o0,	%l4,	%l0
	orcc	%o5,	0x12B0,	%i4
	mova	%icc,	%g7,	%l6
	ldsw	[%l7 + 0x34],	%g2
	fnor	%f4,	%f30,	%f4
	movgu	%icc,	%g4,	%o2
	umul	%g3,	0x0CE1,	%l3
	edge8l	%i6,	%o7,	%l1
	subccc	%g6,	%o1,	%i7
	addc	%o6,	%i5,	%i1
	mova	%xcc,	%l5,	%g5
	udiv	%g1,	0x0465,	%l2
	movneg	%xcc,	%o4,	%i2
	array16	%i0,	%i3,	%o0
	addccc	%l4,	0x0E99,	%o3
	std	%f4,	[%l7 + 0x70]
	ldd	[%l7 + 0x50],	%f18
	udivcc	%l0,	0x0B56,	%o5
	edge8l	%g7,	%i4,	%l6
	sth	%g4,	[%l7 + 0x22]
	udivx	%o2,	0x136C,	%g3
	movre	%g2,	0x17E,	%l3
	xnorcc	%o7,	%i6,	%l1
	srax	%g6,	0x1A,	%i7
	movcs	%xcc,	%o6,	%i5
	ldsb	[%l7 + 0x65],	%o1
	edge16ln	%l5,	%g5,	%i1
	ldd	[%l7 + 0x38],	%l2
	movge	%icc,	%g1,	%i2
	movrlz	%o4,	0x18C,	%i3
	popc	0x18E5,	%i0
	mulscc	%l4,	0x068B,	%o0
	fmovdpos	%xcc,	%f29,	%f4
	movne	%xcc,	%o3,	%o5
	fcmpgt32	%f2,	%f16,	%l0
	srl	%i4,	%g7,	%l6
	move	%xcc,	%o2,	%g3
	movgu	%icc,	%g2,	%g4
	ldub	[%l7 + 0x20],	%o7
	sdiv	%i6,	0x08E8,	%l3
	movrgez	%l1,	%g6,	%i7
	movrlz	%i5,	0x065,	%o1
	alignaddrl	%o6,	%g5,	%i1
	fnot2	%f18,	%f8
	edge16ln	%l5,	%l2,	%g1
	fmovrde	%o4,	%f26,	%f4
	fcmpeq32	%f12,	%f10,	%i3
	movrgez	%i0,	%i2,	%l4
	lduh	[%l7 + 0x7A],	%o3
	orcc	%o0,	0x03D2,	%o5
	edge8n	%i4,	%l0,	%g7
	movn	%icc,	%o2,	%l6
	fmovsne	%xcc,	%f26,	%f7
	edge16n	%g3,	%g4,	%g2
	array16	%i6,	%l3,	%l1
	orncc	%o7,	0x04D7,	%g6
	lduw	[%l7 + 0x1C],	%i7
	and	%o1,	%o6,	%g5
	edge8	%i1,	%l5,	%i5
	save %g1, %o4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	smul	%o3,	0x16AD,	%o0
	fabsd	%f0,	%f8
	movn	%xcc,	%l4,	%o5
	xnorcc	%i4,	%g7,	%l0
	fnot1s	%f21,	%f28
	lduh	[%l7 + 0x54],	%l6
	movle	%xcc,	%g3,	%o2
	restore %g4, %i6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g2,	%o7,	%l1
	fmovsl	%icc,	%f8,	%f28
	edge32l	%i7,	%g6,	%o6
	or	%o1,	0x0CFB,	%i1
	movpos	%icc,	%l5,	%i5
	sir	0x0645
	movleu	%xcc,	%g1,	%o4
	movvc	%xcc,	%i3,	%g5
	or	%i2,	%i0,	%o3
	popc	%l2,	%o0
	movpos	%icc,	%l4,	%o5
	sethi	0x0B0E,	%i4
	edge32l	%g7,	%l6,	%l0
	fmovd	%f24,	%f6
	array16	%g3,	%o2,	%i6
	movrgez	%g4,	%l3,	%g2
	or	%o7,	0x1682,	%l1
	ldd	[%l7 + 0x68],	%g6
	fmovdpos	%xcc,	%f4,	%f29
	orncc	%i7,	0x11C7,	%o1
	udiv	%i1,	0x07C0,	%l5
	ldub	[%l7 + 0x29],	%i5
	sllx	%g1,	0x19,	%o4
	movge	%icc,	%o6,	%g5
	addccc	%i2,	%i3,	%i0
	stx	%o3,	[%l7 + 0x60]
	smulcc	%l2,	%l4,	%o0
	movn	%icc,	%i4,	%o5
	array32	%l6,	%l0,	%g7
	edge32ln	%g3,	%i6,	%g4
	fnors	%f27,	%f17,	%f29
	ldd	[%l7 + 0x18],	%l2
	udiv	%o2,	0x08FE,	%g2
	fmovsvs	%xcc,	%f16,	%f10
	alignaddr	%o7,	%l1,	%g6
	sethi	0x002E,	%i7
	sethi	0x194E,	%i1
	movg	%xcc,	%l5,	%o1
	movl	%xcc,	%g1,	%i5
	sra	%o4,	%g5,	%i2
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	edge16	%l2,	%o6,	%o0
	fmuld8ulx16	%f1,	%f27,	%f10
	subcc	%i4,	0x06CF,	%o5
	fmovdcc	%icc,	%f29,	%f26
	xorcc	%l6,	%l0,	%g7
	umulcc	%l4,	%g3,	%i6
	ldsh	[%l7 + 0x1A],	%l3
	fors	%f7,	%f17,	%f21
	fpadd16s	%f0,	%f9,	%f24
	movl	%xcc,	%g4,	%o2
	alignaddr	%o7,	%g2,	%g6
	fzero	%f2
	fabss	%f15,	%f6
	udivcc	%i7,	0x1BDA,	%l1
	alignaddr	%l5,	%i1,	%o1
	movrgz	%g1,	0x257,	%o4
	xnorcc	%i5,	%i2,	%i3
	smulcc	%i0,	0x0A13,	%g5
	alignaddrl	%l2,	%o6,	%o3
	sir	0x01A7
	edge32n	%i4,	%o0,	%l6
	fmovdge	%xcc,	%f31,	%f24
	mulscc	%o5,	%g7,	%l0
	sra	%g3,	0x0A,	%l4
	fmovsgu	%xcc,	%f24,	%f29
	movn	%xcc,	%i6,	%g4
	movge	%xcc,	%o2,	%l3
	fmovdvc	%xcc,	%f21,	%f23
	fmovrslz	%g2,	%f24,	%f9
	sra	%g6,	0x1C,	%o7
	movre	%l1,	%l5,	%i1
	orncc	%o1,	0x1581,	%g1
	fsrc2s	%f20,	%f19
	fcmpne32	%f22,	%f24,	%i7
	fxnors	%f25,	%f3,	%f14
	fmovrdne	%i5,	%f28,	%f24
	edge32	%i2,	%i3,	%o4
	movvc	%xcc,	%g5,	%i0
	fmul8ulx16	%f16,	%f28,	%f6
	lduw	[%l7 + 0x68],	%o6
	movneg	%xcc,	%l2,	%o3
	movcs	%xcc,	%o0,	%l6
	sub	%o5,	0x0F39,	%i4
	edge8	%g7,	%g3,	%l0
	xorcc	%i6,	0x02BC,	%g4
	udivcc	%l4,	0x1F16,	%l3
	srlx	%g2,	%g6,	%o2
	udiv	%l1,	0x0CD9,	%l5
	addccc	%i1,	%o1,	%o7
	for	%f2,	%f24,	%f16
	movleu	%icc,	%g1,	%i7
	fsrc1s	%f30,	%f29
	subccc	%i5,	0x1AF3,	%i2
	stb	%o4,	[%l7 + 0x4D]
	subccc	%i3,	0x0305,	%g5
	fmovsleu	%icc,	%f29,	%f18
	fors	%f15,	%f16,	%f15
	edge16l	%o6,	%l2,	%i0
	srl	%o0,	%o3,	%o5
	movrlz	%i4,	0x2F7,	%g7
	popc	0x01B1,	%l6
	fnor	%f20,	%f6,	%f24
	movleu	%icc,	%l0,	%g3
	fcmped	%fcc1,	%f2,	%f6
	smul	%g4,	%i6,	%l4
	fmuld8sux16	%f10,	%f20,	%f18
	ldsw	[%l7 + 0x4C],	%l3
	edge8ln	%g2,	%g6,	%l1
	orncc	%o2,	0x1667,	%l5
	orn	%i1,	%o7,	%o1
	movrgez	%g1,	0x25C,	%i5
	ldd	[%l7 + 0x48],	%i6
	ldsh	[%l7 + 0x18],	%o4
	fpadd16	%f8,	%f2,	%f4
	fmovdge	%icc,	%f15,	%f17
	fmovrdlz	%i2,	%f6,	%f14
	popc	%i3,	%g5
	fmovsgu	%icc,	%f10,	%f19
	fmul8sux16	%f16,	%f0,	%f2
	fsrc1s	%f18,	%f1
	movpos	%icc,	%o6,	%i0
	xnorcc	%l2,	0x0B49,	%o0
	srl	%o5,	0x14,	%o3
	fcmpes	%fcc1,	%f15,	%f3
	array8	%g7,	%i4,	%l6
	fmuld8ulx16	%f30,	%f13,	%f24
	popc	%l0,	%g4
	movn	%xcc,	%i6,	%l4
	sllx	%g3,	0x06,	%l3
	movge	%icc,	%g2,	%l1
	xnorcc	%g6,	0x1A70,	%l5
	sth	%o2,	[%l7 + 0x4C]
	fmovspos	%icc,	%f13,	%f26
	array16	%o7,	%i1,	%g1
	subccc	%o1,	0x1399,	%i7
	edge32l	%o4,	%i5,	%i3
	umul	%i2,	0x1E79,	%o6
	fors	%f27,	%f12,	%f1
	smulcc	%g5,	0x192E,	%i0
	edge32ln	%o0,	%o5,	%l2
	movvs	%icc,	%o3,	%g7
	move	%icc,	%i4,	%l6
	fsrc1	%f22,	%f28
	movvc	%xcc,	%l0,	%i6
	edge8n	%l4,	%g4,	%g3
	mova	%xcc,	%l3,	%l1
	movneg	%xcc,	%g6,	%l5
	smulcc	%o2,	0x1CF5,	%o7
	fmovsvc	%icc,	%f15,	%f30
	andn	%i1,	%g1,	%g2
	alignaddrl	%i7,	%o1,	%o4
	edge8	%i5,	%i3,	%i2
	movrlez	%g5,	0x097,	%i0
	fcmpes	%fcc0,	%f2,	%f19
	add	%o6,	%o0,	%l2
	sra	%o3,	0x15,	%g7
	fors	%f18,	%f24,	%f25
	mulx	%i4,	%o5,	%l6
	xnorcc	%l0,	%l4,	%i6
	fmovd	%f28,	%f6
	srax	%g4,	0x03,	%l3
	movvc	%icc,	%l1,	%g6
	sethi	0x0C78,	%g3
	fcmpeq16	%f20,	%f18,	%l5
	subc	%o7,	%i1,	%o2
	edge8n	%g2,	%i7,	%o1
	std	%f16,	[%l7 + 0x28]
	fpadd32	%f20,	%f0,	%f28
	xorcc	%g1,	%i5,	%o4
	edge16ln	%i3,	%i2,	%i0
	xnorcc	%o6,	0x12DF,	%g5
	edge16	%l2,	%o3,	%g7
	fnors	%f21,	%f31,	%f25
	mulx	%i4,	0x18C0,	%o0
	fmovsa	%icc,	%f8,	%f19
	fmovscs	%xcc,	%f20,	%f17
	mova	%icc,	%o5,	%l6
	andncc	%l4,	%i6,	%g4
	lduw	[%l7 + 0x08],	%l0
	stw	%l1,	[%l7 + 0x58]
	fmovrdgez	%l3,	%f22,	%f2
	movl	%icc,	%g6,	%l5
	edge8n	%g3,	%i1,	%o2
	fcmpgt16	%f10,	%f2,	%g2
	bshuffle	%f26,	%f20,	%f22
	fpsub16	%f10,	%f30,	%f16
	ldsb	[%l7 + 0x76],	%i7
	movvc	%icc,	%o1,	%o7
	ldsh	[%l7 + 0x4A],	%g1
	fmovdn	%xcc,	%f25,	%f12
	andn	%o4,	0x1C42,	%i5
	movne	%icc,	%i3,	%i0
	ldd	[%l7 + 0x78],	%f8
	edge32n	%o6,	%i2,	%g5
	fmovsleu	%xcc,	%f19,	%f14
	edge16n	%o3,	%g7,	%i4
	xnorcc	%o0,	%l2,	%o5
	fmovdpos	%xcc,	%f10,	%f15
	fmovsvc	%xcc,	%f3,	%f13
	sth	%l4,	[%l7 + 0x0E]
	andncc	%i6,	%l6,	%g4
	fmuld8sux16	%f1,	%f1,	%f28
	srlx	%l1,	%l3,	%g6
	movle	%xcc,	%l5,	%g3
	alignaddrl	%l0,	%o2,	%i1
	edge16n	%g2,	%i7,	%o1
	smulcc	%o7,	%g1,	%o4
	sub	%i3,	0x19BF,	%i5
	fmovdge	%xcc,	%f0,	%f13
	lduw	[%l7 + 0x6C],	%i0
	or	%i2,	%o6,	%g5
	fpsub16	%f24,	%f26,	%f26
	lduw	[%l7 + 0x40],	%o3
	edge16l	%g7,	%o0,	%l2
	fmovrslez	%o5,	%f20,	%f25
	movleu	%icc,	%i4,	%i6
	xorcc	%l4,	0x1131,	%l6
	srax	%g4,	%l3,	%g6
	bshuffle	%f14,	%f10,	%f22
	smul	%l5,	0x06C1,	%g3
	umul	%l0,	0x1575,	%l1
	smulcc	%i1,	%g2,	%i7
	fornot2	%f26,	%f14,	%f18
	movrlez	%o1,	0x160,	%o2
	umul	%o7,	%o4,	%g1
	fone	%f8
	fcmpne32	%f24,	%f14,	%i3
	move	%xcc,	%i5,	%i0
	movcc	%xcc,	%i2,	%g5
	ld	[%l7 + 0x14],	%f4
	ldx	[%l7 + 0x48],	%o6
	umulcc	%g7,	0x09F2,	%o0
	movneg	%xcc,	%l2,	%o3
	lduh	[%l7 + 0x78],	%o5
	ldub	[%l7 + 0x18],	%i6
	sll	%i4,	%l4,	%l6
	lduw	[%l7 + 0x24],	%l3
	andcc	%g4,	0x1ADA,	%l5
	addc	%g3,	%g6,	%l0
	sir	0x081E
	fcmpgt16	%f18,	%f6,	%l1
	fmovdl	%icc,	%f5,	%f5
	stx	%g2,	[%l7 + 0x38]
	nop
	set	0x6E, %l2
	ldsb	[%l7 + %l2],	%i1
	edge8n	%o1,	%i7,	%o2
	edge16n	%o7,	%o4,	%i3
	edge32ln	%i5,	%g1,	%i2
	addccc	%i0,	0x0118,	%g5
	fmovdge	%icc,	%f19,	%f19
	edge16ln	%o6,	%g7,	%o0
	fmovdge	%xcc,	%f31,	%f17
	movre	%l2,	%o3,	%i6
	fnot1	%f12,	%f14
	srl	%o5,	%i4,	%l4
	andncc	%l3,	%l6,	%g4
	edge32n	%g3,	%g6,	%l5
	fsrc1s	%f27,	%f10
	xnor	%l0,	%l1,	%i1
	stw	%o1,	[%l7 + 0x10]
	fmovd	%f6,	%f2
	stb	%i7,	[%l7 + 0x4E]
	orncc	%g2,	0x1A64,	%o2
	smulcc	%o4,	0x0378,	%i3
	lduw	[%l7 + 0x14],	%o7
	fsrc2s	%f20,	%f2
	edge16ln	%g1,	%i2,	%i5
	subccc	%i0,	%o6,	%g5
	fmul8x16au	%f28,	%f11,	%f20
	smul	%o0,	%l2,	%g7
	nop
	set	0x50, %g4
	stx	%i6,	[%l7 + %g4]
	addc	%o5,	0x0A8A,	%i4
	fmovrse	%l4,	%f21,	%f10
	std	%f12,	[%l7 + 0x58]
	movrlz	%l3,	0x0BC,	%l6
	fsrc2	%f28,	%f16
	movre	%g4,	0x2FB,	%g3
	orcc	%g6,	0x06CC,	%o3
	srax	%l0,	0x1D,	%l5
	fnor	%f6,	%f12,	%f12
	movrgez	%i1,	%l1,	%i7
	xor	%o1,	0x033C,	%o2
	ldsh	[%l7 + 0x72],	%o4
	array8	%i3,	%o7,	%g1
	xnorcc	%i2,	0x186C,	%i5
	sdiv	%g2,	0x1843,	%i0
	ldx	[%l7 + 0x38],	%g5
	for	%f20,	%f2,	%f30
	udivcc	%o6,	0x0B03,	%o0
	addc	%g7,	0x04FE,	%i6
	add	%o5,	%i4,	%l2
	array16	%l3,	%l6,	%l4
	fmuld8ulx16	%f6,	%f7,	%f0
	udivx	%g4,	0x0047,	%g3
	movrne	%o3,	0x2B8,	%g6
	lduw	[%l7 + 0x34],	%l5
	fmovdgu	%icc,	%f28,	%f14
	andcc	%l0,	0x1C86,	%i1
	movgu	%xcc,	%l1,	%i7
	fcmpeq32	%f0,	%f28,	%o2
	addcc	%o1,	0x0E45,	%o4
	movn	%xcc,	%i3,	%g1
	sdiv	%o7,	0x1AAD,	%i5
	fmovsleu	%icc,	%f24,	%f19
	movrlez	%i2,	0x041,	%i0
	edge16ln	%g5,	%g2,	%o0
	movgu	%xcc,	%o6,	%g7
	movcs	%icc,	%o5,	%i6
	edge8	%l2,	%l3,	%l6
	lduh	[%l7 + 0x1A],	%i4
	addcc	%l4,	%g3,	%o3
	fxnors	%f21,	%f16,	%f20
	fcmpd	%fcc3,	%f28,	%f8
	subc	%g4,	%l5,	%g6
	addc	%i1,	%l1,	%l0
	lduh	[%l7 + 0x60],	%i7
	addcc	%o1,	%o2,	%i3
	sdivcc	%g1,	0x0161,	%o7
	mulscc	%i5,	%o4,	%i0
	subccc	%g5,	%i2,	%g2
	lduw	[%l7 + 0x50],	%o0
	sir	0x0939
	restore %o6, 0x190C, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o5,	%l2,	%i6
	fmovsn	%xcc,	%f11,	%f6
	array32	%l6,	%i4,	%l4
	fcmpgt32	%f20,	%f2,	%g3
	fzeros	%f4
	movneg	%xcc,	%l3,	%o3
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	edge16	%l5,	%l0,	%i7
	sub	%l1,	0x0A11,	%o2
	smul	%i3,	0x1B29,	%o1
	movl	%xcc,	%g1,	%o7
	movrlez	%o4,	0x1F8,	%i5
	fcmple16	%f30,	%f30,	%i0
	fmovsneg	%xcc,	%f13,	%f4
	edge16ln	%g5,	%i2,	%g2
	sub	%o6,	0x0102,	%g7
	movvs	%xcc,	%o5,	%o0
	fmovrslez	%i6,	%f0,	%f24
	xnorcc	%l6,	%i4,	%l4
	andcc	%l2,	0x17F6,	%g3
	orcc	%o3,	%l3,	%g4
	ldx	[%l7 + 0x78],	%i1
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%g6
	edge16ln	%l5,	%l0,	%l1
	sir	0x11D4
	movvc	%xcc,	%i7,	%i3
	orn	%o1,	%g1,	%o2
	movcc	%icc,	%o7,	%o4
	sdivcc	%i0,	0x00F5,	%i5
	edge32ln	%i2,	%g2,	%g5
	movge	%xcc,	%g7,	%o5
	smulcc	%o0,	%i6,	%o6
	array32	%l6,	%l4,	%l2
	move	%xcc,	%i4,	%g3
	fcmpne32	%f30,	%f10,	%o3
	fmul8x16al	%f23,	%f15,	%f24
	fnot2s	%f10,	%f17
	ldx	[%l7 + 0x20],	%l3
	movvc	%icc,	%i1,	%g6
	ldsw	[%l7 + 0x1C],	%g4
	edge32n	%l5,	%l0,	%i7
	edge8l	%l1,	%o1,	%g1
	srax	%o2,	%i3,	%o4
	edge16l	%i0,	%i5,	%i2
	fmovsge	%icc,	%f12,	%f8
	sra	%o7,	%g5,	%g7
	stw	%o5,	[%l7 + 0x7C]
	movrgez	%g2,	%i6,	%o6
	and	%o0,	%l4,	%l2
	xnorcc	%i4,	%g3,	%o3
	movleu	%icc,	%l3,	%i1
	xorcc	%l6,	0x10D2,	%g6
	movcc	%xcc,	%g4,	%l0
	std	%f10,	[%l7 + 0x30]
	srl	%i7,	%l5,	%o1
	mova	%xcc,	%l1,	%g1
	fsrc2s	%f23,	%f20
	alignaddrl	%o2,	%i3,	%o4
	fmovsa	%icc,	%f4,	%f1
	fpadd16s	%f23,	%f23,	%f16
	movcs	%icc,	%i5,	%i2
	orncc	%i0,	%g5,	%o7
	xorcc	%o5,	%g2,	%g7
	srl	%i6,	0x0E,	%o6
	orn	%o0,	%l4,	%i4
	movge	%xcc,	%g3,	%o3
	udivx	%l2,	0x008E,	%l3
	sdivcc	%l6,	0x05A0,	%i1
	save %g6, %g4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x40, %g2
	stx	%i7,	[%l7 + %g2]
	edge8n	%o1,	%l1,	%g1
	fmovdgu	%xcc,	%f7,	%f15
	mulscc	%o2,	0x0868,	%i3
	movle	%icc,	%o4,	%l5
	fnors	%f18,	%f14,	%f4
	movvc	%xcc,	%i2,	%i0
	subcc	%i5,	0x1A36,	%g5
	subcc	%o7,	0x0046,	%o5
	fmovdvc	%icc,	%f30,	%f17
	fmovrdne	%g7,	%f28,	%f0
	subcc	%g2,	%o6,	%i6
	edge32	%l4,	%i4,	%g3
	save %o0, 0x0A9E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l3,	0x11A5,	%l6
	lduw	[%l7 + 0x10],	%l2
	bshuffle	%f10,	%f26,	%f8
	add	%g6,	0x14A9,	%i1
	fnor	%f4,	%f8,	%f24
	umulcc	%g4,	%l0,	%i7
	edge8l	%l1,	%o1,	%o2
	movg	%icc,	%g1,	%i3
	movne	%xcc,	%o4,	%l5
	fornot1s	%f6,	%f9,	%f14
	srax	%i2,	%i0,	%g5
	addccc	%i5,	0x1E6F,	%o5
	andncc	%o7,	%g7,	%o6
	st	%f1,	[%l7 + 0x64]
	fnor	%f20,	%f24,	%f2
	movrgez	%g2,	0x011,	%l4
	udivx	%i6,	0x118E,	%g3
	andn	%o0,	%o3,	%l3
	std	%f30,	[%l7 + 0x60]
	movl	%xcc,	%i4,	%l2
	ldd	[%l7 + 0x38],	%i6
	ldsw	[%l7 + 0x4C],	%g6
	edge8ln	%g4,	%i1,	%l0
	array8	%l1,	%o1,	%o2
	movcs	%icc,	%i7,	%i3
	fmovdcc	%xcc,	%f18,	%f24
	movvc	%icc,	%g1,	%o4
	srax	%l5,	%i0,	%g5
	movge	%icc,	%i5,	%o5
	subcc	%i2,	0x16E6,	%g7
	xor	%o7,	%g2,	%o6
	fnot1	%f22,	%f22
	fnegd	%f2,	%f28
	udiv	%l4,	0x177B,	%g3
	fmuld8ulx16	%f21,	%f23,	%f16
	fcmpgt32	%f16,	%f14,	%o0
	ldx	[%l7 + 0x50],	%i6
	edge8l	%o3,	%i4,	%l3
	andncc	%l6,	%l2,	%g4
	sra	%g6,	%l0,	%i1
	movpos	%icc,	%l1,	%o2
	movrgz	%o1,	%i7,	%i3
	fmovrdlez	%o4,	%f22,	%f14
	move	%xcc,	%l5,	%i0
	fcmpne32	%f20,	%f2,	%g1
	lduh	[%l7 + 0x58],	%i5
	xor	%g5,	%i2,	%g7
	sdivcc	%o7,	0x0399,	%o5
	movleu	%icc,	%o6,	%l4
	movleu	%xcc,	%g3,	%o0
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%i6
	fmul8ulx16	%f24,	%f0,	%f22
	fzeros	%f20
	sll	%o3,	%i4,	%l3
	movre	%g2,	0x18B,	%l6
	fcmpeq16	%f22,	%f26,	%l2
	umul	%g4,	0x11A4,	%l0
	edge8	%g6,	%l1,	%o2
	movge	%xcc,	%o1,	%i7
	array8	%i1,	%i3,	%o4
	andn	%l5,	%g1,	%i0
	edge8ln	%g5,	%i2,	%i5
	fornot1	%f28,	%f18,	%f16
	edge32l	%o7,	%g7,	%o6
	udivcc	%o5,	0x0C23,	%l4
	edge8ln	%o0,	%g3,	%o3
	edge16l	%i6,	%i4,	%l3
	movrgz	%g2,	%l2,	%g4
	edge8ln	%l6,	%g6,	%l0
	fmovsl	%icc,	%f13,	%f19
	srl	%l1,	0x0D,	%o1
	srl	%i7,	0x09,	%i1
	orcc	%i3,	0x17C2,	%o4
	fmovrdgez	%l5,	%f20,	%f26
	movne	%xcc,	%o2,	%i0
	fcmpeq16	%f12,	%f24,	%g5
	fcmpne16	%f30,	%f28,	%i2
	fmovsn	%xcc,	%f30,	%f13
	edge8n	%i5,	%o7,	%g7
	fpadd16s	%f5,	%f5,	%f16
	srlx	%g1,	%o6,	%l4
	edge8l	%o0,	%g3,	%o5
	umulcc	%i6,	%o3,	%l3
	smulcc	%i4,	%g2,	%g4
	array8	%l6,	%l2,	%g6
	ldsb	[%l7 + 0x75],	%l0
	mulx	%o1,	0x03BD,	%l1
	st	%f17,	[%l7 + 0x28]
	xnor	%i1,	0x0BB6,	%i3
	fmovsl	%xcc,	%f12,	%f22
	nop
	set	0x6C, %o2
	lduh	[%l7 + %o2],	%o4
	popc	0x0EC7,	%l5
	smulcc	%i7,	%i0,	%o2
	ldx	[%l7 + 0x40],	%i2
	and	%g5,	0x1656,	%i5
	orncc	%o7,	0x18EE,	%g1
	alignaddr	%o6,	%l4,	%o0
	edge16	%g7,	%o5,	%g3
	movrne	%i6,	0x381,	%o3
	std	%f8,	[%l7 + 0x10]
	fandnot1	%f0,	%f10,	%f28
	srl	%i4,	0x09,	%l3
	edge16n	%g4,	%g2,	%l2
	udivx	%l6,	0x1611,	%g6
	edge8n	%l0,	%o1,	%l1
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%i2
	xnorcc	%i1,	%o4,	%l5
	movgu	%xcc,	%i0,	%i7
	edge32ln	%o2,	%g5,	%i5
	mova	%icc,	%o7,	%g1
	sllx	%i2,	0x13,	%l4
	fmovrdlz	%o0,	%f2,	%f2
	sub	%o6,	%o5,	%g7
	edge16n	%g3,	%i6,	%i4
	mulscc	%o3,	%l3,	%g2
	fmovsgu	%xcc,	%f15,	%f12
	udiv	%l2,	0x16CD,	%g4
	movvs	%icc,	%l6,	%l0
	fones	%f17
	orn	%o1,	%g6,	%i3
	fnot1s	%f15,	%f7
	fand	%f4,	%f4,	%f24
	fmovdle	%icc,	%f25,	%f18
	xor	%i1,	%o4,	%l1
	edge32	%i0,	%i7,	%l5
	edge8l	%o2,	%i5,	%o7
	movvc	%xcc,	%g1,	%i2
	addc	%l4,	%o0,	%g5
	orn	%o5,	0x1213,	%g7
	smulcc	%g3,	%o6,	%i4
	udivx	%o3,	0x0E8A,	%l3
	subccc	%i6,	0x1294,	%g2
	subc	%l2,	%l6,	%g4
	fmul8x16au	%f13,	%f28,	%f28
	smulcc	%l0,	%o1,	%g6
	edge16l	%i1,	%i3,	%l1
	restore %o4, %i0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%xcc,	%f25,	%f1
	edge32n	%o2,	%i7,	%o7
	for	%f8,	%f30,	%f10
	udiv	%g1,	0x12AF,	%i2
	orn	%i5,	%o0,	%l4
	and	%o5,	%g5,	%g3
	edge8l	%o6,	%i4,	%g7
	sdivcc	%o3,	0x123E,	%i6
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	movle	%xcc,	%l6,	%l0
	fmovrslez	%o1,	%f4,	%f9
	edge16	%g4,	%g6,	%i3
	srax	%l1,	%o4,	%i0
	stw	%i1,	[%l7 + 0x10]
	edge32l	%o2,	%i7,	%o7
	movrlez	%l5,	0x26F,	%i2
	sethi	0x0713,	%g1
	movvs	%icc,	%o0,	%i5
	movvc	%xcc,	%o5,	%g5
	nop
	set	0x28, %l4
	lduw	[%l7 + %l4],	%g3
	sethi	0x0290,	%o6
	fcmpes	%fcc0,	%f4,	%f25
	srlx	%l4,	%g7,	%i4
	movleu	%icc,	%i6,	%g2
	ld	[%l7 + 0x1C],	%f15
	movrne	%l2,	%o3,	%l3
	sra	%l6,	%l0,	%o1
	movne	%xcc,	%g6,	%i3
	and	%g4,	0x0E93,	%l1
	movvc	%xcc,	%i0,	%o4
	mulscc	%o2,	0x0BC7,	%i1
	edge32ln	%o7,	%l5,	%i7
	alignaddrl	%g1,	%o0,	%i5
	fsrc2	%f26,	%f12
	fpsub32	%f28,	%f0,	%f8
	movgu	%xcc,	%o5,	%i2
	mulx	%g3,	0x024A,	%g5
	sll	%l4,	%g7,	%i4
	edge16l	%o6,	%g2,	%l2
	movrgz	%o3,	%l3,	%l6
	edge16	%l0,	%o1,	%i6
	save %i3, 0x1EC5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g6,	0x0FDD,	%l1
	edge16l	%o4,	%o2,	%i1
	ldsw	[%l7 + 0x10],	%o7
	sllx	%i0,	0x10,	%l5
	mulx	%i7,	%g1,	%i5
	fmovsvc	%icc,	%f19,	%f9
	udivcc	%o0,	0x0C13,	%o5
	xnor	%i2,	0x148A,	%g3
	or	%l4,	%g7,	%i4
	sth	%g5,	[%l7 + 0x14]
	fnand	%f30,	%f14,	%f20
	stx	%g2,	[%l7 + 0x50]
	fmovdn	%xcc,	%f11,	%f30
	stx	%o6,	[%l7 + 0x58]
	faligndata	%f10,	%f22,	%f18
	edge32	%l2,	%o3,	%l6
	restore %l0, 0x0473, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x14],	%o1
	ldub	[%l7 + 0x7E],	%i6
	alignaddrl	%i3,	%g4,	%g6
	umulcc	%l1,	0x0D1C,	%o2
	movpos	%xcc,	%i1,	%o7
	fpadd16s	%f20,	%f1,	%f11
	movleu	%xcc,	%o4,	%i0
	smulcc	%l5,	0x0D4E,	%g1
	sub	%i7,	0x170C,	%o0
	edge16ln	%o5,	%i2,	%g3
	st	%f2,	[%l7 + 0x40]
	fmovsle	%icc,	%f25,	%f0
	movcs	%xcc,	%i5,	%l4
	popc	%g7,	%i4
	movleu	%xcc,	%g2,	%g5
	array32	%o6,	%l2,	%o3
	save %l0, %l6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f6,	%f12
	edge16	%l3,	%i3,	%i6
	edge8l	%g6,	%l1,	%o2
	mulx	%g4,	0x0592,	%i1
	subccc	%o4,	0x18D5,	%o7
	sra	%i0,	0x0A,	%g1
	lduh	[%l7 + 0x64],	%i7
	fnot1	%f6,	%f14
	move	%xcc,	%l5,	%o5
	st	%f31,	[%l7 + 0x48]
	movre	%i2,	%o0,	%g3
	movle	%xcc,	%l4,	%i5
	subccc	%i4,	0x09EC,	%g7
	mulx	%g5,	%o6,	%g2
	movvc	%xcc,	%o3,	%l2
	edge32	%l6,	%l0,	%l3
	movcc	%xcc,	%o1,	%i3
	sdiv	%g6,	0x11ED,	%i6
	fmul8x16au	%f26,	%f30,	%f30
	edge32ln	%o2,	%l1,	%i1
	fornot1	%f0,	%f6,	%f12
	edge16	%g4,	%o4,	%i0
	sllx	%g1,	0x09,	%o7
	array32	%i7,	%o5,	%l5
	movne	%xcc,	%o0,	%g3
	movl	%xcc,	%l4,	%i2
	save %i4, 0x1025, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g5,	0x09A0,	%o6
	ldd	[%l7 + 0x38],	%f26
	subc	%g7,	0x17DA,	%g2
	srl	%l2,	%o3,	%l0
	stx	%l3,	[%l7 + 0x48]
	std	%f26,	[%l7 + 0x10]
	movleu	%xcc,	%l6,	%i3
	edge16l	%g6,	%i6,	%o2
	ldd	[%l7 + 0x28],	%f8
	sdiv	%l1,	0x1A5C,	%i1
	fsrc1s	%f24,	%f9
	andcc	%g4,	0x027A,	%o1
	orcc	%o4,	%i0,	%o7
	movrgz	%i7,	%g1,	%o5
	sir	0x0307
	alignaddr	%o0,	%l5,	%l4
	fmovrsgz	%i2,	%f16,	%f23
	fcmped	%fcc1,	%f20,	%f20
	move	%icc,	%g3,	%i4
	sll	%g5,	%o6,	%g7
	udiv	%i5,	0x146B,	%l2
	movrgez	%o3,	0x367,	%l0
	fpack16	%f0,	%f12
	sethi	0x0DAC,	%g2
	movn	%icc,	%l3,	%l6
	array32	%g6,	%i6,	%i3
	sdivx	%l1,	0x1692,	%o2
	edge32n	%g4,	%o1,	%o4
	mulscc	%i1,	0x0388,	%o7
	array32	%i0,	%i7,	%g1
	umulcc	%o5,	%l5,	%l4
	ldd	[%l7 + 0x08],	%o0
	orn	%i2,	0x0032,	%g3
	sub	%i4,	0x0094,	%g5
	addc	%o6,	0x05C4,	%i5
	andncc	%l2,	%o3,	%l0
	fnot2	%f16,	%f16
	ldsb	[%l7 + 0x28],	%g7
	fpsub32	%f6,	%f12,	%f28
	mova	%xcc,	%g2,	%l6
	popc	%g6,	%l3
	lduh	[%l7 + 0x12],	%i6
	edge32	%i3,	%l1,	%g4
	edge32n	%o1,	%o2,	%i1
	stx	%o7,	[%l7 + 0x48]
	mova	%icc,	%i0,	%i7
	ldd	[%l7 + 0x38],	%f8
	fmuld8ulx16	%f27,	%f7,	%f30
	movg	%xcc,	%o4,	%g1
	ldub	[%l7 + 0x67],	%o5
	movg	%xcc,	%l4,	%o0
	std	%f0,	[%l7 + 0x18]
	st	%f23,	[%l7 + 0x64]
	movrlz	%i2,	0x28B,	%l5
	xnorcc	%i4,	0x15D3,	%g3
	xnorcc	%g5,	0x17F8,	%o6
	movn	%icc,	%l2,	%i5
	xnorcc	%o3,	%g7,	%l0
	sir	0x0773
	movl	%xcc,	%g2,	%l6
	movg	%xcc,	%l3,	%g6
	udiv	%i6,	0x1A98,	%i3
	fmovs	%f2,	%f16
	mova	%icc,	%g4,	%o1
	addc	%o2,	0x1064,	%i1
	movleu	%icc,	%l1,	%i0
	edge16n	%o7,	%o4,	%g1
	alignaddrl	%o5,	%l4,	%o0
	st	%f6,	[%l7 + 0x08]
	array8	%i2,	%l5,	%i7
	fmovsl	%xcc,	%f25,	%f2
	add	%i4,	0x1D65,	%g5
	fmuld8sux16	%f24,	%f30,	%f12
	fzeros	%f21
	movgu	%xcc,	%g3,	%o6
	movre	%l2,	%i5,	%g7
	fabsd	%f10,	%f8
	fmovsle	%xcc,	%f22,	%f1
	movg	%icc,	%l0,	%g2
	fcmple32	%f24,	%f24,	%o3
	sll	%l3,	%g6,	%i6
	edge32l	%l6,	%i3,	%g4
	movrlz	%o2,	0x374,	%i1
	pdist	%f20,	%f18,	%f2
	fmovrdlez	%o1,	%f24,	%f6
	ldsw	[%l7 + 0x10],	%l1
	ldub	[%l7 + 0x63],	%i0
	fxors	%f11,	%f15,	%f13
	save %o4, %o7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x08],	%g1
	movvc	%icc,	%l4,	%i2
	udiv	%o0,	0x0BD8,	%i7
	orn	%i4,	%l5,	%g5
	fmovsgu	%icc,	%f12,	%f25
	stx	%o6,	[%l7 + 0x38]
	movrne	%g3,	0x290,	%i5
	add	%g7,	0x1176,	%l2
	sub	%l0,	0x0138,	%g2
	alignaddrl	%l3,	%o3,	%g6
	ld	[%l7 + 0x68],	%f10
	edge8ln	%l6,	%i3,	%g4
	fcmped	%fcc2,	%f12,	%f10
	movneg	%icc,	%i6,	%o2
	movn	%icc,	%o1,	%l1
	movl	%icc,	%i1,	%o4
	edge32n	%o7,	%o5,	%i0
	xor	%l4,	0x1C8D,	%g1
	stx	%o0,	[%l7 + 0x50]
	fmovdn	%icc,	%f7,	%f17
	stb	%i7,	[%l7 + 0x68]
	fmovs	%f11,	%f12
	edge16	%i4,	%l5,	%g5
	fones	%f27
	st	%f5,	[%l7 + 0x64]
	array8	%o6,	%i2,	%i5
	umulcc	%g3,	%l2,	%g7
	movneg	%icc,	%l0,	%l3
	movvs	%xcc,	%o3,	%g6
	fpsub16	%f18,	%f24,	%f24
	alignaddrl	%g2,	%l6,	%i3
	fxnor	%f8,	%f22,	%f28
	ld	[%l7 + 0x20],	%f23
	andncc	%g4,	%i6,	%o1
	smulcc	%l1,	%i1,	%o2
	udivx	%o7,	0x010B,	%o4
	xor	%o5,	0x1328,	%i0
	edge8l	%g1,	%l4,	%o0
	srl	%i4,	0x02,	%l5
	srlx	%g5,	0x08,	%o6
	srax	%i7,	0x17,	%i5
	ldd	[%l7 + 0x28],	%g2
	fcmpes	%fcc2,	%f21,	%f18
	edge8	%i2,	%g7,	%l2
	fexpand	%f29,	%f24
	fmovsneg	%xcc,	%f19,	%f3
	stw	%l0,	[%l7 + 0x4C]
	udivx	%o3,	0x1412,	%l3
	movleu	%xcc,	%g2,	%g6
	movl	%xcc,	%l6,	%g4
	addcc	%i3,	0x0C02,	%i6
	array8	%l1,	%i1,	%o1
	mova	%xcc,	%o7,	%o2
	andn	%o5,	0x0B92,	%o4
	sra	%i0,	%g1,	%o0
	movn	%xcc,	%l4,	%l5
	ldsh	[%l7 + 0x70],	%g5
	movre	%o6,	0x0BE,	%i7
	fmovdcs	%icc,	%f22,	%f3
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	save %i2, %g7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g3,	%l0,	%o3
	fmul8x16	%f29,	%f28,	%f16
	fmovsgu	%icc,	%f0,	%f31
	movg	%icc,	%l3,	%g6
	movcs	%xcc,	%g2,	%l6
	sll	%g4,	0x1B,	%i6
	fsrc1s	%f17,	%f14
	andn	%i3,	0x112C,	%l1
	udivx	%o1,	0x08A1,	%o7
	edge32n	%i1,	%o5,	%o2
	orncc	%o4,	0x1A17,	%g1
	srax	%o0,	%i0,	%l5
	stx	%g5,	[%l7 + 0x70]
	sra	%l4,	%o6,	%i5
	fmovdn	%icc,	%f4,	%f22
	sdivx	%i7,	0x0062,	%i2
	fmovdn	%xcc,	%f12,	%f18
	fpack16	%f8,	%f12
	lduw	[%l7 + 0x0C],	%i4
	sllx	%g7,	0x07,	%l2
	sra	%l0,	0x16,	%g3
	array32	%o3,	%l3,	%g2
	fmovdvc	%icc,	%f3,	%f11
	sdivcc	%g6,	0x0B10,	%g4
	edge32n	%i6,	%l6,	%i3
	std	%f30,	[%l7 + 0x30]
	ldub	[%l7 + 0x27],	%o1
	fmovrslez	%o7,	%f6,	%f17
	ldub	[%l7 + 0x74],	%i1
	fpadd16	%f30,	%f16,	%f30
	sth	%l1,	[%l7 + 0x1C]
	andn	%o5,	0x0630,	%o2
	ldx	[%l7 + 0x78],	%g1
	xor	%o0,	%i0,	%l5
	add	%o4,	0x0641,	%g5
	fmovdle	%icc,	%f17,	%f0
	fmovdn	%icc,	%f5,	%f22
	movne	%icc,	%l4,	%o6
	fsrc1	%f6,	%f24
	stx	%i5,	[%l7 + 0x50]
	ldub	[%l7 + 0x5E],	%i7
	fandnot1s	%f5,	%f5,	%f15
	array8	%i2,	%i4,	%g7
	ldub	[%l7 + 0x5B],	%l2
	movvs	%icc,	%l0,	%o3
	edge16l	%g3,	%l3,	%g2
	fornot1	%f18,	%f26,	%f4
	sth	%g6,	[%l7 + 0x2E]
	alignaddr	%i6,	%l6,	%g4
	alignaddrl	%i3,	%o1,	%o7
	smulcc	%l1,	%o5,	%o2
	nop
	set	0x7C, %i2
	sth	%g1,	[%l7 + %i2]
	or	%i1,	0x04C8,	%i0
	fabss	%f2,	%f0
	movrgz	%o0,	%l5,	%o4
	sdivx	%g5,	0x0FEE,	%l4
	lduh	[%l7 + 0x5C],	%i5
	ldsh	[%l7 + 0x2A],	%o6
	st	%f3,	[%l7 + 0x4C]
	sethi	0x0B9D,	%i2
	fnot1s	%f13,	%f26
	edge32	%i7,	%i4,	%g7
	subc	%l0,	%l2,	%g3
	xorcc	%l3,	%o3,	%g6
	ldsw	[%l7 + 0x1C],	%i6
	fcmpeq32	%f4,	%f26,	%l6
	add	%g4,	0x1525,	%i3
	restore %o1, 0x144E, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc1,	%f18,	%f8
	fones	%f7
	ldsw	[%l7 + 0x7C],	%l1
	edge32l	%o5,	%g2,	%g1
	fones	%f11
	edge32l	%o2,	%i1,	%o0
	lduh	[%l7 + 0x3C],	%i0
	sdiv	%o4,	0x06C4,	%l5
	orcc	%l4,	%g5,	%i5
	fmul8x16al	%f0,	%f22,	%f8
	fnot1s	%f10,	%f10
	srl	%o6,	0x10,	%i2
	save %i7, 0x05AB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x3C],	%l0
	fpadd32s	%f5,	%f23,	%f8
	addc	%g7,	0x149D,	%g3
	movleu	%xcc,	%l2,	%o3
	sra	%g6,	%i6,	%l6
	sdivcc	%l3,	0x1E82,	%g4
	bshuffle	%f10,	%f12,	%f20
	fcmpne32	%f14,	%f14,	%i3
	fzero	%f4
	fmovrde	%o1,	%f20,	%f14
	sir	0x17CB
	fsrc2s	%f24,	%f2
	fors	%f30,	%f9,	%f3
	movne	%xcc,	%l1,	%o5
	movleu	%icc,	%g2,	%g1
	movne	%xcc,	%o7,	%i1
	fmovscs	%icc,	%f10,	%f11
	sdivx	%o2,	0x0E6F,	%i0
	movleu	%icc,	%o4,	%o0
	fpackfix	%f24,	%f26
	edge16n	%l5,	%l4,	%i5
	fcmpeq16	%f4,	%f0,	%o6
	edge8n	%i2,	%i7,	%g5
	orncc	%i4,	0x1176,	%l0
	stx	%g3,	[%l7 + 0x40]
	sdivcc	%g7,	0x1E73,	%l2
	subccc	%g6,	0x1585,	%o3
	udivcc	%i6,	0x073B,	%l6
	fxnors	%f18,	%f27,	%f3
	ldsh	[%l7 + 0x26],	%g4
	movl	%icc,	%l3,	%o1
	mulscc	%l1,	%i3,	%o5
	ldx	[%l7 + 0x08],	%g2
	ldx	[%l7 + 0x20],	%o7
	fmovspos	%icc,	%f18,	%f23
	or	%g1,	0x0473,	%i1
	srax	%i0,	0x15,	%o4
	movrgz	%o0,	0x30F,	%o2
	pdist	%f24,	%f24,	%f22
	ldx	[%l7 + 0x30],	%l5
	addcc	%l4,	0x1342,	%i5
	edge32	%o6,	%i7,	%i2
	edge8n	%g5,	%l0,	%g3
	subcc	%g7,	0x1150,	%i4
	popc	%g6,	%o3
	edge8	%l2,	%i6,	%l6
	sir	0x0A50
	movle	%icc,	%g4,	%o1
	addc	%l1,	%i3,	%l3
	mulx	%g2,	%o5,	%g1
	stw	%i1,	[%l7 + 0x68]
	fpmerge	%f16,	%f3,	%f6
	sdiv	%i0,	0x1998,	%o4
	fmovdg	%xcc,	%f24,	%f29
	st	%f0,	[%l7 + 0x34]
	sdivcc	%o0,	0x0270,	%o7
	fcmpeq32	%f30,	%f18,	%o2
	edge32n	%l4,	%l5,	%o6
	movvs	%icc,	%i5,	%i7
	fnot1s	%f0,	%f1
	edge16n	%g5,	%l0,	%i2
	fandnot1s	%f9,	%f6,	%f30
	alignaddrl	%g7,	%g3,	%g6
	orncc	%i4,	0x1C1A,	%l2
	alignaddrl	%i6,	%o3,	%l6
	movneg	%xcc,	%g4,	%o1
	edge8ln	%l1,	%i3,	%l3
	mulscc	%o5,	0x106F,	%g2
	smul	%i1,	%g1,	%i0
	fcmple32	%f6,	%f0,	%o0
	andncc	%o4,	%o7,	%o2
	st	%f2,	[%l7 + 0x5C]
	ldub	[%l7 + 0x25],	%l5
	srax	%o6,	%l4,	%i7
	movvc	%icc,	%i5,	%g5
	ldsh	[%l7 + 0x54],	%l0
	sll	%g7,	0x01,	%g3
	nop
	set	0x50, %l6
	std	%f4,	[%l7 + %l6]
	umul	%g6,	0x1FD6,	%i2
	edge16	%l2,	%i4,	%o3
	edge8l	%l6,	%i6,	%g4
	lduw	[%l7 + 0x14],	%o1
	subccc	%i3,	0x0190,	%l3
	ldsh	[%l7 + 0x42],	%o5
	subccc	%g2,	0x1C9D,	%l1
	movg	%xcc,	%i1,	%g1
	edge8l	%i0,	%o0,	%o4
	fmovdpos	%icc,	%f3,	%f6
	subcc	%o2,	%l5,	%o6
	ld	[%l7 + 0x20],	%f24
	move	%xcc,	%l4,	%o7
	udivcc	%i5,	0x0045,	%i7
	movn	%icc,	%g5,	%g7
	andncc	%g3,	%l0,	%g6
	srl	%i2,	%i4,	%l2
	fpack16	%f4,	%f22
	udivcc	%o3,	0x1226,	%i6
	or	%l6,	0x0D94,	%o1
	edge8	%i3,	%l3,	%g4
	edge8	%g2,	%o5,	%l1
	xnor	%i1,	0x0E7B,	%g1
	edge32n	%o0,	%o4,	%o2
	mova	%icc,	%l5,	%i0
	fmovrdlz	%l4,	%f12,	%f12
	ldub	[%l7 + 0x31],	%o6
	addccc	%i5,	%i7,	%o7
	ldsh	[%l7 + 0x1C],	%g5
	movcc	%xcc,	%g3,	%g7
	ldd	[%l7 + 0x40],	%l0
	move	%icc,	%i2,	%i4
	fpadd16	%f22,	%f28,	%f8
	edge8n	%l2,	%o3,	%g6
	movpos	%icc,	%i6,	%l6
	save %o1, %l3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g2,	%o5,	%l1
	movgu	%icc,	%g4,	%i1
	movre	%o0,	%o4,	%o2
	add	%g1,	%l5,	%l4
	subcc	%i0,	0x100B,	%o6
	fmovrdlz	%i7,	%f8,	%f30
	fmovrslz	%i5,	%f1,	%f21
	fnors	%f28,	%f11,	%f0
	subccc	%o7,	%g3,	%g7
	ldd	[%l7 + 0x08],	%f14
	smulcc	%l0,	0x14E9,	%i2
	andncc	%g5,	%i4,	%l2
	edge16l	%g6,	%o3,	%i6
	ld	[%l7 + 0x50],	%f17
	ldx	[%l7 + 0x20],	%l6
	ldsh	[%l7 + 0x3A],	%l3
	movgu	%icc,	%i3,	%g2
	udiv	%o5,	0x0240,	%o1
	stx	%l1,	[%l7 + 0x18]
	ldd	[%l7 + 0x28],	%g4
	fmovrse	%o0,	%f0,	%f0
	edge8	%i1,	%o4,	%o2
	movrne	%g1,	0x048,	%l4
	st	%f10,	[%l7 + 0x64]
	xor	%i0,	0x0E8E,	%o6
	fornot2	%f18,	%f4,	%f24
	fabss	%f30,	%f31
	edge16	%i7,	%i5,	%l5
	fpadd32s	%f30,	%f6,	%f10
	save %g3, 0x0F50, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l0,	0x1E,	%i2
	movpos	%icc,	%g5,	%i4
	edge8	%o7,	%l2,	%o3
	fmovrsgez	%i6,	%f6,	%f15
	fmovsn	%xcc,	%f14,	%f29
	fzeros	%f20
	fmovdge	%xcc,	%f30,	%f8
	fnot2s	%f1,	%f21
	alignaddr	%l6,	%g6,	%i3
	movn	%xcc,	%l3,	%o5
	movle	%xcc,	%g2,	%o1
	sll	%l1,	%g4,	%i1
	edge32l	%o4,	%o2,	%o0
	fmovs	%f11,	%f27
	fmuld8ulx16	%f20,	%f11,	%f12
	orn	%g1,	%i0,	%o6
	movrgz	%l4,	%i5,	%l5
	and	%g3,	0x0133,	%g7
	subccc	%l0,	0x06D5,	%i2
	fmovs	%f13,	%f28
	srlx	%i7,	%i4,	%o7
	sllx	%l2,	%o3,	%g5
	sethi	0x19F2,	%i6
	sra	%g6,	0x10,	%i3
	movrlz	%l3,	%l6,	%o5
	movgu	%icc,	%o1,	%l1
	srl	%g4,	%g2,	%o4
	array16	%i1,	%o0,	%o2
	st	%f23,	[%l7 + 0x1C]
	mulx	%i0,	%o6,	%l4
	udivx	%i5,	0x1F17,	%l5
	addccc	%g3,	0x0C04,	%g7
	st	%f4,	[%l7 + 0x44]
	srl	%g1,	0x0A,	%l0
	sdivcc	%i2,	0x0A0B,	%i7
	mulscc	%i4,	0x0E67,	%o7
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	nop
	set	0x58, %g1
	std	%f6,	[%l7 + %g1]
	alignaddrl	%g6,	%l2,	%l3
	nop
	set	0x20, %l5
	std	%f26,	[%l7 + %l5]
	umulcc	%i3,	%l6,	%o5
	fmovscs	%xcc,	%f20,	%f23
	mulscc	%o1,	0x18CC,	%l1
	fpackfix	%f28,	%f18
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%g4
	xorcc	%g2,	%i1,	%o4
	fmovsvc	%icc,	%f15,	%f10
	sll	%o0,	0x04,	%o2
	orn	%o6,	%l4,	%i5
	ldx	[%l7 + 0x18],	%i0
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f0
	fsrc2s	%f10,	%f26
	sub	%g3,	0x020F,	%l5
	movcs	%xcc,	%g1,	%g7
	srl	%l0,	%i7,	%i4
	srlx	%o7,	0x14,	%o3
	move	%icc,	%g5,	%i2
	ld	[%l7 + 0x6C],	%f11
	subcc	%i6,	0x06DD,	%g6
	sdivx	%l2,	0x177E,	%l3
	fandnot2	%f30,	%f4,	%f28
	smul	%i3,	%o5,	%l6
	andcc	%l1,	0x13CA,	%g4
	smulcc	%g2,	0x1780,	%o1
	sir	0x0F09
	and	%o4,	%o0,	%i1
	save %o6, %o2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1226,	%i0
	subc	%g3,	%i5,	%l5
	movl	%icc,	%g1,	%g7
	srax	%i7,	%l0,	%i4
	smul	%o3,	%g5,	%o7
	stb	%i6,	[%l7 + 0x5F]
	movre	%g6,	0x0B2,	%i2
	st	%f21,	[%l7 + 0x58]
	lduh	[%l7 + 0x50],	%l3
	fnot1	%f8,	%f2
	movrlz	%i3,	0x0A5,	%l2
	fmovdle	%icc,	%f6,	%f10
	movrlez	%o5,	%l6,	%g4
	stb	%l1,	[%l7 + 0x5F]
	addc	%g2,	0x035E,	%o1
	fmul8x16	%f27,	%f2,	%f4
	orn	%o0,	%o4,	%i1
	movneg	%icc,	%o2,	%l4
	ldsb	[%l7 + 0x54],	%o6
	fcmpgt16	%f2,	%f10,	%g3
	movrne	%i0,	0x057,	%i5
	sll	%l5,	%g1,	%g7
	fpsub16	%f4,	%f6,	%f6
	mulx	%i7,	0x1D3D,	%l0
	movrgez	%o3,	0x0A6,	%g5
	nop
	set	0x38, %i3
	stw	%o7,	[%l7 + %i3]
	fand	%f10,	%f18,	%f10
	fmuld8sux16	%f11,	%f31,	%f18
	movvs	%icc,	%i4,	%i6
	nop
	set	0x72, %i5
	sth	%g6,	[%l7 + %i5]
	ldd	[%l7 + 0x18],	%f24
	array32	%i2,	%l3,	%l2
	alignaddrl	%o5,	%i3,	%g4
	movl	%icc,	%l6,	%l1
	movrgez	%o1,	%g2,	%o4
	fornot2s	%f1,	%f0,	%f9
	fones	%f4
	ldub	[%l7 + 0x5E],	%o0
	edge32ln	%o2,	%l4,	%i1
	udiv	%o6,	0x09B6,	%i0
	popc	%g3,	%i5
	ldd	[%l7 + 0x10],	%l4
	fexpand	%f30,	%f28
	ld	[%l7 + 0x1C],	%f29
	bshuffle	%f0,	%f24,	%f0
	movcs	%xcc,	%g1,	%i7
	srlx	%l0,	0x02,	%g7
	addc	%o3,	0x1E54,	%g5
	stb	%o7,	[%l7 + 0x5F]
	ldsw	[%l7 + 0x30],	%i4
	fexpand	%f30,	%f28
	movrgez	%i6,	0x3B9,	%g6
	fxors	%f31,	%f18,	%f8
	udivx	%i2,	0x0001,	%l2
	fmovdn	%xcc,	%f0,	%f30
	movgu	%icc,	%l3,	%o5
	subccc	%g4,	%l6,	%i3
	movn	%xcc,	%o1,	%l1
	fpadd16s	%f15,	%f26,	%f19
	stx	%g2,	[%l7 + 0x50]
	movl	%xcc,	%o0,	%o4
	movrgz	%l4,	0x0EA,	%o2
	addcc	%i1,	%o6,	%i0
	udivcc	%g3,	0x0295,	%i5
	movrne	%l5,	%i7,	%l0
	edge8	%g7,	%o3,	%g5
	fcmps	%fcc2,	%f12,	%f25
	fmovdvs	%icc,	%f9,	%f20
	restore %g1, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g6,	%i2,	%l2
	subccc	%l3,	%i4,	%o5
	fcmple16	%f26,	%f14,	%g4
	or	%l6,	%i3,	%o1
	bshuffle	%f12,	%f28,	%f8
	edge8n	%g2,	%o0,	%o4
	sll	%l1,	%o2,	%i1
	ld	[%l7 + 0x14],	%f1
	andn	%l4,	0x1E18,	%o6
	stx	%i0,	[%l7 + 0x68]
	edge16	%i5,	%l5,	%g3
	sir	0x1142
	movg	%xcc,	%i7,	%l0
	faligndata	%f18,	%f20,	%f2
	fmovrdlz	%g7,	%f8,	%f4
	sub	%o3,	0x0DAB,	%g1
	edge32	%g5,	%i6,	%g6
	stw	%i2,	[%l7 + 0x5C]
	movl	%icc,	%o7,	%l3
	movl	%icc,	%i4,	%o5
	fmovdle	%xcc,	%f17,	%f30
	ldx	[%l7 + 0x20],	%g4
	edge16n	%l6,	%l2,	%i3
	fmul8sux16	%f20,	%f16,	%f26
	stb	%g2,	[%l7 + 0x0A]
	and	%o1,	0x135F,	%o4
	subcc	%o0,	%l1,	%i1
	fmovdg	%icc,	%f20,	%f13
	edge8n	%l4,	%o6,	%o2
	srax	%i5,	%l5,	%i0
	fornot2	%f20,	%f30,	%f16
	fcmpne16	%f4,	%f2,	%i7
	edge32l	%l0,	%g7,	%o3
	sethi	0x0884,	%g3
	ldsh	[%l7 + 0x7A],	%g1
	edge32ln	%g5,	%i6,	%g6
	sra	%o7,	0x01,	%l3
	edge32n	%i2,	%i4,	%g4
	save %l6, %l2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f31,	%f15
	udivcc	%o5,	0x0F7D,	%o1
	movne	%icc,	%g2,	%o0
	fmovsvc	%icc,	%f28,	%f18
	subccc	%o4,	%l1,	%l4
	stx	%i1,	[%l7 + 0x58]
	stw	%o2,	[%l7 + 0x30]
	movleu	%xcc,	%i5,	%o6
	lduh	[%l7 + 0x6C],	%i0
	umul	%i7,	0x09EF,	%l0
	stw	%l5,	[%l7 + 0x74]
	fmovdneg	%xcc,	%f10,	%f20
	fmovsg	%xcc,	%f3,	%f25
	mulscc	%o3,	0x0EB3,	%g7
	subcc	%g1,	0x1FB1,	%g5
	mova	%xcc,	%i6,	%g3
	stx	%g6,	[%l7 + 0x78]
	xorcc	%l3,	%i2,	%i4
	ldx	[%l7 + 0x68],	%o7
	ldub	[%l7 + 0x11],	%g4
	subcc	%l6,	0x08D5,	%i3
	srlx	%o5,	0x18,	%o1
	fmovs	%f21,	%f24
	lduw	[%l7 + 0x0C],	%g2
	fcmpeq32	%f14,	%f12,	%l2
	edge16l	%o4,	%l1,	%l4
	andcc	%o0,	%i1,	%i5
	array8	%o2,	%i0,	%i7
	fnands	%f26,	%f29,	%f24
	fmovrdne	%l0,	%f16,	%f20
	fmovrsgez	%o6,	%f19,	%f2
	addc	%l5,	0x18F0,	%o3
	fmovsvc	%xcc,	%f4,	%f4
	fcmped	%fcc0,	%f14,	%f24
	movleu	%icc,	%g1,	%g5
	fands	%f21,	%f17,	%f13
	fmovdg	%icc,	%f8,	%f18
	fpmerge	%f8,	%f18,	%f26
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	xnorcc	%g6,	0x1E88,	%g3
	fcmpeq16	%f12,	%f30,	%i2
	edge16l	%i4,	%l3,	%g4
	fmovsvs	%xcc,	%f21,	%f8
	fandnot2s	%f4,	%f8,	%f29
	edge16	%o7,	%l6,	%i3
	ldsh	[%l7 + 0x40],	%o5
	subc	%g2,	0x18EA,	%l2
	mulscc	%o4,	0x1F1E,	%o1
	restore %l1, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i1,	0x1D1A,	%i5
	subccc	%i0,	%i7,	%o2
	fzeros	%f19
	edge32l	%o6,	%l0,	%l5
	fandnot1	%f22,	%f8,	%f18
	andn	%g1,	%o3,	%g5
	edge8	%i6,	%g7,	%g6
	sdivcc	%i2,	0x13E2,	%i4
	umulcc	%g3,	%l3,	%g4
	fxors	%f25,	%f20,	%f9
	fornot1	%f6,	%f6,	%f12
	ldsw	[%l7 + 0x68],	%l6
	fcmpeq32	%f10,	%f28,	%i3
	fmovsge	%xcc,	%f27,	%f14
	movrlz	%o7,	0x2E7,	%o5
	or	%g2,	0x1C37,	%o4
	popc	0x1EE9,	%l2
	alignaddrl	%l1,	%o1,	%l4
	orn	%i1,	%o0,	%i5
	addcc	%i0,	%i7,	%o2
	andcc	%o6,	0x1895,	%l5
	srl	%g1,	0x0A,	%o3
	udivcc	%g5,	0x0F4A,	%i6
	edge16	%g7,	%g6,	%l0
	movg	%xcc,	%i4,	%i2
	ldub	[%l7 + 0x4D],	%g3
	andcc	%l3,	0x1685,	%g4
	fand	%f22,	%f26,	%f24
	lduh	[%l7 + 0x72],	%i3
	orn	%o7,	%o5,	%l6
	nop
	set	0x48, %l3
	stb	%o4,	[%l7 + %l3]
	fxor	%f20,	%f26,	%f20
	umulcc	%g2,	0x1AA5,	%l2
	subc	%l1,	0x1D01,	%o1
	addcc	%l4,	0x1871,	%i1
	sllx	%i5,	%i0,	%i7
	fabss	%f14,	%f22
	edge32ln	%o2,	%o0,	%o6
	addcc	%g1,	%o3,	%l5
	or	%i6,	%g7,	%g5
	orncc	%l0,	0x17D2,	%i4
	movneg	%xcc,	%g6,	%g3
	mulx	%l3,	%i2,	%g4
	edge32l	%o7,	%o5,	%l6
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fsrc1	%f2,	%f12
	edge32	%l1,	%o1,	%l4
	andncc	%l2,	%i5,	%i1
	sth	%i0,	[%l7 + 0x08]
	addc	%i7,	%o0,	%o6
	move	%icc,	%g1,	%o2
	movcc	%icc,	%l5,	%i6
	movgu	%xcc,	%o3,	%g7
	edge8n	%l0,	%g5,	%g6
	fmovsvc	%xcc,	%f28,	%f16
	fsrc1s	%f14,	%f15
	add	%g3,	%i4,	%i2
	pdist	%f16,	%f8,	%f4
	fpsub16s	%f18,	%f8,	%f19
	srlx	%l3,	0x16,	%g4
	ldsw	[%l7 + 0x3C],	%o7
	bshuffle	%f16,	%f26,	%f24
	alignaddrl	%o5,	%i3,	%o4
	xnorcc	%l6,	0x0810,	%g2
	andcc	%o1,	%l1,	%l2
	siam	0x3
	movrlez	%l4,	0x3F8,	%i1
	umulcc	%i5,	0x08BD,	%i0
	mulscc	%i7,	%o6,	%g1
	fones	%f2
	fpadd16s	%f5,	%f26,	%f26
	addcc	%o2,	%l5,	%i6
	movl	%xcc,	%o0,	%o3
	fmovs	%f12,	%f2
	ldub	[%l7 + 0x72],	%g7
	movne	%xcc,	%l0,	%g6
	fand	%f30,	%f16,	%f2
	fsrc2s	%f10,	%f6
	sub	%g5,	%i4,	%i2
	edge16ln	%l3,	%g3,	%g4
	edge16l	%o5,	%i3,	%o7
	ldsb	[%l7 + 0x18],	%l6
	fpsub32	%f12,	%f10,	%f8
	sra	%o4,	0x18,	%g2
	sll	%l1,	%l2,	%o1
	edge16ln	%l4,	%i1,	%i5
	movcs	%icc,	%i0,	%i7
	movleu	%icc,	%o6,	%o2
	siam	0x4
	movvs	%xcc,	%g1,	%i6
	addccc	%o0,	0x1269,	%l5
	srlx	%o3,	%l0,	%g7
	mova	%xcc,	%g6,	%i4
	movcs	%xcc,	%g5,	%l3
	st	%f21,	[%l7 + 0x20]
	xnor	%g3,	0x0C18,	%g4
	addccc	%i2,	0x14AC,	%i3
	movrne	%o5,	0x00F,	%l6
	edge32ln	%o4,	%g2,	%o7
	movge	%xcc,	%l2,	%l1
	fmovrsgez	%o1,	%f0,	%f23
	orncc	%i1,	0x1B34,	%i5
	array16	%i0,	%i7,	%l4
	edge32l	%o2,	%g1,	%i6
	fmul8x16	%f5,	%f6,	%f20
	and	%o6,	0x07E1,	%l5
	stw	%o0,	[%l7 + 0x5C]
	alignaddrl	%l0,	%o3,	%g6
	sir	0x0D58
	sub	%i4,	%g7,	%g5
	st	%f2,	[%l7 + 0x48]
	edge32n	%l3,	%g4,	%i2
	srl	%i3,	0x0F,	%g3
	movge	%xcc,	%o5,	%l6
	fmul8x16au	%f28,	%f24,	%f0
	sra	%g2,	%o4,	%o7
	movne	%xcc,	%l1,	%l2
	ldsw	[%l7 + 0x74],	%i1
	movpos	%xcc,	%o1,	%i5
	srlx	%i0,	%l4,	%i7
	edge16n	%o2,	%i6,	%o6
	fcmpd	%fcc1,	%f18,	%f18
	smulcc	%g1,	0x0685,	%o0
	andncc	%l0,	%o3,	%g6
	ldsh	[%l7 + 0x5E],	%i4
	fmuld8sux16	%f21,	%f21,	%f18
	addc	%g7,	0x005F,	%l5
	ld	[%l7 + 0x20],	%f11
	andncc	%g5,	%g4,	%i2
	fones	%f12
	movle	%xcc,	%i3,	%l3
	fmovdpos	%icc,	%f5,	%f8
	movrlez	%g3,	0x30F,	%o5
	array32	%l6,	%o4,	%o7
	edge32	%l1,	%l2,	%i1
	or	%o1,	0x08AF,	%i5
	andncc	%i0,	%l4,	%g2
	movl	%xcc,	%o2,	%i7
	addcc	%i6,	0x07D5,	%g1
	sdivx	%o6,	0x1CF8,	%l0
	edge16l	%o3,	%g6,	%o0
	movl	%icc,	%i4,	%l5
	orncc	%g5,	%g4,	%g7
	lduh	[%l7 + 0x76],	%i3
	fmovdcc	%xcc,	%f27,	%f29
	fmovsne	%xcc,	%f21,	%f26
	fones	%f15
	edge16n	%i2,	%g3,	%l3
	alignaddrl	%o5,	%o4,	%l6
	addccc	%o7,	%l2,	%i1
	fnors	%f15,	%f9,	%f0
	smulcc	%o1,	%l1,	%i0
	sir	0x113B
	fmovs	%f27,	%f20
	bshuffle	%f10,	%f10,	%f28
	fors	%f19,	%f14,	%f10
	fmovrslez	%i5,	%f0,	%f22
	movrgz	%l4,	%g2,	%o2
	movge	%xcc,	%i6,	%g1
	ldub	[%l7 + 0x6F],	%i7
	xnor	%l0,	0x0E36,	%o6
	movrgez	%g6,	%o3,	%o0
	ldsh	[%l7 + 0x6A],	%i4
	movcs	%xcc,	%g5,	%g4
	ldd	[%l7 + 0x30],	%f0
	sll	%g7,	0x1B,	%i3
	movrne	%i2,	0x04B,	%l5
	sllx	%l3,	%g3,	%o4
	ldsw	[%l7 + 0x0C],	%l6
	udiv	%o7,	0x05B6,	%o5
	sra	%i1,	0x15,	%l2
	addccc	%o1,	0x1D53,	%l1
	movgu	%xcc,	%i5,	%i0
	orncc	%l4,	0x0602,	%g2
	mulscc	%o2,	0x060A,	%i6
	xnor	%g1,	0x09AE,	%i7
	alignaddr	%l0,	%g6,	%o3
	udivx	%o0,	0x00EC,	%o6
	orncc	%g5,	%i4,	%g4
	movge	%icc,	%g7,	%i3
	fnands	%f23,	%f4,	%f24
	movn	%xcc,	%l5,	%i2
	edge16ln	%g3,	%o4,	%l6
	st	%f29,	[%l7 + 0x64]
	movre	%o7,	0x01B,	%o5
	edge8n	%i1,	%l3,	%l2
	sdivx	%l1,	0x001D,	%o1
	ldx	[%l7 + 0x70],	%i0
	fmovs	%f30,	%f14
	fmovdg	%icc,	%f25,	%f13
	fmovscc	%icc,	%f16,	%f22
	srlx	%l4,	%g2,	%o2
	sll	%i6,	%g1,	%i7
	save %i5, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o3,	0x0D47,	%o0
	movl	%icc,	%o6,	%i4
	orcc	%g4,	0x1DF1,	%g7
	array16	%i3,	%l5,	%i2
	movrgez	%g3,	%o4,	%l6
	ldd	[%l7 + 0x50],	%f2
	ldub	[%l7 + 0x23],	%o7
	ldsb	[%l7 + 0x68],	%o5
	orncc	%g5,	%i1,	%l2
	sdivx	%l1,	0x090C,	%l3
	movrlz	%o1,	0x2E7,	%l4
	fcmpes	%fcc2,	%f9,	%f16
	sra	%i0,	%o2,	%i6
	subc	%g1,	0x0491,	%g2
	sllx	%i7,	0x08,	%i5
	addccc	%g6,	%o3,	%l0
	mova	%icc,	%o6,	%i4
	movneg	%icc,	%g4,	%o0
	fmovrslz	%i3,	%f29,	%f29
	edge8	%g7,	%i2,	%l5
	ld	[%l7 + 0x18],	%f15
	fnot2s	%f3,	%f16
	addccc	%o4,	0x19AE,	%l6
	smulcc	%o7,	0x1305,	%g3
	movre	%g5,	0x385,	%i1
	fmovsl	%icc,	%f21,	%f3
	restore %l2, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l3,	%o1,	%l4
	move	%icc,	%i0,	%i6
	movleu	%icc,	%g1,	%g2
	ldub	[%l7 + 0x1F],	%i7
	std	%f26,	[%l7 + 0x20]
	fmovsne	%xcc,	%f15,	%f12
	movleu	%icc,	%o2,	%g6
	xnor	%i5,	%o3,	%o6
	st	%f27,	[%l7 + 0x70]
	movvc	%icc,	%l0,	%g4
	fornot1	%f18,	%f22,	%f30
	smulcc	%i4,	0x16CC,	%o0
	sdivx	%i3,	0x06EC,	%g7
	movrlz	%i2,	%l5,	%o4
	ldx	[%l7 + 0x68],	%l6
	fmuld8sux16	%f22,	%f27,	%f26
	move	%xcc,	%o7,	%g5
	ldd	[%l7 + 0x60],	%i0
	alignaddr	%l2,	%o5,	%g3
	movre	%l1,	0x3F0,	%o1
	movcc	%icc,	%l4,	%i0
	nop
	set	0x10, %i6
	stx	%l3,	[%l7 + %i6]
	sdiv	%i6,	0x0F20,	%g2
	movcs	%icc,	%g1,	%o2
	movgu	%icc,	%g6,	%i5
	fnot2s	%f27,	%f5
	mulx	%i7,	0x1476,	%o3
	movleu	%xcc,	%o6,	%g4
	and	%l0,	0x0279,	%o0
	array8	%i3,	%g7,	%i2
	movg	%icc,	%i4,	%o4
	ldx	[%l7 + 0x38],	%l5
	fmovdg	%xcc,	%f15,	%f21
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	edge32ln	%g5,	%l2,	%o5
	mulscc	%i1,	%g3,	%l1
	movrlez	%o1,	0x227,	%i0
	movge	%icc,	%l4,	%l3
	movrlz	%g2,	0x32A,	%g1
	sdivcc	%o2,	0x15ED,	%i6
	movn	%xcc,	%g6,	%i5
	ld	[%l7 + 0x50],	%f27
	edge32l	%o3,	%o6,	%i7
	smul	%l0,	0x01E8,	%o0
	edge8ln	%g4,	%i3,	%i2
	fmul8ulx16	%f6,	%f10,	%f24
	add	%i4,	0x1824,	%o4
	movgu	%icc,	%l5,	%o7
	mova	%xcc,	%g7,	%l6
	edge32n	%l2,	%g5,	%o5
	array8	%i1,	%l1,	%o1
	sub	%i0,	%l4,	%l3
	alignaddr	%g2,	%g1,	%g3
	sra	%i6,	%o2,	%i5
	fsrc1s	%f25,	%f31
	udiv	%g6,	0x193A,	%o6
	edge16ln	%i7,	%l0,	%o0
	fmovdvc	%xcc,	%f20,	%f19
	siam	0x0
	movne	%icc,	%g4,	%i3
	restore %o3, 0x0816, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x38],	%i4
	addcc	%l5,	%o7,	%g7
	stw	%l6,	[%l7 + 0x60]
	ldsh	[%l7 + 0x32],	%o4
	save %l2, 0x14FE, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g5,	%l1,	%o1
	edge16	%i1,	%i0,	%l4
	sdivcc	%l3,	0x1007,	%g2
	alignaddrl	%g3,	%g1,	%i6
	udivx	%o2,	0x1CC2,	%i5
	movg	%icc,	%g6,	%i7
	mova	%icc,	%l0,	%o0
	andncc	%o6,	%g4,	%i3
	fandnot2	%f26,	%f16,	%f4
	st	%f22,	[%l7 + 0x68]
	lduh	[%l7 + 0x5C],	%i2
	edge8ln	%o3,	%l5,	%o7
	movvs	%icc,	%g7,	%i4
	fmovsl	%xcc,	%f3,	%f12
	edge32ln	%o4,	%l6,	%o5
	srlx	%l2,	0x14,	%l1
	or	%g5,	0x16AE,	%i1
	subcc	%i0,	%o1,	%l3
	movrgez	%g2,	%g3,	%l4
	ldsw	[%l7 + 0x2C],	%i6
	addcc	%o2,	0x1746,	%i5
	movvc	%icc,	%g6,	%i7
	movne	%icc,	%l0,	%o0
	movvc	%xcc,	%o6,	%g1
	movn	%xcc,	%g4,	%i2
	smulcc	%i3,	0x1525,	%l5
	fmovsl	%xcc,	%f20,	%f24
	ldsb	[%l7 + 0x14],	%o3
	movgu	%xcc,	%o7,	%i4
	popc	0x1C32,	%o4
	movpos	%xcc,	%l6,	%g7
	ldsh	[%l7 + 0x1A],	%o5
	stx	%l2,	[%l7 + 0x10]
	mova	%xcc,	%g5,	%l1
	fmuld8ulx16	%f30,	%f28,	%f26
	faligndata	%f22,	%f4,	%f8
	movge	%icc,	%i1,	%i0
	orcc	%l3,	%o1,	%g2
	fcmpeq16	%f18,	%f0,	%g3
	xnor	%l4,	%i6,	%o2
	movg	%xcc,	%i5,	%g6
	ldub	[%l7 + 0x73],	%l0
	fmovscs	%xcc,	%f0,	%f1
	smul	%o0,	%o6,	%i7
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	orcc	%i2,	0x1B83,	%i3
	sub	%l5,	0x0605,	%o3
	edge8l	%o7,	%i4,	%o4
	alignaddrl	%l6,	%g7,	%l2
	subcc	%o5,	0x05FA,	%l1
	st	%f3,	[%l7 + 0x60]
	sub	%g5,	%i1,	%i0
	ldd	[%l7 + 0x50],	%f8
	orcc	%o1,	0x17C8,	%l3
	andn	%g2,	0x1BB8,	%l4
	alignaddr	%i6,	%o2,	%g3
	xorcc	%g6,	%i5,	%o0
	sdivcc	%l0,	0x1E76,	%i7
	movle	%icc,	%o6,	%g4
	addcc	%i2,	%i3,	%g1
	edge32n	%l5,	%o3,	%i4
	smul	%o4,	0x0C31,	%o7
	xor	%g7,	%l6,	%o5
	movrgz	%l1,	0x31D,	%l2
	edge32	%g5,	%i0,	%i1
	movge	%icc,	%o1,	%l3
	ldub	[%l7 + 0x2D],	%l4
	fmuld8sux16	%f1,	%f13,	%f22
	udivx	%g2,	0x1730,	%i6
	lduh	[%l7 + 0x30],	%o2
	ldsb	[%l7 + 0x33],	%g3
	fornot1	%f10,	%f20,	%f14
	movvc	%icc,	%i5,	%g6
	edge8ln	%l0,	%i7,	%o6
	movvc	%icc,	%o0,	%i2
	fcmpeq32	%f16,	%f6,	%g4
	orn	%i3,	0x051C,	%g1
	siam	0x0
	movpos	%icc,	%o3,	%l5
	sll	%i4,	0x0E,	%o4
	sethi	0x14D4,	%g7
	edge16	%l6,	%o5,	%o7
	edge32	%l1,	%l2,	%i0
	fpack16	%f26,	%f31
	movvc	%icc,	%i1,	%o1
	fmul8x16al	%f8,	%f20,	%f24
	subccc	%g5,	%l3,	%g2
	addccc	%i6,	0x115D,	%l4
	andncc	%g3,	%o2,	%g6
	edge32l	%l0,	%i7,	%i5
	fcmpgt16	%f2,	%f16,	%o0
	fmovd	%f6,	%f16
	stb	%i2,	[%l7 + 0x6C]
	fpadd16	%f14,	%f6,	%f12
	movpos	%xcc,	%g4,	%i3
	add	%g1,	0x1E5E,	%o3
	lduh	[%l7 + 0x08],	%o6
	smul	%l5,	0x02AD,	%o4
	edge16l	%g7,	%i4,	%l6
	xnor	%o7,	%o5,	%l1
	sir	0x0E29
	movne	%icc,	%i0,	%i1
	std	%f10,	[%l7 + 0x20]
	fones	%f15
	fmovsneg	%icc,	%f25,	%f1
	fpack32	%f0,	%f30,	%f10
	ldd	[%l7 + 0x60],	%f8
	sra	%l2,	%g5,	%l3
	udivx	%o1,	0x0771,	%i6
	stx	%g2,	[%l7 + 0x50]
	umul	%g3,	0x100E,	%l4
	orcc	%o2,	0x03FD,	%g6
	subc	%l0,	0x008D,	%i7
	std	%f8,	[%l7 + 0x78]
	st	%f9,	[%l7 + 0x58]
	array8	%i5,	%o0,	%i2
	stb	%i3,	[%l7 + 0x32]
	xnor	%g4,	%g1,	%o6
	mova	%xcc,	%o3,	%l5
	sdiv	%o4,	0x057F,	%i4
	array8	%g7,	%l6,	%o7
	movrlz	%o5,	0x24A,	%l1
	fandnot1s	%f26,	%f25,	%f20
	nop
	set	0x57, %g5
	ldub	[%l7 + %g5],	%i1
	subc	%i0,	%g5,	%l2
	andncc	%o1,	%l3,	%g2
	xorcc	%i6,	0x18D1,	%g3
	sdivx	%l4,	0x111D,	%o2
	st	%f3,	[%l7 + 0x0C]
	addccc	%l0,	0x1003,	%i7
	fmovrdne	%g6,	%f2,	%f10
	fmovsl	%icc,	%f27,	%f19
	nop
	set	0x4A, %l0
	sth	%i5,	[%l7 + %l0]
	smul	%o0,	0x1A50,	%i2
	stw	%i3,	[%l7 + 0x20]
	edge16l	%g4,	%o6,	%o3
	movre	%g1,	%o4,	%i4
	orncc	%l5,	0x190F,	%l6
	ldx	[%l7 + 0x30],	%g7
	orncc	%o5,	%o7,	%i1
	movrgz	%l1,	0x130,	%i0
	ldsb	[%l7 + 0x3C],	%l2
	sdiv	%g5,	0x1DE4,	%o1
	edge16ln	%g2,	%i6,	%g3
	movpos	%xcc,	%l4,	%o2
	xnor	%l3,	%l0,	%i7
	movn	%xcc,	%g6,	%o0
	umul	%i5,	0x1239,	%i2
	stb	%g4,	[%l7 + 0x08]
	movn	%xcc,	%o6,	%o3
	movvs	%xcc,	%i3,	%o4
	orcc	%i4,	0x1B5A,	%g1
	fmovdvs	%xcc,	%f0,	%f28
	edge16	%l6,	%g7,	%o5
	fnot1s	%f8,	%f15
	andn	%o7,	0x111C,	%i1
	ldub	[%l7 + 0x26],	%l5
	movrlz	%l1,	0x00C,	%l2
	sir	0x0D12
	mova	%xcc,	%g5,	%i0
	sllx	%g2,	0x1C,	%i6
	movvc	%icc,	%o1,	%l4
	mulscc	%g3,	%o2,	%l0
	or	%l3,	0x1BD8,	%g6
	bshuffle	%f16,	%f2,	%f28
	movleu	%icc,	%o0,	%i5
	edge8ln	%i7,	%g4,	%i2
	sll	%o3,	%o6,	%i3
	stw	%o4,	[%l7 + 0x54]
	ldsb	[%l7 + 0x3C],	%g1
	edge32ln	%i4,	%l6,	%o5
	movre	%g7,	%i1,	%l5
	movvs	%xcc,	%o7,	%l1
	edge8n	%g5,	%l2,	%g2
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%i0
	andncc	%o1,	%i6,	%g3
	nop
	set	0x68, %o5
	std	%f30,	[%l7 + %o5]
	alignaddr	%o2,	%l0,	%l3
	fxor	%f14,	%f22,	%f30
	sir	0x0397
	ldsw	[%l7 + 0x2C],	%l4
	movgu	%xcc,	%g6,	%o0
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f22
	array8	%i5,	%i7,	%i2
	udiv	%o3,	0x1364,	%o6
	ldsw	[%l7 + 0x58],	%g4
	sir	0x0E82
	fsrc2s	%f17,	%f16
	alignaddrl	%o4,	%i3,	%g1
	edge8ln	%i4,	%o5,	%g7
	ldsh	[%l7 + 0x74],	%l6
	edge32n	%l5,	%o7,	%l1
	fnegd	%f26,	%f20
	movvc	%xcc,	%g5,	%i1
	save %g2, %l2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o1,	%g3
	ldsb	[%l7 + 0x4D],	%i6
	orn	%o2,	%l3,	%l0
	edge32n	%l4,	%o0,	%g6
	xnor	%i5,	0x0250,	%i7
	subccc	%o3,	0x0642,	%i2
	and	%o6,	0x15E2,	%o4
	edge16ln	%i3,	%g4,	%g1
	movrne	%o5,	0x2D0,	%g7
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f12
	edge8	%i4,	%l6,	%l5
	fmovdge	%xcc,	%f2,	%f21
	sll	%o7,	%l1,	%i1
	array8	%g2,	%l2,	%g5
	fpadd16	%f22,	%f4,	%f6
	ld	[%l7 + 0x48],	%f1
	srax	%i0,	%g3,	%i6
	nop
	set	0x68, %o3
	sth	%o2,	[%l7 + %o3]
	movvs	%xcc,	%o1,	%l0
	fxnor	%f12,	%f14,	%f18
	movgu	%icc,	%l3,	%l4
	sll	%o0,	0x13,	%g6
	edge8n	%i7,	%o3,	%i2
	add	%i5,	%o4,	%o6
	fzeros	%f14
	fmovrdgz	%g4,	%f22,	%f16
	array16	%i3,	%g1,	%g7
	ldd	[%l7 + 0x70],	%f16
	subcc	%o5,	%i4,	%l6
	movneg	%icc,	%l5,	%o7
	fmovrdgz	%l1,	%f8,	%f4
	sra	%i1,	%g2,	%l2
	mulx	%g5,	0x071A,	%g3
	move	%icc,	%i0,	%i6
	edge32l	%o1,	%l0,	%o2
	mulscc	%l4,	%l3,	%g6
	fmovdcc	%icc,	%f22,	%f31
	fandnot2	%f16,	%f0,	%f16
	edge32l	%o0,	%i7,	%o3
	movcc	%icc,	%i2,	%i5
	fornot2s	%f11,	%f6,	%f8
	and	%o4,	0x1DD3,	%g4
	sethi	0x1D2A,	%i3
	fmovrdlz	%o6,	%f16,	%f10
	ld	[%l7 + 0x1C],	%f27
	lduh	[%l7 + 0x7C],	%g7
	alignaddrl	%o5,	%i4,	%l6
	movvc	%icc,	%g1,	%l5
	fcmpeq32	%f2,	%f6,	%l1
	sllx	%i1,	%g2,	%l2
	sll	%o7,	%g5,	%i0
	fsrc1	%f14,	%f8
	ld	[%l7 + 0x78],	%f31
	fmovdcc	%icc,	%f8,	%f17
	edge8	%g3,	%i6,	%o1
	movg	%xcc,	%o2,	%l4
	sethi	0x08D9,	%l0
	sth	%l3,	[%l7 + 0x68]
	fmovrsne	%g6,	%f15,	%f20
	save %o0, 0x05B3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f5,	%f4
	edge16	%i2,	%i5,	%o4
	edge8	%g4,	%i3,	%i7
	edge16n	%o6,	%g7,	%o5
	edge32l	%i4,	%g1,	%l5
	or	%l6,	0x1E16,	%l1
	array32	%g2,	%i1,	%o7
	fpack32	%f22,	%f28,	%f28
	stb	%l2,	[%l7 + 0x72]
	lduw	[%l7 + 0x4C],	%i0
	fpsub16s	%f31,	%f31,	%f19
	udivcc	%g3,	0x03AA,	%g5
	fabsd	%f8,	%f0
	stx	%o1,	[%l7 + 0x08]
	ldd	[%l7 + 0x10],	%f22
	smul	%o2,	%l4,	%i6
	sdivcc	%l0,	0x11B2,	%g6
	edge8	%l3,	%o3,	%o0
	stx	%i2,	[%l7 + 0x70]
	movvc	%xcc,	%o4,	%g4
	save %i5, 0x1AC8, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o6,	0x18F7,	%g7
	umulcc	%i3,	%i4,	%g1
	udivx	%o5,	0x1D7E,	%l6
	umul	%l1,	0x175F,	%g2
	alignaddr	%i1,	%o7,	%l2
	fmovsgu	%icc,	%f9,	%f10
	movleu	%xcc,	%i0,	%g3
	sdiv	%g5,	0x1F8A,	%l5
	sir	0x1C72
	udivx	%o2,	0x1B01,	%l4
	udivcc	%i6,	0x05CA,	%l0
	edge16l	%g6,	%o1,	%o3
	edge8n	%o0,	%i2,	%o4
	fnegd	%f2,	%f2
	fzeros	%f3
	umul	%g4,	0x0EA2,	%l3
	smulcc	%i7,	%i5,	%o6
	movle	%icc,	%i3,	%g7
	srax	%i4,	0x1B,	%o5
	st	%f31,	[%l7 + 0x48]
	nop
	set	0x08, %i7
	sth	%g1,	[%l7 + %i7]
	smul	%l1,	%g2,	%i1
	movcs	%xcc,	%l6,	%o7
	restore %i0, 0x0750, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g5,	%g3,	%o2
	fmovrdlz	%l5,	%f14,	%f12
	lduh	[%l7 + 0x70],	%l4
	ldsh	[%l7 + 0x5A],	%i6
	mova	%icc,	%l0,	%o1
	fmovdpos	%icc,	%f30,	%f14
	edge16l	%g6,	%o3,	%i2
	xorcc	%o0,	0x159E,	%o4
	mulx	%g4,	%i7,	%i5
	edge32n	%l3,	%o6,	%i3
	udivx	%g7,	0x148A,	%i4
	ldub	[%l7 + 0x15],	%o5
	faligndata	%f12,	%f2,	%f22
	edge32l	%g1,	%l1,	%g2
	stb	%l6,	[%l7 + 0x76]
	xnorcc	%i1,	0x04BE,	%i0
	sllx	%l2,	0x16,	%o7
	fand	%f18,	%f8,	%f26
	ldsw	[%l7 + 0x78],	%g3
	edge16ln	%g5,	%o2,	%l5
	edge8l	%i6,	%l4,	%o1
	alignaddrl	%g6,	%l0,	%i2
	smulcc	%o0,	%o4,	%o3
	sir	0x0C4B
	ldsb	[%l7 + 0x59],	%g4
	movre	%i5,	0x120,	%i7
	fmovrsgez	%o6,	%f16,	%f3
	xorcc	%i3,	0x112E,	%g7
	ldd	[%l7 + 0x60],	%i4
	movn	%xcc,	%o5,	%g1
	subc	%l1,	%l3,	%g2
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	nop
	set	0x34, %o0
	sth	%o7,	[%l7 + %o0]
	fabss	%f12,	%f26
	edge8ln	%i1,	%g5,	%g3
	subccc	%o2,	0x1C95,	%l5
	fcmpes	%fcc1,	%f31,	%f30
	array8	%i6,	%l4,	%g6
	fcmpd	%fcc3,	%f24,	%f16
	fpmerge	%f26,	%f8,	%f10
	sdivx	%l0,	0x0EAF,	%o1
	restore %i2, %o4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f21,	%f18
	fmovs	%f15,	%f4
	alignaddrl	%o0,	%i5,	%i7
	andcc	%g4,	%i3,	%o6
	xor	%g7,	0x1EF2,	%o5
	edge8	%g1,	%l1,	%l3
	movl	%xcc,	%i4,	%g2
	edge32	%i0,	%l6,	%l2
	edge16n	%o7,	%i1,	%g3
	ldsb	[%l7 + 0x6A],	%o2
	addccc	%l5,	0x1957,	%i6
	subccc	%l4,	0x079A,	%g6
	edge8n	%g5,	%l0,	%o1
	movvs	%icc,	%o4,	%i2
	orn	%o3,	0x196F,	%o0
	movre	%i7,	0x085,	%g4
	fors	%f8,	%f8,	%f15
	ldsw	[%l7 + 0x7C],	%i3
	fornot2	%f8,	%f18,	%f8
	fnor	%f18,	%f14,	%f20
	fpadd32s	%f6,	%f8,	%f20
	edge8	%o6,	%g7,	%i5
	array16	%o5,	%l1,	%g1
	fones	%f10
	orn	%i4,	0x167A,	%l3
	movvs	%xcc,	%g2,	%i0
	save %l6, 0x0A6B, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l2,	0x1A4D,	%g3
	ldx	[%l7 + 0x48],	%o2
	addcc	%l5,	0x136A,	%i6
	popc	%i1,	%l4
	movrgz	%g5,	%g6,	%l0
	sllx	%o1,	%o4,	%i2
	fcmped	%fcc1,	%f18,	%f30
	movne	%icc,	%o0,	%i7
	movn	%xcc,	%o3,	%g4
	fnot2	%f20,	%f12
	movneg	%xcc,	%i3,	%o6
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	srlx	%g1,	%i4,	%l1
	movrlz	%l3,	%i0,	%g2
	sll	%o7,	%l6,	%g3
	edge8	%o2,	%l2,	%l5
	movleu	%icc,	%i1,	%i6
	fmovdl	%xcc,	%f19,	%f26
	udivx	%l4,	0x088C,	%g6
	edge8	%g5,	%o1,	%o4
	xnor	%l0,	0x1B4B,	%o0
	edge16ln	%i2,	%i7,	%o3
	fmovrdlez	%g4,	%f28,	%f30
	sdivcc	%i3,	0x05DA,	%o6
	edge32ln	%i5,	%g7,	%g1
	orncc	%o5,	0x1B82,	%l1
	udivcc	%i4,	0x10FE,	%l3
	movn	%xcc,	%i0,	%o7
	srax	%l6,	0x03,	%g3
	addc	%g2,	%l2,	%l5
	movn	%icc,	%o2,	%i6
	smulcc	%i1,	0x0493,	%l4
	ldd	[%l7 + 0x18],	%f20
	fmul8x16au	%f17,	%f4,	%f26
	fmul8x16au	%f0,	%f27,	%f8
	sllx	%g6,	0x1D,	%o1
	addccc	%g5,	0x1B1A,	%o4
	sethi	0x0DF7,	%l0
	umulcc	%o0,	0x1666,	%i2
	andn	%o3,	0x0AD2,	%g4
	or	%i3,	%o6,	%i5
	mulx	%g7,	0x155E,	%i7
	sdivcc	%g1,	0x0B9B,	%o5
	ldsw	[%l7 + 0x78],	%l1
	and	%l3,	0x1899,	%i0
	edge8	%i4,	%l6,	%o7
	udivx	%g3,	0x1025,	%g2
	subc	%l5,	%l2,	%i6
	edge16ln	%o2,	%i1,	%g6
	ldsh	[%l7 + 0x1E],	%l4
	movvc	%icc,	%o1,	%o4
	movl	%xcc,	%g5,	%l0
	movgu	%icc,	%i2,	%o0
	srlx	%g4,	0x1A,	%o3
	fmovrsgez	%i3,	%f19,	%f18
	sdivx	%i5,	0x191E,	%g7
	umul	%o6,	%i7,	%o5
	mulx	%l1,	%g1,	%i0
	edge8l	%i4,	%l6,	%o7
	xorcc	%g3,	%l3,	%g2
	addcc	%l2,	0x0B5E,	%i6
	movrgz	%o2,	%l5,	%g6
	movrlez	%l4,	%i1,	%o4
	fxnor	%f10,	%f30,	%f14
	save %g5, 0x170A, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f19,	%f12,	%f10
	sllx	%i2,	0x1A,	%o0
	smulcc	%g4,	0x09C5,	%o3
	mulscc	%l0,	0x0902,	%i3
	addc	%i5,	%o6,	%i7
	fmovsne	%xcc,	%f8,	%f30
	or	%o5,	%g7,	%l1
	movg	%xcc,	%i0,	%g1
	mulscc	%l6,	%o7,	%i4
	array8	%g3,	%g2,	%l2
	movrgez	%l3,	0x03D,	%o2
	srl	%l5,	%g6,	%i6
	andcc	%i1,	%l4,	%o4
	edge32n	%o1,	%i2,	%o0
	orcc	%g4,	%g5,	%o3
	subcc	%l0,	%i5,	%i3
	fmovsneg	%icc,	%f26,	%f29
	fornot1	%f22,	%f14,	%f0
	fmovscc	%icc,	%f20,	%f13
	movl	%xcc,	%o6,	%o5
	andcc	%g7,	%i7,	%l1
	array8	%g1,	%l6,	%i0
	fmovrslz	%o7,	%f11,	%f0
	sdivx	%i4,	0x15A7,	%g3
	lduw	[%l7 + 0x18],	%l2
	movn	%icc,	%g2,	%l3
	array32	%l5,	%g6,	%i6
	fmovrsgez	%i1,	%f25,	%f21
	udiv	%o2,	0x0A25,	%l4
	addc	%o1,	0x01ED,	%i2
	udivcc	%o4,	0x08D6,	%o0
	movcs	%icc,	%g5,	%g4
	edge8l	%o3,	%l0,	%i5
	sll	%o6,	%o5,	%g7
	sir	0x0623
	subccc	%i7,	0x0556,	%l1
	edge8l	%i3,	%g1,	%l6
	subccc	%i0,	0x1909,	%i4
	movrne	%g3,	0x364,	%o7
	smul	%l2,	%g2,	%l5
	fpadd16	%f2,	%f4,	%f12
	smulcc	%g6,	0x006C,	%l3
	edge8ln	%i6,	%o2,	%l4
	lduh	[%l7 + 0x1A],	%o1
	addcc	%i1,	%o4,	%i2
	sra	%g5,	0x0E,	%g4
	edge32	%o0,	%l0,	%o3
	ldsh	[%l7 + 0x60],	%i5
	popc	%o6,	%g7
	array8	%o5,	%l1,	%i3
	orncc	%i7,	0x160E,	%l6
	fmovsvs	%icc,	%f5,	%f27
	edge16n	%g1,	%i4,	%g3
	subcc	%o7,	0x0E99,	%l2
	movrgz	%i0,	0x365,	%l5
	nop
	set	0x60, %i0
	ldub	[%l7 + %i0],	%g2
	fpsub32s	%f19,	%f30,	%f0
	ldsw	[%l7 + 0x5C],	%l3
	sth	%g6,	[%l7 + 0x50]
	srlx	%o2,	%l4,	%o1
	alignaddr	%i1,	%i6,	%o4
	sra	%g5,	0x14,	%g4
	fmovdleu	%icc,	%f17,	%f23
	fmovsa	%icc,	%f7,	%f9
	restore %i2, %l0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x30],	%o0
	and	%o6,	%i5,	%o5
	or	%g7,	%l1,	%i3
	movvs	%xcc,	%i7,	%l6
	for	%f10,	%f16,	%f18
	udivx	%i4,	0x0C52,	%g3
	fmovrse	%g1,	%f17,	%f9
	xor	%l2,	%i0,	%l5
	fpadd16	%f10,	%f8,	%f18
	add	%o7,	%g2,	%l3
	orncc	%o2,	0x1B29,	%l4
	edge16	%g6,	%o1,	%i6
	fcmpne32	%f4,	%f14,	%o4
	std	%f8,	[%l7 + 0x20]
	edge32ln	%i1,	%g5,	%i2
	fxnor	%f10,	%f12,	%f22
	lduh	[%l7 + 0x62],	%l0
	smul	%o3,	%o0,	%o6
	smul	%i5,	0x0E9B,	%o5
	srlx	%g4,	%g7,	%l1
	mulx	%i3,	%l6,	%i4
	fmovdgu	%icc,	%f16,	%f26
	srax	%g3,	0x1B,	%i7
	fmovd	%f12,	%f30
	alignaddrl	%l2,	%g1,	%i0
	orncc	%l5,	0x1860,	%o7
	alignaddrl	%l3,	%o2,	%l4
	alignaddr	%g6,	%g2,	%o1
	st	%f29,	[%l7 + 0x74]
	move	%icc,	%i6,	%i1
	fmovdvc	%xcc,	%f11,	%f8
	fmovsg	%icc,	%f4,	%f0
	nop
	set	0x50, %g3
	std	%f16,	[%l7 + %g3]
	sdivx	%o4,	0x1299,	%g5
	fmovsg	%xcc,	%f26,	%f12
	movg	%xcc,	%i2,	%o3
	movgu	%xcc,	%o0,	%o6
	movre	%i5,	0x32B,	%o5
	edge16n	%g4,	%g7,	%l1
	fands	%f3,	%f4,	%f27
	subc	%l0,	0x0C81,	%i3
	mulx	%i4,	0x009A,	%l6
	ldsh	[%l7 + 0x3E],	%i7
	fnands	%f22,	%f20,	%f11
	stb	%l2,	[%l7 + 0x74]
	xnor	%g3,	0x02D3,	%i0
	fmovdneg	%icc,	%f21,	%f29
	edge32	%g1,	%o7,	%l5
	subccc	%o2,	%l4,	%g6
	movrne	%l3,	%g2,	%o1
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f0
	edge32l	%i1,	%i6,	%g5
	umulcc	%i2,	0x1BC4,	%o4
	pdist	%f4,	%f22,	%f26
	movpos	%xcc,	%o0,	%o3
	fnand	%f4,	%f0,	%f26
	orcc	%o6,	0x01EA,	%o5
	movge	%icc,	%i5,	%g7
	ldsh	[%l7 + 0x68],	%g4
	save %l1, %i3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f24,	%f2
	edge32ln	%l6,	%i4,	%i7
	add	%g3,	0x1D2B,	%i0
	addcc	%l2,	%g1,	%l5
	lduw	[%l7 + 0x10],	%o2
	edge8n	%l4,	%o7,	%g6
	srlx	%g2,	0x0D,	%o1
	srax	%l3,	0x0F,	%i1
	fmovdcc	%icc,	%f30,	%f25
	movne	%icc,	%i6,	%g5
	edge8ln	%i2,	%o4,	%o0
	save %o6, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g7,	0x325,	%i5
	faligndata	%f6,	%f26,	%f10
	andncc	%l1,	%g4,	%l0
	movvs	%icc,	%i3,	%l6
	sdiv	%i7,	0x1596,	%g3
	movleu	%xcc,	%i0,	%i4
	lduw	[%l7 + 0x38],	%l2
	fxnor	%f10,	%f8,	%f16
	andcc	%l5,	%o2,	%g1
	faligndata	%f8,	%f16,	%f0
	movcs	%icc,	%o7,	%l4
	fnors	%f20,	%f26,	%f17
	subccc	%g6,	0x006E,	%g2
	edge16ln	%o1,	%l3,	%i1
	andcc	%i6,	%i2,	%g5
	fmovdge	%icc,	%f7,	%f20
	subc	%o0,	0x1226,	%o6
	movle	%xcc,	%o4,	%o5
	sir	0x077F
	smulcc	%o3,	%g7,	%l1
	edge8	%g4,	%i5,	%i3
	sdiv	%l0,	0x0C71,	%l6
	sub	%i7,	%g3,	%i0
	xor	%l2,	0x0564,	%i4
	stb	%o2,	[%l7 + 0x13]
	ldub	[%l7 + 0x19],	%g1
	udivx	%l5,	0x0010,	%l4
	srl	%o7,	%g2,	%g6
	edge16n	%l3,	%o1,	%i1
	edge16l	%i2,	%g5,	%i6
	movvc	%xcc,	%o0,	%o4
	edge8	%o5,	%o6,	%o3
	movvs	%xcc,	%l1,	%g7
	movneg	%icc,	%i5,	%i3
	move	%xcc,	%g4,	%l0
	alignaddrl	%l6,	%g3,	%i7
	fmovsvc	%xcc,	%f4,	%f8
	ldub	[%l7 + 0x66],	%i0
	mova	%xcc,	%l2,	%o2
	edge8	%i4,	%g1,	%l5
	fcmpgt16	%f16,	%f20,	%o7
	movrlez	%g2,	%g6,	%l3
	movpos	%icc,	%l4,	%o1
	sir	0x1FB1
	movrlz	%i1,	%g5,	%i6
	ld	[%l7 + 0x44],	%f24
	ldsb	[%l7 + 0x5E],	%i2
	edge16n	%o4,	%o5,	%o6
	addccc	%o3,	%l1,	%o0
	fpadd32s	%f19,	%f28,	%f8
	fcmpd	%fcc3,	%f12,	%f4
	std	%f4,	[%l7 + 0x38]
	fnot2s	%f8,	%f23
	andncc	%g7,	%i5,	%i3
	fnot2s	%f10,	%f17
	srlx	%l0,	%g4,	%l6
	mulx	%g3,	%i0,	%i7
	lduw	[%l7 + 0x5C],	%o2
	fmovde	%icc,	%f0,	%f19
	stb	%i4,	[%l7 + 0x2A]
	movcc	%icc,	%l2,	%g1
	udiv	%l5,	0x0B02,	%g2
	sth	%g6,	[%l7 + 0x44]
	fornot1	%f16,	%f6,	%f30
	fmul8x16au	%f30,	%f2,	%f20
	smul	%o7,	%l3,	%o1
	popc	%l4,	%i1
	movge	%xcc,	%g5,	%i6
	array16	%i2,	%o5,	%o6
	fcmpd	%fcc1,	%f10,	%f0
	srl	%o4,	0x0A,	%l1
	movrlz	%o0,	%o3,	%i5
	xnorcc	%g7,	%i3,	%l0
	std	%f8,	[%l7 + 0x48]
	movvs	%icc,	%l6,	%g4
	movre	%g3,	0x1D1,	%i0
	movg	%xcc,	%o2,	%i4
	orn	%l2,	0x023B,	%g1
	umulcc	%l5,	0x19E4,	%g2
	sth	%i7,	[%l7 + 0x62]
	fpadd16s	%f17,	%f2,	%f7
	fpmerge	%f3,	%f6,	%f30
	edge16ln	%o7,	%l3,	%g6
	udivx	%o1,	0x1020,	%i1
	stx	%l4,	[%l7 + 0x30]
	smul	%i6,	0x0BCE,	%i2
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	ldx	[%l7 + 0x68],	%o6
	edge16n	%l1,	%o3,	%i5
	udivcc	%g7,	0x0A26,	%o0
	subccc	%i3,	0x1F50,	%l0
	lduw	[%l7 + 0x0C],	%g4
	movcc	%icc,	%l6,	%g3
	array16	%o2,	%i4,	%l2
	movvc	%xcc,	%g1,	%i0
	movrlz	%l5,	0x1F0,	%i7
	smulcc	%o7,	0x1C31,	%g2
	move	%icc,	%g6,	%o1
	fmovrdlez	%l3,	%f28,	%f16
	movrgez	%l4,	0x092,	%i1
	fpadd16s	%f23,	%f25,	%f25
	srax	%i2,	%i6,	%o5
	srl	%g5,	0x09,	%o4
	movrlez	%l1,	0x2BF,	%o6
	ldd	[%l7 + 0x60],	%o2
	lduh	[%l7 + 0x6E],	%i5
	fxnor	%f30,	%f28,	%f18
	udiv	%o0,	0x0F89,	%i3
	ldx	[%l7 + 0x28],	%g7
	fmul8sux16	%f10,	%f2,	%f8
	fpack16	%f26,	%f7
	sdiv	%g4,	0x1A93,	%l6
	ldub	[%l7 + 0x2E],	%g3
	mulx	%o2,	%i4,	%l2
	ldd	[%l7 + 0x10],	%l0
	sra	%i0,	0x1E,	%l5
	addccc	%g1,	%o7,	%i7
	fcmpne16	%f22,	%f0,	%g2
	edge32l	%o1,	%g6,	%l3
	fmul8ulx16	%f30,	%f16,	%f24
	mulx	%l4,	%i1,	%i2
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%o4
	orn	%g5,	%i6,	%o4
	restore %l1, %o3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%i4
	movne	%icc,	%i3,	%o0
	fsrc1s	%f7,	%f7
	fpadd16	%f22,	%f6,	%f18
	andn	%g4,	0x1775,	%g7
	orcc	%l6,	%o2,	%i4
	xorcc	%l2,	0x0E29,	%g3
	popc	%i0,	%l0
	fmovdl	%icc,	%f4,	%f0
	fmovsneg	%xcc,	%f2,	%f26
	add	%l5,	%o7,	%i7
	andcc	%g2,	%g1,	%g6
	addccc	%o1,	%l3,	%i1
	save %l4, 0x1FC9, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f18,	%f20,	%f12
	sdivcc	%g5,	0x1781,	%i2
	fmuld8ulx16	%f0,	%f13,	%f14
	fcmped	%fcc0,	%f26,	%f16
	movrgz	%i6,	0x0B5,	%l1
	edge8	%o4,	%o6,	%i5
	mova	%xcc,	%i3,	%o3
	sra	%g4,	%g7,	%l6
	movleu	%xcc,	%o0,	%o2
	alignaddrl	%i4,	%l2,	%i0
	fandnot2s	%f22,	%f31,	%f6
	srax	%g3,	0x05,	%l5
	popc	%l0,	%i7
	udivx	%g2,	0x0EA3,	%o7
	std	%f10,	[%l7 + 0x48]
	nop
	set	0x6C, %g7
	lduw	[%l7 + %g7],	%g1
	alignaddr	%o1,	%g6,	%l3
	movrlez	%i1,	0x1E1,	%o5
	movleu	%xcc,	%l4,	%g5
	lduh	[%l7 + 0x4E],	%i6
	movrne	%i2,	0x135,	%o4
	array16	%l1,	%o6,	%i5
	array16	%o3,	%g4,	%g7
	lduh	[%l7 + 0x46],	%l6
	edge32n	%i3,	%o2,	%o0
	movcc	%icc,	%l2,	%i4
	movrgez	%i0,	%g3,	%l0
	movne	%icc,	%l5,	%g2
	fnot2s	%f26,	%f18
	fmovse	%icc,	%f4,	%f23
	move	%icc,	%i7,	%o7
	edge16n	%g1,	%g6,	%l3
	fmovrdlz	%o1,	%f8,	%f18
	movrlz	%o5,	%i1,	%g5
	fmovdne	%xcc,	%f0,	%f2
	movle	%xcc,	%i6,	%l4
	or	%o4,	0x1722,	%i2
	movrne	%l1,	%o6,	%i5
	sllx	%g4,	0x0A,	%o3
	pdist	%f18,	%f18,	%f28
	save %l6, %i3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o2,	%o0
	sllx	%l2,	0x17,	%i0
	movn	%icc,	%i4,	%g3
	movcc	%icc,	%l5,	%g2
	fpack16	%f28,	%f8
	andncc	%i7,	%l0,	%g1
	fcmpeq32	%f26,	%f22,	%o7
	edge16ln	%l3,	%o1,	%g6
	fpsub16	%f4,	%f20,	%f28
	movvs	%icc,	%i1,	%o5
	fcmpeq16	%f8,	%f0,	%i6
	edge32n	%g5,	%l4,	%o4
	fmovdg	%xcc,	%f0,	%f11
	movrne	%l1,	0x309,	%i2
	fandnot2	%f2,	%f6,	%f14
	srlx	%o6,	%i5,	%o3
	edge32n	%l6,	%i3,	%g7
	fmul8x16au	%f17,	%f7,	%f4
	save %o2, %o0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x58],	%f24
	fmovspos	%xcc,	%f28,	%f12
	fands	%f23,	%f7,	%f29
	mulx	%i0,	0x03CF,	%i4
	ldd	[%l7 + 0x50],	%l2
	movrgz	%l5,	0x1EB,	%g2
	fpsub16s	%f8,	%f25,	%f29
	andn	%i7,	%l0,	%g3
	smulcc	%o7,	%l3,	%o1
	edge8ln	%g6,	%g1,	%i1
	fnand	%f26,	%f18,	%f4
	udiv	%i6,	0x1EB3,	%g5
	umulcc	%o5,	0x15F6,	%o4
	fcmpne16	%f24,	%f0,	%l4
	edge32	%i2,	%l1,	%o6
	movcs	%xcc,	%o3,	%l6
	subccc	%i3,	%g7,	%i5
	edge8	%o2,	%o0,	%i0
	alignaddr	%g4,	%l2,	%l5
	srax	%g2,	%i4,	%i7
	fmovdl	%xcc,	%f22,	%f0
	st	%f7,	[%l7 + 0x3C]
	sethi	0x17BA,	%g3
	fone	%f28
	fsrc1s	%f28,	%f8
	edge8	%l0,	%l3,	%o7
	andn	%o1,	%g1,	%g6
	sdiv	%i6,	0x0B0D,	%g5
	movl	%xcc,	%o5,	%i1
	sub	%l4,	0x1CCF,	%o4
	fpackfix	%f26,	%f13
	sir	0x1123
	addccc	%i2,	0x054C,	%o6
	fmuld8sux16	%f28,	%f9,	%f16
	fmul8x16	%f31,	%f12,	%f14
	faligndata	%f14,	%f30,	%f4
	andn	%l1,	%l6,	%i3
	ldsw	[%l7 + 0x24],	%g7
	edge16l	%i5,	%o3,	%o2
	or	%i0,	0x177A,	%o0
	lduw	[%l7 + 0x10],	%g4
	fmovdg	%icc,	%f7,	%f20
	ldx	[%l7 + 0x68],	%l2
	edge32n	%l5,	%i4,	%i7
	sethi	0x0839,	%g3
	stw	%g2,	[%l7 + 0x78]
	sdivcc	%l3,	0x07E3,	%o7
	movrne	%l0,	%g1,	%g6
	sdiv	%o1,	0x1356,	%i6
	fmovs	%f20,	%f21
	save %o5, %g5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0A35,	%o4
	movle	%icc,	%l4,	%i2
	fmovrde	%l1,	%f20,	%f10
	subc	%l6,	%i3,	%o6
	fmovrse	%g7,	%f19,	%f1
	fmovrsne	%i5,	%f0,	%f27
	andn	%o2,	0x18B2,	%o3
	andncc	%o0,	%g4,	%l2
	edge32	%i0,	%i4,	%l5
	stb	%g3,	[%l7 + 0x6E]
	bshuffle	%f18,	%f8,	%f2
	fxnors	%f23,	%f13,	%f1
	srax	%g2,	%l3,	%o7
	movne	%icc,	%i7,	%l0
	stw	%g1,	[%l7 + 0x18]
	mova	%icc,	%o1,	%g6
	stx	%i6,	[%l7 + 0x60]
	fmovrdne	%g5,	%f30,	%f16
	nop
	set	0x58, %g2
	std	%f10,	[%l7 + %g2]
	fmovrsgz	%i1,	%f1,	%f16
	edge32n	%o4,	%l4,	%o5
	smul	%i2,	%l6,	%l1
	fcmped	%fcc2,	%f16,	%f6
	fmovdneg	%xcc,	%f20,	%f14
	movrlez	%o6,	0x288,	%g7
	fsrc2	%f2,	%f20
	movle	%icc,	%i3,	%i5
	edge32ln	%o3,	%o2,	%o0
	mulscc	%g4,	0x067D,	%i0
	alignaddrl	%i4,	%l2,	%g3
	xor	%g2,	0x0938,	%l5
	sdivcc	%o7,	0x0071,	%i7
	movne	%xcc,	%l0,	%g1
	fandnot1s	%f19,	%f2,	%f0
	srlx	%l3,	%g6,	%i6
	sub	%g5,	%i1,	%o1
	fmovrdlez	%l4,	%f2,	%f30
	edge8l	%o5,	%o4,	%l6
	array8	%i2,	%o6,	%g7
	edge8n	%i3,	%i5,	%l1
	pdist	%f26,	%f14,	%f30
	mulx	%o2,	%o0,	%g4
	fpadd32s	%f7,	%f16,	%f9
	movrgz	%o3,	%i0,	%i4
	edge32	%l2,	%g2,	%g3
	andn	%l5,	%o7,	%i7
	sdiv	%l0,	0x136B,	%l3
	fpadd32s	%f1,	%f29,	%f13
	movrlz	%g6,	0x2AD,	%i6
	movcc	%icc,	%g5,	%g1
	movle	%icc,	%i1,	%o1
	edge16ln	%o5,	%o4,	%l6
	movrgez	%l4,	0x260,	%i2
	ld	[%l7 + 0x4C],	%f31
	sdivx	%o6,	0x1D04,	%g7
	fornot2s	%f13,	%f1,	%f18
	array32	%i5,	%i3,	%l1
	addcc	%o0,	%g4,	%o2
	mulx	%o3,	0x1935,	%i0
	siam	0x4
	sethi	0x10C3,	%l2
	smulcc	%g2,	0x0416,	%g3
	nop
	set	0x0E, %g4
	sth	%i4,	[%l7 + %g4]
	movre	%l5,	%i7,	%o7
	edge8l	%l3,	%l0,	%g6
	ldsh	[%l7 + 0x50],	%i6
	fmovrsne	%g5,	%f19,	%f21
	fnors	%f20,	%f31,	%f15
	popc	0x188F,	%g1
	xor	%o1,	0x1A36,	%i1
	orcc	%o4,	%o5,	%l4
	fornot1s	%f14,	%f11,	%f13
	edge16l	%l6,	%i2,	%g7
	and	%o6,	0x0658,	%i3
	fmovrslz	%l1,	%f15,	%f0
	nop
	set	0x6C, %o1
	sth	%i5,	[%l7 + %o1]
	fmovspos	%xcc,	%f22,	%f6
	fcmpne16	%f22,	%f10,	%g4
	fnand	%f20,	%f20,	%f10
	fmovsn	%icc,	%f5,	%f23
	sub	%o2,	0x125E,	%o0
	fnor	%f22,	%f24,	%f22
	smulcc	%o3,	0x1677,	%l2
	fmovrsne	%i0,	%f11,	%f16
	addccc	%g2,	%g3,	%l5
	srl	%i4,	0x12,	%o7
	fmovrde	%l3,	%f26,	%f20
	stx	%l0,	[%l7 + 0x48]
	orcc	%g6,	%i7,	%g5
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%g1
	movgu	%icc,	%o1,	%i1
	udivcc	%i6,	0x1822,	%o4
	edge16l	%o5,	%l4,	%l6
	popc	0x0274,	%g7
	movneg	%icc,	%o6,	%i2
	ld	[%l7 + 0x7C],	%f13
	addcc	%l1,	%i3,	%g4
	fmovs	%f16,	%f8
	movrne	%i5,	%o0,	%o2
	umul	%l2,	0x11F8,	%o3
	movrgz	%g2,	%i0,	%l5
	movrlz	%i4,	%g3,	%l3
	movcs	%icc,	%o7,	%g6
	movvs	%icc,	%i7,	%l0
	array16	%g5,	%o1,	%g1
	sethi	0x1947,	%i6
	movne	%xcc,	%o4,	%o5
	ldsh	[%l7 + 0x6A],	%i1
	edge16ln	%l4,	%l6,	%o6
	andcc	%i2,	0x14D5,	%l1
	fmul8ulx16	%f0,	%f0,	%f22
	nop
	set	0x48, %l4
	ldsh	[%l7 + %l4],	%g7
	movn	%xcc,	%g4,	%i3
	ldd	[%l7 + 0x18],	%f26
	subc	%o0,	%o2,	%l2
	edge32ln	%i5,	%o3,	%g2
	edge16ln	%l5,	%i4,	%i0
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	addccc	%i7,	0x095D,	%o7
	sth	%g5,	[%l7 + 0x48]
	fmovsge	%icc,	%f24,	%f15
	movre	%l0,	0x211,	%o1
	xnor	%g1,	0x158C,	%o4
	ld	[%l7 + 0x18],	%f26
	sra	%o5,	%i6,	%i1
	save %l6, 0x1B0D, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x66],	%i2
	movleu	%icc,	%l4,	%l1
	fmovsne	%xcc,	%f14,	%f8
	sll	%g4,	%i3,	%g7
	fmovrdne	%o0,	%f24,	%f12
	and	%o2,	0x07D6,	%l2
	stw	%o3,	[%l7 + 0x54]
	movvc	%icc,	%i5,	%g2
	movre	%i4,	%i0,	%g3
	edge8ln	%l3,	%g6,	%i7
	udivcc	%l5,	0x0A64,	%g5
	srax	%l0,	0x09,	%o1
	fmovsneg	%xcc,	%f10,	%f4
	fexpand	%f16,	%f26
	edge8	%o7,	%o4,	%g1
	srlx	%o5,	0x19,	%i1
	movg	%xcc,	%i6,	%l6
	movrne	%i2,	%o6,	%l1
	fcmpne16	%f2,	%f18,	%g4
	ldsw	[%l7 + 0x50],	%l4
	movrgz	%i3,	0x06F,	%o0
	st	%f8,	[%l7 + 0x40]
	mulx	%o2,	0x14D8,	%g7
	sdivcc	%o3,	0x1FBD,	%l2
	mova	%xcc,	%g2,	%i5
	addcc	%i4,	%i0,	%l3
	or	%g3,	0x1B87,	%i7
	movg	%icc,	%g6,	%g5
	movpos	%xcc,	%l5,	%l0
	orncc	%o1,	0x19BE,	%o7
	alignaddr	%g1,	%o5,	%o4
	xnorcc	%i1,	%i6,	%i2
	movcs	%xcc,	%l6,	%o6
	sir	0x0636
	edge8ln	%l1,	%l4,	%i3
	fcmpeq16	%f12,	%f6,	%g4
	xorcc	%o0,	%o2,	%g7
	smulcc	%l2,	%g2,	%o3
	fmovrslez	%i4,	%f10,	%f4
	fmovspos	%xcc,	%f1,	%f15
	movcc	%icc,	%i0,	%l3
	sdiv	%g3,	0x0AD8,	%i5
	andncc	%g6,	%i7,	%l5
	and	%g5,	%o1,	%o7
	edge32l	%g1,	%l0,	%o4
	movn	%icc,	%i1,	%o5
	fmovsne	%xcc,	%f27,	%f12
	sth	%i6,	[%l7 + 0x2A]
	fornot2	%f4,	%f22,	%f30
	fmovrdne	%l6,	%f28,	%f4
	edge16n	%o6,	%l1,	%l4
	movvc	%icc,	%i2,	%g4
	sdivx	%i3,	0x1BFF,	%o2
	siam	0x6
	sdivcc	%o0,	0x18A8,	%l2
	mova	%icc,	%g7,	%g2
	subc	%o3,	%i0,	%l3
	edge16l	%i4,	%g3,	%i5
	alignaddr	%i7,	%l5,	%g6
	smul	%g5,	%o7,	%g1
	movle	%icc,	%o1,	%o4
	edge16l	%i1,	%o5,	%i6
	edge8ln	%l0,	%l6,	%l1
	xnorcc	%o6,	%i2,	%l4
	edge8	%i3,	%o2,	%o0
	fones	%f16
	ldub	[%l7 + 0x0A],	%l2
	movrgz	%g4,	%g7,	%o3
	srax	%i0,	0x1E,	%l3
	movg	%icc,	%i4,	%g2
	fmovdcc	%xcc,	%f3,	%f12
	lduw	[%l7 + 0x54],	%g3
	movl	%icc,	%i5,	%i7
	xnorcc	%l5,	%g6,	%g5
	edge32ln	%g1,	%o1,	%o7
	sdiv	%i1,	0x18C0,	%o4
	movn	%xcc,	%o5,	%i6
	edge16n	%l6,	%l0,	%o6
	fmovdvc	%icc,	%f3,	%f25
	edge8n	%l1,	%i2,	%l4
	edge32ln	%i3,	%o0,	%o2
	xorcc	%g4,	%l2,	%g7
	fcmple32	%f26,	%f2,	%i0
	fsrc2	%f0,	%f22
	addccc	%l3,	0x0CC1,	%i4
	st	%f22,	[%l7 + 0x64]
	fmovsn	%xcc,	%f16,	%f20
	movrlz	%o3,	0x162,	%g3
	stw	%g2,	[%l7 + 0x18]
	smul	%i5,	%l5,	%i7
	fmovs	%f7,	%f30
	edge8ln	%g5,	%g6,	%o1
	fmovdneg	%xcc,	%f24,	%f27
	alignaddr	%g1,	%o7,	%i1
	xnorcc	%o4,	0x0367,	%o5
	andn	%i6,	%l0,	%l6
	movne	%icc,	%o6,	%i2
	smul	%l1,	0x0332,	%i3
	umul	%o0,	0x1794,	%o2
	sth	%g4,	[%l7 + 0x5E]
	edge16ln	%l4,	%g7,	%i0
	nop
	set	0x7E, %i2
	sth	%l2,	[%l7 + %i2]
	movle	%xcc,	%i4,	%o3
	edge16n	%g3,	%g2,	%l3
	st	%f21,	[%l7 + 0x38]
	movvc	%icc,	%i5,	%i7
	mulx	%l5,	%g6,	%g5
	fmovsvc	%icc,	%f26,	%f1
	edge8n	%g1,	%o1,	%o7
	sub	%o4,	%i1,	%i6
	addccc	%l0,	%o5,	%l6
	addccc	%i2,	0x1AF7,	%l1
	st	%f4,	[%l7 + 0x0C]
	edge8	%o6,	%o0,	%i3
	subc	%g4,	%o2,	%g7
	edge16ln	%l4,	%i0,	%l2
	lduw	[%l7 + 0x54],	%o3
	movcs	%xcc,	%i4,	%g2
	ldd	[%l7 + 0x60],	%l2
	movrlez	%i5,	0x22F,	%g3
	fmovdl	%xcc,	%f18,	%f9
	edge16ln	%l5,	%g6,	%i7
	fmovdle	%icc,	%f21,	%f10
	fandnot1s	%f16,	%f30,	%f12
	edge8	%g5,	%o1,	%o7
	edge16ln	%o4,	%i1,	%i6
	array32	%g1,	%o5,	%l6
	udivx	%i2,	0x07A7,	%l1
	movre	%l0,	0x2DE,	%o0
	edge8	%o6,	%g4,	%o2
	udivx	%i3,	0x1FC3,	%l4
	srl	%i0,	0x0D,	%l2
	xorcc	%o3,	%i4,	%g7
	srl	%g2,	%l3,	%g3
	movl	%icc,	%i5,	%g6
	umul	%l5,	0x0733,	%i7
	smul	%o1,	%g5,	%o7
	stw	%o4,	[%l7 + 0x34]
	alignaddr	%i1,	%i6,	%o5
	ldd	[%l7 + 0x10],	%i6
	movrgez	%i2,	0x392,	%l1
	fandnot2	%f6,	%f10,	%f0
	movrlz	%g1,	0x091,	%o0
	fnot1s	%f29,	%f8
	sth	%l0,	[%l7 + 0x2C]
	movneg	%icc,	%o6,	%o2
	mulscc	%i3,	0x1A62,	%g4
	edge8	%l4,	%i0,	%o3
	array16	%i4,	%g7,	%l2
	edge32	%g2,	%l3,	%i5
	mova	%xcc,	%g6,	%g3
	sth	%i7,	[%l7 + 0x68]
	sll	%l5,	0x19,	%g5
	movrgez	%o1,	%o4,	%i1
	fmovrslez	%i6,	%f16,	%f16
	stx	%o7,	[%l7 + 0x18]
	movrlez	%l6,	%i2,	%l1
	alignaddr	%o5,	%g1,	%o0
	fnegd	%f8,	%f16
	udivx	%o6,	0x1C66,	%o2
	edge16l	%l0,	%i3,	%g4
	array32	%i0,	%l4,	%o3
	umulcc	%g7,	0x1D8F,	%l2
	fmovd	%f16,	%f8
	move	%xcc,	%i4,	%l3
	fmovdleu	%icc,	%f24,	%f21
	std	%f28,	[%l7 + 0x50]
	movne	%xcc,	%i5,	%g6
	movgu	%xcc,	%g3,	%i7
	add	%l5,	0x1D0C,	%g5
	ldsh	[%l7 + 0x38],	%o1
	fmovrse	%g2,	%f11,	%f11
	fmuld8sux16	%f25,	%f13,	%f16
	nop
	set	0x2B, %l6
	ldub	[%l7 + %l6],	%o4
	ldx	[%l7 + 0x10],	%i1
	sdiv	%i6,	0x02B1,	%l6
	add	%o7,	0x1369,	%l1
	fabsd	%f30,	%f10
	andn	%o5,	0x1387,	%g1
	andcc	%o0,	%o6,	%o2
	array8	%l0,	%i2,	%g4
	array8	%i3,	%l4,	%o3
	sdiv	%g7,	0x06AB,	%l2
	st	%f26,	[%l7 + 0x18]
	fabsd	%f10,	%f0
	fmuld8sux16	%f19,	%f20,	%f4
	sdivx	%i0,	0x0BDA,	%l3
	fmovsa	%xcc,	%f1,	%f4
	fpack16	%f22,	%f15
	mulscc	%i4,	0x098E,	%i5
	udiv	%g3,	0x039B,	%g6
	fcmpgt16	%f20,	%f28,	%l5
	movrgz	%i7,	0x1F9,	%o1
	edge8ln	%g5,	%o4,	%i1
	movneg	%icc,	%i6,	%l6
	addccc	%g2,	0x0753,	%o7
	mulscc	%o5,	%l1,	%o0
	fornot1	%f16,	%f8,	%f30
	sdivcc	%o6,	0x1E70,	%g1
	fmovrdgez	%o2,	%f2,	%f8
	edge16ln	%l0,	%i2,	%i3
	sdivx	%g4,	0x0D79,	%o3
	stw	%g7,	[%l7 + 0x74]
	movl	%icc,	%l4,	%i0
	smul	%l3,	0x0AA6,	%i4
	ldub	[%l7 + 0x44],	%l2
	movne	%xcc,	%i5,	%g3
	movre	%g6,	%l5,	%o1
	movpos	%xcc,	%i7,	%o4
	fxnors	%f27,	%f3,	%f4
	add	%i1,	0x0948,	%i6
	save %g5, %g2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f1,	%f9
	orcc	%o5,	%l1,	%o0
	ld	[%l7 + 0x10],	%f7
	movpos	%xcc,	%o6,	%g1
	fsrc1s	%f18,	%f13
	mova	%icc,	%o7,	%o2
	or	%i2,	%l0,	%i3
	andcc	%o3,	0x1031,	%g7
	srl	%l4,	%i0,	%l3
	edge8ln	%i4,	%g4,	%i5
	stx	%l2,	[%l7 + 0x60]
	sdivx	%g3,	0x13D1,	%g6
	fxnors	%f19,	%f31,	%f16
	fmovsvs	%icc,	%f5,	%f2
	array16	%l5,	%o1,	%i7
	movrgez	%o4,	0x1DC,	%i1
	movge	%xcc,	%g5,	%i6
	fmul8x16al	%f11,	%f3,	%f28
	bshuffle	%f24,	%f26,	%f6
	movge	%xcc,	%g2,	%l6
	array32	%l1,	%o0,	%o5
	mulx	%o6,	%o7,	%g1
	stw	%o2,	[%l7 + 0x34]
	st	%f22,	[%l7 + 0x10]
	orcc	%i2,	0x06F2,	%i3
	move	%xcc,	%l0,	%o3
	movrgz	%l4,	%i0,	%g7
	udivcc	%i4,	0x148E,	%g4
	subc	%l3,	0x0C9B,	%i5
	edge8ln	%l2,	%g6,	%g3
	srl	%o1,	0x15,	%i7
	fxor	%f12,	%f12,	%f16
	movcs	%icc,	%o4,	%i1
	edge16n	%l5,	%g5,	%i6
	array8	%l6,	%l1,	%o0
	fabss	%f13,	%f9
	andncc	%g2,	%o6,	%o7
	alignaddr	%o5,	%o2,	%i2
	fpmerge	%f6,	%f26,	%f16
	movpos	%icc,	%i3,	%l0
	srax	%o3,	%g1,	%l4
	fmovrse	%g7,	%f28,	%f5
	movcc	%icc,	%i0,	%g4
	std	%f0,	[%l7 + 0x60]
	movle	%icc,	%l3,	%i4
	fmovdgu	%icc,	%f2,	%f17
	alignaddrl	%l2,	%i5,	%g3
	ldsw	[%l7 + 0x70],	%o1
	andncc	%i7,	%g6,	%i1
	nop
	set	0x2A, %g1
	ldsb	[%l7 + %g1],	%l5
	stx	%o4,	[%l7 + 0x68]
	edge8n	%i6,	%g5,	%l1
	andn	%l6,	0x0291,	%o0
	srl	%g2,	%o6,	%o5
	fmovsvc	%icc,	%f19,	%f30
	fnands	%f20,	%f27,	%f31
	fnands	%f16,	%f19,	%f19
	movpos	%xcc,	%o7,	%o2
	addccc	%i3,	%l0,	%i2
	fpack32	%f30,	%f30,	%f30
	fandnot1s	%f26,	%f29,	%f6
	orn	%o3,	%g1,	%g7
	edge16	%l4,	%i0,	%g4
	movrlz	%i4,	%l2,	%l3
	stx	%i5,	[%l7 + 0x10]
	fmovdvs	%icc,	%f30,	%f7
	smul	%g3,	%i7,	%g6
	movpos	%xcc,	%o1,	%l5
	movle	%icc,	%i1,	%i6
	fmovscc	%xcc,	%f1,	%f15
	umulcc	%o4,	0x0B50,	%g5
	movvc	%icc,	%l1,	%o0
	mova	%icc,	%l6,	%o6
	fpack16	%f2,	%f28
	add	%g2,	%o5,	%o2
	array16	%o7,	%l0,	%i2
	fmovsleu	%xcc,	%f30,	%f23
	addc	%o3,	0x0086,	%g1
	udivx	%i3,	0x1F17,	%l4
	subcc	%i0,	0x0435,	%g7
	edge8ln	%i4,	%g4,	%l2
	fmovrdgez	%l3,	%f4,	%f26
	fmovrdne	%g3,	%f10,	%f16
	udiv	%i5,	0x017A,	%g6
	movgu	%xcc,	%o1,	%i7
	stx	%i1,	[%l7 + 0x10]
	srax	%l5,	%o4,	%i6
	orcc	%g5,	%l1,	%l6
	addccc	%o0,	%o6,	%o5
	and	%o2,	0x1D7C,	%g2
	fmovrdgez	%o7,	%f10,	%f20
	mulx	%i2,	%l0,	%o3
	movl	%xcc,	%g1,	%i3
	xor	%l4,	%i0,	%i4
	add	%g4,	0x04E3,	%g7
	srl	%l2,	0x03,	%l3
	movne	%xcc,	%g3,	%i5
	mulx	%o1,	0x138C,	%i7
	edge8l	%i1,	%g6,	%o4
	fand	%f6,	%f24,	%f24
	srax	%l5,	%g5,	%l1
	sethi	0x08F1,	%l6
	array8	%i6,	%o6,	%o0
	movrgz	%o2,	%o5,	%g2
	xor	%i2,	%l0,	%o3
	ldd	[%l7 + 0x48],	%o6
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%i2
	smulcc	%l4,	0x0D4D,	%g1
	movrgz	%i4,	%g4,	%g7
	movneg	%icc,	%i0,	%l2
	udivcc	%l3,	0x05E7,	%g3
	fmovrsgz	%i5,	%f29,	%f16
	edge8	%o1,	%i7,	%i1
	fmovd	%f30,	%f8
	or	%g6,	0x1217,	%l5
	ldd	[%l7 + 0x50],	%g4
	movrlez	%l1,	%l6,	%o4
	fmovdleu	%icc,	%f30,	%f3
	movg	%icc,	%o6,	%i6
	lduw	[%l7 + 0x20],	%o0
	fpadd16s	%f26,	%f5,	%f25
	addcc	%o2,	%o5,	%g2
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%l0
	edge32n	%o3,	%i2,	%i3
	srl	%l4,	%o7,	%i4
	ldsw	[%l7 + 0x10],	%g1
	ldx	[%l7 + 0x58],	%g7
	addcc	%g4,	%i0,	%l3
	movrne	%g3,	0x374,	%l2
	movl	%icc,	%o1,	%i5
	movvc	%icc,	%i1,	%g6
	sra	%i7,	0x14,	%g5
	edge16ln	%l5,	%l6,	%o4
	umulcc	%l1,	%o6,	%i6
	srlx	%o2,	%o0,	%o5
	movgu	%icc,	%l0,	%o3
	sdiv	%i2,	0x1E97,	%i3
	fabss	%f9,	%f31
	addc	%g2,	0x05EB,	%l4
	andncc	%i4,	%o7,	%g7
	movn	%icc,	%g1,	%g4
	ldsw	[%l7 + 0x18],	%i0
	fmovde	%xcc,	%f24,	%f24
	movcs	%icc,	%l3,	%g3
	array16	%l2,	%i5,	%i1
	movrlez	%o1,	%g6,	%g5
	ldd	[%l7 + 0x28],	%f22
	movne	%xcc,	%l5,	%i7
	movl	%icc,	%l6,	%l1
	movgu	%xcc,	%o6,	%o4
	array32	%o2,	%o0,	%i6
	for	%f30,	%f10,	%f16
	fmovrdgz	%o5,	%f12,	%f16
	faligndata	%f8,	%f26,	%f2
	movvc	%xcc,	%o3,	%i2
	fpsub16	%f8,	%f0,	%f10
	sdivcc	%i3,	0x0514,	%l0
	alignaddrl	%g2,	%l4,	%i4
	restore %o7, 0x0B79, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0309
	ld	[%l7 + 0x38],	%f0
	fmovdvc	%icc,	%f31,	%f6
	xor	%g4,	0x024F,	%g1
	movne	%icc,	%l3,	%g3
	fmovrdne	%l2,	%f10,	%f0
	sethi	0x1077,	%i0
	addcc	%i1,	0x0FC0,	%o1
	nop
	set	0x7E, %l5
	ldsh	[%l7 + %l5],	%g6
	save %g5, 0x1E21, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l5,	%l6
	movrgez	%l1,	0x318,	%o6
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fxor	%f30,	%f28,	%f16
	movleu	%xcc,	%o4,	%i6
	st	%f1,	[%l7 + 0x3C]
	fpsub32s	%f18,	%f11,	%f14
	smulcc	%o0,	0x1205,	%o3
	edge8ln	%o5,	%i3,	%i2
	save %l0, %g2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i4,	%o7,	%g7
	sir	0x1C7F
	movrgez	%g1,	%g4,	%l3
	sll	%l2,	%i0,	%i1
	and	%o1,	%g3,	%g6
	fone	%f30
	edge8	%i5,	%g5,	%l6
	sdivcc	%l1,	0x1FAB,	%o6
	array16	%l5,	%i7,	%o2
	addccc	%i6,	0x083A,	%o0
	lduh	[%l7 + 0x7A],	%o3
	andcc	%o5,	0x0B5C,	%i3
	ldub	[%l7 + 0x6D],	%o4
	fmovrdlz	%i2,	%f16,	%f30
	movle	%xcc,	%g2,	%l0
	fmovdge	%icc,	%f10,	%f14
	restore %l4, 0x1D68, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f26,	%f5
	andcc	%i4,	%g1,	%g4
	fandnot1s	%f19,	%f0,	%f15
	array32	%l3,	%l2,	%i0
	fabsd	%f14,	%f0
	edge16l	%g7,	%o1,	%i1
	fxnor	%f16,	%f12,	%f2
	andn	%g6,	%i5,	%g5
	fmovdl	%icc,	%f21,	%f28
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fornot2	%f16,	%f0,	%f6
	lduh	[%l7 + 0x5E],	%o6
	movrlz	%l5,	%i7,	%o2
	smulcc	%o0,	0x101E,	%i6
	fsrc2s	%f1,	%f27
	fnot1	%f22,	%f26
	xnor	%o3,	0x13F8,	%o5
	sdivcc	%i3,	0x1266,	%o4
	edge32ln	%i2,	%g2,	%l0
	smul	%o7,	0x1C58,	%l4
	movcc	%icc,	%g1,	%g4
	umulcc	%i4,	%l3,	%i0
	sth	%g7,	[%l7 + 0x36]
	movneg	%xcc,	%l2,	%i1
	srlx	%o1,	0x1C,	%i5
	fcmpne16	%f0,	%f24,	%g5
	fpack32	%f30,	%f6,	%f22
	andn	%g6,	0x1DCD,	%l6
	ld	[%l7 + 0x44],	%f2
	fmovrdne	%g3,	%f14,	%f24
	alignaddrl	%l1,	%o6,	%l5
	movn	%xcc,	%o2,	%i7
	fpmerge	%f17,	%f8,	%f22
	fmovsg	%icc,	%f0,	%f29
	mulx	%o0,	0x1D9A,	%i6
	movle	%xcc,	%o3,	%o5
	umulcc	%i3,	%o4,	%i2
	mova	%icc,	%g2,	%o7
	array8	%l0,	%l4,	%g4
	save %g1, %i4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g7,	%l2
	mulx	%i0,	%i1,	%i5
	ldsh	[%l7 + 0x30],	%o1
	stb	%g6,	[%l7 + 0x59]
	fones	%f29
	ldub	[%l7 + 0x3D],	%g5
	ldx	[%l7 + 0x30],	%g3
	srl	%l6,	0x15,	%o6
	fornot2	%f0,	%f28,	%f24
	fmovsge	%xcc,	%f1,	%f25
	andncc	%l1,	%o2,	%l5
	movne	%icc,	%o0,	%i7
	save %i6, 0x005F, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f12,	%f2
	umulcc	%o5,	%i3,	%o4
	movre	%g2,	%o7,	%l0
	lduw	[%l7 + 0x24],	%l4
	movne	%xcc,	%i2,	%g4
	orcc	%g1,	0x0EEA,	%i4
	udivcc	%l3,	0x178E,	%l2
	fcmpgt32	%f12,	%f14,	%i0
	fmovde	%xcc,	%f26,	%f23
	fmovsg	%xcc,	%f28,	%f19
	orn	%g7,	%i1,	%i5
	std	%f2,	[%l7 + 0x58]
	movle	%xcc,	%o1,	%g6
	srl	%g5,	0x17,	%g3
	addcc	%o6,	%l1,	%o2
	sdiv	%l5,	0x1DFD,	%l6
	fmovsg	%xcc,	%f20,	%f22
	edge32	%o0,	%i7,	%o3
	fmovsl	%xcc,	%f17,	%f19
	sllx	%o5,	0x07,	%i3
	and	%o4,	0x013D,	%i6
	edge32l	%g2,	%o7,	%l4
	movpos	%icc,	%l0,	%g4
	srax	%g1,	0x1D,	%i4
	edge8l	%i2,	%l3,	%l2
	fmovspos	%icc,	%f1,	%f18
	lduw	[%l7 + 0x4C],	%i0
	stw	%i1,	[%l7 + 0x74]
	xnorcc	%g7,	%i5,	%g6
	sethi	0x0025,	%g5
	addccc	%g3,	%o6,	%l1
	fmovsa	%xcc,	%f13,	%f30
	movge	%xcc,	%o2,	%o1
	ld	[%l7 + 0x74],	%f27
	fnot2s	%f30,	%f0
	fpadd32	%f28,	%f14,	%f22
	xnorcc	%l6,	%o0,	%l5
	udivx	%i7,	0x1402,	%o3
	edge16l	%o5,	%i3,	%o4
	sethi	0x13BB,	%i6
	fnot2s	%f5,	%f3
	orn	%g2,	0x1D23,	%o7
	st	%f2,	[%l7 + 0x0C]
	edge8ln	%l0,	%l4,	%g4
	orn	%i4,	%g1,	%i2
	movvs	%xcc,	%l3,	%i0
	sir	0x1739
	fors	%f8,	%f9,	%f15
	ldsw	[%l7 + 0x70],	%l2
	sra	%g7,	%i1,	%i5
	movcs	%icc,	%g5,	%g3
	ldsh	[%l7 + 0x32],	%g6
	addccc	%o6,	0x1CAD,	%o2
	fpack16	%f6,	%f17
	andncc	%l1,	%o1,	%o0
	udivcc	%l5,	0x170C,	%i7
	sir	0x1838
	movrne	%l6,	0x1B9,	%o3
	edge32n	%o5,	%o4,	%i6
	edge16	%g2,	%o7,	%l0
	fornot2	%f18,	%f4,	%f0
	andcc	%i3,	0x17A1,	%l4
	movne	%xcc,	%i4,	%g1
	fnot1	%f24,	%f0
	andncc	%g4,	%i2,	%i0
	restore %l3, 0x1C0E, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f11,	[%l7 + 0x7C]
	fand	%f2,	%f24,	%f26
	fmovdl	%icc,	%f20,	%f9
	fmovsleu	%xcc,	%f16,	%f26
	smulcc	%g7,	%i5,	%g5
	movcs	%xcc,	%i1,	%g3
	edge8ln	%o6,	%o2,	%l1
	movre	%o1,	0x03F,	%g6
	sra	%l5,	0x19,	%o0
	save %i7, 0x1139, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o5,	%l6,	%i6
	stx	%o4,	[%l7 + 0x20]
	subccc	%g2,	%o7,	%i3
	movrgez	%l4,	0x2F2,	%i4
	movg	%xcc,	%g1,	%g4
	srl	%l0,	0x14,	%i2
	sub	%i0,	%l2,	%l3
	movvc	%icc,	%i5,	%g5
	addc	%i1,	%g3,	%g7
	movcc	%xcc,	%o2,	%l1
	movn	%xcc,	%o1,	%o6
	umulcc	%l5,	0x1B0E,	%g6
	fmovde	%icc,	%f26,	%f15
	andcc	%i7,	0x1C9B,	%o0
	udivx	%o5,	0x165F,	%o3
	edge8	%l6,	%i6,	%g2
	edge8	%o4,	%o7,	%i3
	lduw	[%l7 + 0x54],	%l4
	movne	%icc,	%g1,	%i4
	movrlez	%g4,	%l0,	%i0
	andncc	%l2,	%l3,	%i5
	udivx	%i2,	0x1CDC,	%g5
	edge8	%g3,	%i1,	%g7
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	fmovrsgz	%o1,	%f17,	%f26
	sdiv	%l5,	0x1C1E,	%g6
	fmovrdne	%o6,	%f22,	%f0
	fornot1s	%f13,	%f8,	%f6
	alignaddr	%o0,	%i7,	%o3
	addcc	%o5,	%l6,	%g2
	and	%i6,	0x06B4,	%o4
	movl	%icc,	%i3,	%l4
	ldub	[%l7 + 0x22],	%g1
	movne	%icc,	%o7,	%g4
	fmovrslez	%i4,	%f11,	%f14
	srl	%i0,	%l0,	%l3
	fxors	%f2,	%f21,	%f12
	xnorcc	%l2,	0x0A6B,	%i5
	fnands	%f29,	%f22,	%f19
	fmovdle	%icc,	%f23,	%f9
	edge16n	%g5,	%i2,	%g3
	sub	%i1,	%o2,	%g7
	fands	%f23,	%f31,	%f24
	sdivx	%o1,	0x16C8,	%l1
	addccc	%l5,	%o6,	%o0
	edge32ln	%g6,	%i7,	%o3
	popc	%l6,	%g2
	lduh	[%l7 + 0x4A],	%i6
	movvc	%xcc,	%o4,	%i3
	fnegd	%f4,	%f18
	srlx	%l4,	0x07,	%o5
	ldsw	[%l7 + 0x68],	%g1
	xor	%o7,	%g4,	%i0
	stw	%i4,	[%l7 + 0x70]
	movpos	%icc,	%l0,	%l2
	subccc	%i5,	0x1593,	%l3
	movrgez	%i2,	0x0D4,	%g3
	edge8l	%i1,	%g5,	%o2
	edge16l	%g7,	%o1,	%l5
	mulscc	%l1,	%o6,	%g6
	orcc	%i7,	0x0076,	%o3
	movneg	%icc,	%l6,	%o0
	udivx	%i6,	0x0617,	%g2
	udivx	%i3,	0x0D49,	%o4
	fmovsvs	%xcc,	%f19,	%f24
	save %o5, 0x1832, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l4,	%g4,	%i0
	sdivx	%i4,	0x1020,	%l0
	smul	%o7,	0x175A,	%l2
	fmovse	%xcc,	%f21,	%f12
	ldsh	[%l7 + 0x7A],	%l3
	st	%f3,	[%l7 + 0x3C]
	move	%icc,	%i2,	%g3
	alignaddrl	%i5,	%g5,	%o2
	nop
	set	0x4C, %g6
	ldub	[%l7 + %g6],	%i1
	ldsh	[%l7 + 0x0C],	%g7
	udiv	%l5,	0x0217,	%o1
	ldsw	[%l7 + 0x7C],	%o6
	stw	%l1,	[%l7 + 0x7C]
	movvc	%xcc,	%i7,	%g6
	fmovscs	%xcc,	%f28,	%f12
	movcs	%icc,	%l6,	%o3
	pdist	%f16,	%f22,	%f16
	movneg	%icc,	%o0,	%g2
	mova	%xcc,	%i6,	%i3
	srlx	%o5,	%g1,	%o4
	addc	%l4,	0x146F,	%g4
	andn	%i0,	0x19E7,	%l0
	fmovdn	%icc,	%f8,	%f10
	ldd	[%l7 + 0x28],	%f16
	movvc	%icc,	%o7,	%i4
	fcmple16	%f24,	%f10,	%l3
	smulcc	%i2,	0x167A,	%g3
	ldsw	[%l7 + 0x28],	%i5
	srl	%g5,	0x0B,	%o2
	ldd	[%l7 + 0x20],	%f20
	sdivx	%l2,	0x1927,	%i1
	lduw	[%l7 + 0x34],	%l5
	movn	%xcc,	%g7,	%o1
	fcmpeq16	%f2,	%f14,	%l1
	xnor	%i7,	%o6,	%g6
	udiv	%o3,	0x1179,	%l6
	ldsh	[%l7 + 0x68],	%g2
	ldx	[%l7 + 0x48],	%o0
	movn	%xcc,	%i3,	%o5
	fmovsvs	%xcc,	%f9,	%f26
	xor	%i6,	0x09F6,	%o4
	ldsw	[%l7 + 0x38],	%g1
	nop
	set	0x58, %i5
	std	%f30,	[%l7 + %i5]
	array8	%l4,	%i0,	%l0
	udivx	%o7,	0x1D9E,	%g4
	udiv	%l3,	0x1E68,	%i4
	edge32n	%g3,	%i5,	%i2
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%o2
	udivcc	%g5,	0x052E,	%i1
	addc	%l2,	%l5,	%g7
	udivcc	%o1,	0x14A5,	%i7
	sllx	%o6,	0x19,	%g6
	umul	%l1,	%o3,	%l6
	movne	%icc,	%g2,	%i3
	fpsub32	%f10,	%f22,	%f4
	sdivcc	%o5,	0x1AE0,	%i6
	mova	%icc,	%o4,	%g1
	andn	%l4,	0x0400,	%i0
	sth	%o0,	[%l7 + 0x68]
	ldsb	[%l7 + 0x5A],	%l0
	edge16l	%g4,	%o7,	%i4
	stx	%l3,	[%l7 + 0x20]
	movge	%icc,	%g3,	%i2
	sdivcc	%o2,	0x1A49,	%i5
	orcc	%i1,	0x179E,	%g5
	mulscc	%l2,	0x0840,	%g7
	fmovd	%f20,	%f8
	subc	%o1,	%i7,	%l5
	edge32	%o6,	%g6,	%l1
	movvc	%icc,	%o3,	%l6
	addc	%g2,	0x0560,	%o5
	sra	%i3,	%i6,	%o4
	fcmpeq32	%f24,	%f24,	%l4
	mulscc	%i0,	%g1,	%l0
	addccc	%o0,	0x0AD7,	%g4
	movrne	%o7,	%i4,	%g3
	sra	%i2,	%l3,	%o2
	sra	%i1,	%g5,	%i5
	alignaddr	%g7,	%l2,	%o1
	subc	%l5,	0x11B5,	%o6
	movre	%g6,	0x238,	%l1
	ldx	[%l7 + 0x08],	%o3
	edge8	%l6,	%g2,	%o5
	movleu	%xcc,	%i3,	%i7
	xnor	%o4,	0x154A,	%i6
	mulscc	%i0,	0x10C0,	%g1
	sdiv	%l4,	0x00F0,	%l0
	restore %g4, %o0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f28,	%f26,	%g3
	movneg	%xcc,	%i4,	%i2
	alignaddrl	%l3,	%i1,	%o2
	lduw	[%l7 + 0x38],	%i5
	fmovspos	%xcc,	%f17,	%f4
	fmovdcc	%xcc,	%f0,	%f14
	subc	%g7,	0x0EA4,	%l2
	movg	%xcc,	%g5,	%l5
	subc	%o6,	0x1552,	%o1
	ldsw	[%l7 + 0x50],	%g6
	movvc	%icc,	%o3,	%l1
	fnot1s	%f21,	%f25
	udivx	%l6,	0x16E5,	%g2
	movgu	%icc,	%i3,	%o5
	sllx	%i7,	%i6,	%o4
	sll	%i0,	%g1,	%l4
	movrlez	%l0,	%g4,	%o7
	and	%g3,	%i4,	%i2
	movneg	%xcc,	%o0,	%i1
	sdivx	%o2,	0x174C,	%i5
	subcc	%g7,	%l3,	%l2
	orncc	%l5,	%o6,	%g5
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	lduh	[%l7 + 0x0A],	%g6
	st	%f26,	[%l7 + 0x14]
	sllx	%l6,	0x1B,	%g2
	fmovde	%icc,	%f11,	%f27
	fmovrdne	%i3,	%f20,	%f4
	movrgz	%o5,	0x2BD,	%i7
	edge8	%o4,	%i0,	%i6
	andncc	%l4,	%g1,	%g4
	andcc	%l0,	%g3,	%o7
	stx	%i2,	[%l7 + 0x18]
	edge32l	%o0,	%i4,	%o2
	fnegs	%f16,	%f29
	edge8l	%i1,	%i5,	%g7
	smul	%l2,	%l5,	%l3
	fmovdge	%xcc,	%f26,	%f10
	umul	%o6,	%o1,	%g5
	fmovdne	%icc,	%f8,	%f7
	save %l1, %o3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x66],	%l6
	fcmpgt32	%f12,	%f16,	%i3
	siam	0x7
	add	%o5,	0x1AAF,	%i7
	ldsw	[%l7 + 0x24],	%o4
	edge8n	%i0,	%i6,	%g2
	xnor	%g1,	%l4,	%l0
	array16	%g3,	%o7,	%i2
	edge32l	%g4,	%i4,	%o2
	fcmpgt16	%f18,	%f18,	%o0
	ldub	[%l7 + 0x27],	%i1
	or	%g7,	%l2,	%l5
	srl	%i5,	0x03,	%o6
	edge8	%l3,	%g5,	%l1
	fmovsn	%xcc,	%f4,	%f26
	addccc	%o1,	0x1D77,	%g6
	fmovdpos	%icc,	%f6,	%f31
	ldub	[%l7 + 0x3B],	%o3
	alignaddrl	%i3,	%o5,	%i7
	array8	%l6,	%o4,	%i6
	movre	%i0,	%g2,	%l4
	lduh	[%l7 + 0x28],	%g1
	movneg	%icc,	%l0,	%g3
	lduw	[%l7 + 0x30],	%o7
	add	%i2,	0x03B1,	%i4
	edge32l	%g4,	%o2,	%i1
	faligndata	%f14,	%f4,	%f12
	sdiv	%g7,	0x02F9,	%l2
	fornot2s	%f15,	%f20,	%f14
	fornot2s	%f31,	%f22,	%f20
	udivx	%o0,	0x0970,	%i5
	srax	%l5,	0x14,	%l3
	andn	%g5,	0x18B8,	%l1
	fpsub32	%f26,	%f26,	%f8
	sir	0x0CDB
	ldsw	[%l7 + 0x74],	%o6
	edge32ln	%g6,	%o3,	%o1
	for	%f8,	%f2,	%f20
	fmovsgu	%icc,	%f26,	%f18
	fornot2s	%f29,	%f29,	%f27
	fcmpne16	%f22,	%f16,	%o5
	mulx	%i3,	%l6,	%i7
	fpadd16s	%f30,	%f16,	%f8
	ldsw	[%l7 + 0x6C],	%i6
	fmul8x16al	%f20,	%f25,	%f8
	addc	%i0,	0x130A,	%g2
	addccc	%l4,	0x0676,	%g1
	edge32	%l0,	%g3,	%o4
	srl	%o7,	0x01,	%i2
	edge32	%g4,	%i4,	%o2
	umul	%i1,	%l2,	%g7
	alignaddr	%i5,	%l5,	%l3
	movne	%icc,	%o0,	%g5
	sub	%l1,	%o6,	%g6
	stx	%o1,	[%l7 + 0x58]
	movrlez	%o3,	0x3EF,	%i3
	ldub	[%l7 + 0x79],	%o5
	stx	%i7,	[%l7 + 0x28]
	xorcc	%l6,	0x0198,	%i0
	movrne	%g2,	%l4,	%g1
	andn	%i6,	0x1E97,	%l0
	alignaddr	%g3,	%o4,	%i2
	smulcc	%g4,	0x09D0,	%o7
	andcc	%i4,	0x09C3,	%o2
	fnors	%f17,	%f17,	%f13
	subccc	%i1,	%g7,	%l2
	edge32ln	%i5,	%l5,	%o0
	orn	%g5,	0x0C9D,	%l3
	orncc	%l1,	0x153E,	%o6
	fnand	%f24,	%f6,	%f30
	edge16l	%g6,	%o1,	%i3
	srlx	%o5,	0x09,	%o3
	movrgz	%i7,	0x2EC,	%i0
	sub	%g2,	%l6,	%g1
	fmovdl	%xcc,	%f0,	%f6
	movle	%xcc,	%l4,	%l0
	sir	0x0DBE
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%i6
	smulcc	%o4,	%i2,	%g4
	movpos	%xcc,	%g3,	%o7
	fmovspos	%icc,	%f26,	%f6
	andn	%i4,	%i1,	%g7
	fornot2	%f14,	%f4,	%f0
	subc	%l2,	0x0C78,	%i5
	sdivx	%o2,	0x00E6,	%o0
	fornot2	%f2,	%f8,	%f22
	xnor	%l5,	%g5,	%l3
	sethi	0x0309,	%l1
	restore %g6, 0x01F4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o1,	0x133D,	%i3
	add	%o5,	%i7,	%i0
	smul	%o3,	%l6,	%g2
	mova	%xcc,	%g1,	%l4
	fmovrdgez	%l0,	%f12,	%f2
	move	%icc,	%i6,	%o4
	sir	0x1667
	srlx	%i2,	%g4,	%o7
	fpsub16	%f4,	%f16,	%f12
	xnor	%i4,	0x0D9E,	%g3
	fmovsge	%icc,	%f19,	%f9
	fone	%f20
	ldsb	[%l7 + 0x32],	%g7
	xorcc	%i1,	%i5,	%l2
	fnot2	%f20,	%f24
	save %o2, 0x002E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%f20
	fmul8sux16	%f28,	%f18,	%f4
	smulcc	%g5,	%o0,	%l3
	fmovd	%f12,	%f14
	fpadd32	%f0,	%f24,	%f20
	udivcc	%g6,	0x14F7,	%o6
	movpos	%icc,	%o1,	%i3
	sra	%o5,	0x0B,	%i7
	sethi	0x15D5,	%l1
	stx	%o3,	[%l7 + 0x78]
	movgu	%xcc,	%i0,	%l6
	lduw	[%l7 + 0x30],	%g2
	movn	%xcc,	%g1,	%l0
	movvc	%xcc,	%i6,	%l4
	movneg	%icc,	%o4,	%g4
	fone	%f14
	fmovsvs	%xcc,	%f23,	%f24
	addccc	%i2,	0x1738,	%o7
	udivx	%i4,	0x16DD,	%g7
	sdiv	%i1,	0x083E,	%i5
	srax	%g3,	0x02,	%o2
	sth	%l5,	[%l7 + 0x2A]
	fnand	%f6,	%f20,	%f14
	andn	%g5,	0x1815,	%l2
	movvc	%icc,	%o0,	%l3
	edge8n	%o6,	%o1,	%g6
	xnorcc	%i3,	%o5,	%i7
	fnegd	%f24,	%f8
	save %l1, %o3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g2,	[%l7 + 0x49]
	udivcc	%i0,	0x06E5,	%l0
	fmovspos	%icc,	%f17,	%f5
	fmovs	%f27,	%f5
	mova	%icc,	%i6,	%g1
	subc	%l4,	%o4,	%i2
	ldub	[%l7 + 0x66],	%o7
	addccc	%g4,	%g7,	%i1
	movvs	%xcc,	%i4,	%g3
	move	%xcc,	%i5,	%o2
	sdivx	%l5,	0x16A6,	%g5
	sir	0x1349
	movge	%xcc,	%l2,	%l3
	and	%o6,	%o0,	%o1
	ldsw	[%l7 + 0x54],	%i3
	udivcc	%o5,	0x0E77,	%g6
	fzero	%f4
	edge16ln	%l1,	%o3,	%l6
	fandnot2	%f16,	%f18,	%f2
	andn	%g2,	%i0,	%i7
	sethi	0x0DB1,	%i6
	edge32l	%g1,	%l4,	%o4
	ld	[%l7 + 0x40],	%f17
	std	%f28,	[%l7 + 0x40]
	edge8ln	%l0,	%i2,	%g4
	ldd	[%l7 + 0x38],	%o6
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	ld	[%l7 + 0x20],	%f6
	ldsw	[%l7 + 0x1C],	%i4
	sth	%g3,	[%l7 + 0x48]
	movgu	%xcc,	%o2,	%l5
	fmovs	%f16,	%f27
	fcmpgt32	%f16,	%f16,	%i5
	srlx	%g5,	0x09,	%l3
	smul	%o6,	0x11E3,	%l2
	movgu	%icc,	%o1,	%o0
	andn	%o5,	0x0822,	%g6
	fcmpd	%fcc3,	%f28,	%f12
	addc	%l1,	%o3,	%i3
	array16	%g2,	%i0,	%l6
	fcmple32	%f18,	%f30,	%i6
	lduw	[%l7 + 0x7C],	%g1
	orcc	%i7,	0x144F,	%l4
	movcs	%xcc,	%l0,	%o4
	subccc	%i2,	0x0560,	%g4
	edge32ln	%g7,	%i1,	%i4
	edge16n	%g3,	%o2,	%l5
	movle	%xcc,	%i5,	%o7
	fmovdneg	%xcc,	%f20,	%f23
	fandnot2	%f10,	%f4,	%f24
	orcc	%l3,	%o6,	%l2
	addccc	%g5,	0x006A,	%o1
	alignaddr	%o5,	%o0,	%l1
	fpack16	%f6,	%f30
	movgu	%icc,	%g6,	%o3
	stb	%g2,	[%l7 + 0x77]
	xnor	%i3,	%i0,	%l6
	std	%f2,	[%l7 + 0x58]
	restore %g1, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l0,	%o4,	%l4
	orn	%i2,	%g7,	%g4
	sll	%i1,	%i4,	%o2
	fandnot2	%f14,	%f4,	%f22
	fone	%f18
	stb	%g3,	[%l7 + 0x2E]
	xor	%i5,	0x1CAD,	%o7
	fxnors	%f12,	%f4,	%f28
	fnegd	%f28,	%f14
	fabsd	%f28,	%f18
	edge8l	%l5,	%o6,	%l3
	smulcc	%l2,	0x02C7,	%o1
	sub	%g5,	%o5,	%o0
	movleu	%icc,	%l1,	%g6
	fmovdgu	%icc,	%f21,	%f7
	edge8	%g2,	%i3,	%o3
	sir	0x1266
	fmovrse	%l6,	%f17,	%f13
	subcc	%i0,	%i7,	%g1
	umulcc	%l0,	0x1AFA,	%o4
	sdiv	%i6,	0x162D,	%l4
	sll	%g7,	0x07,	%i2
	fmovsvs	%icc,	%f15,	%f13
	edge16ln	%g4,	%i1,	%i4
	ldsh	[%l7 + 0x1E],	%o2
	edge16l	%i5,	%g3,	%o7
	fmovdcs	%icc,	%f18,	%f24
	lduw	[%l7 + 0x68],	%o6
	fmovdleu	%icc,	%f27,	%f23
	smul	%l3,	%l5,	%o1
	stb	%l2,	[%l7 + 0x16]
	movcs	%icc,	%o5,	%g5
	movne	%icc,	%o0,	%g6
	fmovrdlz	%g2,	%f26,	%f14
	edge16	%i3,	%o3,	%l1
	edge16l	%i0,	%l6,	%i7
	fmovrsgez	%g1,	%f29,	%f25
	sll	%o4,	0x10,	%l0
	movne	%icc,	%i6,	%l4
	movne	%icc,	%i2,	%g7
	movl	%icc,	%i1,	%g4
	movre	%o2,	%i5,	%g3
	fones	%f5
	movleu	%xcc,	%i4,	%o7
	edge8l	%o6,	%l5,	%o1
	mulscc	%l2,	0x0E3D,	%l3
	lduh	[%l7 + 0x46],	%o5
	fmul8x16au	%f20,	%f1,	%f6
	popc	0x1070,	%o0
	ldub	[%l7 + 0x29],	%g6
	fmovspos	%icc,	%f25,	%f9
	fandnot1	%f20,	%f26,	%f30
	alignaddr	%g5,	%i3,	%o3
	stb	%l1,	[%l7 + 0x68]
	fmovrse	%i0,	%f28,	%f2
	movrlz	%l6,	%g2,	%i7
	movge	%xcc,	%g1,	%l0
	srl	%o4,	0x01,	%i6
	udiv	%i2,	0x0849,	%l4
	edge16	%i1,	%g4,	%g7
	srax	%i5,	%g3,	%o2
	movne	%icc,	%i4,	%o7
	sdivx	%l5,	0x1646,	%o1
	andncc	%o6,	%l3,	%l2
	movg	%icc,	%o5,	%o0
	sir	0x1EC9
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	lduw	[%l7 + 0x1C],	%l1
	and	%o3,	0x01A8,	%l6
	st	%f27,	[%l7 + 0x08]
	fmovsg	%xcc,	%f8,	%f15
	movle	%icc,	%g2,	%i0
	alignaddr	%i7,	%l0,	%g1
	movpos	%xcc,	%i6,	%o4
	fpadd32s	%f2,	%f6,	%f21
	fmul8x16	%f18,	%f22,	%f30
	add	%i2,	%l4,	%i1
	fmovrsgz	%g4,	%f7,	%f5
	array32	%i5,	%g3,	%g7
	stx	%i4,	[%l7 + 0x10]
	addcc	%o7,	0x0C50,	%l5
	movpos	%xcc,	%o1,	%o2
	ldsb	[%l7 + 0x7F],	%l3
	edge32	%o6,	%l2,	%o5
	fmovdn	%icc,	%f0,	%f30
	edge8l	%g6,	%o0,	%i3
	mulscc	%l1,	0x1B22,	%o3
	subcc	%g5,	%l6,	%i0
	fmovsge	%xcc,	%f7,	%f1
	movge	%icc,	%g2,	%i7
	orncc	%g1,	0x0428,	%l0
	edge8ln	%i6,	%o4,	%i2
	mulscc	%i1,	0x08C3,	%l4
	fnors	%f31,	%f14,	%f8
	orncc	%i5,	0x0CCD,	%g4
	sllx	%g3,	%g7,	%i4
	ldsw	[%l7 + 0x78],	%o7
	udivx	%o1,	0x1CD1,	%o2
	fxor	%f6,	%f28,	%f16
	edge16l	%l5,	%o6,	%l2
	lduh	[%l7 + 0x34],	%o5
	fornot2s	%f8,	%f6,	%f9
	movge	%icc,	%g6,	%o0
	fmovdgu	%icc,	%f19,	%f29
	mulscc	%i3,	0x1201,	%l1
	movl	%icc,	%l3,	%g5
	sdiv	%l6,	0x05FC,	%o3
	edge16ln	%g2,	%i0,	%i7
	srl	%g1,	0x07,	%l0
	umulcc	%i6,	%i2,	%o4
	ld	[%l7 + 0x10],	%f1
	edge16l	%i1,	%l4,	%g4
	fmovscs	%xcc,	%f23,	%f24
	edge32ln	%g3,	%g7,	%i5
	fcmpeq16	%f0,	%f4,	%o7
	srax	%o1,	%i4,	%l5
	orn	%o2,	0x0C81,	%l2
	xnorcc	%o5,	0x0401,	%g6
	sllx	%o0,	%i3,	%o6
	lduh	[%l7 + 0x1C],	%l3
	orn	%g5,	0x1AEE,	%l6
	fnot1	%f26,	%f18
	fmovsne	%icc,	%f16,	%f30
	movrgz	%o3,	%g2,	%l1
	stw	%i0,	[%l7 + 0x1C]
	edge32l	%i7,	%g1,	%l0
	edge8n	%i2,	%i6,	%i1
	sllx	%o4,	%l4,	%g3
	edge32l	%g4,	%i5,	%g7
	udiv	%o1,	0x087E,	%i4
	ldsw	[%l7 + 0x0C],	%o7
	edge32ln	%l5,	%l2,	%o5
	move	%icc,	%o2,	%g6
	movrgz	%i3,	%o6,	%o0
	edge32l	%g5,	%l3,	%o3
	movrgz	%g2,	0x327,	%l6
	xorcc	%l1,	0x1693,	%i7
	movne	%icc,	%i0,	%l0
	addcc	%g1,	0x0CD6,	%i2
	orn	%i1,	%i6,	%o4
	andn	%g3,	%l4,	%i5
	stx	%g7,	[%l7 + 0x50]
	subccc	%g4,	0x04ED,	%i4
	stw	%o1,	[%l7 + 0x34]
	sdivx	%l5,	0x0480,	%l2
	andn	%o5,	0x1EC4,	%o2
	udivx	%o7,	0x0D6A,	%g6
	smul	%i3,	%o6,	%o0
	edge32ln	%g5,	%o3,	%g2
	save %l6, 0x0652, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f29,	%f31
	move	%icc,	%i7,	%i0
	edge32l	%l1,	%l0,	%g1
	movneg	%xcc,	%i2,	%i6
	st	%f24,	[%l7 + 0x18]
	movleu	%xcc,	%i1,	%o4
	sdiv	%l4,	0x04D2,	%i5
	fmovsle	%icc,	%f18,	%f3
	edge8	%g3,	%g7,	%g4
	movrlez	%i4,	%o1,	%l2
	edge8	%l5,	%o5,	%o2
	sdivx	%o7,	0x1630,	%g6
	array16	%o6,	%i3,	%g5
	st	%f20,	[%l7 + 0x6C]
	smulcc	%o0,	%g2,	%l6
	edge16n	%o3,	%i7,	%l3
	stx	%i0,	[%l7 + 0x70]
	fxor	%f0,	%f14,	%f30
	movvs	%icc,	%l1,	%l0
	sllx	%i2,	0x03,	%i6
	st	%f22,	[%l7 + 0x24]
	edge8ln	%i1,	%o4,	%l4
	fmul8ulx16	%f6,	%f28,	%f20
	subccc	%i5,	%g1,	%g3
	andncc	%g4,	%i4,	%g7
	edge8n	%l2,	%l5,	%o1
	subc	%o2,	0x0B1B,	%o7
	popc	%o5,	%o6
	fabsd	%f8,	%f2
	fmovdl	%xcc,	%f27,	%f7
	fmovscs	%icc,	%f5,	%f28
	movg	%xcc,	%g6,	%g5
	srax	%o0,	%g2,	%i3
	movcc	%icc,	%l6,	%o3
	srax	%l3,	%i7,	%l1
	umul	%i0,	0x0EA8,	%i2
	fxnors	%f15,	%f19,	%f8
	orcc	%l0,	0x0EEC,	%i6
	orn	%o4,	%i1,	%i5
	srl	%l4,	0x14,	%g3
	save %g1, 0x1062, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%f22
	ldub	[%l7 + 0x7D],	%g4
	movl	%icc,	%g7,	%l5
	orncc	%l2,	%o2,	%o1
	sdivx	%o5,	0x1735,	%o7
	fmovdleu	%icc,	%f18,	%f15
	fors	%f15,	%f24,	%f16
	movcc	%xcc,	%g6,	%g5
	movcc	%xcc,	%o0,	%g2
	orncc	%i3,	%o6,	%l6
	addcc	%l3,	%i7,	%l1
	mova	%xcc,	%i0,	%i2
	movre	%o3,	%i6,	%o4
	popc	0x00E6,	%i1
	movcs	%icc,	%l0,	%l4
	edge32ln	%i5,	%g1,	%g3
	movrlz	%i4,	0x177,	%g7
	fmovscc	%icc,	%f0,	%f26
	movg	%icc,	%g4,	%l5
	movrgz	%l2,	0x0DE,	%o2
	fmul8ulx16	%f10,	%f26,	%f10
	fand	%f10,	%f28,	%f14
	orn	%o5,	%o1,	%g6
	fpsub16s	%f16,	%f24,	%f26
	fands	%f16,	%f2,	%f7
	fzero	%f6
	udivx	%g5,	0x0A7B,	%o0
	andn	%o7,	0x04F0,	%g2
	siam	0x4
	edge16n	%o6,	%i3,	%l6
	ldsw	[%l7 + 0x70],	%l3
	fnand	%f18,	%f0,	%f0
	subc	%l1,	0x07BD,	%i0
	udivx	%i2,	0x0973,	%o3
	edge8ln	%i7,	%o4,	%i1
	srlx	%i6,	%l0,	%i5
	movrlez	%l4,	%g1,	%i4
	fone	%f30
	save %g3, 0x08C4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f8
	movge	%icc,	%g7,	%l2
	ld	[%l7 + 0x74],	%f23
	sir	0x19B6
	smul	%l5,	0x044A,	%o2
	sdivx	%o1,	0x092B,	%g6
	fone	%f28
	fcmple16	%f10,	%f12,	%o5
	srl	%o0,	%g5,	%o7
	edge16l	%g2,	%o6,	%i3
	fnot1	%f30,	%f26
	lduh	[%l7 + 0x0C],	%l3
	fnor	%f10,	%f4,	%f20
	fnegd	%f8,	%f30
	srax	%l6,	0x1E,	%i0
	ldsh	[%l7 + 0x76],	%l1
	xorcc	%o3,	0x1986,	%i7
	edge8ln	%o4,	%i1,	%i2
	lduh	[%l7 + 0x18],	%i6
	sllx	%l0,	%l4,	%g1
	fone	%f0
	stw	%i5,	[%l7 + 0x3C]
	edge32	%g3,	%g4,	%i4
	fzeros	%f29
	orncc	%l2,	%g7,	%o2
	array8	%o1,	%l5,	%o5
	fmovdcc	%icc,	%f30,	%f29
	movvc	%icc,	%g6,	%o0
	restore %o7, %g2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i3,	%o6
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	stw	%l1,	[%l7 + 0x50]
	ldd	[%l7 + 0x28],	%f12
	st	%f23,	[%l7 + 0x3C]
	edge8	%i7,	%o4,	%o3
	movre	%i1,	0x3C2,	%i2
	nop
	set	0x1C, %l3
	ldub	[%l7 + %l3],	%l0
	fxnors	%f13,	%f19,	%f31
	fmovsne	%xcc,	%f10,	%f29
	udivcc	%i6,	0x0A96,	%g1
	sllx	%l4,	0x1E,	%g3
	andn	%g4,	%i5,	%i4
	sth	%g7,	[%l7 + 0x22]
	edge8l	%l2,	%o2,	%l5
	fmovdn	%xcc,	%f10,	%f13
	fmovsvc	%xcc,	%f26,	%f15
	edge32n	%o1,	%g6,	%o5
	xnorcc	%o7,	%o0,	%g2
	andncc	%g5,	%i3,	%o6
	fmul8x16	%f3,	%f12,	%f14
	array8	%l6,	%i0,	%l3
	edge8	%i7,	%l1,	%o4
	movre	%i1,	%i2,	%o3
	subccc	%i6,	%l0,	%g1
	fpsub32	%f22,	%f8,	%f24
	fmovsneg	%xcc,	%f11,	%f8
	fnot2	%f0,	%f6
	st	%f4,	[%l7 + 0x48]
	andcc	%l4,	0x0E8B,	%g3
	sdivx	%i5,	0x067C,	%g4
	mova	%xcc,	%g7,	%l2
	movle	%icc,	%o2,	%l5
	edge16l	%i4,	%o1,	%g6
	udivx	%o5,	0x17EF,	%o0
	edge16ln	%g2,	%o7,	%g5
	fmovsne	%xcc,	%f17,	%f29
	movrlz	%i3,	0x283,	%l6
	addcc	%o6,	0x0480,	%i0
	fsrc1s	%f0,	%f10
	nop
	set	0x0C, %g5
	ldsw	[%l7 + %g5],	%i7
	movrne	%l3,	%l1,	%i1
	fmovsn	%icc,	%f30,	%f11
	fors	%f15,	%f12,	%f19
	lduw	[%l7 + 0x10],	%i2
	mulx	%o4,	%o3,	%l0
	udiv	%i6,	0x04EA,	%g1
	mulx	%l4,	0x00C4,	%i5
	edge16	%g4,	%g7,	%l2
	sdivx	%g3,	0x152E,	%o2
	stw	%l5,	[%l7 + 0x54]
	edge16ln	%i4,	%o1,	%g6
	edge8l	%o5,	%g2,	%o0
	ldsh	[%l7 + 0x3E],	%g5
	fmovdcs	%icc,	%f29,	%f26
	lduh	[%l7 + 0x54],	%i3
	stx	%l6,	[%l7 + 0x50]
	fmovdvs	%icc,	%f31,	%f16
	fcmple32	%f28,	%f12,	%o6
	orncc	%o7,	%i0,	%l3
	movne	%icc,	%i7,	%l1
	add	%i2,	%i1,	%o3
	andn	%o4,	0x1AEA,	%l0
	addccc	%i6,	0x1152,	%l4
	sra	%g1,	0x0B,	%i5
	lduw	[%l7 + 0x78],	%g4
	srax	%g7,	0x05,	%g3
	lduh	[%l7 + 0x5A],	%o2
	add	%l2,	%i4,	%l5
	srlx	%g6,	%o5,	%o1
	fmovdne	%icc,	%f4,	%f15
	fmovda	%xcc,	%f8,	%f19
	fmovsvc	%xcc,	%f19,	%f27
	addc	%o0,	0x01AD,	%g2
	array8	%i3,	%g5,	%l6
	movre	%o6,	0x3D9,	%o7
	sdivx	%i0,	0x0D8A,	%i7
	addccc	%l1,	%l3,	%i2
	andncc	%i1,	%o4,	%l0
	movre	%i6,	0x31D,	%o3
	udivcc	%g1,	0x0358,	%l4
	fnot2	%f26,	%f30
	movneg	%icc,	%i5,	%g7
	subc	%g4,	%o2,	%g3
	ldsw	[%l7 + 0x08],	%l2
	edge32l	%l5,	%i4,	%g6
	xor	%o5,	%o1,	%g2
	ldsw	[%l7 + 0x78],	%o0
	ldub	[%l7 + 0x77],	%g5
	xorcc	%l6,	%i3,	%o7
	and	%i0,	%o6,	%i7
	sth	%l3,	[%l7 + 0x64]
	sdivx	%i2,	0x12AC,	%i1
	mulx	%l1,	%o4,	%l0
	movgu	%xcc,	%i6,	%o3
	andn	%g1,	0x0052,	%l4
	smulcc	%g7,	0x0FBF,	%i5
	sdivcc	%o2,	0x1682,	%g4
	move	%xcc,	%l2,	%g3
	edge8ln	%l5,	%g6,	%o5
	edge8l	%i4,	%g2,	%o1
	srl	%g5,	0x08,	%l6
	sdiv	%i3,	0x1A0D,	%o0
	fnands	%f23,	%f9,	%f10
	fmovdne	%xcc,	%f22,	%f16
	movvc	%xcc,	%i0,	%o6
	orncc	%i7,	%o7,	%i2
	nop
	set	0x29, %l0
	ldub	[%l7 + %l0],	%i1
	edge32ln	%l1,	%o4,	%l3
	fnand	%f22,	%f12,	%f26
	movg	%xcc,	%i6,	%o3
	and	%g1,	0x1C71,	%l0
	nop
	set	0x38, %o5
	sth	%g7,	[%l7 + %o5]
	andncc	%i5,	%o2,	%l4
	edge8l	%l2,	%g4,	%l5
	movge	%icc,	%g3,	%g6
	sdivx	%o5,	0x19EC,	%g2
	andncc	%i4,	%g5,	%o1
	edge8ln	%l6,	%i3,	%i0
	orn	%o0,	0x0D31,	%i7
	movvs	%xcc,	%o7,	%o6
	and	%i1,	%l1,	%i2
	move	%xcc,	%l3,	%i6
	sra	%o3,	%g1,	%o4
	movrgez	%g7,	0x2C3,	%l0
	addc	%i5,	0x0446,	%l4
	lduh	[%l7 + 0x4E],	%l2
	andncc	%o2,	%l5,	%g3
	fpsub32s	%f11,	%f21,	%f29
	sra	%g6,	0x08,	%g4
	srl	%g2,	%o5,	%i4
	fmovrslez	%o1,	%f7,	%f7
	edge8ln	%l6,	%i3,	%g5
	sth	%i0,	[%l7 + 0x78]
	edge8ln	%o0,	%i7,	%o7
	movrgez	%i1,	0x293,	%l1
	edge8n	%o6,	%l3,	%i6
	andn	%o3,	%i2,	%g1
	orncc	%o4,	%g7,	%i5
	movvc	%xcc,	%l0,	%l4
	ldd	[%l7 + 0x60],	%f8
	orncc	%l2,	0x0507,	%o2
	stb	%l5,	[%l7 + 0x73]
	orcc	%g6,	%g4,	%g2
	stb	%g3,	[%l7 + 0x24]
	sllx	%i4,	%o1,	%o5
	fmovdvc	%xcc,	%f30,	%f5
	nop
	set	0x0A, %o4
	ldub	[%l7 + %o4],	%i3
	edge32n	%l6,	%g5,	%o0
	udivcc	%i7,	0x09A8,	%o7
	siam	0x4
	movne	%icc,	%i0,	%i1
	movpos	%icc,	%l1,	%o6
	edge32ln	%i6,	%l3,	%o3
	fmovdleu	%icc,	%f8,	%f12
	fmovsle	%icc,	%f27,	%f26
	udivx	%g1,	0x0B1A,	%i2
	movrlez	%g7,	0x028,	%o4
	sdivcc	%i5,	0x04AC,	%l4
	ld	[%l7 + 0x44],	%f1
	fxnor	%f0,	%f20,	%f30
	ldsh	[%l7 + 0x50],	%l0
	fabsd	%f20,	%f8
	xnorcc	%o2,	%l5,	%l2
	alignaddr	%g6,	%g4,	%g3
	fmovsvc	%xcc,	%f0,	%f10
	fpadd32	%f8,	%f0,	%f8
	fmovdvc	%xcc,	%f28,	%f24
	udivcc	%i4,	0x0469,	%g2
	subc	%o1,	%i3,	%o5
	movrne	%l6,	%o0,	%g5
	fmovsge	%xcc,	%f11,	%f17
	edge8l	%i7,	%o7,	%i1
	ldub	[%l7 + 0x24],	%i0
	andn	%l1,	%i6,	%o6
	and	%o3,	%g1,	%l3
	smulcc	%i2,	%o4,	%g7
	for	%f22,	%f0,	%f22
	mulx	%l4,	0x13ED,	%i5
	mova	%icc,	%o2,	%l0
	fornot2s	%f0,	%f18,	%f26
	ldd	[%l7 + 0x70],	%l2
	array32	%g6,	%l5,	%g4
	movrgz	%g3,	%g2,	%i4
	smulcc	%o1,	0x098A,	%i3
	fnands	%f18,	%f21,	%f19
	fmovsvs	%icc,	%f18,	%f27
	movleu	%icc,	%o5,	%l6
	ldsb	[%l7 + 0x56],	%g5
	or	%o0,	0x1B04,	%o7
	stw	%i1,	[%l7 + 0x08]
	edge16ln	%i7,	%i0,	%i6
	umul	%o6,	%o3,	%g1
	subcc	%l1,	0x1D46,	%i2
	addc	%l3,	%o4,	%l4
	xnor	%i5,	%o2,	%g7
	movvc	%icc,	%l0,	%l2
	sll	%l5,	%g4,	%g6
	fmovscc	%icc,	%f31,	%f10
	ldd	[%l7 + 0x10],	%f0
	xorcc	%g2,	%g3,	%i4
	movgu	%icc,	%o1,	%i3
	fxnor	%f10,	%f8,	%f14
	lduh	[%l7 + 0x40],	%l6
	mulscc	%g5,	0x069C,	%o0
	sethi	0x133C,	%o5
	orn	%o7,	0x089A,	%i1
	movneg	%xcc,	%i0,	%i6
	movpos	%icc,	%o6,	%o3
	stx	%g1,	[%l7 + 0x38]
	mulscc	%l1,	0x0206,	%i2
	fcmpeq16	%f4,	%f28,	%l3
	umulcc	%i7,	0x0003,	%l4
	fmovrsne	%i5,	%f18,	%f8
	array32	%o2,	%g7,	%o4
	sdivx	%l2,	0x1E6E,	%l5
	andcc	%g4,	0x16C5,	%l0
	fsrc1s	%f3,	%f26
	fmul8sux16	%f4,	%f16,	%f8
	sub	%g6,	0x1274,	%g3
	lduh	[%l7 + 0x5C],	%g2
	movcc	%icc,	%o1,	%i3
	mulscc	%l6,	%g5,	%i4
	movpos	%icc,	%o0,	%o5
	movre	%i1,	0x347,	%i0
	addc	%o7,	%i6,	%o6
	ldsb	[%l7 + 0x1F],	%g1
	udivx	%o3,	0x0286,	%l1
	popc	0x11FD,	%l3
	nop
	set	0x57, %i1
	ldub	[%l7 + %i1],	%i7
	ldx	[%l7 + 0x30],	%l4
	movrlz	%i5,	%i2,	%g7
	nop
	set	0x42, %o3
	ldsh	[%l7 + %o3],	%o4
	xorcc	%l2,	%l5,	%g4
	movn	%icc,	%o2,	%g6
	movcs	%xcc,	%l0,	%g3
	movrne	%o1,	%g2,	%l6
	fmovspos	%xcc,	%f2,	%f2
	andncc	%i3,	%g5,	%i4
	move	%xcc,	%o0,	%o5
	sllx	%i1,	%i0,	%i6
	add	%o6,	%g1,	%o7
	array32	%l1,	%o3,	%l3
	edge32n	%i7,	%i5,	%l4
	movvs	%xcc,	%i2,	%o4
	edge32ln	%l2,	%g7,	%l5
	sethi	0x0E9B,	%g4
	movge	%icc,	%o2,	%l0
	edge16	%g3,	%o1,	%g2
	xnorcc	%l6,	%g6,	%i3
	stw	%g5,	[%l7 + 0x3C]
	sllx	%o0,	0x0D,	%o5
	edge32	%i1,	%i0,	%i4
	lduw	[%l7 + 0x1C],	%i6
	fmovrsgez	%g1,	%f27,	%f16
	fxnors	%f8,	%f5,	%f30
	fcmple16	%f8,	%f24,	%o7
	movrne	%l1,	%o3,	%o6
	movn	%icc,	%l3,	%i7
	xnorcc	%i5,	0x1B60,	%i2
	ld	[%l7 + 0x78],	%f8
	subccc	%o4,	%l4,	%g7
	ldub	[%l7 + 0x20],	%l2
	subccc	%g4,	%o2,	%l0
	movge	%xcc,	%l5,	%o1
	movgu	%xcc,	%g3,	%g2
	fandnot1s	%f5,	%f16,	%f24
	fmovdgu	%icc,	%f15,	%f13
	edge8l	%g6,	%i3,	%g5
	popc	0x0DD4,	%l6
	fnot1s	%f31,	%f28
	sra	%o5,	%o0,	%i1
	orcc	%i0,	%i4,	%g1
	ldsh	[%l7 + 0x7C],	%o7
	fmuld8ulx16	%f29,	%f29,	%f12
	movg	%xcc,	%l1,	%i6
	ldd	[%l7 + 0x18],	%o6
	or	%l3,	%o3,	%i5
	fmovse	%xcc,	%f25,	%f19
	movneg	%icc,	%i2,	%o4
	movvs	%xcc,	%l4,	%i7
	ldd	[%l7 + 0x40],	%f14
	ldub	[%l7 + 0x76],	%g7
	array32	%l2,	%g4,	%o2
	fpsub16	%f28,	%f22,	%f22
	nop
	set	0x26, %l1
	sth	%l5,	[%l7 + %l1]
	sdivcc	%o1,	0x0C8B,	%l0
	fornot2	%f22,	%f6,	%f18
	movrlez	%g3,	0x1A1,	%g6
	fpadd16s	%f16,	%f6,	%f2
	addcc	%i3,	%g5,	%g2
	stb	%l6,	[%l7 + 0x2A]
	mulx	%o0,	0x001B,	%o5
	and	%i0,	0x1815,	%i1
	smulcc	%g1,	0x05BF,	%o7
	smul	%l1,	0x0AC9,	%i6
	alignaddrl	%i4,	%o6,	%l3
	stw	%o3,	[%l7 + 0x54]
	nop
	set	0x26, %i7
	sth	%i2,	[%l7 + %i7]
	sdiv	%i5,	0x1292,	%l4
	movrgez	%i7,	0x181,	%o4
	fmovdg	%xcc,	%f23,	%f25
	movge	%xcc,	%g7,	%g4
	edge16l	%l2,	%o2,	%l5
	fpadd32s	%f21,	%f6,	%f0
	addc	%o1,	0x08E7,	%g3
	smul	%g6,	0x08FB,	%i3
	orncc	%l0,	0x0511,	%g2
	stx	%l6,	[%l7 + 0x20]
	umulcc	%o0,	0x0C97,	%o5
	subc	%g5,	0x0371,	%i0
	mova	%xcc,	%i1,	%o7
	movge	%xcc,	%l1,	%i6
	edge8l	%g1,	%i4,	%l3
	ldx	[%l7 + 0x30],	%o6
	subccc	%o3,	%i5,	%i2
	xnorcc	%l4,	%o4,	%g7
	fmovsvs	%icc,	%f30,	%f23
	array16	%i7,	%g4,	%o2
	std	%f10,	[%l7 + 0x10]
	sra	%l5,	0x04,	%o1
	edge16	%l2,	%g3,	%g6
	edge8ln	%l0,	%i3,	%l6
	smulcc	%o0,	%o5,	%g2
	ldsw	[%l7 + 0x3C],	%g5
	addccc	%i0,	%i1,	%l1
	array16	%i6,	%g1,	%o7
	movge	%xcc,	%i4,	%l3
	fmovsa	%icc,	%f13,	%f4
	fnot2s	%f22,	%f26
	movl	%xcc,	%o3,	%o6
	movneg	%icc,	%i2,	%i5
	edge32	%l4,	%o4,	%i7
	fmovdvc	%icc,	%f5,	%f30
	edge16ln	%g7,	%g4,	%o2
	umulcc	%o1,	0x0034,	%l2
	subccc	%g3,	%l5,	%g6
	edge32n	%i3,	%l0,	%o0
	movvc	%xcc,	%o5,	%g2
	movcc	%xcc,	%l6,	%i0
	addc	%i1,	%l1,	%i6
	udiv	%g1,	0x0BF3,	%g5
	and	%i4,	0x064F,	%o7
	orcc	%l3,	%o3,	%o6
	subcc	%i2,	%l4,	%i5
	sethi	0x1E9D,	%o4
	sdivx	%g7,	0x15EA,	%i7
	sdiv	%g4,	0x0405,	%o1
	smul	%o2,	%g3,	%l2
	fmovdneg	%icc,	%f2,	%f20
	movrgz	%l5,	0x00F,	%i3
	fmovsvs	%icc,	%f11,	%f2
	xnor	%l0,	0x07F4,	%o0
	udivcc	%g6,	0x07DA,	%o5
	st	%f23,	[%l7 + 0x38]
	xnorcc	%l6,	%g2,	%i1
	ldx	[%l7 + 0x28],	%l1
	ldub	[%l7 + 0x37],	%i0
	movcs	%icc,	%i6,	%g1
	fzero	%f30
	sub	%g5,	%o7,	%i4
	fcmple16	%f6,	%f30,	%o3
	alignaddr	%o6,	%i2,	%l4
	andn	%l3,	0x13FA,	%o4
	edge32	%g7,	%i5,	%i7
	addc	%o1,	%g4,	%g3
	fmovspos	%xcc,	%f25,	%f4
	sdivx	%o2,	0x122C,	%l2
	alignaddr	%l5,	%i3,	%l0
	fmovrslez	%o0,	%f8,	%f26
	xnor	%g6,	%l6,	%o5
	fnot2	%f28,	%f28
	fmovsleu	%icc,	%f14,	%f18
	edge32ln	%g2,	%i1,	%l1
	sub	%i0,	0x1B76,	%g1
	restore %i6, %g5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%f2
	movl	%icc,	%o3,	%o6
	fmovdvs	%xcc,	%f30,	%f25
	edge16ln	%i4,	%i2,	%l4
	mulx	%o4,	%l3,	%g7
	xorcc	%i7,	%o1,	%i5
	fmovrdgz	%g3,	%f18,	%f12
	smul	%o2,	0x023E,	%g4
	sdivcc	%l2,	0x0E46,	%l5
	xnorcc	%i3,	%o0,	%g6
	movl	%xcc,	%l6,	%o5
	for	%f12,	%f30,	%f2
	sra	%g2,	0x13,	%l0
	nop
	set	0x33, %i0
	ldsb	[%l7 + %i0],	%l1
	ldsh	[%l7 + 0x46],	%i1
	bshuffle	%f22,	%f12,	%f6
	st	%f29,	[%l7 + 0x2C]
	movn	%xcc,	%g1,	%i0
	srlx	%g5,	%o7,	%i6
	edge32ln	%o3,	%i4,	%i2
	move	%xcc,	%o6,	%o4
	smul	%l3,	0x0AB1,	%g7
	movl	%icc,	%l4,	%i7
	move	%icc,	%o1,	%i5
	fmul8x16au	%f31,	%f1,	%f2
	sdiv	%g3,	0x1FA7,	%g4
	xnor	%l2,	%o2,	%l5
	sdivcc	%i3,	0x0235,	%o0
	fornot1	%f8,	%f26,	%f28
	ldsb	[%l7 + 0x57],	%g6
	movre	%l6,	%o5,	%g2
	fone	%f22
	sethi	0x07D1,	%l1
	udivx	%i1,	0x1D96,	%g1
	fones	%f4
	fmovrde	%l0,	%f6,	%f24
	nop
	set	0x28, %g3
	stb	%g5,	[%l7 + %g3]
	fcmpes	%fcc2,	%f11,	%f6
	smulcc	%o7,	0x0051,	%i6
	save %o3, 0x0DB6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i4,	%i2,	%o4
	array16	%o6,	%l3,	%l4
	subccc	%i7,	%o1,	%i5
	movvs	%icc,	%g3,	%g4
	addccc	%l2,	0x033F,	%o2
	stw	%l5,	[%l7 + 0x64]
	edge8l	%i3,	%o0,	%g7
	xor	%l6,	%o5,	%g2
	subcc	%g6,	%i1,	%l1
	fmul8x16au	%f0,	%f12,	%f2
	sethi	0x0F14,	%l0
	movleu	%icc,	%g5,	%o7
	sra	%g1,	0x16,	%i6
	subccc	%i0,	0x19EF,	%i4
	edge32n	%i2,	%o3,	%o6
	edge32ln	%o4,	%l4,	%l3
	fmovdle	%xcc,	%f11,	%f11
	movpos	%xcc,	%o1,	%i5
	edge8	%i7,	%g4,	%l2
	fmovrsne	%o2,	%f10,	%f31
	sdivcc	%g3,	0x1728,	%i3
	std	%f8,	[%l7 + 0x28]
	edge16ln	%l5,	%o0,	%g7
	movvc	%icc,	%o5,	%g2
	fors	%f16,	%f6,	%f20
	fornot2s	%f30,	%f0,	%f21
	udiv	%l6,	0x09D9,	%i1
	movrgz	%l1,	0x1CE,	%l0
	xorcc	%g6,	0x06E9,	%o7
	ldx	[%l7 + 0x50],	%g5
	movleu	%icc,	%i6,	%i0
	st	%f1,	[%l7 + 0x28]
	fpsub16s	%f15,	%f18,	%f11
	movn	%icc,	%i4,	%i2
	movrlz	%o3,	%g1,	%o6
	movneg	%icc,	%l4,	%o4
	movrgez	%o1,	0x183,	%l3
	fmovsvs	%icc,	%f29,	%f3
	alignaddr	%i7,	%g4,	%l2
	edge32	%o2,	%i5,	%i3
	orncc	%g3,	%l5,	%o0
	std	%f28,	[%l7 + 0x38]
	edge32l	%g7,	%g2,	%l6
	ldsw	[%l7 + 0x28],	%i1
	edge8l	%o5,	%l0,	%g6
	sth	%l1,	[%l7 + 0x76]
	andncc	%g5,	%o7,	%i6
	fmovdgu	%icc,	%f16,	%f1
	ldd	[%l7 + 0x18],	%i4
	fcmple16	%f0,	%f10,	%i2
	ldx	[%l7 + 0x08],	%o3
	alignaddrl	%i0,	%o6,	%l4
	lduh	[%l7 + 0x54],	%g1
	movrgez	%o1,	%o4,	%l3
	srl	%g4,	0x1F,	%i7
	fmovsgu	%xcc,	%f29,	%f24
	edge8n	%o2,	%i5,	%l2
	sdiv	%g3,	0x18AE,	%i3
	st	%f29,	[%l7 + 0x14]
	fcmpgt16	%f2,	%f16,	%o0
	sdiv	%g7,	0x0DCB,	%g2
	movrgez	%l5,	%i1,	%l6
	movge	%xcc,	%l0,	%g6
	move	%icc,	%l1,	%o5
	move	%xcc,	%g5,	%i6
	edge16ln	%i4,	%o7,	%o3
	fmovsa	%icc,	%f10,	%f28
	orn	%i2,	%o6,	%i0
	subccc	%g1,	0x0F05,	%o1
	umul	%o4,	0x08AF,	%l4
	movrlez	%l3,	0x155,	%i7
	alignaddrl	%o2,	%g4,	%i5
	edge32	%g3,	%i3,	%l2
	movvc	%xcc,	%o0,	%g7
	andncc	%l5,	%i1,	%g2
	andcc	%l0,	%g6,	%l1
	stx	%l6,	[%l7 + 0x48]
	std	%f30,	[%l7 + 0x58]
	movrne	%g5,	0x315,	%o5
	orncc	%i4,	%i6,	%o7
	addccc	%i2,	%o3,	%i0
	fmul8x16au	%f28,	%f6,	%f16
	addccc	%g1,	0x13FB,	%o6
	fmovrdgez	%o4,	%f20,	%f16
	movrne	%l4,	%o1,	%l3
	fcmpes	%fcc3,	%f23,	%f18
	movg	%xcc,	%o2,	%g4
	movre	%i5,	0x366,	%i7
	mova	%icc,	%g3,	%l2
	edge32n	%i3,	%o0,	%l5
	ld	[%l7 + 0x5C],	%f24
	edge8l	%g7,	%g2,	%i1
	fpadd16s	%f15,	%f12,	%f29
	movneg	%xcc,	%l0,	%g6
	std	%f0,	[%l7 + 0x50]
	movge	%xcc,	%l6,	%l1
	ld	[%l7 + 0x6C],	%f22
	fcmple32	%f30,	%f12,	%g5
	lduh	[%l7 + 0x30],	%o5
	mulscc	%i4,	%i6,	%i2
	udivcc	%o3,	0x1F8D,	%i0
	andn	%g1,	%o7,	%o6
	ld	[%l7 + 0x60],	%f13
	srax	%o4,	0x1D,	%o1
	orcc	%l3,	%o2,	%l4
	movrgz	%g4,	0x194,	%i5
	save %i7, %l2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1983
	lduh	[%l7 + 0x46],	%o0
	fpsub32s	%f5,	%f8,	%f11
	addc	%l5,	%g3,	%g2
	edge8ln	%i1,	%g7,	%g6
	fmovrdgez	%l6,	%f20,	%f14
	sethi	0x00D9,	%l1
	xorcc	%l0,	0x0593,	%g5
	addc	%i4,	%i6,	%o5
	and	%o3,	%i0,	%i2
	movrgz	%g1,	0x013,	%o7
	movrgz	%o6,	0x171,	%o1
	movn	%xcc,	%l3,	%o2
	fnors	%f4,	%f5,	%f14
	movleu	%xcc,	%o4,	%g4
	addcc	%l4,	0x0B1E,	%i7
	movn	%xcc,	%i5,	%i3
	fand	%f22,	%f10,	%f16
	array32	%o0,	%l5,	%l2
	array8	%g3,	%g2,	%g7
	fmul8sux16	%f14,	%f18,	%f22
	subccc	%i1,	0x077E,	%l6
	stx	%g6,	[%l7 + 0x78]
	alignaddrl	%l0,	%l1,	%g5
	xnor	%i6,	0x1FC6,	%i4
	mova	%icc,	%o5,	%o3
	movrgez	%i2,	0x0EB,	%i0
	fands	%f28,	%f13,	%f29
	fmovsvs	%xcc,	%f15,	%f30
	movg	%xcc,	%o7,	%g1
	fmovscs	%xcc,	%f30,	%f2
	std	%f26,	[%l7 + 0x20]
	sth	%o1,	[%l7 + 0x6C]
	sdiv	%o6,	0x18CD,	%l3
	array16	%o2,	%g4,	%o4
	orn	%l4,	0x0B89,	%i7
	movrlz	%i3,	%i5,	%l5
	movn	%icc,	%l2,	%g3
	movleu	%xcc,	%o0,	%g7
	umulcc	%g2,	%i1,	%g6
	orcc	%l6,	%l1,	%l0
	fmovrdne	%g5,	%f26,	%f22
	movcs	%xcc,	%i4,	%o5
	array16	%i6,	%o3,	%i0
	edge8	%o7,	%g1,	%i2
	ldsh	[%l7 + 0x66],	%o6
	edge16n	%l3,	%o2,	%o1
	movre	%o4,	%l4,	%i7
	ldsh	[%l7 + 0x76],	%g4
	fornot2s	%f12,	%f18,	%f26
	fsrc2s	%f21,	%f27
	st	%f10,	[%l7 + 0x1C]
	lduw	[%l7 + 0x38],	%i5
	alignaddr	%l5,	%l2,	%g3
	fandnot1	%f6,	%f24,	%f22
	movre	%o0,	%i3,	%g7
	lduw	[%l7 + 0x24],	%g2
	fmovrsgez	%i1,	%f0,	%f19
	edge32	%g6,	%l6,	%l1
	sdiv	%g5,	0x0FBA,	%i4
	and	%l0,	0x18B2,	%o5
	fmovsleu	%icc,	%f3,	%f28
	xorcc	%o3,	0x0344,	%i0
	udivcc	%i6,	0x19C5,	%g1
	ld	[%l7 + 0x14],	%f28
	srax	%o7,	%i2,	%l3
	subcc	%o2,	%o1,	%o6
	addc	%l4,	%i7,	%g4
	fpack32	%f20,	%f20,	%f6
	addcc	%i5,	%o4,	%l2
	movrgez	%l5,	%g3,	%i3
	udiv	%o0,	0x0C18,	%g2
	edge16ln	%g7,	%i1,	%l6
	fcmple16	%f8,	%f28,	%l1
	fcmpeq32	%f12,	%f22,	%g6
	addcc	%g5,	0x15ED,	%i4
	lduh	[%l7 + 0x16],	%o5
	fcmpgt16	%f2,	%f10,	%o3
	fxors	%f16,	%f8,	%f14
	edge16	%l0,	%i0,	%g1
	edge16	%i6,	%i2,	%o7
	alignaddr	%o2,	%l3,	%o1
	edge16n	%o6,	%l4,	%g4
	ldsh	[%l7 + 0x10],	%i7
	fmuld8ulx16	%f8,	%f18,	%f22
	ldsb	[%l7 + 0x7F],	%i5
	movleu	%xcc,	%l2,	%o4
	ldd	[%l7 + 0x38],	%f24
	srl	%l5,	0x13,	%i3
	orcc	%g3,	%g2,	%g7
	srl	%o0,	0x06,	%l6
	alignaddrl	%l1,	%i1,	%g6
	st	%f2,	[%l7 + 0x14]
	udivcc	%g5,	0x0002,	%i4
	mulx	%o5,	0x0BA9,	%l0
	fsrc2s	%f23,	%f5
	ldub	[%l7 + 0x19],	%o3
	movvs	%icc,	%i0,	%i6
	andncc	%i2,	%g1,	%o7
	addcc	%o2,	%l3,	%o1
	fandnot2s	%f31,	%f11,	%f1
	fmovdvc	%icc,	%f6,	%f7
	fcmple16	%f26,	%f26,	%l4
	movvs	%xcc,	%o6,	%i7
	edge8	%g4,	%i5,	%l2
	fmovdle	%xcc,	%f30,	%f1
	fandnot2	%f26,	%f14,	%f12
	fcmpne16	%f2,	%f20,	%l5
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	umul	%g7,	0x0BE4,	%o0
	fpack16	%f12,	%f24
	udiv	%l6,	0x0585,	%l1
	movn	%icc,	%g2,	%i1
	xnorcc	%g6,	0x108D,	%g5
	fpack32	%f22,	%f16,	%f14
	xor	%o5,	0x0A38,	%i4
	fnot2s	%f13,	%f21
	andncc	%o3,	%i0,	%i6
	addc	%i2,	%g1,	%o7
	fpadd32s	%f31,	%f29,	%f19
	fmovsleu	%icc,	%f0,	%f18
	movl	%xcc,	%o2,	%l0
	fmul8ulx16	%f18,	%f16,	%f4
	ldub	[%l7 + 0x36],	%l3
	edge8	%o1,	%o6,	%l4
	add	%i7,	%i5,	%l2
	edge8l	%g4,	%l5,	%g3
	mulscc	%o4,	0x0FE1,	%i3
	subc	%o0,	%g7,	%l6
	fmovrse	%g2,	%f22,	%f21
	movgu	%icc,	%l1,	%g6
	subcc	%i1,	0x12AA,	%g5
	mova	%icc,	%i4,	%o3
	add	%i0,	0x048D,	%i6
	fandnot2	%f28,	%f8,	%f30
	sdivcc	%o5,	0x0312,	%g1
	edge32n	%i2,	%o7,	%o2
	fandnot2s	%f4,	%f15,	%f28
	fones	%f24
	sth	%l3,	[%l7 + 0x2C]
	sethi	0x1F7A,	%o1
	movl	%icc,	%l0,	%o6
	ldub	[%l7 + 0x53],	%i7
	fandnot1	%f0,	%f24,	%f8
	movleu	%xcc,	%i5,	%l4
	xorcc	%g4,	0x0EC8,	%l2
	ldsw	[%l7 + 0x10],	%g3
	movg	%xcc,	%l5,	%o4
	andcc	%o0,	0x0F8F,	%g7
	fmul8x16al	%f28,	%f12,	%f8
	fandnot1	%f26,	%f14,	%f20
	fcmpes	%fcc0,	%f1,	%f30
	movpos	%xcc,	%l6,	%i3
	movvs	%xcc,	%l1,	%g2
	fandnot2	%f20,	%f24,	%f4
	andn	%g6,	0x0060,	%i1
	alignaddr	%i4,	%o3,	%g5
	ldub	[%l7 + 0x3C],	%i6
	andncc	%i0,	%o5,	%g1
	array8	%o7,	%i2,	%o2
	move	%xcc,	%o1,	%l0
	orcc	%l3,	%i7,	%i5
	xnor	%o6,	%l4,	%g4
	fmovrdgez	%g3,	%f6,	%f18
	orn	%l5,	%o4,	%o0
	move	%xcc,	%l2,	%g7
	movcs	%xcc,	%l6,	%l1
	edge32n	%g2,	%i3,	%g6
	ldd	[%l7 + 0x48],	%f8
	edge16	%i4,	%o3,	%g5
	mulscc	%i6,	%i1,	%i0
	movleu	%icc,	%g1,	%o5
	movleu	%icc,	%i2,	%o2
	fornot1	%f4,	%f12,	%f30
	xorcc	%o7,	0x0F30,	%o1
	xnor	%l0,	%l3,	%i7
	alignaddrl	%i5,	%l4,	%o6
	fmovdcs	%xcc,	%f4,	%f26
	ldx	[%l7 + 0x30],	%g4
	srl	%g3,	0x06,	%o4
	orncc	%l5,	%l2,	%o0
	edge32l	%l6,	%l1,	%g2
	edge16	%i3,	%g7,	%g6
	fcmpgt32	%f26,	%f2,	%o3
	sll	%i4,	%i6,	%g5
	ldx	[%l7 + 0x68],	%i0
	nop
	set	0x78, %l2
	stw	%i1,	[%l7 + %l2]
	nop
	set	0x3C, %i4
	stw	%g1,	[%l7 + %i4]
	udivx	%o5,	0x0D08,	%i2
	fmovsle	%icc,	%f11,	%f31
	sra	%o7,	%o2,	%l0
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f6
	fmovdvc	%icc,	%f29,	%f19
	alignaddrl	%l3,	%o1,	%i5
	smulcc	%l4,	%o6,	%i7
	udiv	%g3,	0x01C0,	%o4
	addccc	%g4,	%l2,	%o0
	fcmpgt16	%f20,	%f4,	%l5
	fmovsge	%xcc,	%f20,	%f8
	fnands	%f20,	%f8,	%f0
	movle	%xcc,	%l6,	%l1
	movneg	%icc,	%i3,	%g7
	edge32ln	%g6,	%o3,	%i4
	movvc	%icc,	%g2,	%i6
	array32	%i0,	%i1,	%g1
	fpadd32s	%f18,	%f26,	%f7
	edge32	%o5,	%g5,	%o7
	alignaddrl	%i2,	%l0,	%o2
	srlx	%o1,	%i5,	%l3
	edge32ln	%l4,	%i7,	%o6
	edge16	%g3,	%o4,	%l2
	orncc	%o0,	%g4,	%l6
	sdiv	%l1,	0x079C,	%i3
	fmovrslez	%g7,	%f16,	%f9
	fpadd16	%f30,	%f24,	%f8
	xnor	%g6,	0x1D38,	%o3
	movge	%icc,	%l5,	%i4
	movrgez	%i6,	%i0,	%i1
	edge32n	%g2,	%o5,	%g1
	fmovdne	%icc,	%f4,	%f31
	sethi	0x113B,	%o7
	stb	%i2,	[%l7 + 0x68]
	ld	[%l7 + 0x54],	%f23
	edge32	%g5,	%o2,	%o1
	fcmpd	%fcc3,	%f30,	%f12
	or	%i5,	0x173E,	%l0
	umulcc	%l3,	%i7,	%l4
	alignaddrl	%o6,	%o4,	%g3
	movrgez	%o0,	%g4,	%l6
	addccc	%l1,	%i3,	%g7
	movpos	%xcc,	%g6,	%o3
	movgu	%icc,	%l5,	%l2
	movl	%icc,	%i6,	%i4
	fzeros	%f23
	edge32	%i1,	%g2,	%i0
	addc	%g1,	%o5,	%i2
	fcmped	%fcc3,	%f14,	%f20
	lduw	[%l7 + 0x10],	%g5
	lduh	[%l7 + 0x62],	%o7
	fxors	%f9,	%f17,	%f13
	edge16	%o2,	%i5,	%l0
	srax	%l3,	%o1,	%i7
	popc	0x0FB3,	%l4
	xnorcc	%o6,	%g3,	%o0
	fmovdcc	%icc,	%f11,	%f19
	srlx	%o4,	0x08,	%g4
	udiv	%l1,	0x139F,	%l6
	srl	%g7,	0x05,	%i3
	fcmpne16	%f14,	%f12,	%o3
	subcc	%g6,	0x15C5,	%l2
	ldsb	[%l7 + 0x7A],	%l5
	and	%i4,	%i6,	%g2
	umul	%i0,	0x181F,	%g1
	edge16l	%o5,	%i2,	%i1
	subc	%g5,	0x1E18,	%o2
	xorcc	%o7,	0x1D83,	%i5
	mulx	%l0,	%l3,	%i7
	sdivcc	%l4,	0x07EF,	%o6
	move	%icc,	%g3,	%o0
	popc	0x1C8B,	%o1
	array16	%g4,	%o4,	%l1
	ldd	[%l7 + 0x30],	%f24
	array16	%g7,	%i3,	%o3
	save %l6, 0x0826, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%g6,	%i6
	fpadd16s	%f16,	%f12,	%f2
	edge8	%g2,	%i0,	%i4
	srax	%g1,	%o5,	%i2
	andn	%i1,	0x1074,	%g5
	array8	%o7,	%o2,	%l0
	xnor	%l3,	%i7,	%i5
	sdivcc	%l4,	0x0483,	%g3
	movre	%o6,	0x245,	%o0
	movvc	%xcc,	%o1,	%o4
	xor	%g4,	%l1,	%g7
	fnot1	%f0,	%f26
	ldsw	[%l7 + 0x2C],	%o3
	lduh	[%l7 + 0x46],	%i3
	mulscc	%l2,	%l6,	%l5
	fmovdle	%icc,	%f14,	%f9
	movrlez	%i6,	0x2BE,	%g6
	edge32	%g2,	%i0,	%g1
	stx	%i4,	[%l7 + 0x68]
	fcmpgt16	%f6,	%f4,	%i2
	std	%f22,	[%l7 + 0x08]
	subccc	%i1,	0x172C,	%o5
	sth	%o7,	[%l7 + 0x30]
	xorcc	%g5,	0x107B,	%l0
	ldx	[%l7 + 0x30],	%l3
	movrlez	%i7,	%o2,	%i5
	sdivx	%l4,	0x1978,	%o6
	andcc	%o0,	%o1,	%g3
	edge32ln	%g4,	%o4,	%g7
	xnor	%l1,	%o3,	%l2
	movrlz	%l6,	%l5,	%i6
	fmovdpos	%icc,	%f25,	%f17
	stb	%i3,	[%l7 + 0x46]
	andncc	%g2,	%g6,	%i0
	fcmps	%fcc0,	%f22,	%f19
	orn	%i4,	%i2,	%g1
	st	%f27,	[%l7 + 0x7C]
	edge8n	%o5,	%o7,	%i1
	fmovsg	%xcc,	%f23,	%f17
	alignaddrl	%l0,	%g5,	%l3
	fmovdgu	%xcc,	%f27,	%f6
	andncc	%i7,	%i5,	%l4
	subcc	%o6,	0x1F06,	%o2
	subcc	%o1,	%g3,	%g4
	fmovsn	%xcc,	%f1,	%f21
	sra	%o0,	0x04,	%o4
	movrgez	%g7,	%o3,	%l1
	ldd	[%l7 + 0x30],	%l2
	edge8ln	%l5,	%l6,	%i6
	ldd	[%l7 + 0x60],	%i2
	movneg	%icc,	%g2,	%i0
	smulcc	%g6,	%i4,	%i2
	edge8	%g1,	%o7,	%i1
	restore %o5, 0x18BA, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g5,	%l3,	%i5
	smul	%l4,	%i7,	%o2
	fmovdgu	%icc,	%f30,	%f29
	array8	%o6,	%o1,	%g4
	fnot2	%f14,	%f20
	edge16ln	%o0,	%o4,	%g7
	sth	%o3,	[%l7 + 0x1C]
	movcs	%xcc,	%l1,	%l2
	xorcc	%l5,	0x1C17,	%l6
	fmovsa	%icc,	%f7,	%f23
	st	%f30,	[%l7 + 0x50]
	umul	%i6,	0x09F4,	%i3
	fpack16	%f8,	%f13
	sir	0x0A56
	fpsub32s	%f22,	%f4,	%f20
	movrlz	%g2,	0x3EC,	%g3
	edge32ln	%i0,	%g6,	%i2
	fpackfix	%f2,	%f17
	fpmerge	%f21,	%f9,	%f18
	sethi	0x192A,	%i4
	movgu	%xcc,	%o7,	%i1
	andcc	%o5,	0x1480,	%l0
	pdist	%f24,	%f10,	%f26
	movrne	%g1,	0x365,	%l3
	fmovsgu	%icc,	%f11,	%f0
	andncc	%g5,	%i5,	%l4
	edge8	%o2,	%o6,	%o1
	sdivx	%i7,	0x0E1C,	%o0
	ldsw	[%l7 + 0x34],	%g4
	srlx	%g7,	0x01,	%o4
	fsrc1	%f2,	%f8
	subcc	%o3,	0x13C7,	%l2
	mulscc	%l1,	%l6,	%i6
	srlx	%l5,	%g2,	%g3
	std	%f20,	[%l7 + 0x40]
	alignaddrl	%i3,	%g6,	%i0
	smul	%i4,	0x1ABF,	%i2
	fsrc1s	%f23,	%f21
	edge32	%o7,	%o5,	%l0
	fmovsge	%xcc,	%f30,	%f31
	subc	%i1,	0x07BA,	%l3
	lduh	[%l7 + 0x30],	%g5
	edge16ln	%g1,	%l4,	%i5
	andn	%o6,	%o2,	%o1
	fcmple32	%f16,	%f28,	%i7
	movle	%icc,	%g4,	%g7
	addc	%o4,	%o0,	%l2
	udiv	%o3,	0x0CE3,	%l6
	umulcc	%l1,	0x1706,	%l5
	movpos	%xcc,	%i6,	%g3
	xor	%g2,	%i3,	%g6
	ldub	[%l7 + 0x31],	%i0
	mulx	%i4,	0x1BAD,	%i2
	fmuld8ulx16	%f6,	%f8,	%f8
	addcc	%o7,	0x182F,	%o5
	fsrc1	%f2,	%f20
	array16	%l0,	%i1,	%g5
	array8	%g1,	%l3,	%l4
	andncc	%o6,	%i5,	%o2
	fmul8ulx16	%f2,	%f22,	%f10
	fmovrdlz	%i7,	%f14,	%f10
	fmovscc	%xcc,	%f22,	%f21
	orcc	%g4,	%g7,	%o4
	fabsd	%f28,	%f8
	fmovrdgez	%o0,	%f24,	%f6
	addc	%l2,	%o1,	%o3
	xnorcc	%l1,	%l5,	%i6
	edge32ln	%l6,	%g3,	%g2
	and	%g6,	%i0,	%i3
	sir	0x0E3B
	fcmpne32	%f10,	%f26,	%i2
	udivx	%o7,	0x031E,	%i4
	stb	%o5,	[%l7 + 0x5A]
	lduw	[%l7 + 0x38],	%i1
	ldsb	[%l7 + 0x1D],	%g5
	fmovrslz	%g1,	%f1,	%f10
	sra	%l3,	%l0,	%o6
	array32	%i5,	%l4,	%i7
	fnot2	%f4,	%f0
	umulcc	%o2,	0x11E4,	%g7
	ldd	[%l7 + 0x70],	%g4
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	edge16	%o3,	%l1,	%l5
	xor	%i6,	%l6,	%g3
	srlx	%g2,	%l2,	%i0
	fmovrde	%i3,	%f14,	%f8
	fmovdg	%icc,	%f9,	%f13
	array32	%g6,	%o7,	%i2
	udiv	%i4,	0x10B9,	%o5
	addcc	%i1,	0x1209,	%g5
	movpos	%icc,	%g1,	%l0
	smulcc	%l3,	%i5,	%l4
	sth	%o6,	[%l7 + 0x4C]
	xor	%i7,	%g7,	%g4
	lduh	[%l7 + 0x1E],	%o2
	umulcc	%o0,	%o1,	%o4
	and	%l1,	%l5,	%i6
	sdiv	%o3,	0x0119,	%g3
	fpack32	%f18,	%f16,	%f24
	movrne	%g2,	0x30F,	%l2
	movge	%xcc,	%i0,	%i3
	popc	%g6,	%l6
	edge8	%i2,	%o7,	%o5
	movrgz	%i4,	%i1,	%g5
	movgu	%xcc,	%l0,	%l3
	mulx	%i5,	0x1F56,	%l4
	popc	0x1AEE,	%o6
	fmovrsgz	%i7,	%f18,	%f26
	stx	%g7,	[%l7 + 0x60]
	edge16n	%g4,	%g1,	%o2
	addcc	%o1,	%o0,	%o4
	ldub	[%l7 + 0x10],	%l1
	fmovdleu	%xcc,	%f8,	%f25
	fpsub32	%f12,	%f10,	%f24
	sllx	%i6,	%l5,	%o3
	nop
	set	0x74, %o0
	lduw	[%l7 + %o0],	%g2
	udivcc	%l2,	0x1B3A,	%i0
	array32	%g3,	%g6,	%i3
	edge32l	%i2,	%l6,	%o5
	fpack32	%f0,	%f12,	%f28
	edge8ln	%i4,	%i1,	%g5
	movne	%xcc,	%o7,	%l3
	ldub	[%l7 + 0x13],	%i5
	fandnot2s	%f26,	%f3,	%f10
	add	%l0,	%o6,	%i7
	fmovsge	%xcc,	%f30,	%f13
	sdiv	%g7,	0x08FD,	%l4
	movl	%xcc,	%g1,	%g4
	orcc	%o2,	0x010A,	%o0
	orcc	%o1,	%o4,	%l1
	edge16n	%l5,	%i6,	%o3
	movg	%icc,	%g2,	%i0
	fmovdn	%icc,	%f26,	%f10
	umulcc	%l2,	0x071B,	%g3
	fnegd	%f10,	%f16
	movrgez	%i3,	0x39C,	%i2
	movrne	%g6,	0x3F4,	%o5
	edge16n	%l6,	%i1,	%g5
	ldub	[%l7 + 0x52],	%o7
	lduh	[%l7 + 0x0E],	%l3
	st	%f11,	[%l7 + 0x24]
	fmuld8sux16	%f6,	%f15,	%f6
	sdivcc	%i5,	0x0B0C,	%l0
	movvc	%icc,	%i4,	%o6
	array32	%g7,	%l4,	%g1
	sdivx	%i7,	0x09F2,	%o2
	fpadd32	%f10,	%f18,	%f30
	ldd	[%l7 + 0x68],	%f30
	sir	0x095B
	sdivx	%g4,	0x04BF,	%o0
	fpadd16s	%f17,	%f16,	%f11
	sdiv	%o4,	0x0CB3,	%l1
	umulcc	%l5,	0x10AC,	%o1
	addcc	%i6,	0x1B84,	%g2
	alignaddr	%i0,	%o3,	%g3
	edge32n	%i3,	%i2,	%l2
	st	%f8,	[%l7 + 0x74]
	fornot2s	%f0,	%f14,	%f13
	udivcc	%o5,	0x1ED8,	%l6
	sllx	%g6,	%i1,	%g5
	sllx	%l3,	0x08,	%o7
	array16	%i5,	%l0,	%o6
	fmovse	%xcc,	%f13,	%f26
	edge16l	%g7,	%i4,	%l4
	movne	%xcc,	%i7,	%g1
	edge8n	%g4,	%o2,	%o4
	array16	%l1,	%l5,	%o1
	fmovdcc	%icc,	%f14,	%f7
	st	%f10,	[%l7 + 0x64]
	ldsb	[%l7 + 0x34],	%i6
	fmovdl	%icc,	%f17,	%f16
	addc	%g2,	0x1214,	%i0
	alignaddr	%o3,	%o0,	%i3
	sethi	0x12B3,	%g3
	movrlez	%i2,	%l2,	%o5
	smulcc	%l6,	%i1,	%g5
	subc	%g6,	0x0D74,	%o7
	fxnor	%f4,	%f16,	%f12
	movneg	%xcc,	%i5,	%l0
	move	%icc,	%o6,	%l3
	fmuld8ulx16	%f11,	%f29,	%f18
	ldsb	[%l7 + 0x7B],	%g7
	fmovdne	%xcc,	%f5,	%f23
	movrlez	%l4,	0x3A1,	%i4
	fmuld8sux16	%f22,	%f25,	%f0
	fmovrdne	%i7,	%f4,	%f4
	fmovrslz	%g1,	%f23,	%f24
	movpos	%xcc,	%o2,	%g4
	movrlz	%o4,	0x1B6,	%l5
	sdiv	%l1,	0x0993,	%o1
	array32	%g2,	%i0,	%i6
	movneg	%xcc,	%o0,	%o3
	stw	%i3,	[%l7 + 0x0C]
	udivcc	%g3,	0x095B,	%i2
	and	%l2,	0x1DAE,	%o5
	srlx	%i1,	0x19,	%l6
	movvs	%xcc,	%g6,	%o7
	edge16l	%g5,	%i5,	%l0
	udiv	%l3,	0x0D85,	%o6
	or	%g7,	%l4,	%i4
	fnot2s	%f12,	%f29
	fornot1s	%f13,	%f17,	%f14
	movg	%icc,	%i7,	%o2
	and	%g1,	0x188A,	%o4
	move	%xcc,	%l5,	%g4
	sethi	0x0245,	%l1
	udivx	%o1,	0x1377,	%i0
	xnor	%g2,	0x1385,	%o0
	udiv	%o3,	0x0E4F,	%i6
	edge8l	%g3,	%i2,	%l2
	umul	%i3,	0x101F,	%o5
	edge8n	%l6,	%g6,	%i1
	edge32	%o7,	%i5,	%g5
	andncc	%l0,	%o6,	%g7
	movleu	%xcc,	%l3,	%i4
	nop
	set	0x4E, %g2
	ldub	[%l7 + %g2],	%l4
	sdivx	%i7,	0x0D17,	%o2
	movl	%icc,	%g1,	%l5
	ldub	[%l7 + 0x75],	%g4
	std	%f30,	[%l7 + 0x18]
	fmovdpos	%icc,	%f19,	%f17
	fnand	%f10,	%f14,	%f18
	movle	%xcc,	%o4,	%l1
	ld	[%l7 + 0x08],	%f19
	edge16n	%i0,	%g2,	%o1
	sll	%o0,	%i6,	%g3
	alignaddrl	%i2,	%l2,	%o3
	movre	%o5,	0x3AA,	%l6
	sll	%g6,	%i3,	%o7
	fpsub16	%f24,	%f2,	%f0
	edge32	%i5,	%g5,	%i1
	and	%o6,	0x12BE,	%g7
	fmovscc	%icc,	%f5,	%f29
	stx	%l3,	[%l7 + 0x78]
	umulcc	%l0,	0x0A35,	%i4
	nop
	set	0x74, %o1
	sth	%i7,	[%l7 + %o1]
	srlx	%o2,	%l4,	%l5
	srlx	%g1,	0x1D,	%g4
	fmuld8sux16	%f4,	%f12,	%f10
	movg	%xcc,	%l1,	%i0
	std	%f6,	[%l7 + 0x08]
	movcc	%xcc,	%o4,	%o1
	addccc	%o0,	%g2,	%i6
	movgu	%icc,	%g3,	%i2
	ldsh	[%l7 + 0x2E],	%l2
	orn	%o5,	0x1434,	%o3
	and	%l6,	%i3,	%o7
	movgu	%xcc,	%i5,	%g5
	alignaddrl	%g6,	%i1,	%o6
	fmovdne	%icc,	%f19,	%f16
	movre	%l3,	0x0EE,	%l0
	ldub	[%l7 + 0x6D],	%i4
	fmovd	%f30,	%f2
	udivcc	%g7,	0x0E73,	%i7
	edge8	%l4,	%l5,	%g1
	fpack32	%f8,	%f10,	%f20
	edge16ln	%o2,	%l1,	%i0
	fmovsle	%icc,	%f21,	%f5
	fmovrdlz	%g4,	%f14,	%f12
	ldsb	[%l7 + 0x30],	%o4
	and	%o1,	0x0945,	%g2
	edge16n	%i6,	%o0,	%i2
	edge32	%g3,	%l2,	%o5
	fcmpd	%fcc1,	%f16,	%f16
	addccc	%l6,	%i3,	%o3
	edge32l	%i5,	%o7,	%g5
	movrgez	%i1,	%g6,	%o6
	movne	%icc,	%l0,	%l3
	fmovrdlez	%i4,	%f30,	%f24
	restore %g7, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g1,	0x1D6D,	%o2
	edge32ln	%i7,	%i0,	%l1
	edge16	%o4,	%o1,	%g4
	ldsb	[%l7 + 0x31],	%g2
	addccc	%o0,	0x1B8F,	%i6
	ldsb	[%l7 + 0x11],	%i2
	subcc	%l2,	%g3,	%l6
	subcc	%i3,	%o3,	%o5
	fmovrdne	%o7,	%f10,	%f0
	srax	%i5,	%i1,	%g5
	subcc	%o6,	%l0,	%g6
	fandnot2	%f16,	%f20,	%f20
	addc	%l3,	0x1E61,	%i4
	movge	%icc,	%l4,	%l5
	subccc	%g7,	%g1,	%o2
	orcc	%i7,	0x1951,	%i0
	umulcc	%o4,	0x0257,	%l1
	movvc	%xcc,	%o1,	%g2
	fnor	%f24,	%f14,	%f30
	xnorcc	%o0,	0x1C08,	%g4
	sra	%i6,	%l2,	%i2
	sethi	0x19CF,	%g3
	fmovdgu	%icc,	%f8,	%f1
	fnegs	%f21,	%f8
	fabss	%f0,	%f16
	xnor	%l6,	0x1C40,	%i3
	array8	%o3,	%o7,	%o5
	fors	%f8,	%f18,	%f12
	movne	%icc,	%i1,	%i5
	movg	%icc,	%o6,	%l0
	edge16	%g5,	%l3,	%i4
	edge32ln	%g6,	%l4,	%l5
	nop
	set	0x10, %o6
	stw	%g1,	[%l7 + %o6]
	xor	%g7,	0x1A18,	%o2
	edge32ln	%i7,	%o4,	%l1
	ldsh	[%l7 + 0x2C],	%o1
	movrgz	%g2,	0x399,	%i0
	fmuld8ulx16	%f6,	%f29,	%f26
	movrgez	%o0,	0x146,	%i6
	fpsub16	%f22,	%f20,	%f12
	addccc	%g4,	%l2,	%i2
	sdivx	%l6,	0x09EC,	%i3
	movrgez	%o3,	0x040,	%o7
	movle	%xcc,	%o5,	%i1
	ldsw	[%l7 + 0x7C],	%i5
	edge8ln	%g3,	%o6,	%l0
	movge	%xcc,	%l3,	%g5
	movvc	%xcc,	%i4,	%l4
	edge16l	%l5,	%g6,	%g1
	smulcc	%o2,	0x13DD,	%i7
	std	%f4,	[%l7 + 0x40]
	movrne	%g7,	%l1,	%o4
	fnand	%f16,	%f2,	%f20
	fmovrdlez	%o1,	%f14,	%f16
	andn	%g2,	0x1D04,	%i0
	edge8	%o0,	%g4,	%l2
	lduh	[%l7 + 0x42],	%i2
	movne	%xcc,	%i6,	%i3
	fabsd	%f16,	%f2
	and	%l6,	%o3,	%o7
	edge8l	%i1,	%i5,	%o5
	fmovdge	%xcc,	%f5,	%f31
	srlx	%o6,	%g3,	%l3
	ldub	[%l7 + 0x12],	%g5
	srl	%l0,	0x18,	%l4
	fmovse	%icc,	%f25,	%f10
	edge8n	%l5,	%i4,	%g6
	lduw	[%l7 + 0x50],	%g1
	fmovrsne	%o2,	%f8,	%f22
	orncc	%g7,	0x0D49,	%l1
	movcs	%xcc,	%o4,	%o1
	movrlez	%i7,	0x2B9,	%g2
	smul	%o0,	%i0,	%g4
	sir	0x1505
	xor	%i2,	%i6,	%l2
	ldsb	[%l7 + 0x55],	%i3
	or	%o3,	0x18B3,	%o7
	ldub	[%l7 + 0x63],	%i1
	edge32ln	%i5,	%l6,	%o6
	alignaddrl	%o5,	%g3,	%l3
	add	%l0,	%l4,	%g5
	subccc	%i4,	0x1456,	%g6
	edge16ln	%l5,	%o2,	%g1
	ldx	[%l7 + 0x78],	%g7
	movrne	%o4,	0x141,	%o1
	fones	%f8
	movvs	%icc,	%i7,	%g2
	fmovrse	%l1,	%f12,	%f18
	fpsub32	%f22,	%f0,	%f24
	movle	%icc,	%o0,	%g4
	fmovdcc	%xcc,	%f3,	%f21
	sra	%i0,	%i6,	%l2
	fmovdne	%xcc,	%f30,	%f8
	sir	0x0D46
	fmovsne	%icc,	%f10,	%f5
	orcc	%i3,	%i2,	%o7
	umul	%i1,	0x0105,	%i5
	xor	%l6,	0x158D,	%o6
	movvs	%icc,	%o5,	%o3
	mulx	%g3,	%l3,	%l0
	fandnot2s	%f11,	%f25,	%f13
	edge16ln	%l4,	%i4,	%g5
	smul	%g6,	%l5,	%g1
	ldub	[%l7 + 0x34],	%o2
	move	%xcc,	%o4,	%o1
	movneg	%icc,	%i7,	%g7
	movn	%icc,	%l1,	%o0
	st	%f30,	[%l7 + 0x5C]
	nop
	set	0x18, %g4
	stw	%g2,	[%l7 + %g4]
	edge8	%g4,	%i0,	%i6
	movcs	%xcc,	%l2,	%i2
	move	%icc,	%i3,	%i1
	sub	%i5,	0x0E30,	%o7
	movneg	%icc,	%o6,	%l6
	move	%icc,	%o5,	%g3
	subc	%l3,	0x1DE9,	%o3
	save %l4, 0x0952, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g5,	0x0649,	%l0
	array8	%g6,	%l5,	%g1
	stw	%o2,	[%l7 + 0x48]
	sth	%o1,	[%l7 + 0x10]
	orn	%i7,	0x1053,	%g7
	movre	%l1,	0x0FA,	%o0
	lduh	[%l7 + 0x7E],	%o4
	popc	0x1EB5,	%g4
	fmovdcc	%xcc,	%f19,	%f24
	movcs	%xcc,	%g2,	%i6
	fcmpeq16	%f8,	%f8,	%l2
	fmovdcc	%icc,	%f12,	%f19
	stx	%i2,	[%l7 + 0x08]
	movg	%xcc,	%i0,	%i3
	fmovdleu	%xcc,	%f19,	%f6
	umulcc	%i5,	0x081F,	%o7
	andncc	%i1,	%l6,	%o5
	movleu	%icc,	%o6,	%l3
	movleu	%icc,	%o3,	%l4
	fmovdcs	%xcc,	%f20,	%f15
	mulscc	%g3,	0x18CD,	%i4
	fmovd	%f16,	%f26
	fpadd32s	%f13,	%f3,	%f28
	fpsub32s	%f8,	%f12,	%f4
	movvc	%xcc,	%g5,	%l0
	st	%f17,	[%l7 + 0x78]
	ld	[%l7 + 0x50],	%f12
	xnorcc	%l5,	%g1,	%o2
	mulx	%g6,	%i7,	%o1
	alignaddr	%l1,	%o0,	%g7
	ldub	[%l7 + 0x14],	%o4
	fcmpes	%fcc0,	%f15,	%f13
	edge16n	%g2,	%i6,	%l2
	ldsw	[%l7 + 0x14],	%g4
	fmovrdgez	%i2,	%f0,	%f24
	stx	%i0,	[%l7 + 0x68]
	fornot2s	%f27,	%f11,	%f4
	fmovsneg	%icc,	%f27,	%f16
	fmovdneg	%xcc,	%f16,	%f22
	fmovrdne	%i3,	%f20,	%f12
	udivcc	%o7,	0x1801,	%i1
	and	%i5,	%l6,	%o5
	movrne	%o6,	%o3,	%l4
	andncc	%g3,	%i4,	%l3
	edge8l	%l0,	%l5,	%g1
	movneg	%xcc,	%o2,	%g5
	movrgez	%g6,	0x1B6,	%i7
	movcs	%xcc,	%o1,	%o0
	array8	%g7,	%l1,	%o4
	faligndata	%f18,	%f26,	%f12
	xnorcc	%g2,	%l2,	%i6
	array32	%i2,	%g4,	%i3
	array8	%i0,	%i1,	%i5
	addc	%l6,	0x1789,	%o5
	and	%o7,	%o6,	%o3
	movge	%icc,	%l4,	%g3
	lduw	[%l7 + 0x70],	%i4
	fnegs	%f8,	%f6
	fmovrslez	%l3,	%f18,	%f12
	fones	%f11
	fandnot2s	%f10,	%f24,	%f8
	edge8ln	%l0,	%l5,	%g1
	sll	%g5,	0x0F,	%g6
	andcc	%o2,	0x0324,	%i7
	addcc	%o0,	0x1C24,	%o1
	std	%f26,	[%l7 + 0x48]
	edge16ln	%l1,	%g7,	%g2
	fmovse	%icc,	%f31,	%f19
	fmovd	%f22,	%f22
	movcc	%xcc,	%o4,	%l2
	fnegd	%f0,	%f10
	stw	%i2,	[%l7 + 0x28]
	stw	%i6,	[%l7 + 0x78]
	fmovsa	%xcc,	%f20,	%f23
	edge32n	%i3,	%i0,	%i1
	fmovdcs	%xcc,	%f18,	%f9
	movrlez	%g4,	%i5,	%l6
	orcc	%o5,	0x0050,	%o6
	fnor	%f2,	%f6,	%f30
	andn	%o3,	%l4,	%g3
	udivcc	%o7,	0x08EC,	%l3
	movre	%l0,	%l5,	%i4
	nop
	set	0x4C, %l4
	lduw	[%l7 + %l4],	%g5
	andncc	%g6,	%g1,	%o2
	stw	%o0,	[%l7 + 0x30]
	edge32ln	%o1,	%l1,	%g7
	movrgez	%i7,	%o4,	%l2
	umulcc	%g2,	%i2,	%i3
	and	%i6,	%i0,	%g4
	fmovsneg	%xcc,	%f18,	%f15
	edge8	%i5,	%l6,	%o5
	ldd	[%l7 + 0x78],	%f12
	ld	[%l7 + 0x74],	%f2
	fmovrdgez	%o6,	%f0,	%f16
	edge32ln	%o3,	%l4,	%g3
	xnor	%o7,	%i1,	%l3
	fmovdge	%xcc,	%f6,	%f23
	movpos	%icc,	%l5,	%l0
	lduh	[%l7 + 0x5A],	%g5
	fones	%f29
	edge32ln	%g6,	%i4,	%g1
	mulx	%o0,	0x0AA8,	%o2
	array32	%l1,	%o1,	%g7
	sdiv	%i7,	0x13FC,	%l2
	mova	%icc,	%o4,	%i2
	alignaddrl	%i3,	%g2,	%i0
	alignaddrl	%g4,	%i6,	%l6
	movg	%xcc,	%i5,	%o5
	smulcc	%o3,	%l4,	%o6
	fornot2s	%f27,	%f12,	%f12
	ldd	[%l7 + 0x40],	%g2
	fmovde	%icc,	%f22,	%f9
	umul	%o7,	0x0EEB,	%i1
	array8	%l5,	%l3,	%g5
	addcc	%l0,	%g6,	%i4
	fpsub32	%f28,	%f26,	%f18
	srl	%o0,	%g1,	%l1
	movcs	%icc,	%o2,	%g7
	stb	%o1,	[%l7 + 0x2D]
	ldub	[%l7 + 0x29],	%l2
	fmovrdgz	%i7,	%f6,	%f4
	ldub	[%l7 + 0x7D],	%o4
	edge8n	%i3,	%g2,	%i0
	fmovsneg	%icc,	%f13,	%f25
	fnands	%f14,	%f15,	%f28
	ldub	[%l7 + 0x62],	%i2
	orncc	%g4,	0x0450,	%l6
	fcmple32	%f26,	%f0,	%i6
	xnor	%i5,	0x0E68,	%o5
	edge8ln	%l4,	%o6,	%o3
	st	%f0,	[%l7 + 0x50]
	srax	%g3,	0x11,	%o7
	sethi	0x0699,	%i1
	edge8l	%l3,	%g5,	%l5
	fornot1s	%f26,	%f11,	%f7
	fors	%f25,	%f2,	%f23
	fmovrde	%g6,	%f26,	%f20
	add	%i4,	%o0,	%l0
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	movle	%icc,	%o1,	%g7
	edge32n	%i7,	%o4,	%i3
	sdivx	%g2,	0x0D11,	%i0
	edge8	%i2,	%l2,	%l6
	fmuld8ulx16	%f2,	%f4,	%f22
	stb	%g4,	[%l7 + 0x3E]
	sub	%i6,	0x1519,	%o5
	fcmpgt16	%f2,	%f6,	%i5
	alignaddr	%l4,	%o3,	%o6
	and	%g3,	0x1060,	%i1
	addccc	%o7,	%l3,	%g5
	movrgz	%l5,	%g6,	%o0
	ldsw	[%l7 + 0x2C],	%i4
	udivx	%g1,	0x1C77,	%l0
	udivx	%o2,	0x0C28,	%o1
	movrlez	%g7,	%i7,	%l1
	edge32n	%o4,	%i3,	%g2
	fnegs	%f12,	%f8
	movg	%icc,	%i2,	%l2
	array8	%i0,	%l6,	%g4
	move	%icc,	%o5,	%i6
	smulcc	%i5,	%o3,	%l4
	mova	%icc,	%o6,	%g3
	fmul8x16al	%f24,	%f22,	%f26
	srl	%o7,	%i1,	%g5
	edge16n	%l5,	%g6,	%l3
	mulx	%i4,	%g1,	%l0
	andcc	%o0,	0x1C5C,	%o2
	movcs	%xcc,	%o1,	%i7
	andn	%g7,	0x1E02,	%o4
	restore %i3, %l1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f8,	%f21
	smulcc	%i2,	%i0,	%l2
	ldub	[%l7 + 0x4E],	%g4
	edge32	%o5,	%i6,	%l6
	edge32	%i5,	%o3,	%o6
	or	%l4,	%o7,	%g3
	fcmpgt16	%f18,	%f20,	%g5
	sub	%l5,	0x0911,	%g6
	alignaddrl	%l3,	%i1,	%g1
	sethi	0x0B09,	%i4
	fpackfix	%f0,	%f20
	umulcc	%l0,	0x057C,	%o2
	umul	%o0,	0x09F5,	%i7
	stx	%o1,	[%l7 + 0x60]
	fmovsa	%xcc,	%f14,	%f10
	or	%o4,	%i3,	%l1
	udivcc	%g7,	0x082E,	%i2
	movleu	%icc,	%g2,	%i0
	stx	%g4,	[%l7 + 0x48]
	edge32n	%l2,	%i6,	%l6
	ld	[%l7 + 0x48],	%f29
	srl	%o5,	0x13,	%i5
	edge16	%o6,	%o3,	%l4
	fmovrdgz	%g3,	%f14,	%f4
	fmul8x16al	%f27,	%f6,	%f4
	fandnot2	%f26,	%f4,	%f2
	array16	%g5,	%o7,	%l5
	edge16n	%l3,	%i1,	%g1
	fmovdg	%xcc,	%f3,	%f4
	fornot2	%f14,	%f14,	%f16
	orcc	%i4,	%l0,	%g6
	sethi	0x0465,	%o0
	sra	%i7,	0x06,	%o1
	array32	%o2,	%o4,	%i3
	subcc	%l1,	%g7,	%i2
	fmul8x16au	%f22,	%f16,	%f26
	fmovdne	%icc,	%f17,	%f30
	fmuld8ulx16	%f20,	%f7,	%f12
	stw	%g2,	[%l7 + 0x68]
	ldd	[%l7 + 0x20],	%g4
	udivcc	%i0,	0x004F,	%l2
	fsrc1	%f6,	%f2
	xorcc	%l6,	%i6,	%o5
	fcmpgt32	%f16,	%f14,	%i5
	movn	%xcc,	%o6,	%o3
	fcmpgt16	%f4,	%f14,	%l4
	movrlz	%g5,	%o7,	%g3
	edge8n	%l3,	%l5,	%g1
	addc	%i1,	0x0AF8,	%l0
	fnot2	%f0,	%f26
	movrgez	%g6,	0x0B6,	%o0
	sethi	0x13D1,	%i4
	srl	%i7,	%o2,	%o4
	srax	%o1,	0x01,	%l1
	fmovdge	%icc,	%f6,	%f0
	movn	%xcc,	%g7,	%i2
	fand	%f8,	%f22,	%f20
	orncc	%i3,	%g2,	%i0
	fmovsleu	%icc,	%f27,	%f19
	orn	%l2,	%g4,	%l6
	sethi	0x0EB3,	%o5
	and	%i5,	%i6,	%o6
	sra	%l4,	%o3,	%o7
	sllx	%g5,	0x0F,	%l3
	movl	%xcc,	%l5,	%g1
	ldd	[%l7 + 0x68],	%g2
	mulx	%i1,	%g6,	%o0
	lduh	[%l7 + 0x18],	%i4
	fmovrsne	%l0,	%f18,	%f10
	fnot2	%f8,	%f6
	add	%o2,	%i7,	%o4
	movn	%xcc,	%l1,	%g7
	orcc	%o1,	%i2,	%g2
	sdivcc	%i3,	0x0926,	%l2
	umul	%i0,	0x0E4E,	%g4
	fxors	%f16,	%f30,	%f14
	stb	%l6,	[%l7 + 0x56]
	andcc	%o5,	%i6,	%o6
	orn	%i5,	%o3,	%o7
	nop
	set	0x08, %i2
	std	%f24,	[%l7 + %i2]
	fcmple16	%f26,	%f28,	%g5
	andn	%l4,	%l3,	%l5
	ldx	[%l7 + 0x40],	%g3
	fpmerge	%f8,	%f17,	%f26
	udiv	%i1,	0x0AF2,	%g1
	srax	%g6,	0x1E,	%i4
	sdivcc	%l0,	0x1BF1,	%o0
	addc	%o2,	%o4,	%l1
	fcmpne16	%f26,	%f2,	%g7
	nop
	set	0x2C, %l6
	stw	%o1,	[%l7 + %l6]
	movl	%icc,	%i2,	%g2
	edge8ln	%i3,	%l2,	%i0
	ldx	[%l7 + 0x08],	%g4
	fpadd32s	%f28,	%f6,	%f30
	andn	%l6,	0x027F,	%i7
	movne	%icc,	%o5,	%o6
	add	%i5,	%o3,	%i6
	stb	%g5,	[%l7 + 0x3F]
	smulcc	%l4,	%o7,	%l5
	fmovrse	%l3,	%f19,	%f7
	ldub	[%l7 + 0x31],	%g3
	lduw	[%l7 + 0x7C],	%i1
	alignaddr	%g6,	%i4,	%g1
	fmovdleu	%icc,	%f28,	%f3
	fmovdne	%icc,	%f2,	%f0
	fmovsl	%icc,	%f24,	%f16
	orcc	%l0,	%o2,	%o4
	fmovdn	%xcc,	%f4,	%f12
	xorcc	%l1,	%o0,	%g7
	orncc	%i2,	%o1,	%i3
	edge8n	%l2,	%g2,	%i0
	edge16	%g4,	%l6,	%i7
	ldd	[%l7 + 0x40],	%f26
	fpsub32s	%f11,	%f0,	%f11
	udivx	%o6,	0x1826,	%i5
	lduh	[%l7 + 0x20],	%o5
	subcc	%i6,	%o3,	%g5
	fmovde	%xcc,	%f21,	%f8
	array8	%l4,	%o7,	%l3
	and	%g3,	%i1,	%g6
	ldsh	[%l7 + 0x3C],	%l5
	sub	%g1,	0x08AD,	%l0
	save %o2, 0x143A, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i4,	0x08F4,	%l1
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	fmovsvc	%icc,	%f15,	%f27
	fmovdn	%xcc,	%f26,	%f7
	or	%g7,	0x0B97,	%o1
	xorcc	%l2,	0x0A65,	%i3
	subccc	%g2,	0x01D8,	%g4
	umulcc	%l6,	%i7,	%i0
	popc	0x1BBF,	%o6
	edge16	%i5,	%o5,	%i6
	alignaddrl	%o3,	%l4,	%o7
	ldsh	[%l7 + 0x3C],	%l3
	fmovsvs	%icc,	%f12,	%f5
	sth	%g5,	[%l7 + 0x40]
	movgu	%xcc,	%i1,	%g3
	ldsb	[%l7 + 0x52],	%l5
	sethi	0x06A7,	%g1
	sdiv	%l0,	0x0771,	%o2
	sethi	0x0D9E,	%o4
	edge16l	%g6,	%i4,	%l1
	fmovrdne	%i2,	%f18,	%f4
	xor	%g7,	0x0FEB,	%o0
	movrgez	%l2,	%i3,	%o1
	ld	[%l7 + 0x0C],	%f8
	ldsw	[%l7 + 0x38],	%g2
	movn	%icc,	%l6,	%g4
	alignaddrl	%i7,	%o6,	%i0
	movrlez	%i5,	0x036,	%o5
	save %o3, 0x1E91, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%o7
	fmovspos	%icc,	%f20,	%f8
	sethi	0x1177,	%l3
	sra	%l4,	0x04,	%g5
	movg	%xcc,	%g3,	%l5
	ldsb	[%l7 + 0x6B],	%g1
	addc	%i1,	%o2,	%o4
	movre	%l0,	0x3CF,	%g6
	array8	%l1,	%i2,	%g7
	edge8	%o0,	%i4,	%i3
	ldd	[%l7 + 0x40],	%f30
	orn	%o1,	%l2,	%l6
	movneg	%xcc,	%g2,	%g4
	lduh	[%l7 + 0x34],	%o6
	fors	%f30,	%f30,	%f14
	fpadd16s	%f20,	%f14,	%f15
	fmovdne	%xcc,	%f5,	%f10
	fmovdneg	%xcc,	%f0,	%f22
	movrlez	%i0,	%i7,	%o5
	mulscc	%i5,	%o3,	%o7
	fmovdneg	%xcc,	%f14,	%f19
	movgu	%xcc,	%i6,	%l3
	edge16l	%l4,	%g3,	%g5
	fand	%f18,	%f6,	%f16
	edge16n	%g1,	%i1,	%o2
	lduw	[%l7 + 0x74],	%l5
	mova	%icc,	%l0,	%g6
	fmovrdgez	%o4,	%f0,	%f6
	ldd	[%l7 + 0x48],	%f6
	lduw	[%l7 + 0x08],	%i2
	movpos	%icc,	%g7,	%o0
	movrgez	%i4,	0x088,	%i3
	nop
	set	0x08, %g1
	stw	%o1,	[%l7 + %g1]
	fnegd	%f6,	%f10
	subc	%l2,	%l1,	%g2
	fmovrdgez	%g4,	%f24,	%f0
	fmovde	%icc,	%f11,	%f0
	srl	%l6,	0x08,	%i0
	xorcc	%i7,	%o6,	%o5
	fmovsg	%xcc,	%f31,	%f20
	sethi	0x1168,	%o3
	sdivx	%o7,	0x1579,	%i6
	movg	%icc,	%i5,	%l3
	nop
	set	0x5D, %l5
	stb	%l4,	[%l7 + %l5]
	movvc	%xcc,	%g5,	%g1
	orcc	%g3,	0x197B,	%o2
	edge32l	%l5,	%i1,	%l0
	ldd	[%l7 + 0x68],	%g6
	alignaddr	%i2,	%g7,	%o0
	ldd	[%l7 + 0x30],	%f18
	movneg	%icc,	%i4,	%i3
	ldub	[%l7 + 0x6E],	%o1
	fpsub16s	%f9,	%f20,	%f1
	movrgz	%o4,	0x3B2,	%l2
	movleu	%xcc,	%l1,	%g2
	edge32	%g4,	%l6,	%i0
	orn	%i7,	0x0260,	%o6
	movvs	%xcc,	%o3,	%o5
	xorcc	%o7,	%i6,	%i5
	movle	%icc,	%l4,	%l3
	alignaddrl	%g5,	%g1,	%g3
	fandnot1	%f4,	%f26,	%f22
	lduh	[%l7 + 0x60],	%l5
	edge32l	%i1,	%o2,	%g6
	stx	%i2,	[%l7 + 0x18]
	edge8	%l0,	%g7,	%o0
	save %i4, 0x094C, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x34],	%o4
	array16	%i3,	%l2,	%g2
	smul	%g4,	0x1E1E,	%l1
	fmovdne	%icc,	%f25,	%f12
	edge16l	%i0,	%i7,	%o6
	edge16ln	%o3,	%o5,	%l6
	fcmpd	%fcc2,	%f26,	%f12
	fmovsge	%xcc,	%f22,	%f23
	srax	%o7,	0x11,	%i5
	mova	%xcc,	%l4,	%i6
	fcmple32	%f12,	%f22,	%g5
	sth	%l3,	[%l7 + 0x5C]
	addc	%g1,	0x0399,	%l5
	fmovspos	%icc,	%f2,	%f10
	fpsub16	%f22,	%f26,	%f8
	ldsb	[%l7 + 0x7E],	%i1
	or	%g3,	%g6,	%o2
	sub	%i2,	%l0,	%o0
	edge8l	%i4,	%g7,	%o4
	movn	%xcc,	%i3,	%o1
	ldsw	[%l7 + 0x60],	%l2
	movpos	%xcc,	%g2,	%g4
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%l1
	andncc	%i0,	%i7,	%o3
	xor	%o5,	0x09D0,	%l6
	stx	%o6,	[%l7 + 0x20]
	fones	%f22
	fmovsle	%icc,	%f31,	%f22
	stx	%i5,	[%l7 + 0x48]
	move	%xcc,	%o7,	%l4
	movre	%i6,	%l3,	%g5
	andcc	%g1,	%l5,	%i1
	ldsh	[%l7 + 0x5E],	%g6
	or	%g3,	%i2,	%l0
	lduw	[%l7 + 0x7C],	%o2
	movleu	%xcc,	%i4,	%g7
	fmovde	%xcc,	%f3,	%f31
	edge32ln	%o0,	%i3,	%o1
	st	%f10,	[%l7 + 0x3C]
	fornot2s	%f8,	%f27,	%f29
	edge16	%l2,	%o4,	%g4
	edge32ln	%g2,	%i0,	%l1
	xnorcc	%o3,	0x084D,	%i7
	array16	%o5,	%o6,	%i5
	ld	[%l7 + 0x58],	%f19
	std	%f20,	[%l7 + 0x08]
	ldx	[%l7 + 0x30],	%l6
	movle	%xcc,	%l4,	%i6
	movge	%icc,	%l3,	%g5
	udivcc	%g1,	0x0982,	%l5
	nop
	set	0x64, %i5
	ldsh	[%l7 + %i5],	%i1
	fmovsn	%xcc,	%f11,	%f25
	edge32	%g6,	%o7,	%i2
	fnot1s	%f17,	%f27
	fmul8ulx16	%f20,	%f12,	%f8
	lduh	[%l7 + 0x1A],	%g3
	udivx	%o2,	0x084A,	%i4
	fcmped	%fcc0,	%f6,	%f2
	orn	%l0,	0x12D1,	%g7
	movn	%icc,	%i3,	%o1
	edge16l	%o0,	%o4,	%l2
	xnorcc	%g4,	%g2,	%l1
	edge16l	%o3,	%i0,	%o5
	fmovdneg	%icc,	%f16,	%f11
	movneg	%xcc,	%i7,	%o6
	fnegd	%f12,	%f4
	subc	%l6,	0x0A02,	%l4
	srax	%i5,	0x06,	%i6
	addc	%g5,	%g1,	%l5
	fnors	%f6,	%f1,	%f16
	sir	0x0BA3
	fzero	%f18
	fsrc1s	%f24,	%f21
	movvs	%xcc,	%l3,	%g6
	edge16n	%i1,	%i2,	%o7
	fmovsvc	%xcc,	%f15,	%f4
	popc	%g3,	%i4
	edge8n	%o2,	%g7,	%i3
	movl	%icc,	%l0,	%o0
	orncc	%o4,	%l2,	%o1
	ldsh	[%l7 + 0x64],	%g4
	movcc	%icc,	%g2,	%l1
	popc	0x13D2,	%i0
	sll	%o3,	%i7,	%o6
	ldub	[%l7 + 0x54],	%o5
	sdivx	%l4,	0x0A79,	%l6
	stx	%i6,	[%l7 + 0x68]
	edge8l	%g5,	%i5,	%g1
	std	%f8,	[%l7 + 0x38]
	udiv	%l5,	0x1278,	%l3
	smul	%g6,	%i1,	%i2
	movgu	%icc,	%o7,	%g3
	ldd	[%l7 + 0x48],	%o2
	srl	%g7,	%i3,	%l0
	move	%xcc,	%i4,	%o0
	edge16n	%o4,	%l2,	%o1
	alignaddr	%g2,	%l1,	%g4
	fpsub16	%f12,	%f30,	%f22
	edge16	%o3,	%i7,	%i0
	srlx	%o5,	0x0B,	%l4
	subc	%o6,	%i6,	%g5
	srax	%i5,	0x08,	%g1
	or	%l5,	0x0574,	%l6
	sdivcc	%l3,	0x1C46,	%i1
	movrgz	%i2,	%g6,	%g3
	array16	%o7,	%o2,	%g7
	fsrc1s	%f22,	%f5
	andcc	%l0,	0x1536,	%i4
	srax	%i3,	%o0,	%o4
	udiv	%l2,	0x1061,	%g2
	sra	%l1,	0x13,	%g4
	array8	%o1,	%i7,	%i0
	movre	%o3,	%l4,	%o5
	sllx	%o6,	%g5,	%i6
	ldsh	[%l7 + 0x56],	%g1
	array32	%l5,	%i5,	%l6
	fpsub16	%f24,	%f26,	%f28
	sub	%i1,	0x1F3F,	%i2
	fmul8x16au	%f12,	%f28,	%f26
	srl	%g6,	%l3,	%o7
	mulx	%g3,	%g7,	%l0
	alignaddr	%o2,	%i3,	%i4
	fnegd	%f12,	%f28
	edge16l	%o4,	%l2,	%o0
	fsrc1s	%f27,	%f4
	movre	%g2,	0x191,	%l1
	fxors	%f31,	%f16,	%f15
	fpsub16s	%f22,	%f17,	%f18
	subc	%o1,	0x08F7,	%g4
	fandnot2s	%f18,	%f29,	%f18
	addcc	%i0,	0x00A3,	%i7
	movvc	%icc,	%o3,	%l4
	sdivcc	%o5,	0x07A0,	%g5
	stw	%i6,	[%l7 + 0x4C]
	fands	%f8,	%f22,	%f31
	bshuffle	%f14,	%f12,	%f2
	andn	%o6,	0x16A9,	%l5
	fmovrdlz	%g1,	%f8,	%f8
	add	%l6,	%i5,	%i1
	ldd	[%l7 + 0x18],	%i2
	std	%f22,	[%l7 + 0x58]
	udiv	%l3,	0x14FA,	%o7
	movvc	%icc,	%g6,	%g7
	movne	%xcc,	%g3,	%l0
	addcc	%i3,	0x045F,	%o2
	fcmps	%fcc1,	%f18,	%f3
	xnorcc	%o4,	0x0F40,	%i4
	movcc	%icc,	%l2,	%o0
	sir	0x1248
	nop
	set	0x2A, %i3
	ldub	[%l7 + %i3],	%g2
	movge	%xcc,	%o1,	%g4
	fmovde	%xcc,	%f5,	%f3
	edge32ln	%i0,	%i7,	%o3
	ldub	[%l7 + 0x24],	%l1
	smul	%o5,	0x170E,	%g5
	fcmpgt32	%f26,	%f4,	%l4
	ldsh	[%l7 + 0x5A],	%i6
	andncc	%o6,	%l5,	%l6
	sllx	%i5,	%i1,	%g1
	subc	%i2,	0x0854,	%o7
	addcc	%l3,	%g7,	%g3
	subc	%g6,	0x09FB,	%i3
	fmovdcs	%icc,	%f27,	%f12
	edge16ln	%o2,	%l0,	%o4
	restore %i4, 0x1474, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f8,	%f18
	addcc	%l2,	0x0D90,	%o1
	fpmerge	%f22,	%f4,	%f14
	movl	%icc,	%g2,	%g4
	fmovrdgz	%i0,	%f14,	%f26
	sth	%i7,	[%l7 + 0x6A]
	fcmpne16	%f20,	%f24,	%o3
	fxnor	%f20,	%f22,	%f12
	movgu	%icc,	%o5,	%l1
	fmovdcs	%icc,	%f5,	%f19
	movrgez	%l4,	0x19C,	%i6
	movrgz	%o6,	0x31B,	%g5
	edge16ln	%l5,	%l6,	%i1
	sll	%i5,	0x0F,	%i2
	fcmped	%fcc0,	%f0,	%f10
	subc	%g1,	0x1E7B,	%l3
	movrlez	%o7,	%g3,	%g6
	andncc	%g7,	%o2,	%i3
	movl	%xcc,	%o4,	%l0
	stb	%o0,	[%l7 + 0x32]
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	movrgz	%o1,	%g4,	%g2
	fcmple16	%f24,	%f18,	%i0
	edge16n	%o3,	%i7,	%l1
	sethi	0x10E8,	%o5
	fmovrslz	%l4,	%f23,	%f28
	movrgez	%i6,	%g5,	%l5
	subccc	%o6,	%l6,	%i1
	ldsb	[%l7 + 0x6B],	%i2
	sll	%g1,	0x03,	%l3
	sdivx	%i5,	0x1320,	%g3
	xorcc	%g6,	%g7,	%o2
	umul	%o7,	0x0887,	%o4
	fpadd32	%f24,	%f20,	%f8
	save %i3, %l0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o0,	%i4
	addccc	%g4,	0x0977,	%g2
	movneg	%xcc,	%o1,	%o3
	movg	%xcc,	%i7,	%i0
	andncc	%l1,	%l4,	%o5
	ldsb	[%l7 + 0x72],	%i6
	subccc	%l5,	0x0EE9,	%g5
	mulx	%o6,	%l6,	%i2
	udivcc	%i1,	0x1F33,	%l3
	edge16	%i5,	%g1,	%g6
	movl	%icc,	%g7,	%g3
	movpos	%xcc,	%o7,	%o2
	subccc	%i3,	0x0F69,	%l0
	nop
	set	0x7C, %g6
	sth	%o4,	[%l7 + %g6]
	or	%o0,	0x112E,	%l2
	ldx	[%l7 + 0x10],	%g4
	orncc	%i4,	%o1,	%g2
	ldsw	[%l7 + 0x5C],	%o3
	xor	%i0,	0x1628,	%i7
	fandnot2s	%f18,	%f22,	%f21
	fmovdne	%xcc,	%f4,	%f31
	edge8ln	%l4,	%o5,	%i6
	fmovdvc	%xcc,	%f10,	%f7
	movg	%icc,	%l1,	%l5
	fnand	%f22,	%f10,	%f2
	movre	%o6,	%g5,	%l6
	stx	%i2,	[%l7 + 0x68]
	and	%i1,	0x0435,	%i5
	std	%f10,	[%l7 + 0x70]
	movgu	%icc,	%l3,	%g6
	xnor	%g1,	%g3,	%o7
	orn	%o2,	%i3,	%g7
	fmovsgu	%icc,	%f1,	%f2
	st	%f19,	[%l7 + 0x14]
	fxnor	%f14,	%f14,	%f10
	sethi	0x0820,	%l0
	sdiv	%o4,	0x002C,	%l2
	umulcc	%g4,	0x1670,	%o0
	edge16n	%o1,	%i4,	%g2
	lduh	[%l7 + 0x12],	%i0
	sdivcc	%o3,	0x039C,	%l4
	movvs	%icc,	%i7,	%i6
	sll	%o5,	%l1,	%l5
	edge32	%g5,	%l6,	%o6
	fmovrsne	%i2,	%f15,	%f19
	sra	%i1,	%i5,	%l3
	st	%f4,	[%l7 + 0x50]
	fxnor	%f28,	%f10,	%f30
	movrlez	%g1,	%g6,	%o7
	or	%g3,	%i3,	%g7
	orncc	%l0,	0x01FC,	%o4
	std	%f26,	[%l7 + 0x28]
	mulx	%l2,	%o2,	%g4
	fmovde	%xcc,	%f13,	%f1
	edge8n	%o1,	%o0,	%g2
	addcc	%i4,	0x0D3C,	%i0
	fnot2	%f14,	%f22
	alignaddr	%o3,	%i7,	%l4
	fmovrde	%o5,	%f18,	%f26
	fpadd32s	%f14,	%f4,	%f18
	movg	%xcc,	%l1,	%l5
	edge8l	%i6,	%g5,	%l6
	smulcc	%i2,	%i1,	%o6
	subcc	%i5,	0x10F3,	%g1
	movrne	%g6,	0x2E2,	%l3
	fmovdneg	%xcc,	%f16,	%f5
	pdist	%f14,	%f20,	%f16
	movrgez	%o7,	%i3,	%g3
	edge16l	%l0,	%g7,	%l2
	udivcc	%o2,	0x1D25,	%g4
	edge32ln	%o1,	%o4,	%g2
	fmovspos	%icc,	%f8,	%f23
	smul	%i4,	%i0,	%o0
	st	%f24,	[%l7 + 0x30]
	movn	%icc,	%i7,	%l4
	edge16	%o5,	%o3,	%l5
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%i6
	bshuffle	%f2,	%f6,	%f26
	fpadd16s	%f8,	%f10,	%f21
	array16	%l1,	%l6,	%g5
	fnot1s	%f3,	%f7
	movre	%i1,	%i2,	%i5
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%g1
	edge16n	%g6,	%l3,	%o7
	movrgez	%i3,	%o6,	%g3
	array8	%g7,	%l2,	%l0
	fcmps	%fcc0,	%f23,	%f17
	xor	%g4,	0x1929,	%o1
	subcc	%o4,	0x1F68,	%o2
	movvs	%xcc,	%g2,	%i4
	edge16n	%i0,	%o0,	%l4
	st	%f20,	[%l7 + 0x7C]
	mulscc	%i7,	0x0490,	%o5
	fmovrslez	%l5,	%f22,	%f8
	movrgz	%o3,	%i6,	%l1
	fnors	%f7,	%f9,	%f19
	fmovrsgz	%l6,	%f6,	%f24
	or	%g5,	0x14E0,	%i2
	fone	%f12
	nop
	set	0x3F, %g5
	ldsb	[%l7 + %g5],	%i1
	fcmps	%fcc1,	%f4,	%f18
	sdivcc	%g1,	0x0608,	%g6
	smul	%l3,	%i5,	%i3
	ld	[%l7 + 0x64],	%f26
	movrlz	%o6,	%o7,	%g7
	movn	%xcc,	%l2,	%g3
	fmovdleu	%xcc,	%f23,	%f9
	fnand	%f28,	%f2,	%f10
	fxor	%f2,	%f8,	%f16
	movrne	%l0,	%g4,	%o1
	xnorcc	%o2,	0x1E91,	%g2
	edge8n	%o4,	%i0,	%i4
	alignaddr	%l4,	%i7,	%o0
	edge8	%o5,	%l5,	%o3
	fpsub16s	%f13,	%f24,	%f15
	sethi	0x1E5C,	%l1
	fmul8x16al	%f26,	%f21,	%f10
	srl	%l6,	%i6,	%g5
	movvc	%icc,	%i2,	%i1
	orn	%g1,	%l3,	%i5
	sdivcc	%i3,	0x0773,	%g6
	mulx	%o6,	0x0122,	%g7
	movleu	%xcc,	%l2,	%o7
	ld	[%l7 + 0x08],	%f13
	sra	%g3,	%g4,	%o1
	sir	0x071A
	addccc	%l0,	%o2,	%o4
	fmovscs	%icc,	%f20,	%f6
	subccc	%g2,	0x0F70,	%i4
	fmovsg	%xcc,	%f4,	%f2
	add	%i0,	%i7,	%l4
	xor	%o0,	0x1EAE,	%l5
	movrlz	%o5,	0x21D,	%o3
	movvc	%xcc,	%l6,	%l1
	stb	%i6,	[%l7 + 0x0C]
	sub	%g5,	%i1,	%i2
	sll	%g1,	0x0A,	%l3
	fmovdle	%xcc,	%f5,	%f21
	movleu	%icc,	%i3,	%i5
	sth	%g6,	[%l7 + 0x4A]
	ldx	[%l7 + 0x48],	%o6
	xnorcc	%l2,	0x0BF1,	%o7
	fcmpeq32	%f10,	%f22,	%g3
	sth	%g7,	[%l7 + 0x78]
	orncc	%g4,	0x0117,	%o1
	sdivcc	%o2,	0x136C,	%l0
	srax	%o4,	%g2,	%i0
	smul	%i4,	%i7,	%l4
	fzero	%f14
	stb	%o0,	[%l7 + 0x76]
	andncc	%o5,	%o3,	%l5
	add	%l6,	%i6,	%l1
	ldsb	[%l7 + 0x3B],	%i1
	smulcc	%g5,	0x0026,	%i2
	subcc	%g1,	%i3,	%i5
	edge32l	%l3,	%g6,	%o6
	fandnot1	%f10,	%f24,	%f12
	sdivx	%l2,	0x1F10,	%g3
	sllx	%o7,	0x1E,	%g7
	move	%icc,	%g4,	%o1
	orn	%l0,	0x1C86,	%o4
	fpadd16s	%f11,	%f31,	%f0
	orn	%o2,	0x1836,	%g2
	fmul8sux16	%f10,	%f14,	%f18
	for	%f28,	%f24,	%f8
	fexpand	%f14,	%f30
	umul	%i0,	0x0E77,	%i7
	orcc	%l4,	%o0,	%i4
	fnot2	%f16,	%f22
	nop
	set	0x18, %o5
	stw	%o5,	[%l7 + %o5]
	movleu	%icc,	%o3,	%l5
	fmovsgu	%icc,	%f25,	%f27
	fmovdle	%xcc,	%f2,	%f5
	edge16ln	%l6,	%l1,	%i6
	array32	%i1,	%g5,	%g1
	movrne	%i2,	%i3,	%i5
	xnorcc	%g6,	0x1BCC,	%o6
	stw	%l3,	[%l7 + 0x5C]
	movne	%icc,	%l2,	%o7
	andcc	%g3,	%g7,	%g4
	fmuld8sux16	%f21,	%f4,	%f24
	alignaddrl	%l0,	%o1,	%o2
	array8	%g2,	%i0,	%o4
	udiv	%i7,	0x0DB1,	%o0
	add	%l4,	%o5,	%i4
	edge32ln	%o3,	%l6,	%l1
	stb	%i6,	[%l7 + 0x37]
	movn	%xcc,	%i1,	%l5
	srlx	%g5,	0x04,	%g1
	ldsh	[%l7 + 0x68],	%i2
	udivcc	%i5,	0x0F5A,	%g6
	movpos	%icc,	%o6,	%l3
	nop
	set	0x20, %l0
	ldsb	[%l7 + %l0],	%i3
	xor	%o7,	%l2,	%g3
	edge16l	%g4,	%l0,	%g7
	fmovdvc	%xcc,	%f22,	%f30
	srl	%o2,	%o1,	%g2
	ldd	[%l7 + 0x70],	%f4
	nop
	set	0x7E, %o4
	sth	%o4,	[%l7 + %o4]
	movrlez	%i0,	%i7,	%o0
	edge16n	%o5,	%l4,	%o3
	andncc	%i4,	%l1,	%l6
	ldx	[%l7 + 0x30],	%i6
	fmovrsgez	%i1,	%f18,	%f9
	movre	%g5,	%g1,	%l5
	fmovsneg	%icc,	%f22,	%f8
	ldub	[%l7 + 0x11],	%i5
	movrlez	%g6,	0x35C,	%i2
	ldsw	[%l7 + 0x4C],	%l3
	sethi	0x1B56,	%i3
	ldsb	[%l7 + 0x2B],	%o7
	udivcc	%l2,	0x0692,	%o6
	siam	0x5
	ldsh	[%l7 + 0x54],	%g3
	fandnot1s	%f17,	%f15,	%f7
	edge8	%g4,	%l0,	%g7
	ld	[%l7 + 0x44],	%f18
	xnorcc	%o1,	%o2,	%g2
	edge16l	%o4,	%i0,	%i7
	edge16n	%o0,	%o5,	%l4
	edge32ln	%o3,	%l1,	%l6
	srlx	%i4,	%i1,	%i6
	fmovdleu	%xcc,	%f22,	%f6
	udiv	%g1,	0x16F0,	%l5
	pdist	%f30,	%f18,	%f26
	edge32ln	%i5,	%g6,	%i2
	xorcc	%l3,	0x13C8,	%i3
	movgu	%xcc,	%o7,	%g5
	umulcc	%l2,	%o6,	%g4
	andn	%l0,	0x14EB,	%g7
	subcc	%o1,	%o2,	%g2
	mulx	%o4,	0x1996,	%i0
	sdivx	%i7,	0x0EB4,	%o0
	movg	%xcc,	%o5,	%l4
	edge32	%o3,	%g3,	%l6
	ldd	[%l7 + 0x18],	%l0
	for	%f4,	%f10,	%f0
	move	%xcc,	%i1,	%i4
	udivcc	%i6,	0x152B,	%l5
	edge16	%i5,	%g1,	%g6
	fsrc1	%f2,	%f8
	movl	%icc,	%i2,	%i3
	sllx	%l3,	0x09,	%o7
	andcc	%g5,	0x026A,	%l2
	sdivcc	%g4,	0x16B6,	%l0
	movn	%xcc,	%o6,	%o1
	xnor	%o2,	0x1893,	%g7
	fpadd32s	%f25,	%f20,	%f4
	edge32ln	%g2,	%i0,	%i7
	movcs	%xcc,	%o4,	%o5
	movrlz	%l4,	0x2CD,	%o3
	fcmpd	%fcc0,	%f20,	%f22
	fmul8ulx16	%f4,	%f0,	%f6
	movcs	%xcc,	%g3,	%l6
	fxnors	%f29,	%f11,	%f31
	save %o0, %l1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i6,	0x03FD,	%l5
	fmovsl	%icc,	%f29,	%f18
	andcc	%i4,	0x01C7,	%i5
	movgu	%icc,	%g6,	%g1
	fmovdleu	%icc,	%f3,	%f20
	fnors	%f10,	%f29,	%f14
	sdiv	%i3,	0x13E6,	%i2
	fandnot1s	%f14,	%f9,	%f3
	xnorcc	%o7,	0x0E0C,	%g5
	srl	%l2,	%g4,	%l3
	sdivcc	%o6,	0x113B,	%o1
	orcc	%l0,	0x1E66,	%o2
	fmovdgu	%icc,	%f13,	%f21
	fmovrdgz	%g2,	%f28,	%f0
	movvs	%xcc,	%i0,	%i7
	add	%g7,	0x0A54,	%o5
	xorcc	%l4,	0x0CFC,	%o4
	edge32ln	%g3,	%l6,	%o0
	sll	%o3,	0x04,	%i1
	andncc	%l1,	%l5,	%i6
	movrlez	%i4,	0x109,	%i5
	array32	%g6,	%g1,	%i3
	orcc	%i2,	%o7,	%l2
	movvc	%xcc,	%g5,	%l3
	edge16n	%o6,	%o1,	%l0
	umul	%g4,	%g2,	%i0
	srl	%i7,	%g7,	%o5
	andn	%l4,	0x0339,	%o4
	movcs	%xcc,	%o2,	%g3
	xor	%l6,	%o0,	%i1
	ldd	[%l7 + 0x68],	%l0
	orcc	%o3,	%i6,	%l5
	addc	%i4,	%i5,	%g1
	restore %g6, 0x1D58, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i2,	%l2,	%g5
	orn	%o7,	0x1A6C,	%l3
	subc	%o1,	%l0,	%o6
	movcs	%xcc,	%g2,	%g4
	or	%i0,	%i7,	%g7
	fcmple32	%f16,	%f4,	%o5
	ldsb	[%l7 + 0x35],	%o4
	orncc	%l4,	%o2,	%l6
	fmul8ulx16	%f24,	%f16,	%f30
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	andncc	%o3,	%i6,	%l5
	movne	%xcc,	%i4,	%i5
	orcc	%g1,	0x1C8D,	%l1
	edge32l	%g6,	%i2,	%i3
	sub	%g5,	0x08C5,	%l2
	movrlz	%l3,	0x136,	%o7
	sdiv	%l0,	0x0D48,	%o1
	orncc	%g2,	0x004A,	%o6
	fpmerge	%f28,	%f29,	%f20
	xorcc	%g4,	%i0,	%g7
	xnor	%i7,	%o4,	%o5
	fmovsl	%icc,	%f11,	%f7
	edge32n	%o2,	%l4,	%l6
	addcc	%g3,	%o0,	%o3
	ldx	[%l7 + 0x30],	%i1
	mulscc	%l5,	0x177E,	%i6
	movrlz	%i5,	%g1,	%l1
	orn	%i4,	0x09E4,	%i2
	xnor	%i3,	%g6,	%g5
	edge16ln	%l2,	%l3,	%o7
	std	%f2,	[%l7 + 0x10]
	orncc	%o1,	%g2,	%o6
	alignaddrl	%g4,	%l0,	%i0
	andn	%g7,	0x1BC5,	%o4
	add	%i7,	%o2,	%o5
	move	%icc,	%l4,	%l6
	fmovrsgez	%o0,	%f30,	%f17
	ldx	[%l7 + 0x78],	%g3
	xnor	%o3,	%l5,	%i1
	subccc	%i5,	%i6,	%g1
	mulscc	%i4,	0x1255,	%i2
	array8	%i3,	%g6,	%g5
	sth	%l1,	[%l7 + 0x0A]
	fpack32	%f18,	%f26,	%f14
	or	%l3,	0x0AB4,	%o7
	fmovrsgez	%o1,	%f18,	%f11
	sub	%l2,	0x1940,	%o6
	fpadd32s	%f26,	%f7,	%f13
	sub	%g4,	0x0EEC,	%g2
	sdiv	%i0,	0x025B,	%l0
	subccc	%g7,	%o4,	%o2
	fmovdle	%xcc,	%f12,	%f8
	movleu	%icc,	%i7,	%o5
	ldx	[%l7 + 0x58],	%l4
	smul	%l6,	0x053F,	%g3
	stw	%o3,	[%l7 + 0x0C]
	movg	%xcc,	%o0,	%l5
	subccc	%i5,	0x0D4C,	%i1
	fpadd32s	%f21,	%f11,	%f18
	smul	%i6,	0x0751,	%i4
	fnand	%f18,	%f24,	%f0
	popc	0x1AE8,	%g1
	array32	%i2,	%i3,	%g5
	udivcc	%l1,	0x138C,	%l3
	edge32l	%o7,	%o1,	%g6
	srax	%l2,	%g4,	%o6
	fmovdgu	%xcc,	%f31,	%f5
	stw	%g2,	[%l7 + 0x34]
	stw	%l0,	[%l7 + 0x5C]
	edge8n	%i0,	%o4,	%g7
	fmovdpos	%xcc,	%f24,	%f3
	andn	%i7,	0x098E,	%o2
	fmovrsne	%l4,	%f25,	%f11
	ldsh	[%l7 + 0x5E],	%l6
	fornot1s	%f23,	%f23,	%f26
	fmovd	%f22,	%f24
	movle	%xcc,	%o5,	%o3
	orncc	%g3,	%l5,	%i5
	stw	%o0,	[%l7 + 0x20]
	lduw	[%l7 + 0x10],	%i6
	lduh	[%l7 + 0x20],	%i1
	movn	%icc,	%g1,	%i2
	orcc	%i4,	0x06E6,	%i3
	sra	%l1,	%l3,	%o7
	save %g5, %g6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f4,	%f13
	sdivx	%o1,	0x01B3,	%o6
	addcc	%g2,	0x16E4,	%l0
	sllx	%g4,	0x00,	%i0
	ldsb	[%l7 + 0x2F],	%g7
	andn	%o4,	0x19EF,	%i7
	sth	%o2,	[%l7 + 0x10]
	movg	%xcc,	%l4,	%o5
	subcc	%l6,	%g3,	%o3
	ldub	[%l7 + 0x5A],	%l5
	orn	%o0,	%i6,	%i1
	udivcc	%i5,	0x08FB,	%i2
	mulx	%g1,	%i3,	%i4
	movrne	%l3,	%l1,	%o7
	ldsw	[%l7 + 0x78],	%g5
	sdivcc	%g6,	0x085C,	%o1
	movle	%xcc,	%l2,	%g2
	movcs	%icc,	%l0,	%o6
	srlx	%i0,	%g4,	%o4
	stw	%g7,	[%l7 + 0x3C]
	movne	%icc,	%i7,	%o2
	movvs	%icc,	%l4,	%l6
	sth	%g3,	[%l7 + 0x66]
	movgu	%icc,	%o5,	%o3
	xnor	%o0,	0x089F,	%i6
	fcmpgt32	%f26,	%f12,	%l5
	andcc	%i1,	0x1D25,	%i5
	mova	%xcc,	%i2,	%g1
	fmovsle	%xcc,	%f29,	%f4
	movn	%xcc,	%i3,	%l3
	fmovsvc	%icc,	%f16,	%f17
	movrlz	%i4,	0x21E,	%l1
	add	%o7,	0x06A7,	%g6
	movgu	%xcc,	%g5,	%l2
	fxor	%f10,	%f14,	%f20
	move	%xcc,	%o1,	%l0
	or	%o6,	0x18CE,	%i0
	movre	%g2,	%g4,	%g7
	udiv	%o4,	0x1343,	%i7
	xor	%o2,	0x1C7B,	%l6
	fmovscs	%xcc,	%f23,	%f24
	fmul8sux16	%f30,	%f0,	%f6
	andn	%l4,	%o5,	%o3
	stb	%g3,	[%l7 + 0x5D]
	fnors	%f27,	%f8,	%f28
	edge8ln	%i6,	%l5,	%i1
	fmovsne	%xcc,	%f2,	%f31
	mulx	%i5,	0x03C7,	%o0
	movrne	%g1,	0x0F2,	%i2
	fmovdg	%icc,	%f11,	%f18
	movgu	%xcc,	%i3,	%i4
	xor	%l3,	0x0EFA,	%l1
	fmovsa	%icc,	%f6,	%f9
	xnorcc	%o7,	0x1D9D,	%g5
	sllx	%g6,	0x13,	%o1
	ldsb	[%l7 + 0x73],	%l0
	smulcc	%l2,	0x1F4B,	%i0
	sdivx	%g2,	0x0AFF,	%g4
	sra	%o6,	0x02,	%o4
	edge32	%i7,	%g7,	%l6
	movre	%o2,	0x349,	%l4
	lduh	[%l7 + 0x32],	%o5
	stb	%o3,	[%l7 + 0x2D]
	mulx	%g3,	0x0EFB,	%i6
	orncc	%l5,	%i1,	%o0
	stb	%i5,	[%l7 + 0x5D]
	ldx	[%l7 + 0x30],	%i2
	xor	%g1,	%i3,	%l3
	fmovs	%f0,	%f7
	udivcc	%l1,	0x0426,	%o7
	andn	%g5,	%i4,	%g6
	movne	%xcc,	%l0,	%o1
	fornot2s	%f14,	%f24,	%f18
	mova	%icc,	%i0,	%g2
	edge8ln	%l2,	%g4,	%o6
	movpos	%xcc,	%i7,	%g7
	sllx	%l6,	%o4,	%o2
	fors	%f16,	%f17,	%f12
	add	%l4,	%o5,	%g3
	edge32	%i6,	%l5,	%i1
	edge16ln	%o3,	%i5,	%i2
	xorcc	%o0,	0x0703,	%i3
	fmovrse	%l3,	%f30,	%f10
	sdivx	%g1,	0x0B93,	%l1
	movcs	%icc,	%g5,	%i4
	stx	%o7,	[%l7 + 0x18]
	edge16l	%l0,	%o1,	%i0
	fcmpeq32	%f12,	%f20,	%g2
	fcmpgt32	%f24,	%f18,	%l2
	movgu	%xcc,	%g4,	%g6
	lduh	[%l7 + 0x78],	%i7
	andn	%o6,	%l6,	%o4
	nop
	set	0x20, %o3
	ldsh	[%l7 + %o3],	%o2
	orncc	%l4,	0x0F0D,	%g7
	lduw	[%l7 + 0x78],	%o5
	ldub	[%l7 + 0x56],	%g3
	sub	%i6,	%i1,	%o3
	movcs	%xcc,	%l5,	%i2
	stw	%i5,	[%l7 + 0x0C]
	fmovscs	%xcc,	%f9,	%f5
	fmovrse	%o0,	%f24,	%f21
	fpadd16	%f8,	%f16,	%f20
	fcmpne32	%f30,	%f24,	%i3
	srl	%g1,	0x16,	%l1
	edge16l	%l3,	%i4,	%g5
	movneg	%xcc,	%l0,	%o1
	udivcc	%o7,	0x0F35,	%g2
	movre	%l2,	0x38C,	%i0
	ldsb	[%l7 + 0x2F],	%g6
	srl	%g4,	%o6,	%i7
	movl	%icc,	%o4,	%l6
	addcc	%o2,	0x10C6,	%l4
	movneg	%xcc,	%o5,	%g7
	mova	%xcc,	%i6,	%g3
	fzero	%f6
	sir	0x1D68
	xnor	%i1,	%o3,	%i2
	sub	%i5,	0x1F05,	%o0
	fmovdl	%icc,	%f30,	%f1
	fnot1s	%f4,	%f10
	array32	%l5,	%g1,	%i3
	udiv	%l1,	0x0C8B,	%i4
	ldx	[%l7 + 0x30],	%g5
	popc	0x1FA8,	%l3
	lduw	[%l7 + 0x60],	%o1
	edge8n	%o7,	%g2,	%l2
	movl	%icc,	%l0,	%g6
	edge32l	%g4,	%i0,	%i7
	ldx	[%l7 + 0x38],	%o4
	popc	0x0419,	%l6
	srlx	%o6,	%o2,	%l4
	andncc	%o5,	%i6,	%g7
	orcc	%i1,	%g3,	%o3
	array8	%i5,	%i2,	%l5
	alignaddr	%o0,	%i3,	%g1
	mova	%icc,	%i4,	%g5
	ldd	[%l7 + 0x20],	%f28
	subccc	%l1,	%l3,	%o7
	fmovsneg	%xcc,	%f1,	%f20
	fmovsvc	%icc,	%f1,	%f6
	fmovdn	%icc,	%f28,	%f24
	stw	%g2,	[%l7 + 0x20]
	stb	%o1,	[%l7 + 0x11]
	movleu	%xcc,	%l0,	%l2
	movcs	%icc,	%g6,	%i0
	udiv	%g4,	0x0967,	%o4
	ld	[%l7 + 0x70],	%f10
	fnands	%f21,	%f6,	%f10
	array16	%l6,	%o6,	%i7
	sdiv	%o2,	0x1986,	%o5
	edge8	%l4,	%g7,	%i6
	movvc	%icc,	%i1,	%o3
	movgu	%icc,	%g3,	%i2
	ldd	[%l7 + 0x28],	%f8
	array16	%i5,	%l5,	%o0
	xor	%g1,	0x1390,	%i3
	umulcc	%i4,	0x00B0,	%g5
	ldsb	[%l7 + 0x75],	%l1
	array32	%o7,	%l3,	%o1
	edge32	%l0,	%g2,	%g6
	st	%f25,	[%l7 + 0x40]
	udiv	%i0,	0x152A,	%g4
	fmovrdlez	%l2,	%f6,	%f14
	sir	0x0E44
	xor	%l6,	0x177F,	%o6
	orcc	%o4,	0x1CA7,	%i7
	ldsb	[%l7 + 0x12],	%o2
	fmovrsgz	%o5,	%f30,	%f16
	movvc	%icc,	%l4,	%g7
	movcc	%xcc,	%i1,	%o3
	move	%icc,	%g3,	%i6
	movrlez	%i2,	0x28D,	%l5
	fmovrsne	%i5,	%f25,	%f8
	subcc	%o0,	0x0F04,	%g1
	fmovrdgez	%i3,	%f22,	%f0
	udivx	%g5,	0x0998,	%i4
	movcs	%icc,	%o7,	%l1
	mova	%icc,	%o1,	%l0
	xnor	%l3,	0x0D41,	%g2
	popc	%g6,	%g4
	array8	%i0,	%l2,	%l6
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f28
	fpadd32	%f0,	%f28,	%f30
	fmovsn	%xcc,	%f12,	%f9
	ldsh	[%l7 + 0x54],	%o4
	nop
	set	0x40, %i7
	lduw	[%l7 + %i7],	%o6
	addcc	%o2,	0x095F,	%i7
	fmovrde	%o5,	%f8,	%f2
	movne	%xcc,	%g7,	%i1
	fnot2	%f30,	%f2
	fpadd16	%f10,	%f16,	%f0
	for	%f4,	%f28,	%f0
	stb	%l4,	[%l7 + 0x1E]
	udivcc	%o3,	0x1616,	%g3
	edge16	%i6,	%l5,	%i2
	alignaddrl	%i5,	%g1,	%o0
	for	%f12,	%f28,	%f2
	mova	%icc,	%i3,	%i4
	alignaddr	%o7,	%l1,	%o1
	movg	%xcc,	%g5,	%l3
	udiv	%g2,	0x020B,	%g6
	andn	%l0,	0x1065,	%g4
	edge16ln	%i0,	%l6,	%o4
	sub	%l2,	0x085E,	%o2
	fsrc2	%f30,	%f8
	movl	%xcc,	%o6,	%o5
	edge8n	%g7,	%i7,	%l4
	movrgez	%i1,	%g3,	%o3
	addcc	%l5,	%i2,	%i5
	bshuffle	%f14,	%f14,	%f24
	orncc	%g1,	0x12A5,	%i6
	alignaddrl	%i3,	%i4,	%o0
	sdivx	%o7,	0x09E7,	%o1
	edge8	%g5,	%l3,	%g2
	movleu	%icc,	%l1,	%l0
	movre	%g4,	0x196,	%i0
	sub	%l6,	0x14A4,	%o4
	fmovrsne	%l2,	%f23,	%f30
	fcmpgt32	%f30,	%f22,	%o2
	edge32n	%o6,	%g6,	%g7
	subccc	%o5,	0x0A35,	%l4
	srlx	%i1,	%i7,	%o3
	fmovdleu	%icc,	%f1,	%f12
	fornot1s	%f23,	%f10,	%f16
	sth	%g3,	[%l7 + 0x42]
	fornot2	%f18,	%f28,	%f16
	ldub	[%l7 + 0x27],	%l5
	ldsb	[%l7 + 0x5C],	%i2
	fpsub16s	%f31,	%f9,	%f14
	xnorcc	%i5,	%g1,	%i6
	array8	%i4,	%i3,	%o7
	array16	%o0,	%o1,	%g5
	movl	%icc,	%l3,	%g2
	restore %l1, 0x0794, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f9,	%f29
	subc	%l0,	%i0,	%l6
	udivcc	%o4,	0x0702,	%l2
	andncc	%o2,	%g6,	%g7
	movrlz	%o6,	0x130,	%o5
	sethi	0x10CB,	%i1
	movrlz	%i7,	%l4,	%o3
	xnor	%g3,	%i2,	%l5
	save %g1, %i5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i6,	%o7,	%i3
	lduh	[%l7 + 0x1E],	%o0
	udivcc	%g5,	0x1543,	%o1
	fmovsleu	%xcc,	%f7,	%f27
	ldsb	[%l7 + 0x35],	%g2
	ldd	[%l7 + 0x50],	%l2
	udiv	%l1,	0x1BD0,	%l0
	std	%f2,	[%l7 + 0x70]
	umulcc	%i0,	0x0ECC,	%g4
	movne	%icc,	%l6,	%o4
	fmovsn	%xcc,	%f10,	%f23
	fmovsn	%xcc,	%f13,	%f29
	sth	%l2,	[%l7 + 0x54]
	sdiv	%g6,	0x1759,	%g7
	bshuffle	%f22,	%f2,	%f30
	sdiv	%o2,	0x0E10,	%o5
	fpack32	%f22,	%f10,	%f14
	fmovdvs	%icc,	%f29,	%f31
	smulcc	%o6,	%i7,	%i1
	ldub	[%l7 + 0x70],	%l4
	sdiv	%g3,	0x1CB3,	%i2
	nop
	set	0x1D, %i1
	ldub	[%l7 + %i1],	%o3
	movcc	%icc,	%l5,	%i5
	faligndata	%f12,	%f16,	%f12
	fpadd32s	%f0,	%f30,	%f2
	ldd	[%l7 + 0x38],	%g0
	andcc	%i6,	%i4,	%i3
	for	%f12,	%f4,	%f8
	fpadd32	%f4,	%f12,	%f4
	ldub	[%l7 + 0x18],	%o7
	move	%xcc,	%o0,	%g5
	subc	%g2,	%l3,	%l1
	ldd	[%l7 + 0x08],	%l0
	fmovsl	%icc,	%f27,	%f16
	fmovda	%xcc,	%f16,	%f6
	sub	%o1,	%i0,	%l6
	smul	%o4,	0x1CDE,	%g4
	sth	%l2,	[%l7 + 0x60]
	andn	%g7,	%o2,	%g6
	movle	%icc,	%o6,	%i7
	fandnot2s	%f27,	%f16,	%f4
	std	%f26,	[%l7 + 0x08]
	movvs	%icc,	%i1,	%l4
	movrgez	%g3,	0x2B6,	%i2
	edge16	%o5,	%l5,	%o3
	fzero	%f16
	subccc	%g1,	%i5,	%i6
	edge16l	%i4,	%i3,	%o0
	fmovsg	%xcc,	%f6,	%f18
	mulx	%o7,	%g5,	%g2
	stx	%l3,	[%l7 + 0x28]
	xnorcc	%l1,	0x0E93,	%l0
	movcs	%xcc,	%i0,	%l6
	fpackfix	%f24,	%f22
	fandnot2	%f28,	%f2,	%f14
	stw	%o4,	[%l7 + 0x10]
	sdivx	%g4,	0x0AE7,	%o1
	sub	%l2,	%g7,	%g6
	alignaddr	%o2,	%o6,	%i1
	fmovdneg	%xcc,	%f31,	%f17
	andncc	%i7,	%g3,	%i2
	sdiv	%o5,	0x060D,	%l4
	for	%f4,	%f16,	%f10
	fnors	%f1,	%f2,	%f4
	edge32ln	%l5,	%g1,	%i5
	sll	%o3,	%i6,	%i3
	stx	%i4,	[%l7 + 0x60]
	edge8	%o0,	%g5,	%o7
	sllx	%g2,	0x0F,	%l3
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	fpadd32	%f18,	%f18,	%f28
	movvc	%icc,	%l6,	%o4
	fmovdne	%xcc,	%f21,	%f12
	movvs	%xcc,	%g4,	%o1
	fornot1s	%f10,	%f31,	%f26
	umulcc	%l2,	0x0EA4,	%i0
	udivcc	%g6,	0x108B,	%g7
	movgu	%icc,	%o2,	%o6
	ldd	[%l7 + 0x38],	%f12
	ldx	[%l7 + 0x28],	%i1
	sll	%i7,	0x13,	%i2
	movpos	%xcc,	%g3,	%o5
	edge32n	%l4,	%l5,	%i5
	edge32	%o3,	%g1,	%i6
	ldsh	[%l7 + 0x3A],	%i3
	fmovrdne	%o0,	%f12,	%f28
	movn	%icc,	%g5,	%o7
	save %g2, 0x10C4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l0,	%l1,	%i4
	xor	%l6,	%o4,	%g4
	nop
	set	0x1C, %i0
	stb	%l2,	[%l7 + %i0]
	edge32	%i0,	%o1,	%g7
	add	%g6,	0x1480,	%o2
	sdivx	%i1,	0x1FB0,	%o6
	movgu	%xcc,	%i7,	%i2
	sra	%o5,	0x0B,	%l4
	udivx	%g3,	0x07B2,	%l5
	udivcc	%o3,	0x0FA6,	%g1
	umul	%i6,	0x0666,	%i5
	std	%f4,	[%l7 + 0x28]
	fornot2	%f28,	%f0,	%f4
	addcc	%o0,	%g5,	%i3
	movn	%icc,	%g2,	%l3
	ldd	[%l7 + 0x28],	%o6
	edge16ln	%l0,	%i4,	%l6
	orn	%o4,	0x0E86,	%l1
	addc	%l2,	%i0,	%g4
	lduh	[%l7 + 0x62],	%g7
	edge16ln	%g6,	%o1,	%o2
	andncc	%i1,	%o6,	%i7
	udivcc	%o5,	0x106B,	%i2
	fmovrsgez	%g3,	%f5,	%f23
	xnorcc	%l4,	%l5,	%o3
	umul	%g1,	0x1C5B,	%i6
	lduw	[%l7 + 0x18],	%o0
	sra	%g5,	0x1E,	%i3
	sllx	%g2,	%i5,	%o7
	fmuld8ulx16	%f9,	%f23,	%f8
	add	%l3,	0x1297,	%l0
	fones	%f10
	ldsw	[%l7 + 0x4C],	%i4
	fmovrdne	%l6,	%f16,	%f12
	edge32ln	%o4,	%l1,	%l2
	mulx	%i0,	%g7,	%g4
	fnot2s	%f2,	%f30
	movcc	%xcc,	%g6,	%o2
	andn	%o1,	%i1,	%o6
	mova	%icc,	%i7,	%o5
	fnand	%f8,	%f26,	%f4
	sethi	0x042E,	%g3
	ldx	[%l7 + 0x28],	%l4
	alignaddrl	%i2,	%l5,	%o3
	edge8n	%g1,	%i6,	%g5
	nop
	set	0x2A, %l2
	sth	%o0,	[%l7 + %l2]
	movcs	%icc,	%i3,	%i5
	edge8ln	%g2,	%o7,	%l0
	sll	%l3,	0x0C,	%l6
	fmovrse	%o4,	%f25,	%f15
	fcmpeq32	%f30,	%f16,	%i4
	srax	%l1,	%i0,	%l2
	movrgez	%g4,	0x2D3,	%g7
	edge16n	%o2,	%g6,	%o1
	udivcc	%i1,	0x074E,	%i7
	edge16	%o5,	%o6,	%l4
	andncc	%i2,	%g3,	%o3
	std	%f14,	[%l7 + 0x28]
	movvc	%icc,	%l5,	%i6
	siam	0x0
	movpos	%icc,	%g5,	%o0
	movn	%icc,	%g1,	%i3
	sllx	%g2,	0x15,	%o7
	edge16n	%i5,	%l3,	%l0
	umul	%l6,	0x1724,	%o4
	ldd	[%l7 + 0x28],	%f10
	umul	%l1,	%i0,	%l2
	edge32	%g4,	%i4,	%g7
	ldsw	[%l7 + 0x14],	%g6
	xnor	%o2,	%i1,	%i7
	edge32	%o1,	%o5,	%o6
	udivcc	%i2,	0x0F02,	%l4
	fmovrsgez	%o3,	%f22,	%f16
	andncc	%l5,	%i6,	%g3
	fmovsgu	%xcc,	%f16,	%f23
	fmovdleu	%xcc,	%f26,	%f2
	fandnot1	%f12,	%f26,	%f6
	nop
	set	0x60, %i4
	stx	%o0,	[%l7 + %i4]
	xorcc	%g5,	%i3,	%g2
	movne	%icc,	%o7,	%i5
	orn	%g1,	0x0E58,	%l0
	stw	%l3,	[%l7 + 0x78]
	movpos	%icc,	%o4,	%l1
	edge16	%i0,	%l2,	%g4
	alignaddr	%l6,	%g7,	%i4
	array32	%g6,	%o2,	%i7
	sllx	%o1,	0x12,	%o5
	movleu	%xcc,	%i1,	%o6
	udivcc	%l4,	0x1AC4,	%i2
	fones	%f17
	xorcc	%o3,	0x11F5,	%i6
	sdiv	%l5,	0x1D3C,	%g3
	sllx	%o0,	%i3,	%g5
	fxnor	%f20,	%f6,	%f22
	fmovrsgz	%o7,	%f6,	%f14
	movgu	%xcc,	%g2,	%i5
	movneg	%xcc,	%g1,	%l0
	alignaddrl	%o4,	%l1,	%i0
	subccc	%l2,	%g4,	%l3
	fpadd32s	%f21,	%f29,	%f26
	sth	%g7,	[%l7 + 0x64]
	fabss	%f25,	%f8
	movcc	%xcc,	%l6,	%i4
	sdiv	%g6,	0x022D,	%i7
	andncc	%o1,	%o2,	%o5
	srax	%i1,	0x1D,	%l4
	popc	%i2,	%o3
	movge	%xcc,	%o6,	%l5
	movneg	%xcc,	%g3,	%o0
	addccc	%i3,	%g5,	%o7
	edge16ln	%g2,	%i5,	%g1
	ldsw	[%l7 + 0x5C],	%i6
	movneg	%xcc,	%l0,	%l1
	stw	%i0,	[%l7 + 0x74]
	edge32	%l2,	%g4,	%o4
	nop
	set	0x20, %g3
	stw	%l3,	[%l7 + %g3]
	st	%f0,	[%l7 + 0x3C]
	fnands	%f11,	%f2,	%f12
	movleu	%icc,	%l6,	%i4
	andcc	%g7,	%i7,	%o1
	movrgz	%g6,	0x062,	%o2
	stw	%i1,	[%l7 + 0x20]
	sll	%o5,	%i2,	%o3
	mova	%icc,	%o6,	%l4
	sdivcc	%g3,	0x0CAF,	%o0
	fcmpeq16	%f26,	%f6,	%i3
	alignaddrl	%l5,	%g5,	%o7
	fmovdneg	%icc,	%f2,	%f25
	array32	%i5,	%g2,	%g1
	subcc	%i6,	0x1999,	%l1
	udiv	%i0,	0x12D7,	%l0
	addcc	%l2,	%g4,	%o4
	sdiv	%l6,	0x0A7A,	%i4
	movl	%xcc,	%g7,	%i7
	srl	%o1,	0x0A,	%l3
	mulx	%g6,	%i1,	%o2
	fandnot1s	%f24,	%f11,	%f1
	edge8	%o5,	%o3,	%i2
	addccc	%l4,	%g3,	%o0
	mulx	%i3,	0x19D9,	%l5
	addcc	%g5,	%o7,	%i5
	udiv	%o6,	0x0246,	%g2
	and	%i6,	%l1,	%g1
	fmul8x16au	%f0,	%f1,	%f20
	movg	%xcc,	%l0,	%l2
	andcc	%g4,	%o4,	%i0
	edge8n	%i4,	%l6,	%g7
	array16	%i7,	%l3,	%g6
	fxnors	%f18,	%f30,	%f9
	sth	%o1,	[%l7 + 0x5A]
	srax	%i1,	%o5,	%o3
	nop
	set	0x6E, %o0
	sth	%o2,	[%l7 + %o0]
	movvc	%xcc,	%i2,	%l4
	addcc	%o0,	0x197E,	%i3
	restore %l5, 0x1D60, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o7,	0x1B,	%i5
	srlx	%o6,	%g3,	%g2
	and	%l1,	0x1F6B,	%g1
	sub	%l0,	%l2,	%i6
	edge32	%g4,	%o4,	%i4
	movneg	%xcc,	%i0,	%l6
	fpsub32	%f20,	%f22,	%f0
	fmovsge	%icc,	%f23,	%f25
	fmovrde	%i7,	%f6,	%f24
	subc	%g7,	%l3,	%g6
	sth	%o1,	[%l7 + 0x74]
	sdivx	%o5,	0x14C0,	%o3
	xorcc	%o2,	%i1,	%i2
	stb	%l4,	[%l7 + 0x7D]
	edge32	%o0,	%l5,	%i3
	fpsub16s	%f29,	%f23,	%f13
	mulx	%o7,	0x00CA,	%g5
	srlx	%i5,	0x1E,	%o6
	stx	%g3,	[%l7 + 0x38]
	sra	%l1,	0x0B,	%g1
	addccc	%l0,	%g2,	%l2
	edge16ln	%i6,	%o4,	%i4
	fcmpeq16	%f20,	%f12,	%g4
	sethi	0x1701,	%i0
	movg	%xcc,	%l6,	%i7
	movneg	%icc,	%l3,	%g6
	lduh	[%l7 + 0x74],	%g7
	orcc	%o1,	0x0D79,	%o5
	edge16l	%o2,	%o3,	%i1
	edge32l	%i2,	%l4,	%l5
	edge32ln	%o0,	%i3,	%g5
	ld	[%l7 + 0x2C],	%f28
	addccc	%o7,	0x059E,	%i5
	addc	%g3,	%l1,	%g1
	movrne	%o6,	0x23C,	%g2
	ld	[%l7 + 0x68],	%f14
	ldsh	[%l7 + 0x3A],	%l2
	fxor	%f16,	%f22,	%f20
	movrgz	%i6,	%o4,	%l0
	movrgez	%g4,	%i4,	%i0
	add	%i7,	0x092B,	%l6
	edge8ln	%g6,	%g7,	%l3
	lduw	[%l7 + 0x28],	%o1
	sub	%o2,	0x0DCC,	%o5
	ld	[%l7 + 0x1C],	%f28
	sir	0x1B05
	movgu	%icc,	%o3,	%i1
	sdiv	%i2,	0x0B8F,	%l4
	fmul8x16al	%f7,	%f23,	%f16
	movvs	%xcc,	%l5,	%o0
	edge8	%i3,	%g5,	%i5
	movpos	%icc,	%o7,	%l1
	edge16n	%g1,	%g3,	%g2
	or	%o6,	%i6,	%l2
	std	%f24,	[%l7 + 0x50]
	xnor	%o4,	%g4,	%i4
	sdivcc	%i0,	0x1331,	%l0
	stw	%i7,	[%l7 + 0x78]
	movleu	%xcc,	%g6,	%l6
	fabsd	%f30,	%f2
	edge16l	%g7,	%o1,	%l3
	ldub	[%l7 + 0x3C],	%o5
	alignaddrl	%o2,	%i1,	%o3
	stb	%l4,	[%l7 + 0x22]
	andcc	%i2,	%l5,	%o0
	edge16ln	%i3,	%g5,	%o7
	and	%i5,	0x031C,	%l1
	fmovdleu	%xcc,	%f2,	%f12
	ldx	[%l7 + 0x30],	%g1
	ld	[%l7 + 0x5C],	%f9
	movne	%xcc,	%g2,	%o6
	movrlez	%i6,	0x035,	%g3
	array16	%l2,	%g4,	%i4
	movvs	%xcc,	%o4,	%i0
	addcc	%i7,	0x0FC5,	%l0
	andncc	%l6,	%g6,	%o1
	fmovsg	%xcc,	%f3,	%f9
	movneg	%icc,	%g7,	%l3
	fmovsgu	%icc,	%f5,	%f2
	fmovdvc	%xcc,	%f15,	%f20
	ldsb	[%l7 + 0x6F],	%o2
	subc	%i1,	0x0798,	%o5
	array8	%l4,	%o3,	%i2
	sllx	%l5,	0x06,	%o0
	umul	%g5,	0x0ADD,	%i3
	addcc	%o7,	0x01E4,	%i5
	orncc	%l1,	0x17F1,	%g2
	alignaddr	%o6,	%g1,	%g3
	fnot2	%f26,	%f28
	and	%l2,	0x116F,	%g4
	edge32	%i6,	%o4,	%i4
	fmovde	%xcc,	%f28,	%f2
	fpack16	%f12,	%f1
	andcc	%i0,	0x1A83,	%i7
	fandnot2	%f8,	%f6,	%f14
	faligndata	%f2,	%f10,	%f0
	edge32n	%l6,	%g6,	%l0
	edge8ln	%o1,	%l3,	%o2
	mova	%icc,	%i1,	%o5
	fmovrdlz	%g7,	%f12,	%f10
	ldsb	[%l7 + 0x1C],	%o3
	edge16	%i2,	%l4,	%l5
	movn	%icc,	%g5,	%i3
	fmovdle	%xcc,	%f29,	%f29
	add	%o0,	0x1969,	%i5
	sra	%o7,	%g2,	%o6
	edge8ln	%g1,	%l1,	%l2
	std	%f26,	[%l7 + 0x48]
	sdivx	%g3,	0x07B1,	%g4
	sub	%o4,	%i4,	%i6
	lduw	[%l7 + 0x74],	%i7
	movpos	%xcc,	%i0,	%g6
	stx	%l0,	[%l7 + 0x50]
	sllx	%l6,	0x02,	%o1
	andn	%o2,	%i1,	%o5
	movrgz	%l3,	%o3,	%i2
	edge16n	%l4,	%g7,	%l5
	fnegd	%f16,	%f10
	umulcc	%g5,	%o0,	%i3
	fmovsge	%icc,	%f21,	%f14
	edge16l	%o7,	%g2,	%i5
	fmovrdlz	%o6,	%f20,	%f22
	fmovsne	%icc,	%f9,	%f30
	umul	%l1,	%g1,	%g3
	movvc	%xcc,	%g4,	%l2
	movne	%xcc,	%o4,	%i4
	ldsh	[%l7 + 0x68],	%i7
	sir	0x15C0
	fxor	%f28,	%f26,	%f20
	umul	%i0,	0x007D,	%g6
	movg	%icc,	%i6,	%l6
	sdivcc	%o1,	0x13F0,	%o2
	alignaddr	%i1,	%l0,	%o5
	movle	%xcc,	%o3,	%i2
	movn	%xcc,	%l4,	%l3
	edge16ln	%l5,	%g5,	%g7
	srlx	%i3,	%o0,	%g2
	subc	%o7,	0x0FFD,	%i5
	ldsb	[%l7 + 0x35],	%l1
	fmovdl	%xcc,	%f23,	%f16
	edge32n	%o6,	%g1,	%g4
	fcmpgt16	%f14,	%f6,	%g3
	fabss	%f29,	%f28
	umulcc	%o4,	0x06ED,	%i4
	fornot1	%f16,	%f20,	%f10
	lduw	[%l7 + 0x48],	%l2
	movrgz	%i7,	%g6,	%i0
	fmovrdgz	%l6,	%f2,	%f28
	bshuffle	%f10,	%f30,	%f30
	nop
	set	0x14, %g7
	lduw	[%l7 + %g7],	%i6
	fmovsle	%icc,	%f0,	%f14
	udivx	%o2,	0x174D,	%i1
	ldx	[%l7 + 0x10],	%l0
	stx	%o1,	[%l7 + 0x68]
	movrgz	%o3,	0x1B3,	%i2
	mulx	%o5,	%l3,	%l4
	xorcc	%g5,	%g7,	%l5
	alignaddr	%o0,	%i3,	%o7
	movl	%icc,	%g2,	%l1
	edge16	%o6,	%i5,	%g1
	xnorcc	%g4,	%o4,	%i4
	move	%icc,	%g3,	%i7
	movvs	%xcc,	%g6,	%l2
	andcc	%l6,	%i0,	%i6
	movg	%icc,	%i1,	%l0
	or	%o1,	0x0B32,	%o2
	andn	%i2,	%o3,	%o5
	sra	%l4,	%g5,	%l3
	mova	%xcc,	%g7,	%o0
	nop
	set	0x2C, %o1
	sth	%i3,	[%l7 + %o1]
	mulscc	%l5,	%g2,	%l1
	fmovsl	%icc,	%f22,	%f10
	move	%xcc,	%o6,	%i5
	sdivcc	%o7,	0x0CD3,	%g4
	movrgz	%g1,	%o4,	%g3
	subccc	%i4,	%i7,	%g6
	mova	%icc,	%l6,	%l2
	ldsh	[%l7 + 0x72],	%i6
	xnorcc	%i1,	0x1B47,	%i0
	and	%l0,	0x1F20,	%o1
	movrlez	%o2,	0x0EE,	%i2
	save %o3, %o5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x18, %g2
	ldsh	[%l7 + %g2],	%l3
	movle	%icc,	%l4,	%o0
	sir	0x0DA1
	xorcc	%i3,	0x1957,	%l5
	movvc	%xcc,	%g7,	%l1
	or	%g2,	0x1A98,	%o6
	ld	[%l7 + 0x30],	%f12
	fmovdg	%icc,	%f4,	%f28
	ldsw	[%l7 + 0x0C],	%o7
	andncc	%i5,	%g1,	%o4
	ldd	[%l7 + 0x50],	%f20
	fmovscc	%icc,	%f12,	%f29
	fpadd32s	%f28,	%f10,	%f26
	fmovspos	%xcc,	%f27,	%f17
	addc	%g4,	%i4,	%g3
	movrne	%i7,	%l6,	%l2
	movge	%xcc,	%g6,	%i1
	movneg	%icc,	%i0,	%i6
	edge32	%l0,	%o1,	%i2
	ldsw	[%l7 + 0x08],	%o3
	fnot1	%f8,	%f10
	fpsub16s	%f20,	%f27,	%f6
	fabsd	%f4,	%f18
	movvs	%xcc,	%o2,	%o5
	edge8	%l3,	%l4,	%g5
	ldsh	[%l7 + 0x0A],	%o0
	addc	%i3,	0x164E,	%g7
	edge16l	%l1,	%g2,	%l5
	mulscc	%o6,	%o7,	%i5
	edge16ln	%o4,	%g4,	%i4
	movcc	%xcc,	%g1,	%i7
	movrlz	%l6,	%g3,	%g6
	fmul8ulx16	%f26,	%f18,	%f16
	udivx	%l2,	0x123A,	%i0
	udivx	%i6,	0x0380,	%l0
	udivx	%i1,	0x013E,	%i2
	fnand	%f4,	%f24,	%f2
	orncc	%o3,	0x07B9,	%o1
	edge16	%o2,	%l3,	%l4
	add	%o5,	%g5,	%o0
	sethi	0x1ABE,	%g7
	movne	%icc,	%i3,	%l1
	srl	%l5,	%o6,	%o7
	ldub	[%l7 + 0x61],	%g2
	sll	%i5,	%g4,	%o4
	array16	%i4,	%i7,	%l6
	fnegd	%f26,	%f26
	sth	%g1,	[%l7 + 0x7A]
	ldsb	[%l7 + 0x62],	%g3
	ldub	[%l7 + 0x48],	%g6
	sdiv	%i0,	0x1867,	%l2
	save %i6, %l0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o3,	%o1,	%i2
	sll	%l3,	0x06,	%l4
	movne	%icc,	%o2,	%g5
	udivx	%o5,	0x01A2,	%o0
	subcc	%g7,	%l1,	%l5
	smul	%o6,	%o7,	%i3
	andncc	%g2,	%i5,	%g4
	fmovdgu	%icc,	%f9,	%f0
	ldsb	[%l7 + 0x7F],	%o4
	fornot2s	%f8,	%f14,	%f25
	movrgez	%i4,	0x0DD,	%i7
	fmovsne	%xcc,	%f13,	%f29
	movleu	%icc,	%l6,	%g1
	movvs	%xcc,	%g6,	%i0
	subccc	%l2,	%g3,	%i6
	alignaddrl	%l0,	%i1,	%o3
	stw	%i2,	[%l7 + 0x44]
	fabsd	%f16,	%f0
	faligndata	%f14,	%f10,	%f2
	andn	%l3,	%l4,	%o2
	stx	%o1,	[%l7 + 0x18]
	movge	%icc,	%g5,	%o0
	ldsh	[%l7 + 0x22],	%o5
	fpadd16s	%f9,	%f30,	%f7
	ldd	[%l7 + 0x18],	%f10
	addcc	%g7,	0x0B03,	%l5
	or	%l1,	0x0948,	%o7
	sir	0x09CE
	fmul8sux16	%f26,	%f6,	%f18
	edge16	%o6,	%i3,	%i5
	stb	%g4,	[%l7 + 0x4D]
	movpos	%icc,	%g2,	%i4
	edge16	%i7,	%l6,	%o4
	stw	%g6,	[%l7 + 0x10]
	movvs	%icc,	%g1,	%i0
	sth	%l2,	[%l7 + 0x10]
	stb	%g3,	[%l7 + 0x4F]
	movre	%l0,	0x266,	%i1
	fmovdpos	%xcc,	%f25,	%f12
	fpack32	%f26,	%f18,	%f2
	sll	%i6,	0x14,	%i2
	array8	%l3,	%o3,	%o2
	array16	%o1,	%g5,	%l4
	edge16	%o0,	%g7,	%l5
	sll	%o5,	0x18,	%l1
	xnor	%o7,	0x0496,	%i3
	movleu	%xcc,	%o6,	%i5
	subcc	%g2,	%g4,	%i4
	movle	%icc,	%i7,	%o4
	fands	%f0,	%f20,	%f10
	movle	%xcc,	%l6,	%g1
	save %i0, 0x0354, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g3,	0x02F3,	%g6
	edge8n	%l0,	%i6,	%i2
	movcs	%icc,	%l3,	%i1
	ldsh	[%l7 + 0x22],	%o2
	stx	%o1,	[%l7 + 0x38]
	sethi	0x02F7,	%g5
	andncc	%o3,	%l4,	%o0
	edge32n	%l5,	%o5,	%g7
	edge8l	%o7,	%i3,	%o6
	subcc	%l1,	0x148C,	%i5
	ldub	[%l7 + 0x76],	%g4
	fnot1s	%f16,	%f10
	sdivcc	%g2,	0x1F82,	%i4
	fornot1s	%f28,	%f20,	%f22
	sllx	%i7,	0x1F,	%l6
	fsrc2	%f22,	%f8
	edge32	%g1,	%o4,	%i0
	or	%l2,	0x19A8,	%g6
	lduh	[%l7 + 0x46],	%g3
	edge16l	%i6,	%i2,	%l0
	xor	%l3,	0x1E95,	%i1
	edge8ln	%o2,	%g5,	%o1
	fxnors	%f14,	%f12,	%f3
	ldub	[%l7 + 0x5C],	%o3
	umulcc	%l4,	%o0,	%l5
	std	%f20,	[%l7 + 0x20]
	orncc	%o5,	%g7,	%o7
	sllx	%o6,	%i3,	%i5
	movleu	%icc,	%l1,	%g4
	umulcc	%g2,	0x07DC,	%i4
	mova	%xcc,	%l6,	%g1
	move	%icc,	%o4,	%i7
	andncc	%i0,	%l2,	%g3
	umul	%g6,	0x1A55,	%i6
	addc	%i2,	%l0,	%l3
	mulscc	%o2,	%g5,	%i1
	edge32n	%o3,	%o1,	%l4
	fmovdn	%xcc,	%f21,	%f0
	add	%l5,	0x0430,	%o0
	ldd	[%l7 + 0x40],	%f30
	movrlez	%g7,	%o5,	%o7
	popc	%i3,	%i5
	fmovrdlez	%l1,	%f14,	%f6
	fcmpne32	%f0,	%f2,	%o6
	fmovrslz	%g2,	%f26,	%f9
	sra	%g4,	%i4,	%g1
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	fxors	%f4,	%f18,	%f5
	fzeros	%f8
	edge8n	%i7,	%l2,	%g3
	move	%xcc,	%i6,	%g6
	ldd	[%l7 + 0x50],	%f6
	edge16ln	%l0,	%l3,	%i2
	fmovsne	%xcc,	%f29,	%f0
	fmovsvs	%xcc,	%f7,	%f19
	fsrc2	%f6,	%f4
	movne	%icc,	%o2,	%i1
	movge	%icc,	%g5,	%o1
	fsrc2s	%f10,	%f1
	sethi	0x0CEB,	%l4
	nop
	set	0x70, %o6
	std	%f24,	[%l7 + %o6]
	fmuld8ulx16	%f21,	%f23,	%f22
	xnor	%o3,	%o0,	%g7
	sdiv	%o5,	0x016F,	%l5
	fmul8ulx16	%f14,	%f2,	%f2
	ldub	[%l7 + 0x26],	%i3
	fabsd	%f24,	%f0
	array32	%o7,	%i5,	%l1
	sra	%g2,	0x06,	%o6
	fcmpes	%fcc2,	%f29,	%f14
	ld	[%l7 + 0x44],	%f22
	movn	%xcc,	%g4,	%i4
	movrlz	%o4,	%g1,	%i0
	sir	0x0E7C
	sethi	0x1596,	%i7
	movrlez	%l2,	0x0CC,	%g3
	move	%xcc,	%l6,	%g6
	fxor	%f24,	%f20,	%f8
	movrlez	%i6,	0x3BA,	%l3
	subcc	%l0,	%o2,	%i2
	ldsw	[%l7 + 0x70],	%i1
	movrgez	%o1,	%g5,	%l4
	sub	%o0,	%o3,	%o5
	fmul8x16al	%f13,	%f12,	%f16
	restore %l5, %g7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i5,	%l1,	%o7
	sll	%o6,	0x00,	%g2
	sll	%i4,	%g4,	%g1
	fmovd	%f16,	%f16
	movrlz	%o4,	%i7,	%l2
	sth	%g3,	[%l7 + 0x60]
	fcmps	%fcc1,	%f10,	%f7
	fmovdvs	%icc,	%f0,	%f19
	nop
	set	0x26, %g4
	sth	%i0,	[%l7 + %g4]
	ldsw	[%l7 + 0x08],	%g6
	fmovd	%f22,	%f24
	sll	%l6,	0x12,	%l3
	fmovsvc	%icc,	%f30,	%f16
	edge16	%i6,	%o2,	%i2
	array16	%i1,	%o1,	%l0
	movn	%icc,	%g5,	%o0
	fmovrdgz	%l4,	%f4,	%f6
	movcc	%xcc,	%o3,	%o5
	array8	%g7,	%l5,	%i5
	edge16ln	%i3,	%o7,	%l1
	fpadd16s	%f10,	%f19,	%f19
	sdiv	%g2,	0x0634,	%o6
	lduw	[%l7 + 0x10],	%g4
	udivx	%g1,	0x13D8,	%i4
	save %o4, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g3,	0x18C7,	%i0
	sra	%l6,	%g6,	%i6
	xor	%o2,	0x146A,	%l3
	bshuffle	%f26,	%f10,	%f8
	mova	%icc,	%i2,	%i1
	movre	%l0,	0x27A,	%g5
	fmul8x16	%f30,	%f8,	%f0
	std	%f16,	[%l7 + 0x30]
	nop
	set	0x48, %l4
	stx	%o0,	[%l7 + %l4]
	orncc	%l4,	0x1914,	%o3
	nop
	set	0x76, %l6
	ldsh	[%l7 + %l6],	%o1
	mulscc	%o5,	0x0423,	%g7
	xorcc	%l5,	0x02B4,	%i5
	edge8n	%o7,	%l1,	%i3
	fmovrdne	%o6,	%f2,	%f14
	movle	%icc,	%g4,	%g1
	fmovrdgez	%i4,	%f8,	%f12
	movrlez	%o4,	0x027,	%l2
	ldx	[%l7 + 0x08],	%g2
	mova	%xcc,	%g3,	%i7
	edge8l	%l6,	%g6,	%i0
	movrne	%o2,	0x090,	%l3
	array16	%i2,	%i1,	%i6
	sethi	0x0F3F,	%g5
	umulcc	%o0,	%l0,	%l4
	xnor	%o1,	0x05A2,	%o5
	fsrc1s	%f17,	%f15
	andncc	%o3,	%g7,	%i5
	stw	%l5,	[%l7 + 0x64]
	xor	%l1,	%i3,	%o6
	umul	%o7,	%g1,	%i4
	fnors	%f23,	%f30,	%f5
	fpsub16	%f30,	%f22,	%f30
	edge32	%o4,	%g4,	%g2
	and	%l2,	0x0870,	%g3
	subcc	%l6,	%i7,	%g6
	fnot1s	%f6,	%f19
	fmovse	%icc,	%f1,	%f25
	fnot2s	%f17,	%f1
	ldsh	[%l7 + 0x5A],	%i0
	orn	%l3,	%i2,	%i1
	movle	%icc,	%i6,	%o2
	movg	%xcc,	%o0,	%l0
	edge8n	%l4,	%g5,	%o5
	movvc	%xcc,	%o3,	%o1
	edge32n	%g7,	%l5,	%i5
	fornot2s	%f19,	%f24,	%f13
	addccc	%l1,	0x160B,	%i3
	movpos	%xcc,	%o6,	%g1
	udiv	%o7,	0x08D5,	%i4
	alignaddrl	%g4,	%o4,	%l2
	ldx	[%l7 + 0x78],	%g3
	edge8ln	%g2,	%l6,	%i7
	edge16l	%g6,	%i0,	%i2
	mulscc	%i1,	0x00A9,	%i6
	mulx	%o2,	0x1944,	%o0
	fmuld8sux16	%f4,	%f16,	%f0
	fandnot1	%f20,	%f18,	%f2
	sub	%l3,	0x0208,	%l0
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%l4
	addcc	%o5,	0x155D,	%o3
	xnorcc	%o1,	0x1DCE,	%g5
	addccc	%g7,	0x1EF2,	%i5
	addc	%l5,	%l1,	%i3
	movrlz	%g1,	%o6,	%i4
	sra	%g4,	0x1F,	%o4
	edge32	%o7,	%l2,	%g3
	movvs	%xcc,	%g2,	%i7
	edge8ln	%l6,	%g6,	%i2
	movn	%xcc,	%i1,	%i0
	movrgz	%o2,	0x39E,	%i6
	xnorcc	%l3,	0x0EC6,	%o0
	stb	%l4,	[%l7 + 0x4F]
	ldsb	[%l7 + 0x2B],	%l0
	fcmpes	%fcc3,	%f0,	%f5
	fzeros	%f16
	save %o3, 0x1DDC, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g5,	%o5
	edge32l	%i5,	%g7,	%l5
	edge8l	%i3,	%l1,	%o6
	xor	%i4,	%g1,	%g4
	ldsw	[%l7 + 0x38],	%o4
	mova	%xcc,	%o7,	%l2
	orn	%g2,	0x163C,	%g3
	edge16l	%i7,	%l6,	%g6
	edge32l	%i2,	%i0,	%i1
	srax	%i6,	%o2,	%o0
	subccc	%l4,	%l0,	%l3
	movrne	%o3,	0x0E7,	%o1
	movrlez	%o5,	0x0E6,	%i5
	andn	%g7,	0x12ED,	%g5
	fmovsge	%xcc,	%f16,	%f17
	popc	0x0835,	%l5
	movvs	%xcc,	%l1,	%o6
	mulscc	%i4,	%i3,	%g1
	sth	%o4,	[%l7 + 0x20]
	edge32l	%o7,	%g4,	%g2
	stb	%l2,	[%l7 + 0x55]
	stb	%g3,	[%l7 + 0x4D]
	edge8ln	%l6,	%i7,	%g6
	mulx	%i2,	%i0,	%i1
	stw	%o2,	[%l7 + 0x70]
	andncc	%i6,	%l4,	%o0
	ldsh	[%l7 + 0x68],	%l3
	sdivcc	%l0,	0x1F0A,	%o3
	fmovsneg	%xcc,	%f7,	%f19
	xnor	%o5,	0x07B7,	%o1
	st	%f19,	[%l7 + 0x68]
	movrgz	%i5,	0x325,	%g7
	fmovsa	%xcc,	%f14,	%f14
	edge32	%l5,	%g5,	%l1
	edge8l	%o6,	%i4,	%i3
	fpackfix	%f22,	%f30
	movleu	%icc,	%g1,	%o4
	ldd	[%l7 + 0x58],	%f20
	sdivx	%g4,	0x1F03,	%g2
	mulscc	%l2,	%o7,	%g3
	add	%i7,	%l6,	%i2
	subccc	%g6,	0x04E3,	%i1
	ldsh	[%l7 + 0x20],	%o2
	ldsw	[%l7 + 0x5C],	%i6
	sdivcc	%i0,	0x0CC1,	%l4
	fcmped	%fcc3,	%f22,	%f22
	srlx	%o0,	0x12,	%l0
	fsrc2	%f20,	%f14
	ldx	[%l7 + 0x48],	%l3
	array32	%o3,	%o1,	%o5
	std	%f26,	[%l7 + 0x48]
	fxor	%f12,	%f14,	%f18
	alignaddr	%g7,	%l5,	%g5
	fornot2s	%f6,	%f5,	%f22
	fones	%f18
	mova	%xcc,	%i5,	%o6
	sll	%l1,	0x12,	%i3
	movcs	%xcc,	%g1,	%o4
	andn	%i4,	0x0168,	%g4
	udivcc	%g2,	0x1CF8,	%o7
	movcs	%icc,	%g3,	%i7
	sir	0x0370
	umul	%l2,	%i2,	%g6
	sdivx	%l6,	0x0430,	%o2
	stx	%i6,	[%l7 + 0x50]
	subcc	%i0,	%i1,	%l4
	movg	%xcc,	%l0,	%l3
	fcmpeq16	%f20,	%f28,	%o3
	fone	%f10
	stb	%o1,	[%l7 + 0x76]
	movneg	%xcc,	%o5,	%g7
	sir	0x1A7C
	srlx	%l5,	%o0,	%i5
	udiv	%o6,	0x191A,	%l1
	movcs	%xcc,	%g5,	%i3
	ld	[%l7 + 0x74],	%f19
	edge16n	%o4,	%g1,	%g4
	ld	[%l7 + 0x24],	%f21
	movn	%xcc,	%g2,	%i4
	ldub	[%l7 + 0x7F],	%o7
	smul	%g3,	0x139A,	%i7
	xnor	%l2,	0x1A77,	%g6
	subc	%i2,	%l6,	%o2
	sth	%i0,	[%l7 + 0x72]
	mova	%xcc,	%i6,	%l4
	fones	%f25
	fpadd16s	%f26,	%f5,	%f14
	andncc	%l0,	%i1,	%l3
	sll	%o1,	0x0F,	%o5
	xor	%g7,	0x06FE,	%l5
	addc	%o0,	%i5,	%o3
	edge32ln	%l1,	%o6,	%g5
	ld	[%l7 + 0x2C],	%f2
	movge	%xcc,	%o4,	%g1
	sll	%g4,	%i3,	%i4
	sdivcc	%g2,	0x0C2B,	%o7
	fmovsge	%xcc,	%f20,	%f2
	fmovrsgz	%i7,	%f12,	%f12
	movgu	%icc,	%l2,	%g6
	fornot2s	%f10,	%f30,	%f12
	fnot2s	%f10,	%f5
	edge16ln	%i2,	%l6,	%g3
	fcmpes	%fcc0,	%f9,	%f19
	fxors	%f20,	%f7,	%f10
	udiv	%o2,	0x1DB7,	%i6
	addcc	%i0,	%l4,	%l0
	lduh	[%l7 + 0x12],	%l3
	fpackfix	%f28,	%f1
	udivx	%o1,	0x0047,	%i1
	lduh	[%l7 + 0x6C],	%g7
	movg	%xcc,	%l5,	%o0
	sdiv	%i5,	0x1075,	%o5
	edge8n	%o3,	%o6,	%l1
	ldd	[%l7 + 0x18],	%f30
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	mulscc	%g4,	0x1AC3,	%i3
	fexpand	%f5,	%f10
	umul	%i4,	0x0B6F,	%o7
	addccc	%i7,	%g2,	%g6
	fmovrdlez	%l2,	%f22,	%f14
	fmovdvs	%xcc,	%f16,	%f22
	edge8l	%i2,	%g3,	%l6
	orncc	%i6,	0x106E,	%i0
	stw	%l4,	[%l7 + 0x30]
	movrne	%o2,	0x084,	%l0
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%l3
	movrlez	%o1,	%g7,	%l5
	sth	%o0,	[%l7 + 0x4A]
	movge	%xcc,	%i1,	%i5
	fcmpne32	%f24,	%f10,	%o5
	movneg	%xcc,	%o6,	%l1
	fandnot2	%f14,	%f4,	%f28
	sll	%o4,	%g5,	%g1
	fandnot2s	%f8,	%f18,	%f18
	sir	0x1042
	xnorcc	%o3,	0x00E9,	%i3
	mulx	%g4,	0x00C0,	%i4
	fmovse	%icc,	%f29,	%f23
	save %i7, 0x0639, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g6,	%l2
	fzeros	%f6
	lduw	[%l7 + 0x14],	%i2
	srax	%o7,	0x1B,	%g3
	edge32	%i6,	%i0,	%l4
	sir	0x0BAB
	orn	%o2,	%l0,	%l3
	movrlez	%o1,	0x02F,	%g7
	sdivcc	%l5,	0x0A90,	%o0
	movpos	%icc,	%l6,	%i5
	ld	[%l7 + 0x6C],	%f8
	andcc	%o5,	%o6,	%i1
	faligndata	%f30,	%f6,	%f16
	umulcc	%o4,	0x1254,	%g5
	mulx	%g1,	%o3,	%l1
	movn	%xcc,	%g4,	%i3
	nop
	set	0x23, %i2
	stb	%i4,	[%l7 + %i2]
	lduw	[%l7 + 0x24],	%g2
	edge16	%g6,	%i7,	%i2
	ld	[%l7 + 0x60],	%f22
	movrgez	%l2,	0x2C8,	%g3
	udivx	%i6,	0x0421,	%o7
	move	%icc,	%i0,	%l4
	edge16n	%o2,	%l3,	%o1
	umul	%g7,	%l5,	%l0
	edge32n	%o0,	%i5,	%o5
	movrne	%o6,	0x0C5,	%l6
	xor	%o4,	0x0987,	%i1
	ldub	[%l7 + 0x20],	%g1
	xorcc	%g5,	0x1A43,	%o3
	udivcc	%l1,	0x1943,	%i3
	alignaddr	%g4,	%g2,	%g6
	xnorcc	%i7,	%i4,	%l2
	and	%g3,	0x0B93,	%i6
	movpos	%xcc,	%o7,	%i0
	addccc	%i2,	0x1AFF,	%l4
	fmovsge	%xcc,	%f4,	%f0
	sdivcc	%o2,	0x0E81,	%l3
	edge16	%o1,	%g7,	%l5
	sra	%o0,	%i5,	%o5
	andn	%o6,	%l0,	%o4
	srl	%i1,	0x00,	%l6
	sdivcc	%g1,	0x0694,	%o3
	fandnot2	%f30,	%f8,	%f26
	mova	%icc,	%l1,	%g5
	fcmpgt16	%f8,	%f12,	%i3
	and	%g2,	%g6,	%i7
	fpsub32s	%f18,	%f28,	%f21
	edge32l	%g4,	%i4,	%l2
	subcc	%i6,	%o7,	%g3
	ldd	[%l7 + 0x10],	%i0
	movcs	%xcc,	%l4,	%o2
	movrgz	%i2,	%o1,	%l3
	fmovsvs	%icc,	%f24,	%f18
	edge16	%g7,	%l5,	%o0
	edge32	%o5,	%i5,	%l0
	movle	%xcc,	%o4,	%o6
	fxor	%f2,	%f30,	%f0
	mulx	%i1,	%l6,	%g1
	fornot1	%f24,	%f30,	%f10
	edge32l	%o3,	%g5,	%i3
	movrne	%l1,	0x068,	%g6
	smul	%g2,	%i7,	%g4
	ldsh	[%l7 + 0x08],	%l2
	movneg	%icc,	%i4,	%o7
	ldub	[%l7 + 0x7C],	%g3
	smulcc	%i0,	0x0F8E,	%l4
	edge32ln	%o2,	%i6,	%i2
	fmovdgu	%icc,	%f19,	%f14
	move	%icc,	%l3,	%o1
	srl	%g7,	%l5,	%o0
	ldsh	[%l7 + 0x32],	%o5
	movrlz	%i5,	%o4,	%o6
	movre	%i1,	0x1C2,	%l0
	ldub	[%l7 + 0x35],	%l6
	ldd	[%l7 + 0x30],	%g0
	udivcc	%g5,	0x0C8D,	%o3
	orn	%i3,	%g6,	%g2
	movrne	%l1,	%g4,	%i7
	fmovsl	%xcc,	%f11,	%f3
	array8	%i4,	%l2,	%g3
	fnot2	%f22,	%f2
	movleu	%icc,	%i0,	%l4
	movle	%icc,	%o2,	%i6
	alignaddr	%o7,	%l3,	%o1
	edge16n	%g7,	%i2,	%o0
	orn	%l5,	0x07F3,	%o5
	sdivcc	%o4,	0x1733,	%o6
	movl	%icc,	%i5,	%l0
	movrlz	%i1,	%l6,	%g1
	addc	%g5,	0x0DB2,	%i3
	xor	%o3,	%g2,	%g6
	movn	%xcc,	%l1,	%i7
	sdivcc	%g4,	0x1B01,	%l2
	edge16	%g3,	%i4,	%i0
	mova	%xcc,	%o2,	%i6
	movgu	%xcc,	%l4,	%o7
	edge16ln	%o1,	%l3,	%i2
	stb	%o0,	[%l7 + 0x51]
	addccc	%g7,	0x04E7,	%l5
	movcs	%icc,	%o5,	%o4
	ldd	[%l7 + 0x78],	%f26
	mulx	%o6,	%l0,	%i1
	fmovrdne	%i5,	%f14,	%f18
	movne	%xcc,	%l6,	%g5
	faligndata	%f16,	%f28,	%f18
	sdivx	%g1,	0x0CC6,	%o3
	movcs	%icc,	%i3,	%g6
	movvs	%icc,	%g2,	%i7
	move	%xcc,	%l1,	%g4
	movneg	%xcc,	%l2,	%g3
	lduh	[%l7 + 0x56],	%i4
	movvc	%icc,	%o2,	%i6
	addc	%i0,	0x1C22,	%l4
	fabss	%f20,	%f2
	mulx	%o1,	%l3,	%o7
	add	%i2,	%g7,	%o0
	fpadd32s	%f10,	%f3,	%f18
	srl	%o5,	0x03,	%l5
	movgu	%xcc,	%o4,	%o6
	mulscc	%l0,	%i5,	%l6
	srl	%i1,	%g1,	%o3
	umul	%i3,	0x0517,	%g6
	movn	%xcc,	%g2,	%i7
	mulx	%l1,	0x1EF7,	%g5
	alignaddrl	%l2,	%g4,	%g3
	udivx	%i4,	0x0307,	%o2
	sth	%i6,	[%l7 + 0x76]
	ldd	[%l7 + 0x20],	%f24
	movpos	%xcc,	%i0,	%l4
	fnot1s	%f30,	%f2
	fnor	%f18,	%f14,	%f16
	movn	%xcc,	%o1,	%l3
	movrlz	%o7,	0x196,	%g7
	addc	%i2,	%o5,	%o0
	lduh	[%l7 + 0x54],	%o4
	orn	%o6,	0x13E2,	%l5
	fmovdneg	%xcc,	%f29,	%f0
	ld	[%l7 + 0x38],	%f8
	alignaddr	%l0,	%i5,	%l6
	fornot1	%f10,	%f16,	%f0
	fcmpne16	%f20,	%f18,	%g1
	fcmpd	%fcc2,	%f18,	%f28
	nop
	set	0x4C, %l5
	stw	%o3,	[%l7 + %l5]
	xor	%i3,	%g6,	%g2
	udiv	%i1,	0x0630,	%l1
	fnot1s	%f0,	%f11
	movn	%xcc,	%g5,	%l2
	fmovspos	%icc,	%f13,	%f14
	or	%g4,	0x1F5C,	%g3
	fxnor	%f30,	%f26,	%f14
	fmovsg	%icc,	%f28,	%f5
	fand	%f26,	%f4,	%f8
	edge8ln	%i4,	%o2,	%i7
	movcs	%icc,	%i0,	%l4
	sdivcc	%o1,	0x0C4D,	%i6
	move	%xcc,	%l3,	%g7
	fmovdg	%icc,	%f18,	%f18
	fcmps	%fcc2,	%f21,	%f3
	fmovdn	%icc,	%f29,	%f29
	movre	%o7,	%i2,	%o5
	nop
	set	0x50, %o7
	stx	%o0,	[%l7 + %o7]
	movleu	%icc,	%o4,	%o6
	fpack32	%f16,	%f10,	%f14
	alignaddr	%l5,	%l0,	%i5
	movrne	%g1,	%o3,	%i3
	fnor	%f18,	%f8,	%f8
	edge16ln	%l6,	%g2,	%g6
	xorcc	%i1,	%l1,	%l2
	umulcc	%g4,	%g3,	%g5
	fmovsneg	%xcc,	%f1,	%f12
	xorcc	%i4,	%o2,	%i0
	orn	%l4,	%i7,	%i6
	edge16n	%o1,	%g7,	%o7
	std	%f8,	[%l7 + 0x30]
	movneg	%icc,	%i2,	%l3
	movre	%o0,	0x164,	%o5
	nop
	set	0x18, %i3
	ldsh	[%l7 + %i3],	%o4
	mova	%xcc,	%l5,	%o6
	edge32n	%l0,	%i5,	%o3
	smulcc	%g1,	0x02CD,	%l6
	edge8ln	%i3,	%g2,	%g6
	movvc	%xcc,	%l1,	%i1
	srl	%g4,	%l2,	%g5
	fmovrsgz	%g3,	%f14,	%f10
	orncc	%i4,	0x0683,	%o2
	sub	%i0,	%l4,	%i6
	xnorcc	%o1,	%g7,	%i7
	fand	%f18,	%f22,	%f6
	xorcc	%i2,	%l3,	%o0
	edge32n	%o7,	%o4,	%o5
	edge8n	%o6,	%l5,	%i5
	movle	%xcc,	%o3,	%g1
	fcmpgt16	%f2,	%f8,	%l0
	nop
	set	0x2C, %i5
	ldsw	[%l7 + %i5],	%l6
	mova	%icc,	%g2,	%g6
	edge32n	%i3,	%l1,	%i1
	movn	%icc,	%g4,	%g5
	movrgez	%l2,	%g3,	%i4
	fmovsl	%icc,	%f20,	%f20
	fmovsl	%icc,	%f12,	%f12
	movgu	%icc,	%o2,	%l4
	popc	%i6,	%o1
	udivx	%g7,	0x185A,	%i0
	movle	%icc,	%i2,	%l3
	sdiv	%i7,	0x17E4,	%o7
	lduh	[%l7 + 0x14],	%o4
	fnot1s	%f24,	%f15
	fcmpes	%fcc1,	%f14,	%f29
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%o0
	movleu	%xcc,	%o5,	%l5
	udiv	%i5,	0x19A0,	%o3
	sethi	0x1A95,	%o6
	srl	%g1,	0x0D,	%l6
	subc	%l0,	%g6,	%i3
	xnor	%g2,	0x072B,	%i1
	fsrc2s	%f11,	%f19
	popc	0x0CA9,	%l1
	fcmple32	%f28,	%f18,	%g4
	sth	%l2,	[%l7 + 0x64]
	fmul8x16al	%f24,	%f11,	%f28
	fsrc2	%f22,	%f6
	addc	%g5,	%i4,	%g3
	mulx	%o2,	%l4,	%i6
	fmovsge	%icc,	%f4,	%f31
	edge8ln	%g7,	%i0,	%i2
	orn	%l3,	%i7,	%o7
	movrgez	%o1,	0x23F,	%o4
	fmovdg	%xcc,	%f12,	%f22
	movneg	%icc,	%o5,	%o0
	ldsw	[%l7 + 0x60],	%l5
	edge8	%i5,	%o6,	%o3
	ldsb	[%l7 + 0x12],	%l6
	andn	%g1,	0x0298,	%g6
	xnorcc	%l0,	0x1610,	%g2
	fnors	%f29,	%f9,	%f13
	mova	%icc,	%i3,	%l1
	movpos	%xcc,	%g4,	%i1
	fone	%f12
	fsrc1s	%f23,	%f21
	ldsb	[%l7 + 0x11],	%g5
	andn	%i4,	%g3,	%l2
	st	%f8,	[%l7 + 0x5C]
	edge8l	%o2,	%i6,	%l4
	subccc	%g7,	0x1778,	%i0
	srax	%i2,	0x1E,	%i7
	movg	%icc,	%o7,	%o1
	fmovsleu	%icc,	%f8,	%f30
	fnegd	%f14,	%f22
	array16	%l3,	%o4,	%o5
	movrlz	%o0,	%i5,	%l5
	fmovrdgez	%o3,	%f14,	%f16
	andncc	%l6,	%o6,	%g6
	sth	%l0,	[%l7 + 0x58]
	fsrc2	%f10,	%f0
	array16	%g1,	%i3,	%l1
	movrgez	%g4,	0x09A,	%g2
	fexpand	%f24,	%f12
	sllx	%g5,	%i4,	%i1
	srl	%g3,	0x06,	%l2
	andcc	%i6,	0x196C,	%l4
	movre	%g7,	0x276,	%i0
	fmovrslez	%o2,	%f1,	%f29
	fexpand	%f14,	%f30
	udiv	%i2,	0x02D5,	%o7
	lduh	[%l7 + 0x56],	%i7
	fand	%f28,	%f16,	%f24
	ldsw	[%l7 + 0x3C],	%l3
	movne	%icc,	%o4,	%o5
	sethi	0x099F,	%o1
	fmovsvc	%icc,	%f27,	%f24
	ldsh	[%l7 + 0x68],	%o0
	fpack16	%f14,	%f14
	mulx	%l5,	0x1165,	%o3
	srax	%i5,	0x10,	%l6
	ldsw	[%l7 + 0x74],	%o6
	edge8n	%g6,	%g1,	%i3
	fnot1s	%f16,	%f24
	orn	%l1,	0x0778,	%g4
	movl	%icc,	%l0,	%g5
	movcs	%xcc,	%g2,	%i4
	sll	%g3,	0x1D,	%i1
	orcc	%l2,	0x1F61,	%l4
	edge16n	%g7,	%i0,	%i6
	fmovd	%f12,	%f8
	pdist	%f14,	%f14,	%f20
	movcs	%xcc,	%i2,	%o7
	st	%f31,	[%l7 + 0x14]
	ldsw	[%l7 + 0x4C],	%i7
	subcc	%l3,	%o4,	%o5
	fandnot2	%f2,	%f26,	%f16
	addcc	%o1,	0x0862,	%o0
	udiv	%o2,	0x05DA,	%o3
	array8	%i5,	%l6,	%o6
	srl	%g6,	%l5,	%i3
	fandnot2s	%f9,	%f15,	%f21
	xor	%g1,	0x1B91,	%g4
	or	%l0,	%l1,	%g5
	fmovrse	%g2,	%f19,	%f7
	fmovdne	%xcc,	%f30,	%f10
	ld	[%l7 + 0x54],	%f25
	srl	%g3,	%i4,	%i1
	edge32ln	%l4,	%l2,	%i0
	addccc	%g7,	%i2,	%o7
	movre	%i6,	%l3,	%i7
	move	%icc,	%o5,	%o4
	udivx	%o0,	0x0FF3,	%o1
	edge8	%o3,	%i5,	%l6
	fnot2s	%f26,	%f9
	srax	%o6,	0x06,	%g6
	and	%o2,	0x0733,	%i3
	ldsw	[%l7 + 0x40],	%l5
	sra	%g1,	%l0,	%l1
	fnand	%f16,	%f20,	%f22
	fmovdg	%icc,	%f26,	%f11
	fmovscs	%icc,	%f21,	%f26
	alignaddr	%g4,	%g2,	%g3
	edge8	%i4,	%g5,	%i1
	umulcc	%l4,	0x0206,	%i0
	addc	%l2,	%g7,	%o7
	xorcc	%i6,	0x16F8,	%i2
	edge8l	%i7,	%l3,	%o4
	movrne	%o0,	%o5,	%o3
	movn	%icc,	%o1,	%l6
	movl	%xcc,	%o6,	%g6
	srlx	%i5,	0x03,	%o2
	ldsb	[%l7 + 0x67],	%i3
	movge	%icc,	%l5,	%g1
	popc	0x09E6,	%l1
	fpsub32s	%f19,	%f17,	%f8
	movrlez	%g4,	0x21B,	%g2
	movgu	%icc,	%l0,	%g3
	movcs	%xcc,	%g5,	%i1
	nop
	set	0x50, %l3
	std	%f2,	[%l7 + %l3]
	mulscc	%i4,	0x1929,	%i0
	faligndata	%f2,	%f4,	%f18
	fpsub16	%f14,	%f24,	%f20
	std	%f14,	[%l7 + 0x30]
	fmovrse	%l2,	%f30,	%f27
	movvc	%icc,	%g7,	%l4
	ld	[%l7 + 0x14],	%f12
	fmuld8ulx16	%f14,	%f25,	%f20
	movle	%icc,	%i6,	%o7
	st	%f15,	[%l7 + 0x70]
	fmovsvs	%xcc,	%f9,	%f17
	edge16l	%i2,	%l3,	%o4
	movl	%xcc,	%i7,	%o5
	umulcc	%o3,	%o0,	%l6
	stw	%o6,	[%l7 + 0x0C]
	subccc	%o1,	%i5,	%g6
	mulscc	%i3,	%l5,	%g1
	smul	%o2,	%g4,	%l1
	sll	%g2,	0x1C,	%l0
	xorcc	%g5,	%g3,	%i4
	ldx	[%l7 + 0x08],	%i1
	edge8n	%i0,	%l2,	%l4
	fmul8x16au	%f1,	%f6,	%f6
	alignaddr	%i6,	%g7,	%i2
	st	%f10,	[%l7 + 0x44]
	movrlz	%o7,	0x145,	%o4
	ldsb	[%l7 + 0x12],	%i7
	srax	%o5,	%o3,	%o0
	edge16ln	%l3,	%l6,	%o6
	ld	[%l7 + 0x0C],	%f6
	movrgez	%o1,	%i5,	%i3
	add	%l5,	%g6,	%g1
	smulcc	%o2,	0x0A55,	%l1
	edge8l	%g2,	%l0,	%g4
	umulcc	%g5,	%i4,	%i1
	orcc	%g3,	%l2,	%i0
	alignaddrl	%l4,	%i6,	%g7
	ldub	[%l7 + 0x14],	%o7
	sra	%o4,	0x04,	%i7
	fmovsn	%icc,	%f27,	%f22
	fmul8x16al	%f26,	%f4,	%f18
	movge	%icc,	%o5,	%i2
	restore %o0, 0x124A, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %g6
	stx	%l6,	[%l7 + %g6]
	fnot1s	%f8,	%f26
	xnor	%l3,	0x01FC,	%o6
	ldsh	[%l7 + 0x18],	%o1
	srl	%i3,	%l5,	%g6
	edge32l	%g1,	%i5,	%o2
	andcc	%g2,	0x0D2E,	%l0
	st	%f23,	[%l7 + 0x78]
	umulcc	%g4,	%l1,	%g5
	fmovdleu	%xcc,	%f29,	%f22
	ldsb	[%l7 + 0x68],	%i4
	srax	%i1,	%g3,	%l2
	mulscc	%l4,	0x00EA,	%i6
	sth	%g7,	[%l7 + 0x3C]
	faligndata	%f30,	%f20,	%f24
	mova	%icc,	%i0,	%o7
	movg	%icc,	%o4,	%i7
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%i2
	fzeros	%f10
	edge8	%o0,	%o3,	%o5
	pdist	%f26,	%f16,	%f0
	sethi	0x138A,	%l6
	fcmps	%fcc1,	%f15,	%f22
	movn	%xcc,	%o6,	%o1
	xnor	%i3,	%l3,	%l5
	fcmpgt32	%f10,	%f4,	%g6
	add	%i5,	%g1,	%o2
	ldub	[%l7 + 0x17],	%l0
	movrlz	%g4,	%l1,	%g5
	fmovde	%xcc,	%f30,	%f12
	orn	%g2,	0x17FA,	%i4
	xnor	%g3,	%i1,	%l2
	array8	%i6,	%l4,	%i0
	movpos	%xcc,	%o7,	%o4
	fmovscc	%icc,	%f29,	%f29
	fmovde	%xcc,	%f24,	%f3
	sdivx	%i7,	0x04E9,	%g7
	sethi	0x1B83,	%o0
	mulx	%o3,	%o5,	%l6
	ldd	[%l7 + 0x28],	%f4
	alignaddrl	%o6,	%o1,	%i3
	fornot2s	%f7,	%f10,	%f7
	subccc	%l3,	%l5,	%i2
	movrgez	%i5,	%g6,	%o2
	sdivx	%g1,	0x0B4D,	%g4
	subcc	%l0,	%g5,	%g2
	fmuld8ulx16	%f18,	%f31,	%f12
	fmovrsgez	%l1,	%f29,	%f0
	fmovsleu	%xcc,	%f18,	%f27
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	sllx	%i1,	0x1A,	%i6
	fmovrdgz	%l4,	%f4,	%f30
	edge32l	%i0,	%o7,	%o4
	popc	0x18D9,	%g7
	movrlez	%i7,	0x255,	%o0
	edge32n	%o5,	%o3,	%l6
	andcc	%o1,	0x19AE,	%o6
	addccc	%i3,	%l5,	%l3
	umul	%i5,	%g6,	%o2
	edge32n	%i2,	%g4,	%g1
	udiv	%g5,	0x07CB,	%g2
	edge32	%l1,	%i4,	%l0
	restore %g3, 0x1D9A, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%i1
	movneg	%xcc,	%i6,	%i0
	std	%f10,	[%l7 + 0x18]
	save %o7, 0x1008, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x00D0,	%l4
	ld	[%l7 + 0x70],	%f10
	movn	%xcc,	%i7,	%g7
	fmovdpos	%icc,	%f30,	%f12
	mulx	%o5,	%o3,	%o0
	orcc	%o1,	%o6,	%l6
	sub	%i3,	0x1223,	%l5
	fmovrdlz	%l3,	%f8,	%f0
	alignaddr	%i5,	%o2,	%g6
	fmovrdlz	%i2,	%f26,	%f28
	movvs	%xcc,	%g4,	%g1
	alignaddrl	%g5,	%g2,	%i4
	edge16ln	%l0,	%l1,	%g3
	fmovdne	%icc,	%f23,	%f27
	edge8l	%i1,	%l2,	%i0
	ldsh	[%l7 + 0x6E],	%o7
	move	%icc,	%i6,	%l4
	subccc	%i7,	%g7,	%o4
	std	%f10,	[%l7 + 0x08]
	subccc	%o3,	0x0444,	%o5
	movpos	%xcc,	%o1,	%o6
	smulcc	%l6,	0x0949,	%i3
	movgu	%xcc,	%l5,	%l3
	popc	0x08BB,	%i5
	subc	%o2,	%g6,	%i2
	srl	%g4,	%o0,	%g1
	std	%f26,	[%l7 + 0x58]
	fpmerge	%f15,	%f27,	%f10
	umulcc	%g2,	0x138A,	%g5
	subc	%i4,	%l1,	%l0
	std	%f6,	[%l7 + 0x20]
	fcmpeq16	%f24,	%f26,	%g3
	movge	%xcc,	%l2,	%i1
	orncc	%i0,	%o7,	%i6
	stw	%i7,	[%l7 + 0x6C]
	ldd	[%l7 + 0x28],	%l4
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f24
	movrgz	%o4,	0x338,	%o3
	movne	%icc,	%g7,	%o1
	fzeros	%f15
	edge8l	%o6,	%o5,	%l6
	ldsw	[%l7 + 0x20],	%i3
	fabsd	%f4,	%f16
	movgu	%icc,	%l3,	%l5
	fmovdge	%icc,	%f25,	%f4
	array32	%o2,	%i5,	%i2
	fmovsge	%xcc,	%f13,	%f25
	lduw	[%l7 + 0x14],	%g6
	srax	%o0,	%g4,	%g2
	xnorcc	%g5,	%g1,	%i4
	movrgez	%l1,	%l0,	%l2
	movvs	%icc,	%i1,	%g3
	addcc	%i0,	0x04D5,	%i6
	alignaddrl	%i7,	%l4,	%o7
	fpadd32	%f12,	%f18,	%f20
	movrne	%o4,	%g7,	%o1
	srax	%o3,	0x08,	%o5
	movrlez	%o6,	%i3,	%l6
	edge32l	%l3,	%o2,	%l5
	movgu	%icc,	%i2,	%g6
	stw	%o0,	[%l7 + 0x4C]
	lduw	[%l7 + 0x70],	%g4
	orncc	%g2,	%g5,	%g1
	fmovdvc	%icc,	%f18,	%f2
	pdist	%f6,	%f16,	%f20
	ld	[%l7 + 0x14],	%f20
	fmuld8ulx16	%f23,	%f2,	%f2
	fmovdgu	%xcc,	%f29,	%f5
	lduw	[%l7 + 0x10],	%i4
	mova	%xcc,	%i5,	%l1
	nop
	set	0x10, %l0
	lduh	[%l7 + %l0],	%l0
	edge16l	%l2,	%i1,	%i0
	edge32ln	%i6,	%g3,	%l4
	fpadd32s	%f31,	%f11,	%f28
	smulcc	%o7,	0x148E,	%i7
	fmovsvc	%icc,	%f6,	%f31
	stx	%o4,	[%l7 + 0x30]
	std	%f2,	[%l7 + 0x50]
	movneg	%icc,	%g7,	%o3
	edge8	%o5,	%o6,	%i3
	movneg	%icc,	%o1,	%l3
	movle	%icc,	%o2,	%l5
	ldub	[%l7 + 0x5B],	%i2
	subc	%g6,	%o0,	%l6
	movg	%icc,	%g2,	%g5
	movcs	%xcc,	%g4,	%g1
	mova	%xcc,	%i5,	%i4
	nop
	set	0x68, %l1
	sth	%l0,	[%l7 + %l1]
	orncc	%l2,	0x095A,	%i1
	movne	%xcc,	%l1,	%i6
	array8	%g3,	%i0,	%o7
	edge16l	%l4,	%i7,	%g7
	add	%o3,	%o4,	%o6
	orncc	%o5,	0x1046,	%o1
	movne	%xcc,	%i3,	%l3
	fmovrsgz	%o2,	%f7,	%f25
	orn	%i2,	%g6,	%o0
	edge32	%l5,	%l6,	%g2
	srlx	%g4,	%g5,	%g1
	fmovscc	%xcc,	%f13,	%f19
	sdiv	%i5,	0x09A5,	%i4
	edge32l	%l2,	%i1,	%l1
	edge8n	%i6,	%l0,	%i0
	ldd	[%l7 + 0x30],	%f6
	fmovsvs	%xcc,	%f10,	%f22
	sth	%o7,	[%l7 + 0x30]
	edge32ln	%g3,	%i7,	%l4
	addccc	%o3,	%g7,	%o4
	edge16	%o6,	%o1,	%o5
	fnot2s	%f5,	%f9
	movre	%l3,	%i3,	%o2
	nop
	set	0x58, %i7
	stw	%i2,	[%l7 + %i7]
	edge32ln	%g6,	%o0,	%l6
	sdivx	%g2,	0x1468,	%l5
	edge32ln	%g5,	%g1,	%g4
	fmul8x16	%f23,	%f24,	%f20
	addc	%i5,	0x1267,	%l2
	array32	%i4,	%l1,	%i1
	edge8l	%i6,	%l0,	%o7
	mulscc	%g3,	0x0F67,	%i7
	sllx	%l4,	%o3,	%g7
	xnorcc	%i0,	%o4,	%o6
	movrgz	%o1,	0x3B9,	%l3
	fxors	%f21,	%f21,	%f8
	movvs	%icc,	%i3,	%o2
	fmovs	%f29,	%f8
	movrgz	%o5,	%i2,	%g6
	and	%l6,	%g2,	%o0
	edge8n	%l5,	%g1,	%g4
	movrlez	%i5,	%g5,	%l2
	xorcc	%i4,	0x1571,	%l1
	fnot2	%f28,	%f8
	popc	%i1,	%i6
	fnor	%f2,	%f4,	%f16
	lduh	[%l7 + 0x14],	%l0
	movle	%icc,	%o7,	%g3
	edge8	%i7,	%l4,	%o3
	siam	0x6
	array32	%i0,	%o4,	%o6
	alignaddr	%g7,	%o1,	%l3
	sllx	%o2,	0x09,	%i3
	smul	%i2,	0x077F,	%o5
	fnands	%f9,	%f17,	%f26
	faligndata	%f2,	%f30,	%f26
	movpos	%xcc,	%l6,	%g6
	orncc	%g2,	%l5,	%g1
	fpsub16s	%f22,	%f4,	%f1
	fmovrdgz	%g4,	%f12,	%f10
	or	%o0,	%i5,	%g5
	orn	%i4,	%l2,	%i1
	ldsb	[%l7 + 0x7C],	%l1
	array8	%i6,	%l0,	%g3
	alignaddrl	%i7,	%l4,	%o3
	umul	%o7,	0x0C14,	%o4
	movle	%icc,	%i0,	%g7
	and	%o6,	0x17E1,	%l3
	pdist	%f16,	%f22,	%f20
	movcs	%icc,	%o1,	%i3
	movcc	%icc,	%o2,	%i2
	st	%f4,	[%l7 + 0x4C]
	andcc	%o5,	%l6,	%g2
	and	%l5,	0x0EBD,	%g6
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	fcmpgt32	%f2,	%f6,	%g5
	smulcc	%i4,	0x0A4D,	%g4
	alignaddr	%l2,	%l1,	%i1
	addcc	%l0,	0x04DE,	%g3
	movrgz	%i7,	%i6,	%o3
	ldsh	[%l7 + 0x24],	%o7
	orn	%l4,	0x0C10,	%o4
	edge32l	%i0,	%g7,	%l3
	array8	%o6,	%i3,	%o2
	smul	%i2,	%o5,	%l6
	fpsub16	%f10,	%f26,	%f24
	udivcc	%o1,	0x0510,	%l5
	movrgz	%g2,	0x002,	%g1
	edge8	%o0,	%i5,	%g5
	fabss	%f3,	%f26
	movle	%icc,	%g6,	%i4
	lduh	[%l7 + 0x1E],	%g4
	orcc	%l1,	%l2,	%l0
	movleu	%xcc,	%g3,	%i7
	sra	%i6,	0x07,	%o3
	addcc	%i1,	0x016A,	%l4
	sub	%o7,	0x0F56,	%i0
	movpos	%icc,	%o4,	%g7
	orn	%l3,	0x16DF,	%o6
	orn	%o2,	0x0E2E,	%i3
	addcc	%o5,	%l6,	%o1
	fexpand	%f27,	%f20
	movg	%icc,	%l5,	%i2
	movg	%icc,	%g2,	%g1
	edge8	%i5,	%o0,	%g6
	movrlez	%g5,	0x2CF,	%g4
	mulscc	%i4,	0x1391,	%l1
	movne	%xcc,	%l0,	%l2
	fmovs	%f23,	%f12
	edge8l	%g3,	%i7,	%i6
	movrlz	%o3,	0x2D3,	%i1
	sub	%o7,	%i0,	%l4
	stb	%o4,	[%l7 + 0x2F]
	movrgez	%l3,	%g7,	%o6
	stw	%o2,	[%l7 + 0x6C]
	stb	%o5,	[%l7 + 0x73]
	movg	%icc,	%i3,	%o1
	lduw	[%l7 + 0x64],	%l6
	edge32	%l5,	%g2,	%g1
	edge16n	%i2,	%i5,	%g6
	orn	%o0,	0x01BE,	%g5
	subcc	%g4,	0x0B2F,	%l1
	array32	%i4,	%l2,	%l0
	movcs	%icc,	%i7,	%g3
	movpos	%icc,	%i6,	%o3
	sethi	0x13DF,	%i1
	addccc	%o7,	0x037E,	%l4
	edge32l	%o4,	%l3,	%g7
	xnor	%i0,	%o6,	%o2
	fmovdneg	%xcc,	%f18,	%f25
	edge8	%i3,	%o1,	%o5
	for	%f6,	%f14,	%f16
	fxnor	%f12,	%f16,	%f6
	stb	%l5,	[%l7 + 0x32]
	edge16l	%l6,	%g2,	%g1
	edge8l	%i5,	%g6,	%i2
	movleu	%xcc,	%o0,	%g5
	movn	%icc,	%g4,	%l1
	array8	%l2,	%l0,	%i7
	bshuffle	%f18,	%f24,	%f28
	fmovrslez	%g3,	%f25,	%f10
	bshuffle	%f2,	%f28,	%f12
	movvs	%xcc,	%i4,	%o3
	movre	%i1,	%o7,	%l4
	save %o4, %i6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g7,	%o6,	%i0
	edge32l	%i3,	%o2,	%o5
	edge16	%o1,	%l6,	%g2
	movl	%xcc,	%g1,	%i5
	xnorcc	%g6,	0x1790,	%i2
	ldsh	[%l7 + 0x40],	%l5
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%g4
	stw	%g4,	[%l7 + 0x54]
	xnorcc	%l1,	%l2,	%o0
	movgu	%xcc,	%l0,	%i7
	edge32	%g3,	%o3,	%i4
	movn	%xcc,	%i1,	%o7
	orcc	%o4,	%i6,	%l3
	movrne	%g7,	0x348,	%l4
	movge	%xcc,	%i0,	%i3
	ldsw	[%l7 + 0x0C],	%o6
	ldd	[%l7 + 0x30],	%o4
	udivcc	%o2,	0x0F02,	%o1
	ldub	[%l7 + 0x48],	%g2
	movrne	%l6,	0x03F,	%g1
	for	%f26,	%f16,	%f14
	umul	%i5,	%g6,	%l5
	fcmped	%fcc1,	%f10,	%f2
	and	%g5,	%i2,	%l1
	movneg	%icc,	%g4,	%l2
	fsrc2	%f22,	%f16
	array32	%o0,	%i7,	%l0
	ldd	[%l7 + 0x08],	%g2
	sllx	%i4,	0x19,	%o3
	movvs	%xcc,	%i1,	%o7
	fmovrslez	%o4,	%f18,	%f11
	orn	%l3,	%g7,	%i6
	edge8ln	%i0,	%i3,	%o6
	subccc	%l4,	%o2,	%o5
	ld	[%l7 + 0x4C],	%f21
	fmovsn	%icc,	%f10,	%f10
	lduh	[%l7 + 0x4C],	%g2
	fones	%f5
	mulx	%l6,	0x04DE,	%o1
	fmul8x16au	%f8,	%f9,	%f6
	array8	%g1,	%g6,	%i5
	udivcc	%l5,	0x10DD,	%g5
	udivx	%l1,	0x1B63,	%i2
	smul	%g4,	%o0,	%i7
	ldub	[%l7 + 0x24],	%l0
	udiv	%l2,	0x08AD,	%i4
	sdivcc	%g3,	0x16A1,	%i1
	movl	%icc,	%o7,	%o4
	smulcc	%l3,	0x1453,	%o3
	fmovspos	%xcc,	%f20,	%f23
	movg	%xcc,	%i6,	%i0
	and	%g7,	0x09D5,	%o6
	movcs	%xcc,	%l4,	%i3
	for	%f14,	%f22,	%f14
	fzeros	%f12
	udiv	%o2,	0x09A1,	%o5
	movrlez	%g2,	0x17D,	%o1
	orcc	%l6,	0x05D8,	%g6
	fnot2	%f4,	%f4
	movgu	%icc,	%g1,	%l5
	fmovdcs	%icc,	%f15,	%f10
	movrgz	%g5,	%l1,	%i5
	ldsh	[%l7 + 0x0C],	%g4
	udivcc	%i2,	0x1CC3,	%i7
	or	%o0,	%l2,	%i4
	add	%l0,	%i1,	%o7
	fnot1s	%f28,	%f31
	smul	%g3,	0x0E1F,	%o4
	ldsb	[%l7 + 0x12],	%l3
	andcc	%i6,	0x1949,	%o3
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%f26
	andcc	%i0,	0x0A25,	%o6
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%l4
	fand	%f18,	%f12,	%f22
	srlx	%g7,	0x1A,	%o2
	fmovsle	%icc,	%f1,	%f0
	edge8l	%o5,	%i3,	%g2
	edge32n	%l6,	%g6,	%g1
	fpadd16	%f14,	%f14,	%f10
	andncc	%l5,	%o1,	%l1
	edge16ln	%i5,	%g5,	%g4
	nop
	set	0x76, %l2
	ldsh	[%l7 + %l2],	%i2
	fmovrde	%i7,	%f26,	%f10
	popc	%l2,	%i4
	subc	%o0,	0x08A4,	%i1
	umul	%o7,	%g3,	%o4
	orcc	%l3,	%i6,	%o3
	fmul8x16au	%f19,	%f23,	%f14
	movvs	%icc,	%i0,	%o6
	edge32l	%l4,	%l0,	%o2
	movrne	%o5,	0x136,	%i3
	andcc	%g7,	%l6,	%g2
	fmovsge	%xcc,	%f8,	%f22
	sir	0x10A3
	ldsh	[%l7 + 0x72],	%g1
	array16	%l5,	%o1,	%l1
	restore %g6, 0x06B5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i5,	%g4,	%i7
	alignaddrl	%l2,	%i2,	%i4
	sth	%i1,	[%l7 + 0x68]
	fabsd	%f8,	%f30
	stb	%o0,	[%l7 + 0x6A]
	mulx	%g3,	0x019B,	%o4
	fandnot1	%f10,	%f30,	%f30
	xorcc	%o7,	0x1FA8,	%l3
	fmovdle	%icc,	%f9,	%f21
	ldd	[%l7 + 0x60],	%i6
	edge16	%i0,	%o6,	%o3
	addc	%l0,	0x0FAB,	%l4
	fnor	%f12,	%f14,	%f30
	sra	%o2,	%i3,	%g7
	ldd	[%l7 + 0x50],	%i6
	umul	%g2,	0x0042,	%g1
	smul	%l5,	%o1,	%l1
	xnorcc	%g6,	%o5,	%i5
	edge8ln	%g4,	%g5,	%l2
	lduh	[%l7 + 0x2E],	%i2
	ldub	[%l7 + 0x77],	%i4
	fpadd16	%f18,	%f2,	%f28
	addccc	%i1,	%i7,	%g3
	movne	%icc,	%o4,	%o0
	sdivcc	%l3,	0x1610,	%o7
	movrgz	%i6,	0x279,	%o6
	movle	%icc,	%o3,	%i0
	lduw	[%l7 + 0x78],	%l0
	fmul8x16al	%f17,	%f5,	%f18
	subc	%o2,	0x01DB,	%l4
	edge8ln	%i3,	%g7,	%g2
	add	%l6,	0x0CEB,	%l5
	lduh	[%l7 + 0x42],	%g1
	ldub	[%l7 + 0x52],	%l1
	mulscc	%g6,	0x0743,	%o5
	ldsb	[%l7 + 0x48],	%o1
	fone	%f20
	xorcc	%i5,	0x08E7,	%g4
	movcc	%xcc,	%l2,	%i2
	edge16	%i4,	%g5,	%i7
	movcc	%xcc,	%g3,	%i1
	srl	%o4,	%o0,	%l3
	ldub	[%l7 + 0x19],	%o7
	fsrc1	%f20,	%f12
	sdiv	%i6,	0x1179,	%o6
	xorcc	%o3,	0x068C,	%i0
	subcc	%o2,	0x118A,	%l0
	addcc	%i3,	%g7,	%l4
	udivcc	%g2,	0x0299,	%l6
	orn	%l5,	0x183D,	%g1
	edge16ln	%g6,	%l1,	%o1
	srlx	%i5,	%o5,	%g4
	fmuld8sux16	%f23,	%f31,	%f16
	sllx	%i2,	%i4,	%g5
	st	%f10,	[%l7 + 0x74]
	fmovrdne	%i7,	%f8,	%f6
	edge32	%g3,	%l2,	%i1
	addcc	%o0,	0x1CC2,	%l3
	st	%f14,	[%l7 + 0x58]
	move	%xcc,	%o7,	%o4
	orncc	%i6,	0x0C4C,	%o3
	array16	%i0,	%o6,	%o2
	edge16	%l0,	%g7,	%i3
	edge16ln	%g2,	%l4,	%l5
	alignaddrl	%g1,	%l6,	%g6
	std	%f2,	[%l7 + 0x48]
	add	%o1,	%l1,	%i5
	srlx	%g4,	%o5,	%i2
	sdiv	%g5,	0x1688,	%i4
	move	%xcc,	%i7,	%g3
	movgu	%xcc,	%l2,	%i1
	orncc	%o0,	0x1471,	%l3
	edge16n	%o7,	%i6,	%o3
	fmovde	%icc,	%f23,	%f22
	fornot1	%f24,	%f10,	%f10
	movleu	%xcc,	%o4,	%o6
	ldsh	[%l7 + 0x7A],	%o2
	edge16l	%l0,	%i0,	%g7
	movrgez	%g2,	%l4,	%l5
	movcc	%xcc,	%g1,	%l6
	lduh	[%l7 + 0x1C],	%g6
	edge16	%o1,	%l1,	%i5
	sdiv	%i3,	0x1A4F,	%o5
	nop
	set	0x60, %i4
	stb	%g4,	[%l7 + %i4]
	lduw	[%l7 + 0x64],	%i2
	xorcc	%g5,	0x1CE0,	%i7
	lduh	[%l7 + 0x3C],	%i4
	sdivx	%l2,	0x1BED,	%i1
	movge	%xcc,	%o0,	%l3
	movrlz	%g3,	%o7,	%i6
	orncc	%o4,	0x18B2,	%o6
	alignaddr	%o3,	%o2,	%i0
	subccc	%g7,	%l0,	%g2
	fzeros	%f14
	srax	%l4,	0x15,	%g1
	sra	%l5,	0x08,	%l6
	srlx	%g6,	%l1,	%i5
	ldd	[%l7 + 0x08],	%f26
	array16	%o1,	%i3,	%o5
	ldd	[%l7 + 0x38],	%i2
	stx	%g5,	[%l7 + 0x20]
	save %i7, %g4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i1,	0x1720,	%l2
	movne	%icc,	%o0,	%l3
	udivcc	%o7,	0x12E4,	%i6
	movvs	%icc,	%o4,	%o6
	xnor	%g3,	0x0B01,	%o2
	edge32	%o3,	%i0,	%g7
	movle	%icc,	%l0,	%g2
	ldsh	[%l7 + 0x70],	%l4
	fmovrslz	%g1,	%f20,	%f20
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%l6
	and	%g6,	%l5,	%i5
	xnor	%o1,	%i3,	%l1
	fmovdleu	%xcc,	%f4,	%f11
	movrgz	%i2,	0x097,	%o5
	fmovda	%icc,	%f25,	%f23
	edge32	%g5,	%i7,	%g4
	fcmpeq32	%f18,	%f24,	%i1
	ldd	[%l7 + 0x50],	%f14
	ldub	[%l7 + 0x28],	%i4
	ldsb	[%l7 + 0x2D],	%o0
	save %l2, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l3,	%o6,	%o4
	fsrc1s	%f12,	%f0
	addc	%g3,	0x148A,	%o3
	fnot1	%f6,	%f4
	fexpand	%f15,	%f8
	edge8l	%i0,	%g7,	%o2
	stx	%g2,	[%l7 + 0x18]
	alignaddr	%l4,	%g1,	%l0
	fxor	%f2,	%f20,	%f10
	fmovrdlez	%l6,	%f18,	%f4
	fpadd16s	%f5,	%f5,	%f15
	fcmpd	%fcc1,	%f22,	%f0
	for	%f18,	%f24,	%f12
	sub	%l5,	0x1277,	%g6
	array8	%o1,	%i3,	%l1
	edge8	%i5,	%o5,	%g5
	movl	%icc,	%i7,	%i2
	array8	%g4,	%i4,	%i1
	mulx	%o0,	%l2,	%i6
	fpackfix	%f28,	%f26
	fmovscs	%icc,	%f23,	%f30
	fandnot2	%f8,	%f10,	%f18
	alignaddrl	%o7,	%o6,	%o4
	std	%f20,	[%l7 + 0x50]
	fmovsneg	%xcc,	%f14,	%f18
	edge32l	%l3,	%g3,	%i0
	andcc	%g7,	0x085F,	%o2
	udivcc	%g2,	0x0D0E,	%l4
	edge8	%o3,	%g1,	%l0
	fornot1s	%f21,	%f22,	%f21
	ld	[%l7 + 0x3C],	%f22
	ldx	[%l7 + 0x10],	%l5
	sdiv	%l6,	0x0F8A,	%g6
	sdivcc	%i3,	0x0789,	%o1
	ld	[%l7 + 0x38],	%f26
	movrlez	%l1,	%i5,	%g5
	ldx	[%l7 + 0x08],	%o5
	fcmpeq16	%f20,	%f10,	%i7
	edge16n	%g4,	%i4,	%i1
	ldd	[%l7 + 0x50],	%f24
	sth	%i2,	[%l7 + 0x6E]
	edge8	%o0,	%i6,	%o7
	fcmpeq32	%f2,	%f8,	%l2
	alignaddr	%o6,	%l3,	%g3
	fmovrsne	%i0,	%f14,	%f3
	fmovscc	%icc,	%f26,	%f5
	movrgez	%o4,	0x1EE,	%o2
	orcc	%g7,	%g2,	%o3
	array32	%l4,	%g1,	%l0
	movl	%xcc,	%l6,	%l5
	xnor	%i3,	0x0307,	%g6
	movl	%icc,	%o1,	%i5
	movrgz	%l1,	%o5,	%g5
	array32	%i7,	%g4,	%i4
	edge16l	%i1,	%o0,	%i2
	udivx	%o7,	0x0886,	%i6
	movl	%xcc,	%o6,	%l3
	fmul8x16au	%f9,	%f4,	%f10
	movne	%xcc,	%l2,	%i0
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	sir	0x0B75
	fmovrse	%g7,	%f31,	%f21
	andcc	%g2,	%o3,	%o2
	movn	%icc,	%g1,	%l0
	edge16n	%l6,	%l4,	%i3
	edge8ln	%g6,	%o1,	%i5
	sdivcc	%l5,	0x00AB,	%o5
	edge16ln	%l1,	%g5,	%g4
	fmovsn	%icc,	%f11,	%f7
	siam	0x6
	movneg	%xcc,	%i7,	%i1
	srax	%o0,	0x05,	%i4
	movne	%icc,	%i2,	%o7
	ld	[%l7 + 0x44],	%f22
	movcc	%icc,	%i6,	%o6
	edge32ln	%l3,	%i0,	%l2
	fnor	%f6,	%f18,	%f18
	movl	%icc,	%g3,	%o4
	edge8	%g7,	%g2,	%o3
	movge	%xcc,	%o2,	%l0
	restore %l6, 0x13EB, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i3,	0x18C1,	%l4
	udivcc	%o1,	0x0DB9,	%g6
	fmovdvc	%icc,	%f24,	%f28
	movvc	%icc,	%l5,	%i5
	ldub	[%l7 + 0x6B],	%o5
	xorcc	%g5,	0x1D9E,	%g4
	movvc	%icc,	%l1,	%i7
	or	%i1,	%i4,	%o0
	umulcc	%i2,	0x048E,	%i6
	umulcc	%o7,	0x181C,	%o6
	movle	%icc,	%l3,	%l2
	std	%f0,	[%l7 + 0x08]
	edge16l	%g3,	%o4,	%g7
	fmovdneg	%xcc,	%f2,	%f1
	movl	%xcc,	%i0,	%g2
	andcc	%o2,	%l0,	%l6
	edge32l	%o3,	%g1,	%l4
	popc	0x05A1,	%i3
	edge8ln	%g6,	%o1,	%i5
	edge16	%o5,	%g5,	%l5
	lduw	[%l7 + 0x24],	%g4
	stx	%i7,	[%l7 + 0x08]
	andn	%l1,	%i1,	%o0
	smul	%i2,	0x0CD8,	%i4
	sth	%o7,	[%l7 + 0x52]
	ldx	[%l7 + 0x08],	%i6
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%l3
	subccc	%o6,	%l2,	%o4
	ldx	[%l7 + 0x48],	%g7
	edge8	%g3,	%g2,	%i0
	edge8ln	%o2,	%l6,	%l0
	sir	0x0924
	stw	%o3,	[%l7 + 0x74]
	fpmerge	%f12,	%f17,	%f0
	umulcc	%g1,	0x11A3,	%l4
	array16	%g6,	%o1,	%i5
	orn	%o5,	%i3,	%l5
	add	%g4,	0x0CC8,	%i7
	fzero	%f4
	addcc	%l1,	0x0DA5,	%g5
	fmovrdne	%o0,	%f18,	%f10
	movrlz	%i1,	%i4,	%i2
	ldsw	[%l7 + 0x5C],	%o7
	movvs	%icc,	%l3,	%i6
	xnor	%o6,	%l2,	%g7
	srlx	%o4,	0x08,	%g3
	movne	%icc,	%i0,	%g2
	movne	%xcc,	%l6,	%o2
	srlx	%l0,	0x04,	%o3
	udivcc	%g1,	0x1B3C,	%g6
	andn	%o1,	0x045E,	%i5
	umulcc	%l4,	%o5,	%i3
	movrne	%g4,	%i7,	%l5
	movne	%icc,	%l1,	%g5
	or	%i1,	%o0,	%i4
	movge	%xcc,	%i2,	%o7
	std	%f30,	[%l7 + 0x60]
	edge16n	%i6,	%l3,	%o6
	mulx	%g7,	%l2,	%o4
	save %i0, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%o2,	%f24,	%f14
	andcc	%l0,	0x03A5,	%o3
	movne	%icc,	%g2,	%g1
	edge8l	%o1,	%g6,	%l4
	subccc	%i5,	0x138C,	%i3
	fmovsne	%xcc,	%f21,	%f15
	ldub	[%l7 + 0x4E],	%g4
	edge32n	%o5,	%i7,	%l5
	sll	%g5,	0x00,	%i1
	ld	[%l7 + 0x18],	%f3
	fpack32	%f8,	%f28,	%f18
	fpack32	%f10,	%f14,	%f0
	movg	%xcc,	%l1,	%i4
	fmovdvs	%icc,	%f28,	%f28
	mulscc	%o0,	%i2,	%i6
	movcc	%icc,	%o7,	%o6
	movn	%xcc,	%l3,	%g7
	fpadd32s	%f14,	%f21,	%f20
	st	%f18,	[%l7 + 0x40]
	alignaddrl	%l2,	%o4,	%i0
	orn	%l6,	0x13F6,	%g3
	ldub	[%l7 + 0x0E],	%l0
	movle	%xcc,	%o2,	%o3
	fmovsleu	%xcc,	%f11,	%f29
	andn	%g1,	%o1,	%g2
	orn	%g6,	%l4,	%i3
	orn	%g4,	%o5,	%i7
	stx	%l5,	[%l7 + 0x70]
	sll	%i5,	%i1,	%l1
	movge	%icc,	%g5,	%o0
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	andcc	%o6,	0x0A7F,	%l3
	array8	%o7,	%g7,	%l2
	xorcc	%i0,	%o4,	%l6
	alignaddrl	%g3,	%o2,	%l0
	fmovdcs	%icc,	%f15,	%f18
	movl	%icc,	%g1,	%o1
	subcc	%o3,	0x03AC,	%g6
	movrne	%g2,	0x359,	%l4
	orcc	%i3,	%o5,	%i7
	sra	%l5,	0x16,	%i5
	udivcc	%g4,	0x0E98,	%i1
	edge32l	%g5,	%l1,	%o0
	fsrc1s	%f4,	%f0
	edge8ln	%i2,	%i4,	%o6
	ldd	[%l7 + 0x28],	%f0
	fones	%f7
	movcc	%icc,	%l3,	%i6
	array32	%g7,	%l2,	%i0
	edge16n	%o7,	%l6,	%o4
	fandnot1	%f10,	%f16,	%f20
	fcmpne32	%f14,	%f10,	%g3
	mulscc	%o2,	%l0,	%g1
	subc	%o3,	%o1,	%g6
	sra	%g2,	%i3,	%l4
	fnot2s	%f4,	%f11
	sub	%i7,	%l5,	%o5
	array32	%g4,	%i1,	%g5
	st	%f24,	[%l7 + 0x2C]
	edge16	%i5,	%l1,	%i2
	subcc	%i4,	0x10DB,	%o0
	movge	%xcc,	%l3,	%i6
	fcmpgt32	%f30,	%f20,	%g7
	fmovdcc	%xcc,	%f13,	%f2
	edge8n	%o6,	%i0,	%l2
	fmovrdlz	%l6,	%f26,	%f24
	srax	%o7,	0x0F,	%o4
	nop
	set	0x2E, %o1
	sth	%o2,	[%l7 + %o1]
	movvc	%icc,	%g3,	%l0
	array32	%o3,	%o1,	%g1
	mova	%icc,	%g6,	%g2
	ldd	[%l7 + 0x28],	%l4
	addccc	%i3,	%i7,	%o5
	xorcc	%g4,	0x11E6,	%l5
	fnors	%f1,	%f14,	%f17
	edge32n	%i1,	%i5,	%g5
	sir	0x0C31
	fsrc1s	%f20,	%f5
	ld	[%l7 + 0x0C],	%f4
	array16	%i2,	%l1,	%o0
	ldub	[%l7 + 0x63],	%l3
	movge	%xcc,	%i6,	%g7
	addccc	%o6,	0x0FA9,	%i0
	movpos	%icc,	%i4,	%l2
	xor	%o7,	0x003E,	%o4
	lduw	[%l7 + 0x50],	%l6
	andcc	%o2,	0x1C10,	%l0
	array16	%g3,	%o1,	%g1
	fnot1	%f18,	%f24
	fpadd16	%f16,	%f28,	%f26
	umul	%o3,	%g6,	%g2
	fpsub16s	%f29,	%f27,	%f2
	pdist	%f18,	%f30,	%f20
	fmovdcs	%icc,	%f13,	%f3
	nop
	set	0x34, %g2
	lduh	[%l7 + %g2],	%i3
	movne	%xcc,	%l4,	%o5
	movrgez	%g4,	%l5,	%i1
	edge32	%i5,	%i7,	%i2
	ldub	[%l7 + 0x72],	%g5
	edge8ln	%o0,	%l1,	%l3
	fmul8sux16	%f18,	%f0,	%f10
	movle	%icc,	%g7,	%i6
	subcc	%o6,	0x1259,	%i0
	subccc	%l2,	%o7,	%i4
	fpsub16s	%f19,	%f27,	%f31
	movvs	%icc,	%l6,	%o4
	edge16ln	%l0,	%o2,	%g3
	edge32ln	%o1,	%g1,	%o3
	ld	[%l7 + 0x50],	%f24
	xnor	%g2,	%i3,	%g6
	movne	%xcc,	%o5,	%g4
	fcmpgt32	%f24,	%f24,	%l4
	movge	%xcc,	%i1,	%l5
	fmovscc	%xcc,	%f12,	%f28
	array8	%i7,	%i5,	%i2
	sdiv	%g5,	0x06E2,	%l1
	fexpand	%f26,	%f22
	fpmerge	%f15,	%f25,	%f20
	fmovdne	%icc,	%f22,	%f24
	umulcc	%o0,	0x01ED,	%g7
	fnegs	%f4,	%f0
	fmovsne	%xcc,	%f23,	%f17
	edge8n	%l3,	%o6,	%i0
	fmovdvc	%xcc,	%f7,	%f11
	sth	%l2,	[%l7 + 0x64]
	sub	%i6,	0x03F9,	%o7
	orncc	%l6,	%i4,	%o4
	lduh	[%l7 + 0x16],	%l0
	movl	%xcc,	%o2,	%o1
	udiv	%g3,	0x11BF,	%o3
	save %g1, 0x1225, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i3,	0x1FDD,	%g6
	udivcc	%o5,	0x13E6,	%g4
	fcmple32	%f0,	%f14,	%i1
	movgu	%icc,	%l5,	%l4
	sllx	%i7,	0x18,	%i2
	movrgz	%g5,	0x368,	%i5
	array8	%o0,	%l1,	%l3
	subcc	%g7,	0x103D,	%i0
	edge32	%l2,	%i6,	%o7
	fmovrsgz	%l6,	%f14,	%f6
	and	%o6,	%o4,	%i4
	stb	%o2,	[%l7 + 0x54]
	fnot2s	%f12,	%f19
	movl	%icc,	%o1,	%g3
	sub	%l0,	0x08D8,	%o3
	fandnot1s	%f23,	%f0,	%f5
	addc	%g1,	%g2,	%g6
	sethi	0x0643,	%o5
	movrgez	%i3,	0x0E4,	%i1
	sth	%g4,	[%l7 + 0x58]
	fmul8x16al	%f6,	%f15,	%f10
	mulx	%l5,	%i7,	%l4
	std	%f10,	[%l7 + 0x28]
	andn	%i2,	0x1DF8,	%i5
	fmul8x16	%f1,	%f28,	%f22
	xnor	%g5,	%o0,	%l3
	fmovrse	%l1,	%f22,	%f31
	fpsub32	%f30,	%f2,	%f0
	fsrc2	%f10,	%f22
	movneg	%icc,	%g7,	%i0
	movrgez	%i6,	%o7,	%l2
	fpsub32	%f26,	%f24,	%f26
	or	%l6,	0x018E,	%o4
	movne	%xcc,	%o6,	%o2
	mulscc	%i4,	0x1905,	%o1
	fmovsvc	%icc,	%f26,	%f4
	fmovs	%f2,	%f10
	save %g3, 0x10F3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l0,	%g2,	%g1
	sub	%g6,	%o5,	%i1
	fnegd	%f0,	%f0
	andncc	%g4,	%l5,	%i7
	movl	%xcc,	%i3,	%i2
	fmovsle	%xcc,	%f20,	%f27
	sub	%l4,	%i5,	%o0
	ldd	[%l7 + 0x60],	%f12
	fone	%f22
	ldub	[%l7 + 0x72],	%g5
	ldsb	[%l7 + 0x0D],	%l1
	mulx	%l3,	0x036B,	%i0
	movvs	%icc,	%g7,	%i6
	udivx	%l2,	0x154A,	%l6
	ldsb	[%l7 + 0x75],	%o7
	and	%o6,	0x1627,	%o2
	fmovsvs	%xcc,	%f24,	%f25
	xorcc	%i4,	0x0426,	%o4
	edge32l	%g3,	%o3,	%o1
	movgu	%icc,	%g2,	%l0
	and	%g6,	0x188F,	%o5
	movle	%xcc,	%g1,	%g4
	fmovrsgz	%l5,	%f14,	%f13
	movrlz	%i1,	%i7,	%i3
	for	%f30,	%f12,	%f6
	sub	%i2,	0x13AF,	%l4
	sth	%i5,	[%l7 + 0x44]
	restore %o0, %g5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l3,	0x011F,	%g7
	sdiv	%i6,	0x0665,	%l2
	ldx	[%l7 + 0x68],	%i0
	fmuld8sux16	%f28,	%f19,	%f12
	edge32ln	%l6,	%o7,	%o2
	sllx	%i4,	0x18,	%o4
	srl	%o6,	%g3,	%o3
	subcc	%o1,	%g2,	%l0
	fone	%f12
	movvs	%icc,	%o5,	%g1
	movn	%xcc,	%g6,	%g4
	addcc	%l5,	%i1,	%i7
	movpos	%icc,	%i2,	%i3
	movrlz	%l4,	0x0E2,	%o0
	srl	%i5,	0x1D,	%g5
	udivcc	%l1,	0x12BC,	%g7
	umulcc	%l3,	0x1AAF,	%l2
	stb	%i0,	[%l7 + 0x3F]
	andcc	%l6,	%i6,	%o7
	movle	%xcc,	%o2,	%i4
	and	%o6,	0x1416,	%g3
	fmovrdlz	%o3,	%f16,	%f24
	movge	%icc,	%o1,	%g2
	movcc	%icc,	%o4,	%o5
	subc	%g1,	%l0,	%g6
	stb	%l5,	[%l7 + 0x7D]
	fpack16	%f26,	%f0
	fmovsl	%xcc,	%f0,	%f8
	fandnot1	%f28,	%f30,	%f2
	edge8n	%i1,	%i7,	%i2
	fmovdleu	%icc,	%f10,	%f18
	sth	%g4,	[%l7 + 0x72]
	edge32ln	%i3,	%l4,	%o0
	movre	%g5,	%i5,	%l1
	edge16n	%g7,	%l3,	%l2
	mulscc	%l6,	%i6,	%i0
	fnot2	%f8,	%f18
	movpos	%xcc,	%o2,	%o7
	fmovrdgez	%o6,	%f16,	%f8
	lduh	[%l7 + 0x7E],	%i4
	movleu	%icc,	%g3,	%o3
	fcmpes	%fcc1,	%f23,	%f6
	fexpand	%f8,	%f10
	movleu	%xcc,	%o1,	%g2
	movgu	%xcc,	%o4,	%o5
	fpack32	%f16,	%f2,	%f16
	ldsh	[%l7 + 0x32],	%g1
	andn	%l0,	%g6,	%l5
	sethi	0x049F,	%i1
	fnor	%f4,	%f28,	%f6
	ldub	[%l7 + 0x6C],	%i2
	fabss	%f20,	%f11
	nop
	set	0x45, %g7
	ldsb	[%l7 + %g7],	%g4
	edge8	%i3,	%i7,	%l4
	andcc	%o0,	0x1631,	%i5
	lduh	[%l7 + 0x20],	%l1
	movcs	%xcc,	%g7,	%g5
	fandnot1s	%f23,	%f19,	%f3
	edge8	%l3,	%l2,	%l6
	sdivcc	%i6,	0x196D,	%i0
	udivx	%o2,	0x12F6,	%o6
	edge8l	%o7,	%g3,	%i4
	orcc	%o3,	0x03A2,	%g2
	orn	%o1,	%o4,	%o5
	andcc	%l0,	%g6,	%g1
	fmul8sux16	%f26,	%f16,	%f18
	alignaddrl	%l5,	%i1,	%g4
	movcc	%icc,	%i2,	%i7
	udiv	%i3,	0x09B7,	%o0
	faligndata	%f12,	%f18,	%f16
	movvc	%icc,	%i5,	%l1
	stb	%g7,	[%l7 + 0x6C]
	umul	%g5,	0x1349,	%l3
	movrgez	%l2,	%l6,	%i6
	movge	%icc,	%i0,	%l4
	alignaddr	%o2,	%o6,	%o7
	andncc	%i4,	%o3,	%g2
	movrne	%g3,	%o4,	%o5
	ldsb	[%l7 + 0x18],	%l0
	sdivx	%o1,	0x0D9D,	%g1
	fsrc2	%f14,	%f20
	fabsd	%f4,	%f16
	ld	[%l7 + 0x18],	%f2
	fpack16	%f22,	%f8
	xnorcc	%g6,	0x022B,	%l5
	sir	0x073C
	mulscc	%g4,	0x07F9,	%i2
	fsrc2s	%f1,	%f17
	umulcc	%i1,	0x19E7,	%i7
	fcmpeq32	%f14,	%f22,	%i3
	movcs	%xcc,	%o0,	%l1
	sethi	0x1A6E,	%g7
	stw	%g5,	[%l7 + 0x5C]
	edge32n	%l3,	%l2,	%i5
	edge32	%i6,	%i0,	%l6
	movcs	%xcc,	%o2,	%l4
	edge16l	%o6,	%i4,	%o7
	stw	%o3,	[%l7 + 0x4C]
	movpos	%icc,	%g2,	%g3
	stb	%o5,	[%l7 + 0x59]
	for	%f18,	%f26,	%f8
	edge32n	%o4,	%l0,	%o1
	save %g6, %l5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i2,	0x0343,	%i1
	fpack32	%f22,	%f28,	%f8
	fands	%f8,	%f21,	%f13
	ld	[%l7 + 0x74],	%f7
	stb	%g1,	[%l7 + 0x5A]
	subccc	%i3,	0x0E8A,	%i7
	mova	%xcc,	%o0,	%l1
	fmovsneg	%icc,	%f27,	%f12
	alignaddrl	%g7,	%g5,	%l2
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%i4
	sethi	0x16C3,	%i6
	fcmps	%fcc1,	%f3,	%f16
	array16	%i0,	%l3,	%l6
	popc	0x1A05,	%o2
	fmovsn	%xcc,	%f11,	%f27
	stx	%o6,	[%l7 + 0x40]
	smul	%i4,	%o7,	%l4
	sra	%g2,	%g3,	%o5
	fnors	%f31,	%f9,	%f25
	sdivx	%o4,	0x0FF0,	%l0
	fzero	%f24
	movvc	%xcc,	%o3,	%g6
	stx	%l5,	[%l7 + 0x68]
	movrgez	%g4,	0x09E,	%o1
	or	%i1,	%i2,	%i3
	stw	%g1,	[%l7 + 0x30]
	move	%icc,	%i7,	%o0
	mulscc	%g7,	0x12FE,	%l1
	ldub	[%l7 + 0x3E],	%l2
	array8	%g5,	%i5,	%i6
	srlx	%l3,	0x0A,	%i0
	movg	%icc,	%o2,	%o6
	fsrc2s	%f0,	%f22
	movrne	%i4,	%l6,	%o7
	fmovrdgz	%l4,	%f22,	%f6
	mulx	%g3,	%o5,	%g2
	fandnot2s	%f18,	%f22,	%f28
	umul	%l0,	0x0DB6,	%o4
	edge8ln	%o3,	%g6,	%l5
	sllx	%g4,	%i1,	%i2
	fmovrdlz	%i3,	%f28,	%f16
	fsrc1	%f20,	%f10
	movrgz	%o1,	%g1,	%i7
	movg	%xcc,	%g7,	%o0
	edge16n	%l2,	%l1,	%i5
	movrlez	%i6,	%g5,	%i0
	edge16	%l3,	%o6,	%o2
	subcc	%i4,	0x129C,	%l6
	edge16l	%l4,	%o7,	%g3
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	andn	%o5,	0x0A7C,	%o3
	movcs	%xcc,	%l5,	%g4
	alignaddrl	%i1,	%i2,	%g6
	lduh	[%l7 + 0x4E],	%i3
	udivcc	%o1,	0x0A89,	%i7
	or	%g1,	%o0,	%g7
	edge32l	%l2,	%l1,	%i5
	or	%i6,	%i0,	%l3
	sdivcc	%g5,	0x0C60,	%o2
	fmovda	%xcc,	%f1,	%f24
	and	%o6,	%l6,	%l4
	sth	%o7,	[%l7 + 0x66]
	movneg	%xcc,	%g3,	%i4
	restore %g2, 0x1CB0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l0,	%o5,	%l5
	movg	%xcc,	%o3,	%i1
	alignaddrl	%i2,	%g6,	%i3
	movvc	%xcc,	%g4,	%o1
	fornot1s	%f17,	%f21,	%f17
	fabss	%f15,	%f15
	movleu	%icc,	%g1,	%i7
	movrlz	%o0,	%l2,	%g7
	fpadd16s	%f24,	%f29,	%f28
	fpsub16	%f28,	%f28,	%f30
	fmul8x16	%f16,	%f28,	%f6
	fmovdvs	%xcc,	%f20,	%f31
	addcc	%l1,	0x0781,	%i5
	sub	%i0,	%l3,	%g5
	fmovdgu	%icc,	%f18,	%f17
	movle	%xcc,	%o2,	%o6
	mova	%xcc,	%i6,	%l6
	andncc	%o7,	%g3,	%i4
	fmovrse	%g2,	%f3,	%f6
	ld	[%l7 + 0x68],	%f31
	array8	%l4,	%o4,	%o5
	xor	%l5,	%l0,	%i1
	fzero	%f24
	ld	[%l7 + 0x50],	%f14
	sdiv	%i2,	0x0B89,	%g6
	movpos	%xcc,	%i3,	%o3
	movl	%xcc,	%g4,	%o1
	alignaddrl	%i7,	%g1,	%l2
	fnot1	%f10,	%f20
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%o0
	edge8	%l1,	%i5,	%i0
	fmovrdgz	%g7,	%f14,	%f18
	ldx	[%l7 + 0x20],	%g5
	sub	%o2,	0x1DA2,	%l3
	fcmpeq32	%f12,	%f0,	%i6
	fnors	%f25,	%f13,	%f12
	umul	%l6,	%o6,	%o7
	fcmpd	%fcc0,	%f10,	%f0
	xorcc	%g3,	%g2,	%i4
	edge16	%o4,	%o5,	%l4
	movrgz	%l5,	0x34F,	%l0
	edge8l	%i2,	%i1,	%g6
	fpsub32	%f18,	%f6,	%f10
	edge8n	%o3,	%i3,	%g4
	lduh	[%l7 + 0x52],	%o1
	sdivx	%g1,	0x129D,	%l2
	xorcc	%o0,	%l1,	%i7
	movrlez	%i0,	0x36B,	%g7
	srlx	%g5,	0x1A,	%o2
	movl	%xcc,	%l3,	%i5
	save %l6, %o6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g3,	0x02,	%i6
	sdivx	%i4,	0x1A6A,	%g2
	sdivcc	%o5,	0x1ACC,	%l4
	std	%f30,	[%l7 + 0x30]
	edge16	%o4,	%l0,	%l5
	sub	%i1,	0x03F9,	%g6
	addcc	%o3,	0x0742,	%i3
	edge32ln	%i2,	%o1,	%g4
	subccc	%l2,	0x190D,	%o0
	fnor	%f28,	%f20,	%f16
	stw	%l1,	[%l7 + 0x0C]
	sth	%i7,	[%l7 + 0x7A]
	edge8	%g1,	%g7,	%g5
	fcmpes	%fcc3,	%f29,	%f17
	srax	%o2,	%i0,	%i5
	fmovsa	%icc,	%f6,	%f21
	movcs	%icc,	%l6,	%o6
	movcs	%icc,	%l3,	%o7
	lduw	[%l7 + 0x58],	%i6
	movrgez	%i4,	%g3,	%o5
	movrlz	%g2,	%l4,	%o4
	ldsb	[%l7 + 0x4E],	%l5
	ldd	[%l7 + 0x58],	%f16
	fcmps	%fcc1,	%f6,	%f30
	edge16n	%i1,	%g6,	%o3
	or	%l0,	0x0EB2,	%i2
	smul	%i3,	%o1,	%g4
	subccc	%o0,	%l1,	%i7
	fmovdneg	%icc,	%f26,	%f28
	array8	%l2,	%g1,	%g5
	srax	%o2,	0x16,	%i0
	ldd	[%l7 + 0x28],	%f26
	alignaddrl	%i5,	%l6,	%o6
	movrgez	%g7,	0x0DA,	%l3
	movl	%xcc,	%o7,	%i4
	ldub	[%l7 + 0x1D],	%g3
	lduh	[%l7 + 0x48],	%i6
	edge8ln	%o5,	%l4,	%o4
	ldd	[%l7 + 0x70],	%l4
	fones	%f13
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%g2
	mulscc	%i1,	0x178B,	%o3
	movcs	%icc,	%l0,	%i2
	ld	[%l7 + 0x14],	%f23
	save %i3, %o1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x28],	%o0
	udivcc	%l1,	0x10F7,	%i7
	sethi	0x0D1D,	%g4
	subcc	%g1,	0x1005,	%g5
	pdist	%f24,	%f30,	%f16
	xnor	%l2,	%i0,	%i5
	ldd	[%l7 + 0x18],	%f8
	movleu	%xcc,	%l6,	%o2
	fpsub16s	%f31,	%f9,	%f9
	fmuld8ulx16	%f21,	%f17,	%f28
	ldd	[%l7 + 0x70],	%f28
	edge8l	%o6,	%g7,	%o7
	movneg	%icc,	%l3,	%g3
	fornot1s	%f29,	%f15,	%f7
	mulscc	%i6,	0x0518,	%i4
	edge32	%l4,	%o4,	%o5
	fmovrdgz	%l5,	%f24,	%f20
	ldd	[%l7 + 0x40],	%i0
	orcc	%g2,	0x1D57,	%o3
	movcc	%icc,	%i2,	%l0
	fmovdpos	%icc,	%f11,	%f28
	stb	%i3,	[%l7 + 0x18]
	std	%f12,	[%l7 + 0x30]
	fmovrsgez	%g6,	%f17,	%f26
	umulcc	%o0,	0x094F,	%o1
	edge16n	%i7,	%g4,	%g1
	mulscc	%g5,	%l1,	%i0
	udivcc	%l2,	0x0F28,	%l6
	srlx	%i5,	%o2,	%o6
	fpmerge	%f23,	%f12,	%f10
	ldd	[%l7 + 0x78],	%o6
	std	%f10,	[%l7 + 0x28]
	fzeros	%f19
	fpadd16s	%f14,	%f26,	%f8
	andn	%l3,	0x0031,	%g3
	edge32ln	%g7,	%i4,	%i6
	fmovdvc	%icc,	%f14,	%f4
	lduw	[%l7 + 0x7C],	%o4
	srl	%o5,	%l4,	%l5
	srlx	%i1,	0x04,	%g2
	sub	%o3,	%l0,	%i2
	st	%f7,	[%l7 + 0x60]
	edge16	%g6,	%i3,	%o0
	add	%o1,	%g4,	%g1
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%i7
	movre	%l1,	%i0,	%g5
	fornot1s	%f18,	%f6,	%f28
	smulcc	%l6,	0x15E7,	%l2
	smulcc	%o2,	%i5,	%o6
	lduh	[%l7 + 0x1E],	%l3
	fnegd	%f10,	%f20
	fandnot2s	%f8,	%f9,	%f31
	fmul8sux16	%f6,	%f12,	%f2
	fxors	%f12,	%f9,	%f28
	fornot2	%f18,	%f16,	%f26
	movl	%xcc,	%g3,	%g7
	udivx	%i4,	0x18CB,	%i6
	ldsw	[%l7 + 0x58],	%o7
	subccc	%o4,	0x0989,	%l4
	lduw	[%l7 + 0x78],	%l5
	ldsw	[%l7 + 0x70],	%o5
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	andn	%i1,	0x1F33,	%i2
	xnorcc	%g6,	0x0650,	%l0
	stw	%i3,	[%l7 + 0x08]
	fnot1	%f20,	%f22
	sll	%o0,	0x02,	%o1
	faligndata	%f26,	%f8,	%f6
	movre	%g4,	0x0D9,	%i7
	fmovrse	%l1,	%f20,	%f16
	sub	%g1,	0x1744,	%i0
	addccc	%g5,	%l6,	%l2
	umulcc	%i5,	%o6,	%l3
	fmul8sux16	%f12,	%f18,	%f8
	sdivx	%g3,	0x0085,	%o2
	fmovdle	%icc,	%f30,	%f5
	sllx	%g7,	0x02,	%i6
	array8	%i4,	%o7,	%l4
	edge8n	%o4,	%l5,	%g2
	fmovrsne	%o3,	%f21,	%f30
	fmovrdne	%i1,	%f28,	%f18
	sdiv	%i2,	0x10A3,	%g6
	edge32ln	%l0,	%o5,	%o0
	stx	%i3,	[%l7 + 0x68]
	ldsw	[%l7 + 0x40],	%o1
	edge16	%g4,	%i7,	%l1
	srlx	%i0,	%g1,	%g5
	ldub	[%l7 + 0x3C],	%l2
	lduh	[%l7 + 0x50],	%l6
	andcc	%i5,	0x14A8,	%o6
	smulcc	%g3,	%l3,	%g7
	sth	%i6,	[%l7 + 0x26]
	udivx	%o2,	0x0782,	%o7
	nop
	set	0x70, %g1
	stw	%i4,	[%l7 + %g1]
	movre	%o4,	0x3F4,	%l5
	add	%l4,	%g2,	%i1
	fmovscs	%xcc,	%f3,	%f30
	stw	%i2,	[%l7 + 0x50]
	edge16n	%o3,	%g6,	%o5
	addc	%o0,	0x192D,	%l0
	edge16l	%i3,	%g4,	%o1
	stx	%i7,	[%l7 + 0x20]
	sdivcc	%i0,	0x11A8,	%l1
	stx	%g5,	[%l7 + 0x48]
	addc	%g1,	%l6,	%i5
	andn	%l2,	0x1DC1,	%g3
	array16	%l3,	%o6,	%g7
	fxnor	%f8,	%f20,	%f16
	udivcc	%i6,	0x08A7,	%o2
	st	%f25,	[%l7 + 0x10]
	movvs	%icc,	%i4,	%o4
	edge8l	%l5,	%o7,	%g2
	edge8n	%l4,	%i1,	%i2
	edge16n	%g6,	%o3,	%o5
	add	%o0,	0x081F,	%i3
	movcs	%icc,	%l0,	%o1
	fxnor	%f20,	%f2,	%f30
	edge16n	%g4,	%i0,	%l1
	xorcc	%g5,	0x0BF4,	%g1
	mulx	%i7,	%l6,	%l2
	movcs	%xcc,	%g3,	%i5
	subc	%o6,	0x0E73,	%g7
	movpos	%icc,	%l3,	%o2
	fone	%f8
	addcc	%i4,	0x0963,	%i6
	nop
	set	0x78, %o6
	std	%f22,	[%l7 + %o6]
	addccc	%l5,	%o4,	%o7
	ldd	[%l7 + 0x70],	%f26
	movvs	%icc,	%l4,	%i1
	sdiv	%g2,	0x0437,	%i2
	array32	%g6,	%o3,	%o0
	sir	0x11B3
	fzeros	%f29
	fmovsn	%icc,	%f5,	%f10
	movn	%icc,	%i3,	%o5
	sllx	%o1,	0x11,	%g4
	or	%l0,	%l1,	%i0
	edge16n	%g5,	%g1,	%l6
	restore %i7, %l2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g3,	0x0FF1,	%o6
	sllx	%l3,	%g7,	%o2
	movpos	%icc,	%i4,	%i6
	movcc	%icc,	%o4,	%o7
	fandnot1s	%f7,	%f2,	%f2
	sub	%l4,	0x0B1B,	%i1
	save %l5, %i2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o3,	0x197A,	%g6
	ldub	[%l7 + 0x24],	%i3
	movle	%xcc,	%o5,	%o1
	fmovdg	%xcc,	%f31,	%f19
	fmovrdlez	%g4,	%f0,	%f6
	st	%f17,	[%l7 + 0x44]
	fpsub16s	%f4,	%f17,	%f25
	movrgz	%o0,	%l0,	%l1
	xorcc	%i0,	0x1F1A,	%g1
	faligndata	%f30,	%f28,	%f14
	movne	%icc,	%g5,	%i7
	mova	%icc,	%l2,	%i5
	udivcc	%g3,	0x0460,	%o6
	edge16l	%l6,	%g7,	%o2
	fmovsn	%icc,	%f22,	%f23
	sdivx	%l3,	0x0DA4,	%i4
	udivcc	%o4,	0x08B1,	%i6
	andcc	%l4,	0x0CBA,	%i1
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	addc	%i2,	0x1CA7,	%o3
	edge8n	%g6,	%i3,	%o1
	umul	%g4,	0x0997,	%o0
	save %o5, %l0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x5E],	%g1
	xorcc	%g5,	%i0,	%i7
	fpsub16s	%f3,	%f1,	%f26
	movg	%xcc,	%l2,	%g3
	movcs	%xcc,	%o6,	%i5
	restore %g7, %o2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i4,	0x08,	%l6
	movrgz	%o4,	0x072,	%l4
	edge8ln	%i1,	%l5,	%o7
	smul	%i6,	0x1A95,	%g2
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f8
	fmovdcc	%icc,	%f14,	%f19
	orn	%o3,	0x104A,	%g6
	edge16l	%i3,	%o1,	%i2
	fornot2	%f20,	%f10,	%f20
	move	%icc,	%g4,	%o5
	save %l0, %l1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o0,	%g5
	movcs	%xcc,	%i7,	%i0
	std	%f2,	[%l7 + 0x28]
	udivx	%l2,	0x174A,	%o6
	fmovd	%f30,	%f2
	movne	%icc,	%g3,	%i5
	sllx	%g7,	%o2,	%i4
	movvc	%icc,	%l6,	%l3
	fmul8x16au	%f23,	%f20,	%f14
	xnor	%o4,	0x014F,	%i1
	edge16ln	%l5,	%l4,	%o7
	fcmpeq16	%f0,	%f0,	%i6
	and	%o3,	%g2,	%i3
	movneg	%icc,	%g6,	%o1
	or	%i2,	0x0D27,	%o5
	ldsw	[%l7 + 0x50],	%g4
	fpsub32s	%f1,	%f12,	%f1
	movcc	%icc,	%l1,	%l0
	fandnot1s	%f2,	%f9,	%f24
	andcc	%g1,	%o0,	%i7
	andncc	%g5,	%l2,	%o6
	udiv	%i0,	0x061D,	%g3
	for	%f28,	%f10,	%f14
	udivx	%i5,	0x0964,	%o2
	movrne	%i4,	%l6,	%g7
	fmovrse	%o4,	%f18,	%f27
	faligndata	%f10,	%f0,	%f12
	movle	%icc,	%l3,	%i1
	nop
	set	0x18, %l5
	std	%f12,	[%l7 + %l5]
	fmovscs	%icc,	%f11,	%f0
	mova	%xcc,	%l5,	%o7
	ldx	[%l7 + 0x58],	%i6
	edge8n	%o3,	%g2,	%l4
	fmovrsgez	%i3,	%f28,	%f8
	movleu	%icc,	%o1,	%g6
	and	%o5,	0x1DA7,	%g4
	ldsb	[%l7 + 0x67],	%i2
	fmovrslz	%l1,	%f7,	%f10
	andn	%l0,	%o0,	%i7
	movre	%g5,	%l2,	%g1
	movrgz	%i0,	%o6,	%g3
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	smul	%g7,	%o4,	%o2
	movg	%xcc,	%i1,	%l3
	sir	0x0859
	xorcc	%l5,	%o7,	%i6
	lduh	[%l7 + 0x32],	%o3
	subc	%l4,	%i3,	%g2
	alignaddr	%g6,	%o1,	%g4
	movrgez	%o5,	%l1,	%l0
	fmovsvc	%xcc,	%f15,	%f30
	sethi	0x14C7,	%i2
	edge16n	%i7,	%g5,	%o0
	fcmpne32	%f18,	%f24,	%g1
	ld	[%l7 + 0x34],	%f28
	subc	%i0,	0x1F83,	%o6
	movrgez	%l2,	%g3,	%i5
	orcc	%i4,	0x10FA,	%l6
	orn	%o4,	%o2,	%g7
	mova	%icc,	%i1,	%l5
	orcc	%l3,	0x1EA4,	%i6
	ldub	[%l7 + 0x5F],	%o3
	or	%l4,	%o7,	%i3
	movcc	%icc,	%g6,	%o1
	movle	%icc,	%g4,	%o5
	movpos	%xcc,	%l1,	%g2
	andn	%i2,	0x0D22,	%i7
	fmovsvc	%xcc,	%f5,	%f22
	edge8	%g5,	%o0,	%g1
	orncc	%l0,	0x09BD,	%o6
	andcc	%i0,	0x1118,	%g3
	movvc	%xcc,	%l2,	%i4
	udiv	%i5,	0x1769,	%l6
	edge16	%o2,	%o4,	%i1
	fmuld8ulx16	%f15,	%f7,	%f26
	umulcc	%g7,	0x1A6B,	%l3
	stb	%l5,	[%l7 + 0x75]
	movge	%xcc,	%o3,	%l4
	for	%f28,	%f20,	%f14
	mulx	%i6,	%o7,	%g6
	lduw	[%l7 + 0x4C],	%o1
	fmovrse	%i3,	%f16,	%f25
	umul	%g4,	%l1,	%g2
	fmovdgu	%icc,	%f25,	%f19
	srax	%i2,	%i7,	%g5
	std	%f14,	[%l7 + 0x48]
	sethi	0x0E63,	%o0
	fpsub32s	%f29,	%f17,	%f22
	addc	%o5,	%g1,	%l0
	fmovdg	%icc,	%f8,	%f22
	fornot1	%f24,	%f4,	%f10
	addcc	%o6,	%g3,	%i0
	ldsb	[%l7 + 0x5E],	%l2
	fcmpes	%fcc2,	%f29,	%f1
	orncc	%i4,	0x1812,	%i5
	fmovspos	%icc,	%f26,	%f0
	save %l6, %o4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i1,	%g7,	%l5
	sdiv	%l3,	0x132F,	%l4
	alignaddr	%o3,	%i6,	%o7
	add	%g6,	%i3,	%g4
	xnor	%l1,	%g2,	%o1
	or	%i2,	%g5,	%i7
	subcc	%o5,	0x1448,	%o0
	nop
	set	0x78, %i3
	lduh	[%l7 + %i3],	%l0
	fone	%f26
	movne	%icc,	%g1,	%g3
	umulcc	%i0,	0x0983,	%o6
	fzero	%f30
	mova	%icc,	%l2,	%i4
	alignaddr	%l6,	%o4,	%o2
	udiv	%i5,	0x0334,	%i1
	movge	%icc,	%g7,	%l5
	fmovspos	%xcc,	%f16,	%f29
	fpadd16	%f2,	%f22,	%f24
	subccc	%l3,	0x0DED,	%o3
	add	%l4,	0x1490,	%o7
	sllx	%g6,	%i6,	%i3
	stw	%l1,	[%l7 + 0x60]
	alignaddrl	%g4,	%o1,	%g2
	srax	%i2,	%i7,	%g5
	umul	%o0,	%l0,	%g1
	movgu	%icc,	%g3,	%o5
	stw	%o6,	[%l7 + 0x38]
	and	%i0,	0x0591,	%i4
	fmovrdlez	%l2,	%f16,	%f16
	movrgz	%o4,	0x1E4,	%l6
	fsrc1s	%f18,	%f3
	movne	%xcc,	%i5,	%o2
	fmovdvs	%icc,	%f1,	%f28
	fsrc2	%f2,	%f16
	and	%g7,	%i1,	%l3
	lduh	[%l7 + 0x54],	%l5
	edge8	%o3,	%o7,	%l4
	andcc	%g6,	%i6,	%i3
	nop
	set	0x6C, %i5
	stw	%l1,	[%l7 + %i5]
	xor	%o1,	0x0C20,	%g4
	edge8	%i2,	%i7,	%g2
	fmovdneg	%icc,	%f29,	%f20
	edge16n	%o0,	%l0,	%g1
	movne	%xcc,	%g3,	%g5
	movrgz	%o6,	0x1B5,	%o5
	edge8	%i0,	%i4,	%l2
	std	%f6,	[%l7 + 0x48]
	edge8n	%l6,	%o4,	%o2
	mulx	%i5,	0x1B08,	%g7
	movg	%xcc,	%l3,	%i1
	lduw	[%l7 + 0x5C],	%l5
	array16	%o7,	%l4,	%g6
	edge16ln	%i6,	%i3,	%l1
	edge8l	%o3,	%o1,	%i2
	edge8l	%g4,	%i7,	%g2
	move	%icc,	%l0,	%g1
	udivcc	%g3,	0x1E84,	%g5
	edge32	%o0,	%o6,	%o5
	fandnot1	%f16,	%f30,	%f8
	edge16	%i0,	%i4,	%l2
	alignaddr	%o4,	%o2,	%i5
	andn	%g7,	0x0E1F,	%l6
	fmul8ulx16	%f26,	%f12,	%f24
	smul	%i1,	%l5,	%l3
	array32	%o7,	%g6,	%l4
	st	%f14,	[%l7 + 0x1C]
	fmovdne	%xcc,	%f12,	%f23
	stb	%i6,	[%l7 + 0x56]
	fcmps	%fcc1,	%f14,	%f2
	fxnors	%f30,	%f8,	%f25
	xnorcc	%l1,	%i3,	%o3
	fmovdne	%xcc,	%f10,	%f9
	movcc	%xcc,	%o1,	%i2
	fmovrdlz	%i7,	%f12,	%f2
	umul	%g4,	%l0,	%g1
	ldsb	[%l7 + 0x46],	%g3
	edge32ln	%g5,	%o0,	%g2
	mova	%xcc,	%o5,	%i0
	edge8	%o6,	%i4,	%l2
	fcmpgt16	%f30,	%f18,	%o2
	movneg	%xcc,	%o4,	%g7
	fmovrslz	%l6,	%f5,	%f21
	fpsub32	%f8,	%f4,	%f0
	mulx	%i1,	0x0990,	%l5
	subc	%l3,	0x16D6,	%o7
	movrgez	%g6,	0x2DE,	%i5
	movcs	%xcc,	%l4,	%l1
	sir	0x1E37
	fmovdcs	%xcc,	%f26,	%f22
	movrgz	%i6,	%o3,	%o1
	movl	%xcc,	%i3,	%i7
	sdiv	%g4,	0x0EB6,	%i2
	sub	%g1,	%l0,	%g3
	movrgz	%g5,	%g2,	%o0
	std	%f22,	[%l7 + 0x38]
	fmovrdlz	%o5,	%f12,	%f0
	edge8n	%i0,	%o6,	%l2
	edge8	%i4,	%o2,	%o4
	fmul8sux16	%f20,	%f10,	%f24
	fsrc1	%f24,	%f16
	restore %l6, %g7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0B01
	fmul8ulx16	%f26,	%f0,	%f12
	move	%icc,	%i1,	%o7
	move	%icc,	%l3,	%g6
	addccc	%l4,	%l1,	%i6
	andncc	%o3,	%i5,	%i3
	ldd	[%l7 + 0x48],	%i6
	umulcc	%g4,	0x1E89,	%o1
	array8	%i2,	%g1,	%g3
	sra	%l0,	%g2,	%g5
	movle	%xcc,	%o0,	%i0
	xorcc	%o6,	%o5,	%i4
	nop
	set	0x32, %i6
	lduh	[%l7 + %i6],	%l2
	std	%f30,	[%l7 + 0x78]
	edge8ln	%o4,	%l6,	%o2
	orn	%l5,	0x16E6,	%i1
	movrgez	%g7,	0x068,	%l3
	alignaddr	%o7,	%l4,	%g6
	sub	%i6,	%o3,	%l1
	xor	%i3,	0x00A1,	%i5
	fmovrdgez	%i7,	%f18,	%f14
	smulcc	%g4,	0x1E10,	%i2
	save %g1, 0x085E, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l0,	%g3,	%g5
	fandnot1	%f8,	%f0,	%f12
	movpos	%xcc,	%o0,	%i0
	subc	%o6,	0x04C9,	%o5
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	edge32l	%o4,	%l6,	%o2
	xorcc	%l2,	0x0552,	%l5
	umulcc	%g7,	0x124B,	%i1
	std	%f8,	[%l7 + 0x60]
	save %o7, %l3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x52],	%g6
	sll	%o3,	0x1D,	%l1
	xor	%i3,	0x1365,	%i6
	movrlez	%i7,	0x1F5,	%i5
	stw	%g4,	[%l7 + 0x4C]
	subccc	%i2,	%o1,	%l0
	fcmpeq32	%f22,	%f28,	%g1
	edge32n	%g3,	%o0,	%g5
	sir	0x0525
	sll	%o6,	%o5,	%i0
	edge32n	%g2,	%o4,	%l6
	movrgz	%o2,	%l2,	%i4
	sethi	0x0005,	%g7
	edge32ln	%l5,	%o7,	%i1
	xor	%l3,	0x0287,	%g6
	array16	%o3,	%l1,	%l4
	edge8ln	%i6,	%i3,	%i5
	sll	%g4,	%i7,	%i2
	sll	%o1,	%l0,	%g1
	addccc	%o0,	0x151B,	%g3
	xnor	%o6,	0x0256,	%o5
	subc	%i0,	0x1610,	%g2
	orcc	%o4,	%g5,	%o2
	smul	%l2,	0x1F5F,	%i4
	fmovdcs	%xcc,	%f26,	%f15
	orncc	%g7,	0x0919,	%l6
	umulcc	%l5,	%i1,	%l3
	orcc	%g6,	0x1985,	%o7
	fandnot1s	%f20,	%f5,	%f4
	fsrc2s	%f28,	%f21
	ldsw	[%l7 + 0x48],	%l1
	array16	%l4,	%o3,	%i3
	ldub	[%l7 + 0x1C],	%i5
	ldsw	[%l7 + 0x54],	%g4
	fnot1	%f2,	%f2
	andn	%i7,	0x0E74,	%i6
	array16	%i2,	%o1,	%g1
	udivcc	%o0,	0x1F69,	%g3
	save %l0, %o5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f16,	%f28
	fmul8x16	%f10,	%f24,	%f10
	movrgez	%g2,	%o4,	%o6
	udivx	%g5,	0x17FD,	%o2
	ldsw	[%l7 + 0x74],	%i4
	alignaddr	%l2,	%l6,	%l5
	fpsub32s	%f10,	%f9,	%f27
	fmovsg	%xcc,	%f1,	%f3
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%g7
	movg	%xcc,	%l3,	%i1
	edge16	%o7,	%g6,	%l4
	add	%l1,	%i3,	%i5
	fmovsle	%icc,	%f5,	%f31
	sth	%g4,	[%l7 + 0x3A]
	array32	%i7,	%o3,	%i2
	popc	%i6,	%g1
	movrlz	%o1,	%o0,	%g3
	movgu	%xcc,	%o5,	%i0
	edge32	%g2,	%l0,	%o6
	edge32	%g5,	%o4,	%i4
	smul	%l2,	%o2,	%l5
	udivx	%l6,	0x1FB2,	%l3
	alignaddr	%i1,	%o7,	%g6
	mulscc	%l4,	0x0690,	%l1
	orn	%g7,	0x1078,	%i3
	restore %g4, 0x1BC3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i5,	0x098D,	%i2
	movcs	%icc,	%o3,	%i6
	fmul8x16al	%f23,	%f22,	%f20
	fcmps	%fcc1,	%f12,	%f29
	umulcc	%o1,	0x0A20,	%o0
	movrne	%g3,	%o5,	%g1
	alignaddrl	%i0,	%g2,	%l0
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%o6
	stx	%g5,	[%l7 + 0x58]
	or	%o4,	%l2,	%i4
	fmovdpos	%icc,	%f17,	%f17
	orn	%o2,	%l5,	%l3
	stx	%i1,	[%l7 + 0x70]
	fcmpne32	%f16,	%f6,	%l6
	ld	[%l7 + 0x20],	%f16
	movrlz	%o7,	%l4,	%g6
	ldsw	[%l7 + 0x7C],	%l1
	subccc	%i3,	%g4,	%i7
	movrne	%i5,	%i2,	%g7
	movrlez	%i6,	0x029,	%o1
	xor	%o3,	0x0EB0,	%o0
	movvc	%icc,	%g3,	%g1
	ldsh	[%l7 + 0x3C],	%o5
	ldsb	[%l7 + 0x4D],	%g2
	andncc	%i0,	%l0,	%g5
	save %o6, %o4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	0x1302,	%l5
	move	%icc,	%l2,	%i1
	movneg	%icc,	%l6,	%o7
	andcc	%l3,	0x1498,	%l4
	fnors	%f22,	%f3,	%f8
	andcc	%g6,	%i3,	%g4
	andncc	%i7,	%l1,	%i5
	fcmpd	%fcc3,	%f24,	%f16
	addcc	%i2,	0x0F25,	%i6
	alignaddrl	%o1,	%g7,	%o0
	umul	%o3,	0x1659,	%g1
	fmovsne	%icc,	%f24,	%f22
	xorcc	%g3,	%g2,	%o5
	nop
	set	0x38, %l3
	lduw	[%l7 + %l3],	%i0
	smul	%l0,	0x116E,	%g5
	edge32l	%o4,	%o6,	%i4
	add	%l5,	0x061B,	%o2
	fmovrdgz	%l2,	%f20,	%f28
	fxnors	%f3,	%f6,	%f24
	fxors	%f30,	%f3,	%f3
	fmovsleu	%xcc,	%f15,	%f5
	srl	%l6,	0x0F,	%i1
	mova	%xcc,	%l3,	%l4
	st	%f6,	[%l7 + 0x40]
	fcmpes	%fcc1,	%f20,	%f4
	smul	%o7,	%g6,	%g4
	fmovsle	%xcc,	%f10,	%f17
	srl	%i3,	0x12,	%i7
	fnot1	%f8,	%f12
	mulx	%i5,	%l1,	%i6
	edge32	%o1,	%g7,	%i2
	fcmpes	%fcc2,	%f2,	%f22
	subc	%o3,	0x10F8,	%g1
	fmul8x16au	%f4,	%f21,	%f26
	mulscc	%o0,	0x1129,	%g2
	fpack32	%f14,	%f0,	%f20
	fnegd	%f20,	%f2
	fmovrdgez	%o5,	%f6,	%f26
	movge	%icc,	%g3,	%i0
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	fmovsge	%xcc,	%f27,	%f18
	fornot2	%f22,	%f10,	%f0
	stx	%i4,	[%l7 + 0x58]
	movge	%xcc,	%l5,	%o6
	and	%l2,	%o2,	%l6
	umul	%i1,	%l3,	%l4
	and	%g6,	0x1B6C,	%o7
	andncc	%i3,	%i7,	%g4
	movle	%icc,	%i5,	%i6
	edge32n	%l1,	%g7,	%i2
	fandnot1	%f2,	%f24,	%f0
	xorcc	%o3,	%g1,	%o1
	movpos	%xcc,	%g2,	%o5
	movrlz	%g3,	%i0,	%o0
	xnorcc	%l0,	0x0A0D,	%g5
	fmul8x16	%f14,	%f30,	%f10
	orcc	%i4,	%l5,	%o6
	addcc	%o4,	%l2,	%l6
	movrgz	%o2,	%i1,	%l4
	udivcc	%l3,	0x0644,	%o7
	movrlez	%g6,	%i3,	%g4
	sir	0x1F46
	move	%icc,	%i5,	%i7
	srlx	%l1,	%i6,	%i2
	orncc	%o3,	%g7,	%o1
	movrgz	%g1,	0x293,	%o5
	edge32ln	%g2,	%g3,	%i0
	array8	%l0,	%g5,	%o0
	movrgez	%i4,	%o6,	%l5
	sra	%l2,	0x0D,	%o4
	orncc	%l6,	%i1,	%l4
	movrgz	%o2,	0x02F,	%o7
	fands	%f21,	%f30,	%f2
	ldsb	[%l7 + 0x5D],	%g6
	fmovdvs	%icc,	%f4,	%f18
	stw	%l3,	[%l7 + 0x0C]
	movre	%g4,	0x082,	%i5
	movrlez	%i7,	%l1,	%i6
	movre	%i3,	0x370,	%o3
	smul	%i2,	%g7,	%g1
	edge32l	%o1,	%g2,	%g3
	edge8l	%i0,	%o5,	%l0
	fmovdgu	%xcc,	%f7,	%f20
	movle	%xcc,	%g5,	%o0
	mulx	%i4,	%o6,	%l2
	fmovspos	%xcc,	%f28,	%f24
	save %o4, 0x0DB7, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i1,	%l4,	%o2
	stw	%l5,	[%l7 + 0x50]
	fand	%f24,	%f14,	%f6
	fmovsneg	%xcc,	%f18,	%f29
	movgu	%xcc,	%o7,	%l3
	stw	%g4,	[%l7 + 0x3C]
	fxors	%f28,	%f10,	%f17
	fpadd16s	%f0,	%f22,	%f14
	movn	%icc,	%g6,	%i5
	fmovrse	%l1,	%f29,	%f7
	orncc	%i6,	%i3,	%i7
	mulx	%i2,	%g7,	%o3
	ldsh	[%l7 + 0x48],	%g1
	fmovdvc	%icc,	%f4,	%f4
	fpadd32	%f16,	%f6,	%f30
	orcc	%o1,	0x1DE9,	%g2
	alignaddr	%i0,	%o5,	%l0
	fsrc2	%f6,	%f20
	movrgz	%g5,	%o0,	%i4
	fmovsa	%xcc,	%f27,	%f4
	movn	%xcc,	%o6,	%g3
	sll	%o4,	0x08,	%l2
	restore %i1, %l4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l5,	0x0C0A,	%o7
	movvc	%icc,	%l3,	%l6
	addc	%g4,	%i5,	%g6
	save %l1, %i6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i3,	%i2,	%o3
	fnot1s	%f10,	%f20
	udivcc	%g7,	0x04C2,	%g1
	array16	%o1,	%i0,	%o5
	fmovdleu	%icc,	%f23,	%f26
	andn	%g2,	%g5,	%o0
	addc	%i4,	%l0,	%g3
	stw	%o6,	[%l7 + 0x78]
	mova	%icc,	%l2,	%i1
	fpadd16s	%f1,	%f6,	%f25
	sub	%o4,	%o2,	%l5
	movre	%o7,	%l4,	%l3
	movcs	%xcc,	%l6,	%i5
	movpos	%xcc,	%g6,	%g4
	fsrc2s	%f0,	%f9
	alignaddrl	%l1,	%i7,	%i3
	sra	%i2,	0x10,	%i6
	movcc	%xcc,	%g7,	%o3
	andcc	%o1,	%i0,	%g1
	sth	%o5,	[%l7 + 0x2E]
	addc	%g2,	%o0,	%g5
	movleu	%xcc,	%l0,	%g3
	fmovde	%icc,	%f15,	%f3
	fandnot2s	%f31,	%f24,	%f12
	fsrc1s	%f16,	%f31
	edge16	%o6,	%l2,	%i4
	stx	%i1,	[%l7 + 0x40]
	edge8l	%o2,	%o4,	%o7
	orn	%l4,	%l5,	%l3
	fxnor	%f22,	%f12,	%f14
	fmovd	%f12,	%f0
	sdiv	%l6,	0x17F7,	%g6
	edge32	%i5,	%l1,	%g4
	fmuld8ulx16	%f17,	%f7,	%f12
	smulcc	%i3,	0x1FDB,	%i7
	orn	%i6,	%g7,	%o3
	smul	%i2,	0x1010,	%o1
	sub	%i0,	%o5,	%g1
	ldd	[%l7 + 0x18],	%f12
	sdiv	%g2,	0x0DF3,	%o0
	andcc	%g5,	%g3,	%o6
	sethi	0x1571,	%l0
	fpack32	%f14,	%f10,	%f20
	fsrc1s	%f9,	%f16
	srlx	%l2,	%i1,	%i4
	edge32	%o4,	%o7,	%o2
	movg	%xcc,	%l4,	%l3
	srlx	%l6,	%l5,	%g6
	ldsh	[%l7 + 0x58],	%l1
	addcc	%i5,	%i3,	%i7
	movg	%icc,	%i6,	%g4
	lduh	[%l7 + 0x0E],	%o3
	edge32	%i2,	%o1,	%g7
	fxnors	%f22,	%f22,	%f27
	pdist	%f8,	%f8,	%f8
	fxor	%f6,	%f2,	%f4
	addccc	%i0,	%o5,	%g1
	sir	0x0307
	fpadd16s	%f1,	%f7,	%f14
	srlx	%g2,	0x1D,	%g5
	movne	%xcc,	%o0,	%g3
	sra	%l0,	%o6,	%i1
	smul	%i4,	%o4,	%o7
	srlx	%o2,	0x1E,	%l4
	movgu	%xcc,	%l3,	%l2
	fnor	%f10,	%f22,	%f6
	orncc	%l6,	0x1988,	%g6
	fornot2s	%f13,	%f9,	%f2
	fcmpeq16	%f30,	%f26,	%l1
	movg	%icc,	%l5,	%i5
	movcs	%icc,	%i3,	%i7
	st	%f31,	[%l7 + 0x6C]
	edge8l	%g4,	%i6,	%i2
	fabsd	%f10,	%f4
	lduh	[%l7 + 0x30],	%o3
	fmovd	%f26,	%f24
	mulscc	%o1,	%g7,	%o5
	sub	%g1,	0x15B6,	%i0
	ldsh	[%l7 + 0x7A],	%g5
	sub	%g2,	%g3,	%o0
	movcc	%xcc,	%l0,	%i1
	ldsw	[%l7 + 0x20],	%o6
	addc	%i4,	0x1E1F,	%o7
	lduh	[%l7 + 0x1C],	%o4
	movrgez	%l4,	0x34C,	%o2
	movrlz	%l2,	0x3E7,	%l3
	edge16l	%l6,	%l1,	%g6
	sra	%l5,	%i3,	%i7
	sdivcc	%g4,	0x11B1,	%i5
	fmovrdgez	%i2,	%f22,	%f20
	xorcc	%o3,	%i6,	%o1
	fcmpgt16	%f0,	%f22,	%g7
	subcc	%g1,	0x182D,	%i0
	ldsb	[%l7 + 0x19],	%g5
	fpsub32	%f28,	%f22,	%f4
	fcmpes	%fcc2,	%f10,	%f31
	orcc	%o5,	%g2,	%o0
	edge16l	%g3,	%i1,	%l0
	sdivcc	%o6,	0x1B13,	%o7
	subc	%i4,	0x0567,	%l4
	mova	%xcc,	%o4,	%o2
	fpmerge	%f7,	%f19,	%f18
	stw	%l3,	[%l7 + 0x54]
	movn	%xcc,	%l2,	%l1
	subc	%g6,	0x10A6,	%l6
	ldsh	[%l7 + 0x44],	%l5
	ldsw	[%l7 + 0x24],	%i7
	std	%f26,	[%l7 + 0x70]
	xorcc	%i3,	0x1447,	%g4
	ldx	[%l7 + 0x18],	%i5
	fones	%f19
	andn	%o3,	0x01C3,	%i2
	xorcc	%o1,	%g7,	%i6
	edge8n	%g1,	%i0,	%g5
	addcc	%o5,	0x0673,	%o0
	st	%f5,	[%l7 + 0x50]
	edge16ln	%g3,	%g2,	%i1
	fpadd16s	%f1,	%f1,	%f28
	sra	%o6,	0x03,	%l0
	fnands	%f12,	%f10,	%f11
	movne	%icc,	%i4,	%l4
	mulscc	%o4,	%o2,	%l3
	movleu	%icc,	%l2,	%l1
	fnot2	%f28,	%f8
	smul	%o7,	%g6,	%l5
	movgu	%xcc,	%l6,	%i3
	std	%f24,	[%l7 + 0x18]
	fpsub32	%f18,	%f4,	%f26
	ldsh	[%l7 + 0x76],	%g4
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%i5
	fmul8ulx16	%f2,	%f10,	%f0
	popc	%i7,	%o3
	alignaddr	%o1,	%i2,	%i6
	lduw	[%l7 + 0x70],	%g7
	movne	%icc,	%i0,	%g1
	fmovspos	%xcc,	%f22,	%f31
	fmovdge	%xcc,	%f30,	%f31
	movneg	%icc,	%o5,	%g5
	udiv	%o0,	0x0BAF,	%g2
	andcc	%g3,	0x17C8,	%i1
	alignaddr	%l0,	%o6,	%i4
	edge8n	%o4,	%o2,	%l3
	umulcc	%l4,	0x0D9E,	%l1
	edge32ln	%o7,	%g6,	%l2
	fnands	%f30,	%f22,	%f5
	srax	%l6,	%l5,	%i3
	edge16ln	%i5,	%g4,	%i7
	fnot2	%f10,	%f8
	umul	%o1,	0x0DAB,	%i2
	edge32	%i6,	%g7,	%o3
	ldx	[%l7 + 0x20],	%i0
	sdiv	%o5,	0x076E,	%g5
	fpadd16	%f30,	%f4,	%f4
	srax	%g1,	%o0,	%g3
	fmovs	%f19,	%f12
	popc	0x0FDE,	%i1
	fpadd32	%f30,	%f2,	%f26
	movg	%icc,	%g2,	%l0
	mulscc	%i4,	0x1498,	%o4
	edge32ln	%o2,	%l3,	%l4
	faligndata	%f18,	%f30,	%f0
	fandnot1	%f12,	%f22,	%f18
	movg	%icc,	%o6,	%l1
	orcc	%g6,	%l2,	%o7
	ldsw	[%l7 + 0x74],	%l5
	movcs	%xcc,	%i3,	%i5
	fsrc2s	%f27,	%f1
	fmovse	%xcc,	%f17,	%f17
	ldx	[%l7 + 0x08],	%g4
	ld	[%l7 + 0x54],	%f0
	fmovrsgez	%i7,	%f7,	%f4
	lduw	[%l7 + 0x34],	%o1
	ld	[%l7 + 0x50],	%f26
	fmovdcc	%xcc,	%f22,	%f8
	fmovrslz	%l6,	%f1,	%f7
	umul	%i2,	0x1519,	%g7
	and	%o3,	%i0,	%i6
	edge16ln	%o5,	%g5,	%o0
	edge16n	%g1,	%i1,	%g3
	edge16l	%l0,	%g2,	%i4
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	fmovdgu	%icc,	%f14,	%f27
	fmovdg	%icc,	%f20,	%f3
	orn	%l4,	%o2,	%l1
	addcc	%o6,	%l2,	%g6
	lduw	[%l7 + 0x28],	%l5
	umul	%i3,	0x0BF5,	%o7
	udiv	%i5,	0x0E6C,	%g4
	andncc	%o1,	%l6,	%i7
	srl	%i2,	%g7,	%o3
	fmovdvs	%icc,	%f15,	%f22
	ldx	[%l7 + 0x40],	%i6
	edge32	%i0,	%o5,	%g5
	restore %o0, 0x1EFB, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i1,	0x0E,	%g3
	subccc	%l0,	%g2,	%i4
	xnor	%l3,	0x157D,	%l4
	fnot2s	%f10,	%f5
	edge16	%o4,	%o2,	%l1
	fmul8ulx16	%f8,	%f18,	%f28
	srlx	%o6,	0x19,	%g6
	stx	%l2,	[%l7 + 0x40]
	movn	%xcc,	%l5,	%o7
	mulx	%i3,	0x00C8,	%i5
	fxnor	%f4,	%f24,	%f16
	fmovrdgez	%o1,	%f2,	%f30
	mulscc	%l6,	0x14E9,	%g4
	movvc	%icc,	%i2,	%i7
	fnegd	%f18,	%f4
	addc	%o3,	%g7,	%i6
	srlx	%o5,	%g5,	%i0
	stb	%o0,	[%l7 + 0x32]
	andncc	%g1,	%i1,	%g3
	fmul8sux16	%f20,	%f18,	%f26
	orncc	%l0,	%i4,	%g2
	st	%f27,	[%l7 + 0x28]
	alignaddr	%l3,	%o4,	%l4
	fabsd	%f10,	%f30
	sdivcc	%l1,	0x082F,	%o2
	fornot2	%f10,	%f20,	%f6
	edge16n	%g6,	%l2,	%l5
	xnorcc	%o7,	%i3,	%o6
	sth	%i5,	[%l7 + 0x4C]
	andcc	%l6,	0x1C68,	%o1
	sdivcc	%g4,	0x1421,	%i2
	edge32	%i7,	%o3,	%g7
	ldsw	[%l7 + 0x20],	%i6
	fnands	%f18,	%f0,	%f5
	fpadd32	%f30,	%f6,	%f30
	st	%f22,	[%l7 + 0x48]
	stb	%g5,	[%l7 + 0x2C]
	movrlz	%i0,	0x1E0,	%o0
	sdiv	%o5,	0x1BC9,	%g1
	movle	%xcc,	%g3,	%l0
	std	%f2,	[%l7 + 0x40]
	edge16	%i1,	%g2,	%l3
	fmovse	%icc,	%f6,	%f19
	edge8l	%i4,	%o4,	%l4
	stx	%l1,	[%l7 + 0x28]
	andncc	%g6,	%o2,	%l5
	fands	%f16,	%f27,	%f18
	fmul8x16au	%f13,	%f22,	%f26
	fmovscc	%icc,	%f26,	%f3
	movg	%icc,	%o7,	%i3
	fmovrde	%l2,	%f28,	%f24
	std	%f22,	[%l7 + 0x68]
	ldd	[%l7 + 0x48],	%o6
	fnot2	%f30,	%f10
	orn	%i5,	%l6,	%o1
	fmovspos	%xcc,	%f12,	%f31
	ldd	[%l7 + 0x78],	%i2
	st	%f9,	[%l7 + 0x44]
	fmul8x16au	%f9,	%f25,	%f6
	fmovsneg	%icc,	%f25,	%f4
	andn	%g4,	0x157F,	%i7
	mulx	%g7,	%i6,	%o3
	andncc	%g5,	%o0,	%o5
	fmovdcs	%icc,	%f8,	%f2
	lduw	[%l7 + 0x14],	%i0
	smulcc	%g1,	0x1B77,	%g3
	movn	%xcc,	%l0,	%g2
	array16	%i1,	%l3,	%i4
	edge8ln	%l4,	%o4,	%l1
	move	%icc,	%g6,	%o2
	subcc	%l5,	%o7,	%l2
	addccc	%o6,	%i5,	%i3
	fmuld8ulx16	%f15,	%f22,	%f20
	movvs	%xcc,	%o1,	%i2
	orcc	%g4,	0x12E9,	%i7
	movgu	%icc,	%g7,	%i6
	srlx	%l6,	0x19,	%o3
	movl	%xcc,	%o0,	%o5
	movne	%xcc,	%g5,	%g1
	sdivcc	%g3,	0x003E,	%l0
	ld	[%l7 + 0x5C],	%f30
	fmovrde	%i0,	%f2,	%f12
	fcmped	%fcc2,	%f4,	%f28
	std	%f26,	[%l7 + 0x20]
	ld	[%l7 + 0x7C],	%f14
	fxnors	%f3,	%f21,	%f3
	fpsub16s	%f30,	%f23,	%f8
	udivx	%i1,	0x1D1C,	%l3
	movrgz	%i4,	0x14B,	%g2
	array8	%l4,	%l1,	%g6
	movvc	%xcc,	%o4,	%o2
	fabss	%f24,	%f13
	lduh	[%l7 + 0x62],	%l5
	movle	%xcc,	%l2,	%o6
	sth	%i5,	[%l7 + 0x10]
	fnot2s	%f0,	%f29
	movpos	%icc,	%o7,	%i3
	smulcc	%i2,	%o1,	%i7
	movrgz	%g7,	0x3C5,	%g4
	add	%l6,	%o3,	%o0
	edge32l	%i6,	%g5,	%g1
	movn	%icc,	%o5,	%g3
	fmovrslez	%l0,	%f13,	%f11
	andcc	%i0,	0x1844,	%l3
	srl	%i4,	%i1,	%g2
	fornot2	%f18,	%f14,	%f30
	smul	%l1,	%g6,	%l4
	ldub	[%l7 + 0x0A],	%o2
	movleu	%icc,	%o4,	%l5
	movle	%xcc,	%l2,	%o6
	movrgz	%i5,	%o7,	%i3
	fmul8ulx16	%f4,	%f30,	%f22
	addc	%o1,	%i2,	%g7
	fmovrdlez	%i7,	%f0,	%f0
	alignaddrl	%g4,	%l6,	%o3
	udiv	%i6,	0x1EDE,	%g5
	smul	%o0,	0x1730,	%o5
	sra	%g1,	0x11,	%g3
	edge16n	%l0,	%l3,	%i0
	save %i4, 0x17DE, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g2,	%g6
	ldsw	[%l7 + 0x58],	%l1
	smul	%l4,	0x1847,	%o4
	srlx	%o2,	0x18,	%l5
	umul	%o6,	0x14C7,	%l2
	sir	0x0C3E
	lduw	[%l7 + 0x10],	%o7
	fnot1s	%f19,	%f1
	std	%f12,	[%l7 + 0x18]
	edge8	%i5,	%o1,	%i2
	srax	%g7,	%i3,	%i7
	fxnors	%f27,	%f0,	%f28
	lduw	[%l7 + 0x24],	%l6
	siam	0x4
	edge8n	%g4,	%i6,	%g5
	fmovsneg	%icc,	%f28,	%f14
	stb	%o3,	[%l7 + 0x4F]
	fxor	%f16,	%f20,	%f22
	fmovdn	%xcc,	%f30,	%f6
	movg	%xcc,	%o5,	%g1
	edge32l	%o0,	%l0,	%l3
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	fmovrdgz	%i0,	%f18,	%f0
	movle	%xcc,	%g2,	%g6
	bshuffle	%f8,	%f18,	%f20
	ld	[%l7 + 0x1C],	%f27
	edge16ln	%l1,	%i1,	%o4
	fmovs	%f10,	%f27
	sllx	%l4,	%l5,	%o2
	edge32l	%o6,	%l2,	%o7
	ldsw	[%l7 + 0x5C],	%i5
	movneg	%icc,	%o1,	%g7
	movre	%i3,	%i2,	%l6
	mulx	%i7,	0x11B9,	%g4
	movrlz	%g5,	0x0D6,	%o3
	movleu	%icc,	%i6,	%g1
	and	%o5,	0x0677,	%l0
	movrlz	%o0,	%g3,	%i4
	orn	%i0,	%g2,	%l3
	mova	%icc,	%l1,	%i1
	array32	%o4,	%l4,	%g6
	fmovrsne	%o2,	%f15,	%f8
	smul	%o6,	%l5,	%o7
	addccc	%l2,	%i5,	%o1
	edge8l	%i3,	%g7,	%l6
	fnand	%f4,	%f16,	%f24
	movrne	%i2,	%i7,	%g5
	edge32	%g4,	%o3,	%g1
	fandnot1s	%f8,	%f20,	%f18
	edge32ln	%o5,	%l0,	%i6
	ldsb	[%l7 + 0x53],	%g3
	and	%i4,	%o0,	%i0
	sir	0x16E9
	edge16	%g2,	%l1,	%l3
	smulcc	%o4,	%l4,	%i1
	fmuld8sux16	%f28,	%f27,	%f4
	orncc	%g6,	%o6,	%l5
	orncc	%o7,	0x1514,	%o2
	sll	%i5,	%o1,	%l2
	edge32l	%g7,	%l6,	%i2
	xorcc	%i7,	%i3,	%g5
	save %g4, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l0,	0x0F93,	%i6
	smulcc	%g1,	0x01AE,	%i4
	movl	%xcc,	%g3,	%i0
	sdivx	%g2,	0x0951,	%l1
	xnor	%o0,	%o4,	%l3
	nop
	set	0x08, %o4
	stx	%l4,	[%l7 + %o4]
	ldub	[%l7 + 0x50],	%i1
	movrlez	%g6,	%l5,	%o6
	edge32n	%o7,	%i5,	%o2
	edge32ln	%l2,	%g7,	%l6
	xor	%i2,	%i7,	%i3
	addccc	%o1,	0x0208,	%g5
	fcmpne16	%f2,	%f6,	%o3
	fxnors	%f7,	%f11,	%f5
	move	%xcc,	%g4,	%o5
	fmovscc	%icc,	%f9,	%f19
	array16	%i6,	%g1,	%l0
	smul	%g3,	%i0,	%i4
	fpack16	%f22,	%f30
	fone	%f2
	fmovdle	%icc,	%f1,	%f29
	ldsb	[%l7 + 0x34],	%g2
	movvc	%xcc,	%l1,	%o4
	nop
	set	0x08, %o5
	stw	%o0,	[%l7 + %o5]
	edge8l	%l3,	%l4,	%i1
	xorcc	%g6,	0x08E3,	%o6
	array16	%l5,	%o7,	%i5
	edge32	%l2,	%o2,	%l6
	lduw	[%l7 + 0x10],	%g7
	subccc	%i2,	%i7,	%o1
	fmovdcs	%xcc,	%f27,	%f8
	subcc	%g5,	%o3,	%i3
	edge32ln	%g4,	%i6,	%g1
	save %l0, %g3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o5,	%i4
	edge32ln	%g2,	%o4,	%o0
	fmovsn	%icc,	%f1,	%f1
	subc	%l3,	%l4,	%l1
	fands	%f9,	%f14,	%f1
	andncc	%i1,	%o6,	%l5
	lduh	[%l7 + 0x7C],	%o7
	movre	%g6,	%l2,	%o2
	orncc	%l6,	0x0A0F,	%i5
	fcmps	%fcc3,	%f6,	%f10
	mulx	%i2,	%i7,	%g7
	movl	%icc,	%g5,	%o3
	addc	%i3,	%o1,	%g4
	edge8l	%i6,	%g1,	%l0
	movleu	%icc,	%g3,	%i0
	restore %o5, %i4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o0,	0x0E7D,	%l3
	fmovrse	%g2,	%f22,	%f7
	udivx	%l4,	0x12D6,	%i1
	movn	%icc,	%l1,	%l5
	ldd	[%l7 + 0x78],	%f2
	fxor	%f4,	%f2,	%f2
	fmovs	%f5,	%f14
	edge16ln	%o7,	%g6,	%l2
	lduw	[%l7 + 0x6C],	%o2
	fxor	%f12,	%f6,	%f14
	ldsw	[%l7 + 0x38],	%o6
	fmovdg	%xcc,	%f6,	%f28
	fcmple16	%f12,	%f24,	%i5
	movvc	%xcc,	%i2,	%l6
	sll	%g7,	%g5,	%o3
	andcc	%i3,	0x005A,	%i7
	andn	%g4,	%i6,	%g1
	edge16n	%o1,	%g3,	%i0
	movle	%xcc,	%l0,	%i4
	lduh	[%l7 + 0x1C],	%o5
	subccc	%o0,	0x140C,	%o4
	lduw	[%l7 + 0x78],	%g2
	mova	%xcc,	%l4,	%i1
	udivx	%l3,	0x13D1,	%l1
	move	%xcc,	%o7,	%l5
	fsrc1	%f0,	%f0
	stx	%g6,	[%l7 + 0x08]
	movne	%icc,	%o2,	%o6
	movle	%xcc,	%i5,	%l2
	srl	%l6,	%i2,	%g5
	movrgz	%o3,	0x384,	%i3
	sth	%g7,	[%l7 + 0x7C]
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fpmerge	%f2,	%f22,	%f20
	edge16	%i6,	%o1,	%g3
	edge16n	%g1,	%l0,	%i4
	sdiv	%i0,	0x0AF3,	%o0
	smul	%o4,	%g2,	%l4
	movvs	%xcc,	%i1,	%l3
	udivx	%l1,	0x1484,	%o7
	array8	%o5,	%l5,	%g6
	umulcc	%o6,	0x1FC9,	%o2
	movne	%xcc,	%l2,	%i5
	andn	%i2,	%g5,	%l6
	fcmpeq32	%f20,	%f2,	%i3
	sub	%g7,	0x14FE,	%o3
	movrgez	%g4,	%i6,	%o1
	sra	%i7,	%g3,	%l0
	movle	%xcc,	%i4,	%i0
	fmovdneg	%xcc,	%f27,	%f9
	fmovdleu	%icc,	%f4,	%f6
	andcc	%o0,	%o4,	%g2
	popc	0x121A,	%g1
	movvs	%icc,	%i1,	%l3
	sub	%l1,	0x0455,	%l4
	edge32ln	%o5,	%o7,	%l5
	edge32l	%g6,	%o2,	%l2
	movl	%xcc,	%o6,	%i5
	sdivcc	%i2,	0x07EC,	%l6
	ldsw	[%l7 + 0x30],	%i3
	edge16l	%g5,	%g7,	%o3
	stx	%i6,	[%l7 + 0x38]
	fmovsleu	%xcc,	%f23,	%f7
	subcc	%g4,	%i7,	%g3
	movleu	%icc,	%o1,	%l0
	edge32	%i0,	%o0,	%o4
	fpackfix	%f30,	%f20
	movrlz	%g2,	0x113,	%i4
	stw	%g1,	[%l7 + 0x7C]
	fmovscc	%xcc,	%f28,	%f5
	edge16	%i1,	%l3,	%l4
	sir	0x0AE6
	movleu	%icc,	%o5,	%l1
	andn	%l5,	%o7,	%g6
	fmovspos	%xcc,	%f5,	%f21
	fornot2	%f20,	%f18,	%f16
	movn	%icc,	%o2,	%l2
	orcc	%o6,	0x14E8,	%i5
	movle	%icc,	%i2,	%i3
	sdiv	%g5,	0x0093,	%g7
	fpsub16	%f6,	%f10,	%f26
	ld	[%l7 + 0x78],	%f1
	fcmpeq32	%f2,	%f10,	%l6
	ldsw	[%l7 + 0x68],	%o3
	nop
	set	0x10, %l1
	stb	%i6,	[%l7 + %l1]
	sdiv	%i7,	0x0FBF,	%g4
	st	%f17,	[%l7 + 0x68]
	stb	%g3,	[%l7 + 0x66]
	srax	%l0,	%i0,	%o1
	sllx	%o0,	%g2,	%i4
	move	%xcc,	%g1,	%i1
	stx	%l3,	[%l7 + 0x40]
	pdist	%f30,	%f18,	%f4
	movge	%xcc,	%o4,	%l4
	lduw	[%l7 + 0x2C],	%l1
	edge8n	%l5,	%o7,	%g6
	fxors	%f18,	%f27,	%f17
	popc	%o5,	%o2
	subc	%o6,	0x0015,	%i5
	fcmpd	%fcc0,	%f30,	%f30
	mova	%icc,	%i2,	%i3
	fmovdn	%xcc,	%f15,	%f11
	move	%icc,	%g5,	%g7
	fmovsge	%xcc,	%f15,	%f27
	movneg	%icc,	%l6,	%l2
	edge16l	%o3,	%i6,	%i7
	smulcc	%g3,	0x0936,	%l0
	nop
	set	0x22, %i7
	ldsb	[%l7 + %i7],	%i0
	sth	%g4,	[%l7 + 0x7E]
	movle	%icc,	%o1,	%g2
	lduh	[%l7 + 0x24],	%o0
	edge16n	%i4,	%i1,	%g1
	movg	%icc,	%o4,	%l4
	xnor	%l1,	0x1712,	%l5
	nop
	set	0x38, %l0
	stx	%l3,	[%l7 + %l0]
	srlx	%o7,	0x1C,	%o5
	ldub	[%l7 + 0x28],	%g6
	fnors	%f15,	%f22,	%f6
	array32	%o2,	%o6,	%i5
	xor	%i2,	0x10E8,	%i3
	edge32	%g5,	%g7,	%l2
	umul	%o3,	%i6,	%i7
	alignaddrl	%g3,	%l0,	%l6
	fornot1	%f14,	%f10,	%f8
	addcc	%g4,	0x04E6,	%o1
	ldsb	[%l7 + 0x4E],	%i0
	movvs	%icc,	%g2,	%i4
	movle	%xcc,	%o0,	%g1
	movneg	%icc,	%i1,	%l4
	xor	%l1,	0x14F8,	%l5
	sub	%o4,	%o7,	%l3
	edge8n	%g6,	%o2,	%o6
	sub	%i5,	0x1CC0,	%o5
	stw	%i2,	[%l7 + 0x54]
	umulcc	%i3,	%g7,	%g5
	fmovrslz	%o3,	%f8,	%f1
	fxnors	%f9,	%f7,	%f1
	ldsb	[%l7 + 0x0E],	%i6
	umulcc	%l2,	0x014C,	%i7
	movcs	%icc,	%g3,	%l0
	mulscc	%g4,	%l6,	%o1
	xnorcc	%g2,	%i4,	%o0
	edge32n	%i0,	%g1,	%l4
	fcmps	%fcc1,	%f17,	%f25
	fmovscs	%xcc,	%f5,	%f18
	subc	%l1,	%l5,	%o4
	fpsub32s	%f27,	%f3,	%f20
	orn	%o7,	0x04EE,	%i1
	edge32l	%l3,	%o2,	%o6
	udivx	%g6,	0x1DB7,	%o5
	movrne	%i5,	%i3,	%g7
	fmovscs	%icc,	%f7,	%f19
	andn	%i2,	%g5,	%o3
	stw	%l2,	[%l7 + 0x74]
	move	%icc,	%i7,	%g3
	srlx	%i6,	%l0,	%l6
	fpsub16s	%f27,	%f7,	%f30
	sub	%o1,	%g2,	%i4
	ld	[%l7 + 0x4C],	%f31
	subccc	%g4,	0x1132,	%i0
	movn	%icc,	%g1,	%l4
	popc	%o0,	%l1
	udivx	%o4,	0x0F7D,	%l5
	fmovspos	%icc,	%f3,	%f15
	subcc	%o7,	0x0DE5,	%l3
	mulscc	%o2,	%i1,	%o6
	movrne	%g6,	%o5,	%i3
	fmuld8sux16	%f27,	%f23,	%f16
	edge32l	%i5,	%i2,	%g5
	xorcc	%o3,	%g7,	%l2
	lduw	[%l7 + 0x2C],	%i7
	srlx	%g3,	0x14,	%i6
	smulcc	%l0,	0x1FC0,	%o1
	movvc	%icc,	%l6,	%i4
	movcs	%icc,	%g4,	%g2
	movpos	%xcc,	%i0,	%g1
	srlx	%l4,	0x11,	%l1
	movg	%xcc,	%o4,	%o0
	srlx	%l5,	%l3,	%o2
	movre	%i1,	%o7,	%o6
	or	%g6,	0x0FD2,	%o5
	array8	%i5,	%i3,	%g5
	fmovd	%f8,	%f20
	edge16ln	%o3,	%g7,	%i2
	srlx	%l2,	0x1F,	%i7
	lduh	[%l7 + 0x10],	%i6
	andn	%l0,	%g3,	%o1
	xnorcc	%i4,	0x153E,	%g4
	stx	%g2,	[%l7 + 0x48]
	fmovsle	%xcc,	%f16,	%f3
	save %i0, %l6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l1,	%o4,	%g1
	nop
	set	0x64, %i1
	ldsw	[%l7 + %i1],	%o0
	xor	%l3,	%l5,	%o2
	orn	%o7,	0x1F41,	%i1
	movle	%xcc,	%g6,	%o6
	ldsb	[%l7 + 0x7A],	%i5
	mulx	%i3,	%g5,	%o3
	st	%f21,	[%l7 + 0x3C]
	movneg	%xcc,	%o5,	%i2
	array16	%l2,	%i7,	%g7
	ldd	[%l7 + 0x38],	%i6
	movge	%xcc,	%g3,	%o1
	movgu	%icc,	%i4,	%l0
	sdivx	%g4,	0x11BE,	%g2
	move	%xcc,	%i0,	%l6
	subcc	%l4,	0x140C,	%l1
	movn	%xcc,	%o4,	%o0
	sll	%l3,	%g1,	%l5
	fmovdge	%icc,	%f27,	%f8
	fones	%f10
	movne	%xcc,	%o2,	%i1
	ldub	[%l7 + 0x69],	%g6
	fmul8x16au	%f19,	%f31,	%f28
	udivx	%o7,	0x1E43,	%i5
	alignaddrl	%i3,	%o6,	%o3
	addcc	%o5,	%i2,	%g5
	orcc	%i7,	%l2,	%i6
	fpsub32	%f2,	%f12,	%f8
	fmovrslez	%g7,	%f12,	%f22
	sub	%g3,	%o1,	%l0
	andcc	%i4,	%g2,	%g4
	umul	%l6,	%l4,	%l1
	movleu	%xcc,	%o4,	%o0
	fpsub16s	%f18,	%f16,	%f4
	umulcc	%l3,	0x1B35,	%g1
	andn	%l5,	%o2,	%i1
	movneg	%xcc,	%g6,	%o7
	alignaddr	%i5,	%i3,	%o6
	subcc	%i0,	%o3,	%o5
	edge16ln	%i2,	%g5,	%l2
	fmovsle	%xcc,	%f20,	%f27
	mulx	%i7,	0x0A3B,	%i6
	array8	%g3,	%g7,	%l0
	edge32ln	%o1,	%i4,	%g4
	andncc	%l6,	%g2,	%l1
	fpmerge	%f26,	%f28,	%f10
	movcc	%icc,	%o4,	%l4
	movre	%o0,	%l3,	%l5
	fmovrdgez	%o2,	%f8,	%f22
	orcc	%g1,	0x0B9F,	%g6
	fornot1s	%f7,	%f8,	%f22
	array8	%i1,	%i5,	%o7
	sethi	0x012D,	%o6
	sllx	%i3,	0x19,	%o3
	umulcc	%i0,	%o5,	%i2
	save %g5, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i6,	0x01A4,	%g7
	orncc	%l0,	0x18BE,	%o1
	mulscc	%g3,	%g4,	%i4
	fnot2	%f4,	%f6
	fmovsl	%icc,	%f29,	%f20
	edge16ln	%g2,	%l1,	%l6
	sdiv	%o4,	0x1ACD,	%o0
	fmovda	%xcc,	%f5,	%f31
	ldx	[%l7 + 0x70],	%l4
	smul	%l3,	0x1777,	%o2
	addcc	%g1,	0x03F7,	%g6
	mulscc	%i1,	%l5,	%i5
	sra	%o6,	0x1C,	%o7
	edge32ln	%i3,	%i0,	%o5
	sir	0x061E
	sllx	%i2,	%g5,	%o3
	stb	%l2,	[%l7 + 0x62]
	ldsw	[%l7 + 0x6C],	%i6
	srax	%g7,	0x16,	%l0
	fcmpes	%fcc1,	%f27,	%f8
	edge8ln	%o1,	%g3,	%i7
	fcmpgt16	%f8,	%f10,	%i4
	movre	%g4,	0x025,	%g2
	edge16ln	%l1,	%o4,	%o0
	fpack16	%f28,	%f18
	movge	%xcc,	%l4,	%l6
	movn	%icc,	%l3,	%o2
	andncc	%g1,	%i1,	%g6
	sdiv	%i5,	0x1BF4,	%o6
	stw	%l5,	[%l7 + 0x60]
	ldd	[%l7 + 0x68],	%i2
	fnand	%f20,	%f28,	%f22
	umul	%o7,	%i0,	%i2
	umulcc	%g5,	%o5,	%o3
	fandnot1s	%f26,	%f16,	%f8
	andcc	%i6,	%g7,	%l2
	fmul8x16au	%f13,	%f10,	%f24
	st	%f6,	[%l7 + 0x28]
	ldub	[%l7 + 0x72],	%l0
	restore %g3, 0x0E56, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i4,	%g4,	%g2
	fnegd	%f12,	%f10
	andncc	%o1,	%o4,	%o0
	edge32	%l4,	%l1,	%l6
	movrgez	%l3,	%g1,	%i1
	stb	%g6,	[%l7 + 0x79]
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%i4
	stx	%o2,	[%l7 + 0x30]
	edge32	%o6,	%l5,	%i3
	fmul8x16al	%f26,	%f19,	%f28
	sir	0x1458
	ld	[%l7 + 0x20],	%f14
	smulcc	%i0,	%o7,	%i2
	move	%xcc,	%o5,	%o3
	fpsub16	%f0,	%f22,	%f18
	movgu	%icc,	%i6,	%g5
	edge8ln	%g7,	%l2,	%l0
	andncc	%g3,	%i7,	%g4
	add	%g2,	0x0F4A,	%o1
	faligndata	%f22,	%f10,	%f16
	alignaddr	%i4,	%o0,	%l4
	movg	%icc,	%o4,	%l1
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	movg	%xcc,	%l6,	%g6
	mulx	%i1,	0x0E50,	%o2
	subc	%i5,	0x0312,	%o6
	fmovrde	%l5,	%f16,	%f4
	ldd	[%l7 + 0x50],	%i0
	save %o7, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x10]
	array16	%o3,	%i6,	%o5
	movcs	%icc,	%g5,	%g7
	movgu	%icc,	%l2,	%g3
	sdivcc	%i7,	0x1D99,	%g4
	addccc	%g2,	%o1,	%l0
	fornot1s	%f4,	%f7,	%f11
	stw	%o0,	[%l7 + 0x28]
	andcc	%l4,	0x18D1,	%o4
	array16	%l1,	%l3,	%g1
	edge32ln	%i4,	%g6,	%i1
	fnegs	%f4,	%f24
	addc	%l6,	%o2,	%o6
	popc	0x0CCB,	%l5
	movn	%icc,	%i5,	%i0
	sub	%i2,	0x0C99,	%o7
	fcmpgt32	%f14,	%f0,	%i3
	fnot2	%f8,	%f8
	std	%f14,	[%l7 + 0x30]
	andncc	%i6,	%o5,	%g5
	ldsh	[%l7 + 0x3A],	%o3
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f0
	array8	%l2,	%g7,	%i7
	ldx	[%l7 + 0x60],	%g3
	orcc	%g2,	0x032C,	%g4
	siam	0x3
	edge32l	%o1,	%o0,	%l0
	andn	%o4,	0x1D22,	%l1
	fmovdcc	%icc,	%f13,	%f21
	fnot1	%f16,	%f12
	xnorcc	%l3,	0x1465,	%l4
	fand	%f12,	%f2,	%f16
	or	%g1,	%g6,	%i1
	movre	%l6,	0x1EA,	%i4
	fmovsg	%icc,	%f25,	%f10
	sir	0x1178
	xnor	%o6,	0x1B39,	%l5
	stw	%i5,	[%l7 + 0x2C]
	orncc	%i0,	%i2,	%o2
	sub	%o7,	0x186E,	%i3
	movrgez	%i6,	0x23D,	%g5
	smulcc	%o5,	0x1C55,	%o3
	smul	%l2,	0x1B00,	%i7
	std	%f0,	[%l7 + 0x68]
	srlx	%g3,	%g7,	%g4
	umul	%g2,	0x049F,	%o0
	mulscc	%o1,	0x0C8C,	%l0
	st	%f10,	[%l7 + 0x70]
	movrlez	%l1,	0x04A,	%o4
	fmovrdgez	%l4,	%f26,	%f2
	fmuld8ulx16	%f26,	%f16,	%f4
	fxors	%f12,	%f0,	%f15
	fpadd32	%f6,	%f6,	%f0
	srlx	%l3,	0x00,	%g1
	ldx	[%l7 + 0x70],	%i1
	andncc	%l6,	%i4,	%o6
	fcmpeq32	%f12,	%f30,	%g6
	move	%xcc,	%i5,	%l5
	sdiv	%i2,	0x00BB,	%i0
	and	%o2,	%o7,	%i3
	edge8ln	%i6,	%o5,	%o3
	edge16n	%l2,	%i7,	%g5
	fpsub32	%f26,	%f8,	%f28
	movrne	%g3,	%g4,	%g2
	fmul8x16	%f2,	%f12,	%f26
	edge16n	%g7,	%o0,	%l0
	sll	%l1,	%o1,	%l4
	edge8n	%o4,	%l3,	%g1
	srax	%i1,	0x19,	%i4
	movneg	%icc,	%l6,	%o6
	array32	%i5,	%g6,	%i2
	andn	%i0,	0x1501,	%l5
	and	%o2,	%o7,	%i6
	edge32l	%o5,	%o3,	%l2
	edge16ln	%i3,	%i7,	%g3
	fandnot2s	%f13,	%f24,	%f4
	subc	%g4,	%g2,	%g7
	edge32ln	%g5,	%l0,	%l1
	srl	%o0,	0x00,	%o1
	fxors	%f12,	%f4,	%f18
	ldsb	[%l7 + 0x62],	%l4
	sth	%o4,	[%l7 + 0x1A]
	edge8	%l3,	%g1,	%i4
	movcs	%xcc,	%i1,	%o6
	fmovspos	%xcc,	%f18,	%f11
	umul	%l6,	%g6,	%i5
	fcmps	%fcc3,	%f4,	%f5
	fnegd	%f18,	%f18
	fornot2s	%f1,	%f15,	%f12
	fpadd32	%f30,	%f26,	%f0
	sub	%i2,	0x1065,	%l5
	and	%o2,	0x157B,	%o7
	fmovsne	%xcc,	%f16,	%f27
	fmovrdlez	%i6,	%f30,	%f24
	sdivcc	%o5,	0x08EB,	%o3
	movg	%xcc,	%i0,	%l2
	fmovsleu	%xcc,	%f6,	%f7
	udivcc	%i7,	0x153A,	%i3
	andn	%g3,	0x0D87,	%g2
	sll	%g7,	%g5,	%l0
	fmovsneg	%icc,	%f2,	%f16
	array16	%g4,	%o0,	%l1
	ldd	[%l7 + 0x28],	%o0
	fandnot1s	%f8,	%f2,	%f17
	fpadd32	%f28,	%f28,	%f8
	movcs	%xcc,	%o4,	%l4
	fcmple16	%f26,	%f0,	%l3
	fandnot1s	%f26,	%f17,	%f7
	fmovse	%xcc,	%f10,	%f29
	srax	%g1,	%i1,	%i4
	sir	0x065D
	movrlez	%l6,	0x029,	%g6
	orn	%o6,	%i2,	%l5
	fmovrslz	%o2,	%f11,	%f1
	addcc	%i5,	0x1D6B,	%o7
	movvs	%icc,	%o5,	%o3
	xnorcc	%i0,	0x074C,	%l2
	orncc	%i7,	0x0B4B,	%i6
	smulcc	%g3,	%g2,	%i3
	mova	%icc,	%g5,	%g7
	movvc	%xcc,	%l0,	%o0
	sllx	%g4,	0x0A,	%l1
	udivcc	%o4,	0x1472,	%l4
	movl	%icc,	%o1,	%l3
	fsrc2s	%f31,	%f13
	movrgz	%i1,	%i4,	%l6
	sdivcc	%g6,	0x16B2,	%o6
	udiv	%i2,	0x0A99,	%l5
	fmovdgu	%icc,	%f9,	%f24
	restore %g1, 0x15C4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f13,	%f23
	xnorcc	%o7,	0x0856,	%o2
	ldsb	[%l7 + 0x4E],	%o3
	fmovrdgez	%o5,	%f12,	%f18
	ldub	[%l7 + 0x23],	%i0
	subc	%i7,	%i6,	%l2
	sllx	%g2,	%i3,	%g5
	addccc	%g3,	%l0,	%o0
	or	%g4,	0x0F59,	%g7
	nop
	set	0x39, %i4
	ldsb	[%l7 + %i4],	%o4
	array16	%l4,	%o1,	%l3
	array16	%i1,	%i4,	%l6
	fmovdleu	%xcc,	%f18,	%f22
	sth	%l1,	[%l7 + 0x4A]
	alignaddrl	%g6,	%o6,	%l5
	orcc	%i2,	0x02EA,	%i5
	edge16l	%o7,	%o2,	%o3
	subcc	%g1,	0x073D,	%i0
	movre	%i7,	%i6,	%o5
	sllx	%g2,	0x1E,	%i3
	orn	%l2,	0x0CF7,	%g5
	movvs	%xcc,	%l0,	%g3
	srax	%o0,	%g4,	%g7
	movrgz	%l4,	0x096,	%o1
	sdiv	%o4,	0x12A8,	%i1
	smul	%i4,	0x1F62,	%l6
	xor	%l1,	%g6,	%o6
	stb	%l5,	[%l7 + 0x7A]
	fpackfix	%f24,	%f14
	fexpand	%f15,	%f28
	fmovsvc	%xcc,	%f22,	%f4
	movrgez	%l3,	%i2,	%o7
	sub	%o2,	%i5,	%o3
	stx	%i0,	[%l7 + 0x40]
	movleu	%xcc,	%i7,	%i6
	mulscc	%g1,	0x1E5E,	%g2
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%i3
	array32	%o5,	%l2,	%g5
	sir	0x16F7
	movre	%l0,	0x2B6,	%o0
	umul	%g3,	%g7,	%g4
	fmovdcs	%icc,	%f30,	%f14
	sth	%l4,	[%l7 + 0x38]
	subcc	%o1,	0x0CCD,	%i1
	srl	%i4,	%l6,	%o4
	subc	%l1,	0x1D48,	%g6
	sllx	%l5,	0x1B,	%o6
	movvs	%icc,	%i2,	%o7
	edge16	%l3,	%i5,	%o3
	fexpand	%f11,	%f6
	edge16l	%o2,	%i0,	%i7
	alignaddr	%g1,	%g2,	%i6
	srl	%o5,	0x14,	%l2
	subcc	%i3,	0x1773,	%g5
	fzeros	%f23
	move	%xcc,	%o0,	%g3
	fabss	%f30,	%f17
	udiv	%l0,	0x10D3,	%g7
	orn	%l4,	%o1,	%i1
	fcmple16	%f18,	%f18,	%g4
	srax	%l6,	0x06,	%o4
	stx	%i4,	[%l7 + 0x50]
	umul	%l1,	0x0C60,	%g6
	movcc	%icc,	%l5,	%o6
	andn	%i2,	%l3,	%i5
	subccc	%o3,	0x0B33,	%o2
	fpsub32	%f20,	%f28,	%f28
	fmovdgu	%xcc,	%f23,	%f27
	sdivcc	%o7,	0x1E8C,	%i7
	fmovsa	%xcc,	%f31,	%f26
	mova	%icc,	%g1,	%i0
	fmovdn	%icc,	%f1,	%f28
	movrgez	%g2,	0x110,	%i6
	sll	%l2,	%i3,	%g5
	ldub	[%l7 + 0x77],	%o0
	fmovs	%f11,	%f8
	addccc	%o5,	%l0,	%g7
	fmovscc	%xcc,	%f6,	%f9
	addc	%l4,	%o1,	%g3
	fcmpgt16	%f18,	%f16,	%i1
	addccc	%l6,	0x11A2,	%o4
	movcc	%xcc,	%g4,	%l1
	add	%i4,	%g6,	%o6
	or	%i2,	0x1821,	%l3
	ldsb	[%l7 + 0x67],	%i5
	array16	%l5,	%o3,	%o7
	addcc	%i7,	0x15EF,	%g1
	udivcc	%o2,	0x1B33,	%g2
	smulcc	%i6,	0x07CD,	%i0
	movvs	%icc,	%l2,	%g5
	array16	%i3,	%o5,	%o0
	fcmpes	%fcc2,	%f3,	%f22
	movne	%xcc,	%l0,	%l4
	movre	%g7,	0x0F4,	%g3
	xorcc	%o1,	%l6,	%o4
	sdiv	%i1,	0x03C5,	%g4
	fcmpeq32	%f2,	%f2,	%i4
	movvs	%xcc,	%l1,	%o6
	addcc	%g6,	%l3,	%i5
	fmovsge	%icc,	%f17,	%f15
	movrne	%l5,	0x0B3,	%i2
	siam	0x3
	sub	%o7,	%i7,	%o3
	mova	%icc,	%o2,	%g1
	subccc	%g2,	%i6,	%l2
	edge32ln	%g5,	%i0,	%o5
	umulcc	%o0,	%i3,	%l0
	or	%g7,	0x102A,	%l4
	fmovdgu	%icc,	%f14,	%f12
	movcs	%icc,	%g3,	%o1
	movrgz	%l6,	0x39B,	%i1
	fcmpne32	%f10,	%f18,	%o4
	movre	%i4,	%l1,	%g4
	fabsd	%f0,	%f6
	addccc	%o6,	%g6,	%i5
	fmovsvs	%icc,	%f14,	%f21
	array16	%l3,	%l5,	%o7
	fmovrse	%i2,	%f26,	%f27
	movneg	%icc,	%o3,	%i7
	smul	%g1,	%g2,	%i6
	srax	%l2,	%g5,	%i0
	movcs	%xcc,	%o2,	%o5
	ldsb	[%l7 + 0x49],	%i3
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%l0
	st	%f8,	[%l7 + 0x78]
	fnors	%f10,	%f23,	%f14
	srax	%o0,	0x1D,	%g7
	sdivcc	%g3,	0x1EB2,	%l4
	st	%f24,	[%l7 + 0x20]
	ldub	[%l7 + 0x44],	%l6
	subccc	%o1,	0x1D13,	%o4
	fmuld8sux16	%f31,	%f2,	%f10
	movleu	%xcc,	%i4,	%i1
	fmul8ulx16	%f18,	%f22,	%f12
	move	%xcc,	%l1,	%g4
	edge8n	%o6,	%g6,	%l3
	fmovsvc	%icc,	%f4,	%f8
	sra	%l5,	%o7,	%i2
	nop
	set	0x28, %o1
	std	%f22,	[%l7 + %o1]
	ldub	[%l7 + 0x62],	%i5
	bshuffle	%f2,	%f28,	%f20
	move	%xcc,	%i7,	%g1
	save %g2, 0x1B1B, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f6,	%f18
	ldd	[%l7 + 0x20],	%l2
	fone	%f22
	fmovsneg	%xcc,	%f16,	%f2
	movleu	%icc,	%i6,	%i0
	fpack32	%f14,	%f14,	%f30
	save %g5, 0x1651, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o5,	%i3,	%l0
	stb	%o0,	[%l7 + 0x2D]
	movne	%xcc,	%g3,	%g7
	edge8n	%l6,	%l4,	%o4
	fmovs	%f20,	%f6
	movrne	%o1,	%i4,	%i1
	st	%f10,	[%l7 + 0x6C]
	fandnot2s	%f9,	%f17,	%f23
	movpos	%icc,	%g4,	%l1
	movle	%icc,	%g6,	%l3
	alignaddr	%o6,	%l5,	%o7
	fxors	%f0,	%f4,	%f2
	mulx	%i2,	0x1531,	%i5
	xnor	%i7,	0x1DFE,	%g2
	lduw	[%l7 + 0x34],	%o3
	edge16n	%l2,	%g1,	%i6
	sll	%g5,	%i0,	%o5
	lduh	[%l7 + 0x78],	%i3
	edge32ln	%l0,	%o2,	%g3
	ldd	[%l7 + 0x78],	%o0
	xnor	%l6,	0x1D20,	%l4
	sll	%g7,	0x11,	%o4
	sll	%i4,	%o1,	%i1
	ldx	[%l7 + 0x18],	%l1
	addcc	%g6,	%l3,	%o6
	movrgez	%g4,	%l5,	%i2
	movrne	%i5,	%o7,	%g2
	movg	%icc,	%i7,	%o3
	fxor	%f0,	%f6,	%f8
	movvc	%icc,	%g1,	%i6
	smulcc	%g5,	0x153A,	%i0
	umul	%o5,	0x1B3B,	%i3
	edge32l	%l0,	%o2,	%g3
	movg	%icc,	%l2,	%o0
	fcmpgt32	%f12,	%f2,	%l4
	sub	%l6,	%o4,	%g7
	save %o1, %i1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%f6
	stx	%g6,	[%l7 + 0x68]
	xnor	%l1,	%l3,	%g4
	movl	%xcc,	%l5,	%i2
	movrgez	%i5,	%o6,	%o7
	fors	%f17,	%f28,	%f29
	fzeros	%f8
	fmovrdne	%i7,	%f20,	%f14
	smulcc	%g2,	%g1,	%o3
	addccc	%g5,	0x1100,	%i6
	andcc	%i0,	0x1BE2,	%i3
	fmovsvc	%icc,	%f16,	%f6
	stb	%o5,	[%l7 + 0x3A]
	fmovse	%icc,	%f17,	%f9
	fmovdl	%icc,	%f3,	%f28
	edge8	%o2,	%g3,	%l0
	edge16ln	%l2,	%l4,	%o0
	udivcc	%l6,	0x0516,	%g7
	andn	%o4,	%o1,	%i1
	sra	%g6,	0x04,	%l1
	orcc	%i4,	0x0C36,	%l3
	sub	%g4,	%i2,	%i5
	fmovdge	%xcc,	%f30,	%f4
	sllx	%o6,	%o7,	%l5
	lduh	[%l7 + 0x0C],	%g2
	fmul8x16al	%f9,	%f6,	%f24
	edge16n	%g1,	%o3,	%i7
	andcc	%i6,	%i0,	%g5
	orn	%i3,	0x120C,	%o5
	or	%o2,	%g3,	%l2
	std	%f12,	[%l7 + 0x28]
	smul	%l4,	0x02C1,	%o0
	fpack16	%f28,	%f31
	udivcc	%l0,	0x01B0,	%l6
	save %o4, %o1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f12,	%f30
	movneg	%icc,	%g6,	%i1
	edge16ln	%l1,	%l3,	%i4
	ldub	[%l7 + 0x75],	%g4
	stw	%i5,	[%l7 + 0x2C]
	subc	%o6,	%o7,	%i2
	move	%xcc,	%g2,	%l5
	lduh	[%l7 + 0x22],	%g1
	fcmpgt32	%f6,	%f30,	%o3
	fmovdpos	%icc,	%f25,	%f21
	edge32ln	%i6,	%i7,	%g5
	movle	%xcc,	%i0,	%i3
	nop
	set	0x1C, %g2
	ldsb	[%l7 + %g2],	%o2
	array8	%o5,	%g3,	%l2
	andncc	%o0,	%l4,	%l0
	udivx	%l6,	0x0EBE,	%o1
	array8	%g7,	%g6,	%i1
	fmovdge	%xcc,	%f31,	%f29
	stw	%o4,	[%l7 + 0x7C]
	udivx	%l1,	0x11A9,	%l3
	srl	%i4,	0x00,	%g4
	edge16ln	%i5,	%o6,	%i2
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	and	%g1,	0x0F3A,	%o7
	mova	%icc,	%i6,	%i7
	and	%o3,	0x1CE3,	%i0
	array8	%g5,	%o2,	%o5
	ld	[%l7 + 0x38],	%f21
	udivcc	%i3,	0x1F62,	%g3
	fmovsl	%icc,	%f14,	%f28
	edge16ln	%l2,	%l4,	%l0
	for	%f4,	%f0,	%f18
	movrne	%o0,	%l6,	%g7
	fmovs	%f30,	%f17
	ldsb	[%l7 + 0x2A],	%g6
	movrgez	%i1,	0x0A8,	%o4
	array32	%o1,	%l3,	%l1
	edge16	%i4,	%i5,	%g4
	sth	%o6,	[%l7 + 0x46]
	fandnot2s	%f28,	%f8,	%f28
	movcs	%xcc,	%g2,	%i2
	edge32n	%l5,	%o7,	%i6
	move	%icc,	%g1,	%o3
	fornot1s	%f2,	%f18,	%f1
	sll	%i0,	0x18,	%g5
	fmul8ulx16	%f0,	%f30,	%f4
	alignaddrl	%o2,	%o5,	%i3
	fnot2s	%f8,	%f29
	sethi	0x1E83,	%i7
	movle	%icc,	%g3,	%l2
	array8	%l4,	%o0,	%l0
	umulcc	%g7,	0x0A40,	%g6
	fmovdle	%icc,	%f11,	%f11
	popc	%i1,	%o4
	movgu	%xcc,	%l6,	%o1
	ldsb	[%l7 + 0x0B],	%l3
	edge32	%l1,	%i5,	%g4
	fornot1	%f18,	%f12,	%f30
	sethi	0x0900,	%i4
	or	%g2,	0x16E8,	%o6
	restore %l5, %i2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%g1,	%o3
	xnor	%i0,	0x0C16,	%o2
	edge8ln	%o5,	%i3,	%g5
	movge	%icc,	%i7,	%l2
	ldd	[%l7 + 0x50],	%f30
	edge8n	%g3,	%l4,	%o0
	fnand	%f4,	%f28,	%f6
	srlx	%l0,	%g6,	%g7
	array8	%i1,	%l6,	%o1
	xnor	%l3,	%l1,	%o4
	udivcc	%i5,	0x0C2E,	%g4
	fornot2s	%f25,	%f15,	%f10
	fxnor	%f14,	%f16,	%f28
	sra	%i4,	0x1E,	%g2
	fornot1s	%f22,	%f25,	%f8
	fcmple16	%f30,	%f0,	%o6
	andncc	%l5,	%i2,	%o7
	movgu	%xcc,	%g1,	%i6
	st	%f15,	[%l7 + 0x7C]
	andncc	%o3,	%o2,	%o5
	sdivcc	%i0,	0x1040,	%g5
	fcmple16	%f6,	%f2,	%i7
	and	%l2,	%g3,	%i3
	fnors	%f24,	%f12,	%f23
	fnand	%f4,	%f26,	%f14
	ldx	[%l7 + 0x70],	%l4
	sll	%l0,	0x09,	%g6
	udivcc	%g7,	0x1A70,	%o0
	fnot1	%f16,	%f20
	popc	%l6,	%o1
	movgu	%icc,	%l3,	%i1
	fzero	%f30
	fzeros	%f20
	fpack16	%f16,	%f30
	srlx	%l1,	%o4,	%g4
	add	%i5,	%i4,	%o6
	movgu	%icc,	%l5,	%i2
	ldd	[%l7 + 0x20],	%f4
	movcs	%xcc,	%o7,	%g1
	fmovdg	%xcc,	%f15,	%f18
	movcc	%xcc,	%i6,	%g2
	fmovrsgz	%o2,	%f26,	%f20
	mulx	%o3,	0x065A,	%i0
	fcmpgt16	%f16,	%f20,	%g5
	fmovdne	%xcc,	%f28,	%f23
	sll	%o5,	%l2,	%g3
	add	%i3,	0x02FA,	%i7
	stb	%l0,	[%l7 + 0x1D]
	movvs	%icc,	%g6,	%l4
	fcmpgt32	%f24,	%f18,	%g7
	edge8l	%o0,	%o1,	%l3
	popc	0x1C67,	%i1
	mulscc	%l6,	%l1,	%o4
	pdist	%f6,	%f12,	%f24
	movpos	%xcc,	%g4,	%i5
	movneg	%xcc,	%o6,	%l5
	fmovde	%xcc,	%f21,	%f5
	movleu	%xcc,	%i4,	%o7
	movleu	%xcc,	%g1,	%i2
	edge32l	%i6,	%g2,	%o3
	fmul8sux16	%f14,	%f0,	%f20
	edge16ln	%o2,	%i0,	%o5
	save %l2, 0x0B20, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g5,	%i3,	%i7
	sdiv	%l0,	0x0FBC,	%l4
	andncc	%g6,	%g7,	%o0
	fzero	%f26
	edge16ln	%l3,	%o1,	%i1
	stx	%l6,	[%l7 + 0x18]
	movg	%icc,	%o4,	%l1
	movre	%i5,	%o6,	%l5
	fmovrslz	%i4,	%f15,	%f31
	edge32ln	%o7,	%g4,	%i2
	stw	%g1,	[%l7 + 0x3C]
	sir	0x006E
	fpsub16s	%f14,	%f22,	%f16
	edge32ln	%i6,	%g2,	%o3
	fmovsl	%xcc,	%f19,	%f0
	siam	0x4
	fpack32	%f26,	%f14,	%f0
	sir	0x059F
	st	%f5,	[%l7 + 0x74]
	std	%f30,	[%l7 + 0x78]
	and	%i0,	%o2,	%l2
	umul	%g3,	0x0B90,	%g5
	mova	%icc,	%o5,	%i3
	ld	[%l7 + 0x64],	%f31
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	edge32n	%l4,	%g7,	%l3
	alignaddrl	%o1,	%i1,	%o0
	andncc	%o4,	%l1,	%i5
	edge8	%l6,	%o6,	%i4
	fmovde	%xcc,	%f21,	%f27
	orncc	%l5,	%g4,	%o7
	subccc	%g1,	0x1F40,	%i6
	movrgz	%g2,	%i2,	%o3
	fmovda	%xcc,	%f28,	%f27
	orncc	%i0,	%o2,	%g3
	sth	%l2,	[%l7 + 0x50]
	std	%f8,	[%l7 + 0x40]
	subccc	%o5,	0x1F75,	%g5
	andn	%i3,	0x0470,	%l0
	edge8	%i7,	%g6,	%l4
	movn	%icc,	%l3,	%g7
	fpadd32s	%f30,	%f23,	%f24
	array8	%i1,	%o0,	%o4
	movvc	%icc,	%o1,	%i5
	edge16ln	%l1,	%l6,	%o6
	movvs	%xcc,	%l5,	%g4
	fmovsn	%xcc,	%f1,	%f4
	ldd	[%l7 + 0x38],	%f18
	fsrc2	%f18,	%f16
	srl	%i4,	0x11,	%g1
	movcs	%icc,	%o7,	%g2
	udivx	%i6,	0x0761,	%i2
	movvs	%xcc,	%o3,	%o2
	umulcc	%g3,	%l2,	%i0
	subccc	%g5,	%o5,	%l0
	orn	%i3,	%i7,	%l4
	movrlez	%l3,	%g6,	%g7
	stx	%o0,	[%l7 + 0x50]
	fxnors	%f12,	%f13,	%f30
	fandnot2	%f22,	%f4,	%f4
	fpack32	%f2,	%f16,	%f6
	fornot2s	%f23,	%f12,	%f23
	fmovdl	%xcc,	%f30,	%f0
	ldsw	[%l7 + 0x0C],	%i1
	xnor	%o1,	%i5,	%o4
	andncc	%l1,	%o6,	%l6
	movcs	%xcc,	%l5,	%g4
	fmovrdlz	%i4,	%f10,	%f0
	umulcc	%g1,	%o7,	%i6
	ldsw	[%l7 + 0x28],	%g2
	xor	%i2,	0x1EE1,	%o2
	save %o3, 0x127F, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g3,	0x29C,	%i0
	addc	%g5,	%l0,	%o5
	save %i3, 0x0B6B, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l3,	0x116C,	%i7
	edge8l	%g6,	%o0,	%i1
	ldd	[%l7 + 0x48],	%g6
	ldsw	[%l7 + 0x08],	%i5
	smulcc	%o1,	0x15BD,	%l1
	edge32l	%o6,	%l6,	%l5
	udivx	%g4,	0x0D26,	%i4
	andcc	%o4,	0x1233,	%g1
	addc	%i6,	%g2,	%o7
	st	%f26,	[%l7 + 0x18]
	subccc	%o2,	%o3,	%i2
	fmovdle	%xcc,	%f6,	%f7
	movvc	%xcc,	%g3,	%i0
	movcc	%icc,	%l2,	%g5
	andn	%o5,	%l0,	%l4
	sll	%l3,	0x0F,	%i7
	edge32n	%i3,	%o0,	%i1
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%g6
	fcmpgt32	%f16,	%f28,	%g7
	mova	%xcc,	%o1,	%i5
	subcc	%o6,	0x1521,	%l1
	std	%f30,	[%l7 + 0x60]
	fpack32	%f0,	%f30,	%f12
	array16	%l6,	%l5,	%g4
	ldx	[%l7 + 0x38],	%o4
	edge32n	%i4,	%i6,	%g1
	subc	%o7,	%o2,	%o3
	ldsw	[%l7 + 0x10],	%i2
	umulcc	%g3,	%i0,	%g2
	array8	%l2,	%g5,	%l0
	xnor	%o5,	%l4,	%i7
	xorcc	%i3,	0x0B08,	%l3
	fcmpeq16	%f6,	%f8,	%i1
	ldd	[%l7 + 0x20],	%g6
	xnor	%g7,	%o1,	%i5
	orn	%o6,	%o0,	%l1
	stw	%l5,	[%l7 + 0x18]
	xnor	%g4,	%l6,	%o4
	umulcc	%i6,	0x1D71,	%i4
	move	%xcc,	%g1,	%o2
	stw	%o7,	[%l7 + 0x1C]
	save %i2, 0x039A, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g3,	%i0,	%g2
	ldub	[%l7 + 0x47],	%l2
	subccc	%g5,	%l0,	%o5
	std	%f30,	[%l7 + 0x50]
	movre	%l4,	%i7,	%l3
	add	%i1,	%g6,	%g7
	addc	%o1,	%i5,	%i3
	bshuffle	%f22,	%f28,	%f20
	smul	%o6,	%l1,	%o0
	fands	%f14,	%f28,	%f22
	edge16l	%l5,	%l6,	%o4
	fmul8sux16	%f16,	%f12,	%f26
	movle	%xcc,	%i6,	%g4
	fmovdleu	%xcc,	%f11,	%f23
	fmovscc	%icc,	%f25,	%f5
	srax	%g1,	0x03,	%i4
	subccc	%o2,	0x0990,	%o7
	fmovsleu	%icc,	%f21,	%f28
	alignaddr	%i2,	%o3,	%g3
	ldub	[%l7 + 0x62],	%i0
	ldsh	[%l7 + 0x4A],	%l2
	st	%f26,	[%l7 + 0x34]
	sra	%g5,	%l0,	%g2
	srl	%o5,	0x1E,	%l4
	movrgz	%i7,	%i1,	%l3
	srl	%g7,	%g6,	%o1
	alignaddrl	%i3,	%o6,	%i5
	restore %o0, 0x0874, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l6,	%l5,	%o4
	sdivcc	%i6,	0x17DE,	%g4
	fmovrslz	%g1,	%f15,	%f16
	fmul8x16al	%f9,	%f29,	%f16
	edge16l	%i4,	%o2,	%o7
	udiv	%o3,	0x0835,	%g3
	mulx	%i0,	%l2,	%g5
	or	%i2,	%l0,	%g2
	movneg	%xcc,	%o5,	%l4
	movleu	%xcc,	%i7,	%i1
	edge32l	%g7,	%l3,	%g6
	fmovsg	%xcc,	%f21,	%f21
	orn	%o1,	0x01B8,	%o6
	alignaddr	%i3,	%o0,	%l1
	edge16ln	%i5,	%l6,	%l5
	fmovdcs	%icc,	%f25,	%f2
	orcc	%i6,	0x1011,	%o4
	orcc	%g4,	%g1,	%o2
	fpackfix	%f14,	%f15
	movre	%i4,	0x06D,	%o7
	fornot1s	%f19,	%f30,	%f2
	for	%f10,	%f22,	%f6
	movne	%icc,	%g3,	%o3
	fpsub32	%f28,	%f30,	%f26
	sll	%l2,	%g5,	%i2
	movrlez	%i0,	0x1FB,	%l0
	edge16n	%g2,	%o5,	%i7
	movcs	%icc,	%i1,	%g7
	fcmps	%fcc1,	%f22,	%f29
	fnot2s	%f26,	%f3
	fmuld8ulx16	%f31,	%f3,	%f2
	andncc	%l4,	%l3,	%o1
	fmovdge	%icc,	%f25,	%f18
	fmovse	%icc,	%f24,	%f27
	addc	%g6,	%i3,	%o0
	st	%f6,	[%l7 + 0x34]
	stx	%o6,	[%l7 + 0x28]
	fmovsgu	%icc,	%f9,	%f23
	fcmpes	%fcc2,	%f25,	%f10
	alignaddr	%l1,	%i5,	%l6
	stx	%l5,	[%l7 + 0x48]
	alignaddr	%i6,	%g4,	%g1
	ldsb	[%l7 + 0x29],	%o2
	addccc	%i4,	0x11BB,	%o4
	stw	%g3,	[%l7 + 0x7C]
	fxor	%f28,	%f12,	%f0
	ldd	[%l7 + 0x68],	%f26
	st	%f8,	[%l7 + 0x60]
	srax	%o7,	%l2,	%g5
	ldsb	[%l7 + 0x0C],	%o3
	fpack32	%f18,	%f2,	%f10
	movn	%xcc,	%i2,	%i0
	edge32l	%g2,	%l0,	%o5
	popc	%i1,	%g7
	ldsh	[%l7 + 0x48],	%i7
	movl	%xcc,	%l4,	%o1
	umul	%l3,	%i3,	%o0
	movpos	%xcc,	%o6,	%g6
	movneg	%xcc,	%i5,	%l6
	edge16ln	%l1,	%l5,	%i6
	fcmps	%fcc0,	%f26,	%f24
	sllx	%g4,	0x10,	%o2
	movge	%xcc,	%i4,	%o4
	fmuld8sux16	%f25,	%f22,	%f20
	sdivcc	%g1,	0x13D3,	%o7
	sll	%g3,	%g5,	%l2
	umulcc	%i2,	%o3,	%i0
	edge8	%l0,	%g2,	%i1
	ldd	[%l7 + 0x18],	%g6
	orcc	%o5,	0x1A5D,	%i7
	edge8ln	%l4,	%o1,	%l3
	edge16	%o0,	%i3,	%o6
	edge8	%i5,	%g6,	%l6
	smulcc	%l1,	0x0414,	%i6
	ldd	[%l7 + 0x78],	%f18
	edge8	%g4,	%o2,	%l5
	nop
	set	0x3A, %g4
	sth	%o4,	[%l7 + %g4]
	movrgez	%g1,	0x2DD,	%i4
	fmovs	%f0,	%f12
	fnors	%f17,	%f1,	%f4
	edge8ln	%o7,	%g3,	%l2
	andn	%g5,	0x1684,	%i2
	fcmped	%fcc3,	%f28,	%f22
	fcmpne32	%f14,	%f22,	%o3
	and	%i0,	0x0FD5,	%l0
	ld	[%l7 + 0x1C],	%f11
	fmovdpos	%xcc,	%f13,	%f5
	edge16n	%i1,	%g2,	%g7
	pdist	%f6,	%f20,	%f26
	srlx	%i7,	%l4,	%o1
	movpos	%icc,	%o5,	%o0
	edge32n	%i3,	%l3,	%i5
	umul	%g6,	0x1C6C,	%o6
	ldsh	[%l7 + 0x46],	%l6
	edge16ln	%l1,	%g4,	%i6
	stb	%l5,	[%l7 + 0x11]
	ldd	[%l7 + 0x58],	%o2
	edge8n	%g1,	%o4,	%o7
	std	%f28,	[%l7 + 0x70]
	ldsw	[%l7 + 0x50],	%i4
	xor	%l2,	0x1960,	%g3
	fxnor	%f12,	%f22,	%f8
	movvc	%xcc,	%g5,	%i2
	edge32ln	%i0,	%l0,	%o3
	movpos	%icc,	%i1,	%g2
	smulcc	%i7,	0x1514,	%g7
	fpsub16s	%f25,	%f28,	%f3
	fnot2	%f30,	%f2
	ld	[%l7 + 0x0C],	%f5
	st	%f3,	[%l7 + 0x74]
	fnegs	%f24,	%f16
	mulx	%l4,	%o5,	%o0
	fmovrslez	%i3,	%f8,	%f17
	fmovsne	%xcc,	%f25,	%f24
	fmovdvs	%icc,	%f9,	%f0
	sth	%l3,	[%l7 + 0x76]
	sub	%i5,	%o1,	%o6
	mulscc	%l6,	0x05A5,	%l1
	ldsb	[%l7 + 0x09],	%g6
	orncc	%g4,	%i6,	%o2
	edge32l	%g1,	%l5,	%o4
	fors	%f9,	%f15,	%f0
	lduw	[%l7 + 0x40],	%i4
	movrlz	%l2,	0x18F,	%g3
	fnegd	%f30,	%f22
	array32	%o7,	%i2,	%g5
	movrgz	%l0,	0x175,	%i0
	udivcc	%o3,	0x1FBF,	%g2
	fors	%f10,	%f29,	%f26
	fcmpes	%fcc3,	%f11,	%f4
	orcc	%i1,	%g7,	%l4
	subcc	%i7,	%o5,	%i3
	subcc	%o0,	0x07A2,	%i5
	sdivx	%o1,	0x02BE,	%l3
	sir	0x1FB9
	sdivx	%o6,	0x134E,	%l1
	srlx	%g6,	%l6,	%g4
	smul	%i6,	0x1EFF,	%g1
	movcc	%xcc,	%o2,	%l5
	srl	%o4,	%i4,	%l2
	sllx	%g3,	0x19,	%i2
	subcc	%o7,	0x044A,	%g5
	movg	%icc,	%l0,	%i0
	addc	%o3,	0x0138,	%g2
	fmovrslz	%g7,	%f8,	%f30
	fmovse	%xcc,	%f29,	%f3
	udivx	%i1,	0x0973,	%i7
	orn	%o5,	0x01D7,	%l4
	orncc	%o0,	%i5,	%i3
	andncc	%l3,	%o1,	%o6
	array8	%g6,	%l1,	%g4
	fsrc1	%f28,	%f0
	st	%f23,	[%l7 + 0x54]
	sth	%l6,	[%l7 + 0x12]
	fpadd32s	%f26,	%f11,	%f7
	fxors	%f8,	%f5,	%f16
	movneg	%xcc,	%i6,	%g1
	movgu	%xcc,	%o2,	%l5
	mulx	%o4,	0x1637,	%i4
	ldd	[%l7 + 0x28],	%f8
	ldub	[%l7 + 0x59],	%l2
	fmovrsgz	%i2,	%f1,	%f22
	sdiv	%g3,	0x044A,	%o7
	subc	%g5,	0x1F4A,	%l0
	and	%i0,	0x1234,	%o3
	ldsb	[%l7 + 0x54],	%g2
	ldsh	[%l7 + 0x52],	%g7
	fnors	%f12,	%f1,	%f28
	movvc	%xcc,	%i7,	%i1
	movcc	%icc,	%l4,	%o0
	fmovsge	%xcc,	%f27,	%f30
	fnegs	%f11,	%f8
	sub	%i5,	%o5,	%i3
	fmovdleu	%icc,	%f11,	%f1
	sir	0x106A
	fmovsleu	%icc,	%f9,	%f0
	movrlez	%l3,	%o1,	%g6
	ldd	[%l7 + 0x18],	%f30
	std	%f6,	[%l7 + 0x68]
	add	%o6,	0x00AC,	%l1
	subcc	%g4,	0x15AC,	%i6
	ldsb	[%l7 + 0x0A],	%g1
	udiv	%l6,	0x0569,	%l5
	fxnors	%f19,	%f24,	%f30
	popc	0x16A6,	%o2
	subc	%i4,	%o4,	%l2
	ldx	[%l7 + 0x28],	%i2
	ldsh	[%l7 + 0x20],	%g3
	orncc	%g5,	%o7,	%i0
	fand	%f4,	%f2,	%f14
	andcc	%o3,	0x1034,	%l0
	fnot2s	%f4,	%f28
	sth	%g7,	[%l7 + 0x08]
	movl	%icc,	%i7,	%i1
	movcs	%xcc,	%l4,	%o0
	movrne	%g2,	%o5,	%i5
	array16	%i3,	%o1,	%g6
	edge16ln	%o6,	%l1,	%l3
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	xor	%g1,	%l5,	%i4
	edge16n	%o2,	%o4,	%l2
	fnot1s	%f2,	%f1
	srax	%i2,	0x19,	%g5
	movn	%icc,	%g3,	%i0
	or	%o7,	%o3,	%g7
	fexpand	%f8,	%f28
	edge16	%i7,	%l0,	%i1
	mulscc	%o0,	0x0209,	%l4
	mulx	%g2,	%i5,	%i3
	udivcc	%o5,	0x1D63,	%g6
	movneg	%icc,	%o1,	%l1
	fmovdcc	%icc,	%f31,	%f25
	movneg	%icc,	%l3,	%o6
	sethi	0x03F3,	%i6
	faligndata	%f28,	%f6,	%f22
	save %g4, %g1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l5,	%o2
	udivcc	%i4,	0x1893,	%o4
	ld	[%l7 + 0x7C],	%f24
	std	%f26,	[%l7 + 0x10]
	array16	%l2,	%i2,	%g3
	fmovscc	%icc,	%f13,	%f27
	movgu	%xcc,	%i0,	%g5
	ldx	[%l7 + 0x78],	%o3
	movrgez	%o7,	0x2A3,	%i7
	edge16	%l0,	%i1,	%o0
	movrgz	%g7,	0x020,	%l4
	movl	%xcc,	%i5,	%g2
	mulx	%i3,	0x1A63,	%g6
	add	%o5,	0x02B0,	%o1
	sir	0x0EAF
	orncc	%l1,	%l3,	%i6
	xnor	%o6,	0x19EF,	%g1
	movvs	%icc,	%l6,	%l5
	fpack16	%f24,	%f18
	fpsub32	%f0,	%f4,	%f18
	save %g4, %o2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i4,	%i2,	%l2
	popc	0x052E,	%g3
	andcc	%i0,	%g5,	%o7
	stx	%i7,	[%l7 + 0x38]
	movgu	%icc,	%o3,	%l0
	restore %i1, %o0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l4,	0x01AE,	%i5
	movrlz	%i3,	0x1F9,	%g2
	smulcc	%o5,	%o1,	%l1
	fmovrse	%g6,	%f20,	%f27
	addcc	%i6,	0x0D92,	%l3
	sdivx	%o6,	0x1532,	%g1
	stw	%l5,	[%l7 + 0x40]
	addc	%l6,	0x1051,	%o2
	addc	%o4,	0x178C,	%i4
	movle	%xcc,	%g4,	%i2
	fmovsne	%xcc,	%f14,	%f4
	ldub	[%l7 + 0x1B],	%l2
	edge32n	%i0,	%g5,	%o7
	edge8	%g3,	%i7,	%l0
	movne	%xcc,	%o3,	%i1
	edge8	%g7,	%o0,	%l4
	std	%f26,	[%l7 + 0x20]
	mulscc	%i5,	0x06DB,	%g2
	fcmple32	%f2,	%f14,	%i3
	andcc	%o5,	0x0038,	%l1
	edge16	%o1,	%i6,	%g6
	ldub	[%l7 + 0x0F],	%l3
	fxors	%f25,	%f6,	%f6
	addcc	%g1,	%l5,	%o6
	sllx	%l6,	0x00,	%o4
	addcc	%i4,	0x14DB,	%g4
	array32	%o2,	%l2,	%i2
	fmovdle	%icc,	%f3,	%f9
	ldsw	[%l7 + 0x10],	%i0
	movne	%xcc,	%o7,	%g5
	udivx	%g3,	0x0013,	%l0
	fmovdleu	%xcc,	%f11,	%f18
	andcc	%o3,	%i1,	%i7
	ldsw	[%l7 + 0x54],	%o0
	movpos	%icc,	%g7,	%l4
	udivx	%g2,	0x0D2B,	%i3
	popc	0x1440,	%i5
	lduw	[%l7 + 0x4C],	%o5
	andcc	%l1,	%i6,	%o1
	fmovsvs	%icc,	%f20,	%f30
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	ldub	[%l7 + 0x4B],	%l5
	ldd	[%l7 + 0x20],	%g0
	mulx	%o6,	%l6,	%o4
	fones	%f4
	smulcc	%g4,	%o2,	%i4
	faligndata	%f22,	%f14,	%f18
	fandnot2	%f28,	%f24,	%f26
	lduw	[%l7 + 0x48],	%i2
	fnand	%f26,	%f6,	%f0
	sub	%i0,	%l2,	%o7
	ld	[%l7 + 0x74],	%f21
	srl	%g5,	%g3,	%o3
	and	%l0,	0x1DA4,	%i1
	fmovscs	%icc,	%f17,	%f18
	movne	%xcc,	%o0,	%g7
	sra	%i7,	0x09,	%l4
	fcmple16	%f26,	%f16,	%i3
	movg	%xcc,	%g2,	%i5
	sdivcc	%l1,	0x0E57,	%o5
	srl	%o1,	%i6,	%g6
	ldsh	[%l7 + 0x68],	%l3
	movge	%xcc,	%l5,	%o6
	array32	%l6,	%o4,	%g1
	fmovsl	%xcc,	%f27,	%f22
	srax	%g4,	%o2,	%i2
	fpmerge	%f16,	%f5,	%f28
	subccc	%i0,	%i4,	%l2
	edge32l	%g5,	%o7,	%o3
	sdivcc	%g3,	0x17B6,	%i1
	fmovdneg	%icc,	%f30,	%f25
	movrlez	%l0,	%o0,	%i7
	array8	%g7,	%l4,	%i3
	movrgz	%i5,	0x384,	%l1
	sra	%o5,	0x07,	%g2
	fmul8x16	%f2,	%f12,	%f16
	movvc	%icc,	%i6,	%g6
	fmovsne	%xcc,	%f7,	%f23
	sll	%o1,	0x1F,	%l3
	stx	%o6,	[%l7 + 0x20]
	add	%l5,	0x1780,	%o4
	srlx	%g1,	%l6,	%g4
	ldsb	[%l7 + 0x7A],	%i2
	orncc	%i0,	%o2,	%i4
	udivcc	%l2,	0x1D78,	%o7
	smulcc	%o3,	0x17B7,	%g3
	movl	%xcc,	%i1,	%l0
	movleu	%icc,	%g5,	%i7
	edge8l	%g7,	%o0,	%l4
	andn	%i3,	0x1F5C,	%i5
	edge8l	%l1,	%g2,	%i6
	fmovrslez	%o5,	%f1,	%f12
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%g6
	movleu	%icc,	%l3,	%o1
	nop
	set	0x22, %l4
	sth	%o6,	[%l7 + %l4]
	sra	%l5,	%o4,	%l6
	edge8l	%g1,	%i2,	%i0
	add	%o2,	0x0288,	%g4
	fandnot2	%f4,	%f24,	%f12
	sll	%i4,	0x03,	%o7
	array16	%l2,	%o3,	%g3
	xorcc	%l0,	0x07CF,	%g5
	ld	[%l7 + 0x0C],	%f2
	lduh	[%l7 + 0x5E],	%i7
	fpadd32	%f16,	%f6,	%f4
	fmovrdne	%i1,	%f20,	%f0
	edge32l	%o0,	%g7,	%i3
	movneg	%icc,	%l4,	%i5
	andn	%g2,	%i6,	%l1
	movvs	%icc,	%o5,	%g6
	and	%l3,	0x1FAC,	%o1
	edge16l	%l5,	%o4,	%l6
	std	%f10,	[%l7 + 0x70]
	fmovsgu	%icc,	%f6,	%f27
	fmovrslz	%g1,	%f7,	%f14
	fnot2s	%f6,	%f21
	movvc	%icc,	%o6,	%i0
	ldsb	[%l7 + 0x43],	%o2
	movgu	%icc,	%g4,	%i4
	st	%f7,	[%l7 + 0x30]
	movge	%icc,	%o7,	%i2
	edge8ln	%l2,	%o3,	%g3
	nop
	set	0x38, %o2
	stw	%l0,	[%l7 + %o2]
	array8	%g5,	%i1,	%i7
	std	%f6,	[%l7 + 0x50]
	fcmple16	%f28,	%f4,	%g7
	move	%icc,	%o0,	%i3
	andcc	%l4,	0x08A6,	%g2
	umulcc	%i5,	%i6,	%l1
	andncc	%g6,	%o5,	%o1
	udivx	%l5,	0x176C,	%o4
	sth	%l3,	[%l7 + 0x28]
	mulscc	%l6,	%g1,	%i0
	xnor	%o6,	0x0E7E,	%o2
	movge	%icc,	%g4,	%o7
	std	%f18,	[%l7 + 0x28]
	and	%i2,	%i4,	%l2
	move	%xcc,	%o3,	%g3
	ldd	[%l7 + 0x18],	%f20
	sethi	0x0F34,	%g5
	fpsub32	%f6,	%f16,	%f18
	subcc	%l0,	0x0E17,	%i7
	fcmple32	%f26,	%f30,	%i1
	movrlz	%o0,	0x198,	%g7
	ldx	[%l7 + 0x38],	%i3
	sub	%g2,	0x18F0,	%i5
	ldx	[%l7 + 0x30],	%i6
	fmul8x16al	%f1,	%f4,	%f28
	umulcc	%l4,	0x0347,	%g6
	stx	%l1,	[%l7 + 0x08]
	fmuld8ulx16	%f8,	%f30,	%f4
	xorcc	%o1,	0x05EB,	%o5
	fabss	%f23,	%f2
	mulscc	%o4,	%l5,	%l6
	ld	[%l7 + 0x18],	%f23
	sdivcc	%g1,	0x0245,	%l3
	xorcc	%o6,	0x0384,	%o2
	fmovsne	%xcc,	%f5,	%f26
	movrgz	%g4,	0x23D,	%o7
	fmovrsgz	%i0,	%f31,	%f26
	movvs	%xcc,	%i4,	%l2
	udivcc	%o3,	0x1435,	%g3
	fmovrsne	%i2,	%f14,	%f13
	fsrc2s	%f29,	%f31
	srlx	%g5,	%i7,	%l0
	fandnot2s	%f4,	%f10,	%f14
	edge16	%i1,	%o0,	%g7
	movl	%xcc,	%i3,	%i5
	sdivx	%g2,	0x05BC,	%i6
	movge	%icc,	%l4,	%g6
	edge8n	%o1,	%l1,	%o4
	edge32l	%o5,	%l5,	%l6
	siam	0x0
	fands	%f5,	%f20,	%f7
	fnot1	%f18,	%f18
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%g0
	lduw	[%l7 + 0x70],	%o6
	fcmpne16	%f0,	%f4,	%l3
	array32	%o2,	%o7,	%i0
	fnot2	%f24,	%f8
	movleu	%icc,	%i4,	%g4
	alignaddrl	%l2,	%o3,	%g3
	movrgez	%g5,	0x267,	%i7
	sra	%i2,	0x0C,	%l0
	restore %i1, 0x010D, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f26,	%f16,	%f22
	and	%i3,	0x1230,	%o0
	fmovdn	%xcc,	%f4,	%f30
	ldd	[%l7 + 0x68],	%i4
	movne	%icc,	%i6,	%l4
	mulscc	%g6,	%g2,	%l1
	sdiv	%o4,	0x0101,	%o5
	movneg	%xcc,	%o1,	%l6
	movrlez	%g1,	%o6,	%l5
	fornot1	%f2,	%f20,	%f8
	lduw	[%l7 + 0x6C],	%l3
	mulscc	%o7,	0x0A5C,	%o2
	sllx	%i4,	0x16,	%g4
	movvc	%xcc,	%i0,	%o3
	movrne	%g3,	0x042,	%l2
	ldsh	[%l7 + 0x1E],	%g5
	add	%i2,	%l0,	%i1
	fsrc1	%f28,	%f16
	fcmpes	%fcc3,	%f30,	%f1
	orn	%g7,	%i3,	%i7
	movg	%xcc,	%o0,	%i5
	movvs	%icc,	%i6,	%g6
	array32	%l4,	%l1,	%o4
	edge8n	%g2,	%o5,	%l6
	movge	%xcc,	%g1,	%o1
	fpsub32s	%f26,	%f23,	%f8
	sdivx	%l5,	0x0CA7,	%o6
	edge8l	%o7,	%l3,	%i4
	fmovrdlz	%g4,	%f4,	%f12
	fexpand	%f31,	%f2
	addcc	%i0,	%o2,	%g3
	edge32ln	%l2,	%g5,	%i2
	xorcc	%l0,	%i1,	%g7
	movre	%o3,	0x146,	%i3
	edge8	%o0,	%i7,	%i6
	edge8ln	%i5,	%g6,	%l1
	orncc	%o4,	%g2,	%o5
	movge	%xcc,	%l6,	%g1
	movne	%xcc,	%l4,	%o1
	movrlez	%o6,	0x08C,	%l5
	fmovdpos	%xcc,	%f2,	%f10
	movvc	%xcc,	%l3,	%i4
	stb	%g4,	[%l7 + 0x2D]
	xnorcc	%i0,	%o7,	%g3
	and	%o2,	%g5,	%i2
	alignaddrl	%l0,	%l2,	%i1
	edge32ln	%g7,	%o3,	%i3
	array16	%o0,	%i7,	%i6
	fmul8x16au	%f1,	%f10,	%f24
	orcc	%i5,	0x0557,	%g6
	movrne	%o4,	0x39E,	%g2
	fmovsg	%icc,	%f21,	%f23
	lduw	[%l7 + 0x54],	%l1
	ldd	[%l7 + 0x60],	%o4
	fxors	%f5,	%f27,	%f23
	sdivcc	%l6,	0x1CFC,	%g1
	mulscc	%l4,	%o6,	%l5
	movrne	%l3,	0x209,	%i4
	save %o1, %g4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g3,	0x063F,	%o2
	edge32ln	%g5,	%i2,	%l0
	ldsh	[%l7 + 0x4E],	%l2
	fmovsg	%icc,	%f26,	%f29
	stb	%i0,	[%l7 + 0x0D]
	xorcc	%g7,	%i1,	%o3
	and	%i3,	0x1291,	%i7
	xor	%i6,	0x1402,	%o0
	ldd	[%l7 + 0x38],	%g6
	sth	%i5,	[%l7 + 0x68]
	addccc	%g2,	%o4,	%o5
	movne	%icc,	%l6,	%l1
	siam	0x1
	xorcc	%g1,	0x02A0,	%o6
	ldd	[%l7 + 0x18],	%l4
	orn	%l3,	%i4,	%o1
	sllx	%l5,	%g4,	%o7
	ldx	[%l7 + 0x60],	%o2
	umul	%g3,	%i2,	%g5
	movrne	%l2,	%l0,	%g7
	fmovsleu	%icc,	%f30,	%f11
	smulcc	%i0,	0x18C5,	%i1
	sub	%i3,	%i7,	%o3
	lduw	[%l7 + 0x58],	%i6
	movrlz	%g6,	%i5,	%o0
	ld	[%l7 + 0x08],	%f30
	subccc	%o4,	0x0BB8,	%o5
	movl	%xcc,	%g2,	%l1
	move	%xcc,	%g1,	%l6
	fpack16	%f24,	%f30
	addcc	%o6,	0x1898,	%l3
	srl	%i4,	0x1F,	%l4
	xnor	%l5,	%g4,	%o1
	sll	%o7,	0x10,	%g3
	xor	%o2,	%i2,	%l2
	movvc	%icc,	%g5,	%g7
	fmovsa	%xcc,	%f23,	%f0
	sra	%l0,	0x05,	%i0
	fmovsn	%icc,	%f14,	%f27
	fmovspos	%xcc,	%f0,	%f12
	movvc	%xcc,	%i1,	%i3
	addccc	%i7,	%i6,	%g6
	edge8n	%i5,	%o3,	%o4
	edge32ln	%o0,	%o5,	%g2
	sdivx	%g1,	0x1F0B,	%l6
	edge8ln	%o6,	%l3,	%l1
	ldsb	[%l7 + 0x54],	%i4
	fmovsneg	%icc,	%f1,	%f30
	std	%f6,	[%l7 + 0x70]
	smulcc	%l5,	%l4,	%g4
	edge8l	%o7,	%g3,	%o2
	movgu	%xcc,	%i2,	%l2
	fcmpgt16	%f6,	%f22,	%o1
	sra	%g5,	0x00,	%l0
	siam	0x5
	ld	[%l7 + 0x74],	%f2
	fabss	%f21,	%f19
	fcmpgt32	%f4,	%f28,	%i0
	movvc	%icc,	%g7,	%i1
	edge16l	%i7,	%i3,	%i6
	xor	%i5,	0x0582,	%g6
	array8	%o3,	%o4,	%o5
	movrgz	%g2,	0x3C2,	%o0
	fmovdpos	%icc,	%f1,	%f23
	edge32	%g1,	%o6,	%l6
	fmovdcs	%icc,	%f31,	%f17
	edge8n	%l1,	%i4,	%l5
	andcc	%l3,	%g4,	%o7
	movn	%xcc,	%g3,	%o2
	edge8ln	%l4,	%l2,	%o1
	movrgez	%g5,	0x16E,	%i2
	array32	%l0,	%i0,	%g7
	fmovrslez	%i7,	%f27,	%f20
	movne	%icc,	%i1,	%i3
	edge8	%i6,	%i5,	%o3
	edge8	%o4,	%o5,	%g6
	subccc	%g2,	0x1EAC,	%g1
	sdiv	%o0,	0x0201,	%o6
	sra	%l6,	0x11,	%l1
	sdivcc	%l5,	0x1891,	%i4
	st	%f15,	[%l7 + 0x78]
	faligndata	%f16,	%f6,	%f18
	ld	[%l7 + 0x24],	%f24
	xnorcc	%g4,	%l3,	%o7
	orncc	%g3,	0x1F1A,	%l4
	xnorcc	%o2,	%l2,	%g5
	xnor	%o1,	0x1ACE,	%l0
	move	%icc,	%i2,	%g7
	udivx	%i7,	0x1324,	%i1
	fabsd	%f20,	%f6
	save %i0, 0x0D23, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i5,	%o3
	sllx	%o4,	0x16,	%i3
	srax	%g6,	%g2,	%o5
	movle	%icc,	%o0,	%o6
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	fmovdcc	%icc,	%f25,	%f21
	fmovdleu	%icc,	%f22,	%f13
	lduh	[%l7 + 0x78],	%l5
	orncc	%l1,	%i4,	%g4
	fandnot2s	%f10,	%f2,	%f21
	movrgez	%l3,	0x289,	%g3
	move	%icc,	%o7,	%l4
	stb	%o2,	[%l7 + 0x6C]
	fmovsleu	%icc,	%f13,	%f13
	move	%xcc,	%l2,	%o1
	fcmpd	%fcc3,	%f28,	%f4
	movn	%icc,	%l0,	%g5
	umul	%i2,	0x005A,	%g7
	fmovdneg	%xcc,	%f26,	%f6
	fmovs	%f23,	%f19
	movg	%icc,	%i1,	%i7
	smul	%i6,	%i0,	%i5
	sra	%o3,	0x07,	%o4
	edge32l	%g6,	%i3,	%g2
	andcc	%o0,	0x1D09,	%o5
	movrgez	%g1,	%o6,	%l6
	sdivx	%l1,	0x0B8F,	%i4
	srlx	%l5,	%g4,	%g3
	stb	%l3,	[%l7 + 0x47]
	srlx	%l4,	0x1C,	%o7
	mulx	%l2,	0x05D7,	%o1
	addcc	%o2,	0x187F,	%l0
	nop
	set	0x40, %g1
	stw	%i2,	[%l7 + %g1]
	addcc	%g5,	%g7,	%i7
	orncc	%i1,	%i0,	%i6
	fzero	%f10
	ldd	[%l7 + 0x78],	%i4
	fmovsle	%icc,	%f14,	%f15
	fmuld8sux16	%f17,	%f7,	%f12
	srax	%o3,	%o4,	%g6
	array8	%g2,	%o0,	%i3
	stb	%o5,	[%l7 + 0x2B]
	save %g1, %o6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i4,	%l5
	movne	%xcc,	%g4,	%g3
	subcc	%l6,	0x0636,	%l3
	save %l4, %l2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o2,	%o7,	%i2
	st	%f15,	[%l7 + 0x24]
	fmovsa	%icc,	%f7,	%f23
	addcc	%l0,	0x1AD6,	%g5
	sra	%i7,	%g7,	%i1
	move	%icc,	%i6,	%i5
	fnors	%f17,	%f2,	%f11
	ldd	[%l7 + 0x20],	%i0
	ldd	[%l7 + 0x70],	%f12
	lduh	[%l7 + 0x5A],	%o3
	fsrc2	%f14,	%f12
	ldd	[%l7 + 0x18],	%o4
	and	%g6,	%o0,	%i3
	movg	%xcc,	%g2,	%o5
	edge8ln	%o6,	%g1,	%i4
	add	%l1,	0x1374,	%g4
	ld	[%l7 + 0x24],	%f2
	xor	%g3,	%l5,	%l3
	subccc	%l4,	%l6,	%o1
	fmovrdgez	%l2,	%f0,	%f16
	subc	%o7,	0x1F77,	%o2
	fpsub16	%f26,	%f30,	%f12
	xnorcc	%i2,	0x11A4,	%g5
	fmovrsgez	%i7,	%f2,	%f12
	movrne	%l0,	%g7,	%i6
	edge32	%i5,	%i0,	%i1
	ldd	[%l7 + 0x08],	%o2
	movrgez	%o4,	0x0F5,	%o0
	ldsw	[%l7 + 0x50],	%g6
	ldsb	[%l7 + 0x67],	%i3
	movn	%icc,	%o5,	%o6
	ldsw	[%l7 + 0x70],	%g2
	srax	%g1,	0x05,	%i4
	movrgez	%g4,	0x27F,	%l1
	fcmpeq16	%f26,	%f10,	%l5
	sra	%g3,	%l3,	%l4
	fcmpeq16	%f14,	%f26,	%o1
	restore %l2, 0x1FC1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o2,	[%l7 + 0x40]
	andn	%i2,	%l6,	%g5
	edge32l	%l0,	%g7,	%i7
	and	%i5,	0x0BF6,	%i0
	addc	%i1,	%o3,	%i6
	fnot1s	%f12,	%f31
	movpos	%xcc,	%o4,	%o0
	sdiv	%i3,	0x1D2A,	%g6
	subccc	%o6,	0x118F,	%g2
	mulscc	%g1,	0x0275,	%o5
	sir	0x046B
	andcc	%i4,	0x1EE5,	%g4
	edge8ln	%l5,	%l1,	%l3
	udiv	%l4,	0x04D4,	%g3
	fmovsg	%xcc,	%f2,	%f12
	array8	%o1,	%o7,	%l2
	srlx	%i2,	0x19,	%l6
	movge	%icc,	%o2,	%l0
	sub	%g7,	%i7,	%i5
	movge	%icc,	%i0,	%i1
	xnorcc	%o3,	%i6,	%o4
	udivx	%g5,	0x1D08,	%o0
	umulcc	%i3,	%g6,	%o6
	orn	%g1,	0x159E,	%o5
	movvc	%xcc,	%g2,	%g4
	srlx	%i4,	0x1B,	%l5
	fpack32	%f4,	%f14,	%f28
	sra	%l1,	%l4,	%l3
	mulscc	%g3,	0x1240,	%o7
	fcmpne16	%f16,	%f20,	%o1
	edge16l	%i2,	%l2,	%l6
	movle	%xcc,	%o2,	%l0
	xorcc	%i7,	%g7,	%i5
	edge32l	%i0,	%i1,	%i6
	fmovda	%icc,	%f3,	%f3
	sth	%o4,	[%l7 + 0x08]
	fpack32	%f4,	%f0,	%f0
	fmovsvc	%icc,	%f11,	%f8
	orn	%o3,	%o0,	%g5
	fxnor	%f18,	%f30,	%f10
	xnor	%i3,	0x0782,	%o6
	subccc	%g6,	%o5,	%g2
	alignaddr	%g1,	%g4,	%i4
	nop
	set	0x54, %i2
	ldsw	[%l7 + %i2],	%l5
	ldub	[%l7 + 0x49],	%l4
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	sdivx	%o7,	0x072D,	%l3
	fmovscs	%xcc,	%f20,	%f13
	edge32	%i2,	%o1,	%l2
	subccc	%o2,	0x10AA,	%l0
	ldd	[%l7 + 0x08],	%f2
	ldub	[%l7 + 0x72],	%l6
	srlx	%i7,	%g7,	%i0
	mulx	%i5,	0x163A,	%i1
	nop
	set	0x40, %o6
	std	%f2,	[%l7 + %o6]
	lduh	[%l7 + 0x26],	%o4
	ldsh	[%l7 + 0x4A],	%i6
	movvc	%xcc,	%o3,	%o0
	movcc	%icc,	%g5,	%o6
	fmovsneg	%xcc,	%f21,	%f14
	array8	%g6,	%i3,	%g2
	sdiv	%g1,	0x03D2,	%g4
	array8	%o5,	%l5,	%i4
	mulscc	%l4,	0x0584,	%g3
	ldsh	[%l7 + 0x3A],	%o7
	xnor	%l3,	%i2,	%o1
	fornot1s	%f19,	%f12,	%f8
	movcs	%icc,	%l2,	%l1
	movrne	%o2,	%l6,	%l0
	mova	%xcc,	%g7,	%i7
	lduw	[%l7 + 0x30],	%i5
	xor	%i1,	%i0,	%o4
	movrgez	%i6,	%o0,	%o3
	udivx	%g5,	0x010D,	%o6
	fornot1s	%f5,	%f22,	%f23
	umulcc	%g6,	%i3,	%g1
	srax	%g4,	%g2,	%l5
	popc	%i4,	%l4
	movl	%xcc,	%g3,	%o7
	xorcc	%o5,	%i2,	%o1
	movpos	%xcc,	%l3,	%l1
	alignaddr	%l2,	%o2,	%l6
	fornot2	%f14,	%f8,	%f16
	movrgez	%l0,	0x05F,	%i7
	ldsb	[%l7 + 0x46],	%g7
	lduw	[%l7 + 0x60],	%i1
	sdiv	%i5,	0x035F,	%o4
	sdivcc	%i6,	0x0232,	%o0
	fmovs	%f29,	%f25
	fmovdg	%icc,	%f24,	%f1
	lduw	[%l7 + 0x28],	%o3
	addc	%i0,	%g5,	%g6
	movrne	%o6,	%g1,	%g4
	mulx	%g2,	0x042E,	%l5
	ldsh	[%l7 + 0x0E],	%i4
	udivx	%l4,	0x072F,	%g3
	fornot2s	%f8,	%f31,	%f22
	orncc	%o7,	%o5,	%i2
	orn	%i3,	%l3,	%l1
	sll	%l2,	%o1,	%o2
	xor	%l6,	0x0B3B,	%i7
	stx	%l0,	[%l7 + 0x68]
	nop
	set	0x1D, %i3
	ldub	[%l7 + %i3],	%i1
	smulcc	%i5,	%g7,	%o4
	fmovrdgez	%i6,	%f6,	%f8
	fandnot2	%f16,	%f20,	%f16
	fzero	%f18
	addcc	%o3,	%i0,	%o0
	sdiv	%g5,	0x0460,	%g6
	mova	%icc,	%g1,	%o6
	edge16l	%g2,	%l5,	%g4
	movpos	%icc,	%l4,	%g3
	edge16ln	%i4,	%o7,	%o5
	array8	%i3,	%l3,	%i2
	fnot1	%f10,	%f18
	xorcc	%l2,	%l1,	%o2
	fmovse	%icc,	%f31,	%f6
	add	%o1,	%i7,	%l0
	movg	%icc,	%l6,	%i1
	movg	%icc,	%i5,	%g7
	addccc	%i6,	%o3,	%o4
	edge16ln	%i0,	%o0,	%g6
	fmovdvs	%icc,	%f15,	%f20
	xor	%g1,	%o6,	%g5
	ldsb	[%l7 + 0x56],	%l5
	st	%f27,	[%l7 + 0x50]
	sllx	%g4,	0x0C,	%l4
	movg	%icc,	%g3,	%g2
	srl	%o7,	0x0B,	%o5
	fnot1s	%f1,	%f13
	fexpand	%f16,	%f6
	movgu	%xcc,	%i4,	%i3
	umulcc	%l3,	%i2,	%l2
	edge32l	%l1,	%o2,	%o1
	fornot1s	%f4,	%f15,	%f12
	sdivx	%i7,	0x1D98,	%l6
	edge16n	%l0,	%i5,	%i1
	ldsh	[%l7 + 0x30],	%g7
	fmovdleu	%icc,	%f10,	%f30
	restore %o3, %i6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i0,	[%l7 + 0x30]
	fnot2s	%f27,	%f26
	movvc	%xcc,	%o0,	%g6
	sdivcc	%g1,	0x117C,	%o6
	movneg	%xcc,	%g5,	%g4
	movn	%xcc,	%l5,	%l4
	addc	%g3,	%g2,	%o5
	srlx	%i4,	0x1F,	%i3
	movcc	%xcc,	%o7,	%l3
	orn	%i2,	%l2,	%l1
	movvc	%xcc,	%o1,	%i7
	or	%l6,	0x1A17,	%o2
	stx	%i5,	[%l7 + 0x40]
	movg	%icc,	%l0,	%i1
	sll	%o3,	0x12,	%g7
	fcmpgt16	%f0,	%f4,	%o4
	fnot2	%f0,	%f8
	movvs	%xcc,	%i6,	%o0
	fcmple32	%f26,	%f28,	%g6
	movvs	%xcc,	%g1,	%o6
	fmovsne	%xcc,	%f22,	%f31
	fcmpeq16	%f14,	%f24,	%g5
	andcc	%g4,	0x0E34,	%l5
	popc	%i0,	%l4
	smul	%g2,	0x19D3,	%g3
	lduw	[%l7 + 0x18],	%o5
	alignaddrl	%i3,	%o7,	%l3
	edge16l	%i2,	%i4,	%l1
	alignaddrl	%l2,	%o1,	%l6
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%i6
	andcc	%i5,	0x0FB5,	%o2
	edge16n	%l0,	%o3,	%i1
	ld	[%l7 + 0x0C],	%f18
	alignaddrl	%g7,	%o4,	%i6
	fpsub16	%f16,	%f6,	%f0
	fcmpne16	%f18,	%f10,	%g6
	xor	%g1,	0x1ADB,	%o0
	ldd	[%l7 + 0x60],	%g4
	xnorcc	%g4,	0x17B1,	%o6
	addcc	%l5,	%l4,	%g2
	srl	%g3,	%o5,	%i3
	udivx	%i0,	0x01CA,	%o7
	ldub	[%l7 + 0x41],	%i2
	stx	%i4,	[%l7 + 0x18]
	fmovdgu	%icc,	%f19,	%f28
	fxnors	%f16,	%f9,	%f22
	movrgez	%l1,	0x257,	%l2
	fcmpeq32	%f24,	%f2,	%l3
	fpack32	%f18,	%f4,	%f4
	addccc	%o1,	0x1217,	%l6
	lduw	[%l7 + 0x44],	%i7
	fones	%f4
	ldub	[%l7 + 0x7F],	%i5
	stx	%l0,	[%l7 + 0x20]
	sethi	0x1A69,	%o3
	sub	%o2,	%i1,	%o4
	or	%i6,	%g7,	%g6
	edge32n	%o0,	%g5,	%g1
	st	%f19,	[%l7 + 0x64]
	xor	%g4,	%o6,	%l4
	edge16l	%g2,	%l5,	%o5
	movn	%xcc,	%i3,	%i0
	mulx	%o7,	%g3,	%i2
	pdist	%f14,	%f20,	%f22
	movgu	%icc,	%l1,	%l2
	lduw	[%l7 + 0x38],	%l3
	fandnot2s	%f9,	%f27,	%f8
	edge16n	%i4,	%l6,	%i7
	srl	%i5,	%l0,	%o3
	fmovsne	%xcc,	%f12,	%f14
	edge8n	%o1,	%i1,	%o2
	addcc	%o4,	0x0AAB,	%g7
	fcmple32	%f4,	%f0,	%g6
	movcc	%xcc,	%o0,	%g5
	array32	%g1,	%i6,	%g4
	movneg	%xcc,	%l4,	%g2
	movleu	%xcc,	%o6,	%o5
	movrgz	%l5,	%i0,	%o7
	movn	%icc,	%g3,	%i2
	smulcc	%l1,	%l2,	%l3
	sethi	0x18DC,	%i3
	fand	%f22,	%f6,	%f30
	fmul8x16	%f26,	%f14,	%f4
	ldsw	[%l7 + 0x4C],	%i4
	or	%i7,	0x03C1,	%l6
	fmovscc	%icc,	%f14,	%f31
	fcmpne32	%f6,	%f4,	%l0
	movle	%xcc,	%o3,	%o1
	edge32	%i5,	%i1,	%o2
	ldsh	[%l7 + 0x7E],	%o4
	subc	%g7,	%g6,	%g5
	pdist	%f0,	%f8,	%f30
	move	%xcc,	%g1,	%o0
	movpos	%icc,	%i6,	%l4
	edge16l	%g4,	%o6,	%o5
	fmovrslez	%l5,	%f11,	%f8
	fmovscs	%xcc,	%f13,	%f4
	fpsub16s	%f4,	%f16,	%f18
	fmovrdne	%i0,	%f20,	%f24
	ldx	[%l7 + 0x30],	%o7
	orcc	%g2,	%i2,	%g3
	sub	%l1,	%l2,	%i3
	orn	%i4,	%l3,	%l6
	mulscc	%i7,	%o3,	%o1
	lduw	[%l7 + 0x50],	%l0
	fcmpne16	%f26,	%f20,	%i5
	xorcc	%i1,	0x1258,	%o4
	ldsb	[%l7 + 0x25],	%g7
	and	%o2,	%g5,	%g1
	movle	%xcc,	%g6,	%o0
	mova	%xcc,	%i6,	%l4
	orcc	%g4,	0x12E5,	%o6
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%o5
	ldx	[%l7 + 0x10],	%l5
	ldub	[%l7 + 0x2B],	%i0
	edge32	%g2,	%i2,	%g3
	std	%f20,	[%l7 + 0x60]
	movg	%icc,	%o7,	%l1
	ldsw	[%l7 + 0x18],	%i3
	xorcc	%i4,	0x0046,	%l2
	fnor	%f18,	%f0,	%f8
	fmovda	%xcc,	%f29,	%f22
	orncc	%l3,	%l6,	%o3
	std	%f6,	[%l7 + 0x38]
	xor	%o1,	%i7,	%l0
	edge16ln	%i1,	%o4,	%g7
	edge8	%i5,	%g5,	%o2
	fmovrslz	%g6,	%f28,	%f16
	ld	[%l7 + 0x40],	%f4
	fmovsn	%xcc,	%f24,	%f15
	nop
	set	0x60, %i5
	ldsb	[%l7 + %i5],	%o0
	fmovsleu	%xcc,	%f30,	%f13
	orncc	%g1,	0x1B64,	%i6
	array16	%l4,	%g4,	%o5
	fzero	%f30
	movge	%icc,	%l5,	%i0
	sethi	0x088D,	%o6
	mulscc	%i2,	0x1495,	%g3
	fmul8x16au	%f9,	%f9,	%f22
	alignaddrl	%o7,	%l1,	%i3
	sllx	%i4,	%g2,	%l3
	fmovsl	%xcc,	%f2,	%f1
	fmovrdlz	%l2,	%f30,	%f4
	edge16n	%l6,	%o1,	%i7
	xnor	%o3,	%i1,	%l0
	sir	0x04BF
	movrlz	%g7,	%i5,	%o4
	edge8ln	%g5,	%o2,	%g6
	umul	%o0,	%g1,	%l4
	andn	%i6,	%g4,	%l5
	movcs	%icc,	%o5,	%o6
	ldx	[%l7 + 0x08],	%i0
	fmovrse	%i2,	%f20,	%f6
	fornot2s	%f25,	%f28,	%f25
	movcc	%xcc,	%g3,	%o7
	movl	%icc,	%i3,	%l1
	subc	%g2,	0x19F2,	%l3
	fcmped	%fcc1,	%f24,	%f4
	alignaddrl	%l2,	%i4,	%l6
	movleu	%xcc,	%o1,	%o3
	fmovrdgez	%i7,	%f28,	%f18
	array32	%l0,	%i1,	%i5
	andncc	%g7,	%g5,	%o4
	edge32	%g6,	%o2,	%g1
	sll	%o0,	0x04,	%i6
	fpadd16s	%f24,	%f14,	%f13
	smulcc	%g4,	0x120E,	%l4
	edge32n	%o5,	%o6,	%l5
	fcmpeq32	%f2,	%f2,	%i0
	sub	%i2,	%g3,	%i3
	fmovsleu	%icc,	%f13,	%f20
	edge32ln	%l1,	%o7,	%l3
	edge16n	%g2,	%l2,	%l6
	movrgez	%i4,	%o3,	%i7
	fsrc1	%f18,	%f4
	edge16ln	%o1,	%l0,	%i5
	movvs	%xcc,	%i1,	%g7
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	sdiv	%o4,	0x0413,	%o2
	movvc	%icc,	%o0,	%g1
	srl	%i6,	0x07,	%l4
	edge32n	%g4,	%o6,	%o5
	smulcc	%i0,	%i2,	%g3
	movgu	%xcc,	%l5,	%l1
	ldsb	[%l7 + 0x17],	%i3
	array16	%o7,	%l3,	%g2
	ldsb	[%l7 + 0x52],	%l2
	smul	%l6,	%i4,	%i7
	xorcc	%o1,	0x107E,	%o3
	fsrc1	%f2,	%f12
	array16	%i5,	%i1,	%g7
	srl	%l0,	0x10,	%g6
	sub	%g5,	0x1D85,	%o4
	and	%o0,	%o2,	%g1
	movpos	%xcc,	%i6,	%g4
	sllx	%o6,	%o5,	%i0
	umul	%i2,	%l4,	%g3
	addccc	%l5,	0x180B,	%i3
	fpsub32s	%f17,	%f6,	%f10
	sll	%l1,	%o7,	%l3
	edge32ln	%g2,	%l6,	%l2
	andncc	%i7,	%i4,	%o1
	edge8n	%i5,	%o3,	%i1
	edge8l	%l0,	%g7,	%g5
	restore %o4, 0x06C4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o2,	[%l7 + 0x3B]
	fsrc1	%f4,	%f30
	umulcc	%g1,	0x028C,	%i6
	edge32	%g4,	%o6,	%o5
	std	%f12,	[%l7 + 0x40]
	array16	%o0,	%i0,	%l4
	movn	%icc,	%i2,	%l5
	andn	%g3,	0x1D7F,	%l1
	fpadd16s	%f7,	%f30,	%f4
	fmovsvs	%xcc,	%f5,	%f25
	fmul8sux16	%f12,	%f26,	%f28
	fmovscc	%icc,	%f13,	%f22
	sllx	%i3,	0x1B,	%o7
	lduw	[%l7 + 0x0C],	%g2
	movrne	%l3,	%l2,	%i7
	array32	%l6,	%i4,	%o1
	ldd	[%l7 + 0x08],	%o2
	ldsb	[%l7 + 0x0B],	%i1
	umul	%l0,	0x084D,	%g7
	movn	%xcc,	%g5,	%i5
	add	%o4,	0x0572,	%o2
	edge32	%g6,	%g1,	%i6
	movcs	%xcc,	%g4,	%o5
	edge32l	%o6,	%o0,	%l4
	sub	%i0,	0x140F,	%i2
	fmovsn	%icc,	%f9,	%f20
	fmovrslz	%g3,	%f9,	%f26
	fone	%f30
	sub	%l1,	%l5,	%o7
	movle	%xcc,	%i3,	%g2
	fmovrdgez	%l3,	%f2,	%f18
	lduh	[%l7 + 0x3C],	%l2
	movvc	%xcc,	%l6,	%i7
	movcs	%xcc,	%o1,	%i4
	save %i1, 0x02C8, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1EEE
	subccc	%l0,	0x1F59,	%g7
	bshuffle	%f24,	%f26,	%f20
	edge16l	%g5,	%o4,	%o2
	array32	%i5,	%g1,	%g6
	movcs	%icc,	%i6,	%g4
	sub	%o5,	%o6,	%o0
	edge32l	%l4,	%i0,	%i2
	fmovscc	%xcc,	%f11,	%f1
	edge32	%l1,	%l5,	%g3
	sllx	%i3,	0x10,	%g2
	fmovrde	%o7,	%f0,	%f24
	fmovs	%f4,	%f9
	movpos	%icc,	%l2,	%l6
	array8	%l3,	%o1,	%i7
	edge32n	%i4,	%o3,	%l0
	addcc	%i1,	%g5,	%g7
	fxors	%f4,	%f2,	%f7
	or	%o4,	0x068A,	%o2
	fpadd32s	%f10,	%f29,	%f3
	fcmpes	%fcc1,	%f25,	%f5
	fmul8sux16	%f12,	%f2,	%f20
	fmovde	%xcc,	%f3,	%f30
	movvc	%icc,	%g1,	%g6
	udiv	%i5,	0x1B55,	%g4
	mulscc	%i6,	%o5,	%o6
	edge32	%o0,	%l4,	%i0
	udiv	%i2,	0x1F2C,	%l1
	fmovsleu	%icc,	%f29,	%f11
	array16	%g3,	%l5,	%g2
	edge8l	%o7,	%l2,	%i3
	smulcc	%l6,	0x06EA,	%o1
	stx	%i7,	[%l7 + 0x18]
	srl	%i4,	%l3,	%l0
	udiv	%i1,	0x1F8C,	%o3
	edge16ln	%g7,	%o4,	%o2
	edge32	%g1,	%g5,	%g6
	mulx	%g4,	0x03EC,	%i5
	sllx	%o5,	%o6,	%i6
	movl	%xcc,	%l4,	%i0
	save %o0, 0x09BD, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g3, 0x1162, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g2,	%i2,	%l2
	movrgez	%o7,	%i3,	%l6
	movrlez	%i7,	%o1,	%l3
	movrlez	%l0,	%i4,	%o3
	andncc	%i1,	%o4,	%g7
	ldx	[%l7 + 0x60],	%o2
	sll	%g5,	0x1B,	%g1
	movne	%xcc,	%g4,	%i5
	ldd	[%l7 + 0x30],	%o4
	nop
	set	0x28, %g6
	lduh	[%l7 + %g6],	%o6
	ldsw	[%l7 + 0x0C],	%g6
	subc	%i6,	0x02CE,	%l4
	xor	%i0,	0x10A9,	%o0
	udivcc	%g3,	0x1BA0,	%l5
	fmovrdlz	%l1,	%f12,	%f22
	edge16	%g2,	%l2,	%o7
	mova	%xcc,	%i3,	%l6
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	fmovsge	%xcc,	%f28,	%f16
	fpadd32s	%f6,	%f20,	%f8
	movre	%l0,	%i4,	%o1
	fcmps	%fcc3,	%f10,	%f12
	stw	%i1,	[%l7 + 0x44]
	movre	%o4,	%o3,	%g7
	move	%icc,	%o2,	%g1
	xnorcc	%g4,	0x0529,	%i5
	movle	%icc,	%g5,	%o5
	andn	%o6,	0x0AB9,	%g6
	edge16	%i6,	%i0,	%o0
	lduw	[%l7 + 0x6C],	%l4
	srax	%l5,	0x1C,	%l1
	or	%g2,	0x14A6,	%g3
	array16	%l2,	%o7,	%l6
	udivcc	%i7,	0x1023,	%i2
	restore %l3, %l0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o1,	%i3
	mulx	%i1,	%o4,	%o3
	xor	%g7,	0x022E,	%o2
	ld	[%l7 + 0x5C],	%f4
	subc	%g4,	%i5,	%g1
	ldd	[%l7 + 0x50],	%f10
	fpsub16	%f6,	%f26,	%f6
	fmovdl	%icc,	%f19,	%f1
	addcc	%o5,	0x0289,	%o6
	and	%g5,	%i6,	%i0
	addccc	%o0,	0x1516,	%g6
	umul	%l5,	0x1BB1,	%l4
	movvs	%xcc,	%g2,	%g3
	fmovsleu	%icc,	%f26,	%f9
	edge16l	%l2,	%o7,	%l1
	edge16ln	%i7,	%i2,	%l6
	srl	%l3,	0x12,	%l0
	lduh	[%l7 + 0x5E],	%o1
	ld	[%l7 + 0x50],	%f22
	edge32ln	%i3,	%i4,	%o4
	save %o3, 0x0345, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g7,	%g4,	%o2
	edge32ln	%g1,	%o5,	%i5
	fnegd	%f6,	%f2
	stw	%o6,	[%l7 + 0x38]
	lduw	[%l7 + 0x58],	%i6
	array8	%g5,	%o0,	%g6
	fmovde	%xcc,	%f4,	%f21
	fmovrsgez	%l5,	%f1,	%f14
	umul	%i0,	%l4,	%g3
	andn	%g2,	0x04DA,	%l2
	umulcc	%o7,	0x1215,	%i7
	movrgz	%l1,	0x0FB,	%i2
	movrlz	%l6,	0x210,	%l0
	stx	%o1,	[%l7 + 0x08]
	fmovsg	%icc,	%f15,	%f3
	fpack16	%f14,	%f27
	edge32ln	%l3,	%i4,	%i3
	movre	%o4,	0x37D,	%o3
	fpsub16	%f22,	%f12,	%f2
	fmovda	%icc,	%f16,	%f25
	subcc	%i1,	0x1F8A,	%g7
	stx	%o2,	[%l7 + 0x08]
	orcc	%g1,	0x0C1D,	%o5
	edge8n	%i5,	%o6,	%i6
	addccc	%g4,	0x1968,	%o0
	sth	%g5,	[%l7 + 0x76]
	stx	%g6,	[%l7 + 0x50]
	ldsh	[%l7 + 0x58],	%l5
	sra	%l4,	0x09,	%i0
	umul	%g2,	%g3,	%l2
	and	%o7,	%l1,	%i7
	ldx	[%l7 + 0x08],	%l6
	lduw	[%l7 + 0x20],	%i2
	stx	%o1,	[%l7 + 0x08]
	nop
	set	0x70, %o7
	stx	%l3,	[%l7 + %o7]
	ld	[%l7 + 0x1C],	%f8
	srl	%i4,	0x0A,	%l0
	edge16n	%i3,	%o3,	%o4
	orncc	%g7,	0x0EE8,	%i1
	udivx	%o2,	0x0549,	%o5
	popc	0x13D1,	%i5
	fmovdl	%xcc,	%f0,	%f29
	edge16	%o6,	%g1,	%g4
	array8	%i6,	%g5,	%g6
	edge8l	%l5,	%l4,	%o0
	mova	%xcc,	%g2,	%g3
	lduw	[%l7 + 0x08],	%l2
	movn	%xcc,	%i0,	%l1
	movrlez	%i7,	%l6,	%o7
	nop
	set	0x4A, %g5
	sth	%o1,	[%l7 + %g5]
	alignaddrl	%l3,	%i2,	%i4
	movneg	%icc,	%l0,	%i3
	movl	%icc,	%o4,	%g7
	movrgz	%i1,	%o3,	%o5
	edge8	%o2,	%i5,	%g1
	fmovrdgez	%o6,	%f4,	%f12
	udivcc	%i6,	0x1E9F,	%g5
	movrlz	%g4,	0x1D3,	%l5
	edge16n	%g6,	%o0,	%l4
	ldd	[%l7 + 0x60],	%g2
	ldsh	[%l7 + 0x1A],	%l2
	movle	%xcc,	%i0,	%g2
	fsrc1s	%f28,	%f22
	fmovscs	%xcc,	%f20,	%f16
	sir	0x0ACB
	movcc	%xcc,	%i7,	%l6
	move	%icc,	%o7,	%l1
	fpack32	%f8,	%f4,	%f8
	edge16l	%l3,	%o1,	%i2
	st	%f21,	[%l7 + 0x78]
	umulcc	%i4,	0x1B6A,	%i3
	mulscc	%o4,	%g7,	%i1
	movrgz	%o3,	0x2E1,	%l0
	srl	%o2,	%i5,	%g1
	edge8n	%o5,	%o6,	%i6
	addc	%g4,	%l5,	%g5
	srl	%g6,	0x05,	%l4
	movn	%icc,	%o0,	%l2
	fmovrsgez	%i0,	%f14,	%f26
	edge8ln	%g3,	%g2,	%l6
	movge	%xcc,	%i7,	%o7
	move	%icc,	%l3,	%l1
	fmovrsne	%o1,	%f4,	%f1
	edge8	%i4,	%i2,	%i3
	fnors	%f18,	%f29,	%f8
	andcc	%o4,	%g7,	%i1
	stw	%l0,	[%l7 + 0x64]
	array16	%o2,	%i5,	%o3
	ld	[%l7 + 0x78],	%f13
	edge32ln	%g1,	%o6,	%o5
	lduw	[%l7 + 0x08],	%i6
	edge16n	%l5,	%g5,	%g6
	or	%l4,	%o0,	%g4
	lduw	[%l7 + 0x48],	%i0
	srl	%g3,	0x14,	%g2
	save %l2, 0x0119, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i7,	0x00C8,	%l3
	fcmpgt16	%f24,	%f28,	%l1
	fnot2	%f0,	%f28
	fornot1s	%f22,	%f20,	%f0
	movre	%o7,	0x3B4,	%i4
	orcc	%i2,	%i3,	%o4
	xnorcc	%g7,	%i1,	%l0
	movrgz	%o1,	%o2,	%i5
	umul	%g1,	%o6,	%o3
	movcc	%xcc,	%i6,	%o5
	movge	%icc,	%g5,	%l5
	stb	%l4,	[%l7 + 0x49]
	edge16ln	%g6,	%g4,	%i0
	edge32l	%g3,	%g2,	%o0
	ldd	[%l7 + 0x50],	%f6
	stx	%l6,	[%l7 + 0x58]
	fzeros	%f5
	popc	%i7,	%l3
	andncc	%l2,	%l1,	%i4
	edge8l	%o7,	%i2,	%i3
	array32	%g7,	%i1,	%l0
	mulscc	%o4,	0x0A1B,	%o2
	sth	%i5,	[%l7 + 0x34]
	movneg	%icc,	%g1,	%o6
	array8	%o1,	%i6,	%o3
	edge8ln	%g5,	%l5,	%l4
	fmovdl	%xcc,	%f14,	%f14
	edge32l	%o5,	%g4,	%i0
	edge16ln	%g6,	%g2,	%g3
	udivcc	%o0,	0x10E0,	%l6
	sdiv	%l3,	0x1DB5,	%l2
	addc	%l1,	0x1BA3,	%i7
	smul	%o7,	%i2,	%i3
	sllx	%i4,	%i1,	%g7
	udiv	%o4,	0x1DB1,	%o2
	stx	%i5,	[%l7 + 0x30]
	orncc	%g1,	%l0,	%o1
	movrgz	%i6,	0x35D,	%o6
	movrne	%g5,	0x051,	%l5
	movle	%icc,	%o3,	%l4
	fcmpes	%fcc3,	%f1,	%f30
	smulcc	%g4,	0x107C,	%o5
	ldd	[%l7 + 0x50],	%g6
	ldx	[%l7 + 0x30],	%g2
	lduh	[%l7 + 0x20],	%g3
	or	%i0,	0x1565,	%l6
	movrgz	%o0,	0x201,	%l2
	movcc	%icc,	%l1,	%l3
	fpadd32s	%f1,	%f23,	%f17
	udiv	%o7,	0x0A77,	%i2
	nop
	set	0x74, %l3
	ldsw	[%l7 + %l3],	%i3
	mulx	%i4,	0x02BE,	%i7
	sth	%g7,	[%l7 + 0x3A]
	edge8l	%o4,	%o2,	%i1
	fnot1s	%f30,	%f5
	fsrc2	%f26,	%f30
	fmul8ulx16	%f20,	%f18,	%f10
	movn	%icc,	%g1,	%i5
	edge32n	%o1,	%l0,	%o6
	fmovsg	%icc,	%f22,	%f3
	move	%icc,	%g5,	%l5
	subccc	%i6,	%o3,	%g4
	ldx	[%l7 + 0x30],	%l4
	sdivcc	%g6,	0x18CD,	%o5
	fmovdne	%xcc,	%f2,	%f3
	fands	%f31,	%f4,	%f31
	edge16n	%g2,	%i0,	%g3
	ldx	[%l7 + 0x30],	%l6
	movn	%icc,	%l2,	%l1
	lduh	[%l7 + 0x40],	%l3
	movvs	%xcc,	%o7,	%o0
	udivcc	%i3,	0x0F12,	%i4
	add	%i2,	%i7,	%o4
	srl	%g7,	%i1,	%o2
	fnegd	%f18,	%f22
	movn	%icc,	%g1,	%i5
	umul	%l0,	0x16EA,	%o1
	fabss	%f8,	%f25
	umul	%o6,	%l5,	%g5
	edge16l	%i6,	%o3,	%l4
	fornot1	%f14,	%f10,	%f8
	sdivcc	%g4,	0x181B,	%o5
	xor	%g6,	%i0,	%g2
	udivx	%g3,	0x1FC6,	%l6
	edge16n	%l1,	%l2,	%l3
	sub	%o0,	%i3,	%i4
	srax	%i2,	0x14,	%o7
	udiv	%i7,	0x1BE6,	%g7
	movle	%icc,	%i1,	%o4
	fandnot1	%f6,	%f0,	%f16
	ldd	[%l7 + 0x78],	%f22
	movg	%icc,	%o2,	%i5
	movge	%icc,	%g1,	%o1
	fmovrsgz	%l0,	%f4,	%f23
	nop
	set	0x4A, %o5
	ldsb	[%l7 + %o5],	%l5
	fmovsl	%icc,	%f20,	%f12
	alignaddr	%o6,	%g5,	%o3
	fmovdcs	%icc,	%f24,	%f19
	edge8l	%l4,	%g4,	%i6
	addcc	%o5,	0x0A5B,	%i0
	fmovdn	%icc,	%f30,	%f0
	edge32ln	%g2,	%g6,	%g3
	andncc	%l6,	%l2,	%l1
	array16	%o0,	%i3,	%l3
	movl	%xcc,	%i4,	%o7
	addc	%i2,	%i7,	%g7
	movleu	%xcc,	%i1,	%o2
	ldub	[%l7 + 0x71],	%i5
	sllx	%g1,	0x0C,	%o1
	orcc	%o4,	0x0493,	%l0
	popc	%l5,	%o6
	fmovsvc	%xcc,	%f22,	%f30
	srax	%o3,	0x04,	%g5
	movrne	%l4,	%i6,	%o5
	edge8ln	%g4,	%g2,	%i0
	fnor	%f28,	%f20,	%f14
	movcs	%xcc,	%g3,	%g6
	movcc	%icc,	%l2,	%l1
	fmuld8ulx16	%f0,	%f11,	%f0
	movrgz	%o0,	0x27B,	%i3
	nop
	set	0x70, %o4
	stb	%l6,	[%l7 + %o4]
	fmovdpos	%icc,	%f14,	%f12
	edge32	%l3,	%o7,	%i2
	movvc	%xcc,	%i4,	%i7
	movg	%icc,	%g7,	%o2
	fands	%f5,	%f24,	%f4
	movcc	%icc,	%i1,	%g1
	nop
	set	0x68, %l1
	stw	%o1,	[%l7 + %l1]
	movgu	%icc,	%i5,	%l0
	add	%o4,	%o6,	%o3
	mulscc	%g5,	0x1B71,	%l5
	ldsb	[%l7 + 0x34],	%i6
	fmovsa	%icc,	%f30,	%f14
	fmuld8sux16	%f22,	%f30,	%f6
	fmovsgu	%xcc,	%f14,	%f28
	fmovdgu	%icc,	%f18,	%f15
	st	%f22,	[%l7 + 0x24]
	ldd	[%l7 + 0x20],	%f28
	sth	%l4,	[%l7 + 0x46]
	movcc	%xcc,	%g4,	%o5
	sth	%i0,	[%l7 + 0x6A]
	mulx	%g2,	%g3,	%l2
	stx	%l1,	[%l7 + 0x48]
	movl	%xcc,	%o0,	%g6
	movgu	%icc,	%l6,	%i3
	udiv	%l3,	0x1C32,	%i2
	movge	%xcc,	%o7,	%i4
	udivx	%i7,	0x0F1E,	%g7
	sir	0x0BA4
	movn	%icc,	%i1,	%o2
	xorcc	%g1,	0x16F3,	%i5
	array16	%l0,	%o4,	%o1
	bshuffle	%f8,	%f26,	%f0
	sdivcc	%o3,	0x0E4F,	%g5
	fmul8x16al	%f18,	%f23,	%f14
	array32	%l5,	%o6,	%i6
	or	%l4,	0x0560,	%o5
	edge16	%g4,	%i0,	%g2
	movgu	%xcc,	%g3,	%l2
	alignaddr	%o0,	%l1,	%l6
	ld	[%l7 + 0x44],	%f15
	movcs	%icc,	%g6,	%l3
	alignaddrl	%i3,	%o7,	%i4
	edge8n	%i2,	%i7,	%i1
	fmovsneg	%icc,	%f5,	%f13
	orn	%g7,	%o2,	%g1
	fnot2s	%f0,	%f9
	alignaddrl	%i5,	%o4,	%o1
	xor	%o3,	%g5,	%l5
	edge8	%l0,	%o6,	%i6
	sdivx	%o5,	0x12EA,	%g4
	edge32n	%i0,	%l4,	%g3
	fmovrdgez	%l2,	%f30,	%f26
	edge32ln	%g2,	%l1,	%o0
	ldub	[%l7 + 0x0D],	%l6
	edge8ln	%g6,	%i3,	%o7
	edge32	%l3,	%i2,	%i4
	orcc	%i1,	%i7,	%o2
	alignaddrl	%g7,	%g1,	%i5
	stb	%o4,	[%l7 + 0x30]
	lduw	[%l7 + 0x78],	%o3
	fandnot2s	%f17,	%f11,	%f8
	fabsd	%f26,	%f18
	save %o1, 0x03E8, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l0,	%o6,	%l5
	edge32ln	%o5,	%g4,	%i6
	fmovrsne	%i0,	%f3,	%f15
	orcc	%l4,	0x045E,	%l2
	stb	%g3,	[%l7 + 0x69]
	sdivcc	%l1,	0x12C7,	%o0
	fpack32	%f28,	%f2,	%f12
	edge8ln	%l6,	%g2,	%g6
	smulcc	%o7,	%i3,	%l3
	fandnot1s	%f30,	%f30,	%f22
	fmovdl	%icc,	%f16,	%f29
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%i2
	fpadd16	%f24,	%f12,	%f18
	siam	0x5
	fmovsvs	%icc,	%f26,	%f28
	ldub	[%l7 + 0x6D],	%i4
	fcmple16	%f28,	%f22,	%i7
	array8	%o2,	%i1,	%g7
	edge16	%i5,	%o4,	%o3
	add	%g1,	%g5,	%l0
	move	%icc,	%o6,	%l5
	movl	%xcc,	%o1,	%o5
	udivcc	%i6,	0x1AB6,	%g4
	movgu	%icc,	%l4,	%i0
	srl	%l2,	%l1,	%g3
	addcc	%l6,	0x07AA,	%g2
	nop
	set	0x0E, %i1
	ldsb	[%l7 + %i1],	%o0
	movleu	%xcc,	%g6,	%o7
	fabss	%f29,	%f15
	udivx	%i3,	0x094B,	%l3
	xorcc	%i2,	0x169B,	%i7
	fmovsgu	%icc,	%f25,	%f6
	addcc	%i4,	0x07AB,	%o2
	andn	%g7,	%i5,	%i1
	sllx	%o4,	%o3,	%g5
	sethi	0x0093,	%l0
	save %o6, 0x1296, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x54],	%l5
	sth	%o5,	[%l7 + 0x70]
	edge8	%o1,	%g4,	%l4
	edge16	%i6,	%i0,	%l1
	popc	%l2,	%l6
	sir	0x08B5
	edge16ln	%g2,	%o0,	%g6
	addc	%o7,	0x0426,	%g3
	movcs	%xcc,	%i3,	%l3
	movrlez	%i7,	%i2,	%i4
	mulx	%g7,	%o2,	%i5
	addcc	%i1,	%o3,	%o4
	fabss	%f14,	%f4
	ldub	[%l7 + 0x72],	%g5
	edge8ln	%o6,	%g1,	%l0
	fors	%f7,	%f23,	%f20
	add	%l5,	0x0373,	%o5
	ldsw	[%l7 + 0x38],	%o1
	mulx	%g4,	%i6,	%i0
	movrlez	%l4,	%l1,	%l2
	fmovdge	%xcc,	%f24,	%f5
	movne	%icc,	%g2,	%l6
	edge32l	%g6,	%o7,	%g3
	fpadd16	%f28,	%f4,	%f2
	movneg	%icc,	%i3,	%l3
	ld	[%l7 + 0x54],	%f1
	edge16n	%i7,	%o0,	%i2
	fcmpne16	%f2,	%f0,	%i4
	sdiv	%g7,	0x11A7,	%i5
	nop
	set	0x60, %l0
	sth	%i1,	[%l7 + %l0]
	stw	%o3,	[%l7 + 0x40]
	or	%o4,	0x0CFC,	%g5
	edge8l	%o6,	%g1,	%l0
	movn	%xcc,	%o2,	%l5
	stb	%o5,	[%l7 + 0x22]
	udiv	%g4,	0x0863,	%i6
	movrlz	%i0,	%o1,	%l1
	fmovdcs	%icc,	%f30,	%f5
	lduh	[%l7 + 0x76],	%l4
	movg	%xcc,	%l2,	%l6
	bshuffle	%f0,	%f14,	%f22
	array16	%g2,	%g6,	%o7
	srlx	%g3,	0x13,	%i3
	ldsw	[%l7 + 0x7C],	%l3
	movle	%xcc,	%i7,	%i2
	ldd	[%l7 + 0x20],	%f26
	sdivx	%o0,	0x1040,	%g7
	udivcc	%i5,	0x0CC0,	%i1
	array32	%i4,	%o3,	%g5
	array16	%o6,	%o4,	%l0
	edge16n	%g1,	%o2,	%l5
	edge32ln	%g4,	%o5,	%i0
	edge32l	%o1,	%l1,	%i6
	umul	%l4,	0x0CA6,	%l6
	movrgz	%l2,	0x2E4,	%g6
	fpadd32	%f26,	%f2,	%f4
	ld	[%l7 + 0x78],	%f6
	movne	%xcc,	%g2,	%g3
	sth	%o7,	[%l7 + 0x34]
	ldx	[%l7 + 0x18],	%i3
	fmovrsgz	%l3,	%f18,	%f31
	movre	%i2,	0x12C,	%i7
	fmovse	%xcc,	%f26,	%f6
	movvc	%icc,	%o0,	%i5
	movrne	%i1,	0x1C9,	%i4
	movgu	%xcc,	%g7,	%g5
	and	%o3,	%o4,	%l0
	ldd	[%l7 + 0x38],	%o6
	movrlz	%g1,	0x1AE,	%o2
	sra	%l5,	%o5,	%i0
	andcc	%o1,	0x1B0A,	%l1
	movg	%icc,	%i6,	%l4
	movrlez	%g4,	0x07B,	%l2
	fmul8x16au	%f5,	%f15,	%f6
	fcmpeq32	%f8,	%f22,	%g6
	sdiv	%l6,	0x1E54,	%g2
	edge8l	%o7,	%i3,	%g3
	edge16	%i2,	%l3,	%i7
	movgu	%icc,	%o0,	%i5
	umul	%i1,	%i4,	%g5
	edge8ln	%g7,	%o4,	%o3
	xnor	%l0,	%o6,	%o2
	fmovsgu	%icc,	%f28,	%f10
	movre	%l5,	0x31F,	%g1
	movle	%icc,	%o5,	%i0
	edge8n	%o1,	%i6,	%l1
	alignaddrl	%l4,	%g4,	%g6
	srl	%l2,	0x11,	%l6
	edge16l	%g2,	%i3,	%o7
	edge16n	%g3,	%l3,	%i2
	movne	%xcc,	%i7,	%i5
	fmovrsgz	%o0,	%f0,	%f26
	movrgz	%i4,	%i1,	%g5
	fpackfix	%f0,	%f9
	edge8l	%g7,	%o4,	%o3
	movrne	%l0,	%o6,	%l5
	add	%g1,	0x1978,	%o5
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	orncc	%i6,	0x1BDE,	%l1
	sra	%l4,	%g4,	%g6
	addc	%l6,	%l2,	%i3
	fpadd32	%f14,	%f22,	%f28
	for	%f10,	%f18,	%f28
	movrgez	%g2,	0x0A2,	%o7
	movle	%icc,	%l3,	%i2
	fmuld8ulx16	%f17,	%f18,	%f14
	ld	[%l7 + 0x20],	%f26
	sra	%g3,	0x1F,	%i5
	ldsh	[%l7 + 0x42],	%i7
	udiv	%i4,	0x013A,	%o0
	edge16n	%i1,	%g5,	%o4
	sra	%o3,	0x05,	%g7
	array8	%l0,	%o6,	%g1
	edge16n	%l5,	%o5,	%i0
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%o2
	fmovrsgez	%i6,	%f2,	%f3
	fmovrdlez	%o1,	%f4,	%f0
	edge8ln	%l1,	%g4,	%l4
	srl	%l6,	0x0E,	%g6
	restore %l2, 0x06F2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0A0D,	%o7
	edge8	%g2,	%i2,	%l3
	fmovsleu	%xcc,	%f2,	%f19
	andn	%i5,	%g3,	%i7
	andcc	%o0,	%i1,	%g5
	movleu	%xcc,	%i4,	%o3
	siam	0x0
	fmovdg	%icc,	%f11,	%f9
	ldsh	[%l7 + 0x20],	%g7
	mulscc	%o4,	%o6,	%g1
	sllx	%l5,	0x00,	%l0
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	and	%i0,	%o1,	%l1
	move	%icc,	%g4,	%l4
	smulcc	%l6,	%g6,	%l2
	xnor	%i6,	%i3,	%o7
	sdivcc	%i2,	0x1AF0,	%g2
	orcc	%l3,	%i5,	%g3
	fmovs	%f1,	%f30
	movre	%o0,	%i7,	%i1
	edge8ln	%i4,	%g5,	%o3
	andcc	%g7,	0x1649,	%o6
	addccc	%o4,	%g1,	%l5
	movrgz	%o5,	0x08B,	%l0
	srlx	%i0,	%o2,	%l1
	orncc	%o1,	0x1AFC,	%g4
	fornot2	%f2,	%f20,	%f24
	ld	[%l7 + 0x24],	%f27
	edge16	%l6,	%g6,	%l2
	nop
	set	0x70, %i4
	lduw	[%l7 + %i4],	%l4
	fmovspos	%icc,	%f26,	%f4
	movvs	%xcc,	%i3,	%o7
	lduw	[%l7 + 0x74],	%i6
	stb	%i2,	[%l7 + 0x48]
	fmovdgu	%xcc,	%f22,	%f31
	movg	%xcc,	%g2,	%i5
	mulscc	%l3,	0x156D,	%o0
	fmovrdlz	%i7,	%f8,	%f0
	edge16n	%i1,	%g3,	%g5
	edge8l	%o3,	%i4,	%o6
	smulcc	%g7,	%o4,	%l5
	movne	%xcc,	%g1,	%o5
	sra	%i0,	0x0D,	%o2
	movrgz	%l1,	0x2E2,	%o1
	stb	%g4,	[%l7 + 0x1F]
	mulx	%l0,	%l6,	%l2
	movne	%xcc,	%g6,	%i3
	sll	%l4,	0x13,	%o7
	array32	%i2,	%i6,	%i5
	edge16l	%l3,	%g2,	%i7
	fmovrslez	%o0,	%f16,	%f29
	udivcc	%g3,	0x1D17,	%g5
	fmovsg	%xcc,	%f15,	%f0
	movle	%icc,	%i1,	%o3
	addc	%i4,	%g7,	%o6
	movge	%xcc,	%l5,	%o4
	subccc	%o5,	0x10FB,	%i0
	orncc	%g1,	%o2,	%l1
	udivcc	%o1,	0x1C3A,	%l0
	smulcc	%l6,	%l2,	%g6
	std	%f24,	[%l7 + 0x68]
	fmovdvs	%xcc,	%f25,	%f17
	add	%i3,	0x0030,	%g4
	stx	%o7,	[%l7 + 0x20]
	srlx	%i2,	0x00,	%i6
	sdivcc	%l4,	0x0182,	%i5
	movrne	%g2,	%l3,	%i7
	movcs	%xcc,	%o0,	%g5
	ldsb	[%l7 + 0x63],	%g3
	movgu	%xcc,	%o3,	%i1
	edge16l	%i4,	%g7,	%o6
	fxors	%f25,	%f15,	%f17
	fmovdgu	%xcc,	%f26,	%f25
	movleu	%icc,	%l5,	%o4
	fnot2	%f22,	%f28
	edge16l	%i0,	%o5,	%o2
	movn	%xcc,	%l1,	%o1
	edge16	%g1,	%l0,	%l2
	stw	%g6,	[%l7 + 0x0C]
	edge8ln	%l6,	%g4,	%o7
	nop
	set	0x58, %i0
	std	%f30,	[%l7 + %i0]
	popc	0x0502,	%i2
	array32	%i3,	%l4,	%i6
	orn	%i5,	0x00CB,	%l3
	ldx	[%l7 + 0x10],	%i7
	movrlz	%g2,	0x29E,	%g5
	srl	%o0,	%o3,	%g3
	fmovrdgez	%i1,	%f20,	%f24
	andcc	%i4,	0x12DE,	%g7
	stx	%o6,	[%l7 + 0x30]
	fmul8ulx16	%f8,	%f2,	%f18
	ldub	[%l7 + 0x37],	%o4
	udivx	%i0,	0x0EFB,	%l5
	movrlz	%o5,	%l1,	%o2
	movge	%icc,	%o1,	%l0
	ldd	[%l7 + 0x70],	%f18
	and	%l2,	0x01EF,	%g6
	fcmple16	%f0,	%f16,	%l6
	stw	%g4,	[%l7 + 0x38]
	movrlz	%g1,	0x275,	%i2
	movpos	%xcc,	%o7,	%i3
	fmovdg	%icc,	%f8,	%f0
	movrne	%l4,	0x21D,	%i5
	udivcc	%i6,	0x0A2C,	%l3
	sllx	%g2,	%g5,	%o0
	fmovrse	%i7,	%f12,	%f8
	mova	%icc,	%o3,	%i1
	fpadd16s	%f3,	%f3,	%f12
	movvs	%xcc,	%i4,	%g3
	alignaddrl	%g7,	%o4,	%o6
	std	%f26,	[%l7 + 0x58]
	stb	%l5,	[%l7 + 0x16]
	subccc	%o5,	%l1,	%i0
	movge	%xcc,	%o1,	%l0
	fand	%f8,	%f26,	%f14
	sra	%l2,	%o2,	%l6
	fone	%f18
	movn	%xcc,	%g6,	%g1
	movl	%icc,	%i2,	%g4
	movrlez	%i3,	%l4,	%i5
	lduh	[%l7 + 0x22],	%i6
	fands	%f20,	%f30,	%f28
	move	%xcc,	%o7,	%g2
	stw	%g5,	[%l7 + 0x38]
	edge16ln	%l3,	%o0,	%i7
	fpack32	%f22,	%f14,	%f26
	fmovda	%xcc,	%f29,	%f9
	fmovsge	%icc,	%f28,	%f11
	fcmps	%fcc0,	%f1,	%f16
	fornot2s	%f4,	%f24,	%f14
	movge	%xcc,	%i1,	%o3
	orcc	%i4,	%g3,	%o4
	pdist	%f18,	%f20,	%f2
	lduh	[%l7 + 0x14],	%g7
	fmovsge	%icc,	%f25,	%f21
	addc	%o6,	0x0441,	%l5
	edge8n	%l1,	%o5,	%o1
	pdist	%f26,	%f30,	%f0
	fmovrslz	%i0,	%f30,	%f22
	movcc	%icc,	%l0,	%o2
	movg	%icc,	%l6,	%g6
	fpmerge	%f1,	%f2,	%f26
	add	%g1,	0x0FFF,	%i2
	edge8	%g4,	%i3,	%l4
	lduw	[%l7 + 0x38],	%i5
	movvs	%xcc,	%l2,	%o7
	stx	%i6,	[%l7 + 0x38]
	xnorcc	%g5,	%g2,	%l3
	srax	%o0,	%i1,	%o3
	fnand	%f0,	%f28,	%f2
	fmovdpos	%xcc,	%f17,	%f10
	ldd	[%l7 + 0x30],	%i6
	fzero	%f12
	edge16ln	%i4,	%g3,	%o4
	edge32ln	%o6,	%g7,	%l5
	edge32n	%o5,	%l1,	%i0
	xnor	%l0,	0x0649,	%o2
	sub	%o1,	%g6,	%g1
	movcs	%icc,	%i2,	%g4
	fcmpeq16	%f10,	%f18,	%l6
	movrgz	%i3,	%i5,	%l2
	fandnot2s	%f5,	%f23,	%f3
	fnot2s	%f31,	%f14
	edge32	%o7,	%i6,	%l4
	edge16	%g2,	%l3,	%g5
	siam	0x2
	udivcc	%i1,	0x02D2,	%o3
	subcc	%o0,	%i7,	%g3
	lduw	[%l7 + 0x64],	%i4
	edge16ln	%o4,	%o6,	%l5
	stw	%o5,	[%l7 + 0x18]
	sdivcc	%l1,	0x19EF,	%i0
	array8	%g7,	%o2,	%l0
	movcs	%icc,	%g6,	%g1
	pdist	%f0,	%f20,	%f22
	sllx	%o1,	0x1A,	%g4
	movvc	%xcc,	%i2,	%l6
	ld	[%l7 + 0x50],	%f20
	fmovrsne	%i5,	%f20,	%f22
	alignaddrl	%i3,	%l2,	%i6
	umul	%l4,	0x134D,	%g2
	fpack16	%f16,	%f2
	sll	%l3,	%o7,	%i1
	movrgez	%o3,	%g5,	%i7
	ldx	[%l7 + 0x70],	%g3
	array32	%i4,	%o4,	%o0
	udiv	%o6,	0x1599,	%l5
	nop
	set	0x48, %l2
	stx	%l1,	[%l7 + %l2]
	sdiv	%i0,	0x1555,	%g7
	sra	%o2,	%l0,	%o5
	move	%xcc,	%g6,	%g1
	movrne	%g4,	%o1,	%l6
	stb	%i5,	[%l7 + 0x52]
	sir	0x171A
	sdivx	%i3,	0x1B0D,	%i2
	ldx	[%l7 + 0x70],	%i6
	array32	%l4,	%l2,	%l3
	subc	%o7,	0x1AA4,	%g2
	fmovsleu	%icc,	%f25,	%f3
	andn	%i1,	0x127E,	%o3
	andcc	%i7,	%g5,	%g3
	fmovrsgez	%i4,	%f26,	%f7
	movre	%o4,	0x28A,	%o6
	fmul8sux16	%f22,	%f20,	%f8
	ldsw	[%l7 + 0x68],	%o0
	fsrc2s	%f23,	%f18
	fcmpgt32	%f10,	%f22,	%l5
	fmovsg	%xcc,	%f25,	%f6
	fnegd	%f22,	%f30
	subcc	%l1,	0x1306,	%i0
	ld	[%l7 + 0x38],	%f2
	edge16l	%o2,	%l0,	%g7
	smul	%g6,	0x169E,	%g1
	fandnot1s	%f20,	%f8,	%f6
	movleu	%xcc,	%o5,	%g4
	udivx	%o1,	0x09B7,	%i5
	fmovdcs	%xcc,	%f30,	%f27
	movn	%icc,	%l6,	%i3
	fnot2	%f28,	%f12
	st	%f7,	[%l7 + 0x5C]
	ldd	[%l7 + 0x20],	%f28
	save %i6, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l3,	0x0294,	%o7
	movrgz	%g2,	%i2,	%i1
	alignaddr	%o3,	%i7,	%g5
	movrlez	%i4,	%g3,	%o6
	andcc	%o0,	%o4,	%l5
	ld	[%l7 + 0x48],	%f0
	subccc	%l1,	%o2,	%i0
	fzeros	%f15
	nop
	set	0x0B, %o1
	ldsb	[%l7 + %o1],	%l0
	sll	%g7,	%g1,	%o5
	movgu	%icc,	%g4,	%g6
	xnor	%o1,	%l6,	%i5
	move	%icc,	%i3,	%i6
	restore %l4, 0x18FA, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l3,	%f18,	%f30
	udivx	%o7,	0x1B3C,	%g2
	alignaddrl	%i2,	%o3,	%i1
	save %i7, 0x0FB7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g5,	%g3,	%o0
	fmul8sux16	%f10,	%f22,	%f26
	fmovscc	%icc,	%f14,	%f23
	lduh	[%l7 + 0x50],	%o4
	ldsh	[%l7 + 0x46],	%o6
	movne	%xcc,	%l1,	%o2
	ldsw	[%l7 + 0x34],	%l5
	lduw	[%l7 + 0x68],	%i0
	alignaddr	%l0,	%g7,	%o5
	movgu	%xcc,	%g4,	%g6
	fmovspos	%icc,	%f5,	%f12
	movpos	%xcc,	%g1,	%o1
	fmul8x16	%f2,	%f22,	%f12
	movge	%icc,	%l6,	%i3
	ldd	[%l7 + 0x28],	%f12
	std	%f6,	[%l7 + 0x58]
	ldub	[%l7 + 0x72],	%i6
	umul	%i5,	0x1837,	%l2
	movre	%l4,	%l3,	%o7
	orcc	%g2,	0x0CB7,	%o3
	movle	%xcc,	%i2,	%i7
	array16	%i4,	%g5,	%i1
	movne	%icc,	%g3,	%o4
	edge32n	%o0,	%o6,	%l1
	movneg	%xcc,	%o2,	%i0
	movrne	%l0,	0x170,	%l5
	addccc	%g7,	%g4,	%o5
	sth	%g6,	[%l7 + 0x20]
	orcc	%g1,	0x0AEB,	%l6
	movrgz	%o1,	0x0A0,	%i6
	movn	%icc,	%i5,	%i3
	fmovdpos	%xcc,	%f28,	%f11
	andcc	%l2,	%l4,	%l3
	edge32	%o7,	%g2,	%i2
	movle	%icc,	%i7,	%o3
	fxor	%f22,	%f14,	%f16
	lduw	[%l7 + 0x64],	%i4
	fmovrsgz	%g5,	%f6,	%f3
	array8	%i1,	%g3,	%o4
	xnor	%o6,	0x113B,	%o0
	ld	[%l7 + 0x4C],	%f18
	fcmpgt16	%f14,	%f14,	%l1
	subc	%o2,	0x0B1B,	%i0
	edge8ln	%l5,	%g7,	%l0
	array8	%o5,	%g6,	%g4
	mova	%xcc,	%g1,	%o1
	fmovrdgez	%l6,	%f22,	%f16
	andn	%i5,	%i3,	%l2
	smul	%i6,	%l4,	%o7
	xnor	%g2,	0x1AC3,	%i2
	fmovrsgz	%l3,	%f22,	%f13
	fsrc2s	%f6,	%f18
	srl	%i7,	0x00,	%i4
	mulx	%o3,	0x1A24,	%g5
	ldx	[%l7 + 0x60],	%i1
	umul	%g3,	0x16B2,	%o6
	fmovspos	%icc,	%f15,	%f26
	srlx	%o4,	0x13,	%o0
	xnorcc	%o2,	%l1,	%i0
	fornot1s	%f24,	%f2,	%f26
	fxors	%f15,	%f23,	%f25
	movge	%xcc,	%l5,	%g7
	ldub	[%l7 + 0x69],	%l0
	fands	%f25,	%f17,	%f26
	edge8	%g6,	%o5,	%g4
	edge32	%g1,	%l6,	%i5
	movrlz	%i3,	0x32D,	%l2
	fandnot1	%f6,	%f14,	%f12
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%o1
	subc	%l4,	%o7,	%g2
	andn	%i2,	%l3,	%i7
	fmovrdlez	%i4,	%f16,	%f28
	movrlez	%o3,	0x353,	%i6
	edge32	%g5,	%g3,	%o6
	pdist	%f20,	%f8,	%f12
	fpadd32s	%f0,	%f4,	%f5
	fmovrde	%i1,	%f14,	%f4
	movcs	%icc,	%o4,	%o0
	umul	%o2,	0x135C,	%i0
	sllx	%l1,	0x08,	%l5
	edge8	%l0,	%g7,	%o5
	movn	%icc,	%g4,	%g6
	edge16	%l6,	%i5,	%i3
	fpsub32	%f14,	%f30,	%f4
	sllx	%g1,	%o1,	%l4
	popc	0x1D1F,	%o7
	movg	%xcc,	%l2,	%i2
	orn	%g2,	%l3,	%i4
	addc	%o3,	0x1176,	%i7
	fexpand	%f23,	%f0
	sdivx	%g5,	0x0424,	%i6
	st	%f16,	[%l7 + 0x30]
	andn	%g3,	%i1,	%o6
	fmuld8ulx16	%f28,	%f20,	%f26
	addccc	%o0,	0x04A5,	%o2
	sdivcc	%i0,	0x00DB,	%l1
	edge8l	%o4,	%l5,	%g7
	movn	%xcc,	%o5,	%g4
	movvs	%xcc,	%l0,	%l6
	subccc	%g6,	0x007E,	%i5
	andcc	%i3,	%g1,	%o1
	mulscc	%l4,	%o7,	%i2
	xorcc	%g2,	0x14A6,	%l2
	move	%xcc,	%i4,	%o3
	xnor	%l3,	%i7,	%i6
	nop
	set	0x38, %g3
	ldx	[%l7 + %g3],	%g3
	fandnot2	%f30,	%f8,	%f10
	edge16n	%g5,	%i1,	%o0
	movrlez	%o2,	0x1D3,	%i0
	addccc	%l1,	0x09D6,	%o6
	fxnors	%f26,	%f18,	%f9
	umul	%o4,	%g7,	%l5
	edge16	%g4,	%o5,	%l0
	sll	%l6,	0x0F,	%i5
	fcmple16	%f22,	%f6,	%i3
	edge8ln	%g6,	%g1,	%l4
	edge16ln	%o1,	%i2,	%o7
	alignaddr	%g2,	%i4,	%o3
	subccc	%l2,	%l3,	%i6
	array8	%g3,	%g5,	%i7
	ldsb	[%l7 + 0x0C],	%i1
	movle	%icc,	%o2,	%o0
	edge8l	%i0,	%o6,	%l1
	sth	%g7,	[%l7 + 0x68]
	edge32l	%o4,	%l5,	%g4
	fmovrsgz	%o5,	%f27,	%f10
	ldd	[%l7 + 0x08],	%i6
	sir	0x149A
	movne	%xcc,	%l0,	%i5
	fmovdne	%xcc,	%f9,	%f25
	andncc	%g6,	%g1,	%i3
	fmovscs	%xcc,	%f8,	%f1
	edge32	%l4,	%i2,	%o7
	ldub	[%l7 + 0x67],	%g2
	xor	%o1,	0x02C3,	%i4
	xor	%l2,	%l3,	%o3
	fmovsneg	%icc,	%f1,	%f11
	edge8	%i6,	%g5,	%g3
	mulscc	%i7,	%o2,	%i1
	sethi	0x051D,	%i0
	udivx	%o6,	0x1E5C,	%l1
	xorcc	%g7,	%o4,	%l5
	ldd	[%l7 + 0x30],	%g4
	ldd	[%l7 + 0x50],	%o4
	fornot2	%f12,	%f12,	%f20
	srax	%o0,	%l0,	%l6
	edge8n	%i5,	%g1,	%g6
	ldsw	[%l7 + 0x30],	%i3
	movgu	%icc,	%l4,	%o7
	addccc	%i2,	0x0EEB,	%o1
	ldsb	[%l7 + 0x18],	%i4
	smul	%l2,	0x1336,	%l3
	smulcc	%o3,	0x1FDE,	%g2
	xor	%g5,	0x08DC,	%g3
	fmovrdlez	%i6,	%f22,	%f26
	sub	%o2,	%i7,	%i1
	move	%xcc,	%i0,	%o6
	ldsh	[%l7 + 0x28],	%l1
	fnot1s	%f25,	%f8
	srl	%o4,	%l5,	%g7
	fmovscs	%icc,	%f5,	%f9
	lduw	[%l7 + 0x30],	%o5
	andncc	%o0,	%l0,	%l6
	movge	%xcc,	%i5,	%g4
	edge32ln	%g1,	%g6,	%i3
	fmovsvc	%xcc,	%f30,	%f2
	mova	%xcc,	%l4,	%i2
	movrgz	%o1,	%i4,	%o7
	stx	%l3,	[%l7 + 0x60]
	fmovrsgez	%o3,	%f10,	%f23
	fmovdge	%xcc,	%f11,	%f24
	nop
	set	0x1C, %g2
	sth	%l2,	[%l7 + %g2]
	mulscc	%g2,	%g5,	%g3
	smul	%o2,	%i7,	%i6
	fmovdl	%icc,	%f10,	%f12
	fmuld8ulx16	%f14,	%f19,	%f24
	popc	%i0,	%o6
	smulcc	%i1,	0x0867,	%o4
	sdiv	%l5,	0x1E19,	%l1
	alignaddrl	%o5,	%g7,	%l0
	xnor	%o0,	0x1F90,	%l6
	movre	%i5,	%g4,	%g1
	add	%g6,	0x0BB7,	%i3
	fors	%f4,	%f14,	%f29
	fcmpne32	%f22,	%f18,	%l4
	fmovspos	%icc,	%f20,	%f25
	movrgz	%o1,	0x12C,	%i2
	stx	%i4,	[%l7 + 0x28]
	sir	0x0456
	fpadd32	%f24,	%f18,	%f6
	ldsw	[%l7 + 0x58],	%l3
	movl	%xcc,	%o3,	%l2
	addc	%o7,	0x1CC0,	%g2
	sllx	%g5,	%g3,	%i7
	sth	%i6,	[%l7 + 0x32]
	fmul8sux16	%f0,	%f30,	%f2
	fexpand	%f2,	%f16
	fpadd32	%f10,	%f14,	%f28
	orncc	%o2,	%i0,	%o6
	fcmple32	%f14,	%f0,	%i1
	fpsub32	%f22,	%f10,	%f8
	xor	%l5,	%l1,	%o5
	xnorcc	%o4,	%g7,	%o0
	orncc	%l0,	%l6,	%i5
	movrgez	%g4,	0x176,	%g6
	stb	%i3,	[%l7 + 0x5E]
	movvs	%xcc,	%l4,	%g1
	andcc	%o1,	%i2,	%l3
	edge32ln	%i4,	%o3,	%l2
	movneg	%xcc,	%g2,	%o7
	movvs	%xcc,	%g3,	%i7
	edge8	%g5,	%o2,	%i0
	save %i6, %o6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	%l1,	%o4
	stw	%g7,	[%l7 + 0x3C]
	srlx	%o5,	%l0,	%o0
	nop
	set	0x5C, %g4
	sth	%l6,	[%l7 + %g4]
	xnorcc	%g4,	0x18A2,	%i5
	addc	%g6,	0x0E9B,	%i3
	movle	%icc,	%l4,	%o1
	addcc	%i2,	0x00D8,	%l3
	ldsb	[%l7 + 0x0C],	%i4
	save %g1, 0x169B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o3,	0x047A,	%g2
	fornot2	%f2,	%f10,	%f16
	addc	%o7,	0x0EB8,	%g3
	movrgz	%i7,	0x31F,	%o2
	movge	%icc,	%i0,	%i6
	fmovdcc	%icc,	%f23,	%f28
	fpsub32	%f0,	%f4,	%f18
	ldx	[%l7 + 0x08],	%g5
	fnands	%f1,	%f4,	%f12
	edge16n	%o6,	%l5,	%i1
	xorcc	%o4,	0x149A,	%l1
	xnor	%o5,	0x03B8,	%g7
	movrne	%o0,	0x2AC,	%l0
	sethi	0x1FFD,	%g4
	edge32ln	%l6,	%i5,	%g6
	orcc	%i3,	%l4,	%i2
	fmovdvc	%icc,	%f16,	%f8
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	movvs	%icc,	%i4,	%l2
	fpadd32	%f0,	%f10,	%f14
	ldub	[%l7 + 0x09],	%g1
	ld	[%l7 + 0x34],	%f19
	nop
	set	0x18, %g7
	ldub	[%l7 + %g7],	%o3
	movg	%icc,	%o7,	%g2
	movpos	%xcc,	%g3,	%i7
	sdiv	%o2,	0x1721,	%i0
	stx	%g5,	[%l7 + 0x28]
	edge32	%o6,	%l5,	%i1
	add	%o4,	%i6,	%l1
	movpos	%xcc,	%g7,	%o5
	addccc	%l0,	%g4,	%o0
	fmovdleu	%icc,	%f27,	%f3
	fmovspos	%xcc,	%f29,	%f26
	fmovsvc	%icc,	%f21,	%f2
	edge32	%i5,	%l6,	%g6
	popc	0x0F4F,	%i3
	addccc	%i2,	%o1,	%l3
	srl	%i4,	0x02,	%l2
	subcc	%l4,	0x1410,	%o3
	xnorcc	%o7,	%g2,	%g3
	fmovrdgez	%g1,	%f24,	%f30
	fmovdn	%icc,	%f25,	%f21
	movn	%xcc,	%i7,	%i0
	movrgez	%g5,	%o6,	%o2
	andncc	%l5,	%o4,	%i6
	sth	%l1,	[%l7 + 0x62]
	ldsb	[%l7 + 0x27],	%i1
	fmovsg	%icc,	%f21,	%f3
	alignaddrl	%o5,	%g7,	%g4
	srl	%l0,	0x0F,	%i5
	movcs	%xcc,	%l6,	%g6
	xor	%o0,	%i2,	%o1
	addccc	%i3,	0x009D,	%i4
	movvs	%xcc,	%l3,	%l4
	ldsb	[%l7 + 0x21],	%o3
	movrlez	%l2,	%g2,	%o7
	array16	%g3,	%g1,	%i0
	array32	%g5,	%o6,	%o2
	movrgez	%i7,	0x282,	%l5
	lduw	[%l7 + 0x0C],	%o4
	st	%f4,	[%l7 + 0x74]
	ldd	[%l7 + 0x08],	%f8
	array16	%l1,	%i1,	%o5
	addcc	%i6,	%g4,	%l0
	add	%i5,	0x092A,	%g7
	movge	%icc,	%l6,	%g6
	fmovdvc	%icc,	%f6,	%f23
	andn	%i2,	%o1,	%i3
	stx	%o0,	[%l7 + 0x58]
	fpadd32s	%f14,	%f28,	%f13
	fcmple16	%f2,	%f20,	%i4
	sllx	%l4,	0x03,	%l3
	movrgez	%o3,	0x126,	%g2
	edge32ln	%o7,	%g3,	%g1
	mulscc	%i0,	%l2,	%g5
	subc	%o2,	0x01E0,	%o6
	fmovda	%icc,	%f16,	%f28
	or	%i7,	0x1217,	%o4
	or	%l1,	0x1956,	%i1
	stb	%o5,	[%l7 + 0x68]
	fors	%f29,	%f27,	%f0
	and	%i6,	0x0E65,	%g4
	stw	%l0,	[%l7 + 0x20]
	ldsh	[%l7 + 0x76],	%l5
	save %g7, %i5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l6,	%o1,	%i2
	ldsh	[%l7 + 0x74],	%i3
	popc	%i4,	%o0
	andncc	%l4,	%o3,	%l3
	edge8n	%o7,	%g3,	%g1
	addcc	%i0,	%l2,	%g5
	sub	%o2,	%g2,	%o6
	movrgez	%i7,	0x29C,	%l1
	edge16ln	%o4,	%i1,	%i6
	fcmple32	%f14,	%f0,	%o5
	subc	%l0,	0x145D,	%l5
	movrgz	%g4,	0x1BE,	%g7
	subcc	%g6,	0x0EFD,	%i5
	edge8n	%l6,	%o1,	%i2
	stw	%i3,	[%l7 + 0x18]
	ldsb	[%l7 + 0x0B],	%o0
	movpos	%icc,	%l4,	%i4
	movle	%icc,	%o3,	%o7
	edge8ln	%l3,	%g1,	%i0
	edge16	%g3,	%l2,	%g5
	ld	[%l7 + 0x60],	%f17
	xor	%g2,	0x15F0,	%o2
	fpsub16	%f28,	%f10,	%f10
	lduh	[%l7 + 0x14],	%i7
	array8	%l1,	%o6,	%i1
	movvc	%icc,	%o4,	%o5
	movrgz	%l0,	0x074,	%i6
	fmovs	%f30,	%f18
	fmovdge	%icc,	%f18,	%f10
	smul	%l5,	%g4,	%g7
	ldub	[%l7 + 0x4F],	%i5
	subc	%g6,	0x0256,	%l6
	mulx	%o1,	%i2,	%o0
	ldd	[%l7 + 0x48],	%i2
	orncc	%l4,	0x059A,	%o3
	sth	%o7,	[%l7 + 0x10]
	nop
	set	0x37, %o2
	ldsb	[%l7 + %o2],	%l3
	orn	%g1,	0x1560,	%i4
	umulcc	%g3,	0x00C8,	%i0
	orcc	%g5,	%l2,	%g2
	addc	%o2,	%l1,	%o6
	fmovdvs	%icc,	%f28,	%f22
	edge16l	%i7,	%o4,	%o5
	fmovd	%f20,	%f20
	ldd	[%l7 + 0x78],	%f4
	array8	%i1,	%l0,	%i6
	ldsh	[%l7 + 0x56],	%l5
	fmuld8sux16	%f5,	%f2,	%f2
	ldub	[%l7 + 0x26],	%g4
	faligndata	%f10,	%f4,	%f28
	restore %i5, 0x1CC4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g6,	%o1,	%i2
	andcc	%o0,	0x0496,	%i3
	edge8ln	%l6,	%o3,	%o7
	andn	%l4,	%g1,	%i4
	fnand	%f6,	%f6,	%f10
	movvs	%icc,	%g3,	%l3
	ldsw	[%l7 + 0x58],	%i0
	fmovsa	%xcc,	%f25,	%f7
	movre	%l2,	%g5,	%o2
	lduh	[%l7 + 0x18],	%g2
	andcc	%l1,	0x1730,	%o6
	ldub	[%l7 + 0x59],	%o4
	edge16ln	%o5,	%i7,	%l0
	movl	%icc,	%i1,	%i6
	edge8ln	%l5,	%g4,	%g7
	sth	%i5,	[%l7 + 0x48]
	movcs	%xcc,	%g6,	%i2
	andncc	%o0,	%o1,	%i3
	fexpand	%f2,	%f6
	xnorcc	%l6,	0x0547,	%o3
	edge16	%l4,	%g1,	%o7
	movne	%xcc,	%g3,	%l3
	fmovdg	%xcc,	%f4,	%f19
	st	%f2,	[%l7 + 0x5C]
	movrlez	%i0,	%i4,	%g5
	stw	%o2,	[%l7 + 0x5C]
	movrgz	%g2,	%l1,	%o6
	stb	%o4,	[%l7 + 0x36]
	movrgz	%l2,	0x093,	%i7
	srax	%l0,	0x0C,	%i1
	srax	%i6,	%l5,	%o5
	st	%f11,	[%l7 + 0x6C]
	fmovsneg	%icc,	%f0,	%f14
	subccc	%g7,	0x081E,	%i5
	movrne	%g6,	0x25C,	%i2
	movvc	%icc,	%o0,	%g4
	or	%o1,	0x1EB6,	%l6
	sll	%o3,	0x10,	%i3
	fmovdn	%xcc,	%f18,	%f14
	movpos	%xcc,	%g1,	%l4
	st	%f15,	[%l7 + 0x54]
	fpackfix	%f14,	%f18
	subc	%g3,	%o7,	%i0
	fxnors	%f4,	%f24,	%f19
	orn	%l3,	%g5,	%i4
	fmovrslz	%o2,	%f5,	%f29
	fmovdge	%xcc,	%f28,	%f24
	edge32ln	%g2,	%o6,	%o4
	movcc	%icc,	%l2,	%l1
	srl	%l0,	%i7,	%i1
	subc	%l5,	%o5,	%i6
	movn	%icc,	%g7,	%g6
	ldsh	[%l7 + 0x26],	%i5
	edge32ln	%i2,	%o0,	%o1
	ldd	[%l7 + 0x50],	%i6
	ldub	[%l7 + 0x76],	%g4
	movcs	%icc,	%o3,	%i3
	fpsub16	%f12,	%f20,	%f26
	fpadd32	%f16,	%f0,	%f2
	movrlez	%l4,	0x04C,	%g1
	or	%o7,	0x17B4,	%i0
	ldx	[%l7 + 0x08],	%g3
	edge32l	%g5,	%l3,	%i4
	xnor	%o2,	%o6,	%o4
	edge16l	%g2,	%l2,	%l0
	sub	%i7,	0x0A1A,	%l1
	orncc	%i1,	%o5,	%l5
	fone	%f4
	and	%g7,	%i6,	%i5
	movg	%xcc,	%i2,	%g6
	edge8n	%o0,	%l6,	%o1
	fmul8ulx16	%f26,	%f20,	%f4
	fnor	%f10,	%f26,	%f22
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	addcc	%l4,	%o3,	%o7
	edge16n	%i0,	%g1,	%g3
	popc	%l3,	%g5
	sdiv	%i4,	0x136A,	%o6
	edge16n	%o4,	%o2,	%l2
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%l0
	popc	0x01A8,	%g2
	xnorcc	%i7,	%i1,	%l1
	edge8	%o5,	%g7,	%l5
	fxnors	%f15,	%f3,	%f22
	movleu	%xcc,	%i6,	%i5
	movleu	%icc,	%g6,	%i2
	fcmpgt16	%f24,	%f4,	%o0
	srax	%l6,	%o1,	%i3
	nop
	set	0x4C, %l4
	stw	%l4,	[%l7 + %l4]
	sdivcc	%o3,	0x1D73,	%g4
	lduh	[%l7 + 0x36],	%o7
	add	%g1,	0x0F5B,	%i0
	fnot2s	%f5,	%f3
	popc	0x04CE,	%g3
	movrgez	%l3,	%g5,	%o6
	andncc	%i4,	%o4,	%l2
	edge8n	%o2,	%g2,	%l0
	movcc	%icc,	%i1,	%l1
	xnor	%o5,	0x14F6,	%g7
	fornot1s	%f5,	%f18,	%f7
	orcc	%l5,	0x1BB2,	%i7
	movre	%i5,	%i6,	%i2
	movvs	%xcc,	%g6,	%l6
	edge8l	%o0,	%o1,	%l4
	ldsw	[%l7 + 0x6C],	%o3
	mulx	%i3,	0x13CA,	%g4
	movrlz	%o7,	%g1,	%i0
	edge8	%g3,	%g5,	%o6
	sllx	%i4,	%l3,	%o4
	fornot1	%f16,	%f26,	%f26
	addc	%o2,	0x17DC,	%g2
	fmovsle	%icc,	%f3,	%f13
	fpmerge	%f18,	%f1,	%f26
	or	%l2,	%i1,	%l1
	umulcc	%o5,	0x142B,	%l0
	popc	0x136A,	%l5
	edge16l	%g7,	%i7,	%i5
	fmul8x16	%f0,	%f2,	%f26
	alignaddr	%i2,	%g6,	%l6
	movrgz	%i6,	%o1,	%o0
	fone	%f24
	movn	%icc,	%o3,	%l4
	movl	%icc,	%g4,	%i3
	sethi	0x0010,	%o7
	movcc	%icc,	%g1,	%i0
	ldsw	[%l7 + 0x74],	%g3
	sth	%g5,	[%l7 + 0x16]
	edge16n	%i4,	%l3,	%o4
	fmovscs	%icc,	%f17,	%f13
	addc	%o6,	%g2,	%o2
	fsrc2s	%f6,	%f1
	alignaddr	%i1,	%l2,	%l1
	orn	%l0,	0x139F,	%o5
	xorcc	%g7,	0x1466,	%l5
	orcc	%i5,	0x05D6,	%i2
	movcs	%xcc,	%i7,	%g6
	movge	%icc,	%l6,	%i6
	movcs	%xcc,	%o1,	%o3
	addc	%l4,	%g4,	%i3
	save %o7, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f2,	%f23,	%f28
	ldx	[%l7 + 0x68],	%g3
	stb	%g5,	[%l7 + 0x6C]
	alignaddrl	%i0,	%i4,	%l3
	fmovsn	%xcc,	%f20,	%f14
	smul	%o4,	0x1E65,	%g2
	alignaddrl	%o6,	%i1,	%o2
	umul	%l1,	%l0,	%o5
	srl	%l2,	0x18,	%l5
	st	%f7,	[%l7 + 0x60]
	edge16n	%g7,	%i2,	%i7
	xorcc	%i5,	0x10CE,	%l6
	movrgez	%g6,	%i6,	%o3
	edge32n	%o1,	%l4,	%i3
	array32	%o7,	%g4,	%g1
	ldub	[%l7 + 0x21],	%g3
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%o0
	mulx	%g5,	0x0D75,	%i0
	ldsh	[%l7 + 0x68],	%i4
	udivcc	%o4,	0x1171,	%g2
	movcs	%icc,	%l3,	%i1
	movne	%icc,	%o2,	%o6
	fmul8x16au	%f9,	%f19,	%f14
	ld	[%l7 + 0x6C],	%f12
	stx	%l1,	[%l7 + 0x20]
	fmovdneg	%icc,	%f31,	%f23
	fmovdne	%xcc,	%f8,	%f0
	xnorcc	%o5,	%l0,	%l5
	or	%l2,	0x1950,	%g7
	fpackfix	%f6,	%f9
	stw	%i2,	[%l7 + 0x10]
	fpackfix	%f8,	%f8
	ldub	[%l7 + 0x3A],	%i7
	andn	%l6,	%g6,	%i6
	stw	%i5,	[%l7 + 0x1C]
	orncc	%o3,	0x1400,	%o1
	andcc	%l4,	%i3,	%o7
	sethi	0x1DD6,	%g1
	movcs	%icc,	%g4,	%g3
	andn	%g5,	0x0750,	%i0
	srlx	%i4,	0x08,	%o4
	edge8l	%o0,	%g2,	%l3
	fmovrsgz	%o2,	%f11,	%f6
	sdivcc	%i1,	0x0DE9,	%l1
	siam	0x4
	subcc	%o6,	%o5,	%l0
	ldsw	[%l7 + 0x08],	%l5
	sdivx	%g7,	0x0316,	%i2
	subc	%i7,	%l2,	%l6
	fcmped	%fcc0,	%f14,	%f10
	smulcc	%i6,	0x1BCF,	%i5
	fmul8ulx16	%f6,	%f22,	%f24
	sdivx	%g6,	0x173D,	%o1
	ldsb	[%l7 + 0x37],	%o3
	edge16l	%i3,	%o7,	%l4
	or	%g1,	0x16D2,	%g4
	andn	%g3,	%i0,	%i4
	movrgez	%o4,	%g5,	%o0
	alignaddrl	%g2,	%l3,	%i1
	alignaddr	%o2,	%l1,	%o6
	add	%o5,	%l0,	%l5
	movgu	%xcc,	%i2,	%g7
	orcc	%l2,	%l6,	%i7
	popc	0x059F,	%i6
	fpadd16	%f18,	%f16,	%f4
	stx	%g6,	[%l7 + 0x18]
	subcc	%o1,	0x02A8,	%o3
	movrgez	%i3,	%o7,	%l4
	edge16n	%g1,	%i5,	%g3
	movge	%xcc,	%i0,	%i4
	andcc	%o4,	0x19C5,	%g5
	stx	%o0,	[%l7 + 0x40]
	stb	%g2,	[%l7 + 0x32]
	add	%g4,	0x001A,	%l3
	movgu	%xcc,	%o2,	%i1
	movre	%l1,	0x08E,	%o5
	subccc	%l0,	0x01E1,	%l5
	udiv	%i2,	0x1372,	%o6
	restore %g7, %l6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f0,	%f4
	array16	%l2,	%g6,	%o1
	array8	%i6,	%i3,	%o3
	movne	%icc,	%o7,	%l4
	addc	%g1,	0x1F9E,	%g3
	fors	%f21,	%f23,	%f31
	and	%i5,	%i4,	%o4
	movcs	%icc,	%g5,	%o0
	fmovsvc	%icc,	%f31,	%f2
	and	%i0,	%g2,	%l3
	fmovdleu	%icc,	%f17,	%f27
	addc	%g4,	0x04BA,	%o2
	addccc	%l1,	0x1AAE,	%o5
	movg	%icc,	%i1,	%l5
	sub	%i2,	%o6,	%g7
	umul	%l0,	%l6,	%i7
	fandnot2s	%f26,	%f3,	%f3
	umulcc	%l2,	0x057E,	%g6
	ldd	[%l7 + 0x10],	%f4
	array32	%o1,	%i6,	%o3
	movneg	%xcc,	%o7,	%i3
	fcmps	%fcc2,	%f14,	%f22
	smul	%g1,	0x0DBD,	%g3
	ldd	[%l7 + 0x60],	%l4
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	fmovsge	%icc,	%f26,	%f22
	movcs	%icc,	%g5,	%o4
	edge32l	%o0,	%g2,	%l3
	array32	%g4,	%o2,	%l1
	fpadd32s	%f15,	%f20,	%f23
	movrne	%i0,	%i1,	%l5
	subcc	%i2,	%o6,	%o5
	xnor	%g7,	%l0,	%l6
	smul	%l2,	0x0B86,	%g6
	save %i7, 0x1534, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%o7,	%i3
	fpackfix	%f28,	%f11
	std	%f2,	[%l7 + 0x50]
	umul	%o3,	0x02A1,	%g3
	movne	%xcc,	%g1,	%i5
	ldsb	[%l7 + 0x67],	%i4
	fmovrdne	%g5,	%f0,	%f6
	addcc	%o4,	0x0DCA,	%o0
	movvc	%xcc,	%l4,	%g2
	srlx	%l3,	%g4,	%o2
	edge32l	%l1,	%i1,	%i0
	addc	%l5,	%i2,	%o5
	movl	%icc,	%o6,	%g7
	fmovrdgez	%l0,	%f0,	%f2
	fxor	%f16,	%f22,	%f28
	xor	%l2,	%g6,	%i7
	sir	0x190D
	movle	%xcc,	%o1,	%l6
	smulcc	%i6,	%o7,	%o3
	fands	%f5,	%f18,	%f11
	movleu	%icc,	%g3,	%g1
	edge32n	%i5,	%i4,	%i3
	orcc	%o4,	0x1687,	%o0
	fmovspos	%xcc,	%f21,	%f12
	std	%f24,	[%l7 + 0x38]
	nop
	set	0x14, %o6
	stw	%g5,	[%l7 + %o6]
	array32	%g2,	%l3,	%g4
	addcc	%o2,	0x088B,	%l4
	xnor	%i1,	0x0A92,	%l1
	alignaddr	%i0,	%i2,	%o5
	srlx	%o6,	%l5,	%g7
	lduw	[%l7 + 0x48],	%l0
	ldd	[%l7 + 0x60],	%g6
	stx	%i7,	[%l7 + 0x10]
	xnor	%o1,	0x0BD9,	%l6
	orcc	%i6,	0x157E,	%o7
	st	%f17,	[%l7 + 0x10]
	popc	0x017B,	%o3
	andncc	%l2,	%g1,	%g3
	movrlez	%i5,	0x3D5,	%i3
	smul	%o4,	0x1CCC,	%i4
	std	%f26,	[%l7 + 0x58]
	edge8ln	%g5,	%o0,	%g2
	sll	%g4,	%o2,	%l3
	smul	%i1,	%l4,	%l1
	ldsw	[%l7 + 0x1C],	%i2
	sll	%i0,	0x09,	%o6
	ldd	[%l7 + 0x30],	%f12
	fpsub16s	%f4,	%f17,	%f15
	ldsh	[%l7 + 0x22],	%o5
	restore %g7, 0x1880, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l0,	0x119C,	%g6
	xor	%o1,	0x14D0,	%l6
	fpackfix	%f4,	%f23
	movrne	%i7,	%i6,	%o7
	edge16ln	%o3,	%l2,	%g1
	movpos	%xcc,	%g3,	%i3
	movrlez	%i5,	%o4,	%i4
	ld	[%l7 + 0x14],	%f27
	movpos	%icc,	%o0,	%g5
	ldd	[%l7 + 0x78],	%g2
	fmovrslz	%o2,	%f15,	%f24
	fcmpes	%fcc1,	%f24,	%f12
	sdivcc	%l3,	0x0644,	%g4
	fnors	%f7,	%f29,	%f28
	fornot2s	%f23,	%f14,	%f16
	st	%f21,	[%l7 + 0x10]
	edge32ln	%l4,	%l1,	%i2
	movg	%icc,	%i1,	%i0
	andncc	%o5,	%g7,	%o6
	and	%l0,	0x1213,	%l5
	subc	%o1,	0x0AF2,	%l6
	movg	%icc,	%g6,	%i6
	ldsw	[%l7 + 0x3C],	%i7
	fnor	%f2,	%f20,	%f6
	fmovrdne	%o7,	%f4,	%f26
	fcmple32	%f6,	%f22,	%l2
	edge8l	%g1,	%o3,	%i3
	fmovsgu	%icc,	%f26,	%f22
	movcc	%icc,	%i5,	%o4
	smul	%i4,	%g3,	%o0
	nop
	set	0x36, %i2
	ldub	[%l7 + %i2],	%g5
	srlx	%g2,	0x0B,	%o2
	movrne	%g4,	%l4,	%l1
	save %l3, 0x12EF, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i2,	%i0,	%g7
	addccc	%o5,	0x1CF0,	%o6
	orn	%l5,	0x1223,	%o1
	alignaddr	%l0,	%g6,	%l6
	movvc	%icc,	%i7,	%i6
	std	%f4,	[%l7 + 0x78]
	movrlz	%o7,	0x07A,	%g1
	fcmps	%fcc1,	%f8,	%f30
	fxnor	%f20,	%f10,	%f20
	fxnor	%f10,	%f30,	%f0
	fzeros	%f14
	edge8l	%l2,	%o3,	%i5
	move	%icc,	%o4,	%i3
	fors	%f29,	%f19,	%f10
	ldub	[%l7 + 0x18],	%i4
	ldsb	[%l7 + 0x40],	%g3
	edge8l	%g5,	%g2,	%o2
	movn	%icc,	%g4,	%o0
	movne	%xcc,	%l1,	%l4
	and	%i1,	0x071F,	%i2
	fandnot2	%f0,	%f0,	%f10
	array16	%i0,	%l3,	%g7
	movneg	%xcc,	%o5,	%l5
	xor	%o6,	%l0,	%o1
	smulcc	%g6,	0x1377,	%l6
	movpos	%xcc,	%i7,	%i6
	fmovdcc	%icc,	%f14,	%f31
	fpadd16	%f12,	%f2,	%f30
	mulx	%o7,	0x01B5,	%g1
	udivcc	%l2,	0x1122,	%i5
	sra	%o4,	0x1C,	%i3
	ldsh	[%l7 + 0x3A],	%o3
	movcs	%icc,	%g3,	%g5
	alignaddrl	%i4,	%g2,	%g4
	movre	%o0,	%l1,	%l4
	ldx	[%l7 + 0x48],	%o2
	edge32ln	%i2,	%i1,	%i0
	array16	%g7,	%l3,	%l5
	stx	%o6,	[%l7 + 0x48]
	array8	%o5,	%l0,	%o1
	array8	%g6,	%i7,	%l6
	fones	%f6
	mulscc	%o7,	0x0AC3,	%g1
	movneg	%xcc,	%l2,	%i5
	edge8l	%o4,	%i3,	%o3
	stx	%i6,	[%l7 + 0x30]
	subc	%g5,	%g3,	%i4
	add	%g2,	%o0,	%l1
	addccc	%g4,	0x1CF1,	%l4
	fmovdg	%icc,	%f25,	%f9
	stb	%o2,	[%l7 + 0x40]
	edge8n	%i1,	%i2,	%i0
	fmovdpos	%icc,	%f28,	%f27
	ldd	[%l7 + 0x60],	%f18
	fpadd16	%f24,	%f12,	%f30
	fpadd32s	%f25,	%f4,	%f30
	fmovsne	%xcc,	%f5,	%f28
	movneg	%xcc,	%g7,	%l5
	fmovrslez	%o6,	%f11,	%f23
	movre	%o5,	0x02A,	%l3
	fmovdcc	%xcc,	%f24,	%f28
	movle	%icc,	%l0,	%o1
	edge16n	%i7,	%g6,	%o7
	movpos	%icc,	%l6,	%l2
	fnegs	%f8,	%f23
	srlx	%i5,	0x17,	%o4
	movrgz	%g1,	0x1A4,	%o3
	movrlz	%i3,	0x330,	%i6
	ldd	[%l7 + 0x78],	%f6
	movgu	%xcc,	%g3,	%g5
	add	%i4,	0x1646,	%g2
	fnegd	%f4,	%f30
	fornot2	%f24,	%f24,	%f26
	fornot2	%f20,	%f0,	%f28
	edge16l	%l1,	%g4,	%o0
	movre	%l4,	%o2,	%i1
	std	%f28,	[%l7 + 0x50]
	fmovrsne	%i2,	%f15,	%f17
	movpos	%icc,	%i0,	%g7
	movrgz	%l5,	0x3C4,	%o5
	sth	%o6,	[%l7 + 0x6A]
	subccc	%l0,	0x15E6,	%l3
	movvc	%icc,	%i7,	%g6
	srlx	%o7,	0x0E,	%o1
	subc	%l6,	%i5,	%l2
	sdivx	%o4,	0x0832,	%g1
	fmovdvs	%xcc,	%f3,	%f22
	edge16l	%i3,	%i6,	%g3
	sdivx	%g5,	0x1D7D,	%i4
	fmovsg	%icc,	%f22,	%f24
	std	%f28,	[%l7 + 0x40]
	fabsd	%f24,	%f18
	movrgz	%g2,	%l1,	%g4
	or	%o3,	%l4,	%o0
	fcmpne32	%f16,	%f22,	%i1
	sdivx	%i2,	0x06FA,	%o2
	fnot2	%f16,	%f12
	udivx	%g7,	0x1F3B,	%l5
	addcc	%i0,	0x0E89,	%o6
	xor	%o5,	0x1CBB,	%l0
	edge32n	%i7,	%g6,	%o7
	ldsh	[%l7 + 0x7C],	%l3
	lduh	[%l7 + 0x72],	%o1
	popc	0x1BCC,	%i5
	std	%f30,	[%l7 + 0x18]
	sth	%l2,	[%l7 + 0x34]
	movleu	%xcc,	%o4,	%l6
	subc	%i3,	%i6,	%g1
	srlx	%g5,	%i4,	%g2
	array32	%l1,	%g3,	%g4
	orcc	%o3,	%o0,	%i1
	orn	%l4,	%o2,	%g7
	edge8ln	%i2,	%l5,	%i0
	or	%o5,	0x063B,	%o6
	sdivcc	%i7,	0x1E25,	%g6
	sdivcc	%o7,	0x005C,	%l3
	ldd	[%l7 + 0x28],	%f16
	edge8n	%l0,	%o1,	%l2
	srax	%i5,	%o4,	%i3
	srax	%l6,	%g1,	%i6
	edge32ln	%g5,	%i4,	%l1
	movvs	%icc,	%g2,	%g4
	xorcc	%g3,	%o0,	%i1
	fmovsneg	%xcc,	%f14,	%f18
	addccc	%l4,	0x1567,	%o2
	fsrc1s	%f18,	%f13
	movvs	%icc,	%o3,	%i2
	sdivx	%g7,	0x06D6,	%l5
	srax	%i0,	0x0F,	%o6
	fmovrdgz	%o5,	%f24,	%f16
	fmovsg	%icc,	%f28,	%f9
	subccc	%g6,	0x1EB4,	%i7
	fsrc1	%f28,	%f18
	stx	%o7,	[%l7 + 0x58]
	addcc	%l3,	%l0,	%l2
	movrgez	%i5,	%o4,	%i3
	movpos	%xcc,	%l6,	%g1
	movre	%i6,	0x1F1,	%o1
	fnands	%f15,	%f6,	%f24
	andn	%i4,	%l1,	%g2
	fnors	%f9,	%f5,	%f4
	edge8n	%g4,	%g3,	%o0
	sllx	%g5,	0x10,	%i1
	umulcc	%o2,	%o3,	%l4
	fnors	%f16,	%f16,	%f9
	ldd	[%l7 + 0x78],	%i2
	edge8n	%g7,	%l5,	%o6
	sdivx	%o5,	0x0B63,	%g6
	ldub	[%l7 + 0x2B],	%i0
	ldx	[%l7 + 0x18],	%i7
	fmovrdlez	%l3,	%f6,	%f2
	array32	%l0,	%l2,	%o7
	std	%f4,	[%l7 + 0x28]
	array32	%o4,	%i5,	%l6
	movrlz	%i3,	0x14E,	%i6
	srax	%o1,	%i4,	%g1
	movn	%icc,	%l1,	%g4
	alignaddrl	%g2,	%g3,	%g5
	andn	%i1,	0x1DF2,	%o0
	sethi	0x1B14,	%o2
	xnorcc	%o3,	0x1BC8,	%i2
	fmovrdlz	%g7,	%f12,	%f26
	xorcc	%l5,	%o6,	%l4
	movrgez	%g6,	%i0,	%i7
	movle	%icc,	%l3,	%l0
	nop
	set	0x40, %l5
	stx	%o5,	[%l7 + %l5]
	faligndata	%f10,	%f14,	%f16
	sth	%l2,	[%l7 + 0x60]
	fmovsne	%xcc,	%f26,	%f6
	addcc	%o4,	%o7,	%l6
	movleu	%icc,	%i5,	%i3
	addccc	%o1,	%i4,	%i6
	mulscc	%l1,	0x00D6,	%g1
	fpsub32s	%f13,	%f26,	%f23
	lduh	[%l7 + 0x26],	%g2
	movrgez	%g4,	0x175,	%g5
	ldsh	[%l7 + 0x2A],	%g3
	array16	%o0,	%i1,	%o2
	edge8l	%i2,	%o3,	%l5
	array32	%o6,	%g7,	%g6
	fors	%f26,	%f26,	%f22
	andncc	%l4,	%i7,	%l3
	fpack32	%f18,	%f30,	%f26
	popc	0x08B8,	%i0
	sll	%l0,	%o5,	%l2
	fmovdpos	%icc,	%f31,	%f8
	edge8l	%o4,	%l6,	%o7
	edge32l	%i3,	%i5,	%o1
	srlx	%i4,	%l1,	%g1
	stb	%i6,	[%l7 + 0x7B]
	fnot2s	%f23,	%f13
	fxnors	%f29,	%f16,	%f24
	andncc	%g2,	%g5,	%g4
	mulscc	%g3,	%o0,	%o2
	st	%f7,	[%l7 + 0x54]
	subccc	%i2,	%o3,	%i1
	edge8	%l5,	%o6,	%g6
	fmovsgu	%icc,	%f27,	%f6
	andn	%g7,	0x0BC7,	%l4
	movrlez	%i7,	%i0,	%l0
	addccc	%l3,	%l2,	%o4
	movcc	%icc,	%o5,	%o7
	array16	%l6,	%i5,	%o1
	fandnot1	%f18,	%f22,	%f16
	ldx	[%l7 + 0x10],	%i4
	orncc	%l1,	%i3,	%g1
	nop
	set	0x42, %i3
	ldsh	[%l7 + %i3],	%i6
	addccc	%g2,	%g4,	%g5
	array32	%g3,	%o0,	%i2
	stb	%o3,	[%l7 + 0x3E]
	lduw	[%l7 + 0x30],	%o2
	addc	%i1,	%l5,	%o6
	movl	%icc,	%g6,	%l4
	lduw	[%l7 + 0x28],	%i7
	srlx	%g7,	0x10,	%i0
	movvs	%xcc,	%l3,	%l0
	udivx	%o4,	0x0FE9,	%l2
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	movvs	%icc,	%l6,	%i4
	or	%o1,	%l1,	%i3
	edge32ln	%i6,	%g2,	%g4
	srax	%g1,	%g3,	%o0
	andn	%g5,	%o3,	%i2
	fxnor	%f20,	%f2,	%f10
	fandnot2	%f10,	%f4,	%f14
	array8	%i1,	%l5,	%o2
	restore %o6, %l4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g6,	%i0,	%l3
	stw	%g7,	[%l7 + 0x60]
	edge16l	%l0,	%l2,	%o4
	movge	%icc,	%o5,	%o7
	smul	%i5,	0x1852,	%i4
	movle	%icc,	%l6,	%o1
	ldub	[%l7 + 0x66],	%l1
	fpadd16	%f30,	%f12,	%f26
	fandnot2	%f24,	%f16,	%f8
	andncc	%i3,	%g2,	%i6
	sth	%g1,	[%l7 + 0x38]
	fornot1s	%f1,	%f16,	%f28
	ldub	[%l7 + 0x44],	%g4
	xnorcc	%o0,	%g5,	%o3
	smul	%g3,	%i2,	%l5
	fxnors	%f26,	%f4,	%f12
	ldd	[%l7 + 0x70],	%f14
	ldd	[%l7 + 0x48],	%o2
	st	%f3,	[%l7 + 0x1C]
	smul	%o6,	0x1B39,	%i1
	movne	%icc,	%i7,	%g6
	fmovsne	%icc,	%f2,	%f15
	andncc	%i0,	%l4,	%g7
	fcmpeq16	%f16,	%f24,	%l0
	edge16ln	%l2,	%l3,	%o4
	edge8	%o7,	%o5,	%i5
	movneg	%icc,	%i4,	%l6
	ld	[%l7 + 0x38],	%f15
	sir	0x0557
	fors	%f3,	%f19,	%f12
	fabss	%f3,	%f17
	movle	%icc,	%o1,	%l1
	fmovsvs	%icc,	%f1,	%f3
	movl	%xcc,	%i3,	%g2
	addc	%g1,	0x1B29,	%i6
	and	%g4,	%g5,	%o0
	subccc	%o3,	%g3,	%l5
	movcs	%xcc,	%i2,	%o6
	edge8n	%i1,	%o2,	%g6
	array16	%i0,	%l4,	%g7
	orn	%i7,	%l2,	%l3
	stw	%l0,	[%l7 + 0x18]
	fmul8x16au	%f0,	%f25,	%f2
	edge32ln	%o7,	%o4,	%i5
	smulcc	%i4,	%l6,	%o5
	edge16	%l1,	%o1,	%i3
	alignaddrl	%g1,	%g2,	%i6
	edge32ln	%g4,	%g5,	%o3
	xnorcc	%g3,	0x1994,	%l5
	lduh	[%l7 + 0x5A],	%o0
	fones	%f2
	sth	%o6,	[%l7 + 0x44]
	edge8n	%i2,	%o2,	%g6
	subc	%i0,	0x0E85,	%l4
	ldsh	[%l7 + 0x58],	%i1
	fpmerge	%f7,	%f15,	%f18
	fmovdcs	%icc,	%f12,	%f19
	subcc	%g7,	%i7,	%l3
	sdivx	%l0,	0x0AC5,	%o7
	movle	%xcc,	%l2,	%o4
	edge32n	%i4,	%i5,	%o5
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	fnor	%f20,	%f30,	%f8
	mova	%xcc,	%l6,	%g1
	xnorcc	%i6,	%g4,	%g2
	edge16ln	%o3,	%g3,	%l5
	fmul8x16	%f0,	%f14,	%f2
	fmovrde	%g5,	%f22,	%f20
	fsrc2s	%f17,	%f8
	fmovrdlez	%o6,	%f6,	%f22
	fones	%f10
	fcmpd	%fcc0,	%f18,	%f0
	alignaddrl	%o0,	%i2,	%o2
	ld	[%l7 + 0x18],	%f0
	fmovdvc	%xcc,	%f26,	%f27
	umul	%i0,	0x1870,	%l4
	ldx	[%l7 + 0x68],	%g6
	fornot1s	%f0,	%f4,	%f9
	srax	%g7,	0x0E,	%i1
	movrlez	%i7,	%l3,	%o7
	movrgz	%l2,	0x249,	%l0
	alignaddr	%o4,	%i4,	%o5
	edge8n	%i5,	%o1,	%l1
	edge32l	%l6,	%i3,	%i6
	mova	%icc,	%g1,	%g4
	fpmerge	%f6,	%f6,	%f28
	edge16n	%g2,	%g3,	%l5
	array8	%g5,	%o3,	%o0
	ldd	[%l7 + 0x48],	%f26
	fmovsleu	%xcc,	%f24,	%f14
	srax	%i2,	0x1B,	%o6
	fmovsl	%xcc,	%f29,	%f6
	movrlez	%i0,	%o2,	%g6
	umulcc	%g7,	0x06B4,	%i1
	sdivcc	%i7,	0x1B8A,	%l4
	fmovdgu	%icc,	%f7,	%f22
	smulcc	%o7,	0x07DC,	%l2
	ldd	[%l7 + 0x48],	%l2
	ldsb	[%l7 + 0x12],	%o4
	fornot2s	%f0,	%f29,	%f20
	edge32ln	%i4,	%o5,	%l0
	and	%i5,	0x19D1,	%l1
	add	%l6,	0x1775,	%o1
	ldsw	[%l7 + 0x28],	%i3
	sllx	%g1,	%i6,	%g2
	fmovsg	%icc,	%f2,	%f9
	ldsw	[%l7 + 0x4C],	%g4
	movge	%xcc,	%g3,	%g5
	sethi	0x19A4,	%o3
	movrgz	%l5,	%o0,	%o6
	fmovrse	%i2,	%f30,	%f11
	fand	%f0,	%f0,	%f16
	ldd	[%l7 + 0x20],	%f12
	fmovsn	%xcc,	%f4,	%f9
	array8	%i0,	%o2,	%g6
	mova	%xcc,	%i1,	%g7
	sra	%l4,	%i7,	%o7
	ldub	[%l7 + 0x12],	%l2
	fpack32	%f6,	%f28,	%f28
	fmovrdgez	%l3,	%f26,	%f28
	edge32l	%i4,	%o5,	%o4
	edge32	%i5,	%l1,	%l6
	edge32n	%o1,	%l0,	%g1
	movre	%i3,	0x350,	%i6
	movn	%xcc,	%g2,	%g3
	andn	%g4,	0x11CD,	%g5
	movcs	%icc,	%l5,	%o3
	move	%icc,	%o0,	%i2
	ldx	[%l7 + 0x60],	%o6
	umulcc	%i0,	%o2,	%i1
	movleu	%icc,	%g7,	%l4
	movg	%xcc,	%i7,	%g6
	ldx	[%l7 + 0x08],	%l2
	umulcc	%o7,	%l3,	%i4
	movrlz	%o4,	%i5,	%l1
	movl	%xcc,	%o5,	%l6
	movrgez	%l0,	0x20E,	%o1
	edge32l	%g1,	%i3,	%g2
	edge32	%g3,	%g4,	%i6
	sth	%l5,	[%l7 + 0x3C]
	umul	%o3,	0x0BEF,	%o0
	ldub	[%l7 + 0x10],	%i2
	fmovsl	%xcc,	%f31,	%f22
	andncc	%o6,	%g5,	%o2
	udiv	%i0,	0x0D05,	%i1
	fnegs	%f19,	%f11
	subccc	%g7,	%i7,	%g6
	and	%l2,	0x00D5,	%l4
	movvc	%xcc,	%l3,	%i4
	nop
	set	0x20, %i6
	stx	%o4,	[%l7 + %i6]
	ld	[%l7 + 0x68],	%f29
	subcc	%i5,	%o7,	%l1
	save %o5, %l6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	%i3,	%g1
	sdivcc	%g2,	0x0718,	%g3
	addc	%i6,	0x1CA7,	%g4
	addccc	%l5,	%o3,	%o0
	sdivx	%o6,	0x1304,	%g5
	ldsh	[%l7 + 0x66],	%o2
	fandnot2	%f6,	%f28,	%f10
	edge32l	%i0,	%i1,	%i2
	edge32l	%i7,	%g6,	%g7
	restore %l2, %l3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f8,	%f26,	%f3
	edge8	%o4,	%l4,	%i5
	movcs	%xcc,	%o7,	%l1
	subc	%o5,	0x0CB9,	%l6
	array32	%l0,	%o1,	%g1
	udivx	%i3,	0x0CBF,	%g2
	movrlz	%i6,	0x346,	%g4
	fornot2	%f20,	%f28,	%f14
	sethi	0x0F6A,	%g3
	fmul8x16	%f16,	%f14,	%f16
	ldsw	[%l7 + 0x6C],	%l5
	addc	%o3,	%o6,	%o0
	srlx	%g5,	0x19,	%o2
	xnor	%i1,	%i2,	%i7
	fpadd32s	%f1,	%f9,	%f5
	addc	%g6,	0x1D8F,	%i0
	movleu	%icc,	%l2,	%g7
	ldub	[%l7 + 0x13],	%i4
	ldd	[%l7 + 0x18],	%l2
	movgu	%icc,	%o4,	%l4
	edge16ln	%o7,	%i5,	%l1
	ldx	[%l7 + 0x10],	%o5
	sth	%l6,	[%l7 + 0x3A]
	move	%xcc,	%o1,	%g1
	addcc	%i3,	%g2,	%i6
	ldsw	[%l7 + 0x74],	%g4
	fmovdcc	%xcc,	%f10,	%f18
	subccc	%l0,	0x12B7,	%g3
	ldsb	[%l7 + 0x2B],	%l5
	movpos	%xcc,	%o6,	%o0
	add	%g5,	%o3,	%o2
	sir	0x15B3
	fmovsg	%xcc,	%f6,	%f27
	ldx	[%l7 + 0x68],	%i2
	lduw	[%l7 + 0x1C],	%i1
	orncc	%i7,	0x05C3,	%i0
	fxnor	%f28,	%f14,	%f2
	xorcc	%g6,	%g7,	%l2
	mulx	%l3,	%o4,	%l4
	sir	0x01F3
	xor	%o7,	%i4,	%l1
	save %i5, %o5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o1,	%g1,	%i3
	movrgz	%g2,	0x043,	%g4
	smulcc	%l0,	%g3,	%i6
	movre	%o6,	0x121,	%o0
	fmovdleu	%xcc,	%f16,	%f29
	bshuffle	%f26,	%f12,	%f2
	andncc	%l5,	%o3,	%g5
	fmovrdgez	%i2,	%f6,	%f26
	alignaddrl	%i1,	%o2,	%i0
	smulcc	%i7,	0x041D,	%g6
	xor	%g7,	0x1E73,	%l3
	movrlz	%l2,	%l4,	%o7
	subc	%o4,	0x1D51,	%l1
	addcc	%i4,	%o5,	%l6
	smulcc	%i5,	0x0894,	%g1
	edge8l	%o1,	%g2,	%i3
	umulcc	%l0,	0x1F2F,	%g3
	andcc	%i6,	0x02A0,	%g4
	ld	[%l7 + 0x10],	%f22
	sra	%o6,	0x19,	%l5
	movvs	%xcc,	%o0,	%g5
	movle	%icc,	%i2,	%i1
	fmovde	%xcc,	%f26,	%f11
	movre	%o3,	0x2F7,	%o2
	ldsw	[%l7 + 0x54],	%i7
	fmovrdgz	%g6,	%f12,	%f30
	fpmerge	%f31,	%f23,	%f14
	subc	%i0,	0x006E,	%l3
	umul	%g7,	%l4,	%o7
	ldsh	[%l7 + 0x0E],	%l2
	fmovsg	%icc,	%f23,	%f18
	sll	%o4,	%i4,	%l1
	save %l6, 0x0BC6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g1,	%o1,	%i5
	edge32n	%g2,	%l0,	%i3
	nop
	set	0x1C, %i5
	sth	%i6,	[%l7 + %i5]
	ldub	[%l7 + 0x19],	%g4
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	andncc	%o0,	%g5,	%l5
	fmovsvs	%xcc,	%f10,	%f17
	array8	%i1,	%i2,	%o3
	smulcc	%o2,	0x0B6A,	%g6
	fnand	%f16,	%f22,	%f8
	edge32l	%i7,	%i0,	%g7
	fmovda	%icc,	%f29,	%f21
	fmul8ulx16	%f22,	%f30,	%f22
	smulcc	%l3,	%l4,	%l2
	edge32l	%o7,	%i4,	%l1
	movvc	%icc,	%l6,	%o4
	edge16	%g1,	%o5,	%i5
	addccc	%o1,	%g2,	%l0
	movre	%i6,	0x141,	%g4
	fmovdvs	%xcc,	%f15,	%f6
	fornot2	%f0,	%f12,	%f4
	udiv	%i3,	0x1884,	%o6
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f26
	udivx	%g3,	0x0D3C,	%g5
	xnorcc	%o0,	0x0648,	%l5
	movle	%icc,	%i2,	%o3
	movrgez	%i1,	%o2,	%i7
	mulscc	%g6,	%i0,	%g7
	movleu	%xcc,	%l3,	%l2
	sir	0x13FF
	stb	%l4,	[%l7 + 0x5F]
	movrgz	%i4,	0x24C,	%o7
	add	%l1,	0x0454,	%l6
	movgu	%icc,	%o4,	%o5
	subccc	%g1,	%i5,	%g2
	fmovsa	%icc,	%f3,	%f3
	edge32l	%l0,	%o1,	%i6
	orn	%g4,	0x1782,	%i3
	movge	%icc,	%o6,	%g3
	fmovdne	%xcc,	%f8,	%f23
	movl	%xcc,	%g5,	%l5
	udiv	%o0,	0x10E7,	%i2
	xnorcc	%o3,	%i1,	%o2
	movcc	%icc,	%i7,	%i0
	xor	%g7,	%l3,	%l2
	xor	%g6,	%l4,	%i4
	subc	%l1,	%o7,	%o4
	movrne	%o5,	%g1,	%l6
	or	%g2,	0x0FF4,	%i5
	ldx	[%l7 + 0x58],	%o1
	fpsub16	%f0,	%f18,	%f2
	andcc	%i6,	%g4,	%l0
	sethi	0x1D59,	%i3
	edge32l	%o6,	%g3,	%g5
	move	%xcc,	%l5,	%o0
	movle	%icc,	%o3,	%i1
	xor	%i2,	%i7,	%o2
	ldx	[%l7 + 0x68],	%i0
	sub	%g7,	0x09AD,	%l3
	stx	%l2,	[%l7 + 0x08]
	fmovdvc	%xcc,	%f23,	%f5
	fzero	%f16
	fmovdneg	%xcc,	%f30,	%f2
	array16	%g6,	%l4,	%i4
	fcmpne16	%f14,	%f20,	%l1
	edge16l	%o7,	%o5,	%g1
	fnands	%f28,	%f27,	%f10
	movrgz	%l6,	%o4,	%g2
	movcs	%xcc,	%o1,	%i5
	ldsb	[%l7 + 0x1D],	%g4
	udiv	%l0,	0x10E6,	%i6
	fornot1	%f26,	%f20,	%f18
	or	%o6,	0x1949,	%i3
	array32	%g5,	%g3,	%l5
	bshuffle	%f12,	%f20,	%f26
	fmovscs	%xcc,	%f9,	%f13
	sdivcc	%o3,	0x0CCD,	%o0
	edge32	%i1,	%i7,	%o2
	or	%i2,	0x1EF8,	%i0
	std	%f10,	[%l7 + 0x48]
	fmuld8sux16	%f0,	%f27,	%f10
	sdiv	%g7,	0x1D99,	%l3
	ldd	[%l7 + 0x50],	%l2
	edge16l	%g6,	%i4,	%l4
	fmovdle	%xcc,	%f14,	%f0
	fmovscc	%icc,	%f3,	%f27
	siam	0x6
	edge16	%o7,	%l1,	%o5
	sth	%l6,	[%l7 + 0x70]
	udivx	%g1,	0x1D5C,	%g2
	fmovrdlz	%o4,	%f18,	%f10
	movgu	%xcc,	%i5,	%g4
	fnot1s	%f0,	%f17
	fpsub16s	%f24,	%f10,	%f29
	add	%l0,	0x0BB0,	%o1
	fcmpne16	%f24,	%f2,	%i6
	fpsub32	%f22,	%f4,	%f26
	movl	%xcc,	%i3,	%o6
	edge32l	%g3,	%g5,	%l5
	ldsh	[%l7 + 0x50],	%o0
	fmovsl	%xcc,	%f12,	%f23
	siam	0x7
	fcmped	%fcc3,	%f26,	%f0
	xor	%o3,	0x07ED,	%i7
	fandnot1s	%f8,	%f14,	%f0
	mova	%xcc,	%o2,	%i1
	udivx	%i2,	0x1B85,	%g7
	movgu	%icc,	%i0,	%l3
	movn	%xcc,	%g6,	%l2
	fmovdg	%xcc,	%f11,	%f11
	restore %l4, 0x165F, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x4A],	%o7
	array8	%l1,	%o5,	%l6
	umul	%g2,	%o4,	%g1
	movrlez	%i5,	%l0,	%g4
	umul	%o1,	0x1A40,	%i3
	orncc	%i6,	0x16F6,	%o6
	fmul8x16au	%f3,	%f12,	%f16
	fmovrse	%g5,	%f14,	%f7
	andn	%l5,	%g3,	%o0
	fmovrdlez	%o3,	%f28,	%f6
	edge16l	%i7,	%i1,	%i2
	popc	0x0BDF,	%o2
	sra	%i0,	%l3,	%g6
	alignaddr	%g7,	%l4,	%i4
	edge16ln	%l2,	%o7,	%l1
	fmovrdne	%o5,	%f16,	%f8
	fmovsgu	%xcc,	%f9,	%f5
	fnegd	%f2,	%f12
	andcc	%l6,	0x13C4,	%o4
	ldsh	[%l7 + 0x26],	%g2
	movleu	%xcc,	%g1,	%i5
	sir	0x00AE
	ldd	[%l7 + 0x48],	%l0
	fpadd16	%f14,	%f30,	%f12
	orncc	%o1,	0x0E89,	%i3
	sdiv	%i6,	0x18A9,	%g4
	sdiv	%g5,	0x1998,	%o6
	array8	%l5,	%o0,	%g3
	fcmple16	%f4,	%f8,	%o3
	movge	%icc,	%i1,	%i7
	movrlez	%o2,	%i0,	%i2
	ldsw	[%l7 + 0x18],	%g6
	xnorcc	%g7,	0x0949,	%l3
	ldd	[%l7 + 0x70],	%i4
	edge8ln	%l4,	%l2,	%o7
	ldx	[%l7 + 0x40],	%l1
	move	%xcc,	%o5,	%o4
	ldub	[%l7 + 0x19],	%g2
	fpsub16s	%f0,	%f25,	%f22
	xnorcc	%l6,	%i5,	%l0
	movl	%xcc,	%g1,	%i3
	subc	%i6,	0x1498,	%o1
	fmovsvc	%xcc,	%f11,	%f27
	fmovda	%icc,	%f2,	%f31
	edge8ln	%g5,	%g4,	%l5
	movgu	%icc,	%o0,	%o6
	movne	%icc,	%g3,	%i1
	ldsh	[%l7 + 0x28],	%i7
	fmuld8ulx16	%f21,	%f0,	%f4
	ld	[%l7 + 0x5C],	%f2
	edge8ln	%o3,	%o2,	%i0
	edge16l	%g6,	%g7,	%i2
	sra	%i4,	%l3,	%l4
	ldub	[%l7 + 0x4E],	%l2
	fcmpes	%fcc0,	%f12,	%f27
	xnor	%l1,	%o7,	%o5
	edge32	%g2,	%l6,	%i5
	smul	%o4,	0x1891,	%g1
	movrgez	%l0,	%i3,	%i6
	sdivcc	%g5,	0x1276,	%g4
	xorcc	%o1,	%o0,	%l5
	alignaddrl	%g3,	%o6,	%i1
	movge	%icc,	%i7,	%o2
	array8	%i0,	%g6,	%g7
	orn	%i2,	0x1BFC,	%o3
	ldsb	[%l7 + 0x5A],	%l3
	fcmpne16	%f24,	%f4,	%i4
	mova	%icc,	%l4,	%l1
	fones	%f30
	ldsb	[%l7 + 0x6E],	%l2
	fnot2	%f14,	%f22
	movvs	%xcc,	%o7,	%o5
	movgu	%icc,	%l6,	%i5
	addc	%g2,	0x0618,	%o4
	fmovsvs	%icc,	%f8,	%f26
	movcs	%icc,	%l0,	%g1
	movre	%i6,	0x07C,	%g5
	andcc	%i3,	%o1,	%g4
	orn	%o0,	0x1DFF,	%g3
	lduw	[%l7 + 0x20],	%o6
	alignaddr	%i1,	%l5,	%i7
	movre	%o2,	%g6,	%i0
	umul	%g7,	%i2,	%o3
	movrgez	%l3,	0x22E,	%i4
	sdivx	%l1,	0x0E9E,	%l2
	fpack16	%f18,	%f14
	movn	%icc,	%l4,	%o7
	fmovscs	%xcc,	%f29,	%f15
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x70],	%f24
	fmovdgu	%xcc,	%f17,	%f5
	movrgz	%o5,	%g2,	%o4
	fabsd	%f20,	%f18
	pdist	%f18,	%f16,	%f30
	edge32l	%l0,	%g1,	%i5
	subc	%g5,	0x1237,	%i6
	srax	%o1,	0x0E,	%g4
	udivcc	%o0,	0x1943,	%g3
	fabss	%f12,	%f22
	xnor	%i3,	0x0D93,	%i1
	orcc	%l5,	%i7,	%o6
	sdiv	%g6,	0x12B9,	%o2
	addc	%i0,	0x17F2,	%g7
	fmovsge	%icc,	%f20,	%f11
	ldd	[%l7 + 0x30],	%i2
	udiv	%o3,	0x14B8,	%i4
	andcc	%l3,	%l1,	%l4
	edge16n	%o7,	%l6,	%o5
	srax	%l2,	%g2,	%o4
	edge16n	%l0,	%i5,	%g1
	ldsh	[%l7 + 0x2E],	%i6
	fandnot2s	%f3,	%f16,	%f30
	or	%o1,	0x1E5F,	%g4
	edge8	%o0,	%g5,	%i3
	movrlez	%g3,	%l5,	%i1
	fnors	%f6,	%f4,	%f8
	movl	%xcc,	%o6,	%i7
	and	%o2,	%g6,	%i0
	andcc	%g7,	0x08FF,	%i2
	orncc	%o3,	%i4,	%l1
	movge	%xcc,	%l3,	%o7
	udivx	%l4,	0x1413,	%l6
	ldd	[%l7 + 0x50],	%o4
	fmovrsne	%l2,	%f21,	%f3
	fmovdge	%xcc,	%f30,	%f21
	array32	%o4,	%g2,	%i5
	sethi	0x1B07,	%g1
	add	%i6,	0x16E9,	%o1
	fmovsge	%xcc,	%f9,	%f19
	movleu	%xcc,	%l0,	%o0
	st	%f27,	[%l7 + 0x14]
	addcc	%g5,	0x167F,	%i3
	edge32ln	%g3,	%g4,	%i1
	sub	%o6,	0x0E20,	%i7
	fmovde	%xcc,	%f28,	%f22
	edge8l	%l5,	%g6,	%i0
	ldx	[%l7 + 0x10],	%g7
	movl	%xcc,	%i2,	%o3
	movrgez	%o2,	%i4,	%l3
	orncc	%l1,	%o7,	%l4
	movgu	%xcc,	%o5,	%l6
	lduh	[%l7 + 0x6E],	%o4
	fornot2s	%f25,	%f13,	%f12
	edge16ln	%l2,	%i5,	%g1
	movneg	%icc,	%g2,	%o1
	edge32ln	%i6,	%o0,	%l0
	orn	%i3,	0x0E0F,	%g5
	fmul8ulx16	%f10,	%f20,	%f26
	addc	%g4,	%g3,	%i1
	subcc	%i7,	%o6,	%g6
	sllx	%i0,	%l5,	%i2
	edge8	%g7,	%o2,	%i4
	sub	%o3,	0x1262,	%l3
	add	%o7,	0x040A,	%l4
	orcc	%l1,	%o5,	%o4
	mulscc	%l2,	%l6,	%i5
	fmovsl	%icc,	%f25,	%f5
	sdivx	%g1,	0x169B,	%g2
	movpos	%xcc,	%o1,	%o0
	save %l0, 0x1937, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f7,	%f13
	movcc	%icc,	%g5,	%g4
	mulx	%i6,	0x0F8E,	%g3
	sra	%i1,	0x15,	%i7
	movvs	%icc,	%g6,	%o6
	movrlz	%l5,	%i2,	%g7
	array32	%i0,	%i4,	%o3
	ldub	[%l7 + 0x49],	%o2
	srax	%l3,	0x13,	%o7
	movn	%xcc,	%l1,	%o5
	edge32l	%o4,	%l4,	%l6
	movrlez	%i5,	%g1,	%g2
	movn	%icc,	%l2,	%o1
	ldd	[%l7 + 0x78],	%l0
	alignaddrl	%i3,	%o0,	%g5
	edge16	%g4,	%i6,	%g3
	xnor	%i7,	0x1CE6,	%g6
	mulx	%o6,	0x0492,	%i1
	stw	%i2,	[%l7 + 0x08]
	movgu	%icc,	%l5,	%g7
	subcc	%i4,	0x06C9,	%i0
	udiv	%o2,	0x1F93,	%o3
	movrlez	%l3,	0x140,	%o7
	smul	%l1,	%o5,	%o4
	fmovrsgez	%l4,	%f5,	%f12
	movrgz	%l6,	0x093,	%i5
	orncc	%g1,	0x1F6F,	%g2
	ldx	[%l7 + 0x58],	%o1
	nop
	set	0x78, %o7
	ldsw	[%l7 + %o7],	%l2
	udiv	%i3,	0x1261,	%l0
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	movl	%xcc,	%g4,	%g3
	sdivcc	%i7,	0x1B39,	%g6
	movrgez	%o6,	0x3E8,	%i6
	stx	%i1,	[%l7 + 0x78]
	ldd	[%l7 + 0x38],	%f8
	ldx	[%l7 + 0x10],	%l5
	movcc	%icc,	%g7,	%i2
	subc	%i0,	%i4,	%o2
	edge8	%o3,	%o7,	%l1
	fmovda	%icc,	%f27,	%f21
	movvc	%xcc,	%l3,	%o5
	fpsub16s	%f18,	%f24,	%f27
	ld	[%l7 + 0x4C],	%f18
	movgu	%xcc,	%o4,	%l4
	fpsub16s	%f28,	%f27,	%f13
	addc	%i5,	%l6,	%g1
	array16	%g2,	%l2,	%i3
	movneg	%icc,	%o1,	%l0
	ldd	[%l7 + 0x70],	%f2
	stx	%o0,	[%l7 + 0x20]
	fmovdge	%xcc,	%f1,	%f13
	sdivx	%g4,	0x1A0B,	%g3
	addcc	%g5,	0x15F6,	%g6
	fpadd32	%f4,	%f16,	%f10
	sth	%i7,	[%l7 + 0x4C]
	sll	%o6,	0x04,	%i1
	sllx	%l5,	%g7,	%i6
	movl	%xcc,	%i2,	%i0
	smulcc	%i4,	0x1925,	%o3
	fcmpes	%fcc2,	%f16,	%f22
	fcmpeq32	%f14,	%f26,	%o7
	fmovse	%xcc,	%f13,	%f5
	movvc	%icc,	%l1,	%o2
	edge32n	%l3,	%o4,	%o5
	lduw	[%l7 + 0x6C],	%l4
	fcmpd	%fcc0,	%f8,	%f14
	movrgez	%l6,	%g1,	%i5
	sllx	%g2,	%i3,	%o1
	srax	%l0,	0x1C,	%l2
	movcs	%xcc,	%o0,	%g4
	xorcc	%g5,	%g6,	%i7
	addccc	%g3,	0x04C9,	%i1
	ldsh	[%l7 + 0x0E],	%l5
	movrlez	%o6,	0x17F,	%i6
	movl	%icc,	%g7,	%i0
	alignaddrl	%i4,	%i2,	%o7
	fmovsl	%xcc,	%f9,	%f28
	sll	%o3,	0x18,	%o2
	fmul8x16al	%f6,	%f18,	%f10
	fnegs	%f16,	%f31
	sllx	%l1,	0x02,	%l3
	alignaddrl	%o4,	%l4,	%l6
	save %o5, %g1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f19,	%f3,	%f28
	fcmpne32	%f22,	%f0,	%i5
	smulcc	%o1,	0x0A57,	%l0
	mulscc	%i3,	%l2,	%g4
	move	%icc,	%g5,	%g6
	stb	%i7,	[%l7 + 0x6B]
	stx	%g3,	[%l7 + 0x10]
	fpsub32s	%f17,	%f10,	%f24
	nop
	set	0x08, %g5
	stx	%o0,	[%l7 + %g5]
	edge8l	%l5,	%o6,	%i1
	and	%i6,	0x113C,	%g7
	subccc	%i4,	%i0,	%i2
	mova	%xcc,	%o3,	%o2
	ldsw	[%l7 + 0x18],	%o7
	alignaddr	%l1,	%l3,	%l4
	fmul8ulx16	%f22,	%f28,	%f30
	stw	%l6,	[%l7 + 0x48]
	smulcc	%o4,	%g1,	%o5
	xor	%i5,	%o1,	%l0
	fxnor	%f4,	%f10,	%f8
	sra	%i3,	0x07,	%l2
	fandnot2s	%f27,	%f16,	%f13
	addcc	%g4,	0x07B0,	%g5
	andcc	%g6,	0x1F6F,	%g2
	fnot1s	%f20,	%f29
	fpack32	%f24,	%f2,	%f28
	ldsh	[%l7 + 0x1C],	%i7
	fmovrslez	%g3,	%f13,	%f12
	sllx	%o0,	0x16,	%l5
	addc	%o6,	0x0105,	%i1
	movle	%icc,	%i6,	%i4
	ldd	[%l7 + 0x20],	%i0
	fandnot2s	%f7,	%f12,	%f5
	ldsh	[%l7 + 0x12],	%g7
	fmovrdlez	%o3,	%f24,	%f16
	andn	%i2,	0x14BC,	%o7
	subc	%o2,	0x1894,	%l1
	movcs	%icc,	%l4,	%l3
	move	%xcc,	%l6,	%o4
	movgu	%xcc,	%g1,	%i5
	smulcc	%o5,	0x1E13,	%l0
	xnor	%o1,	%l2,	%g4
	movrne	%g5,	0x3AC,	%i3
	sdiv	%g2,	0x070B,	%g6
	stx	%g3,	[%l7 + 0x20]
	edge16ln	%o0,	%l5,	%i7
	sth	%o6,	[%l7 + 0x38]
	or	%i1,	0x1EA2,	%i4
	smul	%i0,	0x0D5D,	%g7
	subccc	%i6,	0x089B,	%i2
	st	%f31,	[%l7 + 0x30]
	movrlez	%o3,	0x3B3,	%o2
	subc	%l1,	0x0757,	%o7
	edge8l	%l4,	%l3,	%o4
	fabsd	%f4,	%f26
	alignaddrl	%g1,	%i5,	%o5
	fcmpgt16	%f8,	%f30,	%l0
	alignaddrl	%o1,	%l6,	%g4
	edge32n	%l2,	%g5,	%g2
	movrgez	%g6,	%i3,	%g3
	umul	%o0,	0x0F74,	%l5
	alignaddrl	%i7,	%i1,	%o6
	movrgez	%i0,	%g7,	%i6
	edge32ln	%i4,	%o3,	%o2
	edge16	%i2,	%l1,	%o7
	fandnot1s	%f2,	%f3,	%f14
	movrlz	%l3,	%o4,	%g1
	edge32ln	%i5,	%l4,	%l0
	edge32l	%o5,	%o1,	%g4
	movrne	%l6,	0x1B9,	%g5
	fcmps	%fcc2,	%f30,	%f22
	sdiv	%l2,	0x0ABC,	%g2
	movvs	%xcc,	%i3,	%g3
	sir	0x1521
	edge8l	%g6,	%o0,	%i7
	xnor	%i1,	%o6,	%i0
	fsrc2s	%f23,	%f6
	fmovdpos	%xcc,	%f28,	%f2
	lduh	[%l7 + 0x28],	%g7
	xorcc	%l5,	0x02E4,	%i4
	sdivcc	%i6,	0x1246,	%o2
	move	%xcc,	%i2,	%o3
	movg	%xcc,	%l1,	%o7
	nop
	set	0x28, %l3
	stx	%o4,	[%l7 + %l3]
	sir	0x1C37
	srax	%l3,	0x04,	%g1
	subc	%i5,	0x0694,	%l0
	srl	%l4,	%o1,	%g4
	udivx	%o5,	0x015F,	%g5
	orcc	%l6,	0x0339,	%l2
	stb	%i3,	[%l7 + 0x5E]
	movre	%g2,	0x07C,	%g3
	sub	%g6,	0x096D,	%i7
	movvc	%icc,	%i1,	%o6
	edge16n	%o0,	%i0,	%l5
	smulcc	%i4,	0x1478,	%i6
	edge8n	%o2,	%g7,	%i2
	umul	%l1,	0x1148,	%o3
	or	%o7,	0x150F,	%o4
	edge8ln	%g1,	%l3,	%l0
	sub	%l4,	%i5,	%o1
	movrlz	%o5,	%g5,	%l6
	movne	%xcc,	%g4,	%l2
	movrlez	%i3,	0x207,	%g3
	alignaddr	%g6,	%i7,	%g2
	stw	%i1,	[%l7 + 0x40]
	mova	%xcc,	%o0,	%i0
	movre	%o6,	0x3DD,	%l5
	smulcc	%i4,	%i6,	%g7
	sra	%i2,	0x05,	%l1
	fmovdpos	%icc,	%f15,	%f23
	save %o3, %o2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g1,	%o4
	movrne	%l0,	%l3,	%i5
	edge32l	%o1,	%o5,	%g5
	sethi	0x0217,	%l4
	edge16l	%l6,	%g4,	%l2
	and	%g3,	0x133E,	%g6
	ldd	[%l7 + 0x68],	%f10
	ldsw	[%l7 + 0x18],	%i3
	movneg	%icc,	%g2,	%i7
	fornot1	%f12,	%f8,	%f12
	addcc	%i1,	%o0,	%o6
	popc	%i0,	%i4
	movl	%icc,	%l5,	%g7
	srax	%i2,	0x06,	%i6
	popc	0x0C60,	%o3
	alignaddrl	%l1,	%o7,	%o2
	edge8l	%g1,	%l0,	%l3
	sllx	%i5,	%o4,	%o5
	fcmpne16	%f4,	%f2,	%o1
	xnorcc	%g5,	0x1E59,	%l6
	stb	%l4,	[%l7 + 0x1B]
	fzero	%f28
	bshuffle	%f28,	%f4,	%f4
	srax	%l2,	%g4,	%g6
	addcc	%i3,	0x06C1,	%g2
	movne	%icc,	%i7,	%i1
	and	%g3,	%o6,	%i0
	fmovsge	%icc,	%f26,	%f21
	ldsb	[%l7 + 0x0B],	%o0
	udivx	%l5,	0x0F47,	%g7
	lduw	[%l7 + 0x60],	%i4
	sdiv	%i2,	0x08C6,	%o3
	movne	%icc,	%l1,	%o7
	sethi	0x0831,	%o2
	srlx	%g1,	0x1A,	%i6
	edge16n	%l3,	%i5,	%l0
	fxor	%f14,	%f0,	%f6
	movvc	%icc,	%o5,	%o4
	fmovrdlz	%o1,	%f0,	%f2
	movne	%icc,	%l6,	%l4
	fpsub16s	%f13,	%f29,	%f7
	sub	%g5,	%g4,	%g6
	movge	%icc,	%i3,	%g2
	sll	%l2,	0x17,	%i1
	sll	%g3,	%o6,	%i7
	udiv	%o0,	0x0199,	%l5
	fcmpgt16	%f28,	%f24,	%i0
	fcmple32	%f6,	%f12,	%i4
	sth	%i2,	[%l7 + 0x16]
	sethi	0x1065,	%g7
	and	%o3,	0x1257,	%o7
	fsrc2s	%f6,	%f22
	xnor	%o2,	%g1,	%l1
	sdiv	%l3,	0x018F,	%i5
	edge8	%l0,	%o5,	%o4
	subc	%i6,	%o1,	%l4
	sdiv	%g5,	0x017B,	%g4
	sdivx	%g6,	0x1095,	%l6
	orcc	%i3,	0x0788,	%l2
	sllx	%g2,	0x07,	%g3
	movre	%o6,	%i1,	%o0
	fmovdge	%icc,	%f0,	%f31
	alignaddrl	%i7,	%i0,	%i4
	sdiv	%l5,	0x10CE,	%i2
	umul	%g7,	0x1409,	%o7
	movleu	%icc,	%o2,	%g1
	fmovdneg	%icc,	%f15,	%f11
	stb	%l1,	[%l7 + 0x79]
	ldx	[%l7 + 0x08],	%l3
	alignaddr	%o3,	%i5,	%o5
	xnor	%o4,	0x0DAB,	%l0
	ld	[%l7 + 0x64],	%f6
	fzeros	%f12
	orn	%i6,	%l4,	%g5
	edge16n	%o1,	%g6,	%g4
	sub	%l6,	%l2,	%g2
	fnot1	%f4,	%f20
	edge8l	%g3,	%o6,	%i3
	addc	%i1,	0x03F2,	%i7
	orcc	%o0,	%i0,	%i4
	srax	%l5,	%i2,	%g7
	ldub	[%l7 + 0x5D],	%o7
	ldsb	[%l7 + 0x30],	%o2
	sra	%g1,	0x12,	%l1
	array8	%l3,	%o3,	%i5
	fpadd32	%f8,	%f30,	%f30
	fmul8x16au	%f3,	%f19,	%f12
	movrgez	%o5,	%l0,	%i6
	andncc	%l4,	%g5,	%o4
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%o0
	smul	%g6,	0x0419,	%l6
	ldsh	[%l7 + 0x2A],	%g4
	std	%f28,	[%l7 + 0x48]
	array8	%l2,	%g3,	%o6
	movpos	%icc,	%g2,	%i1
	ldx	[%l7 + 0x58],	%i3
	fnot2s	%f8,	%f18
	umul	%i7,	%i0,	%o0
	fpmerge	%f31,	%f2,	%f28
	edge32n	%l5,	%i2,	%i4
	sdivcc	%g7,	0x077A,	%o2
	sdivcc	%o7,	0x0B2A,	%g1
	movrlez	%l3,	%l1,	%i5
	fpadd16s	%f7,	%f9,	%f8
	ldsh	[%l7 + 0x12],	%o5
	fandnot1	%f0,	%f8,	%f4
	movle	%icc,	%l0,	%i6
	srl	%o3,	%l4,	%o4
	movneg	%xcc,	%g5,	%g6
	fmovsl	%xcc,	%f15,	%f15
	restore %o1, 0x0E2B, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l2,	%g3,	%l6
	sub	%g2,	%i1,	%i3
	srl	%o6,	%i0,	%i7
	sra	%o0,	%l5,	%i2
	edge32l	%g7,	%i4,	%o7
	fmovdl	%xcc,	%f10,	%f4
	and	%o2,	%l3,	%g1
	stx	%i5,	[%l7 + 0x60]
	fcmps	%fcc2,	%f24,	%f0
	edge8ln	%l1,	%o5,	%i6
	subccc	%o3,	%l0,	%o4
	movle	%icc,	%g5,	%l4
	fands	%f4,	%f2,	%f7
	fmovsne	%xcc,	%f6,	%f1
	fzeros	%f9
	sir	0x0869
	xnorcc	%g6,	%o1,	%l2
	xnor	%g3,	%g4,	%l6
	move	%xcc,	%i1,	%g2
	movvc	%icc,	%o6,	%i3
	udivx	%i0,	0x0D35,	%o0
	fmovrdgez	%l5,	%f0,	%f18
	sdiv	%i7,	0x0F89,	%i2
	movneg	%icc,	%i4,	%g7
	mulscc	%o2,	%l3,	%g1
	movge	%xcc,	%i5,	%l1
	fmovrde	%o7,	%f10,	%f28
	andcc	%i6,	0x1C88,	%o5
	ldx	[%l7 + 0x08],	%l0
	movrgz	%o3,	%g5,	%l4
	edge32	%o4,	%o1,	%g6
	and	%g3,	%g4,	%l6
	fmovsl	%xcc,	%f5,	%f12
	fornot2	%f18,	%f22,	%f24
	fpsub16s	%f27,	%f5,	%f30
	edge8ln	%i1,	%g2,	%o6
	movcs	%xcc,	%l2,	%i3
	fpadd16s	%f29,	%f22,	%f31
	ld	[%l7 + 0x64],	%f26
	fmovdg	%xcc,	%f10,	%f5
	ld	[%l7 + 0x6C],	%f28
	movle	%xcc,	%o0,	%l5
	andncc	%i7,	%i2,	%i4
	movvs	%xcc,	%i0,	%o2
	movre	%g7,	%g1,	%i5
	fmovdneg	%xcc,	%f24,	%f29
	ldsh	[%l7 + 0x26],	%l1
	stb	%o7,	[%l7 + 0x51]
	stw	%i6,	[%l7 + 0x7C]
	mulscc	%l3,	0x11A1,	%o5
	fsrc2	%f0,	%f6
	movvs	%xcc,	%l0,	%o3
	movrlz	%g5,	%l4,	%o4
	fmovrde	%g6,	%f30,	%f0
	fmovrsgz	%o1,	%f15,	%f15
	sll	%g4,	%g3,	%i1
	movre	%g2,	%o6,	%l6
	sethi	0x0C67,	%i3
	movn	%xcc,	%l2,	%l5
	movn	%icc,	%o0,	%i2
	fsrc2s	%f17,	%f1
	movvs	%xcc,	%i4,	%i0
	or	%i7,	%g7,	%o2
	movrgz	%i5,	0x015,	%g1
	mulx	%o7,	%i6,	%l1
	sethi	0x1056,	%l3
	umulcc	%l0,	0x0AD4,	%o5
	mova	%icc,	%o3,	%l4
	andncc	%o4,	%g6,	%o1
	fmovrde	%g4,	%f20,	%f22
	fmovdgu	%xcc,	%f18,	%f15
	edge32	%g3,	%g5,	%i1
	xor	%g2,	0x0CB6,	%l6
	movcs	%icc,	%o6,	%l2
	fmovdvc	%xcc,	%f13,	%f2
	fnot1s	%f4,	%f7
	ldsh	[%l7 + 0x26],	%i3
	movneg	%icc,	%o0,	%l5
	movpos	%xcc,	%i4,	%i0
	subc	%i2,	%g7,	%o2
	sll	%i5,	0x1B,	%g1
	fpack32	%f4,	%f20,	%f16
	movcc	%icc,	%o7,	%i6
	xorcc	%i7,	0x1D57,	%l1
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	stx	%l4,	[%l7 + 0x48]
	umul	%o4,	0x0728,	%o3
	and	%g6,	%g4,	%g3
	movge	%icc,	%g5,	%o1
	add	%i1,	0x0EC9,	%l6
	mova	%xcc,	%o6,	%g2
	movg	%xcc,	%i3,	%l2
	smulcc	%l5,	%i4,	%i0
	movrlez	%o0,	%i2,	%g7
	or	%i5,	0x0A81,	%g1
	save %o2, 0x18F2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i7,	0x1300,	%o7
	lduw	[%l7 + 0x0C],	%l1
	ld	[%l7 + 0x0C],	%f16
	fmovsvs	%xcc,	%f19,	%f26
	ldd	[%l7 + 0x38],	%f20
	fmovd	%f14,	%f22
	fmovdge	%xcc,	%f3,	%f5
	and	%l3,	0x0897,	%o5
	fmovrdgez	%l4,	%f20,	%f28
	save %o4, %l0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g6,	0x1143,	%g4
	xorcc	%g5,	%g3,	%o1
	edge16l	%l6,	%i1,	%o6
	restore %g2, %i3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i4,	0x1DA4,	%l2
	mova	%xcc,	%i0,	%o0
	subc	%g7,	0x0269,	%i5
	subc	%i2,	0x1DA7,	%g1
	sdiv	%i6,	0x12F3,	%i7
	fmovsn	%icc,	%f31,	%f9
	edge32l	%o7,	%o2,	%l1
	fmovsgu	%icc,	%f24,	%f9
	lduh	[%l7 + 0x24],	%l3
	edge32n	%o5,	%l4,	%l0
	addccc	%o4,	0x06DA,	%g6
	sth	%o3,	[%l7 + 0x56]
	fnors	%f11,	%f7,	%f7
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	ldd	[%l7 + 0x10],	%g2
	lduw	[%l7 + 0x78],	%l6
	movg	%icc,	%o1,	%i1
	nop
	set	0x60, %l1
	ldsb	[%l7 + %l1],	%o6
	fcmpgt32	%f10,	%f8,	%i3
	fmovsneg	%icc,	%f9,	%f15
	sir	0x0131
	add	%l5,	%g2,	%i4
	fmovsneg	%icc,	%f10,	%f23
	movre	%i0,	%l2,	%o0
	fcmpne32	%f10,	%f28,	%i5
	addc	%g7,	0x0C99,	%i2
	andcc	%i6,	0x1B00,	%i7
	movne	%icc,	%o7,	%g1
	mulscc	%o2,	%l3,	%o5
	fmovrsne	%l1,	%f13,	%f13
	sdivcc	%l4,	0x1B84,	%o4
	srlx	%g6,	0x07,	%o3
	smul	%g4,	0x1E69,	%l0
	mova	%xcc,	%g3,	%l6
	sir	0x0142
	sll	%o1,	%g5,	%i1
	nop
	set	0x41, %o5
	ldub	[%l7 + %o5],	%i3
	mulx	%o6,	0x1E16,	%l5
	edge32l	%i4,	%g2,	%i0
	udivx	%l2,	0x08D8,	%i5
	ld	[%l7 + 0x0C],	%f26
	sethi	0x1EE2,	%g7
	movrlz	%i2,	0x3B9,	%o0
	fcmps	%fcc0,	%f0,	%f15
	fmovdvs	%icc,	%f8,	%f11
	stb	%i7,	[%l7 + 0x25]
	alignaddr	%i6,	%o7,	%g1
	fandnot2	%f18,	%f16,	%f20
	std	%f8,	[%l7 + 0x70]
	stb	%l3,	[%l7 + 0x0D]
	udiv	%o5,	0x1925,	%l1
	fpsub16	%f18,	%f18,	%f14
	fandnot2s	%f11,	%f1,	%f6
	fmovrdlez	%l4,	%f10,	%f4
	udivcc	%o4,	0x0944,	%g6
	movrlez	%o3,	%g4,	%l0
	edge32n	%o2,	%g3,	%o1
	srlx	%l6,	%g5,	%i3
	popc	0x1987,	%o6
	sethi	0x187A,	%l5
	and	%i4,	0x1189,	%i1
	edge32n	%i0,	%g2,	%i5
	fnot2	%f16,	%f8
	fmovdn	%icc,	%f1,	%f5
	xor	%g7,	%i2,	%o0
	udivcc	%l2,	0x0B02,	%i7
	addcc	%i6,	%o7,	%g1
	std	%f20,	[%l7 + 0x48]
	mulscc	%o5,	0x1DE0,	%l3
	srl	%l4,	%l1,	%g6
	umul	%o4,	0x04A9,	%o3
	stw	%l0,	[%l7 + 0x4C]
	xnor	%o2,	0x10FB,	%g3
	movcc	%xcc,	%o1,	%l6
	edge32	%g4,	%i3,	%g5
	ldub	[%l7 + 0x6A],	%o6
	sra	%l5,	0x06,	%i4
	ldub	[%l7 + 0x3E],	%i1
	fornot1	%f14,	%f20,	%f26
	fcmpes	%fcc2,	%f4,	%f10
	fabss	%f5,	%f19
	add	%i0,	0x14A8,	%g2
	ldx	[%l7 + 0x28],	%g7
	addccc	%i5,	0x1411,	%i2
	srax	%o0,	0x18,	%i7
	srax	%i6,	%l2,	%g1
	fpadd32s	%f7,	%f6,	%f10
	addc	%o7,	%o5,	%l3
	movcc	%xcc,	%l1,	%g6
	sub	%o4,	0x0D57,	%l4
	ldd	[%l7 + 0x30],	%f24
	alignaddrl	%o3,	%o2,	%l0
	fnot2	%f20,	%f18
	ldsb	[%l7 + 0x0E],	%o1
	movge	%xcc,	%g3,	%g4
	movne	%xcc,	%l6,	%i3
	addc	%g5,	0x0C0E,	%o6
	fcmpeq16	%f22,	%f0,	%i4
	movvc	%xcc,	%i1,	%i0
	st	%f15,	[%l7 + 0x48]
	fandnot1	%f8,	%f26,	%f12
	fpack32	%f26,	%f10,	%f0
	popc	%l5,	%g2
	movrlez	%g7,	%i5,	%o0
	edge8n	%i2,	%i6,	%i7
	movle	%xcc,	%g1,	%l2
	andcc	%o5,	0x0BB2,	%l3
	ldd	[%l7 + 0x50],	%l0
	srlx	%o7,	0x16,	%g6
	fabss	%f7,	%f21
	edge16ln	%o4,	%o3,	%o2
	edge8l	%l4,	%l0,	%o1
	udivcc	%g3,	0x0B0E,	%l6
	edge8ln	%i3,	%g5,	%o6
	nop
	set	0x5C, %i1
	stb	%g4,	[%l7 + %i1]
	udiv	%i4,	0x0984,	%i0
	udivcc	%i1,	0x0D5E,	%l5
	movvc	%icc,	%g7,	%i5
	edge16	%g2,	%i2,	%i6
	edge8	%i7,	%g1,	%l2
	fnand	%f10,	%f20,	%f4
	fmovsneg	%xcc,	%f7,	%f10
	add	%o0,	%l3,	%o5
	addcc	%l1,	%g6,	%o7
	addcc	%o3,	0x1F9A,	%o4
	movpos	%xcc,	%l4,	%o2
	fornot1	%f4,	%f18,	%f26
	xnor	%o1,	0x1053,	%g3
	array16	%l0,	%l6,	%g5
	ldx	[%l7 + 0x20],	%o6
	add	%i3,	%i4,	%i0
	fnegd	%f26,	%f18
	xor	%g4,	%i1,	%l5
	movge	%xcc,	%i5,	%g7
	andncc	%g2,	%i2,	%i6
	sub	%g1,	%l2,	%i7
	sdivx	%l3,	0x02F7,	%o0
	subcc	%l1,	0x146A,	%o5
	movg	%icc,	%o7,	%g6
	add	%o4,	%o3,	%o2
	or	%o1,	%g3,	%l0
	fnor	%f6,	%f2,	%f0
	fcmpeq16	%f4,	%f22,	%l4
	fmovsne	%xcc,	%f21,	%f3
	fmovrdgz	%l6,	%f26,	%f22
	movl	%xcc,	%o6,	%i3
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%i4
	stw	%i0,	[%l7 + 0x18]
	addccc	%g4,	%g5,	%i1
	addc	%i5,	%l5,	%g2
	fcmpne32	%f24,	%f28,	%i2
	fmovscs	%xcc,	%f10,	%f2
	udivx	%g7,	0x0ABA,	%g1
	movrgez	%i6,	%i7,	%l2
	movre	%o0,	0x014,	%l3
	nop
	set	0x4B, %l0
	stb	%l1,	[%l7 + %l0]
	ldub	[%l7 + 0x40],	%o7
	edge8ln	%o5,	%o4,	%g6
	subccc	%o3,	0x0129,	%o2
	mova	%xcc,	%g3,	%o1
	ldd	[%l7 + 0x38],	%l4
	mova	%icc,	%l0,	%o6
	ldx	[%l7 + 0x68],	%i3
	sub	%l6,	0x1411,	%i4
	movcs	%icc,	%g4,	%g5
	sethi	0x1D55,	%i0
	sir	0x1BFE
	movvc	%xcc,	%i1,	%i5
	stx	%l5,	[%l7 + 0x38]
	xorcc	%i2,	0x1B0D,	%g2
	fnand	%f16,	%f4,	%f12
	fnegs	%f26,	%f0
	xorcc	%g7,	0x1D65,	%g1
	sdivx	%i7,	0x1B4D,	%l2
	sth	%i6,	[%l7 + 0x1E]
	movne	%xcc,	%o0,	%l1
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%l2
	fmovsn	%xcc,	%f27,	%f30
	fsrc1s	%f5,	%f24
	subccc	%o7,	0x1A73,	%o5
	fcmpne16	%f20,	%f4,	%g6
	udivcc	%o4,	0x166C,	%o2
	smul	%g3,	0x069D,	%o3
	sdivcc	%o1,	0x12A4,	%l0
	orncc	%o6,	0x1A3D,	%l4
	addcc	%i3,	0x112D,	%i4
	stb	%l6,	[%l7 + 0x34]
	movleu	%xcc,	%g5,	%i0
	xor	%i1,	0x1B5A,	%g4
	fandnot2s	%f28,	%f22,	%f10
	fors	%f8,	%f23,	%f19
	mulx	%i5,	%l5,	%g2
	array32	%g7,	%g1,	%i7
	array32	%i2,	%i6,	%l2
	fpadd32s	%f28,	%f17,	%f23
	array32	%o0,	%l3,	%l1
	subccc	%o5,	%o7,	%g6
	mova	%xcc,	%o4,	%g3
	fmovdle	%xcc,	%f16,	%f4
	fmovda	%icc,	%f27,	%f21
	movneg	%xcc,	%o2,	%o1
	edge16ln	%o3,	%l0,	%l4
	andncc	%i3,	%o6,	%i4
	ld	[%l7 + 0x3C],	%f25
	edge16	%g5,	%l6,	%i0
	xorcc	%i1,	%i5,	%g4
	fpack32	%f22,	%f22,	%f8
	addcc	%g2,	%l5,	%g1
	movre	%g7,	0x177,	%i7
	fone	%f4
	xnorcc	%i6,	0x13F1,	%i2
	and	%o0,	0x084B,	%l3
	fmovrsgez	%l1,	%f27,	%f1
	xor	%l2,	0x00A0,	%o7
	array16	%g6,	%o5,	%g3
	movrne	%o2,	0x006,	%o4
	std	%f14,	[%l7 + 0x30]
	fmovrdgez	%o3,	%f22,	%f16
	ld	[%l7 + 0x28],	%f20
	mulx	%o1,	0x0D8C,	%l4
	edge16	%l0,	%i3,	%o6
	edge16ln	%i4,	%g5,	%l6
	fpadd32	%f12,	%f26,	%f28
	fmovdvs	%xcc,	%f26,	%f16
	sub	%i0,	%i1,	%i5
	movrne	%g2,	0x14C,	%l5
	fmovsneg	%icc,	%f26,	%f6
	movn	%xcc,	%g4,	%g1
	movrne	%i7,	0x22F,	%g7
	subccc	%i2,	%o0,	%i6
	movcs	%xcc,	%l3,	%l2
	fand	%f28,	%f30,	%f14
	fnegs	%f31,	%f1
	movg	%icc,	%l1,	%g6
	addc	%o5,	%g3,	%o2
	movrgez	%o7,	0x256,	%o4
	movge	%icc,	%o1,	%o3
	mulscc	%l0,	%l4,	%i3
	lduh	[%l7 + 0x4C],	%o6
	ldsh	[%l7 + 0x50],	%i4
	fmovspos	%xcc,	%f21,	%f7
	sethi	0x076A,	%l6
	umulcc	%i0,	%g5,	%i1
	udiv	%i5,	0x1E1D,	%g2
	xor	%g4,	%l5,	%i7
	fmovsvc	%xcc,	%f22,	%f6
	movgu	%icc,	%g1,	%i2
	fmovrde	%g7,	%f10,	%f4
	edge32	%i6,	%o0,	%l2
	movvc	%icc,	%l3,	%g6
	ldd	[%l7 + 0x38],	%o4
	movvs	%xcc,	%l1,	%g3
	fxnors	%f0,	%f5,	%f25
	sethi	0x085F,	%o7
	movl	%xcc,	%o4,	%o2
	xor	%o1,	0x1B9A,	%l0
	fand	%f28,	%f24,	%f18
	fmovrdgz	%o3,	%f26,	%f26
	alignaddrl	%l4,	%i3,	%i4
	fxnor	%f6,	%f22,	%f16
	ldsh	[%l7 + 0x1C],	%o6
	smul	%i0,	%l6,	%i1
	st	%f20,	[%l7 + 0x6C]
	fsrc2s	%f14,	%f29
	fxnor	%f0,	%f0,	%f26
	ldub	[%l7 + 0x74],	%i5
	edge8n	%g2,	%g4,	%l5
	edge32n	%i7,	%g5,	%g1
	movcs	%icc,	%g7,	%i2
	lduh	[%l7 + 0x58],	%o0
	movrgz	%i6,	0x19D,	%l2
	sir	0x1869
	st	%f0,	[%l7 + 0x78]
	edge8n	%l3,	%g6,	%l1
	sir	0x05E6
	udiv	%o5,	0x1C3E,	%g3
	sdivx	%o7,	0x0F8D,	%o4
	stw	%o2,	[%l7 + 0x58]
	edge32	%o1,	%l0,	%l4
	fcmpgt16	%f8,	%f28,	%i3
	srl	%o3,	0x19,	%o6
	umul	%i0,	%i4,	%l6
	movrlz	%i1,	%g2,	%i5
	subc	%g4,	%l5,	%g5
	move	%icc,	%i7,	%g1
	ldd	[%l7 + 0x28],	%i2
	fabss	%f29,	%f15
	lduw	[%l7 + 0x0C],	%g7
	fmovrsgez	%o0,	%f3,	%f15
	sth	%i6,	[%l7 + 0x6A]
	umul	%l3,	0x19E3,	%l2
	edge16l	%g6,	%l1,	%g3
	umul	%o7,	%o4,	%o2
	lduh	[%l7 + 0x7C],	%o5
	andn	%o1,	0x1043,	%l0
	andn	%i3,	%l4,	%o3
	orncc	%i0,	0x0C80,	%o6
	array32	%i4,	%i1,	%l6
	fmul8sux16	%f6,	%f4,	%f8
	nop
	set	0x52, %i4
	ldsh	[%l7 + %i4],	%i5
	array16	%g2,	%g4,	%g5
	movvs	%icc,	%l5,	%g1
	alignaddr	%i2,	%g7,	%o0
	movrlz	%i6,	0x1AF,	%i7
	orcc	%l3,	0x113F,	%l2
	ld	[%l7 + 0x24],	%f5
	movcc	%xcc,	%l1,	%g3
	add	%g6,	%o4,	%o2
	lduw	[%l7 + 0x40],	%o5
	movcs	%xcc,	%o1,	%l0
	fandnot1	%f14,	%f6,	%f18
	sra	%i3,	0x17,	%l4
	sub	%o3,	0x085E,	%o7
	fcmpne16	%f24,	%f8,	%i0
	sethi	0x0269,	%o6
	edge8l	%i4,	%i1,	%l6
	edge8ln	%g2,	%g4,	%i5
	fmul8sux16	%f18,	%f10,	%f30
	array8	%g5,	%l5,	%g1
	fmul8x16au	%f20,	%f2,	%f24
	udivx	%g7,	0x0C4F,	%i2
	fornot1s	%f17,	%f9,	%f13
	fmovdgu	%icc,	%f3,	%f24
	umulcc	%o0,	%i6,	%i7
	edge16ln	%l2,	%l1,	%l3
	movrne	%g3,	0x199,	%g6
	edge16n	%o2,	%o4,	%o5
	andncc	%o1,	%i3,	%l0
	sir	0x0B7A
	xnorcc	%l4,	%o7,	%i0
	edge16ln	%o3,	%i4,	%o6
	ldsb	[%l7 + 0x2F],	%i1
	stw	%l6,	[%l7 + 0x60]
	fmovse	%icc,	%f20,	%f28
	subc	%g4,	0x0B68,	%g2
	sethi	0x0F1E,	%i5
	srlx	%g5,	%l5,	%g1
	edge8n	%g7,	%i2,	%o0
	fpack32	%f20,	%f4,	%f30
	edge8	%i6,	%i7,	%l1
	fxnors	%f28,	%f23,	%f17
	sdivcc	%l2,	0x1B2C,	%l3
	fmovrdne	%g3,	%f12,	%f26
	sub	%o2,	%o4,	%o5
	fmovrslz	%o1,	%f5,	%f6
	ldd	[%l7 + 0x58],	%i2
	fmovdvs	%xcc,	%f7,	%f9
	movrlz	%g6,	0x342,	%l0
	save %o7, %i0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i4,	0x0DAD,	%o6
	array8	%i1,	%l4,	%g4
	sdivx	%g2,	0x14CD,	%l6
	andncc	%i5,	%g5,	%l5
	fmovsl	%xcc,	%f4,	%f5
	edge8	%g7,	%i2,	%o0
	sll	%g1,	0x18,	%i7
	ldd	[%l7 + 0x10],	%f4
	mova	%icc,	%l1,	%i6
	fnot1s	%f0,	%f2
	andncc	%l3,	%g3,	%o2
	movgu	%xcc,	%o4,	%o5
	movge	%xcc,	%o1,	%i3
	sth	%l2,	[%l7 + 0x2C]
	fmovdn	%icc,	%f23,	%f16
	edge32l	%g6,	%l0,	%o7
	movn	%icc,	%o3,	%i0
	fmovrdne	%i4,	%f30,	%f20
	fornot2	%f8,	%f26,	%f28
	movrgez	%o6,	0x1D5,	%i1
	fmovrsne	%g4,	%f29,	%f28
	xorcc	%g2,	%l6,	%l4
	add	%g5,	%i5,	%l5
	fmovsvc	%xcc,	%f29,	%f7
	subccc	%g7,	0x03D7,	%o0
	fcmps	%fcc1,	%f19,	%f30
	sdivcc	%i2,	0x1472,	%g1
	fpack32	%f2,	%f6,	%f30
	fones	%f24
	movcs	%icc,	%l1,	%i7
	ld	[%l7 + 0x48],	%f8
	siam	0x1
	mova	%xcc,	%l3,	%i6
	andcc	%g3,	%o4,	%o5
	move	%xcc,	%o1,	%i3
	fxnors	%f4,	%f26,	%f21
	srl	%o2,	0x0E,	%g6
	alignaddrl	%l2,	%l0,	%o3
	fcmped	%fcc3,	%f20,	%f18
	movge	%icc,	%i0,	%i4
	fmovsleu	%icc,	%f31,	%f10
	orncc	%o7,	0x19C7,	%o6
	fmovspos	%xcc,	%f19,	%f29
	edge32ln	%i1,	%g4,	%g2
	movg	%xcc,	%l4,	%g5
	fsrc1	%f24,	%f2
	orcc	%l6,	%i5,	%g7
	edge16	%o0,	%i2,	%g1
	std	%f24,	[%l7 + 0x20]
	fpmerge	%f4,	%f24,	%f24
	edge32	%l1,	%l5,	%i7
	lduw	[%l7 + 0x24],	%i6
	sll	%g3,	0x04,	%o4
	movg	%xcc,	%l3,	%o1
	sdivx	%o5,	0x1756,	%i3
	srax	%g6,	%o2,	%l0
	fmovdvc	%icc,	%f31,	%f3
	mova	%xcc,	%l2,	%o3
	subc	%i4,	%o7,	%i0
	fmovrdlz	%o6,	%f22,	%f16
	edge32	%g4,	%i1,	%g2
	fcmps	%fcc3,	%f21,	%f29
	array32	%l4,	%l6,	%g5
	edge8n	%i5,	%g7,	%o0
	ld	[%l7 + 0x68],	%f0
	move	%xcc,	%i2,	%g1
	srlx	%l5,	%i7,	%l1
	sth	%g3,	[%l7 + 0x46]
	fpadd32s	%f24,	%f11,	%f28
	edge8	%o4,	%i6,	%o1
	move	%icc,	%o5,	%i3
	srl	%l3,	%o2,	%l0
	movne	%xcc,	%l2,	%o3
	umul	%i4,	%g6,	%i0
	nop
	set	0x18, %l2
	std	%f8,	[%l7 + %l2]
	udivcc	%o6,	0x0835,	%g4
	movrlz	%o7,	0x06F,	%i1
	sra	%l4,	%g2,	%g5
	fmovsvs	%xcc,	%f3,	%f18
	movrlz	%i5,	%l6,	%o0
	andcc	%g7,	0x0602,	%g1
	fexpand	%f10,	%f12
	stx	%l5,	[%l7 + 0x60]
	ldx	[%l7 + 0x58],	%i7
	mulscc	%i2,	0x1092,	%g3
	addc	%o4,	0x0673,	%i6
	andcc	%o1,	%o5,	%i3
	fmovsne	%icc,	%f8,	%f20
	movge	%icc,	%l1,	%l3
	movrlez	%o2,	0x2FD,	%l0
	fnot1	%f16,	%f28
	sllx	%o3,	%i4,	%g6
	movrgez	%l2,	%o6,	%g4
	sllx	%i0,	%i1,	%l4
	movpos	%xcc,	%g2,	%o7
	alignaddr	%g5,	%l6,	%o0
	save %g7, 0x18CC, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i5,	[%l7 + 0x08]
	orncc	%l5,	0x0ACA,	%i7
	edge32ln	%g3,	%o4,	%i2
	movrlez	%o1,	%o5,	%i6
	movrlz	%l1,	%i3,	%o2
	xnor	%l3,	%l0,	%i4
	fornot1s	%f28,	%f1,	%f12
	edge16ln	%g6,	%o3,	%o6
	movgu	%xcc,	%g4,	%l2
	fmovsle	%xcc,	%f26,	%f24
	movcc	%xcc,	%i1,	%l4
	srl	%g2,	0x01,	%o7
	movrne	%g5,	0x2EE,	%l6
	xnorcc	%i0,	%o0,	%g1
	addccc	%g7,	%l5,	%i7
	movvs	%xcc,	%g3,	%i5
	fcmpne16	%f2,	%f0,	%o4
	orn	%o1,	0x0691,	%o5
	lduw	[%l7 + 0x3C],	%i2
	edge16ln	%l1,	%i6,	%o2
	ldsh	[%l7 + 0x1C],	%i3
	st	%f31,	[%l7 + 0x1C]
	movg	%icc,	%l0,	%l3
	smul	%g6,	0x1EAA,	%i4
	xnor	%o6,	0x040A,	%o3
	movn	%icc,	%l2,	%i1
	addccc	%g4,	%g2,	%o7
	xor	%l4,	%g5,	%i0
	subccc	%o0,	0x0993,	%l6
	fnot2s	%f29,	%f18
	edge32	%g1,	%l5,	%i7
	movvs	%icc,	%g7,	%g3
	subc	%i5,	%o4,	%o5
	pdist	%f6,	%f16,	%f26
	fexpand	%f30,	%f24
	orncc	%o1,	0x1E06,	%i2
	smul	%i6,	0x1156,	%o2
	subcc	%l1,	0x0947,	%l0
	save %i3, %g6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f27,	%f17
	fcmpeq16	%f24,	%f30,	%o6
	addcc	%l3,	0x0B44,	%o3
	fmovdcc	%icc,	%f23,	%f19
	udivcc	%l2,	0x0A69,	%g4
	ldx	[%l7 + 0x58],	%g2
	edge32n	%o7,	%l4,	%i1
	ldx	[%l7 + 0x50],	%i0
	and	%o0,	0x1F7F,	%g5
	or	%l6,	0x09C3,	%l5
	movpos	%xcc,	%i7,	%g1
	andn	%g3,	%g7,	%o4
	udivx	%o5,	0x06D0,	%o1
	andn	%i5,	0x034B,	%i2
	edge16l	%i6,	%o2,	%l0
	addccc	%i3,	0x1C69,	%l1
	ldsb	[%l7 + 0x0D],	%i4
	fexpand	%f23,	%f18
	ldd	[%l7 + 0x70],	%f10
	ldsb	[%l7 + 0x38],	%o6
	edge32n	%g6,	%l3,	%o3
	xor	%g4,	0x06FC,	%l2
	alignaddrl	%o7,	%g2,	%i1
	edge8	%i0,	%l4,	%o0
	fmovsa	%xcc,	%f7,	%f2
	srlx	%l6,	0x13,	%g5
	fmovda	%icc,	%f11,	%f4
	or	%i7,	0x0F92,	%g1
	edge16n	%l5,	%g3,	%g7
	mulscc	%o5,	%o1,	%i5
	umul	%i2,	%i6,	%o2
	faligndata	%f6,	%f16,	%f24
	subc	%o4,	%i3,	%l0
	movvs	%icc,	%i4,	%l1
	fpsub16s	%f26,	%f8,	%f17
	siam	0x5
	movge	%icc,	%o6,	%l3
	fmovrsne	%g6,	%f30,	%f28
	mulx	%g4,	%o3,	%o7
	fsrc1	%f30,	%f16
	movl	%xcc,	%g2,	%i1
	xorcc	%l2,	%l4,	%i0
	movneg	%icc,	%l6,	%g5
	movrne	%i7,	0x320,	%g1
	edge32	%l5,	%o0,	%g7
	fmovdne	%icc,	%f19,	%f13
	addccc	%g3,	%o5,	%i5
	movg	%xcc,	%i2,	%i6
	lduh	[%l7 + 0x08],	%o2
	mova	%xcc,	%o1,	%i3
	fcmps	%fcc3,	%f9,	%f1
	fxnors	%f21,	%f25,	%f24
	movg	%icc,	%o4,	%i4
	ld	[%l7 + 0x30],	%f15
	sth	%l0,	[%l7 + 0x18]
	edge8n	%l1,	%l3,	%g6
	addcc	%o6,	%o3,	%g4
	xnor	%o7,	0x10FF,	%g2
	movn	%xcc,	%l2,	%i1
	fones	%f11
	fsrc1	%f18,	%f18
	faligndata	%f14,	%f14,	%f20
	edge8	%i0,	%l4,	%l6
	movneg	%icc,	%i7,	%g1
	sethi	0x102A,	%l5
	stb	%g5,	[%l7 + 0x1D]
	ldsh	[%l7 + 0x44],	%g7
	fsrc2s	%f20,	%f10
	srl	%g3,	0x10,	%o0
	movrgez	%i5,	%o5,	%i6
	movn	%xcc,	%i2,	%o2
	sra	%i3,	0x07,	%o4
	fcmpgt32	%f24,	%f12,	%o1
	array32	%i4,	%l1,	%l3
	movne	%xcc,	%l0,	%o6
	srax	%g6,	%o3,	%g4
	movge	%icc,	%o7,	%l2
	add	%i1,	%i0,	%g2
	fcmpgt32	%f4,	%f16,	%l4
	fmovdn	%icc,	%f2,	%f12
	movcc	%icc,	%l6,	%g1
	mulx	%l5,	0x0BDE,	%g5
	sth	%g7,	[%l7 + 0x48]
	fandnot1s	%f22,	%f21,	%f11
	movgu	%icc,	%i7,	%g3
	addccc	%o0,	0x1D7C,	%o5
	save %i6, %i2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o2,	%o4,	%o1
	alignaddr	%i4,	%l1,	%i3
	movpos	%xcc,	%l3,	%o6
	movleu	%xcc,	%l0,	%o3
	and	%g6,	%o7,	%l2
	edge8l	%i1,	%g4,	%g2
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%i0
	movcc	%xcc,	%l6,	%l4
	orncc	%l5,	0x1608,	%g5
	movne	%icc,	%g7,	%g1
	alignaddrl	%i7,	%g3,	%o5
	sethi	0x1B69,	%o0
	alignaddrl	%i2,	%i5,	%i6
	andncc	%o4,	%o1,	%o2
	sub	%l1,	%i4,	%i3
	sir	0x1EC7
	mulscc	%l3,	%o6,	%l0
	umulcc	%o3,	%o7,	%g6
	smulcc	%l2,	0x15A4,	%g4
	movl	%icc,	%i1,	%i0
	array16	%l6,	%g2,	%l4
	edge32	%g5,	%g7,	%g1
	movge	%xcc,	%i7,	%g3
	fmovrdgz	%l5,	%f6,	%f28
	xor	%o0,	0x0962,	%i2
	array8	%i5,	%i6,	%o4
	smulcc	%o1,	0x13F6,	%o5
	ldd	[%l7 + 0x70],	%f26
	ldd	[%l7 + 0x40],	%f18
	stx	%o2,	[%l7 + 0x08]
	addc	%l1,	%i4,	%l3
	movleu	%icc,	%o6,	%l0
	movneg	%icc,	%o3,	%o7
	movrgez	%i3,	%g6,	%l2
	udiv	%g4,	0x1BFE,	%i0
	edge8	%i1,	%g2,	%l4
	xnor	%l6,	0x0989,	%g7
	array16	%g5,	%g1,	%g3
	sub	%l5,	%o0,	%i7
	fpadd32s	%f23,	%f23,	%f4
	edge32l	%i5,	%i2,	%o4
	movleu	%xcc,	%o1,	%o5
	fmovrslez	%i6,	%f20,	%f3
	sra	%o2,	%i4,	%l3
	addcc	%l1,	0x15FE,	%l0
	fornot2	%f14,	%f28,	%f30
	ldub	[%l7 + 0x2F],	%o3
	st	%f9,	[%l7 + 0x50]
	sdiv	%o6,	0x0878,	%i3
	fornot2s	%f16,	%f4,	%f14
	sub	%o7,	0x1554,	%g6
	addc	%l2,	%i0,	%g4
	fmuld8ulx16	%f30,	%f8,	%f26
	save %i1, 0x1C2D, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f4,	%f30,	%f6
	udivx	%l4,	0x0DF3,	%l6
	umulcc	%g7,	%g1,	%g3
	ldub	[%l7 + 0x3D],	%l5
	movrlz	%o0,	%i7,	%i5
	alignaddr	%g5,	%i2,	%o4
	array32	%o5,	%o1,	%i6
	fmovdle	%xcc,	%f22,	%f7
	sethi	0x05F5,	%i4
	edge32n	%l3,	%o2,	%l1
	movre	%o3,	%l0,	%i3
	movle	%xcc,	%o6,	%g6
	mulscc	%o7,	%l2,	%g4
	movrlz	%i1,	%i0,	%g2
	fmovde	%icc,	%f26,	%f18
	movrlz	%l4,	%g7,	%g1
	orcc	%g3,	%l5,	%o0
	restore %l6, %i7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x18CE,	%i2
	or	%g5,	%o4,	%o1
	fmul8x16	%f9,	%f4,	%f10
	edge32l	%o5,	%i6,	%i4
	addc	%l3,	0x1FCC,	%l1
	xorcc	%o2,	%o3,	%i3
	edge32	%l0,	%o6,	%g6
	fmovrsne	%o7,	%f8,	%f28
	mulscc	%g4,	0x09A9,	%i1
	fcmpne16	%f0,	%f20,	%i0
	st	%f16,	[%l7 + 0x64]
	sdivx	%g2,	0x1BDD,	%l4
	udivx	%l2,	0x1035,	%g7
	save %g3, 0x0F1E, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o0,	%l6
	subc	%l5,	0x0DCB,	%i7
	movl	%xcc,	%i2,	%g5
	ldsw	[%l7 + 0x08],	%o4
	stw	%o1,	[%l7 + 0x50]
	ldub	[%l7 + 0x41],	%o5
	and	%i5,	%i6,	%l3
	subccc	%l1,	0x1D17,	%i4
	subc	%o3,	%o2,	%l0
	alignaddr	%o6,	%i3,	%o7
	ldsb	[%l7 + 0x3D],	%g4
	mulscc	%i1,	0x1DF9,	%i0
	srlx	%g6,	0x0E,	%g2
	fmovsle	%icc,	%f21,	%f0
	nop
	set	0x2C, %o1
	ldsw	[%l7 + %o1],	%l4
	fmul8sux16	%f12,	%f8,	%f24
	add	%l2,	%g7,	%g1
	array32	%g3,	%o0,	%l6
	fcmps	%fcc3,	%f0,	%f7
	movne	%icc,	%i7,	%i2
	edge8n	%g5,	%l5,	%o1
	ldsb	[%l7 + 0x2F],	%o4
	ldx	[%l7 + 0x18],	%o5
	movrne	%i6,	0x09C,	%i5
	array8	%l3,	%i4,	%o3
	fcmpeq16	%f18,	%f16,	%o2
	andcc	%l0,	0x1726,	%o6
	movgu	%xcc,	%l1,	%i3
	sub	%g4,	%i1,	%i0
	alignaddrl	%o7,	%g6,	%g2
	movrgez	%l4,	%l2,	%g7
	stx	%g1,	[%l7 + 0x08]
	fmovrdgz	%o0,	%f6,	%f6
	movrgz	%l6,	%i7,	%g3
	fmovsgu	%xcc,	%f26,	%f0
	smul	%g5,	0x0928,	%i2
	sth	%l5,	[%l7 + 0x0E]
	ldsb	[%l7 + 0x7A],	%o4
	array16	%o5,	%i6,	%i5
	orncc	%l3,	0x0E4F,	%o1
	srlx	%i4,	%o3,	%l0
	xor	%o6,	%l1,	%i3
	fmovsle	%icc,	%f30,	%f7
	sdivcc	%g4,	0x0B75,	%o2
	fmovdvc	%xcc,	%f4,	%f17
	ldsw	[%l7 + 0x5C],	%i1
	smulcc	%i0,	%g6,	%g2
	ldsb	[%l7 + 0x61],	%o7
	or	%l4,	0x00B8,	%g7
	srlx	%l2,	0x0B,	%o0
	edge16	%l6,	%i7,	%g3
	fnor	%f24,	%f14,	%f4
	movrgez	%g1,	%g5,	%l5
	srlx	%o4,	%i2,	%i6
	ldub	[%l7 + 0x20],	%o5
	fmovscc	%icc,	%f20,	%f22
	subc	%l3,	0x0440,	%i5
	movg	%xcc,	%i4,	%o1
	fnot2	%f30,	%f20
	alignaddr	%o3,	%o6,	%l1
	edge8	%l0,	%i3,	%g4
	orcc	%i1,	%o2,	%i0
	fpadd16s	%f4,	%f28,	%f6
	fpsub16	%f28,	%f26,	%f0
	fmovscs	%icc,	%f4,	%f1
	edge32l	%g6,	%g2,	%o7
	fxor	%f12,	%f22,	%f20
	sll	%l4,	0x04,	%g7
	fmovsl	%icc,	%f0,	%f0
	ldsb	[%l7 + 0x7C],	%o0
	movrlz	%l2,	0x1B0,	%i7
	st	%f3,	[%l7 + 0x70]
	fmovdvs	%icc,	%f12,	%f2
	stx	%l6,	[%l7 + 0x20]
	udivx	%g1,	0x1774,	%g3
	movge	%icc,	%g5,	%l5
	fpadd32	%f24,	%f24,	%f12
	fmovdne	%icc,	%f21,	%f3
	mulx	%i2,	0x08E9,	%o4
	mova	%xcc,	%i6,	%o5
	or	%l3,	%i4,	%o1
	fabsd	%f24,	%f18
	edge8l	%i5,	%o6,	%l1
	edge8	%o3,	%i3,	%l0
	subccc	%i1,	%g4,	%i0
	edge8l	%o2,	%g6,	%g2
	xorcc	%l4,	0x011C,	%g7
	orn	%o7,	0x0DDB,	%l2
	stb	%i7,	[%l7 + 0x36]
	subc	%o0,	0x1332,	%g1
	udivx	%l6,	0x095A,	%g5
	fpmerge	%f0,	%f22,	%f10
	fmovsvc	%xcc,	%f25,	%f28
	movrlez	%l5,	%g3,	%o4
	mova	%xcc,	%i2,	%o5
	fpsub16	%f26,	%f24,	%f6
	fmovdpos	%icc,	%f21,	%f21
	smulcc	%i6,	0x1D91,	%l3
	movrlz	%i4,	%o1,	%i5
	stw	%l1,	[%l7 + 0x78]
	edge8ln	%o6,	%i3,	%o3
	pdist	%f12,	%f8,	%f8
	edge8ln	%l0,	%i1,	%g4
	sll	%i0,	%g6,	%g2
	sdivx	%l4,	0x0DC0,	%g7
	edge16	%o2,	%o7,	%i7
	fmovrdgz	%o0,	%f0,	%f24
	std	%f4,	[%l7 + 0x60]
	mulx	%l2,	0x1339,	%l6
	edge8l	%g1,	%g5,	%g3
	fcmpd	%fcc2,	%f12,	%f4
	fexpand	%f13,	%f28
	movg	%icc,	%l5,	%o4
	sub	%i2,	0x0A81,	%o5
	ldsh	[%l7 + 0x60],	%l3
	mulscc	%i4,	0x19D9,	%i6
	st	%f28,	[%l7 + 0x6C]
	move	%icc,	%o1,	%l1
	movvs	%icc,	%i5,	%o6
	movg	%icc,	%o3,	%l0
	fcmple32	%f6,	%f20,	%i3
	udiv	%i1,	0x12B6,	%g4
	smulcc	%i0,	0x05EB,	%g6
	edge16n	%g2,	%l4,	%g7
	movvs	%icc,	%o7,	%o2
	fornot2	%f4,	%f6,	%f28
	st	%f29,	[%l7 + 0x74]
	movrgez	%o0,	%l2,	%l6
	edge32n	%i7,	%g1,	%g5
	movcc	%xcc,	%l5,	%o4
	mulx	%g3,	%o5,	%i2
	movrgez	%l3,	0x20C,	%i4
	fmovrslez	%o1,	%f20,	%f15
	addcc	%l1,	0x1728,	%i6
	udivx	%i5,	0x18A0,	%o3
	movrlez	%l0,	%i3,	%o6
	umulcc	%i1,	%g4,	%g6
	fmovdvc	%xcc,	%f16,	%f11
	edge8l	%i0,	%l4,	%g7
	sub	%g2,	%o2,	%o0
	or	%l2,	0x079E,	%l6
	edge32	%o7,	%g1,	%i7
	fmovrdgz	%g5,	%f20,	%f6
	andn	%o4,	%l5,	%g3
	udivx	%i2,	0x1A07,	%l3
	edge16	%o5,	%o1,	%i4
	subcc	%l1,	0x0D34,	%i5
	fsrc2s	%f10,	%f12
	edge32ln	%o3,	%i6,	%i3
	sll	%o6,	%i1,	%l0
	sub	%g6,	%g4,	%l4
	srl	%i0,	%g2,	%o2
	edge8ln	%g7,	%o0,	%l2
	fones	%f31
	fsrc1	%f6,	%f12
	movcs	%icc,	%o7,	%l6
	fmovdg	%xcc,	%f22,	%f6
	fmovrdlez	%g1,	%f10,	%f24
	array8	%i7,	%g5,	%l5
	edge32l	%o4,	%g3,	%i2
	udiv	%o5,	0x1378,	%l3
	alignaddrl	%i4,	%o1,	%i5
	edge16	%l1,	%o3,	%i3
	edge8	%i6,	%i1,	%o6
	mulx	%g6,	0x0458,	%l0
	movn	%icc,	%l4,	%i0
	ldd	[%l7 + 0x70],	%f26
	orncc	%g2,	0x02E2,	%g4
	std	%f14,	[%l7 + 0x50]
	mova	%icc,	%g7,	%o0
	nop
	set	0x78, %g3
	ldsw	[%l7 + %g3],	%l2
	xorcc	%o2,	0x045A,	%o7
	andn	%l6,	%i7,	%g1
	srax	%g5,	%o4,	%l5
	fmovdvs	%icc,	%f21,	%f28
	xnorcc	%g3,	0x1BF1,	%i2
	sir	0x0B13
	movrlz	%o5,	0x3AB,	%i4
	srax	%l3,	%i5,	%l1
	fmovdvs	%icc,	%f24,	%f13
	fabsd	%f18,	%f28
	movvc	%icc,	%o1,	%i3
	addccc	%o3,	0x1C0E,	%i1
	movcs	%icc,	%i6,	%g6
	nop
	set	0x60, %o0
	ldsb	[%l7 + %o0],	%o6
	movrlz	%l4,	%i0,	%g2
	srl	%g4,	%l0,	%o0
	xnor	%l2,	%o2,	%g7
	movvs	%xcc,	%l6,	%i7
	fpsub16	%f14,	%f2,	%f8
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%g1
	movn	%icc,	%g5,	%o4
	fxors	%f29,	%f3,	%f15
	array8	%l5,	%o7,	%g3
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	array32	%i5,	%l1,	%o1
	movg	%xcc,	%l3,	%i3
	edge8l	%o3,	%i6,	%i1
	ldd	[%l7 + 0x70],	%f4
	fexpand	%f1,	%f24
	add	%o6,	%g6,	%l4
	srl	%i0,	%g4,	%l0
	fmovdle	%icc,	%f13,	%f6
	srax	%o0,	0x19,	%l2
	sir	0x107A
	sethi	0x12EA,	%o2
	orn	%g2,	%l6,	%g7
	sth	%i7,	[%l7 + 0x38]
	ldsw	[%l7 + 0x18],	%g1
	restore %o4, 0x0B3B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o7,	%g3,	%i2
	smulcc	%i4,	0x1C8B,	%g5
	popc	0x1978,	%o5
	orn	%i5,	0x18E6,	%o1
	fnot1s	%f18,	%f8
	movrgez	%l1,	%l3,	%i3
	sth	%i6,	[%l7 + 0x4E]
	edge32l	%i1,	%o3,	%g6
	fcmps	%fcc0,	%f21,	%f17
	mulx	%o6,	%i0,	%g4
	subcc	%l0,	0x0C7C,	%l4
	orncc	%o0,	%l2,	%o2
	edge16l	%l6,	%g7,	%i7
	lduw	[%l7 + 0x50],	%g1
	umul	%g2,	0x022D,	%o4
	movne	%xcc,	%l5,	%g3
	fmovrdlez	%i2,	%f28,	%f18
	movl	%icc,	%o7,	%i4
	lduw	[%l7 + 0x60],	%g5
	or	%o5,	%o1,	%l1
	mulx	%l3,	%i3,	%i6
	sub	%i5,	%o3,	%i1
	movgu	%xcc,	%g6,	%o6
	edge8	%g4,	%l0,	%l4
	move	%xcc,	%o0,	%i0
	lduw	[%l7 + 0x34],	%l2
	fmovde	%icc,	%f3,	%f1
	edge32l	%o2,	%l6,	%g7
	mulscc	%g1,	0x094A,	%i7
	fmovdge	%xcc,	%f1,	%f2
	alignaddrl	%g2,	%o4,	%g3
	lduw	[%l7 + 0x64],	%l5
	fmovdcc	%xcc,	%f18,	%f23
	andcc	%i2,	0x1F2F,	%o7
	movcc	%icc,	%g5,	%i4
	umulcc	%o5,	%o1,	%l1
	for	%f20,	%f6,	%f20
	movvc	%xcc,	%l3,	%i3
	array32	%i6,	%i5,	%i1
	ldub	[%l7 + 0x15],	%g6
	addc	%o6,	%o3,	%l0
	umul	%g4,	0x08DB,	%o0
	orcc	%l4,	0x13C2,	%i0
	movg	%icc,	%l2,	%o2
	ldd	[%l7 + 0x58],	%f0
	movneg	%xcc,	%l6,	%g1
	movneg	%xcc,	%i7,	%g7
	movvc	%xcc,	%g2,	%g3
	ldd	[%l7 + 0x78],	%o4
	lduw	[%l7 + 0x10],	%i2
	udivcc	%o7,	0x0DA5,	%g5
	ldd	[%l7 + 0x40],	%i4
	movrgez	%o5,	%l5,	%l1
	movre	%o1,	0x25E,	%i3
	andn	%i6,	0x123A,	%l3
	pdist	%f2,	%f24,	%f26
	sethi	0x03E7,	%i1
	fmovdleu	%icc,	%f15,	%f1
	fpack16	%f24,	%f13
	sth	%i5,	[%l7 + 0x22]
	fpack16	%f8,	%f18
	fmovrdgez	%o6,	%f18,	%f4
	movrgez	%o3,	0x1B8,	%l0
	sdiv	%g6,	0x076F,	%g4
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	ldx	[%l7 + 0x20],	%o0
	fornot1s	%f30,	%f2,	%f6
	ldsb	[%l7 + 0x24],	%o2
	fnot2	%f24,	%f30
	movrgez	%l2,	0x207,	%l6
	sth	%g1,	[%l7 + 0x2C]
	lduh	[%l7 + 0x6A],	%g7
	fcmpd	%fcc0,	%f16,	%f16
	edge16n	%g2,	%g3,	%i7
	fandnot2s	%f29,	%f15,	%f26
	xor	%i2,	%o7,	%g5
	stw	%i4,	[%l7 + 0x34]
	fmovsge	%xcc,	%f4,	%f3
	alignaddr	%o4,	%o5,	%l1
	stb	%l5,	[%l7 + 0x78]
	addccc	%o1,	%i6,	%l3
	edge16	%i3,	%i1,	%o6
	edge16ln	%o3,	%i5,	%g6
	edge32n	%g4,	%l0,	%l4
	movrgez	%o0,	%i0,	%l2
	addcc	%o2,	0x0E8A,	%l6
	ldx	[%l7 + 0x18],	%g1
	sdivx	%g7,	0x0ECA,	%g2
	srlx	%i7,	0x1A,	%i2
	edge32n	%o7,	%g3,	%g5
	sdiv	%i4,	0x19AE,	%o5
	move	%icc,	%l1,	%o4
	ld	[%l7 + 0x60],	%f27
	fcmpeq32	%f24,	%f12,	%l5
	nop
	set	0x10, %g4
	ldsh	[%l7 + %g4],	%o1
	ld	[%l7 + 0x5C],	%f24
	edge8	%l3,	%i6,	%i1
	xnorcc	%i3,	%o3,	%i5
	orcc	%o6,	%g6,	%g4
	sethi	0x0611,	%l4
	movvs	%xcc,	%l0,	%i0
	popc	%o0,	%l2
	addcc	%o2,	%g1,	%g7
	udivcc	%l6,	0x0B67,	%g2
	fnegd	%f24,	%f2
	lduh	[%l7 + 0x64],	%i7
	xnorcc	%i2,	%g3,	%o7
	or	%g5,	%o5,	%l1
	movrlez	%o4,	%i4,	%l5
	fmovrse	%l3,	%f10,	%f30
	alignaddrl	%o1,	%i1,	%i3
	ldsb	[%l7 + 0x1C],	%o3
	movrne	%i6,	0x307,	%i5
	std	%f0,	[%l7 + 0x68]
	udivx	%o6,	0x14D9,	%g4
	movrlez	%g6,	0x218,	%l0
	xnorcc	%i0,	0x0577,	%o0
	lduh	[%l7 + 0x24],	%l4
	sir	0x033C
	fnot2s	%f29,	%f14
	orn	%l2,	%o2,	%g1
	edge16ln	%l6,	%g7,	%i7
	subcc	%g2,	%i2,	%o7
	movne	%icc,	%g5,	%o5
	umulcc	%l1,	0x1CB8,	%g3
	umul	%o4,	0x0329,	%i4
	ldub	[%l7 + 0x45],	%l3
	subcc	%l5,	%o1,	%i3
	edge8n	%o3,	%i6,	%i5
	sra	%o6,	%g4,	%i1
	stb	%g6,	[%l7 + 0x33]
	sdiv	%i0,	0x0EB6,	%o0
	andncc	%l4,	%l0,	%o2
	mulx	%l2,	%l6,	%g7
	alignaddrl	%g1,	%g2,	%i2
	or	%i7,	%g5,	%o7
	srl	%o5,	0x13,	%g3
	sth	%l1,	[%l7 + 0x64]
	fmuld8sux16	%f16,	%f4,	%f0
	sir	0x0EBD
	movleu	%icc,	%o4,	%l3
	fmovdne	%xcc,	%f10,	%f13
	subc	%i4,	%l5,	%o1
	subccc	%i3,	0x0B12,	%o3
	movvs	%xcc,	%i6,	%o6
	fzero	%f8
	ldd	[%l7 + 0x38],	%f12
	mulscc	%i5,	0x19A2,	%g4
	ldub	[%l7 + 0x7E],	%i1
	edge8	%g6,	%i0,	%o0
	fzeros	%f28
	alignaddr	%l4,	%o2,	%l2
	sllx	%l6,	%g7,	%l0
	fsrc1s	%f14,	%f8
	std	%f12,	[%l7 + 0x08]
	fpadd16	%f4,	%f16,	%f10
	movrlz	%g2,	0x3F1,	%i2
	sdivcc	%g1,	0x1A31,	%g5
	movn	%xcc,	%o7,	%i7
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%o5
	lduw	[%l7 + 0x14],	%l1
	xnorcc	%o4,	0x125B,	%g3
	subccc	%l3,	%i4,	%l5
	xnor	%i3,	0x1920,	%o1
	srl	%o3,	%o6,	%i6
	fand	%f4,	%f24,	%f4
	array32	%i5,	%g4,	%g6
	std	%f6,	[%l7 + 0x48]
	fxors	%f23,	%f5,	%f20
	addcc	%i0,	0x0037,	%i1
	bshuffle	%f0,	%f20,	%f26
	ldub	[%l7 + 0x20],	%l4
	fmovrdne	%o0,	%f20,	%f30
	sdivx	%o2,	0x1398,	%l2
	sub	%l6,	%l0,	%g7
	movgu	%icc,	%g2,	%g1
	sdiv	%i2,	0x1BD0,	%g5
	ld	[%l7 + 0x4C],	%f15
	movrgz	%i7,	%o7,	%l1
	fmovrslz	%o5,	%f8,	%f4
	ld	[%l7 + 0x6C],	%f9
	stw	%g3,	[%l7 + 0x58]
	save %l3, 0x1367, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	0x1600,	%i3
	alignaddr	%o4,	%o1,	%o3
	fmuld8sux16	%f23,	%f16,	%f20
	fmovsneg	%xcc,	%f24,	%f19
	smul	%o6,	%i5,	%g4
	fxnors	%f8,	%f10,	%f8
	save %g6, 0x1763, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i1,	%l4,	%o0
	edge8	%o2,	%i6,	%l6
	orn	%l0,	%g7,	%g2
	fcmped	%fcc1,	%f10,	%f8
	fornot1	%f18,	%f2,	%f20
	fmul8x16al	%f24,	%f29,	%f18
	movg	%xcc,	%l2,	%g1
	fmovrsne	%i2,	%f22,	%f8
	sra	%i7,	%o7,	%l1
	sra	%g5,	%g3,	%o5
	fcmpeq16	%f28,	%f8,	%l3
	sir	0x137A
	ld	[%l7 + 0x38],	%f28
	smul	%l5,	0x1447,	%i4
	fmovsne	%icc,	%f9,	%f29
	edge32n	%i3,	%o4,	%o3
	edge8l	%o1,	%o6,	%i5
	fpsub32s	%f25,	%f27,	%f28
	movge	%icc,	%g4,	%i0
	orn	%g6,	0x0FB2,	%l4
	andcc	%o0,	0x150C,	%o2
	or	%i1,	%i6,	%l0
	array16	%g7,	%g2,	%l6
	restore %g1, 0x1464, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	0x163B,	%i7
	sub	%l1,	0x085D,	%o7
	xnorcc	%g5,	%o5,	%g3
	alignaddrl	%l3,	%i4,	%i3
	udivx	%o4,	0x0C47,	%l5
	addc	%o3,	%o6,	%o1
	movle	%icc,	%i5,	%i0
	mova	%xcc,	%g4,	%l4
	orcc	%o0,	0x1A19,	%g6
	xnorcc	%i1,	%i6,	%o2
	st	%f25,	[%l7 + 0x0C]
	fmovdn	%icc,	%f29,	%f2
	movrlez	%l0,	0x37A,	%g7
	bshuffle	%f14,	%f22,	%f22
	sir	0x1A79
	alignaddr	%l6,	%g2,	%l2
	xor	%i2,	%i7,	%g1
	edge16	%o7,	%l1,	%o5
	movrlz	%g5,	%l3,	%g3
	fnot1s	%f2,	%f21
	orcc	%i4,	%i3,	%o4
	ldub	[%l7 + 0x1F],	%l5
	sllx	%o3,	0x0A,	%o1
	fmul8x16	%f25,	%f6,	%f0
	ldsb	[%l7 + 0x4C],	%i5
	udiv	%i0,	0x0A95,	%g4
	st	%f25,	[%l7 + 0x30]
	or	%o6,	0x1B5B,	%o0
	edge8ln	%g6,	%l4,	%i1
	lduh	[%l7 + 0x20],	%i6
	movvc	%icc,	%l0,	%o2
	fmovsleu	%icc,	%f19,	%f4
	stx	%g7,	[%l7 + 0x10]
	edge8l	%g2,	%l2,	%i2
	ldx	[%l7 + 0x50],	%i7
	movg	%icc,	%l6,	%o7
	subcc	%l1,	0x05ED,	%g1
	array32	%o5,	%g5,	%g3
	fmovdcc	%icc,	%f29,	%f1
	xnorcc	%l3,	0x1CA9,	%i4
	ldd	[%l7 + 0x20],	%f20
	ldd	[%l7 + 0x50],	%i2
	nop
	set	0x18, %l6
	ldsw	[%l7 + %l6],	%o4
	lduh	[%l7 + 0x7C],	%o3
	xnorcc	%o1,	%i5,	%i0
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	fmovrde	%g4,	%f6,	%f2
	andcc	%o0,	0x0C9F,	%l4
	mova	%xcc,	%g6,	%i1
	movcc	%xcc,	%i6,	%o2
	fabss	%f21,	%f26
	mulx	%g7,	%g2,	%l2
	fors	%f21,	%f2,	%f12
	edge8n	%l0,	%i7,	%l6
	alignaddrl	%o7,	%i2,	%l1
	xnor	%o5,	%g5,	%g1
	subccc	%l3,	%g3,	%i3
	fmovrse	%i4,	%f6,	%f17
	movn	%icc,	%o4,	%o3
	sth	%o1,	[%l7 + 0x48]
	ldd	[%l7 + 0x18],	%i4
	and	%i0,	%l5,	%g4
	fandnot1	%f24,	%f28,	%f10
	lduh	[%l7 + 0x50],	%o6
	fmovscc	%xcc,	%f10,	%f2
	edge32n	%o0,	%l4,	%i1
	nop
	set	0x34, %o2
	ldsw	[%l7 + %o2],	%g6
	sethi	0x1E72,	%o2
	fmovdgu	%xcc,	%f27,	%f23
	andn	%i6,	%g2,	%l2
	array16	%g7,	%i7,	%l0
	smulcc	%l6,	%o7,	%l1
	sth	%o5,	[%l7 + 0x42]
	lduh	[%l7 + 0x28],	%i2
	fornot1	%f28,	%f10,	%f24
	sir	0x1C4F
	fxnors	%f8,	%f5,	%f20
	faligndata	%f14,	%f0,	%f20
	movcs	%icc,	%g5,	%l3
	andn	%g3,	0x1D99,	%g1
	or	%i3,	%o4,	%i4
	move	%icc,	%o1,	%o3
	fmovrdlez	%i5,	%f26,	%f28
	fmovdn	%xcc,	%f14,	%f18
	movrgz	%i0,	0x3E9,	%l5
	restore %g4, 0x0679, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l4,	0x1F31,	%i1
	umulcc	%g6,	%o6,	%o2
	array32	%g2,	%i6,	%g7
	fcmpgt32	%f10,	%f12,	%l2
	movcs	%xcc,	%l0,	%l6
	sdivcc	%o7,	0x02C1,	%i7
	movcc	%xcc,	%l1,	%o5
	andcc	%i2,	0x1C7A,	%l3
	fmovdl	%icc,	%f11,	%f16
	fandnot1s	%f18,	%f12,	%f22
	fabsd	%f2,	%f22
	movl	%xcc,	%g5,	%g3
	sethi	0x0EEB,	%i3
	and	%o4,	%g1,	%i4
	sethi	0x1688,	%o3
	subcc	%i5,	0x141A,	%o1
	or	%i0,	%g4,	%l5
	movg	%xcc,	%o0,	%l4
	udivx	%i1,	0x1765,	%g6
	srlx	%o6,	%g2,	%i6
	fandnot1s	%f10,	%f27,	%f14
	edge32n	%o2,	%g7,	%l2
	umul	%l6,	%l0,	%o7
	ld	[%l7 + 0x4C],	%f28
	fmovrsgz	%i7,	%f4,	%f23
	fpmerge	%f24,	%f14,	%f16
	fornot1	%f10,	%f8,	%f28
	movge	%icc,	%l1,	%o5
	move	%xcc,	%l3,	%i2
	fpadd16s	%f20,	%f22,	%f4
	sethi	0x1007,	%g5
	nop
	set	0x7F, %l4
	ldsb	[%l7 + %l4],	%i3
	ldsb	[%l7 + 0x60],	%o4
	edge32n	%g3,	%g1,	%o3
	movcs	%icc,	%i5,	%o1
	ldd	[%l7 + 0x10],	%i4
	fsrc2	%f8,	%f10
	xor	%g4,	0x0F83,	%l5
	for	%f10,	%f8,	%f30
	movrne	%o0,	%l4,	%i0
	popc	%i1,	%o6
	movpos	%icc,	%g6,	%g2
	sllx	%i6,	%g7,	%o2
	alignaddr	%l2,	%l0,	%l6
	movcs	%icc,	%o7,	%i7
	fcmps	%fcc2,	%f4,	%f20
	smulcc	%o5,	%l3,	%l1
	fmovscs	%icc,	%f22,	%f29
	fand	%f0,	%f2,	%f20
	for	%f26,	%f10,	%f18
	mova	%icc,	%g5,	%i2
	movpos	%xcc,	%i3,	%g3
	addccc	%o4,	0x091E,	%g1
	ldx	[%l7 + 0x50],	%i5
	popc	0x10F1,	%o3
	fabss	%f18,	%f29
	movcs	%icc,	%i4,	%g4
	fcmpne16	%f18,	%f26,	%l5
	lduw	[%l7 + 0x48],	%o1
	orn	%l4,	0x0F90,	%o0
	fpsub16s	%f18,	%f16,	%f25
	xnor	%i0,	%o6,	%i1
	umulcc	%g6,	0x098D,	%g2
	ldsb	[%l7 + 0x22],	%i6
	fmovrde	%g7,	%f16,	%f0
	subcc	%o2,	%l2,	%l6
	fnands	%f19,	%f26,	%f20
	fmovrdgez	%o7,	%f10,	%f20
	edge8n	%l0,	%o5,	%i7
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	movg	%xcc,	%i3,	%l1
	ldd	[%l7 + 0x78],	%o4
	movleu	%xcc,	%g1,	%i5
	movcc	%icc,	%g3,	%i4
	nop
	set	0x24, %o6
	sth	%o3,	[%l7 + %o6]
	fcmped	%fcc1,	%f26,	%f12
	sdivcc	%g4,	0x0A24,	%o1
	and	%l5,	%l4,	%o0
	ld	[%l7 + 0x7C],	%f3
	srax	%i0,	%o6,	%g6
	udivcc	%g2,	0x08F4,	%i6
	orcc	%i1,	%o2,	%g7
	sdivx	%l6,	0x02B6,	%o7
	stw	%l2,	[%l7 + 0x7C]
	fpack16	%f26,	%f27
	edge8	%o5,	%i7,	%l0
	smulcc	%g5,	%l3,	%i2
	andcc	%i3,	0x0E17,	%l1
	fmovdl	%xcc,	%f0,	%f8
	fnand	%f24,	%f18,	%f8
	ldx	[%l7 + 0x78],	%o4
	fmovrsne	%i5,	%f31,	%f31
	move	%icc,	%g3,	%i4
	stw	%o3,	[%l7 + 0x78]
	movleu	%xcc,	%g1,	%g4
	fpsub16	%f8,	%f26,	%f24
	save %l5, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0830
	ldd	[%l7 + 0x28],	%f22
	movge	%xcc,	%i0,	%o6
	edge8l	%g6,	%g2,	%i6
	fmovde	%icc,	%f8,	%f14
	sra	%o0,	0x05,	%i1
	udiv	%g7,	0x1205,	%l6
	edge32l	%o2,	%l2,	%o5
	edge32l	%i7,	%l0,	%o7
	fmovrse	%l3,	%f2,	%f12
	fmovdgu	%icc,	%f12,	%f31
	fmovdleu	%xcc,	%f25,	%f16
	udivx	%i2,	0x0161,	%g5
	ldsh	[%l7 + 0x20],	%l1
	subc	%i3,	%o4,	%g3
	ldd	[%l7 + 0x38],	%i4
	xorcc	%o3,	%g1,	%i4
	fmovsne	%xcc,	%f0,	%f12
	edge32	%g4,	%o1,	%l4
	subcc	%i0,	%l5,	%g6
	fmul8ulx16	%f30,	%f12,	%f6
	array32	%o6,	%i6,	%g2
	array8	%i1,	%o0,	%g7
	fmovdge	%icc,	%f10,	%f28
	fmovdvs	%icc,	%f29,	%f14
	fmovdle	%xcc,	%f25,	%f17
	edge16ln	%o2,	%l6,	%o5
	sra	%l2,	0x03,	%l0
	fcmpgt16	%f24,	%f6,	%o7
	st	%f3,	[%l7 + 0x0C]
	restore %l3, 0x17F5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g5,	0x396,	%l1
	ldd	[%l7 + 0x38],	%i2
	siam	0x6
	ld	[%l7 + 0x18],	%f31
	fmovspos	%icc,	%f14,	%f7
	siam	0x6
	orn	%i3,	%o4,	%g3
	sdivcc	%i5,	0x17E2,	%o3
	movcs	%xcc,	%i4,	%g1
	xor	%o1,	0x01F3,	%l4
	sra	%i0,	0x14,	%g4
	add	%l5,	%o6,	%i6
	movre	%g6,	0x294,	%g2
	fmovdvs	%icc,	%f22,	%f11
	udivcc	%o0,	0x06C8,	%i1
	and	%g7,	0x0A5D,	%o2
	ldub	[%l7 + 0x24],	%l6
	movgu	%xcc,	%l2,	%o5
	andncc	%l0,	%o7,	%i7
	umulcc	%g5,	%l1,	%l3
	and	%i3,	0x0D58,	%i2
	lduh	[%l7 + 0x3C],	%g3
	movrgez	%o4,	0x264,	%i5
	movvs	%xcc,	%o3,	%i4
	array32	%g1,	%o1,	%l4
	addc	%g4,	0x0D3D,	%i0
	popc	0x06CD,	%o6
	sll	%i6,	0x08,	%g6
	array8	%l5,	%o0,	%i1
	movrgez	%g2,	0x204,	%g7
	udivcc	%o2,	0x1F6E,	%l2
	fmovdn	%icc,	%f8,	%f27
	orncc	%o5,	0x1ABB,	%l0
	movrne	%l6,	%o7,	%g5
	sdivcc	%l1,	0x1332,	%l3
	xnor	%i7,	0x14D5,	%i3
	movrlz	%i2,	0x21C,	%g3
	edge8n	%o4,	%i5,	%o3
	lduw	[%l7 + 0x28],	%g1
	addc	%i4,	%o1,	%g4
	edge16	%i0,	%l4,	%i6
	movpos	%xcc,	%o6,	%l5
	srl	%o0,	%g6,	%g2
	movrgez	%i1,	%g7,	%o2
	sir	0x13CD
	ldx	[%l7 + 0x18],	%o5
	movrlez	%l0,	%l2,	%o7
	st	%f11,	[%l7 + 0x60]
	fmovdle	%icc,	%f15,	%f14
	fpadd32	%f16,	%f0,	%f18
	sll	%g5,	%l6,	%l1
	std	%f26,	[%l7 + 0x30]
	edge16	%i7,	%i3,	%l3
	orncc	%i2,	%g3,	%o4
	fmovsle	%xcc,	%f14,	%f4
	fmovsle	%icc,	%f14,	%f9
	andncc	%o3,	%i5,	%g1
	movn	%icc,	%i4,	%o1
	fands	%f14,	%f22,	%f12
	sdivx	%g4,	0x10CE,	%i0
	srlx	%l4,	%i6,	%l5
	ldub	[%l7 + 0x48],	%o0
	srax	%o6,	%g2,	%g6
	xnor	%i1,	0x09BA,	%g7
	save %o5, 0x0B56, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f26,	%f28,	%o2
	srl	%l2,	%o7,	%l6
	edge16ln	%l1,	%i7,	%i3
	fcmpeq16	%f22,	%f16,	%l3
	xor	%g5,	%i2,	%g3
	sir	0x02A3
	xorcc	%o4,	0x12E3,	%o3
	srax	%g1,	%i4,	%o1
	smulcc	%i5,	0x1150,	%i0
	movrlez	%g4,	%l4,	%l5
	and	%o0,	%i6,	%g2
	alignaddrl	%g6,	%o6,	%i1
	fmovsge	%xcc,	%f21,	%f25
	edge8n	%o5,	%l0,	%g7
	fcmpeq32	%f6,	%f24,	%o2
	xor	%l2,	0x1F97,	%o7
	edge32n	%l1,	%l6,	%i3
	ldsb	[%l7 + 0x69],	%l3
	orcc	%i7,	0x0639,	%g5
	srl	%g3,	%i2,	%o4
	movn	%xcc,	%g1,	%i4
	smulcc	%o3,	%i5,	%o1
	edge32	%i0,	%l4,	%l5
	subcc	%o0,	0x000E,	%g4
	alignaddrl	%g2,	%i6,	%o6
	edge32	%i1,	%g6,	%l0
	edge16	%o5,	%g7,	%l2
	edge16l	%o2,	%l1,	%l6
	ld	[%l7 + 0x28],	%f7
	edge16	%i3,	%o7,	%i7
	fmovsle	%xcc,	%f26,	%f21
	sub	%l3,	%g3,	%i2
	popc	%o4,	%g1
	ldub	[%l7 + 0x33],	%i4
	ld	[%l7 + 0x2C],	%f20
	add	%g5,	0x0664,	%o3
	movpos	%xcc,	%i5,	%o1
	edge8ln	%l4,	%l5,	%o0
	fnot1	%f2,	%f0
	xnor	%i0,	0x014A,	%g2
	subc	%g4,	0x192A,	%i6
	subcc	%i1,	0x1488,	%g6
	orncc	%l0,	%o6,	%o5
	sth	%l2,	[%l7 + 0x42]
	andn	%o2,	%g7,	%l1
	umul	%l6,	0x072E,	%i3
	xnor	%i7,	0x0897,	%o7
	movl	%xcc,	%g3,	%i2
	fmovda	%xcc,	%f13,	%f1
	ldd	[%l7 + 0x18],	%f4
	edge8n	%o4,	%g1,	%l3
	movpos	%xcc,	%g5,	%i4
	movge	%xcc,	%o3,	%i5
	movg	%icc,	%l4,	%o1
	xnorcc	%l5,	0x1F22,	%i0
	add	%g2,	%o0,	%i6
	fmovrse	%g4,	%f20,	%f19
	lduh	[%l7 + 0x68],	%g6
	movl	%xcc,	%i1,	%o6
	lduw	[%l7 + 0x14],	%l0
	edge16ln	%l2,	%o2,	%g7
	movvc	%icc,	%o5,	%l6
	fmovdne	%xcc,	%f14,	%f30
	orcc	%l1,	0x1BEF,	%i3
	orncc	%o7,	0x139D,	%i7
	movgu	%icc,	%g3,	%o4
	fmovdne	%icc,	%f29,	%f12
	sth	%i2,	[%l7 + 0x38]
	xor	%g1,	%l3,	%i4
	array32	%o3,	%g5,	%l4
	smulcc	%o1,	%i5,	%l5
	edge8n	%i0,	%g2,	%i6
	ldsw	[%l7 + 0x7C],	%o0
	xor	%g4,	0x1528,	%g6
	ldd	[%l7 + 0x70],	%o6
	sdivx	%l0,	0x15C5,	%l2
	pdist	%f4,	%f30,	%f12
	sir	0x1782
	stw	%i1,	[%l7 + 0x54]
	movrne	%g7,	%o5,	%o2
	mulscc	%l6,	0x0E6E,	%l1
	sub	%i3,	0x1B1E,	%o7
	sir	0x1696
	addc	%g3,	0x0968,	%i7
	movleu	%xcc,	%i2,	%g1
	ld	[%l7 + 0x10],	%f17
	movvc	%icc,	%l3,	%i4
	addccc	%o4,	%g5,	%l4
	fnegs	%f6,	%f11
	movrgez	%o1,	%i5,	%o3
	sllx	%i0,	%g2,	%i6
	movne	%xcc,	%l5,	%g4
	subc	%o0,	0x1F48,	%g6
	edge16n	%o6,	%l2,	%l0
	move	%xcc,	%g7,	%o5
	fnor	%f2,	%f22,	%f10
	edge16	%o2,	%l6,	%i1
	fcmped	%fcc2,	%f10,	%f24
	fmovsvc	%icc,	%f4,	%f28
	fmovsneg	%xcc,	%f19,	%f14
	movvc	%xcc,	%i3,	%o7
	stb	%l1,	[%l7 + 0x6A]
	udivcc	%g3,	0x14C8,	%i7
	fpadd16	%f2,	%f16,	%f22
	popc	%i2,	%l3
	stx	%i4,	[%l7 + 0x28]
	andcc	%o4,	%g1,	%l4
	fcmple16	%f24,	%f12,	%o1
	addccc	%i5,	%g5,	%i0
	xor	%g2,	0x017B,	%i6
	fzero	%f0
	fpack16	%f4,	%f3
	popc	0x18A8,	%l5
	fornot2	%f20,	%f8,	%f20
	srl	%o3,	%o0,	%g4
	array32	%g6,	%o6,	%l2
	sdiv	%l0,	0x1029,	%g7
	alignaddr	%o5,	%o2,	%l6
	sll	%i1,	%o7,	%i3
	movgu	%xcc,	%l1,	%i7
	edge16	%g3,	%l3,	%i4
	movrgez	%o4,	0x15D,	%g1
	nop
	set	0x20, %g1
	ldub	[%l7 + %g1],	%l4
	fmovdcs	%icc,	%f18,	%f22
	fmovsg	%xcc,	%f9,	%f24
	move	%icc,	%o1,	%i2
	stw	%i5,	[%l7 + 0x50]
	edge8n	%i0,	%g2,	%g5
	edge16ln	%l5,	%o3,	%i6
	fmovdle	%xcc,	%f0,	%f10
	fnors	%f27,	%f12,	%f25
	sth	%o0,	[%l7 + 0x0C]
	movrlz	%g4,	0x0B9,	%g6
	movrlz	%o6,	%l2,	%g7
	ldsb	[%l7 + 0x43],	%l0
	movre	%o2,	0x251,	%l6
	edge8	%i1,	%o7,	%o5
	fmovsl	%icc,	%f17,	%f21
	fmovdge	%xcc,	%f17,	%f26
	fnot1	%f28,	%f0
	srl	%l1,	%i3,	%g3
	fmovda	%icc,	%f27,	%f21
	andcc	%i7,	0x1E88,	%l3
	movl	%xcc,	%i4,	%g1
	addcc	%o4,	%o1,	%l4
	ldsh	[%l7 + 0x68],	%i5
	edge32	%i0,	%g2,	%g5
	ldsw	[%l7 + 0x38],	%l5
	nop
	set	0x10, %i2
	stx	%o3,	[%l7 + %i2]
	movneg	%icc,	%i2,	%o0
	add	%g4,	0x1B39,	%i6
	mulscc	%g6,	0x0A73,	%o6
	lduh	[%l7 + 0x68],	%g7
	alignaddrl	%l2,	%o2,	%l6
	movre	%i1,	%o7,	%l0
	edge16l	%o5,	%i3,	%l1
	st	%f20,	[%l7 + 0x18]
	edge16	%g3,	%i7,	%l3
	fsrc1s	%f7,	%f16
	smul	%i4,	%o4,	%g1
	ldd	[%l7 + 0x10],	%o0
	sethi	0x0BE9,	%i5
	sdivx	%l4,	0x1B45,	%g2
	movle	%icc,	%i0,	%l5
	umul	%g5,	%i2,	%o3
	ld	[%l7 + 0x0C],	%f23
	addc	%o0,	0x1EB1,	%i6
	and	%g6,	0x133E,	%o6
	fpsub32	%f26,	%f18,	%f4
	std	%f18,	[%l7 + 0x78]
	edge32ln	%g4,	%l2,	%g7
	fsrc2	%f22,	%f16
	sra	%o2,	%l6,	%o7
	fpsub16	%f12,	%f4,	%f22
	movrne	%l0,	%o5,	%i3
	fpadd32	%f14,	%f2,	%f22
	edge16	%i1,	%l1,	%i7
	xnorcc	%g3,	0x11F3,	%l3
	fmovs	%f26,	%f12
	ldd	[%l7 + 0x60],	%f2
	move	%icc,	%o4,	%i4
	ldd	[%l7 + 0x20],	%f10
	sllx	%o1,	%i5,	%g1
	andn	%g2,	%i0,	%l5
	and	%g5,	%i2,	%o3
	sir	0x0710
	nop
	set	0x3A, %l5
	lduh	[%l7 + %l5],	%o0
	fmovsa	%xcc,	%f7,	%f6
	orncc	%i6,	%g6,	%o6
	srlx	%l4,	%l2,	%g4
	fpack32	%f30,	%f22,	%f18
	addc	%o2,	0x0FDB,	%l6
	addc	%o7,	%g7,	%l0
	alignaddr	%o5,	%i3,	%l1
	udivx	%i7,	0x13BC,	%i1
	stb	%g3,	[%l7 + 0x6B]
	xorcc	%o4,	0x1A33,	%i4
	ld	[%l7 + 0x58],	%f31
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	and	%g2,	%g1,	%l5
	sdivx	%i0,	0x1CEF,	%g5
	array32	%o3,	%o0,	%i6
	fnor	%f28,	%f20,	%f8
	orncc	%i2,	0x1D51,	%g6
	array32	%l4,	%o6,	%g4
	movg	%xcc,	%l2,	%l6
	ldd	[%l7 + 0x40],	%f6
	ldx	[%l7 + 0x20],	%o2
	edge16	%g7,	%l0,	%o5
	mulx	%o7,	%i3,	%i7
	movcc	%xcc,	%i1,	%l1
	edge32l	%o4,	%g3,	%i4
	srax	%l3,	%o1,	%g2
	movrgez	%i5,	0x239,	%g1
	xnor	%l5,	%i0,	%g5
	fpack16	%f18,	%f8
	fpack16	%f12,	%f14
	movpos	%xcc,	%o3,	%i6
	movge	%icc,	%i2,	%g6
	ldsh	[%l7 + 0x0E],	%l4
	stw	%o0,	[%l7 + 0x70]
	save %g4, 0x1820, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%l6,	%g7
	st	%f9,	[%l7 + 0x20]
	xor	%l0,	0x0EF3,	%o5
	movn	%icc,	%o2,	%o7
	edge8l	%i3,	%i7,	%i1
	edge16n	%l1,	%o4,	%i4
	sra	%g3,	0x0B,	%l3
	movvc	%icc,	%o1,	%i5
	edge16l	%g2,	%l5,	%g1
	lduh	[%l7 + 0x78],	%i0
	fnors	%f26,	%f10,	%f6
	movle	%xcc,	%o3,	%g5
	sdivx	%i6,	0x0DF2,	%i2
	fpadd16	%f20,	%f6,	%f0
	fxnors	%f23,	%f28,	%f10
	fnand	%f0,	%f12,	%f24
	xorcc	%g6,	0x1ECD,	%l4
	movrgz	%g4,	%l2,	%o6
	stx	%o0,	[%l7 + 0x20]
	stb	%g7,	[%l7 + 0x78]
	fmovsneg	%xcc,	%f19,	%f21
	umul	%l0,	0x089C,	%o5
	umulcc	%o2,	0x0D47,	%l6
	subc	%o7,	%i3,	%i1
	fandnot2s	%f19,	%f7,	%f5
	movl	%icc,	%l1,	%o4
	movvc	%xcc,	%i7,	%g3
	sra	%l3,	%o1,	%i4
	edge32n	%g2,	%i5,	%g1
	sdivcc	%l5,	0x1EFF,	%o3
	ldx	[%l7 + 0x38],	%g5
	movg	%icc,	%i6,	%i2
	movl	%icc,	%g6,	%i0
	ld	[%l7 + 0x70],	%f26
	movrgez	%g4,	0x2D1,	%l2
	sdivcc	%o6,	0x02A0,	%l4
	fpadd16	%f8,	%f26,	%f22
	subccc	%g7,	0x12F2,	%o0
	andncc	%l0,	%o5,	%o2
	mulscc	%o7,	0x057E,	%l6
	movre	%i1,	0x200,	%l1
	xor	%o4,	%i7,	%i3
	fabss	%f20,	%f25
	movn	%icc,	%g3,	%o1
	movcc	%xcc,	%l3,	%g2
	movrgz	%i4,	0x311,	%g1
	or	%l5,	0x1F56,	%o3
	ldub	[%l7 + 0x6D],	%g5
	xor	%i6,	%i5,	%g6
	movleu	%xcc,	%i0,	%i2
	array8	%l2,	%o6,	%l4
	edge16l	%g7,	%o0,	%g4
	edge16	%l0,	%o2,	%o5
	sdiv	%l6,	0x0685,	%o7
	and	%l1,	%i1,	%i7
	movrgz	%o4,	0x25E,	%i3
	fcmpne16	%f12,	%f0,	%o1
	lduh	[%l7 + 0x74],	%g3
	sll	%l3,	%g2,	%i4
	alignaddrl	%l5,	%o3,	%g1
	udiv	%g5,	0x083A,	%i5
	movvs	%xcc,	%g6,	%i0
	alignaddr	%i2,	%l2,	%i6
	fmovdgu	%icc,	%f9,	%f25
	fmovrdgz	%l4,	%f22,	%f10
	sll	%o6,	%g7,	%o0
	movrgz	%g4,	0x22D,	%o2
	mulx	%o5,	%l0,	%l6
	movleu	%xcc,	%o7,	%i1
	stb	%i7,	[%l7 + 0x32]
	sllx	%l1,	0x04,	%i3
	movgu	%icc,	%o4,	%g3
	ld	[%l7 + 0x38],	%f22
	fmul8x16	%f28,	%f8,	%f30
	edge16	%l3,	%g2,	%i4
	sdivcc	%l5,	0x1FE8,	%o1
	st	%f6,	[%l7 + 0x2C]
	sdivx	%g1,	0x0019,	%g5
	umulcc	%i5,	%g6,	%i0
	edge8	%o3,	%l2,	%i2
	movrgz	%l4,	0x3C2,	%i6
	udiv	%o6,	0x1221,	%o0
	movrgz	%g4,	%g7,	%o2
	udivcc	%o5,	0x1528,	%l0
	ldsw	[%l7 + 0x48],	%l6
	save %o7, %i7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f12,	%f4,	%f28
	srlx	%i3,	0x1E,	%o4
	nop
	set	0x34, %i6
	ldsw	[%l7 + %i6],	%g3
	fornot1	%f12,	%f28,	%f12
	fpsub32s	%f20,	%f28,	%f22
	edge32n	%l1,	%g2,	%l3
	mova	%xcc,	%l5,	%i4
	addcc	%o1,	%g1,	%g5
	srlx	%i5,	%i0,	%g6
	movn	%xcc,	%l2,	%i2
	addcc	%l4,	%i6,	%o3
	subc	%o0,	%o6,	%g7
	ldd	[%l7 + 0x68],	%g4
	std	%f30,	[%l7 + 0x30]
	fcmpne16	%f6,	%f20,	%o5
	fornot2s	%f20,	%f8,	%f25
	umulcc	%l0,	0x10A1,	%o2
	movrgz	%o7,	0x374,	%l6
	edge32ln	%i7,	%i1,	%i3
	movre	%o4,	%g3,	%l1
	andn	%l3,	0x1939,	%g2
	stw	%l5,	[%l7 + 0x38]
	fmovsl	%xcc,	%f2,	%f10
	fmovdvs	%icc,	%f2,	%f29
	ldub	[%l7 + 0x14],	%o1
	nop
	set	0x60, %i5
	stw	%g1,	[%l7 + %i5]
	fmovspos	%xcc,	%f30,	%f1
	fones	%f27
	andn	%i4,	%g5,	%i0
	ldd	[%l7 + 0x30],	%f20
	movl	%xcc,	%i5,	%g6
	add	%i2,	0x07E8,	%l4
	fmovse	%icc,	%f19,	%f28
	mulx	%i6,	0x1731,	%l2
	movleu	%icc,	%o0,	%o3
	movcs	%xcc,	%o6,	%g7
	movrlez	%o5,	%l0,	%g4
	udiv	%o2,	0x0186,	%l6
	sdivx	%i7,	0x00E1,	%o7
	fmovrdlez	%i3,	%f6,	%f0
	sir	0x1DEF
	fmul8sux16	%f6,	%f30,	%f2
	popc	%o4,	%g3
	movgu	%icc,	%i1,	%l1
	edge32n	%g2,	%l5,	%o1
	ldd	[%l7 + 0x68],	%f28
	orn	%l3,	0x0073,	%g1
	udivx	%g5,	0x1696,	%i4
	movgu	%xcc,	%i5,	%i0
	srl	%g6,	%l4,	%i6
	stw	%l2,	[%l7 + 0x74]
	fnegd	%f12,	%f12
	lduh	[%l7 + 0x60],	%i2
	fornot1s	%f13,	%f28,	%f12
	smul	%o3,	%o0,	%o6
	ldd	[%l7 + 0x28],	%g6
	movre	%l0,	0x30C,	%g4
	mulx	%o5,	%o2,	%l6
	movg	%icc,	%i7,	%o7
	stb	%o4,	[%l7 + 0x0A]
	orn	%g3,	0x1421,	%i1
	sdiv	%l1,	0x0D89,	%i3
	sra	%g2,	%o1,	%l5
	movpos	%xcc,	%l3,	%g1
	fmovdg	%icc,	%f7,	%f1
	array32	%g5,	%i4,	%i0
	movg	%xcc,	%g6,	%l4
	fmovsneg	%icc,	%f10,	%f24
	xorcc	%i5,	%l2,	%i2
	smul	%o3,	%i6,	%o6
	mulscc	%o0,	%g7,	%g4
	orcc	%l0,	0x060F,	%o2
	siam	0x3
	addcc	%o5,	0x057F,	%l6
	orcc	%i7,	%o4,	%g3
	movrne	%o7,	0x08A,	%i1
	ldx	[%l7 + 0x20],	%i3
	movpos	%icc,	%l1,	%g2
	addc	%o1,	%l3,	%l5
	subcc	%g5,	0x19B8,	%i4
	mulx	%g1,	0x0E30,	%i0
	fmul8x16	%f11,	%f12,	%f16
	array8	%g6,	%i5,	%l2
	udivcc	%l4,	0x16A0,	%i2
	edge16l	%i6,	%o3,	%o6
	orcc	%o0,	0x0F17,	%g4
	andn	%l0,	0x06F5,	%o2
	movl	%xcc,	%o5,	%l6
	andncc	%i7,	%g7,	%o4
	ldsb	[%l7 + 0x4E],	%o7
	fabsd	%f22,	%f20
	movg	%icc,	%i1,	%i3
	sll	%l1,	%g2,	%o1
	movgu	%xcc,	%l3,	%g3
	ldx	[%l7 + 0x28],	%l5
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i4
	sdivx	%g5,	0x1F85,	%g1
	ldd	[%l7 + 0x68],	%f22
	fmovdg	%icc,	%f6,	%f18
	movrgez	%i0,	%g6,	%l2
	edge8l	%l4,	%i5,	%i2
	restore %o3, 0x0CC3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f4,	%f9,	%f17
	orncc	%o0,	%g4,	%i6
	edge8	%l0,	%o5,	%l6
	fcmpeq32	%f18,	%f18,	%i7
	fmovdg	%xcc,	%f27,	%f28
	array8	%g7,	%o2,	%o4
	sth	%i1,	[%l7 + 0x40]
	add	%i3,	0x03B1,	%o7
	addcc	%g2,	0x07EF,	%l1
	std	%f30,	[%l7 + 0x40]
	movle	%xcc,	%o1,	%g3
	or	%l5,	0x092F,	%l3
	lduh	[%l7 + 0x14],	%g5
	movvs	%xcc,	%i4,	%g1
	save %g6, %i0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f18,	%f22
	fandnot1	%f4,	%f28,	%f0
	save %l4, 0x007D, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o3,	0x10A0,	%i2
	move	%icc,	%o6,	%o0
	movre	%g4,	0x207,	%l0
	array16	%o5,	%i6,	%l6
	and	%i7,	0x1685,	%o2
	fnands	%f16,	%f1,	%f14
	subccc	%g7,	%i1,	%i3
	edge8l	%o4,	%o7,	%g2
	mova	%xcc,	%l1,	%g3
	and	%o1,	0x062D,	%l5
	movrlez	%g5,	%l3,	%i4
	edge8ln	%g1,	%g6,	%i0
	movleu	%xcc,	%l2,	%l4
	edge16n	%i5,	%i2,	%o6
	and	%o0,	0x001C,	%g4
	fcmple32	%f6,	%f12,	%o3
	edge8l	%o5,	%i6,	%l6
	xnor	%l0,	%i7,	%g7
	movle	%icc,	%o2,	%i3
	movrne	%o4,	%i1,	%g2
	fcmps	%fcc1,	%f9,	%f2
	movvc	%xcc,	%o7,	%l1
	movcc	%xcc,	%g3,	%l5
	popc	0x018E,	%o1
	array16	%g5,	%l3,	%i4
	ldx	[%l7 + 0x58],	%g6
	fsrc2s	%f27,	%f25
	fmovsl	%icc,	%f31,	%f2
	ldd	[%l7 + 0x18],	%g0
	addcc	%l2,	%i0,	%i5
	udivx	%i2,	0x0716,	%o6
	lduw	[%l7 + 0x68],	%l4
	edge16l	%o0,	%g4,	%o3
	fpadd16s	%f15,	%f14,	%f5
	srlx	%i6,	%o5,	%l0
	edge16ln	%i7,	%l6,	%g7
	st	%f11,	[%l7 + 0x58]
	sdiv	%o2,	0x0717,	%o4
	andcc	%i1,	%g2,	%i3
	fmovdneg	%xcc,	%f29,	%f30
	fmovda	%xcc,	%f30,	%f23
	ldub	[%l7 + 0x3E],	%o7
	ldsb	[%l7 + 0x67],	%g3
	movn	%xcc,	%l5,	%o1
	nop
	set	0x48, %o7
	stx	%g5,	[%l7 + %o7]
	edge8n	%l3,	%i4,	%l1
	movneg	%xcc,	%g6,	%g1
	ldsh	[%l7 + 0x62],	%l2
	subc	%i0,	0x015F,	%i5
	array16	%o6,	%l4,	%o0
	stb	%g4,	[%l7 + 0x39]
	sth	%i2,	[%l7 + 0x6A]
	sra	%i6,	0x06,	%o5
	movcc	%xcc,	%o3,	%i7
	sllx	%l0,	%g7,	%l6
	movrgz	%o4,	%o2,	%i1
	edge16n	%g2,	%o7,	%i3
	ldx	[%l7 + 0x20],	%g3
	subc	%l5,	0x1640,	%g5
	xnorcc	%o1,	%l3,	%l1
	array16	%i4,	%g6,	%g1
	fcmpne16	%f4,	%f0,	%l2
	fxors	%f21,	%f25,	%f1
	ld	[%l7 + 0x60],	%f18
	mulscc	%i5,	%i0,	%l4
	xor	%o0,	%o6,	%i2
	edge16	%g4,	%i6,	%o3
	move	%xcc,	%o5,	%i7
	sdivx	%g7,	0x0FDA,	%l6
	sethi	0x0C7F,	%o4
	xor	%l0,	0x013C,	%i1
	subccc	%o2,	0x0D9A,	%g2
	movg	%xcc,	%o7,	%i3
	fand	%f26,	%f8,	%f8
	movgu	%xcc,	%g3,	%g5
	movrgez	%o1,	%l3,	%l5
	xor	%i4,	%l1,	%g6
	movn	%icc,	%g1,	%l2
	movrlz	%i0,	0x0CB,	%l4
	alignaddr	%i5,	%o0,	%o6
	fmovde	%icc,	%f24,	%f22
	subcc	%i2,	0x02C0,	%i6
	fmul8x16al	%f27,	%f19,	%f8
	save %o3, %o5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f20,	%f16
	fmovdge	%xcc,	%f23,	%f27
	lduh	[%l7 + 0x14],	%g7
	alignaddr	%l6,	%i7,	%l0
	fmovrdlez	%o4,	%f18,	%f6
	xor	%o2,	0x0A79,	%g2
	movne	%icc,	%i1,	%o7
	subc	%i3,	0x0D94,	%g5
	sdivcc	%o1,	0x05F3,	%l3
	movcc	%icc,	%l5,	%i4
	movrgz	%l1,	%g6,	%g3
	movre	%g1,	0x3D0,	%i0
	array32	%l2,	%i5,	%o0
	fcmps	%fcc2,	%f24,	%f0
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	stw	%o6,	[%l7 + 0x48]
	stx	%o5,	[%l7 + 0x78]
	or	%o3,	0x18D7,	%g4
	fnor	%f2,	%f10,	%f12
	udivcc	%l6,	0x0273,	%i7
	movrlez	%g7,	0x39F,	%o4
	std	%f2,	[%l7 + 0x48]
	edge16	%o2,	%l0,	%i1
	xorcc	%o7,	%i3,	%g5
	sth	%o1,	[%l7 + 0x64]
	and	%g2,	0x1785,	%l5
	save %l3, %l1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g3,	[%l7 + 0x20]
	fmovdn	%icc,	%f4,	%f9
	array8	%g1,	%g6,	%l2
	edge32ln	%i0,	%i5,	%o0
	movrgez	%l4,	0x3AE,	%i6
	std	%f14,	[%l7 + 0x10]
	fornot2	%f20,	%f2,	%f24
	fmovdneg	%xcc,	%f24,	%f30
	fzeros	%f31
	andcc	%i2,	%o6,	%o3
	addccc	%o5,	%l6,	%i7
	movleu	%icc,	%g7,	%o4
	subccc	%g4,	%l0,	%o2
	sllx	%i1,	%i3,	%o7
	lduw	[%l7 + 0x2C],	%g5
	mulx	%g2,	%o1,	%l3
	xorcc	%l1,	%i4,	%g3
	sdivx	%g1,	0x0167,	%g6
	movne	%icc,	%l5,	%i0
	ldd	[%l7 + 0x08],	%f16
	udiv	%i5,	0x148E,	%o0
	fmovd	%f30,	%f26
	movge	%xcc,	%l4,	%i6
	umul	%l2,	0x03D2,	%o6
	movrgz	%o3,	%i2,	%l6
	movl	%icc,	%o5,	%i7
	sllx	%g7,	0x1F,	%o4
	fmovrsgz	%l0,	%f24,	%f11
	fmovsg	%xcc,	%f3,	%f30
	movrgz	%o2,	0x1A6,	%g4
	sethi	0x0F3A,	%i3
	movn	%icc,	%o7,	%i1
	stb	%g5,	[%l7 + 0x70]
	edge8l	%o1,	%g2,	%l3
	srl	%i4,	0x08,	%g3
	edge16	%g1,	%g6,	%l1
	alignaddrl	%l5,	%i0,	%i5
	movge	%xcc,	%l4,	%i6
	move	%icc,	%l2,	%o0
	andn	%o6,	%o3,	%l6
	movpos	%xcc,	%o5,	%i7
	mova	%xcc,	%i2,	%o4
	add	%g7,	0x05AA,	%l0
	addcc	%o2,	%i3,	%o7
	std	%f20,	[%l7 + 0x48]
	st	%f1,	[%l7 + 0x74]
	movn	%icc,	%i1,	%g5
	ldd	[%l7 + 0x38],	%o0
	popc	0x180C,	%g4
	fmul8sux16	%f30,	%f22,	%f20
	fcmpd	%fcc1,	%f4,	%f4
	andncc	%g2,	%i4,	%g3
	array16	%g1,	%g6,	%l3
	sub	%l5,	0x11C3,	%l1
	fcmpeq16	%f4,	%f22,	%i5
	orncc	%l4,	%i6,	%l2
	fpmerge	%f25,	%f14,	%f26
	andn	%o0,	0x0ADD,	%i0
	fmovdneg	%xcc,	%f5,	%f7
	sdiv	%o6,	0x049E,	%l6
	movvc	%xcc,	%o5,	%i7
	movvs	%xcc,	%o3,	%i2
	orcc	%o4,	%g7,	%o2
	movle	%icc,	%i3,	%o7
	fand	%f28,	%f22,	%f10
	umulcc	%i1,	%g5,	%o1
	fnands	%f24,	%f26,	%f23
	andncc	%l0,	%g2,	%g4
	fmovdle	%icc,	%f15,	%f16
	movrlz	%i4,	%g1,	%g3
	ldd	[%l7 + 0x40],	%l2
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l5
	movrne	%l1,	%i5,	%g6
	xnorcc	%l4,	0x1931,	%i6
	fnot2	%f24,	%f28
	ldd	[%l7 + 0x18],	%o0
	movrgz	%l2,	0x13B,	%o6
	fpadd32	%f12,	%f16,	%f4
	fpadd16	%f26,	%f12,	%f20
	sra	%i0,	0x03,	%o5
	orcc	%i7,	0x1119,	%o3
	ldd	[%l7 + 0x30],	%i6
	edge8n	%i2,	%o4,	%o2
	lduh	[%l7 + 0x30],	%g7
	array16	%i3,	%i1,	%g5
	srlx	%o7,	%o1,	%l0
	subcc	%g4,	0x16FD,	%g2
	st	%f0,	[%l7 + 0x14]
	movg	%icc,	%g1,	%g3
	ldd	[%l7 + 0x58],	%f8
	fmovsne	%xcc,	%f12,	%f8
	movcs	%xcc,	%i4,	%l3
	addc	%l1,	%l5,	%i5
	movcc	%xcc,	%g6,	%l4
	mulscc	%o0,	%i6,	%l2
	sll	%o6,	0x0F,	%i0
	subccc	%o5,	0x036E,	%o3
	move	%xcc,	%i7,	%l6
	movrgez	%o4,	0x0CC,	%i2
	fones	%f11
	edge16	%g7,	%o2,	%i3
	movre	%g5,	0x047,	%o7
	edge32l	%o1,	%i1,	%l0
	array8	%g2,	%g1,	%g4
	fnand	%f12,	%f18,	%f30
	sllx	%g3,	0x1C,	%l3
	sth	%l1,	[%l7 + 0x1A]
	fsrc2	%f6,	%f6
	stw	%i4,	[%l7 + 0x58]
	edge32l	%l5,	%i5,	%l4
	fcmple16	%f2,	%f22,	%g6
	smul	%o0,	0x1AAF,	%i6
	movle	%xcc,	%o6,	%i0
	mulx	%l2,	0x001D,	%o3
	orcc	%i7,	0x1EBC,	%o5
	alignaddrl	%l6,	%i2,	%g7
	addc	%o4,	0x1073,	%i3
	edge8ln	%o2,	%g5,	%o1
	orn	%o7,	%i1,	%l0
	fmovsge	%icc,	%f17,	%f8
	movcc	%xcc,	%g1,	%g2
	sir	0x1CF8
	mulx	%g4,	0x15F5,	%g3
	movcs	%icc,	%l1,	%l3
	edge32n	%i4,	%l5,	%i5
	movpos	%icc,	%g6,	%o0
	array16	%l4,	%i6,	%o6
	alignaddrl	%i0,	%o3,	%l2
	fpadd32	%f6,	%f10,	%f8
	ldd	[%l7 + 0x58],	%f6
	udiv	%i7,	0x1F78,	%o5
	ldd	[%l7 + 0x70],	%f28
	alignaddr	%i2,	%l6,	%g7
	addccc	%o4,	%o2,	%i3
	ldsw	[%l7 + 0x18],	%g5
	sub	%o7,	%i1,	%l0
	add	%g1,	0x14E0,	%o1
	fcmple32	%f30,	%f18,	%g4
	fmovdcs	%icc,	%f31,	%f1
	fxors	%f13,	%f30,	%f17
	srax	%g2,	%l1,	%g3
	subcc	%l3,	0x104C,	%i4
	move	%xcc,	%l5,	%i5
	fandnot2	%f30,	%f24,	%f8
	andn	%g6,	%o0,	%l4
	addcc	%o6,	0x0A74,	%i0
	subccc	%o3,	0x171C,	%l2
	movgu	%icc,	%i7,	%i6
	edge8n	%i2,	%l6,	%o5
	mova	%xcc,	%o4,	%o2
	addc	%i3,	0x1753,	%g5
	subccc	%o7,	%i1,	%g7
	fmovsn	%xcc,	%f27,	%f13
	edge32ln	%g1,	%o1,	%l0
	udivx	%g2,	0x1BAD,	%g4
	add	%g3,	%l1,	%l3
	siam	0x0
	edge32ln	%l5,	%i5,	%g6
	ldx	[%l7 + 0x20],	%o0
	addccc	%i4,	%o6,	%i0
	ldsw	[%l7 + 0x30],	%o3
	orncc	%l2,	%l4,	%i7
	and	%i2,	0x0967,	%i6
	move	%icc,	%o5,	%o4
	edge16ln	%l6,	%i3,	%g5
	movre	%o7,	%i1,	%o2
	mulx	%g7,	0x19A7,	%o1
	fpadd32	%f6,	%f10,	%f4
	movle	%icc,	%g1,	%l0
	fmovsa	%icc,	%f21,	%f4
	ldx	[%l7 + 0x28],	%g4
	smul	%g3,	%l1,	%g2
	edge8ln	%l5,	%i5,	%l3
	sll	%o0,	%i4,	%o6
	subccc	%i0,	%g6,	%o3
	for	%f22,	%f28,	%f0
	fandnot1	%f22,	%f4,	%f14
	subccc	%l4,	%i7,	%i2
	fmovdl	%xcc,	%f17,	%f27
	xor	%i6,	0x14DA,	%o5
	fmovsgu	%xcc,	%f11,	%f3
	sllx	%l2,	0x0C,	%o4
	fpadd16s	%f27,	%f4,	%f21
	edge8ln	%i3,	%g5,	%o7
	srlx	%i1,	%o2,	%g7
	fcmpgt32	%f16,	%f2,	%o1
	subc	%l6,	%l0,	%g4
	ldx	[%l7 + 0x20],	%g1
	sra	%l1,	0x16,	%g2
	fcmped	%fcc2,	%f12,	%f12
	udivcc	%l5,	0x1846,	%i5
	sth	%g3,	[%l7 + 0x58]
	movpos	%icc,	%o0,	%l3
	or	%i4,	%o6,	%i0
	movcc	%icc,	%o3,	%l4
	ldub	[%l7 + 0x49],	%g6
	fornot2s	%f7,	%f30,	%f31
	xorcc	%i2,	0x1F02,	%i6
	fpsub16s	%f21,	%f2,	%f20
	fsrc1	%f14,	%f2
	edge16ln	%o5,	%l2,	%o4
	save %i7, 0x1C3B, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o7,	0x0C3D,	%g5
	addccc	%i1,	0x1D15,	%g7
	andn	%o2,	0x053D,	%l6
	fmovdge	%xcc,	%f17,	%f0
	andncc	%o1,	%l0,	%g4
	sir	0x0124
	xnorcc	%g1,	0x1357,	%l1
	fpadd16	%f26,	%f0,	%f4
	smul	%g2,	0x1E1D,	%i5
	nop
	set	0x68, %g5
	std	%f14,	[%l7 + %g5]
	fmul8x16	%f19,	%f24,	%f12
	mova	%icc,	%g3,	%l5
	movrgz	%o0,	%l3,	%i4
	orncc	%i0,	0x029D,	%o3
	sra	%l4,	%g6,	%i2
	move	%xcc,	%o6,	%o5
	fnot1s	%f28,	%f27
	mulscc	%l2,	%i6,	%i7
	ldsw	[%l7 + 0x6C],	%i3
	fmovdneg	%icc,	%f11,	%f10
	fcmpgt32	%f2,	%f8,	%o4
	fmul8sux16	%f30,	%f10,	%f26
	fmovsl	%xcc,	%f21,	%f10
	orncc	%g5,	%o7,	%g7
	fpackfix	%f24,	%f2
	stx	%o2,	[%l7 + 0x38]
	edge16ln	%i1,	%o1,	%l0
	sdivx	%g4,	0x0216,	%g1
	add	%l1,	%l6,	%g2
	orn	%g3,	0x0945,	%i5
	movcc	%xcc,	%o0,	%l3
	ldsb	[%l7 + 0x53],	%l5
	popc	%i4,	%o3
	addc	%i0,	%g6,	%l4
	array8	%i2,	%o5,	%l2
	movrgez	%o6,	%i6,	%i3
	sllx	%o4,	%g5,	%i7
	move	%xcc,	%o7,	%g7
	movpos	%xcc,	%o2,	%o1
	restore %l0, %g4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i1,	0x135E,	%l1
	fnot1s	%f0,	%f29
	xnor	%l6,	%g2,	%i5
	sir	0x1A61
	mulx	%o0,	%l3,	%g3
	fmovsn	%icc,	%f17,	%f24
	sdiv	%l5,	0x0202,	%o3
	fornot1	%f0,	%f14,	%f28
	alignaddr	%i4,	%i0,	%g6
	edge8n	%l4,	%i2,	%o5
	fmovsvs	%icc,	%f23,	%f18
	fcmple16	%f24,	%f26,	%l2
	movrgz	%i6,	0x31F,	%i3
	fcmped	%fcc3,	%f20,	%f22
	stb	%o6,	[%l7 + 0x43]
	st	%f13,	[%l7 + 0x28]
	array16	%o4,	%i7,	%g5
	std	%f30,	[%l7 + 0x10]
	xnor	%o7,	%g7,	%o2
	nop
	set	0x78, %l3
	stx	%l0,	[%l7 + %l3]
	edge32	%o1,	%g1,	%i1
	fpmerge	%f27,	%f9,	%f6
	subccc	%g4,	0x17D9,	%l6
	add	%l1,	%i5,	%o0
	xnor	%g2,	0x0589,	%g3
	fsrc1	%f8,	%f8
	save %l3, %l5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i0,	0x10B9,	%o3
	sethi	0x0D9C,	%l4
	sub	%i2,	%o5,	%g6
	fzero	%f14
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	st	%f31,	[%l7 + 0x3C]
	movrgez	%o6,	0x3C3,	%i3
	ldd	[%l7 + 0x10],	%f12
	fpack16	%f8,	%f5
	fmul8sux16	%f14,	%f28,	%f14
	lduw	[%l7 + 0x74],	%o4
	fcmps	%fcc2,	%f19,	%f24
	fmovsa	%icc,	%f22,	%f21
	srl	%i7,	0x12,	%g5
	orn	%g7,	0x0BF0,	%o7
	save %o2, 0x0217, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l0,	%i1,	%g1
	fmul8x16au	%f29,	%f26,	%f18
	xorcc	%g4,	%l1,	%l6
	movrne	%o0,	0x1CE,	%g2
	popc	%i5,	%g3
	fands	%f21,	%f16,	%f12
	fsrc1s	%f25,	%f23
	array16	%l5,	%i4,	%l3
	umul	%o3,	%l4,	%i0
	and	%i2,	%o5,	%l2
	bshuffle	%f22,	%f8,	%f16
	edge8l	%i6,	%g6,	%o6
	movre	%i3,	%i7,	%g5
	umulcc	%g7,	%o4,	%o7
	edge32ln	%o2,	%l0,	%i1
	movl	%icc,	%o1,	%g4
	movge	%icc,	%l1,	%l6
	movvs	%icc,	%g1,	%g2
	stx	%i5,	[%l7 + 0x28]
	sdiv	%o0,	0x0F27,	%l5
	array8	%i4,	%g3,	%o3
	smul	%l3,	0x0ABC,	%l4
	movleu	%icc,	%i2,	%o5
	edge32n	%i0,	%l2,	%g6
	fcmpne32	%f22,	%f24,	%o6
	sth	%i6,	[%l7 + 0x34]
	edge8l	%i3,	%i7,	%g5
	fabsd	%f2,	%f22
	stw	%o4,	[%l7 + 0x2C]
	edge32n	%o7,	%g7,	%l0
	nop
	set	0x3C, %l1
	stw	%i1,	[%l7 + %l1]
	movrne	%o2,	0x054,	%o1
	restore %l1, %g4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g1,	0x1D6E,	%i5
	fmovdleu	%icc,	%f6,	%f16
	sdivcc	%g2,	0x036D,	%l5
	movn	%xcc,	%o0,	%g3
	array16	%o3,	%l3,	%i4
	fcmps	%fcc0,	%f23,	%f31
	stw	%i2,	[%l7 + 0x44]
	ldsb	[%l7 + 0x33],	%o5
	or	%l4,	%l2,	%i0
	srl	%o6,	0x01,	%g6
	edge16n	%i6,	%i7,	%g5
	xnorcc	%i3,	0x0A87,	%o4
	fmovrslz	%g7,	%f10,	%f6
	edge16	%l0,	%i1,	%o7
	andn	%o2,	%o1,	%g4
	alignaddrl	%l1,	%g1,	%l6
	popc	%g2,	%i5
	and	%l5,	%g3,	%o0
	fmovscc	%icc,	%f0,	%f3
	fmul8ulx16	%f18,	%f4,	%f2
	udivcc	%l3,	0x1447,	%i4
	std	%f6,	[%l7 + 0x58]
	ld	[%l7 + 0x2C],	%f19
	orncc	%o3,	0x0574,	%i2
	mova	%xcc,	%l4,	%l2
	edge32	%i0,	%o5,	%o6
	movge	%xcc,	%g6,	%i6
	movn	%icc,	%g5,	%i3
	save %o4, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i1,	%l0,	%o7
	xnor	%o1,	0x0555,	%g4
	edge8n	%l1,	%o2,	%l6
	xor	%g2,	0x0BD2,	%g1
	fcmpd	%fcc1,	%f0,	%f24
	udivx	%i5,	0x01E7,	%g3
	lduh	[%l7 + 0x44],	%o0
	subc	%l5,	0x11AD,	%l3
	fmovdvs	%xcc,	%f1,	%f26
	ldsh	[%l7 + 0x7C],	%o3
	edge16l	%i2,	%l4,	%i4
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	edge8n	%o6,	%g6,	%i6
	fandnot2s	%f13,	%f8,	%f19
	fpack32	%f26,	%f28,	%f18
	movrne	%i3,	%o4,	%g5
	edge32n	%g7,	%i7,	%l0
	movl	%icc,	%o7,	%i1
	edge8	%o1,	%g4,	%o2
	ldd	[%l7 + 0x18],	%f16
	xor	%l6,	%l1,	%g2
	edge16l	%g1,	%i5,	%o0
	movn	%xcc,	%g3,	%l5
	movge	%icc,	%l3,	%i2
	save %o3, %i4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i0,	%l2,	%o6
	restore %o5, %i6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o4,	0x386,	%g5
	fmul8x16au	%f9,	%f13,	%f2
	pdist	%f4,	%f8,	%f18
	andcc	%g6,	%i7,	%l0
	ld	[%l7 + 0x5C],	%f22
	srl	%g7,	0x05,	%i1
	movl	%xcc,	%o7,	%g4
	fcmpd	%fcc1,	%f0,	%f24
	movpos	%icc,	%o2,	%l6
	ldd	[%l7 + 0x50],	%o0
	fsrc1s	%f21,	%f19
	fxnor	%f22,	%f28,	%f28
	ldsb	[%l7 + 0x19],	%l1
	fmovrdlez	%g1,	%f20,	%f14
	xnor	%g2,	0x00B0,	%i5
	ldd	[%l7 + 0x40],	%o0
	edge16n	%g3,	%l5,	%l3
	smulcc	%i2,	%o3,	%l4
	movleu	%icc,	%i4,	%i0
	movgu	%xcc,	%l2,	%o6
	smulcc	%i6,	%o5,	%o4
	edge8ln	%g5,	%i3,	%i7
	edge32	%g6,	%g7,	%i1
	ld	[%l7 + 0x58],	%f16
	or	%o7,	0x072C,	%g4
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	srax	%l6,	0x18,	%l1
	edge32	%g1,	%o1,	%i5
	xorcc	%g2,	0x1BA1,	%o0
	add	%l5,	0x0906,	%l3
	move	%icc,	%g3,	%i2
	array32	%l4,	%o3,	%i4
	edge32n	%l2,	%o6,	%i6
	fpmerge	%f17,	%f28,	%f16
	fmovrsgez	%o5,	%f0,	%f25
	mulx	%i0,	%o4,	%g5
	edge16n	%i3,	%g6,	%i7
	umulcc	%i1,	%o7,	%g4
	umul	%g7,	0x0998,	%o2
	siam	0x0
	movvs	%icc,	%l0,	%l1
	ldsb	[%l7 + 0x35],	%g1
	addc	%l6,	0x03F6,	%i5
	alignaddr	%g2,	%o1,	%l5
	movneg	%icc,	%l3,	%g3
	fsrc1	%f24,	%f22
	fmovrsgz	%o0,	%f11,	%f28
	ldsw	[%l7 + 0x50],	%l4
	ldx	[%l7 + 0x30],	%i2
	fmovsneg	%icc,	%f13,	%f5
	stw	%o3,	[%l7 + 0x18]
	fmovrdne	%i4,	%f22,	%f18
	sethi	0x126F,	%l2
	st	%f5,	[%l7 + 0x60]
	movre	%o6,	%o5,	%i6
	fmovrdlz	%o4,	%f6,	%f6
	fmovsvs	%xcc,	%f17,	%f23
	ldx	[%l7 + 0x10],	%i0
	ld	[%l7 + 0x58],	%f19
	fmovrdlez	%g5,	%f24,	%f6
	smulcc	%i3,	0x0CF2,	%g6
	movn	%icc,	%i1,	%o7
	fmovdgu	%xcc,	%f24,	%f10
	fmovsvc	%icc,	%f4,	%f8
	edge32l	%g4,	%g7,	%i7
	edge16ln	%o2,	%l1,	%l0
	fmovsneg	%xcc,	%f7,	%f7
	lduw	[%l7 + 0x1C],	%g1
	array16	%l6,	%g2,	%i5
	fmovrslz	%l5,	%f12,	%f12
	fnot2s	%f7,	%f6
	fcmpd	%fcc3,	%f16,	%f6
	fpsub32s	%f9,	%f23,	%f28
	edge8ln	%o1,	%g3,	%l3
	edge8	%o0,	%l4,	%i2
	movgu	%icc,	%o3,	%l2
	orcc	%o6,	%o5,	%i4
	sdivx	%o4,	0x056F,	%i6
	stb	%i0,	[%l7 + 0x36]
	orcc	%i3,	%g6,	%i1
	udivx	%o7,	0x1F04,	%g5
	alignaddr	%g7,	%g4,	%o2
	alignaddrl	%i7,	%l0,	%l1
	fmovsl	%icc,	%f0,	%f18
	addccc	%l6,	0x1B0B,	%g2
	nop
	set	0x20, %o4
	std	%f8,	[%l7 + %o4]
	sethi	0x1FC3,	%g1
	fmul8x16au	%f3,	%f5,	%f12
	fzero	%f20
	fmovsg	%xcc,	%f6,	%f11
	ldsw	[%l7 + 0x28],	%i5
	fnot2	%f8,	%f10
	faligndata	%f14,	%f8,	%f6
	movvc	%xcc,	%o1,	%g3
	array16	%l5,	%l3,	%l4
	smulcc	%o0,	0x1FF6,	%i2
	movle	%icc,	%o3,	%o6
	st	%f31,	[%l7 + 0x3C]
	subc	%l2,	0x120A,	%o5
	xorcc	%o4,	0x1680,	%i6
	fmovsneg	%xcc,	%f9,	%f7
	fmovrde	%i4,	%f12,	%f14
	fpsub16s	%f10,	%f17,	%f25
	umulcc	%i3,	0x1E76,	%g6
	fpack32	%f26,	%f20,	%f18
	fabsd	%f10,	%f8
	fpsub32	%f6,	%f0,	%f30
	edge32ln	%i1,	%i0,	%g5
	fxors	%f27,	%f19,	%f25
	andcc	%o7,	0x07E3,	%g7
	fpackfix	%f14,	%f20
	movn	%icc,	%o2,	%g4
	udiv	%i7,	0x0F8E,	%l0
	fpadd16	%f4,	%f4,	%f2
	movrgez	%l6,	0x16F,	%g2
	alignaddr	%l1,	%g1,	%o1
	edge16	%i5,	%g3,	%l3
	sllx	%l4,	%l5,	%o0
	fmovdge	%icc,	%f9,	%f21
	fpadd32s	%f29,	%f0,	%f22
	std	%f28,	[%l7 + 0x40]
	sll	%i2,	0x11,	%o6
	fxnors	%f22,	%f15,	%f5
	movneg	%xcc,	%l2,	%o3
	std	%f28,	[%l7 + 0x38]
	and	%o5,	%i6,	%i4
	fmovsg	%icc,	%f10,	%f14
	andn	%i3,	0x0C90,	%o4
	edge8ln	%i1,	%i0,	%g6
	sethi	0x0884,	%g5
	add	%o7,	0x039C,	%o2
	nop
	set	0x6E, %i1
	ldub	[%l7 + %i1],	%g4
	edge16ln	%g7,	%i7,	%l6
	fcmpne16	%f12,	%f4,	%g2
	fnot1s	%f26,	%f18
	fmul8x16	%f14,	%f22,	%f24
	sth	%l0,	[%l7 + 0x74]
	fabsd	%f6,	%f30
	popc	%g1,	%l1
	edge32ln	%i5,	%g3,	%l3
	stx	%l4,	[%l7 + 0x38]
	lduw	[%l7 + 0x3C],	%l5
	orcc	%o1,	%i2,	%o6
	addc	%o0,	%l2,	%o5
	st	%f20,	[%l7 + 0x5C]
	udivcc	%o3,	0x1CEF,	%i6
	addc	%i4,	%i3,	%o4
	orn	%i0,	%g6,	%g5
	restore %o7, %o2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g4,	%g7,	%i7
	fmovsne	%xcc,	%f16,	%f16
	fmuld8sux16	%f25,	%f31,	%f18
	fmovdpos	%icc,	%f21,	%f0
	movn	%icc,	%l6,	%g2
	smulcc	%g1,	0x01D2,	%l0
	udiv	%i5,	0x1289,	%l1
	udivx	%l3,	0x0A44,	%l4
	movge	%xcc,	%g3,	%l5
	srlx	%i2,	%o6,	%o1
	edge8l	%l2,	%o5,	%o0
	smulcc	%i6,	%o3,	%i4
	fzero	%f30
	lduw	[%l7 + 0x58],	%o4
	movg	%icc,	%i0,	%g6
	fmovscc	%icc,	%f23,	%f21
	srax	%i3,	%g5,	%o7
	orn	%i1,	0x00F6,	%g4
	fpadd32	%f24,	%f24,	%f2
	srlx	%o2,	%g7,	%l6
	sdivcc	%g2,	0x11DF,	%i7
	fmovrse	%g1,	%f26,	%f17
	ld	[%l7 + 0x28],	%f7
	ld	[%l7 + 0x40],	%f14
	fmovdne	%icc,	%f2,	%f20
	fcmpeq16	%f4,	%f28,	%i5
	udiv	%l0,	0x088E,	%l3
	fmovsge	%xcc,	%f31,	%f27
	srax	%l1,	%l4,	%g3
	and	%l5,	0x1237,	%i2
	sth	%o1,	[%l7 + 0x3C]
	movrlez	%o6,	%o5,	%l2
	sll	%o0,	%o3,	%i4
	sir	0x128F
	popc	0x1E21,	%o4
	ldsh	[%l7 + 0x6A],	%i6
	nop
	set	0x7A, %i7
	sth	%g6,	[%l7 + %i7]
	add	%i0,	0x1A3A,	%i3
	stb	%g5,	[%l7 + 0x2C]
	fexpand	%f21,	%f12
	edge32	%i1,	%g4,	%o7
	fmovdgu	%icc,	%f11,	%f4
	array16	%o2,	%g7,	%g2
	xnor	%i7,	%g1,	%i5
	movleu	%icc,	%l6,	%l3
	fmovdcs	%icc,	%f20,	%f24
	umul	%l0,	%l1,	%g3
	sethi	0x1E9B,	%l4
	and	%i2,	%l5,	%o6
	umul	%o1,	%o5,	%l2
	mova	%icc,	%o3,	%i4
	xnor	%o0,	%i6,	%g6
	movcc	%xcc,	%i0,	%o4
	fmovsn	%xcc,	%f9,	%f11
	fmovsgu	%icc,	%f25,	%f27
	xorcc	%g5,	0x036D,	%i3
	edge16	%i1,	%g4,	%o2
	fone	%f18
	edge32	%g7,	%g2,	%i7
	alignaddrl	%o7,	%g1,	%l6
	ldsh	[%l7 + 0x24],	%l3
	fxnors	%f28,	%f9,	%f30
	sllx	%i5,	%l1,	%l0
	alignaddrl	%g3,	%l4,	%l5
	fpsub16s	%f25,	%f24,	%f20
	movcc	%icc,	%i2,	%o1
	edge16n	%o5,	%o6,	%o3
	udiv	%i4,	0x07C7,	%l2
	edge32n	%i6,	%o0,	%i0
	udivcc	%g6,	0x0EB3,	%o4
	alignaddrl	%i3,	%g5,	%g4
	fnot2	%f30,	%f8
	alignaddr	%i1,	%g7,	%g2
	andcc	%o2,	%o7,	%i7
	fmovdl	%icc,	%f9,	%f2
	fmovsle	%xcc,	%f10,	%f4
	andcc	%g1,	%l3,	%l6
	movrlez	%i5,	%l1,	%g3
	andcc	%l4,	0x181B,	%l5
	popc	0x0017,	%i2
	edge16l	%o1,	%l0,	%o5
	movre	%o3,	%i4,	%l2
	sub	%i6,	%o0,	%o6
	fmovdge	%xcc,	%f30,	%f17
	edge32	%i0,	%o4,	%i3
	udivx	%g5,	0x15E2,	%g6
	fcmped	%fcc3,	%f28,	%f8
	lduw	[%l7 + 0x3C],	%i1
	ldsb	[%l7 + 0x7E],	%g4
	fmovrse	%g2,	%f20,	%f28
	edge8ln	%o2,	%g7,	%o7
	smul	%g1,	%i7,	%l6
	fpsub16	%f12,	%f18,	%f18
	st	%f27,	[%l7 + 0x38]
	fmovdle	%icc,	%f9,	%f2
	ldsb	[%l7 + 0x08],	%i5
	array32	%l3,	%g3,	%l4
	nop
	set	0x6C, %l0
	stw	%l5,	[%l7 + %l0]
	movcc	%xcc,	%l1,	%o1
	sra	%l0,	%i2,	%o3
	orcc	%i4,	0x0CF5,	%o5
	umul	%i6,	%o0,	%o6
	andcc	%i0,	0x0DEF,	%o4
	fsrc2	%f22,	%f0
	srax	%l2,	0x11,	%g5
	addccc	%g6,	0x1F64,	%i3
	ldub	[%l7 + 0x59],	%g4
	movcs	%xcc,	%g2,	%i1
	umul	%o2,	0x1C15,	%g7
	array32	%g1,	%o7,	%l6
	popc	%i7,	%l3
	fcmpes	%fcc0,	%f9,	%f14
	fmovsge	%icc,	%f17,	%f15
	movg	%xcc,	%i5,	%l4
	edge32	%l5,	%l1,	%o1
	movrlez	%l0,	%i2,	%g3
	fpsub32s	%f12,	%f30,	%f28
	fmovsgu	%icc,	%f31,	%f16
	movg	%xcc,	%i4,	%o5
	movleu	%xcc,	%o3,	%o0
	ldsb	[%l7 + 0x20],	%o6
	fmovsne	%icc,	%f22,	%f7
	add	%i0,	0x1954,	%o4
	movne	%icc,	%l2,	%g5
	fmovdl	%icc,	%f18,	%f31
	sdiv	%g6,	0x1986,	%i3
	edge32ln	%i6,	%g4,	%i1
	xorcc	%o2,	0x13B7,	%g2
	ldsh	[%l7 + 0x14],	%g7
	andn	%g1,	0x05C5,	%o7
	or	%l6,	0x14AE,	%i7
	ldd	[%l7 + 0x18],	%f30
	ld	[%l7 + 0x78],	%f12
	lduw	[%l7 + 0x2C],	%l3
	smul	%l4,	%l5,	%l1
	umulcc	%i5,	%o1,	%i2
	fnors	%f2,	%f22,	%f21
	stw	%g3,	[%l7 + 0x58]
	nop
	set	0x3B, %o5
	stb	%l0,	[%l7 + %o5]
	fmovrdgez	%i4,	%f4,	%f6
	fsrc2	%f22,	%f30
	edge16n	%o3,	%o5,	%o0
	srlx	%i0,	0x16,	%o6
	ldx	[%l7 + 0x20],	%o4
	ldsw	[%l7 + 0x6C],	%g5
	edge16ln	%g6,	%i3,	%l2
	fpadd32	%f0,	%f14,	%f8
	movn	%xcc,	%i6,	%g4
	fnands	%f9,	%f12,	%f22
	save %i1, 0x0B89, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o2,	%g7,	%o7
	nop
	set	0x6C, %o3
	lduw	[%l7 + %o3],	%g1
	stx	%l6,	[%l7 + 0x58]
	addc	%l3,	%l4,	%i7
	fmovsleu	%xcc,	%f6,	%f18
	edge8	%l5,	%i5,	%o1
	fcmpgt32	%f20,	%f22,	%i2
	std	%f28,	[%l7 + 0x78]
	lduw	[%l7 + 0x74],	%g3
	addc	%l1,	%i4,	%l0
	ldd	[%l7 + 0x10],	%o2
	add	%o0,	%o5,	%i0
	movl	%xcc,	%o6,	%g5
	movrlez	%g6,	0x021,	%i3
	fmovdvs	%xcc,	%f7,	%f4
	popc	0x1E02,	%o4
	array32	%l2,	%i6,	%g4
	sdivcc	%g2,	0x1C04,	%i1
	bshuffle	%f4,	%f28,	%f10
	movcc	%xcc,	%g7,	%o7
	movrlez	%o2,	0x3CF,	%g1
	fmul8sux16	%f14,	%f10,	%f20
	orcc	%l3,	0x0B98,	%l4
	mova	%icc,	%l6,	%i7
	fzero	%f26
	fmovsneg	%icc,	%f24,	%f30
	movg	%icc,	%l5,	%i5
	fmovrdlez	%i2,	%f22,	%f22
	sir	0x0B57
	orcc	%g3,	%o1,	%l1
	add	%l0,	0x0B3E,	%o3
	array16	%o0,	%o5,	%i4
	edge8n	%i0,	%g5,	%g6
	movleu	%icc,	%i3,	%o4
	fmuld8sux16	%f0,	%f15,	%f14
	movle	%icc,	%o6,	%l2
	ldub	[%l7 + 0x48],	%g4
	array8	%i6,	%i1,	%g2
	move	%icc,	%g7,	%o7
	fpack16	%f12,	%f15
	movge	%xcc,	%g1,	%l3
	sth	%l4,	[%l7 + 0x6A]
	fmovde	%icc,	%f27,	%f0
	ldx	[%l7 + 0x48],	%o2
	movrlez	%l6,	0x3CA,	%l5
	fmovdge	%xcc,	%f25,	%f17
	edge32ln	%i5,	%i2,	%g3
	lduw	[%l7 + 0x78],	%o1
	movne	%xcc,	%i7,	%l0
	fmovscs	%icc,	%f5,	%f25
	addccc	%l1,	0x0EFA,	%o3
	xnor	%o5,	%i4,	%i0
	andcc	%o0,	%g5,	%i3
	orncc	%g6,	%o6,	%l2
	add	%o4,	0x1D31,	%i6
	or	%g4,	%i1,	%g2
	movne	%xcc,	%o7,	%g7
	addcc	%l3,	0x1681,	%l4
	popc	%g1,	%l6
	udivcc	%l5,	0x1AA6,	%i5
	fpadd32	%f12,	%f8,	%f4
	movcc	%xcc,	%o2,	%i2
	movgu	%xcc,	%o1,	%i7
	andncc	%l0,	%g3,	%o3
	edge16n	%o5,	%l1,	%i0
	subcc	%i4,	0x0AFF,	%o0
	ldx	[%l7 + 0x30],	%i3
	fpack16	%f26,	%f6
	sdivcc	%g6,	0x05B0,	%o6
	movn	%xcc,	%g5,	%o4
	movl	%xcc,	%i6,	%l2
	lduw	[%l7 + 0x54],	%g4
	umul	%g2,	0x0D31,	%i1
	array32	%g7,	%l3,	%l4
	faligndata	%f4,	%f6,	%f2
	fxnor	%f2,	%f28,	%f0
	fmovsn	%icc,	%f11,	%f31
	movle	%xcc,	%g1,	%o7
	edge8ln	%l5,	%i5,	%o2
	lduh	[%l7 + 0x5C],	%l6
	edge16n	%i2,	%i7,	%l0
	edge32	%o1,	%o3,	%g3
	movne	%xcc,	%o5,	%i0
	subccc	%l1,	%o0,	%i4
	addccc	%i3,	%g6,	%g5
	srlx	%o6,	%i6,	%l2
	movg	%icc,	%g4,	%o4
	fmovrde	%i1,	%f18,	%f22
	ldsb	[%l7 + 0x63],	%g2
	umul	%l3,	%g7,	%g1
	movrgz	%l4,	0x2BD,	%l5
	fmovdneg	%xcc,	%f10,	%f3
	andcc	%o7,	%i5,	%o2
	fmovdcc	%xcc,	%f7,	%f9
	edge8n	%i2,	%l6,	%l0
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	fand	%f24,	%f4,	%f26
	sra	%o5,	%g3,	%i0
	or	%o0,	0x0934,	%l1
	or	%i4,	0x1DF1,	%i3
	fmovdne	%icc,	%f6,	%f20
	ldx	[%l7 + 0x28],	%g5
	sethi	0x1299,	%o6
	edge8ln	%g6,	%l2,	%g4
	edge8l	%o4,	%i6,	%g2
	udiv	%i1,	0x0DB4,	%l3
	sllx	%g1,	%l4,	%l5
	xorcc	%o7,	0x160E,	%i5
	fors	%f7,	%f29,	%f21
	alignaddr	%g7,	%o2,	%l6
	ldsb	[%l7 + 0x31],	%l0
	fcmpne32	%f8,	%f22,	%o1
	fcmpne16	%f26,	%f4,	%i2
	udivcc	%i7,	0x09EC,	%o5
	fmul8x16	%f23,	%f14,	%f16
	movvs	%icc,	%g3,	%i0
	st	%f9,	[%l7 + 0x44]
	sethi	0x0C43,	%o0
	movcc	%icc,	%o3,	%l1
	fmovrdgz	%i3,	%f12,	%f10
	mulx	%i4,	%g5,	%o6
	fmovd	%f12,	%f12
	sub	%g6,	%l2,	%g4
	movle	%xcc,	%o4,	%i6
	addcc	%i1,	0x18C1,	%g2
	sdivcc	%l3,	0x0935,	%g1
	array16	%l4,	%o7,	%l5
	edge8ln	%i5,	%o2,	%l6
	addc	%g7,	0x1BA4,	%l0
	fmovdleu	%xcc,	%f2,	%f3
	srax	%o1,	0x04,	%i7
	fmovrslez	%i2,	%f25,	%f21
	edge16ln	%g3,	%o5,	%i0
	stw	%o3,	[%l7 + 0x54]
	xnorcc	%o0,	0x08AA,	%i3
	move	%icc,	%l1,	%i4
	edge16	%o6,	%g5,	%g6
	movrgz	%l2,	%g4,	%o4
	fpsub16s	%f22,	%f9,	%f18
	fmovrdgez	%i1,	%f26,	%f12
	fpadd16s	%f18,	%f0,	%f18
	alignaddr	%i6,	%g2,	%g1
	orn	%l4,	0x1A3D,	%o7
	ldsw	[%l7 + 0x14],	%l3
	array8	%l5,	%i5,	%o2
	movg	%xcc,	%l6,	%l0
	fnors	%f20,	%f12,	%f8
	sth	%o1,	[%l7 + 0x2A]
	orn	%i7,	0x1124,	%i2
	mova	%icc,	%g7,	%g3
	movvc	%xcc,	%i0,	%o3
	edge8	%o5,	%o0,	%i3
	fnegd	%f4,	%f20
	add	%i4,	%o6,	%l1
	orcc	%g6,	0x0A31,	%l2
	sth	%g4,	[%l7 + 0x20]
	mulx	%o4,	0x0935,	%i1
	umul	%g5,	0x14BF,	%g2
	ldsb	[%l7 + 0x32],	%i6
	ldd	[%l7 + 0x08],	%f6
	movvc	%icc,	%g1,	%l4
	movl	%xcc,	%l3,	%l5
	fnors	%f24,	%f5,	%f16
	movcs	%icc,	%o7,	%i5
	fmovrde	%l6,	%f22,	%f30
	fmuld8sux16	%f2,	%f22,	%f22
	srax	%o2,	0x14,	%o1
	edge32ln	%l0,	%i7,	%i2
	alignaddrl	%g7,	%i0,	%o3
	ldsh	[%l7 + 0x7E],	%o5
	addc	%o0,	0x04DF,	%i3
	udiv	%g3,	0x0262,	%i4
	stw	%l1,	[%l7 + 0x78]
	fones	%f31
	alignaddrl	%g6,	%l2,	%o6
	edge8ln	%o4,	%i1,	%g5
	movcs	%icc,	%g4,	%i6
	umul	%g1,	0x1581,	%l4
	addccc	%l3,	%g2,	%o7
	fmovsl	%icc,	%f0,	%f24
	fzero	%f18
	movle	%icc,	%i5,	%l5
	mova	%icc,	%o2,	%o1
	movle	%icc,	%l0,	%i7
	ldd	[%l7 + 0x70],	%i6
	ldub	[%l7 + 0x71],	%i2
	stb	%i0,	[%l7 + 0x33]
	restore %o3, %g7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x70],	%o0
	sub	%i3,	0x0DB6,	%g3
	fcmpd	%fcc0,	%f8,	%f8
	fandnot2s	%f30,	%f27,	%f11
	movvc	%icc,	%i4,	%l1
	st	%f18,	[%l7 + 0x6C]
	subcc	%l2,	0x1014,	%g6
	srax	%o4,	0x01,	%o6
	lduw	[%l7 + 0x60],	%g5
	edge32	%g4,	%i1,	%i6
	alignaddr	%g1,	%l3,	%l4
	pdist	%f26,	%f18,	%f28
	sra	%g2,	0x15,	%o7
	edge32	%i5,	%l5,	%o2
	save %o1, 0x0661, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l0,	%l6,	%i0
	ldd	[%l7 + 0x30],	%i2
	addc	%g7,	0x123B,	%o5
	sdivcc	%o0,	0x118C,	%i3
	nop
	set	0x50, %i4
	lduh	[%l7 + %i4],	%g3
	sub	%o3,	%l1,	%i4
	ldx	[%l7 + 0x18],	%g6
	edge16n	%o4,	%l2,	%o6
	fmovspos	%icc,	%f17,	%f26
	nop
	set	0x22, %l2
	lduh	[%l7 + %l2],	%g4
	fmovdge	%xcc,	%f5,	%f8
	movleu	%icc,	%i1,	%g5
	sllx	%g1,	%l3,	%i6
	fcmpes	%fcc1,	%f24,	%f20
	fands	%f21,	%f10,	%f18
	movgu	%xcc,	%l4,	%g2
	fcmple16	%f12,	%f6,	%o7
	movleu	%xcc,	%i5,	%l5
	sub	%o1,	%i7,	%l0
	fnot2s	%f20,	%f20
	movrne	%l6,	%i0,	%i2
	move	%xcc,	%o2,	%g7
	edge16	%o5,	%i3,	%g3
	movvs	%icc,	%o3,	%l1
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	fandnot2	%f30,	%f20,	%f18
	srl	%l2,	0x05,	%o4
	restore %o6, 0x1FFB, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%g5
	udivx	%g1,	0x0BC7,	%l3
	fmovdcs	%xcc,	%f28,	%f18
	edge32ln	%i6,	%l4,	%o7
	orncc	%g2,	0x0A2E,	%i5
	mova	%xcc,	%o1,	%l5
	fpadd32	%f16,	%f14,	%f8
	edge8	%l0,	%i7,	%l6
	edge8n	%i0,	%i2,	%g7
	siam	0x6
	fmovsn	%icc,	%f16,	%f12
	move	%icc,	%o5,	%i3
	edge8ln	%g3,	%o3,	%o2
	sethi	0x0368,	%i4
	fornot2s	%f30,	%f11,	%f19
	mova	%xcc,	%g6,	%l1
	movcc	%icc,	%o0,	%l2
	stw	%o4,	[%l7 + 0x28]
	add	%g4,	0x17DE,	%o6
	fpsub16s	%f7,	%f5,	%f11
	movrne	%i1,	0x2A0,	%g1
	edge8n	%g5,	%l3,	%i6
	movrlez	%o7,	%l4,	%i5
	ldub	[%l7 + 0x5A],	%o1
	andn	%g2,	0x1B27,	%l5
	movg	%icc,	%l0,	%i7
	sir	0x1132
	fmovrsne	%i0,	%f14,	%f11
	std	%f6,	[%l7 + 0x58]
	movcs	%icc,	%l6,	%g7
	movrne	%i2,	0x28A,	%o5
	sdivx	%g3,	0x11EC,	%i3
	srax	%o3,	0x1B,	%o2
	fmovdgu	%icc,	%f10,	%f10
	stb	%i4,	[%l7 + 0x4A]
	fmovdcs	%xcc,	%f23,	%f0
	edge8n	%l1,	%o0,	%g6
	mulx	%o4,	%g4,	%l2
	andcc	%i1,	%g1,	%g5
	andcc	%l3,	0x034E,	%i6
	or	%o6,	%o7,	%i5
	xnorcc	%l4,	%g2,	%o1
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f4
	movl	%icc,	%l0,	%l5
	orcc	%i0,	%i7,	%g7
	subccc	%i2,	0x0C49,	%l6
	fcmpeq32	%f26,	%f4,	%o5
	sdiv	%g3,	0x18B3,	%o3
	xorcc	%i3,	%o2,	%i4
	edge8ln	%l1,	%g6,	%o4
	ld	[%l7 + 0x7C],	%f15
	orncc	%g4,	0x1402,	%o0
	addc	%l2,	%g1,	%i1
	umul	%l3,	%g5,	%i6
	fcmpeq32	%f2,	%f4,	%o7
	st	%f9,	[%l7 + 0x14]
	fmul8x16au	%f29,	%f31,	%f18
	xnor	%i5,	%o6,	%l4
	udivcc	%g2,	0x18A9,	%l0
	edge32l	%l5,	%i0,	%o1
	fone	%f28
	fmovsgu	%icc,	%f3,	%f26
	fpsub16s	%f11,	%f15,	%f23
	fmovde	%icc,	%f14,	%f27
	ldub	[%l7 + 0x57],	%i7
	orncc	%i2,	0x1022,	%l6
	movne	%icc,	%o5,	%g7
	fmovsl	%xcc,	%f10,	%f20
	edge16l	%g3,	%i3,	%o2
	smul	%i4,	%l1,	%o3
	smulcc	%o4,	%g6,	%o0
	lduw	[%l7 + 0x4C],	%g4
	edge32l	%g1,	%l2,	%i1
	orncc	%l3,	%g5,	%o7
	udivcc	%i6,	0x1AE2,	%i5
	stx	%l4,	[%l7 + 0x78]
	movne	%icc,	%g2,	%l0
	sir	0x0E9B
	addcc	%o6,	0x133E,	%i0
	move	%xcc,	%o1,	%l5
	srl	%i2,	%l6,	%i7
	subc	%o5,	%g7,	%g3
	fmovsvs	%icc,	%f3,	%f13
	fcmps	%fcc3,	%f30,	%f30
	xorcc	%i3,	0x142E,	%i4
	udivcc	%o2,	0x1562,	%l1
	movg	%xcc,	%o4,	%o3
	addc	%g6,	%g4,	%g1
	movcc	%xcc,	%o0,	%l2
	movcs	%xcc,	%i1,	%g5
	xnorcc	%l3,	%o7,	%i6
	movcs	%xcc,	%i5,	%g2
	edge8n	%l0,	%l4,	%o6
	movvc	%icc,	%o1,	%i0
	nop
	set	0x42, %g3
	lduh	[%l7 + %g3],	%i2
	or	%l6,	%l5,	%i7
	sra	%o5,	0x0A,	%g7
	or	%i3,	%g3,	%o2
	sdivcc	%i4,	0x1469,	%l1
	for	%f0,	%f26,	%f6
	save %o3, 0x0F80, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o4,	%g1,	%g4
	andn	%l2,	0x1BAE,	%i1
	movvs	%xcc,	%o0,	%g5
	edge32ln	%o7,	%i6,	%l3
	fsrc1s	%f2,	%f24
	sra	%i5,	0x08,	%l0
	save %g2, 0x0EAD, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x20],	%o6
	fmovsne	%xcc,	%f4,	%f16
	ldsh	[%l7 + 0x0A],	%o1
	or	%i2,	0x1812,	%l6
	fpsub32	%f18,	%f24,	%f16
	sdivcc	%i0,	0x0263,	%l5
	xnor	%o5,	0x0F11,	%g7
	addcc	%i3,	%i7,	%o2
	movne	%icc,	%i4,	%l1
	alignaddrl	%o3,	%g6,	%g3
	popc	%o4,	%g4
	mulscc	%g1,	0x096A,	%l2
	ldsh	[%l7 + 0x42],	%i1
	sdivcc	%g5,	0x1613,	%o0
	movle	%xcc,	%o7,	%i6
	array8	%l3,	%l0,	%i5
	fxnors	%f19,	%f24,	%f14
	fcmpgt16	%f20,	%f8,	%l4
	movneg	%icc,	%g2,	%o6
	fnot1s	%f0,	%f12
	fors	%f12,	%f11,	%f16
	std	%f12,	[%l7 + 0x10]
	ldub	[%l7 + 0x42],	%i2
	fmovrdlz	%l6,	%f26,	%f20
	srlx	%o1,	0x16,	%i0
	movgu	%xcc,	%o5,	%g7
	movrne	%l5,	0x1DA,	%i7
	ldd	[%l7 + 0x68],	%i2
	fornot2	%f12,	%f20,	%f6
	subcc	%i4,	%l1,	%o3
	udiv	%o2,	0x14B0,	%g6
	fmovrdlez	%o4,	%f16,	%f16
	xor	%g3,	%g1,	%g4
	movrlez	%i1,	0x267,	%l2
	sdivcc	%o0,	0x0397,	%o7
	edge8l	%g5,	%i6,	%l3
	xorcc	%l0,	%l4,	%g2
	fabss	%f23,	%f18
	move	%icc,	%o6,	%i5
	smul	%i2,	0x017D,	%l6
	movle	%xcc,	%o1,	%i0
	orcc	%g7,	%l5,	%i7
	ldsw	[%l7 + 0x6C],	%o5
	or	%i3,	0x06E2,	%l1
	ldsb	[%l7 + 0x35],	%i4
	srax	%o2,	0x0F,	%g6
	sth	%o3,	[%l7 + 0x56]
	mulscc	%o4,	%g1,	%g3
	sllx	%i1,	%g4,	%o0
	add	%o7,	%g5,	%i6
	edge16	%l2,	%l3,	%l4
	movge	%xcc,	%g2,	%o6
	ldd	[%l7 + 0x38],	%l0
	edge16ln	%i5,	%i2,	%o1
	movg	%xcc,	%i0,	%g7
	sdivx	%l5,	0x02D6,	%i7
	xnorcc	%o5,	%l6,	%l1
	movpos	%xcc,	%i4,	%i3
	mulx	%g6,	%o3,	%o4
	sra	%g1,	0x04,	%g3
	edge16	%o2,	%i1,	%o0
	lduh	[%l7 + 0x7A],	%g4
	std	%f4,	[%l7 + 0x30]
	fmovrdgz	%g5,	%f22,	%f18
	udiv	%i6,	0x1851,	%l2
	fcmpes	%fcc3,	%f31,	%f30
	fmovrslz	%o7,	%f19,	%f8
	fpmerge	%f20,	%f23,	%f6
	mulscc	%l4,	%g2,	%o6
	movrne	%l3,	%i5,	%l0
	array16	%i2,	%o1,	%i0
	andn	%g7,	0x1B27,	%l5
	or	%o5,	0x00F8,	%l6
	fmovrsgz	%i7,	%f20,	%f27
	movge	%xcc,	%i4,	%l1
	fnot1	%f16,	%f28
	fcmple16	%f22,	%f20,	%g6
	edge8n	%o3,	%i3,	%g1
	orn	%o4,	%o2,	%g3
	fmovdvc	%icc,	%f23,	%f17
	sir	0x14F8
	xnorcc	%o0,	%g4,	%g5
	movrgz	%i1,	0x182,	%l2
	smul	%o7,	0x1A61,	%i6
	edge32l	%g2,	%l4,	%l3
	ldd	[%l7 + 0x40],	%i4
	andn	%l0,	0x0768,	%i2
	fpsub32	%f22,	%f24,	%f8
	fmul8x16al	%f13,	%f15,	%f26
	ldsb	[%l7 + 0x61],	%o1
	fmovdpos	%xcc,	%f6,	%f20
	umul	%o6,	0x0579,	%g7
	sth	%i0,	[%l7 + 0x3A]
	bshuffle	%f20,	%f8,	%f30
	movl	%icc,	%o5,	%l6
	st	%f31,	[%l7 + 0x50]
	sdivcc	%l5,	0x1E00,	%i4
	orncc	%i7,	0x12E1,	%l1
	udivcc	%g6,	0x1858,	%o3
	edge8	%g1,	%o4,	%o2
	movne	%xcc,	%g3,	%o0
	sdivcc	%g4,	0x04C5,	%i3
	fmovrde	%i1,	%f18,	%f0
	andncc	%g5,	%l2,	%o7
	fcmps	%fcc0,	%f9,	%f25
	fxnors	%f22,	%f15,	%f12
	fmul8x16au	%f13,	%f9,	%f24
	xorcc	%g2,	0x04DD,	%i6
	movne	%xcc,	%l4,	%i5
	sethi	0x0B7D,	%l0
	edge16	%i2,	%o1,	%o6
	andncc	%g7,	%i0,	%o5
	alignaddrl	%l3,	%l6,	%i4
	movrgz	%l5,	%l1,	%g6
	nop
	set	0x11, %o0
	ldub	[%l7 + %o0],	%i7
	lduh	[%l7 + 0x48],	%g1
	fmovrslez	%o4,	%f5,	%f21
	movvs	%xcc,	%o3,	%g3
	stw	%o2,	[%l7 + 0x5C]
	alignaddr	%o0,	%i3,	%g4
	movpos	%icc,	%i1,	%l2
	xnorcc	%o7,	0x186B,	%g2
	xor	%g5,	0x06AB,	%l4
	sub	%i6,	%l0,	%i5
	umulcc	%i2,	%o1,	%g7
	movpos	%icc,	%i0,	%o6
	popc	0x0CF7,	%o5
	andn	%l3,	0x075C,	%l6
	sdivcc	%l5,	0x06EE,	%i4
	srlx	%g6,	%l1,	%g1
	movcs	%xcc,	%i7,	%o3
	srlx	%o4,	0x02,	%g3
	fmovdpos	%xcc,	%f19,	%f15
	movcc	%xcc,	%o0,	%i3
	ldx	[%l7 + 0x78],	%g4
	fmovrde	%o2,	%f16,	%f30
	stw	%i1,	[%l7 + 0x40]
	srlx	%l2,	0x09,	%g2
	sdiv	%o7,	0x0ACD,	%l4
	edge32l	%g5,	%l0,	%i5
	xorcc	%i6,	0x1EAD,	%o1
	xorcc	%i2,	%g7,	%i0
	orcc	%o5,	0x0B6E,	%o6
	movrne	%l6,	0x02A,	%l5
	movrlez	%l3,	0x106,	%g6
	movpos	%icc,	%l1,	%i4
	fmovdg	%icc,	%f12,	%f0
	sra	%i7,	%g1,	%o3
	array16	%o4,	%g3,	%o0
	fmovrsne	%i3,	%f18,	%f8
	or	%o2,	%i1,	%g4
	edge8	%g2,	%o7,	%l2
	add	%g5,	%l0,	%l4
	edge16ln	%i5,	%o1,	%i2
	and	%i6,	%i0,	%g7
	srl	%o6,	%l6,	%l5
	movleu	%xcc,	%l3,	%g6
	ldx	[%l7 + 0x20],	%o5
	mulx	%l1,	%i7,	%i4
	fsrc1s	%f27,	%f13
	fmovsvc	%xcc,	%f17,	%f14
	edge8ln	%o3,	%g1,	%o4
	subc	%o0,	0x14AC,	%i3
	sdivx	%g3,	0x0A88,	%i1
	pdist	%f10,	%f18,	%f6
	and	%o2,	%g4,	%o7
	movcs	%xcc,	%g2,	%l2
	mova	%icc,	%l0,	%g5
	fmul8x16	%f4,	%f26,	%f2
	fcmpes	%fcc1,	%f24,	%f11
	ldsb	[%l7 + 0x33],	%i5
	or	%l4,	0x0A37,	%i2
	subcc	%o1,	%i0,	%i6
	edge8l	%o6,	%l6,	%l5
	siam	0x2
	edge32	%g7,	%g6,	%o5
	addcc	%l1,	%l3,	%i4
	movcs	%xcc,	%o3,	%g1
	ldub	[%l7 + 0x63],	%i7
	edge8l	%o0,	%o4,	%i3
	movn	%xcc,	%g3,	%o2
	edge32n	%i1,	%o7,	%g2
	or	%l2,	0x16EF,	%g4
	movrlez	%l0,	%i5,	%g5
	movneg	%xcc,	%l4,	%i2
	xnor	%i0,	0x1EA4,	%i6
	addc	%o6,	%o1,	%l6
	movne	%xcc,	%l5,	%g6
	andncc	%o5,	%g7,	%l3
	fones	%f6
	fcmped	%fcc1,	%f6,	%f2
	fmovsneg	%icc,	%f30,	%f29
	edge32	%l1,	%o3,	%g1
	ld	[%l7 + 0x40],	%f19
	edge16l	%i4,	%i7,	%o0
	movl	%xcc,	%i3,	%g3
	movne	%icc,	%o2,	%i1
	movrgz	%o7,	%g2,	%o4
	ldsh	[%l7 + 0x74],	%g4
	or	%l2,	0x0787,	%i5
	fmovda	%icc,	%f11,	%f30
	stx	%g5,	[%l7 + 0x18]
	std	%f4,	[%l7 + 0x58]
	sethi	0x17C6,	%l0
	ldub	[%l7 + 0x23],	%l4
	or	%i2,	%i6,	%o6
	fmovrdne	%o1,	%f22,	%f4
	ld	[%l7 + 0x48],	%f12
	movvs	%xcc,	%l6,	%i0
	array32	%g6,	%l5,	%o5
	movg	%xcc,	%l3,	%l1
	sllx	%o3,	%g7,	%g1
	faligndata	%f2,	%f0,	%f18
	stw	%i4,	[%l7 + 0x14]
	array16	%o0,	%i7,	%i3
	edge32ln	%g3,	%o2,	%i1
	ld	[%l7 + 0x40],	%f7
	orn	%g2,	0x04AA,	%o7
	ldub	[%l7 + 0x68],	%o4
	array32	%g4,	%i5,	%l2
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	edge32ln	%i2,	%i6,	%o1
	orn	%o6,	0x1BAB,	%i0
	sethi	0x09EA,	%g6
	movl	%icc,	%l5,	%o5
	edge8ln	%l6,	%l1,	%o3
	mulx	%l3,	0x06E8,	%g1
	andcc	%i4,	0x0CED,	%o0
	lduw	[%l7 + 0x58],	%g7
	fsrc1s	%f23,	%f19
	sra	%i3,	0x1B,	%g3
	edge32n	%o2,	%i1,	%i7
	movn	%xcc,	%g2,	%o7
	subccc	%o4,	%i5,	%g4
	movne	%icc,	%g5,	%l4
	andcc	%l2,	0x1402,	%i2
	movrgez	%i6,	%l0,	%o6
	fmovdl	%xcc,	%f29,	%f17
	fmovsvc	%icc,	%f12,	%f3
	fnand	%f12,	%f10,	%f18
	sub	%o1,	0x112D,	%i0
	stb	%g6,	[%l7 + 0x1A]
	fmovdne	%xcc,	%f9,	%f31
	movl	%icc,	%o5,	%l5
	movvc	%xcc,	%l6,	%o3
	subc	%l1,	0x0217,	%l3
	popc	0x0068,	%i4
	ldd	[%l7 + 0x20],	%f6
	udiv	%g1,	0x11D4,	%o0
	fpack16	%f20,	%f9
	srax	%i3,	0x07,	%g7
	sth	%o2,	[%l7 + 0x10]
	xor	%i1,	0x09C7,	%g3
	sdiv	%i7,	0x102E,	%o7
	udivx	%g2,	0x1BB2,	%o4
	fpack32	%f24,	%f24,	%f6
	movne	%xcc,	%g4,	%g5
	umul	%l4,	%l2,	%i5
	movrne	%i6,	%i2,	%l0
	faligndata	%f14,	%f26,	%f24
	fpsub32	%f4,	%f0,	%f6
	st	%f1,	[%l7 + 0x30]
	sethi	0x13DA,	%o1
	orcc	%i0,	%g6,	%o5
	fmovrsgez	%l5,	%f20,	%f7
	movvs	%xcc,	%o6,	%o3
	fornot2s	%f29,	%f27,	%f12
	fnot2s	%f7,	%f27
	fandnot2	%f10,	%f20,	%f4
	edge16	%l1,	%l3,	%l6
	fmovsle	%xcc,	%f26,	%f28
	fmul8x16al	%f6,	%f11,	%f14
	fsrc1	%f6,	%f18
	edge32	%i4,	%o0,	%g1
	sra	%i3,	0x04,	%o2
	movrlz	%g7,	%g3,	%i1
	xor	%i7,	%o7,	%o4
	fmovsg	%icc,	%f22,	%f22
	fcmpd	%fcc3,	%f10,	%f0
	srl	%g4,	%g5,	%l4
	movpos	%icc,	%g2,	%i5
	sth	%l2,	[%l7 + 0x30]
	fmovde	%xcc,	%f17,	%f26
	fcmped	%fcc2,	%f24,	%f10
	alignaddr	%i6,	%i2,	%o1
	ldub	[%l7 + 0x5F],	%i0
	fmovsa	%icc,	%f1,	%f30
	ldd	[%l7 + 0x58],	%f10
	fpmerge	%f3,	%f12,	%f8
	popc	0x0C23,	%l0
	sir	0x0F49
	sir	0x055D
	edge16l	%g6,	%l5,	%o5
	subc	%o3,	0x0D67,	%l1
	andncc	%o6,	%l3,	%l6
	fmovscc	%icc,	%f4,	%f14
	movge	%icc,	%o0,	%i4
	mulx	%i3,	%o2,	%g1
	movrne	%g3,	%i1,	%g7
	ld	[%l7 + 0x14],	%f11
	movgu	%xcc,	%o7,	%o4
	move	%icc,	%i7,	%g4
	ldx	[%l7 + 0x50],	%g5
	movl	%icc,	%l4,	%g2
	edge32n	%l2,	%i5,	%i2
	array32	%o1,	%i6,	%l0
	or	%g6,	0x16F3,	%l5
	fmovsn	%icc,	%f3,	%f5
	xnor	%i0,	%o3,	%l1
	udivx	%o6,	0x1729,	%l3
	sdiv	%o5,	0x06ED,	%o0
	fandnot2s	%f25,	%f14,	%f25
	array32	%i4,	%l6,	%i3
	movvc	%icc,	%g1,	%g3
	fnand	%f24,	%f22,	%f8
	movpos	%xcc,	%o2,	%g7
	fnegs	%f12,	%f17
	udivx	%o7,	0x0565,	%i1
	edge8	%o4,	%i7,	%g5
	sll	%g4,	0x19,	%l4
	movre	%g2,	0x1CF,	%l2
	fmovrslez	%i2,	%f29,	%f31
	sdivx	%o1,	0x1A32,	%i5
	movgu	%icc,	%l0,	%i6
	sethi	0x1B81,	%l5
	fmovrdgz	%g6,	%f10,	%f30
	movneg	%icc,	%o3,	%i0
	mova	%icc,	%l1,	%o6
	movvs	%xcc,	%o5,	%l3
	movrlz	%i4,	%o0,	%i3
	subc	%l6,	0x141F,	%g1
	sir	0x1E5E
	and	%g3,	0x017A,	%o2
	ldsb	[%l7 + 0x56],	%o7
	movre	%g7,	%o4,	%i7
	fmovdleu	%icc,	%f20,	%f4
	ldd	[%l7 + 0x68],	%g4
	fmovsleu	%xcc,	%f2,	%f14
	sethi	0x1150,	%i1
	addc	%l4,	%g4,	%l2
	xor	%i2,	0x0584,	%g2
	fmovde	%icc,	%f15,	%f3
	movge	%icc,	%i5,	%o1
	udivcc	%l0,	0x143A,	%l5
	udivx	%g6,	0x141A,	%o3
	fmovdge	%xcc,	%f26,	%f21
	addcc	%i6,	0x0982,	%l1
	andncc	%o6,	%i0,	%o5
	stw	%i4,	[%l7 + 0x30]
	xnorcc	%l3,	%o0,	%l6
	nop
	set	0x6C, %i0
	sth	%i3,	[%l7 + %i0]
	edge8l	%g1,	%g3,	%o2
	sth	%g7,	[%l7 + 0x7C]
	fpsub32	%f22,	%f22,	%f24
	stx	%o7,	[%l7 + 0x68]
	fmovs	%f15,	%f4
	array8	%i7,	%g5,	%i1
	movvs	%xcc,	%l4,	%g4
	edge16	%o4,	%l2,	%g2
	movrgz	%i2,	0x337,	%i5
	alignaddr	%o1,	%l5,	%g6
	lduh	[%l7 + 0x4C],	%l0
	edge8n	%i6,	%o3,	%o6
	sllx	%i0,	0x1F,	%o5
	mova	%xcc,	%l1,	%i4
	fmovsn	%xcc,	%f9,	%f2
	movne	%xcc,	%o0,	%l6
	fmovrsne	%l3,	%f31,	%f18
	movcc	%icc,	%i3,	%g3
	std	%f4,	[%l7 + 0x08]
	stb	%o2,	[%l7 + 0x77]
	sdivcc	%g7,	0x192D,	%g1
	srax	%o7,	%g5,	%i1
	fpsub32	%f28,	%f8,	%f20
	fabsd	%f18,	%f28
	fmovde	%xcc,	%f25,	%f6
	fmovrslz	%i7,	%f1,	%f23
	and	%g4,	%l4,	%o4
	movgu	%xcc,	%l2,	%g2
	movneg	%icc,	%i2,	%o1
	add	%i5,	0x0F7D,	%l5
	orncc	%l0,	0x0F24,	%i6
	subc	%o3,	0x0A93,	%g6
	stb	%i0,	[%l7 + 0x64]
	sub	%o5,	0x0EB3,	%o6
	movvc	%icc,	%l1,	%o0
	movvs	%xcc,	%l6,	%i4
	movpos	%icc,	%l3,	%g3
	addcc	%o2,	0x068D,	%g7
	xnor	%g1,	0x1D23,	%i3
	movle	%icc,	%o7,	%g5
	smul	%i7,	0x14CD,	%i1
	movrne	%l4,	0x00E,	%o4
	movrgz	%g4,	%g2,	%l2
	fabsd	%f16,	%f30
	fxors	%f29,	%f12,	%f1
	stw	%o1,	[%l7 + 0x34]
	fmovspos	%icc,	%f3,	%f19
	fcmpes	%fcc3,	%f17,	%f25
	edge8l	%i2,	%i5,	%l5
	edge8n	%l0,	%o3,	%i6
	sdivcc	%g6,	0x0BA3,	%i0
	addccc	%o5,	%o6,	%l1
	pdist	%f18,	%f6,	%f2
	srax	%o0,	%i4,	%l6
	fexpand	%f17,	%f26
	orcc	%l3,	0x174C,	%g3
	fmovdcs	%xcc,	%f6,	%f25
	movg	%xcc,	%g7,	%g1
	sdivcc	%i3,	0x0808,	%o7
	edge16ln	%o2,	%i7,	%i1
	movge	%xcc,	%g5,	%l4
	edge32l	%g4,	%g2,	%o4
	stb	%o1,	[%l7 + 0x3C]
	fmovsne	%icc,	%f28,	%f1
	movneg	%icc,	%l2,	%i2
	fnot2	%f0,	%f18
	sll	%l5,	%l0,	%i5
	movvc	%xcc,	%i6,	%g6
	srl	%i0,	0x06,	%o3
	stb	%o6,	[%l7 + 0x62]
	smulcc	%o5,	0x1D2F,	%o0
	lduh	[%l7 + 0x64],	%i4
	and	%l1,	%l6,	%l3
	udivcc	%g3,	0x0DD9,	%g7
	fmovdneg	%xcc,	%f30,	%f9
	edge8ln	%i3,	%o7,	%o2
	nop
	set	0x70, %g2
	std	%f18,	[%l7 + %g2]
	addcc	%i7,	%g1,	%i1
	subcc	%l4,	0x0647,	%g4
	fsrc1s	%f1,	%f25
	edge8	%g2,	%g5,	%o1
	srl	%l2,	%o4,	%l5
	fmovd	%f8,	%f22
	addccc	%i2,	0x00B7,	%l0
	movne	%icc,	%i5,	%g6
	movrne	%i0,	%o3,	%i6
	fandnot1s	%f15,	%f16,	%f12
	fmovscc	%xcc,	%f25,	%f10
	movre	%o6,	0x19D,	%o0
	lduh	[%l7 + 0x40],	%i4
	fands	%f17,	%f26,	%f0
	std	%f30,	[%l7 + 0x50]
	xor	%o5,	0x0760,	%l1
	movge	%xcc,	%l3,	%l6
	edge32n	%g7,	%i3,	%o7
	popc	%o2,	%g3
	movleu	%icc,	%i7,	%i1
	fnands	%f31,	%f24,	%f0
	addccc	%g1,	0x0A5E,	%g4
	movgu	%icc,	%g2,	%l4
	movcc	%icc,	%g5,	%l2
	sra	%o1,	%o4,	%l5
	mulx	%i2,	0x1102,	%i5
	edge16n	%l0,	%i0,	%g6
	fpack32	%f20,	%f22,	%f8
	sub	%o3,	%i6,	%o0
	movre	%i4,	0x2C1,	%o5
	faligndata	%f4,	%f26,	%f24
	st	%f19,	[%l7 + 0x08]
	smul	%l1,	%o6,	%l3
	edge8n	%g7,	%i3,	%l6
	edge16l	%o2,	%o7,	%g3
	nop
	set	0x23, %g7
	ldsb	[%l7 + %g7],	%i1
	edge32n	%g1,	%i7,	%g4
	array8	%g2,	%l4,	%g5
	edge32ln	%l2,	%o4,	%l5
	sdivcc	%o1,	0x140F,	%i5
	ldd	[%l7 + 0x50],	%i2
	ldx	[%l7 + 0x30],	%i0
	srlx	%l0,	0x15,	%g6
	sllx	%i6,	%o0,	%i4
	nop
	set	0x18, %g4
	lduh	[%l7 + %g4],	%o3
	srl	%l1,	%o6,	%o5
	std	%f18,	[%l7 + 0x60]
	sub	%l3,	0x1CDB,	%i3
	fpadd16s	%f31,	%f26,	%f24
	restore %g7, 0x13FD, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc3,	%f7,	%f30
	nop
	set	0x45, %l6
	ldsb	[%l7 + %l6],	%o7
	subccc	%g3,	0x18EF,	%i1
	ldsw	[%l7 + 0x4C],	%o2
	mova	%icc,	%g1,	%g4
	movle	%xcc,	%i7,	%g2
	ldx	[%l7 + 0x18],	%l4
	ld	[%l7 + 0x30],	%f28
	stb	%l2,	[%l7 + 0x66]
	fmovdvc	%xcc,	%f28,	%f12
	fnot1s	%f12,	%f27
	xor	%o4,	0x0488,	%g5
	stx	%o1,	[%l7 + 0x48]
	ldsh	[%l7 + 0x60],	%i5
	fabss	%f16,	%f31
	movre	%l5,	%i2,	%l0
	movrlz	%g6,	0x3BD,	%i0
	fmovsl	%xcc,	%f23,	%f23
	fnor	%f24,	%f8,	%f18
	sth	%o0,	[%l7 + 0x3A]
	sub	%i4,	%i6,	%l1
	mulscc	%o3,	0x0D05,	%o6
	fmovsgu	%icc,	%f28,	%f15
	movpos	%xcc,	%o5,	%i3
	movre	%l3,	%g7,	%o7
	movvs	%icc,	%g3,	%i1
	subcc	%o2,	%l6,	%g1
	orncc	%g4,	%g2,	%i7
	movne	%icc,	%l4,	%o4
	array8	%g5,	%l2,	%o1
	xor	%i5,	0x1656,	%i2
	fzero	%f14
	save %l0, %l5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x44],	%g6
	edge32	%i4,	%i6,	%o0
	stw	%l1,	[%l7 + 0x10]
	fpadd16s	%f25,	%f1,	%f13
	addccc	%o3,	0x0AA8,	%o6
	fpsub16	%f6,	%f22,	%f20
	ldsb	[%l7 + 0x74],	%o5
	movpos	%icc,	%i3,	%l3
	andcc	%o7,	%g3,	%g7
	std	%f26,	[%l7 + 0x50]
	fornot2s	%f3,	%f2,	%f26
	stx	%i1,	[%l7 + 0x18]
	movrgz	%l6,	0x091,	%o2
	fnot2	%f10,	%f14
	edge8l	%g4,	%g1,	%g2
	sdiv	%l4,	0x0575,	%o4
	xor	%g5,	0x02CE,	%l2
	mova	%xcc,	%i7,	%o1
	addcc	%i2,	%i5,	%l5
	srlx	%l0,	%i0,	%g6
	fnand	%f2,	%f14,	%f26
	smul	%i6,	0x12B2,	%i4
	save %l1, 0x0B5F, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o6,	0x010B,	%o3
	bshuffle	%f30,	%f24,	%f14
	movg	%icc,	%o5,	%i3
	popc	0x0BAD,	%l3
	fmovdn	%xcc,	%f4,	%f11
	fors	%f5,	%f10,	%f3
	movneg	%xcc,	%o7,	%g7
	add	%g3,	0x07FA,	%i1
	xorcc	%l6,	%g4,	%o2
	edge32n	%g2,	%l4,	%g1
	orncc	%o4,	0x09D1,	%l2
	movcc	%xcc,	%g5,	%i7
	fpsub16	%f2,	%f18,	%f22
	popc	0x030D,	%o1
	ldd	[%l7 + 0x38],	%f30
	sll	%i2,	%i5,	%l0
	edge8	%i0,	%g6,	%i6
	stw	%l5,	[%l7 + 0x28]
	mulx	%l1,	%o0,	%o6
	ldd	[%l7 + 0x30],	%o2
	andcc	%o5,	%i3,	%i4
	movcc	%icc,	%l3,	%g7
	fcmped	%fcc1,	%f16,	%f14
	lduh	[%l7 + 0x68],	%g3
	movcs	%icc,	%o7,	%l6
	udivx	%g4,	0x11B2,	%o2
	addcc	%i1,	0x1CF8,	%l4
	sethi	0x032E,	%g2
	fnot2	%f2,	%f24
	ld	[%l7 + 0x50],	%f19
	addccc	%o4,	%g1,	%g5
	movrne	%l2,	%i7,	%o1
	stx	%i2,	[%l7 + 0x48]
	fmovsvc	%xcc,	%f11,	%f17
	edge32	%i5,	%l0,	%i0
	sdivx	%g6,	0x183F,	%l5
	andcc	%i6,	%o0,	%l1
	fpadd16s	%f15,	%f19,	%f21
	array16	%o6,	%o3,	%o5
	movvs	%icc,	%i4,	%i3
	sub	%l3,	%g3,	%g7
	udivcc	%o7,	0x1DAE,	%l6
	fmovdleu	%xcc,	%f1,	%f3
	alignaddrl	%o2,	%g4,	%i1
	lduh	[%l7 + 0x60],	%l4
	stx	%g2,	[%l7 + 0x30]
	movge	%icc,	%o4,	%g5
	lduw	[%l7 + 0x44],	%l2
	fnor	%f4,	%f22,	%f18
	sdivcc	%i7,	0x0DC1,	%o1
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	fornot1s	%f31,	%f31,	%f26
	edge32	%g1,	%l0,	%i0
	udivx	%l5,	0x028A,	%i6
	xor	%o0,	%l1,	%o6
	ldsh	[%l7 + 0x7A],	%o3
	movre	%o5,	0x213,	%g6
	fsrc1s	%f31,	%f7
	nop
	set	0x69, %l4
	stb	%i3,	[%l7 + %l4]
	andn	%i4,	%g3,	%l3
	smulcc	%g7,	0x1564,	%o7
	xorcc	%o2,	0x0584,	%g4
	fmuld8ulx16	%f13,	%f9,	%f0
	fpack32	%f30,	%f28,	%f14
	fmovse	%xcc,	%f26,	%f21
	xorcc	%i1,	0x01B3,	%l6
	fsrc2s	%f13,	%f17
	umul	%g2,	%l4,	%g5
	movcs	%xcc,	%l2,	%i7
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f2
	movn	%xcc,	%o4,	%i2
	xor	%i5,	%o1,	%g1
	fxors	%f13,	%f8,	%f31
	xorcc	%i0,	0x1516,	%l0
	edge16	%l5,	%o0,	%l1
	fpsub16	%f2,	%f22,	%f10
	fmovdleu	%xcc,	%f23,	%f7
	restore %o6, 0x154E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i6,	%o5,	%g6
	save %i3, %g3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x16, %o2
	sth	%i4,	[%l7 + %o2]
	popc	0x0F0A,	%o7
	fmovrsgez	%g7,	%f19,	%f0
	sdiv	%g4,	0x08E5,	%o2
	fpadd16s	%f26,	%f23,	%f0
	stx	%l6,	[%l7 + 0x30]
	udivx	%i1,	0x029D,	%l4
	fsrc2	%f24,	%f4
	subccc	%g2,	0x1AD1,	%g5
	move	%xcc,	%l2,	%o4
	movrne	%i7,	0x146,	%i5
	movrgz	%i2,	0x19E,	%o1
	movcc	%xcc,	%i0,	%g1
	edge16ln	%l0,	%o0,	%l1
	fone	%f20
	array8	%l5,	%o6,	%o3
	nop
	set	0x74, %i2
	lduh	[%l7 + %i2],	%o5
	xnorcc	%g6,	0x1AB2,	%i3
	fmovrsgz	%i6,	%f30,	%f11
	fcmpeq32	%f18,	%f4,	%l3
	movcs	%icc,	%i4,	%o7
	xorcc	%g7,	0x1AC0,	%g3
	edge32	%o2,	%l6,	%i1
	srl	%g4,	0x0F,	%g2
	lduh	[%l7 + 0x56],	%g5
	fabsd	%f16,	%f4
	fsrc1	%f22,	%f30
	fmovse	%icc,	%f27,	%f25
	andncc	%l4,	%l2,	%o4
	fmovdpos	%xcc,	%f24,	%f12
	subccc	%i5,	%i7,	%o1
	movne	%icc,	%i2,	%g1
	edge32l	%l0,	%i0,	%l1
	stw	%o0,	[%l7 + 0x4C]
	fpack32	%f6,	%f14,	%f30
	array8	%l5,	%o6,	%o5
	orn	%g6,	%o3,	%i6
	smul	%l3,	0x0A77,	%i3
	movl	%icc,	%o7,	%i4
	movcc	%icc,	%g7,	%g3
	fpsub16	%f26,	%f16,	%f26
	stw	%o2,	[%l7 + 0x78]
	alignaddrl	%i1,	%g4,	%g2
	sra	%g5,	0x0E,	%l6
	srl	%l2,	0x1F,	%o4
	xnor	%l4,	%i5,	%i7
	umul	%i2,	0x0F24,	%g1
	movl	%xcc,	%l0,	%i0
	orncc	%l1,	0x1AE2,	%o1
	edge8	%l5,	%o0,	%o6
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	srax	%g6,	0x1A,	%i3
	ldsh	[%l7 + 0x60],	%l3
	ld	[%l7 + 0x48],	%f14
	fors	%f29,	%f20,	%f27
	ldx	[%l7 + 0x10],	%o7
	movcc	%icc,	%i4,	%g3
	stw	%g7,	[%l7 + 0x74]
	lduw	[%l7 + 0x58],	%i1
	andn	%o2,	%g4,	%g5
	fmovrde	%g2,	%f18,	%f10
	fandnot1	%f18,	%f8,	%f10
	movvc	%icc,	%l2,	%o4
	fmovrdlz	%l6,	%f2,	%f18
	ldsw	[%l7 + 0x74],	%l4
	fmovsa	%icc,	%f29,	%f9
	edge16	%i7,	%i2,	%g1
	sth	%l0,	[%l7 + 0x7C]
	lduw	[%l7 + 0x68],	%i0
	add	%l1,	0x0551,	%o1
	stx	%i5,	[%l7 + 0x28]
	xorcc	%o0,	0x0806,	%o6
	stb	%o5,	[%l7 + 0x23]
	save %l5, %o3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%i3,	%l3
	sra	%o7,	0x0A,	%g3
	fmovrde	%g7,	%f8,	%f16
	smulcc	%i1,	0x02BE,	%o2
	smul	%g4,	%i4,	%g5
	movcs	%icc,	%l2,	%o4
	andncc	%l6,	%g2,	%l4
	movg	%xcc,	%i2,	%i7
	edge8	%g1,	%i0,	%l1
	fornot1s	%f28,	%f24,	%f29
	movleu	%icc,	%o1,	%i5
	udiv	%l0,	0x0BAD,	%o0
	smul	%o6,	%o5,	%o3
	movne	%icc,	%i6,	%l5
	xnor	%i3,	0x18DD,	%g6
	movvs	%xcc,	%l3,	%g3
	std	%f8,	[%l7 + 0x08]
	fmovdg	%icc,	%f31,	%f31
	movrne	%g7,	%i1,	%o7
	sll	%o2,	0x09,	%i4
	array8	%g4,	%l2,	%g5
	alignaddr	%l6,	%o4,	%l4
	fandnot2s	%f29,	%f26,	%f27
	edge16ln	%g2,	%i7,	%g1
	movneg	%xcc,	%i2,	%l1
	pdist	%f2,	%f22,	%f18
	fandnot2s	%f26,	%f16,	%f29
	or	%i0,	0x1DFE,	%i5
	sdivcc	%l0,	0x1EF2,	%o0
	fmovrdne	%o6,	%f14,	%f8
	movg	%xcc,	%o1,	%o5
	st	%f5,	[%l7 + 0x24]
	mulscc	%i6,	0x11A0,	%o3
	stx	%i3,	[%l7 + 0x60]
	movrlz	%l5,	0x28F,	%g6
	fmovsvs	%xcc,	%f9,	%f6
	edge8n	%g3,	%l3,	%g7
	fnot2s	%f27,	%f13
	fandnot2s	%f0,	%f18,	%f4
	movrne	%o7,	%i1,	%i4
	fpsub16	%f6,	%f0,	%f8
	edge8	%o2,	%l2,	%g4
	save %l6, %o4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f14,	%f12
	add	%l4,	%i7,	%g1
	ldub	[%l7 + 0x7B],	%g2
	movn	%icc,	%i2,	%i0
	nop
	set	0x38, %l5
	ldsh	[%l7 + %l5],	%i5
	fcmpgt16	%f20,	%f14,	%l0
	andcc	%l1,	%o6,	%o1
	movrlz	%o0,	%o5,	%o3
	sethi	0x0949,	%i6
	movn	%icc,	%i3,	%g6
	ldd	[%l7 + 0x70],	%g2
	movrgz	%l5,	%l3,	%o7
	movleu	%icc,	%g7,	%i1
	std	%f30,	[%l7 + 0x78]
	movvc	%xcc,	%i4,	%l2
	array32	%o2,	%l6,	%o4
	orcc	%g4,	%l4,	%i7
	fsrc1s	%f31,	%f30
	xorcc	%g5,	%g1,	%g2
	edge16n	%i0,	%i2,	%l0
	movre	%i5,	0x10A,	%l1
	stw	%o1,	[%l7 + 0x1C]
	fabsd	%f26,	%f14
	fcmpgt16	%f24,	%f20,	%o6
	lduh	[%l7 + 0x66],	%o5
	subcc	%o3,	0x06E6,	%i6
	movle	%xcc,	%o0,	%g6
	sdivcc	%g3,	0x02B8,	%i3
	move	%icc,	%l5,	%l3
	fmovrslez	%g7,	%f15,	%f12
	movrgz	%i1,	%o7,	%l2
	fpadd16s	%f25,	%f17,	%f9
	fmovsleu	%xcc,	%f31,	%f14
	edge8	%i4,	%o2,	%l6
	xor	%g4,	0x1386,	%o4
	alignaddr	%i7,	%g5,	%g1
	movne	%xcc,	%l4,	%g2
	srlx	%i2,	%l0,	%i5
	edge16n	%i0,	%l1,	%o6
	movg	%xcc,	%o1,	%o3
	sub	%i6,	0x064B,	%o5
	move	%icc,	%g6,	%o0
	stx	%g3,	[%l7 + 0x10]
	fmovdne	%xcc,	%f30,	%f0
	fcmped	%fcc1,	%f18,	%f28
	ldub	[%l7 + 0x5D],	%i3
	edge16l	%l5,	%l3,	%i1
	srlx	%g7,	%o7,	%l2
	fsrc1s	%f25,	%f12
	fandnot1s	%f0,	%f7,	%f9
	sra	%i4,	%l6,	%o2
	fpadd16s	%f10,	%f18,	%f30
	array16	%g4,	%i7,	%g5
	movg	%xcc,	%o4,	%l4
	fmovdne	%icc,	%f12,	%f19
	edge32l	%g1,	%i2,	%g2
	move	%icc,	%l0,	%i0
	nop
	set	0x48, %i6
	lduh	[%l7 + %i6],	%i5
	stb	%o6,	[%l7 + 0x6F]
	fpackfix	%f26,	%f3
	subcc	%o1,	0x1D15,	%o3
	alignaddrl	%i6,	%l1,	%g6
	fmul8x16	%f20,	%f2,	%f30
	movne	%icc,	%o5,	%o0
	fcmpes	%fcc0,	%f3,	%f25
	ldsh	[%l7 + 0x78],	%g3
	movg	%xcc,	%l5,	%i3
	fmovsge	%xcc,	%f30,	%f31
	edge8l	%l3,	%i1,	%o7
	edge32l	%l2,	%i4,	%g7
	move	%xcc,	%l6,	%g4
	fxors	%f9,	%f18,	%f26
	fcmpne32	%f30,	%f30,	%o2
	movre	%g5,	0x20F,	%i7
	movleu	%xcc,	%o4,	%l4
	fmovdleu	%icc,	%f18,	%f20
	addccc	%i2,	%g2,	%l0
	fmovdneg	%xcc,	%f12,	%f12
	edge32n	%g1,	%i5,	%i0
	edge32ln	%o6,	%o1,	%o3
	ldx	[%l7 + 0x18],	%l1
	xnor	%i6,	0x1ECF,	%o5
	edge16	%o0,	%g3,	%g6
	sra	%l5,	0x0A,	%i3
	sethi	0x10FB,	%l3
	edge8ln	%o7,	%i1,	%i4
	subccc	%g7,	%l6,	%l2
	xor	%o2,	%g5,	%g4
	srl	%o4,	%i7,	%i2
	andncc	%l4,	%l0,	%g1
	orncc	%i5,	%i0,	%o6
	array16	%g2,	%o3,	%l1
	sllx	%o1,	%i6,	%o0
	sdiv	%g3,	0x1157,	%o5
	fmovda	%icc,	%f16,	%f20
	lduh	[%l7 + 0x3A],	%l5
	fmuld8ulx16	%f17,	%f25,	%f8
	umul	%i3,	0x18E1,	%l3
	xnorcc	%o7,	%g6,	%i4
	smulcc	%g7,	%l6,	%i1
	xor	%o2,	0x0D4B,	%g5
	sdiv	%l2,	0x003E,	%g4
	andn	%o4,	%i7,	%l4
	edge8	%l0,	%g1,	%i5
	edge32ln	%i2,	%i0,	%o6
	alignaddrl	%g2,	%l1,	%o3
	edge16l	%o1,	%i6,	%o0
	fcmpes	%fcc1,	%f24,	%f0
	alignaddrl	%o5,	%l5,	%i3
	or	%l3,	0x1A46,	%g3
	movrgz	%o7,	0x1D2,	%i4
	movrlz	%g7,	%g6,	%i1
	and	%o2,	%g5,	%l6
	movvc	%xcc,	%g4,	%l2
	fmovdn	%icc,	%f3,	%f20
	array8	%o4,	%l4,	%l0
	fmovse	%icc,	%f14,	%f9
	movcs	%xcc,	%i7,	%i5
	addccc	%i2,	%i0,	%g1
	fmovrdne	%o6,	%f28,	%f14
	movl	%xcc,	%g2,	%l1
	fmovdge	%xcc,	%f14,	%f27
	ldsw	[%l7 + 0x5C],	%o1
	lduh	[%l7 + 0x44],	%o3
	fmovrse	%o0,	%f22,	%f19
	movle	%icc,	%i6,	%o5
	edge8	%l5,	%l3,	%i3
	stx	%g3,	[%l7 + 0x18]
	movn	%xcc,	%i4,	%o7
	sdivx	%g6,	0x17E4,	%g7
	sethi	0x0AC7,	%i1
	umulcc	%g5,	0x1D71,	%o2
	fone	%f26
	lduw	[%l7 + 0x14],	%l6
	movpos	%xcc,	%g4,	%l2
	edge8n	%o4,	%l0,	%l4
	xorcc	%i7,	%i5,	%i2
	edge32ln	%g1,	%o6,	%i0
	umulcc	%g2,	%l1,	%o3
	fcmpgt16	%f18,	%f28,	%o1
	smulcc	%i6,	%o0,	%o5
	movrgz	%l5,	%l3,	%g3
	or	%i3,	0x187F,	%i4
	ldd	[%l7 + 0x48],	%f20
	ldd	[%l7 + 0x28],	%f30
	lduw	[%l7 + 0x48],	%o7
	move	%icc,	%g7,	%i1
	fmovdg	%icc,	%f31,	%f13
	lduh	[%l7 + 0x26],	%g6
	fmovdge	%icc,	%f24,	%f29
	sir	0x0443
	movn	%xcc,	%o2,	%g5
	alignaddr	%g4,	%l2,	%o4
	movpos	%icc,	%l6,	%l4
	movvc	%xcc,	%l0,	%i7
	movpos	%icc,	%i2,	%g1
	edge8l	%o6,	%i5,	%g2
	sdiv	%l1,	0x01A1,	%i0
	fsrc2s	%f26,	%f23
	smul	%o1,	%i6,	%o0
	alignaddr	%o5,	%o3,	%l5
	fmovdvs	%xcc,	%f31,	%f1
	addcc	%l3,	%g3,	%i4
	smulcc	%o7,	%g7,	%i3
	edge32ln	%g6,	%o2,	%g5
	andn	%i1,	0x015A,	%g4
	subcc	%l2,	0x136F,	%o4
	ldd	[%l7 + 0x58],	%i6
	udiv	%l0,	0x0161,	%i7
	stx	%i2,	[%l7 + 0x10]
	orcc	%l4,	0x1E63,	%g1
	fpmerge	%f15,	%f4,	%f24
	edge8ln	%o6,	%g2,	%l1
	sll	%i5,	%i0,	%i6
	movcc	%xcc,	%o0,	%o1
	movcc	%xcc,	%o5,	%o3
	restore %l3, 0x13A9, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i4,	%o7,	%g7
	sethi	0x073D,	%i3
	edge8n	%l5,	%g6,	%o2
	alignaddr	%i1,	%g4,	%g5
	andcc	%l2,	%l6,	%l0
	ld	[%l7 + 0x50],	%f18
	fmovse	%xcc,	%f30,	%f23
	fandnot2s	%f21,	%f10,	%f20
	ldd	[%l7 + 0x40],	%i6
	addc	%o4,	%l4,	%i2
	srax	%o6,	0x11,	%g2
	alignaddr	%l1,	%g1,	%i0
	ldd	[%l7 + 0x68],	%i6
	umulcc	%o0,	0x0DD3,	%i5
	move	%icc,	%o1,	%o3
	sethi	0x1AAD,	%l3
	array32	%o5,	%g3,	%i4
	udivx	%o7,	0x1D04,	%g7
	add	%i3,	0x0A0A,	%g6
	nop
	set	0x48, %i5
	lduw	[%l7 + %i5],	%l5
	sdiv	%i1,	0x000D,	%g4
	ldsb	[%l7 + 0x23],	%g5
	movcs	%icc,	%o2,	%l6
	edge32l	%l2,	%l0,	%i7
	fmovrdne	%l4,	%f2,	%f4
	array32	%o4,	%o6,	%i2
	xnorcc	%l1,	0x186B,	%g1
	lduh	[%l7 + 0x5E],	%i0
	edge16n	%g2,	%o0,	%i5
	edge32	%o1,	%o3,	%l3
	andn	%o5,	%g3,	%i4
	sllx	%o7,	%g7,	%i3
	ldsb	[%l7 + 0x4B],	%i6
	stw	%l5,	[%l7 + 0x44]
	andcc	%i1,	0x1080,	%g6
	fzero	%f2
	sdiv	%g4,	0x0A8F,	%g5
	fandnot1s	%f22,	%f26,	%f27
	subc	%o2,	0x1B0E,	%l2
	fmovsgu	%icc,	%f1,	%f16
	array16	%l6,	%i7,	%l0
	movn	%icc,	%l4,	%o6
	fone	%f22
	sllx	%o4,	0x0F,	%i2
	movrlz	%l1,	0x103,	%i0
	movn	%icc,	%g1,	%g2
	sdivcc	%i5,	0x1F94,	%o0
	subc	%o3,	%l3,	%o1
	movvs	%xcc,	%o5,	%i4
	save %o7, 0x094C, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g7,	%i6,	%l5
	sth	%i1,	[%l7 + 0x3C]
	xorcc	%g6,	%i3,	%g5
	edge8	%o2,	%g4,	%l2
	movre	%i7,	%l0,	%l4
	udivx	%o6,	0x0621,	%o4
	fsrc2s	%f10,	%f14
	andcc	%l6,	0x0477,	%l1
	movpos	%xcc,	%i2,	%i0
	movrlz	%g1,	0x0A4,	%i5
	mulscc	%o0,	%o3,	%g2
	fcmple16	%f14,	%f6,	%o1
	mulscc	%l3,	0x1B62,	%o5
	fpadd16	%f30,	%f14,	%f22
	fsrc1s	%f17,	%f7
	edge8ln	%i4,	%o7,	%g3
	orn	%g7,	0x0B7C,	%l5
	st	%f24,	[%l7 + 0x58]
	fmuld8ulx16	%f17,	%f9,	%f28
	fmovs	%f6,	%f15
	ldd	[%l7 + 0x18],	%i6
	andcc	%g6,	0x1A0D,	%i3
	fmovdneg	%xcc,	%f7,	%f8
	sth	%i1,	[%l7 + 0x78]
	xorcc	%g5,	%o2,	%l2
	edge32l	%i7,	%g4,	%l0
	ldub	[%l7 + 0x54],	%o6
	lduw	[%l7 + 0x54],	%o4
	mulx	%l4,	%l6,	%i2
	add	%l1,	%i0,	%i5
	fmul8ulx16	%f4,	%f16,	%f28
	edge16n	%o0,	%g1,	%o3
	ldub	[%l7 + 0x20],	%o1
	movn	%icc,	%l3,	%g2
	st	%f14,	[%l7 + 0x1C]
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%o5
	ld	[%l7 + 0x0C],	%f5
	addc	%i4,	%o7,	%g3
	subcc	%l5,	0x15A1,	%g7
	movgu	%xcc,	%i6,	%i3
	xnorcc	%g6,	%g5,	%i1
	orncc	%l2,	%o2,	%g4
	array32	%i7,	%o6,	%l0
	movle	%xcc,	%o4,	%l6
	movrne	%l4,	0x336,	%i2
	stb	%i0,	[%l7 + 0x7F]
	movrgz	%l1,	0x2E4,	%i5
	edge16ln	%o0,	%g1,	%o3
	movcs	%xcc,	%o1,	%l3
	st	%f18,	[%l7 + 0x40]
	edge8	%g2,	%o5,	%i4
	umulcc	%o7,	%l5,	%g3
	fmovrsgez	%g7,	%f0,	%f10
	movpos	%icc,	%i3,	%i6
	udivcc	%g5,	0x1E4E,	%i1
	fcmpeq16	%f8,	%f4,	%g6
	ldd	[%l7 + 0x58],	%o2
	udiv	%g4,	0x0CF6,	%i7
	sdivx	%l2,	0x1D01,	%o6
	movle	%icc,	%o4,	%l0
	sll	%l4,	%i2,	%i0
	udivx	%l1,	0x1AD2,	%l6
	and	%i5,	%o0,	%g1
	sll	%o1,	%o3,	%g2
	array32	%o5,	%l3,	%o7
	addcc	%i4,	0x1876,	%l5
	addc	%g7,	%g3,	%i6
	array8	%g5,	%i3,	%g6
	edge8	%o2,	%g4,	%i1
	fmul8x16	%f26,	%f22,	%f2
	ld	[%l7 + 0x48],	%f28
	sra	%i7,	0x0F,	%o6
	movrgz	%o4,	%l0,	%l4
	fmovrdlz	%i2,	%f12,	%f6
	alignaddr	%l2,	%l1,	%i0
	movgu	%icc,	%l6,	%i5
	or	%o0,	%o1,	%o3
	fcmped	%fcc1,	%f2,	%f30
	addc	%g1,	0x12EA,	%o5
	movvc	%icc,	%l3,	%o7
	movvc	%icc,	%g2,	%i4
	movgu	%icc,	%g7,	%l5
	movne	%xcc,	%g3,	%i6
	ld	[%l7 + 0x20],	%f4
	umul	%i3,	%g6,	%g5
	fxnor	%f18,	%f16,	%f30
	ldd	[%l7 + 0x28],	%f6
	movge	%icc,	%o2,	%i1
	sllx	%i7,	%g4,	%o4
	fmovrdgez	%l0,	%f24,	%f24
	movvc	%xcc,	%l4,	%o6
	edge16	%l2,	%i2,	%l1
	for	%f26,	%f18,	%f30
	add	%i0,	%i5,	%l6
	movvc	%xcc,	%o1,	%o0
	sdiv	%g1,	0x0D1A,	%o5
	xorcc	%l3,	%o3,	%g2
	fnegd	%f0,	%f4
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	movcc	%xcc,	%i4,	%g3
	ldsw	[%l7 + 0x60],	%i6
	ldd	[%l7 + 0x70],	%i2
	andncc	%l5,	%g5,	%o2
	mova	%xcc,	%g6,	%i7
	fcmped	%fcc0,	%f24,	%f18
	sra	%g4,	%i1,	%o4
	add	%l4,	%l0,	%o6
	andncc	%l2,	%i2,	%l1
	edge32ln	%i5,	%i0,	%l6
	stx	%o0,	[%l7 + 0x60]
	movrne	%g1,	0x3B5,	%o5
	fmovsvs	%icc,	%f21,	%f20
	stb	%o1,	[%l7 + 0x70]
	xnor	%o3,	%g2,	%l3
	edge16ln	%o7,	%g7,	%g3
	fmovse	%xcc,	%f8,	%f6
	fmul8ulx16	%f2,	%f14,	%f16
	smulcc	%i4,	0x127A,	%i6
	orncc	%l5,	%g5,	%o2
	ldx	[%l7 + 0x70],	%i3
	fornot2	%f10,	%f30,	%f12
	fmovs	%f10,	%f8
	fsrc1s	%f21,	%f16
	edge16	%g6,	%i7,	%i1
	orcc	%o4,	%g4,	%l4
	move	%icc,	%o6,	%l2
	udiv	%i2,	0x0F88,	%l1
	movg	%xcc,	%l0,	%i5
	ld	[%l7 + 0x34],	%f7
	fnot1s	%f27,	%f24
	edge16l	%i0,	%l6,	%o0
	addcc	%g1,	%o5,	%o1
	sir	0x1F3B
	andncc	%g2,	%l3,	%o3
	fpmerge	%f4,	%f27,	%f12
	fcmpne16	%f0,	%f22,	%o7
	subc	%g3,	%i4,	%i6
	stx	%l5,	[%l7 + 0x48]
	movrgz	%g7,	0x15E,	%o2
	edge8l	%i3,	%g6,	%g5
	nop
	set	0x0C, %o7
	ldsb	[%l7 + %o7],	%i1
	sir	0x0EE6
	ldsb	[%l7 + 0x5C],	%i7
	add	%g4,	0x0456,	%l4
	fzeros	%f13
	stb	%o4,	[%l7 + 0x0D]
	ldx	[%l7 + 0x38],	%o6
	subc	%i2,	%l1,	%l2
	sth	%i5,	[%l7 + 0x68]
	or	%l0,	0x1138,	%l6
	umulcc	%o0,	0x097A,	%i0
	fxor	%f10,	%f26,	%f22
	smulcc	%g1,	%o1,	%o5
	movge	%xcc,	%l3,	%o3
	fpack32	%f16,	%f14,	%f18
	xor	%o7,	%g2,	%i4
	fmovse	%icc,	%f25,	%f10
	stx	%i6,	[%l7 + 0x70]
	fabss	%f25,	%f0
	mulscc	%l5,	%g3,	%g7
	movre	%i3,	%g6,	%g5
	andn	%i1,	%o2,	%g4
	movl	%xcc,	%l4,	%o4
	fmovscs	%xcc,	%f13,	%f11
	srl	%o6,	0x05,	%i7
	mulx	%i2,	%l2,	%i5
	edge32n	%l1,	%l0,	%o0
	fnegs	%f21,	%f3
	sllx	%l6,	0x18,	%g1
	edge32n	%o1,	%i0,	%l3
	movpos	%xcc,	%o3,	%o5
	orn	%o7,	0x18A6,	%g2
	fmovdcs	%xcc,	%f19,	%f1
	movneg	%icc,	%i6,	%l5
	fnands	%f20,	%f26,	%f18
	xor	%g3,	%i4,	%i3
	edge8l	%g7,	%g6,	%g5
	sdiv	%i1,	0x0A75,	%g4
	edge8n	%l4,	%o4,	%o6
	fmul8x16al	%f8,	%f27,	%f30
	subc	%o2,	0x0836,	%i7
	movrlez	%i2,	%i5,	%l2
	array16	%l1,	%o0,	%l6
	sub	%g1,	%o1,	%l0
	movpos	%xcc,	%i0,	%l3
	fcmpgt32	%f22,	%f22,	%o3
	ldub	[%l7 + 0x4F],	%o7
	mulscc	%o5,	0x046C,	%g2
	move	%xcc,	%i6,	%g3
	or	%i4,	%i3,	%g7
	movvc	%icc,	%g6,	%l5
	sra	%i1,	%g4,	%g5
	movvc	%icc,	%o4,	%l4
	stx	%o2,	[%l7 + 0x30]
	sdivx	%o6,	0x1D71,	%i7
	edge16	%i5,	%l2,	%l1
	subccc	%o0,	0x0152,	%i2
	xor	%g1,	%l6,	%l0
	sllx	%i0,	0x06,	%l3
	save %o1, %o7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g2,	[%l7 + 0x30]
	ld	[%l7 + 0x3C],	%f17
	movvc	%xcc,	%o3,	%g3
	fmovrde	%i6,	%f6,	%f10
	fors	%f29,	%f26,	%f22
	movgu	%xcc,	%i4,	%g7
	bshuffle	%f24,	%f20,	%f16
	orn	%i3,	0x1BB8,	%g6
	ldub	[%l7 + 0x73],	%i1
	fcmps	%fcc1,	%f1,	%f9
	edge8l	%l5,	%g4,	%o4
	sdivcc	%l4,	0x13E9,	%o2
	edge16ln	%o6,	%i7,	%i5
	movle	%xcc,	%g5,	%l2
	faligndata	%f18,	%f8,	%f4
	subcc	%o0,	0x0E7C,	%l1
	xor	%g1,	0x0AC6,	%i2
	movrlz	%l0,	0x20B,	%i0
	fcmpne16	%f16,	%f24,	%l6
	movpos	%xcc,	%o1,	%l3
	or	%o5,	0x12A3,	%g2
	stx	%o3,	[%l7 + 0x70]
	ldd	[%l7 + 0x58],	%g2
	movvs	%xcc,	%i6,	%i4
	restore %g7, 0x1D2E, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f24,	%f22
	movn	%icc,	%g6,	%i1
	faligndata	%f0,	%f28,	%f4
	and	%l5,	%g4,	%o4
	fmovrslez	%i3,	%f22,	%f20
	ldsw	[%l7 + 0x3C],	%o2
	sdiv	%o6,	0x0EA8,	%i7
	xnor	%l4,	%g5,	%i5
	umulcc	%l2,	0x0C35,	%o0
	fnors	%f23,	%f15,	%f18
	fnegd	%f2,	%f4
	addcc	%l1,	%i2,	%l0
	sra	%i0,	0x1D,	%g1
	xnorcc	%o1,	0x1793,	%l3
	srlx	%l6,	0x07,	%o5
	srl	%g2,	%g3,	%o3
	sth	%i4,	[%l7 + 0x0C]
	addccc	%g7,	%i6,	%o7
	fone	%f22
	addccc	%i1,	0x12A7,	%g6
	sir	0x0D43
	save %g4, 0x0BCD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l5,	0x1EC,	%i3
	fandnot1	%f30,	%f16,	%f0
	orn	%o2,	0x0EB4,	%i7
	addc	%l4,	%o6,	%g5
	mulx	%l2,	%i5,	%l1
	ldx	[%l7 + 0x78],	%i2
	umulcc	%o0,	%l0,	%g1
	edge16n	%o1,	%l3,	%l6
	sll	%o5,	%i0,	%g3
	edge16ln	%g2,	%i4,	%g7
	sethi	0x1DB1,	%i6
	srax	%o3,	%i1,	%o7
	udiv	%g4,	0x012A,	%o4
	fmovs	%f1,	%f23
	subcc	%l5,	0x00B1,	%g6
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	edge16	%o6,	%g5,	%l4
	orn	%i5,	%l1,	%i2
	lduw	[%l7 + 0x08],	%o0
	fmovscs	%icc,	%f18,	%f21
	sll	%l2,	%l0,	%o1
	edge8n	%l3,	%g1,	%o5
	umul	%i0,	%g3,	%g2
	ldsb	[%l7 + 0x53],	%i4
	array8	%l6,	%g7,	%i6
	fnot1	%f20,	%f4
	movrlez	%o3,	0x08B,	%i1
	movrgz	%o7,	%o4,	%l5
	fmovrse	%g6,	%f12,	%f11
	movn	%xcc,	%g4,	%i7
	srl	%o2,	0x08,	%i3
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%g5
	sth	%o6,	[%l7 + 0x34]
	fands	%f14,	%f23,	%f23
	alignaddr	%l4,	%l1,	%i2
	movg	%icc,	%o0,	%i5
	movrne	%l0,	0x31D,	%l2
	movvc	%xcc,	%l3,	%o1
	movn	%icc,	%g1,	%o5
	movleu	%icc,	%i0,	%g3
	sub	%g2,	%i4,	%l6
	edge8	%g7,	%o3,	%i1
	movvs	%xcc,	%o7,	%o4
	movrlez	%i6,	0x215,	%l5
	edge32l	%g4,	%i7,	%g6
	ldd	[%l7 + 0x28],	%f28
	movcs	%icc,	%o2,	%i3
	addccc	%g5,	%o6,	%l4
	movvc	%icc,	%i2,	%o0
	array32	%i5,	%l1,	%l0
	fmul8x16al	%f7,	%f30,	%f16
	mulscc	%l2,	%o1,	%g1
	fzero	%f12
	movg	%icc,	%l3,	%i0
	edge16	%g3,	%g2,	%o5
	sethi	0x068C,	%i4
	movge	%xcc,	%g7,	%o3
	fmovsa	%icc,	%f21,	%f12
	movg	%icc,	%i1,	%l6
	ldsw	[%l7 + 0x68],	%o4
	movle	%xcc,	%o7,	%l5
	fmovrsgez	%g4,	%f3,	%f1
	xnor	%i6,	0x1428,	%i7
	edge8l	%g6,	%o2,	%g5
	fzeros	%f14
	sdivcc	%i3,	0x1242,	%o6
	xor	%l4,	%i2,	%i5
	edge8	%l1,	%o0,	%l2
	addccc	%o1,	0x142F,	%l0
	array8	%g1,	%l3,	%g3
	fmovsa	%icc,	%f5,	%f16
	srlx	%i0,	0x1E,	%g2
	subcc	%o5,	%i4,	%g7
	array8	%i1,	%o3,	%o4
	edge32ln	%l6,	%o7,	%l5
	fnor	%f18,	%f24,	%f16
	edge16l	%i6,	%i7,	%g4
	fnegs	%f11,	%f23
	srax	%g6,	%g5,	%i3
	edge16n	%o6,	%l4,	%o2
	andn	%i5,	0x0C24,	%l1
	udivcc	%i2,	0x1876,	%o0
	movcc	%icc,	%l2,	%o1
	movrne	%l0,	%l3,	%g1
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%g3
	st	%f28,	[%l7 + 0x74]
	subcc	%i0,	%g2,	%i4
	ldsh	[%l7 + 0x1A],	%o5
	add	%i1,	0x0E8D,	%g7
	edge8n	%o4,	%l6,	%o7
	movgu	%xcc,	%o3,	%l5
	fmovdg	%icc,	%f12,	%f16
	lduw	[%l7 + 0x6C],	%i7
	xor	%g4,	0x1979,	%g6
	udivcc	%i6,	0x125E,	%g5
	edge16l	%i3,	%o6,	%o2
	movrlz	%i5,	0x27A,	%l4
	fzeros	%f1
	addcc	%i2,	0x130C,	%o0
	fmovdge	%xcc,	%f20,	%f0
	fmovscs	%xcc,	%f22,	%f29
	udivcc	%l2,	0x138A,	%o1
	movle	%icc,	%l0,	%l3
	ld	[%l7 + 0x7C],	%f20
	alignaddr	%g1,	%g3,	%l1
	edge8n	%g2,	%i4,	%i0
	edge8	%o5,	%i1,	%g7
	fmovdne	%icc,	%f19,	%f24
	movn	%icc,	%l6,	%o4
	mova	%icc,	%o3,	%l5
	stb	%i7,	[%l7 + 0x2F]
	fmovdg	%icc,	%f18,	%f14
	movneg	%xcc,	%o7,	%g6
	subcc	%g4,	%g5,	%i6
	lduh	[%l7 + 0x26],	%o6
	movrlez	%i3,	%o2,	%l4
	xor	%i5,	%o0,	%i2
	stw	%l2,	[%l7 + 0x70]
	alignaddr	%l0,	%o1,	%g1
	ldx	[%l7 + 0x68],	%g3
	std	%f8,	[%l7 + 0x68]
	srlx	%l3,	%g2,	%i4
	movvc	%icc,	%l1,	%i0
	fcmpne16	%f4,	%f26,	%o5
	udivcc	%i1,	0x101F,	%g7
	fcmpd	%fcc3,	%f14,	%f8
	fxnor	%f30,	%f14,	%f0
	fmovrdgez	%l6,	%f14,	%f14
	movge	%xcc,	%o4,	%l5
	fnot2	%f18,	%f0
	edge32l	%o3,	%o7,	%i7
	sll	%g6,	0x00,	%g4
	movrlez	%i6,	0x24A,	%g5
	restore %i3, %o2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc2,	%f23,	%f14
	movrne	%i5,	0x002,	%o0
	srlx	%i2,	%o6,	%l2
	ldd	[%l7 + 0x40],	%f22
	movvs	%icc,	%o1,	%g1
	movvs	%icc,	%l0,	%g3
	ldsb	[%l7 + 0x42],	%g2
	fandnot2	%f0,	%f24,	%f30
	subccc	%i4,	0x003B,	%l3
	nop
	set	0x3C, %g6
	lduh	[%l7 + %g6],	%i0
	fxnor	%f6,	%f12,	%f12
	edge16	%l1,	%o5,	%g7
	xnorcc	%l6,	0x0BDD,	%o4
	movrne	%l5,	0x0DA,	%i1
	fmovdpos	%icc,	%f26,	%f18
	fmovsneg	%icc,	%f23,	%f2
	movvs	%icc,	%o7,	%o3
	ldd	[%l7 + 0x10],	%i6
	mova	%xcc,	%g6,	%i6
	fmovrslz	%g5,	%f20,	%f27
	umul	%g4,	0x1801,	%i3
	add	%l4,	%i5,	%o2
	fmovdn	%icc,	%f3,	%f2
	save %i2, 0x0CF5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o6,	%o1
	fcmpne32	%f24,	%f10,	%l2
	fxor	%f20,	%f10,	%f2
	ldx	[%l7 + 0x58],	%l0
	smul	%g1,	%g3,	%g2
	nop
	set	0x4A, %l3
	sth	%i4,	[%l7 + %l3]
	edge16l	%l3,	%l1,	%o5
	sethi	0x1110,	%g7
	fmovdle	%icc,	%f21,	%f5
	alignaddr	%l6,	%i0,	%l5
	xnor	%i1,	0x07F8,	%o4
	movpos	%xcc,	%o7,	%i7
	orn	%g6,	%i6,	%g5
	save %o3, %g4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i5,	%l4
	movvc	%icc,	%o2,	%o0
	fnor	%f0,	%f12,	%f14
	fornot1s	%f27,	%f3,	%f28
	movvs	%icc,	%i2,	%o1
	fmovdleu	%icc,	%f31,	%f25
	sll	%l2,	0x05,	%o6
	edge8n	%l0,	%g1,	%g2
	ldsb	[%l7 + 0x68],	%g3
	movl	%icc,	%l3,	%l1
	mova	%xcc,	%i4,	%g7
	srl	%o5,	%l6,	%l5
	fnegs	%f0,	%f27
	edge8ln	%i0,	%o4,	%o7
	or	%i7,	%g6,	%i6
	std	%f12,	[%l7 + 0x10]
	fmovsleu	%icc,	%f2,	%f16
	ld	[%l7 + 0x48],	%f5
	lduh	[%l7 + 0x5A],	%g5
	nop
	set	0x24, %l1
	ldsw	[%l7 + %l1],	%i1
	movvs	%icc,	%o3,	%g4
	smul	%i5,	%l4,	%i3
	movrne	%o0,	%i2,	%o2
	movrgz	%o1,	%o6,	%l0
	movge	%xcc,	%l2,	%g2
	fandnot2s	%f0,	%f26,	%f23
	sll	%g1,	%g3,	%l1
	addccc	%i4,	%l3,	%o5
	fmovrdlez	%g7,	%f30,	%f18
	movrgz	%l5,	0x13C,	%l6
	std	%f26,	[%l7 + 0x08]
	ldd	[%l7 + 0x20],	%i0
	fmovdcs	%icc,	%f19,	%f20
	fmovdn	%icc,	%f0,	%f20
	srl	%o4,	0x09,	%o7
	fands	%f13,	%f6,	%f24
	orn	%g6,	%i6,	%i7
	udivx	%i1,	0x0D44,	%o3
	edge32l	%g5,	%g4,	%i5
	ldsb	[%l7 + 0x10],	%i3
	udivcc	%l4,	0x0ABF,	%i2
	movrlez	%o0,	0x3C1,	%o2
	edge32ln	%o6,	%o1,	%l0
	save %g2, 0x0CA4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l2,	%l1,	%g3
	nop
	set	0x0B, %o4
	ldub	[%l7 + %o4],	%l3
	subcc	%i4,	%o5,	%g7
	fmovrdlez	%l5,	%f24,	%f10
	fpmerge	%f3,	%f2,	%f4
	edge8n	%i0,	%l6,	%o4
	fabss	%f31,	%f26
	xor	%g6,	%i6,	%i7
	fmovsgu	%xcc,	%f4,	%f25
	array16	%o7,	%o3,	%i1
	ldd	[%l7 + 0x08],	%f10
	sllx	%g4,	0x1D,	%i5
	umulcc	%g5,	0x1B5D,	%l4
	fzero	%f26
	fornot1	%f0,	%f6,	%f2
	stw	%i2,	[%l7 + 0x28]
	alignaddr	%o0,	%o2,	%o6
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%o1
	srax	%l0,	0x0E,	%i3
	fnegd	%f20,	%f28
	edge8ln	%g2,	%l2,	%g1
	movrne	%l1,	%l3,	%i4
	edge8n	%o5,	%g7,	%g3
	fmovsg	%icc,	%f13,	%f28
	srlx	%i0,	0x12,	%l6
	st	%f15,	[%l7 + 0x14]
	sdivx	%o4,	0x1856,	%g6
	nop
	set	0x0B, %i1
	ldsb	[%l7 + %i1],	%l5
	addc	%i6,	0x1E29,	%o7
	xor	%i7,	%i1,	%o3
	fmul8sux16	%f0,	%f4,	%f24
	edge8n	%g4,	%i5,	%l4
	fmovdle	%xcc,	%f16,	%f31
	fmovrdgez	%i2,	%f8,	%f24
	alignaddr	%o0,	%g5,	%o2
	edge16ln	%o6,	%l0,	%i3
	ld	[%l7 + 0x40],	%f27
	umul	%g2,	0x09FE,	%l2
	fxnors	%f15,	%f10,	%f13
	udivx	%o1,	0x00F3,	%g1
	smulcc	%l1,	0x1127,	%i4
	orcc	%o5,	%g7,	%g3
	movneg	%xcc,	%l3,	%i0
	array16	%o4,	%g6,	%l5
	fmuld8sux16	%f7,	%f28,	%f26
	add	%i6,	%o7,	%i7
	edge32l	%i1,	%o3,	%l6
	mulscc	%i5,	0x0BC9,	%l4
	sllx	%i2,	%o0,	%g4
	subccc	%g5,	%o2,	%o6
	umul	%i3,	0x14A0,	%g2
	addc	%l2,	0x04FF,	%l0
	fmuld8sux16	%f28,	%f30,	%f20
	fmovdne	%xcc,	%f5,	%f5
	nop
	set	0x28, %l0
	stx	%g1,	[%l7 + %l0]
	ldd	[%l7 + 0x48],	%l0
	faligndata	%f28,	%f12,	%f22
	ldd	[%l7 + 0x38],	%f16
	movneg	%icc,	%o1,	%o5
	edge32l	%g7,	%g3,	%i4
	movneg	%icc,	%l3,	%o4
	popc	0x0954,	%i0
	srax	%g6,	%l5,	%o7
	move	%xcc,	%i6,	%i7
	udiv	%o3,	0x0601,	%i1
	array8	%i5,	%l6,	%l4
	movrgez	%i2,	%g4,	%g5
	smul	%o0,	%o6,	%o2
	fmovrdgz	%g2,	%f2,	%f22
	movleu	%xcc,	%i3,	%l0
	fmovrdne	%g1,	%f20,	%f16
	andncc	%l1,	%o1,	%o5
	fxnors	%f12,	%f10,	%f24
	orncc	%g7,	0x08A2,	%l2
	movne	%icc,	%i4,	%l3
	umul	%o4,	0x056E,	%i0
	save %g3, %g6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o7,	0x1454,	%i6
	sth	%o3,	[%l7 + 0x48]
	srax	%i7,	0x05,	%i5
	udivx	%l6,	0x1E80,	%l4
	ld	[%l7 + 0x24],	%f2
	movcs	%icc,	%i2,	%g4
	addc	%i1,	0x02A9,	%g5
	movrlez	%o0,	%o2,	%g2
	udivx	%i3,	0x1A65,	%o6
	andncc	%g1,	%l0,	%l1
	fmovsg	%icc,	%f15,	%f25
	udivcc	%o5,	0x1A09,	%g7
	sllx	%l2,	%i4,	%l3
	move	%icc,	%o1,	%o4
	movgu	%xcc,	%i0,	%g6
	fmovscs	%xcc,	%f21,	%f7
	popc	%l5,	%g3
	srlx	%i6,	%o7,	%i7
	fmovdcc	%xcc,	%f20,	%f25
	movle	%xcc,	%i5,	%o3
	udiv	%l4,	0x07AB,	%i2
	alignaddrl	%l6,	%g4,	%g5
	fmovdle	%icc,	%f21,	%f17
	fabss	%f6,	%f4
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%i0
	movn	%icc,	%o2,	%g2
	orncc	%o0,	0x1E3C,	%i3
	fandnot1s	%f2,	%f2,	%f7
	fmovsvs	%xcc,	%f20,	%f27
	andn	%g1,	0x0FF2,	%o6
	movrgez	%l0,	%l1,	%o5
	fmovrse	%g7,	%f20,	%f8
	udivx	%i4,	0x078E,	%l2
	subc	%o1,	%l3,	%o4
	fpadd32s	%f14,	%f11,	%f31
	fmovdcs	%xcc,	%f22,	%f11
	udiv	%i0,	0x0634,	%g6
	xnor	%g3,	%l5,	%o7
	stw	%i6,	[%l7 + 0x50]
	edge8	%i7,	%i5,	%o3
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	umul	%g4,	0x10D5,	%l6
	andncc	%g5,	%i1,	%o2
	ldub	[%l7 + 0x58],	%o0
	smulcc	%i3,	%g2,	%o6
	movrlz	%g1,	0x332,	%l0
	andncc	%l1,	%o5,	%g7
	xnor	%i4,	%o1,	%l3
	st	%f0,	[%l7 + 0x18]
	fmovdcs	%icc,	%f30,	%f23
	xnor	%l2,	%o4,	%i0
	xnor	%g3,	%l5,	%g6
	udivx	%o7,	0x1EEB,	%i6
	mulx	%i5,	%i7,	%o3
	fmovse	%xcc,	%f25,	%f16
	sir	0x1014
	std	%f28,	[%l7 + 0x58]
	edge32	%l4,	%g4,	%l6
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%g5
	sra	%i2,	0x1F,	%i1
	fmovdl	%xcc,	%f22,	%f7
	ldub	[%l7 + 0x22],	%o2
	fmovd	%f30,	%f18
	sir	0x020C
	orcc	%i3,	0x12A6,	%o0
	movne	%icc,	%o6,	%g1
	edge8ln	%l0,	%g2,	%l1
	save %g7, 0x155B, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	%o1,	%l2
	stx	%l3,	[%l7 + 0x70]
	smulcc	%i0,	%o4,	%g3
	movre	%g6,	0x11C,	%l5
	fmovdl	%xcc,	%f1,	%f12
	movle	%icc,	%o7,	%i5
	edge32	%i7,	%o3,	%l4
	subc	%i6,	0x10BB,	%g4
	array16	%l6,	%i2,	%i1
	fmovsvs	%icc,	%f14,	%f9
	addccc	%o2,	%g5,	%o0
	movgu	%icc,	%i3,	%g1
	orcc	%l0,	0x0AF0,	%g2
	fmovrslez	%o6,	%f30,	%f31
	stw	%l1,	[%l7 + 0x74]
	ldub	[%l7 + 0x2C],	%o5
	umul	%i4,	0x199A,	%o1
	sth	%g7,	[%l7 + 0x7A]
	movre	%l3,	0x16F,	%l2
	movrlez	%o4,	0x362,	%g3
	srax	%i0,	%l5,	%g6
	fmovrdne	%o7,	%f14,	%f26
	fpadd32s	%f14,	%f22,	%f17
	fmovde	%icc,	%f9,	%f29
	stb	%i7,	[%l7 + 0x6B]
	mulx	%i5,	%l4,	%o3
	edge32	%g4,	%l6,	%i2
	fone	%f26
	xor	%i1,	0x0551,	%o2
	edge32ln	%g5,	%o0,	%i3
	fmovsleu	%icc,	%f15,	%f7
	fpadd16	%f28,	%f16,	%f6
	ldsb	[%l7 + 0x4C],	%i6
	umul	%g1,	%l0,	%g2
	smulcc	%o6,	0x1E80,	%l1
	movre	%o5,	0x393,	%i4
	ld	[%l7 + 0x18],	%f17
	fmovdleu	%icc,	%f14,	%f25
	movn	%xcc,	%g7,	%l3
	fmovsg	%icc,	%f12,	%f30
	movg	%icc,	%o1,	%l2
	sll	%o4,	%i0,	%g3
	xor	%l5,	%o7,	%i7
	movrne	%g6,	0x3B6,	%i5
	udivcc	%l4,	0x1ECB,	%g4
	fpack32	%f8,	%f4,	%f12
	sub	%o3,	%l6,	%i2
	fones	%f27
	movge	%icc,	%o2,	%g5
	fcmpes	%fcc0,	%f0,	%f9
	fmovdgu	%icc,	%f7,	%f31
	ldd	[%l7 + 0x48],	%f2
	fnot1	%f14,	%f28
	sdiv	%i1,	0x1E46,	%i3
	addcc	%o0,	0x0216,	%g1
	st	%f3,	[%l7 + 0x78]
	movn	%xcc,	%i6,	%l0
	fmovrdlz	%o6,	%f4,	%f0
	nop
	set	0x50, %o3
	stx	%l1,	[%l7 + %o3]
	sllx	%o5,	%g2,	%i4
	subccc	%g7,	0x1291,	%l3
	srax	%l2,	%o4,	%i0
	mova	%xcc,	%o1,	%g3
	addc	%o7,	%l5,	%i7
	ldsw	[%l7 + 0x5C],	%g6
	fmovsge	%icc,	%f19,	%f19
	andncc	%i5,	%g4,	%l4
	ldd	[%l7 + 0x18],	%i6
	andncc	%i2,	%o2,	%g5
	sdivx	%o3,	0x144A,	%i3
	movleu	%xcc,	%i1,	%o0
	sethi	0x1B21,	%g1
	fpack16	%f26,	%f11
	std	%f6,	[%l7 + 0x78]
	edge16l	%l0,	%o6,	%i6
	movl	%xcc,	%o5,	%g2
	srlx	%l1,	%g7,	%l3
	ldub	[%l7 + 0x63],	%i4
	andncc	%l2,	%o4,	%o1
	edge8n	%g3,	%i0,	%l5
	smulcc	%i7,	0x172F,	%o7
	edge8	%g6,	%i5,	%l4
	subc	%g4,	0x1914,	%i2
	stb	%o2,	[%l7 + 0x7F]
	movg	%xcc,	%l6,	%o3
	udivx	%g5,	0x0A68,	%i3
	fcmple16	%f22,	%f6,	%i1
	fands	%f31,	%f21,	%f26
	alignaddrl	%g1,	%o0,	%o6
	alignaddrl	%i6,	%o5,	%g2
	movcs	%icc,	%l0,	%l1
	movge	%icc,	%l3,	%i4
	umulcc	%l2,	%o4,	%o1
	movneg	%icc,	%g7,	%i0
	orcc	%l5,	%i7,	%o7
	andn	%g3,	0x0E37,	%g6
	addcc	%i5,	%l4,	%g4
	edge16ln	%i2,	%o2,	%l6
	umulcc	%o3,	%i3,	%g5
	edge8ln	%i1,	%o0,	%g1
	stw	%o6,	[%l7 + 0x74]
	fmovdgu	%xcc,	%f16,	%f16
	andncc	%i6,	%o5,	%l0
	sdivcc	%l1,	0x1DE7,	%l3
	edge32l	%i4,	%g2,	%o4
	fmovsn	%xcc,	%f23,	%f8
	restore %o1, %g7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l5,	%i7
	ld	[%l7 + 0x2C],	%f12
	ld	[%l7 + 0x64],	%f11
	andn	%o7,	0x0E8F,	%g3
	movne	%icc,	%i0,	%g6
	udiv	%i5,	0x0806,	%l4
	save %i2, %o2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g4,	0x18C6,	%i3
	fmovdneg	%xcc,	%f7,	%f13
	fcmped	%fcc3,	%f26,	%f0
	edge16n	%g5,	%o3,	%o0
	smulcc	%g1,	%o6,	%i6
	fcmple16	%f0,	%f28,	%o5
	move	%xcc,	%i1,	%l0
	movgu	%xcc,	%l3,	%i4
	edge32	%g2,	%o4,	%l1
	xor	%o1,	%g7,	%l5
	fornot1	%f10,	%f16,	%f18
	edge8	%i7,	%l2,	%o7
	ldsb	[%l7 + 0x1D],	%i0
	srax	%g6,	0x18,	%g3
	addccc	%i5,	0x0821,	%i2
	movn	%xcc,	%l4,	%l6
	fzero	%f0
	movl	%icc,	%o2,	%i3
	movrlez	%g5,	%g4,	%o0
	fornot2	%f26,	%f12,	%f28
	edge8n	%g1,	%o6,	%o3
	movvs	%xcc,	%i6,	%o5
	movge	%icc,	%l0,	%i1
	ldd	[%l7 + 0x08],	%i4
	xor	%g2,	0x18FB,	%l3
	srax	%o4,	0x0F,	%o1
	array16	%g7,	%l1,	%l5
	movg	%xcc,	%i7,	%o7
	subccc	%i0,	%l2,	%g6
	addcc	%i5,	0x043D,	%i2
	udiv	%g3,	0x05A1,	%l4
	srl	%l6,	0x0A,	%i3
	movrne	%g5,	0x240,	%g4
	sra	%o2,	%g1,	%o0
	fmovscs	%icc,	%f21,	%f24
	save %o6, 0x0F22, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f26,	%f4
	lduh	[%l7 + 0x0E],	%i6
	movle	%xcc,	%l0,	%i1
	fmovspos	%xcc,	%f19,	%f29
	srl	%o5,	0x15,	%g2
	xorcc	%l3,	0x157D,	%o4
	fmovdn	%xcc,	%f1,	%f23
	ldub	[%l7 + 0x7D],	%o1
	andncc	%g7,	%l1,	%l5
	sdivx	%i4,	0x15FA,	%i7
	andncc	%o7,	%i0,	%g6
	ldsb	[%l7 + 0x30],	%i5
	sir	0x0D97
	edge8n	%l2,	%i2,	%g3
	ldsb	[%l7 + 0x45],	%l6
	edge8	%i3,	%g5,	%g4
	fcmple16	%f28,	%f12,	%l4
	fmovsle	%xcc,	%f10,	%f18
	movneg	%xcc,	%o2,	%o0
	movrne	%o6,	0x0A6,	%g1
	edge16ln	%i6,	%o3,	%i1
	sdivcc	%l0,	0x0D62,	%g2
	orcc	%l3,	0x10B0,	%o5
	movleu	%xcc,	%o1,	%g7
	smulcc	%o4,	%l5,	%i4
	nop
	set	0x50, %o1
	std	%f0,	[%l7 + %o1]
	movrgz	%l1,	%o7,	%i0
	movge	%icc,	%g6,	%i5
	mova	%icc,	%l2,	%i2
	orncc	%g3,	%l6,	%i7
	xorcc	%g5,	0x1C8E,	%g4
	movneg	%icc,	%l4,	%o2
	fcmple16	%f22,	%f18,	%o0
	umulcc	%o6,	%g1,	%i6
	edge16n	%o3,	%i3,	%l0
	movneg	%icc,	%g2,	%i1
	add	%o5,	%o1,	%l3
	edge16ln	%o4,	%l5,	%g7
	movg	%icc,	%i4,	%o7
	andcc	%l1,	%i0,	%i5
	subcc	%l2,	%g6,	%g3
	movvs	%icc,	%l6,	%i2
	andcc	%g5,	%g4,	%i7
	edge32	%l4,	%o0,	%o2
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	udiv	%i6,	0x035D,	%o3
	fmul8x16	%f6,	%f30,	%f8
	fmovrsgez	%l0,	%f22,	%f26
	srlx	%i3,	%i1,	%g2
	umul	%o5,	0x1865,	%l3
	stb	%o1,	[%l7 + 0x0C]
	addccc	%l5,	%g7,	%o4
	std	%f24,	[%l7 + 0x20]
	ldub	[%l7 + 0x3C],	%o7
	popc	%i4,	%i0
	lduw	[%l7 + 0x78],	%i5
	ldsw	[%l7 + 0x0C],	%l1
	addcc	%g6,	%g3,	%l2
	udivx	%l6,	0x042F,	%g5
	movvs	%icc,	%i2,	%g4
	fmovrsne	%i7,	%f21,	%f22
	fmovsgu	%xcc,	%f12,	%f4
	xnor	%l4,	0x08D1,	%o2
	movleu	%icc,	%o0,	%o6
	udivcc	%g1,	0x05A2,	%i6
	edge16l	%l0,	%i3,	%i1
	fmovdl	%xcc,	%f8,	%f14
	ldd	[%l7 + 0x40],	%f6
	movrne	%g2,	0x2A1,	%o3
	fmovscs	%icc,	%f4,	%f25
	movneg	%xcc,	%o5,	%o1
	xorcc	%l5,	0x033B,	%l3
	fmovsg	%xcc,	%f13,	%f2
	movrgz	%g7,	%o4,	%o7
	fmovdg	%xcc,	%f31,	%f1
	udivcc	%i4,	0x0F26,	%i0
	sub	%l1,	%g6,	%i5
	fxors	%f1,	%f15,	%f1
	fnors	%f8,	%f8,	%f17
	andncc	%g3,	%l6,	%g5
	sll	%i2,	%g4,	%i7
	movrne	%l4,	0x12A,	%o2
	sll	%l2,	0x08,	%o0
	srax	%g1,	0x17,	%o6
	alignaddr	%l0,	%i3,	%i1
	restore %g2, %i6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o1,	0x0F0F,	%o5
	movrlez	%l3,	0x2E8,	%g7
	fnot2s	%f26,	%f16
	fnands	%f19,	%f12,	%f0
	edge16ln	%l5,	%o4,	%o7
	array8	%i0,	%i4,	%l1
	subccc	%g6,	%i5,	%l6
	movcs	%icc,	%g3,	%i2
	orncc	%g4,	0x182A,	%g5
	fnegd	%f18,	%f28
	fexpand	%f4,	%f20
	sir	0x0D7C
	ldsh	[%l7 + 0x3E],	%i7
	movcc	%icc,	%o2,	%l2
	orncc	%l4,	0x184A,	%g1
	fxors	%f24,	%f26,	%f2
	fcmpne16	%f6,	%f18,	%o6
	edge32	%o0,	%l0,	%i1
	movpos	%xcc,	%g2,	%i6
	mulx	%o3,	%i3,	%o5
	subc	%o1,	%l3,	%l5
	movrgz	%o4,	0x2DF,	%o7
	edge32ln	%g7,	%i0,	%i4
	andn	%l1,	0x096B,	%g6
	fsrc2s	%f31,	%f22
	array32	%l6,	%i5,	%g3
	sdivcc	%i2,	0x175E,	%g4
	fmovrsgez	%g5,	%f1,	%f3
	move	%xcc,	%o2,	%i7
	xnor	%l2,	0x1C88,	%l4
	sethi	0x1664,	%g1
	fcmps	%fcc1,	%f6,	%f27
	movre	%o6,	0x0A3,	%l0
	addc	%o0,	%i1,	%i6
	st	%f23,	[%l7 + 0x14]
	popc	0x143B,	%o3
	movrne	%i3,	%o5,	%g2
	fornot1s	%f13,	%f15,	%f31
	srax	%o1,	0x00,	%l3
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	sdivcc	%o7,	0x10E6,	%g7
	fandnot1	%f16,	%f4,	%f2
	movneg	%icc,	%i4,	%l1
	save %i0, 0x0CA6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i5,	%l6,	%i2
	edge16ln	%g3,	%g4,	%o2
	addc	%i7,	0x14E7,	%g5
	movvc	%xcc,	%l4,	%l2
	fmovdcc	%icc,	%f5,	%f27
	fmovdg	%xcc,	%f17,	%f18
	edge32l	%o6,	%l0,	%g1
	fmovs	%f15,	%f31
	fexpand	%f24,	%f16
	orcc	%o0,	0x0786,	%i1
	ldsb	[%l7 + 0x32],	%i6
	srl	%i3,	0x19,	%o5
	fexpand	%f6,	%f30
	edge8l	%g2,	%o1,	%o3
	subcc	%l5,	0x1423,	%l3
	xnorcc	%o4,	%o7,	%g7
	movn	%xcc,	%i4,	%l1
	fmovdcc	%icc,	%f0,	%f8
	andncc	%g6,	%i5,	%l6
	save %i2, 0x0A68, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g4,	%i0,	%o2
	fmuld8sux16	%f10,	%f30,	%f18
	xnor	%i7,	0x143A,	%g5
	movle	%icc,	%l2,	%l4
	ld	[%l7 + 0x28],	%f12
	sethi	0x0B37,	%l0
	fcmple32	%f26,	%f4,	%g1
	lduh	[%l7 + 0x54],	%o0
	fmovdle	%xcc,	%f11,	%f0
	fcmpeq16	%f2,	%f6,	%o6
	srlx	%i1,	0x04,	%i3
	or	%i6,	0x1081,	%g2
	movn	%icc,	%o1,	%o3
	subc	%l5,	0x1FBC,	%l3
	umulcc	%o5,	0x052B,	%o4
	st	%f2,	[%l7 + 0x30]
	sdivcc	%g7,	0x1064,	%i4
	fpsub16s	%f1,	%f28,	%f10
	array8	%l1,	%g6,	%o7
	lduh	[%l7 + 0x1C],	%i5
	fpadd32s	%f21,	%f28,	%f20
	subcc	%l6,	%g3,	%g4
	fmul8x16	%f5,	%f0,	%f12
	addc	%i2,	0x1708,	%i0
	ldd	[%l7 + 0x68],	%o2
	mulx	%g5,	0x06F7,	%l2
	xor	%i7,	0x059E,	%l4
	stx	%g1,	[%l7 + 0x10]
	xnor	%o0,	%o6,	%i1
	subc	%l0,	0x1AD3,	%i6
	sdiv	%i3,	0x1945,	%o1
	fandnot1	%f16,	%f6,	%f30
	ldd	[%l7 + 0x50],	%g2
	ldsh	[%l7 + 0x76],	%o3
	fmovdcs	%icc,	%f30,	%f10
	fmovrdne	%l3,	%f30,	%f16
	edge16l	%l5,	%o4,	%g7
	edge8ln	%i4,	%l1,	%o5
	array8	%o7,	%i5,	%l6
	array8	%g3,	%g4,	%i2
	fmovsg	%xcc,	%f27,	%f16
	movrlez	%i0,	0x192,	%g6
	fmul8x16al	%f12,	%f28,	%f28
	fexpand	%f9,	%f0
	and	%o2,	%l2,	%i7
	movrgez	%g5,	%l4,	%g1
	xnor	%o6,	%o0,	%l0
	sllx	%i1,	%i6,	%i3
	move	%xcc,	%o1,	%o3
	srlx	%l3,	%g2,	%o4
	fcmpd	%fcc2,	%f4,	%f28
	nop
	set	0x18, %g3
	std	%f28,	[%l7 + %g3]
	std	%f2,	[%l7 + 0x58]
	fors	%f13,	%f5,	%f30
	movre	%l5,	0x13A,	%g7
	fmul8sux16	%f8,	%f10,	%f24
	movge	%xcc,	%i4,	%l1
	andncc	%o7,	%i5,	%o5
	ldsw	[%l7 + 0x34],	%l6
	movcc	%xcc,	%g3,	%g4
	faligndata	%f16,	%f26,	%f26
	or	%i2,	%i0,	%o2
	stx	%g6,	[%l7 + 0x38]
	add	%i7,	%l2,	%l4
	movrlz	%g1,	%o6,	%o0
	or	%l0,	%i1,	%i6
	sra	%i3,	%o1,	%g5
	fpmerge	%f7,	%f27,	%f12
	subcc	%o3,	0x110A,	%l3
	addc	%g2,	%o4,	%g7
	sdivcc	%l5,	0x18B0,	%i4
	lduh	[%l7 + 0x0A],	%o7
	add	%l1,	%i5,	%l6
	sdiv	%o5,	0x01CB,	%g3
	movrgez	%i2,	0x23E,	%i0
	restore %g4, %o2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i7,	%l2
	nop
	set	0x20, %l2
	std	%f20,	[%l7 + %l2]
	addc	%l4,	%o6,	%g1
	fmovdleu	%xcc,	%f30,	%f31
	andcc	%o0,	0x14CA,	%l0
	srl	%i6,	0x1C,	%i1
	sdivcc	%i3,	0x1053,	%g5
	fmovrslez	%o3,	%f28,	%f31
	movcc	%icc,	%l3,	%g2
	movrgz	%o4,	0x18C,	%o1
	alignaddrl	%l5,	%i4,	%g7
	fsrc1	%f8,	%f20
	sir	0x0BBB
	ldsw	[%l7 + 0x48],	%o7
	srl	%l1,	0x17,	%l6
	edge16n	%i5,	%o5,	%i2
	movne	%xcc,	%i0,	%g3
	xnorcc	%g4,	%o2,	%i7
	and	%g6,	%l2,	%l4
	move	%xcc,	%g1,	%o6
	movneg	%xcc,	%o0,	%l0
	fandnot1s	%f29,	%f24,	%f9
	fmovscc	%xcc,	%f7,	%f2
	mulx	%i6,	%i1,	%i3
	edge8n	%g5,	%o3,	%l3
	for	%f20,	%f4,	%f2
	edge8ln	%g2,	%o1,	%o4
	and	%i4,	%l5,	%g7
	fnands	%f0,	%f21,	%f16
	nop
	set	0x40, %i0
	stx	%o7,	[%l7 + %i0]
	orcc	%l1,	%i5,	%l6
	fcmpes	%fcc2,	%f1,	%f24
	edge16l	%o5,	%i0,	%g3
	sub	%i2,	%g4,	%i7
	ldsw	[%l7 + 0x18],	%g6
	subccc	%l2,	0x074A,	%o2
	lduh	[%l7 + 0x74],	%l4
	ldd	[%l7 + 0x20],	%g0
	stb	%o6,	[%l7 + 0x24]
	ld	[%l7 + 0x1C],	%f7
	movgu	%icc,	%l0,	%o0
	xnor	%i6,	%i1,	%g5
	fmovdcs	%icc,	%f22,	%f2
	fandnot2s	%f12,	%f5,	%f21
	ldsb	[%l7 + 0x7E],	%i3
	xnor	%o3,	%g2,	%o1
	ldd	[%l7 + 0x40],	%f30
	fnands	%f30,	%f7,	%f20
	fnors	%f30,	%f8,	%f30
	edge32l	%o4,	%l3,	%i4
	srax	%g7,	%l5,	%o7
	edge16	%i5,	%l1,	%l6
	edge16	%o5,	%g3,	%i2
	srl	%i0,	0x13,	%i7
	st	%f25,	[%l7 + 0x38]
	sir	0x0DE2
	fmul8ulx16	%f10,	%f8,	%f8
	edge8l	%g4,	%g6,	%l2
	addc	%l4,	%g1,	%o6
	edge16ln	%l0,	%o0,	%i6
	movcc	%xcc,	%i1,	%g5
	movleu	%xcc,	%o2,	%i3
	movne	%xcc,	%o3,	%o1
	addc	%g2,	%l3,	%o4
	andncc	%i4,	%l5,	%o7
	srl	%g7,	%i5,	%l6
	fmovsne	%icc,	%f15,	%f21
	sllx	%l1,	%o5,	%g3
	xor	%i2,	%i0,	%i7
	edge16l	%g6,	%l2,	%g4
	setx loop_102, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_102: 	fmovrse	%l0,	%f1,	%f21
	save %o6, 0x0B86, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i1,	0x112E,	%g5
	edge16n	%o2,	%i3,	%o3
	move	%icc,	%o0,	%o1
	movrlz	%l3,	%g2,	%i4
	edge32n	%o4,	%l5,	%g7
	movleu	%xcc,	%o7,	%l6
	edge16l	%i5,	%o5,	%g3
	ldub	[%l7 + 0x09],	%l1
	movvs	%xcc,	%i2,	%i7
	alignaddr	%g6,	%l2,	%i0
	subccc	%g1,	0x00DF,	%g4
	array32	%l4,	%l0,	%o6
	edge32n	%i6,	%i1,	%o2
	siam	0x5
	array16	%i3,	%g5,	%o0
	restore %o3, %l3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f8,	%f12
	stx	%g2,	[%l7 + 0x40]
	xor	%i4,	0x0D05,	%o4
	umul	%g7,	%l5,	%o7
	umulcc	%l6,	%o5,	%i5
	movpos	%xcc,	%g3,	%i2
	fcmpne32	%f24,	%f18,	%i7
	fmovsvs	%xcc,	%f18,	%f24
	ldd	[%l7 + 0x28],	%f16
	ldsh	[%l7 + 0x56],	%l1
	fmovsvc	%icc,	%f21,	%f20
	mova	%xcc,	%g6,	%l2
	mova	%icc,	%g1,	%i0
	addcc	%g4,	0x1DAB,	%l4
	fmul8x16al	%f24,	%f8,	%f0
	nop
	set	0x2E, %o0
	ldsh	[%l7 + %o0],	%o6
	subc	%i6,	0x11D2,	%l0
	st	%f0,	[%l7 + 0x0C]
	stx	%o2,	[%l7 + 0x70]
	smulcc	%i3,	0x1590,	%g5
	sethi	0x10B5,	%i1
	lduh	[%l7 + 0x62],	%o3
	st	%f28,	[%l7 + 0x7C]
	movn	%xcc,	%l3,	%o1
	sdivcc	%o0,	0x0C35,	%i4
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%o4
	array32	%g7,	%l5,	%o7
	edge32ln	%g2,	%o5,	%l6
	fmul8sux16	%f10,	%f6,	%f8
	srlx	%i5,	%g3,	%i7
	ldd	[%l7 + 0x78],	%f8
	mulx	%l1,	0x1B75,	%g6
	subccc	%l2,	0x070A,	%i2
	stb	%g1,	[%l7 + 0x75]
	srax	%i0,	%l4,	%g4
	fcmpgt16	%f16,	%f2,	%i6
	alignaddr	%l0,	%o2,	%i3
	addc	%o6,	0x0F32,	%g5
	ld	[%l7 + 0x74],	%f28
	movrne	%i1,	0x3CD,	%o3
	fnot2	%f30,	%f22
	fornot1	%f4,	%f24,	%f14
	fxors	%f12,	%f13,	%f3
	umulcc	%o1,	0x0FEA,	%o0
	ldsb	[%l7 + 0x7A],	%l3
	sra	%i4,	0x0D,	%g7
	ldx	[%l7 + 0x40],	%o4
	mova	%icc,	%o7,	%l5
	movre	%o5,	%g2,	%i5
	movrlez	%g3,	0x1EF,	%l6
	xnorcc	%i7,	%l1,	%l2
	or	%i2,	%g1,	%i0
	edge16	%l4,	%g6,	%i6
	edge32	%l0,	%o2,	%g4
	xor	%i3,	0x03A7,	%o6
	smul	%i1,	%o3,	%g5
	addccc	%o0,	0x1D51,	%l3
	stx	%i4,	[%l7 + 0x70]
	movrgez	%g7,	%o1,	%o4
	smulcc	%l5,	0x1188,	%o5
	edge16ln	%o7,	%i5,	%g3
	fpack16	%f8,	%f1
	movrgz	%g2,	0x0B7,	%i7
	mulx	%l6,	0x1928,	%l2
	array32	%i2,	%g1,	%i0
	fmovd	%f18,	%f0
	fands	%f29,	%f10,	%f10
	fmovdl	%xcc,	%f18,	%f23
	edge8	%l4,	%g6,	%l1
	sir	0x1ABB
	sub	%i6,	0x0527,	%o2
	fmovrse	%g4,	%f10,	%f16
	movneg	%icc,	%l0,	%i3
	edge16	%i1,	%o3,	%o6
	orn	%o0,	0x01C8,	%l3
	fmovdneg	%xcc,	%f7,	%f25
	fsrc2s	%f13,	%f2
	alignaddrl	%g5,	%i4,	%g7
	andncc	%o1,	%o4,	%l5
	orncc	%o5,	0x15F4,	%i5
	fmovdcc	%xcc,	%f27,	%f9
	xnor	%o7,	0x0C1E,	%g2
	st	%f22,	[%l7 + 0x54]
	stb	%i7,	[%l7 + 0x57]
	ldx	[%l7 + 0x58],	%g3
	xorcc	%l6,	%i2,	%g1
	mulscc	%l2,	0x101A,	%l4
	lduh	[%l7 + 0x10],	%i0
	or	%l1,	%i6,	%o2
	fones	%f9
	setx loop_103, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_103: 	xor	%i3,	%i1,	%o6
	sdivcc	%o0,	0x1DA0,	%l3
	movvs	%xcc,	%o3,	%g5
	edge16l	%g7,	%o1,	%i4
	xnorcc	%o4,	%l5,	%o5
	addccc	%o7,	%i5,	%g2
	movneg	%xcc,	%g3,	%i7
	movcc	%icc,	%i2,	%l6
	orn	%g1,	%l2,	%i0
	umul	%l4,	0x0E0F,	%i6
	edge16	%l1,	%g4,	%o2
	fmovsle	%xcc,	%f29,	%f1
	movn	%icc,	%l0,	%i3
	movn	%icc,	%i1,	%o6
	addcc	%o0,	%l3,	%g6
	edge8	%o3,	%g7,	%o1
	edge8	%g5,	%o4,	%i4
	fcmpgt32	%f16,	%f16,	%l5
	movneg	%xcc,	%o5,	%i5
	srlx	%o7,	%g2,	%i7
	movgu	%icc,	%g3,	%l6
	fnot2	%f28,	%f0
	movneg	%xcc,	%g1,	%i2
	alignaddr	%l2,	%l4,	%i0
	udivcc	%i6,	0x0759,	%g4
	udiv	%o2,	0x12E5,	%l0
	edge32l	%l1,	%i3,	%i1
	movg	%icc,	%o6,	%o0
	fmul8ulx16	%f20,	%f4,	%f4
	std	%f8,	[%l7 + 0x58]
	sth	%l3,	[%l7 + 0x6C]
	orncc	%o3,	0x120B,	%g6
	xor	%o1,	0x162F,	%g5
	ldub	[%l7 + 0x41],	%o4
	addcc	%i4,	0x0B27,	%l5
	lduw	[%l7 + 0x2C],	%g7
	stb	%i5,	[%l7 + 0x1C]
	ldx	[%l7 + 0x38],	%o5
	srax	%g2,	%i7,	%g3
	stw	%o7,	[%l7 + 0x08]
	andn	%l6,	%g1,	%l2
	fmovdcs	%xcc,	%f25,	%f27
	save %l4, 0x0A4C, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f8,	%f14,	%f26
	ldx	[%l7 + 0x48],	%i6
	lduw	[%l7 + 0x30],	%g4
	fnegd	%f26,	%f4
	fsrc1	%f28,	%f8
	xnorcc	%o2,	%i0,	%l1
	movge	%xcc,	%l0,	%i1
	movrne	%i3,	%o0,	%o6
	fnegs	%f19,	%f29
	array8	%l3,	%g6,	%o1
	movvs	%icc,	%o3,	%o4
	fmovrse	%g5,	%f22,	%f18
	fcmpgt16	%f10,	%f16,	%i4
	or	%g7,	0x15A6,	%i5
	fmuld8ulx16	%f1,	%f24,	%f14
	umul	%l5,	%o5,	%i7
	edge8	%g2,	%g3,	%o7
	movrgz	%g1,	%l2,	%l6
	and	%l4,	%i6,	%g4
	mulx	%o2,	%i0,	%i2
	fpack32	%f12,	%f24,	%f24
	st	%f29,	[%l7 + 0x74]
	fabss	%f16,	%f31
	edge8n	%l1,	%i1,	%l0
	fmovdne	%icc,	%f5,	%f19
	movg	%icc,	%o0,	%o6
	add	%i3,	%l3,	%g6
	stb	%o1,	[%l7 + 0x46]
	fpadd32s	%f29,	%f4,	%f24
	sub	%o3,	%g5,	%o4
	subccc	%i4,	%g7,	%l5
	fsrc2s	%f25,	%f29
	fmovrdlz	%o5,	%f24,	%f24
	addc	%i7,	%g2,	%g3
	ld	[%l7 + 0x18],	%f30
	pdist	%f0,	%f16,	%f26
	movvs	%xcc,	%i5,	%g1
	fmovsg	%xcc,	%f25,	%f14
	edge8ln	%l2,	%l6,	%o7
	sub	%i6,	0x07A1,	%g4
	udivx	%l4,	0x1680,	%i0
	orcc	%i2,	0x0D97,	%o2
	andncc	%i1,	%l0,	%o0
	addc	%o6,	%l1,	%l3
	fmovsgu	%icc,	%f16,	%f8
	fones	%f15
	movneg	%icc,	%g6,	%i3
	xorcc	%o1,	%o3,	%g5
	smul	%o4,	0x0F97,	%g7
	edge16	%i4,	%o5,	%l5
	movrlez	%i7,	%g3,	%g2
	fcmpne32	%f12,	%f10,	%i5
	movg	%xcc,	%g1,	%l2
	smul	%l6,	0x1094,	%i6
	addcc	%g4,	0x064A,	%l4
	sll	%o7,	0x1A,	%i0
	movneg	%icc,	%i2,	%i1
	subc	%l0,	0x18B3,	%o0
	fmovsle	%icc,	%f18,	%f29
	ldub	[%l7 + 0x51],	%o2
	fmovdneg	%xcc,	%f0,	%f8
	sdivcc	%l1,	0x046C,	%o6
	ld	[%l7 + 0x2C],	%f31
	movpos	%xcc,	%g6,	%l3
	save %o1, %i3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o4,	0x1551,	%o3
	addc	%i4,	%o5,	%l5
	fmovrdlz	%i7,	%f4,	%f30
	movvc	%xcc,	%g7,	%g3
	and	%i5,	%g1,	%l2
	st	%f11,	[%l7 + 0x24]
	fpsub32s	%f19,	%f9,	%f1
	udiv	%l6,	0x1CF0,	%i6
	ld	[%l7 + 0x10],	%f11
	ldsb	[%l7 + 0x64],	%g2
	alignaddr	%g4,	%o7,	%l4
	sra	%i2,	%i0,	%i1
	movrne	%l0,	%o2,	%o0
	sllx	%o6,	%l1,	%g6
	std	%f4,	[%l7 + 0x20]
	mulscc	%l3,	0x1545,	%i3
	fors	%f0,	%f3,	%f8
	umul	%o1,	%g5,	%o3
	movle	%icc,	%o4,	%i4
	udiv	%l5,	0x090E,	%i7
	fmovrsgz	%o5,	%f13,	%f4
	movle	%xcc,	%g3,	%g7
	fpmerge	%f14,	%f18,	%f28
	edge16n	%g1,	%i5,	%l6
	edge16ln	%i6,	%l2,	%g4
	sllx	%o7,	%l4,	%i2
	movn	%icc,	%i0,	%i1
	subc	%g2,	%l0,	%o2
	fandnot2s	%f22,	%f6,	%f30
	edge16ln	%o0,	%o6,	%l1
	stw	%l3,	[%l7 + 0x28]
	movge	%icc,	%g6,	%i3
	fxnors	%f1,	%f5,	%f23
	fandnot2s	%f31,	%f31,	%f16
	movg	%icc,	%o1,	%g5
	andcc	%o3,	%i4,	%o4
	fones	%f25
	edge8	%l5,	%i7,	%o5
	movle	%xcc,	%g3,	%g1
	st	%f8,	[%l7 + 0x24]
	udiv	%g7,	0x17BF,	%i5
	movre	%l6,	0x0E9,	%l2
	movvs	%xcc,	%g4,	%o7
	fxor	%f14,	%f22,	%f10
	stx	%l4,	[%l7 + 0x38]
	movne	%xcc,	%i6,	%i2
	subccc	%i1,	%i0,	%g2
	array16	%o2,	%o0,	%o6
	xnor	%l0,	%l3,	%l1
	addcc	%i3,	0x1BDA,	%g6
	fcmps	%fcc2,	%f1,	%f22
	ldsh	[%l7 + 0x20],	%g5
	srax	%o1,	0x1C,	%o3
	lduw	[%l7 + 0x14],	%o4
	fnot1	%f2,	%f18
	stx	%i4,	[%l7 + 0x20]
	edge32n	%i7,	%o5,	%g3
	sra	%l5,	0x06,	%g7
	xor	%g1,	0x0530,	%l6
	fmovrsgz	%i5,	%f2,	%f30
	xnorcc	%l2,	0x1EDA,	%g4
	movrne	%l4,	%o7,	%i2
	ldub	[%l7 + 0x15],	%i1
	umul	%i0,	0x0770,	%g2
	fmuld8ulx16	%f13,	%f31,	%f30
	orn	%o2,	%o0,	%o6
	fmovde	%icc,	%f10,	%f20
	edge32n	%l0,	%i6,	%l3
	movn	%xcc,	%l1,	%g6
	alignaddrl	%g5,	%i3,	%o3
	siam	0x6
	ldsb	[%l7 + 0x69],	%o1
	sllx	%o4,	%i7,	%i4
	sir	0x02C7
	edge16ln	%o5,	%l5,	%g3
	ldd	[%l7 + 0x20],	%g0
	subccc	%g7,	0x0F1B,	%l6
	udiv	%i5,	0x083E,	%l2
	movn	%icc,	%l4,	%o7
	edge16n	%i2,	%g4,	%i0
	fexpand	%f21,	%f6
	movl	%icc,	%g2,	%o2
	popc	0x0CBA,	%i1
	ldd	[%l7 + 0x28],	%f26
	udivcc	%o0,	0x024C,	%l0
	ldd	[%l7 + 0x78],	%f4
	mova	%xcc,	%o6,	%l3
	movrlz	%i6,	%l1,	%g5
	fexpand	%f2,	%f16
	edge8	%i3,	%o3,	%o1
	std	%f2,	[%l7 + 0x28]
	fsrc2s	%f24,	%f16
	lduh	[%l7 + 0x1C],	%o4
	and	%i7,	%g6,	%o5
	xnor	%l5,	0x03B4,	%g3
	movre	%i4,	0x101,	%g1
	orncc	%g7,	%i5,	%l2
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%l4
	addcc	%l6,	%o7,	%i2
	movpos	%xcc,	%i0,	%g2
	srlx	%o2,	%g4,	%o0
	mulscc	%i1,	%o6,	%l0
	movvs	%icc,	%i6,	%l1
	fmovde	%xcc,	%f1,	%f11
	array32	%l3,	%i3,	%g5
	subcc	%o1,	0x04C1,	%o3
	orcc	%o4,	0x0A89,	%g6
	fpadd32s	%f10,	%f15,	%f20
	edge32	%i7,	%l5,	%g3
	ldd	[%l7 + 0x08],	%i4
	fmovsne	%xcc,	%f10,	%f13
	fmovrsgez	%o5,	%f22,	%f16
	or	%g1,	0x0688,	%i5
	sir	0x1F04
	and	%l2,	0x07D1,	%g7
	fpack16	%f14,	%f30
	ldsh	[%l7 + 0x70],	%l6
	ldd	[%l7 + 0x60],	%l4
	umul	%o7,	0x1A99,	%i0
	fmovde	%xcc,	%f29,	%f29
	addccc	%i2,	%g2,	%o2
	stw	%o0,	[%l7 + 0x7C]
	subccc	%i1,	%o6,	%g4
	orn	%i6,	%l0,	%l1
	fandnot1s	%f23,	%f14,	%f12
	fmovrde	%i3,	%f0,	%f14
	st	%f16,	[%l7 + 0x68]
	movl	%xcc,	%l3,	%o1
	sethi	0x0DDD,	%g5
	ldub	[%l7 + 0x43],	%o3
	fnot2	%f22,	%f12
	ldub	[%l7 + 0x48],	%g6
	fmovdleu	%icc,	%f11,	%f22
	movge	%icc,	%o4,	%i7
	edge32l	%g3,	%i4,	%o5
	edge32ln	%l5,	%i5,	%l2
	fmovs	%f12,	%f14
	subc	%g7,	0x043A,	%g1
	andncc	%l4,	%o7,	%l6
	addcc	%i0,	%i2,	%o2
	movcc	%xcc,	%g2,	%o0
	sra	%i1,	0x1A,	%o6
	fmul8sux16	%f30,	%f24,	%f16
	edge8n	%i6,	%l0,	%l1
	edge32	%i3,	%l3,	%o1
	edge8	%g5,	%o3,	%g6
	fnands	%f2,	%f16,	%f11
	movvs	%xcc,	%o4,	%g4
	array16	%i7,	%g3,	%i4
	fxnors	%f30,	%f3,	%f23
	fnot1	%f6,	%f8
	subc	%o5,	%i5,	%l2
	xnor	%l5,	0x1FFE,	%g1
	movgu	%xcc,	%g7,	%l4
	movrgez	%o7,	0x3AB,	%i0
	movvs	%xcc,	%i2,	%l6
	array32	%g2,	%o0,	%o2
	alignaddrl	%o6,	%i6,	%l0
	sdiv	%i1,	0x134E,	%i3
	array16	%l1,	%o1,	%g5
	xnor	%o3,	0x0D10,	%l3
	std	%f22,	[%l7 + 0x40]
	srax	%g6,	%o4,	%g4
	fmovdpos	%icc,	%f31,	%f19
	alignaddr	%i7,	%i4,	%g3
	fnors	%f13,	%f21,	%f7
	nop
	set	0x60, %l6
	sth	%o5,	[%l7 + %l6]
	fmovdn	%icc,	%f16,	%f9
	subc	%i5,	%l2,	%l5
	movvc	%xcc,	%g7,	%l4
	array16	%o7,	%i0,	%g1
	udivcc	%i2,	0x1259,	%g2
	ld	[%l7 + 0x0C],	%f24
	subc	%o0,	0x1D18,	%l6
	fzeros	%f22
	stx	%o6,	[%l7 + 0x20]
	edge8	%i6,	%l0,	%i1
	movgu	%icc,	%i3,	%l1
	sll	%o1,	%g5,	%o2
	or	%o3,	0x1BCA,	%g6
	stx	%l3,	[%l7 + 0x20]
	movrne	%g4,	0x0CE,	%i7
	movrgz	%i4,	%o4,	%g3
	fmovrdlz	%i5,	%f14,	%f24
	ld	[%l7 + 0x34],	%f12
	or	%l2,	0x0AFC,	%l5
	mulscc	%g7,	%l4,	%o7
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%i0
	fxors	%f14,	%f12,	%f21
	ldd	[%l7 + 0x60],	%f12
	ldsw	[%l7 + 0x7C],	%g1
	andncc	%i2,	%g2,	%o5
	ldsh	[%l7 + 0x6A],	%o0
	andcc	%l6,	%i6,	%o6
	fnands	%f9,	%f27,	%f12
	movleu	%xcc,	%l0,	%i3
	smul	%l1,	0x0E54,	%o1
	edge16ln	%g5,	%i1,	%o2
	sdivx	%o3,	0x0393,	%g6
	movrgz	%g4,	%l3,	%i4
	fnand	%f12,	%f24,	%f16
	edge32l	%o4,	%g3,	%i7
	fmovdg	%icc,	%f17,	%f12
	edge32n	%i5,	%l2,	%g7
	andcc	%l5,	0x0E44,	%o7
	sth	%i0,	[%l7 + 0x52]
	fmovdg	%icc,	%f18,	%f26
	ld	[%l7 + 0x4C],	%f16
	st	%f19,	[%l7 + 0x54]
	fmovsvs	%icc,	%f25,	%f2
	movrgez	%l4,	%g1,	%i2
	sdivx	%o5,	0x10F5,	%g2
	stx	%l6,	[%l7 + 0x40]
	sub	%i6,	%o0,	%o6
	fmovda	%icc,	%f12,	%f3
	array16	%l0,	%l1,	%o1
	orncc	%g5,	%i3,	%i1
	fmovdgu	%icc,	%f6,	%f1
	sdivcc	%o2,	0x0931,	%o3
	movcs	%icc,	%g6,	%g4
	lduw	[%l7 + 0x60],	%l3
	udivx	%o4,	0x1588,	%g3
	smul	%i4,	0x0742,	%i5
	sdivcc	%l2,	0x163B,	%i7
	movvs	%xcc,	%g7,	%l5
	fandnot1	%f18,	%f16,	%f16
	alignaddrl	%i0,	%o7,	%g1
	movne	%icc,	%l4,	%i2
	fandnot2s	%f25,	%f6,	%f25
	umul	%o5,	%l6,	%g2
	stb	%i6,	[%l7 + 0x34]
	fpack32	%f2,	%f26,	%f12
	movge	%icc,	%o6,	%o0
	array16	%l0,	%l1,	%o1
	xnorcc	%i3,	0x0C48,	%i1
	popc	0x10CC,	%o2
	stb	%o3,	[%l7 + 0x28]
	mova	%icc,	%g5,	%g6
	edge16n	%l3,	%o4,	%g4
	sllx	%i4,	0x07,	%g3
	movvs	%xcc,	%l2,	%i5
	alignaddrl	%g7,	%l5,	%i0
	movneg	%icc,	%o7,	%i7
	fcmps	%fcc1,	%f2,	%f26
	fpmerge	%f12,	%f12,	%f22
	movcc	%icc,	%l4,	%i2
	xnorcc	%o5,	0x0AD3,	%g1
	ld	[%l7 + 0x30],	%f11
	movl	%icc,	%l6,	%g2
	umulcc	%i6,	0x0612,	%o0
	movg	%icc,	%l0,	%o6
	bshuffle	%f10,	%f6,	%f6
	smulcc	%o1,	0x1625,	%l1
	mova	%xcc,	%i3,	%o2
	srl	%i1,	0x0A,	%o3
	ldub	[%l7 + 0x36],	%g5
	ldd	[%l7 + 0x28],	%g6
	fmovsvc	%xcc,	%f28,	%f9
	movg	%icc,	%l3,	%o4
	andncc	%g4,	%g3,	%l2
	sdivx	%i5,	0x1988,	%g7
	edge16l	%i4,	%i0,	%l5
	addccc	%i7,	0x1589,	%l4
	move	%icc,	%i2,	%o5
	xnorcc	%o7,	0x19C4,	%l6
	fmovde	%xcc,	%f5,	%f10
	or	%g1,	0x1DD9,	%i6
	fcmpne16	%f28,	%f10,	%g2
	fand	%f4,	%f8,	%f20
	lduw	[%l7 + 0x6C],	%o0
	movvc	%xcc,	%o6,	%o1
	fmovdneg	%xcc,	%f27,	%f8
	srax	%l1,	%i3,	%l0
	andcc	%i1,	0x0D47,	%o2
	fmovsvc	%xcc,	%f20,	%f18
	fmovdle	%icc,	%f27,	%f9
	movrlz	%o3,	0x19C,	%g5
	lduw	[%l7 + 0x74],	%g6
	movge	%xcc,	%o4,	%l3
	movne	%xcc,	%g4,	%g3
	fcmpeq32	%f6,	%f30,	%l2
	move	%xcc,	%i5,	%i4
	xnorcc	%i0,	0x0623,	%l5
	mulscc	%i7,	%g7,	%l4
	mulx	%i2,	%o5,	%o7
	fmovsleu	%icc,	%f31,	%f10
	andn	%l6,	%i6,	%g1
	ldx	[%l7 + 0x50],	%o0
	orncc	%g2,	0x1273,	%o6
	movl	%icc,	%o1,	%l1
	movneg	%icc,	%l0,	%i3
	edge32n	%i1,	%o2,	%o3
	edge8ln	%g5,	%g6,	%o4
	edge16	%g4,	%l3,	%l2
	movre	%g3,	0x143,	%i4
	movneg	%xcc,	%i0,	%l5
	umul	%i7,	0x0E74,	%i5
	edge8n	%l4,	%i2,	%g7
	array16	%o5,	%o7,	%l6
	lduh	[%l7 + 0x1A],	%g1
	sll	%i6,	0x01,	%o0
	array32	%g2,	%o1,	%o6
	fmovdl	%icc,	%f31,	%f22
	movre	%l1,	0x248,	%i3
	sra	%i1,	%l0,	%o3
	orn	%o2,	0x02DC,	%g5
	mulscc	%o4,	%g6,	%l3
	orcc	%l2,	%g3,	%i4
	add	%i0,	0x081F,	%g4
	smul	%l5,	%i5,	%i7
	fnegd	%f24,	%f4
	sllx	%l4,	0x0C,	%i2
	movrgez	%g7,	0x2B6,	%o5
	edge8n	%l6,	%o7,	%g1
	fandnot2s	%f3,	%f15,	%f1
	movn	%icc,	%i6,	%g2
	sra	%o0,	%o6,	%o1
	fexpand	%f6,	%f10
	movne	%xcc,	%l1,	%i3
	movge	%icc,	%l0,	%i1
	std	%f14,	[%l7 + 0x78]
	xor	%o2,	%g5,	%o3
	movge	%icc,	%o4,	%g6
	movrgez	%l2,	%l3,	%g3
	sth	%i0,	[%l7 + 0x14]
	xnor	%i4,	%l5,	%i5
	sll	%i7,	%g4,	%i2
	orcc	%g7,	0x142F,	%o5
	edge16l	%l6,	%l4,	%g1
	movgu	%xcc,	%i6,	%o7
	movrgz	%o0,	%g2,	%o1
	fnegs	%f22,	%f30
	movvc	%xcc,	%l1,	%i3
	fmovs	%f1,	%f12
	mulscc	%l0,	%o6,	%o2
	sth	%i1,	[%l7 + 0x66]
	fcmps	%fcc3,	%f12,	%f8
	edge8	%o3,	%g5,	%g6
	smulcc	%l2,	0x007F,	%l3
	movleu	%icc,	%g3,	%i0
	array32	%i4,	%l5,	%i5
	fpsub16s	%f15,	%f0,	%f6
	edge16ln	%i7,	%g4,	%o4
	addc	%g7,	0x0DC4,	%i2
	edge8l	%o5,	%l6,	%g1
	umul	%l4,	%o7,	%o0
	st	%f7,	[%l7 + 0x34]
	fmovsl	%xcc,	%f2,	%f6
	sllx	%i6,	0x00,	%g2
	std	%f6,	[%l7 + 0x50]
	fandnot2	%f4,	%f2,	%f30
	smulcc	%l1,	0x08BC,	%o1
	array32	%i3,	%o6,	%l0
	andcc	%i1,	0x038A,	%o2
	movre	%o3,	0x27B,	%g5
	movcs	%xcc,	%l2,	%l3
	srl	%g6,	0x08,	%g3
	edge16l	%i0,	%l5,	%i5
	edge32	%i4,	%g4,	%o4
	ldd	[%l7 + 0x40],	%f22
	edge16ln	%i7,	%i2,	%o5
	andncc	%l6,	%g7,	%l4
	andn	%o7,	%o0,	%i6
	srlx	%g2,	0x07,	%l1
	movrgez	%o1,	0x357,	%g1
	sra	%o6,	%l0,	%i3
	srl	%i1,	0x1F,	%o2
	umulcc	%o3,	0x1A11,	%l2
	edge32ln	%l3,	%g6,	%g5
	movleu	%icc,	%i0,	%g3
	movg	%icc,	%l5,	%i5
	orcc	%i4,	%o4,	%g4
	edge8	%i7,	%i2,	%o5
	edge32n	%l6,	%l4,	%g7
	subccc	%o7,	%o0,	%i6
	fnand	%f14,	%f16,	%f0
	edge32ln	%g2,	%l1,	%o1
	fmovsle	%xcc,	%f31,	%f18
	movrlz	%g1,	0x358,	%l0
	movge	%icc,	%o6,	%i1
	fandnot1	%f2,	%f12,	%f18
	mulx	%o2,	%o3,	%l2
	xor	%l3,	%i3,	%g6
	smulcc	%g5,	0x00BD,	%g3
	fmovscs	%xcc,	%f19,	%f7
	movneg	%xcc,	%i0,	%i5
	fmovsvc	%xcc,	%f24,	%f5
	or	%l5,	0x0B66,	%i4
	ldub	[%l7 + 0x63],	%g4
	add	%i7,	%i2,	%o4
	array16	%o5,	%l6,	%l4
	array16	%o7,	%g7,	%i6
	subccc	%g2,	%l1,	%o0
	umulcc	%o1,	%g1,	%l0
	std	%f2,	[%l7 + 0x60]
	edge32l	%o6,	%o2,	%i1
	fpack16	%f2,	%f20
	xnor	%l2,	0x0A49,	%o3
	or	%l3,	0x045C,	%g6
	fmovsa	%xcc,	%f5,	%f30
	alignaddrl	%g5,	%i3,	%i0
	xnor	%i5,	0x0934,	%g3
	orn	%i4,	%l5,	%i7
	movrne	%i2,	%o4,	%g4
	ldub	[%l7 + 0x74],	%o5
	array16	%l6,	%l4,	%g7
	ldsw	[%l7 + 0x5C],	%i6
	movne	%icc,	%o7,	%l1
	movpos	%xcc,	%o0,	%g2
	edge8n	%g1,	%o1,	%o6
	srax	%o2,	%l0,	%l2
	fmovdleu	%icc,	%f13,	%f27
	srax	%o3,	%l3,	%g6
	srax	%g5,	0x10,	%i1
	edge16n	%i3,	%i5,	%i0
	andn	%g3,	0x1CEE,	%i4
	andcc	%l5,	%i2,	%i7
	std	%f2,	[%l7 + 0x50]
	save %g4, %o4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f3,	%f26
	movrlz	%l4,	0x240,	%g7
	movre	%l6,	%i6,	%o7
	sub	%l1,	0x0C6B,	%g2
	fexpand	%f18,	%f18
	movcc	%icc,	%g1,	%o0
	xorcc	%o6,	%o1,	%o2
	umul	%l0,	%l2,	%o3
	movrgez	%l3,	%g6,	%i1
	movrgez	%g5,	0x102,	%i5
	ldd	[%l7 + 0x10],	%f14
	restore %i0, 0x1964, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i4,	%i3,	%i2
	udiv	%i7,	0x102D,	%l5
	popc	0x1FBE,	%o4
	orcc	%g4,	%o5,	%g7
	sir	0x091C
	fmovdgu	%icc,	%f14,	%f22
	movre	%l6,	%l4,	%o7
	ldsb	[%l7 + 0x3E],	%l1
	addc	%i6,	0x13A9,	%g1
	ld	[%l7 + 0x2C],	%f15
	ldx	[%l7 + 0x38],	%o0
	subccc	%o6,	0x1AAA,	%g2
	ldd	[%l7 + 0x40],	%o2
	umul	%o1,	0x05EC,	%l2
	movpos	%xcc,	%l0,	%o3
	movg	%xcc,	%g6,	%i1
	save %l3, %g5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x38],	%g3
	sll	%i4,	0x0D,	%i3
	fmovsne	%xcc,	%f4,	%f12
	mulx	%i2,	0x02A2,	%i7
	movrlez	%l5,	%i0,	%o4
	udivx	%o5,	0x00AC,	%g7
	edge32	%l6,	%l4,	%o7
	sllx	%g4,	0x1C,	%l1
	udivcc	%i6,	0x1733,	%o0
	fpmerge	%f24,	%f2,	%f0
	alignaddrl	%o6,	%g2,	%g1
	fmovdgu	%icc,	%f20,	%f28
	setx loop_104, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_104: 	xnor	%l0,	0x0784,	%o3
	fcmpeq32	%f12,	%f4,	%i1
	movn	%xcc,	%l3,	%g5
	orn	%i5,	0x0A74,	%g3
	ldx	[%l7 + 0x58],	%i4
	sth	%g6,	[%l7 + 0x62]
	andncc	%i3,	%i7,	%l5
	stx	%i0,	[%l7 + 0x60]
	sub	%i2,	%o5,	%o4
	fornot1	%f16,	%f24,	%f18
	subcc	%g7,	0x0CD9,	%l4
	movl	%icc,	%l6,	%g4
	fmovdleu	%icc,	%f14,	%f13
	sir	0x0964
	fpadd32s	%f28,	%f19,	%f9
	fandnot1s	%f10,	%f23,	%f31
	edge8l	%o7,	%l1,	%i6
	subc	%o6,	0x002D,	%g2
	edge32n	%o0,	%g1,	%l2
	movvc	%xcc,	%o1,	%o2
	alignaddrl	%o3,	%l0,	%i1
	movre	%g5,	0x158,	%l3
	alignaddr	%i5,	%i4,	%g6
	mova	%icc,	%i3,	%g3
	orn	%l5,	%i7,	%i0
	orcc	%i2,	0x12C8,	%o4
	sllx	%g7,	0x1E,	%o5
	sdivcc	%l4,	0x1109,	%l6
	mulscc	%g4,	0x1613,	%o7
	movl	%xcc,	%i6,	%l1
	movge	%icc,	%o6,	%o0
	faligndata	%f22,	%f16,	%f8
	fornot2s	%f16,	%f14,	%f11
	xor	%g2,	%g1,	%l2
	fmovdn	%xcc,	%f17,	%f8
	fmovsn	%xcc,	%f21,	%f14
	movrgz	%o1,	%o2,	%l0
	alignaddr	%i1,	%g5,	%o3
	umulcc	%l3,	0x0559,	%i4
	edge8ln	%i5,	%i3,	%g3
	srlx	%l5,	%g6,	%i7
	mova	%icc,	%i2,	%o4
	ldub	[%l7 + 0x7B],	%i0
	movrgez	%o5,	0x296,	%g7
	stb	%l6,	[%l7 + 0x2F]
	alignaddr	%l4,	%g4,	%i6
	movle	%icc,	%l1,	%o6
	fmovsleu	%icc,	%f29,	%f16
	fxnor	%f20,	%f22,	%f10
	fornot2s	%f11,	%f5,	%f1
	movneg	%xcc,	%o7,	%o0
	edge16ln	%g1,	%g2,	%o1
	orcc	%l2,	%l0,	%o2
	fmovrsgez	%g5,	%f12,	%f23
	ldsh	[%l7 + 0x46],	%i1
	ldx	[%l7 + 0x10],	%l3
	sllx	%o3,	0x06,	%i5
	srlx	%i3,	0x11,	%i4
	addcc	%g3,	0x1745,	%l5
	ldx	[%l7 + 0x78],	%g6
	edge8n	%i2,	%o4,	%i7
	fnands	%f17,	%f17,	%f2
	andcc	%o5,	%g7,	%l6
	ldsw	[%l7 + 0x64],	%l4
	and	%i0,	0x122C,	%g4
	movvs	%xcc,	%l1,	%o6
	udiv	%i6,	0x13B7,	%o7
	andncc	%o0,	%g2,	%o1
	edge8ln	%l2,	%g1,	%o2
	stb	%l0,	[%l7 + 0x3A]
	addc	%i1,	0x16AF,	%g5
	movrgz	%l3,	%i5,	%i3
	alignaddr	%i4,	%o3,	%l5
	fmovdneg	%xcc,	%f22,	%f19
	fmovrdlez	%g6,	%f12,	%f4
	udivcc	%g3,	0x1927,	%i2
	stb	%i7,	[%l7 + 0x21]
	ldd	[%l7 + 0x18],	%f10
	fmovdcs	%icc,	%f3,	%f3
	movvs	%icc,	%o5,	%g7
	fmul8x16au	%f23,	%f13,	%f26
	ld	[%l7 + 0x70],	%f20
	ldsh	[%l7 + 0x6C],	%l6
	fmovscc	%xcc,	%f14,	%f1
	popc	0x1900,	%o4
	array32	%i0,	%g4,	%l1
	ldd	[%l7 + 0x50],	%f24
	move	%icc,	%l4,	%o6
	ldub	[%l7 + 0x1F],	%o7
	sllx	%i6,	%o0,	%g2
	movneg	%xcc,	%o1,	%g1
	edge8ln	%l2,	%o2,	%i1
	udivx	%g5,	0x1EC4,	%l0
	movrne	%l3,	0x03E,	%i5
	std	%f26,	[%l7 + 0x20]
	popc	%i3,	%i4
	movrlez	%l5,	0x0A6,	%g6
	movvc	%xcc,	%o3,	%g3
	fnot1s	%f31,	%f9
	movvc	%xcc,	%i2,	%o5
	movpos	%icc,	%i7,	%l6
	sir	0x08AD
	fcmps	%fcc3,	%f26,	%f16
	or	%g7,	0x07B3,	%o4
	movrne	%g4,	0x22C,	%l1
	movneg	%icc,	%i0,	%o6
	smul	%o7,	0x0B40,	%l4
	lduh	[%l7 + 0x4C],	%i6
	sub	%o0,	%g2,	%g1
	mulx	%l2,	%o2,	%o1
	movgu	%xcc,	%i1,	%l0
	andn	%g5,	%l3,	%i3
	addcc	%i5,	%l5,	%i4
	movn	%icc,	%g6,	%o3
	ldsh	[%l7 + 0x32],	%g3
	subc	%o5,	%i7,	%l6
	fpack16	%f0,	%f7
	movne	%icc,	%g7,	%i2
	fmovrse	%g4,	%f23,	%f18
	movne	%xcc,	%l1,	%i0
	mova	%xcc,	%o4,	%o7
	fcmped	%fcc3,	%f6,	%f14
	mulscc	%o6,	%l4,	%o0
	mulx	%g2,	0x19DF,	%i6
	xorcc	%l2,	0x0658,	%o2
	alignaddr	%g1,	%i1,	%o1
	edge16n	%l0,	%l3,	%i3
	sdivcc	%g5,	0x054F,	%l5
	movleu	%icc,	%i4,	%g6
	ldub	[%l7 + 0x0F],	%i5
	sdiv	%o3,	0x0DCA,	%o5
	restore %i7, 0x0797, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l6,	%i2,	%g4
	ldub	[%l7 + 0x60],	%l1
	edge8n	%g7,	%o4,	%i0
	xnorcc	%o6,	0x1B8D,	%o7
	stw	%o0,	[%l7 + 0x64]
	fcmped	%fcc1,	%f4,	%f18
	sllx	%g2,	%i6,	%l2
	edge32	%l4,	%o2,	%g1
	ldsw	[%l7 + 0x34],	%o1
	pdist	%f20,	%f6,	%f26
	ldx	[%l7 + 0x48],	%i1
	movrgez	%l3,	%i3,	%g5
	stb	%l0,	[%l7 + 0x6E]
	smulcc	%l5,	0x0AB9,	%i4
	fpack32	%f18,	%f18,	%f10
	movg	%icc,	%g6,	%i5
	movcc	%icc,	%o3,	%o5
	movneg	%icc,	%g3,	%i7
	movcs	%icc,	%i2,	%g4
	addccc	%l1,	%l6,	%o4
	ldub	[%l7 + 0x11],	%i0
	fxor	%f4,	%f28,	%f8
	fmovdg	%xcc,	%f29,	%f30
	movrlez	%o6,	0x3C7,	%g7
	edge32	%o0,	%g2,	%i6
	fnot1	%f26,	%f22
	movcc	%icc,	%l2,	%l4
	stx	%o7,	[%l7 + 0x68]
	fmovsa	%icc,	%f3,	%f3
	stw	%o2,	[%l7 + 0x7C]
	edge32l	%g1,	%o1,	%l3
	movvs	%xcc,	%i3,	%i1
	fandnot2	%f0,	%f2,	%f8
	srlx	%g5,	%l5,	%l0
	udivx	%g6,	0x0C09,	%i5
	edge16ln	%o3,	%i4,	%o5
	lduh	[%l7 + 0x32],	%i7
	addcc	%g3,	0x192E,	%g4
	edge8n	%l1,	%l6,	%o4
	movl	%icc,	%i0,	%i2
	xnorcc	%o6,	0x051F,	%g7
	fmovdleu	%xcc,	%f4,	%f27
	movneg	%icc,	%g2,	%o0
	fmovdneg	%xcc,	%f27,	%f1
	edge16	%l2,	%i6,	%l4
	fnot1	%f22,	%f0
	stb	%o2,	[%l7 + 0x4E]
	subcc	%o7,	%o1,	%g1
	save %l3, %i1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%g5,	%f0,	%f0
	xorcc	%l0,	0x088E,	%l5
	edge8ln	%g6,	%i5,	%i4
	ldub	[%l7 + 0x0C],	%o3
	addcc	%o5,	0x106E,	%i7
	umul	%g4,	0x0504,	%g3
	udivx	%l6,	0x14A8,	%l1
	setx loop_105, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_105: 	sll	%g7,	0x12,	%g2
	smulcc	%i2,	%l2,	%o0
	movne	%xcc,	%i6,	%o2
	fmovrsne	%l4,	%f13,	%f26
	edge16l	%o7,	%g1,	%l3
	alignaddrl	%i1,	%o1,	%i3
	udivx	%l0,	0x10F5,	%l5
	lduw	[%l7 + 0x44],	%g5
	fmuld8ulx16	%f21,	%f10,	%f6
	array16	%i5,	%g6,	%i4
	ldsh	[%l7 + 0x6C],	%o5
	lduh	[%l7 + 0x34],	%o3
	ldsw	[%l7 + 0x64],	%i7
	edge32	%g4,	%g3,	%l6
	fpack32	%f2,	%f8,	%f4
	stw	%o4,	[%l7 + 0x2C]
	fmovrsgez	%l1,	%f24,	%f16
	srax	%o6,	%g7,	%i0
	ldd	[%l7 + 0x20],	%f12
	ldsw	[%l7 + 0x24],	%i2
	edge8l	%g2,	%o0,	%l2
	edge16	%o2,	%i6,	%l4
	movle	%xcc,	%o7,	%g1
	addccc	%l3,	%o1,	%i3
	movrgez	%l0,	0x396,	%l5
	sub	%g5,	0x0456,	%i1
	movneg	%xcc,	%i5,	%g6
	edge32ln	%i4,	%o5,	%o3
	alignaddrl	%g4,	%g3,	%l6
	smulcc	%o4,	0x1518,	%i7
	fmovdvc	%icc,	%f17,	%f20
	edge8n	%o6,	%l1,	%g7
	edge16ln	%i2,	%i0,	%g2
	fmovdn	%xcc,	%f17,	%f13
	and	%o0,	%o2,	%l2
	st	%f1,	[%l7 + 0x70]
	orncc	%i6,	0x06EA,	%l4
	alignaddr	%o7,	%g1,	%o1
	ldsh	[%l7 + 0x0E],	%i3
	ldx	[%l7 + 0x50],	%l3
	edge8n	%l5,	%l0,	%i1
	movneg	%xcc,	%i5,	%g5
	addcc	%g6,	%o5,	%i4
	movcc	%icc,	%o3,	%g4
	movgu	%icc,	%l6,	%o4
	movleu	%icc,	%i7,	%g3
	umulcc	%l1,	%g7,	%o6
	save %i0, 0x1BA5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g2,	0x17F4,	%o0
	ldsh	[%l7 + 0x4E],	%l2
	edge8l	%o2,	%l4,	%o7
	edge32	%i6,	%g1,	%o1
	fornot1s	%f10,	%f20,	%f2
	ldsh	[%l7 + 0x42],	%l3
	popc	%l5,	%l0
	udivcc	%i1,	0x09D2,	%i5
	xorcc	%g5,	0x0210,	%g6
	edge32ln	%o5,	%i4,	%i3
	save %g4, 0x1437, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o4,	%i7,	%l6
	udivcc	%l1,	0x0444,	%g3
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%o6
	fmul8x16	%f14,	%f26,	%f18
	udivcc	%g7,	0x03AB,	%i2
	array16	%g2,	%o0,	%l2
	movgu	%xcc,	%i0,	%o2
	movge	%xcc,	%l4,	%i6
	stx	%o7,	[%l7 + 0x60]
	ldsw	[%l7 + 0x3C],	%g1
	srax	%o1,	0x10,	%l5
	nop
	set	0x64, %o2
	ldsh	[%l7 + %o2],	%l3
	restore %l0, 0x0B97, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f21
	edge32ln	%g5,	%g6,	%i5
	fmovse	%xcc,	%f25,	%f17
	ld	[%l7 + 0x34],	%f30
	edge32ln	%o5,	%i4,	%i3
	xor	%o3,	%o4,	%g4
	edge8n	%i7,	%l1,	%g3
	fmovdpos	%icc,	%f22,	%f29
	ldsb	[%l7 + 0x6C],	%l6
	array32	%g7,	%o6,	%g2
	and	%o0,	0x0E35,	%i2
	smulcc	%i0,	0x0496,	%l2
	srl	%l4,	%o2,	%i6
	st	%f21,	[%l7 + 0x1C]
	for	%f18,	%f26,	%f30
	sdiv	%g1,	0x1E80,	%o7
	movleu	%icc,	%o1,	%l5
	movcs	%xcc,	%l3,	%i1
	fmovrslz	%l0,	%f17,	%f12
	addc	%g5,	0x130A,	%g6
	edge8l	%i5,	%o5,	%i3
	subc	%i4,	0x18A1,	%o3
	movrlez	%g4,	0x179,	%i7
	fzeros	%f2
	srl	%o4,	%l1,	%l6
	fmovrdne	%g3,	%f8,	%f24
	movgu	%icc,	%g7,	%g2
	fmovsle	%xcc,	%f21,	%f1
	array32	%o6,	%i2,	%i0
	movg	%xcc,	%o0,	%l2
	andn	%l4,	%o2,	%i6
	fnot1s	%f31,	%f3
	subcc	%o7,	0x0621,	%o1
	ld	[%l7 + 0x70],	%f18
	setx loop_106, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_106: 	fmuld8sux16	%f5,	%f18,	%f2
	movpos	%icc,	%i1,	%l0
	movrlez	%g5,	0x244,	%g6
	edge8l	%l3,	%i5,	%i3
	edge8	%o5,	%o3,	%i4
	movle	%xcc,	%g4,	%o4
	sdivx	%i7,	0x004F,	%l1
	movre	%l6,	0x20F,	%g7
	mova	%xcc,	%g2,	%g3
	sra	%o6,	%i0,	%i2
	movl	%xcc,	%l2,	%l4
	edge8	%o2,	%i6,	%o0
	movleu	%xcc,	%o1,	%g1
	movvc	%icc,	%l5,	%i1
	nop
	set	0x4C, %o6
	lduw	[%l7 + %o6],	%l0
	addc	%o7,	%g6,	%g5
	sub	%l3,	0x0EFA,	%i3
	fpack32	%f4,	%f20,	%f24
	edge16ln	%o5,	%i5,	%i4
	orn	%g4,	%o3,	%i7
	addc	%l1,	%o4,	%l6
	fmovdgu	%xcc,	%f5,	%f17
	fmovsn	%xcc,	%f2,	%f22
	move	%icc,	%g2,	%g3
	ldub	[%l7 + 0x0D],	%g7
	mulscc	%i0,	0x10C7,	%i2
	stw	%l2,	[%l7 + 0x08]
	save %l4, %o6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i6,	0x1A42,	%o0
	udiv	%o1,	0x1F3A,	%g1
	movrgz	%l5,	%i1,	%l0
	fpadd32s	%f4,	%f13,	%f10
	orcc	%o7,	0x015F,	%g6
	fnors	%f31,	%f11,	%f25
	ld	[%l7 + 0x7C],	%f17
	edge8	%g5,	%i3,	%l3
	sllx	%i5,	0x1F,	%i4
	sdivcc	%o5,	0x1DA3,	%g4
	sir	0x1806
	fpsub32s	%f15,	%f22,	%f22
	or	%o3,	0x1217,	%l1
	fmovdpos	%xcc,	%f17,	%f13
	fmovde	%icc,	%f26,	%f26
	orncc	%o4,	0x07D2,	%l6
	edge32n	%g2,	%g3,	%i7
	movcs	%xcc,	%i0,	%i2
	stw	%l2,	[%l7 + 0x38]
	st	%f30,	[%l7 + 0x74]
	edge32ln	%g7,	%o6,	%l4
	fcmpne16	%f16,	%f12,	%o2
	fcmpne32	%f16,	%f0,	%o0
	edge16n	%o1,	%i6,	%l5
	sllx	%i1,	0x06,	%g1
	array32	%o7,	%l0,	%g6
	fcmps	%fcc1,	%f9,	%f2
	udivx	%i3,	0x0A2E,	%l3
	xnorcc	%i5,	0x023D,	%i4
	movcc	%icc,	%o5,	%g4
	save %g5, %l1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	%l6,	%g2
	array32	%i7,	%g3,	%i0
	nop
	set	0x68, %i2
	sth	%l2,	[%l7 + %i2]
	fxnors	%f23,	%f21,	%f24
	stx	%g7,	[%l7 + 0x28]
	movrlez	%o6,	0x1F9,	%i2
	movcs	%xcc,	%l4,	%o2
	movgu	%xcc,	%o0,	%i6
	orncc	%l5,	%o1,	%g1
	fmul8x16au	%f10,	%f30,	%f8
	fmovsl	%icc,	%f15,	%f4
	array32	%i1,	%l0,	%g6
	array32	%o7,	%l3,	%i5
	orcc	%i3,	0x0A57,	%o5
	edge16	%i4,	%g5,	%l1
	movne	%icc,	%o3,	%o4
	movrgz	%l6,	%g2,	%i7
	fmovrslz	%g3,	%f14,	%f22
	alignaddr	%g4,	%l2,	%g7
	array8	%o6,	%i0,	%l4
	fones	%f16
	fmovrde	%o2,	%f2,	%f20
	siam	0x1
	sir	0x0DF9
	save %i2, %o0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f6,	[%l7 + 0x60]
	sethi	0x0C87,	%o1
	nop
	set	0x10, %l5
	stb	%g1,	[%l7 + %l5]
	addcc	%i6,	0x1A82,	%i1
	ldd	[%l7 + 0x78],	%g6
	array8	%l0,	%l3,	%o7
	movvs	%icc,	%i5,	%i3
	alignaddrl	%i4,	%o5,	%g5
	movneg	%icc,	%l1,	%o3
	nop
	set	0x4C, %i5
	ldsw	[%l7 + %i5],	%o4
	andncc	%g2,	%l6,	%g3
	stx	%i7,	[%l7 + 0x58]
	fpadd32s	%f10,	%f1,	%f10
	movvs	%icc,	%l2,	%g4
	ldd	[%l7 + 0x10],	%g6
	fmovdl	%icc,	%f29,	%f13
	sdivcc	%o6,	0x19DA,	%i0
	sll	%o2,	0x02,	%i2
	restore %l4, %o0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l5,	%g1,	%i1
	movrlz	%g6,	0x1EC,	%i6
	lduh	[%l7 + 0x4C],	%l3
	movn	%icc,	%l0,	%i5
	movrne	%i3,	%o7,	%o5
	ldd	[%l7 + 0x48],	%g4
	mova	%xcc,	%l1,	%o3
	udivx	%o4,	0x1117,	%i4
	movcc	%icc,	%l6,	%g2
	fabsd	%f28,	%f16
	edge8n	%i7,	%g3,	%g4
	fmul8x16al	%f15,	%f2,	%f30
	fmovsl	%icc,	%f11,	%f10
	movne	%xcc,	%l2,	%g7
	sth	%i0,	[%l7 + 0x7E]
	move	%icc,	%o6,	%i2
	movn	%icc,	%l4,	%o2
	fmovsa	%icc,	%f20,	%f2
	and	%o1,	0x13A2,	%o0
	ldd	[%l7 + 0x38],	%l4
	addccc	%g1,	0x1517,	%g6
	array8	%i6,	%l3,	%i1
	movle	%icc,	%l0,	%i3
	xnorcc	%o7,	0x17E1,	%i5
	fzero	%f2
	movre	%g5,	0x30E,	%l1
	movre	%o5,	0x123,	%o3
	edge8l	%o4,	%i4,	%g2
	ldsb	[%l7 + 0x55],	%l6
	movne	%icc,	%g3,	%i7
	edge8n	%l2,	%g4,	%i0
	edge32l	%o6,	%i2,	%l4
	edge32n	%g7,	%o1,	%o2
	stb	%l5,	[%l7 + 0x2D]
	add	%g1,	%g6,	%i6
	ldd	[%l7 + 0x28],	%f20
	movrlez	%l3,	%i1,	%l0
	movvs	%icc,	%i3,	%o7
	xorcc	%i5,	0x1E91,	%g5
	fmovdge	%xcc,	%f15,	%f24
	fmovdle	%xcc,	%f30,	%f18
	fpadd16s	%f1,	%f30,	%f27
	sra	%o0,	0x0D,	%o5
	for	%f12,	%f16,	%f8
	udiv	%l1,	0x10DA,	%o4
	udivx	%o3,	0x169B,	%i4
	movcc	%icc,	%g2,	%g3
	fmovda	%xcc,	%f12,	%f0
	fmovdl	%icc,	%f6,	%f14
	fand	%f10,	%f22,	%f18
	setx loop_107, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_107: 	st	%f12,	[%l7 + 0x6C]
	fcmpne16	%f22,	%f0,	%l6
	edge16n	%i0,	%o6,	%g4
	xorcc	%i2,	0x0252,	%g7
	fmul8ulx16	%f0,	%f30,	%f22
	edge8l	%o1,	%o2,	%l4
	edge16ln	%g1,	%g6,	%i6
	stx	%l5,	[%l7 + 0x08]
	array16	%l3,	%l0,	%i3
	std	%f4,	[%l7 + 0x58]
	ld	[%l7 + 0x2C],	%f19
	fmovrslz	%o7,	%f27,	%f19
	fmovrdne	%i5,	%f14,	%f24
	movn	%xcc,	%i1,	%g5
	edge32	%o5,	%o0,	%o4
	st	%f24,	[%l7 + 0x74]
	movl	%icc,	%l1,	%o3
	nop
	set	0x74, %i6
	lduw	[%l7 + %i6],	%i4
	fmovdg	%xcc,	%f30,	%f0
	fmovspos	%icc,	%f25,	%f16
	movrne	%g3,	0x27B,	%i7
	stb	%g2,	[%l7 + 0x4E]
	udivx	%l2,	0x156F,	%i0
	andncc	%o6,	%g4,	%i2
	fpsub32s	%f2,	%f11,	%f9
	array32	%l6,	%g7,	%o1
	srlx	%o2,	%l4,	%g6
	smul	%g1,	%l5,	%l3
	ldsw	[%l7 + 0x3C],	%i6
	sll	%i3,	%o7,	%i5
	movvc	%icc,	%i1,	%l0
	movcc	%icc,	%g5,	%o5
	std	%f4,	[%l7 + 0x50]
	edge16ln	%o0,	%l1,	%o4
	mova	%icc,	%o3,	%i4
	nop
	set	0x6C, %o7
	ldsw	[%l7 + %o7],	%i7
	edge32l	%g2,	%l2,	%g3
	sub	%i0,	0x13B4,	%g4
	andn	%o6,	0x19DB,	%l6
	alignaddr	%g7,	%i2,	%o1
	movgu	%icc,	%o2,	%l4
	fcmpne32	%f26,	%f12,	%g6
	mulx	%g1,	0x1FF0,	%l5
	movleu	%icc,	%l3,	%i3
	orcc	%o7,	%i5,	%i6
	xorcc	%l0,	%g5,	%o5
	fcmpeq16	%f14,	%f26,	%o0
	sdivx	%l1,	0x07FC,	%o4
	movne	%xcc,	%o3,	%i4
	alignaddrl	%i1,	%g2,	%i7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3649
!	Type f   	: 5268
!	Type i   	: 16083
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xEF2E04B1
.word 0xFE986203
.word 0x7F390285
.word 0x24FE18F9
.word 0xC2A60495
.word 0x0F2C6D7A
.word 0xE835B8A9
.word 0x5BF36C7E
.word 0xFCEC6039
.word 0x33E7E146
.word 0x246239B0
.word 0x8E35F6EE
.word 0x2D075B36
.word 0x3B9A07EF
.word 0x7E8AA821
.word 0x83C16B36
.word 0xC2816DE1
.word 0x7CF16FE6
.word 0x352DF906
.word 0x82EE6ED6
.word 0x8DB6D9F3
.word 0x11E371D3
.word 0x50A10272
.word 0xC25EBFAA
.word 0x36B4ABEF
.word 0x7116455C
.word 0x0857F06F
.word 0xB4F0FC3A
.word 0xBEB9EEA6
.word 0x71A301AD
.word 0xBF64026C
.word 0x9B188ADD
.word 0xC0A6F1F3
.word 0x78A1FBF8
.word 0x2954F322
.word 0x51459676
.word 0x02052E8E
.word 0x9CC61086
.word 0xE56AD5D7
.word 0xCC9D38D1
.word 0x325C4F6D
.word 0x798AABEF
.word 0x70F1FFCE
.word 0x6C517C4B
.word 0x115C0197
.word 0x1C71687D
.word 0x64806E1D
.word 0xFE3E3DD9
.word 0xE58C9756
.word 0x6C0E2337
.word 0x7D2F68D5
.word 0x9805A2DD
.word 0x6D997DCE
.word 0xFAFE4053
.word 0x7CE888F4
.word 0xB215D6F9
.word 0xA658A6C7
.word 0xE1F1FE9D
.word 0xC5FE168F
.word 0x07644A0C
.word 0xAE6FFEE7
.word 0xCDCE164F
.word 0x18277D5F
.word 0xD1866B28
.end
