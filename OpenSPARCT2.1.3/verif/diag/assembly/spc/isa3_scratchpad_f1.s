/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_scratchpad_f1.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../spc_basic_isa3.pl FOCUS_SEED=700443501"
.ident "BY gg137162 ON Thu Sep  4 15:38:44 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_scratchpad_f1.s,v 1.3 2007/07/05 22:01:57 drp Exp $"
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
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x1,	%g2
	set	0x9,	%g3
	set	0x3,	%g4
	set	0x9,	%g5
	set	0xE,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xC,	%i1
	set	-0x0,	%i2
	set	-0x5,	%i3
	set	-0xD,	%i4
	set	-0x0,	%i5
	set	-0x3,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x19CDCDEB,	%l0
	set	0x1BD39F60,	%l1
	set	0x30641820,	%l2
	set	0x45E2B01C,	%l3
	set	0x2890EB06,	%l4
	set	0x24A86C33,	%l5
	set	0x295E64C8,	%l6
	!# Output registers
	set	-0x1866,	%o0
	set	0x0A23,	%o1
	set	0x0931,	%o2
	set	0x0B02,	%o3
	set	-0x0567,	%o4
	set	0x0FE2,	%o5
	set	0x1687,	%o6
	set	0x1BF0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEE729784E37FF57C)
	INIT_TH_FP_REG(%l7,%f2,0x247F053EB479D3BD)
	INIT_TH_FP_REG(%l7,%f4,0x50573ED52B4BB1D6)
	INIT_TH_FP_REG(%l7,%f6,0x6DD185822D368CF5)
	INIT_TH_FP_REG(%l7,%f8,0x09FF7269794923D8)
	INIT_TH_FP_REG(%l7,%f10,0x2479BE9EBCBDCC7D)
	INIT_TH_FP_REG(%l7,%f12,0xB18EDB3508026288)
	INIT_TH_FP_REG(%l7,%f14,0xA9D232840776A078)
	INIT_TH_FP_REG(%l7,%f16,0x7A34FFA547D4A698)
	INIT_TH_FP_REG(%l7,%f18,0xFCA532D9677ABD7D)
	INIT_TH_FP_REG(%l7,%f20,0x16191C35FBA2D2A4)
	INIT_TH_FP_REG(%l7,%f22,0xE508F399E62A5C5F)
	INIT_TH_FP_REG(%l7,%f24,0x482D63D8029A975D)
	INIT_TH_FP_REG(%l7,%f26,0xF83DB1AE11C08473)
	INIT_TH_FP_REG(%l7,%f28,0xC61CC31C51733815)
	INIT_TH_FP_REG(%l7,%f30,0x7393BF324AE42540)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC74, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	ldub	[%l7 + 0x5B],	%o0
	ldx	[%l7 + 0x40],	%i7
	ldx	[%l7 + 0x08],	%i3
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f16
	flush	%l7 + 0x54
	stx	%i2,	[%l7 + 0x20]
	nop
	setx loop_1, %l0, %l1
	jmpl %l1, %l0
	stx	%g7,	[%l7 + 0x50]
	ldsh	[%l7 + 0x12],	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %o5
	stxa	%o7,	[%g0 + %o5] 0x4f
loop_1:
	prefetch	[%l7 + 0x24],	 0x0
	tsubcc	%l1,	%g3,	%o5
	sth	%l5,	[%l7 + 0x4A]
	ld	[%l7 + 0x78],	%f25
	prefetch	[%l7 + 0x5C],	 0x0
	stb	%l6,	[%l7 + 0x54]
	stbar
	edge32n	%o4,	%g5,	%i5
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%l4
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f12
	prefetch	[%l7 + 0x70],	 0x1
	ldsh	[%l7 + 0x3C],	%i0
	flush	%l7 + 0x74
	nop
	set	0x35, %i4
	ldstub	[%l7 + %i4],	%g4
	lduh	[%l7 + 0x3C],	%i6
	lduh	[%l7 + 0x7A],	%i1
	ldstub	[%l7 + 0x55],	%g6
	ldsw	[%l7 + 0x40],	%o6
	stx	%l2,	[%l7 + 0x70]
	andn	%l3,	%g2,	%o1
	ldstub	[%l7 + 0x2A],	%g1
	flush	%l7 + 0x08
	nop
	set	0x6B, %o0
	ldsb	[%l7 + %o0],	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x18] %asi
	flush	%l7 + 0x3C
	stx	%i7,	[%l7 + 0x30]
	sdivcc	%i3,	0x1770,	%i2
	ldsh	[%l7 + 0x6A],	%l0
	alignaddr	%o2,	%i4,	%o7
	stb	%g7,	[%l7 + 0x54]
	nop
	set	0x47, %i0
	ldstub	[%l7 + %i0],	%l1
	ldub	[%l7 + 0x35],	%g3
	flush	%l7 + 0x30
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f8
	lduw	[%l7 + 0x2C],	%l5
	std	%o4,	[%l7 + 0x08]
	swap	[%l7 + 0x24],	%o4
	fmul8x16au	%f1,	%f30,	%f4
	std	%g4,	[%l7 + 0x48]
	ldstub	[%l7 + 0x44],	%i5
	swap	[%l7 + 0x54],	%l4
	ld	[%l7 + 0x6C],	%f20
	ldsh	[%l7 + 0x18],	%l6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g4
	fornot2s	%f30,	%f11,	%f4
	sth	%i6,	[%l7 + 0x16]
	ldstub	[%l7 + 0x56],	%i1
	ldstub	[%l7 + 0x75],	%i0
	stb	%g6,	[%l7 + 0x27]
	sth	%l2,	[%l7 + 0x64]
	stb	%l3,	[%l7 + 0x3C]
	ldsw	[%l7 + 0x5C],	%o6
	ldub	[%l7 + 0x43],	%o1
	ld	[%l7 + 0x4C],	%f7
	nop
	set	0x68, %g4
	std	%f8,	[%l7 + %g4]
	fmovsl	%xcc,	%f10,	%f20
	stb	%g2,	[%l7 + 0x12]
	wrpr	%g1,	0x1F5F,	%cwp
	swap	[%l7 + 0x68],	%o3
	lduw	[%l7 + 0x6C],	%i7
	movneg	%xcc,	%i3,	%o0
	popc	0x045D,	%l0
	ldd	[%l7 + 0x30],	%f26
	lduh	[%l7 + 0x5C],	%i2
	fcmpd	%fcc0,	%f30,	%f30
	udiv	%o2,	0x16EE,	%o7
	ldd	[%l7 + 0x10],	%f6
	ld	[%l7 + 0x48],	%f28
	ldsb	[%l7 + 0x38],	%g7
	fmovsgu	%xcc,	%f10,	%f12
	sra	%l1,	0x13,	%i4
	std	%l4,	[%l7 + 0x18]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x569, 	%hsys_tick_cmpr
	ldd	[%l7 + 0x48],	%o4
	ldd	[%l7 + 0x78],	%f28
	udivcc	%g3,	0x0354,	%i5
	ld	[%l7 + 0x3C],	%f15
	prefetch	[%l7 + 0x28],	 0x2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tvs	%icc,	0x1
	swap	[%l7 + 0x4C],	%g5
	ldstub	[%l7 + 0x5C],	%g4
	prefetch	[%l7 + 0x34],	 0x3
	stx	%i6,	[%l7 + 0x60]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %l5
	ldxa	[%g0 + %l5] 0x4f,	%i1
	ldsb	[%l7 + 0x39],	%g6
	flush	%l7 + 0x20
	stb	%l2,	[%l7 + 0x22]
	bcc,a,pt	%xcc,	loop_2
	stx	%i0,	[%l7 + 0x50]
	stw	%o6,	[%l7 + 0x20]
	brgez	%o1,	loop_3
