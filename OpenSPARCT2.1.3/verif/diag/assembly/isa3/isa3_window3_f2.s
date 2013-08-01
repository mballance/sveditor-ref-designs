/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f2.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f2.s,v 1.1 2007/05/11 17:22:38 drp Exp $"
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
	setx	0x869EF8A74043C8CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x4,	%g2
	set	0xB,	%g3
	set	0x6,	%g4
	set	0xE,	%g5
	set	0xB,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x6,	%i1
	set	-0xD,	%i2
	set	-0x6,	%i3
	set	-0x9,	%i4
	set	-0xA,	%i5
	set	-0xD,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x615C58C4,	%l0
	set	0x30CE86FB,	%l1
	set	0x3ABAABBD,	%l2
	set	0x4E24D0FA,	%l3
	set	0x2FFFB597,	%l4
	set	0x596E304D,	%l5
	set	0x3D3AF93B,	%l6
	!# Output registers
	set	0x0CA4,	%o0
	set	-0x05BE,	%o1
	set	0x00D2,	%o2
	set	0x0A43,	%o3
	set	0x0034,	%o4
	set	0x0AF8,	%o5
	set	0x191B,	%o6
	set	-0x014C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x04B1D1ECBB357ED8)
	INIT_TH_FP_REG(%l7,%f2,0x4551DD2626C22E68)
	INIT_TH_FP_REG(%l7,%f4,0xE264CA284A076328)
	INIT_TH_FP_REG(%l7,%f6,0x381C29CB82C52A76)
	INIT_TH_FP_REG(%l7,%f8,0xC0FBF27392BD41FD)
	INIT_TH_FP_REG(%l7,%f10,0x3839866B2DFEC642)
	INIT_TH_FP_REG(%l7,%f12,0xA1157FC818A15FDC)
	INIT_TH_FP_REG(%l7,%f14,0x04DA20A0DCF59F12)
	INIT_TH_FP_REG(%l7,%f16,0x98DCFB22FE1BF532)
	INIT_TH_FP_REG(%l7,%f18,0xA0BD92D7C6E4888B)
	INIT_TH_FP_REG(%l7,%f20,0x0082F26E4879C05A)
	INIT_TH_FP_REG(%l7,%f22,0xC2C282DB0A50C15A)
	INIT_TH_FP_REG(%l7,%f24,0xE83D95CB420BC9BB)
	INIT_TH_FP_REG(%l7,%f26,0xB5F2EEB4ADD270A2)
	INIT_TH_FP_REG(%l7,%f28,0xEC5491569CFA53B8)
	INIT_TH_FP_REG(%l7,%f30,0x6A4C9A20F107F2E0)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	stx	%o5,	[%l7 + 0x18]
	array16	%i2,	%o1,	%i6
	fmovdvs	%icc,	%f10,	%f31
	sll	%g7,	0x19,	%l5
	edge16ln	%l2,	%l3,	%i4
	popc	%g5,	%i5
	movrgz	%l6,	0x08C,	%i1
	fcmps	%fcc1,	%f21,	%f31
	srl	%l0,	0x02,	%i7
	sdivcc	%o4,	0x1E7C,	%o6
	movrlez	%i3,	%l1,	%g1
	movneg	%xcc,	%g2,	%o2
	movle	%icc,	%o7,	%l4
	fsrc1s	%f22,	%f0
	fpsub16	%f18,	%f18,	%f6
	movgu	%xcc,	%g4,	%o3
	fmovdpos	%icc,	%f4,	%f10
	fexpand	%f11,	%f26
	movl	%icc,	%g6,	%o0
	fmul8x16al	%f10,	%f1,	%f4
	fcmpeq32	%f26,	%f2,	%i0
	umulcc	%g3,	%i2,	%o1
	popc	%i6,	%o5
	fornot1s	%f24,	%f24,	%f28
	ldx	[%l7 + 0x68],	%g7
	fmuld8sux16	%f3,	%f25,	%f28
	subcc	%l2,	%l5,	%i4
	save %l3, 0x07D2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x12],	%i5
	movle	%icc,	%i1,	%l6
	movcc	%xcc,	%i7,	%o4
	ldx	[%l7 + 0x10],	%o6
	movrgz	%l0,	%i3,	%g1
	movrgez	%g2,	%l1,	%o2
	lduh	[%l7 + 0x24],	%l4
	umul	%o7,	%o3,	%g4
	stx	%o0,	[%l7 + 0x58]
	fcmpd	%fcc1,	%f18,	%f24
	fmul8x16	%f13,	%f2,	%f10
	std	%f28,	[%l7 + 0x40]
	addccc	%i0,	%g3,	%i2
	sir	0x0EED
	ldsb	[%l7 + 0x1E],	%o1
	nop
	set	0x6C, %l6
	stw	%i6,	[%l7 + %l6]
	srl	%g6,	%o5,	%l2
	ldsh	[%l7 + 0x3E],	%g7
	movvc	%xcc,	%l5,	%i4
	movvs	%icc,	%g5,	%l3
	sub	%i1,	0x09FC,	%i5
	sdiv	%i7,	0x12AD,	%l6
	srax	%o6,	%l0,	%i3
	fpsub16	%f10,	%f18,	%f22
	fornot1	%f10,	%f6,	%f22
	ldx	[%l7 + 0x78],	%g1
	subc	%g2,	%o4,	%l1
	movne	%icc,	%o2,	%o7
	fands	%f16,	%f19,	%f28
	fornot1	%f20,	%f14,	%f20
	fpmerge	%f12,	%f28,	%f10
	edge8l	%o3,	%g4,	%l4
	stw	%i0,	[%l7 + 0x34]
	subc	%g3,	%i2,	%o0
	std	%f12,	[%l7 + 0x48]
	movcc	%xcc,	%i6,	%o1
	fone	%f2
	movrlz	%o5,	0x0C1,	%g6
	movrne	%g7,	0x3DC,	%l2
	movrgz	%l5,	%i4,	%l3
	edge16l	%g5,	%i5,	%i1
	smulcc	%l6,	0x0F17,	%i7
	lduh	[%l7 + 0x10],	%o6
	stw	%i3,	[%l7 + 0x48]
	movcc	%icc,	%g1,	%l0
	movrgez	%o4,	0x315,	%g2
	srl	%o2,	%o7,	%l1
	fmovrsne	%o3,	%f19,	%f12
	movgu	%icc,	%g4,	%i0
	movvs	%icc,	%l4,	%g3
	fmovsne	%xcc,	%f18,	%f16
	alignaddrl	%i2,	%i6,	%o0
	fpadd16	%f8,	%f6,	%f20
	edge8l	%o1,	%o5,	%g7
	srax	%l2,	%g6,	%i4
	fzero	%f10
	movl	%icc,	%l3,	%l5
	movg	%xcc,	%g5,	%i1
	xnor	%i5,	%l6,	%i7
	subcc	%i3,	0x0C4B,	%g1
	fcmpeq16	%f14,	%f8,	%o6
	fmovscc	%xcc,	%f29,	%f11
	movneg	%xcc,	%o4,	%g2
	lduw	[%l7 + 0x10],	%l0
	movn	%icc,	%o2,	%o7
	andn	%o3,	%g4,	%i0
	fmovda	%icc,	%f10,	%f14
	edge32n	%l1,	%l4,	%i2
	orcc	%g3,	%o0,	%i6
	srlx	%o1,	0x1F,	%g7
	udiv	%l2,	0x0491,	%g6
	udivcc	%o5,	0x0586,	%i4
	smul	%l5,	0x0BB5,	%g5
	array32	%l3,	%i1,	%l6
	subc	%i5,	%i3,	%g1
	stx	%i7,	[%l7 + 0x58]
	orcc	%o4,	%g2,	%l0
	fmovs	%f8,	%f16
	fcmple16	%f4,	%f4,	%o2
	lduh	[%l7 + 0x28],	%o7
	orncc	%o6,	0x1521,	%g4
	sra	%i0,	0x15,	%l1
	movrgez	%o3,	0x042,	%i2
	movrlez	%g3,	0x056,	%l4
	srlx	%o0,	%o1,	%g7
	fmovrse	%l2,	%f4,	%f6
	fxor	%f8,	%f6,	%f0
	fmovrdlez	%i6,	%f12,	%f4
	andncc	%g6,	%i4,	%l5
	xorcc	%g5,	0x1757,	%l3
	fcmpeq32	%f10,	%f12,	%o5
	srl	%l6,	%i5,	%i1
	fornot1s	%f9,	%f2,	%f5
	edge16l	%i3,	%g1,	%i7
	std	%f26,	[%l7 + 0x08]
	edge8	%o4,	%l0,	%o2
	stb	%g2,	[%l7 + 0x5C]
	edge16l	%o6,	%o7,	%g4
	fandnot1s	%f19,	%f14,	%f19
	restore %l1, 0x0122, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i0,	%i2,	%g3
	and	%l4,	%o0,	%o1
	edge8n	%l2,	%g7,	%i6
	ld	[%l7 + 0x40],	%f24
	xor	%g6,	%l5,	%g5
	array8	%i4,	%l3,	%o5
	xor	%l6,	%i1,	%i5
	ldd	[%l7 + 0x18],	%f4
	ldd	[%l7 + 0x28],	%g0
	edge8ln	%i7,	%i3,	%l0
	movg	%icc,	%o2,	%g2
	sir	0x0290
	or	%o6,	0x129F,	%o4
	edge8	%g4,	%o7,	%l1
	edge8ln	%i0,	%i2,	%o3
	sdiv	%l4,	0x1E63,	%g3
	movle	%icc,	%o0,	%o1
	fmovrdlz	%g7,	%f16,	%f10
	movrlez	%l2,	%g6,	%i6
	nop
	set	0x5D, %o1
	ldub	[%l7 + %o1],	%g5
	fnot1s	%f11,	%f10
	fmovdleu	%xcc,	%f25,	%f18
	sdivx	%i4,	0x0241,	%l5
	ldd	[%l7 + 0x48],	%o4
	fabsd	%f26,	%f24
	xor	%l6,	0x0E87,	%l3
	lduw	[%l7 + 0x1C],	%i5
	movge	%xcc,	%g1,	%i7
	orcc	%i3,	0x01CA,	%l0
	edge16ln	%i1,	%o2,	%o6
	array32	%g2,	%o4,	%g4
	or	%l1,	0x04FA,	%o7
	and	%i0,	%i2,	%l4
	fmuld8sux16	%f0,	%f4,	%f0
	ldx	[%l7 + 0x40],	%g3
	movrlez	%o0,	0x13C,	%o3
	stw	%g7,	[%l7 + 0x10]
	fmovdneg	%icc,	%f17,	%f28
	edge16l	%o1,	%g6,	%i6
	udivcc	%g5,	0x0EB2,	%i4
	ldub	[%l7 + 0x64],	%l2
	ldx	[%l7 + 0x20],	%l5
	nop
	set	0x60, %o5
	stx	%o5,	[%l7 + %o5]
	movrgez	%l6,	0x035,	%l3
	fmuld8ulx16	%f25,	%f23,	%f8
	orncc	%i5,	0x05F6,	%g1
	sllx	%i7,	0x03,	%i3
	xor	%l0,	%o2,	%o6
	orcc	%g2,	%i1,	%g4
	fpadd32	%f28,	%f10,	%f28
	edge16n	%l1,	%o7,	%o4
	udivx	%i2,	0x0EF1,	%i0
	fxnors	%f4,	%f3,	%f0
	fcmpne32	%f12,	%f20,	%l4
	movrne	%o0,	%o3,	%g3
	ldx	[%l7 + 0x20],	%g7
	fcmple32	%f20,	%f30,	%g6
	orcc	%o1,	%g5,	%i6
	save %l2, %l5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o5,	%l3,	%i5
	andncc	%g1,	%i7,	%l6
	edge32	%i3,	%o2,	%l0
	ldsb	[%l7 + 0x5F],	%g2
	fnand	%f4,	%f2,	%f16
	fmul8x16	%f12,	%f26,	%f18
	fcmple32	%f4,	%f4,	%i1
	fmovrdne	%g4,	%f30,	%f18
	udivx	%o6,	0x1B59,	%o7
	orcc	%o4,	%l1,	%i2
	ldsw	[%l7 + 0x64],	%i0
	sra	%l4,	0x15,	%o3
	move	%xcc,	%o0,	%g3
	movneg	%icc,	%g6,	%o1
	ldsb	[%l7 + 0x15],	%g7
	orn	%i6,	0x0728,	%l2
	smulcc	%g5,	0x1CC9,	%i4
	fpmerge	%f19,	%f6,	%f16
	movn	%xcc,	%o5,	%l3
	fexpand	%f10,	%f20
	fmovscs	%icc,	%f30,	%f10
	subcc	%l5,	%g1,	%i7
	smulcc	%i5,	0x1578,	%i3
	andncc	%l6,	%l0,	%g2
	fpadd32s	%f15,	%f5,	%f0
	srl	%o2,	%i1,	%g4
	edge32n	%o6,	%o7,	%l1
	srl	%o4,	0x1E,	%i2
	fabsd	%f8,	%f6
	orcc	%l4,	%i0,	%o3
	nop
	set	0x56, %i4
	ldsh	[%l7 + %i4],	%g3
	movrlez	%g6,	0x31F,	%o1
	movne	%xcc,	%g7,	%o0
	stb	%i6,	[%l7 + 0x36]
	ldx	[%l7 + 0x18],	%l2
	ldsh	[%l7 + 0x16],	%g5
	movl	%icc,	%i4,	%o5
	movrgz	%l5,	0x207,	%l3
	edge32n	%i7,	%g1,	%i3
	ldub	[%l7 + 0x18],	%l6
	sdivcc	%i5,	0x0E61,	%l0
	movvs	%icc,	%g2,	%o2
	movneg	%icc,	%g4,	%o6
	or	%i1,	0x12E9,	%l1
	orn	%o7,	%i2,	%l4
	srax	%i0,	0x0E,	%o3
	stb	%o4,	[%l7 + 0x37]
	st	%f14,	[%l7 + 0x60]
	alignaddrl	%g3,	%g6,	%g7
	orcc	%o1,	%i6,	%o0
	or	%l2,	0x07D9,	%g5
	fornot1s	%f4,	%f0,	%f30
	movgu	%icc,	%o5,	%i4
	movle	%xcc,	%l3,	%i7
	movrgz	%l5,	0x06A,	%g1
	fmovrdgez	%i3,	%f18,	%f0
	sir	0x042C
	udiv	%l6,	0x06E3,	%i5
	sll	%g2,	%o2,	%g4
	srl	%l0,	%i1,	%l1
	mova	%icc,	%o7,	%o6
	udivx	%i2,	0x10F6,	%i0
	subcc	%o3,	%l4,	%g3
	save %o4, 0x0AA7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f30,	%f22,	%f26
	alignaddrl	%g6,	%i6,	%o1
	movgu	%xcc,	%l2,	%g5
	movg	%xcc,	%o0,	%o5
	orcc	%l3,	0x19AD,	%i7
	mulscc	%i4,	%g1,	%i3
	movvc	%xcc,	%l6,	%i5
	fornot2s	%f30,	%f29,	%f14
	fcmpes	%fcc0,	%f24,	%f26
	std	%f6,	[%l7 + 0x10]
	addc	%l5,	0x15FD,	%g2
	sub	%o2,	%g4,	%i1
	fmovde	%xcc,	%f4,	%f18
	xor	%l1,	0x1B0B,	%l0
	movn	%xcc,	%o6,	%i2
	sdivcc	%i0,	0x14F6,	%o3
	save %l4, 0x19C3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o4,	0x064,	%g3
	fcmped	%fcc0,	%f2,	%f4
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	or	%l2,	%i6,	%o0
	st	%f20,	[%l7 + 0x50]
	edge8	%o5,	%l3,	%g5
	stx	%i7,	[%l7 + 0x18]
	movneg	%xcc,	%i4,	%g1
	ldsh	[%l7 + 0x3E],	%l6
	xorcc	%i3,	0x00B8,	%i5
	fmovse	%xcc,	%f14,	%f6
	movcs	%xcc,	%g2,	%l5
	edge8ln	%g4,	%o2,	%l1
	edge16ln	%l0,	%o6,	%i1
	udivx	%i0,	0x0E05,	%o3
	alignaddrl	%i2,	%o7,	%o4
	ldub	[%l7 + 0x6F],	%l4
	edge32	%g7,	%g6,	%o1
	udivcc	%g3,	0x1026,	%l2
	add	%i6,	0x170B,	%o0
	movl	%xcc,	%o5,	%g5
	xorcc	%i7,	0x0784,	%l3
	fmovsa	%icc,	%f31,	%f2
	ldub	[%l7 + 0x50],	%i4
	movcc	%icc,	%l6,	%i3
	fmovsne	%xcc,	%f2,	%f6
	movne	%xcc,	%g1,	%g2
	edge16l	%i5,	%g4,	%o2
	restore %l5, 0x0D92, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o6,	%i1,	%i0
	fmovdg	%icc,	%f13,	%f16
	addcc	%o3,	%l1,	%i2
	std	%f8,	[%l7 + 0x78]
	and	%o7,	%l4,	%o4
	ldsb	[%l7 + 0x25],	%g7
	orn	%g6,	%g3,	%o1
	movrgez	%i6,	%o0,	%l2
	addc	%o5,	0x1AFE,	%i7
	array16	%l3,	%g5,	%i4
	fmovrdgz	%i3,	%f26,	%f14
	subcc	%g1,	%g2,	%i5
	fmovrdlz	%l6,	%f26,	%f30
	fcmpgt16	%f20,	%f24,	%o2
	sdiv	%l5,	0x0341,	%l0
	fcmps	%fcc1,	%f12,	%f12
	sethi	0x1446,	%o6
	srax	%i1,	0x08,	%g4
	orn	%i0,	%o3,	%i2
	subcc	%l1,	0x1748,	%l4
	movre	%o4,	%g7,	%g6
	movne	%icc,	%g3,	%o1
	stw	%o7,	[%l7 + 0x28]
	edge32ln	%i6,	%o0,	%l2
	fmovsneg	%xcc,	%f4,	%f6
	fxnor	%f6,	%f28,	%f12
	movrne	%i7,	%l3,	%o5
	srlx	%i4,	0x01,	%g5
	xnor	%i3,	0x1A86,	%g1
	fpmerge	%f25,	%f2,	%f6
	movne	%icc,	%i5,	%l6
	and	%o2,	%l5,	%l0
	movvc	%icc,	%g2,	%i1
	stw	%o6,	[%l7 + 0x60]
	movcc	%icc,	%i0,	%o3
	movn	%xcc,	%i2,	%l1
	movg	%xcc,	%g4,	%o4
	edge16l	%g7,	%g6,	%g3
	umul	%l4,	0x13F2,	%o1
	smulcc	%i6,	%o7,	%o0
	movrlz	%i7,	%l3,	%o5
	srl	%l2,	%i4,	%i3
	fcmps	%fcc2,	%f7,	%f2
	andncc	%g5,	%i5,	%g1
	srl	%o2,	%l5,	%l0
	movpos	%icc,	%g2,	%i1
	udivcc	%o6,	0x0B90,	%i0
	xnor	%l6,	0x1EC5,	%o3
	movgu	%icc,	%l1,	%i2
	sdivcc	%g4,	0x0889,	%o4
	xnor	%g6,	%g3,	%l4
	fpsub32s	%f27,	%f23,	%f29
	edge16	%g7,	%o1,	%i6
	ldsh	[%l7 + 0x4E],	%o7
	fmovdvs	%xcc,	%f9,	%f18
	andn	%o0,	%i7,	%l3
	umulcc	%l2,	%o5,	%i3
	stw	%g5,	[%l7 + 0x14]
	ldd	[%l7 + 0x58],	%i4
	movn	%icc,	%i5,	%o2
	umulcc	%g1,	0x0EC1,	%l0
	subcc	%g2,	%l5,	%i1
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f22
	fmovrsgz	%o6,	%f28,	%f15
	ldsh	[%l7 + 0x6E],	%i0
	ldub	[%l7 + 0x3B],	%l6
	fmul8ulx16	%f10,	%f30,	%f12
	movcs	%icc,	%l1,	%i2
	movg	%icc,	%o3,	%g4
	orcc	%g6,	%o4,	%l4
	movne	%icc,	%g3,	%g7
	sllx	%o1,	0x09,	%o7
	movvs	%xcc,	%i6,	%i7
	sdivx	%o0,	0x0697,	%l3
	alignaddrl	%l2,	%i3,	%g5
	st	%f31,	[%l7 + 0x4C]
	srlx	%i4,	0x04,	%o5
	sll	%i5,	%o2,	%l0
	alignaddr	%g1,	%l5,	%i1
	stx	%g2,	[%l7 + 0x08]
	fmovrdlez	%o6,	%f2,	%f4
	sdivcc	%l6,	0x19ED,	%l1
	smulcc	%i2,	0x1037,	%o3
	edge8n	%i0,	%g6,	%o4
	xnorcc	%l4,	0x1874,	%g4
	alignaddrl	%g7,	%g3,	%o7
	ldsw	[%l7 + 0x68],	%i6
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	sethi	0x1FF4,	%l2
	fmovrdlez	%i3,	%f4,	%f8
	movg	%xcc,	%g5,	%i4
	orcc	%l3,	0x1520,	%i5
	fmovsn	%xcc,	%f15,	%f19
	movvs	%xcc,	%o5,	%l0
	sllx	%g1,	0x05,	%o2
	orcc	%l5,	%i1,	%o6
	movle	%xcc,	%g2,	%l1
	fmovrdlz	%l6,	%f6,	%f12
	sllx	%i2,	%o3,	%g6
	sdivx	%i0,	0x1991,	%l4
	fzero	%f12
	or	%g4,	0x1008,	%g7
	fors	%f1,	%f25,	%f23
	add	%g3,	0x19B9,	%o4
	movg	%xcc,	%i6,	%o1
	fcmps	%fcc3,	%f12,	%f18
	movcc	%icc,	%o7,	%i7
	alignaddrl	%l2,	%i3,	%g5
	fmovspos	%icc,	%f22,	%f21
	fcmped	%fcc2,	%f22,	%f8
	fmovsneg	%icc,	%f16,	%f3
	movvs	%xcc,	%i4,	%l3
	fnegd	%f22,	%f18
	movcs	%icc,	%i5,	%o5
	alignaddrl	%l0,	%o0,	%g1
	fabss	%f1,	%f16
	movrlez	%l5,	%i1,	%o2
	ldx	[%l7 + 0x70],	%o6
	movrne	%l1,	0x39C,	%l6
	orn	%g2,	0x1DA7,	%o3
	sir	0x00FB
	edge32l	%i2,	%i0,	%l4
	array8	%g4,	%g7,	%g6
	xor	%o4,	%i6,	%g3
	save %o1, 0x03B5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l2,	%i3
	addcc	%g5,	0x0559,	%i4
	stw	%l3,	[%l7 + 0x64]
	movcs	%icc,	%i5,	%o5
	fmul8sux16	%f16,	%f2,	%f30
	umul	%l0,	0x1A88,	%o0
	movrne	%o7,	0x229,	%g1
	smul	%i1,	0x1590,	%o2
	sdivcc	%l5,	0x111E,	%l1
	smul	%o6,	0x1B5A,	%l6
	lduh	[%l7 + 0x78],	%o3
	edge8ln	%i2,	%i0,	%g2
	array32	%l4,	%g4,	%g7
	edge32l	%g6,	%i6,	%g3
	sir	0x00AD
	sub	%o4,	0x1692,	%i7
	fmovscc	%icc,	%f12,	%f13
	fsrc2s	%f6,	%f13
	edge8l	%o1,	%l2,	%i3
	andcc	%g5,	%l3,	%i4
	movneg	%icc,	%o5,	%i5
	andn	%l0,	%o0,	%o7
	addccc	%i1,	%g1,	%l5
	movcs	%icc,	%o2,	%l1
	ldsw	[%l7 + 0x6C],	%l6
	sdivcc	%o3,	0x086C,	%i2
	ldsh	[%l7 + 0x44],	%i0
	addccc	%o6,	0x1FBE,	%g2
	orncc	%l4,	%g7,	%g4
	add	%i6,	0x1826,	%g3
	popc	%g6,	%o4
	udiv	%o1,	0x1019,	%i7
	array16	%l2,	%i3,	%l3
	fmul8x16	%f25,	%f26,	%f8
	st	%f9,	[%l7 + 0x18]
	movrlz	%g5,	%o5,	%i5
	orncc	%i4,	%l0,	%o0
	ldsw	[%l7 + 0x60],	%i1
	umul	%o7,	0x15F6,	%g1
	sdivx	%l5,	0x1AD3,	%l1
	popc	0x0A4E,	%o2
	move	%icc,	%o3,	%i2
	subc	%l6,	0x0816,	%i0
	edge32n	%o6,	%g2,	%g7
	move	%xcc,	%g4,	%l4
	edge32l	%g3,	%g6,	%o4
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%o1
	movrgz	%i7,	%l2,	%i3
	udiv	%l3,	0x1FFA,	%i6
	sra	%o5,	0x0A,	%i5
	array16	%g5,	%l0,	%i4
	edge16l	%i1,	%o7,	%o0
	fmul8sux16	%f6,	%f28,	%f8
	movrgz	%l5,	%l1,	%o2
	add	%g1,	0x0485,	%o3
	udivx	%i2,	0x0E54,	%i0
	movg	%xcc,	%o6,	%l6
	ldx	[%l7 + 0x30],	%g2
	xor	%g4,	%l4,	%g3
	movgu	%icc,	%g6,	%g7
	fcmps	%fcc0,	%f29,	%f30
	srl	%o1,	0x0C,	%o4
	sub	%i7,	0x0A9C,	%i3
	sir	0x1E56
	ldx	[%l7 + 0x18],	%l3
	ldsw	[%l7 + 0x38],	%l2
	srlx	%i6,	0x1C,	%o5
	movre	%i5,	0x1F6,	%g5
	ldsb	[%l7 + 0x46],	%i4
	sir	0x1BFA
	fmovrsne	%l0,	%f23,	%f23
	xorcc	%o7,	%i1,	%l5
	subccc	%l1,	0x0D66,	%o2
	edge8ln	%o0,	%o3,	%i2
	array32	%i0,	%o6,	%g1
	fnands	%f21,	%f16,	%f16
	movg	%icc,	%g2,	%g4
	xor	%l6,	0x10DA,	%l4
	edge32l	%g6,	%g3,	%o1
	nop
	set	0x74, %g2
	sth	%o4,	[%l7 + %g2]
	movg	%xcc,	%i7,	%i3
	fmovdle	%icc,	%f22,	%f31
	smulcc	%l3,	%l2,	%g7
	lduw	[%l7 + 0x34],	%i6
	fmuld8sux16	%f9,	%f9,	%f6
	fmovdg	%xcc,	%f20,	%f5
	ldsh	[%l7 + 0x10],	%i5
	addc	%g5,	0x0A37,	%i4
	sdivx	%o5,	0x15F4,	%o7
	popc	0x0E95,	%i1
	edge16	%l5,	%l0,	%o2
	fmovscs	%icc,	%f18,	%f8
	lduw	[%l7 + 0x18],	%o0
	st	%f1,	[%l7 + 0x38]
	ld	[%l7 + 0x0C],	%f15
	movre	%l1,	0x15A,	%o3
	faligndata	%f18,	%f24,	%f28
	sdivx	%i0,	0x0ED5,	%o6
	nop
	set	0x0E, %l1
	stb	%g1,	[%l7 + %l1]
	faligndata	%f30,	%f4,	%f6
	movrlez	%i2,	0x11E,	%g2
	subc	%l6,	%l4,	%g6
	movcs	%xcc,	%g4,	%o1
	orcc	%g3,	0x04D2,	%i7
	sub	%i3,	%o4,	%l3
	movleu	%xcc,	%g7,	%i6
	save %i5, %l2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o5,	%o7,	%i4
	sll	%i1,	%l0,	%l5
	orn	%o0,	0x1493,	%o2
	movn	%xcc,	%o3,	%i0
	fsrc1s	%f17,	%f9
	movvc	%xcc,	%l1,	%o6
	subc	%g1,	%i2,	%g2
	fors	%f31,	%f19,	%f9
	ld	[%l7 + 0x30],	%f28
	mulscc	%l6,	%l4,	%g6
	array32	%g4,	%o1,	%g3
	for	%f4,	%f24,	%f6
	fmovrsne	%i3,	%f28,	%f5
	movn	%icc,	%i7,	%l3
	fmovdneg	%icc,	%f12,	%f17
	ldsb	[%l7 + 0x59],	%g7
	fmovrse	%o4,	%f18,	%f25
	stw	%i5,	[%l7 + 0x50]
	bshuffle	%f8,	%f8,	%f16
	stx	%i6,	[%l7 + 0x60]
	save %l2, 0x11B8, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x48],	%f17
	fmovdle	%icc,	%f18,	%f17
	subccc	%g5,	0x0C50,	%i4
	sllx	%o7,	%l0,	%i1
	udiv	%o0,	0x0EE6,	%l5
	array8	%o3,	%i0,	%o2
	fandnot2s	%f30,	%f3,	%f31
	lduh	[%l7 + 0x44],	%o6
	std	%f0,	[%l7 + 0x40]
	add	%g1,	0x0072,	%i2
	fpadd16s	%f28,	%f4,	%f3
	fmovsgu	%xcc,	%f4,	%f29
	movgu	%icc,	%l1,	%g2
	smulcc	%l4,	%l6,	%g6
	ldsh	[%l7 + 0x52],	%g4
	edge32l	%o1,	%i3,	%g3
	edge8n	%i7,	%l3,	%o4
	movrgez	%i5,	0x2DA,	%g7
	sub	%l2,	%i6,	%g5
	movgu	%xcc,	%o5,	%o7
	udiv	%i4,	0x12FB,	%i1
	movneg	%xcc,	%o0,	%l5
	edge16l	%l0,	%i0,	%o3
	stw	%o6,	[%l7 + 0x0C]
	fmovdn	%xcc,	%f10,	%f7
	edge16ln	%g1,	%o2,	%i2
	orncc	%l1,	0x1771,	%l4
	fcmps	%fcc0,	%f7,	%f11
	stb	%g2,	[%l7 + 0x76]
	sth	%l6,	[%l7 + 0x58]
	addcc	%g6,	0x0333,	%o1
	fornot1	%f26,	%f28,	%f2
	subc	%i3,	0x1603,	%g4
	umulcc	%g3,	0x15FC,	%l3
	sethi	0x1E79,	%i7
	srax	%i5,	0x05,	%o4
	fnot2s	%f30,	%f5
	edge32	%g7,	%i6,	%l2
	edge32n	%o5,	%o7,	%i4
	alignaddrl	%i1,	%g5,	%o0
	movleu	%icc,	%l0,	%l5
	movg	%xcc,	%i0,	%o6
	ld	[%l7 + 0x44],	%f1
	movpos	%icc,	%g1,	%o2
	ldd	[%l7 + 0x10],	%i2
	movre	%l1,	0x06F,	%l4
	ldd	[%l7 + 0x70],	%f24
	sdivx	%o3,	0x03A2,	%l6
	fmovdneg	%icc,	%f13,	%f31
	movrne	%g2,	0x0E3,	%o1
	sdivx	%g6,	0x03E4,	%g4
	mulx	%g3,	0x162F,	%l3
	movrgz	%i7,	0x15E,	%i3
	xorcc	%i5,	%o4,	%g7
	fornot1	%f6,	%f18,	%f16
	movrgz	%l2,	0x25F,	%i6
	sir	0x1CD2
	alignaddr	%o7,	%o5,	%i4
	fcmpne16	%f0,	%f6,	%g5
	fcmpd	%fcc2,	%f6,	%f6
	movcs	%icc,	%o0,	%l0
	movpos	%xcc,	%i1,	%l5
	movrlez	%i0,	0x08C,	%g1
	stx	%o6,	[%l7 + 0x38]
	ld	[%l7 + 0x60],	%f2
	edge32ln	%i2,	%o2,	%l1
	fnot1s	%f20,	%f16
	movpos	%xcc,	%o3,	%l4
	umulcc	%g2,	0x0E1B,	%o1
	movcc	%xcc,	%g6,	%l6
	fpmerge	%f16,	%f13,	%f2
	ldx	[%l7 + 0x40],	%g3
	movl	%xcc,	%g4,	%l3
	srlx	%i3,	%i7,	%i5
	sdivx	%o4,	0x1861,	%l2
	and	%i6,	0x03E6,	%g7
	array8	%o7,	%o5,	%g5
	sra	%o0,	0x1E,	%l0
	mulscc	%i1,	%i4,	%l5
	save %g1, 0x1AEB, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i2,	%o2,	%i0
	stb	%l1,	[%l7 + 0x74]
	fxnor	%f0,	%f6,	%f6
	fmovse	%xcc,	%f1,	%f3
	movl	%icc,	%l4,	%o3
	movvs	%icc,	%g2,	%o1
	array32	%l6,	%g6,	%g3
	srlx	%l3,	0x15,	%g4
	orcc	%i3,	%i7,	%o4
	stb	%i5,	[%l7 + 0x3B]
	movrgz	%i6,	%g7,	%o7
	fxnor	%f12,	%f0,	%f4
	sllx	%o5,	%l2,	%g5
	lduw	[%l7 + 0x1C],	%l0
	orcc	%i1,	%i4,	%o0
	srl	%g1,	0x11,	%l5
	array16	%o6,	%i2,	%i0
	and	%l1,	0x15D3,	%l4
	srl	%o3,	%g2,	%o1
	movrlz	%l6,	%g6,	%g3
	nop
	set	0x46, %o3
	lduh	[%l7 + %o3],	%l3
	subcc	%o2,	0x03FC,	%g4
	edge16ln	%i3,	%i7,	%i5
	movrgz	%i6,	0x197,	%g7
	andn	%o4,	%o7,	%o5
	fxor	%f6,	%f18,	%f2
	movneg	%icc,	%g5,	%l2
	mulx	%l0,	%i4,	%o0
	edge8n	%g1,	%i1,	%o6
	sdivx	%l5,	0x061F,	%i2
	fmovscs	%xcc,	%f4,	%f4
	stb	%l1,	[%l7 + 0x31]
	movcs	%xcc,	%i0,	%o3
	array16	%l4,	%o1,	%l6
	ldsw	[%l7 + 0x4C],	%g6
	st	%f29,	[%l7 + 0x3C]
	smulcc	%g3,	0x1769,	%g2
	ld	[%l7 + 0x34],	%f1
	stb	%l3,	[%l7 + 0x37]
	fmovdge	%icc,	%f17,	%f23
	subc	%o2,	0x09AB,	%i3
	array32	%g4,	%i7,	%i6
	restore %g7, 0x0142, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o4,	%o7
	lduw	[%l7 + 0x7C],	%g5
	udivcc	%o5,	0x195C,	%l2
	nop
	set	0x18, %l2
	ldsw	[%l7 + %l2],	%i4
	movvs	%xcc,	%l0,	%o0
	movrgez	%g1,	0x1E6,	%i1
	andncc	%l5,	%o6,	%i2
	fornot1s	%f0,	%f21,	%f8
	ldsw	[%l7 + 0x10],	%l1
	edge8l	%o3,	%l4,	%i0
	edge16ln	%l6,	%o1,	%g6
	smulcc	%g2,	0x0B8A,	%l3
	fmovrdgez	%g3,	%f30,	%f4
	movleu	%xcc,	%i3,	%g4
	fmovsvc	%icc,	%f30,	%f2
	movneg	%xcc,	%o2,	%i7
	fones	%f31
	stx	%g7,	[%l7 + 0x70]
	edge16ln	%i6,	%o4,	%o7
	fmovrse	%g5,	%f23,	%f2
	movg	%xcc,	%i5,	%l2
	edge8l	%i4,	%o5,	%l0
	fpadd16	%f10,	%f0,	%f8
	fmovsne	%icc,	%f19,	%f29
	movge	%xcc,	%g1,	%o0
	sdivcc	%l5,	0x0284,	%i1
	and	%o6,	%i2,	%l1
	sth	%l4,	[%l7 + 0x4C]
	ldsw	[%l7 + 0x6C],	%i0
	stx	%l6,	[%l7 + 0x30]
	orn	%o3,	%g6,	%o1
	fmovdvc	%icc,	%f2,	%f0
	edge32ln	%l3,	%g3,	%g2
	edge8	%i3,	%o2,	%g4
	fmovrdlez	%i7,	%f16,	%f16
	srax	%g7,	%o4,	%i6
	lduw	[%l7 + 0x1C],	%g5
	fmovdcs	%xcc,	%f14,	%f12
	fnot2s	%f3,	%f25
	subc	%o7,	0x1522,	%l2
	fcmps	%fcc0,	%f20,	%f22
	fmovsgu	%icc,	%f12,	%f27
	lduh	[%l7 + 0x62],	%i5
	edge8n	%i4,	%l0,	%g1
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%o0
	ldsh	[%l7 + 0x76],	%l5
	move	%xcc,	%o5,	%i1
	and	%o6,	0x12D8,	%i2
	fone	%f24
	ldsw	[%l7 + 0x14],	%l4
	sllx	%l1,	0x12,	%l6
	orcc	%o3,	0x1C4B,	%g6
	movl	%xcc,	%i0,	%l3
	st	%f25,	[%l7 + 0x34]
	fmovsgu	%xcc,	%f7,	%f22
	sir	0x1A4A
	ldd	[%l7 + 0x48],	%g2
	sub	%g2,	0x15B6,	%o1
	edge32l	%o2,	%g4,	%i7
	andncc	%g7,	%i3,	%o4
	array32	%g5,	%o7,	%l2
	movrgez	%i5,	%i6,	%l0
	andcc	%i4,	0x0948,	%g1
	srl	%o0,	%l5,	%o5
	edge32ln	%i1,	%i2,	%l4
	nop
	set	0x14, %i0
	ldsw	[%l7 + %i0],	%l1
	nop
	set	0x38, %g5
	stx	%o6,	[%l7 + %g5]
	srax	%l6,	%g6,	%o3
	sll	%i0,	%l3,	%g3
	stb	%g2,	[%l7 + 0x0C]
	movrlez	%o2,	%o1,	%i7
	andcc	%g7,	%i3,	%o4
	move	%xcc,	%g5,	%g4
	sir	0x1824
	fmovrdgez	%o7,	%f10,	%f8
	movl	%xcc,	%l2,	%i5
	edge8	%l0,	%i4,	%g1
	fpsub16s	%f10,	%f12,	%f5
	fmovsle	%icc,	%f10,	%f3
	fcmps	%fcc1,	%f2,	%f15
	and	%i6,	%o0,	%l5
	fpack16	%f20,	%f24
	fmovsvs	%icc,	%f29,	%f19
	mulscc	%o5,	%i2,	%l4
	fandnot2s	%f4,	%f11,	%f6
	alignaddrl	%l1,	%i1,	%o6
	andcc	%l6,	0x0DD0,	%o3
	fmovdvs	%xcc,	%f5,	%f23
	std	%f12,	[%l7 + 0x20]
	smul	%i0,	%l3,	%g3
	fmuld8sux16	%f27,	%f3,	%f20
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	movpos	%xcc,	%g6,	%i7
	ldsb	[%l7 + 0x64],	%g7
	movg	%xcc,	%o4,	%g5
	orcc	%i3,	%o7,	%g4
	srl	%l2,	0x00,	%l0
	edge32n	%i5,	%g1,	%i4
	andcc	%o0,	0x137D,	%l5
	movpos	%xcc,	%o5,	%i2
	save %l4, %i6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o6,	%l6
	movl	%icc,	%o3,	%i0
	fpadd16s	%f25,	%f29,	%f5
	edge8ln	%i1,	%l3,	%g3
	siam	0x4
	st	%f19,	[%l7 + 0x1C]
	fmovsleu	%xcc,	%f26,	%f16
	for	%f26,	%f6,	%f10
	movcs	%xcc,	%g2,	%o2
	edge32l	%o1,	%i7,	%g7
	edge32l	%o4,	%g5,	%i3
	smul	%o7,	%g4,	%l2
	edge16n	%g6,	%i5,	%g1
	srl	%l0,	%i4,	%o0
	ldsw	[%l7 + 0x3C],	%o5
	fmovrsgz	%i2,	%f20,	%f11
	umulcc	%l4,	0x1486,	%l5
	fmovrdlz	%l1,	%f6,	%f20
	sdiv	%o6,	0x0CA2,	%l6
	fsrc2s	%f30,	%f30
	edge32	%i6,	%i0,	%i1
	udivx	%o3,	0x0EF5,	%g3
	movgu	%xcc,	%g2,	%o2
	movrlez	%o1,	%l3,	%g7
	movn	%xcc,	%o4,	%g5
	mova	%icc,	%i3,	%i7
	smul	%o7,	0x1DAD,	%l2
	umul	%g6,	0x03B5,	%i5
	edge32n	%g4,	%g1,	%i4
	edge32n	%l0,	%o0,	%o5
	fmovsg	%icc,	%f31,	%f24
	sub	%i2,	0x08CA,	%l5
	sethi	0x0081,	%l4
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f12
	movne	%xcc,	%l1,	%o6
	popc	%l6,	%i6
	fmovdneg	%xcc,	%f24,	%f24
	srl	%i1,	0x14,	%o3
	edge32n	%g3,	%i0,	%g2
	fcmpgt32	%f28,	%f22,	%o1
	fmovdvc	%icc,	%f17,	%f21
	fornot2	%f24,	%f26,	%f20
	stw	%o2,	[%l7 + 0x48]
	fzeros	%f9
	edge32l	%l3,	%g7,	%o4
	edge8n	%g5,	%i7,	%i3
	popc	0x037A,	%l2
	alignaddr	%o7,	%g6,	%i5
	andcc	%g4,	%i4,	%g1
	fmovsneg	%icc,	%f1,	%f24
	fpack32	%f24,	%f18,	%f30
	fpsub16	%f18,	%f24,	%f6
	fnor	%f22,	%f6,	%f26
	fmovscc	%icc,	%f24,	%f7
	fpsub32	%f20,	%f8,	%f2
	smulcc	%l0,	0x1072,	%o0
	edge8l	%o5,	%l5,	%l4
	umulcc	%l1,	%o6,	%i2
	fnor	%f0,	%f28,	%f14
	popc	%l6,	%i1
	movne	%xcc,	%o3,	%i6
	smulcc	%g3,	%i0,	%g2
	fpmerge	%f20,	%f4,	%f16
	ldx	[%l7 + 0x38],	%o2
	orncc	%l3,	%o1,	%g7
	sir	0x1452
	xnor	%o4,	%i7,	%g5
	edge32ln	%l2,	%o7,	%g6
	array32	%i5,	%g4,	%i4
	alignaddrl	%i3,	%l0,	%o0
	edge32	%g1,	%l5,	%l4
	movpos	%xcc,	%l1,	%o5
	mova	%xcc,	%o6,	%i2
	fmovsleu	%icc,	%f13,	%f6
	edge32n	%l6,	%o3,	%i6
	srlx	%i1,	0x0E,	%g3
	edge32n	%i0,	%o2,	%l3
	fmovrsne	%g2,	%f9,	%f27
	orcc	%o1,	0x0DBC,	%g7
	lduh	[%l7 + 0x5E],	%i7
	restore %g5, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g6,	0x004A,	%o7
	movrgez	%g4,	0x154,	%i5
	or	%i3,	0x0FB5,	%i4
	ldsw	[%l7 + 0x10],	%o0
	alignaddrl	%g1,	%l5,	%l0
	movg	%icc,	%l1,	%o5
	movge	%icc,	%l4,	%o6
	subccc	%l6,	0x1FAB,	%i2
	movvs	%xcc,	%o3,	%i1
	fcmpeq16	%f12,	%f24,	%i6
	udiv	%i0,	0x07FC,	%o2
	edge16l	%g3,	%g2,	%l3
	std	%f22,	[%l7 + 0x58]
	movcc	%xcc,	%g7,	%o1
	fnot2	%f28,	%f14
	sub	%g5,	0x0879,	%o4
	sllx	%i7,	0x1C,	%g6
	movge	%xcc,	%o7,	%g4
	subcc	%i5,	%i3,	%l2
	sra	%i4,	%g1,	%l5
	fmovdle	%xcc,	%f6,	%f26
	movpos	%icc,	%l0,	%l1
	movre	%o5,	0x322,	%l4
	st	%f18,	[%l7 + 0x1C]
	fmovsne	%xcc,	%f22,	%f13
	movg	%xcc,	%o0,	%l6
	movgu	%icc,	%i2,	%o3
	andn	%o6,	%i6,	%i1
	fxnor	%f24,	%f8,	%f4
	movneg	%xcc,	%o2,	%i0
	orcc	%g2,	0x1B9C,	%g3
	subcc	%g7,	%l3,	%g5
	fcmple16	%f12,	%f30,	%o4
	fornot1s	%f27,	%f26,	%f6
	andn	%o1,	%i7,	%g6
	movneg	%icc,	%o7,	%i5
	movrlez	%g4,	%l2,	%i4
	fmovse	%xcc,	%f23,	%f4
	ldsh	[%l7 + 0x68],	%i3
	movcs	%icc,	%l5,	%g1
	sdiv	%l1,	0x0463,	%o5
	edge32l	%l4,	%l0,	%l6
	movrlez	%o0,	%o3,	%i2
	movg	%icc,	%i6,	%i1
	ldsh	[%l7 + 0x38],	%o6
	movge	%xcc,	%i0,	%o2
	edge8l	%g2,	%g3,	%l3
	edge8ln	%g5,	%g7,	%o1
	fabsd	%f20,	%f4
	stw	%i7,	[%l7 + 0x74]
	movg	%icc,	%o4,	%g6
	stb	%i5,	[%l7 + 0x48]
	andn	%o7,	0x0D5E,	%g4
	array32	%l2,	%i4,	%i3
	srlx	%g1,	%l5,	%l1
	mulx	%o5,	%l4,	%l6
	ldx	[%l7 + 0x58],	%o0
	add	%o3,	0x1B7D,	%l0
	movrlez	%i6,	0x3E9,	%i2
	edge8l	%i1,	%o6,	%i0
	mova	%xcc,	%o2,	%g2
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	srlx	%o1,	%g7,	%i7
	or	%o4,	0x1950,	%g6
	nop
	set	0x7C, %i7
	stb	%o7,	[%l7 + %i7]
	ldd	[%l7 + 0x78],	%f2
	xor	%g4,	%l2,	%i4
	move	%xcc,	%i5,	%g1
	fmovsgu	%icc,	%f3,	%f16
	fnot2	%f22,	%f8
	smul	%i3,	0x122E,	%l5
	fmovsleu	%xcc,	%f26,	%f0
	movrlz	%l1,	0x1A1,	%o5
	fmovsn	%icc,	%f22,	%f1
	fpadd32	%f10,	%f8,	%f14
	sth	%l4,	[%l7 + 0x3C]
	fsrc1s	%f9,	%f2
	move	%xcc,	%l6,	%o3
	lduh	[%l7 + 0x3A],	%l0
	movvs	%xcc,	%i6,	%i2
	subccc	%i1,	0x0FE1,	%o0
	subccc	%o6,	%o2,	%g2
	stx	%i0,	[%l7 + 0x70]
	fmovdl	%xcc,	%f28,	%f1
	array32	%l3,	%g5,	%g3
	sdiv	%g7,	0x0EFB,	%o1
	sub	%i7,	%g6,	%o7
	edge16l	%g4,	%o4,	%l2
	fmovd	%f22,	%f6
	udivcc	%i5,	0x07B1,	%g1
	xorcc	%i4,	0x17E6,	%l5
	stw	%i3,	[%l7 + 0x18]
	mulscc	%l1,	0x0E5F,	%o5
	edge16ln	%l4,	%o3,	%l0
	sub	%l6,	%i2,	%i6
	subccc	%o0,	0x0A09,	%i1
	or	%o2,	0x1424,	%g2
	fmovsgu	%icc,	%f18,	%f31
	movrne	%i0,	%o6,	%l3
	movvc	%xcc,	%g3,	%g7
	srl	%g5,	%i7,	%g6
	ldsh	[%l7 + 0x6C],	%o1
	orncc	%g4,	%o7,	%l2
	or	%i5,	0x1E34,	%o4
	srl	%i4,	0x1D,	%l5
	array8	%i3,	%g1,	%l1
	edge16l	%l4,	%o3,	%l0
	or	%l6,	%o5,	%i2
	movpos	%icc,	%o0,	%i6
	andn	%i1,	%g2,	%i0
	mulscc	%o2,	0x049A,	%l3
	fmovspos	%icc,	%f17,	%f13
	movrgz	%o6,	0x0BB,	%g3
	mulscc	%g5,	%g7,	%g6
	subccc	%o1,	0x1C8B,	%i7
	edge8	%g4,	%o7,	%l2
	edge8ln	%o4,	%i4,	%l5
	fpsub32	%f14,	%f22,	%f8
	movneg	%icc,	%i5,	%g1
	fmovscs	%xcc,	%f11,	%f15
	movcc	%xcc,	%l1,	%l4
	mulx	%i3,	%l0,	%o3
	edge8ln	%o5,	%i2,	%l6
	stb	%o0,	[%l7 + 0x42]
	fxors	%f10,	%f17,	%f4
	sdiv	%i6,	0x0ADE,	%i1
	movl	%xcc,	%g2,	%i0
	movrlez	%o2,	%l3,	%g3
	fpadd32s	%f0,	%f0,	%f31
	orn	%o6,	%g7,	%g6
	stb	%o1,	[%l7 + 0x7A]
	st	%f20,	[%l7 + 0x3C]
	edge32ln	%g5,	%g4,	%o7
	umulcc	%l2,	0x1507,	%i7
	andncc	%i4,	%o4,	%l5
	orn	%i5,	%g1,	%l1
	udiv	%i3,	0x017D,	%l0
	sra	%l4,	%o3,	%o5
	fmovsgu	%icc,	%f5,	%f2
	edge16	%l6,	%i2,	%o0
	fpsub32	%f30,	%f20,	%f12
	movrlz	%i1,	%g2,	%i0
	save %i6, 0x19A1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f28,	%f2
	ldd	[%l7 + 0x60],	%g2
	fabsd	%f30,	%f28
	fzeros	%f5
	sdivcc	%l3,	0x055B,	%g7
	smulcc	%g6,	0x11A3,	%o6
	fornot1	%f18,	%f12,	%f30
	subccc	%o1,	0x1AB6,	%g4
	fmovsle	%xcc,	%f28,	%f2
	sll	%g5,	%l2,	%o7
	fmovrsne	%i7,	%f24,	%f26
	movpos	%xcc,	%i4,	%o4
	alignaddr	%i5,	%l5,	%g1
	edge8l	%l1,	%l0,	%i3
	smulcc	%l4,	0x05D6,	%o5
	and	%o3,	%l6,	%i2
	subccc	%i1,	%g2,	%o0
	movpos	%icc,	%i6,	%o2
	movneg	%xcc,	%g3,	%l3
	movrgz	%g7,	0x3A5,	%i0
	mova	%icc,	%g6,	%o6
	ldsb	[%l7 + 0x63],	%o1
	pdist	%f22,	%f6,	%f2
	mova	%icc,	%g5,	%l2
	umulcc	%g4,	%i7,	%i4
	movg	%icc,	%o4,	%i5
	xnorcc	%o7,	%g1,	%l5
	movvc	%icc,	%l0,	%i3
	movneg	%xcc,	%l4,	%l1
	srl	%o3,	0x15,	%l6
	restore %i2, 0x1C92, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i1,	0x1DBA,	%o0
	movneg	%xcc,	%g2,	%i6
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fnands	%f10,	%f5,	%f27
	array8	%g7,	%g6,	%i0
	movn	%xcc,	%o6,	%o1
	fsrc1	%f16,	%f24
	fones	%f5
	movcs	%icc,	%g5,	%g4
	edge32ln	%i7,	%l2,	%i4
	popc	0x1BAB,	%o4
	move	%icc,	%i5,	%g1
	sra	%o7,	%l0,	%l5
	edge32ln	%l4,	%i3,	%o3
	movg	%xcc,	%l6,	%l1
	movneg	%xcc,	%i2,	%i1
	for	%f24,	%f8,	%f30
	edge16ln	%o0,	%o5,	%i6
	mova	%icc,	%g2,	%g3
	movneg	%xcc,	%o2,	%l3
	ld	[%l7 + 0x50],	%f25
	mulscc	%g6,	0x1A43,	%i0
	and	%o6,	0x0458,	%g7
	fpack32	%f26,	%f4,	%f30
	edge8n	%o1,	%g4,	%i7
	sir	0x0D41
	fmovdn	%xcc,	%f9,	%f17
	stw	%l2,	[%l7 + 0x68]
	edge32l	%g5,	%i4,	%i5
	movcc	%icc,	%o4,	%g1
	srlx	%l0,	0x16,	%l5
	fmovdneg	%icc,	%f26,	%f2
	fmovdleu	%xcc,	%f30,	%f3
	movrlez	%l4,	%i3,	%o3
	movpos	%icc,	%o7,	%l1
	fnot2s	%f3,	%f9
	movvc	%icc,	%l6,	%i1
	subc	%o0,	0x118C,	%o5
	stx	%i2,	[%l7 + 0x38]
	sllx	%g2,	0x09,	%i6
	andn	%g3,	%o2,	%g6
	fcmple32	%f30,	%f10,	%l3
	sethi	0x17AF,	%i0
	edge32ln	%o6,	%g7,	%g4
	orn	%o1,	%l2,	%i7
	mulscc	%g5,	0x07EF,	%i4
	edge16	%o4,	%g1,	%l0
	edge8n	%l5,	%i5,	%i3
	popc	%l4,	%o7
	fmovs	%f13,	%f14
	edge16n	%o3,	%l1,	%l6
	sdivcc	%i1,	0x02A0,	%o0
	ldsb	[%l7 + 0x23],	%i2
	andn	%g2,	%i6,	%g3
	edge16n	%o5,	%g6,	%o2
	xnor	%i0,	0x1ECC,	%o6
	fexpand	%f3,	%f28
	movl	%icc,	%g7,	%l3
	save %g4, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i7,	%i4,	%g5
	fmul8x16	%f0,	%f16,	%f20
	fmovdpos	%xcc,	%f6,	%f23
	ldd	[%l7 + 0x60],	%f4
	umul	%o4,	0x1B73,	%l0
	movle	%xcc,	%g1,	%l5
	fpadd32s	%f15,	%f3,	%f7
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%i5
	fmul8x16au	%f15,	%f13,	%f0
	fmovrdgez	%i3,	%f16,	%f8
	movg	%icc,	%o7,	%l4
	st	%f29,	[%l7 + 0x30]
	fmovrdgez	%o3,	%f0,	%f16
	fpadd32	%f10,	%f12,	%f22
	movpos	%icc,	%l6,	%i1
	umulcc	%o0,	0x1E01,	%i2
	ldd	[%l7 + 0x20],	%l0
	mova	%xcc,	%g2,	%i6
	sir	0x1EBA
	lduw	[%l7 + 0x3C],	%o5
	edge8l	%g6,	%o2,	%i0
	fone	%f0
	save %o6, %g3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l3,	%g4,	%l2
	fmovsvs	%icc,	%f23,	%f0
	movl	%icc,	%o1,	%i4
	udivx	%g5,	0x063A,	%i7
	st	%f31,	[%l7 + 0x20]
	lduw	[%l7 + 0x50],	%l0
	std	%f10,	[%l7 + 0x70]
	fpmerge	%f29,	%f20,	%f10
	edge8l	%o4,	%g1,	%l5
	fmovsneg	%icc,	%f27,	%f29
	srl	%i3,	0x1C,	%i5
	or	%l4,	%o3,	%l6
	ldub	[%l7 + 0x0B],	%o7
	or	%i1,	0x0468,	%o0
	movn	%xcc,	%i2,	%l1
	movn	%xcc,	%g2,	%o5
	umul	%g6,	0x1A9A,	%i6
	fmovrsne	%o2,	%f29,	%f8
	bshuffle	%f14,	%f2,	%f24
	fmovdcs	%icc,	%f27,	%f29
	nop
	set	0x08, %o4
	stb	%i0,	[%l7 + %o4]
	lduw	[%l7 + 0x50],	%o6
	edge16l	%g7,	%g3,	%g4
	edge16	%l2,	%l3,	%i4
	movvs	%xcc,	%g5,	%i7
	edge8n	%l0,	%o4,	%o1
	movge	%icc,	%l5,	%i3
	srlx	%i5,	0x0B,	%g1
	stx	%o3,	[%l7 + 0x58]
	umulcc	%l4,	0x0B1C,	%o7
	edge16l	%i1,	%l6,	%i2
	array8	%l1,	%g2,	%o0
	fmovscs	%xcc,	%f31,	%f6
	edge8ln	%g6,	%o5,	%o2
	movrgz	%i0,	0x0D0,	%i6
	movle	%icc,	%o6,	%g3
	alignaddr	%g7,	%g4,	%l3
	edge8n	%l2,	%i4,	%i7
	ldub	[%l7 + 0x1E],	%g5
	ldd	[%l7 + 0x40],	%o4
	orn	%o1,	0x03BB,	%l5
	move	%xcc,	%i3,	%l0
	addcc	%i5,	0x0A05,	%g1
	orncc	%o3,	0x1ED4,	%l4
	addc	%i1,	0x06AD,	%o7
	restore %l6, 0x08BF, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f17,	%f24,	%f25
	movvs	%xcc,	%g2,	%o0
	edge16l	%g6,	%l1,	%o2
	srax	%i0,	%o5,	%o6
	addccc	%i6,	0x0356,	%g3
	movvs	%xcc,	%g4,	%l3
	edge8n	%l2,	%i4,	%i7
	sra	%g7,	%g5,	%o1
	xor	%o4,	%i3,	%l0
	movrne	%i5,	0x357,	%g1
	array16	%o3,	%l4,	%l5
	ldx	[%l7 + 0x40],	%o7
	fandnot1	%f20,	%f26,	%f26
	fmuld8sux16	%f17,	%f6,	%f30
	movrgez	%i1,	0x067,	%i2
	movcc	%icc,	%l6,	%g2
	sethi	0x0EF1,	%o0
	movvs	%xcc,	%g6,	%o2
	movcs	%icc,	%i0,	%l1
	fmul8x16au	%f18,	%f3,	%f0
	orn	%o5,	0x036E,	%i6
	fmovsn	%xcc,	%f13,	%f27
	ldub	[%l7 + 0x30],	%g3
	fmul8x16	%f7,	%f28,	%f14
	edge32l	%g4,	%o6,	%l2
	fcmple32	%f20,	%f14,	%i4
	add	%i7,	0x06CB,	%l3
	edge32ln	%g5,	%o1,	%o4
	orcc	%i3,	%l0,	%i5
	orncc	%g7,	%g1,	%l4
	lduh	[%l7 + 0x72],	%o3
	sir	0x0A76
	save %o7, 0x1565, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f30,	%f10,	%f20
	udivcc	%i2,	0x1746,	%i1
	movre	%g2,	0x1D4,	%l6
	orcc	%g6,	0x063B,	%o2
	bshuffle	%f30,	%f30,	%f30
	edge32l	%i0,	%o0,	%o5
	movrgz	%i6,	%g3,	%g4
	sth	%o6,	[%l7 + 0x38]
	movcc	%icc,	%l2,	%i4
	movvs	%icc,	%l1,	%i7
	stw	%l3,	[%l7 + 0x60]
	movgu	%xcc,	%g5,	%o1
	stx	%i3,	[%l7 + 0x48]
	edge8n	%o4,	%l0,	%i5
	edge32ln	%g7,	%g1,	%l4
	ldd	[%l7 + 0x50],	%f18
	fpadd16	%f2,	%f12,	%f26
	fmovrdgez	%o3,	%f16,	%f6
	ldub	[%l7 + 0x5F],	%l5
	xnor	%i2,	%i1,	%g2
	edge8	%l6,	%o7,	%g6
	srax	%o2,	%o0,	%o5
	andn	%i0,	0x160E,	%g3
	alignaddrl	%g4,	%o6,	%l2
	or	%i6,	0x09FF,	%i4
	popc	0x13B6,	%l1
	addc	%i7,	0x1649,	%g5
	xorcc	%o1,	0x0C0D,	%l3
	edge16ln	%i3,	%o4,	%l0
	orncc	%g7,	%i5,	%l4
	std	%f18,	[%l7 + 0x70]
	fpsub32s	%f9,	%f23,	%f10
	move	%icc,	%g1,	%l5
	movre	%o3,	0x1FC,	%i1
	movcc	%xcc,	%i2,	%g2
	ld	[%l7 + 0x2C],	%f1
	ldx	[%l7 + 0x28],	%o7
	array16	%g6,	%l6,	%o2
	edge16ln	%o0,	%o5,	%g3
	smulcc	%g4,	%o6,	%i0
	sethi	0x0D58,	%l2
	fcmpne16	%f6,	%f22,	%i4
	udiv	%l1,	0x1623,	%i7
	movle	%icc,	%i6,	%o1
	fone	%f18
	alignaddrl	%g5,	%i3,	%l3
	ldsb	[%l7 + 0x60],	%o4
	movne	%icc,	%g7,	%i5
	stx	%l4,	[%l7 + 0x28]
	srl	%g1,	0x1B,	%l0
	fmul8sux16	%f4,	%f24,	%f12
	stx	%l5,	[%l7 + 0x20]
	srax	%o3,	0x13,	%i2
	edge32ln	%g2,	%o7,	%i1
	edge32l	%l6,	%g6,	%o0
	ldd	[%l7 + 0x50],	%f8
	movg	%icc,	%o5,	%g3
	addc	%g4,	0x0280,	%o6
	mulx	%o2,	0x05D0,	%i0
	edge8l	%i4,	%l1,	%l2
	movn	%xcc,	%i6,	%i7
	for	%f8,	%f2,	%f8
	umul	%g5,	0x0A60,	%i3
	sth	%o1,	[%l7 + 0x7E]
	or	%o4,	%l3,	%g7
	movg	%xcc,	%l4,	%i5
	popc	0x0088,	%g1
	xor	%l0,	%l5,	%i2
	and	%g2,	0x19AD,	%o7
	fmovda	%xcc,	%f29,	%f2
	movn	%xcc,	%i1,	%o3
	ldsb	[%l7 + 0x58],	%l6
	lduw	[%l7 + 0x70],	%o0
	subc	%g6,	0x0E91,	%g3
	ld	[%l7 + 0x54],	%f15
	sllx	%g4,	0x15,	%o6
	sra	%o2,	%i0,	%o5
	fmovrdne	%l1,	%f22,	%f10
	fmovrdgz	%i4,	%f22,	%f22
	fpsub16s	%f9,	%f3,	%f5
	lduh	[%l7 + 0x28],	%l2
	array8	%i6,	%i7,	%i3
	fandnot2s	%f4,	%f24,	%f13
	ldx	[%l7 + 0x68],	%o1
	for	%f28,	%f2,	%f0
	ld	[%l7 + 0x50],	%f13
	move	%xcc,	%g5,	%o4
	sub	%l3,	0x1DF2,	%l4
	smul	%i5,	%g1,	%l0
	movrlz	%g7,	0x0C6,	%i2
	movvc	%xcc,	%l5,	%o7
	ldd	[%l7 + 0x20],	%i0
	fcmpgt32	%f20,	%f12,	%g2
	ldsb	[%l7 + 0x16],	%l6
	sethi	0x0EDE,	%o0
	fnegs	%f12,	%f26
	fmovdcs	%xcc,	%f16,	%f9
	mova	%icc,	%o3,	%g3
	andncc	%g4,	%o6,	%o2
	andncc	%g6,	%i0,	%l1
	movge	%xcc,	%i4,	%l2
	stx	%i6,	[%l7 + 0x20]
	fmovrdlez	%i7,	%f14,	%f26
	edge8ln	%i3,	%o1,	%g5
	movgu	%icc,	%o4,	%o5
	ldsw	[%l7 + 0x2C],	%l3
	array32	%l4,	%i5,	%g1
	movpos	%icc,	%l0,	%g7
	movrlez	%l5,	0x2E7,	%o7
	fmovdpos	%xcc,	%f1,	%f15
	array8	%i2,	%i1,	%l6
	movre	%g2,	%o0,	%o3
	movrlz	%g3,	%o6,	%o2
	movneg	%icc,	%g6,	%i0
	mulscc	%g4,	%l1,	%i4
	edge16ln	%i6,	%l2,	%i7
	subccc	%o1,	%g5,	%o4
	movneg	%icc,	%o5,	%i3
	array8	%l4,	%l3,	%i5
	udivcc	%l0,	0x0063,	%g1
	orn	%g7,	%o7,	%i2
	movle	%xcc,	%l5,	%l6
	ld	[%l7 + 0x20],	%f11
	movrlez	%g2,	%i1,	%o3
	edge8n	%g3,	%o0,	%o6
	sir	0x06FD
	srax	%g6,	%o2,	%i0
	addc	%g4,	%l1,	%i6
	smulcc	%i4,	0x1267,	%i7
	edge16	%o1,	%l2,	%o4
	movleu	%icc,	%o5,	%i3
	sdivx	%g5,	0x0C14,	%l3
	movne	%xcc,	%l4,	%l0
	fsrc2	%f22,	%f6
	sethi	0x0211,	%g1
	umulcc	%i5,	0x0064,	%o7
	fmovrdne	%g7,	%f14,	%f28
	stx	%i2,	[%l7 + 0x28]
	array8	%l5,	%g2,	%i1
	edge8n	%l6,	%g3,	%o0
	movne	%xcc,	%o6,	%g6
	sdivx	%o2,	0x0506,	%o3
	fpadd16s	%f23,	%f27,	%f4
	fnegd	%f30,	%f0
	xor	%i0,	%l1,	%i6
	edge32ln	%i4,	%i7,	%g4
	std	%f4,	[%l7 + 0x20]
	udiv	%l2,	0x00FA,	%o1
	ldub	[%l7 + 0x42],	%o4
	movre	%o5,	%i3,	%g5
	st	%f20,	[%l7 + 0x14]
	mulscc	%l4,	0x07D5,	%l0
	umulcc	%l3,	0x14F2,	%i5
	orn	%g1,	%g7,	%o7
	edge32	%l5,	%g2,	%i1
	movrlez	%i2,	%l6,	%g3
	addccc	%o6,	0x1C21,	%o0
	fmovscs	%icc,	%f4,	%f24
	srax	%g6,	0x17,	%o3
	sdivcc	%i0,	0x1E07,	%o2
	sllx	%l1,	0x1B,	%i6
	movgu	%xcc,	%i4,	%i7
	edge16ln	%g4,	%o1,	%o4
	mulx	%o5,	0x03CB,	%i3
	alignaddrl	%l2,	%l4,	%l0
	sdiv	%l3,	0x03A9,	%i5
	andcc	%g1,	%g7,	%g5
	movneg	%xcc,	%l5,	%g2
	sllx	%i1,	%o7,	%i2
	smul	%l6,	%g3,	%o0
	movvs	%icc,	%o6,	%g6
	fmovsgu	%xcc,	%f20,	%f26
	st	%f23,	[%l7 + 0x48]
	movvc	%icc,	%i0,	%o3
	xnorcc	%o2,	0x089A,	%i6
	fmovrse	%l1,	%f4,	%f9
	edge16n	%i7,	%i4,	%g4
	smulcc	%o1,	%o5,	%o4
	udiv	%i3,	0x1DDD,	%l2
	fmovdneg	%icc,	%f6,	%f3
	movvs	%xcc,	%l4,	%l0
	edge16	%i5,	%l3,	%g1
	add	%g7,	%l5,	%g5
	fmovsle	%icc,	%f28,	%f26
	fmovsleu	%xcc,	%f3,	%f17
	sdiv	%g2,	0x1BBB,	%o7
	movrne	%i1,	0x24E,	%l6
	fpadd32s	%f24,	%f25,	%f7
	subccc	%g3,	0x090F,	%o0
	movge	%icc,	%i2,	%o6
	xor	%g6,	0x02F9,	%o3
	sub	%i0,	%o2,	%i6
	ldd	[%l7 + 0x60],	%f0
	fmovspos	%xcc,	%f7,	%f23
	movge	%icc,	%l1,	%i4
	edge8l	%g4,	%i7,	%o5
	movle	%xcc,	%o4,	%o1
	ldd	[%l7 + 0x08],	%f22
	orncc	%i3,	0x04A7,	%l4
	fnands	%f30,	%f11,	%f2
	movge	%icc,	%l2,	%i5
	movrgz	%l0,	0x351,	%l3
	orcc	%g7,	0x0111,	%l5
	edge16	%g5,	%g1,	%o7
	subccc	%g2,	%l6,	%i1
	fnegd	%f18,	%f30
	movrgez	%g3,	0x195,	%o0
	edge16	%o6,	%g6,	%i2
	ldub	[%l7 + 0x65],	%o3
	bshuffle	%f28,	%f0,	%f28
	edge16l	%o2,	%i6,	%i0
	movcs	%icc,	%i4,	%g4
	andncc	%i7,	%l1,	%o5
	srlx	%o1,	%o4,	%l4
	addccc	%l2,	0x17A6,	%i3
	fmovsgu	%icc,	%f15,	%f31
	movl	%xcc,	%l0,	%l3
	orncc	%i5,	0x00B1,	%g7
	fmovda	%xcc,	%f0,	%f4
	fandnot2	%f26,	%f8,	%f16
	ldsh	[%l7 + 0x6E],	%g5
	sllx	%g1,	%l5,	%g2
	ldub	[%l7 + 0x32],	%l6
	fmovrsgez	%i1,	%f20,	%f13
	movg	%icc,	%o7,	%g3
	fabss	%f28,	%f11
	movre	%o0,	%g6,	%o6
	movcc	%xcc,	%i2,	%o3
	ldub	[%l7 + 0x6C],	%o2
	movrlz	%i6,	%i0,	%g4
	fmovsvc	%xcc,	%f19,	%f27
	orcc	%i4,	0x0E05,	%i7
	fone	%f22
	array8	%l1,	%o5,	%o4
	movrlz	%o1,	%l2,	%l4
	movrgz	%l0,	0x246,	%l3
	fcmpne32	%f22,	%f22,	%i3
	alignaddr	%g7,	%i5,	%g5
	fnands	%f13,	%f6,	%f14
	smul	%g1,	%l5,	%g2
	siam	0x1
	smulcc	%l6,	%i1,	%o7
	xnor	%o0,	%g3,	%o6
	edge16ln	%i2,	%o3,	%o2
	umulcc	%i6,	0x1EC9,	%i0
	fpadd16	%f28,	%f30,	%f22
	stb	%g6,	[%l7 + 0x16]
	edge32ln	%i4,	%i7,	%g4
	fcmpeq32	%f0,	%f24,	%o5
	fmovse	%xcc,	%f31,	%f6
	udiv	%l1,	0x0CD6,	%o4
	andcc	%l2,	%o1,	%l4
	subcc	%l3,	%l0,	%i3
	orcc	%i5,	%g5,	%g7
	udivcc	%l5,	0x1C2E,	%g2
	st	%f24,	[%l7 + 0x78]
	fmovdle	%xcc,	%f7,	%f29
	movle	%xcc,	%g1,	%l6
	edge16l	%i1,	%o7,	%o0
	ldsw	[%l7 + 0x58],	%g3
	fpadd16	%f30,	%f26,	%f0
	movn	%xcc,	%i2,	%o6
	edge32	%o2,	%o3,	%i0
	fmovsne	%icc,	%f9,	%f12
	xorcc	%g6,	0x1BCF,	%i4
	fmovsl	%xcc,	%f15,	%f17
	movrgz	%i6,	0x073,	%g4
	orcc	%i7,	%o5,	%l1
	and	%o4,	%l2,	%o1
	edge32l	%l3,	%l0,	%l4
	stb	%i5,	[%l7 + 0x77]
	fornot2	%f6,	%f14,	%f20
	fandnot2	%f12,	%f8,	%f24
	ldsw	[%l7 + 0x50],	%g5
	movrlez	%i3,	0x136,	%l5
	andcc	%g7,	0x1C48,	%g2
	movvc	%icc,	%l6,	%g1
	sra	%i1,	0x12,	%o0
	array8	%g3,	%i2,	%o6
	edge32	%o2,	%o3,	%i0
	fxor	%f10,	%f28,	%f26
	andcc	%o7,	%g6,	%i4
	alignaddr	%i6,	%i7,	%o5
	edge8l	%l1,	%g4,	%l2
	bshuffle	%f0,	%f24,	%f28
	fandnot2	%f12,	%f28,	%f10
	fmovrsne	%o4,	%f1,	%f14
	save %l3, %o1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i5,	0x1B6,	%l4
	fxor	%f28,	%f22,	%f14
	umul	%i3,	0x0713,	%l5
	xor	%g5,	0x110A,	%g2
	fcmpgt32	%f24,	%f22,	%g7
	addcc	%g1,	0x0F52,	%i1
	for	%f12,	%f22,	%f8
	addccc	%o0,	0x19FE,	%l6
	or	%g3,	0x142F,	%o6
	movg	%xcc,	%i2,	%o3
	fmovda	%xcc,	%f21,	%f27
	edge8l	%i0,	%o2,	%g6
	mova	%icc,	%i4,	%i6
	fpsub16s	%f25,	%f23,	%f20
	movle	%icc,	%o7,	%i7
	orncc	%o5,	%l1,	%l2
	and	%o4,	0x0846,	%l3
	sra	%g4,	%o1,	%i5
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%l4
	addc	%l0,	%l5,	%i3
	edge16l	%g5,	%g2,	%g7
	ldsh	[%l7 + 0x46],	%i1
	fmovse	%icc,	%f10,	%f21
	stb	%o0,	[%l7 + 0x14]
	ldsb	[%l7 + 0x49],	%l6
	sra	%g1,	%g3,	%i2
	srlx	%o3,	0x09,	%o6
	edge8ln	%o2,	%i0,	%i4
	alignaddr	%g6,	%i6,	%i7
	movcc	%icc,	%o5,	%o7
	fmovsneg	%xcc,	%f22,	%f15
	or	%l2,	0x122B,	%l1
	ldub	[%l7 + 0x1F],	%l3
	addc	%o4,	%g4,	%o1
	fnors	%f28,	%f1,	%f22
	ldsw	[%l7 + 0x08],	%l4
	array8	%l0,	%i5,	%i3
	lduw	[%l7 + 0x10],	%g5
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%l5
	fsrc1	%f0,	%f24
	orncc	%g7,	%g2,	%i1
	fmovdvs	%xcc,	%f1,	%f18
	movrgez	%l6,	%o0,	%g3
	movneg	%icc,	%g1,	%i2
	move	%icc,	%o3,	%o6
	movrgz	%o2,	%i0,	%g6
	addcc	%i4,	%i6,	%i7
	edge8ln	%o7,	%o5,	%l1
	fmul8x16al	%f28,	%f30,	%f2
	fmovsl	%xcc,	%f7,	%f4
	orn	%l2,	0x182F,	%l3
	xorcc	%g4,	0x087C,	%o4
	udivcc	%o1,	0x14D3,	%l0
	sdivcc	%l4,	0x0295,	%i5
	xnorcc	%i3,	0x0574,	%g5
	sdiv	%g7,	0x1C4F,	%g2
	addc	%l5,	0x0043,	%l6
	fxors	%f14,	%f20,	%f8
	movleu	%xcc,	%i1,	%g3
	movge	%icc,	%g1,	%o0
	fcmpgt16	%f6,	%f14,	%o3
	movcc	%icc,	%i2,	%o2
	fpadd16	%f8,	%f30,	%f0
	ldub	[%l7 + 0x41],	%i0
	fmovsgu	%icc,	%f10,	%f14
	lduw	[%l7 + 0x64],	%o6
	fpadd32	%f12,	%f26,	%f28
	popc	%i4,	%i6
	alignaddrl	%i7,	%o7,	%o5
	ldsw	[%l7 + 0x08],	%g6
	sth	%l2,	[%l7 + 0x5E]
	xnorcc	%l3,	0x0F1F,	%l1
	movvc	%xcc,	%o4,	%g4
	array8	%o1,	%l4,	%l0
	fmovsleu	%icc,	%f20,	%f5
	xnor	%i3,	%g5,	%g7
	movle	%xcc,	%i5,	%l5
	smulcc	%g2,	%i1,	%l6
	edge16ln	%g3,	%o0,	%o3
	mova	%icc,	%g1,	%o2
	movgu	%icc,	%i2,	%o6
	udivx	%i0,	0x0AC0,	%i4
	fmovsg	%xcc,	%f23,	%f6
	fandnot2s	%f11,	%f18,	%f8
	nop
	set	0x7C, %i2
	lduw	[%l7 + %i2],	%i6
	ldx	[%l7 + 0x48],	%i7
	ldd	[%l7 + 0x38],	%f4
	movneg	%xcc,	%o5,	%o7
	mulscc	%l2,	%l3,	%l1
	sdivcc	%g6,	0x09FD,	%g4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	sdivcc	%l0,	0x085B,	%g5
	addc	%g7,	0x0CE0,	%i5
	mulscc	%l5,	%g2,	%i3
	movneg	%icc,	%l6,	%i1
	movcs	%icc,	%g3,	%o3
	movleu	%xcc,	%g1,	%o0
	fors	%f2,	%f14,	%f12
	stw	%o2,	[%l7 + 0x20]
	popc	%i2,	%i0
	srax	%i4,	%o6,	%i6
	fornot2s	%f23,	%f9,	%f29
	ldd	[%l7 + 0x30],	%i6
	fmovsa	%xcc,	%f27,	%f16
	restore %o5, 0x08EB, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%f26
	movrne	%l2,	0x098,	%l1
	alignaddrl	%l3,	%g6,	%g4
	fmul8x16	%f1,	%f28,	%f4
	array8	%o4,	%o1,	%l0
	fmovrsgz	%l4,	%f27,	%f15
	ldx	[%l7 + 0x68],	%g5
	fandnot2s	%f17,	%f31,	%f3
	andncc	%i5,	%g7,	%l5
	ldsb	[%l7 + 0x68],	%g2
	movrgz	%l6,	0x041,	%i3
	sll	%i1,	%o3,	%g1
	std	%f20,	[%l7 + 0x30]
	sub	%g3,	0x1F98,	%o0
	sdiv	%o2,	0x1C4A,	%i0
	fnot1s	%f22,	%f10
	fornot2s	%f15,	%f1,	%f14
	movvs	%xcc,	%i2,	%o6
	smul	%i6,	%i7,	%i4
	fmovdneg	%icc,	%f29,	%f24
	edge32n	%o7,	%o5,	%l2
	move	%icc,	%l3,	%l1
	ldsh	[%l7 + 0x2A],	%g6
	fors	%f11,	%f29,	%f7
	fmovda	%icc,	%f16,	%f13
	fandnot1	%f2,	%f6,	%f16
	fcmpne32	%f16,	%f28,	%g4
	move	%xcc,	%o4,	%l0
	sdiv	%l4,	0x058D,	%o1
	edge16n	%i5,	%g7,	%g5
	fnot2	%f30,	%f14
	fmovs	%f2,	%f17
	std	%f6,	[%l7 + 0x18]
	ldx	[%l7 + 0x48],	%l5
	movn	%icc,	%l6,	%g2
	addcc	%i1,	0x12FB,	%i3
	fmul8x16au	%f26,	%f12,	%f12
	edge8n	%g1,	%o3,	%g3
	and	%o2,	%o0,	%i0
	edge32n	%o6,	%i6,	%i7
	movvs	%xcc,	%i4,	%i2
	nop
	set	0x08, %o2
	std	%f6,	[%l7 + %o2]
	mova	%icc,	%o7,	%o5
	movne	%icc,	%l2,	%l1
	fmovde	%icc,	%f30,	%f21
	sdiv	%l3,	0x1618,	%g4
	sdiv	%o4,	0x130C,	%l0
	add	%g6,	%l4,	%i5
	edge8l	%g7,	%g5,	%l5
	mulx	%o1,	%g2,	%i1
	xnorcc	%l6,	%g1,	%i3
	sdiv	%o3,	0x1E78,	%g3
	xnorcc	%o2,	%o0,	%i0
	fnot2	%f24,	%f20
	mulscc	%i6,	0x1EE3,	%o6
	fmovrdlz	%i7,	%f24,	%f12
	move	%icc,	%i4,	%i2
	movle	%icc,	%o7,	%o5
	addc	%l2,	%l1,	%l3
	fmovsa	%icc,	%f20,	%f6
	save %g4, 0x1F57, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l0,	%g6
	stw	%i5,	[%l7 + 0x2C]
	orcc	%g7,	0x084E,	%l4
	addc	%l5,	0x01FE,	%o1
	sllx	%g5,	0x14,	%i1
	movle	%xcc,	%l6,	%g1
	movre	%g2,	0x072,	%o3
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%g3
	fcmpes	%fcc0,	%f18,	%f18
	edge32n	%i3,	%o0,	%i0
	subccc	%i6,	0x1381,	%o2
	movneg	%icc,	%o6,	%i7
	fmovsne	%xcc,	%f22,	%f6
	ld	[%l7 + 0x10],	%f1
	sdivcc	%i2,	0x1AB5,	%i4
	fornot1s	%f3,	%f21,	%f1
	ldsh	[%l7 + 0x78],	%o5
	fmovrdgz	%o7,	%f2,	%f10
	movle	%xcc,	%l1,	%l2
	movvc	%xcc,	%g4,	%l3
	edge16ln	%l0,	%o4,	%i5
	lduw	[%l7 + 0x28],	%g7
	edge16	%g6,	%l5,	%o1
	fmovsne	%icc,	%f24,	%f31
	edge8n	%g5,	%i1,	%l6
	movgu	%icc,	%l4,	%g1
	orn	%o3,	0x1ED8,	%g2
	add	%g3,	%o0,	%i3
	movcs	%icc,	%i0,	%o2
	stb	%o6,	[%l7 + 0x67]
	edge8n	%i6,	%i2,	%i4
	fmul8x16al	%f12,	%f27,	%f30
	movcc	%icc,	%o5,	%i7
	movcc	%xcc,	%o7,	%l1
	ldub	[%l7 + 0x0A],	%l2
	movrgez	%l3,	%l0,	%g4
	umul	%o4,	0x01A1,	%g7
	edge32l	%g6,	%l5,	%i5
	array16	%g5,	%o1,	%i1
	subccc	%l4,	%l6,	%g1
	sll	%o3,	%g2,	%g3
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%i2
	fornot2s	%f25,	%f14,	%f17
	sdiv	%i0,	0x1BEC,	%o2
	xor	%o0,	%i6,	%o6
	xor	%i2,	%o5,	%i4
	fmovsl	%icc,	%f23,	%f25
	ldx	[%l7 + 0x48],	%o7
	movl	%icc,	%i7,	%l2
	fnand	%f8,	%f6,	%f20
	edge16l	%l3,	%l0,	%g4
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	sllx	%g6,	0x11,	%l1
	edge8ln	%l5,	%g5,	%i5
	xnor	%o1,	0x1F6F,	%l4
	movpos	%icc,	%l6,	%i1
	lduh	[%l7 + 0x62],	%o3
	st	%f4,	[%l7 + 0x44]
	fones	%f2
	fpadd16s	%f2,	%f24,	%f11
	edge16	%g1,	%g2,	%g3
	st	%f2,	[%l7 + 0x2C]
	fmovspos	%icc,	%f22,	%f14
	movn	%icc,	%i3,	%o2
	orcc	%o0,	%i6,	%o6
	fcmps	%fcc2,	%f20,	%f12
	fand	%f28,	%f16,	%f28
	edge16	%i2,	%o5,	%i0
	edge8n	%i4,	%i7,	%o7
	movcc	%xcc,	%l3,	%l2
	movpos	%icc,	%l0,	%o4
	andncc	%g4,	%g7,	%l1
	stx	%g6,	[%l7 + 0x60]
	sdivx	%g5,	0x1EB5,	%l5
	smul	%i5,	%o1,	%l6
	udivcc	%i1,	0x0BF0,	%l4
	umul	%o3,	0x076F,	%g1
	ld	[%l7 + 0x34],	%f16
	nop
	set	0x26, %i6
	sth	%g3,	[%l7 + %i6]
	edge16	%g2,	%i3,	%o2
	xnor	%o0,	%o6,	%i2
	alignaddr	%i6,	%i0,	%i4
	fmovrde	%o5,	%f24,	%f28
	xnorcc	%i7,	0x0010,	%o7
	ldsw	[%l7 + 0x58],	%l2
	srax	%l0,	0x03,	%l3
	ldsh	[%l7 + 0x38],	%o4
	sethi	0x1D54,	%g7
	movrlez	%g4,	%l1,	%g6
	mova	%xcc,	%l5,	%i5
	fmovsvc	%icc,	%f14,	%f9
	addcc	%g5,	%l6,	%i1
	bshuffle	%f16,	%f24,	%f10
	movrgez	%o1,	%o3,	%l4
	movneg	%icc,	%g3,	%g2
	edge16	%i3,	%o2,	%g1
	fnot1s	%f29,	%f7
	edge8	%o6,	%o0,	%i6
	movle	%icc,	%i2,	%i0
	fpadd32s	%f10,	%f7,	%f5
	movcc	%xcc,	%o5,	%i7
	umulcc	%o7,	%l2,	%l0
	umul	%l3,	%o4,	%g7
	movgu	%xcc,	%g4,	%i4
	ldsb	[%l7 + 0x75],	%l1
	subc	%l5,	0x0817,	%i5
	edge8	%g6,	%l6,	%i1
	faligndata	%f14,	%f24,	%f6
	fpsub32s	%f9,	%f18,	%f16
	fmovse	%xcc,	%f8,	%f0
	mulscc	%g5,	%o3,	%o1
	movg	%icc,	%g3,	%l4
	add	%i3,	%g2,	%g1
	movn	%icc,	%o2,	%o6
	subcc	%o0,	%i6,	%i2
	ldd	[%l7 + 0x30],	%f0
	ldsh	[%l7 + 0x18],	%i0
	orn	%i7,	0x04FE,	%o7
	fcmpeq32	%f18,	%f4,	%l2
	st	%f15,	[%l7 + 0x70]
	sdivcc	%o5,	0x0ECD,	%l0
	fmovsvc	%xcc,	%f3,	%f3
	fmovrsne	%o4,	%f10,	%f20
	edge32n	%g7,	%l3,	%i4
	movrne	%l1,	%g4,	%i5
	or	%g6,	0x06D3,	%l5
	fornot2s	%f16,	%f17,	%f23
	nop
	set	0x64, %g3
	lduw	[%l7 + %g3],	%l6
	ldd	[%l7 + 0x50],	%f2
	sdivx	%g5,	0x18B2,	%o3
	fmovdn	%xcc,	%f19,	%f29
	movcc	%xcc,	%o1,	%g3
	sth	%l4,	[%l7 + 0x44]
	fmul8x16al	%f0,	%f21,	%f24
	fmovspos	%icc,	%f0,	%f9
	stb	%i3,	[%l7 + 0x5F]
	movpos	%icc,	%i1,	%g2
	lduw	[%l7 + 0x58],	%g1
	movle	%xcc,	%o2,	%o6
	movneg	%icc,	%o0,	%i2
	fnegd	%f0,	%f2
	fmovrdgez	%i6,	%f24,	%f30
	ldsw	[%l7 + 0x3C],	%i7
	orcc	%o7,	0x1814,	%i0
	stb	%o5,	[%l7 + 0x71]
	sth	%l2,	[%l7 + 0x6E]
	sra	%l0,	%g7,	%o4
	movrgz	%i4,	%l3,	%l1
	fzeros	%f21
	restore %i5, %g4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l6,	%g5,	%l5
	umul	%o3,	%o1,	%g3
	movg	%icc,	%i3,	%l4
	fand	%f6,	%f0,	%f18
	ldsw	[%l7 + 0x24],	%i1
	movleu	%icc,	%g2,	%g1
	for	%f4,	%f18,	%f2
	movvc	%icc,	%o2,	%o6
	mulx	%i2,	%o0,	%i7
	fmul8ulx16	%f4,	%f22,	%f8
	addccc	%o7,	%i6,	%o5
	ldsb	[%l7 + 0x13],	%l2
	movne	%icc,	%i0,	%l0
	srl	%g7,	%i4,	%o4
	movg	%xcc,	%l3,	%l1
	fmovspos	%icc,	%f9,	%f23
	sdiv	%g4,	0x17A9,	%i5
	movl	%icc,	%g6,	%g5
	std	%f26,	[%l7 + 0x68]
	addcc	%l6,	%o3,	%o1
	udiv	%g3,	0x0722,	%i3
	ldsw	[%l7 + 0x78],	%l4
	edge8l	%i1,	%g2,	%l5
	movvs	%icc,	%g1,	%o2
	fcmpes	%fcc1,	%f15,	%f1
	ldd	[%l7 + 0x30],	%f6
	orcc	%o6,	%o0,	%i2
	movn	%xcc,	%i7,	%i6
	fpadd16s	%f27,	%f10,	%f23
	faligndata	%f30,	%f24,	%f26
	srl	%o5,	0x0B,	%o7
	edge8	%l2,	%l0,	%g7
	add	%i0,	0x12FF,	%o4
	movl	%icc,	%i4,	%l3
	movne	%icc,	%g4,	%i5
	xnorcc	%l1,	0x16EF,	%g5
	bshuffle	%f26,	%f24,	%f16
	nop
	set	0x7D, %l3
	ldub	[%l7 + %l3],	%g6
	orcc	%l6,	0x09D4,	%o1
	fmul8ulx16	%f24,	%f28,	%f24
	movn	%icc,	%o3,	%i3
	fnor	%f30,	%f26,	%f22
	ldd	[%l7 + 0x28],	%g2
	subcc	%i1,	%l4,	%g2
	umulcc	%l5,	0x192D,	%o2
	fmovdne	%xcc,	%f25,	%f15
	xor	%o6,	%o0,	%g1
	fxnor	%f10,	%f14,	%f18
	ldx	[%l7 + 0x30],	%i2
	fmovrslez	%i7,	%f13,	%f6
	fornot2	%f18,	%f30,	%f0
	orncc	%i6,	%o7,	%o5
	stb	%l2,	[%l7 + 0x25]
	movle	%xcc,	%l0,	%g7
	fmovrde	%o4,	%f16,	%f22
	edge16	%i4,	%i0,	%l3
	movneg	%icc,	%g4,	%l1
	movle	%icc,	%i5,	%g5
	ldsh	[%l7 + 0x44],	%g6
	fnor	%f30,	%f26,	%f12
	movcc	%xcc,	%l6,	%o1
	add	%o3,	%g3,	%i3
	movrlz	%i1,	0x181,	%l4
	fmovrse	%l5,	%f4,	%f10
	edge8l	%g2,	%o6,	%o0
	and	%o2,	0x09E7,	%g1
	movrlz	%i2,	0x217,	%i7
	stb	%o7,	[%l7 + 0x21]
	alignaddr	%i6,	%o5,	%l2
	fornot1s	%f20,	%f18,	%f6
	fcmpeq16	%f4,	%f22,	%l0
	sra	%g7,	0x04,	%o4
	umul	%i4,	0x0221,	%l3
	movcs	%xcc,	%g4,	%l1
	edge16l	%i0,	%i5,	%g6
	array8	%g5,	%l6,	%o1
	array8	%o3,	%g3,	%i1
	ldsw	[%l7 + 0x68],	%l4
	stx	%i3,	[%l7 + 0x50]
	fandnot2	%f22,	%f28,	%f6
	fcmps	%fcc0,	%f25,	%f14
	mulscc	%l5,	%g2,	%o0
	fmovsneg	%xcc,	%f30,	%f12
	fxnor	%f16,	%f14,	%f10
	andn	%o2,	0x1944,	%o6
	movle	%xcc,	%g1,	%i2
	move	%xcc,	%o7,	%i6
	fpack32	%f28,	%f12,	%f20
	save %o5, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x6C],	%l0
	udivcc	%g7,	0x18AE,	%i4
	edge16	%l3,	%o4,	%l1
	faligndata	%f22,	%f6,	%f26
	st	%f30,	[%l7 + 0x08]
	subc	%g4,	0x0613,	%i0
	fmovsge	%xcc,	%f2,	%f15
	sethi	0x10AD,	%g6
	stw	%i5,	[%l7 + 0x1C]
	ldsh	[%l7 + 0x4C],	%g5
	sllx	%o1,	0x15,	%o3
	andn	%g3,	%l6,	%i1
	fxors	%f0,	%f8,	%f10
	fpack16	%f16,	%f15
	edge32ln	%l4,	%i3,	%l5
	movrgez	%o0,	0x1C7,	%g2
	ldx	[%l7 + 0x20],	%o6
	xor	%g1,	0x1366,	%i2
	movvs	%icc,	%o2,	%o7
	ldsb	[%l7 + 0x65],	%o5
	movle	%icc,	%i6,	%i7
	ld	[%l7 + 0x34],	%f22
	udivx	%l0,	0x0D10,	%g7
	fones	%f26
	movre	%l2,	0x3C1,	%l3
	fornot2s	%f30,	%f5,	%f5
	smul	%o4,	0x0A5E,	%l1
	movneg	%icc,	%g4,	%i0
	xorcc	%i4,	0x13EA,	%g6
	movneg	%icc,	%i5,	%o1
	save %g5, %g3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%i0
	xnorcc	%l4,	%l6,	%i3
	movre	%o0,	%g2,	%o6
	popc	0x0437,	%l5
	fands	%f31,	%f15,	%f10
	sethi	0x0C6A,	%i2
	addcc	%g1,	0x0303,	%o2
	orncc	%o7,	0x18E2,	%o5
	andcc	%i6,	%i7,	%g7
	movrgz	%l2,	0x18F,	%l3
	mulx	%o4,	%l0,	%l1
	or	%i0,	0x0BED,	%g4
	sra	%g6,	0x1F,	%i5
	subccc	%i4,	%g5,	%g3
	move	%icc,	%o3,	%o1
	sdiv	%i1,	0x030E,	%l4
	fzeros	%f28
	ldx	[%l7 + 0x50],	%l6
	fmovrsne	%o0,	%f16,	%f11
	edge16	%g2,	%i3,	%l5
	movvs	%xcc,	%i2,	%g1
	array16	%o2,	%o6,	%o7
	fcmpne32	%f10,	%f26,	%i6
	alignaddrl	%o5,	%g7,	%i7
	fmovsle	%icc,	%f11,	%f1
	nop
	set	0x5A, %o0
	stb	%l3,	[%l7 + %o0]
	smul	%o4,	%l0,	%l2
	array8	%l1,	%i0,	%g6
	ldsh	[%l7 + 0x4C],	%i5
	fmul8x16au	%f7,	%f19,	%f28
	st	%f27,	[%l7 + 0x50]
	fones	%f20
	lduh	[%l7 + 0x1A],	%i4
	andncc	%g4,	%g3,	%o3
	fpackfix	%f4,	%f26
	xorcc	%g5,	%o1,	%i1
	udivx	%l4,	0x0AC0,	%o0
	lduh	[%l7 + 0x40],	%l6
	ldsw	[%l7 + 0x38],	%i3
	ldd	[%l7 + 0x50],	%g2
	movle	%xcc,	%i2,	%g1
	movrne	%l5,	%o6,	%o2
	fnegd	%f12,	%f8
	fmovdcc	%icc,	%f5,	%f22
	fmovdcs	%xcc,	%f11,	%f14
	sth	%o7,	[%l7 + 0x20]
	std	%f22,	[%l7 + 0x10]
	faligndata	%f20,	%f2,	%f30
	smul	%i6,	0x08DA,	%g7
	mulx	%o5,	0x0B05,	%i7
	fand	%f26,	%f12,	%f0
	ldub	[%l7 + 0x64],	%l3
	movvc	%icc,	%o4,	%l2
	save %l1, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f21,	%f5
	add	%i5,	%i4,	%g4
	addccc	%g3,	%o3,	%g5
	edge32n	%o1,	%i1,	%l4
	srl	%o0,	0x07,	%i0
	fcmpeq16	%f2,	%f28,	%i3
	sdivx	%l6,	0x0BD0,	%i2
	movre	%g2,	0x285,	%l5
	fmovdle	%xcc,	%f16,	%f22
	movre	%o6,	%o2,	%o7
	edge16n	%i6,	%g7,	%g1
	fnegd	%f4,	%f26
	lduw	[%l7 + 0x74],	%o5
	fornot2s	%f28,	%f18,	%f19
	ldsw	[%l7 + 0x78],	%i7
	udiv	%l3,	0x0EBC,	%l2
	sir	0x0BF9
	sir	0x0FBF
	sra	%l1,	%l0,	%g6
	movrgz	%o4,	%i4,	%i5
	subccc	%g3,	%g4,	%o3
	movcc	%xcc,	%g5,	%i1
	movrlez	%l4,	0x3F7,	%o1
	fsrc2s	%f3,	%f15
	fmovs	%f22,	%f7
	ldx	[%l7 + 0x68],	%i0
	and	%o0,	%i3,	%l6
	movvs	%icc,	%g2,	%i2
	subc	%l5,	0x0A94,	%o6
	sdivx	%o7,	0x1F80,	%i6
	alignaddrl	%g7,	%o2,	%o5
	fmovsg	%icc,	%f11,	%f0
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	edge32n	%l1,	%l3,	%g6
	fxnor	%f16,	%f20,	%f12
	add	%o4,	%l0,	%i4
	subccc	%i5,	0x11FE,	%g4
	udiv	%g3,	0x13D7,	%o3
	udivx	%i1,	0x0516,	%l4
	ldsb	[%l7 + 0x6A],	%o1
	subc	%g5,	0x09D0,	%o0
	ldsh	[%l7 + 0x30],	%i0
	movcs	%icc,	%l6,	%g2
	fpadd16s	%f20,	%f3,	%f7
	umulcc	%i3,	0x15A0,	%i2
	lduh	[%l7 + 0x44],	%o6
	edge16n	%o7,	%i6,	%g7
	xorcc	%o2,	%o5,	%l5
	movrgz	%g1,	%l2,	%i7
	lduw	[%l7 + 0x30],	%l3
	fmovsg	%xcc,	%f24,	%f22
	ldub	[%l7 + 0x2A],	%g6
	movrne	%l1,	0x335,	%l0
	movgu	%icc,	%i4,	%o4
	movrlez	%i5,	0x1AB,	%g4
	sdiv	%o3,	0x0F91,	%i1
	fmovdge	%icc,	%f18,	%f27
	fpsub16	%f6,	%f24,	%f26
	popc	0x1371,	%g3
	sll	%l4,	0x1D,	%g5
	fmul8x16	%f3,	%f4,	%f26
	ldx	[%l7 + 0x60],	%o1
	std	%f4,	[%l7 + 0x50]
	mova	%icc,	%o0,	%i0
	restore %g2, %l6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f3,	%f10,	%f16
	edge8l	%i2,	%o7,	%i6
	alignaddrl	%g7,	%o6,	%o5
	fnot2	%f0,	%f30
	addcc	%o2,	%g1,	%l5
	movrlz	%i7,	%l2,	%l3
	fcmpes	%fcc0,	%f20,	%f28
	subc	%g6,	0x1DDC,	%l1
	sub	%l0,	%i4,	%o4
	movvs	%icc,	%g4,	%o3
	ldsw	[%l7 + 0x64],	%i1
	andn	%i5,	%g3,	%g5
	fnand	%f8,	%f22,	%f2
	fmovdne	%xcc,	%f4,	%f3
	edge16n	%l4,	%o1,	%o0
	st	%f27,	[%l7 + 0x20]
	fand	%f10,	%f18,	%f0
	edge32ln	%g2,	%i0,	%l6
	add	%i3,	0x1E2A,	%i2
	fmovrslez	%i6,	%f28,	%f1
	fmovsle	%xcc,	%f28,	%f7
	movre	%g7,	%o7,	%o5
	ld	[%l7 + 0x60],	%f18
	fmovdvs	%icc,	%f22,	%f30
	orncc	%o6,	0x1BFD,	%g1
	andn	%l5,	0x0EAB,	%o2
	ldd	[%l7 + 0x58],	%i6
	movne	%icc,	%l3,	%g6
	edge16l	%l1,	%l0,	%l2
	fandnot2s	%f22,	%f13,	%f0
	edge16l	%i4,	%o4,	%g4
	movpos	%icc,	%i1,	%i5
	movn	%xcc,	%o3,	%g3
	ldd	[%l7 + 0x18],	%g4
	movrgz	%o1,	%l4,	%g2
	and	%o0,	0x1B2D,	%l6
	stx	%i3,	[%l7 + 0x08]
	movcc	%xcc,	%i2,	%i0
	sll	%i6,	0x11,	%o7
	edge8n	%g7,	%o6,	%g1
	fandnot1s	%f24,	%f21,	%f26
	lduh	[%l7 + 0x7A],	%l5
	movvs	%xcc,	%o2,	%i7
	stw	%l3,	[%l7 + 0x24]
	movrgez	%g6,	%o5,	%l1
	sub	%l0,	0x1B90,	%l2
	movn	%xcc,	%o4,	%i4
	movle	%xcc,	%g4,	%i5
	fnot1s	%f13,	%f28
	edge8l	%o3,	%i1,	%g5
	st	%f15,	[%l7 + 0x40]
	movcc	%xcc,	%o1,	%g3
	sra	%l4,	0x12,	%o0
	sir	0x0610
	edge32	%l6,	%g2,	%i2
	fxnors	%f25,	%f18,	%f7
	edge16	%i0,	%i3,	%i6
	siam	0x0
	alignaddr	%g7,	%o7,	%g1
	addccc	%o6,	0x059F,	%o2
	movl	%icc,	%i7,	%l5
	edge32n	%g6,	%o5,	%l3
	mova	%icc,	%l0,	%l1
	edge8	%l2,	%o4,	%i4
	movcc	%xcc,	%i5,	%o3
	sethi	0x042B,	%g4
	srlx	%g5,	0x13,	%o1
	fcmped	%fcc3,	%f20,	%f24
	edge16l	%i1,	%g3,	%l4
	ldd	[%l7 + 0x10],	%o0
	st	%f22,	[%l7 + 0x48]
	fands	%f16,	%f5,	%f19
	ld	[%l7 + 0x58],	%f2
	fmovsleu	%xcc,	%f15,	%f1
	edge32l	%g2,	%l6,	%i2
	sra	%i3,	%i0,	%i6
	edge32	%g7,	%o7,	%g1
	udivcc	%o6,	0x01C7,	%i7
	fnors	%f3,	%f1,	%f7
	lduh	[%l7 + 0x78],	%l5
	udivx	%o2,	0x1F92,	%o5
	st	%f15,	[%l7 + 0x3C]
	movge	%icc,	%l3,	%g6
	fand	%f10,	%f2,	%f14
	fmovrde	%l0,	%f14,	%f30
	fornot2s	%f19,	%f9,	%f30
	fmul8x16	%f5,	%f2,	%f0
	edge32l	%l1,	%l2,	%o4
	andncc	%i5,	%i4,	%g4
	alignaddr	%g5,	%o3,	%o1
	array16	%i1,	%g3,	%l4
	lduh	[%l7 + 0x08],	%o0
	umulcc	%l6,	0x1AC1,	%g2
	andcc	%i3,	0x1443,	%i0
	edge8n	%i2,	%i6,	%g7
	movg	%xcc,	%o7,	%o6
	stb	%g1,	[%l7 + 0x33]
	fmul8x16al	%f11,	%f0,	%f22
	xnor	%l5,	0x0C95,	%i7
	fxors	%f13,	%f4,	%f9
	movpos	%xcc,	%o5,	%o2
	fcmpeq32	%f4,	%f18,	%g6
	movrgz	%l3,	%l0,	%l2
	siam	0x3
	fpsub32	%f8,	%f24,	%f22
	movrlz	%o4,	%i5,	%i4
	fmovrsgez	%l1,	%f12,	%f31
	fandnot2s	%f18,	%f21,	%f17
	ld	[%l7 + 0x4C],	%f27
	xorcc	%g4,	0x1DBD,	%o3
	and	%g5,	%o1,	%g3
	movl	%icc,	%l4,	%i1
	edge16	%o0,	%l6,	%i3
	xor	%i0,	0x0128,	%g2
	ldub	[%l7 + 0x1B],	%i6
	fornot2s	%f4,	%f29,	%f16
	movcc	%xcc,	%g7,	%o7
	edge8n	%i2,	%g1,	%l5
	addccc	%i7,	%o6,	%o5
	fmovspos	%xcc,	%f27,	%f28
	orcc	%o2,	0x0B81,	%l3
	nop
	set	0x3C, %i3
	stw	%g6,	[%l7 + %i3]
	srax	%l0,	%l2,	%o4
	ldd	[%l7 + 0x78],	%i4
	array16	%i4,	%g4,	%o3
	udivcc	%g5,	0x1631,	%o1
	orncc	%l1,	%g3,	%l4
	xorcc	%o0,	%i1,	%i3
	movg	%xcc,	%l6,	%i0
	movne	%xcc,	%i6,	%g2
	fpack16	%f12,	%f25
	xor	%g7,	0x1DAC,	%i2
	movleu	%xcc,	%g1,	%l5
	for	%f18,	%f26,	%f4
	fmovrdgez	%i7,	%f0,	%f0
	stx	%o7,	[%l7 + 0x30]
	edge16l	%o6,	%o5,	%o2
	andncc	%g6,	%l3,	%l0
	fpsub32	%f8,	%f4,	%f28
	sdiv	%l2,	0x1444,	%i5
	ldsh	[%l7 + 0x2A],	%i4
	smul	%o4,	%o3,	%g5
	mulx	%o1,	0x0EA4,	%g4
	fmovrdlez	%l1,	%f6,	%f26
	subcc	%g3,	%o0,	%i1
	sth	%i3,	[%l7 + 0x54]
	xnorcc	%l6,	0x0495,	%i0
	movl	%icc,	%i6,	%l4
	fpadd16s	%f15,	%f5,	%f2
	edge8ln	%g2,	%g7,	%i2
	movgu	%icc,	%g1,	%i7
	xor	%o7,	0x0458,	%o6
	ldsw	[%l7 + 0x60],	%l5
	alignaddrl	%o2,	%o5,	%g6
	addccc	%l3,	0x1DCC,	%l2
	xor	%i5,	%l0,	%i4
	st	%f3,	[%l7 + 0x78]
	array16	%o3,	%g5,	%o4
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	st	%f7,	[%l7 + 0x70]
	array32	%o0,	%i1,	%g3
	srl	%l6,	%i0,	%i3
	movleu	%icc,	%i6,	%g2
	move	%xcc,	%g7,	%l4
	array8	%i2,	%i7,	%o7
	fnand	%f2,	%f24,	%f2
	fmovse	%icc,	%f29,	%f25
	edge8n	%g1,	%l5,	%o2
	mulscc	%o6,	%o5,	%g6
	andn	%l2,	0x0FB1,	%i5
	movrgez	%l0,	0x3C8,	%i4
	fnot1	%f18,	%f12
	edge8n	%o3,	%l3,	%g5
	movrgez	%o4,	%l1,	%g4
	fnands	%f23,	%f16,	%f9
	movneg	%xcc,	%o1,	%i1
	srlx	%g3,	0x0F,	%o0
	subccc	%i0,	%l6,	%i3
	fors	%f20,	%f16,	%f29
	ld	[%l7 + 0x38],	%f9
	movgu	%xcc,	%i6,	%g7
	edge8l	%l4,	%g2,	%i7
	smulcc	%o7,	%g1,	%i2
	sub	%l5,	0x1E71,	%o2
	movn	%xcc,	%o5,	%o6
	movn	%xcc,	%l2,	%g6
	ldx	[%l7 + 0x30],	%l0
	movn	%xcc,	%i4,	%o3
	srl	%l3,	0x11,	%i5
	ldub	[%l7 + 0x14],	%o4
	xor	%l1,	0x0490,	%g4
	movneg	%icc,	%o1,	%g5
	array16	%g3,	%i1,	%o0
	stb	%i0,	[%l7 + 0x7D]
	std	%f8,	[%l7 + 0x28]
	ldsw	[%l7 + 0x50],	%i3
	fmovrde	%i6,	%f30,	%f2
	lduh	[%l7 + 0x5E],	%l6
	movre	%l4,	%g2,	%i7
	fmul8x16	%f11,	%f24,	%f16
	fmovdge	%xcc,	%f21,	%f23
	fmuld8sux16	%f9,	%f25,	%f8
	andn	%g7,	0x0C76,	%g1
	ldsh	[%l7 + 0x74],	%o7
	fmovscc	%xcc,	%f21,	%f1
	orncc	%i2,	%o2,	%o5
	sra	%o6,	0x0E,	%l5
	fexpand	%f7,	%f16
	fmovspos	%icc,	%f25,	%f6
	save %l2, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o3,	0x1D,	%l3
	save %i4, %o4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f4,	%f30
	fmovrdne	%i5,	%f0,	%f18
	smulcc	%g4,	%o1,	%g3
	movvs	%xcc,	%i1,	%o0
	fmovsvs	%xcc,	%f13,	%f18
	subc	%i0,	0x0CAB,	%i3
	movleu	%xcc,	%g5,	%l6
	fexpand	%f24,	%f26
	fnot2	%f6,	%f4
	edge8ln	%i6,	%g2,	%i7
	movvc	%xcc,	%g7,	%g1
	fmovsneg	%icc,	%f28,	%f5
	fnot1s	%f30,	%f20
	fmovdneg	%xcc,	%f31,	%f14
	ldsw	[%l7 + 0x08],	%o7
	fsrc2	%f18,	%f28
	edge8l	%i2,	%l4,	%o2
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f30
	movge	%xcc,	%o6,	%l5
	movcs	%xcc,	%o5,	%l0
	edge32	%l2,	%g6,	%l3
	mulx	%i4,	0x0178,	%o4
	movgu	%xcc,	%o3,	%l1
	ldd	[%l7 + 0x18],	%i4
	umul	%o1,	%g4,	%i1
	movne	%icc,	%g3,	%i0
	mulx	%i3,	0x0D56,	%o0
	std	%f0,	[%l7 + 0x10]
	fpadd16	%f2,	%f16,	%f22
	sdiv	%g5,	0x1604,	%l6
	fmul8x16al	%f23,	%f9,	%f26
	sll	%i6,	0x0D,	%i7
	ldsh	[%l7 + 0x24],	%g2
	subccc	%g1,	%g7,	%i2
	srlx	%o7,	0x0C,	%o2
	st	%f6,	[%l7 + 0x24]
	move	%xcc,	%o6,	%l4
	fpsub16s	%f15,	%f26,	%f22
	orncc	%o5,	%l0,	%l5
	edge8l	%l2,	%l3,	%i4
	lduh	[%l7 + 0x36],	%g6
	fpsub32	%f30,	%f10,	%f20
	fandnot1	%f6,	%f30,	%f24
	pdist	%f22,	%f4,	%f20
	ldub	[%l7 + 0x3C],	%o3
	smul	%l1,	%i5,	%o4
	fands	%f17,	%f24,	%f25
	movle	%icc,	%o1,	%i1
	movcc	%icc,	%g3,	%i0
	stw	%g4,	[%l7 + 0x54]
	sethi	0x19AF,	%i3
	fones	%f23
	ldsh	[%l7 + 0x2C],	%o0
	sra	%g5,	%i6,	%i7
	stx	%g2,	[%l7 + 0x30]
	fmovsg	%xcc,	%f5,	%f17
	st	%f3,	[%l7 + 0x40]
	mulscc	%g1,	%l6,	%i2
	movge	%xcc,	%o7,	%o2
	ldub	[%l7 + 0x15],	%o6
	fmovdl	%icc,	%f16,	%f1
	fornot1s	%f9,	%f19,	%f15
	movrgz	%l4,	0x1BD,	%o5
	fmovdneg	%xcc,	%f19,	%f11
	fmuld8sux16	%f18,	%f2,	%f24
	fmovdne	%icc,	%f4,	%f10
	fzeros	%f14
	fmovdg	%xcc,	%f28,	%f10
	ldsb	[%l7 + 0x5F],	%l0
	smul	%l5,	%g7,	%l2
	ldx	[%l7 + 0x48],	%l3
	udivx	%i4,	0x1706,	%g6
	sll	%o3,	0x02,	%l1
	movne	%xcc,	%o4,	%o1
	smul	%i5,	0x010B,	%g3
	edge8l	%i1,	%i0,	%g4
	fmovse	%icc,	%f23,	%f21
	smulcc	%i3,	%g5,	%i6
	addc	%i7,	%g2,	%g1
	smul	%l6,	0x0371,	%o0
	mulx	%i2,	%o2,	%o6
	xnor	%o7,	%o5,	%l4
	andcc	%l0,	%g7,	%l5
	sethi	0x1F86,	%l3
	fcmpgt32	%f4,	%f10,	%i4
	popc	%g6,	%l2
	addccc	%o3,	%o4,	%o1
	sth	%i5,	[%l7 + 0x7A]
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%l0
	movneg	%xcc,	%i1,	%i0
	udivx	%g4,	0x0ECD,	%g3
	movneg	%xcc,	%g5,	%i6
	movcs	%xcc,	%i3,	%i7
	fmul8x16	%f22,	%f30,	%f28
	movvs	%icc,	%g2,	%g1
	movrgez	%o0,	0x36A,	%l6
	xnorcc	%o2,	0x062F,	%o6
	subc	%o7,	0x009A,	%i2
	edge32	%l4,	%l0,	%g7
	array32	%o5,	%l5,	%i4
	movre	%g6,	0x3D0,	%l2
	umulcc	%o3,	0x0E18,	%l3
	fpadd32s	%f22,	%f13,	%f11
	sub	%o4,	%o1,	%l1
	subccc	%i1,	%i5,	%i0
	ld	[%l7 + 0x34],	%f10
	stw	%g4,	[%l7 + 0x4C]
	mulscc	%g3,	%i6,	%i3
	andcc	%g5,	%g2,	%g1
	edge32l	%o0,	%l6,	%o2
	xnorcc	%o6,	%o7,	%i2
	movn	%xcc,	%l4,	%i7
	edge8l	%l0,	%o5,	%l5
	fcmpne32	%f10,	%f4,	%i4
	fmovrslez	%g7,	%f17,	%f11
	movcs	%icc,	%g6,	%l2
	movn	%xcc,	%l3,	%o3
	addcc	%o1,	%o4,	%l1
	andn	%i1,	0x1ACD,	%i5
	fpadd16	%f24,	%f20,	%f12
	edge8ln	%i0,	%g4,	%i6
	sethi	0x0DF2,	%i3
	edge8	%g5,	%g2,	%g3
	lduh	[%l7 + 0x60],	%o0
	std	%f28,	[%l7 + 0x50]
	xorcc	%g1,	0x0DCF,	%l6
	movne	%xcc,	%o6,	%o7
	srl	%o2,	%l4,	%i7
	movle	%xcc,	%l0,	%o5
	move	%icc,	%l5,	%i4
	movneg	%xcc,	%g7,	%i2
	fmuld8ulx16	%f21,	%f8,	%f18
	sdivx	%l2,	0x134E,	%g6
	movrlez	%l3,	0x1FE,	%o3
	movgu	%icc,	%o4,	%o1
	udivx	%l1,	0x00C6,	%i5
	movrlez	%i0,	0x341,	%g4
	ldub	[%l7 + 0x6A],	%i6
	fnands	%f24,	%f15,	%f27
	movne	%icc,	%i3,	%i1
	fmovdvs	%xcc,	%f30,	%f23
	edge16ln	%g5,	%g3,	%o0
	movgu	%xcc,	%g2,	%l6
	xor	%o6,	0x1C37,	%o7
	edge8n	%g1,	%l4,	%o2
	edge32n	%l0,	%o5,	%i7
	addc	%l5,	0x023C,	%g7
	st	%f25,	[%l7 + 0x24]
	movrgz	%i4,	%l2,	%g6
	orn	%i2,	0x184D,	%l3
	ldsw	[%l7 + 0x54],	%o3
	fandnot1	%f24,	%f28,	%f2
	alignaddrl	%o1,	%l1,	%i5
	fnand	%f0,	%f18,	%f20
	movge	%icc,	%i0,	%g4
	movrlez	%i6,	%i3,	%o4
	edge8n	%g5,	%g3,	%i1
	sdiv	%g2,	0x1136,	%o0
	xorcc	%o6,	%l6,	%o7
	sllx	%g1,	%o2,	%l0
	add	%l4,	%i7,	%l5
	movrlez	%o5,	0x183,	%i4
	orncc	%g7,	0x1763,	%l2
	edge8ln	%i2,	%l3,	%o3
	restore %o1, 0x17D6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i5,	%i0,	%g4
	movrlez	%g6,	0x168,	%i6
	udivcc	%i3,	0x13A7,	%g5
	fmul8x16	%f15,	%f16,	%f2
	lduh	[%l7 + 0x1C],	%g3
	udivcc	%o4,	0x1923,	%g2
	and	%o0,	%o6,	%l6
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	edge32ln	%o2,	%l0,	%l4
	xnorcc	%o7,	%l5,	%i7
	fmovd	%f10,	%f16
	fnot2	%f24,	%f26
	lduh	[%l7 + 0x28],	%i4
	sth	%g7,	[%l7 + 0x2A]
	edge8l	%l2,	%i2,	%o5
	movvs	%icc,	%o3,	%o1
	sra	%l3,	0x03,	%i5
	movl	%icc,	%l1,	%g4
	array8	%g6,	%i6,	%i3
	fsrc1	%f26,	%f28
	lduw	[%l7 + 0x28],	%g5
	srax	%i0,	0x02,	%g3
	fmovrsgz	%g2,	%f15,	%f29
	fandnot1s	%f28,	%f24,	%f27
	fpadd16	%f8,	%f6,	%f4
	umulcc	%o0,	%o6,	%l6
	subc	%i1,	%o4,	%g1
	movg	%xcc,	%o2,	%l4
	sllx	%o7,	%l0,	%i7
	addc	%l5,	%g7,	%l2
	and	%i4,	%o5,	%o3
	udiv	%i2,	0x020A,	%o1
	for	%f2,	%f12,	%f16
	movvc	%icc,	%l3,	%l1
	sra	%i5,	0x19,	%g4
	alignaddr	%i6,	%i3,	%g5
	edge16n	%i0,	%g3,	%g6
	andcc	%g2,	0x1E02,	%o0
	udivx	%o6,	0x04B6,	%l6
	nop
	set	0x2E, %l6
	ldsb	[%l7 + %l6],	%i1
	fmovrdlz	%g1,	%f12,	%f6
	srlx	%o2,	%l4,	%o4
	ldx	[%l7 + 0x38],	%o7
	xorcc	%i7,	0x0523,	%l5
	sra	%g7,	%l2,	%i4
	edge32n	%o5,	%o3,	%l0
	ldd	[%l7 + 0x48],	%i2
	edge16l	%l3,	%l1,	%i5
	fornot2s	%f30,	%f8,	%f30
	fpsub16s	%f2,	%f28,	%f28
	orncc	%g4,	%o1,	%i3
	edge32n	%g5,	%i0,	%g3
	smulcc	%g6,	%i6,	%g2
	fmovda	%xcc,	%f10,	%f25
	fpadd16s	%f6,	%f5,	%f25
	orn	%o0,	%l6,	%o6
	movleu	%icc,	%i1,	%o2
	array8	%g1,	%l4,	%o7
	stw	%o4,	[%l7 + 0x18]
	move	%icc,	%i7,	%l5
	orncc	%g7,	0x123D,	%i4
	sir	0x1E47
	xnor	%l2,	%o5,	%o3
	movcs	%xcc,	%l0,	%i2
	edge8n	%l3,	%l1,	%i5
	or	%g4,	%o1,	%i3
	fmovsl	%xcc,	%f12,	%f1
	edge8n	%i0,	%g3,	%g5
	movrgz	%g6,	%g2,	%i6
	save %l6, %o6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	0x13F5,	%o0
	srl	%l4,	0x08,	%g1
	srlx	%o7,	0x14,	%i7
	sra	%o4,	%l5,	%i4
	movrne	%g7,	0x371,	%o5
	movl	%icc,	%o3,	%l0
	fmul8ulx16	%f24,	%f4,	%f4
	st	%f29,	[%l7 + 0x64]
	ldsh	[%l7 + 0x40],	%i2
	andncc	%l2,	%l3,	%i5
	movle	%xcc,	%l1,	%g4
	movrgez	%i3,	%o1,	%i0
	fnand	%f10,	%f14,	%f10
	udiv	%g5,	0x1444,	%g3
	xor	%g6,	%g2,	%l6
	andn	%o6,	%i1,	%o2
	fmovda	%icc,	%f28,	%f24
	fzeros	%f26
	movvc	%xcc,	%o0,	%i6
	fmovrdlz	%g1,	%f14,	%f2
	edge16ln	%l4,	%i7,	%o4
	alignaddr	%l5,	%o7,	%g7
	ldd	[%l7 + 0x50],	%f8
	subc	%o5,	0x17BB,	%i4
	add	%o3,	0x0354,	%l0
	movge	%icc,	%l2,	%l3
	add	%i2,	0x0507,	%i5
	orn	%l1,	0x1F4B,	%i3
	edge16l	%o1,	%g4,	%i0
	subc	%g5,	0x0F0B,	%g6
	udivcc	%g3,	0x0280,	%l6
	umul	%g2,	%i1,	%o6
	fmovsleu	%icc,	%f15,	%f16
	ldd	[%l7 + 0x58],	%o2
	movrlez	%o0,	0x04A,	%g1
	edge8ln	%i6,	%i7,	%l4
	orncc	%l5,	0x0787,	%o7
	orncc	%o4,	%o5,	%g7
	fmovdle	%xcc,	%f25,	%f21
	stx	%i4,	[%l7 + 0x08]
	lduh	[%l7 + 0x74],	%o3
	lduw	[%l7 + 0x08],	%l0
	movgu	%xcc,	%l3,	%l2
	edge16	%i5,	%l1,	%i3
	sdivx	%i2,	0x17A6,	%g4
	siam	0x7
	subcc	%o1,	%g5,	%g6
	ldd	[%l7 + 0x38],	%g2
	fmovrsgez	%i0,	%f28,	%f12
	ld	[%l7 + 0x40],	%f17
	fsrc2	%f26,	%f18
	movge	%xcc,	%l6,	%i1
	fpadd32	%f2,	%f22,	%f10
	umulcc	%g2,	%o6,	%o0
	sdivx	%o2,	0x0F1F,	%g1
	fmovda	%xcc,	%f28,	%f3
	fmovda	%xcc,	%f23,	%f27
	fcmpne32	%f20,	%f10,	%i6
	fmovdge	%xcc,	%f0,	%f0
	mulx	%l4,	%l5,	%i7
	umulcc	%o7,	0x1F3D,	%o4
	fmovsn	%xcc,	%f25,	%f10
	fcmpgt16	%f6,	%f2,	%o5
	ldub	[%l7 + 0x57],	%g7
	fmovdn	%xcc,	%f24,	%f13
	sub	%i4,	0x102A,	%o3
	fmovscc	%icc,	%f15,	%f23
	fmovscs	%icc,	%f12,	%f1
	srax	%l0,	%l2,	%i5
	mova	%icc,	%l3,	%l1
	stw	%i2,	[%l7 + 0x40]
	andn	%g4,	0x0071,	%o1
	srl	%i3,	0x11,	%g6
	mulscc	%g3,	0x0892,	%g5
	lduw	[%l7 + 0x28],	%i0
	edge32n	%l6,	%i1,	%g2
	fmovrslez	%o0,	%f2,	%f26
	movg	%icc,	%o6,	%g1
	fsrc1	%f6,	%f6
	alignaddr	%o2,	%i6,	%l5
	umulcc	%l4,	0x0DCD,	%o7
	array8	%i7,	%o4,	%o5
	movleu	%icc,	%g7,	%o3
	fsrc1s	%f13,	%f9
	movvc	%xcc,	%l0,	%i4
	mulx	%l2,	0x00D2,	%i5
	popc	%l1,	%l3
	sllx	%i2,	%g4,	%o1
	ldsb	[%l7 + 0x3E],	%g6
	ld	[%l7 + 0x14],	%f9
	edge32	%i3,	%g5,	%g3
	fcmpne32	%f30,	%f18,	%i0
	and	%l6,	%g2,	%o0
	ld	[%l7 + 0x14],	%f0
	edge16ln	%i1,	%o6,	%g1
	sir	0x1626
	movge	%icc,	%i6,	%l5
	addcc	%l4,	0x18DF,	%o7
	udiv	%i7,	0x12B1,	%o4
	udivcc	%o2,	0x10FC,	%o5
	movpos	%icc,	%g7,	%o3
	udivcc	%i4,	0x03BB,	%l2
	ld	[%l7 + 0x48],	%f2
	edge8	%l0,	%i5,	%l1
	bshuffle	%f18,	%f26,	%f26
	fmovsa	%icc,	%f20,	%f18
	udiv	%i2,	0x1B1F,	%l3
	movcs	%icc,	%o1,	%g6
	fabsd	%f28,	%f24
	fmul8ulx16	%f10,	%f2,	%f24
	fmovdl	%xcc,	%f5,	%f9
	andcc	%g4,	0x0DB9,	%g5
	edge16n	%i3,	%i0,	%l6
	fmovse	%icc,	%f30,	%f11
	movleu	%xcc,	%g3,	%o0
	movrgz	%g2,	%o6,	%i1
	sdivx	%i6,	0x1F40,	%l5
	umul	%g1,	0x1DCA,	%o7
	popc	0x1D4A,	%i7
	fand	%f20,	%f4,	%f10
	fnot1s	%f4,	%f19
	edge8	%l4,	%o2,	%o5
	movneg	%icc,	%o4,	%o3
	fmovdneg	%xcc,	%f30,	%f22
	fmovdpos	%xcc,	%f1,	%f6
	move	%xcc,	%g7,	%i4
	array32	%l2,	%i5,	%l1
	faligndata	%f14,	%f16,	%f8
	ldd	[%l7 + 0x70],	%l0
	subcc	%l3,	%o1,	%g6
	sir	0x1D57
	ldx	[%l7 + 0x20],	%g4
	subccc	%g5,	%i2,	%i3
	nop
	set	0x50, %o1
	sth	%i0,	[%l7 + %o1]
	ldd	[%l7 + 0x78],	%g2
	smul	%o0,	%l6,	%o6
	fmovrdlz	%g2,	%f30,	%f6
	sir	0x025B
	or	%i1,	0x1167,	%l5
	srax	%g1,	0x05,	%i6
	orcc	%o7,	%i7,	%o2
	fmul8x16au	%f4,	%f13,	%f28
	movrgez	%l4,	%o4,	%o3
	movrne	%o5,	%i4,	%g7
	edge32l	%l2,	%i5,	%l0
	movle	%icc,	%l3,	%o1
	edge8l	%g6,	%l1,	%g5
	smulcc	%i2,	0x1B63,	%g4
	srlx	%i3,	%i0,	%o0
	ldd	[%l7 + 0x30],	%g2
	fmovse	%xcc,	%f30,	%f5
	umulcc	%l6,	%o6,	%g2
	srlx	%i1,	%g1,	%l5
	edge32l	%i6,	%i7,	%o7
	movrlez	%l4,	0x347,	%o4
	fmovrsgz	%o3,	%f16,	%f8
	addc	%o2,	%i4,	%o5
	orcc	%l2,	%i5,	%g7
	fmovrslez	%l0,	%f24,	%f15
	sub	%l3,	%g6,	%o1
	xnorcc	%g5,	%i2,	%l1
	fmovdn	%xcc,	%f21,	%f17
	fmovsg	%icc,	%f14,	%f17
	lduw	[%l7 + 0x18],	%g4
	fmovdcc	%icc,	%f4,	%f24
	subccc	%i3,	%o0,	%i0
	movre	%g3,	0x3C9,	%l6
	ld	[%l7 + 0x0C],	%f3
	stb	%g2,	[%l7 + 0x2F]
	ldd	[%l7 + 0x50],	%i0
	fsrc2s	%f28,	%f12
	ld	[%l7 + 0x38],	%f22
	addcc	%g1,	%l5,	%o6
	fnand	%f6,	%f26,	%f16
	andncc	%i7,	%o7,	%l4
	add	%o4,	%o3,	%o2
	addccc	%i4,	%o5,	%l2
	array16	%i5,	%g7,	%l0
	restore %l3, %i6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x0C],	%f1
	orcc	%g5,	0x1ADC,	%i2
	edge16ln	%l1,	%g4,	%i3
	edge32n	%g6,	%i0,	%o0
	save %g3, 0x1346, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x79],	%g2
	movcc	%xcc,	%i1,	%g1
	popc	0x1989,	%l5
	fmovrdlez	%o6,	%f12,	%f12
	sdivcc	%i7,	0x131A,	%o7
	ldd	[%l7 + 0x30],	%o4
	ldd	[%l7 + 0x40],	%o2
	array16	%o2,	%l4,	%o5
	mulx	%l2,	0x09C7,	%i5
	lduh	[%l7 + 0x4C],	%i4
	andcc	%g7,	0x03FA,	%l0
	xnorcc	%l3,	0x1F03,	%i6
	movre	%o1,	0x14C,	%i2
	movrlz	%g5,	%l1,	%g4
	movrne	%i3,	0x37A,	%i0
	xnorcc	%o0,	0x11B2,	%g6
	or	%l6,	0x17AB,	%g2
	addc	%i1,	%g1,	%l5
	subccc	%o6,	0x0253,	%g3
	st	%f18,	[%l7 + 0x20]
	edge16l	%o7,	%i7,	%o3
	fmovdneg	%xcc,	%f3,	%f18
	std	%f12,	[%l7 + 0x18]
	fnegs	%f11,	%f8
	srax	%o4,	%o2,	%o5
	fmovrde	%l4,	%f14,	%f10
	fpsub32	%f4,	%f10,	%f4
	fpadd32	%f18,	%f10,	%f20
	movre	%i5,	0x0CC,	%i4
	ld	[%l7 + 0x50],	%f4
	movne	%xcc,	%g7,	%l0
	orcc	%l2,	%i6,	%o1
	stw	%i2,	[%l7 + 0x60]
	sdivcc	%l3,	0x088B,	%l1
	movre	%g5,	0x2F2,	%g4
	stb	%i3,	[%l7 + 0x2D]
	movrgz	%o0,	0x208,	%i0
	movcs	%xcc,	%g6,	%g2
	movleu	%icc,	%i1,	%l6
	andncc	%g1,	%l5,	%o6
	fabsd	%f2,	%f6
	udivx	%o7,	0x0997,	%i7
	fnot2s	%f11,	%f29
	smul	%g3,	%o4,	%o3
	fsrc2	%f4,	%f12
	movgu	%icc,	%o2,	%l4
	fmovdle	%icc,	%f5,	%f5
	movleu	%icc,	%o5,	%i4
	smulcc	%g7,	0x0CE5,	%l0
	movrne	%i5,	0x3D1,	%l2
	edge32	%i6,	%i2,	%l3
	ldsb	[%l7 + 0x30],	%l1
	fandnot1s	%f22,	%f10,	%f4
	sdivx	%o1,	0x18E0,	%g5
	umulcc	%g4,	%i3,	%o0
	movrlez	%i0,	0x253,	%g6
	fmuld8ulx16	%f2,	%f24,	%f8
	movl	%icc,	%i1,	%g2
	udiv	%l6,	0x0C94,	%g1
	andncc	%l5,	%o6,	%i7
	movrlez	%g3,	0x1CD,	%o4
	ldsh	[%l7 + 0x76],	%o7
	orcc	%o2,	%o3,	%l4
	std	%f18,	[%l7 + 0x10]
	fcmpne32	%f12,	%f8,	%o5
	edge32l	%i4,	%l0,	%g7
	edge16l	%l2,	%i6,	%i2
	fxnors	%f9,	%f26,	%f24
	ldd	[%l7 + 0x38],	%f14
	add	%l3,	%i5,	%l1
	faligndata	%f2,	%f6,	%f24
	movvs	%icc,	%o1,	%g5
	fandnot1s	%f29,	%f31,	%f26
	fnegs	%f26,	%f9
	or	%i3,	%o0,	%i0
	udiv	%g4,	0x0E10,	%i1
	fsrc1	%f24,	%f30
	array32	%g2,	%g6,	%g1
	ldsh	[%l7 + 0x68],	%l6
	movg	%xcc,	%o6,	%l5
	smulcc	%g3,	0x12BF,	%i7
	mova	%xcc,	%o4,	%o7
	mova	%icc,	%o2,	%o3
	edge16n	%o5,	%i4,	%l4
	fmovrdgz	%g7,	%f6,	%f6
	sdivx	%l2,	0x06B0,	%i6
	sethi	0x11FE,	%l0
	edge32	%i2,	%l3,	%l1
	fmovrsne	%i5,	%f17,	%f29
	lduh	[%l7 + 0x74],	%g5
	orncc	%i3,	0x0DDA,	%o0
	popc	%i0,	%o1
	sir	0x02F5
	srlx	%g4,	%i1,	%g2
	edge32ln	%g1,	%l6,	%o6
	st	%f29,	[%l7 + 0x54]
	array16	%l5,	%g3,	%i7
	movrgez	%g6,	%o7,	%o4
	sllx	%o2,	%o5,	%i4
	array16	%o3,	%l4,	%g7
	movneg	%xcc,	%l2,	%l0
	edge32	%i6,	%i2,	%l1
	sir	0x0EB9
	edge16n	%i5,	%l3,	%g5
	ldd	[%l7 + 0x08],	%i2
	fmovdcc	%xcc,	%f3,	%f20
	fpsub16	%f28,	%f24,	%f12
	xnorcc	%i0,	%o1,	%g4
	umul	%i1,	%o0,	%g2
	popc	%g1,	%l6
	movneg	%icc,	%o6,	%l5
	fnegd	%f0,	%f16
	save %g3, 0x1A80, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o7,	%i7
	sllx	%o2,	0x03,	%o5
	array32	%o4,	%o3,	%i4
	stb	%l4,	[%l7 + 0x5A]
	andncc	%g7,	%l2,	%i6
	add	%l0,	0x127C,	%l1
	array16	%i5,	%i2,	%g5
	std	%f2,	[%l7 + 0x78]
	fsrc1	%f6,	%f6
	xnorcc	%l3,	%i3,	%i0
	ldsh	[%l7 + 0x16],	%g4
	sll	%i1,	%o0,	%g2
	ldsw	[%l7 + 0x3C],	%g1
	lduw	[%l7 + 0x48],	%l6
	fmuld8ulx16	%f13,	%f21,	%f6
	movrgz	%o1,	0x201,	%l5
	nop
	set	0x79, %i4
	ldub	[%l7 + %i4],	%g3
	edge16	%g6,	%o7,	%i7
	orcc	%o2,	0x17FB,	%o5
	fmovsl	%xcc,	%f13,	%f14
	lduw	[%l7 + 0x78],	%o4
	array8	%o6,	%i4,	%l4
	orn	%o3,	%g7,	%l2
	fabss	%f17,	%f23
	movcs	%icc,	%i6,	%l0
	fmovsge	%xcc,	%f25,	%f24
	nop
	set	0x38, %o5
	stx	%i5,	[%l7 + %o5]
	andn	%i2,	%g5,	%l3
	fcmpne16	%f14,	%f24,	%i3
	stx	%l1,	[%l7 + 0x78]
	movl	%icc,	%i0,	%g4
	xor	%i1,	%g2,	%o0
	subc	%l6,	0x1084,	%g1
	sethi	0x1D2B,	%l5
	sll	%o1,	0x01,	%g6
	std	%f30,	[%l7 + 0x50]
	popc	0x1146,	%g3
	fzeros	%f24
	movn	%xcc,	%i7,	%o7
	fpack32	%f8,	%f22,	%f16
	nop
	set	0x64, %i1
	ldsb	[%l7 + %i1],	%o5
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%o2
	movrne	%o6,	0x0DC,	%o4
	fsrc1	%f4,	%f26
	sethi	0x0D58,	%l4
	sdiv	%o3,	0x1170,	%i4
	ldsw	[%l7 + 0x08],	%g7
	subc	%l2,	%i6,	%i5
	movg	%xcc,	%i2,	%l0
	ldsh	[%l7 + 0x40],	%g5
	fones	%f25
	umulcc	%l3,	%i3,	%l1
	sll	%g4,	0x1E,	%i1
	movre	%i0,	0x1BB,	%g2
	fmovrsne	%l6,	%f26,	%f2
	popc	0x0B4E,	%o0
	fpack16	%f6,	%f23
	array16	%l5,	%g1,	%o1
	movcs	%icc,	%g6,	%g3
	edge16	%i7,	%o5,	%o7
	ldsh	[%l7 + 0x0A],	%o2
	orn	%o6,	%o4,	%o3
	fmovsne	%icc,	%f23,	%f26
	save %l4, 0x1D08, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l2,	%i6,	%i4
	fmovse	%xcc,	%f9,	%f18
	movgu	%icc,	%i2,	%i5
	edge8	%l0,	%g5,	%l3
	fmovsne	%xcc,	%f3,	%f2
	fsrc1s	%f12,	%f26
	edge8n	%i3,	%g4,	%l1
	umulcc	%i1,	0x0896,	%g2
	udivx	%i0,	0x1CF0,	%l6
	movl	%xcc,	%l5,	%o0
	stb	%g1,	[%l7 + 0x09]
	edge16n	%g6,	%o1,	%i7
	edge8ln	%g3,	%o5,	%o2
	movrlz	%o6,	0x16B,	%o4
	and	%o3,	%l4,	%g7
	fornot1	%f30,	%f28,	%f22
	movvc	%icc,	%o7,	%l2
	stw	%i4,	[%l7 + 0x64]
	movle	%icc,	%i2,	%i6
	mulscc	%l0,	%g5,	%i5
	ldub	[%l7 + 0x31],	%i3
	mulx	%l3,	%g4,	%l1
	ldsw	[%l7 + 0x68],	%g2
	lduw	[%l7 + 0x24],	%i0
	lduh	[%l7 + 0x30],	%i1
	fsrc1	%f28,	%f16
	ldsw	[%l7 + 0x38],	%l5
	fmovsleu	%xcc,	%f31,	%f20
	fexpand	%f24,	%f4
	alignaddr	%l6,	%g1,	%o0
	sethi	0x18DA,	%g6
	pdist	%f8,	%f24,	%f6
	andncc	%i7,	%o1,	%g3
	edge16n	%o2,	%o5,	%o6
	xnor	%o4,	%l4,	%o3
	edge32n	%o7,	%g7,	%l2
	xnorcc	%i4,	0x0237,	%i2
	alignaddr	%i6,	%l0,	%g5
	edge16	%i5,	%l3,	%g4
	array32	%i3,	%g2,	%i0
	umul	%l1,	%i1,	%l5
	sdivx	%l6,	0x19DE,	%o0
	movl	%icc,	%g1,	%i7
	sdivx	%o1,	0x16DA,	%g3
	smul	%o2,	%g6,	%o5
	faligndata	%f0,	%f12,	%f28
	lduw	[%l7 + 0x30],	%o4
	edge32n	%o6,	%o3,	%o7
	orn	%g7,	%l4,	%i4
	save %i2, %i6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x61],	%l2
	movrgz	%i5,	0x126,	%g5
	popc	%l3,	%i3
	xor	%g4,	%g2,	%i0
	ldx	[%l7 + 0x30],	%l1
	add	%l5,	0x19D9,	%l6
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	fandnot1s	%f9,	%f19,	%f12
	movrlz	%g1,	0x230,	%o1
	subccc	%o2,	%g6,	%o5
	edge8n	%g3,	%o6,	%o4
	lduh	[%l7 + 0x56],	%o3
	smul	%g7,	0x08D3,	%l4
	fpadd16s	%f24,	%f19,	%f22
	fxnor	%f18,	%f12,	%f26
	movneg	%xcc,	%i4,	%i2
	fmovdneg	%xcc,	%f18,	%f30
	movrlez	%o7,	0x2FC,	%i6
	fmovsge	%icc,	%f29,	%f3
	edge16ln	%l0,	%l2,	%g5
	fcmpeq16	%f16,	%f24,	%i5
	fmovspos	%icc,	%f23,	%f29
	mulx	%i3,	%g4,	%g2
	or	%i0,	0x01AC,	%l1
	mulscc	%l3,	0x1DB9,	%l5
	ldd	[%l7 + 0x30],	%f0
	mulscc	%i1,	0x0C40,	%o0
	bshuffle	%f26,	%f26,	%f0
	ldd	[%l7 + 0x70],	%i6
	st	%f0,	[%l7 + 0x7C]
	fmul8x16	%f21,	%f14,	%f30
	fpsub32s	%f11,	%f5,	%f8
	srlx	%i7,	0x0D,	%g1
	fpack32	%f16,	%f2,	%f8
	sllx	%o1,	0x15,	%g6
	srlx	%o5,	0x11,	%g3
	andncc	%o6,	%o4,	%o2
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%g7
	stw	%l4,	[%l7 + 0x24]
	edge16ln	%i4,	%o3,	%i2
	sub	%i6,	0x0231,	%l0
	movcc	%icc,	%o7,	%g5
	fcmpd	%fcc3,	%f30,	%f26
	fmovsneg	%icc,	%f14,	%f0
	fmovsge	%icc,	%f6,	%f7
	st	%f28,	[%l7 + 0x64]
	mulscc	%i5,	%l2,	%g4
	movrlez	%g2,	0x09D,	%i3
	fxors	%f6,	%f22,	%f1
	lduw	[%l7 + 0x3C],	%i0
	movl	%xcc,	%l3,	%l5
	addc	%l1,	0x0DE7,	%i1
	fxor	%f10,	%f22,	%f12
	restore %l6, 0x11A6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i7,	%g1,	%g6
	sth	%o1,	[%l7 + 0x26]
	mulx	%g3,	0x1B67,	%o5
	addc	%o4,	%o6,	%o2
	orncc	%l4,	%g7,	%i4
	move	%icc,	%o3,	%i2
	movge	%xcc,	%l0,	%i6
	xor	%g5,	%i5,	%l2
	ldd	[%l7 + 0x68],	%f22
	fone	%f14
	edge8ln	%o7,	%g4,	%i3
	fmovrsgz	%i0,	%f0,	%f24
	stb	%l3,	[%l7 + 0x1B]
	edge8n	%l5,	%g2,	%l1
	sll	%l6,	%i1,	%o0
	lduh	[%l7 + 0x26],	%i7
	fmovsvc	%xcc,	%f26,	%f30
	stx	%g6,	[%l7 + 0x70]
	xnorcc	%o1,	0x1AEC,	%g3
	andcc	%g1,	0x04AF,	%o4
	sethi	0x19A4,	%o6
	ldub	[%l7 + 0x32],	%o5
	st	%f11,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x14],	%l4
	for	%f20,	%f0,	%f18
	ld	[%l7 + 0x68],	%f5
	ldd	[%l7 + 0x60],	%g6
	array8	%o2,	%o3,	%i2
	subccc	%l0,	%i6,	%g5
	addc	%i4,	0x18F3,	%i5
	fmovrdlez	%o7,	%f8,	%f6
	movle	%icc,	%g4,	%l2
	edge8ln	%i0,	%i3,	%l5
	fmovrdgz	%g2,	%f24,	%f14
	fpmerge	%f4,	%f9,	%f28
	movvs	%xcc,	%l1,	%l6
	sub	%l3,	%o0,	%i7
	sdivx	%i1,	0x0754,	%g6
	fsrc2s	%f9,	%f3
	andn	%o1,	%g1,	%g3
	ldub	[%l7 + 0x41],	%o4
	add	%o6,	0x078A,	%o5
	xorcc	%l4,	0x0015,	%g7
	fxnor	%f30,	%f28,	%f2
	movpos	%icc,	%o2,	%o3
	array16	%i2,	%l0,	%g5
	faligndata	%f22,	%f12,	%f22
	alignaddr	%i6,	%i5,	%i4
	alignaddrl	%o7,	%g4,	%i0
	udivcc	%i3,	0x195C,	%l5
	edge16ln	%l2,	%l1,	%g2
	save %l6, 0x0E84, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o0,	%i1,	%i7
	move	%icc,	%o1,	%g1
	xor	%g6,	0x1D03,	%o4
	array16	%g3,	%o5,	%l4
	edge32ln	%g7,	%o6,	%o3
	fors	%f27,	%f11,	%f22
	edge16l	%o2,	%i2,	%g5
	movneg	%xcc,	%l0,	%i6
	ldd	[%l7 + 0x20],	%f10
	or	%i5,	%o7,	%g4
	fsrc1s	%f7,	%f5
	move	%xcc,	%i0,	%i4
	fsrc1s	%f25,	%f15
	smul	%l5,	0x1731,	%i3
	addccc	%l2,	0x1548,	%l1
	st	%f31,	[%l7 + 0x1C]
	orncc	%g2,	%l6,	%l3
	movle	%icc,	%o0,	%i7
	edge16	%i1,	%g1,	%g6
	movleu	%icc,	%o1,	%o4
	fmul8x16	%f25,	%f2,	%f30
	movgu	%icc,	%o5,	%l4
	movrne	%g7,	%o6,	%o3
	movge	%icc,	%g3,	%o2
	fnot1	%f10,	%f22
	fmovscs	%xcc,	%f19,	%f29
	subcc	%i2,	%l0,	%g5
	movgu	%xcc,	%i6,	%i5
	movrlz	%o7,	0x2C8,	%g4
	fmovde	%xcc,	%f10,	%f24
	movneg	%xcc,	%i0,	%l5
	movrlez	%i3,	%l2,	%l1
	edge16	%i4,	%l6,	%l3
	edge8l	%o0,	%g2,	%i7
	lduh	[%l7 + 0x22],	%i1
	alignaddr	%g1,	%g6,	%o1
	fmul8x16au	%f31,	%f12,	%f26
	xnorcc	%o5,	%l4,	%o4
	movge	%icc,	%g7,	%o6
	st	%f4,	[%l7 + 0x30]
	fnot1s	%f6,	%f23
	nop
	set	0x7A, %o3
	ldub	[%l7 + %o3],	%o3
	addccc	%g3,	0x1695,	%i2
	movleu	%icc,	%l0,	%g5
	edge32l	%i6,	%i5,	%o7
	stb	%o2,	[%l7 + 0x63]
	fpadd32	%f16,	%f20,	%f30
	edge8	%i0,	%g4,	%l5
	lduw	[%l7 + 0x48],	%l2
	fxor	%f30,	%f12,	%f12
	move	%icc,	%l1,	%i3
	movrne	%i4,	0x111,	%l6
	fnegd	%f26,	%f4
	movge	%xcc,	%o0,	%g2
	movn	%icc,	%i7,	%i1
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	edge8	%o5,	%o1,	%o4
	sub	%g7,	%l4,	%o6
	edge32n	%g3,	%o3,	%l0
	fpsub32s	%f0,	%f17,	%f15
	edge16	%i2,	%i6,	%i5
	movpos	%xcc,	%g5,	%o7
	movn	%icc,	%o2,	%g4
	fxor	%f20,	%f26,	%f2
	ldx	[%l7 + 0x58],	%l5
	move	%xcc,	%l2,	%l1
	mulx	%i3,	%i4,	%i0
	sth	%o0,	[%l7 + 0x4C]
	edge16l	%l6,	%i7,	%i1
	restore %g1, %l3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%o5,	%o1
	orn	%g7,	0x0737,	%o4
	edge16ln	%o6,	%g3,	%l4
	edge16l	%l0,	%o3,	%i6
	fmul8x16	%f13,	%f26,	%f0
	fmovdge	%icc,	%f2,	%f6
	fnor	%f26,	%f16,	%f24
	fnands	%f6,	%f31,	%f14
	stx	%i5,	[%l7 + 0x40]
	ldsb	[%l7 + 0x73],	%g5
	fmovde	%xcc,	%f26,	%f28
	fmovdgu	%xcc,	%f20,	%f3
	movrne	%o7,	0x085,	%i2
	fmovde	%xcc,	%f26,	%f21
	fnands	%f8,	%f20,	%f31
	sdivcc	%o2,	0x0595,	%l5
	umulcc	%g4,	0x1966,	%l2
	andn	%l1,	%i3,	%i4
	fcmpgt32	%f16,	%f22,	%i0
	fmovsgu	%xcc,	%f0,	%f26
	udiv	%o0,	0x1CA5,	%l6
	umul	%i1,	%g1,	%l3
	alignaddr	%g6,	%g2,	%o5
	movvc	%icc,	%o1,	%i7
	orcc	%g7,	0x176B,	%o4
	movre	%g3,	0x37D,	%l4
	sll	%l0,	%o6,	%i6
	fcmple32	%f8,	%f10,	%o3
	udivcc	%g5,	0x1C1F,	%o7
	sdivcc	%i2,	0x1250,	%o2
	andn	%i5,	%g4,	%l5
	andcc	%l1,	%l2,	%i4
	srax	%i3,	%o0,	%l6
	fmovrsne	%i1,	%f17,	%f19
	edge8n	%g1,	%i0,	%g6
	addccc	%l3,	%g2,	%o1
	save %o5, 0x108F, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f28
	or	%o4,	%i7,	%l4
	movrlz	%g3,	0x210,	%o6
	fnors	%f29,	%f22,	%f16
	mulx	%l0,	0x0FBD,	%i6
	sethi	0x0667,	%g5
	mulx	%o3,	%i2,	%o2
	movle	%icc,	%i5,	%o7
	sdivcc	%l5,	0x1D04,	%g4
	movne	%xcc,	%l1,	%i4
	bshuffle	%f4,	%f4,	%f20
	xorcc	%l2,	%o0,	%l6
	fzeros	%f3
	movl	%xcc,	%i3,	%g1
	xorcc	%i1,	0x176B,	%g6
	nop
	set	0x28, %g2
	ldsh	[%l7 + %g2],	%l3
	sdivcc	%g2,	0x093F,	%i0
	edge32ln	%o1,	%o5,	%g7
	andcc	%o4,	%i7,	%g3
	addc	%l4,	0x0262,	%o6
	movle	%xcc,	%i6,	%l0
	fmovrsgez	%o3,	%f5,	%f5
	sir	0x127B
	subc	%i2,	%o2,	%i5
	orcc	%o7,	0x1CB5,	%l5
	andcc	%g4,	%l1,	%i4
	fand	%f16,	%f20,	%f8
	fpsub16s	%f30,	%f25,	%f28
	udivcc	%g5,	0x0601,	%o0
	fmovsgu	%icc,	%f3,	%f31
	fcmple16	%f30,	%f2,	%l6
	xorcc	%i3,	0x1823,	%l2
	edge16ln	%g1,	%i1,	%g6
	fmovdl	%xcc,	%f21,	%f15
	edge32	%g2,	%l3,	%o1
	movneg	%icc,	%o5,	%g7
	sir	0x0ED2
	orn	%i0,	0x0A7F,	%o4
	lduw	[%l7 + 0x14],	%i7
	umul	%l4,	0x0C1E,	%g3
	sir	0x1A3F
	sll	%i6,	%o6,	%o3
	sll	%i2,	0x01,	%l0
	edge32l	%o2,	%o7,	%i5
	andcc	%g4,	0x1FE2,	%l1
	srax	%i4,	%g5,	%o0
	umul	%l6,	%l5,	%l2
	sth	%i3,	[%l7 + 0x68]
	ldx	[%l7 + 0x38],	%g1
	subc	%g6,	%g2,	%l3
	udivcc	%o1,	0x0FAC,	%o5
	subccc	%i1,	0x19C1,	%i0
	sir	0x1FDC
	alignaddrl	%o4,	%i7,	%g7
	umulcc	%l4,	0x173D,	%i6
	addcc	%o6,	%o3,	%g3
	smulcc	%i2,	0x0585,	%l0
	fnegd	%f8,	%f4
	fors	%f17,	%f14,	%f26
	ldx	[%l7 + 0x78],	%o7
	fpmerge	%f28,	%f15,	%f12
	ld	[%l7 + 0x64],	%f3
	array8	%i5,	%o2,	%l1
	movgu	%icc,	%i4,	%g5
	srl	%o0,	%l6,	%l5
	movrlz	%g4,	0x22E,	%l2
	srax	%g1,	0x09,	%g6
	orcc	%g2,	0x1E73,	%l3
	fmovspos	%icc,	%f17,	%f17
	and	%o1,	%i3,	%o5
	sllx	%i1,	0x0E,	%o4
	sdiv	%i7,	0x12D6,	%i0
	fmuld8ulx16	%f28,	%f2,	%f26
	subc	%l4,	0x0602,	%i6
	fmul8x16au	%f17,	%f0,	%f26
	subc	%g7,	%o6,	%o3
	srl	%i2,	%l0,	%g3
	fmovrsgez	%i5,	%f24,	%f27
	sdivcc	%o7,	0x1A34,	%o2
	alignaddr	%i4,	%g5,	%l1
	fmul8ulx16	%f28,	%f24,	%f30
	movvc	%icc,	%o0,	%l5
	sra	%g4,	%l6,	%g1
	movl	%icc,	%g6,	%l2
	smul	%g2,	0x016C,	%l3
	movn	%icc,	%i3,	%o5
	edge32l	%i1,	%o1,	%i7
	fmovsvc	%icc,	%f31,	%f10
	fmovrdgez	%o4,	%f0,	%f0
	umul	%l4,	%i6,	%i0
	edge32n	%o6,	%o3,	%g7
	popc	0x1E91,	%i2
	movvs	%icc,	%l0,	%i5
	fmovscc	%icc,	%f3,	%f22
	fcmpd	%fcc2,	%f12,	%f20
	mulx	%g3,	%o2,	%o7
	st	%f25,	[%l7 + 0x50]
	fnegs	%f9,	%f14
	udivx	%i4,	0x0656,	%l1
	fmovrse	%g5,	%f7,	%f1
	movl	%xcc,	%o0,	%l5
	andn	%g4,	%l6,	%g1
	srax	%g6,	%g2,	%l3
	ldsh	[%l7 + 0x2A],	%i3
	edge32n	%l2,	%i1,	%o5
	array32	%i7,	%o4,	%o1
	or	%l4,	%i6,	%o6
	subccc	%o3,	%i0,	%g7
	sdivx	%l0,	0x0E40,	%i5
	pdist	%f20,	%f2,	%f10
	array16	%i2,	%o2,	%o7
	stx	%i4,	[%l7 + 0x18]
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	mulx	%g5,	%l5,	%g4
	fmovsl	%xcc,	%f2,	%f12
	fabss	%f24,	%f22
	stb	%o0,	[%l7 + 0x2F]
	movre	%l6,	%g6,	%g2
	fmovrsgez	%l3,	%f29,	%f5
	std	%f26,	[%l7 + 0x10]
	save %g1, 0x0EF2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i1,	0x112B,	%o5
	movcs	%xcc,	%i7,	%o4
	srl	%i3,	0x0C,	%l4
	ldx	[%l7 + 0x50],	%i6
	edge8ln	%o1,	%o6,	%o3
	orcc	%i0,	%g7,	%l0
	fone	%f22
	edge32l	%i2,	%i5,	%o7
	ldsw	[%l7 + 0x24],	%o2
	sdivcc	%g3,	0x116F,	%l1
	fmovsg	%icc,	%f20,	%f11
	fpackfix	%f8,	%f27
	fmovdleu	%icc,	%f11,	%f19
	add	%g5,	%l5,	%g4
	fornot2s	%f27,	%f2,	%f12
	sra	%i4,	0x15,	%l6
	movrgz	%o0,	%g6,	%g2
	sdivcc	%l3,	0x0BBB,	%g1
	array32	%l2,	%i1,	%i7
	mova	%icc,	%o5,	%i3
	umulcc	%o4,	%i6,	%l4
	fpsub32	%f14,	%f4,	%f8
	edge32ln	%o1,	%o6,	%o3
	fmovsl	%icc,	%f14,	%f14
	movrgz	%g7,	%l0,	%i2
	edge32ln	%i0,	%o7,	%i5
	udiv	%o2,	0x070E,	%l1
	edge32	%g3,	%g5,	%g4
	nop
	set	0x50, %l2
	lduh	[%l7 + %l2],	%l5
	fmovdl	%icc,	%f2,	%f4
	srl	%l6,	%i4,	%g6
	movrne	%g2,	0x032,	%o0
	srax	%l3,	0x09,	%g1
	srax	%i1,	%i7,	%o5
	fcmpeq32	%f20,	%f10,	%i3
	fmovrdne	%o4,	%f20,	%f6
	save %l2, %l4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f20,	%f28,	%o1
	subc	%o6,	0x1ABA,	%g7
	subccc	%l0,	0x0233,	%o3
	ldx	[%l7 + 0x10],	%i2
	fcmple16	%f14,	%f12,	%o7
	sll	%i5,	0x0B,	%o2
	movrlez	%i0,	%l1,	%g3
	fmovrslez	%g5,	%f18,	%f22
	sdiv	%l5,	0x17DB,	%l6
	addc	%g4,	%i4,	%g6
	array8	%o0,	%l3,	%g2
	std	%f30,	[%l7 + 0x60]
	edge8n	%g1,	%i7,	%o5
	xnorcc	%i1,	0x09BE,	%o4
	or	%l2,	%l4,	%i6
	movge	%icc,	%i3,	%o6
	movl	%icc,	%o1,	%g7
	fcmpne32	%f26,	%f16,	%o3
	movneg	%xcc,	%l0,	%i2
	popc	%o7,	%i5
	edge32	%o2,	%i0,	%g3
	fpackfix	%f18,	%f3
	edge16	%g5,	%l5,	%l6
	fpadd16	%f4,	%f2,	%f8
	movleu	%icc,	%l1,	%i4
	fone	%f0
	fcmpgt16	%f0,	%f28,	%g4
	fmovda	%xcc,	%f9,	%f14
	movn	%icc,	%g6,	%o0
	fpsub16s	%f23,	%f7,	%f6
	movcc	%xcc,	%g2,	%l3
	edge8	%g1,	%o5,	%i7
	addc	%i1,	%o4,	%l4
	edge8ln	%l2,	%i3,	%o6
	edge32	%o1,	%i6,	%g7
	movpos	%icc,	%l0,	%o3
	movne	%icc,	%i2,	%i5
	alignaddrl	%o2,	%o7,	%i0
	ldsh	[%l7 + 0x08],	%g5
	orn	%l5,	0x09A1,	%l6
	lduh	[%l7 + 0x68],	%l1
	stw	%i4,	[%l7 + 0x20]
	umul	%g3,	0x0A8A,	%g4
	movle	%icc,	%o0,	%g6
	sll	%g2,	0x02,	%l3
	orncc	%o5,	%g1,	%i7
	edge32n	%i1,	%l4,	%o4
	edge16l	%l2,	%i3,	%o6
	array8	%o1,	%g7,	%l0
	fmovsa	%xcc,	%f1,	%f9
	addccc	%o3,	0x0FBD,	%i6
	fandnot1s	%f2,	%f21,	%f29
	ldsh	[%l7 + 0x3C],	%i5
	movne	%icc,	%o2,	%o7
	fmovsvs	%icc,	%f14,	%f20
	fmovrde	%i2,	%f22,	%f18
	andn	%g5,	0x12C5,	%l5
	movleu	%icc,	%i0,	%l6
	edge8l	%i4,	%g3,	%l1
	array16	%g4,	%o0,	%g6
	edge8l	%g2,	%o5,	%g1
	srax	%i7,	%i1,	%l4
	array8	%o4,	%l3,	%l2
	udivcc	%o6,	0x053F,	%i3
	edge8l	%g7,	%l0,	%o1
	movre	%o3,	%i5,	%o2
	movleu	%icc,	%i6,	%i2
	fmul8x16al	%f2,	%f22,	%f24
	movge	%xcc,	%o7,	%l5
	movneg	%xcc,	%i0,	%g5
	mova	%xcc,	%i4,	%g3
	addcc	%l1,	0x01C9,	%l6
	edge8l	%o0,	%g4,	%g6
	sub	%g2,	0x1700,	%o5
	edge16n	%g1,	%i7,	%i1
	fmovrdgez	%l4,	%f10,	%f2
	fmovspos	%icc,	%f6,	%f12
	movle	%icc,	%o4,	%l2
	orcc	%o6,	%l3,	%g7
	movcs	%xcc,	%i3,	%o1
	xnor	%l0,	%o3,	%i5
	srlx	%o2,	%i2,	%i6
	ldub	[%l7 + 0x27],	%o7
	and	%l5,	0x03E0,	%i0
	sra	%g5,	%g3,	%l1
	subccc	%l6,	0x13CA,	%i4
	movrlz	%g4,	0x12D,	%g6
	array8	%o0,	%o5,	%g1
	edge32n	%i7,	%g2,	%i1
	fxor	%f10,	%f10,	%f10
	alignaddrl	%l4,	%o4,	%l2
	xor	%l3,	0x0703,	%g7
	fors	%f0,	%f3,	%f31
	fmuld8ulx16	%f27,	%f6,	%f10
	ldd	[%l7 + 0x60],	%f0
	andncc	%o6,	%o1,	%l0
	srl	%o3,	0x0F,	%i5
	fpackfix	%f24,	%f31
	fmovdleu	%xcc,	%f3,	%f10
	xor	%i3,	%o2,	%i6
	edge16n	%o7,	%l5,	%i0
	addc	%g5,	0x0A60,	%g3
	movgu	%xcc,	%l1,	%i2
	addccc	%l6,	%i4,	%g4
	orncc	%g6,	0x0BF0,	%o5
	fmovda	%icc,	%f25,	%f0
	fzero	%f4
	st	%f0,	[%l7 + 0x5C]
	movg	%icc,	%g1,	%o0
	movrgz	%g2,	0x2D0,	%i7
	stb	%i1,	[%l7 + 0x0A]
	edge16l	%l4,	%o4,	%l3
	movle	%icc,	%g7,	%l2
	movrlez	%o1,	0x215,	%o6
	umulcc	%o3,	0x0A68,	%l0
	srlx	%i3,	%i5,	%o2
	fmovrslz	%i6,	%f21,	%f28
	subcc	%l5,	0x1393,	%i0
	st	%f27,	[%l7 + 0x70]
	mova	%xcc,	%g5,	%o7
	ldx	[%l7 + 0x20],	%l1
	movcs	%icc,	%g3,	%i2
	fsrc2s	%f17,	%f19
	sub	%l6,	%i4,	%g4
	fornot2s	%f0,	%f25,	%f27
	smul	%g6,	%g1,	%o0
	movcc	%icc,	%o5,	%g2
	smulcc	%i7,	%i1,	%l4
	subcc	%l3,	0x0224,	%g7
	fmul8x16	%f23,	%f20,	%f10
	std	%f4,	[%l7 + 0x60]
	save %l2, 0x1BDE, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o6,	%o3
	ldd	[%l7 + 0x50],	%f22
	edge16	%o4,	%l0,	%i3
	fmovrdgz	%i5,	%f30,	%f8
	mulscc	%o2,	%l5,	%i6
	orcc	%i0,	0x0819,	%g5
	fnegd	%f28,	%f26
	fmovdge	%xcc,	%f25,	%f7
	movl	%xcc,	%l1,	%g3
	sdivcc	%o7,	0x03D9,	%i2
	umul	%l6,	%g4,	%i4
	alignaddrl	%g1,	%g6,	%o5
	fmovscc	%icc,	%f28,	%f18
	fpadd16s	%f26,	%f9,	%f9
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%o0
	movleu	%icc,	%i7,	%i1
	orncc	%l4,	0x12EE,	%l3
	xor	%g2,	%g7,	%l2
	ldsb	[%l7 + 0x7F],	%o6
	array16	%o3,	%o4,	%l0
	umul	%i3,	0x0D90,	%o1
	mulscc	%i5,	%o2,	%i6
	ldub	[%l7 + 0x4D],	%l5
	subccc	%g5,	%l1,	%g3
	sir	0x1629
	sllx	%o7,	%i2,	%i0
	fpadd32s	%f5,	%f24,	%f26
	edge32ln	%l6,	%i4,	%g4
	srlx	%g1,	0x0A,	%o5
	stw	%g6,	[%l7 + 0x08]
	sethi	0x07CA,	%o0
	movre	%i7,	0x345,	%l4
	fmovdn	%icc,	%f25,	%f3
	restore %l3, %i1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g2,	%o6,	%o3
	movleu	%xcc,	%l2,	%o4
	move	%xcc,	%l0,	%o1
	save %i5, %i3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l5,	%g5,	%o2
	fnot2	%f6,	%f18
	edge8l	%g3,	%l1,	%i2
	movle	%xcc,	%i0,	%o7
	and	%l6,	0x0600,	%i4
	edge32l	%g1,	%o5,	%g4
	fabsd	%f12,	%f4
	edge16ln	%g6,	%i7,	%o0
	ldd	[%l7 + 0x20],	%l2
	sdiv	%i1,	0x0C01,	%g7
	save %g2, 0x0030, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f22,	%f21
	or	%o3,	0x0D46,	%l4
	movleu	%icc,	%o4,	%l0
	umulcc	%o1,	%i5,	%l2
	movgu	%xcc,	%i6,	%i3
	ldsw	[%l7 + 0x1C],	%l5
	sth	%o2,	[%l7 + 0x5C]
	fmovrdlz	%g3,	%f28,	%f24
	orcc	%g5,	0x0F6F,	%i2
	movpos	%icc,	%i0,	%l1
	sethi	0x0E83,	%o7
	or	%i4,	%g1,	%o5
	movcc	%icc,	%l6,	%g6
	edge8ln	%g4,	%i7,	%o0
	xnor	%i1,	%g7,	%l3
	addccc	%g2,	%o3,	%l4
	fcmpes	%fcc2,	%f7,	%f30
	movrlez	%o4,	%o6,	%l0
	fmovda	%icc,	%f18,	%f28
	movgu	%xcc,	%i5,	%l2
	fnand	%f14,	%f0,	%f0
	lduw	[%l7 + 0x0C],	%o1
	ldd	[%l7 + 0x28],	%i2
	edge8l	%i6,	%o2,	%g3
	movne	%xcc,	%l5,	%i2
	movgu	%icc,	%g5,	%i0
	ldsw	[%l7 + 0x74],	%o7
	fmovscs	%xcc,	%f29,	%f16
	umulcc	%l1,	0x0939,	%i4
	and	%g1,	%l6,	%o5
	ldub	[%l7 + 0x5C],	%g4
	movl	%icc,	%i7,	%g6
	edge16n	%i1,	%g7,	%o0
	fnot2s	%f5,	%f25
	lduw	[%l7 + 0x68],	%g2
	ldx	[%l7 + 0x28],	%o3
	fabss	%f24,	%f23
	smul	%l4,	0x185D,	%l3
	siam	0x7
	fmovsleu	%icc,	%f1,	%f19
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	edge16ln	%l0,	%l2,	%o1
	popc	%i3,	%i6
	srl	%g3,	0x0C,	%l5
	popc	%o2,	%i2
	and	%i0,	0x17D6,	%o7
	fmovsgu	%icc,	%f23,	%f6
	edge8n	%g5,	%i4,	%g1
	movne	%xcc,	%l1,	%o5
	edge32l	%l6,	%i7,	%g4
	edge16	%g6,	%g7,	%i1
	popc	%o0,	%o3
	add	%g2,	%l4,	%o4
	sdivx	%o6,	0x1CDB,	%i5
	fpadd32s	%f9,	%f13,	%f28
	udiv	%l3,	0x1A22,	%l0
	fabsd	%f4,	%f16
	ldx	[%l7 + 0x28],	%o1
	sll	%l2,	0x02,	%i6
	fandnot2s	%f11,	%f17,	%f12
	alignaddr	%i3,	%g3,	%o2
	fzeros	%f25
	movleu	%xcc,	%l5,	%i0
	alignaddrl	%i2,	%o7,	%i4
	movn	%icc,	%g1,	%l1
	subc	%g5,	%o5,	%i7
	subc	%g4,	%l6,	%g6
	or	%i1,	0x0EB5,	%o0
	xnorcc	%g7,	0x1A46,	%g2
	udivcc	%o3,	0x09C4,	%l4
	fxors	%f31,	%f22,	%f27
	movge	%icc,	%o4,	%o6
	fmovrsgz	%l3,	%f17,	%f30
	edge8l	%i5,	%o1,	%l2
	addccc	%i6,	%i3,	%l0
	movneg	%xcc,	%o2,	%g3
	sll	%l5,	%i2,	%o7
	andn	%i4,	%i0,	%g1
	fmovdvc	%xcc,	%f12,	%f19
	fpsub32s	%f12,	%f27,	%f4
	fcmpgt32	%f12,	%f0,	%l1
	fmovrdgz	%o5,	%f2,	%f30
	movne	%xcc,	%i7,	%g4
	fcmpeq16	%f6,	%f16,	%l6
	movpos	%icc,	%g6,	%g5
	sdiv	%i1,	0x03CE,	%o0
	ldd	[%l7 + 0x08],	%g2
	or	%g7,	0x0159,	%o3
	sdivx	%o4,	0x0CE7,	%o6
	movpos	%xcc,	%l4,	%i5
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f12
	sdivx	%l3,	0x1D4A,	%o1
	edge32l	%l2,	%i6,	%i3
	udiv	%o2,	0x162A,	%l0
	fpsub16s	%f31,	%f14,	%f21
	movpos	%xcc,	%l5,	%g3
	sdiv	%i2,	0x0049,	%i4
	fcmpne16	%f18,	%f12,	%o7
	nop
	set	0x50, %o6
	lduw	[%l7 + %o6],	%i0
	subcc	%l1,	0x1D17,	%g1
	movne	%xcc,	%i7,	%g4
	fcmple32	%f28,	%f30,	%l6
	srax	%g6,	0x16,	%g5
	movcc	%xcc,	%o5,	%i1
	fmovdn	%icc,	%f4,	%f30
	fxors	%f23,	%f5,	%f22
	sra	%o0,	0x15,	%g2
	ldsb	[%l7 + 0x53],	%o3
	movl	%xcc,	%g7,	%o4
	movvc	%icc,	%l4,	%i5
	edge8ln	%o6,	%o1,	%l2
	smulcc	%l3,	0x093F,	%i3
	fxor	%f2,	%f20,	%f2
	sub	%i6,	0x1E55,	%l0
	fnot2	%f28,	%f10
	addcc	%l5,	0x1FE8,	%o2
	ldd	[%l7 + 0x78],	%i2
	umulcc	%g3,	%i4,	%i0
	xnor	%o7,	0x011B,	%l1
	stw	%g1,	[%l7 + 0x74]
	movrgez	%i7,	0x237,	%l6
	fmovrsgez	%g4,	%f10,	%f12
	ldsb	[%l7 + 0x11],	%g5
	andcc	%g6,	0x05DF,	%o5
	movpos	%icc,	%o0,	%i1
	movpos	%xcc,	%g2,	%o3
	popc	0x0857,	%g7
	ldsb	[%l7 + 0x2F],	%l4
	edge16	%i5,	%o4,	%o6
	fmovsge	%icc,	%f19,	%f4
	sllx	%o1,	0x16,	%l3
	ld	[%l7 + 0x48],	%f29
	fmovsge	%icc,	%f8,	%f15
	movrgez	%i3,	0x14E,	%l2
	move	%xcc,	%i6,	%l5
	sdivx	%o2,	0x0C4F,	%i2
	movl	%xcc,	%l0,	%i4
	movvc	%xcc,	%i0,	%g3
	sth	%o7,	[%l7 + 0x44]
	edge32l	%l1,	%g1,	%i7
	udiv	%l6,	0x0C20,	%g4
	movrne	%g6,	0x007,	%o5
	orcc	%o0,	%g5,	%g2
	movrgz	%i1,	%o3,	%g7
	fmovrslez	%i5,	%f4,	%f23
	movvs	%icc,	%o4,	%o6
	srax	%o1,	0x07,	%l3
	mova	%xcc,	%l4,	%i3
	movrgez	%i6,	0x367,	%l2
	edge32n	%l5,	%o2,	%l0
	nop
	set	0x10, %i0
	lduh	[%l7 + %i0],	%i4
	movne	%icc,	%i2,	%g3
	add	%i0,	0x1856,	%o7
	mova	%icc,	%g1,	%l1
	fands	%f15,	%f17,	%f1
	subc	%l6,	%g4,	%g6
	fmovde	%xcc,	%f0,	%f8
	movvc	%xcc,	%o5,	%o0
	edge32	%g5,	%i7,	%i1
	ldub	[%l7 + 0x6F],	%o3
	edge8n	%g2,	%i5,	%g7
	stx	%o6,	[%l7 + 0x10]
	addc	%o4,	0x1B22,	%o1
	movvc	%xcc,	%l3,	%l4
	fmovrsgez	%i3,	%f0,	%f6
	sub	%l2,	0x1FAB,	%i6
	umulcc	%l5,	%l0,	%o2
	movrlz	%i2,	%g3,	%i0
	siam	0x4
	edge16ln	%i4,	%g1,	%o7
	edge16	%l6,	%g4,	%g6
	movneg	%icc,	%o5,	%o0
	umulcc	%l1,	0x08AD,	%i7
	movleu	%xcc,	%g5,	%o3
	mulscc	%i1,	%i5,	%g2
	fmovsg	%xcc,	%f24,	%f27
	fmovrsne	%o6,	%f7,	%f10
	edge32	%o4,	%o1,	%l3
	fmovdcs	%icc,	%f27,	%f4
	edge32l	%g7,	%i3,	%l4
	sll	%i6,	0x1E,	%l2
	movge	%icc,	%l0,	%o2
	array32	%i2,	%g3,	%l5
	fmovsvc	%icc,	%f13,	%f4
	fmovsgu	%icc,	%f30,	%f19
	sll	%i0,	0x0E,	%i4
	fnands	%f30,	%f14,	%f24
	fmovdneg	%icc,	%f28,	%f19
	array16	%g1,	%l6,	%o7
	edge32	%g6,	%g4,	%o0
	stb	%l1,	[%l7 + 0x49]
	fnot1	%f4,	%f0
	ldsb	[%l7 + 0x3F],	%i7
	lduw	[%l7 + 0x18],	%o5
	fmovdpos	%xcc,	%f10,	%f9
	ldd	[%l7 + 0x30],	%f22
	addc	%o3,	%i1,	%g5
	movl	%icc,	%i5,	%o6
	addccc	%o4,	0x1531,	%g2
	sth	%o1,	[%l7 + 0x70]
	xor	%l3,	0x081D,	%g7
	sdivcc	%i3,	0x02E7,	%l4
	srax	%l2,	0x0D,	%i6
	fmovsgu	%icc,	%f20,	%f14
	movcc	%xcc,	%l0,	%o2
	ldsb	[%l7 + 0x63],	%g3
	srax	%i2,	0x1E,	%i0
	stw	%i4,	[%l7 + 0x70]
	fmuld8sux16	%f30,	%f1,	%f26
	std	%f30,	[%l7 + 0x70]
	movvc	%icc,	%g1,	%l5
	andcc	%o7,	%l6,	%g4
	fmul8x16	%f20,	%f24,	%f16
	fmovs	%f27,	%f1
	fnot1	%f0,	%f20
	lduh	[%l7 + 0x08],	%o0
	edge32l	%g6,	%l1,	%i7
	movcs	%xcc,	%o5,	%i1
	stb	%o3,	[%l7 + 0x12]
	smul	%g5,	%i5,	%o6
	movn	%icc,	%o4,	%o1
	sra	%l3,	%g2,	%i3
	and	%g7,	%l4,	%i6
	std	%f8,	[%l7 + 0x08]
	fnegd	%f20,	%f4
	edge16n	%l2,	%l0,	%o2
	movn	%xcc,	%g3,	%i0
	movre	%i2,	%g1,	%l5
	addcc	%i4,	0x0182,	%l6
	andcc	%o7,	0x16BB,	%g4
	umul	%g6,	0x0C4E,	%o0
	edge8ln	%i7,	%o5,	%l1
	edge8ln	%i1,	%g5,	%o3
	alignaddrl	%o6,	%i5,	%o1
	fpack32	%f6,	%f4,	%f30
	movvs	%xcc,	%l3,	%o4
	save %i3, %g2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i6,	%l2
	sdivcc	%l4,	0x0A04,	%o2
	subcc	%g3,	0x19EE,	%i0
	movvs	%xcc,	%i2,	%l0
	stb	%l5,	[%l7 + 0x61]
	subc	%i4,	0x0B98,	%l6
	fpadd32	%f12,	%f16,	%f24
	movn	%icc,	%o7,	%g1
	edge8n	%g6,	%o0,	%g4
	movrgez	%i7,	%o5,	%l1
	fmovsne	%xcc,	%f20,	%f27
	fpsub32s	%f21,	%f5,	%f31
	subc	%g5,	%i1,	%o6
	stx	%i5,	[%l7 + 0x68]
	edge8ln	%o1,	%l3,	%o4
	edge16	%i3,	%g2,	%g7
	fmovscc	%xcc,	%f11,	%f2
	ldub	[%l7 + 0x74],	%i6
	sth	%o3,	[%l7 + 0x2A]
	fmuld8sux16	%f2,	%f10,	%f6
	ldx	[%l7 + 0x70],	%l4
	subc	%l2,	0x0B1C,	%g3
	mulx	%o2,	0x0FEE,	%i0
	faligndata	%f18,	%f26,	%f14
	std	%f2,	[%l7 + 0x68]
	array16	%i2,	%l0,	%i4
	smul	%l6,	%l5,	%o7
	fcmpes	%fcc3,	%f2,	%f16
	pdist	%f26,	%f30,	%f0
	movg	%xcc,	%g1,	%o0
	movge	%xcc,	%g4,	%i7
	sra	%g6,	%l1,	%o5
	fmovrse	%i1,	%f6,	%f14
	srl	%g5,	0x03,	%o6
	xorcc	%o1,	%l3,	%i5
	fxnors	%f21,	%f20,	%f3
	or	%o4,	0x04DF,	%g2
	restore %g7, %i6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f2,	%f22,	%f18
	edge8ln	%l4,	%l2,	%g3
	fmovdle	%icc,	%f8,	%f8
	movrgez	%o2,	%i0,	%i2
	edge32ln	%l0,	%i4,	%i3
	movl	%xcc,	%l5,	%l6
	fpadd16s	%f4,	%f20,	%f24
	array8	%g1,	%o0,	%o7
	edge32ln	%i7,	%g4,	%g6
	addc	%l1,	%o5,	%i1
	mulscc	%o6,	0x088E,	%o1
	xnorcc	%g5,	0x15D7,	%l3
	fpmerge	%f11,	%f4,	%f26
	edge16l	%i5,	%o4,	%g7
	umulcc	%g2,	0x185E,	%o3
	st	%f10,	[%l7 + 0x3C]
	save %l4, 0x1E99, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l2,	%g3,	%o2
	lduw	[%l7 + 0x38],	%i2
	movcs	%xcc,	%l0,	%i4
	xorcc	%i3,	%i0,	%l5
	edge16ln	%g1,	%o0,	%o7
	udivcc	%l6,	0x12B8,	%i7
	xorcc	%g4,	%g6,	%l1
	movcs	%xcc,	%i1,	%o6
	fmovdn	%icc,	%f24,	%f13
	movrne	%o5,	%g5,	%o1
	edge8ln	%l3,	%i5,	%g7
	fmovsl	%icc,	%f13,	%f31
	umul	%g2,	%o3,	%o4
	ldub	[%l7 + 0x51],	%l4
	edge16	%l2,	%g3,	%o2
	udivx	%i2,	0x0CF5,	%l0
	fors	%f4,	%f22,	%f16
	fmovsgu	%icc,	%f13,	%f5
	udivcc	%i4,	0x1332,	%i6
	xorcc	%i0,	0x0842,	%l5
	smulcc	%i3,	0x1B2A,	%o0
	edge16n	%g1,	%o7,	%l6
	lduh	[%l7 + 0x26],	%i7
	edge32	%g6,	%g4,	%l1
	fmovscs	%icc,	%f6,	%f16
	andn	%i1,	0x1CBC,	%o5
	sir	0x180A
	edge16n	%o6,	%g5,	%l3
	movcc	%xcc,	%o1,	%g7
	movcs	%icc,	%g2,	%o3
	smulcc	%o4,	%i5,	%l4
	mulx	%g3,	0x1282,	%l2
	add	%i2,	0x1EFE,	%l0
	edge16l	%o2,	%i4,	%i6
	xor	%l5,	%i0,	%o0
	fmovde	%icc,	%f19,	%f19
	popc	0x1377,	%g1
	fpmerge	%f29,	%f16,	%f30
	orn	%i3,	0x0D3A,	%o7
	sdivcc	%i7,	0x0172,	%l6
	srax	%g6,	0x01,	%l1
	addc	%g4,	%o5,	%i1
	ldx	[%l7 + 0x60],	%g5
	std	%f14,	[%l7 + 0x58]
	orn	%l3,	0x1531,	%o6
	xorcc	%o1,	%g2,	%g7
	smulcc	%o3,	0x161F,	%i5
	array32	%o4,	%g3,	%l4
	sra	%i2,	0x09,	%l2
	sra	%o2,	0x1C,	%i4
	andncc	%i6,	%l0,	%i0
	movrgez	%l5,	0x163,	%g1
	ld	[%l7 + 0x3C],	%f8
	fcmped	%fcc1,	%f10,	%f10
	nop
	set	0x0C, %g1
	ldsw	[%l7 + %g1],	%i3
	ldsw	[%l7 + 0x2C],	%o0
	subc	%i7,	%o7,	%g6
	sra	%l6,	%g4,	%o5
	fands	%f22,	%f9,	%f1
	fnand	%f26,	%f6,	%f22
	srax	%l1,	%i1,	%l3
	movn	%icc,	%o6,	%g5
	fnot1	%f0,	%f28
	alignaddr	%g2,	%o1,	%o3
	movl	%xcc,	%g7,	%i5
	andncc	%o4,	%g3,	%l4
	std	%f18,	[%l7 + 0x68]
	array32	%i2,	%l2,	%i4
	stx	%o2,	[%l7 + 0x60]
	sdiv	%l0,	0x0300,	%i0
	add	%l5,	0x1CD7,	%g1
	sub	%i6,	%o0,	%i7
	movg	%xcc,	%o7,	%i3
	movcc	%xcc,	%g6,	%g4
	popc	0x1B0C,	%l6
	movneg	%icc,	%o5,	%l1
	array8	%i1,	%l3,	%g5
	udiv	%o6,	0x0875,	%o1
	fmovrsgz	%o3,	%f27,	%f5
	fmovsle	%icc,	%f2,	%f3
	subccc	%g7,	%g2,	%i5
	subcc	%o4,	0x0346,	%g3
	fmovdvs	%xcc,	%f7,	%f20
	smulcc	%l4,	0x19F6,	%i2
	add	%i4,	%l2,	%l0
	movrgez	%o2,	%l5,	%g1
	udivcc	%i6,	0x03FE,	%i0
	srlx	%i7,	%o7,	%i3
	lduw	[%l7 + 0x3C],	%g6
	fnor	%f10,	%f4,	%f22
	siam	0x4
	fmovrslez	%o0,	%f3,	%f17
	fpsub16	%f30,	%f20,	%f22
	movcs	%xcc,	%g4,	%o5
	andn	%l6,	%i1,	%l3
	edge32	%g5,	%o6,	%l1
	movvc	%icc,	%o1,	%g7
	alignaddrl	%o3,	%g2,	%o4
	array32	%i5,	%l4,	%i2
	andcc	%i4,	%g3,	%l2
	movg	%icc,	%o2,	%l0
	umulcc	%l5,	0x1A70,	%g1
	array32	%i0,	%i7,	%o7
	movvc	%xcc,	%i6,	%i3
	array32	%o0,	%g6,	%o5
	fmovrdlez	%l6,	%f2,	%f8
	fone	%f28
	addcc	%i1,	0x07F4,	%g4
	edge32n	%l3,	%o6,	%g5
	addc	%o1,	0x09E8,	%g7
	edge16	%o3,	%l1,	%g2
	movrgez	%i5,	0x290,	%o4
	fmovdge	%icc,	%f20,	%f27
	and	%i2,	%i4,	%g3
	movvc	%xcc,	%l2,	%o2
	and	%l4,	0x05F2,	%l0
	andn	%l5,	0x1350,	%i0
	movne	%icc,	%g1,	%i7
	umul	%i6,	%i3,	%o7
	udiv	%g6,	0x0C89,	%o0
	stw	%l6,	[%l7 + 0x78]
	andcc	%i1,	%g4,	%o5
	lduh	[%l7 + 0x7E],	%o6
	edge8n	%g5,	%o1,	%g7
	edge8n	%o3,	%l3,	%g2
	sll	%l1,	%o4,	%i2
	srax	%i5,	0x1E,	%i4
	movge	%xcc,	%l2,	%g3
	sdivcc	%l4,	0x14D2,	%l0
	alignaddr	%l5,	%o2,	%i0
	ldsb	[%l7 + 0x10],	%i7
	fmuld8ulx16	%f17,	%f3,	%f4
	sdivx	%i6,	0x01D1,	%g1
	edge16l	%o7,	%g6,	%o0
	fnot1s	%f17,	%f30
	fpackfix	%f16,	%f23
	alignaddrl	%l6,	%i3,	%g4
	umul	%o5,	%o6,	%i1
	ldsh	[%l7 + 0x52],	%o1
	movg	%xcc,	%g7,	%o3
	addccc	%l3,	0x1E73,	%g2
	alignaddrl	%l1,	%g5,	%o4
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	ld	[%l7 + 0x38],	%f19
	ldsh	[%l7 + 0x2A],	%g3
	ldub	[%l7 + 0x28],	%i4
	stw	%l0,	[%l7 + 0x20]
	edge8n	%l4,	%l5,	%i0
	edge32n	%i7,	%i6,	%g1
	fmovdpos	%xcc,	%f19,	%f22
	fcmpne16	%f12,	%f16,	%o7
	stx	%g6,	[%l7 + 0x20]
	subcc	%o2,	%o0,	%l6
	edge32	%i3,	%g4,	%o5
	edge32ln	%i1,	%o6,	%g7
	fmovrsgz	%o1,	%f19,	%f3
	mulscc	%o3,	%l3,	%l1
	fsrc1s	%f24,	%f16
	fmovsleu	%icc,	%f25,	%f14
	xorcc	%g2,	0x18FB,	%o4
	lduw	[%l7 + 0x58],	%g5
	popc	0x11EF,	%i5
	movge	%xcc,	%l2,	%g3
	edge16ln	%i4,	%i2,	%l4
	edge32ln	%l0,	%i0,	%i7
	edge16n	%l5,	%g1,	%i6
	fcmpeq16	%f18,	%f22,	%g6
	umul	%o7,	0x0D67,	%o2
	nop
	set	0x08, %o4
	stx	%l6,	[%l7 + %o4]
	array32	%o0,	%g4,	%i3
	lduh	[%l7 + 0x54],	%o5
	fmovsneg	%xcc,	%f6,	%f8
	movcs	%xcc,	%i1,	%o6
	array16	%g7,	%o1,	%l3
	sdiv	%o3,	0x09C8,	%l1
	lduw	[%l7 + 0x30],	%o4
	lduw	[%l7 + 0x44],	%g2
	stb	%g5,	[%l7 + 0x68]
	movrlz	%l2,	%i5,	%i4
	addc	%g3,	0x0316,	%l4
	movl	%icc,	%i2,	%i0
	sth	%i7,	[%l7 + 0x44]
	ldsb	[%l7 + 0x58],	%l5
	fmul8x16	%f2,	%f26,	%f24
	array8	%l0,	%i6,	%g6
	srlx	%o7,	0x08,	%g1
	addccc	%o2,	0x14F0,	%o0
	subc	%l6,	0x1BF6,	%i3
	xor	%o5,	%i1,	%g4
	stx	%g7,	[%l7 + 0x78]
	sdivx	%o1,	0x1752,	%l3
	movrgz	%o3,	%l1,	%o4
	sethi	0x1EAC,	%g2
	fsrc1s	%f1,	%f24
	edge32ln	%o6,	%l2,	%g5
	andcc	%i4,	%g3,	%i5
	fornot2s	%f14,	%f19,	%f12
	fsrc2s	%f1,	%f22
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f8
	fpack32	%f20,	%f28,	%f30
	fmovdcs	%icc,	%f6,	%f25
	xnorcc	%i2,	%i0,	%i7
	andcc	%l4,	%l5,	%i6
	fmul8x16	%f3,	%f20,	%f18
	movrlz	%g6,	%o7,	%g1
	movn	%icc,	%o2,	%o0
	and	%l6,	%i3,	%l0
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%o5
	edge8	%i1,	%g7,	%g4
	ldsb	[%l7 + 0x2F],	%o1
	edge32n	%l3,	%o3,	%o4
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%l0
	popc	%g2,	%o6
	umul	%g5,	0x073D,	%l2
	fmovdge	%icc,	%f18,	%f18
	sdivx	%g3,	0x0072,	%i5
	mova	%xcc,	%i4,	%i0
	subc	%i7,	0x0504,	%l4
	array8	%l5,	%i6,	%i2
	sll	%o7,	%g1,	%o2
	ldub	[%l7 + 0x2B],	%o0
	fexpand	%f28,	%f4
	addcc	%g6,	%l6,	%l0
	movg	%xcc,	%i3,	%o5
	fmovsge	%icc,	%f31,	%f25
	edge32	%i1,	%g4,	%g7
	umulcc	%o1,	0x1B63,	%o3
	lduh	[%l7 + 0x46],	%o4
	edge8	%l1,	%l3,	%g2
	fpadd32s	%f26,	%f24,	%f2
	edge8l	%g5,	%l2,	%g3
	ldd	[%l7 + 0x40],	%f14
	movpos	%icc,	%o6,	%i5
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%i4
	fpsub32s	%f27,	%f12,	%f29
	smulcc	%i0,	0x0655,	%l4
	edge16ln	%l5,	%i6,	%i7
	fmovsvs	%xcc,	%f10,	%f1
	std	%f10,	[%l7 + 0x08]
	orncc	%o7,	0x0922,	%i2
	andn	%g1,	%o0,	%g6
	sth	%o2,	[%l7 + 0x38]
	nop
	set	0x0C, %g7
	stb	%l0,	[%l7 + %g7]
	sub	%i3,	%o5,	%i1
	udiv	%l6,	0x14B0,	%g7
	sdivcc	%o1,	0x18F4,	%o3
	array32	%o4,	%l1,	%l3
	stb	%g2,	[%l7 + 0x5D]
	fmovsvc	%icc,	%f26,	%f24
	addccc	%g5,	0x01A9,	%g4
	fandnot1	%f18,	%f10,	%f0
	st	%f22,	[%l7 + 0x4C]
	alignaddr	%l2,	%o6,	%i5
	movrgz	%i4,	%g3,	%i0
	fcmpgt32	%f16,	%f16,	%l5
	movrne	%l4,	0x2F6,	%i7
	movrlez	%o7,	0x294,	%i2
	ldub	[%l7 + 0x4F],	%g1
	stx	%o0,	[%l7 + 0x10]
	movrne	%i6,	%o2,	%l0
	movge	%icc,	%i3,	%o5
	fabss	%f14,	%f5
	fabss	%f14,	%f13
	bshuffle	%f10,	%f6,	%f8
	and	%i1,	0x10A4,	%g6
	fornot1	%f14,	%f14,	%f20
	andcc	%l6,	%o1,	%o3
	fxors	%f23,	%f11,	%f27
	movle	%icc,	%g7,	%l1
	movl	%icc,	%l3,	%g2
	orncc	%g5,	0x13DB,	%g4
	fabsd	%f6,	%f28
	ld	[%l7 + 0x7C],	%f7
	fsrc1	%f24,	%f2
	sllx	%l2,	%o6,	%o4
	umulcc	%i4,	0x01C9,	%g3
	movpos	%icc,	%i0,	%i5
	add	%l4,	%i7,	%l5
	array32	%i2,	%g1,	%o0
	nop
	set	0x18, %i5
	std	%f10,	[%l7 + %i5]
	movvc	%xcc,	%i6,	%o2
	st	%f27,	[%l7 + 0x4C]
	movcc	%icc,	%l0,	%o7
	edge32	%i3,	%i1,	%g6
	sdivcc	%o5,	0x1B83,	%o1
	array8	%l6,	%g7,	%l1
	move	%icc,	%l3,	%g2
	sll	%o3,	0x06,	%g5
	sra	%g4,	0x06,	%o6
	fmuld8ulx16	%f20,	%f16,	%f14
	addccc	%o4,	0x0DF7,	%l2
	edge16	%g3,	%i0,	%i5
	move	%xcc,	%l4,	%i4
	movgu	%xcc,	%l5,	%i2
	save %i7, %o0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i6,	%o2,	%o7
	srl	%i3,	0x05,	%i1
	andncc	%g6,	%o5,	%o1
	edge8	%l6,	%l0,	%g7
	movrlz	%l3,	%g2,	%o3
	orncc	%g5,	0x0529,	%l1
	movneg	%icc,	%g4,	%o6
	orncc	%l2,	0x1779,	%o4
	fpsub32	%f14,	%f2,	%f0
	fornot2s	%f29,	%f30,	%f24
	mulx	%g3,	%i5,	%l4
	srl	%i4,	%l5,	%i0
	sdivx	%i2,	0x04D8,	%o0
	fpsub32	%f24,	%f10,	%f22
	fmovde	%xcc,	%f28,	%f11
	fmovsvs	%icc,	%f31,	%f3
	udiv	%i7,	0x0EE8,	%i6
	and	%o2,	0x0CA3,	%g1
	sdivx	%o7,	0x13B4,	%i1
	sllx	%g6,	0x0D,	%o5
	alignaddr	%i3,	%o1,	%l6
	smul	%g7,	0x0380,	%l3
	movgu	%icc,	%g2,	%l0
	mulscc	%o3,	%g5,	%l1
	smulcc	%g4,	0x13E6,	%l2
	movne	%icc,	%o4,	%g3
	fmovd	%f26,	%f24
	fmovdgu	%xcc,	%f12,	%f6
	andcc	%o6,	%l4,	%i4
	movpos	%icc,	%i5,	%l5
	ldsh	[%l7 + 0x0E],	%i0
	fmovdcs	%icc,	%f2,	%f8
	udivx	%i2,	0x10E0,	%o0
	fabsd	%f8,	%f22
	xnorcc	%i6,	0x1B04,	%o2
	movpos	%icc,	%g1,	%o7
	or	%i7,	0x1C23,	%i1
	andn	%g6,	%i3,	%o5
	addcc	%l6,	0x13D4,	%g7
	sdivx	%l3,	0x0DE9,	%g2
	sth	%o1,	[%l7 + 0x66]
	ldsb	[%l7 + 0x59],	%l0
	alignaddrl	%o3,	%g5,	%l1
	nop
	set	0x44, %i2
	ldsw	[%l7 + %i2],	%l2
	fmovsleu	%icc,	%f9,	%f9
	fmovdn	%icc,	%f1,	%f20
	std	%f20,	[%l7 + 0x50]
	bshuffle	%f26,	%f6,	%f22
	fmuld8sux16	%f11,	%f13,	%f12
	orncc	%g4,	%g3,	%o6
	xnor	%l4,	0x0254,	%i4
	fmovrslz	%i5,	%f21,	%f5
	sethi	0x1C45,	%o4
	ldd	[%l7 + 0x60],	%f8
	fmovdne	%icc,	%f14,	%f3
	stx	%l5,	[%l7 + 0x28]
	movgu	%icc,	%i0,	%o0
	fmul8sux16	%f8,	%f14,	%f8
	edge32	%i2,	%o2,	%i6
	udivcc	%g1,	0x1057,	%o7
	nop
	set	0x4C, %g3
	lduh	[%l7 + %g3],	%i7
	restore %g6, 0x10B2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x0E],	%o5
	stb	%l6,	[%l7 + 0x43]
	siam	0x7
	fxnor	%f0,	%f30,	%f30
	ldd	[%l7 + 0x20],	%g6
	umulcc	%l3,	0x162C,	%g2
	sllx	%o1,	%l0,	%o3
	sdivx	%i1,	0x0BB8,	%l1
	fzeros	%f25
	movge	%icc,	%l2,	%g4
	fmuld8ulx16	%f22,	%f11,	%f28
	stb	%g3,	[%l7 + 0x1F]
	movge	%icc,	%g5,	%o6
	fxors	%f5,	%f13,	%f29
	orn	%l4,	0x160B,	%i4
	srlx	%i5,	0x13,	%o4
	fmovs	%f8,	%f20
	edge8	%i0,	%o0,	%l5
	movne	%icc,	%i2,	%o2
	fmovdg	%xcc,	%f25,	%f30
	sub	%g1,	0x1B90,	%o7
	ldsh	[%l7 + 0x2A],	%i6
	movrne	%g6,	0x0FA,	%i3
	std	%f18,	[%l7 + 0x58]
	movcs	%icc,	%i7,	%l6
	std	%f2,	[%l7 + 0x28]
	movvs	%icc,	%g7,	%o5
	sdivx	%l3,	0x003E,	%g2
	smul	%l0,	%o3,	%o1
	addcc	%i1,	%l1,	%g4
	udiv	%g3,	0x0FAD,	%l2
	srax	%g5,	0x19,	%l4
	movn	%icc,	%o6,	%i5
	sllx	%o4,	%i4,	%i0
	movpos	%icc,	%l5,	%o0
	movleu	%xcc,	%o2,	%i2
	fmovda	%icc,	%f30,	%f14
	ld	[%l7 + 0x24],	%f15
	stw	%g1,	[%l7 + 0x70]
	movne	%icc,	%i6,	%o7
	and	%g6,	0x0A57,	%i7
	edge32	%l6,	%g7,	%i3
	addcc	%l3,	%o5,	%g2
	fpsub32	%f8,	%f18,	%f8
	sra	%o3,	%l0,	%o1
	sll	%l1,	%g4,	%i1
	addcc	%l2,	%g5,	%g3
	orcc	%o6,	%l4,	%o4
	fpsub16	%f8,	%f28,	%f20
	edge16ln	%i4,	%i5,	%l5
	movre	%o0,	%o2,	%i2
	fmovsge	%icc,	%f21,	%f25
	movle	%xcc,	%i0,	%g1
	xor	%i6,	0x0E31,	%g6
	stb	%o7,	[%l7 + 0x6B]
	movneg	%icc,	%i7,	%l6
	movne	%xcc,	%g7,	%l3
	std	%f30,	[%l7 + 0x48]
	fmuld8ulx16	%f10,	%f22,	%f28
	sethi	0x05DC,	%i3
	add	%g2,	0x0F45,	%o5
	movneg	%icc,	%l0,	%o1
	fcmple32	%f22,	%f26,	%l1
	edge32l	%o3,	%g4,	%l2
	fands	%f12,	%f1,	%f31
	sth	%g5,	[%l7 + 0x46]
	edge16l	%g3,	%i1,	%o6
	fmovsvc	%xcc,	%f13,	%f8
	or	%l4,	0x12D6,	%i4
	sth	%i5,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x78],	%o4
	or	%o0,	%o2,	%i2
	fmovsgu	%icc,	%f0,	%f1
	ldx	[%l7 + 0x48],	%l5
	fmovsa	%icc,	%f17,	%f13
	movn	%icc,	%g1,	%i0
	fandnot2s	%f3,	%f29,	%f5
	st	%f18,	[%l7 + 0x34]
	movn	%icc,	%i6,	%g6
	add	%i7,	%l6,	%g7
	fmovrse	%o7,	%f2,	%f6
	array16	%l3,	%g2,	%i3
	nop
	set	0x44, %i6
	ldsw	[%l7 + %i6],	%o5
	subcc	%o1,	%l0,	%l1
	edge32	%o3,	%g4,	%g5
	fexpand	%f27,	%f18
	subc	%l2,	%g3,	%o6
	fmovsle	%icc,	%f19,	%f10
	stb	%i1,	[%l7 + 0x41]
	sdivcc	%i4,	0x0536,	%l4
	movrlez	%i5,	%o0,	%o2
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	addcc	%l5,	0x04D7,	%i0
	fabss	%f2,	%f29
	addcc	%g6,	0x188C,	%i6
	movrgez	%i7,	%l6,	%o7
	fexpand	%f7,	%f4
	fnegd	%f28,	%f12
	ldd	[%l7 + 0x08],	%l2
	movcs	%xcc,	%g2,	%g7
	edge16ln	%i3,	%o5,	%o1
	fmovspos	%xcc,	%f28,	%f6
	sdiv	%l1,	0x17D9,	%l0
	movneg	%xcc,	%o3,	%g5
	movcc	%icc,	%l2,	%g4
	xnor	%g3,	%i1,	%o6
	fornot1s	%f3,	%f1,	%f11
	restore %l4, 0x18C6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o0, 0x0955, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o4,	%i2
	movrgez	%i5,	%l5,	%g1
	orn	%g6,	0x1050,	%i6
	sub	%i7,	0x195D,	%i0
	xnorcc	%l6,	%l3,	%g2
	fmovd	%f12,	%f28
	std	%f12,	[%l7 + 0x08]
	sra	%o7,	%i3,	%g7
	fcmps	%fcc0,	%f8,	%f16
	movrlz	%o5,	0x2F1,	%o1
	edge32	%l0,	%o3,	%g5
	andncc	%l2,	%l1,	%g4
	fmovsneg	%xcc,	%f21,	%f22
	fmul8sux16	%f4,	%f22,	%f10
	ld	[%l7 + 0x50],	%f20
	fornot2s	%f23,	%f12,	%f3
	fmul8sux16	%f28,	%f20,	%f16
	movge	%xcc,	%i1,	%g3
	orn	%l4,	0x1635,	%o6
	edge16	%o0,	%i4,	%o4
	alignaddr	%o2,	%i2,	%l5
	udivx	%i5,	0x03D7,	%g1
	movrlz	%i6,	%i7,	%i0
	array8	%g6,	%l3,	%l6
	movn	%icc,	%g2,	%o7
	ldub	[%l7 + 0x10],	%i3
	edge32	%o5,	%o1,	%l0
	fmovrdgz	%g7,	%f4,	%f30
	array32	%g5,	%l2,	%l1
	stw	%o3,	[%l7 + 0x6C]
	array32	%i1,	%g4,	%g3
	movleu	%xcc,	%l4,	%o0
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	orn	%i4,	%i2,	%o2
	mulscc	%l5,	0x15BF,	%i5
	movgu	%icc,	%i6,	%i7
	subc	%g1,	%i0,	%g6
	orn	%l3,	%g2,	%o7
	edge16ln	%l6,	%o5,	%o1
	movle	%icc,	%i3,	%l0
	fornot2s	%f7,	%f9,	%f3
	sdivcc	%g5,	0x15E5,	%l2
	movge	%xcc,	%l1,	%g7
	fsrc2	%f26,	%f14
	fmovsne	%xcc,	%f16,	%f17
	sth	%o3,	[%l7 + 0x3A]
	movn	%xcc,	%g4,	%g3
	edge16n	%l4,	%o0,	%i1
	movre	%o4,	%o6,	%i4
	fpadd16s	%f16,	%f3,	%f16
	alignaddr	%o2,	%i2,	%i5
	movrgz	%i6,	%l5,	%g1
	edge16ln	%i7,	%i0,	%l3
	fmovrsgez	%g6,	%f4,	%f9
	edge32	%g2,	%l6,	%o7
	movcc	%xcc,	%o5,	%o1
	movvc	%xcc,	%l0,	%i3
	and	%l2,	%l1,	%g5
	sllx	%o3,	%g7,	%g4
	fones	%f3
	sub	%l4,	%g3,	%o0
	and	%o4,	0x141F,	%o6
	edge16ln	%i4,	%i1,	%i2
	fornot2s	%f31,	%f28,	%f20
	edge32l	%o2,	%i6,	%l5
	addccc	%g1,	%i7,	%i5
	alignaddr	%i0,	%l3,	%g2
	movcc	%icc,	%g6,	%l6
	movn	%icc,	%o5,	%o7
	fmovdpos	%icc,	%f0,	%f14
	and	%l0,	%o1,	%i3
	sdivx	%l1,	0x125D,	%l2
	smul	%o3,	%g5,	%g7
	fzeros	%f25
	movrlz	%l4,	0x3D0,	%g4
	udiv	%g3,	0x0867,	%o0
	sll	%o4,	0x12,	%i4
	movvs	%xcc,	%o6,	%i2
	fmovrdgz	%i1,	%f26,	%f22
	srlx	%i6,	%l5,	%o2
	fxor	%f2,	%f10,	%f30
	srlx	%i7,	0x02,	%i5
	movleu	%icc,	%i0,	%g1
	move	%xcc,	%l3,	%g6
	orncc	%g2,	0x105E,	%l6
	orcc	%o5,	0x1699,	%l0
	umulcc	%o1,	%o7,	%l1
	xnor	%l2,	0x01EB,	%i3
	for	%f30,	%f8,	%f30
	xor	%g5,	%o3,	%g7
	srl	%l4,	0x00,	%g4
	edge16n	%o0,	%o4,	%i4
	srl	%o6,	0x13,	%g3
	sub	%i1,	%i6,	%i2
	fpack32	%f28,	%f14,	%f16
	smulcc	%o2,	%l5,	%i5
	sub	%i0,	%i7,	%l3
	fmovdleu	%xcc,	%f20,	%f1
	xorcc	%g1,	0x03B5,	%g6
	lduh	[%l7 + 0x58],	%g2
	fcmpgt16	%f2,	%f2,	%l6
	udivcc	%o5,	0x1984,	%l0
	movre	%o7,	%l1,	%o1
	mulx	%i3,	%l2,	%o3
	fsrc2s	%f12,	%f0
	alignaddr	%g5,	%l4,	%g7
	sethi	0x09B4,	%g4
	fornot1	%f26,	%f18,	%f16
	edge32n	%o4,	%o0,	%i4
	edge16	%o6,	%g3,	%i6
	edge32	%i1,	%o2,	%l5
	fsrc1	%f28,	%f12
	fzeros	%f14
	xor	%i2,	%i5,	%i0
	subcc	%i7,	%g1,	%l3
	srax	%g6,	%g2,	%l6
	fnands	%f10,	%f15,	%f7
	movgu	%xcc,	%o5,	%l0
	sra	%l1,	0x0B,	%o7
	ldsb	[%l7 + 0x3D],	%o1
	stx	%i3,	[%l7 + 0x28]
	movgu	%icc,	%o3,	%g5
	andcc	%l4,	0x10EE,	%l2
	sdiv	%g4,	0x0508,	%o4
	edge8n	%g7,	%i4,	%o0
	edge32n	%o6,	%i6,	%g3
	std	%f16,	[%l7 + 0x38]
	stx	%i1,	[%l7 + 0x28]
	subc	%l5,	0x0BED,	%o2
	sir	0x1A67
	edge16n	%i5,	%i0,	%i7
	fsrc2	%f20,	%f10
	fnor	%f2,	%f0,	%f4
	fmovsl	%icc,	%f6,	%f11
	movrne	%i2,	0x14C,	%l3
	xorcc	%g6,	%g2,	%g1
	ld	[%l7 + 0x60],	%f7
	fmovrsne	%o5,	%f0,	%f24
	fornot2s	%f8,	%f9,	%f0
	subccc	%l0,	0x023D,	%l1
	smul	%l6,	%o1,	%o7
	edge32l	%i3,	%o3,	%g5
	edge32	%l2,	%l4,	%g4
	edge16	%o4,	%i4,	%o0
	fmovsne	%xcc,	%f11,	%f20
	edge8n	%o6,	%g7,	%i6
	ldx	[%l7 + 0x20],	%g3
	ldd	[%l7 + 0x68],	%f2
	lduw	[%l7 + 0x68],	%l5
	array16	%o2,	%i5,	%i0
	movpos	%xcc,	%i1,	%i2
	movrlz	%l3,	0x28C,	%g6
	ldsh	[%l7 + 0x2E],	%g2
	fornot2s	%f26,	%f23,	%f16
	movgu	%icc,	%i7,	%g1
	sllx	%o5,	%l0,	%l1
	fnot1s	%f27,	%f3
	movrlz	%l6,	%o7,	%o1
	sllx	%i3,	0x1D,	%o3
	fsrc1	%f24,	%f22
	ldsb	[%l7 + 0x7C],	%l2
	add	%l4,	0x0776,	%g5
	andncc	%o4,	%g4,	%i4
	sll	%o6,	%o0,	%i6
	fornot1s	%f25,	%f23,	%f29
	movgu	%icc,	%g3,	%l5
	mulscc	%g7,	0x1908,	%o2
	array8	%i0,	%i1,	%i2
	ldsh	[%l7 + 0x38],	%l3
	fcmps	%fcc2,	%f6,	%f14
	stb	%i5,	[%l7 + 0x31]
	lduw	[%l7 + 0x64],	%g6
	fandnot2	%f16,	%f24,	%f6
	alignaddr	%i7,	%g1,	%o5
	movrne	%g2,	0x1BF,	%l0
	edge32l	%l6,	%o7,	%l1
	mulscc	%i3,	0x00EC,	%o1
	fpack32	%f24,	%f8,	%f26
	fnands	%f14,	%f29,	%f6
	orn	%l2,	%l4,	%o3
	movvs	%xcc,	%g5,	%o4
	fornot1s	%f0,	%f21,	%f0
	addccc	%i4,	0x123E,	%g4
	movrlz	%o0,	0x2F3,	%o6
	fpack32	%f14,	%f16,	%f24
	edge8l	%g3,	%l5,	%g7
	fxors	%f0,	%f26,	%f24
	or	%o2,	0x1A50,	%i6
	move	%xcc,	%i1,	%i0
	smulcc	%l3,	0x1328,	%i5
	edge8n	%i2,	%g6,	%g1
	fcmple32	%f28,	%f8,	%o5
	udivx	%g2,	0x1DA6,	%i7
	orncc	%l6,	%o7,	%l1
	sllx	%l0,	0x1C,	%o1
	fcmpeq32	%f6,	%f26,	%i3
	movrgez	%l4,	%l2,	%g5
	save %o4, %o3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	0x0711,	%o6
	xnorcc	%g4,	0x1DC3,	%l5
	sdiv	%g3,	0x0665,	%o2
	edge32l	%g7,	%i1,	%i6
	movrgz	%l3,	0x349,	%i0
	sub	%i5,	0x0996,	%g6
	fornot1	%f0,	%f26,	%f2
	fpadd32	%f18,	%f8,	%f20
	fmovsn	%icc,	%f26,	%f5
	movle	%xcc,	%i2,	%g1
	ldx	[%l7 + 0x48],	%g2
	xnorcc	%o5,	%l6,	%i7
	alignaddrl	%o7,	%l1,	%o1
	array8	%l0,	%i3,	%l4
	stw	%g5,	[%l7 + 0x6C]
	stb	%o4,	[%l7 + 0x50]
	fmovrsne	%o3,	%f24,	%f28
	movl	%icc,	%i4,	%o0
	movrgz	%o6,	%g4,	%l2
	sth	%l5,	[%l7 + 0x0C]
	sethi	0x1163,	%o2
	fmovsa	%icc,	%f10,	%f11
	movle	%xcc,	%g7,	%g3
	subc	%i1,	%l3,	%i6
	ldsb	[%l7 + 0x35],	%i5
	ld	[%l7 + 0x40],	%f19
	ld	[%l7 + 0x2C],	%f3
	edge16n	%i0,	%g6,	%g1
	addccc	%g2,	%o5,	%l6
	fornot2	%f20,	%f16,	%f26
	umul	%i7,	%i2,	%l1
	movne	%xcc,	%o7,	%l0
	alignaddrl	%i3,	%l4,	%o1
	fcmpeq16	%f10,	%f14,	%o4
	udivcc	%o3,	0x15AD,	%g5
	fmovdneg	%icc,	%f1,	%f25
	movcc	%xcc,	%o0,	%o6
	fpack16	%f4,	%f11
	umulcc	%i4,	%l2,	%l5
	bshuffle	%f16,	%f8,	%f22
	mulscc	%o2,	%g7,	%g4
	fmovdl	%xcc,	%f11,	%f11
	movrne	%g3,	%i1,	%l3
	movgu	%icc,	%i5,	%i6
	addccc	%g6,	%i0,	%g2
	fpadd32s	%f11,	%f12,	%f0
	subcc	%g1,	0x02C8,	%l6
	orncc	%i7,	%i2,	%l1
	smulcc	%o7,	%l0,	%i3
	movrlez	%o5,	0x087,	%o1
	fxnors	%f30,	%f23,	%f14
	sllx	%o4,	%l4,	%g5
	fmovscc	%xcc,	%f30,	%f22
	fmovsvs	%xcc,	%f18,	%f27
	fsrc2	%f20,	%f10
	edge8	%o3,	%o6,	%i4
	mulx	%l2,	0x1552,	%l5
	and	%o0,	%o2,	%g4
	fxnors	%f2,	%f20,	%f5
	edge8n	%g7,	%i1,	%g3
	udivx	%l3,	0x19EF,	%i6
	fcmpgt16	%f4,	%f24,	%g6
	orncc	%i5,	%i0,	%g1
	fcmpne16	%f12,	%f4,	%l6
	subc	%g2,	%i7,	%i2
	edge8ln	%o7,	%l1,	%l0
	movvc	%icc,	%i3,	%o5
	fmovdgu	%xcc,	%f2,	%f6
	mova	%icc,	%o4,	%o1
	movle	%xcc,	%g5,	%o3
	mova	%xcc,	%o6,	%i4
	movne	%xcc,	%l4,	%l5
	fnot2	%f22,	%f0
	sub	%o0,	0x00FF,	%l2
	edge8ln	%g4,	%g7,	%i1
	restore %g3, %l3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o2,	0x1308,	%i5
	lduh	[%l7 + 0x64],	%g6
	fnot2s	%f27,	%f8
	movle	%icc,	%i0,	%l6
	movrgz	%g2,	0x036,	%g1
	sir	0x08F3
	fornot2	%f30,	%f30,	%f2
	movne	%xcc,	%i7,	%o7
	alignaddr	%i2,	%l1,	%i3
	st	%f17,	[%l7 + 0x28]
	edge32	%o5,	%o4,	%l0
	st	%f28,	[%l7 + 0x74]
	smulcc	%g5,	0x1D09,	%o3
	add	%o6,	0x1A63,	%i4
	fmuld8ulx16	%f20,	%f22,	%f10
	edge8n	%o1,	%l5,	%l4
	fmovspos	%xcc,	%f23,	%f17
	mulscc	%l2,	0x09AD,	%g4
	sub	%g7,	%i1,	%o0
	popc	0x08B3,	%g3
	movpos	%xcc,	%l3,	%i6
	movcc	%xcc,	%i5,	%g6
	fone	%f18
	udiv	%o2,	0x0B5B,	%i0
	array8	%l6,	%g2,	%i7
	fabsd	%f2,	%f2
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	addccc	%l1,	0x0987,	%o7
	array32	%i3,	%o5,	%o4
	edge8l	%g5,	%l0,	%o6
	alignaddrl	%i4,	%o3,	%o1
	edge32	%l4,	%l5,	%l2
	ldub	[%l7 + 0x33],	%g4
	umulcc	%g7,	%o0,	%g3
	subc	%i1,	%l3,	%i5
	umulcc	%i6,	0x1622,	%o2
	movne	%xcc,	%g6,	%l6
	fpmerge	%f28,	%f11,	%f0
	addc	%i0,	0x1B3D,	%i7
	fmovspos	%xcc,	%f23,	%f0
	movvc	%xcc,	%g2,	%i2
	subccc	%g1,	0x0069,	%l1
	subccc	%o7,	%i3,	%o4
	fcmpne32	%f28,	%f18,	%g5
	lduh	[%l7 + 0x28],	%o5
	sub	%l0,	0x071D,	%o6
	movne	%xcc,	%i4,	%o3
	movrne	%o1,	0x104,	%l5
	fmovscs	%xcc,	%f13,	%f5
	sdivx	%l4,	0x1F95,	%g4
	sdivx	%g7,	0x1F99,	%l2
	xor	%g3,	0x10AC,	%i1
	restore %o0, 0x1E34, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x48],	%l3
	xorcc	%o2,	%g6,	%i6
	save %i0, 0x0FFC, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f11,	%f30,	%f14
	save %g2, 0x0442, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i2,	%g1,	%l1
	movcs	%xcc,	%i3,	%o4
	movgu	%xcc,	%g5,	%o7
	mulx	%l0,	%o5,	%o6
	fmovrsne	%o3,	%f29,	%f1
	move	%icc,	%i4,	%o1
	sir	0x141C
	orcc	%l5,	%g4,	%g7
	sth	%l4,	[%l7 + 0x1E]
	addccc	%l2,	%g3,	%i1
	addcc	%o0,	0x1B68,	%i5
	lduh	[%l7 + 0x3A],	%o2
	subc	%g6,	0x017E,	%l3
	movne	%icc,	%i0,	%i6
	lduw	[%l7 + 0x18],	%l6
	array16	%g2,	%i7,	%i2
	fcmpne16	%f2,	%f10,	%g1
	srlx	%l1,	%i3,	%o4
	ldsh	[%l7 + 0x10],	%g5
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	srl	%o6,	0x00,	%o3
	fandnot2s	%f6,	%f1,	%f13
	movcc	%xcc,	%i4,	%o5
	srl	%l5,	%o1,	%g4
	movle	%xcc,	%g7,	%l4
	array32	%l2,	%g3,	%o0
	add	%i5,	0x05C3,	%i1
	ld	[%l7 + 0x20],	%f22
	udivx	%g6,	0x0AC8,	%l3
	fsrc1	%f0,	%f24
	ldd	[%l7 + 0x38],	%i0
	xnor	%i6,	%l6,	%o2
	or	%i7,	0x031B,	%i2
	movpos	%icc,	%g1,	%g2
	movg	%icc,	%l1,	%o4
	or	%g5,	0x1C83,	%l0
	fors	%f20,	%f3,	%f18
	orn	%i3,	0x0751,	%o7
	fpadd16s	%f11,	%f3,	%f25
	sir	0x1442
	edge16ln	%o6,	%i4,	%o3
	array8	%l5,	%o5,	%g4
	movrgez	%g7,	0x27A,	%l4
	fcmple16	%f20,	%f26,	%l2
	popc	0x0A3E,	%g3
	udiv	%o0,	0x0173,	%i5
	edge32l	%o1,	%g6,	%l3
	movleu	%icc,	%i1,	%i0
	umul	%i6,	%l6,	%i7
	fmovspos	%xcc,	%f1,	%f14
	edge32l	%o2,	%g1,	%i2
	or	%l1,	0x1C84,	%o4
	orn	%g5,	0x0E7B,	%l0
	fabss	%f25,	%f2
	fmovscc	%xcc,	%f6,	%f11
	ldx	[%l7 + 0x50],	%i3
	sth	%o7,	[%l7 + 0x2E]
	edge16l	%o6,	%i4,	%g2
	edge8	%o3,	%o5,	%l5
	mova	%icc,	%g7,	%g4
	fsrc1s	%f7,	%f26
	fcmpd	%fcc1,	%f12,	%f4
	movl	%icc,	%l2,	%l4
	andn	%o0,	0x1AEF,	%g3
	sra	%i5,	0x0C,	%o1
	addc	%g6,	%l3,	%i1
	fabsd	%f12,	%f12
	fmovsvc	%xcc,	%f5,	%f17
	edge8ln	%i6,	%l6,	%i7
	fnors	%f26,	%f5,	%f31
	edge8n	%i0,	%g1,	%i2
	mulx	%l1,	%o2,	%g5
	subccc	%l0,	%o4,	%o7
	addcc	%i3,	%i4,	%o6
	sub	%g2,	%o3,	%o5
	fcmpes	%fcc3,	%f23,	%f6
	fmovdl	%xcc,	%f4,	%f0
	fornot1	%f28,	%f6,	%f0
	fmovscc	%icc,	%f1,	%f3
	stx	%g7,	[%l7 + 0x48]
	umul	%g4,	0x1AF7,	%l5
	mova	%xcc,	%l4,	%o0
	fmovse	%xcc,	%f7,	%f25
	fpsub32s	%f8,	%f1,	%f26
	mulx	%g3,	%l2,	%i5
	nop
	set	0x50, %l3
	lduh	[%l7 + %l3],	%g6
	movneg	%xcc,	%l3,	%o1
	ldsw	[%l7 + 0x10],	%i6
	edge32l	%l6,	%i7,	%i1
	fcmpne16	%f20,	%f4,	%i0
	fexpand	%f8,	%f0
	or	%g1,	0x0E7B,	%l1
	fmovrsgez	%o2,	%f10,	%f3
	addcc	%i2,	0x15E8,	%g5
	fmovrsgez	%l0,	%f31,	%f19
	fmul8x16al	%f4,	%f27,	%f28
	srax	%o4,	%o7,	%i4
	orcc	%o6,	0x0ABC,	%i3
	andn	%g2,	0x070D,	%o3
	ldsw	[%l7 + 0x68],	%o5
	lduw	[%l7 + 0x2C],	%g4
	sethi	0x0A77,	%l5
	array8	%g7,	%l4,	%g3
	udiv	%o0,	0x0A3C,	%l2
	fpmerge	%f13,	%f30,	%f4
	sethi	0x144D,	%i5
	sllx	%l3,	0x09,	%o1
	movg	%xcc,	%i6,	%l6
	fcmple16	%f22,	%f26,	%i7
	movn	%icc,	%i1,	%g6
	movrne	%g1,	0x30A,	%i0
	st	%f3,	[%l7 + 0x70]
	andcc	%o2,	%i2,	%l1
	movrne	%g5,	0x1E9,	%o4
	array32	%l0,	%i4,	%o6
	ldd	[%l7 + 0x58],	%f10
	fmovdvc	%xcc,	%f21,	%f25
	sdivx	%o7,	0x0DC8,	%g2
	ldsw	[%l7 + 0x40],	%i3
	fandnot1s	%f10,	%f5,	%f15
	fcmpes	%fcc2,	%f7,	%f25
	subcc	%o5,	0x1C77,	%g4
	movgu	%icc,	%l5,	%o3
	popc	0x1E61,	%l4
	xnorcc	%g7,	%g3,	%l2
	movrne	%i5,	%l3,	%o1
	movrgz	%i6,	0x3E0,	%o0
	lduw	[%l7 + 0x14],	%l6
	edge8	%i1,	%i7,	%g6
	fcmpne16	%f28,	%f6,	%g1
	smulcc	%o2,	%i0,	%l1
	movle	%icc,	%g5,	%o4
	sir	0x0909
	orcc	%i2,	0x1868,	%l0
	save %i4, %o7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g2,	%o5,	%i3
	edge32ln	%l5,	%o3,	%g4
	lduh	[%l7 + 0x0A],	%g7
	fone	%f6
	ldsb	[%l7 + 0x67],	%g3
	movcc	%xcc,	%l4,	%l2
	movpos	%icc,	%l3,	%i5
	movre	%i6,	0x1C9,	%o0
	fandnot2	%f26,	%f12,	%f28
	fmovsneg	%xcc,	%f16,	%f22
	fcmps	%fcc3,	%f24,	%f9
	movpos	%xcc,	%o1,	%l6
	sllx	%i1,	%i7,	%g1
	addc	%g6,	%i0,	%l1
	array8	%g5,	%o2,	%i2
	sdivx	%o4,	0x0B84,	%i4
	mulx	%o7,	%o6,	%g2
	nop
	set	0x5C, %i3
	lduw	[%l7 + %i3],	%o5
	edge16ln	%l0,	%i3,	%l5
	std	%f20,	[%l7 + 0x08]
	movcc	%icc,	%g4,	%g7
	save %g3, 0x05A2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l2,	%o3
	fornot2	%f14,	%f30,	%f30
	alignaddr	%i5,	%l3,	%o0
	smulcc	%i6,	0x0163,	%l6
	edge8n	%o1,	%i1,	%g1
	sdivx	%g6,	0x09FD,	%i0
	movvc	%icc,	%l1,	%i7
	movneg	%xcc,	%o2,	%i2
	sir	0x17AB
	movle	%icc,	%g5,	%i4
	std	%f4,	[%l7 + 0x70]
	sra	%o4,	0x0D,	%o7
	fnot2	%f2,	%f4
	fmovdleu	%xcc,	%f7,	%f17
	bshuffle	%f8,	%f16,	%f14
	udivcc	%o6,	0x1FE2,	%g2
	fmovdcc	%icc,	%f25,	%f6
	stx	%o5,	[%l7 + 0x60]
	sth	%i3,	[%l7 + 0x78]
	umulcc	%l0,	0x0B37,	%g4
	edge32ln	%g7,	%g3,	%l4
	edge8n	%l5,	%l2,	%o3
	umul	%i5,	0x0A7C,	%l3
	subc	%i6,	%l6,	%o0
	edge16l	%o1,	%i1,	%g6
	restore %i0, %l1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o2,	0x1188,	%i2
	movrlz	%g1,	0x080,	%i4
	srlx	%g5,	%o4,	%o7
	fornot1s	%f8,	%f22,	%f14
	sllx	%g2,	%o5,	%i3
	orncc	%l0,	%g4,	%g7
	sth	%g3,	[%l7 + 0x52]
	andn	%l4,	0x086E,	%o6
	ldsw	[%l7 + 0x74],	%l5
	fmovrdgez	%l2,	%f10,	%f30
	movrgez	%i5,	0x032,	%o3
	xor	%i6,	%l6,	%l3
	addccc	%o0,	0x0866,	%i1
	srax	%g6,	%o1,	%i0
	fmovrdgez	%i7,	%f26,	%f26
	sdiv	%o2,	0x0617,	%i2
	udivx	%g1,	0x1BA0,	%l1
	andcc	%g5,	%i4,	%o7
	mulscc	%g2,	%o4,	%i3
	ldub	[%l7 + 0x2A],	%o5
	fnot2	%f14,	%f8
	sir	0x1588
	edge8n	%g4,	%g7,	%g3
	fcmpne32	%f18,	%f4,	%l0
	andncc	%o6,	%l4,	%l5
	stx	%l2,	[%l7 + 0x28]
	fmovde	%xcc,	%f28,	%f11
	ldd	[%l7 + 0x38],	%f0
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	andncc	%i5,	%l6,	%o0
	movcc	%xcc,	%i1,	%g6
	sra	%l3,	0x08,	%i0
	restore %o1, 0x10E3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i2,	0x0A2,	%i7
	movg	%xcc,	%l1,	%g5
	movrgez	%i4,	%g1,	%g2
	or	%o7,	%o4,	%o5
	movcs	%icc,	%i3,	%g7
	ldsh	[%l7 + 0x3A],	%g3
	udivcc	%l0,	0x1549,	%o6
	fpmerge	%f18,	%f9,	%f24
	fmul8ulx16	%f18,	%f16,	%f0
	edge32	%l4,	%g4,	%l2
	movcs	%xcc,	%o3,	%i6
	movrlz	%l5,	0x0C8,	%i5
	fandnot1	%f20,	%f14,	%f28
	add	%o0,	0x1E82,	%i1
	smulcc	%g6,	0x1B57,	%l3
	st	%f26,	[%l7 + 0x28]
	stx	%i0,	[%l7 + 0x08]
	movne	%xcc,	%l6,	%o2
	edge16l	%o1,	%i2,	%l1
	udivx	%i7,	0x0EAD,	%i4
	movcs	%icc,	%g1,	%g5
	xorcc	%g2,	%o7,	%o4
	move	%icc,	%i3,	%o5
	array16	%g7,	%g3,	%o6
	fnot2s	%f4,	%f7
	sdivcc	%l4,	0x1DD2,	%g4
	sdivcc	%l2,	0x1BDB,	%l0
	fmul8x16	%f14,	%f24,	%f6
	array16	%i6,	%o3,	%i5
	srlx	%o0,	0x09,	%l5
	edge16l	%g6,	%l3,	%i0
	std	%f22,	[%l7 + 0x68]
	fmovsn	%xcc,	%f2,	%f21
	xnor	%l6,	0x108C,	%o2
	udiv	%i1,	0x1F92,	%o1
	fcmpgt16	%f28,	%f30,	%i2
	and	%l1,	%i7,	%g1
	fmovda	%icc,	%f17,	%f22
	andcc	%i4,	0x1125,	%g2
	xorcc	%o7,	%o4,	%i3
	xor	%g5,	%g7,	%o5
	alignaddrl	%o6,	%l4,	%g3
	movre	%g4,	0x1BD,	%l0
	or	%l2,	0x0DB6,	%i6
	orcc	%o3,	%i5,	%l5
	ldx	[%l7 + 0x60],	%g6
	orcc	%o0,	%i0,	%l3
	ldsh	[%l7 + 0x5A],	%l6
	fand	%f12,	%f18,	%f18
	pdist	%f6,	%f0,	%f6
	fcmpd	%fcc1,	%f30,	%f10
	orcc	%i1,	0x0550,	%o2
	mova	%xcc,	%i2,	%l1
	movge	%icc,	%o1,	%g1
	addcc	%i7,	%g2,	%i4
	edge16ln	%o7,	%o4,	%i3
	edge32n	%g7,	%o5,	%o6
	lduw	[%l7 + 0x10],	%g5
	fmul8x16	%f15,	%f28,	%f12
	movrne	%l4,	%g3,	%g4
	fmovsg	%xcc,	%f18,	%f22
	movvc	%icc,	%l2,	%l0
	ld	[%l7 + 0x48],	%f31
	mulx	%o3,	0x01A0,	%i5
	fcmps	%fcc1,	%f12,	%f21
	subccc	%l5,	0x13DE,	%i6
	movcc	%xcc,	%o0,	%i0
	fones	%f10
	xnorcc	%l3,	0x04D8,	%g6
	sethi	0x15D1,	%i1
	edge16n	%l6,	%o2,	%i2
	sth	%o1,	[%l7 + 0x7E]
	movcc	%xcc,	%l1,	%g1
	fmovse	%icc,	%f24,	%f14
	ldsh	[%l7 + 0x3A],	%i7
	addccc	%i4,	0x0CE6,	%o7
	movrne	%o4,	%i3,	%g7
	sllx	%g2,	%o6,	%o5
	movrlz	%g5,	%g3,	%l4
	movgu	%icc,	%g4,	%l2
	movcc	%icc,	%l0,	%o3
	fornot1	%f4,	%f8,	%f2
	orncc	%i5,	%i6,	%l5
	xnor	%o0,	0x1FAD,	%l3
	edge8l	%i0,	%g6,	%i1
	ld	[%l7 + 0x38],	%f24
	fmovsge	%xcc,	%f24,	%f9
	movvs	%icc,	%o2,	%i2
	fandnot2	%f18,	%f4,	%f4
	edge32	%o1,	%l1,	%l6
	edge32l	%g1,	%i4,	%o7
	edge16l	%o4,	%i3,	%i7
	movn	%icc,	%g7,	%o6
	fmovdcs	%icc,	%f27,	%f24
	umulcc	%g2,	%g5,	%g3
	fnegs	%f19,	%f27
	ldsb	[%l7 + 0x33],	%o5
	std	%f24,	[%l7 + 0x68]
	alignaddrl	%g4,	%l2,	%l0
	edge8n	%o3,	%l4,	%i6
	addcc	%i5,	0x1B75,	%l5
	alignaddrl	%o0,	%l3,	%i0
	subccc	%i1,	%g6,	%o2
	umul	%o1,	%i2,	%l6
	edge32l	%l1,	%g1,	%i4
	edge32	%o7,	%o4,	%i3
	movcs	%icc,	%g7,	%i7
	movleu	%xcc,	%g2,	%g5
	lduh	[%l7 + 0x42],	%g3
	udivx	%o6,	0x16CB,	%g4
	sra	%o5,	0x1C,	%l2
	array8	%o3,	%l0,	%i6
	array32	%i5,	%l4,	%l5
	fmovse	%xcc,	%f26,	%f17
	movge	%icc,	%l3,	%i0
	fzeros	%f2
	sdivx	%o0,	0x1335,	%g6
	fcmpd	%fcc3,	%f28,	%f4
	movrgez	%o2,	%o1,	%i1
	orn	%l6,	%i2,	%g1
	movrgez	%l1,	0x136,	%o7
	fcmpgt16	%f26,	%f24,	%i4
	addcc	%i3,	0x138A,	%g7
	subcc	%i7,	%o4,	%g2
	edge16	%g3,	%g5,	%o6
	save %o5, 0x1851, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x13AB,	%o3
	movrgez	%l0,	0x2B8,	%l2
	fnot2s	%f11,	%f23
	movleu	%xcc,	%i5,	%i6
	edge32	%l5,	%l4,	%i0
	movre	%o0,	%l3,	%o2
	fandnot2s	%f23,	%f8,	%f31
	smulcc	%o1,	%i1,	%g6
	edge32	%l6,	%i2,	%l1
	fpsub16s	%f17,	%f22,	%f21
	fxors	%f1,	%f3,	%f9
	edge32ln	%g1,	%i4,	%i3
	fnands	%f1,	%f18,	%f31
	fmovdle	%xcc,	%f31,	%f26
	alignaddr	%g7,	%i7,	%o4
	sub	%o7,	0x1B3C,	%g3
	movpos	%xcc,	%g2,	%g5
	edge32l	%o5,	%g4,	%o3
	fpackfix	%f24,	%f31
	movl	%xcc,	%l0,	%o6
	array8	%i5,	%l2,	%i6
	sethi	0x1D6F,	%l5
	st	%f20,	[%l7 + 0x54]
	fsrc2	%f20,	%f22
	xorcc	%i0,	0x0A7E,	%o0
	fcmped	%fcc1,	%f26,	%f18
	edge16l	%l4,	%o2,	%o1
	fmul8sux16	%f10,	%f26,	%f6
	srl	%l3,	0x09,	%i1
	orncc	%g6,	%l6,	%l1
	movl	%xcc,	%i2,	%g1
	movvc	%xcc,	%i4,	%g7
	edge16n	%i3,	%o4,	%i7
	fmovrdne	%o7,	%f30,	%f4
	addc	%g2,	%g5,	%o5
	lduh	[%l7 + 0x1C],	%g4
	mulscc	%o3,	0x01CC,	%l0
	sethi	0x07F7,	%g3
	movrne	%o6,	0x106,	%l2
	movgu	%icc,	%i6,	%l5
	movrgz	%i5,	0x05E,	%o0
	fmovrdlez	%l4,	%f30,	%f24
	sir	0x0F28
	ldsw	[%l7 + 0x30],	%o2
	andcc	%i0,	%l3,	%o1
	fand	%f0,	%f2,	%f14
	andncc	%i1,	%g6,	%l6
	fsrc1s	%f5,	%f1
	fmovscs	%xcc,	%f13,	%f25
	siam	0x0
	fzeros	%f15
	fmovdgu	%xcc,	%f13,	%f21
	udiv	%i2,	0x0A90,	%l1
	umul	%g1,	%i4,	%i3
	movcc	%icc,	%o4,	%g7
	mova	%xcc,	%o7,	%g2
	movneg	%icc,	%g5,	%i7
	addcc	%o5,	%g4,	%o3
	fornot2s	%f27,	%f9,	%f29
	sra	%g3,	0x06,	%l0
	movrne	%l2,	0x320,	%o6
	ldub	[%l7 + 0x77],	%l5
	std	%f6,	[%l7 + 0x20]
	fmovrdlez	%i6,	%f20,	%f16
	fmul8ulx16	%f0,	%f28,	%f26
	stw	%o0,	[%l7 + 0x10]
	nop
	set	0x59, %o0
	stb	%l4,	[%l7 + %o0]
	array32	%i5,	%i0,	%o2
	orcc	%l3,	0x0C93,	%i1
	andn	%g6,	0x1FC7,	%l6
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fexpand	%f28,	%f2
	edge16ln	%g1,	%i4,	%l1
	fpsub32s	%f18,	%f12,	%f22
	umul	%o4,	%g7,	%i3
	umul	%g2,	%o7,	%g5
	fmovdg	%icc,	%f17,	%f24
	movrgez	%o5,	%g4,	%o3
	fcmple32	%f4,	%f24,	%g3
	xorcc	%i7,	%l2,	%o6
	alignaddrl	%l0,	%i6,	%o0
	sdivx	%l4,	0x0887,	%i5
	fmovdneg	%xcc,	%f22,	%f3
	orcc	%i0,	%l5,	%l3
	smul	%i1,	%o2,	%g6
	movpos	%icc,	%l6,	%i2
	movrne	%o1,	%g1,	%i4
	subc	%o4,	0x1630,	%g7
	srax	%l1,	%g2,	%o7
	xor	%g5,	0x15E8,	%i3
	fpadd32	%f20,	%f6,	%f18
	srlx	%g4,	%o5,	%o3
	xorcc	%i7,	%g3,	%l2
	fmovsge	%icc,	%f20,	%f21
	edge16n	%l0,	%o6,	%o0
	nop
	set	0x6C, %l4
	stw	%l4,	[%l7 + %l4]
	subccc	%i5,	%i6,	%l5
	fmovsa	%xcc,	%f25,	%f11
	lduh	[%l7 + 0x60],	%i0
	fcmps	%fcc3,	%f23,	%f13
	array32	%i1,	%o2,	%g6
	edge8n	%l3,	%l6,	%i2
	edge8n	%o1,	%g1,	%o4
	edge32ln	%i4,	%l1,	%g2
	mova	%icc,	%g7,	%g5
	siam	0x2
	umul	%i3,	0x1926,	%g4
	array8	%o5,	%o7,	%o3
	sra	%i7,	0x1D,	%l2
	andcc	%l0,	0x1F1F,	%g3
	nop
	set	0x30, %l0
	stw	%o6,	[%l7 + %l0]
	movleu	%xcc,	%o0,	%i5
	fmovspos	%icc,	%f13,	%f28
	array32	%i6,	%l5,	%l4
	std	%f14,	[%l7 + 0x58]
	sub	%i1,	%o2,	%g6
	alignaddr	%l3,	%i0,	%l6
	fxnors	%f19,	%f19,	%f17
	orcc	%o1,	0x043A,	%i2
	array32	%o4,	%i4,	%g1
	edge8l	%g2,	%l1,	%g5
	orncc	%g7,	0x19C9,	%g4
	mulx	%o5,	0x009E,	%o7
	move	%icc,	%i3,	%o3
	ld	[%l7 + 0x70],	%f26
	ldub	[%l7 + 0x2D],	%l2
	xorcc	%i7,	%l0,	%o6
	edge32	%g3,	%i5,	%o0
	fmuld8sux16	%f21,	%f16,	%f24
	sth	%l5,	[%l7 + 0x6E]
	sdiv	%l4,	0x10CA,	%i1
	sdivcc	%i6,	0x1A93,	%g6
	stw	%o2,	[%l7 + 0x50]
	movge	%xcc,	%i0,	%l6
	fmovde	%xcc,	%f13,	%f0
	pdist	%f10,	%f12,	%f22
	movl	%xcc,	%l3,	%i2
	movl	%icc,	%o1,	%i4
	fmovdvs	%icc,	%f22,	%f29
	subcc	%g1,	0x1E3F,	%o4
	edge32ln	%g2,	%g5,	%g7
	movl	%xcc,	%l1,	%g4
	edge16n	%o7,	%i3,	%o3
	edge32n	%l2,	%i7,	%l0
	sdiv	%o5,	0x09D1,	%g3
	xnorcc	%i5,	%o0,	%o6
	fmovsg	%xcc,	%f29,	%f12
	mulx	%l4,	%i1,	%l5
	subc	%i6,	0x1720,	%o2
	fabss	%f14,	%f29
	orncc	%g6,	0x0985,	%l6
	movrlez	%i0,	0x3BD,	%i2
	fcmped	%fcc0,	%f2,	%f12
	edge32	%l3,	%o1,	%i4
	array16	%o4,	%g2,	%g1
	ldd	[%l7 + 0x40],	%g4
	fpadd16s	%f11,	%f15,	%f11
	edge32ln	%g7,	%l1,	%g4
	popc	0x01E2,	%o7
	movrgz	%i3,	0x12B,	%o3
	fpmerge	%f15,	%f22,	%f0
	bshuffle	%f20,	%f18,	%f24
	edge8ln	%i7,	%l2,	%o5
	ldd	[%l7 + 0x48],	%f24
	movcc	%icc,	%l0,	%i5
	movrlz	%o0,	%o6,	%l4
	orncc	%g3,	%i1,	%i6
	sra	%l5,	%g6,	%o2
	orcc	%l6,	%i0,	%i2
	mova	%xcc,	%l3,	%i4
	fmovsa	%xcc,	%f7,	%f28
	edge32	%o4,	%g2,	%o1
	edge32ln	%g1,	%g5,	%g7
	movne	%icc,	%l1,	%g4
	edge16	%i3,	%o3,	%i7
	movpos	%xcc,	%o7,	%l2
	movneg	%icc,	%o5,	%i5
	sra	%o0,	%o6,	%l0
	movleu	%xcc,	%g3,	%l4
	array16	%i6,	%l5,	%g6
	umulcc	%i1,	%o2,	%l6
	alignaddrl	%i0,	%i2,	%i4
	ld	[%l7 + 0x60],	%f27
	orn	%o4,	%l3,	%o1
	array16	%g2,	%g5,	%g1
	save %l1, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o3,	0x1BB2,	%i7
	subcc	%o7,	0x1EF0,	%i3
	restore %o5, 0x1C0A, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f27,	%f10,	%f10
	smul	%o0,	%o6,	%i5
	std	%f4,	[%l7 + 0x30]
	edge32	%l0,	%l4,	%i6
	movg	%xcc,	%l5,	%g6
	fmovrsgez	%i1,	%f8,	%f8
	fpsub16s	%f13,	%f9,	%f27
	fcmpes	%fcc2,	%f11,	%f1
	edge16l	%g3,	%o2,	%i0
	array32	%l6,	%i4,	%o4
	ldx	[%l7 + 0x10],	%i2
	movrlz	%l3,	0x063,	%o1
	movl	%icc,	%g5,	%g1
	movrlz	%g2,	0x173,	%g7
	fnand	%f20,	%f24,	%f30
	sdivx	%g4,	0x1118,	%l1
	nop
	set	0x20, %o1
	ldub	[%l7 + %o1],	%o3
	sub	%o7,	%i3,	%i7
	for	%f8,	%f18,	%f20
	fabss	%f26,	%f25
	srl	%o5,	%o0,	%o6
	sub	%l2,	%l0,	%i5
	movle	%icc,	%l4,	%i6
	movrne	%g6,	0x07E,	%l5
	std	%f24,	[%l7 + 0x78]
	edge32n	%i1,	%g3,	%i0
	edge8n	%l6,	%i4,	%o4
	fmovrdlez	%o2,	%f30,	%f16
	fmovdn	%xcc,	%f11,	%f15
	fpadd16s	%f27,	%f0,	%f25
	ldsw	[%l7 + 0x3C],	%l3
	edge8l	%o1,	%g5,	%i2
	or	%g2,	%g1,	%g4
	movcs	%xcc,	%g7,	%l1
	movcc	%icc,	%o3,	%i3
	movneg	%icc,	%i7,	%o5
	orn	%o0,	0x04B4,	%o6
	movre	%o7,	%l2,	%i5
	fmovrsne	%l4,	%f17,	%f29
	edge8	%l0,	%g6,	%l5
	xnor	%i1,	%i6,	%g3
	add	%l6,	0x1B2C,	%i4
	fcmpeq32	%f6,	%f24,	%o4
	orncc	%o2,	%i0,	%l3
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%g5
	srlx	%o1,	0x0F,	%i2
	alignaddrl	%g2,	%g1,	%g7
	fmovrdgz	%l1,	%f24,	%f24
	srl	%o3,	%g4,	%i7
	sllx	%i3,	%o0,	%o6
	movrlez	%o5,	%l2,	%i5
	edge16ln	%l4,	%l0,	%g6
	ldd	[%l7 + 0x30],	%f12
	edge16l	%l5,	%o7,	%i6
	orcc	%g3,	%i1,	%i4
	nop
	set	0x40, %o5
	lduh	[%l7 + %o5],	%o4
	edge32ln	%l6,	%o2,	%l3
	movneg	%xcc,	%i0,	%o1
	faligndata	%f28,	%f30,	%f2
	array32	%i2,	%g2,	%g1
	andcc	%g5,	0x0BB0,	%l1
	andncc	%g7,	%g4,	%o3
	orncc	%i7,	%i3,	%o6
	st	%f29,	[%l7 + 0x44]
	fmovsgu	%icc,	%f29,	%f12
	nop
	set	0x58, %i4
	lduh	[%l7 + %i4],	%o5
	sdiv	%o0,	0x1651,	%i5
	smulcc	%l4,	%l2,	%l0
	movg	%icc,	%l5,	%g6
	andncc	%o7,	%i6,	%i1
	edge16ln	%g3,	%o4,	%l6
	srlx	%i4,	%o2,	%l3
	fpsub16s	%f30,	%f29,	%f13
	stw	%i0,	[%l7 + 0x78]
	ldd	[%l7 + 0x48],	%o0
	fpack32	%f22,	%f6,	%f16
	orncc	%g2,	%g1,	%i2
	subccc	%g5,	0x1884,	%g7
	edge32n	%g4,	%l1,	%i7
	ldd	[%l7 + 0x68],	%i2
	xor	%o6,	0x1F6F,	%o5
	subccc	%o0,	0x01F7,	%o3
	andncc	%l4,	%l2,	%i5
	stx	%l0,	[%l7 + 0x10]
	addccc	%g6,	0x1AA8,	%l5
	orcc	%o7,	%i1,	%i6
	movneg	%icc,	%o4,	%g3
	ldsw	[%l7 + 0x48],	%l6
	fcmpeq32	%f14,	%f28,	%o2
	sll	%i4,	%i0,	%o1
	addccc	%g2,	%g1,	%i2
	fmul8x16al	%f29,	%f24,	%f22
	fpackfix	%f8,	%f15
	movle	%xcc,	%g5,	%l3
	orncc	%g7,	%g4,	%i7
	faligndata	%f30,	%f2,	%f6
	fmovdn	%xcc,	%f8,	%f22
	mulx	%l1,	0x0DD1,	%o6
	fsrc1s	%f19,	%f12
	udiv	%o5,	0x1B3F,	%o0
	ldd	[%l7 + 0x68],	%o2
	orcc	%i3,	0x1AA1,	%l2
	stb	%i5,	[%l7 + 0x69]
	alignaddrl	%l0,	%l4,	%g6
	xnorcc	%o7,	0x02FC,	%l5
	array8	%i6,	%o4,	%g3
	fnegd	%f18,	%f8
	edge32l	%l6,	%o2,	%i4
	array32	%i0,	%o1,	%i1
	movpos	%xcc,	%g1,	%g2
	std	%f2,	[%l7 + 0x08]
	nop
	set	0x41, %i1
	ldub	[%l7 + %i1],	%g5
	move	%xcc,	%l3,	%g7
	srlx	%g4,	0x04,	%i7
	edge32l	%l1,	%o6,	%i2
	fmovrsgz	%o0,	%f19,	%f2
	smulcc	%o5,	0x1040,	%i3
	movrgz	%l2,	0x2DD,	%i5
	addc	%o3,	0x0D3B,	%l4
	srax	%g6,	%o7,	%l5
	ldsb	[%l7 + 0x14],	%i6
	ldsh	[%l7 + 0x52],	%l0
	fmovrsgez	%g3,	%f7,	%f28
	fmuld8sux16	%f0,	%f8,	%f14
	add	%o4,	0x1A7D,	%l6
	subccc	%i4,	%i0,	%o1
	edge32	%o2,	%i1,	%g2
	andncc	%g5,	%l3,	%g7
	edge8l	%g1,	%i7,	%l1
	movgu	%icc,	%g4,	%i2
	movrlz	%o0,	%o6,	%o5
	array32	%i3,	%i5,	%l2
	sllx	%l4,	0x1C,	%o3
	save %g6, 0x04F2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l5,	0x05,	%l0
	srl	%g3,	%o4,	%i6
	mulx	%l6,	%i4,	%i0
	andn	%o2,	%o1,	%g2
	subccc	%i1,	0x111B,	%l3
	sethi	0x0D9B,	%g7
	orncc	%g1,	0x1A30,	%i7
	fmul8sux16	%f2,	%f10,	%f28
	popc	%g5,	%l1
	movl	%xcc,	%g4,	%i2
	ldsw	[%l7 + 0x28],	%o6
	addc	%o0,	%i3,	%o5
	movne	%icc,	%l2,	%l4
	alignaddrl	%i5,	%g6,	%o7
	fmovdcs	%icc,	%f5,	%f4
	orncc	%l5,	%o3,	%l0
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	sdivx	%i6,	0x0C69,	%i4
	save %i0, 0x1C38, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x19,	%o1
	fmovsa	%xcc,	%f7,	%f25
	ldub	[%l7 + 0x7B],	%g2
	xnor	%l3,	0x0006,	%g7
	move	%xcc,	%i1,	%i7
	fzeros	%f30
	std	%f20,	[%l7 + 0x68]
	ldsw	[%l7 + 0x58],	%g5
	smul	%g1,	%l1,	%g4
	add	%o6,	0x175F,	%i2
	umul	%i3,	0x18F8,	%o0
	sir	0x0891
	orncc	%o5,	0x17A3,	%l2
	orn	%l4,	0x1A2E,	%g6
	subc	%i5,	0x10D6,	%l5
	sdivx	%o3,	0x0C63,	%l0
	xnorcc	%o7,	%o4,	%g3
	fnors	%f21,	%f12,	%f8
	fmovrdgz	%i4,	%f2,	%f16
	movl	%icc,	%i0,	%i6
	stw	%l6,	[%l7 + 0x38]
	fmovsvs	%xcc,	%f25,	%f14
	sdivx	%o2,	0x1F60,	%g2
	edge16n	%l3,	%g7,	%o1
	movre	%i7,	0x199,	%g5
	fxors	%f4,	%f3,	%f17
	movrlz	%i1,	%l1,	%g4
	fones	%f3
	edge8	%g1,	%i2,	%o6
	array8	%o0,	%o5,	%i3
	edge32l	%l4,	%g6,	%l2
	sllx	%l5,	%i5,	%l0
	edge8	%o7,	%o4,	%g3
	st	%f11,	[%l7 + 0x54]
	sdivx	%i4,	0x1D3E,	%i0
	xnorcc	%o3,	0x0F7C,	%i6
	ldd	[%l7 + 0x38],	%f0
	addccc	%o2,	%l6,	%l3
	fmovsge	%icc,	%f6,	%f13
	movrne	%g7,	%o1,	%g2
	mova	%xcc,	%g5,	%i1
	fcmpgt32	%f26,	%f8,	%l1
	fornot2	%f8,	%f24,	%f24
	st	%f28,	[%l7 + 0x50]
	orncc	%g4,	%g1,	%i7
	ldd	[%l7 + 0x50],	%f10
	movpos	%xcc,	%o6,	%o0
	fands	%f7,	%f27,	%f27
	ldd	[%l7 + 0x18],	%f26
	stb	%i2,	[%l7 + 0x0D]
	fcmple16	%f24,	%f8,	%i3
	andcc	%o5,	0x09BE,	%l4
	xnorcc	%l2,	%l5,	%g6
	addcc	%l0,	%i5,	%o4
	xor	%g3,	0x119F,	%i4
	lduw	[%l7 + 0x40],	%i0
	xorcc	%o7,	%o3,	%i6
	udiv	%o2,	0x1557,	%l3
	xorcc	%g7,	0x1179,	%l6
	andn	%g2,	%g5,	%o1
	edge8l	%l1,	%i1,	%g1
	movvc	%xcc,	%g4,	%o6
	movge	%icc,	%o0,	%i2
	udivx	%i7,	0x0079,	%i3
	ldsb	[%l7 + 0x4D],	%o5
	fsrc2	%f14,	%f10
	sllx	%l4,	%l5,	%l2
	edge32n	%l0,	%g6,	%i5
	movpos	%xcc,	%o4,	%g3
	edge8n	%i4,	%o7,	%i0
	fmul8x16au	%f10,	%f20,	%f12
	subccc	%i6,	0x1C7F,	%o3
	smul	%o2,	%l3,	%g7
	fnot1s	%f20,	%f10
	movg	%icc,	%l6,	%g5
	fmul8x16al	%f13,	%f26,	%f20
	xnor	%g2,	%l1,	%o1
	fpsub32	%f18,	%f12,	%f4
	movvc	%xcc,	%g1,	%i1
	movrlz	%g4,	0x0BF,	%o0
	stb	%i2,	[%l7 + 0x41]
	addcc	%i7,	0x0437,	%i3
	stb	%o6,	[%l7 + 0x24]
	movge	%icc,	%o5,	%l4
	lduw	[%l7 + 0x24],	%l5
	movre	%l0,	%g6,	%l2
	lduh	[%l7 + 0x4C],	%i5
	andncc	%g3,	%o4,	%o7
	subcc	%i4,	0x18F7,	%i0
	fzero	%f8
	fabss	%f0,	%f23
	movrlez	%o3,	0x2A9,	%i6
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%o2
	udivx	%g7,	0x02BA,	%l6
	fpackfix	%f12,	%f6
	fmovrdgez	%l3,	%f30,	%f20
	mulx	%g5,	%l1,	%o1
	srax	%g2,	%g1,	%i1
	movne	%icc,	%g4,	%i2
	move	%icc,	%o0,	%i7
	edge16	%o6,	%o5,	%l4
	movn	%xcc,	%i3,	%l0
	udivx	%l5,	0x14C6,	%l2
	sll	%i5,	0x0D,	%g6
	edge16n	%o4,	%o7,	%i4
	addc	%i0,	%g3,	%o3
	ldsw	[%l7 + 0x38],	%o2
	edge16	%i6,	%l6,	%l3
	st	%f24,	[%l7 + 0x30]
	edge32n	%g5,	%g7,	%l1
	fnand	%f14,	%f18,	%f4
	stw	%g2,	[%l7 + 0x0C]
	fcmpgt16	%f26,	%f24,	%g1
	edge16n	%o1,	%i1,	%g4
	stw	%o0,	[%l7 + 0x54]
	sllx	%i7,	%o6,	%i2
	sir	0x0811
	fnands	%f27,	%f31,	%f12
	movrgez	%l4,	%i3,	%o5
	fpadd16s	%f31,	%f7,	%f6
	edge16n	%l0,	%l5,	%l2
	smulcc	%i5,	%g6,	%o4
	srax	%o7,	%i0,	%i4
	sll	%o3,	0x13,	%g3
	sllx	%i6,	%l6,	%l3
	movle	%xcc,	%o2,	%g7
	fsrc1s	%f4,	%f23
	restore %g5, %l1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o1,	%g2,	%i1
	array16	%g4,	%i7,	%o6
	sdiv	%i2,	0x11EE,	%o0
	fmuld8ulx16	%f12,	%f12,	%f20
	movl	%xcc,	%i3,	%l4
	movneg	%icc,	%o5,	%l0
	andncc	%l2,	%i5,	%g6
	edge16n	%o4,	%l5,	%o7
	udivcc	%i4,	0x044F,	%o3
	alignaddr	%g3,	%i0,	%l6
	st	%f0,	[%l7 + 0x34]
	stb	%i6,	[%l7 + 0x4E]
	movneg	%icc,	%l3,	%o2
	lduh	[%l7 + 0x30],	%g7
	edge16	%g5,	%l1,	%g1
	xnorcc	%o1,	0x0C7C,	%g2
	array8	%g4,	%i1,	%i7
	edge32ln	%i2,	%o6,	%o0
	udivcc	%l4,	0x0436,	%i3
	sdivx	%o5,	0x1F87,	%l0
	fcmpes	%fcc2,	%f25,	%f30
	ldub	[%l7 + 0x4D],	%l2
	orncc	%g6,	%i5,	%o4
	ldub	[%l7 + 0x23],	%o7
	xorcc	%i4,	%l5,	%o3
	array32	%g3,	%l6,	%i0
	subc	%i6,	0x07E7,	%o2
	srax	%g7,	%g5,	%l1
	srax	%l3,	0x13,	%g1
	fpadd32s	%f31,	%f27,	%f23
	movvc	%icc,	%o1,	%g2
	udivx	%i1,	0x17BE,	%g4
	umul	%i7,	0x107A,	%o6
	xnorcc	%o0,	%i2,	%i3
	movvs	%xcc,	%l4,	%o5
	fmovsle	%icc,	%f0,	%f7
	edge32ln	%l2,	%g6,	%l0
	lduh	[%l7 + 0x2A],	%i5
	fpack32	%f2,	%f14,	%f22
	fmovdneg	%icc,	%f31,	%f0
	movcc	%xcc,	%o7,	%i4
	fmovsn	%icc,	%f2,	%f9
	std	%f20,	[%l7 + 0x30]
	alignaddr	%l5,	%o4,	%g3
	edge8	%l6,	%o3,	%i0
	lduw	[%l7 + 0x74],	%i6
	fcmpgt32	%f14,	%f26,	%g7
	fmovdneg	%icc,	%f3,	%f2
	fornot1s	%f26,	%f4,	%f0
	xorcc	%g5,	%l1,	%o2
	fmovsleu	%icc,	%f28,	%f12
	fmovdcc	%xcc,	%f29,	%f5
	save %g1, %o1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i1,	%g4
	fnand	%f18,	%f6,	%f30
	ldx	[%l7 + 0x68],	%l3
	fcmpeq16	%f20,	%f2,	%o6
	fsrc1	%f0,	%f28
	subcc	%o0,	%i2,	%i3
	movcs	%xcc,	%i7,	%o5
	fsrc2	%f28,	%f26
	fmul8x16	%f5,	%f4,	%f16
	fnot2s	%f10,	%f14
	alignaddr	%l4,	%l2,	%g6
	umul	%i5,	0x058F,	%o7
	sllx	%l0,	0x18,	%i4
	edge16ln	%l5,	%g3,	%o4
	fornot1s	%f14,	%f17,	%f23
	sdivx	%l6,	0x0575,	%i0
	fpsub32	%f24,	%f8,	%f24
	mulx	%i6,	%g7,	%g5
	sll	%o3,	0x13,	%l1
	sth	%o2,	[%l7 + 0x2C]
	addc	%o1,	0x125A,	%g1
	faligndata	%f22,	%f26,	%f14
	movrlz	%g2,	0x30D,	%i1
	movvs	%icc,	%g4,	%l3
	andncc	%o6,	%i2,	%i3
	sll	%o0,	0x03,	%i7
	edge8n	%l4,	%o5,	%g6
	sethi	0x0442,	%i5
	xorcc	%l2,	0x1109,	%l0
	movneg	%icc,	%i4,	%l5
	movrlez	%o7,	%o4,	%l6
	andncc	%i0,	%i6,	%g7
	srl	%g3,	0x05,	%o3
	fcmps	%fcc2,	%f1,	%f25
	fmovdneg	%xcc,	%f12,	%f3
	orncc	%l1,	%g5,	%o2
	umulcc	%g1,	%o1,	%i1
	faligndata	%f18,	%f10,	%f22
	edge16n	%g4,	%g2,	%o6
	fmovda	%icc,	%f21,	%f3
	nop
	set	0x28, %o3
	lduh	[%l7 + %o3],	%l3
	fmovsa	%xcc,	%f30,	%f15
	fmul8x16au	%f7,	%f27,	%f24
	move	%icc,	%i2,	%i3
	fcmpeq16	%f14,	%f14,	%i7
	ldsw	[%l7 + 0x50],	%l4
	movrgz	%o0,	%o5,	%g6
	edge8l	%l2,	%i5,	%i4
	fmovrsgez	%l5,	%f10,	%f10
	sdiv	%o7,	0x1197,	%l0
	orncc	%l6,	%o4,	%i0
	movn	%icc,	%i6,	%g3
	stb	%g7,	[%l7 + 0x74]
	sll	%l1,	%o3,	%o2
	fcmps	%fcc0,	%f20,	%f21
	udivcc	%g1,	0x0C45,	%o1
	edge16	%g5,	%i1,	%g2
	umul	%g4,	0x1CA2,	%l3
	ldsh	[%l7 + 0x6A],	%i2
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	ldsw	[%l7 + 0x64],	%i3
	movvc	%icc,	%l4,	%o0
	srax	%g6,	0x11,	%o5
	movg	%xcc,	%i5,	%l2
	movpos	%xcc,	%l5,	%o7
	udiv	%l0,	0x133A,	%l6
	subccc	%o4,	0x1F24,	%i0
	orcc	%i6,	0x0930,	%i4
	sdivcc	%g7,	0x1F4D,	%g3
	udiv	%l1,	0x192A,	%o3
	edge16l	%g1,	%o1,	%g5
	addc	%i1,	%g2,	%g4
	srl	%l3,	%i2,	%o2
	lduh	[%l7 + 0x46],	%o6
	andcc	%i3,	0x0C59,	%i7
	sth	%o0,	[%l7 + 0x52]
	ldub	[%l7 + 0x2D],	%l4
	fnors	%f24,	%f30,	%f21
	edge32l	%g6,	%o5,	%i5
	fmovsleu	%icc,	%f3,	%f12
	udivcc	%l2,	0x0BFF,	%l5
	sdivcc	%o7,	0x17BA,	%l0
	ldsh	[%l7 + 0x7A],	%l6
	edge32ln	%i0,	%i6,	%o4
	subcc	%g7,	%g3,	%l1
	movneg	%xcc,	%i4,	%o3
	stx	%o1,	[%l7 + 0x38]
	std	%f26,	[%l7 + 0x18]
	addc	%g1,	0x080A,	%i1
	movrlez	%g2,	0x27A,	%g4
	mulx	%g5,	0x1BB6,	%l3
	fmovsleu	%xcc,	%f6,	%f26
	movleu	%xcc,	%i2,	%o2
	movvc	%icc,	%o6,	%i3
	sub	%i7,	%o0,	%l4
	fsrc2s	%f6,	%f8
	movrgz	%o5,	0x14C,	%g6
	and	%l2,	0x12E9,	%i5
	smulcc	%l5,	0x1C25,	%o7
	sir	0x19C0
	fcmped	%fcc2,	%f26,	%f14
	edge32	%l0,	%i0,	%l6
	alignaddrl	%o4,	%i6,	%g7
	and	%g3,	0x06AE,	%i4
	movne	%icc,	%l1,	%o1
	save %g1, %i1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g4,	0x0B3,	%g5
	movre	%g2,	%i2,	%o2
	smulcc	%l3,	0x0B7D,	%i3
	fpackfix	%f16,	%f25
	ldsb	[%l7 + 0x71],	%i7
	fpack16	%f22,	%f10
	fmovs	%f11,	%f25
	edge16ln	%o0,	%o6,	%o5
	fmovrdgez	%g6,	%f22,	%f2
	addc	%l4,	%l2,	%i5
	movleu	%icc,	%o7,	%l0
	for	%f14,	%f28,	%f6
	fpadd16s	%f3,	%f11,	%f27
	umulcc	%i0,	%l6,	%l5
	array8	%i6,	%g7,	%g3
	sra	%o4,	%i4,	%o1
	restore %g1, 0x12E3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o3,	0x1F61,	%g4
	movpos	%icc,	%g5,	%g2
	movne	%icc,	%i2,	%o2
	sllx	%l3,	%i1,	%i7
	edge8	%o0,	%i3,	%o5
	smul	%g6,	%l4,	%o6
	ldub	[%l7 + 0x68],	%i5
	movneg	%xcc,	%l2,	%l0
	srax	%i0,	0x1E,	%o7
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%l4
	edge16	%i6,	%g7,	%g3
	move	%icc,	%o4,	%l6
	fandnot2	%f26,	%f6,	%f14
	xnor	%o1,	%i4,	%l1
	smulcc	%g1,	%g4,	%g5
	sdivx	%o3,	0x1E08,	%i2
	movgu	%icc,	%g2,	%o2
	mulx	%l3,	%i1,	%i7
	ld	[%l7 + 0x20],	%f24
	movcc	%xcc,	%o0,	%i3
	fpadd16s	%f10,	%f5,	%f15
	ld	[%l7 + 0x24],	%f11
	ld	[%l7 + 0x5C],	%f19
	st	%f8,	[%l7 + 0x18]
	sdivx	%o5,	0x0D46,	%g6
	ldd	[%l7 + 0x28],	%l4
	stw	%o6,	[%l7 + 0x70]
	edge32l	%l2,	%l0,	%i0
	lduw	[%l7 + 0x24],	%i5
	fmuld8ulx16	%f3,	%f23,	%f20
	edge8l	%l5,	%i6,	%o7
	sir	0x0A0A
	fpadd32	%f20,	%f14,	%f14
	smulcc	%g3,	0x011A,	%o4
	ldsh	[%l7 + 0x40],	%g7
	movleu	%xcc,	%l6,	%o1
	fsrc1s	%f9,	%f10
	ldsw	[%l7 + 0x1C],	%l1
	subcc	%g1,	%g4,	%i4
	movcs	%xcc,	%g5,	%o3
	udiv	%g2,	0x019B,	%i2
	fpadd32	%f6,	%f0,	%f12
	st	%f0,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%f8
	fmovrse	%l3,	%f7,	%f7
	sir	0x0371
	xorcc	%i1,	%o2,	%i7
	movn	%xcc,	%i3,	%o5
	addccc	%g6,	0x1A99,	%o0
	movrgz	%o6,	%l2,	%l0
	movl	%icc,	%l4,	%i5
	edge8l	%i0,	%i6,	%o7
	fcmpgt32	%f4,	%f20,	%l5
	sra	%o4,	%g7,	%g3
	array16	%l6,	%l1,	%g1
	fmovrsgez	%g4,	%f14,	%f16
	sdiv	%i4,	0x0F39,	%g5
	fsrc1s	%f14,	%f20
	movrgez	%o3,	%o1,	%g2
	fmovdcs	%icc,	%f7,	%f3
	mova	%xcc,	%l3,	%i2
	fmovse	%icc,	%f23,	%f14
	fmovsg	%xcc,	%f25,	%f26
	sdivcc	%o2,	0x03BC,	%i7
	ldsw	[%l7 + 0x58],	%i3
	array8	%i1,	%o5,	%o0
	movle	%icc,	%o6,	%l2
	fmovdcc	%icc,	%f3,	%f9
	movrgz	%g6,	0x358,	%l4
	sdiv	%l0,	0x1C53,	%i0
	umul	%i6,	%i5,	%o7
	movrgez	%o4,	0x1D8,	%l5
	sdiv	%g3,	0x1164,	%l6
	fzero	%f18
	fmovrdgez	%l1,	%f2,	%f24
	srl	%g1,	%g7,	%g4
	movcc	%xcc,	%i4,	%o3
	save %g5, %g2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i2,	%o2
	movpos	%xcc,	%i7,	%i3
	edge32ln	%l3,	%o5,	%i1
	popc	0x0AB9,	%o0
	udivcc	%o6,	0x1566,	%l2
	udivcc	%l4,	0x1521,	%g6
	smulcc	%l0,	0x010D,	%i0
	edge8ln	%i5,	%o7,	%i6
	sra	%l5,	%o4,	%l6
	fornot1	%f10,	%f24,	%f26
	ldd	[%l7 + 0x28],	%l0
	movcc	%xcc,	%g1,	%g7
	smul	%g4,	0x1A0C,	%i4
	array32	%g3,	%g5,	%o3
	udivcc	%o1,	0x159A,	%g2
	nop
	set	0x5A, %l2
	sth	%o2,	[%l7 + %l2]
	fnegd	%f30,	%f22
	fmul8x16	%f9,	%f6,	%f8
	array16	%i2,	%i7,	%l3
	sth	%i3,	[%l7 + 0x0C]
	ldd	[%l7 + 0x60],	%o4
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	sethi	0x041C,	%l2
	movre	%o6,	0x244,	%g6
	andn	%l0,	%i0,	%l4
	movrne	%i5,	0x170,	%i6
	stb	%l5,	[%l7 + 0x75]
	movle	%icc,	%o7,	%o4
	edge32l	%l1,	%g1,	%g7
	edge32	%g4,	%l6,	%g3
	movrlz	%g5,	%o3,	%i4
	edge16ln	%g2,	%o1,	%i2
	stw	%o2,	[%l7 + 0x78]
	xorcc	%l3,	0x048B,	%i3
	fnot1	%f20,	%f6
	edge32n	%o5,	%i7,	%o0
	edge16ln	%l2,	%o6,	%i1
	andncc	%g6,	%l0,	%i0
	srl	%i5,	%i6,	%l5
	movrgz	%o7,	%l4,	%o4
	stw	%l1,	[%l7 + 0x3C]
	movne	%icc,	%g7,	%g1
	movge	%icc,	%g4,	%g3
	sllx	%l6,	0x15,	%o3
	fmovdge	%icc,	%f0,	%f1
	movle	%icc,	%g5,	%g2
	fmovsa	%xcc,	%f27,	%f7
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%i4
	movpos	%icc,	%i2,	%o2
	movrne	%l3,	0x1A8,	%i3
	array32	%o1,	%i7,	%o0
	sllx	%l2,	%o5,	%i1
	mulx	%o6,	%l0,	%i0
	std	%f0,	[%l7 + 0x08]
	ldd	[%l7 + 0x68],	%f24
	edge16l	%i5,	%g6,	%i6
	fnegs	%f28,	%f4
	srax	%o7,	%l5,	%l4
	fxors	%f20,	%f23,	%f9
	fmovdvs	%icc,	%f9,	%f16
	fcmpgt32	%f24,	%f28,	%o4
	srl	%l1,	0x02,	%g1
	ldsw	[%l7 + 0x08],	%g4
	fnand	%f20,	%f18,	%f16
	orncc	%g7,	%l6,	%g3
	sub	%g5,	%g2,	%i4
	srlx	%o3,	0x0C,	%i2
	fandnot1s	%f29,	%f4,	%f13
	popc	%l3,	%o2
	sth	%o1,	[%l7 + 0x5C]
	andncc	%i3,	%i7,	%o0
	fnot1	%f2,	%f14
	movneg	%xcc,	%o5,	%l2
	fpadd16	%f12,	%f4,	%f24
	ldsh	[%l7 + 0x4C],	%i1
	sdivx	%l0,	0x028C,	%o6
	addccc	%i5,	0x18DB,	%g6
	fpadd16s	%f12,	%f12,	%f9
	sll	%i0,	%i6,	%o7
	fmovdvc	%xcc,	%f11,	%f11
	subc	%l4,	%l5,	%o4
	or	%g1,	0x00D1,	%l1
	srlx	%g4,	%g7,	%g3
	array32	%g5,	%l6,	%g2
	ldsw	[%l7 + 0x1C],	%o3
	subc	%i2,	%l3,	%o2
	movrlz	%i4,	0x380,	%i3
	orncc	%i7,	0x1DE4,	%o1
	fpack32	%f22,	%f10,	%f2
	fmovdg	%xcc,	%f16,	%f27
	sdivx	%o5,	0x1352,	%l2
	lduw	[%l7 + 0x4C],	%o0
	ldd	[%l7 + 0x50],	%i0
	movcs	%xcc,	%o6,	%i5
	fpadd16	%f12,	%f26,	%f8
	ldd	[%l7 + 0x68],	%f10
	mulscc	%l0,	0x0F9B,	%g6
	movleu	%xcc,	%i0,	%o7
	sll	%i6,	0x12,	%l4
	st	%f21,	[%l7 + 0x20]
	srlx	%o4,	0x15,	%g1
	edge32n	%l5,	%g4,	%g7
	alignaddr	%l1,	%g3,	%l6
	fmovdn	%icc,	%f9,	%f3
	subcc	%g2,	%g5,	%i2
	movcs	%icc,	%o3,	%l3
	subc	%o2,	%i3,	%i7
	stw	%o1,	[%l7 + 0x70]
	fandnot2	%f4,	%f14,	%f10
	addcc	%i4,	0x1FAE,	%l2
	sdivx	%o5,	0x06E7,	%o0
	umul	%o6,	%i5,	%i1
	edge16	%l0,	%g6,	%i0
	movl	%xcc,	%i6,	%l4
	sth	%o7,	[%l7 + 0x1E]
	srax	%o4,	%g1,	%g4
	save %l5, %g7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l6,	[%l7 + 0x3C]
	fxor	%f26,	%f8,	%f16
	fexpand	%f10,	%f10
	movg	%icc,	%l1,	%g5
	xnorcc	%i2,	%o3,	%l3
	sdivx	%g2,	0x1B86,	%o2
	srlx	%i3,	%i7,	%i4
	udivcc	%o1,	0x180E,	%l2
	alignaddrl	%o5,	%o6,	%i5
	movgu	%xcc,	%i1,	%l0
	movvc	%xcc,	%g6,	%i0
	fxors	%f14,	%f3,	%f31
	fmovs	%f20,	%f14
	edge32n	%o0,	%l4,	%i6
	movvs	%icc,	%o4,	%o7
	std	%f4,	[%l7 + 0x48]
	mulx	%g1,	0x05E1,	%l5
	stw	%g4,	[%l7 + 0x48]
	fnot1s	%f20,	%f13
	sub	%g7,	0x1D4C,	%g3
	movcc	%xcc,	%l6,	%g5
	orncc	%i2,	0x187B,	%l1
	movgu	%icc,	%o3,	%l3
	xnorcc	%o2,	0x09C6,	%g2
	movleu	%icc,	%i3,	%i4
	and	%o1,	0x1BA1,	%l2
	orcc	%o5,	%i7,	%i5
	lduh	[%l7 + 0x54],	%o6
	andcc	%l0,	%g6,	%i1
	fnors	%f18,	%f18,	%f27
	array8	%o0,	%l4,	%i6
	sth	%o4,	[%l7 + 0x50]
	orcc	%o7,	%g1,	%i0
	movn	%icc,	%l5,	%g4
	popc	0x09EC,	%g3
	umul	%l6,	%g7,	%i2
	or	%l1,	0x08E4,	%g5
	pdist	%f14,	%f14,	%f10
	or	%o3,	0x0823,	%l3
	movvs	%icc,	%o2,	%g2
	fmovsn	%xcc,	%f26,	%f20
	udivcc	%i4,	0x01B8,	%i3
	fcmped	%fcc0,	%f10,	%f6
	ldub	[%l7 + 0x51],	%o1
	fmul8ulx16	%f6,	%f30,	%f8
	edge16n	%o5,	%l2,	%i5
	fcmpeq32	%f4,	%f14,	%o6
	udiv	%i7,	0x145F,	%g6
	lduw	[%l7 + 0x0C],	%i1
	add	%o0,	0x17AF,	%l0
	subc	%i6,	0x1543,	%l4
	edge8	%o4,	%o7,	%g1
	movn	%xcc,	%l5,	%i0
	bshuffle	%f4,	%f2,	%f2
	lduw	[%l7 + 0x50],	%g3
	smulcc	%l6,	%g4,	%g7
	std	%f22,	[%l7 + 0x50]
	srlx	%i2,	0x1B,	%l1
	ld	[%l7 + 0x7C],	%f15
	fmovs	%f2,	%f6
	fmul8sux16	%f2,	%f6,	%f8
	ldsw	[%l7 + 0x24],	%o3
	smul	%l3,	0x18C3,	%o2
	sll	%g5,	%g2,	%i4
	move	%icc,	%o1,	%i3
	std	%f6,	[%l7 + 0x28]
	andncc	%l2,	%o5,	%o6
	edge32ln	%i7,	%i5,	%i1
	srlx	%o0,	0x0E,	%l0
	ldsw	[%l7 + 0x7C],	%i6
	std	%f12,	[%l7 + 0x18]
	restore %g6, %o4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g1,	%o7,	%i0
	ldx	[%l7 + 0x18],	%g3
	and	%l5,	0x025D,	%l6
	fmovsne	%icc,	%f0,	%f10
	movleu	%xcc,	%g4,	%i2
	popc	%g7,	%o3
	movrgz	%l1,	0x133,	%l3
	st	%f26,	[%l7 + 0x48]
	sethi	0x13BB,	%g5
	mova	%xcc,	%o2,	%g2
	fnors	%f8,	%f8,	%f6
	edge32	%i4,	%i3,	%o1
	movre	%o5,	0x33A,	%l2
	movge	%icc,	%o6,	%i7
	ld	[%l7 + 0x68],	%f6
	sth	%i1,	[%l7 + 0x18]
	ldd	[%l7 + 0x38],	%f12
	orcc	%o0,	%l0,	%i5
	addcc	%g6,	0x0639,	%i6
	mulscc	%o4,	%g1,	%o7
	array16	%i0,	%l4,	%g3
	alignaddr	%l6,	%l5,	%g4
	subc	%g7,	0x181D,	%o3
	movcs	%xcc,	%i2,	%l1
	fone	%f6
	movrlez	%l3,	%o2,	%g5
	add	%g2,	0x13A7,	%i4
	stb	%i3,	[%l7 + 0x5D]
	orn	%o5,	%o1,	%l2
	fors	%f12,	%f12,	%f24
	fzero	%f8
	fmovsg	%icc,	%f20,	%f17
	lduw	[%l7 + 0x40],	%o6
	movrne	%i7,	%i1,	%l0
	fmovrslz	%o0,	%f19,	%f19
	array32	%i5,	%g6,	%o4
	ld	[%l7 + 0x34],	%f16
	movgu	%xcc,	%i6,	%o7
	mulx	%i0,	%l4,	%g1
	subcc	%l6,	0x1259,	%l5
	ldx	[%l7 + 0x28],	%g3
	subccc	%g7,	%g4,	%o3
	subccc	%i2,	0x1F11,	%l1
	udiv	%o2,	0x1879,	%l3
	fmovsg	%xcc,	%f27,	%f7
	lduh	[%l7 + 0x24],	%g5
	movge	%xcc,	%g2,	%i3
	sethi	0x0D67,	%o5
	ldx	[%l7 + 0x38],	%i4
	movcs	%xcc,	%l2,	%o1
	xorcc	%i7,	%i1,	%o6
	edge32ln	%l0,	%i5,	%o0
	addc	%o4,	%i6,	%g6
	umulcc	%o7,	%i0,	%g1
	st	%f12,	[%l7 + 0x24]
	stw	%l6,	[%l7 + 0x78]
	edge16l	%l4,	%g3,	%l5
	edge8n	%g4,	%g7,	%o3
	add	%i2,	%o2,	%l3
	save %l1, %g2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o5,	%i3,	%l2
	fmovrdgez	%o1,	%f12,	%f2
	stb	%i4,	[%l7 + 0x5E]
	sethi	0x106F,	%i1
	edge8ln	%i7,	%o6,	%l0
	fmovrslz	%i5,	%f12,	%f19
	ldd	[%l7 + 0x50],	%f2
	alignaddr	%o0,	%o4,	%i6
	fnot2s	%f31,	%f4
	fpack16	%f16,	%f16
	fmovrslz	%o7,	%f24,	%f10
	addccc	%i0,	0x11AB,	%g6
	sub	%l6,	0x0CC0,	%l4
	fexpand	%f1,	%f30
	edge32n	%g1,	%g3,	%g4
	movge	%icc,	%g7,	%o3
	umul	%l5,	0x1A17,	%i2
	fmovrse	%o2,	%f23,	%f31
	edge32l	%l3,	%l1,	%g5
	fmovsvs	%icc,	%f14,	%f29
	fsrc2	%f8,	%f16
	udiv	%o5,	0x0815,	%i3
	fcmps	%fcc3,	%f5,	%f16
	smul	%g2,	%o1,	%i4
	stw	%i1,	[%l7 + 0x60]
	move	%xcc,	%l2,	%o6
	srlx	%l0,	%i5,	%i7
	movle	%icc,	%o4,	%i6
	fmul8ulx16	%f4,	%f16,	%f16
	srl	%o7,	0x19,	%o0
	fmovsneg	%icc,	%f17,	%f15
	sir	0x0AC5
	mulscc	%i0,	0x16DF,	%l6
	movn	%icc,	%g6,	%l4
	subccc	%g3,	0x1579,	%g1
	movrne	%g4,	0x2E9,	%g7
	edge8n	%l5,	%o3,	%o2
	for	%f20,	%f18,	%f10
	udivx	%i2,	0x13F2,	%l1
	movvs	%xcc,	%g5,	%l3
	add	%i3,	0x1125,	%o5
	fmovsge	%icc,	%f17,	%f17
	sll	%o1,	0x1A,	%i4
	ldsw	[%l7 + 0x1C],	%g2
	movn	%icc,	%l2,	%o6
	ldsw	[%l7 + 0x44],	%l0
	movn	%xcc,	%i1,	%i7
	fpackfix	%f16,	%f6
	save %o4, 0x053E, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o7,	%i6,	%i0
	ldd	[%l7 + 0x70],	%f10
	andncc	%l6,	%g6,	%o0
	fmovdpos	%icc,	%f29,	%f26
	movge	%icc,	%l4,	%g1
	mova	%xcc,	%g4,	%g7
	movvs	%xcc,	%g3,	%o3
	fnot1s	%f13,	%f28
	srax	%l5,	0x01,	%o2
	fpadd16s	%f7,	%f24,	%f3
	addcc	%l1,	%i2,	%g5
	movrgz	%i3,	%o5,	%o1
	movre	%l3,	0x004,	%i4
	ldsh	[%l7 + 0x74],	%g2
	ldsw	[%l7 + 0x78],	%o6
	udivx	%l2,	0x1C21,	%i1
	ld	[%l7 + 0x74],	%f7
	array8	%i7,	%l0,	%i5
	movleu	%icc,	%o7,	%i6
	mulx	%o4,	%l6,	%i0
	edge16	%g6,	%o0,	%l4
	movgu	%icc,	%g1,	%g4
	fmovdvs	%xcc,	%f5,	%f23
	sra	%g3,	0x11,	%o3
	smulcc	%l5,	0x0011,	%g7
	srl	%l1,	0x17,	%i2
	edge32	%o2,	%g5,	%i3
	st	%f0,	[%l7 + 0x2C]
	fcmpeq32	%f30,	%f18,	%o5
	fcmpne32	%f22,	%f8,	%l3
	movle	%xcc,	%o1,	%i4
	sra	%g2,	0x1C,	%o6
	movge	%icc,	%i1,	%i7
	ldsh	[%l7 + 0x42],	%l2
	movrgez	%l0,	0x302,	%o7
	edge32l	%i6,	%i5,	%o4
	add	%l6,	0x145F,	%g6
	xnorcc	%i0,	%o0,	%g1
	fcmple32	%f22,	%f6,	%l4
	orn	%g4,	%o3,	%g3
	or	%g7,	%l5,	%i2
	mova	%icc,	%o2,	%g5
	sub	%i3,	%l1,	%o5
	movcs	%xcc,	%o1,	%l3
	fornot2	%f8,	%f0,	%f12
	fmovrde	%i4,	%f8,	%f4
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	fpack16	%f30,	%f2
	xorcc	%g2,	0x1FF6,	%l2
	edge8	%l0,	%i6,	%i5
	movrgez	%o4,	0x20E,	%l6
	movcs	%icc,	%g6,	%i0
	smul	%o7,	%g1,	%l4
	for	%f24,	%f30,	%f20
	fcmpgt32	%f26,	%f20,	%g4
	fmovdge	%xcc,	%f6,	%f14
	sllx	%o3,	%o0,	%g7
	addcc	%l5,	0x0822,	%i2
	nop
	set	0x5E, %l5
	sth	%o2,	[%l7 + %l5]
	fmul8sux16	%f22,	%f4,	%f30
	save %g5, %i3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x0C],	%l1
	fmovrdgz	%o1,	%f30,	%f28
	sdivx	%l3,	0x0356,	%i4
	udivx	%o5,	0x0A05,	%o6
	restore %i7, 0x082B, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l2,	0x2B3,	%l0
	movn	%xcc,	%i6,	%i1
	fpackfix	%f14,	%f0
	mulx	%o4,	%l6,	%i5
	edge32ln	%i0,	%o7,	%g6
	sub	%l4,	%g1,	%g4
	fnors	%f23,	%f16,	%f23
	ldx	[%l7 + 0x18],	%o0
	movneg	%icc,	%g7,	%l5
	edge8ln	%i2,	%o3,	%g5
	edge8ln	%o2,	%i3,	%g3
	movpos	%icc,	%l1,	%o1
	sll	%l3,	%i4,	%o5
	lduw	[%l7 + 0x18],	%i7
	fmovse	%icc,	%f20,	%f10
	ldub	[%l7 + 0x13],	%o6
	or	%g2,	%l0,	%i6
	or	%i1,	%o4,	%l2
	edge8ln	%i5,	%i0,	%o7
	movcs	%xcc,	%l6,	%g6
	umulcc	%g1,	0x1648,	%l4
	sethi	0x0569,	%o0
	fmovsvs	%icc,	%f20,	%f0
	ldd	[%l7 + 0x20],	%g4
	sir	0x1F88
	xor	%g7,	%i2,	%l5
	edge32n	%o3,	%o2,	%g5
	fnegd	%f24,	%f16
	alignaddr	%i3,	%l1,	%g3
	umul	%o1,	%i4,	%l3
	movl	%icc,	%o5,	%o6
	fmul8x16	%f24,	%f18,	%f28
	movle	%xcc,	%g2,	%l0
	fnegd	%f12,	%f26
	fnor	%f14,	%f28,	%f28
	sdivcc	%i6,	0x0655,	%i7
	fmovse	%icc,	%f4,	%f3
	sth	%i1,	[%l7 + 0x1C]
	mova	%icc,	%o4,	%i5
	ldx	[%l7 + 0x28],	%l2
	movrlez	%o7,	0x18C,	%i0
	orncc	%g6,	%l6,	%l4
	movpos	%icc,	%g1,	%g4
	movrgez	%o0,	0x3DB,	%g7
	sdivx	%l5,	0x0642,	%o3
	fnands	%f5,	%f19,	%f0
	ldsh	[%l7 + 0x68],	%o2
	nop
	set	0x40, %g5
	stw	%i2,	[%l7 + %g5]
	mulx	%g5,	%i3,	%g3
	popc	%o1,	%l1
	edge8l	%l3,	%i4,	%o6
	edge32ln	%g2,	%l0,	%o5
	ldd	[%l7 + 0x70],	%i6
	popc	%i6,	%o4
	movl	%xcc,	%i5,	%l2
	movcs	%icc,	%o7,	%i1
	fcmpne32	%f28,	%f28,	%g6
	movrgez	%i0,	%l6,	%l4
	or	%g4,	0x0A63,	%g1
	bshuffle	%f2,	%f12,	%f16
	fcmpgt16	%f0,	%f20,	%g7
	edge16l	%o0,	%o3,	%l5
	sdivx	%o2,	0x04E9,	%g5
	array32	%i2,	%i3,	%g3
	edge16	%o1,	%l3,	%l1
	fmovdg	%xcc,	%f31,	%f4
	addc	%o6,	%i4,	%g2
	nop
	set	0x6B, %i0
	ldub	[%l7 + %i0],	%l0
	udiv	%o5,	0x1302,	%i6
	fmovsleu	%xcc,	%f1,	%f9
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	ldsw	[%l7 + 0x24],	%o7
	alignaddrl	%i1,	%o4,	%i0
	fsrc1	%f0,	%f6
	movl	%xcc,	%l6,	%g6
	movrne	%g4,	0x366,	%l4
	movge	%icc,	%g7,	%g1
	sth	%o0,	[%l7 + 0x72]
	fcmped	%fcc1,	%f14,	%f2
	xnor	%l5,	%o3,	%g5
	andncc	%i2,	%o2,	%g3
	ld	[%l7 + 0x70],	%f29
	subcc	%i3,	%o1,	%l1
	mova	%xcc,	%o6,	%i4
	movleu	%icc,	%g2,	%l0
	nop
	set	0x6E, %g1
	lduh	[%l7 + %g1],	%o5
	sll	%l3,	%i7,	%i5
	array32	%l2,	%o7,	%i1
	sll	%o4,	%i6,	%i0
	mova	%icc,	%l6,	%g6
	edge32	%g4,	%l4,	%g7
	movre	%g1,	0x26D,	%o0
	mulscc	%o3,	0x1FDA,	%l5
	edge8n	%g5,	%o2,	%i2
	sdivcc	%g3,	0x1644,	%i3
	edge32	%o1,	%l1,	%i4
	subccc	%o6,	%l0,	%g2
	bshuffle	%f14,	%f24,	%f2
	edge8n	%o5,	%i7,	%i5
	movleu	%icc,	%l2,	%o7
	popc	0x15FB,	%i1
	movcs	%xcc,	%o4,	%i6
	edge16l	%l3,	%i0,	%g6
	ldx	[%l7 + 0x20],	%g4
	nop
	set	0x14, %o4
	ldsw	[%l7 + %o4],	%l6
	edge32	%g7,	%g1,	%l4
	movn	%icc,	%o0,	%l5
	alignaddrl	%g5,	%o3,	%i2
	fsrc1	%f8,	%f20
	edge16n	%o2,	%g3,	%i3
	fors	%f16,	%f25,	%f11
	stw	%l1,	[%l7 + 0x50]
	move	%xcc,	%i4,	%o6
	array8	%l0,	%g2,	%o1
	ldx	[%l7 + 0x20],	%o5
	addc	%i5,	0x1F7C,	%i7
	pdist	%f20,	%f2,	%f28
	addcc	%o7,	%i1,	%l2
	andncc	%o4,	%l3,	%i6
	edge8n	%i0,	%g6,	%l6
	nop
	set	0x56, %i7
	lduh	[%l7 + %i7],	%g4
	fnot2s	%f11,	%f17
	sdiv	%g1,	0x1602,	%l4
	movl	%xcc,	%o0,	%g7
	movvs	%icc,	%l5,	%o3
	ldd	[%l7 + 0x38],	%f6
	sdiv	%i2,	0x1BD3,	%g5
	umul	%o2,	%g3,	%l1
	subcc	%i4,	%i3,	%o6
	fmovdl	%icc,	%f9,	%f1
	fcmpne32	%f30,	%f22,	%g2
	addccc	%l0,	%o5,	%i5
	fmovsge	%xcc,	%f13,	%f16
	fmovsneg	%xcc,	%f16,	%f22
	array32	%o1,	%o7,	%i7
	fpackfix	%f0,	%f30
	edge32l	%l2,	%o4,	%l3
	fcmpes	%fcc1,	%f23,	%f22
	fcmpeq32	%f2,	%f26,	%i6
	fabss	%f4,	%f20
	fpadd16	%f28,	%f18,	%f30
	lduw	[%l7 + 0x20],	%i1
	bshuffle	%f10,	%f2,	%f12
	sdivcc	%i0,	0x0CCE,	%l6
	ldub	[%l7 + 0x2A],	%g4
	mova	%xcc,	%g1,	%l4
	fsrc2	%f20,	%f20
	and	%o0,	0x18A1,	%g6
	stb	%g7,	[%l7 + 0x0D]
	edge32ln	%l5,	%o3,	%g5
	edge8	%i2,	%o2,	%l1
	xorcc	%g3,	0x1B06,	%i3
	edge32l	%o6,	%i4,	%g2
	stw	%l0,	[%l7 + 0x14]
	st	%f10,	[%l7 + 0x14]
	sethi	0x0868,	%o5
	fmovdvs	%xcc,	%f8,	%f8
	addcc	%o1,	0x157B,	%i5
	smul	%o7,	0x0C9C,	%i7
	movge	%xcc,	%o4,	%l3
	movrne	%l2,	%i1,	%i0
	array32	%l6,	%g4,	%g1
	nop
	set	0x65, %o6
	ldub	[%l7 + %o6],	%l4
	fmovsle	%icc,	%f20,	%f6
	movneg	%xcc,	%i6,	%o0
	umul	%g6,	%g7,	%l5
	ldd	[%l7 + 0x18],	%f2
	movrgez	%g5,	%o3,	%i2
	addcc	%o2,	%g3,	%i3
	addccc	%o6,	0x1B75,	%i4
	movneg	%icc,	%g2,	%l1
	array32	%l0,	%o5,	%o1
	sdivx	%o7,	0x15FD,	%i5
	move	%icc,	%i7,	%o4
	orn	%l3,	0x174C,	%l2
	movle	%xcc,	%i1,	%i0
	addc	%l6,	0x110D,	%g4
	orcc	%l4,	0x1AEA,	%i6
	movcs	%icc,	%g1,	%o0
	fmovde	%icc,	%f29,	%f30
	fmovscc	%xcc,	%f29,	%f23
	umul	%g6,	%g7,	%l5
	ldub	[%l7 + 0x0B],	%g5
	edge32ln	%i2,	%o2,	%o3
	array16	%g3,	%o6,	%i3
	movvs	%icc,	%i4,	%l1
	xnor	%g2,	0x069D,	%l0
	edge16l	%o1,	%o5,	%i5
	fone	%f4
	ldub	[%l7 + 0x5E],	%o7
	fmovde	%xcc,	%f7,	%f26
	movneg	%xcc,	%i7,	%l3
	movgu	%icc,	%l2,	%o4
	mulx	%i0,	0x100B,	%l6
	mova	%icc,	%g4,	%i1
	smul	%i6,	%g1,	%l4
	alignaddrl	%g6,	%o0,	%l5
	orncc	%g5,	%i2,	%o2
	fmovdgu	%icc,	%f31,	%f1
	movrlz	%o3,	0x32B,	%g7
	edge32l	%o6,	%i3,	%g3
	srax	%l1,	%g2,	%i4
	for	%f2,	%f18,	%f18
	movg	%icc,	%o1,	%o5
	fornot2s	%f18,	%f31,	%f14
	movvc	%xcc,	%l0,	%o7
	edge8	%i7,	%l3,	%i5
	sth	%o4,	[%l7 + 0x1A]
	fpsub32s	%f14,	%f21,	%f26
	or	%l2,	%l6,	%i0
	move	%icc,	%g4,	%i6
	edge16n	%g1,	%l4,	%i1
	orncc	%o0,	0x098C,	%g6
	array16	%l5,	%i2,	%o2
	srl	%g5,	%g7,	%o6
	fcmpeq16	%f10,	%f4,	%i3
	stb	%o3,	[%l7 + 0x18]
	fnegs	%f14,	%f7
	sra	%g3,	%l1,	%g2
	movgu	%xcc,	%i4,	%o1
	sub	%l0,	0x0A24,	%o7
	movn	%icc,	%o5,	%i7
	movle	%icc,	%l3,	%o4
	ldub	[%l7 + 0x32],	%l2
	edge16n	%l6,	%i0,	%g4
	alignaddrl	%i5,	%g1,	%l4
	andcc	%i1,	0x0697,	%o0
	sra	%i6,	0x06,	%g6
	sdivx	%i2,	0x084D,	%o2
	std	%f20,	[%l7 + 0x70]
	addcc	%g5,	%g7,	%l5
	subc	%o6,	%o3,	%g3
	fmovsge	%icc,	%f22,	%f5
	fmovrsgz	%i3,	%f4,	%f20
	ldsb	[%l7 + 0x0B],	%g2
	mulscc	%i4,	0x1390,	%o1
	array8	%l1,	%o7,	%o5
	fmovsne	%xcc,	%f25,	%f30
	fandnot2	%f12,	%f10,	%f10
	or	%i7,	0x1341,	%l3
	fmovdn	%xcc,	%f26,	%f23
	edge32n	%o4,	%l2,	%l0
	and	%l6,	%i0,	%g4
	alignaddr	%i5,	%l4,	%i1
	movn	%xcc,	%g1,	%i6
	orn	%o0,	0x015D,	%g6
	fsrc1	%f30,	%f24
	or	%i2,	%g5,	%o2
	umulcc	%g7,	%o6,	%o3
	movvc	%icc,	%l5,	%i3
	fpmerge	%f21,	%f11,	%f22
	xnor	%g2,	%g3,	%o1
	fexpand	%f7,	%f0
	fzero	%f16
	fmovrse	%i4,	%f11,	%f9
	fmovd	%f18,	%f20
	fcmpgt32	%f28,	%f30,	%o7
	orn	%o5,	0x171C,	%i7
	fcmple32	%f18,	%f22,	%l3
	movgu	%icc,	%l1,	%o4
	sub	%l2,	0x02F6,	%l6
	edge16n	%i0,	%g4,	%l0
	movvs	%icc,	%l4,	%i5
	std	%f0,	[%l7 + 0x60]
	edge32l	%g1,	%i6,	%i1
	orncc	%g6,	%o0,	%g5
	orcc	%i2,	%o2,	%g7
	ldx	[%l7 + 0x58],	%o6
	popc	%l5,	%o3
	ldd	[%l7 + 0x48],	%i2
	stw	%g2,	[%l7 + 0x3C]
	srlx	%o1,	%g3,	%o7
	stb	%o5,	[%l7 + 0x38]
	fmovrdlez	%i7,	%f24,	%f28
	move	%xcc,	%l3,	%i4
	udivcc	%l1,	0x07FD,	%l2
	alignaddr	%l6,	%o4,	%g4
	edge8l	%i0,	%l0,	%l4
	edge16ln	%g1,	%i5,	%i6
	sir	0x0A9F
	lduw	[%l7 + 0x10],	%i1
	ldsw	[%l7 + 0x44],	%o0
	fnot2s	%f31,	%f18
	fmovsge	%icc,	%f31,	%f16
	fpackfix	%f30,	%f24
	ldd	[%l7 + 0x08],	%g6
	save %i2, 0x0973, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f24,	%f2,	%o2
	movn	%xcc,	%o6,	%g7
	edge16n	%l5,	%i3,	%o3
	array8	%o1,	%g2,	%o7
	movleu	%xcc,	%g3,	%o5
	fmovdcs	%icc,	%f15,	%f11
	srl	%i7,	0x0A,	%l3
	or	%i4,	%l2,	%l1
	movle	%icc,	%o4,	%l6
	edge16ln	%g4,	%l0,	%i0
	add	%g1,	0x1871,	%i5
	fmovrdlez	%l4,	%f6,	%f12
	fandnot1	%f18,	%f20,	%f28
	array32	%i6,	%i1,	%o0
	edge8ln	%g6,	%g5,	%i2
	edge16	%o6,	%o2,	%g7
	alignaddrl	%i3,	%o3,	%o1
	smulcc	%g2,	%o7,	%g3
	and	%o5,	%i7,	%l5
	popc	0x0BB0,	%i4
	fzero	%f16
	mova	%xcc,	%l2,	%l3
	edge32	%o4,	%l6,	%g4
	restore %l0, 0x0B2B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i0,	%i5,	%l4
	orn	%i6,	0x04B4,	%i1
	sdiv	%g1,	0x08B9,	%o0
	fornot1	%f24,	%f10,	%f28
	subcc	%g6,	%i2,	%g5
	smul	%o6,	0x1448,	%g7
	mova	%icc,	%o2,	%i3
	addcc	%o1,	0x047F,	%g2
	lduw	[%l7 + 0x20],	%o7
	movne	%xcc,	%o3,	%g3
	movl	%icc,	%i7,	%l5
	movrlz	%o5,	%l2,	%l3
	fmovrsgz	%o4,	%f25,	%f17
	edge32	%i4,	%l6,	%l0
	movrlez	%l1,	0x17D,	%i0
	movne	%icc,	%i5,	%g4
	movleu	%xcc,	%l4,	%i1
	andn	%i6,	0x1CCB,	%g1
	sethi	0x1B40,	%g6
	sdivcc	%o0,	0x13D6,	%i2
	andcc	%g5,	0x01A6,	%g7
	fmovdvs	%icc,	%f5,	%f7
	fnot2s	%f7,	%f14
	subccc	%o6,	0x0DA5,	%i3
	srax	%o1,	%g2,	%o2
	movrlz	%o3,	%o7,	%i7
	or	%l5,	0x0E7B,	%g3
	nop
	set	0x10, %g4
	ldsh	[%l7 + %g4],	%l2
	edge32	%l3,	%o4,	%i4
	movleu	%xcc,	%o5,	%l0
	movrlez	%l1,	0x253,	%i0
	movne	%xcc,	%l6,	%g4
	movleu	%icc,	%i5,	%l4
	fnot1s	%f14,	%f28
	sdivcc	%i6,	0x02DE,	%g1
	mova	%xcc,	%g6,	%o0
	move	%xcc,	%i1,	%g5
	movrne	%g7,	%o6,	%i3
	andncc	%o1,	%i2,	%o2
	array16	%g2,	%o3,	%i7
	movrgz	%o7,	%l5,	%l2
	sll	%g3,	0x11,	%l3
	udiv	%i4,	0x002E,	%o4
	umulcc	%o5,	%l0,	%i0
	fpackfix	%f2,	%f8
	mulx	%l6,	%l1,	%g4
	edge16	%l4,	%i5,	%g1
	orn	%i6,	%o0,	%i1
	edge32n	%g5,	%g7,	%o6
	std	%f30,	[%l7 + 0x68]
	fmovscs	%xcc,	%f8,	%f22
	xorcc	%g6,	0x0FB2,	%o1
	stx	%i2,	[%l7 + 0x60]
	array16	%i3,	%g2,	%o2
	smulcc	%i7,	%o3,	%l5
	save %o7, 0x01FA, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l2,	0x0E4,	%i4
	edge8	%l3,	%o4,	%o5
	stw	%l0,	[%l7 + 0x28]
	sdiv	%i0,	0x0122,	%l1
	fmovrdgez	%l6,	%f14,	%f18
	srlx	%g4,	0x04,	%i5
	edge16	%g1,	%i6,	%l4
	udivx	%i1,	0x0C07,	%g5
	orncc	%g7,	%o6,	%o0
	move	%xcc,	%g6,	%o1
	smul	%i3,	%i2,	%g2
	xor	%i7,	0x1A9A,	%o2
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	ldd	[%l7 + 0x48],	%f6
	edge8n	%g3,	%i4,	%l2
	sll	%o4,	%l3,	%l0
	andn	%i0,	0x06E0,	%o5
	ld	[%l7 + 0x6C],	%f29
	addc	%l1,	0x09B5,	%g4
	fmovsg	%xcc,	%f6,	%f5
	save %l6, %g1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i6,	[%l7 + 0x54]
	alignaddr	%i1,	%l4,	%g7
	srax	%g5,	0x16,	%o0
	ldd	[%l7 + 0x20],	%g6
	fmovsleu	%icc,	%f10,	%f3
	mulscc	%o1,	0x15E3,	%i3
	sll	%i2,	%g2,	%i7
	fmul8sux16	%f10,	%f16,	%f18
	andcc	%o6,	0x1A51,	%l5
	ldsb	[%l7 + 0x4C],	%o3
	edge32ln	%o2,	%o7,	%i4
	movrlz	%l2,	%o4,	%l3
	movn	%xcc,	%l0,	%i0
	andncc	%o5,	%l1,	%g3
	subccc	%g4,	%l6,	%g1
	edge32l	%i6,	%i5,	%i1
	mova	%icc,	%l4,	%g7
	fmovrsgz	%g5,	%f14,	%f16
	movne	%icc,	%o0,	%o1
	subc	%g6,	0x0034,	%i2
	fmovscs	%icc,	%f1,	%f25
	srax	%g2,	0x07,	%i3
	ldsb	[%l7 + 0x24],	%o6
	movcc	%icc,	%i7,	%o3
	srl	%l5,	0x0C,	%o7
	ldsb	[%l7 + 0x4B],	%i4
	subc	%o2,	%l2,	%o4
	fone	%f10
	xorcc	%l3,	0x0285,	%i0
	srlx	%l0,	%l1,	%g3
	lduh	[%l7 + 0x3E],	%g4
	umul	%o5,	%g1,	%l6
	movcs	%xcc,	%i6,	%i5
	movrne	%l4,	0x02F,	%i1
	movrgez	%g7,	0x0A6,	%g5
	fandnot2s	%f16,	%f29,	%f8
	sllx	%o0,	0x02,	%g6
	ldub	[%l7 + 0x11],	%i2
	fabss	%f10,	%f25
	move	%xcc,	%o1,	%g2
	st	%f8,	[%l7 + 0x50]
	srlx	%o6,	%i3,	%i7
	movne	%icc,	%o3,	%o7
	fxor	%f30,	%f20,	%f8
	movne	%xcc,	%i4,	%l5
	udivcc	%l2,	0x0282,	%o4
	fcmpd	%fcc1,	%f8,	%f12
	xorcc	%l3,	0x1960,	%o2
	fnegd	%f8,	%f10
	fmovsg	%icc,	%f28,	%f20
	movge	%xcc,	%i0,	%l1
	fcmpes	%fcc3,	%f16,	%f7
	lduw	[%l7 + 0x34],	%g3
	ldsw	[%l7 + 0x24],	%l0
	umul	%g4,	0x0BB1,	%o5
	fnegd	%f18,	%f18
	save %g1, %l6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l4,	%i1,	%g7
	andncc	%g5,	%o0,	%g6
	stw	%i2,	[%l7 + 0x48]
	udiv	%o1,	0x1323,	%g2
	movcc	%icc,	%i6,	%i3
	fmovsvs	%icc,	%f15,	%f12
	movrne	%o6,	%o3,	%o7
	fpack32	%f2,	%f4,	%f8
	sir	0x1644
	sra	%i4,	%i7,	%l5
	sethi	0x0471,	%l2
	fzeros	%f19
	fmovdvs	%icc,	%f19,	%f31
	array8	%o4,	%l3,	%o2
	fexpand	%f7,	%f30
	sll	%i0,	%g3,	%l1
	movcc	%icc,	%l0,	%g4
	fpsub32	%f24,	%f30,	%f6
	movcc	%xcc,	%o5,	%l6
	movg	%icc,	%g1,	%l4
	stb	%i5,	[%l7 + 0x1F]
	movrgez	%i1,	0x3B3,	%g7
	xor	%g5,	%o0,	%g6
	edge32	%i2,	%g2,	%o1
	ldub	[%l7 + 0x43],	%i6
	fpmerge	%f11,	%f0,	%f14
	smulcc	%o6,	0x05CA,	%i3
	edge8	%o7,	%o3,	%i7
	srlx	%i4,	%l5,	%l2
	sth	%l3,	[%l7 + 0x40]
	ldsw	[%l7 + 0x0C],	%o2
	fmovdcs	%xcc,	%f18,	%f23
	edge8n	%i0,	%g3,	%o4
	edge8n	%l0,	%g4,	%o5
	stw	%l1,	[%l7 + 0x44]
	edge8n	%l6,	%g1,	%l4
	sth	%i1,	[%l7 + 0x7C]
	alignaddrl	%i5,	%g5,	%o0
	sdivx	%g6,	0x03F8,	%g7
	edge32	%i2,	%o1,	%i6
	array8	%o6,	%g2,	%i3
	edge16n	%o7,	%o3,	%i4
	movrgez	%i7,	0x1E2,	%l5
	sth	%l3,	[%l7 + 0x58]
	fnot2	%f30,	%f8
	udiv	%l2,	0x1528,	%o2
	movvc	%icc,	%g3,	%o4
	srlx	%i0,	%l0,	%g4
	move	%xcc,	%l1,	%l6
	fpsub16	%f28,	%f30,	%f0
	edge8	%o5,	%g1,	%i1
	edge8ln	%i5,	%l4,	%g5
	array32	%g6,	%o0,	%g7
	fmovdl	%icc,	%f0,	%f21
	array32	%o1,	%i6,	%i2
	fcmple32	%f10,	%f20,	%o6
	addcc	%i3,	0x1EE3,	%o7
	fnors	%f29,	%f17,	%f23
	fmovda	%xcc,	%f10,	%f4
	array32	%o3,	%g2,	%i7
	andn	%i4,	0x0BF4,	%l3
	edge16l	%l5,	%o2,	%g3
	sra	%l2,	%o4,	%l0
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%i0
	fexpand	%f5,	%f12
	std	%f14,	[%l7 + 0x70]
	fpadd32	%f12,	%f16,	%f12
	stb	%l1,	[%l7 + 0x3E]
	subccc	%l6,	0x0207,	%g4
	array8	%o5,	%g1,	%i1
	fpackfix	%f2,	%f0
	stw	%i5,	[%l7 + 0x34]
	edge32ln	%l4,	%g6,	%g5
	edge32n	%g7,	%o0,	%o1
	save %i6, 0x17F9, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i3,	%o6,	%o3
	edge16	%g2,	%o7,	%i4
	fornot2s	%f12,	%f28,	%f13
	umulcc	%l3,	0x0093,	%i7
	srl	%o2,	0x0E,	%g3
	siam	0x6
	fcmpgt32	%f10,	%f18,	%l5
	fcmpgt16	%f20,	%f24,	%l2
	movcs	%icc,	%l0,	%o4
	umulcc	%l1,	0x14DF,	%i0
	fnegs	%f3,	%f28
	udivcc	%l6,	0x1970,	%g4
	mulx	%o5,	%g1,	%i1
	movneg	%xcc,	%i5,	%l4
	addcc	%g6,	%g5,	%o0
	fsrc2s	%f25,	%f0
	edge8n	%g7,	%i6,	%o1
	lduh	[%l7 + 0x38],	%i2
	ldub	[%l7 + 0x63],	%o6
	fornot2s	%f0,	%f11,	%f24
	sir	0x0796
	fmovrsne	%i3,	%f1,	%f1
	edge32n	%o3,	%g2,	%i4
	fmovrsgez	%l3,	%f19,	%f10
	xor	%o7,	%o2,	%i7
	ldsh	[%l7 + 0x74],	%g3
	alignaddr	%l2,	%l0,	%l5
	fpadd16s	%f18,	%f13,	%f12
	fcmpne16	%f8,	%f16,	%l1
	edge16l	%o4,	%l6,	%i0
	fpadd32s	%f17,	%f1,	%f23
	subc	%g4,	%o5,	%g1
	fcmpne32	%f6,	%f0,	%i1
	faligndata	%f12,	%f22,	%f28
	edge32ln	%i5,	%g6,	%g5
	fmovrse	%o0,	%f7,	%f1
	orcc	%l4,	%g7,	%i6
	edge32ln	%o1,	%i2,	%o6
	sth	%o3,	[%l7 + 0x40]
	edge8ln	%g2,	%i4,	%l3
	andncc	%i3,	%o2,	%i7
	or	%g3,	0x0F5F,	%o7
	srlx	%l2,	0x0F,	%l5
	edge16	%l0,	%o4,	%l6
	fmovsleu	%xcc,	%f15,	%f9
	fmovdcc	%icc,	%f8,	%f6
	sdivcc	%i0,	0x06AD,	%g4
	fmovsg	%xcc,	%f3,	%f29
	xnor	%l1,	%o5,	%g1
	movg	%xcc,	%i1,	%i5
	movrlez	%g6,	%o0,	%g5
	stx	%g7,	[%l7 + 0x58]
	fmovsle	%xcc,	%f4,	%f3
	ld	[%l7 + 0x7C],	%f16
	lduw	[%l7 + 0x28],	%i6
	ldub	[%l7 + 0x2C],	%o1
	smul	%l4,	%i2,	%o3
	edge32	%o6,	%g2,	%i4
	movcc	%xcc,	%l3,	%i3
	sir	0x03F6
	add	%i7,	%g3,	%o2
	edge16	%o7,	%l5,	%l2
	movcc	%icc,	%l0,	%l6
	mova	%xcc,	%i0,	%g4
	sth	%l1,	[%l7 + 0x2C]
	sub	%o5,	0x04B3,	%o4
	edge8l	%i1,	%i5,	%g1
	mulx	%o0,	%g5,	%g7
	udivcc	%g6,	0x1DCD,	%o1
	save %i6, 0x16A2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f0,	[%l7 + 0x38]
	add	%i2,	%o3,	%o6
	umul	%g2,	0x0BD7,	%i4
	addcc	%l3,	%i7,	%i3
	nop
	set	0x46, %g7
	lduh	[%l7 + %g7],	%o2
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%g3
	nop
	set	0x58, %i2
	std	%f16,	[%l7 + %i2]
	fsrc1s	%f22,	%f21
	sll	%l5,	0x14,	%o7
	sdivcc	%l2,	0x1B45,	%l0
	array16	%i0,	%g4,	%l1
	ld	[%l7 + 0x14],	%f18
	edge16n	%l6,	%o5,	%o4
	fmovdl	%xcc,	%f30,	%f27
	fmovdgu	%icc,	%f11,	%f2
	st	%f12,	[%l7 + 0x58]
	movvc	%xcc,	%i1,	%i5
	movrgz	%g1,	%o0,	%g5
	movvs	%icc,	%g6,	%g7
	fcmps	%fcc1,	%f14,	%f15
	stx	%i6,	[%l7 + 0x38]
	ldsw	[%l7 + 0x50],	%l4
	movrgz	%i2,	0x1F0,	%o3
	edge8n	%o1,	%g2,	%i4
	edge32l	%o6,	%i7,	%i3
	sdiv	%o2,	0x1E00,	%l3
	fnot1s	%f13,	%f20
	ldsh	[%l7 + 0x7A],	%l5
	sllx	%g3,	%l2,	%o7
	nop
	set	0x3E, %g6
	ldsh	[%l7 + %g6],	%i0
	lduh	[%l7 + 0x1A],	%l0
	ldx	[%l7 + 0x40],	%l1
	orcc	%l6,	%o5,	%g4
	andncc	%o4,	%i1,	%i5
	stb	%o0,	[%l7 + 0x56]
	movn	%icc,	%g5,	%g6
	xor	%g1,	%g7,	%i6
	movneg	%icc,	%i2,	%l4
	fmovrdlez	%o3,	%f4,	%f30
	edge16ln	%g2,	%o1,	%o6
	movrgz	%i7,	0x083,	%i4
	fpadd32s	%f23,	%f14,	%f26
	fmovrdlz	%i3,	%f20,	%f30
	fexpand	%f0,	%f30
	siam	0x5
	fornot1	%f2,	%f6,	%f18
	movrlz	%o2,	%l5,	%g3
	movrlz	%l2,	%o7,	%l3
	fmovdn	%xcc,	%f17,	%f21
	sth	%i0,	[%l7 + 0x74]
	andncc	%l1,	%l6,	%o5
	movre	%l0,	0x319,	%g4
	edge16l	%o4,	%i1,	%o0
	edge16n	%i5,	%g6,	%g5
	nop
	set	0x32, %g3
	sth	%g7,	[%l7 + %g3]
	sdiv	%g1,	0x03A5,	%i2
	stw	%l4,	[%l7 + 0x10]
	stb	%o3,	[%l7 + 0x6D]
	xorcc	%g2,	%i6,	%o1
	fmovse	%icc,	%f21,	%f7
	fpsub32s	%f21,	%f20,	%f4
	xorcc	%o6,	0x1318,	%i4
	fxors	%f31,	%f13,	%f22
	movne	%xcc,	%i7,	%i3
	sdiv	%l5,	0x0891,	%g3
	fmovda	%xcc,	%f13,	%f8
	restore %o2, %l2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i0,	%l1
	nop
	set	0x0A, %i6
	sth	%o7,	[%l7 + %i6]
	std	%f22,	[%l7 + 0x68]
	andcc	%o5,	0x1B20,	%l0
	fmovdgu	%xcc,	%f31,	%f5
	array16	%g4,	%l6,	%o4
	ldx	[%l7 + 0x60],	%o0
	sllx	%i1,	%i5,	%g5
	stx	%g7,	[%l7 + 0x68]
	movrlz	%g6,	0x0C8,	%g1
	andcc	%l4,	0x0A50,	%o3
	fcmps	%fcc1,	%f27,	%f17
	edge8ln	%g2,	%i6,	%i2
	orncc	%o1,	0x00DC,	%i4
	fands	%f1,	%f9,	%f21
	fmovdl	%icc,	%f2,	%f13
	sra	%o6,	%i3,	%l5
	movpos	%xcc,	%i7,	%o2
	sdiv	%l2,	0x0EDF,	%l3
	edge32ln	%g3,	%i0,	%l1
	movrgz	%o7,	0x148,	%l0
	fsrc2	%f16,	%f16
	edge8n	%g4,	%l6,	%o4
	fornot2	%f6,	%f18,	%f18
	addcc	%o0,	%o5,	%i1
	sethi	0x1D27,	%g5
	ldd	[%l7 + 0x30],	%g6
	xnorcc	%g6,	0x1472,	%g1
	orncc	%l4,	0x0772,	%i5
	ldd	[%l7 + 0x08],	%g2
	sllx	%o3,	%i6,	%o1
	addc	%i2,	%i4,	%i3
	edge8l	%o6,	%i7,	%l5
	movneg	%icc,	%o2,	%l3
	fcmps	%fcc3,	%f21,	%f1
	edge16n	%g3,	%i0,	%l2
	fmovrsne	%o7,	%f18,	%f16
	andn	%l0,	0x1394,	%l1
	movle	%xcc,	%l6,	%o4
	edge32ln	%g4,	%o5,	%i1
	and	%g5,	%g7,	%o0
	array8	%g1,	%l4,	%g6
	movvc	%icc,	%g2,	%o3
	smul	%i6,	%o1,	%i5
	movn	%xcc,	%i2,	%i3
	umulcc	%i4,	0x098D,	%o6
	edge32ln	%l5,	%i7,	%o2
	stx	%l3,	[%l7 + 0x78]
	ldsh	[%l7 + 0x5E],	%g3
	sir	0x0952
	srl	%l2,	%o7,	%i0
	subc	%l0,	0x1E20,	%l6
	movne	%icc,	%o4,	%g4
	movcs	%icc,	%o5,	%i1
	movcs	%xcc,	%l1,	%g5
	sethi	0x033F,	%o0
	ldsb	[%l7 + 0x78],	%g1
	fmovdgu	%xcc,	%f3,	%f25
	movrgz	%g7,	0x042,	%l4
	alignaddr	%g2,	%g6,	%o3
	ldsw	[%l7 + 0x0C],	%i6
	fmovsneg	%xcc,	%f10,	%f0
	movrne	%o1,	%i2,	%i3
	fornot2s	%f12,	%f14,	%f4
	fmovdgu	%icc,	%f3,	%f6
	edge16n	%i4,	%i5,	%l5
	edge32	%o6,	%i7,	%l3
	umulcc	%o2,	%g3,	%l2
	srlx	%i0,	%o7,	%l6
	ldsb	[%l7 + 0x1C],	%l0
	srax	%o4,	0x03,	%o5
	fxnors	%f17,	%f17,	%f8
	fmovrdlez	%g4,	%f26,	%f28
	sdiv	%l1,	0x0CD7,	%i1
	xorcc	%o0,	%g5,	%g1
	edge16n	%l4,	%g7,	%g6
	fmovsn	%icc,	%f30,	%f9
	movrne	%g2,	0x275,	%i6
	sir	0x1925
	movcc	%xcc,	%o1,	%i2
	popc	%o3,	%i3
	alignaddrl	%i5,	%i4,	%o6
	movrne	%i7,	0x2E0,	%l3
	fmovsa	%icc,	%f24,	%f6
	movrlez	%o2,	0x36D,	%l5
	andn	%l2,	%i0,	%o7
	fzeros	%f11
	fandnot2	%f4,	%f26,	%f30
	andncc	%g3,	%l0,	%o4
	fmovsle	%xcc,	%f7,	%f5
	srlx	%o5,	0x10,	%g4
	edge32	%l6,	%i1,	%l1
	move	%xcc,	%g5,	%o0
	addccc	%g1,	%g7,	%g6
	movrne	%g2,	0x325,	%i6
	edge8l	%l4,	%o1,	%o3
	udivcc	%i3,	0x04E3,	%i5
	movge	%icc,	%i2,	%o6
	movle	%xcc,	%i7,	%l3
	movgu	%xcc,	%o2,	%i4
	fcmpne16	%f0,	%f2,	%l5
	movl	%icc,	%l2,	%i0
	fmovsn	%icc,	%f23,	%f11
	st	%f16,	[%l7 + 0x28]
	fandnot1s	%f28,	%f21,	%f0
	sra	%o7,	0x06,	%l0
	for	%f18,	%f18,	%f4
	ldd	[%l7 + 0x48],	%o4
	movcs	%xcc,	%g3,	%o5
	umul	%l6,	%g4,	%l1
	edge16n	%i1,	%o0,	%g1
	mulx	%g7,	%g6,	%g2
	orn	%i6,	0x114B,	%g5
	orncc	%o1,	0x0239,	%l4
	udivcc	%i3,	0x1B62,	%o3
	add	%i2,	%o6,	%i5
	udivcc	%i7,	0x1BFB,	%o2
	orncc	%l3,	%i4,	%l5
	move	%icc,	%l2,	%o7
	movvs	%icc,	%i0,	%l0
	ldsh	[%l7 + 0x0A],	%g3
	save %o5, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l1,	%i1,	%g4
	ld	[%l7 + 0x0C],	%f25
	subc	%o0,	%g1,	%g7
	ldx	[%l7 + 0x60],	%g6
	orcc	%g2,	0x0921,	%i6
	add	%g5,	0x0D0B,	%o1
	movrgz	%l4,	%o3,	%i3
	mova	%icc,	%o6,	%i2
	movleu	%icc,	%i7,	%o2
	move	%icc,	%i5,	%l3
	movvs	%xcc,	%i4,	%l2
	movrne	%o7,	%l5,	%i0
	fmovsleu	%icc,	%f16,	%f11
	udiv	%g3,	0x0F60,	%l0
	fzero	%f30
	faligndata	%f30,	%f18,	%f24
	andn	%o5,	%l6,	%o4
	movcs	%icc,	%i1,	%g4
	nop
	set	0x58, %i3
	lduh	[%l7 + %i3],	%l1
	edge8ln	%g1,	%g7,	%o0
	edge32l	%g6,	%i6,	%g5
	movrlz	%o1,	%l4,	%o3
	movvc	%xcc,	%i3,	%g2
	sethi	0x014B,	%o6
	movl	%icc,	%i7,	%i2
	sethi	0x0304,	%i5
	sll	%o2,	0x0E,	%l3
	fmul8ulx16	%f30,	%f22,	%f0
	addc	%i4,	0x1185,	%l2
	edge8ln	%o7,	%i0,	%g3
	movge	%xcc,	%l5,	%l0
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fmovrde	%i1,	%f20,	%f20
	for	%f20,	%f24,	%f6
	movneg	%icc,	%l1,	%g1
	ldsh	[%l7 + 0x3E],	%g4
	mulx	%o0,	%g7,	%i6
	ldsb	[%l7 + 0x5B],	%g6
	fones	%f16
	andcc	%g5,	0x1688,	%l4
	ldub	[%l7 + 0x36],	%o3
	move	%xcc,	%i3,	%g2
	ldx	[%l7 + 0x40],	%o1
	fexpand	%f11,	%f26
	fmovrdlez	%i7,	%f30,	%f14
	alignaddrl	%o6,	%i5,	%o2
	movpos	%xcc,	%l3,	%i2
	stb	%l2,	[%l7 + 0x4B]
	or	%i4,	0x0FF2,	%i0
	andcc	%g3,	%o7,	%l5
	ldsb	[%l7 + 0x18],	%l0
	orcc	%o4,	0x1273,	%o5
	fmovdne	%xcc,	%f5,	%f3
	mulscc	%l6,	%l1,	%i1
	fnors	%f23,	%f15,	%f1
	fcmped	%fcc0,	%f30,	%f18
	fmovrdlz	%g1,	%f14,	%f6
	fandnot2s	%f11,	%f20,	%f8
	array32	%o0,	%g4,	%i6
	edge16	%g6,	%g7,	%g5
	save %l4, 0x1FDD, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%g2
	xnorcc	%i3,	0x05CB,	%i7
	fors	%f19,	%f17,	%f24
	andncc	%o6,	%i5,	%o1
	fmul8ulx16	%f18,	%f16,	%f24
	movrgz	%o2,	0x1C1,	%l3
	edge16l	%l2,	%i2,	%i0
	fmovsg	%xcc,	%f18,	%f20
	sdivcc	%i4,	0x0E01,	%g3
	fands	%f13,	%f8,	%f0
	fpackfix	%f22,	%f18
	sdivcc	%o7,	0x005C,	%l0
	fcmpeq16	%f0,	%f8,	%o4
	sethi	0x1FFC,	%l5
	fcmple32	%f12,	%f20,	%l6
	fcmpne32	%f0,	%f24,	%l1
	ldx	[%l7 + 0x68],	%o5
	sir	0x15D5
	movle	%xcc,	%g1,	%o0
	movne	%icc,	%g4,	%i1
	xnor	%i6,	%g6,	%g7
	fpadd32	%f4,	%f10,	%f14
	srl	%l4,	0x1A,	%g5
	fmovscs	%icc,	%f9,	%f6
	xor	%g2,	0x1746,	%i3
	movrlez	%i7,	%o3,	%o6
	fcmps	%fcc2,	%f15,	%f23
	stb	%o1,	[%l7 + 0x55]
	fsrc2	%f22,	%f14
	fnor	%f28,	%f30,	%f4
	fzero	%f8
	addccc	%i5,	%l3,	%l2
	orn	%i2,	%o2,	%i4
	subccc	%i0,	%o7,	%l0
	edge16n	%o4,	%l5,	%l6
	movne	%icc,	%l1,	%g3
	movrgz	%o5,	0x246,	%g1
	addccc	%o0,	%i1,	%g4
	udivcc	%g6,	0x039F,	%i6
	fmovsg	%xcc,	%f9,	%f30
	edge8ln	%g7,	%g5,	%g2
	ldsh	[%l7 + 0x70],	%l4
	srax	%i7,	%i3,	%o3
	fabsd	%f22,	%f22
	movcs	%icc,	%o6,	%o1
	or	%i5,	0x1482,	%l3
	movge	%xcc,	%l2,	%o2
	edge8n	%i4,	%i2,	%i0
	movcc	%icc,	%l0,	%o7
	restore %o4, %l5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l1,	%o5,	%g1
	sir	0x1B65
	xnorcc	%o0,	%g3,	%g4
	edge8ln	%g6,	%i1,	%i6
	sub	%g5,	0x1355,	%g2
	fmovdleu	%xcc,	%f4,	%f11
	edge32	%l4,	%g7,	%i7
	xnorcc	%i3,	%o3,	%o6
	or	%i5,	%o1,	%l3
	fmovdl	%icc,	%f3,	%f18
	umul	%o2,	0x159A,	%l2
	subcc	%i2,	0x0EB1,	%i4
	nop
	set	0x3A, %o0
	lduh	[%l7 + %o0],	%i0
	sdivcc	%o7,	0x000F,	%o4
	udivcc	%l5,	0x1699,	%l0
	fzeros	%f31
	fxnors	%f11,	%f8,	%f19
	fcmps	%fcc2,	%f25,	%f7
	sll	%l6,	%o5,	%l1
	movrgez	%o0,	0x08D,	%g1
	edge16ln	%g4,	%g6,	%g3
	fexpand	%f6,	%f20
	umulcc	%i6,	%g5,	%g2
	stw	%i1,	[%l7 + 0x0C]
	smul	%g7,	%l4,	%i3
	edge32n	%o3,	%i7,	%o6
	ldub	[%l7 + 0x63],	%o1
	mulscc	%l3,	0x091F,	%o2
	orn	%i5,	0x1A61,	%l2
	smulcc	%i4,	0x02B3,	%i2
	movne	%icc,	%o7,	%i0
	stx	%l5,	[%l7 + 0x68]
	fone	%f4
	edge32	%l0,	%l6,	%o4
	edge16	%o5,	%o0,	%l1
	fones	%f25
	orn	%g1,	0x061A,	%g6
	movre	%g4,	0x353,	%g3
	movrgez	%i6,	0x2BA,	%g2
	stx	%i1,	[%l7 + 0x20]
	addcc	%g5,	%g7,	%i3
	movpos	%icc,	%o3,	%l4
	ldub	[%l7 + 0x0B],	%o6
	nop
	set	0x08, %l4
	stx	%i7,	[%l7 + %l4]
	popc	0x1075,	%l3
	fmul8x16	%f5,	%f24,	%f2
	mulscc	%o1,	%i5,	%o2
	xnorcc	%l2,	0x1639,	%i4
	fmovrdlez	%o7,	%f24,	%f10
	sub	%i2,	0x1545,	%i0
	and	%l0,	0x0ED8,	%l5
	movleu	%icc,	%l6,	%o5
	sllx	%o4,	%l1,	%o0
	smul	%g6,	0x029C,	%g1
	edge16	%g4,	%i6,	%g2
	fzero	%f2
	edge16l	%g3,	%g5,	%g7
	ldx	[%l7 + 0x50],	%i3
	edge32l	%o3,	%i1,	%l4
	subcc	%i7,	%l3,	%o1
	movg	%xcc,	%o6,	%i5
	ldd	[%l7 + 0x68],	%f22
	orcc	%l2,	%i4,	%o7
	edge8ln	%o2,	%i0,	%i2
	movcs	%icc,	%l5,	%l6
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f6
	move	%xcc,	%o5,	%l0
	fmuld8sux16	%f18,	%f6,	%f14
	movrgez	%o4,	%o0,	%g6
	edge8l	%l1,	%g4,	%i6
	sdivcc	%g1,	0x1656,	%g3
	st	%f31,	[%l7 + 0x74]
	fmovsleu	%xcc,	%f16,	%f0
	alignaddrl	%g2,	%g5,	%i3
	movle	%icc,	%g7,	%o3
	movcc	%xcc,	%l4,	%i7
	sdivcc	%i1,	0x0BC5,	%o1
	fcmpgt16	%f30,	%f14,	%o6
	sdiv	%l3,	0x0D65,	%l2
	lduw	[%l7 + 0x24],	%i5
	save %i4, 0x17E4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o7,	%i2,	%i0
	ldsw	[%l7 + 0x14],	%l6
	mulscc	%l5,	%o5,	%l0
	orcc	%o4,	0x1247,	%o0
	fmovdn	%icc,	%f23,	%f5
	move	%icc,	%l1,	%g6
	orncc	%i6,	%g4,	%g3
	lduw	[%l7 + 0x18],	%g1
	movrgz	%g2,	0x2B8,	%g5
	addcc	%g7,	%i3,	%o3
	array16	%i7,	%l4,	%i1
	edge8n	%o1,	%l3,	%l2
	edge8n	%i5,	%i4,	%o2
	mulx	%o7,	%i2,	%o6
	fmovsle	%icc,	%f9,	%f0
	movgu	%icc,	%l6,	%l5
	fpmerge	%f16,	%f14,	%f26
	edge32	%i0,	%o5,	%o4
	movn	%icc,	%l0,	%l1
	andn	%g6,	%i6,	%o0
	edge8	%g4,	%g1,	%g2
	movle	%xcc,	%g3,	%g5
	addcc	%i3,	0x1DB2,	%g7
	movpos	%icc,	%i7,	%o3
	sethi	0x1A35,	%l4
	sethi	0x05E2,	%o1
	fmovsneg	%icc,	%f23,	%f23
	fpsub32s	%f22,	%f30,	%f4
	fmovsneg	%xcc,	%f13,	%f5
	ld	[%l7 + 0x60],	%f12
	fxors	%f11,	%f17,	%f15
	orncc	%l3,	0x1F47,	%l2
	edge16l	%i1,	%i5,	%o2
	sdiv	%o7,	0x0DBB,	%i4
	fmovsl	%icc,	%f13,	%f15
	ldd	[%l7 + 0x08],	%i2
	fornot2	%f14,	%f30,	%f30
	srl	%l6,	0x0F,	%o6
	mulscc	%l5,	0x1A50,	%i0
	move	%xcc,	%o4,	%o5
	edge32ln	%l1,	%g6,	%i6
	fandnot2s	%f29,	%f22,	%f13
	fmovdneg	%icc,	%f19,	%f20
	fpsub16s	%f16,	%f26,	%f0
	alignaddr	%o0,	%l0,	%g4
	edge16	%g1,	%g2,	%g5
	std	%f4,	[%l7 + 0x50]
	fabss	%f11,	%f1
	lduh	[%l7 + 0x14],	%g3
	ld	[%l7 + 0x2C],	%f2
	siam	0x0
	orncc	%g7,	0x1882,	%i7
	ldx	[%l7 + 0x70],	%i3
	edge32	%l4,	%o1,	%o3
	movgu	%xcc,	%l2,	%l3
	fmovde	%xcc,	%f3,	%f27
	fandnot1	%f20,	%f16,	%f16
	sdivcc	%i5,	0x0AF0,	%i1
	fors	%f24,	%f0,	%f13
	fcmpgt32	%f22,	%f8,	%o2
	stw	%o7,	[%l7 + 0x3C]
	xor	%i2,	0x0D06,	%l6
	orcc	%o6,	0x1EC0,	%i4
	array32	%i0,	%l5,	%o4
	sdivx	%o5,	0x09B3,	%g6
	movpos	%xcc,	%i6,	%o0
	movl	%icc,	%l1,	%l0
	movrgez	%g1,	0x143,	%g2
	addccc	%g5,	%g3,	%g7
	addccc	%i7,	0x1834,	%g4
	edge16n	%i3,	%l4,	%o1
	edge8l	%l2,	%o3,	%l3
	ldsh	[%l7 + 0x50],	%i1
	movpos	%xcc,	%i5,	%o7
	stw	%i2,	[%l7 + 0x64]
	movvs	%icc,	%o2,	%l6
	subcc	%i4,	%o6,	%l5
	sdivcc	%o4,	0x1F07,	%i0
	nop
	set	0x40, %o1
	sth	%g6,	[%l7 + %o1]
	fmovdne	%xcc,	%f29,	%f14
	sll	%o5,	%o0,	%i6
	fsrc1s	%f31,	%f26
	fmovdneg	%icc,	%f10,	%f16
	movneg	%icc,	%l1,	%l0
	movneg	%icc,	%g2,	%g5
	sll	%g1,	%g7,	%g3
	sdivcc	%g4,	0x0887,	%i7
	xnor	%i3,	0x1BE7,	%l4
	movrgz	%o1,	0x37C,	%l2
	stx	%l3,	[%l7 + 0x60]
	alignaddr	%i1,	%i5,	%o3
	fmovrsne	%o7,	%f6,	%f16
	popc	%i2,	%o2
	fornot2s	%f30,	%f10,	%f31
	ldd	[%l7 + 0x30],	%f22
	andcc	%l6,	0x066A,	%i4
	popc	%o6,	%o4
	andn	%i0,	0x0372,	%l5
	movrlz	%o5,	0x265,	%o0
	fornot2	%f22,	%f10,	%f0
	movg	%icc,	%g6,	%i6
	sdivcc	%l0,	0x13B8,	%l1
	ldd	[%l7 + 0x20],	%g2
	edge16n	%g1,	%g5,	%g3
	popc	%g7,	%i7
	movrlz	%g4,	%i3,	%o1
	fpmerge	%f23,	%f27,	%f18
	umulcc	%l4,	0x0713,	%l3
	stb	%l2,	[%l7 + 0x6E]
	movcc	%icc,	%i1,	%o3
	fmovdgu	%xcc,	%f5,	%f12
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f24
	alignaddr	%i5,	%o7,	%i2
	fnegs	%f19,	%f18
	movvc	%icc,	%o2,	%i4
	ldsh	[%l7 + 0x48],	%o6
	nop
	set	0x08, %o5
	stx	%l6,	[%l7 + %o5]
	stx	%i0,	[%l7 + 0x08]
	umulcc	%l5,	0x1578,	%o5
	udivx	%o0,	0x1B6A,	%g6
	orncc	%o4,	0x1929,	%i6
	smul	%l0,	%g2,	%l1
	smulcc	%g1,	%g3,	%g7
	ldsw	[%l7 + 0x44],	%i7
	add	%g5,	%i3,	%o1
	movcs	%xcc,	%l4,	%g4
	xnorcc	%l2,	%l3,	%i1
	add	%i5,	%o7,	%i2
	fandnot2	%f6,	%f16,	%f14
	fmovdn	%xcc,	%f6,	%f3
	edge16ln	%o3,	%i4,	%o2
	movn	%xcc,	%o6,	%l6
	movrlz	%i0,	0x022,	%l5
	umulcc	%o0,	0x09A3,	%o5
	ldx	[%l7 + 0x70],	%g6
	fmovspos	%xcc,	%f12,	%f27
	fmovrslz	%o4,	%f4,	%f12
	umulcc	%l0,	%g2,	%i6
	fpackfix	%f6,	%f5
	fcmpgt16	%f24,	%f0,	%g1
	movrlz	%g3,	%g7,	%l1
	udivx	%g5,	0x18FF,	%i3
	fmovdpos	%icc,	%f25,	%f14
	movge	%icc,	%o1,	%i7
	edge8n	%l4,	%l2,	%l3
	ldub	[%l7 + 0x23],	%g4
	array16	%i1,	%o7,	%i2
	edge32	%o3,	%i5,	%o2
	movrne	%o6,	0x0A8,	%i4
	movgu	%xcc,	%i0,	%l6
	movre	%o0,	0x1BE,	%o5
	sdivcc	%l5,	0x1851,	%g6
	udivcc	%l0,	0x048F,	%o4
	or	%g2,	0x0DB6,	%i6
	fmovdne	%xcc,	%f10,	%f16
	fmovsvs	%icc,	%f13,	%f20
	ld	[%l7 + 0x48],	%f7
	movvc	%xcc,	%g1,	%g3
	array8	%g7,	%g5,	%l1
	fmovsleu	%icc,	%f30,	%f30
	edge32l	%o1,	%i7,	%l4
	fnot2	%f0,	%f0
	edge16ln	%l2,	%i3,	%l3
	movrgz	%g4,	0x2FB,	%o7
	movrlez	%i2,	%i1,	%o3
	stx	%o2,	[%l7 + 0x20]
	addccc	%i5,	%i4,	%o6
	udivx	%l6,	0x1AB8,	%o0
	fmovrsgz	%o5,	%f19,	%f18
	fmovsn	%icc,	%f13,	%f26
	fmovsvs	%xcc,	%f10,	%f28
	move	%xcc,	%l5,	%i0
	fnot1	%f16,	%f12
	edge16l	%l0,	%o4,	%g6
	ld	[%l7 + 0x2C],	%f25
	or	%g2,	0x12D5,	%g1
	sdiv	%i6,	0x1134,	%g7
	fornot1s	%f0,	%f22,	%f18
	orn	%g5,	%l1,	%g3
	alignaddr	%o1,	%i7,	%l4
	mulx	%l2,	%i3,	%l3
	udivcc	%o7,	0x0E3A,	%i2
	popc	%g4,	%i1
	edge16	%o3,	%o2,	%i5
	fmovsvc	%xcc,	%f23,	%f25
	fmovsvs	%icc,	%f15,	%f3
	ldsb	[%l7 + 0x30],	%o6
	alignaddrl	%i4,	%l6,	%o5
	fpsub32	%f26,	%f12,	%f14
	smulcc	%l5,	0x0690,	%o0
	fnor	%f0,	%f20,	%f24
	movleu	%xcc,	%l0,	%i0
	xorcc	%o4,	0x003E,	%g6
	fsrc1	%f2,	%f8
	xnorcc	%g2,	0x0D75,	%g1
	fcmpd	%fcc2,	%f0,	%f30
	edge16n	%g7,	%i6,	%l1
	fxor	%f4,	%f16,	%f10
	sra	%g3,	%o1,	%g5
	stb	%i7,	[%l7 + 0x10]
	fmovdne	%xcc,	%f24,	%f5
	popc	%l4,	%l2
	andncc	%l3,	%i3,	%o7
	fcmpgt32	%f22,	%f28,	%g4
	fxnor	%f14,	%f30,	%f0
	lduw	[%l7 + 0x78],	%i1
	fornot2	%f22,	%f28,	%f10
	array8	%i2,	%o3,	%o2
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	sdivcc	%l6,	0x0F8A,	%l5
	popc	0x16A4,	%o0
	restore %o5, 0x089D, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l0,	%o4,	%g6
	std	%f6,	[%l7 + 0x58]
	sethi	0x1DE2,	%g2
	array32	%g1,	%g7,	%i6
	movrgz	%g3,	%l1,	%o1
	or	%i7,	%l4,	%g5
	udiv	%l3,	0x09EA,	%i3
	orncc	%o7,	%g4,	%i1
	addcc	%i2,	0x177B,	%l2
	fpsub16	%f0,	%f6,	%f4
	ldsw	[%l7 + 0x24],	%o2
	orncc	%o3,	%i5,	%o6
	movge	%icc,	%l6,	%i4
	movvc	%icc,	%o0,	%l5
	fmovscs	%icc,	%f23,	%f3
	ldsh	[%l7 + 0x4C],	%i0
	orn	%l0,	0x01AB,	%o5
	sethi	0x0297,	%g6
	save %g2, %g1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i6,	%o4,	%g3
	fmovd	%f20,	%f14
	fmovrdlz	%o1,	%f30,	%f10
	movne	%icc,	%l1,	%l4
	and	%i7,	0x145A,	%g5
	edge8	%l3,	%o7,	%g4
	edge32l	%i3,	%i1,	%l2
	array16	%i2,	%o2,	%i5
	fmovrdlz	%o3,	%f24,	%f20
	edge32n	%o6,	%l6,	%o0
	sll	%i4,	%l5,	%l0
	sll	%i0,	0x00,	%o5
	ldd	[%l7 + 0x20],	%g6
	addccc	%g2,	%g1,	%g7
	add	%i6,	0x1DE6,	%g3
	movne	%xcc,	%o4,	%l1
	ldd	[%l7 + 0x20],	%f8
	add	%l4,	0x1889,	%o1
	movle	%xcc,	%i7,	%g5
	srlx	%l3,	%g4,	%o7
	sdivx	%i3,	0x1884,	%l2
	movcs	%xcc,	%i2,	%o2
	movrne	%i5,	0x102,	%o3
	sub	%o6,	%i1,	%l6
	movrne	%o0,	%i4,	%l5
	fxors	%f13,	%f16,	%f8
	st	%f18,	[%l7 + 0x4C]
	movrne	%i0,	0x011,	%l0
	movl	%xcc,	%o5,	%g6
	sdiv	%g2,	0x1B52,	%g1
	and	%g7,	0x192F,	%i6
	move	%xcc,	%o4,	%g3
	fmovde	%xcc,	%f22,	%f31
	fpsub16s	%f3,	%f28,	%f8
	lduw	[%l7 + 0x0C],	%l1
	fmovscs	%icc,	%f23,	%f12
	mulx	%l4,	0x0DA1,	%o1
	array8	%g5,	%i7,	%l3
	fcmpgt16	%f0,	%f6,	%o7
	movrne	%i3,	%g4,	%i2
	movgu	%xcc,	%o2,	%i5
	sll	%o3,	0x1A,	%l2
	fpadd16s	%f12,	%f1,	%f6
	fmovdg	%icc,	%f7,	%f28
	mulx	%o6,	%l6,	%i1
	and	%o0,	0x1925,	%i4
	alignaddrl	%l5,	%l0,	%o5
	fpmerge	%f11,	%f17,	%f0
	fmovdvs	%xcc,	%f11,	%f1
	movrgez	%g6,	%i0,	%g2
	movn	%xcc,	%g1,	%g7
	fmovscs	%icc,	%f22,	%f23
	ldub	[%l7 + 0x6D],	%i6
	fcmpne16	%f30,	%f18,	%g3
	fandnot2s	%f0,	%f7,	%f0
	sub	%o4,	0x09F2,	%l1
	sll	%o1,	0x0D,	%l4
	orn	%g5,	0x13B0,	%l3
	fmovrsne	%o7,	%f13,	%f30
	fsrc1s	%f9,	%f8
	movgu	%icc,	%i7,	%g4
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	and	%i3,	0x066F,	%o3
	ldd	[%l7 + 0x58],	%l2
	sdivcc	%o6,	0x1993,	%i5
	fmovrsne	%i1,	%f15,	%f8
	umulcc	%l6,	%i4,	%l5
	fmovsa	%icc,	%f11,	%f23
	mulscc	%l0,	%o0,	%o5
	sir	0x1708
	umulcc	%i0,	0x1087,	%g2
	fpack16	%f16,	%f15
	fmovrsgez	%g6,	%f14,	%f12
	addccc	%g1,	0x11A3,	%g7
	movne	%icc,	%i6,	%g3
	save %l1, %o4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o1,	%f0,	%f18
	fcmpeq16	%f2,	%f20,	%g5
	srlx	%o7,	%i7,	%g4
	array32	%l3,	%i2,	%o2
	sth	%o3,	[%l7 + 0x1E]
	edge8n	%i3,	%o6,	%i5
	fornot1s	%f31,	%f19,	%f7
	restore %i1, %l2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x5C],	%l6
	lduw	[%l7 + 0x58],	%l0
	orn	%l5,	0x16E1,	%o5
	edge32n	%o0,	%i0,	%g2
	srlx	%g6,	%g7,	%g1
	addc	%i6,	0x1549,	%l1
	movpos	%icc,	%o4,	%g3
	andcc	%o1,	%g5,	%o7
	fornot2	%f6,	%f16,	%f22
	fmovdneg	%xcc,	%f21,	%f20
	fmul8x16au	%f7,	%f2,	%f20
	fpadd32s	%f24,	%f29,	%f5
	edge16n	%i7,	%g4,	%l4
	sdivcc	%l3,	0x1711,	%o2
	edge32l	%o3,	%i3,	%o6
	orcc	%i5,	0x0D8A,	%i1
	fnands	%f6,	%f2,	%f8
	sll	%i2,	%l2,	%i4
	fmovrse	%l0,	%f28,	%f1
	fpsub16s	%f18,	%f4,	%f7
	movle	%xcc,	%l5,	%l6
	stw	%o5,	[%l7 + 0x28]
	and	%i0,	%o0,	%g2
	movpos	%xcc,	%g7,	%g1
	addcc	%i6,	%g6,	%o4
	fmovrslez	%l1,	%f14,	%f20
	and	%o1,	%g3,	%g5
	and	%o7,	0x0D33,	%i7
	fexpand	%f11,	%f16
	ldd	[%l7 + 0x48],	%g4
	edge8n	%l3,	%o2,	%l4
	lduw	[%l7 + 0x4C],	%i3
	fmovrdne	%o3,	%f18,	%f6
	edge16	%o6,	%i5,	%i2
	save %l2, %i4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l0,	%l6,	%l5
	alignaddrl	%i0,	%o0,	%o5
	mova	%icc,	%g7,	%g2
	edge16ln	%i6,	%g6,	%g1
	fmovsleu	%icc,	%f28,	%f4
	movrlz	%l1,	0x1B2,	%o1
	movcc	%icc,	%g3,	%g5
	orcc	%o4,	0x1376,	%i7
	sth	%o7,	[%l7 + 0x18]
	movge	%icc,	%g4,	%l3
	movrgz	%l4,	0x0C5,	%i3
	xor	%o3,	0x10F7,	%o6
	sdivcc	%i5,	0x11CA,	%o2
	srlx	%i2,	0x17,	%i4
	mova	%icc,	%l2,	%l0
	sdiv	%l6,	0x083C,	%i1
	udivx	%l5,	0x02D1,	%i0
	edge8l	%o5,	%g7,	%g2
	movl	%icc,	%o0,	%i6
	edge32	%g1,	%g6,	%l1
	fmovda	%icc,	%f2,	%f21
	ldsb	[%l7 + 0x34],	%g3
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%g4
	movcc	%icc,	%o4,	%o1
	fpsub16s	%f28,	%f24,	%f29
	sll	%i7,	0x08,	%g4
	xnor	%l3,	0x1C51,	%l4
	nop
	set	0x70, %i1
	ldsw	[%l7 + %i1],	%o7
	ldsw	[%l7 + 0x28],	%i3
	addcc	%o3,	0x0AF2,	%o6
	ldd	[%l7 + 0x10],	%f16
	andn	%o2,	%i2,	%i5
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	pdist	%f22,	%f14,	%f2
	movneg	%xcc,	%i1,	%l5
	fmovrdne	%i0,	%f28,	%f24
	stw	%o5,	[%l7 + 0x10]
	array16	%g7,	%g2,	%l2
	fxnors	%f29,	%f16,	%f26
	smul	%o0,	0x1715,	%g1
	stb	%i6,	[%l7 + 0x61]
	udivx	%l1,	0x1A19,	%g3
	ldub	[%l7 + 0x60],	%g5
	udivcc	%g6,	0x18CA,	%o1
	sdiv	%o4,	0x179C,	%g4
	andn	%i7,	0x1D9B,	%l4
	addcc	%o7,	0x057A,	%l3
	movne	%xcc,	%o3,	%o6
	movcs	%xcc,	%o2,	%i3
	edge16l	%i2,	%i5,	%l0
	movpos	%icc,	%i4,	%l6
	ldx	[%l7 + 0x48],	%l5
	andn	%i1,	0x0E25,	%o5
	fmovda	%icc,	%f16,	%f29
	ldsb	[%l7 + 0x23],	%i0
	fmovsleu	%icc,	%f0,	%f16
	orn	%g2,	0x096C,	%g7
	umulcc	%o0,	0x0E3D,	%g1
	srl	%l2,	0x0C,	%l1
	orcc	%i6,	%g5,	%g6
	fmovde	%icc,	%f11,	%f30
	move	%icc,	%o1,	%o4
	edge16l	%g4,	%g3,	%i7
	edge32l	%l4,	%o7,	%o3
	stw	%l3,	[%l7 + 0x44]
	movre	%o6,	%i3,	%o2
	fpack16	%f2,	%f17
	fmovsge	%xcc,	%f26,	%f18
	xnor	%i5,	0x0F2D,	%l0
	sethi	0x1D37,	%i2
	movvs	%icc,	%l6,	%i4
	udivcc	%i1,	0x0A2B,	%l5
	alignaddrl	%o5,	%i0,	%g2
	restore %o0, 0x1C3C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f18,	[%l7 + 0x78]
	fmovd	%f18,	%f30
	edge16ln	%g7,	%l2,	%i6
	mova	%xcc,	%g5,	%l1
	edge32n	%g6,	%o4,	%o1
	srlx	%g4,	%i7,	%l4
	fnot1	%f8,	%f28
	fmovrslz	%g3,	%f14,	%f12
	faligndata	%f18,	%f26,	%f30
	sth	%o7,	[%l7 + 0x38]
	array16	%l3,	%o6,	%o3
	sra	%i3,	0x16,	%o2
	stw	%i5,	[%l7 + 0x0C]
	fcmped	%fcc3,	%f28,	%f14
	std	%f28,	[%l7 + 0x78]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%l0
	fpsub16	%f16,	%f16,	%f8
	fmovsgu	%icc,	%f11,	%f24
	edge32	%l6,	%i2,	%i1
	subcc	%l5,	%i4,	%o5
	smulcc	%g2,	0x0839,	%i0
	fpadd32	%f30,	%f26,	%f12
	movg	%icc,	%g1,	%g7
	subc	%l2,	0x1DD6,	%i6
	sllx	%o0,	0x14,	%l1
	movneg	%icc,	%g5,	%g6
	xnor	%o1,	0x10CB,	%o4
	popc	0x194E,	%i7
	umul	%l4,	0x060A,	%g4
	or	%o7,	%g3,	%l3
	mulx	%o6,	0x0DD9,	%o3
	srl	%o2,	%i5,	%i3
	andncc	%l0,	%l6,	%i2
	sll	%l5,	0x1B,	%i1
	xnor	%i4,	0x18EA,	%o5
	fmovrse	%g2,	%f25,	%f26
	edge32ln	%i0,	%g1,	%l2
	movg	%icc,	%i6,	%o0
	fmovdneg	%icc,	%f5,	%f8
	mulx	%g7,	%l1,	%g6
	movvc	%xcc,	%g5,	%o1
	orcc	%o4,	0x054C,	%i7
	edge16l	%g4,	%o7,	%g3
	xorcc	%l3,	0x1459,	%o6
	fmovsne	%icc,	%f4,	%f0
	sethi	0x1E98,	%o3
	fmovsgu	%icc,	%f19,	%f16
	fpadd16s	%f10,	%f7,	%f22
	edge32l	%o2,	%l4,	%i5
	movrlez	%i3,	0x388,	%l0
	popc	0x1C9A,	%l6
	udiv	%l5,	0x1406,	%i1
	smul	%i4,	0x1F10,	%o5
	edge8l	%i2,	%i0,	%g2
	faligndata	%f0,	%f0,	%f24
	ldsb	[%l7 + 0x53],	%g1
	udivx	%i6,	0x0723,	%o0
	stb	%l2,	[%l7 + 0x18]
	fmovsa	%icc,	%f7,	%f0
	edge8n	%g7,	%g6,	%l1
	sllx	%g5,	%o4,	%i7
	movle	%xcc,	%g4,	%o7
	mulscc	%g3,	%o1,	%l3
	fmovsgu	%xcc,	%f3,	%f7
	movne	%icc,	%o3,	%o2
	st	%f21,	[%l7 + 0x7C]
	ldsb	[%l7 + 0x15],	%l4
	lduh	[%l7 + 0x74],	%i5
	addc	%o6,	%i3,	%l6
	fnands	%f28,	%f11,	%f30
	array32	%l0,	%i1,	%i4
	fmovsvs	%icc,	%f12,	%f21
	movrgz	%l5,	0x256,	%o5
	addc	%i0,	%i2,	%g1
	movge	%icc,	%i6,	%o0
	stb	%g2,	[%l7 + 0x37]
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	sub	%l1,	0x0A47,	%o4
	mulscc	%g5,	%g4,	%o7
	fmovrdgz	%g3,	%f10,	%f14
	edge8	%o1,	%l3,	%o3
	fnand	%f6,	%f12,	%f14
	smulcc	%i7,	%o2,	%i5
	alignaddr	%l4,	%o6,	%i3
	movneg	%icc,	%l0,	%l6
	fmovd	%f14,	%f10
	xor	%i1,	0x10F9,	%l5
	fmovdcs	%icc,	%f21,	%f16
	stw	%o5,	[%l7 + 0x6C]
	fmovde	%xcc,	%f21,	%f15
	ld	[%l7 + 0x5C],	%f0
	edge8ln	%i4,	%i0,	%g1
	movpos	%xcc,	%i6,	%o0
	movrlz	%i2,	0x3FA,	%g2
	umulcc	%g7,	%g6,	%l2
	movne	%xcc,	%o4,	%l1
	fmovdg	%xcc,	%f26,	%f0
	sth	%g4,	[%l7 + 0x7A]
	sra	%g5,	0x19,	%g3
	xor	%o7,	0x0CE0,	%o1
	smul	%l3,	%o3,	%o2
	array8	%i7,	%l4,	%o6
	edge32ln	%i5,	%i3,	%l0
	edge8n	%l6,	%l5,	%i1
	udivcc	%i4,	0x0FC6,	%i0
	edge16n	%o5,	%g1,	%o0
	edge16	%i6,	%i2,	%g2
	mulscc	%g6,	%l2,	%g7
	xnor	%l1,	%g4,	%g5
	mulx	%g3,	%o7,	%o4
	andncc	%l3,	%o1,	%o3
	movleu	%icc,	%i7,	%l4
	sll	%o2,	0x1C,	%i5
	movleu	%icc,	%o6,	%l0
	st	%f2,	[%l7 + 0x08]
	nop
	set	0x16, %l0
	sth	%i3,	[%l7 + %l0]
	movgu	%icc,	%l5,	%i1
	sir	0x01E5
	alignaddr	%l6,	%i4,	%i0
	srax	%o5,	%o0,	%i6
	movneg	%xcc,	%g1,	%i2
	sll	%g2,	%l2,	%g7
	movn	%icc,	%l1,	%g4
	fmovdge	%icc,	%f19,	%f10
	movge	%xcc,	%g5,	%g3
	stw	%g6,	[%l7 + 0x48]
	xorcc	%o7,	%o4,	%l3
	st	%f31,	[%l7 + 0x74]
	fmovrslez	%o3,	%f0,	%f30
	movle	%icc,	%o1,	%l4
	fsrc2s	%f5,	%f10
	stx	%o2,	[%l7 + 0x68]
	stw	%i7,	[%l7 + 0x7C]
	edge8l	%o6,	%i5,	%i3
	fmovrsgz	%l5,	%f18,	%f9
	movn	%xcc,	%i1,	%l6
	fmovd	%f24,	%f30
	ld	[%l7 + 0x50],	%f13
	for	%f8,	%f6,	%f24
	ldsw	[%l7 + 0x68],	%l0
	edge32n	%i4,	%o5,	%o0
	edge8ln	%i6,	%i0,	%g1
	fnot2	%f12,	%f6
	umulcc	%g2,	0x0205,	%i2
	movrlez	%l2,	%l1,	%g7
	fnands	%f2,	%f31,	%f2
	fnot1	%f18,	%f8
	movgu	%xcc,	%g4,	%g3
	fmul8x16au	%f19,	%f7,	%f28
	movne	%icc,	%g6,	%o7
	movl	%icc,	%g5,	%l3
	ldsw	[%l7 + 0x10],	%o3
	ld	[%l7 + 0x64],	%f28
	movrne	%o4,	%l4,	%o1
	srax	%o2,	0x1E,	%i7
	sub	%i5,	%i3,	%o6
	fmovspos	%xcc,	%f2,	%f10
	addcc	%l5,	0x00BB,	%i1
	edge8	%l0,	%i4,	%o5
	sdivx	%l6,	0x1B7D,	%i6
	edge16ln	%o0,	%g1,	%g2
	sllx	%i0,	0x16,	%i2
	fcmpgt16	%f14,	%f8,	%l2
	save %g7, 0x09C2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f12,	%f20
	add	%g3,	%g6,	%o7
	udiv	%g5,	0x1EC9,	%l3
	save %o3, 0x05F4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%l4,	%f14,	%f30
	stx	%o4,	[%l7 + 0x10]
	edge8ln	%o2,	%o1,	%i7
	movn	%xcc,	%i3,	%o6
	fnand	%f14,	%f8,	%f26
	movvc	%icc,	%i5,	%l5
	sra	%i1,	0x06,	%i4
	fcmpeq16	%f30,	%f4,	%o5
	edge16n	%l6,	%l0,	%i6
	sdivx	%o0,	0x0616,	%g1
	movg	%xcc,	%i0,	%g2
	xor	%i2,	%l2,	%g7
	udivcc	%l1,	0x00B8,	%g3
	nop
	set	0x08, %o3
	lduw	[%l7 + %o3],	%g6
	save %o7, 0x1751, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g5,	[%l7 + 0x6A]
	movl	%xcc,	%o3,	%l4
	movre	%g4,	%o2,	%o4
	movrlz	%i7,	0x33D,	%o1
	addccc	%o6,	%i3,	%i5
	lduh	[%l7 + 0x38],	%l5
	sethi	0x070E,	%i4
	xorcc	%i1,	%o5,	%l6
	fmovsle	%icc,	%f5,	%f25
	subcc	%l0,	0x1680,	%i6
	movg	%xcc,	%o0,	%g1
	edge32	%i0,	%g2,	%i2
	subc	%l2,	0x1C6D,	%g7
	srax	%l1,	%g3,	%g6
	fpadd32s	%f13,	%f17,	%f0
	sdivx	%o7,	0x1C4A,	%l3
	mulx	%g5,	%o3,	%l4
	fmovda	%icc,	%f31,	%f12
	lduh	[%l7 + 0x5E],	%g4
	array32	%o4,	%o2,	%o1
	edge16n	%i7,	%o6,	%i3
	ldsw	[%l7 + 0x50],	%i5
	st	%f7,	[%l7 + 0x1C]
	or	%i4,	0x1C59,	%i1
	array8	%o5,	%l5,	%l6
	movpos	%icc,	%l0,	%i6
	udivcc	%o0,	0x1FA6,	%g1
	sra	%g2,	0x01,	%i0
	subc	%l2,	%g7,	%l1
	mova	%xcc,	%g3,	%i2
	movge	%icc,	%g6,	%l3
	fmovrsne	%g5,	%f3,	%f17
	fmovda	%xcc,	%f5,	%f0
	sdivx	%o3,	0x08CD,	%o7
	xorcc	%g4,	0x134E,	%o4
	fmovrslez	%l4,	%f22,	%f19
	edge32ln	%o2,	%o1,	%o6
	edge32n	%i7,	%i3,	%i5
	udivcc	%i4,	0x10E6,	%o5
	edge16l	%l5,	%i1,	%l6
	movleu	%xcc,	%l0,	%o0
	fsrc1	%f8,	%f4
	movrne	%i6,	%g1,	%g2
	sllx	%l2,	%i0,	%g7
	popc	%g3,	%l1
	movrlez	%i2,	0x10E,	%g6
	array32	%l3,	%g5,	%o7
	udivcc	%o3,	0x0DE3,	%g4
	add	%o4,	0x0A91,	%l4
	fmovdgu	%xcc,	%f1,	%f18
	movcs	%icc,	%o1,	%o2
	addccc	%o6,	%i7,	%i3
	ldsb	[%l7 + 0x71],	%i5
	movge	%xcc,	%i4,	%l5
	edge8	%i1,	%l6,	%o5
	sra	%o0,	%l0,	%i6
	movle	%xcc,	%g2,	%g1
	sub	%l2,	0x1367,	%i0
	fones	%f10
	srl	%g3,	%g7,	%i2
	fcmpeq32	%f0,	%f4,	%l1
	movge	%icc,	%l3,	%g5
	orncc	%g6,	%o3,	%o7
	movvs	%icc,	%o4,	%l4
	sllx	%g4,	0x08,	%o1
	edge8l	%o2,	%i7,	%i3
	sdiv	%o6,	0x014B,	%i4
	edge8	%i5,	%l5,	%i1
	stw	%o5,	[%l7 + 0x18]
	orcc	%l6,	0x10FF,	%l0
	edge16l	%i6,	%o0,	%g2
	sdivcc	%g1,	0x1FAA,	%l2
	sub	%i0,	0x1948,	%g3
	edge8l	%i2,	%l1,	%g7
	udivx	%l3,	0x0CC2,	%g5
	array8	%o3,	%o7,	%g6
	movg	%icc,	%o4,	%g4
	xnorcc	%l4,	0x1A5B,	%o2
	sir	0x0239
	movcs	%icc,	%i7,	%o1
	edge8ln	%o6,	%i3,	%i4
	fmovsl	%xcc,	%f28,	%f14
	andn	%l5,	%i5,	%o5
	fmovdcs	%icc,	%f17,	%f22
	ldd	[%l7 + 0x58],	%f22
	sth	%i1,	[%l7 + 0x20]
	movcc	%xcc,	%l6,	%i6
	sdivx	%o0,	0x0C9C,	%l0
	sub	%g1,	%g2,	%l2
	subc	%i0,	%i2,	%l1
	movre	%g7,	0x020,	%l3
	fmovdne	%xcc,	%f7,	%f28
	movne	%icc,	%g5,	%o3
	movn	%xcc,	%g3,	%o7
	fmovdn	%icc,	%f17,	%f27
	fcmpgt32	%f4,	%f8,	%g6
	fand	%f6,	%f30,	%f0
	alignaddrl	%o4,	%l4,	%o2
	lduh	[%l7 + 0x5C],	%g4
	lduw	[%l7 + 0x54],	%o1
	fmovsvc	%xcc,	%f22,	%f7
	fpsub16s	%f25,	%f24,	%f31
	edge32n	%i7,	%o6,	%i3
	fnot1	%f22,	%f12
	ldsw	[%l7 + 0x34],	%i4
	movvs	%xcc,	%l5,	%o5
	fmovdleu	%icc,	%f29,	%f31
	popc	0x12F9,	%i5
	ld	[%l7 + 0x74],	%f6
	movneg	%icc,	%l6,	%i1
	fxors	%f14,	%f15,	%f24
	fnot2	%f12,	%f16
	fcmped	%fcc1,	%f20,	%f10
	movcc	%xcc,	%i6,	%o0
	movrgez	%g1,	%g2,	%l0
	edge16l	%i0,	%l2,	%i2
	add	%g7,	0x13D5,	%l3
	fmovsvs	%xcc,	%f18,	%f30
	movle	%xcc,	%l1,	%g5
	fmovsle	%icc,	%f25,	%f30
	edge8l	%g3,	%o3,	%o7
	fmovdcc	%xcc,	%f11,	%f23
	umul	%g6,	0x0FAB,	%o4
	srlx	%o2,	%g4,	%l4
	sra	%i7,	0x0E,	%o6
	udivcc	%i3,	0x1F2B,	%o1
	fones	%f28
	edge8ln	%l5,	%o5,	%i5
	sllx	%l6,	0x14,	%i1
	restore %i4, %i6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g2,	%o0
	fmovrsgz	%i0,	%f14,	%f12
	fmovde	%xcc,	%f13,	%f2
	movre	%l2,	0x29D,	%l0
	movgu	%xcc,	%g7,	%i2
	mova	%xcc,	%l3,	%l1
	movvs	%icc,	%g5,	%o3
	xnor	%o7,	0x096B,	%g6
	fmuld8sux16	%f0,	%f7,	%f14
	edge32l	%o4,	%g3,	%g4
	addc	%l4,	%o2,	%i7
	fmovrde	%o6,	%f22,	%f26
	movvs	%xcc,	%o1,	%i3
	sdivcc	%l5,	0x1BDF,	%o5
	mova	%icc,	%i5,	%i1
	movcc	%icc,	%i4,	%i6
	edge32ln	%l6,	%g2,	%o0
	fmovrdgez	%g1,	%f10,	%f26
	umulcc	%l2,	%i0,	%g7
	subcc	%i2,	0x11AF,	%l0
	ldsb	[%l7 + 0x48],	%l3
	movle	%icc,	%g5,	%o3
	array16	%o7,	%l1,	%g6
	movne	%icc,	%o4,	%g3
	sdivx	%g4,	0x0BB0,	%o2
	ldd	[%l7 + 0x58],	%f16
	xorcc	%l4,	0x0111,	%o6
	movrgez	%o1,	0x3A8,	%i7
	fornot1s	%f17,	%f26,	%f16
	ldub	[%l7 + 0x49],	%i3
	xor	%l5,	0x063D,	%i5
	edge8n	%o5,	%i4,	%i1
	fmovdl	%icc,	%f9,	%f29
	fcmpgt16	%f30,	%f4,	%i6
	smul	%g2,	%o0,	%l6
	movgu	%xcc,	%g1,	%i0
	fmovsleu	%xcc,	%f2,	%f26
	nop
	set	0x10, %l2
	std	%f12,	[%l7 + %l2]
	and	%l2,	%i2,	%l0
	fornot2	%f0,	%f24,	%f16
	udiv	%l3,	0x1D49,	%g5
	fmovrdlez	%o3,	%f12,	%f20
	xnor	%o7,	0x1691,	%g7
	fmovdn	%icc,	%f20,	%f11
	edge16ln	%g6,	%o4,	%g3
	fsrc2s	%f5,	%f10
	and	%g4,	%o2,	%l1
	or	%l4,	%o1,	%i7
	edge16n	%o6,	%i3,	%l5
	edge16n	%i5,	%i4,	%i1
	xnorcc	%i6,	%o5,	%o0
	smul	%g2,	0x09CF,	%l6
	addccc	%g1,	0x123C,	%i0
	mova	%icc,	%i2,	%l0
	fornot1	%f28,	%f16,	%f30
	fmovspos	%xcc,	%f18,	%f6
	sllx	%l2,	0x1F,	%g5
	fmovsa	%xcc,	%f16,	%f21
	fones	%f3
	edge16	%l3,	%o3,	%g7
	fmul8x16al	%f24,	%f23,	%f0
	subc	%g6,	0x1D21,	%o7
	fmovrsgz	%o4,	%f6,	%f31
	edge8ln	%g3,	%o2,	%l1
	movcc	%xcc,	%l4,	%g4
	umul	%o1,	%o6,	%i3
	fone	%f26
	fsrc2s	%f31,	%f6
	fcmpeq16	%f22,	%f26,	%l5
	edge8ln	%i7,	%i5,	%i1
	save %i6, %o5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g2,	0x03D9,	%o0
	edge16	%l6,	%i0,	%g1
	subc	%l0,	%i2,	%g5
	edge8	%l2,	%l3,	%o3
	movneg	%xcc,	%g6,	%g7
	movcs	%icc,	%o4,	%o7
	fxnor	%f12,	%f26,	%f2
	fmuld8sux16	%f12,	%f7,	%f0
	addc	%o2,	0x0F55,	%g3
	mova	%xcc,	%l4,	%g4
	movgu	%icc,	%l1,	%o1
	edge16l	%i3,	%l5,	%i7
	addccc	%o6,	%i1,	%i6
	edge16n	%o5,	%i5,	%g2
	stx	%i4,	[%l7 + 0x58]
	faligndata	%f28,	%f28,	%f8
	mulscc	%o0,	0x0F5A,	%i0
	xorcc	%l6,	%g1,	%l0
	st	%f13,	[%l7 + 0x5C]
	movcc	%xcc,	%i2,	%g5
	movvc	%icc,	%l2,	%o3
	fands	%f4,	%f31,	%f3
	umul	%l3,	%g6,	%g7
	movg	%xcc,	%o7,	%o4
	edge32ln	%o2,	%l4,	%g4
	edge8n	%g3,	%o1,	%i3
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%l4
	smul	%i7,	0x1312,	%o6
	mulscc	%l1,	%i6,	%o5
	fmovdneg	%xcc,	%f0,	%f24
	srlx	%i1,	0x07,	%i5
	fandnot1	%f2,	%f30,	%f18
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	for	%f16,	%f2,	%f26
	lduh	[%l7 + 0x4C],	%o0
	sdivx	%l6,	0x19FC,	%i0
	ldsh	[%l7 + 0x7A],	%g1
	movrgz	%l0,	%i2,	%g5
	movne	%xcc,	%o3,	%l2
	mova	%xcc,	%g6,	%g7
	movrlz	%o7,	0x272,	%l3
	movg	%xcc,	%o2,	%o4
	ldd	[%l7 + 0x78],	%f2
	smulcc	%l4,	%g3,	%o1
	movcc	%icc,	%g4,	%l5
	subccc	%i3,	0x00EA,	%o6
	addccc	%l1,	0x0FE6,	%i6
	save %i7, 0x0EDF, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f22,	[%l7 + 0x08]
	sethi	0x1D49,	%i1
	fmovdl	%icc,	%f5,	%f11
	stx	%i4,	[%l7 + 0x20]
	sub	%i5,	%o0,	%l6
	addcc	%i0,	%g1,	%l0
	or	%i2,	%g2,	%g5
	ld	[%l7 + 0x5C],	%f13
	st	%f3,	[%l7 + 0x20]
	fnegs	%f27,	%f16
	xnorcc	%l2,	0x12A5,	%g6
	subcc	%g7,	0x1E6B,	%o7
	fmovs	%f20,	%f31
	sdivcc	%l3,	0x1773,	%o3
	fones	%f6
	movrne	%o4,	%o2,	%l4
	fcmps	%fcc1,	%f17,	%f26
	edge16l	%g3,	%o1,	%l5
	fmovdne	%xcc,	%f30,	%f15
	movgu	%icc,	%g4,	%i3
	fpack16	%f16,	%f19
	umul	%l1,	0x00E9,	%i6
	sdiv	%o6,	0x1216,	%i7
	and	%o5,	%i1,	%i4
	alignaddrl	%o0,	%l6,	%i5
	std	%f28,	[%l7 + 0x38]
	nop
	set	0x2C, %l5
	lduw	[%l7 + %l5],	%i0
	sdivx	%l0,	0x1942,	%g1
	ldsw	[%l7 + 0x70],	%i2
	and	%g2,	0x1C2B,	%g5
	ld	[%l7 + 0x70],	%f30
	movle	%xcc,	%l2,	%g6
	movre	%o7,	%g7,	%l3
	edge16n	%o4,	%o2,	%l4
	fcmpne16	%f10,	%f14,	%g3
	movvs	%icc,	%o3,	%l5
	nop
	set	0x48, %o7
	std	%f28,	[%l7 + %o7]
	orn	%g4,	0x1CB9,	%i3
	fnegd	%f2,	%f10
	alignaddrl	%o1,	%l1,	%i6
	xnorcc	%i7,	0x0089,	%o5
	pdist	%f6,	%f2,	%f12
	fzero	%f24
	siam	0x5
	or	%i1,	%i4,	%o6
	and	%l6,	%o0,	%i0
	stb	%i5,	[%l7 + 0x11]
	nop
	set	0x19, %g5
	ldsb	[%l7 + %g5],	%g1
	movneg	%xcc,	%l0,	%g2
	srax	%i2,	%l2,	%g5
	fpsub16s	%f22,	%f23,	%f30
	movrlz	%o7,	0x230,	%g7
	fmovdge	%icc,	%f20,	%f8
	array16	%l3,	%o4,	%g6
	sra	%l4,	0x13,	%g3
	smul	%o3,	%l5,	%o2
	udiv	%g4,	0x0E9E,	%o1
	sra	%i3,	0x1C,	%i6
	sll	%i7,	0x16,	%o5
	fcmpeq16	%f2,	%f26,	%l1
	edge8ln	%i1,	%o6,	%i4
	ldsh	[%l7 + 0x60],	%o0
	fmovdle	%xcc,	%f21,	%f30
	ldd	[%l7 + 0x68],	%i6
	movcs	%xcc,	%i5,	%g1
	movrgz	%i0,	%l0,	%g2
	fmovrdgz	%i2,	%f16,	%f28
	move	%icc,	%l2,	%g5
	andn	%o7,	%l3,	%g7
	fcmpne16	%f24,	%f18,	%g6
	array8	%o4,	%l4,	%g3
	udivcc	%o3,	0x14F4,	%o2
	movge	%xcc,	%g4,	%l5
	fmovdleu	%xcc,	%f9,	%f20
	array16	%o1,	%i3,	%i7
	movleu	%xcc,	%o5,	%i6
	movg	%xcc,	%i1,	%l1
	sdiv	%o6,	0x074E,	%o0
	xor	%i4,	%i5,	%l6
	orcc	%g1,	%i0,	%g2
	movrne	%i2,	0x381,	%l0
	fnor	%f24,	%f10,	%f22
	ldsh	[%l7 + 0x2E],	%g5
	edge8ln	%o7,	%l3,	%g7
	fmovscs	%icc,	%f19,	%f23
	fmovdleu	%icc,	%f4,	%f16
	edge16l	%g6,	%o4,	%l2
	xnorcc	%l4,	%g3,	%o2
	fmovdcc	%icc,	%f25,	%f31
	fpsub16	%f10,	%f18,	%f12
	movn	%xcc,	%o3,	%g4
	movvs	%icc,	%l5,	%i3
	edge16l	%o1,	%i7,	%o5
	xnorcc	%i6,	0x1995,	%l1
	movle	%icc,	%o6,	%i1
	addc	%o0,	%i4,	%l6
	stb	%i5,	[%l7 + 0x65]
	fandnot2s	%f9,	%f19,	%f29
	lduh	[%l7 + 0x7C],	%i0
	movneg	%icc,	%g2,	%g1
	movcc	%icc,	%i2,	%g5
	fmovrdlz	%l0,	%f14,	%f20
	ldd	[%l7 + 0x10],	%o6
	xor	%l3,	0x166C,	%g7
	sub	%g6,	%o4,	%l2
	umul	%l4,	%o2,	%g3
	mova	%xcc,	%o3,	%g4
	sdiv	%i3,	0x10C5,	%l5
	ldsw	[%l7 + 0x24],	%i7
	edge32	%o5,	%i6,	%o1
	edge32	%o6,	%l1,	%o0
	ld	[%l7 + 0x7C],	%f21
	umulcc	%i1,	0x03B8,	%l6
	umulcc	%i4,	0x14F5,	%i5
	subccc	%i0,	0x0699,	%g2
	sdiv	%g1,	0x04C2,	%i2
	stw	%g5,	[%l7 + 0x10]
	edge8	%l0,	%o7,	%l3
	nop
	set	0x60, %i0
	ldsw	[%l7 + %i0],	%g7
	sdivcc	%o4,	0x1545,	%g6
	movrgz	%l4,	0x25A,	%o2
	edge32n	%l2,	%o3,	%g4
	edge16n	%i3,	%g3,	%i7
	xor	%l5,	%o5,	%i6
	array8	%o6,	%l1,	%o0
	ldub	[%l7 + 0x70],	%i1
	fornot1s	%f23,	%f0,	%f29
	fmuld8ulx16	%f15,	%f31,	%f22
	save %l6, %i4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i0,	%g2,	%g1
	movneg	%xcc,	%i2,	%o1
	sir	0x15F5
	edge16ln	%g5,	%o7,	%l0
	movne	%icc,	%l3,	%o4
	edge32	%g6,	%g7,	%o2
	fmul8sux16	%f28,	%f30,	%f0
	movvc	%xcc,	%l2,	%o3
	umulcc	%g4,	0x08D7,	%i3
	stb	%g3,	[%l7 + 0x2B]
	fandnot1s	%f13,	%f21,	%f5
	lduh	[%l7 + 0x30],	%l4
	stb	%l5,	[%l7 + 0x16]
	stb	%i7,	[%l7 + 0x4F]
	edge32n	%i6,	%o6,	%l1
	array8	%o0,	%i1,	%o5
	ldd	[%l7 + 0x10],	%f6
	fzero	%f30
	ldub	[%l7 + 0x0E],	%i4
	movg	%icc,	%i5,	%i0
	movrlz	%l6,	%g2,	%g1
	sll	%o1,	%i2,	%g5
	sll	%l0,	0x04,	%o7
	ldub	[%l7 + 0x6A],	%l3
	srl	%o4,	%g7,	%g6
	fmovdvs	%icc,	%f16,	%f5
	lduh	[%l7 + 0x46],	%l2
	subc	%o2,	%o3,	%i3
	ldsb	[%l7 + 0x5E],	%g3
	movne	%icc,	%l4,	%l5
	lduw	[%l7 + 0x20],	%g4
	restore %i6, %o6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o0,	%i1,	%o5
	edge32	%i7,	%i5,	%i0
	addccc	%l6,	0x11C6,	%i4
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	movne	%icc,	%g2,	%i2
	movvs	%xcc,	%l0,	%o7
	lduw	[%l7 + 0x4C],	%g5
	movrlez	%o4,	0x092,	%l3
	andn	%g6,	%l2,	%o2
	ldd	[%l7 + 0x40],	%g6
	alignaddrl	%o3,	%g3,	%i3
	fcmped	%fcc2,	%f12,	%f2
	udiv	%l5,	0x185B,	%l4
	mulx	%i6,	%o6,	%g4
	srax	%o0,	0x09,	%i1
	movpos	%icc,	%o5,	%i7
	move	%xcc,	%l1,	%i0
	sra	%l6,	0x0D,	%i5
	srl	%i4,	%g1,	%o1
	or	%g2,	0x1FA9,	%l0
	ld	[%l7 + 0x28],	%f8
	fxnors	%f0,	%f26,	%f11
	orn	%o7,	0x09BD,	%i2
	alignaddrl	%g5,	%l3,	%g6
	ldub	[%l7 + 0x35],	%l2
	edge8	%o4,	%g7,	%o2
	movg	%icc,	%g3,	%o3
	fpsub16	%f30,	%f20,	%f16
	sra	%l5,	0x19,	%l4
	sdivx	%i3,	0x1E53,	%o6
	smulcc	%g4,	%i6,	%o0
	edge16	%i1,	%o5,	%l1
	andn	%i7,	%l6,	%i5
	fmovsn	%icc,	%f27,	%f26
	and	%i4,	0x0913,	%g1
	subcc	%i0,	0x0B02,	%g2
	movne	%xcc,	%o1,	%o7
	andn	%i2,	%g5,	%l3
	edge16n	%g6,	%l0,	%o4
	udivcc	%l2,	0x1BE5,	%o2
	movg	%xcc,	%g7,	%g3
	movre	%l5,	%l4,	%i3
	mulscc	%o6,	0x1D05,	%o3
	movn	%icc,	%i6,	%g4
	andncc	%i1,	%o5,	%o0
	alignaddr	%l1,	%l6,	%i5
	st	%f3,	[%l7 + 0x28]
	subccc	%i7,	%i4,	%i0
	fmovrdne	%g1,	%f22,	%f26
	std	%f28,	[%l7 + 0x18]
	movge	%icc,	%o1,	%o7
	fmovsle	%xcc,	%f12,	%f18
	array16	%g2,	%i2,	%l3
	orn	%g6,	0x0055,	%g5
	udiv	%l0,	0x0881,	%o4
	array32	%o2,	%g7,	%l2
	fmovrsgez	%l5,	%f28,	%f21
	fmovsvc	%icc,	%f11,	%f6
	orn	%g3,	%l4,	%o6
	movrlez	%i3,	%i6,	%o3
	fpsub32	%f20,	%f20,	%f22
	stb	%g4,	[%l7 + 0x63]
	edge16ln	%i1,	%o5,	%o0
	edge8ln	%l1,	%l6,	%i5
	movneg	%xcc,	%i7,	%i4
	smulcc	%i0,	0x1B42,	%g1
	srlx	%o7,	%o1,	%i2
	and	%l3,	%g6,	%g5
	fmul8x16al	%f22,	%f13,	%f22
	fsrc2s	%f13,	%f29
	srlx	%l0,	%o4,	%g2
	movleu	%xcc,	%g7,	%l2
	move	%icc,	%l5,	%g3
	sdivx	%o2,	0x0A11,	%o6
	movn	%xcc,	%i3,	%i6
	fexpand	%f7,	%f0
	udiv	%o3,	0x0FB9,	%g4
	fabsd	%f24,	%f16
	edge16n	%l4,	%o5,	%i1
	ld	[%l7 + 0x78],	%f4
	addc	%l1,	%l6,	%o0
	fcmpes	%fcc2,	%f5,	%f2
	stw	%i7,	[%l7 + 0x38]
	movg	%xcc,	%i5,	%i4
	siam	0x2
	edge16l	%i0,	%g1,	%o1
	edge8	%i2,	%o7,	%g6
	andn	%l3,	0x1D21,	%l0
	orncc	%o4,	%g5,	%g7
	fpsub16	%f18,	%f26,	%f16
	or	%l2,	0x053C,	%g2
	movpos	%icc,	%l5,	%o2
	andncc	%g3,	%i3,	%i6
	lduw	[%l7 + 0x6C],	%o3
	popc	0x0DF7,	%o6
	movvc	%icc,	%g4,	%l4
	fmovdleu	%icc,	%f15,	%f28
	fand	%f24,	%f20,	%f16
	addcc	%o5,	0x0805,	%i1
	movpos	%icc,	%l6,	%l1
	fmovrdlez	%i7,	%f22,	%f22
	siam	0x4
	movleu	%icc,	%o0,	%i5
	xnorcc	%i0,	%i4,	%o1
	ld	[%l7 + 0x5C],	%f24
	sdivx	%g1,	0x00D6,	%o7
	array16	%i2,	%l3,	%g6
	ld	[%l7 + 0x18],	%f1
	edge32	%l0,	%o4,	%g7
	mulscc	%l2,	0x0302,	%g5
	nop
	set	0x5E, %g1
	ldsb	[%l7 + %g1],	%l5
	faligndata	%f26,	%f14,	%f16
	fpsub32s	%f1,	%f30,	%f2
	edge8	%o2,	%g2,	%g3
	sra	%i6,	0x0B,	%i3
	fmovdneg	%icc,	%f25,	%f30
	fmovsneg	%icc,	%f17,	%f25
	fnegd	%f10,	%f22
	ldd	[%l7 + 0x68],	%f12
	ldub	[%l7 + 0x40],	%o3
	movrne	%g4,	0x318,	%l4
	fnands	%f8,	%f7,	%f0
	srax	%o5,	%i1,	%o6
	umulcc	%l6,	0x0AE9,	%i7
	sra	%o0,	%l1,	%i0
	lduh	[%l7 + 0x20],	%i4
	edge8n	%o1,	%g1,	%o7
	or	%i2,	%i5,	%g6
	fmovrdlz	%l3,	%f18,	%f8
	sub	%o4,	0x089B,	%g7
	fmovdn	%xcc,	%f26,	%f12
	movgu	%xcc,	%l2,	%g5
	stb	%l5,	[%l7 + 0x7E]
	movleu	%xcc,	%l0,	%g2
	movg	%icc,	%g3,	%o2
	udiv	%i3,	0x1A0E,	%i6
	movneg	%xcc,	%g4,	%o3
	stx	%o5,	[%l7 + 0x18]
	edge16ln	%i1,	%l4,	%l6
	srlx	%o6,	0x16,	%i7
	movrgez	%o0,	%l1,	%i4
	sethi	0x04AF,	%o1
	movvc	%xcc,	%i0,	%o7
	fmovdvs	%icc,	%f12,	%f4
	movg	%icc,	%i2,	%i5
	addc	%g6,	0x1D81,	%l3
	sll	%o4,	%g1,	%g7
	subccc	%g5,	0x09D2,	%l5
	fone	%f10
	ldsb	[%l7 + 0x22],	%l0
	ldsh	[%l7 + 0x50],	%l2
	movleu	%icc,	%g3,	%g2
	movl	%xcc,	%o2,	%i6
	orcc	%i3,	%o3,	%o5
	ldd	[%l7 + 0x58],	%f30
	fmovdl	%xcc,	%f21,	%f30
	fornot1s	%f23,	%f30,	%f22
	st	%f15,	[%l7 + 0x64]
	ld	[%l7 + 0x48],	%f11
	orncc	%i1,	0x0336,	%l4
	stb	%g4,	[%l7 + 0x5B]
	edge16n	%o6,	%i7,	%o0
	edge8l	%l6,	%i4,	%l1
	move	%xcc,	%o1,	%i0
	ldx	[%l7 + 0x30],	%i2
	siam	0x6
	edge32	%i5,	%o7,	%l3
	movneg	%xcc,	%g6,	%o4
	sdivcc	%g7,	0x0221,	%g1
	xor	%g5,	%l0,	%l5
	fmovrslz	%g3,	%f31,	%f31
	fxnor	%f6,	%f18,	%f20
	popc	%l2,	%g2
	srlx	%i6,	0x02,	%i3
	fands	%f19,	%f2,	%f26
	edge16	%o3,	%o2,	%o5
	stx	%i1,	[%l7 + 0x28]
	subc	%l4,	0x140C,	%o6
	movgu	%icc,	%g4,	%o0
	orncc	%i7,	%l6,	%i4
	udivcc	%l1,	0x15A8,	%i0
	srl	%o1,	%i5,	%i2
	fmovd	%f30,	%f16
	nop
	set	0x3C, %i7
	stw	%l3,	[%l7 + %i7]
	andn	%o7,	0x0412,	%g6
	orcc	%o4,	%g1,	%g5
	stx	%g7,	[%l7 + 0x78]
	edge16	%l5,	%g3,	%l2
	xnorcc	%g2,	%i6,	%l0
	move	%xcc,	%i3,	%o2
	addcc	%o5,	%o3,	%l4
	subc	%i1,	0x1E93,	%g4
	movrne	%o6,	0x2A9,	%i7
	ldd	[%l7 + 0x78],	%o0
	ldx	[%l7 + 0x08],	%i4
	sllx	%l1,	%l6,	%o1
	movn	%icc,	%i0,	%i2
	orn	%l3,	%o7,	%i5
	and	%g6,	%g1,	%o4
	edge8ln	%g5,	%g7,	%g3
	orn	%l5,	0x0EA8,	%g2
	sra	%l2,	%l0,	%i3
	movcs	%xcc,	%i6,	%o2
	orcc	%o3,	%o5,	%l4
	smul	%g4,	%i1,	%o6
	addcc	%o0,	%i4,	%i7
	stb	%l6,	[%l7 + 0x56]
	srlx	%o1,	0x18,	%i0
	fcmped	%fcc2,	%f20,	%f24
	edge8n	%l1,	%l3,	%i2
	alignaddr	%o7,	%g6,	%g1
	ldsw	[%l7 + 0x08],	%i5
	ldx	[%l7 + 0x10],	%g5
	sdivx	%o4,	0x0464,	%g3
	ldsh	[%l7 + 0x10],	%l5
	sethi	0x1A74,	%g7
	edge16l	%l2,	%g2,	%i3
	edge32ln	%i6,	%l0,	%o2
	save %o5, %o3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g4,	0x0536,	%i1
	sdiv	%o6,	0x02B2,	%i4
	array32	%i7,	%o0,	%o1
	movge	%icc,	%i0,	%l1
	popc	0x0723,	%l6
	st	%f25,	[%l7 + 0x60]
	fnot1	%f22,	%f26
	nop
	set	0x12, %o6
	sth	%l3,	[%l7 + %o6]
	movgu	%xcc,	%i2,	%o7
	addc	%g6,	0x0E63,	%i5
	edge8ln	%g1,	%o4,	%g3
	popc	0x08BC,	%g5
	fmovdl	%xcc,	%f30,	%f14
	sdivcc	%l5,	0x1370,	%g7
	faligndata	%f30,	%f24,	%f4
	stx	%l2,	[%l7 + 0x78]
	fmovdcc	%icc,	%f2,	%f4
	andncc	%i3,	%i6,	%g2
	fmovrse	%l0,	%f21,	%f6
	movrlez	%o2,	0x14A,	%o3
	andn	%o5,	%l4,	%g4
	save %i1, 0x1431, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f10,	[%l7 + 0x50]
	edge16l	%o6,	%o0,	%i7
	movrlz	%o1,	0x042,	%i0
	fmovdne	%icc,	%f29,	%f5
	ldsh	[%l7 + 0x2A],	%l6
	and	%l3,	%i2,	%o7
	fands	%f18,	%f8,	%f1
	fornot2	%f2,	%f12,	%f26
	alignaddr	%g6,	%i5,	%g1
	ldsb	[%l7 + 0x25],	%l1
	fmul8x16al	%f21,	%f25,	%f24
	movvc	%xcc,	%o4,	%g5
	sllx	%l5,	0x1A,	%g7
	fmovsg	%xcc,	%f18,	%f19
	edge32ln	%l2,	%g3,	%i3
	srax	%i6,	0x0A,	%l0
	fones	%f7
	fxnors	%f29,	%f10,	%f27
	edge16l	%g2,	%o3,	%o2
	mulscc	%o5,	%g4,	%i1
	fpadd16	%f30,	%f18,	%f18
	orcc	%l4,	%o6,	%i4
	edge16ln	%i7,	%o1,	%i0
	lduw	[%l7 + 0x68],	%o0
	sll	%l3,	%l6,	%o7
	edge16ln	%i2,	%g6,	%i5
	ldub	[%l7 + 0x3E],	%g1
	ld	[%l7 + 0x44],	%f26
	array16	%o4,	%l1,	%g5
	fcmpes	%fcc3,	%f8,	%f5
	edge32l	%g7,	%l2,	%l5
	fmuld8sux16	%f17,	%f11,	%f0
	movl	%xcc,	%g3,	%i6
	movrne	%i3,	0x110,	%l0
	fmovda	%icc,	%f26,	%f0
	array16	%o3,	%o2,	%g2
	orncc	%o5,	%i1,	%g4
	udivcc	%l4,	0x0261,	%i4
	fxor	%f20,	%f10,	%f30
	sllx	%i7,	0x0B,	%o6
	pdist	%f12,	%f8,	%f22
	fnegd	%f6,	%f2
	mulx	%o1,	0x19CA,	%o0
	fmovde	%icc,	%f8,	%f10
	fpsub16s	%f22,	%f11,	%f4
	fmovsneg	%icc,	%f21,	%f4
	movge	%xcc,	%i0,	%l3
	fxnors	%f15,	%f11,	%f5
	lduw	[%l7 + 0x28],	%o7
	smul	%i2,	0x0AAB,	%g6
	subcc	%l6,	%i5,	%o4
	movgu	%icc,	%l1,	%g1
	andn	%g7,	0x1CA5,	%l2
	mulscc	%l5,	0x08F4,	%g3
	save %g5, %i3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%o3
	add	%i6,	0x1ABB,	%g2
	st	%f16,	[%l7 + 0x44]
	movleu	%xcc,	%o2,	%i1
	array32	%g4,	%o5,	%l4
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%i4
	sir	0x075F
	andn	%o6,	0x0479,	%o1
	ldsh	[%l7 + 0x5E],	%o0
	mova	%icc,	%i0,	%i7
	subcc	%l3,	0x13BC,	%i2
	sir	0x1A0E
	move	%xcc,	%g6,	%l6
	edge32n	%o7,	%i5,	%o4
	fmovse	%icc,	%f23,	%f24
	edge16ln	%l1,	%g7,	%g1
	srl	%l2,	%l5,	%g5
	ldd	[%l7 + 0x20],	%g2
	fmovsleu	%xcc,	%f0,	%f11
	array32	%i3,	%o3,	%l0
	movleu	%xcc,	%i6,	%g2
	xnorcc	%i1,	%o2,	%g4
	sdivcc	%l4,	0x1ED1,	%i4
	nop
	set	0x61, %g7
	ldsb	[%l7 + %g7],	%o6
	array16	%o5,	%o0,	%i0
	fmovsgu	%icc,	%f28,	%f20
	sub	%o1,	%i7,	%i2
	smul	%g6,	%l3,	%l6
	fnand	%f10,	%f30,	%f26
	ldd	[%l7 + 0x70],	%o6
	fmovrdgz	%i5,	%f22,	%f12
	ldd	[%l7 + 0x60],	%l0
	subccc	%o4,	0x06FE,	%g7
	movrgz	%g1,	%l5,	%g5
	alignaddrl	%l2,	%i3,	%o3
	sdivcc	%l0,	0x1976,	%g3
	nop
	set	0x78, %o4
	lduh	[%l7 + %o4],	%g2
	popc	0x0618,	%i6
	fcmps	%fcc0,	%f16,	%f6
	movrlz	%o2,	0x296,	%i1
	xor	%l4,	0x0329,	%i4
	fnot2	%f22,	%f26
	fmovrse	%o6,	%f24,	%f24
	movrne	%g4,	%o0,	%o5
	movvc	%xcc,	%i0,	%o1
	andn	%i2,	%i7,	%g6
	edge32	%l3,	%l6,	%o7
	movl	%icc,	%i5,	%o4
	fpack16	%f10,	%f30
	sth	%g7,	[%l7 + 0x08]
	lduw	[%l7 + 0x7C],	%g1
	array32	%l5,	%g5,	%l2
	srax	%l1,	%i3,	%o3
	ldx	[%l7 + 0x10],	%g3
	ldsw	[%l7 + 0x74],	%l0
	st	%f24,	[%l7 + 0x6C]
	addc	%i6,	0x0840,	%g2
	addc	%i1,	0x022B,	%o2
	fandnot2s	%f8,	%f7,	%f24
	movrlez	%l4,	%i4,	%o6
	umul	%g4,	0x1A29,	%o5
	orn	%o0,	0x0DED,	%i0
	stb	%i2,	[%l7 + 0x75]
	umulcc	%i7,	0x0B93,	%o1
	stb	%l3,	[%l7 + 0x26]
	edge8l	%l6,	%o7,	%i5
	andn	%g6,	%g7,	%g1
	andcc	%o4,	%l5,	%g5
	fmovdl	%icc,	%f14,	%f5
	lduh	[%l7 + 0x16],	%l1
	movg	%xcc,	%l2,	%i3
	sub	%o3,	%g3,	%l0
	ld	[%l7 + 0x24],	%f22
	fmovrsgez	%i6,	%f31,	%f30
	subccc	%g2,	0x177F,	%i1
	sethi	0x0464,	%o2
	alignaddr	%i4,	%l4,	%o6
	sdiv	%g4,	0x1D2D,	%o5
	fmovdgu	%icc,	%f24,	%f0
	movgu	%xcc,	%i0,	%i2
	edge16	%o0,	%o1,	%i7
	edge32l	%l3,	%l6,	%o7
	fabsd	%f8,	%f12
	edge32l	%i5,	%g7,	%g6
	edge32l	%g1,	%l5,	%g5
	fand	%f0,	%f0,	%f16
	std	%f14,	[%l7 + 0x78]
	fpadd32s	%f16,	%f27,	%f8
	subcc	%l1,	%l2,	%i3
	mova	%xcc,	%o3,	%g3
	orcc	%o4,	%l0,	%g2
	sdivcc	%i1,	0x0DCA,	%o2
	edge16l	%i4,	%i6,	%l4
	lduh	[%l7 + 0x68],	%o6
	mova	%xcc,	%g4,	%i0
	ldd	[%l7 + 0x20],	%f12
	orcc	%o5,	%o0,	%i2
	fmovs	%f12,	%f5
	movre	%i7,	0x1BF,	%o1
	fabss	%f10,	%f23
	udiv	%l6,	0x14A7,	%o7
	edge8ln	%i5,	%g7,	%g6
	edge16l	%l3,	%l5,	%g5
	ldd	[%l7 + 0x40],	%f16
	udivcc	%g1,	0x1C47,	%l2
	fcmpgt16	%f14,	%f28,	%l1
	move	%xcc,	%i3,	%o3
	fcmple32	%f12,	%f8,	%g3
	ldsb	[%l7 + 0x62],	%l0
	array32	%g2,	%i1,	%o4
	sth	%i4,	[%l7 + 0x4E]
	alignaddr	%i6,	%o2,	%l4
	addcc	%o6,	0x1C9F,	%g4
	xorcc	%o5,	0x1612,	%o0
	sethi	0x1E55,	%i2
	xorcc	%i7,	0x07AD,	%i0
	ldx	[%l7 + 0x50],	%o1
	udivx	%l6,	0x1699,	%i5
	fmovdvs	%icc,	%f3,	%f7
	fmovsne	%icc,	%f22,	%f25
	fmul8x16al	%f11,	%f0,	%f28
	sll	%g7,	%o7,	%l3
	ldd	[%l7 + 0x28],	%f30
	andcc	%l5,	0x0572,	%g6
	sethi	0x1824,	%g1
	edge32	%g5,	%l2,	%i3
	addccc	%l1,	%o3,	%l0
	fandnot2s	%f7,	%f17,	%f21
	addccc	%g3,	0x0ABC,	%i1
	restore %g2, 0x05B7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%i6,	%f4,	%f30
	sub	%i4,	%l4,	%o6
	fandnot1	%f30,	%f30,	%f6
	lduh	[%l7 + 0x64],	%g4
	udivcc	%o2,	0x062E,	%o5
	ldd	[%l7 + 0x10],	%i2
	ldsw	[%l7 + 0x10],	%i7
	subcc	%i0,	0x16FA,	%o0
	edge16n	%l6,	%i5,	%o1
	edge16l	%o7,	%l3,	%g7
	alignaddr	%l5,	%g6,	%g5
	movvc	%xcc,	%g1,	%i3
	ldd	[%l7 + 0x48],	%f20
	srax	%l1,	0x06,	%l2
	stw	%o3,	[%l7 + 0x34]
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	movrne	%g2,	%o4,	%i1
	stw	%i6,	[%l7 + 0x08]
	movrlez	%l4,	%i4,	%o6
	movre	%o2,	%o5,	%g4
	ldd	[%l7 + 0x60],	%i6
	edge16	%i0,	%i2,	%l6
	edge8n	%i5,	%o0,	%o1
	ldsb	[%l7 + 0x6D],	%o7
	movne	%icc,	%l3,	%l5
	fandnot1	%f10,	%f0,	%f28
	array32	%g7,	%g6,	%g5
	xnor	%i3,	0x1B83,	%l1
	edge32n	%l2,	%g1,	%o3
	fcmpgt32	%f10,	%f0,	%l0
	smul	%g2,	%g3,	%o4
	movrgez	%i1,	%i6,	%l4
	ldd	[%l7 + 0x68],	%f16
	ldsh	[%l7 + 0x66],	%i4
	udiv	%o2,	0x1FB7,	%o6
	movgu	%icc,	%g4,	%o5
	fmovsge	%xcc,	%f16,	%f21
	movg	%icc,	%i0,	%i7
	xnor	%l6,	0x16DE,	%i2
	or	%i5,	%o0,	%o7
	fpadd16s	%f27,	%f27,	%f6
	fmovsge	%icc,	%f10,	%f19
	fzero	%f18
	ldub	[%l7 + 0x70],	%l3
	movvc	%xcc,	%o1,	%l5
	fmovrsgz	%g7,	%f10,	%f1
	fpadd32s	%f14,	%f28,	%f24
	alignaddr	%g6,	%g5,	%i3
	movle	%xcc,	%l1,	%g1
	edge8ln	%o3,	%l0,	%g2
	fand	%f26,	%f22,	%f16
	umul	%g3,	0x13B5,	%o4
	or	%l2,	%i6,	%i1
	lduh	[%l7 + 0x36],	%l4
	fpmerge	%f21,	%f3,	%f26
	fmovdl	%icc,	%f26,	%f2
	smulcc	%o2,	0x1E34,	%o6
	movrlz	%g4,	%i4,	%i0
	edge16	%o5,	%i7,	%i2
	ldsb	[%l7 + 0x66],	%l6
	lduh	[%l7 + 0x3E],	%o0
	st	%f17,	[%l7 + 0x1C]
	movg	%icc,	%o7,	%i5
	fmovsne	%xcc,	%f26,	%f0
	subccc	%l3,	%l5,	%g7
	edge16	%g6,	%g5,	%o1
	fmul8x16al	%f16,	%f20,	%f0
	addcc	%l1,	0x0CA2,	%i3
	xor	%g1,	%o3,	%l0
	movgu	%xcc,	%g2,	%g3
	fmovspos	%xcc,	%f22,	%f6
	fmovda	%xcc,	%f6,	%f28
	fmovrdlz	%l2,	%f12,	%f10
	fmovsge	%icc,	%f0,	%f12
	save %i6, 0x00A3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i1,	%l4,	%o6
	sllx	%g4,	%i4,	%i0
	ldub	[%l7 + 0x4D],	%o2
	orncc	%i7,	0x1CC6,	%i2
	ldd	[%l7 + 0x70],	%o4
	bshuffle	%f22,	%f18,	%f8
	ldub	[%l7 + 0x3E],	%o0
	movcc	%icc,	%l6,	%o7
	fmovsl	%icc,	%f22,	%f18
	ldsh	[%l7 + 0x14],	%i5
	fmovdcs	%xcc,	%f9,	%f17
	popc	%l5,	%l3
	addccc	%g7,	%g5,	%o1
	ldsh	[%l7 + 0x0C],	%g6
	ldd	[%l7 + 0x08],	%f30
	fxor	%f26,	%f8,	%f2
	edge16n	%i3,	%l1,	%o3
	edge16l	%l0,	%g1,	%g3
	fmovrdgz	%l2,	%f28,	%f6
	umulcc	%i6,	%o4,	%i1
	xor	%l4,	%o6,	%g2
	or	%g4,	0x13D0,	%i0
	sir	0x01A6
	ldsw	[%l7 + 0x3C],	%o2
	movrgez	%i4,	0x372,	%i7
	edge32ln	%i2,	%o0,	%l6
	subcc	%o5,	0x1E54,	%o7
	subccc	%i5,	%l5,	%l3
	sth	%g7,	[%l7 + 0x34]
	fcmpne16	%f12,	%f8,	%o1
	sethi	0x0349,	%g5
	edge32n	%i3,	%g6,	%o3
	fcmpne16	%f4,	%f4,	%l1
	stb	%g1,	[%l7 + 0x18]
	sll	%l0,	%l2,	%g3
	fmovrsgez	%o4,	%f0,	%f21
	smul	%i1,	%l4,	%o6
	std	%f30,	[%l7 + 0x68]
	xnorcc	%g2,	%i6,	%g4
	fnand	%f6,	%f24,	%f8
	smulcc	%i0,	%o2,	%i7
	fmul8x16	%f14,	%f14,	%f12
	orcc	%i4,	0x0D67,	%i2
	mulscc	%o0,	%l6,	%o7
	udiv	%i5,	0x1C64,	%l5
	ldd	[%l7 + 0x10],	%l2
	array8	%g7,	%o1,	%g5
	fpsub16	%f24,	%f2,	%f24
	fmovrslez	%o5,	%f19,	%f31
	fsrc1	%f24,	%f30
	fmovdvs	%xcc,	%f21,	%f29
	fsrc1s	%f14,	%f21
	save %g6, 0x16B0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f6,	[%l7 + 0x40]
	umul	%i3,	%g1,	%l1
	mulx	%l2,	%l0,	%g3
	edge16n	%o4,	%i1,	%o6
	sir	0x1C83
	orn	%g2,	0x0BF6,	%l4
	fmovrsne	%g4,	%f31,	%f11
	or	%i0,	%o2,	%i6
	edge32	%i7,	%i4,	%i2
	edge16n	%o0,	%o7,	%l6
	subccc	%l5,	%i5,	%l3
	sdiv	%o1,	0x1A88,	%g5
	movleu	%xcc,	%o5,	%g7
	edge16	%g6,	%i3,	%o3
	movrne	%g1,	%l2,	%l1
	fornot1	%f6,	%f4,	%f28
	fmovrdlez	%g3,	%f12,	%f24
	sll	%l0,	0x0E,	%o4
	andcc	%i1,	%g2,	%l4
	sir	0x0324
	array8	%o6,	%g4,	%i0
	movge	%xcc,	%o2,	%i6
	srax	%i4,	%i7,	%o0
	fmovrslez	%o7,	%f18,	%f28
	fpsub16s	%f19,	%f14,	%f6
	ldsb	[%l7 + 0x4D],	%i2
	or	%l6,	0x0921,	%i5
	fmovsleu	%icc,	%f28,	%f21
	array8	%l5,	%l3,	%o1
	popc	%o5,	%g5
	edge16l	%g6,	%g7,	%o3
	nop
	set	0x44, %i5
	ldsh	[%l7 + %i5],	%g1
	fmovdleu	%xcc,	%f8,	%f15
	fmovdn	%xcc,	%f22,	%f9
	sdivx	%l2,	0x1990,	%i3
	lduh	[%l7 + 0x16],	%l1
	sir	0x132C
	fornot1s	%f19,	%f3,	%f4
	movrgz	%l0,	0x0B6,	%o4
	xnorcc	%g3,	0x00F6,	%g2
	fmul8x16	%f18,	%f28,	%f0
	edge16n	%l4,	%o6,	%i1
	mulx	%i0,	0x16B8,	%o2
	mulx	%g4,	%i4,	%i7
	umulcc	%o0,	0x1C38,	%o7
	array16	%i2,	%l6,	%i6
	umulcc	%i5,	%l5,	%l3
	addcc	%o1,	0x1476,	%o5
	fandnot1	%f18,	%f16,	%f22
	movl	%icc,	%g5,	%g6
	ldub	[%l7 + 0x2B],	%o3
	movrgz	%g1,	0x059,	%g7
	sll	%l2,	0x07,	%i3
	mova	%xcc,	%l1,	%o4
	movvc	%xcc,	%g3,	%l0
	or	%g2,	%l4,	%o6
	movre	%i1,	0x27D,	%o2
	addccc	%g4,	0x1457,	%i0
	udivx	%i7,	0x1156,	%i4
	edge16ln	%o7,	%i2,	%l6
	movrgez	%i6,	0x02A,	%i5
	stb	%l5,	[%l7 + 0x2B]
	fornot1s	%f4,	%f24,	%f12
	mulx	%o0,	%o1,	%o5
	smulcc	%g5,	0x085F,	%l3
	sethi	0x0AC6,	%g6
	fmovscc	%icc,	%f19,	%f27
	edge8	%g1,	%g7,	%o3
	lduw	[%l7 + 0x6C],	%l2
	sir	0x072B
	fmul8x16al	%f22,	%f15,	%f14
	sll	%i3,	%l1,	%o4
	ld	[%l7 + 0x70],	%f25
	pdist	%f4,	%f26,	%f26
	xor	%g3,	0x0A6A,	%g2
	udiv	%l4,	0x0947,	%l0
	fmovdg	%xcc,	%f8,	%f11
	ldsb	[%l7 + 0x27],	%o6
	lduw	[%l7 + 0x48],	%i1
	subccc	%o2,	0x1407,	%i0
	andncc	%i7,	%i4,	%o7
	xnor	%i2,	0x154F,	%g4
	array16	%l6,	%i6,	%l5
	movcc	%xcc,	%o0,	%o1
	addccc	%o5,	%g5,	%i5
	fsrc2	%f28,	%f24
	alignaddr	%l3,	%g1,	%g7
	fmovdleu	%xcc,	%f3,	%f0
	ldub	[%l7 + 0x3D],	%g6
	movrgez	%l2,	%o3,	%i3
	andncc	%l1,	%o4,	%g2
	edge16ln	%l4,	%g3,	%l0
	movcc	%icc,	%o6,	%i1
	movl	%icc,	%o2,	%i7
	movre	%i4,	%i0,	%i2
	nop
	set	0x10, %g6
	stx	%o7,	[%l7 + %g6]
	movvc	%xcc,	%g4,	%l6
	alignaddr	%i6,	%l5,	%o0
	movpos	%xcc,	%o5,	%o1
	movpos	%xcc,	%g5,	%l3
	stb	%i5,	[%l7 + 0x0C]
	array32	%g1,	%g6,	%g7
	edge32n	%l2,	%i3,	%o3
	edge32n	%l1,	%o4,	%l4
	edge16l	%g3,	%g2,	%l0
	movg	%xcc,	%o6,	%i1
	fzeros	%f29
	udivcc	%o2,	0x047A,	%i7
	ldx	[%l7 + 0x08],	%i4
	sdiv	%i2,	0x08E8,	%i0
	movrlz	%g4,	%o7,	%i6
	sllx	%l6,	0x0C,	%l5
	array16	%o0,	%o5,	%g5
	ldub	[%l7 + 0x6B],	%l3
	movl	%icc,	%o1,	%g1
	sir	0x1259
	sdiv	%i5,	0x0FC3,	%g7
	movvc	%xcc,	%g6,	%i3
	ld	[%l7 + 0x64],	%f16
	fmovrdne	%o3,	%f4,	%f22
	edge32	%l1,	%l2,	%o4
	udiv	%g3,	0x07B7,	%g2
	edge8n	%l0,	%o6,	%i1
	orn	%l4,	%i7,	%o2
	movne	%icc,	%i2,	%i0
	orcc	%g4,	%i4,	%o7
	stx	%l6,	[%l7 + 0x60]
	popc	0x1799,	%l5
	alignaddr	%o0,	%i6,	%g5
	ldsh	[%l7 + 0x30],	%o5
	ldd	[%l7 + 0x10],	%l2
	andcc	%g1,	%o1,	%g7
	mulscc	%g6,	%i3,	%o3
	edge8	%i5,	%l1,	%l2
	st	%f27,	[%l7 + 0x10]
	movleu	%xcc,	%o4,	%g2
	edge32n	%g3,	%o6,	%i1
	movcc	%xcc,	%l4,	%i7
	fpackfix	%f4,	%f11
	fmovrdne	%l0,	%f0,	%f20
	movneg	%icc,	%o2,	%i0
	sll	%i2,	0x1F,	%g4
	movrlez	%o7,	%i4,	%l6
	stw	%o0,	[%l7 + 0x68]
	subccc	%i6,	0x1BCB,	%l5
	movle	%icc,	%o5,	%g5
	lduh	[%l7 + 0x7A],	%g1
	sra	%l3,	0x03,	%g7
	xnorcc	%g6,	%o1,	%i3
	edge16ln	%o3,	%l1,	%i5
	edge8	%o4,	%g2,	%l2
	sth	%o6,	[%l7 + 0x42]
	ldsb	[%l7 + 0x60],	%g3
	fornot2s	%f22,	%f29,	%f11
	sethi	0x1022,	%l4
	lduh	[%l7 + 0x1C],	%i7
	movleu	%icc,	%i1,	%o2
	sll	%l0,	0x09,	%i2
	movgu	%xcc,	%g4,	%o7
	mulx	%i4,	0x0962,	%l6
	movg	%xcc,	%i0,	%o0
	fxor	%f16,	%f12,	%f4
	lduh	[%l7 + 0x34],	%l5
	fmovrsgez	%o5,	%f29,	%f16
	mova	%xcc,	%i6,	%g1
	edge32l	%g5,	%l3,	%g7
	fpsub16	%f8,	%f22,	%f0
	edge8ln	%o1,	%g6,	%o3
	sdivcc	%i3,	0x15BD,	%l1
	edge16	%i5,	%g2,	%l2
	fmovsgu	%icc,	%f10,	%f11
	orcc	%o6,	0x1B8A,	%o4
	st	%f10,	[%l7 + 0x24]
	alignaddr	%g3,	%i7,	%i1
	fmovsge	%icc,	%f23,	%f13
	edge8l	%l4,	%o2,	%i2
	alignaddrl	%l0,	%g4,	%i4
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o7
	edge32n	%i0,	%o0,	%l6
	fxnor	%f12,	%f18,	%f8
	array8	%o5,	%i6,	%g1
	edge32ln	%l5,	%g5,	%g7
	stb	%o1,	[%l7 + 0x38]
	movrgez	%l3,	0x1CA,	%o3
	movvc	%xcc,	%i3,	%g6
	edge8n	%l1,	%g2,	%l2
	sll	%o6,	%o4,	%g3
	ldd	[%l7 + 0x10],	%f20
	stb	%i7,	[%l7 + 0x3E]
	array16	%i1,	%i5,	%l4
	fmovsgu	%xcc,	%f10,	%f24
	fmovrdlz	%o2,	%f30,	%f6
	fmovdneg	%icc,	%f17,	%f10
	subc	%i2,	0x0D4B,	%l0
	lduw	[%l7 + 0x4C],	%g4
	stb	%i4,	[%l7 + 0x3B]
	srl	%o7,	%i0,	%o0
	fxnors	%f11,	%f0,	%f19
	and	%l6,	%o5,	%g1
	fexpand	%f23,	%f26
	movleu	%xcc,	%l5,	%i6
	movrlz	%g7,	0x266,	%g5
	subc	%o1,	%l3,	%i3
	edge8	%o3,	%l1,	%g2
	fxor	%f18,	%f6,	%f18
	edge32ln	%g6,	%l2,	%o6
	movrne	%o4,	0x2CE,	%g3
	sir	0x196F
	sllx	%i1,	%i7,	%i5
	fmovspos	%icc,	%f8,	%f17
	stw	%l4,	[%l7 + 0x60]
	fcmpeq32	%f30,	%f20,	%i2
	edge16n	%o2,	%l0,	%g4
	movcs	%xcc,	%i4,	%o7
	fmovdle	%xcc,	%f18,	%f6
	restore %i0, %o0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o5,	0x1090,	%g1
	edge8n	%i6,	%l5,	%g5
	fors	%f19,	%f5,	%f3
	srl	%g7,	0x1B,	%o1
	movrlz	%i3,	0x314,	%l3
	lduh	[%l7 + 0x42],	%l1
	movcs	%icc,	%g2,	%o3
	movre	%g6,	0x1D3,	%o6
	umul	%o4,	0x1F68,	%g3
	srlx	%i1,	%i7,	%i5
	fsrc1	%f0,	%f2
	fmovsgu	%icc,	%f28,	%f18
	add	%l4,	%i2,	%l2
	orn	%l0,	%o2,	%g4
	movl	%xcc,	%i4,	%o7
	add	%o0,	%i0,	%l6
	lduh	[%l7 + 0x18],	%o5
	edge32n	%g1,	%i6,	%g5
	smul	%g7,	0x17E0,	%o1
	subccc	%l5,	0x11C0,	%i3
	xorcc	%l3,	%g2,	%l1
	fcmpes	%fcc2,	%f20,	%f18
	lduw	[%l7 + 0x48],	%o3
	movvc	%icc,	%o6,	%o4
	mulscc	%g6,	%g3,	%i7
	lduh	[%l7 + 0x7C],	%i1
	edge32ln	%l4,	%i5,	%i2
	movrlz	%l0,	%o2,	%g4
	umul	%l2,	0x13FB,	%i4
	umul	%o0,	0x0E21,	%i0
	fnot2	%f10,	%f24
	movrgez	%l6,	%o5,	%o7
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fpmerge	%f3,	%f0,	%f28
	edge16n	%o1,	%g5,	%i3
	umul	%l3,	0x13DB,	%g2
	edge8ln	%l1,	%o3,	%l5
	popc	0x06CE,	%o4
	fcmpgt16	%f8,	%f22,	%o6
	fones	%f27
	fmovrslez	%g3,	%f15,	%f24
	movge	%xcc,	%i7,	%g6
	sra	%i1,	0x0E,	%l4
	sra	%i2,	0x11,	%l0
	udivx	%i5,	0x1F52,	%g4
	srax	%o2,	0x04,	%l2
	fpsub16s	%f9,	%f25,	%f12
	andcc	%o0,	0x1FB8,	%i4
	srlx	%i0,	0x00,	%o5
	array16	%l6,	%i6,	%g1
	movvc	%xcc,	%g7,	%o7
	mulscc	%o1,	%g5,	%i3
	fcmpgt32	%f2,	%f14,	%g2
	movvs	%icc,	%l1,	%l3
	movrgez	%o3,	%o4,	%o6
	smulcc	%l5,	0x0302,	%g3
	movrlez	%g6,	%i7,	%i1
	add	%i2,	%l0,	%l4
	ldub	[%l7 + 0x2A],	%i5
	ldsb	[%l7 + 0x4A],	%g4
	fpadd16s	%f1,	%f25,	%f29
	fmovsge	%icc,	%f14,	%f5
	subccc	%o2,	%l2,	%o0
	sub	%i4,	%i0,	%l6
	movcs	%xcc,	%i6,	%g1
	mova	%icc,	%g7,	%o7
	stw	%o1,	[%l7 + 0x44]
	add	%o5,	%i3,	%g5
	subc	%l1,	%l3,	%o3
	sub	%o4,	%g2,	%o6
	movne	%xcc,	%g3,	%l5
	fmovs	%f11,	%f20
	ldsb	[%l7 + 0x35],	%i7
	movrgz	%i1,	0x0D9,	%i2
	udivx	%g6,	0x10CB,	%l0
	movl	%xcc,	%i5,	%g4
	udiv	%o2,	0x1EBE,	%l4
	srlx	%l2,	%i4,	%i0
	mulscc	%l6,	%o0,	%i6
	ldd	[%l7 + 0x38],	%f4
	std	%f26,	[%l7 + 0x58]
	movleu	%xcc,	%g7,	%o7
	orcc	%o1,	%g1,	%o5
	fmovsa	%icc,	%f29,	%f3
	edge16ln	%i3,	%l1,	%g5
	fpack16	%f8,	%f24
	fabss	%f23,	%f23
	stx	%o3,	[%l7 + 0x18]
	sethi	0x1889,	%o4
	sth	%g2,	[%l7 + 0x14]
	movvs	%icc,	%l3,	%o6
	addcc	%g3,	0x12AD,	%i7
	movl	%xcc,	%l5,	%i1
	ldub	[%l7 + 0x51],	%g6
	edge16n	%l0,	%i2,	%g4
	array32	%o2,	%l4,	%i5
	fpack32	%f6,	%f16,	%f12
	fcmpne32	%f0,	%f4,	%i4
	andn	%i0,	%l6,	%l2
	stx	%i6,	[%l7 + 0x68]
	mulx	%g7,	0x1739,	%o7
	ld	[%l7 + 0x78],	%f29
	fmovda	%icc,	%f30,	%f8
	addccc	%o0,	%o1,	%o5
	ldub	[%l7 + 0x7A],	%i3
	subc	%l1,	0x0C87,	%g1
	std	%f2,	[%l7 + 0x48]
	fcmps	%fcc2,	%f20,	%f6
	fnot2	%f4,	%f28
	fmovsl	%icc,	%f20,	%f26
	fmovdle	%icc,	%f27,	%f21
	fand	%f14,	%f30,	%f16
	movrlz	%o3,	0x034,	%o4
	edge8n	%g5,	%l3,	%o6
	srax	%g3,	%i7,	%g2
	or	%l5,	%g6,	%l0
	movrlz	%i1,	0x064,	%g4
	xorcc	%o2,	0x11C7,	%l4
	subcc	%i5,	%i2,	%i4
	edge32	%l6,	%i0,	%i6
	srax	%g7,	%o7,	%o0
	fpmerge	%f31,	%f2,	%f4
	fmovsvs	%icc,	%f18,	%f19
	ldsw	[%l7 + 0x48],	%o1
	fpackfix	%f18,	%f1
	fmovscc	%xcc,	%f15,	%f29
	fpack32	%f14,	%f0,	%f18
	fmuld8sux16	%f28,	%f2,	%f6
	alignaddr	%o5,	%i3,	%l2
	lduh	[%l7 + 0x6C],	%l1
	and	%o3,	0x0DF7,	%o4
	edge16ln	%g1,	%g5,	%l3
	for	%f28,	%f18,	%f8
	edge32n	%g3,	%o6,	%i7
	fmovs	%f4,	%f12
	or	%g2,	0x09F7,	%g6
	edge8l	%l0,	%l5,	%i1
	movcs	%icc,	%g4,	%l4
	umul	%o2,	%i5,	%i2
	edge8	%l6,	%i0,	%i4
	subc	%i6,	0x03D7,	%o7
	fmovdn	%xcc,	%f29,	%f14
	save %o0, 0x08D4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x78],	%o1
	ldx	[%l7 + 0x50],	%i3
	sdivx	%o5,	0x00F2,	%l2
	movre	%o3,	0x09C,	%l1
	andcc	%o4,	0x0176,	%g1
	movleu	%icc,	%l3,	%g5
	movg	%icc,	%o6,	%g3
	edge32l	%g2,	%i7,	%g6
	andncc	%l5,	%i1,	%l0
	movpos	%xcc,	%l4,	%o2
	mulx	%i5,	0x17A2,	%i2
	mulscc	%g4,	%l6,	%i4
	fandnot2s	%f12,	%f23,	%f26
	orncc	%i6,	%o7,	%o0
	fpsub32s	%f5,	%f27,	%f27
	fornot1	%f18,	%f6,	%f10
	movrgz	%i0,	0x2B6,	%g7
	xnorcc	%i3,	%o5,	%l2
	andn	%o3,	0x08E4,	%o1
	movrlez	%o4,	0x21A,	%g1
	movcs	%icc,	%l1,	%g5
	movneg	%icc,	%l3,	%o6
	orncc	%g3,	0x1015,	%g2
	movneg	%xcc,	%g6,	%l5
	array8	%i1,	%i7,	%l0
	orncc	%l4,	%i5,	%i2
	sdivx	%g4,	0x00F2,	%l6
	edge32	%o2,	%i6,	%o7
	mulx	%i4,	%o0,	%g7
	save %i3, %o5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o3,	%o1,	%o4
	ldd	[%l7 + 0x70],	%g0
	addcc	%i0,	%g5,	%l3
	move	%icc,	%o6,	%l1
	sll	%g2,	%g6,	%g3
	fmovsg	%xcc,	%f22,	%f3
	array16	%i1,	%i7,	%l5
	fmovde	%xcc,	%f26,	%f18
	popc	%l0,	%i5
	movrgez	%i2,	%l4,	%g4
	movrgez	%o2,	%l6,	%o7
	movrlez	%i6,	0x21D,	%o0
	xnor	%g7,	%i3,	%i4
	movn	%icc,	%o5,	%o3
	edge8	%o1,	%o4,	%l2
	movneg	%xcc,	%i0,	%g5
	fxnor	%f30,	%f2,	%f12
	ldub	[%l7 + 0x26],	%l3
	sdivcc	%o6,	0x0838,	%g1
	fpsub16	%f16,	%f20,	%f18
	movge	%icc,	%g2,	%g6
	andn	%l1,	0x18E1,	%i1
	fmovdl	%icc,	%f17,	%f15
	sethi	0x02B2,	%g3
	smul	%l5,	%l0,	%i5
	andncc	%i7,	%i2,	%g4
	or	%o2,	0x175E,	%l6
	srlx	%l4,	%i6,	%o7
	add	%o0,	0x0FFA,	%g7
	lduh	[%l7 + 0x24],	%i4
	fsrc1s	%f27,	%f16
	restore %i3, 0x0D55, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f6,	%f8,	%f18
	popc	%o5,	%o4
	fmovse	%icc,	%f3,	%f27
	nop
	set	0x20, %i6
	std	%f6,	[%l7 + %i6]
	fmovrde	%l2,	%f6,	%f18
	move	%xcc,	%o1,	%i0
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%g4
	ldsw	[%l7 + 0x74],	%l3
	subcc	%g1,	%g2,	%o6
	mulx	%l1,	0x0461,	%g6
	edge8l	%g3,	%i1,	%l5
	movgu	%xcc,	%l0,	%i5
	ld	[%l7 + 0x60],	%f3
	movge	%xcc,	%i2,	%i7
	fnot2s	%f30,	%f12
	smulcc	%o2,	0x1E4E,	%g4
	fmovrslez	%l6,	%f26,	%f11
	save %l4, 0x1C01, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i6,	%g7
	movpos	%xcc,	%i4,	%i3
	edge32	%o3,	%o0,	%o4
	popc	0x16BF,	%o5
	edge32l	%l2,	%o1,	%g5
	movleu	%xcc,	%i0,	%g1
	sra	%l3,	0x13,	%o6
	mova	%xcc,	%l1,	%g6
	ld	[%l7 + 0x44],	%f7
	fnegs	%f14,	%f14
	andncc	%g2,	%g3,	%l5
	array16	%i1,	%l0,	%i5
	ldub	[%l7 + 0x50],	%i7
	sll	%i2,	%o2,	%l6
	edge8ln	%g4,	%l4,	%i6
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	fmovdle	%icc,	%f14,	%f24
	ldd	[%l7 + 0x50],	%f14
	movrgez	%o7,	%i3,	%o3
	movge	%xcc,	%o4,	%o5
	movne	%icc,	%l2,	%o0
	mulx	%o1,	%i0,	%g5
	mulx	%g1,	0x00CF,	%o6
	udivx	%l1,	0x17D4,	%l3
	udiv	%g2,	0x0515,	%g3
	umul	%l5,	%g6,	%l0
	sdivx	%i1,	0x1EC3,	%i5
	ldub	[%l7 + 0x5A],	%i2
	stb	%o2,	[%l7 + 0x21]
	fmovdle	%xcc,	%f3,	%f31
	edge8ln	%l6,	%g4,	%l4
	lduh	[%l7 + 0x3C],	%i7
	andcc	%i6,	0x0240,	%i4
	andn	%o7,	%g7,	%o3
	edge8	%o4,	%o5,	%i3
	movle	%icc,	%o0,	%l2
	fxnors	%f1,	%f25,	%f21
	addccc	%o1,	0x1E56,	%g5
	edge16	%i0,	%g1,	%o6
	movrgez	%l3,	0x373,	%g2
	movge	%icc,	%l1,	%l5
	fxors	%f12,	%f13,	%f10
	smulcc	%g6,	%l0,	%g3
	fmovscc	%xcc,	%f0,	%f20
	subc	%i1,	0x1FB8,	%i5
	fnot2s	%f9,	%f23
	udiv	%o2,	0x0D77,	%l6
	movgu	%xcc,	%g4,	%i2
	or	%i7,	%l4,	%i6
	smulcc	%i4,	%o7,	%o3
	ldsw	[%l7 + 0x6C],	%g7
	sir	0x19D9
	movrlz	%o5,	0x261,	%i3
	edge32	%o0,	%l2,	%o1
	fmovdneg	%icc,	%f5,	%f29
	edge16l	%g5,	%o4,	%i0
	subc	%g1,	0x0B8F,	%o6
	alignaddrl	%l3,	%l1,	%l5
	udivx	%g2,	0x04A3,	%g6
	restore %g3, %i1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i5,	%l6,	%g4
	std	%f4,	[%l7 + 0x40]
	lduh	[%l7 + 0x58],	%i2
	fandnot1	%f12,	%f26,	%f26
	orn	%i7,	%o2,	%i6
	popc	%l4,	%i4
	fmovsn	%xcc,	%f16,	%f5
	fxnors	%f23,	%f7,	%f17
	fcmps	%fcc3,	%f11,	%f15
	array8	%o7,	%o3,	%o5
	edge8	%i3,	%g7,	%l2
	movcs	%icc,	%o0,	%o1
	sth	%o4,	[%l7 + 0x5C]
	stw	%i0,	[%l7 + 0x64]
	move	%xcc,	%g1,	%o6
	umulcc	%l3,	%g5,	%l5
	edge32	%g2,	%l1,	%g3
	srlx	%i1,	0x13,	%g6
	edge32	%l0,	%l6,	%i5
	srlx	%i2,	%g4,	%i7
	alignaddrl	%i6,	%l4,	%o2
	edge16ln	%i4,	%o7,	%o5
	fmovdvc	%icc,	%f28,	%f2
	subcc	%i3,	0x0834,	%g7
	edge32l	%l2,	%o0,	%o3
	movne	%icc,	%o4,	%i0
	srax	%o1,	0x09,	%o6
	smul	%l3,	%g5,	%l5
	andcc	%g1,	0x091B,	%g2
	movrlez	%g3,	%l1,	%i1
	movle	%icc,	%l0,	%l6
	xnorcc	%i5,	0x04A4,	%i2
	ldd	[%l7 + 0x18],	%g4
	edge32	%i7,	%i6,	%g6
	fcmpgt16	%f26,	%f22,	%o2
	fcmpeq32	%f24,	%f12,	%i4
	or	%l4,	0x0A90,	%o5
	movrne	%o7,	0x11B,	%i3
	edge8ln	%l2,	%o0,	%g7
	addc	%o3,	%i0,	%o1
	movge	%icc,	%o4,	%o6
	edge32	%l3,	%l5,	%g1
	fmovrse	%g2,	%f24,	%f14
	ldub	[%l7 + 0x45],	%g5
	ld	[%l7 + 0x18],	%f29
	movne	%xcc,	%l1,	%i1
	save %g3, 0x1395, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f7,	%f3,	%f23
	xorcc	%l6,	%i2,	%g4
	movg	%icc,	%i7,	%i6
	ldub	[%l7 + 0x54],	%g6
	ldd	[%l7 + 0x58],	%f22
	save %o2, %i4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0B05
	subccc	%o5,	%l4,	%i3
	movl	%icc,	%l2,	%o7
	sdivcc	%g7,	0x09BF,	%o0
	and	%i0,	0x0F06,	%o3
	ld	[%l7 + 0x10],	%f22
	srax	%o4,	0x02,	%o1
	udivcc	%o6,	0x1D79,	%l5
	xnor	%l3,	%g1,	%g5
	andn	%g2,	0x1470,	%l1
	movrgez	%i1,	0x0FF,	%l0
	fcmpeq16	%f4,	%f0,	%l6
	orn	%g3,	0x10BB,	%i2
	sllx	%i7,	0x1C,	%i6
	movcs	%xcc,	%g4,	%g6
	movneg	%icc,	%o2,	%i4
	fnot1	%f10,	%f14
	sll	%o5,	%i5,	%l4
	fmovdgu	%icc,	%f9,	%f11
	fpsub16	%f22,	%f16,	%f24
	fmovdl	%xcc,	%f5,	%f6
	fmovdpos	%icc,	%f20,	%f0
	fmovse	%xcc,	%f6,	%f9
	fmovdleu	%xcc,	%f23,	%f29
	movgu	%icc,	%i3,	%o7
	fexpand	%f2,	%f14
	move	%icc,	%g7,	%o0
	fpadd32s	%f27,	%f27,	%f26
	stw	%i0,	[%l7 + 0x24]
	edge8ln	%o3,	%o4,	%o1
	mulx	%l2,	0x0ED0,	%o6
	fnot2	%f2,	%f24
	sll	%l5,	0x1E,	%l3
	std	%f10,	[%l7 + 0x38]
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	stw	%l1,	[%l7 + 0x5C]
	ldsw	[%l7 + 0x74],	%i1
	sth	%l0,	[%l7 + 0x58]
	stw	%g3,	[%l7 + 0x08]
	and	%i2,	%i7,	%i6
	fmul8x16	%f9,	%f26,	%f0
	fmovdne	%xcc,	%f27,	%f27
	sll	%l6,	%g4,	%g6
	sdivcc	%o2,	0x0820,	%i4
	edge32l	%i5,	%l4,	%i3
	add	%o5,	0x1011,	%g7
	fmovsvs	%icc,	%f30,	%f21
	popc	%o7,	%o0
	movg	%icc,	%o3,	%o4
	orcc	%o1,	0x1EC9,	%i0
	andn	%o6,	0x14AE,	%l5
	umulcc	%l2,	%g1,	%g2
	edge16n	%g5,	%l3,	%l1
	orn	%l0,	%g3,	%i1
	fcmpne16	%f14,	%f8,	%i7
	orcc	%i6,	%i2,	%l6
	orn	%g6,	0x0CBF,	%o2
	sth	%g4,	[%l7 + 0x7A]
	sll	%i4,	0x00,	%i5
	nop
	set	0x78, %i3
	ldsw	[%l7 + %i3],	%i3
	alignaddr	%l4,	%g7,	%o7
	edge16ln	%o0,	%o3,	%o4
	fmovse	%xcc,	%f11,	%f29
	sdiv	%o1,	0x1148,	%o5
	alignaddrl	%i0,	%l5,	%l2
	orn	%o6,	%g1,	%g2
	edge32l	%l3,	%g5,	%l0
	fmovrde	%l1,	%f14,	%f6
	fnors	%f1,	%f21,	%f30
	lduh	[%l7 + 0x56],	%i1
	movvc	%xcc,	%g3,	%i7
	srlx	%i2,	0x0F,	%l6
	smulcc	%g6,	%i6,	%g4
	lduw	[%l7 + 0x20],	%o2
	ldsb	[%l7 + 0x56],	%i4
	sra	%i5,	0x0A,	%l4
	orncc	%g7,	%i3,	%o7
	faligndata	%f0,	%f8,	%f12
	fcmpd	%fcc2,	%f10,	%f26
	ldd	[%l7 + 0x70],	%f4
	orncc	%o3,	%o0,	%o4
	xnorcc	%o1,	0x05B1,	%i0
	alignaddr	%l5,	%l2,	%o6
	st	%f7,	[%l7 + 0x78]
	array16	%o5,	%g1,	%g2
	andcc	%g5,	0x16C2,	%l0
	st	%f20,	[%l7 + 0x54]
	fmovrdlez	%l1,	%f8,	%f2
	addcc	%i1,	0x0144,	%g3
	fcmpeq16	%f14,	%f2,	%i7
	fands	%f15,	%f11,	%f4
	fmovs	%f28,	%f18
	addcc	%i2,	0x1706,	%l3
	restore %l6, 0x0CA4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f18
	ldd	[%l7 + 0x08],	%f0
	std	%f24,	[%l7 + 0x48]
	fand	%f6,	%f16,	%f28
	sir	0x14F9
	fmovdg	%icc,	%f7,	%f15
	sir	0x0FED
	movg	%xcc,	%g4,	%g6
	lduh	[%l7 + 0x6C],	%o2
	fmovdle	%xcc,	%f7,	%f26
	fnot2s	%f5,	%f5
	ldsh	[%l7 + 0x62],	%i4
	edge16n	%i5,	%g7,	%i3
	sdiv	%o7,	0x061B,	%o3
	ldsb	[%l7 + 0x6E],	%l4
	srax	%o0,	0x08,	%o1
	ldsw	[%l7 + 0x78],	%i0
	movgu	%icc,	%o4,	%l2
	movg	%xcc,	%o6,	%l5
	sll	%o5,	0x18,	%g2
	array32	%g1,	%g5,	%l0
	alignaddr	%i1,	%l1,	%i7
	addccc	%i2,	0x07F6,	%g3
	movpos	%xcc,	%l3,	%i6
	edge8l	%g4,	%l6,	%o2
	mulscc	%g6,	%i5,	%g7
	stw	%i3,	[%l7 + 0x34]
	movrne	%i4,	0x0EF,	%o3
	addc	%l4,	%o0,	%o7
	fmovd	%f22,	%f24
	ldsb	[%l7 + 0x26],	%i0
	udiv	%o1,	0x1F00,	%l2
	nop
	set	0x18, %o0
	lduw	[%l7 + %o0],	%o4
	fmovsneg	%icc,	%f25,	%f15
	sethi	0x0B13,	%o6
	movrlz	%o5,	%l5,	%g2
	ldsb	[%l7 + 0x3E],	%g5
	ldx	[%l7 + 0x20],	%l0
	edge32n	%g1,	%i1,	%l1
	fpadd32	%f28,	%f2,	%f10
	addcc	%i2,	%i7,	%g3
	andn	%l3,	0x1291,	%i6
	lduw	[%l7 + 0x08],	%g4
	nop
	set	0x18, %l4
	stb	%o2,	[%l7 + %l4]
	edge16l	%g6,	%i5,	%l6
	edge16n	%g7,	%i3,	%o3
	sethi	0x0398,	%i4
	xorcc	%l4,	0x0980,	%o0
	addc	%o7,	%o1,	%i0
	nop
	set	0x54, %o1
	ldsw	[%l7 + %o1],	%o4
	fornot1	%f14,	%f30,	%f26
	stx	%l2,	[%l7 + 0x48]
	addccc	%o6,	%o5,	%l5
	movvc	%icc,	%g2,	%g5
	movge	%xcc,	%g1,	%i1
	srlx	%l1,	%i2,	%l0
	array32	%g3,	%i7,	%i6
	fmovsn	%icc,	%f13,	%f12
	fpadd32s	%f10,	%f5,	%f14
	fpsub32s	%f25,	%f20,	%f19
	edge8n	%g4,	%l3,	%g6
	addccc	%i5,	0x01B4,	%o2
	ldd	[%l7 + 0x68],	%g6
	movleu	%xcc,	%l6,	%o3
	movrlez	%i4,	0x030,	%l4
	pdist	%f30,	%f14,	%f12
	sll	%i3,	%o0,	%o7
	xnor	%o1,	%o4,	%i0
	mulx	%o6,	0x0399,	%o5
	alignaddrl	%l5,	%g2,	%l2
	stx	%g5,	[%l7 + 0x58]
	addc	%g1,	0x16F4,	%l1
	fcmple16	%f22,	%f14,	%i1
	movvs	%icc,	%l0,	%g3
	fmovscc	%xcc,	%f10,	%f10
	movcs	%icc,	%i7,	%i2
	movne	%icc,	%i6,	%g4
	movrgz	%g6,	0x025,	%l3
	st	%f11,	[%l7 + 0x58]
	movcc	%xcc,	%o2,	%g7
	move	%xcc,	%l6,	%i5
	or	%i4,	0x1506,	%l4
	fmovdne	%xcc,	%f10,	%f1
	edge32ln	%o3,	%i3,	%o7
	fmovdn	%icc,	%f9,	%f1
	movre	%o1,	0x2B6,	%o0
	array8	%o4,	%i0,	%o5
	save %o6, 0x02E0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l5,	%l2
	edge16	%g5,	%l1,	%g1
	udivx	%i1,	0x04F9,	%g3
	srlx	%i7,	%l0,	%i6
	fand	%f6,	%f18,	%f12
	fornot2s	%f24,	%f9,	%f29
	movrgz	%g4,	0x0D5,	%i2
	sethi	0x1698,	%g6
	fcmpes	%fcc0,	%f31,	%f31
	fmovrdlz	%l3,	%f0,	%f20
	fmovdpos	%icc,	%f8,	%f23
	edge16n	%o2,	%l6,	%i5
	udivcc	%i4,	0x1556,	%g7
	movn	%xcc,	%l4,	%o3
	fnot1s	%f21,	%f11
	sra	%i3,	%o7,	%o1
	edge16ln	%o0,	%i0,	%o5
	st	%f23,	[%l7 + 0x74]
	stw	%o6,	[%l7 + 0x74]
	fcmple32	%f30,	%f0,	%g2
	movpos	%icc,	%o4,	%l2
	mulscc	%g5,	0x11F5,	%l5
	srlx	%l1,	%i1,	%g3
	andcc	%g1,	0x16D7,	%l0
	fmovdvc	%icc,	%f8,	%f1
	movneg	%icc,	%i7,	%i6
	srl	%g4,	%i2,	%l3
	orncc	%o2,	0x0D4F,	%l6
	addcc	%i5,	%i4,	%g6
	movge	%icc,	%g7,	%l4
	ldsb	[%l7 + 0x36],	%i3
	movrlez	%o3,	%o7,	%o1
	movneg	%xcc,	%i0,	%o0
	fmovsge	%xcc,	%f1,	%f18
	add	%o6,	0x0BD2,	%o5
	fmul8x16	%f19,	%f30,	%f28
	sdiv	%g2,	0x1393,	%o4
	edge8l	%l2,	%l5,	%l1
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	st	%f10,	[%l7 + 0x48]
	nop
	set	0x10, %l3
	stw	%g3,	[%l7 + %l3]
	addcc	%g1,	%l0,	%i6
	array8	%g4,	%i2,	%i7
	or	%o2,	%l6,	%i5
	movpos	%xcc,	%i4,	%l3
	movleu	%icc,	%g6,	%g7
	movcs	%xcc,	%l4,	%o3
	sdivx	%i3,	0x1B94,	%o1
	fxor	%f20,	%f10,	%f28
	fmovsvc	%icc,	%f15,	%f2
	andcc	%o7,	%o0,	%o6
	fnot1s	%f3,	%f14
	movg	%icc,	%i0,	%o5
	save %o4, 0x0BDB, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f3,	%f26
	edge8ln	%g2,	%l1,	%i1
	edge16l	%l5,	%g3,	%g5
	addcc	%g1,	0x109C,	%l0
	movrlez	%i6,	0x357,	%i2
	fcmpgt32	%f30,	%f12,	%i7
	fcmpgt16	%f26,	%f6,	%o2
	udivcc	%g4,	0x00CA,	%l6
	movvc	%icc,	%i5,	%i4
	ldsh	[%l7 + 0x34],	%l3
	move	%xcc,	%g7,	%l4
	movrlez	%g6,	%i3,	%o3
	edge8n	%o7,	%o1,	%o6
	fmovd	%f16,	%f8
	ldsb	[%l7 + 0x6A],	%i0
	addcc	%o0,	0x09E5,	%o4
	array16	%l2,	%g2,	%l1
	sub	%o5,	%i1,	%g3
	movrne	%g5,	%l5,	%l0
	xor	%g1,	%i2,	%i6
	movvc	%xcc,	%o2,	%i7
	andn	%l6,	0x01D8,	%g4
	xnor	%i5,	0x05AF,	%i4
	sllx	%g7,	0x0E,	%l3
	andncc	%g6,	%i3,	%o3
	movrgez	%o7,	%o1,	%o6
	stx	%i0,	[%l7 + 0x20]
	edge32l	%o0,	%l4,	%l2
	movle	%icc,	%g2,	%o4
	movne	%xcc,	%l1,	%o5
	move	%xcc,	%i1,	%g5
	andncc	%l5,	%g3,	%l0
	movre	%g1,	0x2A5,	%i6
	movrne	%i2,	0x0BC,	%i7
	ldd	[%l7 + 0x48],	%i6
	movge	%xcc,	%g4,	%o2
	movre	%i4,	%i5,	%l3
	movcc	%icc,	%g6,	%i3
	edge8l	%g7,	%o3,	%o1
	sub	%o7,	0x0C5D,	%o6
	edge8l	%i0,	%o0,	%l2
	srax	%g2,	0x0C,	%o4
	mulx	%l4,	%l1,	%i1
	movleu	%icc,	%g5,	%l5
	fmovsg	%icc,	%f23,	%f27
	subccc	%g3,	0x1922,	%l0
	orn	%o5,	0x0BF5,	%g1
	nop
	set	0x54, %o5
	stw	%i2,	[%l7 + %o5]
	fmuld8sux16	%f27,	%f31,	%f18
	stx	%i6,	[%l7 + 0x38]
	ldsb	[%l7 + 0x74],	%i7
	mulx	%g4,	%l6,	%o2
	fcmps	%fcc2,	%f14,	%f1
	sra	%i4,	0x1C,	%i5
	ldsb	[%l7 + 0x56],	%l3
	fpack16	%f12,	%f16
	fxnor	%f4,	%f10,	%f14
	sll	%i3,	%g7,	%g6
	movcs	%icc,	%o3,	%o1
	xnor	%o6,	%o7,	%i0
	xnorcc	%o0,	%g2,	%l2
	fcmpgt32	%f22,	%f10,	%l4
	addcc	%o4,	0x15C0,	%i1
	fmovrde	%g5,	%f24,	%f6
	movrgez	%l1,	%g3,	%l0
	fmovdgu	%xcc,	%f18,	%f10
	orncc	%o5,	0x0E69,	%g1
	movg	%icc,	%l5,	%i2
	fpsub32s	%f29,	%f25,	%f5
	nop
	set	0x64, %l6
	ldsw	[%l7 + %l6],	%i7
	xorcc	%i6,	0x18A0,	%g4
	movgu	%icc,	%l6,	%o2
	fmovda	%icc,	%f16,	%f22
	xnor	%i5,	0x00E9,	%i4
	edge16l	%i3,	%g7,	%l3
	lduh	[%l7 + 0x30],	%o3
	addccc	%g6,	0x0667,	%o6
	fxor	%f28,	%f30,	%f6
	fors	%f22,	%f19,	%f13
	edge8l	%o1,	%i0,	%o7
	udivcc	%g2,	0x0F08,	%l2
	edge8n	%l4,	%o4,	%o0
	fpadd16	%f12,	%f18,	%f8
	sdivcc	%g5,	0x11D9,	%l1
	srlx	%g3,	%i1,	%o5
	fornot2	%f22,	%f28,	%f12
	fandnot2s	%f20,	%f26,	%f6
	and	%l0,	0x1F92,	%l5
	mulscc	%g1,	0x0D2C,	%i2
	edge8ln	%i6,	%g4,	%i7
	fcmpd	%fcc1,	%f6,	%f2
	movne	%xcc,	%o2,	%l6
	movrlez	%i5,	%i3,	%g7
	edge32l	%i4,	%l3,	%g6
	array16	%o6,	%o3,	%i0
	fcmpd	%fcc3,	%f26,	%f20
	edge32l	%o1,	%o7,	%l2
	subc	%l4,	%g2,	%o0
	orn	%o4,	0x12A9,	%l1
	fmuld8sux16	%f15,	%f23,	%f4
	fmovsge	%xcc,	%f3,	%f29
	udiv	%g5,	0x0362,	%g3
	orcc	%i1,	%l0,	%l5
	restore %g1, 0x0CAD, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o5,	%g4
	fxnors	%f18,	%f29,	%f23
	andcc	%i6,	%i7,	%o2
	orn	%i5,	0x1B39,	%i3
	siam	0x4
	edge8ln	%l6,	%i4,	%g7
	edge8ln	%l3,	%g6,	%o6
	mulx	%i0,	0x122C,	%o1
	std	%f18,	[%l7 + 0x70]
	fabss	%f2,	%f12
	movn	%icc,	%o7,	%l2
	ldsw	[%l7 + 0x34],	%l4
	movpos	%icc,	%o3,	%g2
	addcc	%o4,	%l1,	%o0
	fmovse	%xcc,	%f21,	%f5
	fmovdvs	%xcc,	%f7,	%f9
	movge	%xcc,	%g3,	%i1
	fmul8sux16	%f8,	%f24,	%f16
	udiv	%l0,	0x1B05,	%g5
	move	%icc,	%g1,	%l5
	fmovsg	%xcc,	%f26,	%f19
	fabsd	%f14,	%f10
	std	%f2,	[%l7 + 0x60]
	movneg	%xcc,	%o5,	%g4
	ldsw	[%l7 + 0x70],	%i6
	fcmpne32	%f0,	%f18,	%i2
	stb	%i7,	[%l7 + 0x0C]
	array8	%o2,	%i3,	%i5
	sra	%l6,	0x1D,	%i4
	movg	%xcc,	%g7,	%g6
	alignaddrl	%o6,	%i0,	%o1
	movle	%xcc,	%l3,	%l2
	smulcc	%o7,	%l4,	%g2
	udivx	%o3,	0x011E,	%o4
	xor	%o0,	0x013B,	%g3
	movgu	%icc,	%i1,	%l1
	srl	%g5,	%g1,	%l0
	fmuld8sux16	%f28,	%f9,	%f18
	xorcc	%o5,	0x16C8,	%g4
	lduh	[%l7 + 0x52],	%l5
	fandnot2	%f12,	%f4,	%f16
	movvs	%icc,	%i2,	%i6
	alignaddr	%o2,	%i7,	%i5
	addccc	%i3,	0x04D2,	%l6
	mova	%icc,	%i4,	%g7
	addccc	%o6,	0x0D21,	%i0
	std	%f24,	[%l7 + 0x30]
	orn	%o1,	0x1E6E,	%l3
	fcmps	%fcc0,	%f1,	%f1
	movne	%icc,	%l2,	%o7
	sethi	0x1C98,	%l4
	ldub	[%l7 + 0x3B],	%g2
	orncc	%o3,	0x0F8A,	%g6
	movcs	%xcc,	%o4,	%g3
	fmovspos	%xcc,	%f3,	%f29
	movcs	%xcc,	%o0,	%l1
	movrlez	%g5,	0x3A9,	%g1
	st	%f20,	[%l7 + 0x6C]
	fsrc2	%f12,	%f2
	alignaddr	%l0,	%i1,	%g4
	edge32l	%l5,	%i2,	%o5
	addc	%i6,	0x0210,	%i7
	fmovdleu	%xcc,	%f15,	%f24
	movre	%o2,	0x2BA,	%i5
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	edge32n	%g7,	%o6,	%i0
	mulscc	%o1,	0x0B1B,	%l3
	edge8	%l6,	%o7,	%l4
	movl	%icc,	%l2,	%g2
	movg	%xcc,	%g6,	%o3
	ldd	[%l7 + 0x70],	%o4
	sth	%g3,	[%l7 + 0x52]
	stx	%o0,	[%l7 + 0x18]
	xnorcc	%g5,	%g1,	%l0
	srax	%i1,	%g4,	%l5
	xnorcc	%l1,	%o5,	%i6
	movre	%i7,	%o2,	%i5
	movrgez	%i2,	0x0E6,	%i3
	or	%i4,	%o6,	%i0
	mulx	%g7,	%l3,	%o1
	movne	%icc,	%o7,	%l6
	srl	%l2,	%g2,	%g6
	sth	%o3,	[%l7 + 0x24]
	andncc	%l4,	%g3,	%o0
	array16	%o4,	%g5,	%l0
	fxnor	%f26,	%f26,	%f12
	movvc	%xcc,	%g1,	%g4
	stb	%i1,	[%l7 + 0x69]
	orncc	%l1,	0x047C,	%l5
	sra	%i6,	0x11,	%i7
	xor	%o5,	%o2,	%i5
	addc	%i3,	%i4,	%o6
	fnand	%f10,	%f0,	%f6
	sth	%i0,	[%l7 + 0x58]
	udiv	%i2,	0x1C74,	%g7
	alignaddr	%o1,	%l3,	%l6
	smulcc	%l2,	%g2,	%o7
	movle	%xcc,	%g6,	%l4
	movrgz	%g3,	0x28A,	%o0
	stw	%o4,	[%l7 + 0x78]
	stw	%o3,	[%l7 + 0x6C]
	sra	%l0,	%g1,	%g5
	movvc	%icc,	%g4,	%i1
	sethi	0x00A2,	%l1
	edge8ln	%i6,	%l5,	%o5
	subc	%o2,	%i5,	%i3
	andcc	%i7,	0x1A9F,	%o6
	std	%f16,	[%l7 + 0x40]
	fmovrdgez	%i4,	%f4,	%f16
	movcs	%xcc,	%i2,	%i0
	umulcc	%o1,	%g7,	%l3
	andncc	%l2,	%g2,	%o7
	mulx	%l6,	%g6,	%l4
	movleu	%xcc,	%o0,	%g3
	xorcc	%o3,	0x0C58,	%o4
	std	%f16,	[%l7 + 0x68]
	movrne	%l0,	%g5,	%g4
	subcc	%g1,	%i1,	%i6
	movcs	%xcc,	%l5,	%o5
	srlx	%l1,	0x0D,	%o2
	fnegs	%f15,	%f20
	fmovdge	%xcc,	%f27,	%f2
	movvs	%xcc,	%i5,	%i3
	movne	%xcc,	%o6,	%i7
	edge32ln	%i4,	%i0,	%i2
	sra	%o1,	0x09,	%g7
	fands	%f2,	%f20,	%f29
	orncc	%l3,	0x0052,	%l2
	smulcc	%g2,	0x016A,	%l6
	andcc	%o7,	%l4,	%g6
	sdivx	%o0,	0x0DC3,	%o3
	srl	%g3,	%l0,	%g5
	save %o4, %g1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i6, %g4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l1,	%l5,	%o2
	srlx	%i5,	%i3,	%i7
	move	%xcc,	%o6,	%i0
	andn	%i4,	%i2,	%g7
	alignaddr	%o1,	%l2,	%g2
	fzeros	%f26
	movl	%icc,	%l3,	%l6
	srax	%o7,	%l4,	%o0
	edge16ln	%o3,	%g6,	%l0
	umulcc	%g5,	%g3,	%g1
	edge32	%i1,	%i6,	%g4
	array32	%o5,	%l1,	%l5
	lduw	[%l7 + 0x3C],	%o4
	sdivcc	%i5,	0x1222,	%o2
	save %i7, 0x037C, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x30],	%i0
	movgu	%icc,	%o6,	%i2
	sra	%i4,	%o1,	%g7
	movg	%icc,	%l2,	%g2
	movvc	%xcc,	%l3,	%l6
	subccc	%l4,	0x1EDC,	%o0
	srlx	%o7,	0x08,	%o3
	fabss	%f19,	%f14
	andcc	%l0,	%g5,	%g3
	fmovsne	%icc,	%f10,	%f15
	edge32n	%g6,	%g1,	%i1
	orncc	%g4,	%i6,	%o5
	ldsw	[%l7 + 0x14],	%l1
	movrne	%l5,	0x0F2,	%i5
	fexpand	%f28,	%f16
	edge32l	%o2,	%o4,	%i3
	xnor	%i0,	%i7,	%o6
	sdivx	%i4,	0x1AEC,	%i2
	mova	%icc,	%o1,	%g7
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%l2
	edge32	%g2,	%l6,	%l3
	fpsub16s	%f5,	%f1,	%f20
	fandnot1	%f28,	%f4,	%f28
	subccc	%l4,	%o7,	%o3
	sdivcc	%l0,	0x02E4,	%g5
	edge32	%o0,	%g3,	%g1
	umulcc	%g6,	0x04FB,	%i1
	move	%xcc,	%i6,	%o5
	alignaddrl	%g4,	%l1,	%i5
	subcc	%o2,	0x1F6D,	%o4
	ldd	[%l7 + 0x10],	%i2
	fmovsg	%xcc,	%f21,	%f16
	edge8n	%i0,	%l5,	%o6
	movre	%i4,	0x37F,	%i7
	sdivx	%i2,	0x0D05,	%g7
	edge16ln	%l2,	%g2,	%o1
	ldx	[%l7 + 0x40],	%l3
	xnor	%l6,	0x0D65,	%o7
	subc	%l4,	0x19FC,	%o3
	movre	%l0,	%g5,	%o0
	siam	0x4
	sdivcc	%g3,	0x1B24,	%g1
	fnegs	%f19,	%f20
	edge32	%i1,	%g6,	%i6
	xor	%g4,	0x1934,	%o5
	srlx	%i5,	0x1B,	%o2
	fmovrsgz	%l1,	%f27,	%f2
	save %o4, %i0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x14],	%f2
	edge32l	%o6,	%l5,	%i7
	edge32n	%i4,	%i2,	%g7
	stw	%l2,	[%l7 + 0x14]
	orcc	%g2,	0x039B,	%o1
	fmul8x16au	%f3,	%f28,	%f28
	and	%l6,	0x0E85,	%l3
	save %o7, %o3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l4,	%o0,	%g5
	andcc	%g1,	0x0E8B,	%g3
	fornot2	%f20,	%f22,	%f12
	ldsw	[%l7 + 0x28],	%i1
	umul	%g6,	0x1775,	%i6
	movg	%icc,	%g4,	%o5
	fpadd16s	%f29,	%f11,	%f23
	sir	0x1DFC
	fmovdne	%xcc,	%f22,	%f7
	fand	%f4,	%f30,	%f16
	edge8n	%i5,	%l1,	%o2
	fpack32	%f4,	%f6,	%f10
	fmovdvc	%icc,	%f4,	%f21
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	add	%l5,	0x033E,	%o4
	stb	%i7,	[%l7 + 0x5A]
	popc	%i2,	%g7
	xorcc	%l2,	%g2,	%o1
	pdist	%f0,	%f28,	%f16
	srl	%l6,	%i4,	%o7
	save %o3, %l3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o0,	%g5,	%g1
	edge16l	%l4,	%g3,	%i1
	stb	%g6,	[%l7 + 0x18]
	mulx	%g4,	0x0431,	%o5
	ldsw	[%l7 + 0x24],	%i6
	ld	[%l7 + 0x10],	%f24
	ldsw	[%l7 + 0x10],	%l1
	stb	%o2,	[%l7 + 0x7B]
	addcc	%i5,	0x17CC,	%i0
	edge16l	%o6,	%l5,	%o4
	sllx	%i3,	0x05,	%i7
	xor	%g7,	%l2,	%g2
	edge16l	%o1,	%i2,	%i4
	movge	%icc,	%l6,	%o3
	ldd	[%l7 + 0x58],	%f26
	movcc	%icc,	%l3,	%l0
	movvc	%xcc,	%o0,	%o7
	fmovdcc	%icc,	%f5,	%f6
	fmovda	%icc,	%f29,	%f9
	restore %g1, 0x0C00, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g3,	0x1419,	%g5
	add	%g6,	%i1,	%o5
	movvc	%icc,	%i6,	%l1
	ldsb	[%l7 + 0x0A],	%g4
	addcc	%i5,	%o2,	%o6
	popc	%l5,	%o4
	addc	%i0,	0x1DFD,	%i7
	edge32n	%i3,	%l2,	%g2
	addcc	%g7,	%o1,	%i4
	udivcc	%i2,	0x1C2E,	%l6
	sir	0x1CB9
	edge32n	%o3,	%l0,	%l3
	fmovdle	%icc,	%f29,	%f4
	ldub	[%l7 + 0x78],	%o0
	fones	%f3
	smul	%g1,	%l4,	%g3
	popc	%o7,	%g5
	fsrc2	%f14,	%f4
	lduw	[%l7 + 0x24],	%g6
	orcc	%i1,	0x154C,	%i6
	alignaddr	%l1,	%g4,	%o5
	ldsb	[%l7 + 0x55],	%i5
	edge32ln	%o2,	%l5,	%o4
	std	%f16,	[%l7 + 0x10]
	udivx	%i0,	0x1DB9,	%i7
	fnot2	%f30,	%f16
	fnand	%f8,	%f16,	%f18
	mulx	%o6,	%l2,	%i3
	addc	%g7,	0x146F,	%o1
	xor	%g2,	0x1304,	%i2
	ldd	[%l7 + 0x48],	%f8
	stx	%l6,	[%l7 + 0x70]
	xor	%o3,	0x1CA7,	%l0
	array32	%i4,	%o0,	%l3
	addccc	%g1,	0x1152,	%l4
	array8	%o7,	%g5,	%g6
	mulx	%i1,	%i6,	%l1
	movrlz	%g3,	%g4,	%i5
	xorcc	%o2,	0x088B,	%o5
	sll	%l5,	%i0,	%i7
	edge16	%o6,	%l2,	%o4
	mulx	%i3,	0x19E2,	%o1
	umul	%g7,	%g2,	%l6
	fornot1	%f12,	%f20,	%f30
	fpackfix	%f12,	%f28
	smul	%o3,	0x0C8B,	%l0
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%i4
	stx	%i2,	[%l7 + 0x30]
	movrne	%l3,	0x194,	%o0
	st	%f30,	[%l7 + 0x20]
	movrne	%l4,	0x278,	%o7
	fmovspos	%xcc,	%f22,	%f13
	or	%g1,	%g6,	%g5
	movle	%icc,	%i6,	%l1
	movcc	%xcc,	%i1,	%g3
	fcmpeq32	%f8,	%f6,	%i5
	lduh	[%l7 + 0x3E],	%o2
	st	%f19,	[%l7 + 0x0C]
	fmovsvc	%icc,	%f18,	%f4
	udiv	%g4,	0x0A86,	%o5
	fmovscs	%icc,	%f29,	%f6
	orncc	%l5,	0x0924,	%i7
	lduh	[%l7 + 0x66],	%o6
	ldx	[%l7 + 0x20],	%l2
	movle	%xcc,	%i0,	%i3
	movg	%icc,	%o1,	%g7
	fmuld8sux16	%f31,	%f18,	%f22
	fzero	%f18
	sdivcc	%g2,	0x1551,	%o4
	movpos	%icc,	%l6,	%o3
	fmovdl	%icc,	%f12,	%f15
	smulcc	%l0,	%i2,	%i4
	fmovdne	%xcc,	%f14,	%f31
	addcc	%l3,	%l4,	%o0
	fcmpgt32	%f8,	%f6,	%g1
	orn	%o7,	%g5,	%g6
	andcc	%l1,	0x163C,	%i6
	move	%icc,	%g3,	%i1
	fands	%f23,	%f11,	%f5
	fmovdvc	%icc,	%f2,	%f17
	movrgz	%i5,	0x008,	%g4
	edge8n	%o5,	%o2,	%l5
	edge32	%o6,	%l2,	%i0
	movge	%xcc,	%i7,	%i3
	move	%icc,	%o1,	%g2
	subc	%o4,	0x0938,	%l6
	movn	%xcc,	%g7,	%l0
	sth	%o3,	[%l7 + 0x1E]
	movre	%i4,	%l3,	%i2
	addccc	%o0,	%g1,	%l4
	edge32ln	%o7,	%g6,	%l1
	fnot1s	%f19,	%f14
	lduw	[%l7 + 0x1C],	%i6
	move	%xcc,	%g5,	%g3
	sub	%i5,	%g4,	%o5
	add	%i1,	0x171B,	%l5
	stx	%o2,	[%l7 + 0x50]
	subcc	%l2,	0x0F2F,	%o6
	movre	%i0,	0x252,	%i7
	fmovrdgz	%i3,	%f8,	%f24
	fcmpgt32	%f26,	%f6,	%o1
	alignaddrl	%o4,	%l6,	%g2
	nop
	set	0x11, %l1
	ldsb	[%l7 + %l1],	%g7
	movrgz	%l0,	0x086,	%i4
	mulx	%l3,	%i2,	%o3
	fmuld8ulx16	%f15,	%f17,	%f16
	ldub	[%l7 + 0x3B],	%o0
	addc	%g1,	%l4,	%o7
	movleu	%icc,	%l1,	%g6
	umulcc	%g5,	%g3,	%i5
	ldx	[%l7 + 0x78],	%g4
	fmovdge	%icc,	%f16,	%f3
	fmovsg	%xcc,	%f30,	%f19
	fmul8x16	%f14,	%f30,	%f30
	alignaddr	%o5,	%i1,	%i6
	movl	%xcc,	%o2,	%l2
	and	%l5,	%o6,	%i0
	movg	%xcc,	%i3,	%o1
	movrlz	%o4,	%l6,	%i7
	add	%g2,	%g7,	%i4
	and	%l3,	%l0,	%o3
	movle	%icc,	%i2,	%o0
	mulx	%l4,	%o7,	%l1
	subccc	%g1,	%g5,	%g6
	sra	%g3,	%g4,	%i5
	srax	%i1,	0x02,	%o5
	movge	%icc,	%i6,	%l2
	move	%icc,	%o2,	%l5
	movge	%xcc,	%i0,	%i3
	std	%f2,	[%l7 + 0x50]
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	subc	%l6,	0x1723,	%i7
	orcc	%g2,	%g7,	%o4
	xnorcc	%l3,	%i4,	%o3
	movvs	%xcc,	%l0,	%o0
	edge32n	%i2,	%o7,	%l1
	movvc	%xcc,	%l4,	%g1
	subcc	%g5,	%g6,	%g4
	srlx	%g3,	%i5,	%i1
	edge8	%o5,	%i6,	%o2
	sllx	%l5,	0x03,	%l2
	ldsw	[%l7 + 0x74],	%i0
	movneg	%xcc,	%i3,	%o6
	fnands	%f20,	%f24,	%f29
	sdivcc	%o1,	0x196E,	%l6
	fxnors	%f6,	%f28,	%f18
	edge8n	%g2,	%i7,	%o4
	bshuffle	%f4,	%f10,	%f24
	sethi	0x0640,	%l3
	movrne	%i4,	%o3,	%g7
	array32	%l0,	%o0,	%o7
	srl	%i2,	0x00,	%l1
	fsrc1s	%f19,	%f31
	fcmpeq32	%f30,	%f16,	%l4
	addccc	%g5,	%g6,	%g1
	movg	%icc,	%g3,	%g4
	edge16ln	%i1,	%i5,	%i6
	ldub	[%l7 + 0x58],	%o2
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f10
	sdivx	%o5,	0x14C0,	%l5
	movvc	%icc,	%i0,	%l2
	andcc	%i3,	0x1AE7,	%o6
	movg	%xcc,	%o1,	%l6
	ld	[%l7 + 0x50],	%f15
	ldsh	[%l7 + 0x6E],	%i7
	fxors	%f28,	%f30,	%f22
	udivx	%o4,	0x1D38,	%l3
	stb	%g2,	[%l7 + 0x2E]
	fcmple32	%f30,	%f6,	%o3
	restore %i4, %g7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o0,	0x00B3,	%o7
	edge8	%i2,	%l1,	%g5
	sub	%l4,	0x1127,	%g1
	udiv	%g3,	0x1D62,	%g6
	sllx	%i1,	%g4,	%i6
	andcc	%i5,	%o5,	%o2
	orncc	%l5,	0x0D1A,	%l2
	ldsb	[%l7 + 0x0A],	%i0
	fxnors	%f18,	%f12,	%f2
	save %o6, %o1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i3,	0x07B0,	%o4
	array32	%l3,	%g2,	%o3
	movge	%xcc,	%i7,	%i4
	movleu	%icc,	%l0,	%g7
	addc	%o7,	%o0,	%l1
	xnorcc	%i2,	0x0D25,	%l4
	movvs	%icc,	%g1,	%g3
	fsrc2	%f16,	%f10
	fmovrsne	%g5,	%f13,	%f27
	movneg	%xcc,	%g6,	%i1
	udiv	%g4,	0x0177,	%i6
	fmovda	%icc,	%f21,	%f28
	edge16ln	%o5,	%o2,	%l5
	fmovdpos	%xcc,	%f15,	%f19
	ldub	[%l7 + 0x69],	%l2
	fnands	%f0,	%f5,	%f25
	fones	%f25
	fandnot1	%f2,	%f8,	%f24
	edge8	%i5,	%o6,	%i0
	edge16l	%o1,	%i3,	%l6
	sth	%l3,	[%l7 + 0x2E]
	ldub	[%l7 + 0x6F],	%g2
	array32	%o3,	%i7,	%i4
	sub	%l0,	0x0AFA,	%g7
	ldx	[%l7 + 0x40],	%o7
	edge8	%o4,	%l1,	%i2
	or	%l4,	%o0,	%g1
	array16	%g5,	%g6,	%i1
	fnors	%f20,	%f30,	%f12
	movpos	%xcc,	%g3,	%g4
	movle	%xcc,	%o5,	%o2
	ldsw	[%l7 + 0x30],	%l5
	sir	0x0500
	std	%f26,	[%l7 + 0x10]
	sethi	0x01C9,	%i6
	fmovrdne	%l2,	%f14,	%f0
	array32	%o6,	%i0,	%i5
	udiv	%i3,	0x17DB,	%l6
	edge32	%l3,	%o1,	%o3
	subcc	%g2,	%i4,	%l0
	edge32l	%g7,	%i7,	%o4
	movre	%o7,	0x000,	%l1
	fnand	%f2,	%f18,	%f22
	xnor	%l4,	%i2,	%g1
	sdivx	%o0,	0x166D,	%g5
	srl	%i1,	0x15,	%g3
	movrgz	%g4,	0x1B5,	%o5
	fmovsa	%icc,	%f19,	%f6
	sdivx	%g6,	0x09E1,	%l5
	mulx	%i6,	0x0C6E,	%l2
	edge32ln	%o2,	%o6,	%i0
	movge	%icc,	%i3,	%i5
	fmovdn	%icc,	%f18,	%f0
	ldub	[%l7 + 0x53],	%l6
	faligndata	%f0,	%f2,	%f22
	fxnor	%f0,	%f26,	%f22
	fnegs	%f15,	%f20
	st	%f15,	[%l7 + 0x48]
	edge8ln	%l3,	%o3,	%g2
	movg	%icc,	%o1,	%l0
	smulcc	%i4,	0x1F1E,	%i7
	sdivcc	%g7,	0x1443,	%o4
	alignaddr	%o7,	%l4,	%l1
	orncc	%g1,	%o0,	%g5
	fmovrsgz	%i1,	%f9,	%f17
	edge8n	%i2,	%g3,	%o5
	ldsh	[%l7 + 0x7C],	%g4
	movcc	%icc,	%g6,	%i6
	edge8n	%l2,	%o2,	%l5
	fmul8x16al	%f18,	%f13,	%f4
	addcc	%o6,	%i3,	%i5
	and	%l6,	0x051D,	%i0
	lduh	[%l7 + 0x1C],	%l3
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	st	%f20,	[%l7 + 0x6C]
	smulcc	%l0,	%i7,	%i4
	fmovdg	%icc,	%f15,	%f5
	edge8ln	%o4,	%o7,	%g7
	fmovrdne	%l1,	%f28,	%f26
	movcc	%xcc,	%g1,	%o0
	orncc	%g5,	0x1BBF,	%i1
	xnor	%i2,	0x16D0,	%g3
	movre	%o5,	0x0F2,	%g4
	fmovsne	%xcc,	%f1,	%f15
	movrlez	%l4,	%g6,	%l2
	movrne	%o2,	%l5,	%o6
	andcc	%i3,	%i5,	%l6
	st	%f31,	[%l7 + 0x34]
	alignaddrl	%i0,	%i6,	%l3
	orncc	%g2,	%o3,	%o1
	fmovrsgez	%i7,	%f25,	%f20
	fands	%f21,	%f7,	%f13
	umul	%i4,	%l0,	%o4
	ldsb	[%l7 + 0x62],	%g7
	ld	[%l7 + 0x50],	%f2
	stb	%o7,	[%l7 + 0x1C]
	stx	%l1,	[%l7 + 0x60]
	sir	0x125B
	addc	%o0,	0x1124,	%g1
	lduw	[%l7 + 0x6C],	%g5
	edge16ln	%i2,	%g3,	%o5
	edge8l	%i1,	%g4,	%g6
	movpos	%xcc,	%l2,	%o2
	alignaddr	%l4,	%o6,	%i3
	movg	%icc,	%l5,	%i5
	fmovdl	%icc,	%f12,	%f10
	ldsh	[%l7 + 0x5E],	%i0
	fmovrdgez	%l6,	%f2,	%f16
	mova	%xcc,	%l3,	%g2
	edge16l	%o3,	%i6,	%i7
	ldub	[%l7 + 0x4D],	%o1
	edge32n	%l0,	%i4,	%o4
	edge32n	%o7,	%l1,	%g7
	fmovdneg	%xcc,	%f11,	%f14
	movre	%o0,	%g1,	%g5
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%g2
	subccc	%i2,	0x0DD7,	%o5
	edge8	%g4,	%g6,	%i1
	edge16	%l2,	%l4,	%o2
	edge32	%i3,	%l5,	%i5
	fcmpne32	%f28,	%f30,	%o6
	stb	%l6,	[%l7 + 0x10]
	subcc	%i0,	0x084A,	%g2
	ldsb	[%l7 + 0x37],	%o3
	alignaddrl	%l3,	%i7,	%i6
	xorcc	%l0,	%o1,	%o4
	movn	%xcc,	%o7,	%i4
	orn	%l1,	0x07F7,	%o0
	andncc	%g1,	%g5,	%g7
	subc	%i2,	0x0213,	%g3
	fcmpne32	%f16,	%f2,	%g4
	sll	%g6,	0x04,	%i1
	movrlz	%l2,	%o5,	%l4
	fnors	%f13,	%f4,	%f31
	mulscc	%i3,	0x11B5,	%l5
	orn	%o2,	%i5,	%l6
	fandnot2s	%f31,	%f7,	%f0
	andncc	%i0,	%g2,	%o6
	movneg	%icc,	%o3,	%i7
	movre	%l3,	0x2A5,	%i6
	fmovsvs	%icc,	%f26,	%f15
	ldub	[%l7 + 0x4A],	%o1
	array32	%o4,	%o7,	%l0
	stw	%i4,	[%l7 + 0x48]
	array16	%o0,	%l1,	%g5
	sllx	%g7,	%i2,	%g1
	mulscc	%g4,	0x1D34,	%g3
	fmovspos	%xcc,	%f16,	%f2
	movrgez	%i1,	%l2,	%g6
	stw	%l4,	[%l7 + 0x58]
	sdivcc	%i3,	0x13D4,	%o5
	fmovsgu	%icc,	%f9,	%f26
	fnot2s	%f18,	%f6
	fxors	%f15,	%f29,	%f21
	fxnor	%f16,	%f2,	%f14
	ld	[%l7 + 0x3C],	%f7
	movg	%icc,	%o2,	%l5
	ldsb	[%l7 + 0x72],	%l6
	sdivcc	%i0,	0x177B,	%g2
	edge16	%o6,	%o3,	%i7
	array16	%i5,	%l3,	%i6
	mova	%xcc,	%o4,	%o7
	addc	%l0,	%i4,	%o1
	edge32n	%o0,	%g5,	%l1
	fmovdcs	%xcc,	%f27,	%f24
	sdiv	%i2,	0x06FB,	%g1
	fmovs	%f10,	%f28
	array16	%g7,	%g3,	%i1
	sra	%l2,	0x0A,	%g6
	mova	%xcc,	%l4,	%g4
	andn	%o5,	%i3,	%l5
	fmovsneg	%xcc,	%f11,	%f18
	subc	%o2,	0x016B,	%i0
	movleu	%icc,	%g2,	%l6
	add	%o6,	%i7,	%i5
	sth	%l3,	[%l7 + 0x34]
	movpos	%xcc,	%i6,	%o3
	ldsb	[%l7 + 0x2B],	%o4
	fcmps	%fcc3,	%f8,	%f13
	fxnor	%f0,	%f28,	%f2
	array16	%o7,	%i4,	%l0
	subcc	%o1,	0x0E1D,	%o0
	for	%f26,	%f18,	%f16
	fcmpne16	%f28,	%f16,	%g5
	edge8	%l1,	%i2,	%g1
	fmovrslz	%g7,	%f30,	%f20
	edge8ln	%i1,	%l2,	%g6
	fmovdcs	%xcc,	%f14,	%f28
	ldx	[%l7 + 0x70],	%l4
	ldd	[%l7 + 0x18],	%f14
	sdivx	%g3,	0x1D82,	%g4
	fmul8x16	%f2,	%f26,	%f4
	fmovde	%icc,	%f28,	%f11
	orncc	%i3,	0x087C,	%o5
	ldub	[%l7 + 0x3F],	%o2
	fone	%f20
	orcc	%i0,	%g2,	%l6
	orcc	%l5,	%o6,	%i5
	srlx	%i7,	%l3,	%o3
	addccc	%o4,	0x01CC,	%o7
	movrne	%i4,	%l0,	%o1
	fpsub32s	%f14,	%f28,	%f22
	movre	%o0,	0x09A,	%g5
	or	%i6,	%i2,	%g1
	save %l1, 0x1730, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l2,	%g6,	%l4
	srax	%g7,	0x0A,	%g4
	movcs	%xcc,	%i3,	%o5
	or	%g3,	%i0,	%g2
	sdivcc	%o2,	0x107A,	%l6
	ldsh	[%l7 + 0x52],	%o6
	save %l5, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i5,	%o3,	%o4
	fxors	%f17,	%f11,	%f14
	movn	%icc,	%i4,	%o7
	movcs	%icc,	%l0,	%o0
	sll	%o1,	0x15,	%i6
	ldd	[%l7 + 0x38],	%g4
	edge8l	%i2,	%g1,	%i1
	fmovsl	%icc,	%f14,	%f20
	edge8ln	%l2,	%l1,	%g6
	movre	%l4,	0x33E,	%g4
	xor	%i3,	0x1391,	%g7
	sdivx	%o5,	0x1824,	%i0
	save %g3, %o2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o6,	%l5,	%g2
	umul	%l3,	0x05CC,	%i7
	movge	%xcc,	%i5,	%o3
	fandnot2	%f16,	%f10,	%f30
	mulx	%i4,	0x09E9,	%o7
	edge32l	%l0,	%o0,	%o4
	or	%o1,	%g5,	%i2
	fmovrdgez	%i6,	%f4,	%f30
	fpsub32	%f4,	%f24,	%f12
	orcc	%i1,	%l2,	%g1
	sllx	%l1,	0x1E,	%g6
	smulcc	%g4,	0x0A7C,	%i3
	xnor	%g7,	0x004C,	%o5
	smulcc	%i0,	%g3,	%o2
	fpsub16	%f12,	%f30,	%f20
	sir	0x0AC5
	fmovrsgez	%l6,	%f26,	%f4
	and	%o6,	0x1F16,	%l5
	stw	%g2,	[%l7 + 0x74]
	sethi	0x1876,	%l3
	edge8	%l4,	%i5,	%i7
	fmovrdlez	%i4,	%f4,	%f8
	sdivx	%o7,	0x1933,	%o3
	movrgez	%l0,	0x093,	%o0
	fnand	%f14,	%f30,	%f2
	edge16ln	%o4,	%o1,	%i2
	edge8n	%i6,	%i1,	%g5
	xor	%l2,	%l1,	%g1
	umul	%g6,	%i3,	%g7
	lduh	[%l7 + 0x2C],	%g4
	edge32	%i0,	%g3,	%o5
	udivx	%l6,	0x1D99,	%o6
	nop
	set	0x34, %l2
	sth	%l5,	[%l7 + %l2]
	mulx	%o2,	%g2,	%l3
	umulcc	%l4,	0x1047,	%i5
	movrlz	%i4,	%i7,	%o3
	movrlez	%o7,	0x394,	%l0
	movre	%o0,	%o1,	%o4
	movvc	%xcc,	%i2,	%i1
	fnors	%f23,	%f26,	%f27
	sdivx	%g5,	0x0F27,	%i6
	fmovspos	%xcc,	%f14,	%f8
	ldub	[%l7 + 0x48],	%l2
	fcmpes	%fcc0,	%f12,	%f25
	addccc	%g1,	%l1,	%g6
	andncc	%g7,	%g4,	%i0
	subcc	%g3,	0x15B0,	%o5
	fpackfix	%f20,	%f8
	array32	%l6,	%o6,	%l5
	fmovdneg	%xcc,	%f23,	%f11
	ldub	[%l7 + 0x63],	%i3
	andcc	%o2,	0x087E,	%l3
	sdiv	%g2,	0x03CE,	%l4
	array32	%i5,	%i4,	%i7
	fornot1	%f22,	%f10,	%f10
	fmovse	%xcc,	%f2,	%f4
	fcmpgt16	%f24,	%f6,	%o7
	fnot2	%f16,	%f26
	fmovsle	%icc,	%f6,	%f15
	fmovdl	%xcc,	%f5,	%f27
	ldub	[%l7 + 0x61],	%o3
	fpadd32s	%f18,	%f15,	%f16
	edge16n	%l0,	%o0,	%o4
	array32	%i2,	%i1,	%o1
	movrgz	%i6,	0x244,	%l2
	st	%f20,	[%l7 + 0x34]
	sllx	%g1,	%g5,	%l1
	edge32	%g6,	%g7,	%i0
	or	%g4,	0x1B3C,	%g3
	and	%o5,	%l6,	%o6
	faligndata	%f0,	%f26,	%f24
	andn	%i3,	0x1B6C,	%l5
	sra	%o2,	0x06,	%l3
	fmovdg	%icc,	%f0,	%f10
	udivcc	%l4,	0x1B24,	%i5
	ldsh	[%l7 + 0x30],	%g2
	srl	%i4,	0x05,	%i7
	edge16ln	%o7,	%l0,	%o3
	addccc	%o4,	0x1C4B,	%o0
	xorcc	%i1,	0x183D,	%i2
	udivcc	%o1,	0x0942,	%i6
	fmovrdlez	%l2,	%f2,	%f18
	xorcc	%g1,	%g5,	%l1
	restore %g6, %i0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g4,	%o5,	%g3
	fmuld8sux16	%f24,	%f5,	%f6
	sethi	0x1CE1,	%l6
	or	%i3,	0x14FD,	%o6
	ldsb	[%l7 + 0x43],	%o2
	sdiv	%l3,	0x0D11,	%l5
	edge32	%l4,	%g2,	%i5
	movle	%xcc,	%i7,	%o7
	fmovrsne	%i4,	%f30,	%f4
	stx	%l0,	[%l7 + 0x28]
	ldub	[%l7 + 0x1A],	%o3
	movle	%icc,	%o4,	%i1
	edge16	%i2,	%o1,	%i6
	udivx	%l2,	0x0EB2,	%g1
	lduh	[%l7 + 0x66],	%g5
	subcc	%l1,	%o0,	%g6
	sdivx	%g7,	0x1E31,	%i0
	ldsb	[%l7 + 0x10],	%g4
	edge32ln	%o5,	%l6,	%i3
	movrlez	%g3,	%o6,	%o2
	save %l3, %l4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i5,	0x1E55,	%l5
	nop
	set	0x31, %g2
	ldsb	[%l7 + %g2],	%i7
	movgu	%icc,	%i4,	%l0
	edge32ln	%o3,	%o4,	%o7
	faligndata	%f0,	%f10,	%f0
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%i0
	fpack32	%f8,	%f24,	%f2
	sth	%i2,	[%l7 + 0x34]
	stx	%o1,	[%l7 + 0x10]
	movcc	%icc,	%l2,	%g1
	orcc	%i6,	%l1,	%o0
	orcc	%g6,	%g5,	%g7
	fsrc1	%f12,	%f4
	fcmpd	%fcc1,	%f22,	%f2
	lduh	[%l7 + 0x5A],	%i0
	movg	%icc,	%o5,	%g4
	sllx	%i3,	0x11,	%l6
	ldd	[%l7 + 0x28],	%g2
	fmul8x16au	%f7,	%f7,	%f16
	udiv	%o2,	0x00F6,	%l3
	fxnor	%f24,	%f14,	%f2
	fandnot1s	%f5,	%f3,	%f22
	edge8l	%o6,	%g2,	%l4
	sdivcc	%i5,	0x1BE3,	%i7
	edge8n	%l5,	%l0,	%i4
	fpsub16s	%f2,	%f12,	%f28
	nop
	set	0x18, %l5
	std	%f4,	[%l7 + %l5]
	popc	0x103F,	%o4
	array32	%o7,	%o3,	%i2
	andcc	%o1,	0x04A4,	%i1
	lduw	[%l7 + 0x6C],	%g1
	fmovrdlz	%l2,	%f8,	%f26
	fmovs	%f4,	%f2
	movn	%xcc,	%l1,	%o0
	movgu	%xcc,	%i6,	%g6
	edge32l	%g7,	%i0,	%o5
	alignaddr	%g5,	%i3,	%l6
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	udivx	%o2,	0x12B0,	%g2
	and	%o6,	%i5,	%i7
	smul	%l5,	0x1F17,	%l4
	fsrc2	%f18,	%f18
	andncc	%l0,	%i4,	%o4
	movcc	%xcc,	%o3,	%o7
	andcc	%o1,	%i1,	%i2
	lduw	[%l7 + 0x10],	%g1
	sth	%l1,	[%l7 + 0x2A]
	ldsb	[%l7 + 0x2C],	%l2
	add	%o0,	%i6,	%g6
	fnegs	%f4,	%f3
	fmuld8ulx16	%f7,	%f10,	%f18
	movcc	%icc,	%g7,	%o5
	fpsub16s	%f13,	%f21,	%f30
	ldub	[%l7 + 0x6A],	%g5
	move	%icc,	%i0,	%l6
	fcmpd	%fcc1,	%f0,	%f6
	fpsub16s	%f1,	%f3,	%f28
	edge16ln	%i3,	%g4,	%l3
	fpsub32s	%f17,	%f26,	%f1
	array8	%o2,	%g3,	%g2
	umulcc	%i5,	0x0561,	%o6
	fcmpgt32	%f14,	%f26,	%l5
	addccc	%i7,	0x18F5,	%l4
	fnegs	%f14,	%f0
	movne	%icc,	%l0,	%o4
	edge32ln	%o3,	%i4,	%o7
	addcc	%o1,	0x1136,	%i2
	fmovdgu	%icc,	%f3,	%f23
	sdiv	%g1,	0x145C,	%l1
	lduw	[%l7 + 0x78],	%l2
	edge32l	%i1,	%i6,	%g6
	lduw	[%l7 + 0x18],	%o0
	sth	%g7,	[%l7 + 0x5C]
	fxnors	%f31,	%f17,	%f31
	fmul8ulx16	%f0,	%f16,	%f6
	stb	%g5,	[%l7 + 0x2B]
	movrne	%i0,	0x02C,	%l6
	xnor	%o5,	%i3,	%g4
	addc	%l3,	%o2,	%g3
	udivcc	%g2,	0x0A23,	%i5
	fmovsn	%icc,	%f7,	%f27
	sdiv	%o6,	0x1DC5,	%l5
	movne	%icc,	%l4,	%i7
	fcmpes	%fcc1,	%f12,	%f5
	fmovsg	%xcc,	%f2,	%f25
	subc	%o4,	%l0,	%i4
	ld	[%l7 + 0x0C],	%f24
	array16	%o7,	%o3,	%o1
	orcc	%i2,	%l1,	%l2
	stx	%i1,	[%l7 + 0x18]
	srax	%g1,	0x12,	%i6
	nop
	set	0x75, %g5
	ldsb	[%l7 + %g5],	%o0
	sdiv	%g6,	0x07C9,	%g7
	sub	%g5,	0x16E1,	%i0
	umul	%l6,	%o5,	%g4
	edge8l	%i3,	%o2,	%l3
	fnand	%f4,	%f4,	%f0
	subccc	%g2,	%g3,	%o6
	orncc	%l5,	0x040D,	%l4
	edge32ln	%i7,	%i5,	%l0
	andncc	%i4,	%o4,	%o3
	mova	%icc,	%o1,	%i2
	fcmpeq16	%f30,	%f4,	%l1
	fmovdn	%xcc,	%f0,	%f21
	smulcc	%l2,	%o7,	%g1
	fpsub32	%f20,	%f10,	%f26
	fsrc1	%f30,	%f24
	sll	%i6,	%o0,	%i1
	fmovrsne	%g6,	%f13,	%f27
	fornot1	%f28,	%f30,	%f14
	xnorcc	%g5,	0x19B0,	%g7
	fmovrsne	%l6,	%f17,	%f4
	alignaddrl	%o5,	%i0,	%g4
	sir	0x1F62
	fmovspos	%icc,	%f5,	%f29
	movn	%xcc,	%o2,	%i3
	movrlez	%l3,	0x081,	%g3
	movneg	%icc,	%g2,	%o6
	edge16ln	%l5,	%l4,	%i5
	andcc	%i7,	0x030D,	%l0
	sll	%i4,	%o4,	%o3
	st	%f6,	[%l7 + 0x28]
	sll	%i2,	%o1,	%l2
	edge32n	%l1,	%g1,	%o7
	fcmple16	%f26,	%f16,	%i6
	std	%f26,	[%l7 + 0x28]
	xor	%o0,	%i1,	%g6
	movvc	%xcc,	%g5,	%g7
	sra	%o5,	%l6,	%g4
	and	%o2,	0x1063,	%i0
	add	%i3,	%g3,	%g2
	mulx	%o6,	0x0A11,	%l3
	sub	%l4,	0x09D6,	%l5
	movre	%i7,	0x011,	%i5
	fzeros	%f16
	fpadd32	%f30,	%f28,	%f18
	edge32n	%l0,	%o4,	%o3
	sub	%i4,	0x1F9B,	%i2
	alignaddrl	%o1,	%l1,	%g1
	fcmpne16	%f24,	%f0,	%o7
	restore %l2, 0x1AB1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i1,	%g6,	%i6
	addccc	%g5,	%o5,	%g7
	orncc	%g4,	%o2,	%i0
	orncc	%l6,	%i3,	%g2
	fnors	%f20,	%f31,	%f7
	movg	%xcc,	%g3,	%l3
	addccc	%l4,	0x077A,	%o6
	movre	%i7,	0x0F1,	%i5
	fornot2s	%f14,	%f8,	%f0
	sdivx	%l0,	0x13C1,	%o4
	edge16	%o3,	%i4,	%l5
	popc	%o1,	%i2
	nop
	set	0x3A, %i0
	ldsh	[%l7 + %i0],	%l1
	fnot2	%f24,	%f0
	edge8ln	%o7,	%g1,	%l2
	xnorcc	%o0,	%i1,	%i6
	xnorcc	%g5,	0x1540,	%o5
	ldx	[%l7 + 0x10],	%g6
	bshuffle	%f26,	%f4,	%f28
	ldd	[%l7 + 0x30],	%g6
	fands	%f28,	%f23,	%f30
	edge32	%o2,	%g4,	%l6
	sdivx	%i3,	0x19F2,	%g2
	save %i0, 0x0740, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%l2
	array8	%l4,	%o6,	%i7
	fones	%f6
	orn	%l0,	0x157B,	%o4
	movrlez	%i5,	%o3,	%l5
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	xor	%l1,	%o7,	%i2
	udivcc	%g1,	0x17FB,	%o0
	stw	%l2,	[%l7 + 0x30]
	fsrc1	%f10,	%f0
	edge8n	%i1,	%g5,	%o5
	popc	%g6,	%g7
	srax	%i6,	0x0C,	%o2
	srl	%g4,	0x0F,	%l6
	smul	%i3,	%g2,	%i0
	fandnot1	%f28,	%f14,	%f26
	edge16n	%l3,	%g3,	%l4
	fmovdcs	%xcc,	%f31,	%f8
	xorcc	%o6,	0x14AA,	%l0
	edge32n	%o4,	%i5,	%o3
	edge8	%l5,	%i7,	%o1
	fzeros	%f3
	sllx	%i4,	%o7,	%i2
	umulcc	%l1,	%g1,	%l2
	edge8l	%o0,	%g5,	%o5
	edge16l	%i1,	%g7,	%i6
	movl	%icc,	%g6,	%o2
	fandnot1	%f26,	%f2,	%f26
	movg	%xcc,	%l6,	%g4
	add	%g2,	0x0566,	%i3
	movpos	%icc,	%l3,	%g3
	smul	%l4,	%i0,	%l0
	edge8l	%o6,	%i5,	%o3
	udiv	%o4,	0x0C97,	%i7
	fpadd16	%f20,	%f30,	%f10
	sdiv	%o1,	0x031B,	%l5
	edge8	%o7,	%i4,	%i2
	edge32n	%l1,	%g1,	%o0
	udiv	%l2,	0x1C47,	%o5
	andn	%i1,	%g7,	%i6
	xor	%g6,	0x08C4,	%o2
	ldsb	[%l7 + 0x75],	%l6
	fxor	%f28,	%f20,	%f18
	fand	%f14,	%f12,	%f2
	fmovdle	%xcc,	%f23,	%f21
	std	%f10,	[%l7 + 0x58]
	subccc	%g5,	%g2,	%g4
	fpadd32	%f0,	%f24,	%f24
	sra	%l3,	0x0C,	%g3
	movvs	%icc,	%l4,	%i3
	movleu	%icc,	%l0,	%o6
	mova	%icc,	%i0,	%i5
	edge32n	%o4,	%i7,	%o1
	edge32n	%o3,	%l5,	%o7
	st	%f8,	[%l7 + 0x10]
	stw	%i4,	[%l7 + 0x34]
	ldsb	[%l7 + 0x4C],	%l1
	addc	%i2,	0x1C32,	%o0
	umul	%l2,	%o5,	%g1
	fmovdcs	%xcc,	%f22,	%f13
	ldsh	[%l7 + 0x18],	%g7
	edge8	%i6,	%g6,	%i1
	fmovsneg	%icc,	%f11,	%f11
	edge16ln	%o2,	%l6,	%g2
	fand	%f10,	%f16,	%f2
	fmovsleu	%xcc,	%f29,	%f2
	movrgez	%g5,	0x307,	%g4
	srl	%l3,	%g3,	%i3
	or	%l4,	0x0D67,	%l0
	edge32l	%o6,	%i0,	%i5
	smulcc	%o4,	0x0CAE,	%i7
	addc	%o3,	%l5,	%o1
	movrgz	%i4,	0x328,	%o7
	fnegs	%f31,	%f0
	fmovdpos	%xcc,	%f24,	%f15
	fmovsvs	%icc,	%f22,	%f21
	fmovrdgz	%i2,	%f6,	%f0
	mova	%icc,	%o0,	%l1
	orcc	%l2,	%o5,	%g1
	restore %i6, %g6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x3C],	%i1
	faligndata	%f8,	%f4,	%f22
	sethi	0x1F3D,	%o2
	movle	%icc,	%g2,	%g5
	movne	%xcc,	%g4,	%l6
	movcs	%icc,	%l3,	%i3
	addcc	%g3,	0x0B56,	%l4
	array8	%o6,	%i0,	%i5
	xor	%l0,	%o4,	%i7
	fnegs	%f14,	%f12
	orcc	%o3,	0x0CDD,	%o1
	fsrc2s	%f11,	%f15
	popc	%l5,	%o7
	xorcc	%i4,	%i2,	%l1
	sir	0x0725
	orncc	%l2,	0x07E4,	%o5
	ldsw	[%l7 + 0x54],	%g1
	fcmple32	%f4,	%f26,	%o0
	movrgez	%i6,	0x123,	%g7
	movleu	%icc,	%g6,	%i1
	ldsw	[%l7 + 0x1C],	%o2
	fone	%f0
	subcc	%g5,	0x034B,	%g4
	add	%g2,	0x09D2,	%l6
	ldub	[%l7 + 0x12],	%i3
	fmovse	%xcc,	%f5,	%f6
	movgu	%icc,	%g3,	%l3
	std	%f30,	[%l7 + 0x68]
	fzeros	%f22
	fsrc2s	%f15,	%f29
	srl	%l4,	%o6,	%i5
	smul	%l0,	0x171C,	%i0
	edge8	%o4,	%i7,	%o1
	fnor	%f14,	%f0,	%f6
	movrne	%o3,	%l5,	%i4
	fmovrsgz	%i2,	%f29,	%f5
	movcs	%icc,	%o7,	%l2
	movrgez	%o5,	%l1,	%g1
	ld	[%l7 + 0x30],	%f17
	edge8n	%o0,	%g7,	%g6
	edge16l	%i1,	%i6,	%o2
	umulcc	%g5,	%g2,	%g4
	orncc	%l6,	%g3,	%l3
	popc	%i3,	%o6
	movge	%xcc,	%i5,	%l4
	fandnot2s	%f31,	%f0,	%f8
	fmul8x16al	%f22,	%f9,	%f8
	orn	%i0,	0x0359,	%o4
	fmovsle	%xcc,	%f2,	%f21
	stw	%i7,	[%l7 + 0x48]
	udiv	%o1,	0x1C58,	%o3
	movrgz	%l0,	%i4,	%i2
	orcc	%l5,	%o7,	%o5
	array32	%l2,	%g1,	%o0
	movpos	%icc,	%l1,	%g7
	edge8l	%g6,	%i6,	%o2
	fzero	%f6
	fmovd	%f4,	%f30
	edge16n	%i1,	%g5,	%g2
	addc	%g4,	%g3,	%l6
	fmovdcs	%icc,	%f10,	%f24
	ldsb	[%l7 + 0x39],	%i3
	ldd	[%l7 + 0x78],	%o6
	fmovdleu	%xcc,	%f15,	%f0
	addc	%l3,	%l4,	%i5
	ldd	[%l7 + 0x78],	%i0
	fandnot2s	%f17,	%f13,	%f27
	sdiv	%i7,	0x0DD8,	%o1
	array8	%o4,	%l0,	%o3
	sll	%i2,	%l5,	%o7
	movrne	%i4,	0x1F7,	%l2
	edge32	%g1,	%o0,	%l1
	fmovrdne	%g7,	%f20,	%f6
	subcc	%g6,	0x18A8,	%o5
	edge32l	%i6,	%o2,	%g5
	srax	%g2,	%g4,	%i1
	edge32ln	%l6,	%i3,	%g3
	mulx	%l3,	%o6,	%l4
	fmuld8sux16	%f3,	%f16,	%f30
	edge32l	%i5,	%i7,	%i0
	fandnot1	%f22,	%f8,	%f12
	movrlz	%o1,	%o4,	%l0
	xnorcc	%o3,	%i2,	%o7
	fandnot1s	%f4,	%f18,	%f26
	fsrc2s	%f23,	%f15
	fmovrslz	%l5,	%f28,	%f17
	edge32	%l2,	%i4,	%g1
	edge8ln	%o0,	%g7,	%l1
	edge32	%g6,	%i6,	%o5
	edge16ln	%o2,	%g2,	%g4
	array32	%i1,	%g5,	%i3
	movle	%xcc,	%g3,	%l6
	fmovrdgz	%l3,	%f16,	%f8
	movge	%xcc,	%o6,	%l4
	fornot1s	%f24,	%f18,	%f12
	sub	%i5,	%i7,	%i0
	sethi	0x13F1,	%o1
	fmovrslez	%l0,	%f31,	%f7
	lduw	[%l7 + 0x78],	%o4
	st	%f26,	[%l7 + 0x50]
	fzeros	%f23
	array32	%o3,	%i2,	%o7
	movl	%icc,	%l2,	%l5
	xnorcc	%g1,	0x125A,	%i4
	fmovsne	%xcc,	%f8,	%f22
	edge8l	%o0,	%l1,	%g7
	addc	%g6,	%o5,	%i6
	sir	0x1F61
	fsrc1s	%f6,	%f7
	nop
	set	0x70, %g1
	lduw	[%l7 + %g1],	%g2
	umulcc	%o2,	%i1,	%g5
	smulcc	%i3,	%g3,	%l6
	smul	%l3,	0x00A3,	%o6
	lduw	[%l7 + 0x4C],	%l4
	fmovscc	%xcc,	%f3,	%f20
	edge8ln	%g4,	%i7,	%i0
	nop
	set	0x70, %o6
	std	%f20,	[%l7 + %o6]
	addc	%o1,	%l0,	%o4
	edge32l	%o3,	%i2,	%o7
	lduw	[%l7 + 0x5C],	%i5
	movgu	%icc,	%l5,	%l2
	move	%icc,	%g1,	%o0
	fmovsg	%icc,	%f26,	%f31
	stx	%l1,	[%l7 + 0x30]
	edge32	%g7,	%g6,	%i4
	array8	%o5,	%g2,	%i6
	fzeros	%f2
	fandnot1s	%f16,	%f21,	%f14
	xnor	%o2,	%g5,	%i1
	array8	%g3,	%i3,	%l6
	movpos	%xcc,	%l3,	%o6
	ldd	[%l7 + 0x70],	%f22
	edge8	%l4,	%i7,	%g4
	sdiv	%o1,	0x0E42,	%i0
	popc	0x01A7,	%o4
	fxnor	%f12,	%f2,	%f0
	udiv	%o3,	0x1AFC,	%i2
	popc	0x049F,	%o7
	array8	%i5,	%l0,	%l2
	mulscc	%g1,	%o0,	%l1
	orcc	%g7,	0x1970,	%g6
	addcc	%i4,	0x09C2,	%o5
	fpsub16s	%f29,	%f17,	%f30
	movrne	%g2,	%l5,	%o2
	array32	%g5,	%i1,	%g3
	sll	%i3,	%l6,	%l3
	fnot1s	%f3,	%f14
	sub	%o6,	0x0DA2,	%i6
	sdiv	%i7,	0x1F7E,	%g4
	udivx	%l4,	0x1BC9,	%o1
	or	%i0,	%o3,	%o4
	sra	%o7,	%i5,	%i2
	srl	%l0,	0x09,	%g1
	orn	%o0,	%l2,	%l1
	ldsh	[%l7 + 0x52],	%g6
	edge32l	%i4,	%g7,	%o5
	add	%l5,	0x1F9F,	%g2
	edge16n	%o2,	%g5,	%g3
	movre	%i1,	%i3,	%l3
	movrgz	%l6,	0x0D5,	%o6
	ldub	[%l7 + 0x3B],	%i7
	movgu	%icc,	%g4,	%l4
	fmovsgu	%xcc,	%f4,	%f23
	movpos	%xcc,	%o1,	%i0
	lduw	[%l7 + 0x7C],	%o3
	movgu	%icc,	%o4,	%i6
	fnors	%f3,	%f7,	%f31
	edge32l	%o7,	%i2,	%i5
	fmovdl	%icc,	%f19,	%f28
	movne	%icc,	%l0,	%g1
	st	%f16,	[%l7 + 0x28]
	edge8l	%o0,	%l2,	%l1
	movvc	%xcc,	%i4,	%g7
	ldd	[%l7 + 0x58],	%o4
	siam	0x4
	fmovrdne	%g6,	%f12,	%f6
	fmovdcs	%icc,	%f2,	%f1
	stw	%g2,	[%l7 + 0x3C]
	alignaddrl	%o2,	%g5,	%l5
	movl	%xcc,	%g3,	%i1
	fpadd16	%f20,	%f28,	%f0
	movne	%xcc,	%i3,	%l3
	stx	%o6,	[%l7 + 0x58]
	xorcc	%i7,	0x06E2,	%l6
	edge32	%g4,	%l4,	%i0
	fxors	%f31,	%f11,	%f4
	fmovrsne	%o1,	%f24,	%f25
	fsrc1	%f26,	%f12
	smulcc	%o3,	%o4,	%i6
	movrlez	%i2,	%o7,	%l0
	andn	%g1,	0x14CB,	%o0
	sra	%i5,	0x0D,	%l2
	fmovrdne	%i4,	%f28,	%f14
	ldsb	[%l7 + 0x2B],	%g7
	array32	%l1,	%o5,	%g2
	edge16ln	%o2,	%g6,	%l5
	and	%g3,	%g5,	%i3
	fmovsgu	%xcc,	%f8,	%f5
	umulcc	%i1,	%o6,	%l3
	srax	%l6,	%i7,	%g4
	xor	%l4,	0x0042,	%o1
	movle	%xcc,	%o3,	%o4
	ldsw	[%l7 + 0x6C],	%i6
	lduh	[%l7 + 0x2C],	%i0
	movpos	%icc,	%i2,	%o7
	popc	0x1E48,	%g1
	fmovdgu	%icc,	%f5,	%f11
	stx	%o0,	[%l7 + 0x78]
	movgu	%icc,	%i5,	%l2
	orcc	%l0,	0x1445,	%i4
	andn	%l1,	%o5,	%g7
	sdivcc	%g2,	0x06C9,	%g6
	edge32ln	%l5,	%g3,	%o2
	add	%i3,	%g5,	%i1
	mulscc	%o6,	0x0A97,	%l6
	ldsb	[%l7 + 0x36],	%l3
	movn	%xcc,	%g4,	%i7
	movrne	%l4,	%o1,	%o3
	movcc	%icc,	%o4,	%i6
	move	%icc,	%i0,	%i2
	sdiv	%g1,	0x1BAB,	%o7
	movne	%icc,	%o0,	%i5
	ldx	[%l7 + 0x78],	%l0
	stx	%l2,	[%l7 + 0x50]
	or	%l1,	0x142C,	%i4
	movvc	%icc,	%o5,	%g2
	faligndata	%f10,	%f12,	%f16
	srax	%g6,	%g7,	%g3
	fnot1s	%f29,	%f8
	srax	%o2,	0x0C,	%l5
	srax	%i3,	0x18,	%i1
	fmovsgu	%xcc,	%f27,	%f12
	fmovdneg	%xcc,	%f5,	%f8
	fmovd	%f8,	%f20
	fmovrdlz	%g5,	%f20,	%f0
	fmovsvc	%icc,	%f12,	%f18
	edge32n	%o6,	%l6,	%g4
	xnor	%l3,	%l4,	%o1
	movrlez	%o3,	%i7,	%i6
	fnot2	%f8,	%f12
	fpack16	%f0,	%f6
	alignaddrl	%i0,	%i2,	%o4
	andn	%g1,	%o0,	%o7
	udiv	%l0,	0x1D78,	%i5
	edge16n	%l1,	%l2,	%o5
	ldd	[%l7 + 0x38],	%f2
	fmovsa	%xcc,	%f13,	%f18
	edge8	%g2,	%g6,	%g7
	subccc	%g3,	0x0674,	%i4
	movg	%xcc,	%l5,	%i3
	edge16l	%i1,	%g5,	%o2
	stb	%l6,	[%l7 + 0x4B]
	movrgz	%g4,	0x06B,	%o6
	fmovrdne	%l4,	%f26,	%f18
	sdivx	%o1,	0x1D17,	%o3
	movcc	%icc,	%i7,	%l3
	fpsub16s	%f8,	%f28,	%f9
	ldsw	[%l7 + 0x08],	%i6
	fnands	%f18,	%f12,	%f31
	edge8n	%i0,	%i2,	%g1
	fands	%f30,	%f30,	%f31
	sethi	0x07B4,	%o4
	umul	%o7,	0x0264,	%o0
	movl	%xcc,	%l0,	%i5
	ldsb	[%l7 + 0x5F],	%l2
	movne	%xcc,	%l1,	%o5
	mova	%xcc,	%g6,	%g2
	array16	%g7,	%i4,	%l5
	mulscc	%i3,	0x1679,	%i1
	edge16n	%g5,	%o2,	%l6
	fabss	%f1,	%f20
	edge8n	%g3,	%o6,	%g4
	movrgez	%o1,	%l4,	%i7
	edge32ln	%l3,	%o3,	%i0
	fmovrsgez	%i6,	%f5,	%f4
	movrne	%i2,	%o4,	%g1
	orcc	%o0,	%l0,	%i5
	edge8n	%o7,	%l1,	%l2
	add	%o5,	0x18F0,	%g2
	pdist	%f30,	%f4,	%f18
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	andncc	%l5,	%i3,	%i1
	subcc	%i4,	%g5,	%l6
	orcc	%o2,	0x04B0,	%g3
	movrgez	%o6,	%g4,	%l4
	edge32ln	%i7,	%l3,	%o1
	movn	%icc,	%i0,	%o3
	fmovrslz	%i2,	%f0,	%f3
	sdivcc	%o4,	0x07FD,	%g1
	ldd	[%l7 + 0x48],	%o0
	popc	0x0316,	%l0
	fcmps	%fcc3,	%f15,	%f12
	array16	%i6,	%i5,	%l1
	stb	%l2,	[%l7 + 0x73]
	edge8ln	%o5,	%g2,	%o7
	movrgez	%g7,	%l5,	%g6
	subccc	%i3,	0x02B3,	%i4
	srlx	%i1,	0x1E,	%g5
	edge32ln	%l6,	%g3,	%o6
	addcc	%g4,	0x0A2F,	%l4
	ldsw	[%l7 + 0x64],	%o2
	fsrc1s	%f10,	%f9
	xnor	%l3,	%o1,	%i0
	fmovrde	%o3,	%f16,	%f20
	fmovde	%icc,	%f16,	%f22
	sra	%i2,	0x12,	%o4
	movcs	%icc,	%i7,	%o0
	ldd	[%l7 + 0x48],	%f2
	fmovsgu	%icc,	%f12,	%f28
	fmovdle	%icc,	%f4,	%f10
	nop
	set	0x30, %i7
	std	%f28,	[%l7 + %i7]
	ldsb	[%l7 + 0x39],	%g1
	fcmped	%fcc1,	%f14,	%f18
	edge32l	%l0,	%i5,	%i6
	mulx	%l2,	%o5,	%l1
	umulcc	%g2,	0x16A3,	%g7
	add	%o7,	%g6,	%l5
	movrlz	%i3,	%i4,	%i1
	addcc	%g5,	%g3,	%l6
	restore %o6, 0x091A, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g4,	[%l7 + 0x68]
	lduh	[%l7 + 0x48],	%l3
	mulscc	%o1,	0x0360,	%i0
	edge8l	%o2,	%o3,	%o4
	smulcc	%i7,	0x14AF,	%i2
	subc	%g1,	%l0,	%i5
	alignaddrl	%o0,	%l2,	%o5
	xor	%l1,	0x1904,	%i6
	array8	%g2,	%g7,	%o7
	sdivcc	%g6,	0x155C,	%i3
	lduw	[%l7 + 0x44],	%i4
	array16	%l5,	%i1,	%g5
	fsrc2	%f6,	%f8
	fpadd16s	%f16,	%f30,	%f30
	fone	%f4
	popc	%l6,	%o6
	edge16l	%l4,	%g3,	%l3
	sub	%g4,	%o1,	%i0
	sdivcc	%o2,	0x14E4,	%o4
	smulcc	%o3,	0x0FF8,	%i2
	ldsw	[%l7 + 0x20],	%i7
	fcmps	%fcc2,	%f20,	%f28
	ldsh	[%l7 + 0x24],	%l0
	udivx	%g1,	0x1726,	%o0
	smulcc	%l2,	0x1A10,	%o5
	stb	%i5,	[%l7 + 0x58]
	addc	%i6,	0x06C0,	%l1
	andn	%g7,	%o7,	%g6
	ldub	[%l7 + 0x6B],	%g2
	movleu	%xcc,	%i4,	%l5
	fmovrdgez	%i1,	%f12,	%f22
	movle	%icc,	%g5,	%l6
	edge8l	%i3,	%o6,	%l4
	xor	%g3,	%l3,	%g4
	sth	%i0,	[%l7 + 0x56]
	fmovdn	%xcc,	%f14,	%f8
	array8	%o1,	%o4,	%o3
	orcc	%i2,	0x0E85,	%o2
	sub	%i7,	%g1,	%o0
	ldd	[%l7 + 0x50],	%l2
	smulcc	%o5,	0x1625,	%i5
	andn	%i6,	%l0,	%l1
	sethi	0x11E8,	%o7
	udivcc	%g7,	0x15D5,	%g6
	movcs	%icc,	%i4,	%l5
	xor	%i1,	%g2,	%l6
	fpackfix	%f2,	%f8
	fmovsge	%xcc,	%f18,	%f28
	or	%i3,	0x0BDC,	%g5
	and	%l4,	%o6,	%g3
	array8	%l3,	%i0,	%g4
	fxor	%f2,	%f0,	%f30
	std	%f8,	[%l7 + 0x58]
	orcc	%o1,	0x1B70,	%o4
	fmovde	%icc,	%f24,	%f9
	addc	%o3,	%o2,	%i2
	srax	%g1,	0x0D,	%i7
	movleu	%icc,	%o0,	%o5
	xorcc	%l2,	0x1576,	%i5
	lduh	[%l7 + 0x6C],	%l0
	or	%l1,	%o7,	%g7
	ld	[%l7 + 0x68],	%f30
	ld	[%l7 + 0x48],	%f15
	movvc	%icc,	%g6,	%i6
	addccc	%l5,	0x1F0A,	%i4
	fcmple16	%f10,	%f16,	%g2
	sdiv	%i1,	0x0E87,	%l6
	movg	%icc,	%i3,	%l4
	umul	%g5,	%o6,	%g3
	array8	%i0,	%l3,	%g4
	alignaddr	%o1,	%o4,	%o2
	ldsw	[%l7 + 0x40],	%i2
	udivx	%g1,	0x10E7,	%o3
	ldub	[%l7 + 0x39],	%o0
	std	%f8,	[%l7 + 0x70]
	fmovrdlez	%i7,	%f14,	%f22
	movvc	%icc,	%o5,	%i5
	xor	%l0,	%l1,	%o7
	movle	%xcc,	%l2,	%g6
	edge8	%g7,	%l5,	%i4
	fcmple32	%f24,	%f26,	%g2
	fmovrdne	%i1,	%f28,	%f28
	sub	%l6,	%i3,	%l4
	fpadd16s	%f18,	%f6,	%f16
	fmovsa	%xcc,	%f17,	%f13
	fmovdvs	%icc,	%f16,	%f18
	addccc	%g5,	%o6,	%g3
	ldsb	[%l7 + 0x6F],	%i0
	fmovdcc	%xcc,	%f21,	%f20
	udiv	%l3,	0x1E1C,	%i6
	subccc	%o1,	%o4,	%g4
	ldsh	[%l7 + 0x6A],	%i2
	andncc	%o2,	%g1,	%o0
	movrlez	%o3,	0x3F4,	%i7
	sethi	0x09AC,	%i5
	fmovdleu	%xcc,	%f31,	%f6
	sra	%l0,	0x00,	%o5
	addc	%o7,	%l2,	%g6
	fmul8sux16	%f6,	%f2,	%f16
	movcs	%xcc,	%l1,	%g7
	andcc	%l5,	0x0BB0,	%i4
	ld	[%l7 + 0x4C],	%f13
	sllx	%g2,	0x0A,	%l6
	fpsub32s	%f28,	%f18,	%f16
	sdiv	%i1,	0x170F,	%l4
	orn	%i3,	0x0ADB,	%o6
	fand	%f10,	%f20,	%f16
	save %g3, 0x032F, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g5,	%l3,	%i6
	fnegd	%f30,	%f12
	movrgz	%o4,	0x2BE,	%g4
	xor	%o1,	%i2,	%o2
	or	%o0,	%o3,	%g1
	stb	%i7,	[%l7 + 0x4D]
	ld	[%l7 + 0x10],	%f19
	smul	%i5,	0x15C9,	%l0
	std	%f4,	[%l7 + 0x60]
	orncc	%o5,	%l2,	%o7
	andn	%l1,	0x1708,	%g7
	and	%l5,	%g6,	%g2
	movre	%i4,	%i1,	%l4
	fsrc1s	%f20,	%f13
	sra	%i3,	0x16,	%l6
	sllx	%g3,	%i0,	%g5
	popc	%l3,	%o6
	siam	0x5
	orn	%o4,	%g4,	%o1
	or	%i6,	%o2,	%o0
	sir	0x1E48
	movgu	%xcc,	%i2,	%g1
	fmovrslz	%o3,	%f24,	%f10
	movvs	%icc,	%i5,	%l0
	movleu	%icc,	%o5,	%l2
	movle	%xcc,	%o7,	%l1
	addccc	%i7,	0x04C6,	%g7
	smulcc	%l5,	%g6,	%i4
	xnorcc	%g2,	0x0393,	%i1
	ldx	[%l7 + 0x10],	%i3
	xnor	%l6,	0x1F82,	%l4
	movre	%i0,	%g5,	%g3
	ldsb	[%l7 + 0x69],	%l3
	edge16l	%o4,	%g4,	%o1
	ldsb	[%l7 + 0x0B],	%i6
	fxnors	%f23,	%f1,	%f8
	fxor	%f26,	%f6,	%f26
	movl	%xcc,	%o2,	%o0
	movrne	%o6,	%i2,	%o3
	ldx	[%l7 + 0x58],	%i5
	movleu	%icc,	%g1,	%l0
	movcs	%xcc,	%l2,	%o7
	edge16l	%o5,	%i7,	%l1
	stx	%g7,	[%l7 + 0x58]
	xorcc	%g6,	%l5,	%i4
	edge8l	%i1,	%g2,	%l6
	alignaddrl	%i3,	%i0,	%g5
	fmul8x16au	%f30,	%f2,	%f24
	movl	%xcc,	%g3,	%l4
	fsrc1s	%f22,	%f26
	fors	%f10,	%f21,	%f16
	sra	%o4,	0x08,	%l3
	add	%o1,	%i6,	%g4
	stw	%o2,	[%l7 + 0x20]
	fornot1	%f24,	%f26,	%f26
	sra	%o0,	%o6,	%i2
	fmul8x16au	%f20,	%f27,	%f0
	orn	%o3,	0x0459,	%g1
	edge16n	%i5,	%l2,	%l0
	alignaddrl	%o5,	%i7,	%o7
	mova	%icc,	%l1,	%g7
	fsrc2	%f2,	%f0
	std	%f22,	[%l7 + 0x60]
	fzero	%f16
	fpack16	%f22,	%f3
	fmovdcs	%xcc,	%f29,	%f28
	udiv	%g6,	0x0CA7,	%i4
	nop
	set	0x70, %o2
	std	%f24,	[%l7 + %o2]
	stx	%l5,	[%l7 + 0x20]
	mulscc	%i1,	%l6,	%i3
	edge16ln	%g2,	%i0,	%g5
	fmovdne	%xcc,	%f15,	%f27
	movleu	%icc,	%g3,	%o4
	smulcc	%l4,	%o1,	%l3
	and	%i6,	%o2,	%g4
	xnor	%o0,	0x0D47,	%o6
	ldsh	[%l7 + 0x56],	%o3
	subccc	%i2,	%g1,	%i5
	fpadd32s	%f26,	%f16,	%f12
	fmovsg	%icc,	%f12,	%f18
	mulx	%l2,	0x12EE,	%l0
	fmovsleu	%xcc,	%f12,	%f23
	movleu	%icc,	%i7,	%o7
	sir	0x13B5
	movle	%icc,	%o5,	%g7
	umul	%l1,	%g6,	%l5
	fmovrdlez	%i1,	%f4,	%f28
	subc	%l6,	0x02A5,	%i4
	ldd	[%l7 + 0x48],	%g2
	sra	%i0,	%i3,	%g5
	udiv	%o4,	0x1C32,	%g3
	lduw	[%l7 + 0x08],	%l4
	ldsw	[%l7 + 0x2C],	%o1
	edge16ln	%i6,	%o2,	%g4
	sll	%l3,	%o6,	%o3
	movrgez	%o0,	0x37A,	%g1
	fpadd32s	%f22,	%f8,	%f28
	pdist	%f0,	%f6,	%f28
	sdivcc	%i2,	0x1845,	%l2
	sdivcc	%l0,	0x025B,	%i5
	xnorcc	%i7,	0x1DAC,	%o7
	edge32ln	%o5,	%g7,	%l1
	movge	%xcc,	%g6,	%i1
	mulscc	%l6,	0x1D43,	%l5
	subc	%g2,	0x07C1,	%i0
	movcc	%xcc,	%i4,	%i3
	srlx	%o4,	0x0A,	%g5
	movge	%icc,	%l4,	%g3
	movle	%xcc,	%i6,	%o1
	ldub	[%l7 + 0x5A],	%g4
	edge16n	%l3,	%o2,	%o6
	fpadd16s	%f15,	%f0,	%f7
	movrgz	%o3,	0x06F,	%o0
	edge8ln	%g1,	%i2,	%l0
	movgu	%xcc,	%l2,	%i5
	xorcc	%i7,	%o7,	%o5
	sllx	%l1,	%g7,	%g6
	ldsh	[%l7 + 0x52],	%i1
	edge32ln	%l5,	%g2,	%i0
	fnor	%f18,	%f4,	%f16
	smulcc	%i4,	0x0EFF,	%i3
	srl	%o4,	0x0C,	%l6
	addc	%l4,	0x1F16,	%g3
	lduh	[%l7 + 0x68],	%i6
	movrne	%g5,	0x3EA,	%o1
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	movcc	%xcc,	%o3,	%o0
	orn	%g1,	0x14A9,	%i2
	movrgz	%o2,	0x2DB,	%l0
	fmovrdlez	%i5,	%f4,	%f22
	edge8l	%i7,	%l2,	%o7
	srlx	%o5,	%g7,	%l1
	fpadd16	%f20,	%f20,	%f26
	fmovdvs	%icc,	%f29,	%f27
	sethi	0x1DDF,	%g6
	fmovda	%icc,	%f5,	%f9
	fnot1s	%f20,	%f17
	mulscc	%i1,	0x10E4,	%l5
	orncc	%g2,	0x179A,	%i0
	sdivcc	%i3,	0x133C,	%o4
	orn	%i4,	%l4,	%g3
	fmul8x16au	%f28,	%f29,	%f8
	array16	%l6,	%i6,	%g5
	udivx	%o1,	0x03A0,	%l3
	edge32ln	%g4,	%o3,	%o6
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f16
	fornot2	%f4,	%f22,	%f18
	sir	0x0EF7
	movrgez	%o0,	%i2,	%g1
	edge32ln	%l0,	%o2,	%i5
	fmovdne	%xcc,	%f11,	%f16
	ldd	[%l7 + 0x08],	%f8
	umulcc	%i7,	%l2,	%o5
	movg	%icc,	%o7,	%g7
	edge32l	%l1,	%i1,	%l5
	sra	%g2,	0x09,	%i0
	stw	%i3,	[%l7 + 0x28]
	smulcc	%o4,	%g6,	%l4
	xnor	%g3,	0x1ACE,	%i4
	udivx	%i6,	0x0517,	%l6
	stw	%o1,	[%l7 + 0x68]
	nop
	set	0x6C, %o4
	sth	%l3,	[%l7 + %o4]
	addc	%g4,	0x0761,	%g5
	stb	%o3,	[%l7 + 0x4C]
	edge32l	%o0,	%i2,	%o6
	fsrc1s	%f30,	%f16
	addccc	%g1,	0x1E14,	%l0
	edge16l	%i5,	%o2,	%l2
	sllx	%i7,	0x1A,	%o7
	fmul8sux16	%f20,	%f6,	%f20
	fmovsg	%icc,	%f14,	%f25
	fone	%f6
	fcmpne32	%f8,	%f6,	%o5
	andncc	%l1,	%g7,	%l5
	fornot2s	%f27,	%f31,	%f24
	edge16ln	%g2,	%i1,	%i0
	movre	%i3,	0x103,	%o4
	movleu	%xcc,	%g6,	%l4
	ld	[%l7 + 0x40],	%f3
	lduh	[%l7 + 0x10],	%g3
	movrne	%i4,	0x26C,	%i6
	std	%f26,	[%l7 + 0x28]
	movleu	%icc,	%l6,	%l3
	movre	%o1,	%g5,	%g4
	subc	%o0,	%o3,	%i2
	sir	0x1449
	movrlz	%g1,	%l0,	%o6
	sra	%i5,	0x1B,	%o2
	array16	%l2,	%i7,	%o7
	sub	%l1,	%g7,	%l5
	subc	%g2,	%o5,	%i1
	edge32ln	%i3,	%i0,	%g6
	edge8l	%l4,	%g3,	%o4
	fornot1s	%f28,	%f20,	%f28
	fmovsgu	%icc,	%f25,	%f5
	sll	%i6,	%l6,	%i4
	andcc	%o1,	0x1841,	%l3
	array32	%g4,	%g5,	%o0
	srlx	%i2,	0x1C,	%g1
	sra	%o3,	%o6,	%l0
	ldsw	[%l7 + 0x64],	%o2
	fmovscc	%icc,	%f5,	%f10
	mulscc	%l2,	0x117E,	%i5
	sub	%i7,	%l1,	%o7
	fcmps	%fcc2,	%f7,	%f21
	and	%g7,	%l5,	%o5
	fmovdcc	%icc,	%f18,	%f10
	edge16n	%i1,	%g2,	%i3
	lduh	[%l7 + 0x12],	%i0
	sllx	%l4,	0x0C,	%g3
	edge32	%g6,	%i6,	%l6
	fcmpes	%fcc1,	%f22,	%f5
	std	%f10,	[%l7 + 0x60]
	sir	0x1770
	movrlz	%i4,	0x180,	%o4
	edge32ln	%o1,	%g4,	%l3
	popc	0x0C91,	%o0
	andn	%g5,	0x18C5,	%i2
	xnorcc	%g1,	0x0D1B,	%o3
	movg	%xcc,	%l0,	%o6
	movvs	%icc,	%o2,	%l2
	umul	%i5,	%l1,	%i7
	fmovsn	%icc,	%f9,	%f14
	movcs	%icc,	%g7,	%o7
	edge16l	%l5,	%i1,	%g2
	fnands	%f14,	%f13,	%f23
	stx	%o5,	[%l7 + 0x68]
	save %i0, %l4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	0x1ED,	%i6
	udivx	%i3,	0x1B93,	%i4
	edge16l	%l6,	%o1,	%o4
	sdivcc	%g4,	0x01D3,	%o0
	movcs	%xcc,	%l3,	%g5
	movpos	%icc,	%g1,	%i2
	orcc	%o3,	%l0,	%o6
	nop
	set	0x64, %g4
	stw	%l2,	[%l7 + %g4]
	st	%f26,	[%l7 + 0x18]
	smul	%i5,	%o2,	%l1
	fmovde	%xcc,	%f19,	%f28
	movrlez	%i7,	%g7,	%o7
	edge32n	%i1,	%l5,	%o5
	fmul8x16au	%f6,	%f10,	%f2
	fmovsleu	%icc,	%f15,	%f4
	xor	%i0,	0x15E8,	%g2
	addccc	%g3,	0x10F0,	%g6
	or	%l4,	%i6,	%i4
	edge16	%i3,	%o1,	%o4
	or	%g4,	0x0160,	%o0
	movre	%l3,	%g5,	%l6
	subc	%g1,	0x15D6,	%i2
	fmovspos	%icc,	%f3,	%f24
	orncc	%l0,	%o3,	%l2
	ldub	[%l7 + 0x59],	%i5
	andcc	%o6,	0x1090,	%o2
	movg	%xcc,	%l1,	%i7
	fsrc2	%f10,	%f22
	fmovsleu	%xcc,	%f28,	%f12
	and	%g7,	%i1,	%o7
	addccc	%o5,	0x0CDE,	%l5
	nop
	set	0x50, %g6
	stb	%g2,	[%l7 + %g6]
	movgu	%xcc,	%g3,	%g6
	fandnot2	%f28,	%f8,	%f18
	lduh	[%l7 + 0x6E],	%i0
	array16	%i6,	%i4,	%i3
	movvc	%xcc,	%o1,	%o4
	movne	%icc,	%l4,	%o0
	stb	%g4,	[%l7 + 0x23]
	sdivcc	%l3,	0x08B4,	%l6
	array8	%g1,	%i2,	%l0
	umul	%g5,	%o3,	%l2
	sir	0x06E0
	movl	%xcc,	%i5,	%o2
	edge32l	%l1,	%o6,	%i7
	ldsh	[%l7 + 0x32],	%i1
	xnorcc	%o7,	%g7,	%l5
	fpsub32	%f22,	%f4,	%f2
	udiv	%g2,	0x1C39,	%o5
	edge16	%g3,	%g6,	%i6
	srl	%i0,	%i4,	%o1
	ldd	[%l7 + 0x50],	%i2
	restore %o4, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%g4,	%g1
	sub	%l6,	%l0,	%g5
	fcmped	%fcc3,	%f14,	%f18
	and	%o3,	%i2,	%l2
	sth	%o2,	[%l7 + 0x34]
	movpos	%icc,	%l1,	%o6
	stb	%i5,	[%l7 + 0x1E]
	lduw	[%l7 + 0x68],	%i7
	fnot2	%f24,	%f20
	lduh	[%l7 + 0x4A],	%i1
	movpos	%icc,	%g7,	%l5
	lduh	[%l7 + 0x54],	%g2
	subccc	%o5,	%g3,	%g6
	movneg	%xcc,	%o7,	%i0
	fcmpne16	%f0,	%f0,	%i4
	fxors	%f9,	%f22,	%f3
	fpack16	%f18,	%f30
	sth	%o1,	[%l7 + 0x34]
	addc	%i6,	%o4,	%i3
	movvc	%xcc,	%l4,	%o0
	orcc	%g4,	%l3,	%g1
	sdivcc	%l0,	0x082E,	%l6
	movcs	%icc,	%o3,	%g5
	movrgez	%l2,	0x0BF,	%o2
	sth	%l1,	[%l7 + 0x1A]
	mulx	%i2,	0x1E15,	%o6
	movre	%i7,	0x113,	%i5
	fmovsl	%icc,	%f24,	%f15
	movre	%i1,	0x1BA,	%l5
	sra	%g2,	%o5,	%g7
	array16	%g6,	%o7,	%i0
	andcc	%g3,	0x112B,	%o1
	subccc	%i4,	%i6,	%o4
	nop
	set	0x68, %i5
	std	%f26,	[%l7 + %i5]
	movcc	%xcc,	%i3,	%l4
	movre	%g4,	0x001,	%o0
	fmovsvs	%xcc,	%f29,	%f19
	fcmpd	%fcc0,	%f26,	%f26
	ldx	[%l7 + 0x78],	%g1
	popc	%l3,	%l0
	fmovdne	%xcc,	%f3,	%f5
	movrne	%l6,	%g5,	%l2
	movn	%xcc,	%o3,	%l1
	fcmped	%fcc1,	%f28,	%f4
	ldsb	[%l7 + 0x6F],	%i2
	movvc	%xcc,	%o2,	%o6
	fzeros	%f13
	movcc	%xcc,	%i5,	%i1
	fmovsa	%icc,	%f5,	%f20
	udivcc	%l5,	0x0184,	%i7
	movn	%xcc,	%o5,	%g7
	and	%g6,	0x189F,	%g2
	edge16ln	%i0,	%g3,	%o7
	fpsub32s	%f11,	%f1,	%f30
	fpackfix	%f14,	%f27
	sdiv	%i4,	0x1D77,	%o1
	sdiv	%i6,	0x0499,	%i3
	save %l4, 0x12BA, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f19,	%f22,	%f4
	edge32ln	%o0,	%g1,	%l3
	edge32l	%l0,	%l6,	%g4
	array32	%g5,	%l2,	%o3
	xnorcc	%l1,	0x1803,	%i2
	fmovsge	%xcc,	%f20,	%f11
	lduh	[%l7 + 0x7A],	%o6
	umul	%i5,	0x11B9,	%i1
	fornot1	%f26,	%f20,	%f0
	addc	%l5,	%i7,	%o5
	movrlz	%o2,	0x0AF,	%g6
	fmovdl	%icc,	%f5,	%f4
	movneg	%icc,	%g7,	%g2
	movg	%icc,	%i0,	%o7
	subc	%g3,	0x0907,	%i4
	ldd	[%l7 + 0x08],	%o0
	movcs	%xcc,	%i3,	%l4
	movvs	%icc,	%i6,	%o4
	edge32l	%g1,	%l3,	%l0
	fors	%f27,	%f17,	%f20
	stw	%l6,	[%l7 + 0x7C]
	ldd	[%l7 + 0x48],	%f16
	or	%g4,	0x1367,	%o0
	nop
	set	0x2D, %i6
	ldub	[%l7 + %i6],	%g5
	xorcc	%l2,	0x18F1,	%o3
	umul	%i2,	0x1EF5,	%o6
	fpadd32s	%f10,	%f0,	%f14
	fxnor	%f2,	%f18,	%f26
	array16	%i5,	%i1,	%l1
	movneg	%xcc,	%i7,	%o5
	sllx	%o2,	0x03,	%g6
	mulscc	%g7,	%g2,	%i0
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	fone	%f22
	stb	%g3,	[%l7 + 0x41]
	andcc	%i4,	%o1,	%i3
	fnors	%f27,	%f1,	%f30
	edge32n	%l4,	%i6,	%g1
	nop
	set	0x25, %i2
	ldub	[%l7 + %i2],	%o4
	mulx	%l3,	0x0124,	%l6
	add	%l0,	0x1B75,	%o0
	fandnot2s	%f1,	%f1,	%f12
	udivcc	%g4,	0x1E13,	%l2
	movg	%icc,	%o3,	%g5
	movrgez	%o6,	0x389,	%i5
	movgu	%icc,	%i2,	%i1
	movcs	%icc,	%l1,	%o5
	sdivcc	%o2,	0x17C3,	%i7
	mova	%xcc,	%g6,	%g2
	ldd	[%l7 + 0x18],	%i0
	umul	%l5,	0x10DC,	%g7
	edge8	%o7,	%g3,	%i4
	array8	%o1,	%l4,	%i6
	edge8n	%g1,	%i3,	%o4
	xor	%l6,	%l3,	%o0
	fcmple32	%f14,	%f4,	%g4
	sdivcc	%l2,	0x0582,	%l0
	fmul8x16al	%f28,	%f27,	%f6
	fmovrsgz	%g5,	%f5,	%f10
	movvc	%xcc,	%o6,	%i5
	edge32ln	%o3,	%i2,	%i1
	mulx	%o5,	0x1397,	%o2
	fnegs	%f27,	%f10
	movge	%xcc,	%l1,	%i7
	ldsh	[%l7 + 0x5A],	%g2
	ldd	[%l7 + 0x78],	%g6
	edge32ln	%i0,	%l5,	%o7
	xor	%g3,	%g7,	%o1
	xor	%i4,	0x0CA6,	%i6
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%l4
	movrgz	%g1,	0x0AC,	%o4
	subc	%l6,	0x1A04,	%i3
	ldd	[%l7 + 0x50],	%f14
	edge32l	%l3,	%g4,	%o0
	movpos	%xcc,	%l2,	%l0
	fmovrslz	%o6,	%f11,	%f29
	move	%icc,	%g5,	%i5
	movrgz	%o3,	0x149,	%i2
	nop
	set	0x70, %o0
	ldsw	[%l7 + %o0],	%o5
	edge16n	%o2,	%l1,	%i1
	fmovsgu	%icc,	%f31,	%f24
	edge16l	%g2,	%g6,	%i0
	srlx	%l5,	%o7,	%g3
	sdivx	%i7,	0x0224,	%g7
	edge16l	%o1,	%i4,	%i6
	movrne	%g1,	%l4,	%l6
	edge8	%i3,	%l3,	%g4
	fands	%f29,	%f21,	%f24
	fmovsg	%xcc,	%f17,	%f6
	srl	%o4,	%o0,	%l2
	movrne	%o6,	%l0,	%g5
	ld	[%l7 + 0x64],	%f10
	edge16l	%i5,	%o3,	%o5
	movre	%o2,	0x28B,	%i2
	alignaddr	%i1,	%l1,	%g2
	and	%i0,	%g6,	%o7
	array8	%l5,	%g3,	%i7
	movg	%xcc,	%g7,	%i4
	movcc	%xcc,	%o1,	%i6
	fmovrdne	%l4,	%f0,	%f8
	fmovspos	%icc,	%f9,	%f9
	fmovrde	%l6,	%f4,	%f28
	fandnot1s	%f17,	%f2,	%f24
	orncc	%i3,	0x1337,	%g1
	movl	%icc,	%l3,	%o4
	move	%xcc,	%o0,	%l2
	movn	%icc,	%o6,	%g4
	fpsub32	%f20,	%f14,	%f2
	save %g5, %i5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x20],	%o3
	sdivx	%o2,	0x1117,	%o5
	fmovscc	%xcc,	%f0,	%f14
	sdivcc	%i1,	0x01B0,	%i2
	movcc	%icc,	%l1,	%g2
	edge32ln	%i0,	%g6,	%l5
	fmul8x16	%f28,	%f4,	%f6
	stx	%o7,	[%l7 + 0x68]
	fmovsa	%icc,	%f18,	%f13
	movg	%icc,	%g3,	%i7
	std	%f10,	[%l7 + 0x38]
	andn	%i4,	%o1,	%i6
	movrgz	%g7,	0x3E8,	%l4
	fmovdge	%icc,	%f22,	%f19
	move	%icc,	%i3,	%l6
	st	%f21,	[%l7 + 0x54]
	movge	%xcc,	%g1,	%l3
	edge8l	%o4,	%l2,	%o0
	stw	%g4,	[%l7 + 0x64]
	sir	0x1891
	alignaddrl	%g5,	%o6,	%l0
	fmul8x16al	%f7,	%f30,	%f14
	movrgez	%i5,	%o2,	%o3
	fnegs	%f6,	%f11
	xorcc	%i1,	%i2,	%l1
	umulcc	%o5,	%g2,	%g6
	st	%f31,	[%l7 + 0x24]
	ld	[%l7 + 0x5C],	%f1
	movleu	%xcc,	%i0,	%o7
	sethi	0x0E93,	%g3
	movg	%icc,	%i7,	%l5
	sll	%i4,	%o1,	%g7
	srax	%i6,	%i3,	%l4
	fmul8sux16	%f8,	%f26,	%f6
	mova	%xcc,	%l6,	%l3
	edge8	%o4,	%l2,	%g1
	ldub	[%l7 + 0x44],	%g4
	fands	%f7,	%f14,	%f8
	lduw	[%l7 + 0x44],	%g5
	restore %o6, %o0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f21,	%f24
	nop
	set	0x1E, %g3
	sth	%o2,	[%l7 + %g3]
	st	%f2,	[%l7 + 0x58]
	edge8l	%o3,	%l0,	%i2
	and	%l1,	%i1,	%g2
	std	%f12,	[%l7 + 0x30]
	movcs	%xcc,	%o5,	%g6
	or	%o7,	0x1C10,	%i0
	sdivx	%g3,	0x0FA2,	%i7
	movg	%icc,	%i4,	%o1
	movre	%l5,	0x076,	%i6
	movge	%icc,	%g7,	%l4
	edge32	%l6,	%i3,	%l3
	fandnot2	%f2,	%f12,	%f0
	edge32ln	%l2,	%o4,	%g4
	std	%f16,	[%l7 + 0x50]
	fmovdne	%icc,	%f5,	%f28
	ldx	[%l7 + 0x38],	%g5
	movrgez	%o6,	%g1,	%i5
	fpadd16	%f0,	%f10,	%f8
	fmovdn	%icc,	%f23,	%f27
	andncc	%o0,	%o2,	%o3
	edge32l	%l0,	%l1,	%i1
	movre	%i2,	0x319,	%o5
	movvc	%xcc,	%g6,	%o7
	xor	%g2,	%i0,	%i7
	movrgez	%i4,	%g3,	%o1
	udiv	%l5,	0x07C9,	%g7
	mulscc	%i6,	0x0915,	%l6
	ldd	[%l7 + 0x28],	%f14
	movpos	%icc,	%i3,	%l4
	fornot2	%f22,	%f22,	%f8
	array32	%l3,	%l2,	%g4
	movleu	%icc,	%g5,	%o6
	fmovdge	%icc,	%f12,	%f19
	movre	%g1,	0x22B,	%i5
	save %o0, %o2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x3C],	%f0
	fornot2s	%f2,	%f25,	%f11
	edge16l	%l0,	%o4,	%i1
	fmovsge	%icc,	%f21,	%f13
	fmovsn	%icc,	%f4,	%f24
	sra	%l1,	%o5,	%i2
	move	%icc,	%o7,	%g2
	sllx	%i0,	%g6,	%i4
	sllx	%i7,	0x04,	%o1
	lduh	[%l7 + 0x48],	%g3
	array16	%g7,	%l5,	%l6
	stw	%i6,	[%l7 + 0x30]
	movvc	%icc,	%i3,	%l4
	std	%f8,	[%l7 + 0x68]
	std	%f22,	[%l7 + 0x40]
	fmovdle	%icc,	%f10,	%f18
	edge16ln	%l2,	%l3,	%g4
	andn	%g5,	0x046E,	%o6
	mulx	%g1,	%i5,	%o0
	alignaddr	%o3,	%o2,	%l0
	nop
	set	0x3A, %l4
	ldub	[%l7 + %l4],	%o4
	subccc	%i1,	%l1,	%i2
	fmovsgu	%xcc,	%f1,	%f8
	ldsw	[%l7 + 0x44],	%o7
	array8	%o5,	%g2,	%i0
	subccc	%i4,	0x15F5,	%g6
	fpadd16	%f0,	%f28,	%f10
	save %i7, %g3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%g7
	srax	%l6,	0x14,	%i6
	sir	0x1BD5
	edge8n	%l5,	%i3,	%l2
	ldd	[%l7 + 0x18],	%l4
	popc	%g4,	%l3
	andncc	%o6,	%g5,	%g1
	fcmpeq16	%f26,	%f6,	%o0
	ldsw	[%l7 + 0x74],	%o3
	movre	%i5,	%l0,	%o2
	edge8ln	%o4,	%l1,	%i1
	fexpand	%f16,	%f4
	fands	%f24,	%f18,	%f9
	lduh	[%l7 + 0x66],	%o7
	fmovdl	%icc,	%f14,	%f14
	fcmpeq16	%f2,	%f20,	%i2
	movge	%xcc,	%o5,	%i0
	movre	%g2,	%i4,	%i7
	edge16l	%g6,	%g3,	%g7
	movvc	%icc,	%o1,	%i6
	edge16ln	%l5,	%i3,	%l2
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	restore %l6, 0x0A8D, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g5,	0x0661,	%o6
	smul	%g1,	%o3,	%i5
	sllx	%l0,	%o2,	%o0
	mulscc	%l1,	0x1DCD,	%o4
	movg	%xcc,	%i1,	%o7
	smul	%i2,	0x0DC7,	%i0
	popc	%o5,	%i4
	umulcc	%i7,	%g2,	%g6
	orcc	%g3,	0x1929,	%o1
	fone	%f2
	array32	%i6,	%l5,	%g7
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i3
	fmovdneg	%icc,	%f22,	%f20
	edge8l	%l4,	%l2,	%g4
	edge32ln	%l3,	%g5,	%l6
	ldsb	[%l7 + 0x2D],	%o6
	movneg	%xcc,	%g1,	%o3
	andcc	%i5,	%o2,	%o0
	edge8	%l0,	%l1,	%i1
	add	%o7,	%o4,	%i2
	st	%f21,	[%l7 + 0x74]
	fmovdcc	%xcc,	%f29,	%f26
	movl	%icc,	%o5,	%i4
	movrne	%i7,	0x16A,	%g2
	fpsub16	%f16,	%f6,	%f14
	mova	%icc,	%i0,	%g6
	movrlez	%o1,	%i6,	%l5
	lduh	[%l7 + 0x22],	%g7
	fxor	%f26,	%f4,	%f2
	subcc	%i3,	0x18C7,	%l4
	andncc	%g3,	%g4,	%l2
	movg	%xcc,	%l3,	%g5
	andn	%o6,	%l6,	%o3
	fmovspos	%xcc,	%f2,	%f0
	movge	%xcc,	%g1,	%o2
	xor	%o0,	0x0329,	%l0
	ldd	[%l7 + 0x40],	%f26
	array8	%i5,	%i1,	%o7
	movrgez	%o4,	0x36F,	%l1
	sub	%o5,	%i4,	%i7
	movle	%icc,	%g2,	%i2
	xorcc	%i0,	%o1,	%g6
	alignaddrl	%i6,	%l5,	%g7
	sllx	%i3,	%l4,	%g4
	orncc	%g3,	0x0504,	%l3
	edge32l	%l2,	%o6,	%g5
	andn	%l6,	%o3,	%o2
	pdist	%f10,	%f18,	%f0
	movgu	%icc,	%o0,	%g1
	move	%icc,	%i5,	%i1
	and	%o7,	0x17E5,	%l0
	fcmpeq32	%f28,	%f14,	%l1
	fornot1	%f14,	%f16,	%f2
	smul	%o4,	%o5,	%i7
	movne	%icc,	%g2,	%i2
	udivx	%i4,	0x0D09,	%o1
	subccc	%g6,	0x1D0A,	%i0
	lduw	[%l7 + 0x60],	%i6
	st	%f22,	[%l7 + 0x58]
	edge8n	%g7,	%i3,	%l4
	fxnor	%f24,	%f4,	%f24
	ldd	[%l7 + 0x40],	%f2
	movvs	%xcc,	%g4,	%l5
	orncc	%g3,	0x0963,	%l3
	fornot1s	%f21,	%f11,	%f4
	movrne	%l2,	0x0C5,	%g5
	movl	%icc,	%o6,	%o3
	udivcc	%o2,	0x1BDE,	%l6
	movcc	%xcc,	%o0,	%i5
	edge16	%i1,	%o7,	%g1
	array32	%l1,	%l0,	%o4
	xnorcc	%i7,	0x1FA9,	%g2
	fmovrsgz	%i2,	%f31,	%f22
	srl	%i4,	%o5,	%g6
	xor	%o1,	0x03B7,	%i0
	srl	%g7,	0x03,	%i3
	addc	%l4,	0x0C8E,	%i6
	movneg	%xcc,	%g4,	%g3
	array32	%l3,	%l2,	%l5
	xnorcc	%g5,	0x1F59,	%o6
	stb	%o2,	[%l7 + 0x10]
	fmovsgu	%xcc,	%f21,	%f7
	movrlz	%l6,	0x22A,	%o3
	fmovsneg	%icc,	%f18,	%f3
	sdiv	%i5,	0x167D,	%i1
	subcc	%o7,	0x1FA5,	%g1
	popc	0x0198,	%l1
	or	%l0,	%o4,	%o0
	fmovsvc	%icc,	%f19,	%f5
	addc	%i7,	0x14A0,	%i2
	orcc	%g2,	0x1ED3,	%o5
	array32	%i4,	%g6,	%o1
	fmovrsne	%i0,	%f29,	%f5
	umulcc	%g7,	%l4,	%i3
	ldsh	[%l7 + 0x14],	%i6
	movle	%icc,	%g4,	%l3
	movne	%xcc,	%g3,	%l5
	st	%f18,	[%l7 + 0x08]
	movvs	%xcc,	%g5,	%l2
	st	%f1,	[%l7 + 0x40]
	movne	%xcc,	%o6,	%o2
	movleu	%xcc,	%o3,	%i5
	fcmpeq16	%f12,	%f22,	%i1
	movleu	%icc,	%o7,	%g1
	fnot1	%f12,	%f28
	movneg	%xcc,	%l6,	%l1
	fpackfix	%f0,	%f0
	mulx	%l0,	0x0072,	%o0
	nop
	set	0x28, %o5
	stw	%i7,	[%l7 + %o5]
	movrlez	%i2,	%g2,	%o4
	sll	%i4,	%o5,	%o1
	srl	%g6,	%i0,	%g7
	movge	%icc,	%l4,	%i3
	edge16n	%i6,	%l3,	%g3
	edge32l	%l5,	%g4,	%l2
	fmul8ulx16	%f14,	%f0,	%f20
	array8	%o6,	%o2,	%g5
	popc	%i5,	%i1
	movne	%xcc,	%o7,	%g1
	add	%l6,	%o3,	%l0
	st	%f14,	[%l7 + 0x30]
	srlx	%o0,	0x16,	%i7
	stw	%l1,	[%l7 + 0x44]
	edge32	%g2,	%i2,	%i4
	xnorcc	%o5,	%o1,	%o4
	orn	%i0,	%g7,	%g6
	xnor	%i3,	0x1471,	%i6
	edge32	%l4,	%l3,	%l5
	faligndata	%f12,	%f6,	%f14
	stw	%g4,	[%l7 + 0x4C]
	sub	%l2,	0x00CE,	%o6
	movneg	%icc,	%o2,	%g5
	fands	%f16,	%f18,	%f25
	sdiv	%i5,	0x02E8,	%i1
	edge8	%g3,	%g1,	%l6
	move	%icc,	%o3,	%l0
	andn	%o7,	%o0,	%l1
	addcc	%i7,	0x09D2,	%i2
	nop
	set	0x70, %i4
	std	%f0,	[%l7 + %i4]
	save %i4, 0x0258, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o1,	0x1A,	%o4
	fpadd16	%f14,	%f8,	%f14
	andn	%g2,	0x03FA,	%i0
	nop
	set	0x40, %l6
	ldsh	[%l7 + %l6],	%g6
	array16	%g7,	%i6,	%i3
	sdiv	%l3,	0x0873,	%l5
	movrlez	%l4,	0x0BF,	%l2
	fandnot1s	%f13,	%f26,	%f4
	edge8n	%o6,	%g4,	%g5
	sll	%o2,	%i5,	%g3
	movvs	%xcc,	%g1,	%l6
	umul	%i1,	0x0560,	%o3
	std	%f16,	[%l7 + 0x30]
	add	%o7,	%o0,	%l0
	addcc	%l1,	0x19BA,	%i2
	xnor	%i4,	%i7,	%o5
	array32	%o4,	%g2,	%o1
	movre	%g6,	0x37D,	%g7
	fandnot2s	%f10,	%f9,	%f10
	fmovrdne	%i6,	%f18,	%f12
	smulcc	%i3,	%i0,	%l3
	movrlez	%l5,	0x0F9,	%l2
	stx	%l4,	[%l7 + 0x60]
	sdivx	%o6,	0x1C4A,	%g5
	edge8n	%o2,	%g4,	%g3
	umulcc	%g1,	0x0AC5,	%l6
	srl	%i5,	%o3,	%o7
	movle	%icc,	%i1,	%o0
	ldub	[%l7 + 0x72],	%l1
	fmovsvs	%xcc,	%f26,	%f3
	stw	%l0,	[%l7 + 0x70]
	movvc	%xcc,	%i2,	%i7
	fmovdle	%xcc,	%f25,	%f0
	fxors	%f28,	%f12,	%f3
	edge16n	%i4,	%o4,	%o5
	fxor	%f24,	%f18,	%f0
	orncc	%g2,	0x12FF,	%g6
	subcc	%g7,	%i6,	%i3
	sir	0x082D
	movleu	%xcc,	%i0,	%o1
	movrlz	%l5,	0x2F0,	%l2
	fmuld8ulx16	%f29,	%f22,	%f28
	udivcc	%l3,	0x15B3,	%o6
	movg	%icc,	%g5,	%o2
	mova	%icc,	%l4,	%g3
	fmovdl	%xcc,	%f23,	%f22
	edge32	%g1,	%g4,	%l6
	fmovsneg	%icc,	%f11,	%f1
	edge32ln	%o3,	%i5,	%o7
	std	%f24,	[%l7 + 0x18]
	edge16ln	%i1,	%o0,	%l1
	srlx	%l0,	0x11,	%i7
	fmovsneg	%icc,	%f1,	%f4
	movcc	%icc,	%i4,	%o4
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	udiv	%g2,	0x00CF,	%i6
	addc	%g7,	0x079B,	%i3
	lduh	[%l7 + 0x16],	%i0
	fcmple16	%f2,	%f24,	%o1
	xnor	%l2,	%l5,	%o6
	movneg	%icc,	%g5,	%l3
	fornot1s	%f11,	%f16,	%f30
	fmuld8ulx16	%f7,	%f3,	%f8
	andn	%o2,	%g3,	%g1
	andn	%g4,	0x0A8E,	%l6
	movrlez	%l4,	%i5,	%o3
	add	%i1,	0x12C6,	%o0
	sethi	0x1D15,	%o7
	sdivcc	%l0,	0x1D0F,	%i7
	array16	%l1,	%i4,	%o4
	fone	%f28
	edge8l	%o5,	%i2,	%g2
	sllx	%g6,	%g7,	%i6
	subc	%i0,	0x12CA,	%i3
	fmovsvc	%icc,	%f30,	%f5
	sra	%l2,	%l5,	%o6
	fxor	%f22,	%f12,	%f10
	fcmpd	%fcc1,	%f8,	%f30
	ldsh	[%l7 + 0x52],	%g5
	ldd	[%l7 + 0x40],	%l2
	fmovsl	%icc,	%f29,	%f21
	alignaddr	%o1,	%g3,	%o2
	udivx	%g4,	0x10F4,	%g1
	fpadd32s	%f10,	%f14,	%f7
	sdivx	%l4,	0x0DA7,	%i5
	popc	%l6,	%o3
	subc	%i1,	%o7,	%o0
	edge32l	%l0,	%i7,	%i4
	srl	%l1,	0x19,	%o5
	subccc	%i2,	%g2,	%g6
	ldsb	[%l7 + 0x73],	%g7
	movcc	%icc,	%i6,	%o4
	ldd	[%l7 + 0x08],	%f30
	addcc	%i3,	%l2,	%i0
	movneg	%icc,	%o6,	%l5
	mulscc	%l3,	%o1,	%g3
	edge32n	%g5,	%g4,	%o2
	srlx	%l4,	%i5,	%l6
	fmovrsne	%o3,	%f21,	%f11
	andncc	%g1,	%i1,	%o0
	nop
	set	0x10, %i1
	std	%f8,	[%l7 + %i1]
	sdivcc	%o7,	0x18A6,	%l0
	fmovrdgez	%i7,	%f2,	%f22
	std	%f2,	[%l7 + 0x40]
	edge16n	%l1,	%i4,	%i2
	sdivcc	%o5,	0x109E,	%g6
	array16	%g2,	%i6,	%g7
	movrlz	%o4,	%l2,	%i0
	array32	%o6,	%l5,	%l3
	movg	%icc,	%i3,	%o1
	movrlez	%g5,	0x0F5,	%g4
	movrne	%o2,	%g3,	%i5
	ld	[%l7 + 0x48],	%f27
	fmovsne	%icc,	%f27,	%f9
	andn	%l6,	0x0E1C,	%l4
	popc	0x1917,	%o3
	lduw	[%l7 + 0x28],	%g1
	andn	%o0,	%i1,	%l0
	andncc	%o7,	%l1,	%i7
	srlx	%i2,	%o5,	%i4
	move	%xcc,	%g6,	%i6
	array32	%g7,	%g2,	%l2
	sra	%o4,	0x1F,	%o6
	fmovdcs	%icc,	%f31,	%f29
	fmovsn	%xcc,	%f25,	%f3
	fxnor	%f6,	%f18,	%f8
	movrgez	%l5,	%l3,	%i3
	mova	%icc,	%i0,	%o1
	stw	%g4,	[%l7 + 0x10]
	stw	%g5,	[%l7 + 0x24]
	ldsw	[%l7 + 0x08],	%o2
	fmovrdlez	%i5,	%f14,	%f8
	srax	%l6,	%g3,	%l4
	movcc	%icc,	%o3,	%g1
	mova	%icc,	%o0,	%l0
	umulcc	%o7,	%l1,	%i7
	fxnor	%f0,	%f20,	%f18
	fmovdpos	%icc,	%f21,	%f15
	fmovrdgez	%i1,	%f30,	%f12
	sir	0x002D
	siam	0x7
	move	%icc,	%o5,	%i2
	andn	%i4,	0x0BE6,	%i6
	udivx	%g7,	0x0231,	%g6
	ldd	[%l7 + 0x38],	%g2
	ldd	[%l7 + 0x28],	%f14
	array8	%l2,	%o4,	%o6
	fmovdpos	%xcc,	%f11,	%f5
	umulcc	%l3,	0x03E9,	%i3
	orcc	%i0,	0x1C49,	%o1
	movne	%icc,	%g4,	%l5
	fmuld8ulx16	%f30,	%f1,	%f14
	save %g5, %i5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l6,	%g3,	%l4
	ldub	[%l7 + 0x51],	%g1
	movrgez	%o0,	%l0,	%o7
	sll	%l1,	0x13,	%o3
	fmovrdgz	%i1,	%f30,	%f26
	ldsw	[%l7 + 0x18],	%o5
	movrgez	%i2,	0x224,	%i7
	movne	%xcc,	%i4,	%g7
	fmovdg	%xcc,	%f9,	%f16
	mulx	%i6,	0x0E15,	%g2
	edge32l	%l2,	%o4,	%o6
	edge32	%g6,	%l3,	%i0
	fornot2s	%f13,	%f5,	%f12
	movrlz	%o1,	0x299,	%i3
	movvc	%icc,	%l5,	%g4
	fmovspos	%xcc,	%f7,	%f6
	andncc	%i5,	%g5,	%l6
	srlx	%g3,	0x16,	%l4
	srax	%o2,	%o0,	%l0
	xnor	%g1,	%o7,	%l1
	movl	%icc,	%o3,	%i1
	fmovrsgz	%o5,	%f16,	%f3
	andcc	%i7,	0x0D8A,	%i2
	fmuld8ulx16	%f9,	%f27,	%f18
	edge32ln	%i4,	%i6,	%g7
	sdivx	%l2,	0x0913,	%g2
	sth	%o6,	[%l7 + 0x0A]
	fcmpgt32	%f30,	%f20,	%o4
	subccc	%g6,	0x1942,	%l3
	fmovsg	%xcc,	%f8,	%f7
	fands	%f0,	%f13,	%f30
	andn	%i0,	0x0EF5,	%i3
	addc	%o1,	0x0EFE,	%g4
	fcmps	%fcc3,	%f9,	%f2
	fxnors	%f8,	%f10,	%f19
	alignaddr	%i5,	%g5,	%l6
	restore %l5, 0x0A01, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f3,	%f4
	srax	%o2,	%l4,	%l0
	fornot2s	%f22,	%f31,	%f11
	movrgz	%o0,	0x22F,	%o7
	subcc	%l1,	0x1BF3,	%o3
	fnot1	%f22,	%f16
	movg	%icc,	%g1,	%o5
	xnor	%i7,	0x02C0,	%i1
	edge8ln	%i4,	%i2,	%g7
	save %l2, %g2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f21
	movvc	%icc,	%o4,	%i6
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	fcmpeq16	%f2,	%f26,	%g6
	lduw	[%l7 + 0x08],	%o1
	fcmple32	%f0,	%f26,	%g4
	sllx	%i5,	%g5,	%l6
	fcmped	%fcc0,	%f8,	%f30
	or	%l5,	0x0ABB,	%o2
	edge16n	%g3,	%l4,	%o0
	or	%l0,	%o7,	%o3
	fones	%f14
	movrlez	%g1,	%l1,	%o5
	xnorcc	%i7,	%i4,	%i2
	edge8n	%i1,	%l2,	%g2
	edge32n	%o6,	%g7,	%o4
	subc	%l3,	0x0855,	%i6
	smul	%i3,	%g6,	%o1
	array16	%g4,	%i0,	%g5
	movleu	%xcc,	%i5,	%l5
	fmovrdgez	%l6,	%f24,	%f2
	fmovsvs	%xcc,	%f13,	%f7
	mulscc	%g3,	%l4,	%o2
	fabss	%f20,	%f17
	fnors	%f27,	%f29,	%f12
	fcmpne32	%f14,	%f28,	%l0
	add	%o7,	%o3,	%o0
	ldd	[%l7 + 0x78],	%g0
	fcmps	%fcc1,	%f28,	%f25
	st	%f18,	[%l7 + 0x54]
	orn	%o5,	0x0A0D,	%l1
	movvc	%xcc,	%i4,	%i7
	fcmpd	%fcc3,	%f28,	%f30
	fmovrde	%i1,	%f12,	%f30
	fzeros	%f25
	movne	%icc,	%i2,	%g2
	fzero	%f22
	sra	%l2,	0x17,	%g7
	or	%o4,	0x1661,	%o6
	orn	%l3,	%i6,	%g6
	or	%i3,	%o1,	%i0
	andncc	%g4,	%g5,	%i5
	fmovrdne	%l6,	%f8,	%f2
	fornot2	%f8,	%f24,	%f2
	movrgez	%g3,	0x20A,	%l5
	udivcc	%o2,	0x044C,	%l0
	andn	%o7,	%o3,	%l4
	sub	%o0,	0x01D4,	%g1
	array16	%l1,	%i4,	%i7
	popc	%o5,	%i1
	movrlz	%i2,	%l2,	%g7
	or	%o4,	%g2,	%o6
	move	%xcc,	%i6,	%l3
	movrgz	%g6,	%i3,	%o1
	udiv	%i0,	0x0357,	%g4
	move	%xcc,	%g5,	%l6
	fpsub32	%f26,	%f8,	%f8
	save %i5, 0x19DD, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l5,	%l0,	%o2
	fexpand	%f14,	%f10
	movneg	%icc,	%o3,	%l4
	edge8	%o7,	%o0,	%l1
	xorcc	%g1,	%i7,	%i4
	st	%f27,	[%l7 + 0x58]
	umulcc	%o5,	%i2,	%l2
	popc	%g7,	%o4
	orn	%g2,	0x18A2,	%o6
	movvc	%icc,	%i6,	%l3
	orn	%g6,	0x07B7,	%i3
	srax	%i1,	0x0A,	%o1
	edge32	%g4,	%i0,	%l6
	edge32n	%i5,	%g5,	%l5
	stw	%l0,	[%l7 + 0x40]
	movrgez	%g3,	%o2,	%o3
	fpack16	%f18,	%f10
	movrne	%o7,	0x280,	%o0
	umul	%l1,	%l4,	%i7
	fmovsgu	%xcc,	%f29,	%f9
	fexpand	%f16,	%f20
	move	%xcc,	%i4,	%g1
	fandnot1s	%f10,	%f13,	%f16
	ldsw	[%l7 + 0x1C],	%i2
	fmovdvc	%icc,	%f2,	%f1
	fxnor	%f16,	%f20,	%f28
	ldsb	[%l7 + 0x5D],	%l2
	sir	0x0F9E
	addc	%o5,	0x0DBB,	%g7
	fmovsg	%icc,	%f25,	%f10
	fmovdcc	%icc,	%f25,	%f14
	edge32n	%g2,	%o4,	%o6
	movre	%i6,	%l3,	%i3
	fpsub32s	%f24,	%f25,	%f22
	movg	%xcc,	%i1,	%g6
	mulscc	%o1,	0x17AA,	%i0
	array16	%l6,	%g4,	%g5
	nop
	set	0x58, %o3
	std	%f12,	[%l7 + %o3]
	udiv	%l5,	0x1B78,	%l0
	stx	%g3,	[%l7 + 0x40]
	and	%i5,	%o3,	%o7
	xor	%o2,	0x15D5,	%l1
	umul	%l4,	0x18A0,	%i7
	ldx	[%l7 + 0x20],	%o0
	umulcc	%g1,	0x0635,	%i2
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%i4
	movcs	%xcc,	%o5,	%l2
	edge32ln	%g7,	%g2,	%o4
	save %i6, 0x19E9, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f9,	%f8,	%f8
	fmuld8sux16	%f4,	%f9,	%f6
	movneg	%icc,	%l3,	%i3
	fmovrdlz	%i1,	%f6,	%f6
	stw	%g6,	[%l7 + 0x60]
	movvs	%icc,	%o1,	%l6
	movn	%icc,	%g4,	%g5
	movleu	%icc,	%i0,	%l0
	add	%g3,	%l5,	%i5
	andncc	%o7,	%o3,	%o2
	udivcc	%l1,	0x1433,	%i7
	movle	%icc,	%o0,	%l4
	movrlez	%g1,	%i4,	%i2
	save %l2, %g7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%g2,	%f3,	%f21
	fmovrslez	%o4,	%f11,	%f4
	movneg	%icc,	%i6,	%l3
	fmovdgu	%xcc,	%f24,	%f29
	ldsw	[%l7 + 0x34],	%i3
	lduh	[%l7 + 0x14],	%o6
	umul	%g6,	0x184E,	%o1
	srl	%i1,	0x15,	%l6
	xorcc	%g4,	0x1C98,	%i0
	edge8l	%g5,	%l0,	%l5
	restore %g3, %i5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o7,	%o2
	faligndata	%f2,	%f26,	%f30
	fpmerge	%f15,	%f2,	%f6
	fxnors	%f22,	%f29,	%f17
	addc	%l1,	%i7,	%o0
	fmovrdgz	%l4,	%f4,	%f10
	mulx	%i4,	0x01C4,	%g1
	andcc	%l2,	%g7,	%i2
	ld	[%l7 + 0x1C],	%f3
	movneg	%xcc,	%g2,	%o5
	xnorcc	%o4,	0x15C7,	%i6
	movpos	%xcc,	%i3,	%l3
	fcmpes	%fcc2,	%f18,	%f11
	fcmpes	%fcc3,	%f29,	%f20
	movge	%xcc,	%g6,	%o1
	stw	%o6,	[%l7 + 0x74]
	sllx	%i1,	0x1B,	%l6
	edge8ln	%g4,	%i0,	%l0
	subcc	%g5,	0x1559,	%g3
	xor	%l5,	%i5,	%o7
	fmovsl	%xcc,	%f28,	%f27
	srl	%o3,	%o2,	%l1
	popc	%i7,	%o0
	fnot1s	%f11,	%f7
	movrgez	%l4,	%i4,	%g1
	and	%g7,	0x0708,	%i2
	movl	%xcc,	%g2,	%o5
	movrgz	%l2,	0x3A1,	%i6
	sdivx	%i3,	0x0377,	%o4
	fmovrslz	%g6,	%f23,	%f16
	edge16l	%o1,	%o6,	%l3
	andn	%l6,	%g4,	%i1
	subc	%i0,	0x172B,	%l0
	ld	[%l7 + 0x50],	%f31
	edge16ln	%g3,	%l5,	%g5
	ldub	[%l7 + 0x62],	%i5
	std	%f12,	[%l7 + 0x78]
	addccc	%o3,	0x1C9B,	%o2
	movleu	%xcc,	%l1,	%o7
	fcmpd	%fcc3,	%f2,	%f6
	ldsw	[%l7 + 0x1C],	%i7
	fcmpeq16	%f18,	%f26,	%o0
	array32	%l4,	%i4,	%g7
	fmovsneg	%xcc,	%f30,	%f18
	edge16n	%i2,	%g2,	%g1
	fnand	%f12,	%f24,	%f12
	alignaddr	%l2,	%i6,	%i3
	movgu	%icc,	%o5,	%g6
	fmovsg	%icc,	%f22,	%f20
	mova	%icc,	%o1,	%o6
	sll	%l3,	%l6,	%g4
	fornot1	%f28,	%f28,	%f2
	edge16	%i1,	%i0,	%l0
	movl	%xcc,	%g3,	%l5
	save %g5, %i5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o4,	%l1,	%o7
	alignaddrl	%i7,	%o0,	%o2
	fzero	%f22
	edge32	%i4,	%l4,	%i2
	xnorcc	%g2,	0x07E6,	%g7
	fandnot1	%f22,	%f0,	%f16
	movgu	%xcc,	%l2,	%g1
	fcmpd	%fcc2,	%f4,	%f6
	movpos	%icc,	%i6,	%i3
	mulscc	%o5,	%g6,	%o1
	siam	0x7
	fandnot2s	%f16,	%f21,	%f4
	subcc	%o6,	0x1897,	%l3
	save %l6, %g4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l0,	%i0,	%g3
	mulscc	%l5,	%i5,	%g5
	movcs	%icc,	%o3,	%l1
	edge32	%o4,	%i7,	%o0
	fmovrsne	%o7,	%f15,	%f27
	edge16ln	%i4,	%l4,	%i2
	sll	%g2,	0x15,	%g7
	bshuffle	%f28,	%f20,	%f8
	xnorcc	%l2,	%o2,	%i6
	ldd	[%l7 + 0x10],	%i2
	fmovrslez	%o5,	%f30,	%f20
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f16
	edge32ln	%g1,	%o1,	%g6
	ldub	[%l7 + 0x51],	%o6
	edge8n	%l3,	%g4,	%i1
	smulcc	%l6,	%i0,	%g3
	sdivcc	%l5,	0x08B9,	%l0
	ldub	[%l7 + 0x30],	%g5
	fcmple16	%f26,	%f10,	%i5
	edge8l	%o3,	%o4,	%i7
	movpos	%icc,	%l1,	%o0
	umulcc	%i4,	%o7,	%i2
	fcmps	%fcc0,	%f10,	%f13
	edge16ln	%g2,	%g7,	%l4
	movvc	%xcc,	%o2,	%i6
	movcs	%icc,	%i3,	%l2
	or	%o5,	%g1,	%g6
	edge32n	%o1,	%o6,	%l3
	subcc	%g4,	0x15D4,	%l6
	edge16l	%i0,	%i1,	%l5
	lduh	[%l7 + 0x22],	%l0
	xor	%g3,	%g5,	%o3
	movcs	%xcc,	%i5,	%i7
	movl	%icc,	%o4,	%o0
	fcmpgt16	%f0,	%f8,	%i4
	xorcc	%l1,	%o7,	%g2
	fsrc1	%f22,	%f24
	movvs	%xcc,	%i2,	%l4
	andn	%g7,	%o2,	%i6
	fpsub32s	%f16,	%f29,	%f16
	fmovdg	%xcc,	%f8,	%f16
	array16	%l2,	%i3,	%g1
	orncc	%o5,	0x01AE,	%g6
	for	%f10,	%f18,	%f18
	movrne	%o1,	0x1C4,	%o6
	fpack32	%f8,	%f2,	%f16
	movrgez	%l3,	%g4,	%l6
	subc	%i0,	%l5,	%l0
	array32	%i1,	%g5,	%g3
	fmovsne	%xcc,	%f27,	%f9
	orcc	%i5,	0x081E,	%o3
	array32	%o4,	%i7,	%o0
	sdivx	%l1,	0x10BC,	%i4
	fmovdgu	%xcc,	%f19,	%f20
	fmovse	%xcc,	%f9,	%f2
	smul	%o7,	%g2,	%l4
	edge16n	%i2,	%g7,	%o2
	edge8l	%i6,	%i3,	%g1
	sth	%l2,	[%l7 + 0x6A]
	movne	%icc,	%o5,	%o1
	fmovrsgez	%g6,	%f18,	%f9
	xnor	%o6,	%g4,	%l3
	save %l6, %i0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i1,	[%l7 + 0x62]
	fand	%f14,	%f10,	%f28
	edge16ln	%l5,	%g3,	%i5
	subc	%g5,	0x1D51,	%o3
	fmovsl	%icc,	%f31,	%f3
	srax	%o4,	0x1E,	%o0
	movvc	%xcc,	%i7,	%l1
	orncc	%o7,	%i4,	%l4
	sth	%i2,	[%l7 + 0x22]
	fone	%f12
	orncc	%g7,	%o2,	%g2
	fmovdgu	%icc,	%f10,	%f31
	movrgez	%i6,	0x31B,	%i3
	fmovsleu	%xcc,	%f26,	%f4
	ldd	[%l7 + 0x60],	%f10
	std	%f18,	[%l7 + 0x10]
	sdivcc	%g1,	0x013E,	%l2
	movpos	%icc,	%o5,	%o1
	movl	%icc,	%g6,	%o6
	fmovdg	%icc,	%f15,	%f30
	movne	%icc,	%l3,	%l6
	sllx	%i0,	%g4,	%l0
	sth	%i1,	[%l7 + 0x0A]
	movrgz	%l5,	0x3D9,	%i5
	fmovda	%xcc,	%f19,	%f23
	subccc	%g5,	0x0522,	%o3
	smulcc	%o4,	0x077D,	%o0
	edge8	%i7,	%l1,	%g3
	fsrc1	%f30,	%f16
	fand	%f30,	%f16,	%f10
	subccc	%o7,	0x09DE,	%i4
	stx	%l4,	[%l7 + 0x08]
	nop
	set	0x38, %g2
	stx	%g7,	[%l7 + %g2]
	sethi	0x0594,	%o2
	udivcc	%i2,	0x152F,	%g2
	fandnot1	%f26,	%f0,	%f4
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	movgu	%icc,	%g1,	%o5
	fandnot2s	%f4,	%f22,	%f14
	edge32	%o1,	%g6,	%l2
	orcc	%o6,	%l6,	%i0
	edge16	%l3,	%l0,	%g4
	umul	%l5,	%i5,	%g5
	edge8l	%i1,	%o3,	%o0
	srax	%o4,	0x0D,	%l1
	stw	%g3,	[%l7 + 0x44]
	ld	[%l7 + 0x30],	%f6
	edge32ln	%o7,	%i4,	%l4
	lduw	[%l7 + 0x3C],	%i7
	xnorcc	%g7,	%o2,	%g2
	array16	%i3,	%i6,	%i2
	fornot1s	%f2,	%f14,	%f22
	sdivcc	%g1,	0x0EB5,	%o5
	array16	%o1,	%l2,	%g6
	fmovrdgz	%l6,	%f2,	%f14
	srax	%i0,	0x0C,	%o6
	movge	%icc,	%l3,	%l0
	fnand	%f24,	%f14,	%f4
	movgu	%icc,	%g4,	%l5
	xnorcc	%g5,	%i1,	%i5
	edge8	%o0,	%o3,	%o4
	movrne	%l1,	0x1F4,	%g3
	xor	%o7,	0x1391,	%l4
	movcs	%xcc,	%i4,	%i7
	sll	%o2,	0x08,	%g7
	movgu	%xcc,	%g2,	%i6
	fsrc1	%f0,	%f20
	sdivcc	%i2,	0x1438,	%g1
	fmovda	%xcc,	%f8,	%f11
	andn	%o5,	%o1,	%l2
	movg	%xcc,	%i3,	%g6
	fmovrdgz	%i0,	%f8,	%f14
	movg	%icc,	%o6,	%l3
	edge8	%l6,	%g4,	%l5
	fand	%f8,	%f22,	%f30
	addc	%g5,	0x0CEB,	%i1
	srl	%i5,	0x14,	%o0
	fmovdne	%icc,	%f4,	%f4
	edge32n	%o3,	%l0,	%o4
	fmovrsgez	%l1,	%f9,	%f20
	ldd	[%l7 + 0x28],	%f4
	edge8n	%o7,	%l4,	%i4
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%g2
	fpadd16	%f4,	%f24,	%f30
	lduw	[%l7 + 0x1C],	%i7
	ldsh	[%l7 + 0x44],	%o2
	fmuld8ulx16	%f19,	%f28,	%f14
	fmovsa	%icc,	%f31,	%f30
	fcmpes	%fcc0,	%f23,	%f5
	udivcc	%g2,	0x1487,	%g7
	mova	%icc,	%i6,	%g1
	fmul8x16	%f8,	%f30,	%f28
	smul	%o5,	%o1,	%l2
	ldsh	[%l7 + 0x20],	%i2
	st	%f14,	[%l7 + 0x74]
	movleu	%icc,	%i3,	%i0
	orncc	%o6,	%l3,	%g6
	sra	%g4,	%l6,	%l5
	fmovdl	%icc,	%f15,	%f5
	subc	%i1,	0x0FF2,	%i5
	array32	%g5,	%o3,	%l0
	edge8n	%o4,	%o0,	%o7
	stb	%l4,	[%l7 + 0x3E]
	fmovsg	%icc,	%f6,	%f9
	std	%f6,	[%l7 + 0x50]
	alignaddr	%i4,	%g3,	%i7
	fnot2	%f22,	%f18
	fmovdge	%xcc,	%f5,	%f22
	fornot1s	%f20,	%f26,	%f20
	xnor	%o2,	%g2,	%l1
	orn	%i6,	%g1,	%g7
	udivcc	%o5,	0x1EF3,	%o1
	fmovdne	%xcc,	%f3,	%f13
	ldd	[%l7 + 0x08],	%f12
	andcc	%l2,	0x189D,	%i2
	st	%f29,	[%l7 + 0x48]
	fnot1	%f6,	%f24
	addc	%i0,	%o6,	%l3
	sra	%g6,	0x1C,	%i3
	movvs	%xcc,	%l6,	%l5
	nop
	set	0x60, %l1
	sth	%i1,	[%l7 + %l1]
	fpsub32	%f22,	%f26,	%f20
	smulcc	%i5,	0x1FD9,	%g4
	edge8n	%o3,	%l0,	%g5
	and	%o0,	%o7,	%o4
	alignaddr	%l4,	%i4,	%g3
	lduw	[%l7 + 0x50],	%o2
	edge32l	%g2,	%l1,	%i7
	ldx	[%l7 + 0x68],	%g1
	save %g7, %o5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o1, %i2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l2,	%l3,	%g6
	umulcc	%o6,	0x1D97,	%i3
	sth	%l5,	[%l7 + 0x40]
	movvs	%icc,	%l6,	%i5
	orn	%g4,	%i1,	%o3
	subcc	%l0,	0x1AA0,	%o0
	mova	%xcc,	%o7,	%o4
	movgu	%icc,	%l4,	%i4
	udivcc	%g5,	0x12CE,	%g3
	st	%f16,	[%l7 + 0x6C]
	subccc	%o2,	%l1,	%i7
	fandnot1s	%f30,	%f20,	%f15
	fmovspos	%xcc,	%f21,	%f29
	edge16	%g1,	%g7,	%o5
	movrlez	%g2,	%o1,	%i2
	umul	%i6,	%i0,	%l2
	edge8	%g6,	%l3,	%o6
	orcc	%i3,	0x1F91,	%l6
	movneg	%xcc,	%l5,	%g4
	xnorcc	%i1,	0x1684,	%o3
	sdiv	%l0,	0x04BA,	%i5
	ldsh	[%l7 + 0x50],	%o7
	andn	%o4,	0x09DF,	%l4
	sll	%o0,	%i4,	%g5
	ldx	[%l7 + 0x28],	%o2
	fornot2	%f8,	%f2,	%f20
	alignaddr	%l1,	%i7,	%g1
	edge16ln	%g3,	%g7,	%o5
	mova	%xcc,	%o1,	%g2
	edge16ln	%i2,	%i0,	%l2
	fcmpes	%fcc1,	%f17,	%f9
	sethi	0x1E53,	%g6
	mulscc	%i6,	%o6,	%i3
	fmovsgu	%icc,	%f21,	%f31
	movcc	%icc,	%l6,	%l3
	fmovrsgez	%g4,	%f7,	%f1
	srl	%i1,	0x0F,	%l5
	sra	%l0,	0x02,	%o3
	andn	%i5,	0x18AA,	%o4
	movrgz	%l4,	%o0,	%o7
	fmovspos	%icc,	%f4,	%f30
	array16	%g5,	%o2,	%i4
	fabsd	%f26,	%f30
	movrgez	%l1,	%i7,	%g1
	stb	%g3,	[%l7 + 0x5C]
	fmovdpos	%icc,	%f0,	%f26
	edge8ln	%o5,	%g7,	%g2
	xnor	%i2,	%o1,	%i0
	sdivx	%g6,	0x07C5,	%l2
	sdivcc	%o6,	0x05E2,	%i3
	movre	%i6,	%l6,	%l3
	edge32n	%g4,	%l5,	%l0
	stx	%i1,	[%l7 + 0x08]
	sdivx	%o3,	0x0BE4,	%i5
	udivcc	%l4,	0x0502,	%o4
	fzeros	%f25
	subc	%o0,	%g5,	%o7
	edge8n	%i4,	%l1,	%o2
	edge8l	%i7,	%g1,	%o5
	alignaddrl	%g7,	%g3,	%g2
	movrgz	%i2,	0x137,	%o1
	edge32	%i0,	%l2,	%o6
	fcmpeq32	%f4,	%f22,	%i3
	srl	%g6,	%i6,	%l6
	ld	[%l7 + 0x20],	%f21
	subcc	%g4,	0x1AFD,	%l5
	xnorcc	%l3,	%i1,	%o3
	smulcc	%i5,	%l0,	%o4
	edge32l	%l4,	%o0,	%o7
	mulx	%i4,	%l1,	%g5
	fpadd32	%f4,	%f12,	%f22
	movge	%icc,	%i7,	%o2
	ldx	[%l7 + 0x68],	%g1
	save %g7, 0x05F5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	%i2,	%o1
	movl	%icc,	%g2,	%l2
	array8	%o6,	%i3,	%i0
	edge32	%i6,	%l6,	%g6
	edge16l	%l5,	%g4,	%i1
	fpack16	%f8,	%f12
	edge8ln	%l3,	%i5,	%o3
	movpos	%xcc,	%l0,	%l4
	movg	%xcc,	%o0,	%o4
	movgu	%xcc,	%o7,	%i4
	fmovdcc	%icc,	%f25,	%f13
	ldsb	[%l7 + 0x37],	%g5
	ldsw	[%l7 + 0x5C],	%l1
	subc	%o2,	%i7,	%g1
	ldx	[%l7 + 0x38],	%o5
	fsrc2s	%f21,	%f22
	movpos	%icc,	%g7,	%g3
	movvs	%icc,	%o1,	%g2
	lduw	[%l7 + 0x58],	%i2
	xor	%l2,	%i3,	%i0
	udivx	%o6,	0x0431,	%l6
	movrgz	%i6,	0x1AC,	%l5
	xorcc	%g4,	0x0169,	%g6
	popc	0x1BAB,	%l3
	st	%f12,	[%l7 + 0x3C]
	fmovrsne	%i1,	%f1,	%f31
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%i5
	ldsb	[%l7 + 0x19],	%o3
	movneg	%xcc,	%l4,	%l0
	movvs	%icc,	%o4,	%o7
	xnorcc	%o0,	%i4,	%g5
	addc	%o2,	0x1727,	%l1
	addccc	%g1,	%i7,	%o5
	sdivcc	%g7,	0x00B2,	%g3
	ldsh	[%l7 + 0x7C],	%g2
	fnand	%f24,	%f28,	%f30
	fmovdvc	%icc,	%f5,	%f30
	addcc	%i2,	0x11CE,	%o1
	edge8l	%i3,	%i0,	%l2
	fmovdn	%icc,	%f28,	%f17
	edge32	%o6,	%l6,	%i6
	fmovda	%icc,	%f3,	%f8
	srax	%l5,	%g4,	%l3
	edge16l	%g6,	%i1,	%o3
	umulcc	%i5,	%l0,	%o4
	sllx	%o7,	0x1F,	%l4
	edge8n	%o0,	%g5,	%i4
	fmovscc	%icc,	%f18,	%f5
	subc	%l1,	%g1,	%i7
	edge16n	%o5,	%o2,	%g3
	edge32n	%g7,	%g2,	%o1
	movg	%icc,	%i2,	%i0
	lduw	[%l7 + 0x60],	%i3
	fnot2s	%f10,	%f10
	fcmple16	%f30,	%f16,	%o6
	addccc	%l6,	%i6,	%l5
	smulcc	%l2,	%g4,	%l3
	fnot1s	%f25,	%f1
	nop
	set	0x70, %g5
	std	%f18,	[%l7 + %g5]
	movcc	%icc,	%i1,	%g6
	lduh	[%l7 + 0x24],	%o3
	fandnot2s	%f26,	%f9,	%f17
	sdivx	%i5,	0x0334,	%l0
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	addccc	%g5,	%o0,	%i4
	fmovsn	%xcc,	%f30,	%f19
	fmovdvc	%xcc,	%f29,	%f20
	fandnot2s	%f20,	%f22,	%f12
	subccc	%g1,	0x0020,	%l1
	edge16l	%o5,	%i7,	%o2
	save %g7, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i2,	%o1,	%i3
	xnorcc	%i0,	%l6,	%o6
	stx	%i6,	[%l7 + 0x70]
	fmovrdgz	%l2,	%f8,	%f10
	movrne	%g4,	%l3,	%i1
	movle	%icc,	%l5,	%o3
	fmul8ulx16	%f16,	%f0,	%f28
	fcmpgt16	%f30,	%f20,	%i5
	edge8	%g6,	%o7,	%l0
	sra	%l4,	0x18,	%o4
	srlx	%g5,	%o0,	%i4
	movpos	%icc,	%l1,	%o5
	fpsub16	%f16,	%f6,	%f24
	sub	%g1,	0x0C98,	%o2
	ld	[%l7 + 0x7C],	%f23
	fmovrsgz	%g7,	%f27,	%f8
	xnor	%i7,	%g2,	%i2
	movpos	%icc,	%o1,	%g3
	fnot2	%f8,	%f26
	udiv	%i0,	0x039B,	%i3
	fsrc1	%f4,	%f14
	movgu	%xcc,	%o6,	%l6
	movrlez	%l2,	0x0BC,	%i6
	andcc	%g4,	%i1,	%l5
	fmovrslz	%l3,	%f11,	%f18
	fmovscc	%icc,	%f22,	%f26
	sth	%o3,	[%l7 + 0x4C]
	movrlz	%i5,	0x016,	%g6
	lduh	[%l7 + 0x48],	%l0
	fandnot2	%f22,	%f8,	%f18
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f20
	ldd	[%l7 + 0x78],	%f16
	xnor	%l4,	%o4,	%g5
	sllx	%o0,	%o7,	%i4
	edge8l	%l1,	%o5,	%o2
	array8	%g7,	%g1,	%g2
	movn	%xcc,	%i7,	%i2
	alignaddr	%g3,	%i0,	%o1
	ldub	[%l7 + 0x75],	%i3
	movleu	%icc,	%o6,	%l2
	fmovrdgz	%i6,	%f22,	%f2
	fornot2	%f24,	%f26,	%f2
	fmovrdlez	%l6,	%f2,	%f20
	movcs	%xcc,	%i1,	%l5
	srlx	%l3,	0x0B,	%o3
	movne	%xcc,	%g4,	%i5
	edge16	%g6,	%l4,	%o4
	movg	%xcc,	%l0,	%g5
	movvs	%xcc,	%o7,	%o0
	movle	%icc,	%i4,	%l1
	mulx	%o2,	0x1E59,	%o5
	edge16l	%g7,	%g1,	%i7
	sir	0x151C
	fcmpeq16	%f24,	%f12,	%g2
	movcs	%icc,	%i2,	%g3
	movrne	%o1,	0x0BB,	%i3
	srlx	%o6,	%l2,	%i0
	st	%f24,	[%l7 + 0x74]
	movge	%xcc,	%l6,	%i6
	fmovrslz	%i1,	%f12,	%f11
	fmovsle	%icc,	%f25,	%f18
	nop
	set	0x5E, %o6
	stb	%l3,	[%l7 + %o6]
	movn	%xcc,	%l5,	%g4
	st	%f2,	[%l7 + 0x78]
	ldsw	[%l7 + 0x50],	%o3
	ldx	[%l7 + 0x30],	%i5
	fsrc1s	%f28,	%f2
	fmovsvs	%icc,	%f13,	%f24
	edge16l	%l4,	%o4,	%g6
	ldsw	[%l7 + 0x30],	%g5
	andncc	%o7,	%l0,	%o0
	stw	%l1,	[%l7 + 0x34]
	add	%o2,	0x0D7A,	%i4
	sir	0x01B6
	xnor	%o5,	%g1,	%g7
	sdivx	%g2,	0x1A4D,	%i2
	sra	%g3,	0x15,	%o1
	popc	%i7,	%o6
	stx	%l2,	[%l7 + 0x70]
	lduw	[%l7 + 0x58],	%i3
	fcmpeq16	%f26,	%f8,	%i0
	edge16ln	%i6,	%l6,	%l3
	alignaddr	%i1,	%l5,	%g4
	st	%f11,	[%l7 + 0x5C]
	ldx	[%l7 + 0x30],	%i5
	fxnors	%f13,	%f12,	%f15
	fmovd	%f12,	%f2
	andncc	%o3,	%l4,	%o4
	edge32l	%g5,	%g6,	%o7
	std	%f28,	[%l7 + 0x10]
	movvs	%icc,	%l0,	%l1
	fmovrde	%o2,	%f24,	%f28
	ldd	[%l7 + 0x20],	%f28
	edge32l	%i4,	%o5,	%g1
	edge8l	%o0,	%g2,	%i2
	movneg	%xcc,	%g7,	%g3
	ldsh	[%l7 + 0x4A],	%o1
	fmovsge	%icc,	%f30,	%f8
	addccc	%i7,	%l2,	%i3
	movpos	%xcc,	%o6,	%i6
	ldub	[%l7 + 0x5D],	%l6
	fzero	%f8
	movl	%xcc,	%i0,	%l3
	subc	%i1,	%g4,	%i5
	movne	%xcc,	%l5,	%l4
	orncc	%o4,	0x0DC3,	%o3
	ldsw	[%l7 + 0x14],	%g6
	udivx	%o7,	0x0E36,	%g5
	fmovsvs	%icc,	%f12,	%f2
	nop
	set	0x34, %i7
	sth	%l0,	[%l7 + %i7]
	nop
	set	0x2E, %o2
	stb	%l1,	[%l7 + %o2]
	edge16	%o2,	%o5,	%g1
	movvs	%icc,	%o0,	%g2
	movleu	%xcc,	%i2,	%g7
	movleu	%xcc,	%i4,	%o1
	restore %i7, %g3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l2,	%i6
	sdivcc	%o6,	0x1150,	%i0
	sllx	%l6,	%l3,	%g4
	smul	%i5,	0x0F45,	%i1
	fsrc2s	%f25,	%f2
	ldsh	[%l7 + 0x56],	%l5
	movre	%l4,	0x1CC,	%o4
	xorcc	%g6,	%o7,	%g5
	mova	%xcc,	%o3,	%l1
	udivcc	%o2,	0x0DD6,	%o5
	array32	%l0,	%o0,	%g2
	sdiv	%g1,	0x1D7C,	%g7
	addc	%i4,	0x1F3F,	%i2
	popc	0x0008,	%o1
	srax	%g3,	0x19,	%i3
	mova	%xcc,	%i7,	%i6
	sdivcc	%l2,	0x0940,	%o6
	fmovs	%f0,	%f22
	mulscc	%l6,	0x03B6,	%i0
	fmovdl	%xcc,	%f11,	%f23
	fmul8ulx16	%f8,	%f12,	%f16
	srlx	%l3,	%i5,	%i1
	sethi	0x0214,	%g4
	fnot2s	%f3,	%f22
	ld	[%l7 + 0x50],	%f23
	lduh	[%l7 + 0x7E],	%l4
	fcmpes	%fcc0,	%f4,	%f6
	lduh	[%l7 + 0x54],	%l5
	edge8n	%g6,	%o7,	%o4
	alignaddr	%g5,	%o3,	%l1
	ld	[%l7 + 0x30],	%f30
	subccc	%o2,	0x1BBA,	%l0
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	movvs	%xcc,	%g2,	%i4
	popc	0x1EF2,	%i2
	movle	%xcc,	%g7,	%g3
	addc	%i3,	%o1,	%i6
	sllx	%i7,	%o6,	%l6
	fmovrsgz	%l2,	%f20,	%f3
	add	%l3,	%i5,	%i1
	umul	%i0,	%g4,	%l4
	fmovsgu	%xcc,	%f9,	%f3
	fmovsa	%icc,	%f16,	%f4
	edge32ln	%l5,	%o7,	%o4
	popc	%g6,	%o3
	addc	%l1,	%g5,	%o2
	fmovsle	%icc,	%f10,	%f16
	sdivcc	%o5,	0x15C0,	%o0
	movvs	%icc,	%g1,	%l0
	movrgez	%g2,	0x002,	%i2
	xorcc	%i4,	0x17D2,	%g7
	movrne	%g3,	0x178,	%o1
	edge8l	%i6,	%i7,	%o6
	addc	%l6,	0x0E3B,	%l2
	movcc	%icc,	%l3,	%i3
	movpos	%xcc,	%i1,	%i5
	ldd	[%l7 + 0x68],	%g4
	smul	%i0,	0x1501,	%l4
	fmovdne	%icc,	%f13,	%f4
	umulcc	%l5,	%o7,	%o4
	ldsh	[%l7 + 0x3C],	%g6
	popc	%l1,	%g5
	subcc	%o2,	0x0BD4,	%o3
	movpos	%xcc,	%o0,	%o5
	fmuld8ulx16	%f15,	%f27,	%f2
	movn	%icc,	%l0,	%g2
	fmovrdgz	%g1,	%f10,	%f24
	edge16	%i4,	%g7,	%i2
	xor	%g3,	%i6,	%i7
	subcc	%o6,	0x0432,	%l6
	fpack32	%f0,	%f10,	%f12
	fcmple32	%f2,	%f28,	%l2
	fsrc2	%f26,	%f4
	alignaddrl	%l3,	%o1,	%i3
	fcmpgt16	%f14,	%f28,	%i1
	movrlez	%i5,	0x246,	%i0
	fcmpgt32	%f22,	%f14,	%g4
	fmovdcc	%xcc,	%f13,	%f17
	array8	%l4,	%o7,	%l5
	sra	%g6,	0x1A,	%o4
	edge32n	%l1,	%g5,	%o2
	fcmpes	%fcc0,	%f31,	%f13
	xor	%o0,	%o5,	%l0
	fmovsl	%icc,	%f12,	%f8
	ldd	[%l7 + 0x18],	%o2
	fmul8x16al	%f7,	%f12,	%f2
	xorcc	%g1,	%g2,	%g7
	array16	%i2,	%i4,	%i6
	and	%i7,	%g3,	%l6
	fmovdleu	%icc,	%f25,	%f26
	ldd	[%l7 + 0x28],	%f18
	sub	%l2,	%l3,	%o1
	andcc	%o6,	%i1,	%i5
	ldub	[%l7 + 0x51],	%i3
	fone	%f6
	fmovsne	%icc,	%f7,	%f31
	edge32n	%g4,	%i0,	%o7
	movn	%icc,	%l5,	%l4
	fmovrdne	%o4,	%f22,	%f18
	sllx	%l1,	%g5,	%o2
	fmovrslez	%o0,	%f9,	%f13
	xor	%g6,	0x1779,	%l0
	sdivx	%o5,	0x091E,	%o3
	movg	%icc,	%g1,	%g2
	srlx	%g7,	0x04,	%i4
	edge32n	%i6,	%i2,	%i7
	and	%g3,	0x0F88,	%l2
	movne	%icc,	%l6,	%o1
	or	%o6,	0x0FF4,	%i1
	sir	0x1F22
	fmovsne	%xcc,	%f10,	%f26
	umul	%i5,	0x0A2B,	%i3
	array16	%g4,	%l3,	%o7
	sra	%i0,	0x1E,	%l4
	stw	%l5,	[%l7 + 0x08]
	edge32l	%l1,	%g5,	%o4
	stw	%o2,	[%l7 + 0x30]
	array8	%o0,	%l0,	%o5
	add	%g6,	0x1B3D,	%o3
	edge8ln	%g2,	%g7,	%i4
	andcc	%g1,	0x0B29,	%i2
	save %i7, %i6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x60],	%l6
	fmovrdlz	%o1,	%f16,	%f0
	ldd	[%l7 + 0x70],	%f2
	sdiv	%l2,	0x05FE,	%o6
	fnot1	%f6,	%f28
	movrlz	%i1,	%i5,	%i3
	sdivcc	%l3,	0x07FB,	%g4
	movl	%xcc,	%i0,	%l4
	fpsub32	%f8,	%f22,	%f18
	array16	%l5,	%o7,	%l1
	movrgez	%g5,	0x2B8,	%o2
	fcmps	%fcc2,	%f4,	%f22
	movneg	%icc,	%o4,	%l0
	movcc	%icc,	%o5,	%o0
	ldx	[%l7 + 0x60],	%g6
	array32	%g2,	%g7,	%i4
	movneg	%xcc,	%g1,	%o3
	fnot2	%f12,	%f26
	edge8ln	%i2,	%i7,	%g3
	sllx	%i6,	0x1C,	%o1
	xor	%l6,	0x1C9D,	%o6
	fmovrslez	%l2,	%f29,	%f3
	fmovd	%f20,	%f18
	sir	0x1B13
	fcmpne32	%f24,	%f12,	%i1
	and	%i5,	%i3,	%g4
	stw	%i0,	[%l7 + 0x0C]
	stb	%l3,	[%l7 + 0x57]
	fmovdle	%icc,	%f11,	%f13
	xor	%l5,	%l4,	%o7
	restore %l1, 0x1A23, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f12,	%f20,	%f18
	umulcc	%g5,	%o4,	%l0
	orn	%o5,	%o0,	%g6
	srl	%g7,	%i4,	%g1
	movg	%xcc,	%o3,	%g2
	fnot2	%f26,	%f8
	xorcc	%i7,	0x0EE9,	%i2
	save %g3, %i6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f20,	%f22
	fnors	%f31,	%f30,	%f18
	sdivcc	%l6,	0x035E,	%o6
	movgu	%xcc,	%l2,	%i1
	or	%i5,	%g4,	%i0
	ld	[%l7 + 0x7C],	%f31
	srax	%i3,	%l3,	%l4
	sir	0x1791
	fmovsvs	%xcc,	%f30,	%f20
	edge32l	%l5,	%o7,	%o2
	ldd	[%l7 + 0x28],	%l0
	subccc	%o4,	%g5,	%l0
	ldx	[%l7 + 0x50],	%o0
	smulcc	%o5,	0x1FAE,	%g7
	andn	%g6,	0x04ED,	%i4
	sub	%g1,	%o3,	%g2
	xor	%i2,	%i7,	%i6
	stx	%o1,	[%l7 + 0x68]
	subcc	%g3,	0x08EC,	%o6
	add	%l6,	0x13F7,	%l2
	alignaddrl	%i1,	%i5,	%g4
	andncc	%i0,	%i3,	%l4
	addc	%l3,	%o7,	%l5
	ldsb	[%l7 + 0x17],	%o2
	movcc	%xcc,	%l1,	%o4
	xnor	%l0,	%o0,	%g5
	fexpand	%f30,	%f14
	nop
	set	0x11, %g7
	ldub	[%l7 + %g7],	%g7
	fmovse	%icc,	%f15,	%f30
	edge16n	%o5,	%i4,	%g1
	fxor	%f18,	%f4,	%f16
	move	%xcc,	%g6,	%o3
	edge16	%g2,	%i2,	%i6
	movge	%xcc,	%i7,	%o1
	andncc	%o6,	%g3,	%l6
	umul	%i1,	0x009A,	%i5
	edge8ln	%g4,	%i0,	%i3
	fcmpeq32	%f22,	%f16,	%l2
	edge8l	%l4,	%o7,	%l5
	sra	%o2,	%l3,	%l1
	and	%l0,	0x0C9F,	%o4
	mova	%icc,	%g5,	%g7
	udiv	%o5,	0x06E4,	%i4
	lduw	[%l7 + 0x3C],	%g1
	xor	%g6,	%o3,	%g2
	addcc	%i2,	0x1262,	%o0
	movcc	%xcc,	%i6,	%i7
	movg	%icc,	%o1,	%o6
	stb	%g3,	[%l7 + 0x58]
	fmovsneg	%xcc,	%f21,	%f31
	fpsub32s	%f6,	%f3,	%f16
	ldub	[%l7 + 0x41],	%i1
	edge16l	%l6,	%g4,	%i0
	add	%i3,	%i5,	%l2
	edge32l	%o7,	%l5,	%o2
	fmovde	%xcc,	%f7,	%f23
	ld	[%l7 + 0x60],	%f21
	ldd	[%l7 + 0x70],	%l4
	st	%f8,	[%l7 + 0x0C]
	andncc	%l1,	%l0,	%o4
	sra	%l3,	%g7,	%g5
	orncc	%o5,	%g1,	%i4
	ldub	[%l7 + 0x61],	%g6
	smulcc	%o3,	0x0258,	%g2
	st	%f5,	[%l7 + 0x60]
	movrgz	%i2,	%o0,	%i6
	lduw	[%l7 + 0x18],	%i7
	alignaddr	%o6,	%g3,	%i1
	edge8n	%o1,	%g4,	%i0
	movrgz	%l6,	0x23D,	%i5
	fnot1s	%f26,	%f10
	fmovdn	%xcc,	%f26,	%f27
	sdivcc	%i3,	0x0104,	%o7
	array32	%l2,	%l5,	%l4
	fmovdl	%xcc,	%f26,	%f7
	movle	%xcc,	%l1,	%o2
	edge16l	%o4,	%l0,	%l3
	ldsb	[%l7 + 0x50],	%g7
	sdiv	%g5,	0x0343,	%g1
	edge32l	%o5,	%g6,	%i4
	sdivx	%g2,	0x1151,	%o3
	srl	%i2,	%o0,	%i7
	st	%f16,	[%l7 + 0x28]
	edge16ln	%o6,	%g3,	%i1
	sdivcc	%o1,	0x1E51,	%g4
	movg	%icc,	%i0,	%l6
	movn	%icc,	%i6,	%i5
	movl	%icc,	%i3,	%l2
	movne	%icc,	%o7,	%l5
	ldub	[%l7 + 0x7C],	%l4
	fmul8ulx16	%f8,	%f24,	%f18
	fpmerge	%f16,	%f27,	%f18
	udivcc	%o2,	0x03F5,	%l1
	fmovrse	%l0,	%f23,	%f25
	sdivx	%o4,	0x0F2B,	%g7
	fzeros	%f14
	addc	%l3,	0x0132,	%g5
	movgu	%xcc,	%g1,	%o5
	array8	%i4,	%g6,	%o3
	fmovdge	%xcc,	%f19,	%f22
	fmovdneg	%icc,	%f8,	%f15
	umulcc	%i2,	0x104B,	%g2
	add	%i7,	%o6,	%g3
	sdivcc	%i1,	0x0C3C,	%o0
	udivx	%g4,	0x1AC5,	%o1
	sdivcc	%i0,	0x1AF4,	%i6
	alignaddrl	%i5,	%i3,	%l6
	umul	%l2,	0x06DD,	%l5
	fpadd32s	%f29,	%f26,	%f29
	edge8l	%l4,	%o2,	%l1
	popc	0x0ACA,	%l0
	std	%f16,	[%l7 + 0x18]
	orncc	%o7,	%o4,	%g7
	fpack16	%f26,	%f19
	edge32n	%l3,	%g1,	%g5
	addccc	%i4,	%g6,	%o3
	srl	%i2,	%g2,	%i7
	xnorcc	%o6,	0x13F0,	%g3
	fcmped	%fcc1,	%f6,	%f30
	ldsw	[%l7 + 0x64],	%i1
	fpsub16	%f28,	%f8,	%f0
	movg	%icc,	%o0,	%o5
	andcc	%o1,	0x0AEC,	%g4
	bshuffle	%f12,	%f8,	%f2
	array32	%i6,	%i0,	%i3
	and	%i5,	0x04D5,	%l2
	sub	%l6,	0x018A,	%l4
	movn	%icc,	%o2,	%l1
	xnorcc	%l0,	%l5,	%o7
	fnegd	%f14,	%f2
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	mulx	%o4,	%g5,	%i4
	movrgez	%g6,	0x16D,	%i2
	alignaddr	%o3,	%g2,	%o6
	save %i7, 0x11BC, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i1,	%o0,	%o5
	alignaddrl	%g4,	%i6,	%i0
	edge32l	%o1,	%i5,	%i3
	ldsh	[%l7 + 0x12],	%l2
	movrne	%l4,	0x1C8,	%o2
	srax	%l6,	0x14,	%l1
	umulcc	%l0,	%o7,	%l5
	fmovdl	%xcc,	%f12,	%f29
	std	%f22,	[%l7 + 0x30]
	movrgez	%l3,	0x26E,	%g1
	array32	%o4,	%g5,	%i4
	fpsub32s	%f6,	%f25,	%f25
	movleu	%xcc,	%g6,	%i2
	fmovrdlez	%g7,	%f24,	%f20
	fzeros	%f15
	fmovsn	%icc,	%f0,	%f27
	fmovsvc	%icc,	%f25,	%f0
	movcs	%icc,	%g2,	%o3
	sub	%i7,	0x1941,	%o6
	edge8	%i1,	%g3,	%o0
	sdivx	%g4,	0x0763,	%i6
	fnands	%f22,	%f12,	%f7
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f26
	edge32l	%o5,	%i0,	%i5
	sethi	0x104E,	%o1
	movgu	%icc,	%l2,	%i3
	movl	%xcc,	%l4,	%o2
	save %l6, %l1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l5,	0x0762,	%o7
	andn	%l3,	0x06B5,	%g1
	mova	%icc,	%g5,	%i4
	movl	%icc,	%o4,	%g6
	fornot2s	%f17,	%f21,	%f24
	fmovdg	%icc,	%f0,	%f26
	stx	%i2,	[%l7 + 0x70]
	movneg	%icc,	%g2,	%g7
	sth	%o3,	[%l7 + 0x2A]
	movcc	%icc,	%o6,	%i1
	fones	%f28
	movrgez	%g3,	%i7,	%g4
	std	%f26,	[%l7 + 0x08]
	sethi	0x0AD3,	%i6
	edge8ln	%o5,	%o0,	%i5
	edge8ln	%o1,	%i0,	%l2
	ldd	[%l7 + 0x50],	%l4
	xnor	%i3,	0x195B,	%l6
	movcc	%icc,	%l1,	%l0
	udivcc	%o2,	0x0B4C,	%l5
	fmovsneg	%icc,	%f13,	%f18
	sll	%l3,	%g1,	%g5
	edge16	%o7,	%o4,	%i4
	mulscc	%g6,	0x0093,	%g2
	fcmple16	%f20,	%f8,	%i2
	fmovrde	%o3,	%f6,	%f24
	movge	%xcc,	%o6,	%i1
	mulx	%g3,	%g7,	%i7
	sethi	0x1036,	%i6
	fmovd	%f22,	%f22
	st	%f10,	[%l7 + 0x14]
	movrgz	%o5,	0x021,	%g4
	or	%i5,	0x1AE2,	%o0
	sdiv	%i0,	0x05E1,	%o1
	ld	[%l7 + 0x28],	%f21
	array8	%l2,	%l4,	%l6
	sethi	0x0FE7,	%i3
	sll	%l0,	0x04,	%o2
	fmovdleu	%xcc,	%f18,	%f16
	fornot2s	%f9,	%f30,	%f3
	xnor	%l1,	%l5,	%g1
	or	%l3,	0x036E,	%o7
	sdiv	%o4,	0x09FF,	%i4
	sll	%g5,	%g2,	%i2
	fmovsleu	%xcc,	%f0,	%f21
	movcc	%xcc,	%g6,	%o3
	orcc	%o6,	%i1,	%g3
	smulcc	%i7,	0x185C,	%i6
	lduw	[%l7 + 0x64],	%g7
	movne	%xcc,	%g4,	%o5
	fand	%f6,	%f28,	%f12
	orn	%i5,	0x01A9,	%i0
	orn	%o0,	%o1,	%l2
	addc	%l4,	%l6,	%i3
	fmovsgu	%icc,	%f6,	%f2
	fsrc2	%f6,	%f14
	andcc	%l0,	0x1390,	%o2
	sethi	0x0583,	%l1
	xnor	%g1,	0x1025,	%l5
	sub	%l3,	%o4,	%i4
	ldub	[%l7 + 0x49],	%o7
	array8	%g2,	%i2,	%g6
	std	%f12,	[%l7 + 0x40]
	fands	%f20,	%f20,	%f20
	andncc	%o3,	%g5,	%o6
	movgu	%xcc,	%i1,	%g3
	fmuld8ulx16	%f20,	%f1,	%f20
	movne	%icc,	%i6,	%i7
	edge8l	%g7,	%o5,	%g4
	movrlz	%i5,	%i0,	%o1
	orncc	%l2,	%o0,	%l6
	sethi	0x051C,	%l4
	andcc	%i3,	%l0,	%o2
	udivcc	%g1,	0x0E29,	%l1
	edge16	%l5,	%o4,	%i4
	nop
	set	0x2C, %i0
	lduh	[%l7 + %i0],	%o7
	sdivx	%g2,	0x0FF1,	%l3
	or	%g6,	0x1F03,	%i2
	ldub	[%l7 + 0x11],	%g5
	sir	0x1D69
	edge8l	%o6,	%o3,	%i1
	and	%g3,	%i7,	%i6
	edge16n	%g7,	%o5,	%g4
	fmovsne	%xcc,	%f26,	%f3
	fcmpes	%fcc2,	%f3,	%f22
	andncc	%i0,	%i5,	%l2
	subc	%o0,	%o1,	%l4
	fxor	%f2,	%f2,	%f24
	lduh	[%l7 + 0x6E],	%i3
	faligndata	%f24,	%f18,	%f6
	fmovsl	%xcc,	%f29,	%f6
	fmovdpos	%xcc,	%f10,	%f17
	umulcc	%l6,	0x0E8D,	%l0
	xnor	%o2,	%g1,	%l1
	restore %l5, 0x0533, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%xcc,	%f2,	%f19
	movne	%icc,	%o7,	%i4
	movvs	%icc,	%g2,	%g6
	ld	[%l7 + 0x74],	%f3
	edge8ln	%l3,	%i2,	%g5
	movle	%icc,	%o6,	%i1
	fpadd16	%f26,	%f16,	%f28
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%g3
	fmovsgu	%icc,	%f19,	%f9
	xorcc	%i7,	%i6,	%o3
	sethi	0x0A2B,	%o5
	movrgz	%g4,	0x2D1,	%i0
	srl	%i5,	0x0B,	%l2
	mulx	%g7,	0x1EE7,	%o0
	addccc	%o1,	%i3,	%l4
	umulcc	%l6,	%o2,	%g1
	fandnot1s	%f20,	%f13,	%f3
	faligndata	%f20,	%f8,	%f30
	nop
	set	0x20, %i5
	stx	%l0,	[%l7 + %i5]
	movl	%icc,	%l5,	%l1
	sdiv	%o7,	0x1C1F,	%i4
	movvs	%icc,	%g2,	%g6
	addccc	%o4,	0x1D32,	%l3
	fmul8x16al	%f6,	%f7,	%f2
	ldd	[%l7 + 0x08],	%f30
	umul	%i2,	%o6,	%g5
	andn	%i1,	%g3,	%i6
	movvs	%icc,	%o3,	%o5
	fmovrse	%i7,	%f22,	%f0
	sdivx	%g4,	0x09F3,	%i5
	siam	0x6
	sth	%l2,	[%l7 + 0x6E]
	array16	%i0,	%g7,	%o1
	movn	%icc,	%i3,	%l4
	ldsh	[%l7 + 0x3E],	%o0
	fmovsge	%xcc,	%f8,	%f23
	sir	0x0D12
	umulcc	%l6,	%g1,	%o2
	edge32l	%l5,	%l0,	%o7
	movvc	%xcc,	%i4,	%g2
	std	%f8,	[%l7 + 0x10]
	movrne	%g6,	%l1,	%l3
	edge16l	%o4,	%i2,	%o6
	andcc	%i1,	0x02C3,	%g5
	fzeros	%f9
	edge16n	%g3,	%o3,	%i6
	fcmpes	%fcc1,	%f25,	%f24
	array8	%o5,	%g4,	%i7
	save %i5, 0x12DA, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l2,	%o1,	%g7
	edge16	%i3,	%l4,	%l6
	mulscc	%o0,	0x0837,	%g1
	fxors	%f4,	%f2,	%f13
	fmovdge	%icc,	%f30,	%f15
	fmovd	%f22,	%f12
	ldsw	[%l7 + 0x60],	%l5
	fsrc1s	%f4,	%f29
	smulcc	%l0,	%o2,	%o7
	ldd	[%l7 + 0x10],	%g2
	pdist	%f20,	%f18,	%f4
	movvc	%xcc,	%i4,	%l1
	movl	%icc,	%l3,	%g6
	or	%o4,	%o6,	%i2
	mulscc	%g5,	0x1476,	%i1
	andncc	%o3,	%i6,	%g3
	fcmpne32	%f12,	%f0,	%g4
	subc	%o5,	0x148B,	%i5
	orcc	%i0,	%i7,	%l2
	fmovsne	%xcc,	%f5,	%f31
	ldsw	[%l7 + 0x60],	%o1
	edge16	%g7,	%l4,	%l6
	fzero	%f0
	movcs	%xcc,	%i3,	%g1
	smul	%l5,	0x05DF,	%l0
	stb	%o2,	[%l7 + 0x45]
	addccc	%o0,	0x096F,	%o7
	fmovdvc	%xcc,	%f25,	%f25
	movcs	%xcc,	%g2,	%l1
	edge8ln	%i4,	%l3,	%g6
	sll	%o6,	%i2,	%o4
	move	%icc,	%g5,	%o3
	array16	%i6,	%g3,	%i1
	ld	[%l7 + 0x78],	%f16
	movre	%g4,	%o5,	%i0
	fmovsvs	%icc,	%f24,	%f13
	sdivx	%i5,	0x00DB,	%i7
	fandnot2s	%f11,	%f30,	%f23
	movcc	%xcc,	%o1,	%l2
	ldx	[%l7 + 0x48],	%g7
	ldsb	[%l7 + 0x36],	%l4
	mulscc	%i3,	0x0C5E,	%l6
	movge	%xcc,	%g1,	%l5
	orcc	%o2,	0x0B6B,	%l0
	udivx	%o0,	0x1F2D,	%o7
	stb	%l1,	[%l7 + 0x39]
	fmovsneg	%xcc,	%f23,	%f14
	addc	%g2,	%l3,	%g6
	movpos	%xcc,	%o6,	%i2
	movvc	%xcc,	%i4,	%g5
	ld	[%l7 + 0x28],	%f12
	popc	0x12AA,	%o3
	edge16n	%o4,	%g3,	%i6
	array32	%i1,	%o5,	%i0
	movleu	%icc,	%i5,	%i7
	fpack16	%f20,	%f22
	udivx	%o1,	0x065E,	%l2
	edge32	%g4,	%g7,	%l4
	subcc	%l6,	0x0C35,	%g1
	edge32n	%i3,	%l5,	%o2
	edge8	%l0,	%o7,	%o0
	movcc	%icc,	%l1,	%g2
	fmovrslz	%l3,	%f25,	%f0
	fmovdle	%icc,	%f3,	%f9
	fmovsne	%icc,	%f20,	%f1
	fandnot1	%f6,	%f14,	%f30
	movvc	%xcc,	%g6,	%o6
	fnot1	%f24,	%f18
	ldd	[%l7 + 0x28],	%i2
	fsrc1	%f10,	%f8
	movrne	%g5,	0x3EA,	%o3
	fnot2	%f8,	%f8
	ldd	[%l7 + 0x58],	%i4
	sra	%g3,	0x0E,	%o4
	smulcc	%i6,	0x1684,	%o5
	std	%f8,	[%l7 + 0x68]
	fmovdpos	%icc,	%f12,	%f20
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	movleu	%xcc,	%i7,	%l2
	sdivx	%g4,	0x1C79,	%o1
	and	%g7,	0x134E,	%l6
	fnot2s	%f9,	%f7
	orncc	%l4,	%i3,	%g1
	faligndata	%f0,	%f16,	%f18
	edge16l	%o2,	%l5,	%l0
	fmul8x16	%f15,	%f18,	%f22
	fors	%f2,	%f18,	%f14
	restore %o0, %l1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l3,	%g2
	srl	%g6,	%i2,	%o6
	movgu	%icc,	%g5,	%i4
	ldd	[%l7 + 0x70],	%f6
	subc	%o3,	0x07F3,	%o4
	fxors	%f27,	%f0,	%f9
	sdivx	%g3,	0x0EB6,	%i6
	xnor	%i1,	%i5,	%o5
	sdivx	%i0,	0x120C,	%l2
	sdiv	%i7,	0x1549,	%o1
	fnot1s	%f24,	%f18
	edge16	%g4,	%l6,	%g7
	srax	%i3,	0x0A,	%g1
	st	%f20,	[%l7 + 0x0C]
	sdivcc	%o2,	0x1D1B,	%l5
	movcs	%icc,	%l0,	%l4
	mulscc	%o0,	0x0E78,	%l1
	udivcc	%o7,	0x1C29,	%g2
	movrgez	%l3,	0x214,	%g6
	andcc	%i2,	0x076F,	%o6
	xorcc	%i4,	0x035A,	%o3
	fmovrde	%g5,	%f0,	%f2
	ldsw	[%l7 + 0x1C],	%o4
	smul	%g3,	%i1,	%i5
	fandnot1	%f0,	%f10,	%f24
	sdivx	%i6,	0x1E9D,	%i0
	st	%f2,	[%l7 + 0x14]
	udiv	%l2,	0x13E2,	%i7
	edge32n	%o5,	%g4,	%o1
	fsrc1s	%f14,	%f14
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%g7
	fsrc2	%f18,	%f24
	movre	%i3,	0x3CD,	%l6
	fmovde	%xcc,	%f19,	%f14
	subc	%g1,	%o2,	%l5
	movcs	%xcc,	%l0,	%o0
	mova	%icc,	%l1,	%l4
	ldsb	[%l7 + 0x40],	%o7
	mulscc	%l3,	%g6,	%g2
	mulx	%i2,	%i4,	%o3
	fnands	%f18,	%f0,	%f4
	fcmpgt16	%f10,	%f22,	%o6
	nop
	set	0x2D, %g6
	ldub	[%l7 + %g6],	%g5
	fmovdge	%xcc,	%f8,	%f9
	fmovscc	%xcc,	%f2,	%f2
	movrgz	%o4,	%i1,	%i5
	subccc	%g3,	%i6,	%i0
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	andn	%o1,	%g4,	%g7
	fnor	%f26,	%f28,	%f20
	andn	%l6,	0x0B4D,	%i3
	and	%o2,	0x0251,	%g1
	ldd	[%l7 + 0x18],	%l4
	sra	%o0,	%l1,	%l0
	fmovdl	%icc,	%f22,	%f15
	edge16n	%l4,	%o7,	%g6
	lduh	[%l7 + 0x60],	%g2
	array8	%l3,	%i2,	%i4
	smulcc	%o3,	0x1ABF,	%g5
	sll	%o6,	0x08,	%i1
	fone	%f0
	subcc	%o4,	%g3,	%i6
	fmovdcc	%xcc,	%f12,	%f3
	fones	%f22
	edge16	%i5,	%l2,	%i0
	udiv	%i7,	0x1B43,	%o5
	movg	%xcc,	%o1,	%g7
	fnot2	%f20,	%f12
	fnand	%f24,	%f12,	%f2
	mova	%xcc,	%g4,	%i3
	fmul8x16	%f19,	%f18,	%f16
	sdiv	%o2,	0x1AEE,	%g1
	sir	0x1669
	edge8	%l6,	%o0,	%l5
	orncc	%l1,	0x09E8,	%l0
	and	%l4,	%g6,	%o7
	srlx	%g2,	%l3,	%i2
	addc	%i4,	0x080C,	%g5
	fmovrsgz	%o3,	%f4,	%f8
	fmovsvs	%icc,	%f4,	%f23
	edge8l	%o6,	%i1,	%g3
	srax	%o4,	0x00,	%i6
	srlx	%i5,	0x04,	%i0
	ld	[%l7 + 0x2C],	%f25
	fmovrse	%i7,	%f9,	%f1
	edge8	%l2,	%o1,	%o5
	fmovsa	%icc,	%f16,	%f24
	edge16ln	%g4,	%i3,	%g7
	ldsb	[%l7 + 0x16],	%g1
	move	%xcc,	%l6,	%o2
	sethi	0x10DF,	%o0
	movge	%xcc,	%l5,	%l0
	fmovsle	%xcc,	%f7,	%f10
	edge16l	%l4,	%l1,	%g6
	stw	%o7,	[%l7 + 0x40]
	smulcc	%l3,	%i2,	%g2
	sub	%g5,	%o3,	%i4
	movre	%o6,	0x293,	%g3
	umulcc	%i1,	0x0B6C,	%o4
	fmovrsgz	%i6,	%f22,	%f24
	andcc	%i0,	0x1F05,	%i5
	fxors	%f7,	%f17,	%f15
	popc	%l2,	%i7
	movge	%xcc,	%o1,	%o5
	fpsub32s	%f27,	%f20,	%f29
	nop
	set	0x50, %i2
	lduh	[%l7 + %i2],	%g4
	fmovsge	%xcc,	%f5,	%f31
	fmovsvc	%xcc,	%f23,	%f27
	movneg	%icc,	%i3,	%g1
	fpack32	%f16,	%f24,	%f26
	edge32ln	%l6,	%o2,	%g7
	edge8n	%o0,	%l5,	%l4
	xnorcc	%l1,	%l0,	%g6
	popc	0x0B7F,	%l3
	edge16n	%i2,	%g2,	%g5
	for	%f6,	%f22,	%f18
	fmul8sux16	%f10,	%f2,	%f4
	andn	%o7,	0x0541,	%o3
	fcmpgt32	%f14,	%f12,	%o6
	srlx	%g3,	0x19,	%i1
	subccc	%i4,	0x179A,	%i6
	fnors	%f1,	%f29,	%f22
	orcc	%i0,	0x1770,	%i5
	umulcc	%l2,	0x14F6,	%i7
	xor	%o4,	0x05B6,	%o5
	lduh	[%l7 + 0x5C],	%g4
	addc	%o1,	0x0388,	%g1
	fmovsgu	%xcc,	%f19,	%f28
	movpos	%icc,	%i3,	%l6
	edge32n	%g7,	%o2,	%o0
	sdivcc	%l5,	0x1EEB,	%l4
	edge32ln	%l0,	%l1,	%l3
	edge32ln	%g6,	%g2,	%g5
	ldd	[%l7 + 0x68],	%f4
	xor	%o7,	0x1D64,	%i2
	ldd	[%l7 + 0x58],	%o2
	edge8	%g3,	%o6,	%i1
	movrne	%i4,	0x2D5,	%i0
	popc	0x1B59,	%i6
	movle	%icc,	%l2,	%i7
	movleu	%icc,	%o4,	%i5
	ldd	[%l7 + 0x48],	%f18
	edge8n	%g4,	%o5,	%g1
	mulscc	%o1,	0x06B4,	%i3
	fpsub16s	%f6,	%f14,	%f3
	edge8	%g7,	%l6,	%o0
	srax	%l5,	%o2,	%l4
	edge8l	%l0,	%l3,	%l1
	edge8l	%g6,	%g5,	%o7
	movn	%icc,	%g2,	%o3
	save %i2, 0x13D7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x58],	%f20
	movcc	%icc,	%g3,	%i1
	fxnors	%f28,	%f22,	%f14
	sra	%i0,	%i4,	%l2
	alignaddrl	%i6,	%i7,	%o4
	xnor	%g4,	0x12FD,	%o5
	nop
	set	0x54, %i3
	ldsh	[%l7 + %i3],	%g1
	nop
	set	0x48, %g3
	std	%f0,	[%l7 + %g3]
	edge32	%i5,	%i3,	%o1
	array32	%g7,	%l6,	%o0
	movl	%xcc,	%o2,	%l5
	fcmped	%fcc3,	%f20,	%f6
	movge	%xcc,	%l4,	%l0
	movvs	%xcc,	%l3,	%g6
	orncc	%l1,	%g5,	%o7
	fmuld8ulx16	%f3,	%f21,	%f28
	movvc	%xcc,	%g2,	%i2
	andncc	%o6,	%o3,	%g3
	fmovdle	%icc,	%f17,	%f16
	orncc	%i1,	%i0,	%i4
	srax	%i6,	%l2,	%i7
	stw	%g4,	[%l7 + 0x30]
	fpadd16s	%f4,	%f19,	%f27
	orncc	%o4,	%g1,	%o5
	movrne	%i5,	%o1,	%i3
	movne	%xcc,	%l6,	%g7
	sll	%o2,	0x1A,	%o0
	fpsub32	%f0,	%f0,	%f24
	addcc	%l5,	0x0693,	%l4
	fzeros	%f26
	sdivcc	%l3,	0x1172,	%l0
	movpos	%xcc,	%l1,	%g6
	xnor	%g5,	%o7,	%g2
	fones	%f2
	popc	0x15BB,	%i2
	sdivx	%o6,	0x073F,	%o3
	fmovrsgez	%g3,	%f10,	%f30
	faligndata	%f28,	%f16,	%f28
	fmovdn	%xcc,	%f21,	%f22
	edge16ln	%i0,	%i4,	%i1
	orn	%l2,	0x1E37,	%i6
	fpadd32s	%f11,	%f31,	%f10
	sub	%i7,	%o4,	%g4
	faligndata	%f24,	%f2,	%f14
	movl	%xcc,	%g1,	%i5
	fmovsge	%icc,	%f3,	%f31
	fone	%f10
	ldub	[%l7 + 0x4D],	%o5
	edge8l	%i3,	%o1,	%l6
	movg	%xcc,	%g7,	%o2
	movn	%xcc,	%l5,	%o0
	xnorcc	%l3,	%l0,	%l4
	orncc	%g6,	%l1,	%o7
	ldd	[%l7 + 0x08],	%f12
	movle	%icc,	%g5,	%g2
	movge	%icc,	%o6,	%i2
	fandnot2	%f20,	%f0,	%f22
	ldx	[%l7 + 0x70],	%g3
	nop
	set	0x32, %l4
	lduh	[%l7 + %l4],	%o3
	fmovrde	%i0,	%f26,	%f18
	sub	%i4,	%l2,	%i6
	stb	%i1,	[%l7 + 0x32]
	mulx	%o4,	%i7,	%g4
	fmovsne	%xcc,	%f15,	%f10
	fnot2s	%f9,	%f12
	edge16ln	%i5,	%g1,	%o5
	movvc	%xcc,	%i3,	%o1
	fsrc2s	%f5,	%f31
	sdiv	%g7,	0x1B56,	%o2
	sir	0x1928
	fmovrsgz	%l6,	%f27,	%f29
	movre	%l5,	0x183,	%l3
	movneg	%xcc,	%o0,	%l0
	stb	%g6,	[%l7 + 0x32]
	ldsw	[%l7 + 0x58],	%l4
	popc	%o7,	%g5
	xnorcc	%l1,	%g2,	%o6
	alignaddr	%g3,	%o3,	%i2
	array16	%i4,	%l2,	%i6
	sdivx	%i0,	0x007D,	%i1
	add	%i7,	%g4,	%i5
	movvc	%icc,	%o4,	%g1
	srax	%o5,	%i3,	%g7
	move	%icc,	%o1,	%o2
	edge8l	%l6,	%l3,	%o0
	movle	%xcc,	%l0,	%l5
	movg	%xcc,	%l4,	%o7
	fcmpd	%fcc3,	%f4,	%f14
	ldx	[%l7 + 0x28],	%g5
	fnands	%f10,	%f22,	%f3
	edge32	%g6,	%g2,	%l1
	movn	%icc,	%o6,	%g3
	movcc	%icc,	%i2,	%i4
	fnegs	%f13,	%f22
	fmovrsgz	%l2,	%f25,	%f10
	edge32n	%i6,	%o3,	%i1
	edge32	%i0,	%g4,	%i7
	movge	%icc,	%i5,	%o4
	edge16	%g1,	%i3,	%o5
	fmovs	%f3,	%f0
	fmovsg	%xcc,	%f19,	%f21
	andn	%g7,	%o2,	%o1
	fzeros	%f29
	lduw	[%l7 + 0x18],	%l3
	srax	%l6,	0x03,	%o0
	mulscc	%l0,	0x0DBF,	%l5
	movpos	%xcc,	%o7,	%g5
	fmovrslz	%l4,	%f29,	%f2
	orncc	%g2,	%l1,	%o6
	sra	%g6,	0x1E,	%i2
	addccc	%g3,	%i4,	%l2
	edge8	%i6,	%o3,	%i1
	stw	%g4,	[%l7 + 0x78]
	fexpand	%f0,	%f26
	srl	%i0,	%i7,	%i5
	ld	[%l7 + 0x38],	%f8
	ldub	[%l7 + 0x4D],	%o4
	movl	%xcc,	%g1,	%i3
	fpadd32	%f2,	%f22,	%f22
	edge8l	%o5,	%g7,	%o2
	sth	%o1,	[%l7 + 0x40]
	umul	%l6,	0x126F,	%o0
	orncc	%l0,	%l5,	%l3
	fnot2s	%f2,	%f10
	restore %g5, %o7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l4,	%o6,	%g6
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	ldsw	[%l7 + 0x24],	%i4
	lduh	[%l7 + 0x1C],	%l2
	movn	%icc,	%o3,	%i1
	fmovse	%xcc,	%f17,	%f13
	fpsub32s	%f4,	%f9,	%f14
	smul	%i6,	0x1CF2,	%i0
	movl	%xcc,	%g4,	%i5
	srax	%i7,	0x15,	%o4
	edge16	%g1,	%o5,	%i3
	move	%xcc,	%o2,	%g7
	lduw	[%l7 + 0x24],	%o1
	fcmped	%fcc3,	%f18,	%f10
	and	%l6,	%l0,	%o0
	restore %l5, %l3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o7,	0x0E09,	%l4
	array8	%o6,	%g2,	%l1
	alignaddrl	%g6,	%i2,	%g3
	umulcc	%l2,	0x19A9,	%o3
	xnorcc	%i4,	0x06C3,	%i1
	movvs	%icc,	%i0,	%i6
	fandnot2s	%f18,	%f25,	%f21
	array16	%g4,	%i5,	%o4
	edge8	%g1,	%i7,	%o5
	andn	%o2,	%g7,	%i3
	umulcc	%l6,	%o1,	%l0
	fmovsa	%icc,	%f31,	%f16
	movrgez	%l5,	%o0,	%g5
	movrne	%o7,	0x1DC,	%l4
	edge16l	%o6,	%g2,	%l3
	array32	%g6,	%i2,	%g3
	smulcc	%l2,	0x1236,	%l1
	bshuffle	%f28,	%f6,	%f16
	umulcc	%o3,	%i1,	%i4
	fmovdg	%icc,	%f4,	%f7
	sdivx	%i6,	0x0D6F,	%i0
	fmovdpos	%icc,	%f25,	%f23
	movl	%icc,	%i5,	%o4
	fnor	%f0,	%f28,	%f16
	ld	[%l7 + 0x70],	%f24
	sll	%g1,	%i7,	%o5
	fmovrsne	%o2,	%f16,	%f26
	movrgz	%g4,	%g7,	%i3
	addccc	%l6,	%l0,	%o1
	edge32ln	%o0,	%l5,	%g5
	mulscc	%o7,	0x164B,	%l4
	fpadd32s	%f5,	%f23,	%f2
	edge16l	%o6,	%g2,	%l3
	or	%g6,	%i2,	%g3
	sdiv	%l2,	0x0B31,	%l1
	ldsb	[%l7 + 0x29],	%i1
	fmovdvc	%xcc,	%f1,	%f21
	orn	%i4,	0x1AAD,	%i6
	movpos	%icc,	%o3,	%i5
	xor	%i0,	0x13D3,	%g1
	edge32	%i7,	%o5,	%o4
	sub	%g4,	0x1AE4,	%o2
	edge32n	%g7,	%l6,	%i3
	umul	%l0,	0x1985,	%o1
	fcmpes	%fcc0,	%f5,	%f23
	edge8l	%o0,	%g5,	%l5
	udiv	%l4,	0x0B9B,	%o6
	fmovsge	%icc,	%f22,	%f5
	movvc	%xcc,	%g2,	%o7
	movneg	%icc,	%g6,	%i2
	movre	%g3,	%l2,	%l3
	sub	%i1,	0x1A35,	%i4
	stb	%l1,	[%l7 + 0x33]
	fsrc2s	%f12,	%f29
	move	%icc,	%o3,	%i6
	pdist	%f12,	%f8,	%f24
	edge32n	%i5,	%i0,	%g1
	movvs	%icc,	%i7,	%o5
	fmul8x16	%f19,	%f10,	%f20
	sllx	%o4,	%o2,	%g7
	andcc	%g4,	%i3,	%l6
	move	%xcc,	%o1,	%l0
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%o0
	edge8	%g5,	%l5,	%o6
	sth	%g2,	[%l7 + 0x56]
	sethi	0x198D,	%o7
	sir	0x19E7
	save %g6, %i2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%g2
	udiv	%l3,	0x1674,	%l2
	fnot2	%f18,	%f4
	alignaddr	%i1,	%i4,	%o3
	movle	%xcc,	%i6,	%i5
	movvc	%xcc,	%i0,	%g1
	fpack32	%f28,	%f28,	%f10
	ldd	[%l7 + 0x28],	%i6
	movleu	%xcc,	%l1,	%o4
	srax	%o2,	0x1E,	%o5
	movgu	%xcc,	%g4,	%i3
	movcs	%icc,	%g7,	%o1
	movl	%icc,	%l0,	%l6
	edge32ln	%g5,	%l5,	%o0
	srl	%o6,	0x19,	%o7
	xorcc	%g6,	0x126D,	%i2
	umul	%l4,	%g3,	%g2
	andn	%l2,	%i1,	%l3
	edge32	%i4,	%i6,	%o3
	ldsw	[%l7 + 0x5C],	%i5
	or	%g1,	%i7,	%l1
	movgu	%icc,	%o4,	%i0
	xor	%o2,	0x0C52,	%o5
	movleu	%icc,	%i3,	%g7
	orn	%o1,	0x0839,	%l0
	andn	%l6,	%g5,	%l5
	ldub	[%l7 + 0x19],	%o0
	sub	%g4,	0x063E,	%o6
	udiv	%g6,	0x17DF,	%o7
	smul	%i2,	%l4,	%g2
	stx	%g3,	[%l7 + 0x48]
	add	%l2,	%l3,	%i1
	ldx	[%l7 + 0x40],	%i6
	std	%f6,	[%l7 + 0x58]
	ldsw	[%l7 + 0x1C],	%i4
	edge8n	%o3,	%g1,	%i7
	sth	%l1,	[%l7 + 0x62]
	orn	%i5,	0x1597,	%i0
	andncc	%o4,	%o5,	%i3
	umul	%g7,	0x1616,	%o1
	edge8	%o2,	%l6,	%g5
	orncc	%l5,	0x1C79,	%l0
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	addcc	%o7,	0x1542,	%o0
	smulcc	%l4,	%i2,	%g3
	orn	%l2,	0x0081,	%g2
	lduw	[%l7 + 0x7C],	%l3
	fcmpne16	%f6,	%f20,	%i1
	sub	%i6,	%o3,	%g1
	stb	%i4,	[%l7 + 0x30]
	sra	%l1,	%i7,	%i5
	movcc	%icc,	%i0,	%o5
	fornot1s	%f10,	%f30,	%f1
	siam	0x2
	movgu	%xcc,	%i3,	%g7
	movneg	%icc,	%o4,	%o2
	fmuld8sux16	%f11,	%f21,	%f30
	fsrc2s	%f31,	%f17
	fpsub32	%f2,	%f8,	%f10
	fone	%f30
	ldsb	[%l7 + 0x6F],	%o1
	save %l6, %l5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g4, %g5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	0x1037,	%o6
	ldx	[%l7 + 0x20],	%o0
	movvc	%icc,	%i2,	%g3
	edge16l	%l2,	%g2,	%l3
	movre	%l4,	%i1,	%o3
	fmovrdlez	%i6,	%f26,	%f14
	movl	%icc,	%i4,	%l1
	fpsub32	%f30,	%f10,	%f28
	fand	%f12,	%f0,	%f18
	movrgez	%i7,	0x323,	%i5
	fpadd32	%f24,	%f8,	%f12
	fzero	%f2
	movvc	%xcc,	%i0,	%o5
	sth	%g1,	[%l7 + 0x14]
	andn	%i3,	0x0377,	%o4
	fmovsl	%icc,	%f27,	%f31
	fmovse	%icc,	%f25,	%f9
	fexpand	%f8,	%f30
	fmovdpos	%xcc,	%f1,	%f31
	movge	%icc,	%o2,	%o1
	fnegd	%f0,	%f20
	addccc	%g7,	%l6,	%l5
	lduw	[%l7 + 0x24],	%g4
	udivcc	%l0,	0x0F65,	%g6
	fpsub16	%f10,	%f10,	%f6
	fmovse	%xcc,	%f13,	%f5
	srl	%g5,	%o6,	%o7
	sethi	0x064F,	%o0
	nop
	set	0x32, %o0
	lduh	[%l7 + %o0],	%i2
	orcc	%l2,	0x11D2,	%g3
	fmovsleu	%xcc,	%f12,	%f22
	movrne	%g2,	0x1F6,	%l3
	std	%f28,	[%l7 + 0x70]
	ldsb	[%l7 + 0x6D],	%i1
	edge32n	%o3,	%i6,	%i4
	lduh	[%l7 + 0x4A],	%l1
	st	%f11,	[%l7 + 0x20]
	subccc	%i7,	%i5,	%l4
	fxnors	%f28,	%f24,	%f8
	edge16n	%i0,	%g1,	%o5
	sdivx	%i3,	0x070C,	%o4
	fnot1s	%f14,	%f5
	move	%xcc,	%o1,	%g7
	subcc	%l6,	0x0882,	%l5
	movne	%xcc,	%o2,	%g4
	ldub	[%l7 + 0x47],	%l0
	udiv	%g5,	0x0976,	%g6
	std	%f8,	[%l7 + 0x58]
	fmovsg	%xcc,	%f31,	%f2
	stb	%o7,	[%l7 + 0x49]
	lduw	[%l7 + 0x24],	%o6
	fandnot1	%f14,	%f26,	%f8
	xnorcc	%o0,	0x0741,	%i2
	addccc	%l2,	%g3,	%g2
	edge16l	%i1,	%o3,	%i6
	sdivcc	%i4,	0x1189,	%l3
	array32	%i7,	%i5,	%l1
	subcc	%i0,	%g1,	%o5
	sra	%l4,	0x14,	%i3
	udiv	%o4,	0x154C,	%o1
	sdivx	%l6,	0x0401,	%g7
	movrne	%l5,	%g4,	%o2
	movrlez	%l0,	0x3F3,	%g5
	nop
	set	0x54, %l3
	lduw	[%l7 + %l3],	%o7
	srax	%g6,	%o0,	%o6
	fsrc1	%f16,	%f28
	stx	%i2,	[%l7 + 0x48]
	addcc	%l2,	%g3,	%g2
	ldsw	[%l7 + 0x1C],	%i1
	sth	%o3,	[%l7 + 0x20]
	udiv	%i4,	0x0809,	%l3
	movn	%icc,	%i7,	%i6
	fcmpne32	%f28,	%f30,	%l1
	movcs	%icc,	%i5,	%i0
	stb	%g1,	[%l7 + 0x45]
	mulscc	%l4,	0x11E1,	%i3
	fmovda	%xcc,	%f26,	%f11
	addccc	%o5,	0x1922,	%o1
	fabsd	%f18,	%f26
	mulscc	%l6,	%o4,	%l5
	movg	%icc,	%g7,	%g4
	movpos	%icc,	%l0,	%o2
	orncc	%o7,	%g6,	%o0
	sdiv	%g5,	0x0341,	%i2
	addcc	%o6,	%g3,	%g2
	save %i1, 0x1BDC, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l2,	%l3
	srl	%i4,	0x1B,	%i7
	array16	%l1,	%i6,	%i5
	movre	%g1,	%i0,	%i3
	srlx	%l4,	0x11,	%o1
	fcmpeq16	%f16,	%f12,	%l6
	udivcc	%o5,	0x1142,	%o4
	udiv	%g7,	0x03B2,	%g4
	array16	%l0,	%l5,	%o7
	movcs	%icc,	%o2,	%o0
	addc	%g5,	0x1FE1,	%i2
	sdiv	%g6,	0x01CC,	%o6
	sllx	%g3,	%g2,	%o3
	movrlz	%l2,	%l3,	%i1
	movcs	%xcc,	%i7,	%i4
	edge8	%i6,	%i5,	%l1
	movvs	%xcc,	%g1,	%i3
	lduh	[%l7 + 0x30],	%i0
	subccc	%l4,	%l6,	%o1
	ldx	[%l7 + 0x48],	%o4
	fmovda	%xcc,	%f7,	%f26
	array16	%g7,	%g4,	%l0
	alignaddr	%l5,	%o5,	%o2
	xnorcc	%o7,	%o0,	%g5
	movcs	%icc,	%i2,	%g6
	movle	%icc,	%o6,	%g2
	stw	%g3,	[%l7 + 0x6C]
	edge8n	%l2,	%l3,	%o3
	movrne	%i1,	%i4,	%i7
	orncc	%i6,	%l1,	%i5
	edge32n	%i3,	%i0,	%g1
	srlx	%l4,	0x04,	%o1
	lduw	[%l7 + 0x7C],	%o4
	array8	%l6,	%g4,	%l0
	sir	0x1A9F
	movgu	%xcc,	%g7,	%l5
	fnands	%f13,	%f16,	%f13
	subccc	%o5,	%o7,	%o2
	movrgez	%o0,	0x216,	%i2
	edge8	%g5,	%o6,	%g6
	movleu	%xcc,	%g2,	%g3
	mova	%icc,	%l3,	%l2
	xnor	%i1,	0x19C9,	%i4
	edge8	%o3,	%i6,	%l1
	movge	%xcc,	%i7,	%i3
	xor	%i0,	%i5,	%l4
	movleu	%icc,	%o1,	%o4
	umulcc	%l6,	0x1205,	%g1
	fsrc1	%f20,	%f0
	edge16l	%g4,	%g7,	%l0
	movg	%xcc,	%l5,	%o7
	addc	%o5,	0x05D1,	%o0
	fmovsn	%xcc,	%f25,	%f30
	fornot1	%f12,	%f2,	%f26
	movrne	%i2,	%o2,	%g5
	add	%o6,	%g2,	%g3
	movvs	%xcc,	%l3,	%l2
	movl	%xcc,	%g6,	%i1
	orcc	%i4,	0x0A2B,	%i6
	movge	%xcc,	%o3,	%l1
	fsrc2	%f8,	%f2
	fcmpeq16	%f28,	%f18,	%i3
	alignaddrl	%i0,	%i5,	%i7
	movcs	%icc,	%o1,	%o4
	fpack16	%f26,	%f11
	movrlz	%l4,	%l6,	%g4
	movrne	%g7,	0x099,	%g1
	ldd	[%l7 + 0x58],	%l0
	movgu	%icc,	%l5,	%o5
	udivx	%o7,	0x1E76,	%i2
	alignaddrl	%o0,	%g5,	%o6
	fmul8x16au	%f31,	%f9,	%f18
	fmul8x16	%f3,	%f2,	%f16
	edge32l	%o2,	%g3,	%g2
	movrlez	%l2,	%g6,	%l3
	sir	0x14D4
	fxors	%f6,	%f15,	%f3
	ldd	[%l7 + 0x50],	%f30
	movre	%i1,	0x033,	%i4
	addcc	%o3,	%i6,	%l1
	fmovdn	%xcc,	%f2,	%f30
	edge8n	%i3,	%i5,	%i7
	fcmpne16	%f20,	%f26,	%i0
	srlx	%o1,	0x16,	%o4
	std	%f24,	[%l7 + 0x40]
	edge8	%l4,	%g4,	%l6
	srlx	%g1,	0x1D,	%l0
	st	%f29,	[%l7 + 0x18]
	std	%f22,	[%l7 + 0x68]
	udiv	%l5,	0x021F,	%g7
	fors	%f8,	%f19,	%f2
	edge8l	%o5,	%i2,	%o7
	addc	%o0,	%g5,	%o2
	fmovsgu	%icc,	%f27,	%f7
	fmul8x16al	%f1,	%f20,	%f10
	xnor	%g3,	%g2,	%l2
	movleu	%icc,	%g6,	%l3
	mulx	%i1,	%i4,	%o6
	popc	%o3,	%i6
	edge8ln	%l1,	%i5,	%i7
	nop
	set	0x1A, %i4
	ldsb	[%l7 + %i4],	%i0
	fandnot1s	%f28,	%f17,	%f13
	orn	%i3,	%o4,	%o1
	nop
	set	0x52, %o5
	ldsb	[%l7 + %o5],	%g4
	srl	%l4,	%l6,	%g1
	movrgz	%l5,	0x3F6,	%l0
	edge32l	%o5,	%i2,	%o7
	edge16l	%o0,	%g7,	%o2
	bshuffle	%f10,	%f22,	%f10
	move	%icc,	%g5,	%g2
	fand	%f30,	%f2,	%f14
	add	%g3,	0x1124,	%g6
	move	%icc,	%l3,	%l2
	movle	%icc,	%i4,	%o6
	movcc	%icc,	%o3,	%i1
	sdivcc	%i6,	0x0D20,	%l1
	movrne	%i7,	0x200,	%i0
	movneg	%xcc,	%i3,	%i5
	fzeros	%f22
	sdiv	%o1,	0x17D6,	%g4
	fmovdg	%icc,	%f22,	%f21
	fmovsne	%xcc,	%f11,	%f5
	stw	%l4,	[%l7 + 0x0C]
	addc	%l6,	0x17C5,	%g1
	fpadd32s	%f0,	%f28,	%f4
	orn	%l5,	%l0,	%o4
	add	%o5,	0x1B91,	%o7
	edge8ln	%i2,	%o0,	%o2
	movleu	%xcc,	%g5,	%g2
	sllx	%g7,	%g6,	%g3
	xor	%l2,	0x087B,	%i4
	fmuld8ulx16	%f4,	%f9,	%f14
	array32	%l3,	%o3,	%o6
	fxnor	%f2,	%f16,	%f30
	movgu	%xcc,	%i1,	%i6
	fmovspos	%xcc,	%f19,	%f25
	fmovdne	%icc,	%f27,	%f0
	ld	[%l7 + 0x48],	%f22
	movneg	%icc,	%i7,	%l1
	fmovdne	%xcc,	%f0,	%f14
	movre	%i0,	%i5,	%o1
	mova	%icc,	%g4,	%i3
	sra	%l6,	%g1,	%l4
	andncc	%l5,	%l0,	%o5
	addcc	%o4,	0x1033,	%i2
	fabss	%f10,	%f18
	ldx	[%l7 + 0x70],	%o7
	fmovrslez	%o0,	%f17,	%f14
	lduw	[%l7 + 0x28],	%o2
	or	%g5,	0x13CD,	%g2
	mulx	%g7,	%g6,	%l2
	sllx	%i4,	%g3,	%o3
	movcs	%icc,	%l3,	%i1
	ld	[%l7 + 0x44],	%f30
	fnand	%f4,	%f12,	%f30
	movcc	%xcc,	%i6,	%o6
	srl	%i7,	0x09,	%i0
	xnor	%i5,	%l1,	%g4
	stx	%i3,	[%l7 + 0x78]
	movvc	%icc,	%l6,	%o1
	mova	%xcc,	%l4,	%l5
	sethi	0x04B3,	%g1
	edge8	%l0,	%o4,	%i2
	fabss	%f24,	%f14
	udivx	%o5,	0x16B9,	%o7
	std	%f2,	[%l7 + 0x40]
	xnor	%o2,	%g5,	%g2
	xorcc	%g7,	%o0,	%l2
	andn	%i4,	%g6,	%o3
	fmovdgu	%xcc,	%f0,	%f24
	movleu	%xcc,	%l3,	%g3
	edge16ln	%i6,	%i1,	%i7
	movvc	%icc,	%i0,	%i5
	sdiv	%l1,	0x1549,	%o6
	edge8n	%i3,	%g4,	%l6
	fzero	%f26
	fmul8x16al	%f26,	%f6,	%f6
	movgu	%xcc,	%o1,	%l5
	edge32l	%g1,	%l0,	%o4
	fmovrsgez	%l4,	%f21,	%f26
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	fnand	%f14,	%f18,	%f30
	srlx	%o2,	0x16,	%g5
	fmovse	%xcc,	%f4,	%f22
	std	%f22,	[%l7 + 0x58]
	movneg	%xcc,	%g2,	%o5
	orn	%g7,	0x1B0D,	%o0
	umulcc	%l2,	0x0476,	%i4
	edge32l	%o3,	%l3,	%g3
	save %i6, 0x166D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f31,	%f5
	movrgz	%i7,	%i0,	%i5
	and	%i1,	%l1,	%i3
	fxnors	%f14,	%f16,	%f8
	array32	%g4,	%l6,	%o1
	movneg	%icc,	%l5,	%o6
	alignaddrl	%g1,	%o4,	%l0
	and	%i2,	%l4,	%o2
	edge8	%g5,	%g2,	%o7
	movg	%xcc,	%g7,	%o5
	sra	%o0,	0x16,	%i4
	array16	%o3,	%l3,	%l2
	std	%f6,	[%l7 + 0x18]
	ld	[%l7 + 0x38],	%f1
	move	%icc,	%i6,	%g6
	andcc	%i7,	0x0BCF,	%i0
	fcmpne32	%f2,	%f12,	%i5
	stb	%g3,	[%l7 + 0x5E]
	lduw	[%l7 + 0x24],	%i1
	stw	%l1,	[%l7 + 0x58]
	and	%g4,	0x08CE,	%i3
	fmuld8ulx16	%f16,	%f18,	%f22
	xnor	%o1,	0x0383,	%l5
	edge32n	%o6,	%g1,	%o4
	fones	%f28
	sra	%l0,	%i2,	%l6
	movrne	%l4,	%g5,	%g2
	ldx	[%l7 + 0x78],	%o7
	edge32ln	%g7,	%o2,	%o5
	andcc	%o0,	%o3,	%i4
	movre	%l2,	%l3,	%i6
	movrne	%g6,	0x202,	%i0
	movl	%xcc,	%i7,	%g3
	movl	%icc,	%i5,	%l1
	edge32	%g4,	%i3,	%i1
	movcc	%icc,	%o1,	%o6
	umul	%g1,	0x13BE,	%o4
	srax	%l5,	%l0,	%l6
	orn	%l4,	0x1FEC,	%g5
	st	%f27,	[%l7 + 0x60]
	sdiv	%i2,	0x0013,	%g2
	fmovrslez	%g7,	%f3,	%f6
	sir	0x09D4
	udiv	%o2,	0x07C7,	%o7
	movgu	%icc,	%o0,	%o3
	movvs	%xcc,	%o5,	%l2
	movrgz	%i4,	%i6,	%g6
	edge32l	%l3,	%i0,	%g3
	movcc	%xcc,	%i5,	%l1
	ldd	[%l7 + 0x28],	%f6
	subcc	%i7,	%g4,	%i3
	fmovrdgz	%i1,	%f22,	%f0
	sir	0x1A74
	mova	%icc,	%o1,	%o6
	array16	%g1,	%l5,	%l0
	pdist	%f0,	%f30,	%f12
	sllx	%o4,	0x1A,	%l6
	alignaddr	%g5,	%i2,	%g2
	fmovdpos	%xcc,	%f16,	%f17
	umul	%l4,	%g7,	%o7
	mulscc	%o0,	%o2,	%o3
	movgu	%icc,	%l2,	%i4
	movg	%icc,	%o5,	%g6
	movvc	%icc,	%l3,	%i0
	ldd	[%l7 + 0x38],	%f30
	fmovdvc	%icc,	%f31,	%f31
	subc	%i6,	0x0AE7,	%i5
	fpsub32s	%f4,	%f1,	%f17
	movrgz	%l1,	0x340,	%i7
	fandnot1	%f22,	%f4,	%f0
	ldd	[%l7 + 0x68],	%g4
	addccc	%i3,	%i1,	%g3
	umul	%o6,	%o1,	%g1
	orncc	%l5,	%l0,	%l6
	move	%xcc,	%o4,	%g5
	fcmped	%fcc1,	%f20,	%f10
	movneg	%icc,	%i2,	%l4
	stx	%g7,	[%l7 + 0x28]
	edge8	%o7,	%g2,	%o2
	edge16n	%o3,	%o0,	%i4
	ldsh	[%l7 + 0x70],	%l2
	subcc	%o5,	0x1AEB,	%g6
	fmovsle	%xcc,	%f19,	%f20
	ldsh	[%l7 + 0x60],	%l3
	stx	%i6,	[%l7 + 0x40]
	srax	%i5,	0x0E,	%i0
	sdivcc	%i7,	0x1BE5,	%l1
	fsrc2	%f22,	%f18
	fornot1	%f8,	%f18,	%f4
	edge16	%g4,	%i1,	%i3
	udivx	%g3,	0x00AE,	%o1
	nop
	set	0x12, %i1
	ldsh	[%l7 + %i1],	%g1
	sir	0x1EA9
	xnorcc	%l5,	%o6,	%l6
	mulx	%l0,	0x19F0,	%g5
	lduh	[%l7 + 0x76],	%o4
	pdist	%f30,	%f12,	%f2
	edge32	%l4,	%g7,	%o7
	fcmpne16	%f26,	%f28,	%i2
	fnot1	%f16,	%f12
	addcc	%o2,	%g2,	%o3
	st	%f19,	[%l7 + 0x74]
	edge8n	%o0,	%i4,	%o5
	umulcc	%g6,	%l2,	%i6
	udiv	%l3,	0x0DCA,	%i0
	xnorcc	%i5,	%l1,	%g4
	ldd	[%l7 + 0x70],	%f4
	sra	%i7,	0x0A,	%i3
	stw	%g3,	[%l7 + 0x6C]
	umulcc	%o1,	0x13F0,	%g1
	srl	%l5,	%o6,	%l6
	move	%xcc,	%l0,	%g5
	fzero	%f26
	udivx	%o4,	0x180D,	%i1
	move	%xcc,	%g7,	%l4
	fpsub32	%f8,	%f6,	%f26
	move	%icc,	%i2,	%o7
	mulscc	%g2,	%o3,	%o0
	movrgez	%i4,	0x21F,	%o5
	subcc	%o2,	%g6,	%i6
	fcmple32	%f4,	%f28,	%l3
	fmovrslz	%i0,	%f23,	%f9
	and	%i5,	%l1,	%l2
	fcmpeq16	%f8,	%f28,	%i7
	stx	%i3,	[%l7 + 0x18]
	movle	%xcc,	%g4,	%o1
	nop
	set	0x51, %o3
	ldsb	[%l7 + %o3],	%g1
	fcmped	%fcc0,	%f18,	%f10
	stb	%g3,	[%l7 + 0x5C]
	move	%icc,	%l5,	%o6
	addcc	%l6,	%l0,	%g5
	nop
	set	0x40, %l0
	stw	%o4,	[%l7 + %l0]
	fmovde	%xcc,	%f26,	%f23
	stb	%g7,	[%l7 + 0x37]
	andn	%l4,	%i2,	%i1
	fmovs	%f24,	%f19
	fsrc2	%f26,	%f10
	sethi	0x19EC,	%o7
	smul	%g2,	%o3,	%i4
	xor	%o5,	0x0462,	%o2
	orcc	%o0,	%i6,	%g6
	fandnot1s	%f27,	%f3,	%f3
	addc	%l3,	0x1475,	%i0
	addc	%l1,	0x056B,	%i5
	orncc	%i7,	0x1A7C,	%l2
	mova	%icc,	%i3,	%o1
	fcmps	%fcc2,	%f30,	%f13
	orcc	%g1,	%g3,	%l5
	movrne	%o6,	0x179,	%l6
	sethi	0x0D1F,	%g4
	array16	%l0,	%o4,	%g5
	udivx	%l4,	0x0A71,	%i2
	movrlz	%i1,	0x31D,	%g7
	andncc	%g2,	%o3,	%i4
	nop
	set	0x1C, %l2
	lduw	[%l7 + %l2],	%o5
	fmovse	%icc,	%f13,	%f8
	udiv	%o2,	0x0A74,	%o7
	fmovsg	%xcc,	%f31,	%f22
	sir	0x189C
	movg	%icc,	%o0,	%i6
	edge8	%l3,	%i0,	%l1
	or	%g6,	0x17C3,	%i7
	movrne	%l2,	%i3,	%i5
	sllx	%o1,	%g1,	%g3
	array16	%o6,	%l5,	%l6
	edge16l	%l0,	%o4,	%g4
	restore %l4, %g5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f7,	%f19
	or	%g7,	0x11EB,	%g2
	sra	%o3,	0x0D,	%i2
	srax	%o5,	0x1F,	%o2
	movl	%xcc,	%i4,	%o0
	add	%i6,	0x0DB9,	%l3
	nop
	set	0x6C, %l6
	ldsw	[%l7 + %l6],	%i0
	xorcc	%l1,	0x15BD,	%g6
	movrlez	%i7,	0x1DA,	%o7
	st	%f6,	[%l7 + 0x14]
	umul	%l2,	0x072D,	%i5
	xor	%o1,	0x0977,	%i3
	sdivcc	%g3,	0x16E2,	%g1
	subccc	%l5,	%o6,	%l0
	and	%o4,	0x037F,	%g4
	movvc	%xcc,	%l6,	%g5
	sdiv	%i1,	0x0AB0,	%g7
	andn	%g2,	%o3,	%i2
	std	%f24,	[%l7 + 0x68]
	mulscc	%l4,	%o2,	%o5
	ldsh	[%l7 + 0x2E],	%o0
	ldsw	[%l7 + 0x0C],	%i4
	xorcc	%l3,	0x09E2,	%i6
	fandnot1	%f28,	%f26,	%f8
	pdist	%f6,	%f30,	%f16
	orn	%i0,	%l1,	%i7
	movgu	%xcc,	%g6,	%l2
	fmul8x16au	%f5,	%f14,	%f8
	andcc	%i5,	%o7,	%i3
	stx	%g3,	[%l7 + 0x58]
	xnorcc	%g1,	0x1184,	%o1
	fmovrde	%o6,	%f2,	%f20
	movrlz	%l0,	%l5,	%g4
	xnor	%l6,	0x1758,	%g5
	addc	%i1,	0x1FCC,	%g7
	fmovsleu	%icc,	%f8,	%f20
	ldd	[%l7 + 0x28],	%f10
	ldd	[%l7 + 0x68],	%g2
	movcc	%xcc,	%o3,	%i2
	xor	%l4,	0x158A,	%o2
	fmovdge	%xcc,	%f16,	%f7
	fzero	%f28
	movrlz	%o5,	0x3FD,	%o0
	movpos	%xcc,	%o4,	%l3
	fmovrde	%i4,	%f16,	%f14
	movge	%xcc,	%i6,	%i0
	or	%i7,	%g6,	%l1
	edge32	%l2,	%o7,	%i5
	ldsh	[%l7 + 0x10],	%g3
	orn	%g1,	0x1C91,	%i3
	sir	0x1250
	fnand	%f22,	%f0,	%f26
	movne	%icc,	%o6,	%l0
	fmovsvc	%xcc,	%f21,	%f27
	sdiv	%l5,	0x0784,	%o1
	edge16l	%l6,	%g4,	%i1
	edge16l	%g5,	%g7,	%o3
	addcc	%i2,	0x1882,	%l4
	xnorcc	%o2,	0x0A6A,	%g2
	movrne	%o0,	0x0D5,	%o5
	fmuld8ulx16	%f27,	%f8,	%f10
	alignaddr	%o4,	%i4,	%i6
	xnor	%i0,	%i7,	%l3
	or	%l1,	%l2,	%g6
	mova	%icc,	%i5,	%g3
	ldx	[%l7 + 0x08],	%g1
	movg	%xcc,	%o7,	%i3
	movrgz	%l0,	0x173,	%l5
	fnand	%f6,	%f4,	%f4
	smul	%o6,	0x156D,	%l6
	xorcc	%g4,	0x15EE,	%o1
	edge32n	%g5,	%g7,	%i1
	sra	%o3,	%i2,	%o2
	sub	%l4,	0x1C86,	%g2
	edge16	%o0,	%o4,	%i4
	movrne	%o5,	0x3C6,	%i6
	movleu	%icc,	%i0,	%i7
	movleu	%xcc,	%l1,	%l2
	save %g6, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x6C],	%l3
	addcc	%g1,	0x1AEB,	%i3
	ldd	[%l7 + 0x58],	%l0
	movleu	%icc,	%l5,	%o6
	udivx	%o7,	0x0BEC,	%g4
	fmovrdlez	%o1,	%f18,	%f10
	fmovsneg	%xcc,	%f8,	%f6
	srl	%g5,	0x12,	%l6
	subcc	%g7,	%o3,	%i2
	andcc	%i1,	%l4,	%o2
	subcc	%o0,	%g2,	%o4
	movleu	%icc,	%i4,	%o5
	movvc	%xcc,	%i6,	%i7
	subcc	%i0,	0x1A4A,	%l1
	sir	0x18D8
	fmovsl	%xcc,	%f26,	%f18
	fors	%f24,	%f29,	%f29
	movneg	%xcc,	%l2,	%g6
	move	%xcc,	%i5,	%g3
	or	%g1,	%l3,	%i3
	movrne	%l5,	%o6,	%l0
	alignaddr	%o7,	%g4,	%g5
	fcmple32	%f18,	%f10,	%o1
	fands	%f17,	%f24,	%f19
	movcc	%xcc,	%l6,	%o3
	fornot2	%f22,	%f2,	%f8
	movrlz	%i2,	0x3B7,	%i1
	addc	%g7,	0x17E2,	%l4
	st	%f0,	[%l7 + 0x78]
	subc	%o0,	0x14C4,	%o2
	fmovsne	%icc,	%f18,	%f13
	movvc	%icc,	%o4,	%g2
	movre	%o5,	0x243,	%i6
	movneg	%icc,	%i7,	%i0
	lduw	[%l7 + 0x6C],	%i4
	fxnor	%f8,	%f22,	%f8
	lduh	[%l7 + 0x28],	%l1
	fnot2s	%f20,	%f10
	fmul8ulx16	%f0,	%f16,	%f0
	movgu	%xcc,	%l2,	%i5
	fandnot1s	%f18,	%f9,	%f21
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%g6
	fmovsa	%xcc,	%f6,	%f8
	movpos	%xcc,	%g3,	%l3
	movvc	%icc,	%g1,	%i3
	fmovrdlez	%o6,	%f10,	%f18
	sth	%l5,	[%l7 + 0x6A]
	orcc	%o7,	%l0,	%g5
	st	%f9,	[%l7 + 0x40]
	movrne	%o1,	0x034,	%l6
	fnot2	%f24,	%f8
	mulscc	%o3,	%g4,	%i2
	andncc	%g7,	%l4,	%o0
	fpadd16	%f0,	%f0,	%f10
	mulx	%i1,	%o2,	%o4
	orncc	%g2,	0x0CC1,	%i6
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	stx	%o5,	[%l7 + 0x50]
	lduh	[%l7 + 0x0C],	%l2
	ldx	[%l7 + 0x38],	%l1
	lduh	[%l7 + 0x40],	%i5
	movcc	%xcc,	%g3,	%g6
	andcc	%g1,	%l3,	%i3
	movrgez	%o6,	0x1E8,	%l5
	movre	%l0,	%o7,	%o1
	addccc	%l6,	%o3,	%g5
	sdivx	%g4,	0x17E8,	%g7
	movvs	%icc,	%l4,	%i2
	addc	%o0,	0x0AAA,	%i1
	udiv	%o4,	0x0B1E,	%o2
	xor	%i6,	0x15E0,	%i7
	fmul8x16	%f11,	%f24,	%f16
	save %g2, %i4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%l2,	%f0,	%f27
	udivx	%l1,	0x1387,	%i5
	mulx	%g3,	0x1D87,	%g6
	or	%i0,	%l3,	%g1
	fcmple32	%f10,	%f22,	%o6
	or	%l5,	0x0B87,	%l0
	sethi	0x0EC5,	%i3
	fnor	%f26,	%f12,	%f26
	movg	%xcc,	%o1,	%o7
	sth	%l6,	[%l7 + 0x6A]
	fmuld8sux16	%f0,	%f0,	%f2
	movrgz	%o3,	0x07E,	%g4
	srl	%g5,	%g7,	%l4
	movg	%xcc,	%i2,	%i1
	nop
	set	0x58, %g2
	std	%f8,	[%l7 + %g2]
	movvs	%xcc,	%o0,	%o2
	fmovdgu	%xcc,	%f3,	%f31
	andn	%o4,	0x1C58,	%i6
	movrne	%i7,	0x000,	%g2
	lduw	[%l7 + 0x38],	%i4
	fcmpgt16	%f20,	%f20,	%l2
	edge16ln	%l1,	%i5,	%o5
	edge16l	%g3,	%g6,	%l3
	fones	%f14
	sth	%i0,	[%l7 + 0x5C]
	or	%o6,	0x1EBB,	%l5
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%f6
	movneg	%icc,	%g1,	%l0
	movgu	%xcc,	%i3,	%o7
	array32	%l6,	%o3,	%o1
	fands	%f23,	%f23,	%f16
	fmovsg	%xcc,	%f7,	%f8
	addc	%g5,	%g4,	%g7
	edge8ln	%i2,	%l4,	%o0
	array16	%o2,	%i1,	%i6
	edge8n	%o4,	%i7,	%i4
	fmovrsgz	%l2,	%f13,	%f6
	stb	%l1,	[%l7 + 0x16]
	movpos	%xcc,	%g2,	%i5
	bshuffle	%f18,	%f26,	%f4
	fmovscc	%xcc,	%f29,	%f7
	fmovdge	%icc,	%f30,	%f22
	sra	%g3,	%g6,	%l3
	edge32	%o5,	%o6,	%l5
	add	%g1,	%i0,	%l0
	edge32ln	%o7,	%i3,	%o3
	save %o1, 0x0FE8, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g5,	%g4
	fmovrslez	%g7,	%f20,	%f18
	srax	%i2,	0x02,	%o0
	nop
	set	0x2A, %g5
	ldub	[%l7 + %g5],	%l4
	edge8ln	%o2,	%i6,	%i1
	fandnot1s	%f18,	%f4,	%f15
	movvs	%xcc,	%i7,	%o4
	fxors	%f13,	%f15,	%f13
	fands	%f9,	%f9,	%f26
	fmul8x16al	%f26,	%f25,	%f16
	udiv	%l2,	0x1EA1,	%l1
	fones	%f29
	fmovda	%xcc,	%f19,	%f29
	fpadd16s	%f25,	%f12,	%f24
	andn	%i4,	%i5,	%g3
	umulcc	%g2,	0x1EBC,	%g6
	movneg	%icc,	%o5,	%l3
	fmovdne	%xcc,	%f0,	%f0
	edge16ln	%o6,	%l5,	%i0
	umulcc	%l0,	%g1,	%o7
	ldsb	[%l7 + 0x59],	%i3
	sdiv	%o1,	0x131D,	%o3
	andncc	%l6,	%g4,	%g7
	fmovdvc	%icc,	%f20,	%f13
	fmovsa	%icc,	%f29,	%f7
	and	%i2,	%g5,	%o0
	lduw	[%l7 + 0x78],	%l4
	fmovrdlz	%i6,	%f8,	%f6
	movl	%xcc,	%i1,	%i7
	fmovd	%f10,	%f28
	fcmpeq32	%f12,	%f22,	%o4
	movgu	%icc,	%l2,	%l1
	movre	%o2,	0x08D,	%i5
	xnorcc	%i4,	%g3,	%g2
	st	%f13,	[%l7 + 0x38]
	fmovdle	%icc,	%f11,	%f29
	addc	%g6,	0x0E0A,	%o5
	fpadd32	%f14,	%f30,	%f2
	ldsh	[%l7 + 0x26],	%o6
	movrgz	%l3,	0x078,	%l5
	fnegs	%f21,	%f7
	ldsh	[%l7 + 0x16],	%l0
	stx	%i0,	[%l7 + 0x28]
	sdiv	%o7,	0x07DC,	%i3
	addcc	%o1,	%g1,	%l6
	sra	%o3,	%g7,	%i2
	xorcc	%g5,	0x0D58,	%g4
	fpsub16	%f20,	%f10,	%f16
	movre	%o0,	%l4,	%i1
	fpadd32s	%f18,	%f31,	%f19
	movge	%icc,	%i6,	%o4
	fxor	%f8,	%f22,	%f18
	addc	%l2,	%i7,	%o2
	movre	%l1,	0x106,	%i5
	fpackfix	%f20,	%f23
	fandnot2s	%f27,	%f14,	%f16
	movrlz	%i4,	%g3,	%g6
	ldub	[%l7 + 0x32],	%g2
	movn	%xcc,	%o6,	%o5
	move	%xcc,	%l3,	%l5
	alignaddr	%i0,	%l0,	%i3
	stx	%o1,	[%l7 + 0x10]
	fmovrdlz	%g1,	%f30,	%f24
	st	%f15,	[%l7 + 0x78]
	andcc	%o7,	0x0246,	%l6
	lduh	[%l7 + 0x78],	%g7
	edge8n	%i2,	%g5,	%o3
	fxnors	%f5,	%f17,	%f28
	subccc	%g4,	0x1F0D,	%o0
	srl	%i1,	0x13,	%i6
	udivx	%o4,	0x16BF,	%l2
	fmovsg	%xcc,	%f10,	%f1
	movre	%l4,	%i7,	%o2
	ldsb	[%l7 + 0x68],	%l1
	ldx	[%l7 + 0x60],	%i4
	andcc	%g3,	0x09A2,	%g6
	sllx	%i5,	0x17,	%g2
	ldd	[%l7 + 0x48],	%f22
	movgu	%xcc,	%o6,	%l3
	sth	%l5,	[%l7 + 0x24]
	movneg	%icc,	%i0,	%o5
	fmovscs	%xcc,	%f31,	%f26
	movl	%icc,	%l0,	%i3
	array8	%g1,	%o7,	%l6
	fpsub16	%f14,	%f24,	%f2
	orncc	%g7,	%i2,	%g5
	sir	0x143C
	restore %o1, %o3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o0,	%i1,	%o4
	lduh	[%l7 + 0x42],	%i6
	umulcc	%l4,	%l2,	%o2
	ldsh	[%l7 + 0x58],	%l1
	edge16ln	%i7,	%g3,	%i4
	addc	%g6,	0x0AE0,	%g2
	srl	%o6,	%l3,	%l5
	sth	%i5,	[%l7 + 0x18]
	fpmerge	%f31,	%f18,	%f2
	fzero	%f12
	movge	%xcc,	%o5,	%i0
	subccc	%l0,	0x129B,	%g1
	addcc	%o7,	0x01F2,	%l6
	and	%g7,	%i3,	%i2
	edge8l	%o1,	%o3,	%g4
	ldsw	[%l7 + 0x48],	%g5
	sll	%i1,	0x17,	%o4
	subc	%o0,	0x17FD,	%i6
	ldsh	[%l7 + 0x1E],	%l2
	movre	%o2,	%l4,	%i7
	movcc	%icc,	%l1,	%i4
	fmovrsgz	%g6,	%f14,	%f23
	edge16l	%g3,	%o6,	%g2
	fsrc2s	%f19,	%f23
	fnors	%f31,	%f28,	%f1
	fxnors	%f13,	%f18,	%f5
	array16	%l3,	%i5,	%l5
	fcmpd	%fcc0,	%f10,	%f12
	ldsb	[%l7 + 0x41],	%i0
	fmul8ulx16	%f26,	%f6,	%f14
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%o5
	st	%f22,	[%l7 + 0x48]
	sub	%g1,	%l0,	%l6
	movrne	%o7,	%g7,	%i3
	sdiv	%o1,	0x09B5,	%i2
	movgu	%xcc,	%o3,	%g4
	edge16l	%i1,	%g5,	%o0
	fmovrdlez	%o4,	%f30,	%f18
	andncc	%i6,	%l2,	%l4
	udivcc	%o2,	0x1322,	%i7
	srlx	%i4,	0x17,	%g6
	fcmpd	%fcc2,	%f12,	%f14
	movl	%xcc,	%l1,	%g3
	xorcc	%o6,	%g2,	%l3
	fmovrdgz	%l5,	%f30,	%f26
	xnor	%i0,	%o5,	%g1
	alignaddr	%i5,	%l6,	%o7
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	edge16ln	%o1,	%i2,	%l0
	movvs	%xcc,	%o3,	%i1
	lduw	[%l7 + 0x68],	%g4
	movvs	%xcc,	%g5,	%o0
	sethi	0x05E9,	%i6
	umul	%l2,	%o4,	%o2
	edge16	%l4,	%i4,	%g6
	fmovdne	%xcc,	%f11,	%f26
	andncc	%i7,	%l1,	%o6
	orncc	%g3,	0x1A3B,	%g2
	movrgez	%l3,	0x08B,	%l5
	umulcc	%i0,	0x10C1,	%g1
	ldsb	[%l7 + 0x59],	%o5
	mulx	%l6,	%o7,	%g7
	sdivcc	%i5,	0x00B0,	%i3
	orncc	%i2,	%o1,	%l0
	fcmpgt32	%f4,	%f0,	%o3
	xnorcc	%i1,	%g5,	%o0
	sll	%i6,	%l2,	%o4
	nop
	set	0x20, %o6
	stx	%o2,	[%l7 + %o6]
	fnegd	%f16,	%f22
	fnegd	%f12,	%f4
	array8	%g4,	%i4,	%g6
	array32	%i7,	%l1,	%l4
	ldd	[%l7 + 0x18],	%f20
	xor	%g3,	%o6,	%l3
	edge16ln	%g2,	%i0,	%l5
	xorcc	%o5,	0x0610,	%l6
	edge8l	%o7,	%g1,	%g7
	alignaddr	%i3,	%i2,	%i5
	fnors	%f31,	%f30,	%f24
	edge16l	%o1,	%o3,	%i1
	alignaddr	%l0,	%o0,	%i6
	alignaddrl	%g5,	%o4,	%o2
	lduh	[%l7 + 0x22],	%l2
	edge8l	%i4,	%g6,	%i7
	array8	%g4,	%l1,	%l4
	fzeros	%f26
	add	%g3,	%o6,	%l3
	save %i0, 0x0DCB, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f23,	%f15
	movn	%icc,	%l5,	%l6
	sdiv	%o5,	0x124D,	%g1
	restore %o7, %i3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i5,	%g7
	stb	%o3,	[%l7 + 0x5E]
	ldx	[%l7 + 0x58],	%o1
	ldd	[%l7 + 0x20],	%i0
	orncc	%l0,	%i6,	%g5
	addc	%o0,	%o2,	%l2
	std	%f30,	[%l7 + 0x38]
	subccc	%i4,	%g6,	%i7
	andncc	%g4,	%o4,	%l4
	stx	%g3,	[%l7 + 0x18]
	srax	%l1,	%o6,	%l3
	andn	%g2,	%l5,	%l6
	fmul8sux16	%f18,	%f26,	%f30
	movpos	%icc,	%o5,	%i0
	movre	%o7,	0x1FB,	%i3
	movcc	%xcc,	%g1,	%i5
	fmovsg	%xcc,	%f8,	%f13
	ldd	[%l7 + 0x40],	%i2
	udivx	%g7,	0x176A,	%o3
	subc	%o1,	0x1FBE,	%l0
	movgu	%xcc,	%i6,	%g5
	save %o0, %o2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f8,	%f24,	%f20
	andncc	%i1,	%g6,	%i7
	movne	%icc,	%i4,	%g4
	subcc	%o4,	0x1C6B,	%g3
	ldsw	[%l7 + 0x1C],	%l1
	movrlez	%o6,	0x14A,	%l3
	sllx	%g2,	%l5,	%l4
	umul	%l6,	%i0,	%o5
	nop
	set	0x3A, %g1
	lduh	[%l7 + %g1],	%i3
	xnor	%g1,	0x0F80,	%i5
	mulx	%o7,	0x04CB,	%g7
	ldub	[%l7 + 0x62],	%o3
	andncc	%o1,	%i2,	%l0
	edge16n	%i6,	%g5,	%o0
	sdiv	%l2,	0x1569,	%i1
	movrgez	%g6,	%i7,	%i4
	array8	%o2,	%g4,	%g3
	array16	%l1,	%o4,	%l3
	subcc	%o6,	%g2,	%l5
	movvs	%xcc,	%l4,	%i0
	mulscc	%o5,	%i3,	%l6
	andncc	%i5,	%o7,	%g7
	orncc	%o3,	0x0928,	%o1
	fmovdvc	%icc,	%f5,	%f15
	srax	%g1,	%l0,	%i6
	fmovdge	%xcc,	%f11,	%f7
	stx	%i2,	[%l7 + 0x08]
	movpos	%xcc,	%o0,	%g5
	save %l2, 0x0CDD, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g6,	%i7,	%o2
	st	%f9,	[%l7 + 0x54]
	fexpand	%f30,	%f2
	save %g4, 0x1EA1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i4,	%l1,	%l3
	alignaddr	%o6,	%o4,	%l5
	fmovs	%f19,	%f15
	fmovrdgz	%l4,	%f12,	%f0
	array16	%i0,	%g2,	%i3
	movpos	%xcc,	%l6,	%o5
	udivx	%o7,	0x1581,	%i5
	subc	%g7,	0x0360,	%o3
	ldsb	[%l7 + 0x69],	%o1
	fmovsvs	%xcc,	%f24,	%f3
	subcc	%g1,	%l0,	%i2
	movvs	%xcc,	%o0,	%i6
	nop
	set	0x38, %i7
	stx	%l2,	[%l7 + %i7]
	save %g5, %g6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i1,	%g4
	udivx	%g3,	0x0678,	%o2
	fxnors	%f13,	%f30,	%f31
	movvs	%icc,	%l1,	%i4
	save %o6, %l3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l4,	%o4
	umul	%i0,	0x1A37,	%g2
	sra	%l6,	0x0F,	%i3
	movg	%xcc,	%o5,	%o7
	fmovrde	%i5,	%f28,	%f4
	fexpand	%f11,	%f12
	ldd	[%l7 + 0x20],	%f14
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	ldub	[%l7 + 0x5C],	%l0
	and	%g1,	%o0,	%i2
	sdiv	%l2,	0x15E9,	%i6
	movl	%icc,	%g5,	%i7
	xnor	%i1,	0x11F0,	%g4
	movleu	%xcc,	%g3,	%g6
	mova	%xcc,	%o2,	%i4
	nop
	set	0x7E, %o2
	lduh	[%l7 + %o2],	%o6
	fmovsvs	%xcc,	%f0,	%f12
	xorcc	%l3,	0x0FFB,	%l5
	fmovrde	%l4,	%f8,	%f26
	fmovdleu	%icc,	%f24,	%f16
	ld	[%l7 + 0x60],	%f31
	alignaddr	%l1,	%i0,	%o4
	orn	%g2,	0x12B0,	%i3
	sdiv	%o5,	0x1ACF,	%o7
	movrlez	%l6,	0x28E,	%i5
	save %g7, %o3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l0,	0x1ABA,	%g1
	edge16l	%o0,	%i2,	%l2
	movrgez	%i6,	0x154,	%i7
	edge32	%g5,	%g4,	%i1
	fmovrdlez	%g3,	%f16,	%f18
	andcc	%g6,	%o2,	%i4
	and	%o6,	0x1BE6,	%l3
	add	%l4,	0x18DA,	%l1
	smul	%l5,	%o4,	%g2
	or	%i0,	0x08B4,	%i3
	mulx	%o7,	%o5,	%l6
	sdivx	%g7,	0x1C15,	%i5
	sdivx	%o1,	0x0A0E,	%o3
	subccc	%g1,	%l0,	%o0
	fmovdgu	%icc,	%f31,	%f21
	mova	%xcc,	%i2,	%l2
	fmovscc	%xcc,	%f23,	%f26
	umulcc	%i7,	0x193F,	%g5
	orncc	%i6,	%i1,	%g4
	movleu	%icc,	%g3,	%g6
	edge32ln	%o2,	%o6,	%l3
	movpos	%icc,	%l4,	%i4
	fmul8x16au	%f30,	%f7,	%f22
	fnegs	%f8,	%f18
	edge16l	%l5,	%o4,	%l1
	fmul8x16al	%f26,	%f22,	%f20
	xorcc	%i0,	%g2,	%o7
	edge8ln	%o5,	%l6,	%g7
	edge32l	%i5,	%i3,	%o1
	edge8n	%g1,	%o3,	%l0
	and	%i2,	%l2,	%i7
	addccc	%g5,	0x0A41,	%i6
	edge8l	%o0,	%i1,	%g4
	sdivx	%g3,	0x139B,	%g6
	fmovrslz	%o6,	%f13,	%f19
	fors	%f19,	%f9,	%f27
	edge32	%o2,	%l3,	%i4
	subc	%l4,	0x19B9,	%o4
	addc	%l1,	0x035E,	%l5
	mova	%xcc,	%g2,	%i0
	movre	%o7,	%l6,	%g7
	orn	%i5,	0x0E31,	%i3
	fnot1	%f0,	%f26
	fmovda	%icc,	%f21,	%f26
	and	%o5,	%o1,	%o3
	sub	%g1,	0x183B,	%l0
	move	%icc,	%l2,	%i7
	mulscc	%i2,	%i6,	%o0
	srax	%i1,	0x00,	%g4
	st	%f22,	[%l7 + 0x38]
	fmuld8sux16	%f23,	%f22,	%f20
	mulx	%g5,	%g6,	%g3
	umul	%o6,	%o2,	%l3
	edge16ln	%l4,	%i4,	%o4
	stb	%l1,	[%l7 + 0x55]
	edge32ln	%l5,	%i0,	%o7
	edge16n	%g2,	%g7,	%l6
	lduw	[%l7 + 0x5C],	%i5
	sll	%i3,	0x1E,	%o1
	movrlz	%o3,	%g1,	%o5
	stw	%l2,	[%l7 + 0x6C]
	alignaddrl	%l0,	%i2,	%i6
	fpsub32s	%f20,	%f1,	%f26
	stx	%i7,	[%l7 + 0x78]
	edge16	%i1,	%g4,	%o0
	udiv	%g6,	0x040C,	%g3
	udiv	%o6,	0x039F,	%o2
	edge32ln	%l3,	%g5,	%i4
	movpos	%xcc,	%o4,	%l4
	xor	%l1,	%l5,	%i0
	ld	[%l7 + 0x34],	%f21
	udiv	%o7,	0x138A,	%g2
	andcc	%g7,	%i5,	%i3
	edge8	%l6,	%o1,	%g1
	movrgez	%o3,	0x310,	%l2
	movrgez	%l0,	0x085,	%o5
	mova	%xcc,	%i2,	%i7
	udivx	%i6,	0x0695,	%g4
	nop
	set	0x46, %g7
	ldsh	[%l7 + %g7],	%i1
	add	%g6,	%g3,	%o6
	edge16n	%o2,	%o0,	%g5
	sir	0x16A3
	array32	%l3,	%o4,	%l4
	edge16ln	%i4,	%l1,	%i0
	xnorcc	%o7,	0x0B30,	%g2
	stb	%l5,	[%l7 + 0x59]
	srlx	%i5,	%g7,	%i3
	popc	%l6,	%o1
	ldsh	[%l7 + 0x70],	%g1
	movne	%xcc,	%l2,	%l0
	fornot1s	%f8,	%f2,	%f20
	edge32	%o5,	%o3,	%i2
	fors	%f15,	%f20,	%f7
	umulcc	%i6,	%i7,	%g4
	subccc	%g6,	%g3,	%o6
	movpos	%xcc,	%o2,	%i1
	subccc	%g5,	0x1BF8,	%l3
	array8	%o0,	%o4,	%i4
	sethi	0x19C3,	%l4
	st	%f8,	[%l7 + 0x1C]
	ld	[%l7 + 0x58],	%f31
	movneg	%icc,	%l1,	%i0
	for	%f12,	%f22,	%f0
	edge8	%o7,	%l5,	%i5
	ldd	[%l7 + 0x58],	%f10
	umul	%g7,	%g2,	%i3
	edge16l	%o1,	%g1,	%l6
	sdivcc	%l0,	0x0C7E,	%l2
	mova	%icc,	%o5,	%o3
	siam	0x6
	mova	%xcc,	%i6,	%i7
	orcc	%i2,	%g6,	%g4
	movcs	%icc,	%g3,	%o2
	subcc	%i1,	0x1570,	%o6
	sth	%l3,	[%l7 + 0x1A]
	ldsw	[%l7 + 0x1C],	%o0
	fmovrdne	%g5,	%f28,	%f18
	fmovdge	%icc,	%f26,	%f10
	fandnot2s	%f8,	%f4,	%f13
	orcc	%i4,	%l4,	%l1
	or	%i0,	%o4,	%o7
	fmovrde	%i5,	%f12,	%f0
	movcs	%icc,	%g7,	%l5
	fmul8sux16	%f6,	%f0,	%f24
	movpos	%icc,	%g2,	%o1
	addccc	%i3,	0x1701,	%g1
	sth	%l6,	[%l7 + 0x68]
	fmovrsne	%l0,	%f20,	%f19
	std	%f4,	[%l7 + 0x58]
	ldsw	[%l7 + 0x68],	%o5
	sth	%l2,	[%l7 + 0x26]
	subcc	%i6,	%i7,	%o3
	andcc	%g6,	%i2,	%g3
	and	%g4,	%o2,	%o6
	ldub	[%l7 + 0x59],	%l3
	movre	%i1,	%o0,	%g5
	nop
	set	0x40, %o4
	ldsw	[%l7 + %o4],	%i4
	ldsb	[%l7 + 0x53],	%l1
	array8	%l4,	%o4,	%o7
	xorcc	%i5,	%i0,	%g7
	udivcc	%g2,	0x05EE,	%o1
	movcc	%xcc,	%l5,	%g1
	fpsub32	%f22,	%f2,	%f26
	movrlz	%i3,	%l0,	%l6
	edge8	%o5,	%l2,	%i7
	sethi	0x10E0,	%i6
	movvs	%icc,	%o3,	%i2
	fmovdvs	%icc,	%f6,	%f30
	fmovsn	%xcc,	%f5,	%f0
	movpos	%icc,	%g3,	%g6
	edge16	%g4,	%o6,	%l3
	fmovsgu	%xcc,	%f9,	%f1
	edge32n	%o2,	%o0,	%i1
	smul	%g5,	0x19FE,	%i4
	sir	0x1F29
	ld	[%l7 + 0x40],	%f11
	edge8n	%l4,	%l1,	%o7
	fmovrsne	%i5,	%f9,	%f23
	movrlz	%i0,	0x314,	%o4
	sir	0x1D44
	xnorcc	%g7,	0x130F,	%o1
	addccc	%g2,	%l5,	%i3
	orcc	%l0,	%l6,	%g1
	movcc	%icc,	%l2,	%i7
	fmovsneg	%icc,	%f9,	%f4
	srax	%i6,	0x07,	%o5
	xnor	%i2,	%o3,	%g3
	array32	%g6,	%g4,	%o6
	orn	%o2,	%o0,	%l3
	restore %i1, %i4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l4,	%l1,	%i5
	edge16	%i0,	%o4,	%o7
	movvs	%icc,	%o1,	%g7
	ldd	[%l7 + 0x30],	%f18
	andncc	%l5,	%g2,	%i3
	fmovdne	%xcc,	%f30,	%f1
	move	%xcc,	%l6,	%l0
	umul	%g1,	%i7,	%l2
	fnors	%f29,	%f23,	%f15
	lduh	[%l7 + 0x14],	%o5
	edge16	%i2,	%i6,	%o3
	orcc	%g3,	0x042E,	%g4
	movrlez	%g6,	0x3D3,	%o6
	faligndata	%f2,	%f22,	%f16
	addcc	%o2,	%l3,	%i1
	addccc	%i4,	%g5,	%l4
	save %o0, %i5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o4,	%i0,	%o1
	ldub	[%l7 + 0x79],	%o7
	faligndata	%f18,	%f14,	%f6
	subc	%l5,	%g2,	%g7
	stb	%l6,	[%l7 + 0x6B]
	movvc	%xcc,	%l0,	%i3
	sir	0x130C
	sub	%g1,	0x09C5,	%l2
	movne	%icc,	%o5,	%i7
	stw	%i2,	[%l7 + 0x20]
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	fone	%f0
	ldd	[%l7 + 0x38],	%f26
	ldsb	[%l7 + 0x5C],	%o3
	umulcc	%g6,	0x0FE9,	%o2
	lduh	[%l7 + 0x50],	%o6
	edge32n	%i1,	%i4,	%g5
	movvc	%icc,	%l4,	%l3
	sth	%o0,	[%l7 + 0x28]
	movn	%icc,	%l1,	%o4
	ld	[%l7 + 0x68],	%f28
	umul	%i5,	%i0,	%o7
	movpos	%xcc,	%o1,	%l5
	fxors	%f24,	%f24,	%f25
	or	%g2,	%g7,	%l0
	movneg	%icc,	%i3,	%l6
	ldd	[%l7 + 0x60],	%l2
	edge16ln	%o5,	%g1,	%i7
	popc	0x0475,	%i6
	edge16	%i2,	%g4,	%o3
	move	%xcc,	%g6,	%o2
	addcc	%o6,	%i1,	%i4
	umulcc	%g5,	0x006E,	%l4
	smul	%g3,	%l3,	%o0
	edge16ln	%o4,	%l1,	%i5
	ldd	[%l7 + 0x50],	%f14
	alignaddrl	%o7,	%o1,	%l5
	smulcc	%g2,	%g7,	%i0
	sll	%l0,	%i3,	%l2
	fpadd16s	%f15,	%f7,	%f12
	sdivcc	%l6,	0x1677,	%g1
	ldsb	[%l7 + 0x11],	%o5
	fpack16	%f18,	%f30
	st	%f6,	[%l7 + 0x38]
	sir	0x0D2C
	move	%xcc,	%i6,	%i2
	movg	%xcc,	%g4,	%o3
	sdiv	%i7,	0x1464,	%g6
	ldx	[%l7 + 0x20],	%o6
	move	%icc,	%o2,	%i4
	sdivcc	%i1,	0x0785,	%l4
	fmovscs	%xcc,	%f26,	%f2
	movrgez	%g3,	0x092,	%l3
	fnand	%f14,	%f8,	%f0
	movneg	%xcc,	%g5,	%o0
	edge16n	%o4,	%l1,	%i5
	fxor	%f18,	%f16,	%f26
	andn	%o1,	0x098F,	%o7
	sdivcc	%l5,	0x1DB7,	%g2
	lduw	[%l7 + 0x24],	%g7
	stx	%i0,	[%l7 + 0x68]
	xor	%l0,	0x0C95,	%i3
	stx	%l2,	[%l7 + 0x70]
	fmovrdlz	%l6,	%f12,	%f28
	ldsh	[%l7 + 0x22],	%o5
	and	%i6,	%g1,	%i2
	sra	%o3,	%i7,	%g6
	fmovdne	%icc,	%f7,	%f15
	move	%icc,	%g4,	%o6
	ldub	[%l7 + 0x3E],	%o2
	alignaddrl	%i4,	%l4,	%i1
	fcmps	%fcc2,	%f24,	%f9
	add	%g3,	0x07FB,	%l3
	ldsb	[%l7 + 0x2E],	%o0
	xnor	%g5,	%o4,	%l1
	alignaddrl	%o1,	%i5,	%o7
	fnot1s	%f5,	%f11
	smulcc	%g2,	0x0119,	%l5
	fandnot1s	%f5,	%f25,	%f5
	fmovdle	%icc,	%f15,	%f4
	movleu	%xcc,	%g7,	%i0
	stw	%l0,	[%l7 + 0x70]
	edge8ln	%l2,	%l6,	%o5
	array8	%i3,	%i6,	%i2
	movg	%xcc,	%o3,	%i7
	fmovsgu	%icc,	%f31,	%f20
	movn	%icc,	%g1,	%g4
	popc	%g6,	%o2
	andn	%o6,	0x0A71,	%i4
	edge8l	%i1,	%g3,	%l4
	andn	%l3,	%g5,	%o0
	movleu	%icc,	%o4,	%o1
	fcmpne32	%f6,	%f16,	%i5
	sra	%o7,	0x15,	%g2
	edge16n	%l1,	%l5,	%g7
	movrgz	%l0,	%l2,	%l6
	stw	%o5,	[%l7 + 0x1C]
	stx	%i0,	[%l7 + 0x08]
	movn	%icc,	%i6,	%i2
	lduh	[%l7 + 0x7E],	%o3
	smul	%i3,	%g1,	%g4
	subccc	%g6,	%o2,	%o6
	edge32l	%i7,	%i1,	%i4
	stb	%g3,	[%l7 + 0x6F]
	movre	%l4,	%l3,	%o0
	xnor	%o4,	%g5,	%o1
	fmul8ulx16	%f18,	%f22,	%f12
	edge16n	%i5,	%g2,	%l1
	andncc	%l5,	%g7,	%l0
	mulscc	%l2,	%o7,	%l6
	xor	%i0,	0x1AA3,	%i6
	save %o5, %o3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i2,	0x0A28,	%g4
	movg	%icc,	%g6,	%g1
	fnands	%f2,	%f13,	%f23
	xnorcc	%o2,	0x1654,	%o6
	edge8l	%i7,	%i1,	%i4
	siam	0x0
	ld	[%l7 + 0x44],	%f5
	lduh	[%l7 + 0x50],	%l4
	sethi	0x078F,	%g3
	mulscc	%o0,	%o4,	%g5
	edge8ln	%l3,	%o1,	%g2
	restore %i5, %l5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l0,	%l1,	%o7
	add	%l6,	0x126D,	%l2
	alignaddrl	%i0,	%i6,	%o5
	fpack32	%f2,	%f12,	%f30
	fpsub16	%f12,	%f18,	%f10
	stw	%i3,	[%l7 + 0x3C]
	udiv	%i2,	0x05C6,	%o3
	movg	%icc,	%g6,	%g1
	sdivx	%g4,	0x04E7,	%o6
	movgu	%xcc,	%o2,	%i1
	fmuld8ulx16	%f6,	%f17,	%f12
	udiv	%i4,	0x064C,	%i7
	sra	%l4,	0x07,	%o0
	edge16l	%o4,	%g5,	%g3
	save %l3, 0x133A, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o1,	%i5,	%g7
	edge8ln	%l5,	%l0,	%o7
	ldsw	[%l7 + 0x5C],	%l6
	xnorcc	%l1,	0x08A9,	%i0
	fmovde	%xcc,	%f14,	%f11
	fones	%f30
	sdivcc	%l2,	0x0AAB,	%o5
	sra	%i3,	0x16,	%i2
	edge8	%o3,	%g6,	%g1
	movleu	%icc,	%g4,	%o6
	stb	%o2,	[%l7 + 0x78]
	fone	%f24
	edge32	%i1,	%i6,	%i7
	st	%f8,	[%l7 + 0x20]
	fandnot1	%f14,	%f22,	%f6
	movge	%icc,	%l4,	%i4
	popc	%o4,	%o0
	stx	%g3,	[%l7 + 0x60]
	movre	%g5,	0x324,	%g2
	movge	%icc,	%l3,	%o1
	ldx	[%l7 + 0x28],	%i5
	fmovsge	%xcc,	%f16,	%f22
	orncc	%g7,	%l5,	%o7
	array32	%l6,	%l1,	%i0
	fmovdg	%xcc,	%f30,	%f29
	movleu	%icc,	%l0,	%l2
	movrlz	%i3,	%o5,	%i2
	ldub	[%l7 + 0x64],	%g6
	edge32	%o3,	%g4,	%o6
	popc	%g1,	%i1
	movvc	%xcc,	%i6,	%o2
	movcc	%icc,	%l4,	%i7
	andcc	%i4,	%o0,	%g3
	movcs	%xcc,	%o4,	%g5
	fmovdle	%icc,	%f11,	%f13
	fmovdn	%xcc,	%f6,	%f22
	fmovrsgez	%g2,	%f7,	%f18
	fmovrdlez	%l3,	%f2,	%f4
	srax	%i5,	%o1,	%g7
	fmul8x16al	%f14,	%f4,	%f16
	movg	%icc,	%o7,	%l5
	sra	%l1,	%i0,	%l0
	srl	%l6,	%i3,	%l2
	st	%f20,	[%l7 + 0x2C]
	mova	%xcc,	%o5,	%i2
	lduw	[%l7 + 0x18],	%g6
	addcc	%g4,	%o6,	%g1
	sub	%o3,	%i1,	%i6
	andn	%l4,	%o2,	%i7
	fmovsge	%icc,	%f21,	%f27
	fmovsa	%xcc,	%f0,	%f14
	sethi	0x0115,	%i4
	sth	%o0,	[%l7 + 0x66]
	edge32l	%o4,	%g5,	%g3
	sll	%l3,	%g2,	%o1
	fnors	%f26,	%f5,	%f29
	addc	%g7,	0x1017,	%o7
	srlx	%l5,	%i5,	%i0
	udivcc	%l0,	0x10BB,	%l6
	mova	%xcc,	%l1,	%i3
	udivx	%l2,	0x0DB2,	%i2
	lduh	[%l7 + 0x4C],	%g6
	xor	%o5,	%o6,	%g1
	movrne	%g4,	%o3,	%i1
	sdivcc	%i6,	0x0814,	%l4
	lduw	[%l7 + 0x2C],	%o2
	orcc	%i4,	%o0,	%i7
	srl	%o4,	%g3,	%l3
	andcc	%g2,	%g5,	%o1
	fmovdleu	%xcc,	%f8,	%f22
	xorcc	%g7,	0x18CE,	%o7
	addccc	%l5,	%i0,	%i5
	fpadd16s	%f21,	%f23,	%f7
	fcmple16	%f6,	%f24,	%l0
	fnot2s	%f0,	%f1
	fcmpne32	%f18,	%f12,	%l6
	edge8	%l1,	%i3,	%i2
	ldsh	[%l7 + 0x22],	%g6
	edge16n	%o5,	%l2,	%o6
	movg	%xcc,	%g4,	%o3
	addccc	%i1,	%g1,	%l4
	subcc	%o2,	%i6,	%i4
	fmuld8ulx16	%f8,	%f25,	%f28
	fcmps	%fcc1,	%f14,	%f1
	fmovsn	%xcc,	%f30,	%f2
	sth	%i7,	[%l7 + 0x2C]
	fcmple32	%f16,	%f22,	%o4
	edge32ln	%o0,	%g3,	%g2
	movleu	%xcc,	%l3,	%o1
	movleu	%icc,	%g7,	%o7
	edge16ln	%l5,	%i0,	%g5
	smulcc	%i5,	%l6,	%l1
	fnand	%f24,	%f14,	%f24
	orncc	%i3,	0x14B1,	%l0
	movcc	%icc,	%g6,	%i2
	sdivcc	%l2,	0x0A0E,	%o6
	movge	%icc,	%o5,	%o3
	mulx	%i1,	0x07CB,	%g4
	movle	%xcc,	%l4,	%o2
	movne	%icc,	%i6,	%i4
	edge8	%g1,	%i7,	%o0
	fmuld8ulx16	%f25,	%f25,	%f22
	or	%g3,	%o4,	%g2
	udivcc	%o1,	0x02D0,	%l3
	movn	%xcc,	%o7,	%l5
	fnot2s	%f16,	%f19
	fmovrsgez	%i0,	%f21,	%f15
	fmovd	%f8,	%f30
	movrlez	%g5,	0x039,	%g7
	siam	0x1
	fnot2	%f16,	%f6
	popc	%i5,	%l1
	fmovsleu	%xcc,	%f13,	%f10
	orcc	%i3,	%l0,	%g6
	fmul8x16al	%f18,	%f9,	%f4
	udivcc	%l6,	0x02D9,	%i2
	ldx	[%l7 + 0x50],	%o6
	ldsb	[%l7 + 0x5A],	%l2
	addcc	%o3,	%i1,	%g4
	movrne	%l4,	%o5,	%i6
	or	%o2,	0x13A9,	%g1
	sdivcc	%i7,	0x0321,	%o0
	umulcc	%i4,	0x1886,	%g3
	ldd	[%l7 + 0x08],	%o4
	fand	%f4,	%f22,	%f18
	addc	%g2,	%l3,	%o1
	fmovd	%f6,	%f16
	subc	%o7,	%i0,	%l5
	array32	%g7,	%i5,	%l1
	stx	%i3,	[%l7 + 0x38]
	xnor	%l0,	%g5,	%l6
	smulcc	%i2,	%g6,	%o6
	fpackfix	%f12,	%f14
	edge16n	%l2,	%o3,	%i1
	movcs	%icc,	%l4,	%g4
	mulx	%o5,	%o2,	%g1
	sll	%i6,	%i7,	%o0
	edge16ln	%i4,	%o4,	%g3
	ldd	[%l7 + 0x28],	%g2
	fcmps	%fcc2,	%f30,	%f18
	array32	%l3,	%o7,	%o1
	smulcc	%i0,	0x00BE,	%l5
	fmovsleu	%xcc,	%f17,	%f16
	smul	%g7,	%l1,	%i5
	movgu	%icc,	%l0,	%i3
	sdiv	%l6,	0x1738,	%i2
	lduh	[%l7 + 0x58],	%g5
	fmovrslz	%o6,	%f28,	%f23
	sub	%g6,	0x0D7D,	%l2
	sdivcc	%i1,	0x1C23,	%o3
	fpadd32s	%f23,	%f24,	%f14
	array16	%g4,	%l4,	%o2
	fmovdg	%xcc,	%f18,	%f18
	sra	%g1,	%o5,	%i7
	or	%i6,	0x0426,	%i4
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	sth	%g3,	[%l7 + 0x72]
	move	%xcc,	%l3,	%o7
	udiv	%g2,	0x0808,	%o1
	xnorcc	%l5,	%i0,	%g7
	addc	%l1,	0x1091,	%i5
	edge16ln	%i3,	%l0,	%l6
	addc	%i2,	%o6,	%g6
	andcc	%g5,	0x170F,	%i1
	sub	%o3,	%g4,	%l2
	lduw	[%l7 + 0x3C],	%o2
	movleu	%xcc,	%g1,	%o5
	udiv	%i7,	0x1752,	%i6
	sllx	%l4,	0x13,	%o4
	st	%f8,	[%l7 + 0x60]
	movg	%xcc,	%i4,	%g3
	xnor	%l3,	0x14B1,	%o0
	srlx	%o7,	0x1E,	%g2
	subcc	%l5,	0x12AC,	%i0
	lduh	[%l7 + 0x60],	%o1
	fornot2	%f26,	%f28,	%f6
	stb	%g7,	[%l7 + 0x56]
	alignaddrl	%l1,	%i5,	%i3
	mova	%xcc,	%l6,	%i2
	udivcc	%l0,	0x138D,	%o6
	movpos	%xcc,	%g6,	%g5
	ldd	[%l7 + 0x48],	%f6
	st	%f24,	[%l7 + 0x2C]
	st	%f3,	[%l7 + 0x60]
	movge	%xcc,	%o3,	%i1
	nop
	set	0x7A, %i0
	ldsb	[%l7 + %i0],	%g4
	fmovdneg	%icc,	%f16,	%f11
	smul	%l2,	%g1,	%o2
	edge32	%o5,	%i7,	%l4
	sir	0x1995
	andncc	%i6,	%i4,	%o4
	fnot1	%f22,	%f0
	fmul8sux16	%f18,	%f8,	%f26
	movcs	%xcc,	%l3,	%g3
	movcc	%xcc,	%o0,	%g2
	movge	%xcc,	%o7,	%i0
	sll	%o1,	%g7,	%l5
	xnor	%i5,	%l1,	%l6
	fmovdg	%xcc,	%f21,	%f28
	srl	%i2,	0x00,	%i3
	xnorcc	%o6,	0x0FCA,	%g6
	fcmpd	%fcc1,	%f30,	%f0
	fmovdcc	%xcc,	%f8,	%f8
	smulcc	%g5,	%o3,	%i1
	movleu	%icc,	%l0,	%g4
	srlx	%g1,	%l2,	%o5
	movcc	%xcc,	%i7,	%o2
	fmovsle	%icc,	%f4,	%f27
	addc	%l4,	%i6,	%o4
	sdivx	%l3,	0x1E6D,	%g3
	edge16n	%i4,	%g2,	%o7
	edge8	%i0,	%o0,	%g7
	ldsw	[%l7 + 0x20],	%l5
	fcmpne16	%f24,	%f8,	%i5
	nop
	set	0x48, %g4
	ldsh	[%l7 + %g4],	%l1
	add	%o1,	0x1414,	%i2
	sllx	%i3,	0x1E,	%o6
	ldsh	[%l7 + 0x28],	%g6
	andn	%l6,	0x0C2C,	%o3
	edge16	%g5,	%l0,	%i1
	fmovs	%f1,	%f7
	fones	%f5
	subccc	%g1,	%l2,	%g4
	movge	%xcc,	%o5,	%i7
	fmovsvc	%xcc,	%f8,	%f5
	edge32ln	%o2,	%l4,	%o4
	udivcc	%i6,	0x1B04,	%l3
	xnorcc	%i4,	%g2,	%o7
	ldd	[%l7 + 0x48],	%i0
	sra	%o0,	%g7,	%l5
	ld	[%l7 + 0x08],	%f22
	edge16l	%g3,	%l1,	%i5
	and	%i2,	%o1,	%i3
	edge16ln	%g6,	%l6,	%o3
	movgu	%icc,	%o6,	%l0
	fnegs	%f10,	%f31
	or	%g5,	%i1,	%g1
	movrgez	%l2,	0x09E,	%o5
	movn	%xcc,	%g4,	%o2
	movrgz	%l4,	%i7,	%i6
	movleu	%xcc,	%o4,	%l3
	edge16ln	%g2,	%i4,	%i0
	fmovrdgez	%o7,	%f18,	%f24
	addccc	%o0,	0x0C56,	%g7
	edge16ln	%l5,	%l1,	%i5
	smul	%g3,	%i2,	%i3
	xnor	%g6,	%l6,	%o1
	edge8n	%o6,	%o3,	%l0
	andn	%i1,	%g1,	%l2
	edge32l	%o5,	%g5,	%g4
	sra	%l4,	0x06,	%i7
	xorcc	%i6,	0x1E54,	%o2
	fnot2s	%f27,	%f11
	orn	%o4,	0x0971,	%g2
	srlx	%i4,	%i0,	%o7
	sdivx	%o0,	0x08D3,	%g7
	restore %l5, %l1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f2,	%f22
	fmovrde	%l3,	%f26,	%f0
	fcmpgt32	%f30,	%f0,	%g3
	sdivcc	%i2,	0x0833,	%i3
	alignaddrl	%l6,	%o1,	%o6
	movn	%icc,	%o3,	%g6
	sdivx	%i1,	0x1373,	%g1
	movgu	%xcc,	%l0,	%l2
	movl	%xcc,	%g5,	%g4
	array16	%o5,	%i7,	%l4
	movn	%icc,	%i6,	%o2
	movleu	%icc,	%g2,	%i4
	fmovdvc	%xcc,	%f3,	%f31
	umulcc	%i0,	0x1C7A,	%o7
	smul	%o0,	0x1E21,	%o4
	siam	0x5
	edge32ln	%g7,	%l1,	%l5
	sdivx	%i5,	0x0AE3,	%g3
	subccc	%l3,	0x1C7A,	%i2
	xnor	%i3,	0x06CD,	%l6
	fmovrsne	%o1,	%f21,	%f31
	faligndata	%f14,	%f20,	%f2
	nop
	set	0x20, %i5
	ldub	[%l7 + %i5],	%o3
	mova	%xcc,	%o6,	%g6
	stx	%i1,	[%l7 + 0x38]
	xnorcc	%g1,	0x00D9,	%l0
	movle	%icc,	%l2,	%g4
	xnorcc	%o5,	0x07AA,	%i7
	subc	%g5,	%i6,	%o2
	edge32n	%l4,	%g2,	%i0
	edge16ln	%o7,	%i4,	%o4
	sra	%o0,	0x0A,	%g7
	popc	%l1,	%l5
	movleu	%xcc,	%g3,	%i5
	ldub	[%l7 + 0x14],	%l3
	for	%f22,	%f6,	%f22
	movneg	%icc,	%i2,	%i3
	fones	%f23
	orncc	%l6,	%o1,	%o3
	movcs	%icc,	%o6,	%i1
	movrlz	%g1,	%g6,	%l2
	movcs	%xcc,	%l0,	%o5
	fmovdn	%icc,	%f25,	%f23
	edge16l	%g4,	%g5,	%i6
	fmovrde	%i7,	%f16,	%f28
	alignaddrl	%l4,	%o2,	%i0
	xnorcc	%g2,	0x14E9,	%o7
	popc	%o4,	%i4
	subcc	%o0,	0x0AF7,	%g7
	edge32l	%l1,	%g3,	%l5
	nop
	set	0x0C, %i6
	stw	%l3,	[%l7 + %i6]
	edge16	%i5,	%i3,	%i2
	fmovsge	%xcc,	%f18,	%f1
	fmovdl	%xcc,	%f4,	%f5
	fandnot2s	%f10,	%f3,	%f23
	movre	%o1,	0x077,	%o3
	movle	%icc,	%o6,	%l6
	umul	%i1,	0x181C,	%g1
	sra	%l2,	%l0,	%o5
	addccc	%g6,	0x016A,	%g4
	edge32l	%i6,	%i7,	%g5
	sdiv	%l4,	0x0BE5,	%o2
	fmovrde	%i0,	%f22,	%f4
	or	%g2,	%o7,	%o4
	fcmple32	%f18,	%f12,	%i4
	ldx	[%l7 + 0x68],	%o0
	edge8l	%g7,	%g3,	%l1
	edge32n	%l3,	%i5,	%l5
	andncc	%i2,	%o1,	%o3
	umul	%o6,	0x1B64,	%i3
	movrgez	%l6,	%i1,	%l2
	andncc	%l0,	%g1,	%g6
	alignaddrl	%o5,	%i6,	%i7
	fcmpd	%fcc0,	%f0,	%f6
	sdiv	%g5,	0x1D8C,	%l4
	ldd	[%l7 + 0x10],	%g4
	fcmpne32	%f30,	%f14,	%o2
	mulscc	%g2,	0x061D,	%o7
	subccc	%i0,	%o4,	%o0
	edge8n	%g7,	%i4,	%g3
	mova	%icc,	%l1,	%l3
	subc	%l5,	%i2,	%o1
	fornot2	%f0,	%f24,	%f0
	lduh	[%l7 + 0x76],	%o3
	movrlz	%o6,	%i3,	%l6
	movrlz	%i5,	%l2,	%i1
	fmovrdgez	%g1,	%f18,	%f8
	edge32l	%g6,	%l0,	%i6
	mova	%icc,	%o5,	%i7
	subc	%l4,	0x1F78,	%g5
	fands	%f8,	%f14,	%f10
	save %o2, 0x0E1E, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x58]
	lduh	[%l7 + 0x14],	%o7
	smulcc	%i0,	%g4,	%o4
	and	%o0,	0x1144,	%i4
	movl	%xcc,	%g7,	%g3
	andcc	%l3,	%l5,	%l1
	fmovrdne	%o1,	%f28,	%f4
	edge8ln	%i2,	%o3,	%i3
	smulcc	%l6,	%i5,	%l2
	fmovdvs	%icc,	%f20,	%f3
	sra	%o6,	0x0C,	%i1
	sub	%g6,	0x029D,	%l0
	subcc	%g1,	%o5,	%i7
	subcc	%i6,	%g5,	%o2
	fzeros	%f30
	sth	%g2,	[%l7 + 0x3E]
	edge32	%l4,	%i0,	%g4
	ldsh	[%l7 + 0x60],	%o4
	movre	%o7,	%o0,	%i4
	fmovdn	%xcc,	%f0,	%f2
	fxnors	%f16,	%f25,	%f19
	fmovdpos	%icc,	%f16,	%f5
	sll	%g7,	0x12,	%l3
	movrgz	%g3,	0x341,	%l1
	array32	%l5,	%o1,	%i2
	movrgez	%o3,	%l6,	%i3
	edge32l	%i5,	%o6,	%i1
	sethi	0x100F,	%g6
	andn	%l0,	0x07E5,	%l2
	edge16	%o5,	%g1,	%i6
	popc	%g5,	%o2
	fnand	%f20,	%f30,	%f22
	fandnot1	%f2,	%f10,	%f10
	fmovsne	%xcc,	%f9,	%f14
	movrgz	%g2,	0x2D8,	%i7
	movvc	%xcc,	%l4,	%g4
	array32	%o4,	%i0,	%o7
	save %i4, %g7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g3,	0x057C,	%l1
	array8	%l3,	%l5,	%o1
	mova	%icc,	%i2,	%o3
	fmovdn	%icc,	%f25,	%f14
	fones	%f29
	andn	%l6,	0x069E,	%i3
	addccc	%o6,	0x1089,	%i1
	sdivx	%i5,	0x09F4,	%l0
	sdivx	%l2,	0x0955,	%g6
	srax	%g1,	0x08,	%i6
	fpadd16	%f6,	%f2,	%f10
	move	%icc,	%g5,	%o2
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	umulcc	%l4,	%g4,	%o5
	edge32ln	%i0,	%o4,	%o7
	stw	%i4,	[%l7 + 0x20]
	array8	%g7,	%o0,	%l1
	sra	%g3,	0x19,	%l5
	array8	%l3,	%o1,	%i2
	mulscc	%o3,	0x06DE,	%i3
	xorcc	%o6,	%i1,	%l6
	edge32n	%i5,	%l0,	%l2
	movne	%icc,	%g6,	%i6
	orcc	%g5,	%g1,	%g2
	stw	%o2,	[%l7 + 0x28]
	smulcc	%i7,	%g4,	%l4
	fmovrsgz	%i0,	%f8,	%f0
	ldx	[%l7 + 0x50],	%o5
	movn	%xcc,	%o7,	%i4
	xnorcc	%o4,	%g7,	%o0
	andcc	%g3,	%l5,	%l1
	fmovsne	%xcc,	%f1,	%f28
	subcc	%l3,	0x0C23,	%o1
	array32	%i2,	%i3,	%o6
	addc	%i1,	%o3,	%l6
	nop
	set	0x56, %g6
	lduh	[%l7 + %g6],	%l0
	srax	%l2,	%i5,	%i6
	movg	%icc,	%g6,	%g1
	or	%g2,	%o2,	%g5
	movleu	%icc,	%g4,	%i7
	move	%icc,	%i0,	%o5
	and	%l4,	%i4,	%o7
	sir	0x110C
	movrlz	%g7,	%o0,	%o4
	mulx	%l5,	0x1158,	%l1
	ldd	[%l7 + 0x30],	%l2
	mulscc	%o1,	%g3,	%i2
	movg	%icc,	%i3,	%i1
	smulcc	%o6,	0x0D24,	%l6
	fnot1s	%f17,	%f16
	fxors	%f14,	%f23,	%f30
	movvc	%icc,	%l0,	%o3
	fand	%f8,	%f14,	%f6
	edge32l	%i5,	%i6,	%l2
	fmovdle	%icc,	%f15,	%f8
	edge32	%g6,	%g2,	%o2
	fexpand	%f21,	%f6
	or	%g1,	%g5,	%i7
	orn	%i0,	0x0EDA,	%o5
	ldx	[%l7 + 0x40],	%l4
	stw	%i4,	[%l7 + 0x60]
	edge8ln	%o7,	%g7,	%g4
	fxnor	%f28,	%f0,	%f8
	fmovda	%xcc,	%f11,	%f23
	movge	%xcc,	%o4,	%o0
	stb	%l1,	[%l7 + 0x5C]
	sdivx	%l3,	0x15A8,	%l5
	ldd	[%l7 + 0x30],	%g2
	fpadd32	%f10,	%f10,	%f0
	fxors	%f13,	%f9,	%f15
	movl	%xcc,	%o1,	%i3
	xor	%i1,	0x0458,	%i2
	fmovsn	%xcc,	%f24,	%f31
	fmovdl	%icc,	%f6,	%f11
	movrlz	%l6,	%o6,	%o3
	fmovsa	%icc,	%f5,	%f1
	alignaddrl	%i5,	%l0,	%i6
	subccc	%g6,	0x1097,	%g2
	edge32n	%l2,	%o2,	%g5
	faligndata	%f2,	%f6,	%f16
	edge16	%i7,	%g1,	%o5
	fcmpd	%fcc3,	%f16,	%f22
	movgu	%icc,	%i0,	%i4
	movcs	%xcc,	%l4,	%g7
	movre	%g4,	0x20A,	%o7
	movrlez	%o0,	%o4,	%l3
	sdivcc	%l5,	0x1C1F,	%g3
	stx	%l1,	[%l7 + 0x38]
	orncc	%i3,	%i1,	%o1
	srax	%i2,	%o6,	%o3
	mulscc	%i5,	%l0,	%l6
	st	%f15,	[%l7 + 0x30]
	udiv	%g6,	0x0D53,	%i6
	xnor	%g2,	%o2,	%g5
	sra	%i7,	%g1,	%o5
	movle	%xcc,	%l2,	%i0
	mulx	%i4,	0x0AC4,	%l4
	addc	%g7,	0x14DE,	%g4
	movleu	%xcc,	%o7,	%o0
	ldsw	[%l7 + 0x64],	%l3
	fsrc1s	%f8,	%f3
	movl	%icc,	%l5,	%g3
	fmuld8ulx16	%f12,	%f4,	%f30
	edge16l	%o4,	%l1,	%i1
	movleu	%icc,	%i3,	%o1
	subccc	%o6,	%i2,	%o3
	subcc	%l0,	0x19AC,	%i5
	st	%f17,	[%l7 + 0x74]
	stx	%l6,	[%l7 + 0x68]
	movcc	%xcc,	%g6,	%i6
	mulx	%g2,	0x0DFC,	%g5
	fzero	%f20
	lduw	[%l7 + 0x38],	%o2
	ldsw	[%l7 + 0x10],	%g1
	edge16n	%i7,	%l2,	%o5
	fpsub16s	%f31,	%f4,	%f13
	movrgz	%i0,	0x224,	%i4
	movrne	%g7,	0x1E4,	%g4
	udiv	%l4,	0x16EF,	%o7
	fnor	%f22,	%f30,	%f0
	fmovsne	%icc,	%f30,	%f28
	fmovsg	%xcc,	%f26,	%f7
	fmovse	%icc,	%f31,	%f19
	edge16l	%l3,	%l5,	%g3
	andn	%o0,	0x092E,	%l1
	edge16l	%o4,	%i1,	%i3
	movrgez	%o1,	%o6,	%o3
	move	%xcc,	%i2,	%l0
	nop
	set	0x16, %i3
	ldsh	[%l7 + %i3],	%l6
	sdivx	%g6,	0x1817,	%i6
	edge32	%g2,	%i5,	%o2
	sth	%g5,	[%l7 + 0x58]
	fxnors	%f14,	%f24,	%f7
	sdivcc	%g1,	0x1284,	%i7
	stx	%o5,	[%l7 + 0x20]
	ldsb	[%l7 + 0x69],	%l2
	movcc	%xcc,	%i4,	%i0
	lduh	[%l7 + 0x3C],	%g7
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f4
	add	%l4,	%g4,	%l3
	fmovscc	%icc,	%f4,	%f14
	movgu	%xcc,	%l5,	%g3
	movl	%xcc,	%o7,	%l1
	xor	%o4,	%o0,	%i3
	fandnot1s	%f15,	%f28,	%f4
	xnor	%i1,	%o1,	%o6
	subc	%i2,	%o3,	%l6
	sll	%l0,	%g6,	%i6
	faligndata	%f12,	%f18,	%f22
	orn	%i5,	%o2,	%g5
	fpadd16s	%f29,	%f2,	%f9
	add	%g2,	0x05B7,	%g1
	orn	%i7,	%l2,	%o5
	andncc	%i4,	%i0,	%g7
	movre	%g4,	%l4,	%l3
	subccc	%g3,	0x18C3,	%o7
	srl	%l1,	0x15,	%l5
	edge16l	%o0,	%o4,	%i3
	ldub	[%l7 + 0x2D],	%o1
	xnor	%o6,	0x1CF2,	%i1
	edge32n	%o3,	%i2,	%l6
	edge16l	%l0,	%g6,	%i5
	fmovdleu	%xcc,	%f16,	%f23
	edge32n	%o2,	%i6,	%g5
	fmovdvc	%icc,	%f0,	%f14
	umul	%g2,	%i7,	%l2
	popc	%g1,	%i4
	srax	%i0,	0x17,	%o5
	ldx	[%l7 + 0x78],	%g4
	movge	%xcc,	%g7,	%l3
	movgu	%icc,	%g3,	%l4
	stw	%o7,	[%l7 + 0x38]
	smulcc	%l5,	%o0,	%l1
	orcc	%i3,	%o1,	%o4
	edge16l	%i1,	%o3,	%o6
	fandnot2s	%f6,	%f16,	%f17
	sllx	%l6,	0x08,	%i2
	movvc	%icc,	%l0,	%i5
	subc	%o2,	0x065A,	%g6
	mova	%xcc,	%g5,	%g2
	edge16n	%i7,	%i6,	%g1
	srlx	%l2,	0x0C,	%i0
	ldsb	[%l7 + 0x6F],	%i4
	sir	0x0BBF
	movleu	%icc,	%o5,	%g4
	edge32ln	%l3,	%g7,	%l4
	sethi	0x01DA,	%g3
	ldub	[%l7 + 0x1E],	%l5
	fmovsneg	%xcc,	%f19,	%f8
	st	%f21,	[%l7 + 0x60]
	edge16n	%o7,	%l1,	%o0
	faligndata	%f14,	%f30,	%f30
	move	%icc,	%o1,	%i3
	mulscc	%o4,	0x1147,	%i1
	fmovrsgz	%o6,	%f30,	%f22
	movg	%xcc,	%l6,	%o3
	sth	%l0,	[%l7 + 0x7C]
	fnors	%f31,	%f1,	%f4
	sir	0x1ABE
	movrlz	%i5,	0x1FA,	%i2
	subc	%o2,	0x02FD,	%g6
	popc	%g5,	%i7
	fcmple32	%f24,	%f2,	%i6
	edge32n	%g1,	%g2,	%i0
	move	%xcc,	%i4,	%l2
	fmovrdlez	%o5,	%f12,	%f22
	sub	%l3,	0x003F,	%g7
	srl	%g4,	%g3,	%l5
	array32	%l4,	%l1,	%o7
	movcc	%icc,	%o0,	%o1
	sub	%o4,	0x0A54,	%i1
	fabss	%f2,	%f18
	smulcc	%i3,	0x1BE9,	%l6
	addc	%o6,	0x0321,	%l0
	sth	%o3,	[%l7 + 0x1A]
	udivcc	%i5,	0x1B90,	%o2
	fabss	%f6,	%f15
	and	%g6,	%g5,	%i7
	movl	%xcc,	%i6,	%i2
	fmovsgu	%xcc,	%f2,	%f11
	movl	%xcc,	%g1,	%g2
	ldx	[%l7 + 0x48],	%i4
	fnot2	%f18,	%f8
	srlx	%l2,	0x14,	%o5
	lduw	[%l7 + 0x14],	%i0
	movvc	%icc,	%l3,	%g7
	fnors	%f5,	%f29,	%f25
	sth	%g3,	[%l7 + 0x4A]
	sub	%g4,	0x1037,	%l4
	array32	%l1,	%l5,	%o7
	add	%o0,	%o4,	%i1
	movl	%xcc,	%o1,	%l6
	edge32	%i3,	%o6,	%o3
	sub	%l0,	0x1379,	%i5
	edge8ln	%o2,	%g5,	%g6
	movrgez	%i7,	%i6,	%g1
	edge8	%g2,	%i2,	%i4
	fmovdl	%xcc,	%f12,	%f18
	ldd	[%l7 + 0x50],	%f10
	edge32ln	%o5,	%l2,	%l3
	edge32ln	%i0,	%g3,	%g4
	fmul8sux16	%f26,	%f0,	%f24
	edge32l	%g7,	%l1,	%l4
	fnot2s	%f23,	%f24
	st	%f17,	[%l7 + 0x40]
	ldd	[%l7 + 0x50],	%f8
	movrlez	%l5,	%o7,	%o4
	movneg	%xcc,	%o0,	%i1
	umul	%o1,	%l6,	%i3
	alignaddr	%o6,	%l0,	%i5
	ldub	[%l7 + 0x2C],	%o2
	ld	[%l7 + 0x14],	%f1
	stb	%g5,	[%l7 + 0x35]
	edge32l	%g6,	%i7,	%i6
	sdivcc	%o3,	0x1020,	%g1
	edge16	%g2,	%i4,	%i2
	lduh	[%l7 + 0x48],	%o5
	sir	0x050A
	movrne	%l2,	%l3,	%i0
	srlx	%g4,	%g3,	%g7
	udivcc	%l4,	0x0F96,	%l5
	siam	0x2
	umul	%o7,	%l1,	%o0
	fcmpgt32	%f12,	%f2,	%o4
	fmul8x16al	%f31,	%f23,	%f28
	movre	%o1,	0x08C,	%l6
	lduw	[%l7 + 0x50],	%i3
	smul	%i1,	0x1677,	%o6
	sub	%i5,	0x1C99,	%l0
	alignaddrl	%o2,	%g5,	%g6
	bshuffle	%f26,	%f4,	%f26
	fmovsl	%xcc,	%f7,	%f12
	subc	%i6,	0x0D97,	%i7
	alignaddrl	%o3,	%g2,	%i4
	movvc	%xcc,	%g1,	%i2
	fmovsa	%icc,	%f10,	%f1
	and	%o5,	0x06A8,	%l2
	movrgz	%l3,	%g4,	%g3
	movgu	%xcc,	%g7,	%l4
	sir	0x1D18
	edge32l	%i0,	%o7,	%l5
	xorcc	%o0,	0x014F,	%l1
	nop
	set	0x10, %l4
	stx	%o4,	[%l7 + %l4]
	fxnors	%f1,	%f18,	%f4
	save %l6, 0x12E1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	0x1CD0,	%o6
	movrlez	%i1,	0x110,	%i5
	fcmpeq32	%f8,	%f28,	%o2
	and	%l0,	0x07F2,	%g5
	orcc	%g6,	0x0263,	%i7
	xnorcc	%i6,	0x1B26,	%g2
	fmovsneg	%icc,	%f16,	%f0
	restore %o3, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g1,	0x06,	%l2
	fpack16	%f18,	%f10
	std	%f10,	[%l7 + 0x08]
	movl	%icc,	%o5,	%l3
	orncc	%g4,	%g3,	%l4
	smulcc	%i0,	0x0930,	%o7
	ldub	[%l7 + 0x40],	%l5
	fors	%f28,	%f9,	%f14
	smulcc	%g7,	0x067C,	%o0
	array8	%l1,	%o4,	%l6
	xnorcc	%i3,	0x1A3D,	%o1
	movcs	%icc,	%i1,	%i5
	edge8n	%o2,	%l0,	%o6
	edge32	%g6,	%g5,	%i6
	edge8ln	%g2,	%i7,	%o3
	alignaddrl	%i2,	%g1,	%l2
	ldd	[%l7 + 0x20],	%f16
	edge32ln	%o5,	%l3,	%i4
	siam	0x0
	addccc	%g3,	0x1A3F,	%l4
	fnands	%f14,	%f30,	%f21
	udivx	%i0,	0x19B1,	%o7
	st	%f25,	[%l7 + 0x58]
	movne	%xcc,	%g4,	%l5
	smul	%o0,	0x1255,	%g7
	movneg	%icc,	%o4,	%l1
	movrgz	%i3,	%o1,	%i1
	nop
	set	0x56, %i2
	ldsb	[%l7 + %i2],	%l6
	movleu	%xcc,	%o2,	%i5
	or	%o6,	0x044D,	%l0
	sllx	%g5,	%g6,	%i6
	movvs	%icc,	%g2,	%i7
	array32	%o3,	%g1,	%i2
	xnorcc	%o5,	0x1E2E,	%l3
	ldx	[%l7 + 0x28],	%i4
	ldsb	[%l7 + 0x57],	%l2
	edge8	%g3,	%l4,	%o7
	fcmpeq16	%f12,	%f28,	%i0
	umul	%g4,	%l5,	%g7
	udivcc	%o0,	0x197D,	%o4
	stx	%l1,	[%l7 + 0x78]
	orncc	%i3,	0x00D3,	%i1
	array8	%o1,	%o2,	%i5
	addc	%l6,	%o6,	%g5
	udivcc	%g6,	0x0581,	%i6
	xorcc	%g2,	0x0A50,	%i7
	fnand	%f16,	%f24,	%f30
	stb	%l0,	[%l7 + 0x26]
	movneg	%icc,	%o3,	%g1
	movcs	%icc,	%i2,	%o5
	fmul8x16au	%f2,	%f19,	%f10
	fand	%f8,	%f0,	%f10
	fcmped	%fcc0,	%f2,	%f12
	array8	%i4,	%l3,	%g3
	sir	0x106B
	fandnot2	%f12,	%f18,	%f12
	srl	%l2,	0x0A,	%l4
	edge16n	%o7,	%i0,	%l5
	mova	%xcc,	%g4,	%o0
	ldx	[%l7 + 0x40],	%o4
	sllx	%g7,	%i3,	%l1
	xor	%i1,	%o2,	%i5
	lduh	[%l7 + 0x10],	%o1
	andncc	%o6,	%g5,	%g6
	sth	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x78],	%g2
	alignaddr	%i6,	%l0,	%i7
	or	%g1,	0x1672,	%o3
	movgu	%xcc,	%i2,	%o5
	fandnot2	%f8,	%f2,	%f0
	smulcc	%i4,	%g3,	%l2
	sdiv	%l4,	0x03DA,	%l3
	xnorcc	%i0,	0x012D,	%o7
	ldsw	[%l7 + 0x4C],	%g4
	orcc	%l5,	%o0,	%o4
	lduh	[%l7 + 0x20],	%i3
	edge8n	%g7,	%l1,	%i1
	fmul8x16au	%f9,	%f31,	%f30
	alignaddrl	%i5,	%o2,	%o1
	ldd	[%l7 + 0x70],	%f28
	nop
	set	0x3E, %o0
	ldsb	[%l7 + %o0],	%o6
	orncc	%g5,	%l6,	%g2
	fpack32	%f30,	%f8,	%f26
	edge32n	%g6,	%i6,	%i7
	fands	%f3,	%f15,	%f15
	ldub	[%l7 + 0x16],	%l0
	alignaddr	%o3,	%g1,	%o5
	and	%i2,	0x10AB,	%i4
	fnegd	%f2,	%f30
	fpsub32	%f10,	%f0,	%f22
	orn	%l2,	%g3,	%l4
	smulcc	%l3,	%i0,	%g4
	fmovsa	%icc,	%f24,	%f19
	fmovrslez	%l5,	%f16,	%f1
	sir	0x1FB3
	and	%o0,	0x0095,	%o4
	movne	%xcc,	%o7,	%i3
	sdivcc	%l1,	0x0F4E,	%i1
	movpos	%xcc,	%i5,	%o2
	udiv	%g7,	0x091E,	%o1
	array8	%g5,	%o6,	%l6
	andcc	%g6,	0x0A6D,	%i6
	udivx	%i7,	0x16C1,	%l0
	fpack16	%f4,	%f20
	fmul8sux16	%f6,	%f4,	%f30
	umulcc	%o3,	%g2,	%o5
	fpack32	%f12,	%f12,	%f20
	fnor	%f16,	%f24,	%f12
	fmovdleu	%xcc,	%f27,	%f10
	stb	%g1,	[%l7 + 0x3D]
	or	%i2,	0x04D5,	%i4
	fpsub32s	%f25,	%f7,	%f1
	ldsb	[%l7 + 0x19],	%l2
	stw	%g3,	[%l7 + 0x3C]
	ld	[%l7 + 0x20],	%f6
	xorcc	%l3,	0x0F9D,	%i0
	fpadd16	%f24,	%f4,	%f14
	fmovdgu	%xcc,	%f22,	%f19
	fmovsleu	%icc,	%f27,	%f6
	udivcc	%l4,	0x1AC4,	%l5
	movgu	%icc,	%o0,	%g4
	array16	%o4,	%i3,	%o7
	fornot2	%f6,	%f0,	%f14
	edge16l	%i1,	%l1,	%i5
	movge	%xcc,	%o2,	%g7
	mulscc	%g5,	0x0EA8,	%o1
	addcc	%o6,	%g6,	%l6
	ldd	[%l7 + 0x50],	%f16
	alignaddrl	%i7,	%i6,	%l0
	movrgz	%o3,	0x355,	%g2
	lduh	[%l7 + 0x50],	%o5
	fmovdpos	%xcc,	%f26,	%f5
	movvc	%xcc,	%g1,	%i2
	save %l2, 0x0F39, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i4,	%l3
	fexpand	%f25,	%f0
	sdivx	%l4,	0x1EBA,	%l5
	addc	%o0,	0x1A47,	%i0
	sth	%o4,	[%l7 + 0x2C]
	sub	%g4,	%o7,	%i3
	xnorcc	%l1,	0x1F86,	%i5
	smulcc	%i1,	%o2,	%g7
	andncc	%g5,	%o6,	%g6
	edge8	%o1,	%l6,	%i6
	addc	%i7,	%o3,	%g2
	edge8n	%o5,	%g1,	%i2
	ldsw	[%l7 + 0x6C],	%l2
	edge8l	%l0,	%g3,	%i4
	array8	%l3,	%l5,	%o0
	subc	%i0,	0x15A7,	%o4
	fmovdl	%xcc,	%f17,	%f24
	udivx	%g4,	0x1C82,	%l4
	subcc	%i3,	0x1775,	%l1
	udivx	%o7,	0x1371,	%i5
	udivx	%o2,	0x09F4,	%i1
	addccc	%g5,	%g7,	%o6
	andn	%o1,	%l6,	%i6
	srlx	%i7,	0x05,	%o3
	smul	%g2,	0x0EF0,	%o5
	edge16n	%g1,	%g6,	%l2
	fmovdn	%xcc,	%f14,	%f27
	addcc	%i2,	0x1577,	%g3
	fpadd16s	%f20,	%f23,	%f1
	ldub	[%l7 + 0x4E],	%i4
	fmovrslez	%l0,	%f12,	%f2
	or	%l5,	0x1AE1,	%l3
	ldsw	[%l7 + 0x2C],	%o0
	sth	%o4,	[%l7 + 0x44]
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	fmovdpos	%xcc,	%f29,	%f21
	lduw	[%l7 + 0x5C],	%i3
	fpadd32	%f2,	%f26,	%f16
	fornot2s	%f29,	%f23,	%f11
	fmovdvs	%xcc,	%f19,	%f1
	subccc	%l1,	0x1DCC,	%l4
	sdivx	%o7,	0x1752,	%i5
	fsrc2	%f8,	%f22
	std	%f8,	[%l7 + 0x50]
	sdivcc	%i1,	0x1F42,	%g5
	stx	%o2,	[%l7 + 0x48]
	fsrc2	%f26,	%f14
	ldub	[%l7 + 0x10],	%o6
	addcc	%g7,	0x1F81,	%o1
	edge8	%l6,	%i7,	%o3
	nop
	set	0x5C, %o1
	sth	%g2,	[%l7 + %o1]
	edge8n	%o5,	%i6,	%g6
	and	%g1,	0x18D4,	%i2
	edge32l	%l2,	%i4,	%g3
	orn	%l0,	%l3,	%l5
	movvs	%xcc,	%o0,	%o4
	mova	%icc,	%i0,	%g4
	xnorcc	%i3,	%l4,	%o7
	addcc	%l1,	%i1,	%g5
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f16
	fmovse	%icc,	%f18,	%f15
	fpsub32	%f8,	%f26,	%f14
	umulcc	%i5,	%o6,	%o2
	movcc	%xcc,	%o1,	%g7
	andcc	%l6,	0x16C2,	%i7
	fmovsgu	%icc,	%f19,	%f31
	lduh	[%l7 + 0x54],	%g2
	andcc	%o3,	0x0DCA,	%i6
	restore %g6, %g1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i2,	[%l7 + 0x38]
	andn	%l2,	%g3,	%l0
	lduh	[%l7 + 0x76],	%l3
	edge8	%l5,	%o0,	%i4
	fmovrdlz	%o4,	%f22,	%f10
	sethi	0x188C,	%g4
	stw	%i3,	[%l7 + 0x64]
	fmovde	%icc,	%f31,	%f11
	srax	%i0,	0x15,	%l4
	movge	%xcc,	%l1,	%i1
	sir	0x1BCD
	edge32ln	%o7,	%g5,	%o6
	movrgez	%o2,	%o1,	%g7
	addcc	%i5,	%i7,	%g2
	edge32l	%o3,	%i6,	%l6
	sth	%g6,	[%l7 + 0x62]
	save %g1, %o5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g3,	%f26,	%f12
	fzero	%f22
	fmuld8sux16	%f15,	%f9,	%f18
	mulscc	%l2,	0x080F,	%l0
	fmovspos	%icc,	%f14,	%f17
	movpos	%icc,	%l3,	%l5
	edge8n	%o0,	%o4,	%i4
	orn	%g4,	%i3,	%l4
	movrlz	%l1,	%i1,	%o7
	movvs	%icc,	%g5,	%o6
	umulcc	%i0,	%o1,	%o2
	faligndata	%f16,	%f20,	%f16
	orncc	%g7,	0x003A,	%i7
	udivx	%i5,	0x182E,	%g2
	sir	0x0AA7
	movneg	%icc,	%o3,	%i6
	edge16l	%l6,	%g1,	%o5
	movre	%g6,	%g3,	%l2
	st	%f10,	[%l7 + 0x68]
	movvc	%icc,	%l0,	%i2
	xor	%l3,	0x107C,	%o0
	sra	%l5,	0x0F,	%o4
	movge	%icc,	%i4,	%i3
	movleu	%icc,	%l4,	%g4
	fnot1s	%f30,	%f23
	umul	%i1,	%o7,	%g5
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%l0
	ldsb	[%l7 + 0x24],	%o6
	lduw	[%l7 + 0x70],	%i0
	stb	%o1,	[%l7 + 0x3D]
	sub	%g7,	0x06E7,	%o2
	fmovdne	%xcc,	%f19,	%f8
	movrne	%i7,	0x21E,	%g2
	smulcc	%i5,	%o3,	%i6
	fmovrsgz	%g1,	%f5,	%f13
	array16	%o5,	%l6,	%g3
	fexpand	%f14,	%f20
	fmovsleu	%icc,	%f26,	%f27
	std	%f10,	[%l7 + 0x08]
	fmovdcc	%xcc,	%f18,	%f26
	lduh	[%l7 + 0x50],	%l2
	movvs	%icc,	%g6,	%l0
	fandnot1	%f30,	%f14,	%f6
	save %i2, %o0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l5,	%i4,	%o4
	fands	%f10,	%f27,	%f31
	sir	0x1A3C
	fmovsne	%xcc,	%f20,	%f30
	edge32n	%i3,	%g4,	%i1
	fsrc1	%f24,	%f4
	movrlez	%o7,	%l4,	%l1
	sdivx	%g5,	0x1FC5,	%o6
	fmovdvc	%xcc,	%f10,	%f24
	movneg	%xcc,	%o1,	%i0
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	sethi	0x1DC3,	%i7
	fmovscs	%xcc,	%f19,	%f16
	ldsh	[%l7 + 0x2C],	%o3
	nop
	set	0x70, %i1
	stx	%i5,	[%l7 + %i1]
	mulx	%i6,	0x1399,	%o5
	movcc	%icc,	%g1,	%l6
	edge8n	%l2,	%g6,	%l0
	subcc	%g3,	%i2,	%l3
	st	%f21,	[%l7 + 0x60]
	array32	%l5,	%i4,	%o4
	ldsw	[%l7 + 0x20],	%i3
	std	%f12,	[%l7 + 0x60]
	subc	%g4,	%i1,	%o0
	fabsd	%f16,	%f0
	ld	[%l7 + 0x40],	%f8
	edge16l	%o7,	%l4,	%l1
	fmovs	%f30,	%f1
	movrgez	%o6,	%o1,	%i0
	xor	%g7,	%g5,	%g2
	srax	%i7,	%o2,	%o3
	addcc	%i6,	%i5,	%o5
	nop
	set	0x30, %i4
	stx	%g1,	[%l7 + %i4]
	movneg	%icc,	%l6,	%g6
	st	%f26,	[%l7 + 0x6C]
	fpackfix	%f20,	%f7
	addccc	%l0,	0x0A6E,	%g3
	mulx	%l2,	0x084B,	%l3
	mulscc	%l5,	0x1F2C,	%i2
	mulscc	%o4,	0x0A46,	%i4
	mova	%icc,	%g4,	%i1
	edge8l	%i3,	%o0,	%o7
	fpadd32	%f8,	%f22,	%f14
	udivcc	%l1,	0x0BA6,	%o6
	movl	%xcc,	%l4,	%i0
	movvs	%icc,	%o1,	%g5
	fmovrsgez	%g2,	%f26,	%f17
	udiv	%g7,	0x0739,	%o2
	movleu	%icc,	%i7,	%i6
	sra	%i5,	0x19,	%o5
	umulcc	%g1,	%o3,	%l6
	movrlez	%g6,	0x0E1,	%l0
	addcc	%g3,	%l2,	%l5
	fabss	%f9,	%f22
	std	%f12,	[%l7 + 0x50]
	ldsh	[%l7 + 0x56],	%i2
	edge16n	%l3,	%o4,	%g4
	xor	%i4,	0x0464,	%i3
	sll	%i1,	%o7,	%l1
	movl	%icc,	%o6,	%o0
	edge32l	%l4,	%o1,	%g5
	fmovdneg	%xcc,	%f21,	%f30
	movge	%icc,	%i0,	%g2
	srax	%o2,	%g7,	%i7
	alignaddr	%i5,	%o5,	%i6
	orncc	%g1,	0x1FDB,	%l6
	ldx	[%l7 + 0x60],	%g6
	fmovsvc	%icc,	%f24,	%f29
	mulscc	%l0,	0x0B18,	%g3
	edge32l	%o3,	%l5,	%l2
	fmovdn	%xcc,	%f7,	%f29
	edge8ln	%i2,	%o4,	%g4
	ldx	[%l7 + 0x78],	%l3
	array32	%i4,	%i1,	%o7
	movvc	%icc,	%i3,	%l1
	sir	0x0BB3
	siam	0x6
	fpadd16	%f2,	%f26,	%f12
	movcc	%xcc,	%o6,	%o0
	fxors	%f0,	%f10,	%f24
	fandnot1	%f8,	%f0,	%f30
	sub	%l4,	0x067D,	%o1
	sdivx	%i0,	0x11EA,	%g5
	udivcc	%g2,	0x1F24,	%o2
	umul	%g7,	%i5,	%o5
	orncc	%i7,	%i6,	%l6
	edge32n	%g1,	%g6,	%l0
	movrne	%g3,	0x16C,	%l5
	stb	%l2,	[%l7 + 0x62]
	movneg	%icc,	%o3,	%o4
	sdivcc	%g4,	0x1293,	%l3
	fcmple32	%f14,	%f16,	%i2
	sth	%i1,	[%l7 + 0x22]
	movvs	%xcc,	%o7,	%i3
	edge16l	%i4,	%o6,	%l1
	restore %o0, %l4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g5,	0x01B,	%o1
	movcs	%icc,	%o2,	%g7
	move	%xcc,	%i5,	%g2
	mova	%icc,	%o5,	%i7
	fpsub16s	%f19,	%f13,	%f14
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	st	%f12,	[%l7 + 0x60]
	array16	%g1,	%g6,	%g3
	movrlez	%l5,	0x050,	%l0
	lduw	[%l7 + 0x10],	%l2
	movgu	%icc,	%o4,	%g4
	fzero	%f18
	udivcc	%o3,	0x11D5,	%i2
	mulscc	%l3,	0x0F6A,	%i1
	restore %o7, 0x071C, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i4,	0x1A95,	%o6
	movge	%icc,	%l1,	%l4
	ldd	[%l7 + 0x18],	%f2
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	udivcc	%g5,	0x12C7,	%o1
	movn	%icc,	%o2,	%g7
	fandnot2	%f10,	%f18,	%f10
	pdist	%f6,	%f4,	%f16
	addccc	%i5,	0x0EE4,	%g2
	movneg	%xcc,	%i7,	%o5
	std	%f10,	[%l7 + 0x58]
	xnor	%i6,	%l6,	%g1
	mulscc	%g6,	%g3,	%l0
	move	%icc,	%l5,	%l2
	fand	%f20,	%f24,	%f14
	fmul8x16al	%f24,	%f1,	%f6
	fmovrdlz	%o4,	%f2,	%f20
	sra	%o3,	0x07,	%i2
	addcc	%g4,	%i1,	%l3
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%o6
	fmovsneg	%xcc,	%f26,	%f29
	movcs	%xcc,	%i3,	%i4
	and	%o6,	%l1,	%o0
	ldsh	[%l7 + 0x3C],	%l4
	mova	%icc,	%g5,	%o1
	stx	%o2,	[%l7 + 0x18]
	xnorcc	%g7,	0x1BA3,	%i0
	orcc	%i5,	0x1ACB,	%g2
	st	%f7,	[%l7 + 0x0C]
	addccc	%o5,	0x1FA5,	%i7
	sra	%l6,	%i6,	%g1
	movrgez	%g3,	0x2A9,	%g6
	sub	%l0,	0x113A,	%l5
	move	%xcc,	%o4,	%l2
	smulcc	%o3,	%i2,	%g4
	move	%xcc,	%l3,	%o7
	stx	%i1,	[%l7 + 0x10]
	andn	%i3,	%i4,	%o6
	fpsub32s	%f23,	%f27,	%f8
	fmovrse	%l1,	%f3,	%f14
	addc	%l4,	%o0,	%o1
	fmovrde	%o2,	%f4,	%f14
	movl	%xcc,	%g7,	%i0
	subcc	%i5,	0x062C,	%g5
	fmovsne	%icc,	%f29,	%f23
	fmovsneg	%xcc,	%f13,	%f4
	edge16ln	%o5,	%i7,	%g2
	popc	0x1FD4,	%i6
	fmovscs	%icc,	%f2,	%f25
	array8	%l6,	%g1,	%g6
	sir	0x01B7
	andncc	%g3,	%l5,	%o4
	mulx	%l2,	%o3,	%i2
	movrgz	%g4,	0x208,	%l3
	xnor	%o7,	%l0,	%i3
	sllx	%i4,	0x1C,	%o6
	st	%f8,	[%l7 + 0x38]
	sll	%l1,	0x02,	%l4
	alignaddr	%o0,	%o1,	%o2
	fmul8x16al	%f30,	%f6,	%f0
	lduw	[%l7 + 0x1C],	%g7
	xnorcc	%i1,	%i5,	%i0
	srax	%g5,	%i7,	%o5
	fmovdl	%icc,	%f3,	%f14
	add	%i6,	0x003B,	%g2
	fmovrsgz	%l6,	%f0,	%f27
	fnot2	%f30,	%f14
	movrlz	%g6,	%g3,	%g1
	xorcc	%l5,	0x089A,	%l2
	orncc	%o3,	%o4,	%g4
	fpack16	%f2,	%f27
	sdivcc	%i2,	0x07B3,	%o7
	xnorcc	%l0,	%l3,	%i4
	movne	%icc,	%o6,	%i3
	xorcc	%l4,	%o0,	%l1
	movle	%icc,	%o2,	%o1
	movrgz	%i1,	0x054,	%g7
	fcmpne32	%f6,	%f12,	%i5
	edge8l	%i0,	%g5,	%i7
	xnorcc	%i6,	%g2,	%o5
	save %g6, %l6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g3,	%l5,	%o3
	edge16ln	%o4,	%l2,	%i2
	array8	%g4,	%l0,	%l3
	fnors	%f28,	%f13,	%f19
	edge16	%o7,	%i4,	%i3
	fmovrdlz	%o6,	%f30,	%f24
	lduw	[%l7 + 0x2C],	%l4
	st	%f18,	[%l7 + 0x30]
	orn	%l1,	0x062B,	%o0
	move	%xcc,	%o2,	%i1
	save %g7, %i5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x70],	%o1
	fxors	%f28,	%f6,	%f4
	movrne	%g5,	0x19A,	%i6
	andn	%g2,	0x0C7B,	%o5
	array32	%g6,	%i7,	%g1
	edge8	%l6,	%l5,	%g3
	alignaddrl	%o3,	%l2,	%o4
	edge8ln	%g4,	%i2,	%l0
	fand	%f26,	%f6,	%f12
	std	%f20,	[%l7 + 0x30]
	edge16l	%l3,	%i4,	%o7
	edge8l	%i3,	%o6,	%l1
	fxnor	%f16,	%f16,	%f4
	mova	%xcc,	%o0,	%l4
	popc	0x1F6A,	%i1
	bshuffle	%f30,	%f26,	%f0
	edge32ln	%o2,	%g7,	%i5
	ldx	[%l7 + 0x50],	%i0
	ldsb	[%l7 + 0x13],	%o1
	xnorcc	%i6,	0x1CB8,	%g2
	fmovdge	%xcc,	%f23,	%f20
	edge16ln	%o5,	%g5,	%i7
	orn	%g6,	0x05C1,	%g1
	orcc	%l5,	%g3,	%l6
	ldsb	[%l7 + 0x0D],	%o3
	fabsd	%f2,	%f18
	mulx	%o4,	%g4,	%l2
	umul	%i2,	0x0DB2,	%l3
	subc	%i4,	0x1F67,	%o7
	move	%icc,	%l0,	%o6
	smulcc	%l1,	0x0146,	%o0
	lduh	[%l7 + 0x5C],	%l4
	fmovdcs	%xcc,	%f13,	%f23
	umulcc	%i3,	%i1,	%o2
	orncc	%i5,	%g7,	%o1
	umul	%i6,	%i0,	%o5
	sdivx	%g5,	0x1456,	%i7
	sethi	0x032F,	%g2
	ldub	[%l7 + 0x3A],	%g1
	fpadd16	%f16,	%f26,	%f10
	nop
	set	0x4C, %l2
	stw	%l5,	[%l7 + %l2]
	movre	%g3,	%l6,	%g6
	movl	%icc,	%o4,	%o3
	fcmpes	%fcc0,	%f31,	%f13
	xorcc	%l2,	%i2,	%l3
	subccc	%g4,	0x0447,	%o7
	fpsub16s	%f31,	%f28,	%f19
	movn	%icc,	%i4,	%o6
	edge16n	%l1,	%o0,	%l4
	fmovsg	%xcc,	%f29,	%f0
	sdivcc	%i3,	0x1066,	%i1
	fone	%f14
	smul	%o2,	0x0E3A,	%l0
	fmul8x16au	%f26,	%f24,	%f16
	fmovsn	%xcc,	%f2,	%f4
	sth	%i5,	[%l7 + 0x60]
	std	%f22,	[%l7 + 0x58]
	ldd	[%l7 + 0x70],	%f14
	umul	%o1,	0x149C,	%g7
	movvs	%xcc,	%i0,	%i6
	st	%f14,	[%l7 + 0x3C]
	movne	%xcc,	%o5,	%g5
	st	%f0,	[%l7 + 0x24]
	fones	%f28
	stw	%i7,	[%l7 + 0x60]
	fmul8sux16	%f14,	%f6,	%f12
	ldub	[%l7 + 0x79],	%g1
	fabss	%f4,	%f8
	popc	0x1011,	%l5
	fmovdne	%icc,	%f21,	%f29
	edge16ln	%g3,	%l6,	%g2
	umul	%o4,	0x19AF,	%g6
	lduh	[%l7 + 0x0C],	%o3
	sub	%l2,	%i2,	%g4
	nop
	set	0x15, %l6
	stb	%l3,	[%l7 + %l6]
	orcc	%i4,	%o6,	%l1
	fxors	%f23,	%f9,	%f20
	orncc	%o7,	0x1FF4,	%l4
	srlx	%i3,	%o0,	%i1
	movrgz	%o2,	%i5,	%o1
	andcc	%l0,	%g7,	%i0
	fcmple16	%f6,	%f28,	%i6
	fmovsvs	%xcc,	%f14,	%f6
	smul	%o5,	%g5,	%i7
	fmul8x16	%f28,	%f6,	%f30
	movvs	%icc,	%l5,	%g3
	fcmpgt16	%f14,	%f24,	%l6
	smul	%g2,	%o4,	%g1
	orn	%o3,	0x1697,	%g6
	sub	%l2,	0x10E0,	%i2
	orcc	%g4,	0x1BCE,	%l3
	add	%o6,	0x1E58,	%l1
	edge32ln	%i4,	%o7,	%i3
	fmul8x16	%f26,	%f12,	%f8
	srl	%o0,	%i1,	%l4
	movrgez	%i5,	0x038,	%o1
	movpos	%icc,	%l0,	%g7
	ldsw	[%l7 + 0x3C],	%o2
	lduh	[%l7 + 0x62],	%i6
	fnors	%f27,	%f26,	%f11
	movre	%i0,	%g5,	%i7
	srax	%o5,	0x1F,	%l5
	sllx	%l6,	%g2,	%o4
	edge32ln	%g1,	%o3,	%g6
	movpos	%icc,	%g3,	%l2
	movvc	%xcc,	%i2,	%l3
	fnor	%f16,	%f28,	%f12
	movn	%xcc,	%g4,	%l1
	sra	%o6,	%i4,	%o7
	edge8l	%o0,	%i3,	%l4
	andcc	%i5,	0x14E6,	%o1
	edge16l	%l0,	%g7,	%i1
	edge32ln	%o2,	%i0,	%g5
	array8	%i7,	%i6,	%o5
	ldsh	[%l7 + 0x48],	%l5
	fmovsneg	%icc,	%f6,	%f10
	umul	%g2,	%o4,	%l6
	xor	%o3,	%g6,	%g3
	movvc	%xcc,	%g1,	%l2
	xor	%l3,	0x1A79,	%i2
	movgu	%icc,	%l1,	%g4
	and	%i4,	0x0B8D,	%o7
	fabss	%f6,	%f6
	fmul8ulx16	%f6,	%f24,	%f0
	fmovrsgz	%o6,	%f21,	%f15
	edge32	%i3,	%l4,	%o0
	xor	%o1,	0x0CE3,	%l0
	sub	%i5,	0x027B,	%g7
	addcc	%o2,	0x0E50,	%i1
	st	%f2,	[%l7 + 0x5C]
	fabss	%f11,	%f18
	udiv	%g5,	0x1641,	%i7
	movcc	%icc,	%i0,	%i6
	and	%o5,	%l5,	%g2
	edge32n	%o4,	%l6,	%o3
	sir	0x1DE9
	fmovsg	%xcc,	%f6,	%f29
	fornot2s	%f5,	%f18,	%f28
	edge16	%g6,	%g3,	%l2
	movcc	%icc,	%g1,	%l3
	fmovsle	%xcc,	%f10,	%f4
	mova	%xcc,	%i2,	%g4
	nop
	set	0x38, %o7
	sth	%l1,	[%l7 + %o7]
	xnor	%i4,	%o7,	%i3
	movrgz	%o6,	0x2FF,	%l4
	movl	%icc,	%o1,	%l0
	udivcc	%o0,	0x108A,	%i5
	fandnot2	%f20,	%f16,	%f24
	edge16	%g7,	%o2,	%g5
	alignaddrl	%i7,	%i0,	%i1
	xorcc	%i6,	0x0CC7,	%l5
	edge32	%o5,	%o4,	%g2
	fpackfix	%f16,	%f10
	alignaddr	%l6,	%g6,	%o3
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%l2
	movrlez	%g1,	0x298,	%l3
	fmovrslz	%i2,	%f8,	%f10
	edge8	%g3,	%l1,	%g4
	subcc	%i4,	%i3,	%o6
	move	%xcc,	%l4,	%o1
	movvs	%icc,	%l0,	%o0
	xnorcc	%o7,	%g7,	%o2
	sdiv	%g5,	0x11C3,	%i7
	sethi	0x1437,	%i0
	umulcc	%i5,	0x0F85,	%i1
	ld	[%l7 + 0x4C],	%f0
	edge16	%i6,	%o5,	%l5
	fpmerge	%f13,	%f31,	%f0
	sub	%g2,	%o4,	%g6
	std	%f16,	[%l7 + 0x78]
	ld	[%l7 + 0x7C],	%f22
	fmovsne	%xcc,	%f10,	%f2
	add	%o3,	0x1843,	%l6
	fxors	%f5,	%f2,	%f0
	edge32	%g1,	%l3,	%i2
	std	%f12,	[%l7 + 0x10]
	mova	%xcc,	%g3,	%l2
	mova	%xcc,	%l1,	%g4
	orn	%i3,	%i4,	%l4
	edge8ln	%o6,	%o1,	%l0
	smul	%o7,	%o0,	%o2
	nop
	set	0x70, %l5
	std	%f0,	[%l7 + %l5]
	sdiv	%g7,	0x11DA,	%g5
	ldd	[%l7 + 0x10],	%i0
	movgu	%icc,	%i5,	%i7
	mulscc	%i1,	0x1230,	%o5
	move	%xcc,	%i6,	%g2
	nop
	set	0x67, %g5
	ldsb	[%l7 + %g5],	%l5
	udivx	%g6,	0x0425,	%o4
	fpack16	%f26,	%f1
	fexpand	%f19,	%f24
	umul	%l6,	0x1D12,	%g1
	movvc	%xcc,	%o3,	%l3
	fnot2	%f20,	%f0
	faligndata	%f2,	%f24,	%f26
	sllx	%i2,	0x1D,	%g3
	smul	%l1,	%g4,	%i3
	std	%f12,	[%l7 + 0x48]
	movvc	%xcc,	%i4,	%l4
	fmovrdlz	%l2,	%f20,	%f28
	fmovsge	%xcc,	%f15,	%f14
	andncc	%o1,	%o6,	%l0
	array8	%o7,	%o2,	%o0
	bshuffle	%f0,	%f10,	%f12
	fpadd32	%f16,	%f16,	%f6
	fpadd32	%f30,	%f4,	%f30
	sra	%g5,	%g7,	%i5
	addcc	%i0,	%i7,	%i1
	movre	%o5,	%g2,	%l5
	fmovdcs	%xcc,	%f14,	%f23
	fones	%f5
	udivcc	%i6,	0x1D9E,	%g6
	stw	%o4,	[%l7 + 0x6C]
	lduh	[%l7 + 0x22],	%l6
	andncc	%o3,	%g1,	%i2
	fmovsvs	%xcc,	%f22,	%f15
	movn	%icc,	%g3,	%l3
	movn	%icc,	%g4,	%l1
	lduw	[%l7 + 0x7C],	%i3
	movpos	%icc,	%i4,	%l4
	array8	%o1,	%o6,	%l0
	movge	%icc,	%o7,	%o2
	umul	%l2,	0x1432,	%o0
	move	%xcc,	%g5,	%i5
	move	%icc,	%g7,	%i0
	ldd	[%l7 + 0x58],	%f8
	edge8ln	%i7,	%o5,	%g2
	fmovsvc	%xcc,	%f16,	%f18
	movge	%icc,	%l5,	%i1
	edge16ln	%g6,	%o4,	%l6
	ldsh	[%l7 + 0x72],	%o3
	st	%f16,	[%l7 + 0x68]
	movcs	%icc,	%g1,	%i6
	smul	%i2,	%l3,	%g3
	sdiv	%l1,	0x074A,	%g4
	edge8l	%i4,	%i3,	%l4
	movcc	%xcc,	%o1,	%l0
	fcmpne32	%f10,	%f2,	%o7
	smulcc	%o2,	0x035B,	%l2
	movpos	%icc,	%o6,	%g5
	edge8	%o0,	%g7,	%i5
	smulcc	%i0,	0x13CE,	%o5
	subc	%i7,	%l5,	%i1
	movre	%g6,	%g2,	%o4
	popc	%l6,	%o3
	fandnot2	%f18,	%f24,	%f12
	movleu	%xcc,	%g1,	%i6
	orn	%i2,	%l3,	%l1
	lduh	[%l7 + 0x38],	%g3
	sdivcc	%g4,	0x071B,	%i4
	fmovda	%xcc,	%f17,	%f23
	addcc	%i3,	%l4,	%l0
	fand	%f20,	%f10,	%f10
	movvc	%icc,	%o1,	%o7
	restore %l2, 0x02D7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	%o0,	%g7
	edge16ln	%g5,	%i0,	%i5
	xnor	%o5,	0x0F17,	%l5
	movrne	%i1,	0x34E,	%i7
	edge8	%g6,	%g2,	%o4
	fcmpgt32	%f0,	%f14,	%l6
	andn	%o3,	%g1,	%i2
	movvc	%xcc,	%i6,	%l1
	or	%l3,	0x0EC5,	%g4
	sllx	%g3,	%i4,	%l4
	edge32n	%l0,	%o1,	%i3
	fmul8sux16	%f8,	%f16,	%f14
	fmovdn	%icc,	%f31,	%f7
	subccc	%o7,	0x1B46,	%l2
	edge16ln	%o6,	%o2,	%o0
	stw	%g5,	[%l7 + 0x3C]
	umul	%g7,	%i5,	%o5
	fcmpne32	%f30,	%f30,	%l5
	sth	%i1,	[%l7 + 0x0A]
	sra	%i0,	%i7,	%g2
	array32	%o4,	%l6,	%o3
	or	%g1,	0x0CF6,	%g6
	fmovsvs	%icc,	%f26,	%f2
	xor	%i2,	0x1AF0,	%i6
	edge16n	%l3,	%l1,	%g3
	ldsh	[%l7 + 0x30],	%i4
	movvc	%icc,	%l4,	%l0
	orncc	%g4,	0x1752,	%i3
	fornot1s	%f21,	%f30,	%f3
	ldd	[%l7 + 0x78],	%f10
	movl	%xcc,	%o7,	%l2
	sdivcc	%o1,	0x00AB,	%o2
	movcc	%icc,	%o0,	%o6
	move	%xcc,	%g5,	%i5
	add	%o5,	%l5,	%g7
	ldsw	[%l7 + 0x2C],	%i0
	save %i7, 0x099D, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o4,	%g2,	%l6
	fnot2s	%f12,	%f30
	sdiv	%o3,	0x0522,	%g6
	movcc	%icc,	%i2,	%g1
	subc	%l3,	%l1,	%i6
	ldsw	[%l7 + 0x5C],	%i4
	movge	%xcc,	%g3,	%l0
	array32	%l4,	%i3,	%g4
	sth	%o7,	[%l7 + 0x0C]
	edge8n	%o1,	%l2,	%o0
	ldd	[%l7 + 0x60],	%f28
	edge16	%o2,	%o6,	%g5
	addc	%i5,	%o5,	%l5
	xorcc	%g7,	0x1F74,	%i7
	movle	%xcc,	%i1,	%o4
	sdivx	%i0,	0x1F25,	%g2
	xnorcc	%l6,	0x0CB1,	%g6
	faligndata	%f12,	%f2,	%f20
	fmul8x16	%f9,	%f2,	%f28
	edge16l	%i2,	%o3,	%l3
	udiv	%l1,	0x0B68,	%i6
	ldd	[%l7 + 0x38],	%g0
	edge8	%i4,	%l0,	%l4
	ldsb	[%l7 + 0x58],	%g3
	addcc	%g4,	%o7,	%o1
	fands	%f3,	%f2,	%f0
	array8	%l2,	%o0,	%i3
	fpack32	%f30,	%f18,	%f16
	alignaddr	%o6,	%g5,	%o2
	or	%i5,	0x0EF4,	%l5
	mova	%xcc,	%g7,	%i7
	fzero	%f16
	smulcc	%i1,	%o4,	%i0
	sth	%o5,	[%l7 + 0x5C]
	sdivx	%g2,	0x1C44,	%g6
	array16	%i2,	%l6,	%l3
	subccc	%l1,	0x0A21,	%i6
	movpos	%icc,	%g1,	%o3
	sdiv	%l0,	0x15D5,	%i4
	addc	%l4,	0x10D8,	%g4
	edge8n	%g3,	%o1,	%l2
	movneg	%xcc,	%o7,	%i3
	fones	%f15
	udivcc	%o6,	0x1904,	%g5
	sdivcc	%o0,	0x1E94,	%o2
	orcc	%i5,	0x1201,	%l5
	xorcc	%g7,	0x16AB,	%i1
	edge8	%i7,	%o4,	%i0
	xor	%g2,	%o5,	%i2
	edge8	%l6,	%l3,	%l1
	smulcc	%g6,	0x0DAC,	%g1
	edge32	%o3,	%l0,	%i4
	nop
	set	0x36, %l1
	ldub	[%l7 + %l1],	%l4
	andcc	%g4,	%g3,	%o1
	sethi	0x1D06,	%l2
	fnot1	%f26,	%f16
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	movneg	%icc,	%i3,	%g5
	sth	%o6,	[%l7 + 0x76]
	edge8ln	%o2,	%o0,	%l5
	subcc	%g7,	0x17B7,	%i1
	fcmpes	%fcc3,	%f3,	%f25
	edge8	%i7,	%i5,	%i0
	fpadd32	%f30,	%f26,	%f8
	subc	%g2,	%o5,	%o4
	edge16ln	%i2,	%l6,	%l1
	addccc	%g6,	%l3,	%g1
	fpackfix	%f14,	%f28
	ldd	[%l7 + 0x10],	%o2
	edge16n	%l0,	%i4,	%g4
	array32	%g3,	%l4,	%l2
	fzero	%f22
	movn	%icc,	%o1,	%i6
	stx	%o7,	[%l7 + 0x20]
	movg	%icc,	%i3,	%o6
	xnor	%g5,	%o0,	%l5
	stx	%o2,	[%l7 + 0x40]
	nop
	set	0x56, %g2
	lduh	[%l7 + %g2],	%i1
	srlx	%g7,	%i7,	%i5
	array8	%g2,	%o5,	%o4
	sir	0x0BC3
	fxnors	%f1,	%f3,	%f17
	fone	%f8
	sra	%i0,	%l6,	%i2
	array32	%g6,	%l1,	%g1
	movn	%icc,	%l3,	%o3
	movge	%xcc,	%l0,	%i4
	movge	%icc,	%g4,	%l4
	andn	%l2,	%o1,	%g3
	subc	%i6,	%o7,	%o6
	movrgez	%i3,	0x063,	%o0
	ldub	[%l7 + 0x56],	%l5
	fmovsg	%xcc,	%f20,	%f26
	edge8ln	%g5,	%i1,	%o2
	xor	%g7,	0x0B7E,	%i5
	edge16n	%g2,	%o5,	%o4
	edge16n	%i0,	%i7,	%i2
	edge8n	%g6,	%l1,	%g1
	edge8l	%l3,	%l6,	%o3
	movn	%xcc,	%l0,	%i4
	fcmps	%fcc0,	%f19,	%f4
	fcmpgt16	%f22,	%f4,	%l4
	srlx	%l2,	%g4,	%o1
	movrlez	%i6,	0x1F0,	%o7
	edge32	%g3,	%i3,	%o6
	movn	%xcc,	%o0,	%l5
	fmovrsgez	%g5,	%f18,	%f23
	fsrc1	%f18,	%f6
	restore %i1, %o2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f13,	%f13,	%f22
	stb	%g2,	[%l7 + 0x6F]
	sra	%o5,	0x0F,	%i5
	movn	%icc,	%i0,	%i7
	addcc	%o4,	0x01D0,	%g6
	add	%l1,	%i2,	%g1
	faligndata	%f14,	%f22,	%f12
	movrgz	%l3,	0x0A9,	%o3
	alignaddrl	%l0,	%i4,	%l4
	fpsub16s	%f2,	%f5,	%f2
	sethi	0x034F,	%l2
	movrlez	%l6,	0x115,	%g4
	fmovdneg	%xcc,	%f26,	%f17
	move	%xcc,	%i6,	%o1
	fmul8x16al	%f6,	%f25,	%f22
	or	%o7,	%i3,	%g3
	movrlz	%o6,	0x29F,	%o0
	popc	%g5,	%l5
	edge8l	%i1,	%g7,	%o2
	xor	%o5,	%i5,	%i0
	move	%xcc,	%i7,	%o4
	fmuld8sux16	%f13,	%f20,	%f16
	fmovsvs	%icc,	%f2,	%f4
	nop
	set	0x4C, %g1
	ldsh	[%l7 + %g1],	%g6
	srl	%l1,	0x14,	%i2
	udiv	%g2,	0x05B3,	%l3
	andcc	%o3,	0x0B78,	%l0
	stb	%i4,	[%l7 + 0x22]
	ldsh	[%l7 + 0x40],	%l4
	ldd	[%l7 + 0x38],	%l2
	umul	%l6,	%g1,	%i6
	ldsh	[%l7 + 0x66],	%g4
	movre	%o7,	%i3,	%g3
	fmovrdgz	%o6,	%f0,	%f10
	addc	%o1,	%o0,	%l5
	xnorcc	%i1,	0x0FCE,	%g5
	subc	%o2,	0x116A,	%g7
	srlx	%i5,	%i0,	%o5
	fabsd	%f8,	%f12
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f14
	array16	%o4,	%i7,	%g6
	ld	[%l7 + 0x64],	%f5
	udivx	%l1,	0x0167,	%i2
	edge32n	%g2,	%o3,	%l0
	movrgez	%i4,	%l4,	%l2
	ldsb	[%l7 + 0x67],	%l3
	edge32	%l6,	%g1,	%g4
	mulscc	%i6,	%i3,	%o7
	orncc	%g3,	%o6,	%o1
	movgu	%xcc,	%o0,	%l5
	srl	%g5,	0x15,	%i1
	st	%f24,	[%l7 + 0x14]
	array32	%g7,	%i5,	%o2
	movrlz	%o5,	%i0,	%o4
	fcmpgt16	%f20,	%f24,	%i7
	andncc	%l1,	%i2,	%g2
	array8	%g6,	%l0,	%o3
	fmovsgu	%icc,	%f23,	%f3
	subccc	%i4,	0x0BC5,	%l4
	xor	%l3,	0x153E,	%l6
	ldx	[%l7 + 0x38],	%l2
	fones	%f13
	fandnot1	%f22,	%f4,	%f4
	sdiv	%g4,	0x117B,	%i6
	movrlz	%g1,	0x354,	%o7
	fpadd32s	%f15,	%f24,	%f2
	movcs	%xcc,	%g3,	%i3
	fmovrde	%o1,	%f16,	%f22
	sllx	%o0,	0x14,	%o6
	srlx	%g5,	%i1,	%g7
	subcc	%l5,	0x08DB,	%o2
	sdivx	%i5,	0x1833,	%o5
	lduw	[%l7 + 0x6C],	%o4
	st	%f21,	[%l7 + 0x5C]
	ldx	[%l7 + 0x48],	%i7
	srlx	%i0,	%i2,	%g2
	movpos	%icc,	%l1,	%g6
	edge16ln	%l0,	%i4,	%o3
	ldub	[%l7 + 0x66],	%l4
	movrlez	%l3,	%l6,	%l2
	edge32l	%i6,	%g4,	%g1
	sth	%g3,	[%l7 + 0x2C]
	mulx	%o7,	%o1,	%o0
	fzeros	%f21
	stb	%i3,	[%l7 + 0x37]
	fone	%f22
	fornot1	%f24,	%f14,	%f26
	edge8n	%g5,	%o6,	%i1
	alignaddrl	%l5,	%o2,	%i5
	fmovsa	%icc,	%f24,	%f5
	movneg	%xcc,	%o5,	%g7
	movg	%icc,	%o4,	%i7
	fabsd	%f10,	%f16
	fnegd	%f14,	%f4
	ldsh	[%l7 + 0x16],	%i0
	movrgez	%g2,	0x036,	%i2
	fnegs	%f2,	%f11
	fnot1	%f28,	%f14
	fmovdl	%xcc,	%f23,	%f17
	array8	%l1,	%l0,	%i4
	subccc	%o3,	%l4,	%g6
	fmovsge	%xcc,	%f17,	%f13
	fmovsne	%xcc,	%f26,	%f10
	andcc	%l3,	0x199C,	%l2
	movle	%xcc,	%i6,	%g4
	andncc	%g1,	%g3,	%l6
	sdivcc	%o1,	0x0B72,	%o7
	orncc	%i3,	%o0,	%g5
	edge8n	%i1,	%o6,	%l5
	movrlz	%o2,	%o5,	%i5
	alignaddr	%g7,	%i7,	%i0
	subccc	%g2,	0x09F9,	%o4
	movl	%xcc,	%i2,	%l1
	lduh	[%l7 + 0x2C],	%l0
	array16	%i4,	%l4,	%o3
	std	%f14,	[%l7 + 0x70]
	movrlez	%g6,	%l2,	%i6
	ldsw	[%l7 + 0x08],	%l3
	fmovdl	%xcc,	%f26,	%f21
	save %g1, 0x1A05, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	fandnot1s	%f8,	%f8,	%f17
	sra	%g3,	0x14,	%i3
	orncc	%o0,	0x0B5C,	%o7
	xnorcc	%i1,	0x1E2A,	%o6
	udiv	%g5,	0x11A7,	%l5
	orncc	%o2,	%i5,	%g7
	movl	%icc,	%o5,	%i7
	sdivx	%g2,	0x0B32,	%o4
	fzero	%f12
	edge8	%i0,	%l1,	%l0
	movg	%xcc,	%i4,	%i2
	addccc	%o3,	%l4,	%l2
	movcc	%icc,	%g6,	%l3
	save %g1, 0x1F8B, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i6,	0x01EE,	%o1
	nop
	set	0x1C, %i7
	sth	%g3,	[%l7 + %i7]
	edge8	%l6,	%i3,	%o0
	andncc	%i1,	%o7,	%o6
	addccc	%g5,	%o2,	%i5
	sth	%g7,	[%l7 + 0x6E]
	move	%icc,	%l5,	%i7
	mulx	%o5,	0x10DC,	%o4
	ldsh	[%l7 + 0x60],	%g2
	sub	%l1,	0x0C8F,	%l0
	array8	%i0,	%i2,	%o3
	movvs	%icc,	%l4,	%l2
	ldsw	[%l7 + 0x3C],	%g6
	fcmpgt32	%f10,	%f2,	%i4
	fcmpeq32	%f12,	%f26,	%g1
	movg	%xcc,	%g4,	%i6
	fcmpgt16	%f24,	%f18,	%l3
	movrlz	%g3,	0x06F,	%l6
	andncc	%o1,	%i3,	%i1
	edge8	%o7,	%o0,	%g5
	subcc	%o6,	%o2,	%i5
	fmovdcc	%icc,	%f12,	%f20
	fmovsn	%xcc,	%f9,	%f0
	ldsh	[%l7 + 0x6C],	%g7
	bshuffle	%f14,	%f16,	%f20
	edge16	%i7,	%l5,	%o4
	edge16n	%g2,	%l1,	%o5
	fmul8sux16	%f16,	%f16,	%f2
	fmovdge	%icc,	%f28,	%f1
	ldsb	[%l7 + 0x38],	%i0
	fpsub32	%f22,	%f10,	%f30
	edge16	%l0,	%i2,	%l4
	restore %l2, 0x1CD5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i4, %g1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g4,	0x02CF,	%i6
	orcc	%g3,	0x0F04,	%l3
	orcc	%l6,	0x1358,	%o1
	fabsd	%f18,	%f28
	nop
	set	0x08, %o2
	std	%f30,	[%l7 + %o2]
	edge16l	%i1,	%o7,	%i3
	andn	%o0,	%o6,	%g5
	move	%icc,	%o2,	%g7
	movvc	%icc,	%i7,	%l5
	alignaddrl	%i5,	%g2,	%l1
	edge32	%o4,	%i0,	%o5
	st	%f31,	[%l7 + 0x60]
	lduw	[%l7 + 0x20],	%i2
	movge	%xcc,	%l4,	%l0
	fornot2s	%f6,	%f10,	%f30
	umulcc	%o3,	0x0982,	%l2
	movleu	%xcc,	%i4,	%g6
	alignaddrl	%g1,	%g4,	%g3
	fmovrse	%l3,	%f7,	%f10
	movvs	%icc,	%i6,	%o1
	subc	%i1,	%l6,	%i3
	ldx	[%l7 + 0x78],	%o0
	fcmpgt16	%f12,	%f18,	%o7
	edge8	%g5,	%o2,	%o6
	lduh	[%l7 + 0x30],	%g7
	alignaddr	%i7,	%i5,	%l5
	fmovrdlz	%g2,	%f20,	%f6
	st	%f2,	[%l7 + 0x24]
	stb	%o4,	[%l7 + 0x7D]
	fornot2	%f22,	%f12,	%f8
	movle	%xcc,	%l1,	%o5
	edge16	%i0,	%i2,	%l4
	sllx	%o3,	%l2,	%l0
	sdiv	%i4,	0x0165,	%g1
	srlx	%g4,	0x14,	%g6
	fnegd	%f16,	%f30
	edge16ln	%l3,	%g3,	%i6
	umulcc	%i1,	%o1,	%l6
	stw	%o0,	[%l7 + 0x78]
	andncc	%o7,	%g5,	%i3
	sll	%o2,	0x13,	%g7
	fmovde	%icc,	%f9,	%f1
	ldub	[%l7 + 0x7D],	%i7
	save %i5, %l5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f26,	[%l7 + 0x20]
	edge32ln	%o6,	%o4,	%l1
	subccc	%o5,	0x1730,	%i2
	ldd	[%l7 + 0x18],	%l4
	fmovdgu	%icc,	%f0,	%f7
	edge8	%i0,	%o3,	%l2
	movpos	%xcc,	%i4,	%g1
	edge8n	%g4,	%g6,	%l0
	fcmpd	%fcc2,	%f12,	%f22
	ldd	[%l7 + 0x08],	%l2
	mulscc	%g3,	0x00BB,	%i6
	movg	%xcc,	%i1,	%o1
	movcc	%icc,	%l6,	%o0
	edge16	%o7,	%i3,	%o2
	fpmerge	%f7,	%f13,	%f0
	mulscc	%g7,	%g5,	%i5
	xor	%l5,	0x19F6,	%i7
	alignaddrl	%o6,	%o4,	%g2
	andncc	%l1,	%i2,	%l4
	orncc	%o5,	%o3,	%l2
	xorcc	%i4,	0x0F7E,	%i0
	udivx	%g1,	0x1EAD,	%g4
	movrlez	%g6,	%l3,	%g3
	mulx	%i6,	0x107C,	%i1
	subccc	%o1,	%l0,	%o0
	ldsw	[%l7 + 0x50],	%l6
	sub	%i3,	0x0212,	%o2
	edge16l	%g7,	%g5,	%i5
	fmovdvs	%xcc,	%f18,	%f3
	ldsw	[%l7 + 0x7C],	%l5
	sdivx	%i7,	0x19F0,	%o7
	fmovda	%icc,	%f5,	%f10
	andcc	%o4,	0x066D,	%o6
	movrne	%g2,	%i2,	%l1
	fcmpeq32	%f20,	%f14,	%l4
	movleu	%xcc,	%o3,	%l2
	array16	%o5,	%i4,	%i0
	sra	%g4,	0x11,	%g6
	stb	%l3,	[%l7 + 0x5B]
	edge8ln	%g1,	%i6,	%i1
	ldsb	[%l7 + 0x79],	%g3
	ldd	[%l7 + 0x18],	%l0
	stw	%o0,	[%l7 + 0x64]
	sllx	%l6,	%o1,	%i3
	umulcc	%g7,	%g5,	%o2
	fandnot1s	%f3,	%f31,	%f0
	orn	%i5,	%i7,	%o7
	orcc	%l5,	0x008D,	%o4
	movl	%xcc,	%o6,	%g2
	orncc	%l1,	0x00A1,	%i2
	sll	%l4,	%l2,	%o3
	fmovdg	%xcc,	%f19,	%f9
	fmovsgu	%icc,	%f11,	%f1
	movrgez	%o5,	0x21B,	%i4
	andcc	%i0,	0x1AE2,	%g6
	alignaddr	%g4,	%l3,	%i6
	fmovrsne	%i1,	%f15,	%f4
	sth	%g1,	[%l7 + 0x48]
	sllx	%g3,	%o0,	%l0
	sdivx	%l6,	0x1EB4,	%i3
	umulcc	%o1,	%g7,	%o2
	movpos	%icc,	%i5,	%i7
	fmovda	%icc,	%f25,	%f30
	popc	0x0FA4,	%o7
	subc	%g5,	%o4,	%o6
	fsrc1s	%f21,	%f9
	srl	%g2,	0x0C,	%l1
	sll	%i2,	0x02,	%l4
	fones	%f28
	ldsw	[%l7 + 0x34],	%l5
	or	%o3,	0x0937,	%l2
	popc	%i4,	%i0
	subc	%g6,	%o5,	%l3
	andncc	%i6,	%i1,	%g4
	fmovdcc	%icc,	%f2,	%f27
	sdiv	%g3,	0x1772,	%g1
	movre	%o0,	0x2EF,	%l0
	movle	%xcc,	%i3,	%o1
	ldsh	[%l7 + 0x24],	%l6
	fmovscc	%icc,	%f30,	%f12
	addc	%g7,	%i5,	%i7
	fmovdvc	%icc,	%f19,	%f18
	movvc	%icc,	%o7,	%o2
	or	%o4,	0x1EE7,	%g5
	alignaddr	%g2,	%l1,	%o6
	ldsw	[%l7 + 0x5C],	%i2
	ldub	[%l7 + 0x5D],	%l4
	edge32ln	%l5,	%o3,	%i4
	array16	%i0,	%l2,	%g6
	movvs	%icc,	%l3,	%i6
	siam	0x7
	stw	%i1,	[%l7 + 0x74]
	fornot2s	%f4,	%f1,	%f9
	popc	%o5,	%g3
	sub	%g4,	0x095F,	%o0
	edge32ln	%g1,	%i3,	%l0
	lduh	[%l7 + 0x5C],	%l6
	xnor	%o1,	0x1504,	%i5
	sth	%g7,	[%l7 + 0x3C]
	fnand	%f10,	%f6,	%f18
	fandnot2	%f24,	%f18,	%f22
	subcc	%o7,	%o2,	%i7
	movrgez	%o4,	0x3B1,	%g2
	udiv	%l1,	0x1814,	%g5
	or	%o6,	0x1887,	%i2
	orn	%l4,	0x0074,	%o3
	mulx	%i4,	%l5,	%i0
	edge32l	%g6,	%l2,	%l3
	fmovrslz	%i1,	%f14,	%f0
	sethi	0x0D0E,	%o5
	lduw	[%l7 + 0x10],	%g3
	edge32ln	%i6,	%g4,	%g1
	movpos	%icc,	%i3,	%l0
	andn	%o0,	0x00D8,	%o1
	xorcc	%i5,	0x17DA,	%l6
	srl	%o7,	0x13,	%g7
	movrgz	%i7,	%o4,	%g2
	subcc	%l1,	0x01F6,	%g5
	lduh	[%l7 + 0x12],	%o2
	sth	%o6,	[%l7 + 0x38]
	fnor	%f0,	%f6,	%f24
	ldsb	[%l7 + 0x27],	%i2
	orcc	%l4,	0x1C0C,	%i4
	edge8l	%o3,	%i0,	%l5
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	fones	%f8
	fone	%f22
	umulcc	%o5,	%g3,	%i6
	edge32l	%l2,	%g4,	%g1
	edge16n	%i3,	%o0,	%l0
	fmovrslez	%o1,	%f14,	%f17
	fsrc1	%f24,	%f2
	ldub	[%l7 + 0x56],	%l6
	movn	%xcc,	%i5,	%o7
	fsrc1s	%f1,	%f30
	udiv	%g7,	0x01EB,	%i7
	umulcc	%o4,	0x1C53,	%g2
	movge	%xcc,	%g5,	%l1
	addcc	%o2,	0x1D1A,	%i2
	fmovrsgez	%o6,	%f27,	%f12
	srax	%l4,	%o3,	%i0
	fors	%f23,	%f11,	%f5
	andcc	%l5,	%i4,	%g6
	popc	%i1,	%l3
	sll	%o5,	%i6,	%l2
	fmovdpos	%icc,	%f14,	%f7
	sdivcc	%g4,	0x0C38,	%g3
	edge32ln	%i3,	%g1,	%o0
	movge	%icc,	%l0,	%l6
	fmovdgu	%xcc,	%f29,	%f13
	sdivcc	%o1,	0x0D52,	%o7
	sdivx	%i5,	0x0140,	%i7
	and	%o4,	0x041E,	%g2
	sdivcc	%g7,	0x1B7A,	%g5
	srax	%o2,	0x15,	%i2
	siam	0x3
	stw	%o6,	[%l7 + 0x4C]
	movgu	%xcc,	%l4,	%l1
	fnegd	%f18,	%f28
	ldub	[%l7 + 0x64],	%i0
	udiv	%o3,	0x1C3F,	%i4
	movrgez	%l5,	0x29D,	%i1
	addccc	%l3,	%o5,	%i6
	stw	%g6,	[%l7 + 0x48]
	fmovsneg	%xcc,	%f27,	%f26
	stw	%l2,	[%l7 + 0x10]
	sdiv	%g3,	0x0DC2,	%g4
	ldub	[%l7 + 0x36],	%i3
	nop
	set	0x38, %o4
	std	%f16,	[%l7 + %o4]
	restore %o0, %l0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o1,	%o7
	movleu	%xcc,	%l6,	%i5
	save %i7, %o4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f13,	%f4
	fmovspos	%xcc,	%f31,	%f11
	movge	%icc,	%g2,	%o2
	sllx	%i2,	%o6,	%l4
	movg	%xcc,	%g5,	%l1
	or	%i0,	0x154D,	%o3
	movcc	%icc,	%l5,	%i4
	edge32ln	%i1,	%l3,	%o5
	add	%g6,	%i6,	%g3
	stb	%g4,	[%l7 + 0x20]
	or	%i3,	%l2,	%o0
	udivcc	%l0,	0x1390,	%g1
	edge32	%o7,	%o1,	%i5
	ldsb	[%l7 + 0x1C],	%l6
	subccc	%i7,	0x1258,	%g7
	fpsub16s	%f19,	%f17,	%f23
	addc	%g2,	0x11ED,	%o2
	ldsw	[%l7 + 0x5C],	%o4
	fmovdneg	%xcc,	%f29,	%f12
	edge32n	%o6,	%i2,	%g5
	fmovrdlz	%l1,	%f10,	%f8
	xorcc	%i0,	0x1B26,	%l4
	sethi	0x0462,	%o3
	or	%l5,	0x0E49,	%i4
	movrgz	%l3,	0x240,	%o5
	mova	%icc,	%i1,	%i6
	smul	%g6,	%g4,	%g3
	edge8	%l2,	%i3,	%l0
	fmovsgu	%xcc,	%f27,	%f15
	fandnot1	%f24,	%f10,	%f12
	movle	%icc,	%o0,	%g1
	array16	%o1,	%i5,	%l6
	subccc	%i7,	0x00E1,	%o7
	xorcc	%g2,	0x1315,	%o2
	movrgz	%o4,	%g7,	%i2
	fornot2s	%f11,	%f27,	%f0
	sll	%o6,	%l1,	%g5
	edge16n	%l4,	%o3,	%i0
	ld	[%l7 + 0x7C],	%f1
	smulcc	%l5,	0x00DE,	%i4
	stw	%l3,	[%l7 + 0x64]
	fpadd32	%f28,	%f22,	%f18
	st	%f25,	[%l7 + 0x2C]
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	fmovdleu	%icc,	%f3,	%f28
	faligndata	%f14,	%f28,	%f4
	pdist	%f30,	%f10,	%f24
	edge8ln	%g6,	%o5,	%g4
	bshuffle	%f6,	%f12,	%f28
	edge8ln	%g3,	%l2,	%l0
	fmovrslez	%i3,	%f4,	%f21
	sethi	0x1B90,	%o0
	movge	%icc,	%g1,	%o1
	ldsb	[%l7 + 0x58],	%l6
	std	%f6,	[%l7 + 0x30]
	movn	%xcc,	%i5,	%o7
	sdivcc	%i7,	0x16C0,	%o2
	fmul8x16al	%f21,	%f27,	%f24
	ldsb	[%l7 + 0x64],	%g2
	srax	%g7,	0x15,	%o4
	movrgez	%i2,	%l1,	%o6
	orcc	%g5,	%o3,	%i0
	srl	%l4,	%i4,	%l5
	edge16ln	%l3,	%i1,	%i6
	ldsh	[%l7 + 0x24],	%o5
	save %g4, 0x06B3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f25,	%f21
	srl	%l2,	0x08,	%g3
	lduw	[%l7 + 0x44],	%i3
	fmovsn	%icc,	%f22,	%f15
	lduh	[%l7 + 0x62],	%o0
	array8	%g1,	%l0,	%l6
	std	%f8,	[%l7 + 0x20]
	fcmped	%fcc3,	%f20,	%f22
	ldsw	[%l7 + 0x3C],	%i5
	sub	%o1,	0x1726,	%o7
	addcc	%o2,	%g2,	%g7
	edge16ln	%o4,	%i7,	%i2
	xorcc	%o6,	0x0869,	%g5
	udivx	%o3,	0x08A8,	%i0
	array8	%l4,	%i4,	%l1
	lduw	[%l7 + 0x0C],	%l5
	array8	%i1,	%i6,	%l3
	mova	%xcc,	%g4,	%o5
	orncc	%g6,	%l2,	%g3
	movcs	%icc,	%i3,	%g1
	ldsw	[%l7 + 0x24],	%o0
	mulx	%l0,	%l6,	%o1
	lduw	[%l7 + 0x5C],	%i5
	alignaddr	%o7,	%g2,	%o2
	mulscc	%g7,	0x1E03,	%o4
	fmovdvs	%xcc,	%f19,	%f13
	movvc	%icc,	%i2,	%i7
	fmovscs	%xcc,	%f27,	%f6
	fnegd	%f10,	%f18
	fnegs	%f31,	%f20
	xorcc	%g5,	%o3,	%i0
	movg	%xcc,	%l4,	%i4
	siam	0x2
	sethi	0x015E,	%o6
	movvs	%icc,	%l1,	%i1
	fcmpne32	%f22,	%f4,	%l5
	bshuffle	%f8,	%f0,	%f0
	fpack16	%f18,	%f26
	addccc	%i6,	0x1211,	%l3
	fsrc1	%f24,	%f16
	movg	%xcc,	%g4,	%g6
	smul	%l2,	%o5,	%i3
	nop
	set	0x70, %g7
	stx	%g3,	[%l7 + %g7]
	andcc	%o0,	0x0593,	%g1
	edge32ln	%l6,	%o1,	%i5
	fmovdleu	%xcc,	%f6,	%f27
	movvc	%xcc,	%l0,	%g2
	nop
	set	0x69, %i0
	stb	%o7,	[%l7 + %i0]
	fmovrsne	%o2,	%f16,	%f12
	alignaddr	%o4,	%i2,	%i7
	umulcc	%g7,	0x0101,	%o3
	fornot1	%f0,	%f14,	%f20
	restore %g5, %l4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i0,	%o6,	%i1
	fmuld8sux16	%f15,	%f20,	%f14
	orcc	%l1,	%i6,	%l3
	stx	%l5,	[%l7 + 0x40]
	orn	%g4,	%g6,	%l2
	sdivx	%o5,	0x1588,	%i3
	move	%icc,	%g3,	%g1
	edge16ln	%o0,	%o1,	%l6
	addccc	%i5,	%g2,	%o7
	ldsh	[%l7 + 0x24],	%l0
	movneg	%xcc,	%o4,	%o2
	addccc	%i7,	%g7,	%o3
	fcmpgt32	%f26,	%f4,	%g5
	std	%f20,	[%l7 + 0x08]
	st	%f9,	[%l7 + 0x10]
	nop
	set	0x43, %i5
	stb	%l4,	[%l7 + %i5]
	stb	%i2,	[%l7 + 0x7D]
	xor	%i0,	0x127B,	%o6
	sth	%i4,	[%l7 + 0x5C]
	subcc	%i1,	0x0A2A,	%i6
	movge	%icc,	%l3,	%l5
	save %g4, %g6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f3,	%f4,	%f7
	fnot1	%f0,	%f20
	fpadd32	%f18,	%f18,	%f26
	fzero	%f4
	mova	%icc,	%o5,	%l2
	movg	%xcc,	%g3,	%g1
	stb	%o0,	[%l7 + 0x20]
	move	%xcc,	%o1,	%l6
	movvc	%icc,	%i3,	%i5
	sir	0x04AC
	srax	%o7,	%g2,	%l0
	fmovrdgz	%o2,	%f0,	%f30
	ldsw	[%l7 + 0x2C],	%o4
	subccc	%i7,	0x1FF5,	%o3
	andcc	%g5,	0x1216,	%l4
	array32	%i2,	%g7,	%o6
	mulx	%i0,	%i1,	%i6
	andn	%i4,	0x1937,	%l5
	sth	%l3,	[%l7 + 0x20]
	ldsb	[%l7 + 0x16],	%g6
	fmovrdlz	%l1,	%f22,	%f14
	stw	%g4,	[%l7 + 0x5C]
	edge32n	%l2,	%g3,	%o5
	sra	%g1,	0x11,	%o0
	sdivcc	%l6,	0x0FB1,	%o1
	fmovs	%f26,	%f3
	fornot1s	%f23,	%f29,	%f5
	subc	%i3,	%i5,	%o7
	addccc	%g2,	0x1B40,	%l0
	movneg	%icc,	%o4,	%i7
	fmovrsne	%o2,	%f15,	%f5
	ldsb	[%l7 + 0x5B],	%g5
	fxnors	%f22,	%f14,	%f26
	movrne	%o3,	0x33A,	%l4
	array8	%g7,	%o6,	%i2
	edge8	%i0,	%i6,	%i1
	fnors	%f29,	%f15,	%f3
	save %l5, 0x1FEB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g6,	%l1
	movle	%icc,	%g4,	%l3
	addcc	%g3,	%o5,	%l2
	ldsw	[%l7 + 0x18],	%o0
	fnors	%f15,	%f29,	%f18
	fcmpgt32	%f28,	%f2,	%l6
	fpadd16s	%f26,	%f12,	%f12
	movneg	%icc,	%o1,	%i3
	bshuffle	%f2,	%f30,	%f8
	popc	0x182B,	%i5
	subcc	%g1,	%g2,	%o7
	mulx	%l0,	0x1403,	%o4
	udivcc	%i7,	0x1A6A,	%o2
	addccc	%o3,	%l4,	%g7
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	movl	%icc,	%g5,	%i6
	mulscc	%i0,	%i1,	%i4
	sdivcc	%l5,	0x06D8,	%l1
	subcc	%g6,	%g4,	%l3
	fpsub32s	%f24,	%f17,	%f30
	fmovspos	%icc,	%f1,	%f4
	movrlez	%g3,	0x00A,	%l2
	addc	%o0,	0x1E3C,	%o5
	umulcc	%o1,	%i3,	%i5
	sra	%g1,	0x11,	%l6
	movle	%icc,	%g2,	%l0
	fcmpeq32	%f8,	%f24,	%o7
	add	%o4,	%o2,	%o3
	ldx	[%l7 + 0x68],	%i7
	orncc	%g7,	%o6,	%l4
	mulscc	%g5,	0x0FC2,	%i2
	fcmps	%fcc1,	%f30,	%f16
	movl	%icc,	%i6,	%i0
	fmovdvc	%icc,	%f22,	%f28
	stw	%i1,	[%l7 + 0x34]
	ldsb	[%l7 + 0x52],	%l5
	fmovdle	%icc,	%f15,	%f14
	movcs	%xcc,	%l1,	%i4
	movre	%g6,	0x238,	%l3
	fmul8x16au	%f17,	%f4,	%f16
	fmovdg	%icc,	%f22,	%f16
	udivcc	%g4,	0x16C7,	%g3
	smulcc	%l2,	0x120F,	%o5
	movrgz	%o1,	0x3D6,	%i3
	andncc	%o0,	%g1,	%l6
	movrlez	%g2,	%i5,	%l0
	fmul8x16au	%f29,	%f12,	%f22
	fmovdg	%xcc,	%f9,	%f30
	fmovdg	%xcc,	%f16,	%f29
	movge	%icc,	%o7,	%o4
	movpos	%xcc,	%o3,	%o2
	sir	0x090B
	orncc	%i7,	%o6,	%l4
	movle	%xcc,	%g7,	%g5
	movvc	%icc,	%i6,	%i2
	alignaddrl	%i1,	%i0,	%l5
	ldub	[%l7 + 0x66],	%i4
	movvs	%xcc,	%l1,	%l3
	fmovdle	%xcc,	%f30,	%f29
	fmovdvc	%xcc,	%f14,	%f26
	movcs	%icc,	%g6,	%g4
	movrlez	%g3,	0x15D,	%o5
	edge16ln	%o1,	%i3,	%l2
	alignaddr	%o0,	%g1,	%g2
	ldsh	[%l7 + 0x6E],	%l6
	umul	%l0,	%i5,	%o7
	srax	%o3,	%o4,	%o2
	ldsh	[%l7 + 0x26],	%i7
	fmovrsgez	%l4,	%f21,	%f31
	addc	%g7,	0x0CDD,	%g5
	array16	%o6,	%i6,	%i2
	fmuld8sux16	%f24,	%f30,	%f16
	xorcc	%i1,	%l5,	%i4
	fcmple32	%f18,	%f30,	%l1
	edge32	%i0,	%g6,	%l3
	movrgez	%g3,	0x178,	%g4
	sub	%o1,	0x079C,	%i3
	sll	%l2,	0x10,	%o0
	nop
	set	0x18, %g4
	stx	%g1,	[%l7 + %g4]
	mulx	%g2,	0x18A5,	%l6
	bshuffle	%f28,	%f28,	%f22
	movle	%icc,	%o5,	%i5
	udiv	%o7,	0x12AC,	%o3
	movl	%icc,	%l0,	%o2
	andncc	%o4,	%l4,	%g7
	fnand	%f6,	%f12,	%f30
	add	%g5,	%o6,	%i7
	edge32	%i6,	%i2,	%l5
	fnot1s	%f20,	%f24
	edge32n	%i1,	%i4,	%l1
	movne	%icc,	%i0,	%l3
	edge8	%g6,	%g3,	%g4
	stb	%o1,	[%l7 + 0x13]
	ldsh	[%l7 + 0x66],	%l2
	sir	0x14C3
	ldsw	[%l7 + 0x08],	%i3
	xor	%o0,	%g1,	%l6
	st	%f10,	[%l7 + 0x4C]
	array8	%o5,	%g2,	%i5
	movcc	%icc,	%o3,	%l0
	sdiv	%o2,	0x0168,	%o7
	edge8l	%l4,	%g7,	%o4
	ldub	[%l7 + 0x53],	%o6
	movpos	%xcc,	%i7,	%i6
	srl	%i2,	0x00,	%g5
	umulcc	%l5,	%i4,	%l1
	or	%i1,	0x11C4,	%i0
	mulx	%l3,	0x1C02,	%g6
	ldd	[%l7 + 0x68],	%g4
	fmovrdgez	%o1,	%f20,	%f28
	ldsw	[%l7 + 0x60],	%g3
	fmovrsne	%l2,	%f31,	%f5
	alignaddr	%o0,	%g1,	%i3
	subccc	%l6,	%o5,	%g2
	srlx	%o3,	%l0,	%i5
	move	%xcc,	%o7,	%o2
	ldd	[%l7 + 0x40],	%f22
	fxnors	%f19,	%f30,	%f16
	edge16ln	%g7,	%o4,	%o6
	ldd	[%l7 + 0x20],	%f8
	orncc	%l4,	%i7,	%i6
	orn	%i2,	0x1CF4,	%g5
	restore %l5, %l1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i0,	%i4
	movn	%xcc,	%g6,	%l3
	bshuffle	%f0,	%f20,	%f18
	umulcc	%g4,	0x1063,	%o1
	fcmpgt32	%f30,	%f12,	%g3
	edge16l	%l2,	%o0,	%g1
	edge32ln	%i3,	%l6,	%g2
	popc	0x1EA3,	%o5
	sub	%l0,	0x1E4E,	%o3
	sra	%i5,	%o2,	%o7
	stx	%o4,	[%l7 + 0x78]
	fnors	%f5,	%f29,	%f20
	udivx	%g7,	0x0135,	%l4
	udiv	%i7,	0x0527,	%i6
	mova	%icc,	%i2,	%o6
	orn	%g5,	0x0B71,	%l5
	edge16l	%l1,	%i0,	%i4
	subcc	%g6,	0x0AB7,	%i1
	xorcc	%l3,	%o1,	%g3
	sdivcc	%g4,	0x0BA2,	%o0
	alignaddrl	%g1,	%i3,	%l6
	movrgez	%l2,	%o5,	%l0
	movpos	%xcc,	%o3,	%i5
	sdivx	%o2,	0x1F39,	%o7
	stb	%o4,	[%l7 + 0x12]
	ldsw	[%l7 + 0x34],	%g7
	sdiv	%g2,	0x06D1,	%l4
	movle	%xcc,	%i7,	%i6
	fxnor	%f22,	%f16,	%f24
	fpadd32s	%f0,	%f19,	%f17
	movvs	%xcc,	%o6,	%g5
	edge16	%l5,	%l1,	%i2
	sdiv	%i0,	0x1187,	%g6
	fpadd32	%f18,	%f18,	%f20
	save %i4, 0x1BED, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l3,	0x08AB,	%g3
	sdiv	%g4,	0x0A86,	%o0
	srax	%o1,	0x0A,	%i3
	udivx	%l6,	0x05CE,	%l2
	fcmpes	%fcc1,	%f17,	%f12
	andcc	%o5,	0x0101,	%l0
	fcmps	%fcc2,	%f19,	%f4
	smulcc	%o3,	%i5,	%g1
	xorcc	%o7,	%o4,	%g7
	ld	[%l7 + 0x50],	%f10
	movgu	%icc,	%o2,	%l4
	ldd	[%l7 + 0x60],	%f8
	array16	%g2,	%i6,	%o6
	orcc	%g5,	%i7,	%l5
	move	%xcc,	%l1,	%i0
	movrlez	%i2,	0x3F6,	%g6
	orcc	%i1,	0x1B8B,	%l3
	move	%xcc,	%i4,	%g3
	sethi	0x05EC,	%o0
	smul	%o1,	0x1D3E,	%g4
	sir	0x14AC
	fpsub32	%f20,	%f30,	%f30
	xnor	%i3,	%l6,	%l2
	movne	%icc,	%o5,	%o3
	umul	%i5,	0x0042,	%l0
	lduh	[%l7 + 0x64],	%g1
	sll	%o4,	0x11,	%g7
	sra	%o7,	0x0E,	%l4
	movrgez	%o2,	0x2F0,	%i6
	movl	%icc,	%o6,	%g2
	ldsh	[%l7 + 0x60],	%g5
	edge16l	%l5,	%i7,	%l1
	addc	%i0,	0x1456,	%i2
	sra	%i1,	%g6,	%l3
	save %i4, 0x1638, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o1,	0x1A28,	%g4
	stx	%g3,	[%l7 + 0x68]
	fcmpgt16	%f30,	%f10,	%i3
	xnor	%l6,	0x043B,	%o5
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	restore %i5, 0x1164, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g1, %o4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f16,	[%l7 + 0x58]
	save %o7, 0x1EB8, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f1,	%f14
	movrlz	%i6,	%o2,	%g2
	fnot1s	%f20,	%f19
	edge16l	%o6,	%l5,	%g5
	orn	%i7,	0x0D94,	%l1
	fsrc1	%f20,	%f14
	edge16l	%i2,	%i1,	%g6
	edge16n	%i0,	%l3,	%i4
	srax	%o0,	0x10,	%o1
	srl	%g3,	0x0A,	%g4
	movleu	%icc,	%l6,	%o5
	xorcc	%o3,	0x076B,	%l2
	srlx	%i3,	0x02,	%i5
	orncc	%l0,	%g1,	%o4
	xorcc	%g7,	0x131B,	%l4
	fmovrsgez	%i6,	%f13,	%f21
	fxnors	%f24,	%f30,	%f22
	andn	%o2,	%g2,	%o6
	fmovdle	%xcc,	%f17,	%f28
	udivcc	%o7,	0x0CF3,	%l5
	edge8ln	%i7,	%g5,	%l1
	andn	%i1,	%i2,	%i0
	subc	%g6,	0x0863,	%i4
	sll	%l3,	%o0,	%o1
	fcmpd	%fcc2,	%f4,	%f28
	andn	%g3,	0x020D,	%l6
	sdivcc	%o5,	0x1295,	%o3
	popc	%l2,	%i3
	alignaddrl	%i5,	%l0,	%g4
	edge16l	%g1,	%g7,	%l4
	addcc	%i6,	0x00F1,	%o4
	stw	%g2,	[%l7 + 0x24]
	movpos	%xcc,	%o2,	%o6
	movcc	%xcc,	%o7,	%i7
	sdivx	%g5,	0x0342,	%l1
	movl	%xcc,	%l5,	%i1
	edge8l	%i0,	%g6,	%i4
	mulx	%l3,	0x1C01,	%i2
	movg	%xcc,	%o1,	%g3
	movcc	%xcc,	%o0,	%o5
	move	%xcc,	%l6,	%l2
	move	%xcc,	%o3,	%i5
	subcc	%i3,	0x1672,	%g4
	fandnot2s	%f3,	%f14,	%f8
	alignaddrl	%g1,	%g7,	%l0
	stx	%i6,	[%l7 + 0x78]
	movpos	%icc,	%o4,	%l4
	fmovsvs	%icc,	%f9,	%f14
	fmovsg	%xcc,	%f20,	%f23
	sll	%g2,	%o6,	%o2
	st	%f12,	[%l7 + 0x38]
	edge32n	%i7,	%g5,	%o7
	movrgez	%l1,	%i1,	%i0
	sll	%l5,	0x1B,	%g6
	sethi	0x148A,	%i4
	fnot1	%f6,	%f4
	stx	%l3,	[%l7 + 0x38]
	fmovsle	%icc,	%f5,	%f3
	movrlez	%o1,	%i2,	%o0
	pdist	%f8,	%f14,	%f4
	subcc	%o5,	0x14DE,	%g3
	sub	%l6,	0x0C9B,	%o3
	alignaddr	%i5,	%l2,	%i3
	sll	%g1,	%g7,	%l0
	udiv	%i6,	0x1D8D,	%g4
	mova	%xcc,	%o4,	%l4
	or	%o6,	%o2,	%g2
	fmovdn	%xcc,	%f8,	%f29
	orcc	%g5,	%i7,	%o7
	fnot2	%f0,	%f8
	stb	%l1,	[%l7 + 0x77]
	xnorcc	%i1,	%i0,	%l5
	movrne	%g6,	0x17C,	%i4
	fnands	%f5,	%f21,	%f10
	edge32	%l3,	%i2,	%o1
	move	%icc,	%o5,	%o0
	edge32n	%l6,	%g3,	%o3
	fmovdpos	%icc,	%f17,	%f10
	movrgez	%l2,	%i5,	%g1
	stw	%i3,	[%l7 + 0x70]
	fmovdn	%icc,	%f5,	%f20
	lduw	[%l7 + 0x64],	%g7
	ldsh	[%l7 + 0x64],	%l0
	edge32n	%g4,	%i6,	%l4
	st	%f30,	[%l7 + 0x1C]
	movge	%xcc,	%o4,	%o6
	sdivx	%o2,	0x0822,	%g5
	udivx	%g2,	0x191D,	%o7
	fmovsle	%icc,	%f28,	%f28
	ldub	[%l7 + 0x66],	%i7
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	nop
	set	0x53, %i6
	ldub	[%l7 + %i6],	%l5
	ldd	[%l7 + 0x28],	%f14
	fornot1	%f6,	%f16,	%f12
	alignaddr	%g6,	%i4,	%l3
	fsrc1s	%f11,	%f22
	xorcc	%i2,	%o1,	%o5
	fmovdvs	%xcc,	%f24,	%f12
	fmovrdgz	%o0,	%f0,	%f16
	movrlez	%l6,	%g3,	%o3
	movvs	%xcc,	%i5,	%l2
	sllx	%i3,	0x1A,	%g7
	sdiv	%l0,	0x1D85,	%g1
	movrlez	%i6,	0x3DC,	%g4
	edge16n	%l4,	%o4,	%o2
	edge8n	%o6,	%g2,	%o7
	move	%icc,	%g5,	%i1
	lduw	[%l7 + 0x6C],	%i7
	edge16ln	%l1,	%l5,	%i0
	save %g6, 0x1E25, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i2,	%i4,	%o1
	edge16	%o0,	%o5,	%l6
	fornot2s	%f31,	%f29,	%f13
	smul	%o3,	0x0793,	%g3
	fmovsgu	%icc,	%f18,	%f26
	st	%f28,	[%l7 + 0x54]
	sdivcc	%i5,	0x0A53,	%i3
	movvc	%icc,	%l2,	%g7
	movvc	%xcc,	%g1,	%l0
	ldx	[%l7 + 0x68],	%i6
	edge32n	%l4,	%g4,	%o4
	xor	%o6,	0x0F3C,	%o2
	array8	%g2,	%o7,	%i1
	udiv	%i7,	0x1F05,	%g5
	andn	%l5,	0x02B1,	%l1
	edge16ln	%i0,	%l3,	%i2
	edge8	%i4,	%o1,	%o0
	sll	%o5,	0x01,	%g6
	fmovdne	%xcc,	%f26,	%f5
	movvs	%xcc,	%l6,	%g3
	smul	%o3,	%i5,	%i3
	fcmpd	%fcc3,	%f14,	%f18
	udiv	%g7,	0x117E,	%g1
	popc	%l2,	%l0
	fmovdge	%xcc,	%f22,	%f8
	subc	%i6,	0x0070,	%g4
	lduw	[%l7 + 0x0C],	%o4
	std	%f26,	[%l7 + 0x68]
	fmovdvs	%icc,	%f23,	%f27
	orn	%l4,	0x0769,	%o6
	fcmpne32	%f30,	%f20,	%g2
	sir	0x1A80
	fmul8sux16	%f10,	%f2,	%f20
	sdiv	%o2,	0x1E40,	%o7
	std	%f28,	[%l7 + 0x48]
	subccc	%i1,	0x17AD,	%i7
	movcs	%icc,	%l5,	%g5
	fmovdne	%xcc,	%f20,	%f13
	udivx	%l1,	0x0289,	%l3
	stb	%i0,	[%l7 + 0x25]
	popc	%i2,	%o1
	sllx	%i4,	%o5,	%o0
	orcc	%l6,	0x09D4,	%g6
	fxors	%f16,	%f16,	%f12
	movle	%icc,	%g3,	%i5
	srl	%i3,	%g7,	%g1
	ldx	[%l7 + 0x70],	%o3
	edge8	%l2,	%i6,	%g4
	edge8ln	%o4,	%l0,	%l4
	std	%f20,	[%l7 + 0x18]
	fmovrdlez	%g2,	%f18,	%f28
	movrlez	%o2,	0x261,	%o7
	sethi	0x05E4,	%i1
	umulcc	%i7,	0x037E,	%l5
	popc	0x05A9,	%o6
	fmul8x16al	%f15,	%f3,	%f0
	mova	%xcc,	%l1,	%g5
	edge32ln	%i0,	%l3,	%i2
	fpsub16	%f16,	%f12,	%f8
	movrgez	%o1,	0x395,	%i4
	fmovdneg	%xcc,	%f16,	%f0
	move	%icc,	%o5,	%o0
	fmovse	%icc,	%f31,	%f5
	movre	%l6,	%g6,	%i5
	stw	%g3,	[%l7 + 0x68]
	sra	%g7,	%g1,	%i3
	ldd	[%l7 + 0x48],	%f28
	movcc	%xcc,	%o3,	%l2
	udivx	%g4,	0x16EB,	%i6
	save %l0, %o4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f29,	%f4,	%f22
	add	%l4,	0x03D7,	%o2
	udiv	%i1,	0x14EA,	%o7
	movn	%xcc,	%l5,	%o6
	stb	%l1,	[%l7 + 0x5C]
	movg	%xcc,	%g5,	%i7
	fmovsl	%xcc,	%f7,	%f5
	sdivcc	%l3,	0x17DD,	%i0
	nop
	set	0x48, %i3
	ldsw	[%l7 + %i3],	%i2
	movrgez	%i4,	%o5,	%o0
	lduw	[%l7 + 0x54],	%l6
	fpsub16s	%f6,	%f12,	%f1
	alignaddr	%g6,	%i5,	%o1
	movge	%xcc,	%g3,	%g7
	fmovdge	%icc,	%f21,	%f5
	movn	%icc,	%i3,	%o3
	movpos	%xcc,	%l2,	%g1
	movg	%icc,	%g4,	%l0
	lduw	[%l7 + 0x34],	%o4
	std	%f20,	[%l7 + 0x18]
	sdivcc	%g2,	0x16D8,	%l4
	udiv	%i6,	0x00D0,	%i1
	movrgez	%o7,	%l5,	%o6
	movpos	%icc,	%o2,	%l1
	fcmped	%fcc1,	%f18,	%f4
	andcc	%g5,	%l3,	%i0
	movvs	%xcc,	%i7,	%i4
	lduh	[%l7 + 0x78],	%i2
	ldsw	[%l7 + 0x48],	%o5
	mulscc	%o0,	%l6,	%g6
	subccc	%i5,	0x0A5F,	%o1
	mulscc	%g7,	0x047C,	%i3
	fmovsge	%icc,	%f5,	%f12
	movre	%g3,	0x379,	%l2
	stx	%o3,	[%l7 + 0x38]
	movre	%g1,	%g4,	%o4
	movvc	%icc,	%l0,	%g2
	sir	0x1FA9
	movg	%xcc,	%i6,	%i1
	array32	%l4,	%o7,	%l5
	fzeros	%f20
	fmovdcs	%icc,	%f21,	%f26
	srax	%o2,	0x12,	%o6
	movrgz	%l1,	%l3,	%g5
	xorcc	%i0,	%i4,	%i7
	sdiv	%i2,	0x043F,	%o5
	mulscc	%l6,	%o0,	%g6
	xnorcc	%o1,	%i5,	%g7
	edge32	%g3,	%l2,	%i3
	edge32n	%g1,	%g4,	%o4
	edge8n	%l0,	%o3,	%g2
	xorcc	%i6,	0x02DD,	%l4
	fmovspos	%xcc,	%f13,	%f19
	edge16	%o7,	%i1,	%l5
	movg	%xcc,	%o6,	%l1
	movvs	%xcc,	%o2,	%l3
	fmovspos	%icc,	%f14,	%f25
	movcc	%xcc,	%g5,	%i4
	movrne	%i7,	0x163,	%i0
	movrgez	%i2,	%o5,	%o0
	nop
	set	0x21, %g3
	ldub	[%l7 + %g3],	%g6
	sdivx	%o1,	0x1CBC,	%i5
	array16	%l6,	%g3,	%g7
	fmovsle	%icc,	%f18,	%f23
	edge32ln	%l2,	%i3,	%g4
	movrlez	%o4,	0x2C0,	%g1
	edge16l	%o3,	%l0,	%i6
	sra	%g2,	0x08,	%l4
	movn	%icc,	%i1,	%o7
	xor	%l5,	%l1,	%o6
	fmovrdgez	%o2,	%f4,	%f30
	ldsb	[%l7 + 0x25],	%g5
	orcc	%l3,	%i7,	%i4
	ldx	[%l7 + 0x70],	%i2
	addcc	%i0,	0x0A49,	%o0
	fnot1s	%f19,	%f13
	ldsh	[%l7 + 0x3A],	%o5
	or	%o1,	0x0B12,	%g6
	srax	%i5,	0x19,	%g3
	or	%g7,	%l2,	%l6
	movne	%xcc,	%g4,	%o4
	mulx	%g1,	0x1882,	%i3
	sdiv	%l0,	0x0FF2,	%o3
	fmovdgu	%icc,	%f3,	%f21
	movrgz	%g2,	0x391,	%i6
	fxors	%f8,	%f27,	%f25
	and	%l4,	%i1,	%o7
	edge8l	%l5,	%o6,	%l1
	fabsd	%f4,	%f2
	edge32l	%o2,	%l3,	%g5
	movne	%xcc,	%i7,	%i2
	nop
	set	0x18, %l4
	std	%f0,	[%l7 + %l4]
	mova	%xcc,	%i0,	%i4
	xorcc	%o5,	0x1C79,	%o1
	udivx	%o0,	0x0B8A,	%i5
	addc	%g3,	%g7,	%l2
	subcc	%g6,	0x1518,	%g4
	ldsh	[%l7 + 0x48],	%o4
	fabss	%f5,	%f27
	edge32n	%g1,	%i3,	%l0
	movleu	%icc,	%o3,	%g2
	edge8l	%i6,	%l4,	%i1
	fmovsleu	%xcc,	%f26,	%f17
	addcc	%o7,	0x1330,	%l5
	orn	%o6,	%l1,	%l6
	movvc	%icc,	%o2,	%g5
	udiv	%l3,	0x036A,	%i7
	std	%f6,	[%l7 + 0x68]
	srax	%i2,	%i0,	%i4
	xor	%o1,	0x1FB8,	%o0
	fpsub32	%f26,	%f26,	%f10
	and	%o5,	%i5,	%g7
	sdivx	%g3,	0x09C8,	%l2
	ldd	[%l7 + 0x48],	%g4
	udiv	%o4,	0x05E8,	%g1
	fmovscc	%icc,	%f4,	%f21
	orn	%g6,	0x05F2,	%l0
	ldub	[%l7 + 0x7F],	%o3
	movn	%xcc,	%g2,	%i3
	xor	%i6,	0x14B2,	%l4
	fmovde	%xcc,	%f29,	%f18
	movgu	%xcc,	%i1,	%l5
	orn	%o6,	%l1,	%l6
	fandnot1	%f18,	%f22,	%f12
	srax	%o2,	0x1E,	%o7
	movn	%icc,	%g5,	%l3
	sth	%i2,	[%l7 + 0x78]
	edge16n	%i0,	%i4,	%o1
	movrlez	%i7,	%o5,	%o0
	stx	%i5,	[%l7 + 0x68]
	movre	%g7,	%l2,	%g4
	ldsb	[%l7 + 0x5F],	%o4
	addc	%g3,	%g1,	%l0
	fmuld8sux16	%f1,	%f5,	%f12
	fsrc2s	%f20,	%f14
	smul	%o3,	0x043D,	%g2
	sth	%i3,	[%l7 + 0x1C]
	movg	%xcc,	%i6,	%g6
	fsrc2	%f18,	%f8
	xnor	%l4,	%l5,	%i1
	movpos	%icc,	%l1,	%l6
	xnor	%o2,	%o6,	%o7
	fmovsle	%icc,	%f7,	%f24
	fmovdne	%xcc,	%f17,	%f18
	fones	%f16
	sra	%l3,	%i2,	%i0
	fpadd32s	%f7,	%f0,	%f18
	srlx	%i4,	0x09,	%g5
	udivcc	%o1,	0x15E0,	%i7
	sethi	0x0870,	%o0
	fors	%f21,	%f3,	%f26
	fmovdn	%icc,	%f21,	%f7
	mova	%xcc,	%o5,	%g7
	sdivx	%l2,	0x0C87,	%i5
	ldub	[%l7 + 0x37],	%o4
	movrgz	%g4,	0x391,	%g3
	lduw	[%l7 + 0x1C],	%g1
	movrlez	%o3,	%l0,	%i3
	fcmped	%fcc3,	%f18,	%f16
	sth	%i6,	[%l7 + 0x22]
	array8	%g6,	%g2,	%l5
	array8	%i1,	%l4,	%l1
	and	%l6,	0x1C03,	%o6
	xnor	%o2,	%o7,	%l3
	orcc	%i0,	%i2,	%g5
	fmovrdlz	%o1,	%f30,	%f22
	restore %i4, %o0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g7,	0x249,	%l2
	alignaddr	%i7,	%o4,	%g4
	andn	%g3,	0x004A,	%g1
	addccc	%o3,	0x00ED,	%i5
	lduw	[%l7 + 0x3C],	%i3
	udivcc	%l0,	0x0C04,	%g6
	mova	%icc,	%i6,	%g2
	srax	%l5,	%i1,	%l4
	andncc	%l1,	%l6,	%o2
	movre	%o7,	0x140,	%l3
	subcc	%o6,	0x02B8,	%i0
	edge32l	%g5,	%i2,	%i4
	fpadd32s	%f6,	%f23,	%f22
	sethi	0x0C88,	%o1
	sdivcc	%o5,	0x1726,	%g7
	fandnot1	%f10,	%f12,	%f4
	lduh	[%l7 + 0x2A],	%o0
	edge32	%l2,	%o4,	%i7
	fmovdpos	%icc,	%f2,	%f29
	edge16	%g4,	%g3,	%o3
	ldsb	[%l7 + 0x14],	%i5
	fandnot1	%f12,	%f6,	%f8
	stx	%i3,	[%l7 + 0x08]
	add	%l0,	%g6,	%i6
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	movge	%icc,	%g2,	%l1
	ldd	[%l7 + 0x50],	%i6
	movne	%xcc,	%l4,	%o2
	addcc	%o7,	%o6,	%i0
	move	%icc,	%g5,	%i2
	stb	%i4,	[%l7 + 0x51]
	udiv	%o1,	0x04CF,	%o5
	fcmpne32	%f14,	%f24,	%l3
	movrgz	%g7,	%l2,	%o0
	movleu	%xcc,	%o4,	%i7
	std	%f20,	[%l7 + 0x30]
	ld	[%l7 + 0x0C],	%f0
	move	%xcc,	%g3,	%o3
	fnot1s	%f27,	%f24
	fnot1s	%f23,	%f31
	movleu	%xcc,	%g4,	%i5
	umul	%i3,	0x0329,	%l0
	edge16	%g6,	%g1,	%l5
	ldub	[%l7 + 0x1B],	%i1
	add	%g2,	0x10D8,	%l1
	edge8	%i6,	%l6,	%o2
	edge8l	%o7,	%l4,	%o6
	andn	%i0,	0x0050,	%i2
	addccc	%g5,	%o1,	%i4
	andncc	%l3,	%g7,	%l2
	movrgz	%o5,	0x001,	%o4
	umulcc	%o0,	%g3,	%o3
	fmovdneg	%icc,	%f14,	%f29
	sethi	0x0712,	%g4
	xnor	%i7,	0x1D1A,	%i3
	sethi	0x1622,	%i5
	ldsw	[%l7 + 0x64],	%g6
	or	%l0,	0x139E,	%g1
	fmovdneg	%xcc,	%f10,	%f17
	fxnors	%f18,	%f12,	%f21
	fornot2s	%f8,	%f14,	%f17
	movrgez	%i1,	%l5,	%g2
	fmuld8sux16	%f18,	%f19,	%f4
	movneg	%xcc,	%l1,	%i6
	sir	0x13B5
	fmovdcc	%icc,	%f7,	%f13
	edge8ln	%o2,	%o7,	%l4
	movcc	%icc,	%o6,	%i0
	alignaddrl	%l6,	%g5,	%o1
	movre	%i2,	%l3,	%g7
	movpos	%icc,	%l2,	%i4
	stb	%o5,	[%l7 + 0x21]
	array8	%o0,	%g3,	%o4
	sllx	%o3,	%i7,	%g4
	ld	[%l7 + 0x14],	%f8
	siam	0x1
	fmovsg	%icc,	%f14,	%f21
	fnot1	%f4,	%f6
	std	%f24,	[%l7 + 0x70]
	fmovrdgez	%i5,	%f24,	%f22
	fornot2s	%f5,	%f18,	%f13
	sdivx	%i3,	0x1211,	%g6
	faligndata	%f0,	%f14,	%f18
	orncc	%l0,	%i1,	%g1
	sra	%g2,	0x01,	%l5
	and	%l1,	%i6,	%o2
	orncc	%l4,	%o6,	%i0
	movle	%icc,	%o7,	%l6
	stb	%g5,	[%l7 + 0x35]
	movcs	%icc,	%o1,	%l3
	edge16ln	%i2,	%g7,	%i4
	fornot2	%f14,	%f26,	%f0
	movgu	%xcc,	%l2,	%o0
	movrgez	%g3,	%o5,	%o4
	andncc	%o3,	%i7,	%i5
	pdist	%f8,	%f26,	%f30
	fpackfix	%f4,	%f28
	array8	%g4,	%g6,	%l0
	andn	%i1,	0x0B6E,	%i3
	edge16l	%g1,	%g2,	%l5
	std	%f30,	[%l7 + 0x18]
	orn	%l1,	%i6,	%o2
	srax	%o6,	0x1C,	%l4
	movle	%icc,	%o7,	%i0
	movneg	%icc,	%l6,	%o1
	fmuld8ulx16	%f22,	%f22,	%f6
	movgu	%xcc,	%l3,	%g5
	fmovdpos	%xcc,	%f4,	%f4
	movcs	%icc,	%i2,	%i4
	addccc	%g7,	0x1E8B,	%l2
	movrgz	%o0,	0x0D8,	%o5
	fmul8ulx16	%f20,	%f24,	%f2
	fzero	%f14
	movn	%xcc,	%g3,	%o4
	fpsub32s	%f14,	%f15,	%f0
	fzeros	%f24
	movvc	%icc,	%i7,	%i5
	srlx	%g4,	0x0C,	%g6
	ld	[%l7 + 0x60],	%f29
	udiv	%l0,	0x1295,	%o3
	sra	%i1,	0x01,	%i3
	movleu	%icc,	%g2,	%l5
	srlx	%l1,	%i6,	%g1
	andncc	%o2,	%o6,	%o7
	fmovdvc	%icc,	%f6,	%f17
	restore %l4, %l6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l3,	%g5,	%o1
	ldx	[%l7 + 0x18],	%i2
	movneg	%xcc,	%i4,	%g7
	stx	%l2,	[%l7 + 0x20]
	ldd	[%l7 + 0x58],	%o4
	sdivx	%g3,	0x035E,	%o0
	fmovde	%icc,	%f25,	%f19
	ldsw	[%l7 + 0x10],	%i7
	std	%f8,	[%l7 + 0x48]
	fpackfix	%f20,	%f26
	fpsub16	%f14,	%f2,	%f10
	edge32l	%o4,	%g4,	%i5
	and	%l0,	%g6,	%i1
	movl	%icc,	%o3,	%i3
	edge16l	%g2,	%l1,	%l5
	fnot1s	%f23,	%f1
	nop
	set	0x42, %g6
	ldsh	[%l7 + %g6],	%i6
	edge32n	%g1,	%o6,	%o7
	sll	%o2,	0x1A,	%l4
	xorcc	%l6,	%l3,	%g5
	srl	%o1,	0x18,	%i2
	movvs	%xcc,	%i0,	%g7
	edge16l	%l2,	%o5,	%g3
	lduh	[%l7 + 0x32],	%o0
	xor	%i7,	0x0B25,	%o4
	udivx	%i4,	0x08E1,	%i5
	xorcc	%l0,	0x1441,	%g6
	fand	%f12,	%f18,	%f12
	popc	0x0DBB,	%i1
	movl	%icc,	%g4,	%i3
	edge16l	%g2,	%l1,	%l5
	save %o3, 0x0B3D, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o6,	%g1,	%o2
	edge16n	%o7,	%l4,	%l3
	ldsw	[%l7 + 0x74],	%l6
	edge32ln	%o1,	%i2,	%i0
	popc	0x1AB4,	%g7
	edge32ln	%g5,	%o5,	%l2
	xnorcc	%g3,	0x0573,	%o0
	edge32n	%o4,	%i7,	%i4
	sethi	0x0195,	%l0
	fmovscc	%icc,	%f13,	%f16
	fcmps	%fcc1,	%f31,	%f5
	fmul8x16au	%f11,	%f17,	%f26
	fpsub16s	%f12,	%f30,	%f8
	fsrc1	%f0,	%f24
	mulscc	%g6,	0x0C9F,	%i5
	sdiv	%g4,	0x0222,	%i3
	ldsb	[%l7 + 0x56],	%i1
	edge8l	%g2,	%l1,	%l5
	ldub	[%l7 + 0x63],	%i6
	mulscc	%o6,	0x04BC,	%g1
	addccc	%o2,	0x13F2,	%o3
	sdivx	%o7,	0x09A6,	%l4
	lduw	[%l7 + 0x48],	%l6
	smulcc	%o1,	0x181D,	%l3
	fsrc1s	%f29,	%f29
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	fnot2s	%f9,	%f30
	movn	%icc,	%g5,	%o5
	movvs	%icc,	%l2,	%g7
	ldsb	[%l7 + 0x2C],	%g3
	sdiv	%o4,	0x0E41,	%i7
	lduh	[%l7 + 0x1C],	%i4
	ld	[%l7 + 0x78],	%f7
	sll	%l0,	%g6,	%o0
	lduw	[%l7 + 0x44],	%i5
	edge16ln	%g4,	%i1,	%g2
	ldsh	[%l7 + 0x7C],	%i3
	movcs	%icc,	%l5,	%i6
	movpos	%icc,	%l1,	%g1
	fmovrdgez	%o6,	%f10,	%f14
	edge16ln	%o2,	%o7,	%o3
	sth	%l4,	[%l7 + 0x6A]
	add	%o1,	0x0FA2,	%l3
	ld	[%l7 + 0x7C],	%f18
	andcc	%i0,	%i2,	%g5
	save %o5, 0x1063, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l6,	0x0DC1,	%g7
	movn	%xcc,	%o4,	%i7
	movn	%icc,	%i4,	%g3
	movl	%xcc,	%l0,	%g6
	addcc	%i5,	0x0BF1,	%o0
	ld	[%l7 + 0x4C],	%f11
	st	%f9,	[%l7 + 0x50]
	array16	%i1,	%g4,	%g2
	and	%i3,	%i6,	%l5
	movrlz	%g1,	0x066,	%o6
	udiv	%o2,	0x19AE,	%o7
	umul	%l1,	0x1226,	%o3
	popc	%l4,	%l3
	andcc	%i0,	0x0C8D,	%o1
	sdiv	%i2,	0x0AD8,	%o5
	nop
	set	0x40, %o0
	stx	%g5,	[%l7 + %o0]
	alignaddrl	%l2,	%g7,	%o4
	udivx	%l6,	0x166B,	%i4
	fmovs	%f16,	%f8
	mulx	%i7,	0x14CD,	%g3
	fnot2s	%f7,	%f16
	sdivx	%l0,	0x155D,	%g6
	alignaddr	%o0,	%i5,	%i1
	std	%f8,	[%l7 + 0x48]
	or	%g2,	0x173F,	%g4
	fabsd	%f30,	%f14
	popc	%i3,	%i6
	movn	%xcc,	%l5,	%g1
	smul	%o6,	0x00CD,	%o2
	orncc	%l1,	%o7,	%o3
	fmovda	%xcc,	%f0,	%f15
	fmul8ulx16	%f18,	%f18,	%f14
	addcc	%l4,	0x0489,	%i0
	umul	%l3,	0x171A,	%o1
	sir	0x0BB3
	fcmpes	%fcc0,	%f25,	%f24
	movn	%icc,	%i2,	%o5
	movcs	%icc,	%g5,	%g7
	movl	%xcc,	%o4,	%l6
	fzeros	%f23
	faligndata	%f22,	%f26,	%f14
	movleu	%icc,	%i4,	%i7
	fmovdgu	%icc,	%f22,	%f11
	movrgez	%g3,	0x392,	%l2
	xnor	%g6,	%l0,	%i5
	subc	%o0,	%g2,	%i1
	edge16ln	%g4,	%i6,	%i3
	movne	%xcc,	%g1,	%o6
	sth	%o2,	[%l7 + 0x16]
	fmovrde	%l1,	%f8,	%f26
	ldd	[%l7 + 0x10],	%o6
	sdiv	%l5,	0x1BAA,	%o3
	movcc	%icc,	%i0,	%l3
	fnot2	%f28,	%f12
	edge8l	%o1,	%l4,	%o5
	stx	%i2,	[%l7 + 0x20]
	lduw	[%l7 + 0x3C],	%g5
	udivcc	%o4,	0x0894,	%g7
	srl	%l6,	0x18,	%i4
	fmovdcs	%icc,	%f5,	%f15
	array16	%g3,	%l2,	%g6
	sir	0x07F4
	fmovsg	%xcc,	%f6,	%f1
	movvs	%xcc,	%i7,	%l0
	ldsh	[%l7 + 0x0A],	%o0
	fmovd	%f18,	%f10
	ld	[%l7 + 0x48],	%f5
	fmovsl	%icc,	%f31,	%f2
	xor	%i5,	0x1280,	%i1
	umulcc	%g4,	%i6,	%i3
	stx	%g2,	[%l7 + 0x38]
	subccc	%g1,	%o2,	%o6
	sth	%o7,	[%l7 + 0x3E]
	umul	%l5,	0x1531,	%l1
	movl	%xcc,	%i0,	%o3
	fxors	%f29,	%f16,	%f6
	lduh	[%l7 + 0x4A],	%l3
	edge16ln	%l4,	%o5,	%o1
	movg	%xcc,	%g5,	%o4
	xorcc	%i2,	%g7,	%l6
	edge8ln	%g3,	%l2,	%i4
	movrlez	%i7,	%l0,	%o0
	fzeros	%f2
	sra	%i5,	0x03,	%g6
	sllx	%g4,	%i6,	%i3
	lduw	[%l7 + 0x48],	%i1
	ldsw	[%l7 + 0x48],	%g1
	ldd	[%l7 + 0x38],	%f30
	fmul8x16	%f3,	%f22,	%f28
	fornot1s	%f0,	%f8,	%f1
	fnor	%f22,	%f4,	%f10
	fmovde	%xcc,	%f25,	%f24
	edge32l	%g2,	%o6,	%o7
	fmovrde	%o2,	%f26,	%f10
	edge32	%l5,	%i0,	%l1
	add	%o3,	%l3,	%l4
	fmovdge	%icc,	%f10,	%f27
	stw	%o1,	[%l7 + 0x10]
	orn	%g5,	%o4,	%o5
	movge	%xcc,	%i2,	%g7
	udivcc	%g3,	0x10C0,	%l6
	fpsub32	%f10,	%f10,	%f2
	movpos	%icc,	%l2,	%i7
	sra	%i4,	%l0,	%o0
	fcmpeq32	%f12,	%f6,	%i5
	edge32n	%g4,	%i6,	%i3
	edge32n	%i1,	%g1,	%g6
	fmovsvs	%icc,	%f5,	%f23
	nop
	set	0x2C, %o1
	ldsw	[%l7 + %o1],	%g2
	xnorcc	%o6,	%o7,	%l5
	edge8	%i0,	%l1,	%o3
	fmovrsne	%o2,	%f29,	%f8
	sdivcc	%l4,	0x1E8B,	%o1
	movge	%xcc,	%l3,	%o4
	ldsh	[%l7 + 0x6A],	%g5
	mulx	%o5,	0x17F8,	%i2
	subccc	%g7,	%l6,	%l2
	mulx	%i7,	%g3,	%l0
	edge8	%o0,	%i5,	%g4
	umul	%i4,	%i3,	%i6
	edge16n	%g1,	%g6,	%i1
	smulcc	%o6,	0x1A9D,	%g2
	movre	%o7,	0x307,	%l5
	for	%f28,	%f26,	%f12
	movcs	%xcc,	%l1,	%i0
	srl	%o2,	%l4,	%o3
	fcmpgt32	%f2,	%f14,	%l3
	movrlez	%o4,	%g5,	%o1
	movrgz	%i2,	0x12F,	%o5
	movrlz	%l6,	%g7,	%i7
	movrlez	%g3,	%l0,	%o0
	array16	%i5,	%l2,	%g4
	array8	%i3,	%i6,	%i4
	move	%xcc,	%g1,	%g6
	fmovdgu	%xcc,	%f15,	%f9
	movpos	%xcc,	%o6,	%i1
	andcc	%g2,	0x0A80,	%o7
	array32	%l5,	%l1,	%i0
	srlx	%l4,	%o3,	%l3
	orcc	%o2,	%o4,	%o1
	or	%g5,	0x1462,	%o5
	sll	%l6,	0x14,	%i2
	fmovrsne	%i7,	%f16,	%f27
	fornot2s	%f6,	%f3,	%f15
	fmovdleu	%xcc,	%f0,	%f18
	mova	%xcc,	%g3,	%l0
	udiv	%g7,	0x18ED,	%i5
	fxnors	%f11,	%f21,	%f16
	edge16l	%o0,	%l2,	%i3
	orncc	%i6,	%i4,	%g4
	subc	%g1,	%g6,	%i1
	sllx	%o6,	0x1A,	%o7
	ldub	[%l7 + 0x09],	%l5
	sra	%g2,	%i0,	%l1
	fmovse	%icc,	%f16,	%f6
	movvs	%icc,	%l4,	%l3
	mulscc	%o2,	0x0E1A,	%o3
	fmul8sux16	%f6,	%f8,	%f26
	fcmpd	%fcc3,	%f28,	%f24
	edge8ln	%o4,	%g5,	%o1
	subcc	%o5,	0x1C56,	%l6
	xnor	%i7,	%g3,	%i2
	edge8l	%g7,	%l0,	%i5
	fmovsvc	%xcc,	%f0,	%f27
	array8	%o0,	%i3,	%l2
	movge	%xcc,	%i6,	%i4
	movle	%icc,	%g4,	%g6
	movre	%i1,	0x26A,	%o6
	fand	%f6,	%f6,	%f2
	fpackfix	%f2,	%f1
	udiv	%o7,	0x1AE9,	%l5
	stx	%g1,	[%l7 + 0x48]
	popc	%i0,	%g2
	array16	%l1,	%l3,	%l4
	xorcc	%o2,	0x0630,	%o4
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%g4
	restore %o3, %o5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i7,	%o1,	%g3
	fcmpne32	%f30,	%f2,	%i2
	xnor	%l0,	0x0692,	%i5
	fmovrdlez	%g7,	%f26,	%f18
	movrlez	%o0,	%l2,	%i3
	movrne	%i6,	0x194,	%i4
	sllx	%g4,	%g6,	%i1
	udivcc	%o7,	0x12AB,	%o6
	ldd	[%l7 + 0x60],	%g0
	andn	%i0,	0x171D,	%g2
	add	%l5,	%l3,	%l4
	mova	%xcc,	%l1,	%o4
	smulcc	%g5,	%o2,	%o5
	subccc	%o3,	0x09CA,	%i7
	fmovsl	%xcc,	%f21,	%f13
	xnor	%l6,	0x0E26,	%g3
	udivcc	%i2,	0x089A,	%o1
	udiv	%l0,	0x147F,	%i5
	movcc	%xcc,	%o0,	%g7
	ld	[%l7 + 0x34],	%f30
	nop
	set	0x12, %i2
	ldub	[%l7 + %i2],	%l2
	fornot2	%f24,	%f10,	%f30
	fmovdleu	%xcc,	%f17,	%f10
	ldx	[%l7 + 0x78],	%i3
	ldx	[%l7 + 0x30],	%i4
	srlx	%g4,	0x0E,	%g6
	edge8	%i6,	%o7,	%o6
	edge32l	%g1,	%i0,	%i1
	siam	0x5
	fmovdgu	%icc,	%f15,	%f7
	array8	%l5,	%l3,	%l4
	edge16n	%l1,	%o4,	%g2
	ldsb	[%l7 + 0x41],	%g5
	lduw	[%l7 + 0x2C],	%o2
	stx	%o5,	[%l7 + 0x60]
	sdiv	%o3,	0x1FD7,	%i7
	subcc	%g3,	%i2,	%o1
	stb	%l0,	[%l7 + 0x3F]
	fmovrdgez	%l6,	%f24,	%f0
	fcmple32	%f26,	%f20,	%i5
	addcc	%o0,	0x09F0,	%g7
	andcc	%l2,	%i3,	%i4
	movcs	%icc,	%g4,	%i6
	alignaddrl	%o7,	%o6,	%g6
	stb	%g1,	[%l7 + 0x4F]
	mova	%xcc,	%i1,	%i0
	array16	%l3,	%l4,	%l5
	sethi	0x14ED,	%o4
	popc	0x1D36,	%g2
	nop
	set	0x59, %i1
	stb	%g5,	[%l7 + %i1]
	mulx	%l1,	0x144F,	%o5
	fnand	%f28,	%f28,	%f20
	movrlz	%o2,	%o3,	%i7
	fmul8x16al	%f25,	%f0,	%f8
	edge8ln	%i2,	%o1,	%l0
	fornot2s	%f25,	%f15,	%f14
	or	%l6,	0x010A,	%i5
	ldx	[%l7 + 0x28],	%o0
	edge32l	%g7,	%g3,	%i3
	movrgez	%i4,	%l2,	%g4
	fmovdge	%xcc,	%f7,	%f17
	edge8	%i6,	%o6,	%g6
	fmovdn	%xcc,	%f16,	%f12
	edge8ln	%o7,	%i1,	%i0
	movre	%l3,	%l4,	%g1
	fmovdvs	%xcc,	%f5,	%f14
	movne	%icc,	%o4,	%g2
	movrne	%g5,	0x3E8,	%l1
	fmul8x16	%f5,	%f16,	%f4
	udivx	%l5,	0x07F3,	%o5
	srl	%o2,	0x1B,	%i7
	sdiv	%i2,	0x0567,	%o1
	edge16l	%o3,	%l0,	%i5
	subcc	%o0,	0x15D9,	%g7
	sdivx	%g3,	0x1ACE,	%i3
	movrlz	%i4,	%l2,	%l6
	ldx	[%l7 + 0x08],	%g4
	sll	%i6,	%g6,	%o6
	ldsb	[%l7 + 0x72],	%o7
	xnor	%i0,	%i1,	%l3
	or	%g1,	%o4,	%g2
	edge8n	%g5,	%l4,	%l5
	orn	%l1,	0x01CC,	%o2
	andcc	%o5,	%i7,	%i2
	srl	%o1,	0x1D,	%o3
	save %l0, %i5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o0,	%i3,	%i4
	nop
	set	0x3E, %o5
	ldsh	[%l7 + %o5],	%g3
	array16	%l2,	%l6,	%g4
	array32	%i6,	%o6,	%o7
	mulscc	%g6,	0x0F79,	%i0
	edge16ln	%i1,	%g1,	%o4
	movcc	%xcc,	%l3,	%g5
	fmovsne	%icc,	%f22,	%f16
	movne	%icc,	%l4,	%g2
	srl	%l5,	%o2,	%l1
	fmovdpos	%xcc,	%f24,	%f14
	sir	0x1288
	sllx	%o5,	0x1C,	%i7
	edge8l	%i2,	%o3,	%o1
	sir	0x150C
	fsrc2	%f10,	%f12
	edge16ln	%i5,	%g7,	%o0
	movvs	%xcc,	%i3,	%l0
	sll	%g3,	0x1A,	%i4
	sub	%l6,	0x10BD,	%l2
	fmovsg	%xcc,	%f25,	%f19
	sethi	0x12E2,	%i6
	movle	%xcc,	%g4,	%o7
	sdivcc	%o6,	0x14D4,	%g6
	ldx	[%l7 + 0x20],	%i0
	fcmpeq32	%f22,	%f0,	%i1
	smulcc	%o4,	0x1879,	%g1
	edge8	%l3,	%l4,	%g2
	xor	%g5,	0x1948,	%l5
	st	%f20,	[%l7 + 0x4C]
	movvc	%xcc,	%o2,	%l1
	movvs	%icc,	%o5,	%i2
	fxors	%f2,	%f26,	%f13
	orncc	%o3,	%i7,	%o1
	fmovsge	%icc,	%f28,	%f24
	fcmple16	%f12,	%f26,	%g7
	fmovdle	%icc,	%f1,	%f14
	movrlz	%i5,	0x0B1,	%o0
	mova	%xcc,	%l0,	%i3
	fandnot1s	%f8,	%f26,	%f9
	sub	%g3,	%i4,	%l6
	edge32l	%i6,	%l2,	%o7
	fmovdvc	%xcc,	%f22,	%f9
	addc	%o6,	0x1CE4,	%g6
	fmul8sux16	%f22,	%f2,	%f0
	sdiv	%g4,	0x0039,	%i0
	movvc	%xcc,	%o4,	%g1
	fornot1s	%f14,	%f12,	%f15
	save %i1, 0x0CC4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g2,	%l4,	%g5
	movg	%xcc,	%l5,	%l1
	ldx	[%l7 + 0x18],	%o5
	movge	%xcc,	%o2,	%o3
	movpos	%icc,	%i2,	%o1
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%g7
	edge32ln	%i7,	%o0,	%l0
	sir	0x18CF
	fexpand	%f28,	%f4
	st	%f23,	[%l7 + 0x1C]
	ldsb	[%l7 + 0x4E],	%i3
	movrne	%g3,	0x373,	%i5
	fnegs	%f13,	%f27
	st	%f17,	[%l7 + 0x20]
	array16	%i4,	%l6,	%l2
	or	%i6,	0x0106,	%o6
	fmovdne	%icc,	%f15,	%f2
	sethi	0x1E08,	%o7
	movre	%g6,	0x158,	%i0
	addccc	%o4,	0x1F3C,	%g1
	xnorcc	%g4,	0x03E5,	%l3
	fmul8ulx16	%f10,	%f2,	%f18
	fmovrdgz	%g2,	%f20,	%f0
	fnot1	%f8,	%f28
	fmovda	%icc,	%f16,	%f0
	subc	%l4,	0x0E07,	%i1
	umul	%g5,	%l5,	%o5
	ldx	[%l7 + 0x30],	%o2
	fmovsne	%xcc,	%f2,	%f30
	lduh	[%l7 + 0x1A],	%o3
	alignaddrl	%l1,	%o1,	%g7
	movcs	%xcc,	%i7,	%i2
	fcmpeq16	%f26,	%f18,	%l0
	fmovdg	%xcc,	%f12,	%f8
	orcc	%o0,	0x1EDD,	%g3
	addcc	%i3,	%i5,	%i4
	array8	%l2,	%l6,	%i6
	xnorcc	%o6,	%o7,	%g6
	addc	%i0,	%g1,	%o4
	movn	%icc,	%l3,	%g2
	movvc	%xcc,	%g4,	%l4
	addcc	%i1,	0x0352,	%l5
	edge16ln	%o5,	%g5,	%o3
	movcc	%xcc,	%l1,	%o1
	srlx	%g7,	0x06,	%o2
	stx	%i7,	[%l7 + 0x70]
	fmovda	%xcc,	%f25,	%f23
	udivx	%i2,	0x1B93,	%o0
	save %l0, 0x172B, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %i4
	stx	%i5,	[%l7 + %i4]
	movrlez	%i3,	0x39D,	%i4
	mulscc	%l2,	%i6,	%o6
	for	%f14,	%f30,	%f26
	fmovd	%f26,	%f10
	movge	%xcc,	%o7,	%l6
	std	%f10,	[%l7 + 0x30]
	edge32l	%i0,	%g6,	%o4
	stx	%l3,	[%l7 + 0x30]
	fmovsne	%icc,	%f27,	%f6
	xnorcc	%g2,	%g4,	%g1
	sir	0x1A96
	alignaddr	%l4,	%l5,	%o5
	movgu	%icc,	%i1,	%g5
	array16	%o3,	%l1,	%g7
	fornot1	%f14,	%f6,	%f22
	movleu	%icc,	%o1,	%o2
	xnorcc	%i7,	0x112A,	%i2
	fmul8x16au	%f11,	%f1,	%f28
	edge32n	%l0,	%g3,	%i5
	sllx	%i3,	%o0,	%i4
	ldd	[%l7 + 0x48],	%f6
	movrlz	%i6,	0x358,	%o6
	subcc	%l2,	%o7,	%i0
	fandnot2s	%f18,	%f29,	%f5
	array8	%g6,	%o4,	%l3
	ldsh	[%l7 + 0x1E],	%l6
	addcc	%g4,	%g2,	%l4
	movrlez	%g1,	0x3B7,	%l5
	fmovscs	%xcc,	%f5,	%f15
	sth	%o5,	[%l7 + 0x78]
	fcmple32	%f6,	%f26,	%g5
	movne	%icc,	%i1,	%o3
	mova	%icc,	%l1,	%o1
	lduw	[%l7 + 0x70],	%g7
	fnot2s	%f5,	%f27
	addcc	%o2,	0x08A5,	%i7
	std	%f26,	[%l7 + 0x18]
	edge32l	%i2,	%l0,	%i5
	st	%f19,	[%l7 + 0x24]
	sra	%g3,	0x1F,	%i3
	movrgz	%o0,	%i4,	%i6
	udivx	%l2,	0x1BE6,	%o7
	array16	%i0,	%o6,	%g6
	fornot1s	%f9,	%f30,	%f29
	fnor	%f4,	%f30,	%f14
	ldd	[%l7 + 0x78],	%l2
	udiv	%l6,	0x0342,	%g4
	umulcc	%g2,	%l4,	%g1
	andn	%o4,	%l5,	%g5
	bshuffle	%f22,	%f30,	%f22
	sdiv	%i1,	0x09B9,	%o3
	movvs	%xcc,	%o5,	%o1
	movn	%xcc,	%g7,	%o2
	movge	%xcc,	%i7,	%l1
	edge8l	%i2,	%i5,	%g3
	edge8l	%i3,	%l0,	%o0
	lduw	[%l7 + 0x44],	%i6
	lduh	[%l7 + 0x0C],	%l2
	fpack32	%f12,	%f8,	%f4
	ld	[%l7 + 0x58],	%f24
	smulcc	%o7,	0x1FC5,	%i4
	popc	%o6,	%g6
	udiv	%i0,	0x1AE7,	%l3
	udivcc	%l6,	0x18EC,	%g2
	fzero	%f26
	sethi	0x102F,	%l4
	fors	%f20,	%f18,	%f15
	smulcc	%g1,	%o4,	%l5
	orcc	%g4,	0x0430,	%i1
	ldsb	[%l7 + 0x44],	%g5
	alignaddrl	%o3,	%o1,	%g7
	edge8n	%o5,	%o2,	%i7
	array16	%i2,	%i5,	%l1
	movgu	%xcc,	%i3,	%g3
	fmovsn	%xcc,	%f5,	%f12
	addcc	%l0,	0x1CCF,	%i6
	stb	%l2,	[%l7 + 0x15]
	movre	%o7,	0x2D7,	%o0
	xor	%i4,	%o6,	%g6
	fmovdneg	%icc,	%f18,	%f6
	subcc	%l3,	%l6,	%i0
	movg	%xcc,	%g2,	%l4
	fmovdleu	%icc,	%f27,	%f2
	andcc	%g1,	%l5,	%o4
	edge32	%g4,	%i1,	%o3
	array32	%g5,	%g7,	%o5
	lduh	[%l7 + 0x5C],	%o2
	movneg	%xcc,	%i7,	%i2
	fnegd	%f4,	%f6
	fands	%f31,	%f1,	%f15
	movg	%icc,	%o1,	%l1
	edge16n	%i5,	%i3,	%g3
	movg	%xcc,	%i6,	%l2
	movl	%icc,	%l0,	%o7
	sir	0x13D0
	orcc	%i4,	0x11F0,	%o6
	fzeros	%f28
	mulscc	%g6,	0x0A84,	%o0
	xorcc	%l3,	%i0,	%l6
	sdiv	%g2,	0x1233,	%g1
	alignaddrl	%l4,	%o4,	%g4
	fcmpeq32	%f2,	%f16,	%l5
	sll	%o3,	0x18,	%i1
	mulx	%g5,	0x07AF,	%o5
	ldsb	[%l7 + 0x76],	%g7
	xnor	%i7,	%i2,	%o2
	orn	%o1,	0x03F9,	%l1
	fmovsg	%icc,	%f24,	%f30
	edge8l	%i3,	%g3,	%i5
	srax	%i6,	0x1E,	%l2
	move	%xcc,	%o7,	%l0
	ldsw	[%l7 + 0x70],	%o6
	stw	%i4,	[%l7 + 0x6C]
	sdiv	%g6,	0x1DE3,	%l3
	ldx	[%l7 + 0x30],	%i0
	array32	%o0,	%g2,	%l6
	movneg	%icc,	%g1,	%l4
	edge8n	%g4,	%o4,	%o3
	xorcc	%i1,	%l5,	%g5
	sdivcc	%g7,	0x0BCE,	%o5
	array8	%i7,	%o2,	%i2
	fcmple32	%f0,	%f28,	%l1
	fornot2s	%f0,	%f24,	%f14
	edge8	%o1,	%i3,	%i5
	ldd	[%l7 + 0x08],	%f6
	orncc	%g3,	%l2,	%o7
	edge16	%l0,	%o6,	%i6
	edge32l	%g6,	%i4,	%l3
	xnor	%o0,	%i0,	%g2
	fmovscc	%icc,	%f22,	%f31
	edge16n	%l6,	%l4,	%g4
	siam	0x1
	ldd	[%l7 + 0x50],	%f12
	sub	%g1,	0x18E8,	%o3
	stw	%o4,	[%l7 + 0x14]
	sub	%i1,	0x1CE5,	%l5
	fpsub16	%f26,	%f2,	%f16
	nop
	set	0x6C, %l2
	lduw	[%l7 + %l2],	%g7
	fmovrdlz	%g5,	%f0,	%f8
	ldsh	[%l7 + 0x34],	%i7
	xnorcc	%o2,	%o5,	%l1
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	movrgz	%o1,	0x26E,	%g3
	sll	%l2,	%o7,	%l0
	udivx	%i5,	0x000B,	%i6
	movgu	%icc,	%g6,	%o6
	edge16l	%i4,	%o0,	%i0
	addc	%l3,	%g2,	%l4
	sub	%g4,	0x17E1,	%g1
	mova	%icc,	%o3,	%o4
	edge32ln	%i1,	%l5,	%l6
	save %g7, 0x1147, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i7,	%o2,	%o5
	fsrc2	%f8,	%f18
	fmovsle	%xcc,	%f28,	%f23
	xnorcc	%l1,	%i3,	%o1
	fmovdpos	%icc,	%f15,	%f3
	sub	%i2,	%l2,	%o7
	movvs	%xcc,	%g3,	%i5
	movne	%xcc,	%l0,	%i6
	fnand	%f20,	%f22,	%f28
	fnegs	%f8,	%f8
	lduh	[%l7 + 0x58],	%g6
	edge16ln	%i4,	%o6,	%i0
	fmovdpos	%icc,	%f26,	%f25
	movgu	%xcc,	%l3,	%o0
	fmovrdgz	%l4,	%f10,	%f22
	and	%g2,	%g4,	%g1
	for	%f24,	%f10,	%f8
	edge16ln	%o4,	%i1,	%l5
	fornot1	%f10,	%f0,	%f6
	fmovsg	%xcc,	%f11,	%f9
	movrgz	%o3,	%l6,	%g5
	movleu	%xcc,	%g7,	%i7
	movn	%xcc,	%o2,	%o5
	srlx	%l1,	%i3,	%i2
	and	%o1,	%o7,	%g3
	alignaddr	%i5,	%l2,	%i6
	movcs	%icc,	%l0,	%i4
	fmovsne	%xcc,	%f2,	%f9
	movvs	%xcc,	%g6,	%o6
	sdivcc	%l3,	0x1AAC,	%o0
	edge16	%i0,	%g2,	%l4
	fmovsn	%xcc,	%f18,	%f18
	or	%g1,	%o4,	%g4
	mulscc	%i1,	0x1E66,	%l5
	subcc	%o3,	0x0CC5,	%l6
	movvc	%icc,	%g5,	%g7
	movrgz	%o2,	0x3B6,	%o5
	stx	%i7,	[%l7 + 0x28]
	movre	%i3,	%l1,	%o1
	smulcc	%o7,	%g3,	%i5
	movvc	%icc,	%l2,	%i2
	ldsw	[%l7 + 0x0C],	%i6
	movrne	%i4,	0x3EC,	%g6
	sra	%o6,	0x1D,	%l0
	movcc	%icc,	%o0,	%i0
	movvs	%icc,	%g2,	%l3
	fnors	%f3,	%f24,	%f8
	orncc	%l4,	0x1A36,	%g1
	stb	%g4,	[%l7 + 0x22]
	fmovdl	%icc,	%f28,	%f8
	udivcc	%o4,	0x140E,	%l5
	sth	%i1,	[%l7 + 0x5A]
	fmovrdlez	%l6,	%f30,	%f0
	fmovrslez	%o3,	%f7,	%f19
	stb	%g5,	[%l7 + 0x62]
	subcc	%g7,	%o2,	%o5
	array16	%i3,	%i7,	%o1
	ldub	[%l7 + 0x7E],	%l1
	movne	%icc,	%o7,	%i5
	movgu	%icc,	%l2,	%g3
	movrlz	%i2,	%i4,	%g6
	sll	%i6,	0x06,	%l0
	sethi	0x1560,	%o6
	subcc	%o0,	%i0,	%l3
	movre	%l4,	0x14F,	%g1
	sll	%g4,	%g2,	%l5
	xnorcc	%i1,	%o4,	%l6
	move	%icc,	%g5,	%o3
	mulx	%g7,	%o2,	%i3
	edge16ln	%i7,	%o5,	%o1
	fnegs	%f14,	%f16
	ld	[%l7 + 0x38],	%f16
	movre	%l1,	%i5,	%l2
	movleu	%xcc,	%g3,	%o7
	movre	%i2,	0x320,	%i4
	edge16n	%g6,	%i6,	%l0
	umul	%o6,	%o0,	%l3
	fmovsge	%icc,	%f10,	%f30
	srax	%l4,	%i0,	%g4
	ldx	[%l7 + 0x20],	%g1
	movl	%xcc,	%g2,	%l5
	fcmpgt16	%f30,	%f14,	%i1
	mulx	%o4,	0x1949,	%l6
	edge32n	%o3,	%g5,	%g7
	fornot1	%f6,	%f6,	%f2
	movpos	%xcc,	%i3,	%i7
	fmovrslez	%o2,	%f27,	%f20
	sllx	%o5,	0x02,	%o1
	stb	%i5,	[%l7 + 0x5C]
	fmovdne	%icc,	%f31,	%f15
	ldsb	[%l7 + 0x49],	%l2
	movg	%xcc,	%g3,	%l1
	fmul8x16	%f9,	%f16,	%f10
	st	%f17,	[%l7 + 0x70]
	movrne	%i2,	0x040,	%i4
	orcc	%g6,	0x11AE,	%o7
	fones	%f26
	udivcc	%l0,	0x1239,	%i6
	fcmpne32	%f18,	%f22,	%o0
	alignaddrl	%o6,	%l4,	%l3
	sethi	0x1050,	%g4
	st	%f5,	[%l7 + 0x38]
	andncc	%g1,	%i0,	%l5
	move	%icc,	%g2,	%o4
	alignaddr	%l6,	%i1,	%g5
	sdivcc	%o3,	0x07E0,	%g7
	fnot1	%f28,	%f28
	fmovdl	%icc,	%f13,	%f16
	movge	%xcc,	%i7,	%i3
	fmovdvs	%xcc,	%f15,	%f2
	alignaddrl	%o2,	%o1,	%o5
	edge32l	%l2,	%g3,	%i5
	nop
	set	0x58, %l6
	stw	%l1,	[%l7 + %l6]
	addc	%i2,	0x1005,	%g6
	save %i4, %o7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o0,	%i6,	%o6
	smul	%l4,	0x15F0,	%g4
	movpos	%icc,	%l3,	%g1
	lduw	[%l7 + 0x48],	%i0
	add	%l5,	%o4,	%l6
	sllx	%i1,	0x1C,	%g5
	ldd	[%l7 + 0x20],	%f14
	fmuld8ulx16	%f12,	%f7,	%f26
	movvs	%icc,	%o3,	%g2
	lduw	[%l7 + 0x40],	%g7
	ldd	[%l7 + 0x20],	%f12
	edge16l	%i3,	%i7,	%o2
	xnor	%o5,	%l2,	%o1
	subc	%i5,	%g3,	%l1
	edge16ln	%i2,	%i4,	%g6
	fandnot2	%f18,	%f8,	%f18
	nop
	set	0x56, %o7
	sth	%o7,	[%l7 + %o7]
	movneg	%xcc,	%l0,	%o0
	sll	%i6,	0x00,	%l4
	fands	%f0,	%f21,	%f20
	add	%g4,	%l3,	%g1
	movne	%xcc,	%i0,	%l5
	fmovdleu	%xcc,	%f12,	%f13
	array8	%o6,	%o4,	%i1
	movrlez	%l6,	%g5,	%o3
	smul	%g2,	0x0F71,	%i3
	edge8l	%i7,	%g7,	%o2
	ldd	[%l7 + 0x40],	%o4
	movrlez	%l2,	%i5,	%g3
	fzeros	%f25
	edge8ln	%l1,	%i2,	%o1
	ld	[%l7 + 0x20],	%f0
	fmovse	%icc,	%f0,	%f12
	orn	%g6,	%o7,	%i4
	fmovsa	%icc,	%f2,	%f22
	mova	%xcc,	%o0,	%i6
	movg	%icc,	%l0,	%g4
	ldsh	[%l7 + 0x18],	%l4
	subccc	%g1,	0x10B9,	%i0
	mulx	%l5,	0x0F0E,	%l3
	srlx	%o6,	%i1,	%o4
	ldd	[%l7 + 0x18],	%f26
	popc	%g5,	%o3
	st	%f5,	[%l7 + 0x18]
	fmovsn	%icc,	%f18,	%f11
	subccc	%l6,	0x0ACB,	%i3
	fmovrslz	%g2,	%f14,	%f26
	fmovsa	%xcc,	%f15,	%f31
	addc	%g7,	%o2,	%i7
	movrne	%l2,	%o5,	%i5
	sethi	0x0EAB,	%g3
	sdivcc	%i2,	0x1995,	%l1
	movrlz	%o1,	%g6,	%i4
	sir	0x0985
	movrgz	%o0,	0x080,	%o7
	restore %i6, 0x1C23, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l4,	%g1,	%i0
	fmovdpos	%icc,	%f18,	%f20
	fmuld8ulx16	%f0,	%f15,	%f26
	sllx	%l0,	0x0D,	%l3
	ldsb	[%l7 + 0x54],	%o6
	sra	%i1,	0x16,	%o4
	movcs	%icc,	%g5,	%o3
	movpos	%icc,	%l6,	%i3
	sir	0x0356
	edge32ln	%g2,	%l5,	%o2
	faligndata	%f10,	%f10,	%f30
	edge32l	%g7,	%l2,	%i7
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	movgu	%xcc,	%i2,	%l1
	sdivx	%o1,	0x06F6,	%g6
	restore %i4, 0x0F88, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o7,	%i5,	%g4
	for	%f30,	%f0,	%f6
	umulcc	%i6,	0x021F,	%l4
	movgu	%xcc,	%g1,	%i0
	movl	%xcc,	%l0,	%l3
	fandnot2s	%f23,	%f12,	%f29
	move	%icc,	%o6,	%i1
	array32	%g5,	%o3,	%l6
	fmovsn	%icc,	%f10,	%f9
	movg	%icc,	%o4,	%g2
	add	%l5,	%o2,	%i3
	fmovdgu	%icc,	%f2,	%f29
	subccc	%l2,	%i7,	%g7
	movvs	%icc,	%o5,	%i2
	fors	%f31,	%f17,	%f9
	fmovsge	%icc,	%f23,	%f3
	stx	%l1,	[%l7 + 0x08]
	fornot2	%f28,	%f6,	%f2
	ld	[%l7 + 0x4C],	%f4
	xor	%o1,	%g6,	%i4
	fcmpne32	%f10,	%f24,	%o0
	fmovsl	%icc,	%f27,	%f20
	edge8l	%o7,	%i5,	%g3
	mulx	%i6,	0x03AB,	%l4
	fsrc2	%f24,	%f22
	ldub	[%l7 + 0x6A],	%g4
	fmovdpos	%icc,	%f17,	%f23
	fones	%f9
	edge8l	%g1,	%i0,	%l0
	movle	%icc,	%o6,	%l3
	addccc	%g5,	0x0E30,	%o3
	fpadd16s	%f23,	%f19,	%f26
	stb	%l6,	[%l7 + 0x3A]
	xorcc	%i1,	%o4,	%g2
	stb	%o2,	[%l7 + 0x68]
	fnegs	%f14,	%f3
	umulcc	%l5,	0x1691,	%l2
	movcc	%xcc,	%i3,	%i7
	ldd	[%l7 + 0x48],	%g6
	movle	%icc,	%o5,	%i2
	ldd	[%l7 + 0x78],	%f18
	ldd	[%l7 + 0x18],	%f2
	stb	%o1,	[%l7 + 0x53]
	subcc	%g6,	0x114E,	%i4
	movrlz	%o0,	0x26F,	%o7
	movl	%xcc,	%i5,	%g3
	udiv	%l1,	0x164D,	%i6
	fcmped	%fcc1,	%f4,	%f22
	fmovrslz	%l4,	%f31,	%f28
	fmovda	%xcc,	%f25,	%f6
	movg	%icc,	%g1,	%g4
	srl	%i0,	0x0D,	%l0
	movrne	%l3,	%g5,	%o3
	addc	%o6,	%i1,	%l6
	sll	%o4,	0x1B,	%g2
	srax	%l5,	%o2,	%l2
	sth	%i7,	[%l7 + 0x40]
	array8	%i3,	%o5,	%i2
	addc	%g7,	%g6,	%o1
	sra	%o0,	0x0B,	%o7
	addcc	%i5,	%i4,	%l1
	edge8n	%i6,	%g3,	%l4
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	fmovsleu	%icc,	%f0,	%f8
	fabsd	%f0,	%f14
	movge	%xcc,	%l0,	%i0
	mulscc	%l3,	%g5,	%o6
	smulcc	%o3,	%l6,	%i1
	fpadd32s	%f22,	%f14,	%f23
	mulx	%o4,	%g2,	%o2
	fands	%f31,	%f5,	%f16
	movvc	%xcc,	%l2,	%l5
	fnegd	%f20,	%f2
	fmovdge	%xcc,	%f4,	%f26
	movleu	%xcc,	%i3,	%i7
	edge32	%o5,	%g7,	%g6
	fmovrdlz	%o1,	%f12,	%f16
	ldsb	[%l7 + 0x5F],	%i2
	udiv	%o0,	0x124E,	%i5
	fnot1	%f6,	%f22
	smul	%i4,	0x08B7,	%l1
	fmovdvc	%icc,	%f18,	%f27
	edge16l	%i6,	%g3,	%o7
	subc	%l4,	%g4,	%l0
	sdivx	%g1,	0x08BD,	%i0
	subccc	%g5,	0x0D8D,	%l3
	addc	%o3,	0x0D7D,	%l6
	array16	%i1,	%o6,	%g2
	fmovda	%icc,	%f5,	%f29
	ldx	[%l7 + 0x20],	%o2
	popc	0x1A18,	%l2
	movcs	%xcc,	%l5,	%i3
	fcmps	%fcc2,	%f31,	%f2
	stb	%o4,	[%l7 + 0x63]
	mova	%icc,	%o5,	%i7
	movcs	%xcc,	%g6,	%g7
	save %i2, %o0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i4,	0x15DC,	%o1
	stx	%i6,	[%l7 + 0x50]
	fmovrde	%g3,	%f6,	%f26
	move	%icc,	%o7,	%l4
	movg	%xcc,	%l1,	%g4
	and	%l0,	%i0,	%g1
	andncc	%l3,	%g5,	%l6
	nop
	set	0x33, %l0
	stb	%i1,	[%l7 + %l0]
	sub	%o3,	%g2,	%o6
	movneg	%icc,	%l2,	%l5
	movrlz	%o2,	%i3,	%o5
	stx	%i7,	[%l7 + 0x10]
	addcc	%o4,	%g6,	%g7
	lduw	[%l7 + 0x38],	%i2
	umul	%i5,	%i4,	%o1
	smul	%i6,	%o0,	%o7
	orncc	%l4,	%g3,	%g4
	edge32l	%l1,	%l0,	%g1
	srlx	%i0,	0x02,	%l3
	sir	0x05BC
	movrlz	%g5,	0x3D2,	%l6
	movrne	%o3,	%i1,	%g2
	movg	%xcc,	%o6,	%l5
	movn	%xcc,	%l2,	%i3
	xnor	%o2,	%i7,	%o5
	siam	0x7
	udiv	%o4,	0x102C,	%g6
	fmovrsgz	%g7,	%f7,	%f20
	movrlez	%i5,	0x320,	%i2
	movl	%icc,	%o1,	%i4
	xor	%o0,	0x05E3,	%i6
	ld	[%l7 + 0x44],	%f28
	array32	%o7,	%g3,	%l4
	umulcc	%g4,	%l1,	%l0
	movleu	%icc,	%i0,	%l3
	edge16	%g5,	%g1,	%o3
	movvs	%xcc,	%i1,	%g2
	movg	%icc,	%l6,	%l5
	array8	%l2,	%i3,	%o6
	smulcc	%i7,	%o5,	%o4
	edge32l	%o2,	%g7,	%g6
	ldsw	[%l7 + 0x68],	%i5
	orn	%o1,	%i2,	%i4
	movne	%xcc,	%o0,	%i6
	movle	%icc,	%g3,	%o7
	fmovsn	%xcc,	%f15,	%f18
	movrlz	%g4,	0x139,	%l4
	orcc	%l1,	0x0C4E,	%i0
	alignaddr	%l0,	%g5,	%l3
	edge8	%g1,	%i1,	%o3
	movn	%xcc,	%g2,	%l6
	edge16ln	%l2,	%l5,	%o6
	edge16l	%i7,	%i3,	%o4
	fmul8x16au	%f0,	%f26,	%f22
	addcc	%o5,	0x0967,	%o2
	andn	%g7,	0x1820,	%i5
	edge8l	%g6,	%o1,	%i4
	movl	%xcc,	%i2,	%i6
	fmovrsgez	%g3,	%f18,	%f23
	ldsb	[%l7 + 0x4E],	%o0
	move	%xcc,	%o7,	%g4
	sub	%l4,	%i0,	%l1
	sra	%l0,	%g5,	%g1
	fmul8sux16	%f12,	%f2,	%f0
	alignaddr	%i1,	%o3,	%l3
	edge32ln	%l6,	%l2,	%g2
	siam	0x6
	mulx	%l5,	%o6,	%i7
	stw	%o4,	[%l7 + 0x78]
	nop
	set	0x08, %l5
	std	%f28,	[%l7 + %l5]
	udiv	%o5,	0x1830,	%i3
	fmovsne	%icc,	%f3,	%f2
	save %g7, 0x100B, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i5,	%o1,	%g6
	mulx	%i2,	%i6,	%g3
	sub	%o0,	0x0ED3,	%o7
	ldx	[%l7 + 0x48],	%i4
	edge16l	%g4,	%l4,	%l1
	orcc	%i0,	0x027E,	%l0
	fpadd32	%f8,	%f8,	%f28
	sra	%g5,	0x1C,	%g1
	andcc	%o3,	%i1,	%l6
	movgu	%xcc,	%l3,	%l2
	array8	%g2,	%l5,	%i7
	udiv	%o6,	0x0904,	%o4
	edge32ln	%o5,	%g7,	%o2
	fmovsvc	%icc,	%f30,	%f2
	array16	%i5,	%o1,	%g6
	edge16	%i2,	%i3,	%i6
	nop
	set	0x44, %l1
	lduh	[%l7 + %l1],	%o0
	umulcc	%g3,	0x0D36,	%o7
	movn	%icc,	%g4,	%l4
	udivcc	%i4,	0x09D6,	%i0
	movcs	%xcc,	%l1,	%g5
	move	%icc,	%g1,	%o3
	sth	%l0,	[%l7 + 0x72]
	umul	%l6,	0x1963,	%i1
	fxors	%f31,	%f30,	%f27
	edge16l	%l3,	%l2,	%l5
	subc	%g2,	%i7,	%o6
	fmuld8ulx16	%f30,	%f1,	%f2
	fabss	%f17,	%f19
	movg	%icc,	%o4,	%g7
	srax	%o5,	0x07,	%i5
	andncc	%o2,	%g6,	%o1
	subccc	%i2,	0x0496,	%i6
	orcc	%o0,	0x1DD9,	%g3
	edge32n	%o7,	%i3,	%g4
	movl	%icc,	%i4,	%l4
	subc	%i0,	0x179A,	%g5
	ldsw	[%l7 + 0x24],	%g1
	fpackfix	%f24,	%f3
	fmovdge	%xcc,	%f3,	%f12
	st	%f19,	[%l7 + 0x4C]
	movn	%xcc,	%l1,	%o3
	movg	%xcc,	%l6,	%l0
	movrne	%i1,	%l2,	%l5
	lduh	[%l7 + 0x58],	%g2
	movn	%xcc,	%i7,	%o6
	sub	%l3,	0x0E3B,	%o4
	movrlez	%g7,	0x214,	%o5
	mova	%xcc,	%o2,	%g6
	sethi	0x0ACE,	%o1
	fcmped	%fcc0,	%f16,	%f18
	nop
	set	0x38, %g5
	std	%f14,	[%l7 + %g5]
	fmovspos	%xcc,	%f20,	%f18
	sth	%i5,	[%l7 + 0x0E]
	movrne	%i6,	%i2,	%o0
	edge16n	%o7,	%i3,	%g3
	fpackfix	%f6,	%f27
	edge16ln	%g4,	%i4,	%i0
	ldsb	[%l7 + 0x1D],	%g5
	fmovscs	%xcc,	%f10,	%f16
	movgu	%icc,	%g1,	%l4
	mulscc	%l1,	%o3,	%l0
	movge	%xcc,	%l6,	%i1
	movn	%icc,	%l2,	%l5
	fmovdl	%icc,	%f18,	%f23
	edge8	%g2,	%o6,	%i7
	fnor	%f18,	%f16,	%f8
	addccc	%o4,	%l3,	%g7
	st	%f31,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x6A],	%o5
	movneg	%xcc,	%g6,	%o1
	sdiv	%o2,	0x12E6,	%i6
	ldub	[%l7 + 0x1F],	%i2
	orn	%o0,	%o7,	%i3
	fcmpgt32	%f20,	%f20,	%g3
	andcc	%g4,	%i4,	%i0
	add	%i5,	0x1F33,	%g1
	sdivx	%g5,	0x051A,	%l4
	smulcc	%o3,	0x0ABE,	%l1
	nop
	set	0x16, %g2
	stb	%l0,	[%l7 + %g2]
	ldx	[%l7 + 0x70],	%l6
	umulcc	%i1,	%l5,	%g2
	orncc	%o6,	0x0901,	%i7
	subccc	%o4,	0x0EB1,	%l2
	fandnot1	%f22,	%f0,	%f6
	stx	%l3,	[%l7 + 0x48]
	fpack32	%f30,	%f18,	%f26
	restore %g7, 0x125F, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f5,	%f27
	ld	[%l7 + 0x08],	%f4
	addc	%o5,	0x0ABF,	%o2
	sdivcc	%o1,	0x0B65,	%i2
	mulscc	%i6,	%o0,	%i3
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f18
	movle	%icc,	%g3,	%g4
	sra	%i4,	0x18,	%i0
	ldsh	[%l7 + 0x76],	%i5
	lduh	[%l7 + 0x76],	%o7
	movre	%g5,	0x294,	%g1
	fxnors	%f9,	%f23,	%f22
	std	%f28,	[%l7 + 0x78]
	fmul8x16	%f13,	%f2,	%f22
	lduh	[%l7 + 0x60],	%o3
	sir	0x0C4F
	orcc	%l1,	%l0,	%l6
	movvs	%xcc,	%l4,	%l5
	orcc	%i1,	%g2,	%o6
	movre	%i7,	%l2,	%o4
	srl	%g7,	%g6,	%l3
	edge32n	%o5,	%o1,	%o2
	sth	%i6,	[%l7 + 0x26]
	sdivcc	%i2,	0x00DC,	%i3
	edge32	%o0,	%g3,	%i4
	movvc	%xcc,	%g4,	%i0
	movrgz	%i5,	0x2E6,	%o7
	movneg	%xcc,	%g5,	%g1
	movl	%xcc,	%o3,	%l1
	fcmple32	%f4,	%f6,	%l0
	array8	%l6,	%l5,	%l4
	sth	%g2,	[%l7 + 0x42]
	sdivx	%i1,	0x0A09,	%i7
	movg	%xcc,	%l2,	%o4
	umulcc	%g7,	%o6,	%l3
	orcc	%g6,	0x16FA,	%o1
	andcc	%o5,	%i6,	%o2
	edge16	%i3,	%i2,	%o0
	edge16ln	%g3,	%g4,	%i4
	fsrc2s	%f13,	%f14
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%i5
	sll	%i0,	0x0B,	%g5
	movvc	%xcc,	%o7,	%o3
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	ldd	[%l7 + 0x68],	%f28
	fand	%f2,	%f8,	%f0
	or	%l0,	%l5,	%l4
	fcmple16	%f10,	%f4,	%l6
	subc	%i1,	%i7,	%g2
	edge16	%o4,	%g7,	%l2
	fnot1	%f26,	%f12
	fmovdneg	%xcc,	%f22,	%f25
	edge16	%l3,	%g6,	%o6
	movne	%xcc,	%o1,	%o5
	movrne	%o2,	%i6,	%i2
	udivcc	%i3,	0x0955,	%o0
	save %g4, 0x02E5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f10,	%f6
	srl	%i5,	%i0,	%i4
	edge32l	%g5,	%o7,	%o3
	sdiv	%l1,	0x1180,	%l0
	fnor	%f26,	%f10,	%f22
	fmovdcc	%icc,	%f0,	%f27
	movrgez	%g1,	%l5,	%l6
	or	%l4,	%i1,	%g2
	orcc	%i7,	0x14AF,	%o4
	edge8n	%g7,	%l2,	%g6
	srlx	%l3,	%o6,	%o5
	mulscc	%o2,	0x15D0,	%o1
	orn	%i6,	0x0066,	%i2
	movrlz	%o0,	%i3,	%g4
	fandnot2s	%f19,	%f0,	%f4
	movgu	%xcc,	%i5,	%i0
	srax	%i4,	%g3,	%o7
	alignaddrl	%o3,	%g5,	%l0
	sllx	%g1,	0x07,	%l5
	edge16ln	%l6,	%l1,	%l4
	fmul8x16	%f17,	%f6,	%f12
	edge8l	%g2,	%i7,	%o4
	xor	%g7,	%i1,	%g6
	fnot2s	%f4,	%f14
	edge8	%l3,	%l2,	%o5
	edge16	%o2,	%o1,	%i6
	or	%i2,	0x0222,	%o6
	movl	%icc,	%o0,	%i3
	orcc	%g4,	0x1930,	%i0
	movgu	%xcc,	%i5,	%g3
	movre	%o7,	0x3FA,	%i4
	srlx	%o3,	0x19,	%l0
	fcmpd	%fcc3,	%f8,	%f10
	edge8n	%g5,	%g1,	%l5
	movle	%xcc,	%l6,	%l4
	ld	[%l7 + 0x78],	%f30
	movcc	%xcc,	%l1,	%g2
	move	%icc,	%i7,	%o4
	movpos	%xcc,	%i1,	%g6
	fnot2s	%f8,	%f9
	addccc	%l3,	%l2,	%g7
	ldx	[%l7 + 0x30],	%o5
	edge32	%o1,	%i6,	%o2
	subc	%i2,	%o0,	%o6
	movleu	%icc,	%i3,	%i0
	array8	%g4,	%i5,	%o7
	ldd	[%l7 + 0x40],	%f0
	sll	%i4,	%o3,	%g3
	movcs	%xcc,	%l0,	%g5
	or	%g1,	%l5,	%l4
	movcc	%icc,	%l6,	%g2
	movleu	%icc,	%i7,	%o4
	movrlz	%l1,	%g6,	%l3
	sethi	0x1970,	%l2
	addccc	%i1,	%o5,	%o1
	mulx	%i6,	%o2,	%g7
	fmovsa	%icc,	%f1,	%f4
	movcc	%icc,	%i2,	%o6
	movrgz	%o0,	0x37B,	%i3
	array8	%i0,	%g4,	%i5
	fpsub16	%f30,	%f4,	%f26
	alignaddrl	%o7,	%o3,	%g3
	mova	%xcc,	%l0,	%i4
	fmovsneg	%xcc,	%f19,	%f0
	sll	%g1,	0x04,	%l5
	fmovdneg	%xcc,	%f30,	%f10
	ldsw	[%l7 + 0x40],	%g5
	movrlz	%l4,	%l6,	%i7
	sethi	0x144A,	%g2
	stw	%o4,	[%l7 + 0x24]
	lduw	[%l7 + 0x54],	%l1
	andncc	%l3,	%g6,	%l2
	andncc	%o5,	%o1,	%i1
	udivcc	%o2,	0x13ED,	%g7
	ldx	[%l7 + 0x58],	%i2
	stb	%i6,	[%l7 + 0x31]
	stw	%o6,	[%l7 + 0x54]
	movrlz	%i3,	%i0,	%o0
	orn	%i5,	%o7,	%o3
	sth	%g3,	[%l7 + 0x42]
	or	%g4,	%i4,	%g1
	sdiv	%l0,	0x055D,	%g5
	movle	%icc,	%l5,	%l4
	umul	%i7,	0x1C1E,	%g2
	fnor	%f12,	%f16,	%f14
	movrlez	%l6,	0x1BA,	%l1
	move	%icc,	%o4,	%l3
	movre	%g6,	%l2,	%o1
	array16	%o5,	%o2,	%i1
	edge32l	%g7,	%i2,	%i6
	movrlez	%i3,	0x19E,	%i0
	fcmple32	%f20,	%f4,	%o0
	fcmpd	%fcc1,	%f24,	%f10
	sethi	0x001C,	%i5
	array32	%o6,	%o3,	%g3
	sethi	0x03AD,	%o7
	subccc	%g4,	%g1,	%i4
	lduh	[%l7 + 0x1E],	%l0
	array8	%l5,	%g5,	%l4
	xnor	%i7,	%l6,	%g2
	lduw	[%l7 + 0x28],	%o4
	xnorcc	%l3,	%l1,	%l2
	xorcc	%o1,	%g6,	%o5
	save %o2, %i1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g7,	%i6,	%i0
	movrlez	%i3,	0x2E2,	%o0
	lduw	[%l7 + 0x54],	%i5
	lduh	[%l7 + 0x44],	%o6
	ldsw	[%l7 + 0x64],	%o3
	nop
	set	0x40, %o2
	std	%f10,	[%l7 + %o2]
	stb	%o7,	[%l7 + 0x6D]
	edge8ln	%g3,	%g4,	%g1
	umulcc	%i4,	%l0,	%l5
	restore %l4, %i7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l6,	0x11,	%g2
	stx	%o4,	[%l7 + 0x30]
	fandnot2s	%f5,	%f29,	%f9
	movl	%xcc,	%l1,	%l2
	array16	%o1,	%g6,	%l3
	edge32	%o2,	%i1,	%i2
	edge8n	%g7,	%o5,	%i0
	fmovsne	%icc,	%f14,	%f17
	stb	%i6,	[%l7 + 0x66]
	ldd	[%l7 + 0x68],	%f10
	movneg	%xcc,	%o0,	%i3
	subc	%i5,	0x16B8,	%o3
	stw	%o6,	[%l7 + 0x08]
	movgu	%xcc,	%o7,	%g4
	smul	%g1,	%i4,	%g3
	array32	%l0,	%l5,	%l4
	fmovdne	%icc,	%f12,	%f11
	fors	%f28,	%f27,	%f5
	edge32l	%g5,	%l6,	%g2
	fpadd32	%f22,	%f18,	%f6
	edge8ln	%o4,	%l1,	%l2
	movrgez	%i7,	0x049,	%g6
	orcc	%o1,	0x0934,	%l3
	lduw	[%l7 + 0x14],	%i1
	umul	%i2,	%o2,	%o5
	fpadd16s	%f18,	%f1,	%f8
	smul	%g7,	%i0,	%i6
	xorcc	%i3,	%i5,	%o3
	fmovdn	%icc,	%f23,	%f26
	edge32l	%o0,	%o7,	%g4
	edge32n	%o6,	%i4,	%g1
	edge8l	%g3,	%l0,	%l4
	save %l5, 0x00C7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f7,	%f27,	%f20
	orncc	%l6,	%g2,	%o4
	sdivcc	%l1,	0x0F0B,	%l2
	movvc	%xcc,	%g6,	%i7
	subc	%l3,	%o1,	%i2
	fcmpes	%fcc0,	%f10,	%f11
	fmovdne	%icc,	%f16,	%f31
	movcc	%xcc,	%o2,	%i1
	udiv	%o5,	0x1B1A,	%i0
	fpadd32	%f20,	%f30,	%f16
	fcmpes	%fcc2,	%f27,	%f17
	edge8n	%i6,	%i3,	%g7
	sllx	%i5,	0x1F,	%o3
	fnor	%f4,	%f16,	%f14
	movrne	%o0,	0x1FB,	%g4
	fmovrdne	%o6,	%f10,	%f14
	stw	%o7,	[%l7 + 0x4C]
	fornot1	%f20,	%f4,	%f26
	movrlz	%i4,	0x38E,	%g3
	movn	%icc,	%g1,	%l0
	array16	%l4,	%g5,	%l5
	movre	%l6,	%o4,	%g2
	save %l1, 0x0B97, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i7,	0x029C,	%g6
	edge16n	%l3,	%i2,	%o1
	nop
	set	0x25, %o4
	ldsb	[%l7 + %o4],	%o2
	edge8l	%o5,	%i0,	%i1
	add	%i6,	0x1DBF,	%i3
	edge32	%i5,	%o3,	%o0
	sdivcc	%g4,	0x1182,	%g7
	fmovrdgez	%o7,	%f20,	%f4
	xnorcc	%o6,	0x1FA1,	%i4
	movne	%icc,	%g1,	%g3
	umul	%l4,	0x10CA,	%l0
	movn	%xcc,	%l5,	%l6
	stb	%g5,	[%l7 + 0x77]
	edge16	%g2,	%o4,	%l2
	movrne	%i7,	%l1,	%l3
	movcc	%icc,	%i2,	%o1
	movre	%g6,	%o5,	%i0
	smul	%o2,	%i1,	%i3
	fmovrsgz	%i5,	%f19,	%f3
	fmovse	%icc,	%f26,	%f6
	fexpand	%f7,	%f28
	mulscc	%o3,	0x0FED,	%o0
	fzeros	%f2
	sllx	%g4,	%g7,	%o7
	fmovdcc	%icc,	%f29,	%f23
	addcc	%o6,	0x0FD6,	%i4
	smul	%i6,	0x11AE,	%g3
	movrne	%l4,	%g1,	%l0
	fxors	%f0,	%f9,	%f21
	udivcc	%l6,	0x0310,	%l5
	fcmple16	%f28,	%f30,	%g2
	ldd	[%l7 + 0x68],	%g4
	ldd	[%l7 + 0x48],	%o4
	fornot2s	%f5,	%f19,	%f12
	mulx	%l2,	%l1,	%i7
	fxnor	%f26,	%f20,	%f30
	movrlz	%i2,	0x197,	%l3
	addc	%g6,	0x1C6B,	%o5
	st	%f28,	[%l7 + 0x48]
	save %i0, %o2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i1,	%i3,	%i5
	alignaddr	%o0,	%o3,	%g7
	umul	%o7,	%g4,	%o6
	fmovdleu	%xcc,	%f18,	%f21
	fmovrdne	%i6,	%f20,	%f0
	xnor	%g3,	0x1B31,	%i4
	alignaddr	%g1,	%l4,	%l6
	orncc	%l5,	0x16F2,	%l0
	ldx	[%l7 + 0x30],	%g5
	stw	%o4,	[%l7 + 0x2C]
	fmovdne	%xcc,	%f24,	%f11
	andncc	%g2,	%l1,	%l2
	xor	%i7,	0x07BC,	%l3
	addcc	%g6,	0x0EA7,	%o5
	std	%f18,	[%l7 + 0x20]
	fmovrdlz	%i0,	%f22,	%f14
	fpadd16	%f30,	%f18,	%f6
	sir	0x0C9D
	edge8l	%i2,	%o1,	%o2
	fnot1	%f20,	%f30
	ldx	[%l7 + 0x68],	%i3
	sth	%i1,	[%l7 + 0x3A]
	edge16n	%o0,	%i5,	%o3
	orncc	%o7,	%g4,	%g7
	stb	%i6,	[%l7 + 0x49]
	ldsb	[%l7 + 0x46],	%g3
	nop
	set	0x79, %g7
	ldsb	[%l7 + %g7],	%o6
	array8	%i4,	%g1,	%l6
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	fmul8x16au	%f16,	%f21,	%f2
	ldsh	[%l7 + 0x26],	%g5
	ld	[%l7 + 0x64],	%f4
	stx	%o4,	[%l7 + 0x28]
	fornot1	%f30,	%f8,	%f8
	movvc	%xcc,	%l5,	%l1
	sth	%g2,	[%l7 + 0x18]
	fpsub32s	%f0,	%f18,	%f18
	fsrc1s	%f27,	%f29
	smulcc	%i7,	%l3,	%l2
	movle	%xcc,	%g6,	%o5
	fpmerge	%f3,	%f1,	%f26
	mulx	%i2,	0x1407,	%o1
	sllx	%o2,	%i3,	%i1
	srl	%i0,	0x1B,	%o0
	umul	%i5,	0x007F,	%o7
	popc	%o3,	%g4
	subc	%g7,	0x01E5,	%i6
	orncc	%g3,	0x05CC,	%i4
	movgu	%xcc,	%g1,	%l6
	ldd	[%l7 + 0x50],	%f22
	fmul8x16au	%f20,	%f22,	%f28
	addc	%o6,	%l4,	%g5
	fmovscs	%icc,	%f30,	%f15
	movvs	%xcc,	%l0,	%l5
	siam	0x6
	movvs	%icc,	%l1,	%g2
	orcc	%o4,	0x14E3,	%i7
	fsrc2s	%f22,	%f22
	fmovdne	%xcc,	%f0,	%f10
	restore %l2, 0x1A9A, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f18,	%f20,	%g6
	fsrc1	%f24,	%f28
	array32	%o5,	%o1,	%i2
	fsrc2	%f14,	%f12
	fnot2	%f8,	%f8
	ld	[%l7 + 0x2C],	%f18
	movrne	%i3,	%o2,	%i1
	fmovsneg	%xcc,	%f16,	%f5
	udiv	%o0,	0x1E8D,	%i0
	movl	%xcc,	%o7,	%o3
	udivcc	%i5,	0x19A0,	%g4
	movrgz	%g7,	0x168,	%g3
	sdiv	%i6,	0x1030,	%g1
	orncc	%l6,	0x1870,	%o6
	movvc	%icc,	%l4,	%g5
	fandnot2	%f0,	%f16,	%f14
	fmovdcs	%icc,	%f15,	%f17
	fcmps	%fcc1,	%f25,	%f17
	stb	%l0,	[%l7 + 0x6F]
	xorcc	%i4,	%l5,	%g2
	ldsh	[%l7 + 0x64],	%o4
	ldub	[%l7 + 0x7D],	%l1
	sll	%l2,	%i7,	%l3
	fmul8sux16	%f8,	%f30,	%f6
	sdiv	%g6,	0x1EDA,	%o1
	move	%icc,	%o5,	%i3
	fornot2	%f8,	%f6,	%f26
	nop
	set	0x1F, %i0
	stb	%o2,	[%l7 + %i0]
	movne	%xcc,	%i2,	%i1
	movgu	%xcc,	%o0,	%i0
	sub	%o7,	%i5,	%g4
	popc	0x1315,	%o3
	ld	[%l7 + 0x5C],	%f13
	xnorcc	%g3,	0x0058,	%g7
	movl	%xcc,	%i6,	%l6
	fmovrse	%o6,	%f16,	%f9
	lduh	[%l7 + 0x34],	%g1
	and	%g5,	0x1779,	%l4
	array32	%i4,	%l5,	%g2
	udivx	%o4,	0x0769,	%l0
	sdivx	%l2,	0x00C3,	%i7
	sir	0x04AD
	ldd	[%l7 + 0x28],	%f18
	edge32n	%l1,	%l3,	%o1
	ldx	[%l7 + 0x58],	%g6
	umul	%i3,	0x09D7,	%o2
	stb	%i2,	[%l7 + 0x0B]
	fnand	%f16,	%f26,	%f10
	fmovsge	%xcc,	%f20,	%f9
	fmovscc	%xcc,	%f12,	%f1
	fmovrdgz	%i1,	%f14,	%f30
	fmovs	%f19,	%f22
	movn	%icc,	%o5,	%i0
	andn	%o0,	%i5,	%g4
	srl	%o7,	%g3,	%o3
	mova	%xcc,	%i6,	%l6
	fzeros	%f27
	movgu	%icc,	%o6,	%g1
	subccc	%g5,	0x0B06,	%g7
	fmovdgu	%xcc,	%f13,	%f17
	nop
	set	0x7A, %i5
	ldsh	[%l7 + %i5],	%l4
	add	%l5,	0x15E5,	%i4
	orn	%o4,	0x058D,	%g2
	orncc	%l0,	0x0FF7,	%i7
	fcmpeq16	%f16,	%f28,	%l2
	std	%f10,	[%l7 + 0x70]
	fandnot2	%f6,	%f4,	%f28
	ldx	[%l7 + 0x38],	%l1
	movle	%xcc,	%l3,	%o1
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%i2
	stx	%g6,	[%l7 + 0x58]
	andcc	%i2,	0x0031,	%o2
	movrgz	%i1,	0x275,	%o5
	movle	%icc,	%i0,	%o0
	umulcc	%i5,	0x0BE8,	%g4
	st	%f19,	[%l7 + 0x44]
	srax	%g3,	%o7,	%o3
	ldd	[%l7 + 0x38],	%f16
	sethi	0x17FB,	%i6
	ld	[%l7 + 0x34],	%f9
	fone	%f4
	xnor	%o6,	%g1,	%l6
	ldd	[%l7 + 0x68],	%f8
	movle	%xcc,	%g5,	%l4
	sllx	%l5,	0x0C,	%g7
	fnot1	%f22,	%f12
	srlx	%o4,	0x05,	%g2
	movcs	%icc,	%l0,	%i4
	movrlez	%i7,	0x336,	%l2
	popc	0x1594,	%l1
	movrlez	%o1,	0x1F2,	%i3
	movneg	%icc,	%l3,	%i2
	smul	%g6,	0x01C0,	%o2
	addc	%i1,	%o5,	%o0
	ldd	[%l7 + 0x38],	%i4
	lduh	[%l7 + 0x4E],	%i0
	ldx	[%l7 + 0x58],	%g4
	xnor	%o7,	0x00F0,	%g3
	movrlz	%o3,	0x01E,	%i6
	xnor	%g1,	0x075C,	%o6
	fnand	%f4,	%f10,	%f16
	andncc	%g5,	%l4,	%l6
	smulcc	%l5,	0x19C9,	%o4
	fandnot1	%f16,	%f20,	%f0
	edge8n	%g7,	%l0,	%i4
	lduh	[%l7 + 0x7C],	%i7
	ld	[%l7 + 0x44],	%f13
	movcc	%icc,	%g2,	%l1
	sdiv	%l2,	0x08A2,	%i3
	movle	%icc,	%l3,	%i2
	std	%f10,	[%l7 + 0x60]
	edge32l	%g6,	%o2,	%i1
	addcc	%o1,	%o5,	%i5
	srlx	%o0,	0x1F,	%g4
	movrne	%i0,	%g3,	%o7
	fmovdne	%xcc,	%f6,	%f12
	fones	%f13
	andn	%o3,	0x1388,	%g1
	ld	[%l7 + 0x44],	%f25
	fmovrslz	%i6,	%f7,	%f23
	fmovdleu	%xcc,	%f26,	%f13
	ld	[%l7 + 0x64],	%f2
	sdivcc	%o6,	0x1F32,	%g5
	fzeros	%f31
	xnorcc	%l6,	%l5,	%o4
	add	%g7,	0x0328,	%l4
	addcc	%l0,	%i7,	%g2
	mulx	%l1,	%l2,	%i3
	movn	%icc,	%l3,	%i4
	movne	%icc,	%g6,	%i2
	movneg	%icc,	%o2,	%i1
	edge16ln	%o1,	%o5,	%i5
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%o0
	movrgez	%g4,	0x286,	%g3
	ldd	[%l7 + 0x40],	%i0
	fmovdgu	%xcc,	%f17,	%f7
	sir	0x0F03
	sir	0x0700
	movneg	%xcc,	%o7,	%g1
	udiv	%o3,	0x1945,	%o6
	array32	%g5,	%l6,	%l5
	sir	0x08EE
	save %i6, 0x0A11, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l4,	%o4,	%i7
	fpsub32	%f6,	%f20,	%f2
	srax	%g2,	%l0,	%l2
	ld	[%l7 + 0x2C],	%f6
	umul	%i3,	%l3,	%l1
	edge32	%i4,	%i2,	%o2
	subc	%g6,	0x1E8F,	%o1
	edge16n	%i1,	%i5,	%o0
	fmovspos	%xcc,	%f4,	%f29
	andn	%o5,	%g4,	%i0
	srlx	%o7,	%g1,	%g3
	std	%f22,	[%l7 + 0x30]
	sth	%o3,	[%l7 + 0x4E]
	ldsh	[%l7 + 0x3E],	%o6
	fmovrse	%g5,	%f18,	%f1
	edge32n	%l5,	%i6,	%g7
	fmovrslez	%l4,	%f13,	%f18
	fmovdleu	%xcc,	%f3,	%f17
	movvc	%xcc,	%l6,	%i7
	sethi	0x0E15,	%o4
	subcc	%g2,	0x174E,	%l2
	xor	%i3,	0x14D5,	%l3
	or	%l0,	0x02A6,	%i4
	movrgz	%i2,	0x089,	%l1
	movl	%xcc,	%g6,	%o1
	ldub	[%l7 + 0x21],	%i1
	move	%icc,	%o2,	%i5
	popc	0x1C6A,	%o5
	save %o0, 0x1507, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o7,	0x0D7F,	%g1
	movpos	%xcc,	%g3,	%o3
	fxors	%f14,	%f15,	%f23
	ldd	[%l7 + 0x60],	%f30
	orncc	%o6,	0x114E,	%i0
	movrgez	%l5,	0x19F,	%g5
	xnorcc	%g7,	0x0476,	%i6
	ldsb	[%l7 + 0x71],	%l4
	addc	%i7,	%o4,	%g2
	fmuld8sux16	%f2,	%f20,	%f14
	subc	%l2,	%i3,	%l3
	array16	%l0,	%i4,	%l6
	xnorcc	%l1,	%g6,	%o1
	edge8ln	%i2,	%i1,	%i5
	fmovd	%f22,	%f10
	udivx	%o2,	0x1015,	%o5
	fmuld8sux16	%f31,	%f17,	%f22
	sdivcc	%g4,	0x1E08,	%o7
	alignaddrl	%o0,	%g1,	%g3
	sdivx	%o3,	0x0540,	%i0
	addccc	%l5,	0x1CD5,	%o6
	ldsb	[%l7 + 0x51],	%g5
	fornot2	%f2,	%f4,	%f20
	addccc	%i6,	%l4,	%g7
	fornot2	%f0,	%f8,	%f8
	fmovrdne	%o4,	%f16,	%f6
	edge8ln	%g2,	%i7,	%i3
	stx	%l3,	[%l7 + 0x30]
	fpsub16s	%f11,	%f0,	%f8
	movvs	%icc,	%l2,	%i4
	sdiv	%l6,	0x0F62,	%l0
	sth	%l1,	[%l7 + 0x54]
	xorcc	%g6,	%o1,	%i1
	lduh	[%l7 + 0x5E],	%i2
	sethi	0x11CD,	%o2
	stw	%i5,	[%l7 + 0x34]
	ldd	[%l7 + 0x38],	%o4
	ldd	[%l7 + 0x18],	%f26
	fsrc1	%f22,	%f30
	addcc	%o7,	%o0,	%g4
	fxnor	%f6,	%f2,	%f28
	fmovse	%xcc,	%f2,	%f29
	smulcc	%g1,	0x133F,	%o3
	std	%f20,	[%l7 + 0x68]
	fmovrde	%i0,	%f12,	%f26
	ld	[%l7 + 0x6C],	%f9
	fmovscs	%icc,	%f21,	%f5
	array32	%l5,	%o6,	%g5
	fornot1s	%f12,	%f23,	%f9
	edge32n	%g3,	%l4,	%g7
	ldd	[%l7 + 0x68],	%f28
	srlx	%o4,	0x01,	%i6
	fmovdn	%xcc,	%f9,	%f12
	lduw	[%l7 + 0x48],	%i7
	fmovrdlz	%i3,	%f26,	%f18
	fandnot1s	%f10,	%f8,	%f10
	fmovscs	%icc,	%f31,	%f16
	edge8n	%g2,	%l2,	%i4
	fnands	%f9,	%f26,	%f8
	fmovsge	%xcc,	%f23,	%f30
	fand	%f16,	%f20,	%f12
	alignaddrl	%l6,	%l3,	%l0
	movle	%icc,	%g6,	%o1
	alignaddr	%i1,	%l1,	%i2
	ldd	[%l7 + 0x20],	%f4
	alignaddrl	%i5,	%o5,	%o2
	sub	%o0,	%g4,	%o7
	fpadd32	%f8,	%f16,	%f8
	nop
	set	0x58, %i6
	std	%f26,	[%l7 + %i6]
	edge8n	%o3,	%i0,	%g1
	move	%icc,	%l5,	%o6
	sth	%g3,	[%l7 + 0x4E]
	srlx	%g5,	0x02,	%g7
	sth	%o4,	[%l7 + 0x5A]
	edge8ln	%i6,	%i7,	%l4
	movpos	%icc,	%i3,	%l2
	sdivx	%i4,	0x02DB,	%l6
	edge32	%l3,	%l0,	%g6
	fmovdcc	%icc,	%f1,	%f4
	xnor	%g2,	0x0DCD,	%i1
	orcc	%l1,	0x0FBE,	%i2
	fsrc1	%f28,	%f18
	andn	%i5,	0x07AE,	%o5
	stx	%o2,	[%l7 + 0x68]
	sdiv	%o0,	0x1C7B,	%o1
	sethi	0x089C,	%g4
	fsrc2s	%f25,	%f18
	lduw	[%l7 + 0x4C],	%o3
	or	%o7,	%i0,	%l5
	fmovrdlz	%g1,	%f2,	%f16
	ld	[%l7 + 0x4C],	%f9
	movleu	%icc,	%o6,	%g5
	ldsb	[%l7 + 0x4C],	%g7
	fmovsn	%xcc,	%f27,	%f17
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	ld	[%l7 + 0x10],	%f27
	ldub	[%l7 + 0x1A],	%o4
	sra	%i7,	%i3,	%l4
	array8	%l2,	%l6,	%i4
	fmovde	%xcc,	%f15,	%f4
	edge16ln	%l3,	%g6,	%g2
	edge32ln	%l0,	%l1,	%i1
	fxors	%f23,	%f15,	%f26
	ld	[%l7 + 0x48],	%f6
	udivx	%i2,	0x1ECC,	%i5
	fxnor	%f12,	%f18,	%f22
	subc	%o2,	0x0213,	%o0
	subc	%o1,	0x14A2,	%o5
	fcmpne16	%f0,	%f6,	%g4
	srax	%o7,	%o3,	%l5
	movrne	%i0,	%o6,	%g1
	popc	0x0E68,	%g7
	xnorcc	%g5,	0x0B57,	%i6
	sllx	%o4,	%i7,	%g3
	movrlz	%l4,	%l2,	%l6
	edge16n	%i4,	%i3,	%l3
	sdivx	%g6,	0x16A7,	%g2
	fmovsgu	%xcc,	%f16,	%f5
	xorcc	%l0,	%i1,	%l1
	fmovdneg	%xcc,	%f18,	%f7
	subccc	%i5,	0x0FEA,	%o2
	fpsub16s	%f15,	%f25,	%f3
	ldsb	[%l7 + 0x12],	%i2
	movrlez	%o0,	%o5,	%o1
	ldub	[%l7 + 0x10],	%o7
	fpackfix	%f0,	%f24
	movrgz	%g4,	0x239,	%l5
	lduw	[%l7 + 0x60],	%o3
	udivx	%i0,	0x09FA,	%g1
	addccc	%g7,	0x154E,	%g5
	ldsw	[%l7 + 0x1C],	%i6
	movrne	%o6,	%o4,	%i7
	smulcc	%g3,	0x039A,	%l4
	sub	%l6,	%l2,	%i4
	udivcc	%i3,	0x06C0,	%l3
	movrgez	%g6,	0x1B6,	%g2
	movle	%icc,	%l0,	%i1
	orcc	%i5,	0x1264,	%o2
	smulcc	%l1,	%o0,	%i2
	fmovsgu	%icc,	%f26,	%f16
	std	%f0,	[%l7 + 0x70]
	fmovrsgz	%o5,	%f27,	%f9
	fcmple16	%f20,	%f2,	%o7
	or	%g4,	%o1,	%o3
	fmovdg	%xcc,	%f12,	%f18
	fpackfix	%f0,	%f7
	movl	%xcc,	%l5,	%i0
	movcc	%icc,	%g7,	%g5
	xorcc	%i6,	%o6,	%g1
	fnegs	%f22,	%f7
	subcc	%i7,	0x1DD4,	%o4
	xnorcc	%l4,	%g3,	%l2
	addcc	%i4,	0x1BD6,	%i3
	fand	%f24,	%f18,	%f22
	fmovrse	%l3,	%f7,	%f5
	fpsub16	%f0,	%f8,	%f30
	fmuld8sux16	%f0,	%f11,	%f6
	lduw	[%l7 + 0x60],	%g6
	edge8l	%l6,	%l0,	%i1
	movvs	%icc,	%g2,	%o2
	movneg	%xcc,	%i5,	%o0
	movrlez	%i2,	0x124,	%l1
	fmovrdlez	%o5,	%f6,	%f18
	edge8ln	%o7,	%o1,	%o3
	fmovrdgz	%g4,	%f12,	%f0
	movl	%xcc,	%l5,	%g7
	edge8n	%i0,	%i6,	%g5
	movle	%icc,	%g1,	%i7
	xnor	%o4,	0x1D9E,	%l4
	movvs	%icc,	%o6,	%l2
	movpos	%xcc,	%i4,	%g3
	fnegs	%f29,	%f20
	fpack32	%f10,	%f24,	%f28
	edge8n	%l3,	%i3,	%l6
	fmovsvs	%icc,	%f13,	%f21
	edge16l	%g6,	%i1,	%l0
	movneg	%icc,	%g2,	%o2
	addc	%o0,	%i2,	%l1
	stx	%i5,	[%l7 + 0x18]
	udivx	%o7,	0x0E30,	%o1
	andn	%o3,	0x1310,	%g4
	move	%xcc,	%o5,	%g7
	fmovrdlez	%l5,	%f2,	%f16
	fmovdcs	%icc,	%f11,	%f2
	udivcc	%i0,	0x139F,	%i6
	add	%g5,	%i7,	%g1
	addc	%o4,	0x010C,	%o6
	save %l4, 0x1D33, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g3,	%i4,	%i3
	fcmpeq32	%f20,	%f20,	%l3
	edge16n	%l6,	%i1,	%g6
	popc	0x115B,	%g2
	addc	%o2,	0x1A81,	%l0
	edge32l	%o0,	%l1,	%i2
	smul	%i5,	0x17AD,	%o1
	fnor	%f20,	%f14,	%f12
	addc	%o7,	0x1DD0,	%o3
	save %o5, 0x0CF7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g4,	%l5
	andncc	%i0,	%i6,	%g5
	movrlez	%g1,	%i7,	%o4
	fmovrdlz	%l4,	%f2,	%f12
	sdiv	%l2,	0x06B6,	%g3
	fmovsle	%xcc,	%f23,	%f17
	restore %i4, %i3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o6,	0x1571,	%i1
	sll	%g6,	%l6,	%o2
	movleu	%xcc,	%l0,	%g2
	andcc	%o0,	%l1,	%i2
	fmovsneg	%xcc,	%f9,	%f1
	fandnot1	%f4,	%f14,	%f14
	lduh	[%l7 + 0x76],	%i5
	movge	%icc,	%o1,	%o3
	nop
	set	0x29, %i3
	ldub	[%l7 + %i3],	%o5
	fmovrsgz	%o7,	%f6,	%f24
	sub	%g7,	0x173A,	%l5
	fmovsa	%xcc,	%f22,	%f13
	nop
	set	0x50, %l4
	ldsh	[%l7 + %l4],	%g4
	mulscc	%i6,	0x0894,	%g5
	movleu	%xcc,	%i0,	%g1
	edge8ln	%i7,	%l4,	%l2
	sir	0x0C4C
	fsrc1	%f18,	%f24
	nop
	set	0x4C, %g3
	stw	%g3,	[%l7 + %g3]
	movre	%i4,	%o4,	%l3
	sdivcc	%i3,	0x1D32,	%i1
	smulcc	%g6,	0x1D18,	%l6
	sth	%o2,	[%l7 + 0x08]
	fmovrdlz	%o6,	%f10,	%f0
	andn	%l0,	%g2,	%o0
	st	%f7,	[%l7 + 0x50]
	orcc	%l1,	%i5,	%i2
	movcc	%xcc,	%o3,	%o1
	fmovsleu	%icc,	%f26,	%f26
	fmovrdgz	%o5,	%f8,	%f26
	faligndata	%f18,	%f20,	%f16
	subc	%g7,	0x0CD3,	%o7
	movcs	%icc,	%l5,	%i6
	lduh	[%l7 + 0x3C],	%g5
	udiv	%g4,	0x19B0,	%i0
	ldd	[%l7 + 0x08],	%i6
	smulcc	%g1,	0x1F76,	%l2
	fnot1s	%f9,	%f16
	movrlz	%g3,	0x2B1,	%l4
	movle	%icc,	%o4,	%i4
	fpadd16	%f24,	%f26,	%f4
	udiv	%i3,	0x027A,	%i1
	fmovsleu	%icc,	%f21,	%f11
	fpsub16	%f0,	%f16,	%f20
	nop
	set	0x08, %g6
	stx	%l3,	[%l7 + %g6]
	stx	%l6,	[%l7 + 0x50]
	andcc	%g6,	%o2,	%o6
	edge8	%l0,	%o0,	%l1
	udivx	%i5,	0x0F30,	%i2
	movge	%xcc,	%o3,	%g2
	sra	%o1,	%o5,	%g7
	movvs	%icc,	%l5,	%o7
	ldx	[%l7 + 0x58],	%i6
	movre	%g5,	%g4,	%i7
	fmovsvs	%xcc,	%f30,	%f3
	fxors	%f2,	%f17,	%f27
	fsrc1	%f20,	%f10
	mulscc	%i0,	%l2,	%g1
	fones	%f16
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	mulx	%i4,	0x1192,	%g3
	sdivcc	%i3,	0x0F63,	%i1
	xorcc	%l6,	%g6,	%l3
	fmovs	%f25,	%f2
	movre	%o6,	%o2,	%o0
	movne	%icc,	%l1,	%l0
	udivx	%i2,	0x0AD5,	%o3
	movvc	%icc,	%g2,	%i5
	movrgz	%o1,	0x19E,	%o5
	fcmps	%fcc3,	%f1,	%f16
	xnorcc	%l5,	0x11A9,	%g7
	popc	0x127F,	%i6
	xor	%g5,	0x01AB,	%o7
	fmovrde	%g4,	%f20,	%f30
	nop
	set	0x47, %o0
	ldsb	[%l7 + %o0],	%i7
	or	%l2,	0x0E40,	%i0
	fmovdpos	%icc,	%f23,	%f16
	addcc	%l4,	%o4,	%i4
	st	%f27,	[%l7 + 0x30]
	sub	%g1,	%i3,	%i1
	sethi	0x1914,	%l6
	edge16n	%g3,	%l3,	%o6
	movrlez	%o2,	%o0,	%g6
	movpos	%icc,	%l0,	%l1
	fmovsne	%icc,	%f5,	%f5
	ldx	[%l7 + 0x30],	%o3
	movvc	%xcc,	%g2,	%i5
	movn	%xcc,	%o1,	%i2
	udivcc	%l5,	0x1068,	%o5
	fmovd	%f2,	%f8
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f12
	srl	%i6,	%g5,	%o7
	fcmpd	%fcc0,	%f30,	%f22
	edge32ln	%g4,	%i7,	%l2
	edge8	%g7,	%i0,	%l4
	srl	%i4,	0x15,	%o4
	fnands	%f30,	%f11,	%f12
	edge32ln	%i3,	%g1,	%l6
	nop
	set	0x3C, %l3
	lduw	[%l7 + %l3],	%i1
	movvc	%icc,	%l3,	%o6
	stb	%g3,	[%l7 + 0x0A]
	sra	%o0,	%o2,	%g6
	edge8ln	%l0,	%l1,	%g2
	std	%f4,	[%l7 + 0x18]
	edge32n	%i5,	%o3,	%i2
	smulcc	%l5,	%o5,	%o1
	sdiv	%g5,	0x1346,	%o7
	srl	%i6,	%g4,	%l2
	movrne	%g7,	0x1E4,	%i0
	orncc	%i7,	%l4,	%o4
	move	%icc,	%i3,	%g1
	stb	%l6,	[%l7 + 0x47]
	edge32	%i4,	%l3,	%i1
	movl	%icc,	%g3,	%o6
	ldsw	[%l7 + 0x6C],	%o2
	movvs	%xcc,	%g6,	%l0
	addccc	%o0,	0x1904,	%l1
	movle	%xcc,	%i5,	%o3
	movre	%g2,	%i2,	%l5
	movneg	%xcc,	%o5,	%o1
	mova	%icc,	%g5,	%o7
	movvs	%xcc,	%i6,	%g4
	alignaddrl	%l2,	%g7,	%i0
	std	%f16,	[%l7 + 0x60]
	faligndata	%f8,	%f24,	%f12
	stx	%l4,	[%l7 + 0x48]
	sth	%i7,	[%l7 + 0x2A]
	xor	%i3,	%g1,	%l6
	std	%f18,	[%l7 + 0x78]
	umul	%o4,	0x0D01,	%l3
	sir	0x1261
	sdiv	%i4,	0x049D,	%i1
	stx	%g3,	[%l7 + 0x20]
	subcc	%o2,	0x0DEE,	%o6
	movrne	%g6,	0x086,	%l0
	edge32ln	%o0,	%l1,	%i5
	move	%icc,	%o3,	%i2
	subc	%g2,	%l5,	%o1
	restore %o5, 0x026D, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i6,	0x0C,	%g5
	sra	%l2,	%g4,	%g7
	movleu	%xcc,	%l4,	%i0
	movvs	%icc,	%i7,	%g1
	xnorcc	%i3,	0x1092,	%o4
	mulx	%l6,	%i4,	%i1
	sdivx	%g3,	0x1A13,	%o2
	fmovrdgz	%l3,	%f0,	%f8
	ldx	[%l7 + 0x60],	%o6
	movcs	%icc,	%l0,	%g6
	subccc	%o0,	%l1,	%i5
	popc	%i2,	%g2
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	edge16n	%o5,	%o7,	%l5
	save %i6, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f26,	%f12
	fnot2s	%f5,	%f26
	pdist	%f12,	%f22,	%f4
	srax	%g7,	%l4,	%g4
	edge8	%i0,	%i7,	%g1
	fnands	%f29,	%f18,	%f7
	fmovsge	%icc,	%f0,	%f27
	umulcc	%i3,	0x0422,	%o4
	edge8ln	%l6,	%i4,	%i1
	stw	%g3,	[%l7 + 0x18]
	edge32l	%l3,	%o2,	%l0
	sll	%o6,	%o0,	%g6
	movcs	%xcc,	%i5,	%i2
	xorcc	%l1,	0x18F8,	%g2
	movrgez	%o1,	0x3DC,	%o5
	fmovrsgez	%o7,	%f31,	%f5
	movneg	%icc,	%l5,	%i6
	fpadd32s	%f22,	%f27,	%f4
	fpackfix	%f2,	%f22
	st	%f26,	[%l7 + 0x78]
	fnor	%f26,	%f16,	%f8
	movle	%xcc,	%g5,	%l2
	fsrc1s	%f31,	%f22
	move	%xcc,	%o3,	%g7
	xorcc	%g4,	%l4,	%i0
	fxor	%f28,	%f28,	%f2
	stw	%i7,	[%l7 + 0x1C]
	movcs	%xcc,	%g1,	%o4
	fmovs	%f16,	%f15
	st	%f30,	[%l7 + 0x74]
	edge32	%l6,	%i3,	%i1
	alignaddrl	%i4,	%l3,	%g3
	edge32ln	%l0,	%o2,	%o6
	fexpand	%f29,	%f2
	fornot1s	%f5,	%f13,	%f0
	fpmerge	%f26,	%f27,	%f10
	edge32l	%g6,	%i5,	%o0
	nop
	set	0x16, %i2
	ldsh	[%l7 + %i2],	%l1
	array16	%i2,	%o1,	%o5
	umulcc	%o7,	0x047D,	%l5
	and	%g2,	%g5,	%i6
	edge8l	%l2,	%o3,	%g7
	lduw	[%l7 + 0x38],	%l4
	restore %i0, 0x0866, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%g1,	%l6
	movrne	%o4,	%i1,	%i4
	fandnot2s	%f28,	%f21,	%f1
	fmul8x16au	%f29,	%f25,	%f26
	fnors	%f5,	%f6,	%f13
	fpsub32	%f16,	%f26,	%f30
	subcc	%l3,	%i3,	%g3
	movrlez	%o2,	0x11C,	%l0
	fnors	%f2,	%f5,	%f7
	edge32	%o6,	%i5,	%o0
	ldsw	[%l7 + 0x74],	%g6
	lduw	[%l7 + 0x60],	%l1
	orcc	%i2,	0x1150,	%o5
	fmovrdlz	%o7,	%f28,	%f0
	srl	%o1,	%g2,	%l5
	sra	%g5,	%l2,	%o3
	fmovdvs	%icc,	%f20,	%f12
	movvs	%xcc,	%g7,	%i6
	mulx	%i0,	%l4,	%g4
	orn	%g1,	0x16A1,	%i7
	udivx	%l6,	0x1F09,	%i1
	srax	%i4,	0x1D,	%o4
	fandnot1	%f6,	%f4,	%f4
	movre	%i3,	%g3,	%o2
	ldx	[%l7 + 0x50],	%l3
	movl	%xcc,	%o6,	%i5
	movleu	%icc,	%l0,	%g6
	umulcc	%l1,	%o0,	%i2
	movrlez	%o7,	0x251,	%o1
	movvc	%icc,	%o5,	%g2
	edge16l	%l5,	%g5,	%o3
	mulscc	%g7,	%i6,	%l2
	array32	%i0,	%g4,	%g1
	movl	%xcc,	%i7,	%l4
	fxor	%f2,	%f24,	%f6
	movneg	%icc,	%i1,	%i4
	fxors	%f17,	%f30,	%f22
	popc	%o4,	%l6
	umulcc	%i3,	0x1B8A,	%g3
	sll	%l3,	%o6,	%i5
	array16	%l0,	%g6,	%o2
	fmul8x16al	%f16,	%f20,	%f4
	fmovsg	%xcc,	%f15,	%f16
	ld	[%l7 + 0x68],	%f11
	mova	%icc,	%o0,	%l1
	array8	%i2,	%o1,	%o7
	addccc	%g2,	0x165E,	%o5
	orn	%g5,	%o3,	%g7
	mulx	%l5,	0x0A0A,	%i6
	alignaddrl	%l2,	%i0,	%g1
	popc	%i7,	%g4
	srax	%i1,	0x03,	%l4
	fmovspos	%xcc,	%f21,	%f12
	fmovsl	%icc,	%f4,	%f19
	movcs	%icc,	%o4,	%i4
	edge32ln	%l6,	%i3,	%g3
	edge8n	%l3,	%i5,	%o6
	movle	%xcc,	%l0,	%o2
	smulcc	%g6,	0x1EE6,	%l1
	movrlz	%i2,	%o1,	%o0
	sdiv	%g2,	0x1758,	%o5
	fmovsle	%icc,	%f28,	%f30
	sth	%o7,	[%l7 + 0x5A]
	addc	%o3,	0x0E93,	%g5
	edge16	%l5,	%g7,	%l2
	array32	%i0,	%g1,	%i7
	fmovrsgez	%i6,	%f13,	%f10
	fmovs	%f1,	%f2
	srax	%g4,	%i1,	%l4
	fmovrslz	%o4,	%f9,	%f29
	fmovdne	%xcc,	%f22,	%f15
	add	%l6,	0x04A5,	%i4
	fmovdl	%icc,	%f28,	%f1
	movrne	%i3,	%l3,	%g3
	fnor	%f12,	%f6,	%f20
	movre	%i5,	%o6,	%l0
	ld	[%l7 + 0x1C],	%f16
	edge8	%o2,	%g6,	%l1
	mova	%icc,	%i2,	%o0
	udivcc	%o1,	0x0BAF,	%g2
	umulcc	%o7,	0x18E3,	%o3
	sir	0x0F02
	fcmpeq16	%f20,	%f16,	%o5
	ldd	[%l7 + 0x30],	%g4
	movre	%l5,	0x2B9,	%l2
	movg	%icc,	%g7,	%g1
	subc	%i0,	0x08EA,	%i6
	siam	0x4
	fcmpd	%fcc3,	%f4,	%f2
	mulscc	%g4,	0x1A5F,	%i1
	sll	%i7,	%o4,	%l4
	ld	[%l7 + 0x14],	%f8
	xor	%i4,	0x1538,	%l6
	array8	%l3,	%i3,	%i5
	udiv	%g3,	0x0FE6,	%l0
	ldsw	[%l7 + 0x40],	%o2
	ldd	[%l7 + 0x70],	%f30
	movvs	%xcc,	%g6,	%o6
	nop
	set	0x1C, %o5
	ldsw	[%l7 + %o5],	%i2
	std	%f0,	[%l7 + 0x30]
	addcc	%o0,	%o1,	%l1
	movge	%xcc,	%g2,	%o3
	save %o7, %g5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f2,	%f14,	%f14
	movvs	%icc,	%o5,	%g7
	edge8l	%g1,	%l2,	%i6
	movn	%icc,	%g4,	%i0
	edge16	%i7,	%i1,	%o4
	edge8	%i4,	%l6,	%l3
	popc	0x105F,	%l4
	sllx	%i5,	0x09,	%i3
	movvc	%xcc,	%l0,	%g3
	alignaddrl	%g6,	%o2,	%i2
	move	%icc,	%o0,	%o1
	xnor	%o6,	0x041A,	%l1
	stb	%g2,	[%l7 + 0x66]
	movcc	%xcc,	%o3,	%o7
	ldx	[%l7 + 0x60],	%l5
	sra	%g5,	%o5,	%g7
	addcc	%l2,	0x1338,	%i6
	fnegs	%f27,	%f29
	edge16	%g1,	%i0,	%g4
	sdivx	%i1,	0x18B5,	%o4
	movneg	%icc,	%i4,	%l6
	fmovdcc	%xcc,	%f17,	%f5
	fnot1	%f0,	%f0
	edge16l	%i7,	%l4,	%l3
	or	%i5,	0x1071,	%i3
	subccc	%l0,	%g3,	%g6
	fone	%f14
	ld	[%l7 + 0x64],	%f26
	addcc	%o2,	0x033B,	%o0
	fxor	%f8,	%f30,	%f8
	srl	%i2,	%o1,	%l1
	movge	%icc,	%g2,	%o6
	fcmple32	%f2,	%f28,	%o7
	udivcc	%l5,	0x1D0C,	%g5
	sll	%o5,	0x07,	%g7
	nop
	set	0x6C, %o3
	ldsh	[%l7 + %o3],	%o3
	smulcc	%i6,	%l2,	%g1
	fmovscc	%xcc,	%f7,	%f28
	fmovsvc	%icc,	%f26,	%f29
	ldub	[%l7 + 0x3B],	%g4
	subcc	%i1,	%o4,	%i0
	fmuld8sux16	%f0,	%f20,	%f2
	movcc	%icc,	%l6,	%i4
	lduh	[%l7 + 0x0A],	%i7
	fpack16	%f12,	%f2
	edge16n	%l3,	%l4,	%i5
	sdivcc	%l0,	0x0425,	%g3
	subc	%i3,	%g6,	%o2
	edge32n	%o0,	%i2,	%l1
	fpsub16	%f20,	%f10,	%f6
	fandnot1s	%f21,	%f13,	%f0
	movvs	%xcc,	%g2,	%o6
	stx	%o1,	[%l7 + 0x78]
	ld	[%l7 + 0x14],	%f19
	movrne	%o7,	0x121,	%g5
	movgu	%xcc,	%l5,	%o5
	fmuld8sux16	%f15,	%f30,	%f30
	udivcc	%g7,	0x1F60,	%i6
	move	%icc,	%l2,	%g1
	fmovdge	%icc,	%f6,	%f12
	sll	%o3,	%i1,	%o4
	move	%icc,	%g4,	%l6
	orn	%i0,	%i4,	%l3
	nop
	set	0x70, %i4
	lduh	[%l7 + %i4],	%i7
	add	%l4,	%i5,	%g3
	andcc	%l0,	0x10AF,	%i3
	movcs	%icc,	%o2,	%o0
	udivx	%g6,	0x15F0,	%i2
	movcs	%icc,	%l1,	%o6
	movne	%xcc,	%g2,	%o1
	alignaddr	%o7,	%g5,	%o5
	movre	%l5,	%i6,	%g7
	stb	%g1,	[%l7 + 0x74]
	movvs	%xcc,	%l2,	%o3
	array8	%o4,	%g4,	%l6
	fmovsneg	%icc,	%f26,	%f30
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	udiv	%i1,	0x0465,	%i7
	fornot1s	%f0,	%f16,	%f17
	sdivx	%l4,	0x0832,	%l3
	ldd	[%l7 + 0x68],	%f6
	edge16l	%i5,	%l0,	%i3
	sllx	%g3,	%o0,	%o2
	edge32ln	%i2,	%g6,	%o6
	movvs	%xcc,	%g2,	%o1
	edge16l	%o7,	%l1,	%o5
	ldx	[%l7 + 0x68],	%l5
	movl	%xcc,	%i6,	%g7
	movn	%xcc,	%g5,	%g1
	stx	%o3,	[%l7 + 0x58]
	orn	%o4,	0x162B,	%l2
	ldx	[%l7 + 0x68],	%l6
	movvc	%icc,	%g4,	%i0
	fmovdg	%icc,	%f3,	%f2
	std	%f24,	[%l7 + 0x30]
	ldd	[%l7 + 0x68],	%i0
	edge16	%i4,	%i7,	%l3
	andncc	%i5,	%l0,	%l4
	fmovdgu	%icc,	%f19,	%f5
	subccc	%g3,	%o0,	%i3
	fnot2s	%f0,	%f29
	sethi	0x1A31,	%o2
	and	%g6,	%i2,	%g2
	sdivx	%o6,	0x1C76,	%o7
	xnor	%o1,	%o5,	%l5
	sll	%l1,	0x10,	%g7
	movcs	%xcc,	%g5,	%g1
	popc	0x0D95,	%i6
	lduw	[%l7 + 0x38],	%o4
	andn	%o3,	0x0522,	%l2
	sllx	%g4,	0x0C,	%l6
	sll	%i0,	0x06,	%i1
	edge32n	%i7,	%l3,	%i5
	xnorcc	%l0,	0x1DBE,	%i4
	fones	%f2
	array16	%l4,	%g3,	%i3
	sth	%o2,	[%l7 + 0x40]
	popc	0x0055,	%g6
	sethi	0x1F7F,	%i2
	andncc	%g2,	%o6,	%o7
	sir	0x1106
	mova	%xcc,	%o1,	%o5
	fmovdvc	%icc,	%f4,	%f6
	edge16	%l5,	%l1,	%g7
	srl	%g5,	0x1E,	%g1
	fmovrdgez	%o0,	%f6,	%f30
	fmovdcc	%xcc,	%f28,	%f29
	movrlz	%o4,	0x002,	%o3
	mova	%icc,	%l2,	%g4
	movrlz	%i6,	%l6,	%i0
	mova	%xcc,	%i1,	%l3
	popc	%i5,	%i7
	orn	%i4,	%l0,	%g3
	movge	%xcc,	%i3,	%o2
	movrlz	%g6,	0x109,	%i2
	movcc	%icc,	%l4,	%g2
	move	%xcc,	%o7,	%o1
	fmul8x16al	%f30,	%f13,	%f22
	srax	%o6,	%l5,	%l1
	fcmped	%fcc1,	%f14,	%f6
	edge16l	%g7,	%g5,	%g1
	sdiv	%o0,	0x06F0,	%o4
	movleu	%xcc,	%o3,	%o5
	sllx	%l2,	0x03,	%i6
	subc	%l6,	%i0,	%g4
	edge8	%i1,	%i5,	%l3
	fmovrslez	%i4,	%f31,	%f4
	edge32l	%i7,	%l0,	%i3
	fpadd32s	%f6,	%f18,	%f23
	movle	%icc,	%g3,	%o2
	movge	%icc,	%i2,	%g6
	movcc	%xcc,	%g2,	%o7
	fnands	%f25,	%f27,	%f10
	andn	%l4,	0x1176,	%o6
	edge16	%o1,	%l5,	%l1
	st	%f23,	[%l7 + 0x60]
	movl	%icc,	%g5,	%g1
	fone	%f0
	fands	%f23,	%f4,	%f2
	stw	%o0,	[%l7 + 0x64]
	sth	%o4,	[%l7 + 0x72]
	fabss	%f17,	%f29
	fxor	%f14,	%f16,	%f2
	movvs	%xcc,	%o3,	%g7
	sll	%o5,	%l2,	%i6
	movvc	%icc,	%l6,	%i0
	fpadd32	%f30,	%f10,	%f28
	umul	%g4,	%i5,	%i1
	ldsh	[%l7 + 0x64],	%l3
	umul	%i4,	0x0310,	%l0
	stw	%i7,	[%l7 + 0x0C]
	stw	%i3,	[%l7 + 0x74]
	movrne	%o2,	%i2,	%g3
	ldd	[%l7 + 0x28],	%g6
	movg	%icc,	%o7,	%l4
	movpos	%xcc,	%g2,	%o1
	udivcc	%l5,	0x0328,	%l1
	sdivcc	%g5,	0x15F3,	%g1
	st	%f29,	[%l7 + 0x7C]
	movne	%icc,	%o6,	%o4
	fmovse	%xcc,	%f19,	%f30
	sub	%o3,	%o0,	%g7
	fmovdge	%xcc,	%f22,	%f30
	smulcc	%o5,	%l2,	%i6
	movleu	%icc,	%i0,	%l6
	movrlez	%g4,	0x1E5,	%i5
	fcmpeq32	%f4,	%f4,	%i1
	fnot1s	%f25,	%f19
	sir	0x149D
	fmovsneg	%icc,	%f8,	%f11
	mulx	%l3,	0x0D95,	%i4
	andn	%l0,	0x1256,	%i7
	edge32l	%o2,	%i2,	%g3
	andncc	%g6,	%i3,	%l4
	addc	%g2,	%o7,	%l5
	udivcc	%l1,	0x19F3,	%o1
	movrne	%g5,	%g1,	%o4
	movvc	%xcc,	%o3,	%o0
	ld	[%l7 + 0x1C],	%f30
	srax	%g7,	0x05,	%o5
	nop
	set	0x3E, %l2
	lduh	[%l7 + %l2],	%o6
	fsrc1s	%f4,	%f0
	ldx	[%l7 + 0x48],	%i6
	edge32n	%l2,	%l6,	%i0
	fzeros	%f28
	fmul8x16au	%f21,	%f16,	%f2
	lduh	[%l7 + 0x3A],	%i5
	mulscc	%i1,	0x1176,	%g4
	fmovsleu	%icc,	%f18,	%f21
	sdiv	%l3,	0x1EC1,	%i4
	fmovd	%f10,	%f22
	fandnot1s	%f0,	%f10,	%f23
	edge8	%i7,	%o2,	%i2
	umulcc	%l0,	0x0846,	%g6
	xnorcc	%i3,	0x1270,	%g3
	fcmple32	%f30,	%f30,	%l4
	edge16n	%o7,	%g2,	%l1
	mulx	%l5,	0x0164,	%g5
	fpackfix	%f24,	%f14
	movrne	%g1,	%o1,	%o4
	ldx	[%l7 + 0x60],	%o0
	fmovdg	%xcc,	%f14,	%f31
	edge8l	%g7,	%o3,	%o5
	fabss	%f4,	%f22
	fmovdl	%xcc,	%f21,	%f4
	movrlz	%o6,	%l2,	%l6
	fpsub32s	%f31,	%f17,	%f4
	fcmped	%fcc1,	%f10,	%f24
	xnor	%i6,	0x0CAE,	%i5
	sethi	0x1DDD,	%i1
	ld	[%l7 + 0x78],	%f18
	stb	%i0,	[%l7 + 0x33]
	fnegs	%f5,	%f6
	movg	%xcc,	%g4,	%l3
	edge32n	%i4,	%i7,	%i2
	fandnot1s	%f2,	%f23,	%f27
	subcc	%l0,	%o2,	%g6
	movge	%xcc,	%g3,	%l4
	array32	%i3,	%g2,	%l1
	faligndata	%f6,	%f20,	%f14
	movge	%xcc,	%l5,	%g5
	edge16l	%g1,	%o7,	%o4
	movrgez	%o0,	%o1,	%o3
	sra	%o5,	0x10,	%g7
	ldd	[%l7 + 0x30],	%f26
	subccc	%l2,	0x0F39,	%l6
	fpsub16	%f26,	%f8,	%f10
	movcc	%xcc,	%o6,	%i5
	xnor	%i6,	0x1D5E,	%i0
	fmovrde	%g4,	%f8,	%f2
	xor	%i1,	0x1DA4,	%i4
	ldx	[%l7 + 0x48],	%i7
	stb	%i2,	[%l7 + 0x25]
	fmovd	%f12,	%f12
	restore %l3, %o2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g3,	%l4,	%i3
	sub	%g2,	%l0,	%l5
	fnegs	%f5,	%f22
	fmovrslz	%l1,	%f27,	%f16
	fmovdleu	%icc,	%f26,	%f31
	movge	%icc,	%g5,	%o7
	array16	%o4,	%o0,	%o1
	fand	%f22,	%f6,	%f12
	edge32ln	%g1,	%o5,	%o3
	siam	0x2
	edge32	%g7,	%l6,	%o6
	ldub	[%l7 + 0x61],	%i5
	movleu	%icc,	%l2,	%i6
	movrgez	%g4,	%i1,	%i0
	movl	%icc,	%i7,	%i4
	ldsh	[%l7 + 0x58],	%i2
	mulx	%o2,	%l3,	%g6
	array32	%l4,	%g3,	%g2
	fmovrdgez	%l0,	%f6,	%f8
	movl	%icc,	%i3,	%l5
	orcc	%g5,	0x0EF7,	%l1
	stw	%o7,	[%l7 + 0x14]
	edge16ln	%o0,	%o1,	%o4
	addc	%o5,	%o3,	%g7
	edge8	%g1,	%o6,	%l6
	movleu	%icc,	%i5,	%l2
	array32	%g4,	%i6,	%i0
	fpmerge	%f12,	%f13,	%f12
	fornot1s	%f22,	%f0,	%f8
	mulscc	%i7,	0x02FE,	%i1
	umulcc	%i2,	0x1BD5,	%o2
	orn	%i4,	%l3,	%g6
	andncc	%l4,	%g3,	%l0
	save %g2, 0x0123, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1B],	%g5
	movre	%l5,	0x1CB,	%o7
	ldsb	[%l7 + 0x37],	%o0
	fpack32	%f4,	%f2,	%f22
	fcmpeq32	%f12,	%f2,	%o1
	fmovdn	%xcc,	%f31,	%f14
	nop
	set	0x18, %l6
	ldsh	[%l7 + %l6],	%l1
	stw	%o5,	[%l7 + 0x50]
	fmovsle	%xcc,	%f11,	%f28
	srlx	%o3,	%o4,	%g1
	andn	%o6,	%g7,	%l6
	fmovscc	%icc,	%f17,	%f5
	edge32ln	%i5,	%g4,	%i6
	fmul8ulx16	%f8,	%f28,	%f30
	nop
	set	0x3C, %o7
	ldsw	[%l7 + %o7],	%l2
	edge16l	%i7,	%i1,	%i2
	smul	%o2,	0x1F58,	%i4
	movpos	%icc,	%i0,	%l3
	fmovsg	%icc,	%f24,	%f11
	sir	0x16B5
	mova	%icc,	%g6,	%g3
	or	%l0,	%l4,	%g2
	fmovsleu	%icc,	%f4,	%f21
	andcc	%g5,	0x0E60,	%i3
	movre	%o7,	0x2AF,	%o0
	fmovrdlz	%o1,	%f18,	%f18
	srlx	%l5,	0x0D,	%l1
	fnand	%f28,	%f22,	%f16
	edge8l	%o5,	%o4,	%o3
	stb	%o6,	[%l7 + 0x34]
	movleu	%xcc,	%g7,	%g1
	orcc	%i5,	%g4,	%l6
	movvc	%xcc,	%i6,	%l2
	fmovdle	%icc,	%f14,	%f10
	sll	%i7,	0x01,	%i2
	and	%i1,	0x11BB,	%o2
	ldsh	[%l7 + 0x68],	%i0
	movpos	%icc,	%l3,	%g6
	sll	%i4,	%l0,	%l4
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	fpmerge	%f2,	%f5,	%f26
	and	%g2,	0x1D0C,	%o7
	fmovrsgez	%o0,	%f7,	%f25
	srl	%o1,	%i3,	%l5
	movpos	%icc,	%o5,	%o4
	movpos	%icc,	%l1,	%o3
	xorcc	%g7,	%o6,	%g1
	st	%f22,	[%l7 + 0x24]
	fsrc2s	%f29,	%f6
	save %g4, 0x0894, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%l2,	%i7
	movrgz	%i2,	%l6,	%o2
	edge16ln	%i1,	%i0,	%g6
	movvc	%xcc,	%l3,	%l0
	andncc	%i4,	%g3,	%l4
	edge8ln	%g5,	%o7,	%g2
	xnorcc	%o1,	0x16CC,	%i3
	orncc	%o0,	%l5,	%o5
	xnorcc	%o4,	%o3,	%l1
	addc	%o6,	0x04A9,	%g7
	ldd	[%l7 + 0x78],	%g0
	orn	%i5,	%g4,	%l2
	movvs	%icc,	%i6,	%i7
	sethi	0x1AB7,	%i2
	fmovrslez	%l6,	%f23,	%f6
	movne	%xcc,	%i1,	%i0
	xorcc	%o2,	0x0B3C,	%g6
	orn	%l0,	0x0108,	%l3
	fmovrslez	%i4,	%f13,	%f5
	lduw	[%l7 + 0x14],	%l4
	movn	%xcc,	%g3,	%g5
	sdivx	%g2,	0x108B,	%o7
	ldub	[%l7 + 0x78],	%o1
	ldd	[%l7 + 0x08],	%i2
	stb	%o0,	[%l7 + 0x12]
	st	%f5,	[%l7 + 0x1C]
	fmovdn	%icc,	%f0,	%f31
	std	%f12,	[%l7 + 0x38]
	ldub	[%l7 + 0x37],	%o5
	and	%o4,	0x1377,	%o3
	orcc	%l1,	%l5,	%o6
	ldub	[%l7 + 0x5F],	%g7
	ldsh	[%l7 + 0x74],	%g1
	fmovrdgez	%i5,	%f20,	%f20
	sllx	%l2,	%g4,	%i6
	movcs	%icc,	%i2,	%i7
	fnors	%f26,	%f28,	%f23
	movrne	%i1,	%i0,	%l6
	andn	%o2,	%g6,	%l3
	ldx	[%l7 + 0x78],	%l0
	fsrc1s	%f24,	%f26
	orn	%l4,	0x1DE0,	%g3
	edge8l	%i4,	%g2,	%o7
	edge32l	%g5,	%i3,	%o0
	fandnot1	%f24,	%f12,	%f6
	ldsh	[%l7 + 0x76],	%o5
	edge32ln	%o4,	%o1,	%l1
	popc	%l5,	%o3
	fnot2s	%f6,	%f19
	edge16n	%g7,	%o6,	%i5
	edge32	%g1,	%g4,	%l2
	lduh	[%l7 + 0x5A],	%i6
	fnot1s	%f1,	%f29
	mulscc	%i7,	%i2,	%i0
	alignaddrl	%l6,	%o2,	%i1
	movneg	%icc,	%g6,	%l0
	movre	%l3,	0x127,	%l4
	movl	%xcc,	%i4,	%g2
	ldd	[%l7 + 0x40],	%g2
	movl	%xcc,	%g5,	%i3
	nop
	set	0x14, %i1
	sth	%o7,	[%l7 + %i1]
	array8	%o0,	%o5,	%o1
	addcc	%o4,	%l5,	%l1
	and	%o3,	0x1661,	%g7
	xor	%o6,	%i5,	%g4
	sdivx	%g1,	0x153B,	%i6
	fmul8sux16	%f6,	%f26,	%f30
	save %i7, %i2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f23,	%f4,	%f21
	ldsw	[%l7 + 0x14],	%l6
	sir	0x1C51
	xnor	%o2,	%i0,	%g6
	sra	%i1,	0x19,	%l3
	movle	%icc,	%l0,	%l4
	addc	%i4,	%g3,	%g2
	or	%i3,	0x0CA0,	%g5
	fzero	%f26
	sdivx	%o7,	0x0BDE,	%o5
	mulscc	%o0,	%o1,	%o4
	movgu	%icc,	%l5,	%l1
	fnegd	%f10,	%f10
	umul	%g7,	%o3,	%i5
	andncc	%g4,	%o6,	%i6
	stb	%i7,	[%l7 + 0x6B]
	smulcc	%i2,	%l2,	%l6
	popc	%o2,	%g1
	restore %g6, 0x0C25, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l3,	%l0,	%l4
	fmovrde	%i4,	%f20,	%f28
	fmovs	%f23,	%f22
	fmovrdlez	%i1,	%f18,	%f2
	edge8n	%g3,	%g2,	%i3
	sra	%g5,	0x11,	%o5
	st	%f6,	[%l7 + 0x34]
	subc	%o0,	0x15EF,	%o1
	ldd	[%l7 + 0x38],	%o4
	fmovdne	%icc,	%f18,	%f13
	sir	0x19A2
	addcc	%o7,	%l1,	%g7
	or	%l5,	0x16B5,	%o3
	lduh	[%l7 + 0x40],	%i5
	fmovs	%f31,	%f24
	fcmpd	%fcc1,	%f6,	%f2
	srlx	%g4,	%o6,	%i7
	sethi	0x05D3,	%i6
	fmul8x16	%f10,	%f4,	%f30
	movle	%icc,	%l2,	%l6
	array32	%o2,	%g1,	%g6
	fsrc2	%f24,	%f8
	orn	%i0,	%l3,	%i2
	srl	%l4,	0x0B,	%i4
	fornot2	%f18,	%f28,	%f28
	fmovrde	%i1,	%f22,	%f0
	mova	%icc,	%g3,	%l0
	movcc	%xcc,	%g2,	%g5
	srax	%o5,	0x1F,	%o0
	fsrc2s	%f5,	%f0
	addc	%o1,	%o4,	%o7
	xorcc	%l1,	0x0BD6,	%g7
	andcc	%l5,	0x0A7F,	%o3
	fmul8x16	%f7,	%f12,	%f28
	fabsd	%f8,	%f22
	fzeros	%f24
	ldd	[%l7 + 0x38],	%f14
	movre	%i5,	0x31F,	%g4
	edge16n	%i3,	%i7,	%i6
	sdivcc	%l2,	0x0BB8,	%l6
	movgu	%xcc,	%o6,	%g1
	xorcc	%g6,	0x0B5E,	%i0
	movvs	%xcc,	%o2,	%l3
	movre	%i2,	%i4,	%l4
	andncc	%i1,	%g3,	%l0
	fornot1s	%f29,	%f3,	%f13
	lduw	[%l7 + 0x3C],	%g5
	fzero	%f18
	movpos	%icc,	%g2,	%o0
	fpsub16	%f20,	%f0,	%f24
	udiv	%o5,	0x1329,	%o1
	edge16n	%o7,	%o4,	%g7
	edge32ln	%l1,	%o3,	%i5
	ldd	[%l7 + 0x20],	%l4
	srax	%i3,	%i7,	%g4
	fmovdvc	%icc,	%f14,	%f31
	edge16	%i6,	%l2,	%o6
	lduh	[%l7 + 0x16],	%g1
	movrlez	%g6,	%l6,	%i0
	addccc	%l3,	0x0AF2,	%i2
	movrgz	%o2,	%l4,	%i4
	alignaddrl	%g3,	%i1,	%l0
	fmovdvc	%icc,	%f23,	%f5
	edge8n	%g5,	%g2,	%o0
	smul	%o1,	0x11FB,	%o5
	edge8l	%o7,	%o4,	%g7
	nop
	set	0x58, %l5
	stx	%o3,	[%l7 + %l5]
	smulcc	%l1,	%l5,	%i3
	udivcc	%i5,	0x0A33,	%i7
	xor	%i6,	%g4,	%l2
	fmovdl	%icc,	%f19,	%f10
	orn	%g1,	%g6,	%l6
	popc	0x0EE3,	%i0
	fmovdle	%icc,	%f25,	%f28
	ldsh	[%l7 + 0x3E],	%l3
	popc	0x05F6,	%o6
	sll	%i2,	%o2,	%l4
	fmovrde	%g3,	%f8,	%f20
	xor	%i1,	%i4,	%l0
	addcc	%g5,	0x1322,	%o0
	xor	%g2,	0x1722,	%o1
	umul	%o5,	0x1DF7,	%o4
	ld	[%l7 + 0x68],	%f22
	fpsub16	%f28,	%f22,	%f6
	ldd	[%l7 + 0x48],	%f2
	movg	%icc,	%g7,	%o7
	mova	%xcc,	%l1,	%o3
	fandnot2s	%f11,	%f8,	%f24
	array8	%i3,	%l5,	%i5
	faligndata	%f22,	%f26,	%f18
	edge8ln	%i7,	%g4,	%l2
	movrlez	%g1,	0x09C,	%g6
	stw	%l6,	[%l7 + 0x30]
	move	%icc,	%i6,	%i0
	xnor	%o6,	0x1273,	%i2
	movleu	%xcc,	%l3,	%o2
	movvc	%icc,	%l4,	%g3
	sll	%i1,	%i4,	%g5
	andncc	%o0,	%g2,	%o1
	sub	%l0,	%o4,	%g7
	ldsw	[%l7 + 0x7C],	%o7
	xnor	%l1,	%o3,	%i3
	edge16l	%o5,	%i5,	%i7
	sth	%l5,	[%l7 + 0x34]
	udivx	%g4,	0x0449,	%l2
	fornot1	%f18,	%f0,	%f16
	fsrc1s	%f8,	%f31
	srax	%g1,	0x19,	%g6
	move	%xcc,	%i6,	%l6
	fcmps	%fcc3,	%f15,	%f6
	fxnors	%f26,	%f20,	%f5
	sdivx	%i0,	0x01C4,	%o6
	umul	%l3,	0x07D7,	%i2
	ldub	[%l7 + 0x37],	%l4
	std	%f12,	[%l7 + 0x60]
	ldd	[%l7 + 0x70],	%g2
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f14
	subcc	%o2,	%i4,	%i1
	or	%g5,	%o0,	%o1
	movneg	%xcc,	%l0,	%g2
	fmovspos	%xcc,	%f18,	%f9
	xnorcc	%g7,	%o4,	%l1
	sdivcc	%o3,	0x0E55,	%o7
	fmovsge	%icc,	%f6,	%f19
	movrne	%i3,	0x192,	%i5
	edge16ln	%o5,	%i7,	%g4
	fnot2	%f6,	%f2
	xnorcc	%l5,	0x0DBA,	%l2
	edge32ln	%g6,	%g1,	%l6
	edge16l	%i0,	%o6,	%l3
	movl	%icc,	%i6,	%i2
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f2
	srax	%g3,	0x03,	%l4
	xnor	%o2,	0x13DC,	%i4
	movrlz	%i1,	%o0,	%g5
	srl	%o1,	%g2,	%g7
	mova	%icc,	%l0,	%o4
	orcc	%o3,	%l1,	%o7
	fmovrdne	%i3,	%f28,	%f18
	fmovda	%icc,	%f28,	%f12
	movre	%o5,	%i5,	%g4
	fandnot2	%f18,	%f8,	%f4
	orn	%l5,	0x1A99,	%i7
	edge32ln	%l2,	%g1,	%g6
	andncc	%i0,	%o6,	%l3
	fpackfix	%f24,	%f3
	ldsb	[%l7 + 0x47],	%l6
	stw	%i2,	[%l7 + 0x68]
	edge16	%i6,	%l4,	%o2
	alignaddr	%g3,	%i1,	%i4
	ldsb	[%l7 + 0x23],	%o0
	for	%f24,	%f26,	%f6
	fxor	%f16,	%f2,	%f16
	array8	%g5,	%o1,	%g7
	andn	%l0,	0x03BA,	%g2
	mova	%icc,	%o4,	%o3
	st	%f22,	[%l7 + 0x5C]
	lduh	[%l7 + 0x24],	%o7
	movrlz	%i3,	%l1,	%o5
	movgu	%xcc,	%g4,	%i5
	fcmple32	%f18,	%f24,	%i7
	ldd	[%l7 + 0x68],	%f30
	ldsh	[%l7 + 0x24],	%l5
	fmovscc	%icc,	%f29,	%f13
	sll	%l2,	0x1C,	%g6
	ldsb	[%l7 + 0x66],	%g1
	std	%f0,	[%l7 + 0x08]
	sllx	%i0,	%l3,	%l6
	fabsd	%f24,	%f26
	fmovsge	%icc,	%f30,	%f18
	movrgz	%i2,	0x1FD,	%o6
	xor	%l4,	%i6,	%o2
	andncc	%i1,	%i4,	%o0
	fmovscc	%xcc,	%f10,	%f27
	stw	%g5,	[%l7 + 0x3C]
	sllx	%g3,	0x0F,	%g7
	array8	%o1,	%g2,	%l0
	ld	[%l7 + 0x44],	%f3
	stw	%o3,	[%l7 + 0x74]
	srlx	%o4,	0x09,	%o7
	movge	%xcc,	%i3,	%l1
	sethi	0x0B20,	%o5
	movvs	%icc,	%g4,	%i5
	movre	%l5,	%l2,	%i7
	array8	%g1,	%g6,	%l3
	movne	%icc,	%l6,	%i2
	fmovdne	%xcc,	%f21,	%f13
	mulx	%o6,	0x1959,	%l4
	mulscc	%i0,	0x11DA,	%o2
	movrgez	%i1,	%i6,	%i4
	addc	%g5,	%o0,	%g3
	edge32	%g7,	%g2,	%l0
	srl	%o3,	%o4,	%o7
	fpack32	%f8,	%f2,	%f28
	addc	%i3,	%l1,	%o5
	ldx	[%l7 + 0x50],	%o1
	xnor	%g4,	%l5,	%l2
	edge32n	%i5,	%i7,	%g1
	edge16ln	%l3,	%g6,	%i2
	movrlz	%l6,	0x16B,	%o6
	edge32	%l4,	%o2,	%i0
	fandnot1	%f24,	%f28,	%f30
	movle	%xcc,	%i6,	%i4
	smulcc	%i1,	0x1935,	%g5
	ldsw	[%l7 + 0x6C],	%g3
	addcc	%g7,	0x0249,	%o0
	subcc	%g2,	0x17F4,	%o3
	movrlz	%o4,	0x380,	%l0
	edge8n	%o7,	%l1,	%o5
	stw	%i3,	[%l7 + 0x78]
	fmovdleu	%icc,	%f9,	%f11
	fornot1s	%f1,	%f2,	%f14
	fornot1s	%f31,	%f19,	%f24
	orncc	%g4,	0x01CD,	%o1
	ldd	[%l7 + 0x50],	%l4
	move	%xcc,	%i5,	%i7
	fsrc2	%f20,	%f2
	ldx	[%l7 + 0x30],	%g1
	addcc	%l3,	%l2,	%i2
	edge16l	%g6,	%o6,	%l6
	fand	%f22,	%f2,	%f12
	xnorcc	%l4,	%o2,	%i6
	alignaddr	%i4,	%i1,	%g5
	array8	%i0,	%g7,	%g3
	mulscc	%o0,	0x160C,	%g2
	andcc	%o3,	%o4,	%l0
	stw	%o7,	[%l7 + 0x28]
	alignaddrl	%l1,	%i3,	%o5
	movpos	%xcc,	%o1,	%g4
	udiv	%l5,	0x128D,	%i7
	fmovde	%xcc,	%f28,	%f20
	fmul8x16	%f10,	%f4,	%f22
	orn	%g1,	0x1076,	%i5
	edge16ln	%l2,	%l3,	%i2
	srlx	%g6,	0x1F,	%o6
	movne	%icc,	%l4,	%l6
	ldd	[%l7 + 0x48],	%f8
	andn	%o2,	0x16D9,	%i6
	subc	%i4,	0x1759,	%i1
	srax	%g5,	%i0,	%g7
	srl	%g3,	0x04,	%o0
	smulcc	%o3,	%g2,	%o4
	ldsh	[%l7 + 0x28],	%l0
	edge32	%o7,	%i3,	%o5
	ldsh	[%l7 + 0x0A],	%l1
	fabsd	%f12,	%f20
	fmovdl	%icc,	%f27,	%f15
	ldd	[%l7 + 0x30],	%f2
	movle	%xcc,	%o1,	%g4
	sdiv	%l5,	0x1243,	%i7
	fcmpgt32	%f10,	%f6,	%i5
	mova	%xcc,	%g1,	%l2
	movpos	%icc,	%l3,	%g6
	ldsh	[%l7 + 0x3A],	%i2
	edge32n	%o6,	%l6,	%o2
	edge32	%i6,	%i4,	%i1
	st	%f18,	[%l7 + 0x5C]
	fxnors	%f16,	%f15,	%f3
	nop
	set	0x08, %g5
	std	%f18,	[%l7 + %g5]
	edge8n	%g5,	%i0,	%g7
	stx	%l4,	[%l7 + 0x28]
	for	%f30,	%f14,	%f24
	sll	%g3,	%o3,	%o0
	orncc	%g2,	0x1483,	%l0
	edge32l	%o7,	%o4,	%o5
	alignaddrl	%l1,	%o1,	%g4
	alignaddrl	%i3,	%i7,	%i5
	sdivcc	%g1,	0x16C9,	%l5
	or	%l3,	%g6,	%l2
	movleu	%xcc,	%i2,	%l6
	or	%o6,	%i6,	%o2
	nop
	set	0x4E, %g1
	sth	%i4,	[%l7 + %g1]
	udiv	%g5,	0x0DC3,	%i1
	smulcc	%i0,	0x1218,	%l4
	movcs	%icc,	%g7,	%o3
	sdivx	%o0,	0x070B,	%g2
	fmul8sux16	%f0,	%f8,	%f10
	edge32l	%g3,	%l0,	%o4
	fnand	%f28,	%f28,	%f22
	edge32n	%o5,	%l1,	%o7
	fxors	%f30,	%f14,	%f17
	movrgez	%g4,	0x170,	%i3
	smulcc	%o1,	0x1195,	%i7
	addc	%i5,	0x0D74,	%g1
	subcc	%l3,	%l5,	%l2
	stb	%g6,	[%l7 + 0x0B]
	andncc	%l6,	%o6,	%i2
	movle	%icc,	%i6,	%i4
	fnot1	%f12,	%f2
	movl	%xcc,	%o2,	%i1
	ldsb	[%l7 + 0x74],	%i0
	stw	%g5,	[%l7 + 0x2C]
	ldd	[%l7 + 0x60],	%g6
	edge16	%o3,	%o0,	%l4
	andncc	%g2,	%g3,	%l0
	movrlz	%o4,	%o5,	%o7
	edge8n	%g4,	%l1,	%o1
	edge8n	%i7,	%i5,	%g1
	mulscc	%i3,	0x1CDE,	%l3
	fmuld8ulx16	%f18,	%f21,	%f8
	movrgz	%l5,	%l2,	%g6
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%o6
	alignaddr	%l6,	%i6,	%i2
	fmovsleu	%xcc,	%f0,	%f8
	sra	%i4,	%o2,	%i1
	fnors	%f19,	%f9,	%f30
	fpack16	%f12,	%f20
	edge32ln	%i0,	%g7,	%o3
	fcmpeq32	%f2,	%f8,	%o0
	xnor	%l4,	0x043B,	%g2
	movge	%icc,	%g3,	%g5
	movge	%xcc,	%o4,	%o5
	sdivx	%o7,	0x0E8C,	%g4
	movne	%xcc,	%l1,	%o1
	mulscc	%i7,	%l0,	%g1
	nop
	set	0x19, %o2
	ldsb	[%l7 + %o2],	%i3
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	save %g6, 0x005C, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x38],	%l6
	movneg	%icc,	%i6,	%l5
	fxors	%f11,	%f30,	%f23
	subcc	%i2,	0x0602,	%i4
	movcs	%xcc,	%o2,	%i1
	ldub	[%l7 + 0x14],	%g7
	fmovdpos	%xcc,	%f14,	%f29
	sll	%i0,	%o0,	%l4
	alignaddrl	%g2,	%g3,	%g5
	mova	%icc,	%o3,	%o5
	movcs	%icc,	%o7,	%g4
	movre	%l1,	0x0B1,	%o1
	sll	%i7,	0x05,	%l0
	smulcc	%o4,	%g1,	%i5
	and	%i3,	0x1F42,	%l3
	edge8n	%g6,	%l2,	%l6
	ldsw	[%l7 + 0x38],	%i6
	ldub	[%l7 + 0x59],	%l5
	alignaddr	%o6,	%i2,	%i4
	movre	%i1,	0x10A,	%o2
	movrne	%g7,	%o0,	%l4
	stx	%g2,	[%l7 + 0x20]
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%i0
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%g4
	fmovrsgz	%g3,	%f22,	%f13
	fmovrsgz	%o3,	%f24,	%f24
	movneg	%xcc,	%o7,	%o5
	xorcc	%g4,	%l1,	%i7
	fones	%f3
	orn	%o1,	0x1257,	%l0
	fcmped	%fcc2,	%f20,	%f2
	movrne	%o4,	%i5,	%g1
	movn	%xcc,	%l3,	%i3
	fcmps	%fcc0,	%f4,	%f9
	udivcc	%l2,	0x1C23,	%l6
	fands	%f29,	%f9,	%f29
	sir	0x1ABA
	movneg	%icc,	%i6,	%l5
	sll	%g6,	0x1A,	%i2
	sdivx	%i4,	0x0261,	%i1
	alignaddrl	%o2,	%g7,	%o0
	fnot1s	%f8,	%f19
	fmovsa	%icc,	%f29,	%f20
	subc	%o6,	0x1125,	%l4
	fmovrslz	%g2,	%f5,	%f4
	andncc	%i0,	%g5,	%g3
	fpack16	%f28,	%f28
	subcc	%o3,	%o7,	%o5
	or	%l1,	%i7,	%g4
	movre	%l0,	0x286,	%o1
	sth	%i5,	[%l7 + 0x76]
	sub	%g1,	%o4,	%i3
	edge16	%l3,	%l6,	%i6
	movneg	%icc,	%l5,	%l2
	fmovdcc	%xcc,	%f9,	%f13
	srl	%i2,	%i4,	%i1
	sir	0x024C
	addccc	%o2,	0x1DAC,	%g6
	addc	%g7,	%o0,	%l4
	restore %o6, 0x19D8, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g5,	0x045,	%g2
	sdivx	%o3,	0x0D36,	%o7
	edge16ln	%g3,	%l1,	%i7
	ld	[%l7 + 0x38],	%f11
	fmovspos	%xcc,	%f18,	%f21
	fornot2	%f2,	%f30,	%f24
	orn	%o5,	0x1EF6,	%l0
	sdivx	%g4,	0x00F4,	%i5
	array8	%g1,	%o1,	%i3
	movrgez	%l3,	0x3C4,	%l6
	edge16	%i6,	%l5,	%o4
	orn	%l2,	0x0F20,	%i4
	fxors	%f29,	%f26,	%f12
	orcc	%i2,	%o2,	%g6
	andcc	%i1,	0x197F,	%g7
	array8	%o0,	%o6,	%i0
	xorcc	%l4,	%g5,	%g2
	add	%o7,	0x1AE0,	%o3
	xorcc	%l1,	0x009E,	%g3
	andncc	%o5,	%i7,	%g4
	movl	%icc,	%i5,	%g1
	srlx	%o1,	0x0F,	%l0
	fzeros	%f13
	fnegd	%f22,	%f6
	sir	0x0F07
	fmovrsgez	%i3,	%f3,	%f5
	sra	%l3,	%i6,	%l6
	save %o4, %l2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i2,	%l5,	%g6
	ldx	[%l7 + 0x30],	%i1
	orcc	%g7,	0x1239,	%o2
	sdivcc	%o6,	0x03B6,	%o0
	edge8ln	%l4,	%i0,	%g2
	xnor	%g5,	%o7,	%o3
	movleu	%xcc,	%g3,	%o5
	alignaddrl	%l1,	%i7,	%g4
	movneg	%xcc,	%g1,	%i5
	ldsb	[%l7 + 0x5F],	%l0
	stw	%i3,	[%l7 + 0x24]
	fmovdpos	%xcc,	%f0,	%f18
	movcc	%xcc,	%l3,	%o1
	edge8	%l6,	%o4,	%i6
	fands	%f27,	%f22,	%f23
	orn	%i4,	%l2,	%i2
	movvc	%xcc,	%l5,	%g6
	movcc	%icc,	%i1,	%o2
	lduw	[%l7 + 0x28],	%o6
	movvs	%icc,	%g7,	%l4
	movle	%xcc,	%o0,	%g2
	or	%g5,	0x0F52,	%o7
	edge16l	%i0,	%o3,	%g3
	sll	%l1,	0x15,	%i7
	ldd	[%l7 + 0x10],	%o4
	edge32n	%g4,	%g1,	%l0
	edge32n	%i3,	%i5,	%l3
	fcmpeq16	%f22,	%f0,	%l6
	ldsh	[%l7 + 0x6E],	%o4
	fabsd	%f12,	%f0
	fandnot2s	%f6,	%f14,	%f1
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	fones	%f14
	orcc	%i2,	0x0C77,	%i4
	movrne	%l5,	0x0F5,	%g6
	movcs	%xcc,	%o2,	%i1
	fmul8sux16	%f16,	%f24,	%f16
	xor	%g7,	0x1B5A,	%l4
	movvc	%xcc,	%o6,	%g2
	fmovsvs	%xcc,	%f2,	%f25
	sdivcc	%g5,	0x0D1B,	%o0
	movvc	%xcc,	%o7,	%i0
	fmovrsgez	%o3,	%f9,	%f21
	edge32l	%l1,	%g3,	%o5
	orncc	%i7,	0x0BD8,	%g1
	umulcc	%l0,	0x1AD3,	%g4
	umulcc	%i3,	0x1891,	%l3
	xnorcc	%l6,	0x169D,	%o4
	array16	%o1,	%i6,	%i5
	edge16ln	%i2,	%i4,	%l5
	add	%g6,	%o2,	%l2
	lduw	[%l7 + 0x18],	%i1
	fmovse	%xcc,	%f27,	%f12
	fabss	%f24,	%f23
	movrgez	%g7,	%o6,	%g2
	sllx	%l4,	%o0,	%g5
	movg	%icc,	%i0,	%o7
	orncc	%o3,	%l1,	%g3
	fmuld8sux16	%f13,	%f2,	%f6
	ldsb	[%l7 + 0x52],	%i7
	alignaddrl	%g1,	%o5,	%l0
	orncc	%g4,	0x0C49,	%l3
	movcs	%icc,	%i3,	%o4
	fpsub32s	%f28,	%f29,	%f10
	save %l6, %i6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i5,	%i2,	%l5
	ld	[%l7 + 0x78],	%f24
	orcc	%g6,	0x008D,	%i4
	ldsb	[%l7 + 0x5D],	%l2
	edge32ln	%i1,	%g7,	%o6
	sir	0x0FFA
	array16	%o2,	%l4,	%o0
	fmovsg	%xcc,	%f6,	%f18
	udiv	%g2,	0x0A44,	%g5
	popc	%i0,	%o3
	movn	%icc,	%o7,	%g3
	edge8	%l1,	%i7,	%g1
	fnot1s	%f30,	%f28
	movcc	%icc,	%o5,	%l0
	edge8	%g4,	%l3,	%i3
	smul	%l6,	%o4,	%o1
	and	%i6,	0x15F0,	%i2
	sdivx	%l5,	0x1968,	%i5
	movge	%icc,	%i4,	%g6
	movrgez	%l2,	0x227,	%i1
	fabss	%f27,	%f15
	movrgez	%o6,	0x2D7,	%g7
	xorcc	%o2,	0x1B67,	%l4
	movne	%xcc,	%g2,	%g5
	fmovdpos	%icc,	%f30,	%f10
	sdivcc	%i0,	0x05B8,	%o0
	fandnot2	%f20,	%f28,	%f24
	mulx	%o7,	0x11BB,	%g3
	xorcc	%l1,	0x14B9,	%o3
	fmovsn	%xcc,	%f0,	%f0
	fornot1s	%f23,	%f12,	%f8
	lduh	[%l7 + 0x18],	%i7
	edge32	%o5,	%g1,	%l0
	fornot2s	%f13,	%f12,	%f30
	fornot2	%f20,	%f22,	%f18
	movcs	%xcc,	%l3,	%i3
	edge32ln	%l6,	%g4,	%o1
	for	%f24,	%f14,	%f0
	edge8ln	%i6,	%o4,	%l5
	andn	%i2,	%i5,	%g6
	ldsb	[%l7 + 0x1E],	%i4
	std	%f26,	[%l7 + 0x60]
	pdist	%f16,	%f8,	%f2
	alignaddrl	%l2,	%o6,	%g7
	fmovsvs	%icc,	%f11,	%f12
	alignaddr	%o2,	%l4,	%i1
	st	%f27,	[%l7 + 0x7C]
	sra	%g5,	%i0,	%o0
	fmovde	%xcc,	%f9,	%f19
	edge8	%o7,	%g3,	%l1
	alignaddr	%g2,	%i7,	%o5
	smul	%o3,	%g1,	%l0
	movneg	%icc,	%i3,	%l3
	addcc	%g4,	0x1590,	%l6
	sethi	0x1F5E,	%o1
	xorcc	%i6,	%l5,	%o4
	fcmpne32	%f22,	%f12,	%i5
	addc	%i2,	%g6,	%i4
	sth	%o6,	[%l7 + 0x50]
	sub	%l2,	%g7,	%o2
	movg	%icc,	%i1,	%g5
	movneg	%xcc,	%i0,	%l4
	fnegd	%f6,	%f8
	subc	%o7,	%g3,	%l1
	ldsw	[%l7 + 0x34],	%o0
	array16	%g2,	%o5,	%i7
	movn	%xcc,	%g1,	%o3
	movvs	%icc,	%i3,	%l0
	fmovrdlz	%l3,	%f28,	%f26
	movrgz	%g4,	%o1,	%l6
	movge	%xcc,	%l5,	%o4
	fmovdcs	%icc,	%f8,	%f20
	add	%i5,	0x0C04,	%i2
	sll	%g6,	%i4,	%i6
	edge32	%o6,	%g7,	%l2
	sir	0x194A
	movneg	%icc,	%o2,	%i1
	ldd	[%l7 + 0x18],	%g4
	edge16	%i0,	%o7,	%l4
	movvc	%icc,	%l1,	%o0
	edge8n	%g2,	%o5,	%g3
	stw	%g1,	[%l7 + 0x68]
	nop
	set	0x60, %g7
	ldsw	[%l7 + %g7],	%o3
	ldd	[%l7 + 0x28],	%f2
	xnorcc	%i7,	0x025E,	%l0
	restore %l3, %g4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%l6,	%l5
	movneg	%xcc,	%o4,	%i3
	fnot1	%f20,	%f12
	smulcc	%i5,	0x03C3,	%g6
	alignaddrl	%i2,	%i6,	%o6
	move	%icc,	%g7,	%l2
	ld	[%l7 + 0x30],	%f17
	fcmpne32	%f20,	%f28,	%i4
	movl	%icc,	%i1,	%g5
	sir	0x1D22
	srl	%o2,	%o7,	%i0
	movne	%xcc,	%l4,	%l1
	edge8ln	%g2,	%o0,	%o5
	fnegd	%f0,	%f6
	movcs	%icc,	%g1,	%g3
	ldsh	[%l7 + 0x5E],	%o3
	fnands	%f24,	%f25,	%f12
	fmovsg	%icc,	%f4,	%f1
	and	%i7,	0x0686,	%l3
	ld	[%l7 + 0x2C],	%f31
	fmovspos	%icc,	%f21,	%f16
	fmovscc	%icc,	%f7,	%f1
	fmovdcc	%xcc,	%f14,	%f20
	fmovrdgez	%g4,	%f0,	%f2
	andcc	%l0,	0x137F,	%l6
	orcc	%o1,	%o4,	%l5
	movvc	%icc,	%i5,	%g6
	movgu	%icc,	%i3,	%i2
	nop
	set	0x1A, %i5
	lduh	[%l7 + %i5],	%o6
	save %i6, 0x1773, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	udiv	%g5,	0x0F46,	%o2
	movg	%xcc,	%o7,	%i4
	fsrc1	%f4,	%f30
	fandnot1s	%f14,	%f25,	%f15
	fornot2	%f12,	%f14,	%f26
	alignaddrl	%l4,	%l1,	%i0
	smulcc	%o0,	0x0410,	%g2
	fcmpgt32	%f26,	%f10,	%g1
	addcc	%o5,	0x0ADE,	%g3
	xor	%o3,	0x06B3,	%i7
	add	%g4,	%l0,	%l3
	fandnot1s	%f30,	%f29,	%f26
	std	%f4,	[%l7 + 0x48]
	popc	0x1C8E,	%o1
	subcc	%o4,	%l5,	%l6
	sdivx	%i5,	0x0381,	%i3
	movrgez	%g6,	0x144,	%i2
	xnor	%o6,	%g7,	%i6
	array32	%l2,	%g5,	%i1
	sllx	%o2,	0x0B,	%i4
	xnor	%o7,	0x0F98,	%l1
	fcmpne32	%f22,	%f0,	%i0
	fpsub16	%f18,	%f2,	%f30
	fmovsvs	%xcc,	%f4,	%f17
	xnorcc	%o0,	%l4,	%g2
	ldx	[%l7 + 0x78],	%g1
	fmovs	%f25,	%f30
	andn	%o5,	0x09AE,	%o3
	lduw	[%l7 + 0x38],	%i7
	umul	%g3,	%l0,	%g4
	movgu	%icc,	%o1,	%o4
	edge32ln	%l5,	%l6,	%i5
	andcc	%l3,	%i3,	%g6
	movre	%i2,	0x1BD,	%g7
	addc	%o6,	%i6,	%l2
	umulcc	%i1,	0x0340,	%g5
	lduh	[%l7 + 0x1E],	%i4
	umulcc	%o7,	%l1,	%o2
	nop
	set	0x20, %g4
	std	%f20,	[%l7 + %g4]
	xor	%o0,	0x1CFF,	%i0
	edge8	%g2,	%g1,	%o5
	mulx	%o3,	0x1BD9,	%l4
	edge32ln	%i7,	%g3,	%g4
	umulcc	%o1,	%l0,	%o4
	movg	%icc,	%l6,	%i5
	fpsub32	%f8,	%f8,	%f14
	movvs	%xcc,	%l3,	%i3
	fxnors	%f24,	%f11,	%f26
	subcc	%l5,	%i2,	%g7
	array16	%g6,	%i6,	%l2
	movle	%xcc,	%o6,	%i1
	array32	%g5,	%i4,	%o7
	andcc	%o2,	0x1C35,	%l1
	sethi	0x0062,	%i0
	subccc	%o0,	0x1C99,	%g1
	sra	%o5,	0x03,	%o3
	fsrc2s	%f3,	%f20
	udivx	%g2,	0x0C25,	%l4
	fxors	%f7,	%f4,	%f26
	sethi	0x1AE1,	%g3
	movn	%icc,	%i7,	%g4
	movg	%icc,	%o1,	%l0
	andcc	%o4,	%i5,	%l3
	move	%xcc,	%l6,	%i3
	sdivx	%l5,	0x097C,	%g7
	movvs	%icc,	%i2,	%g6
	fmovsleu	%xcc,	%f0,	%f24
	save %l2, %i6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i1,	%g5
	alignaddrl	%o7,	%i4,	%o2
	movn	%xcc,	%l1,	%i0
	movvc	%icc,	%o0,	%g1
	popc	%o3,	%g2
	umul	%l4,	%o5,	%i7
	ld	[%l7 + 0x5C],	%f16
	array16	%g4,	%g3,	%o1
	movre	%l0,	%i5,	%l3
	array8	%l6,	%i3,	%o4
	movrgez	%l5,	%g7,	%i2
	fand	%f18,	%f22,	%f30
	edge16n	%l2,	%i6,	%g6
	fnands	%f2,	%f4,	%f5
	andn	%o6,	%g5,	%i1
	ldub	[%l7 + 0x5A],	%o7
	sdiv	%o2,	0x03D7,	%i4
	movvc	%xcc,	%l1,	%o0
	movleu	%icc,	%i0,	%g1
	or	%o3,	0x13CA,	%l4
	lduw	[%l7 + 0x4C],	%g2
	fcmpne32	%f14,	%f24,	%o5
	std	%f6,	[%l7 + 0x08]
	ldd	[%l7 + 0x30],	%i6
	fcmpeq16	%f8,	%f26,	%g4
	smulcc	%o1,	%g3,	%l0
	srl	%i5,	%l3,	%l6
	movn	%xcc,	%i3,	%l5
	fcmple16	%f2,	%f8,	%g7
	movl	%icc,	%o4,	%l2
	fpack32	%f10,	%f30,	%f28
	array16	%i6,	%g6,	%i2
	fpadd32s	%f24,	%f11,	%f8
	movle	%xcc,	%g5,	%i1
	fmovrdgz	%o7,	%f12,	%f30
	stb	%o2,	[%l7 + 0x4D]
	edge32	%o6,	%i4,	%o0
	alignaddr	%l1,	%g1,	%i0
	ldd	[%l7 + 0x40],	%l4
	fnors	%f18,	%f18,	%f24
	edge16l	%g2,	%o5,	%i7
	fnot2	%f16,	%f18
	andncc	%g4,	%o3,	%o1
	sllx	%l0,	0x13,	%g3
	movvc	%icc,	%i5,	%l3
	smulcc	%l6,	%l5,	%g7
	fxor	%f6,	%f28,	%f16
	srlx	%i3,	%o4,	%l2
	movrlz	%g6,	0x059,	%i2
	xnor	%g5,	%i6,	%i1
	fcmpne32	%f6,	%f12,	%o2
	movrne	%o6,	%o7,	%o0
	fxnors	%f25,	%f12,	%f6
	fabss	%f24,	%f22
	movcc	%icc,	%i4,	%l1
	edge16l	%i0,	%l4,	%g1
	fones	%f0
	fors	%f14,	%f14,	%f8
	mova	%xcc,	%o5,	%i7
	fpadd32	%f22,	%f8,	%f24
	fmovsle	%icc,	%f9,	%f9
	lduw	[%l7 + 0x30],	%g2
	subccc	%o3,	%o1,	%l0
	fmovdcs	%xcc,	%f27,	%f20
	udivcc	%g3,	0x1B69,	%i5
	sth	%l3,	[%l7 + 0x70]
	array16	%l6,	%l5,	%g7
	restore %i3, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f18,	%f30,	%f26
	fcmpgt32	%f28,	%f0,	%g4
	array8	%g6,	%g5,	%i6
	fcmpne16	%f22,	%f24,	%i2
	movge	%xcc,	%o2,	%i1
	movn	%icc,	%o7,	%o6
	edge8ln	%o0,	%l1,	%i4
	sir	0x062D
	orncc	%l4,	0x05FA,	%g1
	udivx	%o5,	0x0FA1,	%i0
	subc	%i7,	%o3,	%o1
	fsrc1	%f16,	%f0
	ldub	[%l7 + 0x10],	%l0
	and	%g3,	0x0C5F,	%g2
	orncc	%i5,	0x0133,	%l6
	sll	%l5,	%l3,	%g7
	fpadd32	%f18,	%f28,	%f8
	fpadd32s	%f7,	%f28,	%f3
	movrgz	%o4,	%i3,	%g4
	stx	%g6,	[%l7 + 0x50]
	movvs	%icc,	%l2,	%g5
	edge16ln	%i6,	%o2,	%i1
	lduw	[%l7 + 0x38],	%i2
	movl	%xcc,	%o7,	%o6
	edge8l	%o0,	%l1,	%l4
	popc	0x0B60,	%g1
	sra	%i4,	%i0,	%o5
	sdivx	%i7,	0x1923,	%o3
	sir	0x1B65
	sll	%o1,	0x1B,	%l0
	fandnot2	%f18,	%f26,	%f18
	xnor	%g3,	0x1634,	%i5
	stx	%g2,	[%l7 + 0x28]
	fmovd	%f24,	%f14
	movn	%xcc,	%l6,	%l3
	fsrc1s	%f14,	%f18
	sllx	%l5,	%g7,	%i3
	movrgez	%o4,	%g4,	%l2
	subccc	%g6,	0x1248,	%g5
	movcs	%icc,	%o2,	%i6
	movne	%icc,	%i2,	%i1
	stw	%o7,	[%l7 + 0x08]
	movn	%xcc,	%o6,	%l1
	nop
	set	0x2A, %i7
	ldsb	[%l7 + %i7],	%l4
	umulcc	%o0,	%i4,	%g1
	edge16l	%i0,	%o5,	%i7
	fnands	%f12,	%f30,	%f28
	std	%f16,	[%l7 + 0x28]
	fmovsneg	%xcc,	%f7,	%f21
	save %o1, 0x1B3F, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g3,	0x3F2,	%o3
	sll	%g2,	%i5,	%l3
	sth	%l6,	[%l7 + 0x48]
	ldd	[%l7 + 0x10],	%f10
	edge16ln	%l5,	%g7,	%i3
	fmovrse	%o4,	%f4,	%f1
	fcmped	%fcc3,	%f6,	%f20
	edge32l	%g4,	%l2,	%g6
	edge16l	%g5,	%i6,	%o2
	fpadd16s	%f1,	%f10,	%f6
	stw	%i2,	[%l7 + 0x40]
	fcmple32	%f16,	%f30,	%i1
	udiv	%o7,	0x13A7,	%o6
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	stx	%o0,	[%l7 + 0x08]
	fpsub16s	%f28,	%f25,	%f3
	fpadd32s	%f19,	%f9,	%f9
	fmovsneg	%xcc,	%f0,	%f16
	fnot1s	%f3,	%f4
	movpos	%icc,	%g1,	%o5
	mova	%xcc,	%i7,	%i0
	fornot1	%f22,	%f10,	%f18
	fcmpeq16	%f0,	%f20,	%l0
	movge	%icc,	%g3,	%o3
	edge16l	%o1,	%g2,	%l3
	edge32n	%i5,	%l5,	%l6
	mulscc	%g7,	0x1565,	%i3
	edge16l	%g4,	%o4,	%l2
	fcmple32	%f10,	%f10,	%g6
	srax	%g5,	%i6,	%i2
	fmovsa	%xcc,	%f1,	%f7
	st	%f22,	[%l7 + 0x7C]
	lduw	[%l7 + 0x64],	%o2
	xorcc	%o7,	%i1,	%l1
	xor	%l4,	%o6,	%o0
	or	%i4,	%g1,	%o5
	sdiv	%i7,	0x0B97,	%l0
	xnorcc	%i0,	%g3,	%o3
	movn	%xcc,	%g2,	%o1
	movge	%icc,	%l3,	%l5
	fmovsvs	%icc,	%f31,	%f7
	fpsub32s	%f10,	%f21,	%f22
	movrgz	%l6,	%g7,	%i5
	fmovdvs	%xcc,	%f30,	%f18
	stb	%g4,	[%l7 + 0x60]
	mulscc	%i3,	0x0097,	%l2
	alignaddrl	%o4,	%g6,	%g5
	edge32	%i2,	%i6,	%o7
	movcc	%xcc,	%i1,	%o2
	fmul8ulx16	%f8,	%f28,	%f2
	add	%l1,	0x1BDA,	%o6
	nop
	set	0x1F, %i6
	ldub	[%l7 + %i6],	%o0
	nop
	set	0x1A, %i0
	sth	%i4,	[%l7 + %i0]
	fmovdle	%xcc,	%f16,	%f19
	fcmpd	%fcc3,	%f12,	%f28
	fcmpgt16	%f0,	%f24,	%l4
	fsrc1	%f4,	%f12
	edge32	%o5,	%i7,	%l0
	movl	%xcc,	%i0,	%g3
	andcc	%g1,	%o3,	%o1
	sub	%g2,	%l5,	%l3
	fnot1	%f20,	%f16
	alignaddr	%g7,	%i5,	%l6
	fmovsneg	%xcc,	%f8,	%f28
	edge32	%i3,	%g4,	%o4
	movpos	%xcc,	%l2,	%g5
	addccc	%i2,	0x1A92,	%i6
	edge16n	%o7,	%g6,	%o2
	sir	0x0F41
	fnot1	%f26,	%f14
	edge32n	%l1,	%i1,	%o6
	xorcc	%i4,	%l4,	%o5
	ldub	[%l7 + 0x52],	%o0
	stb	%l0,	[%l7 + 0x1D]
	fmovsgu	%xcc,	%f0,	%f7
	array16	%i7,	%i0,	%g1
	fmul8sux16	%f2,	%f8,	%f30
	edge16n	%o3,	%o1,	%g3
	popc	0x0498,	%l5
	sir	0x0E48
	stw	%l3,	[%l7 + 0x44]
	fmovrslez	%g7,	%f7,	%f13
	sub	%g2,	0x12EB,	%l6
	st	%f25,	[%l7 + 0x70]
	ldsb	[%l7 + 0x5B],	%i5
	fpadd16s	%f3,	%f15,	%f30
	fcmpne32	%f22,	%f0,	%g4
	movl	%icc,	%i3,	%o4
	edge32ln	%g5,	%i2,	%i6
	fsrc2	%f16,	%f28
	array16	%o7,	%g6,	%o2
	ldsw	[%l7 + 0x50],	%l2
	movcc	%icc,	%l1,	%i1
	movne	%icc,	%o6,	%l4
	sethi	0x0055,	%i4
	edge32l	%o0,	%l0,	%i7
	movvc	%xcc,	%i0,	%o5
	movrne	%o3,	%g1,	%o1
	fsrc1s	%f9,	%f27
	mulscc	%l5,	%l3,	%g7
	fones	%f2
	fpsub16s	%f22,	%f12,	%f29
	fmovsl	%icc,	%f21,	%f1
	fmovrde	%g3,	%f2,	%f0
	movpos	%icc,	%g2,	%l6
	movl	%icc,	%g4,	%i3
	alignaddr	%i5,	%o4,	%i2
	xnorcc	%i6,	0x025D,	%o7
	fmovsne	%icc,	%f16,	%f25
	move	%icc,	%g5,	%g6
	alignaddr	%o2,	%l1,	%l2
	fcmpne16	%f24,	%f28,	%o6
	fmovdneg	%xcc,	%f31,	%f30
	subc	%i1,	%i4,	%l4
	subc	%l0,	0x009F,	%i7
	fpadd32	%f6,	%f4,	%f24
	udivcc	%o0,	0x10FA,	%i0
	ld	[%l7 + 0x6C],	%f15
	movcc	%xcc,	%o3,	%g1
	fnand	%f20,	%f0,	%f8
	movle	%xcc,	%o5,	%o1
	smulcc	%l5,	0x1462,	%l3
	xnorcc	%g3,	0x0BD4,	%g7
	sllx	%g2,	%g4,	%l6
	st	%f18,	[%l7 + 0x1C]
	movrne	%i3,	%i5,	%o4
	smul	%i6,	0x07C5,	%o7
	sub	%i2,	%g6,	%o2
	edge8ln	%l1,	%l2,	%o6
	edge32ln	%i1,	%i4,	%l4
	edge32n	%l0,	%i7,	%o0
	xor	%i0,	%g5,	%g1
	udivcc	%o5,	0x16A5,	%o3
	fzeros	%f15
	fones	%f27
	sdivcc	%o1,	0x11C6,	%l3
	std	%f10,	[%l7 + 0x08]
	movleu	%xcc,	%g3,	%g7
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%g2
	fpack16	%f14,	%f3
	udivcc	%g4,	0x066B,	%l6
	stx	%l5,	[%l7 + 0x20]
	umulcc	%i5,	0x168C,	%i3
	movge	%xcc,	%i6,	%o7
	sra	%i2,	0x0C,	%o4
	fsrc1	%f28,	%f10
	array16	%o2,	%l1,	%g6
	fmovscs	%icc,	%f23,	%f30
	fmovsgu	%xcc,	%f11,	%f22
	andncc	%o6,	%i1,	%l2
	andn	%l4,	%i4,	%l0
	orn	%o0,	%i7,	%i0
	array16	%g5,	%o5,	%o3
	edge16ln	%g1,	%l3,	%g3
	save %o1, 0x1F4D, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	%l6,	%g4
	srlx	%l5,	0x12,	%i3
	popc	%i6,	%o7
	orcc	%i2,	0x1FA4,	%o4
	movcs	%icc,	%i5,	%o2
	udiv	%g6,	0x13AC,	%o6
	xnorcc	%i1,	%l2,	%l1
	sth	%l4,	[%l7 + 0x58]
	fcmpgt32	%f28,	%f26,	%i4
	movcc	%icc,	%o0,	%l0
	edge16ln	%i0,	%g5,	%o5
	srax	%o3,	0x1C,	%g1
	udiv	%i7,	0x0517,	%l3
	fmovdne	%xcc,	%f26,	%f29
	srlx	%o1,	%g7,	%g2
	subccc	%l6,	%g3,	%g4
	or	%l5,	%i6,	%i3
	sdivcc	%o7,	0x06AC,	%o4
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%i5
	st	%f17,	[%l7 + 0x74]
	sllx	%i2,	%g6,	%o6
	ldsw	[%l7 + 0x58],	%i1
	edge32l	%o2,	%l2,	%l4
	mova	%icc,	%l1,	%o0
	ldx	[%l7 + 0x50],	%l0
	movle	%xcc,	%i0,	%g5
	edge16l	%o5,	%o3,	%g1
	fnors	%f11,	%f13,	%f20
	bshuffle	%f6,	%f30,	%f12
	fmovrsgez	%i7,	%f25,	%f5
	sir	0x04BB
	udivx	%i4,	0x0F91,	%o1
	movvc	%xcc,	%g7,	%g2
	sth	%l6,	[%l7 + 0x56]
	fmovdvc	%xcc,	%f25,	%f11
	stx	%l3,	[%l7 + 0x40]
	edge16	%g3,	%l5,	%g4
	fmovrde	%i3,	%f30,	%f26
	ldd	[%l7 + 0x58],	%f0
	edge16	%o7,	%i6,	%o4
	xorcc	%i5,	0x0A77,	%g6
	fornot2	%f6,	%f24,	%f10
	fmovrsgz	%o6,	%f5,	%f9
	ldd	[%l7 + 0x48],	%i0
	array8	%i2,	%o2,	%l2
	fmovscc	%icc,	%f5,	%f24
	sll	%l1,	0x02,	%o0
	ldd	[%l7 + 0x60],	%l0
	subcc	%i0,	%g5,	%l4
	orcc	%o5,	0x1771,	%o3
	ldx	[%l7 + 0x58],	%i7
	std	%f26,	[%l7 + 0x68]
	movrgz	%g1,	0x3F7,	%i4
	movle	%xcc,	%g7,	%g2
	ldd	[%l7 + 0x28],	%i6
	subccc	%l3,	%g3,	%o1
	alignaddrl	%l5,	%i3,	%g4
	faligndata	%f8,	%f12,	%f22
	addcc	%o7,	%o4,	%i6
	sir	0x1F58
	andcc	%g6,	0x051E,	%i5
	st	%f30,	[%l7 + 0x08]
	lduw	[%l7 + 0x10],	%o6
	ldsw	[%l7 + 0x78],	%i2
	fcmpgt16	%f26,	%f22,	%o2
	sethi	0x04D1,	%l2
	udivcc	%l1,	0x0EB3,	%i1
	fcmple16	%f22,	%f26,	%o0
	fcmpne16	%f8,	%f30,	%l0
	fpadd32s	%f19,	%f27,	%f13
	alignaddrl	%g5,	%l4,	%i0
	movpos	%icc,	%o5,	%o3
	add	%g1,	%i7,	%i4
	movrlz	%g7,	%g2,	%l3
	movre	%g3,	%l6,	%l5
	addc	%i3,	0x00FA,	%o1
	orn	%o7,	%g4,	%o4
	udivcc	%g6,	0x1A37,	%i5
	sll	%o6,	0x07,	%i6
	fcmpeq16	%f12,	%f10,	%i2
	restore %o2, %l1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x2C],	%f29
	fpack32	%f2,	%f28,	%f4
	sir	0x10BF
	sethi	0x0D89,	%o0
	movrlz	%l0,	0x1BB,	%i1
	fmovrsgez	%g5,	%f8,	%f7
	edge8ln	%l4,	%i0,	%o3
	addccc	%g1,	%i7,	%o5
	fnegd	%f0,	%f4
	fmovdg	%xcc,	%f4,	%f3
	edge8ln	%i4,	%g7,	%g2
	orncc	%g3,	0x0B6F,	%l3
	ldd	[%l7 + 0x48],	%l4
	fpadd16	%f20,	%f6,	%f0
	udivx	%i3,	0x1395,	%l6
	nop
	set	0x5C, %l4
	sth	%o1,	[%l7 + %l4]
	xnor	%g4,	%o4,	%g6
	fmovdcc	%icc,	%f21,	%f26
	ldsb	[%l7 + 0x76],	%o7
	fors	%f1,	%f13,	%f1
	subc	%i5,	0x07B4,	%i6
	movl	%xcc,	%i2,	%o6
	sethi	0x09FE,	%l1
	mulx	%o2,	0x1A5D,	%l2
	fzeros	%f7
	edge32	%o0,	%i1,	%g5
	add	%l0,	%l4,	%o3
	edge8l	%g1,	%i0,	%o5
	orn	%i7,	%g7,	%g2
	sub	%g3,	%i4,	%l5
	sdivx	%i3,	0x1F82,	%l3
	fpadd32s	%f20,	%f8,	%f6
	edge16	%o1,	%g4,	%l6
	fpsub32	%f4,	%f16,	%f18
	fnand	%f18,	%f22,	%f26
	movne	%xcc,	%o4,	%o7
	movn	%icc,	%g6,	%i6
	ldd	[%l7 + 0x48],	%f2
	fpmerge	%f28,	%f13,	%f0
	mulx	%i2,	%i5,	%l1
	fxnors	%f18,	%f16,	%f3
	fmul8x16al	%f6,	%f22,	%f24
	subccc	%o6,	%l2,	%o2
	xnorcc	%i1,	0x1FCE,	%o0
	lduw	[%l7 + 0x50],	%l0
	fmovrdlez	%l4,	%f12,	%f16
	andcc	%o3,	0x195D,	%g5
	fmovdne	%icc,	%f18,	%f3
	array16	%i0,	%o5,	%i7
	sdivx	%g1,	0x00B4,	%g2
	stw	%g3,	[%l7 + 0x48]
	ldub	[%l7 + 0x47],	%g7
	mulscc	%i4,	%l5,	%i3
	addc	%o1,	0x1D84,	%l3
	edge32ln	%l6,	%o4,	%g4
	fmovdne	%xcc,	%f16,	%f5
	sll	%g6,	0x03,	%i6
	xor	%i2,	%i5,	%o7
	sethi	0x05DF,	%o6
	edge8ln	%l2,	%l1,	%i1
	add	%o0,	0x1F5C,	%o2
	or	%l4,	%l0,	%o3
	movl	%icc,	%g5,	%i0
	orn	%o5,	0x09B2,	%g1
	movcs	%icc,	%g2,	%i7
	lduw	[%l7 + 0x7C],	%g3
	array32	%i4,	%l5,	%g7
	edge8n	%i3,	%l3,	%o1
	st	%f26,	[%l7 + 0x4C]
	array32	%o4,	%l6,	%g4
	fpsub16s	%f5,	%f21,	%f14
	movre	%i6,	0x2C0,	%g6
	stx	%i5,	[%l7 + 0x60]
	edge8	%o7,	%o6,	%i2
	addccc	%l1,	%l2,	%i1
	fmovscs	%xcc,	%f24,	%f12
	fcmped	%fcc2,	%f0,	%f18
	movrlez	%o0,	%o2,	%l0
	popc	0x1983,	%o3
	udivx	%g5,	0x1690,	%i0
	fmovsleu	%xcc,	%f26,	%f18
	fmovdvc	%icc,	%f24,	%f4
	movrgez	%o5,	0x085,	%g1
	save %g2, 0x01F9, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%l4,	%l5
	std	%f16,	[%l7 + 0x70]
	fmovsvc	%icc,	%f25,	%f2
	addcc	%g7,	%i4,	%i3
	array32	%l3,	%o1,	%o4
	stw	%g4,	[%l7 + 0x1C]
	edge32ln	%i6,	%l6,	%i5
	ldsw	[%l7 + 0x18],	%g6
	edge8l	%o6,	%o7,	%i2
	fmovsleu	%xcc,	%f17,	%f8
	edge32	%l1,	%l2,	%o0
	edge32l	%o2,	%l0,	%o3
	ldsh	[%l7 + 0x20],	%i1
	fzeros	%f31
	array32	%i0,	%o5,	%g1
	srlx	%g5,	0x0E,	%i7
	orncc	%g3,	%g2,	%l4
	for	%f4,	%f24,	%f8
	fsrc1	%f2,	%f2
	udiv	%l5,	0x06FA,	%i4
	fsrc1	%f6,	%f12
	xor	%g7,	%l3,	%o1
	fmovsl	%icc,	%f7,	%f28
	fsrc1s	%f30,	%f0
	fpsub32s	%f4,	%f19,	%f9
	add	%o4,	%i3,	%g4
	lduh	[%l7 + 0x4A],	%i6
	pdist	%f22,	%f8,	%f14
	fcmpgt32	%f2,	%f30,	%l6
	std	%f24,	[%l7 + 0x78]
	subccc	%g6,	0x191A,	%o6
	popc	0x1FE0,	%o7
	udivcc	%i2,	0x1157,	%i5
	movcs	%icc,	%l2,	%l1
	ldsb	[%l7 + 0x79],	%o2
	fmovrde	%o0,	%f16,	%f10
	fmovdcs	%xcc,	%f22,	%f5
	alignaddr	%o3,	%l0,	%i1
	srl	%o5,	%i0,	%g1
	ld	[%l7 + 0x48],	%f8
	movleu	%xcc,	%g5,	%i7
	xorcc	%g3,	%g2,	%l4
	addccc	%i4,	0x0B65,	%g7
	umulcc	%l3,	0x0004,	%o1
	edge16l	%l5,	%i3,	%g4
	fnors	%f0,	%f18,	%f16
	or	%i6,	0x1219,	%l6
	edge8ln	%g6,	%o4,	%o7
	fcmple32	%f4,	%f22,	%o6
	sllx	%i5,	0x14,	%l2
	fmovrdgz	%i2,	%f2,	%f4
	ldub	[%l7 + 0x26],	%l1
	movne	%xcc,	%o0,	%o3
	sethi	0x0CC3,	%o2
	edge8l	%l0,	%i1,	%i0
	fnot2	%f24,	%f26
	ldsw	[%l7 + 0x58],	%o5
	fxnor	%f14,	%f26,	%f30
	movrne	%g5,	0x36B,	%g1
	edge16n	%i7,	%g2,	%g3
	movpos	%xcc,	%l4,	%i4
	udiv	%g7,	0x0294,	%o1
	addccc	%l5,	%l3,	%i3
	udivx	%g4,	0x0FD1,	%i6
	ldd	[%l7 + 0x28],	%g6
	orn	%o4,	%l6,	%o6
	sll	%o7,	%i5,	%i2
	edge16n	%l2,	%l1,	%o0
	add	%o3,	%o2,	%l0
	ld	[%l7 + 0x6C],	%f22
	udivx	%i1,	0x1115,	%o5
	sdiv	%i0,	0x108B,	%g1
	fabsd	%f26,	%f6
	fmul8sux16	%f18,	%f28,	%f2
	edge32ln	%g5,	%i7,	%g3
	movre	%l4,	%g2,	%g7
	or	%o1,	0x04F8,	%i4
	movrlez	%l3,	0x3A6,	%l5
	pdist	%f8,	%f30,	%f24
	fandnot1s	%f9,	%f19,	%f25
	orncc	%g4,	%i3,	%i6
	edge32n	%g6,	%l6,	%o4
	save %o6, %o7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f6,	%f7
	pdist	%f14,	%f20,	%f14
	stx	%l2,	[%l7 + 0x08]
	movgu	%icc,	%i2,	%o0
	ldsw	[%l7 + 0x38],	%o3
	movgu	%icc,	%o2,	%l1
	udiv	%l0,	0x0B92,	%i1
	edge16n	%i0,	%g1,	%o5
	ldd	[%l7 + 0x18],	%i6
	xorcc	%g3,	0x0B93,	%l4
	fmovdle	%xcc,	%f0,	%f19
	movleu	%xcc,	%g2,	%g7
	edge8ln	%g5,	%i4,	%o1
	addcc	%l3,	0x1466,	%g4
	lduw	[%l7 + 0x70],	%l5
	fmovdcs	%xcc,	%f12,	%f20
	stb	%i6,	[%l7 + 0x37]
	add	%i3,	0x0DC0,	%l6
	fxnor	%f24,	%f12,	%f16
	fandnot1	%f22,	%f20,	%f10
	edge32	%o4,	%o6,	%g6
	fnegd	%f12,	%f2
	fcmpgt32	%f14,	%f22,	%o7
	add	%i5,	0x0475,	%i2
	xor	%o0,	0x0635,	%l2
	ldd	[%l7 + 0x50],	%f30
	addcc	%o2,	0x1180,	%o3
	movcs	%icc,	%l1,	%i1
	fmovscs	%icc,	%f4,	%f23
	edge32ln	%l0,	%g1,	%o5
	fmovspos	%icc,	%f15,	%f10
	fandnot1	%f20,	%f18,	%f4
	edge8	%i0,	%i7,	%g3
	fsrc1s	%f23,	%f14
	smul	%g2,	0x07CF,	%l4
	srlx	%g5,	0x13,	%i4
	movneg	%xcc,	%g7,	%l3
	xorcc	%o1,	%l5,	%g4
	edge8l	%i3,	%l6,	%o4
	ldub	[%l7 + 0x17],	%o6
	add	%i6,	%o7,	%g6
	lduh	[%l7 + 0x5C],	%i2
	fones	%f26
	st	%f11,	[%l7 + 0x68]
	movrlez	%i5,	%o0,	%o2
	movre	%o3,	0x019,	%l2
	popc	0x1ECA,	%i1
	srlx	%l0,	0x13,	%l1
	ldx	[%l7 + 0x30],	%g1
	subcc	%i0,	%i7,	%o5
	movvc	%icc,	%g2,	%g3
	edge32	%g5,	%l4,	%g7
	fnot2	%f2,	%f8
	fmovrdne	%l3,	%f26,	%f24
	mulx	%i4,	%o1,	%g4
	smulcc	%i3,	0x0658,	%l6
	edge8	%l5,	%o6,	%o4
	movrgz	%o7,	0x3A9,	%i6
	lduh	[%l7 + 0x40],	%i2
	and	%g6,	0x0C04,	%i5
	sll	%o0,	0x1B,	%o3
	addc	%o2,	%l2,	%i1
	movneg	%xcc,	%l1,	%g1
	stb	%l0,	[%l7 + 0x2D]
	edge8	%i7,	%o5,	%g2
	subc	%g3,	0x01F5,	%g5
	udivx	%l4,	0x0EFB,	%i0
	xnorcc	%l3,	%i4,	%g7
	ldx	[%l7 + 0x38],	%g4
	subcc	%o1,	%i3,	%l5
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	orn	%o7,	0x1369,	%i6
	std	%f20,	[%l7 + 0x68]
	fmovdn	%icc,	%f30,	%f4
	edge8n	%o4,	%g6,	%i2
	fpadd16	%f6,	%f8,	%f20
	fcmpgt16	%f2,	%f22,	%o0
	sir	0x07A5
	ldub	[%l7 + 0x15],	%o3
	movle	%xcc,	%i5,	%o2
	srax	%i1,	0x15,	%l2
	fornot1	%f16,	%f30,	%f2
	fpackfix	%f28,	%f8
	movrlz	%l1,	0x0FA,	%l0
	xor	%g1,	0x04EE,	%o5
	movgu	%xcc,	%g2,	%g3
	ldd	[%l7 + 0x78],	%f14
	faligndata	%f26,	%f30,	%f4
	srlx	%g5,	%l4,	%i0
	movne	%icc,	%l3,	%i4
	fsrc2s	%f19,	%f8
	edge8	%i7,	%g7,	%g4
	sth	%i3,	[%l7 + 0x0C]
	andcc	%l5,	%o1,	%l6
	umul	%o6,	0x1DFE,	%o7
	movcc	%icc,	%o4,	%g6
	stb	%i6,	[%l7 + 0x17]
	addcc	%o0,	0x106D,	%o3
	sdivcc	%i5,	0x1F76,	%o2
	edge32n	%i2,	%l2,	%i1
	edge8ln	%l0,	%l1,	%o5
	fandnot2	%f20,	%f14,	%f20
	addc	%g2,	0x0F12,	%g1
	movge	%icc,	%g5,	%l4
	movvs	%xcc,	%i0,	%l3
	ldub	[%l7 + 0x0B],	%g3
	stb	%i4,	[%l7 + 0x34]
	movle	%icc,	%g7,	%g4
	sdivcc	%i3,	0x01B2,	%l5
	move	%xcc,	%o1,	%l6
	std	%f16,	[%l7 + 0x50]
	movne	%xcc,	%o6,	%i7
	array32	%o4,	%g6,	%i6
	sdiv	%o7,	0x17CE,	%o3
	edge32ln	%i5,	%o2,	%o0
	edge16n	%l2,	%i1,	%i2
	edge8l	%l0,	%l1,	%g2
	sir	0x0382
	sra	%o5,	%g1,	%g5
	subccc	%l4,	0x06E0,	%l3
	edge16l	%g3,	%i0,	%g7
	xorcc	%i4,	%g4,	%l5
	stx	%o1,	[%l7 + 0x40]
	fxors	%f0,	%f27,	%f7
	sdivx	%l6,	0x0309,	%i3
	movcc	%xcc,	%i7,	%o4
	ld	[%l7 + 0x58],	%f27
	xnorcc	%o6,	%g6,	%o7
	fcmpgt16	%f6,	%f24,	%o3
	fnot2	%f20,	%f6
	edge8l	%i6,	%o2,	%i5
	srlx	%l2,	%i1,	%i2
	srlx	%l0,	%l1,	%g2
	nop
	set	0x6A, %g6
	lduh	[%l7 + %g6],	%o5
	fmovda	%xcc,	%f30,	%f3
	subc	%g1,	%g5,	%o0
	orcc	%l4,	0x19C0,	%g3
	fnot2	%f10,	%f12
	fxors	%f12,	%f25,	%f1
	xnor	%l3,	0x1498,	%g7
	movrgz	%i4,	0x06D,	%i0
	fpmerge	%f23,	%f23,	%f6
	udiv	%g4,	0x01DA,	%l5
	ldub	[%l7 + 0x63],	%l6
	alignaddrl	%i3,	%o1,	%o4
	movleu	%xcc,	%o6,	%i7
	fandnot2	%f30,	%f8,	%f10
	add	%o7,	%g6,	%o3
	fxor	%f14,	%f0,	%f18
	fmovrde	%i6,	%f24,	%f4
	xnor	%i5,	%o2,	%l2
	xorcc	%i2,	%i1,	%l0
	alignaddr	%g2,	%o5,	%g1
	fmovdvc	%xcc,	%f16,	%f4
	bshuffle	%f10,	%f14,	%f14
	edge32l	%g5,	%l1,	%l4
	fcmpgt16	%f4,	%f8,	%g3
	movn	%xcc,	%o0,	%g7
	edge16ln	%i4,	%l3,	%i0
	add	%g4,	0x0331,	%l6
	fmul8ulx16	%f26,	%f14,	%f6
	subcc	%i3,	%l5,	%o1
	or	%o4,	%i7,	%o6
	fandnot2	%f12,	%f16,	%f8
	fmovs	%f16,	%f19
	alignaddr	%o7,	%o3,	%g6
	sllx	%i6,	0x0E,	%i5
	fsrc1s	%f25,	%f17
	movcc	%xcc,	%l2,	%i2
	orcc	%o2,	0x1E09,	%l0
	fmovsg	%xcc,	%f28,	%f17
	nop
	set	0x2C, %o1
	ldub	[%l7 + %o1],	%i1
	movrlez	%g2,	%g1,	%o5
	ldd	[%l7 + 0x20],	%f28
	ld	[%l7 + 0x44],	%f20
	xor	%l1,	0x144C,	%l4
	alignaddrl	%g3,	%o0,	%g5
	edge8l	%i4,	%l3,	%g7
	movl	%xcc,	%g4,	%i0
	fpack16	%f30,	%f24
	fpsub32s	%f26,	%f22,	%f15
	stb	%i3,	[%l7 + 0x21]
	edge32ln	%l6,	%o1,	%o4
	fcmpne32	%f30,	%f28,	%l5
	movcc	%xcc,	%o6,	%o7
	edge8	%i7,	%g6,	%o3
	srlx	%i6,	0x0D,	%l2
	fcmped	%fcc2,	%f22,	%f16
	fsrc2	%f22,	%f18
	umulcc	%i2,	%o2,	%i5
	movleu	%xcc,	%i1,	%l0
	edge32l	%g2,	%g1,	%o5
	sllx	%l1,	0x1E,	%l4
	movn	%xcc,	%o0,	%g5
	movcc	%xcc,	%g3,	%i4
	movcc	%icc,	%l3,	%g4
	array16	%g7,	%i0,	%l6
	fsrc1s	%f6,	%f7
	movvs	%icc,	%o1,	%i3
	alignaddr	%o4,	%l5,	%o6
	stx	%o7,	[%l7 + 0x48]
	movg	%icc,	%g6,	%i7
	fmovsl	%icc,	%f18,	%f9
	smul	%o3,	%l2,	%i2
	sdivx	%o2,	0x08D7,	%i5
	movleu	%xcc,	%i6,	%i1
	movrlz	%g2,	0x1EB,	%g1
	edge16n	%o5,	%l0,	%l1
	movrlz	%l4,	0x36A,	%g5
	ldsb	[%l7 + 0x34],	%g3
	movrgz	%o0,	%i4,	%l3
	st	%f19,	[%l7 + 0x20]
	orn	%g7,	%i0,	%g4
	and	%l6,	0x0898,	%o1
	fmovdge	%icc,	%f20,	%f1
	smul	%i3,	%o4,	%l5
	subc	%o6,	0x04DA,	%g6
	movcc	%xcc,	%i7,	%o7
	xor	%o3,	%l2,	%i2
	fmovrsne	%i5,	%f11,	%f5
	edge32l	%i6,	%o2,	%g2
	edge16n	%g1,	%o5,	%l0
	xnorcc	%l1,	0x1DAE,	%i1
	mulscc	%g5,	%l4,	%o0
	andn	%g3,	0x1463,	%l3
	addccc	%g7,	%i0,	%i4
	movrlz	%g4,	%o1,	%i3
	ldx	[%l7 + 0x08],	%l6
	udiv	%l5,	0x02BD,	%o4
	fmovda	%xcc,	%f26,	%f4
	smulcc	%g6,	%i7,	%o6
	movneg	%icc,	%o7,	%o3
	sub	%l2,	0x004D,	%i2
	movvs	%xcc,	%i6,	%i5
	addcc	%o2,	0x1A4B,	%g2
	smul	%o5,	0x12A9,	%l0
	ld	[%l7 + 0x18],	%f6
	fpsub32	%f14,	%f14,	%f18
	edge16ln	%g1,	%i1,	%g5
	siam	0x3
	fmovdneg	%icc,	%f18,	%f19
	fornot1	%f0,	%f30,	%f8
	movvc	%xcc,	%l1,	%l4
	fnors	%f19,	%f6,	%f21
	movrgez	%g3,	0x3F7,	%o0
	andncc	%g7,	%l3,	%i4
	fnors	%f15,	%f3,	%f28
	movvs	%xcc,	%g4,	%o1
	ldd	[%l7 + 0x28],	%f26
	fpackfix	%f14,	%f11
	fmul8x16	%f17,	%f14,	%f14
	movvc	%icc,	%i3,	%i0
	andcc	%l6,	%l5,	%g6
	fnegd	%f26,	%f10
	fmovrsne	%i7,	%f17,	%f19
	movn	%icc,	%o4,	%o7
	subcc	%o6,	%o3,	%i2
	edge8	%l2,	%i6,	%o2
	subc	%g2,	0x1E9F,	%o5
	fmovscc	%xcc,	%f19,	%f23
	fors	%f24,	%f16,	%f12
	subccc	%i5,	%l0,	%i1
	edge8n	%g1,	%l1,	%l4
	sra	%g5,	0x18,	%o0
	fcmple16	%f2,	%f6,	%g7
	movn	%xcc,	%l3,	%g3
	udiv	%i4,	0x06FE,	%o1
	bshuffle	%f0,	%f20,	%f6
	xorcc	%i3,	0x0A43,	%g4
	fnor	%f16,	%f22,	%f12
	fnegd	%f14,	%f8
	fmovsvs	%xcc,	%f5,	%f7
	fmovrslz	%i0,	%f19,	%f9
	fcmpne32	%f10,	%f26,	%l5
	movneg	%xcc,	%g6,	%l6
	sir	0x0975
	save %i7, 0x1D11, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o7,	%o6,	%o3
	movn	%xcc,	%i2,	%l2
	fcmpgt32	%f8,	%f8,	%o2
	or	%i6,	%o5,	%i5
	fsrc1s	%f17,	%f26
	udivx	%g2,	0x0E49,	%i1
	lduw	[%l7 + 0x7C],	%l0
	fmovsne	%icc,	%f2,	%f18
	movrne	%g1,	%l1,	%g5
	xorcc	%l4,	%o0,	%g7
	edge32l	%l3,	%i4,	%o1
	movneg	%icc,	%i3,	%g4
	smulcc	%i0,	%g3,	%l5
	movne	%xcc,	%l6,	%g6
	ldub	[%l7 + 0x1C],	%i7
	nop
	set	0x6E, %l3
	ldsb	[%l7 + %l3],	%o4
	ldd	[%l7 + 0x58],	%f4
	umul	%o6,	%o7,	%o3
	fmovrse	%i2,	%f19,	%f30
	sllx	%l2,	0x07,	%i6
	add	%o5,	0x0D33,	%i5
	stw	%g2,	[%l7 + 0x34]
	fmovdle	%xcc,	%f25,	%f29
	lduw	[%l7 + 0x5C],	%o2
	save %i1, 0x1486, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x68],	%f23
	udivx	%l1,	0x1376,	%g5
	edge32n	%g1,	%o0,	%g7
	addccc	%l4,	%l3,	%i4
	save %i3, 0x04AB, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f8,	%f23
	movg	%xcc,	%o1,	%g3
	fornot2	%f24,	%f14,	%f2
	restore %l5, 0x0653, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g6,	%i7,	%i0
	sdiv	%o6,	0x1529,	%o7
	movcc	%xcc,	%o4,	%i2
	movcs	%xcc,	%l2,	%i6
	fmovdne	%xcc,	%f27,	%f24
	movvc	%icc,	%o3,	%i5
	movcc	%icc,	%o5,	%o2
	fmovsvs	%xcc,	%f0,	%f19
	fnor	%f0,	%f30,	%f24
	edge16	%g2,	%i1,	%l0
	std	%f10,	[%l7 + 0x68]
	edge32l	%g5,	%l1,	%g1
	fnands	%f27,	%f21,	%f19
	orncc	%o0,	0x0395,	%l4
	mulscc	%g7,	0x0283,	%i4
	stb	%i3,	[%l7 + 0x36]
	save %g4, 0x1085, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o1,	%l5,	%g3
	smulcc	%l6,	%i7,	%i0
	movge	%icc,	%g6,	%o6
	bshuffle	%f14,	%f28,	%f0
	movge	%xcc,	%o4,	%i2
	fornot1	%f8,	%f8,	%f22
	siam	0x0
	movg	%icc,	%l2,	%i6
	sdivcc	%o7,	0x0561,	%i5
	edge32ln	%o5,	%o3,	%o2
	lduh	[%l7 + 0x48],	%g2
	xnor	%i1,	0x0896,	%g5
	movvs	%xcc,	%l1,	%g1
	ldd	[%l7 + 0x40],	%f8
	edge32l	%o0,	%l0,	%g7
	ldd	[%l7 + 0x70],	%f28
	udivcc	%i4,	0x1AAB,	%i3
	movgu	%xcc,	%g4,	%l4
	fcmple32	%f30,	%f16,	%o1
	sll	%l3,	0x06,	%g3
	pdist	%f2,	%f4,	%f26
	fcmpd	%fcc2,	%f4,	%f20
	sethi	0x1F12,	%l5
	fmul8x16al	%f31,	%f14,	%f0
	smul	%l6,	0x002F,	%i7
	movge	%xcc,	%g6,	%o6
	st	%f5,	[%l7 + 0x34]
	andncc	%i0,	%i2,	%o4
	orn	%l2,	%i6,	%i5
	smulcc	%o7,	%o3,	%o2
	fmovrslz	%g2,	%f0,	%f7
	lduh	[%l7 + 0x50],	%o5
	fcmpne32	%f8,	%f12,	%g5
	sdiv	%l1,	0x0A48,	%i1
	stb	%g1,	[%l7 + 0x21]
	edge8	%l0,	%o0,	%i4
	subcc	%g7,	0x04A3,	%g4
	ldd	[%l7 + 0x48],	%i2
	movcs	%icc,	%o1,	%l4
	alignaddr	%l3,	%l5,	%g3
	sdiv	%i7,	0x10C0,	%l6
	udiv	%g6,	0x1ADC,	%o6
	edge16l	%i2,	%o4,	%i0
	movg	%xcc,	%l2,	%i5
	movg	%icc,	%i6,	%o7
	edge8n	%o2,	%o3,	%o5
	movl	%xcc,	%g2,	%l1
	smulcc	%g5,	0x08D6,	%g1
	edge32	%i1,	%l0,	%o0
	ldd	[%l7 + 0x58],	%g6
	st	%f29,	[%l7 + 0x68]
	xnor	%i4,	0x17DD,	%i3
	edge16l	%g4,	%l4,	%o1
	array32	%l5,	%l3,	%g3
	fcmped	%fcc1,	%f30,	%f18
	sll	%l6,	0x0A,	%i7
	edge16	%o6,	%i2,	%o4
	edge16	%g6,	%i0,	%i5
	ld	[%l7 + 0x1C],	%f28
	lduh	[%l7 + 0x08],	%i6
	fsrc1s	%f19,	%f13
	movleu	%icc,	%o7,	%o2
	smulcc	%l2,	0x1AF7,	%o3
	orncc	%o5,	%l1,	%g5
	smul	%g1,	%g2,	%i1
	movl	%xcc,	%o0,	%l0
	fornot1	%f8,	%f6,	%f18
	srax	%g7,	%i4,	%i3
	movcc	%icc,	%g4,	%l4
	subcc	%l5,	0x1A7C,	%o1
	movgu	%xcc,	%g3,	%l3
	sth	%i7,	[%l7 + 0x64]
	movvs	%icc,	%o6,	%i2
	sra	%l6,	0x13,	%o4
	fmovdcs	%xcc,	%f14,	%f20
	lduw	[%l7 + 0x2C],	%g6
	movpos	%xcc,	%i5,	%i6
	alignaddr	%o7,	%o2,	%i0
	umulcc	%l2,	0x126E,	%o5
	edge8n	%l1,	%o3,	%g1
	array8	%g2,	%i1,	%o0
	ldd	[%l7 + 0x50],	%f16
	sdivcc	%l0,	0x06A3,	%g7
	move	%icc,	%g5,	%i3
	xnor	%g4,	%l4,	%i4
	addccc	%l5,	0x118F,	%o1
	edge32l	%l3,	%g3,	%i7
	orn	%o6,	%i2,	%l6
	fornot2	%f10,	%f2,	%f14
	umul	%g6,	0x0B98,	%i5
	udiv	%o4,	0x177C,	%i6
	ldx	[%l7 + 0x48],	%o2
	edge8n	%i0,	%o7,	%o5
	andcc	%l1,	0x03EA,	%o3
	fmuld8ulx16	%f3,	%f20,	%f18
	addc	%g1,	%g2,	%i1
	fnot2	%f0,	%f18
	smul	%o0,	%l0,	%g7
	or	%g5,	0x1033,	%l2
	movneg	%xcc,	%g4,	%l4
	addccc	%i4,	0x1655,	%i3
	lduh	[%l7 + 0x0A],	%l5
	fcmpeq32	%f20,	%f26,	%l3
	fmovdn	%icc,	%f8,	%f27
	addc	%o1,	%g3,	%o6
	ldd	[%l7 + 0x38],	%i6
	fnot2s	%f15,	%f9
	movle	%xcc,	%i2,	%l6
	fmovsge	%icc,	%f4,	%f18
	fsrc2	%f2,	%f20
	edge8n	%g6,	%o4,	%i5
	movle	%icc,	%o2,	%i0
	movg	%icc,	%i6,	%o7
	sdivx	%o5,	0x18AA,	%l1
	xnor	%g1,	0x0034,	%o3
	array32	%i1,	%o0,	%g2
	array8	%g7,	%l0,	%l2
	andncc	%g5,	%g4,	%l4
	movre	%i4,	0x123,	%i3
	fmuld8sux16	%f29,	%f17,	%f18
	umulcc	%l3,	0x194B,	%o1
	movl	%xcc,	%g3,	%o6
	stx	%i7,	[%l7 + 0x58]
	fnegs	%f7,	%f22
	edge16l	%i2,	%l5,	%g6
	smulcc	%o4,	%i5,	%l6
	mulx	%o2,	0x14B0,	%i6
	fmovrde	%o7,	%f16,	%f2
	fmovrdgz	%o5,	%f28,	%f30
	sllx	%i0,	0x08,	%l1
	movpos	%icc,	%g1,	%i1
	movcc	%xcc,	%o3,	%o0
	xnor	%g2,	%g7,	%l2
	xorcc	%l0,	0x1293,	%g4
	fmovdl	%icc,	%f22,	%f29
	ldub	[%l7 + 0x7B],	%l4
	fpadd16	%f26,	%f20,	%f28
	edge32l	%i4,	%g5,	%i3
	movrlez	%o1,	%g3,	%l3
	edge32n	%o6,	%i2,	%l5
	fmovdne	%xcc,	%f24,	%f10
	udiv	%g6,	0x0F81,	%i7
	sdivcc	%o4,	0x04A6,	%l6
	ldx	[%l7 + 0x28],	%o2
	sub	%i5,	%o7,	%o5
	sdivcc	%i6,	0x1192,	%l1
	umul	%i0,	%i1,	%g1
	ldub	[%l7 + 0x2E],	%o0
	orcc	%g2,	%g7,	%o3
	subc	%l2,	0x0C44,	%g4
	edge16l	%l4,	%i4,	%l0
	ldub	[%l7 + 0x12],	%i3
	movre	%g5,	%o1,	%l3
	fmovrde	%o6,	%f16,	%f12
	lduh	[%l7 + 0x5E],	%i2
	edge32n	%g3,	%g6,	%l5
	sdivcc	%o4,	0x0D28,	%i7
	mulscc	%l6,	%o2,	%i5
	fmovsneg	%xcc,	%f15,	%f8
	fnot2s	%f9,	%f21
	ldd	[%l7 + 0x08],	%o4
	fmovde	%icc,	%f5,	%f19
	stb	%i6,	[%l7 + 0x0E]
	fcmpgt16	%f8,	%f12,	%l1
	fmovsn	%icc,	%f9,	%f23
	add	%o7,	%i1,	%g1
	movne	%icc,	%i0,	%g2
	edge32n	%o0,	%g7,	%l2
	fmovrslez	%o3,	%f20,	%f20
	orncc	%g4,	0x03F6,	%l4
	save %l0, 0x1E05, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f7,	%f3
	sub	%g5,	0x17F8,	%o1
	fors	%f15,	%f13,	%f9
	sdivx	%l3,	0x1B22,	%i3
	alignaddrl	%o6,	%i2,	%g3
	stx	%g6,	[%l7 + 0x70]
	stw	%l5,	[%l7 + 0x70]
	fmovrdlez	%o4,	%f20,	%f2
	st	%f10,	[%l7 + 0x20]
	umulcc	%i7,	0x0102,	%l6
	movrgez	%i5,	0x369,	%o5
	fexpand	%f26,	%f28
	sra	%o2,	%i6,	%l1
	subccc	%i1,	%o7,	%g1
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f14
	ldd	[%l7 + 0x50],	%i0
	array16	%g2,	%o0,	%l2
	fnors	%f20,	%f8,	%f16
	addc	%o3,	0x0B72,	%g4
	fmovdneg	%icc,	%f9,	%f10
	xor	%l4,	0x09AA,	%g7
	fcmple32	%f20,	%f26,	%i4
	fpsub32	%f10,	%f14,	%f20
	ld	[%l7 + 0x7C],	%f26
	fnot1	%f18,	%f20
	fmovsn	%icc,	%f29,	%f20
	fpsub16	%f28,	%f18,	%f22
	fxnor	%f18,	%f20,	%f26
	fornot2s	%f3,	%f30,	%f23
	edge16	%g5,	%o1,	%l0
	fmovsgu	%icc,	%f24,	%f19
	sethi	0x1065,	%l3
	movcc	%xcc,	%o6,	%i2
	ldx	[%l7 + 0x30],	%g3
	fandnot1s	%f30,	%f28,	%f2
	stw	%g6,	[%l7 + 0x08]
	sdiv	%i3,	0x1F9C,	%l5
	movgu	%icc,	%i7,	%l6
	sll	%o4,	0x1B,	%o5
	srlx	%i5,	0x09,	%o2
	addcc	%i6,	%i1,	%o7
	sth	%g1,	[%l7 + 0x74]
	edge32	%l1,	%g2,	%i0
	edge32l	%l2,	%o3,	%g4
	bshuffle	%f20,	%f4,	%f8
	movgu	%icc,	%l4,	%o0
	ldsb	[%l7 + 0x55],	%g7
	fpack16	%f30,	%f18
	fmovdne	%xcc,	%f14,	%f26
	edge8	%i4,	%g5,	%o1
	or	%l3,	%l0,	%i2
	movvc	%xcc,	%g3,	%g6
	sdivcc	%i3,	0x08BF,	%l5
	movg	%icc,	%i7,	%l6
	fandnot1s	%f20,	%f30,	%f14
	fpackfix	%f10,	%f13
	udivcc	%o4,	0x08F7,	%o6
	umulcc	%o5,	0x032C,	%i5
	orcc	%o2,	0x035F,	%i1
	udivcc	%o7,	0x012F,	%g1
	fornot1s	%f1,	%f31,	%f7
	fmovse	%icc,	%f1,	%f16
	edge16ln	%i6,	%l1,	%g2
	movne	%icc,	%i0,	%o3
	lduh	[%l7 + 0x30],	%l2
	edge32n	%g4,	%l4,	%o0
	edge16ln	%g7,	%g5,	%i4
	movrne	%o1,	0x0B8,	%l0
	fmovrdlz	%l3,	%f24,	%f0
	fmovsgu	%xcc,	%f16,	%f24
	fnor	%f14,	%f12,	%f26
	sdivx	%g3,	0x1B6C,	%i2
	udivcc	%i3,	0x16B1,	%g6
	or	%i7,	%l5,	%l6
	fsrc1	%f6,	%f28
	stx	%o4,	[%l7 + 0x30]
	ldd	[%l7 + 0x58],	%f20
	fpack16	%f14,	%f0
	movn	%icc,	%o5,	%o6
	ldub	[%l7 + 0x25],	%o2
	movl	%xcc,	%i5,	%o7
	movvc	%icc,	%g1,	%i1
	ldsh	[%l7 + 0x0A],	%i6
	fxor	%f30,	%f26,	%f20
	sdiv	%g2,	0x1C38,	%l1
	addccc	%i0,	%l2,	%g4
	mulscc	%o3,	%l4,	%o0
	stb	%g5,	[%l7 + 0x09]
	movrgez	%i4,	%g7,	%l0
	fmovdleu	%xcc,	%f25,	%f25
	popc	%o1,	%l3
	popc	%i2,	%i3
	movn	%icc,	%g3,	%i7
	std	%f18,	[%l7 + 0x58]
	fxnor	%f8,	%f10,	%f8
	fmul8x16	%f23,	%f12,	%f22
	fandnot1	%f2,	%f24,	%f10
	srl	%l5,	%g6,	%o4
	sra	%o5,	%l6,	%o2
	movneg	%icc,	%i5,	%o7
	sir	0x1E58
	sdiv	%g1,	0x0CDB,	%i1
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%i6
	fmovdn	%icc,	%f10,	%f16
	andcc	%g2,	0x073F,	%o6
	stb	%i0,	[%l7 + 0x4B]
	lduw	[%l7 + 0x28],	%l1
	subc	%l2,	0x14C6,	%g4
	orncc	%l4,	%o0,	%o3
	or	%i4,	0x1CBA,	%g7
	fmovda	%icc,	%f19,	%f7
	fmovs	%f8,	%f3
	fcmpne32	%f6,	%f10,	%g5
	nop
	set	0x27, %o3
	ldub	[%l7 + %o3],	%o1
	fmovsa	%xcc,	%f31,	%f3
	fmul8x16au	%f22,	%f7,	%f8
	movneg	%icc,	%l3,	%i2
	smulcc	%i3,	0x1874,	%l0
	edge16l	%i7,	%g3,	%l5
	movrgz	%g6,	%o5,	%o4
	movle	%xcc,	%o2,	%l6
	fpsub32s	%f15,	%f4,	%f11
	edge32l	%o7,	%g1,	%i1
	ldsb	[%l7 + 0x0E],	%i5
	movl	%xcc,	%i6,	%o6
	movcs	%icc,	%i0,	%g2
	fmovsg	%xcc,	%f7,	%f13
	edge32ln	%l1,	%l2,	%g4
	movn	%icc,	%l4,	%o3
	stw	%o0,	[%l7 + 0x38]
	sdiv	%g7,	0x1E6B,	%i4
	movle	%xcc,	%g5,	%o1
	fnors	%f22,	%f26,	%f0
	movcc	%icc,	%l3,	%i3
	movcc	%icc,	%l0,	%i7
	fmovde	%icc,	%f14,	%f10
	array32	%g3,	%l5,	%i2
	nop
	set	0x55, %i4
	stb	%g6,	[%l7 + %i4]
	fmovspos	%icc,	%f26,	%f19
	movrlz	%o5,	%o4,	%l6
	fmul8x16	%f17,	%f26,	%f22
	srax	%o2,	0x18,	%o7
	fpackfix	%f8,	%f30
	edge32n	%i1,	%g1,	%i6
	subcc	%o6,	0x0E82,	%i5
	orncc	%i0,	0x153E,	%g2
	fones	%f7
	smul	%l2,	%g4,	%l4
	std	%f4,	[%l7 + 0x58]
	xorcc	%o3,	%o0,	%g7
	udiv	%i4,	0x1097,	%l1
	orn	%g5,	0x1B0B,	%o1
	fpsub16	%f14,	%f28,	%f20
	edge32n	%l3,	%i3,	%i7
	stw	%g3,	[%l7 + 0x7C]
	fmovdpos	%xcc,	%f31,	%f4
	sra	%l5,	%i2,	%l0
	lduh	[%l7 + 0x7E],	%g6
	movge	%xcc,	%o4,	%l6
	movle	%xcc,	%o5,	%o7
	edge16n	%i1,	%o2,	%i6
	subcc	%g1,	%o6,	%i0
	and	%i5,	0x06C1,	%l2
	fcmpeq32	%f28,	%f6,	%g4
	and	%g2,	%l4,	%o0
	edge32n	%o3,	%g7,	%i4
	fmovdle	%xcc,	%f3,	%f26
	and	%l1,	%o1,	%l3
	fnor	%f14,	%f2,	%f28
	xorcc	%g5,	%i7,	%g3
	orcc	%l5,	%i3,	%l0
	orcc	%g6,	%o4,	%i2
	st	%f15,	[%l7 + 0x70]
	addcc	%o5,	%o7,	%i1
	movge	%xcc,	%o2,	%i6
	srlx	%l6,	%o6,	%i0
	stw	%i5,	[%l7 + 0x08]
	fmovrdlez	%g1,	%f14,	%f20
	movneg	%xcc,	%l2,	%g2
	ldsb	[%l7 + 0x7E],	%g4
	fmovse	%icc,	%f0,	%f25
	fmovdne	%icc,	%f11,	%f26
	array8	%o0,	%l4,	%g7
	movne	%icc,	%o3,	%l1
	fnot2s	%f7,	%f20
	std	%f18,	[%l7 + 0x10]
	edge32ln	%o1,	%l3,	%g5
	addccc	%i4,	0x0BF3,	%g3
	fones	%f8
	fpsub16s	%f25,	%f18,	%f16
	andcc	%l5,	%i7,	%l0
	andn	%i3,	%g6,	%i2
	udivcc	%o5,	0x0F91,	%o7
	ldsb	[%l7 + 0x32],	%o4
	fmovrsgz	%o2,	%f6,	%f27
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	udivcc	%l6,	0x1D2F,	%o6
	add	%i5,	%g1,	%i0
	fmovsleu	%icc,	%f17,	%f30
	array8	%l2,	%g4,	%o0
	srl	%l4,	0x09,	%g7
	edge8	%g2,	%l1,	%o3
	fmovde	%xcc,	%f4,	%f23
	fpsub16s	%f20,	%f0,	%f25
	fmul8sux16	%f22,	%f30,	%f10
	mulscc	%l3,	%g5,	%o1
	fmovsl	%icc,	%f16,	%f31
	add	%i4,	%g3,	%i7
	movvs	%xcc,	%l0,	%i3
	movre	%l5,	0x231,	%g6
	stx	%i2,	[%l7 + 0x10]
	ldub	[%l7 + 0x74],	%o7
	restore %o5, 0x05FD, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i6,	%o4,	%i1
	movrlz	%l6,	%o6,	%g1
	edge8n	%i5,	%i0,	%g4
	ldd	[%l7 + 0x28],	%f24
	movpos	%xcc,	%l2,	%o0
	lduh	[%l7 + 0x26],	%g7
	movvc	%xcc,	%g2,	%l1
	srlx	%l4,	0x17,	%o3
	umulcc	%g5,	%o1,	%l3
	fsrc2s	%f1,	%f9
	umul	%g3,	0x0B94,	%i4
	sth	%l0,	[%l7 + 0x5E]
	fmovdcc	%icc,	%f5,	%f18
	movl	%icc,	%i3,	%l5
	fcmpes	%fcc0,	%f0,	%f22
	smulcc	%i7,	%i2,	%o7
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	fmovsgu	%xcc,	%f5,	%f23
	fmovse	%xcc,	%f30,	%f12
	or	%i6,	0x019C,	%g6
	fmovrdne	%i1,	%f6,	%f28
	stw	%o4,	[%l7 + 0x44]
	ldub	[%l7 + 0x71],	%o6
	xnorcc	%l6,	0x1FE8,	%g1
	array8	%i5,	%i0,	%l2
	udivcc	%o0,	0x1E06,	%g4
	sir	0x0E7E
	udivx	%g7,	0x1223,	%l1
	srlx	%g2,	%l4,	%g5
	movn	%icc,	%o1,	%o3
	sdiv	%l3,	0x0041,	%g3
	edge32l	%l0,	%i4,	%i3
	subc	%l5,	%i2,	%i7
	ldub	[%l7 + 0x2A],	%o7
	movrgez	%o5,	%o2,	%g6
	edge32	%i1,	%i6,	%o4
	andncc	%o6,	%g1,	%l6
	movrgez	%i5,	%i0,	%l2
	smulcc	%g4,	0x115F,	%g7
	fmul8ulx16	%f20,	%f22,	%f24
	movcs	%xcc,	%o0,	%g2
	orncc	%l4,	%g5,	%l1
	stw	%o1,	[%l7 + 0x70]
	std	%f28,	[%l7 + 0x10]
	fornot1	%f18,	%f26,	%f30
	fmovsle	%icc,	%f7,	%f7
	mulscc	%l3,	%o3,	%l0
	subccc	%g3,	%i3,	%i4
	fcmpgt16	%f30,	%f6,	%l5
	fmovdcs	%xcc,	%f29,	%f21
	andncc	%i7,	%o7,	%o5
	movrgez	%o2,	%i2,	%i1
	movrne	%i6,	0x247,	%g6
	orcc	%o6,	0x070E,	%o4
	movneg	%xcc,	%g1,	%i5
	andn	%i0,	0x1B37,	%l2
	xnor	%l6,	%g7,	%g4
	movle	%icc,	%g2,	%o0
	edge16l	%l4,	%l1,	%o1
	fmovdge	%icc,	%f6,	%f5
	sra	%g5,	%o3,	%l0
	srl	%l3,	%g3,	%i3
	stw	%i4,	[%l7 + 0x50]
	std	%f16,	[%l7 + 0x68]
	ldub	[%l7 + 0x09],	%l5
	fors	%f11,	%f20,	%f15
	smulcc	%o7,	%o5,	%i7
	fmovdleu	%xcc,	%f26,	%f31
	fxors	%f0,	%f6,	%f4
	movgu	%icc,	%i2,	%o2
	stb	%i1,	[%l7 + 0x37]
	popc	0x167D,	%i6
	ldub	[%l7 + 0x43],	%g6
	fmovdleu	%icc,	%f25,	%f18
	fmovrsgz	%o6,	%f22,	%f28
	edge32ln	%o4,	%g1,	%i5
	sll	%i0,	%l6,	%g7
	movre	%g4,	%g2,	%l2
	ldx	[%l7 + 0x08],	%l4
	fmovrdne	%l1,	%f12,	%f8
	ldd	[%l7 + 0x30],	%o0
	restore %g5, %o3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l3,	%o1,	%i3
	fmovscs	%xcc,	%f4,	%f24
	fmovrde	%g3,	%f14,	%f20
	fmovde	%xcc,	%f11,	%f25
	edge8ln	%l5,	%o7,	%o5
	fornot1	%f20,	%f24,	%f20
	subccc	%i4,	%i7,	%i2
	edge8l	%i1,	%i6,	%o2
	movneg	%xcc,	%o6,	%g6
	movrne	%g1,	%o4,	%i5
	mulscc	%l6,	0x15AE,	%g7
	movrne	%g4,	0x351,	%i0
	fcmple32	%f22,	%f28,	%g2
	xorcc	%l4,	%l2,	%o0
	fsrc1	%f12,	%f8
	fmovsleu	%icc,	%f10,	%f15
	save %l1, %g5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x6E, %l2
	lduh	[%l7 + %l2],	%l3
	bshuffle	%f20,	%f6,	%f26
	fcmpes	%fcc0,	%f15,	%f11
	sth	%o1,	[%l7 + 0x74]
	movgu	%icc,	%i3,	%g3
	sdiv	%l5,	0x15FE,	%o7
	orcc	%o5,	0x010D,	%l0
	andn	%i4,	%i7,	%i1
	fmovrdlez	%i6,	%f20,	%f22
	movleu	%xcc,	%i2,	%o2
	ldsw	[%l7 + 0x4C],	%o6
	fmovrslz	%g6,	%f0,	%f4
	umul	%o4,	%g1,	%i5
	movgu	%xcc,	%g7,	%g4
	fcmpeq16	%f30,	%f30,	%l6
	addccc	%g2,	0x02CD,	%i0
	movgu	%icc,	%l4,	%l2
	ldub	[%l7 + 0x2B],	%o0
	mulx	%g5,	0x1AF8,	%o3
	stx	%l1,	[%l7 + 0x18]
	edge16ln	%o1,	%l3,	%g3
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	movle	%xcc,	%o5,	%l0
	movrlez	%i4,	0x040,	%i7
	sdivcc	%o7,	0x1D67,	%i1
	smulcc	%i2,	%i6,	%o6
	movcc	%icc,	%o2,	%o4
	movrgez	%g1,	0x269,	%g6
	edge16n	%g7,	%i5,	%l6
	nop
	set	0x62, %l6
	ldsb	[%l7 + %l6],	%g4
	xnorcc	%g2,	0x1F59,	%i0
	edge32ln	%l4,	%l2,	%g5
	alignaddrl	%o3,	%l1,	%o0
	subc	%l3,	%g3,	%o1
	fmovsg	%xcc,	%f21,	%f21
	fmovdneg	%icc,	%f25,	%f15
	umulcc	%i3,	%l5,	%o5
	fand	%f24,	%f12,	%f14
	fmovrdgez	%i4,	%f6,	%f22
	movrgz	%i7,	0x17E,	%l0
	sdivcc	%i1,	0x0CED,	%o7
	fmovsvs	%icc,	%f15,	%f4
	srl	%i6,	%o6,	%i2
	edge16l	%o4,	%g1,	%o2
	or	%g6,	0x0EEB,	%g7
	pdist	%f8,	%f8,	%f20
	sdiv	%l6,	0x1ADE,	%g4
	movre	%i5,	%g2,	%i0
	fmovdge	%xcc,	%f29,	%f24
	sir	0x19EE
	srl	%l4,	%g5,	%o3
	fmuld8sux16	%f3,	%f8,	%f22
	bshuffle	%f6,	%f20,	%f16
	umulcc	%l1,	0x1EA9,	%o0
	add	%l3,	%l2,	%o1
	sub	%i3,	%l5,	%g3
	fmul8ulx16	%f16,	%f30,	%f30
	edge16ln	%o5,	%i4,	%l0
	edge16ln	%i1,	%i7,	%o7
	edge8ln	%o6,	%i2,	%i6
	fmovsge	%icc,	%f2,	%f15
	restore %o4, %o2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g1,	%l6
	xorcc	%g7,	0x10BC,	%i5
	fabsd	%f24,	%f8
	ldsb	[%l7 + 0x6F],	%g2
	fsrc1	%f20,	%f6
	st	%f2,	[%l7 + 0x44]
	fmovdgu	%icc,	%f14,	%f21
	addccc	%g4,	0x1850,	%i0
	movle	%icc,	%g5,	%l4
	fnors	%f19,	%f16,	%f11
	lduw	[%l7 + 0x28],	%o3
	alignaddr	%o0,	%l1,	%l2
	subcc	%l3,	%o1,	%l5
	mova	%xcc,	%i3,	%o5
	alignaddr	%i4,	%g3,	%l0
	umul	%i1,	%o7,	%i7
	udiv	%o6,	0x1320,	%i6
	fmovdpos	%xcc,	%f15,	%f19
	ldsh	[%l7 + 0x40],	%o4
	movcs	%xcc,	%o2,	%g6
	sdivcc	%i2,	0x03FB,	%g1
	lduw	[%l7 + 0x3C],	%g7
	movrlez	%i5,	0x097,	%l6
	add	%g4,	0x183D,	%i0
	movgu	%xcc,	%g5,	%l4
	edge32ln	%o3,	%o0,	%g2
	movgu	%icc,	%l1,	%l3
	fmovsg	%xcc,	%f30,	%f8
	movcs	%xcc,	%o1,	%l5
	movrgz	%i3,	0x2C5,	%o5
	xorcc	%l2,	%i4,	%l0
	sdivx	%i1,	0x19A4,	%g3
	sdiv	%o7,	0x07E1,	%i7
	sir	0x1ACB
	andn	%o6,	0x1134,	%i6
	fmovse	%xcc,	%f28,	%f5
	ldd	[%l7 + 0x10],	%f2
	addc	%o2,	%g6,	%i2
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%o4
	sth	%g7,	[%l7 + 0x68]
	orn	%g1,	%i5,	%g4
	ldsb	[%l7 + 0x6C],	%i0
	andncc	%g5,	%l4,	%l6
	save %o3, 0x01D3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x30],	%l1
	lduh	[%l7 + 0x50],	%l3
	edge16l	%g2,	%o1,	%i3
	fcmpes	%fcc1,	%f28,	%f31
	array32	%l5,	%l2,	%o5
	fnegd	%f10,	%f8
	ldub	[%l7 + 0x38],	%l0
	ldx	[%l7 + 0x58],	%i4
	srlx	%i1,	0x0B,	%g3
	lduw	[%l7 + 0x74],	%o7
	edge32ln	%o6,	%i7,	%i6
	srax	%g6,	0x0B,	%o2
	orcc	%i2,	0x0F93,	%o4
	edge16ln	%g1,	%i5,	%g4
	subccc	%i0,	%g5,	%g7
	movle	%xcc,	%l6,	%l4
	srlx	%o3,	%l1,	%o0
	andcc	%g2,	%l3,	%i3
	edge8l	%o1,	%l2,	%l5
	popc	%l0,	%i4
	movpos	%xcc,	%i1,	%o5
	orncc	%o7,	%g3,	%i7
	mulscc	%i6,	0x1C5A,	%o6
	addcc	%g6,	0x1DF0,	%i2
	ldd	[%l7 + 0x68],	%o4
	ldx	[%l7 + 0x48],	%o2
	fandnot2	%f2,	%f0,	%f28
	andncc	%g1,	%i5,	%i0
	srax	%g5,	0x1C,	%g7
	lduw	[%l7 + 0x0C],	%g4
	fand	%f30,	%f10,	%f24
	xnor	%l6,	%l4,	%o3
	xnor	%o0,	%l1,	%l3
	fcmps	%fcc0,	%f19,	%f9
	fnors	%f23,	%f14,	%f15
	movcs	%xcc,	%i3,	%o1
	andn	%g2,	%l5,	%l2
	fnegs	%f30,	%f25
	subcc	%l0,	%i4,	%i1
	ldsh	[%l7 + 0x6C],	%o5
	mova	%icc,	%g3,	%i7
	array8	%o7,	%o6,	%g6
	mulx	%i6,	0x11BF,	%i2
	edge8ln	%o2,	%o4,	%i5
	fpadd16s	%f4,	%f0,	%f28
	xnor	%i0,	%g5,	%g7
	lduw	[%l7 + 0x10],	%g1
	srax	%g4,	0x0C,	%l6
	sth	%l4,	[%l7 + 0x28]
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	stw	%i3,	[%l7 + 0x3C]
	srlx	%o3,	0x0E,	%o1
	and	%g2,	0x1CED,	%l5
	sdiv	%l0,	0x07A4,	%i4
	popc	%l2,	%o5
	edge32n	%i1,	%i7,	%o7
	subcc	%o6,	%g6,	%g3
	edge16	%i6,	%i2,	%o4
	movneg	%xcc,	%o2,	%i5
	sra	%i0,	0x14,	%g7
	add	%g1,	0x185E,	%g5
	movrlez	%g4,	0x0CE,	%l4
	addccc	%o0,	0x01A2,	%l6
	sth	%l3,	[%l7 + 0x7C]
	xnor	%l1,	0x1CCC,	%o3
	fmovrde	%o1,	%f22,	%f10
	fmovsge	%xcc,	%f8,	%f27
	lduh	[%l7 + 0x56],	%g2
	fnot1s	%f18,	%f21
	umulcc	%l5,	0x0CA0,	%l0
	sra	%i4,	%l2,	%i3
	movvs	%xcc,	%i1,	%o5
	smulcc	%i7,	%o6,	%g6
	edge16n	%g3,	%o7,	%i6
	edge16l	%o4,	%o2,	%i5
	bshuffle	%f20,	%f16,	%f28
	move	%xcc,	%i2,	%i0
	xorcc	%g7,	0x1F0D,	%g1
	edge16n	%g4,	%g5,	%o0
	fmovrdlz	%l6,	%f12,	%f24
	stw	%l4,	[%l7 + 0x34]
	sir	0x051E
	movn	%icc,	%l1,	%l3
	fpack16	%f4,	%f3
	fmovd	%f24,	%f14
	fexpand	%f1,	%f12
	movrgez	%o3,	%o1,	%g2
	nop
	set	0x48, %o7
	std	%f28,	[%l7 + %o7]
	movvs	%xcc,	%l5,	%i4
	xnorcc	%l2,	%i3,	%i1
	movne	%icc,	%l0,	%o5
	alignaddr	%i7,	%o6,	%g3
	edge32	%g6,	%o7,	%o4
	movrne	%i6,	%i5,	%i2
	fmovrslez	%o2,	%f12,	%f17
	edge16ln	%g7,	%g1,	%i0
	addccc	%g5,	%o0,	%l6
	std	%f26,	[%l7 + 0x48]
	edge32n	%g4,	%l4,	%l1
	array8	%l3,	%o1,	%g2
	stw	%o3,	[%l7 + 0x24]
	edge32l	%l5,	%i4,	%i3
	nop
	set	0x26, %i1
	lduh	[%l7 + %i1],	%i1
	fpadd16s	%f11,	%f27,	%f9
	edge8	%l2,	%o5,	%l0
	movrlz	%o6,	%g3,	%i7
	movrgez	%o7,	%o4,	%g6
	sdiv	%i6,	0x10E6,	%i5
	lduh	[%l7 + 0x78],	%i2
	ldd	[%l7 + 0x70],	%o2
	fmovdg	%xcc,	%f3,	%f9
	orn	%g7,	0x0FA8,	%g1
	array16	%g5,	%o0,	%i0
	mova	%xcc,	%l6,	%g4
	edge32n	%l4,	%l1,	%l3
	stb	%o1,	[%l7 + 0x24]
	udivcc	%g2,	0x0142,	%l5
	edge8ln	%i4,	%o3,	%i1
	srax	%i3,	%l2,	%l0
	stw	%o5,	[%l7 + 0x78]
	stx	%o6,	[%l7 + 0x18]
	lduh	[%l7 + 0x60],	%i7
	fmovdcc	%icc,	%f31,	%f11
	movrne	%g3,	0x243,	%o7
	movgu	%icc,	%g6,	%o4
	ldx	[%l7 + 0x18],	%i6
	edge32	%i5,	%o2,	%i2
	movne	%icc,	%g7,	%g1
	sdiv	%o0,	0x0001,	%g5
	movcc	%xcc,	%i0,	%l6
	fmovdg	%icc,	%f9,	%f26
	movvc	%xcc,	%l4,	%g4
	fmovrsne	%l3,	%f2,	%f18
	sra	%l1,	%o1,	%l5
	movvc	%xcc,	%g2,	%i4
	xnor	%i1,	0x02A8,	%i3
	ldd	[%l7 + 0x20],	%f22
	lduh	[%l7 + 0x1E],	%l2
	orn	%o3,	%o5,	%o6
	movg	%xcc,	%i7,	%g3
	fandnot2	%f12,	%f8,	%f22
	fnands	%f27,	%f7,	%f26
	edge8	%l0,	%g6,	%o4
	array32	%o7,	%i6,	%o2
	fexpand	%f14,	%f12
	edge32n	%i5,	%g7,	%g1
	ldsb	[%l7 + 0x37],	%i2
	movl	%icc,	%o0,	%i0
	movcc	%xcc,	%l6,	%g5
	ldd	[%l7 + 0x08],	%f22
	ldd	[%l7 + 0x78],	%g4
	sllx	%l4,	%l3,	%l1
	fnegd	%f6,	%f8
	fxors	%f3,	%f1,	%f28
	subcc	%o1,	0x1A55,	%g2
	fcmpne16	%f0,	%f12,	%l5
	addccc	%i1,	%i4,	%l2
	mulscc	%i3,	0x025A,	%o3
	sdiv	%o6,	0x0BF2,	%o5
	subccc	%i7,	0x1BA6,	%l0
	stx	%g6,	[%l7 + 0x08]
	fmovrsgez	%o4,	%f30,	%f25
	alignaddr	%g3,	%o7,	%o2
	pdist	%f8,	%f28,	%f20
	addcc	%i5,	%i6,	%g7
	fzero	%f4
	array32	%i2,	%g1,	%o0
	umul	%i0,	%l6,	%g4
	andcc	%g5,	0x08B5,	%l3
	orn	%l1,	%l4,	%o1
	ldd	[%l7 + 0x40],	%f18
	movneg	%icc,	%g2,	%l5
	fpack16	%f4,	%f30
	ldd	[%l7 + 0x68],	%i4
	xnor	%i1,	%l2,	%i3
	movn	%icc,	%o6,	%o5
	movne	%xcc,	%o3,	%i7
	stb	%g6,	[%l7 + 0x34]
	xnorcc	%l0,	%o4,	%g3
	movre	%o7,	0x1AE,	%o2
	fzero	%f10
	std	%f30,	[%l7 + 0x30]
	fmovsleu	%icc,	%f6,	%f6
	subc	%i6,	%i5,	%i2
	movvc	%icc,	%g1,	%g7
	movre	%i0,	0x0B0,	%o0
	edge8n	%l6,	%g5,	%l3
	move	%icc,	%l1,	%g4
	fmovsg	%xcc,	%f7,	%f12
	udivx	%l4,	0x1D34,	%g2
	stb	%l5,	[%l7 + 0x30]
	movpos	%icc,	%o1,	%i1
	xor	%l2,	%i4,	%i3
	umul	%o6,	0x0B1A,	%o5
	subccc	%o3,	0x1B7E,	%i7
	movpos	%xcc,	%l0,	%g6
	stw	%g3,	[%l7 + 0x20]
	popc	%o4,	%o2
	ldd	[%l7 + 0x58],	%o6
	st	%f11,	[%l7 + 0x68]
	movrlz	%i6,	%i5,	%i2
	movle	%xcc,	%g1,	%g7
	udiv	%i0,	0x0E6D,	%l6
	array32	%o0,	%l3,	%g5
	fmovrdlz	%g4,	%f10,	%f16
	movpos	%icc,	%l1,	%l4
	movrgz	%g2,	0x115,	%l5
	edge32l	%o1,	%l2,	%i4
	subccc	%i1,	0x113B,	%o6
	fmovsvs	%icc,	%f9,	%f28
	movn	%icc,	%o5,	%i3
	ldsw	[%l7 + 0x6C],	%i7
	fpsub16s	%f8,	%f30,	%f6
	addc	%l0,	0x192E,	%g6
	fmovdl	%icc,	%f28,	%f16
	ldsb	[%l7 + 0x16],	%g3
	movne	%xcc,	%o4,	%o3
	sll	%o2,	%o7,	%i6
	movle	%xcc,	%i2,	%i5
	sdivx	%g7,	0x0071,	%i0
	fmul8x16al	%f18,	%f19,	%f14
	movrgz	%g1,	0x149,	%o0
	fand	%f16,	%f18,	%f8
	addc	%l3,	%l6,	%g5
	sethi	0x00EA,	%g4
	movleu	%icc,	%l4,	%g2
	smulcc	%l1,	%l5,	%l2
	ld	[%l7 + 0x14],	%f12
	movleu	%icc,	%i4,	%i1
	movvc	%icc,	%o1,	%o5
	fands	%f14,	%f22,	%f26
	fmovs	%f28,	%f4
	subccc	%i3,	0x1F6F,	%o6
	edge32l	%i7,	%g6,	%g3
	smulcc	%l0,	%o4,	%o2
	andcc	%o3,	0x0A1C,	%o7
	sdivx	%i6,	0x07C8,	%i2
	fcmple32	%f24,	%f12,	%g7
	add	%i5,	0x195F,	%i0
	subccc	%g1,	%o0,	%l6
	sdivcc	%g5,	0x08FC,	%g4
	xor	%l3,	0x0F62,	%g2
	andncc	%l1,	%l5,	%l2
	edge32n	%l4,	%i1,	%i4
	sllx	%o5,	0x0A,	%o1
	move	%xcc,	%o6,	%i3
	edge8n	%i7,	%g3,	%g6
	bshuffle	%f20,	%f22,	%f4
	fmovsvs	%xcc,	%f16,	%f13
	edge32l	%o4,	%l0,	%o2
	movvs	%icc,	%o7,	%i6
	ldub	[%l7 + 0x40],	%i2
	fpsub16s	%f19,	%f26,	%f8
	fornot1s	%f22,	%f2,	%f10
	movn	%xcc,	%g7,	%i5
	fmovscs	%icc,	%f27,	%f4
	stw	%o3,	[%l7 + 0x30]
	movl	%xcc,	%g1,	%i0
	fmovdne	%icc,	%f6,	%f24
	edge16n	%o0,	%l6,	%g4
	srax	%l3,	%g2,	%g5
	umul	%l5,	%l1,	%l4
	movleu	%xcc,	%l2,	%i4
	fpackfix	%f26,	%f30
	movpos	%xcc,	%i1,	%o5
	movrne	%o6,	0x2BD,	%o1
	xnor	%i7,	0x0C99,	%g3
	sub	%i3,	%o4,	%l0
	fmovrslz	%o2,	%f29,	%f18
	subccc	%o7,	0x0E3E,	%g6
	edge8l	%i6,	%i2,	%i5
	fandnot1	%f10,	%f10,	%f16
	movcc	%icc,	%g7,	%o3
	array8	%i0,	%g1,	%o0
	fpadd32s	%f21,	%f23,	%f10
	smulcc	%l6,	0x16AC,	%g4
	movrne	%g2,	%g5,	%l3
	xnorcc	%l1,	%l5,	%l4
	edge32	%l2,	%i1,	%o5
	fand	%f18,	%f10,	%f2
	umul	%o6,	0x0E27,	%o1
	ldsh	[%l7 + 0x52],	%i4
	xnor	%g3,	%i3,	%i7
	array32	%l0,	%o2,	%o7
	for	%f18,	%f30,	%f22
	array16	%o4,	%i6,	%i2
	std	%f30,	[%l7 + 0x28]
	fmovrslez	%g6,	%f29,	%f6
	sra	%g7,	%o3,	%i5
	for	%f6,	%f16,	%f26
	alignaddrl	%i0,	%g1,	%l6
	subc	%o0,	%g4,	%g2
	movre	%g5,	0x2E2,	%l1
	edge32n	%l3,	%l5,	%l2
	lduh	[%l7 + 0x0A],	%i1
	fabsd	%f6,	%f4
	movle	%icc,	%o5,	%l4
	movpos	%xcc,	%o1,	%o6
	movl	%xcc,	%g3,	%i4
	movcs	%icc,	%i7,	%i3
	or	%o2,	0x0CB3,	%l0
	fmovdcc	%icc,	%f18,	%f14
	movrgez	%o7,	0x18F,	%o4
	fmovrsne	%i2,	%f19,	%f23
	umulcc	%g6,	0x11E4,	%g7
	sub	%o3,	0x0114,	%i5
	fpadd32s	%f22,	%f15,	%f24
	ldd	[%l7 + 0x78],	%f0
	ld	[%l7 + 0x24],	%f18
	xor	%i6,	%g1,	%i0
	movrgez	%o0,	%l6,	%g4
	sdiv	%g2,	0x1F93,	%g5
	orcc	%l1,	0x06A1,	%l3
	sdivx	%l5,	0x1051,	%l2
	sra	%o5,	%l4,	%o1
	fmovrdne	%i1,	%f12,	%f10
	fcmpeq32	%f22,	%f2,	%o6
	movvc	%icc,	%i4,	%i7
	movcs	%icc,	%g3,	%i3
	fzero	%f20
	srax	%l0,	%o7,	%o4
	fnands	%f14,	%f3,	%f6
	movvc	%icc,	%i2,	%o2
	movvs	%xcc,	%g7,	%o3
	mova	%xcc,	%g6,	%i5
	movpos	%xcc,	%g1,	%i0
	fxnor	%f2,	%f28,	%f22
	addcc	%o0,	%i6,	%g4
	smul	%g2,	%l6,	%l1
	array8	%g5,	%l3,	%l5
	edge32n	%o5,	%l4,	%o1
	movg	%xcc,	%l2,	%o6
	fsrc1s	%f5,	%f17
	mulx	%i4,	%i7,	%i1
	fmovsgu	%xcc,	%f25,	%f25
	fabsd	%f8,	%f2
	sllx	%g3,	%l0,	%o7
	fmovdgu	%xcc,	%f8,	%f10
	edge32n	%o4,	%i2,	%i3
	fmovsa	%icc,	%f28,	%f29
	fzeros	%f7
	movrlz	%g7,	0x388,	%o3
	fnot1s	%f12,	%f27
	orcc	%g6,	%o2,	%g1
	add	%i0,	0x1DF5,	%o0
	movn	%icc,	%i5,	%i6
	movrgez	%g2,	%l6,	%l1
	addc	%g5,	0x1847,	%l3
	srl	%g4,	%o5,	%l5
	save %o1, %l4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f16,	%f2,	%f20
	mulx	%i4,	0x1086,	%i7
	subccc	%l2,	0x0933,	%i1
	movleu	%xcc,	%g3,	%o7
	fcmpd	%fcc1,	%f10,	%f30
	subc	%l0,	%i2,	%i3
	array32	%g7,	%o4,	%o3
	edge16	%g6,	%g1,	%o2
	ldub	[%l7 + 0x08],	%o0
	edge32ln	%i0,	%i5,	%i6
	xnorcc	%l6,	%l1,	%g5
	orncc	%l3,	0x11F8,	%g2
	fmovdcs	%icc,	%f9,	%f27
	fcmped	%fcc2,	%f10,	%f18
	sllx	%g4,	0x15,	%l5
	movleu	%icc,	%o1,	%o5
	fpadd16	%f18,	%f12,	%f16
	array8	%l4,	%i4,	%i7
	umul	%l2,	0x1953,	%i1
	movgu	%icc,	%g3,	%o7
	movcc	%xcc,	%o6,	%l0
	ldd	[%l7 + 0x48],	%f28
	movge	%icc,	%i3,	%g7
	movrlz	%o4,	%i2,	%g6
	array16	%g1,	%o2,	%o3
	srlx	%o0,	%i0,	%i6
	andncc	%l6,	%l1,	%g5
	srlx	%i5,	%l3,	%g2
	edge32	%g4,	%l5,	%o5
	add	%o1,	0x0E0C,	%i4
	edge16ln	%l4,	%i7,	%i1
	udivcc	%g3,	0x0604,	%l2
	popc	%o6,	%l0
	edge8n	%o7,	%i3,	%o4
	edge8	%i2,	%g7,	%g1
	movgu	%xcc,	%o2,	%g6
	movrlz	%o0,	%o3,	%i6
	fone	%f2
	ldd	[%l7 + 0x08],	%i6
	sdiv	%l1,	0x1149,	%g5
	ldx	[%l7 + 0x20],	%i0
	sdivx	%l3,	0x1CAC,	%i5
	movl	%icc,	%g2,	%l5
	movge	%icc,	%g4,	%o5
	edge32n	%o1,	%i4,	%l4
	sth	%i1,	[%l7 + 0x54]
	fcmpeq32	%f10,	%f12,	%g3
	xorcc	%i7,	%o6,	%l0
	lduh	[%l7 + 0x3A],	%l2
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f0
	xor	%o7,	%i3,	%o4
	movg	%icc,	%i2,	%g1
	orn	%o2,	%g6,	%o0
	alignaddrl	%g7,	%i6,	%l6
	std	%f2,	[%l7 + 0x50]
	fnands	%f21,	%f1,	%f13
	stb	%l1,	[%l7 + 0x5D]
	movvs	%xcc,	%g5,	%i0
	mulx	%l3,	0x0095,	%i5
	sethi	0x0BF6,	%g2
	alignaddrl	%l5,	%g4,	%o3
	fnand	%f6,	%f26,	%f2
	save %o5, %i4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	0x0C6C,	%i1
	udiv	%i7,	0x1632,	%g3
	ldx	[%l7 + 0x18],	%o6
	edge32ln	%l0,	%l2,	%i3
	udivx	%o7,	0x160C,	%o4
	or	%g1,	0x172D,	%i2
	ldsw	[%l7 + 0x0C],	%g6
	add	%o2,	0x1293,	%o0
	sllx	%g7,	0x07,	%l6
	fandnot1	%f2,	%f8,	%f6
	st	%f5,	[%l7 + 0x50]
	fpsub32	%f30,	%f6,	%f18
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%l1
	fmovdge	%icc,	%f7,	%f21
	fcmpeq32	%f18,	%f0,	%i6
	movleu	%icc,	%g5,	%l3
	edge32n	%i0,	%i5,	%l5
	lduh	[%l7 + 0x36],	%g2
	fmovrsne	%o3,	%f2,	%f31
	edge32ln	%g4,	%i4,	%l4
	edge8	%o1,	%o5,	%i7
	movrlz	%g3,	%o6,	%i1
	fornot2s	%f1,	%f17,	%f31
	fmovscc	%xcc,	%f7,	%f3
	movleu	%icc,	%l0,	%l2
	stx	%o7,	[%l7 + 0x10]
	movrgz	%o4,	0x31C,	%g1
	move	%xcc,	%i2,	%g6
	faligndata	%f24,	%f12,	%f22
	sll	%i3,	%o2,	%g7
	movrne	%o0,	%l1,	%l6
	movn	%xcc,	%i6,	%g5
	fandnot1s	%f2,	%f11,	%f2
	lduw	[%l7 + 0x20],	%i0
	std	%f0,	[%l7 + 0x68]
	srax	%l3,	0x12,	%i5
	array16	%g2,	%o3,	%g4
	movgu	%icc,	%l5,	%i4
	ldx	[%l7 + 0x20],	%o1
	movvs	%xcc,	%o5,	%l4
	smulcc	%g3,	%o6,	%i7
	fmovda	%xcc,	%f22,	%f8
	array16	%i1,	%l2,	%l0
	movleu	%xcc,	%o7,	%o4
	edge16l	%i2,	%g6,	%g1
	mulx	%i3,	0x0123,	%g7
	subccc	%o2,	0x189D,	%o0
	movrlz	%l1,	%l6,	%g5
	add	%i6,	0x0F41,	%i0
	movrgez	%i5,	0x046,	%g2
	edge16n	%l3,	%o3,	%g4
	stx	%l5,	[%l7 + 0x30]
	orn	%i4,	%o5,	%l4
	ldd	[%l7 + 0x50],	%f20
	addc	%o1,	0x11C7,	%g3
	fxnor	%f28,	%f6,	%f20
	fmovsle	%icc,	%f25,	%f13
	add	%i7,	0x1065,	%o6
	edge32ln	%l2,	%l0,	%o7
	sth	%o4,	[%l7 + 0x22]
	edge32	%i2,	%i1,	%g6
	edge16ln	%i3,	%g1,	%g7
	movrlez	%o0,	%o2,	%l1
	fmovsvc	%xcc,	%f27,	%f2
	edge8	%g5,	%i6,	%l6
	stx	%i5,	[%l7 + 0x28]
	movcc	%icc,	%g2,	%i0
	edge32	%o3,	%l3,	%l5
	fcmple16	%f28,	%f14,	%i4
	lduh	[%l7 + 0x24],	%o5
	fmovrde	%l4,	%f14,	%f10
	xnor	%o1,	0x0E17,	%g4
	fmovrslez	%i7,	%f20,	%f1
	edge32ln	%o6,	%l2,	%g3
	movne	%icc,	%l0,	%o4
	fmovde	%icc,	%f1,	%f27
	popc	0x1A69,	%o7
	fornot2s	%f3,	%f11,	%f5
	movrlz	%i1,	%g6,	%i3
	fmovdge	%icc,	%f18,	%f27
	fandnot2	%f6,	%f24,	%f4
	udivcc	%i2,	0x0CC5,	%g7
	srax	%g1,	%o0,	%l1
	edge32n	%o2,	%g5,	%i6
	movvc	%icc,	%i5,	%l6
	sdivcc	%i0,	0x1041,	%o3
	udivcc	%l3,	0x026C,	%l5
	orn	%g2,	%o5,	%l4
	udivcc	%o1,	0x1CAE,	%g4
	movrlez	%i4,	0x1A8,	%o6
	orncc	%i7,	%l2,	%g3
	movle	%icc,	%o4,	%o7
	edge16ln	%i1,	%l0,	%i3
	edge8l	%g6,	%g7,	%i2
	nop
	set	0x21, %l5
	ldsb	[%l7 + %l5],	%o0
	fpackfix	%f26,	%f18
	movge	%xcc,	%g1,	%l1
	array32	%o2,	%g5,	%i5
	movrgez	%l6,	%i6,	%i0
	orncc	%l3,	%o3,	%g2
	fmovdg	%icc,	%f1,	%f21
	stx	%l5,	[%l7 + 0x08]
	or	%o5,	0x0A77,	%o1
	subccc	%g4,	%l4,	%o6
	movrgez	%i7,	0x149,	%i4
	sdiv	%l2,	0x1255,	%g3
	or	%o4,	0x0D5D,	%o7
	fmovsne	%xcc,	%f11,	%f20
	st	%f16,	[%l7 + 0x1C]
	lduh	[%l7 + 0x58],	%l0
	fmul8x16al	%f25,	%f21,	%f24
	movle	%icc,	%i1,	%i3
	stb	%g6,	[%l7 + 0x3A]
	udivcc	%i2,	0x1EB7,	%g7
	movvs	%xcc,	%g1,	%l1
	movleu	%icc,	%o2,	%g5
	stb	%o0,	[%l7 + 0x54]
	andcc	%i5,	0x1284,	%l6
	sdiv	%i0,	0x15ED,	%l3
	sdivx	%o3,	0x1E14,	%i6
	movne	%icc,	%g2,	%o5
	movre	%l5,	0x2E3,	%o1
	lduw	[%l7 + 0x4C],	%g4
	fmovsgu	%xcc,	%f23,	%f28
	ldsb	[%l7 + 0x4C],	%o6
	array16	%l4,	%i4,	%l2
	sdiv	%i7,	0x0DAF,	%g3
	subccc	%o7,	0x1E69,	%l0
	sethi	0x0DEF,	%o4
	add	%i1,	0x0947,	%i3
	edge16ln	%i2,	%g7,	%g1
	orcc	%g6,	%l1,	%g5
	xorcc	%o0,	0x1638,	%o2
	movrgez	%i5,	%i0,	%l3
	sethi	0x054A,	%o3
	sll	%l6,	0x1D,	%i6
	fpadd32	%f4,	%f6,	%f8
	fpadd16	%f10,	%f0,	%f20
	fnand	%f6,	%f18,	%f18
	movgu	%icc,	%g2,	%l5
	movgu	%icc,	%o1,	%g4
	lduh	[%l7 + 0x0C],	%o5
	movrne	%o6,	0x2FA,	%l4
	ldd	[%l7 + 0x28],	%i4
	movne	%xcc,	%l2,	%i7
	sllx	%g3,	%o7,	%o4
	movge	%icc,	%l0,	%i3
	restore %i1, %i2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f4,	[%l7 + 0x68]
	ldub	[%l7 + 0x34],	%g1
	edge16	%g6,	%l1,	%o0
	movgu	%xcc,	%o2,	%g5
	edge16n	%i5,	%l3,	%o3
	xor	%i0,	0x0F87,	%l6
	edge16n	%i6,	%g2,	%l5
	fmovdpos	%xcc,	%f29,	%f23
	lduh	[%l7 + 0x4C],	%o1
	edge8n	%o5,	%o6,	%l4
	fcmped	%fcc0,	%f20,	%f18
	subcc	%i4,	%l2,	%i7
	fpsub16s	%f31,	%f11,	%f19
	udivx	%g3,	0x119E,	%o7
	ldsh	[%l7 + 0x72],	%g4
	stb	%l0,	[%l7 + 0x41]
	subc	%i3,	%o4,	%i1
	xorcc	%g7,	0x1C90,	%g1
	edge32n	%g6,	%l1,	%o0
	alignaddrl	%i2,	%g5,	%i5
	fmovrdlz	%l3,	%f24,	%f20
	fmovrse	%o3,	%f27,	%f11
	ld	[%l7 + 0x40],	%f28
	xorcc	%i0,	%l6,	%o2
	movge	%icc,	%i6,	%g2
	umul	%o1,	%l5,	%o6
	edge16ln	%l4,	%i4,	%l2
	fpsub16	%f24,	%f10,	%f14
	edge8	%i7,	%o5,	%g3
	stw	%g4,	[%l7 + 0x38]
	movle	%icc,	%o7,	%l0
	fmovsvs	%xcc,	%f26,	%f5
	fmuld8ulx16	%f11,	%f30,	%f0
	movl	%xcc,	%i3,	%i1
	movvc	%xcc,	%o4,	%g7
	lduw	[%l7 + 0x34],	%g6
	edge8n	%g1,	%l1,	%o0
	udivx	%i2,	0x054F,	%i5
	movn	%icc,	%g5,	%l3
	ldsb	[%l7 + 0x55],	%i0
	ldd	[%l7 + 0x70],	%o2
	movge	%icc,	%o2,	%i6
	save %l6, %g2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o6,	%o1
	srl	%l4,	0x08,	%i4
	fsrc1	%f6,	%f2
	andncc	%l2,	%o5,	%g3
	fmovsa	%icc,	%f15,	%f28
	andcc	%i7,	%o7,	%g4
	sll	%i3,	%l0,	%i1
	sir	0x1B4C
	umul	%o4,	%g7,	%g1
	edge16n	%g6,	%l1,	%o0
	lduw	[%l7 + 0x74],	%i2
	sllx	%i5,	0x16,	%l3
	ldd	[%l7 + 0x20],	%g4
	fcmple16	%f14,	%f16,	%o3
	fmovdn	%icc,	%f9,	%f6
	popc	%i0,	%i6
	sllx	%l6,	%o2,	%g2
	ldd	[%l7 + 0x10],	%o6
	sir	0x1B6B
	mulx	%o1,	%l5,	%l4
	edge32n	%l2,	%i4,	%o5
	subc	%g3,	%o7,	%g4
	movn	%xcc,	%i3,	%i7
	umulcc	%i1,	0x12CD,	%o4
	and	%g7,	0x0C3F,	%l0
	movn	%xcc,	%g1,	%l1
	fcmpes	%fcc0,	%f10,	%f3
	srax	%o0,	0x13,	%g6
	orn	%i2,	%l3,	%g5
	stx	%o3,	[%l7 + 0x20]
	srax	%i5,	%i0,	%i6
	movge	%xcc,	%o2,	%l6
	movne	%xcc,	%g2,	%o6
	ldd	[%l7 + 0x48],	%f28
	fornot2s	%f12,	%f29,	%f28
	fmovdgu	%xcc,	%f23,	%f26
	subc	%l5,	%o1,	%l2
	subc	%i4,	%l4,	%g3
	fmovdcc	%xcc,	%f30,	%f27
	fmovrslez	%o7,	%f31,	%f26
	xnorcc	%o5,	0x01CA,	%i3
	movleu	%icc,	%g4,	%i7
	orn	%o4,	0x0EF4,	%i1
	fmovrslz	%g7,	%f27,	%f15
	movn	%xcc,	%g1,	%l1
	fmovsn	%xcc,	%f0,	%f19
	stw	%o0,	[%l7 + 0x20]
	fpadd16s	%f6,	%f5,	%f5
	lduw	[%l7 + 0x08],	%g6
	edge8ln	%l0,	%i2,	%l3
	srax	%o3,	%g5,	%i5
	umul	%i0,	0x002B,	%i6
	edge8	%l6,	%g2,	%o2
	orncc	%o6,	0x1AA5,	%o1
	andcc	%l5,	%i4,	%l2
	fmovdcc	%xcc,	%f21,	%f22
	ldsh	[%l7 + 0x34],	%g3
	mulscc	%o7,	0x0AB0,	%o5
	xnorcc	%l4,	%g4,	%i7
	save %i3, 0x11EB, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g7,	%o4,	%g1
	addc	%o0,	%g6,	%l0
	andncc	%i2,	%l3,	%l1
	mulscc	%o3,	0x0B69,	%g5
	edge8ln	%i0,	%i5,	%l6
	movn	%icc,	%g2,	%o2
	ldsb	[%l7 + 0x14],	%o6
	sir	0x0AB6
	umulcc	%o1,	0x036F,	%l5
	ld	[%l7 + 0x10],	%f8
	fmovd	%f2,	%f20
	movle	%xcc,	%i6,	%l2
	array8	%g3,	%i4,	%o7
	movrgez	%l4,	0x243,	%o5
	addccc	%i7,	0x02DA,	%i3
	lduh	[%l7 + 0x14],	%i1
	fpsub32	%f4,	%f26,	%f30
	edge8l	%g7,	%g4,	%o4
	sll	%g1,	%g6,	%l0
	sethi	0x0D10,	%i2
	udivx	%o0,	0x084A,	%l1
	orn	%l3,	0x1FB2,	%g5
	addc	%i0,	0x0B4F,	%o3
	andncc	%i5,	%l6,	%o2
	edge32	%g2,	%o1,	%l5
	orcc	%o6,	0x0B0C,	%l2
	andn	%i6,	%g3,	%o7
	fpackfix	%f2,	%f27
	fcmps	%fcc0,	%f17,	%f20
	fpadd16s	%f31,	%f12,	%f2
	ldd	[%l7 + 0x20],	%f8
	fcmpes	%fcc0,	%f17,	%f13
	edge16	%l4,	%o5,	%i4
	ldub	[%l7 + 0x34],	%i7
	sll	%i1,	%g7,	%g4
	fnegd	%f24,	%f16
	fone	%f14
	fmovrslz	%i3,	%f31,	%f12
	std	%f18,	[%l7 + 0x38]
	array32	%g1,	%o4,	%l0
	save %i2, %o0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f21,	%f20
	xorcc	%l3,	0x02A7,	%g6
	fandnot1s	%f24,	%f24,	%f7
	fcmpgt32	%f20,	%f10,	%g5
	sir	0x0A31
	edge16	%i0,	%i5,	%o3
	edge8l	%l6,	%o2,	%o1
	subccc	%l5,	%o6,	%l2
	sra	%g2,	0x06,	%g3
	srl	%o7,	0x0B,	%i6
	movcc	%icc,	%l4,	%o5
	popc	%i7,	%i1
	edge32ln	%i4,	%g4,	%g7
	edge32ln	%g1,	%o4,	%i3
	movrne	%i2,	%l0,	%l1
	fmovsvc	%icc,	%f25,	%f27
	ldx	[%l7 + 0x58],	%o0
	nop
	set	0x18, %g1
	lduh	[%l7 + %g1],	%g6
	movvc	%xcc,	%l3,	%g5
	edge16n	%i0,	%i5,	%o3
	add	%l6,	0x112F,	%o1
	sdivx	%o2,	0x0A0A,	%o6
	fxnors	%f7,	%f7,	%f11
	edge32	%l5,	%g2,	%g3
	movre	%o7,	%l2,	%l4
	movrgz	%o5,	%i7,	%i6
	fmovdge	%icc,	%f15,	%f1
	ldsw	[%l7 + 0x44],	%i1
	st	%f20,	[%l7 + 0x58]
	ld	[%l7 + 0x30],	%f28
	movn	%xcc,	%g4,	%i4
	xor	%g7,	0x055B,	%o4
	udivcc	%g1,	0x08C5,	%i3
	movrgz	%i2,	0x0E8,	%l0
	fcmped	%fcc0,	%f26,	%f20
	edge8	%l1,	%o0,	%l3
	edge32l	%g5,	%i0,	%i5
	sdivx	%o3,	0x04E3,	%l6
	nop
	set	0x54, %o6
	sth	%o1,	[%l7 + %o6]
	fpadd32s	%f12,	%f12,	%f18
	lduw	[%l7 + 0x4C],	%g6
	srl	%o2,	%o6,	%l5
	add	%g3,	%o7,	%g2
	fmovsg	%icc,	%f26,	%f13
	sdivx	%l2,	0x13C2,	%l4
	movvc	%icc,	%i7,	%i6
	or	%o5,	%g4,	%i4
	array32	%i1,	%o4,	%g7
	fmovdl	%xcc,	%f14,	%f4
	edge16l	%g1,	%i2,	%i3
	save %l0, 0x1AAD, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f20,	%f13,	%f11
	add	%l3,	0x0640,	%l1
	stb	%g5,	[%l7 + 0x67]
	fmul8ulx16	%f12,	%f0,	%f28
	umulcc	%i0,	%o3,	%i5
	fnands	%f24,	%f7,	%f10
	mulscc	%l6,	%g6,	%o2
	orncc	%o6,	%o1,	%l5
	edge8n	%g3,	%o7,	%l2
	udiv	%g2,	0x0859,	%l4
	stw	%i7,	[%l7 + 0x64]
	sth	%o5,	[%l7 + 0x20]
	stb	%g4,	[%l7 + 0x1B]
	stw	%i4,	[%l7 + 0x24]
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%i6
	edge16l	%i1,	%o4,	%g1
	xor	%g7,	%i3,	%i2
	fmovrsgez	%l0,	%f0,	%f18
	mulx	%l3,	%l1,	%o0
	fmovrde	%g5,	%f18,	%f30
	movneg	%icc,	%i0,	%i5
	andcc	%o3,	0x057A,	%l6
	srax	%g6,	%o6,	%o2
	movge	%icc,	%o1,	%g3
	fpackfix	%f18,	%f25
	smul	%o7,	0x03F8,	%l2
	sdiv	%g2,	0x1754,	%l4
	edge16n	%l5,	%i7,	%o5
	orncc	%i4,	%i6,	%i1
	edge8ln	%o4,	%g1,	%g7
	fnor	%f30,	%f16,	%f26
	popc	0x053F,	%i3
	and	%i2,	%l0,	%l3
	mulx	%g4,	0x16E2,	%o0
	movne	%icc,	%g5,	%i0
	smulcc	%l1,	%o3,	%l6
	movrlz	%g6,	%i5,	%o6
	stx	%o1,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%f27
	subccc	%o2,	0x0036,	%g3
	fmovscs	%icc,	%f30,	%f15
	sra	%o7,	0x1A,	%l2
	edge16	%g2,	%l5,	%i7
	movg	%xcc,	%l4,	%i4
	fmovdge	%icc,	%f11,	%f16
	edge16l	%o5,	%i1,	%i6
	movvs	%xcc,	%g1,	%o4
	movrgez	%i3,	%g7,	%i2
	fnegs	%f14,	%f19
	orn	%l3,	0x0B40,	%l0
	lduh	[%l7 + 0x68],	%g4
	sth	%g5,	[%l7 + 0x34]
	mova	%xcc,	%o0,	%l1
	movge	%xcc,	%o3,	%i0
	ldsw	[%l7 + 0x60],	%l6
	movn	%xcc,	%g6,	%i5
	ld	[%l7 + 0x28],	%f18
	umulcc	%o1,	0x0C1E,	%o2
	orn	%g3,	0x0EB1,	%o7
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	edge8	%o6,	%i7,	%l5
	udivcc	%i4,	0x1785,	%l4
	edge32n	%i1,	%o5,	%i6
	movrgz	%o4,	%g1,	%g7
	movvs	%xcc,	%i3,	%i2
	orncc	%l3,	%l0,	%g4
	fmovrslz	%g5,	%f17,	%f21
	edge32ln	%o0,	%o3,	%i0
	srl	%l6,	0x13,	%g6
	edge32n	%l1,	%i5,	%o2
	orn	%o1,	0x1936,	%o7
	alignaddr	%g3,	%g2,	%o6
	edge16ln	%l2,	%l5,	%i7
	movn	%xcc,	%i4,	%i1
	movpos	%icc,	%o5,	%i6
	movle	%icc,	%o4,	%l4
	sll	%g7,	%i3,	%i2
	edge16	%l3,	%g1,	%g4
	fmovdneg	%xcc,	%f18,	%f28
	fmovdneg	%icc,	%f2,	%f15
	edge8l	%l0,	%g5,	%o0
	mulscc	%o3,	%l6,	%g6
	movre	%i0,	0x147,	%i5
	movrlez	%o2,	%o1,	%o7
	movrgez	%g3,	0x17A,	%g2
	fpsub16s	%f19,	%f9,	%f18
	fexpand	%f12,	%f12
	edge8ln	%l1,	%o6,	%l5
	fpadd32	%f14,	%f30,	%f10
	movrne	%l2,	0x177,	%i7
	stw	%i4,	[%l7 + 0x64]
	ldub	[%l7 + 0x4B],	%i1
	or	%o5,	%i6,	%o4
	stw	%g7,	[%l7 + 0x20]
	fcmpeq32	%f22,	%f28,	%l4
	fpadd32s	%f24,	%f16,	%f5
	movne	%icc,	%i3,	%l3
	movgu	%xcc,	%g1,	%g4
	edge16l	%i2,	%l0,	%o0
	umul	%g5,	0x0BF9,	%o3
	sth	%l6,	[%l7 + 0x12]
	save %g6, %i0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f2,	%f6,	%o2
	sth	%o7,	[%l7 + 0x48]
	fmul8ulx16	%f22,	%f8,	%f14
	edge16l	%o1,	%g3,	%l1
	for	%f2,	%f22,	%f12
	mulscc	%g2,	0x05EB,	%l5
	ldd	[%l7 + 0x18],	%o6
	orncc	%i7,	0x17B2,	%l2
	move	%icc,	%i4,	%i1
	fsrc1s	%f11,	%f26
	movrgez	%o5,	%i6,	%g7
	movne	%icc,	%l4,	%i3
	fnands	%f2,	%f23,	%f10
	stx	%o4,	[%l7 + 0x50]
	mulscc	%l3,	0x1C8C,	%g1
	xnor	%g4,	%i2,	%l0
	movcc	%xcc,	%o0,	%g5
	mova	%icc,	%l6,	%g6
	alignaddr	%o3,	%i0,	%o2
	mulscc	%o7,	0x0372,	%o1
	edge8n	%i5,	%g3,	%g2
	addccc	%l1,	%l5,	%i7
	sllx	%l2,	0x1A,	%o6
	alignaddr	%i4,	%o5,	%i6
	edge16	%g7,	%i1,	%i3
	stw	%l4,	[%l7 + 0x0C]
	array8	%l3,	%g1,	%o4
	xor	%g4,	0x00E4,	%l0
	stx	%o0,	[%l7 + 0x08]
	and	%i2,	%l6,	%g5
	fnot2	%f4,	%f6
	movneg	%icc,	%g6,	%i0
	addcc	%o3,	0x1F75,	%o7
	fmovscc	%icc,	%f21,	%f25
	andncc	%o2,	%o1,	%i5
	edge16	%g2,	%l1,	%l5
	fmovsl	%icc,	%f16,	%f30
	fmovsneg	%xcc,	%f17,	%f13
	movn	%xcc,	%i7,	%l2
	ldsb	[%l7 + 0x2E],	%g3
	movrlez	%i4,	0x1C0,	%o6
	fnot1	%f8,	%f16
	umulcc	%o5,	%g7,	%i6
	lduw	[%l7 + 0x20],	%i3
	fnegd	%f12,	%f26
	movpos	%icc,	%l4,	%l3
	std	%f16,	[%l7 + 0x50]
	fmovse	%xcc,	%f13,	%f29
	add	%g1,	%o4,	%g4
	movne	%xcc,	%i1,	%o0
	sdiv	%l0,	0x0B15,	%l6
	fones	%f14
	sra	%g5,	0x19,	%i2
	movrlz	%i0,	%o3,	%o7
	xnorcc	%o2,	0x0A90,	%g6
	orn	%i5,	0x1840,	%g2
	xnor	%o1,	0x07D9,	%l1
	andcc	%l5,	0x188E,	%i7
	fmovsle	%icc,	%f6,	%f28
	fmovdgu	%icc,	%f10,	%f11
	movvc	%xcc,	%l2,	%i4
	sll	%g3,	0x1A,	%o6
	orcc	%g7,	0x0E4D,	%i6
	sth	%i3,	[%l7 + 0x26]
	edge32l	%l4,	%l3,	%o5
	movne	%xcc,	%o4,	%g4
	movrlz	%i1,	0x3A8,	%g1
	mulscc	%o0,	%l0,	%l6
	ldsb	[%l7 + 0x09],	%i2
	movvc	%xcc,	%i0,	%g5
	movgu	%icc,	%o3,	%o7
	fmul8x16al	%f0,	%f15,	%f4
	edge8	%g6,	%i5,	%g2
	movn	%xcc,	%o1,	%o2
	edge32n	%l1,	%l5,	%l2
	stx	%i4,	[%l7 + 0x28]
	edge8n	%g3,	%o6,	%i7
	ldd	[%l7 + 0x48],	%f12
	movrgez	%g7,	%i6,	%i3
	fmovdvs	%icc,	%f6,	%f11
	udiv	%l4,	0x0B63,	%o5
	edge32n	%o4,	%l3,	%g4
	edge8l	%g1,	%o0,	%l0
	fpsub32	%f28,	%f4,	%f6
	xnorcc	%l6,	0x1013,	%i2
	ld	[%l7 + 0x2C],	%f25
	andncc	%i0,	%i1,	%g5
	sir	0x1F3F
	sdiv	%o3,	0x1CCA,	%o7
	fandnot2	%f12,	%f4,	%f30
	fcmped	%fcc2,	%f6,	%f12
	fmovde	%xcc,	%f21,	%f26
	sth	%g6,	[%l7 + 0x0A]
	fxors	%f18,	%f21,	%f12
	faligndata	%f12,	%f2,	%f24
	edge32n	%g2,	%o1,	%i5
	mova	%icc,	%l1,	%o2
	subccc	%l5,	%i4,	%l2
	andn	%o6,	%i7,	%g3
	addcc	%i6,	%i3,	%g7
	ldub	[%l7 + 0x16],	%l4
	andcc	%o4,	%l3,	%o5
	xorcc	%g1,	0x1DB2,	%g4
	movl	%icc,	%o0,	%l0
	movrlez	%i2,	%l6,	%i1
	sub	%i0,	0x097D,	%o3
	andcc	%o7,	%g6,	%g2
	movneg	%xcc,	%g5,	%i5
	movvs	%icc,	%o1,	%l1
	move	%icc,	%o2,	%i4
	sethi	0x1D42,	%l2
	lduw	[%l7 + 0x38],	%o6
	ldd	[%l7 + 0x48],	%i6
	sir	0x1FBD
	movleu	%icc,	%l5,	%g3
	movn	%icc,	%i3,	%g7
	ldsh	[%l7 + 0x40],	%i6
	ldd	[%l7 + 0x10],	%f8
	st	%f20,	[%l7 + 0x4C]
	addc	%o4,	0x0D79,	%l4
	sll	%o5,	%g1,	%l3
	lduw	[%l7 + 0x5C],	%g4
	movge	%xcc,	%o0,	%l0
	fmovrdne	%i2,	%f6,	%f14
	fmovdne	%xcc,	%f7,	%f14
	edge32	%l6,	%i1,	%o3
	ldsw	[%l7 + 0x2C],	%o7
	edge16l	%g6,	%i0,	%g2
	edge8ln	%i5,	%g5,	%l1
	sdiv	%o2,	0x0C13,	%o1
	orncc	%l2,	%o6,	%i4
	bshuffle	%f14,	%f20,	%f8
	fxnor	%f20,	%f4,	%f22
	movne	%icc,	%l5,	%g3
	fcmps	%fcc1,	%f27,	%f6
	fmul8sux16	%f6,	%f18,	%f16
	andncc	%i3,	%i7,	%g7
	fmovrdlz	%o4,	%f8,	%f22
	array32	%l4,	%o5,	%g1
	fnegd	%f4,	%f12
	fnands	%f29,	%f5,	%f26
	movvc	%icc,	%i6,	%l3
	array16	%g4,	%o0,	%l0
	stw	%l6,	[%l7 + 0x7C]
	edge16	%i1,	%o3,	%i2
	edge32l	%o7,	%g6,	%i0
	alignaddr	%i5,	%g5,	%l1
	movle	%icc,	%o2,	%o1
	stw	%l2,	[%l7 + 0x18]
	fmovrdlez	%o6,	%f8,	%f30
	array16	%g2,	%l5,	%i4
	fmovdgu	%xcc,	%f13,	%f7
	andcc	%g3,	%i7,	%i3
	movge	%xcc,	%o4,	%g7
	orn	%l4,	%g1,	%i6
	sdivx	%l3,	0x0933,	%g4
	fmovrdne	%o0,	%f16,	%f10
	ldd	[%l7 + 0x58],	%f24
	fnegs	%f14,	%f13
	lduw	[%l7 + 0x20],	%l0
	ldub	[%l7 + 0x74],	%o5
	edge32ln	%l6,	%i1,	%o3
	fnot1s	%f25,	%f28
	edge8ln	%o7,	%g6,	%i0
	movl	%xcc,	%i2,	%i5
	edge32ln	%g5,	%l1,	%o2
	movleu	%icc,	%o1,	%o6
	movpos	%xcc,	%g2,	%l5
	ldsw	[%l7 + 0x70],	%l2
	mulx	%g3,	%i4,	%i7
	lduw	[%l7 + 0x10],	%o4
	movcs	%icc,	%g7,	%i3
	edge32ln	%l4,	%g1,	%l3
	udiv	%i6,	0x015B,	%o0
	alignaddr	%g4,	%o5,	%l6
	movgu	%xcc,	%i1,	%o3
	sub	%l0,	%o7,	%g6
	movcc	%xcc,	%i0,	%i5
	array8	%i2,	%g5,	%o2
	or	%o1,	0x192D,	%l1
	alignaddrl	%g2,	%o6,	%l5
	ldd	[%l7 + 0x20],	%f26
	xor	%l2,	%g3,	%i7
	orn	%i4,	%o4,	%g7
	stb	%l4,	[%l7 + 0x1C]
	xorcc	%g1,	0x1D86,	%i3
	movcs	%icc,	%l3,	%o0
	movneg	%xcc,	%g4,	%o5
	restore %l6, 0x1034, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o3,	%l0,	%i6
	fxor	%f24,	%f16,	%f20
	fands	%f23,	%f15,	%f19
	addcc	%o7,	%g6,	%i5
	sdivcc	%i2,	0x18C7,	%g5
	subcc	%o2,	%i0,	%l1
	xorcc	%g2,	0x1215,	%o1
	fmul8x16	%f23,	%f18,	%f20
	popc	0x0A29,	%l5
	movgu	%icc,	%o6,	%g3
	fmovsleu	%icc,	%f27,	%f2
	udivx	%l2,	0x067A,	%i7
	ld	[%l7 + 0x58],	%f7
	st	%f19,	[%l7 + 0x50]
	xor	%i4,	0x0F19,	%g7
	movpos	%icc,	%l4,	%g1
	fmovrdne	%o4,	%f24,	%f16
	fnot1s	%f24,	%f4
	fsrc1s	%f25,	%f23
	sdivx	%i3,	0x150D,	%o0
	movrlez	%g4,	%l3,	%o5
	sdivx	%i1,	0x18F0,	%l6
	umul	%o3,	0x1692,	%i6
	ldsh	[%l7 + 0x54],	%l0
	orcc	%o7,	0x01FE,	%i5
	sir	0x07C4
	fors	%f26,	%f11,	%f12
	movvc	%icc,	%i2,	%g5
	umulcc	%g6,	%o2,	%l1
	sub	%g2,	0x18A5,	%i0
	xnor	%o1,	%l5,	%g3
	lduh	[%l7 + 0x6A],	%l2
	smulcc	%o6,	%i7,	%g7
	edge8n	%l4,	%i4,	%g1
	addccc	%i3,	0x0FFC,	%o4
	array32	%g4,	%l3,	%o5
	fmovspos	%xcc,	%f4,	%f23
	orn	%i1,	0x1F39,	%o0
	ld	[%l7 + 0x54],	%f15
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	st	%f14,	[%l7 + 0x54]
	smul	%o3,	0x1448,	%i5
	movn	%icc,	%i2,	%o7
	mulscc	%g5,	0x1A74,	%g6
	edge8l	%l1,	%o2,	%i0
	move	%icc,	%g2,	%l5
	movrgz	%o1,	0x29F,	%l2
	ldd	[%l7 + 0x18],	%f10
	fnors	%f6,	%f10,	%f30
	addc	%o6,	0x0A18,	%g3
	srlx	%i7,	%l4,	%g7
	edge16l	%g1,	%i3,	%o4
	srl	%g4,	%i4,	%l3
	fmovrdne	%o5,	%f16,	%f0
	fcmple32	%f24,	%f4,	%o0
	movg	%xcc,	%l6,	%i6
	udivcc	%i1,	0x1D8E,	%o3
	edge32n	%i5,	%l0,	%o7
	fpack32	%f0,	%f30,	%f14
	sir	0x1770
	and	%g5,	%i2,	%l1
	subcc	%g6,	%o2,	%g2
	fornot2	%f22,	%f26,	%f10
	stb	%i0,	[%l7 + 0x1F]
	alignaddrl	%o1,	%l5,	%l2
	andcc	%o6,	%g3,	%l4
	fandnot1s	%f22,	%f15,	%f27
	stx	%i7,	[%l7 + 0x08]
	ldub	[%l7 + 0x15],	%g1
	sdivcc	%g7,	0x0209,	%i3
	xor	%o4,	%i4,	%l3
	edge32n	%o5,	%g4,	%l6
	addc	%i6,	%i1,	%o0
	ldd	[%l7 + 0x38],	%i4
	fornot2s	%f27,	%f9,	%f17
	fmovrdlez	%o3,	%f14,	%f2
	edge8l	%o7,	%l0,	%i2
	umulcc	%l1,	0x126D,	%g6
	array32	%g5,	%o2,	%g2
	stw	%o1,	[%l7 + 0x7C]
	fmovdcc	%icc,	%f19,	%f2
	movrne	%i0,	0x0D0,	%l2
	edge16l	%o6,	%g3,	%l4
	udivx	%i7,	0x0032,	%g1
	alignaddrl	%g7,	%i3,	%l5
	srl	%o4,	0x03,	%i4
	edge8ln	%l3,	%g4,	%l6
	fmovda	%xcc,	%f16,	%f23
	stb	%o5,	[%l7 + 0x41]
	movvc	%icc,	%i6,	%i1
	movvc	%icc,	%i5,	%o3
	xnorcc	%o7,	%o0,	%i2
	sra	%l0,	0x10,	%l1
	fcmpes	%fcc2,	%f20,	%f10
	movpos	%icc,	%g5,	%g6
	ldx	[%l7 + 0x10],	%g2
	udiv	%o2,	0x1AE2,	%i0
	popc	%o1,	%l2
	mulscc	%o6,	0x0714,	%l4
	xorcc	%i7,	%g3,	%g1
	umulcc	%g7,	%l5,	%i3
	fornot2	%f8,	%f24,	%f20
	fcmple16	%f26,	%f6,	%i4
	movvc	%xcc,	%o4,	%g4
	fnot1	%f12,	%f10
	edge8ln	%l3,	%o5,	%l6
	edge32	%i1,	%i6,	%i5
	fmul8ulx16	%f4,	%f24,	%f20
	udiv	%o3,	0x04D2,	%o7
	movne	%icc,	%i2,	%l0
	stx	%o0,	[%l7 + 0x40]
	fmul8x16au	%f13,	%f9,	%f28
	fmovrsne	%l1,	%f27,	%f16
	ldsw	[%l7 + 0x58],	%g5
	fmovdg	%xcc,	%f5,	%f15
	movge	%xcc,	%g2,	%o2
	edge32	%i0,	%g6,	%o1
	orncc	%o6,	%l2,	%l4
	ld	[%l7 + 0x4C],	%f2
	smul	%i7,	0x1F16,	%g3
	fmul8x16au	%f30,	%f28,	%f16
	movre	%g1,	%g7,	%l5
	ldd	[%l7 + 0x20],	%f22
	move	%icc,	%i3,	%i4
	fcmpeq32	%f28,	%f16,	%o4
	edge8	%g4,	%l3,	%l6
	fand	%f0,	%f28,	%f2
	edge32l	%o5,	%i6,	%i5
	movcc	%xcc,	%i1,	%o7
	umulcc	%o3,	%i2,	%l0
	fmovrse	%o0,	%f9,	%f3
	mulscc	%l1,	%g2,	%o2
	edge8ln	%i0,	%g6,	%g5
	lduw	[%l7 + 0x2C],	%o6
	udiv	%l2,	0x0981,	%o1
	fpsub16s	%f5,	%f14,	%f21
	fabss	%f8,	%f10
	fpadd16s	%f8,	%f2,	%f15
	subccc	%i7,	%l4,	%g3
	nop
	set	0x5D, %o4
	ldsb	[%l7 + %o4],	%g1
	subccc	%l5,	%i3,	%g7
	udivx	%o4,	0x1471,	%i4
	and	%l3,	0x047F,	%g4
	faligndata	%f8,	%f2,	%f14
	fpsub32s	%f22,	%f11,	%f17
	srl	%l6,	%o5,	%i6
	ldx	[%l7 + 0x48],	%i1
	movle	%icc,	%i5,	%o3
	fmovrse	%i2,	%f25,	%f25
	edge16	%o7,	%l0,	%o0
	andcc	%g2,	0x1776,	%o2
	popc	%l1,	%i0
	xorcc	%g6,	0x179D,	%o6
	move	%xcc,	%g5,	%l2
	fmovrsgz	%o1,	%f4,	%f5
	nop
	set	0x2A, %g2
	ldub	[%l7 + %g2],	%l4
	sir	0x0D44
	alignaddr	%i7,	%g1,	%g3
	edge16n	%l5,	%g7,	%o4
	fpadd16	%f16,	%f24,	%f22
	movleu	%icc,	%i4,	%l3
	udivx	%i3,	0x1C35,	%l6
	fcmpd	%fcc2,	%f12,	%f10
	lduw	[%l7 + 0x3C],	%o5
	addccc	%g4,	0x066F,	%i1
	movvs	%icc,	%i5,	%o3
	movle	%xcc,	%i2,	%i6
	sdivcc	%o7,	0x1638,	%o0
	movrlez	%l0,	0x03B,	%o2
	movn	%xcc,	%g2,	%l1
	movrgez	%i0,	%o6,	%g6
	movpos	%xcc,	%g5,	%l2
	srax	%o1,	0x17,	%l4
	move	%icc,	%g1,	%i7
	xorcc	%g3,	0x0C8A,	%g7
	udiv	%o4,	0x1E53,	%i4
	nop
	set	0x32, %g5
	ldsh	[%l7 + %g5],	%l3
	smulcc	%i3,	0x0A14,	%l6
	array16	%l5,	%g4,	%i1
	movg	%xcc,	%o5,	%i5
	ldd	[%l7 + 0x38],	%o2
	srlx	%i2,	0x15,	%o7
	lduw	[%l7 + 0x24],	%i6
	movge	%xcc,	%l0,	%o2
	movn	%xcc,	%o0,	%g2
	array32	%l1,	%i0,	%g6
	movg	%icc,	%g5,	%o6
	movn	%xcc,	%l2,	%o1
	movle	%xcc,	%g1,	%l4
	sra	%g3,	0x07,	%i7
	edge8l	%g7,	%o4,	%i4
	movne	%xcc,	%l3,	%i3
	fnand	%f24,	%f18,	%f14
	andcc	%l5,	0x1C6D,	%l6
	edge32n	%i1,	%g4,	%o5
	array32	%o3,	%i5,	%i2
	array16	%i6,	%l0,	%o7
	addccc	%o0,	0x0D9D,	%g2
	ldsw	[%l7 + 0x3C],	%l1
	st	%f11,	[%l7 + 0x44]
	fcmpd	%fcc0,	%f16,	%f22
	movcs	%xcc,	%i0,	%o2
	ldsh	[%l7 + 0x2A],	%g5
	fmovdneg	%xcc,	%f9,	%f21
	orn	%o6,	%l2,	%o1
	ldd	[%l7 + 0x38],	%f20
	xnor	%g1,	%g6,	%l4
	srlx	%i7,	0x08,	%g7
	movl	%xcc,	%g3,	%o4
	save %l3, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f19,	%f28
	sethi	0x1C32,	%i3
	fnor	%f4,	%f26,	%f2
	fmovdge	%icc,	%f16,	%f16
	move	%xcc,	%i1,	%l6
	edge32	%g4,	%o5,	%i5
	ldsw	[%l7 + 0x40],	%i2
	and	%i6,	%l0,	%o7
	lduh	[%l7 + 0x4A],	%o3
	sethi	0x0FDE,	%o0
	movvs	%xcc,	%g2,	%i0
	movle	%xcc,	%o2,	%g5
	sdivx	%l1,	0x143D,	%o6
	restore %o1, 0x13CC, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l2,	%g6,	%i7
	movneg	%icc,	%g7,	%l4
	addc	%o4,	%l3,	%i4
	fmovrdgz	%g3,	%f4,	%f0
	ldsh	[%l7 + 0x50],	%i3
	fmovspos	%icc,	%f29,	%f9
	movge	%icc,	%l5,	%i1
	array8	%g4,	%o5,	%i5
	siam	0x6
	add	%i2,	0x04CA,	%l6
	edge32l	%l0,	%i6,	%o3
	ldub	[%l7 + 0x4A],	%o7
	orcc	%g2,	%o0,	%i0
	lduh	[%l7 + 0x5C],	%o2
	ldsw	[%l7 + 0x64],	%g5
	movrne	%o6,	%o1,	%l1
	ldsw	[%l7 + 0x78],	%l2
	sdivx	%g1,	0x10E0,	%i7
	fmovdvs	%icc,	%f2,	%f4
	mulx	%g6,	%l4,	%g7
	movre	%o4,	0x366,	%l3
	sdivcc	%i4,	0x0BD8,	%i3
	alignaddrl	%l5,	%g3,	%i1
	fmovdne	%xcc,	%f29,	%f2
	edge8	%o5,	%g4,	%i5
	fmovrdne	%i2,	%f26,	%f24
	sll	%l6,	0x0C,	%i6
	edge32l	%l0,	%o3,	%g2
	ldd	[%l7 + 0x58],	%o0
	st	%f24,	[%l7 + 0x50]
	fxors	%f18,	%f1,	%f21
	sethi	0x1BD8,	%i0
	udiv	%o2,	0x16C5,	%o7
	move	%xcc,	%o6,	%o1
	array16	%l1,	%g5,	%l2
	xor	%g1,	%i7,	%g6
	umul	%l4,	0x00A2,	%o4
	array8	%g7,	%i4,	%l3
	sth	%i3,	[%l7 + 0x5A]
	lduw	[%l7 + 0x50],	%l5
	edge8n	%i1,	%g3,	%g4
	sdiv	%o5,	0x1E73,	%i2
	srl	%i5,	%i6,	%l6
	save %o3, %g2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o0,	%i0,	%o7
	movle	%icc,	%o2,	%o6
	movcc	%xcc,	%o1,	%g5
	edge8ln	%l1,	%g1,	%l2
	sub	%i7,	%g6,	%o4
	srax	%g7,	%i4,	%l4
	sir	0x048E
	xnorcc	%i3,	%l3,	%l5
	alignaddrl	%i1,	%g3,	%o5
	sra	%g4,	%i2,	%i6
	fnot2s	%f18,	%f10
	fnors	%f7,	%f27,	%f9
	stw	%i5,	[%l7 + 0x0C]
	sth	%o3,	[%l7 + 0x14]
	sll	%l6,	0x02,	%l0
	edge8	%g2,	%o0,	%o7
	fmovrde	%i0,	%f30,	%f28
	array8	%o2,	%o6,	%o1
	fmovsgu	%icc,	%f30,	%f20
	fpack16	%f10,	%f7
	movle	%icc,	%l1,	%g1
	orn	%g5,	0x14DD,	%l2
	fmovspos	%xcc,	%f30,	%f27
	mulscc	%i7,	0x0CAE,	%g6
	smulcc	%g7,	0x13C7,	%i4
	xorcc	%l4,	%i3,	%l3
	sethi	0x1614,	%l5
	addcc	%o4,	%i1,	%o5
	edge8	%g4,	%g3,	%i2
	addc	%i5,	0x0A93,	%i6
	movrlez	%o3,	%l0,	%l6
	movcs	%xcc,	%g2,	%o0
	ldd	[%l7 + 0x38],	%i0
	sdivx	%o7,	0x17C0,	%o2
	sllx	%o1,	%o6,	%g1
	srax	%l1,	0x02,	%g5
	ldd	[%l7 + 0x38],	%l2
	fmovrdlz	%i7,	%f0,	%f16
	fmovdle	%icc,	%f26,	%f6
	ldsh	[%l7 + 0x5C],	%g6
	sth	%i4,	[%l7 + 0x1C]
	std	%f6,	[%l7 + 0x78]
	ldub	[%l7 + 0x6F],	%l4
	fandnot2s	%f5,	%f11,	%f21
	sdivx	%g7,	0x0574,	%l3
	edge32ln	%i3,	%l5,	%i1
	fcmpne16	%f22,	%f6,	%o5
	save %o4, 0x18C0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%i5,	%i6
	fcmpeq32	%f22,	%f28,	%o3
	xor	%i2,	0x0815,	%l0
	mova	%xcc,	%g2,	%o0
	ldsw	[%l7 + 0x18],	%l6
	fnands	%f19,	%f21,	%f28
	mova	%icc,	%i0,	%o2
	fpsub16	%f18,	%f4,	%f18
	fmovd	%f22,	%f4
	edge16	%o1,	%o7,	%o6
	popc	0x04FC,	%l1
	fxnors	%f0,	%f18,	%f16
	movcc	%xcc,	%g5,	%l2
	lduh	[%l7 + 0x64],	%g1
	edge32	%g6,	%i4,	%l4
	andcc	%i7,	%g7,	%l3
	or	%l5,	%i3,	%o5
	subc	%o4,	%i1,	%g3
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	andncc	%o3,	%l0,	%g2
	fmuld8sux16	%f8,	%f18,	%f8
	andncc	%o0,	%l6,	%i2
	movle	%icc,	%o2,	%o1
	fmovsge	%xcc,	%f24,	%f23
	fpadd16	%f28,	%f28,	%f4
	stw	%o7,	[%l7 + 0x60]
	fmovrslez	%o6,	%f3,	%f10
	stb	%i0,	[%l7 + 0x16]
	smul	%l1,	0x1DC6,	%l2
	edge8l	%g5,	%g6,	%g1
	and	%i4,	%i7,	%g7
	stw	%l4,	[%l7 + 0x10]
	udiv	%l5,	0x146B,	%i3
	alignaddrl	%l3,	%o5,	%i1
	sdiv	%o4,	0x092C,	%g3
	umulcc	%g4,	0x1613,	%i6
	fmul8x16al	%f21,	%f14,	%f30
	movpos	%xcc,	%i5,	%o3
	movn	%xcc,	%g2,	%o0
	movleu	%icc,	%l0,	%i2
	edge32	%o2,	%o1,	%o7
	fmuld8sux16	%f13,	%f26,	%f10
	popc	0x1CF3,	%l6
	fmovd	%f22,	%f22
	fmovdg	%xcc,	%f0,	%f8
	movrlz	%i0,	%l1,	%l2
	fexpand	%f18,	%f16
	fmovdcs	%icc,	%f3,	%f1
	sth	%g5,	[%l7 + 0x2E]
	ldub	[%l7 + 0x6F],	%g6
	movl	%icc,	%g1,	%o6
	lduh	[%l7 + 0x1A],	%i7
	fmovdcc	%xcc,	%f6,	%f5
	fornot1	%f6,	%f2,	%f8
	fcmpd	%fcc2,	%f4,	%f18
	nop
	set	0x28, %g7
	stw	%i4,	[%l7 + %g7]
	movrgz	%l4,	0x2BD,	%l5
	popc	%i3,	%l3
	array16	%g7,	%i1,	%o5
	movne	%xcc,	%o4,	%g3
	orcc	%i6,	%g4,	%o3
	array8	%i5,	%g2,	%o0
	fornot2	%f0,	%f0,	%f0
	srax	%i2,	0x09,	%o2
	movrne	%l0,	0x32D,	%o7
	ldsb	[%l7 + 0x73],	%l6
	mulx	%o1,	%l1,	%i0
	edge32n	%l2,	%g5,	%g1
	addcc	%o6,	%g6,	%i4
	xor	%i7,	%l4,	%l5
	and	%l3,	%g7,	%i3
	movre	%i1,	0x036,	%o4
	sdivcc	%g3,	0x08CC,	%o5
	udivx	%i6,	0x1162,	%o3
	edge16n	%g4,	%g2,	%o0
	orncc	%i2,	0x088C,	%o2
	fpsub32	%f6,	%f6,	%f28
	or	%i5,	%l0,	%l6
	fsrc1s	%f3,	%f30
	movvs	%xcc,	%o7,	%o1
	std	%f8,	[%l7 + 0x10]
	restore %i0, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f12,	%f21,	%f22
	fmovrdlez	%g1,	%f12,	%f4
	stx	%g5,	[%l7 + 0x68]
	fmovsneg	%xcc,	%f10,	%f1
	fmul8x16al	%f0,	%f23,	%f6
	ldsb	[%l7 + 0x31],	%o6
	move	%icc,	%g6,	%i7
	edge8ln	%l4,	%l5,	%i4
	fcmpgt16	%f18,	%f24,	%l3
	lduh	[%l7 + 0x74],	%i3
	movrne	%i1,	%g7,	%o4
	fmovrslez	%g3,	%f20,	%f16
	and	%o5,	0x08E6,	%i6
	stw	%o3,	[%l7 + 0x18]
	sir	0x1BAA
	sll	%g4,	0x0E,	%g2
	ldsh	[%l7 + 0x58],	%i2
	smul	%o0,	%o2,	%l0
	fmovs	%f27,	%f27
	sth	%l6,	[%l7 + 0x32]
	pdist	%f22,	%f12,	%f22
	movrlz	%o7,	0x2AC,	%o1
	fpadd16	%f10,	%f22,	%f8
	and	%i5,	%i0,	%l2
	ldx	[%l7 + 0x08],	%l1
	movrgez	%g1,	0x1FB,	%g5
	sllx	%o6,	%g6,	%l4
	sdivx	%i7,	0x1E1A,	%l5
	ldd	[%l7 + 0x48],	%i4
	andcc	%l3,	%i3,	%g7
	for	%f2,	%f22,	%f18
	sll	%o4,	%g3,	%o5
	xnorcc	%i6,	%i1,	%g4
	fmovdl	%icc,	%f31,	%f11
	sdivcc	%o3,	0x1EA1,	%g2
	edge16n	%i2,	%o2,	%o0
	edge8n	%l0,	%o7,	%o1
	sdiv	%i5,	0x036E,	%l6
	srax	%l2,	0x09,	%l1
	addccc	%g1,	0x0D4E,	%g5
	udivcc	%i0,	0x0783,	%o6
	sth	%l4,	[%l7 + 0x44]
	edge8l	%i7,	%g6,	%i4
	fmovrsne	%l3,	%f9,	%f27
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	lduw	[%l7 + 0x08],	%g3
	movpos	%xcc,	%g7,	%i6
	alignaddr	%o5,	%i1,	%o3
	fxor	%f4,	%f14,	%f18
	sub	%g4,	%g2,	%i2
	movleu	%xcc,	%o0,	%o2
	lduh	[%l7 + 0x76],	%l0
	fmovdgu	%xcc,	%f17,	%f23
	mova	%icc,	%o7,	%o1
	movl	%xcc,	%i5,	%l6
	movgu	%icc,	%l2,	%g1
	fmovsvs	%icc,	%f3,	%f31
	siam	0x4
	fmul8ulx16	%f22,	%f28,	%f8
	sdivcc	%l1,	0x0086,	%i0
	nop
	set	0x51, %i5
	stb	%g5,	[%l7 + %i5]
	movpos	%icc,	%l4,	%i7
	edge8ln	%o6,	%i4,	%g6
	addccc	%l5,	0x1CFD,	%i3
	ldsh	[%l7 + 0x3C],	%o4
	popc	%l3,	%g3
	fpsub32s	%f17,	%f16,	%f25
	sub	%g7,	%i6,	%i1
	xnorcc	%o3,	%o5,	%g4
	sdivcc	%i2,	0x1C65,	%o0
	fornot2s	%f19,	%f6,	%f17
	edge16	%o2,	%g2,	%o7
	subcc	%l0,	0x0457,	%i5
	orn	%o1,	0x13FD,	%l2
	edge8l	%g1,	%l6,	%i0
	fmovdpos	%xcc,	%f14,	%f22
	movn	%icc,	%g5,	%l4
	edge32l	%l1,	%i7,	%i4
	addcc	%o6,	0x05D6,	%l5
	fcmpne16	%f8,	%f0,	%i3
	nop
	set	0x41, %i7
	ldub	[%l7 + %i7],	%g6
	ldsh	[%l7 + 0x20],	%l3
	udivcc	%g3,	0x11BB,	%g7
	fors	%f29,	%f14,	%f4
	smulcc	%o4,	%i6,	%i1
	fexpand	%f6,	%f10
	add	%o5,	%o3,	%g4
	movl	%xcc,	%o0,	%i2
	addc	%g2,	0x06F5,	%o7
	sethi	0x0369,	%o2
	umulcc	%i5,	0x0B38,	%o1
	fmul8x16	%f29,	%f26,	%f0
	srl	%l2,	%g1,	%l6
	movre	%l0,	%g5,	%l4
	fmovsg	%xcc,	%f21,	%f14
	xorcc	%l1,	%i0,	%i4
	fabsd	%f20,	%f8
	fcmpd	%fcc3,	%f20,	%f8
	array16	%i7,	%l5,	%o6
	sdivcc	%g6,	0x1F7E,	%l3
	array16	%i3,	%g3,	%g7
	move	%icc,	%o4,	%i6
	stb	%i1,	[%l7 + 0x0D]
	edge32ln	%o5,	%g4,	%o0
	save %o3, %g2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f2,	%f29
	srax	%o2,	0x15,	%i2
	umulcc	%i5,	0x1CC5,	%o1
	srax	%g1,	0x0D,	%l6
	mulscc	%l2,	%l0,	%l4
	movvc	%xcc,	%g5,	%l1
	udivx	%i4,	0x0AEB,	%i0
	fors	%f24,	%f11,	%f17
	fmovsle	%icc,	%f6,	%f14
	popc	%l5,	%i7
	alignaddr	%o6,	%g6,	%l3
	fmovsne	%icc,	%f29,	%f22
	fmul8x16au	%f20,	%f2,	%f22
	sethi	0x05EA,	%i3
	movleu	%icc,	%g3,	%o4
	subccc	%i6,	0x0925,	%i1
	srl	%g7,	%o5,	%o0
	movre	%g4,	0x3E0,	%o3
	fzeros	%f21
	restore %o7, 0x1143, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i2,	%g2,	%i5
	movrgez	%o1,	0x151,	%l6
	lduh	[%l7 + 0x74],	%l2
	popc	%g1,	%l0
	subcc	%l4,	%l1,	%g5
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i0
	edge8n	%i4,	%i7,	%o6
	edge16	%g6,	%l3,	%i3
	sub	%g3,	0x1383,	%o4
	movrlz	%l5,	%i1,	%i6
	fmovrdgez	%g7,	%f6,	%f6
	subc	%o0,	0x09A2,	%o5
	umul	%g4,	%o3,	%o7
	ldx	[%l7 + 0x50],	%o2
	orncc	%g2,	%i2,	%i5
	array16	%o1,	%l6,	%l2
	fsrc2	%f10,	%f2
	sth	%g1,	[%l7 + 0x66]
	orn	%l0,	%l4,	%l1
	ldd	[%l7 + 0x48],	%g4
	andcc	%i0,	0x1CCA,	%i4
	edge8ln	%i7,	%o6,	%l3
	popc	0x1D5D,	%i3
	xnorcc	%g3,	%g6,	%l5
	sub	%i1,	%o4,	%g7
	edge16l	%o0,	%o5,	%g4
	sdivcc	%o3,	0x1730,	%o7
	nop
	set	0x0C, %i6
	stw	%o2,	[%l7 + %i6]
	edge16ln	%g2,	%i6,	%i2
	movrne	%o1,	0x1B9,	%i5
	fmul8sux16	%f2,	%f10,	%f4
	fmovsgu	%xcc,	%f11,	%f16
	ldd	[%l7 + 0x08],	%f4
	umulcc	%l6,	%l2,	%l0
	fxnors	%f9,	%f14,	%f25
	nop
	set	0x10, %i0
	sth	%g1,	[%l7 + %i0]
	fcmpeq16	%f6,	%f2,	%l1
	edge16n	%l4,	%i0,	%i4
	movre	%g5,	0x326,	%i7
	ldd	[%l7 + 0x28],	%l2
	sllx	%i3,	0x02,	%o6
	xorcc	%g6,	0x0A29,	%l5
	smul	%i1,	%g3,	%o4
	movvc	%xcc,	%o0,	%g7
	setx loop_102, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_102: 	fmovsa	%xcc,	%f5,	%f4
	ldsb	[%l7 + 0x0B],	%o7
	fpadd16	%f26,	%f6,	%f4
	movle	%icc,	%g2,	%o2
	fandnot2	%f10,	%f12,	%f2
	movpos	%icc,	%i6,	%i2
	edge8ln	%i5,	%o1,	%l6
	alignaddr	%l0,	%l2,	%l1
	fsrc2s	%f12,	%f31
	orn	%g1,	0x1628,	%l4
	mulscc	%i0,	%i4,	%i7
	movvc	%xcc,	%g5,	%l3
	sdiv	%i3,	0x127B,	%g6
	edge8	%l5,	%i1,	%o6
	edge16n	%o4,	%g3,	%g7
	orncc	%g4,	%o5,	%o3
	sth	%o7,	[%l7 + 0x60]
	edge32ln	%g2,	%o2,	%i6
	subcc	%o0,	0x0695,	%i5
	sth	%i2,	[%l7 + 0x72]
	nop
	set	0x28, %i3
	stb	%l6,	[%l7 + %i3]
	udivx	%o1,	0x1186,	%l2
	ldsb	[%l7 + 0x59],	%l1
	edge16	%l0,	%g1,	%i0
	movpos	%xcc,	%l4,	%i4
	array8	%i7,	%l3,	%i3
	movcc	%xcc,	%g6,	%g5
	smulcc	%l5,	0x127D,	%i1
	udivx	%o6,	0x1506,	%g3
	sllx	%o4,	%g7,	%g4
	sth	%o3,	[%l7 + 0x6A]
	array32	%o7,	%g2,	%o5
	movg	%icc,	%i6,	%o2
	fmovsa	%xcc,	%f0,	%f2
	edge8	%i5,	%i2,	%l6
	sll	%o1,	%o0,	%l1
	addcc	%l2,	%l0,	%i0
	fornot2	%f16,	%f14,	%f10
	edge32	%g1,	%l4,	%i7
	fsrc1s	%f14,	%f12
	xnor	%l3,	0x1B1C,	%i4
	stb	%i3,	[%l7 + 0x5C]
	stx	%g5,	[%l7 + 0x40]
	fcmpgt32	%f20,	%f12,	%l5
	array16	%g6,	%o6,	%g3
	sir	0x039E
	lduw	[%l7 + 0x6C],	%i1
	udiv	%o4,	0x1166,	%g7
	add	%o3,	%g4,	%g2
	mulx	%o5,	0x0E65,	%i6
	nop
	set	0x3C, %g3
	stw	%o2,	[%l7 + %g3]
	mulx	%o7,	0x0F02,	%i2
	array32	%l6,	%i5,	%o1
	movcs	%xcc,	%o0,	%l2
	subcc	%l1,	%l0,	%i0
	edge8n	%g1,	%l4,	%i7
	sir	0x1287
	andcc	%l3,	%i4,	%i3
	addcc	%l5,	0x0061,	%g5
	movg	%xcc,	%g6,	%g3
	fmovse	%xcc,	%f23,	%f26
	edge8ln	%o6,	%o4,	%i1
	mova	%xcc,	%o3,	%g4
	fpadd32s	%f4,	%f12,	%f24
	edge16	%g2,	%o5,	%g7
	sdivcc	%i6,	0x0287,	%o2
	subcc	%o7,	%i2,	%l6
	save %i5, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l1,	[%l7 + 0x3C]
	srl	%o0,	%i0,	%g1
	fmovdge	%xcc,	%f27,	%f0
	movg	%icc,	%l0,	%l4
	stb	%l3,	[%l7 + 0x1E]
	fmovdl	%xcc,	%f31,	%f12
	array16	%i7,	%i4,	%i3
	ldsw	[%l7 + 0x50],	%l5
	edge8ln	%g6,	%g3,	%g5
	andcc	%o6,	%i1,	%o4
	fones	%f28
	movrgz	%o3,	%g4,	%g2
	subc	%g7,	%i6,	%o2
	fmovdgu	%icc,	%f21,	%f1
	sra	%o5,	0x05,	%i2
	edge8	%o7,	%i5,	%o1
	fxors	%f29,	%f24,	%f4
	orn	%l6,	0x09A9,	%l2
	array32	%l1,	%i0,	%g1
	xorcc	%o0,	0x1AFC,	%l0
	orn	%l3,	%i7,	%l4
	movneg	%icc,	%i4,	%l5
	ldx	[%l7 + 0x30],	%i3
	movvs	%icc,	%g6,	%g3
	edge8ln	%o6,	%g5,	%i1
	mulx	%o4,	0x0757,	%o3
	fmul8ulx16	%f10,	%f14,	%f16
	movvs	%xcc,	%g2,	%g4
	ldd	[%l7 + 0x78],	%f14
	std	%f22,	[%l7 + 0x38]
	array16	%i6,	%o2,	%o5
	movle	%icc,	%g7,	%o7
	mulx	%i2,	0x16E8,	%i5
	xnorcc	%o1,	%l2,	%l6
	srlx	%i0,	%g1,	%l1
	sub	%l0,	%o0,	%i7
	sdiv	%l3,	0x0290,	%i4
	fandnot1s	%f11,	%f15,	%f6
	fnor	%f6,	%f6,	%f30
	sth	%l5,	[%l7 + 0x3E]
	fmovsleu	%icc,	%f29,	%f22
	std	%f0,	[%l7 + 0x60]
	andn	%l4,	%i3,	%g3
	movcs	%icc,	%o6,	%g5
	edge16l	%g6,	%i1,	%o4
	movpos	%xcc,	%g2,	%g4
	movn	%xcc,	%o3,	%i6
	move	%icc,	%o2,	%o5
	fcmps	%fcc2,	%f30,	%f15
	movrne	%g7,	0x245,	%o7
	sir	0x1E4A
	edge16ln	%i2,	%i5,	%l2
	edge16	%o1,	%l6,	%g1
	lduw	[%l7 + 0x64],	%l1
	fpsub16	%f24,	%f22,	%f8
	edge16l	%l0,	%o0,	%i7
	edge8n	%i0,	%l3,	%i4
	alignaddrl	%l4,	%i3,	%l5
	andn	%o6,	0x1647,	%g3
	fcmpne32	%f12,	%f22,	%g5
	edge8	%i1,	%g6,	%g2
	movpos	%icc,	%o4,	%o3
	movn	%xcc,	%g4,	%i6
	ldsh	[%l7 + 0x26],	%o2
	edge16l	%o5,	%o7,	%i2
	fmovsa	%xcc,	%f26,	%f22
	fmovspos	%xcc,	%f12,	%f5
	movneg	%icc,	%g7,	%l2
	xorcc	%i5,	%o1,	%g1
	fmovd	%f2,	%f12
	movl	%icc,	%l6,	%l1
	ldsw	[%l7 + 0x14],	%o0
	edge32	%i7,	%l0,	%i0
	movrlz	%i4,	0x062,	%l4
	edge16l	%l3,	%l5,	%i3
	xorcc	%o6,	0x14C7,	%g3
	edge8	%i1,	%g5,	%g6
	ldsh	[%l7 + 0x76],	%g2
	edge8l	%o4,	%g4,	%o3
	edge8ln	%o2,	%o5,	%i6
	sll	%o7,	%g7,	%i2
	fmovdle	%icc,	%f11,	%f0
	fandnot2s	%f13,	%f8,	%f1
	array32	%i5,	%o1,	%l2
	srlx	%g1,	%l6,	%o0
	addc	%l1,	0x179D,	%i7
	edge8n	%i0,	%i4,	%l0
	or	%l3,	0x1EB3,	%l5
	lduh	[%l7 + 0x56],	%i3
	fnot2s	%f2,	%f17
	sethi	0x13D2,	%l4
	movn	%icc,	%o6,	%i1
	mulx	%g5,	%g3,	%g2
	std	%f24,	[%l7 + 0x18]
	alignaddr	%g6,	%g4,	%o4
	edge32	%o3,	%o2,	%o5
	fmovrslz	%o7,	%f13,	%f26
	fmul8ulx16	%f24,	%f16,	%f16
	andncc	%g7,	%i2,	%i5
	udivcc	%i6,	0x1E87,	%o1
	edge16l	%g1,	%l2,	%l6
	fmovrdgez	%l1,	%f16,	%f4
	orn	%i7,	%o0,	%i0
	sethi	0x1BA9,	%i4
	movgu	%icc,	%l0,	%l5
	movn	%icc,	%l3,	%l4
	xnorcc	%i3,	0x0315,	%o6
	srax	%i1,	%g5,	%g2
	fxnors	%f7,	%f23,	%f21
	andcc	%g3,	%g4,	%o4
	movleu	%icc,	%o3,	%g6
	movre	%o5,	%o7,	%o2
	edge16n	%i2,	%i5,	%g7
	srlx	%i6,	0x0B,	%g1
	fmovdne	%icc,	%f5,	%f4
	mulx	%o1,	0x1106,	%l2
	fmul8ulx16	%f10,	%f8,	%f26
	movpos	%xcc,	%l1,	%i7
	sir	0x0D02
	sdiv	%l6,	0x1571,	%o0
	movle	%icc,	%i0,	%l0
	restore %i4, %l5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l4,	0x0CF8,	%o6
	edge32	%i1,	%g5,	%i3
	popc	%g3,	%g2
	ldsw	[%l7 + 0x20],	%g4
	std	%f28,	[%l7 + 0x58]
	fpsub16s	%f11,	%f13,	%f4
	movrlz	%o4,	0x111,	%g6
	movre	%o3,	0x084,	%o5
	std	%f10,	[%l7 + 0x50]
	movcs	%xcc,	%o2,	%i2
	movle	%xcc,	%i5,	%o7
	fmul8ulx16	%f22,	%f30,	%f10
	ldsw	[%l7 + 0x24],	%i6
	st	%f17,	[%l7 + 0x48]
	stw	%g7,	[%l7 + 0x44]
	udiv	%o1,	0x06E5,	%l2
	fmovs	%f13,	%f22
	fxor	%f10,	%f16,	%f6
	stb	%g1,	[%l7 + 0x7B]
	umulcc	%l1,	%i7,	%l6
	popc	0x12C9,	%o0
	edge16l	%l0,	%i4,	%i0
	fmovdleu	%icc,	%f22,	%f10
	xnor	%l5,	0x0271,	%l4
	xorcc	%o6,	0x0F0B,	%i1
	fnegd	%f30,	%f4
	alignaddrl	%l3,	%i3,	%g5
	xorcc	%g2,	0x14FF,	%g4
	fmovdpos	%xcc,	%f6,	%f28
	movvs	%icc,	%o4,	%g6
	fmovrde	%g3,	%f14,	%f22
	xnor	%o3,	0x0AC3,	%o5
	stw	%o2,	[%l7 + 0x20]
	ld	[%l7 + 0x38],	%f26
	lduh	[%l7 + 0x5E],	%i2
	edge8l	%o7,	%i6,	%g7
	movne	%icc,	%o1,	%i5
	fmovsneg	%icc,	%f20,	%f27
	sra	%l2,	%l1,	%i7
	fmovdge	%xcc,	%f29,	%f18
	edge32ln	%l6,	%g1,	%o0
	sllx	%i4,	%i0,	%l0
	edge32	%l5,	%o6,	%i1
	movrne	%l4,	0x3DE,	%l3
	edge8	%i3,	%g2,	%g4
	subccc	%g5,	%o4,	%g6
	nop
	set	0x28, %l4
	std	%f6,	[%l7 + %l4]
	edge8ln	%g3,	%o5,	%o2
	std	%f16,	[%l7 + 0x50]
	fsrc2s	%f27,	%f22
	movg	%xcc,	%i2,	%o3
	move	%icc,	%o7,	%i6
	bshuffle	%f4,	%f24,	%f28
	alignaddr	%g7,	%i5,	%l2
	fmovsne	%xcc,	%f14,	%f20
	sethi	0x025E,	%o1
	sir	0x198F
	fcmple32	%f10,	%f16,	%l1
	fcmpne16	%f14,	%f6,	%l6
	movrlz	%g1,	%o0,	%i4
	nop
	set	0x7C, %g6
	ldsh	[%l7 + %g6],	%i0
	array32	%l0,	%i7,	%l5
	edge8n	%i1,	%o6,	%l4
	edge16n	%i3,	%g2,	%l3
	fcmpgt16	%f24,	%f14,	%g5
	fmul8x16al	%f20,	%f11,	%f22
	fmovsvc	%xcc,	%f1,	%f19
	movle	%xcc,	%g4,	%o4
	fmovrsgez	%g6,	%f7,	%f15
	sra	%o5,	%g3,	%i2
	edge32ln	%o2,	%o3,	%i6
	fmovsn	%icc,	%f8,	%f6
	movvs	%icc,	%g7,	%i5
	sub	%l2,	%o1,	%l1
	movrgz	%l6,	0x30D,	%o7
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%g1
	ldd	[%l7 + 0x08],	%f10
	ldsw	[%l7 + 0x40],	%o0
	fornot2s	%f13,	%f21,	%f21
	edge16ln	%i4,	%i0,	%l0
	subc	%l5,	0x16E6,	%i1
	edge16l	%o6,	%i7,	%i3
	fpadd32s	%f13,	%f26,	%f0
	std	%f26,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%l4
	st	%f14,	[%l7 + 0x14]
	xor	%l3,	%g5,	%g4
	fsrc1	%f20,	%f10
	stw	%g2,	[%l7 + 0x48]
	srax	%g6,	%o4,	%g3
	pdist	%f2,	%f22,	%f18
	movneg	%icc,	%i2,	%o5
	alignaddr	%o2,	%i6,	%g7
	movleu	%xcc,	%o3,	%l2
	fmovda	%icc,	%f24,	%f19
	smul	%i5,	%l1,	%l6
	andcc	%o1,	%g1,	%o7
	udivx	%o0,	0x1909,	%i0
	fmovdpos	%xcc,	%f10,	%f16
	edge16	%l0,	%i4,	%l5
	addc	%i1,	%o6,	%i3
	edge16n	%i7,	%l3,	%l4
	ldd	[%l7 + 0x38],	%f2
	movcc	%xcc,	%g5,	%g2
	edge8n	%g6,	%g4,	%g3
	sir	0x061B
	array8	%i2,	%o4,	%o5
	movg	%xcc,	%i6,	%o2
	andncc	%g7,	%o3,	%l2
	ldd	[%l7 + 0x60],	%f14
	ldsw	[%l7 + 0x2C],	%l1
	ldx	[%l7 + 0x08],	%l6
	movrlz	%o1,	0x2AC,	%g1
	fnand	%f24,	%f24,	%f12
	movgu	%xcc,	%i5,	%o7
	andncc	%i0,	%l0,	%i4
	fmovsg	%xcc,	%f28,	%f22
	move	%icc,	%l5,	%i1
	siam	0x4
	subc	%o0,	0x1AB3,	%i3
	edge32ln	%i7,	%l3,	%l4
	alignaddrl	%g5,	%o6,	%g6
	andn	%g4,	%g2,	%g3
	ldsh	[%l7 + 0x14],	%o4
	subccc	%i2,	0x0397,	%i6
	edge16l	%o5,	%g7,	%o3
	srax	%o2,	%l2,	%l1
	xorcc	%l6,	0x1BCE,	%o1
	faligndata	%f30,	%f2,	%f4
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g0
	fmul8x16	%f23,	%f4,	%f22
	umul	%i5,	0x1C0A,	%i0
	addcc	%l0,	0x011E,	%o7
	andn	%i4,	0x0C86,	%i1
	st	%f12,	[%l7 + 0x48]
	edge32ln	%l5,	%o0,	%i3
	subcc	%l3,	0x0CD4,	%i7
	movne	%xcc,	%l4,	%g5
	srax	%o6,	%g6,	%g2
	stb	%g3,	[%l7 + 0x17]
	fmovrdgez	%g4,	%f4,	%f26
	sra	%o4,	%i2,	%i6
	stw	%o5,	[%l7 + 0x18]
	xorcc	%g7,	%o2,	%o3
	setx loop_103, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_103: 	movrlz	%g1,	0x059,	%i5
	fmovrsne	%l1,	%f10,	%f26
	edge32ln	%i0,	%o7,	%i4
	fmul8x16al	%f28,	%f13,	%f2
	fnands	%f23,	%f12,	%f28
	udivcc	%i1,	0x0ADF,	%l0
	movle	%icc,	%o0,	%i3
	movneg	%xcc,	%l3,	%l5
	mulx	%l4,	0x1183,	%g5
	udiv	%i7,	0x029F,	%g6
	lduw	[%l7 + 0x58],	%o6
	array16	%g3,	%g4,	%g2
	movrgz	%i2,	%i6,	%o5
	fmovsa	%xcc,	%f29,	%f7
	stb	%o4,	[%l7 + 0x28]
	orncc	%g7,	0x01AD,	%o3
	edge8ln	%l2,	%o2,	%o1
	save %l6, 0x1B41, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f10,	%f15,	%f8
	bshuffle	%f20,	%f30,	%f26
	fornot2s	%f31,	%f28,	%f9
	restore %g1, 0x00E3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i0,	0x098F,	%i4
	st	%f14,	[%l7 + 0x2C]
	fcmple32	%f8,	%f4,	%i1
	stw	%o7,	[%l7 + 0x30]
	fandnot2s	%f25,	%f5,	%f16
	fand	%f18,	%f16,	%f18
	fmovrse	%o0,	%f10,	%f25
	fornot2s	%f31,	%f25,	%f27
	stb	%i3,	[%l7 + 0x2A]
	movrgz	%l0,	%l5,	%l3
	subcc	%l4,	0x126D,	%g5
	ldsh	[%l7 + 0x72],	%g6
	xnor	%i7,	0x17CB,	%o6
	sdiv	%g3,	0x1800,	%g4
	xor	%g2,	%i6,	%i2
	movn	%xcc,	%o4,	%g7
	edge32	%o3,	%l2,	%o2
	fmovdl	%xcc,	%f10,	%f20
	andn	%o1,	%l6,	%o5
	fmovdneg	%icc,	%f23,	%f14
	fmovsne	%icc,	%f31,	%f1
	movre	%g1,	0x2F3,	%l1
	fornot2s	%f10,	%f21,	%f3
	fornot2s	%f20,	%f30,	%f7
	ld	[%l7 + 0x4C],	%f2
	edge8	%i5,	%i0,	%i4
	fmovde	%icc,	%f10,	%f3
	movne	%icc,	%i1,	%o0
	addcc	%i3,	0x02C4,	%l0
	ldsw	[%l7 + 0x40],	%o7
	orn	%l3,	%l5,	%g5
	edge16ln	%g6,	%i7,	%o6
	ldsh	[%l7 + 0x76],	%l4
	fcmpne32	%f22,	%f24,	%g3
	andn	%g4,	%g2,	%i2
	edge16n	%o4,	%i6,	%g7
	orcc	%l2,	0x14B1,	%o2
	addccc	%o3,	0x0CC7,	%l6
	sdiv	%o5,	0x0C28,	%g1
	orn	%o1,	%i5,	%i0
	fzeros	%f16
	fandnot2s	%f7,	%f24,	%f27
	orcc	%i4,	0x0A3E,	%l1
	orncc	%i1,	%o0,	%i3
	srlx	%l0,	0x02,	%l3
	sub	%o7,	%l5,	%g6
	srax	%g5,	0x1A,	%i7
	lduw	[%l7 + 0x34],	%l4
	sub	%o6,	0x0196,	%g3
	movvc	%xcc,	%g4,	%i2
	fnot2s	%f27,	%f8
	udiv	%o4,	0x15F6,	%g2
	fxnor	%f10,	%f28,	%f0
	sethi	0x04C4,	%g7
	fmovsge	%xcc,	%f4,	%f9
	addc	%i6,	%o2,	%l2
	xnorcc	%o3,	0x0E6E,	%o5
	ldd	[%l7 + 0x60],	%g0
	fmovdcc	%xcc,	%f0,	%f3
	edge8ln	%l6,	%o1,	%i0
	pdist	%f2,	%f26,	%f0
	smulcc	%i5,	0x0BB3,	%l1
	movn	%icc,	%i4,	%i1
	fpsub32s	%f8,	%f17,	%f18
	stb	%i3,	[%l7 + 0x3D]
	and	%l0,	%o0,	%o7
	srax	%l3,	0x02,	%l5
	sethi	0x184D,	%g6
	movl	%icc,	%i7,	%l4
	xor	%g5,	%o6,	%g4
	xorcc	%i2,	0x0AB0,	%g3
	lduh	[%l7 + 0x48],	%g2
	edge8ln	%o4,	%g7,	%i6
	fmovde	%xcc,	%f18,	%f7
	std	%f2,	[%l7 + 0x08]
	orncc	%l2,	0x00B8,	%o3
	std	%f12,	[%l7 + 0x28]
	ldsw	[%l7 + 0x30],	%o5
	edge32ln	%o2,	%g1,	%o1
	fsrc2	%f16,	%f30
	fpack16	%f0,	%f11
	st	%f2,	[%l7 + 0x0C]
	sdivcc	%l6,	0x001D,	%i0
	fnands	%f19,	%f31,	%f2
	sub	%l1,	0x0AB4,	%i5
	addc	%i1,	0x1BF7,	%i3
	array32	%l0,	%o0,	%o7
	movgu	%xcc,	%l3,	%i4
	array16	%l5,	%g6,	%i7
	edge16l	%l4,	%g5,	%o6
	fmovd	%f28,	%f18
	sdiv	%g4,	0x1776,	%g3
	xor	%i2,	0x0DE6,	%o4
	andn	%g2,	%i6,	%g7
	orncc	%l2,	0x1801,	%o3
	edge32	%o2,	%o5,	%g1
	andcc	%l6,	0x1DD8,	%o1
	udivx	%l1,	0x14FF,	%i5
	edge8n	%i1,	%i3,	%i0
	edge32n	%o0,	%l0,	%l3
	orcc	%i4,	0x0AA5,	%o7
	udivcc	%g6,	0x17E1,	%i7
	orncc	%l5,	%g5,	%l4
	fones	%f17
	fmovdvs	%xcc,	%f0,	%f27
	srax	%o6,	%g3,	%g4
	movrgz	%o4,	%g2,	%i6
	smulcc	%g7,	%i2,	%l2
	movleu	%icc,	%o3,	%o5
	st	%f21,	[%l7 + 0x28]
	movle	%xcc,	%g1,	%o2
	fmovdg	%icc,	%f20,	%f23
	sub	%l6,	0x0B6A,	%o1
	fmovrse	%i5,	%f9,	%f24
	udivx	%i1,	0x1417,	%l1
	movcs	%icc,	%i0,	%i3
	movcc	%xcc,	%o0,	%l3
	sethi	0x1179,	%i4
	st	%f22,	[%l7 + 0x10]
	fmovrdne	%l0,	%f10,	%f26
	edge8n	%o7,	%i7,	%l5
	sra	%g5,	%g6,	%l4
	movge	%icc,	%g3,	%g4
	edge32n	%o4,	%g2,	%i6
	ldx	[%l7 + 0x18],	%g7
	fmovscs	%xcc,	%f3,	%f11
	movn	%icc,	%i2,	%o6
	add	%l2,	%o3,	%g1
	fmovd	%f12,	%f14
	lduh	[%l7 + 0x6A],	%o2
	sir	0x0FD0
	edge16ln	%l6,	%o1,	%i5
	array16	%o5,	%l1,	%i1
	fnot2	%f24,	%f28
	and	%i0,	0x15A4,	%i3
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f8
	movrgz	%o0,	%i4,	%l0
	edge8	%l3,	%i7,	%l5
	add	%g5,	0x0BD1,	%g6
	edge8l	%l4,	%o7,	%g4
	save %o4, 0x03A2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i6,	0x10E,	%g7
	subc	%i2,	%g3,	%o6
	andn	%o3,	0x1A64,	%l2
	edge8n	%o2,	%l6,	%g1
	alignaddr	%i5,	%o5,	%l1
	mulscc	%i1,	0x0727,	%o1
	lduw	[%l7 + 0x2C],	%i3
	fcmpne32	%f0,	%f12,	%i0
	std	%f14,	[%l7 + 0x30]
	movle	%xcc,	%o0,	%l0
	addcc	%i4,	0x129B,	%l3
	fmovdn	%xcc,	%f28,	%f13
	movcs	%icc,	%i7,	%l5
	fsrc1	%f30,	%f16
	edge8ln	%g6,	%g5,	%o7
	sdivcc	%g4,	0x1597,	%l4
	or	%g2,	%o4,	%g7
	edge32	%i2,	%g3,	%i6
	fands	%f21,	%f25,	%f20
	mova	%icc,	%o6,	%l2
	sdivcc	%o2,	0x0AE0,	%l6
	udivx	%o3,	0x098E,	%g1
	fmovdgu	%icc,	%f19,	%f23
	fnegd	%f26,	%f12
	move	%xcc,	%i5,	%l1
	move	%xcc,	%i1,	%o1
	andcc	%o5,	%i0,	%i3
	add	%o0,	%i4,	%l3
	sdivx	%l0,	0x0C9A,	%l5
	fmovsleu	%icc,	%f24,	%f8
	fones	%f16
	udivx	%g6,	0x0ABE,	%i7
	fcmped	%fcc2,	%f24,	%f20
	fandnot2s	%f22,	%f26,	%f14
	edge16n	%o7,	%g4,	%g5
	fmovdleu	%icc,	%f0,	%f18
	fzero	%f4
	orcc	%l4,	0x1395,	%g2
	fpadd32s	%f11,	%f12,	%f20
	array16	%o4,	%i2,	%g3
	srax	%i6,	%g7,	%o6
	or	%l2,	0x1BAA,	%o2
	fabss	%f19,	%f1
	stw	%o3,	[%l7 + 0x10]
	fmuld8ulx16	%f19,	%f16,	%f30
	subcc	%g1,	%i5,	%l6
	fmovdcc	%xcc,	%f19,	%f9
	mova	%xcc,	%l1,	%o1
	movneg	%xcc,	%i1,	%o5
	sth	%i3,	[%l7 + 0x3C]
	movn	%icc,	%o0,	%i0
	movcs	%icc,	%i4,	%l0
	fmovdcs	%icc,	%f9,	%f16
	edge8l	%l3,	%l5,	%g6
	fmovda	%icc,	%f8,	%f6
	movl	%xcc,	%o7,	%g4
	fmovdcc	%icc,	%f22,	%f3
	fmovdn	%xcc,	%f31,	%f0
	sra	%g5,	0x0D,	%l4
	ld	[%l7 + 0x14],	%f22
	andncc	%g2,	%o4,	%i7
	stw	%g3,	[%l7 + 0x78]
	fpsub16s	%f5,	%f8,	%f19
	edge16n	%i6,	%i2,	%o6
	edge32n	%g7,	%l2,	%o3
	edge32	%g1,	%o2,	%i5
	fabsd	%f4,	%f8
	stx	%l1,	[%l7 + 0x68]
	movle	%xcc,	%o1,	%l6
	movvs	%icc,	%o5,	%i3
	edge8ln	%o0,	%i1,	%i4
	xor	%i0,	%l0,	%l5
	movleu	%icc,	%l3,	%o7
	edge16ln	%g4,	%g5,	%g6
	save %g2, %l4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i7,	%i6,	%g3
	movcs	%icc,	%i2,	%o6
	movpos	%xcc,	%l2,	%g7
	sub	%g1,	0x1C46,	%o3
	fmovrde	%o2,	%f14,	%f8
	orcc	%i5,	0x0B19,	%o1
	fors	%f8,	%f25,	%f4
	for	%f20,	%f28,	%f6
	movcc	%icc,	%l6,	%o5
	sir	0x1BC9
	fmovrdgez	%i3,	%f4,	%f10
	and	%l1,	0x14F2,	%o0
	movle	%xcc,	%i4,	%i0
	sdivx	%i1,	0x1FDB,	%l5
	fandnot2s	%f20,	%f17,	%f6
	movrgez	%l0,	%l3,	%g4
	movvc	%icc,	%o7,	%g5
	udiv	%g6,	0x0198,	%l4
	stw	%o4,	[%l7 + 0x18]
	alignaddr	%g2,	%i6,	%i7
	movl	%xcc,	%g3,	%o6
	lduh	[%l7 + 0x2E],	%l2
	udivx	%i2,	0x1B54,	%g1
	fcmple16	%f4,	%f26,	%g7
	array32	%o3,	%i5,	%o2
	fcmpgt32	%f4,	%f28,	%l6
	move	%icc,	%o1,	%i3
	sdivx	%l1,	0x179B,	%o0
	edge16n	%o5,	%i0,	%i4
	srax	%l5,	0x18,	%i1
	setx loop_104, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_104: 	mulscc	%l3,	%g5,	%g6
	movn	%xcc,	%l4,	%o4
	srl	%g2,	0x07,	%i6
	srax	%o7,	%i7,	%g3
	edge16l	%l2,	%o6,	%g1
	movg	%icc,	%i2,	%o3
	sir	0x07E3
	alignaddr	%g7,	%o2,	%i5
	xorcc	%l6,	%o1,	%i3
	alignaddr	%l1,	%o5,	%o0
	ld	[%l7 + 0x7C],	%f7
	ldx	[%l7 + 0x28],	%i0
	restore %i4, 0x152E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f30,	%f17
	orcc	%l5,	0x1787,	%l0
	fmovdg	%xcc,	%f2,	%f1
	edge16n	%g4,	%l3,	%g6
	fsrc1	%f0,	%f16
	edge32ln	%g5,	%l4,	%o4
	subccc	%g2,	%o7,	%i7
	movrgez	%g3,	0x0F4,	%l2
	stb	%o6,	[%l7 + 0x33]
	andn	%g1,	%i2,	%o3
	save %g7, %o2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l6,	%o1
	stx	%i5,	[%l7 + 0x60]
	movgu	%xcc,	%l1,	%i3
	save %o5, %o0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i4,	0x15C2,	%i1
	array8	%l0,	%l5,	%l3
	edge32n	%g4,	%g5,	%l4
	stw	%g6,	[%l7 + 0x24]
	movneg	%xcc,	%g2,	%o7
	andncc	%o4,	%g3,	%l2
	movl	%xcc,	%o6,	%i7
	edge8ln	%i2,	%g1,	%g7
	edge32	%o2,	%o3,	%i6
	fmovrdlz	%o1,	%f30,	%f24
	fmovrslez	%l6,	%f0,	%f9
	fcmpne32	%f22,	%f12,	%i5
	umulcc	%i3,	%o5,	%o0
	movgu	%xcc,	%l1,	%i4
	orn	%i0,	%i1,	%l0
	andcc	%l3,	%l5,	%g4
	edge8n	%l4,	%g5,	%g6
	lduw	[%l7 + 0x58],	%g2
	andcc	%o7,	0x16BB,	%o4
	movge	%icc,	%g3,	%o6
	ldx	[%l7 + 0x30],	%i7
	xnorcc	%l2,	%i2,	%g1
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%o2
	alignaddrl	%g7,	%i6,	%o3
	lduh	[%l7 + 0x56],	%l6
	stb	%o1,	[%l7 + 0x7F]
	ld	[%l7 + 0x1C],	%f24
	fmovdle	%icc,	%f11,	%f13
	fexpand	%f15,	%f12
	movne	%icc,	%i5,	%o5
	edge32n	%i3,	%o0,	%i4
	xnor	%i0,	%i1,	%l1
	edge16n	%l3,	%l5,	%l0
	nop
	set	0x58, %o1
	std	%f2,	[%l7 + %o1]
	fmovrslez	%l4,	%f4,	%f20
	array8	%g4,	%g6,	%g2
	fpadd16s	%f3,	%f7,	%f27
	andn	%g5,	%o7,	%g3
	edge32	%o4,	%i7,	%l2
	edge8l	%o6,	%i2,	%o2
	save %g7, 0x0164, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x51],	%i6
	movrgz	%o3,	%l6,	%i5
	edge32	%o5,	%i3,	%o0
	udivx	%i4,	0x1D6A,	%o1
	ldd	[%l7 + 0x38],	%f26
	movge	%icc,	%i1,	%i0
	ldsw	[%l7 + 0x6C],	%l1
	alignaddr	%l5,	%l3,	%l4
	nop
	set	0x36, %i4
	lduh	[%l7 + %i4],	%g4
	fands	%f4,	%f6,	%f13
	movge	%xcc,	%g6,	%l0
	movgu	%xcc,	%g5,	%o7
	andncc	%g2,	%o4,	%g3
	movne	%xcc,	%i7,	%o6
	sethi	0x08A5,	%i2
	pdist	%f20,	%f24,	%f28
	array8	%o2,	%l2,	%g1
	edge16	%g7,	%i6,	%l6
	sth	%i5,	[%l7 + 0x08]
	movne	%icc,	%o5,	%o3
	orn	%i3,	%o0,	%i4
	stx	%o1,	[%l7 + 0x18]
	movcc	%icc,	%i0,	%l1
	movrgez	%i1,	0x1E6,	%l3
	fmovsvs	%icc,	%f18,	%f23
	edge32	%l4,	%l5,	%g4
	udivcc	%l0,	0x0680,	%g5
	fpack16	%f18,	%f15
	ldsh	[%l7 + 0x18],	%g6
	fpadd32	%f22,	%f24,	%f4
	movne	%xcc,	%o7,	%o4
	fmovrdgez	%g3,	%f22,	%f0
	udivx	%g2,	0x1F34,	%o6
	movpos	%xcc,	%i7,	%i2
	fandnot2s	%f15,	%f12,	%f22
	ldsb	[%l7 + 0x7B],	%o2
	edge32	%l2,	%g1,	%g7
	fmovsle	%icc,	%f16,	%f7
	sra	%i6,	0x1C,	%l6
	edge8n	%i5,	%o3,	%i3
	movle	%icc,	%o5,	%o0
	alignaddrl	%o1,	%i4,	%i0
	fnot2	%f26,	%f0
	movcs	%icc,	%i1,	%l1
	andncc	%l4,	%l3,	%g4
	udiv	%l0,	0x0F13,	%l5
	mova	%icc,	%g5,	%g6
	ldub	[%l7 + 0x35],	%o7
	sdiv	%o4,	0x034C,	%g3
	save %g2, %o6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i7,	0x12F,	%o2
	edge16	%g1,	%g7,	%l2
	edge32	%l6,	%i5,	%o3
	for	%f0,	%f2,	%f22
	edge32l	%i3,	%o5,	%o0
	ldsb	[%l7 + 0x15],	%o1
	fandnot1	%f22,	%f6,	%f28
	mulx	%i6,	%i0,	%i4
	fmovsvs	%xcc,	%f1,	%f25
	movneg	%icc,	%l1,	%i1
	umulcc	%l3,	%l4,	%g4
	movre	%l0,	%l5,	%g6
	srlx	%g5,	0x1B,	%o7
	fxors	%f21,	%f5,	%f28
	ldsw	[%l7 + 0x7C],	%o4
	movvc	%xcc,	%g2,	%o6
	subcc	%i2,	0x1455,	%g3
	edge32ln	%o2,	%i7,	%g7
	smul	%g1,	0x0753,	%l6
	array16	%i5,	%l2,	%o3
	fmovrsgez	%o5,	%f26,	%f14
	or	%o0,	%i3,	%o1
	fandnot1s	%f8,	%f6,	%f22
	smul	%i0,	0x05BE,	%i4
	ldd	[%l7 + 0x28],	%f16
	array32	%l1,	%i6,	%i1
	edge8l	%l3,	%l4,	%g4
	array32	%l0,	%g6,	%g5
	alignaddr	%l5,	%o7,	%g2
	udivcc	%o6,	0x0A82,	%o4
	fzero	%f6
	popc	0x1020,	%i2
	sllx	%g3,	0x0C,	%o2
	fnot1	%f22,	%f18
	mova	%icc,	%g7,	%g1
	ldd	[%l7 + 0x68],	%f22
	movle	%icc,	%l6,	%i5
	sllx	%l2,	0x1D,	%o3
	save %i7, 0x00B2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o0,	0x1904,	%o1
	movre	%i3,	%i0,	%i4
	addcc	%i6,	0x14A5,	%i1
	setx loop_105, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_105: 	fpack32	%f8,	%f0,	%f16
	movrgz	%g4,	0x020,	%l0
	subcc	%g6,	%l1,	%g5
	xnorcc	%o7,	0x0BAC,	%g2
	udivcc	%l5,	0x16A1,	%o6
	edge8ln	%o4,	%i2,	%g3
	restore %o2, %g7, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l6,	%i5,	%o3
	movn	%icc,	%i7,	%o5
	ld	[%l7 + 0x44],	%f23
	xnorcc	%l2,	0x0089,	%o0
	fmovspos	%icc,	%f25,	%f31
	movcs	%icc,	%o1,	%i3
	sllx	%i4,	%i6,	%i1
	fone	%f20
	udivx	%l3,	0x1DA5,	%i0
	fpack32	%f26,	%f4,	%f14
	edge16	%l4,	%l0,	%g4
	move	%icc,	%l1,	%g6
	edge8l	%o7,	%g5,	%g2
	movn	%icc,	%o6,	%o4
	movl	%xcc,	%l5,	%g3
	ldsh	[%l7 + 0x5A],	%i2
	movcs	%icc,	%o2,	%g1
	fexpand	%f28,	%f6
	edge32n	%g7,	%i5,	%l6
	addcc	%i7,	0x019F,	%o3
	stw	%o5,	[%l7 + 0x20]
	mova	%icc,	%o0,	%o1
	edge16n	%l2,	%i3,	%i6
	fors	%f23,	%f6,	%f10
	fxnor	%f22,	%f8,	%f28
	fmul8ulx16	%f20,	%f10,	%f28
	move	%icc,	%i1,	%i4
	sir	0x1092
	xnor	%l3,	0x0897,	%i0
	fornot1	%f28,	%f10,	%f24
	save %l0, 0x11B9, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l1,	%g4,	%o7
	fmul8ulx16	%f8,	%f14,	%f18
	stx	%g5,	[%l7 + 0x58]
	movcc	%xcc,	%g6,	%g2
	array16	%o6,	%o4,	%g3
	array8	%i2,	%o2,	%g1
	orn	%l5,	0x04FE,	%g7
	movpos	%xcc,	%i5,	%i7
	edge8n	%o3,	%o5,	%l6
	ld	[%l7 + 0x14],	%f3
	orn	%o1,	%o0,	%l2
	fmovdcc	%icc,	%f10,	%f18
	fmovsvs	%xcc,	%f16,	%f7
	sdivx	%i6,	0x0910,	%i1
	movn	%icc,	%i4,	%i3
	sllx	%l3,	%l0,	%l4
	popc	%i0,	%l1
	edge8	%o7,	%g5,	%g4
	fnot2	%f16,	%f30
	stb	%g2,	[%l7 + 0x20]
	lduw	[%l7 + 0x3C],	%g6
	umulcc	%o6,	%g3,	%o4
	srlx	%i2,	%g1,	%l5
	move	%icc,	%g7,	%o2
	ldx	[%l7 + 0x08],	%i7
	subccc	%i5,	0x051B,	%o5
	subccc	%o3,	0x1EF7,	%o1
	movre	%o0,	%l2,	%l6
	array16	%i1,	%i6,	%i3
	subc	%i4,	%l0,	%l3
	ldx	[%l7 + 0x40],	%l4
	edge16l	%i0,	%o7,	%l1
	xnorcc	%g4,	0x1ACF,	%g2
	fandnot2	%f24,	%f14,	%f4
	edge8n	%g6,	%g5,	%o6
	ldsh	[%l7 + 0x10],	%o4
	ld	[%l7 + 0x40],	%f11
	nop
	set	0x67, %l6
	stb	%g3,	[%l7 + %l6]
	movle	%icc,	%g1,	%i2
	sir	0x0230
	ldsw	[%l7 + 0x38],	%l5
	movrgez	%g7,	%o2,	%i7
	udiv	%o5,	0x1E86,	%o3
	ldsw	[%l7 + 0x6C],	%o1
	addc	%o0,	0x1770,	%i5
	bshuffle	%f16,	%f4,	%f28
	or	%l6,	0x1042,	%l2
	ldsb	[%l7 + 0x7E],	%i1
	fpackfix	%f16,	%f2
	ldub	[%l7 + 0x10],	%i3
	sub	%i4,	%i6,	%l0
	fcmpne32	%f0,	%f30,	%l3
	edge8n	%i0,	%l4,	%o7
	fmovdl	%xcc,	%f11,	%f24
	and	%l1,	%g2,	%g6
	lduw	[%l7 + 0x6C],	%g4
	st	%f12,	[%l7 + 0x40]
	fcmpne16	%f18,	%f20,	%o6
	movvc	%xcc,	%g5,	%o4
	movrlz	%g1,	%i2,	%l5
	fone	%f12
	fmovrdne	%g3,	%f8,	%f4
	xorcc	%o2,	%g7,	%o5
	movcs	%icc,	%i7,	%o1
	fsrc1s	%f9,	%f26
	orncc	%o0,	0x0562,	%i5
	stb	%l6,	[%l7 + 0x79]
	movcs	%xcc,	%l2,	%o3
	movneg	%icc,	%i3,	%i1
	edge16ln	%i6,	%i4,	%l3
	movleu	%icc,	%i0,	%l0
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l4
	fnot2s	%f2,	%f20
	setx loop_106, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_106: 	udiv	%g6,	0x1835,	%g4
	movcs	%xcc,	%g2,	%o6
	fmovdcs	%icc,	%f14,	%f23
	lduh	[%l7 + 0x58],	%o4
	edge32ln	%g1,	%i2,	%g5
	edge8	%g3,	%o2,	%g7
	sdivcc	%o5,	0x12AD,	%l5
	umul	%o1,	0x093C,	%i7
	movle	%icc,	%i5,	%o0
	edge32l	%l6,	%o3,	%i3
	std	%f28,	[%l7 + 0x38]
	fmovdvs	%xcc,	%f11,	%f22
	fone	%f24
	andncc	%i1,	%i6,	%i4
	fcmped	%fcc2,	%f4,	%f16
	fandnot2	%f2,	%f10,	%f8
	movrne	%l2,	0x3CE,	%l3
	fone	%f22
	edge32n	%i0,	%l4,	%l1
	save %l0, 0x141E, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	%g2,	%g4
	movneg	%xcc,	%o4,	%o6
	sllx	%i2,	0x14,	%g1
	fmovsge	%icc,	%f0,	%f31
	alignaddrl	%g3,	%g5,	%o2
	sethi	0x081C,	%g7
	movne	%icc,	%l5,	%o5
	addccc	%o1,	%i5,	%o0
	lduh	[%l7 + 0x38],	%i7
	ldx	[%l7 + 0x60],	%l6
	movpos	%xcc,	%o3,	%i1
	smulcc	%i3,	%i6,	%i4
	edge32	%l3,	%l2,	%l4
	movleu	%icc,	%i0,	%l1
	movne	%xcc,	%l0,	%o7
	fcmpgt16	%f8,	%f18,	%g2
	movpos	%icc,	%g6,	%o4
	movl	%icc,	%o6,	%g4
	movrgez	%g1,	0x2CF,	%i2
	umul	%g5,	%g3,	%o2
	sethi	0x1038,	%g7
	fmovdge	%xcc,	%f21,	%f7
	stb	%l5,	[%l7 + 0x6A]
	xnor	%o5,	0x1145,	%o1
	addccc	%o0,	%i5,	%i7
	movleu	%icc,	%l6,	%i1
	fandnot1s	%f13,	%f7,	%f8
	movcc	%xcc,	%i3,	%o3
	ldsw	[%l7 + 0x4C],	%i4
	andcc	%i6,	0x12DF,	%l2
	movne	%icc,	%l3,	%i0
	movrne	%l1,	0x278,	%l4
	ldsb	[%l7 + 0x7C],	%o7
	fcmpeq16	%f26,	%f28,	%l0
	stw	%g6,	[%l7 + 0x7C]
	fexpand	%f20,	%f22
	udivcc	%o4,	0x1514,	%g2
	stb	%g4,	[%l7 + 0x20]
	addccc	%o6,	0x05C3,	%g1
	movne	%xcc,	%g5,	%g3
	orncc	%i2,	%g7,	%o2
	movrne	%o5,	0x3FA,	%o1
	array32	%o0,	%l5,	%i5
	sll	%i7,	%l6,	%i1
	movre	%o3,	0x14B,	%i4
	movrgz	%i3,	%i6,	%l2
	subcc	%l3,	%i0,	%l1
	sir	0x0ED3
	array16	%o7,	%l0,	%l4
	st	%f10,	[%l7 + 0x48]
	lduh	[%l7 + 0x70],	%o4
	srax	%g2,	%g6,	%g4
	fpsub16	%f12,	%f6,	%f30
	orn	%o6,	%g1,	%g3
	restore %i2, %g5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g7,	[%l7 + 0x30]
	fabss	%f2,	%f16
	fmovsleu	%icc,	%f30,	%f29
	subccc	%o5,	0x0F55,	%o1
	fmovspos	%icc,	%f17,	%f28
	movvs	%xcc,	%o0,	%i5
	move	%icc,	%i7,	%l6
	fmovdcs	%xcc,	%f2,	%f25
	fmovsvc	%xcc,	%f24,	%f16
	edge8l	%l5,	%i1,	%i4
	smul	%o3,	0x13ED,	%i6
	smul	%l2,	%i3,	%i0
	save %l3, %l1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l4,	0x10B,	%o4
	sdivcc	%o7,	0x01B0,	%g6
	ldx	[%l7 + 0x20],	%g2
	orncc	%g4,	%o6,	%g1
	movge	%xcc,	%i2,	%g5
	sllx	%o2,	0x07,	%g3
	fmovrslez	%o5,	%f10,	%f28
	add	%g7,	%o0,	%o1
	edge32l	%i7,	%i5,	%l6
	fmul8x16al	%f31,	%f31,	%f18
	movleu	%icc,	%i1,	%i4
	xorcc	%o3,	0x1B50,	%i6
	lduh	[%l7 + 0x6A],	%l5
	ldsb	[%l7 + 0x7E],	%l2
	xorcc	%i3,	%i0,	%l1
	ldub	[%l7 + 0x43],	%l0
	udivx	%l4,	0x1E6F,	%l3
	array8	%o7,	%o4,	%g6
	or	%g4,	0x150B,	%g2
	mova	%icc,	%g1,	%o6
	addcc	%g5,	%o2,	%i2
	movleu	%icc,	%o5,	%g7
	movn	%xcc,	%g3,	%o0
	popc	0x14F3,	%i7
	orncc	%o1,	0x08FA,	%l6
	popc	0x1017,	%i5
	udiv	%i4,	0x1AC7,	%o3
	movrgz	%i6,	%l5,	%l2
	addccc	%i3,	0x0A4F,	%i1
	movcc	%xcc,	%l1,	%i0
	std	%f30,	[%l7 + 0x40]
	edge8ln	%l4,	%l3,	%o7
	alignaddrl	%o4,	%g6,	%g4
	fexpand	%f2,	%f22
	movvc	%icc,	%g2,	%g1
	ldub	[%l7 + 0x5F],	%o6
	ldx	[%l7 + 0x50],	%l0
	nop
	set	0x60, %l2
	std	%f28,	[%l7 + %l2]
	addcc	%o2,	0x06A2,	%g5
	fmovda	%xcc,	%f21,	%f15
	fmovse	%xcc,	%f8,	%f17
	nop
	set	0x4F, %i1
	stb	%o5,	[%l7 + %i1]
	popc	%i2,	%g3
	addc	%o0,	%i7,	%g7
	ldx	[%l7 + 0x70],	%l6
	lduh	[%l7 + 0x1E],	%i5
	fmuld8ulx16	%f23,	%f9,	%f16
	edge16n	%i4,	%o3,	%o1
	array32	%l5,	%i6,	%i3
	movneg	%icc,	%i1,	%l2
	fmovdcs	%icc,	%f14,	%f31
	for	%f26,	%f8,	%f28
	orn	%l1,	%l4,	%l3
	fexpand	%f27,	%f18
	fmovrde	%i0,	%f0,	%f16
	array8	%o4,	%o7,	%g4
	fornot2	%f12,	%f18,	%f24
	mulscc	%g6,	0x04AD,	%g2
	umulcc	%g1,	%o6,	%o2
	movge	%icc,	%g5,	%l0
	srax	%o5,	0x1A,	%g3
	fmovrsgez	%i2,	%f13,	%f30
	sllx	%o0,	0x1F,	%i7
	udivx	%l6,	0x1231,	%i5
	fpadd32	%f6,	%f16,	%f4
	xnor	%g7,	%i4,	%o1
	fnors	%f28,	%f23,	%f23
	orncc	%l5,	0x025D,	%i6
	movg	%icc,	%o3,	%i1
	fsrc2	%f4,	%f10
	fpmerge	%f11,	%f6,	%f2
	orcc	%i3,	%l1,	%l2
	srlx	%l4,	0x1B,	%i0
	movgu	%icc,	%l3,	%o7
	movgu	%xcc,	%o4,	%g6
	edge32ln	%g4,	%g2,	%o6
	movgu	%icc,	%g1,	%g5
	fmovsvc	%icc,	%f10,	%f3
	fmovscc	%xcc,	%f10,	%f8
	movn	%icc,	%l0,	%o2
	stx	%o5,	[%l7 + 0x30]
	array16	%i2,	%o0,	%i7
	xor	%g3,	0x03C1,	%l6
	array16	%i5,	%i4,	%g7
	fpadd32	%f0,	%f14,	%f28
	orncc	%o1,	0x0432,	%l5
	fmovspos	%icc,	%f22,	%f16
	movl	%xcc,	%i6,	%i1
	edge16n	%i3,	%o3,	%l1
	add	%l2,	0x1C9A,	%l4
	movl	%xcc,	%l3,	%o7
	edge32n	%i0,	%g6,	%o4
	sir	0x10AB
	ld	[%l7 + 0x14],	%f10
	sllx	%g2,	%o6,	%g1
	edge16n	%g5,	%l0,	%g4
	sir	0x0E99
	movl	%icc,	%o5,	%o2
	movneg	%icc,	%o0,	%i2
	edge8l	%i7,	%g3,	%i5
	sll	%l6,	%g7,	%i4
	nop
	set	0x52, %o7
	lduh	[%l7 + %o7],	%l5
	edge32n	%o1,	%i6,	%i1
	addcc	%i3,	0x0FAB,	%o3
	sdivcc	%l1,	0x04EB,	%l4
	edge32l	%l3,	%o7,	%i0
	movge	%xcc,	%l2,	%g6
	movrlz	%o4,	%g2,	%o6
	array32	%g1,	%g5,	%l0
	xnorcc	%o5,	0x002F,	%g4
	umul	%o2,	%o0,	%i7
	xnor	%i2,	%i5,	%l6
	fmovspos	%icc,	%f4,	%f0
	ldsb	[%l7 + 0x18],	%g7
	movne	%xcc,	%i4,	%g3
	movg	%icc,	%l5,	%i6
	mulscc	%i1,	%o1,	%o3
	andncc	%l1,	%i3,	%l4
	ldsh	[%l7 + 0x34],	%l3
	sra	%i0,	0x07,	%o7
	fmovdleu	%icc,	%f4,	%f7
	fone	%f30
	edge8n	%l2,	%o4,	%g2
	edge8	%g6,	%g1,	%o6
	movn	%xcc,	%g5,	%l0
	sethi	0x1F69,	%o5
	fcmped	%fcc0,	%f6,	%f10
	sdivcc	%g4,	0x12F5,	%o2
	fmovrsgez	%i7,	%f8,	%f13
	alignaddrl	%i2,	%o0,	%l6
	fmovsg	%icc,	%f5,	%f21
	save %g7, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i4,	0x269,	%i6
	movge	%xcc,	%i1,	%l5
	mulscc	%o1,	%o3,	%l1
	sdiv	%i3,	0x1B17,	%l4
	movrne	%l3,	0x110,	%o7
	fcmpgt32	%f24,	%f26,	%l2
	sll	%o4,	%g2,	%i0
	ldsh	[%l7 + 0x10],	%g6
	lduw	[%l7 + 0x6C],	%o6
	setx loop_107, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_107: 	restore %g1, 0x1D9C, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o2,	0x36D,	%o5
	lduh	[%l7 + 0x50],	%i7
	edge8n	%i2,	%o0,	%l6
	movne	%icc,	%i5,	%g7
	edge16n	%i4,	%g3,	%i1
	edge8l	%i6,	%l5,	%o1
	and	%l1,	%i3,	%l4
	udivx	%o3,	0x1BA3,	%l3
	mulx	%l2,	0x1B8A,	%o7
	fcmple16	%f2,	%f16,	%g2
	sll	%o4,	0x1D,	%i0
	stx	%o6,	[%l7 + 0x28]
	mulscc	%g5,	%g6,	%l0
	fmovdn	%icc,	%f21,	%f4
	edge16	%g1,	%g4,	%o2
	lduw	[%l7 + 0x18],	%i7
	movg	%icc,	%o5,	%o0
	smulcc	%i2,	0x0A10,	%i5
	smul	%g7,	%l6,	%g3
	ldsb	[%l7 + 0x1F],	%i4
	fpack32	%f16,	%f24,	%f26
	orncc	%i6,	0x1B5B,	%l5
	smulcc	%o1,	%l1,	%i3
	xnor	%l4,	0x162E,	%i1
	sdiv	%o3,	0x1B40,	%l3
	st	%f18,	[%l7 + 0x74]
	srl	%o7,	0x1E,	%g2
	orcc	%o4,	%i0,	%o6
	movrgz	%g5,	0x160,	%g6
	popc	0x0DD3,	%l2
	alignaddr	%g1,	%g4,	%o2
	fnot2	%f4,	%f28
	siam	0x7
	fornot1s	%f0,	%f21,	%f23
	srlx	%l0,	%o5,	%i7
	xnor	%i2,	%i5,	%g7
	fnot2	%f4,	%f6
	sir	0x1473
	fexpand	%f7,	%f24
	movg	%icc,	%o0,	%g3
	edge16	%l6,	%i6,	%l5
	and	%i4,	%o1,	%i3
	fmovsl	%icc,	%f3,	%f30
	movrgz	%l1,	%i1,	%l4
	fmovsne	%icc,	%f16,	%f19
	ldd	[%l7 + 0x38],	%l2
	alignaddr	%o3,	%g2,	%o7
	fmovdl	%icc,	%f11,	%f3
	xor	%o4,	0x0285,	%o6
	subcc	%i0,	0x0A47,	%g5
	ldd	[%l7 + 0x10],	%f22
	st	%f9,	[%l7 + 0x3C]
	fornot1s	%f11,	%f26,	%f4
	faligndata	%f2,	%f18,	%f20
	sir	0x02E7
	sethi	0x03D5,	%g6
	srlx	%g1,	%l2,	%o2
	fmovdne	%icc,	%f14,	%f1
	nop
	set	0x10, %l1
	std	%f8,	[%l7 + %l1]
	ldd	[%l7 + 0x60],	%f20
	smulcc	%l0,	0x1F95,	%g4
	movrne	%o5,	0x063,	%i2
	movre	%i7,	%i5,	%g7
	move	%icc,	%o0,	%l6
	edge8ln	%g3,	%i6,	%i4
	fnors	%f29,	%f11,	%f8
	fxor	%f28,	%f12,	%f18
	fnand	%f4,	%f0,	%f18
	fmovdcc	%icc,	%f31,	%f30
	sdiv	%l5,	0x0683,	%i3
	xor	%o1,	0x0CA9,	%l1
	popc	%i1,	%l3
	fmovse	%xcc,	%f2,	%f22
	andcc	%l4,	0x19DC,	%o3
	udivx	%o7,	0x19BC,	%g2
	umul	%o6,	%i0,	%g5
	fmovse	%icc,	%f4,	%f29
	fcmpne32	%f30,	%f18,	%g6
	pdist	%f24,	%f30,	%f22
	andncc	%o4,	%l2,	%g1
	orcc	%o2,	0x08C0,	%g4
	array16	%l0,	%o5,	%i7
	orncc	%i5,	0x05F1,	%g7
	array8	%i2,	%o0,	%g3
	edge32ln	%l6,	%i6,	%i4
	movneg	%xcc,	%i3,	%o1
	fmovsle	%xcc,	%f8,	%f14
	movleu	%icc,	%l5,	%l1
	xnorcc	%l3,	%i1,	%o3
	srl	%l4,	0x1A,	%o7
	ldd	[%l7 + 0x40],	%o6
	udivcc	%i0,	0x00D9,	%g2
	mulx	%g5,	0x172D,	%g6
	xorcc	%o4,	%l2,	%g1
	movl	%icc,	%g4,	%l0
	xor	%o2,	%i7,	%i5
	smul	%o5,	%i2,	%g7
	edge8	%o0,	%g3,	%i6
	fmovdneg	%icc,	%f9,	%f14
	addc	%l6,	%i3,	%o1
	fmovsne	%xcc,	%f21,	%f7
	sdivx	%l5,	0x1259,	%i4
	subcc	%l1,	%i1,	%l3
	setx loop_108, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_108: 	andncc	%o6,	%o7,	%g2
	edge16ln	%g5,	%g6,	%o4
	andn	%i0,	0x0859,	%g1
	fornot1s	%f21,	%f6,	%f31
	nop
	set	0x75, %l5
	stb	%g4,	[%l7 + %l5]
	xorcc	%l2,	%o2,	%i7
	edge16l	%i5,	%l0,	%i2
	srl	%g7,	%o5,	%g3
	movg	%xcc,	%i6,	%o0
	movre	%i3,	%o1,	%l6
	andn	%i4,	%l1,	%l5
	and	%l3,	0x19CE,	%i1
	lduh	[%l7 + 0x7E],	%l4
	smul	%o3,	0x0B6D,	%o6
	std	%f28,	[%l7 + 0x78]
	srax	%o7,	%g5,	%g2
	xorcc	%o4,	%i0,	%g1
	edge16ln	%g6,	%l2,	%g4
	udivcc	%i7,	0x013F,	%i5
	fpsub32	%f20,	%f24,	%f30
	subcc	%o2,	%i2,	%g7
	fmovdcs	%icc,	%f17,	%f20
	stb	%l0,	[%l7 + 0x3B]
	alignaddrl	%g3,	%i6,	%o0
	edge32l	%i3,	%o5,	%l6
	fmovdvs	%icc,	%f1,	%f21
	movre	%i4,	%l1,	%l5
	array8	%l3,	%o1,	%l4
	mulscc	%i1,	0x047D,	%o3
	xnorcc	%o6,	0x1A23,	%g5
	fmovdvs	%xcc,	%f5,	%f17
	fmul8x16au	%f15,	%f25,	%f8
	udivcc	%o7,	0x1955,	%o4
	fxors	%f15,	%f17,	%f10
	edge32	%g2,	%g1,	%i0
	ldub	[%l7 + 0x77],	%l2
	save %g6, %g4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i5,	%o2,	%i2
	movneg	%icc,	%g7,	%l0
	sub	%i6,	0x175F,	%o0
	array32	%i3,	%o5,	%l6
	sth	%i4,	[%l7 + 0x64]
	xnor	%g3,	0x0060,	%l5
	sub	%l3,	0x0D4E,	%o1
	for	%f14,	%f8,	%f0
	movre	%l4,	%i1,	%o3
	xnor	%l1,	0x1D11,	%o6
	fcmped	%fcc2,	%f0,	%f26
	mulx	%g5,	%o4,	%o7
	movrlez	%g2,	0x25E,	%i0
	ld	[%l7 + 0x08],	%f10
	movpos	%icc,	%l2,	%g1
	movpos	%xcc,	%g6,	%i7
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%i5
	mulscc	%g4,	0x06DE,	%o2
	sdiv	%g7,	0x13EC,	%l0
	movneg	%icc,	%i6,	%o0
	save %i2, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x2E],	%i4
	fmovsle	%icc,	%f2,	%f0
	add	%l6,	%g3,	%l3
	movvs	%xcc,	%o1,	%l4
	fpack32	%f4,	%f10,	%f30
	fpsub32s	%f11,	%f30,	%f18
	smul	%i1,	0x1601,	%l5
	ldsw	[%l7 + 0x68],	%o3
	subcc	%l1,	0x0801,	%g5
	sll	%o6,	0x17,	%o7
	umul	%g2,	0x19C6,	%i0
	edge16n	%o4,	%l2,	%g1
	xorcc	%i7,	0x02FF,	%g6
	movge	%icc,	%i5,	%o2
	fornot1	%f2,	%f2,	%f4
	edge16ln	%g7,	%g4,	%l0
	movpos	%icc,	%i6,	%o0
	xnorcc	%o5,	0x1055,	%i2
	movrlez	%i3,	%l6,	%g3
	movrgez	%i4,	0x046,	%l3
	fcmpeq32	%f12,	%f26,	%o1
	orncc	%i1,	0x172F,	%l4
	subc	%o3,	0x08A1,	%l5
	xor	%g5,	%l1,	%o6
	andncc	%o7,	%i0,	%o4
	xnorcc	%g2,	%l2,	%g1
	srax	%g6,	%i7,	%i5
	movcs	%xcc,	%g7,	%o2
	fmul8ulx16	%f8,	%f20,	%f16
	ldsb	[%l7 + 0x22],	%g4
	ldd	[%l7 + 0x20],	%i6
	fmovdn	%xcc,	%f21,	%f14
	fcmpgt16	%f18,	%f10,	%l0
	ld	[%l7 + 0x20],	%f28
	sllx	%o0,	0x0B,	%i2
	edge32	%i3,	%l6,	%o5
	fmul8x16au	%f18,	%f3,	%f18
	fones	%f19
	sra	%g3,	%l3,	%i4
	nop
	set	0x44, %o6
	ldsw	[%l7 + %o6],	%o1
	edge32l	%i1,	%l4,	%l5
	sethi	0x051E,	%g5
	ldsh	[%l7 + 0x7E],	%o3
	array16	%o6,	%o7,	%i0
	movre	%l1,	0x3D4,	%g2
	fmovsne	%xcc,	%f16,	%f12
	sth	%l2,	[%l7 + 0x74]
	ldd	[%l7 + 0x30],	%f28
	fmovsge	%icc,	%f30,	%f14
	udivx	%o4,	0x0BFF,	%g6
	movrne	%g1,	%i7,	%i5
	edge16n	%g7,	%o2,	%g4
	xnorcc	%i6,	%o0,	%i2
	srl	%i3,	0x05,	%l0
	orncc	%l6,	%g3,	%o5
	fmul8x16au	%f21,	%f11,	%f18
	ld	[%l7 + 0x10],	%f16
	subccc	%i4,	%l3,	%i1
	movvs	%xcc,	%l4,	%o1
	fmul8sux16	%f14,	%f26,	%f6
	st	%f13,	[%l7 + 0x3C]
	edge32	%l5,	%g5,	%o6
	ldsh	[%l7 + 0x34],	%o3
	movvs	%icc,	%i0,	%l1
	movrgez	%g2,	0x0EE,	%l2
	ldub	[%l7 + 0x28],	%o7
	edge8n	%g6,	%o4,	%g1
	addccc	%i7,	0x103B,	%g7
	addc	%i5,	%g4,	%o2
	sdivx	%o0,	0x120E,	%i2
	ldub	[%l7 + 0x18],	%i3
	fmul8x16	%f18,	%f26,	%f28
	umul	%i6,	0x0B34,	%l0
	edge8l	%g3,	%l6,	%o5
	fpsub32s	%f14,	%f13,	%f4
	xnor	%l3,	%i1,	%l4
	edge8	%o1,	%l5,	%i4
	restore %g5, 0x1C83, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o6,	%l1,	%g2
	srax	%l2,	%i0,	%o7
	sdiv	%o4,	0x0CC9,	%g6
	sll	%g1,	%i7,	%g7
	fmovde	%icc,	%f6,	%f30
	subcc	%i5,	0x1AA7,	%g4
	ldd	[%l7 + 0x10],	%f4
	edge32n	%o2,	%o0,	%i2
	st	%f21,	[%l7 + 0x20]
	andncc	%i6,	%i3,	%g3
	subc	%l0,	0x1D44,	%o5
	fnot2s	%f15,	%f11
	edge16n	%l3,	%i1,	%l4
	movg	%xcc,	%l6,	%l5
	sdivx	%o1,	0x1215,	%i4
	movvc	%xcc,	%g5,	%o3
	movl	%xcc,	%l1,	%g2
	edge16n	%l2,	%o6,	%o7
	srl	%i0,	%g6,	%o4
	edge16	%i7,	%g1,	%g7
	mulx	%g4,	0x0F23,	%o2
	fmul8ulx16	%f6,	%f28,	%f14
	movrgez	%o0,	0x3D7,	%i2
	fands	%f7,	%f12,	%f21
	std	%f26,	[%l7 + 0x68]
	smulcc	%i6,	0x0AC0,	%i5
	edge32l	%i3,	%g3,	%l0
	array16	%l3,	%o5,	%i1
	or	%l4,	0x0217,	%l6
	movrlez	%o1,	0x1A2,	%i4
	ld	[%l7 + 0x7C],	%f17
	fmovrsgz	%l5,	%f18,	%f17
	umul	%o3,	0x1758,	%l1
	srlx	%g2,	%g5,	%l2
	for	%f14,	%f26,	%f2
	fandnot1s	%f21,	%f11,	%f28
	ldd	[%l7 + 0x40],	%o6
	ldsw	[%l7 + 0x14],	%o7
	stx	%i0,	[%l7 + 0x40]
	sdivcc	%g6,	0x140B,	%i7
	fone	%f16
	sth	%g1,	[%l7 + 0x2C]
	or	%o4,	%g7,	%g4
	array32	%o2,	%i2,	%i6
	edge16l	%o0,	%i5,	%g3
	andcc	%l0,	%l3,	%i3
	movrlez	%o5,	0x1F2,	%l4
	array8	%l6,	%o1,	%i4
	fandnot1	%f8,	%f28,	%f20
	popc	%i1,	%l5
	edge8n	%l1,	%g2,	%g5
	orcc	%o3,	0x1413,	%l2
	srl	%o7,	%i0,	%g6
	ldsh	[%l7 + 0x10],	%o6
	edge16n	%i7,	%g1,	%o4
	edge16ln	%g4,	%o2,	%i2
	udivcc	%g7,	0x0692,	%o0
	movpos	%icc,	%i5,	%i6
	orn	%g3,	0x0272,	%l3
	fcmple16	%f14,	%f20,	%i3
	srl	%l0,	0x08,	%l4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3605
!	Type f   	: 5377
!	Type i   	: 16018
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xA0955103
.word 0xFE201F40
.word 0x372A61D3
.word 0x8080FA58
.word 0x39D90EE8
.word 0xBA8BFF0C
.word 0x609CB9B0
.word 0x38104EDE
.word 0x35DB545A
.word 0xFC9DEF85
.word 0x0CA7AFEE
.word 0x5AE56C41
.word 0x210F0A92
.word 0x1DE32108
.word 0x307E0CB3
.word 0xBF5B591E
.word 0x400C3513
.word 0x62801787
.word 0x47E68203
.word 0xAE75CF37
.word 0xD854E20F
.word 0xA8A6B25C
.word 0x39D069BF
.word 0x345D49D6
.word 0x12F808C0
.word 0x43EE5816
.word 0x08EE4B2B
.word 0xB9247098
.word 0x0F5A1245
.word 0x93A9E3B1
.word 0x27100C8D
.word 0x202CDAD2
.word 0xAD1B7740
.word 0x802A473D
.word 0xEC982840
.word 0x0D5894D1
.word 0x1C48520B
.word 0xC15D7E21
.word 0x9FE7FB1A
.word 0x7CDCC5BC
.word 0x6AF2E22D
.word 0x2B001BD0
.word 0x6279299C
.word 0xCD75369E
.word 0xD487BBC9
.word 0xAF42348E
.word 0xDDB45F19
.word 0x79C86B0E
.word 0x4B884B52
.word 0xF8A9B6E7
.word 0x5F5B5924
.word 0x94624E14
.word 0x8DFE1E81
.word 0x776DB1BF
.word 0x50AAAFFA
.word 0x46683930
.word 0x89BB4424
.word 0x3E3D0C64
.word 0x427F5557
.word 0xFCD71752
.word 0x1D5668D2
.word 0xB50C7986
.word 0xB73BEC80
.word 0x0DA597A9
.end