loop_2:
	edge8n	%g2,	%g1,	%o3
	sdivx	%i7,	0x1AAD,	%i3
	nop
	set	0x2C, %l6
	ldsw	[%l7 + %l6],	%o0
loop_3:
	ldx	[%l7 + 0x38],	%l3
	std	%f14,	[%l7 + 0x10]
	sll	%l0,	%i2,	%o7
	st	%f17,	[%l7 + 0x4C]
	ldd	[%l7 + 0x48],	%o2
	edge32n	%g7,	%i4,	%l5
	movcc	%icc,	%o5,	%o4
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %o2
	stxa	%l1,	[%g0 + %o2] 0x20
	rd	%sys_tick_cmpr,	%i5
	stb	%g3,	[%l7 + 0x12]
	stx	%l4,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	stw	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%g5
	ld	[%l7 + 0x24],	%f24
	prefetch	[%l7 + 0x40],	 0x3
	ldsw	[%l7 + 0x60],	%g4
	prefetch	[%l7 + 0x14],	 0x0
	ldstub	[%l7 + 0x39],	%i1
	flush	%l7 + 0x38
	ldd	[%l7 + 0x70],	%g6
	fble,a	%fcc3,	loop_4
	ldsb	[%l7 + 0x5C],	%i6
	swap	[%l7 + 0x78],	%l2
	movvc	%icc,	%o6,	%i0
loop_4:
	ldsh	[%l7 + 0x78],	%g2
	nop
	set	0x34, %g1
	stw	%g1,	[%l7 + %g1]
	edge8	%o3,	%i7,	%o1
	orcc	%o0,	0x0B89,	%l3
	ldub	[%l7 + 0x33],	%l0
	nop
	set	0x68, %g3
	stb	%i2,	[%l7 + %g3]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o7
	ldub	[%l7 + 0x0F],	%i3
	ld	[%l7 + 0x70],	%f17
	flush	%l7 + 0x08
	wr	%o2,	0x11D8,	%pcr
	stb	%i4,	[%l7 + 0x25]
	tvs	%xcc,	0x4
	lduw	[%l7 + 0x34],	%l5
	ldub	[%l7 + 0x3F],	%g7
	st	%f15,	[%l7 + 0x10]
	lduw	[%l7 + 0x0C],	%o5
	edge8	%l1,	%i5,	%g3
	swap	[%l7 + 0x20],	%l4
	ldsh	[%l7 + 0x70],	%o4
	std	%g4,	[%l7 + 0x38]
	st	%f25,	[%l7 + 0x0C]
	stb	%l6,	[%l7 + 0x1A]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g4
	mulx	%g6,	%i6,	%i1
	stw	%o6,	[%l7 + 0x08]
	ldsb	[%l7 + 0x1E],	%l2
	sth	%i0,	[%l7 + 0x3C]
	ta	%xcc,	0x6
	tge	%xcc,	0x3
	edge32n	%g2,	%g1,	%i7
	ldstub	[%l7 + 0x65],	%o3
	ldx	[%l7 + 0x58],	%o0
	ldx	[%l7 + 0x50],	%l3
	lduh	[%l7 + 0x78],	%o1
	ldub	[%l7 + 0x46],	%i2
	st	%f4,	[%l7 + 0x6C]
	stbar
	ldstub	[%l7 + 0x69],	%l0
	ldx	[%l7 + 0x50],	%o7
	ldsw	[%l7 + 0x14],	%i3
	ldub	[%l7 + 0x28],	%i4
	nop
	set	0x28, %o6
	stx	%o2,	[%l7 + %o6]
	stw	%g7,	[%l7 + 0x14]
	move	%xcc,	%o5,	%l5
	swap	[%l7 + 0x74],	%l1
	stw	%g3,	[%l7 + 0x2C]
	ld	[%l7 + 0x68],	%f13
	srlx	%l4,	%i5,	%o4
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x60],	%g4
	movvs	%icc,	%g6,	%g5
	mova	%icc,	%i1,	%i6
	stbar
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f24
	lduh	[%l7 + 0x5E],	%o6
	ldstub	[%l7 + 0x7B],	%l2
	stw	%i0,	[%l7 + 0x24]
	ldub	[%l7 + 0x36],	%g1
	nop
	set	0x58, %l1
	ldstub	[%l7 + %l1],	%g2
	ld	[%l7 + 0x44],	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x763, 	%tick_cmpr
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g6
	stxa	%l3,	[%g0 + %g6] 0x4f
	nop
	set	0x59, %g7
	ldsb	[%l7 + %g7],	%o1
	fors	%f1,	%f20,	%f26
	ldsb	[%l7 + 0x32],	%i7
	stw	%l0,	[%l7 + 0x4C]
	stx	%o7,	[%l7 + 0x08]
	lduh	[%l7 + 0x10],	%i2
	nop
	set	0x76, %l2
	stb	%i3,	[%l7 + %l2]
	fbe,a	%fcc3,	loop_5
	ldd	[%l7 + 0x70],	%f18
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %l0
	stxa	%i4,	[%g0 + %l0] 0x4f
loop_5:
	rd	%ccr,	%g7
	srlx	%o5,	0x00,	%o2
	orncc	%l1,	0x1D4F,	%l5
	std	%l4,	[%l7 + 0x60]
	popc	0x11D5,	%i5
	fandnot1s	%f22,	%f8,	%f29
	ldsb	[%l7 + 0x4B],	%g3
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f4
	ldsw	[%l7 + 0x30],	%o4
	movneg	%xcc,	%g4,	%l6
	rd	%tick_cmpr,	%g5
	st	%f5,	[%l7 + 0x48]
	prefetch	[%l7 + 0x28],	 0x0
	swap	[%l7 + 0x3C],	%g6
	bneg,a,pn	%xcc,	loop_6
	sir	0x1DF8
	stb	%i6,	[%l7 + 0x49]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6:
	fsrc2	%f22,	%f28
	fandnot2	%f24,	%f16,	%f20
	stw	%o6,	[%l7 + 0x28]
	fandnot2	%f6,	%f8,	%f22
	ld	[%l7 + 0x40],	%f8
	stbar
	std	%i0,	[%l7 + 0x38]
	nop
	set	0x28, %o1
	std	%l2,	[%l7 + %o1]
	array16	%g1,	%g2,	%i0
	std	%f30,	[%l7 + 0x08]
	fmovrsgez	%o3,	%f27,	%f29
	std	%o0,	[%l7 + 0x70]
	ldsw	[%l7 + 0x48],	%o1
	rdpr	%tl,	%i7
	stb	%l0,	[%l7 + 0x36]
	std	%f26,	[%l7 + 0x48]
	ldsw	[%l7 + 0x18],	%l3
	ldstub	[%l7 + 0x61],	%o7
	ldx	[%l7 + 0x60],	%i3
	stb	%i4,	[%l7 + 0x7F]
	st	%f29,	[%l7 + 0x14]
	movl	%icc,	%i2,	%g7
	ldsh	[%l7 + 0x6A],	%o5
	stx	%o2,	[%l7 + 0x30]
	prefetch	[%l7 + 0x24],	 0x2
	nop
	set	0x18, %i1
	std	%f26,	[%l7 + %i1]
	stb	%l5,	[%l7 + 0x31]
	stb	%l4,	[%l7 + 0x28]
	stw	%i5,	[%l7 + 0x6C]
	fmovscc	%xcc,	%f25,	%f11
	swap	[%l7 + 0x70],	%g3
	nop
	set	0x34, %l3
	lduh	[%l7 + %l3],	%l1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%g4,	[%g0 + 0x8] %asi
	prefetch	[%l7 + 0x10],	 0x0
	prefetch	[%l7 + 0x0C],	 0x1
	sth	%l6,	[%l7 + 0x3E]
	fnot1s	%f24,	%f26
	fmovdcs	%xcc,	%f6,	%f29
	st	%f12,	[%l7 + 0x10]
	stw	%g5,	[%l7 + 0x50]
	ldstub	[%l7 + 0x17],	%o4
	edge16l	%g6,	%i6,	%o6
	std	%f0,	[%l7 + 0x08]
	stbar
	fbge	%fcc1,	loop_7
	ld	[%l7 + 0x58],	%f16
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i1
loop_7:
	bg,pn	%xcc,	loop_8
	flush	%l7 + 0x34
	edge32l	%g1,	%l2,	%g2
	ld	[%l7 + 0x54],	%f2
loop_8:
	ldsh	[%l7 + 0x3E],	%o3
	nop
	set	0x1C, %o3
	prefetch	[%l7 + %o3],	 0x3
	sth	%o0,	[%l7 + 0x28]
	lduw	[%l7 + 0x30],	%o1
	array16	%i7,	%l0,	%i0
	fbue,a	%fcc0,	loop_9
	lduw	[%l7 + 0x78],	%o7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%i3,	[%g0 + 0x10] %asi
loop_9:
	ldsh	[%l7 + 0x5E],	%l3
	nop
	set	0x58, %i5
	std	%i4,	[%l7 + %i5]
	ldub	[%l7 + 0x23],	%i2
	ldsb	[%l7 + 0x72],	%o5
	fmul8ulx16	%f0,	%f14,	%f6
	prefetch	[%l7 + 0x74],	 0x3
	sth	%o2,	[%l7 + 0x6C]
	ldub	[%l7 + 0x55],	%g7
	st	%f24,	[%l7 + 0x18]
	nop
	set	0x7C, %i3
	lduw	[%l7 + %i3],	%l4
	st	%f23,	[%l7 + 0x70]
	std	%l4,	[%l7 + 0x68]
	ldsb	[%l7 + 0x22],	%i5
	stbar
	fmovdvc	%xcc,	%f2,	%f10
	ldub	[%l7 + 0x1C],	%g3
	prefetch	[%l7 + 0x1C],	 0x0
	rdhpr	%hsys_tick_cmpr,	%l1
	ldsh	[%l7 + 0x6A],	%g4
	st	%f16,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i2
	ldxa	[%g0 + %i2] 0x20,	%l6
	swap	[%l7 + 0x70],	%g5
	std	%f14,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x30] %asi
	sth	%o4,	[%l7 + 0x4C]
	ldd	[%l7 + 0x40],	%f2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%o6,	[%g0 + 0x30] %asi
	stw	%i6,	[%l7 + 0x60]
	lduw	[%l7 + 0x14],	%i1
	st	%f17,	[%l7 + 0x24]
	stb	%g1,	[%l7 + 0x46]
	std	%l2,	[%l7 + 0x50]
	flush	%l7 + 0x68
	sth	%g2,	[%l7 + 0x36]
	lduh	[%l7 + 0x64],	%o0
	stb	%o3,	[%l7 + 0x0D]
	movne	%xcc,	%o1,	%l0
	swap	[%l7 + 0x58],	%i0
	wrpr	%i7,	0x15FD,	%pil
	std	%o6,	[%l7 + 0x78]
	ldsh	[%l7 + 0x1E],	%l3
	fands	%f9,	%f19,	%f19
	ldd	[%l7 + 0x28],	%f4
	wr	%i3,	0x1DB3,	%pic

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC95, 	%hsys_tick_cmpr
	nop
	set	0x7C, %i7
	ldsh	[%l7 + %i7],	%o5
	prefetch	[%l7 + 0x58],	 0x2
	std	%f28,	[%l7 + 0x28]
	std	%o2,	[%l7 + 0x10]
	udiv	%g7,	0x15F6,	%l4
	ldsw	[%l7 + 0x74],	%i4
	fcmpeq16	%f30,	%f20,	%l5
	fbl	%fcc3,	loop_10
	brlez	%i5,	loop_11
	brlez	%g3,	loop_12
	ldsh	[%l7 + 0x52],	%g4
loop_10:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	nop
	wr	%g0,	0x20,	%asi
	stxa	%l6,	[%g0 + 0x0] %asi
loop_11:
	prefetch	[%l7 + 0x0C],	 0x1
loop_12:
	tvs	%xcc,	0x1
	wr	%g5,	0x1088,	%set_softint
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x8] %asi
	lduw	[%l7 + 0x44],	%o4
	sll	%g6,	%o6,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCAC, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x3C],	%i1
	lduh	[%l7 + 0x2E],	%g2
	stw	%o3,	[%l7 + 0x4C]
	movg	%icc,	%o1,	%l0
	stb	%i0,	[%l7 + 0x1B]
	flush	%l7 + 0x5C
	fmovsneg	%icc,	%f5,	%f31
	nop
	set	0x70, %o5
	std	%f26,	[%l7 + %o5]
	bn,a	%xcc,	loop_13
	lduw	[%l7 + 0x64],	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o7
	stxa	%o7,	[%g0 + %o7] 0x4f
loop_13:
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f20
	sth	%l3,	[%l7 + 0x34]
	edge16ln	%o0,	%i2,	%o5
	sth	%i3,	[%l7 + 0x66]
	nop
	set	0x5A, %i4
	ldsh	[%l7 + %i4],	%o2
	std	%g6,	[%l7 + 0x28]
	ldsw	[%l7 + 0x38],	%l4
	tge	%icc,	0x0
	stx	%i4,	[%l7 + 0x40]
	lduh	[%l7 + 0x4C],	%l5
	andcc	%g3,	0x1EE0,	%g4
	stx	%l6,	[%l7 + 0x08]
	nop
	set	0x3E, %o0
	ldsh	[%l7 + %o0],	%i5
	stb	%g5,	[%l7 + 0x73]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x0C],	%o4
	fbo,a	%fcc1,	loop_14
	ldstub	[%l7 + 0x7B],	%l1
	lduw	[%l7 + 0x70],	%g6
	ldd	[%l7 + 0x38],	%o6
loop_14:
	ldd	[%l7 + 0x30],	%f0
	ldsb	[%l7 + 0x32],	%g1
	std	%l2,	[%l7 + 0x48]
	membar	0x46
	std	%f2,	[%l7 + 0x70]
	lduw	[%l7 + 0x40],	%i1
	ldx	[%l7 + 0x78],	%i6
	xnorcc	%o3,	%g2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%o0,	[%l7 + 0x20]
	ldsw	[%l7 + 0x10],	%i0
	bpos	loop_15
	nop
	set	0x4C, %l4
	ldsw	[%l7 + %l4],	%o7
	swap	[%l7 + 0x0C],	%l3
	flush	%l7 + 0x50
loop_15:
	stx	%i7,	[%l7 + 0x60]
	ld	[%l7 + 0x70],	%f20
	lduw	[%l7 + 0x60],	%o0
	std	%i2,	[%l7 + 0x40]
	udivx	%i3,	0x1461,	%o2
	ldsh	[%l7 + 0x7A],	%o5
	ldsb	[%l7 + 0x3C],	%l4
	alignaddrl	%i4,	%l5,	%g7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%g4,	[%g0 + 0x18] %asi
	stx	%g3,	[%l7 + 0x38]
	ldd	[%l7 + 0x38],	%i4
	xor	%l6,	%o4,	%g5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x18] %asi
	nop
	set	0x30, %g5
	stx	%g6,	[%l7 + %g5]
	ldstub	[%l7 + 0x7C],	%g1
	fmovdne	%icc,	%f29,	%f2
	ld	[%l7 + 0x78],	%f6
	swap	[%l7 + 0x48],	%o6
	swap	[%l7 + 0x3C],	%i1
	stw	%l2,	[%l7 + 0x10]
	std	%i6,	[%l7 + 0x08]
	stw	%g2,	[%l7 + 0x5C]
	stb	%o3,	[%l7 + 0x33]
	ldsh	[%l7 + 0x3C],	%o1
	ldsw	[%l7 + 0x38],	%l0
	movvc	%icc,	%o7,	%l3
	ldstub	[%l7 + 0x75],	%i7
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%o0
	stw	%i0,	[%l7 + 0x44]
	brgez	%i2,	loop_16
	ldsh	[%l7 + 0x64],	%i3
	sth	%o5,	[%l7 + 0x7A]
	stb	%o2,	[%l7 + 0x4E]
loop_16:
	stbar
	for	%f14,	%f28,	%f14
	ldd	[%l7 + 0x30],	%f20
	prefetch	[%l7 + 0x20],	 0x2
	stx	%l4,	[%l7 + 0x50]
	ldsw	[%l7 + 0x50],	%i4
	ldsh	[%l7 + 0x1E],	%l5
	ldsb	[%l7 + 0x46],	%g7
	movn	%xcc,	%g4,	%i5
	stb	%l6,	[%l7 + 0x1F]
	stbar
	xnorcc	%o4,	0x1EC5,	%g5
	ldsb	[%l7 + 0x45],	%l1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %l5
	stxa	%g3,	[%g0 + %l5] 0x20
	tsubcctv	%g1,	%o6,	%g6
	edge16l	%l2,	%i6,	%i1
	bneg	loop_17
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%o2
	stbar
	ldsb	[%l7 + 0x64],	%o1
loop_17:
	ld	[%l7 + 0x60],	%f24
	stw	%g2,	[%l7 + 0x48]
	std	%o6,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%l0,	[%g0 + 0x18] %asi
	stx	%l3,	[%l7 + 0x28]
	swap	[%l7 + 0x70],	%i7
	flush	%l7 + 0x44
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%i0,	[%g0 + 0x20] %asi
	udivcc	%i2,	0x0A0F,	%o0
	stw	%i3,	[%l7 + 0x44]
	popc	0x1353,	%o5
	fmovrdne	%l4,	%f10,	%f0
	prefetch	[%l7 + 0x58],	 0x1
	ldub	[%l7 + 0x50],	%i4
	wr	%o2,	%l5,	%pcr
	ldub	[%l7 + 0x4C],	%g4
	sll	%i5,	0x0A,	%g7
	ldsh	[%l7 + 0x24],	%o4
	prefetch	[%l7 + 0x10],	 0x3
	edge16n	%g5,	%l1,	%g3
	swap	[%l7 + 0x54],	%g1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l6
	nop
	set	0x08, %o2
	stx	%o6,	[%l7 + %o2]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %i0
	ldxa	[%g0 + %i0] 0x20,	%g6
	fblg	%fcc3,	loop_18
	ldsb	[%l7 + 0x34],	%l2
	prefetch	[%l7 + 0x48],	 0x2
	ldsb	[%l7 + 0x47],	%i1
loop_18:
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%o2
	prefetch	[%l7 + 0x7C],	 0x2
	fpsub32s	%f2,	%f7,	%f1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g3
	stxa	%o1,	[%g0 + %g3] 0x20
	fmovsvc	%icc,	%f18,	%f17
	stw	%g2,	[%l7 + 0x20]
	move	%xcc,	%i6,	%l0
	ldsb	[%l7 + 0x29],	%o7
	ldd	[%l7 + 0x48],	%f24
	ldsb	[%l7 + 0x1A],	%i7
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%l3
	ldstub	[%l7 + 0x78],	%i2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o4
	ldxa	[%g0 + %o4] 0x20,	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i3
	ble,pn	%xcc,	loop_19
	ldstub	[%l7 + 0x72],	%i0
	ldub	[%l7 + 0x75],	%o5
	taddcctv	%l4,	0x0C34,	%o2
loop_19:
	nop
	setx	loop_20,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%i4,	%g4
	stbar
	ld	[%l7 + 0x1C],	%f21
loop_20:
	swap	[%l7 + 0x6C],	%i5
	ldstub	[%l7 + 0x51],	%l5
	nop
	set	0x20, %g6
	std	%o4,	[%l7 + %g6]
	fmovdvs	%icc,	%f24,	%f26
	ldsb	[%l7 + 0x44],	%g5
	ldd	[%l7 + 0x20],	%l0
	array16	%g3,	%g1,	%g7
	ldsw	[%l7 + 0x7C],	%l6
	rd	%fprs,	%g6
	st	%f30,	[%l7 + 0x3C]
	stx	%o6,	[%l7 + 0x58]
	swap	[%l7 + 0x78],	%l2
	lduh	[%l7 + 0x5C],	%o3
	ldstub	[%l7 + 0x29],	%i1
	swap	[%l7 + 0x64],	%g2
	st	%f5,	[%l7 + 0x0C]
	flush	%l7 + 0x10
	orn	%i6,	0x0623,	%l0
	stb	%o1,	[%l7 + 0x1E]
	std	%f20,	[%l7 + 0x70]
	orcc	%o7,	%i7,	%i2
	fbue,a	%fcc0,	loop_21
	sub	%o0,	%i3,	%l3
	flush	%l7 + 0x30
	fmul8x16al	%f21,	%f30,	%f6
loop_21:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	nop
	set	0x30, %g7
	ldxa	[%g0 + %g7] 0x4f,	%o5
	fxnor	%f14,	%f4,	%f0
	edge32l	%i0,	%l4,	%i4
	ldsh	[%l7 + 0x20],	%g4
	ldx	[%l7 + 0x38],	%i5
	sllx	%o2,	%l5,	%g5
	sir	0x1BA5
	stb	%l1,	[%l7 + 0x0B]
	ldsw	[%l7 + 0x74],	%g3
	sll	%o4,	%g1,	%l6
	std	%f20,	[%l7 + 0x08]
	prefetch	[%l7 + 0x60],	 0x2
	ld	[%l7 + 0x1C],	%f1
	edge8ln	%g7,	%o6,	%g6
	ldd	[%l7 + 0x78],	%l2
	lduw	[%l7 + 0x7C],	%i1
	be,pt	%icc,	loop_22
	stw	%o3,	[%l7 + 0x70]
	ldsw	[%l7 + 0x48],	%i6
	fmovsgu	%icc,	%f6,	%f23
loop_22:
	sth	%l0,	[%l7 + 0x22]
	std	%f6,	[%l7 + 0x48]
	ldd	[%l7 + 0x18],	%o0
	ldub	[%l7 + 0x2A],	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x162, 	%hsys_tick_cmpr
	stw	%g2,	[%l7 + 0x30]
	rd	%tick_cmpr,	%i3
	std	%l2,	[%l7 + 0x18]
	ldd	[%l7 + 0x38],	%o4
	stb	%i0,	[%l7 + 0x6D]
	sth	%l4,	[%l7 + 0x24]
	stbar
	subccc	%i4,	%g4,	%i5
	std	%o0,	[%l7 + 0x18]
	nop
	set	0x3C, %l1
	prefetch	[%l7 + %l1],	 0x2
	nop
	setx loop_23, %l0, %l1
	jmpl %l1, %l5
	ldstub	[%l7 + 0x27],	%g5
	rd	%y,	%o2
	flush	%l7 + 0x18
loop_23:
	nop
	set	0x28, %l2
	lduw	[%l7 + %l2],	%g3
	std	%f24,	[%l7 + 0x50]
	stx	%l1,	[%l7 + 0x78]
	ld	[%l7 + 0x0C],	%f27
	flush	%l7 + 0x7C
	st	%f21,	[%l7 + 0x50]
	swap	[%l7 + 0x58],	%o4
	std	%f28,	[%l7 + 0x30]
	movgu	%xcc,	%l6,	%g1
	bvs,pt	%icc,	loop_24
	ldsh	[%l7 + 0x44],	%o6
	nop
	set	0x4D, %l0
	ldstub	[%l7 + %l0],	%g6
	edge16ln	%g7,	%l2,	%i1
loop_24:
	lduh	[%l7 + 0x0A],	%o3
	ldub	[%l7 + 0x0D],	%i6
	edge8ln	%l0,	%o1,	%o7
	sth	%i7,	[%l7 + 0x42]
	swap	[%l7 + 0x14],	%g2
	stx	%i2,	[%l7 + 0x20]
	brnz,a	%i3,	loop_25
	sth	%l3,	[%l7 + 0x0A]
	std	%o4,	[%l7 + 0x60]
	sth	%l4,	[%l7 + 0x1E]
loop_25:
	stbar
	prefetch	[%l7 + 0x2C],	 0x3
	ldx	[%l7 + 0x38],	%i0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %o1
	ldxa	[%g0 + %o1] 0x20,	%i4
	ld	[%l7 + 0x78],	%f20
	ldsh	[%l7 + 0x18],	%i5
	fbuge,a	%fcc2,	loop_26
	edge16	%g4,	%o0,	%l5
	lduh	[%l7 + 0x0C],	%g5
	std	%o2,	[%l7 + 0x28]
loop_26:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	nop
	set	0x20, %i1
	stxa	%g3,	[%g0 + %i1] 0x4f
	fblg,a	%fcc1,	loop_27
	ldsw	[%l7 + 0x38],	%o4
	ldd	[%l7 + 0x48],	%i6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x28] %asi
loop_27:
	flush	%l7 + 0x6C
	stx	%g1,	[%l7 + 0x30]
	bgu,a,pn	%xcc,	loop_28
	lduw	[%l7 + 0x38],	%o6
	lduh	[%l7 + 0x24],	%g6
	fpadd32s	%f30,	%f26,	%f21
loop_28:
	ldstub	[%l7 + 0x3F],	%l2
	subccc	%g7,	0x0509,	%o3
	swap	[%l7 + 0x44],	%i6
	sll	%l0,	%i1,	%o1
	mulx	%i7,	%g2,	%i2
	movrlez	%i3,	%l3,	%o7
	lduh	[%l7 + 0x30],	%l4
	stb	%o5,	[%l7 + 0x10]
	lduw	[%l7 + 0x2C],	%i4
	fbn,a	%fcc3,	loop_29
	flush	%l7 + 0x14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x70],	%i5
loop_29:
	andcc	%g4,	%o0,	%i0
	lduw	[%l7 + 0x10],	%g5
	sth	%l5,	[%l7 + 0x62]
	nop
	set	0x44, %l3
	sth	%o2,	[%l7 + %l3]
	srl	%g3,	%o4,	%l6
	ldsb	[%l7 + 0x68],	%l1
	ldsb	[%l7 + 0x0A],	%g1
	ldsw	[%l7 + 0x5C],	%g6
	ldsb	[%l7 + 0x2C],	%o6
	prefetch	[%l7 + 0x1C],	 0x0
	st	%f27,	[%l7 + 0x38]
	stb	%g7,	[%l7 + 0x2E]
	stbar
	nop
	set	0x1A, %o3
	ldsb	[%l7 + %o3],	%o3
	sdiv	%i6,	0x1CF3,	%l2
	ldub	[%l7 + 0x76],	%l0
	std	%f28,	[%l7 + 0x60]
	st	%f29,	[%l7 + 0x38]
	ldx	[%l7 + 0x48],	%i1
	sth	%i7,	[%l7 + 0x4C]
	subc	%o1,	%g2,	%i2
	ldsh	[%l7 + 0x58],	%i3
	ldd	[%l7 + 0x50],	%f16
	ldsh	[%l7 + 0x2A],	%o7
	ldd	[%l7 + 0x08],	%f0
	fmovda	%xcc,	%f15,	%f11
	fmovsgu	%icc,	%f7,	%f2
	fbl,a	%fcc0,	loop_30
	std	%f30,	[%l7 + 0x70]
	ldsb	[%l7 + 0x5E],	%l3
	stx	%l4,	[%l7 + 0x50]
loop_30:
	stbar
	array16	%o5,	%i5,	%i4
	ldsb	[%l7 + 0x34],	%g4
	fbu	%fcc2,	loop_31
	movge	%icc,	%o0,	%g5
	ldsh	[%l7 + 0x0A],	%l5
	lduh	[%l7 + 0x74],	%o2
loop_31:
	ldsw	[%l7 + 0x30],	%i0
	ldsw	[%l7 + 0x70],	%o4
	sth	%l6,	[%l7 + 0x32]
	ldd	[%l7 + 0x70],	%f10
	stw	%g3,	[%l7 + 0x6C]
	sdivcc	%g1,	0x0F40,	%l1
	prefetch	[%l7 + 0x74],	 0x1
	stx	%o6,	[%l7 + 0x10]
	fbuge	%fcc0,	loop_32
	move	%icc,	%g6,	%g7
	std	%f0,	[%l7 + 0x50]
	stbar
loop_32:
	edge8n	%i6,	%o3,	%l0
	addccc	%i1,	%l2,	%i7
	ldsh	[%l7 + 0x64],	%o1
	stw	%i2,	[%l7 + 0x40]
	ldd	[%l7 + 0x70],	%f10
	ldsw	[%l7 + 0x20],	%i3
	stw	%g2,	[%l7 + 0x78]
	ld	[%l7 + 0x30],	%f8
	stx	%l3,	[%l7 + 0x70]
	fabsd	%f10,	%f22
	std	%o6,	[%l7 + 0x58]
	nop
	set	0x10, %i5
	stx	%l4,	[%l7 + %i5]
	ldd	[%l7 + 0x08],	%i4
	sth	%o5,	[%l7 + 0x52]
	ld	[%l7 + 0x48],	%f23
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i4
	ldsb	[%l7 + 0x7E],	%o0
	lduh	[%l7 + 0x0E],	%g5
	flush	%l7 + 0x7C
	stx	%g4,	[%l7 + 0x48]
	lduw	[%l7 + 0x54],	%l5
	stbar
	stx	%i0,	[%l7 + 0x10]
	stx	%o4,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %i6
	stxa	%o2,	[%g0 + %i6] 0x4f
	brlz,a	%g3,	loop_33
	subc	%l6,	%g1,	%o6
	st	%f10,	[%l7 + 0x0C]
	fbuge	%fcc1,	loop_34
loop_33:
	stx	%g6,	[%l7 + 0x48]
	st	%f29,	[%l7 + 0x58]
	fbo	%fcc2,	loop_35
loop_34:
	stw	%l1,	[%l7 + 0x28]
	st	%f8,	[%l7 + 0x30]
	stbar
loop_35:
	stx	%g7,	[%l7 + 0x28]
	prefetch	[%l7 + 0x6C],	 0x1
	ldd	[%l7 + 0x18],	%f24
	stb	%i6,	[%l7 + 0x61]
	fcmpne16	%f26,	%f14,	%l0
	fmovrdne	%o3,	%f26,	%f18
	ldsh	[%l7 + 0x76],	%l2
	stw	%i1,	[%l7 + 0x38]
	ldsw	[%l7 + 0x58],	%o1
	st	%f5,	[%l7 + 0x1C]
	subccc	%i2,	%i7,	%g2
	ldd	[%l7 + 0x10],	%f30
	orcc	%l3,	%i3,	%o7
	ld	[%l7 + 0x20],	%f13
	lduh	[%l7 + 0x5E],	%i5
	edge16n	%o5,	%l4,	%o0
	stw	%i4,	[%l7 + 0x40]
	rd	%asi,	%g5
	fcmpgt32	%f18,	%f22,	%g4
	fands	%f15,	%f18,	%f24
	ldx	[%l7 + 0x28],	%i0
	stw	%l5,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o4
	stw	%o2,	[%l7 + 0x3C]
	stb	%l6,	[%l7 + 0x42]
	std	%f26,	[%l7 + 0x38]
	stx	%g3,	[%l7 + 0x38]
	lduw	[%l7 + 0x08],	%g1
	move	%icc,	%o6,	%l1
	ldstub	[%l7 + 0x3E],	%g7
	wr	%i6,	%g6,	%softint
	std	%l0,	[%l7 + 0x58]
	swap	[%l7 + 0x14],	%l2
	movgu	%xcc,	%o3,	%i1
	stbar
	ldx	[%l7 + 0x28],	%i2
	prefetch	[%l7 + 0x7C],	 0x3
	lduw	[%l7 + 0x34],	%o1
	ld	[%l7 + 0x48],	%f7
	stbar
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%g2
	ldsw	[%l7 + 0x6C],	%l3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %i7
	ldxa	[%g0 + %i7] 0x4f,	%i7
	std	%f20,	[%l7 + 0x18]
	stbar
	ldsw	[%l7 + 0x5C],	%i3
	std	%f30,	[%l7 + 0x30]
	swap	[%l7 + 0x34],	%i5
	ldub	[%l7 + 0x14],	%o7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %i2
	ldxa	[%g0 + %i2] 0x20,	%l4
	fandnot2	%f28,	%f12,	%f24
	addcc	%o5,	0x0DB0,	%i4
	stw	%g5,	[%l7 + 0x38]
	rd	%y,	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%i0,	[%g0 + 0x30] %asi
	ldsw	[%l7 + 0x10],	%l5
	st	%f28,	[%l7 + 0x34]
	swap	[%l7 + 0x44],	%o4
	ldd	[%l7 + 0x10],	%o2
	ldub	[%l7 + 0x0A],	%l6
	std	%f0,	[%l7 + 0x40]
	std	%f8,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %o7
	stxa	%g4,	[%g0 + %o7] 0x20
	std	%g0,	[%l7 + 0x60]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1A],	%g3
	ldub	[%l7 + 0x20],	%l1
	ldsh	[%l7 + 0x18],	%o6
	ldd	[%l7 + 0x30],	%f10
	st	%f9,	[%l7 + 0x74]
	std	%g6,	[%l7 + 0x38]
	swap	[%l7 + 0x34],	%g6
	nop
	set	0x11, %g2
	ldub	[%l7 + %g2],	%l0
	bneg	%icc,	loop_36
	tsubcctv	%l2,	0x0D43,	%i6
	std	%f18,	[%l7 + 0x70]
	ldub	[%l7 + 0x47],	%o3
loop_36:
	ldub	[%l7 + 0x56],	%i2
	ld	[%l7 + 0x70],	%f17
	std	%o0,	[%l7 + 0x30]
	lduw	[%l7 + 0x2C],	%g2
	prefetch	[%l7 + 0x74],	 0x3
	fmovrdlz	%l3,	%f18,	%f14
	ldsb	[%l7 + 0x45],	%i1
	lduw	[%l7 + 0x0C],	%i7
	movpos	%icc,	%i5,	%i3
	ldsh	[%l7 + 0x26],	%l4
	lduh	[%l7 + 0x6E],	%o7
	fmovsvs	%icc,	%f16,	%f24
	stb	%o5,	[%l7 + 0x79]
	stx	%g5,	[%l7 + 0x50]
	ldstub	[%l7 + 0x33],	%o0
	fcmped	%fcc2,	%f6,	%f28
	stb	%i4,	[%l7 + 0x21]
	tle	%icc,	0x3
	ldd	[%l7 + 0x08],	%i0
	std	%l4,	[%l7 + 0x10]
	stb	%o2,	[%l7 + 0x16]
	ldsb	[%l7 + 0x3D],	%o4
	stx	%g4,	[%l7 + 0x68]
	ldstub	[%l7 + 0x31],	%l6
	fmuld8sux16	%f3,	%f17,	%f4
	fandnot2	%f2,	%f18,	%f2
	prefetch	[%l7 + 0x44],	 0x3
	stx	%g1,	[%l7 + 0x10]
	ldsh	[%l7 + 0x26],	%g3
	nop
	set	0x2C, %o5
	stw	%o6,	[%l7 + %o5]
	fbule,a	%fcc1,	loop_37
	lduw	[%l7 + 0x0C],	%g7
	nop
	set	0x2C, %o0
	prefetch	[%l7 + %o0],	 0x0
	flush	%l7 + 0x30
loop_37:
	alignaddrl	%l1,	%l0,	%g6
	ldsb	[%l7 + 0x16],	%l2
	ld	[%l7 + 0x78],	%f8
	st	%f24,	[%l7 + 0x58]
	umul	%i6,	0x1932,	%o3
	ldstub	[%l7 + 0x19],	%i2
	ldsb	[%l7 + 0x78],	%o1
	ldx	[%l7 + 0x50],	%l3
	ldub	[%l7 + 0x35],	%i1
	rdhpr	%hintp,	%g2
	ldub	[%l7 + 0x1A],	%i5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i3
	fmovdle	%xcc,	%f25,	%f27
	fmovda	%icc,	%f6,	%f0
	ldsw	[%l7 + 0x74],	%i7
	std	%f14,	[%l7 + 0x40]
	nop
	set	0x50, %i4
	ldx	[%l7 + %i4],	%l4
	stx	%o7,	[%l7 + 0x50]
	ldsb	[%l7 + 0x14],	%g5
	nop
	set	0x34, %g5
	lduh	[%l7 + %g5],	%o5
	ldd	[%l7 + 0x60],	%o0
	stx	%i4,	[%l7 + 0x28]
	lduw	[%l7 + 0x28],	%i0
	lduh	[%l7 + 0x2A],	%o2
	ldx	[%l7 + 0x78],	%l5
	movcs	%icc,	%o4,	%g4
	ldx	[%l7 + 0x40],	%g1
	tneg	%xcc,	0x6
	lduw	[%l7 + 0x18],	%l6
	stw	%g3,	[%l7 + 0x20]
	movrgez	%o6,	%l1,	%g7
	lduh	[%l7 + 0x3A],	%l0
	std	%g6,	[%l7 + 0x20]
	stw	%l2,	[%l7 + 0x08]
	ldd	[%l7 + 0x20],	%o2
	ldsw	[%l7 + 0x20],	%i6
	fabsd	%f16,	%f20
	st	%f19,	[%l7 + 0x40]
	ldsw	[%l7 + 0x24],	%i2
	fcmps	%fcc2,	%f30,	%f11
	ldub	[%l7 + 0x14],	%o1
	ldub	[%l7 + 0x51],	%l3
	swap	[%l7 + 0x54],	%i1
	movrlz	%i5,	0x3F9,	%i3
	stbar
	faligndata	%f2,	%f2,	%f12
	srax	%g2,	%l4,	%i7
	ldstub	[%l7 + 0x3B],	%o7
	std	%f20,	[%l7 + 0x58]
	st	%f7,	[%l7 + 0x2C]
	srax	%g5,	%o5,	%o0
	rdhpr	%hpstate,	%i0
	ld	[%l7 + 0x60],	%f14
	ldx	[%l7 + 0x38],	%i4
	mulscc	%l5,	0x19B1,	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%g4,	[%g0 + 0x18] %asi
	stw	%o4,	[%l7 + 0x54]
	ldd	[%l7 + 0x78],	%f6
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%g0
	nop
	set	0x0C, %l5
	stw	%l6,	[%l7 + %l5]
	stx	%g3,	[%l7 + 0x60]
	ldsb	[%l7 + 0x5D],	%o6
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%l1
	ldsh	[%l7 + 0x4A],	%g7
	nop
	set	0x10, %o2
	stx	%g6,	[%l7 + %o2]
	alignaddr	%l0,	%o3,	%l2
	ldub	[%l7 + 0x5E],	%i2
	ldub	[%l7 + 0x29],	%o1
	ld	[%l7 + 0x6C],	%f15
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%i6,	[%g0 + 0x38] %asi
	sra	%l3,	%i1,	%i5
	lduw	[%l7 + 0x28],	%i3
	prefetch	[%l7 + 0x30],	 0x2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %i0
	ldxa	[%g0 + %i0] 0x4f,	%l4
	flush	%l7 + 0x78
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	tge	%xcc,	0x0
	swap	[%l7 + 0x60],	%i7
	stx	%o7,	[%l7 + 0x08]
	ldd	[%l7 + 0x38],	%g2
	flush	%l7 + 0x68
	lduw	[%l7 + 0x14],	%o5
	brgz	%o0,	loop_38
	fbne,a	%fcc1,	loop_39
	sth	%g5,	[%l7 + 0x20]
	stbar
loop_38:
	std	%f18,	[%l7 + 0x20]
loop_39:
	lduh	[%l7 + 0x12],	%i4
	edge8l	%i0,	%o2,	%g4
	ld	[%l7 + 0x30],	%f17
	swap	[%l7 + 0x14],	%l5
	stb	%g1,	[%l7 + 0x64]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g3
	fmovdneg	%icc,	%f0,	%f20
	st	%f8,	[%l7 + 0x0C]
	st	%f23,	[%l7 + 0x74]
	array16	%o4,	%l1,	%o6
	lduh	[%l7 + 0x72],	%g6
	ldd	[%l7 + 0x70],	%f0
	prefetch	[%l7 + 0x24],	 0x3
	ldx	[%l7 + 0x60],	%l0
	ld	[%l7 + 0x34],	%f16
	ldsw	[%l7 + 0x58],	%g7
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%o2
	ldsb	[%l7 + 0x72],	%l2
	swap	[%l7 + 0x5C],	%o1
	stx	%i6,	[%l7 + 0x18]
	or	%i2,	0x0125,	%i1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%l3,	[%g0 + 0x38] %asi
	flush	%l7 + 0x18
	ldsb	[%l7 + 0x39],	%i3
	stx	%i5,	[%l7 + 0x28]
	sll	%i7,	%o7,	%g2
	movre	%o5,	%l4,	%o0
	xorcc	%i4,	%g5,	%i0
	sra	%g4,	%l5,	%o2
	stb	%l6,	[%l7 + 0x2A]
	tvs	%xcc,	0x1
	ldsb	[%l7 + 0x3A],	%g3
	fblg	%fcc2,	loop_40
	stb	%g1,	[%l7 + 0x6B]
	ldsw	[%l7 + 0x6C],	%l1
	lduw	[%l7 + 0x78],	%o6
loop_40:
	tgu	%xcc,	0x0
	edge32ln	%o4,	%l0,	%g6
	lduh	[%l7 + 0x0E],	%g7
	ldd	[%l7 + 0x50],	%l2
	fcmpgt16	%f22,	%f14,	%o1
	movl	%xcc,	%i6,	%o3
	ta	%xcc,	0x5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %l6
	stxa	%i1,	[%g0 + %l6] 0x20
	ldstub	[%l7 + 0x1D],	%l3
	ldd	[%l7 + 0x18],	%f20
	std	%f16,	[%l7 + 0x70]
	sth	%i2,	[%l7 + 0x36]
	std	%f18,	[%l7 + 0x30]
	ldd	[%l7 + 0x60],	%i4
	ldd	[%l7 + 0x78],	%i2
	ldd	[%l7 + 0x70],	%o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 706
!	Type a   	: 26
!	Type x   	: 47
!	Type cti   	: 40
!	Type f   	: 49
!	Type i   	: 132
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x29489056
.word 0x45300202
.word 0x6DCF9511
.word 0x1DEE34D1
.word 0x319A0C39
.word 0x3B22B48D
.word 0x59D84C54
.word 0xDF494132
.word 0xCD266FCF
.word 0xA286B862
.word 0x4AE6B128
.word 0x55BDC868
.word 0x74496E2A
.word 0xC0B0267E
.word 0x831411D9
.word 0x37BE7155
.word 0x5E8BF58B
.word 0xA5923077
.word 0x9178E87A
.word 0xC4128464
.word 0xEF8CB7DE
.word 0x05230D30
.word 0x8B473E17
.word 0x89A6331F
.word 0x9715B334
.word 0xAED4497F
.word 0xFA709A88
.word 0x89369E29
.word 0x058127AD
.word 0x6C323717
.word 0x40DB326D
.word 0x92D05739
.word 0x2F115F99
.word 0x6B42603B
.word 0x2DDFCFD4
.word 0x9A7790AA
.word 0x42601459
.word 0xF21B38DA
.word 0x73268621
.word 0xCC7E4D58
.word 0x2F07E73F
.word 0x2707A6E5
.word 0x4A129405
.word 0xE14061DB
.word 0x3C9D91F3
.word 0x007B88AB
.word 0xB6157C1B
.word 0x33421F7A
.word 0x379A26A9
.word 0x81F6F051
.word 0x5EFCF921
.word 0x79003440
.word 0xF3395CFA
.word 0xE26C6D4C
.word 0x7A7B4B67
.word 0x7641438A
.word 0xFDFEB72E
.word 0xFF8C3606
.word 0xDA35C62B
.word 0x26DC8AF6
.word 0xF447DA74
.word 0x09F85458
.word 0x25D370E6
.word 0x9FE09B59
.end
